# Review of AnalyticNumberTheoryPartIII (pull request #3027 at 7633b39)

**Verdict:** accepted

**Summary.** Accepted with no findings. This is an incremental re-review: the folder has not changed since `f93f554` (0 lines), so this round read the pull request's title and description against this head. The description now states that this roadmap gains §8.2a, loses or renumbers no section and gains no supplier, which repairs the previous small correction; no sentence about this folder is contradicted by the head. One format note (Robinson's page) is carried, not blocking. One licence question from earlier rounds remains for the human reviewers.

## N01 — Give Robinson's page

8.2a (line 503) and the References (line 1727) cite `robinson1944` as "the theorem of its title". The paper states the classical theorem only in its opening paragraph, p. 795 (`robinson1944` line 11); "p. 795" would be the exact locator.

## Previous findings

- none: the previous report (of `f93f554`) raised no finding (no R01).
- Its small correction C01 — repaired: the description now reads "AnalyticNumberTheoryPartIII gains §8.2a (Hadamard's three-circles theorem on an annulus, with the convexity of `log M` in `log R`, from Mathlib's three-lines theorem); it loses or renumbers no section and gains no supplier." The repair introduces no new problem.
- Its format note N01 — not repaired: line 503 still reads "the theorem of its title"; carried as N01 above.

## Verified sound

| Statement | Instances tried | Values computed (left vs right) | Result | Change |
|---|---|---|---|---|
| 8.2a, `M_f(R₂) ≤ M_f(R₁)^{1−θ} M_f(R₃)^θ` (the statement the description's new sentence cites) | `f = z − z₀` and `f = (z − z₀)⁻¹` at radii 1, 2, 4; `R₂ = R₁` | `θ = log 2/log 4 = 1/2`; `2` vs `1^{1/2}·4^{1/2} = 2`; `1/2` vs `1^{1/2}·(1/4)^{1/2} = 1/2`; `R₂ = R₁`: `θ = 0`, `M(R₁)` vs `M(R₁)` | holds, with equality | none |
| Description: 8.2a is "from Mathlib's three-lines theorem" | the Mathlib lemma named in 8.2a, strip `l = log 1 = 0`, `u = log 4`, `Re w = log 2` | lemma's exponent `(Re w − l)/(u − l) = log 2/log 4 = 1/2`, equal to `θ` of 8.2a; hypotheses `l < u`, `DiffContOnCl`, bounded on closed strip, as the README's contract says | agree | none |
| Description: "gains §8.2a … loses or renumbers no section and gains no supplier" | folder diff against main; *Needs* line of 8.2a | headings: 1 added (8.2a, line 495), 0 removed; 7 layers kept, 0 retitled; 8.2a needs Mathlib only (4 items), 0 roadmaps | true | none |
| Description: "in AnalyticNumberTheoryPartIII … only the module docstring changes" (of `Suggested.lean`) | folder diff against main | `Suggested.lean`: +2 −1, inside the module docstring; 0 declarations added, removed or restated | true | none |
| Citations of this roadmap by the other folders of the pull request | every "AnalyticNumberTheoryPartIII" citation with a section number at this head | 8.1 (6), 8.2 (1), 8.2a (6), 8.3 (3), 9.2 (1); headings at lines 342, 468, 495, 541, 625 | all resolve | none |

The rows for the untouched statements stand as in the previous review, of `f93f554`.

- The change since `f93f554`: 0 lines in the folder; no statement, Check, *Needs* line, Lean declaration or layer changed. No target of the seeded sample falls in a changed passage.
- Source locators checked against the text: 1 (`robinson1944` line 11, for N01).
- Library declarations opened at the pins: 1 (`Complex.HadamardThreeLines.norm_le_interp_of_mem_verticalClosedStrip'`, `Mathlib/Analysis/Complex/Hadamard.lean` line 611).
- Cross-roadmap citations resolved: 17 inbound citations to five sections of this roadmap (table above). The overlap listing shows no other open pull request changing this roadmap and no dropped id.
- Automatic checks: all passed; the only count above zero is the files of the pull request outside this folder (133 files changed in all, every one under a roadmap folder that is the pull request's own). Dependency check: `depcheck: 122 roadmaps, 1391 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Elaboration of `Suggested.lean`: 27 "declaration uses `sorry`" warnings and nothing else; no `set_option`, no `lemma`.
- The pull request's text: the title names the family's change and fits a pull request of many folders; the description was read in full as it stands on the pull request. Both of its sentences on this folder (the gain of §8.2a; the docstring-only change of `Suggested.lean`) agree with the head. Against main the folder changes by 76 lines (68 insertions, 8 deletions).

Overlap check: read ZerosOfLFunctions, LFunctions, LiCoefficientsArithmeticFormula, SpecialFunctionsGamma, CircleMethodThreePrimes, RiemannHypothesisStatementsAndConsequences and ArithmeticDirichletSeriesPartII (as in the previous review; nothing changed in the folder). One object is shared: Hadamard's three-circles theorem, owned here (8.2a) and cited by RiemannHypothesisStatementsAndConsequences §3.2a. Nothing else is shared.

Source independence: changed passages only: 0 passages compared with 0 sources, since the folder did not change; largest share of locators `kontorovichtao-pntplus`, about 42 of 108; no layer added, removed or reordered, so the contents comparison stands as before: independent.

Research link: 10.2–10.3 are the contour route from a zero-free region to a prime number theorem with error term, Ingham's theorem as refined by Pintz (Platt–Trudgian 2020, lines 21–56). 13.1 is Erdős problem 392 (Alexeev et al. 2025, §1). 13.2 is Helfgott–Platt's (2013) prime ladder. Titchmarsh Ch. XIV uses 8.2a. This rests on the README and on these sources.

## Not verifiable

- `titchmarsh1986`, Chapter XIV (8.2a): settled as uncertified; not opened.
- The other uncertified sources (`montgomeryvaughan2007`, `brown1967`, `iwanieckowalski2004`, `tenenbaum2015`, `apostol1976`, `hardy1949`, `katznelson2004`) and `dlmf-ch6` beyond its contents page: untouched; as in the previous review.
- The description's counts for the pull request as a whole (49 roadmaps, 196 sections, 863 labelled sections) concern other folders and were not recounted here.

## Source issues

- none

## For the human reviewers

- **Licence.** Sections 7.4, 8.1a, 8.1b, 13.1 and 13.2 cite six files of the IEANTN Lean project (stated Apache-2.0, commit `466b41b`). The Goldbach predicates of 13.2 share their one-sentence statements with `ieantn-goldbach-vocabulary` lines 25 and 38, but differ in name and carrier (`ℝ` against `ℕ`).
