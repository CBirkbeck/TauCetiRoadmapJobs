<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13791#issuecomment-6899924827 -->
Review (claude) of 1506c37

Verdict: accepted
Conditional on the announced gaps: `sphere-bundle-embedding`, `connection-map-jacobi-derivative`

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

No finding this round. Both round-11 locator findings are repaired, the adversarial pass over the repaired passages and the fifteen sampled targets found no defect, every sampled locator that can be read agrees with its text, and every supplier citation resolves. The acceptance is conditional on the two declared supplier gaps, `gap:sphere-bundle-embedding` and `gap:connection-map-jacobi-derivative`, which were checked as contracts.

**D** is `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/README.md`, **P** is `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`. Only this report and `design/review.json` were written. No source was fetched and `sources.toml` is unchanged. No maintainer notes were supplied. There is no `Suggested.lean` at the design stage and this lane does not elaborate, so nothing was elaborated; the one-tactic probe and the `#check` comparison do not apply.

## Previous findings, checked

| Round 11 | Repaired passage | Status |
|---|---|---|
| F01 (P3), §2.1 locators define mixing of a map, not of a flow | D §2.1: "(the continuous-time form of the notion for homeomorphisms of BowenRuelle1975, line 165, footnote 2, and for diffeomorphisms of BCS2022, lines 43–44; it is the hypothesis on Anosov flows in TsujiiZhang2023, Theorem 1.1, line 125, and Theorem 1.2, line 156)". P 2.1 `where` names the three settings. Read again: BowenRuelle1975 line 165 (homeomorphism F), BCS2022 line 44 (diffeomorphism), TsujiiZhang2023 lines 125 and 156 (mixing Anosov flows as hypothesis). | Repaired |
| F02 (P3), §4.1 cited Proposition 3.1 for time-t maps | D §4.1: "(BowenRuelle1975, lines 190–199, for the time-one map: P_g(F) = P_{g^1}(F_1), ∫F dμ = ∫F_1 dμ for μ ∈ M(g), and P_g(F) as the supremum of the free energy over M(g); Remark 4.5, lines 409–413, for the rescaling of time)". P 4.1 `where` agrees. Read again: lines 191–192 (pressure and integral identities), 193–199 (supremum over the flow-invariant measures), 409–411 (rescaling). | Repaired |

The manifest change that came with the repairs (TsujiiZhang2023: `locator` gains Theorem 1.2, `cited_for` gains 2.1 and loses 4.1) matches D. Nothing was marked "not actionable in this package"; nothing is re-raised.

The repaired pattern (a locator attached to a statement in a setting the passage does not cover) was looked for in every locator of the sampled sections below; none found. Two places where the source's setting is narrower are already declared as such in D: §11.3(a) (Lemma A.2 is stated for integer times; D's hypothesis over all t ∈ [0, T] is stronger and the last partial unit of time costs at most Lip(ψ)·δ) and §6.7 (Lemma A.2 "for C¹ potentials on hyperbolic sets, whose argument uses only the bracket and the exponential estimates").

## Adversarial table

Rows computed this round: the passages the repairs changed, the fifteen sampled targets, the headline theorems.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §2.1 definition against its three locators | time-one restriction; roof-one suspension | mixing at all t ≥ t₀ gives it at integers n ≥ ⌈t₀⌉, the map notion of the two cited passages; suspension meets only near 1/2 + ℤ, so excluded by the TsujiiZhang hypothesis | Pass |
| §4.1 items 1–2 against lines 190–199 | F = c on the roof-one suspension; μ ∈ M(g) | F_1 = c, P = log 2 + c on both sides; free energy for (g^t, F_t) is t(hμ(g¹) + ∫F dμ), pressure tP_g(F) | Pass |
| §4.1 rescaling against Remark 4.5 | a = 2, F = 1 | 2 log 2 + 2 = 2(log 2 + 1); with F unscaled 2 log 2 + 1 | Pass |
| §1.2 finiteness theorem | two-shift at ε = 1/4; identity of [0, 1]; compactified union of shifts on 2^m symbols | {d ≤ 1/4} fixes coordinates −1..1, over k < n coordinates −1..n: 2^{n+2} cover elements, rate log 2; identity: entropy 0 on every Φ_ε; Φ_ε(∞) contains pieces of entropy m log 2 for large m, entropy ∞ | Pass |
| §1.2 periodic points | Fix(Tⁿ) of an expansive map; identity of [0, 1] | two fixed points of Tⁿ separated beyond c at a time moved into [0, n): (n, c)-separated, finite; identity has a continuum of fixed points and is not expansive | Pass |
| §1.3 items and Checks | periodic orbit; irrational linear flow; identity flow on a finite set and on the circle | circle orbit: ε-close for all time forces a time shift below ε/speed; linear flow: Γ_ε contains a transverse segment; finite set: ε below the least distance gives y = x; circle: fixed points not isolated | Pass |
| §1.3 item 3 | t < 0 | g^t = (g^{\|t\|})⁻¹ has the same two-sided set, inside an orbit segment spanned by a fixed finite set for every n: entropy 0 | Pass |
| §6.1 two-shift | W^s_{1/2}; contraction | d ≤ 1/2 at all n ≥ 0 iff y_i = x_i for i ≥ 0; first difference at −j gives 2^{−j}, after n shifts 2^{−j−n}: c = 1, λ = 1/2 | Pass |
| §6.2 expansivity | orbits δ*-close for all n | d(y, y′) ≤ cλⁿδ* for every n, so y = y′ | Pass |
| §6.2 density of periodic points | isolated point p; monotone shift | forward orbit of p reaches the isolated point f⁻¹p at some n ≥ 0: period n + 1, X one orbit; monotone shift: Tⁿ{x₀ = 1} ⊆ {x₀ = 1}, cylinder {x₋₁ = 0, x₀ = 1} a single wandering point, only two periodic points | Pass |
| §6.2 Check 4 | β = 1 and β = 1/4 on the two-shift | diameter 1, so every point 1-shadows; 2β = 1/2 = δ* | Pass |
| §6.3 gluing time | r_j + n_j = 0; general | m(L_j + M) + r_{j+1} − r_j − n_j; mL_j − r_j − n_j ∈ [0, m] (m only when L_j = 1 covers an empty segment), plus r_{j+1} ≤ m − 1: within [mM, mM + 2m − 1] | Pass |
| §6.4 Bowen property | z = [x, y], n steps | d(f^k x, f^k z) ≤ cδλ^k, d(f^k z, f^k y) ≤ cδλ^{n−1−k}; two geometric sums, total 2C(cδ)^θ/(1 − λ^θ) | Pass |
| §6.4 Check 3 | φ = 1/m (least index of a 1), x = 0, y with its 1 at n + m | closeness 2^{−(m+1)} at times 0..n−1; S_nφ(y) = 1/(m+1) + ⋯ + 1/(n+m), unbounded | Pass |
| §6.6 no strong specification of the roof-one suspension | segments of lengths 0, 1 and 1/2, 1 | τ within 1/4 of ℤ and within 1/4 of 1/2 + ℤ, both strict; the two distances add to 1/2 | Pass |
| §6.6 Check 4 | suspended monotone shift | zeroth symbol of T^k x is x_k ≥ x₀ = 1: flow box over {x₀ = 1} never reaches the one over {x₀ = 0} | Pass |
| §6.8 (a), (b) | swap; periodic orbit; monotone shift | h = 0, one invariant measure; time measure; n + 1 words of length n, h = 0, invariant measures a segment, all of free energy 0 = P(0) | Pass |
| §7.1 definition and API | diag(2, 1/2); diag(2, 1); identity; λ = 1 | C = 1, λ = 1/2; eigenvalue 1 gives a vector in neither bundle; \|Dfⁿv\| = \|v\| forces both bundles 0; λ = 1 would admit isometries | Pass |
| §7.2 | constant field on 𝕋²; suspension of diag(2, 1/2); zero of the generator | Dg^t = Id forces dim T_xM = 1 ≠ 2; κ = log 2; origin of (x, −y) excluded by X ≠ 0, as BowenRuelle1975 line 11 | Pass |
| §7.3 Checks | metric × 4; Gram (2 1; 1 1) | K₁ = 2, K₂ = 1/2, product 1; eigenvalues (3 ± √5)/2, K₁K₂ = ((3 + √5)/(3 − √5))^{1/2} = (3 + √5)/2 = 2.618 | Pass |
| §7.4 | (1, 1) under diag(2, 1/2); rotation; saddle ⊔ sink | unbounded; all bounded, none decays; union C = 1, λ = 1/2, dim E^s = 1 and 2 | Pass |
| §7.6 Jordan block | J = (1/2 1; 0 1/2), D = diag(1/8, 1) | Jⁿ(0, 1) = (n2^{1−n}, 2^{−n}), 2ⁿ times norm (4n² + 1)^{1/2}; DJD⁻¹ = (1/2 1/8; 0 1/2), norm 1/16 + (65/256)^{1/2} = 0.5664 ≤ 3/4 | Pass |
| §7.6 series | shift of the series | \|Df v\|′² = λ′² Σ_{n≥1} λ′^{−2n}\|Dfⁿv\|² ≤ λ′²\|v\|′² | Pass |
| §8.2 Check 2 (corner) | B = (1/2 1; 0 1/2), v ∝ (1, √7 − 2) | \|v\|² = \|Bv\|² = 12 − 4√7; \|B²v\| = 0.7646; \|B³v\| = 0.516; det(v, BᵀBv) = 0.6614 = √7/4 | Pass |
| §8.3 Checks 5, 6 | v′ = −v + u²; time change h | v = u₀²e^{2t}/3 + ce^{−t}; crossing the drop takes at most 0.05·e^{3a} = 0.90 < 1, then 0.1 of time moves 0.0056 < 0.1, so h(g¹x) = e^{−3a} = 0.056, inverse 17.9 | Pass |
| §9.2(c) | return time; R ≡ 1, c = 1/2; c = 2 | ∫₀¹ (c + (R − c)ρ) ds = R; 1; 2 − ρ vanishes where ρ = 2; [1, x] = [0, φx] from (t + 1, x) ∼ (t, φx) | Pass |
| §9.2 Checks 2, 4 | h = 2; R(p) = 1, R(q) = √2 | entropy 2 log 2.618; periods 1 and √2, dense subgroup | Pass |
| §9.3 | curvature −1; flat torus; round sphere; K ≤ −a² | (J, J′) = e^t(E, E), Sasaki norm × e^t; J = p + tq; sin t; \|J(t)\| ≤ e^{−at}\|J(0)\| and \|J′\| ≤ b\|J\| with b² = max\|K\|: rate a with a constant (1 + b²)^{1/2}, which the definition of §7.2 allows | Pass |
| §10.1 Checks 2, 7 | r′ = −sin(2πr)/(2π); monotone sub-horseshoe | zeros 0 (rate −1) and 1/2 (rate +1); W^s_Λ(ε) = {\|r\| ≤ ε}, area 2ε; orbit avoiding N never reads 1, 0, so itinerary nondecreasing | Pass |
| §10.3 Check 3 | T = kp + r | −TP + ∫₀ᵀF = ∫₀^r F − rP, modulus ≤ 2p max\|F\|; arc of measure 2s_ε/p | Pass |
| §10.4 | cat map; periodic orbit; hyperbolic surface | h = log 2.618 = 0.9624 > 0; h = 0, the stated exception; φ^u = −1 constant, so the three measures coincide and h = 1 | Pass |
| §11.1 Checks | Sol-type metric; factor e^{2u(s)} | \|∂_u\| = e^{as}, λ_t = e^{at}, φ^u = −a, P = a − a = 0; λ′_t = e^{at + u(s+t) − u(s)}, φ′^u = −a − 0.2π cos 2πs; one-sided derivatives a ± 2π for \|sin\| | Pass |
| §11.2 | q = 0, n; cat suspension, q = 1; lift of E^s | dimension n; (b, c) ↦ (be^{−2aT}, ce^{−aT}), 3 + 1 + 1 = 5 = 3 + 1·2; (b, c) ↦ (be^{2aT}, ce^{aT}), unstable dimension 3 | Pass |
| §11.2(iii) graph transform | L : E^u → E^s ⊕ ℝX | (Dg^t on E^s ⊕ ℝX) L (Dg^t on E^u)⁻¹, norm ≤ Ce^{−κt}\|L\| | Pass |
| §11.3 Check 1 | E* = span(e_u + 0.1 e_v) | ratio ((1 + b²e^{−4aT})/(1 + b²))^{1/2} ↓ 1.01^{−1/2} = 0.99504 < e^{−0.001} = 0.99900 | Pass |
| §11.3(a) against Lemma A.2 | real T, n = ⌊T⌋ | integer part below θ′ by the lemma, remainder ≤ Lip(ψ)δ | Pass |
| §11.5 Check 4 | δ = 1/(3.9m), ε = 1.01δ | spacing 3.9δ > 2δ, cover radius 1.95δ; (1.95² + 1.01²)^{1/2} = 2.196 > 2.01; inside 3.01δ | Pass |
| §11.6 Check 4 | z = (0, 0), x = (2ε, 0), y = (0, ε) | √5 ε = 2.236ε ∈ (2ε, 3ε] | Pass |
| §5.2 headline, Check 4 | two-shift, n = 1 | μ(B₁) = 1/8 ≥ Q2^{−2N}·2^{−1} since Q2^{−N} ≤ μ(B_N) ≤ μ(B₁) | Pass |
| §5.3 headline | periodic orbit; two-point identity flow | unique measure; expansive, no weak specification, a segment of maximal measures | Pass |
| §5.1 "large times suffice" | t ≤ T₀ | ratio of the two exponentials ≥ e^{−T₀(\|P\| + max\|φ\|)}; the stated factor e^{2T₀(…)} is larger | Pass |

For the sections outside this round's sample and untouched by the repair (§§1.1, 2.2, 3.1, 6.3 Check 4, 6.5, 6.7, 7.5, 7.7, 8.1, 8.4–8.7, 9.1, 10.2, 11.4), the round-11 and round-10 tables carry computed values; I reread each section and recomputed its Checks while reading, with the same results (among them: doubling map half-width 2^{−n−2}; §6.7 K = 4 sup\|ψ\|; §8.7 θ = 1/2 for the cat map; cat eigenvector (1, 0.618)).

## Verified sound

**Coverage.** D read in full (1007 lines, 11 layers). P parses: 11 layers, 45 targets, at least three tests each, `gaps` with the two slugs. 18 manifest keys; every key cited in D is in the manifest and in the References. Style scan of D: 0 LaTeX delimiters, 0 machine paths, 0 pull-request numbers, 0 process words, 0 `set_option`.

**Principles.** No route-specific shortcut (the uniqueness theorems are stated for abstract compact systems, the examples are Checks); nothing of ClassicalErgodicTheory is planned again (its head puts uniformly hyperbolic dynamics outside its scope and names such a roadmap as consumer of its §§8.4–8.6); no upward or cyclic supply; no algorithm; no Lean file.

**Seeded source sample**, read at the cited lines this round:

- 1.2: ClimenhagaThompson2016 lines 1687–1690; BowenEntropyExpansive1972 lines 55–56, 188, 192–193.
- 1.3: ClimenhagaThompson2016 lines 355–366, 371–375, 380–381, 513–530; BowenEntropyExpansive1972 lines 117–133.
- 6.2: BowenPeriodicPoints1971 lines 96–97, 101–104, 171–180 (start of the proof of 2.10); 66–83 for the axioms.
- 6.4: ClimenhagaThompson2016 lines 341–342. 6.6: BowenEntropyExpansive1972 lines 134–135.
- 6.8 and 10.4: BowenPeriodicPoints1971 lines 421–426, 667, 749–750; BowenRuelle1975 lines 77–78, 324–325.
- 7.1: Smale1967 lines 381–475 (toral examples, general n at 415–417, the Anosov definition at 453–458).
- 7.2: BowenRuelle1975 lines 10–18. 7.6: lines 19–24. 9.2: lines 119–133, 60–61.
- 11.2: BowenRuelle1975 lines 702–715. 11.3: lines 643–652, 681–701, 718–738.
- Also read: BowenRuelle1975 lines 25–34, 92–108 (line 95 defines transitivity of the restricted flow by a dense orbit, as D §10.1 reports); BowenPeriodicPoints1971 lines 387–392.
- 7.4 and 9.3 cite only uncertified texts; their statements were recomputed (table).

D and P flag no locator as unverified.

**Pins** (heads `1b1ccf4b…` Mathlib and `2fd255d9…` Tau Ceti, as in the manifest and in D). Opened this round: `Flow.fromIter`, `Homeomorph.flow`, `Flow.restrict`, `Flow.toAddAction`, `Flow.restrictNonneg`, `Flow.toHomeomorph`, `Flow.reverse` (`Mathlib/Dynamics/Flow.lean`:143, :154, :178, :196, :241, :301, :335); `Dynamics.dynEntourage`, `Dynamics.mem_ball_dynEntourage` (`Mathlib/Dynamics/TopologicalEntropy/DynamicalEntourage.lean`:52, :62); `Dynamics.IsDynNetIn` (`…/NetEntropy.lean`:69: pairwise disjoint balls of the inverse dynamical entourage, the same balls for the symmetric {d < ε}); `Dynamics.coverEntropyEntourage_finite_of_isCompact_invariant` (`…/CoverEntropy.lean`:418, compact F, `MapsTo T F F`, U a uniformity member); `UnitAddTorus` (`Mathlib/Topology/Instances/AddCircle/Real.lean`:55). Tau Ceti: `SmoothMappingTorus`, `SmoothMappingTorus.flow`, `flow_one_mk`, `contMDiff_uncurry_flow` (`TauCeti/Geometry/Manifold/Instances/MappingTorus.lean`:245, :395, :431, :493); `globalFlow`, `isMIntegralCurve_globalFlow`, `contMDiff_globalFlow_uncurry` (`1 ≤ n`, n in ℕ∞), `mfderiv_globalFlow_apply_self` (`TauCeti/Geometry/Manifold/IntegralCurve/GlobalFlow.lean`:60, :90, :147, :167); `isCompleteVectorField_of_compactSpace` (`TauCeti/Geometry/Manifold/Flow/Complete.lean`:154); `TauCeti.Manifold.isGeodesicallyCompleteAt_of_compactSpace` (`TauCeti/Geometry/Manifold/Riemannian/Geodesic/Compact.lean`:75); `catMap` (`TauCeti/Dynamics/CatMap.lean`:43). Named in module docstrings of the files D gives: `instIsManifoldPi`, `extChartAt_pi`, `AddCircle.instIsManifold`, `nonempty_contMDiffRiemannianMetric`, `norm_curveVelocityWithin_eq`, `charpolyRev_catMap`. The remaining declarations of D's contracts were opened at the same pins in round 11 (file and line in that report); the pins have not moved. `roadmaps resolve` lists no name found nowhere.

**Duplication audit and supplier citations, resolved this round.**

- ClassicalErgodicTheory at its open head: headings §§0.3, 1.4, 3.4, 5.1–5.5, 6.1–6.2, 6.4, 7.1–7.3, 8.1–8.2, 8.4–8.5 exist; all 26 names D cites occur (`IsExpansive`, `IsExpansiveFlow`, `HasSpecification`, `HasFlowSpecification`, `HasBowenProperty`, `HasFlowBowenProperty`, `IsGibbsMeasure`, `flowTopologicalPressure`, `measureEntropy_flow`, …). §5.5 read in full: the flow pressure as the pressure of the time-one map for F₁, the separated-set form, `coverEntropy (ϕ t) univ = |t| * coverEntropy (ϕ 1) univ`, and transitivity as that of the ℝ-action, all as D's contract says. It does not state weak specification, entropy-expansive maps as a notion of its own, or anything hyperbolic. It consumes ArithmeticDynamics §§2.6–2.7 for Shannon–McMillan–Breiman, null-boundary partitions and the ergodic decomposition, so D's citation of ArithmeticDynamics §2.7 goes to the owner.
- On main: GeneralizedCohomology G4.0b (`TauCetiRoadmap/GeneralizedCohomology/README.md`:1082, the smooth graph-chart upgrades of the finite real Grassmannians of dimension r(N − r) at :1149–1151); GeometricCurrents G6 (`TauCetiRoadmap/GeometricCurrents/README.md`:668–682, the Grassmann bundle, compact over compact base regions); TangentialBordism §2.3 (B1.5) (`TauCetiRoadmap/TangentialBordism/README.md`:944); RiemannianGeometry R1, R2, R4.1, R4.4 (its README lines 96–126, 1050, 1475), with no connection map and no Sasaki metric (search of its README: no hit).
- Overlap facts: no other pull request changes this roadmap; no cited id is dropped; this design drops no id. The lead "GeneralizedCohomology §G4.0b is defined only by an open revision" is refuted by main's line 1082.

Overlap check: read ClassicalErgodicTheory, MathematicalBilliards, ArithmeticDynamics, OptimalTransport, ProbabilisticAndMetricNumberTheory, RiemannianGeometry; shared: Bowen balls, expansive maps and flows, the Bowen property, Gibbs measures, specification with periodic shadowing, toral endomorphisms, topological mixing of maps, owner ClassicalErgodicTheory, cited by this roadmap; nothing else shared.

**Supplier direction.** The dependency check printed:

    candidate: HyperbolicDynamicsAndThermodynamicFormalism is not in the merge order yet; checked as if placed after ArithmeticDynamics (the intake inserts it when its design is accepted)
    depcheck: 246 roadmaps, 2245 edges, 0 problem(s)

No UPWARD or CYCLE line. No supplier is on the never-cite list. Every `*Needs:*` line was read: each names targets of earlier sections, pinned declarations, or sections of the suppliers above; §9.3 writes its two missing inputs as the declared gaps.

**Declared gaps.** Same slugs in P's `gaps` and under D's "Required extensions", each with a named supplier (TangentialBordism §2.3 (B1.5); RiemannianGeometry, proposed Part II). Each `needs` is one statement with its hypotheses. Minimal: Tau Ceti's `Sphere.lean` has the atlas, the manifold structure and the embedding and no corestriction theorem; no connection map at the pins or in RiemannianGeometry. Both are used by §9.3 only.

**Shape.** Summary, Scope, Conventions, supplier contracts, build paragraph, eleven layers each ending with Examples and Dependencies, consumers, references. Layers are named by their mathematics; D nowhere says it follows a source. Every definition has its API and at least three Checks; every theorem its hypotheses and a locator. Headlines for the package stage: Bowen's criterion under weak specification for homeomorphisms and flows (§§5.2–5.3); upper semicontinuity of entropy for expansive flows (§3.1); the Hadamard–Perron theorem and local manifolds (§§8.1–8.3); local product structure of locally maximal hyperbolic sets (§§8.4–8.5); Bowen's theorem (§10.2); the Bowen–Ruelle theorem (§10.3); uniqueness of the Bowen–Margulis measure (§10.4); the SRB theorem (§11.6).

**Copyright.** Wording compared at twelve passages: §1.2 with BowenEntropyExpansive1972 lines 55–56 and 192–193; §1.3 with ClimenhagaThompson2016 lines 355–381 and 513–530; §6.1 with BowenPeriodicPoints1971 lines 66–83; §6.2 with lines 96–104; §7.1 with Smale1967 lines 453–458; §7.2 with BowenRuelle1975 lines 10–18; §7.6 with lines 19–24; §9.2 with lines 119–133; §10.1 with lines 25–34 and 92–108; §10.4 with lines 77–78, 324–325 and BowenPeriodicPoints1971 lines 421–426; §11.2 with BowenRuelle1975 lines 702–715; §11.3 with lines 681–683 and 718–733. What is shared is formulas, standard names and hypothesis lists (the axioms (A2), (A3) can be written one way only); D's statements differ in form (pointwise subspaces without continuity in §7.1–7.2, a constructed roof function in §9.2(c) where the source uses a quotient of a strip, a graph-transform proof in §11.2(iii) where the source argues with manifolds V*). No table, figure or list of examples is taken over.

Source independence: 12 passages compared with 5 sources (BowenRuelle1975, ClimenhagaThompson2016, BowenPeriodicPoints1971, BowenEntropyExpansive1972, Smale1967), none shared beyond formulas, standard names and hypothesis lists; largest share BowenRuelle1975, 42 of 124 locators in the layers; contents compared with BowenRuelle1975 (Introduction, Symbolic Dynamics, Equilibrium States, Attractors, Main Results, Appendix): independent. D has no symbolic-dynamics layer, Layers 1–9 have no counterpart section there, and Layer 11 interleaves that source's Section 4 and Appendix in the order its *Needs* lines force (11.3 needs 11.2, 11.4 needs 11.3, 11.5 needs 11.4, 11.6 needs 11.5).

## Not verifiable

- Walters1982, Bowen1975, FH2019, KatokHasselblatt1995, Newhouse1989, BowenWalters1972, HirschPalisPughShub1970: settled as uncertified; cited by locator, not read. The sampled targets 7.4 and 9.3 cite only these, and parts of 6.2, 6.6, 7.1, 7.2, 7.6, 9.2 cite them beside readable texts.
- The displayed formulas of BowenRuelle1975 Lemmas A.2 and A.4 and of the chart definition A.1 are garbled in the extraction; the prose hypotheses and conclusions were read.
- §11.3 Check 3 (ratios unbounded without the C² hypothesis) is asserted without an example in D; I did not construct one.
- Lean elaboration: not available in this lane; there is no Lean file.
- Ownership against the open pull requests was checked through `roadmaps show` and the overlap and citation leads at the index of 2026-11-15T19:10:32Z, not from sibling checkouts.

## Source issues

- **Error** in BowenRuelle1975 at the proof of Theorem 5.1, printed page 192: the source says the ball of radius 2ε about x contains the ε-ball about z once the two ε-balls meet; it should be radius 3ε, by the triangle inequality; affects the proof.
- **Gap** in ClimenhagaPesin2016 at the derivation of Theorem 11.1, page 40 of arXiv v1: the source says γ₀ need only satisfy λ(1 + γ₀) < μ; it should also satisfy γ₀ < μ − 1, without which no δ₀ meets its own condition; affects the proof.
- **Misprint** in ClimenhagaPesin2016 at Theorem 11.1, page 40 of arXiv v1: the source says the maps f_n are given for n ≤ 0 and then indexes the family of graphs by all integers n; it should use one index set; affects nothing.

(These three were found in earlier rounds and are carried here for the register; this round found no further one.)

## For the human reviewers

- ClassicalErgodicTheory, supplier of what Layers 1–5 import, is an open pull request by another author adding a new folder; it is not in `merge-order/ORDER.txt`, so the dependency check does not see that edge.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1506c37d884f60b3749c5710fa8eebca4f353183", "job": "REV-DESIGN-HyperbolicDynamicsAndThermodynamicFormalism~12", "model": "fable", "worker": "chris-x26"} -->
