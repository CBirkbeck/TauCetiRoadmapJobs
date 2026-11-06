# Review of GeometricSatakeAndFusionPartII (pull request #1836 at bb281a2)

**Verdict:** needs changes

Two P3 findings, no blocking finding. The gate passes, the dependency check shows no UPWARD or CYCLE line, the Lean file elaborates with no warning (it declares nothing, and its docstring names every headline and the carrier it lacks), the fifteen seeded targets agree with their sources at the cited lines, and every cross-roadmap citation resolves on main or at the cited open head. The adversarial table and the source line maps are under Verified sound.

## R01 (P3) — §5.5 carries a π₁ hypothesis that the source does not need

Location: `TauCetiRoadmap/GeometricSatakeAndFusionPartII/README.md` line 929, “Assume p>2 and a connected very special equal-characteristic companion level for the standard local abelian-type data, with p∤|π₁(G^der)| for the companion root-subgroup comparison.”

Claim: the same-residue-field curve theorem is stated only under p∤|π₁(G^der)|.

Witness: KZ Proposition 5.2.3 (KZ line 2179) is proved for every strongly acceptable triple (KZ lines 1484–1491: Hodge type, G^der a product of restrictions of split groups, very special parahoric, p>2) with no condition on π₁(G^der). Instance: G = GL₆/μ₃ acting on Λ³ of the standard representation, μ = (1,0,0,0,0,0), p = 3. The weights of μ on Λ³ are 0 and 1, the image contains the scalars (z ↦ z³ is onto), G^der = SL₆/μ₃ has π₁ of order 3, the centre G_m/μ₃ is an induced torus, and the hyperspecial level is very special: the triple is strongly acceptable at p = 3, so KZ gives the curve, while §5.5 as written excludes it. In this roadmap’s own route the hypothesis is also redundant: the companion of §5.1 is that of the prime-to-p auxiliary cover G′ of §§1.5 and 3.1, whose special fibre is M^can_k with the same G^ad-orbits as the strata of G (KZ line 2164), and p∤|π₁(G′^der)| holds by §1.5. The rank-one step of §5.3 needs the prime-to-p condition only for the companion of G′, where it holds.

Repair: delete “with p∤|π₁(G^der)| for the companion root-subgroup comparison” from the statement of §5.5, and say in §5.1 (or §5.3) that the companion group is that of the auxiliary cover G′ of §1.5, for which p∤|π₁(G′^der)| holds, so that §5.3’s hypothesis is met. Tested on the instance above: with the hypothesis removed §5.5 asserts the KZ curve for GL₆/μ₃ at p = 3, which KZ Proposition 5.2.3 supplies directly; the rank-one subgroups of SL₆/μ₃ are SL₂ (SL₂ ∩ μ₃ = 1), so §5.3 applies to the companion as well.

## R02 (P3) — §0.5 and §3.2 restate DiamondsAndVStacksPartII D10.15

Location: `TauCetiRoadmap/GeometricSatakeAndFusionPartII/README.md` line 295, “Two normal proper representatives with these specified maps are uniquely isomorphic over O_E”, with *Needs:* D10.12 at line 307; and line 596, “Then the functorial scheme map M→Gr(d,Λ)_(O_E) identifies M …”, with *Needs:* D10.12 at line 602.

Claim: both items are stated here as this roadmap’s own API, citing only the full-faithfulness theorem D10.12.

Witness: DiamondsAndVStacksPartII at its open head (`TauCetiRoadmap/DiamondsAndVStacksPartII/README.md` lines 1306–1316, D10.15 “Integral models and morphisms with prescribed v-sheaves are unique”) states exactly these two facts: (1) uniqueness up to unique isomorphism of a proper flat normal model with prescribed diamond, and (2) existence and uniqueness of the morphism ρ_* : M^loc → Gr(d,Λ)_(O_E) whose diamond is the GS4 §4.18 map, under the hypothesis M^v_(GL(Λ),μ_d) = Gr(d,Λ)^♦ that this roadmap proves in §1.6. §§3.1 and 7.7 already cite D10.15.

Repair: in §0.5 cite DiamondsAndVStacksPartII §D10.15(1) for the uniqueness bullet (keep D10.12 for the action and base-change bullets), and in §3.2 cite §D10.15(2) for the existence of the scheme map M→Gr(d,Λ)_(O_E), noting that §1.6 discharges its hypothesis; add D10.15 to both *Needs:* lines and to the Layer 0 and Layer 3 Dependencies. The normalization-of-image statement of §3.2 remains this roadmap’s own.

## Verified sound

**Gate and build.** The worker’s gate at bb281a2 reports every check OK (build, depcheck, text scanners, stray files, outside-folder 0). Re-run of the dependency check: `depcheck: 240 roadmaps, 2358 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. Merge order: this roadmap is at line 198 of ORDER.txt, after GeometricSatakeAndFusion (121), DiamondsAndVStacksPartII (123), RootSystemsPartII (196), PELModuli (106), EtaleDualityAndPerverseSheaves (96), LefschetzPencilsAndVanishingCycles (52), ClassicalAdicEtaleCohomology (53), SmoothRepresentationsOfLocalGroups (22); ReductiveGroups, ReductiveGroupsPartII, SchemeAndStackFoundations and ModularCurves are on main. The diff outside the folder is empty.

**Lean.** `lake env lean` on `Suggested.lean`: exit 0, no output (23 s). The file uses the `module` / `public import Mathlib` header that eight roadmaps on main use and the gate accepts; it declares no name, so there is nothing to `#check`, no padding, no sorry’d data, no `set_option`. Its docstring lists every headline of Layers 1–8 with the missing carrier (polynomial BD Grassmannians, represented Grassmannian scheme, v-sheaf local models, kimberlites, nearby cycles, central functions). Checked that none is statable at the pins: Mathlib has only `Module.Grassmannian` (RingTheory/Grassmannian.lean:66, a structure on submodules with rank conditions, no scheme) and no affine Grassmannian, loop group or nearby-cycle carrier; Tau Ceti has no Grassmannian scheme (its only hits are in LinearAlgebra/TotallyReal). The §2.8 trace-form statement is statable but follows from `traceForm_nondegenerate` in one step, so leaving it out is right.

**Pins and library declarations.** lake-manifest.json: Mathlib f6090c7095e1e56b3464c1daba5f24631f1290d2, TauCeti 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a, as the README states. Opened at the cited lines: `Submodule.span` (Mathlib/LinearAlgebra/Span/Defs.lean:46), `Algebra.trace` (RingTheory/Trace/Defs.lean:70), `Module.Grassmannian` (RingTheory/Grassmannian.lean:66, fields finite_quotient, projective_quotient, rankAtStalk_eq at every prime, as described), `traceForm_nondegenerate` (RingTheory/Trace/Basic.lean:501, with `[FiniteDimensional K L] [Algebra.IsSeparable K L]`), `AlgebraicGeometry.Scheme` (AlgebraicGeometry/Scheme.lean:40), `IsClosedImmersion.iff_isProper_and_mono` (AlgebraicGeometry/ZariskisMainTheorem.lean:392), `TauCeti.AlgebraicGeometry.ZariskiTangentSpace` (TauCeti/AlgebraicGeometry/TangentSpace/Basic.lean:65, an abbrev for the κ(x)-dual of the cotangent space), `Derivation.adjointWeightSpace` (TauCeti/Algebra/AlgebraicGroup/Tangent/RootSpace.lean:100). All eight exist with the stated content.

**Cross-roadmap citations resolved** (every one in the README, each round): GeometricSatakeAndFusion at its open head: §0.6 (line 352), §0.29 (808), §0.31 (848), §0.32 (866), §0.37 (973), §0.38 (995), §4.14 (2070), §4.16 (2103), §4.17 (2130: v-closure model for any parahoric and any μ, reduced special fibre = A_(𝓚,μ), nearby-cycle comparison), §4.18 (2152). ReductiveGroupsPartII on main: RG2.0a.1–2 (963, 1128), RG2.1.2–5 (1507–2446), RG2.2.2–4 (2973–3408), RG2.3.1 with “Big-cell criteria” (3956) and “Quotients of group schemes over a DVR” (4007), RG2.3.3–5 (4151–4664) including “Tame realization of stabilizers as fixed points of hyperspecial models” (4707), RG2.3.7 Lang (5201), RG2.4.1–3 (5533–5992), RG2.5.1–2 (6724, 6931). ReductiveGroups §10B “Induction, Weyl modules and simple heads” (main, line 1759). RootSystemsPartII at its open head: §4.3 “The existential orbit-sum step” (323), §4.4 “Ambient cocharacters, central directions and torsion” (337), §1.1 (71), Downstream consumers (377); its D₄ check (λ=2ρ, θ=(1,2,1,1), bad orbit sum (1,3,1,1)) agrees with this README’s worked example. DiamondsAndVStacksPartII at its open head: D10.8, D10.9, D10.12–D10.15, D11.4, D11.5, D11.11–D11.14, D11.16–D11.20 (lines 1167–1786); D11.20 requires A[1/π] normal and algebraically closed residue field, which §7.6 supplies (smooth generic flag; completion step). SchemeAndStackFoundations on main: §§0.8, 0.17–0.21, 0.26, 0.28, 0.30, 1.1, 4.7–4.14 (lines 798–5706). ModularCurves §0G (main, line 427, the represented relative Grassmannian). PELModuli #966: M0 (424), M0.18 “The Kottwitz determinant condition” (1169, polynomial identity, not implied by traces). EtaleDualityAndPerverseSheaves #1040: §§2.1–2.3, 2.6–2.10 (1347–2547). LefschetzPencilsAndVanishingCycles #873: LPV.0 §§0.1–0.8 (330–647), §1.10 “The semisimple trace of Frobenius” (1364), LPV.6 §§6.1–6.2 (3240, 3260). ClassicalAdicEtaleCohomology #875: §4.5a (2416). SmoothRepresentationsOfLocalGroups #1688: SR.1 (1037), SR.3.2 (2691, complex Bernstein centre), SR.4.1 (3172, normalized Satake with a chosen square root of q).

**Declared gaps.** plan.json lists 44 gaps; the README states 44 “What X must provide (gap:…)” paragraphs with the same 44 slugs; every slug used in a *Needs:* line is declared; every gap names a supplier earlier in the order. Each `needs` sentence is a single statement with its hypotheses. Note for the intake, not a finding: the three RootSystemsPartII gaps ask for minuscule dominance and coefficient tests, and RootSystemsPartII’s Scope (line 13) says minuscule detection extends RootSystems “in other directions” and is not part of it; its Downstream consumers paragraph names such continuations as separate roadmaps. The contract is declared where the intake reads it; the supplier may answer that it belongs to a further Part.

**Ownership.** `roadmaps grep` over the 461 open pull requests and main for integral local models, Pappas–Zhu, tubular neighbourhoods, admissible loci and Kottwitz–Rapoport: the only other owners are GeometricSatakeAndFusion §§4.17–4.18 (the v-sheaf model, imported here) and DiamondsAndVStacksPartII D10.15 (R02). HeckeStacksAndLocalShtukas (#1252, line 17) excludes integral local models; HeckeStacksAndLocalShtukasPartII, GlobalShtukasAndFunctionFieldLanglandsPartII, ExcursionOperatorsAndSpectralActionPartII and FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII (sibling checkouts) build none of these objects (FiniteFlatGroups PartII imports GS0 §0.37 and builds very-good criteria, which §1.5 here explicitly does not claim). ShimuraVarieties (#933) mentions local models only as examples of level structure. No `Suggested.lean` name clash is possible: this file declares nothing.

**Seeded sample** (statement, hypotheses, page, as written):
- 0.3: KPZ Def. 3.1.4, Standard assumptions 3.1.5, Remark 3.1.6 (lines 712–735, p. 16): quasi-tame, essentially tame, p>2 abelian classical; (NE) at §6.1 line 2706 excludes D^H and Res PGL_m(D) with p | index; KZ Def. 3.1.2 (line 819) acceptable. Matches.
- 1.3: LEV Thm 4.2.7 (line 1024, p. 25) for any {μ} (Def. 4.2.1, line 960); Thm 4.3.2 (line 1243, p. 29); KPZ Thm 3.2.9 (859); KP Thm 2.1.2 and Cor. 2.1.3 (1279–1286) for the finite-extension normality. Matches.
- 2.1: KPZ §2.1.1 p>2 (418), §2.2.1 classical no triality (464), Prop. 2.2.2 (475–488: index prime to p, x generic in facet, x′ with G_x=G_(x′), tame Galois K̃, x′ hyperspecial), §§3.3.1–3.3.5 (900–929) closed immersion of models after ⊗_(O_Ẽ)O_E. Matches.
- 2.7: KP §2.3.15 and Cor. 2.3.16 (1755–1771): index range −(r−1)−a…r−1, hence 2r−1+a terms, closed immersion into Gr; KPZ Lemma 2.3.1 (562) tot(L). Matches (one misprint in KP, under Source issues).
- 3.1: KPZ §3.2.12, (3.2.13), Thm 3.2.15 (882–897); Remark 3.2.14 (891); HLR Example 9.4 and Cor. 9.2(2) (1860, 1816): PU₃ at p=3, quasi-minuscule non-normal, special fibre non-reduced. Matches.
- 4.2: KPZ Remark 4.1.5 (1350–1361). Matches; the source calls the surface normal (Source issues).
- 4.5: KPZ §4.2.1 and Prop. 4.2.2 (1404–1426): k_α, the curve a↦t^λx_α(t^(−k)a), derivative X_α t^(⟨λ,α⟩−k), Φ^cur. Matches (KPZ takes the max over k∈ℤ; k=0 always qualifies, same value).
- 4.10: KPZ Thm 4.1.6 (1363), Thm 4.3.2(2) (1748–1754), §4.3.15 (1984–1988). Matches.
- 4.11: KPZ Lemma 4.4.2 and Thm 4.4.3 (2002–2055), μ̄_φ = Σ_(θ|k₀=φ) μ_θ (2037–2040). Matches.
- 5.1: KZ §5.2.1 (2120–2160): very special hypothesis (2145), ⋞ order on X_*(T)_I^+ (2152), Adm = {t^λ: λ⋞μ} (2160). Matches.
- 5.3: KZ proof of Prop. 5.2.3 (2207–2217), PR §6.a.1 (916–921, p ∤ |π₁| hypothesis). Matches.
- 6.1: SW Def. 21.6.1 conditions 1–4 (7622–7635), Def. 21.6.2 with the invertible L (7637–7643). Matches.
- 6.6: SW §21.8 (7846–7847 p=2 unramified; 7910–7918 Thm 21.8.1 via 21.5.1, 21.4.3, 18.4.1 and GAGA); KRZ Def. 2.1.1 (535–537). Matches.
- 7.5: GL Def. 1.1 (30–35, any G, parahoric, any μ) and Thm 1.3 (78); GLX Thm 3.8 (886). Matches.
- 8.4: AGLR Thm 1.3 (141–151), (8.6)–(8.8) (2940–2965), (8.14) (3006–3012), Lemma 8.4 (3020); PZ Thm 9.16 (3132); KP Thm 4.7.11 (3764–3769, Tr^ss = q^(d/2) z_μ). Matches (PZ’s A_μ exponent under Source issues).

Also opened: AGLR Def. 4.11, Props. 4.13–4.14 (1671–1706), Def. 7.5, Lemma 7.6 (2395–2407), Thm 7.22 (2776, any G), (7.55) (2848–2852), Prop. 3.7 (1222), Lemma 3.15 (1356), Thm 6.16 (2214), Prop. 6.13 (2180), Prop. 6.17 (2239); GL Lemma 1.2 (61), Lemma 3.1 (237), Lemma 3.3, Prop. 3.4, Cor. 3.5 (255–297), Thm 4.7 hypotheses (391–393), Lemma 5.1, 5.2, Thm 5.3, Lemma 5.4, Prop. 5.5 (418–461); GLE22 Lemma 5.26 (2293); ALWY Thm 4.17 (1470); HAI15 Thm 1.1 (24) and Def. 9.1 (742); HAI14 Thm 11.10.1 (1890), §11.11 (1896), Prop. 11.12.6 (2087); SW Conj. 21.4.1 (7488), Prop. 21.4.3 (7504), Prop. 21.5.1 (7543), Def. 21.6.8 (7685), Prop. 21.6.9 (7710), Thm 21.7.1 (7820); KPZ §3.1.7 (741), §3.1.9 (761), §3.2.2 (793), Def. 3.2.6 (839), Lemma 3.3.10 (977), Thm 3.3.25 and Remark 3.3.26 (1125–1135), Def. 3.4.4 (1234), Prop. 3.4.6 (1278–1288), Def. 4.2.6 (1481), §4.2.15 (1612), §4.3.1 (1737–1747), §4.3.3 (1761), Prop. 4.3.9 (1800–1806); KZ Prop. 3.1.9 (874), Prop. 3.1.12 (926), Prop. 3.1.14 (948), Lemma 5.2.5 (2317); RZ17 Def. 3.3, Remark 3.4 (420–436), Def. 3.8, Remarks 3.9 (572–594), Lemma 5.1, Cor. 5.2, 5.4, Lemma 5.5, Cor. 5.6, Remark 5.7 (1014–1116); GORGL Cor. 3.4.4 (643), Thm 4.5.1, 4.5.3, Cor. 4.5.4 (1325–1416); GORSP §2, Thm 2.1, Thm 3.3 (94–151, 352); LEV Def. 4.1.1 (791), line 1389; PR Thm 8.4 (1419); FHLR Lemma 5.27 (1540); HLR Thm 1.1 (69), Prop. 3.4 (526); PRLSV Prop. 7.2.1 (2194); KP Props. 2.2.2, 2.2.4, 2.2.7 (1340, 1386, 1422), Cor. 4.7.3 (3697). All support the statements as written.

**Adversarial table** (one row per statement checked; values computed on each side).

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| Conventions, PGL₂ order | X_*=ℤ, coroot 2 | 0≤2 true; 0,1 incomparable | holds | none |
| Conventions, Cartan sign | x_(−α)(1)=((1,0),(1,1)) on E | Ad(1+F)E = E−EF+FE−FEF = E−H−F | holds; KPZ prints +H+X_(−α) | Source issue |
| Conventions, flag rank | h=3,d=1; KZ diag(π⁻¹,1,1) | subspace rank 1, SW kernel rank 2; π·gΛ mod π = k e₁ | holds | none |
| §0.4 central comparison | SL₂→PGL₂, μ=1 | 2n=1 unsolvable; μ=0 both Spd O_F | holds | none |
| §0.5 Check (blow-up) | P¹_(O_F) blown up at special point | exceptional P¹ collapses: not a monomorphism | holds | none |
| §0.5 Check (conic) | x²=π_E yz | generic: smooth conic with [0:1:0]; special: x²=0 double line; on z=1 hypersurface with singular locus the point (π,x,y), codim 2 ⇒ R₁+S₂ ⇒ normal | holds | none |
| §1.2 Check 3 | GL₂, ν=(2,0) | ⟨2ρ,ν⟩=⟨(1,−1),(2,0)⟩=2; GL₂/P_ν has dim 1 | holds | none |
| §1.2 Check 4 / §6.3 Check 3 | K/F ramified, weights (1,1),(0,0) | E=K; generic bound a point; A=k_K[ε]/ε², quotients (u,v)↦u+cv have kernels A(−c,1), char poly (T−a₀)² = generic; A¹-family ⇒ naive model not flat | holds | none |
| §2.1 Check 4 | GL₂/Q₃, s=√2−1 | e·s ∉ ℤ for all e; x′=1/4, e=4 in Q₃(ζ₄,3^(1/4)) (ζ₄ unramified, tame) ⇒ coordinate 1 | holds | none |
| §2.2 lattice example | G_m on ℤ₃³ weights (0,2,1) | u·(e₁+e₂)/3 = u²(e₁+e₂)/3 + ((1−u²)/3)e₁, u²≡1 mod 3; (1−T²)/3 ∉ ℤ₃[T^±] | holds | none |
| §2.5 incidence equation | F₀=[x₀:y₀]⊂Λ₀, F₁=[x₁:y₁]⊂Λ₁ | Λ₁→Λ₀: (x₁,πy₁)∥(x₀,y₀) ⇒ x₁y₀=πx₀y₁; πΛ₀→Λ₁ gives the same; special fibre x₁y₀=0; fibre over [1:0] is P¹, over [0:1] a point | holds | none |
| §2.5 GSp Checks | rank 4 | Lagrangian Gr dim 3 vs Gr(2,4) dim 4; ⟨e₁,f₁⟩=1 in every characteristic | holds | none |
| §2.8 trace form | K=F,r=1; r=0; F_p(t^(1/p))/F_p(t) | Ψ(e₁,e₂)=1; zero space nondegenerate; inseparable trace 0 ⇒ degenerate | holds | none |
| §3.4 Checks | GL₂ hyperspecial (2,0); Iwahori (1,0) | (1+pE₁₂)e₂=e₂+pe₁ ∉ p²We₁⊕We₂; Iwahori congruence kernel = 1+((π,π),(π²,π)) ⊂ 1+πM₂, fixes lines of Λ₀/π and Λ₁/π; 1+aE₁₂ is trivial on Λ₁/π and sends [0:1] to [a:1] on Λ₀/π | holds | none |
| §3.7 Check 3 | O_E[t]/(t²−π_E) | DVR, special fibre k[t]/t² nonreduced, perfection a point; no smooth open | holds | none |
| §4.1 Checks | Spec k[ε]/ε²; xy=0; x²+xyz | f²=0 in k[[a]] ⇒ f=0; axes span k², no curve with derivative (1,1); f(f+gh)=0 ⇒ a-coefficient of f is 0 ⇒ span {x=0} of dim 2 in k³ | holds | none |
| §4.4 Check 1 | C₂, μ=(1,1) | ν=0: (1,1)=α₁∨+2α₂∨, ω₁-test 1; ν=(2,0): (−1,1)=−α₁∨, ω₁-test −1, ω₂-test 0 | holds | none |
| §4.4 Check 2 | D₄, μ=(1,1,1,1), ν=(1,1,1,−1) | 2e₄=α₄∨−α₃∨; tests (ω₁,ω₃,ω₄)=(0,−1,1); swapped (0,1,−1) | holds | none |
| §4.4 Check 3 | B₃ | (2,0,0)−(1,1,0)=(1,−1,0) even sum; spin test 0, others 1,0; (1,0,0) odd sum ∉ coroot lattice | holds | none |
| §4.5 Checks | SL₂ λ=μ=α∨; λ=0, μ=α∨ | k_α=2 (j=3 gives 2α∨>μ), k_(−α)=0, k_α=k_(−α)+⟨λ,α⟩=0+2; derivatives t¹X_α,t⁰X_α; λ=0: k_α=1, derivative t⁻¹X_α | holds | none |
| §4.8 Check 3 | SL₂ λ=α∨, μ=2α∨ | k_α=3, k_(−α)=1, 3=1+2; C^cur=k t⁻¹H_α; KPZ exponents ⟨λ,α⟩−k ∈ {1,0,−1}, only −1 survives in T Gr | holds | none |
| §4.9 Checks | SL₂ λ=0,μ=α∨; λ=μ=α∨; p=3 scaling; D^H m=1 | candidates {1,1}⇒l=1=k_(−α); {0,2}⇒l=0=k_(−α); 2H_α: derivatives (2,1), minima unchanged; −2 = 1 in F₃, 0 in F₂ | holds | none |
| §5.2 unitary formula | c=a, d=−a²/2, a=1 in F₃ | a²−a²/2−a²/2=0; terms 1,1,1 sum to 0; 1/2 undefined in F₂ | holds | none |
| §5.3 kernel bound | G_α̃ simply connected → G^der | map lifts to G^sc; ker ⊂ ker(G^sc→G^der), order divides |π₁(G^der)|; for SL₆/μ₃ root SL₂: SL₂∩μ₃=1 | holds | none |
| §5.5 hypothesis | GL₆/μ₃, Λ³, μ=(1,0⁵), p=3 | strongly acceptable (KZ 1484–1491), π₁(G^der)=ℤ/3; KZ Prop. 5.2.3 applies; §5.5 excludes it | hypothesis redundant | R01 |
| §6.5 ranks | r_ψ = Σ_(φ over ψ) r_φ | = n|A_ψ| + ε_ψ with r_(φ₀)=1 (RZ17 (3.10)–(3.11)) | holds | none |
| §6.5 Check 2 | F=E=Q_p, n=2, S=Spec F_p | F_(p²)⊗F_(p²)=F_(p²)×F_(p²), ranks (1,1) | holds | none |
| §6.5 Checks 3–4 | xy=ϖ_E^e·u | e=1 regular; e≥2: xy−uϖ^e ∈ m², dim 2, embedding dim 3, singular locus codim 2 ⇒ normal not regular; Q₃(∛3), r=(1,2,0): E=Q₃(∛3,ζ₃) degree 6 totally ramified, e(E/F)=2 | holds | none |
| §6.6 cocharacter | signature (1,1) | weights (1,0) at each embedding over φ₀ ⇒ generic flag P¹ = Drinfeld generic fibre; central (1,1) would give a point, contradicting SW Thm 21.8.1 | holds | none |
| §7.x Example | node xy=0 | dim 1 = depth 1 ⇒ S₂ | holds | none |
| §7.8 Checks | g=diag(π⁻¹,1); diag(π⁻²,1); μ=0 | πgΛ=Oe₁⊕πOe₂ ⊂ Λ, quotient k e₁; π⁻¹Oe₁⊕πOe₂ ⊄ Λ; Adm(0)={1} ⇔ ρ(g)∈GL(Λ⊗O_F̆) | holds | none |
| §8.1–8.4 normalization | d=1, q=9; μ=0 | τ=(−1)q^(−1/2)·1=−1/3; κ^ss=1/3; z^ss image q^(−1/2)1=1/3; φ=q^(1/2)·(1/3)=1; unipotent block (1/9,1): semisimple 10/9, invariants 1/9; μ=0: all 1_(P_r) | holds; consistent with AGLR Thm 1.3 ((√q)^d τ ∈ ℤ) and KP Thm 4.7.11 | none |
| §8.3 sign | κ_Φ=(−1)^d Σ(−1)^i Tr vs AGLR (1.4) | identical | holds | none |

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts (Mathlib, Tau Ceti, eleven roadmaps), How to read the build, Layers 0–8 each ending with Examples and Dependencies, Downstream consumers, Worked examples, References. Every definition has an API list and at least three Checks (counted: §§0.1–0.6, 1.1–1.2, 2.3, 2.5 (two definitions), 2.8, 3.1, 3.4, 3.7, 4.1, 4.4–4.6, 4.8–4.9, 5.2, 6.1, 6.3, 6.5–6.6, 7.8, 8.1–8.4); every theorem carries hypotheses and a locator; every *Needs:* line resolves. No LaTeX, process words, pull-request numbers or machine paths (gate forbidden=0, prnum=0, latex=0).

## Not verifiable

None. Every cited source is in the cache as a line-numbered text and every locator used above was read there; no source needed fetching.

## Source issues

- **Error** in KPZ at Remark 4.1.5(2), printed page 31 (KPZ line 1354): the source calls Spec k[x,y,z]/(x²+xyz) a normal surface; it should say the surface is reducible, x(x+yz)=0, hence not normal, which is what the tangent computation uses; affects nothing. The same line prints the ring as k[x,y,x] for k[x,y,z] (misprint).
- **Misprint** in KPZ at §4.3.1 displayed identity before (4.3.6), printed page 40 (KPZ line 1743): the source gives the conjugate of t^(⟨λ,α⟩−k)X_α by x_(−α)(1) as t^(⟨λ,α⟩−k)(X_α+H_α+X_(−α)); with H_α=[X_α,X_(−α)] and x_(−α)(1)=exp X_(−α) it should be X_α−H_α−X_(−α); affects nothing, only the span is used.
- **Misprint** in KZ at Lemma 5.2.5, printed page 52 (KZ line 2317): the hypothesis reads ṫ^λ ∈ G(F_q[[t]]); it should be ṫ^λ ∈ G(F_q((t))), an F_q-rational lift, as in the proof of Proposition 5.2.3 (line 2192); affects nothing.
- **Misprint** in PZ at §9.d.3 a), printed page 76 (PZ line 3127): the source writes A_μ = (−1)^(2(ρ,μ)) q^((ρ,μ)) 1_(KμK) for the trace of the intersection complex normalized as in (9.9), ℚ_ℓ[d](d/2); with geometric Frobenius that trace is (−1)^d q^(−(ρ,μ)), as KP Theorem 4.7.11 reads it; it should be q^(−(ρ,μ)); affects nothing beyond the normalization of Theorem 9.16.
- **Misprint** in KP at §2.3.15, printed page 162 (KP line 1765, as extracted): the source says the Grassmannian Gr(V′_(ℤ_p)) classifies subbundles of rank dim V′; it should be rank ½·dim V′, the weight-one rank of the Siegel cocharacter; affects nothing.
