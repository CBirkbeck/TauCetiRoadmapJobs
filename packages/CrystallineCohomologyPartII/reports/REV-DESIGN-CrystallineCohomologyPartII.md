<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/296#issuecomment-6366656826 -->
Review (claude) of 84ea77e

Verdict: needs changes

1. **F01** (P1) Gap G1 has no supplier, bundles three theorems and hides targets owned here

   **Location.** `packages/CrystallineCohomologyPartII/design/plan.json` line 4651 (gap `CrystallineCohomologyPartII/G1`, no `supplier` or `section`); `design/README.md` line 2288: "Kollár's book is neither freely available nor in the cleared library, so the proofs were not read; the statements are planned as targets with these locators."

   **Claim.** G1 is a declared supplier gap.

   **Witness.** The intake reads supplier `none`; the `needs` bundles field-extension invariance, the chain criterion and CH_0 = ℤ. The README itself plans them as WV.6 targets. Tan18 line 1183 proves base-change invariance only for proper, geometrically normal, geometrically connected varieties.

   **Repair.** Delete G1 from plan.json `gaps` and from the README's Gaps list; keep `WV.6/rationally-chain-connected` and `WV.6/rcc-chow-zero-triviality` as targets owned here. State the base-change API for proper, geometrically normal, geometrically connected X with locator Tan18 Proposition A.4 (arXiv v3, p. 30; now certified in `sources.toml`), which covers every consumer (all are smooth projective geometrically connected). Cite Kollár IV.3.2.5, IV.3.6, IV.3.13.3 and V.2.13 by locator only (Kol96 is now recorded `uncertified`) and ESN03 §1 p. 2 (ESN03 lines 70–76) for CH_0 = ℤ. Tested on a smooth cubic surface over F_q: it is proper, geometrically normal and geometrically connected, so Tan18 A.4 applies and CH_0 = ℤ over every algebraically closed L.

2. **F02** (P1) Gap G2 has no supplier, though de Jong 1997 states what is needed

   **Location.** `design/plan.json` line 4660 (gap G2, no `supplier`); `design/README.md` line 2289: "the perfect-field form (with a purely inseparable finite Y′ → Y) is requested from PA.6. de Jong's papers were not read for this plan."

   **Claim.** G2 is a declared gap against AdicCoefficientsAndComparisonsPartII PA.6.

   **Witness.** The intake reads supplier `none`. §PA.6.11 (`packages/AdicCoefficientsAndComparisonsPartII/design/README.md` line 1324) assumes k algebraically closed. dJ97 lines 798–801 (Corollary 5.15, p. 620) cover any excellent base of dimension ≤ 2, including Spec k.

   **Repair.** Choose one. (a) Own the statement here as a WV.5 target, "every integral separated finite-type Y over perfect k has Y′ → Y finite, surjective, purely inseparable with Y′ normal, X″ smooth quasi-projective with a finite group G, and X″/G → Y′ projective birational" (CR12 Remark 4.3.2 p. 79; dJ97 Corollary 5.15 p. 620; dJ96 Corollary 7.4 p. 88, both now certified). Its inputs are ClassicalAdicEtaleCohomology `PlurinodalAlteration.exists` (that roadmap's README line 2721, dJ97 Theorem 5.9 and Corollary 5.10) and AdicCoefficientsAndComparisonsPartII §PA.6.11. (b) Alternatively add `"supplier": "AdicCoefficientsAndComparisonsPartII", "section": "PA.6"` to the gap, with that statement as the single `needs` sentence. Tested on the cuspidal cubic over F_p: Y′ = A¹ (the normalization, a finite universal homeomorphism), X″ = A¹ and G = 1 give a quasi-resolution.

3. **F03** (P1) Serre's Bockstein vanishing is consumed from a supplier section that does not state it

   **Location.** `design/README.md` line 2075: "(b) is Serre's vanishing of Bockstein operations on abelian varieties: V^i: H^g(A, O_A) → H^g(A, W_{i+1}O_A) is injective for all i (requested from AbelianSchemesAndArithmeticModuli:A2)"; Inputs line 2078; Dependencies line 2263; plan.json `requests` line 4589.

   **Claim.** AbelianSchemesAndArithmeticModuli A2 supplies the vanishing.

   **Witness.** A2 (open head 71ecc01, §§A2.1–A2.10: duality, Mumford map, ample cohomology, polarizations, Néron–Severi) has no Witt sheaves or Bocksteins. The request needs this roadmap's WV.0/witt-sheaf, so A2 (merge order 36) would consume a later roadmap: a cycle.

   **Repair.** Add a WV.6 target owned here, `WV.6/serre-bockstein-vanishing`: for an abelian variety A of dimension g over a perfect field and every i ≥ 1, V^i: H^g(A, O_A) → H^g(A, W_{i+1}O_A) is injective. Locators: BBE07 §6.5, p. 36 (BBE07 lines 1543–1546), and Serre 1958, Théorème 2 (listed in `needs-references.toml` as Ser58). Consume only AbelianSchemesAndArithmeticModuli §A2.4 (for h^0(O(Θ)) = 1). Remove the request and `AbelianSchemesAndArithmeticModuli:A2` from Inputs and Dependencies. Tested at g = 1, i = 1: the boundary H^0(E, O) → H^1(E, O) of 0 → O → W_2O → O → 0 vanishes because H^0(E, W_2O) = W_2(k) → k is onto, so V is injective.

4. **F04** (P1) WV.0/witt-limit-lemmas (3) is false for non-proper morphisms

   **Location.** `design/README.md` line 334, with f "a morphism between separated k-schemes of finite type": "(3) R^if_\*(WI) = 0 for i > m := max_{y∈Y} dim f^{−1}(y)." The same text is in plan.json line 930.

   **Claim.** Witt direct images vanish above the maximal fibre dimension for every such f.

   **Witness.** For j: U = A²∖{0} → A² and I = O_U, m = 0. The Teichmüller class of x⁻¹y⁻¹ is nonzero in H¹(U, W_nO) for all n (its first component lies outside k[x^±,y] + k[x,y^±]), so R¹j_\*WO_U ≠ 0.

   **Repair.** Add "f proper" to (3). The vanishing of R^if_\*(W_nI) above the fibre dimension is the proper-only `proper_fibreDimension_vanishing` of SchemeAndStackFoundations §2.6. State separately the case Y = Spec k for every separated finite-type X, which follows from Grothendieck vanishing for i > dim X; that is the only use (WV.2/compact-support-finiteness, step 3). Add the open immersion above as a negative-control Check. This is GNT19's error (see Source issues).

5. **F05** (P1) A Check gives the wrong dimension of H¹(A, WO_A)_K

   **Location.** `design/README.md` line 1045 (and line 1115; plan.json line 2204): "For an abelian variety A of dimension g and p-rank f, H¹(A, WO_A)_K has dimension f (the slope-0 part of H¹_crys)."

   **Claim.** The Check tests WV.3/smooth-proper-slope-identification.

   **Witness.** H¹(A, WO_A)_K is the slope-[0,1) part of H¹_crys; slope 1 occurs f times among 2g slopes, giving 2g − f. A supersingular elliptic curve gives 2, not 0, as lines 377 and 1073 say; line 1778 says at least g.

   **Repair.** Replace with "has dimension 2g − f: all of H¹_crys(A)_K except its slope-1 part, which has dimension f". Tested at g = 1: an ordinary curve gives 2 − 1 = 1 and a supersingular one 2 − 0 = 2, agreeing with lines 377 and 1073.

6. **F06** (P2) WV.0 and WV.4 re-plan constructions of the parent roadmap

   **Location.** `design/README.md` line 21: "WV.0 constructs W_nX for arbitrary schemes in characteristic p and states its agreement with §0.26 on perfect schemes. Nothing upstream treats Witt vector cohomology…". See also the API at lines 104–105 and 111, WV.4/witt-canonical-system item (4) at line 1133 and API line 1156, and plan.json `upstreamNotes` line 4735.

   **Claim.** Only SchemeAndStackFoundations §0.26 (perfect schemes) exists upstream.

   **Witness.** The parent (open head 013a921) line 5832 (CR.4.6) defines `Crystalline.wittScheme r X` = (|X|, W_r O_X) with `_affine`, `_one`, `_perfect` and functoriality. Line 5993 has affine W_r(I), and lines 7157–7158 have `Crystalline.crysTrace_iso` (Ekedahl's W_nΩ^d ≅ f_n^!W_n[−d]).

   **Repair.**
   - WV.0/witt-sheaf: delete the Witt-scheme construction and the API items `wittScheme`, `wittScheme_map` (the functoriality part) and `wittScheme_perfect`, and the affine form of `wittIdeal`. Cite CR.4.6 by name and keep only what is new here: the Witt ideal sheaves on W_nX, the transfer of finite type and properness, the R^if_\* comparison and the Rlim formula.
   - WV.4/witt-canonical-system: cite `Crystalline.crysTrace_iso` and `crysTrace_etale_local` (CR.3:duality.1) for item (4).
   - Rewrite line 21 and the plan.json upstream note.

   Test: for X = Spec F_p[t] and r = 2, the parent's Check computes the open D(t) as W_2(F_p[t, t⁻¹]), the same object that `wittScheme_affine` would build here.

7. **F07** (P2) WV.4 and WV.5 drop CR12's standing quasi-projectivity

   **Location.** `design/README.md`:
   - line 1188: "Let Sm\*/S be the category of pairs (X, Φ) with X an S-scheme smooth over k";
   - line 1436: "A normal equidimensional k-scheme of finite type";
   - line 1485: "Every integral k-scheme of finite type Y admits a quasi-resolution";
   - line 1592: "S integral of finite type".

   **Claim.** CR12's results hold for separated finite-type schemes.

   **Witness.** CR12 line 1785 (§2, p. 37), line 2284 (§3, p. 46) and line 3447 (§4, p. 72) each assume all schemes quasi-projective over k. The introduction's C_S (CR12 lines 105–106) uses smooth quasi-projective S-schemes.

   **Repair.** Add "quasi-projective over k" to the hypotheses (and to the plan.json `hypotheses`) of WV.4/witt-canonical-system, hodge-witt-pushforward, hodge-witt-cycle-class, hodge-witt-correspondence-action, correspondence-vanishing, and of every WV.5 target. Alternatively, add one target reducing finite-type S to its affine opens, with its own proof: WO-rationality is Zariski-local, and a quasi-resolution of an affine S is projective over S, hence quasi-projective. The WV.6 point counts concern projective schemes and are unaffected. Test for the reduction: S = Spec A affine and X → S projective give X quasi-projective over k.

8. **F08** (P2) The Frobenius-factorization supplier is narrower than WV.0 (i) and WV.1 use

   **Location.** `design/README.md` line 278: "(i) Let f: X → Y be a finite, finitely presented universal homeomorphism of qcqs F_p-schemes", with proof line 288 citing `SchemeAndStackFoundations:SF.0/frobenius-factors-through-universal-homeomorphism`. WV.1 works over "a noetherian F_p-scheme of finite Krull dimension" (line 539).

   **Claim.** SchemeAndStackFoundations §0.26 supplies the factorization in this generality.

   **Witness.** `TauCetiRoadmap/SchemeAndStackFoundations/README.md` lines 1677–1679 (§0.26) state it only for F_p-schemes of finite type. Spec F_p(t^{1/p}) → Spec F_p(t) is finite, finitely presented and a universal homeomorphism, but neither scheme is of finite type over F_p.

   **Repair.** Own a WV.0 lemma stating the finitely presented qcqs form with both identities f∘g = F_Y^N and g∘f = F_X^N, with an exact Stacks project locator; use it in (i), WV.1/witt-pushout and WV.1/frobenius-inverted-witt-h-descent. Alternatively declare a gap to SchemeAndStackFoundations §0.26 with that `needs`, or restrict (i) and WV.1 to bases of finite type over F_p and say so. Tested on F_p(t) ⊂ F_p(t^{1/p}): g\*(b) = b^p gives g\*∘f\* = F and f\*∘g\* = F with N = 1.

9. **F09** (P2) The cone corollary of WV.5/isolated-singularity-criterion lacks geometric connectedness

   **Location.** `design/README.md` line 1763: "In particular the cone over a smooth projective variety Z ⊂ P^N (with a resolution by the blowup of the vertex, E ≅ Z) is WO-rational iff H^i(Z, WO_{Z,ℚ}) = 0 for i > 0."

   **Claim.** For every smooth projective Z.

   **Witness.** For q odd and a a non-square, Z = V(x² − ay²) ⊂ P¹ is a point with residue field F_{q²}, a variety in GNT19's sense. H^{>0}(Z) = 0, but the cone fails condition (1): W(F_q)_ℚ → W(F_{q²})_ℚ is not onto.

   **Repair.** Add "Z geometrically connected". When the cone is not normal (Z not projectively normal), prove condition (1) through WV.0/witt-universal-homeomorphism-invariance (ii), since the blowup of the vertex then has connected fibres. Add this cone as a negative-control Check. With the added hypothesis the witness is excluded: Z ⊗ F_{q²} is two points.

10. **F10** (P3) Supplier citations that do not exist where they are cited

   **Location.** Inputs and proofs throughout. The table lists each citation, what was found at the cited place, and the repair.

   | Cited | Found at the cited place | Repair |
   | --- | --- | --- |
   | `CrystallineCohomology:CR.0/pd-envelope`, `CR.0/completed-envelope` (lines 916–919) | The parent has no layer CR.0 | DerivedDeRhamCohomology §PD.6: *Universal base-compatible divided power envelope*, and *Completed PD envelopes and the derived-completion comparison* (line 2667 at head 83d00dd) |
   | `AdicSpacesPartII:F0/graded-cohomology-finiteness` (lines 17, 628, 816) | AdicSpacesPartII has no F0 | AdicSpacesPartIII §F0.6, *graded-cohomology-finiteness* (main README lines 3012–3020) |
   | `PadicDifferentialEquationsAndRigidCohomology:RD.7/tube-to-envelope-comparison-map`, `RD.7/comparison-map-quasi-isomorphism`, `RD.7/rigid-crystalline-comparison` | These are in RD.4, not RD.7 | §§RD.4.36, RD.4.37, RD.4.38 |
   | `AdicCoefficientsAndComparisons:L2/nagata-factorisation-as-used-in-27-4` (line 689) | Consumer only (its README line 110) | Owner: EtaleCohomologyFoundations §G.2, `nagataCompactification` (main, lines 105–107) |
   | `ArithmeticGaloisDuality:R02.1/mittag-leffler-lim-one` (lines 92, 342) | R02.1.1 consumes it | Owner: DerivedModuleAlgebra §1.T.1 (main, line 1403) |
   | `SchemeAndStackFoundations:SF.0/ferrand-pushout` (lines 480, 494) | Not in SchemeAndStackFoundations | NeronModelsAndSemistableAbelianVarietiesPartII §1.1, *ferrand geometric pushouts* (line 263). Only a unit test uses it, so drop it from the Inputs of WV.1/witt-pushout |
   | `SchemeAndStackFoundations:SF.0/finite-locally-free-trace` (line 1201) | No such Layer 0 item | SchemeAndStackFoundations §2.21 `trace_finite`, or CR12 Proposition 2.3.4 (Gros) |
   | `SchemeAndStackFoundations:SF.1/qcoh-fpqc-descent`, used for cohomological descent (lines 422, 812) | §1.1 proves only that QCoh is a stack | EnhancedDerivedSheaves §E2.8 `descendableCover_fppf` with `moduleDescent` (main) |
   | `SchemeAndStackFoundations:SF.5/finite-flat-degree` (lines 1795, 2102) | Not stated in §5 | MotivesAndAlgebraicCycles §2.2 (line 357), whose statement is the torsion kernel to an algebraic closure that is actually used |
   | "Chow groups of SF.5 with supports" (line 1295) | §5 has no supports | Define CH(X, Φ) in WV.4/proper-correspondence-category (CR11 Definition 1.1.14, p. 10) |
   | `PadicDifferentialEquationsAndRigidCohomology:RD.5/proper-hypercover-descent-spectral-sequence` for compact supports (line 1065) | RD.5.74 is stated for H_rig without supports | Say that X and Y = X∖U are proper, and obtain the compact-support form from RD.5.74 for X and for Y together with excision RD.4.19 |
   | "(its layer CR.7)" (line 9) | CR.7 is coefficients and relative cohomology | The parent's *Scope and ownership*, "Not here" (lines 184–193) |

   The remaining atlas identifiers resolve; their section numbers are listed under Verified sound for the package README's `*Needs:*` lines.

11. **F11** (P3) Cite what MotivesAndAlgebraicCycles and Mathlib already state

   **Location.** WV.5/bloch-srinivas-decomposition (line 1787); WV.0/witt-sheaf API lines 101–107; WV.0/frobenius-inverted-witt, step 2 (line 211).

   **Witness.** MotivesAndAlgebraicCycles (open head b6d1d37), §0.6, README line 181, decomposes the diagonal NΔ_X = Γ_D + Γ_Y from a support of CH_0 over the algebraic closure of k(X). Mathlib at 6b7abb3c has `WittVector.frobenius_verschiebung`, `verschiebung_mul_frobenius`, `verschiebung_frobenius` (`Mathlib/RingTheory/WittVector/Identities.lean` lines 44, 99, 138) and `WittVector.map_surjective` (`Basic.lean` line 263).

   **Repair.** In WV.5/bloch-srinivas-decomposition, cite MotivesAndAlgebraicCycles §0.6 and keep only the rational-coefficient variant, with one clause saying how it differs (that section assumes integral support). Cite the three Mathlib identities for FV = p, V(x·F(y)) = V(x)·y and VF = p, and `map_surjective` for the exactness of 0 → W(I) → W(A) → W(A/I) → 0. Test: P^d satisfies both versions with N = 1.

12. **F12** (P3) Checks that are wrong, vacuous or underspecified

   - **Lines 820 and 837 (nodal cubic, N = 1).** BBE07 lines 733–734 give isomorphisms only for q < N. With N = 1 the truncated complex for X_1 = P¹ ⊔ {2 points} has H¹ = K³, not K. Use N = 2.
   - **Lines 637 and 832 (Bl_0 A²).** Here R¹f_\*(I′^r) = ⊕_{m≥0} H¹(P¹, O(m+r)) = 0 for every r ≥ 0, so "R¹f_\*(I′) need not vanish" is false for this example. Use the cone over a canonically embedded non-hyperelliptic curve C, where H¹(C, ω_C) = k sits in R¹f_\*(I′).
   - **Line 638 (double cover).** The Check is vacuous if f is itself finite. Require f to be non-finite with U′ → U finite.
   - **Lines 2008 and 2271.** "A²/{±1}" is A² when p = 2. Write the cone as xy = z², or add "p odd".
   - **Lines 1984 and 2270 (Igusa surface).** Add BBE's data from BBE07 lines 1712–1716: E₁ has an F_q-point t of order 2, and G acts by (x, y) ↦ (x + t, −y).
   - **Line 1586.** The clause "in particular, if S has a resolution of singularities, S is WO-rational iff R^if_\*WO_{X,ℚ} = 0" needs "S normal", as API line 1607 has. For the nodal cubic, the normalization has R^{>0} = 0, yet condition (1) fails at the node.

13. **F13** (P3) Process words, atlas vocabulary and README shape

   - **Process words.** Line 48 ("the packet", "PAPER-BHATT-SCHOLZE-17/E52"); line 23 ("paper extractions"); lines 40–46 ("Read:", "the published version was not obtained", "could not be retrieved"); "not read for this plan" at lines 1016, 1140, 2149, 2195, 2288, 2289 and 2309; lines 2296–2297 (extraction ids); "atlas supplier" (line 2289); plan.json line 4722 ("(issue #3444)").
   - **Notation and vocabulary.** LaTeX `\overline` at lines 2135 and 2205. "Planets" headings are atlas vocabulary.
   - **Checks and API.** Unit tests carry Lean names (for example line 115, `wittScheme_point`), whereas Checks should be prose. Prop-valued predicates are labelled "(data)" (lines 163, 1453–1455, 1604–1605, 2109, 2155). The name `wittIdeal` is used twice (lines 99 and 101).
   - **Line 23.** It names `CrystallineCohomologyConvergentPartII` and `CrystallineCohomologyPartIICartierFlows`; neither has a package, job or pull request. The parent's scope (lines 190–193) promises convergent descent and Cartier transforms to this roadmap. State the split as a restructure proposal for the operator.
   - **Convention 7.** It calls a universal homeomorphism "finite, surjective and radicial", but SchemeAndStackFoundations §0.23 imposes no finiteness. Write "finite universal homeomorphism" where finiteness is meant.
   - **Package stage.** The README needs the `# Roadmap:` form, `## Exact supplier contracts`, prose layers with `*Needs:*` lines, and `## Downstream consumers`.

14. **F14** (P3) Sources manifest was absent and the baseline pins are stale

   - **Sources manifest.** `packages/CrystallineCohomologyPartII/sources.toml` did not exist. The sources service has now recorded 14 entries: 12 certified (BBE07, BS17, CR12, CR11, GNT19, NT20, ESN03, HW23 at arXiv v2, Tan18, dJ97, dJ96, Gro85) and 2 uncertified (Eke84, Kol96). The author must add the other cited works with locators: Ekedahl II, Ekedahl (Toulouse 1985), Serre's two 1958 papers, Ax 1964, Bloch–Srinivas 1983, Chiarellotto–Tsuzuki and Tsuzuki.
   - **Baseline pins.** plan.json lines 17–18 record TauCeti f7904748 and Mathlib 082e2d37, whereas `lake-manifest.json` pins TauCeti a91d3aaf and Mathlib 6b7abb3c. All 19 baseline declarations exist at the real pins (listed below), so only the recorded pins and the "checked" notes need updating.

Reviewed: `packages/CrystallineCohomologyPartII/design/README.md` (2309 lines, 58 targets), `packages/CrystallineCohomologyPartII/design/plan.json` and the sources manifest (absent at the start; the sources service has now created it). Fourteen findings: five P1, four P2, five P3. The mathematics of the core layers (BS17 §11.5, BBE07, CR12, GNT19, ESN03) is faithful and mostly correct. The blocking problems are the two unowned gaps, an unowned Bockstein input, one false lemma copied from GNT19, one false Check, a partial re-plan of the parent roadmap, a dropped source hypothesis, a supplier narrower than its use, and one overclaimed corollary.

## Verified sound

**Gate output.** Run verbatim, it shows no UPWARD or CYCLE line:

```
candidate: CrystallineCohomologyPartII is not in the merge order yet; checked as if placed after PadicDifferentialEquationsAndRigidCohomology (the intake inserts it when its design is accepted)
depcheck: 27 roadmaps, 230 edges, 0 problem(s)
```

The gate does not see two cited suppliers, the board designs ArcTopologyAndDescent and AdicCoefficientsAndComparisonsPartII, because neither is in ORDER.txt yet. Their latest mentioned roadmaps sit at positions 83 and 82, below this roadmap's placement after position 94. Neither cites CrystallineCohomologyPartII, and no board package or open roadmap pull request does either, so there is no cycle. The intake must insert both before this roadmap.

**Seeded sample.** All 15 slots were checked against the text.
1. Inputs of WV.1/witt-fppf-descent: WV.0 targets present; E5:animation.3 on main ✓; SF §1.1 only partly, see R10.
2. Hypotheses of WV.1/witt-fppf-descent ✓.
3. Target WV.1/witt-fppf-descent against BS17 lines 2457–2461 (p. 53). The fppf check on affines before inverting F, and the reduction to W_n by iterated twisted extensions, are faithful; qcqs generality is justified by coconnectivity.
4. Its proof ✓.
5. Hypotheses of WV.4/correspondence-vanishing ✓.
6. Its Inputs: SF §4.19 (perfect k gives a smooth alteration) ✓.
7. Target WV.4/correspondence-vanishing against CR12 lines 3202–3278 (Lemmas 3.6.1–3.6.2 and Remark 3.6.3, pp. 67–68) ✓, including N = degree of the alteration and N = 1 under resolution.
8. Its proof ✓.
9. Named signature `TauCeti.WittCohomology.IsFiniteQuotient` against CR12 line 3700 (Definition 4.2.5, p. 77) ✓. The `TauCetiRoadmap.CrystallineCohomologyPartII` namespace is due at the package stage.
10. Inputs of WV.5/topological-finite-quotient: SF §§0.23 and 0.29 ✓.
11. Planets of WV.5 ✓ (labels only).
12. Hypotheses of WV.5/topological-finite-quotient against CR12 lines 3646–3652 ✓.
13. Proof of WV.5/quasi-resolution-invariance against CR12 lines 3776–3800 (cycles α, β, γ and relations (4.3.1)–(4.3.4)) ✓.
14. Sources of the same target: CR12 Theorem 4.3.3 p. 79, Lemma 4.3.4 p. 80 ✓.
15. Inputs of the same target: SF §5.2 `localization_exact` ✓.

**Locators checked beyond the sample.**

| Source | Locators and line numbers |
| --- | --- |
| BBE07 | Thm 1.1 (line 67, p. 2); Cor 1.2 (129, p. 4); (1.4) and Cor 1.3 (153–163); Thm 1.4 (169, with BBE's definition of theta divisor); Cor 1.5 (177); Cor 1.6 (195); §2 opening (226–246); Prop 2.1 (259–282); Prop 2.2 and Cor 2.3 (285–339); Thm 2.4 (345–356); Prop 2.10 (618, 661–666); Def 3.1 (678–711); Prop 3.2 (722–734); Lemma 5.1 (1207–1278); §5.2 (1279–1412, including that X_n is projective because it is proper over projective X, line 1387); §6.1 (1426–1448); Props 6.2–6.4 (1450–1535); §6.5 (1536–1546); Props 6.8–6.9 (1594–1645); Lemma 6.10 (1650); Cor 6.12 (1689); Remarks 6.13 (1700–1724) |
| BS17 | Thm 11.40 and Prop 11.41 (lines 2387–2389, p. 51); Notation 11.42 to Lemma 11.45 (2395–2451, pp. 52–53); proof of Prop 11.41 (2454–2501, pp. 53–54); §2 Defs 2.1, 2.5, 2.7, Lemma 2.6, Prop 2.8, Thm 2.9 (pp. 4–7) |
| CR12 | §3.7 (lines 3282–3445, Prop 3.7.7 p. 70); Def 2.3.1 (p. 39); Props 2.3.3–2.3.4 (p. 40); 3.2.1 (p. 50); Thm 3.3.10 (p. 56); Prop 3.4.3 (p. 58); Def 3.5.1, Prop 3.5.4, 3.5.6, 3.5.10 (pp. 62–66); 4.1.1 and Prop 4.1.4 (pp. 72–74); Lemmas 4.2.3–4.2.4, Def 4.2.5, Prop 4.2.7 (pp. 77–78); Def 4.3.1 and Remark 4.3.2 (p. 79); §4.4 (Defs 4.4.1, 4.4.2, 4.4.4, 4.4.10; Props 4.4.6, 4.4.9, 4.4.17; Cors 4.4.15–4.4.16; pp. 81–86); Cor 4.5.1 and Def 4.5.2 (pp. 86–87); §4.6 (pp. 89–91); Thm 4.8.1 and Lemma 4.8.3 (pp. 96–97) |
| CR11 | Def 1.1.1 (p. 5); Def 1.1.14 (p. 10); Thm 1.2.3 (p. 13); §1.3 (p. 18) |
| GNT19 | §2.5 (lines 576–692; Remark 2.17, p. 15); Lemmas 2.18–2.22 (pp. 15–17); Prop 2.23 (p. 18); Lemma 2.25 (p. 18); §3 condition (a) (p. 19); Def 4.5 and Remark 4.6 (p. 29) |
| NT20 | §2.1 connected fibres (line 217, p. 5); Remark 2.2 (p. 6); Lemmas 2.17–2.18 (pp. 13–14) |
| ESN03 | (1.1) (p. 1); Thm 1.1 and Cors 1.2–1.3 (pp. 2–3); Lemma 2.1 (p. 4) |
| HW23 | v2 §2 WO-rationality (lines 244–250); Cor 4.6 and its proof (953–991) |
| Gro85 | II, Définition 4.1.7 (line 1483, printed p. 50) |
| dJ96 | Thm 7.3 and Cor 7.4 (pp. 88–89) |
| dJ97 | 5.12, Thm 5.13, Cors 5.14–5.15 (pp. 619–620) |
| Tan18 | Remark 5.3, Prop A.4 |

Source issues E1 and E3 recorded by the author are confirmed. The construction of WV.1/witt-pushout was rechecked; it fills BS17's gap correctly. B′ is finite and Y′ → Y is bijective with trivial residue fields, by J·B′ ⊂ K ⊂ √(J·B′) and B′_j = A_j for j ∈ J. KO_X = JO_X gives E = X ×_{Y′} Z, and the H⁰ square is exact because H¹(X, O(−E)) = 0.

**Library declarations opened at Mathlib 6b7abb3c.**

| Declaration | File and line |
| --- | --- |
| `WittVector` | `RingTheory/WittVector/Defs.lean` 52 |
| `TruncatedWittVector` | `Truncated.lean` 62 |
| `WittVector.frobenius` | `Frobenius.lean` 218 |
| `WittVector.verschiebung` | `Verschiebung.lean` 109 |
| `WittVector.teichmuller` | `Teichmuller.lean` 93 |
| `WittVector.Isocrystal` | `Isocrystal.lean` 113, under `[IsDomain k] [CharP k p] [PerfectRing k p]` |
| identities | `Identities.lean` 44, 99, 138 |
| `map_surjective` | `Basic.lean` 263 |
| `AlgebraicGeometry.Scheme` | `Scheme.lean` 40 |
| `IsFinite` | `Morphisms/Finite.lean` 40 |
| `IsProper` | `Proper.lean` 41 |
| `IsSeparated` | `Separated.lean` 43 |
| `Smooth` | `Smooth.lean` 59 |
| `Surjective` | `UnderlyingMap.lean` 58 |
| `ObjectProperty.IsSerreClass` | `CategoryTheory/Abelian/SerreClass/Basic.lean` 45 |
| `SerreClassLocalization.isZero_obj_iff`, `.abelian` | `Localization.lean` 132 and 415; these need L additive with `[L.IsLocalization P.isoModSerre]` |
| `DerivedCategory` | `Algebra/Homology/DerivedCategory/Basic.lean` 87 |
| `LinearMap.charpoly` | `LinearAlgebra/Charpoly/Basic.lean` 44 |
| `PowerSeries.exp` | `RingTheory/PowerSeries/Exp.lean` 49 |
| `char_dvd_card_solutions_of_sum_lt` | `FieldTheory/ChevalleyWarning.lean` 109 |

Tau Ceti a91d3aaf has no Witt vector cohomology; its "witt" hits are Poincaré–Birkhoff–Witt.

**Cross-roadmap citations resolved (section numbers for the package's `*Needs:*`).**

| Roadmap (copy read) | Atlas identifier → section |
| --- | --- |
| CrystallineCohomology (open head 013a921) | CR.4/witt-structural-identities → CR.4.4 (line 5069); witt-frobenius-lift-universal → CR.4.4 (5118); witt-verschiebung-divided-powers → CR.4.4 (5150); classical-de-rham-witt → CR.4.6 (5606); witt-localization-descent → CR.4.6 (5865); crystalline-comparison → CR.4.7 (6421); isocrystal-slope-decomposition → CR.4.7 (6530); witt-slope-spectral-sequence → CR.4.7 (6610); logarithmic-witt-sheaf → CR.4.8 (6962) |
| PadicDifferentialEquationsAndRigidCohomology (open head 277445c) | RD.3/frame → RD.3.1; tube → RD.3.2; RD.4/monsky-washnitzer-cohomology → RD.4.1 and RD.4.24; overconvergent-de-rham-complex → RD.4.5; compactly-supported → RD.4.12; frobenius-vector-space → RD.4.17; frobenius-on-rigid-cohomology → RD.4.18; excision-sequence → RD.4.19; RD.5/smooth-proper-hypercovering → RD.5.67; cohomological-descent → RD.5.73; descent spectral sequence → RD.5.74; frobenius-bijective → RD.5.77; vanishing above twice the dimension → RD.5.78; poincare-duality → RD.5.89; finiteness with compact supports → RD.5.90; RD.6/closed-points-and-zeta-function → RD.6.22; lefschetz-trace-formula → RD.6.23; slope-interval → RD.6.58; RD.7/rational-zeta-descent-and-fatou → RD.7.4 |
| SchemeAndStackFoundations (main) | universal homeomorphisms §0.23; Nagata rings §0.20; relative Frobenius §0.29; §0.26 (see R08); qcoh higher direct images, projective space, Serre vanishing §2.6; supports §2.7; upper shriek §2.19; Serre duality §2.20; dualising complexes §2.21; Stein factorisation §4.9; domination §4.12; Hilbert schemes §4.14; alterations §4.16; de Jong §4.19; Chow and rational equivalence §5.1; pushforward, pullback, localization and degree §5.2; refined Gysin §5.5 |
| EnhancedDerivedSheaves (main) | E1.3; E1.4; E2.6; E2.8 (inductive level); E5:animation.1–.3 |
| ArcTopologyAndDescent (board design) | §§1.1, 1.3, 1.4 |
| MotivesAndAlgebraicCycles (open head b6d1d37) | MC.0 → §0.1; MC.2/chow-groups-under-field-extension → §2.2 |
| AbelianSchemesAndArithmeticModuli (open head 71ecc01) | A2/ample-cohomology-and-degree → §A2.4 |
| AdicCoefficientsAndComparisonsPartII (board design) | PA.6/de-jong-galois-alteration → §PA.6.11 |

**Duplication audit (by object).** The checks used `roadmaps grep` over main and the 330 open roadmap pull-request heads, including the 26 the brief names, together with the board packages. Patterns covered Witt vector cohomology, Witt- and WO-rational singularities, Frobenius-inverted Witt cohomology (BS17 11.40/11.41), rational chain connectedness, decomposition of the diagonal, Ferrand pinching, Ax–Katz, theta divisors, quasi-resolutions, Chow groups and Hodge–Witt cohomology with supports, and the Witt zeta function and slope factors. The only owners found are the ones raised in R06 and R11 (the parent's Witt schemes and Ekedahl trace, MotivesAndAlgebraicCycles §0.6) and the repointings in R10. This roadmap is the rightful owner of all other targets: no roadmap on main, at an open head, or among the board packages states them.

**Gaps.** Both declared gaps are findings (R01, R02). Neither is a contract the acceptance could be made conditional on.

**Shape.** Every definition and construction has at least three discriminating tests (unit tests plus Checks: 4 to 7 each). Every theorem has hypotheses and a locator, and every layer has Dependencies. Lean form is not applicable at the design stage. Elaboration: not available (this lane does not elaborate). No Suggested.lean exists, so there is no padding probe.

**Headline theorems for the package stage.**
- BS17 Proposition 11.41 (h-descent);
- BBE07 Theorem 1.1, Corollary 1.3 and Corollary 1.5 (Ax–Katz modulo q);
- Serre's theta-divisor congruence;
- CR12 Theorems 4.3.3 and 4.8.1;
- Esnault's vanishing and point count.

Of these, the Ax–Katz congruence |Z(F_{q^s})| ≡ 1 mod q^s for projective intersections with total degree at most n is statable at the pins: Mathlib has only the weaker `char_dvd_card_solutions_of_sum_lt`. The others need rigid cohomology, Witt sheaves, Chow groups of zero-cycles or abelian varieties. Their carriers must be named in the module docstring.

**Adversarial table.** There is one row per statement. "OK" means the computed values agree with the statement.

| # | Statement | Instances | Computed values | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | WV.0/witt-sheaf | Spec F_p, n = 2 | W_2(F_p) = ℤ/p²; p·1 = V(1) ≠ 0 | OK | R06 |
| 2 | rational-witt-sheaves | point; F = ⊕ℤ/p^n; End(WO_ℚ) | F⊗ℚ = 0, q(F) ≠ 0; homs ℤ_p → ℤ_p are p-adically continuous, so End = ℚ_p | OK | — |
| 3 | frobenius-inverted-witt | F_p[ε]/ε²; perfect A; ∅ | F kills W((ε)) (ε^p = 0), giving ℤ_p; F bijective; 0 | OK | R11 |
| 4 | witt-nil-invariance | k[ε]/ε²; F_p[t_i]/(t_i^{p^i}) | H⁰ = K on both sides; (t_1, t_2, …) is killed by no F^c | OK | — |
| 5 | witt-universal-homeomorphism-invariance | F_{q²}/F_q; cusp; F_p(t^{1/p})/F_p(t) | W(F_q)_ℚ ≠ W(F_{q²})_ℚ; cusp gives an isomorphism; last is not of finite type over F_p | (ii), (iii) OK; (i) outruns supplier | R08 |
| 6 | witt-closed-mayer-vietoris | xy = 0; X_1 = X_2 | H⁰ = W(k[x])_K ×_K W(k[y])_K; 0 → A → A² → A → 0 | OK | — |
| 7 | witt-limit-lemmas | j: A²∖0 → A² | m = 0, but R¹j_\*WO ∋ [x⁻¹y⁻¹] ≠ 0 | (3) false | R04 |
| 8 | witt-finiteness-slopes | E ordinary or supersingular; P¹ | dims 1 (slope 0) and 2 (slope 1/2); H¹(P¹) = 0 | OK | — |
| 9 | WV.1/witt-fppf-descent | F_{p²}/F_p | equalizer of (x, x) and (x, σx) is ℤ_p | OK | R10 |
| 10 | affine-derived-self-products | k ⊗^L_{k[t]} k | π_1 = k; W(−)[1/F] = W(k) | OK | — |
| 11 | witt-pushout | J = (f) regular; Y = A², J = (x, y) | B′ = A; H¹(Bl, O(−E)) = ⊕H¹(P¹, O(m+1)) = 0, B′ = k[x, y] | OK | — |
| 12 | witt-blowup-excision | n = 1, Bl_0 A² | H⁰: k[x,y] → k[x,y] ⊕ k → k exact; H^{>0} = 0 | OK | — |
| 13 | frobenius-inverted-witt-h-descent | node normalization; S = Spec F_p(t) | Ỹ ×_Y Ỹ = Ỹ ⊔ 2 points; base not of finite type over F_p | OK given R08 | R08 |
| 14 | rational-witt-h-descent | two branches of a node | Mayer–Vietoris sequence | OK | — |
| 15 | WV.2/witt-ideal-vanishing | Bl_0 A²; canonical cone | R¹f_\*(I′^r) = 0 for all r; for the cone H¹(C, ω) = k is nonzero | OK | Check R12 |
| 16 | witt-exceptional-reduction | A_n tree; elliptic cone | H¹(E, WO_ℚ) = 0 and ≠ 0 | OK | — |
| 17 | witt-compact-support-cohomology | A¹ ⊂ P¹; G_m; ∅ | 0; H¹_c = coker(K → K²) = K; 0 | OK | — |
| 18 | compact-support-finiteness | A² | H^\*_c = 0 while H⁴_{rig,c} = K(−2) (slope 2) | OK | — |
| 19 | simplicial-resolution | nodal cubic; smooth X | X_1 = P¹ ⊔ 2 reduced points (k[[x]] ⊗ k[[x]] over k[[x,y]]/xy is k[[x]]); constant | OK | — |
| 20 | witt-proper-hypercover-descent | nodal cubic, N = 1 vs 2 | truncated H¹ = K³ vs H¹ = K | theorem OK, Check wrong | R12 |
| 21 | WV.3/slope-subspace | F = p^aσ; P = 1 − a_1t + pt² | E^{<1} = E iff a ≤ 0; P^{<1} = 1 − αt, or P if p ∣ a_1 | OK | — |
| 22 | frobenius-lift-witt-map | Spf W, σ; ℤ_p[t], t ↦ t^p | identity on K; s(t) = [t] (ghost components t^{p^i}) | OK | — |
| 23 | rigid-to-witt-morphism | P¹; ordinary E | H²: K(−1) → 0; H¹: kernel is the slope-1 line | OK | — |
| 24 | simplicial-frobenius-embedding | smooth projective X | constant objects satisfy (i)–(iv) | OK | — |
| 25 | smooth-proper-slope-identification | abelian variety (g, f) | dim = 2g − f (1 or 2 for g = 1) | lemma OK, Check false | R05 |
| 26 | berthelot-bloch-esnault-comparison | P¹; nodal cubic; E | K ↔ K; H² has no slope < 1; H¹ = K of slope 0 on both sides | OK | — |
| 27 | affine-witt-vanishing | A¹ ⊂ P¹ | H⁰_c = H¹_c = 0 | OK | — |
| 28 | WV.4/witt-canonical-system | Spec k; P¹; two planes in A⁴ | W_n(k); H¹(Wω) = W(k); depth 1, so H^{−1}(K_1) ≠ 0 | OK | R06, R07 |
| 29 | hodge-witt-pushforward | P¹ → pt; F_{A¹/k} | H¹(WΩ¹) ≅ W(k); F_\*F^\* = p | OK | R07 |
| 30 | hodge-witt-cycle-class | x ∈ P¹; 0 and ∞ | trace 1; ĉl(0) = ĉl(∞) | OK (Gro85 line 1483) | R07 |
| 31 | proper-correspondence-category | A¹ → pt; finite flat h of degree d | Γ not proper over pt, Γ^t is; Γ_h∘Γ_h^t = d·Δ | OK | R10 |
| 32 | hodge-witt-correspondence-action | P¹ × P¹ | [P¹×x] gives (∫α)ĉl(x); [x×P¹] gives id on H⁰(WO); sum id = [Δ] | OK | — |
| 33 | correspondence-vanishing | same, r = 1 | image in p, q ≥ 1; kernel contains p > 0 or q > 0 | OK | — |
| 34 | WV.5/topological-finite-quotient | A²/±1 (p odd); elliptic cone | tame degree 2; cone is not WO-rational, hence excluded | OK | R07 |
| 35 | quasi-resolution | F_{X/k}; E → P¹ of degree 2 | purely inseparable of degree p^{dim X}; separable, so excluded | OK | R02, R07 |
| 36 | finite-quotient-projector | u = F_{X/k} | u_\*u^\* = p^{dim X} | OK | — |
| 37 | quasi-resolution-invariance | quadric cone | exceptional P¹, so R¹ = 0 | OK | R07 |
| 38 | wo-rational-singularities | smooth S; nodal cubic | identity map; R^{>0} = 0 but condition (1) fails | OK with "normal" | R12 |
| 39 | finite-quotients-witt-rational | normalization in L/k(Y) purely inseparable | universal homeomorphism between normal schemes | OK | — |
| 40 | witt-singularity-complexes | elliptic cone | H¹(WS_0) = H¹(E, WO_ℚ) ≠ 0 | OK | — |
| 41 | quasi-birational-witt-invariance | Bl_pt P² vs P² | H^{>0} = 0 for both | OK | — |
| 42 | rational-implies-witt-rational | ℤ/p on V with dim V = 3, V^G = 0 | 3 > 0 + 2, so not CM (CR12 lines 4065–4072) | OK | — |
| 43 | isolated-singularity-criterion | conic cone; cone over degree-2 point | WO-rational; H^{>0} = 0 but (1) fails | main OK, corollary false | R09 |
| 44 | bloch-srinivas-decomposition | P^d; elliptic curve | Δ = Σ h₁^i h₂^{d−i}, the i < d terms lie on P^d × H; CH_0⊗ℚ is huge | OK | R11 |
| 45 | chow-trivial-fibration-vanishing | P^n_Y → Y | R^{>0} = 0 | OK | — |
| 46 | WV.6/witt-zeta-function | pt; P¹; A¹; ∅ | 1/(1−t); 1/(1−t) vs 1/((1−t)(1−qt)); 1 vs 1/(1−qt); 1 | OK | — |
| 47 | slope-zeta-identity | P¹, A¹ | ζ^{<1} = 1/(1−t) and 1 | OK | — |
| 48 | ax-congruence-criterion | N_r = q^r; N_r = 1 | all of (i)–(iv); none | OK | — |
| 49 | witt-isomorphism-point-congruence | Igusa surface (p = 2); A/⟨P⟩ | H²(X, WO_K) ≠ 0 = H²(Y, WO_K) | OK | R12 |
| 50 | witt-rational-point-congruence | quadric cone vs F_2; nodal cubic vs P¹ | q² + q + 1 ≡ (q+1)² ≡ 1; split node q vs q + 1 (not WO-rational, a negative control) | OK | — |
| 51 | low-degree-complete-intersections | conic; cubic surface; linear point | q + 1 ≡ 1; 1 + aq + q² ≡ 1; 1 | OK | — |
| 52 | theta-divisor-criterion | P¹, D a point | (a) 0 = 0, (b) vacuous; 1/(1−t) = 1/(1−t)·1 | OK | — |
| 53 | theta-divisor-congruence | g = 1 | 1 ≡ 1; boundary W_2(k) → k is onto | OK, input unowned | R03 |
| 54 | universal-chow-zero-triviality | P^n; genus ≥ 1 curve over closure of k(C); ∅ | ℚ; class of infinite order; deg not onto | OK | — |
| 55 | rationally-chain-connected | P^n; E; cone | lines; no rational curves; through the vertex | OK | R01 |
| 56 | rcc-chow-zero-triviality | P^n, cubic surface | CH_0 = ℤ | OK (Kollár uncertified) | R01 |
| 57 | esnault-witt-vanishing | P^n; cubic surface | H^{2j} slope j; H² all slope 1 | OK; hypothesis at least as weak as ESN03 Thm 1.1 (lines 52–55) | — |
| 58 | esnault-point-count | P^n; projective quadric cone (ii) | 1 + q + ⋯ + q^n ≡ 1; q² + q + 1 ≡ 1 | OK | — |

**Conventions.**
- Over F_{p^a}, F = pσ gives v_q(p^a) = 1, the slope of F.
- Lefschetz signs (−1)^{i+1} are confirmed on P¹.
- Inverting F and then p is confirmed on F_p[ε].
- The divided powers γ_m(Vx) = (p^{m−1}/m!)V(x^m) are 2-integral at p = 2.

## Not verifiable

- **Kollár, Rational curves on algebraic varieties (IV.3.2.5, IV.3.6, IV.3.13.3, V.2.13).** Paywalled book, recorded `uncertified`. Base change is now covered by Tan18 Prop A.4, with narrower hypotheses (R01).
- **Ekedahl, Ark. Mat. 22 (1984).** Springer paywall, recorded `uncertified`. Ekedahl II and Toulouse 1985 were not fetched; the parent roadmap carries the smooth statements.
- **Serre 1958 (Théorème 2) and the Mexico symposium paper.** No legal copy was found; listed as Ser58 in `needs-references.toml`.
- **Ax 1964, Bloch–Srinivas 1983, Chiarellotto–Tsuzuki and Tsuzuki (BBE07's [10], [27], [28]).** Paywalled and cited only through BBE07, CR12 and ESN03; not fetched.
- **HW23, published version.** The host is not in the service's licence classes, so arXiv v2 was read. Corollary 1.3 and its proof, and the published reference entry behind E2, could not be checked. E10 and E11 are not verified; E14 is verified in v2 (see Source issues).
- **Elaboration.** Not available (this lane does not elaborate), and there is no Suggested.lean at the design stage.

## Source issues

- **Error** in GNT19 at Lemma 2.20, p. 16: the source says Witt direct images vanish above the maximal fibre dimension for any morphism of separated finite-type schemes; it should be stated for proper f, since an open immersion A²∖0 → A² has a nonzero first direct image; affects a stated result.
- **Gap** in BS17 at proof of Proposition 11.41, p. 53: the source says a scheme pushout of the blowup along the non-finite exceptional map exists and is a finite universal homeomorphism over Y; it should be constructed, for instance as the spectrum of H⁰(X, O) ×_{H⁰(E, O)} A/J; affects the proof.
- **Misprint** in CR12 at Corollary 4.5.1, p. 86: the source says the two quasi-resolutions are quasi-birational over X; it should be over S, as the proof shows; affects nothing.
- **Misprint** in GNT19 at Proposition 2.23, p. 18: the source says the ideal of the structure sheaf of X is an ideal sheaf on Y; it should be an ideal sheaf on X whose zero set contains the exceptional locus; affects nothing.
- **Misprint** in HW23 at Corollary 4.6 proof (arXiv v2; published Corollary 4.7), p. 21: the source says the restrictions of the divisorial contraction to S and its normalization map to X; it should be the contraction target Z; affects nothing.
- **Misprint** in CR12 at Introduction, p. 6: the source says the cone over any smooth projective scheme is WO-rational exactly when its higher rational Witt cohomology vanishes; it should be restricted to geometrically connected schemes, as Theorem 4.7.4 (p. 93) is; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "84ea77e", "job": "REV-DESIGN-CrystallineCohomologyPartII", "model": "opus", "worker": "fable-rev10"} -->
