# Review of ChowFormsAndHeightsOfSubvarieties (pull request #2891 at d23022b)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ChowFormsAndHeightsOfSubvarieties/`
**Verdict:** accepted

**Summary.** Accepted, with no finding. The repairs are correct: Philippon's Théorème 2 (p. 256; Corollaire 4, p. 272) is exactly 6.1 (iii), with the same constant `½·H_n` and the same normalisations; the new supplier ComplexComparisonPartII C5.4 is on main with the stated normalisation; no roadmap cites the former id 5.17a; and the double ownership of the height of `ℙ(J^∨)` (D01) is settled, now that HeightsForLogSingularMetrics cites 6.2 (a7). Three small corrections remain, none blocking: the identity of 6.1 still has no locator in Bost–Gillet–Soulé; a consumer bullet describes a change-of-metric step that HeightsForLogSingularMetrics no longer has; and one sentence of the description about the copies of the family index does not match the heads. The human reviewers have two things to decide: what to do about Bost–Gillet–Soulé, which could not be read, and the parts that cite no published statement.

## C01 — The identity of 6.1, the first headline, is still credited to Bost–Gillet–Soulé without a theorem or page

A reader can now check 6.1 (iii) against Philippon, but cannot check the global identity against its source. The Summary (line 3) and the References (line 458) name Bost–Gillet–Soulé, J. Amer. Math. Soc. 7 (1994), with no theorem number or page, and 6.1 itself gives no locator. This review again found no legal copy. When a copy is available, add the theorem and page at the claim in 6.1 and in the References. Until then, 6.1 could say, as 5.1 (line 40) and 6.2 (line 284) now do, that the identity is proved here from (i)–(iii), and name Bost–Gillet–Soulé as its published source.

## C02 — The consumer bullet for HeightsForLogSingularMetrics says that the route of its §4.3b (a) uses the change of metric 5.1, but that section no longer has a route of its own

A reader who looks there for a use of 5.1 finds none. At its head, HeightsForLogSingularMetrics §4.3b (a) (its README line 93) says the identity "is used here, not proved" and that it is 6.2 (a7) for `J̄ = Ē^∨`. Its route (line 99) is only that identification. Its *Needs* line (line 101) and its contract with this roadmap (line 251) cite 6.2 (a) and (a7), not 5.1. In the Downstream consumers bullet (line 418), end the sentence after "(the model `Proj Sym E^∨ = ℙ(M_J^∨)` and the metrised `O(1)` are the same)", dropping "and the change of metric in its route is the formula of 5.1".

## C03 — The description names two heads as carrying an earlier family index, but 27 family heads carry the earlier entry for this roadmap, and one of the two named carries the new one

The description says "those at the heads of FiniteReductiveGroups and AdelicHeightsAndSuccessiveMinima are an earlier version". This suggests that every other copy is this one. At the heads, the earlier entry for this roadmap ("Chow forms of projective subvarieties, spherical heights of multihomogeneous forms, …") is in the family index of 27 family pull requests, among them AdelicHeightsAndSuccessiveMinima, HermitianFormsAndLattices and HeightsForLogSingularMetrics. FiniteReductiveGroups (its index, line 117) has the entry of this head. A correct version would read: "The copies are not yet one text: the entry for this roadmap is the one of this head in 14 of them and the earlier one in 27, and they are to be brought to one text before the family merges."

## Deferred findings

- D01 — resolved: HeightsForLogSingularMetrics §4.3b (a) now says "used here, not proved". Its *Needs* line cites 6.2 (a), (a7), and its ownership paragraph leaves this height here.

## Previous findings

- R01 — repaired (deferred as D01, settled outside this folder): HeightsForLogSingularMetrics §4.3b (a) at its head reads "This is used here, not proved: it is ChowFormsAndHeightsOfSubvarieties §6.2 (a7) for the dual bundle `J̄ = Ē^∨`".
- C01 — partly repaired: 6.1 (iii) cites "(Philippon, Théorème 2, p. 256, restated as Corollaire 4, p. 272)" (lines 94–95), and 5.1 and 6.2 say they are proved here (lines 40, 284). The Bost–Gillet–Soulé credit (lines 3, 458) still has no locator (C01 above).
- C02 — repaired: "ComplexComparisonPartII C5.4 (the Poincaré–Lelong formula and integration over analytic cycles, for the Crofton formula of (iii))" is in the *Needs* of 6.1 (line 169) and of 6.2 (line 355), with a contract (lines 448–450).
- C03 — repaired: "ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18 (b) uses 6.1 for the comparison of the self-intersection of the metrised `O(1)` … with its Chow height" (line 417). This matches the route of §8.18 (b) at that head (its line 879).
- C04 — repaired: the family index (lines 111–114) now reads "the change of metric in arithmetic intersection numbers, the comparison of the Fubini–Study height of a projective cycle with the spherical height of its Chow form, and heights of cycles in the projective space of a Hermitian vector bundle".
- C05 — partly repaired: the build sentence is now right ("the file has no declaration and no `sorry`"). The sentence about "identical content" is replaced by one that names two heads as earlier, and the heads contradict it (C03 above).
- N01 — repaired: Layer 5's section is "5.1 Change of metric in arithmetic intersection numbers", every bare id reads 5.1, and no roadmap, on main or at an open head, cites the former id.

## Verified sound

| Statement | Instances tried | Values computed (this side / other side) | Result |
|---|---|---|---|
| 6.1 (iii) against Philippon91 Théorème 2, p. 256, and Corollaire 4, p. 272 | `[1:1] ∈ ℙ¹_ℚ`, `s = e_0`, `d = 0` | README: `m(F) = ½log2 − ½ = −0.153426`, right side `0 + ½log2 − ½ = −0.153426`; Philippon: `m(ρf) − m(f) = ½ − ½log2 = ∫log(|U_0|/‖x‖) + ½H_1` | holds; same sign, same constant |
| 6.1 (iii), a line | `{X_0 = 3X_1} ⊂ ℙ²`, `s = e_0` | `m(F_Z) − m(3V_2) = −0.197320`; `−∫log‖X_0‖c_1 − ¾ = −0.197320` | holds |
| Normalisations of Philippon91 against the README | p. 257: `∫σ_n = 1`; p. 256: `Ω = (i/π)∂∂̄log‖x‖`, `deg V = ∫Ω^{r−1}` | both are probability measures; `Ω` has mass `1` on `ℙ¹`, as `c_1(Ō(1))`; `Σ_{α≤n}1/(2α) = ½H_n` | same normalisation |
| Hypotheses of Théorème 2 against the References entry | prime ideal of `V` (Philippon91 line 544); `ρ_{u_0}(f) ≢ 0` | irreducible `V`, `V ⊄ H_{u_0}`; for `Z` integral over `K`, `Z ⊄ H_s` gives every component of `Z_σ` outside `H_{σ(s)}` | entry correct |
| C5.4 contract, Poincaré–Lelong | `s = z` locally; `X_0` on `ℙ¹` with the Fubini–Study metric | `(i/2π)∂∂̄log|z|² = (i/π)∂∂̄log|z| = δ_0`; `dd^c = (i/π)∂∂̄` would give `2δ_0`; mass `1 − 1 = 0` | matches `lelongPoincareSection` on main |
| 5.1 change of metric (renumbered, unchanged) | `ℙ¹_ℤ`, `f = |x_0|²/‖x‖²` | `∫f·c_1 = E|w_0|² = ½` (Monte Carlo `0.5008`); adding `|x_1|²/‖x‖²` gives `1 = [ℚ:ℚ]·1·deg` | holds |
| 6.2 (a5), (b), a point | `ℚ(i)`, Gram `[[2,i,0],[−i,3,1],[0,1,5]]`, `ξ = (1,−2,3)` | `det = 23`, `ξG⁻¹ξ* = 5.347826 = 123/23`; `0.838345` against `0.088345`, difference `¾ = c(0,2)` | holds |
| 6.2 (a7), the whole space | `ℤ²`, Gram `[[2,1],[1,3]]` | `−½log5 + ½ = −0.304719`; `ht_J̄(det) + c(1,1) = −½ − ½log5 + 1 = −0.304719` | holds |
| 6.2 (a7) = HeightsForLogSingularMetrics §4.3b (a) (D01) | `J̄ = Ē^∨` of rank `n`; `Ē = ℤ²` | `−nμ̂ + ½(nH_n − n)` = its `Ō(1)^n/[K:ℚ]`; `½` on both sides | one statement, now one owner |
| C02: the consumer's route | HeightsForLogSingularMetrics head, lines 93, 99, 101, 251 | cites 6.2 (a), (a7) only, with no change-of-metric step; README line 418 says it uses 5.1 | out of date |
| C03: copies of the family index | 41 family heads | earlier entry in 27 (among them AdelicHeightsAndSuccessiveMinima), new entry in 14 (among them FiniteReductiveGroups); the description names those two as earlier | contradicted |
| `Suggested.lean` | `lake env lean`; file unchanged since 6ac76a4 | exit 0, no message; no declaration to probe or `#check` | holds |

The rows for the statements this change leaves untouched (the 6.1 headline and its Checks, 6.2 (a4), (a6), (b) and their Checks) stand as in the previous review, of 6ac76a4.

- Source locators checked against the text: 3. Philippon91 Théorème 2 (p. 256) and Corollaire 4 (p. 272, statement ending on p. 273), read on the page images of the GDZ scan of the published version, with the measure normalisation on p. 257. GS90 Theorem 4.2.3 (p. 138, GS90 line 1639), the intersection product on a regular arithmetic variety with quasi-projective generic fibre.
- Library declarations opened: none new. `Suggested.lean` is unchanged.
- Cross-roadmap citations resolved: ComplexComparisonPartII C5.4, `AnalyticCycleIntegration` and `lelongPoincareSection` (main, its README §C5.4). ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §§8.18 (b), 8.18e and its contract (head). HeightsForLogSingularMetrics §4.3b (a), with its *Needs*, ownership and contract (head). No roadmap, on main or at an open head, cites this roadmap's former id 5.17a.
- Dependency check: `depcheck: 171 roadmaps, 1992 edges, 0 problem(s)` (no UPWARD or CYCLE line).
- Automatic checks: the worker's run passed every check. A rerun here passes every check except the two set aside below.
- Elaboration of `Suggested.lean`: exit 0, no message.
- Outside the folder: only the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, with its `Suggested.lean` and `metadata.toml`), which belongs to this pull request. The change since 6ac76a4 rewrites one entry of it (C04 of the previous report).

Overlap check: read again, for the objects this change touches, HeightsForLogSingularMetrics and ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties (open heads), SlopesOfHermitianVectorBundles, ArakelovGeometryAndAbelianHeightsPartII and SingularHermitianMetricsAndL2Methods (open), and ArakelovGeometryAndAbelianHeights (main). The height of `ℙ(J^∨)`: owner this roadmap, 6.2 (a7), which HeightsForLogSingularMetrics §4.3b (a) now cites. Poincaré–Lelong and integration over analytic cycles: owner ComplexComparisonPartII C5.4 (main), cited here and by the other two that use it. Spherical heights and `ν`: owner SlopesOfHermitianVectorBundles §6.6. Hermitian vector bundles and their degree: owner ArakelovGeometryAndAbelianHeights §§1.1–1.6.

Source independence: changed passages only. 4 passages compared with 2 sources: 6.1 (iii) and the Philippon entry of the References with Philippon91 line 88 and p. 272; the GS90 entry with GS90 line 1639; the new route sentences of 5.1 and 6.2 with both. None shared; the C5.4 contract follows ComplexComparisonPartII, a roadmap of this project. Largest share Philippon91, 4 of 5 locator citations. No layer was added, removed or reordered, so the arrangement was not compared again (Layers 5–6 against Philippon91 §§0–3: independent). Bost–Gillet–Soulé could not be read.

Research link: 6.1 is Bost–Gillet–Soulé's (1994) comparison of the Fubini–Study height of a cycle with the spherical height of its Chow form; its archimedean part 6.1 (iii) is Philippon's Théorème 2 (1991). In this family it turns SlopesOfHermitianVectorBundles §§6.7–6.7a into height bounds in ArithmeticVolumes… §§8.18, 8.18e. Rests on the README and Philippon91 p. 256.

## Not verifiable

- Bost–Gillet–Soulé, J. Amer. Math. Soc. 7 (1994): the sources service found no legal copy (the DOI landing page is on a host in no licence class). The identity of 6.1 was not checked against it.

Automatic checks set aside as false positives: the check of files changed outside the roadmap folder listed the three files of the family index, which belong to this pull request because the roadmap is nested in the family; the merge-order check reported that the roadmap is not yet in the merge order, which is expected for a roadmap the order does not list yet.

## Source issues

- none

## For the human reviewers

- Not tested: Bost–Gillet–Soulé (J. Amer. Math. Soc. 1994), the source of the identity of 6.1, could not be read (the AMS host is not classified by the sources service). Neither wording nor arrangement was compared with it.
- Scope: 5.1 (README line 40) and 6.2 (a1)–(a7), (b) (line 284) say they are proved here and cite no published statement. The family index (lines 9–14) says the family follows a formal proof announced on 20 November 2026.
