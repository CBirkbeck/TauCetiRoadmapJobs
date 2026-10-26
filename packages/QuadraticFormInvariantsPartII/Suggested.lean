import Mathlib
import TauCeti.LinearAlgebra.QuadraticForm.Witt.Pfister.Basic
import TauCeti.LinearAlgebra.QuadraticForm.Representation
import TauCeti.FieldTheory.GaloisCohomology.MuTwo.Basic
import TauCeti.RepresentationTheory.Homological.ContCohomology.Cup.TrivialF2.Basic

/-!
# Quadratic forms and cohomological invariants, Part II: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions their statements need: the quadratic Pfister form in every characteristic, the
coordinate scalar extension of a quadratic form on `Fin n → K`, the iterated cup product of mod-two
Kummer classes, the `C_i` property, the Kronecker dimension and the constant field.

Stated here:

* roundness of quadratic Pfister forms, and the equivalence of isotropy with hyperbolicity, in every
  characteristic (Layer 1);
* the Cassels–Pfister theorem and Springer's odd-degree theorem in every characteristic, and the
  Arason–Pfister Hauptsatz when `2` is invertible (Layer 2);
* the Milnor conjecture for the Witt ring in cohomological form, `Iⁿ/Iⁿ⁺¹ ≅ Hⁿ(G_K, 𝔽₂)` with
  Pfister classes going to cup products of Kummer classes, and the invariant-zero criterion for
  Pfister forms, when `2` is invertible (Layer 3);
* Dittmann–Pop's independent-value criterion over a henselian valued field (Layer 4);
* the Tsen–Lang theorem (Layer 5);
* Dittmann–Pop's dimension theorem for unit Pfister forms (Layer 6).

Headline theorems of the roadmap that are not statable at the pins, with what each lacks:

* the Arason–Pfister Hauptsatz and the invariant-zero criterion in characteristic two: the pinned
  Witt ring `TauCeti.WittRing` and its fundamental ideal assume `2` invertible, and there is no
  Witt group of nonsingular quadratic forms in characteristic two, nor the module structure over
  the bilinear Witt ring that defines its filtration;
* Kato's theorem `I_qⁿ/I_qⁿ⁺¹ ≅ H₂ⁿ(F)` in characteristic two: there is no inverse Cartier
  operator on the Kähler forms of an imperfect field, hence no Kato group `H₂ⁿ(F)`;
* the Milnor conjecture for the Witt ring in Milnor's original form `Kₙᴹ(F)/2 ≅ Iⁿ/Iⁿ⁺¹`: Milnor
  K-theory of a field is not at the pins (its composite with the norm-residue isomorphism is the
  cohomological statement below);
* the subform theorem: there is no function field of a projective quadric;
* Jannsen's Hasse principle `H^{d+2}(F, ℤ/2) ↪ ⊕_v H^{d+2}(F_v, ℤ/2)`: there are no composita of a
  function field with the completions of its global constant field and no restriction maps to them;
* patch openness of the henselian embedding and isotropy loci (Dittmann–Pop, Lemma 3.9): there is
  no henselization of a valued field.
-/

namespace TauCetiRoadmap.QuadraticFormInvariantsPartII

open QuadraticMap

universe u v

/-! ## Layer 1: quadratic Pfister forms in every characteristic -/

/-- The quadratic Pfister form `⟨⟨a₁, …, aₘ⟩⟩_b ⊗ [1, a₀]` of fold `m + 1`, in every characteristic:
the orthogonal sum, over the `2 ^ m` diagonal weights `∏_{i ∈ S} (−aᵢ)` of the bilinear Pfister form
`⟨1, −a₁⟩_b ⊗ ⋯ ⊗ ⟨1, −aₘ⟩_b` (Tau Ceti's `TauCeti.pfisterForm`), of the weighted binary block
`[1, a₀] = x² + xy + a₀ y²`, the norm form of `K[t]/(t² + t + a₀)`. It is nonsingular exactly when
`1 − 4a₀ ≠ 0`, which always holds in characteristic two (EKM, Example 9.4 and §9.B, pp. 53–54). -/
noncomputable def quadraticPfister {K : Type u} [Field K] {m : ℕ} (a : Fin m → Kˣ) (a₀ : K) :
    QuadraticForm K (Fin (2 ^ m) × Fin 2 → K) :=
  ∑ k : Fin (2 ^ m), ((TauCeti.pfisterForm a k : Kˣ) : K) •
    (QuadraticMap.proj (R := K) (k, 0) (k, 0) + QuadraticMap.proj (R := K) (k, 0) (k, 1) +
      a₀ • QuadraticMap.proj (R := K) (k, 1) (k, 1))

/-- **Quadratic Pfister forms are round** (EKM, Corollary 9.9, p. 54): every nonzero value of a
quadratic Pfister form is a similarity factor of it. No nonsingularity hypothesis is needed: the
norm form of any quadratic algebra is round, and tensoring with `⟨1, −a⟩_b` preserves roundness. -/
theorem quadraticPfister_smul_equivalent_of_represents {K : Type u} [Field K] {m : ℕ}
    (a : Fin m → Kˣ) (a₀ : K) (c : Kˣ) (hc : (quadraticPfister a a₀).Represents (c : K)) :
    ((c : K) • quadraticPfister a a₀).Equivalent (quadraticPfister a a₀) := by
  sorry

/-- **A nonsingular quadratic Pfister form is isotropic exactly when it is hyperbolic** (EKM,
Corollary 9.10, p. 54), in every characteristic; hyperbolic means isometric to the hyperbolic form
`(f, x) ↦ f x` on `V* × V` with `dim V = 2 ^ m`. The hypothesis `1 − 4a₀ ≠ 0` is nonsingularity:
over a field with `2 ≠ 0` and `a₀ = 1/4` the form `(x + y/2)²` is isotropic but not hyperbolic. -/
theorem not_anisotropic_quadraticPfister_iff_equivalent_dualProd {K : Type u} [Field K] {m : ℕ}
    (a : Fin m → Kˣ) (a₀ : K) (h : (1 : K) - 4 * a₀ ≠ 0) :
    ¬ (quadraticPfister a a₀).Anisotropic ↔
      (quadraticPfister a a₀).Equivalent (QuadraticForm.dualProd K (Fin (2 ^ m) → K)) := by
  sorry

/-! ## Layer 2: polynomial representation and the Arason–Pfister Hauptsatz -/

/-- The scalar extension of a quadratic form on `Fin n → K` to a commutative `K`-algebra `L`,
by its coordinate polynomial: `x ↦ ∑ᵢ Q(eᵢ) xᵢ² + ∑_{i<j} polar Q(eᵢ, eⱼ) xᵢ xⱼ`, with coefficients
mapped into `L`. It keeps the mixed terms in characteristic two, where Mathlib's
`QuadraticForm.baseChange` (which assumes `2` invertible) is not available (EKM, §7, p. 42). -/
noncomputable def extendScalars {K : Type u} [Field K] {n : ℕ} (Q : QuadraticForm K (Fin n → K))
    (L : Type v) [CommRing L] [Algebra K L] : QuadraticForm L (Fin n → L) :=
  ∑ i : Fin n, algebraMap K L (Q (Pi.single i 1)) • QuadraticMap.proj (R := L) i i +
    ∑ i : Fin n, ∑ j ∈ Finset.Ioi i,
      algebraMap K L (QuadraticMap.polar Q (Pi.single i 1) (Pi.single j 1)) •
        QuadraticMap.proj (R := L) i j

/-- **The Cassels–Pfister theorem** (EKM, Theorem 17.3, p. 71), for an arbitrary quadratic form in
every characteristic: a polynomial represented by `Q` over the rational function field `K(t)` is
represented by `Q` on polynomial vectors. -/
theorem exists_extendScalars_polynomial_eq {K : Type u} [Field K] {n : ℕ}
    (Q : QuadraticForm K (Fin n → K)) (h : Polynomial K)
    (hv : ∃ v : Fin n → RatFunc K,
      extendScalars Q (RatFunc K) v = algebraMap (Polynomial K) (RatFunc K) h) :
    ∃ w : Fin n → Polynomial K, extendScalars Q (Polynomial K) w = h := by
  sorry

/-- **Springer's theorem** (EKM, Corollary 18.5, p. 77), in every characteristic and including
inseparable extensions: an anisotropic quadratic form stays anisotropic over every finite field
extension of odd degree. -/
theorem anisotropic_extendScalars_of_odd_finrank {K : Type u} [Field K] {n : ℕ}
    (Q : QuadraticForm K (Fin n → K)) (hQ : Q.Anisotropic) (L : Type v) [Field L] [Algebra K L]
    [FiniteDimensional K L] (hodd : Odd (Module.finrank K L)) :
    (extendScalars Q L).Anisotropic := by
  sorry

/-- **The Arason–Pfister Hauptsatz** (EKM, Theorem 23.7(1), p. 100) for a field in which `2` is
invertible: a nonzero anisotropic regular form whose Witt class lies in `I(K)ⁿ` has dimension at
least `2ⁿ`. The characteristic-two form needs the Witt module of nonsingular quadratic forms,
which is not at the pins. -/
theorem two_pow_le_finrank_of_wittClass_mem_fundamentalIdeal_pow {K : Type u} [Field K]
    [Invertible (2 : K)] {V : Type v} [AddCommGroup V] [Module K V] [FiniteDimensional K V]
    [Nontrivial V] (Q : QuadraticForm K V) (hQ : Q.Nondegenerate) (hA : Q.Anisotropic) {n : ℕ}
    (hn : TauCeti.wittClass (TauCeti.formClass Q hQ) ∈ TauCeti.fundamentalIdeal K ^ n) :
    2 ^ n ≤ Module.finrank K V := by
  sorry

/-! ## Layer 3: higher cohomological invariants -/

/-- The cup product `(a₁) ∪ ⋯ ∪ (aₙ₊₁) ∈ Hⁿ⁺¹(G_K, 𝔽₂)` of the mod-two Kummer classes of units of a
field in which `2` is invertible, taken from left to right with Tau Ceti's multiplication pairing on
trivial `𝔽₂` coefficients. On the Pfister form `⟨⟨a₁, …, aₙ₊₁⟩⟩` it is the cohomological invariant
`eₙ₊₁` (EKM, §16, p. 67). -/
noncomputable def kummerSymbol {K : Type u} [Field K] [Invertible (2 : K)] :
    (n : ℕ) → (Fin (n + 1) → Kˣ) →
      continuousCohomology (n + 1) (TauCeti.trivialF2 (TauCeti.AbsoluteGaloisGroup K))
  | 0, a => TauCeti.kummerClass (a 0)
  | n + 1, a => (TauCeti.trivialF2TopPairing (TauCeti.AbsoluteGaloisGroup K)).cup (n + 1) 1
      (kummerSymbol n (Fin.init a)) (TauCeti.kummerClass (a (Fin.last (n + 1))))

/-- **The Milnor conjecture for the Witt ring, in cohomological form** (EKM, Fact 16.2, p. 68;
Morel, Theorem 1.1, p. 65, composed with the norm-residue isomorphism): for a field in which `2` is
invertible and every `n ≥ 1`, there is an isomorphism `Iⁿ/Iⁿ⁺¹ ≅ Hⁿ(G_K, 𝔽₂)` sending the class of
each `n`-fold Pfister form `⟨⟨a₁, …, aₙ⟩⟩` to `(a₁) ∪ ⋯ ∪ (aₙ)`. Since Pfister classes generate
`Iⁿ` additively, it is unique. -/
theorem exists_addEquiv_quotient_fundamentalIdeal_pow (K : Type u) [Field K] [Invertible (2 : K)]
    (n : ℕ) :
    ∃ e : ((TauCeti.fundamentalIdeal K ^ (n + 1)).toAddSubgroup ⧸
        ((TauCeti.fundamentalIdeal K ^ (n + 2)).toAddSubgroup.addSubgroupOf
          (TauCeti.fundamentalIdeal K ^ (n + 1)).toAddSubgroup)) ≃+
        continuousCohomology (n + 1) (TauCeti.trivialF2 (TauCeti.AbsoluteGaloisGroup K)),
      ∀ a : Fin (n + 1) → Kˣ,
        e (QuotientAddGroup.mk
          ⟨TauCeti.pfisterClass a, TauCeti.pfisterClass_mem_fundamentalIdeal_pow a⟩) =
          kummerSymbol n a := by
  sorry

/-- **The invariant-zero criterion** (EKM, Fact 16.2 with Theorem 23.7; Dittmann–Pop, Fact 3.1,
p. 6) for a field in which `2` is invertible: the Pfister form `⟨⟨a₁, …, aₙ⟩⟩ = ⟨1, −a₁⟩ ⊗ ⋯ ⊗
⟨1, −aₙ⟩`, `n ≥ 1`, is isotropic exactly when `(a₁) ∪ ⋯ ∪ (aₙ) = 0` in `Hⁿ(G_K, 𝔽₂)`. -/
theorem not_anisotropic_pfisterForm_iff_kummerSymbol_eq_zero {K : Type u} [Field K]
    [Invertible (2 : K)] (n : ℕ) (a : Fin (n + 1) → Kˣ) :
    ¬ (TauCeti.presentedForm ⟨2 ^ (n + 1), TauCeti.pfisterForm a⟩).Anisotropic ↔
      kummerSymbol n a = 0 := by
  sorry

/-! ## Layer 4: henselian unit and value criteria -/

/-- **The independent-value criterion** (Dittmann–Pop, Proposition 3.2(2) and its proof,
pp. 6–7), over a field with a henselian valuation ring `O` of arbitrary rank. Let `ε` be units of
`O` and `a₀ ∈ O` with `1 − 4a₀` a unit, so that the unit Pfister form `⟨⟨ε⟩⟩_b ⊗ [1, a₀]` has
nonsingular reduction; let `π₁, …, πₛ` have values that are `𝔽₂`-independent modulo squares in the
value group. Then the reduced form is isotropic over the residue field, the form is isotropic over
`K`, and `⟨⟨π⟩⟩_b ⊗ ⟨⟨ε⟩⟩_b ⊗ [1, a₀]` is isotropic over `K`, all at once. The empty `π` gives unit
reduction. When the valuation is non-dyadic every unit Pfister form `⟨⟨ε_r, …, ε₀⟩⟩` has this
shape, with `a₀ = (1 − ε₀)/4`. -/
theorem quadraticPfister_isotropic_tfae_of_independent_values {K : Type u} [Field K]
    (O : ValuationSubring K) [HenselianLocalRing O] {m s : ℕ} (ε : Fin m → Oˣ) (a₀ : O)
    (ha₀ : IsUnit (1 - 4 * a₀)) (π : Fin s → Kˣ)
    (hπ : ∀ S : Finset (Fin s), S.Nonempty → ¬ IsSquare (∏ i ∈ S, O.valuation (π i : K))) :
    [¬ (quadraticPfister (fun i => Units.map (IsLocalRing.residue O).toMonoidHom (ε i))
          (IsLocalRing.residue O a₀)).Anisotropic,
      ¬ (quadraticPfister (fun i => Units.map O.subtype.toMonoidHom (ε i)) (a₀ : K)).Anisotropic,
      ¬ (quadraticPfister (Fin.append π (fun i => Units.map O.subtype.toMonoidHom (ε i)))
          (a₀ : K)).Anisotropic].TFAE := by
  sorry

/-! ## Layer 5: `C_i` fields and Kronecker dimension -/

/-- A field is `C_i` when every homogeneous polynomial of positive degree `d` in more than `dⁱ`
variables has a nonzero zero (EKM, §97, p. 385). -/
def IsCi (i : ℕ) (F : Type u) [Field F] : Prop :=
  ∀ (N d : ℕ) (f : MvPolynomial (Fin N) F), 0 < d → f.IsHomogeneous d → d ^ i < N →
    ∃ x : Fin N → F, x ≠ 0 ∧ MvPolynomial.eval x f = 0

/-- **The Tsen–Lang theorem** (EKM, Corollaries 97.5–97.6 and Theorem 97.7, p. 386): an extension
of transcendence degree `t` of a `C_i` field is `C_{i+t}`, with no finite-generation hypothesis. -/
theorem IsCi.of_trdeg {i t : ℕ} {F : Type u} {E : Type v} [Field F] [Field E] [Algebra F E]
    (hF : IsCi i F) (ht : Algebra.trdeg F E = t) : IsCi (i + t) E := by
  sorry

/-- The Kronecker dimension of a field: its absolute transcendence degree, that is over the prime
subfield, plus one in characteristic zero (Dittmann–Pop, §1, p. 1). -/
noncomputable def kroneckerDimension (F : Type u) [Field F] : Cardinal.{u} :=
  Algebra.trdeg (⊥ : Subfield F) F + if ringChar F = 0 then 1 else 0

/-- The constant field of a field: the relative algebraic closure of its prime subfield
(Dittmann–Pop, Proposition 3.2, p. 6). -/
def constantField (F : Type u) [Field F] : Subfield F :=
  (algebraicClosure (⊥ : Subfield F) F).toSubfield

/-! ## Layer 6: coefficient fields, real places and the dimension theorem -/

/-- **Dittmann–Pop's dimension theorem for unit Pfister forms** (Proposition 3.2(3), pp. 6–8). Let
`K` have Kronecker dimension `r` and a nontrivial henselian valuation ring `O`, with no
finite-generation hypothesis. Let `ε₁, …, ε_r` be units of `O` and `a₀ ∈ O` with `1 − 4a₀` a unit.
If the `(r + 1)`-fold form `⟨⟨ε⟩⟩_b ⊗ [1, a₀]` is isotropic over the compositum of `K` with every
real closure of the constant field `k`, then it is isotropic over `K`. The compositum condition is
phrased through every field `L` receiving `K` and a real closed field algebraic over `k`
compatibly on `k`; it is vacuous when `k` has no ordering. -/
theorem not_anisotropic_quadraticPfister_of_kroneckerDimension {K : Type u} [Field K]
    (O : ValuationSubring K) [HenselianLocalRing O] (hO : O ≠ ⊤) {r : ℕ}
    (hr : kroneckerDimension K = r) (ε : Fin r → Oˣ) (a₀ : O) (ha₀ : IsUnit (1 - 4 * a₀))
    (hreal : ∀ (R : Type u) [Field R] [IsRealClosed R] [Algebra (constantField K) R]
      [Algebra.IsAlgebraic (constantField K) R] (L : Type u) [Field L] (f : K →+* L)
      (g : R →+* L), (∀ x : constantField K, g (algebraMap (constantField K) R x) = f x) →
      ¬ (quadraticPfister (fun i => Units.map (f.comp O.subtype).toMonoidHom (ε i))
          (f (a₀ : K))).Anisotropic) :
    ¬ (quadraticPfister (fun i => Units.map O.subtype.toMonoidHom (ε i)) (a₀ : K)).Anisotropic := by
  sorry

end TauCetiRoadmap.QuadraticFormInvariantsPartII
