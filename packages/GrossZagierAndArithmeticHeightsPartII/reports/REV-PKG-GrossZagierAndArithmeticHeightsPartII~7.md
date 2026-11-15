<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13085#issuecomment-6900233649 -->
Review (claude) of 9c2537b

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) The contract with EndoscopicTransferAndUnitaryTraceComparison describes §§2.1 and 2.4 as something they do not state

   **Location:** packages/GrossZagierAndArithmeticHeightsPartII/README.md:136 “Consume §§2.1 and 2.4 (normalized orbital integrals and their convergence) and §2.13 (Fourier transforms of orbital integrals)”; the same sections in the *Needs* lines at :1221 (§9.3) and :1889 (§14.1).

   **Claim:** §§2.1 and 2.4 of that roadmap give the orbital integrals of §9.3 and their convergence.

   **Witness:** At the supplier's head, §2.4 is “`κ`-orbital integrals and stable orbital integrals” (its README:765) and §2.1 normalizes conjugation orbital integrals of a connected reductive group (README:689); README:707 says their convergence is imported from AutomorphicSpectralTheory AS.6.9. None is the GL_(n−1)(F₀)-integral on S_n, and §9.3 never proves that its integral converges.

   **Exact repair:**

   1. README:136, replace the opening clause by: “Consume §2.1 (centralizer-normalized orbital integrals of a connected reductive group and of its Lie algebra, with semisimple descent), §2.4 (κ-orbital and stable orbital integrals) and §2.13 (Fourier transforms of Lie-algebra orbital integrals and their compatibility with transfer). These are orbital integrals for conjugation; they are the model for, and do not contain, the GL_(n−1)(F₀)-orbital integrals on S_n, whose convergence is §9.3. Consume also the Jacquet–Rallis regular matching …” (the rest unchanged).
   2. §9.3, after the definition of Orb(γ, f′, s), add: “For regular semisimple γ, that is, with closed orbit and trivial stabilizer (Z §1.2, pp. 4–5), the orbit map h ↦ h⁻¹γh is a homeomorphism of GL_m(F₀) onto a closed subset of S_n(F₀), so h ↦ f′(h⁻¹γh) is locally constant of compact support, the integral is a finite sum, and Orb(γ, f′, s) is a Laurent polynomial in q^s, in particular entire; the same holds in the semi-Lie version.” Add the API bullet “Orb(γ, f′, s) is a finite sum, a Laurent polynomial in q^s, for regular semisimple γ.”

   Tested on the instances of §9.3: over ℚ₃, γ = ((0,1),(1,0)) has integrand supported on v(t) = 0 and Orb(s) = 1; γ = ((−2,1),(−3,2)) has the two shells v(t) = 0, −1 and Orb(s) = 1 − 3^s. Both are finite sums.

2. **F02** (P3) Two targets need a later target of their own layer

   **Location:** README.md:416 (§2.3) “*Needs:* §§1.1, 1.4, 2.2, 2.6”; README.md:958 (§7.3) “*Needs:* §§7.1–7.2, 7.4”, with :943 “proves reducedness by §7.4” and :962 (§7.4) “hence N_Λ is reduced and smooth and §7.3 follows”.

   **Claim:** The subsections of a layer are in build order.

   **Witness:** §2.6 needs §2.2 and §7.4 needs only §7.1, so neither order is forced; LZ proves Corollary 5.3.3 (LZ lines 1047–1071, p. 26) before its quotient (6.4.0.2) exists (LZ line 1575, p. 38).

   **Exact repair:**

   - §2.3: replace “These are equalities after the cycle-class quotient of §2.6” by “These are equalities of Euler characteristics: there are finitely many type-three vertex lattices Λ_i and rationals m_i with χ(N_n, ᴸZ(L♭)_V ⊗ᴸ O_(Z(x))) = Σ_i m_i·χ(N_n, O_(V(Λ_i)) ⊗ᴸ O_(Z(x))) for every x ∈ V_n ∖ (L♭ ⊗ F)”; in its third Check replace “Replacing the cycle-class quotient by” with “Replacing this numerical equality by an equality with”; write “*Needs:* §§1.1, 1.4, 2.2; SchemeAndStackFoundations §§5.3–5.4, 5.7; MotivesAndAlgebraicCycles §§2.4, 2.7; SchemeKTheoryOperationsPartII §§3.1 and 4.6.” (all already in the Layer 2 Dependencies).
   - §§7.3–7.4: exchange the two subsections, so that “Krämer stratum deformation” is §7.3 (*Needs:* §7.1 …) and “Krämer vertex strata” is §7.4 (*Needs:* §§7.1–7.3 …). Update the internal references: :934 “route of §7.4” → “§7.3”; :943 “by §7.4” → “by §7.3”; :962 “§7.3 follows” → “§7.4 follows”; the *Needs* of §7.5 (:989), §7.8 (:1032), §8.1 (:1063), §8.7 (:1134 route and :1142) “§7.3” → “§7.4”; in “Source corrections” (:1988) exchange “(§7.3)” and “(§7.4)”. No other roadmap cites these ids (searched the open heads and main for “GrossZagierAndArithmeticHeightsPartII §”: no hit), so no old → new table is needed.

   Tested on a scratch copy with both edits applied: the scan of all 107 *Needs* lines for a target that needs a later one, which reports §2.3 → §2.6 and §7.3 → §7.4 on the package, reports none.

3. **F03** (P3) N_Λ is defined only by pointing at the source, and the pointer for its second condition is wrong

   **Location:** README.md:962 (§7.4) “Define N_Λ by K Definition 3.4 before identifying it with an incidence variety; for positive type impose the additional Lie-image condition of K Definition 3.7.”

   **Claim:** The definition of the stratum is stated, and its Lie condition is K Definition 3.7.

   **Witness:** K lines 700–704 (Definition 3.4, p. 17) contain both conditions; K line 762 (Definition 3.7, p. 19) defines a category of artinian divided-power algebras. The README never says what N_Λ is.

   **Exact repair:** Replace the sentence by: “For a vertex lattice Λ of type 2m define N_Λ as the closed subfunctor of Z(Λ) which is Z(Λ) itself when m = 0 and, when m ≥ 1, consists of the points at which the image of the Lie algebra of the canonical rank-one source under every x ∈ Λ lies in the rank-(n−1) filtration (K Definition 3.4, p. 17). Its infinitesimal deformations are tested on artinian O_F̆-algebras with a nilpotent divided-power structure on the kernel to the residue field (K Definition 3.7, p. 19).” Add the Check: “Without the Lie-image condition the functor is Z(Λ), which for m ≥ 1 is not the stratum: the condition is what makes F^⊥ ⊂ Λ^⊥ in the deformation flags.” Tested against K Lemma 3.8(2), K lines 786–788: condition (e) is exactly what the restriction to N_Λ adds.

4. **F04** (P3) Layer `Dependencies`, the build paragraph and the contracts disagree with the *Needs* lines

   **Location and witness (each computed from the *Needs* lines):**

   - README.md:1866 (Layer 13) “Layers 3–4, 8 and 10” and :146 “Layer 13 proves the arithmetic Siegel–Weil formulas from Layers 3, 4, 8 and 10”: §13.6 (:1803) needs §12.3, which needs §12.2 and so §11.1.
   - :1040 (Layer 7) “Layer 0”: §7.5 (:989) needs §1.3.
   - :1966 (Layer 14) “Layers 9 and 12”: §14.5 (:1945) needs §0.9.
   - :766 (Layer 5): §5.4 (:733) needs SchemeAndStackFoundations §5.3, absent. :895 (Layer 6): §6.9 (:887) needs FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.20, absent.
   - :974 against :989 (§7.5): the route names LubinTateFormalModulesAndQuasiCanonicalLifts §§6.2 and 6.5; the *Needs* line has §§6.2 and 7.1.
   - :1742 against :1757 (§13.3): the statement names PELModuliPartII §6.1; the *Needs* line omits it.
   - Contract entries no *Needs* line consumes: PELModuli §M0.22 (:132), AbelianSchemesAndArithmeticModuli §A4.7 (:50), MetaplecticAutomorphicForms §2.7 (:94), LubinTateFormalModulesAndQuasiCanonicalLifts §6.4 (:58), PELModuliPartII §§5.5, 7.4 and 9.8 (:46).

   **Exact repair:** Layer 13 Dependencies: “Layers 3–4, 8, 10 and 12 (§12.3)”; :146 “from Layers 3, 4, 8 and 10, with the Kudla Green function of Layer 12”. Layer 7: “Layers 0–1”. Layer 14: “Layers 0, 9 and 12”. Add the two supplier sections to the Layer 5 and Layer 6 Dependencies. §7.5 *Needs*: “§§6.2, 6.5 and 7.1”. §13.3 *Needs*: add §6.1. For each unconsumed contract entry, add it to the *Needs* line of the target that uses it or delete it from the contract and from the scope paragraph (:9). The dependency check is unaffected (same roadmaps); no cycle arises, since no target of Layers 11–12 needs Layer 13.

5. **F05** (P3) §4.3 is stated for integral L only; the source and §4.5 have every full-rank L

   **Location:** README.md:614 (§4.3) “Prove that for every full-rank integral L ⊂ W_n, (q+1)·Int_aux(L) = ∂Den_Λ(L)”.

   **Claim:** The auxiliary identity needs L integral.

   **Witness:** LZ line 2902 (Theorem 10.3.1, p. 66) takes any lattice of full rank, and §4.5 (:638), which is proved from §4.3, is for “every full-rank L ⊂ W_n”. For nonintegral L (rank one, val h(x,x) = −2): Z♭(x) = ∅ so Int_aux = 0, and D_Λ = 0 so ∂Den_Λ = 0.

   **Exact repair:** Delete “integral” in the statement and add the Check: “Nonintegral L: in rank one with val h(x,x) = −2 no integral lattice contains L ⊥ ⟨ϖ⟩, so D_Λ = 0 and ∂Den_Λ = 0, while Z♭(x) = ∅ and Int_aux = 0.” Tested on that instance: 0 = 0.

6. **F06** (P3) The semi-global identity of §13.5 does not say that φ is v₀-admissible

   **Location:** README.md:1774 (§13.5) “Prove that at an admissible inert place v₀ with p > 2, for positive definite integral nonsingular T, Int_(T,v₀)(φ)·q^T = c_K·E′_(T,v₀)(z, φ)”.

   **Claim:** The identity is stated with its hypotheses.

   **Witness:** LZ line 3633 (Theorem 13.6.1, p. 83) assumes the Schwartz function v₀-admissible; §10.1 (:1298) defines the semi-global cycle, hence Int_(T,v₀)(φ), only for v₀-admissible data. “Admissible” in the sentence qualifies the place (§13.3), not φ.

   **Exact repair:** “… at an admissible inert place v₀ with p > 2, for v₀-admissible φ (§10.1) and positive definite T ∈ Herm_n(O_(F,(p))), …”. Tested on the second Check of §13.5: the indicator of the lattice spanned by the special homomorphisms is not v₀-admissible and is the input that Check excludes.

7. **F07** (P3) Four locator slips and one work named without a reference

   **Location and witness:**

   - README.md:494 (§3.1) “(LZ §3.3, (3.3.0.1)–(3.3.0.2), pp. 16–17; §9.1, pp. 60–62)”: the polynomial D_L, its functional equation and ∂Den are LZ §3.2, (3.2.0.1)–(3.2.0.2) and Definition 3.2.1, p. 16 (LZ lines 614–638); LZ §9.1 (lines 2603–2714) is the density of the almost self-dual lattice, which §3.1 does not use.
   - :576 (§4.1): the polynomial D_Λ(X, L) = D(X, L ⊥ ⟨ϖ⟩) of its API is LZ Definition 9.1.4 and (9.1.4.2), p. 63 (LZ lines 2775–2779), not in §§10.1–10.3.
   - :1134 (§8.7) “Theorem 9.7 and proof, p. 75”: the proof ends at K line 4001, on p. 76.
   - :1655 (§12.9) “Z §9.1, after (9.8)”: the modularity statement is Remark 9.1 with (9.7), Z lines 2431–2435, before (9.8).
   - :205 (§0.4) “as in the Vollaard–Wedhorn description of the supersingular locus”: no entry in References or in packages/GrossZagierAndArithmeticHeightsPartII/sources.toml.

   **Exact repair:** §3.1: “(LZ §3.2, (3.2.0.1)–(3.2.0.2) and Definition 3.2.1, p. 16; §3.3, (3.3.0.1)–(3.3.0.2), pp. 16–17)”. §4.1: add “Definition 9.1.4 and (9.1.4.2), p. 63” to the locator. §8.7: “pp. 75–76”. §12.9: “(Z §9.1, Remark 9.1 and (9.7); Corollary 10.4)”. §0.4: write “as in the description of the supersingular locus that LZ §2.7 recalls”, or add the Vollaard–Wedhorn paper to References and to the manifest through the sources service with its theorem number.

Seven findings: one blocking (P2) and six P3. The five findings of the previous round are all repaired. The new findings are in text no repair touched; five of them are in this round's seeded targets (§§2.3, 3.1, 4.3, 7.4, 8.7, 12.9, 13.5) or in the supplier and dependency audits, which earlier rounds did not run at section level for EndoscopicTransferAndUnitaryTraceComparison.

## Verified sound

### The five findings of the previous round

| Previous finding | Repaired passage (README) | Status and what I computed |
|---|---|---|
| F01 Siegel–Weil constant inverted | §13.4, :1761 “the constant is c_K = (−1)^n/vol(K), independent of T and φ”; §13.5, :1774 “c_K = (−1)^n/vol(K) of §13.4” | Repaired. Index m: degree ×m, E′ unchanged, 1/vol(K′) = m/vol(K). LZ line 3636 prints the constant with the fraction bar lost, as LZ line 3628 prints 1/[E:F₀]. Other “vol(K” in the README: only the ratio of §13.9. |
| F02 supports asserted on V_n | §3.5, :550 “The hermitian uncertainty principle is applied to φ⊥ on the rank-one space W … The uncertainty principle is not applied to Φ_L♭ on V_n.” | Repaired; agrees step by step with LZ lines 2572–2598. Values in the table below. §2.7 dropped from the *Needs* of §3.5; Layer 3 introduction says “on the normal line”. |
| F03 two *Needs* lines | §13.10, :1858 “*Needs:* §§3.5, 4.2, 4.5, 8.7, 10.3–10.4, 13.3–13.5, 13.7, 13.9”; §8.7, :1142 “*Needs:* §§7.3, 7.7–7.8, 8.4–8.6.” | Repaired. No exotic place in K (G0)–(G5), K lines 4055–4080; the word “uncertainty” does not occur in K. |
| F04 formal schemes at the pins | :42 “The pinned Tau Ceti has the affine formal spectrum of an adic ring … It has no category of locally noetherian formal schemes”; Suggested.lean:30 | Repaired. `TauCeti.FormalScheme.Spf.carrier` at TauCeti/AlgebraicGeometry/FormalScheme/Spf/Carrier.lean:73; `structureSheaf` at …/Spf/StructureSheaf.lean:262; no file of the pinned Mathlib mentions formal schemes. |
| F05 three locators | §3.5 “pp. 58–59”; §10.1 “pp. 73–77”; §1.1 “(Z Appendix B, Lemma B.2(ii), p. 77)” | Repaired. LZ p. 58 begins at line 2526 and p. 60 at 2600; LZ p. 73 at 3185; Z p. 77 at 4326. |

The repaired patterns were searched in the rest of the package: a lost fraction bar (“vol(”, “[E :”, “1/2”, “q+1” denominators of §§4.3, 10.4, 13.9: consistent with LZ lines 2898, 2904, 3625); the uncertainty principle on a whole space (§6.8 keeps LL2's own support statement on the plane V→, unchanged); *Needs* against route (R04 lists what the scan found); pin claims (below).

### Seeded source sample (15 targets, all opened)

| Target | Passage opened | Result |
|---|---|---|
| 0.1 | LZ lines 296–345 (§§1.7–1.8, pp. 8–9); 392–426 (§§2.1–2.2, pp. 10–11) | Agrees: form on Hom(Ē, X) through λ_X, x, y^∨, λ_Ē⁻¹; Ē the conjugate of the signature-(1,0) object. |
| 2.3 | LZ lines 1047–1071 (Corollary 5.3.3, p. 26); 1487, 1521 | Statement agrees. Order against §2.6: R02. |
| 2.6 | LZ lines 1560–1624 ((6.4.0.2), Definitions 6.4.1, 6.4.3, p. 38); Lemmas 6.4.4–6.4.7 at lines 1625, 1650, 1691, 1730 (pp. 38–41) | Agrees; the README's sign 1 − exp(−c) corrects LZ line 1612 (Source issues). |
| 3.1 | LZ lines 614–638 (§3.2, p. 16); 646–668 (§3.3, pp. 16–17) | Agrees: W_T(1,k,φ₀) = Den(⟨1⟩_(n+2k), L), log q². Locator: R07. |
| 3.5 | LZ line 673 (Theorem 3.4.1, p. 17); lines 1827, 2497–2598 | Agrees, including Lemma 8.2.2 in both directions and the dual line. |
| 4.3 | LZ lines 2896–2917 (Definition 10.2.3, Theorem 10.3.1, p. 66) | Agrees except “integral”: R05. |
| 4.6 | LL1 lines 450–456 ((F4), p. 10); 1842–1845 (pp. 39–40); 2044–2066 (pp. 44–45); LZ lines 2783–2800, 3168–3172 | Agrees: (q^(2r) − 1)/(q+1)·W′_T(φ₁) − (log q)/(q+1)·W_T(φ₀), times b_(2r)(0)/log q. |
| 7.4 | K lines 700–704, 754–800, 1011–1032 (Definitions 3.4, 3.7, Lemma 3.8, Theorem 3.16, Proposition 3.17, pp. 17–26) | Flag conditions agree with Lemma 3.8(a)–(e). Definition and pointer: R03. |
| 8.1 | K lines 92–162 (pp. 3–4); 1314, 1422 (pp. 33, 35) | Agrees: factor −2, χ(I_n) = −χ(L), the three values of t_max, the system (1.6). |
| 8.7 | K line 160 (p. 4); 3934–4004 (pp. 74–76) | Statement and route agree. Page: R07. |
| 11.4 | Z lines 2047–2062 (§7.6, (7.14)–(7.15)); 2406–2419 (§9.1) | Agrees: F₁K′₀, then Gr₁ ≅ Ch₁ → proper one-cycles. |
| 12.8 | Z lines 2385–2444 ((9.1)–(9.10)); 2635–2641 ((10.9)–(10.10)) | Agrees: ℝ_S, denominator τ(Z^ℚ)·[E:F]. |
| 12.9 | Z lines 2431–2435 (Remark 9.1, (9.7)); 2644–2646 (Corollary 10.4) | Agrees. Locator: R07. |
| 13.3 | K lines 4050–4109 ((G0)–(G5), (H1)–(H4), pp. 77–78) | Agrees condition by condition. |
| 13.5 | LZ lines 3618–3659 (§13.5, Theorem 13.6.1, pp. 83–84); 3729–3747 (Theorem 14.5.1, Corollary 14.5.2, p. 86) | Agrees except the hypothesis on φ: R06. |

No locator was flagged by the author as unverified.

### Adversarial table (sampled targets, headlines, repaired passages, findings)

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| §0.1 | a ∈ O_F; rank one, norm ϖ^a; source E against Ē | H(ax,y) = h(y,ax) = ā·H(x,y); dual ϖ^(−a)O_F·x in both; X × E has signature (1,n−1) + (1,0) = (2,n−1), X × Ē has (1,n) | Retain |
| §0.9 / §3.5 headline | a = 1, 3, −3 | D = 1 − X, 1 − X + X² − X³, 0; −D′(1) = 1, 2, 0 = Int; (a+1)/2 at −3 would be −1 | Retain |
| §1.3 | unramified and ramified orders O_s | [O_F^× : O_s^×] = q^(2s)(1 − q⁻²)/(q^s(1 − q⁻¹)) = q^s(1 + q⁻¹); ramified: q^(2s)(1 − q⁻¹)/(q^s(1 − q⁻¹)) = q^s, two components 2q^s (§7.5) | Agree |
| §2.3 (R02) | n = 2, unit-norm L♭; order of proof in LZ | vertical class 0, both sides 0; Corollary 5.3.3 at LZ line 1047, quotient at line 1575 | Reword without §2.6 |
| §2.4 | x ∈ Λ | −q²(1+q) + (q³+1) = 1 − q²; transform −(1+q)/q + (q³+1)/q = q² − 1 | Eigenvalue −1 |
| §2.6 | line D ⊂ ℙ² | ∫(H − H²/2)(1 + 3H/2 + H²) = 3/2 − 1/2 = 1 = χ(O_ℙ¹); with −H − H²/2: −2 | Sign 1 − exp(−c) correct |
| §3.1 | n = 1, val 1, q = 3; φ = 1_(L) for L = ⟨ϖ⟩ | W′ = (1 + 1/3)·2 log 3 = (8/3)·log 3; norm-one count (q+1)q^N over q^N = q + 1 = 4 ≠ Den(L) = 0 | Agree |
| §3.5 route (F02) | L♭ = ⟨e⟩, h(e,e) = ϖ, n = 2; general val(u) | val(u) = 0 would give val(M) = 0, even; so val(u) ≥ 1, here 2; u^∨ = ϖ⁻²u of valuation −2; w = cu, v(c) ≥ −1: v(c + ϖ⁻²) = −2, val(w + u^∨) = −2 < 0; in general v(c) ≥ −val(u)/2 > −val(u) | Repair holds |
| §3.5 Check (V_n) | y = ϖ^(−a₁)e₁, w ∈ W of valuation ≥ 0 | norm ϖ^(−a₁)·unit + h(w,w): valuation −a₁ < 0, and Φ̂(y + w) = vol(L♭)·φ̂⊥(w) | Holds |
| §4.3 (R05) / §4.5 headline | rank one, a = 2, 0, −2 | a = 2: D_Λ = (1−X)(1+qX) + X²(1−X), −D′(1) = (1+q) + 1 = q + 2, and q + 1 = (q+2) − 1; a = 0: 1, and 0 = 1 − 1; a = −2: 0 = 0 | Delete “integral” |
| §4.6 | n = 2r; r = 1 | from LZ (3.3.0.1), (9.2.0.2): ∂Den_Λ = W′/log q²·((−q)^n − 1)·∏(1 − (−q)^(−i))⁻¹; (q² − 1)/(q+1) = q − 1; L(i, η^(2r−i)) = (1 − (−q)^(−i))⁻¹ | Agrees with LL1 line 2066 |
| §5.5 / §6.8 headline | (b₁,b₂) = (0,0), (0,1), (1,1) | 2·1 = 2; 2·(1+1) = 4 = 2·#{2 overlattices}; 2·((1+1) + (1+q)) = 2(q+3) | Retain |
| §6.1 | type two, type four; H₂ | −d/dX[(1 − X²)·g]₁ = 2g(1): 2 and 2(1 − q²); (1 − 3⁻²)(1 − 3⁻⁴) = 640/729 | Agree |
| §7.4 (R03) | ranks; type two | F^⊥ of rank 1 ⊂ Fil of rank n in rank 2n: maximal isotropic; tangent bound 1 = dim ℙ¹ | Flags correct; definition to be stated |
| §8.1 | (n, χ) = (2,−1), (2,+1), (3,±) | t_max = 0, 2, 2: 0, 1, 1 correction terms | Retain |
| §8.6 / §8.7 headline | H₁, line ⟨l₁ + πl₂⟩, x = l₂ | norm of al₁ + bl₂ is π(ab̄ − āb) ∈ π₀O_F₀; h(l₁ + πl₂) = −π₀ − π₀ = −2π₀; projection coefficient 1/(2π); Int(I_n) = δ_odd(n) = ∂Pden(I_n) | Retain; K Lemma 9.6 fails there |
| §9.3 (R01) | ℚ₃: γ = swap, a = diag(3,1); γ = ((−2,1),(−3,2)) | h ↦ ah multiplies the integral by \|det a\|^(−s)η(det a) and ω by η(det a); ∂Orb changes by −log(1/3)·1 = log 3; supports are 1 and 2 shells: Orb = 1, 1 − 3^s | Law holds; convergence to be stated |
| §11.4 | arithmetic dimension n | product of dimension 2n − 1, Δ of codimension n − 1, Hk of dimension n: class in F^(n−1) of an n-dimensional scheme, that is F₁ | Agrees with Z (7.15) |
| §12.6b | Q = h(x,x) | Q(x+y) − Q(x) − Q(y) = h(x,y) + h(y,x) = Tr h(x,y); weight (2n−2)/2 + 1 = n | Agree |
| §12.8 / §12.9 headline | [E:F] against [E:F₀]; F₀ ≠ ℚ; n = 2 | ratio [F:F₀] = 2; over F₀ ≠ ℚ and for n = 2 no arithmetic modularity is asserted (§12.7) | Retain |
| §13.3 | K (G0)–(G5), (H1)–(H4) | ten conditions matched one to one; no exotic place | Agree |
| §13.4 Check (F01) | neat K′ ⊂ K of index m at a split place | K ∩ Z(ℚ) = 1 for neat K, so the cover has degree m; deĝ ×m; (−1)^n/vol(K′) = m·(−1)^n/vol(K) | Repair holds |
| §13.5 (R06) / §13.8 headline | φ_v₀ = 1_(Λ_v₀^n) against the lattice of special homomorphisms; \|Diff\| | the second is not v₀-admissible and its factor does not vanish at s = 0 (§3.1 row); \|Diff\| odd, ≥ 3 gives 0 on both sides | Add the hypothesis |
| §13.6 (R04) | n = 3, m = 1, 3 | bidegree (0,0) and (2,2); the target needs §12.3 | Layer 13 depends on Layer 12 |
| §13.9 / §13.10 headline | q = 3; inert self-dual, almost self-dual, ramified | c₀ = −1/4 = −Den/(q+1) of §4.5; correction 0 at self-dual | Retain |
| §14.2 | expansion | (2∂J + Int_(K−B)) + Int_B = 2∂J + Int_K | Agree |
| §14.5 headline | n = 3, 4; p = n = 3 | semi-Lie dimensions 2, 3; first global step n = 4; q + 1 = 4 residues against n + 1 = 4 exclusions | Retain; the q = n step is the stated target §9.5(b) |

### Library, Lean and headlines

- Pins (content repository manifest): Mathlib 1b1ccf4b, Tau Ceti 2fd255d9. Opened: `IsNonarchimedeanLocalField` (Mathlib/NumberTheory/LocalField/Basic.lean:46), `Polynomial.eval` (Mathlib/Algebra/Polynomial/Eval/Defs.lean:248), `Polynomial.derivative` (Mathlib/Algebra/Polynomial/Derivative.lean:47), the two Tau Ceti formal-spectrum declarations above. By object: Tau Ceti has `Matrix.localDensity` (TauCeti/NumberTheory/IntegralLattice/LocalDensity/Basic.lean:546), the self-representation density of a symmetric matrix over `ℤ_[p]`; it is not a hermitian density Den(M, L), so “neither pin has hermitian local densities” stands. No file of either pin has Rapoport–Zink spaces, p-divisible groups, orbital integrals, arithmetic Chow groups, Siegel Eisenstein series or Shimura varieties (the twelve Tau Ceti hits for “Rapoport” are bibliography lines).
- `lake env lean` on packages/GrossZagierAndArithmeticHeightsPartII/Suggested.lean from the content checkout: exit 0, no output. One `import Mathlib`, one module docstring, an empty namespace, zero declarations: the one-tactic probe and the `#check @name` comparison have no input, and there is no padding, sorry'd data or `set_option`.
- Headline theorems (summary and “Acceptance file”): §§3.5, 4.5, 6.8, 8.7, 13.8, 13.10, 12.9, 14.5. All eight are named in the module docstring with the missing carrier; none is statable at the pins and no stand-in is stated.
- Backticked names: this roadmap declares none. The supplier names resolve at the heads: GeometryOfNumbersAndQuadraticArithmetic README:705, 716, 727, 914, 934, 945; MetaplecticAutomorphicForms README:404, 522, 640, 648, 1555, 1591, 1623; AutomorphicFormsOnReductiveGroups README:692; EtaleCohomologyFoundations (main) README:443 and §0.8. The four resolver leads are these supplier names.

### Suppliers, order, gaps, overlap

- Every cited section was resolved now, by heading, in the 25 supplier READMEs (24 from main or the open heads, PELModuliPartII from the board package): 42 sections of PELModuliPartII, 20 of SchemeKTheoryOperationsPartII, 11 of MetaplecticAutomorphicForms, 10 of ShimuraVarieties, and all others of the contracts; none is missing. Statements read against what this roadmap assumes: PELModuliPartII §§0.7, 1.5, 2.5, 3.4, 3.7, 9.6; MetaplecticAutomorphicForms §3.3a; AutomorphicFormsOnReductiveGroups §4.4; GrossZagierAndArithmeticHeights §7.2; ArakelovGeometryAndAbelianHeights §1.10; SchemeKTheoryOperations §7.7; EndoscopicTransferAndUnitaryTraceComparisonPartII §§4.4–4.5. One mismatch: R01.
- Dependency check, exact output: `depcheck: 246 roadmaps, 2264 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line. This roadmap is line 350 of the merge order; every supplier is earlier.
- The four declared gaps have the same slug and a word-for-word identical `needs` sentence in design/plan.json and in the README, each with a named earlier supplier. They are precise and ask for what the cited sections do not state (GeometryOfNumbersAndQuadraticArithmetic §3.2 is unramified, its README:882; SchemeKTheoryOperationsPartII §2.4 is affine). Not findings.
- Overlap inventory: no other open pull request changes this roadmap, no cited id is dropped, none exists only in an open revision; no other roadmap cites an id of this one.

Overlap check: read ComplexMultiplicationAndExplicitReciprocityPartII, MetaplecticAutomorphicForms, GrossZagierAndArithmeticHeights, EndoscopicTransferAndUnitaryTraceComparisonPartII, IgusaVarietiesAndTorsionConcentration (the open list; the two other lists are empty); one object is close: the Borcherds product on the GSpin Shimura variety of a rational quadratic space of signature (p,2), p ≥ 3. Its generic-fibre form at neat level for an arbitrary even lattice, with the relation in CH¹, is owned here (§12.6a(e), earlier in the merge order); the section on the integral model at maximal level with its vertical support is owned by ComplexMultiplicationAndExplicitReciprocityPartII §4.2a, a different statement on a different carrier. Nothing else is shared.

### Shape, policy, sources

- README shape: summary, scope, conventions, contracts, build paragraph, 15 layers each ending with Examples and Dependencies, 107 targets with 107 *Needs* lines, API lists and at least three Checks on every definition. No LaTeX delimiters, pull-request numbers, machine paths, HTML or process words (pattern scan of both files). Layer titles are mathematical and no sentence says the roadmap follows a source.
- Manifest: 24 works, 22 certified and 2 uncertified; every work of References has an entry. No source was fetched and the manifest was not changed.
- Wording: 20 README passages were set beside their sources (the 15 seeded targets, and §0.4 against LZ §2.7, §8.6 against K Lemma 9.6, §9.3 against Z §2.3, §13.4 against LZ Theorem 13.6.1, the Suggested.lean docstring against LZ and K introductions). None reproduces a sentence; what is shared is formulas and lists of hypotheses.
- Arrangement: LZ contents (LZ lines 16–33: §2 cycles, §3 densities, §4 horizontal, §5 vertical, §6 and §7 Fourier, §8 proof, §§9–10 almost self-dual, §§11–15 global) against the layers: Layer 1 is §4 with §5.4, Layer 2 is §5.3 with §6, Layer 3 merges §§3, 7 and 8, Layer 13 comes after eight layers from other sources and mixes LZ §§12–15 with K §10. No one-to-one run; the order of Layers 0–3 is forced by the *Needs* of §3.5 (§§0.8–0.9, 1.4, 2.5, 3.3–3.4).

Source independence: 20 passages compared with 4 sources (LZ, LL1, K, Z), none shared; largest share LZ, 48 of 199 locators; contents compared with LZ: independent.

## Not verifiable

- Lusztig76 and McGraw03 are settled as uncertified; §§2.1, 5.4 and 12.6a(f)(ii) were not read in the originals.
- The published pagination of LZ, K and LL1 was not opened; locators were checked in the versions the README names.
- PELModuliPartII was read from the board package, whose own review asked for changes; its section numbers may move before it is a pull request.
- The entries of “Source corrections” other than those in `## Source issues` below were not re-derived this round. LRZ, LL2, MZ, BHKRY, Bor98, Bor99, YZZ09, Liu11a and the other sources outside the seeded sample were not reopened; for them I rely on the computed rows of the earlier rounds.
- The declared supplier gaps are contracts; only their precision, ownership and minimality were checked.

## Source issues

- **Error** in K at Lemma 9.6, pp. 74–75: the source says every x outside L♭ ⊕ W gives a rank-(n−1) lattice of smaller valuation with the same sum; it should exclude sums whose normal basis ends in a hyperbolic block, as in the split plane with Gram matrix (0, π; −π, 0); affects the proof.
- **Gap** in LZ at the proof of Theorem 8.2.1, p. 59: the source says the vertical intersection and density functions each transport to the lattice of smaller valuation; it should transport only their difference, which is the difference of the total functions; affects the proof.
- **Error** in LZ at §6.4, display after Remark 6.4.2, p. 38: the source says the Chern character of the Cartier complex is exp(c₁(O(−Z))) minus one; it should be one minus exp(c₁(O(−Z))); affects nothing.
- **Misprint** in LZ at §9.2, p. 63: the source says the interpolation formula carries the factor (−q)^n; it should be (−q)^(−n), as in the next three displays; affects nothing.
- **Misprint** in LZ at Theorem 10.3.1, p. 66: the source says the lattice lies in the nonsplit space V; it should lie in the split space W_n of Definition 10.2.3; affects nothing.

## For the human reviewers

- **Licence.** McGraw03 (Math. Ann. 326) is cited for its main theorem without a theorem number and no legal copy was read (packages/GrossZagierAndArithmeticHeightsPartII/sources.toml, `uncertified`).
- **Licence.** YZZ09 is read from a university archive host and LL1, LL2, Zha12 from author pages (README.md, References); the manifest records them as certified.
- **Not tested.** Two targets, §8.6 (README.md:1122) and the q = n step of §9.5(b) (:1237), ask for proofs the cited sources do not contain; the headline §8.7 and the case p = n of §14.5 depend on them.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "9c2537b3177f164554527a5c09d7cd4073f8b7ef", "job": "REV-PKG-GrossZagierAndArithmeticHeightsPartII~7", "model": "fable", "worker": "chris-x88"} -->
