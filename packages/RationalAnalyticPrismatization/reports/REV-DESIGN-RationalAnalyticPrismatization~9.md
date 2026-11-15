<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16360#issuecomment-6895587974 -->
Review (claude) of dcdf114

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) a Check of 5.4 separates A¹/Ĝ_m from A¹/G_m^† by vector bundles, which do not separate them

   **Location.** README line 907 (5.4, third Check) and the same test in `plan.json`: "Vector bundles on A¹/G_m^† are vector bundles on A¹ with a T-connection whose operator T∂_T integrates …; vector bundles on A¹/Ĝ_m are all T-connections, so A¹/Ĝ_m and A¹/G_m^† differ."

   **Claim.** The two stacks have different categories of vector bundles.

   **Witness.** ALRS line 2263–2271 (Remark 3.1.6): pullback along A¹/Ĝ_m → A¹/G_m^† is fully faithful, its image is cut out by convergence of T∂_T, and for vector bundles that condition is automatic. So the vector bundles agree.

   **Repair.** Replace the Check, in README and plan, by: "Vector bundles on A¹/G_m^† are vector bundles on A¹ with a T-connection, a connection with a logarithmic singularity at 0 (ALRS Remark 3.1.6, ALRS line 2263). Pullback along A¹/Ĝ_m → A¹/G_m^† is fully faithful, sheaves on A¹/Ĝ_m being all T-connections and the essential image those on which T∂_T converges as a holomorphic function on A¹. Every vector bundle satisfies this, so the two stacks have the same vector bundles and differ on larger sheaves: on the skyscraper at T = 0 with fibre ℚ_p[θ], T acting by 0 and T∂_T by multiplication by θ, the entire series Σ_n p^{n²}θ^n does not act." Tested: |p^{n²}| r^n → 0 for every r, so the series is entire, and Σ_n p^{n²}θ^n·1 is not a polynomial; on a line bundle with T∂_T = c the series Σ_n p^{n²}c^n converges.

2. **F02** (P3) 10.3 states ALRS Lemma 5.2.10(1)–(2) for compact G only; later sections use it for non-compact G

   **Location.** README line 1423 (10.3): "Let G be a compact p-adic Lie group … Prove: BG^cont → BG^la is 0-proper with pushforward of O equal to O … Ψ … is fully faithful with a linear right adjoint, which for compact G is (−)^la".

   **Claim.** The 0-properness of BG^cont → BG^la and the right adjoint of Ψ are stated under the standing compactness of 10.3.

   **Witness.** ALRS line 5137–5142: parts (1) and (2) are for a not necessarily compact G; only (3) assumes compactness. The second Check of 10.6 (line 1489) invokes "O^la = O by 10.3" for an arbitrary p-adic Lie group, and 9.7 and 11.9 use ℚ_p^{×,la} and BG^la for general G.

   **Repair.** In 10.3, README and plan, after the definition of M^la write: "Prove, for every p-adic Lie group G, not necessarily compact, with G^la the group of the Conventions (for a compact open subgroup G_c, G^la = ⊔_{g ∈ G/G_c} g·G_c^la): BG^cont → BG^la is 0-proper with pushforward of O equal to O, so pullback is fully faithful, and Ψ: D(BG^la) → Rep^■_{ℚ_p}(G) is fully faithful with a D(BG^la)-linear right adjoint (ALRS Lemma 5.2.10(1)–(2), p. 98, ALRS line 5137); for compact G, Ψ^R followed by pullback along GSpec(ℚ_p) → BG^la is (−)^la, so the essential image of Ψ is the category of locally analytic representations (ALRS Lemma 5.2.10(3))." Add "G compact for (−)^la, Rep^{<r}, Rep^{≤r} and ALRS Lemma 5.2.12; arbitrary for Lemma 5.2.10(1)–(2)" to the plan hypotheses, and the Check: "For the discrete group G = ℤ, a non-compact p-adic Lie group of dimension 0, G^cont = G^la = G^sm = ⊔_ℤ GSpec(ℚ_p), BG^cont → BG^la is the identity and Ψ is the equivalence of D(Bℤ) with solid ℤ-representations; (−)^la is not formed, G not being compact." Tested on the instance that uses the wider statement: the second Check of 10.6 with G = ℚ_p^× now cites a statement of 10.3 that covers it.

3. **F03** (P3) three supplier identifiers exist nowhere

   **Location.** README line 926 (6.1, route): "(RelativeFarguesFontaine §2.2, diamondFormulaAndMapToBase)"; lines 9, 134 and 1825: "the functor associatedLocalSystem of PadicHodgeTheory §7.1"; lines 1616–1617 (11.2 Checks): "the Sen operator senOperator of PadicHodgeTheory §4.4"; the same strings in `plan.json`.

   **Claim.** The suppliers define targets with these names.

   **Witness.** `roadmaps grep --fixed` finds `diamondFormulaAndMapToBase` nowhere; `associatedLocalSystem` only in ClassifyingSpaces; `senOperator` only as `Prismatic.WCart.senOperator` in PrismaticCohomologyPartII. The suppliers' open heads have "### 2.2 Period diamonds and the topological map to the base", "### 4.4 Sen and differential de Rham realizations" and, in §7.1, "the associated local system `M(E)`".

   **Repair.** Cite sections and describe the object: "(RelativeFarguesFontaine §2.2, the diamond formula)"; "Scholze's associated local system functor E ↦ M(E) of PadicHodgeTheory §7.1" in Scope, the contract paragraph and 12.6; "the Sen operator of PadicHodgeTheory §4.4" twice in 11.2. Mirror in the plan's statements, tests and supplier `what`. Tested: all three headings resolve at the heads named and no camel-case supplier identifier remains except `isDescendable_colimit_of_uniformIndex`, which EnhancedDerivedSheaves defines (its README line 1825).

4. **F04** (P3) the route of 11.5 carries a twist misprint of the source

   **Location.** README line 1652 (11.5, route): "from Cartier duality for BT^†{1} … and the relative de Rham complex of X → BT^†_{X/D}{−1}".

   **Claim.** The Higgs complex comes from the de Rham complex of X → BT^†_{X/D}{−1}.

   **Witness.** The torsor group is BT^†_{X/D}{1} (11.5(3); ALRS line 7970), and the proof uses X → X/T^†_X{1} (ALRS line 8012, 8025). Only the statement of ALRS Theorem 6.2.2(4) (ALRS line 7986–7987) prints {−1}. The same sentence of the route has {1} three words earlier.

   **Repair.** "…and the relative de Rham complex of X → BT^†_{X/D}{1}", in README and plan. Tested on dim X = 1: the filtration of the unit of D(BT^†{1}) has graded pieces O and T^†{1}-dual, whose Cartier dual is the Koszul complex of Sym(T_{X/D}{1}), giving M → M ⊗ Ω¹_{X/D}{−1}, the first Check of 11.5.

5. **F05** (P3) an API bullet of 3.1 uses a notion that 4.1 defines

   **Location.** README line 590 (3.1, third API bullet): "The unit X → X^dR induces (X^dR)^dR ≅ X^dR, and X^dR → GSpec(ℚ_p) is †-formally étale."

   **Claim.** †-formally étale maps are available in Layer 3.

   **Witness.** They are defined in 4.1 (line 694), whose `*Needs:*` line lists §3.1; 4.1's second API bullet already states that Y^{dR/X} → X is †-formally étale for every map Y → X.

   **Repair.** End the 3.1 bullet at "(X^dR)^dR ≅ X^dR." and extend the 4.1 bullet: "For every map Y → X, Y^{dR/X} → X is †-formally étale; in particular Y^dR → GSpec(ℚ_p) is." Mirror in plan. Tested: for X = GSpec(ℚ_p), X^dR = X, so Y^{dR/X} = X ×_{X^dR} Y^dR = Y^dR and the moved clause is the case X = GSpec(ℚ_p) of the 4.1 bullet.

Needs changes: five findings (R01–R05, all P3, none blocking), each with an exact repair for a fix round; nothing else stands in the way, and the 21 declared supplier gaps are contracts, not findings. All eleven round-8 findings are repaired. Files reviewed: `packages/RationalAnalyticPrismatization/design/README.md` (1875 lines, 12 layers, 88 targets), `packages/RationalAnalyticPrismatization/design/plan.json`, `packages/RationalAnalyticPrismatization/sources.toml`. No file of the design was changed, nothing was added to the manifest, and no `needs-references.toml` was written.

Two of the 21 gaps (`gestalten-affine-proper`, `gestalten-transmutation`) have no supplier. That was settled as not actionable in this package in the round-4 repair, and the reason still holds, so it is not re-raised; it is listed for the human reviewers.

## Verified sound

**Round-8 ledger.**

| Finding | State | Repaired passage read at this head |
|---|---|---|
| F01 (P2) 7.2 nilperfectoid | repaired | 7.2: "and that for nilperfectoid A the Gelfand stack 𝒳_T represents the maps W′(A_{≤1}) → B_{≤1}, B a Gelfand ring"; route sentence on the fibre sequence W(Nil†(A)) → W(A_{≤1}) → W(A^{u,°}); new Check on C_p[ε]/ε² and ℚ_p(μ_{p^∞}) |
| F02 (P2) 10.11 | repaired | line 1551: "for a compact p-adic Lie group H and a G^cont-equivariant H^la-torsor T → X such that β_{X,Z} is an equivalence for Z = BH^la × X^la/G^la … O(T)^{G-la} ≅ O(T′)"; "(i) Y := W/G^cont is a Berkovich space … (ii) β_{Y,Z} is an equivalence for Z = BG^la × Y^{H-la}/H^la"; read against ALRS line 7581–7623. Requiring W to be a Berkovich space is right: the source's proof uses it (ALRS line 7618) |
| F03 (P3) roots of ϖ | repaired | 10.10: "such that ϖ^ϵ ∈ Λ for every ϵ in a dense subset E of ℚ_{>0}"; the same in 10.8 and by reference in 10.9; Check excluding discretely valued Λ |
| F04 (P3) D_HT | repaired | 11.1: "H⁰ of the pushforward … is D_HT(V) …, up to the sign convention of the grading … the pushforward itself also has H¹" |
| F05 (P3) Remark 5.8.6 | repaired | 10.11: "ALRS Remark 5.8.6 leaves open whether P is a Berkovich space … P is the overconvergent neighbourhood of |P| ⊆ |P′|" |
| F06 (P3) 8.5 route | repaired | "Frobenius induces isomorphisms 𝒳_{T,(1/p,∞)} ≅ 𝒳_{T,(1,∞)} and 𝒳_{T,(0,1/p)} ≅ 𝒳_{T,(0,1)} … its thickenings lying at the radii p^n, n ≥ 0" |
| F07 (P3) identifiers | repaired for the three named; the pattern recurs (R03) | "LocallyAnalyticRepresentationsOfLocalGroups §2.3 … §3.8", "PhiGammaModulesAndIwasawaCohomology §1.4" |
| F08 (P3) AnalyticStacks wording | repaired | "(AnalyticStacks places them outside its scope)"; AnalyticStacks at its open head, README line 22: "are a different theory and are outside this roadmap" |
| F09 (P3) `\hat` | repaired | "(Marc(A^u))^∧", "(FF^⋄_X)^∧", "(T^{u,⋄})^∧"; a backslash grep finds nothing |
| F10 (P3) scope by source sections | repaired | line 7: "This roadmap owns the Gelfand analytic geometry over ℚ_p that the prismatization uses (Layers 1–6: …)"; line 218: "Layer 10 is the decompletion theory; it depends only on Layers 1–7" |
| F11 (P3) ranges | repaired | 10.3: "G_{<r} … for r ∈ (0, 1] and G_{≤r} … for r ∈ (0, 1)"; 4.6: "for every η: GSpec(R) → Y with R a Gelfand ring and every connective M ∈ D_{≥0}(R)" |

**Sources, seeded sample.** No locator is flagged unverified by the author. A script checked all 354 locators of the form "p. N, <id> line M" against the page markers of the cached texts (ALRS 286, ABLB 54, ALBM 4, and 10 others): all agree, and each cited line carries or lies inside the item named.

| Target | Read | Result |
|---|---|---|
| 1.1 | ABLB 601–625 | match (Definition 2.1.1, Lemma 2.1.2, idempotency) |
| 1.2 | ABLB 686–698, 742–770, 972–999; ALRS 636–646 | match (overconvergence, bounded A for the ideal and the square) |
| 2.4 | ALRS 797–808; ABLB 2641–2650, 2916–2935 | match; index ≤ 2 as in the route |
| 2.7 | ALRS 937–977 | match |
| 2.8 | ALRS 996–1016; ABLB 2023–2025, 2067–2069, 2690–2700, 2737–2751 | match |
| 4.3 | ALRS 1366–1391, 1441–1466, 1523–1530 | match |
| 5.4 | ALRS 2195–2287 | statement matches; third Check is R01 |
| 6.4 | ALBM 1580–1590, 1654–1662, 1753–1762, 1930–1940; ALRS 8905–8914 | match |
| 7.4 | ALRS 2670–2793 | match; the README corrects a misprint of the source (Source issues) |
| 9.3 | ALRS 4062–4075, 3631–3633 | match |
| 10.1 | ALRS 4817–4830 | match |
| 10.3 | ALRS 5086–5200 | match; generality of Lemma 5.2.10 is R02 |
| 10.12 | ALRS 4734–4762 | match |
| 11.5 | ALRS 7969–8048, 8061–8071 | match; route twist is R04 |
| 11.9 | ALRS 8316–8377, 460–468 | match |

Sections that no earlier table covered (1.1, 3.1, 4.4, 8.4, 11.5, 11.8, 11.9) were read in full now: 3.1 against ALRS 1017–1031 and ABLB 3155–3165, 3248–3254; 4.4 against ALRS 1538–1564; 8.4 against ALRS 3154–3255; 11.8 against ALRS 8145–8165, 8277.

**Adversarial table** (computed values).

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 1.1 bounded | ℚ_p; ℚ_p[T] discrete; 0 | A° = ℤ_p; X ↦ p^nT sends Σ p^kX^k to Σ p^{k(n+1)}T^k, not a finite sum, so A^b = ℚ_p; A° = A^b = 0 | holds |
| 1.2 norm filtration | ℚ_p⟨T⟩; ℚ_p[ε]/ε²; r = 0 | A_{≤1} = ℤ_p⟨T⟩ (sup norm ≤ 1), A_{≤1/p^k} = p^kℤ_p⟨T⟩; Nil† = ℚ_p·ε; germs at 0, not all of ℚ_p⟦T⟧ | holds |
| 2.4 | ℚ_p → ℚ_p^cyc; A = 0 | ℚ_p is a Banach direct summand (index 1); empty cover | holds |
| 2.7 | A = ℚ_p[u^{±1}], \|u\| = 2 | u⁻¹ ↦ π_{−2}(R) = 0, so 1 = 0 in R: GSpec_X(A) = ∅ | holds |
| 2.8 | ℚ_p[ε]/ε²; final object | A^u = ℚ_p; (Marc ℚ_p)^∧ = GSpec(C_p)/Gal ≠ GSpec(ℚ_p) (ABLB 2747–2751) | holds |
| 3.1 | A¹ over C_p[ε]/ε² | points 0 and ε both map to 0 ∈ A^u = C_p | holds |
| 4.3 pushout | two discs at the origin; Z = ∅ | ℚ_p⟨S⟩ ×_{ℚ_p} ℚ_p⟨T⟩ = ℚ_p⟨S,T⟩/(ST); O(X) ×_0 O(Y) = product | holds |
| 4.4 | ℚ_p[ε]/ε² → ℚ_p; ℚ_p⟨T⟩ → ℚ_p | †-reductions ℚ_p = ℚ_p; ℚ_p⟨T⟩ ≠ ℚ_p | holds |
| 5.4 | X = pt; over G_m/G_m; vector bundles | A¹/G_m; R/(R ⊗ Nil†R) = R^{†-red} gives X^dR; VB(A¹/Ĝ_m) = VB(A¹/G_m^†) | statement holds; Check R01 |
| 6.4 | d = 0; ℚ_p | ω = O; dims 1, 2, 0 paired with 0, 2, 1 of ℚ_p(1) | holds |
| 7.4 | Y = Marc(𝔽_p); K = 𝔽_p((π^{1/p^∞})) | Marc(ℚ_p)^dR(A) = Hom(Marc(A^u), Marc(ℚ_p)) = pt; punctured disc over ℚ_p is Y_{(0,∞)} = D^×_{FF,K} | holds |
| 8.4 | cyclotomic prism | zeros of log(q)/(q − 1) = primitive p^k-th roots, k ≥ 1 = zeros of [p]_{q^{p^n}}, n = k − 1 ≥ 0 | holds |
| 9.3 | Tate cover; 0 → A¹; identity | L = 0, epi; L = ℚ_p[1] in amplitude [−1, 0], not epi, excluded; iso | holds |
| 10.1 | Π = 1; ℤ/2 on ℚ_p × ℚ_p | R; dimension 4 with [g]e_1 = e_2[g], M_2(ℚ_p), versus commutative ℚ_p⁴ untwisted | holds |
| 10.3 | ℤ_p, r = 1/p; (1 + p)^a; G = ℤ discrete | G_{r′}(ℚ_p) = pℤ_p for 1/p ≤ r′ < 1; Mahler coefficients p^n, p^{−n}r^n → 0 for r < p; BG^cont = BG^la | ranges hold; R02 |
| 10.12 | G = 1; G = ℤ_p^× on D^×_{FF,ℚ_p^cyc} | X = GSpec_{\|X\|}(h_*O) (2.7), Perf unchanged; X^la = BC(O(1)) ∖ {0} | holds |
| 11.2 (headline) | C_p(n), n = 0 and n ≠ 0 | K →^0 K: H⁰ = H¹ = K; n invertible: 0 | holds |
| 11.5 (headline) | dim X = 1; X = D | M → M ⊗ Ω¹{−1}; T = 0, X^HT = D | holds; route R04 |
| 11.6 (headline) | X = GSpec(K); X = ∅ | 11.1; both empty | holds |
| 11.7 (headline) | K of degree n | dim H¹(Gal_K, ℚ_p) = n + 1, Euler characteristic 1 − (n + 1) + 0 = −n | holds |
| 11.8 (headline) | X = GSpec(K) | extension of 0 by O[−1]: L = O[−1], as 11.2 | holds |
| 11.9 (headline) | G = ℤ_p, X = GSpec(ℚ_p); G = 1 | Hom(ℚ_p^{×,∧}, ℤ_p) = ℤ_p², rank 2; points | holds |
| 12.2 (headline) | ω_{A¹/G_m} | O[−1] ⊗ I[1] = I; H¹(ℚ_p(1)): 0 − h¹ + 1 = −1 gives 2 | holds |
| 12.3 (headline) | d = 0; G_m over ℚ_p | O; O{1}[2] ⊗ O{1}[2] = O{2}[4] | holds |
| 12.4 (headline) | P¹ | f_*(O{1}[2]) = O{1}[2] ⊕ O = (O ⊕ O{−1}[−2])^∨ | holds |
| 12.5 (headline) | d = 1; d = 0 | O{1}[2] ⊕ O ≅ f_*O{1}[2], consistent with 12.4; O ≅ f_*O | holds |
| 12.6 (headline) | X = pt, E = ℚ_p; rank-one θ = c·dlog T, c ≠ 0 | Fil⁰(B_dR) = B⁺_dR; θ invertible, not †-nilpotent, outside the image | holds |

**Structure (scripted).** 88 targets (16 definitions, 14 constructions, 58 theorems). Every definition and construction has an API list and at least three Checks. All 529 plan statements, API bullets and tests occur verbatim in the README. All 21 gaps have the same slug and `needs` sentence in plan and README. The manifest has 24 entries, all `certified`, and equals References. The policy grep (LaTeX, process words, pull-request numbers, machine paths, `set_option`, HTML) finds nothing; "lemma" occurs only in named source lemmas and "Poincaré lemma". The README has no backticked name of its own.

**Pins.** `lake-manifest.json` gives Mathlib `1b1ccf4b…` and Tau Ceti `2fd255d9…`, as the README says. All 20 cited declarations were opened at the cited file and line and are there: `LightProfinite` :44, `LightCondensed` :29, `MulRingSeminorm` :61, `spectralNorm` :381, `WittVector` :52, `fontaineTheta` :166, `BDeRhamPlus` :75, `PadicComplex` :137, `TauCeti.LocallyAnalytic` :45 and `.eval` :85, `spaY` :116, `frobeniusHomeomorph` :220, `IsRadiusLowerBound` :102, `IsRadiusUpperBound` :108, `isRadiusLowerBound_comap_frobenius_iff` :149, `windowU` :260, `windowV` :267, `spaX` :59, `compactSpace_spaX` :259, `t0Space_spaX` :271.

**Principles.** No re-planned roadmap, no upward supply, no algorithm, no copied passage, no Lean file at this stage.

**Duplication audit.** `roadmaps grep` by object over main and the open heads: "Gelfand ring/stack", "analytic prismatization", "analytic de Rham stack" and "derived Berkovich" occur only in AnalyticStacks, in the Scope lines that assign them to this roadmap. "twistor stack", "Hyodo–Kato stack", "rational δ-space", "analytic δ-stack" and "decompletion theorem" occur nowhere else. "Riemann–Hilbert functor" occurs in PerfectoidShimuraVarieties for logarithmic functors on Shimura varieties, a different object; 12.6 cites Scholze's functor from PadicHodgeTheory §7.1. Sen operators are owned by PadicHodgeTheory §4.4, FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.2 and PrismaticCohomologyPartII §4.13 and are cited, not restated. Overlap facts: no pull request changes this roadmap, drops an id it cites, or defines one it cites only in a revision.

Overlap check: read AnalyticStacks, PrismaticCohomologyPartIII, PrismaticCohomologyPartIV, AInfCohomology, CohomologyComparisons, EnhancedDerivedSheaves, PerfectoidSpaces, DiamondsAndVStacks (scope or cited sections); nothing shared: analytic stacks, six functors and Cartier duality are AnalyticStacks' (consumed through gaps), and Gelfand rings, Gelfand stacks and the analytic prismatization are this roadmap's (AnalyticStacks, Scope, README line 22).

**Supplier order.** Gate output:

```
candidate: RationalAnalyticPrismatization is not in the merge order yet; checked as if placed after MotivesAndAlgebraicCyclesPartII (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2252 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Resolved this round at the open heads: every AnalyticStacks id the README consumes (0.5, 0.6, 0.8–0.11, 1.6, 1.7, 2.1, 2.3, 2.11, 3.2, 3.3, 3.6, 3.8, 4.1–4.5, 5.1–5.3, 6.3–6.6, 7.2, 7.5–7.7 exist as headings or numbered targets); PadicHodgeTheory §§2.2, 2.3, 4.4, 5.1, 7.1; RelativeFarguesFontaine §§2.1, 2.2; EnhancedDerivedSheaves `isDescendable_colimit_of_uniformIndex`; AdicSpacesPartIII §R3.9 `Huber.GelfandSpectrum` (cited by two other roadmaps under that name; the `roadmaps resolve` lead is a planned name); MotivesAndAlgebraicCyclesPartII §BM.0 (board package, line 388 of the merge order; the other `roadmaps resolve` lead). The names that do not resolve are R03.

**Gaps.** Nineteen gaps name a supplier (eighteen AnalyticStacks, one DiamondsAndVStacks §D6.5). Each `needs` sentence names one deliverable with its hypotheses, and AnalyticStacks' consumer note (its README line 1291) maps each to the same sections. None asks for something the pins provide (no analytic rings or analytic stacks at either pin). The two Gestalten gaps have supplier `none`: `roadmaps grep -i gestalt` still finds only AnalyticStacks' exclusion, so the round-4 reason stands and the acceptance is conditional on the board's decision.

**Headline theorems** (Summary): 11.6 with 11.1 and 11.4; 11.7; 11.2, 11.5, 11.8; 10.12 with 11.9–11.10; 12.2–12.4; 12.5; 12.6. None is statable at the pins: neither library has analytic rings, Gelfand stacks or Fargues–Fontaine curves as stacks. The package stage says so in the module docstring.

**Copyright.** Twenty-one statements (the fifteen sampled, 3.1, 4.4, 8.4, 11.8, 10.11 and 12.6) and six further passages (the routes of 4.3, 9.3, 11.5 and 11.9, the third Check of 5.4, the second Check of 7.4) were set beside ALRS, ABLB and ALBM at their locators. The longest shared runs are definitional: "is surjective and induces an isomorphism on †-reductions" (9 words, 4.4) and "local for the rigid étale topology" (6 words, 11.9 route). The route of 11.9 names the same four inputs as the source's proof in three lines against its nine; no sentence, list or proof plan is reproduced.

Arrangement against ALRS (its contents at ALRS line 15–70): Layers 1–3 are built from ABLB §§2–5; Layer 4 ↔ §§2.6–2.7 with Appendix A; Layer 5 ↔ §§2.8–2.9, 3.1; Layer 6 ↔ §3.2 with ABLB §6 and ALBM §§4.4–4.5; Layer 7 ↔ §§3.3–3.7; Layer 8 ↔ §§4.1–4.3 and part of 4.7; Layer 9 ↔ §§4.4–4.10; Layer 10 ↔ §§5.2–5.8 then 5.1; Layer 11 ↔ §§6.1–6.4; Layer 12 ↔ §§6.5–6.7. No source chapter is one layer and three layers cross chapter boundaries. The order 7 → 8 → 9 → 11 → 12 is forced by the `*Needs:*` lines (8.x need 7.2–7.4; 9.1 needs 8.6; 11.1 needs 9.7 and 10.12; 12.3 needs 11.4 and 11.6), and Layer 10 needs only Layers 1–7.

Source independence: 27 passages compared with 3 sources, none shared; largest share ALRS, 776 of 1122 locators; contents compared with ALRS: independent.

## Not verifiable

- Lean elaboration, the `#check` pass and the one-tactic padding probe: not available (this lane does not elaborate, and the design has no `Suggested.lean`).
- Ownership against open pull requests was checked by object through `roadmaps grep` and by reading the roadmaps of the Overlap check; the other open roadmaps were not read.
- Targets outside the sample, the seven newly read sections and the repaired passages rest on the computed rows of rounds 1–8.
- RCSen Theorems 1.0.3 and 1.0.4 (11.5, 11.10) and Sch13 Theorem 7.6 (12.6): page locators agree with the page markers; the texts were not read in full.
- R02 has no counterexample: the witness is the source's wider statement and the later uses of it.

## Source issues

- **Misprint** in ALRS at Proposition 3.5.3, proof, printed page 52 (ALRS line 2727): the source writes the disc of two copies of K as a product of unpunctured discs D_{FF,K}; it should be the punctured discs D^×_{FF,K}, p being invertible there; affects nothing.
- **Misprint** in ALRS at Theorem 6.2.2(4), printed page 147 (ALRS line 7986): the source twists the classifying stack of the overconvergent tangent bundle by {−1}, twice; it should be {1}, as before the theorem and in its proof; affects nothing.
- **Misprint** in ALRS at Theorem 6.2.2(4), printed page 147 (ALRS line 7989): the source twists the top term of the Higgs complex by {−1}; it should be twisted by {−dim X}; affects nothing.
- **Misprint** in ALRS at Theorem 6.2.2(5), printed page 147 (ALRS line 7992): the source refers to the geometric Sen operator of part (2); it should be part (3); affects nothing.
- **Misprint** in ALRS at Lemma 5.8.8, printed page 139 (ALRS line 7582): the source names the decompletion of X as Y^la; it should be X^la; affects nothing.
- **Misprint** in ALRS at Lemma 2.7.9(1), printed page 29 (ALRS line 1561): the source writes the composite as g after f; it should be f after g; affects nothing.
- The misprints and the gap recorded in rounds 7 and 8 stand as recorded there.

## For the human reviewers

- **Scope.** The main sources are unpublished: ALRS (2026, author page), ABLB (arXiv 2510.15196), RCSolid (arXiv 2603.03012), RC26a (arXiv 2512.24967), Gest (lecture notes); 953 of 1122 locators are to ALRS and ABLB. No refereed source states the headline theorems.
- **Licence.** `sources.toml` records ALRS, Gest and Sch24 as author-page copies; no licence is stated on the files.
- **Ownership.** `gestalten-affine-proper` and `gestalten-transmutation` have supplier `none` (README lines 172, 210, 212); no roadmap owns Gestalten. Who supplies them is the board's decision.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "dcdf114c523584a18b454cf9c9614fafa75dccb9", "job": "REV-DESIGN-RationalAnalyticPrismatization~9", "model": "fable", "worker": "chris-x81"} -->
