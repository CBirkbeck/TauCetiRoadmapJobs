# FIX-RT-GaussianIsoperimetryAndClusters~2: red-team round 2 repaired

Two reviews: `RT-GaussianIsoperimetryAndClusters~2a` (needs_changes, three P3 findings) and `RT-GaussianIsoperimetryAndClusters~2b` (accepted, no finding). Review 2b has no section below because it raises no finding. All three findings of 2a hold on the sources and are applied. No mathematical statement, hypothesis, binder or Lean type changed: the edits are two docstring locators, one README locator, one Summary phrase, and the same locator fix in a second place (§8.4).

## RT-GaussianIsoperimetryAndClusters~2a/F01 (P3) — applied

README §8.5: "Ledoux1999 inequality (1.8), line 252–271, for covariance matrices" → "Ledoux1999 line 252–263, the derivation of inequality (1.8) … from (1.7) with `a = 0` …; inequality (1.8) itself, line 266–271, records only the weaker tail `e^{−r²/2}` …". Docstring of `gaussian_max_concentration`: "(Ledoux1999, (1.8))" → the same distinction.

Evidence: Ledoux1999 line 258–259 derives `γ(A + rK) ≥ Φ(r)` "by (1.7) (with a = 0)"; line 270–271, the display labelled (1.8), bounds the tail by `e^{−r²/2}`. One change from the suggested wording: (1.8) is stated for the supremum of a centred Gaussian process indexed by a countable set (line 252–256, 266–271). The covariance matrix `Γ = M ᵗM` (line 242–244) belongs to the derivation, so "for covariance matrices" now qualifies the derivation and not (1.8).

Same pattern elsewhere: §8.4 and the docstring of `gaussian_concentration_median` cited Ledoux1999 (1.6) for the Lipschitz-function bound. (1.6), at line 225–226, is stated for sets. Both places now say that (1.6) states `γ(Metric.thickening r A) ≥ Φ(r)` for `γ(A) ≥ 1/2` and is applied to `A = {f ≤ m}`. Ledoux1993 (10), the function form, is unchanged. No other docstring or README locator cites a display for more than it states. I checked every display citation in `Suggested.lean`: (1.1), (1.3)–(1.4), (1.5), (1.6), (1.7), (1.8), (1.11), CianchiFuscoMaggiPratelli2011 (2.3)–(2.5), MilmanNeeman2022 (3.1)/(3.3). The outer-measure statements of §8.1–§8.2 extend Ledoux's Borel statements by the route the README gives, not by the display.

## RT-GaussianIsoperimetryAndClusters~2a/F02 (P3) — applied

Docstring of `gaussianIsoperimetricProfile`: "(MilmanNeeman2022, equation (1.1); Ledoux1999, (1.4))" → "(MilmanNeeman2022, Section 1.2, the formula `φ ∘ Φ⁻¹` just before equation (1.1), which is the equation `I″ = −1/I`; Ledoux1999, (1.4))".

Evidence: MilmanNeeman2022 line 168 opens Section 1.2. The formula `I_m^{(1)} = φ ∘ Φ⁻¹` is at line 183–184 and (1.1), the ODE, is at line 187. README §1.1 already cites line 182–185 for the formula and (1.1), line 186–187, for `I″ = −1/I`, so the README needed no change. Ledoux1999 (1.4), line 217, contains `φ ∘ Φ⁻¹` and stays.

## RT-GaussianIsoperimetryAndClusters~2a/F03 (P3) — applied

Summary: "identifies them with the Gaussian-weighted reduced-boundary measure" → "identifies them with the `e^{−W}`-weighted Hausdorff measure of the reduced boundary".

Evidence: §2.2 and `weightedPerimeter_eq_lintegral_reducedBoundary` state `P_μ(U; Ω) = μ^{n−1}(∂*U)` with `μ^{n−1} = e^{−W} μHE[n−1]` for every `C¹` weight. For `W = 0` on `ℝ` and `U = (0, 1)` the value is `2`, whereas Gaussian weighting gives `φ(0) + φ(1) = 0.640913`. "Gaussian-weighted" occurs nowhere else in the README or `Suggested.lean`, and "How to read the build" already says the weighted layer is general.

## Adversarial pass on the changed text

No statement changed, so the pass recomputes the claims each new locator or phrase makes.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §8.5 / `gaussian_max_concentration`: bound `1 − Φ(r)` against the tail of (1.8) | `S = (1)`, `m = 0`, `r = 0, 1, 2` | `1 − Φ(r)` = `0.5`, `0.158655`, `0.022750`; `e^{−r²/2}` = `1`, `0.606531`, `0.135335` | the stated bound is strictly sharper for `r > 0` and is an equality for one coordinate, so it comes from the derivation via (1.7), not from (1.8) | locator rewritten (F01) |
| §8.4 / `gaussian_concentration_median`: (1.6) in set form applied to `{f ≤ m}` | `f(x) = x_1`, `m = 0`, `L = 1`, `r = 2` | `γ({x_1 ≤ 0}) = 1/2`, `γ(thickening 2 A) = Φ(2) = 0.977250`, so `γ({f > 2}) ≤ 0.022750`, equal to the §8.4 Check | consistent with the Check of §8.4 | locator qualified (pattern of F01) |
| §1.1 / `gaussianIsoperimetricProfile`: formula before (1.1), ODE in (1.1) | `v = 0.3` | `Φ⁻¹(0.3) = −0.524401`, `I(0.3) = 0.347693`, `−1/I = −2.876104`, numerical second difference `−2.8761`, `I′(0.3) = 0.524401 = −Φ⁻¹(0.3)` | (1.1) is the ODE, the formula precedes it | locator rewritten (F02) |
| Summary: weighted boundary measure | `W = 0`, `U = (0, 1) ⊆ ℝ`; Gaussian weight, same `U` | `2`; `φ(0) + φ(1) = 0.640913` | the measure is `e^{−W} μHE[n−1]`, Gaussian only for the Gaussian weight | phrase replaced (F03) |

## Checks

- **Elaboration.** `lake env lean packages/GaussianIsoperimetryAndClusters/Suggested.lean`, run from the content checkout: exit code 0, 20 warnings, each "declaration uses `sorry`" (lines 103, 116, 133, 148, 195, 262, 277, 293, 324, 336, 348, 358, 371, 380, 393, 402, 413, 423, 443, 455), and no error.
- **Elaborated signatures.** I put `#check @name` for all 37 declarations of `Suggested.lean` in one scratch copy of the file and elaborated it once (exit code 0, 37 types printed). Only docstrings changed, and the git diff of `Suggested.lean` touches comment lines only. The types of `gaussianIsoperimetricProfile` (`ℝ → ℝ`), `gaussian_concentration_median` and `gaussian_max_concentration` are unchanged and match their README statements, as do the other 34.
- **Dependency check** (the brief's command):

      depcheck: 237 roadmaps, 2241 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line.
- **Citations.** `roadmaps resolve` on the README finds no cross-roadmap citation and no Lean name that is missing everywhere. The earlier lead `Cluster.perimeter_eq_iff_halfSpaces` is declared in `Suggested.lean`.
- **Gate failures.** None were listed for this round.

## For the maintainer

- No Lean name, section number or target changed, so no other roadmap's citation is affected. No supplier, gap or merge-order edge was added or removed. `sources.toml` is unchanged: every locator still lies in the recorded sections, Ledoux1999 "Section 1.2 (inequalities (1.3)–(1.8) and (1.11))" and MilmanNeeman2022 "Section 1 (definitions, equation (1.1), …)".
- No new construction was stated, so ownership is unchanged. Ownership against the open pull requests was not re-searched this round beyond the reviewers' `roadmaps grep`.
- Review 2b's human-reviewer notes are left to the humans and nothing was changed for them: Bobkov1997's unreadable OCR, and Maggi2012 read only as an extract. Its note about `design/plan.json` still naming GeometricMeasureTheory G4 is in the same position. That plan section is outside what this job may edit (only its top-level `gaps` list is, and that list is empty), and the README no longer cites G4.
- The source issues the reviewers list are corrections to the sources, not findings, and need no change here. They are the `√(2π)` factors in CianchiFuscoMaggiPratelli2011 (2.5), (4.8), (4.10) and (4.14), and the tie case in the proof of MilmanNeeman2022 Lemma 2.1. Both reviews found the README's own routes correct at these points (review 2a, rows 37 and 40 of its table). I did not re-derive them this round.
