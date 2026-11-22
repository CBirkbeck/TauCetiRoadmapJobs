# Review of SupportVectorMachines (pull request #3002 at 99deb4c)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement of the four layers was recomputed (the uniqueness argument of 1.3, both directions of 2.1, the duality identity and the unbounded dual of 2.2, the exactness inequality of 3.2, the deterministic step of 4.2) and every numerical Check reproduces, including both sides of the leave-one-out bound in its four Checks. There is one small correction (a citation in 2.2) and one format note, neither blocking. Left for a human: the Mohri–Rostamizadeh–Talwalkar book, which carries the larger share of the locators, could not be read here, so its locators and its table of contents are unchecked.

## C01 — The second source cited for 2.2 derives the dual of the homogeneous problem, not of the problem with offset stated here

A reader who opens Shalev-Shwartz–Ben-David at the locator of 2.2 (README line 218, "§15.4, (15.8)–(15.11), pp. 211–212") finds a dual whose feasible set is all `α ≥ 0`, with no constraint `Σ α_i y_i = 0`, and cannot match it to `dualFeasible`. Their §15.4 opens by saying that it derives the dual of (15.3), the problem without offset, and (15.11) on p. 212 is maximized over `α ≥ 0` only. The citation of the same book in 2.1 (line 170) already says "homogeneous case"; 2.2 does not.

The smallest change: in 2.2 write "Shalev-Shwartz–Ben-David, §15.4, (15.8)–(15.11), pp. 211–212, for the homogeneous problem (15.3), where the constraint `Σ α_i y_i = 0` is absent, and who assert strong duality without proof".

## N01 — "no source opened states it" in 3.2 describes the writing of the roadmap

Line 315 ends "(Proved here; no source opened states it.)". The second clause is about which texts were consulted, not about the theorem; "(Proved here.)", as in 4.1, says what a reader needs.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `hardFeasible`, `IsHardMarginSolution`, `classDistance` | `ℝ`: `1, 2` (+), `−1` (−); duplicate point with both labels; `0` (+), `2` (−); a class absent | `w ≥ 1`, min `1` at `(1,0)`; `P − N = [2,3]`, `δ = 2`; infeasible, `δ = 0`; `(−1,1)` gives `1, 1`; `infDist 0 ∅ = 0` | holds | none |
| 1.2 `marginSet` | `(1,0)` on the sample above; single label `1` with `(0,1)`, `(0,2)` | values `1, 2, 1`: margin is points `1, −1`; `(0,1)`: all on margin; `(0,2)`: value `2`, empty | holds | none |
| 1.3 `existsUnique_isHardMarginSolution` | sample above; `(1,1/2)`, `(1/2,0)`; single label; `E = 0`; rescaled pair when `π − ν > 2` | `‖w⋆‖ = 1 = 2/δ`; margins `1/2`, `1/2` vs `δ/2 = 1`; rescaled pair gives `+1`/`−1` exactly; `E = 0`: infeasible, `δ = 0` | holds | none |
| 1 Examples, homogeneous problem | `a = ((1,0),(0,1))`; a point `x_i = 0` | `c⋆ = (1/2,1/2)`, `γ⋆² = 1/2`, `c⋆/γ⋆² = (1,1)`, constraints `1, 1`; `0 ≥ 1` fails, `γ⋆ = 0` | holds | none |
| 2.1 `isHardMarginSolution_iff_exists_isMarginMultiplier` | sample above; four points in `ℝ²`; `(2,−1)` with `α = (2,0,0)`; `ι` empty; `μ₀ = 0` in Fritz John | `α = (1/2,0,1/2)` unique; both `(1/2,0,1/2,0)`, `(0,1/2,0,1/2)` give `(1,0)`; `Σαy = 2 ≠ 0`, `2 > 1`; `μ₀ = 0` forces `Σμ_i = 0` | holds | none |
| 2.2 `isGreatest_dualObjective` | identity expanded; sample above; `x = (1,1)`, `y = (1,−1)`; one label; some `y_i = 0`; `ι` empty | gap `= ‖w−v‖²/2 + Σα_i(y_i(…)−1)`; dual `1 − 1/2 = 1/2`; `α = (t,t)`: `2t`; `{0}`: `0`; `α = t e_i`: `t`, infeasible; image `{0}` | holds | C01 (citation only) |
| 3.1 `softObjective_minimizers` | `±1` in `ℝ`, `λ = 1, 0, −1`; `m = 0`; all `y_i = 0` | `w² + 1 − w`, min `3/4` at `w = 1/2`, `|b| ≤ 1/2`; `λ = 0`: zero set `w ≥ 1 + |b|`; `λ = −1`: `→ −∞`; `m = 0`: `λ‖w‖²` both sides | holds | none |
| 3.2 `isMinOn_softObjective_iff_isHardMarginSolution` | inequality expanded; `±1` in `ℝ`, `λ = 1/2, 1`; `x = (0,0)`, `y = (1,−1)`, `p = (0,1)`; `m = 0` | lower bound `= λ‖w − w⋆‖²`; `2λ·2·(1/2) ≤ 1 ⇔ λ ≤ 1/2`; `λ = 1/2`: `(1,0)` only; `λ = 1`: `(1/2,b)`; `p` infeasible | holds | N01 (wording) |
| 4.1 `exists_measurable_isHardMarginSolution` | one-class `σ`; `ι` empty; bounded multipliers along a convergent sequence | `(0,c)`: `c·c = 1`; `(0,0)` minimal; `Σα_k = ‖w_k‖² = 4/δ_k²` bounded, `b_k = 1 − ⟪w_k,x⟫` bounded | holds | none |
| 4.2 `lintegral_misclassRisk_le` | three-atom law, `m = 1, 2`; label `2`; non-separable law, `m = 4`; `m = 0`; `D = c·P`; `D = 0` | `4/9 ≤ 1`; `2/9 ≤ 25/27` (`ΣN = 75` over 27); `1/2 > 1/4`; `303/512 > 499/1024`; `1 > 0`; both sides scale by `c^(m+1)`; `0 ≤ 0` | holds | none |

- Source locators checked against the text: 9 of Shalev-Shwartz–Ben-David ((15.2), Lemma 15.2, (15.3), (15.4), (15.5), Claim 15.5, Thm 15.8, Lemma 15.9, §15.4 with (15.7)–(15.11)), all on the printed pages given; 0 of Mohri–Rostamizadeh–Talwalkar (not readable).
- Library declarations opened at the pin: 28 of Mathlib, each in the file the supplier contracts name (for example `IsClosed.notMem_iff_infDist_pos`, `Mathlib/Topology/MetricSpace/HausdorffDistance.lean` line 588; `convexHull_sub`, `Mathlib/Analysis/Convex/Combination.lean` line 490; `ContinuousOn.measurable_piecewise`, `Mathlib/MeasureTheory/Constructions/BorelSpace/Basic.lean` line 522), plus `RKHS` and `RKHS.kerFun` (`Mathlib/Analysis/InnerProductSpace/Reproducing.lean` lines 63, 137). No hinge loss, hard margin or support vector in the pinned Mathlib or Tau Ceti.
- Cross-roadmap citations resolved: ThresholdFunctionsAndMargins 4.1 (`margin`, `isGreatest_margin`) and 4.2 (`affineMargin`, identical body; `isGreatest_affineMargin`, same `infDist` expression as `classDistance`) at its open head; NonlinearProgrammingOptimality 1.1 `feasibleSet` and 2.2 `exists_fritzJohn` at its open head, hypotheses as the contract states them; MathematicalStatisticsNonparametric 5.8 `mem_span_kerFun_of_isMinOn` on main. ConvexAnalysisAndDuality 5.2, StatisticalLearningTheory 4.2 and DiscriminantAnalysisAndLogisticRegression's scope read at their heads and described correctly.
- Dependency check: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning (7 theorems). The elaborated types of all 19 declarations were compared with the README; the five definitions that drop `[Fintype ι]` or `[InnerProductSpace ℝ E]` do not use them. One-tactic probe on a copy outside the repository (`simp`, `rfl`, `exact?`, `aesop`): none of the 7 theorems closes.
- Headline theorems: 1.3, 2.1, 2.2, 3.1, 3.2, 4.1, 4.2; all stated in `Suggested.lean`, none through a stand-in; no padding.
- The automatic checks all passed. Pull-request text read against the head: 7 theorems, 12 definitions, two open suppliers, the neighbouring roadmaps and the source notes are as described.
- Ownership against open pull requests: searched by object (hinge loss, hard and soft margin, support vectors, leave-one-out) at every open head and on main; no second owner.

Overlap check: read OnlineLearningAndLittlestoneDimension, StatisticalLearningTheory, DiscriminantAnalysisAndLogisticRegression, NonlinearProgrammingOptimality, ThresholdFunctionsAndMargins (open), FiniteAffineBoundTightening, ConvexLifting, MathematicalStatisticsNonparametric (main); the third list is empty. Shared objects: the affine and homogeneous margins, owner ThresholdFunctionsAndMargins 4.1–4.2 (cited, `affineMargin` copied); the Fritz John theorem, owner NonlinearProgrammingOptimality 2.2 (cited); the representer theorem, owner MathematicalStatisticsNonparametric 5.8 (cited); stability and calibration of the hinge loss, owner StatisticalLearningTheory (not stated here).

Source independence: 9 locators and 6 further passages (Conventions on the soft margin, the routes of 1.3 and 2.2, the statement of 3.1, two docstrings) compared with 1 source, Shalev-Shwartz–Ben-David, none shared; largest share Mohri–Rostamizadeh–Talwalkar, 13 of 22 citations, whose text and table of contents could not be read; contents compared with Shalev-Shwartz–Ben-David Ch. 15 (hard margin, soft margin, support vectors, duality, in that order): independent. By the README's own locators the layers do not follow Mohri's sections either (Layer 4 cites §5.2.4, Layer 3 cites §5.3; 3.2 and 4.1 cite none).

Research link: The headline targets are the structural theorems of support vector machines as stated in Shalev-Shwartz and Ben-David (2014), Ch. 15, and Mohri, Rostamizadeh and Talwalkar (2018), §§5.2–5.3 (leave-one-out bound, Thm 5.4); they feed kernel methods and the generalization theory of StatisticalLearningTheory. Rests on the README's references and the first text.

## Not verifiable

- Every locator into Mohri–Rostamizadeh–Talwalkar, *Foundations of Machine Learning*, 2nd ed. ((5.5)–(5.7), §5.2.2, (5.9)–(5.14), (5.18)–(5.19), (5.21), Def 5.2, Lemma 5.3, Thm 5.4, (5.24), the remarks on pp. 82 and 90, (5.33)): the PDF linked from the author's page is served from a file-hosting site that has no licence class here, and the publisher's pages returned HTTP 403 or timed out. This covers what the README attributes to that book in 1.2 (support vectors through multipliers, non-uniqueness), 3.2 (the box constraint) and 4.2 (a probability law, deterministic labels, separability assumed in the proof).

## Source issues

- **Error** in Shalev-Shwartz–Ben-David 2014 at Lemma 15.9 (Fritz John), printed page 211: the source says a minimizer under differentiable inequality constraints has real coefficients on the active constraint gradients cancelling the objective gradient, with no multiplier on the objective and no sign condition; it should be multipliers `μ₀ ≥ 0` on the objective and `μ_i ≥ 0`, not all zero (it fails for `f(w) = w`, `g(w) = w²` on `ℝ`); affects nothing.

## For the human reviewers

- **Not tested.** Mohri–Rostamizadeh–Talwalkar carries 13 of the README's 22 source citations; its text and table of contents could not be read, so wording and arrangement were compared with Shalev-Shwartz–Ben-David only.
- **Licence.** The Mohri book is cited from a PDF linked on the author's page but stored on a file-sharing site; the author's page states a CC-BY-NC-ND licence held by MIT Press. Its status as a readable source was not settled here.
- **Scope.** Both sources are graduate textbooks of machine-learning theory (`metadata.toml`: math.ST). README 3.2 and 4.1 are marked as proved in the roadmap with no source stating them; no refereed statement of either was found in the text read.
