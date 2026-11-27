# Review of PowerSpectraAndWienerKhinchin (pull request #3207 at 37641f9)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired, and the repair introduces no new problem. The overview now states the criterion for mean-square differentiability for complete `E`, in agreement with Layer 3.2, its Check and `exists_hasDerivAt_iff`. There are no small corrections and one format note carried over, not blocking; the two facts about the sources remain for the human reviewers.

## N01 — The facts of 2.0 have no `*Needs:*` line

Carried from the previous review, unchanged at this head: the normalisation `∫ F_T = 1` in 2.0 comes from Plancherel's identity for the indicator of `[0, T]`, and neither 2.0 nor the supplier contracts name a Plancherel statement. Mathlib has it for `L²` (`MeasureTheory.Lp.norm_fourier_eq`, `Mathlib/Analysis/Fourier/LpSpace.lean`); naming it, or the route intended, would tell an implementer where the constant comes from.

## Previous findings

- R01 — repaired: "the isometry, the differentiability criterion and every statement that integrates in `E` take `E` complete" (README lines 13–14), and "for `E` complete the family is mean-square differentiable exactly when `∫ ξ² dμ < ∞`" (lines 24–25).

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Overview, fourth headline (changed) against 3.2 and `exists_hasDerivAt_iff` | hypotheses side by side; Gaussian span example of the Check of 3.2 | overview: `E` complete, stationary, continuous; 3.2 line 305 and Lean line 99 (`[CompleteSpace E]`, `ContinuousAt X 0`): the same. Example now excluded: its `E` is incomplete | holds; agrees |
| 3.2 criterion, complete `E` | `C = exp(−πτ²)`; Lorentzian | density `exp(−πξ²)`, `∫ξ² = 1/(2π)`, `4π²/(2π) = 2π = −C''(0)`, differentiable; Lorentzian `ξ²·2ασ²/(α²+4π²ξ²) → 2ασ²/4π²`, integral `∞`, not differentiable | holds |
| 3.2 without completeness | `μ` Gaussian, `E = span{e_t}` | candidate derivative `2πiξ e_t(ξ)` unbounded and continuous; finite exponential sums bounded; `μ` has full support, so no a.e. equality | completeness needed, as now stated |
| Overview "and the derivative has spectral measure `(2πξ)² μ`" under the added "for `E` complete" | 3.3 and `spectralMeasure_deriv` | 3.3 assumes no completeness (Lean line 107 has no `[CompleteSpace E]`); the overview's clause is the special case, still true | holds |
| Overview line 13 list against the layers | each headline's Lean binder | 1.1, 2.1, 2.2, 2.3, 3.1 integrate in `E` or build the isometry, 3.2 is the criterion: all carry completeness in their layer statements | agrees |

The rows of the previous review for the untouched statements stand as in that review, of `fab5baf`.

- Changed passages: 2 sentences of the overview (9 lines); no layer statement, Check, locator, supplier citation or Lean declaration changed.
- Source locators: none in the changed passages; the locators of 3.2 (Lindgren §2.1 p. 28, Lemma 2.3 and Theorem 2:12 pp. 46–47) stand as verified in the review of `fab5baf` and were not reopened.
- Library declarations: none cited in the changed passages; `Suggested.lean` lines 87–113 reread for the binders of 3.1–3.3.
- Cross-roadmap citations: none in the changed passages; no open pull request changes this roadmap or drops an id it cites.
- Elaboration of `Suggested.lean` at this head: eight `sorry` warnings, nothing else.
- Automatic checks: all passed. Dependency check output: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`.
- Pull request's title and description read against this head: no sentence contradicted (the description gives 3.2 by section, with hypotheses left to the README throughout); no change outside the roadmap folder.

Overlap check: read StationaryTimeSeriesAndLinearPrediction, PositiveDefiniteSequencesAndToeplitzForms, ShotNoiseAndCampbellTheorem (open), SamplingAndDiscreteFourierAnalysis, MathematicalBilliards, ClassicalErgodicTheory (main); nothing shared, as in the review of `fab5baf`; the lists of closest roadmaps are unchanged and the change touches no owned object.

Source independence: changed passages only; 2 changed sentences, which add a completeness hypothesis in the roadmap's own words and take no wording from a source (Lindgren 2006 not reopened this round); largest share Lindgren 2006, 12 of 15 locators; contents compared with Lindgren 2006: independent, as found at `fab5baf` (no layer added, removed or reordered).

Research link: the headline targets are the spectral theory of second-order stationary processes as in Lindgren 2006, Ch. 4 (Bochner representation, spectral isometry, filters, sampling) and Hajek 2015, Ch. 8 (power spectral densities of filtered processes); this rests on the sources read, the README names no later research use.

## Not verifiable

- Whether `Suggested.lean` resembles a public formalisation other than the pinned libraries: not searched beyond the open and merged roadmaps.

## Source issues

- **Misprint** in Lindgren 2006 at Remark 4:2, printed p. 120: the source says both endpoint masses are the mass at `ω₀`; it should be the mass at `ω₀` and the mass at `−ω₀`; affects nothing.

## For the human reviewers

- Scope: 12 of the 15 locators go to Lindgren 2006, lecture notes on the author's page, not a refereed publication; the other source, Hajek 2015, is a Cambridge University Press textbook read in the author's preproduction copy.
- Scope: the README names no later theory or current research that uses its headline theorems; the subject is the classical spectral theory of stationary processes at graduate-textbook level.
