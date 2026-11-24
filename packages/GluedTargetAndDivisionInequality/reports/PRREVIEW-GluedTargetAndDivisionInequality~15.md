# Review of GluedTargetAndDivisionInequality (pull request #3027 at c832fa9)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/GluedTargetAndDivisionInequality/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 407 changed lines since `74a09b7`. The change adds the `*Origin:*` and `*Method of the formal proof:*` labels to all 26 sections, one `*Corollary of:*` line (8.5c), two supplier subsections and fuller references; it alters no statement, removes no section and leaves the one Lean declaration as it was. The labels were read against the declarations of [FormalProof] that they describe, against Bannai–Kobayashi, Gaudron–Rémond and Bost at their locators, and against the cited roadmap sections; the numbers they quote were recomputed. There is no finding. Two small corrections and two format notes, all raised before and not repaired, are carried and do not block; the scope and licence questions for the human reviewers stand.

## C01 — 8.2 (c) as stated is not the formal proof's form, yet neither its Origin label nor the Labels paragraph calls it the roadmap's own formulation

A reader who trusts the Labels paragraph (Conventions, lines 254–258) takes every target, in the form recorded with it, as a statement of [FormalProof], except the wider forms that the Origin labels of 7.12, 8.1, 8.3, 8.6, 8.21 and 8.24 name. 8.2 is not in that list, and its Origin label names no such form.

The Method label of 8.2 (lines 577–580) gives the formal proof's form of (c) correctly: `Formalism.DimensionVariation.BlockBound` in `Formalism/ThetaSupremumBounds/StatementA.lean` has, for blocks of one size, the factor `∏_τ e·(2n_τ + 2)^{2|ι_τ|}`. The statement (line 597) has `e·(2n + 2)^{2N}` for blocks of any sizes, and neither factor bounds the other. For two blocks of one variable each: at `n_τ = 0`, `16e² ≈ 118.2` against `16e ≈ 43.5`; at `n_τ = 100`, `e²·202⁴ ≈ 1.23·10¹⁰` against `e·402⁴ ≈ 7.10·10¹⁰`. The route proves both (lines 605–607). The fix is one clause in the Origin label of 8.2, "(c) as stated, with the factor `e·(2n + 2)^{2N}` for blocks of any sizes, is this roadmap's own formulation", and 8.2 added to the list on line 257.

## C02 — The description does not say that this roadmap gains supplier roadmaps

For the family the description mentions only "changed citations". In this folder the supplier contracts gain a subsection for ComplexMultiplicationAndExplicitReciprocityPartII (§§0.2, 4.6; line 2516), one for MetaplecticAutomorphicForms (§1.5 (ii); line 2527), and two entries for ArakelovGeometryAndAbelianHeights (§1A.5 (b); §§2.9, 4.6; from line 2497). All three roadmaps are on `main`, and the sections resolve at this head. One sentence under "For reviewers" would cover it: "GluedTargetAndDivisionInequality now lists ComplexMultiplicationAndExplicitReciprocityPartII §§0.2, 4.6, MetaplecticAutomorphicForms §1.5 (ii) and ArakelovGeometryAndAbelianHeights §§1A.5 (b), 2.9, 4.6 among its suppliers."

## N01 — Five lines headed `*Sources:*` name topics, not sources

In 8.1, 8.2, 8.3, 8.8 and 8.10 (lines 561, 613, 653, 927, 1037); 8.3, for example, has "(sub-mean-value estimates for theta functions)". Either name the work (Bargmann 1961 at 8.2, Frame–Robinson–Thrall at 8.10), or drop the heading and leave the provenance to the Origin label.

## N02 — Gillet and Soulé's paper is in English, so the lemma is "Lemma 30"

The References entry (line 2673) writes "Lemme 30", which is how Gaudron and Rémond cite it (GaudronRemond2014 line 1022).

## Questions for the author

- 8.3, Method label. `GlobalTheory.ColRows.KerSide` (the declaration 8.4 cites) carries the size condition `log(8 + 32·f·g₀·v) ≤ C·La`. That is the constant `4^g·(2 + 8g/h)^g` of `Formalism.DimensionVariation.ThetaSup` in `Formalism/ThetaSupremumBounds/StatementA.lean`, a statement in the form of 8.3 for every lattice and every `h > 0`, and not the constant `3·(2g·v + 1)^g` that the Method label of 8.3 reports. `ThetaSup` is not in the kernel export by name and `sup_le_euclidean` is, which supports the label; does the proof nevertheless reach the kernel bound through a sup bound with the constant `8 + 32g/h`? I did not trace `liftedMapLogSize` through the proof files.

## Previous findings

- none: the previous report raised no finding. Its two small corrections and two format notes are not repaired at this head (the Origin label of 8.2, the list on line 257, the description, the five `*Sources:*` lines and "Lemme 30" are unchanged) and appear above as C01, C02, N01 and N02.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 7.12 headline `pairing_integral_of_localDivision`, and its Method label | `ℚ`, `N = 6ℤ`, `R = ℤ`; `ℚ(i)`, `𝔭 = (2+i)`, `c` conjugation | `τ₂ = τ₃ = 1`: `B(N′,R) = ℤ`; `τ₂ = 2 > ⌈σ₂⌉`: `½`. Dividing by `c(𝔭)`: `(2+i)/(2−i) = (3+4i)/5` | true; label matches `DivIntoDualShift` (bilinear, `ι·π` matrices, equal localisations, `IsShift`) | none |
| 7.12 Lean signature | `#check @` on a copy; `simp`, `aesop`, `intros; rfl` | all instance binders present; valuation `1` = unit; none of the three tactics closes it | agrees with README; not padding | none |
| 8.1 Method label and Check | `m = 1`, `𝕃²`, `ι` scaling by `1`, `4` | `sup |F₁|²/(|F₁|² + 4|F₂|²) = 1`; bound with `min`: `1`; with `max`: `¼` | label matches `HeightBoundConstant` (dual spaces, per-place bound, then mean) | none |
| 8.2 Origin label (MetaplecticAutomorphicForms §1.5 (ii)) | `u = √π·z` | `∫|u^e|²e^{−|u|²}du = π^{|e|+N}·e!·π^{−|e|} = π^N·e!`, as 8.2 (a) | normalisations agree | none |
| 8.2 Method label, (c) | two one-variable blocks, `n_τ = 0`, `100` | `BlockBound`: `∏_τ Ω^{−n_τ}·e·(2n_τ+2)^{2|ι|}`; 118.2 vs 43.5; `1.23·10¹⁰` vs `7.10·10¹⁰` | label right; stated form not labelled | C01 |
| 8.3 Method label | `sup_le_euclidean`; `g = 1`; export | `e^{π/4} = 2.19 ≤ 3`; `g!(4v/π)^g ≤ (2gv+1)^g` (`1.27v ≤ 2v+1`); covolume `π^g`, `h = 1/v`; `ThetaSup` absent from export | label matches | question |
| 8.4 citation of `KerSide` | read the declaration | conditions on numbers: `log(2Σ_iν_{j,τ,i} + 2) ≤ C·La` per `τ`, mean of `logOm` equal to `R.logOm` | "follows from" consistent | none |
| 8.5c Corollary line (CMER II §4.6) | `K = ℚ(i)` | `−½·1.476336 − ½·log 2π = −1.657107 = −log(Γ(¼)/Γ(¾)) − ½log π` (§4.6 Check) | formula as quoted | none |
| 8.5c transport term | general `E ⊃ K` | `log(rd_E/√D) = (log N𝔡 + [E:K]·log D)/[E:ℚ] − ½log D = log N𝔡/[E:ℚ]` | identity holds | none |
| 8.7 Method label | `P∘P^* = k` | `‖P‖² = ‖PP^*‖ = k`; `f = P^*g`: `‖Pf‖² = k²‖g‖² = k‖f‖²` | true | none |
| 8.10 Method label | `μ = (2,1)`, `(2,2)`; `ph` | hooks `3 ≥ 2!·1!`; `12 ≥ 2!·2!`; `ph(0) = 0 > ph(1) = −1` | true | none |
| 8.20 Method label, `Σ_p 2·log p/p² < 1` | primes to `10⁷`, tail `< 1.1·10⁻⁷` | `2 × 0.493091 = 0.986182` | true | none |
| 8.24 Origin label (ArakelovGeometryAndAbelianHeights §1A.5 (b), Bost 1996) | read §1A.5 | §1A.5 has injective `φ`, exponents `a_𝔭 ≥ 0`; either sign and `c`-semilinear are labelled the roadmap's own | consistent | none |
| 8.24d Origin label | BannaiKobayashi2010 lines 1271–1336; formal statement | source: `p ≥ 5` split, order prime to `p`. Formal: `p ∤ N(𝔠)`, `p ∣ N₁ → p = 2 ∨ (−d/p) = 1`, bound `|N₁|_p^{−n}·p^{n/4}` at `p = d` | label and statement match | none |
| 8.24e Origin label, (b) | formal statement read | means over conjugates of `log⁺(1/area)` and `log⁺‖θ₀‖²` both `≤ C·L`, under `log rd_E ≤ L`, `|(L′/L)(1)| ≤ L` | matches | none |
| Labels paragraph, "every section carries both labels" | count | 26 sections, 26 Origin, 26 Method; "own formulation" at 7.12, 8.1, 8.3, 8.6, 8.21, 8.24 only | true, except C01 | C01 |

- Source locators checked against the text: 4. GaudronRemond2014 lines 586–595 (Lemme 3.9) and 1021–1022 (Gromov's lemma, after Lemme 6.3); Bost1996 lines 467–476 (Prop. 4.3); BannaiKobayashi2010 lines 897, 978 (§§2.1–2.2), 1271, 1304, 1331 (Prop. 2.14–2.15, Cor. 2.16).
- [FormalProof] declarations opened in the operator's local copy: `DivIntoDualShift`, `HeightBoundConstant`, `FockJet`, `BlockBound`, `ThetaSup`, `sup_le_euclidean`, `KerSide`, `torsionTranslate_theta_jets_denominator_bound`, `conjugate_lattice_means_posLog_area_theta_bounded`; 27 further cited declarations of the sampled sections found in the cited files. Kernel export searched for 7 names: `BlockBound`, `DivIntoDualShift`, `FockJet`, `sup_le_euclidean` present; `ThetaSup`, `GaussSubmean`, `KernelSup` absent.
- Cross-roadmap citations resolved at this head: 10. ArakelovGeometryAndAbelianHeights §§1A.5, 2.9, 4.6; ComplexMultiplicationAndExplicitReciprocityPartII §§0.2, 4.6 (on `main`, untouched by this pull request); MetaplecticAutomorphicForms §1.5; SlopesOfHermitianVectorBundles §§1.2a (iii), 2.4 (b); ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §§8.5 (c), 8.18b.
- Automatic checks: all passed. Dependency check, run by hand: `depcheck: 132 roadmaps, 1472 edges, 0 problem(s)`.
- Elaboration: `lake env lean` of `Suggested.lean` gives only the `sorry` warning at line 76.
- Record: no heading of the README at the merge base is removed or retitled; two supplier subsections are added; no Lean declaration is removed, added or restated (only its docstring's last sentence changes).
- Headlines: 7.12 is stated; 7.13–7.14, 8.9 and 8.21–8.24 are named in the module docstring as not statable, with what each lacks.
- Outside the folder the pull request changes only the other roadmap folders it names and the two family indexes.

Overlap check: read ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, ThetaLiftsForDefiniteUnitaryGroups, ThetaKernelsForUnitaryDualPairs, FiniteReductiveGroups, UniformWildKernelBounds, ThetaChainsAndFrobeniusPrimeSums, ThetaChainsOnDefiniteUnitaryGroups, RowTowerAndRallisIdentities and SeesawForThetaChains. The change adds no object. The objects its new citations touch have one owner each, cited here: the Chowla–Selberg class mean (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.5; the height form, ComplexMultiplicationAndExplicitReciprocityPartII §4.6), Bost's slope inequality (ArakelovGeometryAndAbelianHeights §1A.5; SlopesOfHermitianVectorBundles §2.4), the Fock space (MetaplecticAutomorphicForms §1.5). Nothing else is shared.

Source independence: 5 passages compared with 3 sources (changed passages only): the Origin labels of 8.3, 8.24 and 8.24d and the two new References entries, against GaudronRemond2014, Bost1996 and BannaiKobayashi2010; none shared beyond what the mathematics forces. The Method labels of 7.12, 8.1, 8.2 and 8.3 describe Lean statements in prose. Largest share: [FormalProof], about 159 of 168 locators. Arrangement not compared: the change adds, removes or reorders no layer.

Research link: The headline targets (integrality after division, the height of the period pairing, the division inequality) are steps of Alpöge's formal proof of the Riemann hypothesis for Dirichlet L-functions, announced 20 November 2026. They rest on Bost's slope inequality (Bost 1996) and the Chowla–Selberg formula (1967). This line rests on the README's summary and References.

## Not verifiable

- Bargmann 1961 (8.2) and Gillet–Soulé 1992, Lemma 30 (8.3): behind publishers' paywalls; Gromov's lemma was read only as Gaudron and Rémond quote it.
- Chowla–Selberg 1967, pp. 86–110 (8.5c, 8.24e): no legal open copy found; the labels were checked against ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.5 and ComplexMultiplicationAndExplicitReciprocityPartII §4.6.
- Zhelobenko 1973 and Gelfand–Tsetlin 1950 (8.7): bibliographic entries only, not opened.
- [FormalProof] at the cited commit `40e56bab`: the operator's local copy is of commit `e50d0981`; the two were not compared.
- Gaudron–Rémond, arXiv:1105.1230v1: the passage after Lemme 6.3 was read in the HAL version (hal-00590958v1), not in the arXiv file the References name for it.

## Source issues

- none

## For the human reviewers

- Scope: of the 26 sections, the Origin labels mark 22 "particular to this proof" and 4 "adapted" (8.2, 8.5c, 8.24d, 8.24e), none "published". The statements rest on [FormalProof], a public Lean repository announced 20 November 2026, not on refereed literature.
- Licence: the formal proof's repository is cited only by file path and declaration name; its licence was not read.
