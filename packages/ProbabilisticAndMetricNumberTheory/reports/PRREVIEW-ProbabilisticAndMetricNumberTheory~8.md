# Review of ProbabilisticAndMetricNumberTheory (pull request #1421 at d311ebe)

**Verdict:** accepted

Incremental re-review: the folder is unchanged since the previous review, which read this same head (0 changed lines, no file changed outside the folder). The previous report had no findings, and this one has none.

## Previous findings

- none: the previous report (of d311ebe) listed no finding of its own; its two repaired items (the `leftRegular` contract at README:63, the PNTPlus `IsAdditive` comparison at README:104–106) are byte-identical at this head.

## Verified sound

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| `birkhoff_pointwise` (§4.1; named in the description) | Ω=Bool, uniform μ, f=1_{true}; T=swap, T=id; N=0 | swap from true: average ⌈N/2⌉/N→1/2, invariant sets {∅,Ω}, condExp=1/2; id: average f(x), all sets invariant, condExp=f; N=0 gives junk 0, limit unaffected | holds | — |
| `birkhoff_pointwise_ergodic` (§4.1) | same; T=swap vs T=id | swap ergodic: limit 1/2=∫f; id: limit f(x)∈{0,1}≠1/2, excluded since {true} is invariant of measure 1/2 | `Ergodic` needed and present | — |
| Supplier contract, AnalyticNumberTheoryPartI (README:69–73) | main at 4d169a9 | §§0.19, 0.21, 1.5, 3.18, 3.33, 3.45 at README lines 596, 616, 1050, 2481, 3147, 3410; §3.12a at 2395; five cited names each in its `Suggested.lean` | resolve | — |
| Supplier contract, AnalyticNumberTheoryPartII §5.3k (README:75–77) | main at 4d169a9 | `exists_unique_quotientMeasure` declared once in its `Suggested.lean`; §5.3k in README | resolves | — |

The rows for all other statements stand as in the previous review, of `d311ebe`.

- Gate, rerun on this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate on the same head adds `build=0`.
- Dependency check with `--movable`: `depcheck: 244 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. Every roadmap with a supplier heading in the README is on main (ArithmeticDirichletSeries under `Completed/`; AnalyticNumberTheoryPartI and PartII, RandomMatrices, DiophantineApproximationAndTranscendence, RepresentationTheory under `TauCetiRoadmap/`).
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 66 warnings, all `declaration uses 'sorry'`, no error. The file's sha256 is 3089e163…, the file the previous reviews probed; imports are `Mathlib` and two `TauCeti.*` modules.
- Cross-roadmap citations resolved this round: 9 section ids and 6 declaration names on main (table above; also RandomMatrices §3.2 at its README:619, DiophantineApproximationAndTranscendence §§0.5–0.6 at 367 and 440, ArithmeticDirichletSeries "Export contract" at 86), and ArithmeticDynamics §§2.6–2.7 at its open head (README:2492, 2548). The resolver lists no unresolved citation or Lean name.
- Library declarations opened at the pin: `birkhoffAverage` (Mathlib `Dynamics/BirkhoffSum/Average.lean`:46, with `birkhoffAverage_zero_apply` at :48); no almost-everywhere convergence theorem for `birkhoffAverage` in pinned Mathlib `Dynamics` or Tau Ceti `Dynamics`, so the description's "only in L² mean" stands.
- Pull request text against this head: the folder contents (README, `Suggested.lean`, `metadata.toml`), "adds a roadmap" (not on main), the supplier sentence (all suppliers on main), the validation counts (gate above) and the names in the summary (`birkhoff_pointwise`, `birkhoff_pointwise_ergodic` at `Suggested.lean`:465, 472; the bounded-partial-denominators target at README:6468; the Koymans–Pagano window estimate `restricted_squarefree_window` at :184) all agree. No sentence is contradicted and no removal or renumbering is left unstated.
- Overlaps: no other open pull request changes this roadmap; no cited id is dropped or defined only by an open revision; no second copy on main. Source locators checked against the text this round: 0 (no changed passage; the seeded sample falls in none).
- Overlap check: read Equidistribution, ClassicalErgodicTheory, SieveMethodsAndPrimePatterns, ArithmeticDynamics, MathematicalStatisticsAsymptotic (open) and AnalyticNumberTheoryPartI, StochasticCalculus, StandardDistributions (main). Shared objects, each with one owner: equidistribution on `UnitAddTorus d`, Weyl's criterion, `n•α+β`, star discrepancy, Koksma and Erdős–Turán — this roadmap §§2.1, 2.4, 2.5, 2.7 (Equidistribution cites them, its README:44–48, 188); pointwise Birkhoff, `IsStrongMixing`, finite-label entropy — this roadmap §§4.1–4.3, 4.6, 5.1a (ClassicalErgodicTheory README:56, 227 and ArithmeticDynamics README:71, 286 cite them); reciprocal-prime, Dirichlet-polynomial and Halász estimates — AnalyticNumberTheoryPartI (cited at README:69–73). Nothing is owned twice.
- Source independence: changed passages only — 0 passages compared with 0 sources (the diff is empty), none shared; the arrangement was not compared again, since no layer was added, removed or reordered.

## Not verifiable

- The waived sources BHV2007, Koukoulopoulos2019, Kubilius1964, RS1962, Falconer1990, PollingtonVaughan1990, Rogozin1961a, Rogozin1961b and IK2004 are cited by locator only; no changed text cites them.

## Source issues

- none

## For the human reviewers

- none
