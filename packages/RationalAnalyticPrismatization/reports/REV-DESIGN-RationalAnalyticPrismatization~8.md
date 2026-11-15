<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16360#issuecomment-6894888086 -->
Review (claude) of afd57a1

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) 7.2 states the Witt-vector description of 𝒳_T for uniformly perfectoid A; the source proves it for nilperfectoid A

   **Location.** README line 1024 (7.2) and the same `statement` in `plan.json`: "Let A be a uniformly perfectoid Gelfand ring … and that 𝒳_T represents the maps W′(A_{≤1}) → B_{≤1} whose composite to every perfectoid B-algebra factors through D^×_{FF,A^u}".

   **Claim.** The description of 𝒳_T by W′(A_{≤1}) = W(A_{≤1}) ×_{W(A^{u,°})} W(A^{u,°,♭}) holds for every uniformly perfectoid A.

   **Witness.** ALRS line 199 (Remark 1.5) assumes A nilperfectoid, and its argument (ALRS line 206–207) uses the fibre sequence W(Nil†(A)) → W(A_{≤1}) → W(A^{u,°}), valid "since A is nilperfectoid". For A = ℚ_p(μ_{p^∞}) uncompleted (7.2, third Check): Nil†(A) = 0 and A_{≤1} = ℤ_p[μ_{p^∞}] → A^{u,°} is not surjective, so the sequence fails.

   **Repair.** In README and plan 7.2 `statement` write "…, and that for nilperfectoid A the Gelfand stack 𝒳_T represents the maps W′(A_{≤1}) → B_{≤1} …"; add "A nilperfectoid in the Witt-vector description" to plan 7.2 `hypotheses`; add the Check "For the nilperfectoid A = C_p[ε]/ε², A_{≤1} = O_{C_p} ⊕ C_p·ε and W(C_p·ε) → W(A_{≤1}) → W(O_{C_p}) is a fibre sequence, as the description uses; for the uniformly perfectoid, not nilperfectoid A = ℚ_p(μ_{p^∞}) the map A_{≤1} → A^{u,°} is not surjective and the description is not asserted". Tested on both instances: the first satisfies the added hypothesis and the sequence is exact (ε² = 0, Nil† = C_p·ε by 1.2); the second is excluded.

2. **F02** (P2) 10.11 states ALRS Lemma 5.8.8 and Proposition 5.8.9 without their hypotheses and with undefined symbols

   **Location.** README line 1548 (10.11) and plan 10.11 `statement`: "that O(T)^{G-la} = O(T^{st la}) for a decompleted H^la-torsor …, the symmetric double decompletion Y^{H-la}/H^la ≅ GSpec_{|Z|}(O^{(G×H)-la}_Z)/(G × H)^la".

   **Claim.** Both identities hold in the setting of the section's first sentence (X locally classically decompleted, Z a Gelfand stack over X^la/G^la).

   **Witness.** ALRS line 7581–7587: H compact, T → X a G^cont-equivariant H^la-torsor, β_{X,Z} an equivalence for Z = BH^la × X^la. ALRS line 7595–7602: Z carries a (G × H)^cont-action, Y := Z/G^cont is a Berkovich space locally classically decompleted for H^cont, and β_{Y,BG^la} is an equivalence. The README defines neither H, Y nor T^{st la}, and its Z is a stack over X^la/G^la (line 1548, first sentence), a different object; plan `hypotheses` lists none of this.

   **Repair.** Replace the two clauses, in README and plan, by: "that for a compact p-adic Lie group H, a G^cont-equivariant H^la-torsor T → X and β_{X,Z} an equivalence for Z = BH^la × X^la, the G^la-equivariant H^la-torsor T′ → X^la corresponding to T under β_{X,Z} satisfies O(T)^{G-la} = O(T′) as sheaves on |X| (ALRS Lemma 5.8.8, p. 139, ALRS line 7581); that for p-adic Lie groups G and H and a Gelfand stack W with an action of (G × H)^cont such that Y := W/G^cont is a Berkovich space, locally classically decompleted for H^cont with decompletion Y^{H-la}, and β_{Y,BG^la} is an equivalence, Y^{H-la}/H^la ≅ GSpec_{|W|^Betti}(O^{(G×H)-la}_W)/(G × H)^la, and Y^{H-la}/H^la ≅ X^{G-la}/G^la when X := W/H^cont satisfies the same two conditions with G and H exchanged (ALRS Proposition 5.8.9, p. 139, ALRS line 7595)". Add both sets of conditions to plan 10.11 `hypotheses`, and the Check "For G trivial, Y = W and β_{Y,B1} is an equivalence; the formula reads Y^{H-la}/H^la ≅ GSpec_{|Y|^Betti}(O^{H-la}_Y)/H^la, the description of the decompletion in 10.12(3)". Tested on that instance: both sides are the stack of 10.12(3); without condition (1) the left side is undefined.

3. **F03** (P3) 10.10 uses ϖ^ϵ without assuming that Λ contains it

   **Location.** README line 1534 (10.10): "Let Λ be a uniform Banach ℚ_p-algebra with pseudo-uniformizer ϖ … Γ_k acting trivially on A_n/ϖ^{ϵ_{n,k}} … ϖ^{ρ_{n,k}}-torsion".

   **Claim.** The axioms are stated for every uniform Banach algebra with a pseudo-uniformizer.

   **Witness.** ALRS line 6848–6851: ϖ^ϵ is assumed to exist in Λ for all ϵ ∈ ℚ (a dense subset suffices), and every radius is of the form |ϖ^ϵ|. For Λ = ℚ_p, ϖ = p and ϵ_{n,k} = p^{k−n} (the third Check) the element p^{1/p} is not in Λ.

   **Repair.** After "with pseudo-uniformizer ϖ" add "such that ϖ^ϵ exists in Λ for every ϵ in a dense subset of ℚ containing the exponents ϵ_{n,k}, ρ_{n,k} (ALRS line 6848), with the norm |−|_ϖ of 10.4"; mirror in plan 10.10 `statement` and `hypotheses`. Tested: in the third Check, B_I contains ϖ^{1/p^n} with |q^{1/p^n} − 1| = |ϖ^{1/p^n}| (ALRS line 7334), so ϵ_{n,k} = p^{k−n} and ρ_{n,k} = p^{k−n−1} are admissible.

4. **F04** (P3) a Check of 11.1 gives D_HT(V) as the derived pushforward

   **Location.** README line 1598 (11.1, third Check): "The pushforward of E_V|_{X^HT} along X^HT → BG_m gives D_HT(V) as a graded K-vector space".

   **Claim.** The (derived, by the Conventions) pushforward is D_HT(V).

   **Witness.** ALRS line 7889: it is H⁰ of the pushforward. For V = ℚ_p the weight-0 part of the pushforward is RΓ(X^HT, O) = K ⊕ K[−1] by the first Check of 11.2 (H⁰ = H¹ = K), not D_HT(ℚ_p) = K.

   **Repair.** "H⁰ of the pushforward of E_V|_{X^HT} along X^HT → BG_m is D_HT(V) as a graded K-vector space, up to the sign convention of the grading (ALRS Example 6.1.7(1)); the pushforward itself also has H¹, for V = ℚ_p the class of 11.2 in weight 0". Mirror in plan 11.1 `tests`. Tested on V = ℚ_p: H⁰ = K = D_HT(ℚ_p).

5. **F05** (P3) a Check of 10.11 misreads ALRS Remark 5.8.6

   **Location.** README line 1558 (10.11, third Check): "A G^la-torsor over a Berkovich space need not be a Berkovich space: for G = GL_n(ℤ_p), Y ×_{GL_n(ℤ_p)^la} GL_n is the overconvergent neighbourhood of a closed subset".

   **Claim.** A counterexample exists, and the induced GL_n-torsor is an overconvergent neighbourhood.

   **Witness.** ALRS line 7559–7564: it is not known whether Y is a Berkovich space; Z = Y ×^{GL_n(ℤ_p)^la} GL_n is a Berkovich space, and Y is the overconvergent neighbourhood of |Y| in Z (the source's last clause prints Z for Y). For the trivial torsor over a point, Z = GL_n, not a neighbourhood of a closed subset of itself other than the whole space.

   **Repair.** "It is not known whether a G^la-torsor Y over a Berkovich space is a Berkovich space: for G = GL_n(ℤ_p) the induced GL_n-torsor Z = Y ×^{GL_n(ℤ_p)^la} GL_n is one, and Y is the overconvergent neighbourhood of the closed subset |Y| ⊆ |Z| (ALRS Remark 5.8.6), so Lemma 5.8.5 asserts only !-local affineness". Mirror in plan `tests`. Tested on the trivial torsor over a point: Z = GL_n and Y = GL_n(ℤ_p)^la, the overconvergent neighbourhood of GL_n(ℤ_p) in GL_n.

6. **F06** (P3) the proof route of 8.5 calls 𝒳_T classical where 7.2 thickens it

   **Location.** README line 1187 (8.5, proof route): "then use that 𝒳_T is classical over (0, 1/p) ∪ (1/p, ∞) up to Frobenius".

   **Claim.** 𝒳_T has no thickening over (1/p, ∞).

   **Witness.** 7.2 (line 1024): the n-th copy of T lies at radius p^n, n ≥ 0, so the radii 1, p, p², … in (1/p, ∞) are thickened. ALRS line 3347–3352: Frobenius gives 𝒳_{T,(1/p,∞)} ≅ 𝒳_{T,(1,∞)} and 𝒳_{T,(0,1/p)} ≅ 𝒳_{T,(0,1)}, and the disc is reduced over (0, 1).

   **Repair.** "then use that Frobenius induces isomorphisms 𝒳_{T,(1/p,∞)} ≅ 𝒳_{T,(1,∞)} and 𝒳_{T,(0,1/p)} ≅ 𝒳_{T,(0,1)}, and that 𝒳_T agrees with D^×_{FF,T♭} over (0, 1), its thickenings lying at the radii p^n, n ≥ 0 (7.2)". Tested on A = C_p[ε]/ε²: the thickened points at p^n map to those at p^{n+1}, all of which lie in (1, ∞), and none lies in (0, 1).

7. **F07** (P3) three supplier identifiers exist nowhere

   **Location.** README line 162: "(§LR.2, derived-analytic-vectors) … (§LR.3, solid-analytic-vectors)", repeated in the fourth Check of 10.3 (line 1440); line 163 and the first Check of 11.1 (line 1596): "(§1.4, cyclotomicDecompletionEquivalence)".

   **Claim.** The suppliers define targets with these names.

   **Witness.** `roadmaps grep` finds none of the three on main or at any open head. LocallyAnalyticRepresentationsOfLocalGroups (board package README, lines 142–148) maps LR.2 → Layer 2 and LR.3 → Layer 3, with "### 2.3 Pan's derived functors of locally analytic vectors" (line 581) and "### 3.8 Locally analytic vectors of solid representations" (line 766). PhiGammaModulesAndIwasawaCohomology at its head has "### 1.4 Extended descent and arbitrary-module decompletion" and no declaration of that name.

   **Repair.** Cite sections only: "LocallyAnalyticRepresentationsOfLocalGroups §2.3 (R^iLA of a Banach representation) and §3.8 (locally analytic vectors of solid representations)", "PhiGammaModulesAndIwasawaCohomology §1.4 (cyclotomic decompletion between ordinary and extended Robba (φ, Γ)-modules)", in the contract list, the two Checks, the Scope paragraph and the plan's supplier `sections`. Tested: all three headings resolve at the heads named.

8. **F08** (P3) AnalyticStacks is cited for a sentence it does not contain

   **Location.** README line 11: "(AnalyticStacks leaves them to a roadmap of their own)"; line 172: "AnalyticStacks leaves Gestalten … to a roadmap of their own placed after it (AnalyticStacks, Scope and ownership)".

   **Claim.** AnalyticStacks' Scope says Gestalten belong to a separate roadmap placed after it.

   **Witness.** AnalyticStacks at its open head, README line 23: Gestalten with their n-affine, n-proper maps and transmutation "are a different theory and are outside this roadmap"; no roadmap is named or placed.

   **Repair.** Line 11: "(AnalyticStacks places them outside its scope)"; line 172: "AnalyticStacks places Gestalten, their n-affine and n-proper maps and the transmutation of six-functor formalisms outside its scope (AnalyticStacks, Scope and ownership), and no roadmap states them". Tested against the quoted line.

9. **F09** (P3) LaTeX macro `\hat{…}` in four places

   **Location.** README lines 582 (3.1 route, "\hat{Marc(A^u)}"), 946 (6.2 statement), 959 (6.2 Check, "\hat{FF^⋄_X}"), 1026 (7.2 route, "\hat{T^{u,⋄}}"), and the same strings in `plan.json`.

   **Claim.** House style: mathematics in Unicode, no LaTeX.

   **Witness.** 2.8 introduces the left adjoint as "X ↦ X̂"; the four passages use a TeX macro for the same functor on compound arguments.

   **Repair.** In 2.8 write "its left adjoint X ↦ X̂, also written X^∧ on compound expressions", and replace the four macros by (Marc(A^u))^∧, (FF^⋄_X)^∧ and (T^{u,⋄})^∧. Tested: `grep -c '\\hat'` on README and plan returns 0 after the change.

10. **F10** (P3) scope and one layer are described by a source's section numbers

   **Location.** README line 7: "This roadmap owns the Gelfand-stack foundations of ABLB §§2–6 … (Layers 1–6), the theory of ALRS §§2–6 and Appendix A (Layers 4–12), and the decompletion theory of ALRS §5 … (Layer 10)"; line 218: "Layer 10 is the decompletion theory of ALRS §5"; lines 17 and 410: "as in ALRS from §2.4 onwards".

   **Claim.** The organisation is the roadmap's own.

   **Witness.** The principle "a roadmap does not say it follows a source". The layers themselves do not map one to one (Layers 4–5 draw on ALRS §§2.6–2.9, 3.1 and Appendix A; Layers 8–9 both on §4; 11–12 both on §6); only these sentences tie layers to chapters.

   **Repair.** Line 7: "This roadmap owns Gelfand analytic geometry over ℚ_p (Layers 1–6: Gelfand rings and stacks, derived Berkovich spaces, de Rham stacks, deformation theory, cones, Fargues–Fontaine and Hyodo–Kato stacks), the rational analytic prismatization with its twistor and Hodge–Tate stacks (Layers 7–9, 11–12) and the decompletion of semilinear representations over Gelfand rings by locally analytic vectors (Layer 10)". Line 218: "Layer 10 is the decompletion theory; it depends only on Layers 1–7 and is placed before its first use in Layer 11". Lines 17 and 410: drop the clause about ALRS §2.4 (the locator ALRS line 662 stays). Tested: the dependency lines are unchanged (10.x `*Needs:*` name only Layers ≤ 7 and suppliers).

11. **F11** (P3) two ranges dropped from definitions

   **Location.** README line 1422 (10.3): "G_{<r} = ⋃_{r′<r} G_{r′} and G_{≤r} = ⋂_{r′>r} G_{r′}", "define Rep^{<r} and Rep^{≤r}" and the statement of ALRS Lemma 5.2.12, with r ∈ (0, 1] ∩ ℚ the only range given; line 787 (4.6): "fib(Y(R ⊕ M) → …) ≅ τ_{≥0}Hom_R(η^*L_{Y/X}, M) naturally".

   **Claim.** G_{≤r} is defined for r = 1; the cotangent complex corepresents the fibre for all M.

   **Witness.** ALRS line 5110–5112, 5163, 5169: G_{≤r}, Rep^{<r}, Rep^{≤r} and Lemma 5.2.12 are for r ∈ (0, 1); at r = 1 the intersection over r′ > 1 has no terms G_{r′}. ALRS line 9570–9576: all η: GSpec(R) → Y and all connective M.

   **Repair.** 10.3: "G_{<r} = ⋃_{r′<r} G_{r′} for r ∈ (0, 1] and G_{≤r} = ⋂_{r′>r} G_{r′} for r ∈ (0, 1)", and "for r ∈ (0, 1)" before the definitions of Rep^{<r}, Rep^{≤r} and the statement of Lemma 5.2.12. 4.6: "for every η: GSpec(R) → Y and every connective M ∈ D_{≥0}(R), naturally in M". Mirror in plan. Tested: for G = ℤ_p, r = 1/p, G_{≤1/p} = ⋂_{r′>1/p} G_{r′} is the overconvergent disc of radius 1/p with its translates; r = 1 is excluded.

Eleven findings, two blocking (P2). All ten round-7 findings are repaired. Both blocking findings are in text that no earlier round checked against the source with computed values (7.2 and 10.11, both in this round's seeded sample); neither re-raises a settled finding. Files reviewed: `packages/RationalAnalyticPrismatization/design/README.md` (1871 lines, 12 layers, 88 targets, 21 declared gaps), `packages/RationalAnalyticPrismatization/design/plan.json`, `packages/RationalAnalyticPrismatization/sources.toml`. No file of the design was changed, nothing was added to the manifest and no `needs-references.toml` was written.

## Verified sound

**Round-7 ledger.**

| Finding | State | Repaired passage read at this head |
|---|---|---|
| R01 (P2) 1.2 overconvergence | repaired | line 248: "power series overconvergent on the closed polydisc of radius r: … some r′ > r has |a_n| r′^n → 0 (ABLB Definition 2.2.3 …)"; Check at line 267 |
| R02 (P2) 1.2 bounded A | repaired | line 248: "For bounded A, Nil†(A) is an ideal of A (RC24 Proposition 2.6.9(3) …); define the †-reduction of a bounded A …"; API lines 257–258; negative Check line 268 |
| R03 (P2) 9.2 vector bundle | repaired | line 1254: "for X → D formally smooth with T_{X/D} a vector bundle, T^†_{X/D} its overconvergent neighbourhood of the zero section" (twice); Check X = D × BG_a |
| R04 (P2) 11.10 | repaired | line 1718: "for G compact, X̃^⋄ → X^⋄ a profinite étale Galois extension with group G, X̃ → X the associated G^sm-torsor and β̃ … then β̃ is 0-affine … GSpec_{|X̃|^Betti}(O^la_{X̃̂^⋄})/G^la" |
| R05 (P3) monadicity | repaired | line 62 "the Barr–Beck–Lurie monadicity theorem (§E5:abstract.5)"; 10.1 `*Needs:*`; EnhancedDerivedSheaves on main line 1570 "### E5:abstract.5 Monadicity" |
| R06 (P3) pins and lines | repaired | all 20 cited declarations opened at the pins of `lake-manifest.json` (Mathlib `1b1ccf4b…`, Tau Ceti `2fd255d9…`): `LightProfinite` Basic.lean:44, `LightCondensed` :29, `MulRingSeminorm` :61, `spectralNorm` :381, `WittVector` :52, `fontaineTheta` :166, `BDeRhamPlus` :75, `PadicComplex` :137, `TauCeti.LocallyAnalytic` :45 and `.eval` :85, `spaY` Y.lean:116, `frobeniusHomeomorph` :220, `IsRadiusLowerBound`/`IsRadiusUpperBound` Window.lean:102/:108, `isRadiusLowerBound_comap_frobenius_iff` :149, `windowU`/`windowV` :260/:267, `spaX` Quotient.lean:59, `compactSpace_spaX` :259, `t0Space_spaX` :271. `spaY` is a `Set (Spv (WittVector p R))` under `[TopologicalSpace (WittVector p R)]`, as the contract says |
| R07 (P3) 2.8 locator | repaired | line 547: "ABLB Lemma 4.5.1, p. 51, ABLB line 2690" |
| R08 (P3) 7.3 T_{FF} | repaired | line 1039: "the perfect analytic δ-stack T_{FF}: (S, 𝒳) ↦ T(𝒳/φ^ℤ), defined on perfect δ-spaces only"; ALRS line 2651–2659 |
| R09 (P3) 12.1 | repaired | line 1744: "Berkovich-smooth maps, in particular rigid smooth maps, are locally †-l.c.i."; Check closed versus open disc, ALRS line 1351–1362 |
| R10 (P3) | repaired | 10.4: "|p|_ϖ ≤ 1/2" twice; 12.1 route: "the equivalence of (a) and (b) in ALRS Definition 6.5.2(1)" |

The citation moved by the repair outside the findings (10.3, 10.4: NoncommutativeAndEquivariantIwasawa §§0.1, 0.2, 0.6, 0.7) resolves at that roadmap's open head: "### 0.1 Constant lower-p-series indices", "### 0.2 Compact p-adic analytic groups", "### 0.6 Ordered coordinates of a uniform group", "### 0.7 Finite-rank p-valuations and the explicit valuation of a uniform group".

**Sources, seeded sample** (no locator is flagged unverified by the author; every page number below agrees with the page markers of the cached text).

| Target | Read | Result |
|---|---|---|
| 1.7 | ABLB 1722–1733, 1828–1844; And21 2681–2699, 2733–2790 | match (And21 Theorem 5.50 and Lemmas 5.48–5.51 as described; ABLB Proposition 3.3.5 for bounded affinoid algebras) |
| 2.6 | ABLB 2295–2334, 2384–2388; ALRS 894–924, 1351–1362 | match |
| 2.7 | ALRS 937–989 | match |
| 4.6 | ALRS 9552–9617 | match; quantifier R11 |
| 5.2 | ALRS 1712–1758, 1762–1782, 1805–1856 | match |
| 5.4 | ALRS 2195–2287 | match |
| 7.2 | ALRS 197–207, 2501–2542, 2634–2647 | R01; the rest matches |
| 8.5 | ALRS 3287–3371 | match; route R06 |
| 9.1 | ALRS 3413–3515 | match |
| 10.1 | ALRS 4807–4853 | match |
| 10.3 | ALRS 5086–5200 | match; ranges R11 |
| 10.10 | ALRS 6847–6882, 6926–6941, 7336–7348, 7371–7417 | match; R03 |
| 10.11 | ALRS 7454–7480, 7511–7520, 7555–7660 | R02, R05; Lemmas 5.8.1, 5.8.2, 5.8.5 and Proposition 5.8.10 match |
| 11.1 | ALRS 7753–7777, 7881–7909 | match; Check R04 |
| 11.2 | ALRS 7789–7828, 7862–7874 | match |

**Adversarial table** (computed values).

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 1.2 (repaired) | r = 0, 1; ℚ_p⟦T⟧[1/T]; ℚ_p[ε]/ε² | germ ring → A sends T ↦ T; Σ p^{k(n+1)}T^{−k} is an infinite Laurent tail, so the ring is unbounded; T unit in Nil†, 1 ∉ Nil†; Nil† = ℚ_p·ε | holds |
| 1.6 Checks | A = ℚ_p⟨T⟩, loci {|T| ≤ 1}, {|T| ≤ |p|}, {1 ≤ |p|} | A itself (T ∈ A_{≤1}); colim_{r>1/p} ℚ_p⟨T/r⟩ ≠ ℚ_p⟨T/p⟩; 1 = p·T gives the zero ring | holds |
| 1.7 | ℚ_p; ℚ_p × ℚ_p; ℚ_p[ε]/ε² | perfect complexes; ranks (m, n) independent; ℚ_p = B/ε has the infinite resolution ⋯ →^ε B →^ε B | holds |
| 2.6 | open disc; Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩) and its compactification; ℚ_p⟨T⟩_{≤1} | partially proper, embedded; same stack GSpec(ℚ_p⟨T⟩); same M, different stack, Berkovich-smooth (ALRS line 1360) | holds |
| 2.7 | A = ℚ_p[u^{±1}], |u| = 2; A = O_X | u·u^{−1} = 1 with u^{−1} ↦ π_{−2}(R) = 0 forces R = 0: GSpec_X(A) = ∅; X | holds |
| 4.6 | A¹; 0 → A¹; (A¹)^dR | L = O·dT, dual connective; L = ℚ_p[1], dual ℚ_p[−1] not connective; L = 0 with O·dT ≅ dual of Lie G_a^† | holds |
| 5.2 | X = S = GSpec(ℚ_p), M = ℚ_p; Y = D | Sqz = τ_{≥0}Hom(0, M[1]) = point, extension ℚ_p[ε]/ε²; T_{D/D} = 0, trivial torsor, section D(1) | holds |
| 5.4 Div¹_{A¹} ≅ A¹/G_m^† | square (3.1.1) | A^{1,dR} ×_{(A¹/G_m)^dR} A¹/G_m = (A¹ × G_m^dR)/G_m = A¹/ker(G_m → G_m^dR) = A¹/G_m^† | holds |
| 7.2 Witt description | C_p[ε]/ε²; ℚ_p(μ_{p^∞}) | fibre sequence exact; A_{≤1} → A^{u,°} not surjective | R01 |
| 7.2 radius | n-th copy of T | κ(φ^n ∘ f) = p^n·κ(f) = p^n, with κ = log|[ϖ]|/log|p| = 1 at the untilt (Conventions) | consistent |
| 8.5 | 𝒳_T over (1/p, ∞); Hodge–Tate locus | contains the thickened radii 1, p, p², …; reciprocal radius: p^n ↦ p^{−n} | route R06; statement holds |
| 9.1 | X = pt; X = A¹; Y = GSpec(C_p) | T = 0, π the identity; band G_a^†{1}; C_p ⊗ ℚ_p(μ_{p^∞}) = C^sm(Γ, C_p), so Y × Q_p^HT = Γ^sm/Γ^la = BΓ^† = BG_a^†, and T_Y[1]{1} = C_p(−1){1} = O | holds |
| 9.2 (repaired) | X = D; X = D × BG_a | D; T{1}[2] = O{1}[3], loops O{1}[2] = B²G_a^†{1}, excluded | holds |
| 10.1 | Π = 1; ℤ/2 on ℚ_p × ℚ_p | R; crossed product of dimension 4 with [g]e_1 = e_2[g], M_2(ℚ_p); untwisted ℚ_p⁴ commutative | holds |
| 10.3 | G = ℤ_p, r = 1; (1 + p)^a | G_{≤1} has no defining terms; Mahler coefficients p^n, p^{−n}r^n → 0 for r < p (also for p = 2 and r < 2) | R11; Check holds |
| 10.4 (repaired) | ϖ = p^{1/2}; ϖ = p²; Σ p^k binom(a, p^k) | 1/4; 2^{−1/2} > 1/2; p^{−k}r^{p^k} → ∞ | holds |
| 10.10 | Λ = ℚ_p, ϖ = p; toric tower | p^{1/p} ∉ Λ; (γ^{p^k} − 1)T^{p^{−n}} = (q^{p^{k−n}} − 1)T^{p^{−n}}, ϵ = p^{k−n} > ρ = p^{k−n−1} > 0 | R03; axioms consistent |
| 10.11 Proposition 5.8.9 | G = 1 | both sides the stack of 10.12(3) | R02 (hypotheses) |
| 10.11 third Check | trivial torsor over a point | Z = GL_n; Y = GL_n(ℤ_p)^la | R05 |
| 11.1 | reduction to K = ℚ_p; V = ℚ_p | FF_{Q_p^⋄} = FF_{ℚ_p^cyc}/ℤ_p^{×,cont} → FF^la/ℤ_p^{×,la} is h of 10.12; weight-0 pushforward K ⊕ K[−1] ≠ D_HT | statement holds; R04 |
| 11.2 | n = 0; n ≠ 0; sign −1 | K →^0 K: H⁰ = H¹ = K, H² = 0; n invertible, 0; cohomology unchanged, weight of C_p(1) becomes −1 | holds |
| 11.10 (repaired) | K_∞ = K(μ_{p^∞}), G = Γ compact | |X̃| a point, GSpec(K(μ_{p^∞}))/Γ^la, as Proposition 6.4.10 | holds |
| 12.1 (repaired) | closed disc; open disc; cusp | not Berkovich-smooth; ⋃_n {|T| ≤ p^{−1/n}}; k[1] →^{0} k²[1] gives L_{k/R} = k²[1] ⊕ k[2] | holds |

The headline rows of rounds 6–7 (11.2, 11.4, 11.6, 11.7, 12.2–12.6) carry computed values and their text is unchanged.

**Structure (scripted).** 88 targets (16 definitions, 14 constructions, 58 theorems); every definition and construction has an API list and at least three Checks; every plan statement, API bullet and test occurs verbatim in the README (0 missing); every target has a locator; 21 gaps with the same slug and the same `needs` sentence in plan and README; manifest: 24 entries, all `certified`, each in References. Policy grep (LaTeX delimiters, process words, pull-request numbers, machine paths, `set_option`, HTML): no hit other than R09; "lemma" twice, in a named source lemma and "Poincaré lemma".

**Principles.** No re-planned roadmap, no upward supply, no algorithm, no copied passage; the wording of scope is R10. No Lean file exists at the design stage.

**Duplication audit.** `roadmaps grep` by object over main and the open heads: "Gelfand ring/stack", "analytic prismatization", "analytic de Rham stack" occur only in AnalyticStacks, in the Scope lines that assign them to this roadmap; "Hodge–Tate stack" and "Hyodo–Kato stack" occur nowhere; "twistor" only in complex-geometric roadmaps (MixedHodgeModulesAndIrregularHodgeTheory, K3Surfaces); "decompletion" and "Tate–Sen" in PhiGammaModulesAndIwasawaCohomology, PadicPeriodRings, PadicHodgeTheory and CohomologyComparisons, for (φ, Γ)-modules and classical towers, which 10.10 and 11.1 cite as inputs and comparisons. Locally analytic vectors of Banach and solid representations are LocallyAnalyticRepresentationsOfLocalGroups Layers 2–3, compared in Checks; the semilinear theory on Gelfand stacks is owned here. Overlap facts: no pull request changes this roadmap, drops an id it cites or defines one it cites only in a revision.

Overlap check: read AnalyticStacks, PrismaticCohomologyPartII, PrismaticCohomologyPartIII, EnhancedDerivedSheaves, DiamondsAndVStacks (scope or cited sections); nothing shared: analytic stacks, their six functors and Cartier duality are AnalyticStacks' (consumed through gaps), Gelfand rings and stacks and the analytic prismatization are this roadmap's (AnalyticStacks, Scope), the integral Hodge–Tate divisor, Sen operator and prismatic logarithm are PrismaticCohomologyPartII §§4.12–4.13 and PartIII §6.10 (Checks only).

**Supplier order.** Gate output:

```
candidate: RationalAnalyticPrismatization is not in the merge order yet; checked as if placed after MotivesAndAlgebraicCyclesPartII (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2252 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Sections resolved this round at main or the open head: EnhancedDerivedSheaves §E5:abstract.2, §E5:abstract.5; AdicSpacesPartIII §R3.9 (`Huber.GelfandSpectrum`, README lines 661 and 12470–12487; the `roadmaps resolve` lead is a planned name, cited as such); MotivesAndAlgebraicCyclesPartII §BM.0 (board package, earlier in the merge order); TropicalAndBerkovichArithmetic §§0.1, 0.7, 0.8, 0.11, 0.13, 0.15, 0.17, 0.19; SolidAnalyticRings §1.5; PadicPeriodRings §§1.3–1.4; PadicHodgeTheory §§2.2, 2.3, 4.4, 7.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.2; AInfCohomology §AI.3.1; LocallyAnalyticDistributions §0.1; PrismaticCohomology §1.5; PrismaticCohomologyPartII §§3.9, 4.12, 4.13; PrismaticCohomologyPartIII §6.10; CohomologyComparisons §6.7; ClassicalAdicEtaleCohomology §§8.2, 9.3; ClassicalAdicEtaleCohomologyPartII §5.9; PhiGammaModulesAndIwasawaCohomology §1.4; NoncommutativeAndEquivariantIwasawa §§0.1, 0.2, 0.6, 0.7. The names that do not resolve are R07.

**Gaps.** Nineteen gaps name a supplier (eighteen AnalyticStacks, one DiamondsAndVStacks §D6.5); each `needs` sentence names one deliverable with its hypotheses. `gestalten-affine-proper` and `gestalten-transmutation` have supplier `none`; they were settled as not actionable in this package in the round-4 repair (Gestalten have no owner; a board decision), the reason still holds (AnalyticStacks line 23 places them outside its scope; `roadmaps grep -i gestalt` finds no other roadmap), so they are not raised. An acceptance would be conditional on that decision.

**Headline theorems** (Summary): 11.6 with 11.1 and 11.4; 11.7; 11.2, 11.5, 11.8; 10.12 with 11.9–11.10; 12.2–12.4; 12.5; 12.6. None is statable at the pins (no analytic rings, Gelfand stacks or Fargues–Fontaine curves as stacks in the pinned Mathlib or Tau Ceti); the package stage says so in the module docstring.

**Copyright.** Fifteen sampled statements and eight further passages (the proof routes of 1.7, 2.7, 8.5, 11.1, the Checks of 9.1, 10.4, 12.1 and the Conventions on radius) were set beside ALRS, ABLB and And21 at their locators: the longest shared runs are formula-bound ("base change along K(ζ_{p^∞}) → C_p of the", 8 words; "refined by an open cover", 5 words); no sentence, list or proof plan is reproduced. Arrangement against ALRS (section headings read at the cited lines): Layers 1–3 are built from ABLB §§2–4; Layer 4 ↔ ALRS §§2.6–2.7 with Appendix A; Layer 5 ↔ §§2.8–2.9, 3.1; Layer 6 ↔ §§3.2–3.3; Layer 7 ↔ §§3.4–3.5; Layers 8–9 ↔ §4; Layer 10 ↔ §5 (with the main theorem last, first in the source); Layers 11–12 ↔ §6. The map is not one to one and Appendix A is moved before its uses; the order 7 → 8 → 9 → 11 → 12 is forced by the `*Needs:*` lines (8.x need 7.2–7.4; 9.1 needs 8.6; 11.1 needs 9.7 and 10.12), and Layer 10 needs only Layers 1–7 and must precede 11. No table, figure or example list is taken over.

Source independence: 23 passages compared with 3 sources, none shared; largest share ALRS, 782 of 1167 source mentions; contents compared with ALRS: independent (the wording of scope by section numbers is R10).

## Not verifiable

- Lean elaboration, the `#check` pass and the one-tactic padding probe: not available (this lane does not elaborate, and the design has no `Suggested.lean`).
- Ownership against open pull requests was checked by object through `roadmaps grep` and by reading the roadmaps named in the Overlap check at the cited sections; the remaining open roadmaps were not read.
- R01 and R02 have no computed counterexample to the statements as written: the witnesses are the source's hypotheses and, for R01, the failure of the step its proof uses.
- Targets outside the sample and outside the repaired passages rest on the tables of rounds 1–7. The supplier sections of VectorBundlesAndIsocrystals, RelativeFarguesFontaine, FarguesFontaineDiamonds, RefinedTraceMethods, AnalyticStacks, DerivedModuleAlgebra, SchemeAndStackFoundations, ReductiveGroups, AdicEtaleGeometry, AdicSpacesPartII, AdicSpacesPartIV, RigidAnalyticGeometry, PerfectoidSpaces and EtaleCohomologyFoundations were resolved in round 7 and not re-read.
- BC16 Théorème 3.2 (10.10, second Check) was located (BC16 line 397) and not read in full.

## Source issues

- **Misprint** in ALRS at Remark 5.8.6, printed page 139 (ALRS line 7562): the source says the induced GL_n-torsor Z is the overconvergent neighbourhood of |Y| in Z; it should be the torsor Y that is this neighbourhood; affects nothing.
- **Misprint** in ALRS at Example 2.8.12(1), printed page 32 (ALRS line 1725): the source introduces a connective module N and then writes M for it throughout; it should use one letter; affects nothing.
- **Misprint** in ALRS at Proposition 4.2.13, proof, printed page 64 (ALRS line 3353): the source writes the first Frobenius isomorphism with target 𝒳_{T,(0,p)}; it should be X^Δ_{(0,p)}, as in the statement; affects nothing.
- The misprints and the gap recorded in round 7 (ALRS Theorem 6.5.8(3); §3.2, p. 45; §2.3, p. 19; Lemma A.2.5(3); Proposition A.2.15(1); Remark 4.4.5) stand as recorded there.

## For the human reviewers

- **Scope.** The main sources are unpublished: ALRS (2026, author page), ABLB (arXiv 2510.15196), RCSolid (arXiv 2603.03012), RC26a (arXiv 2512.24967) and Gest (lecture notes, author page); 963 of 1167 source mentions are to ALRS and ABLB. No refereed source states the headline theorems.
- **Licence.** `sources.toml` records ALRS and Gest with `licence_class = "author-page"` (a personal page at an institute); no licence is stated on the files.
- **Ownership.** The contracts `gestalten-affine-proper` and `gestalten-transmutation` have no supplier (README line 172); whether a Gestalten roadmap is created is a board decision, and any acceptance is conditional on it.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "afd57a15128aeba41d1528b9c6544240955ab611", "job": "REV-DESIGN-RationalAnalyticPrismatization~8", "model": "fable", "worker": "chris-x80"} -->
