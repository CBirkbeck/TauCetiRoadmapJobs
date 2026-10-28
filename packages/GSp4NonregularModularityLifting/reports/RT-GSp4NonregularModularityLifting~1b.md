<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1219#issuecomment-6409717149 -->
Red team round 1 pass b (claude) of d923256

Verdict: accepted

1. **F01** (P3) §3.1a names an empty locus; round-5 F01 is unrepaired at this head

   **Location.** `README.md` line 618: "On the rank-one open of the supersingular curve in odd characteristic the secondary section has order two on the reduced divisor".

   **Claim.** The order-two vanishing of the secondary Hasse section happens on a "rank-one open of the supersingular curve".

   **Witness.** The supersingular curve is the p-rank-zero stratum; it has no rank-one open. P20 line 1652–1655 (Remark 6.4.1, p. 37): Ha′(G) vanishes to order 2 along the rank-0 locus and has a square root of weight (p²−1)/2 for p ≥ 3; CG20 line 2438–2442 (p. 862): inside the p-rank-1 stratum the supersingular locus is a Cartier divisor cut out by a section of ω^{(p²−1)/2}. The head d923256 is the commit the round-5 review read, so its F01 is still present (the sentence is unchanged; `grep -n "rank-one open of the supersingular"` gives line 618 only).

   **Repair.** Replace the sentence by: "On the compactified nonordinary divisor in odd characteristic the secondary section is a unit on the rank-one open and vanishes along the reduced supersingular curve to order two (its square root of weight (p²−1)/2 vanishes to order one), so its zero scheme is not silently identified with that reduced curve." Tested at p = 5: section in (det ω)^{24}, square root in (det ω)^{12}; the §3.1a Check "μ_p ⊕ I_(1,1) ⊕ ℤ/p: primary 0, secondary a unit" is unchanged.

2. **F02** (P3) §11.2's third Check restates the definition

   **Location.** `README.md` line 1546: "The p=2 seed is rejected when A4 is absent even if residual matching and near adequacy hold."

   **Claim.** A Check discriminating the dyadic seed datum.

   **Witness.** The sentence is the definition's clause "retaining all five conditions" (line 1538) read back; it computes nothing and also holds for any wrong model of A4. The predicate A4 is strong residual oddness (line 179: r̄(c_v) conjugate to (1_n,1)j rather than (Ψ_n,1)j), so a negative-control instance exists: with n = 4 even and r̄(c_v) GL₄(k)-conjugate to (Ψ₄,1)j at every real place, the supplier's §1.2(1) gives µ_v = 0 at every real place and A4 fails although A1–A3, A5 can hold.

   **Repair.** Replace the third Check by: "At n=4, a seed whose r̄(c_v) is GL₄(k)-conjugate to (Ψ₄,1)j at every real place of F⁺ has µ_v=0 everywhere and fails A4, hence is rejected although A1–A3 and A5 may hold; one real place with r̄(c_v)∼(1₄,1)j restores A4." Tested: n = 4 is even, so the (Ψ_n,1)j alternative of line 179 applies; OrdinaryAutomorphicFormsAndModularityLiftingPartII §1.2 item 1 (board main, design README line 173) gives µ_v = 0 for the Ψ_n class and dim µ_v = 1 for the 1_n class.

3. **F03** (P3) A quoted supplier title that is not the supplier's heading

   **Location.** `README.md` line 140: "§§5.9–5.10 and 5.18, “GSp₄ Pilloni convention”."

   **Claim.** ShimuraData §5.18 carries that title.

   **Witness.** ShimuraData at the head of its open pull request (roadmap-service index of 2026-10-26), heading line 1536: "### 5.18 Pilloni genus-two convention comparison" (Lean name `gsp4PilloniConvention`); its content is the CG/Pilloni coordinate change the README uses, so the section is right and only the quoted title is not. Every other quoted title in the contracts matches its heading (AG2.P "GSp₄ construction and normalization" line 489; AG2.6 "GSp₄ crystalline Hodge comparison" 2827 and "Ordinary GSp₄ triangular shape" 2837; AGR §7.6 "Semisimplicity criteria" 4641; ETUTC §13.2 "Automorphic inputs to GSp₄ solvable descent" 4784; PAI2 PL.4 "Strong residual oddness at a real place (p = 2)" design line 1793).

   **Repair.** Line 140: replace “GSp₄ Pilloni convention” by “Pilloni genus-two convention comparison”.

Reviewed at the pull request's current head d923256 (fetched `pull/1219/head` and compared: equal to the checkout before reading). Read in full: `packages/GSp4NonregularModularityLifting/README.md` (1660 lines), `Suggested.lean` (44 lines, no declarations), `metadata.toml`, `sources.toml` (8 sources, all `certified`), `design/plan.json` (20 `gaps`; every other top-level key is byte-identical to the design on the board's main), the round-5 review and the five repair reports. Pass a: no pass-a report is posted on the pull request at the time of this pass (the only red-team comment is the job announcement), so there are no pass-a findings to confirm; the round-5 review's single P3 is re-examined below (R01).

Three findings, all P3. No P1 or P2: every statement I instantiated held at the roadmap's generality, every supplier section cited exists at the cited head or on the board's main with the hypotheses the README attributes to it, every locator I opened names the cited statement, and the one lead of the citation resolver (OrdinaryAutomorphicFormsAndModularityLiftingPartII §§2.1 found nowhere) resolves to the accepted design on the board's main.

## Verified sound

**Scope.** Declarations read: 0 (the Lean file declares nothing; its module docstring names every headline and the carrier each lacks). Targets read: 61 (every subsection of Layers 0–11), plus the Conventions, the 23 supplier contracts, the 20 gap contracts, the Conditional theorem contracts and the References. Locators verified against the cached texts: 88 line locators (CG20 40, BCGP25 30, P20 7, P12 7, PS16 1, M14 1, Tho17 2), each opened and found to name the cited theorem, definition, remark or proof step; page claims spot-checked at 14 places (P12 pp. 13–14, 20, 35–38; CG20 page = file page + 800 at 6 places; BCGP25 pp. 112–114, 153–154, 167, 176–179). Checks tested with computed values: 47 (table below). Sibling citations checked: 24 roadmaps (19 at their open heads through the roadmap service, 5 as board designs on the board's main), 74 section or layer citations, all present.

**Headlines and padding.** The headline theorems are §8.2–8.3 (minimal R=T with positive cuspidal freeness), §8.5 (classical weight-(a,2) modularity), §9.2–9.4 (ordinary family R=T and p-adic modularity), §10.7 (local freeness), §11.5–11.6 (four-chamber rank one and classical weight-two modularity). None is statable at the pins: the pinned Tau Ceti `a91d3aa` has no Siegel modular forms, no GSp₄-valued Galois representations, no pseudocharacters and no Hida modules (grep of `TauCeti/**/*.lean` for Siegel, GSp4, GSp₄, Hida, Pseudocharacter: two unrelated hits in a transvection file and a geodesic file), and Mathlib `6b7abb3` has `Matrix.symplecticGroup` (`Mathlib/LinearAlgebra/SymplecticGroup.lean` line 101) but no automorphic or Galois carrier. The docstring lists every headline as not statable with its missing carrier, as required. No padding: the file states nothing, so the `#check @name` elaboration the brief asks for has no input (stated here as required); the round-3 repair elaborated the file with exit 0. The only elementary statement that is statable (the §8.4 identification S₆ ≅ Sp₄(𝔽₂) through the even-subset quotient, Mathlib `Equiv.Perm (Fin 6)` and `Matrix.symplecticGroup (Fin 2) (ZMod 2)`) is an illustration, not a headline, and its absence is correct.

**Gaps.** The 20 slugs of `plan.json` `gaps` are exactly the 20 `gap:` slugs of the README (counts 2–11 each, every one under "Exact supplier contracts" in the supplier's subsection with the identical `needs` sentence); every supplier is named; `plan.json` differs from the design only in `gaps` (13 → 20; `baseline`, `coverage`, `nodes`, `ownershipNotes`, `requests`, `review`, `routeCoverage`, `scope`, `sourceIssues`, `sourceVersions`, `sources`, `status`, `summary`, `upstreamNotes` identical). Each `needs` names one object with its hypotheses; none asks for what a pin or an earlier roadmap provides (checked: IHGD §1.5 `symplectic_coefficient_descent` is stated with `p > 2`, so the every-characteristic extension is genuinely missing; AGR §7.10–7.11 has residual enormity and `ResidualImage.GSp4.IsTidy` for p ≥ 3 but no integral enormousness; LGDR §6.29 has the all-p flag-incidence scheme but not the dyadic regularity; the two Ordinary Part II gaps name sections 1.3, 2.1–2.2, 3.1–3.2, 4.7–4.8, 5.2, 5.4–5.6, 6.3–6.4 that exist on the board's main with the hypotheses the README repeats).

**Supply direction.** The gate printed exactly

```text
depcheck: 56 roadmaps, 658 edges, 0 problem(s)
```

(no UPWARD, CYCLE or moved line). Every supplier precedes this roadmap at ORDER.txt line 260 (SmoothRepresentationsOfLocalGroups 27, IntegralHeckeAndGaloisDeterminants 29, ArithmeticGaloisRepresentations 50, FiniteFlatGroups 55, DeformationAndDerivedPatchingAlgebra 72, LocalGaloisDeformationRings 88, PotentialAutomorphyInfrastructurePartII 89, GlobalGaloisDeformations 90, AutomorphicLFunctionsAndLocalFactors 95, ShimuraData 134, PadicHodgeTheory 140, EndoscopicTransfer 165, ShimuraCompactifications 177, AutomorphicGaloisRepresentationsPartII 183, PotentialModularityAndCompatibleSystems 197, AutomorphicBundles 229, AutomorphicBundlesPartII 231, HodgeTateAndCanonicalSubgroups 233, PadicFamiliesPartII 235, OverconvergentAutomorphicForms 236, ModularityAndLanglandsExtensions 255); the consumer AbelianSurfacesModularity is at 261 and its design cites this roadmap for Proposition 7.5.10 and Theorem 7.5.11 (design README lines 139, 740, 1240). OrdinaryAutomorphicFormsAndModularityLiftingPartII is a design-stage package (board main, accepted at its round 3), not in the branch's ORDER.txt, placed by the gate after its last supplier.

**Sibling citations resolved (file:line of the heading at the cited head or board design).** AGR §§5.11 (3417), 6.4 (3896), 7.3–7.6 (4183–4430), 7.9–7.12 (4752–4996); AutomorphicBundles B3 (1703), B3.HT (3200), B3.HT.4/7/8 (3449/3648/3698), B4 (3782), B5 (4506); AutomorphicBundlesPartII design IC.1–IC.8 (69, 253, 381, 719, 850, 1175, 1384, 1528), "Large parallel twists and reduction of sections" (998), "Conditional coherent dimension equality" (IC.8 +134); AG2.P (235), AG2.5 (1759), AG2.6 (2037) with the two named subsections; AL.4 (2759); MLE §§3.2 (1832), 3.5 with clause (vii) (1945/1947), 3.9 (2041), 3.26 (2430); DDPA §§1.12, 3.1–3.3, 5.1–5.9, 6.1–6.7, 7.6–7.10 (277–1526); ETUTC §§11.1 (4154), 13.2 (4784); GGD R04.3–R04.6 (399–1462), G7 (1948); HTCS §§0.2–0.5 (197–271), 0.14–0.15 (453/479); IHGD §§0.7 (1156), 1.1–1.7 (1865–2658), 2.1–2.3 (2830–2955), Layers 3a (1653), 3b (3057), 4 (3156); LGDR §§2.7 (1857), 2.17 (2037), 2.25 (2183, `GSp4.MinimalAt`), 6.3 (3118), 6.14 (3391, `GSp4.SiegelOrdinary` with the split unramified Lagrangian plane and zero (1,2),(3,4) entries), 6.26 (3613), 6.27 (3623), 6.29 (3684); OAF §§8.6–8.7 (1463/1495); PHT §§3.2–3.6 (660–748), 4.4 (888), 5.3–5.4 (1021/1049); SC C3.9–C3.10 (1677/1697), C5.13–C5.18 (2498–2630); SD §§5.9 (1337), 5.10 (1361), 5.18 (1536); SRLG SR.2.1–SR.2.3 (1834–2123), SR.4.1–SR.4.5 (3084–3490); FFG R07.1 (520), R07.2 (2986); PMCS §8.3 (1615); PadicFamiliesPartII design E6/four-pieces (1057), S7/sen-cousin (1151), S7/de-rham-classicality (1189), F8/four-modules (1219), F8/central-character (1315), K2 (329); PAI2 design PL.3 "Taylor–Wiles data when F contains ζ_p" (1606), PL.4 "Strong residual oddness at a real place (p = 2)" (1793); Ordinary Part II design §§1.2 (163), 1.3 (186), 2.1–2.2 (227/254), 3.1–3.2 (302/324), 4.7–4.8 (488/502), 5.2 (548), 5.4–5.6 (582–618), 6.3–6.4 (672/686). Content checks: Ordinary Part II §1.2(2) states h³ = h⁰(F(S)/F⁺, ad r̄(1)) = 1 and the same Euler count as README line 172; its §4.7–4.8 carry the six hypotheses of BCGP25 Theorem 5.7.14 and the sufficiently-deep-level clause; its §5.4 Check carries q_v ≡ 1 mod 9 at p = 3; AGR §7.6 states Propositions 4.11.1–4.11.2 as annihilation by Frobenius polynomials (README line 42); DDPA §5.5 `balanced_module_patching` needs p ≥ 3 (the CG branch has p ≥ 5); HTCS §0.14 `semiAbelianHasse` lies in (det ω)^{⊗(p−1)}.

**Pinned declarations.** `Module.End.genEigenspace` (`Mathlib/LinearAlgebra/Eigenspace/Basic.lean` line 71), `Module.End.mem_genEigenspace_nat` (line 89), `IsIdempotentElem` (`Mathlib/Algebra/Group/Idempotent.lean` line 37), `TauCeti.ContCohomology.H1` (`TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean` line 712, an `abbrev` of a cocycle quotient as the README says).

**Policy.** The pull request changes only the package folder (`git diff --stat origin/main...HEAD`: README, Suggested.lean, design/plan.json, metadata.toml, five reports, sources.toml). No `lemma`, `set_option`, `#check`, `#eval`, pull-request number, machine path or process word in README or Lean (grep); every target has a locator with a line reference; no computational algorithm; sources are cited by locator only.

**Source corrections the README asserts, checked at the text.** (i) BCGP25 Lemma 4.12.1 prints χ₂⁻¹(z)⁻¹, χ₁⁻¹(z)⁻¹ in entries 3–4 (line 5027–5029): the double inverse the README corrects is there. (ii) CG20 Theorem 8.10 (line 2425–2429) admits k = p−1 (k(2k−1) ≡ 3 mod p), where Θ(h) = 0 with h ≠ 0: the exclusion in §4.2 is needed. (iii) CG20 Proposition 8.9(2) prints det(Q)·con(a_Q⊗Q) (line 2417) while the proof of Proposition 8.25 uses con(Sym^{j−2}[A]a(F,Q)⊗Q∨) with no determinant (line 2934–2937) and the basis value con(e₂²f₁²) = −2 (line 2954): §4.2's "no extra determinant factor" is the proof's formula. (iv) CG20 Theorem 7.3 prints the inverse d_Q⁻¹tr (line 1863–1866) and Lemma 7.5 repeats it (line 1915); in the GL₂ model with U = [[α+β,1],[−q,0]] on (f, f|V_q), pr_α = (U−β)/(α−β), tr(f) = (q+1)f and tr(f|V_q) = q^{−1}T_q f (weight 2), one gets tr(pr_α f) = (qα−β)/(α−β)·f ≠ (q+1)f: §6.2's v_Q⁻¹∘tr is right and the README's Check values (q = 11, p = 5, δ² = −43: 1/2 − 5δ/516 ≡ 3, v = 6 − 5δ/43 ≡ 1) recompute. (v) CG20 §6.4 prints e_{α,β} = lim((T−α̃−β̃)(Q−α̃β̃))^{n!} (line 1777–1780), the idempotent on which the product is a unit; Theorem 8.13 uses the summand where U−β and Q₂−αβ are nilpotent (line 2536): §1.2's product of complementary idempotents is the intended object. (vi) CG20 Theorem 7.11 prints p−2 > a (line 2058); the section's standing bound is p > a−2 (lines 1988, 1998) and the proof (lines 2066–2140) uses Lemmas 7.9–7.10, Theorem 5.2 and the classification only. (vii) CG20 Theorem 9.1 proof (a) prints inertia at x ∈ Q_N as diag(1,1,⟨u⟩,⟨u⟩) (line 3062–3063), of multiplier ⟨u⟩, for a deformation of fixed multiplier ε^{1−a}: §8.1's diag(χ,χ,χ⁻¹,χ⁻¹) with χ⁻² = ⟨u⟩ is the twisted shape. (viii) CG20 Definition 6.15 takes η in ω^{(a,2)}_{K/O}[m∅] without a cusp condition (line 1762) and line 1783 infers nonvanishing of the subcanonical selected space: §1.3's cuspidal witness closes that step. (ix) CG20 Remark 4.12 assumes E not K-isogenous to E^c (line 818) and its argument ends with an isogeny over an at most quadratic L/K (line 845–848): §8.4's geometric nonisogeny is the hypothesis the argument needs. (x) BCGP25 §5.4 states h^i_{S,T} = 0 for i ≠ 1,2 (line 5569); Tho17 Lemma 2.15 gives h³ = h⁰(ad r̄(1)) (line 433), which is 1 at p = 2 (scalars are j-fixed since −1 = 1): README line 172 and the supplier's §1.2 are right. (xi) BCGP25 Definition 7.4.1 prints "r ≢ 1 (mod p) and r ≢ 1 (mod 4) if p = 2" (line 7685): §10.1's reading is the only one satisfiable by an odd r. (xii) CG20 Lemma 8.4 and Definition 8.5 write (det Q/p) and ((r²−4mn)/p) as the same symbol (lines 2318–2330, 2350–2353); they differ by (−4/p) = (−1/p); §4.1's uniform d(Q) = r²−4mn is the discriminant form, which is the one in Andrianov's T₁(p²) coefficient formula.

**Adversarial values** (one row per statement instantiated; values on each side).

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| Conventions line 17, WD convention | r(F)=diag(1,q), N=E₁₂ | diag(1,q)E₁₂diag(1,q⁻¹) = q⁻¹E₁₂; q=3: N/3 | Sound |
| Line 19/§0.3, multiplier and HT weights | a=2,3,4; ε↦−1 | ε^{1−a} has HT weight a−1; pairs 0+(a−1)=a−1 ✓; ν(c)=(−1)^{1−a}: a=2,4 → −1, a=3,5 → +1 | Sound; a even forced |
| Line 21/§0.2 Pilloni parameter | (k,r)=(0,2),(2,2); opposite first sign | (1−0−2,0;4)=(−1,0;4); (−3,0;6); (1,0;4)≠ | Sound (P20 line 1089) |
| Line 26 reciprocal polynomial | roots 2,3 | X²−5X+6 vs 1−5X+6X² | Sound |
| Line 28 normalization | a=2, ℓ=3; Q=diag(1,1), p=7 | ε(Frob₃)=1/3, ε⁻¹=3, det=9; d(Q)=−4≡3 nonsquare (squares 1,2,4), det=1 square | Sound |
| §0.1 root condition | 𝔽₁₁: (2,3), (2,6), (1,3) | 3·8·(−1)·(36−1≡2) = −48 ≡ 7; 2·6=12≡1 so α²β²=1; 1²=1 | Sound |
| §0.3 weight range and nilpotents | p=7: a=4,6; N₀=E₂₃, N=N₀+η(E₁₂−E₃₄), J antidiagonal | 4<6 ✓, 6<6 ✗; N₀ᵀJ+JN₀=E₃₃−E₃₃=0; (E₁₂−E₃₄)ᵀJ+J(E₁₂−E₃₄)=(E₂₄+E₄₂)−(E₄₂+E₂₄)=0; N₀²=0, N²=η(E₁₃−E₂₄) | Sound |
| §0.3 flag vs plane | I+η(E₁₂−E₃₄) | plane restriction I₂+ηE₁₂, (1,2) entry η≠0; flag preserved | Sound |
| §0.4 neatness witness (§8.3) | p=7, λ=3; p=5, λ=2; p=3 | 9≡2≢1; 4≢1; 𝔽₃^×={±1}; scalar ratios 1≠q | Sound (CG20 line 532–536) |
| §0.5 TW refinement | 𝔽₁₃: (2,4,11,9) | αδ=18≡5=βγ=44≡5; αβ=8=γδ=99≡8 → rejected | Sound |
| Line 102 descent Check | Sp₄(𝔽₂) natural module | absolutely irreducible ⇒ algebra M₄(𝔽₂), dim 16; identity multiplier 1 | Sound |
| Line 104 descent Check | C=I+εE₁₄, J₁₄=J₂₃=1 | CᵀJC−J = ε(E₄₁J+JE₁₄) = ε(E₄₄−E₄₄)=0 | Sound |
| Line 170 divisibility | n=4,d=1; n=2,d=1 | 4≡0; 2≢0 mod 4 | Sound |
| Line 171 weight factor | u=diag(1,3), n=2 | 1⁰·3⁻¹=1/3 | Sound |
| Line 172 dyadic complex | p=2, n=2, [F⁺:ℚ]=2, #T=3, q=5, h²=1 | χ=1−3−5+2=−5; h¹=h²−h³−χ=1−1+5=5; g=5+3−1−2=5; h³=0 → 6; Tr(I₂)=0; (B,b)j·I₂=−I₂=I₂ | Sound (Tho17 lines 433, 612–614) |
| Line 173 tame depth | p=3: q_v=7, 19 | 7≡1 (3), 7≢1 (9); 19≡1 (9) | Sound |
| §1.1 valuations | Ω(d,r), (d,r)=(0,2) | (d+2r,0),(r,1),(0,3) → 4,3,3 ≥ 3; p⁴ fails for mixed/étale | Sound (P20 lines 4761–4764) |
| §1.1 Q_{p,2} | b=2 | (pT₂+(p+p³)S)p⁰ | Sound (CG20 line 1409, 2363) |
| §1.2 joint selector | T=diag(c,c+1), Q=diag(d+1,d); Q=diag(d,d) | e_T(c)e_Q(d)=diag(1,0)·diag(0,1)=0, union formula = I; diag(1,0)·I=diag(1,0) | Sound |
| Layer 1 Example | 𝔽₁₁: T=diag(5,0), Q=diag(6,0), A=diag(7,9) | (α+β,αβ)=(5,6); selector diag(1,0); A↦7 | Sound |
| §2.1 Check | [[0,2],[1,0]] | eigenvalues ±√2 | Sound |
| §2.2 Steinberg eigenvalue | (j,k)=(2,2),(4,2),(3,3) | x^{(j+k−6)/2}: x⁻¹, x⁰, x⁰; wrong shift j+k−4 at (3,3): x¹ | Sound (CG20 line 1308–1313) |
| §2.3 Check | diag(1,2,3,6) | e₁=12, e₂=47, e₃=72, e₄=36 | Sound |
| §2.4 M14 hypotheses | (m₁,m₂,w)=(1,0,0); w=1 | 1≡1; 1≡0 fails | Sound (M14 line 707) |
| §2.5 diagonal | unramified α,β | αα⁻¹ε⁻¹=ε⁻¹=ββ⁻¹ε⁻¹; det ε⁻²; ℓ=3: 3, 9 | Sound (BCGP25 line 645–657) |
| §2.7 exponents | w=0, w=2; χ₂(u)=ζ₃ | −1,−1,−2,−2; −2,−2,−3,−3; ζ₃⁻¹ vs printed ζ₃ | Sound (BCGP25 line 5027) |
| Layer 2 Example dual-spin | {0,0,1,1} | dual {0,0,−1,−1}, +3 → {2,2,3,3}; multiplier ε·ε⁻⁶=ε⁻⁵ | Sound |
| §2.8 Checks | dim W=1,2; A=E[t]/(t²) | 4, 8; 3 excluded; A/(t) and socle E·t both dim 1 | Sound |
| §3.1 congruences | p=5,m=3; p=2; ϖ²=2 | s∈25ℤ; 3²=9≡1 (4); (1+ϖ)²−1=ϖ³+ϖ² ∈ (ϖ²) | Sound |
| §3.1a exponent | p=5 | (p−1)(p+1)=24 | Sound |
| §3.3 Checks | 𝔽₇ diag(1,2,3,4); roots (1,2,3,6) | trace 10≡3, det 24≡3; pairings (4,6),(3,1),(2,5) unequal; 6²=36=(−6)² | Sound |
| §3.4 exponents | (a,b)=(4,3); b=2 | 0,−1,−3,−4, pairs −4; b=2: 0,0,−(a−1),−(a−1) | Sound (CG20 line 1661–1677) |
| §4.1 Legendre | 𝔽₅ discriminants 1,2,0 | 1, −1, 0 | Sound |
| §4.2 ranges | p=7: k=8; (j,k)=(2,2),(4,2),(6,2) | 8·15=120≡1; (8,10) degree −2 excluded; (10,10) degree 0; 6<6 fails | Sound (CG20 line 2403, 2449) |
| §4.2 contraction | con(e₂²⊗f₁²)=−2, p=7 | 5; with det(Q)=0 factor: 0 | Sound (CG20 line 2954) |
| §4.4 Check | c=6 in 𝔽₁₁; c=1 | 216−6=210≡1 → F=0; 0 | Sound |
| §4.5 signs | p=7: Q=diag(1,1), diag(1,2) | ((−4)/7)=(3/7)=−1, ((−8)/7)=(6/7)=−1; (1/7)=(2/7)=1 | Sound |
| §4.6 scalar system | F=F_α+F₀ | UF=αF_α; ZF=βF_α+(α+β)F₀; TF=(α+β)F | Sound (CG20 line 2823–2824) |
| §4.7 Check | β=3 in 𝔽₁₁ | 3·4=12≡1 | Sound |
| §4.7 weights | p=7 | k=p+1=8; Hasse (6,6) | Sound |
| §5.1 isotropy | 1−a, p−1>a | ε̄^{1−a} nontrivial on inertia iff p−1∤(a−1): true for 2≤a<p | Sound |
| §6.2 GL₂ model | q=11, p=5, δ²=−43 | αβ=11, α+β=1, −43≡2 nonsquare; (qα−β)/((q+1)(α−β))=1/2−5δ/516≡3; v=6−5δ/43≡1; d_x=1+x+x²+x³≡4 at x≡1 | Sound |
| §7.1 bundle | a=4 | L=ω(1,−1); ω(3,3)⊗ω(a−3,−1)(−D)=ω(a,2)(−D) | Sound (CG20 line 1997) |
| §7.3 defects | S=O[C_p]; k; S⊕k | 1−0=1; 1−2=−1; 0; Tor₁^S(k,O)=k (resolution by T) dim 1 | Sound |
| §7.3 bounds | (7,4),(7,5) | 5>4,7>2,6>4; 5>5 ✗, 7>3 ✓, ν(c)=(−1)^{−4}=1; a even ⇒ a≤p−3<p−2 | Sound |
| §8.1 inertia | diag(χ,χ,χ⁻¹,χ⁻¹) from diag(1,1,⟨u⟩,⟨u⟩) | twist by χ with χ²=⟨u⟩⁻¹ gives multiplier 1 and χ⟨u⟩=χ⁻¹ | Sound |
| §8.4 S₆ | q=2 | (q⁴−1)q³(q²−1)q = 15·8·3·2 = 720 = 6!; (12) fixes 8 of 16 (dim 3, rank-1 deviation); (123) fixes 4 (dim 2); radical of sum-zero hyperplane = ⟨𝟙⟩; x·x=Σx_i=0 on even weight | Sound |
| §8.5 slopes | a=4; a=2 | slopes 0,0,3,3: no pair differs by 1 ⇒ N=0; 0,0,1,1 admits N≠0 | Sound |
| Layer 8 Example | p=7, a=4, ℓ=3 | HT 0,0,3,3; ε⁻³(Frob₃)=27, det 729 | Sound |
| §9.3–9.4 weights | κ′=(4,2),(2,2),(1,1); k′=2,3 | (0,0,−3,−3), (0,0,−1,−1), (0,1,0,1); (0,0,−1,−1), (0,−1,−2,−3) | Sound (P12 line 639, 1798) |
| §10.1 neat prime | p=2 | r≢1 (2) impossible for odd r; r≢1 (4) | Sound (BCGP25 line 7685) |
| §10.3/10.7 Checks | one torus, depth N; (1+t)^{p^N}−1 | Λ-rank d·p^{2N}; t-coefficient p^N≠0 | Sound |
| §11.1 regularity | R=3: (−4,−1), (0,3), (−1,−4); R=0 | 3,3 ✓; 3,−5 ✗; −3 ✗; (0,0) at R=0 but R≥1 required | Sound (BCGP25 line 8095) |
| §11.3 residue field | E=ℚ₇, (t²−3) | squares mod 7: 0,1,2,4 ∌ 3 ⇒ [E′:E]=2; dim_E 2, dim_E′ 1 | Sound |
| §11.5–11.6 multiplicities | four rank-one pieces | 4n=4 ⇒ n=1; [[a,1],[0,a]] nilpotent rank 1 | Sound |

**Degenerate instances with no finding.** Q = ∅ (diamond trivial, pr_Q = 1, v_Q = 1, X₀ = X₁ = X: §§0.4, 6.1, 6.4 state it); zero selected module (annihilator the whole ring, zero action image, unique map to the zero ring: §§3.2, 10.4–10.5 state it); rank 0 (§§10.3, 10.7, 11.5 keep rank zero possible until §11.4); p = 2 (excluded from the CG and P12 branches by their hypotheses, kept in the BCGP branch with the dyadic gaps; the averaging-by-8 obstruction is a stated Check); p = 3 (q_v ≡ 1 mod 9 retained); a odd (excluded by oddness, never used); m = 0 coefficients (excluded from the §6.4 induction); the zero section (never a Katz witness).

## Not verifiable

- CG20 Appendix A.3.2 Lemma A.6 and BCGP21 Hypothesis 7.8.1 / Proposition 7.9.8 (§6.4): the BCGP21 cache was not opened for these; the locators are theorem numbers and pages and the README uses them only to say what is not exported.
- P20 proof of Theorem 11.2.1 (§3.1, the lift congruence): the theorem is at P20 line 3247; the particular congruence step inside its proof was not located line by line.
- P20 Lemma 7.1.1 gives p^{2+r}-divisibility of the Klingen T′₁ (line 1721); the README's p³ is P20's T_{p,2} = p⁻³T′_{p,2} (line 1084, Lemma 14.9.1 line 4756): consistent, but the mixed-kernel differential valuation p^r for general r (README (r,1)) was read only in the Ω(k,2) case of §14.9.2.
- Yamauchi's definition of θ₁ ([75] of CG20) was not fetched; the "no determinant factor" reading rests on CG20's own proof of Proposition 8.25 (lines 2931–2958).
- The GSp₄ Klingen trace constant v_x ≡ d_x/4 ≡ 1 at x ≡ 1 mod p (§6.2) was checked only in the GL₂ analogue; the GSp₄ value is the declared gap `gsp4-klingen-level-comparison`.
- Ownership against open pull requests was checked through the roadmap service's index of 2026-10-26T05:20:43Z (367 open roadmap pull requests) and the board's packages; pull requests opened after that index were not searched.

## Source issues

- **Misprint** in BCGP25 at Lemma 4.12.1(2), p. 112 (line 5027–5029): the third and fourth diagonal entries carry a double inverse of χ₂, χ₁; it should be a single inverse as in the first two entries; affects nothing.
- **Error** in CG20 at Theorem 8.10, p. 862 (line 2425–2429): the range p+1 ≥ k with p ∤ k(2k−1) includes k = p−1, where the Hasse invariant (expansion 1, nonzero) is killed by Θ; it should exclude k = p−1 or restrict to forms not divisible by the Hasse invariant; affects a stated result.
- **Misprint** in CG20 at Proposition 8.9(2), p. 861 (line 2417): the θ₁ coefficient is printed with a factor det(Q); the proof of Proposition 8.25 (line 2934–2937) and the use in Theorem 8.22 need the bare contraction con(a_Q ⊗ Q); affects a stated result.
- **Error** in CG20 at Theorem 7.3 and Lemma 7.5, pp. 847–849 (lines 1863–1866, 1915): the explicit inverse of pr_Q∘i is given as d_Q⁻¹tr; the composite d_Q⁻¹tr∘pr_Q∘i is the unit v_Q/d_Q, not 1 (GL₂ model: (qα−β)/((q+1)(α−β))); it should be (tr∘pr_Q∘i)⁻¹∘tr; affects a stated result, the isomorphism itself survives.
- **Misprint** in CG20 at §6.4, p. 845 (line 1777–1780): e_{α,β} is printed as the limit of the n!-th powers of the product (T_{p,1}−α̃−β̃)(Q_{p,2}−α̃β̃), which is the idempotent where that product is a unit; it should be the product of the two complementary idempotents 1−lim(T−c)^{n!}; affects nothing (Theorem 8.13 uses the intended summand).
- **Misprint** in CG20 at Theorem 7.2, p. 847 (line 1854): pr_x is defined as a limit of powers of an undefined R′_x; it should be R_x; affects nothing.
- **Misprint** in CG20 at Theorem 7.11, p. 853 (line 2058): the hypothesis is printed p−2 > a while the section's standing bound (lines 1988, 1998) and the proof use only p > a−2; affects nothing (every application has a even and a < p−1).
- **Misprint** in CG20 at Lemma 8.4 and Definition 8.5, p. 859 (lines 2318–2330, 2350–2353): the Legendre symbol is written both with det(Q) and with r²−4mn as if equal; they differ by (−1/p); it should be the discriminant r²−4mn throughout; affects a stated result for p ≡ 3 mod 4.
- **Gap** in CG20 at Definition 6.15 and the paragraph after Assumption 6.16, pp. 844–845 (lines 1762, 1783): Katz modularity is defined by a section of the canonical (noncuspidal) K/O-space, but nonvanishing of the subcanonical selected space is inferred; it should either take a cuspidal witness or invoke non-Eisenstein boundary vanishing with torsion coefficients; affects the proof.
- **Gap** in CG20 at Theorem 9.1, proof (a), p. 879 (line 3062–3063): inertia at x ∈ Q_N is printed as diag(1,1,⟨u⟩,⟨u⟩), of multiplier ⟨u⟩, for the deformation of fixed multiplier ε^{1−a}; it should be the square-root-twisted shape diag(χ,χ,χ⁻¹,χ⁻¹) with χ⁻² = ⟨u⟩; affects the proof.
- **Gap** in CG20 at Remark 4.12, pp. 819–820 (lines 818, 845–848): the hypothesis is that E is not K-isogenous to E^c, but the argument only produces an isogeny over an at most quadratic extension L/K, which does not contradict it (a quadratic twist E^c ≅ E_ψ is K-nonisogenous); it should assume nonisogeny over K̄; affects a stated result.
- **Error** in BCGP25 at §5.4, p. 123 (line 5569): it states that h^i_{S,T} vanishes for i ≠ 1, 2 when T ≠ ∅; by Tho17 Lemma 2.15 (line 433) h³ = h⁰(F(S)/F⁺, ad r̄(1)), which is 1 at p = 2 since the scalars are fixed by j (−1 = 1); affects the proof (the Euler-characteristic count of Taylor–Wiles generators, by one).
- **Misprint** in BCGP25 at Definition 7.4.1, p. 167 (line 7685): "r ≢ 1 (mod p) and r ≢ 1 (mod 4) if p = 2" excludes every odd r when p = 2; it should read "r ≢ 1 (mod p) for p odd, r ≢ 1 (mod 4) for p = 2"; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d923256", "job": "RT-GSp4NonregularModularityLifting~1b", "model": "fable", "worker": "fable-rt210"} -->
