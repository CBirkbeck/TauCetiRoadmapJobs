# Review of AnalyticNumberTheoryPartIII (pull request #2008 at 69f498b)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since `69f498b`: the folder is settled, and this round reads the pull request's title and description against the head. Both findings are in the description; neither asks for a change to the folder.

## R01 (P3) — the description names suppliers as consumers

**Location:** pull request description, `<!-- roadmap-summary -->`, "Why Tau Ceti wants it": "so that ZerosOfLFunctions, ExplicitPrimeCounting, ExplicitZetaBounds and the sieve and probabilistic roadmaps can consume a single transfer theorem … The Dirichlet-series layer gives ArithmeticDirichletSeriesPartII and the explicit roadmaps the classical series".

**Claim:** The head contradicts it. Every roadmap named is earlier in the merge order, four of them are this roadmap's suppliers, and none cites this roadmap.

**Witness:** `TauCetiRoadmap/AnalyticNumberTheoryPartIII/README.md` lines 355, 389, 399, 406 (`### From TauCetiRoadmap.ZerosOfLFunctions`, `…ProbabilisticAndMetricNumberTheory`, `…ArithmeticDirichletSeriesPartII`, `…ExplicitPrimeCounting`); lines 152–153: "Those roadmaps prove their statements by their own routes". `roadmaps grep 'AnalyticNumberTheoryPartIII'`: no match outside this folder.

**Repair:** Replace the two sentences with: "This part proves those tools once, with their own hypotheses, so that later roadmaps can consume a single transfer theorem, a single residue calculus on rectangles and a single smoothing toolkit instead of re-deriving them. ZerosOfLFunctions, ProbabilisticAndMetricNumberTheory, ArithmeticDirichletSeriesPartII and ExplicitPrimeCounting are its suppliers, and the explicit roadmaps keep their own routes. The Dirichlet-series layer gives later consumers the classical series with exact abscissas."

## R02 (P3) — the description's layer lists predate sections 7.4, 8.1a and 8.1b

**Location:** pull request description, summary block ("Layer 7 proves Fourier decay … with a quantitative window; Layer 8 the rectangle residue theorem in Mathlib's edge form, the derivative form of Borel–Carathéodory and Landau's local logarithmic-derivative lemma") and the list after "It proves, in order:".

**Claim:** Both lists leave out three sections of the head, each with a headline theorem in `Suggested.lean`; the description was written for the first commit.

**Witness:** README lines 575, 690, 729 (`### 7.4`, `### 8.1a`, `### 8.1b`) and `exists_tendsto_samplingSum_norm_sub_le`, `rectangle_boundary_integral_eq_sum_circleIntegral`, `vertical_integral_eq_lShaped_add_sum_circleIntegral`: 0 of 6 at `907d9b6`, 6 of 6 from `4feb791`.

**Repair:** In both lists write, for Layer 7: "Fourier decay for functions of bounded variation, principal-value inversion on vertical lines with a quantitative window, and Brown's aliasing bound for the sampling series"; for Layer 8: "the rectangle residue theorem in Mathlib's edge form, with residues and with circle integrals about arbitrary isolated singularities, the L-shaped contour shift to `Re s = −∞`, the derivative form of Borel–Carathéodory and Landau's local logarithmic-derivative lemma". (The README's Summary already reads this way.)

## Previous findings

- The previous report (of `69f498b`) had no finding; nothing to account for.

## Verified sound

| Statement | Instances tried | Values computed (left vs right) | Result | Change |
|---|---|---|---|---|
| 7.4 `exists_tendsto_samplingSum_norm_sub_le` (R02 names it) | `W = 1`, `G = e^{−πiξ/2}` on `(1, 3)`, `t = ¼` | `f(¼) = 2`; samples `f(n/2)·sinc = −2/(π²(n − ½)²)`, sum over `|n| ≤ 2·10⁵` is `−1.999998 → −2`; error `4` vs `2·∫|G| = 4` | holds with equality; constant `2` sharp | none |
| 10.2 `inghamExponent`, description's "error `x·exp(−c·ω_η(x))`" | `η = 1/log t`, `log x = 100`, infimum over `t ≥ 3` | `min (100/log t + log t) = 20.0 = 2√(log x)`: the classical `exp(−c√log x)` | description agrees with the head | none |
| 13.2 `oddGoldbachUpTo_of_primeGaps`, description's "transfer of verified Goldbach ranges along short-interval primes" | `H = 4·10¹⁸`, `Δ = 28 314 000` | `(H − 4)Δ + 4 = 113 255 999 999 999 999 886 744 004`, the README's value; `≥ 1.1325·10²⁶` | description agrees with the head | none |

The rows for every other statement stand as in the previous review, of `69f498b`.

- Description sentences checked against the head: 21 (summary block 3 paragraphs, prose list of 7 layers, folder, dependencies, validation lines); 2 contradicted or outdated (R01, R02), the rest agree.
- "four results for `ζ` and Dirichlet characters": README lines 34–38 name four (§0.33a, §0.30a, §§3.3–3.4, §3.24a). "Every supplier … on main or … in the merge order below": LFunctions, ZerosOfLFunctions, AnalyticNumberTheoryPartI on main, ContourIntegration and ArithmeticDirichletSeries under `Completed/`, the three open suppliers in the description's merge-order block.
- "only real-bodied definitions and theorems": 8 definitions with bodies, 27 theorems, 35 declarations, as the worker's change summary counts.
- Gate rerun at this head: every counter 0, `OK`. Dependency check: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line; this roadmap is line 279 of the merge order, after every supplier.
- Elaboration of `Suggested.lean`: 27 "declaration uses `sorry`" warnings, no other output. Outside-folder diff: empty.
- Overlap check: the overlap tool lists no pull request changing this roadmap, no dropped id, no id only a revision defines; the folder is unchanged, so the scopes of the closest roadmaps (ArithmeticDirichletSeriesPartII, ZerosOfLFunctions, AnalyticNumberTheoryPartI) were not read again; nothing shared was reported for them by the review of `69f498b`.
- Source independence: changed passages only; 0 passages compared (the folder did not change); arrangement not compared again (no layer added, removed or reordered).
- Remark: the resolver's one lead, `IsCompletelyAdditive.powOfAdditive_mul` (README line 394), is a name of ProbabilisticAndMetricNumberTheory §0.1a at its open head, as the previous review found.

## Not verifiable

- The seeded source sample falls wholly in untouched text; no locator was opened this round.
- Whether the pull request is still a draft ("follow on this draft before it is marked ready") cannot be read from the head.

## Source issues

- none

## For the human reviewers

- **Licence.** README References and sections 7.4, 8.1a, 8.1b, 13.1, 13.2 cite six files of the IEANTN Lean project (stated Apache-2.0, commit `466b41b`). The Goldbach predicates differ from `ieantn-goldbach-vocabulary` lines 35 and 49 in name and carrier (`ℝ` against `ℕ`).
