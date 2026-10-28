<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1119#issuecomment-6383132887 -->
Review (claude) of b299520

Verdict: needs changes

1. **F01** (P2) The Hecke ideal is matched to the wrong representation in the parent's convention

   **Location.** README line 213: "with geometric Frobenius elements it is the ideal that HilbertModularVarietiesAndShimuraCurves §R18.3.15 (T_v ↦ tr, S_v ↦ `q_v^{−1}det`) attaches to r̄^∨ ⊗ `ω^{−1}`." Also line 56: "convert its arithmetic Hecke polynomial by Frobenius inversion before using §0.3".

   **Claim.** The BDJ/BHHMS maximal ideal 𝔪 of §0.3 is the parent's residual Hecke ideal of r̄^∨ ⊗ ω^{−1}.

   **Witness.** HilbertModularVarietiesAndShimuraCurves §R18.3.15 fixes arithmetic Frobenius. Over 𝔽₂₉ take q=5 and geometric eigenvalues 2, 3 of r̄. BHHMS gives (T,S)=(9,25). r̄^∨⊗ω^{−1} has arithmetic eigenvalues 12, 18, giving (1,20). r̄⊗ω has 17, 21, giving (9,25).

   **Repair.** Line 213: "it is the ideal that HilbertModularVarietiesAndShimuraCurves §R18.3.15, with its arithmetic Frobenius, attaches to ρ̄ = r̄ ⊗ ω". Line 56: replace "convert its arithmetic Hecke polynomial by Frobenius inversion" by "apply §R18.3.15 to r̄ ⊗ ω". Add to §0.3 the Check: with q=5 and geometric eigenvalues 2, 3 in 𝔽₂₉, §R18.3.15 applied to r̄⊗ω gives (T,S)=(9,25), the BDJ values, while r̄^∨⊗ω^{−1} gives (1,20). Tested on the instance: the arithmetic eigenvalues of r̄⊗ω are 5·2⁻¹=17 and 5·3⁻¹=21, with trace 38≡9 and q⁻¹·det = 6·357 ≡ 25. These match the ideal of BHHMS23 lines 4449–4451.

2. **F02** (P2) Hamann's cancellation already has an owner earlier in the merge order

   **Location.** README §1.1 (lines 330–346), line 120, and line 338: "*Lean:* `powerSeries_cancellation` states the general local-ring cancellation theorem." Suggested.lean lines 43–51.

   **Claim.** This roadmap owns Hamann's local power-series cancellation.

   **Witness.** LocalGaloisDeformationRingsPartII's accepted design (order 307; this roadmap 308) uses it in T.6/special-fibres and requests it from DeformationAndDerivedPatchingAlgebra R03.3: "local power-series cancellation in the generality of Hamann Theorem 4". An earlier consumer cannot use a later owner.

   **Repair.** Delete §1.1 as an owned target. Remove `powerSeries_cancellation` from Suggested.lean, from line 120 and from the `*Lean:*` line 338. Under "From TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra" add: "What DeformationAndDerivedPatchingAlgebra must provide (gap:power-series-cancellation): for commutative local rings A and B, a ring isomorphism A⟦x⟧ ≅ B⟦x⟧ implies A ≅ B (HAM75 Theorem 4, p. 155), with the W(𝔽)-linear correction for complete local W(𝔽)-algebras with residue field 𝔽". Add the same slug to the top-level `gaps` of `design/plan.json`, and repoint the "§1.1" citations in line 64 and in §1.2's *Needs:* to this gap. Tested: the order then reads DeformationAndDerivedPatchingAlgebra (73) < LocalGaloisDeformationRingsPartII (307) < this roadmap (308). There is one owner, the request already announced to that owner is unchanged, and no edge points upward.

3. **F03** (P2) The new-at-w₁ step of §0.7 cites supplier sections outside their hypotheses

   **Location.** README line 308: "transferring it to GL₂ by the Jacquet–Langlands bridge (HilbertModularVarietiesAndShimuraCurves §R18.4.24), local–global compatibility (AutomorphicGaloisRepresentations §§6.10–6.12) shows that the eigenvalue ratio of its residual Frobenius would be `Norm(w₁)^{±1}`". Also line 116 and §0.7's *Needs:* (line 314).

   **Claim.** These sections supply local–global compatibility at w₁ for §0.7, in the indefinite case as well as the definite one.

   **Witness.** AutomorphicGaloisRepresentations §6.10 assumes "F totally real of even degree … D definite" (Khare–Wintenberger setting); §R18.4.24 exchanges invariants between indefinite B and definite D, not a transfer to GL₂. The indefinite, odd-degree case is uncovered.

   **Repair.** In line 308, write "transfer it to GL₂ by global Jacquet–Langlands (GL2AutomorphicRepresentationsAndTransfer §§R17.3.1, R17.3.10) and apply local–global compatibility at w₁ ∤ p (AutomorphicGaloisRepresentations §4.4)". Add a "From TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer" contract for §§R17.3.1, R17.3.10 (merge order 106, earlier). In line 116 and in §0.7's *Needs:*, replace §§6.10–6.12 by §4.4. Tested on an indefinite D over a cubic field: AutomorphicGaloisRepresentations §4.4 covers every Hilbert π of type (k,w) at every finite v ∤ ℓ, and R17.3.10 covers the indefinite transfer.

4. **F04** (P2) §2.5 asserts a false reverse depth inequality

   **Location.** README line 661: "The depth comparison is an inequality; the reverse inequality also holds but is not needed."

   **Claim.** depth_A(M) ≥ depth_B(M) for every B-module M.

   **Witness.** Take K=ℤ_p, r=0 and s=1, so A=O⟦T⟧ and B=O⟦T,y⟧, with M=B. As an A-module M≅∏A, so depth_A(M)=2 while depth_B(M)=3. GN22 lines 2171–2173 claim equality only for M finitely generated over A.

   **Repair.** Replace the sentence by: "Equality holds when M is also finitely generated over A (GN22 §A.20, p. 47); in general only the inequality holds." Add the instance above to §2.5 as a negative-control Check. Tested: for M=B/(y)≅A, which is finite over A, both depths are 2; for M=B they are 2 and 3.

5. **F05** (P2) gap:breuil-mezard-pbt is compound and asks the local supplier for this roadmap's global results

   **Location.** README line 70 (and the identical `needs` of `breuil-mezard-pbt` in `design/plan.json`): "supply the Gee–Kisin potentially Barsotti–Tate Breuil–Mézard identity, patched-weight nonvanishing and crystalline-support comparison, and identify its nonzero weights with BDJ weights when K is unramified."

   **Claim.** This is one precise need for LocalGaloisDeformationRingsPartII T.6.

   **Witness.** It bundles four results. "Patched-weight nonvanishing" is GK14 Corollary 5.4.5 (GK14 line 1573), about S_{τ_p}(U,σ)_𝔪 and proved by patching; §0.6's own route derives it ("Deduce (GK14 Corollary 5.4.5)…").

   **Repair.** Set `needs` to: "For every finite K/ℚ_p with p>2 and continuous r̄:G_K→GL₂(𝔽), supply integers μ_σ(r̄)≥0 with e(R^{□,0,τ}_{r̄}/ϖ)=Σ_σ n_{0,τ}(σ)μ_σ(r̄) for every inertial type τ, μ_σ(r̄)≠0 exactly for the predicted weights, which are BDJ's W(r̄) when K is unramified (GK14 Theorem A)." Make patched-weight nonvanishing and the Serre-weight support of M∞(σ) targets of §0.6 and §1.5. Update line 72 and `plan.json` to match. Tested: every clause of the new sentence concerns local deformation rings only.

6. **F06** (P2) gap:tame-types is vague and mixes K-types with ring ideals

   **Location.** README line 66: "supply the full tame K-type dictionary with weight-isolating and all-weight types, irreducible-cosocle lattices, capped intervals and their support ideals, compatible with the BDJ duality convention."

   **Claim.** This is one precise need for LocalGaloisDeformationRingsPartII T.0.

   **Witness.** "Full dictionary" fixes no statement; the "support ideals" are ideals I_𝒥 of R∞ (BHHMS23 lines 4628–4630), ring objects, not T.0 K-type data; it bundles EGS15 Propositions 3.5.1–3.5.2, §5.1, Definition 10.1.4, Proposition 10.1.11.

   **Repair.** Set `needs` to: "For K/ℚ_p unramified and generic r̄: every tame irreducible non-Steinberg K-representation is some σ(τ); for each σ∈W(r̄) a non-scalar tame τ with JH(σ̄(τ))∩W(r̄)={σ}; for semisimple r̄ the unique τ₀ with JH(σ̄(τ₀))=W(r̄); the irreducible-cosocle lattices σ_J°(τ) and their capped-interval subquotients; W(r̄) as in §0.2." Move the ideals I_𝒥 (EGS15 §10.1, Proposition 10.1.11) into gap:single-type-rings (T.6). Mirror both changes in `design/plan.json`. Tested: each clause is a single cited statement (EGS15 line 687 for the weight-isolating type, BHHMS23 line 4712 for the image).

7. **F07** (P3) Design-catalogue identifiers left in the prose

   **Location.** Line 143: "the patched rings of GK.1 are rings for r̄_v^∨"; line 475 and line 502: "for the weighted π of GK.0"; line 502: "as in GK.1"; line 765: "without GK.4 or GK.5".

   **Claim.** GK.0, GK.1, GK.4 and GK.5 are references a reader can resolve.

   **Witness.** No section of the README is called GK.n. These are the design catalogue's layer identifiers (compare the `cited_for` fields of `sources.toml`).

   **Repair.** Replace GK.0 by §0.5; GK.1 by §1.2 in line 143 and by §1.6 in line 502; "without GK.4 or GK.5" by "without Layers 4–5". Tested: `grep "GK\.[0-9]"` on the README then finds nothing.

8. **F08** (P3) Locator slips

   **Location.** Line 763: "proof of Proposition 8.3.7, p. 101; BHHMS23 line 4716"; line 793: "§1.3.3, (7), pp. 8–9; BHHMS23 line 4797"; line 950: "§1.3.2, (5)–(6), p. 7; BHHMS23 line 5145"; line 585: "Lemma 8.2.1 and proof, pp. 90–91"; line 679: "STACKS, Tag 00MK".

   **Claim.** These locators point at the cited statements.

   **Witness.** Second line numbers repeat the first locator; the statements are at BHHMS23 lines 5044, 354, 288. Lemma 8.2.1's proof ends at line 4584, p. 90. Tag 00MK needs a finite module over a commutative Noetherian local ring.

   **Repair.** Use BHHMS23 lines 5044, 354 and 288, and write "p. 90". Replace Tag 00MK by the ideal-separated flatness criterion that GN22 lines 2285–2289 use (Matsumura, Theorem 22.3), or drop it. Also cite "sufficiently small in the sense of Kisin (2.1.2)" (lines 145, 202, 234) as EGS15 §6.2, p. 34, EGS15 line 1695, since Kisin's paper is not in the manifest. Tested: each new line falls inside the cited statement in the cached text.

9. **F09** (P3) Ambiguous or mis-scoped section references

   **Location.** Line 80: "used only when §5.6's inert-prime comparison constructs that specific map"; line 92: "The adapter in §5.6 proves concentration in degree 1"; line 219: "the finite group acts freely (HilbertModularVarietiesAndShimuraCurves §R18.1.4)"; §0.4's *Needs:* (line 248).

   **Claim.** "§5.6" is this roadmap's §5.6, and §R18.1.4 supplies freeness at the w₁ level.

   **Witness.** Inside those two contracts "§5.6" reads as the supplier's §5.6 ("Shared Chebotarev selection for Selmer detection"; "Normalized classical cohomology growth"). §R18.1.4 proves freeness for U ⊂ (1+NÔ_B)^×, N ≥ 3, not the unipotent-mod-w₁ level.

   **Repair.** In lines 80 and 92, write "this roadmap's §5.6". For freeness at the w₁ level, in line 219 and in the *Needs:* of §§0.3–0.4, cite §0.1's API bullet (BHHMS23 Remark 8.1.3(iii), BHHMS23 line 4452), keeping §R18.1.4 only for the central kernel. Tested: in line 80 the inert-prime map is this roadmap's §5.6 deformation-ring map.

10. **F10** (P3) Checks that are vacuous or describe no generic datum

   **Location.** Line 344: "For A=𝔽₂ and B=A, cancellation gives A≅A … The nilpotent case A=𝔽₂[ε]/ε² also admits the identity isomorphism"; lines 312, 322 and 1058: "max(f,f)=f"; lines 375, 379, 409 and 535: instances with f=|S|=1.

   **Claim.** These Checks discriminate.

   **Witness.** Identity isomorphisms and max(f,f)=f hold for any candidate. |S|=1 forces S=S_p={v} and S_D=∅, and f=1 then forces F=ℚ. So D=M₂(ℚ), which is excluded, or D is definite and unramified at every finite place, which is impossible.

   **Repair.** For §1.1, use ℤ_p⟦t⟧⟦x⟧ ≇ ℤ_p⟦x⟧ (Krull dimensions 3 and 2) as a negative control. Drop "max(f,f)=f". Replace f=|S|=1 by f=1, |S|=2, q=1 (definite D over ℚ ramified at one prime ℓ): R∞ then has 10 variables and S∞ has 8, Krull dimensions 11 and 9. Tested: that datum satisfies §0.1 (S={p,ℓ}).

Six blocking findings (P2) and four non-blocking ones (P3). None of them re-plans an existing roadmap or puts the scope in doubt, so the package can be repaired; it is not rejected. Files are cited as `packages/HilbertModularVarietiesAndShimuraCurvesPartII/README.md` (README below) and `packages/HilbertModularVarietiesAndShimuraCurvesPartII/Suggested.lean` (Suggested.lean below).

## Verified sound

**Elaboration.** `lake env lean` on Suggested.lean, run from the content checkout at the pins (Mathlib 6b7abb3c, Tau Ceti a91d3aaf): exit 0 after 4.2 s. The only output is three `declaration uses 'sorry'` warnings, at lines 46, 77 and 95. I put `#check @name` for all five declarations into one scratch file. Each elaborated type matches its README statement (§§1.1, 2.2, 2.3; definitions in lines 30, 587, 616), and nothing changed. Two hypotheses are unused, as notes only. In `freeRankOnSupport_of_extension`, `hr` is unused because r=0 forces M=0, where the conclusion holds. In `modulePullback_freeRankOnSupport_iff`, `IsNoetherianRing` is unused because Nakayama needs only finite generation, which `FreeRankOnSupport` supplies. Both mirror BHHMS23 Lemmas 8.2.1 and 8.3.8.

**Padding probe.** I ran 15 probes: each of `simp`, `rfl`, `infer_instance`, `exact?` and `aesop` on each of the three theorems, in scratch copies of the file. All 15 fail, so nothing is padding. The file has a single `import Mathlib`, no `set_option`, no sorry'd data, `theorem` only, and a module docstring that lists the headlines that cannot be stated. No fully qualified name occurs in any other roadmap (`roadmaps grep --lean-only` finds nothing).

**Headlines.** The end theorems are §5.1 (GK dimension f), §5.2 (π[𝔪²_{K₁}]), §5.3 (faithful flatness), §5.4 (Banach lifts), §5.5 (unweighted GK dimension) and §5.7 (big R = big T, complete intersection). The deep inputs are §0.6, §1.7, §§2.4–2.6, §§3.2–3.4 and §§4.8–4.9. None can be stated at the pins: there are no quaternionic Shimura-curve cohomology, no patched modules and no uniform-group canonical-dimension interface. The docstring names each one with the carrier it lacks. The three stated theorems are true: HAM75 Theorem 4 (HAM75 line 101) covers any quasi-local R, and I checked the proofs of Lemmas 8.2.1 and 8.3.8 by hand (rows L3–L4 below).

**Dependency check.** I ran it exactly as the brief gives it. Its output was `depcheck: 34 roadmaps, 314 edges, 0 problem(s)`: no UPWARD or CYCLE line. Every supplier is either at merge order ≤307 or on main (PadicMeasuresIwasawaAlgebras, Chebotarev). HilbertModularVarietiesAndShimuraCurvesPartIIQuaternionic and HilbertSiegelModularVarieties are only split proposals from the design's `restructure` entry, named as non-suppliers.

**Declared gaps.** The slugs tame-types, single-type-rings and breuil-mezard-pbt appear identically in the README (lines 66–70, in the required form) and in `design/plan.json`. The supplier and its sections exist: LocalGaloisDeformationRingsPartII has the design nodes T.0/tame-type, T.0/type-jordan-holder and T.6/single-presentation, single-components, special-fibres. single-type-rings is precise, being EGS15 Theorem 7.2.1(2),(4),(5) (EGS15 line 2197). See R05 and R06 for the other two.

**Sources: the seeded sample.** All 15 sampled targets were checked at their locators. The README flags no locator as unverified.

| Target | Locators checked (cached text) | Outcome |
|---|---|---|
| 0.2 BDJ weights | EGS15 lines 477–526 (§2.1, Lemma 2.1.6, pp. 10–11); BDJ10 line 834 (§3.1, p. 18), lines 1065–1085 and 1260–1324 (§3.2, L_α and its two exceptions); BHHMS23 lines 588–611 (§2.2, pp. 13–14), line 4361 ((61), p. 87); ω₁=ω at BHHMS23 lines 620–621, EGS ω₁=ε⁻¹ at EGS15 line 433 | supported, including W(ρ)=D_EGS(ρ^∨) |
| 0.3 spaces S(σ), M(σ) | EGS15 lines 1670–1777 (§6.2, pp. 34–36); BHHMS23 lines 4439–4461 (Remark 8.1.3) and lines 4501–4513 (definite case) | supported; ψ⁻¹ and quotient curve per Remark 8.1.3; θ_w²=ψ_w⁻¹c_σ⁻¹ consistent with ψ⁻¹ |
| 0.4 projectivity | BHHMS23 lines 5376–5377 (proof of Cor. 8.4.6(i), p. 107: injective, non-Eisenstein); (64) BHHMS23 lines 4462–4494; EGS15 lines 1753–1754 | supported (injective = projective over Frobenius 𝔽[G]) |
| 1.1 Hamann | BHHMS23 lines 4404–4405 (Lemma 8.1.2, p. 88); HAM75 line 101 (Theorem 4, p. 155) | supported |
| 1.3 type quotients | BHHMS23 lines 4601–4606 ((69), p. 91), lines 5074–5076 (ε-twist, det ε³ψ_v⁻¹, p. 101); EGS15 line 1597 | supported |
| 1.6 fibres | BHHMS23 lines 4462–4500 ((64)), 4517–4549 ((65)–(68), pp. 89–90); EGS15 line 1799 ((6.1), p. 36) | supported |
| 1.7 big module | BHHMS23 lines 5213–5223 (p. 104), 5251–5253 (p. 105), 5437–5444 ((84), p. 108); DL21 line 3111 (Theorem 6.2, p. 54); CEGGPS16 lines 1361–1379 (Prop. 2.13, p. 34) | supported |
| 2.2 extension freeness | BHHMS23 lines 4566–4584 (Lemma 8.2.1); STACKS line 1544 (Tag 05G8) | supported (page range: R08) |
| 2.3 fibre products | BHHMS23 lines 5054–5065 (Lemma 8.3.8, p. 101) | supported; proof checked by hand |
| 2.5 CM transfer | GN22 lines 2168–2241 (§A.20, Lemmas A.21–A.28, Cor. A.29, pp. 47–49) | locators supported; the extra remark is false (R04) |
| 3.3 locally algebraic types | BHHMS23 lines 4662–4713 (Cor. 8.2.4, Remark 8.2.5, pp. 92–93); CEGGPS16 lines 2533, 2650 (Lemmas 4.17, 4.18, pp. 62–64) | supported |
| 4.1 L_j, N_j | BHHMS23 lines 4797–4811 ((75), p. 95), 4938–4977 ((76), T′_{2,j}, Y_j, N_j, pp. 98–99), 5066–5069 (τ₀), 354 ((7)) | supported (line slip: R08) |
| 4.2 Loewy length | BHHMS23 lines 4753–4796 (Lemma 8.3.1, pp. 94–95) | supported |
| 4.4 V(α_j)⊗τ° | BHHMS23 lines 4843–4920 (Prop. 8.3.3, pp. 96–98), 4978–4982 (Lemma 8.3.5); EGS15 line 784 (Lemma 4.1.1) | supported |
| 4.7 generation | BHHMS23 lines 5030–5053 (Prop. 8.3.7, pp. 100–101) | supported; source misprint f→r (Source issues) |

Further locators I checked: BHHMS23 line 218 (p>23), lines 4315–4393 (§8.1 items (i)–(iv)), 4422–4438 ((63)), 4591–4623 (Lemma 8.2.2, Prop. 8.2.3), 4716–4748 (Prop. 8.2.6), 4921–4937 (Thm. 8.3.4), 5070–5159 (Thm. 8.3.9–Remark 8.3.12), 5172–5282 (Thms. 8.4.1–8.4.2), 5283–5304 (Thm. 8.4.3, Cor. 8.4.4), 5311–5408 (Cor. 8.4.6, Remark 8.4.7), 5409–5459 (§8.5, Cor. 8.5.1), 1918–1943 (Prop. 4.3.3); GK14 lines 105–134 (Theorems A and B), 1573–1580 (Cor. 5.4.5), 1600–1611 (Defs. 5.5.2–5.5.3, Cor. 5.5.4), 1673 (Cor. 5.5.7 = Theorem B); GN22 lines 1955–2033 (A.1–A.8), 2087–2167 (A.13–A.19), 2242–2289 (Prop. A.30), 1408 (Prop. 4.3.1); EGS15 lines 441–472 (Def. 2.1.1, Remark 2.1.3), 687 (Prop. 3.5.1), 1603–1637 (Defs. 6.1.1, 6.1.3, Lemma 6.1.4), 1802–1835 (§6.4), 2197–2226 (Thm. 7.2.1); LMS22 lines 631–672 (Lemma 4.5, p. 14; Prop. 4.6, p. 15); LE19 line 779 (Lemma 4.5, p. 16); BRE14 line 2754 (Lemme 9.2, pp. 54–55).

**Adversarial pass.** One row for each statement, convention and Lean declaration. Computations are over 𝔽₂₉ unless a row says otherwise.

| # | Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|---|
| C1 | Hecke normalisation (Conventions, §0.3) | q=5, geometric eigenvalues 2,3 | S=5·6⁻¹=25, T=25·5=9; S⁻¹T=7·9=5, qS⁻¹=6 ⇒ X²−5X+6; inverted roots 15,10 | holds | none |
| C2 | central twist | χ(z)=2 | χ⁻¹∘det on z: 2⁻²=22 (4·22=88≡1); positive twist 4 | holds | none |
| C3 | inversion gives opposite algebra | u=((1,1),(0,1)), v=((1,0),(1,1)) | uv=((2,1),(1,1)) ≠ vu=((1,1),(1,2)) | holds | none |
| C4 | Hecke ideal vs parent §R18.3.15 | as C1 | BHHMS (9,25); r̄^∨⊗ω⁻¹ at Frob_arith: 12,18 ⇒ (1,20); r̄⊗ω: 17,21 ⇒ (9,25) | fails as written | R01 |
| 0.1a | genericity box | p=23, 29; f=1 | p−15=8<12 (no datum); p=29: {12,13,14}, irreducible {13,14,15}; 12≤p−15 ⇔ p≥27 ⇒ p≥29 | holds | none |
| 0.1b | EGS genericity weaker | p=29, r₀=11 | 0≤11≤26, not 0 or 26: EGS-generic; BHHMS box excludes it | holds | none |
| 0.1c | p=3 | EGS Remark 2.1.3 | 0≤r≤0 forces r=0, which is excluded | holds | none |
| 0.2a | reducible semisimple W(ρ) | p=5: ω²⊕1 (s=1), ω³⊕1 (s=2=p−3) | {Sym¹, det²Sym¹}; {Sym², det³, det³Sym⁴} (s′∈{0,4}) | holds | none |
| 0.2b | irreducible W(ρ) | p=5, ω₂²⊕ω₂¹⁰ | Sym¹ and det¹Sym³: s(p+1)+(p−s)=10=p(s+1) | holds | none |
| 0.2c | nonsplit removes weights | ρ=(ω *;0 1) très ramifiée | W(ρ^ss) ⊇ {1, Sym^{p−1}}; H¹_f(ε^{2−p})=0 kills det Sym^{p−3}; W(ρ)={Sym^{p−1}} | holds | none |
| 0.2d | f=1, p=29, ω¹³⊕1 | s=12 | {Sym¹², det¹³Sym¹⁴} (p−3−s=14) | holds | none |
| 0.3 | exactness obstruction | C₂₉-cover | norm vector ↦ 29=0 under augmentation | holds | none |
| 0.4 | projective, not free | C₂, S₃, C₂₉ | trivial module dim 1 vs free dims 2n, 6n; rank-one over C₂₉: 29 | holds | none |
| 0.5 | central character after twist | χ(z)=2 | ψ⁻¹χ⁻²: factor 22; positive twist 4 | holds | none |
| 0.6 | weight theorem, both directions | f=1, p=29, ω¹³⊕1 | modular Sym¹², det¹³Sym¹⁴; Sym¹³ would need ω¹⁴⊕1 | holds | none |
| 0.7 | Gram discriminant | q=2, α/β=3 and 2 | (2−3)(2−10)=8; (q+1)²−S⁻¹T² with α=3, β=1: 9−32/3=−5/3≡8; ratio 2 gives 0 | holds | citations: R03 |
| 1.1 | Hamann | 𝔽₂; W⟦t⟧ vs W⟦X₁,X₂⟧; ℤ_p⟦t⟧ vs ℤ_p | Krull dimensions 3=3; 3 vs 2 distinguishes | true | R02, R10 |
| 1.2a | variable count | f=2,\|S\|=1,q=2; f=1,\|S\|=2,q=1 | 9 vs 5 (difference 4); 10 vs 8 (difference 2) | holds | R10 (f=\|S\|=1 impossible) |
| 1.2b | determinant directions | f=2, p>2 | f+1=3 | holds | none |
| 1.3 | weight sum 1 | λ=(2,0); counts | det weight 2≠1 ⇒ quotient 0; 1+(3+f)+4(\|S\|−1)+q−f=4\|S\|+q | holds | none |
| 1.4 | maximal Cohen–Macaulay | A=O⟦X₁⟧, A⊕A/(X₁) | depth 1 < dim 2 | holds | none |
| 1.5 | single weight at w | two weights, multiplicity 1 | fibre dimension 2 vs 1 | holds | none |
| 1.6 | fibre identity | free of rank r=2 | 𝔽² on both sides | holds | none |
| 1.7 | big module | f=1 | dim K₁/Z₁=3, j(π^∨)=2, δ=1 | holds | none |
| 2.1 | noncommutative CM | O⟦T⟧: Λ, Λ/T, Λ/ϖ, Λ⊕Λ/ϖ | (j,depth,δ)=(0,2,2),(1,1,1),(1,1,1); Ext⁰,Ext¹≠0 | holds | none |
| 2.2 | freeness from N and M/N | 𝔽₂[ε]/ε² with N=(ε); ℤ/4 with N=2A; r=0 | Ann(M/N)/Ann M=(ε)≅𝔽₂=A/Ann N ⇒ M≅A; 2A≅ℤ/2; r=0 ⇒ M=0 | holds | none |
| 2.3 | fibre-product criterion | k⟦x,y⟧/(xy); k⟦t⟧ with M=k | (x)+(y)=Ann k, pullback≅A; 0+0≠(t), pullback≅A² (basis (1,1),(t,0)) | iff holds both ways | none |
| 2.4 | grade and dimension | A=O⟦T,x⟧, M=A/(x) and M=A; Ω=k⟦T⟧ | j 1 vs 0, δ 2=2; δ 3→2; log_n n=1 | holds | none |
| 2.5 | depth comparison | K=ℤ_p, A=O⟦T⟧, B=O⟦T,y⟧; M=B and M=B/(y) | 2<3; 2=2 | reverse inequality fails | R04 |
| 2.6 | miracle flatness | A=O⟦T,x⟧: A/(T), A/ϖ | grades 1=1, flat; 1≠0, not flat | holds | none |
| 3.1 | MCM over support | k⟦x,y⟧/(x) | depth 1 = dim 1 | holds | none |
| 3.2 | common rank | O⟦x,y⟧/(xy−p) | special fibre k⟦x,y⟧/(xy), equal branch ranks | holds | none |
| 3.3 | disconnected support | multiplicities 1,2 | ranks r, 2r | holds | none |
| 3.4 | P_σ multiplicity | r=2 | Hom(P_σ,D₀²)=2 | holds | none |
| 4.1 | lattice ranks | f=1, 2 | d,4d; d,4d,7d; R′/pR has dimension d, R′/pR′ 3d | holds | none |
| 4.2 | hypothesis (b) | Q=σ | [Q/soc Q:σ]=0 | holds | none |
| 4.4 | V(α_j) | scalar z | dim 3, z²z⁻²=1 | holds | none |
| 4.6 | truncation only | k[t]/t⁴→k[t]/t³ | both quotients k[t]/t³ | holds | none |
| 4.7 | baseline Hom | f=1, r=2 | dim Hom(σ,π)=r=2 (source prints f=1) | holds | Source issues |
| 4.8a | support profiles | f=2, j=1 | three profiles, rank 7d; a rectangular set needs a 9d double-adjoint summand (16d) | README correct; source wrong | Source issues |
| 4.8b | p-membership unit | p=29, N=12, a₂=2, d*₂₁=1 | (2/a₂)d*₂₁=1, error O(p^{N−9})=O(29³) | holds | none |
| 4.9 | fibre isomorphism | r=2 | 𝔽²→𝔽² surjective, kernel 0 | holds | none |
| 5.1 | GK dimension | f=1, 2 | 2≥3−dim, dim≤1 ⇒ 1; 4≥6−dim, dim≤2 ⇒ 2 | holds | none |
| 5.2 | multiplicity r | r=2 | each constituent twice | holds | none |
| 5.3 | grade equality | f=1, 2 | j_B=2f=3f−f: 2, 4 | holds | none |
| 5.4 | torsion excluded | 𝔽 vs O | Hom_O(𝔽,E)=0; O gives E | holds | none |
| 5.5 | invariants | C₂₉ regular | invariants of dimension 1 out of 29 | holds | none |
| 5.6 | residual factors | 𝔽×𝔽 | two maximal ideals before localisation | holds | none |
| 5.7 | complete intersection | O⟦x,t⟧/(x) | O⟦t⟧, codimension 1 | holds | none |
| L1 | `FreeRankOnSupport` | M=0; M=k², r=1, 2 | 0≅(A/⊤)^r for every r; k²≇k, k²≅k² | discriminates | none |
| L2 | `modulePullback` | id,id; 0,0 on k | diagonal ≅ M; k² | matches README | none |
| L3 | `freeRankOnSupport_of_extension` | row 2.2 | snake lemma and Tag 05G8 twice ⇒ A/Ann M ≅ M | true | none |
| L4 | `modulePullback_freeRankOnSupport_iff` | row 2.3 | P/D ≅ I/(I₁+I₂); (1,1)∉𝔪P ⇒ Nakayama | true | none |
| L5 | `powerSeries_cancellation` | HAM75 Theorem 4 | needs only R quasi-local; Lean assumes both local | true, weaker | R02 |

**Library declarations opened at the pins.** Mathlib (6b7abb3c): `CategoryTheory.Abelian.Ext` Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:118; `IsLocalRing` RingTheory/LocalRing/Defs.lean:30 (extends `Nontrivial`); `IsNoetherianRing` RingTheory/Noetherian/Defs.lean:192; `IsRegularLocalRing` RingTheory/RegularLocalRing/Defs.lean:51; `LinearMap.ker` Algebra/Module/Submodule/Ker.lean:59; `Module.Finite` RingTheory/Finiteness/Defs.lean:121; `Module.Free` LinearAlgebra/FreeModule/Basic.lean:43; `Module.Flat` RingTheory/Flat/Basic.lean:113; `Module.FaithfullyFlat` RingTheory/Flat/FaithfullyFlat/Basic.lean:63 (extends `Module.Flat`); `Module.annihilator` RingTheory/Ideal/Maps.lean:868; `Module.support` RingTheory/Support.lean:47; `MvPowerSeries` RingTheory/MvPowerSeries/Basic.lean:86; `PowerSeries` RingTheory/PowerSeries/Basic.lean:56; `Matrix.GeneralLinearGroup` LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:42; `Nat.Prime` Data/Nat/Prime/Defs.lean:42; `Representation` RepresentationTheory/Basic.lean:48; `WittVector` RingTheory/WittVector/Defs.lean:52; `Submodule.spanFinrank` Algebra/Module/SpanRank.lean:66. For the duplication check I also opened `LinearMap.eqLocus` (Algebra/Module/Submodule/EqLocus.lean:45) and `RingHom.pullback` (RingTheory/LocalRing/Pullback.lean:53). Mathlib has no module fibre product or support-rank predicate, so `modulePullback`, a kernel of a difference of maps, and `FreeRankOnSupport` are thin definitions on native carriers. Tau Ceti (a91d3aaf): `TauCeti.completedGroupAlgebra` TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145; `completedGroupAlgebraModule` …/CompletedGroupAlgebra/Module.lean:344. Neither library has Hamann's theorem.

**Cross-roadmap citations resolved.** I resolved 129 citations, each against its supplier's main or open head; `roadmaps resolve` also finds none missing.
- HilbertModularVarietiesAndShimuraCurves §§R18.1.1, 1.3, 1.4, R18.3.1, 3.3, 3.9, 3.14, 3.15, R18.4.1, 4.2, 4.5, 4.6, 4.8, 4.10, 4.14–4.16, 4.21, 4.24, 4.25, 4.27: 21, at head 893083d. Contents were read for 1.4, 3.14, 3.15, 4.6, 4.8, 4.16, 4.24 and 4.27.
- CompletedCohomologyPartII §§F.1, 1.1–1.3, 2.4, 3.1, 3.2, 3.7, 5.5, 8.4, 8.8, 8.10, 8.12–8.15: 16, at 92dc4a1.
- DeformationAndDerivedPatchingAlgebra §§1.6, 1.10–1.12, 3.1–3.4, 3.11, 3.12, 5.6, 6.1, 6.2, 7.2, 7.3, 8.1–8.5: 21, at a3b5dea.
- LocalGaloisDeformationRings §§1.1, 1.4, 1.10, 1.24, 3.1, 3.4, 3.9, 3.10: 8, at 11b2c65.
- GlobalGaloisDeformations §§3.3–3.7, 5.1, 5.7, 5.8: 8, at b0adf32.
- NoncommutativeAndEquivariantIwasawa §§0.1–0.4, F.1, 0.10, 0.11: 7, at 3ec4ff3.
- SmoothRepresentationsOfLocalGroups SR.0.1–SR.0.4: 4.
- AutomorphicGaloisRepresentations §§4.3, 6.10–6.12: 4, at 81e9d0f (see R03).
- FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.26, R07.5.15: 2.
- On main: PadicMeasuresIwasawaAlgebras §§1.1–1.7, 5.2 (8) and Chebotarev Layer 10 (1).
- Design nodes on the board: ModpRepresentationsOfGL2OverLocalFields MP.3–MP.9 (18 nodes), LocalGaloisDeformationRingsPartII T.0, T.4, T.6, T.7 (10 nodes) and PotentialAutomorphyInfrastructurePartII PL.1/potentially-barsotti-tate-diagonalizable (statement read: l>2, any finite K).

**Duplication and ownership by object.** I searched main 6bddefd and all 338 open roadmap heads (`roadmaps grep`, index 2026-10-24T09:45:49Z), plus the board's packages and designs. The objects searched were Hamann/power invariance, BDJ weight sets, Gee–Kisin and Breuil–Mézard, Gelfand–Kirillov dimension, Gee–Newton CM and miracle flatness, and patched modules with a GL₂(F_v) action.
- The only conflict found is Hamann's cancellation (R02).
- §0.2's BDJ set overlaps ModpRepresentationsOfGL2OverLocalFields MP.3/tame-weight-set only for tame ρ. The README imports that set and states the comparison; this roadmap owns the general set, including nonsplit ρ, because nonsplit r̄_w at w ∈ S_p∖{v} need it.
- DeformationAndDerivedPatchingAlgebra §3.3 has commutative miracle flatness. §2.6 is the noncommutative Iwasawa version, a different statement.
- CompletedCohomologyAndLocalGlobalCompatibility uses Pan's GK argument, not BHHMS's.
- No other roadmap states GN22 Appendix A or BHHMS §8.

**Shape and house style.** The README has the upstream headings in order. Every layer ends with Examples and Dependencies. Every definition (§§0.1–0.3, 0.5, 1.2–1.5, 1.7, 2.1–2.3, 4.1, 5.6) has an API list and at least three Checks. There are no LaTeX delimiters and no process words apart from R07. The README and Lean names agree.

## Not verifiable

- Published versions (Invent. Math. 234 and 200, J. Inst. Math. Jussieu 21, Forum Math. Pi 2, Compos. Math. 157, Algebra Number Theory 13, Duke 155, Camb. J. Math. 4) are paywalled and were not fetched. Every locator was checked against the arXiv version recorded in `sources.toml`, assuming the published numbering agrees. This bears on the GN22 "Proposition A.30" versus "Corollary A.30" numbering.
- The following works are named in the README only through the primary sources, are not in the manifest, and were not read: Breuil–Diamond (Theorems 3.2.2 and 3.7.1, Lemme 3.6.2), Darmon–Diamond–Taylor Lemma 4.11, Kisin's condition (2.1.2), Carayol Théorème 4, Hu–Wang Lemma 8.11, Breuil–Paškūnas Lemma 14.1, Gee–Liu–Savitt, Breuil–Mézard Théorème 2.1.1.4, Emerton–Gee–Herzig Proposition 2.4.1 and Venjakob. I checked only that the primary source cites them as the README says: BHHMS23 lines 4352–4354, 4452–4461, 4712, 5065, 5210; EGS15 lines 1686, 1695, 1777; GN22 lines 1994–2000.
- The ModpRepresentationsOfGL2OverLocalFields, LocalGaloisDeformationRingsPartII and PotentialAutomorphyInfrastructurePartII suppliers are designs, not packages. I checked that their nodes exist and what they state, not their routes.
- I did not fetch any new source, so `needs-references.toml` was not needed.

## Source issues

- **Misprint** in BHHMS23 at proof of Proposition 8.3.7, p. 100: the source says the space of K-maps from σ_v to π has dimension f, citing Proposition 8.2.3; it should be r, the rank in Proposition 8.2.3(i), via (68); affects the proof.
- **Misprint** in BHHMS23 at proof of Theorem 8.3.9, p. 102: the source says the bijection ι is defined on types with σ_v twisted by the positive norm-determinant character; it should use the inverse twist, as in the defining intersection and on p. 101; affects nothing.
- **Error** in BHHMS23 at Theorem 8.3.9, p. 101, and Corollary 8.3.10, p. 103: the source says the support of M∞(L_j) (resp. M∞(R)) runs over all profiles with (2,−1) at several embeddings; it should run over (1,0) and profiles with exactly one (2,−1), as (76) and the proof's λ(j′) give; affects a stated result.
- **Gap** in BHHMS23 at proof of Proposition 8.3.7, p. 101: the source says π^{K₁} equals D₀(r̄_v^∨)^{⊕r} by the proof of Proposition 8.2.6; that proof gives only an embedding, and the reverse is Breuil's Lemma 9.2 argument in Theorem 8.4.1(i); affects nothing.
- **Misprint** in BHHMS23 at §1.2, p. 4, and proof of Theorem 8.4.3, p. 106: the source says miracle flatness is Gee–Newton's Corollary A.30; it should be Proposition A.30 of GN22 (arXiv v5); affects nothing.
- **Misprint** in BHHMS23 at Theorem 1.8, p. 8: the source says the theorem is Corollary 8.3.9; it should be Theorem 8.3.9; affects nothing.
- **Error** in EGS15 at §6.2, p. 35: the source says the finite adèles act through the character induced by ψ composed with Artin; it should be ψ⁻¹, for compatibility with det τ = ψ on inertia; affects a stated result; corrected in print at BHHMS23 Remark 8.1.3(i), p. 89.
- **Gap** in EGS15 at §6.2, p. 35: the source says S(σ) is the H¹ of the Shimura curve X_K with the extended central action; it should use the quotient of X_K by the finite group K(𝔸_F^∞)^×/KF^×; affects the proof; corrected in print at BHHMS23 Remark 8.1.3(iii), p. 89.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b299520", "job": "REV-PKG-HilbertModularVarietiesAndShimuraCurvesPartII", "model": "opus", "worker": "fable-rev57"} -->
