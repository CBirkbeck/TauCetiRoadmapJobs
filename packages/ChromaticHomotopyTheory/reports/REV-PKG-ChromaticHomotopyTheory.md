<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/986#issuecomment-6375021833 -->
Review (claude) of 0ea406d

Verdict: needs changes

1. **F01** (P1) Twenty design gap records have no supplier

   - **Location.** `packages/ChromaticHomotopyTheory/design/plan.json`, top-level `gaps`, records G1–G9, G11–G17 (with G16a, G16b), G19, G20. None of them appears in `packages/ChromaticHomotopyTheory/README.md` (`gap:<slug>` is absent for all of them).
   - **Claim.** Each record is a declared gap whose supplier is `none`, so it is an unowned prerequisite.
   - **Witness.** Each record has only the keys `slug, title, neededBy, detail`, with no `supplier`, `section` or `needs`. A script check finds none of their slugs in the README. The 21st record, G18, is R02.
   - **Repair.** Every one of these obligations already has an owner in the package. Record that owner instead of `none`, or retire the record as owned here, and keep the README sentence that names the owner. Owners, checked in the README and in the cited suppliers:

   | Record | Owner already in the package |
   | --- | --- |
   | G1 smash nilpotence | BordismFormalGroups F6.2 (nilpotence and its proof constructions, on main) |
   | G2 periodicity induction | BordismFormalGroups F6.3 (periodicity, thick classification) |
   | G3 finite generation, telescope comparison | BordismFormalGroups F6.3 (finite localization kernel as a localizing ideal; finite p-power annihilation), with the all-spectra extension in §4.2 |
   | G4 telescopic rigidification | §5.1 (its proof route constructs Kuhn's cofinal system and rigidifies it) |
   | G5 nullification, categorical height | §6.3 (its *Needs* line: "constructed in this subsection") |
   | G6 oriented realization, invariant ideals | BordismFormalGroups F2, F3, F5 (invariant primes, Landweber) and F6.4 (class identities), with the Čech step in §8.1 |
   | G7 horizontal vanishing, smashing | BordismFormalGroups F6.4 (Hopkins–Ravenel smashing) |
   | G8 telescope-status proofs | §8.3 |
   | G9 GHM realization | EllipticCohomology E2 items 2–3 (obstruction machinery) and §7.1–§7.2 for h≥3 |
   | G11 Kahn–Priddy, finite groups | §9.2 |
   | G12 raw Tate lower locality | §9.4 |
   | G13 KU Tate Euler class | §9.5, with `gap:completed-ku-locality` |
   | G14 power operations, Tate descent | §10.1–§10.4 |
   | G15 real Bott | HomotopySpheres §4B (proof); TopologicalKTheory T7; GeneralizedCohomology G5.4 |
   | G16a generalized elliptic compactification | EllipticCohomology E1, which consumes SchemeAndStackFoundations §4.15 |
   | G16b spectral sheaf carriers | duplicate of `gap:spectral-ringed-sites` |
   | G16 integral O^top | EllipticCohomology E3 |
   | G17 affineness, Δ-support, equivariance | §12.1–§12.4, with EllipticCohomology E4 (Δ²⁴ lift) and E6 |
   | G19 multiplicative Thom, free E₂ | §13.1–§13.2 |
   | G20 James-filtered vanishing lines | §13.4 |

     If plan.json cannot change at the package stage, mark this finding "not actionable in this package" in the repair report and attach this table, so that the intake can retire the records.

2. **F02** (P1) The stable James splitting is cited from a section that does not state it

   - **Location.** README line 15: "HomotopySpheres §§3A–3B own … the James equivalence and its stable splitting"; line 84: "§3B’s word filtration J_rW, its connected James equivalence and reduced stable splitting"; line 1242, §13.5 *Needs:* "HomotopySpheres §3B (reduced stable James splitting)".
   - **Claim.** The §13.5 input Σ∞ΩΣW ≃ ⋁_{r≥1}Σ∞W^∧r is presented as supplied by HomotopySpheres.
   - **Witness.** HomotopySpheres §3B at both open heads has five items: the filtration, the quotients W^∧r, the James map, the connected James theorem and the James–Hopf map. The splitting appears only in an aside (README line 462 at the kim-em head, 409 at the Paul-Lez head).
   - **Repair.** Declare the gap and give record G18 this supplier. Under `### From TauCetiRoadmap.HomotopySpheres` add: "What HomotopySpheres must provide (gap:stable-james-splitting): For every path-connected pointed CW complex W, construct a natural equivalence Σ∞ΩΣW≃⋁_{r≥1}Σ∞W^∧r compatible with the word-length filtration J_rW, whose r-th quotient is W^∧r." Add the same slug with supplier `HomotopySpheres`, section `§3B` to the plan's `gaps`. Lines 15 and 84 then say that §3B supplies the filtration and the James equivalence, and that the splitting is this contract. Test case: for W=S² the contract gives ⋁_{r≥1}S^{2r}, as the line-1240 Check requires. W=S⁰ is excluded because it is not connected.

3. **F03** (P2) Three declared gaps ask for what RefinedTraceMethods already states

   - **Location.** README lines 64, 102 and 108: `gap:sphere-segal-comparison` (BordismFormalGroups F6.5), `gap:spectral-perfect-k-theory` (GeneralAlgebraicKTheory Layer 11) and `gap:cyclotomic-trace-carriers` ("RefinedTraceMethods RT.2–RT.3").
   - **Claim.** Each gap requests a construction that no earlier roadmap provides.
   - **Witness.** RefinedTraceMethods, at its board head (merge order 218, before this roadmap at 222), already states each of them:
     - §2.4 states that the C_p Tate spectrum of the sphere is the p-complete sphere.
     - §2.7 builds THH of E₁-rings with its Frobenius, and §2.10 builds TC.
     - §4.9 builds connective and nonconnective K of small stable ∞-categories.
     - §4.11 gives tr: K(A)→TC(A) for E₁-rings.

     That README has no "RT.2–RT.3" labels.
   - **Repair.** Add `### From TauCetiRoadmap.RefinedTraceMethods` with: "Consume §2.4 (the trivial-action C_p Tate spectrum of S is S_p^∧), §2.7 (THH of E₁-rings with cyclotomic Frobenius), §2.10 (TC), §4.9 (nonconnective K of small stable ∞-categories, applied to Perf(A), the compact A-modules of EnhancedDerivedSheaves E5:presentability.1) and §4.11 (the cyclotomic trace K(A)→TC(A))."
     - Delete the three slugs from the README and the plan.
     - If a residue remains, narrow it to that residue and address it to RefinedTraceMethods with its section number. One possible residue is a proof route for §2.4's Segal statement.
     - The homotopy-fixed-point comparison maps F(A^{hG})→F(A)^{hG} are formal consequences of functoriality and need no contract.
     - Repoint the *Needs* of §8.3 (line 742) and §9.5 (line 866) to these sections.

4. **F04** (P2) §6.1 denies a strong convergence that its own supplier provides

   - **Location.** README line 532: "for arbitrary bases with periodic E state only the filtered object and conditional convergence criterion supplied by H.6". Line 552 is a Check denying strong convergence for an infinite base and periodic E. Line 560 says the fiberwise theorem is needed "even when a periodic Serre spectral sequence has no established strong convergence". Line 76 is the matching supplier caveat.
   - **Claim.** For an infinite-dimensional base and a periodic spectrum E, the homological Serre spectral sequence is only conditionally convergent.
   - **Witness.** The filtration is exhaustive and starts at f⁻¹(∅)=∅. StableHomotopyKTheory §7.24 proves strong convergence for such filtrations with no hypothesis on E, and §7.27 applies this to AHSS for every spectrum and every CW complex. Also bhm line 258 and Boardman's Theorem 6.1 (exiting differentials).
   - **Repair.**
     - Line 532: replace the clause from "Assert strong convergence" to the end of that sentence with: "The filtration is exhaustive and starts at the empty set, so the spectral sequence converges strongly to π_(s+t)(E⊗Σ∞_+X) for every CW base and every spectrum E (StableHomotopyKTheory §7.24)."
     - Line 552: replace the Check with: "For E=KU and the identity fibration of ℂP^∞, the infinite-dimensional periodic case converges strongly. The cohomological spectral sequence of the same filtration has entering differentials and needs the lim¹ conditions of StableHomotopyKTheory §7.26."
     - Line 560: delete "even when … strong convergence".
     - Line 76: replace its last sentence with the §7.24 statement.
     - Line 556: add §7.24 to the *Needs* line.
     - Test case: E=KU, Y=ℂP^∞. The page E²=H_s(ℂP^∞;KU_t) is concentrated in even total degree, so it collapses and converges strongly to KU_*(ℂP^∞).

5. **F05** (P3) Supplier citations that point at the wrong item

   - **Location and witness.**
     - **(a) G4.1 orientations.** README lines 12 and 54 cite "G4.1’s complex orientations", and line 210 cites "G4.1/G5.3". In GeneralizedCohomology G4.1 is Relative Leray–Hirsch (README line 1199). Orientations are G4.5 (line 1246), and MU, ku and KU are G5.4 (lines 1559 and 1652).
     - **(b) Serre–Tate.** Lines 18, 96 and 1088 attribute "Serre–Tate" to ModularCurves §7E. Serre–Tate is §7F (main README line 1551); §7E covers p-divisible groups and formal heights.
     - **(c) Real Bott.** Lines 16 and 88 credit "T7’s real Bott theorem". TopologicalKTheory's scope says that the real Bott loop chain comes from HomotopySpheres §4A–4B, and T7 consumes it.
     - **(d) KU completion.** `gap:completed-ku-locality` names "F6.4, height-one comparison". The relevant BordismFormalGroups text is at the end of F6.5 (main lines 2530–2557). It already proves L_K(n)X≃holim_i(L_nX∧M_i) for p-local X and the E(n)-locality of Landweber-exact theories with M/I_(n+1)=0.
     - **(e) BP⟨n⟩ class.** The §8.4 route (line 748) takes the class formula ⟨BP⟨n⟩⟩=⟨E(n)∨H𝔽_p⟩ from "BordismFormalGroups F3 and F6.3–F6.4". BordismFormalGroups states only ⟨E(n)⟩=⟨K(0)∨⋯∨K(n)⟩=⟨v_n⁻¹BP⟩ (main line 885).
   - **Repair.**
     - (a) Write G4.5 for orientations and G4.5/G5.4 at line 210.
     - (b) Write §7F wherever Serre–Tate is meant.
     - (c) Write "HomotopySpheres §4B (real Bott theorem); TopologicalKTheory T7 and GeneralizedCohomology G5.4 (coefficients a²=4b, c(a)=2u², c(b)=u⁴)".
     - (d) Change the section to "F6.5" and narrow the needs to: "identify the G5.4 spectrum KU_(p) with the Landweber-exact height-one theory of the multiplicative law, compatibly with the Bott orientation, so that F6.5's K(1)-completion formula applies".
     - (e) Replace the step in the §8.4 route with the induction "T(i)∧BP⟨n⟩[v_n⁻¹]=T(i)∧E(n)=0 and T(i)∧BP⟨n⟩/v_n=T(i)∧BP⟨n−1⟩=0, so v_n is invertible on T(i)∧BP⟨n⟩=0". Alternatively, make the class formula a target here, citing ravenel line 401.

6. **F06** (P3) Source line locators reused as generic anchors, two of them nonexistent

   - **Location.** README "lmmt line 1729" (line 1012) and "lmmt line 1160" (line 1076). "lmmt line 301" is used 13 times, "behrens line 1160" 12 times, "hs line 129" 6 times, "goerss line 688" 4 times and "akq line 632" 3 times, for different theorems.
   - **Claim.** Each `<source id> line N` locates the cited passage.
   - **Witness.** The lmmt extraction has 1271 lines, and its line 1160 is in the bibliography. hs line 129 is Theorem 7 only. behrens line 1160 is Proposition 1.6.12 only. goerss line 688 is Theorem 3.6 only. akq line 632 is Proposition 2.22 only.
   - **Repair.**
     - lmmt: Cor 4.21 proof line 904; MM15 colimit step line 914 (§12.1); Galois step line 925 (§12.4); Definition 2.5 line 322; Lemma 2.8 line 344; §2.1 line 239; Lemma 2.2(ii) line 259; Lemma 2.2(vii) line 265; Remark 2.4 line 317; Cor 4.19 line 876; §4.3 opening line 890; Cor 4.14 line 823; Thom construction line 834; height definition line 153 (§10.3 now says 164).
     - hs: Theorem 3 line 89; Theorem 9 line 152; Theorem 11 line 166.
     - behrens: Definition 1.2.1 line 132; Proposition 1.2.10 line 220; Definition 1.2.11 line 233; Proposition 1.6.8 line 1048; Theorem 1.7.6 line 1252; Theorem 1.5.6 line 845.
     - goerss: Theorem 1.2 line 152.
     - mm: Theorems 4.6–4.7 lines 1244 and 1256; Corollary 4.8 line 1270; Theorem 7.1 line 1682.
     - akq: Construction 2.1 line 218; Lemma 2.2 line 236.
     - §6.1's bhm locator (Theorem 3.1, Lemmas 3.2–3.3, which concern nullification) becomes "bhm, Lemma 3.5, p.6; bhm line 258".

7. **F07** (P3) §3.2 restates BordismFormalGroups F6.3

   - **Location.** README line 298: "(d) T(n)-acyclicity implies K(n)-acyclicity; … (g) the Bousfield class of T(n) is independent of (V_n,v_n)". The line-310 *Needs* line cites the same F6.3 "source independence" as an input.
   - **Witness.** BordismFormalGroups F6.3 (main line 1171) constructs T(n) with "their independence in Bousfield class, the inequality ⟨K(n)⟩≤⟨T(n)⟩".
   - **Repair.** Delete (d) and (g) from §3.2 and add to the scope paragraph on F6.1–F6.4: "including ⟨K(n)⟩≤⟨T(n)⟩ and the choice-independence of ⟨T(n)⟩, consumed in §3.2".

8. **F08** (P3) A §10.1 Check uses the wrong height indexing

   - **Location.** README line 902: "At p=2,h=2, the reduced p-series starts u₁z²+z⁴ … division by z⁴ is invalid before killing u₁."
   - **Claim.** The Check is stated in the section's convention, in which E has height h+1 and π₀E=W(𝔽_(p^(h+1)))[[u₁,…,u_h]] (line 880).
   - **Witness.** At h=2 the law has height 3, so its 2-series mod 2 is u₁z²+_F u₂z⁴+_F z⁸ and the coefficient of z⁴ is u₂. The form u₁z²+z⁴ belongs to h=1, where the range 1≤k<h is empty.
   - **Repair.** Replace with: "At p=2, h=2 (π₀E=W(𝔽₈)[[u₁,u₂]]) the 2-series mod 2 is u₁z²+_F u₂z⁴+_F z⁸; g₂=[2](z)/z⁴ exists only modulo (2,u₁) (k=1), with leading coefficient u₂."

9. **F09** (P3) L₀ denotes two different functors

   - **Location.** Line 140: "L_0S=0, L_SS=S and L_HℚS=Hℚ". Line 770: "At n=0, L₀S=Hℚ". The Conventions (line 26) fix L_n=L_(K(0)∨⋯∨K(n)).
   - **Witness.** Under line 26, L₀S=L_(K(0))S=Hℚ≠0, which contradicts line 140. Line 140 means localization at the zero spectrum, as the Check at line 144 writes.
   - **Repair.** At line 140 write "L_(zero spectrum)S=0".

10. **F10** (P3) §13.5 is narrower than its own proof

   - **Location.** Line 1230: "Let W be a connected pointed CW space and let E=T(n)∨T(n−1), with n≥1. If E⊗Σ∞W=0 then E⊗Σ∞ΩΣW=0."
   - **Witness.** The proof route at line 1232 uses only associativity and the splitting: E⊗Σ∞W^∧k=(E⊗Σ∞W)⊗Σ∞W^∧(k−1)=0. It holds for every spectrum E (lmmt line 826 is the instance).
   - **Repair.** State the result for every spectrum E. Keep E=T(n)∨T(n−1) and the type-m example as Checks, and keep the A-theory sentence.

11. **F11** (P3) Process narrative and internal labels

   - **Location.** Line 532 "supplied by H.6"; line 562 "explicit parts of the E3 request"; line 1283 "The §4 periodicity construction is not audited (G2)."
   - **Witness.** No roadmap has a section H.6. "E3 request" and "(G2)" are design-stage labels, and "not audited" is process narrative.
   - **Repair.** At line 532 write "StableHomotopyKTheory §7.24" (see R04). At line 562 write "supplied by BordismFormalGroups F6.5". Delete the last sentence of line 1283.

12. **F12** (P3) The periodicity-generator degree conflicts with the supplier

   - **Location.** Line 30, "|u|=−2 after choosing a trivialization", and line 626.
   - **Witness.** EllipticCohomology E2, which supplies the h=1,2 realizations that §7.1 extends, uses "R[u,u⁻¹], |u|=2".
   - **Repair.** Add to the Conventions: "EllipticCohomology E2's degree-two generator is u⁻¹ here. Under ψ_(−1) at height one both go to their negatives." Add that as a Check of §7.1.

13. **F13** (P3) The §6.2 docstring reason omits the pinned homology-theory carrier

   - **Location.** `Suggested.lean` line 17: "missing generalized spectral homology and derived space-indexed colimits".
   - **Witness.** The pins have the Eilenberg–Steenrod carrier `TopPair.HomologyPretheory` (`Mathlib/AlgebraicTopology/EilenbergSteenrod.lean:36`, `IsHomotopyInvariant` :144) and Tau Ceti's `HasPairSequence` and `IsAdditive` (`TauCeti/AlgebraicTopology/EilenbergSteenrod.lean:65,85`). They have no excision axiom, no homotopy fibre or fibration, and no weak-equivalence invariance.
   - **Repair.** Replace the item with: "Fiberwise generalized homology equivalence (§6.2): missing spectra and their smash with suspension spectra; the pinned Eilenberg–Steenrod pretheory lacks excision and weak-equivalence invariance, and Mathlib has no homotopy fibres."

14. **F14** (P3) Style

   - **Location and repair.**
     - Restore capitals in the Example lead-ins: lines 140 (Bousfield), 180 (Brown–Peterson), 190 (Morava K-theory, Johnson–Wilson), 608 (Postnikov), 762 (Ravenel's), 770 (Hopkins–Ravenel), 994 (K-theory).
     - Lower-case "The"/"For" after the comma at lines 120, 160 and 770.
     - Use ℤ and H𝔽 throughout: lines 138, 188, 550, 924, 998, 1000, 1184 and 1192 write Z; lines 322, 944 and 1194 write HF.
     - Line 1028: "TM𝔽_(p)" should be "TMF_(p)".
     - Line 1044: write "prove that TMF[1/3]→TMF(3) is a faithful GL₂(𝔽₃)-Galois extension".
     - Line 394: the "Clausen–Mathew’s p-local convention" sentence has no locator, and cm-tate does not treat finite localization. Delete the sentence, or replace it with "On p-local spectra this is the L_n^(p,f) of cmnn line 97."
     - The Examples blocks at lines 440, 522, 686, 870 and 968 repeat a Check verbatim. Replace each with a new example or delete it.
     - Line 1280: unbacktick `sources.toml`, which the citation resolver reports as a Lean name found nowhere.

15. **F15** (P3) Licence class of three manifest entries

   - **Location.** `packages/ChromaticHomotopyTheory/sources.toml` lines 35 (hs), 320 (greenlees-sadofsky) and 337 (hesselholt-ku): `licence_class = "author-page"`.
   - **Witness.** All three are papers by other authors on Douglas Ravenel's departmental page (directory `otherpapers`). Ravenel's own paper (line 51) is correctly marked author-page.
   - **Repair.** Set `licence_class = "institutional"` for these three entries. The other fields stay unchanged.

Fifteen findings: two P1, two P2 and eleven P3. The empty `Suggested.lean` is justified: no headline is statable at the pins (table in *Verified sound*). The blocking defects are in the supplier contracts and gaps, plus one convergence statement that contradicts its own supplier.

## Verified sound

**Seeded source sample: 15 of 15 targets read at their locators.** Theorem number, page, hypotheses and support for the statement as written match in all 15; locator lines are wrong only where R06 says.

| Target | Source read | Result |
| --- | --- | --- |
| 3.1 | lmmt lines 244–266 (definition of periodic groups as ℤ[v^±]⊗π_*Map_*; Definition 2.1 with the height-0 convention; Lemma 2.2(i),(ii),(viii)) | colimit form equals the localization; p.6–7 |
| 4.1 | lmmt lines 319–322 (L_n^f at Hℚ⊕T(1)…; L_n^{p,f} at T(0)⊕…, T(0)=S[1/p] at line 254) | matches |
| 4.3 | lmmt lines 356–357 (consequence (i) of Lemma 2.8) | matches, p.9 |
| 5.2 | kuhn-guide lines 113–121 (Theorem 1.1 (1)–(3), characterization by (1)–(2)); Theorem 5.2 line 655, Lemmas 5.4–5.5 lines 710 and 737, Definition 5.6 line 743 | matches, pp.15–17 |
| 6.1 | lmmt line 398 (T(i)-homology Serre spectral sequence in the proof of 2.11(ii)) | statement true; locator and convergence per R04, R06 |
| 6.2 | lmmt lines 398–402 | general E-version true: the fibre colimit formula and Σ∞_+ commute with colimits |
| 6.4 | lmmt lines 389, 403–404, 406–415 (Proposition 2.11(iii), Remark 2.12 with m=n+1 via csy) | matches |
| 8.1 | lmmt lines 904–906 (BP[v_n⁻¹] class; complex-oriented rings of height ≤n are L_n-local) | README adds the unit-ideal and Čech details; correct |
| 8.3 | bhls lines 95–103 (Theorem A for height n+1≥2, all k) | the index shift n ↔ n+1 is correct |
| 9.1 | cm-tate lines 69–73 (Definition 2.2 and the remark after it) | matches |
| 9.2 | cm-tate lines 75–81, 106–111 (Proposition 2.3, Lemma 2.4, Theorem 2.5) | matches; cm-tate allows any Bousfield localization |
| 9.3 | cm-tate lines 118–128 (Theorem 2.6, Corollary 2.7); kuhn-tate lines 151–162 (Theorem 1.5, Corollaries 1.6–1.7) | matches, manuscript p.4 |
| 10.3 | lmmt line 153 (height definition), hahn line 19 (Theorem 1.1) | matches; the cited line 164 is off (R06) |
| 12.1 | mm lines 1729–1732 (Theorem 7.2), line 1719 (Γ commutes with ⊗T) | matches, p.36 |
| 13.2 | thom lines 768–773 (Theorem 5.1), 838–841 and 847 (fibre sequence, Theorem 5.7) | matches, pp.19–21; the README's cover index 4 is the paper's S³⟨3⟩ |

Also read: lmmt lines 301–318, 330–353, 361–395 and 812–931; csy line 4036; cmnn lines 97–100 and 827–851; goerss lines 670–693; behrens line 1160; greenlees-sadofsky line 343; hesselholt-ku lines 1658–1662; hahn lines 41–67; bhm lines 205–278; akq lines 218, 236 and 632. No locator is flagged unverified in the README; abs is settled as uncertified.

**Headline statability (the Lean file states nothing).** Mathlib and Tau Ceti at the pins have:
- **No spectra** under any name (searched for Spectrum, Prespectrum, OmegaSpectrum, symmetric spectra, smash product, suspension spectrum, Bousfield localization of spectra).
- **No reduced suspension, homotopy fibre, fibration or weak homotopy equivalence.**
- **Partial carriers:** `FormalGroup` (`Mathlib/RingTheory/FormalGroup/Basic.lean:56`), `HomotopyGroup` and `LoopSpace` (`Mathlib/Topology/Homotopy/HomotopyGroup.lean:86`), quasicategories and model categories, the Eilenberg–Steenrod pretheory (R13), and Mathlib's spectral-sequence objects (`Mathlib/Algebra/Homology/SpectralSequence/Basic.lean`).

Every headline needs a carrier from the first two lists:

| Headline | Missing carrier at the pins | Stand-in rejected |
| --- | --- | --- |
| §3.3, §8.2, §8.4, §10.2, §10.3 | spectra, ring spectra, T(n), K(n) | — |
| §4.1–§4.5 | spectra and homological localization | `ObjectProperty.isLocal` (`Mathlib/CategoryTheory/Localization/Bousfield.lean:55`) is only the 1-categorical condition |
| §5.1–§5.3 | mapping spectra, Φ_n, telescopes | — |
| §6.1, §6.2 | spectra; homotopy fibres; excision in the ES API | the Hℤ special case or an ES re-encoding (R13) |
| §6.3, §6.4 | T(i), unstable periodic groups, L_n^{p,f} | — |
| §7.1, §7.2 | E∞ ring spectra | Lubin–Tate rings alone are not the headline |
| §8.1, §8.3 | oriented ring spectra, K-theory of ring spectra | — |
| §9.1–§9.5 | Borel G-spectra, Tate, KU | the algebraic ℚ_p(ζ_p) quotient is a Check |
| §10.1, §10.4 | E∞ algebras over E, power operations | — |
| §11.1 | ko, KO, relative tensor | — |
| §12.1–§12.4 | spectral stacks, tmf/Tmf/TMF | |GL₂(𝔽₃)|=48 is a Check |
| §13.1–§13.5 | GL₁ of ring spectra, Thom spectra, ΣW | — |

The docstring names all 25 headline groups with their missing carriers; R13 asks only for more precision.

**Lean form.** `lake env lean packages/ChromaticHomotopyTheory/Suggested.lean`, run from the content checkout, exits 0 with no messages in 3.4 s. There are no declarations, so there are no `sorry` warnings and nothing to probe or `#check`. Other form checks:
- The file has a single `import Mathlib`, no `set_option`, no sorry'd data, the docstring form "<title>: target signatures", and the namespace `TauCetiRoadmap.ChromaticHomotopyTheory`.
- No padding.
- A scratch file of `#check @…` for the README's Mathlib names elaborates, and each prints a type matching the README's description: `FormalGroup`, `.IsComm`, `.Point`, `.map`, `.𝔾ₐ`, `.𝔾ₘ`, `CategoryTheory.ObjectProperty.isLocal`, `TopPair.HomologyPretheory` and `.IsHomotopyInvariant`.
- `WeierstrassCurve.formalGroup` is read at `TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Basic.lean:58`. Tau Ceti object files are absent at the pin and are not imported by the package, so they were not built.

**Dependency check (output verbatim):** `depcheck: 27 roadmaps, 236 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line. EllipticCohomology, TopologicalKTheory and HomotopySpheres are other authors' open pull requests that add new roadmap folders, so they are admissible suppliers.

**Gap contracts.** The six named-supplier slugs appear in the README verbatim, under the right supplier subsection, as the plan states them (script check). `p-local-finite-duality` and `spectral-ringed-sites` are precise and not provided elsewhere: GeneralizedCohomology G3.9 and G5.1 are integral, and EllipticCohomology has no spectral QCoh. R03 and R05(d) cover the other four.

**Cross-roadmap citations resolved.**
- GeneralizedCohomology (main): G2; G3.4, G3.7, G3.8 and G3.9 (line 878); G5.1 (1512); G5.4 (1559, 1652, 1677).
- BordismFormalGroups (main): F1 (46); F2 (145); F3 (284, BP⟨n⟩, E(n), K(n) at 293–300); F5 (466, invariant primes 472); F6.1 (555); F6.2 (586); F6.3 (760, T(n) and L_n^f at 1171–1190); F6.4 (1248, smashing 1276); F6.5 (1526, K(n)-local Tate vanishing).
- StableHomotopyKTheory: §3.18, §3.21, §§7.21–7.27.
- AlgebraicTopology: Stages 4, 5 and 8.
- HomotopySpheres: §3A (Freudenthal, adjunction), §3B (R02), §4B.
- TopologicalKTheory: T7.
- EllipticCohomology: E1 (compactification, ω, Δ); E2 items 2–3; E3 (O^top, homotopy sheaves); E4 (Δ²⁴ lift, Tmf[(Δ²⁴)⁻¹]≃TMF, Δ⁸ and Δ³ periods); E6 (level sheaves, deck descent).
- ModularCurves (main): §4B; §4C item 2 (GL₂(𝔽₃)-torsor over ℤ[1/3]); §7E; §7F.
- EnhancedDerivedSheaves: E0.4, E0.5, E5.
- GeneralAlgebraicKTheory: Layer 11.
- RefinedTraceMethods: §§2.4, 2.7, 2.10, 4.9, 4.11.

All exist except where R02, R03 and R05 say.

**Ownership.** The roadmap index (330 open roadmap pull requests and main) and the board packages were searched for Bousfield–Kuhn, Kahn–Priddy, the telescope conjecture, blueshift, Hopkins–Mahowald and Mathew–Meier affineness. No second owner was found, apart from R03 and R07. Two observations are not findings of this package:
- GeneralAlgebraicKTheoryPartII (design, merge order 220) plans K-theory of ring spectra and stable categories (KII.0), which RefinedTraceMethods §4.9 also plans.
- HomotopySpheres has two open heads; both carry §3A–§3B.

**Adversarial pass.** One row per statement, with the values computed on each side:

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: sign, cofibre | swap on ΣS∧ΣS; S→S→0 | (−1)^(1·1)=−1; cofib(id)=0, cofib(0→S)=S | holds | — |
| Conventions: finite-tower bottoms | S/q (q≠p); S_(p) | Hℚ∧S/q=0 vs S[1/p]∧S/q=S/q; Hℚ vs S_(p)[1/p]=Hℚ | holds | — |
| Conventions: X⟨r⟩, m-connective maps | K(A,2), r=3 and r=2; LES at k<m, k=m | K(A,2)⟨3⟩=*, ⟨2⟩ keeps π₂=A; iso below m, onto at m | holds | — |
| Conventions: multiplicative series | [2], [3] for X+Y+XY | 2X+X²; 3X+3X²+X³=(1+X)³−1; mod p: X², X³ | holds | — |
| Conventions: Δ²⁴ | weight and degree | 12·24=288, 2·288=576; Δ⁸→192, Δ³→72 | holds | — |
| L₀ notation | lines 140, 770 | 0 vs Hℚ | clash | R09 |
| Layer 0 duality | D(S/p); V=S_(p), X=Hℤ | fib(p)=Σ⁻¹S/p; Hom(ℤ_(p),ℤ)=0 vs ℤ_(p) | holds | — |
| Layer 1 coefficients | p=3: π₂BP, π₂MU_(3); K(1)_* at p=2 | |v₁|=4 so 0, and ℤ_(3); 𝔽₂ in every even degree | holds | — |
| Layer 2 type, periodicity | type(S_(p)∧S/p), type(S/p∧0); v vs v² | max(0,1)=1, max(1,∞)=∞; v^a=(v²)^b gives (2,1), degree 2d | holds | — |
| 3.1 periodic groups | *, Hℤ, S/q at height 0 | 0; H^(−k−rd)(V)=0 for large r; (ℤ/q)[1/p]=ℤ/q | holds | — |
| 3.2 telescope criteria | Hℚ, H𝔽_p, K(n); S→S_p^∧ at height 0 | T(n)∧Hℚ=0, T(n)∧H𝔽_p=0, K(n)∧T(n)≠0; ℤ[1/p]→ℚ_p not onto | holds | R07 |
| 3.3 ring acyclicity | R=0, K(n); H𝔽_q at height 0 | 0/0; ≠0/≠0; H𝔽_q vs 0 | holds | — |
| 4.1 towers | S, S/q | Hℚ vs S[1/p]; L_n^f(S/q)=0, L_n^{p,f}(S/q)=S/q since [F,S/q]=0 for p-torsion finite F | holds | — |
| 4.2 kernels | n=0 | generated by S/p; excludes S/q; p-local part rationally acyclic | holds | — |
| 4.3 comparison | S_(p), S/q | Hℚ=Hℚ; S/q≠0 | holds | — |
| 4.4 fracture | (E,F)=(0,S),(S,0); m=0 | squares (X,X,0,0), (X,0,X,0), pullback X; L₀^{p,f} smashing | holds | — |
| 4.5 bottom | S/q, 0 | T(1)∧S/q=0, both sides S/q; 0=0 | holds | — |
| 5.1 Φ_v | *, finite Postnikov, v vs v² | 0; 0; even cofinal subsequence | holds | — |
| 5.2 Φ_n | 0, T(n); height 0 with Σ⁻¹Hℚ | 0; L_T(n)T(n)≠0; Ω∞Σ⁻¹Hℚ=* but S[1/p]∧Σ⁻¹Hℚ≠0 | holds | — |
| 5.3 detection | Hℤ→0; Σ⁻¹Hℚ→0 | T(n)∧Hℤ=0, Σ∞Ω∞Hℤ=⋁_(k≠0)S≠0; image 0→0 | holds | — |
| 6.1 filtration | Hℤ, reflection mapping torus; KU over ℂP^∞ | H₀(S¹;ℤ⁻)=ℤ/2, H₁(S¹;ℤ⁻)=0 so H₁=ℤ⊕ℤ/2, H₂=0; strong convergence | true but understated | R04 |
| 6.2 fibrewise homology | id, ∅→*, two-point fibre | id; 0→E iff E=0; fold with fibre E | holds | — |
| 6.3 connective vanishing | K(ℤ/p,n); contractible F | K(n)_*≠0, only n-connective, so excluded; 0 | holds, sharp | — |
| 6.4 Σ∞Ω∞ | id; Hℤ→0 | 0; fibre π₀=ℤ, and T(0)∧Hℤ≠0 | holds | — |
| 7.1 Lubin–Tate | h=1,2,3 | ℤ_p; W(𝔽_(p²))[[u₁]]; 2 parameters; goerss line 691 contractibility | holds | R12 |
| 7.2 stabilizer | h=1 odd p; h=3 | ψ_(−1)u=−u, square fixes u, π₀ fixed; |Gal|=3 | holds | — |
| 8.1 locality | KU_(p); additive law over 𝔽_p; zero ring | (p,v₁)=(1); (0)≠(1); 0=(1) | holds | — |
| 8.2 T(n) vs K(n) | L_(n−1)S, K(n), KU_(p) | 0/0; K(n)/K(n); ℤ_(p) vs ℤ_p | holds | — |
| 8.3 separation | n=1; n≥2, k≥0 | equal classes; bhls Theorem A with index shift | holds | — |
| 8.4 BP⟨n⟩ | n=0; n=1 rational degree −(2p−2) | T(i)∧Hℤ_(p)=0; 0 vs ℚ | holds | R05(e) |
| 9.1 norm | G=1; Hℚ, H𝔽₂ with C₂ | id; ×2 invertible; ×2=0, Tate≠0 | holds | — |
| 9.2 transfer | C₂, C₃, S₃ rationally; ℤ | 2, 3, 6 with sections 1/2, 1/3, 1/6; no integral section | holds | — |
| 9.3 Tate vanishing | KU_p^∧ with C_p; induced object | raw π₀=ℚ_p(ζ_p)≠0, localized 0; induced Tate 0 | holds | — |
| 9.4 blueshift | KU_p^∧, n=1; 0; S[1/p] | ℚ_p(ζ_p)-vector space, so L₀^{p,f}-local; 0; 0 (cmnn line 99) | holds | — |
| 9.5 KU Tate | p=2, 3 | 2+z=0 gives ℚ₂; z²+3z+3 Eisenstein gives ℚ₃(ζ₃); (ζ₃−1)²=−3ζ₃ | holds | — |
| 10.1 power operation | P(1), P(0); p=2, h=2 | 1, 0; height-3 series has u₂z⁴ | Check wrong | R08 |
| 10.2 Hahn | H𝔽_p; K(h) as an A∞ ring | acyclic at K(0), K(1); K(h−1)∧K(h)=0, K(h)∧K(h)≠0 | holds | — |
| 10.3 height | 0, H𝔽_p, Hℚ, H𝔽_q; R→S | −1, −1, 0, 0; S is an R-module | holds | — |
| 10.4 Tate converse | Hℚ; KU_p^∧ with i=1 | Tate 0; T(2)∧KU=0, T(1)∧KU≠0 (cmnn line 827) | holds | — |
| 11.1 ko→KO | complexification; rational π_(−8) | (2b²)²=4b⁴; α²=β gives 4=1; 0 vs ℚ | holds | — |
| 12.1 affineness | V=0, S, S∨ΣS on Spec A | 0; Γ(O); Γ(O)∨ΣΓ(O) | holds | — |
| 12.2 tmf | n≥3; height 2; height 0 | T(n)∧Tmf=0; Δ a unit at smooth height-2 points; π_(−21)Tmf⊗ℚ≠0 lost in tmf | holds | R14 typo |
| 12.3 Galois | trivial C₂, S₃ torsors; B=0 | A⁴=∏_G B; 36=36 factors; Hℤ killed; |GL₂(𝔽₃)|=48 | holds | — |
| 12.4 supersingular | p=2, 3 | 24·2=48; 12·2=24 (behrens line 1160) | holds | — |
| 13.1 Thom | *, two points; GL₁H𝔽₂, GL₁H𝔽₃ | R; R⊕R; 1 vs 2 components; 2 unit components | holds | — |
| 13.2 Hopkins–Mahowald | p=2; fibre degrees | unit −1; completed π₃=π₂=0; uncompleted π₂=ℤ_p/ℤ | holds | — |
| 13.3 y(m), z(m) | m=0; p=2, m=1 | J₀=* gives S_p^∧, π₀=ℤ_p; J₁S²=S², π₀y(1)=𝔽₂, π₀z(1)=ℤ₂ | holds | — |
| 13.4 acyclicity | m=1, 2; slopes | y-range {0}; z-range ∅, {1}; 2p^m−2 = 2 at (2,1), 4 at (3,1) | holds | — |
| 13.5 James | *, S², S⁰ | 0; ⋁S^(2k), k≥1; S⁰ excluded (ℕ vs ℤ) | holds | R02, R10 |
| Worked examples | all six | recomputed as above (1+z)², Eisenstein, a²=4b, Klein bottle, fibre π₂ | hold | — |

**Shape.**
- Fourteen layers, each ending with Examples and Dependencies.
- Every own definition has at least three discriminating Checks: §3.1, §4.1, §5.1, §5.2, §6.1, §7.1, §7.2, §8.3, §9.1, §10.1, §10.3, §12.3, §13.1 and §13.3.
- No LaTeX delimiters, algorithms or "optional/deferred" scope words.

## Not verifiable

- **abs** (Atiyah–Bott–Shapiro): uncertified (paywalled), cited by locator only, so §11.1's coefficient locators were not read. The relation a²=4b, with c(a)=2u² and c(b)=u⁴, was checked instead in GeneralizedCohomology G5.4 (main line 1677).
- **thom** is an OCR text. In Theorem 5.1 the unit-group symbol is garbled, so the convention 1−p∈ℤ_p^× rests on lmmt lines 836–837.
- **hs §4**, the periodicity construction, and the BHLS argument beyond Theorem A were not read. They are outside the sample and are proof routes only.
- One GitHub API read was made, the README of RefinedTraceMethods at its board head, because that package is not in this checkout. No other open pull request was fetched; the roadmap index tool covered the rest.

## Source issues

- **Misprint** in lmmt at Remark 2.12, p.10: the source says T(i) kills K(π,r) for every finite group π when r>i; it should be every finite abelian p-group, since π=ℤ/q (q≠p) fails at r=1, i=0; affects nothing.
- **Gap** in cmnn at Lemma 4.7 and the proof of Theorem 4.6, pp.19–20: the source states the theorem for i≥0 but writes the lemma with the ideal (p,v₁,…,v_(i−1)) and field k((v_i)); it should be a separate i=0 case with the zero ideal and the field W(k)[1/p]; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "0ea406d", "job": "REV-PKG-ChromaticHomotopyTheory", "model": "opus", "worker": "fable-rev33"} -->
