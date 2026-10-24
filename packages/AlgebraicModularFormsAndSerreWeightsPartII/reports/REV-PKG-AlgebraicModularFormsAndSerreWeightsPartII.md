<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1087#issuecomment-6380786029 -->
Review (claude) of 6c5e47e

Verdict: needs changes

1. **F01** (P1) Six declared gaps have supplier `none`

   **Location.** `design/plan.json`, top-level `gaps`, entries 1–6: `genus-two-reduction-local-model-comparison`, `global-secondary-square-root-descent`, `secondary-minimal-descent-comparison`, `integral-residual-v2-cosets`, `full-frame-klingen-coefficient-comparison`, `tame-reverse-neighbor-identification`. The README never names these slugs.

   **Claim.** These are declared supplier gaps, but none has a supplier. The brief counts a gap whose supplier is `none` as unowned (P1).

   **Witness.** Each of the six entries has `supplier` and `section` null. In substance the README takes the work over:
   - G1 in §2.2 (line 255: "this genus-two comparison is part of this theorem"), §3.5 and §7.1;
   - G2 in §3.7;
   - G3 in §4.4;
   - G4 in §5.6;
   - G5 in §9.4.

   G6 is needed by no target: §6.3 proves only the oriented relation, and line 1303 already hands the symmetric identification to consumers. Two of these take-overs are obligations rather than statements:
   - line 450 says "prove the specified tame-level descent", but no level or field is specified;
   - line 732 says "The finite-coset calculation must show it preserves the integral formal lattice", which is an instruction, not a statement.

   **Repair.**
   1. State each obligation as a theorem of its owning section, with hypotheses and locator.
      - §3.7: give the exact field and level at which b exists. The only consumer, §8.5 (line 1134), needs b over an algebraic closure at the fixed neat level. P20 line 1652–1655 asserts the root without proof; record that.
      - §5.6: replace the "must show" sentence with the theorem "the rational residual V₂ is the scalar extension of a finite O-linear coefficient operator, natural in the coefficient module".
   2. Remove the six supplier-`none` entries from the plan's top-level `gaps` list. That list is the part of the plan the package stage may edit. G6 then lives only in Downstream consumers (line 1303).

   If the board does not allow removing design-stage entries, the plan half of this repair is "not actionable in this package", and a human closes the entries. The README half is actionable now.

2. **F02** (P2) `gap:siegel-parahoric-models` asks for models already supplied, and spherical-only targets depend on it

   **Location.** README line 73: "Provide the spherical, Klingen and paramodular genus-two toroidal and minimal models … and coefficient-sensitive refinement and boundary comparisons …". The gap is cited by:
   - §1.1 Needs (line 138, twice);
   - Layer 1 Dependencies (line 218, twice);
   - §4.1 Needs (line 528);
   - §4.4 Needs (line 591).

   **Claim.** The gap is not minimal, and it makes spherical-level targets conditional on parahoric models they never use.

   **Witness.** ShimuraCompactifications §C5.3 ("Integral toroidal compactifications", smooth, at good primes, PEL type C) and §C5.16 ("The integral minimal compactification") are the spherical models. Its §§C3.8–C3.9 are the refinement comparisons. README line 71 itself cites all of these as supplied. §1.1 works at "hyperspecial level at p" (line 115); §4.1 and §4.4 use only the spherical minimal model.

   ShimuraCompactifications also states that "Moduli interpretations of the normalized models at parahoric level are not used and are not constructed here" (scope paragraph). So the Klingen and paramodular part is a genuinely new request to that supplier.

   **Repair.**
   - Restrict the `needs` to what is missing:
     - the Klingen and paramodular models of P20 Theorem 6.1.5.1 (flat, normal, lci; P20 line 1290–1292);
     - the isogeny chain G→G′→G over X_Kli(p) (P20 line 1702–1704);
     - the integral compactified correspondence of P20 §14.9.2 (P20 line 4738–4752).
   - Cite §§C5.3, C5.16 and C3.8–C3.9 for the spherical models and refinements.
   - Repoint §1.1, Layer 1 Dependencies, §4.1 and §4.4 to §§C5.3, C5.16, C5.17 and C5.23 without the gap.

   Tested on the witness: after the change, §1.1's Needs names only supplied sections, and Layers 2, 3, 7 and 8 keep the gap where paramodular or Klingen models occur (§§2.1–2.3, 3.5–3.6, 7.1–7.5).

3. **F03** (P3) Needs lines carry gaps their targets do not use

   **Location and witness.**
   - `gaps:siegel-rank-one-deformations,siegel-isogeny-trace-ideals,siegel-logarithmic-de-rham` is cited as one block by §2.2 (line 265), §2.3 (line 283), §8.2 (line 1084) and §8.4 (line 1128). The trace ideals of the degree-p³/degree-p and Lagrangian isogeny charts enter only §7.2 (line 902) and §7.5 (line 974). §2.3 uses only the rank-one chart, and §§8.2 and 8.4 only the de Rham and superspecial inputs.
   - §7.4 (line 947), Hartogs across Z_red, cites `gap:lci-fundamental-class`, but the statement and its route (lines 933–937) use only depth, local cohomology, formal functions and the Milnor sequence.
   - Entries are duplicated ("ShimuraCompactifications §C5 (gap:siegel-parahoric-models)" twice) at lines 138, 218, 974 and 1027.
   - Dependencies lines read "Layers 1 ;", "Layers 2 ;", and so on, with a dangling space-semicolon, at lines 309, 499, 599, 790, 864, 1027, 1190 and 1299.

   **Repair.** List per target only the gaps its statement or route uses. Delete the duplicates. Write "Layers 1–2; …".

4. **F04** (P3) `standardSL2` restates a pinned Tau Ceti carrier and has no Checks list

   **Location.** `Suggested.lean` lines 51–57; README §8.3, line 1092: "Define the standard representation `standardSL2` by extending the entries of g∈SL₂(𝔽_p) …".

   **Claim.** The definition is a composite of pinned declarations that the README does not cite. As a definition it also needs three discriminating Checks, which it lacks.

   **Witness.** `TauCeti.stdSLRep` is at TauCeti/RepresentationTheory/ClassicalGroups/Restriction.lean:44. At the pins, `standardSL2 p k = (TauCeti.stdSLRep k 2).comp (Matrix.SpecialLinearGroup.map (ZMod.castHom (dvd_refl p) k))` is proved by `ext g v i; simp [standardSL2, Matrix.SpecialLinearGroup.toLin'_apply]`, elaborated in a scratch file. The unipotent values at line 1092 are prose; §8.3's Checks list tests only irreducibility.

   **Repair.**
   - Define `standardSL2 p k := (TauCeti.stdSLRep k 2).comp (Matrix.SpecialLinearGroup.map (ZMod.castHom (dvd_refl p) k))`. Drop the unused `[Fact p.Prime]` binder from the def.
   - Add `import TauCeti.RepresentationTheory.ClassicalGroups.Restriction` and cite `TauCeti.stdSLRep` under "From Tau Ceti". This exact replacement, with the theorem unchanged, elaborates at the pins with only the `sorry` warning.
   - Move the column-convention values into a Checks list for the definition, including the wrong model: under the transposed (row) action the upper unipotent sends x to x+y and fixes y, while the column action fixes x and sends y to x+y.

5. **F05** (P3) Binary quadratic forms: the pinned carrier is not cited and the convention clash is not pinned

   **Location.** §1.2, lines 142–163. Its API restates "Δ(m,r,n)=r²−4mn" and "Δ(M·Q)=Δ(Q)". Supplier contracts lines 35–39 cite only `Matrix.det` and `Matrix.det_mul`.

   **Witness.**
   - Tau Ceti has `TauCeti.BinaryQuadraticForm` (TauCeti/NumberTheory/BinaryQuadraticForm/Basic.lean:94), `.discrim` (line 146), the `SL(2,R)` action (line 194) and `discrim_smul` (line 203).
   - Its action is γ•f = f∘γ⁻¹. Line 236 checks T•⟨1,0,0⟩ = ⟨1,−2,1⟩, so T•x² = x²−2xy+y² for T=[[1,1],[0,1]].
   - The roadmap's normalized action, from CG20 line 2231, gives T·x² = (det T)⁻¹·T·diag(1,0)·Tᵗ = x².

   **Repair.**
   - Cite the Tau Ceti carrier and `discrim_smul` under "From Tau Ceti" for the discriminant and its SL₂-invariance.
   - Keep the det-normalized GL₂(ℚ) action as this roadmap's own, and say how it differs: rational denominators, det normalization, transpose convention.
   - Add a Check: for M ∈ SL₂(ℤ), M·Q equals Tau Ceti's (Mᵗ)⁻¹•Q; at M=T, M·x² = x² while T•x² = x²−2xy+y².

6. **F06** (P3) §9.4 cites the wrong place for the normalization p^(3−r)U_(Kli(p),1)

   **Location.** Line 1277: "Its comparison interface records the rational normalization p^(3−r)U_(Kli(p),1) … (… P20, §13.3.1, p. 89; P20 line 4070)".

   **Witness.** P20 p.89 (P20 line 4094–4099) says only that U preserves integral q-expansions. The normalization is stated at the start of P20 §10, p.57 (P20 line 2613–2617).

   **Repair.** Add "P20, §10, p. 57; P20 line 2616" at the normalization. Keep §13.3.1 for integrality.

7. **F07** (P3) §2.4's Hilbert comparison has no map, no locator and no consumer

   **Location.** Line 287: "The determinant Hasse ideal used on an integral Hilbert modular chart is locally (p,h) …". Also supplier contract line 95 and the Needs entry at line 301.

   **Witness.**
   - The cited locators say nothing about Hilbert charts: Y16 Proposition 3.11(2) (Y16 line 1192–1197), CG20 Lemma 6.2(1) (CG20 line 1442–1448), and CG20 proof of Lemma 7.4 (CG20 line 1898–1909).
   - No morphism from a Hilbert modular chart to X is named, so "(p,h)" on the Hilbert chart has no meaning as written.
   - No target of the README uses the sentence; it occurs only at lines 95, 287 and 301.

   **Repair.** Delete the sentence, the HilbertModularVarietiesAndShimuraCurves contract (lines 93–95) and its Needs entry. Alternatively, name the Hilbert–Siegel morphism with its hypotheses and cite a source for the pullback identity.

8. **F08** (P3) Statement and Check slips

   1. **§1.2 Check, line 161.** "The normalized action of M=diag(2,1) … det M<0 reverses the semidefinite cone." diag(2,1) has det 2>0, so the negative-determinant clause has no witness. Use M=diag(1,−1): M·(x²+y²) = −x²−y², with Δ = −4 preserved, outside the semidefinite cone.
   2. **§1.3, line 169.** "For L=1 the ambient series module embeds in (O′⊗M)[ζ,ζ⁻¹][[q,q′]]" contradicts the coefficients a_c(F,Q)∈Sym^(j−k)(O′²)⊗M stated earlier on the same line. At weight (k+1,k) the coefficients have rank 2. Write (Sym^(j−k)(O′²)⊗M)[ζ,ζ⁻¹][[q,q′]].
   3. **§7.6 line 986 and §7.7 line 1005.** "Their expansions are exactly the Layer 5 formulas" and "Q₂ reduces to Z₂" use X₂, which §5.4 defines only for odd p (line 687). Add "p odd" to the Q₂ expansion and congruence statements. The integral construction via C_r (§7.5) needs no parity hypothesis.
   4. **§8.1 line 1033, §8.2 line 1060, §8.4 line 1114.** All require p>d+2. The normalization 2d(d+1) is already a unit for odd p>d+1. Y16 Theorem 4.9 needs only p>r, and Y16 line 1296–1302 defines θ₁ for r=p−2 and r=p−1. Either extend to p>d+1, the range in which con_d is defined, or record the narrower range as a scope choice with that reason.

9. **F09** (P3) Supplier contracts attribute this roadmap's statements to suppliers

   1. **Line 59.** "Layer 2 supplies … the correspondence between index-p lattices and ℙ¹(𝔽_p), including the full-group p+1 count." ModularForms Layer 2 (ModularForms README lines 383–480) states the Hecke ring, finite coset decompositions, the degree map and elementary divisors, but not the ℙ¹(𝔽_p) bijection. This roadmap's §5.2 states that bijection as its own API (line 641). Repoint the contract to what Layer 2 states, and say §5.2 owns the ℙ¹(𝔽_p) parametrization.
   2. **Lines 59 and 63.** "§5.2 identifies …" under "From TauCetiRoadmap.ModularForms" and "§6.2 transports …" under "From TauCetiRoadmap.ClassicalArithmeticCompletion" read as supplier sections. ClassicalArithmeticCompletion §6.2 is "Salem numbers" (its README line 12000), and ModularForms has no §5.2. Write "this roadmap's §5.2" and "this roadmap's §6.2".
   3. **§9.2, line 1223.** "the tower's component-detection hypothesis, supplied by HodgeTateAndCanonicalSubgroups §§5.1–5.2". Those sections are Hilbert-only: the torsor group is (𝒪_F/p^m)^×, HodgeTate §5.1 Check `igusaTorsor_not_fullLevel`. Write "requested by gap:siegel-igusa-full-frames", which the Needs line at 1246 already cites.

10. **F10** (P3) The frame-change route in §§8.3–8.4 must keep the Koblitz normalization

   **Location.**
   - Line 1088: "an SL₂(F_p) change of local frame can make its chosen extreme coefficient nonzero";
   - line 1114: "by choosing a local SL₂(F_p) frame in which the coefficient F₂ is nonzero";
   - the route at line 1118.

   **Witness.**
   - Y16's local formula at a superspecial point (Y16 line 2059–2068, and (4.5) at line 2126) uses the Hasse matrix A ≡ (t_ij), which holds in bases normalized by Koblitz Lemma 13 and its corollary (K75 line 1676–1700).
   - A change of basis C preserves that normalization iff C^(p)·Cᵗ = I.
   - For C=[[1,1],[0,1]] ∈ SL₂(𝔽_p), C^(p)·Cᵗ = [[2,1],[1,1]] ≠ I. So the formula does not apply in the new frame.

   **Repair.** In the route, use the group {C : C^(p)Cᵗ = I}. This is a unitary group over 𝔽_(p²), and its special subgroup is an 𝔽_(p²)-form of SL₂(𝔽_p), so §8.3's irreducibility applies after extending to 𝔽_(p²). Alternatively, recompute (4.5) in an arbitrary frame. The statements of §§8.4 and 8.7 are unaffected.

11. **F11** (P3) Process wording

   - Line 653: "The source typo replacing M⁻¹·Q by an unnormalized matrix product is not adopted."
   - Line 1315: "the other numerical conditions from the uncorrected injectivity statement".

   Source corrections belong in the errata register (recorded below), not in the README. Delete the first sentence. Rephrase the second as "satisfies p∤k(2k−1) and k≤p+1".

Files reviewed: `packages/AlgebraicModularFormsAndSerreWeightsPartII/README.md` (1336 lines), `Suggested.lean` (66 lines), `metadata.toml`, `sources.toml`, with `design/plan.json` read for the declared gaps. All seven recorded sources were readable in the sources cache and every sampled locator was opened. Findings: 11 (1 P1, 1 P2, 9 P3).

## Adversarial pass

Every row records the values computed on both sides.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: normalized action M·Q=(det M)⁻¹MQMᵗ preserves Δ | M=diag(2,1), Q=x²+y²; M=diag(1,−1) | det(MQMᵗ)/det(M)² = det Q, so Δ stays −4; diag(2,1)·Q = 2x²+½y²; diag(1,−1)·Q = −x²−y² | true; cone preserved only for det>0 | R08.1 (Check) |
| Conventions: action law M·(N·Q)=(MN)·Q | general | (det M)⁻¹(det N)⁻¹ MNQNᵗMᵗ = (det MN)⁻¹(MN)Q(MN)ᵗ | true | none |
| Conventions vs Tau Ceti binary forms | T=[[1,1],[0,1]], Q=x² | roadmap T·x² = x²; Tau Ceti T•x² = x²−2xy+y² | conventions differ | R05 |
| §1.1 injective cusp-to-form map for every M | 0→I_D→O→O_D→0 with O_D O-flat; chart O[t]/(t) | Tor₁(O_D,M)=0, so I_D⊗M ↪ O⊗M; t·(O/ϖ²)[t] ↪ (O/ϖ²)[t] | true | none |
| §1.1 reduction sequence | E₀ locally free, ×ϖ^m | 0→H⁰/ϖ^m→H⁰(E₀/ϖ^m)→H¹[ϖ^m]→0 from the multiplication sequence | true | none |
| §1.2 Δ=−4det Q; primitivity is coefficientwise | x²; x²+y² at p=3 | Δ(x²)=0, x² primitive; (−4/3)=−1, (1/3)=1 | true | none |
| §1.3 support and lower exponent | m=n=1; m=n=N | r² ≤ 4mn gives r∈{−2,…,2}; lower bound −2N | true | R08.2 (ambient module) |
| §1.3 example x²−xy+y² | Q=(1,−1,1) | Δ=1−4=−3, monomial qζ⁻¹q′ | true | none |
| §1.4 one cusp per component, saturation | X₁⊔X₂, section (0,1); 1/ϖ | expansions (0,1); coefficient 1/ϖ ∉ O | true; matches T06 Prop. 3.2 (T06 line 1214) | none |
| §2.1 inclusive strata; rank 1 boundary | torus rank 1 with supersingular elliptic part | multiplicative rank 1+0 = 1, so in S, not in Z_red | true (P20 p.35 misprints "less than"; source issue) | none |
| §2.2 dimensions r+1 | p=3 | 1, 2, 3; P20 line 1536 says 3−r, which gives ordinary dimension 1 | README correct | source issue |
| §2.2 P¹ components and degrees | p=3: E\|C = O(−1)⊕O(3) | λ degree 2 = p−1; SS points 10 = p²+1; max degree of ω(a,b) = p(a−b)+b(p−1) = pa−b | true (CG20 line 2443–2446, 2477) | none |
| §2.3 Frobenius sign and pairing | ⟨e₁,e₄⟩=⟨e₂,e₃⟩=1 (P20 J, line 846) | README Fe₂=−pe₃ gives ⟨Fe₂,Fe₃⟩=p; source Fe₂=pe₃ gives −p; quotient matrix [[−Y,0],[−Z,1]], det −Y; isotropy Z−X=0 | README correct | source issue |
| §2.4 h expansion 1, nonzerodivisor | Mumford torus; μ_p⊕I₁,₁⊕ℤ/p | Hasse matrix I₂, det 1; mixed fibre rank 1, det 0 | true (Y16 line 1195–1197) | R07 (Hilbert sentence) |
| §3.1 weights of h′ | p=3 | Ha(Gᵐ)^(p+1): (p−1)(p+1) = 8; height 4 to 3 after deleting ℤ/p | true (P20 line 1360–1364) | none |
| §3.2 duality LF^(p+1) | p odd, quasi-polarized point | LF∘λ* = id on (p²−1)-th powers (P20 Lemma 6.3.1.1, 6.3.2.1) | true | none |
| §3.3 Z an isomorphism; orders of V_H*, W | DVR, V*=[[0,1],[0,t]] | ord V_H* = ord W = 1, ord Z = 0; im V* = ω^(p), ker = im F*, so the quotient map is an isomorphism | true | none |
| §3.3 V_H* zero set is multiplicative rank 0 | multiplicative rank 1, étale rank 0 | H = μ_p, V_H* a unit; P20 Lemma 6.3.3.3 claims vanishing on all of S∖S′ | README correct | source issue |
| §3.4 extension exponent | V_H*=W=t, Z=1 | ord A = (p+1)·1+(p−1)(0−1) = 2; t⁻¹ has square t⁻², not regular | true | none |
| §3.5 local rings | R=F_p[x,y,a,b,c]/(xy,ax+by+abc) | R/(a,y,x+bc) ≅ F_p[b,c]; R/(x,y+ac) ≅ F_p[a,b,c]: both relations vanish (b(−ac)+abc=0); union F_p[a,b,c]/(ab) | true (P20 line 1623, 1642–1649) | none |
| §3.6 gluing on nodal chart | branch values a², b²; 1, 0 | a²+b² restricts to 0 on a=b=0 on both branches; 1 ≠ 0 there, so no gluing | true | none |
| §3.7 root b, b²=h′ | p=3; p=2 | weight 4 vs 8; p=2 gives 3/2; DVR b=t gives lengths 1, 2 | asserted by P20 line 1652–1655 without proof | R01 (state level and field) |
| §3.8 normalized pullback | [p] on μ_(p∞); [p] on μ_(p∞)² | p⁻¹·p = 1; p⁻²·p² = 1; kernels inside G[p], H_x = 0 | true (P20 Lemma 6.3.4.1–6.3.4.2) | none |
| §4.1 lift A ≡ h^r | expansion | FE(A) ≡ 1 mod ϖ (T06 line 1309–1312) | true | none |
| §4.2 canonical powers | p=3, 1 vs 4; ϖ²=3, m=2; p=2 | 64−1 = 63 = 7·9; (1+ϖ)³−1 has ϖ-order 3 ≥ 2; 3²−1 = 8 ≡ 0 mod 4 | true | none |
| §4.3 shift t=rs(p−1) | p=3, m=2, r=1, s=3 | t=6, s divisible by p^(m−1)=3; 1+ϖ has inverse 1−ϖ mod ϖ² | true (CG20 Lemma 6.4, line 1467–1479) | none |
| §4.4 two affine opens | p=3, N=1 | weights 2·4 = 8 = N(p²−1); ordinary (1,·), rank 1 (0,1), rank 0 (0,0) | true (P20 line 4612–4616) | none |
| §5.1 formal series need no coefficient algebra | K/O, class 1/p+O | p·(1/p) ∈ O, so killed by p; orbit indicator has a(0)=0 | true | none |
| §5.1 ρ₁(diag(p,1)) | x, y | px, y; with an extra det twist: p²x, py | true | none |
| §5.2 cosets and integrality | p=3; Q = 0, x², x²+y² | admissible counts 4, 1, 0; diag(1,p)⁻¹·(n,r,m) = (pn,r,m/p) | true | none |
| §5.3 d=0 formula | coset [[p,a],[0,1]] | M⁻¹·Q = ((n−ar+a²m)/p, r−2am, pm), equal to CG20 line 2335 up to a↦−a | true | none |
| §5.3 UV=1, UZ₂=Z₂U, Z₂=UZ | coefficient level | both sides a(F,p²M⁻¹·Q); a(UZF,Q) = Σρ(M)a(F,M⁻¹·pQ) | true | none |
| §5.3 constant series | expansion of 1 at p=3 | U=V=1; Z=Z₂=4 | true | none |
| §5.4 X₂ multiplier, U₂=−1+pX₂ | p=3: x²+y², 3(x²+y²), x² | (X₂,U₂) = (−1,−4), (3,8), (0,−1); mod 3 (2,2), (0,2), (0,2); U₂ = p·N(Q)−(p+1) with N(Q) = 1+(Δ/p), so Δ is the right symbol | true | source issue (det vs Δ) |
| §5.5 Z₂X₂=0 mod p | M=diag(3,1), Q=x²+y² | M⁻¹·3Q = x²+9y², Δ=−36 ≡ 0 mod 3, not 0 over ℚ | true | source issue (det R=0) |
| §5.6 T and T₂ decompositions | (3,3); (2,2); p=3 | T₂ = −1+3X₂+Z₂+27V₂; S = p^(j+k−6) = p⁻² at (2,2); T ≡ U+Z at k=2 since p^(j−1)V ≡ 0 | matches CG20 Lemmas 8.3–8.4, Remark 5.12 | none |
| §5.7 Q₂ cancellation | general (j,k); (2,2); (3,3) | p^(3−k)T₂ + (1+p²)p^(j−3) = p^(j−2)X₂ + Z₂ + p^(j+k−3)V₂ + p^(j−1); tuples (1,1,3,3), (3,1,27,9) | true; matches CG20 line 2513–2521 | none |
| §6.1–6.2 neighbor counts | p=5, x²+y²; p=3, xy | zeros [2:1], [3:1]; class number of −4 is 1, so multiset {[Q],[Q]}; Δ(xy)=1 gives 2 | true | none |
| §6.3 orientation at Γ(5) | M=[[3,5],[30,51]], Q=x² | det 3; M = [[1,5],[10,51]]·diag(3,1); M⁻¹·Q = 3(17x−10y)² ≡ (2,0,0) mod 5; second step (4,0,0) ≠ (1,0,0) | README correct; CG20 Lemma 8.20 needs Γ̄=SL₂(ℤ) | source issue |
| §7.1 kernel counts | p=3, ordinary | 1+(p+1)+1 = 6 geometric points; (p+1)(p²+1) = 40 Lagrangians in characteristic 0 | true | none |
| §7.2 divisibility | (d,r) = (0,2), (1,3), (0,1) | 4,3,3; 7,4,3; mixed order 1+1 = 2 < 3 at r=1 | true for r≥2 (P20 line 4761–4765 at r=2) | none |
| §7.3 normalized T and its expansion | p=3, d=0, r=2 | 3⁴/3³ = 3, 3³/3³ = 1, 3³/3³ = 1; expansion U+p^(r−2)Z+p^(d+2r−3)V = §5.6 with j=d+r | true | none |
| §7.4 Hartogs | k[x,y] punctured; k[t] | sections k[x,y]; H²_(x,y) ∋ 1/(xy) ≠ 0; k[t,t⁻¹] ≠ k[t] | true (P20 line 4712–4718) | none |
| §7.5 C_r and Q₂ | general; p=3 | C_r−Q₂ = p^(3−k)(p+p³)p^(j+k−6) = (1+p²)p^(j−2); 10 ≡ 1, 30 ≡ 0; first-map orders r+2 vs d+2r (≥ r+2 iff d+r ≥ 2) | true (P20 line 1689, 1721, 1785) | none |
| §7.6–7.7 mod p behavior | p=3, (2,2) at Q=0; (3,3) | X₂=3, Z₂=4, so Q₂ ≡ 1; T₂ ≡ Z₂−1 vs Q₂ ≡ Z₂ | true for odd p | R08.3 |
| §8.1 contraction | d=2; general d | con₂(x²⊗y²) = 4/12 = 1/3; highest-weight sum 2d(d−1)+4(d−1)+4 = 2d(d+1) | true | R08.4 (range) |
| §8.2 vector θ₁ has no det(Q) | Y16 Fourier computation | A_G(T) = (1/N)Σ A_(F_n)(T)δ_n⊗T (Y16 line 1323–1327); CG20 line 2417 has det(Q)·con | README correct | source issue |
| §8.2 scalar Θ multiplier | p=7, Q=x²+y² | det Q = 1; Δ ≡ 3 mod 7 | true (Y16 line 1401) | none |
| §8.3 irreducibility, d≤p−1 | p=3, d=2, 3; p=2, d=1; one-tactic probe | binomials 1,2,1 nonzero; span{x³,y³} invariant at d=p; no ℙ¹(𝔽₂) line fixed; `infer_instance`, `simp`, `rfl`, `exact inferInstance`, `aesop` all fail | true; not padding | R04, R10 |
| §8.4 nonvanishing | p=7, k=2; p=11, (6,2) | 6·(1/9) ≡ 6·4 ≡ 3 mod 7; j−3k = 0, j−3 = 3 | true (Y16 line 2087, 2140) | R10 (route) |
| §8.5 negative weight | p=5, (−1,−1); p=7 | O(−4) has no sections; root weight 24, steps 144 and 36 | true | none |
| §8.6 scalar injectivity | p=5, k∈{2,…,6} | allowed {2,6}; k=4 gives Θh=0 with h≠0; 24 < 26 | README correct; CG20 Thm 8.10 includes k=p−1 | source issue |
| §8.7 vector injectivity | p=7, j=4,5; p=11, j=6 | degrees 26, 33 < 50; after division by h, (−4,−8), pa−b = −36 | true | none |
| §9.1 weight character | d=2, r=1 at diag(2,1); p=3 | 2³ = 8 vs reversed 2; \|GL₂(𝔽₃)\| = 48, diagonal 4; −κ′ = t₁^j t₂^k (P12 line 66–78) | true | none |
| §9.2–9.3 saturation, finite-level caveat | f=1/3; x³y−xy³ at p=3 | non-integral on all 48 frames; vanishes on 𝔽₃², value −24 at (1,3) | true (T06 line 1276–1278) | none |
| §9.4 Z₂ vs U₂ | constant series, p=3 | Z₂ = 4, U₂ at Q=0 = 8 | true | R06 (locator) |

## Duplication and ownership audit (by object)

- **Mathlib at the pin.** `Matrix.det` (Determinant/Basic.lean:63), `Matrix.det_mul` (:141), `legendreSym` (LegendreSymbol/Basic.lean:109), `Matrix.SpecialLinearGroup.toLin'` (:192) and `.map` (:225), `LinearEquiv.automorphismGroup.toLinearMapMonoidHom` (Module/Equiv/Basic.lean:111), `Representation.IsIrreducible` (RepresentationTheory/Irreducible.lean:29; an `abbrev` of `IsSimpleOrder` on subrepresentations, so it includes nontriviality), `ZMod.castHom` (Data/ZMod/Basic.lean:331), `Ideal.iInf_pow_smul_eq_bot_of_isLocalRing` (RingTheory/Filtration.lean:425; Noetherian local, finite module, proper ideal). All 9 cited Mathlib line numbers are correct.
- **Tau Ceti at the pin.**
  - `Representation.symmetricPower` (SymmetricPower.lean:47, coefficient ring in `Type`) and `Module.Basis.symmetricPower` (LinearAlgebra/SymmetricPower/Basis.lean:167): both cited line numbers correct.
  - Not cited: `TauCeti.stdSLRep` (R04) and `TauCeti.BinaryQuadraticForm` with `discrim_smul` (R05).
  - `TauCeti.SU2.isIrreducible_symPower` (SU2/Irreducible.lean:164) is the complex SU(2) theorem. `TauCeti.symPowerRep` (ClassicalGroups/SymmetricPower.lean:59) is GLₙ with no irreducibility. The characteristic-p SL₂(𝔽_p) theorem is new, and Tau Ceti has no transvectant, Siegel form or genus-two Hasse invariant.
- **Roadmaps.** `roadmaps grep` over main and 333 open heads finds no other owner of SL₂(𝔽_p) symmetric-power irreducibility, of the genus-two secondary Hasse invariant, or of the corrected Q₂.
  - The base roadmap (R15.1–R15.6) is genus-one only.
  - ClassicalArithmeticCompletion §1.17 owns the projective-zero count, and §6.2 imports it correctly.
  - The board design GSp4NonregularModularityLifting (merge order line 260, above this roadmap at 276) asks a placeholder "SiegelModularFormsModPn" for the secondary Hasse, theta and Q₂ APIs, and restates U, Z, Z₂, X₂ in weight (j,2) (its NR4.1–4.2). This roadmap is the general owner. This README has no edge to that package, so no cycle arises here; the board should note the ordering when that package cites this one.
- **Fully qualified names.** Neither `standardSL2` nor `smallSymmetricPower_irreducible` occurs in any other roadmap's Lean.

## Supplier-order audit

Dependency check output:

    depcheck: 30 roadmaps, 272 edges, 0 problem(s)

There are no UPWARD, CYCLE or moved lines. Every supplier precedes this roadmap (merge order line 276):

| Supplier | Merge order line | Sections resolved at |
|---|---|---|
| SchemeAndStackFoundations | 2 | main: §0.6 (README line 678), §§2.5–2.7, 2.19 (incl. `upperShriek_lci`), 2.20, 4.9 |
| AbelianSchemesAndArithmeticModuli | 49 | head: A4.3, A4.7, A4.9, A4.10, A4.11 |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | 56 | head: R07.2.2, R07.2.21 (Fargues LF), R07.2.22, R07.2.23 |
| AlgebraicModularFormsAndSerreWeights | 105 | head: R15.1–R15.6 |
| ClassicalArithmeticCompletion | 110 | main: §1.17 |
| HilbertModularVarietiesAndShimuraCurves | 177 | head: H2.7 |
| ShimuraCompactifications | 178 | head: C3.8, C3.9, C5.3, C5.4, C5.10, C5.12, C5.16–C5.20, C5.23 |
| AutomorphicBundles | 231 | head: B2.1, B3.2–B3.4, B3.10, B4.19, B4.20, B5.10, B5.11, B5.14, B5.15, B5.19 |
| HodgeTateAndCanonicalSubgroups | 234 | head: 0.12, 0.14–0.16, 5.1, 5.2 |
| OverconvergentAutomorphicForms | 237 | head: Layers 5–6, scope mention only |

ModularForms Layer 2 and AlgebraicVectorBundles §§L0A–L0C are on main.

Gap declarations:
- All 8 supplier gaps appear in both `plan.json` and the README, under the right supplier subsection.
- Precise and minimal: `siegel-rank-one-deformations`, `siegel-isogeny-trace-ideals`, `siegel-logarithmic-de-rham`, `open-formal-milnor`, `lci-fundamental-class` (SchemeAndStackFoundations §2.19 gives f^!O as an invertible object but no fundamental class), `reduced-section-propagation`, `siegel-igusa-full-frames` (HodgeTate §§5.1–5.2 are Hilbert-only).
- `siegel-parahoric-models` is not minimal (R02). The six supplier-`none` gaps are R01.
- `roadmaps resolve` finds no cross-roadmap citation or Lean name that resolves nowhere.

## Headline theorems and padding

Headlines in the README:
- §1.4 all-component integral expansion principle and saturation;
- §§2.2–2.3 rank geometry and simple Hasse zeros;
- §§3.6–3.7 secondary Hasse invariant and its root;
- §§4.3–4.4 torsion weight shifts and the two-affine cover;
- §§5.6–5.7 integral residual V₂ and Q₂;
- §6.3 oriented reciprocity;
- §§7.4–7.6 integral T and Q₂ with finite and K/O coefficients;
- §§8.2, 8.4–8.7 theta, nonvanishing, vanishing and injectivity;
- §§9.2–9.4 saturated expansions, classical comparison and Klingen comparison;
- §8.3 small symmetric-power irreducibility.

Each geometric headline is named in the module docstring of `Suggested.lean` with its missing carrier. The only statable one, §8.3, is stated. Formal statements that could be encoded (§§1.2, 5.3–5.5, 6.2) are lemma-level or imported (ClassicalArithmeticCompletion §1.17), so no statable headline is missing.

The one-tactic probe on `smallSymmetricPower_irreducible` failed with all five tactics, so it is not padding.

`#check @standardSL2` and `#check @smallSymmetricPower_irreducible`, elaborated together, show every binder in the declarations' own signatures (`p`, `[Fact p.Prime]`, `k : Type`, `[Field k]`, `[CharP k p]`, `d`, `hd : d ≤ p − 1`). The elaborated types match the README statement in §8.3 line 1088, and nothing changed. `hd` uses natural subtraction with p ≥ 2, so there is no junk value.

## Verified sound

- **Elaboration.** `lake env lean` on `packages/AlgebraicModularFormsAndSerreWeightsPartII/Suggested.lean`, run from the content checkout, gives exactly one warning: "declaration uses `sorry`" at 61:8.
- **Form.** Single `import Mathlib` plus one existing Tau Ceti module, which is used. No `set_option`, no sorry'd data, `theorem` only, docstrings on every declaration, a Layer 8 section comment.
- **House style.** No LaTeX delimiters. No pull-request numbers.
- **Sampled targets (15 of 15 verified at their locators).**
  - §1.1: CG20 §5.2 pp.21–22 (CG20 line 912–918); P20 §6.2.1 (P20 line 1309–1313).
  - §1.2: CG20 §8.2 (CG20 line 2220–2236); Definition 8.7 (line 2359).
  - §2.4: Y16 Proposition 3.11(2); CG20 Lemma 6.2(1); CG20 proof of Lemma 7.4.
  - §3.6: P20 Lemma 6.4.2 (P20 line 1609–1649); B15 Theorems 4.5.4(3) and 6.2.2, printed pp.122 and 188–189.
  - §3.7: P20 Remark 6.4.1 (line 1652–1655); K75 §11 p.193 (K75 line 1712–1728); CG20 proof of Thm 8.10 (line 2438–2446).
  - §4.1: CG20 Definition 6.1 (line 1435–1441); T06 p.810 (line 1309–1312).
  - §4.4: P20 proof of Lemma 14.8.2 (line 4612–4616); B15 Theorem 6.2.3 and Corollary 6.2.4, p.190.
  - §5.1: CG20 §8.2 (line 2237–2251).
  - §5.5: CG20 Lemma 8.6 (line 2354–2358).
  - §5.6: CG20 §5.5, Remarks 5.10 and 5.12 (line 1320–1388); Lemmas 8.3–8.4; P20 §5.1.3 (line 902–910).
  - §7.5: P20 §7, Lemmas 7.1.1–7.1.2 and the double-coset identity (line 1670–1690, 1721–1785).
  - §8.6: CG20 Theorem 8.10 (line 2425–2446); Y16 Theorem 4.7(2) (line 2055–2088).
  - §9.1: P12 Definition 4.3 and §1.1 conventions (line 60–82, 717–758); T06 §3.2.
  - §9.3: P12 §4.2.1 (line 788–797); T06 comparison square (line 1285–1308).
  - §9.4: T06 p.810 (line 1313–1314); CG20 Lemmas 8.3–8.4; P20 §13.3.1. One locator slip, R06.
  - In every sampled target the theorem numbers, pages, hypotheses and statements agree with the source. Where the README departs from a source, the departure is a correction confirmed below.
- **Further locators opened.**
  - CG20: Lemmas 6.4, 8.12, 8.20, 8.21; Proposition 8.9; Theorem 8.11; Definition 8.19.
  - P20: §6.3.1–6.3.4, §6.4, §10 introduction, §14.9.1–14.9.2, Lemma 14.9.2.
  - Y16: Propositions 3.9, 3.12, decomposition (3.31), Theorem 4.9.
  - K75: Lemma 13 and its corollary.
  - B15: Theorem 6.2.2.
  - T06: Propositions 3.2 and 3.3.
  - P12: Theorem 1.1.
- **Library declarations opened.** 11 cited plus 4 uncited, with file and line listed in the duplication audit.
- **Cross-roadmap citations.** 60 section citations resolved, all present where cited (supplier table above).
- **Adversarial pass.** 56 rows with computed values.
- **Gaps.** 7 of 8 supplier gaps precise and minimal.

## Not verifiable

- P20 was read in the author version of 17 June 2019. Its Duke revision was not compared, as the manifest records.
- Y16 was read at arXiv v5. The published numbering was not compared.
- CG20 was read in the author typeset copy. The journal page offset of +800 was checked at internal pp.21, 56 and 61 and is consistent.
- No text the package cites was unreadable. No further source was fetched, and `needs-references.toml` was not written.

## Source issues

- **Error** in CG20 at Theorem 8.10, internal p.61 (journal 861): the source allows every k≤p+1 with p∤k(2k−1), which includes k=p−1; it should exclude k=p−1, since the Hasse invariant is nonzero there with Θh=0; affects a stated result.
- **Error** in CG20 at Proposition 8.9(2), internal p.61: the source gives the θ₁ coefficient as det(Q)·con(a_Q⊗Q); it should be con(a_Q⊗Q) up to a unit, as Yamauchi's Fourier computation (Y16 p.24) shows; affects a stated result.
- **Gap** in CG20 at Proposition 8.9, internal p.61: the source states both theta maps with O/ϖ^m coefficients and weight shift p+1, but the cited construction (Y16 §3.3) works only modulo p; it should be stated over the residue field; affects a stated result.
- **Misprint** in CG20 at Lemma 8.4, internal pp.58–59: the source writes the U₂ multiplier as −1+p·(det Q/p) and equates it with −1+p·((r²−4mn)/p); it should use the discriminant symbol only, since the two differ by (−1/p); affects a stated result.
- **Misprint** in CG20 at Lemma 8.3, internal p.58: the source states the integrality condition with an unnormalized matrix product of S⁻¹ and Q; it should use the normalized action S⁻¹·Q; affects nothing.
- **Misprint** in CG20 at the proof of Lemma 8.6, internal p.59: the source says the indices R in Z₂ have det(R)=0; it should say det R = p²det Q ≡ 0 mod p; affects nothing.
- **Misprint** in CG20 at §5.5, internal p.33: the source says T_(p,2)/p^(k+j−6) acts by U_(p,2) in large weight; by Lemma 8.4 and the proof of Lemma 6.2 it should be p^(3−k)T_(p,2), acting as Z₂, and §8.3 reuses U₂ for the diagonal operator; affects nothing.
- **Gap** in CG20 at the proof of Lemma 8.20, internal p.72: the source takes pM⁻¹ in the same double coset for any level prime to p; this holds for SL₂(ℤ) but fails for Γ(5) at p=3, where reductions are diag(1,3) versus diag(3,1); affects the proof.
- **Gap** in CG20 at the proof of Theorem 8.10, internal p.62: the source attributes to Koblitz p.193 a global section of ω^((p²−1)/2) cutting out the supersingular locus; Koblitz proves only the local singularity structure; affects the proof.
- **Gap** in Y16 at the proof of Theorem 4.9, p.39: the source changes frame by an upper unipotent before using the local expansion; that change breaks the dual-basis normalization (Koblitz Lemma 13) under which the expansion holds, so a unitary-group frame change should be used; affects the proof.
- **Misprint** in P20 at §6.4, p.35: the source gives the rank-r stratum dimension 3−r and defines the closed and open strata by strict inequalities; it should be dimension r+1 with "at most" and "at least"; affects nothing.
- **Error** in P20 at Lemmas 6.3.3.3 and 6.3.3.5, p.33: the source says V_H*, W and A vanish on all of S∖S′; they vanish only where the multiplicative rank drops, and only A⊗B vanishes on all of S∖S′; affects nothing in the Siegel application.
- **Misprint** in P20 at the proof of Lemma 6.4.1, p.35: the source's Frobenius matrix has Fe₂ = pe₃, which with the form J of §5.1 gives ⟨Fe₂,Fe₃⟩ = −p; it should be −pe₃; affects nothing (the Hasse term −Y is unchanged).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6c5e47e", "job": "REV-PKG-AlgebraicModularFormsAndSerreWeightsPartII", "model": "opus", "worker": "fable-rev51"} -->
