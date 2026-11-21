# Review of ChowFormsAndHeightsOfSubvarieties (pull request #2891 at d23022b)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ChowFormsAndHeightsOfSubvarieties/`
**Verdict:** accepted

**Summary.** Accepted, with no finding. The head is the one the previous review read, and an independent recomputation agrees with it: Philippon's Théorème 2 (p. 256) is 6.1 (iii) with the same sign, constant `½·H_n` and normalisations; every exact and numerical value in the Checks of 5.1, 6.1 and 6.2 was reproduced; every supplier section says what the contracts say. Three small corrections remain, none blocking: the identity of 6.1 has no locator in Bost–Gillet–Soulé, one consumer bullet describes a step the consumer does not have, and one sentence of the description about the copies of the family index does not match the heads. The human reviewers have Bost–Gillet–Soulé (not readable), the statements with no published source, and the family's stated basis to decide.

## C01 — The identity of 6.1, the first headline, is credited to Bost–Gillet–Soulé without a theorem or page

A reader can check 6.1 (iii) against Philippon at its page, but cannot check the global identity against the source it is credited to: the Summary (line 3) and the References (line 458) name Bost, Gillet and Soulé, J. Amer. Math. Soc. 7 (1994), with no theorem number or page, and 6.1 gives no locator at the claim. No legal copy could be read for this review either, so no locator is proposed here. When a copy is available, add the theorem and page at the claim in 6.1 and in the References. Until then 6.1 could say, as 5.1 (line 40) and 6.2 (line 284) do, that the identity is proved here from (i)–(iii) and the Cartier recursion, and name Bost–Gillet–Soulé as its published source.

## C02 — The consumer bullet for HeightsForLogSingularMetrics says the route of its §4.3b (a) uses the change of metric 5.1, but that route has no such step

A reader who follows the bullet to find a use of 5.1 finds none. At its head, HeightsForLogSingularMetrics §4.3b (a) says the height of the projective bundle "is used here, not proved" and is 6.2 (a7) for `J̄ = Ē^∨` (its README line 94); its route for (a) (line 100) is only that identification, and its *Needs* line (102) and its contract with this roadmap (line 252) cite 6.2 (a) and (a7), never 5.1. The one metric change there, in a Check (line 108), cites HeightsRationalPointsAndObstructions §5.17a. In the Downstream consumers bullet (line 418), end the sentence after "(the model `Proj Sym E^∨ = ℙ(M_J^∨)` and the metrised `O(1)` are the same)" and drop "and the change of metric in its route is the formula of 5.1".

## C03 — The description says the family index at FiniteReductiveGroups and AdelicHeightsAndSuccessiveMinima is "an earlier version"; at the heads those two carry this roadmap's entry as it is here, and thirteen other heads carry the earlier entry

The description reads: "those at the heads of FiniteReductiveGroups and AdelicHeightsAndSuccessiveMinima are an earlier version". This tells a reader that the other copies agree with this one. At the open heads, the family index of FiniteReductiveGroups (its lines 117–120) and of AdelicHeightsAndSuccessiveMinima (lines 118–121) has the entry of this head for this roadmap ("the change of metric in arithmetic intersection numbers, the comparison …"); those two copies differ from this one elsewhere (their opening paragraph on the formal proof is nine lines against six here). The earlier entry ("Chow forms of projective subvarieties, spherical heights of multihomogeneous forms, …") is in the index of thirteen family heads, among them HeightsForLogSingularMetrics, SingularHermitianMetricsAndL2Methods and OrbitMeasuresOnAdelicGroups. A sentence that would be right: "The copies are not yet one text: thirteen family heads still carry an earlier entry for this roadmap, and the copies at FiniteReductiveGroups and AdelicHeightsAndSuccessiveMinima differ from this one in the opening paragraph; they are to be brought to one text before the family merges."

## Previous findings

The previous review read this same head (no line of the folder or of the family index has changed since), so its three small corrections stand as C01–C03 above:

- C01 (no locator for Bost–Gillet–Soulé) — not repaired: lines 3 and 458 are unchanged; "the comparison of Bost, Gillet and Soulé" still has no theorem or page.
- C02 (consumer bullet) — not repaired: line 418 still ends "and the change of metric in its route is the formula of 5.1".
- C03 (description, copies of the family index) — not repaired: the sentence "those at the heads of FiniteReductiveGroups and AdelicHeightsAndSuccessiveMinima are an earlier version" is unchanged. The counts have moved since (the other heads changed): the earlier entry is now in thirteen heads, and C03 above gives the present state.
- The previous review had no finding, and its deferred point (one owner for the height of `ℙ(J^∨)`) stays settled: HeightsForLogSingularMetrics §4.3b (a) cites 6.2 (a7).

## Verified sound

| Statement | Instances tried | Values computed (this side / other side) | Result |
|---|---|---|---|
| 6.1 (iii) against Philippon91 Théorème 2, p. 256 (page image; Philippon91 line 88) | `[1:1] ∈ ℙ¹_ℚ`, `s = e_0`, `d = 0` | Philippon: `m(ρf) − m(f) = ∫log(|U_0|/‖x‖) + Σ1/(2α)` = `−½log2 + ½`; README: `m(F) = 0 + ½log2 − ½`; Monte Carlo `−0.1523 ± 0.0009` vs `−0.1534` | same sign and constant |
| Normalisation of Philippon91 against the README | p. 256: `Ω = ∂∂̄log‖x‖/(−iπ)`, `deg V = ∫Ω^{r−1}`; p. 272, Corollaire 4 | `Ω = (i/π)∂∂̄log‖x‖ = (i/2π)∂∂̄log‖x‖²`, mass 1 on `ℙ¹`; `Σ_{α≤n}1/(2α) = ½H_n`; hypothesis `ρ_{u_0}(f) ≢ 0` ⇔ `V ⊄ H_{u_0}` | same as `c_1(Ō(1))`; entry correct |
| 6.1 headline (1), `c(d,n) = ((d+1)/2)H_n` | linear `ℙ^d ⊂ ℙ^n`; `ℙ^n` itself; `n = 0`; `Z = 0` | `ht(det) = ½Σ_{k≤d+1}(ψ(k) − ψ(n+1))`, height `½Σ_{m≤d}H_m`: difference `((d+1)/2)H_n`; `d = n`: `−n/2`; `n = 0`: `0 = 0`; `Z = 0`: `0 = 0` | holds |
| 6.1, degree-two point `X_0² + X_1² = 0` | `F = u_0² + u_1²` | height `log 2`; `m(F)` Monte Carlo `−0.3083 ± 0.0008` vs `log2 − 1 = −0.3069`; difference `1 = c(0,1)·2` | holds |
| 6.1 (i)–(iii), vertical fibre `{X_0 = pX_1}`, `p = 3` | `s = e_0` | `F(e_0,V) = pV_2`; `m(F_Z)` Monte Carlo `0.1505 ± 0.0011` vs `½log10 − 1 = 0.1513`; (iii): `½log(p²+1) − log p − ¼` both sides; height `½log(p²+1) + ½` | holds |
| 6.1, conic `X_1² = 2X_0X_2` (double fibre at 2) | `s = e_1`, `e_0`, `½e_1` | `e_1 × v = (v_2,0,−v_0)`: `F = 2v_0v_2`; `F(e_0,v) = v_2²`; `‖X‖ = |a|² + 2|b|²`: `−∫log‖X_0‖c_1 = 2`; `m(F)` Monte Carlo `−1.002 ± 0.001` vs `−1`; `E log|Σz_k²| = −0.4996` vs `−½` | holds, difference `3` |
| 6.1, Segre quadric in `ℙ³` | `d = 2`, `deg 2` | `E log|u∧v∧w|² = −1/3 − 5/6 = −7/6`; `E log|det| = ½(ψ(1)+ψ(2)) − ψ(4) = −4/3`; `ht = −5/2`; height `1 + 2 = 3`; `c(2,3)·2 = 11/2` | holds |
| 5.1 change of metric | `ℙ¹_ℤ`, trivial `L̄_0`, `f = |x_0|²/‖x‖²`; `f = t`; `f = λ` at one place | recursion: `−∫(log‖s‖ − f) = −∫log‖s‖ + ∫f`; `∫f·c_1 = ½` (uniform law); `f = t`: `[K:ℚ]·t·deg`, the Check of the supplier | holds; sign fixed by `f = t` |
| 6.2 (a5) and (b), a point | `ℚ(i)`, Gram `[[2,i,0],[−i,3,1],[0,1,5]]`, `ξ = (1,−2,3)` | `det = 23`, `ξG⁻¹ξ* = 5.347826 = 123/23` at both embeddings; `0.838345` and `0.088345`; difference `¾ = c(0,2)` | holds |
| 6.2 (a7), headline (3) | `N = 1`; `ℤ²` Gram `[[2,1],[1,3]]`; `J̄(t)`; `ℚ(i)` bundle | `N = 1`: `−deĝ_n(J̄^∨) = deĝ_n(J̄)`; `−½log5 + ½ = −0.304719` both sides; `J̄(t)`: `+Nt` both sides; `−0.317747` both sides | holds |
| 6.2 (b), headline (2), non-diagonal metric | conic `[1:s:s²]`, Gram `[[2,1,0],[1,3,1],[0,1,5]]` | quadrature: `h_J̄(Z) = −0.488375`, standard `1.604601` (`1 + π/(3√3) = 1.604600`); `m_J̄(F)` Monte Carlo `−3.4901 ± 0.0014` vs `−3.48838`; `m(F)` `−1.3975 ± 0.0014` vs `−1.3954`; (a6) term `−2.09297` | holds |
| 6.2 Checks on lattices and places | `M′ = ℤe_1 ⊕ 2ℤe_2`, `[2:1]`; `ℚ(2^{1/3})`, `λ = 0.3`, degree 2 curve | `max(|2|_2,|2|_2) = ½`: both sides drop `log 2`; `2·0.3·2·2/3 = 0.8`, `1·0.3·2·2/3 = 0.4` | holds |
| C02: the consumer's route | HeightsForLogSingularMetrics head, lines 94, 100, 102, 108, 252 | cites 6.2 (a), (a7); the only metric change (a Check) cites the supplier's §5.17a; this README line 418 says its route uses 5.1 | out of date |
| C03: copies of the family index | open family heads | this head's entry at FiniteReductiveGroups and AdelicHeightsAndSuccessiveMinima (whose opening paragraph differs); earlier entry at 13 heads | description contradicted |
| `Suggested.lean` | elaboration; no declaration | exit 0, no message; nothing to probe with one tactic or `#check` | holds |

- Source locators checked against the text: 3. Philippon91 Théorème 2 (p. 256) and Corollaire 4 (p. 272, ending p. 273), read on the page images because the recognised text garbles the formulas (Philippon91 lines 88–90, 866–874); GS90 Theorem 4.2.3 (p. 138, GS90 line 1639).
- Library declarations opened at the pins: `Polynomial.gaussNorm_mul` (`Mathlib/RingTheory/Polynomial/GaussNorm.lean:277`, nonarchimedean `v`, `c > 0`); `AlgebraicGeometry.AlgebraicCycle` (`Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44`); `MeasureTheory.Measure.toSphere` (`Mathlib/MeasureTheory/Constructions/HaarToSphere.lean:52`); `Polynomial.mahlerMeasure` (`Mathlib/Analysis/Polynomial/MahlerMeasure.lean:81`); `TauCeti.AlgebraicGeometry.Chow.ChowGroup` (`TauCeti/AlgebraicGeometry/Chow/Basic.lean:295`); `TauCeti.height2` (`TauCeti/NumberTheory/Height/Arakelov/Basic.lean:65`). Neither library has a Chow form, a Hermitian vector bundle over `O_K`, or arithmetic intersection numbers, so no headline is statable, as the docstring says.
- Cross-roadmap citations resolved: HeightsRationalPointsAndObstructions §§5.9b, 5.17a (open head: Cartier recursion with `−∫log‖s‖`, multilinearity, `[K′:K]` scaling, both Checks used); SlopesOfHermitianVectorBundles §6.6 (i), (ii), (vi) and §6.7a (i) (open head); AlgebraicModuliForArithmeticGeometry §1.6, ArakelovGeometryAndAbelianHeights §§1.1–1.3, 1.5, 1.6, ComplexComparisonPartII C5.4 (`AnalyticCycleIntegration`, `lelongPoincareSection`, with `(i/π)∂∂̄log‖s‖ = [div s] − c₁`) on main; the two consumers at their heads.
- Dependency check: `depcheck: 170 roadmaps, 1988 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: the worker's run passed every check; a rerun without the candidate merge order passes all but the two set aside below.
- Elaboration of `Suggested.lean`: exit 0, no message (no declaration, no `sorry`).
- Outside the folder: only the three files of the family index, which belong to this pull request.
- Signature check with `#check`: not applicable, the file declares nothing.

Overlap check: read SlopesOfHermitianVectorBundles, HeightsForLogSingularMetrics, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, ArakelovGeometryAndAbelianHeightsPartII, SingularHermitianMetricsAndL2Methods (open) and ArakelovGeometryAndAbelianHeights (main). Spherical heights, `ν` and `ht_J̄`: owner SlopesOfHermitianVectorBundles §§6.6, 6.7a, cited. The height of `ℙ(J^∨)` and the comparison with the Chow form: owner this roadmap (6.1, 6.2), cited by the two consumers. Hermitian vector bundles and the Arakelov degree: owner ArakelovGeometryAndAbelianHeights §§1.1–1.6. Arithmetic intersection numbers: owner HeightsRationalPointsAndObstructions §5.17a; the change-of-metric formula 5.1 is stated nowhere else. Nothing shared with the other two.

Source independence: 8 passages compared with 2 sources (6.1 (iii), 6.1 (i), the definition of the Chow form in the Summary, the route of (iii) and the Philippon entry of the References with Philippon91 lines 83–90, 544–556, 755–760, 862–874; 5.1, the GS90 entry and the docstring of `Suggested.lean` with GS90 lines 1627–1659), none shared beyond what the formula forces; the route of (iii), an averaged Poincaré–Lelong formula, is not Philippon's computation. Largest share Philippon91, 4 of 5 locators; contents compared with Philippon91 (§§0–3 and 2 A, B): independent, Layers 5–6 map onto no run of its sections. Bost–Gillet–Soulé could not be read.

Research link: 6.1 is the comparison of Bost–Gillet–Soulé (1994) between the height of a projective cycle and the height of its Chow form; its archimedean part is Philippon's Théorème 2 (1991), which Philippon relates to Faltings' height. It feeds the Hilbert–Samuel inequalities of SlopesOfHermitianVectorBundles §6.7a. Rests on the README and Philippon91 p. 256.

## Not verifiable

- Bost–Gillet–Soulé, J. Amer. Math. Soc. 7 (1994): the sources service found no legal copy (the DOI's landing page is on a host in no licence class). The identity of 6.1 was checked by computation and against Philippon for (iii), not against this text.

Automatic checks set aside as false positives: in a rerun without the candidate merge order, the check of files changed outside the roadmap folder listed the three files of the family index, which belong to this pull request because the roadmap is nested in the family; and the merge-order check reported that the roadmap is not in the merge order on main, which is expected of a roadmap not yet listed there.

## Source issues

- none

## For the human reviewers

- Not tested: Bost–Gillet–Soulé (J. Amer. Math. Soc. 1994), the source credited for the identity of 6.1 (README lines 3, 458), could not be read; wording and arrangement were not compared with it.
- Scope: 5.1 (README line 40) and 6.2 (a1)–(a7), (b) (line 284) say they are proved here and cite no published statement; their routes and Checks were recomputed, not matched to a refereed source.
- Scope and licence: the family index (its lines 9–14) and the description say the family follows a formal Lean proof announced on 20 November 2026, with a public repository; `Suggested.lean` here declares nothing, so no Lean was compared with it.
