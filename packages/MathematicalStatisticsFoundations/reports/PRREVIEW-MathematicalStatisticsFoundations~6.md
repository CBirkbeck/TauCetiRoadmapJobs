# Review of MathematicalStatisticsFoundations (pull request #2111 at d56ef99)

**Verdict:** accepted

Incremental re-review of 0 changed lines since d56ef99; this round reads the pull request's title and description against the head. No finding.

## Previous findings

- none: the review of d56ef99 had no finding to carry.

## Verified sound

### The pull request's title and description against the head

| Sentence of the description | What the head shows | Result |
|---|---|---|
| "adds the roadmap" | folder absent on the base; 2658 insertions, 0 deletions; no file changed outside the folder | agrees |
| scope "of Pfanzagl, Schervish, Brown and Ferguson"; five later areas; "Layer 9 is a closed list" | `README.md:21-28`, `:1461-1468` | agrees |
| "every headline carries a theorem-and-page locator" | all 52 theorem names of `Suggested.lean` occur in the README with a paged locator in their bullet or section; 49 name a numbered result, 3 a section or example (5.1, 7.4, 8.3) | agrees (see the remark below) |
| "Layers 8 and 9 do not depend on Layers 2–7" | the twelve `*Needs:*` lines of `README.md:1335-1712` name only 8.x, 9.1, Mathlib, Tau Ceti and Exchangeability Layer 8; `:1493` points to 2.4 without consuming it | agrees |
| "The boundary list names the rest of the finite-sample theory … and all asymptotic theory beyond Layer 8" | `README.md:1714-1754` | agrees |
| "no dependency on an open PR" | the four roadmaps cited are on main (three under `TauCetiRoadmap/`, Exchangeability under `Completed/`); dependency check: 0 problems; `Suggested.lean` imports only `Mathlib` and Tau Ceti modules | agrees |
| the Mathlib and Tau Ceti lists | each item is in `README.md:164-223` and resolves at the pins (bullets below) | agrees |
| "leaves … Gaussian integration by parts to RandomMatrices §2.5", the three other deferrals | `README.md:79-103`, `:225-251` | agrees |
| "adopts the names of the open Mathlib pull request #39791" | `README.md:125-127`, `:982-991`; `Suggested.lean:474-493` | agrees |
| "Most of Layers 1–7 is proved in … lean-CKSD, and Layers 8–9 come from its shared files. The README maps layers to files and lists what lean-CKSD admits or lacks" | `README.md:1756-1789` | agrees |
| "states every headline of Layers 1–8; its 52 targets are admitted" | 52 `theorem`s, 40 definitions, 52 `sorry` warnings; Layer 9 has no headline (`README.md:1470`) | agrees |

- Remark: the three headline locators that name a section or an example with its pages, not a numbered theorem, are those of `README.md:915-920`, `:1251-1260` and `:1383-1384`. They are locators in the README's own sense (`README.md:158-160`); no change is asked for.
- The description states no removal, renumbering or dropped supplier, and the change has none: 0 headings and 0 declarations removed.

### Adversarial table

The diff changes no statement; the row is for a statement the description cites (the Neyman–Pearson lemma in the pull request's names, `neyman_pearson`, `Suggested.lean:489-492`).

| Statement | Instances | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| 6.2 sum-of-errors form | two points, `P = (½, ½)`, `Q = (¼, ¾)`: `t = 1`; `t = 2`; `P = 0` | ratio `(½, 3/2)`; `t = 1`: error `1 + ¼T_a − ¼T_b`, minimum `¾` at `(0, 1)` = `npTest`; `t = 2`: error `2 − T_b`, minimum `1`, `npTest = (η, 1)` gives `1`; `P = 0`: `npTest = 1`, error `0 ≤ t∫(1 − T)dQ` | holds | none |

The rows of all other statements stand as in the previous review, of `d56ef99`.

### Counts

- Gate, rerun at this head: every counter `0`, `OK`; the worker's gate reports `build=0`.
- Dependency check: `depcheck: 245 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `Suggested.lean`: exit 0, 52 `declaration uses 'sorry'` warnings, the eight `#check` outputs, no error and no other warning.
- Library declarations opened at the pins: Mathlib `tvDist` (`Mathlib/MeasureTheory/Measure/TotalVariation/Defs.lean:62`), `bayesRisk` (`Mathlib/Probability/Decision/Risk/Defs.lean:54`), `TendstoInDistribution` (`Mathlib/MeasureTheory/Function/ConvergenceInDistribution.lean:64`), `TendstoInMeasure` (`Mathlib/MeasureTheory/Function/ConvergenceInMeasure.lean:57`), `Sion.exists_isSaddlePointOn` and `tendstoInDistribution_inv_sqrt_mul_sum_sub` (elaborated by `#check`); Tau Ceti `studentTMeasure` (`TauCeti/Probability/Distributions/StudentT/Basic.lean:182`), `orderStatistic` (`TauCeti/Data/Fin/Tuple/OrderStatistic.lean:53`), `empiricalFiniteMeasure` (`TauCeti/Probability/Process/EmpiricalMeasure.lean:58`), `etvDist_eq_two_mul_iSup_sub` (`TauCeti/MeasureTheory/Measure/TotalVariation.lean:74`), `sampleWithoutReplacement` (`TauCeti/Probability/PopulationSampling/Finite.lean:76`), `Measure.quantile` (by `#check`). Neither pinned library has a Neyman–Pearson declaration.
- Cross-roadmap citations: the citation resolver lists none unresolved; its three Lean leads are the two dotted 7.1 names declared in `Suggested.lean` and the implementation namespace `TauCeti.NeymanPearson`.
- Overlaps: no open pull request changes this roadmap, none drops an id it cites, and no second copy is on main. MathematicalStatisticsAsymptotic (open) cites this roadmap's 2.4, 4.2, 4.3, 8.1–8.6, 9.1 and 9.2 as its supplier and keeps local copies of `IsContiguous`, `uStatistic` and others in its own namespace, each naming this roadmap as owner; no fully qualified name is declared twice.
- Overlap check: read MathematicalStatisticsAsymptotic, PointProcesses, ProbabilisticAndMetricNumberTheory, StandardDistributions, MatrixSpectralStatistics, FiniteSamplingDiscrepancy; contiguity, the U-statistic, the stochastic algebra and the empirical objects shared with MathematicalStatisticsAsymptotic are owned here and cited there; the distributions and order-statistic laws are owned by StandardDistributions and cited here; nothing else shared.
- Source independence: changed passages only; the folder has no changed passage, so 0 passages compared with 0 sources; largest share Schervish, about 37 of about 126 locators; contents not compared this round (no layer added, removed or reordered), and Schervish's text was not read.

## Not verifiable

- Whether Mathlib pull request #39791 is still open: not looked up; the pinned Mathlib has no Neyman–Pearson declaration, which is all the roadmap relies on.
- "located the source theorems in local copies of the cited texts" and the account of which tools drafted what: statements about the author's process, with nothing in the head to compare.
- The textbook locators remain as the previous review recorded them: commercial books, not in the sources cache; only Sion (1958), Thm 3.4, p. 174 was read.

## Source issues

- none

## For the human reviewers

- **Licence.** `README.md:1756-1789` says Layers 1–9 are formalized in the author's repository `bjbraams/lean-CKSD`, from which the statements of `Suggested.lean` may be adapted; its licence was not read.
- **Licence.** `Suggested.lean:474-493` takes the names `npLikelihoodRatio`, `npTest`, `npSumError` and `neyman_pearson` from Mathlib pull request #39791, which is not in the pinned Mathlib; the statements were not compared with that pull request.
- **Not tested.** Schervish, *Theory of Statistics* (largest share, about 37 of 126 locators): neither its text nor its table of contents was read in this review or the previous one; wording and arrangement were not checked against it.
