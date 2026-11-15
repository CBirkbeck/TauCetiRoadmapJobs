<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16360#issuecomment-6903164528 -->
Review (claude) of ce006b5

Verdict: needs_changes

**For the human reviewers:** this review raises 5 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) 10.8, first Check: the binomial-analytic vectors of a trivial action are not A

   **Location.** `design/README.md` line 1655 (10.8, Checks): "For A with trivial G-action, A^{Bin_{r,ϖ}} = A and ϵ-TORS holds for every ϵ."; the same test in `design/plan.json`.

   **Claim.** For a trivial action the derived binomial-analytic vectors equal A.

   **Witness.** G = ℤ_p, A = Λ°, γ a generator. Γ(G, C_{r,ϖ}(G, Λ°)) is the fibre of γ − 1, which sends Σ c_n binom(x, n) to Σ c_{n+1} binom(x, n). The constant 1 is in the image only if c_1 = 1, and |1|_ϖ r^{w(g_1)} > 1. So π_{−1} ≠ 0; the class of 1 is killed by ϖ^ϵ exactly when 2^{−ϵ} r^{w(g_1)} ≤ 1. ALRS Example 5.5.9 (ALRS line 6145) and Corollary 5.5.10 (ALRS line 6165) say the same: only τ_{≥0} is A.

   **Repair** (README and `plan.json`). Replace the Check by: "For A = Λ° with trivial G-action, τ_{≥0}A^{Bin_{r,ϖ}} = A, while the negative homotopy of Γ(G, C_{r,ϖ}(G, Λ°)) is nonzero and ϖ^ϵ-torsion once 2^{−ϵ} < r^{−ω}, so ϵ-TORS holds for every ϵ > 0 with r_n → 1 (ALRS Example 5.5.9, p. 115, ALRS line 6145). For G = ℤ_p the constant 1 is not in the image of γ − 1, since binom(x, 1) has |1|_ϖ r^{w(g_1)} > 1; the plain equality A^{Bin_{r,ϖ}} = A fails." Tested on the witness: H⁰ = Λ° (constants with |c_0|_ϖ ≤ 1), H¹ ∋ [1] ≠ 0, ϖ^ϵ·[1] = 0 for ϵ ≥ w(g_1)·log₂ r, which tends to 0 with r → 1.

2. **F02** (P3) 10.8: the tensor product in the almost-retraction has no base

   **Location.** `design/README.md` line 1641 and line 1649 (10.8): "N_{ϖ^{(d+1)ϵ}} → M ⊗ A_{ϖ^{(d+1)ϵ}} → N_{ϖ^{(d+1)ϵ}} composing to ϖ^δ with 0 ≤ δ < ϵ and M with trivial action"; the same in `design/plan.json`.

   **Claim.** This is the hypothesis of ALRS Proposition 5.5.6.

   **Witness.** ALRS line 6063–6065: M is a module over Γ(G, (τ_{≥0}A^{Bin_{r_0,ϖ}})_{ϖ^{(d+1)ϵ}}), not necessarily connective, and the tensor product is over that ring; the maps are G-equivariant. The second API bullet of 10.8 does write its base (τ_{≥0}Γ(G, A_{ϖ^δ})). Read over Λ°, the statement is a special case of the source (M′ = M ⊗_{Λ°} Γ(G, …)), so it is true but narrower.

   **Repair.** In both places write "a module M over R_0 := Γ(G, (τ_{≥0}A^{Bin_{r_0,ϖ}})_{ϖ^{(d+1)ϵ}}) with trivial G-action and G-equivariant maps N_{ϖ^{(d+1)ϵ}} → M ⊗_{R_0} A_{ϖ^{(d+1)ϵ}} → N_{ϖ^{(d+1)ϵ}}", and "a connective ϖ-complete G-equivariant A-module N" in the main statement, as the API bullet already has. Tested: for G trivial (second Check), R_0 = A_{ϖ^{ϵ}} and M ⊗_{R_0} A_{ϖ^ϵ} = M, so every N is its own M with δ = 0.

3. **F03** (P3) 8.5, third Check: the intervals under the reciprocal radius

   **Location.** `design/README.md` line 1285 (8.5, Checks): "would place the Hodge–Tate locus at p^n for n ≥ 0 and exchange the roles of (0, p) and (1, ∞) in ALRS Proposition 4.2.13"; the same in `design/plan.json`.

   **Claim.** Replacing κ by the radius of 𝒳_T exchanges (0, p) and (1, ∞).

   **Witness.** The two radii are reciprocal (8.5, statement; ALRS line 3327). Under κ ↦ 1/κ the Hodge–Tate locus stays at 1, its n-th inverse Frobenius translate moves from p^{−n} to p^n, (0, p) becomes (1/p, ∞) and (1, ∞) becomes (0, 1). The intervals are not exchanged.

   **Repair.** Replace by: "Using the radius of 𝒳_T instead of that of X^Δ would place the n-th inverse Frobenius translate of the Hodge–Tate locus at p^n instead of p^{−n} and turn the intervals (0, p) and (1, ∞) of ALRS Proposition 4.2.13 into (1/p, ∞) and (0, 1): part (1) would then be asserted over (1, ∞), which contains the thickenings at p, p², …, where X^Δ → (D^×_{FF,X^⋄})^dR is not an isomorphism." Tested: 1/p^{−n} = p^n; 1/(0, p) = (1/p, ∞); 1/(1, ∞) = (0, 1); the proof route of 8.5 uses exactly 𝒳_{T,(1/p,∞)} and 𝒳_{T,(0,1)}.

Three findings, all P3 (two Checks and one unsubscripted tensor product); no P1 or P2. Each has a repair to apply, so the verdict asks for changes. All five round-15 findings are repaired. The fifteen sampled targets match their sources. The 21 declared supplier gaps are contracts and are not raised. Two of them, `gestalten-affine-proper` and `gestalten-transmutation`, have supplier `none`; the round-4 repair report settled this as `not actionable in this package` (no roadmap owns Gestalten). I checked the reason again (below); it holds, so it is not re-raised, and it is listed for the human reviewers.

Files reviewed: `packages/RationalAnalyticPrismatization/design/README.md` (2039 lines, 12 layers, 88 subsections), `packages/RationalAnalyticPrismatization/design/plan.json`, `packages/RationalAnalyticPrismatization/sources.toml`. No file of the design was changed, nothing was added to the manifest, and no `needs-references.toml` was written. No maintainer notes were given for this round.

## Verified sound

**Round-15 ledger.** All five repaired.

| Finding | State | Repaired passage at this head |
|---|---|---|
| F01 (P2) 11.8 product without base | repaired | line 1842: "π_{X,1}: X^HT → X ×_{GSpec(K)} K^HT = X × Q_p^HT, where K^HT = GSpec(K)^HT ≅ GSpec(K) × Q_p^HT by 9.1 (T_{GSpec(K)} = 0)"; base written in the two other places; *Needs* has §9.1 (line 1846); new Check, line 1853 |
| F02 (P3) 10.11 group 𝐇 undeclared | repaired | line 1697: "U an open subgroup of 𝐇(ℚ_p)^la = 𝐇^an ×_{𝐇^{an,dR}} 𝐇(ℚ_p)^dR (3.4) for an affine algebraic group 𝐇 over ℚ_p"; route at line 1699; new Check, line 1709 |
| F03 (P3) 11.3 Γ_d a stack, then decorated | repaired | line 1771: "Γ_d = ℤ_p^× ⋉ ℤ_p^d, the p-adic Lie group in which ℤ_p^× acts on ℤ_p^d by multiplication … so that Γ_d^la = ℤ_p^{×,la} ⋉ ℤ_p^{d,la}" |
| F04 (P3) 2.6 radius of a †-rigid space | repaired | line 509: "K⟨T_1,…,T_n⟩_{≤r} for some r > 0 (ABLB Definition 4.3.6, p. 45, ABLB line 2384)"; new Check, line 528 |
| F05 (P3) 2.6 conclusion of the second Check | repaired | line 526: "X′ does not see the ring of integral elements, and the construction factors through the canonical compactification, an adic space over ℚ_p that is partially proper but not a rigid space" |

Repaired patterns elsewhere: unsubscripted tensor or fibre products whose base matters were searched in the sampled sections and gave R02; no other product over K without base; "Γ_d^cont" (11.3, 12.x) is now formed from a p-adic Lie group; "_{≤r}" elsewhere is the r ≥ 0 of 1.2 or the radii of 10.3.

**Sources, seeded sample.** The author flags no locator as unverified. All fifteen sampled targets were read against the cached texts this round.

| Target | Read | Result |
|---|---|---|
| 1.3 | ABLB line 1037–1045, 1080–1100, 1143–1147 | match (Definition 2.3.1, Remark 2.3.2, Proposition 2.3.6(1)–(4), Corollary 2.3.7) |
| 1.4 | ABLB line 1162–1186, 2061–2069, 2190–2196, 2261–2264 | match |
| 2.3 | ALRS line 809–870; ABLB locators of Lemma 4.2.11, Definition 4.2.12 | match (Lemmas 2.1.8–2.1.10; dualizable = perfect at ALRS line 813) |
| 4.3 | ALRS line 1366–1474, 1521–1530 | match (Definition 2.7.1, Example 2.7.2, Lemmas 2.7.3–2.7.5, Example 2.7.6) |
| 5.2 | ALRS line 1700–1856 | match (Definitions 2.8.9, 2.8.11, Example 2.8.12, Lemmas 2.8.13–2.8.14, Proposition 2.8.15, Remark 2.8.16) |
| 7.2 | ALRS line 2501–2542, 2634–2640 | match |
| 7.6 | ALRS line 2867–2943 | match; the README corrects the lower-left corner of Proposition 3.7.4(2) (Source issues) |
| 8.5 | ALRS line 3287–3371 | match (Remark 4.2.12, Proposition 4.2.13 and proof, Corollary 4.2.14); R03 on a Check |
| 9.2 | ALRS line 3535–3560 | match (Proposition 4.4.4, Remark 4.4.5) |
| 9.8 | ALRS line 4233–4298 | match (Construction 4.9.1, Remarks 4.9.2, 4.9.3(1)–(5)) |
| 10.1 | ALRS line 4810–4850 | match (Construction 5.2.1) |
| 10.7 | ALRS line 4738–4754, 5831–5958; BC16 line 397 | match (Lemma 5.4.1, Definition 5.4.2, Remarks 5.4.3–5.4.4, Lemma 5.4.5, Corollary 5.4.6, Lemma 5.4.7(1)–(6), Theorem 5.1.1(2)) |
| 10.8 | ALRS line 5983–6070, 6143–6234 | match for the statements; R01, R02 |
| 11.8 | ALRS line 8145–8182, 8277 | match, with the base GSpec(K) the source omits |
| 12.3 | ALRS line 8875–8934 | match (Theorem 6.5.8, Remark 6.5.9); the README has O_{X^{Div¹}} in (3), correcting the source |

Also read for the repairs: ALRS line 7627–7705 (Proposition 5.8.10 and the proof of (2), (3)); ABLB line 2384–2388.

**Adversarial table** (repaired passages, sampled targets, headlines, findings; values computed this round unless marked r15).

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 11.8(1) repaired | K = ℚ_{p²}, X = GSpec(K) | X^HT = K^HT; X ×_{GSpec(K)} K^HT = K^HT, identity, band 0; over ℚ_p: K ⊗ K = K × K, two copies | holds |
| 11.8(2) | X = GSpec(K) | Ω¹ = 0, L_{X^HT/X} = O[−1], as 11.2 | holds |
| 10.11 route for BU | U = 𝐇(ℚ_p)^la | square B𝐇(ℚ_p)^la = B𝐇(ℚ_p)^sm ×_{B𝐇^{an,dR}} B𝐇^an at ALRS line 7649; sm and dR corners by Lemma 5.8.1(2) | holds |
| 10.11 route for BΓ^la | g abelian; semisimple; general | 𝐇 = G_a^n; algebraic (ALRS line 7668); 0 → a → g → f → 0, dim f < dim g | holds |
| 11.3 Γ_d | d = 0; d = 1 | Γ_0 = ℤ_p^×, Div¹ = FF^la_{ℚ_p^cyc}/ℤ_p^{×,la} (9.7); G_mixed of 10.10 = ℤ_p^× ⋉ ℤ_p(1)^d | holds |
| 2.6 r > 0 | r = 0; r = 1 | g ∈ A_{≤r} of the germ ring iff \|g(0)\| ≤ r; images h(g_1,…,g_n) converge on one disc \|T\| < ρ; 1/(1 − T/c), 0 < \|c\| < ρ, missed; ℚ_p⟨T⟩_{≤1} admitted | holds |
| 2.6 Check 2 | closed disc, compactification | A°° = pℤ_p⟨T⟩; f̄ ∈ 𝔽_p[T] integral over 𝔽_p lies in 𝔽_p, so A^+ = ℤ_p + pℤ_p⟨T⟩ ≠ ℤ_p⟨T⟩; same GSpec(ℚ_p⟨T⟩) | holds |
| 1.3 | ℚ_p[ε]/ε²; 0 | A^u = ℚ_p, 1 + ε ↦ 1 unit, ε ↦ 0; A^u = 0 forces 0 a unit of A | holds |
| 1.4 | ℚ_p⟨T_n⟩; 0 | spectrum contains [0,1]^ℕ; Marc(0) = ∅ | holds |
| 2.3 | ℚ_p → ℚ_p^cyc; ℚ_p⟨T⟩; ∅ | normalized trace is a ℚ_p-linear retraction, so descendable; Banach, nuclear, not dualizable; Perf(∅) = 0 | holds |
| 4.3 | two discs along origins; Z = ∅; A = C = ℚ_p[T], B = ℚ_p | {(f, g): f(0) = g(0)} = ℚ_p⟨S, T⟩/(ST), kernel of h ↦ (h(S,0), h(0,T)); ∅ → X Zariski closed (A → 0), pushout X ⊔ Y; (⊕_{even} B[n], ⊕_{odd} B[n]) not in the image | holds |
| 5.2 | X = S = GSpec(ℚ_p), M = ℚ_p; Y = D | τ_{≥0}Hom(0, M[1]) = point, ℚ_p ×_{ℚ_p ⊕ ℚ_p[1]} ℚ_p = ℚ_p[ε]/ε²; D^{cone/(D,W)} = W, special fibre D, torsor under T_{D/D} = 0 | holds |
| 7.2 | A perfectoid; radius of n-th copy | pushout along identity; κ(φⁿ ∘ f) = pⁿ since \|[ϖ^p]\| = \|[ϖ]\|^p | holds |
| 7.6 | λ = 0; λ = −1 at C_p[ε]/ε² | BC(O) = ℚ_p^la, kernel to dR = Nil† = ℚ_pε; long exact sequence of the fibre product: π₀ = C_p/ℚ_p, π₁ = ker(A → C_p) ⊗ D_1 = C_pε ⊗ D_1, against π₁ = H⁰(O(−1)) = 0 of the de Rham stack; G_a^dR in the corner would give π₁ = 0 | holds; source square corrected |
| 8.5 | κ on 𝒳_T and X^Δ | thickenings of 𝒳_T at pⁿ, n ≥ 0; φ: 𝒳_{T,(1/p,∞)} → 𝒳_{T,(1,∞)} sends copy n to n + 1; reciprocal: (r, s) ↔ (1/s, 1/r); Hodge–Tate translates at p^{−n} | holds |
| 8.5 Check 3 | κ ↦ 1/κ | (0, p) ↦ (1/p, ∞), (1, ∞) ↦ (0, 1); not an exchange | R03 |
| 9.2 | X = D; X = D × BG_a | r15: D^{HK/𝒳} = 𝒳/φ^ℤ; T = O[1] not a vector bundle | holds |
| 9.8 | cyclotomic prism | φ(log q/(q − 1)) = p log q/(q^p − 1) = p·[p]_q^{−1}·log q/(q − 1); φ(e⟨1⟩) = p^{−1}e⟨1⟩; φ(e) = [p]_q^{−1}e; without ⟨1⟩: p·[p]_q^{−1} | holds |
| 10.1 | Π = 1; R = ℤ; ℤ/2 on ℚ_p × ℚ_p | R; ℤ_■[Π]; skew group algebra = End_{ℚ_p}(ℚ_p²) = M_2(ℚ_p), untwisted ℚ_p⁴ commutative (p = 2 included, ℚ_2[x]/(x² − 1) = ℚ_2²) | holds |
| 10.7 | G trivial; C(G, ℚ_p); ℚ_p^cyc | R^la = R; R^la = C^la_G, sup-norm completion C(G, ℚ_p), spectrum G; K^la = ℚ_p(μ_{p^∞}) | holds |
| 10.8 Check 1 | G = ℤ_p, A = Λ° | H⁰ = Λ°; H¹ ∋ [1] ≠ 0, ϖ^ϵ-torsion iff 2^{−ϵ}r^{w(g_1)} ≤ 1 | false in its first clause: R01 |
| 10.8 hypothesis | base of ⊗ | source: over Γ(G, (τ_{≥0}A^{Bin_{r_0}})_{ϖ^{(d+1)ϵ}}); README: none | R02 |
| 10.8 Check 2 | d = 0 | C_{r,ϖ}(1, Λ°) = Λ°, M^{Bin} = M | holds |
| 11.6, 11.7, 12.2, 12.4, 12.5 (headlines) | — | r15 rows (K = ℚ_p: 1, 2, 0; χ = −n; Tate duality 1 ↔ 1, 2 ↔ 2; P¹: O{1}[2] ⊕ O = (O ⊕ O{−1}[−2])^∨) recomputed for 12.2: h¹(ℚ_p) = h¹(ℚ_p(1)) = 2 | hold |
| 12.3 | d = 0; G_m; P¹ | O; O{1}[2], composite with 12.2: O{2}[4]; f_!O = O ⊕ O{−1}[−2] ≠ f^!O | holds |

Targets outside this table rest on the computed rows of rounds 12 to 15; their texts are unchanged (the last repair touches only 2.6, 10.11, 11.3 and 11.8).

**Structure (scripted).** 88 subsections, each with at least three Checks and a *Needs:* line. All 626 statement strings of `plan.json` occur verbatim in the README (0 missing). 21 gaps, same slugs and same `needs` sentences in plan and README. Policy search (LaTeX delimiters, pull-request numbers, machine paths, `set_option`, HTML, process words): 0 hits. No backticked name of this roadmap's own.

**Pinned declarations.** All 21 opened at the pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d) at the file and line the README gives: `LightProfinite` (Basic.lean:44), `LightCondensed` (:29), `MulRingSeminorm` (:61), `spectralNorm` (:381), `WittVector` (:52), `WittVector.fontaineTheta` (:166), `BDeRhamPlus` (:75), `PadicComplex` (:137), `PadicInt.mahlerEquiv` (:353), `TauCeti.LocallyAnalytic` (:45) and `.eval` (:85), `spaY` (Y.lean:116), `frobeniusHomeomorph` (:220), `IsRadiusLowerBound` (Window.lean:102), `IsRadiusUpperBound` (:108), `isRadiusLowerBound_comap_frobenius_iff` (:149), `windowU` (:260), `windowV` (:267), `spaX` (Quotient.lean:59), `compactSpace_spaX` (:259), `t0Space_spaX` (:271).

**Manifest.** 24 entries, all `certified`; every source id cited is recorded.

**Supplier order.** Gate output:

```
candidate: RationalAnalyticPrismatization is not in the merge order yet; checked as if placed after MotivesAndAlgebraicCyclesPartII (the intake inserts it when its design is accepted)
depcheck: 237 roadmaps, 2263 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every named supplier is on main or earlier in the merge order (AnalyticStacks at line 338, MotivesAndAlgebraicCyclesPartII at 388, the last). The two leads of `scratch/citations.md` resolve: "MotivesAndAlgebraicCyclesPartII Layer 0" is `packages/MotivesAndAlgebraicCyclesPartII/README.md` line 100 ("Layer 0: The Banach arc-site", §§0.1–0.7), in the merge order; `Huber.GelfandSpectrum` is AdicSpacesPartIII §R3.9's name (r15). AnalyticStacks was read at its open head this round: every section a gap names exists (§§0.5, 0.6, 0.8–0.11, 1.6, 1.7, 2.1, 2.3, 2.11, 3.2, 3.3, 3.6, 3.8, 4.1–4.5, 5.1–5.3, 6.3–6.6, 7.2, 7.5–7.7, its lines 210–1272), CondAni is defined in its §2.1 (line 533), and its `nuclear-hom-criterion` gap exists (line 95). The other section citations are those r15 resolved; no supplier text was reported changed by `scratch/overlaps.md`.

**Gaps.** 21, each one sentence with its hypotheses, declared in `plan.json` and under "Declared gaps". AnalyticStacks hands Gelfand rings, de Rham stacks and prismatization to this roadmap and maps this roadmap's slugs to its sections (its Downstream consumers). `roadmaps grep -i` for Gestalt returns AnalyticStacks only, which excludes Gestalten (its "Left to other roadmaps"): the round-4 reason for the two `none` gaps holds.

**Duplication audit.** `roadmaps grep -i --readme-only` for Gelfand ring or stack, analytic prismatization, twistor stack, Hyodo–Kato stack, analytic de Rham stack, derived Berkovich, Hodge–Tate stack, Gestalt, decompletion: 41 lines in 10 roadmaps. AnalyticStacks names these objects only as deferrals to this roadmap. PadicHodgeTheory §4.2, HodgeTateAndCanonicalSubgroups §7.18, CohomologyComparisons §6.11, AutomorphicBundles and VectorBundlesAndIsocrystalsPartII use classical Tate–Sen or Kummer-tower decompletion of Banach modules, not decompletion over Gelfand rings. No folder of this name is on main: not a second copy. `scratch/overlaps.md`: no other pull request changes this roadmap, none drops an id it cites, no citation depends on an open revision's numbering.

Overlap check: read AnalyticStacks (scope, §§2.1, 4.3, consumer note), PrismaticCohomologyPartIII, PrismaticCohomologyPartIV, AInfCohomology, CohomologyComparisons (open; grep by object, no shared object), CrystallineCohomology, PerfectoidSpaces, EnhancedDerivedSheaves (main; suppliers or unrelated); shared: analytic stacks, six functors, nuclear modules, Fredholm criteria, Cartier duality, owner AnalyticStacks (consumed through gaps); integral prismatic objects, owner the PrismaticCohomology parts (Checks only); Gelfand rings and stacks, the analytic prismatization and decompletion over Gelfand rings, owner this roadmap.

**Headline theorems** (Summary): 11.6 with 11.1 and 11.4; 11.7; 11.2, 11.5, 11.8; 10.12 with 11.9–11.10; 12.2–12.4; 12.5; 12.6. None is statable at the pins (no analytic rings, Gelfand stacks or Fargues–Fontaine curves as stacks in either library); the package stage says so in the module docstring. The design has no `Suggested.lean`, so there is nothing to probe for padding.

**Principles.** No re-planned roadmap, no upward supply, no algorithm, no sorry'd data or `set_option` (no Lean file). The README does not say it follows a source and no layer is named after a source's chapter.

**Copyright.** Wording: a script compared the full text of 14 sections (2.3, 2.6, 4.3, 5.2, 7.6, 8.5, 9.8, 10.1, 10.7, 10.8, 10.11, 11.3, 11.8, 12.3) with the full texts of ALRS and ABLB. Longest shared runs: 11 words ("let G be a uniform pro-p group of dimension d"; a formula of 10.7), 10 words (a formula of 4.3; "let f: Y → X be a map of Berkovich spaces"); all forced statements or formulas. I also read the eleven newly sampled sections beside the source passages: statements are compressed in the roadmap's own sentences; no table, figure or list of examples is taken over. Arrangement: ALRS has 353 of 494 line locators. Its contents (§§2.1–2.9, 3.1–3.7, 4.1–4.10, 5.1–5.8, 6.1–6.7, Appendix A) against the layers: Layers 1–3 ↔ ABLB §§2–5 with ALRS §§2.1–2.5; Layer 4 ↔ §§2.6–2.7 with Appendix A; Layer 5 ↔ §§2.8–2.9, 3.1; Layer 6 ↔ §3.2 with ABLB §6; Layer 7 ↔ §§3.3–3.7; Layers 8–9 ↔ §4 reordered; Layer 10 ↔ §5; Layers 11–12 ↔ §6. Twelve layers against six chapters, not one to one; the parallel run is forced by the Dependencies lines (Layer 8: Layers 3–7; Layer 9: Layers 4–8; Layer 11: Layers 2–4 and 6–10; Layer 12: Layers 6–11), and Layer 10 (Layers 1–7 only) is placed before its first use.

Source independence: 14 sections compared with 2 sources (ALRS, ABLB), none shared; largest share ALRS, 353 of 494 line locators; contents compared with ALRS: independent.

## Not verifiable

- Lean elaboration, the `#check` pass and the one-tactic padding probe: not available (this lane does not elaborate, and the design has no `Suggested.lean`).
- Ownership against open pull requests was checked through `roadmaps grep` by object and by reading AnalyticStacks; the other open roadmaps were not read one by one.
- Supplier sections other than those of AnalyticStacks and MotivesAndAlgebraicCyclesPartII Layer 0 were not re-opened this round; I rely on the round-15 resolution and on `scratch/citations.md` and `scratch/overlaps.md` reporting no change.
- The twisted product of 11.1 has no source; it rests on the round-15 computations.

## Source issues

- **Misprint** in ALRS at Proposition 3.7.4(2), printed page 56 (ALRS line 2924): the source puts the classifying stack of the de Rham additive group in the lower left corner; it should be that of the analytic additive group, as its proof says; affects nothing.
- **Misprint** in ALRS at Proposition 4.2.13, proof, printed page 64 (ALRS line 3353): the source writes the target of the first Frobenius isomorphism as a region of the thickened disc; it should be the region (0, p) of the prismatization; affects nothing.
- **Error** in ALRS at Remark 6.1.5, printed page 145 (ALRS line 7873): the source says the twistor stack of an unramified K is the product of GSpec(K) with Div¹; it should be the Frobenius-twisted product; affects a stated result.
- **Misprint** in ALRS at Theorem 6.3.2(1)–(2), printed page 150 (ALRS line 8146–8152): the source writes the product of X with K^HT without a base; it should be the fibre product over GSpec(K); affects nothing.
- **Misprint** in ALRS at Theorem 6.5.8(3), printed page 164 (ALRS line 8882): the source applies the upper shriek to the structure sheaf of Y^{Div¹}; it should be that of X^{Div¹}, as its proof concludes; affects nothing.
- **Misprint** in ALRS at Lemma 5.8.8, printed page 139 (ALRS line 7582–7584): the source names the decompletion Y^la and takes Z = BH^la × X^la; they should be X^la and BH^la × X^la/G^la; affects nothing.
- **Misprint** in ALRS at (1.2.1) and Remark 4.10.15, printed pages 8 and 91 (ALRS line 396, 4693): the source defines Γ_d as a product of locally analytic group stacks and then writes Γ_d^la and Γ_d^cont; Γ_d should be the p-adic Lie group; affects nothing.

## For the human reviewers

- **Scope.** The main sources are unpublished: ALRS (2026, author page), ABLB (arXiv, 2025), RCSolid, RC26a, Gest (notes); 429 of 494 line locators are to ALRS and ABLB. No refereed source states the headline theorems.
- **Licence.** `sources.toml` records ALRS, Gest and Sch24 as author-page copies; no licence is stated on the files.
- **Ownership.** `gestalten-affine-proper` and `gestalten-transmutation` have supplier `none` in `design/plan.json`; no roadmap owns Gestalten (AnalyticStacks, "Left to other roadmaps", excludes them). An acceptance would be conditional on an owner being named.
- **Supplier note.** AnalyticStacks' consumer note for this roadmap still lists a slug `hypercover-inversion`, which this design no longer declares (it is `perfect-complexes-fredholm-stacks`, AnalyticStacks §4.5).
- **Source correction.** 11.1 states a Frobenius-twisted product in place of ALRS Remark 6.1.5; the corrected form is derived in the roadmap and appears in no source.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ce006b53096bc5e9eb1926ccc08dc87371619054", "job": "REV-DESIGN-RationalAnalyticPrismatization~16", "model": "fable", "worker": "chris-x82"} -->
