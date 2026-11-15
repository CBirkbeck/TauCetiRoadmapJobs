<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16360#issuecomment-6899248965 -->
Review (claude) of ee39e4d

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) the relative twistor stack is used in five targets and defined in none

   **Location.** `design/README.md` line 1210 (8.2): "the relative prismatization Y^{Δ/𝒳} = Y^Δ ×_{D^Δ} 𝒳 and relative Hodge–Tate stack Y^{HT/D} = Y^{Δ/𝒳} ×_𝒳 D over a prism"; line 1334 (9.2): "the squares relating X^{Div¹/𝒳}, X^{HK/𝒳}, …"; line 1764 (11.4): "α_{X/D}: FF_{X^⋄} → X^{Div¹/FF_D}".

   **Claim.** Every object a statement uses is defined in a target; 11.4 is a headline.

   **Witness.** X^{Div¹/𝒳} and X^{Div¹/FF_D} occur at lines 1334, 1764, 1772, 1780 and 1835 only; no target defines them. ALRS Definition 4.1.8(1) (ALRS line 3052–3057) defines them for a perfect analytic prism; 8.2 restates only the Δ and HT parts.

   **Repair.** In 8.2 (README and `plan.json`), after "Y^{Δ/𝒳} = Y^Δ ×_{D^Δ} 𝒳" add: "for a perfect analytic prism (S, 𝒳, D), the relative perfect prismatization Y^{Div¹~/𝒳} = Y^{Div¹~} ×_{D^{Div¹~}} 𝒳 and the relative p-adic twistor stack Y^{Div¹/𝒳} = Y^{Div¹~/𝒳}/φ^ℤ = Y^{Div¹} ×_{D^{Div¹}} 𝒳/φ^ℤ, written Y^{Div¹/FF_D} for a perfectoid D over ℚ_p with 𝒳 = D^×_{FF,D^♭}". Add the API bullet "Y^{HT/D} = Y^{Div¹/𝒳} ×_{𝒳/φ^ℤ} D for a perfect prism". Tested on the witness: for Y = D perfectoid, D^{Div¹} = FF_D (8.3), so D^{Div¹/FF_D} = FF_D ×_{FF_D} FF_D = FF_D, the value the first Check of 11.4 uses; for 𝒳 = ∅ everything is empty.

2. **F02** (P3) the Supply sentence of `proetale-v-comparison` covers qcqs X, 11.7 uses partially proper X

   **Location.** `design/README.md` line 214: "and after inverting p for qcqs X the equivalence RΓ_proét(X, ℚ̂_p) ≃ RΓ_v(X^⋄, ℚ_p)"; line 1807 (11.7): "X a smooth partially proper rigid space over K"; the same `detail` in `plan.json`.

   **Claim.** The contract supplies the comparison 11.7 consumes.

   **Witness.** The open unit disc is smooth and partially proper and not quasi-compact; RΓ_proét(X, Ẑ_p)[1/p] ≠ RΓ_proét(X, ℚ̂_p) is possible there (an Rlim over closed discs does not commute with inverting p). The `needs` sentence is for every rigid X; the Supply sentence is narrower.

   **Repair.** Replace "and after inverting p for qcqs X the equivalence RΓ_proét(X, ℚ̂_p) ≃ RΓ_v(X^⋄, ℚ_p)" by "and, for every such X, the equivalence RΓ_proét(X, ℚ̂_p) ≃ RΓ_v(X^⋄, ℚ_p) for the sheaf ℚ̂_p = Ẑ_p[1/p], obtained for qcqs X by inverting p and in general by descent along an analytic cover by qcqs opens, both sides being sheaves in X". Tested on the open disc X = ⋃ X_n: both sides are Rlim_n of the values on the closed discs X_n, where the qcqs case applies, and the comparison is compatible with restriction.

3. **F03** (P3) two plan test names occur twice

   **Location.** `design/plan.json`: test `proper_identity` in targets 2.2 and 12.4; test `HT_perfectoid` in targets 8.3 and 9.1.

   **Claim.** Plan names identify one item each.

   **Witness.** Scripted over all target, API and test names of `plan.json`: exactly these two names have two owners; the four Checks are different statements (0-properness of the identity against duality for the identity; D^HT = D for perfectoid D against the trivial gerbe).

   **Repair.** Rename the 12.4 test to `properDuality_identity` and the 9.1 test to `HTgerbe_perfectoid` in `plan.json`; the README has no names for Checks and does not change. After the change the script returns no repeated name.

Three findings, all P3, each with a repair, so the verdict asks for changes; no P1 or P2. All three round-11 findings are repaired. The design declares 21 supplier gaps, which are contracts and not findings. Two of them (`gestalten-affine-proper`, `gestalten-transmutation`) still have supplier `none`: the round-4 repair report settled this as `not actionable in this package` ("Gestalten have no owner, and creating a Gestalten roadmap is a board decision"); the reason still holds at this index (checked below), so it is not re-raised and is listed for the human reviewers.

Files reviewed: `packages/RationalAnalyticPrismatization/design/README.md` (2017 lines, 12 layers, 88 targets), `packages/RationalAnalyticPrismatization/design/plan.json`, `packages/RationalAnalyticPrismatization/sources.toml`. No file of the design was changed, nothing was added to the manifest, and no `needs-references.toml` was written. No maintainer notes were given for this round.

## Verified sound

**Round-11 ledger.** All three are repaired.

| Finding | State | Repaired passage at this head |
|---|---|---|
| F01 (P3) 4.8 | repaired | line 844: "(T_f[i])^† = fib(T_f[i] → (T_f[i])^dR), a Gelfand stack over Y with (T_f[i])^†(η) = τ_{≥0}Hom_A(η^*L_f, Nil†(A)[i]) (ALRS Remark A.3.2, p. 187, ALRS line 10074)"; four API bullets; new Check line 861. Read against ALRS line 10041–10083 and 2230–2233 |
| F02 (P3) 10.3 | repaired | line 1522: "G_0(r)(ℚ_p) ⊆ G_0 the compact open subgroup of ℚ_p-points of G_0(r) … G_r the induced rigid analytic group ⊔_{g ∈ G/G_0(r)(ℚ_p)} g·G_0(r)"; Check line 1541: "since G_0(r′)(ℚ_p) = {x ∈ ℤ_p : \|x\| ≤ r′} = pℤ_p". Read against ALRS line 5086–5112 |
| F03 (P3) API lists | repaired | scripted: no target whose statement contains "define" or "call" has an empty `api`; 75 new bullets, all verbatim in the README; e.g. 8.4 lines 1249–1254 |

The repair also wrote out seven notions; each was read at its locator: 3.5 Tannakian, strongly Tannakian, perfect (ALRS line 1092–1103); 4.3 "two Zariski closed maps"; 5.2 Sqz(Y/S; η) (ALRS line 1716–1723); 5.4 Div¹_{A¹} and the Hodge stack (ALRS line 2230–2262); 10.4 Mod_R(D(BG^Bin_{r,ϖ})) (ALRS line 5492–5495); 10.7 the algebra B (ALRS line 5877–5881); 10.8 uniform ϵ-TORS and the dϵ loss (ALRS line 6203–6234). All match. Patterns looked for elsewhere: objects used without a defining target (found: R01); one symbol in two senses (none further); results named by source number only (none).

**Sources, seeded sample.** The author flags no locator as unverified. A script checked all 398 locators of the form "p. N, <id> line M" against the page markers of the cached texts: all agree.

| Target | Read | Result |
|---|---|---|
| 1.8 | ALRS line 785–794, 2501–2506; ABLB line 1428–1429 | match (Definition 2.1.5, Remark 2.1.6, Proposition 3.4.7; Lemma 3.1.17) |
| 2.2 | ALRS line 704–783; ABLB line 2209–2213 | match (Construction 2.1.2, Remarks 2.1.3–2.1.4; E₀ ⊂ E₁ ∩ E₂ as stated) |
| 2.3 | ALRS line 797–800, 809–826, 838–845, 859–864 | match (§2.1 on dualizable objects, Lemmas 2.1.8–2.1.10); ABLB line 2235–2259 as read in round 11 |
| 2.8 | ALRS line 996–1016; ABLB line 2752–2757 | match (fibre products but not the final object, ALRS line 1015) |
| 3.2 | ABLB line 4799–4804, 4629–4634, 3384–3385, 2752 | match (Theorems 5.6.6, 5.6.1, 4.8.7, Proposition 4.5.7) |
| 4.4 | ALRS line 1538–1562 | match (Definition 2.7.7, Example 2.7.8, Lemma 2.7.9) |
| 7.1 | ALRS line 2398–2436, 2670–2676 | match (Definition 3.3.1, Remark 3.3.2, Examples 3.3.4–3.3.5, Lemma 3.5.2) |
| 8.6 | ALRS line 3390–3409 | match ((4.3.1), Propositions 4.3.1–4.3.2) |
| 9.6 | ALRS line 3985–4010 | match (Corollaries 4.6.11–4.6.12) |
| 10.1 | ALRS line 4815–4835 | match (Construction 5.2.1) |
| 10.10 | ALRS line 6847–6881, 6930–6938, 7338–7346, 7371–7417 | match (Assumption 5.7.1, Proposition 5.7.3, Theorem 5.7.4, Proposition 5.7.16, Corollary 5.7.18, Theorem 5.7.19(1)–(4)) |
| 11.4 | ALRS line 7918–7930, 7967–7968 | match (Theorem 6.2.1) |
| 11.5 | ALRS line 7969–8012 | match (Theorem 6.2.2; the misprint of its part (4) is not copied) |
| 11.9 | ALRS line 8321–8356 | match (Theorem 6.4.1, Remarks 6.4.2–6.4.3) |
| 12.2 | ALRS line 8745–8765, 8860–8870 | match (Theorem 6.5.4, Remark 6.5.7) |

Also read for the headlines: ALRS line 476–484, 4738–4762, 7756–7766, 7873–7874, 8082–8089.

**Adversarial table** (sampled targets, repaired passages, headlines, findings).

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 1.8 nilperfectoid | C_p[ε]/ε²; ℚ_p(μ_{p^∞}); ℚ_p | †-red = C_p = A^u, perfectoid: yes; †-red = itself ≠ completion: no; A^u = ℚ_p not perfectoid: no | holds |
| 2.2 | GSpec(ℚ_p⟨T⟩) → GSpec(ℚ_p); identity | 0-affine, f_! = f_* forgetful; all classes, trivial ω and δ | holds |
| 2.3 | GSpec(ℚ_p); ∅; ℚ_p⟨T⟩ | bounded finite-dimensional complexes; 0; nuclear, in D^+, not dualizable | holds |
| 2.8 | ℚ_p[ε]/ε²; Marc(ℚ_p) | ⋄ = Marc(ℚ_p); left adjoint of the final object is not GSpec(ℚ_p) | holds |
| 3.2 | disjoint union; BG | (X ⊔ Y)^dR = X^dR ⊔ Y^dR; BG^sm | holds |
| 3.5 Tannakian | X = Spec R′; BG_m^sch | Tannaka duality for affine; symmetric monoidal functors from graded modules = line bundles, BG_m(A) = Pic | holds |
| 4.3 pushout | two closed discs at the origin; Z = ∅ | ℚ_p⟨S, T⟩/(ST); X ⊔ Y | holds |
| 4.4 | ℚ_p[ε]/ε² → ℚ_p; ℚ_p⟨T⟩ → ℚ_p | †-reductions ℚ_p = ℚ_p: †-thickening; ℚ_p⟨T⟩ ≠ ℚ_p: not | holds |
| 4.8 (T_f[i])^† | Y = A¹, A = C_p[ε]/ε², i = 1 and i = 0; Y = GSpec(ℚ_p); A = C_p | BA, BC_p, B(C_p·ε); C_p·ε = G_a^†(A); points; Nil†(C_p) = 0 gives a point | holds |
| 4.8 relative to X^dR | (x, L) over A | T^dR ×_{X^dR} X forces x′ = x\|_{A^u}: Hom(x^*L_X, (L ⊗ A^u)[1]), the value of (T_g[1] ⊗ L)^dR | same fibre |
| 5.2 Sqz(Y/S; η) | Y = X; η = 0; ℚ_p, M = ℚ_p | L_{Y/X} = 0: unique lift; fibre at 0 is Sqz(Y/X; f^*M); obstruction in π_0Hom(L_{Y/X}, f^*M[2]) by the long exact sequence of f^*L_{X/S} → L_{Y/S} → L_{Y/X} | holds |
| 5.4 Hodge stack | I → R zero; X = A¹ | R/(I ⊗ Nil†R) = R ⊕ (I ⊗ Nil†R)[1], so points are derivations into (I ⊗ Nil†R)[1]: (T_X[1] ⊗ I)^†; B(G_a^†(−1)) over A¹ × BG_m | holds |
| 6.3 API | d = 0, 1, 2 | O; H¹(G_m) = O(−1), ω = O(1)[2]; O(2)[4] | holds |
| 7.1 | D^× ⊔ D^×; S = ∅ | ι^⋄ not an isomorphism: not a δ-space; (∅, ∅) only | holds |
| 8.6 | X = GSpec(ℚ_p); X = ∅ | Div¹ = A¹/G_m ×_{A^{1,dR}/G_m^dR} Q_p^HK; all corners empty | holds |
| 9.6 | X = GSpec(ℚ_p) | T_X = 0: Q_p^{HT^} = Â¹/G_m ×_{BG_m^dR} GSpec(ℚ_p) | holds |
| 10.1 | ℤ/2 on ℚ_p × ℚ_p, twisted and untwisted (also p = 2) | M_2(ℚ_p); (ℚ_p × ℚ_p) ⊗ ℚ_p[ℤ/2] = ℚ_p⁴ commutative | holds |
| 10.3 G_r | G = ℤ_p, r′ = 1, 1/p, 1/p² | G_0(r′)(ℚ_p) = ℤ_p, pℤ_p, p²ℤ_p; 1, p, p² discs; G_{r′} ⊇ ℤ_p | holds |
| 10.8 API | trivial action; d = 0 | ϵ-TORS for every ϵ; excluded by δ > dϵ > 0 | holds |
| 10.10 | d = 0; Λ = ℚ_p; toric tower | mixed = arithmetic; exponents v_p(ϖ)^{−1}ℤ not dense: excluded; ϵ_{n,k} = p^{k−n} > ρ_{n,k} = p^{k−n−1} > 0, ϵ → 0 | holds |
| 10.12 (headline) | G trivial | X^la = X, three parts tautological | holds |
| 11.1, 11.2 (headlines) | C_p(n), n = 0, n ≠ 0 | K →^0 K: H⁰ = H¹ = K; n invertible: 0 | holds |
| 11.4 (headline) | X = D | X^{Div¹/FF_D} = FF_D, α the identity (uses the object of R01) | holds; R01 |
| 11.5 | dim X = 1; X = D | two-term Higgs complex; Higgs field 0, X^HT = D | holds |
| 11.6 (headline) | X = GSpec(K); X = ∅ | 11.1; both empty | holds |
| 11.7 (headline) | K = ℚ_p (p = 2 and odd); [K : ℚ_p] = n; open disc | dimensions 1, 2, 0; h¹ = n + 1; Rlim over closed discs on both sides | holds; R02 |
| 11.9 | G finite; X = GSpec(ℚ_p), G = ℤ_p | G^la = G^sm; Hom(Gal^ab, ℤ_p) of rank 2 (ℚ_p^× completed = Ẑ × ℤ_p^×, also p = 2) | holds |
| 12.2 (headline) | Tate duality; mirabolic | (1, 2, 0) against (0, 2, 1) for ℚ_p(1); δ(p) = [pℤ_p : ℤ_p] = p⁻¹; ω_{A¹/G_m} = O[−1] ⊗ I[1] = I | holds |
| 12.3 (headline) | d = 0; G_m over ℚ_p | O; O{1}[2] ⊗ f^*O{1}[2] = O{2}[4] | holds |
| 12.4 (headline) | P¹ | f_*O = O ⊕ O{−1}[−2], f_*(O{1}[2]) = O{1}[2] ⊕ O = (f_*O)^∨ | holds |
| 12.5 (headline) | d = 1; general d | O{1}[2] ⊕ O; ⊕_k O{d − k}[2d − 2k] | holds |
| 12.6 (headline) | X = GSpec(ℚ_p); E = O; shift | Fil⁰(B_dR) = B⁺_dR; (OB⁺_dR)^{∇=0} = B⁺_dR; F(E[1]) = Fil¹ = t·F(E) | holds |
| 12.1 cusp Check | R = ℚ_p⟨x, y⟩/(y² − x³) → k | L_{k/R} = k²[1] ⊕ k[2] (d(y² − x³) = 0 at 0); Koszul H_1 = k killed by one 2-cell in characteristic 0: finitely presented, not regular | holds |

Targets outside this table rest on the computed rows of the earlier rounds, which the last repair did not touch.

**Structure (scripted).** 88 targets (16 definitions, 14 constructions, 58 theorems). Every definition and construction, and every theorem-typed target that defines a notion, has an API list; every target has at least three Checks and a locator. All 611 plan statements, API bullets and tests occur verbatim in the README. All 21 gaps have the same slug and `needs` sentence in plan and README. Policy search (LaTeX delimiters, pull-request numbers, machine paths, `set_option`, HTML, process words): nothing ("lemma" occurs only in "Shapiro's lemma" and "Poincaré lemma"). The README has no backticked name of its own.

**Manifest.** 24 entries, all `certified` (21 open-repository, 3 author-page); every source id cited in the README is recorded, and the References list equals the manifest.

**Pins.** `lake-manifest.json`: Mathlib `1b1ccf4b…`, Tau Ceti `2fd255d9…`, as the README says. The 20 cited declarations were opened at the cited file and line and are there: `LightProfinite` :44, `LightCondensed` :29, `MulRingSeminorm` :61, `spectralNorm` :381, `WittVector` :52, `fontaineTheta` :166, `BDeRhamPlus` :75, `PadicComplex` :137, `TauCeti.LocallyAnalytic` :45, `eval` :85, `spaY` :116, `frobeniusHomeomorph` :220, `IsRadiusLowerBound` :102, `IsRadiusUpperBound` :108, `isRadiusLowerBound_comap_frobenius_iff` :149, `windowU` :260, `windowV` :267, `spaX` :59, `compactSpace_spaX` :259, `t0Space_spaX` :271. No Gelfand ring, prismatization or Sen operator exists in the pinned Tau Ceti (the files matching "Gelfand" are Gelfand–Tsetlin and C*-algebra files).

**Principles.** No re-planned roadmap, no upward supply, no algorithm, no copied passage, no Lean file at this stage.

**Duplication audit.** `roadmaps grep -i --readme-only` at the index of 2026-11-15 for Gelfand ring or stack, analytic de Rham stack, analytic prismatization: only AnalyticStacks, whose Scope (its line 22) gives them to this roadmap. For twistor stack, Hyodo–Kato stack, nilperfectoid, classically decompleted, decompletion theorem, rational δ-space, locally analytic Banach–Colmez: no roadmap. "Riemann–Hilbert functor": PerfectoidShimuraVarieties line 1960 defers the general functors to HodgeTateAndCanonicalSubgroups; this roadmap imports Scholze's E ↦ M(E) from PadicHodgeTheory §7.1 and owns only the comparison 12.6. Overlap facts: no pull request changes this roadmap, drops an id it cites, or defines one it cites only in a revision; it is not a second copy (no folder of this name on main). The consumer note of AnalyticStacks (its line 1305) still lists a slug `hypercover-inversion` that this design no longer declares; it maps the content to its 4.5, which is where `perfect-complexes-fredholm-stacks` points, so nothing breaks here.

Overlap check: read the Scope and ownership of AnalyticStacks (with its consumer note), PrismaticCohomologyPartIII, PrismaticCohomologyPartIV, AInfCohomology and CohomologyComparisons (open), of EnhancedDerivedSheaves and PerfectoidSpaces (main), and §§D6.4–D6.5 of DiamondsAndVStacks (main); nothing shared: AInfCohomology owns the integral Breuil–Kisin line A_inf{1} and CohomologyComparisons the Hyodo–Kato compatibility diagrams of log-prismatic theory, neither an analytic stack; analytic stacks, six functors, nuclear modules, Fredholm criteria and Cartier duality are AnalyticStacks' (consumed through gaps); the integral prismatic objects are the PrismaticCohomology parts' (Checks only); Gelfand rings and stacks, the analytic prismatization and the decompletion theorem over Gelfand rings are this roadmap's.

**Supplier order.** Gate output:

```
candidate: RationalAnalyticPrismatization is not in the merge order yet; checked as if placed after MotivesAndAlgebraicCyclesPartII (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2264 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every section of the 34 supplier rows of `plan.json` was resolved by script against the supplier's README: 12 on main, 21 at open heads, MotivesAndAlgebraicCyclesPartII in the board's packages ("## Layer 0: The Banach arc-site", with "### 0.4 Strictly totally disconnected Banach rings"). All exist; PrismaticCohomology §1.5 is the bold target "§1.5 Hodge–Tate cohomology and Breuil–Kisin twists of A/I-modules" inside a grouped heading; DiamondsAndVStacks has "### D6.4" and "### D6.5 The étale-site comparison"; AnalyticStacks has 7.2, 7.5, 7.6, 7.7. The one lead of `roadmaps resolve` is the board package above. No Lean name is unresolved.

**Gaps.** Nineteen gaps name a supplier whose section exists at its head (eighteen AnalyticStacks, one DiamondsAndVStacks §D6.5); each `needs` sentence names one deliverable with its hypotheses and asks for nothing at the pins (R02 concerns a Supply sentence, not a `needs`). For the two Gestalten gaps, `roadmaps grep -i gestalt` returns only AnalyticStacks, which places Gestalten outside its scope (its lines 22 and 1305): no owner exists, so the settled reason holds.

**Headline theorems** (Summary): 11.6 with 11.1 and 11.4; 11.7; 11.2, 11.5, 11.8; 10.12 with 11.9–11.10; 12.2–12.4; 12.5; 12.6. None is statable at the pins: neither library has analytic rings, Gelfand stacks or Fargues–Fontaine curves as stacks. The package stage says so in the module docstring.

**Copyright.** The fifteen sampled statements and ten repaired or added passages (3.5, 4.3, 4.8, 5.2, 5.4, 10.3, 10.4, 10.7, 10.8, 8.4 API) were set beside ALRS and ABLB at their locators. The definitions of 3.5 and 5.2 follow the source's conditions, which can be written in one way only; no sentence, list or proof plan is reproduced, and no table, figure or list of examples is taken over.

Arrangement against ALRS (contents at ALRS line 15–70): Layers 1–3 are built from ABLB with ALRS §§2.1–2.5; Layer 4 ↔ §§2.6–2.7 with Appendix A; Layer 5 ↔ §§2.8–2.9, 3.1; Layer 6 ↔ §3.2 with ABLB §6; Layer 7 ↔ §§3.3–3.7; Layers 8–9 ↔ §4; Layer 10 ↔ §§5.2–5.8 then 5.1; Layers 11–12 ↔ §6. No chapter is one layer, the appendix and a second source are distributed over Layers 1–6, and the order of Layers 7 → 8 → 9 → 11 → 12 and of the subsections of Layers 7 and 10 is forced by the `*Needs:*` lines (7.2 needs 7.1, 7.3 needs 7.2, 7.4 needs 7.3, 7.6 needs 7.5; 10.7 needs 10.6, 10.9 needs 10.7 and 10.8, 10.10 needs 10.9; 11.1 needs 9.7 and 10.12; 12.2 needs 11.1).

Source independence: 25 passages compared with 2 sources, none shared; largest share ALRS, 345 of 484 line locators; contents compared with ALRS: independent.

## Not verifiable

- Lean elaboration, the `#check` pass and the one-tactic padding probe: not available (this lane does not elaborate, and the design has no `Suggested.lean`).
- Ownership against open pull requests was checked through `roadmaps grep` and the roadmaps of the Overlap check; the other open roadmaps were not read.
- Targets outside the sample, the repaired passages and the headlines rest on the computed rows of rounds 1–11; the reports of rounds 8–10 were not available to this round.
- Of DiamondsAndVStacks only the headings and text of §§D6.4–D6.5 were read, not its whole scope section.

## Source issues

- **Misprint** in ALRS at Theorem 6.2.2(4), printed page 147 (ALRS line 7986–7989): the source twists the classifying stack of the overconvergent tangent bundle by {−1} and the top Higgs term by {−1}; it should be {1}, as at ALRS line 7970, and {−dim X}; affects nothing.
- **Misprint** in ALRS at Theorem 6.2.2(5), printed page 147 (ALRS line 7991–7992): the source refers to the geometric Sen operator "as in (2)"; it should refer to the operator defined before the theorem and used in part (3); affects nothing.
- **Misprint** in ALRS at Remark 3.1.4, printed page 43 (ALRS line 2231–2232): the source calls the Hodge stack the classifying stack of the overconvergent shifted tangent bundle; it is that shifted bundle itself, the classifying stack of the unshifted one; affects nothing.
- **Misprint** in ALRS at Lemma 2.7.9(1), printed page 29 (ALRS line 1556–1561): the source writes the composite as g ∘ f for Z → Y → X with g first; it should be f ∘ g; affects nothing.

## For the human reviewers

- **Scope.** The main sources are unpublished: ALRS (2026, author page), ABLB (arXiv 2510.15196), RCSolid, RC26a, Gest (lecture notes); 419 of 484 line locators are to ALRS and ABLB. No refereed source states the headline theorems.
- **Licence.** `sources.toml` records ALRS, Gest and Sch24 as author-page copies; no licence is stated on the files.
- **Ownership.** `gestalten-affine-proper` and `gestalten-transmutation` have supplier `none` (`design/README.md` lines 172, 210, 212); no roadmap owns Gestalten. The design depends on them; who supplies them is the board's decision.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ee39e4d4223bee99aaaab33e35cafd5e3abe8247", "job": "REV-DESIGN-RationalAnalyticPrismatization~12", "model": "fable", "worker": "chris-x29"} -->
