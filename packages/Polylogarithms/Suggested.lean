import Mathlib

/-!
# Polylogarithms: representative target signatures

The roadmap is README.md. This file records light definitions and milestone signatures on
the pinned APIs and is not exhaustive. The classical and single-valued polylogarithms and the
Bloch–Wigner function belong to the roadmap PolylogarithmFunctions; they are restated below by
their defining formulas so that the regulator statements typecheck at the pins. Rational cycles
are tested by their universal relations, without constructing a second Bloch-group carrier.
Determinants use selected archimedean embeddings and the discriminant normalization of the
README. The weight-four theorem for the explicit cycles defined here is proved in
Polylogarithms, Part II, and is not stated in this file.
-/

namespace TauCetiRoadmap.Polylogarithms

open scoped Classical TensorProduct BigOperators
open NumberField

universe u

/-! ## The single-valued polylogarithms of PolylogarithmFunctions -/

/-- The natural-index classical polylogarithm `Liₙ`, with the lower boundary value on the cut.
This is PolylogarithmFunctions' function, with its API and Checks there; an implementation uses
that declaration. -/
noncomputable def polylog (n : ℕ) (z : ℂ) : ℂ :=
  if n = 0 then z / (1 - z)
  else if n = 1 then -Complex.log (1 - z)
  else (1 / ((n - 2).factorial : ℂ)) *
    ∫ t : ℝ in (0 : ℝ)..1,
      ((-Real.log t) ^ (n - 2) : ℝ) * (-Complex.log (1 - (t : ℂ) * z)) / (t : ℂ)

/-- Zagier's Bernoulli combination `Lₙ`, using `bernoulli 1 = -1/2`, for `n ≥ 2`; the
PolylogarithmFunctions function restated by its formula. -/
noncomputable def singleValued (n : ℕ) (z : ℂ) : ℝ :=
  let s : ℂ := ∑ k ∈ Finset.range n,
    ((2 : ℂ) ^ k * (bernoulli k : ℂ) / (k.factorial : ℂ)) *
      polylog (n - k) z * (Real.log ‖z‖ : ℂ) ^ k
  if Odd n then s.re else s.im

/-- The Bloch–Wigner function `D = L₂`, restated from PolylogarithmFunctions; the logarithmic
term vanishes at `z = 0` by totalization. -/
noncomputable def blochWigner (z : ℂ) : ℝ :=
  (polylog 2 z).im + Complex.arg (1 - z) * Real.log ‖z‖

/-! ## Explicit symbols, cycles and determinants -/

/-- The rationalized unit vector; zero has no unit and is assigned the zero vector. -/
noncomputable def unitVector {F : Type u} [Field F] (x : F) :
    ℚ ⊗[ℤ] Additive Fˣ :=
  if h : x = 0 then 0 else
    (1 : ℚ) ⊗ₜ[ℤ] Additive.ofMul (Units.mk0 x h)

/-- Functions satisfying precisely the normalized rational five-term presentation. -/
def FiveTermFunction {F : Type u} [Field F] {V : Type u}
    [AddCommGroup V] [Module ℚ V] (b : F → V) : Prop :=
  b 0 = 0 ∧ b 1 = 0 ∧ ∀ x y : F,
    x ≠ 0 → x ≠ 1 → y ≠ 0 → y ≠ 1 → x ≠ y →
    b x - b y + b (y / x) - b ((1 - x⁻¹) / (1 - y⁻¹)) +
      b ((1 - x) / (1 - y)) = 0

/-- One cyclic block of the coordinate 22-term trilogarithm relation. -/
def trilogCyclic {F : Type u} [Field F] {V : Type u} [AddCommGroup V]
    (b : F → V) (a c d : F) : V :=
  let A := d * a - a + 1
  let B := c * d - d + 1
  b A + b (A / (d * a)) + b d + b (B / (A * c)) - b (A / d) +
    b (-B * a / A) - b (B / (A * c * d)) - b 1

/-- Functions on the explicit rational weight-three presentation, including the endpoint 0. -/
def TrilogRelationFunction {F : Type u} [Field F] {V : Type u}
    [AddCommGroup V] [Module ℚ V] (b : F → V) : Prop :=
  b 0 = 0 ∧
  (∀ x : F, x ≠ 0 → b x = b x⁻¹) ∧
  (∀ x : F, x ≠ 0 → b x + b (1 - x) + b (1 - x⁻¹) = b 1) ∧
  ∀ a c d : F, a ≠ 0 → c ≠ 0 → d ≠ 0 →
    d * a - a + 1 ≠ 0 → a * c - c + 1 ≠ 0 → c * d - d + 1 ≠ 0 →
    trilogCyclic b a c d + trilogCyclic b c d a + trilogCyclic b d a c +
      b (-a * c * d) = 0

/-- A weight-three cycle is a rational symbol sum whose cobracket vanishes against every
five-term function. The README target `isCycle3_iff_delta_eq_zero` identifies this native
predicate with δ₃c = 0 through the quotient universal property. -/
def IsCycle3 {F : Type u} [Field F] (c : F →₀ ℚ) : Prop :=
  ∀ (V : Type u) [AddCommGroup V] [Module ℚ V] (b : F → V),
    FiveTermFunction b →
      c.sum (fun x a => a • (b x ⊗ₜ[ℚ] unitVector x)) = 0

/-- An explicit raw weight-four cycle: a rational symbol sum whose image `Σ aₓ [x]₃ ⊗ u(x)`
vanishes in the explicit weight-three group tensor the units, tested against every function on
the explicit weight-three presentation without constructing that quotient. The README target
`isCycle4_iff_mem_explicitRawCycleFour` identifies it with the raw kernel. -/
def IsCycle4 {F : Type u} [Field F] (c : F →₀ ℚ) : Prop :=
  ∀ (V : Type u) [AddCommGroup V] [Module ℚ V] (b : F → V),
    TrilogRelationFunction b →
      c.sum (fun x a => a • (b x ⊗ₜ[ℚ] unitVector x)) = 0

/-- The period matrix has embeddings as rows and symbol families as columns. -/
noncomputable def periodMatrix {F : Type u} [Field F] {ι : Type*}
    (n : ℕ) (σ : ι → F →+* ℂ) (c : ι → F →₀ ℚ) : Matrix ι ι ℝ :=
  fun i j => (c j).sum (fun x a => (a : ℝ) * singleValued n (σ i x))

/-- π^(n([F:Q]−d)) / √|disc F| times the d by d polylogarithmic determinant. -/
noncomputable def normalizedPeriod {F : Type u} [Field F] [NumberField F]
    {ι : Type*} [Fintype ι] [DecidableEq ι]
    (n : ℕ) (σ : ι → F →+* ℂ) (c : ι → F →₀ ℚ) : ℝ :=
  Real.pi ^ (n * (Module.finrank ℚ F - Fintype.card ι)) /
    Real.sqrt |(NumberField.discr F : ℝ)| * (periodMatrix n σ c).det

/-! ## Headline theorem -/

/-- Weight-three Zagier existence, including the actual rational cycle condition.
Goncharov, Advances 1995, Theorem 1.1; the row equivalence selects every infinite place. -/
theorem zagier_three_exists (F : Type u) [Field F] [NumberField F]
    (e : Fin (InfinitePlace.nrRealPlaces F + InfinitePlace.nrComplexPlaces F) ≃
      InfinitePlace F) :
    ∃ c : Fin (InfinitePlace.nrRealPlaces F + InfinitePlace.nrComplexPlaces F) → F →₀ ℚ,
      (∀ j, IsCycle3 (c j)) ∧ ∃ q : ℚ, q ≠ 0 ∧
        normalizedPeriod 3 (fun i => (e i).embedding) c =
          (q : ℝ) * (NumberField.dedekindZeta F 3).re := by
  sorry

/-- Every rational weight-three cycle family has rational zeta-normalized period.
The proof uses the all-configuration cycle-lifting target of README §3.8. -/
theorem zagier_three_everyFamily (F : Type u) [Field F] [NumberField F]
    (e : Fin (InfinitePlace.nrRealPlaces F + InfinitePlace.nrComplexPlaces F) ≃
      InfinitePlace F)
    (c : Fin (InfinitePlace.nrRealPlaces F + InfinitePlace.nrComplexPlaces F) → F →₀ ℚ)
    (hc : ∀ j, IsCycle3 (c j)) :
    ∃ q : ℚ, normalizedPeriod 3 (fun i => (e i).embedding) c =
      (q : ℝ) * (NumberField.dedekindZeta F 3).re := by
  sorry

/-! ## Layer 2: volume and Fourier estimates -/

/-- Lobachevsky's π-periodic function, defined by its convergent logarithmic integral. -/
noncomputable def lobachevsky (θ : ℝ) : ℝ :=
  -∫ t : ℝ in (0 : ℝ)..θ, Real.log |2 * Real.sin t|

/-- Lobachevsky's half-period integral vanishes, with the factor two inside the logarithm. -/
theorem lobachevsky_half_pi : lobachevsky (Real.pi / 2) = 0 := by
  sorry

/-- The full-period logarithmic integral vanishes. -/
theorem lobachevsky_pi : lobachevsky Real.pi = 0 := by
  sorry

/-- The analytic angle formula, before its identification with a geometric volume. -/
theorem blochWigner_lobachevsky (z : ℂ) (hz : 0 < z.im) :
    blochWigner z = lobachevsky (Complex.arg z) +
      lobachevsky (Complex.arg (1 / (1 - z))) +
      lobachevsky (Complex.arg (1 - z⁻¹)) := by
  sorry

/-- The truncated unit-circle Fourier series. -/
noncomputable def circlePartial (N : ℕ) (w : ℂ) : ℝ :=
  ∑ k ∈ Finset.range N, (w ^ (k + 1)).im / ((k + 1 : ℕ) : ℝ) ^ 2

/-- A tail bound uniform on the entire unit circle, including w = 1. -/
theorem circlePartial_error (N : ℕ) (hN : 0 < N) (w : ℂ) (hw : ‖w‖ = 1) :
    |blochWigner w - circlePartial N w| ≤ 1 / (N : ℝ) := by
  sorry

/-- Reduction to three unit-circle points, with all denominators protected. -/
theorem blochWigner_kummer (z : ℂ) (hz0 : z ≠ 0) (hz1 : z ≠ 1) :
    blochWigner z = (1 / 2 : ℝ) *
      (blochWigner (z / star z) +
       blochWigner ((1 - star z) / (1 - z)) +
       blochWigner ((1 - z⁻¹) / star (1 - z⁻¹))) := by
  sorry

example : lobachevsky 0 = 0 := by
  simp [lobachevsky]

/-- Two cutoffs at the same circle point distinguish the indexing and the tail terms. -/
example : circlePartial 3 Complex.I = 8 / 9 ∧ circlePartial 6 Complex.I = 209 / 225 := by
  norm_num [circlePartial, Finset.sum_range_succ, Complex.I_sq, pow_succ]

/-! ## Layer 3: explicit trilogarithmic cycles -/

/-- The determinant cross-ratio on five ordered vectors; genericity is required by its API. -/
noncomputable def projectedCrossRatio {F : Type*} [Field F]
    (v : Fin 5 → Fin 3 → F) : F :=
  let d (i j k : Fin 5) := Matrix.det (Matrix.of ![v i, v j, v k])
  d 0 1 3 * d 0 2 4 / (d 0 1 4 * d 0 2 3)

/-- The raw triple ratio on six ordered vectors, before its alternating symbol sum. -/
noncomputable def tripleRatio {F : Type*} [Field F]
    (v : Fin 6 → Fin 3 → F) : F :=
  let d (i j k : Fin 6) := Matrix.det (Matrix.of ![v i, v j, v k])
  d 0 1 3 * d 1 2 4 * d 0 2 5 / (d 0 1 4 * d 1 2 5 * d 0 2 3)

/-- G95's triangle parameter for the order (x₁,x₂,x₃,y₁,y₂,y₃).
Its four determinants must be nonzero in the geometric API. -/
noncomputable def triangleParameter {F : Type*} [Field F]
    (v : Fin 6 → Fin 3 → F) : F :=
  let d (i j k : Fin 6) := Matrix.det (Matrix.of ![v i, v j, v k])
  d 5 0 4 * d 5 1 3 / (d 5 0 3 * d 5 1 4)

example : triangleParameter (fun i : Fin 6 =>
    match i.val with
    | 0 => (![0,1,0] : Fin 3 → ℚ)
    | 1 => ![1,0,0]
    | 2 => ![0,0,1]
    | 3 => ![1,1,0]
    | 4 => ![1,0,1]
    | _ => ![0,1,-2]) = 2 ∧
    triangleParameter (fun i : Fin 6 =>
    match i.val with
    | 0 => (![0,2,0] : Fin 3 → ℚ)
    | 1 => ![1,0,0]
    | 2 => ![0,0,1]
    | 3 => ![1,1,0]
    | 4 => ![1,0,1]
    | _ => ![0,1,-2]) = 2 := by
  constructor <;>
    norm_num [triangleParameter, Matrix.det_fin_three, Matrix.of_apply,
      Matrix.cons_val_two, Matrix.cons_val_three, Matrix.cons_val_four,
      Matrix.vecHead, Matrix.vecTail]

example : triangleParameter (fun i : Fin 6 =>
    match i.val with
    | 0 => (![0,1,0] : Fin 3 → ℚ)
    | 1 => ![1,0,0]
    | 2 => ![0,0,1]
    | 3 => ![1,1,0]
    | 4 => ![1,0,1]
    | _ => ![0,1,-1]) = 1 := by
  norm_num [triangleParameter, Matrix.det_fin_three, Matrix.of_apply,
    Matrix.cons_val_two, Matrix.vecHead, Matrix.vecTail]

example : projectedCrossRatio
    (![![1,1,1], ![1,2,4], ![1,3,9], ![1,5,25], ![1,7,49]] :
      Fin 5 → Fin 3 → ℚ) = 6 / 5 ∧
    projectedCrossRatio
    (![![2,2,2], ![1,2,4], ![1,3,9], ![1,5,25], ![1,7,49]] :
      Fin 5 → Fin 3 → ℚ) = 6 / 5 := by
  constructor <;>
    norm_num [projectedCrossRatio, Matrix.det_fin_three, Matrix.of_apply,
      Matrix.cons_val_two, Matrix.cons_val_three, Matrix.cons_val_four,
      Matrix.vecHead, Matrix.vecTail]

example : projectedCrossRatio
    (![![1,1,1], ![1,2,4], ![1,3,9], ![1,7,49], ![1,5,25]] :
      Fin 5 → Fin 3 → ℚ) = 5 / 6 := by
  simp only [projectedCrossRatio]
  simp only [Matrix.det_fin_three, Matrix.of_apply]
  norm_num [Matrix.cons_val_two, Matrix.cons_val_three, Matrix.cons_val_four,
    Matrix.vecHead, Matrix.vecTail]

example : tripleRatio (fun i : Fin 6 =>
    match i.val with
    | 0 => (![1,1,1] : Fin 3 → ℚ)
    | 1 => ![1,2,4]
    | 2 => ![1,3,9]
    | 3 => ![1,5,25]
    | 4 => ![1,7,49]
    | _ => ![1,11,121]) = 10 / 9 ∧
    tripleRatio (fun i : Fin 6 =>
    match i.val with
    | 0 => (![2,2,2] : Fin 3 → ℚ)
    | 1 => ![1,2,4]
    | 2 => ![1,3,9]
    | 3 => ![1,5,25]
    | 4 => ![1,7,49]
    | _ => ![1,11,121]) = 10 / 9 := by
  constructor <;>
    norm_num [tripleRatio, Matrix.det_fin_three, Matrix.of_apply,
      Matrix.cons_val_two, Matrix.cons_val_three, Matrix.cons_val_four,
      Matrix.vecHead, Matrix.vecTail]

example : tripleRatio (fun i : Fin 6 =>
    match i.val with
    | 0 => (![1,0,0] : Fin 3 → ℚ)
    | 1 => ![0,1,0]
    | 2 => ![0,0,1]
    | 3 => ![1,1,1]
    | 4 => ![1,2,3]
    | _ => ![1,3,2]) = 1 := by
  norm_num [tripleRatio, Matrix.det_fin_three, Matrix.of_apply, Matrix.cons_val_two,
    Matrix.vecHead, Matrix.vecTail]

/-- The real single-valued trilogarithm satisfies the explicit weight-three presentation,
including the endpoint form of the three-term relation; it therefore descends to the explicit
group. -/
theorem singleValued_three_relations :
    TrilogRelationFunction (singleValued 3) := by
  sorry

/-- The endpoint branch and the identity unit both give the zero vector. -/
example {F : Type u} [Field F] : unitVector (0 : F) = 0 ∧ unitVector (1 : F) = 0 := by
  simp [unitVector, Units.mk0_one]

/-- Prime valuations distinguish three nonzero independent rationalized units. -/
example : LinearIndependent ℚ (![unitVector (2 : ℚ), unitVector (3 : ℚ), unitVector (5 : ℚ)]) := by
  let : Fact (Nat.Prime 5) := ⟨by decide⟩
  let ord (p : ℕ) [Fact p.Prime] : Additive ℚˣ →+ ℚ :=
    { toFun := fun x => (padicValRat p (x.toMul : ℚ) : ℚ)
      map_zero' := by simp
      map_add' := by
        intro x y
        change (padicValRat p ((x.toMul : ℚ) * (y.toMul : ℚ)) : ℚ) = _
        rw [padicValRat.mul (Units.ne_zero _) (Units.ne_zero _), Int.cast_add] }
  let L (p : ℕ) [Fact p.Prime] : (ℚ ⊗[ℤ] Additive ℚˣ) →ₗ[ℚ] ℚ :=
    TensorProduct.AlgebraTensorModule.lift
      ((LinearMap.id : ℚ →ₗ[ℚ] ℚ).smulRight (ord p).toIntLinearMap)
  have hunit (p : ℕ) [Fact p.Prime] (a : ℚ) (ha : a ≠ 0) :
      L p (unitVector a) = (padicValRat p a : ℚ) := by
    rw [unitVector, dite_eq_right ha]
    change (1 : ℚ) • (padicValRat p a : ℚ) = _
    simp
  rw [Fintype.linearIndependent_iff]
  intro c hc
  simp only [Fin.sum_univ_three] at hc
  change c 0 • unitVector (2 : ℚ) + c 1 • unitVector (3 : ℚ) + c 2 • unitVector (5 : ℚ) = 0 at hc
  have h2 := congrArg (L 2) hc
  have h3 := congrArg (L 3) hc
  have h5 := congrArg (L 5) hc
  simp only [map_add, map_smul, map_zero, hunit _ 2 (by norm_num),
    hunit _ 3 (by norm_num), hunit _ 5 (by norm_num)] at h2 h3 h5
  have hval (p q : ℕ) [Fact p.Prime] [Fact q.Prime] :
      padicValRat p (q : ℚ) = if p = q then 1 else 0 := by
    rw [padicValRat.of_nat]
    split_ifs with h
    · subst q; simp
    · simp [padicValNat_primes h]
  have hv22 := hval 2 2
  have hv23 := hval 2 3
  have hv25 := hval 2 5
  have hv32 := hval 3 2
  have hv33 := hval 3 3
  have hv35 := hval 3 5
  have hv52 := hval 5 2
  have hv53 := hval 5 3
  have hv55 := hval 5 5
  norm_num at hv22 hv23 hv25 hv32 hv33 hv35 hv52 hv53 hv55
  rw [hv22, hv23, hv25] at h2
  rw [hv32, hv33, hv35] at h3
  rw [hv52, hv53, hv55] at h5
  norm_num at h2 h3 h5
  intro i
  fin_cases i
  · exact h2
  · exact h3
  · exact h5

/-- Endpoint normalization accepts zero and rejects a nonzero constant function. -/
example : FiveTermFunction (fun _ : ℚ => (0 : ℚ)) ∧
    ¬ FiveTermFunction (fun _ : ℚ => (1 : ℚ)) := by
  simp [FiveTermFunction]

/-- The cyclic relation at one is a nonzero raw sum, retaining the endpoint. -/
example :
    (let b : ℚ → ℚ →₀ ℚ := fun x => Finsupp.single x 1
     trilogCyclic b 1 1 1 + trilogCyclic b 1 1 1 + trilogCyclic b 1 1 1 + b (-1) =
       3 • b 1 + 4 • b (-1)) ∧ trilogCyclic (fun x : ℚ => x) 1 1 1 = 0 := by
  constructor
  · dsimp
    ext x
    norm_num [trilogCyclic, Finsupp.single_apply]
    split_ifs <;> norm_num
  · norm_num [trilogCyclic]

/-- The raw relation at two has a negative quarter coefficient. -/
example :
    let b : ℚ → ℚ →₀ ℚ := fun x => Finsupp.single x 1
    trilogCyclic b 2 2 2 + trilogCyclic b 2 2 2 + trilogCyclic b 2 2 2 + b (-8) =
      3 • b 3 + 3 • b (3/4) + 3 • b 2 + 3 • b (1/2) + 3 • b (-2) -
        3 • b (3/2) - 3 • b (1/4) - 3 • b 1 + b (-8) := by
  dsimp
  ext x
  norm_num [trilogCyclic, Finsupp.single_apply]
  split_ifs <;> norm_num

example : ¬TrilogRelationFunction (fun x : ℚ => x) := by
  intro h
  have hi := h.2.1 2 (by norm_num)
  norm_num at hi

/-- The symbol three has nonzero weight-three boundary, detected by prime valuations. -/
theorem not_isCycle3_single_three : ¬ IsCycle3 (Finsupp.single (3 : ℚ) 1) := by
  sorry

/-- The symbol two has nonzero weight-four boundary, detected by the trilogarithm and ord₂. -/
theorem not_isCycle4_single_two : ¬ IsCycle4 (Finsupp.single (2 : ℚ) 1) := by
  sorry

example {F : Type u} [Field F] : IsCycle3 (Finsupp.single (1 : F) (1 : ℚ)) := by
  intro V _ _ b hb
  simp [Finsupp.sum_single_index, hb.2.1]

example {F : Type u} [Field F] : IsCycle4 (Finsupp.single (1 : F) (1 : ℚ)) := by
  intro V _ _ b _
  simp [Finsupp.sum_single_index, unitVector]

example : IsCycle4 (Finsupp.single (2 : ℚ) (1 : ℚ) + Finsupp.single (2⁻¹ : ℚ) 1) := by
  intro V _ _ b hb
  have hinv : b 2 = b 2⁻¹ := hb.2.1 2 (by norm_num)
  have hunit : Units.mk0 (2⁻¹ : ℚ) (by norm_num) = (Units.mk0 (2 : ℚ) (by norm_num))⁻¹ := by
    ext; simp
  have hu : unitVector (2⁻¹ : ℚ) = -unitVector (2 : ℚ) := by
    simp [unitVector, hunit, TensorProduct.tmul_neg]
  rw [Finsupp.sum_add_index' (by simp) (by intros; simp [add_smul])]
  simp [Finsupp.sum_single_index, ← hinv, hu, TensorProduct.tmul_neg]

/-! ## Layer 4: determinants, explicit cycles and lifting -/

/-- A chosen preimage can be made an a-cycle precisely when its boundary can be
cancelled by an element of the kernel of p; no commuting square is needed. -/
theorem cycleLift_iff {C D E : Type*}
    [AddCommGroup C] [Module ℚ C] [AddCommGroup D] [Module ℚ D]
    [AddCommGroup E] [Module ℚ E]
    (p : C →ₗ[ℚ] D) (a : C →ₗ[ℚ] E) (y : D) (x : C) (hx : p x = y) :
    (∃ z : C, p z = y ∧ a z = 0) ↔ ∃ k : C, p k = 0 ∧ a k = a x := by
  constructor
  · rintro ⟨z, hz, haz⟩
    exact ⟨x - z, by simp [map_sub, hx, hz], by simp [map_sub, haz]⟩
  · rintro ⟨k, hk, hak⟩
    exact ⟨x - k, by simp [map_sub, hx, hk], by simp [map_sub, hak]⟩

/-- If the comparison map on the target of the first differentials is injective, every
inductive cycle comes from an explicit one. In weight three it is the identification of the
two presentations of `B₂` tensored with the units, so every inductive weight-three cycle lifts. -/
theorem cycleLift_of_injective {C D E J : Type*}
    [AddCommGroup C] [Module ℚ C] [AddCommGroup D] [Module ℚ D]
    [AddCommGroup E] [Module ℚ E] [AddCommGroup J] [Module ℚ J]
    (p : C →ₗ[ℚ] D) (a : C →ₗ[ℚ] E) (b : D →ₗ[ℚ] J) (q : E →ₗ[ℚ] J)
    (hsquare : q.comp a = b.comp p) (hp : Function.Surjective p)
    (hq : Function.Injective q) (y : D) (hy : b y = 0) :
    ∃ x : C, p x = y ∧ a x = 0 := by
  obtain ⟨x, hx⟩ := hp y
  refine ⟨x, hx, hq ?_⟩
  rw [map_zero, ← LinearMap.comp_apply, hsquare, LinearMap.comp_apply, hx, hy]

/-- A surjective p does not make cycles lift when q has a kernel. -/
example :
    (Function.Surjective (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) ∧
      (¬ ∃ x : ℚ, (LinearMap.id : ℚ →ₗ[ℚ] ℚ) x = 1 ∧
        (LinearMap.id : ℚ →ₗ[ℚ] ℚ) x = 0) := by
  refine ⟨Function.surjective_id, ?_⟩
  simp

/-- Even weights use no rows over a totally real field; the determinant is 1, not 0. -/
theorem normalizedPeriod_empty (F : Type u) [Field F] [NumberField F]
    (σ : Fin 0 → F →+* ℂ) (c : Fin 0 → F →₀ ℚ) (n : ℕ) :
    normalizedPeriod n σ c =
      Real.pi ^ (n * Module.finrank ℚ F) / Real.sqrt |(NumberField.discr F : ℝ)| := by
  simp [normalizedPeriod, Matrix.det_fin_zero]

example : periodMatrix 3 (fun _ : Fin 1 => (Rat.castHom ℂ))
    (fun _ => Finsupp.single (1 : ℚ) (2 : ℚ)) 0 0 = 2 * singleValued 3 1 := by
  simp [periodMatrix]

/-- The empty determinant is one; any zero column of a positive-size matrix kills its period. -/
example (σ : Fin 0 → ℚ →+* ℂ) (c : Fin 0 → ℚ →₀ ℚ) :
    normalizedPeriod 4 σ c = Real.pi ^ 4 ∧
      ∀ (n d : ℕ) (σ' : Fin d → ℚ →+* ℂ) (c' : Fin d → ℚ →₀ ℚ)
        (j : Fin d), c' j = 0 → normalizedPeriod n σ' c' = 0 := by
  constructor
  · norm_num [normalizedPeriod, NumberField.discr_rat]
  · intro n d σ' c' j hj
    have hdet : (periodMatrix n σ' c').det = 0 :=
      Matrix.det_eq_zero_of_column_eq_zero j (by intro i; simp [periodMatrix, hj])
    simp [normalizedPeriod, hdet]

/-- Over a totally real field an even weight has no rows, and the empty determinant is a
nonzero rational multiple of `ζ_F(n)`: Borel's even-weight rationality, through
BorelRegulators. -/
theorem zagierExistence_totallyRealEven (F : Type u) [Field F] [NumberField F]
    [NumberField.IsTotallyReal F] (n : ℕ) (hn : 2 ≤ n) (heven : Even n)
    (σ : Fin 0 → F →+* ℂ) (c : Fin 0 → F →₀ ℚ) :
    ∃ q : ℚ, q ≠ 0 ∧
      normalizedPeriod n σ c = (q : ℝ) * (NumberField.dedekindZeta F n).re := by
  sorry

/-! ## Layer 5: curve regulator formulas -/

/-- The point-cycle family t ↦ [t]+[-t], retaining integral multiplicities at collision. -/
noncomputable def collidingPointCycle {F : Type*} [Field F] (t : F) : F →₀ ℕ :=
  Finsupp.single t 1 + Finsupp.single (-t) 1

example : collidingPointCycle (0 : ℚ) = Finsupp.single 0 2 := by
  simp [collidingPointCycle, ← Finsupp.single_add]

/-- Separated rational points and a characteristic-two collision retain their multiplicities. -/
example : collidingPointCycle (1 : ℚ) 1 = 1 ∧
    collidingPointCycle (1 : ZMod 2) = Finsupp.single 1 2 := by
  constructor
  · norm_num [collidingPointCycle]
  · simp [collidingPointCycle, ← Finsupp.single_add]

/-- Evaluation of the real curve-regulator one-form on a tangent vector, from its jets. -/
noncomputable def etaJet (f g df dg : ℂ) : ℝ :=
  Real.log ‖f‖ * (dg / g).im - Real.log ‖g‖ * (df / f).im

/-- Steinberg symbols map to exact Bloch–Wigner forms. -/
theorem etaJet_steinberg (z : ℂ) (hz0 : z ≠ 0) (hz1 : z ≠ 1) (v : ℂ) :
    etaJet z (1 - z) v (-v) = fderiv ℝ blochWigner z v := by
  sorry

example : etaJet 1 1 0 0 = 0 := by
  simp [etaJet]

example : etaJet 2 Complex.I 0 (-1) = Real.log 2 := by
  norm_num [etaJet, Complex.norm_def]

/-! ## Layer 6: differential and regulator diagnostics -/

/-- The exact real derivative, including the radial logarithmic correction. -/
theorem singleValued_three_differential (z : ℂ) (hz0 : z ≠ 0) (hz1 : z ≠ 1) :
    DifferentiableAt ℝ (singleValued 3) z ∧ ∀ v : ℂ,
      fderiv ℝ (singleValued 3) z v =
        -blochWigner z * (v / z).im + (Real.log ‖z‖ / 3) *
          (Real.log ‖1 - z‖ * (v / z).re -
            Real.log ‖z‖ * (v / (z - 1)).re) := by
  sorry

/-- A concrete negative control for dropping the radial logarithmic correction. -/
theorem singleValued_three_derivative_half (v : ℂ) :
    fderiv ℝ (singleValued 3) (1 / 2 : ℂ) v =
      (4 / 3 : ℝ) * (Real.log 2) ^ 2 * v.re := by
  sorry

/-- The radial correction remains nonzero on the classical cut at two. -/
theorem singleValued_three_derivative_two (v : ℂ) :
    fderiv ℝ (singleValued 3) (2 : ℂ) v =
      -(1 / 3 : ℝ) * (Real.log 2) ^ 2 * v.re := by
  sorry

/-- Minus one is stationary for the real single-valued trilogarithm. -/
theorem singleValued_three_derivative_negOne (v : ℂ) :
    fderiv ℝ (singleValued 3) (-1 : ℂ) v = 0 := by
  sorry

/-- The endpoint extension is differentiable at one with zero real Fréchet derivative. -/
theorem singleValued_three_derivative_one :
    HasFDerivAt (singleValued 3) (0 : ℂ →L[ℝ] ℝ) (1 : ℂ) := by
  sorry

end TauCetiRoadmap.Polylogarithms
