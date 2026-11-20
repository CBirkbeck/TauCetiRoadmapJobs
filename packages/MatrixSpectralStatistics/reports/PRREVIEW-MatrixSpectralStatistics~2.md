# Review of MatrixSpectralStatistics (pull request #2611 at 7201685)
Folder: `TauCetiRoadmap/OperatorTheory/MatrixSpectralStatistics/`
**Verdict:** accepted

**Summary.** Accepted, with no finding. Every statement of Layers 1–3 has the hypotheses and generality of the pinned Tau Ceti or Mathlib declaration it names, and every Check and worked example recomputes to the stated value. The head is the one the previous review read, so its five small corrections and one format note all stand unrepaired; none blocks: the dropped `MSS-` labels that an open roadmap still cites, a consumer that does not consume, a docstring that claims more than `#check` tests, three sentences of the description, and source citations without locators. The human reviewers decide whether a roadmap with nothing left to build is complete, and look at two licence lines.

## C01 — The README drops the `MSS-` labels and Parts A–C that open roadmaps cite, and gives no mapping from the former numbering

When this merges, another roadmap's supplier citations point at labels that no longer exist. KernelsAndSpectralMethods (#2516) cites "MSS-A05 to MSS-A09" at its `README.md` line 76, MSS-A05 to MSS-A07 and MSS-A09 in its supplier contract (lines 241–244) and in the *Needs:* line of its 5.1 (line 581), and "MatrixSpectralStatistics Part A" at line 676. RandomProjectionsAndSketching (#2572) names "Part C" at its `README.md` line 523. At this head the README has no `MSS-` label and no Part; the mapping is only in the pull-request description.

The smallest repair is a table in the README whose header names the former labels, with one sentence that Parts A, B and C are Layers 1, 2 and 3:

| Former labels | Section |
| --- | --- |
| MSS-A01–A03 | §1.1 |
| MSS-A04–A07 | §1.2 |
| MSS-A08–A09 | §1.3 |
| MSS-B01–B08 | §2.1 |
| MSS-B09–B10 | §2.2 |
| MSS-B11–B14 | §2.3 |
| MSS-B16–B19 | §2.4 |
| MSS-C01–C05 | §3.1 |
| MSS-C06–C14 | §3.2 |
| MSS-C15–C17 | §3.3 |
| MSS-C18–C23 | §3.4 |

## C02 — SpectralSubspacePerturbation is presented as a consumer of this roadmap, but it does not cite it

A reader concludes that SpectralSubspacePerturbation depends on Layers 2 and 3. Three places say so: "It feeds SpectralSubspacePerturbation" in the overview (lines 31–34), the single entry of Downstream consumers (lines 596–599), and "SpectralSubspacePerturbation, which combines them with Layers 2 and 3" in Scope and ownership (lines 634–635). On main, `OperatorTheory/SpectralSubspacePerturbation/README.md` never mentions MatrixSpectralStatistics, its SSP-D16 (line 453) is a deterministic bound, and the family index `OperatorTheory/README.md` (line 84) lists its prerequisites as PolarDecomposition, Majorization, PrincipalAngles and SelfAdjointSpectralTheory.

Saying that the two are combined, not that one feeds the other, makes all three true: for instance "Applied on the high-probability events of §3.4, the population-gap `sin Θ` theorem of SpectralSubspacePerturbation (SSP-D16) turns …", and in the scope paragraph "they can be applied on the events of §3.4". The roadmap that does cite this one is KernelsAndSpectralMethods (C01), which could be named under Downstream consumers.

## C03 — The `Suggested.lean` docstring says the file fails to build if the library stops providing the headline theorems "in this form", but a `#check` fails only when a name disappears

A reader takes the file as a test of the four headline statements; it tests that seven names exist. `#check @c` prints the type of `c` and compares it with nothing, so a hypothesis added to `TauCeti.measurable_matrix_cfc`, or a weaker constant in `TauCeti.one_sub_le_measure_forall_half_le_eigenvalues₀_sampleSecondMoment`, leaves the file building (docstring, lines 32–35). The same paragraph opens "It states the roadmap's headline theorems" and then says the file "restates none of them".

The smallest repair is the wording: the file "pins, by `#check`, the Tau Ceti declarations that prove them; it fails to build if one is renamed or removed". If a test of the statements is wanted, each line would become `example : <the README's statement> := @<declaration>`, which the kernel checks.

## C04 — Three sentences of the description do not match the head

- "No other roadmap cites the MSS labels." KernelsAndSpectralMethods and RandomProjectionsAndSketching do (C01). Right would be: "KernelsAndSpectralMethods and RandomProjectionsAndSketching, both open, cite the former labels; the README maps them to sections."
- "C18 to C23 need no measurability of the entries." The former C19, the measurability of the deviation event (§3.4, lines 524–527), has measurable entries as its hypothesis, as `TauCeti.measurableSet_exists_lt_norm_sub` does. Right would be: "C18 and C20 to C23 need no measurability of the entries."
- "so the file stops building if the library changes those statements." See C03. Right would be: "so the file stops building if one of them is renamed or removed."

## C05 — Six source citations carry no theorem, section or page, and the one in §3.4 does not support the bounds it follows

A reader cannot find the cited statements. Horn and Johnson is cited at lines 141 ("the spectral theorem"), 154 and 193 ("positive-semidefinite Gram factorizations") without a number, and Vershynin at lines 403, 497 and 517 without a number. In §3.4 (line 517) the citation reads as support for the entrywise Chebyshev and union-bound estimates, which the book does not state: its covariance theorems, Theorem 4.7.1 (p. 99) and Theorem 5.6.1 (p. 129), assume a sub-gaussian vector or an almost surely bounded one, and bound the operator norm with at most logarithmic oversampling.

In the first edition (2018), read at the author's page: Chebyshev's inequality is Corollary 1.2.5 (p. 8); the variance `σ²/N` of an i.i.d. sample mean is (1.5) in §1.3 (p. 9), of which §3.1 is the pairwise-independent vector form; the second-moment matrix is defined in §3.2 (p. 45); the uncentered sample matrix `m⁻¹ ∑ XᵢXᵢᵀ` is introduced in §4.7 (p. 99). So §3.1 and §3.3 could carry those locators, and the citation of §3.4 would say that it is a comparison with Theorems 4.7.1 and 5.6.1. For Horn and Johnson, the pinned module `TauCeti/Analysis/Matrix/GramFactorization.lean` (line 39) records Section 7.2 for the Gram factorization; I could not open the book to confirm it.

## N01 — The exclusion of matrix Bernstein and Chernoff inequalities does not say where they are stated

In Scope and ownership (lines 636–638), adding "(RandomMatrices §2.6)" tells the reader where they live: RandomMatrices §2.6 on main (its `README.md` line 566) states `matrix_bernstein` and the matrix Chernoff bounds.

## Verified sound

| Statement | Instances tried | Values computed (README side / library or direct side) | Result |
| --- | --- | --- | --- |
| 1.1 rank ≤ r ⇔ factors through `Fin r` | M = 0, r = 0; [[1,2],[2,4]], r = 0, 1 | empty·empty = 0; [[1],[2]]·[[1,2]] = M, M ≠ 0 so not r = 0 / lib iff, `Field`, `Fintype n` only | agrees |
| 1.2 spectral expansion | B = [[1,i],[−i,1]] | B(1,−i)ᵀ = 2(1,−i)ᵀ, B(1,i)ᵀ = 0; 2·(1/√2)·conj(−i/√2) = i, without conj −i / lib `star (U j k)` | agrees |
| 1.2 Gram characterization (headline 1) | [[1,2],[2,1]]; J₂ with 1 row, 0 rows | eigenvalues 3, −1: not PSD; [1,1]ᴴ[1,1] = J₂; no rows gives 0 ≠ J₂ / lib `rank ≤ card m`, `Fintype m n` | agrees |
| 1.3 exact-rank uniqueness | zero 2×2 through `Fin 1` | L·g = [[g],[0]] ≠ 0 = L′ for invertible g / lib needs `rank = card ι` | Check true |
| 1.3 Gram-factor uniqueness (headline 1) | A = diag(1,0), U = diag(1,u); points 0,1,2 | U·A = A; AᵀA = [[0,0,0],[0,1,2],[0,2,4]], 1×1 unitaries ±1 / lib iff, `Fintype m` only, n arbitrary | agrees |
| 2.1 entrywise → operator | J_n, x = (1,…,1) | ‖Jx‖ = n‖x‖ > √n‖x‖ for n ≥ 2 / lib `card ι * ε * ‖x‖`; rectangular `√card ι * ε * √card κ` | agrees |
| 2.1 entrywise eigenvalue bound (headline 2) | A = 0, Â = εJ_n | λ₀(εJ) = nε, λ₀(0) = 0: equality / lib `|…| ≤ card ι * ε`, both Hermitian | attained |
| 2.1 Weyl; rank count; PSD tail | norm in scope; diag(1,−1,0) | `open scoped Matrix.Norms.L2Operator` at Eigenvalues/Basic.lean:100; rank 2, sorted (1,0,−1), index 2 nonzero | ℓ² norm as Conventions 3; tail needs PSD |
| 2.2 `cfc` continuity and measurability (headline 3) | [[1,t],[0,1]], t → 0 | `cfc id` = 0 for t ≠ 0 (not Hermitian), I at t = 0 / lib `ContinuousOn … {A | A.IsHermitian}`; `Measurable (cfc f)` on all | agrees |
| 2.3 projector (headline 3) | diag(1,0), c = 1; diag(t,−1), c = 0 | closed: diag(1,0), open interval: 0; P = 0 for t < 0, diag(1,0) at t = 0 / lib `IsClosed Ω` | agrees |
| 2.3 threshold stability | diag(1,0), c = 1, Â = diag(1−t,0) | |λ₀−c| = 0 forces δ ≤ 0, no ‖·‖ < δ; counts 1 vs 0 / lib `δ ≤ |λ_i(A) − c|`, `‖A − B‖ < δ` | agrees |
| 2.4 bridges | set not measurable; rate negative | lib: complement bound for every `s`; `rate : ι → ℝ` unrestricted; only fourth asks `NullMeasurableSet` and probability measure | agrees |
| Layer 2 example | diag(3,1,1), c = 2, ε < 1/3 | ‖Â − A‖ ≤ 3ε < 1 ≤ |λ_k − 2|; one eigenvalue ≥ 2; trace 1 | agrees |
| 3.1 sample mean | Z₃ = Z₁Z₂; constants 1, −1 with c = 0 | (3 + 0)/9 = 1/3 = 3⁻²·3; 0 against 2⁻²·2 = 1/2 / lib pairwise `IndepFun`, common mean, probability, `Nonempty ι` | agrees |
| 3.2 mean and scatter | z = (0,2), y = 4; n = 0 | z̄ = 1, S = 2; mean 2, S′ = 4+0+4 = 8 = 2 + (2/3)·9; coefficient 1 gives 11; 0 + 1⁻¹(y − 0) = y / lib `n/(n+1)`, `CharZero` | agrees |
| 3.3 empirical second moment | (1,1),(1,−1); v = (1,i) | M̂ = I, centred diag(0,1); vvᴴ = [[1,−i],[i,1]], vvᵀ = [[1,i],[i,−1]] / lib `v i k * star (v i l)` | agrees |
| 3.4 entrywise, eigenvalue, operator (headline 4) | n = 0; 𝕜 = ℂ | lib `[Norm E] [Sub E]`, any measure; `card n ^ 2 * v / η ^ 2`, `card n * η`; empty index: both events all of Ω | agrees |
| 3.4 second-moment floor (headline 4) | η = c/(2d), bound v/r; d = 0 | d²(v/r)(2d/c)² = 4d⁴v/(rc²); λ − c/2 ≥ c/2 / lib `4 * card n ^ 4 * v / (card ι * c ^ 2)`, `Nonempty ι`, `M.IsHermitian` | agrees |
| 3.4 example | v = 1, d = 2, c = 1, r = 640 | 4·16/640 = 0.1; variance ≤ E Y² ≤ 1 | agrees |
| Headlines 1–4 in `Suggested.lean` | seven `#check` lines | all elaborate; each type equals its README statement | present; see C03 |
| C01 dropped ids | #2516 lines 76, 241–244, 581, 676; #2572 line 523 | MSS-A05–A07, A09, Parts A and C cited; head has neither | no mapping |
| C02 consumer | SpectralSubspacePerturbation README and family index on main | no mention of this roadmap; prerequisites exclude it | claim unsupported |

- Library: all 106 library names the README puts in code font elaborate at the pins in one probe file with no error; the printed type of every Tau Ceti declaration was compared with its prose statement, no mismatch of hypotheses or generality.
- Files opened at the pins: `TauCeti/Analysis/Matrix/Eigenvalues/Basic.lean`:100, `TauCeti/Analysis/Convex/FiniteMean.lean`:50, `TauCeti/Analysis/Matrix/SampleSecondMoment.lean`:50, `TauCeti/Analysis/InnerProductSpace/CenteredScatter.lean`:64, `TauCeti/Analysis/InnerProductSpace/PointSpectrum.lean`:200, `Mathlib/Analysis/Matrix/MeasurableSpace.lean`:29–58, `Mathlib/Analysis/CStarAlgebra/ContinuousFunctionalCalculus/Continuity.lean`:234; twelve declarations checked to be in the file the supplier contracts name.
- Cross-roadmap citations resolved on main: PolarDecomposition PD-A53 (README line 260, the statement cited), SpectralSubspacePerturbation SSP-D16 (line 453), RandomMatrices §2.6 (line 566), family index lines 59, 82–84, 125.
- Elaboration: `Suggested.lean` elaborates with no error and no warning; no `sorry`, no `set_option`, no definition; imports `Mathlib` and five `TauCeti.*` modules.
- Automatic checks: all passed. Dependency check output: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.
- Earlier review: same head; its corrections C01–C05 and note N01 were rechecked one by one and are unrepaired, as restated above. It had no finding.
- Source locators: 10 source mentions (Horn–Johnson 4, Vershynin 3, Bhatia 2, Cox–Cox 1); the three Vershynin mentions were read against the first edition (Vershynin2018 lines 447–472, 1780–1792, 3766–3806, 4884–4902); the other seven are under Not verifiable.
- Description: 21 Checks counted (2+3+2+3+1+3+2+2+2+1), seven `#check` lines, five Tau Ceti imports, as it says; three sentences differ (C04).

Overlap check: read RandomMatrices (main and #2578), PolarDecomposition (main), SpectralSubspacePerturbation (main), OperatorMonotoneFunctionsAndMatrixMeans (#2496), RandomProjectionsAndSketching (#2572), MathematicalStatisticsHighDimensional (main and #2578), KernelsAndSpectralMethods (#2516) and the OperatorTheory family index; nothing is owned twice. Weyl's bound: PolarDecomposition PD-A53, cited here. Matrix Bernstein and Chernoff: RandomMatrices §2.6, excluded here. `TauCeti.sampleSecondMoment` and `Matrix.IsHermitian.abs_eigenvalues₀_sub_le_norm` are library declarations that RandomMatrices and MathematicalStatisticsHighDimensional cite by name, as this roadmap does.

Source independence: 6 passages compared with 1 source (README lines 401–403, 405–409, 484–489, 493–498, 514–518 and the `Suggested.lean` docstring against Vershynin2018 lines 447–472, 1780–1792, 3766–3806), none shared; largest share Horn–Johnson, 4 of 10 locators, whose text and contents page could not be read (paywalled; only the publisher's excerpt of Chapter 0), so wording and arrangement were not compared with it; contents compared with Vershynin2018 (lines 40–95): independent, the four sections of Layer 3 draw on its §1.2, §1.3, §3.2 and §4.7 and follow no run of its sections, and Layers 1 and 2 have no counterpart there.

Research link: Layer 1 is the Gram factorization behind classical multidimensional scaling (Cox and Cox 2001, §2.2–2.3, per the README); Layer 3 is the elementary counterpart of the covariance estimation theorems of Vershynin 2018 (Theorems 4.7.1, 5.6.1, read); its events are where the Yu–Wang–Samworth `sin Θ` bound (SSP-D16) applies, per the README.

## Not verifiable

- Horn and Johnson, *Matrix Analysis*, 2nd ed. (2013), Theorem 4.3.1 and the three unnumbered citations (lines 141, 154, 193): paywalled at the publisher; the only legal text at hand is the publisher's ten-page excerpt of Chapter 0, which contains neither the contents nor the cited places.
- Bhatia, *Matrix Analysis* (GTM 169, 1997), Corollary III.2.6 (lines 246, 334): paywalled at the publisher; the cache of legally fetched texts has no copy. The pinned `TauCeti/Analysis/InnerProductSpace/CourantFischer.lean` cites the same corollary for Weyl's bound.
- Cox and Cox, *Multidimensional Scaling*, 2nd ed. (2001), §2.2–2.3 (line 155): paywalled at the publisher; the cache of legally fetched texts has no copy.

## Source issues

- none

## For the human reviewers

- Scope: README line 620 says every statement of Layers 1–3 is proved at the pins, and all named declarations elaborate; nothing is left to build. Whether the roadmap is complete and moves to `Completed/` is yours to decide.
- Scope: the headline constant `4d⁴v/(rc²)` (README line 555) is from a Chebyshev and union-bound route that no cited source states; Vershynin2018 Theorems 4.7.1 and 5.6.1 give sharper bounds under stronger hypotheses.
- Licence: `Suggested.lean` line 2 keeps "Copyright (c) 2026 Kitware, Inc." although this pull request rewrites the file's body.
- Licence: README Provenance (lines 603–606) says Tau Ceti modules were adapted from the Apache-2.0 AIQ DKPS formalization (Kitware); `TauCeti/Analysis/InnerProductSpace/CourantFischer.lean` lines 50–52 records it. That repository's licence was not opened.
- Not tested: Horn–Johnson, the source with the most locators (4 of 10), could not be read legally; wording and arrangement were not compared with it.
