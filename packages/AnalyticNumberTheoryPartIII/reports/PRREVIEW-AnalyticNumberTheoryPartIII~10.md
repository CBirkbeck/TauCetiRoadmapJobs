# Review of AnalyticNumberTheoryPartIII (pull request #3027 at f93f554)

**Verdict:** accepted

**Summary.** Accepted with no findings. This is an incremental re-review of the one line changed since `4a2d22f`: the Scope now cites "ToeplitzOperators §1.2" for the Fejér means of circle `L¹` functions, and that section does state them. The title and description were read against this head: no sentence is contradicted, and one small correction asks the description to say that §8.2a is a section this pull request adds. One format note (Robinson's page) is carried, neither blocking. One licence question from earlier rounds remains for the human reviewers.

## C01 — The description never says that §8.2a is added to AnalyticNumberTheoryPartIII by this pull request

A reader of the description meets §8.2a twice, both times in passing: "RiemannHypothesisStatementsAndConsequences cites them and a new supplier, AnalyticNumberTheoryPartIII §8.2a", and, among the `Suggested.lean` changes, "Hadamard's three-circles theorem (§8.2a) … are README targets, not statements of the file". Neither says that the section is new here, so the reader cannot tell a section of the roadmap on main from one of the 196 this pull request adds, and for the other general roadmaps the description does say it ("ZerosOfLFunctions gains §8.4a …; it loses or renumbers no section and gains no supplier").

Against main the folder gains one heading, "8.2a Hadamard's three-circles theorem" (README lines 495–539), with its entries in the Dependencies of Layer 8, the Downstream consumers, the Scope, the Mathlib contract and the References (`robinson1944`; Chapter XIV of `titchmarsh1986`); no heading or Lean declaration is removed, and 8.2a needs Mathlib only. A sentence that would be right, beside the one on ZerosOfLFunctions: "AnalyticNumberTheoryPartIII gains §8.2a (Hadamard's three-circles theorem on an annulus, with the convexity of `log M` in `log R`, from Mathlib's three-lines theorem); it loses or renumbers no section and gains no supplier."

## N01 — Give Robinson's page

8.2a (line 503) and the References (line 1727) cite `robinson1944` as "the theorem of its title". The paper states the classical theorem only in its opening paragraph, p. 795 (`robinson1944` line 11); "p. 795" would be the exact locator.

## Previous findings

- none: the previous report (of `4a2d22f`) raised no finding (no R01).
- Its small correction C01 — repaired: line 1500 now reads "The Fejér means of circle `L¹` functions and their `L¹` approximation: ToeplitzOperators §1.2." The repair introduces no new problem.
- Its format note N01 — not repaired: line 503 still reads "the theorem of its title"; carried as N01 above.

## Verified sound

| Statement | Instances tried | Values computed (left vs right) | Result | Change |
|---|---|---|---|---|
| Scope line 1500: Fejér means and their `L¹` approximation are ToeplitzOperators §1.2 | ToeplitzOperators README on main and at this head (identical files) | heading "1.2 Analytic model, least majorants and uniqueness" at line 145; Fejér mean defined at lines 169–176; 0 matches of `T1` | citation resolves | none |
| The object cited: Fejér mean with coefficients `(1 − |k|/N) â(k)`, `|k| < N` (ToeplitzOperators §1.2 and its Check, line 207) | `e₀`, `e₁` at `N = 1, 2` | `e₀`: factor `1`, `1`; `e₁`: `N = 1` gives `0` (`|k| < N` fails), `N = 2` gives `1 − ½ = ½`; the Check says `e₀, e₀` and `0, e₁/2` | agree | none |
| Scope line 1500 against 7.x of this roadmap: nothing here defines a Fejér mean on the circle | every mention of ToeplitzOperators in the README | 1 mention (line 1500), under "Not owned here"; no *Needs* line or supplier contract names it | a deferral, not a supplier | none |
| Description: "in AnalyticNumberTheoryPartIII … only the module docstring changes" (of `Suggested.lean`) | diff of the folder against main | `Suggested.lean`: +2 −1, inside the module docstring; 0 declarations added, removed or restated | true | none |
| Description: RiemannHypothesisStatementsAndConsequences cites "a new supplier, AnalyticNumberTheoryPartIII §8.2a" | that roadmap's README at this head | 8 lines cite §8.2a (among them 52, 146, 151, 163); §8.2a exists here at line 495 | true; that §8.2a is new is unstated | C01 |

The rows of the previous reviews for the untouched statements stand as in the previous review, of `4a2d22f`.

- The change: 1 line of the README (the Scope, line 1500); no statement, Check, *Needs* line, Lean declaration or layer changed since `4a2d22f`.
- Source locators checked against the text: none new; the changed line carries no source locator, and no target of the seeded sample falls in it.
- Library declarations opened at the pins: 1 (`Complex.HadamardThreeLines.norm_le_interp_of_mem_verticalClosedStrip'`, `Mathlib/Analysis/Complex/Hadamard.lean` line 611, for C01's proposed sentence).
- Cross-roadmap citations resolved: 2 (ToeplitzOperators §1.2 on main; RiemannHypothesisStatementsAndConsequences → §8.2a at this head). The overlap listing shows no other open pull request changing this roadmap and no dropped id.
- Automatic checks: all passed; the only count above zero is the 129 files of the pull request outside this folder, each in a folder that is the pull request's own (131 files changed, 0 outside those folders). Dependency check: `depcheck: 124 roadmaps, 1409 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Elaboration of `Suggested.lean`: 27 "declaration uses `sorry`" warnings and nothing else; no `set_option`, no `lemma`.
- The pull request's text: the title names the family's change and fits a pull request of many folders; the description was read in full as it stands on the pull request. Against main the folder changes by 76 lines (68 insertions, 8 deletions), 1 heading added, 0 removed, 0 layers changed.

Overlap check: read ZerosOfLFunctions, LFunctions, LiCoefficientsArithmeticFormula, SpecialFunctionsGamma, CircleMethodThreePrimes, RiemannHypothesisStatementsAndConsequences and ArithmeticDirichletSeriesPartII (as in the previous review; the change adds no object). One object is shared: Hadamard's three-circles theorem, owned here (8.2a) and cited by RiemannHypothesisStatementsAndConsequences §3.2a. Nothing else is shared.

Source independence: changed passages only: 1 passage (the Scope line) compared with 0 sources, since it cites a roadmap and no source; none shared; largest share of locators `kontorovichtao-pntplus`, about 42 of 108; the diff adds, removes or reorders no layer, so the contents comparison stands as before: independent.

Research link: 10.2–10.3 are the contour route from a zero-free region to a prime number theorem with error term, Ingham's theorem as refined by Pintz (Platt–Trudgian 2020, lines 21–56). 13.1 is Erdős problem 392 (Alexeev et al. 2025, §1). 13.2 is Helfgott–Platt's (2013) prime ladder. Titchmarsh Ch. XIV uses 8.2a. This rests on the README and on these sources.

## Not verifiable

- `titchmarsh1986`, Chapter XIV (8.2a): settled as uncertified; not opened.
- The other uncertified sources (`montgomeryvaughan2007`, `brown1967`, `iwanieckowalski2004`, `tenenbaum2015`, `apostol1976`, `hardy1949`, `katznelson2004`) and `dlmf-ch6` beyond its contents page: not touched by the change; as in the previous review.

## Source issues

- none

## For the human reviewers

- **Licence.** Sections 7.4, 8.1a, 8.1b, 13.1 and 13.2 cite six files of the IEANTN Lean project (stated Apache-2.0, commit `466b41b`). The Goldbach predicates of 13.2 share their one-sentence statements with `ieantn-goldbach-vocabulary` lines 25 and 38, but differ in name and carrier (`ℝ` against `ℕ`).
