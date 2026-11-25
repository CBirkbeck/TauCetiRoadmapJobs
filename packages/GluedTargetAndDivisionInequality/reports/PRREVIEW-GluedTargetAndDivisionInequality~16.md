# Review of GluedTargetAndDivisionInequality (pull request #3027 at 2ac59b9)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/GluedTargetAndDivisionInequality/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 15 lines changed since `c832fa9`: accepted, with no finding. The change repairs the earlier small correction on 8.2 (c) (its Origin label and the Labels paragraph now call the stated form the roadmap's own) and adds to 8.22 a note on the exponent of the per-lift error in the formal proof, which was read against the declarations it cites and is accurate. One small correction (the description does not name this roadmap's new suppliers) and two format notes are carried from the previous review and do not block; the scope and licence questions for the human reviewers stand.

## C01 — The description does not say that this roadmap gains supplier roadmaps

The description's prose never names this roadmap, and for the family it speaks only of changed citations. In this folder the supplier contracts gain a subsection for ComplexMultiplicationAndExplicitReciprocityPartII (§§0.2, 4.6), one for MetaplecticAutomorphicForms (§1.5 (ii)), and two entries for ArakelovGeometryAndAbelianHeights (§1A.5 (b); §§2.9, 4.6). All three roadmaps are on `main` and the sections resolve at this head. One sentence under "For reviewers" would cover it: "GluedTargetAndDivisionInequality now lists ComplexMultiplicationAndExplicitReciprocityPartII §§0.2, 4.6, MetaplecticAutomorphicForms §1.5 (ii) and ArakelovGeometryAndAbelianHeights §§1A.5 (b), 2.9, 4.6 among its suppliers."

## N01 — Five lines headed `*Sources:*` name topics, not sources

In 8.1, 8.2, 8.3, 8.8 and 8.10 (lines 561, 614, 654, 928, 1038); 8.3, for example, has "(sub-mean-value estimates for theta functions)". Either name the work (Bargmann 1961 at 8.2, Frame–Robinson–Thrall at 8.10), or drop the heading and leave the provenance to the Origin label.

## N02 — Gillet and Soulé's paper is in English, so the lemma is "Lemma 30"

The References entry (line 2680) writes "Lemme 30", which is how Gaudron and Rémond cite it (GaudronRemond2014 line 1022).

## Questions for the author

- 8.3, Method label (asked before; the text is unchanged). `GlobalTheory.ColRows.KerSide`, which 8.4 cites, carries the size condition `log(8 + 32·f·g₀·v) ≤ C·La`, the constant of `Formalism.DimensionVariation.ThetaSup`, not the constant `3·(2g·v + 1)^g` that the Method label of 8.3 reports. Does the proof reach the kernel bound through a sup bound with the constant `8 + 32g/h`? I did not trace `liftedMapLogSize` through the proof files.

## Previous findings

- none: the previous report raised no finding. Of its remarks, C01 (8.2 (c)) is repaired: the Origin label of 8.2 now ends "(c) as stated, with the factor `e·(2n + 2)^{2N}` for blocks of any sizes, is this roadmap's own formulation", and line 257 lists 8.2. Its C02, N01 and N02 are not repaired and appear above as C01, N01 and N02.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 8.22, new note: the clause has a parameter `e` and is proved for every `e ≥ 1` | `LinkDIV_at` read; `x = 4`, `ε = ½`, `e = 2` and `½` | Seventh conjunct has `x^(Cabs·eps)`. `x^ε = 2 ≤ x^{2ε} = 4`; at `e = ½`, `x^{ε/2} = 1.41 < 2` | true: `rhs_le_record` assumes `1 ≤ Cabs` and bounds the per-lift terms by `60·ce·m·x^eps·(B0 + Nc)` | none |
| 8.22, new note: "its chain uses the clause with `e = 2`" | `wire_sel_alt`, `wire4F_alt` read | `wire_sel_alt` closes by applying `wire4F_alt` at the value `2`; `wire4F_alt` takes `Cabs` with `1 ≤ Cabs` | true; `e_D = 1` of the statement is the stronger form (`x^ε ≤ x^{2ε}` for `x ≥ 1`) | none |
| 8.22, locator of the main term | `Formalism/LocalRingCardinality/DataParams₂.lean` | `MAIN` defined at line 232, in `Formalism.BasicNotions`, `SizeData₂` | resolves | none |
| 8.2 Origin label, new sentence | two one-variable blocks, `n_τ = 0` and `100` | formal `∏_τ e·(2n_τ+2)^{2|ι_τ|}`: `16e² = 118.2`, `1.23·10¹⁰`; stated `e·(2n+2)^{2N}`: `16e = 43.5`, `7.10·10¹⁰` | neither bounds the other, so "own formulation" is right | none |
| Labels paragraph: the Origin labels that name own forms | count over the Origin labels | 26 sections, 26 Origin, 26 Method; "own formulation" in 7.12, 8.1, 8.2, 8.3, 8.6, 8.21, 8.24: seven, as listed | true | none |
| 7.12 headline `pairing_integral_of_localDivision` (untouched) | elaboration at this head | only the `sorry` warning at line 76; signature as in the previous review | unchanged | none |

Rows for the untouched statements stand as in the previous review, of `c832fa9`.

- Source locators checked against the text: 5 of [FormalProof], in the operator's local copy (`Formalism.MainNotions.LinkDIV_at`, `Formalism.BasicNotions.SizeData₂.MAIN`, `Formalism.L2.DIV.rhs_le_record`, `Formalism.L2.Top4Wire2.wire4F_alt`, `GlobalTheory.Top.wire_sel_alt`), each in the file the README names and under the namespace it gives. Of the seeded sample, 8.2 and 8.22 fall in the changed passages.
- Cross-roadmap citations: the changed passages add none; the `*Needs:*` line of 8.22 is unchanged.
- Automatic checks: all passed. Dependency check, run by hand: `depcheck: 36 roadmaps, 451 edges, 0 problem(s)`.
- Elaboration: `lake env lean` of `Suggested.lean` gives only the `sorry` warning at line 76.
- Record: the change removes, adds or retitles no heading and touches no Lean declaration.
- Family index: changed since `c832fa9`; its sentence naming this roadmap among those that say where a derivation is not written out holds (the README says so in 12 lines), and its entry for this roadmap is unchanged.
- Headlines: as before, 7.12 is stated; 7.13–7.14, 8.9 and 8.21–8.24 are named in the module docstring as not statable.

Overlap check: read ThetaChainsAndFrobeniusPrimeSums, ThetaChainsOnDefiniteUnitaryGroups, RowTowerAndRallisIdentities, SeesawForThetaChains and ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties as in the previous review; the change adds no object and no citation; nothing shared.

Source independence: 3 passages compared with 1 source (changed passages only): the new sentence of the Origin label of 8.2, the Labels list and the note of 8.22, against [FormalProof] at the five declarations above; they describe Lean statements in prose and share no wording. Largest share: [FormalProof], about 163 of 172 locators. Arrangement not compared: the change adds, removes or reorders no layer.

Research link: The headline targets (integrality after division, the height of the period pairing, the division inequality) are steps of Alpöge's formal proof of the Riemann hypothesis for Dirichlet L-functions, announced 20 November 2026. They rest on Bost's slope inequality (Bost 1996) and the Chowla–Selberg formula (1967). This line rests on the README's summary and References.

## Not verifiable

- [FormalProof] at the cited commit `40e56bab`: the operator's local copy is of commit `e50d0981`; the two were not compared.
- Whether `wire4F_alt` reaches `rhs_le_record`: it does not name it; it hands `1 ≤ Cabs` to `ptK_of_real_alt`, which was not opened. The two declarations were read separately.
- Bargmann 1961 (8.2), Gillet–Soulé 1992, Chowla–Selberg 1967, Zhelobenko 1973 and Gelfand–Tsetlin 1950: as in the previous review, no legal open copy was read.

## Source issues

- none

## For the human reviewers

- Scope: of the 26 sections, the Origin labels mark 22 "particular to this proof" and 4 "adapted" (8.2, 8.5c, 8.24d, 8.24e), none "published". The statements rest on [FormalProof], a public Lean repository announced 20 November 2026, not on refereed literature.
- Licence: the formal proof's repository is cited only by file path and declaration name; its licence was not read.
- Decisions: no section leaves this roadmap, so neither recorded decision was needed for it.
