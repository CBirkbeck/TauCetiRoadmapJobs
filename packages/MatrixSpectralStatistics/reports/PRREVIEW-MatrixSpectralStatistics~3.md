# Review of MatrixSpectralStatistics (pull request #2611 at 4e8a8e0)
Folder: `TauCetiRoadmap/OperatorTheory/MatrixSpectralStatistics/`
**Verdict:** accepted

**Summary.** Accepted, with no finding. This is an incremental re-review of the 96 lines changed since `7201685`: the five small corrections of the previous review are repaired (the former-label table, the consumer, the `Suggested.lean` docstring, the description, the source locators), the new Vershynin locators and the new comparison paragraph of §3.4 agree with the book at the places cited, and the description now matches the head. One format note remains, not blocking. The human reviewers decide whether a roadmap with nothing left to build is complete, and look at two licence lines.

## N01 — The exclusion of matrix Bernstein and Chernoff inequalities does not say where they are stated

In Scope and ownership ("Outside this roadmap", lines 644–647), adding "(RandomMatrices §2.6)" would tell the reader where they live: RandomMatrices §2.6 on main (its `README.md` lines 566–573) states `matrix_bernstein` and the matrix Chernoff bounds.

## Previous findings

The previous review, of `7201685`, had no finding (no R-numbered point); its small corrections and format note are accounted for here.

- C01 — repaired: Scope and ownership, "Former numbering" (lines 649–665): Parts A–C are Layers 1–3, milestones A1–C4 are §1.1–§3.4, and a table sends every `MSS-` label to its section.
- C02 — repaired: the overview says the `sin Θ` theorem is "applied on the high-probability events of the last layer"; Downstream consumers names KernelsAndSpectralMethods §5.1; Scope says "they can be applied on the events of §3.4".
- C03 — repaired: the docstring says the file "pins, by `#check`, the Tau Ceti declarations that prove them" and "fails to build if one of them is renamed or removed".
- C04 — repaired: the description says the two open roadmaps cite the former labels and the README maps them; C19 "assumes measurable entries"; a `#check` "does not compare a declaration's statement with the README's".
- C05 — repaired: Vershynin at Proposition 1.2.4, Corollary 1.2.5 (p. 8), (1.5) (p. 9), §3.2 (p. 45), §4.7 (p. 99), Theorems 4.7.1 and 5.6.1 as a comparison; Horn and Johnson at §7.2; unnumbered citations dropped.
- N01 — not repaired: "such as matrix Bernstein and matrix Chernoff inequalities, is not part of this roadmap", with no owner named; written again above as N01.

## Verified sound

| Statement | Instances tried | Values computed (README side / source, library or direct side) | Result |
| --- | --- | --- | --- |
| §3.1 added sentence: i.i.d. case of the scalar sample-mean identity | `Zₖ` i.i.d., variance `σ²`; r = 1; r = 4, σ² = 1 | right side `r⁻²·r·σ²` = `σ²/r`; r = 1 gives σ²; r = 4 gives 1/4 / Vershynin2018 lines 461–470: variance of sample mean `σ²/N`, (1.5), printed p. 9 | agrees |
| §3.1 Chebyshev attribution | `{η < Y}` against `{Y² ≥ η²}`, η > 0; Y = −2, η = 1 | `η < Y` gives `Y² > η²`, so Markov on `Y²` gives `v/η²`; Y = −2 is outside `{η < Y}`, bound one-sided / Vershynin2018 lines 437–455, p. 8 | agrees |
| §3.3 added sentence: sample version of `E XXᵀ` | real samples (1,1), (1,−1) | `r⁻¹ ∑ VᵢVᵢᵀ` = I, uncentered / Vershynin2018 lines 1780–1782 (§3.2, p. 45) and 3775–3786 (§4.7, p. 99): `E XXᵀ` and `m⁻¹ ∑ XᵢXᵢᵀ` | agrees |
| §3.4 added comparison paragraph | Theorem 4.7.1; Theorem 5.6.1; relative error ε | sub-gaussian: m ≍ ε⁻²n (lines 3798–3834, pp. 99–100); bounded: m ≍ ε⁻²n log n (lines 4895–4945, pp. 129–130); both bound the expected operator norm | agrees; "not used here" true |
| Former-numbering table | every label of the README at the merge base, by milestone | A01–03, A04–07, A08–09; B01–08, B09–10, B11–14, B16–19 (no B15 existed); C01–05, C06–14, C15–17, C18–23: equal to the table row by row | agrees |
| Downstream consumer, KernelsAndSpectralMethods §5.1 | two centred realizations X, X′ of one distance matrix in `ℝᵖ` | same double-centred Gram matrix, so `AᵀA = A′ᵀA′`, and §1.3 gives `A′ = U A`, U orthogonal `p × p` / its `README.md` lines 566–581 cite MSS-A05–A07, A09 | agrees |
| Headlines 1–4 in `Suggested.lean` (docstring changed, statements not) | seven `#check` lines elaborated | `rank ≤ card m ↔ ∃ A, B = Aᴴ * A`; `card ι * ε`; `Measurable (cfc f)`; `4 * card n ^ 4 * v / (card ι * c ^ 2)` | as README |

The rows of the previous review for the untouched statements stand as in the previous review, of `7201685`.

- Source locators checked against the text: 7 (Vershynin2018 Proposition 1.2.4, Corollary 1.2.5, (1.5), §3.2, §4.7, Theorem 4.7.1, Theorem 5.6.1), each with its printed page; all found where cited.
- Seeded sample: of its eleven sections the diff touches §1.2, §1.3, §3.1, §3.3 and §3.4; their changed sentences are the rows above; the others are unchanged since `7201685`.
- Library declarations: the seven pinned by `#check` printed and compared with the headline statements; `TauCeti/Analysis/Matrix/GramFactorization.lean` line 39 records Horn–Johnson Section 7.2.
- Cross-roadmap citations resolved: KernelsAndSpectralMethods (open) `README.md` lines 76, 241–244, 566–581, 676; RandomProjectionsAndSketching (open) line 523; RandomMatrices §2.6 on main; every `MSS-` label and Part these cite is in the mapping.
- Elaboration: `Suggested.lean` elaborates with no error and no warning; no `sorry`, no `set_option`, no definition; imports `Mathlib` and five `TauCeti.*` modules.
- Automatic checks: all passed on this head, also when rerun. Dependency check output: `depcheck: 186 roadmaps, 2053 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.
- Description against the head: 21 Checks, seven `#check` lines, five Tau Ceti imports, 20 removed declarations (14 theorems, 2 instances, 4 definitions), the removed roadmap import, the former-label mapping, the consumer and the locators are all as it says; no sentence differs.

Overlap check: read RandomMatrices (main and open), PolarDecomposition (main), MathematicalStatisticsHighDimensional (main and open), OperatorMonotoneFunctionsAndMatrixMeans (open), RandomProjectionsAndSketching (open), KernelsAndSpectralMethods (open); nothing shared. Weyl's bound: PolarDecomposition PD-A53, cited here. Matrix Bernstein and Chernoff: RandomMatrices §2.6, excluded here. No open pull request drops an id cited here, and the ids this pull request drops are mapped.

Source independence: changed passages only; 5 passages compared with 1 source (README lines 405–415, 492–494, 568–573, 802–805 and the `Suggested.lean` docstring against Vershynin2018 lines 437–472, 1780–1791, 3775–3834, 4882–4945), none shared; largest share Vershynin2018, 7 of 12 locators; no layer added, removed or reordered, so the arrangement stands as compared in the previous review: independent. Horn and Johnson could not be read.

Research link: Layer 1 is the Gram factorization behind classical multidimensional scaling (Cox and Cox 2001, §2.2–2.3, per the README); Layer 3 is the elementary counterpart of the covariance estimation theorems of Vershynin 2018 (Theorems 4.7.1, 5.6.1, read); its events are where the Yu–Wang–Samworth `sin Θ` bound (SSP-D16) applies, per the README.

## Not verifiable

- Horn and Johnson, *Matrix Analysis*, 2nd ed. (2013), §7.2 (line 154) and Theorem 4.3.1 (line 246): paywalled at the publisher; no legal copy at hand. The pinned `TauCeti/Analysis/Matrix/GramFactorization.lean` (line 39) records the same Section 7.2.
- Bhatia, *Matrix Analysis* (GTM 169, 1997), Corollary III.2.6 (lines 246, 334): paywalled; unchanged since the previous review.
- Cox and Cox, *Multidimensional Scaling*, 2nd ed. (2001), §2.2–2.3 (line 155): paywalled; unchanged since the previous review.

## Source issues

- none

## For the human reviewers

- Scope: README lines 630–631 say every statement of Layers 1–3 is proved at the pins, and the named declarations elaborate; nothing is left to build. Whether the roadmap is complete and moves to `Completed/` is yours to decide.
- Scope: the headline constant `4d⁴v/(rc²)` is from a Chebyshev and union-bound route that no cited source states; Vershynin2018 Theorems 4.7.1 and 5.6.1 give sharper bounds under stronger hypotheses, as README lines 568–573 now say.
- Licence: `Suggested.lean` line 2 keeps "Copyright (c) 2026 Kitware, Inc." although this pull request rewrites the file's body.
- Licence: README Provenance (lines 611–616) says Tau Ceti modules were adapted from the Apache-2.0 AIQ DKPS formalization (Kitware). That repository's licence was not opened.
- Not tested: Horn and Johnson (§7.2, Theorem 4.3.1) could not be read legally; wording was not compared with it.
