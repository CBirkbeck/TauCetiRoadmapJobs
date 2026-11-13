module

import Mathlib
import TauCeti.GroupTheory.TitsSystem.Parabolic.Basic
import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Diagonal.TitsSystem

/-!
# Pro-étale cohomology of p-adic curves, Drinfeld half-spaces and the rank-two Drinfeld tower: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions their statements need.

Stated here, for the generalized Steinberg representations `Sp_J(A)` of `GL_{d+1}(K)`, `K/ℚ_p`
finite:

* their irreducibility over a coefficient field `A` of characteristic `0` or `p` (README §0.4(a));
* their pairwise non-isomorphism over such a field (README §0.4(a));
* the Schneider–Stuhler and Iovita–Spiess presentation of `Sp_r(ℤ)` as the locally constant
  `ℤ`-valued functions on `(r + 1)`-tuples of `K`-rational hyperplanes of `K^{d+1}` that satisfy
  the cocycle identity and vanish on tuples with linearly dependent equations (README §0.5).

The representations are the quotients of the locally constant functions on `GL_{d+1}(K)/P_J` by
the functions pulled back from the larger flag varieties (README §0.3). The standard parabolic
subgroups `P_J = B W_J B` are Tau Ceti's `TauCeti.TitsSystem.standardParabolic` of the standard
Tits system `TauCeti.glTitsSystem` of `GL_{d+1}(K)` (upper triangular `B`, simple reflections
the adjacent transpositions), indexed by sets `J` of its simple reflections; this file defines the
translation representation, the relation submodule and the quotient representation, the index
set of `Sp_r`, the action of `GL_{d+1}(K)` on functions of hyperplane tuples and the cocycle
submodule. These are the coefficients of every cohomology computation of the Drinfeld
half-spaces in Layer 6.

Not statable at the pins, by headline theorem and missing carrier:

* the multiplicity-one part of README §0.4(a), that the `Sp_J(A)` are the irreducible
  constituents of `LC(G/B, A)` each with multiplicity one: the pins have no composition
  multiplicities of representations (Jordan–Hölder factors counted up to isomorphism);
* the fundamental diagrams of affinoid, proper, overconvergent and Stein curves (README §§3.5,
  4.1, 4.2, 4.7), the Kummer regulator `Symb_ℓ(Y) ≅ H¹_ét(Y, ℤ_ℓ(1))` (§2.4), the ℓ-adic,
  de Rham and Hyodo–Kato filtrations and the Weil–Deligne similarity (§§2.5, 3.2, 4.3, 4.6):
  Tau Ceti has the category `TauCeti.AdicSpace` of adic spaces, but neither library has the
  étale or pro-étale site or cohomology of an adic space, the de Rham cohomology of a rigid
  curve, Hyodo–Kato cohomology, or `B_cris^+` and `B_st^+` (Mathlib has `BDeRhamPlus` only);
* the period isomorphism `Ĵ ≅ X^1_st(H¹_HK(X))` and its integration form (§§4.8–4.9): Jacobians
  of curves and universal vector extensions are missing;
* the `G_K`-equivariant fundamental diagram of a semistable Stein weak formal scheme (§5.5):
  weak formal schemes, dagger spaces and syntomic cohomology are missing (Tau Ceti has dagger
  algebras only);
* the cohomology of the Drinfeld half-space `Ω^d` as duals of generalized Steinberg
  representations in every coefficient theory, integral `p`-adic étale cohomology and Dat's
  compactly supported ℓ-adic complex (§§6.2, 6.4, 6.5, 6.9, 6.10): the rigid space `Ω^d` and its
  cohomology are missing;
* the connected components of the Lubin–Tate and Drinfeld towers, the equivariant semistable
  models of the rank-two Drinfeld levels, the Hyodo–Kato and de Rham multiplicities, the
  multiplicity diagram, the finite copresentation of mod `p^k` cohomology and the
  non-admissibility for `F ≠ ℚ_p` (§§7.1, 7.2, 7.4, 7.5, 7.7, 7.8): Lubin–Tate and Drinfeld
  spaces, their cohomology and the Jacquet–Langlands and Langlands correspondences are missing.
-/

namespace TauCetiRoadmap.ProetaleCohomologyOfPAdicCurvesAndTowers

open TauCeti
open scoped LinearAlgebra.Projectivization

/-! ## Layer 0: Graphs with legs and generalized Steinberg representations -/

/-- The left translation representation of a topological group `G` on the `A`-valued locally
constant functions on `G ⧸ H`: `(g · f)(x) = f(g⁻¹ x)` (README §0.3). -/
noncomputable def translation (G : Type*) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (H : Subgroup G) (A : Type*) [CommRing A] :
    Representation A G (LocallyConstant (G ⧸ H) A) where
  toFun g := LocallyConstant.comapₗ A ⟨fun x => g⁻¹ • x, continuous_const_smul _⟩
  map_one' := by
    ext f x
    simp
  map_mul' g g' := by
    ext f x
    simp [mul_smul]

/-- The relation submodule of `LC(G/P_J, A)`, `G = GL_{d+1}(K)` and `P_J` the standard parabolic
of the standard Tits system of `G` attached to a set `J` of simple reflections: the sum, over the
simple reflections `s ∉ J`, of the functions pulled back along `G/P_J → G/P_{J ∪ {s}}`
(CDN-STEIN §5.2.1, README §0.3). -/
noncomputable def steinbergRelations (K : Type*) [Field K] [Nontrivial Kˣ] [TopologicalSpace K]
    [IsTopologicalRing K] (A : Type*) [CommRing A] (d : ℕ) (J : Set (glTitsSystem K d).simple) :
    Submodule A
      (LocallyConstant (GL (Fin (d + 1)) K ⧸ (glTitsSystem K d).standardParabolic J) A) :=
  ⨆ (s : (glTitsSystem K d).simple) (_ : s ∉ J), LinearMap.range (LocallyConstant.comapₗ A
    ⟨Subgroup.quotientMapOfLE
        ((glTitsSystem K d).standardParabolic_monotone (Set.subset_insert s J)),
      (QuotientGroup.isQuotientMap_mk _).continuous_iff.2 QuotientGroup.continuous_mk⟩)

/-- The relation submodule `Σ_{s ∉ J} LC(G/P_{J ∪ {s}}, A)` of `LC(G/P_J, A)` is stable under the
translation action of every `g ∈ GL_{d+1}(K)`: translating a function pulled back from
`G/P_{J ∪ {s}}` gives the pullback of its translate, the projection being `G`-equivariant. This is
the invariance needed to form the quotient representation `generalizedSteinberg` (README §0.3). -/
theorem steinbergRelations_le_comap (K : Type*) [Field K] [Nontrivial Kˣ] [TopologicalSpace K]
    [IsTopologicalRing K] (A : Type*) [CommRing A] (d : ℕ) (J : Set (glTitsSystem K d).simple)
    (g : GL (Fin (d + 1)) K) :
    steinbergRelations K A d J ≤ (steinbergRelations K A d J).comap
      (translation (GL (Fin (d + 1)) K) ((glTitsSystem K d).standardParabolic J) A g) := by
  refine iSup₂_le fun s hs => ?_
  rintro _ ⟨f, rfl⟩
  refine Submodule.mem_comap.2 (Submodule.mem_iSup_of_mem s (Submodule.mem_iSup_of_mem hs
    ⟨translation (GL (Fin (d + 1)) K) ((glTitsSystem K d).standardParabolic (insert s J)) A g f,
      ?_⟩))
  ext x
  induction x using QuotientGroup.induction_on
  simp [translation, Subgroup.quotientMapOfLE_apply_mk, MulAction.Quotient.smul_mk]

/-- The generalized Steinberg representation `Sp_J(A) = LC(G/P_J, A) / Σ_{s ∉ J} LC(G/P_{J∪{s}}, A)`
of `G = GL_{d+1}(K)` with coefficients in `A`, `G` acting by left translation, `P_J` the standard
parabolic subgroup of the standard Tits system of `G` attached to the set `J` of simple
reflections (CDN-STEIN §5.2.1, README §0.3). For `J = ∅` it is the Steinberg representation, for
`J` all simple reflections it is `A` with the trivial action. -/
noncomputable def generalizedSteinberg (K : Type*) [Field K] [Nontrivial Kˣ] [TopologicalSpace K]
    [IsTopologicalRing K] (A : Type*) [CommRing A] (d : ℕ) (J : Set (glTitsSystem K d).simple) :
    Representation A (GL (Fin (d + 1)) K)
      (LocallyConstant (GL (Fin (d + 1)) K ⧸ (glTitsSystem K d).standardParabolic J) A ⧸
        steinbergRelations K A d J) :=
  (translation (GL (Fin (d + 1)) K) ((glTitsSystem K d).standardParabolic J) A).quotient
    (steinbergRelations K A d J) (steinbergRelations_le_comap K A d J)

/-- **Irreducibility of the generalized Steinberg representations** (README §0.4(a);
CDN-STEIN Proposition 5.1, after Casselman in characteristic `0`, Borel–Wallach, Chapter X,
Theorem 4.11, extended from `ℂ` to every field of characteristic `0` by base change of the
Hecke modules of invariants, and Grosse-Klönne, GK14 Corollaries 4.3–4.4, in characteristic `p`).
Let `K` be a finite extension of `ℚ_p` with its absolute value and `A` a field of characteristic
`0` or `p`. Then for every `d` and every set `J` of simple reflections of the standard Tits
system of `GL_{d+1}(K)`, `Sp_J(A)` is an irreducible representation of `GL_{d+1}(K)`. The
instance `Nontrivial Kˣ`, which the Tits system requires, holds for every such `K`: it has
characteristic `0`, so `-1 ≠ 1`. -/
theorem generalizedSteinberg_isIrreducible (p : ℕ) [Fact p.Prime] (K : Type*)
    [NontriviallyNormedField K] [NormedAlgebra ℚ_[p] K] [FiniteDimensional ℚ_[p] K]
    [Nontrivial Kˣ] (A : Type*) [Field A] (hA : CharZero A ∨ CharP A p) (d : ℕ)
    (J : Set (glTitsSystem K d).simple) :
    (generalizedSteinberg K A d J).IsIrreducible := by
  sorry

/-- **Pairwise non-isomorphism of the generalized Steinberg representations** (README §0.4(a);
CDN-STEIN Proposition 5.1, after Casselman in characteristic `0`, Borel–Wallach, Chapter X,
Theorem 4.11, descended from `ℂ` to every field of characteristic `0` through the Hecke modules
of invariants, and Grosse-Klönne, GK14 Corollary 4.4(a), in characteristic `p`). Let `K` be a
finite extension of `ℚ_p` with its absolute value and `A` a field of characteristic `0` or `p`.
Then `Sp_J(A)` and `Sp_{J'}(A)` are isomorphic representations of `GL_{d+1}(K)` exactly when
`J = J'`. -/
theorem generalizedSteinberg_nonempty_equiv_iff (p : ℕ) [Fact p.Prime] (K : Type*)
    [NontriviallyNormedField K] [NormedAlgebra ℚ_[p] K] [FiniteDimensional ℚ_[p] K]
    [Nontrivial Kˣ] (A : Type*) [Field A] (hA : CharZero A ∨ CharP A p) (d : ℕ)
    (J J' : Set (glTitsSystem K d).simple) :
    Nonempty ((generalizedSteinberg K A d J).Equiv (generalizedSteinberg K A d J')) ↔
      J = J' := by
  sorry

/-- The index set `{s_1, …, s_{d−r}}` of `Sp_r = Sp_{{1,…,d−r}}` (CDN-STEIN §5.2.1, README
Conventions): the simple reflections of `TauCeti.glTitsSystem K d` of index `k < d − r`, the
reflection of index `k` exchanging the basis vectors `e_k` and `e_{k+1}` of `K^{d+1}`. For
`r = 0` it is the set of all simple reflections, for `r = d` it is empty. -/
def steinbergIndex (K : Type*) [Field K] [Nontrivial Kˣ] (d r : ℕ) :
    Set (glTitsSystem K d).simple :=
  {s | ∃ k : Fin d, (k : ℕ) < d - r ∧
    (s : (glTitsSystem K d).WeylGroup) = QuotientGroup.mk (glTitsSystemSimpleRep K d k)}

/-- The left translation representation of `GL_{d+1}(K)` on the `ℤ`-valued locally constant
functions of `(r + 1)`-tuples of `K`-rational hyperplanes of `K^{d+1}`, `(g · f)(H) = f(g⁻¹ H)`
(README §0.5). A hyperplane is recorded by the class `[a] ∈ ℙ(K^{d+1})` of a nonzero equation
`a`, the hyperplane being `{x | a ⬝ᵥ x = 0}`; then `g⁻¹` sends it to the hyperplane with
equation `a ᵥ* g`, the contragredient action of `GL_{d+1}(K)` on linear forms. -/
noncomputable def hyperplaneTranslation (K : Type*) [Field K] [TopologicalSpace K]
    [IsTopologicalRing K] (d r : ℕ) :
    Representation ℤ (GL (Fin (d + 1)) K)
      (LocallyConstant (Fin (r + 1) → ℙ K (Fin (d + 1) → K)) ℤ) where
  toFun g :=
    have hg : Function.Injective (g : Matrix (Fin (d + 1)) (Fin (d + 1)) K).vecMulLinear := by
      rw [Matrix.coe_vecMulLinear]
      exact Matrix.vecMul_injective_iff_isUnit.2 g.isUnit
    LocallyConstant.comapₗ ℤ
      ⟨fun H i => (H i).map _ hg,
        continuous_pi fun i => (Projectivization.continuous_map hg
          (continuous_id.matrix_vecMul continuous_const)).comp (continuous_apply i)⟩
  map_one' := by
    refine LinearMap.ext fun f => LocallyConstant.ext fun H => ?_
    show f _ = f H
    congr 1
    funext i
    dsimp only [ContinuousMap.coe_mk]
    generalize H i = x
    induction x using Projectivization.ind with
    | h v hv => simp [Projectivization.map_mk]
  map_mul' g g' := by
    refine LinearMap.ext fun f => LocallyConstant.ext fun H => ?_
    show f _ = f _
    congr 1
    funext i
    dsimp only [ContinuousMap.coe_mk]
    generalize H i = x
    induction x using Projectivization.ind with
    | h v hv =>
      rw [Projectivization.map_mk, Projectivization.map_mk, Projectivization.map_mk]
      simp only [Matrix.vecMulLinear_apply, Units.val_mul, Matrix.vecMul_vecMul]

/-- The cocycle submodule `LC_c(𝓗^{r+1}, ℤ)` of README §0.5 (CDN-STEIN §5.4.1): the locally
constant functions `f` of `(r + 1)`-tuples of `K`-rational hyperplanes of `K^{d+1}` with
`Σ_{i=0}^{r+1} (−1)^i f(H₀, …, Ĥ_i, …, H_{r+1}) = 0` for all `H₀, …, H_{r+1}`, and with
`f(H₀, …, H_r) = 0` whenever the equations of `H₀, …, H_r` are linearly dependent. -/
noncomputable def hyperplaneCocycles (K : Type*) [Field K] [TopologicalSpace K] (d r : ℕ) :
    Submodule ℤ (LocallyConstant (Fin (r + 1) → ℙ K (Fin (d + 1) → K)) ℤ) where
  carrier := {f | (∀ H : Fin (r + 2) → ℙ K (Fin (d + 1) → K),
      ∑ i : Fin (r + 2), (-1 : ℤ) ^ (i : ℕ) * f (H ∘ i.succAbove) = 0) ∧
    ∀ H : Fin (r + 1) → ℙ K (Fin (d + 1) → K), Projectivization.Dependent H → f H = 0}
  add_mem' {f g} hf hg := ⟨fun H => by
      simp only [LocallyConstant.coe_add, Pi.add_apply, mul_add, Finset.sum_add_distrib,
        hf.1 H, hg.1 H, add_zero],
    fun H hH => by simp [hf.2 H hH, hg.2 H hH]⟩
  zero_mem' := ⟨fun H => by simp, fun H _ => rfl⟩
  smul_mem' c f hf := ⟨fun H => by
      simp only [LocallyConstant.coe_smul, Pi.smul_apply, smul_eq_mul, mul_left_comm _ c,
        ← Finset.mul_sum, hf.1 H, mul_zero],
    fun H hH => by simp [hf.2 H hH]⟩

/-- **The Schneider–Stuhler and Iovita–Spiess presentation** (README §0.5; CDN-STEIN
Proposition 5.6 and §5.4.1, after Schneider–Stuhler, SS91, and Iovita–Spiess, IS01). Let `K` be a
finite extension of `ℚ_p` with its absolute value and `0 ≤ r ≤ d`. Then
`Sp_r(ℤ) = Sp_{{1,…,d−r}}(ℤ)` is isomorphic, `GL_{d+1}(K)`-equivariantly, to the cocycle
submodule `hyperplaneCocycles K d r` with the translation action of `hyperplaneTranslation`. -/
theorem generalizedSteinberg_equiv_hyperplaneCocycles (p : ℕ) [Fact p.Prime] (K : Type*)
    [NontriviallyNormedField K] [NormedAlgebra ℚ_[p] K] [FiniteDimensional ℚ_[p] K]
    [Nontrivial Kˣ] (d r : ℕ) (hr : r ≤ d) :
    ∃ e : (LocallyConstant (GL (Fin (d + 1)) K ⧸
          (glTitsSystem K d).standardParabolic (steinbergIndex K d r)) ℤ ⧸
        steinbergRelations K ℤ d (steinbergIndex K d r)) ≃ₗ[ℤ] hyperplaneCocycles K d r,
      ∀ (g : GL (Fin (d + 1)) K) x,
        (e (generalizedSteinberg K ℤ d (steinbergIndex K d r) g x) :
            LocallyConstant (Fin (r + 1) → ℙ K (Fin (d + 1) → K)) ℤ) =
          hyperplaneTranslation K d r g (e x) := by
  sorry

end TauCetiRoadmap.ProetaleCohomologyOfPAdicCurvesAndTowers
