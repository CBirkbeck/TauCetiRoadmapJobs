# Review of ArithmeticDirichletSeriesPartII (pull request #1415 at e6b3fd5)

**Verdict:** needs changes

## R01 (P3) — Build-warning claim in the description is inaccurate

**Location:** Pull request #1415, description, Validation paragraph: “the targeted Lake build succeeds with `sorry` as the only warning”.
**Claim:** The targeted build also emits a module-system advisory for this roadmap's Mathlib import.
**Witness:** `lake build TauCetiRoadmap.ArithmeticDirichletSeriesPartII.Suggested` exits 0 but reports that `TauCetiRoadmap/ArithmeticDirichletSeriesPartII/Suggested.lean` imports Mathlib without using the module system; the advisory occurs alongside the 19 admitted-theorem warnings.
**Repair:** Replace the quoted clause with: “The targeted Lake build succeeds with admitted-theorem warnings and a module-system advisory; direct Lean elaboration emits only `sorry` warnings.”

## Previous findings

- R01 — repaired: the previous report's carried reference-removal finding remains repaired: `TauCetiRoadmap/ArithmeticDirichletSeriesPartII/README.md:1458` has seven references and the folder contains no IEANTN occurrence.
- R02 — repaired: the previous report's carried source finding remains repaired: `TauCetiRoadmap/ArithmeticDirichletSeriesPartII/README.md:1471` cites revision `127b50e33f6033e2147921167a117af96d9ba4ea`; its five pnt-ik-ch1 locators still resolve.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §4.5 source, pole-order comparison | r = 1, 2, 3; X = exp(10) | Smaller/main orders: 1/2, 2/4, 4/8; logarithmic-scale ratios: 0.1, 0.01, 0.0001 → 0 | Strictly lower order | none |
| §4.5 `lowerPole_perturbation` | c = d₂, d(n) = d₂(n) + (−1)ⁿ, b = 1 for n > 0; zero at 0 | At X = 1,2,3,4: S_c = 1,3,5,8; S_d = 0,3,4,8; errors −1,0,−1,0; both normalized limits 1 | Matches coefficient bound and conclusion | none |
| §4.5 strict-order negative control | c = b = 1, d = 2 on positive integers; l = k = 0 | Coefficient bound 1 ≤ 1; S_c(X)/X → 1, S_d(X)/X → 2; hypothesis 0 < 0 fails | Equal-order perturbation excluded | none |
| PR validation claim | Targeted Lake build; direct Lean elaboration | Lake: 19 sorry warnings plus 2 module-advisory occurrences; direct elaboration: 19 sorry warnings; both exit 0 | “only warning” fails for Lake | R01 |

Rows for untouched statements stand as in the previous review of `e87e4fe`.

- Sources: 1 changed locator checked, Wood §7, printed p. 417, against wood2019 lines 1692–1701; 5 carried pnt-ik-ch1 locators rechecked at lines 176, 193, 243, 262 and 622.
- Affected passage: `TauCetiRoadmap/ArithmeticDirichletSeriesPartII/README.md:1265–1270` distinguishes Wood's counting estimate from the coefficientwise majorant required by §4.5; §4.3 supplies the stated analytic bound.
- Pinned API: 4 declarations opened in `TauCeti/Order/Northcott/Basic.lean:103,175,179,184`; inclusive finite summation, positivity, comparison and monotonicity agree with the proof route.
- Signatures: all 24 declarations checked with `#check @name`; 24 match the supplied elaborated signatures, with no binder changes; §4.5 retains positivity, strict order, convergence and boundary hypotheses.
- Gate: every scanner returns 0, `OK`; worker gate includes `build=0`; independent targeted build and direct elaboration exit 0, with warnings distinguished in R01.
- Dependency output: `depcheck: 244 roadmaps, 2206 edges, 0 problem(s)`; 0 UPWARD or CYCLE lines.
- Change boundary: 7 README lines changed, 0 Lean declarations changed, 0 outside-folder paths, 0 uncommitted changes; PR title and summary match the added roadmap and its targets apart from R01's validation claim.

Overlap check: read AnalyticNumberTheoryPartIII, ProbabilisticAndMetricNumberTheoryPartII, ArithmeticDirichletSeries (main and #1808), AsymptoticExpansions (#2113), ProbabilisticAndMetricNumberTheory, TauberianBoundaryConvergence and AnalyticNumberTheoryPartI; integer zeta-power series and scalar Delange/Laplace tools belong here, simple-pole Wiener–Ikehara and generic summation to ArithmeticDirichletSeries/Tau Ceti, divisor error-term expansions to AnalyticNumberTheoryPartI; the other scopes add no owner of §4.5's lower-pole implication. No dropped citation or conflicting head is listed.

Source independence: changed passages only; 1 passage compared with 1 source, no copied expression or reused material found; largest share of changed locators: wood2019, 1 of 1. No layer was added, removed or reordered, so the previous arrangement assessment stands.

## Not verifiable

- none in the changed passages.

## Source issues

- **Misprint** in pnt-ik-ch1 at the docstring of `d`, line 184, revision `127b50e3`: the source says the divisor function counts ordered products of natural numbers; it should be positive factors for positive n, with value zero at n = 0; affects nothing.

## For the human reviewers

- none.

