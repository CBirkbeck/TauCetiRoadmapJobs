<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13791#issuecomment-6895155639 -->
Review (claude) of da53238

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P3) §8.3: a "bounded neutral rate" does not give the domination §8.1 needs

   **Location:** D:649. Quote: "Apply §8.1 to the time-one map along orbits with the dominated splittings E^s ⊕ (ℝX ⊕ E^u) and (E^s ⊕ ℝX) ⊕ E^u (rates e^{−κ'} against a bounded neutral rate)".

   **Claim:** in the metric of §7.6 the time-one map satisfies §8.1's hypotheses `|B_n| ≤ λ < μ ≤ |A_n⁻¹|⁻¹` step by step for both splittings.

   **Witness:** flow of h∂_s on the cat suspension, |∂_s| = 1, h falling from 1 to e^{−3a} over an s-interval of length 0.05 (a = 0.9624): |Dg^1 X|/|X| = h(g^1x)/h(x) = e^{−3a} ≈ 0.056 < e^{−a} ≤ e^{−κ'}.

   **Exact repair:** in D:649 let the inner product of the chart statement also normalise the flow direction: "(for the inner product that makes E^s_x, ℝX(x) and E^u_x orthogonal, agrees with the metric of §7.6 on E^s_x and E^u_x and gives X(x) length 1)", and replace "(rates e^{−κ'} against a bounded neutral rate)" by "(rates e^{−κ'} and e^{κ'} against the neutral rate 1, since Dg^t X(x) = X(g^t x) has length 1 in this inner product)". The inner product is continuous because X is continuous and has no zero on Λ. Mirror the clause in P's 8.3 statement.

   **Tested on the witness:** with |X| ≡ 1 the neutral block of Dg^1 has norm 1 and conorm 1 whatever h is; e^{−κ'} < 1 < e^{κ'}, so both splittings satisfy §8.1 with λ = 1 < μ = e^{κ'} (unstable family, λ ≥ 1 allowed by §8.1's second Check) and with the inverse sequence (stable family).

2. **F02** (P3) §8.7: the constant L in the Hölder exponent is not the Lipschitz constant of Df

   **Location:** D:718. Quote: "optimising n gives θ = log λ⁻¹ / (log L + log λ⁻¹) with L a Lipschitz constant of Df".

   **Witness:** the section's first Check, a hyperbolic toral automorphism: Df is constant, so every L > 0 is a Lipschitz constant of Df; L = λ makes the denominator 0 and L < λ gives θ ∉ (0, 1].

   **Exact repair:** "with L > 1 a common Lipschitz constant of f and f⁻¹ on a neighbourhood of Λ, so that d(f^{∓n}x, f^{∓n}y) ≤ L^n d(x, y); the Hölder constant of Df enters only the constant C". The statement (existence of θ ∈ (0, 1] and C) needs no change.

   **Tested on the witness:** cat map, L = λ⁻¹ = (3 + √5)/2: θ = log 2.618 / (2 log 2.618) = 1/2 ∈ (0, 1], consistent with the Check (the constant bundle is Hölder for every θ).

3. **F03** (P3) §11.1: the metric of the running Check is Tau Ceti's Sol metric and is not cited

   **Location:** D:886. Quote: "take on ℝ × ℝ² the metric ds² + e^{2as} du² + e^{−2as} dv² … It is … smooth but not flat".

   **Witness:** `TauCeti/Geometry/Manifold/Riemannian/Sol/Basic.lean`:32, `TauCeti.Sol.riemannianMetric`, the metric e^{2z} dx² + e^{−2z} dy² + dz² on `TauCeti.Sol` (:63). Under (x, y, z) = (au, av, as) its pull-back is a²(ds² + e^{2as} du² + e^{−2as} dv²).

   **Exact repair:** add to "From Tau Ceti" (D:62–73): "`TauCeti.Sol`, `TauCeti.Sol.riemannianMetric` (`TauCeti/Geometry/Manifold/Riemannian/Sol/Basic.lean`): the metric e^{2z} dx² + e^{−2z} dy² + dz² on ℝ³; the metric of §11.1's Check is a⁻² times its pull-back under (s, u, v) ↦ (au, av, as), used in Checks only", and say so in the Check. No value changes: a constant factor does not change λ_t = e^{at} or φ^u = −a.

Three findings, all P3; no P1 or P2. Each carries a repair, so the verdict asks for changes: a fix round applies R01–R03. The two declared supplier gaps `gap:sphere-bundle-embedding` and `gap:connection-map-jacobi-derivative`, which only §9.3 uses, are contracts and are not findings. All six round-5 findings are repaired.

**D** is `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/README.md`, **P** is `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`. Only this report and `design/review.json` were written; no design file and no manifest entry was changed, and no source was fetched (every cited work is in the manifest). No maintainer notes were supplied.

## Previous findings, checked individually

| Round 5 | Repaired passage (quoted) and what was recomputed | Status |
|---|---|---|
| F01 (P2), distance ⊤ between components | D:30 "Distances on M are the truncated distance d(x, y) = min(1, ρ(x, y))"; D:619 the same; D:675 new Check. ρ(c, d) = ⊤, d(c, d) = 1; triangle: min(1, 1.2) = 1 ≤ 0.6 + 0.6; bi-Lipschitz on a compact K: near-minimising paths of length < r/2 stay in a compact neighbourhood where g₂ ≤ C²g₁, and for ρ₁ ≥ r/2, d₂ ≤ 1 ≤ d₁/min(1, r/2). | Repaired |
| F02 (P2), Bowen balls two owners | D:7 "the dynamical distances d_n and d_t, the API of ClassicalErgodicTheory's Bowen balls"; D:9, D:79, D:143. Supplier text read at its head (Conventions, "Separated sets and Bowen balls"). | Repaired |
| F03 (P3), §8.1 index set and clause (iii) | D:623 "for each n ∈ ℤ … if a point z has points z_L, L ≥ 0 … with z_0 = z, f_{n−L}(z_L) = z_{L−1}". Cone step recomputed (table). | Repaired |
| F04 (P3), charts of §8.3 | D:649 "there are charts straightening the weak plaques … φ_x(0) = x and derivative the identity"; two Checks D:656–657 recomputed (table). | Repaired; its route sentence is R01 |
| F05 (P3), process words | D:7 "No other roadmap plans these results". Searched D for pull-request numbers, "review", "currently", machine paths: none. | Repaired |
| F06 (P3), §1.1 locator | D:143 "lines 170–175 … line 945". ClimenhagaThompson2016 lines 171, 174, 175, 945 read: metric, open ball, closed ball, strict separation. | Repaired |

Nothing was marked "not actionable in this package"; nothing is re-raised. Repaired patterns searched in the rest of D: untruncated Riemannian distance (none left: D:11, D:52, D:734, D:871 all name the truncation or the extended distance); objects of ClassicalErgodicTheory restated as own (none: `IsExpansive`, `HasBowenProperty`, `IsGibbsMeasure`, `HasSpecification`, the flow versions, pressure and equilibrium states are all cited); clauses using inverses of non-invertible maps (none); charts used and not stated (the only other charts, D:619, are stated there).

## Verified sound

**Coverage.** D read in full (1000 lines, 11 layers, 45 targets). P parsed: 45 targets whose ids equal D's `### k.n` headings; every `target:` prerequisite is earlier than its consumer; every target has at least three tests; the two gaps have the slugs of D:130–131 and are prerequisites of 9.3 only. Every work cited in D has a manifest key and conversely (18 keys).

**Adversarial table** (the fifteen sampled targets, the headlines, the passages the repairs changed, and the targets the findings touch).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Conventions, truncated distance | {c, d} in two copies of ℝ²; 𝕋²; ℝ/ℤ | ρ = ⊤, d = 1; diameter √2/2 < 1 and 1/2 < 1, so d = ρ and no torus or circle Check changes | Pass |
| §1.1 Bowen ball = open d_n-ball | doubling map ε = 1/8; n = 0; flow t = 0 | n = 1: 1/8; n = 2: {abs(x) < 1/8, abs(2x) < 1/8} = 1/16; n = 0 both sides the whole space; `Icc 0 0`: the ε-ball | Pass |
| §1.1 Γ_ε as an intersection | two-shift, y with single 1 at −1 | d(T^k 0, T^k y) = 2^{−k−1}; d(T^{−1}0, T^{−1}y) = 1 > 1/2; T^n(B̄_{2n+1}(T^{−n}x)) tests times −n…n | Pass |
| §1.1 semiconjugacy, flow/time-t balls | constant map L = 0; rotation flow t = 1 | B_1(pt, 0) = ∅; n = 0: whole circle ⊄ arc of half-width 1/4; n ≥ 1: δ-arc ⊆ 1/4-arc | Pass |
| §2.2 `HasSpecification` ⇒ weak | supplier's intervals with a_{i+1} − b_i = M | gluing time M − 1 ≤ M; swap: no y with T^p y = y for odd p; suspension: p + τ ∈ (n, n + 1) for abs(τ) < 1/2 | Pass |
| §2.2 full shift, irrational rotation | scale 2^{−m}; isometry | windows s − m … s + n − 1 + m, disjoint iff τ ≥ 2m, so 2m + 1 works; uniform δ-dense orbit length gives τ | Pass |
| §5.1 large times | t ≤ T₀ | ratio ≥ e^{−T₀(abs(P) + max abs(φ))}; stated constant e^{2T₀(…)} is larger | Pass |
| §5.2 Gibbs constant | Bernoulli(1/2, 1/2), ε = 1/2 | 2^{−(n+2)}·2^n = 1/4; μ(B_1) = 1/8 | Pass |
| §6.1 bracket, equivariance | p = [x, z], q = [fx, fz] | forward both in W^s_δ(fx): 2δ; backward n ≥ 1: δ + δ; so fp = q for 2δ ≤ δ* | Pass |
| §6.2 expansivity, closing, density | isolated point p; monotone shift | f^n p = f^{−1}p gives f^{n+1}p = p; T^n{x_0 = 1} = {x_{−n} = 1} ⊆ {x_0 = 1}; cylinder {x_{−1} = 0, x_0 = 1} is the one switch sequence | Pass |
| §6.2 uniqueness scale | two-shift β = 1, β = 1/4 | diameter 1: every point 1-shadows; 2β = 1/2 = δ*: unique | Pass |
| §6.4 Hölder ⇒ Bowen | z = [x, y] | d(f^k x, f^k y) ≤ cδ(λ^k + λ^{n−1−k}); sum ≤ 2C(cδ)^θ/(1 − λ^θ); 1/m potential: Σ_{j=m+1}^{n+m} 1/j unbounded at distance ≤ 2^{−m−1} | Pass |
| §6.5 axioms | periodic orbit; irrational linear flow; g^v W^s_δ versus W^s_δ(g^v x) | strong sets {x}; unique v with g^v x = z; (F3) reads 0 ≤ 0, (F2) fails; for v > 0 the bracket lies in g^v W^s_δ(x) after shrinking e(δ) (continuity, [x, x] = x) | Pass |
| §6.6 expansivity route | reparametrised orbit s(t) | bracket w_t = g^{s(t)}w_0 with abs(s(t) − t + v_0) ≤ δ; (F3) backward then forward gives y = g^{v_0}x | Pass |
| §6.7 flow Bowen property | y ∈ B_t(x, ε) | three differences: 2δ max abs(φ) and two integrals C(cδ)^θ/(κθ), using g^t z ∈ W^u_δ(g^t y); circle flow with d(x, g^v x) = abs(v)³ | Pass |
| §6.8 | swap; monotone shift | finite X, h = 0; n + 1 words, h = 0, M(T) a segment, all of free energy 0 | Pass |
| §7.3 | Gram (2 1; 1 1) | K₁K₂ = (λ_max/λ_min)^{1/2} = (3 + √5)/2 = 2.618 | Pass |
| §7.4 | v = v^s + v^u; two-copy union | norm of Df^n v ≥ C⁻¹λ^{−n}abs(v^u) − Cλ^n abs(v^s); max(1/2, 1/3) = 1/2, dim E^s = 1, 2 | Pass |
| §7.5 | m-frames at x_k → x | limit frame orthonormal in E^s_x: dimension upper semicontinuous; sum dim M | Pass |
| §7.6 | series; Jordan block | new norm of Df v squared ≤ λ'² times that of v; σ_max of (1/2 1/8; 0 1/2) = (1.00778 + 0.125)/2 = 0.5664 ≤ 3/4 | Pass |
| §8.1 clause (iii) | cone step; (2x, 0) | off the cone abs(Δx) < γ⁻¹abs(Δy), so abs(Δy') ≤ (λ + (1 + γ⁻¹)δ)abs(Δy); abs(z − q_0) ≤ λ'^L(Cν^{−L}abs(z) + μ'^{−L}abs(q_0)) → 0; z_L = (2^{−L}x, 0) | Pass |
| §8.2 corner | B = (1/2 1; 0 1/2), t = √7 − 2 | t² + 4t − 3 = 0; norm of B²v 0.7646, of B³v 0.516; det(v, BᵀBv) = 0.6613 = √7/4 | Pass |
| §8.3 chart | cat suspension; θ' = 1, u' = u, v' = −v + u² | (σ, a, b) ↦ (σ, 2.618a, 0.382b); v = u₀²e^{2t}/3 + ce^{−t}, W^{cu} = {v = u²/3}; second shear keeps {a_u = 0} | Pass; route: R01 |
| §8.4 | three copies | U ∩ f(U) lies in copy 1; d(c, d) = 1 | Pass |
| §8.5 | uniqueness of v | W^s_δ(g^{v'}x) lies in the weak plaque of size Kδ ≤ r₀; injective parametrisation gives v' = v | Pass |
| §8.6 | (a) m plaques; (b) chain | diameters ≤ 2C'λ'^{pk}r₀ → 0: at most m points; time shifts ≤ 2(m − 1)r₀ + r₀ ≤ 3mr₀; arc has dimH ≤ 1 < 2 | Pass |
| §8.7 | cat map | θ = 1/2 with L = 2.618; with L = λ the denominator is 0 | R02 |
| §9.1 | cat matrix; shear; rotation; n = 0 | A(1, 0.618) = 2.618·(1, 0.618); h = 0.9624; eigenvalue 1; ±i; empty sum 0 | Pass |
| §10.1 | attracting circle; signed ⇒ forward | r' = −r at r = 0; W^s_Λ(ε) = {abs(r) ≤ ε}, area 2ε; p = f^{kq+n}(f^{−n}p) | Pass |
| §10.2–10.4 headlines | cat map; periodic orbit | φ = −0.9624 gives P = 0; P = (1/p)∫F, h = 0 | Pass given Layers 5–8 |
| §11.1 | Sol-type metric; conformal factor | e^{2a(s−1)}(e^a du)² = e^{2as}du²; λ_t = e^{at}; φ'^u = −a − 0.2π cos 2πs | Pass; citation: R03 |
| §11.2 | chart change; q = 1, d = 3; stable lift | (C + DL)(A + BL)⁻¹; (d − q − 1) + q(d − q) + q + 1 = 5; (b, c) ↦ (be^{−2aT}, ce^{−aT}); stable lift expands (e^{2aT}, e^{aT}) | Pass |
| §11.3 | b = 0.1 | (1.01)^{−1/2} = 0.99504 < e^{−0.001} | Pass |
| §11.5 | m ≥ 2, δ = 1/(3.9m) | (1.95² + 1.01²)^{1/2} = 2.196 > 2.01 | Pass |
| §11.6 | absolutely continuous ν | ν-almost every point generic for μ⁺, so ∫u dν = ∫u dμ⁺; √5 ε ≤ 3ε | Pass |

**Seeded source sample.** D and P flag no locator as unverified. Read at the cached texts for the fifteen sampled targets:

- 1.1: BowenRuelle1975 lines 99–101, 163–164; ClimenhagaThompson2016 lines 171–175, 355–358, 945.
- 6.2: BowenPeriodicPoints1971 lines 96–97 (Lemma 2.3), 101–104 (2.5), 166–168 (2.10).
- 6.4, 6.7: ClimenhagaThompson2016 lines 341–342; BowenRuelle1975 lines 681–701 (Lemma A.2, r = 1, y ∈ M).
- 6.5, 8.5: BowenRuelle1975 lines 25–34, 96–108 (definitions; the product structure itself is cited to FH2019).
- 6.8: BowenPeriodicPoints1971 lines 749–750 (8.1), 421–426 (Remark 4.4).
- 7.5: BowenRuelle1975 line 13 (continuous subbundles in the definition).
- 8.1: ClimenhagaPesin2016 lines 1822–1843, 1854, 281–283.
- 8.7: BowenRuelle1975 line 362.
- 9.1: Smale1967 lines 381–390, 450–474; BowenGroupEndomorphisms1971 lines 313–316, 332–336; BowenPeriodicPoints1971 line 667.
- 10.3: BowenRuelle1975 lines 213–222, 272–277; TsujiiZhang2023 lines 106–109, 485–495.
- 11.2: BowenRuelle1975 lines 702–715.

Each locator is at the stated lines and supports the statement. Also read: ClimenhagaThompson2016 lines 1880–1887, 1908–1910, 1955, 1963–1965 (scales and Gibbs bounds of §5.2). 7.4 and 8.6 cite only uncertified texts (below); their proofs are in D and were recomputed (table).

**Pins** (`lake-manifest.json`: Mathlib `1b1ccf4b…`, Tau Ceti `2fd255d9…`, as D:39 and D:62 say). All 72 backticked library names of D were searched at the pins and found; the 32 others are supplier names, each found at its supplier (below). Opened this round: `Manifold.riemannianEDist` (`Mathlib/Geometry/Manifold/Riemannian/PathELength.lean`:208, `⨅ (γ : Path x y) …` in `ℝ≥0∞`); `PseudoEMetricSpace.ofRiemannianMetric` (`…/Riemannian/Basic.lean`:521, `[RegularSpace M]`); `DifferentiableOn.dense_compl_image_of_dimH_lt_finrank` (`Mathlib/Topology/MetricSpace/HausdorffDimension.lean`:600); `AddAction.IsTopologicallyTransitive` (`Mathlib/Dynamics/Transitive.lean`:31); `Flow.fromIter`, `Flow.restrictNonneg`, `Flow.reverse` (`Mathlib/Dynamics/Flow.lean`:143, :241, :335). By object: `Flow.stableSet` (`TauCeti/Dynamics/Flow/Stable.lean`:61) is the set of points converging to a given point, nonempty only at fixed points, not the strong stable sets of §6.5; nothing at either pin states hyperbolic sets, expansivity, specification, pressure or equilibrium states.

**Duplication audit.** ClassicalErgodicTheory at its head: Conventions, §§0.3, 1.4, 3.4, 5.1–5.5, 6.1–6.2, 6.4, 7.1–7.3, 8.1–8.2, 8.4–8.5 exist; `IsExpansive T δ`, `HasSpecification`, `HasBowenProperty`, `IsGibbsMeasure`, `IsExpansiveFlow`, `HasFlowSpecification`, `HasFlowBowenProperty` read there with the quantifiers D's contract states. It names entropy-expansiveness only inside a locator, has no weak specification and no hyperbolic sets, lists uniformly hyperbolic dynamics as outside its scope, and names a roadmap on it as consumer of its §§8.4–8.6. Other citations resolved: GeometryOfNumbersAndQuadraticArithmetic §4.2 and ArithmeticDynamics §§2.7, 2.67, 2.85, 2.92 (open new roadmaps, both in the merge order); on main: ProbabilisticAndMetricNumberTheory §4.1 (`birkhoff_pointwise`, `birkhoff_pointwise_ergodic`), DifferentialGeometry 3.3, GeometricCurrents G6 (Grassmann bundle, compact over compact base regions), GeneralizedCohomology G4.0b, RiemannianGeometry R1, R2, R4 (`rauch_norm_ge_of_sectional_le`, Cartan–Hadamard), TangentialBordism §2.3 (B1.5), OperatorAlgebraDynamics D9, GeometricTopology, TaubesGromov. A search of all open heads and main for weak specification, Hadamard–Perron, hyperbolic sets, local product structure, entropy-expansive, SRB and Bowen–Margulis finds only ClassicalErgodicTheory's scope and consumer sentences.

Overlap facts: no other pull request changes this roadmap; no cited id is dropped. The lead "GeneralizedCohomology §G4.0b is defined only by an open revision" is refuted: `TauCetiRoadmap/GeneralizedCohomology/README.md`:1082 on main states G4.0b, and :1149–1151 the smooth graph-chart structure on the finite real Grassmannians of dimension r(N − r).

Overlap check: read ClassicalErgodicTheory, MathematicalBilliards, ArithmeticDynamics, ProbabilisticAndMetricNumberTheory, RiemannianGeometry, OptimalTransport; shared: the Bowen balls, owner ClassicalErgodicTheory, cited by this roadmap; nothing else shared.

**Supplier direction.** The dependency check printed:

    candidate: HyperbolicDynamicsAndThermodynamicFormalism is not in the merge order yet; checked as if placed after ArithmeticDynamics (the intake inserts it when its design is accepted)
    depcheck: 245 roadmaps, 2233 edges, 0 problem(s)

No UPWARD or CYCLE line. No supplier cites this roadmap; none is on the never-cite list.

**Declared gaps.** `gap:sphere-bundle-embedding` (TangentialBordism §2.3 (B1.5)) and `gap:connection-map-jacobi-derivative` (RiemannianGeometry, Part II): same slugs in P and at D:130–131; each `needs` is one precise statement with its hypotheses; neither is provided at the pins (RiemannianGeometry on main has no connection map or Sasaki splitting). Contracts, not findings.

**Shape.** Summary, Scope, Conventions, supplier contracts, build paragraph, eleven layers each ending in Examples and Dependencies, consumers, references. Layers are named by their mathematics and D does not say it follows a source. No LaTeX delimiters, no algorithm, no `set_option`, no process words, no machine path. There is no `Suggested.lean` at the design stage: elaboration is not available (this lane does not elaborate), so no one-tactic probe or `#check` comparison applies. Headlines from the Summary, for the package stage: Bowen's criterion under weak specification (maps and flows); upper semicontinuity of entropy for expansive flows; Hadamard–Perron and the local manifolds; local product structure of locally maximal hyperbolic sets; Bowen's theorem; the Bowen–Ruelle theorem; uniqueness of the Bowen–Margulis measure; the SRB theorem.

Source independence: 12 passages compared with 6 sources (BowenRuelle1975, ClimenhagaThompson2016, BowenPeriodicPoints1971, ClimenhagaPesin2016, Smale1967, BowenEntropyExpansive1972), none shared beyond formulas and hypothesis lists the mathematics forces; largest share BowenRuelle1975, 45 of 136 locators; contents compared with BowenRuelle1975 (Introduction, Symbolic Dynamics, Equilibrium States, Attractors, Main Results, Appendix): independent. D has no symbolic-dynamics layer, and Layer 11 draws on that source's Section 4, Appendix and Section 5 in an order its Needs lines force (11.3 needs 11.2, 11.4 needs 11.3, 11.5 needs 11.4, 11.6 needs 11.5).

## Not verifiable

- Walters1982, Bowen1975, FH2019, KatokHasselblatt1995, Newhouse1989, BowenWalters1972, HirschPalisPughShub1970: settled as uncertified in the manifest; cited by locator, not read. The sampled targets 7.4, 7.5 (in part), 8.6 and 8.7 (in part) cite KatokHasselblatt1995 by section and FH2019 as "Part II" only; these locators could not be checked or narrowed.
- The displayed formulas of BowenRuelle1975 Theorem 3.3 and Lemma A.3 are garbled in the extraction; the prose hypotheses and conclusions were read.
- Lean elaboration: not available in this lane; there is no Lean file.

## Source issues

- **Misprint** in ClimenhagaThompson2016 at Section 2.5, after (2.12), p. 8 (arXiv v2): the source writes the two-sided set as the intersection of the time-t images of closed 2t-balls centred at x; it should centre them at the time −t image of x; affects nothing.
- **Misprint** in ClimenhagaPesin2016 at Theorem 11.1, p. 40: the source gives the maps for n ≤ 0, indexes the invariant family by all integers and bounds the derivatives over n ≤ 0 again; it should be one index set throughout; affects a stated result.
- **Gap** in ClimenhagaPesin2016 at Theorem 11.1(iii), p. 40: the source composes inverses of maps assumed only C¹ with invertible unstable linear part; it should assume invertibility or quantify over a backward orbit; affects a stated result.

## For the human reviewers

- ClassicalErgodicTheory, supplier of what Layers 1–5 import, is a draft open pull request by another author adding a new folder; it is not in `merge-order/ORDER.txt`, so the dependency check does not see that edge.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "da532382aca2d1b3031748f6abf1293f29b1f01f", "job": "REV-DESIGN-HyperbolicDynamicsAndThermodynamicFormalism~6", "model": "fable", "worker": "chris-x52"} -->
