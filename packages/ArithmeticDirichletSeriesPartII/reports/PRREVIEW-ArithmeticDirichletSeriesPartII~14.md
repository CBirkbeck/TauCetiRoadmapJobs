# Review of ArithmeticDirichletSeriesPartII (pull request #3027 at 7633b39)

**Verdict:** accepted

**Summary.** An incremental re-review: the folder's two files are unchanged (0 lines) since `644c332`, whose review accepted them, so this round read the pull request's title and description against the head. Accepted, with no finding: the description's two statements about this roadmap (§4.1a derived from §4.1 at a point of absolute convergence; `hasLaplace_landau` as the statement of the new §0.1b) agree with the head, and the title describes the change this folder is part of. There are no small corrections; one format note from the previous review is not yet applied and does not block. Nothing is left for a human to decide.

## N01 — The *From Mathlib* bullet on `LSeries_eq_mul_integral` can be read as giving all three lemmas a summability hypothesis

Lines 1496–1497 read "assuming `LSeriesSummable f s` (absolute convergence) and partial sums of `f` that are `O(n^r)`, or partial sums of `‖f‖`, or …". At the pin only `LSeries_eq_mul_integral` (`Mathlib/NumberTheory/LSeries/SumCoeff.lean`, line 140) takes `LSeriesSummable`; `LSeries_eq_mul_integral'` (line 155) and `LSeries_eq_mul_integral_of_nonneg` (line 164) derive it from the bound. "Assuming either `LSeriesSummable f s` and partial sums of `f` that are `O(n^r)`, or partial sums of `‖f‖` (or of a nonnegative real `f`) that are `O(n^r)`" would remove the ambiguity.

## Previous findings

- The previous review had no finding and no small correction.
- N01 — not repaired: the bullet at lines 1494–1499 reads as before ("assuming `LSeriesSummable f s` (absolute convergence) and partial sums of `f` that are `O(n^r)`, or partial sums of `‖f‖`, or of a nonnegative real `f`"). It is carried above as N01 and does not block.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
| --- | --- | --- | --- |
| `hasLaplace_landau` (§0.1b), cited by the description | `g = e^(−u)`, `A = 0`, `H = 1/(s+1)`, `r = 1/2` | `F = 1/(s+1)` on `Re s > 0`, analytic on `B(0,1/2)`; `A′ = −1/2`: `∫₀^∞ e^(t/2) e^(−t) dt = 2 < ∞`; `G = 1/(s+1)` on `Re s > −1/2` | holds |
| `hasLaplace_landau`, hypothesis fails at a true singularity | `g(u) = u`, `A = 0` | `F = 1/s²`, unbounded as `s → 0⁺`; no `H` analytic on a disc about `0` agrees with it | consistent |
| §4.1a, cited by the description ("at a point of absolute convergence, derived from §4.1") | `c 1 = 1`, `c 2 = −1`, `s = 1` | `F(1) = 1 − 1/2 = 1/2`; `α = 1` on `[0, log 2)`, `0` after: `∫₀^(log 2) e^(−t) dt = 1/2`; Mellin: `∫₁² y^(−2) dy = 1/2` | holds |
| §4.1a reduction to §4.1 | `c = c₁ − c₂` with `c₁ = (1, 0, …)`, `c₂ = (0, 1, 0, …)` | §4.1 gives `1/s` and `2^(−s)/s`; difference at `s = 1` is `1 − 1/2 = 1/2` | route as the description says |

The rows for the untouched statements stand as in the previous review, of `644c332`.

- Change since `644c332`: 0 lines in the folder; against the merge base the head keeps all 6 layers and every id, removes no heading and no declaration, and adds §§0.1b, 4.1a and `hasLaplace_landau`.
- Pull request text: the title names the family's change of which this folder receives published theory (Landau's theorem, §0.1b). The description says "ArithmeticDirichletSeriesPartII §4.1a, at a point of absolute convergence, is derived from its §4.1" (head: §4.1a proof sketch and *Source* paragraph) and "ArithmeticDirichletSeriesPartII receives `hasLaplace_landau`, the statement of its new §0.1b" (head: one declaration added, §0.1b); "The additions do not mention the family or the formal proof" holds for this folder's 160 added lines. No section, headline, declaration or supplier of this roadmap is removed, so nothing is left unstated.
- Source locators: none in changed passages (there are none); the seeded sample falls in untouched text and was not re-read.
- Library declarations opened at the pin for N01: `Mathlib/NumberTheory/LSeries/SumCoeff.lean`, lines 140, 155, 164.
- Cross-roadmap citations resolved: the pull request's family roadmaps cite this roadmap's §§0.1, 0.1b, 0.2, 4.1 and 4.1a, all of which the head has; no citation of this README is unresolved.
- Elaboration: `lake env lean` of `Suggested.lean` gives 20 `sorry` warnings and nothing else; no `set_option`; imports `Mathlib` and `TauCeti.Order.Northcott.Basic`.
- Dependency check: `depcheck: 122 roadmaps, 1386 edges, 0 problem(s)`; no upward line and no cycle. The worker's automatic checks all passed at this head.
- Changes outside the folder: the pull request's 133 changed files all lie in the roadmap folders it adds or revises, each with its own review, and in the index of the RiemannHypothesisForDirichletLFunctions family.
- Overlap check: read LiCoefficientsArithmeticFormula, ZerosOfLFunctions, SpecialFunctionsGamma, TauberianBoundaryConvergence, AnalyticNumberTheoryPartIII, ProbabilisticAndMetricNumberTheoryPartII as in the previous review (the folder and the lists are unchanged); nothing shared. The Laplace form of Landau's theorem is owned here (§0.1b); the Dirichlet-series form is Completed/ArithmeticDirichletSeries §8.1.

Source independence: changed passages only; the folder has none since `644c332`, so no passage was compared this round (the previous review compared 6 passages with 2 sources, none shared); largest share delange1954, about 24 of 116 locators; arrangement not compared, since the change adds, removes and reorders no layer.

Research link: Delange's Tauberian theorem for poles of integer order (Delange 1954) underlies counts with higher-order poles, such as Wood 2019 and Gamburd–Magee–Ronan 2019. §0.1b is Landau's 1905 theorem, which Montgomery–Vaughan 2007, Lemma 15.1, apply to one-sided bounds for prime sums. Rests on the README's statement of purpose and on landau1905 as read in the previous review.

## Not verifiable

- Montgomery–Vaughan (2007), chapter 15, Lemma 15.1 (§0.1b): no legal open copy; cited by its locator alone. The statement of §0.1b is supported by Landau (1905) independently.

## Source issues

- none

## For the human reviewers

- none
