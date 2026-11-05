<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/428#issuecomment-6406450021 -->
Review (claude) of 55ec9e7

Verdict: needs changes

1. **F01** (P2) 4.11 states an equivalence whose converse needs the very-good hypotheses of 1.3

   **Location.** `design/README.md:945`: "two points obtained from the same A_x by prime-to-p tensor-compatible quasi-isogenies are equal exactly when the quasi-isogeny relating their complete prime-to-p level structures also identifies the canonical crystalline tensors." Hypotheses stated: "For the neat integral Hodge tower". `*Needs:*` (line 951) lists `SV2.1/tensor-separation`.

   **Claim.** The equality of normalization points is equivalent to tensor preservation, at every point of every neat Hodge model.

   **Witness.** HT Lemma 2.1.4 (HT line 989–991) proves one direction only: equal points give the same class in I(Z_(p))\G(A_f^p). The converse needs KZ Proposition 4.1.9(3) (KZ line 1368–1369), whose hypotheses are neat K^p, the embedding very good at the local-model point y, and G̃ = G (KZ line 1273, 1361–1362); 4.11 states none of them. HT Proposition 2.1.6 (HT line 1038–1046) consumes only the one-directional surjection G(A_f^p) → I(Z_(p))\G(A_f^p).

   **Repair.** Replace "are equal exactly when" by "are equal only when", keep "Thus the Hecke-orbit relation injects into the tensor-quasi-isogeny quotient relation", and delete `ShimuraVarietiesPartII:SV2.1/tensor-separation` from the `*Needs:*` line of 4.11 (4.12 consumes only this direction). Alternatively keep the equivalence and add the hypotheses of 1.3 verbatim: good Hodge normalization with G^fix = G°, neat K^p, very good at y. Tested: at a hyperspecial GL₂ point with the quasi-isogeny φ = [−1] (g₂ = −g₁) both directions hold, so the instance that separates the two statements is a non-very-good point, exactly the case 1.3 excludes; the one-directional statement is the one HT line 1038–1046 uses.

2. **F02** (P2) three declared gaps have compound `needs` sentences

   **Location.** `design/README.md:126` (gap:r-smooth-integral-groups: "R-smooth tori and centralizers, fixer closed immersions, arbitrary adjoint association independent of central lifts, R-smooth central-extension exactness and connected-fixer criteria with the exact hypotheses of KZ §§2.3–2.4 and KPZ §§7.2.5–7.2.14"); `README.md:130` (gap:hodge-representation-algebra: four statements "used in KPZ §7.2 and HT §2.1.8"); `README.md:102` (gap:crystalline-hodge-families: "crystalline–de Rham compatibility and horizontal transport …, and the log-Dieudonné comparison, semistable-alteration descent and full faithfulness"). Same text in `design/plan.json` `gaps[24]`, `gaps[26]`, `gaps[12]`.

   **Claim.** Each gap says exactly what is missing, with its hypotheses.

   **Witness.** Each sentence bundles four or five distinct theorems and gives their hypotheses only by reference to source sections. The six RG3 gaps and the seven FFG Part II gaps, by contrast, name one existing target each (board main `packages/ReductiveGroupsPartIII/design/README.md:109, 146, 165, 245, 384, 610`; `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/design/README.md:794, 1077, 1139, 1154, 1169, 1219, 1236, 1388, 1963`).

   **Repair.** Split each into one gap per statement, with the hypotheses in the sentence, the same slug in `plan.json` `gaps` and in the README, and each `*Needs:*` line citing only the slugs its route uses. A split that matches the sources: (a) gap:rg3-r-smooth-split-centralizer — for G reductive over a finite extension of ℚ_p with G^der a product of Weil restrictions of split groups and Z_G an R-smooth torus, the centralizer of a maximal F̆-split torus is R-smooth (KPZ Proposition 7.2.5, used by KZ Lemma 4.1.4, KZ line 1277–1279); (b) gap:rg3-adjoint-association — for a parahoric 𝒢 of G the parahoric of G^ad attached to the image of its building point depends only on G^ad, and for Z_G connected or Z_{G^der} of order prime to p it is the identity component of 𝒢/𝒵 (KP Lemma 4.6.2, KP line 3107–3112); (c) gap:rg3-central-extension-exactness — for 1 → Z → G → G′ → 1 with Z an R-smooth torus, exactness of the induced sequence of Kottwitz coinvariants and of parahoric integral points (KPZ Lemma 7.2.5–7.2.6); (d) gap:rg3-connected-fixer-criterion — if G^der ≅ ∏ Res_{F_i/ℚ_p} H_i with H_i split, X_*(G^ab)_I torsion-free and 𝒢 very special, then the full fixer equals the parahoric (KZ Lemma 4.2.4, KZ line 1516–1523); (e) gap:rg3-fundamental-symplectic-representations — the fundamental symplectic representations of the simple factors with their invariant forms (KPZ §7.2.1–7.2.3); (f) gap:rg3-faithful-tensor-generation — every algebraic representation of a reductive G in characteristic zero is a subquotient of sums of tensor powers of a faithful V and its dual (used by 7.3); (g) gap:rg3-matched-fibre-product-centre — the centre and derived group of the identity component of G₁ ×_{G^ad × 𝔾_m} G₂ (KZ Lemma 4.3.8 and KPZ Lemma 7.2.5, KZ line 1785–1797); (h) gap:rg3-type-d-outer-centralizer-dimension — the centralizer-dimension comparison across the orthogonal outer action (HT §2.1.8); (i) gap:cr-absolute-hodge-crystalline-transport — absolute-Hodge crystalline–de Rham compatibility and horizontal transport on a normal formal branch (HT Proposition 1.3.7, HT line 774–807); (j) gap:cr-log-dieudonne-alteration-descent — log-Dieudonné comparison, semistable-alteration descent and full faithfulness of convergent isocrystals on the possibly singular nonproper family (HT Appendix A, Lemma A.4, Proposition A.6, Corollary A.7, HT line 1746–1794). Tested: 2.6 then needs only (d); 7.3 only (f); 5.2 only (e) and (g); 0.5 only (i); 0.6 only (j).

3. **F03** (P3) a locator cites extraction line numbers

   **Location.** `design/README.md:162`: "(KZ §4.3.5, lines 1761–1763)".

   **Claim.** This is a locator into the source.

   **Witness.** "lines 1761–1763" are line numbers of the worker's text extraction, not of the paper; a reader has no such numbering. KZ §4.3.5 begins at KZ line 1751, printed page 40.

   **Repair.** Write "(KZ §4.3.5, p.40)". Tested: the statement there is the self-duality of the lattice in (V ⊕ V^∨)⁴, as the Check says.

4. **F04** (P3) ShimuraCompactifications Layer C6 is not compactification geometry

   **Location.** `design/README.md:7`: "ShimuraCompactifications Layer C6 owns compactification geometry"; `README.md:110` (gap:component-specialization): "Layer C6, integral component specialization beyond the boundary construction"; `plan.json` `gaps[16].section`.

   **Claim.** Layer C6 is the layer that owns compactification geometry and the natural home of the Hodge-type component theorem.

   **Witness.** At its open head (`TauCetiRoadmap/ShimuraCompactifications/README.md:3037`), Layer C6 is "Hilbert and modular specializations" (C6.1 "A contracting unit" … C6.12 "Cusp forms and the boundary ideal"); compactification geometry is C0–C5 and the integral layer is C5 "integral PEL compactifications" (line 2216). No Hodge-type integral compactification exists there.

   **Repair.** In Scope: "ShimuraCompactifications Layers C0–C5 own compactification geometry". In the gap, section "Layer C5, Hodge-type integral extension (new section)", in both files. Tested: the gap's `needs` sentence is unchanged and still precise.

5. **F05** (P3) process narrative, and one gap that re-asks what its supplier states

   **Location.** `design/README.md:11`: "that ownership decision is outside this package"; `README.md:96`: "; the roadmap lies outside the prescribed merge order"; `README.md:126`: "these are not assertions of the existing RG3.2 targets"; `README.md:130`: "these extensions are not claimed as existing RG3.0 or RG3.2 targets"; double blank lines at 1139–1140 and 1165–1166.

   **Claim.** The README is timeless prose.

   **Witness.** "package", "prescribed merge order" and "not claimed as existing targets" describe the review process, not the mathematics. GlobalShtukasAndFunctionFieldLanglands §6.2 at its open head (`TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:1923–1941`) already states companions for irreducible lisse sheaves on a smooth curve with a finite coefficient extension and the constant-twist reduction of §6.1 (line 1911); what the gap genuinely adds is the extension to semisimple sheaves by direct sums.

   **Repair.** Delete the four clauses and the duplicate blank lines. Shorten gap:open-curve-companions to "Extend the algebraic p-plain companion theorem of §§6.1–6.2 to semisimple lisse sheaves on smooth geometrically connected open curves over the original 𝔽_q by direct sums, allowing a constant twist and a finite coefficient extension" (the supplier stays a gap because it is not in the merge order; the sentence need not say so). Tested: line 1275's reader-facing sentence still explains why the projective finite-determinant statement is insufficient.

6. **F06** (P3) the integral component group uses a different central closure from its source

   **Location.** `design/README.md:550`: "A_int(G)=G(A_f^p)/closure(Z°(Z_(p))) *_(G°(Z_(p))_+/Z°(Z_(p))) G_ad°(Z_(p))_+".

   **Claim.** This is KP's A(G_{ℤ_(p)}).

   **Witness.** KP (4.6.3), line 3138–3146 (p.199), amalgamates over G°(ℤ_(p))_+/Z(ℤ_(p)) and divides G(𝔸_f^p) by the closure of Z(ℤ_(p)), where Z is the closure of the centre in the full model G_{ℤ_(p)}; Z° (closure in G°) appears only in the auxiliary tilde group (KP line 3126–3136).

   **Repair.** Use Z(ℤ_(p)) in both places, or add one clause saying Z°(ℤ_(p)) = Z(ℤ_(p)) under condition (E). Tested on T = 𝔾_m: both closures are the closure of ℤ_(p)^× in 𝔸_f^{p,×}, so the Check at line 568 is unaffected.

Reviewed at head 55ec9e7 of the board pull request (checkout confirmed equal to the pull request's current head). Files reviewed: `packages/ShimuraVarietiesPartII/design/README.md` (1336 lines), `design/plan.json`, `sources.toml`. Round-1 review and its repair report were read first; each round-1 finding is re-verified below with line witnesses at this head. Six findings: two P2, four P3. No P1.

## Verified sound

### Round-1 findings at head 55ec9e7

| Finding | Repaired passage | Status |
| --- | --- | --- |
| F01 (27 undeclared contracts) | `plan.json` `requests: []`, `gaps`: 28 entries; README lines 78–132 state each as "What X must provide (gap:slug)"; every `gap:` in a `*Needs:*` line is declared and every declared gap is used (script check: 28 = 28, 0 undeclared, 0 unused). No `R07.6` string remains. | repaired |
| F02 (ShimuraCompactificationsPartII) | README line 143: S is "the normalization of the Zariski closure of Sh_K(G,X) in the chosen integral Siegel model"; Zarhin via §RD.5.116 (line 64, `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:12147`); MP19 as gap:component-specialization (line 110). `grep ShimuraCompactificationsPartII` = 0. | repaired (anchor: R04) |
| F03 (fictitious owners) | 1.7 canonical-hodge-model (line 360) and 3.10 strong-adjoint-local-model-diagram (line 730) added; gap:integral-local-shimura, gap:general-connected-reduction, gap:crystalline-hodge-families, gap:noot-coarse-comparison, gap:finite-field-bertini, gap:rational-stack-presentation declared; none of the five invented names occurs (grep = 0). 3.10 routes through KZ Theorem 4.2.6(3)/Lemma 4.2.4 (KZ line 1560–1573, 1834) and KPZ 7.1.14's "if G = G° then π reduces to a G^{ad,°}-torsor" (KPZ line 3336–3337). | repaired (precision: R02) |
| F04 (two-way supply with RG3) | Marked not actionable. Reason checked: board main `packages/ReductiveGroupsPartIII/design/README.md:913–930` (RG3.5/common-frobenius-class) consumes "Kisin–Zhou Theorem 5.1.4" by source citation, naming no roadmap supplier, and line 1109 records it as a geometric input "consumed only by RG3.5". Only that file can remove the consumption; owning KZ §6 here would create a second owner of RG3.5. README line 11 records the required downstream split. | settled; reason holds |
| F05 (gate-invisible labels) | Every target and layer has a `*Needs:*` line (71 lines); gate output below places the design after HeckeStacksAndLocalShtukas. | repaired |
| F06 (over-strong hypotheses) | 1.1 (line 274): "good Hodge normalization with G^fix=G°, neat K^p, … very good at y" = KZ (A′),(B′) and Proposition 4.1.9's hypotheses (KZ line 1273–1275, 1361–1362). 1.8 (line 384): normalization only. 3.8 (line 696) and 3.9 (line 708): no (A)–(E) block. "Special Hodge model" defined at line 19. | repaired |
| F07 (theorem-availability clauses) | 4.7 (line 873): "the geometric special fibre of the normal Hodge model is locally integral" + gap:component-specialization, matching HT Corollary 1.3.16 (HT line 915–920). 1.1 cites gap:ffg-versal. 3.8 has no canonical-comparison sentence; 1.7 owns it. | repaired |
| F08 (two owners of very-good, KZ 3.2.7/3.3.2/3.4.5) | Line 19 imports very-goodness through gap:ffg-very-good; 1.2 (line 286) is the §4.1.7 point specialization with gap:ffg-integral-tensors; 1.1 cites gap:ffg-versal; 5.8 cites gap:ffg-ordinary-lift. Targets exist on board main at the lines cited under R02. | repaired |
| F09 (H¹ vs tower convention) | Lines 23, 204, 216, 220, 1207, 1217, 1248: tower V = H₁, L_ℓ = Isom_tensor(V_ℚℓ, T_ℓ(A)⊗ℚ_ℓ), H¹ = H₁^∨ ≅ H₁ ⊗ c⁻¹, pair (2/5,1/5) ↔ (2,5). Matches KZ §5.1.1 (KZ line 2077, L_ℓ = Isom(V, V_ℓ^∨), V_ℓ = H¹). Recomputed below. | repaired |
| F10 (shape) | Title "# Roadmap: …", Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers 0–7 with `### k.n`, `**Checks.**`, `### Examples`, `### Dependencies`, Downstream consumers, References. No field-label blocks; the only backticked names are the four pinned library declarations (lines 38–40). | repaired (residue: R05) |
| F11 (pins, labels, manifest) | Lines 38, 40: Mathlib 6b7abb3c…, Tau Ceti a91d3aaf… = `lake-manifest.json` on content main ff983be. Lemma 1.3.6 (386), Corollary 2.1.9 (971), Corollary 4.3.4 (993), Corollary 5.2.7 (1161, 1175), KPZ Corollary 5.3.16 p.60 (1077), KP Theorem 4.2.7 (1331), Lemma 4.6.13/Corollary 4.6.15/(4.6.20) in 4.6.18 (1333). `sources.toml`: five entries with authors, title, year, version notes, certified. | repaired (residue: R03) |
| F12 (Checks and conventions) | Line 161 (dual-numbers conjugation, computed), 817–818 (PGL₂ κ = 0, 1), 256/260 (monodromy vs Tannakian group), 885 (contrast deleted), 31 (μ_h sign on H¹), 624 (γK^pγ⁻¹ computed). | repaired |
| F13 (Lean padding) | Line 1313–1315 and `plan.json` `acceptanceTest.declarations: []`, seven headlines named as not statable with the missing carrier. | repaired |

### Principles

No route-specific shortcut: 3.8 covers every abelian-type datum at p > 2 and every connected parahoric (KPZ 7.2.21, KPZ line 3735–3763); the strongly acceptable hypotheses appear only where KZ imposes them. No re-planned roadmap: ShimuraVarieties stops at canonical towers (§8.1), PELModuli at Siegel models (M4.5–M4.6), FFG Part II and GSF Part II are imported by target. Supply is downward (gate below). Paraphrase throughout the sampled statements; no copied passage. No algorithm, no `set_option`, no sorry'd data, no Lean names of the roadmap's own.

### Seeded sample (15 targets) and locator sweep

Each sampled statement was read against the text at its locator; theorem numbers, pages and hypotheses agree unless noted.

- 1.2 (KZ §4.1.7, pp.30–31, KZ line 1331–1355): lift over O_K with K/ℚ̆_p finite (hence totally ramified), tensors integral in D by Proposition 3.3.2, frame (4.1.7.1), filtration from a cocharacter conjugate to μ_h⁻¹. Matches.
- 1.9 (KZ Theorem 4.4.4, p.43, KZ line 1887–1896; KPZ 7.2.21(2), p.85, line 3749): normality via integral local-model fibre at very special level; étale-local model. Matches.
- 3.4 (KP Lemmas 4.5.2, 4.5.4, 4.5.7, 4.5.9, pp.194–197, KP line 2954–3046): central torsor, level γK^pγ⁻¹ (KP line 2980), normalization, lift to the adjoint frame torsor. Matches.
- 4.1 (HT §1.3.8, p.18, HT line 808–815; KZ §4.4.2, p.43, line 1875–1879): frame by Steinberg, b up to σ-conjugacy, class in B(G,{μ⁻¹}). Matches.
- 4.2 (HT Lemma 1.3.9, p.18, line 818): admissibility of ([b], {μ_X⁻¹}). Matches.
- 4.3 (HT Theorem 1.3.14, pp.19–20, line 885–900): closed lower sets, locally closed strata, nonemptiness under (1.1.3.1). Matches.
- 4.5 (HT Proposition 1.3.10, p.18, line 821–835, with (1.1.3.1) line 284 and 1.2.5 line 648): torus reduction; the README's "place induced by i_p" sharpens HT's "fix a place v′|p" (HT line 829). Matches.
- 4.8 (HT §2.1.3–2.1.5, pp.21–22, line 969–1025; KZ §4.1.10, p.32): I_x as tensor stabilizer in Aut_ℚ(A), I(ℤ_(p)) = I(ℚ) ∩ Aut (HT line 1009). Matches.
- 4.11 (HT §2.1.4, p.22; Proposition 2.1.6, pp.22–23): one direction only. R01.
- 4.12 (HT Proposition 2.1.6, line 1036–1047; K17 Corollary 2.1.7, p.31, line 1381–1395): split ℓ₀, finite orbit, Borel containment, proper and affine quotient. Matches.
- 5.2 (KZ §4.3.7–Lemma 4.3.8, pp.40–42, line 1770–1800; §4.4.6–4.4.7): G₃ = (G₂ ×_{G^ad×𝔾_m} G)°, derived isomorphism to G, E′_v = E₂_v (line 1910–1913). Matches.
- 5.5 (KZ Proposition 4.4.8 and (4.4.9.1), pp.44–45, line 1938–1966): product over the common-multiplier moduli. Matches.
- 5.9 (KZ Theorem 4.4.6, proof §4.4.11, pp.43–46, line 1900–1903, 1994–2031): special lift with I_x(ℚ)-action, transport by prime-to-p and p-power quasi-isogenies. Matches.
- 5.10 (KZ Corollary 4.4.13, Remark 4.4.14, p.46, line 2038–2056): γ₀ ∈ G(ℚ) conjugate to γ_ℓ, elliptic over ℝ. Matches.
- 7.5 (KZ §5.3.6, p.55, line 2428–2439; §5.3.2, line 2370–2374): algebraicity via the finite map Conj_G → Conj_{GL(V)}, equality by Steinberg's character theorem. Matches.

Locator sweep: 61 further locators (every KZ, HT, KPZ, KP and K17 citation in the README, including the "Source conventions and corrections" list) were resolved to a statement line and its printed page (KP: journal page = extraction page + 120). All 61 agree with the README's pages. The only defect is the extraction-line citation of R03.

### Adversarial table

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conv. point count (line 32) | y² = x³ + x over 𝔽₅ | x = 0,1,2,3,4 give 1,0,1,1,0 affine points (2, 3 are non-squares; 10, 30 ≡ 0); #E = 4, a = 2 | holds | none |
| Conv. H₁/H¹ polynomials | same E | H¹: T² − 2T + 5, roots 1 ± 2i; H₁: roots (1 ∓ 2i)/5, T² − (2/5)T + 1/5; H₁ ⊗ c⁻¹ with c = 1/5 multiplies roots by 5: T² − 2T + 5 | holds | none |
| Conv. V^∨ ≅ V ⊗ c⁻¹ | ψ(gv,gw) = c(g)ψ(v,w) | g·ψ(v,·) = ψ(v, g⁻¹·) = c(g)⁻¹ ψ(gv,·): V → V^∨ is equivariant from V ⊗ c⁻¹ | direction correct | none |
| Conv. Frobenius norm | Teichmüller ζ of order 24 in W(𝔽₂₅), σ(ζ) = ζ⁵ | δσ(δ) = ζ⁶; δ² = ζ²; residue extension 𝔽₅ → 𝔽₂₅: (2,5) → (4 − 10, 25) = (−6, 25), tower (−6/25, 1/25) | holds | none |
| Conv. Newton bound {μ_h⁻¹} | ordinary E, tower V | μ_h on H₁ = (1,0); ρ^∨(b) = diag(1,p) on D ⇒ ρ(b) = diag(1,p⁻¹), ν = (0,−1) = (μ_h⁻¹)_dom, κ = −1 = κ(μ_h⁻¹); D slopes (0,1) | consistent with line 31 | none |
| Conv. SL₂(ℝ) | rotations by ±π/2 | trace 0 both; conjugator anticommutes with J, det < 0 | holds | none |
| 0.1 integral-hodge-data | GL₂ hyperspecial; dual numbers; Zarhin | normalization = identity on the smooth curve; U = [[1,ε],[0,1]]: U e₁ U⁻¹ = [[1,−ε],[0,0]] ≠ e₁; (E × E^∨)⁴ = E⁸ has dimension 8 | Checks correct | R03 locator |
| 0.3 prime-to-p-tower | Y(9) → Y(3), p ≠ 3 | kernel 1 + 3M₂(ℤ/9) has 3⁴ = 81 elements, finite étale | holds | none |
| 0.4 etale-tensors | E₁ × E₂ | e₁ = diag(1,0) fixed by diagonal frames, sent to e₂ by the swap | holds | none |
| 0.6 global-crystalline-realization | constant ordinary family | D slopes (0,1), det slope 1 = 1(−1); Frobenius-forgetting monodromy trivial; H ⊇ 𝔾_m | holds | none |
| 1.1 adapted-branch-interface | hypotheses vs KZ 4.1.9 | README: G^fix = G°, neat, very good at y; KZ: (A′) G̃ = G, K^p neat, very good at y | equal | none |
| 1.2 integral-crystalline-frames | ordinary E, lift over ℤ̆_p | D = ℤ̆_p², F = diag(1,p)σ, Fil¹ rank 1 = H^{1,0}; polarization tensor integral; rank 0: trivial | holds | none |
| 1.4 de-rham-frame-diagram | GL₂ hyperspecial | dim S = 1, dim GL₂ = 4, dim S̃ = 5, dim M_loc = dim ℙ¹ = 1, rel. dim q = 4 | holds | none |
| 1.5 same-field-henselizations | connected vs ℤ/2 fibre | H¹(𝔽_q, connected smooth) = 1; H¹(𝔽_q, ℤ/2) = ℤ/2 | hypothesis needed, stated | none |
| 1.7 canonical-hodge-model | 𝔸¹_{ℤ_p} vs blow-up at (p,t) | equal generic fibres; special fibres with 1 and 2 components | generic identity insufficient, as stated | none |
| 1.9 special-fibre-geometry | hyperspecial; Γ₀(p) | ℙ¹_k integral; k[[u,v]]/(uv): u,v ≠ 0, uv = 0, not a domain | holds | none |
| 2.1 strongly-acceptable-triple | GU(1,1) split at p; GSp_{2g} | GU: dim 5, derived SL₂, Z^c = U(1) ≅ 𝔾_m over ℚ_p; GSp: Z_{G,0} = 1, Z^c = μ₂ (KZ line 1476–1479) | Checks correct | none |
| 2.6 strong-auxiliary-cover | KZ 4.2.3(4)–(5) | (4) Z_G R-smooth torus, Z^c tame Weil restrictions; (5) printed "torsion", used as torsion-free at line 1795 | holds | none |
| 3.1 integral-component-groups | T = 𝔾_m | A_int° = 1; closure of ℤ_(p)^× in 𝔸_f^{p,×} for either central closure | holds | R06 convention |
| 3.2 reflex-units | KP 4.3.2 | map from E^×[μ_h⁻¹] through the norm kills O_E^× (KP line 2760–2763) | holds | none |
| 3.4 adjoint-twisting-action | γ = diag(ℓ,1); γ = 1; central torsor | γK_ℓγ⁻¹ ∋ [[1,0],[ℓ⁻¹,1]] ∉ K_ℓ; identity transport; for GL₂ every γ ∈ PGL₂(ℤ_(p)) lifts (Pic ℤ_(p) = 0) so P_γ is trivial; for centre U(1) of ℚ(i), H¹(ℚ,U(1)) = ℚ^×/N ∋ [3] ≠ 1, so a lift can fail | holds | none |
| 3.6 conjugate-level-gluing | Iwahori I, j = diag(p,1) | j[[1,0],[p,1]]j⁻¹ = [[1,0],[1,1]] ∉ I | dichotomy real | none |
| 3.8 abelian-integral-model | (PGL₂, ℍ^±), p = 3, Iwahori | auxiliary cover GL₂, π₁(SL₂) = 0, tower over ℤ₃; KPZ 7.2.21 needs only p > 2 | holds | none |
| 3.10 strong-adjoint-local-model-diagram | GU(1,1) split at p; CM torus | dim G_ad = 3, dim S̃_ad = 4, rel. dim 3; full group dim 5, S̃ dim 6; torus: G_ad = 1 | Checks correct | none |
| 4.1 point-newton-class | ordinary/supersingular E; frame change by p | D slopes (0,1) vs (1/2,1/2); p⁻¹ b σ(p) = b | holds | none |
| 4.2 newton-admissibility | GL₂ tower | κ(b) = v(det ρ(b)) = −1 for both classes; b = 1 has κ = 0 ≠ −1 and fails | both conditions needed | none |
| 4.3 newton-strata | modular curve; PGL₂ | partition {ordinary, supersingular}; PGL₂ basic classes b = 1 and [[0,1],[p,0]] both ν = 0, κ = 0 and 1 in ℤ/2 | Check correct | none |
| 4.5 special-reduction-nonempty | y² = x³ + 1 over 𝔽₅; CM by ℚ(i) at p = 5 | 5 ≡ 2 mod 3: trace 0, slopes (1/2,1/2); ℚ(i): two places, κ_T = (1,0) vs (0,1) in X_*(T)_Γ = ℤ² differ | place matters, as stated | none |
| 4.6 ordinary-locus | strongly acceptable G | G^der = ∏ Res H_i split ⇒ G quasi-split ⇒ ordinary class exists (HT line 289) | holds | none |
| 4.7 ordinary-density | hyperspecial curve; Γ₀(p) | finitely many supersingular points, ordinary dense; node not locally integral, hypothesis fails | holds | none |
| 4.8 tensor-isogeny-group | supersingular E; E × E; [2] | I = B^× (polarization only); projectors exclude the swap; [2] ∈ I(ℚ) (scales ψ by 4), degree 4, ∉ Aut | Checks correct | none |
| 4.9 isogeny-realizations | δ_D = [[0,−1],[5,0]]; ζ of order 24 | δ_D² = −5, T² + 5 irreducible over ℚ₅ (v(−5) = 1), centralizer ℚ₅(√−5)^×; tower square −1/5; ζσ(ζ) = ζ⁶, tower scalar ζ⁻⁶ | Checks correct | none |
| 4.10 rosati-reductivity | supersingular; ordinary CM | B^×(ℝ)/ℝ^× ≅ SO(3); K^×(ℝ)/ℝ^× ≅ S¹; ℝ^× itself noncompact | holds | none |
| 4.11 hecke-orbit-tensor-injectivity | hyperspecial GL₂ point, φ = [−1] | g₂ = −g₁ gives the same point; both directions hold there; converse in general needs KZ 4.1.9(3) | overclaim | R01 |
| 4.12 auxiliary-prime-rank | y² = x³ + x over 𝔽₅, ℓ₀ = 13; supersingular over 𝔽₅ vs 𝔽₂₅ | roots (1 ± 2i)/5 ∈ ℚ₁₃ (13 ≡ 1 mod 4), distinct: centralizer a split torus of dim 2 = rank GL₂; supersingular over 𝔽₅: γ not scalar, centralizer dim 2 < dim B^× = 4; over 𝔽₂₅: γ² = −1/5 scalar, centralizer GL₂ dim 4 | stabilization needed, as stated | none |
| 4.13 all-prime-tate-comparison | same | dimensions 2 = 2 and 4 = 4 after stabilization | holds | none |
| 5.1 integral-datum-maps | hypotheses vs KZ 4.3.1 | G̃ = G, G̃′ = G′, map of parahorics, good embeddings (KZ line 1626–1635); completions isomorphic under derived isomorphism and association (line 1640–1643) | equal | none |
| 5.2 matched-multiplier-datum | diag(2,1) ⊕ diag(3,1) | multipliers 2 and 3, no common c; two copies with c = 2: direct sum has c = 2 | Checks correct | none |
| 5.5 product-abelian-comparison | E₁ × E₂; G₁ = G₂, f = id | H¹ rank 4, e₁² = e₁, e₂² = e₂, e₁e₂ = 0, e₁ + e₂ = 1; identity datum gives A₃ = A × A with the diagonal | holds | none |
| 5.8 ordinary-hodge-special-lift | hypotheses vs KZ 4.1.11 | README: special Hodge model (good, G^fix = G°), ordinary, very good at y; KZ line 1410–1413 the same under (A′),(B′) | equal | none |
| 5.9 ordinary-strong-special-lift | KZ 4.4.6 | special lift over K/ℚ̆_p finite; transport by p-power quasi-isogeny (KZ line 2026–2031) | holds | none |
| 5.10 ordinary-rational-frobenius | y² = x³ + x over 𝔽₅ | γ₀ = companion matrix of T² − (2/5)T + 1/5 in GL₂(ℚ); eigenvalues non-real ⇒ elliptic; T = ℚ(i)^×, T(ℝ)/ℝ^× ≅ S¹ | holds | none |
| 6.1 kr-stratification | GU(1,1) hyperspecial | one Schubert cell (M_loc = ℙ¹ smooth); two Newton classes | Check correct | none |
| 6.3 same-field-curves | 𝔸¹ marked at 0; λ ≠ μ | 0 ∈ 𝔸¹(𝔽₂), t ≠ 0 has the point 1; KZ 5.2.7 assumes λ ≠ μ (KZ line 2322), top stratum by the ordinary curve (line 2411–2418) | holds | none |
| 7.2 frobenius-quotient-point | g = diag(1,1/5); 𝔽₂₅ | T² − (6/5)T + 1/5; det(1 − gT) monic gives T² − 6T + 5 (reciprocal); over 𝔽₂₅: T² + (6/25)T + 1/25 | Checks correct | none |
| 7.3 representation-unit-eigenvalues | Sym² of the trace-2 point | eigenvalues ((1 ± 2i)/5)², 1/5: valuations 0 away from 5 | holds | none |
| 7.4 representationwise-independence | constant rank-one q | twist by q⁻¹ gives Frobenius 1; §6.2 of GlobalShtukas handles the p-plain twist | holds | R05 gap text |
| 7.5 algebraic-common-class | SO₄: (π/3, π/4) vs (π/3, −π/4) | same characteristic polynomial; odd sign change is outside the Weyl group, classes differ; half-spin characters separate | holds | none |
| 7.6 common-frobenius-class | ℚ; ℚ(i) | ℚ: degree one everywhere; ℚ(i): f = 2 at primes ≡ 3 mod 4, density 1/2, fails; Conj(G)(ℚ) → Conj(G)(ℚ_ℓ) injective, uniqueness | holds | none |

### Library declarations at the pins (opened on GitHub at the manifest commits)

- Mathlib 6b7abb3c: `class Isocrystal` at `Mathlib/RingTheory/WittVector/Isocrystal.lean:113`, fields `frob : V ≃ᶠˡ[p, k] V` over `Module K(p, k) V`; no finite-dimensionality, no tensors, as the contract says.
- Tau Ceti a91d3aaf: `structure AbelianVariety` at `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` (`toOver`, `grpObj`, `isProper`, `geometricallyIntegral`; no polarization); `def End … := Additive (A ⟶ A)` at `TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean:83`; `theorem transpose_mul_J_mul_eq_det_smul` at `TauCeti/LinearAlgebra/Matrix/SymplecticMultiplier.lean:76` (rank two: `l ⊕ l` with `l` a singleton).

### Cross-roadmap citations resolved (open heads per the index of 2026-10-26; board packages at board main 68a9a5c)

ShimuraVarieties §§4.5 (line 1084), 5.6 (1447), 6.3–6.7 (1659–1752), 8.1 (2201); PELModuli M4.5–M4.6 (3269, 3324), M6.1–M6.4 (3737–3809); FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2 (2986; R07.2.12 gives μ_{p^∞}, ℚ_p/ℤ_p); ReductiveGroupsPartII RG2.0 (438), RG2.1 (1446), RG2.3 (3761); GeometricSatakeAndFusion GS0 (218, 526); IgusaVarietiesAndTorsionConcentration IG.0 (118), IG.2; AbelianSchemesAndArithmeticModuli A4.1 (1764), A4.3 (1842), A4.8 (2251), A4.9 (2270), A6.7 (2865), A6.14 (2992), A6.20 (3240), A6.21 (3254), A6.22 (3266), A6.28 (3452), A6.29 (3498); AlgebraicModuliForArithmeticGeometry Layers 1 (311), 4 (1744), 6 (8906, "G-rings and algebraic approximation"); ArithmeticGaloisRepresentations §5.1 (3102), §5.13 (3452, function-field Frobenius and recognition), Layer 6 (3573); AutomorphicBundles B2.4–B2.7 (1407–1534); BunGAndNewtonStrata §§0.5 (177), 0.8 (303), 1.16 (758, twisted norm centralizer), 1.22–1.26 (884–958), 1.28 (1018), 1.29 (1032), 1.34 (1104), 1.37 (1161), 2.16 (1608, Kottwitz local constancy in families); HeckeStacksAndLocalShtukas HS2 (937), HS2.1 (943), HS2.13 (1440); MotivesAndAlgebraicCycles Layer 6 (1099); PadicHodgeTheory §5.5 (1076; defines B(G,{μ}) with κ(b) = μ^♮ and the period-torsor class κ(b) − μ^♮); PadicDifferentialEquationsAndRigidCohomology RD.3.43 (7195: convergent F-isocrystal on a noetherian scheme over a perfect field) and RD.5.116 (12147, Zarhin's trick); SchemeAndStackFoundations §§1.17–1.23 (2625–3022); ShimuraData Layers 1 (167), 4 (816); NeronModelsAndSemistableAbelianVarieties §5.1 (2840, stated for an excellent DVR at line 830, so the gap is genuine), §5.2 (2902); CrystallineCohomology CR.7 (11171); GlobalShtukasAndFunctionFieldLanglands §§6.1–6.2 (1911, 1923; identical on board main). Board packages: FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII TD.2/very-good (794), TD.3/nonexceptional-embedding (1077), D-central-cover (1139), A-central-cover (1154), polarized-chain (1169), TD.4/integral-tensor-frame (1219), crystalline-tensor-integrality (1236), versal-adapted (1388), TD.6/ordinary-adapted-lift (1963); GeometricSatakeAndFusionPartII LM.3/canonical-abelian-model (458), LM.5/same-field-curve (832), LM.7/general-normal-representative (1023); ReductiveGroupsPartIII RG3.0/conjugacy-quotient (109), character-separation (146), faithful-quotient-finite (165), RG3.1/degree-one-residue-descent (245), RG3.2/elliptic-maximal-torus (384), RG3.3/cyclic-torus-and-neatness (610). The resolver's one lead (ReductiveGroupsPartIII absent from main and the open roadmap heads) is explained: it is an accepted board package, consumed only through declared gaps.

### Gaps (28 declared, same slugs in `plan.json` and the README)

Supplier named for all 28 (none unowned). Thirteen cite existing targets (FFG Part II, GSF Part II, RG3) and are precise and minimal. Minimality checked for the rest: no finite-field Bertini with a prescribed point exists (LefschetzPencilsAndVanishingCycles §5.1 and DeligneWeightsAndPurity use generic Bertini over infinite fields); no LMB smooth presentation with a rational point; NeronModels §6.0 is Noot's specialization of Galois images (1995), not the 2009 Conj′ comparison; no Borel-containment lemma for compact quotients anywhere (grep over main and 367 open heads); NeronModels §5.1 is stated for excellent DVRs; CR.7.1 is proper-smooth coefficient theory without HT's Appendix A. Compound sentences: R02. Section anchor: R04. Over-asking: R05 (companions).

### Duplication audit (by object, main and 367 open heads)

Normalization of the Hodge closure: no other owner (FaltingsFinitenessAndIsogenyTheorems mentions normalization of a closure for a different object). Newton strata: IgusaVarietiesAndTorsionConcentration (PEL, hyperspecial) and BunGAndNewtonStrata (B(G), families) are cited; the Hodge-type strata on normalized models are new and the agreement is a Check (line 819). Very-good embeddings and KR strata: no other README. μ-ordinary locus: PELModuli, PerfectoidShimuraVarieties, HodgeTateAndCanonicalSubgroups treat PEL or Hodge–Tate ordinary loci; the Newton-defined locus on normalized Hodge models is not restated there. Conj(G): RG3.0 owns it, imported. Tensor quasi-isogeny group I_x: no other owner. Common Frobenius class: RG3.5 is a consumer (above). Ownership against open pull requests was checked with `roadmaps grep` over the full index; the board packages under review (index file) were checked by name: none overlaps.

### Gate

Prescribed command on the design README, exit 0:

```text
candidate: ShimuraVarietiesPartII is not in the merge order yet; checked as if placed after HeckeStacksAndLocalShtukas (the intake inserts it when its design is accepted)
depcheck: 56 roadmaps, 647 edges, 0 problem(s)
```

No UPWARD or CYCLE line. ReductiveGroupsPartIII, GeometricSatakeAndFusionPartII, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII and GlobalShtukasAndFunctionFieldLanglands are not in the order and enter only as gaps.

### Shape and Lean

63 targets (6 definitions, 20 constructions, 37 theorems), equal to `plan.json` `nodes`; every node's `prerequisites` equals its README `*Needs:*` line (script: 0 differences). Every definition and construction has three API bullets and at least three Checks; every theorem a locator; every layer `### Examples` and `### Dependencies`. `sources.toml` parses; the five SHA-256 values equal `plan.json` `sources`. Lean elaboration: not available (this lane does not elaborate); there is no `Suggested.lean` at the design stage and `acceptanceTest.declarations` is empty, so the `#check @name` binder audit and the one-tactic padding probe have nothing to run on. The seven headlines (KZ 5.1.4, KPZ 7.2.21, KZ 4.4.6, KZ 4.4.13, HT 2.1.9, ordinary density, same-field curves) are not statable at the pins: no integral Shimura model, B(G), tensor isogeny group or Shimura local system exists in Mathlib 6b7abb3c or Tau Ceti a91d3aaf (grep over both at the pins; the four declarations above are the only relevant carriers), so an empty declaration list is correct and no stand-in is used.

## Not verifiable

- The Annals text of KZ and the Duke text of HT: paywalled; the arXiv v2 and author PDF recorded in `sources.toml` were read, and the README cites those versions.
- PR24, PR26, DvHKZ, MP19, P23, Chin 2004, Noot 2009, LMB, Poonen 2004, Zarhin and Anschütz were not fetched: they are route inputs owned by declared gaps or by cited suppliers, not statement sources of this design.
- The pull-request head of CrystallineCohomologyPartII (board package #296) was not read; it is not cited.
- The board packages FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII, GeometricSatakeAndFusionPartII, ReductiveGroupsPartIII and GlobalShtukasAndFunctionFieldLanglands were read at the board's main (68a9a5c), not in the pull request's branch, which predates the ReductiveGroupsPartIII import.

## Source issues

- **Misprint** in KZ at Proposition 4.2.3(5), p.34: the source says the inertia coinvariants of the cocharacter group of the abelianization are torsion; it should say torsion-free, as Lemma 4.2.4 and the proof of Lemma 4.3.8 use; affects nothing.
- **Gap** in HT at §1.3.15, p.20: the source asserts a unique class with Newton point the averaged inverse Hodge cocharacter without an existence hypothesis; it should assume existence, automatic for quasi-split groups and false for the quaternion unit group; affects a stated result.
- **Gap** in HT at the proof of Proposition 1.3.10, p.18: the source fixes an arbitrary place of the torus reflex field above v; it should take the place induced by the fixed p-adic embedding so that the torus class is the prescribed one; affects the proof.
- **Error** in KP at Lemma 4.6.13 and Corollary 4.6.15, pp.202–203 (repeated in (4.6.20), p.205): the source uses one fixed-level connected piece for every coset representative; it should use the piece at the conjugated parahoric level; affects a stated result; corrected in print at KPZ §7.3.1(3), pp.86–87.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "55ec9e7", "job": "REV-DESIGN-ShimuraVarietiesPartII~2", "model": "fable", "worker": "fable-rev180"} -->
