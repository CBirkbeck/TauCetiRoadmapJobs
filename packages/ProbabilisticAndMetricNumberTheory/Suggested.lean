/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The Tau Ceti Atlas contributors, Codex
-/
import Mathlib
import TauCeti.Probability.Process.EmpiricalMeasure

/-!
# Probabilistic and metric number theory: representative target signatures

`README.md` is the definitive roadmap. This file is not exhaustive: it records
light definitions and representative milestone signatures expressible using the
pinned Mathlib and Tau Ceti APIs, so contributors can agree on conventions,
names and types. Arithmetic samples contain 1 through m+1; digit indices start
at zero; approximation intervals are closed; short means include both endpoints.
Continued-fraction words compose from left to right as ordered inverse branches.
-/

noncomputable section
open MeasureTheory Filter Set
open scoped BigOperators Topology NNReal ENNReal Classical

namespace TauCetiRoadmap.ProbabilisticAndMetricNumberTheory

namespace Arithmetic

local notation "uLaw" =>
  (fun m : ℕ => (TauCeti.Probability.empiricalMeasure (fun k : ℕ => k + 1) m : Measure ℕ))

/-! ## Layer 0: Arithmetic probability -/
/-- The finite weighted divisibility sum, extended by zero at input zero.
The empty prime sum is zero (`primeDivisibilitySum_empty`), and equal weights on the
index set give equal functions (`primeDivisibilitySum_congr`). Addition of weights is
pointwise addition (`primeDivisibilitySum_add`). On positive coprime products it is additive
(`primeDivisibilitySum_mul_of_coprime`); a positive prime power selects that prime's weight
(`primeDivisibilitySum_prime_pow`). Unit weights over all prime divisors recover native
ω (`primeDivisibilitySum_primeFactors`). -/
def primeDivisibilitySum (P : Finset ℕ) (a : ℕ → ℝ) : ArithmeticFunction ℝ where
  toFun n := if n = 0 then 0 else ∑ p ∈ P, if p ∣ n then a p else 0
  map_zero' := by simp

/-- On positive inputs the zero guard disappears. -/
theorem primeDivisibilitySum_apply (P : Finset ℕ) (a : ℕ → ℝ)
    {n : ℕ} (hn : 0 < n) :
    primeDivisibilitySum P a n = ∑ p ∈ P, if p ∣ n then a p else 0 := by
  simp [primeDivisibilitySum, hn.ne']

/-- The centered empirical second moment differs from the Bernoulli variance by at most 2L²/N. -/
theorem primeDivisibilitySum_secondMoment_error (m : ℕ) (P : Finset ℕ)
    (a : ℕ → ℝ) (hP : ∀ p ∈ P, Nat.Prime p) :
    let A : ℝ := ∑ p ∈ P, a p / (p : ℝ)
    let L : ℝ := ∑ p ∈ P, |a p|
    let V : ℝ := ∑ p ∈ P, (a p) ^ 2 * (1 / (p : ℝ) - 1 / (p : ℝ) ^ 2)
    |(∫ n, (primeDivisibilitySum P a n - A) ^ 2 ∂(uLaw m)) - V| ≤
      2 * L ^ 2 / ((m + 1 : ℕ) : ℝ) := by
  sorry

/-- A complete prime period gives the exact Bernoulli second moment. -/
theorem primeDivisibilitySum_secondMoment_completePeriod (m : ℕ) (P : Finset ℕ)
    (a : ℕ → ℝ) (hP : ∀ p ∈ P, Nat.Prime p)
    (hperiod : (∏ p ∈ P, p) ∣ m + 1) :
    (∫ n, (primeDivisibilitySum P a n - ∑ p ∈ P, a p / (p : ℝ)) ^ 2 ∂(uLaw m)) =
      ∑ p ∈ P, (a p) ^ 2 * (1 / (p : ℝ) - 1 / (p : ℝ) ^ 2) := by
  sorry

/-- Summed absolute atom errors are at most 3 to the number of primes divided by sample size. -/
theorem divisibility_pattern_summed_error (m : ℕ) (P : Finset ℕ)
    (hP : ∀ p ∈ P, Nat.Prime p) :
    (∑ S ∈ P.powerset,
      |((uLaw m) {n : ℕ | (∀ p ∈ S, p ∣ n) ∧ (∀ q ∈ P \ S, ¬ q ∣ n)}).toReal -
        (∏ p ∈ S, 1 / (p : ℝ)) * (∏ q ∈ P \ S, (1 - 1 / (q : ℝ)))|) ≤
      (3 : ℝ) ^ P.card / ((m + 1 : ℕ) : ℝ) := by
  sorry

/-- A complete coprime residue period has uniform joint atoms, including composite moduli. -/
theorem crt_complete_period_law {ι : Type*} [Fintype ι] [DecidableEq ι] (m : ℕ)
    (q : ι → ℕ) [∀ i, NeZero (q i)]
    (hcop : Pairwise (fun i j => Nat.Coprime (q i) (q j)))
    (hperiod : (∏ i, q i) ∣ m + 1) (a : ∀ i, ZMod (q i)) :
    ((uLaw m) {n : ℕ | ∀ i, (n : ZMod (q i)) = a i}).toReal =
      ∏ i, 1 / (q i : ℝ) := by sorry

/-- The sharp residue event error bounds any bounded real statistic by its oscillation. -/
theorem crt_statistic_error {ι : Type*} [Fintype ι] [DecidableEq ι] (m : ℕ)
    (q : ι → ℕ) [∀ i, NeZero (q i)]
    (hcop : Pairwise (fun i j => Nat.Coprime (q i) (q j)))
    (F : (∀ i, ZMod (q i)) → ℝ) (L U : ℝ) (hLU : L ≤ U)
    (hF : ∀ a, L ≤ F a ∧ F a ≤ U) :
    |(∫ n : ℕ, F (fun i => (n : ZMod (q i))) ∂uLaw m) -
      (∏ i, 1 / (q i : ℝ)) * ∑ a, F a| ≤
      (U - L) * ((m + 1) % (∏ i, q i) : ℕ) *
        (((∏ i, q i : ℕ) : ℝ) - ((m + 1) % (∏ i, q i) : ℕ)) /
        ((m + 1 : ℕ) * ((∏ i, q i : ℕ) : ℝ)) := by sorry

/-- Arithmetic weak convergence is equivalent to convergence of every characteristic function value. -/
theorem arithmetic_levy_criterion (f : ℕ → ℕ → ℝ)
    (ν : Measure ℝ) [IsProbabilityMeasure ν] :
    TendstoInDistribution f atTop (fun x : ℝ => x) uLaw ν ↔
      ∀ t : ℝ, Tendsto (fun m =>
        (∑ k ∈ Finset.range (m+1), Complex.exp
          (((t * f m (k+1) : ℝ) : ℂ) * Complex.I)) / (m+1 : ℕ))
        atTop (𝓝 (charFun ν t)) := by sorry

local notation "factorExcess" => (fun n : ℕ =>
  (ArithmeticFunction.cardFactors n : ℝ) - ArithmeticFunction.cardDistinctFactors n)

/-- The repeated-prime-factor excess has a uniform exponential moment. -/
theorem excess_exponential_mean (m : ℕ) :
    (∫ n : ℕ, Real.exp (Real.log (3/2)*factorExcess n) ∂uLaw m) ≤
      Real.exp 2 := by sorry

/-- The exponential estimate bounds every fixed absolute moment of Ω−ω. -/
theorem excess_all_moments (m k : ℕ) :
    (∫ n : ℕ, |factorExcess n|^k ∂uLaw m) ≤
      Real.exp 2 * (k.factorial : ℝ) / (Real.log (3/2))^k := by sorry

/-- Exponential Markov gives the stated real-threshold tail bound. -/
theorem excess_exponential_tail (m : ℕ) (t : ℝ) :
    ((uLaw m) {n : ℕ | t ≤ factorExcess n}).toReal ≤
      Real.exp (2 - Real.log (3/2)*t) := by sorry

/-- A scale tending to infinity transfers every probability limit between ω and Ω. -/
theorem excess_distribution_transfer (b s : ℕ → ℝ) (hs : Tendsto s atTop atTop)
    (ν : Measure ℝ) [IsProbabilityMeasure ν] :
    TendstoInDistribution
      (fun m n => ((ArithmeticFunction.cardDistinctFactors n : ℝ)-b m)/s m)
      atTop (fun x : ℝ => x) uLaw ν ↔
    TendstoInDistribution
      (fun m n => ((ArithmeticFunction.cardFactors n : ℝ)-b m)/s m)
      atTop (fun x : ℝ => x) uLaw ν := by sorry

/-- Unit weights count distinct divisors at twelve, and a finite set removes repeated indices. -/
example : primeDivisibilitySum {2, 3} (fun _ => 1) 12 = 2 ∧
    primeDivisibilitySum {2, 2, 3} (fun p => (p : ℝ)) 12 = 5 ∧
    primeDivisibilitySum {2, 3} (fun p => (p : ℝ)) 1 = 0 := by
  constructor
  · change (if (12 : ℕ) = 0 then (0 : ℝ) else
      ∑ p ∈ ({2,3} : Finset ℕ), if p ∣ 12 then (1 : ℝ) else 0) = 2
    rw [ite_eq_right (by decide), Finset.sum_pair (by decide)]
    norm_num
  · norm_num [primeDivisibilitySum]

/-- zero_extension: an unguarded sum would give 5. -/
example : primeDivisibilitySum {2, 3} (fun p => (p : ℝ)) 0 = 0 := by
  simp [primeDivisibilitySum]


end Arithmetic

namespace MetricNumberTheory

-- Coprime additivity and strict-interval concentration.
/-- Coprime positive products become sums; input one has value zero.
The unit value is zero (`IsAdditive.map_one`), and positive coprime products
are sent to sums (`IsAdditive.map_mul`). -/
def IsAdditive {R : Type*} [AddCommMonoid R] (f : ArithmeticFunction R) : Prop :=
  f 1 = 0 ∧ ∀ m n : ℕ, 0 < m → 0 < n → m.Coprime n → f (m*n) = f m + f n

/-- An additive function is strongly additive when positive prime powers have their prime value.
Positive prime powers retain the prime value (`IsStronglyAdditive.prime_pow`). -/
def IsStronglyAdditive {R : Type*} [AddCommMonoid R] (f : ArithmeticFunction R) : Prop :=
  IsAdditive f ∧ ∀ p k : ℕ, p.Prime → 0 < k → f (p^k) = f p

/-- The supremal mass of strict intervals of radius δ; nonpositive radii give zero.
Every value is between zero and one (`concentration_bounds`), and increasing the
radius increases the supremum (`concentration_mono`). Translation leaves it fixed
(`concentration_translate`); dilation by a≠0 divides the radius by |a|
(`concentration_scale`). -/
def concentration (ν : ProbabilityMeasure ℝ) (δ : ℝ) : ℝ :=
  sSup {v : ℝ | ∃ u : ℝ, v = (ν : Measure ℝ).real (Set.Ioo (u-δ) (u+δ))}

/-- Independent real summands satisfy the equal-radius concentration bound when the denominator is positive. -/
theorem kolmogorov_rogozin : ∃ C : ℝ, 0 < C ∧
    ∀ (Ω : Type*) [MeasurableSpace Ω] (μ : ProbabilityMeasure Ω) (k : ℕ) (X : Fin k → Ω → ℝ)
      (hX : ∀ j, AEMeasurable (X j) (μ : Measure Ω))
      (hi : ProbabilityTheory.iIndepFun X (μ : Measure Ω)) (δ : ℝ) (hδ : 0 < δ),
      let D := ∑ j, (1 - concentration (μ.map (X j)) δ)
      0 < D → concentration (μ.map (fun ω => ∑ j, X j ω)) δ ≤ C / Real.sqrt D := by sorry

/-- Weak convergence of real probability laws is tested at continuity points of the limiting CDF. -/
theorem cdf_weak_criterion (νs : ℕ → ProbabilityMeasure ℝ) (ν : ProbabilityMeasure ℝ) :
    Tendsto νs atTop (𝓝 ν) ↔
      ∀ x : ℝ, ContinuousAt (ProbabilityTheory.cdf (ν : Measure ℝ)) x →
        Tendsto (fun m => ProbabilityTheory.cdf (νs m : Measure ℝ) x) atTop
          (𝓝 (ProbabilityTheory.cdf (ν : Measure ℝ) x)) := by sorry

/-- Growing-prime valuation vectors approach the specified independent geometric model in total variation. -/
theorem kubilius_small_prime_model (β : ℕ → ℝ)
    (hβ : ∀ N, 0 < β N) (hβinf : Tendsto β atTop atTop)
    (ν : (N : ℕ) → ProbabilityMeasure
      ({p // p ∈ Nat.primesLE ⌊Real.rpow (N:ℝ) ((β N)⁻¹)⌋₊} → ℕ))
    (hν : ∀ (N : ℕ) (v : ({p // p ∈ Nat.primesLE ⌊Real.rpow (N:ℝ) ((β N)⁻¹)⌋₊} → ℕ)), (ν N : Measure ({p // p ∈ Nat.primesLE ⌊Real.rpow (N:ℝ) ((β N)⁻¹)⌋₊} → ℕ)).real {v} =
      ∏ p : {p // p ∈ Nat.primesLE ⌊Real.rpow (N:ℝ) ((β N)⁻¹)⌋₊},
        (1-1/(p:ℝ)) / (p:ℝ)^(v p)) :
    ∃ C δ : ℝ, 0 < C ∧ 0 < δ ∧ ∀ᶠ N : ℕ in atTop,
      (1/2:ℝ) * ∑' v : ({p // p ∈ Nat.primesLE ⌊Real.rpow (N:ℝ) ((β N)⁻¹)⌋₊} → ℕ),
        |(((Finset.Icc 1 N).filter (fun n => ∀ p, n.factorization p = v p)).card : ℝ)/(N:ℝ) -
          (ν N : Measure ({p // p ∈ Nat.primesLE ⌊Real.rpow (N:ℝ) ((β N)⁻¹)⌋₊} → ℕ)).real {v}| ≤ C*Real.exp (-δ*β N) := by sorry

/-- Native distinct counting is strongly additive; repeated counting is additive. -/
example : IsStronglyAdditive ArithmeticFunction.cardDistinctFactors ∧
    IsAdditive ArithmeticFunction.cardFactors := by
  constructor
  · refine ⟨⟨by simp, ?_⟩, ?_⟩
    · intro m n _ _ h
      exact ArithmeticFunction.cardDistinctFactors_mul h
    · intro p k hp hk
      rw [ArithmeticFunction.cardDistinctFactors_apply_prime_pow hp hk.ne',
        ArithmeticFunction.cardDistinctFactors_apply_prime hp]
  · refine ⟨by simp, ?_⟩
    intro m n hm hn _
    exact ArithmeticFunction.cardFactors_mul hm.ne' hn.ne'

/-- The convolution unit is not additive, and repeated prime factors prevent strong additivity. -/
example : ¬ IsAdditive (1 : ArithmeticFunction ℕ) ∧
    ¬ IsStronglyAdditive ArithmeticFunction.cardFactors := by
  constructor
  · intro h
    simpa using h.1
  · intro h
    have hp := h.2 2 2 Nat.prime_two (by decide)
    norm_num [ArithmeticFunction.cardFactors_apply_prime_pow,
      ArithmeticFunction.cardFactors_apply_prime] at hp

/-- Strict zero-radius intervals have zero concentration. -/
example (ν : ProbabilityMeasure ℝ) : concentration ν 0 = 0 := by
  simp [concentration]

/-- A positive-radius interval can capture the full Dirac mass, distinguishing concentration from zero. -/
example (x δ : ℝ) (hδ : 0 < δ) : concentration (diracProba x) δ = 1 := by
  have hx : x ∈ Set.Ioo (x-δ) (x+δ) := by constructor <;> linarith
  unfold concentration
  apply le_antisymm
  · refine csSup_le ⟨1, x, ?_⟩ ?_
    · simp [diracProba, Measure.real, hx]
    · rintro v ⟨u, rfl⟩
      exact measureReal_le_one
  · apply le_csSup
    · refine ⟨1, ?_⟩
      rintro v ⟨u, rfl⟩
      exact measureReal_le_one
    · refine ⟨x, ?_⟩
      simp [diracProba, Measure.real, hx]

/-- Positive-radius Dirac concentration and the strict half-radius two-atom boundary. -/
theorem concentration_boundary_values :
    (∀ x δ : ℝ, 0 < δ → concentration (diracProba x) δ = 1) ∧
    (∀ ν : ProbabilityMeasure ℝ,
      (ν : Measure ℝ) = (1/2 : ℝ≥0∞) • Measure.dirac 0 +
        (1/2 : ℝ≥0∞) • Measure.dirac 1 → concentration ν (1/2) = 1/2) := by sorry

/-! ## Layer 1: Additive limit laws -/


/-- The full prime-power center and quadratic size give the Turán–Kubilius bound with constant 30. -/
theorem turan_kubilius (f : ArithmeticFunction ℝ) (hf : IsAdditive f) (N : ℕ) (hN : 2 ≤ N) :
    let A := ∑ p ∈ Nat.primesLE N, ∑ k ∈ Finset.Icc 1 N,
      if p^k ≤ N then f (p^k)/(p^k : ℕ) else 0
    let B := ∑ p ∈ Nat.primesLE N, ∑ k ∈ Finset.Icc 1 N,
      if p^k ≤ N then (f (p^k))^2/(p^k : ℕ) else 0
    ∑ n ∈ Finset.Icc 1 N, (f n-A)^2 ≤ 30*(N:ℝ)*B := by sorry

/-- Both prime-factor counting functions have normal order log log N. -/
theorem hardy_ramanujan (ε : ℝ) (hε : 0 < ε) :
    Tendsto (fun N : ℕ =>
      ((Finset.Icc 1 N).filter (fun n =>
        ε * Real.log (Real.log N) < |(ArithmeticFunction.cardDistinctFactors n : ℝ) - Real.log (Real.log N)|)).card / (N : ℝ))
      atTop (𝓝 0) ∧
    Tendsto (fun N : ℕ =>
      ((Finset.Icc 1 N).filter (fun n =>
        ε * Real.log (Real.log N) < |(ArithmeticFunction.cardFactors n : ℝ) - Real.log (Real.log N)|)).card / (N : ℝ))
      atTop (𝓝 0) := by sorry

/-- All raw moments converging to Gaussian moments imply weak convergence, without a uniform tail hypothesis. -/
theorem gaussian_weak_convergence_of_moments (μ : ℕ → ProbabilityMeasure ℝ)
    (hfinite : ∀ n k : ℕ, Integrable (fun x : ℝ => |x|^k) (μ n : Measure ℝ))
    (hmom : ∀ k : ℕ, Tendsto (fun n => ∫ x : ℝ, x^k ∂(μ n : Measure ℝ))
      atTop (𝓝 (∫ x : ℝ, x^k ∂ProbabilityTheory.gaussianReal 0 1))) :
    Tendsto μ atTop (𝓝 (⟨ProbabilityTheory.gaussianReal 0 1, inferInstance⟩ :
      ProbabilityMeasure ℝ)) := by sorry

/-- The conditional second moment in the specified thin squarefree family has the half-log-log center. -/
theorem restricted_squarefree_second_moment : ∃ C : ℝ, 0 < C ∧ ∃ N₀ : ℕ, ∀ N ≥ N₀,
    ∀ (D : Finset ℕ)
      (hD : ∀ n, n ∈ D ↔ 0 < n ∧ n < N ∧ Squarefree n ∧
        ∀ p ∈ n.primeFactors, p % 4 = 1 ∨ p % 4 = 2),
    (∑ n ∈ D, ((ArithmeticFunction.cardDistinctFactors n : ℝ) -
      (1/2)*Real.log (Real.log N))^2) ≤ C * D.card * Real.log (Real.log N) := by sorry

/-- The normalized ω and Ω laws converge to the standard Gaussian CDF. -/
theorem erdos_kac (x : ℝ) :
    Tendsto (fun N : ℕ =>
      ((Finset.Icc 1 N).filter (fun n =>
        ((ArithmeticFunction.cardDistinctFactors n : ℝ)-Real.log (Real.log N)) /
          Real.sqrt (Real.log (Real.log N)) ≤ x)).card / (N:ℝ))
      atTop (𝓝 (ProbabilityTheory.cdf (ProbabilityTheory.gaussianReal 0 1) x)) ∧
    Tendsto (fun N : ℕ =>
      ((Finset.Icc 1 N).filter (fun n =>
        ((ArithmeticFunction.cardFactors n : ℝ)-Real.log (Real.log N)) /
          Real.sqrt (Real.log (Real.log N)) ≤ x)).card / (N:ℝ))
      atTop (𝓝 (ProbabilityTheory.cdf (ProbabilityTheory.gaussianReal 0 1) x)) := by sorry

/-- The specified thin squarefree family has its separate half-log-log center and relative window estimate. -/
theorem restricted_squarefree_window : ∃ C : ℝ, 0 < C ∧ ∃ N₀ : ℕ, ∀ N ≥ N₀,
    ∀ (D : Finset ℕ)
      (hD : ∀ n, n ∈ D ↔ 0 < n ∧ n < N ∧ Squarefree n ∧
        ∀ p ∈ n.primeFactors, p % 4 = 1 ∨ p % 4 = 2),
    ((D.filter (fun n => Real.rpow (Real.log (Real.log N)) (2/3) ≤
      |(ArithmeticFunction.cardDistinctFactors n : ℝ) - (1/2)*Real.log (Real.log N)|)).card : ℝ) ≤
      C * D.card / Real.rpow (Real.log (Real.log N)) (1/100) := by sorry

end MetricNumberTheory

namespace Equidistribution

/-! ## Layer 2: Uniform distribution, discrepancy and normal digits -/
/-- Equidistribution is weak convergence of the native successor-indexed empirical probabilities.
Bounded continuous real tests characterize this convergence
(`asympEquidistributed_iff_integral_tendsto`), as do complex tests
(`asympEquidistributed_iff_integral_tendsto_complex`). Null-frontier events have their limiting
frequencies (`AsympEquidistributed.tendsto_frequency`), hence every smaller real bound eventually
holds (`AsympEquidistributed.eventually_frequency_ge`). Finite changes preserve the law
(`AsympEquidistributed.congr_of_eventuallyEq`); a constant sequence has precisely its Dirac law
(`asympEquidistributed_const_iff`). A finite shift of indices preserves equidistribution
(`asympEquidistributed_comp_add_iff`). -/
def AsympEquidistributed {X : Type*} [TopologicalSpace X] [MeasurableSpace X]
    [OpensMeasurableSpace X] (x : ℕ → X) (μ : ProbabilityMeasure X) : Prop :=
  Tendsto (TauCeti.Probability.empiricalMeasure x) atTop (𝓝 μ)

/-- Total equidistribution tests all positive-step arithmetic progressions.
Positive affine reindexing preserves this predicate
(`TotallyAsympEquidistributed.comp_affine`). -/
def TotallyAsympEquidistributed {X : Type*} [TopologicalSpace X] [MeasurableSpace X]
    [OpensMeasurableSpace X] (x : ℕ → X) (μ : ProbabilityMeasure X) : Prop :=
  ∀ q r : ℕ, 0 < q → AsympEquidistributed (fun n => x (q * n + r)) μ

/-- The existing circle Haar measure bundled as a probability measure. -/
def circleHaar : ProbabilityMeasure UnitAddCircle :=
  ⟨AddCircle.haarAddCircle, inferInstance⟩

/-- The native finite product of circle Haar probabilities, including the zero-dimensional torus. -/
def torusHaar (d : Type*) [Fintype d] : ProbabilityMeasure (UnitAddTorus d) :=
  ⟨Measure.pi (fun _ : d => AddCircle.haarAddCircle), by infer_instance⟩

/-- A constant real sequence has its Dirac law on every arithmetic progression. -/
example : AsympEquidistributed (fun _ : ℕ => (0 : ℝ)) (diracProba 0) ∧
    TotallyAsympEquidistributed (fun _ : ℕ => (0 : ℝ)) (diracProba 0) := by
  have h : AsympEquidistributed (fun _ : ℕ => (0 : ℝ)) (diracProba 0) := by
    rw [AsympEquidistributed, ProbabilityMeasure.tendsto_iff_forall_integral_tendsto]
    intro f
    have hi (N : ℕ) : ∫ y, f y ∂(TauCeti.Probability.empiricalMeasure
        (fun _ : ℕ => (0 : ℝ)) N : Measure ℝ) = f 0 := by
      rw [TauCeti.Probability.integral_empiricalMeasure f.continuous.stronglyMeasurable]
      simp [nsmul_eq_mul, smul_eq_mul, ← mul_assoc]
      rw [inv_mul_cancel₀ (by positivity), one_mul]
    simpa only [hi, diracProba, ProbabilityMeasure.coe_mk, integral_dirac] using
      (tendsto_const_nhds : Tendsto (fun _ : ℕ => f 0) atTop (𝓝 (f 0)))
  exact ⟨h, fun _ _ _ => h⟩

/-- The circle normalization agrees with native volume at period one. -/
example : (circleHaar : Measure UnitAddCircle) = volume := by
  simp [circleHaar, AddCircle.volume_eq_smul_haarAddCircle]

/-- The empty torus is a single point carrying probability one. -/
example : (torusHaar (Fin 0) : Measure (UnitAddTorus (Fin 0))) {0} = 1 := by
  have h : ({0} : Set (UnitAddTorus (Fin 0))) = univ := by
    ext x
    simp [Subsingleton.elim x 0]
  rw [h]
  simp

variable {d : Type*} [Fintype d]

/-- Every nonzero integral frequency has nonzero pairing with the torus point.
A nonzero Fourier frequency takes value different from one at this point
(`torusIrrational_iff_mFourier`). On a singleton index the condition is scalar irrationality
(`torusIrrational_unique_iff`). -/
def TorusIrrational (α : UnitAddTorus d) : Prop :=
  ∀ k : d → ℤ, k ≠ 0 → ∑ i, k i • α i ≠ 0

/-- Haar equidistribution is equivalent to vanishing of all nonzero Fourier averages. -/
theorem weyl_criterion (x : ℕ → UnitAddTorus d) :
    AsympEquidistributed x (torusHaar d) ↔ ∀ k : d → ℤ, k ≠ 0 →
      Tendsto (fun n : ℕ => ((n + 1 : ℕ) : ℂ)⁻¹ *
        ∑ i ∈ Finset.range (n + 1), UnitAddTorus.mFourier k (x i)) atTop (𝓝 0) := by
  sorry

/-- A linear torus orbit is equidistributed, totally equidistributed, or irrational in exactly the same cases. -/
theorem linear_equidistribution_tfae (α β : UnitAddTorus d) :
    List.TFAE [AsympEquidistributed (fun n : ℕ => n • α + β) (torusHaar d),
      TotallyAsympEquidistributed (fun n : ℕ => n • α + β) (torusHaar d),
      TorusIrrational α] := by
  sorry

/-- An irrational leading vector gives polynomial torus equidistribution. -/
theorem weyl_polynomial (s : ℕ) (hs : 1 ≤ s) (α : ℕ → UnitAddTorus d)
    (hα : TorusIrrational (α s)) :
    AsympEquidistributed (fun n : ℕ => ∑ j ∈ Finset.range (s + 1), (n ^ j) • α j)
      (torusHaar d) := by
  sorry

/-- Every nonzero integer frequency detects a nonconstant coefficient, equivalently Haar equidistribution. -/
theorem polynomial_equidistribution_iff (s : ℕ) (hs : 1 ≤ s)
    (α : ℕ → UnitAddTorus d) :
    AsympEquidistributed (fun n : ℕ => ∑ j ∈ Finset.range (s+1), (n^j) • α j)
      (torusHaar d) ↔
    ∀ k : d → ℤ, k ≠ 0 → ∃ j ∈ Finset.Icc 1 s, ∑ i, k i • α j i ≠ 0 := by sorry

/-- The same coefficient criterion characterizes equidistribution on every positive-step progression. -/
theorem polynomial_total_equidistribution_iff (s : ℕ) (hs : 1 ≤ s)
    (α : ℕ → UnitAddTorus d) :
    TotallyAsympEquidistributed (fun n : ℕ => ∑ j ∈ Finset.range (s+1), (n^j) • α j)
      (torusHaar d) ↔
    ∀ k : d → ℤ, k ≠ 0 → ∃ j ∈ Finset.Icc 1 s, ∑ i, k i • α j i ≠ 0 := by sorry

/-- Circle equidistribution agrees with half-open interval frequencies and the scalar Fourier criterion. -/
theorem uniformDistribution_mod_one_tfae (u : ℕ → ℝ) :
    List.TFAE [AsympEquidistributed (fun n => (u n : UnitAddCircle)) circleHaar,
      ∀ a b : ℝ, 0 ≤ a → a ≤ b → b ≤ 1 →
        Tendsto (fun n : ℕ => (((Finset.range (n + 1)).filter
          (fun i => Int.fract (u i) ∈ Set.Ico a b)).card : ℝ) / (n + 1)) atTop (𝓝 (b - a)),
      ∀ k : ℤ, k ≠ 0 → Tendsto (fun n : ℕ => ((n + 1 : ℕ) : ℂ)⁻¹ *
        ∑ i ∈ Finset.range (n + 1), fourier k (u i : UnitAddCircle)) atTop (𝓝 0)] := by
  sorry

/-- A constant circle orbit has Dirac law and cannot approach Haar probability. -/
theorem zero_not_equidistributed_haar :
    ¬ AsympEquidistributed (fun _ : ℕ => (0 : UnitAddCircle)) circleHaar := by sorry


/-- The empty torus has no nonzero integral frequencies. -/
example : TorusIrrational (0 : UnitAddTorus (Fin 0)) := by
  intro k hk
  exact False.elim (hk (Subsingleton.elim _ _))

/-- A zero one-dimensional vector fails the character test. -/
example : ¬ TorusIrrational (0 : UnitAddTorus (Fin 1)) := by
  intro h
  have hh := h (fun _ => 1) (by decide)
  simp at hh

end Equidistribution

namespace MetricNumberTheory

-- Strict initial intervals and canonical base digits.
/-- Star discrepancy uses strict initial intervals and has value zero for an empty sample.
Its value lies in [0,1] for unit-interval observations (`starDiscrepancy_bounds`)
and is invariant under a permutation of observations (`starDiscrepancy_perm`). Moving every
observation by at most ε changes discrepancy by at most ε (`starDiscrepancy_perturb`). -/
def starDiscrepancy {N : ℕ} (x : Fin N → ℝ) : ℝ :=
  if N = 0 then 0 else sSup {v : ℝ | ∃ t ∈ Set.Icc (0:ℝ) 1,
    v = |((Finset.univ.filter (fun j => x j < t)).card : ℝ)/(N:ℝ)-t|}


/-- Empty sample discrepancy is defined separately from a quotient by zero. -/
example (x : Fin 0 → ℝ) : starDiscrepancy x = 0 := by simp [starDiscrepancy]

/-- Strict initial intervals give the two distinct singleton discrepancies. -/
theorem starDiscrepancy_singletons :
    starDiscrepancy (fun _ : Fin 1 => (0 : ℝ)) = 1 ∧
    starDiscrepancy (fun _ : Fin 1 => (1/2 : ℝ)) = 1/2 := by sorry

/-- The one-dimensional Fourier discrepancy estimate with an explicit sufficient constant. -/
theorem erdos_turan {N H : ℕ} (hN : 0 < N) (hH : 0 < H) (x : Fin N → ℝ)
    (hx : ∀ j, x j ∈ Set.Ico (0:ℝ) 1) :
    starDiscrepancy x ≤ 3 / ((H:ℝ)+1) +
      3 * ∑ h ∈ Finset.Icc 1 H,
        ‖(∑ j : Fin N, Complex.exp (2*Real.pi*Complex.I*(h:ℂ)*(x j:ℂ))) / (N:ℂ)‖ / (h:ℝ) := by sorry

/-- Bounded variation controls the quadrature error by star discrepancy. -/
theorem koksma {N : ℕ} (hN : 0 < N) (x : Fin N → ℝ)
    (hx : ∀ j, x j ∈ Set.Ico (0:ℝ) 1) (f : ℝ → ℝ) (hf : BoundedVariationOn f (Set.Icc 0 1)) :
    |(∑ j, f (x j))/(N:ℝ) - ∫ t in Set.Icc (0:ℝ) 1, f t| ≤
      (eVariationOn f (Set.Icc 0 1)).toReal * starDiscrepancy x := by sorry

/-- Canonical overlapping digit blocks have the uniform limiting frequency, for bases at least two.
The empty block occurs at every index and has limiting frequency one
(`IsNormalBase.empty_block`). -/
def IsNormalBase (b : ℕ) [NeZero b] (x : ℝ) : Prop :=
  2 ≤ b ∧ x ∈ Set.Ico (0:ℝ) 1 ∧ ∀ k : ℕ, ∀ w : Fin k → Fin b,
    Tendsto (fun N : ℕ => ((Finset.range N).filter (fun j =>
      ∀ i : Fin k, Real.digits x b (j+i) = w i)).card / (N:ℝ)) atTop (𝓝 ((b:ℝ)^k)⁻¹)


/-- Base one cannot satisfy the normal-base predicate. -/
example (x : ℝ) : ¬ IsNormalBase 1 x := by simp [IsNormalBase]

/-- The terminating native binary expansions of zero and one half are not normal. -/
theorem terminating_binary_not_normal :
    ¬ IsNormalBase 2 0 ∧ ¬ IsNormalBase 2 (1/2) := by sorry

/-- Almost every point of the unit interval is normal in a fixed admissible base. -/
theorem borel_normal {b : ℕ} [NeZero b] (hb : 2 ≤ b) :
    ∀ᵐ x ∂(volume.restrict (Set.Ico (0:ℝ) 1)), IsNormalBase b x := by sorry

/-- Countable intersection gives simultaneous normality in every base at least two. -/
theorem borel_normal_all_bases : ∀ᵐ x ∂(volume.restrict (Set.Ico (0:ℝ) 1)),
    ∀ b : ℕ, ∀ hb : 2 ≤ b, @IsNormalBase b ⟨by omega⟩ x := by sorry

end MetricNumberTheory

namespace DuffinSchaeffer

/-! ## Layer 3: Metric approximation and Hausdorff transference -/
/-- Closed reduced-rational intervals with numerators from one through q, intersected with the unit interval. -/
def dsSet (ψ : ℕ → ℝ) (q : ℕ) : Set ℝ :=
  Set.Icc 0 1 ∩ ⋃ a ∈ (Finset.Icc 1 q).filter (fun a => Nat.Coprime a q),
    Set.Icc ((a : ℝ) / q - ψ q / q) ((a : ℝ) / q + ψ q / q)

/-- Reduced approximation at unbounded denominators, using closed intervals. -/
def dsLimsup (ψ : ℕ → ℝ) : Set ℝ :=
  limsup (dsSet ψ) atTop

/-- Unrestricted approximation permits every numerator from zero through q. -/
def khinchinSet (ψ : ℕ → ℝ) (q : ℕ) : Set ℝ :=
  Set.Icc 0 1 ∩ ⋃ a ∈ Finset.range (q + 1),
    Set.Icc ((a : ℝ) / q - ψ q / q) ((a : ℝ) / q + ψ q / q)

/-- Unrestricted approximation at unbounded denominators. -/
def khinchinLimsup (ψ : ℕ → ℝ) : Set ℝ :=
  limsup (khinchinSet ψ) atTop

/-- Convergence of the reduced totient series gives a null limsup. -/
theorem volume_dsLimsup_eq_zero (ψ : ℕ → ℝ) (hψ : ∀ q, 0 ≤ ψ q)
    (hsum : Summable fun q : ℕ => (q.totient : ℝ) * ψ q / q) : volume (dsLimsup ψ) = 0 := by
  sorry

/-- Divergence of the reduced totient series gives full measure without monotonicity. -/
theorem volume_dsLimsup_eq_one (ψ : ℕ → ℝ) (hψ : ∀ q, 0 ≤ ψ q)
    (hdiv : ¬ Summable fun q : ℕ => (q.totient : ℝ) * ψ q / q) : volume (dsLimsup ψ) = 1 := by
  sorry

/-- The ENNReal multiple-envelope series decides unrestricted approximation, including an infinite envelope. -/
theorem catlin (ψ : ℕ → ℝ) (hψ : ∀ q, 0 ≤ ψ q) :
    let ψstar : ℕ → ℝ≥0∞ := fun q =>
      (q.totient : ℝ≥0∞) * ⨆ n : ℕ, ⨆ (_ : 0 < n ∧ q ∣ n), ENNReal.ofReal (ψ n / n)
    ((∑' q, ψstar q) < ∞ → volume (khinchinLimsup ψ) = 0) ∧
      ((∑' q, ψstar q) = ∞ → volume (khinchinLimsup ψ) = 1) := by
  sorry

/-- The stated qψ(q)-monotone version of Khinchin follows the unrestricted series test. -/
theorem khinchin (ψ : ℕ → ℝ) (hψ : ∀ q, 0 ≤ ψ q)
    (hmono : ∀ q r : ℕ, 1 ≤ q → q ≤ r → (r : ℝ) * ψ r ≤ q * ψ q) :
    (Summable ψ → volume (khinchinLimsup ψ) = 0) ∧
      (¬ Summable ψ → volume (khinchinLimsup ψ) = 1) := by
  sorry

/-- Reduced denominator one retains the right half of the unit interval, with both endpoints. -/
example : dsSet (fun _ => 1 / 2) 1 = Set.Icc (1 / 2) 1 := by
  ext x
  simp only [dsSet]
  norm_num
  constructor
  · rintro ⟨⟨h0, h1⟩, h2, h3⟩
    exact ⟨h2, h1⟩
  · rintro ⟨h0, h1⟩
    constructor <;> constructor <;> linarith

/-- The unit-interval restriction excludes two at every denominator and in the limsup. -/
example (ψ : ℕ → ℝ) : (2 : ℝ) ∉ dsLimsup ψ := by
  norm_num [dsLimsup, mem_limsup_iff_frequently_mem, dsSet]

/-- The unrestricted numerator range includes zero. -/
example : (0 : ℝ) ∈ khinchinSet (fun _ => 0) 1 := by
  norm_num [khinchinSet]
  exact ⟨0, by norm_num, by norm_num⟩

/-- Numerator zero persists at every denominator in the unrestricted zero-radius limsup. -/
example : (0 : ℝ) ∈ khinchinLimsup (fun _ => 0) := by
  rw [khinchinLimsup, mem_limsup_iff_frequently_mem]
  apply Filter.Eventually.frequently
  apply Filter.Eventually.of_forall
  intro q
  refine ⟨⟨by norm_num, by norm_num⟩, ?_⟩
  exact mem_iUnion.mpr ⟨0, mem_iUnion.mpr ⟨by simp, by simp⟩⟩

end DuffinSchaeffer

namespace MetricNumberTheory

-- Native Hausdorff measure uses diameter gauges.
/-- A gauge is continuous, monotone, zero at zero and strictly positive at positive radius.
Continuity and the zero value at the origin give convergence to zero
(`IsDimensionGauge.tendsto_zero`). -/
def IsDimensionGauge (f : ℝ≥0 → ℝ≥0) : Prop :=
  f 0 = 0 ∧ (∀ r, 0 < r → 0 < f r) ∧ Monotone f ∧ Continuous f


/-- Identity and square gauges satisfy positivity and continuity at the origin. -/
example : IsDimensionGauge id ∧ IsDimensionGauge (fun r => r^2) := by
  constructor
  · exact ⟨rfl, fun _ hr => hr, monotone_id, continuous_id⟩
  · exact ⟨by simp, fun _ hr => pow_pos hr 2, monotone_id.pow_const 2,
      continuous_id.pow 2⟩

/-- Zero and constant positive gauges fail different defining conditions. -/
example : ¬ IsDimensionGauge (fun _ => 0) ∧ ¬ IsDimensionGauge (fun _ => 1) := by
  constructor
  · intro h
    have hh := h.2.1 1 (by norm_num)
    norm_num at hh
  · simp [IsDimensionGauge]

/-- Power gauges in the line theorem expand radii below one, and the length gauge fixes them. -/
theorem power_gauge_radius_convention {r s : ℝ} (hr : 0 < r) (hr1 : r < 1)
    (hs : 0 < s) (hs1 : s < 1) :
    IsDimensionGauge (fun t : ℝ≥0 => NNReal.rpow t s) ∧
    r < Real.rpow r s ∧ Real.rpow r 1 = r := by sorry

/-- Expanded-ball local full measure implies infinite power Hausdorff measure for the original limsup. -/
theorem mass_transference_power (s : ℝ) (hs : 0 < s) (hs1 : s < 1)
    (c r : ℕ → ℝ) (hr : ∀ i, 0 < r i) (hr0 : Tendsto r atTop (𝓝 0))
    (hfull : ∀ x : ℝ, ∀ R : ℝ, 0 < R →
      volume (Metric.ball x R \ (limsup (fun i => Metric.closedBall (c i) (Real.rpow (r i) s)) atTop)) = 0) :
    ∀ x : ℝ, ∀ R : ℝ, 0 < R →
      Measure.hausdorffMeasure s (Metric.ball x R ∩ limsup (fun i => Metric.closedBall (c i) (r i)) atTop) = ∞ := by sorry

/-- The reduced limsup dimension is its series convergence exponent capped at one. -/
theorem duffin_schaeffer_dimension (ψ : ℕ → ℝ)
    (hψ : ∀ q, 0 ≤ ψ q ∧ ψ q ≤ 1/2) :
    dimH (limsup (fun q : ℕ => Set.Icc (0:ℝ) 1 ∩
      ⋃ a ∈ (Finset.Icc 1 q).filter (fun a => Nat.Coprime a q),
        Set.Icc ((a:ℝ)/q-ψ q/q) ((a:ℝ)/q+ψ q/q)) atTop) =
      min (sInf {b : ℝ≥0∞ | ∃ t : ℝ, 0 ≤ t ∧ b = ENNReal.ofReal t ∧
        Summable (fun q : ℕ => (q.totient:ℝ)*Real.rpow (ψ q/q) t)}) 1 := by sorry

end MetricNumberTheory

namespace MetricNumberTheory

/-! ## Layer 4: Pointwise ergodic theory and continued fractions -/
/-- Every integrable real observable converges almost everywhere to native invariant conditional expectation. -/
theorem birkhoff_pointwise {Ω : Type*} [MeasurableSpace Ω] (μ : ProbabilityMeasure Ω)
    (T : Ω → Ω) (hT : MeasurePreserving T (μ : Measure Ω) (μ : Measure Ω))
    (f : Ω → ℝ) (hf : Integrable f (μ : Measure Ω)) :
    ∀ᵐ x ∂(μ : Measure Ω), Tendsto (fun N => birkhoffAverage ℝ T f N x) atTop
      (𝓝 (MeasureTheory.condExp (MeasurableSpace.invariants T) (μ : Measure Ω) f x)) := by sorry

/-- Ergodicity makes the almost-everywhere pointwise limit the space integral. -/
theorem birkhoff_pointwise_ergodic {Ω : Type*} [MeasurableSpace Ω] (μ : ProbabilityMeasure Ω)
    (T : Ω → Ω) (hT : Ergodic T (μ : Measure Ω)) (f : Ω → ℝ) (hf : Integrable f (μ : Measure Ω)) :
    ∀ᵐ x ∂(μ : Measure Ω), Tendsto (fun N => birkhoffAverage ℝ T f N x) atTop (𝓝 (∫ y, f y ∂(μ : Measure Ω))) := by sorry

/-- The total Gauss map uses the fractional part of the reciprocal, including at zero.
The zero value is zero (`gaussMap_zero`); the range lies in [0,1)
(`gaussMap_range`), and reciprocal and fractional-part measurability make the map Borel
(`gaussMap_measurable`). -/
def gaussMap (x : ℝ) : ℝ := Int.fract x⁻¹

/-- The logarithmic invariant density on the unit interval, expressed as a native measure.
Its total mass is one (`gaussMeasure_univ`); unit-interval masses are logarithmic
integrals (`gaussMeasure_interval`). On the unit interval it is equivalent to Lebesgue
measure (`gaussMeasure_equivalent`). -/
def gaussMeasure : Measure ℝ :=
  (volume.restrict (Set.Ioc (0:ℝ) 1)).withDensity (fun x => ENNReal.ofReal (1 / ((1+x)*Real.log 2)))

/-- Outside the unit interval the restricted Gauss measure is zero. -/
example : gaussMeasure (Iic (0 : ℝ)) = 0 := by
  apply le_antisymm _ bot_le
  calc
    gaussMeasure (Iic (0 : ℝ)) ≤ gaussMeasure (Ioc (0 : ℝ) 1)ᶜ := by
      apply measure_mono
      intro x hx h
      exact (not_lt_of_ge hx) h.1
    _ = 0 := by simp [gaussMeasure]

/-- The Gauss density has total mass one. -/
theorem gaussMeasure_probability : IsProbabilityMeasure gaussMeasure := by sorry


/-- The first-digit-one interval fixes the logarithmic normalization of the Gauss measure. -/
theorem gaussMeasure_digit_one_interval :
    gaussMeasure.real (Set.Ioc (1/2 : ℝ) 1) = Real.log (4/3) / Real.log 2 := by sorry

/-- Rational reciprocal endpoints terminate, including the totalized origin. -/
example : gaussMap (1/2) = 0 ∧ gaussMap 0 = 0 ∧ gaussMap (2/3) = 1/2 := by
  norm_num [gaussMap, Int.fract]

/-- Digit n is the natural floor of the reciprocal after n Gauss iterates.
The origin has zero digits (`gaussDigit_zero`), and applying the map shifts the
index (`gaussDigit_shift`). On irrational unit-interval points these observations agree with
the native continued-fraction partial denominators (`gaussDigit_native`). -/
def gaussDigit (x : ℝ) (n : ℕ) : ℕ := ⌊((gaussMap^[n]) x)⁻¹⌋₊

/-- Strong mixing includes measure preservation and convergence of measurable correlations. -/
def IsStrongMixing {Ω : Type*} [MeasurableSpace Ω] (T : Ω → Ω) (μ : ProbabilityMeasure Ω) : Prop :=
  MeasurePreserving T (μ : Measure Ω) (μ : Measure Ω) ∧
    ∀ A B : Set Ω, MeasurableSet A → MeasurableSet B →
      Tendsto (fun n : ℕ => (μ : Measure Ω).real (A ∩ (T^[n]) ⁻¹' B)) atTop
        (𝓝 ((μ : Measure Ω).real A * (μ : Measure Ω).real B))


/-- Exactness includes measure preservation and zero–one for the decreasing preimage sigma-algebra.
Tail-measurable events or their complements have zero mass
(`IsExact.tail_zero_one`). -/
def IsExact {Ω : Type*} [m : MeasurableSpace Ω] (T : Ω → Ω) (μ : ProbabilityMeasure Ω) : Prop :=
  MeasurePreserving T (μ : Measure Ω) (μ : Measure Ω) ∧
    ∀ A : Set Ω, MeasurableSet[⨅ n : ℕ, MeasurableSpace.comap (T^[n]) m] A →
      (μ : Measure Ω) A = 0 ∨ (μ : Measure Ω) Aᶜ = 0

/-- The geometric-digit constant with the a(a+2) digit-law denominator.
The exponential is positive (`khinchinConstant_pos`); its logarithm is the
Gauss integral of the logarithmic first digit (`khinchinConstant_log_integral`). -/
def khinchinConstant : ℝ := Real.exp (∑' k : ℕ,
  Real.log ((k:ℝ)+1) * Real.log (1 + 1/(((k:ℝ)+1)*((k:ℝ)+3))) / Real.log 2)


/-- A one-atom identity system is mixing; no nonatomicity condition belongs in the definition. -/
example : IsStrongMixing (id : ℝ → ℝ) (diracProba 0) := by
  refine ⟨MeasurePreserving.id _, ?_⟩
  intro A B _ _
  by_cases ha : (0 : ℝ) ∈ A <;> by_cases hb : (0 : ℝ) ∈ B <;>
    simp [diracProba, Measure.real, ha, hb, Function.iterate_id]

/-- A one-atom identity system is exact: every event or its complement has zero mass. -/
example : IsExact (id : ℝ → ℝ) (diracProba 0) := by
  refine ⟨MeasurePreserving.id _, ?_⟩
  intro A _
  by_cases h : (0 : ℝ) ∈ A
  · right; simp [diracProba, h]
  · left; simp [diracProba, h]

/-- Khinchin’s constant is positive from its exponential definition. -/
example : 0 < khinchinConstant := Real.exp_pos _

/-- The logarithmic series defining the digit constant really converges. -/
theorem khinchin_series_summable : Summable (fun k : ℕ =>
    Real.log ((k:ℝ)+1) * Real.log (1 + 1/(((k:ℝ)+1)*((k:ℝ)+3))) /
      Real.log 2) := by sorry

/-- The digit-two logarithmic summand is nonzero, fixing the a(a+2) denominator. -/
example : Real.log (2 : ℝ) * Real.log (1 + 1/((2:ℝ)*4)) / Real.log 2 =
    Real.log (9/8) ∧ 0 < Real.log (9/8) := by
  have h2 : Real.log (2 : ℝ) ≠ 0 := ne_of_gt (Real.log_pos (by norm_num))
  constructor
  · have h : (1 + 1/((2:ℝ)*4)) = 9/8 := by norm_num
    rw [h]
    field_simp
  · exact Real.log_pos (by norm_num)

/-- Fair two-atom identity and swap systems fail mixing and exactness. -/
theorem two_atom_not_mixing_exact (ν : ProbabilityMeasure ℝ)
    (hν : (ν : Measure ℝ) = (1/2 : ℝ≥0∞) • Measure.dirac 0 +
      (1/2 : ℝ≥0∞) • Measure.dirac 1) :
    (¬ IsStrongMixing id ν ∧ ¬ IsExact id ν) ∧
    (¬ IsStrongMixing (fun x => 1-x) ν ∧ ¬ IsExact (fun x => 1-x) ν) := by sorry

/-- The Gauss measure is invariant under the total Gauss map. -/
theorem gauss_invariant : MeasurePreserving gaussMap gaussMeasure gaussMeasure := by sorry

/-- The Gauss system has trivial tail sigma-algebra modulo null sets. -/
theorem gauss_exact : IsExact gaussMap (⟨gaussMeasure, gaussMeasure_probability⟩ : ProbabilityMeasure ℝ) := by sorry

/-- Exactness yields strong mixing for the Gauss probability. -/
theorem gauss_mixing : IsStrongMixing gaussMap (⟨gaussMeasure, gaussMeasure_probability⟩ : ProbabilityMeasure ℝ) := by sorry

/-- The invariant Gauss probability is ergodic. -/
theorem gauss_ergodic : Ergodic gaussMap gaussMeasure := by sorry

/-- Almost every real has the logarithmic Gauss frequency for each positive digit. -/
theorem gauss_digit_frequency : ∀ᵐ x ∂(volume.restrict (Set.Ioo (0:ℝ) 1)),
    ∀ a : ℕ, 0 < a → Tendsto (fun N : ℕ =>
      ((Finset.range N).filter (fun j => gaussDigit x j = a)).card / (N:ℝ)) atTop
      (𝓝 (Real.log (((a:ℝ)+1)^2 / ((a:ℝ)*((a:ℝ)+2))) / Real.log 2)) := by sorry

/-- All finite positive words have their Gauss cylinder frequency on one conull set. -/
theorem gauss_word_frequency : ∀ᵐ x ∂(volume.restrict (Set.Ioo (0:ℝ) 1)),
    ∀ k : ℕ, 0 < k → ∀ w : Fin k → ℕ, (∀ i, 0 < w i) →
      Tendsto (fun N : ℕ => ((Finset.range N).filter (fun j =>
        ∀ i : Fin k, gaussDigit x (j+i) = w i)).card / (N:ℝ)) atTop
        (𝓝 (gaussMeasure.real {y | y ∈ Set.Ioo (0:ℝ) 1 ∧ ∀ i : Fin k, gaussDigit y i = w i})) := by sorry

/-- Almost every geometric mean of Gauss digits tends to Khinchin’s constant. -/
theorem khinchin_geometric_mean : ∀ᵐ x ∂(volume.restrict (Set.Ioo (0:ℝ) 1)),
    Tendsto (fun N : ℕ => Real.rpow (∏ j ∈ Finset.range N, (gaussDigit x j : ℝ)) ((N:ℝ)⁻¹))
      atTop (𝓝 khinchinConstant) := by sorry

/-- Native continued-fraction denominators have the almost-everywhere Lévy logarithmic growth rate. -/
theorem levy_denominator : ∀ᵐ x ∂(volume.restrict (Set.Ioo (0:ℝ) 1)),
    Tendsto (fun N : ℕ => Real.log ((GenContFract.of x).dens N)/(N:ℝ)) atTop
      (𝓝 (Real.pi^2/(12*Real.log 2))) := by sorry

/-- Lebesgue digit marginals approach their Gauss law at a uniform exponential rate. -/
theorem gauss_kuzmin : ∃ C ρ : ℝ, 0 < C ∧ 0 < ρ ∧ ρ < 1 ∧
    ∀ a : ℕ, 0 < a → ∀ n : ℕ,
      |(volume.restrict (Set.Ioc (0:ℝ) 1)).real {x | gaussDigit x n = a} -
        Real.log (((a:ℝ)+1)^2/((a:ℝ)*((a:ℝ)+2)))/Real.log 2| ≤ C*ρ^n := by sorry

/-- The first digit is at index zero, and the next observation records rational termination. -/
example : gaussDigit (2/3) 0 = 1 ∧ gaussDigit (2/3) 1 = 2 ∧ gaussDigit (2/3) 2 = 0 := by
  norm_num [gaussDigit, gaussMap, Int.fract]

-- Ordered inverse branches and quantitative transfer estimates.
local notation "I" => Icc (0 : ℝ) 1
local notation "D" => (Set.ofPred (fun x : ℝ => x ∈ Ioo (0 : ℝ) 1 ∧ Irrational x))
local notation "m" => volume.restrict (Ioo (0 : ℝ) 1)

/-- A finite digit cylinder is restricted to nonterminating irrational unit-interval points.
The empty word is the irrational support (`gaussCylinder_nil`), and a zero digit
makes the cylinder empty (`gaussCylinder_zero`). Prefixing a positive digit intersects its fiber
with the map-preimage of the remaining cylinder (`gaussCylinder_cons`). Every such set is Borel
(`gaussCylinder_measurable`). -/
def gaussCylinder (w : List ℕ) : Set ℝ :=
  {x | x ∈ D ∧ ∀ j : Fin w.length, gaussDigit x j = w[j]}

/-- Inverse branches compose in digit order; the empty word is the identity.
The empty composition is the identity (`inverseWord_nil`); prefixing a digit
composes its inverse branch (`inverseWord_cons`). Concatenation composes the two word maps
in their stated order (`inverseWord_append`). -/
def inverseWord (w : List ℕ) : ℝ → ℝ :=
  w.foldr (fun a v y => 1 / ((a : ℝ) + v y)) id

/-- The ordered product of the matrices of inverse branches.
The empty product is the identity matrix (`wordMatrix_nil`), and prefixing a digit
left-multiplies by its branch matrix (`wordMatrix_cons`). The determinant is (−1) to the word
length (`wordMatrix_det`). -/
def wordMatrix (w : List ℕ) : Matrix (Fin 2) (Fin 2) ℝ :=
  (w.map (fun a => !![0,1;1,(a : ℝ)])).prod

/-- The unnormalized Lebesgue density transfer operator, using the native real infinite sum.
It kills zero (`gaussDensityTransfer_zero`), is positive on nonnegative
observations on the interval (`gaussDensityTransfer_nonnegative`), and is linear there for
continuous inputs (`gaussDensityTransfer_add`, `gaussDensityTransfer_smul`). Uniform branch
majorants give continuity (`gaussDensityTransfer_continuous`). Integration against a bounded
observable is dual to composition by the Gauss map (`gaussDensityTransfer_duality`). -/
def gaussDensityTransfer (f : ℝ → ℝ) (x : ℝ) : ℝ :=
  ∑' k : ℕ, f (1 / ((k : ℝ) + 1 + x)) / ((k : ℝ) + 1 + x)^2

/-- Conjugating by the Gauss density gives positive weights summing to one.
It preserves constants (`normalizedGaussTransfer_const`). Conjugating by
multiplication with 1+x identifies it with the density operator
(`normalizedGaussTransfer_conjugate`), and the Gauss-weighted integral is conserved
(`normalizedGaussTransfer_integral`). It is linear on continuous interval observations
(`normalizedGaussTransfer_add`, `normalizedGaussTransfer_smul`) and preserves their lower and
upper bounds (`normalizedGaussTransfer_bounds`). -/
def normalizedGaussTransfer (g : ℝ → ℝ) (x : ℝ) : ℝ :=
  ∑' k : ℕ, (1+x) / (((k : ℝ)+1+x)*((k : ℝ)+2+x)) *
    g (1 / ((k : ℝ)+1+x))


/-- An empty cylinder is exactly the irrational support. -/
example : gaussCylinder [] = D := by simp [gaussCylinder]

/-- A rational endpoint is excluded even from the empty-word cylinder. -/
example : (1/2 : ℝ) ∉ gaussCylinder [] := by
  simp [gaussCylinder, Irrational]
  exact fun _ => ⟨(1/2 : ℚ), by norm_num⟩

/-- A zero digit and two opposite word orders distinguish irrational cylinders. -/
theorem gaussCylinder_boundary_values : gaussCylinder [0] = ∅ ∧
    gaussCylinder [1,2] = D ∩ Ioo (2/3) (3/4) ∧
    gaussCylinder [2,1] = D ∩ Ioo (1/3) (2/5) := by sorry

/-- The constant input has a nonzero density-transfer value at the endpoint. -/
theorem gaussDensityTransfer_one_zero :
    gaussDensityTransfer (fun _ => 1) 0 = Real.pi^2/6 := by sorry

/-- The invariant density is fixed by the unnormalized transfer on the unit interval. -/
theorem gaussDensityTransfer_invariant_density {x : ℝ} (hx : x ∈ I) :
    gaussDensityTransfer (fun y => 1/((1+y)*Real.log 2)) x =
      1/((1+x)*Real.log 2) := by sorry

/-- Normalized transfer preserves constants and has the nontrivial identity-observable endpoint. -/
theorem normalizedGaussTransfer_boundary_values :
    (∀ x ∈ I, normalizedGaussTransfer (fun _ => 1) x = 1) ∧
    normalizedGaussTransfer id 0 = Real.pi^2/6-1 := by sorry

/-- Both transfer operators kill the zero function. -/
example : gaussDensityTransfer (fun _ => 0) = 0 := by
  funext x
  simp [gaussDensityTransfer]

/-- Density normalization does not change preservation of zero. -/
example : normalizedGaussTransfer (fun _ => 0) = 0 := by
  funext x
  simp [normalizedGaussTransfer]

/-- The ordered word matrix agrees with the native numerator and denominator indices. -/
theorem wordMatrix_native {w : List ℕ} {x : ℝ} (hx : x ∈ gaussCylinder w)
    (hn : 1 ≤ w.length) :
    wordMatrix w = !![(GenContFract.of x).nums (w.length-1), (GenContFract.of x).nums w.length;
      (GenContFract.of x).dens (w.length-1), (GenContFract.of x).dens w.length] := sorry

/-- The reciprocal orbit product equals q_N plus q_(N−1) times the tail. -/
theorem orbit_product_identity {x : ℝ} (hx : x ∈ D) (N : ℕ) :
    (∏ j ∈ Finset.range N, (gaussMap^[j]) x)⁻¹ =
      (GenContFract.of x).dens N +
        (if N = 0 then 0 else (GenContFract.of x).dens (N-1)) *
          (gaussMap^[N]) x := sorry

/-- Closed-interval C¹ derivatives contract by the sufficient factor 9/10. -/
theorem transfer_derivative_contraction {g : ℝ → ℝ} (hg : ContDiffOn ℝ 1 g I)
    {M : ℝ} (hM : 0 ≤ M) (hb : ∀ x ∈ I, |derivWithin g I x| ≤ M) :
    ∀ x ∈ I, |derivWithin (normalizedGaussTransfer g) I x| ≤ (9 / 10 : ℝ) * M := sorry

/-- Iterating the Lebesgue density gives the explicit uniform Gauss–Kuzmin error. -/
theorem density_uniform_error (n : ℕ) {x : ℝ} (hx : x ∈ I) :
    |(gaussDensityTransfer^[n]) (fun _ => 1) x - 1 / ((1 + x) * Real.log 2)| ≤
      (9 / 10 : ℝ) ^ n := sorry

/-- Integrating the density error gives the corresponding digit marginal estimate. -/
theorem digit_marginal_error {a : ℕ} (ha : 1 ≤ a) (n : ℕ) :
    |(m).real {x | gaussDigit x n = a} -
      Real.log (((a : ℝ) + 1) ^ 2 / ((a : ℝ) * ((a : ℝ) + 2))) / Real.log 2| ≤
      (9 / 10 : ℝ) ^ n := sorry

/-- Reversing a word changes its inverse-branch composition. -/
example : inverseWord [1,2] 0 = 2/3 ∧ inverseWord [2,1] 0 = 1/3 := by
  norm_num [inverseWord]

/-- Empty and singleton inverse words retain the literal inverse branch. -/
example : inverseWord [] = id ∧ inverseWord [3] 0 = 1/3 := by
  norm_num [inverseWord]

/-- Matrix multiplication uses the same digit order as inverse branches. -/
example : wordMatrix [1,2] = !![(1 : ℝ),2;1,3] ∧
    wordMatrix [2,1] = !![(1 : ℝ),1;2,3] ∧ wordMatrix [] = 1 ∧
    wordMatrix [3] = !![(0 : ℝ),1;1,3] := by
  norm_num [wordMatrix, Matrix.mul_apply, Fin.sum_univ_two]

section HomogeneousConsumers
local notation "G" => Matrix.SpecialLinearGroup (Fin 2) ℝ
local notation "Γ" => MonoidHom.range (Matrix.SpecialLinearGroup.map (Int.castRingHom ℝ) :
  Matrix.SpecialLinearGroup (Fin 2) ℤ →* G)
/-- The special linear group carries the existing determinant-one subtype topology. -/
local instance : TopologicalSpace G :=
  inferInstanceAs (TopologicalSpace {A : Matrix (Fin 2) (Fin 2) ℝ // A.det = 1})
local notation "X" => G ⧸ Γ
/-- The homogeneous quotient uses its Borel measurable structure. -/
local instance : MeasurableSpace X := borel X

variable (a u : ℝ → G)
variable (ha : ∀ t : ℝ, (a t : Matrix (Fin 2) (Fin 2) ℝ) =
  !![Real.exp t, 0; 0, Real.exp (-t)])
variable (hu : ∀ x : ℝ, (u x : Matrix (Fin 2) (Fin 2) ℝ) = !![1, x; 0, 1])

include ha

/-- The §4.2 time-one mixing contract yields Haar-typical averages on the modular quotient. -/
theorem homogeneous_birkhoff (μ : Measure X) [IsProbabilityMeasure μ]
    (hHaar : ∀ g : G, MeasurePreserving (fun z : X => g • z) μ μ)
    (hMixing : IsStrongMixing (fun z : X => a 1 • z) ⟨μ, inferInstance⟩)
    {f : X → ℝ} (hf : Integrable f μ) :
    ∀ᵐ z ∂μ, Tendsto (fun N : ℕ => birkhoffAverage ℝ (fun w : X => a 1 • w) f N z)
      atTop (𝓝 (∫ w, f w ∂μ)) := sorry

-- One-sided orbit and compact closure, with all matrix conventions visible.
include ha hu
/-- Bounded Gauss digits are equivalent to precompactness of the positive column-lattice orbit. -/
theorem bounded_digits_compact_orbit {x : ℝ} (hx : x ∈ D) :
    (∃ B : ℕ, ∀ n : ℕ, gaussDigit x n ≤ B) ↔
      IsCompact (closure {z : X | ∃ t : ℝ, 0 ≤ t ∧ z = QuotientGroup.mk (a t * u x)}) := sorry
/-- Lebesgue-almost every unit-interval point has a nonprecompact positive semiorbit. -/
theorem typical_unbounded_semiorbit : ∀ᵐ x ∂m,
    ¬ IsCompact (closure {z : X | ∃ t : ℝ, 0 ≤ t ∧ z = QuotientGroup.mk (a t * u x)}) := sorry

end HomogeneousConsumers

/-! ## Layer 5: Short intervals, logarithmic correlations and random models -/
/-- Inclusive short intervals contain h+1 terms but are normalized by h.
The zero-length value is zero (`shortMean_zero`); addition is pointwise linear
(`shortMean_add`). Unit-bounded observations have absolute mean at most (h+1)/h for h>0
(`shortMean_bound`). -/
def shortMean (f : ArithmeticFunction ℝ) (x h : ℕ) : ℝ :=
  (∑ n ∈ Finset.Icc x (x+h), f n)/(h:ℝ)

/-- The harmonic two-point window uses no conjugation and the exact floor-based lower endpoint.
The unit window gives zero (`logCorrelation_one_window`). Addition in the first
observation is linear (`logCorrelation_add_left`), and swapping the two forms and observations
leaves the value fixed (`logCorrelation_swap`). -/
def logCorrelation (f g : ArithmeticFunction ℂ) (a₁ a₂ : ℕ) (b₁ b₂ : ℤ) (x w : ℝ) : ℂ :=
  (∑ n ∈ Finset.Ioc ⌊x/w⌋₊ ⌊x⌋₊,
    f (((a₁:ℤ)*(n:ℤ)+b₁).toNat) * g (((a₂:ℤ)*(n:ℤ)+b₂).toNat) / (n:ℂ)) / (Real.log w : ℂ)

/-- The outcome-wise squarefree-supported prime-sign model.
It vanishes off the squarefree support (`rademacherModel_nonsquarefree`) and
is the product of prime signs on that support (`rademacherModel_squarefree`). Each outcome is
coprime multiplicative (`rademacherModel_multiplicative`). -/
def rademacherModel {Ω : Type*} (ξ : ℕ → Ω → ℝ) (ω : Ω) : ArithmeticFunction ℝ where
  toFun n := if Squarefree n then ∏ p ∈ n.primeFactors, ξ p ω else 0
  map_zero' := by simp

/-- The outcome-wise completely multiplicative prime-phase model, extended by zero at zero.
Positive prime powers retain their exponents (`steinhausModel_prime_pow`).
Every outcome is completely multiplicative (`steinhausModel_mul`); unit prime phases give
absolute value one at every positive input (`steinhausModel_norm`). -/
def steinhausModel {Ω : Type*} (ζ : ℕ → Ω → ℂ) (ω : Ω) : ArithmeticFunction ℂ where
  toFun n := if n = 0 then 0 else ∏ p ∈ n.primeFactors, (ζ p ω)^n.factorization p
  map_zero' := by simp


/-- A unit logarithmic window is empty with the totalized value zero. -/
example (f g : ArithmeticFunction ℂ) (a₁ a₂ : ℕ) (b₁ b₂ : ℤ) (x : ℝ) :
    logCorrelation f g a₁ a₂ b₁ b₂ x 1 = 0 := by
  simp [logCorrelation]

/-- The two finite Liouville windows distinguish harmonic weights and the absence of conjugation. -/
theorem logCorrelation_liouville_windows :
    logCorrelation (ArithmeticFunction.liouville : ArithmeticFunction ℂ)
      (ArithmeticFunction.liouville : ArithmeticFunction ℂ) 1 1 0 1 2 2 =
        1/(2*(Real.log 2 : ℂ)) ∧
    logCorrelation (ArithmeticFunction.liouville : ArithmeticFunction ℂ)
      (ArithmeticFunction.liouville : ArithmeticFunction ℂ) 1 1 0 1 4 4 =
        -1/(12*(Real.log 4 : ℂ)) := by sorry

/-- The real bounded multiplicative short-interval estimate with its exceptional-integer count. -/
theorem matomaki_radziwill : ∃ C C' : ℝ, 1 < C ∧ 1 < C' ∧
    ∀ (f : ArithmeticFunction ℝ) (hf : f.IsMultiplicative)
      (hb : ∀ n : ℕ, 0 < n → |f n| ≤ 1) (h X : ℕ) (hh : 2 ≤ h) (hX : h ≤ X)
      (δ : ℝ) (hδ : 0 < δ),
      (((Finset.Icc X (2*X)).filter (fun x =>
        δ+C'*Real.log (Real.log h)/Real.log h < |shortMean f x h-shortMean f X X|)).card : ℝ) ≤
      C*(X:ℝ)*(Real.rpow (Real.log h) (1/3)/(δ^2*Real.rpow h (δ/25)) +
        1/(δ^2*Real.rpow (Real.log X) (1/50))) := by sorry

/-- Uniform finite character and height separation bounds the normalized harmonic correlation. -/
theorem logarithmic_elliott_finite (a₁ a₂ : ℕ) (ha₁ : 0 < a₁) (ha₂ : 0 < a₂)
    (b₁ b₂ : ℤ) (hd : (a₁:ℤ)*b₂-(a₂:ℤ)*b₁ ≠ 0) (ε : ℝ) (hε : 0 < ε) :
    ∃ A₀ : ℝ, 1 < A₀ ∧ ∀ A : ℝ, A₀ ≤ A → ∀ x w : ℝ, A ≤ w → w ≤ x →
    ∀ f g : ArithmeticFunction ℂ, f.IsMultiplicative → g.IsMultiplicative →
    (∀ n : ℕ, 0 < n → ‖f n‖ ≤ 1 ∧ ‖g n‖ ≤ 1) →
    (∀ q : ℕ, 1 ≤ q → (q:ℝ) ≤ A → ∀ χ : DirichletCharacter ℂ q,
      ∀ t : ℝ, |t| ≤ A*x →
      A ≤ ∑ p ∈ Nat.primesLE ⌊x⌋₊,
        (1 - (f p * star (χ (p : ZMod q)) *
          Complex.exp (-(t:ℂ)*Complex.I*(Real.log (p:ℝ) : ℂ))).re)/(p:ℝ)) →
    ‖logCorrelation f g a₁ a₂ b₁ b₂ x w‖ ≤ ε := by sorry

/-- Distinct positive-slope Liouville forms have vanishing normalized logarithmic correlation. -/
theorem logarithmic_chowla (a₁ a₂ : ℕ) (ha₁ : 0 < a₁) (ha₂ : 0 < a₂) (b₁ b₂ : ℤ)
    (hd : (a₁:ℤ)*b₂-(a₂:ℤ)*b₁ ≠ 0) (w : ℝ → ℝ)
    (hw1 : ∀ᶠ x in atTop, 1 ≤ w x) (hwx : ∀ᶠ x in atTop, w x ≤ x) (hw : Tendsto w atTop atTop) :
    Tendsto (fun x : ℝ => logCorrelation (ArithmeticFunction.liouville : ArithmeticFunction ℂ)
      (ArithmeticFunction.liouville : ArithmeticFunction ℂ) a₁ a₂ b₁ b₂ x (w x)) atTop (𝓝 0) := by sorry

/-- Every real bounded completely multiplicative function with a negative value has a nontrivial correlation bound. -/
theorem real_multiplicative_two_point_nontrivial (f : ArithmeticFunction ℝ)
    (hf1 : f 1 = 1) (hf : ∀ r s : ℕ, 0 < r → 0 < s → f (r*s) = f r * f s)
    (hb : ∀ n : ℕ, 0 < n → |f n| ≤ 1)
    (hneg : ∃ n : ℕ, 0 < n ∧ f n < 0) (h : ℕ) (hh : 0 < h) :
    ∃ δ : ℝ, 0 < δ ∧ ∃ X₀ : ℕ, ∀ X ≥ X₀,
      |∑ n ∈ Finset.Icc 1 X, f n * f (n+h)| ≤ (1-δ)*(X:ℝ) := by sorry

/-- At each fixed positive shift an ordinary Liouville correlation stays strictly below its trivial bound. -/
theorem liouville_two_point_nontrivial (h : ℕ) (hh : 0 < h) :
    ∃ δ : ℝ, 0 < δ ∧ ∃ X₀ : ℕ, ∀ X ≥ X₀,
      |∑ n ∈ Finset.Icc 1 X, (ArithmeticFunction.liouville n : ℝ) * (ArithmeticFunction.liouville (n+h) : ℝ)| ≤
        (1-δ)*(X:ℝ) := by sorry

/-- A length-one short mean includes its two endpoints without division by two. -/
example (f : ArithmeticFunction ℝ) (x : ℕ) :
    shortMean f x 1 = f x + f (x+1) := by
  simp [shortMean, Finset.sum_Icc_succ_top]

/-- Positive constant observations retain the inclusive endpoint factor. -/
example (f : ArithmeticFunction ℝ) (hf : ∀ n, 0 < n → f n = 1)
    {x h : ℕ} (hx : 0 < x) (hh : 0 < h) :
    shortMean f x h = ((h:ℝ)+1)/(h:ℝ) := by
  have he : ∀ n ∈ Finset.Icc x (x+h), f n = 1 := by
    intro n hn
    exact hf n (lt_of_lt_of_le hx (Finset.mem_Icc.mp hn).1)
  have hc : x + h + 1 - x = h + 1 := by omega
  simp [shortMean, Finset.sum_congr rfl he, Nat.card_Icc, hc]

/-- Squarefree support kills a prime square for every sign outcome. -/
example {Ω : Type*} (ξ : ℕ → Ω → ℝ) (ω : Ω) : rademacherModel ξ ω 4 = 0 := by
  have h : ¬ Squarefree (4 : ℕ) := by decide
  simp [rademacherModel, h]

/-- The phase model retains the exponent of a repeated prime. -/
example {Ω : Type*} (ζ : ℕ → Ω → ℂ) (ω : Ω) :
    steinhausModel ζ ω 4 = (ζ 2 ω)^2 := by
  have hp : Nat.primeFactors 4 = {2} := by
    simpa using Nat.primeFactors_prime_pow (k := 2) (by decide) Nat.prime_two
  have hf : Nat.factorization 4 2 = 2 := by
    simpa using Nat.factorization_pow_self (n := 2) Nat.prime_two
  simp [steinhausModel, hp, hf]

/-- Distinct prime signs multiply at six and the empty product at one is one. -/
example {Ω : Type*} (ξ : ℕ → Ω → ℝ) (ω : Ω) :
    rademacherModel ξ ω 1 = 1 ∧ rademacherModel ξ ω 6 = ξ 2 ω * ξ 3 ω := by
  have hs : Squarefree (6 : ℕ) := by
    rw [show (6 : ℕ) = 2*3 by decide, Nat.squarefree_mul (by decide)]
    exact ⟨Nat.prime_two.squarefree, Nat.prime_three.squarefree⟩
  have hp : Nat.primeFactors 6 = {2,3} := by
    rw [show (6 : ℕ) = 2*3 by decide, Nat.primeFactors_mul (by decide) (by decide),
      Nat.prime_two.primeFactors, Nat.prime_three.primeFactors]
    rfl
  norm_num [rademacherModel, hs, hp]

/-- The phase model has the same distinct-prime product and its stipulated zero extension. -/
example {Ω : Type*} (ζ : ℕ → Ω → ℂ) (ω : Ω) :
    steinhausModel ζ ω 0 = 0 ∧ steinhausModel ζ ω 1 = 1 ∧
    steinhausModel ζ ω 6 = ζ 2 ω * ζ 3 ω := by
  have hp : Nat.primeFactors 6 = {2,3} := by
    rw [show (6 : ℕ) = 2*3 by decide, Nat.primeFactors_mul (by decide) (by decide),
      Nat.prime_two.primeFactors, Nat.prime_three.primeFactors]
    rfl
  have h2 : Nat.factorization 6 2 = 1 := by
    rw [show (6 : ℕ) = 2*3 by decide, Nat.factorization_mul (by decide) (by decide)]
    simp [Nat.prime_two.factorization, Nat.prime_three.factorization]
  have h3 : Nat.factorization 6 3 = 1 := by
    rw [show (6 : ℕ) = 2*3 by decide, Nat.factorization_mul (by decide) (by decide)]
    simp [Nat.prime_two.factorization, Nat.prime_three.factorization]
  norm_num [steinhausModel, hp, h2, h3]

end MetricNumberTheory

end TauCetiRoadmap.ProbabilisticAndMetricNumberTheory
