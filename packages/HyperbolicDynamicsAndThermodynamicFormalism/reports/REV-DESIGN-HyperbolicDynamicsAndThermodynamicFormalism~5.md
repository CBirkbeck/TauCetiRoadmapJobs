<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13791#issuecomment-6852078043 -->
Review (claude) of 563dec1

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P2) The Riemannian distance is infinite between components, so `Λ` with the restricted distance is not a metric space

   **Location:** D:30 and D:618. Quote: "Distances on M are the Riemannian distance (`Manifold.riemannianEDist`) of a fixed smooth Riemannian metric"; used at D:674 "f restricted to a locally maximal hyperbolic set Λ, with the restricted distance, has hyperbolic local product structure in the sense of §6.1" and D:823 "f restricted to Λ, a nonempty compact metric space".

   **Claim:** every hyperbolic set of §§8.4–8.5 and every basic set of Layer 10, with the restricted distance, is a compact metric space to which Layers 5–6 and ClassicalErgodicTheory's definitions (all written with `dist`) apply.

   **Witness:** `Mathlib/Geometry/Manifold/Riemannian/PathELength.lean`:208, `riemannianEDist … : ℝ≥0∞ := ⨅ (γ : Path x y) …`: no path, value ⊤. D:671's period-two saddle orbit `{c, d} = {0₂, 0₃}` lies in two copies of ℝ²: it is a basic set with `d(c, d) = ⊤`. D:700 has `f` permuting components.

   **Exact repair:** in the Conventions item (D:30) and the Layer 8 header (D:618) replace the distance by the truncated one: "Distances on M are `d(x, y) = min(1, ρ(x, y))`, where ρ is the Riemannian extended distance (`Manifold.riemannianEDist`) of a fixed smooth Riemannian metric; ρ is ⊤ between different components, so d is a real-valued distance inducing the topology of M, equal to ρ below 1. On a compact set any two such distances are bi-Lipschitz equivalent (a compact set meets finitely many components; within one the Riemannian distances are comparable, across two both truncated distances are 1)." Add to §8.4's Checks: "for the period-two saddle orbit `{c, d}` of the three-copy example, `ρ(c, d) = ⊤` and `d(c, d) = 1`: the restricted `d` makes it the swap of two points of §2.2, a compact metric space; the untruncated ρ does not." P needs no change (its 8.2 and 8.3 keep `mathlib:Manifold.riemannianEDist`).

   **Tested on the witness:** with `d(c, d) = 1` the orbit is the swap of §2.2: weak specification with τ = 1 for δ < 1, `W^s_δ(c) = {c}` for δ < 1, (A2) with `e(δ) ≤ 1`, and §10.2 gives the point-pair measure. All local statements use scales below `r₀ < 1` and are unchanged. Two metrics g and 4g on ℝ² ⊔ ℝ²: `min(1, 2ρ) ≤ 2 min(1, ρ)` within a copy, `1 ≤ 2·1` across.

2. **F02** (P2) Bowen balls have two owners

   **Location:** D:7. Quote: "This roadmap owns … Bowen balls and the two-sided sets Γ_ε … Apart from the Bowen balls, which §1.1 shares with ClassicalErgodicTheory's Conventions"; D:142 "Define … the Bowen ball B_n(x, ε) as the open d_n-ball … the Bowen ball B_t(x, ε) as the open d_t-ball".

   **Claim:** §1.1 may define the Bowen balls of maps and flows although the supplier defines them.

   **Witness:** ClassicalErgodicTheory (open, new roadmap), README, Conventions, "Separated sets and Bowen balls": `B_n(x,ε) = {y | ∀ k < n, dist (T^[k] x) (T^[k] y) < ε}` and, for a flow and `t ≥ 0`, `B_t(x,ε) = {y | ∀ s ∈ Set.Icc 0 t, dist (ϕ s x) (ϕ s y) < ε}`. D's own sentence says the object is shared.

   **Exact repair:** D:7: "This roadmap owns … the dynamical distances d_n and d_t, the API of ClassicalErgodicTheory's Bowen balls and the two-sided sets Γ_ε, entropy-expansive maps …", and replace "Apart from the Bowen balls, … no roadmap …" by the sentence of R05. D:142: "Define the dynamical distances d_n and d_t as below. The Bowen balls B_n(x, ε) and B_t(x, ε) are ClassicalErgodicTheory's (Conventions); prove that they are the open balls of d_n and d_t." Keep the API and Checks. In P's 1.1 change the statement to the same form and add `roadmap:ClassicalErgodicTheory Conventions` to its prerequisites; add the Conventions to D's supplier-contract heading for ClassicalErgodicTheory.

   **Tested:** doubling map, ε = 1/8: the supplier's `B_2(0, 1/8)` is `{|x| < 1/8, |2x| < 1/8}`, half-width 1/16, the value of D:155; flow ball at t = 0: `Icc 0 0` gives the ε-ball, D:147's value; `sup < ε` and `∀ s, < ε` agree on the compact `[0, t]`.

3. **F03** (P3) §8.1: the index set is not stated, and clause (iii) is undefined for the maps the Check admits

   **Location:** D:622. Quote: "for each n let f_n(x, y) = (A_n x + g_n(x, y), B_n y + h_n(x, y)) be C¹ maps … a point whose backward images under f_{n−1}, f_{n−2}, … decay faster than ν^{−L}".

   **Witness:** ClimenhagaPesin2016 line 1824 has `n ≤ 0`; §8.2 applies the theorem along whole orbits. D:629's map `f_n(x, y) = (2x, 0)` "satisfies every hypothesis of the unstable statement" and has no inverse, so "backward images" has no meaning for it.

   **Repair:** "for each n ∈ ℤ" (the source states n ≤ 0; apply it to each shifted sequence `(f_{n+m})_{n≤0}` and use uniqueness). State (iii) as: "if z has points z_L, L ≥ 0, in the box with z_0 = z, f_{n−L}(z_L) = z_{L−1} and |z_L| < Cν^{−L}|z| for some C and some λ' < ν < μ', then z ∈ W^+_n." Tested on (2x, 0): z = (x, 0) has z_L = (2^{−L}x, 0), |z_L| = 2^{−L}|z|, admissible for ν < 2, and lies on y = 0; z = (x, y), y ≠ 0, has no z_1 and is not on the graph.

4. **F04** (P3) "The charts of §8.3" are used in four statements and stated nowhere

   **Location:** D:912 "read in the charts of §8.3 at g^t x (BowenRuelle1975, A.1)"; also D:807, D:896, D:913, D:927.

   **Witness:** §8.3 (D:648) states plaques only; BowenRuelle1975 lines 643–646 is the chart, cited there as a locator. The Layer 8 header's charts are linear in the splitting and do not straighten the weak plaques.

   **Repair:** add to §8.3 an API item: "for small ε and each x ∈ Λ there is a C^r chart φ_x from the ε-ball of T_xM to M with φ_x(0) = x and derivative the identity at 0, carrying the ε-ball of E^s_x ⊕ ℝX(x) into 𝒲^{cs}(x) and that of E^u_x ⊕ ℝX(x) into 𝒲^{cu}(x), with C¹ bounds uniform in x (BowenRuelle1975, A.1, lines 643–652): compose the layer's chart with the graph maps of the two weak plaques." Tested: cat suspension, φ_x(s, u, v) linear in the coordinates of D:882; the weak plaques are the coordinate planes.

5. **F05** (P3) Process words in the scope paragraph

   **Location:** D:7. Quote: "no roadmap on main, at the open roadmap heads or on the board plans these results".

   **Repair:** "No other roadmap plans these results; the neighbouring notions …". (House style: timeless text.)

6. **F06** (P3) Locator slip in §1.1

   **Location:** D:142. Quote: "ClimenhagaThompson2016, lines 175–177, use closed balls with s ∈ [0, t]".

   **Witness:** ClimenhagaThompson2016 line 174 defines the open ball (`d_t < δ`), line 175 the closed one; the Bowen property (line 335) and the Gibbs bound (line 1253) use the open ball, separated sets (lines 176–177) the closed one.

   **Repair:** "ClimenhagaThompson2016, lines 170–177, define d_t with s ∈ [0, t], the open balls used by its Bowen property and Gibbs bounds, and the closed balls used by its separated sets".

Six findings: two P2, four P3; two blocking. All eight round-4 findings are repaired, one of them (F01) with one object left shared (R02). The first blocking finding (R01) is in text the last repair added: the distance it chose is infinite between components, and the design's own examples have hyperbolic sets that meet two components. The second (R02) is an ownership sentence. Both are small edits; nothing structural is wrong.

**D** is `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/README.md`, **P** is `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`. Only this report and `design/review.json` were written. No design file or manifest entry was changed and no source was fetched (every cited work is in the manifest).

## Previous findings, checked individually

| Round 4 | Repaired passage (quoted) and what was recomputed | Status |
|---|---|---|
| F01 (P2), Layers 1–5 against ClassicalErgodicTheory | D:9 "Stated by ClassicalErgodicTheory and imported, never planned again here"; D:75–91 contract. Every cited section and name resolved at the supplier's head (below). Bowen balls remain shared. | Partly repaired: R02 |
| F02 (P1), Grassmann-bundle flow | D:894 "Λ* = {(x, E^u_x) : x ∈ Λ} is a hyperbolic set of the flow G_q g, with stable dimension dim E^s_x + q(dim M − q)". (d − q − 1) + q(d − q) + q + 1 = d + q(d − q); d = 3, q = 1: 3 + 1 + 1 = 5. BowenRuelle1975 lines 702–715. | Repaired |
| F03 (P1), stable-set neighbourhood | D:807 "the closed α-neighbourhood of Λ lies in W^s_Λ(ε)". Brouwer map F(u) = u − h_{z(u)}(y^{cs}) + y^u: F(u) = u iff h_{z(u)}(y^{cs}) = y^u; |F(u)| ≤ γ(γ'r + α) + α ≤ 5r/8 for γ, γ' ≤ 1/2, α ≤ r/4. E^u = 0: the ball is a point, z = x. | Repaired |
| F04 (P2), roof suspension | D:755 "Define the suspension of φ with roof R as the flow of h∂_t". ∫₀¹ (c + (R − c)ρ) ds = R; c + (R − c)ρ ≥ c > 0. | Repaired |
| F05 (P2), compact M | D:586 "Hausdorff and σ-compact … but not necessarily compact"; `SmoothPartitionOfUnity.exists_isSubordinate` at `Mathlib/Geometry/Manifold/PartitionOfUnity.lean`:556 needs `[T2Space M] [SigmaCompactSpace M]` (:553). | Repaired; the distance it introduced is R01 |
| F06 (P3), §9.1 Needs | D:751 split by item; Layer 9 Dependencies D:792. | Repaired |
| F07 (P3), Lemma 6.13 | D:330 "Lemma 6.13, lines 1908–1910"; the text at those lines is the lemma, for n ≥ N(M). | Repaired |
| F08 (P3), integral inequality | Deleted with old §3.2; D:259 uses ArithmeticDynamics §2.7's `g_P(x) = h_{μ_x}(T, P)`, present at that head. | Repaired |

Nothing was marked "not actionable in this package"; nothing is re-raised. No maintainer notes were supplied. Repaired patterns searched in the rest of D: "compact manifold" where only Λ is compact (remaining uses, §§8.6, 9, 10.2–10.4, 11, are statements about compact M and correct); covering radii (2δ + ε at D:939, 3ε at D:952, both with witnesses); small-time Gibbs bounds (D:316, D:330, D:343).

## Verified sound

**Coverage.** D read in full (996 lines, 11 layers, 45 targets); P parsed: 45 targets whose ids equal D's `### k.n` headings, every `target:` prerequisite earlier than its consumer, every definition and construction with at least three tests, two gaps with the slugs of D:129–130.

**Adversarial table** (sampled targets, headlines, changed passages and targets touched by findings).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Conventions, shift metric | B_n(x, 1/2), n ≥ 1 | d < 1/2 iff agreement on |i| ≤ 1; shifted over k < n: coordinates −1…n, mass 2^{−(n+2)} | Pass |
| §1.1 Γ_ε | y with single 1 at −1 | d(T^k 0, T^k y) = 2^{−k−1}; d(T^{−1}0, T^{−1}y) = 1 | Pass |
| §1.2 | two-shift ε = 1/4; identity of [0,1]; shrinking shifts | 2^{n+2} covers, rate log 2; Φ_ε = interval, entropy 0; pieces of entropy m log 2 inside Φ_ε(∞) | Pass; BowenEntropyExpansive1972 lines 55–56, 188, 192–193 |
| §1.3 | Γ_ε(x; g^{|t|}, d_{|t|}) | sup over s ∈ [k|t|, (k+1)|t|], k ∈ ℤ, is sup over ℝ: equals Γ_ε(x) | Pass; ClimenhagaThompson2016 lines 356–362, 371–375, 513–530 |
| §2.2 definition | j = 1, 2, 3 | start times 0, n₁ + τ₁, n₁ + n₂ + τ₁ + τ₂ | Pass; same lines 1661–1665, 295–299 |
| §2.2, periodic specification ⇒ weak | supplier's `HasSpecification`, gaps a_{i+1} − b_i = M | gluing time M − 1 ≤ M; flow: M; swap: odd p has no y with T^p y = y; roof-one suspension: p = n + 1/2, |τ| ≤ ε < 1/2 never an integer | Pass |
| §2.2 full shift | scale 2^{−m} | windows −m…n − 1 + m; disjoint iff τ > 2m − 1 | Pass |
| §3.1 | suspension, product measure | time-one map σ × id: entropy log 2; trivial partition 0 | Pass; ClimenhagaThompson2016 lines 504–509 |
| §4.1 | (aF)₁ along g_a; t = 1 periodic orbit | ∫₀¹ aF(g^{as}x) ds = F_a; F₁ constant on the orbit, P(id, F₁) = that constant | Pass |
| §5.1 large times | t ≤ T₀ | ratio exp(−(T₀ − t)P + ∫_t^{T₀} φ) ≥ e^{−T₀(|P| + max|φ|)}; stated constant e^{2T₀(…)} is larger | Pass |
| §5.2 | uniform Bernoulli, ε = 1/2; n = 1 | 2^{−(n+2)}·2^n = 1/4; μ(B_1) = 1/8 | Pass; lines 1717–1724, 1880–1887, 1908–1910, 1955, 1963–1965 |
| §5.3 | NE(ε) = ∅ | supremum over no measure, −∞ < P | Pass; lines 140–147, 1243–1244, 1251–1253, 1489 |
| §6.1 bracket equivariance | p = [x, z], q = [fx, fz] | forward: both in W^s_δ(fx), 2δ; backward n ≥ 1: δ + δ; n = 0: 2δ; so fp = q for 2δ ≤ δ* | Pass; BowenPeriodicPoints1971 lines 66–83 |
| §6.2 | isolated point p | f^n p = f^{−1}p gives f^{n+1}p = p; monotone shift: {x_{−1} = 0, x_0 = 1} one point | Pass; lines 96–97, 101–104 |
| §6.3 | swap; two shifts | m = 2, cycle; m = 2, identity permutation | Pass; lines 105–110, 166–168, 421–426 |
| §6.4 | 1/m potential | Σ_{j=m+1}^{n+m} 1/j, distances ≤ 2^{−m−1} | Pass |
| §7.3 | Gram (2 1; 1 1) | (λ_max/λ_min)^{1/2} = (3 + √5)/2 = 2.618 | Pass; BowenRuelle1975 lines 412–413 |
| §7.6 | series; Jordan block | |Df v|'² ≤ λ'²|v|'²; flows: e^{−2κ't}; σ_max of (1/2 1/8; 0 1/2) = (1.00778 + 0.125)/2 = 0.5664 | Pass; lines 19–24 |
| §8.1 | linear; (2x, 0) | φ_n = 0; no inverse | Statement R03; ClimenhagaPesin2016 lines 1822–1843, 281–283 |
| §8.2 corner | B = (1/2 1; 0 1/2), t = √7 − 2 | t² + 4t − 3 = 0; |B²v| = 0.7646; det(v, BᵀBv) = 0.6614 = √7/4 | Pass |
| §8.3, §8.5 | strong set without convergence | contains the orbit segment | Pass; BowenRuelle1975 lines 25–34, 96–108, 643–652; chart: R04 |
| §8.4 | period-two orbit in two copies | ρ(c, d) = ⊤ | R01 |
| §8.6 | (a) m plaques; (b) arc | diameters ≤ 2C'λ'^{pk}r₀ → 0, at most m points; dim 1 by `Mathlib/Topology/MetricSpace/HausdorffDimension.lean`:600 | Pass |
| §8.7 | — | BowenRuelle1975 line 362 cites Pugh for Hölder continuity of E^u | Pass |
| §9.2(c) | c = 2, R(x₀) = 1 | 2 − ρ(s) = 0 where ρ = 2; a bump of integral 1 on (1/4, 3/4) exceeds 2 | Pass |
| §9.3 | −b² ≤ K ≤ −a² | Sasaki norm of a stable field ≤ (1 + b²)^{1/2}e^{−at}: rate a with C = (1 + b²)^{1/2} | Pass, conditional on the gaps |
| §10.1 | attracting circle; signed ⇒ forward with dense periodic points | W^s_Λ(ε) = {|r| ≤ ε}, volume 2ε; f^{kq+n}(f^{−n}p) = p, kq + n ≥ 0 | Pass; lines 25–34, 94–95, 381–383, 402–406, 441 |
| §10.2–10.4 headlines | cat map | h = log 2.618 = 0.9624; φ = −0.9624 gives P = 0 | Pass given Layers 5–8, R01 |
| §11.1 | Sol metric; conformal factor | e^{2a(s−1)}e^{2a} = e^{2as}; φ'^u = −a − 0.2π cos 2πs = φ^u − u' | Pass |
| §11.2 | chart change; q = 0, d | (C + DL)(A + BL)^{−1}; dimension d | Pass; lines 702–715 |
| §11.3 | b = 0.1 | (1.01)^{−1/2} = 0.99504 < e^{−0.001}; bound holds iff b² ≤ e^{2θ} − 1 | Pass; line 681 (r = 1) |
| §11.5 | m ≥ 2, δ = 1/(3.9m) | (1.95² + 1.01²)^{1/2} = 2.196 > 2.01, < 3.01 | Pass; lines 377–406 |
| §11.6 | z, x = (2ε, 0), y = (0, ε); absolutely continuous ν | √5 ε = 2.236ε ≤ 3ε; ∫u dν = ∫u dμ⁺ by Birkhoff for ν | Pass |

**Seeded source sample.** D and P flag no locator as unverified. Checked at the cached texts for the fifteen sampled targets: 5.3, 6.1, 6.2, 6.3, 7.1 (Smale1967 lines 381–474: Anosov diffeomorphisms and toral examples), 7.3, 7.6, 8.1, 8.2, 8.3, 8.5, 8.7, 10.1, 11.2: each locator is at the stated lines and supports the statement, with the slips R03 and (outside the sample) R06. §8.6 has no source for its statement; its full proof is in D and was checked step by step (table). The locators of 6.2, 7.1, 7.3, 7.6, 8.2, 8.6, 8.7 into KatokHasselblatt1995, Bowen1975 and FH2019 could not be read (below).

**Pins** (opened this round, `lake-manifest.json` pins as D:39 and D:62 say): all 37 Mathlib and 24 Tau Ceti names of D's contracts exist, among them `Dynamics.coverEntropyEntourage_finite_of_isCompact_invariant` (`Mathlib/Dynamics/TopologicalEntropy/CoverEntropy.lean`:418, needs `U ∈ 𝓤 X`), `Flow.restrictNonneg` (`Mathlib/Dynamics/Flow.lean`:241), `Homeomorph.flow` (:154), `Dynamics.IsDynNetIn` (`…/NetEntropy.lean`:69), `ProbabilityMeasure.tendsto_measure_of_null_frontier_of_tendsto` (`…/Portmanteau.lean`:351), `Continuous.inner_bundle` (`Mathlib/Topology/VectorBundle/Riemannian.lean`:128), `Manifold.riemannianEDist` (`…/PathELength.lean`:208), `TauCeti.brouwerFixedPoint_closedBall` (`TauCeti/AlgebraicTopology/Singular/BrouwerFixedPoint.lean`:149), `TauCeti.finiteGrassmannian` (`TauCeti/Topology/Grassmannian/Basic.lean`:52), `…graphChart` (`…/Graph.lean`:240), `TauCeti.SmoothMappingTorus` (`…/Instances/MappingTorus.lean`:245, `flow_one_mk` :431, `contMDiff_uncurry_flow` :493), `TauCeti.isSmoothEmbedding_coe_sphereBundle` (`…/Riemannian/Sphere.lean`:181), `TauCeti.nonempty_contMDiffRiemannianMetric` (`…/Riemannian/Existence.lean`:69).

**Duplication audit.** ClassicalErgodicTheory at its head: §§0.3, 1.4, 3.4, 5.1–5.5, 6.1–6.2, 6.4, 7.1–7.3, 8.1–8.2, 8.4–8.5 exist with the content D's contract states; `invariantProbabilities`, `flowInvariantProbabilities`, `pressureNetSum`, `topologicalPressure`, `flowTopologicalPressure`, `HasSpecification`, `HasBowenProperty`, `IsExpansiveFlow`, `HasFlowSpecification`, `HasFlowBowenProperty`, `toralEndomorphism` read in its `Suggested.lean`, the others in its README. It has no weak specification, no entropy-expansive target, no hyperbolic sets; its Downstream consumers names a roadmap on uniformly hyperbolic dynamics as consumer of its §§8.4–8.6. Other citations resolved: ArithmeticDynamics §2.7 (null-boundary partitions, Shannon–McMillan–Breiman, `g_P(x) = h_{μ_x}(T, P)`, entropy integration) and §§2.67, 2.85, 2.92; GeometryOfNumbersAndQuadraticArithmetic §4.2 (`measureEntropy`, `countablePartitionEntropy`); ProbabilisticAndMetricNumberTheory §4.1 (`birkhoff_pointwise`, `birkhoff_pointwise_ergodic`); on main: DifferentialGeometry Layer 3.3 (`toFlow`), GeometricCurrents G6 (Grassmann bundle, compact over compact base regions), RiemannianGeometry R1, R2, R4.1 (`rauch_norm_ge_of_sectional_le`), R4.4, TangentialBordism §2.3 (B1.5), OperatorAlgebraDynamics D9, GeometricTopology, TaubesGromov. Searched by object at all open heads and on main: weak specification, Hadamard–Perron, Bowen–Margulis: no match; hyperbolic set, local product structure, SRB: no other owner; "stable manifold": HeegaardFloer §1.0a owns stable manifolds of hyperbolic zeros of vector fields, which D's hyperbolic sets of flows exclude (D:543), so nothing is shared. No corestriction theorem for the sphere-bundle atlas at the pin (`Manifold.IsSmoothEmbedding.codRestrict`, `TauCeti/Geometry/Manifold/SmoothEmbedding/LocalDiffeomorph.lean`:126, is for open subsets only): the gap asks for nothing provided.

Overlap facts: no other pull request changes this roadmap; no cited id is dropped. The lead "GeneralizedCohomology §G4.0b is defined only by an open revision" is refuted: main's `TauCetiRoadmap/GeneralizedCohomology/README.md`:1082 has "G4.0b: construct smooth real manifold structures …" and :1149–1151 the smooth graph-chart structure on the finite real Grassmannians of dimension r(N − r). The citation needs no change.

Overlap check: read ClassicalErgodicTheory, MathematicalBilliards, ArithmeticDynamics, ProbabilisticAndMetricNumberTheory, ProbabilisticAndMetricNumberTheoryPartII, OptimalTransport, HopfRinow, RicciFlow; shared: the Bowen balls, owner ClassicalErgodicTheory with this roadmap citing it (R02); nothing else shared (flow transitivity is two notions, kept apart at D:28).

**Supplier direction.** The dependency check printed:

    candidate: HyperbolicDynamicsAndThermodynamicFormalism is not in the merge order yet; checked as if placed after ArithmeticDynamics (the intake inserts it when its design is accepted)
    depcheck: 212 roadmaps, 1918 edges, 0 problem(s)

No UPWARD or CYCLE line. ClassicalErgodicTheory is an admissible supplier (another author's open pull request adding a new folder); it is not in the merge order, and it cites nothing of this design.

**Declared gaps.** `gap:sphere-bundle-embedding` (TangentialBordism §2.3) and `gap:connection-map-jacobi-derivative` (RiemannianGeometry, Part II): same slugs in P and at D:129–130, each precise and used only by §9.3; neither is provided at the pins or by a roadmap. Contracts, not findings.

**Shape.** Summary, Scope, Conventions, supplier contracts, build paragraph, eleven layers each ending in Examples and Dependencies, consumers, references. Layers are named by their mathematics; D does not say it follows a source. No LaTeX delimiters, no algorithm, no `set_option`, no forbidden supplier. There is no `Suggested.lean` at the design stage: elaboration is not available (this lane does not elaborate), so no one-tactic probe or binder comparison applies. Headlines from the Summary, for the package stage: Bowen's criterion under weak specification (maps, flows); upper semicontinuity of entropy for expansive flows; Hadamard–Perron and local manifolds; local product structure; Bowen's theorem; the Bowen–Ruelle theorem; uniqueness of the Bowen–Margulis measure; the SRB theorem.

Source independence: 10 passages compared with 5 sources (BowenRuelle1975, ClimenhagaThompson2016, BowenPeriodicPoints1971, ClimenhagaPesin2016, BowenEntropyExpansive1972), none shared beyond formulas and axiom lists the mathematics forces; largest share BowenRuelle1975, 44 of 134 locators; contents compared with BowenRuelle1975 (Introduction, Symbolic Dynamics, Equilibrium States, Attractors, Main Results, Appendix): independent. Layer 11's sections draw on its Section 4, Appendix and Section 5 in an order forced by D's Needs lines (11.4 needs 11.3, 11.5 needs 11.4, 11.6 needs 11.5), and D has no symbolic-dynamics layer.

## Not verifiable

- Walters1982, Bowen1975, FH2019, KatokHasselblatt1995, Newhouse1989, BowenWalters1972, HirschPalisPughShub1970: settled as uncertified in the manifest; cited by locator, not read, not requested again. FH2019 is cited as "Part II" only, and KatokHasselblatt1995 by section: these locators could not be narrowed.
- Displayed formulas of BowenRuelle1975 Theorem 3.3 and Proposition 4.4 are garbled in the extraction; the prose hypotheses and conclusions were read.
- Lean elaboration: not available in this lane; there is no Lean file.

## Source issues

- **Misprint** in ClimenhagaPesin2016 at Theorem 11.1, p. 40: the source gives the maps for n ≤ 0, indexes the invariant family by all integers and bounds the derivatives over n ≤ 0 again; it should be one index set throughout; affects a stated result.
- **Gap** in ClimenhagaPesin2016 at Theorem 11.1(iii), p. 40: the source composes inverses of maps assumed only C¹ with invertible unstable linear part; it should assume invertibility or quantify over a backward orbit; affects a stated result.

## For the human reviewers

- ClassicalErgodicTheory, supplier of what Layers 1–5 import, is an open draft pull request by another author and is not in `merge-order/ORDER.txt`; the dependency check does not see that edge.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "563dec1a004588ddbd12176a5c4cfc302c3e44f5", "job": "REV-DESIGN-HyperbolicDynamicsAndThermodynamicFormalism~5", "model": "fable", "worker": "chris-x8"} -->
