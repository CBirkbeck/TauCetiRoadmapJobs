<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16360#issuecomment-6902102922 -->
Review (claude) of a9c372f

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) 11.8 writes the product of X with K^HT without its base

   **Location.** `design/README.md` line 1840 (11.8): "π_{X,1}: X^HT → X × K^HT is a BT^†_X{1}-torsor", "descending the geometric Sen operator to X × K^HT", "L_{X^HT/(X×K^HT)} ≅ Ω¹_{X/K}{−1}[−1]"; the same string in the statement of 11.8 in `design/plan.json`.

   **Claim.** For X smooth partially proper over K, X^HT is a BT^†_X{1}-torsor over X × K^HT.

   **Witness.** Unsubscripted × is the product over GSpec(ℚ_p) elsewhere (9.1 "X × Q_p^HT", 11.1 "GSpec(K) × Q_p^Δ"; bases are written out at lines 1133 and 1660). Take K = ℚ_{p²}, X = GSpec(K). By 9.1, T_X = 0 and X^HT ≅ X × Q_p^HT = K^HT. Then X × K^HT = GSpec(K ⊗ K) × Q_p^HT is two copies of K^HT, and a torsor under B0 is an isomorphism.

   ALRS Theorem 6.3.2 (ALRS line 8146–8152) has the same unsubscripted product; the base GSpec(K) is meant (see Source issues).

   **Repair** (README and `plan.json`, statement of 11.8).
   - Replace "π_{X,1}: X^HT → X × K^HT" by "π_{X,1}: X^HT → X ×_{GSpec(K)} K^HT = X × Q_p^HT, where K^HT = GSpec(K)^HT ≅ GSpec(K) × Q_p^HT by 9.1 (T_{GSpec(K)} = 0)".
   - Replace the second "X × K^HT" by "X ×_{GSpec(K)} K^HT" and "L_{X^HT/(X×K^HT)}" by "L_{X^HT/(X ×_{GSpec(K)} K^HT)}".
   - Add "§9.1" to the *Needs:* line of 11.8.
   - Add a Check: "For K = ℚ_{p²} and X = GSpec(K), X ×_{GSpec(K)} K^HT = K^HT and π_{X,1} is the identity, a torsor under the trivial group; the product over GSpec(ℚ_p) would be GSpec(K ⊗ K) × Q_p^HT, two copies of K^HT, and is not the target."

   Tested on the witness: with the base, π_{X,1} is K^HT → K^HT, and (1) is 9.1 for X over ℚ_p with T_X = T_{X/K}; (2) is unchanged, since X ×_{GSpec(K)} K^HT → X is a base change of K^HT → GSpec(K), with cotangent complex O[−1] (11.2).

2. **F02** (P3) 10.11: the group H of ALRS Proposition 5.8.10(2) is not declared

   **Location.** `design/README.md` line 1696 (10.11): "Z = BU × X^la/G^la with U open in H(ℚ_p)^la"; the same in `design/plan.json`.

   **Claim.** β^ét_{X,Z} is an equivalence for this Z.

   **Witness.** In the same sentence H is "a compact p-adic Lie group" (ALRS Lemma 5.8.8) and then one of "p-adic Lie groups G and H" (ALRS Proposition 5.8.9); H(ℚ_p) has no meaning for these. ALRS line 7634: U is an open subgroup, H an affine algebraic group over ℚ_p.

   **Repair.** Replace by "Z = BU × X^la/G^la with U an open subgroup of 𝐇(ℚ_p)^la = 𝐇^an ×_{𝐇^{an,dR}} 𝐇(ℚ_p)^dR for an affine algebraic group 𝐇 over ℚ_p (3.4)", and in the proof route write "reduce to T = B𝐇 via the cartesian square defining 𝐇(ℚ_p)^la". Tested: for 𝐇 = GL_n and U = GL_n(ℤ_p)^la this is the group of the fourth Check of 10.11.

3. **F03** (P3) 11.3: Γ_d is defined as a stack and then decorated again

   **Location.** `design/README.md` line 1769 (11.3): "Γ_d = ℤ_p^{×,la} ⋉ ℤ_p^{d,la}", followed by "Γ_d^la" and "Γ_d^cont"; the same in `design/plan.json`.

   **Claim.** X^{Div¹} is a quotient by Γ_d^la and FF_{X^⋄} a quotient by Γ_d^cont.

   **Witness.** By the Conventions, G^cont and G^la are formed from a p-adic Lie group G; applied to the stack ℤ_p^{×,la} ⋉ ℤ_p^{d,la}, "Γ_d^cont" is undefined. The source has the same slip (ALRS line 396, 4693).

   **Repair.** Write "Γ_d = ℤ_p^× ⋉ ℤ_p^d, the p-adic Lie group in which ℤ_p^× acts on ℤ_p^d by multiplication, with Γ_d^la = ℤ_p^{×,la} ⋉ ℤ_p^{d,la}". Tested: for d = 0, Γ_0 = ℤ_p^× and the first Check reads Div¹ = FF^la_{ℚ_p^cyc}/ℤ_p^{×,la}, as in 9.7.

4. **F04** (P3) 2.6: the radius in the definition of a †-rigid space

   **Location.** `design/README.md` line 509 (2.6): "locally represented by a static quotient of an overconvergent Tate algebra K⟨T_1,…,T_n⟩_{≤r}".

   **Claim.** This is ABLB Definition 4.3.6.

   **Witness.** ABLB line 2386 has "for some r > 0". For r = 0 the algebra K⟨T⟩_{≤0} is the ring of germs at 0, with uniform completion K (1.2, third Check): a †-nilpotent thickening of a point, which the definition as written admits.

   **Repair.** Insert "for some r > 0" after "K⟨T_1,…,T_n⟩_{≤r}" (README and `plan.json`). Tested: GSpec(K⟨T⟩_{≤0}) is then excluded and GSpec(K⟨T⟩_{≤1}) stays †-rigid (third Check of 2.6).

5. **F05** (P3) 2.6, second Check: the conclusion is not what the example shows

   **Location.** `design/README.md` line 526 (2.6): "… have the same Gelfand stack GSpec(ℚ_p⟨T⟩), so X ↦ X′ is not injective on rigid spaces that are not partially proper"; the same in `design/plan.json`.

   **Claim.** Two rigid spaces that are not partially proper have the same X′.

   **Witness.** The canonical compactification of the closed disc is partially proper and is not a rigid space of RigidAnalyticGeometry §6.2 (its ring of integral elements is not the power-bounded subring). On affinoid rigid spaces X ↦ GSpec(A) is injective.

   **Repair.** Replace the conclusion by "so X′ does not depend on the ring of integral elements: the construction factors through the canonical compactification, an adic space over ℚ_p that is not a rigid space, and full faithfulness is asserted only on partially proper rigid spaces". Tested: both spaces have the open affinoid algebra ℚ_p⟨T⟩, so X′ = GSpec(ℚ_p⟨T⟩) for both.

Five findings: one P2 and four P3. All three round-14 findings are repaired. The fifteen sampled targets match their sources. The P2 is a fibre product in 11.8 written without its base, which makes the statement false for K ≠ ℚ_p in the roadmap's own notation and contradicts 9.1. The design declares 21 supplier gaps, which are contracts and not findings; `gestalten-affine-proper` and `gestalten-transmutation` still have supplier `none`, which the round-14 review records as settled (`not actionable in this package`, round-4 repair report: no roadmap owns Gestalten). I checked the reason again (below); it holds, so it is not re-raised.

Files reviewed: `packages/RationalAnalyticPrismatization/design/README.md` (2036 lines, 12 layers, 88 subsections), `packages/RationalAnalyticPrismatization/design/plan.json`, `packages/RationalAnalyticPrismatization/sources.toml`. No file of the design was changed, nothing was added to the manifest, no `needs-references.toml` was written. No maintainer notes were given for this round.

## Verified sound

**Round-14 ledger.** All three repaired.

| Finding | State | Repaired passage at this head |
|---|---|---|
| F01 (P1) untwisted product in 11.1 | repaired | line 1737: "X^{Div¹} ≅ (GSpec(K) × Div¹~)/(GSpec(σ) × φ)^ℤ = GSpec(K)/σ^ℤ ×_{GSpec(ℚ_p)/φ^ℤ} Div¹, where ℤ acts trivially on GSpec(ℚ_p)"; route through 8.3; two new Checks; *Needs* gains §8.3, §8.2, §3.2 |
| F02 (P2) 5.4 Check following ALRS Remark 3.1.6 | repaired | line 956: "Let θ be the operator through which the Lie algebra of G_m acts on an equivariant sheaf E on A¹, so that θ(f·e) = T∂_T(f)·e + f·θ(e)…"; longest run shared with ALRS line 2263–2271 now 4 words |
| F03 (P3) "constant" filtration in 5.1 | repaired | line 901: "the ideal is 0, so the adic filtration is O_X in degrees ≤ 0 and 0 in degrees ≥ 1, with associated graded O_X in degree 0 and Rees algebra O_X[t]" |

Repaired patterns in the rest of the design: the search for a product written without Frobenius or without its base found R01 (11.8); "GSpec(K) ×", "× Div¹", "unramified" occur only in 11.1. The manifest changes of the repair (ABLB Remark 4.4.11 at ABLB line 2653; the ALRS version note) are correct.

**Sources, seeded sample.** The author flags no locator as unverified. All fifteen sampled targets were read against the cached texts.

| Target | Read | Result |
|---|---|---|
| 1.3 | ABLB line 1037–1045, 1080–1147 | match (Definition 2.3.1, Remark 2.3.2, Proposition 2.3.6(1)–(4), Corollary 2.3.7) |
| 1.4 | ABLB line 1162–1186, 2061–2069, 2190–2196, 2261–2264 | match (Definitions 3.1.1, 4.1.11, 4.2.6(1), 4.2.14(1), Remark 3.1.2, Example 3.1.3, Proposition 3.1.4) |
| 2.6 | ABLB line 2295–2302, 2330–2334, 2384–2388; ALRS line 894–922 | match, except "r > 0" (R04) and the conclusion of a Check (R05) |
| 3.1 | ALRS line 1017–1031; ABLB line 3155–3165, 3248–3254 | match |
| 3.2 | ABLB line 2752–2756, 3384–3385, 4629–4634, 4799–4806 | match (Proposition 4.5.7 is stated for the big de Rham stack; the qfd form was computed in round 14) |
| 3.4 | ALRS line 326–327, 1032–1037 | match (Definition 2.3.3, footnote 6) |
| 4.2 | ALRS line 1309–1360 | match (Remark 2.6.7, Definitions 2.6.8, 2.6.10, 2.6.12, Lemma 2.6.11, Warning 2.6.13) |
| 5.1 | ALRS line 1598–1620, 1653–1661, 2062–2091 | match |
| 5.4 | ALRS line 2195–2271 | match (Definitions 3.1.1, 3.1.5, Proposition 3.1.3, Remarks 3.1.4, 3.1.6, (3.1.1)) |
| 6.3 | ABLB line 4983–4996, 5247–5251, 5300–5306, 5415–5422, 5470–5474 | match (Definitions 6.1.1, 6.1.2, 6.2.4, 6.2.8, Lemmas 6.2.5, 6.2.9, Theorem 6.3.1, Corollary 6.3.2) |
| 7.2 | ALRS line 197–210, 2501–2542, 2634–2640 | match (Proposition 3.4.7, Definition 3.4.8, Remarks 3.4.9, 3.4.10, 3.4.17, 1.5) |
| 9.2 | ALRS line 350–354, 3535–3560 | match (Proposition 4.4.4, Remark 4.4.5) |
| 10.11 | ALRS line 7454–7480, 7511–7516, 7555–7638 | match; the README corrects two slips of Lemma 5.8.8 and strengthens "Gelfand stack" to "Berkovich space" in Proposition 5.8.9, as its proof uses; R02 |
| 11.6 | ALRS line 356–363, 483, 8082–8089 | match (Theorem 6.3.1, Theorem 1.15) |
| 12.3 | ALRS line 8875–8934 | match (Theorem 6.5.8, Remark 6.5.9); the README has O_{X^{Div¹}} in (3), correcting the source |

Also read for the headlines: ALRS line 4738–4762 (Theorem 5.1.1), 7756–7775 (Theorem 6.1.1), 7873–7874, 8745–8755, 8816–8821, 8864, 8938–8956, 9093–9100, 9143–9146, 480, 396–405, 4683–4711.

**Adversarial table** (repaired passages, sampled targets, headlines, findings; values computed this round).

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 11.1 twisted product | K = ℚ_p; K = ℚ_{p²} | Div¹ = Div¹; H⁰ = (K ⊗ ℚ_p)^{σ⊗1} = ℚ_p against h⁰ = 1 of 11.7; untwisted 2, 4, 0 against 1, 3, 0 | holds |
| 11.1 direction of the twist | K = ℚ_{p³}, fibre over FF_{C_p♭} | x⊗b ↦ (τ(x)b)_τ turns σ⊗φ into φ on each factor: ℚ_p³; σ⁻¹⊗φ gives b_τ = φ(b_{τσ⁻²}), a 3-cycle: ℚ_{p³}; expected ⊔₃ FF_{C_p♭}: ℚ_p³ | σ, as written |
| 11.1 route | D^×_{FF} of Marc(ℚ_p) × Marc(k) | D^×_{FF,Q_p^⋄} ×_{GSpec(ℚ_p)} GSpec(W(k)[1/p]), Frobenius σ on W(k); 8.3 square: Q_p^Δ × GSpec(K) | holds |
| 11.1 consistency with the cartesian square | pull back along FF_{Q_p^⋄} → Div¹ | (GSpec(K) × D^×_{FF,Q_p^⋄})/(σ × φ)^ℤ = FF_{X^⋄} | holds |
| 11.8(1) as written | K = ℚ_{p²}, X = GSpec(K) | X^HT = K^HT (9.1); X × K^HT = 2 copies of K^HT | false: R01 |
| 11.8(1) repaired | same | X ×_{GSpec(K)} K^HT = K^HT, identity | holds |
| 5.4 Check 3 | E = O, θ = T∂_T; skyscraper ℚ_p[θ] | ‖T∂_T‖ ≤ 1; θ(T·e) = 0 = T·e + T·θ(e); \|p^{n²}\|ρ^n → 0, Σ p^{n²}θ^n·1 of unbounded degree | holds |
| 5.1 Check 5 | identity, I = 0; zero section | Fil^n = O (n ≤ 0), 0 (n ≥ 1), Rees O[t]; (x^n), gr = ℚ_p[x̄] | holds |
| 5.1 | Y = GSpec(ℚ_p); ∅; G_a | A¹/G_m; G_m/G_m; cofibre of I → R, G_a/G_a(−1) | holds |
| 1.3 | ℚ_p⟨T⟩; ℚ_p[ε]/ε²; 0; Banach B | ℤ_p⟨T⟩ complete; A_{≤1} = ℤ_p ⊕ ℚ_pε, completion ℤ_p, A^u = ℚ_p, 1 + ε ↦ 1; 0 a unit of A^u = 0 forces A = 0; B_{≤1} = {spectral radius ≤ 1} | holds |
| 1.4 | C_p; ℚ_p⟨T_n : n ∈ ℕ⟩; 0; pushout | n = 0; spectrum contains [0,1]^ℕ, infinite covering dimension against dim ≤ n for profinite fibres over a polydisc; Marc(0) = ∅; fibre product is closed in a product | holds |
| 2.6 †-rigid | r = 0; r = 1 | germs at 0, A^u = K, admitted as written; overconvergent disc | R04 |
| 2.6 Check 2 | closed disc, its compactification | same open affinoid algebra ℚ_p⟨T⟩; second space not a rigid space | R05 |
| 3.1 | A¹ on C_p[ε]/ε²; ∅; idempotence | ε and 0 both map to 0 ∈ C_p; ∅(Marc(A^u)) = ∅; X((A^u)^u) = X(A^u) | holds |
| 3.2 | BΓ^sm × B over B | B ×_{B^dR} (BΓ^sm × B^dR) = BΓ^sm × B | holds |
| 3.4 | ℚ_p[ε]/ε²; C_p[ε]/ε²; C(ℤ_p, C_p); de Rham stack | ℚ_p ⊕ ℚ_pε against ℚ_p; {a + bε : a ∈ ℚ_p, b ∈ C_p}; C(ℤ_p, ℚ_p) ⊋ C^lc; X^dR ×_{X^dR} S^dR = S^dR | holds |
| 4.2 | open disc; overconvergent disc; closed subdisc | open in A¹; Gauss point is a boundary point, image not open; †-rational, not rigid étale | holds |
| 6.3 | P¹; G_m; wrong twist | f_*O = O ⊕ O(−1)[−2], f_*ω = O(1)[2] ⊕ O = (f_*O)^∨; H¹ = (ℚ_p, pφ); ω = O(−1)[2] would give O(−2) | holds |
| 7.2 | A perfectoid; C_p[ε]/ε²; ℚ_p(μ_{p^∞}) | pushout along the identity; A_{≤1} = O_{C_p} ⊕ C_pε, fibre Nil† = C_pε; Nil† = 0 and ℤ_p[μ_{p^∞}] → O_{ℚ_p^cyc} not surjective | holds |
| Radius convention | κ(φ(x)) | \|[ϖ^p]\| = \|[ϖ]\|^p, so κ ∘ φ = pκ; Tau Ceti `isRadiusLowerBound_comap_frobenius_iff`: q ≤ κ(φv) ⇔ q/p ≤ κ(v) | consistent |
| 9.2 | X = D; X = D × BG_a | D^{HK/𝒳} = 𝒳/φ^ℤ = D^HK ×_{D^HK} 𝒳/φ^ℤ; T = O[1], T{1}[2] = O{1}[3], loop object B²G_a^†{1} | holds |
| 10.11 | Γ finite; G trivial; GL_n(ℤ_p)^la | Z = Z^{dR/B}; formula reduces to 10.7; GL_n ×_{GL_n^dR} GL_n(ℤ_p)^dR = (GL_n)^†_{GL_n(ℤ_p)} by 3.1 | holds; R02 |
| 10.12 (headline) | G trivial; D^×_{FF,ℚ_p^cyc}, G = ℤ_p^× | h the identity; X^la = BC(O(1)) ∖ {0} | holds |
| 11.2 (headline) | C_p(n) | n ≠ 0: K →^{n} K acyclic; n = 0: K, K, 0; L of a BG_m^†-gerbe = O[−1] | holds |
| 11.3 | d = 0 | Div¹ = FF^la_{ℚ_p^cyc}/ℤ_p^{×,la}, p ∈ ℚ_p^× acting by φ | holds; R03 |
| 11.4 (headline) | X = D | FF_D, α the identity | holds |
| 11.6 (headline) | X = GSpec(K); ∅ | 11.1; empty | holds |
| 11.7 (headline) | K = ℚ_p; [K : ℚ_p] = n; X connected | 1, 2, 0; h¹ = n + 1, χ = −n; H⁰ = ℚ_p | holds |
| 12.2 (headline) | Tate duality; ω_{A¹/G_m}; modulus | 1 ↔ 1, 2 ↔ 2; O[−1] ⊗ I[1] = I; [pℤ_p : ℤ_p] = p⁻¹ = \|p\|_p | holds |
| 12.3 (headline) | d = 0; G_m over ℚ_p; P¹ | O; O{1}[2], composite O{2}[4]; f_!O = O ⊕ O{−1}[−2] ≠ f^!O | holds |
| 12.4 (headline) | P¹, M = O | f_*(O{1}[2]) = O{1}[2] ⊕ O = (O ⊕ O{−1}[−2])^∨ | holds |
| 12.5 (headline) | d = 0, 1 | O; O{1}[2] ⊕ O | holds |

Targets outside this table rest on the computed rows of rounds 12 to 14; their texts are unchanged (the last repair touches only 5.1, 5.4, 11.1 and the Layer 11 dependencies).

**Structure (scripted).** 88 subsections, each with at least three Checks and a *Needs:* line. Every statement and gap string of `plan.json` occurs verbatim in the README (0 missing). 21 gaps with the same slugs in plan and README. Policy search (LaTeX delimiters, pull-request numbers, machine paths, `set_option`, HTML, process words): nothing; "lemma" only in "Shapiro's lemma" and "Poincaré lemma". No backticked name of this roadmap's own.

**Pinned declarations.** All 21 opened at the pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d), each at the file and line the README gives: `LightProfinite`, `LightCondensed`, `MulRingSeminorm`, `spectralNorm`, `WittVector`, `WittVector.fontaineTheta`, `BDeRhamPlus`, `PadicComplex`, `PadicInt.mahlerEquiv`, `TauCeti.LocallyAnalytic`, `TauCeti.LocallyAnalytic.eval`, `TauCeti.FarguesFontaine.spaY`, `frobeniusHomeomorph`, `IsRadiusLowerBound`, `IsRadiusUpperBound`, `isRadiusLowerBound_comap_frobenius_iff`, `windowU`, `windowV`, `spaX`, `compactSpace_spaX`, `t0Space_spaX`. `spaY` is `spa ⊤ ∩ {p, [ϖ] ∉ supp}` (Y.lean:116), as described.

**Manifest.** 24 entries, all `certified`; every source id cited in the README is recorded and every entry is cited.

**Supplier order.** Gate output:

```
candidate: RationalAnalyticPrismatization is not in the merge order yet; checked as if placed after MotivesAndAlgebraicCyclesPartII (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2278 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The two leads of `scratch/citations.md` resolve: "MotivesAndAlgebraicCyclesPartII Layer 0" is the board package `packages/MotivesAndAlgebraicCyclesPartII/README.md` (line 100, "Layer 0: The Banach arc-site"; §0.4 at line 150), earlier in the merge order; `Huber.GelfandSpectrum` is named by AdicSpacesPartIII §R3.9 on main (its README lines 661 and 12487) and is a supplier's name, correctly attributed. Section headings resolved now, on main or at the open heads: AnalyticStacks §§0.5, 0.6, 0.8, 0.11, 1.6, 1.7, 2.3, 2.11, 3.3, 3.6, 3.8, 4.1–4.5, 5.1, 5.3, 6.3–6.6, 7.2, 7.5–7.7; SchemeAndStackFoundations §§1.21, 5.5; ReductiveGroups Layer 1; RelativeFarguesFontaine §§3.2, 4.7; DiamondsAndVStacks §§D6.4, D6.5; PadicHodgeTheory §§4.4, 7.1 (M(E) at its line 1232); EtaleCohomologyFoundations §0.9; ClassicalAdicEtaleCohomology §§8.2, 9.3; TropicalAndBerkovichArithmetic §§0.17, 0.30 (strict closed subdisc quasi-étale, line 870); AdicSpacesPartIV §F1.7; NoncommutativeAndEquivariantIwasawa §§0.1, 0.2, 0.6, 0.7; LocallyAnalyticRepresentationsOfLocalGroups §§2.3, 3.8; RefinedTraceMethods §§1.10, 4.3; PhiGammaModulesAndIwasawaCohomology §1.4; DerivedModuleAlgebra §0.25; AdicEtaleGeometry §A1.12; FarguesFontaineDiamonds §§F2, F4; ClassicalAdicEtaleCohomologyPartII §5.9; CohomologyComparisons §6.7; PrismaticCohomologyPartII §4.13; PrismaticCohomologyPartIII §6.10; SolidAnalyticRings §1.5; PadicPeriodRings §1.3; RigidAnalyticGeometry §6.2; VectorBundlesAndIsocrystals Layer 2 (both quoted headings, its lines 511 and 549).

**Gaps.** 21, each with one `needs` sentence carrying its hypotheses; unchanged since round 13. AnalyticStacks still hands Gelfand rings, de Rham stacks and prismatization to this roadmap (its README line 21) and maps this roadmap's slugs to its sections (line 1304). `roadmaps grep -i gestalt` returns AnalyticStacks only, which excludes Gestalten (line 22): no owner exists, so the settled reason for the two `none` gaps holds.

**Duplication audit.** `roadmaps grep -i --readme-only` by object: Gelfand ring or stack, analytic prismatization, analytic de Rham stack, derived Berkovich: AnalyticStacks only, as deferrals to this roadmap. Twistor stack, Hyodo–Kato stack, Hodge–Tate stack, δ-space: no roadmap. No folder of this name is on main: not a second copy. `scratch/overlaps.md`: no other pull request changes this roadmap, none drops an id it cites, none of its citations depends on an open revision's numbering.

Overlap check: read AnalyticStacks (scope and consumer note), PrismaticCohomologyPartIII, PrismaticCohomologyPartIV, AInfCohomology and CohomologyComparisons (open; scope sections searched for Hodge–Tate stack, prismatization, twistor, Sen operator: no shared object), PerfectoidSpaces, EnhancedDerivedSheaves and DiamondsAndVStacks (main; suppliers only); shared: analytic stacks, six functors, nuclear modules, Fredholm criteria, Cartier duality, owner AnalyticStacks (consumed through gaps); integral prismatic objects, owner the PrismaticCohomology parts (Checks only); Gelfand rings and stacks, the analytic prismatization and decompletion over Gelfand rings, owner this roadmap.

**Headline theorems** (Summary): 11.6 with 11.1 and 11.4; 11.7; 11.2, 11.5, 11.8; 10.12 with 11.9–11.10; 12.2–12.4; 12.5; 12.6. None is statable at the pins (no analytic rings, Gelfand stacks or Fargues–Fontaine curves as stacks in either library); the package stage says so in the module docstring. The design has no `Suggested.lean`, so there is nothing to probe for padding.

**Principles.** No re-planned roadmap, no upward supply, no algorithm, no sorry'd data or `set_option` (no Lean file). The README does not say it follows a source and no layer is named after a source's chapter.

**Copyright.** Wording: a script compared the text of twenty sections (the fifteen sampled, 10.12, 11.1, 11.3, 12.2, 12.4: statements, proof routes and Checks) with the full texts of ALRS and ABLB. The longest shared runs are 11 words ("with a continuous action of a p-adic Lie group G"; "Perf(U) … is an equivalence") and 10 words ("is cohomologically proper and cohomologically smooth with dualizing complex"; "f … is invertible if and only if its image"): forced statements and formulas. The proof routes of 7.2 and 12.3 give the steps of the source proofs in compressed form in their own sentences (longest run 8 words, a formula). No table, figure or list of examples is taken over. Arrangement: ALRS has 352 of 493 line locators. Its contents against the layers, by number, are as round 14 recorded (Layers 1–3 ↔ ABLB §§3–5 with ALRS §§2.1–2.5; Layer 5 ↔ §§2.8–2.9 and 3.1; Layer 6 ↔ §3.2 with ABLB §6; Layers 8–9 ↔ §4 reordered; Layer 10 ↔ §5; Layers 11–12 ↔ §6): twelve layers against six chapters, not one to one, the parallel runs forced by the Dependencies lines (7 → 8 → 9 → 11 → 12), and Layer 10's free position stated in "How to read the build".

Source independence: 20 sections compared with 2 sources (ALRS, ABLB), none shared; largest share ALRS, 352 of 493 line locators; contents compared with ALRS: independent.

## Not verifiable

- Lean elaboration, the `#check` pass and the one-tactic padding probe: not available (this lane does not elaborate, and the design has no `Suggested.lean`).
- Ownership against open pull requests was checked through `roadmaps grep` by object and by reading the roadmaps of the Overlap check; the other open roadmaps were not read one by one.
- The round-4 repair report that settled the two `none` gaps was not among this round's files; I rely on the round-14 review's record of it and on my own check of its reason.
- The twisted product of 11.1 has no source: it was checked by the computations in the table, not against a text.

## Source issues

- **Error** in ALRS at Remark 6.1.5, printed page 145 (ALRS line 7873): the source says the twistor stack of an unramified K is the product of GSpec(K) with Div¹; it should be the Frobenius-twisted product; affects a stated result.
- **Misprint** in ALRS at Theorem 6.3.2(1)–(2), printed page 150 (ALRS line 8146–8152): the source writes the product of X with K^HT without a base; it should be the fibre product over GSpec(K); affects nothing.
- **Misprint** in ALRS at Theorem 6.5.8(3), printed page 164 (ALRS line 8882): the source applies the upper shriek to the structure sheaf of Y^{Div¹}; it should be that of X^{Div¹}, as its proof concludes; affects nothing.
- **Misprint** in ALRS at Lemma 5.8.8, printed page 139 (ALRS line 7582–7584): the source names the decompletion Y^la and takes Z = BH^la × X^la; they should be X^la and BH^la × X^la/G^la; affects nothing.
- **Misprint** in ALRS at Remark 5.8.6, printed page 139 (ALRS line 7562): the source says the induced GL_n-torsor is the overconvergent neighbourhood of the closed subset; it should be the original torsor that is; affects nothing.
- **Misprint** in ALRS at (1.2.1) and Remark 4.10.15, printed pages 8 and 91 (ALRS line 396, 4693): the source defines Γ_d as a product of locally analytic group stacks and then writes Γ_d^la and Γ_d^cont; Γ_d should be the p-adic Lie group; affects nothing.

## For the human reviewers

- **Scope.** The main sources are unpublished: ALRS (2026, author page), ABLB (arXiv, 2025), RCSolid, RC26a, Gest (notes); 428 of 493 line locators are to ALRS and ABLB. No refereed source states the headline theorems.
- **Licence.** `sources.toml` records ALRS, Gest and Sch24 as author-page copies; no licence is stated on the files.
- **Ownership.** `gestalten-affine-proper` and `gestalten-transmutation` have supplier `none` in `design/plan.json`; no roadmap owns Gestalten (AnalyticStacks README line 22 excludes them).
- **Source correction.** 11.1 states a Frobenius-twisted product in place of ALRS Remark 6.1.5; the corrected form is derived in the roadmap (`design/README.md` line 1739) and appears in no source.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a9c372f0bfa3391006d8a96b4ab456476ce2979b", "job": "REV-DESIGN-RationalAnalyticPrismatization~15", "model": "fable", "worker": "chris-x88"} -->
