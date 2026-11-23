# Review of MatrixSpectralStatistics (pull request #2611 at 6f785a3)
Folder: `TauCetiRoadmap/OperatorTheory/MatrixSpectralStatistics/`
**Verdict:** accepted

**Summary.** Accepted, with no finding. The 17 changed lines repair the two imprecise attributions of the previous review: MSS-B09 now names the Mathlib lemma that gives it, and the sentence on MSS-B16 gives subadditivity as its reason; both were checked against the declarations at the pins. The description was read against the head: two small corrections (it does not say which sections of main's README were absorbed or dropped, and its list of changed statements leaves out the scatter items), and one format note carried over, none blocking. The human reviewers decide whether a roadmap with nothing left to build is complete, and look at two licence lines.

## C01 — The description does not say which sections of main's README are gone, and "Nothing from main is deleted" is wider than what the head shows

"The record is kept" ends: "Nothing from main is deleted or renumbered." That holds for the Parts, milestones, items MSS-A01 to MSS-C23 and labels D1–D4, which is what the paragraph is about. It does not hold for the README as a whole: main's sections "Introduction", "Notation and terminology", "What Mathlib already has (consume)", "What is missing (build here)", "Ordering" and "Definitions" no longer exist as sections, "Acknowledgements" is now "Provenance", and two passages of main have no counterpart at the head: the line "Suggested homes: `TauCeti/LinearAlgebra/Matrix/`, …" of the Introduction, and the second paragraph of "Ordering" (the order of the items inside Parts B and C), which the *Needs* lines replace.

A sentence under "What changes in form" would cover it, for example: "Main's Introduction, Notation, 'What Mathlib already has', 'What is missing', Ordering and Definitions sections are absorbed into the overview, Conventions, the Dependencies of each Part and the supplier contracts; Acknowledgements is renamed Provenance; the 'Suggested homes' line is dropped." The last sentence of "The record is kept" would then read "No Part, milestone, item or label of main is deleted or renumbered."

## C02 — The list of statements whose content changed leaves out the scatter items and the index type of the sample-mean items

"Statements whose content changed" is written as the list of such changes, and two are missing. On main MSS-C09 defines the centered scatter as "a bounded self-map of the ambient Hilbert space"; at the head MSS-C09 to MSS-C14 are stated for "an inner product space over `𝕜` with `[RCLike 𝕜]`, not necessarily complete" (README, opening of the scatter items in §C2, line 545), which is what the pinned `TauCeti.centeredScatter` assumes (`TauCeti/Analysis/InnerProductSpace/CenteredScatter.lean`, line 59: no `CompleteSpace`). And MSS-C02 to MSS-C05, stated on main "for `0 < r`", are at the head stated for a finite nonempty index type `ι` with `r = card ι` (§C1, line 475), as in `TauCeti.integral_finiteMean_sub_sq`.

Two more bullets would complete the list: "MSS-C09 to MSS-C14 hold in any inner product space over `ℝ` or `ℂ`, complete or not" and "MSS-C02 to MSS-C05 are indexed by any finite nonempty type; `Fin r` with `0 < r` is the special case".

## N01 — The exclusion of matrix Bernstein and Chernoff inequalities does not say where they are stated

In Scope and ownership ("Outside this roadmap", lines 776–778), adding "(RandomMatrices §2.6)" would tell the reader where they live. Carried over from the previous review.

## Questions for the author

- MSS-B20 cites Horn and Johnson, Theorem 4.3.1, for the perturbation bound `|λ_k(Â) − λ_k(A)| ≤ ‖Â − A‖`. Is Theorem 4.3.1 of the second edition the additive form `λ_{i+j}(A + B) ≤ λ_i(A) + λ_{n−j}(B)`, with the perturbation bound a corollary later in §4.3? The book could not be read, so the numbering was not checked; if so, the corollary's number would be the exact locator. (Carried over; the change does not touch it.)

## Previous findings

The previous review, of `f88116b`, had no finding (no R-numbered remark). Its small corrections and format note at this head:

- C01 (`continuousOn_cfc` for MSS-B09) — repaired: "`ContinuousOn.cfc_of_mem_nhdsSet` with all of `ℝ` as the neighbourhood of the spectra" in MSS-B09, the *Needs* line of §B2 and the supplier contracts (lines 335, 348, 803); the paraphrase of its hypotheses agrees with the lemma.
- C02 (reason for MSS-B16) — repaired: "by subadditivity (MSS-B16) and monotonicity (MSS-B17, MSS-B18) of the measure on all subsets" (lines 439–440).
- C03 (description, Check at `n = 0`) — repaired: the description now reads "the add-one mean identity at `n = 0` and the coefficient `n/(n + 1)` of the add-one scatter identity".
- N01 — not repaired; written again above as N01.

## Verified sound

| Statement | Instances tried | Values computed (README side / library or direct side) | Result |
| --- | --- | --- | --- |
| MSS-B09 continuity on Hermitian matrices, as an instance of `ContinuousOn.cfc_of_mem_nhdsSet` | `s = univ`, `t` = Hermitian matrices, `a = id`; `A_k = diag(k, 0)`; `[[1,t],[0,1]]`, t → 0 | `univ ∈ 𝓝ˢ` of any set; `a` continuous, `p (a x)` = self-adjoint: all hypotheses met / spectra `{0, k}` unbounded, so no compact `s` for `continuousOn_cfc`; `cfc id` = 0 for t ≠ 0, `I` at 0 | agrees; `Continuity.lean` line 344, used at `FunctionalCalculus.lean` line 246 |
| MSS-B10 measurability (sampled; its *Needs* line changed) | `[[0,1],[0,0]]`; elaborated type | value 0 off the Hermitian set (closed), continuous on it by MSS-B09 / `Measurable (cfc f)` for `Continuous f`, no hypothesis on the matrix | agrees |
| MSS-B16 complement bound (sampled; its stated reason changed) | Ω = {a, b}, σ-algebra {∅, Ω}, μ Ω = 1, `s = {a}` | `μ s = μ sᶜ = 1` (outer values), `1 − 1 = 0 ≤ 1`; `s ⊄ sᶜ`, so no inclusion: monotonicity gives nothing; `1 = μ(s ∪ sᶜ) ≤ 1 + 1` / `measure_union_le` in the proof | agrees; `Typeclasses/Probability.lean` lines 56–64 |
| MSS-C09 (touched by C02) | binders read at the pin | README: inner product space, not necessarily complete / `[NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [Fintype ι]`, no `CompleteSpace`; main: "ambient Hilbert space" | agrees with the head; description silent |

The rows for the untouched statements stand as in the previous review, of `f88116b`.

- Source locators checked against the text: 0 new; the diff changes no sourced passage. The seeded sample falls in the changed passages at MSS-B10 and MSS-B16 only, both checked against the library declarations above (neither carries a source locator).
- Library declarations opened at the pins: `continuousOn_cfc` (`Mathlib/Analysis/CStarAlgebra/ContinuousFunctionalCalculus/Continuity.lean`, line 234), `ContinuousOn.cfc_of_mem_nhdsSet` (same file, line 344), `TauCeti.continuousOn_matrix_cfc` (`TauCeti/Analysis/Matrix/FunctionalCalculus.lean`, line 238), `MeasureTheory.Measure.one_sub_measure_compl_le` (`TauCeti/MeasureTheory/Measure/Typeclasses/Probability.lean`, line 60), `TauCeti.centeredScatter` (`TauCeti/Analysis/InnerProductSpace/CenteredScatter.lean`, line 64), `TauCeti.integral_finiteMean_sub_sq` (`TauCeti/Probability/Moments/SampleMean.lean`, line 111).
- Record against the README at the merge base (identical to main's): no layer, milestone, item or label removed or renumbered by the change; the diff touches no id.
- Description read sentence by sentence against the head and against main's README: the Checks, worked examples, consumer, MSS-B20, the 21 listed statement changes and the seven `#check` lines all agree with the head; the two omissions are C01 and C02.
- Cross-roadmap citations: none added or changed by the diff; RandomMatrices §2.6 (N01) found on main, `README.md` line 385.
- Elaboration: `Suggested.lean` elaborates with no error and no warning; seven `#check` lines, no `sorry`, no `set_option`, no declaration, so the one-tactic probe has no subject.
- Automatic checks: all passed on this head. Dependency check output: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.

Overlap check: read RandomMatrices, PolarDecomposition, MathematicalStatisticsHighDimensional (main), KernelsAndSpectralMethods, SpectralSubspacePerturbation, OperatorMonotoneFunctionsAndMatrixMeans (open); nothing shared. The change adds no object; no open pull request changes this roadmap or drops an id it cites, and it drops none.

Source independence: changed passages only; 3 passages compared (MSS-B09's attribution, the sentence after MSS-B19, the supplier-contract paraphrase of `ContinuousOn.cfc_of_mem_nhdsSet`) with 0 sources, since none cites a source; the paraphrase was set beside the Mathlib docstring and is in the roadmap's own words; largest share Vershynin2018, 7 of 12 locators; contents not compared again (no layer added, removed or reordered). Horn and Johnson, Bhatia, and Cox and Cox could not be read.

Research link: Part A is the Gram factorization behind classical multidimensional scaling (Cox and Cox 2001, per the README); Part C is the elementary counterpart of the covariance estimation theorems of Vershynin 2018 (Theorems 4.7.1, 5.6.1, read); its events are where the Yu–Wang–Samworth `sin Θ` bound of SpectralSubspacePerturbation applies, per the README.

## Not verifiable

- Horn and Johnson, *Matrix Analysis*, 2nd ed. (2013), §7.2 (MSS-A07) and Theorem 4.3.1 (MSS-B20): a commercially published book, no legal copy at hand; untouched by the change.
- Bhatia, *Matrix Analysis* (1997), Corollary III.2.6 (MSS-B20, MSS-B14): the same.
- Cox and Cox, *Multidimensional Scaling*, 2nd ed. (2001), §2.2–2.3 (MSS-A07): the same.

## Source issues

- none

## For the human reviewers

- Scope: every item except MSS-B01 and MSS-B02 (Mathlib) names a Tau Ceti declaration that proves it at the pin, and `Suggested.lean` has no `sorry`; nothing is left to build. Whether the roadmap moves to `Completed/` is yours to decide.
- Scope: the headline constant `4d⁴v/(rc²)` comes from a Chebyshev and union-bound route that no cited source states; Vershynin2018 Theorems 4.7.1 and 5.6.1 give sharper bounds under stronger hypotheses, as README lines 693–698 say.
- Licence: `Suggested.lean` line 2 keeps "Copyright (c) 2026 Kitware, Inc." although this pull request replaces the file's body.
- Licence: README Provenance (lines 743–746) says Tau Ceti modules were adapted from the Apache-2.0 AIQ DKPS formalization (Kitware). That repository's licence was not opened.
- Not tested: Horn and Johnson, Bhatia, and Cox and Cox could not be read legally; wording was not compared with them.
