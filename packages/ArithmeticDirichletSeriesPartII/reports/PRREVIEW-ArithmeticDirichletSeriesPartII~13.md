# Review of ArithmeticDirichletSeriesPartII (pull request #3027 at 644c332)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 175 changed lines since `74a09b7`. Accepted, with no finding. The folder's two files are identical to those of the previously reviewed head, so the added §§0.1b and 4.1a and `hasLaplace_landau` were recomputed and their sources, library declarations and cross-roadmap citations resolved again at this head; all hold. One format note from the previous review is not yet applied and does not block; there are no small corrections. Nothing is left for a human to decide.

## N01 — The *From Mathlib* bullet on `LSeries_eq_mul_integral` can be read as giving all three lemmas a summability hypothesis

Lines 1496–1497 read "assuming `LSeriesSummable f s` (absolute convergence) and partial sums of `f` that are `O(n^r)`, or partial sums of `‖f‖`, or …". At the pin only `LSeries_eq_mul_integral` (`Mathlib/NumberTheory/LSeries/SumCoeff.lean`, line 140) takes `LSeriesSummable`; `LSeries_eq_mul_integral'` (line 155) and `LSeries_eq_mul_integral_of_nonneg` (line 164) derive it from the bound. "Assuming either `LSeriesSummable f s` and partial sums of `f` that are `O(n^r)`, or partial sums of `‖f‖` (or of a nonnegative real `f`) that are `O(n^r)`" would remove the ambiguity.

## Previous findings

- The previous review had no finding and no small correction.
- N01 — not repaired: the bullet at lines 1494–1499 reads as before ("assuming `LSeriesSummable f s` (absolute convergence) and partial sums of `f` that are `O(n^r)`, or partial sums of `‖f‖`, or of a nonnegative real `f`"). It is carried above as N01 and does not block.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
| --- | --- | --- | --- |
| `hasLaplace_landau` (§0.1b) | `g = e^(2u)`, `A = 3`, `H = 1/(s−2)`, `r = 1` | pole `2` outside `B(3,1)`; `A′ = 2.5`: `∫₀^∞ e^(−0.5t) dt = 2 < ∞`; `G = 1/(s−2)` on `Re s > 2.5` | holds |
| `hasLaplace_landau` without the sign | `g = sin u`, `A = 0`, `H = 1/(1+s²)`, `r = 1/2` | `H` analytic on `B(0,1/2)` (poles `±i`); for `A′ < 0`, `∫ e^(|A′|t)|sin t| dt = ∞` | sign hypothesis needed, as the Check says |
| `hasLaplace_landau` at a true singularity | `g = 1`, `A = 0` | `F = 1/s` unbounded as `s → 0⁺`; no `H` analytic on a disc about `0` agrees with it | hypothesis fails, consistent |
| `hasLaplace_landau`, degenerate | `g = 0`; `u₀ < 0` | `F = 0`, `A′ = A − 1`, `G = 0`; a negative `u₀` only strengthens `hg` | holds |
| §0.1b proof sketch, radii | `a ∈ (A, A + r/2)` | disc about `a` of radius `r − (a − A) > r/2 > a − A` lies in `B(A,r)`; Taylor sum at `b` is `∑ (a−b)^k/k! ∫ u^k g e^(−au) = ∫ g e^(−bu)` | route valid |
| §0.1b Mellin form | `G = 1` on `[1, ∞)` | `∫₁^∞ y^(−s−1) dy = 1/s`; `∫₀^∞ e^(−su) du = 1/s` | agree |
| §0.1b locators, Landau (1905) | landau1905 lines 437–467 and 898–963 | §2, pp. 536–537: Dirichlet series with coefficients nonnegative from some index; §4, pp. 547–548: `φ ≥ 0` beyond `x₀`, real abscissa singular, Taylor and interchange proof | supports §0.1b |
| §4.1a value | `c 2 = i`, `s = 1` | Laplace: `i ∫_(log 2)^∞ e^(−t) dt = i/2`; Mellin: `i ∫₂^∞ y^(−2) dy = i/2`; `F(1)/1 = i/2` | holds |
| §4.1a Check, alternating | `c n = (−1)^(n+1)`, `Re s > 1` | `∫_k^(k+1) y^(−s−1) dy = (k^(−s) − (k+1)^(−s))/s`; sum over odd `k` is `F(s)/s` | holds |
| §4.1a substitution | `G(y) = S_c(y) y^(−s−1)`, `a = 0` | `eᵗ G(eᵗ) = S_c(eᵗ) e^(−st)`; `Ioi (exp 0) = Ioi 1` | matches `integral_comp_exp_Ioi` |
| §4.1a counterexample to the Mathlib bound | `c n = n^(−1/2)/(log n)²`, `s = 1/2` | `∑ 1/(n log² n) < ∞`; `S_c(N) ~ 2√N/log² N`, and `N^(1/2−r)/log² N → ∞` for `r < 1/2` | not `O(N^r)` |
| §4.1a reduction to §4.1 | `c = c₁ − c₂ + i(c₃ − c₄)` | each `0 ≤ c_j ≤ |c|`, so §4.1 (`c ≥ 0`, `Re s > 0`, `LSeriesHasSum`) applies to each | route valid |
| *From Mathlib* bullet (N01) | opened lines 140, 155, 164 | `hS : LSeriesSummable` only at 140; 155 and 164 take the bound alone | true, wording ambiguous |

- Since the previously reviewed head `477bb48` the folder's two files are unchanged; against the merge base the head keeps all 6 layers and every id, removes no heading and no declaration, and adds §§0.1b, 4.1a and `hasLaplace_landau`.
- Source locators checked against the text: 2 (Landau 1905, §2 pp. 536–537 and §4 pp. 547–548).
- Library declarations opened at the pins: `MeasureTheory.integral_comp_exp_Ioi` and `integrableOn_comp_exp_Ioi` (`Mathlib/MeasureTheory/Integral/IntegralEqImproper.lean:1157`, `1164`); `LSeries_eq_mul_integral` and its two variants (`Mathlib/NumberTheory/LSeries/SumCoeff.lean:140`, `155`, `164`); `MeasureTheory.lintegral_tsum` (`Mathlib/MeasureTheory/Integral/Lebesgue/Add.lean:362`); `DifferentiableOn.hasFPowerSeriesOnBall` (`Mathlib/Analysis/Complex/CauchyIntegral.lean`); `TauCeti.LSeries.landau` (`TauCeti/NumberTheory/LSeries/Landau.lean:296`).
- Cross-roadmap citations resolved: Completed/ArithmeticDirichletSeries §8.1 (Landau's theorem for Dirichlet series) exists on main. The consumers of §§0.1b and 4.1a in this pull request (PositivityOfDirichletSeriesWithKernels, GeneralizedRiemannHypothesisFromWindowBounds) cite ids that resolve and state derived forms, not the theorem itself.
- Elaboration: `lake env lean` of `Suggested.lean` gives 20 `sorry` warnings and nothing else; no `set_option`; imports `Mathlib` and `TauCeti.Order.Northcott.Basic`. The elaborated type of `hasLaplace_landau` matches §0.1b clause by clause and loses no binder. One-tactic probe (`simp`, `rfl`, `aesop`, `infer_instance`, an `exact` with `A − 1`): none closes it.
- Dependency check: `depcheck: 132 roadmaps, 1465 edges, 0 problem(s)`; no upward line and no cycle. The worker's automatic checks all passed at this head.
- Changes outside the folder: the pull request's 117 changed files all lie in the folders it adds or revises, each with its own review, and in the index of the RiemannHypothesisForDirichletLFunctions family.
- Pull request text: its two sentences on this roadmap (§4.1a derived from §4.1 at a point of absolute convergence; `hasLaplace_landau` as the statement of the new §0.1b) agree with the head.
- Overlap check: read AnalyticNumberTheoryPartI, LiCoefficientsArithmeticFormula, SamplingAndDiscreteFourierAnalysis, ZerosOfLFunctions, SpecialFunctionsGamma, TauberianBoundaryConvergence, AnalyticNumberTheoryPartIII, ProbabilisticAndMetricNumberTheoryPartII; nothing shared. The Laplace form of Landau's theorem with complex parameter is owned here (§0.1b); the Dirichlet-series form is Completed/ArithmeticDirichletSeries §8.1.

Source independence: changed passages only. 6 passages compared with 2 sources (landau1905 at pp. 536–537 and 547–548 against the §0.1b statement, its proof sketch, its *Source* paragraph and the `hasLaplace_landau` docstring; the Mathlib docstrings of `SumCoeff.lean` and `IntegralEqImproper.lean` against the §4.1a *Source* paragraph and the new *From Mathlib* bullets), none shared beyond formulas and hypothesis lists that can be written in one way only; largest share delange1954, about 24 of 116 locators; arrangement not compared, since the change adds, removes and reorders no layer.

Research link: Delange's Tauberian theorem for poles of integer order (Delange 1954) underlies counts with higher-order poles, such as Wood 2019 and Gamburd–Magee–Ronan 2019. §0.1b is Landau's 1905 theorem, which Montgomery–Vaughan 2007, Lemma 15.1, apply to one-sided bounds for prime sums. Rests on the README's statement of purpose and on landau1905 as read here.

## Not verifiable

- Montgomery–Vaughan (2007), chapter 15, Lemma 15.1 (§0.1b): no legal open copy; cited by its locator alone. The statement of §0.1b is supported by Landau (1905) independently.

## Source issues

- none

## For the human reviewers

- none
