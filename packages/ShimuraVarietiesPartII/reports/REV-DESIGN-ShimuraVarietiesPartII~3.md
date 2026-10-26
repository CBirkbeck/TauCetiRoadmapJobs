<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/428#issuecomment-6407740601 -->
Review (claude) of 27bfec4

Verdict: accepted
Conditional on the announced gaps: `gap:ffg-very-good`, `gap:ffg-versal`, `gap:ffg-integral-tensors`, `gap:ffg-nonexceptional`, `gap:ffg-exceptional`, `gap:ffg-polarized-chain`, `gap:ffg-ordinary-lift`, `gap:local-models`, `gap:same-field-schubert-curves`, `gap:open-curve-companions`, `gap:integral-local-shimura`, `gap:general-connected-reduction`, `gap:cr-crystalline-parallel-transport`, `gap:cr-isocrystal-tensor-descent`, `gap:noot-coarse-comparison`, `gap:finite-field-bertini`, `gap:rational-stack-presentation`, `gap:component-specialization`, `gap:hodge-cover-refinement`, `gap:multiplier-exact-sequences`, `gap:matched-fibre-product-centre`, `gap:fundamental-invariant-form`, `gap:rg3-conjugacy-quotient`, `gap:rg3-character-separation`, `gap:rg3-faithful-quotient-finite`, `gap:rg3-degree-one-residue-descent`, `gap:rg3-elliptic-maximal-torus`, `gap:rg3-cyclic-torus-and-neatness`, `gap:rg3-r-smooth-tori`, `gap:rg3-r-smooth-abelian-type`, `gap:rg3-stabilizer-closed-immersion`, `gap:rg3-conj-prime-centralizer-dimension`, `gap:compact-quotient-borel`, `gap:arbitrary-dvr-good-reduction`

1. **F01** (P3) the Borel-containment gap cites a K17 number that is a displayed formula

   **Location.** `design/README.md:142` (gap:compact-quotient-borel): "supply the Borel-containment argument used in K17 Proposition 2.1.6"; the same sentence in `design/plan.json` `gaps[]` with id `gap:compact-quotient-borel`.

   **Claim.** The Borel-containment argument is K17 Proposition 2.1.6.

   **Witness.** In K17 the numbered statements of §2.1 are Proposition (2.1.3), Proposition (2.1.5) and Corollary (2.1.7); "(2.1.6)" labels the displayed injective map in Proposition (2.1.5) (K17 line 1354–1358). The compact quotient, the Borel containment through Borel–Tits and the equality of the centralizer with the isogeny group are the proof of Corollary (2.1.7), p.31 (K17 line 1381–1395).

   **Repair.** Write "used in K17 Corollary 2.1.7, p.31" in both files. Tested: 4.12 (`README.md:970`) already cites "K17 Corollary 2.1.7, p.31" for the same argument, so the two citations then agree.

2. **F02** (P3) the Conj′ gap re-states a target ReductiveGroupsPartIII already has

   **Location.** `design/README.md:140` (gap:rg3-conj-prime-centralizer-dimension): section "RG3.0, the quotient Conj′ (new target)", with the `needs` sentence defining Out′(H) and Conj′(H); the same entry in `design/plan.json`.

   **Claim.** The quotient Conj′ is a new target to be created in RG3.0.

   **Witness.** Board main (c19c7f1) `packages/ReductiveGroupsPartIII/design/README.md:183–216` is the target `RG3.0/orthogonal-outer-action`: it selects the geometric simple factors isomorphic to SO(2n_i), n_i ≥ 4, descends ∏ O(2n_i)/SO(2n_i) to the finite étale Out′(H), constructs its action on Conj(H) and sets Conj′(H) = Conj(H)/Out′(H), with the same D₄-no-triality convention. That target has no centralizer-dimension statement (no occurrence of "dimension" in it), so the dimension claim is genuinely missing.

   **Repair.** In both files set the section to "RG3.0/orthogonal-outer-action, centralizer dimension (new statement)" and begin the `needs` sentence "With Out′(H), Conj′(H) and Aut′(H) as in RG3.0/orthogonal-outer-action, prove that two semisimple geometric points with the same image in Conj′(H) have centralizers of the same dimension (HT §2.1.8, p.24; proof of Corollary 2.1.9, pp.24–25)". Tested: 4.13 (`README.md:980–986`) consumes only the dimension statement, so the gap's consumer list is unchanged.

3. **F03** (P3) "R-smooth" is used for reductive groups without a definition

   **Location.** `design/README.md:21` ("R-smooth G_Qp"), `README.md:138` ("with G R-smooth"), and the standing-hypothesis block repeated at lines 323, 349, 409, 563, 589, 603, 617, 643, 669, 695 ("G_Qp is R-smooth"). Only the torus notion is defined (line 134).

   **Claim.** The reader knows what "G_Qp is R-smooth" means.

   **Witness.** KPZ §2.1.4 (KPZ line 447–448, p.10): a reductive group G over K is R-smooth when the centralizer of a (equivalently any) maximal K̆-split torus of G is an R-smooth torus; this is also the hypothesis of KZ Propositions 2.4.8 and 2.4.10 (KZ line 666, 703). The README never states it.

   **Repair.** Add to Conventions (line 21) one clause: "a reductive group over a p-adic field is R-smooth when the centralizer of a maximal Q̆_p-split torus is an R-smooth torus (KPZ §2.1.4, p.10)". Tested: with this clause the conclusion of gap:rg3-r-smooth-abelian-type ("the centralizer of a maximal Q̆_p-split torus of G is R-smooth") reads "G is R-smooth", exactly KPZ Lemma 7.2.11 (KPZ line 3555–3556), and the hypothesis "G R-smooth" of gap:rg3-stabilizer-closed-immersion is exactly that of KPZ Proposition 2.1.5(3) (KPZ line 454–457).

4. **F04** (P3) one within-layer forward reference

   **Location.** `design/README.md:291` (1.1 adapted-branch-interface, `*Needs:*`): "ShimuraVarietiesPartII:SV2.1/integral-crystalline-frames", which is 1.2 (`README.md:295–305`); `design/plan.json` `nodes[6]` precedes `nodes[7]` in the same order.

   **Claim.** The README is in build order.

   **Witness.** A script over all 63 nodes found exactly one prerequisite pointing to a later node of the same roadmap: this one. 1.2 needs only SV2.0/lift-independent-crystalline-tensors and gap:ffg-integral-tensors (line 303), so swapping creates no cycle; the source order agrees (KZ §4.1.7, line 1331–1355, precedes Proposition 4.1.9, line 1361).

   **Repair.** Exchange 1.1 and 1.2 (renumber the two subsections and move `nodes[7]` before `nodes[6]`); no text changes. Tested: the Layer 1 `### Dependencies` line is a set union and is unchanged.

Reviewed at head 27bfec4 of the board pull request (checkout confirmed equal to the pull request's current head before reading). Files reviewed: `packages/ShimuraVarietiesPartII/design/README.md` (1342 lines), `packages/ShimuraVarietiesPartII/design/plan.json` (63 nodes, 34 gaps), `packages/ShimuraVarietiesPartII/sources.toml` (five certified entries). The round-2 review and its repair report were read first; every round-2 finding is re-verified below at this head. Four findings, all P3; no P1, no P2. The acceptance is conditional on the 34 declared supplier gaps listed in the review JSON.

## Verified sound

### Round-2 findings at head 27bfec4

| Finding | Repaired passage | Status |
| --- | --- | --- |
| F01 (P2) 4.11 biconditional | `README.md:956`: "If x·g₁=x·g₂, the unique automorphism of A_x relating the two prime-to-p level structures fixes the canonical prime-to-p étale and crystalline tensors, so g₁ and g₂ have the same image in I_x(Z_(p))\G(A_f^p) … Equality of two points is asserted only in this direction: the converse … needs the very-good hypotheses of SV2.1/tensor-separation and is not used here." `*Needs:*` (line 962) lists tensor-isogeny-group, prime-to-p-tower, lift-independent-crystalline-tensors; `SV2.1/tensor-separation` is gone. Matches HT Lemma 2.1.4 (HT line 989–1010): φ unique, fixes the A_f^p-tensors because it intertwines the level structures and the crystalline tensors by (1.3.7). HT Proposition 2.1.6 (line 1038–1040) uses only the surjection G(A_f^p) → orbit → I(Z_(p))\G(A_f^p). `plan.json` statement, prerequisites and the `uses` edges agree (script: 0 differences). | repaired |
| F02 (P2) compound gaps | The three compound slugs are absent (grep = 0). Nine single-statement gaps at `README.md:102, 104, 116, 118, 120, 134, 136, 138, 140`, each with hypotheses in the sentence and a page locator; same text in `plan.json` (script: 34 = 34, texts identical). Each checked against its source below. Consumers: 0.5 cites only cr-crystalline-parallel-transport; 0.6 only cr-isocrystal-tensor-descent; 2.3/2.4 cite fundamental-invariant-form and multiplier-exact-sequences; 5.2/5.3/5.6 cite matched-fibre-product-centre; 4.13 cites rg3-conj-prime-centralizer-dimension; 2.6 and 5.3 take the connected-fixer criterion from RG2.3 fixer-versus-parahoric (5), which at the open head of ReductiveGroupsPartII (`TauCetiRoadmap/ReductiveGroupsPartII/README.md:4354–4363`) states exactly KZ Lemma 4.2.4 with the citation "[Kisin–Zhou], Lem. 4.2.4"; 7.3 takes tensor generation from MotivesAndAlgebraicCycles §6.3 (`README.md:1134–1138` at its open head: Deligne–Milne Proposition 2.20 and Proposition 2.21). | repaired (precision residue: R02, R03) |
| F03 (P3) extraction-line locator | `README.md:173`: "(KZ §4.3.5, p.40)"; §4.3.5 begins at KZ line 1751, printed page 40. `plan.json` test text identical. | repaired |
| F04 (P3) Layer C6 | `README.md:7`: "ShimuraCompactifications Layers C0–C5 own compactification geometry"; `README.md:112` and `plan.json`: "Layer C5, Hodge-type integral extension (new section)". At the open head, C5 is "integral PEL compactifications" (line 2216) and C6 "Hilbert and modular specializations" (line 3037). | repaired |
| F05 (P3) process narrative | "package", "prescribed merge order", "not claimed", "not actionable", "removed", "deferred", "optional" and pull-request numbers: 0 hits; no double blank lines. `README.md:11` now: "consume this roadmap and so belong to a roadmap after it; they are not inputs here". gap:open-curve-companions (`README.md:96`) reads as proposed; GlobalShtukasAndFunctionFieldLanglands §§6.1–6.2 exist at its open head (lines 1911, 1923). | repaired |
| F06 (P3) central closure | `README.md:561`: "A_int(G)=G(A_f^p)/closure(Z(Z_(p))) *_(G°(Z_(p))_+/Z(Z_(p))) G_ad°(Z_(p))_+, where Z is the Zariski closure of the centre Z_G in the full model G_Z(p) and the closure is taken in G(A_f^p)". KP (4.6.3), line 3138–3146, p.199: A(G_{Z(p)}) = G(A_f^p)/Z(Z_(p))^− *_{G°(Z_(p))_+/Z(Z_(p))} G^{ad°}(Z_(p))_+ and A° with the closure of G°(Z_(p))_+ in G(A_f^p); Z° appears only in the tilde groups (line 3126–3136). Same in `plan.json`. | repaired |

Round-1 findings were re-verified in round 2 with line witnesses; the passages they touched are unchanged at this head except where the table above says so. The round-2 "not actionable" item (RG3.5 consuming KZ Theorem 5.1.4) is settled: `README.md:11` and `plan.json` `integrationNotes[0]` record the downstream split, and board main `packages/ReductiveGroupsPartIII/design/README.md:911–928` (Common rational Frobenius class) still consumes it by source citation only.

### Principles

No route-specific shortcut: 3.8 covers every abelian-type datum at p > 2 and every connected parahoric (KPZ Theorem 7.2.21, KPZ line 3735, p.84); the strongly acceptable hypotheses appear only where KZ imposes them (Definition 4.2.2, KZ line 1481–1490). No re-planned roadmap: ShimuraVarieties stops at §8.1 canonical towers; PELModuli at M4.5–M4.6 Siegel models; R-smooth tori, fixer closed immersions and KPZ Lemma 7.2.11 are declared outside the scope of ReductiveGroupsPartII at its open head (`TauCetiRoadmap/ReductiveGroupsPartII/README.md:86–97`), so the three RG3.2 gaps re-plan nothing. Supply is downward (gate below). Every statement I sampled is a paraphrase with a locator; no copied passage. No algorithm, no `set_option`, no sorry'd data, no Lean names of the roadmap's own (the only backticked names are the four pinned declarations at lines 38–40).

### The nine new gaps against their sources

- gap:cr-crystalline-parallel-transport (`README.md:102`): HT Proposition 1.3.7, proof (HT line 780–807, pp.17–18): Û the formal deformation space of A_{s₀}[p^∞], formally smooth over W; for s, s′ in the rigid fibre over finite extensions the composite H¹_dR(A_s) ≅ L̄ ⊗ D_{s₀} ≅ H¹_dR(A_{s′}) is Gauss–Manin parallel transport, cited to [BO83, 2.9]. The gap states that step and nothing else. Precise, minimal (CrystallineCohomology CR.7.3 "Relative crystalline cohomology and the Gauss–Manin connection", line 11279 at its open head, has no such comparison; Berthelot–Ogus occurrences there are the Notes and its erratum).
- gap:cr-isocrystal-tensor-descent (`README.md:104`): HT A.2 (line 1726–1733): S flat normal finite type over W, D a relative Cartier divisor, U = S − D, A/U abelian extending to a semi-abelian scheme over S, L = R¹π_*Q_p on U_K; Corollary A.7 (line 1794–1797, p.39): unique s₀: 1 → E^⊗ with ξ*(s₀)(W(k′)) = s_{0,ξ} = D_cris(ξ*s). Identical hypotheses and conclusion. CR.7.1 (line 11178) has no alteration descent of tensors.
- gap:multiplier-exact-sequences (`README.md:116`): KPZ §7.2.4–Lemma 7.2.5 (KPZ line 3424–3434, p.78): G^ad simple, G^c = ⟨G^der, Z_{G,0}⟩, Z^c_G = ⟨Z_{G^der}, Z_{G,0}⟩, exact sequences 1 → G^c → G → G_m → 1 and 1 → Z^c_G → Z_G → G_m → 1 for the multiplier of any Hodge embedding. The "hence" clause (common-multiplier subgroup of a product has centre an extension of G_m by ∏Z^c) is the form used in the proof of KZ Lemma 4.3.8 (KZ line 1785–1786) and in KPZ Proposition 7.2.19 (line 3697–3700); computed below.
- gap:matched-fibre-product-centre (`README.md:118`): KZ §4.3.7 (line 1770–1781) and the proof of Lemma 4.3.8 (line 1785–1797, pp.40–41): G₃ = (G₂ ×_{G^ad×G_m} G)°, G₃^der ≅ G^der, Z^c_{G₃} ≅ Z^c_{G₂} × Z^c_G because Z^c_G and Z^c_{G₂} are tori (Proposition 4.2.3(4), Definition 4.2.2), Z_{G₃^der} diagonal, and the exact sequence of tori. The torus hypothesis is stated in the gap; the instance without it fails (below).
- gap:fundamental-invariant-form (`README.md:120`): KPZ Definition 7.2.7 (line 3445–3450, p.78) and Lemma 7.2.8 (line 3466–3469, p.79): ψ = Tr_{F/Q}∘Ψ with Ψ F-bilinear alternating, H′ = ⟨H^c, F^×⟩ → GSp_F(V,Ψ). The proof uses the real places of F (G′_R ≅ ∏_{σ:F→R} H′_{R,σ}), so "F totally real" in the gap is the source's implicit standing hypothesis made explicit.
- gap:rg3-r-smooth-tori (`README.md:134`): KZ §2.4.2, Definition 2.4.3 (line 562–567, p.13) and Proposition 2.4.6 (line 608–613, p.14); KPZ Proposition 2.1.5(1)–(2) (line 450–453, p.10). Same two statements.
- gap:rg3-r-smooth-abelian-type (`README.md:136`): KPZ Lemma 7.2.11 and proof (line 3555–3564, pp.80–81): Z_G R-smooth torus, G^ad quasi-tame, T → T^ad with T^ad R-smooth by 2.1.5(1) and T by 2.1.5(2). The gap replaces "abelian type" by the group-theoretic hypothesis the proof uses.
- gap:rg3-stabilizer-closed-immersion (`README.md:138`): KPZ Proposition 2.1.5(3) (line 454–457, p.10), from KZ Propositions 2.4.8 and 2.4.10 (line 666, 703, pp.15–16; the latter assumes p > 2, line 703). Same statement; R03 concerns only the undefined word.
- gap:rg3-conj-prime-centralizer-dimension (`README.md:140`): HT §2.1.8 (line 1079–1092, p.24) and the proof of Corollary 2.1.9 (line 1098–1104): equal images in Conj′(G) give equal centralizer dimensions. Statement correct; anchoring: R02.
- gap:compact-quotient-borel (`README.md:142`): K17 Corollary (2.1.7) proof (line 1381–1395, p.31). Statement correct; locator: R01.
- Minimality of the other 25 gaps was established in round 2 and the cited supplier targets still exist on board main c19c7f1: ReductiveGroupsPartIII headings at lines 107 (conjugacy quotient), 144 (character separation), 163 (finite faithful quotient), 243 (rational descent from local realizations), 382 (global tori with elliptic real fibre), 608 (neatness and cyclic torus closures); FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII `very-good` 794, `nonexceptional-embedding` 1077, `D-central-cover` 1139, `A-central-cover` 1154, `polarized-chain` 1169, `integral-tensor-frame` 1219, `crystalline-tensor-integrality` 1236, `versal-adapted` 1388, `ordinary-adapted-lift` 1963; GeometricSatakeAndFusionPartII `canonical-abelian-model` 458, `same-field-curve` 832, `general-normal-representative` 1023. Every gap names a supplier (none unowned); every slug in a `*Needs:*` line is declared and every declared slug is used (script: 0 undeclared, 0 unused); `neededBy` equals the set of consumers (0 mismatches).

### Seeded sample (15 targets) and the unverified-locator check

`sources.toml` flags no locator as unverified (all five entries `certified`). Each sampled statement was read at its locator; theorem number, printed page and hypotheses agree unless noted.

- 0.2 (KZ §4.1.1, line 1248–1251, p.28; §4.1.5, line 1297–1303, p.30): the stack for general K^p is the quotient of a neat normal level by K^p/K^p₁, or S_{K_p}/K^p. Matches, including "independent up to canonical equivalence".
- 1.2 (KZ §4.1.7, line 1331–1355, pp.30–31): lift over O_K, K/Q̆_p finite; tensors integral in D by Proposition 3.3.2; frame (4.1.7.1); filtration from a cocharacter conjugate to μ_h⁻¹. Matches.
- 1.4 (KPZ §7.1.2 (A)–(C), line 3176–3180, p.72; Theorem 7.1.3(2), line 3194–3203, p.73; §7.3.1(1), line 3782–3787, p.85): π a G-torsor, q equivariant smooth of relative dimension dim G; the action morphism is smooth, not a torsor. Matches, hypotheses equal.
- 2.2 (KPZ §7.2.3, line 3407–3408, p.77: K CM, disjoint from K_S, every prime of F above p split in K; Proposition 7.2.19(2), line 3676, p.83: every v₂|p of E₂ splits in E·E₂). Matches.
- 3.5 (KP §4.6.5, Lemma 4.6.6, line 3167–3206, pp.199–200; Lemma 4.6.9, line 3242–3262, pp.201–202): E(G°) ⊂ A(G_{Z(p)}) × Gal(E^p/E), extension of Gal(E^p/E) by A°, star product recovers A × Gal, map of extensions after pullback to E′ via G₃. Matches.
- 3.7 (KP proof of Corollary 4.6.15, line 3324–3345, pp.203–204; Corollary 4.6.18, line 3391–3412, p.205; KPZ §7.3.1(3), line 3833–3846, pp.86–87): Δ(G,G₂) acts freely on S_{K_p°}(G,X)^+; "need not be finite"; the corrected j-pieces are closures of Sh_{K_p°}(G,X)^{j,+}. Matches.
- 4.1 (HT §1.3.8, line 808–815, p.18; KZ §4.4.2, line 1875–1879, p.43): frame by Steinberg, b well-determined up to σ-conjugacy, [b] ∈ B(G₂,{μ⁻¹_{h₂}}). Matches.
- 4.2 (HT Lemma 1.3.9, line 818–820, p.18): admissibility of ([b_{s₀}],{μ⁻¹_X}) by Wintenberger. Matches.
- 4.3 (HT Theorem 1.3.14, line 885–905, pp.19–20): closed lower sets, locally closed nonempty strata under (1.1.3.1), closure inclusion. Matches.
- 4.6 (KZ line 1884 "we assume the existence of the class [b]_{μ₂}" and Definition 4.4.3, line 1885, p.43; HT §1.3.15, line 909–914, p.20). Matches; HT's missing existence premise is a registered source issue.
- 4.9 (HT §2.1.5–2.1.7, line 1011–1078, pp.22–24; K17 §2.1.2, line 1281–1287, p.29): γ_m geometric q^m-Frobenius in I(Q); (2.1.7.2) γ_{m,p} = δσ(δ)⋯σ^{rm−1}(δ); I_{m,δ}(R) = {g : gδ = δσ(g)} with Q_{q^m} ⊗ I_{m,δ} the centralizer of γ_{m,p}; I_p ⊂ J_δ. Matches, including the contravariant reading (the "crystalline realization" of the geometric Frobenius γ = π⁻¹ is π^* = φ^r).
- 4.12 (HT Proposition 2.1.6, line 1036–1047, pp.22–23; K17 Corollary (2.1.7), line 1381–1395, p.31): split ℓ, split characteristic polynomial, finite double coset, Borel containment, proper and affine quotient. Matches.
- 5.3 (KZ Lemma 4.3.8, line 1782–1803, pp.40–42; proof of Theorem 4.4.6, line 1994–2012, pp.45–46): both projections induce isomorphisms of completions at geometric special points (line 2005–2007); ordinary classes correspond by Lemma 2.2.8 (line 1997); the G₂-map by neutral components and Δ (line 1842–1849). Matches.
- 7.1 (KZ §5.1.1–5.1.2, line 2063–2090, p.47): L̃_ℓ from the pro-étale cover S_{K^ℓ} → S_K; L_ℓ = Isom_{(s_α,s_{α,ℓ})}(V_{Q_ℓ}, V_ℓ^∨) with V_ℓ = R¹h_*Q_ℓ, so V_ℓ^∨ = H₁; path change by conjugation. Matches the H₁ convention.
- 7.5 (KZ §5.3.6, line 2428–2432, p.55; §5.3.2, line 2367–2374): equality of all ϑ(γ_{y,ℓ}) gives γ_{y,ℓ} = γ_{y,ℓ′} ∈ Conj_G(Q̄) by Steinberg; algebraicity by the finite map of §5.3.2. Matches.

Further locators resolved this round: KZ Definition 4.2.2 (line 1481–1490, p.34), Proposition 4.2.3 (1491–1515, p.34), Lemma 4.2.4 (1516–1523, pp.34–35), Theorem 4.2.6(3) and Remark 4.2.7(2) (1552–1580, pp.35–36), Proposition 4.1.9 (1361–1369, pp.31–32), Theorem 4.4.4 (1887–1896, p.43), Theorem 5.1.4 (2104–2107, p.48); HT Lemma 1.3.6 (764–773, p.17), Corollary 1.3.16 (915–925, p.20); KPZ Theorem 7.2.21 (3735, p.84), Corollary 7.2.24 (3768, p.85), Proposition 7.1.14 (3317, p.75), Proposition 7.1.11 (3294, p.75), Theorem 7.1.8 and Remark 7.1.9 (3254, 3270, p.74), Corollary 5.3.16 (2632, p.60), §7.3.2 (3848, p.87); KP §4.5.6 (2982, p.195), §4.6.1–4.6.4 (3091–3166, pp.197–199). All agree with the README's pages (KP journal page = extraction page + 120).

### Adversarial table

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| gap multiplier-exact-sequences | GL₂; GU(1,1) for K imaginary quadratic; GSp₄ | GL₂: c = det, G^c = SL₂, Z = G_m, c(z) = z², Z^c = μ₂ = Z_{SL₂}, Z_{G,0} = 1. GU(1,1): Z = Res_{K/Q}G_m, c on Z = N_{K/Q}, Z_{G,0} = U(1), Z^c = U(1)·μ₂ = U(1) = ker N: exact. GSp₄: Z^c = μ₂ = Z_{Sp₄}, 1 → μ₂ → G_m → G_m → 1 exact fppf | holds | none |
| product clause of the same gap | two GL₂ factors with common det | H = {(g₁,g₂): det g₁ = det g₂}; Z_H = Z(GL₂²) ∩ H since H ⊇ SL₂²; map Z_H → G_m by the common value, kernel μ₂ × μ₂, fppf surjective; H connected (extension of G_m by SL₂²) | holds | none |
| gap matched-fibre-product-centre | G = G₂ = GU(1,1), Z^c = U(1) | G ×_{G^ad×G_m} G = {(g, gz): z ∈ Z, c(z) = 1} ≅ G × U(1), connected; Z_{G₃} = Z × U(1); Z^c_{G₃} = ker c = U(1) × U(1) = Z^c_{G₂} × Z^c_G; Z_{G₃^der} = μ₂ diagonal; kernel of the second projection mod diagonal μ₂ is {(a,±1)}/{(±1,±1)} ≅ U(1): exact | holds | none |
| same gap, hypothesis test | G = G₂ = GL₂, Z^c = μ₂ (not a torus) | GL₂ ×_{PGL₂×G_m} GL₂ = GL₂ × μ₂, identity component GL₂, Z^c_{G₃} = μ₂ ≠ μ₂ × μ₂ | fails without the torus hypothesis, which the gap states | none |
| gap rg3-r-smooth-tori | T = 1; Res_{K/Q_p}G_m, K wild | trivial torus: closure of 1 is 1, smooth. Weil restriction of split G_m: R-smooth by (1) whatever the ramification of K (KZ line 608–611) | holds | none |
| gap rg3-r-smooth-abelian-type | GL₂; Res_{K/Q_p}GL₂, K wild | centralizer of the maximal split torus = G_m² resp. Res_{K/Q_p}G_m²: products of Weil restrictions of split tori, R-smooth by 2.4.6(1); Z_G = G_m resp. Res G_m R-smooth | holds | R03 (word) |
| gap rg3-stabilizer-closed-immersion | G = G′, K̃ = K; p = 2 | identity extends to the identity closed immersion; p = 2 excluded by KZ 2.4.10 (line 703) and the gap says p > 2 | holds | R03 (word) |
| gap fundamental-invariant-form | F = Q; F real quadratic, V = F² | F = Q: Ψ = ψ, Tr = id. F quadratic: ψ = Tr∘Ψ is Q-alternating and nondegenerate because Tr_{F/Q} is a nondegenerate form; F^×·SL₂(F) → GSp_F(V,Ψ) | holds | none |
| gap rg3-conj-prime | GL_n; SO₈ angles (θ₁,θ₂,θ₃,θ₄) vs (θ₁,θ₂,θ₃,−θ₄); θ₄ = 0 | GL_n: Out′ = 1, same Conj′ point ⇒ conjugate ⇒ equal dimension. SO₈ generic angles: not SO₈-conjugate (Weyl group of D₄ has even sign changes) but O₈-conjugate, centralizers both the maximal torus, dimension 4 = 4. θ₄ = 0: the two points coincide | holds | R02 (anchor) |
| gap cr-crystalline-parallel-transport | s = s′; trivial deformation | composite = identity = transport along the constant path; for the constant family the Gauss–Manin connection is trivial and both Berthelot–Ogus maps are the same identification | holds | none |
| gap cr-isocrystal-tensor-descent | D = ∅; s = 0; s = polarization | D = ∅ gives the log-free case U = S; s = 0 forces s₀ = 0 by uniqueness; the polarization tensor gives the crystalline polarization at every ξ | holds | none |
| gap compact-quotient-borel | GL₂ at ℓ₀ = 13 for the trace-2 curve over F₅ | I_ℓ = split torus of dimension 2 = rank; I(Q₁₃)\I_ℓ(Q₁₃) compact ⇒ I_{Q₁₃} contains a Borel of the torus, i.e. the torus; equality | holds | R01 (locator) |
| 4.11 one direction | hyperspecial GL₂, g₂ = −g₁ | φ = −1 ∈ Aut(E): ψ ↦ (−1)²ψ = ψ, crystalline tensors fixed, −1 ∈ I(Z_(p)); classes agree | holds | none |
| 4.11 surjection | composite G(A_f^p) → orbit → quotient | equals the projection (HT line 1038–1040) | holds | none |
| 3.1 A_int with Z | T = G_m | Z = G = G_m; G°(Z_(p))_+/Z(Z_(p)) = 1; G_ad° = 1; A_int = A_f^{p×}/closure(Z_(p)^×); A_int° = 1 | holds, same values as with Z° | none |
| 3.1 condition (E) vs KP | KP 4.6.3 assumes Z connected or Z_{G^der} of order prime to p | (E) "Z_G an R-smooth torus" implies Z connected | hypothesis implies the source's | none |
| 7.3 tensor generation | G_m, V = χ of weight 1 | weights of V^{⊗n} are n ≥ 0, so χ⁻¹ is not a subquotient; with V^∨ every weight occurs | needs V^∨, as §6.3 states | none |
| 2.6 / 5.3 connected fixer via RG2.3(5) | GL₂ hyperspecial; PGL₂ edge barycentre | π₁(GL₂)_I = Z torsion-free ⇒ fixer = parahoric; PGL₂ Iwahori: fixer = N(I) ⊋ I of index 2 (RG2 line 4360–4361), and the point is not very special, so (5) does not apply | consistent | none |
| 0.2 integral-shimura-stack | K^p₁ = K^p; K^p ∋ −1 | quotient by the trivial group is S_K; −1 acts on (A,λ,ε) by ε ↦ −ε = the automorphism −1 of A, so inertia μ₂ at every point | holds | none |
| 1.2 integral-crystalline-frames | ordinary E lifted over Z̆_p | D = Z̆_p², F = diag(1,p)σ, Fil¹ of rank 1; polarization tensor integral; cocharacter conjugate to μ_h⁻¹ gives weights (0,1) on D | holds | none |
| 1.4 de-rham-frame-diagram | hyperspecial GL₂ | dim GL₂ = 4, dim S = 1, dim S̃ = 5, M_loc = P¹, relative dimension of q = 4 | holds | none |
| 2.2 reflex splitting | K = Q(i) at p ≡ 1 (4) vs p ≡ 3 (4) | p splits in Q(i) iff p ≡ 1 (4); for p ≡ 3 (4) the CM field must be chosen differently, as KPZ line 3407 requires | choice matters, as stated | none |
| 3.5 component-galois-extension | CM torus T = Res_{K/Q}G_m | A_int° = 1, E_int = Gal(E^p/E); inertia at p acts through reflex-norm images of local units (KP line 3186–3189), trivially on components | holds | none |
| 3.7 free-descent-kernel | identity cover G = G₂ | Δ = 1 acts freely; for GL₂ → PGL₂, Δ = kernel of A(GL₂)° → A(PGL₂), freeness by the central-torsor twist (KP line 3334–3345) | holds | none |
| 4.1 point-newton-class | ordinary and supersingular E; frame change by p | D slopes (0,1) and (1/2,1/2); p⁻¹bσ(p) = b | holds | none |
| 4.2 newton-admissibility | GL₂ tower; b = 1 | κ(b) = v(det) = −1 for both admissible classes; b = 1 has κ = 0 ≠ −1 | both conditions needed | none |
| 4.3 newton-strata | modular curve; PGL₂ | {ordinary, supersingular} partition; PGL₂ basic classes with κ = 0 and 1 in Z/2 both have Newton point 0 | Check correct | none |
| 4.6 ordinary-locus | strongly acceptable G; quaternion unit group | split restriction-of-scalars derived factors ⇒ quasi-split ⇒ the class exists; D^× has no class with Newton point μ⁻¹ averaged (slopes (1/2,−1/2) each once contradict the denominator constraint) | hypothesis needed, stated | none |
| 4.9 isogeny-realizations | δ_D = [[0,−1],[5,0]] over F₅; ζ of order 24 over F₂₅ | δ_D² = −5; tower matrix δ_D^{−T} = [[0,−1],[1/5,0]] squares to −1/5; T² + 5 irreducible over Q₅, finite-period group Q₅(√−5)^× ≠ J_δ; ζσ(ζ) = ζ⁶ vs ζ² = δ_D² | Checks correct | none |
| 4.12 auxiliary-prime-rank | trace-2 curve over F₅, ℓ₀ = 13 | roots (1 ± 2i)/5, i ∈ Q₁₃ (5² ≡ −1 mod 13), distinct ⇒ centralizer a split torus, dimension 2 = rank GL₂ | holds | none |
| 5.3 matched-integral-comparison | GU(1,1) matched with itself | centre computed above; both projections isomorphisms of completions (KZ line 2005–2007) | holds | none |
| 7.1 intrinsic local system | trivial representation; frame change | constant rank-one sheaf, Frobenius 1; conjugation leaves characters unchanged | holds | none |
| 7.5 algebraic-common-class | SO₄: (π/3, π/4) vs (π/3, −π/4) | equal characteristic polynomials; one sign change is not in the Weyl group; half-spin characters differ | all characters needed | none |
| Headline 7.6 (KZ 5.1.4) | Q; Q(i) | Q: degree-one place at every prime; Q(i): residue degree 2 at p ≡ 3 (4), density 1/2, so the descent criterion fails and γ_y would not be rational | holds | none |
| Headline 3.8 (KPZ 7.2.21) | (PGL₂,ℍ^±), p = 3, Iwahori | cover GL₂, π₁(SL₂) = 0, connected parahoric, tower over Z₃; only p > 2 used | holds | none |
| Headline 5.9/5.10 (KZ 4.4.6, 4.4.13) | trace-2 curve over F₅ | γ₀ = companion matrix of T² − (2/5)T + 1/5 in GL₂(Q); non-real eigenvalues ⇒ elliptic; T(R)/R^× ≅ S¹ compact | holds | none |
| Headline 4.13 (HT 2.1.9) | trace-2 curve: ℓ = 13 vs ℓ = 7 | at 7 the roots are not in Q₇ (7 ≡ 3 mod 4) but the centralizer of a regular semisimple element is still a 2-dimensional torus; dimensions 2 = 2 | holds | none |
| Headline 4.7 (density) | hyperspecial curve; Γ₀(p) | finitely many supersingular points, ordinary dense; node k[[u,v]]/(uv) not locally integral, hypothesis fails | holds | none |
| Headline 6.3 (KZ 5.2.7) | x of degree one; degree m > 1 | marked point must be F_q-rational; a constant map fails the dense higher-stratum condition | holds | none |
| Build order | all 63 nodes | one forward within-layer edge (1.1 → 1.2) | R04 | R04 |

### Library declarations at the pins

Pins at content main (d0c854fb, same `lake-manifest.json` revisions as c97676f): Mathlib 6b7abb3c, Tau Ceti a91d3aaf. Opened on GitHub at those commits: `class Isocrystal` at `Mathlib/RingTheory/WittVector/Isocrystal.lean:113` (field `frob : V ≃ᶠˡ[p, k] V`, no finiteness, no tensors); `structure AbelianVariety` at `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` (`toOver`, `grpObj`, `isProper`, `geometricallyIntegral`, no polarization); `def End … := Additive (A ⟶ A)` at `TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean:83`; `theorem transpose_mul_J_mul_eq_det_smul` at `TauCeti/LinearAlgebra/Matrix/SymplecticMultiplier.lean:76` over `Matrix (l ⊕ l) (l ⊕ l) R`. All four match the contract lines 38–40.

### Cross-roadmap citations resolved (open heads per the index of 2026-10-26; board main c19c7f1)

New or reworded this round: ReductiveGroupsPartII RG2.3 fixer-versus-parahoric (5) (`README.md:4354–4363`, cites KZ Lemma 4.2.4), its scope statement placing R-smooth tori, Néron closed immersions, fixer immersions and KPZ Lemmas 7.2.11, 7.2.13 outside RG2 (`README.md:86–97`); MotivesAndAlgebraicCycles §6.3 (`README.md:1134–1138`, Deligne–Milne Propositions 2.20–2.21); ShimuraData Layer 4 (`README.md:816`, §§4.1–4.9, no multiplier sequences, fibre-product centre or fundamental form there, so the three gaps are new); CrystallineCohomology Layer CR.7 (`README.md:11171`), §CR.7.1 (11178), §CR.7.3 (11279); ShimuraCompactifications C5 (2216), C6 (3037); HeckeStacksAndLocalShtukas HS2 (937), HS2.1 (943), HS2.13 (1440); GlobalShtukasAndFunctionFieldLanglands §6.1 (1911), §6.2 (1923); NeronModelsAndSemistableAbelianVarieties §§5.1–5.2 stated for excellent DVRs (line 40). The unchanged citations (ShimuraVarieties, PELModuli, FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2, GeometricSatakeAndFusion GS0, IgusaVarieties IG.0/IG.2, AbelianSchemesAndArithmeticModuli A4/A6, AlgebraicModuli Layers 1/4/6, ArithmeticGaloisRepresentations §§5.1, 5.13, Layer 6, AutomorphicBundles B2.4–B2.7, BunGAndNewtonStrata, PadicHodgeTheory §5.5, PadicDifferentialEquationsAndRigidCohomology RD.3.43, RD.5.116, SchemeAndStackFoundations §§1.17–1.23, ShimuraData Layer 1) were resolved with line numbers in round 2 against the same index. The resolver's single lead (ReductiveGroupsPartIII absent from main and the open roadmap heads) is explained: it is a board package, consumed only through declared gaps.

### Duplication audit (by object)

R-smoothness: only ReductiveGroupsPartII mentions it, as out of scope (above); no other owner. Conj′ and Out′: owned by ReductiveGroupsPartIII RG3.0/orthogonal-outer-action (board main), consumed here through a gap (R02 makes the citation exact). Berthelot–Ogus comparison: CrystallineCohomology cites the Notes and its erratum (lines 1427, 2749, 6459, 11303), AnabelianGeometryAndNonabelianChabauty has the nonabelian comparison (line 4401); neither states the parallel-transport comparison of the gap. Common-multiplier groups: PELModuli M0.8 (line 3225) has the common-multiplier group of a product PEL datum, a different object from the fibre product over G^ad × G_m here. Tensor quasi-isogeny group I_x: AbelianSchemesAndArithmeticModuli A6.22–A6.24 (lines 3266–3333 at its open head) give the ambient Q-group Aut_Q(A), coefficient isogeny torsors and real compactness of positive similitudes modulo R^×; 4.8 cites A6.22 and defines the tensor-stabilizer subgroup, which no roadmap states; 4.10's compactness modulo scalars could cite A6.24 directly in addition to A6.14 (not a finding). Newton strata, μ-ordinary locus, very-good embeddings, KR strata, normalization of the Hodge closure: as in round 2, no other owner (`roadmaps grep` over main and 367 open heads). The board packages under review (index file) were checked by name: none overlaps.

### Gate

Prescribed command on the design README, exit 0:

```text
candidate: ShimuraVarietiesPartII is not in the merge order yet; checked as if placed after HeckeStacksAndLocalShtukas (the intake inserts it when its design is accepted)
depcheck: 56 roadmaps, 647 edges, 0 problem(s)
```

No UPWARD or CYCLE line. ReductiveGroupsPartIII, GeometricSatakeAndFusionPartII, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII and GlobalShtukasAndFunctionFieldLanglands are not in the order and enter only as gaps.

### Shape, style and Lean

Title, Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers 0–7 with `### k.n`, `**Checks.**`, `### Examples`, `### Dependencies`, Downstream consumers, References. 63 targets (6 definitions, 20 constructions, 37 theorems) equal to `plan.json` `nodes`; every node's `prerequisites` equals its README `*Needs:*` line (0 differences); every layer's `### Dependencies` line equals the union of its targets' needs minus same-layer targets (8 of 8); every definition and construction has three API bullets and at least three Checks (26 of 26); every theorem a locator. No LaTeX delimiters, no `lemma` declarations, no pull-request numbers, no process words, no double blank lines (grep = 0 each). Lean elaboration: not available (this lane does not elaborate); there is no `Suggested.lean` at the design stage and `acceptanceTest.declarations` is empty, so the `#check @name` binder audit and the one-tactic padding probe have nothing to run on. The seven headlines (`README.md:1322`: KZ 5.1.4, KPZ 7.2.21, KZ 4.4.6, KZ 4.4.13, HT 2.1.9, ordinary density, same-field curves) are not statable at the pins: the four declarations above are the only relevant carriers and none of an integral Shimura model, B(G), a tensor isogeny group, a G(Q_ℓ)-local system or Conj(G) exists in Mathlib 6b7abb3c or Tau Ceti a91d3aaf, so an empty declaration list with each headline and its missing carrier named in `acceptanceTest.headlinesNotStatable` is correct and no stand-in is used.

## Not verifiable

- The Annals text of KZ and the Duke text of HT: paywalled; the arXiv v2 and the author PDF recorded in `sources.toml` were read and the README cites those versions.
- Noot 2009, MP19, DvHKZ, PR26, Poonen 2004, Zarhin, Berthelot–Ogus 1983, Faltings 2002, de Jong 1996, Steinberg 1965 and Borel–Tits were not fetched: they are route inputs owned by declared gaps or by cited suppliers, not statement sources of this design.
- The board packages ReductiveGroupsPartIII, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII and GeometricSatakeAndFusionPartII were read at the board's main (c19c7f1), not in this pull request's branch, which predates their import.
- Lean elaboration and the padding probe: not available in this lane, and nothing to run on at the design stage.

## Source issues

- **Misprint** in KZ at Proposition 4.2.3(5), p.34: the source says the inertia coinvariants of the cocharacter group of the abelianization are torsion; it should say torsion-free, as Lemma 4.2.4 and the proof of Lemma 4.3.8 use; affects nothing.
- **Misprint** in KZ at the proofs of Proposition 4.2.3 and Lemma 4.3.8, pp.34 and 41: the source cites KPZ Propositions 7.2.14, 7.2.18 and Lemma 7.2.6 by preprint numbers; in the published KPZ these are Proposition 7.2.19 and Lemma 7.2.11; affects nothing.
- **Gap** in HT at §1.3.15, p.20: the source asserts a unique class with Newton point the averaged inverse Hodge cocharacter without an existence hypothesis; it should assume existence, automatic for quasi-split groups and false for the quaternion unit group; affects a stated result.
- **Gap** in HT at the proof of Proposition 1.3.10, p.18: the source fixes an arbitrary place of the torus reflex field above v; it should take the place induced by the fixed p-adic embedding so that the torus class is the prescribed one; affects the proof.
- **Error** in KP at Lemma 4.6.13 and Corollary 4.6.15, pp.202–203 (repeated in (4.6.20), p.205): the source uses one fixed-level connected piece for every coset representative; it should use the piece at the conjugated parahoric level; affects a stated result; corrected in print at KPZ §7.3.1(3), pp.86–87.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "27bfec4", "job": "REV-DESIGN-ShimuraVarietiesPartII~3", "model": "fable", "worker": "fable-rev184"} -->
