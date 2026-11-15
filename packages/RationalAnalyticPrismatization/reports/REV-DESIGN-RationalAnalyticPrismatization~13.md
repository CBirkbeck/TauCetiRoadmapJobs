<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16360#issuecomment-6900571611 -->
Review (claude) of a9a1d96

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) Lazard's criterion in 10.4 is stated a second time: two earlier roadmaps own it and neither is cited

   **Location.** `design/README.md` line 1558 (10.4): "for a uniform pro-p group G with coordinates G ≅ ℤ_p^d and a ℚ_p-Banach space M, a function f: G → M … is locally analytic if and only if there is r > 1 with ‖c_α‖ r^{|α|} → 0"; line 1562, its *Needs:*; line 150 (supplier contracts); the same target in `plan.json`.

   **Claim.** 10.4 owns the criterion and imports only "Locally analytic functions on ℤ_p and Mahler/Amice expansions" from LocallyAnalyticDistributions §0.1, which itself imports Amice's theorem from PadicFunctionalAnalysis §4.4 (its README lines 176 and 283).

   **Witness.** PadicFunctionalAnalysis §4.4 (main, its README line 706): Amice's theorem, d = 1, Banach values. LocallyAnalyticDistributionsPartII §1.5 (open; README line 220): f: ℤ_p^d → K is locally analytic iff |c_α| s^{|α|} → 0 for some s > 1.

   **Repair** (README and `plan.json`).

   1. Scope and ownership, after "this roadmap builds the light, semilinear version on Gelfand stacks and compares.", add: "Amice's theorem on the Mahler coefficients of locally analytic functions on ℤ_p with values in a Banach ℚ_p-space is PadicFunctionalAnalysis §4.4, and its form in d variables for functions ℤ_p^d → K, K a complete discretely valued extension of ℚ_p (Lazard's criterion), is LocallyAnalyticDistributionsPartII §1.5; 10.4 keeps only the form with values in a ℚ_p-Banach space on a uniform group, which differs in the coefficients, and derives it from them."
   2. 10.4, first sentence: replace "Prove that for a uniform pro-p group G with coordinates G ≅ ℤ_p^d and a ℚ_p-Banach space M, a function …" by "Lazard's criterion for functions ℤ_p^d → K is LocallyAnalyticDistributionsPartII §1.5, and its case d = 1 with Banach values is PadicFunctionalAnalysis §4.4. Prove its form with Banach values on a uniform group: for a uniform pro-p group G with the ordered coordinates G ≅ ℤ_p^d of NoncommutativeAndEquivariantIwasawa §0.6 and a ℚ_p-Banach space M, a function …" (rest unchanged, locators kept).
   3. 10.4 proof route, first sentence: replace by "Lazard's criterion with Banach values follows from the orthonormal basis ⌊n/p^h⌋!·binom(x, n) of the stage LA_h(ℤ_p) of PadicFunctionalAnalysis §4.4: its d-fold completed tensor power is an orthonormal basis of LA_h(ℤ_p^d), and the completed tensor product with M gives the M-valued stage; the scalar case is LocallyAnalyticDistributionsPartII §1.5 (Laz65 III.1.3.9)."
   4. 10.4 *Needs:* and the plan's `prerequisites`: add "PadicFunctionalAnalysis §4.4; LocallyAnalyticDistributionsPartII §1.5" and drop "LocallyAnalyticDistributions §0.1" (it only imports §4.4). In the supplier contracts replace the block "From TauCetiRoadmap.LocallyAnalyticDistributions" by "### From TauCetiRoadmap.PadicFunctionalAnalysis — Amice's analytic basis of the stages LA_h(ℤ_p) with Banach values (§4.4). Sections consumed: §4.4." and "### From TauCetiRoadmap.LocallyAnalyticDistributionsPartII — Amice's theorem in d variables for functions ℤ_p^d → K, inside §1.5. Sections consumed: §1.5."; the same two rows in the plan's `suppliers`; the Layer 10 Dependencies line likewise. In the last-but-one Check of 10.4, "Amice's theorem, which the pinned library does not prove" becomes "Amice's theorem (PadicFunctionalAnalysis §4.4), which the pinned library does not prove".

   Tested on the witness. d = 1, f(a) = (1 + p)^a, c_n = p^n: §4.4 asks lim inf v_p(c_n)/n = 1 > 0, 10.4 asks p^{−n}r^n → 0 for some r > 1, true for 1 < r < p: the same condition. d = 2, f(a, b) = (1 + p)^{a+b}, c_{(m,n)} = p^{m+n}: (s/p)^{m+n} → 0 for 1 < s < p in both §1.5 and 10.4. M = K gives §1.5 word for word. The non-example Σ_k p^k binom(a, p^k) of 10.4 fails both (p^{−k}r^{p^k} → ∞). The gate is unaffected: PadicFunctionalAnalysis is on main and LocallyAnalyticDistributionsPartII (merge order line 202) is earlier than AnalyticStacks (line 338).

2. **F02** (P3) "Berkovich-étale" here is not what the suppliers call Berkovich étale

   **Location.** `design/README.md` line 339 (1.6): "Define Berkovich-étale maps of Gelfand rings as maps which locally for strict closed covers are composites of †-rational localizations and finite étale maps"; line 743 (4.2 Check): "A †-rational localization onto a closed subdisc is Berkovich-étale".

   **Claim.** The term is standard vocabulary or is defined; the design agrees with its suppliers on shared notions.

   **Witness.** TropicalAndBerkovichArithmetic §0.30 (README line 870): the inclusion of the strict closed subdisc is quasi-étale, “not Berkovich étale”. ClassicalAdicEtaleCohomology §3.1 (README line 1363) uses the word likewise. Here that map is Berkovich-étale.

   **Repair.** Add to Conventions: "Berkovich-étale and Berkovich-smooth are the notions of ABLB Definition 3.2.8 and ALRS Definition 2.6.12 (1.6, 4.2). They are not the étale and smooth morphisms of Berkovich's analytic geometry used in TropicalAndBerkovichArithmetic §0.30 and ClassicalAdicEtaleCohomology §3.1: a †-rational localization onto a closed subdisc is Berkovich-étale here, while the inclusion of a closed subdisc is quasi-étale and not étale there. The maps without boundary are the rigid étale and rigid smooth maps of 4.2." Extend the fourth Check of 4.2 by: "; in TropicalAndBerkovichArithmetic §0.30 the inclusion of the strict closed subdisc is quasi-étale and not étale, so the two uses of the word differ on this map." Tested on the witness: the closed subdisc of radius p^{−1} is Berkovich-étale (1.6, second Check), not rigid étale (4.2), and not étale in §0.30: the three statements are now consistent.

3. **F03** (P3) a supplier declaration named in 8.1 exists nowhere

   **Location.** `design/README.md` line 1191 (8.1, proof route): "rigidity of degree-one divisors on D^×_{FF,S′} (FarguesFontaineDiamonds §F4, untilt_closed_divisor; RelativeFarguesFontaine §3.2)".

   **Claim.** FarguesFontaineDiamonds Layer F4 has a declaration `untilt_closed_divisor`.

   **Witness.** `roadmaps grep 'untilt_closed_divisor'`: no match on main or in any open roadmap pull request. Layer F4 at its open head has “The analytic untilt divisor on `Y`” (line 858) and “The descended untilt divisor on `X`” (line 894).

   **Repair.** Replace "(FarguesFontaineDiamonds §F4, untilt_closed_divisor; RelativeFarguesFontaine §3.2)" by "(FarguesFontaineDiamonds Layer F4, “The analytic untilt divisor on Y”; RelativeFarguesFontaine §3.2)". Tested: both headings exist at the open heads (FarguesFontaineDiamonds line 858; RelativeFarguesFontaine line 1360, "3.2 Untilts as integral closed Cartier divisors").

Three findings: one P2 (an object with two owners, found in the duplication audit) and two P3. All three round-12 findings are repaired. The mathematics of the repaired passages and of the fifteen sampled targets is sound; every sampled locator matches its source. The design declares 21 supplier gaps, which are contracts and not findings; two of them (`gestalten-affine-proper`, `gestalten-transmutation`) still have supplier `none`. The round-4 repair report (`reports/FIX-DESIGN-RationalAnalyticPrismatization~4.md`, F02) settled this as `not actionable in this package` ("Gestalten have no owner, and creating a Gestalten roadmap is a board decision"); the reason still holds at this index (checked below), so it is not re-raised and is listed for the human reviewers.

Files reviewed: `packages/RationalAnalyticPrismatization/design/README.md` (2029 lines, 12 layers, 88 targets), `packages/RationalAnalyticPrismatization/design/plan.json`, `packages/RationalAnalyticPrismatization/sources.toml`. No file of the design was changed, nothing was added to the manifest, no `needs-references.toml` was written. No maintainer notes were given for this round.

## Verified sound

**Round-12 ledger.** All three repaired.

| Finding | State | Repaired passage at this head |
|---|---|---|
| F01 (P3) relative twistor stack undefined | repaired | 8.2, line 1210: "for Y over D define the relative perfect prismatization … and the relative p-adic twistor stack Y^{Div¹/𝒳} = …/φ^ℤ, φ acting through the Frobenius of Y^{Div¹~} and the automorphism φ_𝒳 (ALRS Definition 4.1.8(1), p. 59, ALRS line 3052)"; two laws (lines 1220–1221); three Checks (1228–1230). Read against ALRS line 3017–3025 and 3048–3059. The repair rightly did not copy the reviewer's test "D^{Div¹} = FF_D": ALRS line 3114–3115 denies it, and the 11.4 Check (line 1784) now derives FF_D as the base change of an identity |
| F02 (P3) `proetale-v-comparison` Supply | repaired | line 214: "for every such X, the equivalence RΓ_proét(X, ℚ̂_p) ≃ RΓ_v(X^⋄, ℚ_p) … obtained for qcqs X by inverting p and in general by descent along the affinoid opens of X, both sides being hypersheaves on the analytic site of X"; same `detail` in the plan |
| F03 (P3) repeated plan names | repaired | scripted over all API and test names of `plan.json`: no name occurs twice |

Same pattern elsewhere, as the repair report says: 9.2 now defines X^{HK/𝒳} (line 1339) and 9.4 writes the relative versions out (line 1374). Both were read against ALRS line 3535–3560 and 3602–3640 and computed (table below). A search for further objects used and never defined (every superscript decoration of X^{…/…} against the defining sections) found none.

**Sources, seeded sample.** The author flags no locator as unverified. A script checked all 402 locators of the form "p. N, id line M" against the page markers of the cached texts: all agree; no line locator is out of range.

| Target | Read | Result |
|---|---|---|
| 1.7 | ABLB line 1724–1727, 1765–1799, 1828–1844; And21 line 2687, 2733, 2779; Sch24 line 1720–1764 | match (Definition 3.3.1, Proposition 3.3.5 with And21 Theorem 5.50; Sch24 VI.1.2–VI.1.7) |
| 3.5 | ALRS line 1053–1066, 1092–1103, 1135–1160 | match (Lemma 2.4.1, Definition 2.4.2 over a base over ℚ, Example 2.4.4(3), Proposition 2.4.5) |
| 4.5 | ALRS line 9427–9464 | match (Lemmas A.1.1–A.1.3; the sentence on analytic rings after A.1.2) |
| 5.1 | ALRS line 1598–1707, 2062–2091 | match (Definition 2.8.1, Lemma 2.8.2, Remarks 2.8.3–2.8.4, Lemmas 2.8.6–2.8.7, Definition 2.8.9, Remark 2.9.7) |
| 7.3 | ALRS line 2470–2489, 2569–2620, 2651–2659 | match (Definition 3.4.2, Remarks 3.4.3–3.4.5, Proposition 3.4.12, Remarks 3.4.13–3.4.14, Definition 3.4.15, Lemma 3.4.16, Definition 3.4.18) |
| 7.4 | ALRS line 2685–2700, 2735–2770 | match (Proposition 3.5.3, Definition 3.5.4, Remark 3.5.6, Lemma 3.5.7, Remark 3.5.8) |
| 7.6 | ALRS line 2869–2940; FS line 2274, 2357 | match (Definition 3.7.1, Remark 3.7.2, Example 3.7.3, Proposition 3.7.4, Corollary 3.7.5; the README's remark on the corner of 3.7.4(2) is right, see Source issues) |
| 8.4 | ALRS line 3154–3182, 3217–3226, 3250–3262 | match (Lemma 4.2.6, Definition 4.2.7, Remark 4.2.8, Lemma 4.2.10, Proposition 4.2.11) |
| 8.7 | ALRS line 4040–4060 | match (Theorem 4.7.1(1)–(3)) |
| 9.2 | ALRS line 350, 3535–3560 | match (Proposition 4.4.4, Remark 4.4.5; the vector-bundle hypothesis is kept) |
| 9.3 | ALRS line 4062–4072, 3631–3633 | match (Theorem 4.7.2; footnote 27) |
| 10.3 | ALRS line 5086–5180 | match (§5.2.2, Definitions 5.2.8, 5.2.9, 5.2.11, Lemmas 5.2.10, 5.2.12(1)–(3)) |
| 10.7 | ALRS line 5831–5932 | match (Lemma 5.4.1, Definition 5.4.2, Remarks 5.4.3–5.4.4, Lemma 5.4.5, Corollary 5.4.6, Lemma 5.4.7(1)–(6)) |
| 10.9 | ALRS line 4791–4793, 6348–6366, 6444–6451, 6727–6758, 6786–6788, 6824–6829 | match (Lemma 5.6.2, Proposition 5.6.4, Definition 5.6.8, Remark 5.6.9, Theorem 5.6.10, Corollaries 5.6.11–5.6.12, Remark 5.1.4) |
| 11.4 | ALRS line 7918–7930, 7961–7968 | match (Theorem 6.2.1) |

Locators without a line number were found by search: BC16 Théorèmes 3.2 and 3.4 (BC16 line 397, 425), Man26 Lemmas 10.3 and 10.5 (Man26 line 2380, 2409), AM24 Lemma 3.29 (AM24 line 1713), SixFF Proposition 5.16 (SixFF line 1554), Pan22 Remark 1.0.15 (Pan22 line 332), RJRC Propositions 4.4.8 and 6.1.5 (RJRC line 2134, 2741), RJRC22 Theorem 5.7 (RJRC22 line 2227), Zav Definition 5.2.8 (Zav line 1949), Laz65 (1.3.9) (Laz65 line 2873), ABLB Theorem 6.3.1, Definition 6.2.8, Lemmas 6.2.5 and 6.2.9 (ABLB line 5415, 5300, 5250, 5303), RCSen Theorems 1.0.3 and 1.0.4 (RCSen line 64, 113), HM Example 5.3.21 (HM line 4911).

**Adversarial table** (repaired passages, sampled targets, headlines, findings; values computed this round).

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 8.2 relative twistor stack | Y = D; S = ∅; 𝒳 = 𝒳_T for A = C_p[ε]/ε² | 𝒳/φ^ℤ on both sides; ∅; φ sends the copy at radius p^n to p^{n+1}, the preimage of the thickened point at radius 1 is the unthickened point at 1/p: not an automorphism, quotient undefined | holds |
| 8.2 law (quotient of a fibre product) | G = ℤ on A → C ← B | pulling (A/G) ×_{C/G} (B/G) back along the point of BG gives A ×_C B, as for (A ×_C B)/G | holds |
| 8.2 law Y^{HT/D} | Y = D; general Y | D on both sides; Y^Δ ×_{D^Δ} D against Y^{Div¹} ×_{D^{Div¹}} D: D lands at κ = 1, inside (0, p) where the perfect prismatization maps isomorphically to X^Δ (8.5(2)) | holds |
| 9.2 X^{HK/𝒳} | X = D; general X | B = 𝒳/φ^ℤ, B^dR = (S × Marc(ℚ_p)/φ)^dR = D^HK since D^⋄ = S^{♯⋄}; definition gives B ×_{B^dR} (X^HK ×_{D^HK} B^dR) = X^HK ×_{D^HK} B, the law; the right square of ALRS Proposition 4.4.4 gives the same: X^HK ×_{Z^dR} (Z^dR ×_{B^dR} B) | holds |
| 9.2 Check (six corners) | X = D | D^cone ×_{D^cone} B = B; relative de Rham B; absolute B^dR = D^HK: left square identities, right square cartesian | holds |
| 9.4 relative versions | X = D | B ×_B D^† = D^†, B ×_B D^∧ = D^∧, then D | holds |
| 11.4 (headline) | X = D | D^{Div¹} ×_{D^{Div¹}} FF_D = FF_D, α the identity; no use of D^{Div¹} = FF_D | holds |
| `proetale-v-comparison` | open disc ⋃ X_n; X = Spa(K) | both sides the limit over the closed discs X_n of the qcqs comparison; RΓ(Gal_K, ℚ_p) twice | holds |
| 1.7 | ℚ_p; ℚ_p × ℚ_p; B = ℚ_p[ε]/ε², module ℚ_p | finite-dimensional complexes; pairs with ranks free at the two points; infinite Tor dimension, not dualizable | holds |
| 3.5 | BG_m^sch, A^{1,sch}/G_m^sch over a field of characteristic 0; Spec R(∗) | perfect and strongly Tannakian (ALRS line 1135–1140); S | holds |
| 4.5 | A = ℤ_p[T]; A = ℤ_p ⊗_{ℤ_p[x]} ℤ_p | L = ⊕ ℤ_p·T^n dT, not p-complete; L = A ⊗ L_{ℤ_p/ℤ_p[x]} = A[1] with (x)/(x²)[1] = ℤ_p[1] | holds |
| 5.1 | Y = ∅; Y = GSpec(ℚ_p); zero section of the disc | Y(D) nonempty iff D = ∅ iff the map factors through G_m/G_m; A¹/G_m; associated graded ℚ_p[x̄] | holds |
| 6.1 radius | untilt C with ϖ = p♭; κ = 0 | log\|p\|/log\|p\| = 1; \|[ϖ]\| ≠ 0, < 1 forces \|p\| = 0; {\|p\|^s ≤ \|[ϖ]\|} is κ ≤ s | holds |
| 7.3 | final object; T_FF on (S, D^×_{FF,S}) | GSpec(ℚ_p) (finite limits); T(FF_S) | holds |
| 7.4 Check 2 | K = 𝔽_p((π^{1/p^∞})) | ⋄ of the product over GSpec(ℚ_p): (K × Marc ℚ_p) ×_{Marc ℚ_p} (K × Marc ℚ_p) = K × K × Marc(ℚ_p), the ⋄ of D^×_{FF,K×K} | holds |
| 7.6 | λ = 1, A = C_p; λ = −1, A = C_p[ε]/ε²; λ = 0, A = ℚ_p[ε]/ε² | 1 + 𝔪_{C♭}; π_0 = C_p/ℚ_p, π_1 = C_p·ε ⊗ D_1 against π_1 = 0 of the de Rham stack; kernel ℚ_p·ε | holds |
| 8.4 | cyclotomic prism | log q/(q − 1) vanishes at the zeros of [p]_{q^{p^n}}, n ≥ 0; supports at radii p^n disjoint | holds |
| 8.5 | regions | Hodge–Tate locus at 1, translates at p^{−n} ⊂ (0, 1]; no thickening over (1, ∞); (0, p) ∪ (1, ∞) glued along (1, p) | consistent with 8.4, 8.6 |
| 8.7 | identity; non-surjective open immersion | isomorphisms; not an arc-cover, not an epimorphism | holds |
| 9.1 Check 3 | Y = GSpec(C_p) | T_Y[1]{1} = C_p(−1) ⊗ C_p(1) = C_p; a G_a^†-torsor over a BG_a^†-torsor: Y | holds |
| 9.2 hypothesis | X = D × BG_a | T = O[1]; X ×_{(O{1}[3])^†} X, a torsor under B²G_a^†{1}: no band | hypothesis needed |
| 9.3 | zero section of A¹ | L = ℚ_p[1], amplitude [−1, 0], not an epimorphism | hypothesis needed |
| 9.8, 9.9 | cyclotomic prism | φ(log q/(q − 1)) = p·[p]_q^{−1}·log q/(q − 1), φ(e⟨1⟩) = p^{−1}e⟨1⟩, so φ(e) = [p]_q^{−1}e; (q − 1)e = log q ⊗ e⟨1⟩ | holds |
| 10.1 | ℤ/2 on ℚ_p × ℚ_p (p = 2 too) | twisted M_2(ℚ_p); untwisted ℚ_p⁴ | holds |
| 10.3 | G = ℤ_p, r′ ∈ [1/p, 1); G = ℤ; G finite | G_0(r′)(ℚ_p) = pℤ_p, p discs; G^cont = G^la = G^sm; all three equal | holds |
| 10.4 (R01) | (1 + p)^a; Σ p^k binom(a, p^k); (1 + p)^{a+b} | p^{−n}r^n → 0 for r < p; p^{−k}r^{p^k} → ∞; (s/p)^{m+n} → 0: the same in PadicFunctionalAnalysis §4.4 and LocallyAnalyticDistributionsPartII §1.5 | duplicate: R01 |
| 10.4 normalisation | Λ = ℚ_p(p^{1/2}), ϖ = p^{1/2}; Λ = ℚ_p, ϖ = p² | \|p\|_ϖ = 1/4; 2^{−1/2} > 1/2 | holds |
| 10.7 | K = ℚ_p^cyc; trivial G; R = C(G, ℚ_p) | K^la = ℚ_p(μ_{p^∞}) with completion K; R^la = R; C^la_G with completion R | holds |
| 10.9 | G trivial; arbitrary action | identity; only full faithfulness (10.6) | holds |
| 10.10 | toric tower; Λ = ℚ_p | ϵ_{n,k} = p^{k−n} > ρ_{n,k} = p^{k−n−1} > 0; exponents v_p(ϖ)^{−1}ℤ not dense | holds |
| 10.12 (headline) | G trivial | X^la = X | holds |
| 11.1, 11.2 (headlines) | C_p(n) | n ≠ 0: 0; n = 0: K, K, 0 | holds |
| 11.6 (headline) | X = GSpec(K); X = ∅ | 11.1; empty | holds |
| 11.7 (headline) | K = ℚ_p; [K : ℚ_p] = n | 1, 2, 0; h¹ = n + 1 | holds |
| 12.1 | cusp; ℚ_p⟨T_n⟩ → ℚ_p; open disc | k[1] → k²[1] is 0 at the origin: L = k²[1] ⊕ k[2]; I/I² infinite-dimensional; \|T^n\| ≤ \|p\| is \|T\| ≤ p^{−1/n} | holds |
| 12.2 (headline) | Tate duality; mirabolic, a = p | (1, 2, 0) against (0, 2, 1); aKa^{−1} = pℤ_p ⋊ (1 + pℤ_p), index p^{−1} = \|p\|_p | holds |
| 12.3–12.5 (headlines) | P¹; G_m | f_*O = O ⊕ O{−1}[−2], f_*(O{1}[2]) = O{1}[2] ⊕ O = (f_*O)^∨; O{1}[2], composed O{2}[4] | holds |
| 12.6 (headline) | X = GSpec(ℚ_p), E = ℚ_p | Fil⁰(B_dR) = B⁺_dR | holds |

Targets outside this table rest on the computed rows of the earlier rounds; the README was nevertheless read in full this round, and every Check was read against the statement of its section. No contradiction was found.

**Structure (scripted).** 88 targets (16 definitions, 14 constructions, 58 theorems), 88 README subsections. Every plan statement, API bullet and test occurs verbatim in the README (0 missing). Every subsection has at least three Checks and a *Needs:* line; every target whose statement defines a notion has an API list. All 21 gaps have the same slug, `needs` and `detail` in plan and README. Policy search (LaTeX delimiters, pull-request numbers, machine paths, `set_option`, HTML, process words): nothing; "lemma" occurs only in "Shapiro's lemma" and "Poincaré lemma". The README has no backticked name of its own.

**Manifest.** 24 entries, all `certified` (21 open-repository, 3 author-page). Every source id cited in the README is recorded; the References list equals the manifest.

**Pins.** `lake-manifest.json`: Mathlib `1b1ccf4b…`, Tau Ceti `2fd255d9…`, the hashes of the checkouts and of the README. The 20 cited declarations were opened at the cited file and line and are there: `LightProfinite` :44, `LightCondensed` :29, `MulRingSeminorm` :61, `spectralNorm` :381, `WittVector` :52, `WittVector.fontaineTheta` :166, `BDeRhamPlus` :75, `PadicComplex` :137, `TauCeti.LocallyAnalytic` :45, `eval` :85, `spaY` :116, `frobeniusHomeomorph` :220, `IsRadiusLowerBound` :102, `IsRadiusUpperBound` :108, `isRadiusLowerBound_comap_frobenius_iff` :149, `windowU` :260, `windowV` :267, `spaX` :59, `compactSpace_spaX` :259, `t0Space_spaX` :271. The pinned Tau Ceti has no Gelfand ring (its files matching "Gelfand" are Gelfand–Tsetlin and C*-algebra files).

**Principles.** No re-planned roadmap, no upward supply, no algorithm, no copied passage, no Lean file at this stage. R01 is the one place where an existing statement is planned again.

**Supplier order.** Gate output:

```
candidate: RationalAnalyticPrismatization is not in the merge order yet; checked as if placed after MotivesAndAlgebraicCyclesPartII (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2262 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every section of the 34 supplier rows of `plan.json` was resolved by script against the supplier's README: 12 on main, 21 at open heads, and MotivesAndAlgebraicCyclesPartII in the board's packages ("## Layer 0: The Banach arc-site", §0.4 strictly totally disconnected). All exist. EnhancedDerivedSheaves has "Layer E5:descent" with `isDescendable_colimit_of_uniformIndex` (its line 1821); `Huber.GelfandSpectrum` is declared in `TauCetiRoadmap/AdicSpacesPartIII/Suggested.lean` line 798 inside `namespace Huber`; `Spectrum` is TropicalAndBerkovichArithmetic §0.1; the six VectorBundlesAndIsocrystals target names quoted in 6.1, 7.6, 9.9, 11.1 and 11.7 are headings there (lines 135, 512, 550, 1096, 1106, 1674), and "RΓ_proét(S, E) ≃ RΓ(X_S, O)" is in its line 552; `rad_ϖ` is RelativeFarguesFontaine §1.2. The one name that does not resolve is R03. The lead of `roadmaps resolve` (MotivesAndAlgebraicCyclesPartII) is the board package above; the worker's lead `Huber.GelfandSpectrum` resolves on main.

**Gaps.** Nineteen gaps name a supplier whose section exists at its head. For AnalyticStacks each item number cited was opened: §2.3(1), (7); §2.11; §3.6; §4.2(3) (modulus δ(g) = [gKg⁻¹ : K], ℤ[1/p]-algebras, locally pro-p); §4.3(1)–(2); §4.4(1), (3)–(5), and (6) used in a Check of 1.7; §4.5; §5.1–5.3; §6.3(1); §6.4, §6.6 (det(L)[n] up to a sign depending on n); §6.5(3)–(4); §7.2; §7.5; §7.6; §7.7; Conventions (4). Its consumer note (README line 1304) maps this roadmap's slugs to the same sections. Each `needs` sentence names one deliverable with its hypotheses. `nuclear-modules` asks AnalyticStacks for the instance D(A) of statements whose general form is RefinedTraceMethods §4.3; the README says so (line 58), and the instance needs AnalyticStacks' D(A), so it is not asked twice. For the two Gestalten gaps, `roadmaps grep -i gestalt` returns only AnalyticStacks, which places Gestalten outside its scope (its line 22): no owner exists, so the settled reason holds.

**Duplication audit.** `roadmaps grep -i --readme-only` at the index of 2026-11-15, by object: Gelfand ring or stack, analytic de Rham stack, analytic prismatization, derived Berkovich: only AnalyticStacks, whose Scope gives them to this roadmap. Twistor stack, Hyodo–Kato stack, nilperfectoid, geometric Sen, Hodge–Tate stack, decompletion, rational δ-space, analytic δ-stack: no roadmap. Locally analytic vectors: LocallyAnalyticRepresentationsOfLocalGroups owns the linear theory (§2.3, §3.8) and has no Tate–Sen, semilinear or decompletion statement. Sen operators, Faltings' extension, Banach–Colmez spaces, the prismatic logarithm: owned by PadicHodgeTheory, VectorBundlesAndIsocrystals and the PrismaticCohomology parts, cited here by section; this roadmap states only their Gelfand-stack forms and comparisons. Lazard's criterion: R01. "Berkovich étale": R02. Board packages: only AnalyticStacks and this package mention these objects.

Overlap facts (`scratch/overlaps.md`, checked): no other pull request changes this roadmap, none drops an id it cites, it cites no id that only an open revision defines, and it is not a second copy (no folder of this name on main). AnalyticStacks' consumer note still lists a slug `hypercover-inversion` that this design no longer declares; it points to its 4.5, where `perfect-complexes-fredholm-stacks` points, so nothing breaks here.

Overlap check: read the Scope and ownership of AnalyticStacks (with its consumer note), LocallyAnalyticDistributionsPartII and LocallyAnalyticRepresentationsOfLocalGroups (open), of PadicFunctionalAnalysis §4.4 and DiamondsAndVStacks §§D6.4–D6.5 (main), and searched PrismaticCohomologyPartIII, PrismaticCohomologyPartIV, AInfCohomology, CohomologyComparisons, EnhancedDerivedSheaves and PerfectoidSpaces by object; shared: Lazard's criterion for locally analytic functions on ℤ_p^d, owner LocallyAnalyticDistributionsPartII §1.5 with PadicFunctionalAnalysis §4.4 for d = 1 (R01); analytic stacks, six functors, nuclear modules, Fredholm criteria, Cartier duality, owner AnalyticStacks (consumed through gaps); integral prismatic objects, owner the PrismaticCohomology parts (Checks only); Gelfand rings and stacks, the analytic prismatization and decompletion over Gelfand rings, owner this roadmap.

**Headline theorems** (Summary): 11.6 with 11.1 and 11.4; 11.7; 11.2, 11.5, 11.8; 10.12 with 11.9–11.10; 12.2–12.4; 12.5; 12.6. None is statable at the pins: neither library has analytic rings, Gelfand stacks or Fargues–Fontaine curves as stacks. The package stage says so in the module docstring. Each headline names the roadmap's objects.

**Copyright.** Wording: the seventeen statement passages of the sample and of the repairs (8.2, 9.2, 9.4 included) and six proof routes (1.7, 5.1, 7.3, 8.7, 10.3, 10.7) were set beside ALRS and ABLB at their locators. The longest shared run is six words ("!-equivalences are stable under base change", ALRS line 1615, a statement that can be written in one way); the definitions of 3.5 follow conditions that the mathematics forces. No sentence, list or proof plan is reproduced, and no table, figure or list of examples is taken over.

Arrangement against ALRS (contents at ALRS line 15–70): Layers 1–3 ↔ ABLB with §§2.1–2.5; Layer 4 ↔ §§2.6–2.7 with Appendix A; Layer 5 ↔ §§2.8–2.9, 3.1; Layer 6 ↔ §3.2 with ABLB §6; Layer 7 ↔ §§3.3–3.7; Layers 8–9 ↔ §4 (8.7 and 9.3 split §4.7); Layer 10 ↔ §§5.2–5.8 then 5.1; Layers 11–12 ↔ §6 (11.3 from §4.10 and §1.2). Twelve layers against six chapters and an appendix, with a second source carrying Layers 1–3 and 6: not a one-to-one mapping. The parallel runs inside Layers 7 and 10 are forced by the *Needs:* lines (7.2 needs 7.1, 7.3 needs 7.2, 7.4 needs 7.3, 7.6 needs 7.5; 10.7 needs 10.6, 10.9 needs 10.7 and 10.8, 10.10 and 10.11 need 10.9); Layers 8, 9, 11, 12 are forced (8 needs 7, 9 needs 8, 11 needs 9 and 10, 12 needs 11). The position of Layer 10 between 9 and 11 is free (it needs only Layers 1–7) and the README says why it stands there.

Source independence: 23 passages compared with 2 sources, none shared; largest share ALRS, 350 of 489 line locators; contents compared with ALRS: independent.

## Not verifiable

- Lean elaboration, the `#check` pass and the one-tactic padding probe: not available (this lane does not elaborate, and the design has no `Suggested.lean`).
- Ownership against open pull requests was checked through `roadmaps grep` by object and by reading the roadmaps of the Overlap check; the other open roadmaps were not read one by one.
- The review reports of rounds 8–11 were not available to this round; targets outside the sample, the repaired passages and the headlines rest on their computed rows.
- The agreement of ALRS's construction of Φ (through Man26 Lemma 10.5 and AM24 Lemma 3.29) with the comodule construction of 10.2 is stated as a Check; it was read, not recomputed.

## Source issues

- **Misprint** in ALRS at Definition 4.5.1(2), printed page 69 (ALRS line 3611): the source labels the relative formal Hodge–Tate stack with the overconvergent neighbourhood D† although the fibre product is with D∧; it should carry D∧, as in Proposition 4.5.3; affects nothing.
- **Misprint** in ALRS at Proposition 3.7.4(2), printed page 56 (ALRS line 2924): the source puts the de Rham stack of G_a in the lower left corner of the square; it should be the analytic G_a, as its proof (ALRS line 2931) says; affects a stated result.
- **Misprint** in ALRS at Corollary 5.6.12, printed page 125 (ALRS line 6825): the source calls the family of algebras cofiltered while forming its direct limit; it should be filtered; affects nothing.
- **Misprint** in ALRS at §5.2.2, printed page 97 (ALRS line 5094–5098): the source uses one symbol for the compact open subgroup of ℚ_p-points of the polydisc and for the rigid group built from its cosets; they should have two symbols; affects nothing.

## For the human reviewers

- **Scope.** The main sources are unpublished: ALRS (2026, author page), ABLB (arXiv 2510.15196), RCSolid, RC26a, Gest (lecture notes); 424 of 489 line locators are to ALRS and ABLB. No refereed source states the headline theorems.
- **Licence.** `sources.toml` records ALRS, Gest and Sch24 as author-page copies; no licence is stated on the files.
- **Ownership.** `gestalten-affine-proper` and `gestalten-transmutation` have supplier `none` (`design/README.md` lines 172, 210, 212); no roadmap owns Gestalten (AnalyticStacks README line 22 excludes them). Who supplies them is the board's decision.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a9a1d967127ec0b6119139d0ce2ff3d5a4a8f678", "job": "REV-DESIGN-RationalAnalyticPrismatization~13", "model": "fable", "worker": "chris-x81"} -->
