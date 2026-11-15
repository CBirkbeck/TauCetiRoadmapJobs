<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13791#issuecomment-6898130876 -->
Review (claude) of 8a1ba7a

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P3) the flow of a complete vector field is Tau Ceti's at the pin and is cited through a roadmap alias

   **Location.** D:11, "Tau Ceti's maximal flows, geodesic flow, Riemannian volume, …" under "consumed by name in the supplier contracts"; D:13, "maximal flows of vector fields and completeness on compact manifolds (DifferentialGeometry Layer 3)"; D:111, "Layer 3.3: `toFlow`, the flow `Flow ℝ M` of a complete C^r vector field, and completeness on compact manifolds"; D:766 (§9.2(b)); D:777 and D:803; P 9.2 `roadmap:DifferentialGeometry Layer 3` and the `suppliers` entry for DifferentialGeometry.

   **Claim.** The flow of hX in §9.2(b)–(c) is supplied by a roadmap target named `toFlow`, and Tau Ceti's flows are named in the supplier contracts.

   **Witness.** No "From Tau Ceti" bullet names a flow. At the pin: `TauCeti.globalFlow` (`TauCeti/Geometry/Manifold/IntegralCurve/GlobalFlow.lean`:60), `TauCeti.contMDiff_globalFlow_uncurry` (:147), `TauCeti.mfderiv_globalFlow_apply_self` (:167), `TauCeti.isCompleteVectorField_of_compactSpace` (`TauCeti/Geometry/Manifold/Flow/Complete.lean`:154). `TauCetiRoadmap/DifferentialGeometry/README.md`:1285–1287 says the same; `toFlow` is no declaration.

   **Exact repair.**
   - "From Tau Ceti": add "`TauCeti.globalFlow`, `TauCeti.contMDiff_globalFlow_uncurry`, `TauCeti.mfderiv_globalFlow_apply_self` (`TauCeti/Geometry/Manifold/IntegralCurve/GlobalFlow.lean`) and `TauCeti.isCompleteVectorField_of_compactSpace` (`TauCeti/Geometry/Manifold/Flow/Complete.lean`): the flow `Flow ℝ M` of a complete C¹ vector field on a finite-dimensional boundaryless Hausdorff manifold, jointly C^n for a C^n field (1 ≤ n ≤ ∞), with Dg^t X(x) = X(g^t x); every C¹ field on a compact such manifold is complete. This is the flow of hX in §9.2 and the passage from a C^r generator to a C^r flow of the Conventions."
   - Delete the subsection "From TauCetiRoadmap.DifferentialGeometry — Layer 3" and the clause of D:13 that cites it.
   - D:766: "the flow of hX (`TauCeti.globalFlow`, complete by `TauCeti.isCompleteVectorField_of_compactSpace`, jointly C^r by `TauCeti.contMDiff_globalFlow_uncurry`)". D:777 Needs and D:803 Dependencies: replace "DifferentialGeometry Layer 3.3" by these names.
   - P 9.2: replace `roadmap:DifferentialGeometry Layer 3` by `tauceti:TauCeti.globalFlow`, `tauceti:TauCeti.contMDiff_globalFlow_uncurry`, `tauceti:TauCeti.isCompleteVectorField_of_compactSpace`; remove the DifferentialGeometry entry of `suppliers`.

   **Tested on the witness.** The pinned hypotheses are `[FiniteDimensional ℝ E]`, `[T2Space M]`, `[IsManifold I 1 M]`, `[BoundarylessManifold I M]` and a C¹ field; D's Conventions give all four, and hX is C^r with r ≥ 1 on the compact mapping torus. `contMDiff_globalFlow_uncurry` takes `n : ℕ∞`, which covers r = 1 (§9.2), r = 2 (Layer 11) and r = ∞ (§9.2(a)). After the change no target depends on DifferentialGeometry, and the dependency check has one edge fewer.

One finding, P3, with an exact repair; a repair of any priority asks for changes, so the verdict is needs changes. No P1 or P2. The two declared supplier gaps, `gap:sphere-bundle-embedding` and `gap:connection-map-jacobi-derivative`, are precise, minimal and declared in both files, and are not findings. **D** is `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/README.md`, **P** is `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`. Only this report and `design/review.json` were written; no source was fetched (every cited work is in the manifest) and `sources.toml` is unchanged. No maintainer notes were supplied. There is no `Suggested.lean` at the design stage and this lane does not elaborate, so nothing was elaborated.

## Previous findings, checked individually

| Round 8 | Repaired passage and what was recomputed | Status |
|---|---|---|
| F01 (P3), §9.1 torus | D:747 "(`UnitAddTorus (Fin n)` with the product structure `TauCeti.instIsManifoldPi` of Tau Ceti's analytic circles `AddCircle.instIsManifold`)"; bullets D:55 and D:73; Needs D:762; P 9.1. At the pin: `UnitAddTorus` (`Mathlib/Topology/Instances/AddCircle/Real.lean`:55, `d → UnitAddCircle`), `piChartedSpace` (`Mathlib/Geometry/Manifold/ChartedSpace.lean`:482), `ModelWithCorners.pi` (`Mathlib/Geometry/Manifold/IsManifold/Basic.lean`:521), `TauCeti.extChartAt_pi` (`TauCeti/Geometry/Manifold/IsManifold/Pi.lean`:119). | Repaired |
| F02 (P3), §6.3 gluing bound | D:417 "The gluing time of f after the j-th segment is then mM + (mL_j − r_j − n_j) + r_{j+1}, which lies in [mM, mM + 2m − 1] ⊆ [0, m(M + 2)]". Recomputed: x_{j+1} sits at f-time m(a_j + L_j + M) + r_{j+1}, the j-th segment ends at ma_j + r_j + n_j; mL_j − r_j − n_j ∈ [0, m] (the value m only for r_j + n_j = 0), r_{j+1} ∈ [0, m − 1]. | Repaired |
| F03 (P3), §5.3 Check | D:351 "with gluing times in [0, τ₀ + 1] as in §6.6, τ₀ the connecting time at the given scale and the extra unit absorbing the phase". Closed interval [0, n] fixes base coordinates −k, …, n + k; a second segment needs n + τ − k > n + k. Agrees with D:245 and D:471. | Repaired |
| F04 (P3), §§10.2–10.3 Needs | D:842 "Layers 6.8, 8.4, 10.1; Layer 9.1 for the Checks"; D:854 "Layers 4.1, 6.6, 6.8, 8.5, 10.1; Layers 9.1 and 9.2 for the Checks". P 10.3 prerequisites: ClassicalErgodicTheory §8.5, 4.1, 6.6, 6.8, 8.5, 10.1. | Repaired |

Nothing was marked "not actionable in this package"; nothing is re-raised.

Repaired patterns searched in the rest of D:
- a library object used and not named in the contracts: R01 (the flow of a vector field); none other (the torus, circle, mapping torus, sphere bundle, Grassmannian, volume, Brouwer and Sol names all resolve at the pin);
- a gluing-time bound: D:245, D:351, D:471, D:417 agree ([0, τ₀ + 1] for the suspension, m(M + 2) for the cyclic case); no other bound occurs;
- a Needs line that puts a theorem behind the example layer: §10.4 keeps 9.1 because its statement names toral automorphisms; no other `target:9.x` prerequisite in P.

## Verified sound

**Coverage.** D read in full (1007 lines, 11 layers, 45 targets) and every statement, API item and Check recomputed by hand; P parsed: 45 targets in D's order with D's ids, every `target:` prerequisite earlier than its consumer, at least three tests each, pins equal to the checkouts' heads (Mathlib `1b1ccf4b…`, Tau Ceti `2fd255d9…`). 18 manifest keys, 18 reference entries, each key cited in D. Style scan: no LaTeX delimiter, machine path, pull-request number, process word, `set_option` or algorithm.

**Adversarial table** (sampled targets, headlines, repaired passages, the finding).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §1.1 doubling map Check | n = 1, 2, ε = 1/8 | \|2^k y\| < 1/8 for k < n gives half-width 2^{−n−2}: 1/8, 1/16 | Pass |
| §1.2 finiteness; two-shift Check | ε = 1/4, n steps; identity of [0, 1]; compactified union of shifts | {d ≤ 1/4}-close for n steps = agreement on −1, …, n: 2^{n+2} classes, rate log 2; Φ_ε an interval, entropy 0; Φ_ε(∞) has entropy m log 2 for all large m | Pass |
| §2.2 full shift, strong specification | scale 2^{−m} | need n₁ + τ − m > n₁ − 1 + m, so τ ≥ 2m; 2m + 1 suffices | Pass |
| §2.2 `HasSpecification` ⟹ weak | intervals [a_j, a_j + n_j − 1], gap M | gluing times all M − 1 ≤ M; "≤ ε" at ε < δ gives "< δ" | Pass |
| §4.1 items 1–3 and Check 1 | F = c; t = 1 on a period-1 orbit | 2(h + c/2) = 2h + c against 2h + 2c; point masses are equilibrium for (g^1, F_1) and not flow invariant | Pass |
| §5.1 large times | t ≤ T₀ | ratio ≥ exp(−T₀(\|P\| + max\|φ\|)); stated constant has the exponent doubled, which is weaker | Pass |
| §5.1 Check 2 | ε = 2^{−m}, φ = 0 | ε·2^{−t−2m}·2^t = ε 2^{−2m} > 0; wrong sign gives 4^{−t} | Pass |
| §5.2 headline | full shift, φ = 0, ε = 1/2; n = 1; two disjoint shifts | 2^{−(n+2)}·2^n = 1/4; μ(B_1) = 1/8; ES(0) a segment | Pass |
| §5.3 headline | roof-one suspension; identity flow of two points | weak specification with [0, τ₀ + 1], not `HasFlowSpecification` (p = n + 1/2); expansive, no y near a then b | Pass |
| §6.1 bracket equivariance | w = [x, z], p = [fx, fz] | forward: both in W^s_δ(fx), 2δ apart; backward n ≥ 1: both δ-close to f^{−n}fz; so equal for 2δ ≤ δ* | Pass |
| §6.2 closing and density | isolated point p; monotone shift | f^n p = f⁻¹p gives period n + 1; cylinder {x₋₁ = 0, x₀ = 1} is one nonperiodic point; T^n(U) ⊆ U for U = {x₀ = 1} | Pass |
| §6.2 Check 4 | β = 1, 1/4 | diameter 1: every point shadows; 2β = 1/2 = δ* | Pass |
| §6.3 route and Check 4 | σ × rotation of ℤ/2, k = 5 | ε' = 2^{−k−1}: 2(a' − b) > 2k + 2, M = k + 2; m(M + 2) = 18 ≥ 10 = 2k; M + m = 9 < 10 | Pass |
| §6.4 | θ ≤ 1 and θ > 1; φ = 1/m | splitting through z: Σ C(cδλ^k)^θ + Σ C(cδλ^{n−1−k})^θ ≤ 2C(cδ)^θ/(1 − λ^θ), any θ > 0; S_nφ(y) − S_nφ(x) = 1/(m+1) + ⋯ + 1/(n+m), points 2^{−m−1} apart | Pass |
| §6.6 Check 1 | τ ∈ ℝ | dist(τ, ℤ) + dist(τ, 1/2 + ℤ) = 1/2, both < 1/4 impossible | Pass |
| §6.7 | h(s) = s³ conjugate | g^v(0) = v³; proof uses \|v\| ≤ δ only | Pass |
| §7.3 | factor 4; Gram (2 1; 1 1) | K₁K₂ = 2·1/2 = 1; eigenvalues (3 ± √5)/2 with product 1, K₁K₂ = (3 + √5)/2 = 2.618 | Pass |
| §7.4 | diag(2, 1/2); suspension; union saddle + sink | (1, 1) unbounded; ∂_t bounded, not decaying; C = 1, λ = max(1/2, 1/3) | Pass |
| §7.6 Check 3 | Jordan block, D = diag(1/8, 1) | 2^n\|J^n(0, 1)\| = (4n² + 1)^{1/2}; norm of (1/2 1/8; 0 1/2) = ((65/64)^{1/2} + 1/8)/2 = 0.566 ≤ 3/4 | Pass |
| §8.1(iii), (iv) | cone and complementary cone | \|Δy'\| ≤ (λγ + (1 + γ)δ)\|Δx\| ≤ γ(μ − (1 + γ)δ)\|Δx\| iff δ(1 + γ)² ≤ γ(μ − λ); off the cone the factor is λ + (1 + γ⁻¹)δ = λ' | Pass |
| §8.2 Check 2 | v ∝ (1, √7 − 2) | \|v\|² = \|Bv\|² = 12 − 4√7 = 1.4170 | Pass |
| §8.3 Checks 5, 6 | v' = −v + u²; drop of h | v = u₀²e^{2t}/3 + ce^{−t} solves it; crossing time ≤ 0.05/0.056 = 0.89 < 1, then drift ≤ 0.0062 < 0.1; e^{3a} = 17.9 | Pass |
| §8.4 API, three-copy Check | f², U ∩ f(U) | ∩ f^{2n}(U ∩ f(U)) = points with whole f-orbit in U = {a}; c is fixed by f² in U | Pass |
| §8.5 | periodic orbit; cat suspension | W^s_δ = W^u_δ = {x} in the orbit, v unique for δ < p/2; bracket at matched heights | Pass |
| §8.7 | cat map | L = λ⁻¹, α = 1: θ = 1/2 ∈ (0, α) | Pass |
| §9.1 | cat matrix; shear; rotation; n = 0 | 2.618, 0.382, h = 0.9624; eigenvalue 1; A⁴ = I; empty sum 0 | Pass |
| §9.2(c) | R, c < min R; R ≡ 1, c = 1/2; c = 2 | ∫₀¹ (c + (R − c)ρ) = R; return time 1; 2 − ρ vanishes | Pass |
| §9.3 | K ≡ −1; flat; −b² ≤ K ≤ −a² | J = e^{−t}E, Sasaki norm ratio e^{−t}; J = p + tq; \|J'\| ≤ b\|J\| gives C = (1 + b²)^{1/2}, κ = a | Pass given the gaps |
| §10.1 | r' = −sin(2πr)/(2π); signed transitivity + dense periodic points; horseshoe subset | multiplier e^{−t}, W^s_Λ(ε) = {\|r\| ≤ ε} of volume 2ε; p ∈ f^{kq+n}(U) ∩ V; maximal invariant set of U₂ ∖ N has no "1, 0" | Pass |
| §10.1 Brouwer step | fixed point u | h_{z(u)}(y^{cs}) = y^u; image norm ≤ Lip(h)(\|k(u)\| + α) + α ≤ r | Pass |
| §10.2, §10.3 headlines | cat map with φ = −log 2.618; periodic orbit; F + 5 + L_gψ | P = 0, Haar; P = (1/p)∫F; same state, pressure + 5 | Pass given Layers 4–8 |
| §10.4 | periodic orbit; cat map; K ≡ −1 | h = 0 (the exception); 0.9624; φ^u = −1 so h_top = 1 | Pass |
| §11.1 Checks 2–4 | Sol-type metric; conformal factor e^{2u(s)} | invariance: e^{2a(s−1)}λ² = e^{2as}; λ_t = e^{at}; φ' = −a − 0.2π cos(2πs) = φ^u − L_gψ, ψ = u; one-sided derivatives a ± 2π | Pass |
| §11.2 | q = 0, dim M; cat suspension, q = 1 | dim E^s + q(n − q) + q + 1 = n + q(n − q); 3 + 1 + 1 = 5; (b, c) contract at 2a, a; stable lift expands | Pass |
| §11.3(b) Check | b = 0.1 | (1 + b²e^{−4aT})^{1/2}/(1 + b²)^{1/2} → 0.99504 < e^{−0.001} = 0.99900 | Pass |
| §11.5(a) and Check 4 | δ = 1/(3.9m), ε = 1.01δ | spacing 3.9δ ≥ 2δ, every point within 1.95δ; (1.95² + 1.01²)^{1/2} = 2.196 > 2.01, < 3.01 | Pass |
| §11.6 headline and Check 4 | z = (0, 0), x = (2ε, 0), y = (0, ε); deviations | √5 ε = 2.236ε ∈ (2ε, 3ε]; δ − δ/4·2 ≥ δ/2, δ/2 − δ/4 = δ/4 | Pass |
| R01 | pinned flow | hypotheses of `globalFlow` against D's Conventions: all present | P3 |

**Seeded source sample.** D and P flag no locator as unverified. Read this round at the stated lines; each supports the statement as written:

- 1.2: BowenEntropyExpansive1972 lines 55–56, 188, 192–193 (and 117–135 for Example 1.6 and 1.6*); ClimenhagaThompson2016 lines 1687–1690.
- 5.2: ClimenhagaThompson2016 lines 1661–1669, 1717–1724, 1880–1887, 1908–1910, 1955, 1963–1965.
- 6.2: BowenPeriodicPoints1971 lines 96–97, 101–104, 387–392. 6.4: ClimenhagaThompson2016 lines 341–342. 6.6: BowenEntropyExpansive1972 lines 134–135. 6.7: BowenRuelle1975 lines 681–701.
- 7.3: BowenRuelle1975 lines 412–413. 8.5: BowenRuelle1975 lines 25–34, 96–108.
- 9.1: Smale1967 lines 381–473; BowenGroupEndomorphisms1971 lines 313–316, 332–336; BowenPeriodicPoints1971 line 667.
- 10.1: BowenRuelle1975 lines 25–34, 94–95, 381–383, 402–406, 441. 10.4: BowenRuelle1975 lines 324–325, 77–78; BowenPeriodicPoints1971 lines 421–426, 667, 749–750.
- 11.2: BowenRuelle1975 lines 702–715. 11.6: BowenRuelle1975 lines 421–472.
- Also read for the repaired passages: BowenPeriodicPoints1971 lines 66–83, 158–163; ClimenhagaPesin2016 lines 1822–1855; BowenRuelle1975 lines 386–391, 643–652.

7.4 and 9.3 cite only uncertified texts; their statements were recomputed (table).

**Pins opened this round** (file and line). Mathlib: `Dynamics.IsDynNetIn` (`Dynamics/TopologicalEntropy/NetEntropy.lean`:69, pairwise disjoint balls of the inverse dynamical entourage), `Dynamics.coverEntropyEntourage_finite_of_isCompact_invariant` (`…/CoverEntropy.lean`:418), `Flow.fromIter` (`Dynamics/Flow.lean`:143), `Flow.restrictNonneg` (:241), `UnitAddTorus`, `piChartedSpace`, `ModelWithCorners.pi` (lines above), `IsSmoothEmbedding` (`Geometry/Manifold/SmoothEmbedding.lean`:70). Tau Ceti: `instIsManifoldPi`, `extChartAt_pi` (`Geometry/Manifold/IsManifold/Pi.lean`:119), `sphereBundleChartedSpace`, `isManifold_sphereBundle`, `isSmoothEmbedding_coe_sphereBundle` (`…/Riemannian/Sphere.lean`:143, :161, :181), the four declarations of R01. For the other names I rely on round 8's list, which gives file and line for each. Objects searched at both pins and not found: expansive maps, specification, hyperbolic sets, Anosov systems, topological mixing, a connection map, a Sasaki metric, Jacobi fields. Tau Ceti's `Flow.stableSet` (`Dynamics/Flow/Stable.lean`:61) is the set of points converging to a rest point, empty unless the point is fixed; it is not the local strong stable set of §6.5 and needs no citation.

**Duplication audit.** Search of the open heads and main: "Anosov flow/diffeomorphism" and "weak specification / entropy-expansive" occur only in ClassicalErgodicTheory, which places uniformly hyperbolic dynamics outside its scope and names a roadmap on it as consumer of its §§8.4–8.6; "Hadamard–Perron", "SRB measure", "Bowen–Margulis" occur nowhere; "connection map" occurs only for unrelated objects (CharacteristicClasses, ComplexComparisonPartII), and "derivative of the geodesic flow" nowhere. This roadmap is the owner of what its Scope lists.

Supplier citations resolved this round:
- ClassicalErgodicTheory at its open head: Conventions "Separated sets and Bowen balls" and "Invariant probabilities"; §§0.3, 1.4, 3.4, 5.1–5.6, 6.1–6.2, 6.4, 7.1–7.4, 8.1–8.5 exist. Read against D's contract: §5.3 (`IsExpansive T δ`, finite entropy), §5.5 (definition, separated-set form, `|t|` rule, ℝ-action transitivity), §8.4 (`HasSpecification`, `HasBowenProperty` with its Hölder criterion, `IsGibbsMeasure`, `existsUnique_isEquilibriumState`), §8.5 (`IsExpansiveFlow`, `HasFlowSpecification`, `HasFlowBowenProperty`, `existsUnique_isFlowEquilibriumState`, flow coboundaries). All 26 cited names occur there.
- GeometryOfNumbersAndQuadraticArithmetic §4.2 "Entropy and Haar measure on leaves" with `countablePartitionEntropy`; ArithmeticDynamics §2.7 (Shannon–McMillan–Breiman, null-boundary partitions) and §2.67 onwards, at their open heads.
- On main: ProbabilisticAndMetricNumberTheory §4.1 `birkhoff_pointwise`, `birkhoff_pointwise_ergodic` (`TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md`:4650, :4692); GeometricCurrents G6 (:668–681); GeneralizedCohomology G4.0b (:1082); RiemannianGeometry R1 (:1050), R2 (:1475), R4 item 1 `rauch_norm_ge_of_sectional_le` (:2271) and item 4 Cartan–Hadamard (:2565); TangentialBordism §2.3 (B1.5) (:944); DifferentialGeometry Layer 3.3 (:1278–1287, see R01); OperatorAlgebraDynamics D9.

Overlap facts: no other pull request changes this roadmap; no cited id is dropped. The lead "GeneralizedCohomology §G4.0b is defined only by an open revision" is refuted: main states G4.0b at `TauCetiRoadmap/GeneralizedCohomology/README.md`:1082.

Overlap check: read ClassicalErgodicTheory, MathematicalBilliards, ArithmeticDynamics, OptimalTransport, ProbabilisticAndMetricNumberTheory, RiemannianGeometry; shared: Bowen balls, toral endomorphisms, expansive maps and flows, the Bowen property and specification with periodic shadowing, owner ClassicalErgodicTheory, cited by this roadmap; nothing else shared.

**Supplier direction.** The dependency check printed:

    candidate: HyperbolicDynamicsAndThermodynamicFormalism is not in the merge order yet; checked as if placed after ArithmeticDynamics (the intake inserts it when its design is accepted)
    depcheck: 246 roadmaps, 2245 edges, 0 problem(s)

No UPWARD or CYCLE line. No supplier is on the never-cite list.

**Declared gaps.** Same slugs in P's `gaps` and at D:133–134; each `needs` is one statement with its hypotheses; both are used by §9.3 only. Minimality checked at the pin: `TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Sphere.lean` has the atlas, the manifold structure and the embedding and no corestriction theorem; the only `codRestrict` for smooth embeddings (`TauCeti/Geometry/Manifold/SmoothEmbedding/LocalDiffeomorph.lean`:126) is for open subsets; no connection map or Sasaki metric exists at the pins or in RiemannianGeometry. Contracts, not findings.

**Shape.** Summary, Scope, Conventions, supplier contracts, build paragraph, eleven layers each with Examples and Dependencies, consumers, references. Layers are named by their mathematics and D nowhere says it follows a source. Every definition has its API and at least three Checks; every theorem its hypotheses and a locator. Headlines for the package stage: Bowen's criterion under weak specification for homeomorphisms and for flows (§§5.2–5.3); upper semicontinuity of entropy for expansive flows (§3.1); the Hadamard–Perron theorem and local manifolds (§§8.1–8.3); local product structure of locally maximal hyperbolic sets (§§8.4–8.5); Bowen's theorem (§10.2); the Bowen–Ruelle theorem (§10.3); uniqueness of the Bowen–Margulis measure (§10.4); the SRB theorem (§11.6). The one-tactic probe and the `#check` comparison do not apply: there is no Lean file.

Source independence: 16 passages compared with 7 sources (BowenRuelle1975, ClimenhagaThompson2016, BowenPeriodicPoints1971, ClimenhagaPesin2016, BowenEntropyExpansive1972, Smale1967, BowenGroupEndomorphisms1971), none shared beyond formulas, standard names and hypothesis lists; largest share BowenRuelle1975, 42 of 124 locators in the layers; contents compared with BowenRuelle1975 (Introduction, Symbolic Dynamics, Equilibrium States, Attractors, Main Results, Appendix): independent. D has no symbolic-dynamics layer, Layers 1–9 have no counterpart section there, and Layer 11 interleaves that source's Section 4 and Appendix in the order its Needs lines force (11.3 needs 11.2, 11.4 needs 11.3, 11.5 needs 11.4, 11.6 needs 11.5).

## Not verifiable

- Walters1982, Bowen1975, FH2019, KatokHasselblatt1995, Newhouse1989, BowenWalters1972, HirschPalisPughShub1970: settled as uncertified; cited by locator, not read. The sampled targets 7.4 and 9.3, and parts of 6.2, 6.6, 7.3 and 8.5, cite only these.
- The displayed formulas of BowenRuelle1975 Theorem 5.1, Proposition 4.4 and Lemma A.2 are garbled in the extraction; the prose hypotheses and conclusions were read.
- Lean elaboration: not available in this lane; there is no Lean file.

## Source issues

- **Error** in BowenRuelle1975 at the proof of Theorem 5.1, printed page 192: the source says the ball of radius 2ε about x contains the ε-ball about z once the two ε-balls meet; it should be radius 3ε, by the triangle inequality; affects the proof.
- **Gap** in ClimenhagaPesin2016 at the derivation of Theorem 11.1, page 40 of arXiv v1: the source says γ₀ need only satisfy λ(1 + γ₀) < μ; it should also satisfy γ₀ < μ − 1, without which no δ₀ meets its own condition (μ = 1.1, λ = 0.1, γ = 0.9); affects the proof.

## For the human reviewers

- ClassicalErgodicTheory, supplier of what Layers 1–5 import, is an open pull request by another author adding a new folder; it is not in `merge-order/ORDER.txt`, so the dependency check does not see that edge.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "8a1ba7af0969e3257353c4aef43db2b6a31f3947", "job": "REV-DESIGN-HyperbolicDynamicsAndThermodynamicFormalism~9", "model": "fable", "worker": "chris-x82"} -->
