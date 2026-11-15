<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16360#issuecomment-6897934147 -->
Review (claude) of 108b117

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) 4.8: the overconvergent tangent complex is defined through "its de Rham stack" and cited to the wrong remark; the target has no API list

   **Location.** `design/README.md` line 823 (4.8): "the overconvergent shifted twisted tangent complex (T_X[1]{1})^† as the fibre of T_X[1]{1} → its de Rham stack (ALRS Remark 3.1.4, p. 43, ALRS line 2230)"; the same sentence in `plan.json`, target 4.8.

   **Claim.** The object is the fibre of the map from T_X[1]{1} to its de Rham stack, and ALRS Remark 3.1.4 defines it.

   **Witness.** ALRS line 2232 (Remark 3.1.4) has the weight twist (−1) and the relative stack T^dR ×_{X^dR} X. The definition used in 9.1 is ALRS Remark A.3.2 (ALRS line 10074–10082, p. 187), an object over Y. For X = A¹, A = C_p[ε]/ε², the absolute fibre has an extra factor C_p·ε from the base.

   **Repair.** Replace the clause by: "and, for i ≥ 0, the overconvergent shifted tangent complex (T_f[i])^† := fib(T_f[i] → (T_f[i])^dR) of Gelfand stacks over Y, where (T_f[i])^dR has value τ_{≥−i}Hom_A(η^*L_f, A^u) on a nilperfectoid η: GSpec(A) → Y, so that (T_f[i])^†(A) = τ_{≥−i}Hom_A(η^*L_f, Nil†(A)); for a line bundle L on Y, (T_f[i] ⊗ L)^† likewise (ALRS Remark A.3.2, p. 187, ALRS line 10074; the weight-(−1) case is ALRS Remark 3.1.4, p. 43, ALRS line 2230)". Add the API list: "T_f[i](η: GSpec(R) → Y) = τ_{≥−i}Hom_R(η^*L_f, R)"; "(T_f[i])^† → T_f[i] → (T_f[i])^dR is a fibre sequence of spectrum objects over Y"; "L_{BG/S} ≅ e^*L_f[−1] for G → S formally smooth with a deformation theory". Add the Check: "For Y = A¹ over GSpec(ℚ_p) and A = C_p[ε]/ε², (T_Y[1])^†(A) = B(C_p·ε) = BG_a^†(A); the fibre of T_Y[1] → (T_Y[1])^dR taken with the absolute de Rham stack of the total space would also contain the †-neighbourhood C_p·ε of the base point in A¹." Tested on the witness: τ_{≥−1}Hom_A(A, C_p·ε) = B(C_p·ε), with no contribution of the base; for Y = GSpec(ℚ_p) both sides are a point.

2. **F02** (P3) 10.3: G_r is defined through itself, and a Check uses it for the subgroup of points

   **Location.** `design/README.md` line 1426 (10.3): "G_r the induced rigid analytic group ⊔_{g ∈ G/G_r} gG_0(r)"; line 1445 (fifth Check): "since G_{r′} ∩ ℤ_p = pℤ_p for 1/p ≤ r′ < 1".

   **Claim.** G_r is defined, and its intersection with ℤ_p is pℤ_p.

   **Witness.** The index set G/G_r uses G_r before it exists; ALRS line 5094–5098 first names the compact open subgroup of ℚ_p-points of G_0(r), then reuses the letter. For G = ℤ_p, r′ = 1/p: the rigid group G_{r′} = ⊔_{a ∈ ℤ/p}(a + D(1/p)) contains ℤ_p, so G_{r′} ∩ ℤ_p = ℤ_p.

   **Repair.** In the statement write "G_r the induced rigid analytic group ⊔_{g ∈ G/G_0(r)(ℚ_p)} g·G_0(r), where G_0(r)(ℚ_p) ⊆ G_0 is the compact open subgroup of ℚ_p-points of G_0(r)"; in the Check write "since G_0(r′)(ℚ_p) = pℤ_p for 1/p ≤ r′ < 1"; mirror both in `plan.json`. Tested on G = ℤ_p, r′ = 1/p: G_0(1/p)(ℚ_p) = {|x| ≤ 1/p} ∩ ℤ_p = pℤ_p, G/G_0(r′)(ℚ_p) = ℤ/p, G_{r′} = p discs, as the Check then says.

3. **F03** (P3) twenty targets define notions without an API list

   **Location.** `design/README.md`, targets 3.5, 4.3, 4.7, 4.8, 5.2, 5.4, 6.3, 7.4, 7.5, 7.6, 8.4, 9.4, 9.5, 9.9, 10.4, 10.7, 10.8, 10.9, 11.10, 12.1; for example lines 1174–1180 (8.4): "define the Breuil–Kisin ideal I_BK = ⊗_{n∈ℕ} (φ^n)^* I_Δ", followed by `*Needs:*` and `**Checks.**` only.

   **Claim.** Every definition has its API.

   **Witness.** `plan.json` types the twenty targets `theorem` with `"api": []`, although each statement contains "define", "call" or "Define" (scripted; 8.4, 7.6, 10.7, 10.8, 10.9 and 4.8 read). Their properties are in the "Prove" clauses, not in bullets.

   **Repair.** At the package stage give each of the twenty a "The API has the following laws." list of two to four bullets restating, in prose, the properties its statement already proves of the defined notion (for 8.4: I_BK is a line bundle on Q_p^Δ, locally a finite tensor product; its pullback to 𝒳_T is the ideal of ⊔_{n∈ℕ} φ^{n,*}D; it is trivial off ⋃_n φ^{−n}(Q_p^HT)). No statement changes. Tested on 8.4: the three bullets are the content of ALRS Remark 4.2.8, Lemma 4.2.10 and the fourth Check.

Three findings, all P3, each with a repair to apply; no P1 or P2. All seven round-10 findings are repaired. The design declares 21 supplier gaps, two of which (`gestalten-affine-proper`, `gestalten-transmutation`) still have no owner: that was settled as `not actionable in this package` in the round-4 repair report, the reason still holds (checked below), and it is listed for the human reviewers.

Files reviewed: `packages/RationalAnalyticPrismatization/design/README.md` (1880 lines, 12 layers, 88 targets), `packages/RationalAnalyticPrismatization/design/plan.json`, `packages/RationalAnalyticPrismatization/sources.toml`. No file of the design was changed, nothing was added to the manifest, and no `needs-references.toml` was written.

## Verified sound

**Round-10 ledger.** All seven are repaired.

| Finding | State | Repaired passage read at this head |
|---|---|---|
| F01 (P1) 3.4 bullet | repaired | line 640: "comes from a continuous map M(A) → X(ℚ_p); for a light profinite set S, S^dR(A) = S(Marc(A^u)) is the set of continuous maps M(A) → S, which need not be locally constant"; new Check line 647 |
| F02 (P2) 10.5 compact G | repaired | line 1467: "Let G be a compact p-adic Lie group."; "for compact p-adic Lie groups G and H acting"; bullets lines 1474–1475 begin "For compact …" |
| F03 (P3) 7.6, λ < 0 | repaired | line 1093: "BC(O(λ)[1]) = B(G_a^an ⊗ D_{−λ}) ×_{B(G_a^{an,dR} ⊗ D_{−λ})} BC(O(λ)[1])^dR", with the note on the printed corner; Check line 1103 |
| F04 (P3) 10.9 statements | repaired | line 1527: both results stated with hypotheses; read against ALRS line 6348–6367, 6444–6450, 6824–6829 |
| F05 (P3) τ(α) | repaired | line 1450: "where τ(α) = Σ_i w(g_i)·α_i for the p-valuation w and the ordered basis g_1, …, g_d"; ALRS line 5333–5334 |
| F06 (P3) stalk order | repaired | 1.5 line 316 defines κ(x) as the completed residue field of A^u; 1.6 line 339 defines A_x and proves (A_x)^u = κ(x); `*Needs:*` of 1.6 lists §1.5, §1.4, §1.3 |
| F07 (P3) rigid group notation | repaired | line 1426: "a rigid analytic group 𝒢 over ℚ_p whose group of ℚ_p-points G = 𝒢(ℚ_p) is a p-adic Lie group of dimension dim 𝒢" |

Patterns of the repairs looked for elsewhere: "locally constant" for points of Betti stacks (other occurrences are function algebras or rings with M(A) a point); compact-only notions used for non-compact G (10.6, 10.9, 10.12 use O^la = h_*O, defined for all G); results stated by source number only (none); forward references inside a statement (found: {1} in 4.8, part of R01); one letter in two senses (found: R02).

**Sources, seeded sample.** The author flags no locator as unverified. A script checked all 397 locators of the form "p. N, <id> line M" against the page markers of the cached texts: all agree.

| Target | Read | Result |
|---|---|---|
| 1.7 | ABLB line 1724–1733, 1828–1844; And21 line 2733–2734, 2779–2780 | match (Definition 3.3.1, Proposition 3.3.5; Theorem 5.50, Lemma 5.51) |
| 2.3 | ALRS line 809–813, 820–825, 841–843, 861–862; ABLB line 2235–2259 | match |
| 2.7 | ALRS line 937–966, 972–975 | match (Definition 2.2.3, Remark 2.2.4(1)–(6), Lemma 2.2.5) |
| 2.8 | ABLB line 2023–2025, 2067–2069, 2690–2693, 2737–2742; ALRS line 996–1016 | match |
| 4.1 | ALRS line 1248–1297, 1302–1305; ABLB line 3051–3057 | match |
| 4.8 | ALRS line 10041–10056, 10074–10083, 10104–10107, 10123–10130, 10234–10243, 2230–2233 | statements match; the definition of (−)^† is R01 |
| 8.1 | ALRS line 2953–2968, 2988–2992, 3026–3041; FS line 2105–2110 | match |
| 8.4 | ALRS line 3154–3184, 3217–3226, 3250–3255 | match |
| 10.3 | ALRS line 5086–5180 | match; notation is R02 |
| 10.6 | ALRS line 420–424, 4743–4746, 5763–5770, 5814–5826 | match |
| 10.7 | ALRS line 4747–4752, 5831–5833, 5851–5932 | match |
| 11.4 | ALRS line 7918–7930, 7962–7968 | match |
| 11.5 | ALRS line 7969–8010, 8061–8071; RCSen line 64–75 | match |
| 12.2 | ALRS line 8745–8762, 8862–8871 | match |
| 12.5 | ALRS line 8992–9012, 9032–9040, 9084–9100; Zav line 1949–1958 | match |

Also read for the repairs: ABLB line 1324–1344 (Lemma 3.1.14, Definition 3.1.15), ALRS line 5326–5335, 5985–5990, 6727–6758.

**Adversarial table** (sampled targets, repaired passages, headlines, findings).

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 1.5 κ(x) | ℚ_p[ε]/ε²; ℚ_p × ℚ_p; Gauss point of ℚ_p⟨T⟩ | ℚ_p; ℚ_p at each point; completion of ℚ_p(T), not Frac(ℚ_p⟨T⟩) | holds |
| 1.6 stalk | ℚ_p⟨T⟩ at T = 0; separation of x ≠ y | rational Z ∋ 0 with \|f(0)\| ≤ \|g(0)\| ≠ 0 contains {\|T\| ≤ p^{−n}} by the ultrametric inequality; {\|f^n\| ≤ \|p^k\|} with \|f(x)\|^n ≤ p^{−k} < \|f(y)\|^n separates, so M(A_x) = {x}; (A_x)^u = ℚ_p = κ(x) | holds |
| 1.7 | ℚ_p; ℚ_p × ℚ_p; ℚ_p[ε]/ε² | perfect = dualizable; ranks (1, 0) allowed; ℚ_p = B/ε has infinite resolution, not dualizable | holds |
| 2.3 | GSpec(ℚ_p); ∅; ℚ_p⟨T⟩ over ℚ_p | Perf = bounded finite-dimensional complexes; 0; nuclear, in D^+, not dualizable | holds |
| 2.7 | GSpec_X(O_X); A = ℚ_p[u^{±1}], \|u\| = 2 | X; ∅, a unit of positive degree has no image in a connective ring | holds |
| 2.8 left adjoint on Marc(A), A qfd perfectoid | A td; A not td | GSpec(A) by ABLB 4.5.5; colim GSpec(A^•) = GSpec(A) by 2.4(3) | holds |
| 2.8 final object | Marc(ℚ_p) | image GSpec(C_p)/Gal^cont ≠ GSpec(ℚ_p) (ABLB line 2747) | holds |
| 3.4 bullet and Check | A = C_p[ε]/ε²; A = C(ℤ_p, C_p) | ℚ_p ⊕ C_p ε; A ×_{A^u} C(ℤ_p, ℚ_p) = C(ℤ_p, ℚ_p) ∋ inclusion, = Γ(FF_A, O) of 7.5 | holds |
| 4.1 | 0 → A¹ at C_p[ε]/ε²; isomorphism | target Nil† = C_p ε, source a point: not †-formally étale; identity | holds |
| 4.8 (−)^† | Y = A¹, A = C_p[ε]/ε² | relative: B(C_p ε); absolute de Rham stack: extra C_p ε from the base | R01 |
| 4.8 Checks | BG_m; trivial G; C_p/ℚ_p | O[−1]; 0; L = C_p(1)[1] ≠ 0 (p-completed Ω of O_{C_p}/ℤ_p) | holds |
| 7.6, λ = −1 | A = C_p; A = C_p[ε]/ε² | π₀ = C_p/ℚ_p, π₁ = 0; π₁ = ker(A ⊗ D_1 → C_p ⊗ D_1) = C_p ε ⊗ D_1, π₀ = C_p/ℚ_p | holds |
| 8.1 | [p]_q, q − 1, [p]_q² on X_cyc | one untilt ℚ_p(μ_{p^∞}); empty; twice an untilt | holds |
| 8.4 | cyclotomic δ-space | zeros of log(q)/(q − 1): primitive p^k-th roots, k ≥ 1 = zeros of φ^{n,*}[p]_q = Φ_{p^{n+1}}(q), n ≥ 0; disjoint | holds |
| 10.3 G_r | G = ℤ_p, r′ = 1/p | G_0(r′)(ℚ_p) = pℤ_p; G_{r′} ∩ ℤ_p = ℤ_p | R02 |
| 10.3 Mahler | (1 + p)^a | c_n = p^n, p^{−n}r^n → 0 for r < p (also p = 2) | holds |
| 10.4 τ | 1 + p²ℤ_p, w = v_p(g − 1) and w − 1, p odd | τ(n) = 2n and n; w − 1 ≥ 1 > 1/(p − 1), w(g^p) = w(g) + 1 | holds |
| 10.5 | G = ℤ; G finite | excluded, M^la undefined; R^la = R | holds |
| 10.6 | G trivial; X = pt; X = ℤ_p^cont | 2.7; BG^cont → BG^la, O^la = O; D(ℚ_p) against D(ℤ_p^sm/ℤ_p^la) = D(BG^†), strictly larger, O^la-modules = D(G^la/G^la) = D(ℚ_p) | holds |
| 10.7 | ℚ_p^cyc; C(G, ℚ_p); G trivial | K^la = ℚ_p(μ_{p^∞}), completion K; C^la_G with completion C(G, ℚ_p); R^la = R | holds |
| 10.9 | G = G_0 trivial; constant B_{j,0} = ℤ_p | square Y → Y′ over X → X′ cartesian by definition, P^la = P; X_B = X | holds |
| 11.1, 11.2 (headlines) | C_p(n), n = 0, n ≠ 0 | K →^0 K: H⁰ = H¹ = K; n invertible: 0 | holds |
| 11.4 | X = D | X^{Div¹/FF_D} = FF_D, α the identity | holds |
| 11.5 | dim X = 1; X = D | M → M ⊗ Ω¹{−1}, L = (T{1})^∨[−1] = Ω¹{−1}[−1]; Higgs field 0 | holds |
| 11.6 (headline) | X = GSpec(K); X = ∅ | 11.1; both empty | holds |
| 11.7 (headline) | K = ℚ_p; [K : ℚ_p] = n | dimensions 1, 2, 0 for every p; h¹ = n + 1 | holds |
| 12.2 (headline) | Tate duality; ω_{A¹/G_m} | (1, 2, 0) against (0, 2, 1) for ℚ_p(1); ω_{BG_m} = O[−1], O[−1] ⊗ I[1] = I | holds |
| 12.5 (headline) | d = 1; d = 0; general d | O{1}[2] ⊕ O; O; ⊕_k O{−k}[−2k] twisted by {d}[2d] = ⊕_k O{d − k}[2d − 2k] | holds |
| 12.3, 12.4, 12.6 (headlines) | rows of round 10 | P¹: f_*O{1}[2] = (O ⊕ O{−1}[−2])^∨; point: Fil⁰ B_dR = B⁺_dR | not re-computed |

Targets outside this table rest on the computed rows of the earlier rounds, which no repair touched.

**Structure (scripted).** 88 targets (16 definitions, 14 constructions, 58 theorems). Every definition and construction has an API list and at least three Checks; every target has at least three Checks and a locator; twenty theorem-typed targets that define notions have no API list (R03). All 534 plan statements, API bullets and tests occur verbatim in the README. All 21 gaps have the same slug and `needs` sentence in plan and README. Policy search (LaTeX delimiters, pull-request numbers, machine paths, `set_option`, HTML, process words): nothing. The README has no backticked name of its own.

**Pins.** `lake-manifest.json`: Mathlib `1b1ccf4b…`, Tau Ceti `2fd255d9…`, as the README says. The 20 cited declarations were opened at the cited file and line and are there: `LightProfinite` :44, `LightCondensed` :29, `MulRingSeminorm` :61, `spectralNorm` :381, `WittVector` :52, `fontaineTheta` :166, `BDeRhamPlus` :75, `PadicComplex` :137, `TauCeti.LocallyAnalytic` :45, `eval` :85, `spaY` :116, `frobeniusHomeomorph` :220, `IsRadiusLowerBound` :102, `IsRadiusUpperBound` :108, `isRadiusLowerBound_comap_frobenius_iff` :149, `windowU` :260, `windowV` :267, `spaX` :59, `compactSpace_spaX` :259, `t0Space_spaX` :271. `GelfandSpectrum` occurs nowhere in the pinned libraries; the README cites it as a name of AdicSpacesPartIII §R3.9, not as a pinned declaration.

**Principles.** No re-planned roadmap, no upward supply, no algorithm, no copied passage, no Lean file at this stage.

**Duplication audit.** `roadmaps grep -i` at the index of 2026-11-15 for Gestalt, Stefanich, Gelfand ring, Gelfand stack, analytic de Rham stack, prismatization, derived Berkovich: only AnalyticStacks, whose Scope gives all of them to this roadmap (its lines 22–23). For twistor stack, Hyodo–Kato stack, nilperfectoid, classically decompleted, Hodge–Tate stack: no roadmap. Overlap facts: no pull request changes this roadmap, drops an id it cites, or defines one it cites only in a revision; it is not a second copy (no folder of this name on main).

Overlap check: read the Scope and ownership of AnalyticStacks (with its consumer note), PrismaticCohomologyPartIII, PrismaticCohomologyPartIV, AInfCohomology and CohomologyComparisons (open), and of EnhancedDerivedSheaves, PerfectoidSpaces and DiamondsAndVStacks (main); nothing shared: analytic stacks, six functors, nuclear modules, Fredholm criteria and Cartier duality are AnalyticStacks' (consumed through gaps); the integral prismatic and logarithmic objects are the PrismaticCohomology parts' (used in Checks only); CohomologyComparisons §6.11 owns the decompletion of Pan's period representations for modular curves, a special case with its own hypotheses that this roadmap does not state; Gelfand rings and stacks, the analytic prismatization and the decompletion theorem over Gelfand rings are this roadmap's.

**Supplier order.** Gate output:

```
candidate: RationalAnalyticPrismatization is not in the merge order yet; checked as if placed after MotivesAndAlgebraicCyclesPartII (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2256 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every section of the 34 supplier rows of `plan.json` was resolved by script against the supplier's README (11 on main, 22 at open heads, MotivesAndAlgebraicCyclesPartII in the board's packages at merge-order line 388): all headings exist; AnalyticStacks 0.6, 0.9, 0.10, 2.3, 2.11, 6.4, 7.2, 7.5 and PrismaticCohomology §1.5 are numbered targets inside a grouped heading. The one lead of `roadmaps resolve` ("MotivesAndAlgebraicCyclesPartII Layer 0") is that board package: `packages/MotivesAndAlgebraicCyclesPartII/README.md` has "## Layer 0: The Banach arc-site". No Lean name is unresolved.

**Gaps.** Nineteen gaps name a supplier whose section exists at its head (eighteen AnalyticStacks, one DiamondsAndVStacks §D6.5); each `needs` sentence names one deliverable with its hypotheses and asks for nothing at the pins. `gestalten-affine-proper` and `gestalten-transmutation` have supplier `none`; the round-4 repair report marked this "not actionable in this package: Gestalten have no owner, and creating a Gestalten roadmap is a board decision". The reason holds at this index (AnalyticStacks places Gestalten outside its scope and no other roadmap mentions them), so it is not re-raised.

**Headline theorems** (Summary): 11.6 with 11.1 and 11.4; 11.7; 11.2, 11.5, 11.8; 10.12 with 11.9–11.10; 12.2–12.4; 12.5; 12.6. None is statable at the pins: neither library has analytic rings, Gelfand stacks or Fargues–Fontaine curves as stacks. The package stage says so in the module docstring.

**Copyright.** The fifteen sampled statements and the seven repaired passages (1.5, 1.6, 3.4, 7.6, 10.4, 10.5, 10.9) were set beside ALRS, ABLB, And21, FS, Zav and RCSen at their locators. Longest shared runs: "a principal homogeneous space for the overconvergent shifted" (8 words, 9.1, a name); "cohomologically proper and cohomologically smooth with dualizing complex" (8 words, 12.2, forced terminology). No sentence, list or proof plan is reproduced; no table, figure or list of examples is taken over.

Arrangement against ALRS (contents at ALRS line 15–70), unchanged since round 9: Layers 1–3 are built from ABLB §§2–5; Layer 4 ↔ §§2.6–2.7 with Appendix A; Layer 5 ↔ §§2.8–2.9, 3.1; Layer 6 ↔ §3.2 with ABLB §6 and ALBM; Layer 7 ↔ §§3.3–3.7; Layer 8 ↔ §§4.1–4.3 and part of 4.7; Layer 9 ↔ §§4.4–4.10; Layer 10 ↔ §§5.2–5.8 then 5.1; Layer 11 ↔ §§6.1–6.4; Layer 12 ↔ §§6.5–6.7. No source chapter is one layer and three layers cross chapter boundaries. The order 7 → 8 → 9 → 11 → 12 is forced by the `*Needs:*` lines (8.4 needs 8.3, 6.1; 9.1 needs 8.6; 11.1 needs 9.7 and 10.12; 12.2 needs 9.7, 9.8, 11.1), and Layer 10 needs only Layers 1–7.

Source independence: 22 passages compared with 6 sources, none shared; largest share ALRS, 343 of 482 line locators; contents compared with ALRS: independent.

## Not verifiable

- Lean elaboration, the `#check` pass and the one-tactic padding probe: not available (this lane does not elaborate, and the design has no `Suggested.lean`).
- Ownership against open pull requests was checked through `roadmaps grep` and by reading the roadmaps of the Overlap check; the other open roadmaps were not read.
- Targets outside the sample and the repaired passages rest on the computed rows of rounds 1–10; the reports of rounds 8 and 9 were not available to this round, only their repair reports and the round-10 report.
- R03 lists twenty targets from a script over `plan.json` (empty `api`, statement containing "define" or "call"); six of them were read in the README.
- 12.3, 12.4 and 12.6 were not recomputed this round.

## Source issues

- **Misprint** in ALRS at Theorem 6.2.2(4), printed page 147 (ALRS line 7986–7989): the source twists the classifying stack of the overconvergent tangent bundle by {−1} and the top Higgs term by {−1}; it should be {1}, as at ALRS line 7970, and {−dim X}; affects nothing.
- **Misprint** in ALRS at Corollary 5.6.12, printed page 125 (ALRS line 6825): the source calls the family of algebras cofiltered and takes its colimit; it should be filtered; affects nothing.
- **Misprint** in ALRS at Remark 5.4.4, printed page 110 (ALRS line 5868): the source cites the definition of Berkovich-étale maps in ABLB as Lemma 3.2.8; it should be Definition 3.2.8; affects nothing.
- **Misprint** in ALRS at Proposition 3.7.4(2), printed page 56 (ALRS line 2924): recorded in round 10; stands.

## For the human reviewers

- **Scope.** The main sources are unpublished: ALRS (2026, author page), ABLB (arXiv 2510.15196), RCSolid, RC26a, Gest (lecture notes); 417 of 482 line locators are to ALRS and ABLB. No refereed source states the headline theorems.
- **Licence.** `sources.toml` records ALRS, Gest and Sch24 as author-page copies; no licence is stated on the files.
- **Ownership.** `gestalten-affine-proper` and `gestalten-transmutation` have supplier `none` (`design/README.md` lines 172, 210, 212); no roadmap owns Gestalten. A later acceptance would be conditional on them; who supplies them is the board's decision.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "108b11707f37ad2d7ab485113fd3c0d9056fb16e", "job": "REV-DESIGN-RationalAnalyticPrismatization~11", "model": "fable", "worker": "chris-x29"} -->
