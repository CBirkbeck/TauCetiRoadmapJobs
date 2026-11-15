# Review of AnalyticNumberTheoryPartIII (pull request #2008 at 69f498b)

**Verdict:** accepted

Incremental re-review of 0 changed lines since `69f498b`: the folder is settled, and this round reads the pull request's title and description, as they stand now, against the head. No finding.

## Previous findings

- R01 — repaired: the description now reads "ZerosOfLFunctions and ProbabilisticAndMetricNumberTheory supply inputs; ArithmeticDirichletSeriesPartII and ExplicitPrimeCounting enter only through Checks and examples", and "No roadmap on main or in an open pull request cites this one".
- R02 — repaired: both layer lists now name Brown's aliasing bound (7.4), the circle integrals about isolated singularities (8.1a) and the L-shaped shift to `Re s = −∞` (8.1b); the section list names 7.4, 8.1a and 8.1b.

## Verified sound

| Statement | Instances tried | Values computed (left vs right) | Result | Change |
|---|---|---|---|---|
| 13.2 `oddGoldbachUpTo_of_primeGaps` (description: "from verified even and odd ranges to a longer odd range") | `x₀ = 2`, `Δ = 2`, `H = 100`; hypothesis at `x = 1` | hypothesis holds for `2 ≤ x < 5000`; even range to 100 holds; odd range to `x₀ + 4 = 6` is empty; bound `(100 − 4)·2 + 4 = 196`; odd `7 ≤ n ≤ 196` with no three-prime sum: none. At `x = 1` the interval `(½, 1]` has no prime, so `x₀ = 1` is excluded | holds; description agrees with the head | none |
| 11.3 `LSeries_sigmaC_mul_sigmaC` (description: "Ramanujan's four-shift identity") | `α = 1`, `β = ½`, `s = 4` (all four half-plane conditions hold: `4 > 2.5`) | partial sum to `n = 2·10⁵`: `1.94315236`; `ζ(4)ζ(3)ζ(3.5)ζ(2.5)/ζ(6.5) = 1.94315240`; difference `3.8·10⁻⁸`, the size of the tail | holds | none |

The rows for every other statement stand as in the previous review, of `69f498b`.

- Description sentences checked against the head: 24 (summary block, the list of 7 layers, the Part I paragraph, the folder paragraph, dependencies, validation); 0 contradicted. The title and first sentence say that the pull request adds the roadmap; the worker's change summary agrees (2094 insertions, 0 deletions, 0 headings or declarations removed).
- "27 theorems and the eight definitions": `TauCetiRoadmap/AnalyticNumberTheoryPartIII/Suggested.lean` has 27 theorems and 8 definitions with bodies (`deltaSpike`, `smoothCutoff`, `inghamExponent`, `sigmaC`, `generalizedDivisor`, `factorialFactorCount`, `EvenGoldbachUpTo`, `OddGoldbachUpTo`); the 18 sections listed are those of README lines 430–433.
- "every roadmap the README names is either on main or one of the open roadmaps of the merge order below": 14 names resolved. On main: AnalyticNumberTheoryPartI, AnalyticNumberTheoryPartII, LFunctions, ZerosOfLFunctions, AsymptoticExpansions, SpecialFunctionsEiLiErfIncompleteGamma, TauberianBoundaryConvergence, ToeplitzOperators, and ContourIntegration and ArithmeticDirichletSeries under `Completed/`. Open, all four in the description's merge-order block: ArithmeticDirichletSeriesPartII, ProbabilisticAndMetricNumberTheory, ExplicitPrimeCounting, ExplicitZetaBounds.
- "No roadmap … cites this one": `roadmaps grep 'AnalyticNumberTheoryPartIII'` over main and the open heads matches only this folder's own namespace lines.
- Gate rerun at this head: every counter 0, `OK`. Dependency check: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Outside-folder diff: empty.
- Elaboration of `Suggested.lean`: 27 "declaration uses `sorry`" warnings, no other output; imports `Mathlib` and the two Tau Ceti modules `TauCeti.Analysis.Contour.Residue.Basic` and `TauCeti.NumberTheory.LFunctions.Hecke.Basic`; no `set_option`.
- Overlap check: the overlap tool lists no pull request changing this roadmap, no dropped id and no id only a revision defines. Read ExplicitMultiplicativeFunctions (scope: explicit averages and pointwise bounds with constants; no Dirichlet series or abscissa of Layer 11) and this README's Scope lines 133–169 for ExplicitZetaBounds, ExplicitPrimeCounting, ArithmeticDirichletSeriesPartII, ZerosOfLFunctions, AnalyticNumberTheoryPartI and ArithmeticDirichletSeries; nothing shared. The eight definition names and `LSeries_totient` are declared in no other roadmap's `Suggested.lean`.
- Source independence: changed passages only; 0 passages compared (the folder did not change); arrangement not compared again (no layer added, removed or reordered).
- Remark: the resolver's one lead, `IsCompletelyAdditive.powOfAdditive_mul` (README line 394), is a name of ProbabilisticAndMetricNumberTheory §0.1a at its open head, as the earlier reviews found.

## Not verifiable

- The seeded source sample falls wholly in untouched text; no locator was opened this round.
- "AI assistance: claude (claude-opus-5-5) ported the independently reviewed package": not readable from the head.

## Source issues

- none

## For the human reviewers

- **Licence.** README References and sections 7.4, 8.1a, 8.1b, 13.1, 13.2 cite six files of the IEANTN Lean project (stated Apache-2.0, commit `466b41b`). The Goldbach predicates differ from `ieantn-goldbach-vocabulary` lines 35 and 49 in name and carrier (`ℝ` against `ℕ`).
