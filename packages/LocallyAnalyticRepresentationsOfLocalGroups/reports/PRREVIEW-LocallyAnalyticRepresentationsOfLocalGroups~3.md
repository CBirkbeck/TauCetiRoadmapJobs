# Review of LocallyAnalyticRepresentationsOfLocalGroups (pull request #2294 at 4bfb6db)

**Verdict:** accepted

Full review of the head (219 lines changed since `c71cc7d`). No finding. The acceptance is conditional on the declared supplier gaps (barrelled-banach-steinhaus, compact-type-tensor, kostant-split-reductive, generic-principal-series-finite-coefficients, principal-series-jacquet-finite-coefficients, finite-length-finite-coefficients, ordered-character-map).

## Previous findings

The previous review (at `c71cc7d`) raised no new finding; of the findings it tracked, only the deferred one remained open.

- R03 — not repaired: deferred (D01)

## Deferred findings

- D01 — stands

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 0.1 (iv), BR16 (3) | L = ℚ_p(√p), p odd; trivial group | √p ⊗ 1 ↦ (√p, −√p), E^(Σ_L) of dimension 2; U(g ⊗ E) = E; BR16 line 252, p. 7 | holds |
| 1.10 (2), SCH11 Prop. 4.7 | GL_2(ℚ_p), W_i = 1, λ = 0; generic π_sm of GL_n(L) | rows q = 1, 2 of (4.27) vanish; Hom_sm(PGL_2) = 0; Ext¹_(∞,ω)(π_sm, π_sm) of dimension n − 1 with i_0 = 0; SCH11 lines 1679–1697 | holds; printed form refuted |
| 2.1, ST02B Lemma 3.4, EM17 6.2.9, 6.2.16 | x ↦ x on ℚ_p^×; c_0(ℕ, E) trivial over ℤ_p | p acts by p, no invariant lattice, dual of dimension 1; dual killed by the augmentation ideal, infinite-dimensional; ST02B line 514, EM17 lines 5999, 6072 | holds |
| 2.3 (iv)–(v) Mahler stages | p odd h = 1, p = 2 h = 1; ℤ_p acting by ζ_p | s_1 = p^(−1/(p−1)), 2^(−1/2), both in (1/p, 1); v_p(⌊k/p^(n+1)⌋!) ≤ r_(n+2)k; Π^((1)) = 0, Π^((2)) = E | holds |
| 2.5 strong LA-acyclicity, PAN22 Thm 2.2.3 | B = E, coefficient module E ⊗̂ C^an(G_n) | unit ball mod p = 𝔽_p[y], y ↦ y + pa ≡ y: trivial action, not admissible; PAN22 lines 573, 588 | holds |
| 3.9, RJRC22 Thm 1.5, Cor. 1.6 | M = ℤ_p, V = C(ℤ_p, E); V finite-dimensional | H^0 = E·1 on both sides, H¹_cont(V) = 0 by Shapiro; V^la = V; RJRC22 lines 203–215, p. 5 | holds |
| 4.2, OS15 §2.5, Def. 2.6, Lemma 2.8 | ℚ_3[t]/(t² − 3) for Lie(𝔾_m); sl_2 with SL_2 and PGL_2 | X² − 3 has no root: ℚ_3-weight spaces sum to 0; X = ℤϖ against 2ℤϖ; OS15 lines 283–342 | holds; source's O^g refuted |
| 4.4, BR15 §4 | gl_2, λ = (1, 0) | L(λ)^∨ weight (1, 0), contragredient −w_0λ = (0, −1); M(λ)^∨ has socle L(λ); BR15 lines 590–593, p. 14 | holds |
| 4.5 Verma multiplicities | n = 2, λ = (1, 1); n = 3 with W_P = ⟨s_1⟩ | s·λ = s(1, 0) − (0, −1) = (0, 2), −s·λ = (0, −2); L⁻(−s_1·λ) absent, L⁻(−s_2·λ) once; DING25 lines 1488–1505 | holds |
| 4.6 Kostant homology | GL_2, Sym^k, both radicals | lower: H_0 (k, 0), H_1 = (0, k) + (−1, 1) = (−1, k + 1) = s·λ; upper: (0, k), (k + 1, −1) = −(s·(0, −k)) | holds |
| 5.1, BR16 (4), Lemma 2.2; EMJ2 2.1.2 | P = G; GL_2, W = E² | Ind_G^G U = U; f(p) ⊗ p·w is P-equivariant, f(p) ⊗ w is not; BR16 lines 297–349, EMJ2 line 977, p. 21 | holds |
| 5.2, OS10 Thm 3.1.3 | GL_1; GL_2 unnormalised lower-Borel induction | PS(χ) = χ; Ind_(B⁻)(χ_2 ⊠ χ_3) = i(χ_2\|·\|^(1/2) ⊠ χ_3\|·\|^(−1/2)), reducible iff χ_2χ_3⁻¹ ∈ {1, \|·\|^(−2)}; OS10 line 434, p. 13 | holds |
| 5.3 character spaces | n = 0; n = 2, d_L = 2; blocks (2, 1), L = ℚ_p | Hom_(g′) = 0; 6, 2, 4; Hom_(P,g′) of dimension 3 + 2 = 5, contains log_p(t_3), not log_p(t_1) | holds |
| 5.5, SCH11 Cor. 4.9, (4.28)–(4.38) | GL_2(ℚ_p), Σ = 1, ρ = z^((0,2)), P = B⁻ | H_0 weight 0, H_1 weight (−1, 1) = s·0; both ≠ (0, 2): all Ext vanish; SCH11 lines 1729–1781, pp. 81–82 | holds |
| 6.1, OS15 §4.1, Prop. 4.8; BR16 Thm 2.3 | Verma M⁻(μ); split torus | F(M⁻(μ), χ) = Ind z^(−μ)χ; for G = T both sides are the line z^λχ; OS15 lines 707, 860; BR16 line 405, p. 10 | holds |
| 6.7, DING19 Lemma 2.26 | n = 2, L = ℚ_p; n = 2, d_L = 2; lg(s) = 1 | no s of length 2; s = (s, s); E_2^(1,0), E_2^(0,1) carry weights of length 0, 1 ≠ s·μ; DING19 lines 1084–1097, p. 29 | holds |
| 7.2, EMJ2 Lemma 0.3, 2.8.3, Cor. 5.1.4 | split torus; GL_2, U = z^((0,2))χ | I(χ) = χ; ⟨(0, 2) + ρ, α^∨⟩ = −1, Verma simple, I(U) the full induction; EMJ2 lines 63, 2089, 2835 | holds |
| 8.3–8.7, DING25 Prop. 3.1, Lemma 3.2 | n = 3, w = (1 2 3), w′ = (2 3)w, w″ = (1 2)w | w(w′)⁻¹ = (2 3) ∈ W_1, w⁻¹(1) = w′⁻¹(1) = 3, forward images 2, 3; (1 2) ∉ W_1; DING25 lines 1488–1535 | holds; label w⁻¹ confirmed |
| 8.8 (2) transition identity | n = 3, u = (1 2 3), φ(3) = (2, 4, 8) | u·ψ_1 = ψ_2; p_u(2, 4, 8) = (8, 2, 4) = u(φ); symmetric values (14, 56, 64), first-order parts (2, 24, 64) on both sides | holds |
| 8.12 dimension formula (headline) | n = 1; n = 2, L = ℚ_p; n = 3 | 1 + d_L; (2 + 1) + 2 = 5, source ⊕_w Hom of dimension 8; 3 + 7 = 10; (3.12) with I ⊆ {1, …, n − 1} would give 4 for n = 2 | holds |
| 9.4, 9.6, 9.7 parabolic maps (headline) | blocks (2, 1), L = ℚ_p; endpoint parabolics | #S = 3, dim 7 = (2 + 3) + (1 + 1); 2(n + 2d_L + (2^(n−1) − 2)d_L) − (n + d_L) = n + (2^n − 1)d_L | holds |
| 10.1–10.2, DING25 §3.1.4; BR19 Lemme 2.1.1 | L = ℚ_p; L = ℚ_3(√3), χ_1 and χ_(1/2) on 1 + 3O_L | Ext¹_σ = Ext¹; differentials 1, 1/2 against m ∈ ℤ; 2m = 1 unsolvable after squaring; DING25 line 1935, BR19 line 405 | holds |
| 10.5, 10.7 decomposition over embeddings (headline) | n = 2, d_L = 2; n = 1 | dim Ext¹_σ = 5, Ext¹ = 8, Ext¹_g = 2, (5 − 2) + (5 − 2) = 6 = 8 − 2; 2 = n + 2^n − 1; 4 + 4 − 3 = 5 | holds |
| 1.3 anti-equivalence, 1.8 Ext¹ (headlines) | G discrete; ℚ_p^×, x ↦ x; G = ℤ_p | finite-dimensional duality; δ_x acts by x⁻¹; Ext¹(E, E) = Hom(ℤ_p, E) = E; ST03 line 1333, BR19 lines 405–420 | holds |
| 6.4 irreducibility (headline) | GL_2, χ_1 = χ_2; χ_1χ_2⁻¹ = \|·\|; 𝔾_m with π = 0 | length 2; normalised ratio \|·\|² ∉ {\|·\|^(±1)}, irreducible; F(M_0, 0) = F(M_1, 0) = 0 | holds |
| 7.4, 7.5 adjunction (headline) | ℚ_3^×, 3 ↦ (0 3; 1 0) on E² | X² − 3 irreducible, J_G(V) = V of dimension 2; U = restriction of scalars of χ̃ from E(√3); EMJ2 lines 142–150 | holds |
| 3.7 Grothendieck property (headline) | M = 1; S a point | Mod(E) with generators E_■[S]; P_(pt,N) = c-Ind_N^M E; BCGP25 line 1082, pp. 22–23 | holds |

- Source locators checked against the text (theorem number and page): about 140 in 19 sources, with the statements read for the fifteen sampled targets (BR16, BR15, BR19, SCH11, DING25, DING19, OS15, OS10, EM17, EMJ2, ST01, ST02, ST02B, ST03, RJRC22, PAN22, CD14, BH20, BCGP25); every one at the page cited. The README flags none as unverified.
- Library declarations opened at the pin: `TauCeti/Algebra/Lie/HighestWeight/Verma.lean` lines 195, 525; `Existence.lean` line 234; `CompleteReducibility.lean` line 259; `Reductive/CompleteReducibility.lean` line 107; `CentralCharacter/Isomorphism.lean` lines 106, 159; `UniversalEnveloping/PBW/Basis.lean` line 27; `CompletedGroupAlgebra/Basic.lean` line 145; `Distribution/AnalyticStage.lean` line 107, `LocallyAnalytic.lean` line 45; Mathlib `Analysis/LocallyConvex/Barrelled.lean` lines 90, 122, 164, 192; `ContCohomology/Basic.lean` line 131; `Topology/Algebra/Module/LocallyConvex.lean` line 51.
- Cross-roadmap citations resolved: 50, on main (PadicFunctionalAnalysis §§2.1, 2.3, 3.2, 4.4; ReductiveGroups §§8.1, 9A item 5, 9C, 10A, 10B; ReductiveGroupsPartII RG2.0.2, RG2.0.3, RG2.4.2, RG2.4.4; KacMoody §3.3; AdicSpacesPartIII §R3.4; PadicMeasuresIwasawaAlgebras §1.7; twelve SmoothRepresentationsOfLocalGroups targets) and at the open heads (PadicLocalLanglandsForGL2Qp §§0.1, 2.4, 2.5, 4.8; LocallyAnalyticDistributions §§0.0, 0.2; LocallyAnalyticDistributionsPartII §§1.1–1.5, 2.5; NoncommutativeAndEquivariantIwasawa §§0.1–0.3, 0.6, 0.7; CompletedCohomologyPartII F.1, F.4; OverconvergentAutomorphicForms §0.6; ArithmeticLocallySymmetricSpaces ALS.4.5; VStackSheavesAndLisseCategories §VS2.2).
- Gate: every check passed. `gate --depcheck`: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line. No file changed outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output. The file declares nothing, so no `#check` comparison and no one-tactic probe apply. Headlines (anti-equivalence and Ext¹ of Layers 0–1, strong LA-acyclicity, the Grothendieck property and the solid comparison, category O^p_alg, Schraen's spectral sequence, Orlik–Strauch irreducibility and Jordan–Hölder, the adjunctions of Emerton and Breuil, Ding's theorems): none statable, the pins having no D(G, E), Fréchet–Stein algebra, solid E-vector space or category O (searched by object); each is named in the docstring with the carrier it lacks.
- Declared gaps: seven slugs, the same in the plan and in the README, each with a named supplier and section.
- Overlap check: read PadicHodgeParametersInLocallyAnalyticRepresentations, LocallyAnalyticDistributionsPartII, ModpRepresentationsOfGL2OverLocalFields, CompletedCohomologyAndLocalGlobalCompatibility, PadicLocalLanglandsForGL2Qp, SmoothRepresentationsOfLocalGroups, LieHighestWeight, and also KacMoody, SpringerResolutionAndCharacteristicCycles, TriangulineVarietyAndItsLocalModel, PadicFamiliesPartII; Fréchet–Stein theory and D_r, D_(<r): owner LocallyAnalyticDistributionsPartII §§1.4–1.5, cited; Mahler stages Π_H^(h): owner PadicLocalLanglandsForGL2Qp §2.5, cited; Kac's category O: owner KacMoody §3.3, distinguished in the scope; BGG category O of split reductive Lie algebras with its reductive Verma and simple modules: owner here, earlier in the merge order than SpringerResolutionAndCharacteristicCycles, whose §10.4 at its head forms these modules for the principal block without citing Layer 4, a citation that pull request owes; nothing else shared.
- Source independence: 14 passages compared with 11 sources, none shared (longest common run 6 words, in a hypothesis list); largest share DING25, 65 of about 280 locators; contents compared with DING25: Layers 0–7 map to no run of it; Layers 8, 9, 10 ↔ §§3.1.1–3.1.2, 3.1.3, 3.1.4, an order the *Needs* lines of 9.1 (8.7), 9.4 (8.12) and 10.6 (9.6) force, with scopes that differ (8.13 from BH20, the proofs of 8.4 (3) and 8.8 (2), Layer 4 and Layer 6 inputs): independent.

## Not verifiable

- SCHN11 (§13, p. 90; Proposition 6.4, pp. 42–43, cited in 0.1): uncertified, text not read.
- HUM08 (Theorems 3.3, 4.6, 5.1, Proposition 9.3, §§9.3–9.4, cited in 4.3–4.5): uncertified, text not read; 4.4 was checked against BR15 line 590, which quotes it.
- NFA02 (§6, cited in the barrelled gap): uncertified, text not read.

## Source issues

- **Error** in SCH11 at Proposition 4.7(2), p. 80: the source says the fixed-character Ext is the smooth Ext in the least nonvanishing degree i_0 and zero in the other degrees up to i_0 + 2; it should be an isomorphism with smooth Ext in every degree at most 2, as its spectral sequence (4.27) gives; affects a stated result.
- **Error** in OS15 at §2.5, the paragraph after Example 2.7, p. 8: the source says O^p lies in O and O^g is all finite-dimensional semisimple modules; it should also require the Cartan subalgebra to act diagonalisably with weights in the coefficient field, which is not algebraically closed; affects a stated result.
- **Misprint** in DING25 at the paragraph after Proposition 3.1 and Lemma 3.2, arXiv v2 p. 37: the source labels C(w, s_(i,σ)) by the image w({1, …, i}); it should be the inverse image w⁻¹({1, …, i}), the invariant of the coset in Proposition 3.1(4); affects a stated result.
- **Misprint** in DING25 at (3.1), Lemma 3.2 and (3.8)–(3.9), arXiv v2 pp. 37–40: the source induces the character with algebraic part of weight −s_(i,σ)·λ; it should be +s_(i,σ)·λ, the negative weight belonging to the category-O argument; affects a stated result.
- **Misprint** in DING25 at Lemma 3.2(1), arXiv v2 p. 37: the source takes Hom over T(ℚ_p); it should be over T(K); affects nothing.
- **Misprint** in DING25 at (3.12), arXiv v2 p. 41: the source indexes I over subsets of {1, …, n − 1}; it should be subsets of {1, …, n}, which alone gives the stated dimension; affects a stated result.
- **Misprint** in DING25 at the proof of Proposition 3.3(2), arXiv v2 pp. 39–40: the source composes the permutation of the ordered tori after 𝒥_(w_1), which lands in the Bernstein centre; it should be 𝒥_(w_1) = 𝒥_(w_2) ∘ (w_2w_1⁻¹); affects the proof.

## For the human reviewers

- Licence: EMJ2 (Emerton, Jacquet modules II) is cited as an unpublished preprint from the author's page (`TauCetiRoadmap/LocallyAnalyticRepresentationsOfLocalGroups/README.md` line 1739); 7.2–7.5 and 8.6 rest on it.
- Licence: BCGP25 (line 1752) is an arXiv preprint and the main source of Layer 3; OR19 (line 1742) is an arXiv preprint cited for 6.5 (4).
- Not tested: SCHN11, NFA02 and HUM08 are uncertified books; wording was not compared with them.
