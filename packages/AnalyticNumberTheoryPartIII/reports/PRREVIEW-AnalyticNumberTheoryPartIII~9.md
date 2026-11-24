# Review of AnalyticNumberTheoryPartIII (pull request #3027 at 4a2d22f)

**Verdict:** accepted

**Summary.** Accepted with no findings. This is an incremental re-review of the three lines changed since `8d0b573`: the module docstring of `Suggested.lean` now accounts for Hadamard's three-circles theorem of 8.2a, and what it says is true of the README (no target's *Needs* line uses 8.2a). One small correction (the stale citation "ToeplitzOperators T1" in the Scope) and one format note (Robinson's page) are carried from the previous review, neither blocking. One licence question from earlier rounds remains for the human reviewers.

## C01 — The Scope cites "ToeplitzOperators T1", an id that ToeplitzOperators does not have

Under "Not owned here", line 1500 still reads "The Fejér means of circle `L¹` functions and their `L¹` approximation: ToeplitzOperators T1." A reader who follows this finds no T1: ToeplitzOperators, on main and at this head, numbers its material by layers, and the Fejér means of circle `L¹` functions with their `L¹` approximation are in its §1.2 (Analytic model, least majorants and uniqueness), README lines 169–172. Write "ToeplitzOperators §1.2".

## N01 — Give Robinson's page

8.2a (line 503) and the References (line 1727) cite `robinson1944` as "the theorem of its title". The paper states the classical theorem only in its opening paragraph, p. 795 (`robinson1944` line 11); "p. 795" would be the exact locator.

## Previous findings

- none: the previous report (of `8d0b573`) raised no finding (no R01).
- Its small correction C01 — not repaired: line 1500 still reads "ToeplitzOperators T1"; carried as C01 above.
- Its small correction C02 — repaired: the docstring now ends "Hadamard's three-circles theorem of 8.2a is a general target of complex analysis, on which no statement here depends, and also stays in the README." The repair introduces no new problem.
- Its format note N01 — not repaired: line 503 still reads "the theorem of its title"; carried as N01 above.

## Verified sound

| Statement | Instances tried | Values computed (left vs right) | Result | Change |
|---|---|---|---|---|
| `Suggested.lean` docstring, lines 48–49: "no statement here depends" on 8.2a | every mention of 8.2a in the README | 4 mentions (lines 495, 1349, 1386, 1540): its own section, Downstream, Scope, Mathlib contract; 0 *Needs* lines | true | none |
| Same docstring: "also stays in the README" against How to read the build (README lines 65–72) | the README's list of stated headlines | list: 7.1, 7.3, 7.4, 8.1, 8.1a, 8.1b, 8.2, 8.3, 9.4, 10.1–10.3, 11.2–11.4, 12.1, 13.1, 13.2; 8.2a absent from both | README and Lean agree | none |
| 8.2a inequality (the target the changed text cites) | `f = 1 + z`, `z₀ = 0`, radii 1, 2, 4; `f = (z − z₀)²`, radii 1, 3, 9 | `θ = ½`: `3` vs `2^{½}·5^{½} = 3.162`; `9` vs `1^{½}·81^{½} = 9` | holds (strict, then equality) | none |
| Scope line 1500 | ToeplitzOperators at main and at this head | 0 matches of `T1`; Fejér means at its §1.2, lines 169–172 | stale id | C01 |

The rows of the previous review for the untouched statements stand as in the previous review, of `8d0b573`.

- The change: 3 lines of `Suggested.lean` (module docstring only); no declaration, README line or file outside the folder changed since `8d0b573`.
- Source locators checked against the text: 1 (`robinson1944` line 11, p. 795, the convexity of `log M(r)` in `log r`).
- Library declarations opened at the pins: none new; the docstring names no library declaration. The three imports (`Mathlib`, `TauCeti.Analysis.Contour.Residue.Basic`, `TauCeti.NumberTheory.LFunctions.Hecke.Basic`) are unchanged.
- Cross-roadmap citations resolved: 1 re-resolved (ToeplitzOperators, C01); the overlap listing shows no other open pull request changing this roadmap and no dropped id.
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1470 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Elaboration of `Suggested.lean`: 27 "declaration uses `sorry`" warnings and nothing else; no `set_option`, no `lemma`.
- The pull request's text: the description states that in AnalyticNumberTheoryPartIII only the module docstring of `Suggested.lean` changes, to say that the three-circles theorem (new §8.2a) stays in the README; this agrees with the head (README +1 heading, 0 Lean declarations added or removed).

Overlap check: read ZerosOfLFunctions, LFunctions, LiCoefficientsArithmeticFormula, SpecialFunctionsGamma, CircleMethodThreePrimes, RiemannHypothesisStatementsAndConsequences and ArithmeticDirichletSeriesPartII (as in the previous review; the change adds no object). One object is shared: Hadamard's three-circles theorem, owned here (8.2a) and cited by RiemannHypothesisStatementsAndConsequences §3.2a. Nothing else is shared.

Source independence: changed passages only: 1 passage (the added docstring sentence) compared with 1 source (`robinson1944` line 11), none shared beyond the theorem's name; largest share of locators `kontorovichtao-pntplus`, about 42 of 108; the diff adds, removes or reorders no layer, so the contents comparison stands as before: independent.

Research link: 10.2–10.3 are the contour route from a zero-free region to a prime number theorem with error term, Ingham's theorem as refined by Pintz (Platt–Trudgian 2020, lines 21–56). 13.1 is Erdős problem 392 (Alexeev et al. 2025, §1). 13.2 is Helfgott–Platt's (2013) prime ladder. Titchmarsh Ch. XIV uses 8.2a. This rests on the README and on these sources.

## Not verifiable

- `titchmarsh1986`, Chapter XIV (8.2a): settled as uncertified; not opened.
- The other uncertified sources (`montgomeryvaughan2007`, `brown1967`, `iwanieckowalski2004`, `tenenbaum2015`, `apostol1976`, `hardy1949`, `katznelson2004`) and `dlmf-ch6` beyond its contents page: not touched by the change; as in the previous review.

## Source issues

- **Misprint** in kontorovichtao-pntplus at Theorem 9.1.36, p. 84: the source states `ζ(s)³ = ζ(2s) Σ τ(n²) n^{−s}` with no range of `s`; it should carry `Re s > 1`, as its restatement Theorem 9.1.50 (p. 86) does; affects nothing.

## For the human reviewers

- **Licence.** Sections 7.4, 8.1a, 8.1b, 13.1 and 13.2 cite six files of the IEANTN Lean project (stated Apache-2.0, commit `466b41b`). The Goldbach predicates of 13.2 share their one-sentence statements with `ieantn-goldbach-vocabulary` lines 25 and 38, but differ in name and carrier (`ℝ` against `ℕ`).
