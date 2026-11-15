# Review of ExplicitNumberFields (pull request #1944 at 5deaeb7)

**Verdict:** accepted

Incremental re-review of the 8 lines changed since `43f46f2` (one sentence of the route of 2.7 in `TauCetiRoadmap/ExplicitNumberFields/README.md`), and the check of the pull request's title and description against this head. No finding.

## Previous findings

- R01 — repaired: the description's "Approach and generality" now reads "Each target that cites a theorem states it at the generality its source proves […] The other targets cover the class their source covers: imaginary quadratic fields (2.7), totally imaginary fields (3.4) […]".

## Verified sound

### Adversarial table

The diff changes no statement; the rows are for the changed sentence of 2.7 and the formulae of 2.7 and 2.2 that it must agree with.

| Statement | Instances | Values (left vs right) | Result |
|---|---|---|---|
| 2.7 route, README 1640–1641: `ζ_K(0) ≠ 0` only for `ℚ` and imaginary quadratic fields; order of vanishing `r₁ + r₂ − 1` | `ℚ`; `ℚ(i)`; `ℚ(√−3)`; `ℚ(√5)`; a cubic field | orders `0, 0, 0, 1, ≥ 1`; values `−1/2, −1/4, −1/6, 0, 0` | true in both directions: order `0` iff `(r₁, r₂) ∈ {(1,0), (0,1)}` |
| 2.7, README 1629: `ζ_K(0) = (1/(2d)) Σ r χ(r) = −h_K/w_K` | `d = 4`; `d = 3` | `(1 − 3)/8 = −1/4` vs `−1/4`; `(1 − 2)/6 = −1/6` vs `−1/6` | agrees with the changed sentence and with the Check at README 1650 (`−1/6`) |
| 2.2 route, README 1431–1432: residue `ζ_K(0) xⁿ/n!` "nonzero for `n ≥ 2` only when `K` is imaginary quadratic" | `n = 1` excluded; `n = 2` | `r₁ + r₂ − 1 = 0` with `n ≥ 2` forces `(0, 1)` | consistent with the changed sentence (which adds the case `n = 1`) |

The rows for every other statement stand as in the previous review, of `43f46f2`.

### The description against the head

| Sentence of the description | Head | Result |
|---|---|---|
| "`log⁺` in place of `log` in Debaene's counts" | README 1499–1507, 3429–3434 | agrees |
| ideal counts other than 2.7, residue bounds other than 3.4, zero counts, 5.1, 5.3, 7.1 "for every number field […] with the source's lower bounds on `n` or `d_K`" | 2.2 (`n ≥ 2`), 2.4 (every `n`), 2.6 (`n ≥ 2`), 3.1–3.3 (`n ≥ 2`, `n ≥ 3`), 4.1–4.2 (`T ≥ 1`), 5.1, 5.3, 7.1 (`n ≥ 2`) | agrees |
| "totally imaginary fields (3.4), Galois fields of odd degree (the sign of `ζ_K` in 4.3), quadratic fields (the gaps of 4.9), abelian fields (5.2), cubic and quartic fields (5.4), CM-fields (5.5–5.6), Galois fields (5.7), Galois extensions (7.2–7.5)" | README 1756, 2110–2113, 2422–2425, 2567, 2656, 2695–2719, 2856, 3296, 3390, 3426 | agrees |
| 4.5, Lee's one-zero region of 4.6, the repulsion of Kadiri–Ng–Wong and Kadiri–Ng (4.10) and 7.4 "beyond an absolute threshold" | README 2184 (`D₀`), 2218 (`D₁`), 2487 and 2499 (`D₀`), 3393 (`D₀`) | agrees |
| "(4.7, 4.9, 5.6, 5.7) take it as the hypothesis *UniformQuadraticZeroGap*, and […] Guo's and Banks's are separate targets of 4.9" | README 2330, 2439, 2769, 2859; 2422–2423 | agrees |
| Tau Ceti's `h_K ≤ d_K 4ⁿ` and at most `X² 2ⁿ` ideals | README 145–148 | agrees |
| summary block: `g(p) < p^{5/8}` for `p > 3`, the bound `p^{2/3}` modulo `p²` for odd `p`, Grosswald under GRH; consumers; Layer 6 independent of the analytic layers | README 78, 829, 3480–3491 | agrees |
| title "ExplicitNumberFields: roadmap"; adds the roadmap | folder absent from the base; 3 files, 21 declarations, 0 removed | agrees |

### Counts

- **Source locator (1).** `lee2023ideals` lines 136 and 154 support the changed sentence: the zero of `ζ_K` at `0` has order `r₁ + r₂ − 1`, and it is absent exactly for `ℚ` and imaginary quadratic fields. `ramare2025` is uncertified.
- **Cross-roadmap citations.** `roadmaps grep` for a citation of ExplicitNumberFields 2.7: none on main or at an open head; the change touches no id, supplier or *Needs:* line.
- **Seeded sample.** No sampled target falls in the changed lines; the README flags no locator as unverified.
- **Gate.** Rerun at `5deaeb7`: every counter `0`, `OK`, exit code 0; the worker's gate also reports `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Dependency check.** `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`, exit code 0; no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean`: 16 warnings, all "declaration uses `sorry`", no error. The file is unchanged since `43f46f2`, so the `#check` comparison and the padding probe of that review stand.
- **Declared gaps.** The diff touches neither `## Exact supplier contracts` nor a `gap:` contract.

Overlap check: read ExplicitPrimeCounting, ExplicitZetaBounds, ExplicitMultiplicativeFunctions, ExplicitCharacterSumsAndSieves (open heads) and AnalyticNumberTheoryPartI, ZerosOfLFunctions, LFunctions (main); nothing shared: `scratch/overlaps.md` lists no dropped id, second copy or conflicting head, and the changed sentence names no object another roadmap owns.

Source independence: changed passages only; 1 passage compared with 1 source (`lee2023ideals` lines 136–154), none shared (longest common run 3 words); no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- `ramare2025` (uncertified): the route of 2.7 that the changed sentence belongs to was checked against `lee2023ideals` and by computation, not against Ramaré's text.

## Source issues

- none

## For the human reviewers

- **Scope.** 4.9 and 5.7 rest on a uniform Landau–Siegel gap whose sources are 2026 preprints (`guo2026`, `banks2026siegel`, `banks2026brauersiegel`, `openai2026siegel`, `kerr2026`, `green2026`; README 272); it enters as the hypothesis *UniformQuadraticZeroGap*.
- **Licence.** 1.1a cites `pntplus` (Apache 2.0, a public formalisation) for the digamma series; `digamma_series_remainder` in `Suggested.lean` states a remainder bound that file does not contain.
