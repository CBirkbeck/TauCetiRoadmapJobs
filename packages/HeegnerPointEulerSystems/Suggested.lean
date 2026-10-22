import Mathlib

/-!
# HeegnerPointEulerSystems: representative target signatures

The roadmap is README.md. This file records statements suggested against the pinned APIs
and is not exhaustive. Light algebraic definitions take their maps as data; the arithmetic
construction and identification of those maps are separate targets in README.md.
-/

noncomputable section
open scoped TensorProduct

namespace TauCetiRoadmap.HeegnerPointEulerSystems


/-! ## Layer 1: CM points and integral quotient maps -/


/-- Evaluate a conductor family through its fixed integral point map (§1.5). -/
def conductorPoint {X M : Type*} (φ : X → M) (x : ℕ → X) (c : ℕ) : M :=
  φ (x c)

/-- A zero quotient kills the whole conductor family. -/
example {X M : Type*} [Zero M] (x : ℕ → X) (c : ℕ) :
    conductorPoint (fun _ : X => (0 : M)) x c = 0 := rfl

/-- A selected point differs from its two-element orbit trace. -/
example : conductorPoint (id : ℤ → ℤ) (fun _ => 1) 1 ≠ (1 : ℤ) + (-1) := by
  norm_num [conductorPoint]

/-- The cusp branch uses the fixed map without an extra denominator. -/
theorem conductorPoint_cusp {X M : Type*} (cuspMap : X → M) (x : ℕ → X) (c : ℕ) :
    conductorPoint cuspMap x c = cuspMap (x c) := rfl


/-! ## Layer 4: Derivative coefficients and descent to K -/


/-- Sum the two-generator Heegner coefficient ideals over finite auxiliary support (§4.1). -/
def coefficientIdeal (p : ℕ) [Fact p.Prime] (a : ℕ → ℤ) (s : Finset ℕ) :
    Ideal ℤ_[p] :=
  ∑ ℓ ∈ s, Ideal.span ({(a ℓ : ℤ_[p]), ((ℓ : ℤ_[p]) + 1)} : Set ℤ_[p])

/-- Conductor one retains the zero coefficient ideal. -/
example (p : ℕ) [Fact p.Prime] (a : ℕ → ℤ) : coefficientIdeal p a ∅ = ⊥ := by
  simp [coefficientIdeal]

/-- A zero eigenvalue still retains the nonzero second generator. -/
example (p ℓ : ℕ) [Fact p.Prime] : coefficientIdeal p (fun _ => 0) {ℓ} =
    Ideal.span ({((ℓ : ℤ_[p]) + 1)} : Set ℤ_[p]) := by
  simp [coefficientIdeal, Set.pair_comm]

/-- Nonempty coefficient support has the minimum extended valuation as its exponent. -/
theorem coefficientIdeal_normal_form (p : ℕ) [Fact p.Prime] (a : ℕ → ℤ)
    (s : Finset ℕ) (hs : s.Nonempty) :
    let v : ℤ_[p] → ℕ∞ := fun x =>
      @ite ℕ∞ (x = 0) (Classical.propDecidable _) ⊤ (x.valuation : ℕ∞)
    ∃ m : ℕ, coefficientIdeal p a s = Ideal.span ({(p : ℤ_[p]) ^ m} : Set ℤ_[p]) ∧
      (m : ℕ∞) = s.inf (fun ℓ => min (v (a ℓ)) (v ((ℓ : ℤ_[p]) + 1))) := by
  sorry

/-- The sum of coefficient ideals takes the minimum, rather than the maximum, depth. -/
theorem coefficientIdeal_min_not_max [Fact (Nat.Prime 5)] :
    coefficientIdeal 5 (fun ℓ => if ℓ = 19 then 10 else 25) {19, 149} =
      Ideal.span ({(5 : ℤ_[5])} : Set ℤ_[5]) := by
  sorry

/-- A single nonzero coefficient pair has the stated depth. -/
theorem coefficientIdeal_prime_five [Fact (Nat.Prime 5)] :
    coefficientIdeal 5 (fun _ => 10) {19} = Ideal.span ({(5 : ℤ_[5])} : Set ℤ_[5]) := by
  sorry


/-- Take the inverse image under a specified additive restriction equivalence (§4.4). -/
def descendedClass {C I : Type*} [AddCommGroup C] [AddCommGroup I]
    (resInv : C ≃+ I) (z : I) : C :=
  resInv.symm z

/-- Zero descends to zero through a restriction equivalence. -/
example {C I : Type*} [AddCommGroup C] [AddCommGroup I] (e : C ≃+ I) :
    descendedClass e 0 = 0 := by simp [descendedClass]

/-- Descent through the identity preserves the class. -/
example {C : Type*} [AddCommGroup C] (z : C) :
    descendedClass (AddEquiv.refl C) z = z := rfl

/-- No additive equivalence can represent the zero restriction map on ℤ. -/
theorem descendedClass_noninjective_obstruction :
    ¬ ∃ e : ℤ ≃+ ℤ, e.toAddMonoidHom = 0 := by
  rintro ⟨e, he⟩
  have h : e 1 = e 0 := by simpa [he] using congrArg (fun f : ℤ →+ ℤ => f 1 - f 0) he
  exact one_ne_zero (e.injective h)


/-! ## Layer 5: Corrected local relations and arithmetic descent hypotheses -/


/-- Apply the inverse of a specified global additive correction (§5.3). -/
def correctedClass {C : Type*} [AddCommGroup C] (χ : C ≃+ C) (κ : C) : C :=
  χ.symm κ

/-- Empty correction preserves the bottom class. -/
example {C : Type*} [AddCommGroup C] (κ : C) :
    correctedClass (AddEquiv.refl C) κ = κ := rfl

/-- Negation correction must be inverted, including its sign. -/
example : correctedClass (AddEquiv.neg ℤ) 3 = -3 := rfl

/-- Every additive correction preserves the zero class. -/
theorem correctedClass_zero {C : Type*} [AddCommGroup C] (χ : C ≃+ C) :
    correctedClass χ 0 = 0 := by simp [correctedClass]


/-! ## Layer 6: Finite descent, residual support and indivisibility -/


/-- The least distinct-prime support of a nonzero class, with empty infimum ∞ (§6.12). -/
def vanishingOrder {C : Type*} [Zero C] (Λ : Set ℕ) (κ : ℕ → C) : ℕ∞ :=
  sInf {v : ℕ∞ | ∃ n ∈ Λ, κ n ≠ 0 ∧ v = (n.primeFactorsList.toFinset.card : ℕ∞)}

/-- Empty support has infinite vanishing order. -/
example {C : Type*} [Zero C] (κ : ℕ → C) : vanishingOrder (∅ : Set ℕ) κ = ⊤ := by
  simp [vanishingOrder]

/-- A nonzero conductor-one class has support size zero. -/
example : vanishingOrder ({1} : Set ℕ) (fun _ => (1 : ℤ)) = 0 := by
  simp [vanishingOrder]

/-- Two distinct prime factors contribute two to the support. -/
theorem vanishingOrder_conductor_six :
    vanishingOrder ({6} : Set ℕ) (fun _ => (1 : ℤ)) = 2 := by
  have h : (6 : ℕ).primeFactorsList = [2, 3] := by norm_num [Nat.primeFactorsList, Nat.minFac]
  simp only [vanishingOrder, Set.mem_singleton_iff, exists_eq_left, ne_eq, one_ne_zero,
    not_false_eq_true, true_and]
  rw [h]
  norm_num


/-- Good primes at which every member of the supplied class family localizes to zero (§6.13). -/
def baseLocus {C : Type*} [AddCommGroup C] {L : ℕ → Type*}
    [∀ ℓ, AddCommGroup (L ℓ)] (D N p : ℕ) (Λ : Set ℕ)
    (loc : (ℓ : ℕ) → C →+ L ℓ) (κ : ℕ → C) : Set ℕ :=
  {ℓ | ℓ.Prime ∧ ¬ ℓ ∣ D * N * p ∧ ∀ n ∈ Λ, loc ℓ (κ n) = 0}

/-- The zero family has precisely all permitted good primes in its base locus. -/
example {C : Type*} [AddCommGroup C] {L : ℕ → Type*} [∀ ℓ, AddCommGroup (L ℓ)]
    (D N p ℓ : ℕ) (Λ : Set ℕ) (loc : (ℓ : ℕ) → C →+ L ℓ) :
    ℓ ∈ baseLocus D N p Λ loc (fun _ => (0 : C)) ↔ ℓ.Prime ∧ ¬ ℓ ∣ D * N * p := by
  simp [baseLocus]

/-- A single nonzero localization excludes its prime. -/
example {C : Type*} [AddCommGroup C] {L : ℕ → Type*} [∀ ℓ, AddCommGroup (L ℓ)]
    (D N p ℓ n : ℕ) (Λ : Set ℕ) (loc : (ℓ : ℕ) → C →+ L ℓ)
    (κ : ℕ → C) (hn : n ∈ Λ) (h : loc ℓ (κ n) ≠ 0) : ℓ ∉ baseLocus D N p Λ loc κ := by
  exact fun hm => h (hm.2.2 n hn)

/-- The coefficient prime is excluded even for a zero system. -/
theorem baseLocus_coefficient_prime {C : Type*} [AddCommGroup C] {L : ℕ → Type*}
    [∀ ℓ, AddCommGroup (L ℓ)] (D N p : ℕ) (Λ : Set ℕ)
    (loc : (ℓ : ℕ) → C →+ L ℓ) (κ : ℕ → C) : p ∉ baseLocus D N p Λ loc κ := by
  exact fun h => h.2.1 (dvd_mul_left p (D * N))


/-! ## Layer 7: Exceptional primes, CM and RM descent -/

/-- A nontorsion element of a finitely generated abelian group is divisible by only finitely many primes (§7.1). -/
theorem non_torsion_point_prime_divisibility {M : Type*} [AddCommGroup M]
    [AddGroup.FG M] (y : M) (hy : ∀ n : ℕ, 0 < n → n • y ≠ 0) : ∃ excluded : Finset ℕ, ∀ p : ℕ, p.Prime → p ∉ excluded → ¬ ∃ z : M, p • z = y := by
  sorry


/-! ## Layer 8: Anticyclotomic families, nonvanishing and refined descent -/


/-- The split group-ring polynomial or inert scalar initial factor (§8.1; Howard §2.3). -/
def initialFactor {R : Type*} [CommRing R] (split : Bool) (p : ℕ)
    (ap σ σstar : R) : R :=
  if split then
    ((p : R) - ap * σ + σ ^ 2) * ((p : R) - ap * σstar + σstar ^ 2)
  else ((p : R) + 1) ^ 2 - ap ^ 2

/-- Split augmentation can be nonunit even for ordinary reduction. -/
example : initialFactor true 5 (1 : ℤ) 1 1 = 25 := by norm_num [initialFactor]

/-- In C₃, arithmetic Artin inversion exchanges the two nonidentity coefficients. -/
example : let s : MonoidAlgebra ℤ (Multiplicative (ZMod 3)) :=
      MonoidAlgebra.single (Multiplicative.ofAdd 1) 1
    let t : MonoidAlgebra ℤ (Multiplicative (ZMod 3)) :=
      MonoidAlgebra.single (Multiplicative.ofAdd 2) 1
    initialFactor true 5 1 s t = 27 - s - t ∧
      initialFactor true 5 1 t s = 27 - s - t := by
  dsimp only
  set s : MonoidAlgebra ℤ (Multiplicative (ZMod 3)) :=
    MonoidAlgebra.single (Multiplicative.ofAdd 1) 1
  set t : MonoidAlgebra ℤ (Multiplicative (ZMod 3)) :=
    MonoidAlgebra.single (Multiplicative.ofAdd 2) 1
  have hs : s ^ 2 = t := by
    simp only [s, t, pow_two, MonoidAlgebra.single_mul_single, one_mul]
    congr 1
  have ht : t ^ 2 = s := by
    simp only [s, t, pow_two, MonoidAlgebra.single_mul_single, one_mul]
    congr 1
  have hst : s * t = 1 := by
    rw [show s * t = MonoidAlgebra.single 1 1 from by
      simp only [s, t, MonoidAlgebra.single_mul_single, one_mul]
      congr 1]
    rfl
  have h : initialFactor true 5 1 s t = 27 - s - t := by
    calc
      initialFactor true 5 1 s t = 25 - s ^ 2 + 2 * (s * t) - t ^ 2 := by
        simp only [initialFactor, ↓reduceIte, one_mul, hs, ht]
        ring_nf
        rw [hs, ht]
        ring
      _ = 27 - s - t := by rw [hs, ht, hst]; ring
  exact ⟨h, by simpa [initialFactor, mul_comm] using h⟩

/-- The inert scalar differs from the split augmentation. -/
theorem initialFactor_inert_five : initialFactor false 5 (1 : ℤ) 1 1 = 35 := by
  norm_num [initialFactor]

/-- Augmentation sends the split factor to the square of p+1−a_p. -/
theorem initialFactor_augmentation {R S : Type*} [CommRing R] [CommRing S]
    (f : R →+* S) (p : ℕ) (ap σ σstar : R) (hσ : f σ = 1) (hσstar : f σstar = 1) :
    f (initialFactor true p ap σ σstar) = ((p : S) + 1 - f ap) ^ 2 := by
  simp [initialFactor, hσ, hσstar]
  ring


/-- Ordinary stabilization at positive levels, with an independently corrected initial value (§8.2). -/
def stabilizedPoint {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]
    (α : Rˣ) (raw : ℕ → M) (initial : M) (k : ℕ) : M :=
  match k with
  | 0 => initial
  | k + 1 => ((↑(α⁻¹) : R) ^ (k + 1)) • (raw (k + 1) - (↑(α⁻¹) : R) • raw k)

/-- The zero raw family has zero stabilized family. -/
example {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M] (α : Rˣ) (k : ℕ) :
    stabilizedPoint α (fun _ => (0 : M)) 0 k = 0 := by cases k <;> simp [stabilizedPoint]

/-- The predecessor subtraction changes the first stabilized value. -/
example : stabilizedPoint (Units.mk0 (2 : ℚ) (by norm_num))
    (fun k => if k = 0 then (2 : ℚ) else 4) 0 1 = (3/2 : ℚ) := by
  norm_num [stabilizedPoint, smul_eq_mul]

/-- Level zero uses the corrected initial term, independently of the raw value. -/
theorem stabilizedPoint_first_level {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]
    (α : Rˣ) (raw : ℕ → M) (corrected : M) : stabilizedPoint α raw corrected 0 = corrected := rfl


/-- Transport a supplied Kummer limit along a specified additive comparison (§8.6). -/
def heegnerIwasawaClass {L C : Type*} [AddCommGroup L] [AddCommGroup C]
    (shapiro : L ≃+ C) (q : L) : C :=
  shapiro q

/-- Transport respects the supplied trace comparison. -/
example {L C M : Type*} [AddCommGroup L] [AddCommGroup C] [AddCommGroup M]
    (e : L ≃+ C) (q : L) (trace : L →+ M) (proj : C →+ M)
    (h : ∀ x, proj (e x) = trace x) : proj (heegnerIwasawaClass e q) = trace q := h q

/-- Multiplication of the point family changes its integral class. -/
example : heegnerIwasawaClass (AddEquiv.refl ℤ) (5 * 1) = 5 ∧
    heegnerIwasawaClass (AddEquiv.refl ℤ) (5 * 1) ≠ heegnerIwasawaClass (AddEquiv.refl ℤ) 1 := by
  norm_num [heegnerIwasawaClass]

/-- A nonzero transported class can have a zero projection. -/
theorem heegnerIwasawaClass_nonzero_not_all_specializations :
    heegnerIwasawaClass (AddEquiv.refl (ℤ × ℤ)) (1, 0) ≠ 0 ∧
      (heegnerIwasawaClass (AddEquiv.refl (ℤ × ℤ)) (1, 0)).2 = 0 := by
  norm_num [heegnerIwasawaClass]


/-- Characters of fixed torsion type that do not factor through the preceding quotient (§8.7). -/
def cmCharacterStratum {G H G0 A : Type*} [Group G] [Group H] [Group G0] [CommGroup A]
    (π : G →* H) (tors : G0 →* G) (χ0 : G0 →* A) : Set (G →* A) :=
  {χ | χ.comp tors = χ0 ∧ ¬ ∃ ψ : H →* A, ψ.comp π = χ}

/-- The identity preceding quotient leaves no primitive characters. -/
example {G G0 A : Type*} [Group G] [Group G0] [CommGroup A]
    (tors : G0 →* G) (χ0 : G0 →* A) : cmCharacterStratum (MonoidHom.id G) tors χ0 = ∅ := by
  ext χ
  simp [cmCharacterStratum]

/-- Wrong torsion type excludes even a primitive character. -/
example {G H G0 A : Type*} [Group G] [Group H] [Group G0] [CommGroup A]
    (π : G →* H) (tors : G0 →* G) (χ0 : G0 →* A) (χ : G →* A)
    (h : χ.comp tors ≠ χ0) : χ ∉ cmCharacterStratum π tors χ0 := fun hc => h hc.1

/-- The sign character of C₂ is primitive over the trivial quotient. -/
theorem cmCharacterStratum_first_nontrivial :
    (MonoidHom.id ℤˣ) ∈ cmCharacterStratum (1 : ℤˣ →* Unit)
      (1 : Unit →* ℤˣ) (1 : Unit →* ℤˣ) := by
  constructor
  · ext x; simp
  · rintro ⟨ψ, hψ⟩
    have h := DFunLike.congr_fun hψ (-1)
    norm_num at h


/-- Raise a supplied character to (p−1)p^(m−1); crystallinity is a separate arithmetic target (§8.14). -/
def nearTrivialCharacter {G A : Type*} [Group G] [CommGroup A]
    (ξ : G →* A) (p m : ℕ) : G →* A :=
  ξ ^ ((p - 1) * p ^ (m - 1))

/-- The first p=5 exponent is four. -/
example {G A : Type*} [Group G] [CommGroup A] (ξ : G →* A) :
    nearTrivialCharacter ξ 5 1 = ξ ^ 4 := rfl

/-- The next exponent is twenty. -/
example {G A : Type*} [Group G] [CommGroup A] (ξ : G →* A) :
    nearTrivialCharacter ξ 5 2 = ξ ^ 20 := rfl

/-- A character of order dividing four cannot produce a nontrivial first twist at five. -/
theorem nearTrivialCharacter_torsion_counterexample {G A : Type*} [Group G] [CommGroup A]
    (ξ : G →* A) (h : ξ ^ 4 = 1) : nearTrivialCharacter ξ 5 1 = 1 := h


/-- The infimum of supplied divisibility indices on one permitted degree stratum (§8.15). -/
def heegnerDivisibilityProfile (index : ℕ → ℕ∞) (degree : ℕ → ℕ)
    (allowed : Set ℕ) (r : ℕ) : ℕ∞ :=
  sInf {v | ∃ n ∈ allowed, degree n = r ∧ index n = v}

/-- The zero system has infinite index on every stratum. -/
example (degree : ℕ → ℕ) (allowed : Set ℕ) (r : ℕ) :
    heegnerDivisibilityProfile (fun _ => ⊤) degree allowed r = ⊤ := by
  apply top_unique
  apply le_sInf
  rintro v ⟨n, hn, hd, rfl⟩
  exact le_rfl

/-- The leading index and the infimum across other support degrees differ. -/
example : heegnerDivisibilityProfile (fun n => if n = 1 then 3 else 1)
    (fun n => if n = 1 then 0 else 1) {1,2} 0 = 3 ∧
    heegnerDivisibilityProfile (fun n => if n = 1 then 3 else 1)
    (fun n => if n = 1 then 0 else 1) {1,2} 1 = 1 := by
  norm_num [heegnerDivisibilityProfile]

/-- Two indices in a single stratum contribute their minimum. -/
theorem heegnerDivisibilityProfile_sum_not_max :
    heegnerDivisibilityProfile (fun n => if n = 1 then 2 else 5)
      (fun _ => 1) {1,2} 1 = 2 := by
  norm_num [heegnerDivisibilityProfile, Set.ofPred_or]


/-- Pull back a tensor under a specified linear equivalence of rational lines (§8.30). -/
def determinantalHeegnerElement {R D S Sι : Type*} [CommRing R]
    [AddCommGroup D] [AddCommGroup S] [AddCommGroup Sι]
    [Module R D] [Module R S] [Module R Sι]
    (e : D ≃ₗ[R] (S ⊗[R] Sι)) (y : S) (iy : Sι) : D :=
  e.symm (y ⊗ₜ[R] iy)

/-- A zero Heegner class gives zero tensor preimage. -/
example {R D S Sι : Type*} [CommRing R] [AddCommGroup D] [AddCommGroup S]
    [AddCommGroup Sι] [Module R D] [Module R S] [Module R Sι]
    (e : D ≃ₗ[R] (S ⊗[R] Sι)) (iy : Sι) : determinantalHeegnerElement e 0 iy = 0 := by
  simp [determinantalHeegnerElement]

/-- Rescaling both factors gives the square scalar, with identity involution. -/
example {R D S Sι : Type*} [CommRing R] [AddCommGroup D] [AddCommGroup S]
    [AddCommGroup Sι] [Module R D] [Module R S] [Module R Sι]
    (e : D ≃ₗ[R] (S ⊗[R] Sι)) (y : S) (iy : Sι) (a : R) :
    determinantalHeegnerElement e (a • y) (a • iy) = a ^ 2 • determinantalHeegnerElement e y iy := by
  simp [determinantalHeegnerElement, TensorProduct.smul_tmul, TensorProduct.tmul_smul, smul_smul, pow_two]

/-- A nonzero rational tensor preimage need not be an integral basis. -/
theorem determinantalHeegnerElement_rational_not_basis :
    TensorProduct.lid ℤ ℤ
      (determinantalHeegnerElement (LinearEquiv.refl ℤ (ℤ ⊗[ℤ] ℤ)) 5 1) = 5 ∧
    ¬ IsUnit (TensorProduct.lid ℤ ℤ
      (determinantalHeegnerElement (LinearEquiv.refl ℤ (ℤ ⊗[ℤ] ℤ)) 5 1)) := by
  change (TensorProduct.lid ℤ ℤ) (5 ⊗ₜ[ℤ] 1) = 5 ∧
    ¬ IsUnit ((TensorProduct.lid ℤ ℤ) (5 ⊗ₜ[ℤ] 1))
  norm_num [TensorProduct.lid_tmul, smul_eq_mul, Int.isUnit_iff]


/-- Descend a supplied differentiated Kummer value through a restriction equivalence (§8.33). -/
def lambdaDerivativeClass {L C I : Type*} [AddCommGroup L] [AddCommGroup C]
    [AddCommGroup I] (resInv : C ≃+ I) (D : L →+ I) (q : L) : C :=
  resInv.symm (D q)

/-- The empty derivative and identity restriction recover the bottom class. -/
example {C : Type*} [AddCommGroup C] (q : C) :
    lambdaDerivativeClass (AddEquiv.refl C) (AddMonoidHom.id C) q = q := rfl

/-- A zero family gives zero differentiated class. -/
example {L C I : Type*} [AddCommGroup L] [AddCommGroup C] [AddCommGroup I]
    (e : C ≃+ I) (D : L →+ I) : lambdaDerivativeClass e D 0 = 0 := by
  simp [lambdaDerivativeClass]

/-- Restriction of the descended derivative recovers its supplied differentiated value. -/
theorem lambdaDerivativeClass_restrict {L C I : Type*} [AddCommGroup L]
    [AddCommGroup C] [AddCommGroup I] (e : C ≃+ I) (D : L →+ I) (q : L) :
    e (lambdaDerivativeClass e D q) = D q := e.apply_symm_apply _


end TauCetiRoadmap.HeegnerPointEulerSystems
