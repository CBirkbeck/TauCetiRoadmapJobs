import Mathlib
import TauCeti.Algebra.AlgebraicGroup.Hopf.Conjugation
import TauCeti.Algebra.AlgebraicGroup.Representation.SemisimplePoint
import TauCeti.Algebra.AlgebraicGroup.Reductive.Basic
import TauCeti.Algebra.AlgebraicGroup.FiniteType.CommHopfAlgCat
import TauCeti.Algebra.Coalgebra.Comodule.PointsAction
import TauCeti.Algebra.Coalgebra.Comodule.Finite.Basic
import TauCeti.Algebra.AlgebraicGroup.Torus.Maximal
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Conjugation
import TauCeti.Algebra.AlgebraicGroup.CommHopfAlgCat.BaseChange
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.BaseChange

/-!
# Reductive groups, part III: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib and
Tau Ceti, the headline theorems of the roadmap that are statable at the pins, each with `sorry`, and
the one definition they need: the algebra of regular class functions of a commutative Hopf algebra,
presented as an equalizer of two coordinate maps (README §0.1).

Stated here:

* the classification of geometric semisimple conjugacy classes of a connected reductive group by
  regular class functions, injectivity and surjectivity (Steinberg; README §0.4);
* the separation of semisimple classes by characters of finite-dimensional representations
  (README §0.5);
* Harder's approximation of finitely many local maximal tori by one global maximal torus
  (README §2.2).

Headline theorems that are not statable at the pins, and what each lacks:

* Group Chevalley restriction `C(G) ≅ O(T)^W` (README §0.3): the pinned Tau Ceti has the finite
  normalizer action on the character group of a diagonalizable subgroup, but no action of the Weyl
  group of a maximal torus of a reductive group on the torus coordinate ring.
* Global torus classes with prescribed real component and the global cocharacter twist (README §2.1,
  §2.5): the discrete Galois modules of points of a torus or a reductive group over `ℚ̄` and over
  the algebraic closures of the completions, with their local and global Galois cohomology and
  localization maps (Mathlib has continuous cohomology of topological representations, but not these
  modules or maps), and the Hodge cocharacter of a map from the Deligne torus.
* The Serre-unit criterion and the density of neat Weil points (README §§3.6–3.7): the topology on
  the points of an affine group over a local field, by which prime-units are defined (relative
  compactness of a cyclic subgroup); the pinned Tau Ceti has only the toric chart topology.
* Conjugacy of common-source realizations (README §4.1): the orthogonal outer quotient `Conj′` and the
  group `Aut′` of automorphisms of a reductive group.
* Rational torus embeddings into quasi-split groups, local-to-global transfer of maximal tori and
  rational tori for common realizations (README §§4.3–4.5): inner twists, quasi-split inner forms and
  Galois cohomology of reductive groups.
* The odd unitary similitude Hasse principle (README §4.6): nonabelian Galois cohomology `ker¹(ℚ,G)` of
  a reductive group over `ℚ`.
* The common rational Frobenius class, its real elliptic representative and its rational
  representative for abelian varieties (README §5.5, §5.7, §5.9): the `ℓ`-adic Galois
  representations on the first cohomology of an abelian variety over a number field, its Betti
  cohomology with Hodge structure and Mumford–Tate group, good reduction and geometric Frobenius.
-/

namespace TauCetiRoadmap.ReductiveGroupsPartIII

open TensorProduct WithConv NumberField IsDedekindDomain

universe u

/-! ## Layer 0: Conjugacy quotients and semisimple classes -/

/-- The algebra of regular class functions of a commutative Hopf algebra `H` over `k`: the
equalizer of the coordinate map of left conjugation `H → H ⊗ H` (conjugating point in the first
factor) and the second-factor inclusion `h ↦ 1 ⊗ h`. An element lies in it exactly when its values at
`g x g⁻¹` and at `x` agree for all points with values in every commutative `k`-algebra; it is the
arity-one invariant coordinate algebra of IntegralHeckeAndGaloisDeterminants §0.7, and the
coordinate ring of the conjugacy quotient `Conj(G)` (KZ25 §5.1.3). -/
noncomputable def classFunctions (k : Type*) (H : Type*) [CommRing k] [CommRing H]
    [HopfAlgebra k H] : Subalgebra k H :=
  AlgHom.equalizer (TauCeti.HopfAlgebra.conjugationAlgHom (R := k) (H := H))
    (Algebra.TensorProduct.includeRight (R := k) (A := H) (B := H))

/-- Steinberg's theorem, injectivity: for a connected reductive group over an algebraically closed
field `Ω` of any characteristic, two semisimple `Ω`-points are conjugate if and only if every regular
class function takes the same value at them (Steinberg65, Corollary 6.6 (a)⇔(b), extended from
semisimple to reductive groups through group Chevalley restriction; README §0.4). -/
theorem isConj_iff_classFunctions {Ω : Type u} [Field Ω] [IsAlgClosed Ω]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} Ω)
    (hH : TauCeti.reductiveCommHopfAlgProperty Ω H)
    {x y : WithConv (H →ₐ[Ω] Ω)}
    (hx : TauCeti.HopfAlgebra.IsSemisimplePoint x)
    (hy : TauCeti.HopfAlgebra.IsSemisimplePoint y) :
    IsConj x y ↔ ∀ f ∈ classFunctions Ω H, x.ofConv f = y.ofConv f := by
  sorry

/-- Steinberg's theorem, surjectivity: for a connected reductive group over an algebraically closed
field `Ω`, every `Ω`-point of the conjugacy quotient, that is every `Ω`-algebra map from the regular
class functions to `Ω`, is the restriction of evaluation at a semisimple point. Together with
`isConj_iff_classFunctions` this identifies the semisimple conjugacy classes with the `Ω`-points of
`Conj(G)` (Steinberg65, Theorem 6.11(d); README §0.4). -/
theorem exists_isSemisimplePoint_classFunctions {Ω : Type u} [Field Ω] [IsAlgClosed Ω]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} Ω)
    (hH : TauCeti.reductiveCommHopfAlgProperty Ω H)
    (φ : classFunctions Ω H →ₐ[Ω] Ω) :
    ∃ x : WithConv (H →ₐ[Ω] Ω), TauCeti.HopfAlgebra.IsSemisimplePoint x ∧
      x.ofConv.comp (classFunctions Ω H).val = φ := by
  sorry

/-- Characters separate semisimple classes: for a connected reductive group over an algebraically
closed field `Ω`, two semisimple `Ω`-points are conjugate if and only if they have the same trace on
every finite-dimensional comodule (Steinberg65, Corollary 6.6 (a)⇔(c); README §0.5). A single
faithful representation does not suffice: `2` and `1/2` in `G_m` have the same characteristic
polynomial under `t ↦ diag(t, t⁻¹)`. -/
theorem isConj_iff_trace_eq {Ω : Type u} [Field Ω] [IsAlgClosed Ω]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} Ω)
    (hH : TauCeti.reductiveCommHopfAlgProperty Ω H)
    {x y : WithConv (H →ₐ[Ω] Ω)}
    (hx : TauCeti.HopfAlgebra.IsSemisimplePoint x)
    (hy : TauCeti.HopfAlgebra.IsSemisimplePoint y) :
    IsConj x y ↔ ∀ M : TauCeti.FGComoduleCat.{u, u, u} Ω H,
      LinearMap.trace Ω _ (TauCeti.Comodule.endOfPoint M x.ofConv) =
        LinearMap.trace Ω _ (TauCeti.Comodule.endOfPoint M y.ofConv) := by
  sorry

/-! ## Layer 2: Global tori and real cocharacter adjustment -/

/-- Harder's approximation of maximal tori: for a connected reductive group `G` over a number field
`F`, a finite set `S` of finite places and a finite set `S'` of archimedean places, and maximal tori
`T v` of `G` over the completions at the places of `S` and `T' w` at those of `S'`, there is a maximal
`F`-torus of `G` whose base change to each of these completions is conjugate, by a rational point of
`G` over that completion, to the prescribed torus (KMPS22 Lemma 1.2.2; Borovoi98 Lemma 5.6.3;
README §2.2). -/
theorem exists_isMaximalTorus_conjugate {F : Type u} [Field F] [NumberField F]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} F)
    (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (S : Finset (HeightOneSpectrum (𝓞 F))) (S' : Finset (InfinitePlace F))
    (T : ∀ v : HeightOneSpectrum (𝓞 F), TauCeti.HopfIdeal (v.adicCompletion F)
      (TauCeti.CommHopfAlgCat.baseChange (K := v.adicCompletion F) H.obj))
    (hT : ∀ v ∈ S, TauCeti.HopfIdeal.IsMaximalTorus (v.adicCompletion F)
      (TauCeti.CommHopfAlgCat.baseChange (K := v.adicCompletion F) H.obj) (T v))
    (T' : ∀ w : InfinitePlace F, TauCeti.HopfIdeal w.Completion
      (TauCeti.CommHopfAlgCat.baseChange (K := w.Completion) H.obj))
    (hT' : ∀ w ∈ S', TauCeti.HopfIdeal.IsMaximalTorus w.Completion
      (TauCeti.CommHopfAlgCat.baseChange (K := w.Completion) H.obj) (T' w)) :
    ∃ I : TauCeti.HopfIdeal F H.obj, TauCeti.HopfIdeal.IsMaximalTorus F H.obj I ∧
      (∀ v ∈ S, ∃ g, TauCeti.CommHopfAlgCat.baseChangeHopfIdeal (K := v.adicCompletion F) I =
        (T v).conjugate g) ∧
      (∀ w ∈ S', ∃ g, TauCeti.CommHopfAlgCat.baseChangeHopfIdeal (K := w.Completion) I =
        (T' w).conjugate g) := by
  sorry

end TauCetiRoadmap.ReductiveGroupsPartIII
