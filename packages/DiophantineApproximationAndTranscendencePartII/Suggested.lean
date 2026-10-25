import Mathlib

/-!
# Diophantine approximation and transcendence, Part II: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs, with simple definitions on native carriers.

The corrected holonomic W rank bound, the field and scalar-span comparison, and
integral-coordinate holonomic finiteness are not statable at the pins: they lack
the scalar differential-equation carrier with full meromorphic local solution bases
and the resulting arithmetic holonomic germ ring. The centred capacity rank theorem
also lacks the general logarithmic capacity and equilibrium-measure interface.
These remain targets of Layers 4 and 5, without substitute predicates here.
-/

namespace TauCetiRoadmap.DiophantineApproximationAndTranscendencePartII

open scoped BigOperators Topology LaurentSeries RatFunc
open Filter

/-! ## Layer 0: arithmetic germs and uniform denominators -/

/-- A rational power series is integral when each coefficient is an integer. -/
def IntegralSeries (f : PowerSeries ℚ) : Prop :=
  ∀ n : ℕ, ∃ a : ℤ, PowerSeries.coeff n f = (a : ℚ)

/-- An analytic germ with Taylor coefficients f pulls back along φ to the germ of g.
The coefficient convention divides the nth ordinary derivative by n!. -/
def Uniformizes (φ : ℂ → ℂ) (f : PowerSeries ℚ) (g : ℂ → ℂ) : Prop :=
  ∃ F : ℂ → ℂ, AnalyticAt ℂ F 0 ∧
    (∀ n : ℕ, ((PowerSeries.coeff n f : ℚ) : ℂ) =
      iteratedDeriv n F 0 / (n.factorial : ℂ)) ∧
    g =ᶠ[𝓝 (0 : ℂ)] (F ∘ φ)

/-- The positive logarithmic mean on the unit circle uses probability normalization. -/
noncomputable def positiveLogMean (g : ℂ → ℂ) : ℝ :=
  Real.circleAverage (fun z => Real.log (max 1 ‖g z‖)) 0 1

/-- The scalar field Q(p) inside the native Laurent-series field. -/
noncomputable def rationalFunctionField (p : RatFunc ℚ) :
    IntermediateField ℚ (LaurentSeries ℚ) :=
  IntermediateField.adjoin ℚ {(p : LaurentSeries ℚ)}

/-- An algebraic series over Qbar has uniform exponential coefficient denominators.
An integral constant term lets the scalar denominator be absorbed into the variable scale.
Bilu--Borichev, Remarks on Eisenstein, Section 1 and Theorem 6.1. -/
theorem eisenstein_denominators (f : PowerSeries (AlgebraicClosure ℚ))
    (hf : IsAlgebraic (RatFunc (AlgebraicClosure ℚ))
      (f : LaurentSeries (AlgebraicClosure ℚ))) :
    ∃ c M : ℕ, 0 < c ∧ 0 < M ∧
      (∀ n : ℕ, IsIntegral ℤ
        ((c : AlgebraicClosure ℚ) * (M : AlgebraicClosure ℚ) ^ n *
          PowerSeries.coeff n f)) ∧
      (IsIntegral ℤ (PowerSeries.coeff 0 f) →
        ∀ n : ℕ, IsIntegral ℤ
          (((c * M : ℕ) : AlgebraicClosure ℚ) ^ n * PowerSeries.coeff n f)) := by
  sorry

/-! ## Layer 1: auxiliary functions and arithmetic extrapolation -/

/-- The logarithm of the larger of the two boundary suprema for a multiplier h. -/
noncomputable def multiplierLogBound (h g : ℂ → ℂ) : ℝ :=
  Real.log (sSup ((fun z => max ‖h z‖ ‖h z * g z‖) '' Metric.sphere (0 : ℂ) 1))

/-- Integral simultaneous germs independent over Q(p) satisfy the normalized-multiplier
rank bound. Calegari--Dimitrov--Tang, Lemma 2.0.8. -/
theorem multiplier_rank_bound (p : RatFunc ℚ) (pSeries χ : PowerSeries ℚ)
    (φ g h : ℂ → ℂ) (m : ℕ) (f : Fin m → PowerSeries ℚ)
    (u : Fin m → ℂ → ℂ)
    (hp : ¬ ∃ a : ℚ, p = RatFunc.C a)
    (hregular : (pSeries : LaurentSeries ℚ) = (p : LaurentSeries ℚ))
    (hχ0 : PowerSeries.coeff 0 χ = 0) (hχ1 : PowerSeries.coeff 1 χ = 1)
    (hpInt : IntegralSeries (PowerSeries.subst χ pSeries))
    (hfInt : ∀ i, IntegralSeries (PowerSeries.subst χ (f i)))
    (hφ : AnalyticOnNhd ℂ φ (Metric.closedBall 0 1)) (hφ0 : φ 0 = 0)
    (hExpansion : 1 < ‖deriv φ 0‖)
    (hg : AnalyticOnNhd ℂ g (Metric.closedBall 0 1)) (hgp : Uniformizes φ pSeries g)
    (hu : ∀ i, AnalyticOnNhd ℂ (u i) (Metric.closedBall 0 1))
    (huf : ∀ i, Uniformizes φ (f i) (u i))
    (hlin : LinearIndependent (rationalFunctionField p)
      (fun i => (f i : LaurentSeries ℚ)))
    (hh : AnalyticOnNhd ℂ h (Metric.closedBall 0 1)) (hh0 : h 0 = 1) :
    (m : ℝ) ≤ Real.exp 1 * multiplierLogBound h g / Real.log ‖deriv φ 0‖ := by
  sorry

/-! ## Layer 2: integrated rank and algebraicity -/

/-- The independent family size is bounded by e times the positive logarithmic mean,
divided by the logarithm of the uniformizing derivative. CDT, Theorem 2.0.1. -/
theorem mean_rank_bound (p : RatFunc ℚ) (pSeries χ : PowerSeries ℚ)
    (φ g : ℂ → ℂ) (m : ℕ) (f : Fin m → PowerSeries ℚ)
    (u : Fin m → ℂ → ℂ)
    (hp : ¬ ∃ a : ℚ, p = RatFunc.C a)
    (hregular : (pSeries : LaurentSeries ℚ) = (p : LaurentSeries ℚ))
    (hχ0 : PowerSeries.coeff 0 χ = 0) (hχ1 : PowerSeries.coeff 1 χ = 1)
    (hpInt : IntegralSeries (PowerSeries.subst χ pSeries))
    (hfInt : ∀ i, IntegralSeries (PowerSeries.subst χ (f i)))
    (hφ : AnalyticOnNhd ℂ φ (Metric.closedBall 0 1)) (hφ0 : φ 0 = 0)
    (hExpansion : 1 < ‖deriv φ 0‖)
    (hg : AnalyticOnNhd ℂ g (Metric.closedBall 0 1)) (hgp : Uniformizes φ pSeries g)
    (hu : ∀ i, AnalyticOnNhd ℂ (u i) (Metric.closedBall 0 1))
    (huf : ∀ i, Uniformizes φ (f i) (u i))
    (hlin : LinearIndependent (rationalFunctionField p)
      (fun i => (f i : LaurentSeries ℚ))) :
    (m : ℝ) ≤ Real.exp 1 * positiveLogMean g / Real.log ‖deriv φ 0‖ := by
  sorry

/-- An integral arithmetic pullback and a common large analytic uniformization force
algebraicity over both Q(p) and Q(x). CDT, Theorem 2.0.1, algebraicity clause. -/
theorem arithmetic_algebraicity (p : RatFunc ℚ) (pSeries χ f : PowerSeries ℚ)
    (φ g u : ℂ → ℂ)
    (hp : ¬ ∃ a : ℚ, p = RatFunc.C a)
    (hregular : (pSeries : LaurentSeries ℚ) = (p : LaurentSeries ℚ))
    (hχ0 : PowerSeries.coeff 0 χ = 0) (hχ1 : PowerSeries.coeff 1 χ = 1)
    (hpInt : IntegralSeries (PowerSeries.subst χ pSeries))
    (hfInt : IntegralSeries (PowerSeries.subst χ f))
    (hφ : AnalyticOnNhd ℂ φ (Metric.closedBall 0 1)) (hφ0 : φ 0 = 0)
    (hExpansion : 1 < ‖deriv φ 0‖)
    (hg : AnalyticOnNhd ℂ g (Metric.closedBall 0 1)) (hgp : Uniformizes φ pSeries g)
    (hu : AnalyticOnNhd ℂ u (Metric.closedBall 0 1)) (huf : Uniformizes φ f u) :
    IsAlgebraic (rationalFunctionField p) (f : LaurentSeries ℚ) ∧
      IsAlgebraic (RatFunc ℚ) (f : LaurentSeries ℚ) := by
  sorry

/-- André's open-disc criterion for the rational image of an integral power series:
a uniformizing derivative of modulus strictly greater than one forces algebraicity.
CDT, Section 1.1.1, derived from Theorem 2.0.1 by shrinking the parameter disc. -/
theorem andre_algebraicity (f : PowerSeries ℚ) (φ u : ℂ → ℂ)
    (hf : IntegralSeries f)
    (hφ : DifferentiableOn ℂ φ (Metric.ball 0 1)) (hφ0 : φ 0 = 0)
    (hExpansion : 1 < ‖deriv φ 0‖)
    (hu : DifferentiableOn ℂ u (Metric.ball 0 1)) (huf : Uniformizes φ f u) :
    IsAlgebraic (RatFunc ℚ) (f : LaurentSeries ℚ) := by
  sorry

/-! ## Layer 3: circle discrepancy and Vandermonde damping -/

/-- Circular discrepancy is the supremum of the errors in all rotated half-open arcs.
The empty population has value zero; rank and damping statements use nonempty samples. -/
noncomputable def circleDiscrepancy {d : ℕ} (z : Fin d → Circle) : ℝ := by
  classical
  exact if d = 0 then 0 else
    sSup {r : ℝ | ∃ a ℓ : ℝ, ℓ ∈ Set.Icc (0 : ℝ) 1 ∧
      r = |((Finset.univ.filter (fun j =>
        Int.fract (Complex.arg (z j : ℂ) / (2 * Real.pi) - a) < ℓ)).card : ℝ) /
          (d : ℝ) - ℓ|}

/-- The circle Vandermonde maximum is d^(d/2); equality means a rotated regular d-gon.
The native determinant uses the product of z_j - z_i. CDT, Lemma 2.5.3. -/
theorem fekete_circle (d : ℕ) (hd : 0 < d) (z : Fin d → Circle) :
    ‖(Matrix.vandermonde (fun j => (z j : ℂ))).det‖ ≤
      (d : ℝ) ^ ((d : ℝ) / 2) ∧
    (‖(Matrix.vandermonde (fun j => (z j : ℂ))).det‖ =
        (d : ℝ) ^ ((d : ℝ) / 2) ↔
      ∃ w : Circle, ∃ σ : Equiv.Perm (Fin d), ∀ j : Fin d,
        (z (σ j) : ℂ) = (w : ℂ) *
          Complex.exp (((2 * Real.pi * (j : ℝ) / (d : ℝ) : ℝ) : ℂ) * Complex.I)) := by
  sorry

/-- A fixed positive circular discrepancy forces an exponential-in-d-squared loss
of the Vandermonde product, uniformly in sufficiently large d. CDT, Lemma 2.5.9. -/
theorem vandermonde_discrepancy_gap (ε : ℝ) (hε : 0 < ε) (hε1 : ε ≤ 1) :
    ∃ c : ℝ, 0 < c ∧ ∃ d₀ : ℕ, 1 ≤ d₀ ∧ ∀ d : ℕ, d₀ ≤ d →
      ∀ z : Fin d → Circle, ε ≤ circleDiscrepancy z →
        ‖(Matrix.vandermonde (fun j => (z j : ℂ))).det‖ <
          Real.exp (-c * (d : ℝ) ^ 2) := by
  sorry

end TauCetiRoadmap.DiophantineApproximationAndTranscendencePartII
