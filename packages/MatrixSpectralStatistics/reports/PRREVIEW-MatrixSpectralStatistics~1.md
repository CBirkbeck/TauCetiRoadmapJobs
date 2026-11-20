# Review of MatrixSpectralStatistics (pull request #2611 at 7201685)
Folder: `TauCetiRoadmap/OperatorTheory/MatrixSpectralStatistics/`
**Verdict:** accepted

**Summary.** Accepted, with no finding. Every statement of Layers 1–3 matches, in hypotheses and generality, the pinned Tau Ceti or Mathlib declaration it names, and every Check and worked example recomputes correctly. There are five small corrections, none blocking: an open roadmap still cites the dropped `MSS-` labels and no mapping is given; SpectralSubspacePerturbation is called a consumer although it does not cite this roadmap; the `Suggested.lean` docstring says more than its `#check` lines can test; three sentences of the description do not match the head; and several source citations have no locator. There is also one format note. The human reviewers have to decide whether the roadmap is complete, and look at a copyright line and a provenance statement.

## C01 — The README drops the `MSS-` labels and Parts A–C that open roadmaps still cite, and gives no mapping from old to new numbering

Once this merges, the supplier citations of another roadmap will point to labels that no longer exist. KernelsAndSpectralMethods (#2516) cites MSS-A05 to MSS-A07 and MSS-A09 in its `README.md` at lines 76, 243–244, 576, 578 and 581 (the *Needs:* line of its 5.1), and "MatrixSpectralStatistics Part A" at line 676. RandomProjectionsAndSketching (#2572) cites "Part C" at its `README.md` line 523. At this head the README contains no `MSS-` label and no "Part" heading. The milestone mapping appears only in the pull-request description.

The smallest repair is a short table in the README whose header names the former labels:

| Former labels | Section |
| --- | --- |
| A01–A03 | §1.1 |
| A04–A07 | §1.2 |
| A08–A09 | §1.3 |
| B01–B08 | §2.1 |
| B09–B10 | §2.2 |
| B11–B14 | §2.3 |
| B16–B19 | §2.4 |
| C01–C05 | §3.1 |
| C06–C14 | §3.2 |
| C15–C17 | §3.3 |
| C18–C23 | §3.4 |

It would also record that Parts A, B and C are now Layers 1, 2 and 3.

## C02 — SpectralSubspacePerturbation is presented as a consumer of this roadmap, but it neither cites nor depends on it

A reader would conclude that SpectralSubspacePerturbation (SSP) consumes Layers 2 and 3. The text says so in three places: "It feeds SpectralSubspacePerturbation" in the overview (lines 31–34), the only entry under Downstream consumers (lines 596–599), and "SpectralSubspacePerturbation, which combines them with Layers 2 and 3" in Scope and ownership (lines 634–635). On main, `SpectralSubspacePerturbation/README.md` never mentions MatrixSpectralStatistics, and SSP-D16 (its line 453) is a deterministic bound. The family index `OperatorTheory/README.md` (lines 82–84) lists SSP's prerequisites as PolarDecomposition, Majorization, PrincipalAngles and SelfAdjointSpectralTheory.

The version on main described a combination ("Combined with SpectralSubspacePerturbation, …"), and the same wording would fix all three places. For example: "applied on the high-probability events of Layer 3, the population-gap `sin Θ` theorem of SpectralSubspacePerturbation (SSP-D16) turns …". In the scope paragraph, "which combines them with Layers 2 and 3" could become "they can be applied on the events of §3.4". The Downstream consumers entry could say it describes a combination. The roadmap that does consume this one is KernelsAndSpectralMethods (§1.2–1.3, see C01).

## C03 — The `Suggested.lean` docstring says the file fails to build if the library stops providing the headline theorems "in this form", but a `#check` line fails only when the name is missing

A reader would take the file as a kernel check of the README's four headline statements. In fact it only checks that seven names exist. `#check @c` elaborates `c` and prints its type, and compares that type with nothing. So if a hypothesis is added to `TauCeti.measurable_matrix_cfc`, or the bound in `TauCeti.one_sub_le_measure_forall_half_le_eigenvalues₀_sampleSecondMoment` is weakened, the file still builds (docstring, lines 32–35). The same paragraph also begins "It states the roadmap's headline theorems" and then says the file "restates none of them".

The smallest repair rewords the docstring: the file "pins, by `#check`, the Tau Ceti declarations that prove them; it fails to build if one is renamed or removed". Alternatively, each `#check` could become `example : <the README's statement> := @<declaration>`. The `Suggested.lean` files of the completed roadmaps (for example Multiquadratic) use that form, and with it the kernel checks the statement as well as the name.

## C04 — Three sentences of the description do not match the head

- "No other roadmap cites the MSS labels." This is false: KernelsAndSpectralMethods cites MSS-A05 to MSS-A09 and RandomProjectionsAndSketching cites Part C (C01). A correct sentence would be: "KernelsAndSpectralMethods and RandomProjectionsAndSketching (both open) cite the former labels; the README maps them to sections."
- "C18 to C23 need no measurability of the entries." This does not hold for C19. The measurability of the deviation event (§3.4, lines 524–527, `TauCeti.measurableSet_exists_lt_norm_sub`) still takes measurable entries as its hypothesis. A correct sentence would be: "C18 and C20 to C23 need no measurability of the entries."
- "so the file stops building if the library changes those statements." `#check` does not detect a changed statement (C03). A correct sentence would be: "so the file stops building if one of them is renamed or removed."

## C05 — Six source citations give no theorem, section or page, and one supports the wrong sentence

A reader cannot find these statements in the sources. Horn and Johnson is cited at lines 141 ("the spectral theorem"), 154 and 193 ("positive-semidefinite Gram factorizations") with no number. Vershynin's *High-Dimensional Probability* is cited at lines 403, 497 and 517 with no number. At line 517 the citation comes after "For real entries ‖·‖² is the square", so it appears to support that triviality rather than the concentration bounds of §3.4.

The first edition (2018), from the author's page, has the following:

- Chebyshev's inequality is Corollary 1.2.5 (p. 8).
- The variance `σ²/N` of an i.i.d. sample mean is (1.5) in §1.3 (p. 9). The README's form, with pairwise independence and vector values, is more general.
- The second-moment matrix is defined in §3.2 (p. 45).
- The uncentered sample matrix `m⁻¹ ∑ XᵢXᵢᵀ` is introduced in §4.7 (p. 99).

The book does not state the entrywise Chebyshev and union-bound estimates of §3.4. Its covariance theorems (Theorem 4.7.1, p. 99; Theorem 5.6.1, p. 129) assume a sub-gaussian or a bounded vector and reach logarithmic dimension dependence. So §3.1 and §3.3 could cite those locators, and the §3.4 citation would say that it is background, comparing the bounds with Theorems 4.7.1 and 5.6.1. Horn and Johnson would need theorem numbers as well.

## N01 — The exclusion of matrix Bernstein and Chernoff inequalities does not name the roadmap that states them

In Scope and ownership (lines 636–638), adding "(RandomMatrices §2.6)" would tell a reader where those inequalities are stated. RandomMatrices §2.6 on main states both, as `matrix_bernstein` and the matrix Chernoff bounds.

## Verified sound

| Statement | Instances tried | Values computed (README side / library or direct side) | Result |
| --- | --- | --- | --- |
| 1.1 rank ≤ r ⇔ factor through `Fin r` | M = 0, r = 0; M = [[1,2],[2,4]], r = 0, 1 | 0 = (empty)(empty); [[1],[2]]·[[1,2]] = M, rank 1 > 0 / lib iff, any field, `Fintype n` | agrees |
| 1.2 spectral expansion | B = [[1,i],[−i,1]] | eigenvalues 2, 0; u = (1,−i)/√2; B₀₁ = 2·(1/√2)·(i/√2) = i; without conjugate −i / lib has `star` on second factor | agrees |
| 1.2 Gram characterization | [[1,2],[2,1]]; J₂ with card m = 0, 1 | eigenvalues 3, −1, not PSD; J₂ = [1,1]ᴴ[1,1]; zero rows give 0 / lib `B.rank ≤ Fintype.card m` | agrees |
| 1.3 exact-rank uniqueness | zero 2×2 through `Fin 1` | L=[[1],[0]], R=0; L'=0, R'=[[1,0]]; L·g=[[g],[0]] ≠ 0 / lib needs `rank = card ι` | Check true |
| 1.3 Gram-factor uniqueness | A=[[1,0],[0,0]]; points 0,1,2 | U=diag(1,u) fixes A; 1×1 real unitaries ±1, factors ±[0,1,2] / lib iff, no rank, any n | agrees |
| 2.1 entrywise → operator | J_n, x = (1,…,1) | ‖Jx‖ = n‖x‖, so √n fails for n ≥ 2 / lib factor `card ι`, rectangular `√card·√card` | agrees |
| 2.1 eigenvalue perturbation | A=0, Â=εJ_n | λ₀(εJ) = nε = bound / lib `card ι * ε`, Hermitian both | attained |
| 2.1 Weyl, rank count | norm scope; diag(1,−1,0) | file opens `Matrix.Norms.L2Operator` (Eigenvalues/Basic.lean:100); rank 2, sorted (1,0,−1) | ℓ² norm as Conv. 3; tail needs PSD |
| 2.2 continuity / measurability of `cfc` | [[1,t],[0,1]], t → 0 | `cfc id` = 0 for t ≠ 0, = I at t = 0 / lib ContinuousOn Hermitian set; Measurable on all | agrees |
| 2.3 projector | diag(1,0), c=1; diag(t,−1), c=0 | P_[1,∞) = diag(1,0), open interval gives 0; jump 0 → diag(1,0) at t=0 / lib closed Ω | agrees |
| 2.3 threshold stability | diag(1,0), c=1; Â=diag(1−t,0) | gap 0 forces δ ≤ 0, hypothesis empty; counts 0 vs 1 / lib `δ ≤ |λ−c|`, `‖A−B‖ < δ` | agrees |
| 2.4 bridges | negative rate; non-measurable events | lib `rate : ι → ℝ`, no measurability in first three; fourth `NullMeasurableSet`, probability measure | agrees |
| Layer 2 example | A=diag(3,1,1), c=2, ε<1/3 | ‖Â−A‖ ≤ 3ε < 1 = δ; one eigenvalue ≥ 2; trace 1 | agrees |
| 3.1 sample mean | Z₃ = Z₁Z₂ signs; constants 1, −1, c = 0 | E[(ΣZ/3)²] = 1/3 = 3⁻²·3; 0 vs 1/2 / lib common mean, pairwise `IndepFun` | agrees |
| 3.2 add-one scatter | z=(0,2), y=4; n=0 | S=2, S'=8 = 2+(2/3)·9; coefficient 1 gives 11; one-point mean = y / lib `n/(n+1)` | agrees |
| 3.3 empirical second moment | v=(1,1),(1,−1); v=(1,i) | M̂ = I vs centred diag(0,1); vvᴴ Hermitian, vvᵀ = [[1,i],[i,−1]] not / lib `star` | agrees |
| 3.4 floor (headline 4) | η = c/(2d), bound v/r; d = 0 | d²(v/r)/(c/2d)² = 4d⁴v/(rc²); λ − c/2 ≥ c/2; d = 0 set is univ / lib `4·card n⁴·v/(card ι·c²)` | agrees |
| 3.4 example | v=1, d=2, c=1, r=640 | 4·16/640 = 0.1, probability ≥ 0.9 | agrees |
| 3.4 symmetry of M | M k l = ∫ V k V l | equals M l k when ι nonempty | agrees |
| Headlines 1–4 in `Suggested.lean` | seven `#check` lines | all elaborate; each matches its README statement | present (C03) |
| Downstream consumer (C02) | SSP README, family table on main | no mention of this roadmap; SSP prerequisites exclude it | claim unsupported |
| Dropped ids (C01) | #2516 lines 76, 243–244, 576–581; #2572 line 523 | MSS-A05–A07, A09, Parts A, C cited; head has neither | no mapping |

- Library: 65 declarations named in the README and 25 Mathlib declarations elaborated with `#check` at the pins, all present. The types were compared with the README statements, and no generality mismatch was found.
- Files opened at the pins: Eigenvalues/Basic.lean:70–160, FunctionalCalculus.lean:1–60, PointSpectrum.lean:200, FiniteMean.lean:50, SampleSecondMoment.lean:50, CenteredScatter.lean:64, Mathlib MeasurableSpace.lean:29–58, CStarAlgebra/Matrix.lean:183–194.
- Cross-roadmap citations resolved: PolarDecomposition PD-A53 (main, README line 260); SpectralSubspacePerturbation SSP-D16 (main, line 453); family index lines 59, 82–84, 125.
- Elaboration: `Suggested.lean` elaborates with no warning and no error, and gives seven `#check` outputs. It has no `sorry`, no `set_option` and no sorry'd data.
- Automatic checks: all passed. The dependency check reports `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Source locators: 10 source mentions (Horn–Johnson 4, Vershynin 3, Bhatia 2, Cox–Cox 1). None has a locator that could be verified. The three Vershynin mentions were checked against the first edition (Vershynin2018 lines 450–455, 465–472, 1780–1790, 3766–3800 and 4882–4895).
Overlap check: read RandomMatrices (main), PolarDecomposition (main), SpectralSubspacePerturbation (main), OperatorMonotoneFunctionsAndMatrixMeans (#2496), RandomProjectionsAndSketching (#2572), MathematicalStatisticsHighDimensional and the OperatorTheory family index (#1854). Nothing is owned twice. Weyl's bound is owned by PolarDecomposition PD-A53 and cited here. Matrix Bernstein and Chernoff are owned by RandomMatrices §2.6 and excluded here. `TauCeti.sampleSecondMoment` and the Weyl declaration are library declarations, cited by name by RandomMatrices, MathematicalStatisticsHighDimensional and this roadmap.

Source independence: 7 passages compared with 1 source (README lines 401–403, 405–409, 410–412, 484–489, 493–498 and 514–518, and the `Suggested.lean` docstring, against Vershynin2018 lines 447–472, 1780–1790 and 3766–3800). A whole-text word-sequence comparison found no shared 8-word run and one shared 6-word run, the generic "the variance of a sum of"; none shared. Horn–Johnson, Bhatia and Cox–Cox are paywalled and were not compared. Largest share Horn–Johnson, 4 of 10 locators. Contents compared with Horn–Johnson's chapter list, from general knowledge and not opened during this review (Ch. 0–8: review, eigenvalues and similarity, unitary similarity, canonical forms, Hermitian matrices, norms, eigenvalue perturbation, positive semidefinite matrices, nonnegative matrices): independent. Layers 2 and 3 (measurability, convergence in measure, sample moments) have no counterpart in it, and Layer 1 combines material from Ch. 0 and Ch. 7. Layer 3 was also compared with Vershynin2018's contents (lines 55–94): its four sections do not follow a run of the book's sections.

Research link: Layer 1 is the Gram factorization behind classical multidimensional scaling (Cox and Cox 2001, §2.2–2.3). Layers 2–3 give the high-probability events on which the Davis–Kahan variant of Yu, Wang and Samworth (2015) (SpectralSubspacePerturbation SSP-D16) is applied. This rests on the README's overview and Downstream consumers.

## Not verifiable

- Horn and Johnson, *Matrix Analysis*, 2nd ed. (2013): Theorem 4.3.1 and the unnumbered citations at lines 141, 154 and 193. The DOI resolves only to the Cambridge publisher page, and no open copy was found.
- Bhatia, *Matrix Analysis*, GTM 169 (1997), Corollary III.2.6: the DOI belongs to a paywalled publisher (Springer). Note that the Tau Ceti module `Eigenvalues/Basic.lean` cites Theorem III.2.1 for the same inequality.
- Cox and Cox, *Multidimensional Scaling*, 2nd ed. (2001), §2.2–2.3: the DOI resolves only to the Taylor & Francis page, and no open copy was found.

## Source issues

- none

## For the human reviewers

- Scope: README line 620 says every statement of Layers 1–3 is proved at the pins, and all 65 named declarations elaborate. Nothing is left to build. Whether to declare the roadmap complete and archive it under `Completed/` is the maintainers' decision.
- Scope: the headline constant `4d⁴v/(rc²)` (README line 555) comes from an elementary Chebyshev and union-bound route. No cited source states it; Vershynin2018 §§4.7 and 5.6 give sharper covariance bounds under stronger hypotheses. The open roadmap KernelsAndSpectralMethods consumes Layer 1.
- Licence: line 2 of `Suggested.lean` keeps "Copyright (c) 2026 Kitware, Inc." although this pull request rewrites the file's body. Seven other OperatorTheory `Suggested.lean` files on main carry the same line, and the repository licence is Apache-2.0.
- Licence: the README Provenance section (line 603) says Apache-2.0 code in the AIQ DKPS formalization (Kitware) was adapted into Tau Ceti. That repository's licence was not opened in this review.
- Not tested: Horn–Johnson, the source with the most locators, could not be read legally, so the wording was not compared with it. The arrangement was compared only with its chapter list.
