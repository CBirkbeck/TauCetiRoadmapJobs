# Review of MathematicalStatisticsAsymptotic (pull request #2320 at 11c85f7)

**Verdict:** accepted

Incremental re-review of 8 changed lines since `fb780f9`. No finding: the folder is ready for a human's final approval.

## Previous findings

- R01 — repaired: the description now reads “From Mathlib: convergence in law and in measure, the central limit theorem, Cramér–Wold, Gaussian measures, tightness, sub-Gaussian variables, covering numbers and VC dimension, `klDiv` and kernels.”
- R02 — repaired: the description now reads “the finite-sample vocabulary, the information matrix, stochastic order symbols, Slutsky and contiguity definitions (its 2.4, 4.2, 4.3 and Layers 8–9).”

## Verified sound

| Statement | Instances tried | Computed, one side | Computed, other side | Result / change |
|---|---|---|---|---|
| 1.2 `tendstoInDistribution_inv_sqrt_smul_sum_sub_euclidean` (Suggested.lean:137; listed under “Supplied to later roadmaps”, consumed by Semiparametric and Nonparametric) | `k = 1`, Rademacher `±1`; `k = 2`, `X = (ξ, ξ)`; `X` constant `c`; `n = 0`; `k = 0` | Statistic: variance `1` for every `n ≥ 1`; `(T, T)/√n` on the diagonal; identically `0`; `(√0)⁻¹ • 0 = 0`; `0` | Limit `N(0, Cov X₀)`: `N(0, 1)`; `N(0, [[1,1],[1,1]])`, singular, on the diagonal; `N(0, 0) = δ₀`; one term, limit unaffected; `δ₀` | agree; the singular and zero covariances are covered by `multivariateGaussian` (`CFC.sqrt S`); no change |

The diff changes no statement; the rows for untouched statements stand as in the previous review, of `fb780f9`.

- Changed passage (README.md:32–36): three consumers named. MathematicalStatisticsNonparametric and MathematicalStatisticsSemiparametric are open and each has a `### From MathematicalStatisticsAsymptotic` contract (README.md:327 and :224 at their heads); MathematicalStatisticsHighDimensional at its open head does not name this roadmap anywhere; no other mention of HighDimensional remains in the folder.
- The sections the two open consumers cite (1.1, 1.2, 2.1–2.4, 3.3–3.5, 4.3, 5.6, 6.1, 6.2, 7.1–7.6, 8.2, 8.3, 9.1, 9.2) all exist at this head, and the names they use are among those of “Supplied to later roadmaps” (README.md:121–166).
- Description against the head: “Three later roadmaps … both open, and MathematicalStatisticsHigherOrderAndResampling, drafted but not yet submitted” and “MathematicalStatisticsHighDimensional … uses nothing from this roadmap” agree with README.md:32–36 and with the open heads; “adds the roadmap” (not on main, 4304 insertions), nine layers, “87 targets are admitted” (87 `theorem`, 87 `sorry` warnings) and the dependency list agree with the head. Nothing contradicted, nothing left unstated.
- Seeded sample: none of the fifteen sampled sections lies in the changed passage; 0 source locators rechecked. No file changed outside the folder.
- Library declarations opened at the pin: `Mathlib/Probability/Distributions/Gaussian/Multivariate.lean:166, :170` (`multivariateGaussian`, `multivariateGaussian_of_not_posSemidef`).
- Supplier order: `depcheck: 246 roadmaps, 2242 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate: the worker's gate at this head passed every check, build included. A local rerun against `origin/main` reports only `depcheck: NOT IN ORDER: MathematicalStatisticsAsymptotic (insert it after its last supplier)`, which the placement rule exempts.
- Elaboration of `TauCetiRoadmap/MathematicalStatisticsAsymptotic/Suggested.lean` with `lake env lean`: exit 0, no error, 87 warnings, all `sorry`. The file is unchanged since the earlier reviews, so their `#check @name` and padding results stand.

Overlap check: read MathematicalStatisticsNonparametric, MathematicalStatisticsSemiparametric, MathematicalStatisticsFoundations, MathematicalStatisticsHighDimensional, PointProcesses, StandardDistributions, RandomMatrices and OptimalTransport; the changed passage moves no object; ownership stands as in the earlier reviews (Foundations owns the shared statistical definitions and the fixed-space convergence algebra, StandardDistributions the Gaussian projection norm laws; Nonparametric and Semiparametric cite this roadmap for what they consume and carry labelled local copies); nothing newly shared.

Source independence: changed passages only; 1 passage compared with 0 sources (the changed sentence names roadmaps and cites no source), none shared; largest share vdv, 82 of 120 locators as counted in an earlier review; no layer added, removed or reordered, so the contents comparison was not repeated.

## Not verifiable

- vdv outside Chapter 20, vdvw, js §2.4 and huber: not readable legally in the earlier reviews; no changed passage cites them, and they were not fetched again.

## Source issues

- none

## For the human reviewers

- Not tested: vdv has the largest locator share; only Chapter 20 was readable in earlier rounds, and the whole-book contents comparison rests on an earlier review.
- Licence: TauCetiRoadmap/MathematicalStatisticsAsymptotic/README.md:2514 and :2541 cite lean-CKSD and Statlib (Apache 2.0), with the QMD definition shaped on `Statlib/Inference/QMD.lean`; neither repository was opened.
- Scope: MathematicalStatisticsHigherOrderAndResampling, named as a consumer and as owner of excluded material at README.md:33 and :108, exists neither on main nor among the open roadmap pull requests; the other two consumers are open.
- Source status: hjort_pollard is a 1993 preprint, arXiv:1107.3806, cited beside a book for §9.6 (README.md:2460, :2562).
