import Mathlib
import TauCeti.Order.Northcott.Basic

/-!
# ArithmeticDirichletSeriesPartII: representative target signatures

The roadmap is `README.md`. This file records statements suggested against the pinned APIs
and is not exhaustive. It includes light definitions, headline and milestone theorems, and
normalisation and boundary checks on those definitions.

`HasLaplace` uses the ordinary one-sided integral of a function with convergence included.
Its argument order follows Dennj Osele, “The Laplace transform”, declarations
`LaplaceConvergent`, `laplace`, and `HasLaplace`.
`PoleBoundary` requires agreement only on the open half-plane, independently of boundary values.
Pole orders are `k + 1`; the counting constant at positive abscissa `a` is `A / (a * k!)`.
The squared-sinc kernel has mass one; the polynomial weight uses cutoff one.
-/

noncomputable section

open Filter MeasureTheory Set
open scoped Topology

namespace TauCetiRoadmap.ArithmeticDirichletSeriesPartII

/-- The identity height on `ℕ` has finite sublevel sets. This is the instance that
`TauCeti.summatory (fun n : ℕ ↦ n)` needs to sum over the integers `n ≤ X`. -/
instance northcott_natId : Northcott (fun n : ℕ ↦ n) where
  finite_le b := Set.finite_Iic b

/-! ## Layer HP.0: convergent Laplace transforms and boundary continuation -/

section Laplace

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [SMul ℂ E]

/-- `HasLaplace f s z μ`: the integrand `t ↦ exp (-s t) • f t` is integrable for `μ` and its
integral is `z`. With the default measure this is the one-sided Laplace transform of `f` at the
complex parameter `s`. Belongs to Layer HP.0; it follows the
ordinary transform predicate in Osele, “The Laplace transform”, declarations 121–123. -/
def HasLaplace (f : ℝ → E) (s : ℂ) (z : E) (μ : Measure ℝ := volume.restrict (Ioi 0)) : Prop :=
  Integrable (fun t : ℝ ↦ Complex.exp (-s * t) • f t) μ ∧
    ∫ t : ℝ, Complex.exp (-s * t) • f t ∂μ = z

end Laplace

/-- `HasLaplace_test_zero`: a zero-preserving complex action makes the zero function have
transform zero at every parameter and for every measure. -/
example {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [SMulZeroClass ℂ E]
    (s : ℂ) (μ : Measure ℝ) : HasLaplace (fun _ : ℝ ↦ (0 : E)) s 0 μ := by
  simp [HasLaplace]

/-- The integral value is the second conjunct of the convergent transform predicate. -/
theorem HasLaplace.integral_eq {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [SMul ℂ E] {f : ℝ → E} {s : ℂ} {z : E} {μ : Measure ℝ}
    (h : HasLaplace f s z μ) : ∫ t : ℝ, Complex.exp (-s * t) • f t ∂μ = z := h.2

/-- Convergence is the first conjunct of the transform predicate. -/
theorem HasLaplace.integrable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [SMul ℂ E] {f : ℝ → E} {s : ℂ} {z : E} {μ : Measure ℝ}
    (h : HasLaplace f s z μ) : Integrable (fun t : ℝ ↦ Complex.exp (-s * t) • f t) μ := h.1

/-- A convergent transform has a unique value. -/
theorem HasLaplace.unique {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [SMul ℂ E] {f : ℝ → E} {s : ℂ} {z w : E} {μ : Measure ℝ}
    (hz : HasLaplace f s z μ) (hw : HasLaplace f s w μ) : z = w := hz.2.symm.trans hw.2

/-- Almost-everywhere equality of functions preserves their convergent transforms. -/
theorem HasLaplace.congr_ae {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [SMul ℂ E] {f g : ℝ → E} {s : ℂ} {z : E} {μ : Measure ℝ}
    (hf : HasLaplace f s z μ) (hfg : f =ᵐ[μ] g) : HasLaplace g s z μ := by
  sorry

/-- A distributive complex action makes convergent transforms additive. -/
theorem HasLaplace.add {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [DistribSMul ℂ E] {f g : ℝ → E} {s : ℂ} {z w : E} {μ : Measure ℝ}
    (hf : HasLaplace f s z μ) (hg : HasLaplace g s w μ) :
    HasLaplace (f + g) s (z + w) μ := by
  sorry

/-- Complex scalar multiplication commutes with the transform under compatible normed actions. -/
theorem HasLaplace.const_smul {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [NormedSpace ℂ E] [IsScalarTower ℝ ℂ E] {f : ℝ → E} {s : ℂ} {z : E} {μ : Measure ℝ}
    (hf : HasLaplace f s z μ) (c : ℂ) : HasLaplace (fun t ↦ c • f t) s (c • z) μ := by
  sorry

/-- Positive dilation of time contributes the inverse Jacobian for the default measure. -/
theorem HasLaplace.comp_mul_left {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [NormedSpace ℂ E] [IsScalarTower ℝ ℂ E] {f : ℝ → E} {s : ℂ} {z : E}
    {c : ℝ} (hc : 0 < c) (hf : HasLaplace f (s / c) z) :
    HasLaplace (fun t ↦ f (c * t)) s ((c : ℂ)⁻¹ • z) := by
  sorry

/-- `HasLaplace_test_constant`: the constant function `1` has transform `1 / s` on `Re s > 0`. -/
example {s : ℂ} (hs : 0 < s.re) : HasLaplace (fun _ : ℝ ↦ (1 : ℂ)) s (1 / s) := by
  constructor
  · simpa [smul_eq_mul, IntegrableOn] using integrableOn_exp_mul_complex_Ioi (a := -s) (by simpa) 0
  · simpa [smul_eq_mul] using integral_exp_mul_complex_Ioi (a := -s) (by simpa) 0

/-- `HasLaplace_test_quadratic`: `t ↦ t²` has transform `2 / s³`; the Gamma model carries `k!`. -/
theorem HasLaplace_test_quadratic {s : ℂ} (hs : 0 < s.re) : HasLaplace (fun t : ℝ ↦ (t : ℂ) ^ 2) s (2 / s ^ 3) := by
  sorry

/-- `HasLaplace_test_nonintegrable`, a negative control: at `s = 0` the totalised integral of `1`
is `0`, but `1` has no Laplace transform there. A predicate recording only the value of the
integral would accept this. -/
theorem HasLaplace_test_nonintegrable : ¬ HasLaplace (fun _ : ℝ ↦ (1 : ℂ)) 0 0 := by
  sorry

/-- `PoleBoundary F a k A`: `F` is holomorphic on `Re s > a`; near `a` it equals
`g s / (s - a) ^ (k + 1)` with `g` holomorphic on a disc about `a` and `g a = A`; and at every
other point `a + i y` of the line `Re s = a` it extends holomorphically. All agreements are on
the open half-plane. With `A ≠ 0` the pole has order exactly `k + 1`; the main theorems assume
`0 < A`. This is the integer-exponent case of the hypothesis of Delange's Theorem III
(Delange 1954, §5.2.1, pp. 235–236). Belongs to Layer HP.0. -/
structure PoleBoundary (F : ℂ → ℂ) (a : ℝ) (k : ℕ) (A : ℝ) : Prop where
  /-- `F` is holomorphic on the open half-plane `Re s > a`. -/
  interior : AnalyticOnNhd ℂ F {s : ℂ | a < s.re}
  /-- Near `a`, `F` is a holomorphic numerator with value `A` over `(s - a) ^ (k + 1)`. -/
  pole : ∃ r : ℝ, 0 < r ∧ ∃ g : ℂ → ℂ, AnalyticOnNhd ℂ g (Metric.ball (a : ℂ) r) ∧
    g a = A ∧ ∀ s ∈ Metric.ball (a : ℂ) r, a < s.re → F s = g s / (s - a) ^ (k + 1)
  /-- `F` extends holomorphically across every point `a + i y` with `y ≠ 0`. -/
  away : ∀ y : ℝ, y ≠ 0 → ∃ r : ℝ, 0 < r ∧ ∃ g : ℂ → ℂ,
    AnalyticOnNhd ℂ g (Metric.ball ((a : ℂ) + y * Complex.I) r) ∧
      ∀ s ∈ Metric.ball ((a : ℂ) + y * Complex.I) r, a < s.re → F s = g s

/-- Agreement on the open half-plane preserves the boundary condition. -/
theorem PoleBoundary.congr {F G : ℂ → ℂ} {a A : ℝ} {k : ℕ}
    (h : PoleBoundary F a k A) (hFG : ∀ s : ℂ, a < s.re → F s = G s) :
    PoleBoundary G a k A := by
  sorry

/-- At fixed order the holomorphic numerator has a unique value at the pole. -/
theorem PoleBoundary.leading_unique {F : ℂ → ℂ} {a A B : ℝ} {k : ℕ}
    (hA : PoleBoundary F a k A) (hB : PoleBoundary F a k B) : A = B := by
  sorry

/-- Nonzero leading coefficients make the pole order unique. -/
theorem PoleBoundary.order_unique {F : ℂ → ℂ} {a A B : ℝ} {k l : ℕ}
    (hA : PoleBoundary F a k A) (hB : PoleBoundary F a l B) (hA0 : A ≠ 0) (hB0 : B ≠ 0) :
    k = l := by
  sorry

/-- At a positive abscissa division by the argument preserves order and divides the coefficient. -/
theorem PoleBoundary.div_argument {F : ℂ → ℂ} {a A : ℝ} {k : ℕ}
    (ha : 0 < a) (h : PoleBoundary F a k A) :
    PoleBoundary (fun s ↦ F s / s) a k (A / a) := by
  sorry

/-- Rescaling a positive abscissa to one contributes a power of the abscissa to the numerator. -/
theorem PoleBoundary.rescale {F : ℂ → ℂ} {a A : ℝ} {k : ℕ}
    (ha : 0 < a) (h : PoleBoundary F a k A) :
    PoleBoundary (fun s ↦ F (a * s)) 1 k (A / a ^ (k + 1)) := by
  sorry

/-- Multiplication by a function analytic along the closed half-plane multiplies the coefficient. -/
theorem PoleBoundary.mul_regular {F H : ℂ → ℂ} {a A C : ℝ} {k : ℕ}
    (h : PoleBoundary F a k A) (hH : AnalyticOnNhd ℂ H {s : ℂ | a ≤ s.re})
    (hC : H a = C) : PoleBoundary (fun s ↦ F s * H s) a k (A * C) := by
  sorry

/-- Products add the two pole orders, including their successor offsets. -/
theorem PoleBoundary.mul {F G : ℂ → ℂ} {a A B : ℝ} {k l : ℕ}
    (hF : PoleBoundary F a k A) (hG : PoleBoundary G a l B) :
    PoleBoundary (fun s ↦ F s * G s) a (k + l + 1) (A * B) := by
  sorry

/-- `PoleBoundary_test_model`: the model pole `A / (s - a) ^ (k + 1)` satisfies the predicate
with leading coefficient `A`. -/
theorem PoleBoundary_test_model (a A : ℝ) (k : ℕ) : PoleBoundary (fun s ↦ (A : ℂ) / (s - a) ^ (k + 1)) a k A := by
  sorry

/-- `PoleBoundary_test_boundary_value`: values on the boundary line are irrelevant; redefining
`1 / (s - 1)` at `s = 1` changes nothing. -/
theorem PoleBoundary_test_boundary_value : PoleBoundary (Function.update (fun s : ℂ ↦ 1 / (s - 1)) 1 37) 1 0 1 := by
  sorry

/-- `PoleBoundary_test_wrong_leading`, a negative control: `1 / (s - 1)` has leading coefficient
`1`, not `2`. -/
theorem PoleBoundary_test_wrong_leading : ¬ PoleBoundary (fun s : ℂ ↦ 1 / (s - 1)) 1 0 2 := by
  sorry

/-- `PoleBoundary_test_dyadic`, a negative control: the dyadic series `1 / (1 - 2 ^ (1 - s))` has a
simple pole at `1` with numerator value `1 / log 2`, but also poles at `1 + 2πi m / log 2`, so it
fails the predicate. -/
theorem PoleBoundary_test_dyadic : ¬ PoleBoundary (fun s : ℂ ↦ 1 / (1 - Complex.exp ((1 - s) * Real.log 2)))
    1 0 (1 / Real.log 2) := by
  sorry

/-- With nonzero leading coefficient the zero function cannot have the prescribed pole. -/
theorem PoleBoundary_test_zero_not_exact (a A : ℝ) (k : ℕ) (hA : A ≠ 0) :
    ¬ PoleBoundary (fun _ ↦ 0) a k A := by
  sorry

/-! ## Layer HP.1: squared-sinc smoothing and the polynomial weight -/

/-- The squared-sinc kernel `K_λ(v) = (λ / π) sinc (λ v)²`, written `squaredSinc ell v` with
`ell = λ`. For `λ > 0` it is a probability density whose Fourier transform, in angular frequency,
is the triangle `1 - |y| / (2λ)` on `[-2λ, 2λ]`. Belongs to Layer HP.1. -/
def squaredSinc (ell v : ℝ) : ℝ :=
  ell / Real.pi * Real.sinc (ell * v) ^ 2

/-- `squaredSinc_test_origin`: the value at the origin uses `Real.sinc 0 = 1`. -/
example (ell : ℝ) : squaredSinc ell 0 = ell / Real.pi := by
  simp [squaredSinc]

/-- `squaredSinc_test_zero`: the first zero is at `π / λ`, matching the frequency endpoint `2λ`. -/
example {ell : ℝ} (hell : 0 < ell) : squaredSinc ell (Real.pi / ell) = 0 := by
  simp [squaredSinc, mul_div_cancel₀ _ hell.ne', Real.sinc_of_ne_zero]

/-- At positive bandwidth the squared kernel is nonnegative. -/
theorem squaredSinc_nonneg {ell : ℝ} (hell : 0 < ell) (v : ℝ) : 0 ≤ squaredSinc ell v := by
  exact mul_nonneg (div_nonneg hell.le Real.pi_pos.le) (sq_nonneg _)

/-- The kernel is even for every real bandwidth. -/
theorem squaredSinc_even (ell v : ℝ) : squaredSinc ell (-v) = squaredSinc ell v := by
  simp [squaredSinc, mul_neg]

/-- The total kernel is continuous for every bandwidth, including zero. -/
theorem squaredSinc_continuous (ell : ℝ) : Continuous (squaredSinc ell) := by
  unfold squaredSinc
  fun_prop

/-- At positive bandwidth the squared kernel is Lebesgue integrable on the whole line. -/
theorem squaredSinc_integrable {ell : ℝ} (hell : 0 < ell) : Integrable (squaredSinc ell) := by
  sorry

/-- Layer HP.1 milestone: the kernel has total mass one. -/
theorem squaredSinc_mass {ell : ℝ} (hell : 0 < ell) : ∫ v : ℝ, squaredSinc ell v = 1 := by
  sorry

/-- Layer HP.1 milestone: the kernel is the inverse Fourier transform, in angular frequency, of the
triangle supported on `[-2λ, 2λ]`. -/
theorem squaredSinc_fourier {ell : ℝ} (hell : 0 < ell) (v : ℝ) :
    (squaredSinc ell v : ℂ) = 1 / (2 * Real.pi) *
      ∫ y : ℝ in (-(2 * ell))..(2 * ell),
        ((1 - |y| / (2 * ell) : ℝ) : ℂ) * Complex.exp (Complex.I * y * v) := by
  sorry

/-- Away from any fixed window the kernel mass tends to zero as bandwidth tends to infinity. -/
theorem squaredSinc_tail {h : ℝ} (hh : 0 < h) :
    Tendsto (fun ell : ℝ ↦ ∫ v in {v : ℝ | h ≤ |v|}, squaredSinc ell v) atTop (𝓝 0) := by
  sorry

/-- The mass at bandwidth two tests both the dilation and the factor of pi. -/
theorem squaredSinc_test_mass_two : ∫ v : ℝ, squaredSinc 2 v = 1 := by
  exact squaredSinc_mass (by norm_num)

/-- Delange's regularising weight `w_k(t) = t ∫₀¹ exp (-u t) u ^ k / k! du`. It vanishes at `0`,
is positive for `t > 0`, and `w_k(t) t ^ k → 1`. The definition is total in `t`. Belongs to
Layer HP.1. -/
def delangeWeight (k : ℕ) (t : ℝ) : ℝ :=
  t * ∫ u : ℝ in (0 : ℝ)..1, Real.exp (-u * t) * u ^ k / (k.factorial : ℝ)

/-- `delangeWeight_test_origin`: the regularising weight vanishes at the origin for every order. -/
example (k : ℕ) : delangeWeight k 0 = 0 := by
  simp [delangeWeight]

/-- The weight is continuous on the whole real line. -/
theorem delangeWeight_continuous (k : ℕ) : Continuous (delangeWeight k) := by
  sorry

/-- The weight is nonnegative at nonnegative times. -/
theorem delangeWeight_nonneg (k : ℕ) {t : ℝ} (ht : 0 ≤ t) : 0 ≤ delangeWeight k t := by
  sorry

/-- The weight is strictly positive at strictly positive times. -/
theorem delangeWeight_pos (k : ℕ) {t : ℝ} (ht : 0 < t) : 0 < delangeWeight k t := by
  sorry

/-- The first polynomial weight has the expected two-term exponential remainder. -/
theorem delangeWeight_test_double (t : ℝ) :
    t * delangeWeight 1 t = 1 - (1 + t) * Real.exp (-t) := by
  sorry

/-- `delangeWeight_test_simple`: `w₀(t) = 1 - exp (-t)` for every real `t`. -/
theorem delangeWeight_test_simple (t : ℝ) : delangeWeight 0 t = 1 - Real.exp (-t) := by
  sorry

/-- `delangeWeight_test_triple`: `t² w₂(t) = 1 - (1 + t + t² / 2) exp (-t)`; the weight carries
`2!`. -/
theorem delangeWeight_test_triple (t : ℝ) : t ^ 2 * delangeWeight 2 t = 1 - (1 + t + t ^ 2 / 2) * Real.exp (-t) := by
  sorry

/-- Layer HP.1 milestone: `w_k(t) t ^ k → 1` as `t → ∞`. -/
theorem delangeWeight_normalization (k : ℕ) :
    Tendsto (fun t : ℝ ↦ delangeWeight k t * t ^ k) atTop (𝓝 1) := by
  sorry

/-- Layer HP.1 milestone: the weight varies slowly, `w_k(t + h) / w_k(t) → 1` for fixed `h`. -/
theorem delangeWeight_shift (k : ℕ) (h : ℝ) :
    Tendsto (fun t : ℝ ↦ delangeWeight k (t + h) / delangeWeight k t) atTop (𝓝 1) := by
  sorry

/-- Shift ratios tend uniformly to one on each fixed compact interval of shifts. -/
theorem delangeWeight_shift_uniform (k : ℕ) {H : ℝ} (hH : 0 < H) :
    ∀ ε : ℝ, 0 < ε → ∀ᶠ t : ℝ in atTop, ∀ h : ℝ, |h| ≤ H →
      |delangeWeight k (t + h) / delangeWeight k t - 1| < ε := by
  sorry

/-- The normalized lower Gamma integral is at most the full Gamma integral. -/
theorem delangeWeight_bound (k : ℕ) {t : ℝ} (ht : 0 ≤ t) : delangeWeight k t * t ^ k ≤ 1 := by
  sorry

/-! ## Layer HP.2: regularised transforms and the smoothed limit -/

/-- The integer Gamma model: `exp (a t) t ^ k` has transform `k! / (s - a) ^ (k + 1)` on
`Re s > a` (Delange 1954, Lemma 4, p. 233). -/
theorem integerGammaLaplace (k : ℕ) {a : ℝ} {s : ℂ} (hs : a < s.re) :
    HasLaplace (fun t : ℝ ↦ ((Real.exp (a * t) * t ^ k : ℝ) : ℂ)) s
      ((k.factorial : ℂ) / (s - a) ^ (k + 1)) := by
  sorry

/-- The exponential Gamma model, fixing the order-one denominator. -/
theorem integerGammaLaplace_test_zero {a : ℝ} {s : ℂ} (hs : a < s.re) :
    HasLaplace (fun t : ℝ ↦ (Real.exp (a * t) : ℂ)) s (1 / (s - a)) := by
  sorry

/-- The linear Gamma model, fixing the order-two denominator. -/
theorem integerGammaLaplace_test_one {a : ℝ} {s : ℂ} (hs : a < s.re) :
    HasLaplace (fun t : ℝ ↦ ((Real.exp (a * t) * t : ℝ) : ℂ)) s (1 / (s - a) ^ 2) := by
  sorry

/-- Locally integrable boundary values of the regularised remainder. With
`R = F - A / (s - a) ^ (k + 1)` and `H(s) = -∫₀¹ R'(s + u) u ^ k / k! du`, the functions
`y ↦ H(a + ε + i y)` converge in `L¹` on every compact interval as `ε → 0⁺`. The derivative is
only evaluated in the open half-plane. -/
theorem regularizedBoundaryL1 {F : ℂ → ℂ} {a A : ℝ} {k : ℕ} (h : PoleBoundary F a k A) :
    let R := fun s : ℂ ↦ F s - (A : ℂ) / (s - a) ^ (k + 1)
    let H := fun s : ℂ ↦ -∫ u : ℝ in (0 : ℝ)..1,
      deriv R (s + u) * ((u ^ k / (k.factorial : ℝ) : ℝ) : ℂ)
    ∃ b : ℝ → ℂ, ∀ L : ℝ, 0 < L →
      IntegrableOn b (Icc (-L) L) ∧
      Tendsto (fun ε : ℝ ↦ ∫ y in Icc (-L) L, ‖H ((a : ℂ) + ε + y * Complex.I) - b y‖)
        (𝓝[>] 0) (𝓝 0) := by
  sorry

/-- Subtracting the exact model leaves zero regularised remainder at every argument. -/
theorem regularizedBoundary_test_model (a A : ℝ) (k : ℕ) :
    let F := fun s : ℂ ↦ (A : ℂ) / (s - a) ^ (k + 1)
    let R := fun s : ℂ ↦ F s - (A : ℂ) / (s - a) ^ (k + 1)
    ∀ s : ℂ, (-∫ u : ℝ in (0 : ℝ)..1,
      deriv R (s + u) * ((u ^ k / (k.factorial : ℝ) : ℝ) : ℂ)) = 0 := by
  simp

/-- An order-one remainder at k = 1 gives a logarithmic boundary singularity. -/
theorem regularizedBoundary_test_log {y : ℝ} (hy : y ≠ 0) (c : ℂ) :
    (∫ u : ℝ in (0 : ℝ)..1, c * u / ((u : ℂ) + y * Complex.I) ^ 2) =
      c * (Complex.log (1 + y * Complex.I) - Complex.log (y * Complex.I) +
        y * Complex.I / (1 + y * Complex.I) - 1) := by
  sorry

/-- Layer HP.2 milestone: the smoothed limit. The weighted function
`w_k(t) exp (-a t) α(t)`, convolved with the squared-sinc kernel at any bandwidth, tends to
`A / k!`. No growth bound on `α` is assumed. -/
theorem delangeSmoothedLimit {α : ℝ → ℝ} {F : ℂ → ℂ} {a A : ℝ} {k : ℕ}
    (ha : 0 < a) (hα : MonotoneOn α (Ici 0)) (hα0 : ∀ t ∈ Ici (0 : ℝ), 0 ≤ α t)
    (hF : ∀ s : ℂ, a < s.re → HasLaplace (fun t ↦ (α t : ℂ)) s (F s))
    (hboundary : PoleBoundary F a k A) {ell : ℝ} (hell : 0 < ell) :
    (∀ T : ℝ, IntegrableOn (fun t : ℝ ↦
      delangeWeight k t * Real.exp (-a * t) * α t * squaredSinc ell (t - T)) (Ici 0)) ∧
    Tendsto (fun T : ℝ ↦ ∫ t in Ici (0 : ℝ),
      delangeWeight k t * Real.exp (-a * t) * α t * squaredSinc ell (t - T))
      atTop (𝓝 (A / (k.factorial : ℝ))) := by
  sorry

/-- The smoothed Gamma model has limit one at every positive bandwidth. -/
theorem delangeSmoothedLimit_test_model (k : ℕ) {a ell : ℝ} (ha : 0 < a) (hell : 0 < ell) :
    (∀ T : ℝ, IntegrableOn (fun t : ℝ ↦ delangeWeight k t * Real.exp (-a * t) *
      (Real.exp (a * t) * t ^ k) * squaredSinc ell (t - T)) (Ici 0)) ∧
    Tendsto (fun T : ℝ ↦ ∫ t in Ici (0 : ℝ), delangeWeight k t * Real.exp (-a * t) *
      (Real.exp (a * t) * t ^ k) * squaredSinc ell (t - T)) atTop (𝓝 1) := by
  sorry

/-! ## Layer HP.3: Delange's theorem for integer pole orders -/

/-- Monotone removal of the smoothing: smoothed limits `C` at every bandwidth, for a nonnegative
nondecreasing `α`, give `α(t) / (exp (a t) t ^ k) → C`. A single bandwidth does not suffice. -/
theorem monotoneUnsmoothing {α : ℝ → ℝ} {a C : ℝ} {k : ℕ}
    (ha : 0 < a) (hC : 0 ≤ C)
    (hα : MonotoneOn α (Ici 0)) (hα0 : ∀ t ∈ Ici (0 : ℝ), 0 ≤ α t)
    (hsmooth : ∀ ell : ℝ, 0 < ell →
      (∀ T : ℝ, IntegrableOn (fun t : ℝ ↦
        delangeWeight k t * Real.exp (-a * t) * α t * squaredSinc ell (t - T)) (Ici 0)) ∧
      Tendsto (fun T : ℝ ↦ ∫ t in Ici (0 : ℝ),
        delangeWeight k t * Real.exp (-a * t) * α t * squaredSinc ell (t - T))
        atTop (𝓝 C)) :
    Tendsto (fun t : ℝ ↦ α t / (Real.exp (a * t) * t ^ k)) atTop (𝓝 C) := by
  sorry

/-- A fixed bandwidth cannot detect a sufficiently small higher-frequency oscillation,
even when the underlying counting function is nonnegative and nondecreasing. -/
theorem monotoneUnsmoothing_test_one_bandwidth {a C ell : ℝ} (ha : 0 < a) (hC : 0 < C)
    (hell : 0 < ell) (k : ℕ) :
    ∃ α : ℝ → ℝ, MonotoneOn α (Ici 0) ∧ (∀ t ∈ Ici (0 : ℝ), 0 ≤ α t) ∧
      (∀ T : ℝ, IntegrableOn (fun t : ℝ ↦ delangeWeight k t * Real.exp (-a * t) *
        α t * squaredSinc ell (t - T)) (Ici 0)) ∧
      Tendsto (fun T : ℝ ↦ ∫ t in Ici (0 : ℝ), delangeWeight k t * Real.exp (-a * t) *
        α t * squaredSinc ell (t - T)) atTop (𝓝 C) ∧
      ¬ ∃ L : ℝ, Tendsto (fun t : ℝ ↦ α t / (Real.exp (a * t) * t ^ k)) atTop (𝓝 L) := by
  sorry

/-- Vanishing smoothed limits at all bandwidths yield a little-o conclusion. -/
theorem monotoneUnsmoothing_test_zero {α : ℝ → ℝ} {a : ℝ} {k : ℕ}
    (ha : 0 < a) (hα : MonotoneOn α (Ici 0)) (hα0 : ∀ t ∈ Ici (0 : ℝ), 0 ≤ α t)
    (hsmooth : ∀ ell : ℝ, 0 < ell →
      (∀ T : ℝ, IntegrableOn (fun t : ℝ ↦ delangeWeight k t * Real.exp (-a * t) *
        α t * squaredSinc ell (t - T)) (Ici 0)) ∧
      Tendsto (fun T : ℝ ↦ ∫ t in Ici (0 : ℝ), delangeWeight k t * Real.exp (-a * t) *
        α t * squaredSinc ell (t - T)) atTop (𝓝 0)) :
    Tendsto (fun t : ℝ ↦ α t / (Real.exp (a * t) * t ^ k)) atTop (𝓝 0) := by
  exact monotoneUnsmoothing ha le_rfl hα hα0 hsmooth

/-- **Delange's theorem for a pole of integer order `k + 1`.** Let `α ≥ 0` be nondecreasing on
`[0, ∞)` with Laplace transform `F` on `Re s > a > 0`, and let `F` satisfy `PoleBoundary F a k A`
with `A > 0`. Then `α(t) ~ (A / k!) exp (a t) t ^ k` (Delange 1954, Theorem III, §5.2.1,
pp. 235–238, with exponent `k + 1`). -/
theorem delangeLaplace {α : ℝ → ℝ} {F : ℂ → ℂ} {a A : ℝ} {k : ℕ}
    (ha : 0 < a) (hA : 0 < A)
    (hα : MonotoneOn α (Ici 0)) (hα0 : ∀ t ∈ Ici (0 : ℝ), 0 ≤ α t)
    (hF : ∀ s : ℂ, a < s.re → HasLaplace (fun t ↦ (α t : ℂ)) s (F s))
    (hboundary : PoleBoundary F a k A) :
    Tendsto (fun t : ℝ ↦ α t / (Real.exp (a * t) * t ^ k))
      atTop (𝓝 (A / (k.factorial : ℝ))) := by
  sorry

/-- Simple poles give the exponential main term without a polynomial factor. -/
theorem delangeLaplace_test_simple {α : ℝ → ℝ} {F : ℂ → ℂ} {a A : ℝ}
    (ha : 0 < a) (hA : 0 < A) (hα : MonotoneOn α (Ici 0))
    (hα0 : ∀ t ∈ Ici (0 : ℝ), 0 ≤ α t)
    (hF : ∀ s : ℂ, a < s.re → HasLaplace (fun t ↦ (α t : ℂ)) s (F s))
    (hboundary : PoleBoundary F a 0 A) :
    Tendsto (fun t : ℝ ↦ α t / Real.exp (a * t)) atTop (𝓝 A) := by
  simpa using delangeLaplace ha hA hα hα0 hF hboundary

/-- Double poles give one power of time with coefficient A. -/
theorem delangeLaplace_test_double {α : ℝ → ℝ} {F : ℂ → ℂ} {a A : ℝ}
    (ha : 0 < a) (hA : 0 < A) (hα : MonotoneOn α (Ici 0))
    (hα0 : ∀ t ∈ Ici (0 : ℝ), 0 ≤ α t)
    (hF : ∀ s : ℂ, a < s.re → HasLaplace (fun t ↦ (α t : ℂ)) s (F s))
    (hboundary : PoleBoundary F a 1 A) :
    Tendsto (fun t : ℝ ↦ α t / (Real.exp (a * t) * t)) atTop (𝓝 A) := by
  simpa using delangeLaplace ha hA hα hα0 hF hboundary

/-- The Gamma model normalizes to one at every natural pole index. -/
theorem delangeLaplace_test_model (k : ℕ) (a : ℝ) :
    Tendsto (fun t : ℝ ↦ (Real.exp (a * t) * t ^ k) / (Real.exp (a * t) * t ^ k))
      atTop (𝓝 (1 : ℝ)) := by
  sorry

/-! ## Layer HP.4: counting functions of Dirichlet series and perturbations -/

/-- The logarithmic counting function `α(t) = ∑_{1 ≤ n ≤ eᵗ} c n` of a nonnegative Dirichlet
series has Laplace transform `F(s) / s` wherever the series converges absolutely with
`Re s > 0`; it is nonnegative, nondecreasing, and `α 0 = c 1`. -/
theorem logSummatory_hasLaplace {c : ℕ → ℝ} {F : ℂ → ℂ} {s : ℂ}
    (hc : ∀ n, 0 ≤ c n) (hs : 0 < s.re)
    (hF : LSeriesHasSum (fun n ↦ (c n : ℂ)) s (F s)) :
    let α := fun t : ℝ ↦
      TauCeti.summatory (fun n : ℕ ↦ n) (fun n ↦ if n = 0 then 0 else c n) (Real.exp t)
    HasLaplace (fun t ↦ (α t : ℂ)) s (F s / s) ∧
      (∀ t ∈ Ici (0 : ℝ), 0 ≤ α t) ∧ MonotoneOn α (Ici 0) ∧ α 0 = c 1 := by
  sorry

/-- At logarithmic time zero only the coefficient at one contributes. -/
theorem logSummatory_test_initial (c : ℕ → ℝ) :
    TauCeti.summatory (fun n : ℕ ↦ n) (fun n ↦ if n = 0 then 0 else c n)
      (Real.exp 0) = c 1 := by
  sorry

/-- Unit mass at n = 1 gives a constant logarithmic count and ordinary transform 1/s. -/
theorem logSummatory_test_unit_mass {s : ℂ} (hs : 0 < s.re) :
    let α := fun t : ℝ ↦ TauCeti.summatory (fun n : ℕ ↦ n)
      (fun n ↦ if n = 1 then (1 : ℝ) else 0) (Real.exp t)
    (∀ t ∈ Ici (0 : ℝ), α t = 1) ∧ HasLaplace (fun t ↦ (α t : ℂ)) s (1 / s) := by
  sorry

/-- `logSummatory_test_endpoint`: the cutoff is inclusive and the `n = 0` coefficient is
discarded, `∑_{1 ≤ n ≤ 2} c n = c 1 + c 2`. -/
theorem logSummatory_test_endpoint (c : ℕ → ℝ) :
    TauCeti.summatory (fun n : ℕ ↦ n) (fun n ↦ if n = 0 then 0 else c n)
      (Real.exp (Real.log 2)) = c 1 + c 2 := by
  sorry

/-- **Higher-pole counting at abscissa one.** For `c ≥ 0` with Dirichlet series `F` on
`Re s > 1` and `PoleBoundary F 1 k A`, `A > 0`:
`∑_{1 ≤ n ≤ X} c n ~ (A / k!) X (log X) ^ k`. -/
theorem delangeDirichlet {c : ℕ → ℝ} {F : ℂ → ℂ} {A : ℝ} {k : ℕ}
    (hc : ∀ n, 0 ≤ c n) (hA : 0 < A)
    (hF : ∀ s : ℂ, 1 < s.re → LSeriesHasSum (fun n ↦ (c n : ℂ)) s (F s))
    (hboundary : PoleBoundary F 1 k A) :
    Tendsto (fun X : ℝ ↦ TauCeti.summatory (fun n : ℕ ↦ n)
      (fun n ↦ if n = 0 then 0 else c n) X / (X * Real.log X ^ k))
      atTop (𝓝 (A / (k.factorial : ℝ))) := by
  sorry

/-- The simple pole of zeta counts positive integers with limiting density one. -/
theorem counting_test_ones :
    (∀ s : ℂ, 1 < s.re → LSeriesHasSum (fun _ ↦ (1 : ℂ)) s (riemannZeta s)) ∧
    PoleBoundary riemannZeta 1 0 1 ∧
    Tendsto (fun X : ℝ ↦ TauCeti.summatory (fun n : ℕ ↦ n)
      (fun n ↦ if n = 0 then (0 : ℝ) else 1) X / X) atTop (𝓝 1) := by
  sorry

/-- **Higher-pole counting at a positive abscissa.** For `a > 0`:
`∑_{1 ≤ n ≤ X} c n ~ (A / (a k!)) X ^ a (log X) ^ k`. -/
theorem delangeDirichlet_positiveAbscissa {c : ℕ → ℝ} {F : ℂ → ℂ}
    {a A : ℝ} {k : ℕ} (hc : ∀ n, 0 ≤ c n) (ha : 0 < a) (hA : 0 < A)
    (hF : ∀ s : ℂ, a < s.re → LSeriesHasSum (fun n ↦ (c n : ℂ)) s (F s))
    (hboundary : PoleBoundary F a k A) :
    Tendsto (fun X : ℝ ↦ TauCeti.summatory (fun n : ℕ ↦ n)
      (fun n ↦ if n = 0 then 0 else c n) X / (X ^ a * Real.log X ^ k))
      atTop (𝓝 (A / (a * (k.factorial : ℝ)))) := by
  sorry

/-- `counting_test_abscissa_two`, the factor `1 / a`: the coefficients `c n = n` have series
`ζ(s - 1)`, a simple pole at `2` with numerator `1`, so `∑_{n ≤ X} n ~ X² / 2`. -/
theorem counting_test_abscissa_two : Tendsto (fun X : ℝ ↦ TauCeti.summatory (fun n : ℕ ↦ n)
    (fun n ↦ (n : ℝ)) X / X ^ (2 : ℝ)) atTop (𝓝 (1 / 2)) := by
  sorry

/-- At abscissa zero the harmonic coefficients have a simple pole but a logarithmic count. -/
theorem counting_test_abscissa_zero :
    (∀ s : ℂ, 0 < s.re → LSeriesHasSum (fun n ↦ ((n : ℂ)⁻¹)) s (riemannZeta (s + 1))) ∧
    PoleBoundary (fun s ↦ riemannZeta (s + 1)) 0 0 1 ∧
    PoleBoundary (fun s ↦ riemannZeta (s + 1) / s) 0 1 1 ∧
    Tendsto (fun X : ℝ ↦ TauCeti.summatory (fun n : ℕ ↦ n)
      (fun n ↦ (n : ℝ)⁻¹) X / Real.log X) atTop (𝓝 1) ∧
    Tendsto (fun X : ℝ ↦ TauCeti.summatory (fun n : ℕ ↦ n)
      (fun n ↦ (n : ℝ)⁻¹) X) atTop atTop := by
  sorry

/-- Altering finitely many coefficients, of any sign, does not change a counting asymptotic at the
scale `X ^ a (log X) ^ k` with `a > 0`. -/
theorem finiteChange_asymptotic {c d : ℕ → ℝ} {a C : ℝ} {k : ℕ}
    (ha : 0 < a) (hcd : ∀ᶠ n in cofinite, c n = d n)
    (hc : Tendsto (fun X : ℝ ↦ TauCeti.summatory (fun n : ℕ ↦ n)
      (fun n ↦ if n = 0 then 0 else c n) X / (X ^ a * Real.log X ^ k)) atTop (𝓝 C)) :
    Tendsto (fun X : ℝ ↦ TauCeti.summatory (fun n : ℕ ↦ n)
      (fun n ↦ if n = 0 then 0 else d n) X / (X ^ a * Real.log X ^ k))
      atTop (𝓝 C) := by
  sorry

/-- A signed perturbation dominated coefficientwise by a nonnegative series whose pole has strictly
lower order `l + 1 < k + 1` is negligible at the scale `X ^ a (log X) ^ k`. The majorant carries
its own convergence and boundary hypotheses. -/
theorem lowerPole_perturbation {c d b : ℕ → ℝ} {G : ℂ → ℂ} {a B C : ℝ} {k l : ℕ}
    (ha : 0 < a) (hB : 0 < B) (hlk : l < k) (hb : ∀ n, 0 ≤ b n)
    (hbound : ∀ n, |d n - c n| ≤ b n)
    (hG : ∀ s : ℂ, a < s.re → LSeriesHasSum (fun n ↦ (b n : ℂ)) s (G s))
    (hboundary : PoleBoundary G a l B)
    (hc : Tendsto (fun X : ℝ ↦ TauCeti.summatory (fun n : ℕ ↦ n)
      (fun n ↦ if n = 0 then 0 else c n) X / (X ^ a * Real.log X ^ k)) atTop (𝓝 C)) :
    Tendsto (fun X : ℝ ↦ TauCeti.summatory (fun n : ℕ ↦ n)
      (fun n ↦ if n = 0 then 0 else d n) X / (X ^ a * Real.log X ^ k))
      atTop (𝓝 C) := by
  sorry

/-- Equal pole orders can double the limit: c = b = 1 and d = 2 on positive integers
satisfy the coefficient bound but have limits one and two at scale X. -/
theorem lowerPole_test_equal_order :
    (∀ n : ℕ, |(2 : ℝ) - 1| ≤ 1) ∧
    Tendsto (fun X : ℝ ↦ TauCeti.summatory (fun n : ℕ ↦ n)
      (fun n ↦ if n = 0 then (0 : ℝ) else 1) X / X) atTop (𝓝 1) ∧
    Tendsto (fun X : ℝ ↦ TauCeti.summatory (fun n : ℕ ↦ n)
      (fun n ↦ if n = 0 then (0 : ℝ) else 2) X / X) atTop (𝓝 2) := by
  sorry

/-! ## Layer HP.5: zeta checks and the necessity of the boundary hypothesis -/

/-- The divisor function: `∑ d(n) n⁻ˢ = ζ(s)²` on `Re s > 1`, `ζ²` has a double pole at `1` with
numerator value `1`, and `∑_{n ≤ X} d(n) ~ X log X`. -/
theorem zetaSquare_counting :
    (∀ s : ℂ, 1 < s.re →
      LSeriesHasSum (fun n ↦ (n.divisors.card : ℂ)) s (riemannZeta s ^ 2)) ∧
    PoleBoundary (fun s ↦ riemannZeta s ^ 2) 1 1 1 ∧
    Tendsto (fun X : ℝ ↦ TauCeti.summatory (fun n : ℕ ↦ n)
      (fun n ↦ (n.divisors.card : ℝ)) X / (X * Real.log X)) atTop (𝓝 1) := by
  sorry

/-- `counting_test_divisor_fourfold`, the factorial at `k = 3`: `d₄ = σ₀ * σ₀` has Dirichlet
series `ζ⁴`, a pole of order four at `1` with numerator value `1`, so
`∑_{n ≤ X} d₄(n) ~ X (log X)³ / 3!`. Normalising by `k`, `(k - 1)!` or `(k + 1)!` would give
`1 / 3`, `1 / 2` or `1 / 24`. -/
theorem counting_test_divisor_fourfold :
    (∀ s : ℂ, 1 < s.re →
      LSeriesHasSum (fun n ↦ (((ArithmeticFunction.sigma 0 * ArithmeticFunction.sigma 0 :
        ArithmeticFunction ℕ) n : ℕ) : ℂ)) s (riemannZeta s ^ 4)) ∧
    PoleBoundary (fun s ↦ riemannZeta s ^ 4) 1 3 1 ∧
    Tendsto (fun X : ℝ ↦ TauCeti.summatory (fun n : ℕ ↦ n)
    (fun n ↦ (((ArithmeticFunction.sigma 0 * ArithmeticFunction.sigma 0 : ArithmeticFunction ℕ) n :
      ℕ) : ℝ)) X / (X * Real.log X ^ 3)) atTop (𝓝 (1 / 6)) := by
  sorry

/-- `counting_test_insert_one`: adding `7` at `n = 1` to the divisor function leaves the
limit `1`. -/
theorem counting_test_insert_one : Tendsto (fun X : ℝ ↦ TauCeti.summatory (fun n : ℕ ↦ n)
    (fun n ↦ (n.divisors.card : ℝ) + if n = 1 then 7 else 0) X / (X * Real.log X))
    atTop (𝓝 1) := by
  sorry

/-- **A local pole is not enough.** The coefficients `c n = n` on powers of two and `0`
elsewhere have Dirichlet series `1 / (1 - 2 ^ (1 - s))` on `Re s > 1`, with a simple pole at `1`
and numerator value `1 / log 2` there, yet `PoleBoundary` fails because of the other poles on
`Re s = 1`, and `X⁻¹ ∑_{n ≤ X} c n` has the two limit points `2` and `4 / 3`. -/
theorem dyadicLocalPoleCounterexample :
    let c : ℕ → ℝ := (Set.range fun j : ℕ ↦ (2 : ℕ) ^ j).indicator fun n ↦ (n : ℝ)
    let F : ℂ → ℂ := fun s ↦ 1 / (1 - Complex.exp ((1 - s) * Real.log 2))
    (∀ n, 0 ≤ c n) ∧
    (∀ s : ℂ, 1 < s.re → LSeriesHasSum (fun n ↦ (c n : ℂ)) s (F s)) ∧
    (∃ r : ℝ, 0 < r ∧ ∃ g : ℂ → ℂ, AnalyticOnNhd ℂ g (Metric.ball 1 r) ∧
      g 1 = ((1 / Real.log 2 : ℝ) : ℂ) ∧
      ∀ s ∈ Metric.ball (1 : ℂ) r, 1 < s.re → F s = g s / (s - 1)) ∧
    ¬ PoleBoundary F 1 0 (1 / Real.log 2) ∧
    Tendsto (fun j : ℕ ↦ TauCeti.summatory (fun n : ℕ ↦ n) c ((2 : ℝ) ^ j) / (2 : ℝ) ^ j)
      atTop (𝓝 2) ∧
    Tendsto (fun j : ℕ ↦ TauCeti.summatory (fun n : ℕ ↦ n) c (3 * (2 : ℝ) ^ j) /
      (3 * (2 : ℝ) ^ j)) atTop (𝓝 (4 / 3)) ∧
    ¬ Tendsto (fun X : ℝ ↦ TauCeti.summatory (fun n : ℕ ↦ n) c X / X) atTop
      (𝓝 (1 / Real.log 2)) := by
  sorry

/-- The two exact dyadic cutoff formulas determine the first values and the two limits. -/
theorem dyadic_test_values (j : ℕ) :
    let c : ℕ → ℝ := (Set.range fun i : ℕ ↦ (2 : ℕ) ^ i).indicator fun n ↦ (n : ℝ)
    TauCeti.summatory (fun n : ℕ ↦ n) c ((2 : ℝ) ^ j) = (2 : ℝ) ^ (j + 1) - 1 ∧
    TauCeti.summatory (fun n : ℕ ↦ n) c (3 * (2 : ℝ) ^ j) = (2 : ℝ) ^ (j + 2) - 1 := by
  sorry

/-- The local residue lies strictly between the two dyadic limit points. -/
theorem dyadic_test_residue : (4 / 3 : ℝ) < 1 / Real.log 2 ∧ 1 / Real.log 2 < 2 := by
  sorry

end TauCetiRoadmap.ArithmeticDirichletSeriesPartII
