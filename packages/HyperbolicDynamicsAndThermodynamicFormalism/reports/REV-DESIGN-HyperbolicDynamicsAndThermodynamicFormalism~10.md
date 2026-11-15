<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13791#issuecomment-6898666082 -->
Review (claude) of 02ffd18

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P3) the scale quantifier of the lower Gibbs bound in §10.3 is implicit

   **Location.** D §10.3: "satisfies the lower Gibbs bound ν_{g,F}(B_x(ε, T)) ≥ C_ε exp(−T P(g|Λ, F) + ∫₀ᵀ F(g^t x) dt) for x ∈ Λ, T > 0"; P 10.3 statement, "lower Gibbs bound".

   **Claim.** A constant C_ε is named, but the sentence does not say for which ε it exists; §6.8(b), from which the bound comes, gives it "at small scales".

   **Witness.** BowenRuelle1975 lines 275–277 state it for every ε > 0. That stronger form follows from the small-scale one: for ε ≥ ε₀, B_x(ε, T) ⊇ B_x(ε₀, T), so C_ε = C_{ε₀} works.

   **Exact repair.** In D §10.3 write "and for every ε > 0 there is C_ε > 0 with ν_{g,F}(B_x(ε, T)) ≥ C_ε exp(−T P(g|Λ, F) + ∫₀ᵀ F(g^t x) dt) for all x ∈ Λ and T > 0 (for ε above the scales of §6.8(b), by monotonicity of the balls in ε)"; in P 10.3 replace "lower Gibbs bound" by "lower Gibbs bound at every scale ε > 0". Tested on the periodic orbit of period p: ν(B_x(ε, T)) ≥ min(1, 2ε/p) for every T, and exp(−TP + ∫₀ᵀ F) lies in [e^{−2p max|F|}, e^{2p max|F|}], so C_ε = min(1, 2ε/p) e^{−2p max|F|} works for every ε > 0.

One finding (R01, P3), with its exact repair; no P1 or P2. Because the review writes a repair, it asks for changes rather than accepting. The two declared supplier gaps, `gap:sphere-bundle-embedding` and `gap:connection-map-jacobi-derivative`, are precise, minimal and declared in both files, and are not findings. **D** is `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/README.md`, **P** is `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`. Only this report and `design/review.json` were written. No source was fetched (every cited work is in the manifest) and `sources.toml` is unchanged. No maintainer notes were supplied. There is no `Suggested.lean` at the design stage and this lane does not elaborate, so nothing was elaborated; the one-tactic probe and the `#check` comparison do not apply.

## Previous finding, checked

| Round 9 | Repaired passage and what was checked at the pin | Status |
|---|---|---|
| F01 (P3), the flow of a complete vector field cited through a roadmap alias | D "From Tau Ceti": "`TauCeti.globalFlow`, `TauCeti.isMIntegralCurve_globalFlow`, `TauCeti.contMDiff_globalFlow_uncurry`, `TauCeti.mfderiv_globalFlow_apply_self` … and `TauCeti.IsCompleteVectorField`, `TauCeti.isCompleteVectorField_of_compactSpace`"; D §9.2(b) "the flow of hX (`TauCeti.globalFlow`: hX is a C^r field on a compact manifold, hence complete by …)"; §9.2(c) "`TauCeti.globalFlow` again"; §9.2 *Needs* and Layer 9 Dependencies; P 9.2 prerequisites carry the five `tauceti:` names and `tauceti:TauCeti.isCompleteVectorField_of_compactSpace`. At the Tau Ceti pin `2fd255d9…`: `TauCeti/Geometry/Manifold/IntegralCurve/GlobalFlow.lean`:60 (`globalFlow`, section binders `[FiniteDimensional ℝ E]`, `[T2Space M]`, `[IsManifold I 1 M]`, `[BoundarylessManifold I M]`, :52–55), :90, :147 (`{n : ℕ∞} (hn : 1 ≤ n) [IsManifold I n M]`), :167; `TauCeti/Geometry/Manifold/Flow/Complete.lean`:61, :154 (`[CompleteSpace E]` :141, `[CompactSpace M]`). No `DifferentialGeometry` or `toFlow` remains in D, P or the manifest. | Repaired |

Nothing was marked "not actionable in this package"; nothing is re-raised.

Adversarial pass on the changed passages:

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Contract bullet, hypotheses against the pin | each clause against the binders | "Hausdorff boundaryless C¹ manifold modelled on a finite-dimensional space" = the four section binders; "jointly C^n … 1 ≤ n ≤ ∞ (n in ℕ∞)" = :147; "complete on a compact … manifold modelled on a complete space" = :141, :154 | Pass |
| §9.2(b) with the pinned flow | h ≡ 1; h ≡ 2 | h ≡ 1: orbits of g are integral curves of X, flow of X is g, a_x = 0. h ≡ 2: flow t ↦ g^{2t}, same bundles, rate 2κ (§7.7) | Pass |
| §9.2(c) with the pinned flow | R, c < min R; R ≡ 1, c = 1/2; c = 2, R = 1 | return time ∫₀¹ (c + (R − c)ρ) ds = R; 1; denominator 2 − ρ vanishes where ρ = 2, attained since a bump of integral 1 on an interval of length 1/2 has maximum ≥ 2 | Pass |
| §9.2(c), instances the pinned flow needs on the mapping torus | compact Hausdorff N | `T2Space` of the quotient: Mathlib `t2Space_of_properlyDiscontinuousSMul_of_t2Space` (`Mathlib/Topology/Algebra/ConstMulAction.lean`:623) with Tau Ceti's `instProperlyDiscontinuousSMul` (`TauCeti/Geometry/Manifold/Instances/MappingTorus.lean`:221) and the cover's `T2Space`, `LocallyCompactSpace` (:119, :121); compact as the image of [0, 1] × N | Pass |
| Mapping-torus convention | pin docstring against D | pin: (t, x) ∼ (t + 1, φ⁻¹x), `mk_add_one` (:303) gives [t + 1, x] = [t, φx]; D: "(t + 1, x) ∼ (t, φx)"; `flow_one_mk` (:431) gives time-one map φ on each fibre | Agree |

The repaired pattern (a library object used and not named in the contracts) was searched again in the rest of D: every backticked Mathlib and Tau Ceti name of the sampled sections resolves (list below); `roadmaps resolve` reports none found nowhere.

## Verified sound

**Coverage.** D read in full (1004 lines, 11 layers, 45 targets); P parsed: 45 targets in D's order, no forward `target:` edge, at least three tests each (3 to 7), pins equal to the checkouts' heads (Mathlib `1b1ccf4b…`, Tau Ceti `2fd255d9…`, as in `lake-manifest.json`). 18 manifest keys, each cited in D; every key D cites is in the manifest. Style scan of D: no LaTeX delimiter, machine path, pull-request number, process word, `set_option` or algorithm (the only hits of the scan are the words "round" and "shrunk" in mathematical sentences).

**Adversarial table** (the fifteen sampled targets, the headlines, the finding).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §2.2 definition against ClimenhagaThompson2016 | n_j = 0; k = 1 | d_0 = 0 < δ for maps, so empty segments impose nothing; N_0 = τ_0 = 0 as in the source's (5.6) | Pass |
| §2.2 `HasSpecification` ⟹ weak | intervals [a_j, a_j + n_j − 1], a_{j+1} − b_j = M | gluing time a_{j+1} − (a_j + n_j) = M − 1 ≤ M; supplier's "≤ ε" at ε < δ gives "< δ" | Pass |
| §2.2 weak ⟹ forward transitive | segments (u, 1), (v, 1) | T^{1+τ₁}(U) ∩ V ≠ ∅ with 1 + τ₁ ≥ 1 | Pass |
| §2.2 Checks | swap; full shift at 2^{−m}; rotation | swap: 1 + τ even for (a,1),(a,1), odd for (a,1),(b,1); shift: need N + n + τ − m > N + n − 1 + m, τ ≥ 2m, 2m + 1 suffices; rotation: isometry, each junction re-aimed within δ, no accumulation | Pass |
| §2.2 long segments suffice | segment (x, t), t < T₀ | extend to (x, T₀): gluing time becomes τ_i + (T₀ − t) ≤ τ + T₀ at the same δ | Pass |
| §6.1 coincidence and bracket | y, y' δ*-close for all n ∈ ℤ; w = [x, z], p = [fx, fz] | d(y, y') ≤ cλ^n δ* → 0; fw and p are 2δ-close forward (both in W^s_δ(fx)) and for n ≥ 1 backward (both δ-close to f^{−n}fz), so equal when 2δ ≤ δ* | Pass |
| §6.1 f^k | δ** with d ≤ δ** ⟹ d(f^i ·, f^i ·) ≤ δ*, i < k | W^{s,f^k}_{δ**} ⊆ W^{s,f}_{δ*}, rate λ^k | Pass |
| §6.1 Checks | two-shift; finite set; rotation | d(T^n x, T^n y) = 2^{−(N+n)} = 2^{−n} d on W^s_{1/2}; singletons below the least distance; isometry forces y = x in (A3) | Pass |
| §6.2 density of periodic points | isolated p; monotone shift | U = {p}, V = {f⁻¹p}: f^{n+1}p = p; (T^n x)_0 = x_n ≥ x_0 = 1, so T^n(U) ⊆ U for U = {x₀ = 1}; only periodic points 0^ℤ, 1^ℤ | Pass |
| §6.2 Check 4 | β = 1, 1/4 | diameter 1: every point 1-shadows; 2β = 1/2 = δ* | Pass |
| §6.4 | any θ > 0; φ = 1/m | Σ_k C(cδλ^k)^θ + Σ_k C(cδλ^{n−1−k})^θ ≤ 2C(cδ)^θ/(1 − λ^θ); T^k y differs from 0^ℤ at index n + m − k ≥ m + 1, distance ≤ 2^{−m−1}, sum 1/(m+1) + ⋯ + 1/(n+m) | Pass |
| §6.6 Check 1 | τ ∈ ℝ | dist(τ, ℤ) + dist(τ, 1/2 + ℤ) = 1/2; both < 1/4 impossible | Pass |
| §6.6 no isolated points | isolated x of a flow | g^t x = x for small t, hence for all t: a fixed point, excluded by §6.5 | Pass |
| §7.6 series and integral | shift by one step; by time t | Σ λ'^{−2n}\|Df^{n+1}v\|² = λ'² Σ_{n≥1} λ'^{−2n}\|Df^n v\|² ≤ λ'²\|v\|'²; ∫₀^∞ e^{2κ's}\|Dg^{s+t}v\|² ds ≤ e^{−2κ't}\|v\|'² | Pass |
| §7.6 Check 3 | J = (1/2 1; 0 1/2), D = diag(1/8, 1) | 2^n\|J^n(0,1)\| = (4n² + 1)^{1/2}; DJD⁻¹ = (1/2 1/8; 0 1/2), norm ((65/64)^{1/2} + 1/8)/2 = 0.566 ≤ 3/4 | Pass |
| §8.2 Check 2 | v ∝ (1, √7 − 2) | \|v\|² = \|Bv\|² = 12 − 4√7 = 1.4170; \|B²v\|/\|v\| = 0.9102/1.1904 = 0.7646; \|B³v\|/\|v\| = 0.516; det(v, BᵀBv) = 0.6615 = √7/4 | Pass |
| §8.4 API and three-copy Check | f², U ∩ f(U) | ∩_n f^{2n}(U ∩ f(U)) = ∩_m f^m(U) = {a}; f(U) meets copies 1 and 3 only, so U ∩ f(U) lies in copy 1 and excludes c; c is fixed by f² in U | Pass |
| §8.4 (A3) | δ* = r₀/K | W^s_{δ*}(x) ⊆ 𝒲^s_{r₀}(x), contraction C'λ'^n, c = max(C', 1) | Pass |
| §9.1 | cat matrix; shear; rotation; n = 0 | A(1, 0.618) = (2.618, 1.618); eigenvalues 2.618, 0.382, log 2.618 = 0.9624; double eigenvalue 1; A⁴ = I; empty matrix: one-point torus, empty sum 0 | Pass |
| §9.2 Checks | h = 2; R(p) = 1, R(q) = √2 | return time 1/2, entropy 2 · 0.9624; periods 1 and √2 generate a dense subgroup | Pass |
| §9.3 | K ≡ −1; flat; −b² ≤ K ≤ −a² | J = e^{∓t}E, Sasaki norm √2 e^{∓t}; J = p + tq; \|J'\| ≤ b\|J\| gives C = (1 + b²)^{1/2}, κ = a; dim: 2(n − 1) + 1 = 2n − 1 = dim SM | Pass given the gaps |
| §10.1 attracting circle | r' = −sin(2πr)/(2π) | linearisation r' = −r, multiplier e^{−t}; W^s_Λ(ε) = {\|r\| ≤ ε}, area 2ε; basin {r ≠ 1/2} | Pass |
| §10.1 signed transitivity + dense periodic points | n < 0, p of period q in V ∩ f^n(U) | p = f^{kq+n}(f^{−n}p) ∈ f^{kq+n}(U) ∩ V, kq + n ≥ 0 for large k | Pass |
| §10.1 horseshoe subset | U₂ ∖ N | maximal invariant set lies in Λ₂ and never reads "1, 0": nondecreasing itineraries, so it is Λ | Pass |
| §4.1 item 1 (used by §10.3) | μ ∈ M(g^t) averaged over [0, t] | F_t∘g^s − F_t = F_s∘g^t − F_s, a g^t-coboundary, so the average keeps ∫F_t and the entropy; sup over M(g) is tP_g(F) | Pass |
| §10.3 Checks | periodic orbit; F + 5 + L_gψ | P = (1/p)∫₀^p F; same state, pressure + 5 | Pass |
| §5.2 headline scales | δ < r/5, r ≤ ε/8 | r ∈ (5δ, ε/8] ⊆ (4δ, ε/4], and δ < ε/40 as the source requires | Pass |
| §5.2 Check 1 | full two-shift, φ = 0, ε = 1/2 | 2^{−(n+2)} · 2^n = 1/4 | Pass |
| §5.3 headline | one point; two-point identity flow | one point: all hypotheses, unique measure; two points: expansive (agrees with the supplier's Check), no weak specification, a segment of maximal measures | Pass |
| §11.4 Checks | Sol-type metric; T = 0 | box εe^{−aT} × ε × ε times e^{aT} = ε³; ε-ball with λ₀ = 1 | Pass |
| §11.5(a) | any (T, δ)-separated set; maximal E | closed δ/3-balls disjoint (2δ/3 < δ) and inside B_Λ(ε, T) for δ ≤ 3ε, valid for every separated set, so the lower bound reaches the supremum; cover radius 2δ + ε | Pass |
| §11.5 Check 4 | δ = 1/(3.9m), ε = 1.01δ | spacing 3.9δ ≥ 2δ; every point within 1.95δ; (1.95² + 1.01²)^{1/2} = 2.196 > 2.01, < 3.01 | Pass |
| §11.6 headline and Check 4 | z = (0,0), x = (2ε,0), y = (0,ε) | √5 ε = 2.236ε ∈ (2ε, 3ε] | Pass |
| R01 | periodic orbit, all ε > 0 | C_ε = min(1, 2ε/p) e^{−2p max\|F\|} | P3 |

For the sections outside the sample and untouched by the repair I rely on the round-9 table, whose rows carry computed values (§§1.1, 1.2, 5.1, 6.3, 6.7, 7.3, 7.4, 8.1, 8.3, 8.5, 8.7, 10.2, 10.4, 11.1–11.3); the rows above that overlap it were recomputed and agree.

**Seeded source sample.** D and P flag no locator as unverified. Read this round, each supporting the statement as written:

- 2.2: ClimenhagaThompson2016 lines 295–303, 448–463, 1661–1669.
- 6.1: BowenPeriodicPoints1971 lines 66–83. 6.2: lines 96–97, 101–104, 387–392 (the proof of 4.2 uses an open C with f⁻¹(C) ⊆ C, the forward notion).
- 6.4: ClimenhagaThompson2016 lines 341–342. 6.6: BowenEntropyExpansive1972 lines 117–135.
- 7.6: BowenRuelle1975 lines 19–24. 8.2: ClimenhagaPesin2016 lines 1822–1855. 8.4: BowenPeriodicPoints1971 lines 73–80.
- 9.1: Smale1967 lines 381–463; BowenGroupEndomorphisms1971 lines 313–316, 332–336; BowenPeriodicPoints1971 line 667. 9.2: BowenRuelle1975 lines 119–133, 60–61.
- 10.1: BowenRuelle1975 lines 25–34, 94–95, 381–383, 402–406, 441. 10.3: BowenRuelle1975 lines 213–222, 272–277; TsujiiZhang2023 lines 106–109, 485–495.
- 11.4: BowenRuelle1975 lines 364–375, 740–754. 11.5: lines 377–407.
- Also read: ClimenhagaThompson2016 lines 140–147, 355–381, 1243–1253, 1489, 1687–1690, 1717–1724, 1880–1887, 1908–1910, 1955, 1963–1965; BowenPeriodicPoints1971 lines 421–426, 749–750; BowenRuelle1975 lines 324–325, 346–363, 409–413, 421–472.

9.3 cites only uncertified texts; its statement was recomputed (table).

**Pins opened this round** (file and line). Tau Ceti: the six declarations of the repair (above); `SmoothMappingTorus` (`TauCeti/Geometry/Manifold/Instances/MappingTorus.lean`:245), `flow` (:395), `flow_one_mk` (:431), `contMDiff_uncurry_flow` (:493); `sphereBundleChartedSpace`, `isManifold_sphereBundle`, `isSmoothEmbedding_coe_sphereBundle` (`TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Sphere.lean`:143, :161, :181); `catMap` (`TauCeti/Dynamics/CatMap.lean`:43) with `charpolyRev_catMap`; `brouwerFixedPoint_closedBall` (`TauCeti/AlgebraicTopology/Singular/BrouwerFixedPoint.lean`:149, `0 ≤ r`, a continuous self-map of the closed ball). Mathlib: `AddAction.IsTopologicallyTransitive` (`Mathlib/Dynamics/Transitive.lean`:31, "∃ m, ((m +ᵥ U) ∩ V).Nonempty", the identity allowed), `Flow.fromIter`, `Flow.toAddAction`, `Flow.restrictNonneg`, `Flow.reverse` (`Mathlib/Dynamics/Flow.lean`:143, :196, :241, :335). For the other names I rely on the lists of rounds 8 and 9, which give file and line.

**Duplication audit.** Search of the open heads and main for "Anosov", "weak specification", "connection map", "Sasaki", "Hadamard–Perron", "SRB measure", "Bowen–Margulis", "hyperbolic set": ClassicalErgodicTheory (which puts uniformly hyperbolic smooth dynamics outside its scope and names a roadmap on it as consumer of its §§8.4–8.6); GeometricTopology and TaubesGromov (Anosov torus bundles and the cat matrix as examples, no theory); "connection map" only for unrelated objects (CharacteristicClasses, ComplexComparisonPartII). This roadmap is the owner of what its Scope lists.

Supplier citations resolved this round:

- ClassicalErgodicTheory at its open head: Conventions "Invariant probabilities" and "Separated sets and Bowen balls" (strict inequality, n points, `Set.Icc 0 t` for flows); §5.3 (`IsExpansive T δ`), §5.5 (definition through the time-one map, items 1–3, transitivity of the ℝ-action), §8.4 (`HasSpecification` with gaps a_{i+1} − b_i ≥ M and "≤ ε", `HasBowenProperty` with the criterion C'λ^{min(k, n−1−k)}, `IsGibbsMeasure`, `existsUnique_isEquilibriumState`), §8.5 (`IsExpansiveFlow`, `HasFlowSpecification`, `HasFlowBowenProperty`, `existsUnique_isFlowEquilibriumState`, flow coboundaries); headings §§0.3, 1.4, 3.4, 5.1–5.6, 6.1–6.2, 6.4, 7.1–7.4, 8.1–8.5 exist.
- ArithmeticDynamics §2.7 at its open head: Shannon–McMillan–Breiman with ∫g_P dμ = hμ(T, P), null-boundary partitions, the ergodic decomposition kernel, g_P(x) = h_{μ_x}(T, P) and the entropy integral; §§2.67, 2.92 exist. GeometryOfNumbersAndQuadraticArithmetic §4.2, paragraph "Entropy and Haar measure on leaves" with `countablePartitionEntropy`, at its open head.
- On main (1a19c9f): ProbabilisticAndMetricNumberTheory §4.1 `birkhoff_pointwise`, `birkhoff_pointwise_ergodic` (`TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md`:4650, :4692); GeometricCurrents G6 (:668–681); GeneralizedCohomology G4.0b (:1082, graph charts :1140–1150); RiemannianGeometry R1 (:1050), R2 (:1475), R4 (:2269); TangentialBordism §2.3 (B1.5) (:944); OperatorAlgebraDynamics D9 (:3851).

Overlap facts: no other pull request changes this roadmap; no cited id is dropped. The lead "GeneralizedCohomology §G4.0b is defined only by an open revision" is refuted: main states G4.0b at `TauCetiRoadmap/GeneralizedCohomology/README.md`:1082 (an item inside a section, not a heading).

Overlap check: read ClassicalErgodicTheory, MathematicalBilliards, ArithmeticDynamics, OptimalTransport, ProbabilisticAndMetricNumberTheory, RiemannianGeometry; shared: Bowen balls, toral endomorphisms, expansive maps and flows, the Bowen property and specification with periodic shadowing, owner ClassicalErgodicTheory, cited by this roadmap; nothing else shared.

**Supplier direction.** The dependency check printed:

    candidate: HyperbolicDynamicsAndThermodynamicFormalism is not in the merge order yet; checked as if placed after ArithmeticDynamics (the intake inserts it when its design is accepted)
    depcheck: 246 roadmaps, 2245 edges, 0 problem(s)

No UPWARD or CYCLE line. No supplier is on the never-cite list.

**Declared gaps.** Same slugs in P's `gaps` and under D's "Required extensions"; each `needs` is one statement with its hypotheses; both are used by §9.3 only. Minimality at the pin: `Sphere.lean` has the atlas, the manifold structure and the embedding and no corestriction theorem; `TauCeti/Geometry/Manifold/RegularValue/Level.lean` and `ManifoldLevel.lean` give charts, manifold structure and embeddings of regular levels and no corestriction either; the only `IsSmoothEmbedding.codRestrict` (`TauCeti/Geometry/Manifold/SmoothEmbedding/LocalDiffeomorph.lean`:126) is for open subsets; the corestriction lemmas that exist are for other carriers (`contMDiff_iff_comp_subtypeVal_closedBall`, `…_boundary`, `…_chartedSpaceOfIsSliceChart`). No connection map or Sasaki metric at the pins or in RiemannianGeometry. Contracts, not findings.

**Shape.** Summary, Scope, Conventions, supplier contracts, build paragraph, eleven layers each with Examples and Dependencies, consumers, references. Layers are named by their mathematics; D nowhere says it follows a source. Every definition has its API and at least three Checks; every theorem its hypotheses and a locator. Headlines for the package stage: Bowen's criterion under weak specification for homeomorphisms and flows (§§5.2–5.3); upper semicontinuity of entropy for expansive flows (§3.1); the Hadamard–Perron theorem and local manifolds (§§8.1–8.3); local product structure of locally maximal hyperbolic sets (§§8.4–8.5); Bowen's theorem (§10.2); the Bowen–Ruelle theorem (§10.3); uniqueness of the Bowen–Margulis measure (§10.4); the SRB theorem (§11.6).

**Copyright.** Wording compared at eleven passages: §2.2 with ClimenhagaThompson2016 lines 295–303 and 1661–1669; §1.3 with lines 355–381; §6.1 with BowenPeriodicPoints1971 lines 66–83; §7.6 with BowenRuelle1975 lines 19–24; §8.1 with ClimenhagaPesin2016 lines 1822–1843; §10.1 with BowenRuelle1975 lines 25–34; §10.3 with lines 272–277 and TsujiiZhang2023 lines 485–495; §11.4 with BowenRuelle1975 lines 364–375; §11.5's proof with lines 386–401; §11.6's proof with lines 426–469. What is shared is formulas, standard names and hypothesis lists; the proof plans of §§11.5–11.6 restate the argument with changed radii (2δ + ε, 3ε) and their own justification. No table, figure or list is taken over.

Source independence: 11 passages compared with 5 sources (BowenRuelle1975, ClimenhagaThompson2016, BowenPeriodicPoints1971, ClimenhagaPesin2016, TsujiiZhang2023), none shared beyond formulas, standard names and hypothesis lists; largest share BowenRuelle1975, 42 of 124 locators in the layers; contents compared with BowenRuelle1975 (Introduction, Symbolic Dynamics, Equilibrium States, Attractors, Main Results, Appendix): independent. D has no symbolic-dynamics layer, Layers 1–9 have no counterpart section there, and Layer 11 interleaves that source's Section 4 and Appendix in the order its *Needs* lines force (11.3 needs 11.2, 11.4 needs 11.3, 11.5 needs 11.4, 11.6 needs 11.5).

## Not verifiable

- Walters1982, Bowen1975, FH2019, KatokHasselblatt1995, Newhouse1989, BowenWalters1972, HirschPalisPughShub1970: settled as uncertified; cited by locator, not read. The sampled target 9.3, and parts of 6.2, 6.6, 7.6, 8.2, 8.4 and 9.2, cite only these.
- The displayed formulas of BowenRuelle1975 Theorem 3.3, Proposition 4.4 and Theorem 5.1 are garbled in the extraction; the prose hypotheses and conclusions were read.
- Lean elaboration: not available in this lane; there is no Lean file.
- Ownership against the open pull requests was checked through `roadmaps grep` and `roadmaps show` at the index of 2026-11-15T17:30:40Z, not from sibling checkouts.

## Source issues

- **Error** in BowenRuelle1975 at the proof of Theorem 5.1, printed page 192: the source says the ball of radius 2ε about x contains the ε-ball about z once the two ε-balls meet; it should be radius 3ε, by the triangle inequality; affects the proof.
- **Gap** in ClimenhagaPesin2016 at the derivation of Theorem 11.1, page 40 of arXiv v1: the source says γ₀ need only satisfy λ(1 + γ₀) < μ; it should also satisfy γ₀ < μ − 1, without which no δ₀ meets its own condition (μ = 1.1, λ = 0.1, γ = 0.9); affects the proof.

## For the human reviewers

- ClassicalErgodicTheory, supplier of what Layers 1–5 import, is an open pull request by another author adding a new folder; it is not in `merge-order/ORDER.txt`, so the dependency check does not see that edge.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "02ffd188caf881c4ca788d618faeb025807318bd", "job": "REV-DESIGN-HyperbolicDynamicsAndThermodynamicFormalism~10", "model": "fable", "worker": "chris-x80"} -->
