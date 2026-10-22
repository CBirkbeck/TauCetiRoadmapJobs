import Mathlib

/-!
# GenericDoublePointInterpolation: target signatures

The roadmap is README.md; this file is not the roadmap. It states the headline
theorems against the pinned Mathlib and Tau Ceti APIs, using explicit polynomial,
linear-map, matrix and spectrum definitions.

The projective Alexander–Hirschowitz theorem, differential Horace theorem,
plane contact theorem and codimension-three cubic recursions are not statable
here on the intended projective-section carriers: the supplier projective
bundle, twisting-section comparison, residual sequence and relative direction
incidence interfaces specified in README.md are not present at the pins.
The coefficient metric and the intermediate API are specified in README.md.
-/

namespace TauCetiRoadmap.GenericDoublePointInterpolation

universe u

/-! ## Layer 0: Coefficient spaces and fixed homogenization -/

/-- Polynomials in r affine variables of total degree at most d. -/
noncomputable abbrev Bounded (R : Type u) [CommRing R] (r d : ℕ) :=
  MvPolynomial.restrictTotalDegree (Fin r) R d

/-- Exponent vectors of total weight at most d. -/
abbrev Monomials (r d : ℕ) :=
  {a : Fin r →₀ ℕ // a.sum (fun _ e => e) ≤ d}

/-- Bounded exponent vectors form a finite type, by coordinatewise boundedness. -/
noncomputable instance monomialsFintype (r d : ℕ) : Fintype (Monomials r d) := by
  classical
  have hb : Finite {f : Fin r →₀ ℕ | ∀ j, f j ≤ d} :=
    ((Set.Finite.pi' fun _ => Set.finite_le_nat d).preimage
      DFunLike.coe_injective.injOn).to_subtype
  have : Finite (Monomials r d) := by
    change Finite {a : Fin r →₀ ℕ | a.sum (fun _ e => e) ≤ d}
    rw [Set.finite_coe_iff] at hb ⊢
    exact hb.subset fun a ha j => (eq_or_ne (a j) 0).elim
      (fun h => h.trans_le (Nat.zero_le d)) fun h =>
        (Finset.single_le_sum (fun _ _ => Nat.zero_le _)
          (Finsupp.mem_support_iff.mpr h)).trans ha
  exact Fintype.ofFinite _

/-! ## Layer 1: First-jet algebras and double-point evaluation -/

/-- Rows consist of a support and either a value or a coordinate derivative. -/
abbrev JetRows (n r : ℕ) := Fin n × Option (Fin r)

/-- Algebra evaluation at the scalar point plus the coordinate infinitesimals. -/
noncomputable def jetAlgebra {R : Type u} [CommRing R] {r : ℕ} (P : Fin r → R) :
    MvPolynomial (Fin r) R →ₐ[R] TrivSqZeroExt R (Fin r → R) :=
  MvPolynomial.aeval (fun j => TrivSqZeroExt.inl (P j) +
    TrivSqZeroExt.inr (Pi.single j 1))

/-- The square of the ideal of the union of the supports, including repetitions. -/
noncomputable def doubleIdeal {R : Type u} [CommRing R] {r n : ℕ} (P : Fin n → Fin r → R) :
    Ideal (MvPolynomial (Fin r) R) :=
  (⨅ i, RingHom.ker (MvPolynomial.eval (P i))) ^ 2

/-- The quotient by distinct doubled points is the product of their first-jet algebras. -/
theorem doublePointQuotient {k : Type u} [Field k] {r n : ℕ}
    (P : Fin n → Fin r → k) (hP : Function.Injective P) :
    ∃ e : (MvPolynomial (Fin r) k ⧸ doubleIdeal P) ≃ₐ[k]
        (Fin n → TrivSqZeroExt k (Fin r → k)),
      ∀ f, e (Ideal.Quotient.mk _ f) = fun i => jetAlgebra (P i) f := by
  sorry

/-- Bounded first jets evaluate the polynomial and its native partial derivatives. -/
noncomputable def firstJetMap {R : Type u} [CommRing R] {r n : ℕ}
    (P : Fin n → Fin r → R) (d : ℕ) :
    Bounded R r d →ₗ[R] (Fin n → Option (Fin r) → R) where
  toFun f i z := match z with
    | none => MvPolynomial.eval (P i) f.val
    | some j => MvPolynomial.eval (P i) (MvPolynomial.pderiv j f.val)
  map_add' f g := by
    funext i z
    cases z <;> simp
  map_smul' a f := by
    funext i z
    cases z <;> simp

/-- The monomial matrix of value and partial-derivative evaluation over a ring. -/
noncomputable def firstJetMatrix {R : Type u} [CommRing R] {r n : ℕ}
    (P : Fin n → Fin r → R) (d : ℕ) :
    Matrix (JetRows n r) (Monomials r d) R :=
  fun z a => match z.2 with
    | none => MvPolynomial.eval (P z.1) (MvPolynomial.monomial a.val 1)
    | some j => MvPolynomial.eval (P z.1)
        (MvPolynomial.pderiv j (MvPolynomial.monomial a.val 1))

/-- A tuple is well poised when every value and first-derivative tuple is attained. -/
def WellPoised {k : Type u} [Field k] {r n : ℕ}
    (P : Fin n → Fin r → k) (d : ℕ) : Prop :=
  Function.Surjective (firstJetMap P d)

/-! ## Layer 3: Plane and cubic interpolation bases -/

/-- Distinct rational configurations attain all twelve required neighboring ranks. -/
theorem nearExceptionRanks :
    ∀ t ∈ [(2,3,3,9), (2,3,4,10), (3,3,5,20), (4,3,6,30),
      (4,3,8,35), (7,3,15,120), (2,4,4,12), (2,4,6,15),
      (3,4,8,32), (3,4,10,35), (4,4,13,65), (4,4,15,70)],
      ∃ P : Fin t.2.2.1 → Fin t.1 → ℚ,
        Function.Injective P ∧ (firstJetMatrix P t.2.1).rank = t.2.2.2 := by
  sorry

/-- Plane sextics attain both critical ranks at distinct rational supports. -/
theorem sexticPlane :
    ∀ q ∈ [9, 10], ∃ P : Fin q → Fin 2 → ℚ,
      Function.Injective P ∧ (firstJetMatrix P 6).rank = min 28 (3*q) := by
  sorry

/-- Twenty-one distinct rational supports in affine five-space impose 126 quartic conditions. -/
theorem quarticFive :
    ∃ P : Fin 21 → Fin 5 → ℚ,
      Function.Injective P ∧ (firstJetMatrix P 4).rank = 126 := by
  sorry

/-! ## Layer 4: Differential Horace and generic projective interpolation -/

/-- Over every field, distinct univariate double supports have the Hermite rank. -/
theorem univariateHermiteRank {k : Type u} [Field k] {n : ℕ}
    (P : Fin n → Fin 1 → k) (hP : Function.Injective P) (d : ℕ) :
    (firstJetMatrix P d).rank = min (d+1) (2*n) := by
  sorry

/-! ## Layer 5: Affine principal opens and integer coordinates -/

/-- The universal first-jet matrix evaluates at independent point-coordinate variables over ℤ. -/
noncomputable def universalJetMatrix (r n d : ℕ) :
    Matrix (JetRows n r) (Monomials r d) (MvPolynomial (Fin n × Fin r) ℤ) :=
  firstJetMatrix (fun i j => MvPolynomial.X (i,j)) d

/-- A choice of distinct columns defines the determinant with the fixed row ordering. -/
noncomputable abbrev selectedMinor {r n : ℕ} (d : ℕ)
    (cols : JetRows n r ↪ Monomials r d) : MvPolynomial (Fin n × Fin r) ℤ :=
  ((universalJetMatrix r n d).submatrix id cols).det

/-- A field-valued tuple determines the prime kernel of its evaluation homomorphism. -/
noncomputable abbrev evaluationPrime {k : Type u} [Field k] {r n : ℕ}
    (P : Fin n → Fin r → k) : PrimeSpectrum (MvPolynomial (Fin n × Fin r) k) :=
  ⟨RingHom.ker (MvPolynomial.eval (fun z : Fin n × Fin r => P z.1 z.2)),
    RingHom.ker_isPrime _⟩

/-- An integer maximal minor defines a nonempty full-jet open over every characteristic-zero field. -/
theorem genericAffinePrincipalOpen {k : Type u} [Field k] [CharZero k]
    (r n d : ℕ) (hr : 1 ≤ r) (hn : 1 ≤ n) (hd : 5 ≤ d)
    (hsize : n*(r+1) ≤ Nat.choose (r+d) d) :
    ∃ cols : JetRows n r ↪ Monomials r d,
      selectedMinor d cols ≠ 0 ∧
      IsOpen ((PrimeSpectrum.basicOpen (MvPolynomial.map (Int.castRingHom k)
        (selectedMinor d cols))) : Set (PrimeSpectrum (MvPolynomial (Fin n × Fin r) k))) ∧
      (∃ P : Fin n → Fin r → k, evaluationPrime P ∈ PrimeSpectrum.basicOpen
        (MvPolynomial.map (Int.castRingHom k) (selectedMinor d cols))) ∧
      ∀ P : Fin n → Fin r → k, evaluationPrime P ∈ PrimeSpectrum.basicOpen
        (MvPolynomial.map (Int.castRingHom k) (selectedMinor d cols)) →
        Function.Injective P ∧ WellPoised P d := by
  sorry

/-- A nonzero selected minor admits an integer full-jet witness in the box of side n(r+1)d. -/
theorem integerGridForMinor {k : Type u} [Field k] [CharZero k] {r n : ℕ}
    (d : ℕ) (cols : JetRows n r ↪ Monomials r d) (hΔ : selectedMinor d cols ≠ 0) :
    ∃ P : Fin n → Fin r → ℤ,
      (∀ i j, 0 ≤ P i j ∧ P i j ≤ (n*(r+1)*d : ℕ)) ∧
      MvPolynomial.eval (fun z : Fin n × Fin r => P z.1 z.2) (selectedMinor d cols) ≠ 0 ∧
      Function.Injective P ∧ WellPoised (fun i j => (P i j : k)) d := by
  sorry

/-- A nonzero polynomial pullback admits an integer parameter witness with individual degree bounds. -/
theorem parameterPullback {k : Type u} [Field k] [CharZero k]
    {S : Type*} [Fintype S] {r n : ℕ} (d : ℕ)
    (cols : JetRows n r ↪ Monomials r d) (θ : Fin n × Fin r → MvPolynomial S ℤ)
    (B : S → ℕ) (hΔ : MvPolynomial.aeval θ (selectedMinor d cols) ≠ 0)
    (hB : ∀ s, (MvPolynomial.aeval θ (selectedMinor d cols)).degreeOf s ≤ B s) :
    ∃ u : S → ℤ, (∀ s, 0 ≤ u s ∧ u s ≤ (B s : ℤ)) ∧
      MvPolynomial.eval u (MvPolynomial.aeval θ (selectedMinor d cols)) ≠ 0 ∧
      Function.Injective (fun i : Fin n => fun j : Fin r => MvPolynomial.eval u (θ (i,j))) ∧
      WellPoised (fun i : Fin n => fun j : Fin r => (MvPolynomial.eval u (θ (i,j)) : k)) d := by
  sorry

end TauCetiRoadmap.GenericDoublePointInterpolation
