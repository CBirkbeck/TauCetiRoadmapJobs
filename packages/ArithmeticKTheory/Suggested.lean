import Mathlib

/-!
# ArithmeticKTheory: representative target signatures

README.md is the definitive roadmap. This file records light definitions and
representative theorem signatures statable against the pinned Mathlib and Tau Ceti
APIs; it is not exhaustive. Proofs marked `sorry` are mathematical targets.
The denominator monoid uses the existing S-integer subalgebra. Rank functions
are numerical conventions with separate arithmetic ranges; divisibility means
membership in every positive multiplication image; the Bott sign is dualization;
and the positive Bernoulli sequence is reindexed from Mathlib’s arithmetic one.
-/

noncomputable section

open IsDedekindDomain
open scoped Pointwise DirectSum

namespace TauCetiRoadmap.ArithmeticKTheory

/-! ## Layer 1: S-integers and arithmetic functoriality -/

section SIntegers

variable {R : Type*} [CommRing R] [IsDedekindDomain R]
  (S : Set (HeightOneSpectrum R)) (F : Type*) [Field F]
  [Algebra R F] [IsFractionRing R F]

/-- The candidate denominators are the preimage of the units of the existing ring. -/
def sUnitSubmonoid : Submonoid R :=
  (IsUnit.submonoid (S.integer F)).comap (algebraMap R (S.integer F))

/-- The denominator criterion for arbitrary sets of primes; README §1.1. -/
theorem integer_isLocalization_iff (M : Submonoid R) :
    IsLocalization M (S.integer F) ↔
      M ≤ sUnitSubmonoid S F ∧ ∀ v ∈ S, ∃ m ∈ M, m ∈ v.asIdeal := by
  sorry

/-- The fraction-field embedding makes one a denominator and excludes zero. -/
example : (1 : R) ∈ sUnitSubmonoid S F ∧
    (0 : R) ∉ sUnitSubmonoid S F := by
  change IsUnit (algebraMap R (S.integer F) 1) ∧
    ¬ IsUnit (algebraMap R (S.integer F) 0)
  simp

/-- Empty and full prime sets distinguish integral units from all nonzero denominators. -/
example : (∀ r : R, r ∈ sUnitSubmonoid (∅ : Set (HeightOneSpectrum R)) F ↔ IsUnit r) ∧
    (∀ r : R, r ∈ sUnitSubmonoid (Set.univ : Set (HeightOneSpectrum R)) F ↔ r ≠ 0) := by
  constructor
  · intro r
    change IsUnit (algebraMap R ((∅ : Set (HeightOneSpectrum R)).integer F) r) ↔ IsUnit r
    rw [integer_empty]
    simp
  · intro r
    change IsUnit (algebraMap R ((Set.univ : Set (HeightOneSpectrum R)).integer F) r) ↔ r ≠ 0
    rw [integer_univ]
    rw [← isUnit_map_iff (Subalgebra.topEquiv.toRingEquiv : (⊤ : Subalgebra R F) ≃+* F)]
    simp

/-- Torsion of the class group suffices even when the set of inverted primes is infinite. -/
theorem integer_isLocalization_of_torsion_classGroup
    (htors : ∀ c : ClassGroup R, IsOfFinOrder c) :
    IsLocalization (sUnitSubmonoid S F) (S.integer F) := by
  sorry

end SIntegers

/-! ## Layer 3: finite generation and ranks -/

/-- Numerical rank convention for positive degrees >= 2; degree one is separate. -/
def borelRank (r₁ r₂ n : ℕ) : ℕ :=
  if n % 4 = 1 then r₁ + r₂ else if n % 4 = 3 then r₂ else 0

/-- The rational signature separates the two positive odd residue ranks. -/
example : borelRank 1 0 3 = 0 ∧ borelRank 1 0 5 = 1 := by decide

/-- One complex place contributes in both positive odd residue classes. -/
example : borelRank 0 1 3 = 1 ∧ borelRank 0 1 5 = 1 := by decide

/-- Every even input has numerical Borel rank zero, including the nonarithmetic input zero. -/
theorem borelRank_even (r₁ r₂ k : ℕ) : borelRank r₁ r₂ (2 * k) = 0 := by
  unfold borelRank
  split_ifs <;> omega

/-! ## Layer 6: even groups, divisibility and Bott degrees -/

section DivisibleElements

variable (A : Type*) [AddCommGroup A]

/-- The elements divisible by every positive integer. -/
def divisibleSubgroup : AddSubgroup A :=
  ⨅ (m : ℕ) (_ : 1 ≤ m), m • (⊤ : AddSubgroup A)

/-- Infinite height means a root in the ambient group for each positive multiplier. -/
theorem mem_divisibleSubgroup_iff {x : A} :
    x ∈ divisibleSubgroup A ↔ ∀ m : ℕ, 1 ≤ m → ∃ y, m • y = x := by
  simp [divisibleSubgroup, AddSubgroup.mem_smul_pointwise_iff_exists]

/-- The cardinality multiplier kills a finite group, so its infinite-height subgroup is zero. -/
theorem divisibleSubgroup_eq_bot_of_finite [Finite A] :
    divisibleSubgroup A = ⊥ := by
  rw [eq_bot_iff]
  intro x hx
  simp only [divisibleSubgroup, AddSubgroup.mem_iInf,
    AddSubgroup.mem_smul_pointwise_iff_exists, AddSubgroup.mem_top, true_and] at hx
  obtain ⟨y, hy⟩ := hx (Nat.card A) Nat.card_pos
  rw [AddSubgroup.mem_bot, ← hy]
  exact card_nsmul_eq_zero'


/-- A finite subgroup containing all infinite-height elements has an eventual
intersection bound; its exponent need not be such a bound. -/
theorem inter_mul_eventually_eq_divisibleSubgroup (T : AddSubgroup A)
    [Finite T] (hT : divisibleSubgroup A ≤ T) :
    ∃ m₀ : ℕ, 1 ≤ m₀ ∧ ∀ m : ℕ, 1 ≤ m → m₀ ∣ m →
      T ⊓ m • (⊤ : AddSubgroup A) = divisibleSubgroup A := by
  sorry

/-- Both rational groups have infinite height, including the torsion quotient by the integers. -/
example : divisibleSubgroup ℚ = ⊤ ∧
    divisibleSubgroup (ℚ ⧸ AddSubgroup.zmultiples (1 : ℚ)) = ⊤ := by
  have hq : divisibleSubgroup ℚ = ⊤ := by
    ext x
    simp only [divisibleSubgroup, AddSubgroup.mem_iInf, AddSubgroup.mem_top, iff_true]
    intro m hm
    rw [AddSubgroup.mem_smul_pointwise_iff_exists]
    refine ⟨x / m, trivial, ?_⟩
    rw [nsmul_eq_mul, mul_div_cancel₀]
    exact_mod_cast (show m ≠ 0 by omega)
  refine ⟨hq, ?_⟩
  ext x
  simp only [AddSubgroup.mem_top, iff_true]
  obtain ⟨r, rfl⟩ := QuotientAddGroup.mk_surjective x
  rw [mem_divisibleSubgroup_iff]
  intro m hm
  refine ⟨QuotientAddGroup.mk (r / m), ?_⟩
  rw [← QuotientAddGroup.mk_nsmul, nsmul_eq_mul, mul_div_cancel₀]
  exact_mod_cast (show m ≠ 0 by omega)

/-- Finite cyclic height vanishes, and adjoining rational roots leaves exactly the rational factor. -/
example : divisibleSubgroup (ZMod 4) = ⊥ ∧
    (2 : ℕ) • (⊤ : AddSubgroup (ZMod 4)) ≠ ⊥ ∧
    (∀ x : ZMod 4, (2 : ℕ) • ((2 : ℕ) • x) = 0) ∧
    divisibleSubgroup (ℚ × ZMod 4) = (⊤ : AddSubgroup ℚ).prod ⊥ := by
  refine ⟨divisibleSubgroup_eq_bot_of_finite _, ?_, by decide, ?_⟩
  · intro h
    have htwo : (2 : ZMod 4) ∈ (2 : ℕ) • (⊤ : AddSubgroup (ZMod 4)) := by
      rw [AddSubgroup.mem_smul_pointwise_iff_exists]
      exact ⟨1, trivial, by decide⟩
    rw [h] at htwo
    exact (by decide : (2 : ZMod 4) ≠ 0) htwo
  · ext x
    simp only [AddSubgroup.mem_prod, AddSubgroup.mem_top, AddSubgroup.mem_bot, true_and]
    constructor
    · intro hx
      obtain ⟨y, hy⟩ := (mem_divisibleSubgroup_iff _).mp hx 4 (by decide)
      have hz : (4 : ℕ) • y.2 = x.2 := by
        simpa using congrArg Prod.snd hy
      have hy0 : (4 : ℕ) • y.2 = (0 : ZMod 4) := by
        rw [nsmul_eq_mul, ZMod.natCast_self, zero_mul]
      exact hz.symm.trans hy0
    · intro hx
      rw [mem_divisibleSubgroup_iff]
      intro m hm
      refine ⟨(x.1 / m, 0), ?_⟩
      apply Prod.ext
      · change (m : ℚ) * (x.1 / (m : ℚ)) = x.1
        exact mul_div_cancel₀ _ (by exact_mod_cast (show m ≠ 0 by omega))
      · simpa using hx.symm

/-- The integers have no nonzero element divisible by every positive integer. -/
theorem divisibleSubgroup_int : divisibleSubgroup ℤ = ⊥ := by
  rw [eq_bot_iff]
  intro x hx
  simp only [divisibleSubgroup, AddSubgroup.mem_iInf,
    AddSubgroup.mem_smul_pointwise_iff_exists, AddSubgroup.mem_top, true_and] at hx
  obtain ⟨y, hy⟩ := hx (x.natAbs + 1) (by omega)
  rw [AddSubgroup.mem_bot]
  refine Int.eq_zero_of_abs_lt_dvd (m := |x| + 1) ⟨y, ?_⟩ (lt_add_one _)
  rw [nsmul_eq_mul] at hy
  push_cast at hy
  exact hy.symm

/-- Homomorphisms carry ambient roots to ambient roots. -/
theorem divisibleSubgroup_map_le {B : Type*} [AddCommGroup B] (f : A →+ B) :
    (divisibleSubgroup A).map f ≤ divisibleSubgroup B := by
  rintro _ ⟨x, hx, rfl⟩
  have hx := (mem_divisibleSubgroup_iff A).mp hx
  rw [mem_divisibleSubgroup_iff]
  intro m hm
  obtain ⟨y, hy⟩ := hx m hm
  exact ⟨f y, by rw [← map_nsmul, hy]⟩

end DivisibleElements

/-- A finite-support tuple has infinite height exactly when all of its coordinates do. -/
theorem divisibleSubgroup_directSum {ι : Type*} (B : ι → Type*)
    [∀ i, AddCommGroup (B i)] (x : ⨁ i, B i) :
    x ∈ divisibleSubgroup (⨁ i, B i) ↔ ∀ i, x i ∈ divisibleSubgroup (B i) := by
  sorry

/-- Slot (cohomological degree, twist) for the positive/negative piece of degree 2j.
`positive = true` means the +1 eigenspace of dualization, not complex conjugation. -/
def bottCohomologySlot (j : ℤ) (positive : Bool) : ℕ × ℤ :=
  if positive = decide (Even j) then (0, j) else (2, j + 1)

/-- Both slots contribute to the same integer Bott degree 2j. -/
theorem bottCohomologySlot_totalDegree (j : ℤ) (positive : Bool) :
    2 * (bottCohomologySlot j positive).2 -
      ((bottCohomologySlot j positive).1 : ℤ) = 2 * j := by
  unfold bottCohomologySlot
  split_ifs <;> simp
  omega

/-- The two signs at j = 0 select opposite cohomological rows. -/
example : bottCohomologySlot 0 true = (0, 0) ∧
    bottCohomologySlot 0 false = (2, 1) := by decide

/-- Negative degrees and the positive j = 1 slot test integer twists and dualization. -/
example : bottCohomologySlot (-1) true = (2, 0) ∧
    bottCohomologySlot (-1) false = (0, -1) ∧
    bottCohomologySlot 1 true = (2, 2) := by decide

/-- Dualization sign is the parity of the selected Tate twist. -/
theorem bottCohomologySlot_sign (j : ℤ) (positive : Bool) :
    positive = decide (Even (bottCohomologySlot j positive).2) := by
  by_cases hj : Even j <;> cases positive <;>
    simp [bottCohomologySlot, hj]
  exact Int.not_even_iff_odd.mp hj

/-- Raising j by two preserves cohomological degree and raises the twist by two. -/
theorem bottCohomologySlot_period (j : ℤ) (positive : Bool) :
    bottCohomologySlot (j + 2) positive =
      ((bottCohomologySlot j positive).1, (bottCohomologySlot j positive).2 + 2) := by
  simp [bottCohomologySlot]
  split_ifs <;> simp
  omega

/-- The positive even-degree two-rank table, totalized by zero at odd degrees.
Arithmetic use requires dyadic S, a real place and n > 0; README §6.4. -/
def evenTwoRank (r s t j n : ℕ) : ℕ :=
  if n % 8 = 2 then r + s + t - 1
  else if n % 8 = 4 ∨ n % 8 = 6 then j + s + t - 1
  else if n % 8 = 0 then s + t - 1 else 0

/-- Increasing s with r, t and j fixed adds one at every even numerical input. -/
theorem evenTwoRank_add_prime (r s t j n : ℕ) (hs : 1 ≤ s) (hn : Even n) :
    evenTwoRank r (s + 1) t j n = evenTwoRank r s t j n + 1 := by
  obtain ⟨m, rfl⟩ := hn
  unfold evenTwoRank
  split_ifs <;> omega

/-- The rational even two-rank includes its real contribution only in residue two. -/
example : evenTwoRank 1 1 0 0 2 = 1 ∧ evenTwoRank 1 1 0 0 4 = 0 ∧
    evenTwoRank 1 1 0 0 6 = 0 ∧ evenTwoRank 1 1 0 0 8 = 0 := by
  decide

/-- The real quadratic row and zero-input boundary test the defect and natural subtraction. -/
example : evenTwoRank 2 1 0 1 2 = 2 ∧ evenTwoRank 2 1 0 1 4 = 1 ∧
    evenTwoRank 2 1 0 1 6 = 1 ∧ evenTwoRank 2 1 0 1 8 = 0 ∧
    evenTwoRank 2 2 0 0 4 = 1 ∧
    evenTwoRank 0 1 0 0 0 = 0 ∧ evenTwoRank 0 0 0 0 0 = 0 := by
  decide

/-- The degree-two residue branch retains the real-place contribution. -/
theorem evenTwoRank_residue_two (r s t j n : ℕ) (hn : n % 8 = 2) :
    evenTwoRank r s t j n = r + s + t - 1 := by
  simp [evenTwoRank, hn]

/-- The totalized numerical two-rank table has period eight. -/
theorem evenTwoRank_periodic (r s t j n : ℕ) :
    evenTwoRank r s t j (n + 8) = evenTwoRank r s t j n := by
  simp [evenTwoRank]

/-- Matched upper and lower finite orders certify a presentation of an abelian group. -/
structure OrderCertificate (A : Type*) [AddCommGroup A] where
  /-- Finite linear generators and relations over the integers. -/
  rel : Module.Relations.{0, 0} ℤ
  /-- Finiteness of the generator index. -/
  [finiteGenerators : Finite rel.G]
  /-- Finiteness of the relation index. -/
  [finiteRelations : Finite rel.R]
  /-- The specified solution in the group to be presented. -/
  solution : rel.Solution A
  /-- The specified generator images span the group. -/
  span_eq_top : Submodule.span ℤ (Set.range solution.var) = ⊤
  /-- Finiteness of the upper presentation quotient. -/
  [finiteUpper : Finite rel.Quotient]
  /-- The lower quotient group. -/
  B : Type
  /-- The lower quotient's abelian group structure. -/
  [groupB : AddCommGroup B]
  /-- Finiteness of the lower quotient. -/
  [finiteB : Finite B]
  /-- The map realizing the lower quotient. -/
  lower : A →+ B
  /-- Surjectivity gives the lower order bound. -/
  lower_surjective : Function.Surjective lower
  /-- Equality of the two finite bounds. -/
  card_match : Nat.card B = Nat.card rel.Quotient

attribute [instance] OrderCertificate.finiteGenerators OrderCertificate.finiteRelations
  OrderCertificate.finiteUpper OrderCertificate.groupB OrderCertificate.finiteB

/-- The spanning solution in a matched certificate is its actual presentation. -/
theorem OrderCertificate.isPresentation {A : Type*} [AddCommGroup A]
    (cert : OrderCertificate A) : cert.solution.IsPresentation := by
  sorry

/-- An empty presentation gives a matching certificate for the zero abelian group. -/
example : Nonempty (OrderCertificate (Fin 0 →₀ ℤ)) := by
  let rel : Module.Relations.{0, 0} ℤ :=
    { G := Fin 0, R := Fin 0, relation := fun i => Fin.elim0 i }
  let sol : rel.Solution (Fin 0 →₀ ℤ) :=
    { var := fun i => Fin.elim0 i
      linearCombination_var_relation := fun i => Fin.elim0 i }
  have : Subsingleton rel.Quotient := by
    dsimp [Module.Relations.Quotient, rel]
    infer_instance
  exact ⟨{ rel := rel, solution := sol, span_eq_top := Subsingleton.elim _ _
           B := Fin 0 →₀ ℤ, lower := AddMonoidHom.id _, lower_surjective := Function.surjective_id
           card_match := by simp }⟩

/-- A spanning relation 4g = 0 on Z/2 cannot have a matching lower quotient of order four. -/
example : ¬ ∃ cert : OrderCertificate (ZMod 2), Nat.card cert.rel.Quotient = 4 := by
  rintro ⟨cert, hc⟩
  have hbound := Nat.card_le_card_of_surjective cert.lower cert.lower_surjective
  rw [cert.card_match, hc] at hbound
  norm_num [Nat.card_eq_fintype_card] at hbound

/-! ## Layer 7: Bernoulli numbers and regular primes -/

/-- Translation of Weibel's positive, reindexed Bernoulli convention for k>=1. -/
def bernoulliTop (k : ℕ) : ℚ := (-1) ^ (k + 1) * bernoulli (2 * k)

/-- The positive indexing begins at one and has a separate totalized value at zero. -/
example : bernoulliTop 1 = 1 / 6 ∧ bernoulliTop 0 = -1 ∧ bernoulli' 1 = 1 / 2 := by
  norm_num [bernoulliTop, bernoulli_two]

/-- Values at indices two, five and six pin the positive indexing and divided cancellation. -/
example : bernoulliTop 2 = 1 / 30 ∧ bernoulliTop 5 = 5 / 66 ∧
    bernoulliTop 6 = 691 / 2730 ∧ bernoulli (2 * 5) / 5 = 1 / 66 := by
  have h5 : bernoulli' 5 = 0 := bernoulli'_eq_zero_of_odd (by decide) (by decide)
  have h6 : bernoulli' 6 = 1 / 42 := by
    rw [bernoulli'_def]
    norm_num [Finset.sum_range_succ, Nat.choose, h5]
  have h7 : bernoulli' 7 = 0 := bernoulli'_eq_zero_of_odd (by decide) (by decide)
  have h8 : bernoulli' 8 = -1 / 30 := by
    rw [bernoulli'_def]
    norm_num [Finset.sum_range_succ, Nat.choose, h5, h6, h7]
  have h9 : bernoulli' 9 = 0 := bernoulli'_eq_zero_of_odd (by decide) (by decide)
  have h10 : bernoulli' 10 = 5 / 66 := by
    rw [bernoulli'_def]
    norm_num [Finset.sum_range_succ, Nat.choose, h5, h6, h7, h8, h9]
  have h11 : bernoulli' 11 = 0 := bernoulli'_eq_zero_of_odd (by decide) (by decide)
  have h12 : bernoulli' 12 = -691 / 2730 := by
    rw [bernoulli'_def]
    norm_num [Finset.sum_range_succ, Nat.choose, h5, h6, h7, h8, h9, h10, h11]
  norm_num [bernoulliTop, bernoulli, h10, h12]

/-- In the positive range the reindexed convention is the absolute arithmetic Bernoulli value. -/
theorem bernoulliTop_eq_abs (k : ℕ) (hk : 1 ≤ k) :
    bernoulliTop k = |bernoulli (2 * k)| := by
  sorry

/-- Used with an explicit prime hypothesis; this never includes Vandiver's condition. -/
def IsRegularPrime (p : ℕ) : Prop :=
  ¬ p ∣ NumberField.classNumber (CyclotomicField p ℚ)

/-- The totalized class-number predicate requires explicit primality in arithmetic theorems. -/
example : IsRegularPrime 0 ∧ ¬ IsRegularPrime 1 := by
  simp [IsRegularPrime, NumberField.classNumber_ne_zero]

/-- The totalized predicate is exactly nondivisibility of the cyclotomic class number. -/
theorem IsRegularPrime.iff_not_dvd_classNumber (p : ℕ) :
    IsRegularPrime p ↔ ¬ p ∣ NumberField.classNumber (CyclotomicField p ℚ) := by
  rfl

/-- Kummer’s finite Bernoulli-numerator criterion for an odd prime; README §7.2. -/
theorem kummer_criterion (p : ℕ) (hp : p.Prime) (hodd : Odd p) :
    ¬ IsRegularPrime p ↔
      ∃ k ∈ Finset.Icc 1 ((p - 3) / 2), (p : ℤ) ∣ (bernoulli (2 * k)).num := by
  sorry

/-- An odd regular prime divides no reduced numerator in the entire divided sequence. -/
theorem IsRegularPrime.dividedBernoulli_num (p : ℕ) (hp : p.Prime) (hodd : Odd p)
    (hreg : IsRegularPrime p) (k : ℕ) (hk : 1 ≤ k) :
    ¬ (p : ℤ) ∣ (bernoulli (2 * k) / (k : ℚ)).num := by
  sorry

/-- Regularity is equivalent to p-indivisibility of every p-power cyclotomic class number. -/
theorem IsRegularPrime.iwasawa (p : ℕ) (hp : p.Prime) (hodd : Odd p) :
    IsRegularPrime p ↔ ∀ r : ℕ, 1 ≤ r →
      ¬ p ∣ NumberField.classNumber (CyclotomicField (p ^ r) ℚ) := by
  sorry

/-- Three is regular: the Bernoulli range in Kummer’s criterion is empty. -/
theorem isRegularPrime_three : IsRegularPrime 3 := by
  sorry

/-- Every prime below 37 is regular, including the separate class-number case p = 2. -/
theorem isRegularPrime_of_lt_37 (p : ℕ) (hp : p.Prime) (hbound : p < 37) :
    IsRegularPrime p := by
  sorry

/-- Kummer’s criterion detects the numerator of B₃₂ at the first irregular prime. -/
theorem not_isRegularPrime_37 : ¬ IsRegularPrime 37 := by
  sorry

end TauCetiRoadmap.ArithmeticKTheory
