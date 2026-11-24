# Review of AnalyticNumberTheoryPartIII (pull request #3027 at 8d0b573)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 71 changed lines since `592bdb1`. Accepted with no findings. The change is the new §8.2a, Hadamard's three-circles theorem on an annulus, with its mentions in the Layer 8 dependencies, the Scope, the supplier contracts and the References. The inequality, the positivity and convexity clause, the route through Mathlib's three-lines theorem and the four Checks were recomputed and hold; Robinson (1944, p. 795) states the theorem; neither Mathlib nor Tau Ceti has it at the pins. There are two small corrections (one of them in untouched text) and one format note, none blocking, and nothing is left for a human to decide.

## C01 — The module docstring of `Suggested.lean` does not account for 8.2a

Lines 43–48 of `TauCetiRoadmap/AnalyticNumberTheoryPartIII/Suggested.lean` list the README's remaining targets and say that they "are lemmas on the way to these statements, or instances of them". The new 8.2a is neither among the stated theorems nor in that list, and it is neither a lemma toward a stated theorem nor an instance of one: no section of this roadmap uses it, and its consumer is RiemannHypothesisStatementsAndConsequences §3.2a. A reader of the file cannot tell whether 8.2a was left out on purpose. Either edit would do:

- add "Hadamard's three-circles theorem of 8.2a, a general target kept in the README" to the docstring's list; or
- state the inequality in `Suggested.lean`, as 8.2 is stated; it is statable at the pins with `DiffContOnCl ℂ f {z | R₁ < ‖z − z₀‖ < R₃}` and the supremum of `‖f‖` over `Metric.sphere z₀ R`.

## C02 — Untouched text: `README.md`, Scope, "Not owned here" (line 1500) cites "ToeplitzOperators T1", an id that roadmap does not have

The line reads "The Fejér means of circle `L¹` functions and their `L¹` approximation: ToeplitzOperators T1." ToeplitzOperators, on main and at this head, has no T1: it is numbered by layers, and the Fejér means on circle `L¹` with their `L¹` approximation are in its §1.2 (Analytic model, least majorants and uniqueness; README lines 169–176). "ToeplitzOperators §1.2" would resolve. This pull request did not write the line; it is for a separate change.

## N01 — Give Robinson's page

8.2a (line 503) and the References (line 1728) cite `robinson1944` as "the theorem of its title". The paper states the classical theorem only in its opening paragraph (p. 795, `robinson1944` lines 9–12); its own results are sharper bounds for single-valued functions. "p. 795" is the exact locator.

## Verified sound

| Statement | Instances tried | Values computed (left vs right) | Result | Change |
|---|---|---|---|---|
| 8.2a inequality, Check 1 | `f = z − z₀`, radii 1, 2, 4 | `θ = log 2/log 4 = ½`; `M(2) = 2` vs `1^{½}·4^{½} = 2` | equality | none |
| 8.2a inequality, Check 2 | `f = (z − z₀)⁻¹`, any triple | `1/R₂` vs `exp(−(1−θ)log R₁ − θ log R₃) = exp(−log R₂) = 1/R₂` | equality | none |
| 8.2a inequality, further instances | `z + 1/z`, `exp(1/z) + z²`, `1/(z − ½)` at (1, 2, 4), (1, 1.5, 3), (0.6, 1, 2.5), 20000 sample points per circle | `2.5 ≤ 2.915`; `2.167 ≤ 2.415`; `2.0 ≤ 2.476`; `5.649 ≤ 8.017`; `4.198 ≤ 5.434`; `3.718 ≤ 6.328`; `0.667 ≤ 0.756`; `1.0 ≤ 1.104`; `2.0 ≤ 3.422` | holds | none |
| 8.2a endpoints and junk values | `θ = 0`, `θ = 1`; `M(R₁) = 0` | `θ = 0`: `M(R₁)¹·M(R₃)⁰ = M(R₁)`; `θ = 1`: `M(R₃)`; `0^{1−θ} = 0` for `θ < 1`, `0⁰·b = b` at `θ = 1` | consistent with real powers | none |
| 8.2a wrong model, Check 3 | exponent linear in `R`, `f = z − z₀`, radii 1, 2, 4 | exponent `1/3`: `2` vs `4^{1/3} = 1.5874` | fails, so the Check separates | none |
| 8.2a positivity and convexity, Check 4 | `f = 0`; `f = 0` on the annulus and `1` at `z₀` | `M ≡ 0`, `log M` undefined; second `f` nonzero as a function, `z₀` outside the annulus since `R₁ > 0`, `M ≡ 0` | clause needs "not identically zero on the annulus" | none |
| 8.2a positivity argument | `M(R) = 0` for interior `R`; for `R = R₁` | circle has accumulation points in the connected open annulus, identity theorem; endpoint: `0^{1−θ}·M(R₃)^θ = 0` for `θ ∈ (0, 1)` | argument closes | none |
| 8.2a route | Mathlib `Analysis/Complex/Hadamard.lean:611` | hypotheses `l < u`, `DiffContOnCl` on open strip, `BddAbove` on closed strip, bounds `a`, `b` on `re = l`, `re = u`; exponent `(re z − l)/(u − l)` = `θ` at `re w = log R₂` | matches README lines 1535–1538 | none |
| 8.2a against its consumer | RiemannHypothesisStatementsAndConsequences §3.2a at this head | same hypotheses, same `θ = log(r₂/r₁)/log(r₃/r₁)`, same clause on nonvanishing | agree | none |
| `Suggested.lean` lines 43–48 | 8.2a against the stated and the listed targets | in neither; no section here uses it | out of date | C01 |
| Scope line 1500 | ToeplitzOperators on main and at this head | 0 occurrences of `T1`; Fejér means at §1.2, lines 169–176 | stale id, untouched text | C02 |

- Previous review (same head): no findings to repair; its two small corrections and its format note stand and are restated here.
- Record against the merge base `592bdb1`: 7 layers kept with their titles, 0 headings removed, 1 added (8.2a); `Suggested.lean` unchanged.
- Source locators checked against the text: 1 (`robinson1944` lines 9–12, p. 795, read at the AMS Bulletin open archive: convexity of `log M(r)` in `log r` for `f` regular in the open ring). The seeded sample falls in the change only at 8.2a.
- Library declarations opened at the pins: `Complex.HadamardThreeLines.norm_le_interp_of_mem_verticalClosedStrip'` (`Mathlib/Analysis/Complex/Hadamard.lean:611`), `DiffContOnCl` (`Mathlib/Analysis/Calculus/DiffContOnCl.lean:31`), `IsCompact.exists_bound_of_continuousOn` (`Mathlib/Analysis/Normed/Group/Bounded.lean:94`), `AnalyticOnNhd.eqOn_zero_of_preconnected_of_frequently_eq_zero` (`Mathlib/Analysis/Analytic/IsolatedZeros.lean:210`). A search for the complex three-circles theorem finds none in Mathlib or Tau Ceti; Tau Ceti has only the Gauss-valuation analogues (`RingTheory/WittVector/GaussValuation.lean:406`, `IntervalRing/Subinterval.lean:87`).
- Cross-roadmap citations: the changed text adds none. Six citations of §8.2a from RiemannHypothesisStatementsAndConsequences at this head resolve. QuasiRiemannHypothesis uses the three-circles inequality only inside a route, from the same Mathlib declaration, and states no theorem. The name `IsCompletelyAdditive.powOfAdditive_mul` (line 1668, untouched) is a proposed name of ProbabilisticAndMetricNumberTheory (its README line 263).
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1470 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. No file outside `TauCetiRoadmap/` is changed, and the other changed folders are the pull request's own.
- Elaboration of `Suggested.lean`: 27 "declaration uses `sorry`" warnings and nothing else. The file is unchanged since the merge base, so no signature or one-tactic probe was repeated.

Overlap check: read ZerosOfLFunctions, RiemannHypothesisStatementsAndConsequences, QuasiRiemannHypothesis and PadicDifferentialEquationsAndRigidCohomology for the object the change adds; LiCoefficientsArithmeticFormula, SpecialFunctionsGamma, LFunctions, CircleMethodThreePrimes and ArithmeticDirichletSeriesPartII are not touched by the change. One object is shared: Hadamard's three-circles theorem for holomorphic functions, owned here (8.2a) and cited by RiemannHypothesisStatementsAndConsequences §3.2a; the p-adic roadmap's three-circles statements are for Gauss norms, a different object.

Source independence: changed passages only; 4 passages (statement, route, Checks, Scope sentence) compared with 1 source, `robinson1944`; the only shared run is 6 words at its line 11 ("is a convex function of log"), which the mathematics forces; the route (three-lines theorem through the exponential) is not the source's (maximum principle for `f(z)/z^λ`). `titchmarsh1986` could not be read. No layer is added, removed or reordered, so the arrangement was not compared.

Research link: Layers 9–10 are the contour route from a zero-free region to a prime number theorem with error term in Ingham's form, for Hecke `L`-functions of number fields; Layer 13 includes Erdős problem 392; 8.2a is the three-circles theorem (Robinson 1944) used in Titchmarsh, Chapter XIV. Rests on the README's summary and `robinson1944`.

## Not verifiable

- `titchmarsh1986`, Chapter XIV (8.2a, "where it is used with Borel–Carathéodory"): settled as uncertified; not opened.

## Source issues

- none

## For the human reviewers

- none
