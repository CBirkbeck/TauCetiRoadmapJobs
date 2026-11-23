# Review of MatrixSpectralStatistics (pull request #2611 at f88116b)
Folder: `TauCetiRoadmap/OperatorTheory/MatrixSpectralStatistics/`
**Verdict:** accepted

**Summary.** Accepted, with no finding. Every item of the README on main (MSS-A01 to MSS-C23, milestones A1–C4, D1–D4) is kept under its id with its statement, each statement agrees with the Tau Ceti or Mathlib declaration it names at the pins, and every Check and worked example was recomputed and holds. There are three small corrections (two imprecise attributions in Part B, one phrase of the description) and one format note, none blocking. The human reviewers decide whether a roadmap with nothing left to build is complete, and look at two licence lines.

## C01 — Mathlib's `continuousOn_cfc` does not by itself give MSS-B09

MSS-B09 says the continuity of `A ↦ cfc h A` on the Hermitian matrices "is Mathlib's continuity of the functional calculus in its operator variable, `continuousOn_cfc`" (README lines 334–336; the name recurs in the *Needs* line 348 and in the supplier contracts, lines 802–803). At the pin, `continuousOn_cfc` (`Mathlib/Analysis/CStarAlgebra/ContinuousFunctionalCalculus/Continuity.lean`, line 234) is continuity on the set of elements whose spectrum lies in one fixed compact set `s`; the Hermitian matrices have no common compact set of spectra, so a reader who applies the cited lemma gets a weaker, local statement. The declaration that gives MSS-B09 as written is `ContinuousOn.cfc_of_mem_nhdsSet` (same file, line 344), which is what `TauCeti.continuousOn_matrix_cfc` uses (`TauCeti/Analysis/Matrix/FunctionalCalculus.lean`, lines 238–247). Naming that lemma, beside or in place of `continuousOn_cfc`, in the three places would make the pointer exact.

## C02 — The complement bound MSS-B16 is subadditivity, not monotonicity

The sentence after MSS-B19 (README lines 439–440) says MSS-B16, MSS-B17 and MSS-B18 need no measurability "by monotonicity of the measure on all subsets". That is the reason for MSS-B17 and MSS-B18. MSS-B16, `1 − μ sᶜ ≤ μ s`, compares a set with its complement and no inclusion is available: it holds because `1 = μ (s ∪ sᶜ) ≤ μ s + μ sᶜ`, subadditivity on arbitrary sets, as the docstring and proof of `MeasureTheory.Measure.one_sub_measure_compl_le` say (`TauCeti/MeasureTheory/Measure/Typeclasses/Probability.lean`, lines 56–64). "…by monotonicity (MSS-B17, MSS-B18) and subadditivity (MSS-B16) of the measure on all subsets" would be right.

## C03 — The description names a Check the README does not have

Under "What it adds" the description lists a Check of "the add-one scatter identity at `n = 0`". The Check at `n = 0` (README lines 584–586) is of the add-one *mean* identity MSS-C08; the add-one scatter identity MSS-C10 is checked at `n = 2`, on `z = (0, 2)`, `y = 4` (lines 587–589). The text that would be right: "the add-one mean identity at `n = 0` and the coefficient `n/(n + 1)` of the add-one scatter identity".

## N01 — The exclusion of matrix Bernstein and Chernoff inequalities does not say where they are stated

In Scope and ownership ("Outside this roadmap", lines 776–778), adding "(RandomMatrices §2.6)" would tell the reader where they live: RandomMatrices §2.6 on main states `matrix_bernstein` and the matrix Chernoff bounds. Carried over from the previous review.

## Questions for the author

- MSS-B20 cites Horn and Johnson, Theorem 4.3.1, for the perturbation bound `|λ_k(Â) − λ_k(A)| ≤ ‖Â − A‖`. Is Theorem 4.3.1 of the second edition the additive form `λ_{i+j}(A + B) ≤ λ_i(A) + λ_{n−j}(B)`, with the perturbation bound a corollary later in §4.3? The book is not in the sources cache, so the numbering could not be checked; if so, the corollary's number would be the exact locator.

## Previous findings

The previous review, of `4e8a8e0`, had no finding. Since then the README was rewritten onto main's labels (989 lines changed), so its small corrections were re-examined on this head.

- C01 (former-label table) — no longer applies: the head keeps main's ids MSS-A01 to MSS-C23, Parts A–C and milestones A1–C4, so no mapping is needed; KernelsAndSpectralMethods and RandomProjectionsAndSketching cite those ids.
- C02 (consumer) — repaired: "Downstream consumers" names KernelsAndSpectralMethods §5.1 with MSS-A07 and MSS-A09; Scope says the `sin Θ` theorems "can be applied on the events of §C4".
- C03 (`Suggested.lean` docstring) — repaired: "pins, by `#check`, the Tau Ceti declarations that prove them … A `#check` does not compare a declaration's statement with the README's".
- C04 (description) — repaired for the earlier points; one new slip, C03 above.
- C05 (source locators) — repaired: Vershynin at Proposition 1.2.4, Corollary 1.2.5 (p. 8), (1.5) (p. 9), §3.2 (p. 45), §4.7 (p. 99), Theorems 4.7.1 and 5.6.1; Horn and Johnson at §7.2.
- N01 — not repaired; written again above as N01.

## Verified sound

| Statement | Instances tried | Values computed (README side / library, source or direct side) | Result |
| --- | --- | --- | --- |
| MSS-A03 rank ≤ r iff factors through `Fin r` | `M = 0`, r = 0; `[[1,2],[2,4]]` over ℚ, r = 0, 1 | zero: empty factors, product 0; rank 1: `[[1],[2]]·[[1,2]]` = M, no `Fin 0` factor / `Matrix.rank_le_iff_exists_eq_mul`, `Rank.lean` line 321 | agrees |
| MSS-A04 spectral expansion | `B = [[1,i],[−i,1]]` | det 0, trace 2: eigenvalues 2, 0; `B 0 1 = 2·(1/√2)·conj(−i/√2) = i`; without conj `−i` / `Spectrum.lean` line 81, `star (U j k)` | agrees |
| MSS-A05 PSD iff `AᴴA`, square | `[[1,2],[2,1]]`; `n` empty | eigenvalues 3, −1, not PSD, no factor; empty: `0 = 0` / `GramFactorization.lean` line 52 | agrees |
| MSS-A07 (headline) Gram characterization | `[[1,1],[1,1]]`, m = `Fin 1`, `Fin 0`; `m` empty | `[[1,1]]ᴴ[[1,1]]` = B; no-row product 0 ≠ B; converse rank `(AᴴA) = rank A ≤ card m` / line 78 | agrees |
| MSS-A08 / MSS-A09 (headline) uniqueness | zero 2×2 through `Fin 1`; `A = diag(1,0)`; points 0,1,2 | `L g = [[g],[0]] ≠ 0 = L'`: rank hypothesis needed; `diag(1,u)A = A`; `AᵀA = [[0,0,0],[0,1,2],[0,2,4]]`, factors ±A / `Factorization.lean` line 44, `Uniqueness.lean` line 41 | agrees |
| MSS-B02 Borel structure | hypotheses read at the pin | `[Countable m] [Countable n] [SecondCountableTopology α] [BorelSpace α]` / `Mathlib/Analysis/Matrix/MeasurableSpace.lean` lines 58–59; `measurable_iff` line 40, no countability | agrees |
| MSS-B03, MSS-B04 (headline), MSS-B20 | all-ones `J`, `x = (1,…,1)`; `A = 0`, `Â = εJ` | `‖Jx‖ = n‖x‖`, so `√n` fails for n ≥ 2; `λ_0(εJ) = nε`: bound attained / `EntrywiseOpNorm.lean` lines 43, 119; `Eigenvalues/Basic.lean` lines 72, 104 | agrees |
| MSS-B08 vanishing tail and converse | `diag(1,−1,0)` (not PSD); d ≥ n | rank 2, sorted `(1,0,−1)`, index 2 nonzero: PSD needed; d ≥ n vacuous / `Basic.lean` lines 173, 189, iff for every `d : ℕ` | agrees |
| MSS-B09 continuity; MSS-B10, MSS-B12 (headlines) | `[[1,t],[0,1]]`, t → 0; `diag(t,−1)`, c = 0 | `cfc id` = 0 for t ≠ 0, `I` at 0: not continuous off Hermitian; projector 0 for t < 0, `diag(1,0)` at 0 / `FunctionalCalculus.lean` lines 238, 259, 283 (closed Ω) | agrees; C01 on the pointer |
| MSS-B14 threshold stability | `A = diag(1,0)`, c = 1; `diag(3,1,1)`, c = 2, ε < 1/3 | gap 0, `diag(1−t,0)` loses the eigenvalue; gap 1, `‖Â−A‖ ≤ 3ε < 1`, count 1 / `Basic.lean` lines 121, 137: `δ ≤ |λ_i − c|`, `‖A−B‖ < δ` | agrees |
| MSS-B16 complement bound | arbitrary `s` | `1 = μ(s ∪ sᶜ) ≤ μ s + μ sᶜ` / `Typeclasses/Probability.lean` line 60 | agrees; C02 on the stated reason |
| MSS-B19 high-probability convergence | hypotheses read | probability measure, pseudometric, null-measurable `{dist ≤ rate}`, probabilities → 1 / `ConvergenceInMeasure.lean` lines 105–110, same four | agrees |
| MSS-C04, MSS-C05 sample-mean forms | r = 1; fair signs `Z₁, Z₂, Z₁Z₂`; constants 1, −1 | r = 1: γ; `∫((Z₁+Z₂+Z₃)/3)² = 1/3 = 3⁻²·3`; unequal means: 0 against 1/2 / `SampleMean.lean` lines 121, 134: `γ / card ι`, `[Nonempty ι]` | agrees |
| MSS-C08, MSS-C10 add-one identities | n = 0; `z = (0,2)`, `y = 4` | `0 + 1⁻¹(y − 0) = y`; `S(z) = 2`, new scatter 8 = `2 + (2/3)·9`; coefficient 1 gives 11 / `FiniteMean.lean` line 89, `CenteredScatter.lean` line 119 | agrees |
| MSS-C12 positivity of scatter | `z = (0,2)` in ℝ; empty family | `S = 2 ≥ 0`; empty sum 0 / `CenteredScatter.lean` line 107, no completeness assumed | agrees |
| MSS-C15 empirical second moment | `(1,1), (1,−1)`; `v = (1,i)` | `M̂ = I`, centered version `diag(0,1)`; `vvᴴ = [[1,−i],[i,1]]` Hermitian, `vvᵀ` not / `SampleSecondMoment.lean` lines 50, 60; Vershynin2018 lines 1780–1782, 3775–3786 | agrees |
| MSS-C17 per-entry bound | r = 1; hypotheses read | r = 1: bound `v`; `MemLp 2`, common mean `M k l`, pairwise independent, each moment ≤ v ⇒ `≤ v / card ι` / `MatrixConcentration.lean` lines 211–216 | agrees |
| MSS-C19 measurability of the event | hypotheses read; η ≤ 0 | countable `m`, `n`, seminormed group, opens measurable, measurable subtraction, every real η / lines 107–110, same | agrees |
| MSS-C20 (headline) eigenvalue concentration | elaborated type read | `1 − ofReal(card n² · v/η²) ≤ μ{∀k, |λ_k(S) − λ_k(A)| ≤ card n · η}`, no measurability of entries / line 144 | agrees |
| MSS-C23 (headline) eigenvalue floor | d = 0; `v = 1, d = 2, c = 1, r = 640` | `d²(v/r)/(c/2d)² = 4d⁴v/(rc²)`; `4·16/640 = 0.1`, probability 0.9; d = 0 event certain / line 228, elaborated type | agrees |

- Source locators checked against the text: 7 (Vershynin2018 Proposition 1.2.4 and Corollary 1.2.5 at lines 437–453, printed p. 8; (1.5) at lines 465–469, p. 9; §3.2 at line 1780, p. 45; §4.7 at lines 3765–3786, p. 99; Theorem 4.7.1 at line 3798, p. 99; Theorem 5.6.1 at line 4895, p. 129); all found where cited.
- Seeded sample: all 15 targets checked. Of them only MSS-A07 and MSS-B14 (books not readable) and MSS-C15 (Vershynin, read) carry a source locator; the other twelve were checked against the declaration named on their *In Tau Ceti* line or in Mathlib.
- Library declarations opened at the pins: 66 Tau Ceti declarations named in the README (61 on *In Tau Ceti* lines), each found and its statement compared with its item; 16 Mathlib declarations of the supplier contracts found (among them `IndepFun.integral_bilin`, `Probability/Independence/Integration.lean` line 314; `rankOne`, `Analysis/InnerProductSpace/LinearMap.lean` line 303).
- Record against the README at the merge base: MSS-A01–A09, B01–B14, B16–B19, C01–C23, milestones A1–A3, B1–B4, C1–C4, D1–D4 and the three acceptance paragraphs are all present under their ids with statements; MSS-B20 is new; nothing removed or renumbered.
- Cross-roadmap citations resolved: PolarDecomposition, Part A, PD-A53 (main, `README.md` line 260, Milestone A7); KernelsAndSpectralMethods §5.1 (open, `README.md` lines 388–402); SpectralSubspacePerturbation Part D (main, lines 407–456).
- Elaboration: `Suggested.lean` elaborates with no error and no warning; seven `#check` lines, no `sorry`, no `set_option`, no declaration; the seven printed types were compared with the headline statements, no difference. No sorried theorem exists, so the one-tactic probe has no subject.
- Automatic checks: all passed on this head. Dependency check output: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.

Overlap check: read RandomMatrices, PolarDecomposition, MathematicalStatisticsHighDimensional (main), KernelsAndSpectralMethods, LinearAutoencodersAndPCA, LovaszThetaFunction (open); nothing shared. Weyl's bound for operators: PolarDecomposition PD-A53, cited here; RandomMatrices §1.2 and the three open roadmaps consume the Tau Ceti declarations of Parts A–C and own none of them. Ownership was searched in the open pull requests by object (rank and Gram factorization, threshold projector, centered scatter, measurability of `cfc`).

Source independence: 6 passages compared with 1 source (README lines 478–482, 486–489, 595–601, 693–698, the Part C opening and the first Check of §C3 against Vershynin2018 lines 437–455, 461–470, 1780–1791, 3767–3797, 3798–3834, 4895–4900), none shared; largest share Vershynin2018, 7 of 12 locators; contents compared with Vershynin2018: independent (it is cited only in Part C, from its Chapters 1, 3, 4 and 5, and no Part corresponds to a chapter). Horn and Johnson, Bhatia, and Cox and Cox could not be read.

Research link: Part A is the Gram factorization behind classical multidimensional scaling (Cox and Cox 2001, per the README); Part C is the elementary counterpart of the covariance estimation theorems of Vershynin 2018 (Theorems 4.7.1, 5.6.1, read); its events are where the Yu–Wang–Samworth `sin Θ` bound of SpectralSubspacePerturbation applies, per the README.

## Not verifiable

- Horn and Johnson, *Matrix Analysis*, 2nd ed. (2013), §7.2 (MSS-A07) and Theorem 4.3.1 (MSS-B20): not in the sources cache or its manifest; a commercially published book, no legal copy at hand.
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
