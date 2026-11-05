<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1547#issuecomment-6637284583 -->
Red team round 2 pass b (claude) of 66aaeba

Verdict: needs_changes

1. **F01** (P2) PhiGammaModulesAndIwasawaCohomology §4.0 and three cited declarations do not exist at the supplier's head

   **Location.** `packages/TriangulineVarietyAndItsLocalModel/README.md` line 67: "Use §4.0 for the rigid character spaces: W=`compactCharacterSpace` of O_K× and T=`localMultiplicativeCharacterSpace` K … Weights of Artinian-valued characters are §7.3's `CharacterWeights`." Also line 14, the gap line 69 ("§§4.0, 7.3"), the `*Needs:*` lines 359, 497, 545, 741, 991, 1057, 1093, 1159, 1561, the Dependencies lines 483, 611, 883, 1145, 1353, 1741, and `design/plan.json` line 6451 (`"section": "§§4.0, 7.3"` of gap `general-character-spaces`).

   **Claim.** PhiGammaModulesAndIwasawaCohomology §4.0 supplies the rigid character spaces of O_K× and K× through the two named declarations, and §7.3 declares `CharacterWeights`.

   **Witness.** PhiGammaModulesAndIwasawaCohomology at #1310's head: Layer 4 has sections 4.2–4.5 only, "4.0" occurs nowhere; the character spaces are "### 2.7 Compact character spaces and scalar Mellin coordinates"; none of the three names occurs in its README or Suggested.lean.

   **Detail.** §2.7 there reads "construct the compact character space W_G … For K^× use K^×≃ϖ_K^ℤ×O_Kˣ to construct the character space of Kˣ as the unit character space times G_m … Export the rigid character space and its universal, component, pullback and finite-base-change API". Its Suggested.lean declares only `truncatedWittFrobenius` and `wittProjective_of_flat_phi`; §7.3 defines wt(δ) in prose without a name. The round-1 pass b found §4.0 and the three names at the head of 2026-10-26, so the supplier was rewritten since. The intake would announce the gap on a section that does not exist.

   **Repair.** Replace every "PhiGammaModulesAndIwasawaCohomology §4.0" (and "4.0" in the lists at lines 14 and 69 and in the Dependencies lines) by "§2.7"; in `design/plan.json` set the gap's section to "§§2.7, 7.3". Rewrite line 67 as: "Use §2.7 for the rigid character spaces: W the compact character space of O_K× and T the character space of K×, built there as W×G_m through K×≃ϖ_K^ℤ×O_K×, base-changed to E, with their universal characters, generator and uniformizer changes, evaluation and finite coefficient extension. … Weights of Artinian-valued characters are §7.3's weight function wt(δ)." Test: each property line 67 attributes to §4.0 (d open-disc coordinates on a principal subgroup, finite-torsion components kept, T=W×G_m, uniformizer independence) is stated in §2.7 at its head, and the K=ℚ₂ instance (ℤ₂×={±1}×(1+4ℤ₂): two components, each one open disc, values ±1 at −1) is unchanged.

2. **F02** (P3) PadicHodgeTheory declares no `fullRankQuotient_H0`

   **Location.** `packages/TriangulineVarietyAndItsLocalModel/README.md` line 51: "Section 4.5's `fullRankQuotient_H0` identifies H⁰(M/N) for an equal-rank inclusion with the invariants of the quotient of positive period lattices".

   **Claim.** PadicHodgeTheory §4.5 declares a Lean name `fullRankQuotient_H0`.

   **Witness.** PadicHodgeTheory at #1062's head: the string occurs in neither README.md nor Suggested.lean (which declares only `IsTateTwist` and `potentiallyMultiplicativeTwistReduction`); the statement is prose in §4.5: "For a full-rank inclusion N⊂M of B-pairs, identify Herr H^0(M/N) … (Ding, Lemma 2.1, p. 10)."

   **Repair.** Replace the backticked name by prose: "Section 4.5's full-rank quotient invariant identifies H⁰(M/N) …", keeping the Ding25 Lemma 2.1 locator. Test: §§10.3, 10.4, 12.5, 13.2 use only the statement (Ding25 line 421–424, whose kernel of dimension d_K is §10.4's annihilator), not a name.

3. **F03** (P3) The stated pinned revisions are stale

   **Location.** `packages/TriangulineVarietyAndItsLocalModel/README.md` line 47: "The pinned library revisions are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039."

   **Claim.** Those are the pins.

   **Witness.** The content repository's `lake-manifest.json` pins mathlib f6090c7095e1 and TauCeti 358314d4ab97; its last manifest commits are "bump the Tau Ceti pin to a91d3aa (#701)" then "bump the Tau Ceti pin to 358314d".

   **Detail.** The eight Mathlib line locators of line 43 were re-checked at f6090c70 and all hold: `LinearMap.prod` Prod.lean:95, `range` Range.lean:57, `ker` Ker.lean:59, `finrank_range_add_finrank_ker` Lemmas.lean:173, `finrank_sup_add_finrank_inf_eq` Lemmas.lean:53, `AdicCompletion` Basic.lean:171, `Module.length` Length.lean:30, `AlgebraicCycle` Basic.lean:44.

   **Repair.** Replace the two hashes by f6090c7095e1e56b3464c1daba5f24631f1290d2 and 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a (the manifest's values at submission). Test: the eight locators above are unchanged at that Mathlib.

4. **F04** (P3) §3.4 restates PhiGammaModulesAndIwasawaCohomology §3.9's localized Artinian category without citing it

   **Location.** `packages/TriangulineVarietyAndItsLocalModel/README.md` line 433: "Here M is finite free over R_(A,K)[1/t] and contains a φ,Γ-stable R_K-lattice, which need not be free over R_(A,K)"; Needs line 439 lists PadicHodgeTheory §§4.4–4.5, 5.2, PhiGamma §1.0c, §3.2 and gap:artinian-b-pairs only.

   **Claim.** The category on which §3.4 defines W_dR is this roadmap's or the PadicHodgeTheory gap's.

   **Witness.** PhiGamma #1310 §3.9: "Let A be a finite local E-algebra and let M be finite free over R_{A,K}[1/t], with a stable finite-projective underlying R_K lattice D … Do not infer that an R_A-stable lattice exists … Lemma 3.3.5, pp.344–345, supplies the localized de Rham realization."

   **Detail.** That is §3.4's category hypothesis for hypothesis, citing the same BHS19 Lemma 3.3.5 (BHS19 line 1840); the README already imports §3.9 in §5.1 (line 625) for the localized Herr complex.

   **Repair.** Add "PhiGammaModulesAndIwasawaCohomology §3.9" to §3.4's Needs and to the Layer 3 Dependencies, and open §3.4 with: "On PhiGammaModulesAndIwasawaCohomology §3.9's localized Artinian category (M finite free over R_(A,K)[1/t] with a stable finite-projective R_K-lattice), define …". In the contract line 65 extend "§3.9 … localized Artinian comparison" to "localized Artinian category, Herr complex and comparison". Test: the D versus tD Check (line 455) is §3.9's own Check "Replacing D by t^mD gives the same filtered colimit", so no statement changes.

Reviewed at head 66aaeba (the checkout was already at that head). Files read in full: `packages/TriangulineVarietyAndItsLocalModel/README.md` (2269 lines), `Suggested.lean` (60 lines, no declaration), `design/plan.json` (gaps), `metadata.toml`, `sources.toml`, the three reports of the earlier package rounds, both round-1 red-team passes and their repair report.

## Round-1 findings at this head

Every round-1 finding was re-read against the head; the repaired passage is quoted (at most 40 words) with its line.

| Finding | Status | Witness at 66aaeba |
|---|---|---|
| a-F01 (P1) reciprocity inverted | repaired | README line 31: "Art_K … sending uniformizers to geometric Frobenius elements (NT21 … line 261) … η(Frob_arith)=a has parameter δ=η∘Art_K with δ(ϖ_K)=a⁻¹; over ℚ₃, η(Frob_arith)=2 gives δ(3)=1/2". NT21 line 261–263 says exactly this. Recomputed: D_cris(η) has σ(b)=b/2, Frobenius 1/2; χ_cyc∘Art=(u↦u, p↦1)=x\|x\|. Line 491 "NT's geometric normalization", line 519 Check present. |
| a-F02 (P2) undefined endpoint refinement | repaired | README line 1967: "Put φ_end=(φ₁,…,φₙ₋₁) … T_end=(G_m)^(n−1) … κ_end,D1(iota^(-)M)=κ_end,C1(iota^(+)M) as ordered (n−1)-tuples"; Check at line 1981. Matches Ding25 line 1197–1203. |
| a-F03 (P2) missing almost de Rham domain | repaired | README line 715 "For D such that W⁺=W_dR⁺(D) is almost de Rham"; line 733 "the localized triangulation admits a locally algebraic parameter δ∈T₀ⁿ"; line 735 cites BHS19 line 2305 and 2321, which read "We assume moreover from now on that M• possesses a locally algebraic parameter" and "admits a parameter in T₀ⁿ(L)". Negative Checks at lines 729 and 749. |
| a-F04 (P2) modification target outside the class | repaired | README line 1363: "labelled weights h that are weakly decreasing … Call such a module regular when every h_τ is strictly decreasing … D_σ … lies in ΦΓ_nc(φ,T_σh) … without the regularity assumption". Ding25 line 450–457 and 554–557 agree; Check at line 1393. |
| a-F05 / b-F03 (P3) docstring omissions | repaired | `Suggested.lean` lines 12–15, 19–20, 31–33 name ordered-regular strictness, the rank-two cases and §10.8 surjectivity as not statable; the file still declares nothing. |
| a-F06 (P3) wrong supplier subsection | repaired | README line 1087 "families of filtered φ-modules and the specialization comparisons come from LocalGaloisDeformationRings §3.5 with trivial inertia type and L=K, and §3.6 supplies the deformation theory"; Needs line 1093 and contract line 73 list §3.5. LGDR #923 §3.5 ("Potentially semistable loci in families…") exists and supplies the finite-projective filtered family. Check at line 1111: (1+T)⁻¹ gives 1−ε. |
| a-F07 (P3) undefined D₂,σ in a Check | repaired | README line 2189: "ψ=log_τ is not σ-analytic: its derivative along the τ-direction of the units is 1, so ψ∉Hom_σ(K×,E) … for ψ=log_σ that derivative is 0". No "D₂,σ" remains (grep: 0 hits). |
| a-F08 (P3) marking Check contradicting §1.2 | repaired | README line 163: "the frame change α′=α(1+εB) is transported by … f=α′α⁻¹ … For N with [N,B]≠0 the matrices N and N+ε[N,B] differ and no compatible isomorphism exists". Recomputed: N′=(1−εB)N(1+εB)=N+ε[N,B]; f commutes with ν iff [N,B]=0. |
| b-F01 (P3) Scope narrowed the owner's statement | repaired | README line 19: "V over ℚₚ that is not trianguline, every nonzero P(∇) is injective … when V is moreover de Rham, ∂=t⁻¹∇ is bijective … through PadicDifferentialEquationsAndRigidCohomology §RD.2.43". The board's main design of PadicLocalLanglandsForGL2QpPartII §1.2 says the same; PDERC #1002 §RD.2.43 exists. |
| b-F02 (P3) cycle dimension called ambient | repaired | README line 1239: "each cycle has dimension 3 in the ambient framed ring of dimension 8, hence codimension 5=1·2·3/2+2". 4+4=8, 3+2=5, 8−5=3. |

No repair introduced an error: each repaired passage was recomputed (table under Verified sound) and compared with its source line. The round-1 repair report marks nothing "not actionable in this package", so nothing is re-raised.

## Verified sound

**Scope and policy.** `git diff --stat origin/main...HEAD`: 9 files, all under `packages/TriangulineVarietyAndItsLocalModel/` (README, Suggested.lean, design/plan.json, metadata.toml, sources.toml, four reports). Greps over README and Lean for `lemma` as a keyword, `set_option`, pull-request numbers, process words, LaTeX, absolute paths: 0 hits (the two "lemma"/"repair" hits are the prose phrase "fibre-product module lemma" and the name of a supplier target). `Suggested.lean`: single `import Mathlib`, one module docstring of the prescribed form, empty namespace `TauCetiRoadmap.TriangulineVarietyAndItsLocalModel`, no declaration, so no `#check` comparison, no padding probe and no Lean run (none was started). Every headline of the README (§§4.2, 4.4, 4.5, 5.3, 6.4, 6.6–6.9, 7.4, 7.5, 8.1, 8.4, 8.7, 9.2, 9.8, 10.4, 10.6, 10.8, 11.3, 11.7, 12.4–12.7, 13.3, 13.5, 13.6–13.8, 13.10, 13.11, 13.14–13.16) needs Robba modules, period lattices, rigid trianguline varieties, completed cycle groups or locally analytic constituents; none exists at either pin (Tau Ceti 358314d has no Robba, (φ,Γ), B_dR, trianguline or rigid-space carrier: whole-word grep 0 files each), so the empty file with its docstring is correct.

**Dependency check** (run read-only from the board checkout against the head):

```text
depcheck: 208 roadmaps, 1799 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. This roadmap is line 303 of the merge order; its suppliers are earlier (PhiGamma 31, DDPA 69, Springer 70, LAD 76, LGDR 85, PDERC 134, PHT 136, CCLGC 247, MLE 255, LARLG 302) or on main (SchemeAndStackFoundations, RigidAnalyticGeometry, AdicSpacesPartII, PadicMeasuresIwasawaAlgebras); the one consumer, PadicHodgeParametersInLocallyAnalyticRepresentations, is line 304 and its design heads TR1–TR5 with this roadmap's name. `roadmaps resolve` on the README: no citation and no Lean name found nowhere (it does not detect S01/S02 because the names occur in other roadmaps' text). Mechanical scan of all 91 `*Needs:*` lines: 0 forward or self references. All 12 gap slugs agree between `design/plan.json` and the README (same slug, supplier and `needs` sentence; counts 10, 7, 6, 6, 6, 5, 5, 5, 4, 4, 4, 2 uses), none has supplier `none`, and each asks for something absent at its supplier's head: PadicHodgeTheory has B-pairs and lattices with field coefficients only, no D_pdR, no partial de Rham formula, no dominant-semistability theorem (§6.3 is ordinary filtrations), no selective modification; RigidAnalyticGeometry on main has none of the three openness/normalization statements; CCLGC §5.2a retains "§5.1's globalisation, adequacy, local-type, projectivity and coefficient-field hypotheses" and does not mention ω′; LARLG's principal-series node is unnormalised lower-Borel induction with no multiplicity system.

**Supplier citations resolved at the current heads** (sections opened and compared with the README's use; 106 section or target citations, 8 Mathlib declarations, 4 supplier Lean names of which 4 are missing, S01–S02). PadicHodgeTheory #1062: §§3.2 (HT(χ_p)=+1, weight h counts gr^(−h), ℚ_p(1) basis t⁻¹e₁ has jump −1: the README's line-29 witness), 4.3, 4.4, 4.5 (full-rank quotient invariant, Ding Lemma 2.1), 5.2 (Berger modification; "weakly admissible precisely when its modification is étale, equivalently all its Robba slopes are zero"), 6.3. PhiGamma #1310: §§1.0c, 1.1, 1.2, 2.7, 3.1, 3.4a, 3.8, 3.9, 7.1–7.8; Conventions give d⁰x=((φ−1)x,(γ−1)x), d¹(a,b)=(γ−1)a−(φ−1)b with the degree-two −1 adapter to BHS (§3.9), matching README line 65; §7.1 "ε=N|N|, the Tate line is R(ε)", "δ=x gives φ(e)=pe"; §7.2 H⁰≠0 iff δ=∏x_σ^{k_σ} with k_σ≤0, H²≠0 iff δ=|N|∏x_σ^{k_σ} with k_σ≥1 (equivalently ε∏τ^{a}, a≥0), which is §3.1's T_reg exclusion; §7.3 weight function and "local algebraicity exactly when every wt_σ is an integer"; §7.5 saturated/strict triangulation with dim H⁰((M/Fil_i)(δ_{i+1}⁻¹))=1; §7.8 specialization "parameters multiplied by embeddingwise integral algebraic characters". LGDR #923: §§0.4, 1.1, 1.4, 1.12, 1.18 ("the completion of R□[1/p] at a closed point x represents E′-Artinian lifts of ρ_x"), 1.23 (dimensions 1+d²f, 1+d(d+1)f/2 for R_{D,w}, 1+d(d−1)f/2 for R_{D,g}: with (d,f)=(n,d) the README's 1+n²d, 1+dn(n+1)/2, 1+dn(n−1)/2), 3.4–3.10 (3.7–3.9 exist too), §3.6 "Nφ=pφN". DDPA #1034: §§1.6–1.14 (1.10, 1.12 exist), 2.1–2.7, 3.1, 3.2. MLE #1180 §4.3: "δ_i/δ_j not a nonnegative embedding monomial for i<j". CCLGC #1270 §§5.1, 5.2a. LAD #854 §3.3 (adapts PhiGamma's character space, builds none). PDERC #1002 §RD.2.43 (Robba residue duality, the "application step" the PLL design cites). SchemeAndStackFoundations §§0.16–0.21, 4.3–4.5; RigidAnalyticGeometry §§1.2, 7.3, 8.1–8.3; AdicSpacesPartII R1.1, R1.5, R1.7, R1.9; PadicMeasuresIwasawaAlgebras §3a.1 ("Nothing rigid-analytic is built"). SpringerResolutionAndCharacteristicCycles board design: all 24 cited target ids exist; κ₂,w=w⁻¹κ₁,w with graph {(z,w⁻¹z)} and the GL₃ three-cycle check; completed KL identity [Spec Ô_(X̄_w),x]=Σ_(v≤w)P_(w₀w,w₀v)(1)ℒ̂_(v,x) (the README's §9.2 after restricting the support to w_x≤v); tangent bound dim T_(X_w),x ≤ dim T_(Ū_w),πx + dim ker(wv⁻¹−id_t) + ℓ(vw₀) at ψ=0, which with dim ker = dn − d_u gives the README's §8.5 bound verbatim; smoothness criterion; bruhat-support states only the necessary direction "X_w∩V_v≠∅ implies v≤w", and §6.9 asserts sufficiency only at N=0, which follows from steinberg-components (Z_w the reduced conormal closure of U_w, hence containing the zero section over Ū_w) as BHS19 line 3220–3222 says. LARLG board design: LR.4/principal-series "(Ind_{B^-}^G χ)^{ℚ_p-an}, unnormalised, lower Borel, Ding's convention", the five LR.5 nodes. PadicLocalLanglandsForGL2QpPartII: design on the board's main (read with `git show origin/main:…`, not present in this checkout) has §1.2 and plan id GR.1/nontrianguline-differential-control with the statement line 19 quotes.

**Source locators** (41 opened this round and compared with the statement; all land on the cited item, page numbers correct). BHS19: Prop 3.1.1 (1257), Cor 3.1.6 (1425: pro-represented by L[[X_1,…,X_{n²[K:ℚp]}]]), Cor 3.2.3 and Def 3.2.4 (1662–1682: jumps −h_{τ,i}, regular iff distinct), Lemma 3.4.3 (2118–2128: (i) residual δ, εδ̄⁻¹ nonalgebraic, (ii) residual locally algebraic gives surjective, (iii) δ locally algebraic gives isomorphism, exactly §5.2's last sentence), T₀ (2143–2148), the §3.5 standing hypotheses (2305, 2321), T_reg (2617–2620), Def 4.1.3 (2939–2945), Prop 4.1.4 and proof (2946–2956: flat gives open image, normal locus Zariski-open, [20, Lem. 2.10]), Prop 4.1.5 and Remark 4.1.6 (2962–2990), §4.2 setup (3004–3036: w=w₀, companion = algebraic ratio, φ_iφ_j⁻¹∉{1,p^{[K₀:ℚp]}}), Thm 4.2.3 and proof (3040–3097: ι_h closed immersion, W̃, h smooth, (4.3)–(4.5)), §4.3 setup (3106–3134: integral distinct Sen weights, parameter in T₀ⁿ, Z^d = codimension d), (4.6)–(4.9) and Cor 4.3.2 (3146–3224), Lemma 4.3.3 (3226), (4.10) and Conj 4.3.4 (3235–3272: lower-triangular B, twists δ_iε^{i−1}), Thm 1.9 and Example (i) (262–292: smooth at x, two components of dimension 3, projections to Tⁿ and Wⁿ not smooth). BHS17: Déf 2.4 (298), Théorème 2.6 (329–334: equidimensional n²+dn(n+1)/2, U_tri^reg Zariski-open dense, smooth, ω′|U smooth; diagram (2.1) with relative dimensions n and n²+dn(n−1)/2). BHSsmooth17: val(p)=1 and |z|_K=p^{−d·val} (221), δ_k and its unit restriction (255–263), T_reg and X_tri (266–283), ω = restriction to units (284), Lemma 2.1 (287), Lemmas 2.2–2.4 and (2.4)–(2.6) (357–468), Lemma 2.10 and proof (617–656). NT21: Art_K (261–263), ordinary and regular (1083–1091), Lemma 2.4 (1098–1114), Def 2.5 (1115–1121), Lemma 2.8 (1189–1215), Def 2.9 and reformulation (1276–1290), Example 2.10 (1297–1314). Ding25: §2.1 (388–457), D_r/D^r (460–467), (2.1)–(2.2) and ι_D (475–483), Prop 2.2 and proof (484–528: the isomorphism in (2) is the quotient (D₁)^r with the submodule (C₁)_r, both of weights (h₂,…,h_{n−1}), as §10.3 reads it), Remark 2.3 (529), Prop 2.4 and proof (534–551: kernel of dimension d_K), 𝔗_σ (554–557), Prop 2.5, Lemma 2.6, (2.7) (560–590), Lemma 2.1 (421–424). Colmez08: Déf 4.1 (944), Prop 4.3 (961). Repair locators NT21 261, BHS19 2305/2321, Ding25 554 all verified.

**Adversarial pass (computed values).** A=E[ε]/ε² where infinitesimal; d=[K:ℚₚ]; f=[K₀:ℚₚ].

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| Line 31 Art_K | ℚ₃, η(Frob_arith)=2; χ_cyc | δ(3)=η(Frob_geom)=1/2; D_cris(η): σ(b)=b/2 so φ=1/2=δ(3); χ_cyc∘Art(u)=u, χ_cyc∘Art(p)=1=x\|x\|(p) | repaired convention consistent |
| Line 29 witness | x\|x\| over ℚₚ | R(x\|x\|): φ(e)=e, γ(e)=χ(γ)e (PhiGamma §7.1); derivative weight +1; NT weight −(+1)=−1; D_dR(ℚₚ(1))=K t⁻¹e, jump −1 (PHT §3.2) | sound |
| §1.1 Check (repair) | N=0, B arbitrary; N=[[0,1],[0,0]], B=diag(1,0); rank 1: 0 vs ε | N′=N+ε[N,B]: 0 and 0; [N,B]=[[0,−1],[0,0]]≠0, no f with fν=νf; 0≠ε | sound |
| §1.2, 1.4, 2.4 dimensions | (n,d)=(2,2),(1,2),(2,1) | dn²=8, 2, 4=1 (line)+3 (Borel) | sound |
| §2.1 Checks | W⁺=B_dR⁺; t^aB_dR⁺ | (t^iB_pdR⁺)^{G_K}=K for i≤0 (log t cocycle is not a coboundary: H¹(G_K,B_dR⁺)→H¹(G_K,C_p)∋log χ injective), 0 for i>0; jump −a | sound |
| §2.3 Hodge flag | h=(0,2); (0,0); two embeddings (0,2),(1,4) | Fil^0 rank 1, Fil^{−2} rank 2; (0,0) one jump; ranks (1,2) at both embeddings | sound |
| §3.1 T₀, T_reg | n=1; ratios 1, ε, x^{−k}, εx^{k} | n=1: 0 ordered pairs; 1: fails T₀ (algebraic) and T_reg; ε: fails both; x^{−k}, k≥0: H⁰(R(x^{−k}))∋1, fails T_reg; εx^k: H²≠0, fails T_reg; δ_i/δ_j∉{z^k,εz^k} ⟺ δ_i/δ_j and εδ_j/δ_i nonalgebraic, so T₀ⁿ⊂T_regⁿ | sound |
| §3.3 torsion cohomology | ℚₚ, k=1, wt 0 and 1; k=0 | t^i e has weight wt+i, piece vanishes unless wt+i=0, i∈{0..k−1}: interval {1−k,…,0}; wt 0: (1,1); wt 1: (0,0); k=0: zero module | sound |
| §4.1 ordinary, regular | n=2,d=1, δ₁/δ₂=τ, τ⁻¹; valuations (1,−1),(0,0) | NT21 1083: δ_i(ϖ)∈O×, so (1,−1) fails, (0,0) passes; 1088: i<j, a≥0, so τ excluded, τ⁻¹ allowed | sound |
| §4.2 strictness | n=1; R⊕R | i=0: H⁰(R(δ₁)δ₁⁻¹)=E; NT21 1105 prints 0≤i≤n (misprint), README 0≤i≤n−1; R⊕R: dim H⁰=2 | sound |
| §4.3–4.4 WD criterion | general i; (0,3) slopes 2,3; d=2 gaps (3,1) | v_p((χ₁⋯χ_i)(p))=v_p((δ₁⋯δ_i)(p))+Σ_τΣ_{j≤i}k_{τ,j}; inserting in v_p((δ₁⋯δ_i)(p))<k_{τ,i+1}−k_{τ,i} gives NT21 1199–1212 verbatim; 2<3 true, 3<3 false; slope 2 fails 2<1 | sound |
| §4.5 rank two | NT21 Example 2.10 | (1) χ₁=χ₂(\|·\|∘Art⁻¹), one noncritical; (2) two noncritical; (3) split: (x^{−k₁}χ₁,x^{−k₂}χ₂) and critical (x^{−k₂}χ₂,x^{−k₁}χ₁), first NT weight k₂>k₁ | sound |
| §5.1 ν-cohomology | ν=0 on E²; Jordan block | (ker,coker)=(2,2); (1,1); snake lemma: H¹ exact when all ν=0 | sound |
| §5.2 finite shift | ℚ₃, δ=unr(2)x², k=1,2 | quotient R(δx^{−k})/t^k has weights wt−k, vanishes iff wt∉{1..k}; 2∉{1}: iso (rank 1); 2∈{1,2}: H⁰(quotient)=E→H¹(R(δ))=E injective, map 0 | sound |
| §5.2 Artinian clause | BHS19 Lemma 3.4.3 | (i) residual δ, εδ̄⁻¹ nonalgebraic: H⁰=H²=0; (ii) residual locally algebraic: surjective; (iii) δ_A locally algebraic: isomorphism | sound |
| §5.4 splitting | ν_W=0 | Ext¹ in Rep_K(G_a) of (D₂,0) by (D₁,0) is the off-diagonal block of ν: zero, so the period class is 0 and (iii) kills the Herr class; graded ν=0 gives wt(δ_A)=wt(δ), parameters locally algebraic | sound |
| §6.2 relative dimension | Tⁿ, t | n(d+1)−dn=n | sound |
| §6.3 | (2,2); (1,1) | X_{M,F}: n(d+1)+dn(n−1)/2−n=dn(n+1)/2=6; rigidified n+dn(n+1)/2=8; +dn²−n: 8+8−2=14=d(n²+n(n+1)/2); (1,1): 2,2 | sound |
| §6.4, 6.6, 6.8, 6.9, 7.4 | (2,2); (1,2) | dn²=8, +dn(n+1)/2=6: 14; Galois 14−8+4=10=n²+dn(n+1)/2; 10+8=18=8+(4+6); 4−8+6+8=10; (1,2): 2+2=4, 3, 3+2=5=2+(1+2) | sound |
| §6.7, 7.3 graph | w=(123), z=(ε,2ε,3ε) | (w⁻¹z)_i=z_{w(i)}=(2ε,3ε,ε); wz=(3ε,ε,2ε); wt δ_i=h_{w⁻¹(i)}+κ_{tri,i} and Hodge root h_j+κ_{Hodge,j} match iff κ_Hodge=w⁻¹κ_tri: graph T_w, Springer κ₂=w⁻¹κ₁ | sound |
| §8.1 fibres | (2,1) | 7−4=3, 7−2=5; composite of flat ω′ and smooth Tⁿ→Wⁿ is flat | sound |
| §8.3 bound | BHSsmooth17 (2.12),(2.13); d=2,e=1,(0,2),v=−3; e=2,v=1,(4,1); n=1 unr(p) | val(p)=1 so [K:K₀]val=e·v_p; (2.13): e·v_p((δ₁⋯δ_i)(ϖ))≥ΣΣ(k_{τ,j}−k_{τ,w⁻¹(j)}), as displayed; prefix bound: saturated rank-one sub of étale ∧ⁱD has v_p(δ₁⋯δ_i(ϖ))≥0, and {\|f\|>1} is admissible open inside the nowhere dense complement of U_tri, hence empty; −2>−3 both τ and −3≥−4 allow w=s, excluded by v≥0; 3>2 passes, 2>2 fails; unr(p): slope 1, not on X_tri | sound |
| §8.5 bound | derivation; (2,1,s,e); (3,1,w₀,e) | dim ker(u−id)=dn−d_u, so dim X_tri−dn²+(dn−d_u)+ℓ(w_xw₀)+dim TŪ_w = displayed bound; d_{w₀w_x⁻¹}=d_{w_xw₀} since u and u⁻¹ have the same fixed space; 7−1+1=7; 15−1+3=17 | sound |
| §8.6 | ι_k; n=2 fibres; T=ε | X̃⊂X^{k-cr}×T is the graph closed set over T/S_n, composite with (2.4) a closed immersion factoring through reduced X_tri; distinct roots 2 points, equal roots length 2; (1+ε)⁻¹=1−ε | sound |
| §8.7 companion | S₂, S₃; BHS19 3035 | x_w∈X_tri iff w_x≼w (3040–3043); hypothesis φ_iφ_j⁻¹∉{1,p^f} for i≠j (symmetric with p^{−f} over ordered pairs; Nφ=pφN sends the φ_j-line to eigenvalue p^{−f}φ_j); w_x=e: {e,s}; w_x=s: {s}; s₁≤s₁s₂, s₂≰s₁ | sound |
| §9.1, 9.4, 9.6 codimensions | (n,d)=(2,1),(2,2),(1,2) | weight: dn(n+1)/2=3,6,2 (ambient n²+dn²=8,12,3; fibres 5,6,1); full: +n=5,8,3 (fibres 3,4,0); BHS19 prints dn(n+3)/2: equal iff d=1; its Remark 4.3.5 gives n²+dn(n−3)/2=2 at (2,2) and −1 at (1,2) against the flat-fibre values 4 and 0 | sound; source error below |
| §9.2 KL identity | S₂; N≠0; N=0 | (4.9): Σ_{w_x≼w′≼w}P_{w₀w,w₀w′}(1)C_{w′}; C_{w₀}=Z_{w₀}≠0 iff N_W=0 (3183–3187); w=s,w_x=e: C_e+C_s; w=e: P_{s,e}(1)=0; N≠0: unique stable line, w_x=e, x∉Z_s, C_s=0; N=0: both nonzero (3220–3224) | sound |
| §9.4 induction | BHS19 (4.10) | Ind_{B(K)}^{GL_n(K)} δ₁⊗δ₂ε⊗⋯⊗δ_nε^{n−1}, B lower triangular: README's twists δ_iε^{i−1} and lower Borel | sound |
| §9.9, worked example | (2,1), reversed parameter | both flags = e₁-line, N=0, w_x=e, w=s; X_s for gl₂ is {p−s+q(a+b)=0, r=a(p−s)+qa²}≅𝔸⁴, smooth; BHS19 278: smooth at x, two components of dimension 3, projections not smooth | sound |
| §10.1–10.3 | w=(123); n=3, h=(3,1,0); n=2; (D₁)^{r_i} vs (C₁)_{r_i} | labels (φ₃,φ₁,φ₂); D₁ weights (3,1), C₁ (1,0); Hom(C₁,D₁)=H⁰(t^{h₁−h₂}R)=0, Hom(D₁,C₁) dim 1; both subquotients have weights (h₂,…,h_{n−1}) | sound |
| §10.4, 10.6 | d=1,2 | annihilator dim d_K (Ding 550); modified: off-σ endpoint weights equal contribute 0, dim 1 | sound |
| §10.5 | off-σ (3,1,0) | 𝔗_σ(h)_τ=(h_{τ,3},h_{τ,3},h_{τ,3})=(0,0,0); endpoints (0,0), not (1,1) | sound |
| §11.1 | d=2 | dims 1, 2, d+1=3 (Ding 403) | sound |
| §11.3–11.5, 11.7 | (2,1),(3,1); (2,1) blocks; (3,1) (2,1) | Ext¹₀=1+dn(n+1)/2−n(d+1)=1−n+dn(n−1)/2: 0, 1; barExt¹=dn(n+1)/2+n: 5, 9; g′: 1+dn(n−1)/2+(d+1)−1=3; dim P−n(n−1)/2=Σn_i(n_i+1)/2=dim(B∩L_P): 7−3=4; 8−1=7=4+3 | sound |
| §12.2, 12.3 | (3,2); (2,2) | Ext¹_σ=dn²+1−(d−1)n(n+1)/2=1+n²+(d−1)n(n−1)/2=13; blocks (2,1): 1+7+3=11 (p∩b⁻=l_P∩b⁻ has dim 4); zero kernel 4, quotient 7=5+2; D_σ: Ext¹_g=1+n(n−1)/2=2, κ⁻¹(Hom_sm)=1+dn(n−1)/2=3, Ext¹_σ=1+n²=5, partial B 1+3=4 | sound |
| §12.5–12.7 | (3,2) | ker=(1+dn(n−1)/2)−(1+n(n−1)/2)=3; 7→4, 13→10, 19 both; zero kernels 4→1; 13−4=9=10−1 | sound |
| §13.2, 13.3 | (3,1),(3,2),(4,1); (3,2) | ((n−1)(n−2)d,(n−1)(n−3)d+d−1,1+n(n−2)d)=(2,0,4),(4,1,7),(6,3,9), each a+b−c; injective image 1+(n−1)(n−2)d=5 vs 4 and 0 | sound |
| §13.4 relation | f=g=0; id_E; ×2 | {0}; {(a,−a)}∋(1,−1), ∌(1,1),(1,0); unchanged | sound |
| §13.7, 13.8, 13.10 | (3,2); (2,1); (3,1) | 1+(n²−n+1)d=15, 1+(n²−2n+2)d=11, 15+15−11=19=1+9·2; 4+4−3=5; V=2(5+2)=14, target 6+3=9, L=5; (2,1): 8=5+3 | sound |
| §13.14–13.16 | (3,2); (2,2) | endpoint Ext¹_σ(D₁,σ)=1+4=5 with zero kernel 0, V_σ=14, target 10−1=9, L_σ=5; partial 6,5,4 and 5,4,3 | sound |
| Gap unrestricted variety | BHS17 (2.1); n=1 | relative dimension of ω′ on U_tri: (n²+dn(n−1)/2)−n; n=1: 0, dim X_tri=1+d=dim T | sound |
| Line 67, K=ℚ₂ | ℤ₂× | {±1}×(1+4ℤ₂): two components, each one open disc, universal character ±1 at −1; T=W×G_m | sound |

**Checks and shape.** 91 targets, 267 Checks (every definition has at least three; the repairs added five), each target with a locator and a `*Needs:*` line, each Layer with Examples and Dependencies; the Dependencies lines contain the external items of their layer's Needs lines (LGDR §3.5 added by the repair appears at line 1145). 61 Checks were recomputed in the table; none is false, vacuous or a restatement.

## Not verifiable

- The 12 declared gaps are contracts, not theorems; their registration, suppliers, sections (S01 for one section number) and absence at the suppliers were checked, their proofs were not.
- Ownership against open pull requests outside the roadmap service's index (446 heads of 2026-11-04T16:46:50Z) and the board's packages was not checked; the sibling checkouts the brief lists were searched by object ("trianguline variet", "companion point", "crystabelline", "higher intertwining", "local model") and give only reference-list hits.
- PhiGamma §3.9's sentence "Lemma 3.3.5 … supplies the localized de Rham realization" is ambiguous between a source note and a construction; S04 is raised as a citation of the category only, not as a duplicate construction.
- The Kummer-trace sign convention of README line 65 ("arithmetic unramified-first Kummer trace is 1 and its reverse is −1") was not recomputed; it is attributed to PhiGamma §3.8, whose heading exists.

## Source issues

- **Error** in BHS19 at Theorem 1.9, Conjecture 4.3.4 and Remark 4.3.5, printed pp. 305, 381: the source says the full-character cycles have codimension [K:ℚₚ]n(n+3)/2 and the fibre has dimension n²+[K:ℚₚ]n(n−3)/2; it should be codimension n+[K:ℚₚ]n(n+1)/2 and dimension n²−n+[K:ℚₚ]n(n−1)/2, equal only for K=ℚₚ; affects a stated result.
- **Misprint** in BHSsmooth17 at the proof of Lemma 2.10, printed p. 15: the source says the saturated prefix product at ϖ_K has absolute value at least 1; it should be at most 1, which is what its displayed inequality (2.13) uses; affects nothing.
- **Misprint** in NT21 at the proof of Lemma 2.4, printed p. 29: the source says the strictness test runs over 0≤i≤n, naming a nonexistent δ_(n+1); it should be 0≤i≤n−1; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "66aaebaf27281662e3e3df0c3e88d9055f65ec0d", "job": "RT-TriangulineVarietyAndItsLocalModel~2b", "model": "fable", "worker": "chris-x8"} -->
