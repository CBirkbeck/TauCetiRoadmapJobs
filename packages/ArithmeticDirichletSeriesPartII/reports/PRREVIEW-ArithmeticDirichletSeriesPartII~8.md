# Review of ArithmeticDirichletSeriesPartII (pull request #1415 at e6b3fd5)

**Verdict:** accepted

## Previous findings

- R01 — repaired: the description's Validation paragraph now reads “the targeted Lake build succeeds with admitted-theorem warnings and a module-system advisory”; the build at this head shows exactly those warnings (see the table).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Description summary of `delangeLaplace` | `a = 1`, `k = 1`, `A = 2`, `α(t) = 2eᵗt` | Transform `2/(s−1)²`, so `g ≡ 2`, `PoleBoundary F 1 1 2`; ratio `α/(eᵗt) = 2 = A/k!`; Lean has `0 < a`, `0 < A`, `HasLaplace` integrability | Summary matches the Lean statement | none |
| Description constant `A/(a·k!)`, `delangeDirichlet_positiveAbscissa` | `c n = n`, `F = ζ(s−1)`, `a = 2`, `k = 0`, `A = 1` | `S(X)/(X²/2)` = 1.001 at 10³, 1.000001 at 10⁶; predicted `A/(a·0!) = 1/2` | Constant agrees | none |
| “Divisor sums of ζ²”, `zetaPow_counting` at `k = 1` | X = 10⁴, 10⁵, 10⁶ | `∑d(n)` = 93,668; 1,166,750; 13,970,034; over `X log X`: 1.0170, 1.0134, 1.0112; residual after `(2γ−1)X`: 0.20, 0.05, 0.09 times `√X` | Limit `1/1! = 1` | none |
| “Divisor sums of ζ⁴”, `zetaPow_counting` at `k = 3` | X = 10³, 10⁴, 10⁵ | `∑d₄(n)` = 93,237; 1,951,526; 35,270,969; over `X(log X)³/6`: 1.697, 1.499, 1.387, falling; over `/2` or `/3`: below 1 and falling | Only `1/3!` is compatible | none |
| “a dyadic series shows the boundary hypothesis … is needed” (§5.2) | `c n = n` at `n = 2^j` | `F = 1/(1 − 2^(1−s))`, poles at `1 + 2πim/log 2`; `S(2^J)/2^J → 2`, `S(2^(J+1)−1)/(2^(J+1)−1) → 1`; local prediction `1/log 2 ≈ 1.443` | No limit, `away` fails | none |
| Validation clause (R01) | Targeted Lake build; direct `lake env lean` | Lake: exit 0, 19 `sorry` warnings, 2 module-system advisory lines; direct elaboration: exit 0, 19 `sorry` warnings only | Clause holds | none |
| Dependencies sentence | Each roadmap the README cites | ArithmeticDirichletSeries: Completed on main; AnalyticNumberTheoryPartII §4.5c: main line 277, merged 0a61b759; SieveMethodsAndPrimePatterns §1.1: deferral only, in no `*Needs:*` | No open supplier; sentence holds | none |

Rows for untouched statements stand as in the previous review, of `e6b3fd5`.

- Change boundary: 0 folder lines changed since `e6b3fd5`; 0 outside-folder paths against `origin/main`; worktree clean at `e6b3fd5`.
- Pull request text: the title and the 15 sentences of the summary block and prose read against the head; the 3 Lean names they cite exist in `Suggested.lean`; the folder's three files match the description; none contradicted.
- Gate: every scanner 0, `OK`; worker gate includes `build=0`; targeted build and direct elaboration as in the table.
- Dependency output: `depcheck: 244 roadmaps, 2206 edges, 0 problem(s)`; 0 UPWARD or CYCLE lines.
- Cross-roadmap citations resolved on main: AnalyticNumberTheoryPartII §4.5c (README line 277), AnalyticNumberTheoryPartI §3.12a (line 2395) and §3.22 (line 2601).
- Sources: no folder passage changed, so no seeded locator falls in changed text; 0 locators rechecked.

Overlap check: read AnalyticNumberTheoryPartIII (#2008), ProbabilisticAndMetricNumberTheoryPartII (#1838), ArithmeticDirichletSeries (main and #1808), AsymptoticExpansions (main and #2113), ProbabilisticAndMetricNumberTheory (#1421), TauberianBoundaryConvergence and AnalyticNumberTheoryPartI; #2008 and #1838 cite this roadmap for `HasLaplace`, `squaredSinc`, Delange's theorem and §5.1; AsymptoticExpansions on main writes Laplace integrals out and owns no `HasLaplace`; #1808 adds no smoothed, interval or higher-order Wiener–Ikehara form; nothing shared.

Source independence: changed passages only; 0 folder passages changed, 0 compared; largest share of locators delange1954, 16 of 61 source mentions. No layer was added, removed or reordered, so the previous arrangement assessment stands.

## Not verifiable

- none.

## Source issues

- none

## For the human reviewers

- none
