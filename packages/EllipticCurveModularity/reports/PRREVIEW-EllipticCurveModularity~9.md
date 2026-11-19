# Review of EllipticCurveModularity (pull request #1018 at 0342320)

**Verdict:** accepted

**Summary.** Accepted: the folder is unchanged since the previous review, and the title and description, read sentence by sentence against this head, now agree with it; the one paragraph the previous review found out of date is gone. The Lean file elaborates with `sorry` as its only warning and the dependency check reports no problem. There is no small correction and there are six format notes, all carried over unchanged; none blocks. The two points for the human reviewers stand as before.

## N01 — R29.2's first theorem needs R29.4

Carried over unchanged: the theorem that an attached form is residually attached at every prime uses the exact level and all-coefficient comparison of R29.4, so the guide to the layers could say that R29.2's definition comes first and its theorem after R29.4. There is no cycle.

## N02 — Three links into ModularForms point at headings that are no longer there

Carried over unchanged (README lines 483, 569 and 1350): the anchors `#layer-5-strong-multiplicity-one-and-the-eigenform-characterization`, `#layer-7-l-functions` and `#layer-8g-galois-stability-the-character-field-and-rationality` land at the top of the page. The citations themselves stay valid through that roadmap's mapping of its earlier labels.

## N03 — Pinned declarations behind "supplied" facts are not named

Carried over unchanged: multiplicativity of `WeierstrassCurve.LFunction` and its value at 1 are `WeierstrassCurve.isMultiplicative_LFunction` and `WeierstrassCurve.LFunction_apply_one` (Tau Ceti, `TauCeti/AlgebraicGeometry/EllipticCurve/LFunction.lean`, lines 76 and 81); the cross-level theorem of the contracts table is `HeckeRing.GL2.Newform.level_eq_and_coe_eq_of_forall_notMem_prime_eigenvalue_eq`.

## N04 — Five lines of `Suggested.lean` exceed 100 characters

Lines 100, 102, 107, 109 and 115 (the docstrings and signatures of the three `IsNewformOf` theorems of R29.3 and R29.4).

## N05 — RankZeroOneBSD is named as a consumer but is no roadmap yet

Carried over unchanged: README line 1502 and the description's summary ("EllipticCurves Layer 7 and RankZeroOneBSD consume the continuation") name RankZeroOneBSD; on main and among the open roadmaps there is only RankZeroOneBSDPartII, so a reader cannot open the consumer meant.

## N06 — The generated dependency block lists two roadmaps the README does not cite

In the description's `depends-on` block, SerreWeightAndLevelOptimisation and FiniteFlatGroupsAndIntegralPadicHodgeTheory are listed (both ticked, both on main); neither name occurs in `TauCetiRoadmap/EllipticCurveModularity/README.md` at this head. Regenerating the block removes them.

## Previous findings

The previous report had no finding (R); its small correction and format notes are accounted for here.

- C01 — repaired: the description no longer has the paragraph on what EllipticCurveModularityTotallyReal "still says"; it names "§§4.2 and 4.4 … used at K = ℚ for existence", which that roadmap's open head has at lines 942, 1086 and 1141.
- N01 — not repaired: untouched; written again as N01.
- N02 — not repaired: untouched; written again as N02.
- N03 — not repaired: untouched; written again as N03.
- N04 — not repaired: the same five lines; written again as N04.
- N05 — not repaired: README line 1502, "consumers include EllipticCurves Layer 7 and RankZeroOneBSD"; written again as N05.
- N06 — not repaired: the generated block still lists both roadmaps; written again as N06.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `modularity` (description: a weight-two newform of level N_E with coefficients a_n(E)) | 11a1, `y² + y = x³ − x²`, at n = 2, 3, 4 | Points mod 2: 5, a₂ = −2; mod 3: 5, a₃ = −1; a₄ = a₂² − 2 = 2. `η(z)²η(11z)²` = q − 2q² − q³ + 2q⁴ | holds | none |
| `LFunction_LSeriesSummable` (description: summability over every number field) | exponent at s = 3/2 and above | Hasse gives a majorant n^(1/2+ε−σ) times an ideal-divisor count: summable for σ > 3/2, divergent majorant at σ = 3/2; bound strict in Lean | holds | none |
| Description: three open suppliers with the sections named | each section at the supplier's open head | TotallyReal §4.2, §4.4 at lines 942, 1086; AutomorphicGaloisRepresentations §§1.5, 3.10, 6.1, 6.2, 6.4 present; Faltings R28.4, R28.6 with R28.4.5–7, R28.6.1–4 present | holds | none |
| Description: "Every other roadmap cited as a supplier is on main" | the 13 other supplier names of the README | all 13 have a folder on main (SemisimpleAlgebras under RepresentationTheory) | holds | none |
| Description: "the Lean states only real-bodied definitions and theorems"; "imports none of them" | the 17 declarations and 5 imports | 5 definitions with bodies, 12 sorried theorems; imports `Mathlib` and four `TauCeti.*` modules | holds | none |

The rows of the previous review for the untouched statements stand as in that review, of `0342320`; the diff is empty and changes no statement.

- Changed passages: none in the folder (0 lines); no file changed outside the folder; the seeded sample falls in no changed passage.
- Title and description: every sentence of the summary block and the prose read against the head (new roadmap, three files, 41 headings, 17 declarations, the three formulations of R29.6, the equivalence without the existence input, consumers, suppliers); none contradicted; N05 and N06 are the only remarks.
- Library declarations opened at the pin: `WeierstrassCurve.LFunction` (`Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean`, line 79) and the two Tau Ceti lemmas of N03.
- Cross-roadmap citations resolved for the description: 3 open suppliers at their heads (10 sections), 13 suppliers on main, 2 non-prerequisite roadmaps (EllipticCurvePeriodsAndModularParametrizations §3.1 cites R29.6's summability at its lines 820 and 831; EllipticCurveModularityPartIIGL2TypeAbelianVarieties is open and owns the GL₂-type case).
- Dependency check: `depcheck: 200 roadmaps, 2197 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with 12 `sorry` warnings and nothing else; no `set_option`, no sorry'd data.
- Automatic checks: all passed at this head.

Overlap check: read EllipticCurveModularityTotallyReal, EllipticCurvePeriodsAndModularParametrizations and EllipticCurveModularityPartIIGL2TypeAbelianVarieties at their open heads; EllipticCurveModularityPartII, AutomorphicGaloisRepresentations, AlgebraicModularFormsAndSerreWeights, ModularForms, ModularCurvesPartII as read in the previous reviews (the third list is empty and nothing changed); existence of the newform over ℚ: EllipticCurveModularityTotallyReal §4.4, consumed here; residual attachment predicate: AlgebraicModularFormsAndSerreWeights §7.5; the quotient `A_f⁰`: ModularCurvesPartII §16.5; elliptic coefficient summability: here, consumed by EllipticCurvePeriodsAndModularParametrizations §3.1.

Source independence: changed passages only: the folder has no changed passage, so 0 passages were compared with 0 sources in this round; no layer added, removed or reordered, so the arrangement stands as compared before (largest share Cremona, 12 of the locators; independent).

Research link: The headline is the modularity theorem for elliptic curves over ℚ in Serre's 1987 formulation (§4.6, Theorem 4), with Carayol 1986 for conductor and local factors and Faltings 1983 for the isogeny; existence is imported from the totally real case (README, R29.3 and References).

## Not verifiable

- Silverman, AEC VII.5, cited at the reduction paragraph of the notation section: no legal copy read (as before).
- The Provenance section's account of `LeanPool/lean-pool`: repository not opened (as before).
- The description's sentence on which AI systems wrote and revised the roadmap: not something the head records.

## Source issues

- none

## For the human reviewers

- Scope: existence of the attached newform (headline `modularity`) is taken only from EllipticCurveModularityTotallyReal §4.4, whose References gave as main sources a discussion draft of 7 October 2026 and a preprint of 4 October 2026; this README cites no refereed proof of existence.
- Licence: the Provenance section maps targets to the Apache-2.0 folder `LeanPool/FLTEichlerShimura`, and two choices are said to follow the Imperial College London FLT project; neither repository was opened, so agreement of Lean declarations with them is unchecked.
