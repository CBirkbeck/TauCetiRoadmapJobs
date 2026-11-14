# Review of MathematicalStatisticsAsymptotic (pull request #2320 at fb780f9)

**Verdict:** accepted

Incremental re-review of the 11 lines changed since `d558329`. No findings.

## Previous findings

- R01 — repaired: README.md:32–34 now reads “It supplies its empirical-process toolkit and its limits of experiments to MathematicalStatisticsSemiparametric, MathematicalStatisticsHigherOrderAndResampling, MathematicalStatisticsNonparametric and MathematicalStatisticsHighDimensional.” No submission status remains in the README.

## Verified sound

| Statement | Instances tried | Computed, one side | Computed, other side | Result / change |
|---|---|---|---|---|
| 3.4 `isBrownianBridgeLaw_map_comp_cdf` (empirical-process toolkit cited by the changed paragraph; Suggested.lean:492) | `P = δ₀`, any `s, t`; `P` uniform on `[0,1]`, `s = 1/4`, `t = 1/2` | class covariance `F(min(s,t)) − F(s)F(t)`: `0` for `δ₀`; `1/4 − 1/8 = 1/8` | bridge covariance `min(F(s),F(t)) − F(s)F(t)`: `0` since `F ∈ {0,1}`; `1/8` | agree; no change |

The diff changes no statement; the rows for untouched statements stand as in the previous review, of `d558329`.

- Changed passage: README.md:32–36 only (5 insertions, 6 deletions); `Suggested.lean` and `metadata.toml` unchanged; no file changed outside the folder.
- Names in the changed passage: the four consumer names agree with their other uses at README.md:108, :110, :114, :1055, :1294, :2038, :2126, :2486; the anchor `#supplied-to-later-roadmaps` resolves to the heading at README.md:121. None of the four is cited as a supplier.
- Seeded sample: no sampled target falls in the changed passage, which carries no source locator; 0 locators rechecked.
- Pull request text against this head: “nine layers” matches Layers 1–9; “its 87 targets are admitted” matches 87 `theorem` declarations, each with `sorry`; the supplier paragraph and the dependency list match README.md:32–36 and the supplier contracts. The submission status of the four consumers now stands in the description only.
- Supplier order: `depcheck: 244 roadmaps, 2198 edges, 0 problem(s)` on the candidate order; no UPWARD or CYCLE line. No supplier added or dropped.
- Gate: the worker's gate at this head passed every check (build included). A local rerun against `origin/main` reports only `depcheck: NOT IN ORDER: MathematicalStatisticsAsymptotic (insert it after its last supplier)`, which the placement rule exempts.
- Elaboration of `TauCetiRoadmap/MathematicalStatisticsAsymptotic/Suggested.lean` with `lake env lean`: no error, `sorry` the only warning. The file is byte-identical to the one the previous review probed, so its `#check @name` and padding results stand.
- Overlaps: no other open pull request changes this roadmap; no cited id dropped; no second copy on main; 0 cross-roadmap citations unresolved. The 4 Lean-name leads are this roadmap's own declarations, present in `Suggested.lean`.

Overlap check: read MathematicalStatisticsFoundations, ProbabilisticAndMetricNumberTheory, PointProcesses, ClassicalErgodicTheory, StandardDistributions, RandomMatrices and OptimalTransport; the changed passage states no object, and the ownership recorded in the previous review is unchanged (Foundations owns the shared statistical definitions and fixed-space convergence algebra, StandardDistributions the Gaussian projection norm laws); nothing newly shared.

Source independence: changed passages only; 1 passage compared with 0 sources (it names consumer roadmaps and cites no source), none shared; largest share vdv, 82 of 120 locators as counted in the previous review; no layer added, removed or reordered, so the contents comparison was not repeated.

## Not verifiable

- vdv outside Chapter 20, vdvw, js §2.4 and huber: not readable legally in the previous review; no changed passage cites them, and they were not fetched again.

## Source issues

- none

## For the human reviewers

- Not tested: vdv has the largest locator share; only Chapter 20 was readable in earlier rounds, and the whole-book contents comparison rests on the earlier review.
- Licence: TauCetiRoadmap/MathematicalStatisticsAsymptotic/README.md:2514 and :2541 cite lean-CKSD and Statlib (Apache 2.0), with the QMD definition adapted from `Statlib/Inference/QMD.lean`; neither repository was opened.
- Scope: the four roadmaps named as consumers and as owners of excluded material at README.md:32–34 and :108–114 exist neither on main nor among the open roadmap pull requests.
- Source status: hjort_pollard is a 1993 preprint, arXiv:1107.3806, cited beside a book for §9.6 (README.md:2460, :2562).
