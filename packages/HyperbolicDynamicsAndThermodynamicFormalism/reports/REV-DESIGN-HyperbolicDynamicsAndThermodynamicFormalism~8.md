<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13791#issuecomment-6897432976 -->
Review (claude) of b832c29

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P3) §9.1: the manifold structure of the n-torus is Tau Ceti's and is not cited

   **Location:** D:744, "the torus 𝕋^n = (ℝ/ℤ)^n (the product of Tau Ceti's smooth circles, `AddCircle.instIsManifold`)"; D:759 Needs; D:71 supplier bullet; P 9.1 prerequisites.

   **Claim:** the circles' instance gives the smooth structure on which f_A is "an analytic diffeomorphism".

   **Witness:** Mathlib at the pin only charts a finite product (`piChartedSpace`, `Mathlib/Geometry/Manifold/ChartedSpace.lean`:482). The `IsManifold` instance of `∀ i, M i` is `TauCeti.instIsManifoldPi` (`TauCeti/Geometry/Manifold/IsManifold/Pi.lean`:109), with `TauCeti.extChartAt_pi` (:119). Neither is in D.

   **Exact repair:**
   - "From Tau Ceti": add "`TauCeti.instIsManifoldPi`, `TauCeti.extChartAt_pi` (`TauCeti/Geometry/Manifold/IsManifold/Pi.lean`): a finite product of C^n manifolds is a C^n manifold for the product model `ModelWithCorners.pi`, with extended charts the products of those of the factors; with `AddCircle.instIsManifold` this makes `UnitAddTorus (Fin n)` an analytic manifold, the torus of §9.1."
   - D:744: "(`UnitAddTorus (Fin n)` with the product structure `TauCeti.instIsManifoldPi` of Tau Ceti's analytic circles `AddCircle.instIsManifold`)".
   - D:759 Needs: add `TauCeti.instIsManifoldPi`. P 9.1: add `tauceti:TauCeti.instIsManifoldPi`.

   **Tested on the witness:** `UnitAddTorus ι` is `ι → UnitAddCircle`, so the instance applies with every factor `AddCircle 1` and `n = ω`; for `Fin 0` it gives the one-point manifold of the fourth Check.

2. **F02** (P3) §6.3: the gluing-time bound of the route is too small

   **Location:** D:415, "choosing each gluing time, at most M(ε) + m, in the residue class mod m".

   **Claim:** with M(ε) the constant of the second item for f^m on X_1, the gluing times of f are at most M(ε) + m.

   **Witness:** f = σ × (rotation of ℤ/2) on the full two-shift times two points: m = 2, f² = σ² on X_1. At scale 2^{−k} every gluing time of f is at least 2k, while σ² needs only M ≈ k + 2 of its own steps; k + 4 < 2k for k ≥ 5.

   **Exact repair:** "…applying the second item to f^m on the piece X_1, at a scale ε' with d(a, b) < ε' ⟹ d(f^i a, f^i b) < ε for 0 ≤ i < m, with constant M counted in steps of f^m; each gluing time of f is then at most m(M + 2), chosen in the residue class mod m that moves the end of one segment into the piece containing the start of the next." The statement of the third item is unchanged.

   **Tested on the witness:** m(M + 2) = 2(k + 4) ≥ 2k. For the swap, m = 2 and M = 0 give the bound 4 ≥ 1, the gluing time §2.2 uses.

3. **F03** (P3) §5.3, first Check: "gluing times in [0, 1]" contradicts §§2.2 and 6.6

   **Location:** D:349, "is expansive with weak specification (gluing times in [0, 1] absorb the phase)".

   **Witness:** D:243 and D:468 give gluing times in [0, τ₀ + 1]. On the roof-one suspension of the two-shift at scale 2^{−k}, shadowing two arbitrary segments fixes the base coordinates −k, …, n + k − 1 and then n + τ − k, …, so τ ≥ 2k − 1 > 1 for k ≥ 2.

   **Exact repair:** "…with weak specification (gluing times in [0, τ₀ + 1], τ₀ the gluing time of the shift at that scale and the extra unit absorbing the phase, §6.6)". P's test `suspension_nonmixing` needs no change.

   **Tested on the witness:** k = 2 gives τ₀ ≥ 3, inside [0, τ₀ + 1]; the phase 1/2 of the second pair of segments in §6.6's Check is absorbed by the extra unit.

4. **F04** (P3) §§10.2, 10.3: the Needs lines put the theorems behind the example layer

   **Location:** D:839, "*Needs:* … Layers 6.8, 8.4, 9.1, 10.1"; D:851, "*Needs:* … Layers 4.1, 6.6, 6.8, 8.5, 9.2, 10.1". P 10.2 has `target:9.1`, P 10.3 has `target:9.2`.

   **Witness:** neither statement nor route (D:831, D:843) mentions a toral automorphism or a suspension; only the Checks do. §9.2 needs Tau Ceti's mapping torus and DifferentialGeometry Layer 3.3, so the Bowen–Ruelle theorem waits for an unrelated supplier. D:774 already writes "for the entropy Checks".

   **Exact repair:** D:839: "Layers 6.8, 8.4, 10.1; Layer 9.1 for the Checks". D:851: "Layers 4.1, 6.6, 6.8, 8.5, 10.1; Layer 9.2 for the Checks". Remove `target:9.1` from P 10.2 and `target:9.2` from P 10.3. §10.4 keeps 9.1: its statement names hyperbolic toral automorphisms.

   **Tested on the witness:** after the change 10.3's prerequisites are 4.1, 6.6, 6.8, 8.5, 10.1, all earlier, and none reaches Layer 9.

Four findings, all P3; no P1 or P2. Each has a repair to apply, so the verdict asks for changes. The five round-7 findings are repaired. The two declared supplier gaps, `gap:sphere-bundle-embedding` and `gap:connection-map-jacobi-derivative`, are precise, minimal and declared in both files; they are not findings. **D** is `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/README.md`, **P** is `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`. Only this report and `design/review.json` were written. No source was fetched: every cited work is in the manifest. No maintainer notes were supplied.

## Previous findings, checked individually

| Round 7 | Repaired passage and what was recomputed | Status |
|---|---|---|
| F01 (P2), §9.2 finite class | D:763 "for a C^∞ Anosov diffeomorphism φ (`Diffeomorph I I N N ∞`) … is a C^∞ Anosov flow"; (c) "a positive C^r function R on N (r ≥ 1) … ∂_t … is a C^∞ vector field …, so h∂_t is a C^r vector field"; Scope D:15; supplier bullet D:69. Recomputed: c + (R − c)ρ ≥ c > 0; ∫₀¹ ds/h = c + (R − c)·1 = R. `SmoothMappingTorus` (`…/Instances/MappingTorus.lean`:245), `flow` (:395), `flow_one_mk` (:431), `contMDiff_uncurry_flow` (:493). | Repaired |
| F02 (P3), §8.3 first inclusion | D:624 clause (iv); D:650 "It follows from the cone step §8.1(iv) for the time-one maps … for r₀ < τ_Λ this gives v = 0". Recomputed: \|Δy'\| ≤ (λγ + (1 + γ)δ)\|Δx\| ≤ γ(μ − (1 + γ)δ)\|Δx\| iff δ(1 + γ)² ≤ γ(μ − λ). The source's δ₀ has max(1, λ') < μ' (ClimenhagaPesin2016 lines 1850–1852), so μ − (1 + γ)δ > 1 + γ. d(g^{t+v}x, g^t x) → 0 gives g^v z = z at a limit point z. | Repaired |
| F03 (P3), §4.1 Check | D:294 "differs from 2P_g(F) exactly when P_g(F/2) ≠ P_g(F)". F = 1: 2(log 2 + 1/2) = 2.386 against 2(log 2 + 1) = 3.386. | Repaired |
| F04 (P3), §6.6 Check | D:468, the height argument. Strict bounds 1/8 + 1/8 put τ within less than 1/4 of ℤ and of 1/2 + ℤ; the two distances add to 1/2. | Repaired |
| F05 (P3), §10.4 Needs | D:863 "Layers 6.3, 6.6, 8.4, 8.5, 9.1, 10.1, 10.2, 10.3"; D:969 now has 11.1. P 10.4 and 11.6 mirror them, with no duplicate. | Repaired |

Nothing was marked "not actionable in this package"; nothing is re-raised.

Repaired patterns searched in the rest of D:
- a C^r object on a manifold that is not smooth: none (§7.2's suspension of diag(2, 1/2) is linear);
- a route into §8.1(iii) with a rate it cannot have: none (§8.2 uses λ' < 1 < ν = 1 < μ');
- a Check whose stated reason is not the reason: R03;
- a Needs line against its route: R04.

## Verified sound

**Coverage.** D read in full (1004 lines, 11 layers, 45 targets). P parsed: 45 targets with D's ids, every `target:` prerequisite earlier than its consumer, no duplicate, at least three tests each (3 to 7). Pins of P equal the checkouts' heads (Mathlib `1b1ccf4b…`, Tau Ceti `2fd255d9…`). 18 manifest keys, each cited in D, and 18 reference entries. No process word, pull-request number, LaTeX delimiter, machine path, `set_option` or algorithm in D.

**Adversarial table** (sampled targets, headlines, repaired passages and findings).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §4.1 Check (repaired) | F = 1 on the two-shift suspension; F = L_gψ | 2.386 against 3.386; 2h_top both ways | Pass |
| §5.3 | uniform case of Theorem A; identity flow on two points | Γ_ε(x) in an orbit segment, so the obstruction pressure is −∞; no y is δ-close to a and, later, to b | Pass |
| §5.3 Check 1 | scale 2^{−k} | τ ≥ 2k − 1 > 1 | R03 |
| §6.2 expansivity | y, y' with orbits δ*-close | d(y, y') ≤ cλ^n δ* → 0 | Pass |
| §6.2 density of periodic points | isolated point p; monotone shift | f^n p = f⁻¹p gives period n + 1; cylinder {x_{−1} = 0, x_0 = 1} is one nonperiodic point | Pass |
| §6.2 Check 4 | β = 1/4; β = 1 | 2β = 1/2 = δ*, unique; diameter 1, every point shadows | Pass |
| §6.3 statement | swap; two shifts | pieces fixed by f²; permutation not a cycle | Pass |
| §6.3 route bound | σ × rotation of ℤ/2 | needed 2k, claimed k + 4 | R02 |
| §6.5 bracket unique | p, p' in W^s_δ(g^v x) ∩ W^u_δ(z) | d(p, p') ≤ ce^{−κt}·2δ → 0 | Pass |
| §6.5 Checks | periodic orbit of period p; irrational flow | g^u x asymptotic to x iff u ∈ pℤ, so W^s_δ = {x}; strong sets {x}, (F2) fails off the orbit | Pass |
| §6.6 Check 1 (repaired) | τ = 0.1, 0.25, 0.6 | distances (0.1, 0.4), (0.25, 0.25), (0.4, 0.1) | Pass |
| §6.7 | s ↦ s³ conjugate of the rotation | d(x, g^v x) = \|v\|³; bound 2δ max\|φ\| uses \|v\| ≤ δ only | Pass |
| §7.1 | diag(2, 1/2); diag(2, 1); identity | C = 1, λ = 1/2; eigenvalue 1; E^s = E^u = 0 against T_xM ≠ 0 | Pass |
| §7.7 | f² for diag(2, 1/2); time-t map; empty manifold | rate 1/4; \|D(g^t)^n X\| bounded above and below, so X ∉ E^s ⊕ E^u; vacuous | Pass |
| §8.1(iv) (new) | μ = 2, λ = 1, γ = 1/2, δ = 0.08 | expansion 1.88 > 1.5; 0.5 + 0.12 = 0.62 ≤ 0.5·1.88 = 0.94 | Pass |
| §8.2 first inclusion | inverse maps, E^s expanded | λ' ≈ 1/μ < 1 < μ' ≈ 1/λ, ν = 1, C = 2r₀/\|z\| | Pass |
| §8.2 Check 2 | v ∝ (1, √7 − 2) | \|v\|² = 1.4170, \|Bv\|² = 1.3128 + 0.1043 = 1.4171 | Pass |
| §8.3 first inclusion (repaired) | cat suspension, y = g^c x | chart coordinates (c, 0, 0) for all n; g^c fixes no point; τ_Λ = 1 | Pass |
| §8.6(a), (b) | m plaques; chain of m plaques | diameters ≤ 2C'λ'^{pk}r₀ → 0, at most m points; \|w_i\| ≤ 2mr₀; arc of dimension 1 < 2 | Pass |
| §9.1 | cat matrix; shear; n = 0 | (3 ± √5)/2 = 2.618, 0.382, h = 0.9624; eigenvalue 1; empty sum 0 | Pass; citation R01 |
| §9.2(a), (c) (repaired) | R ≡ 1, c = 1/2; R(x₀) = 1, c = 2 | return time 1; denominator 2 − ρ vanishes where ρ = 2 | Pass |
| §10.1 | r' = −sin(2πr)/(2π); U = {\|r\| < 1/2} | multiplier e^{−t}; g^t(U) = U, so the intersection is U | Pass |
| §10.1 Brouwer step | fixed point u | h_{z(u)}(y^{cs}) = y^u; image within Lip(h)(\|k(u)\| + α) + α ≤ r | Pass |
| §10.3 headline | periodic orbit; F + 5 + L_gψ | P = (1/p)∫F; same state, pressure + 5 | Pass given Layers 4–8 |
| §10.2, §10.3 Needs | statement and route | no object of Layer 9 | R04 |
| §11.6 | z, x, y on the attracting circle; deviations | √5 ε = 2.236ε ≤ 3ε; 3δ/4 > δ/2; δ/2 − δ/4 = δ/4 | Pass |
| §11.6 basin step | E ∩ B_Λ(α) null | E ⊆ ∪_n g^{−n}(E ∩ B_Λ(α)), integer n | Pass |
| §11.6 absolutely continuous μ' | bounded u | ∫u dμ' = ∫ lim of averages dμ' = ∫u dμ⁺ | Pass |

**Seeded source sample.** D and P flag no locator as unverified. Read this round, each at the stated lines and supporting the statement:

- 5.3: ClimenhagaThompson2016 lines 140–147, 295–303, 341–342, 1243–1244, 1251–1253, 1489.
- 6.2: BowenPeriodicPoints1971 lines 96–97, 101–104, 171–200, 387–392.
- 6.3: BowenPeriodicPoints1971 lines 105–168, 421–426.
- 6.5: BowenRuelle1975 lines 96–108; BowenPeriodicPoints1971 lines 74–80.
- 6.6: BowenEntropyExpansive1972 lines 134–135.
- 6.7: BowenRuelle1975 lines 681–701.
- 7.1, 9.1: Smale1967 lines 381–473; BowenGroupEndomorphisms1971 lines 313–316, 332–336; BowenPeriodicPoints1971 line 667.
- 8.2: ClimenhagaPesin2016 lines 1822–1843, 1847–1855.
- 9.2: BowenRuelle1975 lines 60–61, 119–133.
- 10.1: BowenRuelle1975 lines 25–34, 94–95, 381–383, 402–406, 441.
- 10.3: BowenRuelle1975 lines 213–222, 272–277; TsujiiZhang2023 lines 106–109, 485–495.
- 11.6: BowenRuelle1975 lines 421–472.

7.7 and 8.6 cite only uncertified texts; their proofs are in D and were recomputed (table).

**Pins** (file and line at the pinned checkouts). Mathlib: `Dynamics.coverEntropyEntourage_finite_of_isCompact_invariant` (`Dynamics/TopologicalEntropy/CoverEntropy.lean`:418); `Flow.fromIter` (`Dynamics/Flow.lean`:143), `Homeomorph.flow` (:154), `Flow.toAddAction` (:196), `Flow.restrictNonneg` (:241), `Flow.reverse` (:335); `AddAction.IsTopologicallyTransitive` (`Dynamics/Transitive.lean`:31); `ErgodicVAdd` (`Dynamics/Ergodic/Action/Basic.lean`:31); `ProbabilityMeasure.tendsto_measure_of_null_frontier_of_tendsto` (`MeasureTheory/Measure/Portmanteau.lean`:351); `DifferentiableOn.dense_compl_image_of_dimH_lt_finrank` (`Topology/MetricSpace/HausdorffDimension.lean`:600); `Continuous.inner_bundle` (`Topology/VectorBundle/Riemannian.lean`:128); `SmoothPartitionOfUnity.exists_isSubordinate` (`Geometry/Manifold/PartitionOfUnity.lean`:366, `[T2Space M] [SigmaCompactSpace M]`); `lintegral_image_eq_lintegral_abs_det_fderiv_mul` (`MeasureTheory/Function/Jacobian.lean`:1184); `Manifold.riemannianEDist` (`Geometry/Manifold/Riemannian/PathELength.lean`:208); `IsManifold.of_le` (`Geometry/Manifold/IsManifold/Basic.lean`:819). Tau Ceti: `nonempty_contMDiffRiemannianMetric` (`Geometry/Manifold/VectorBundle/Riemannian/Existence.lean`:69); `brouwerFixedPoint_closedBall` (`AlgebraicTopology/Singular/BrouwerFixedPoint.lean`:149); `finiteGrassmannian` (`Topology/Grassmannian/Basic.lean`:52), `graphChart` (`…/Graph.lean`:240); `contMDiffOn_maximalIntegralCurve_geodesicSpray` (`…/Geodesic/Flow.lean`:106), `isGeodesicallyCompleteAt_of_compactSpace` (`…/Geodesic/Compact.lean`:75), `IsGeodesicCurveOn.norm_curveVelocityWithin_eq` (`…/Geodesic/ConstantSpeed.lean`:109); `Sol` and `Sol.riemannianMetric` (`…/Riemannian/Sol/Basic.lean`:63, :264); `AddCircle.instIsManifold` (`…/Instances/AddCircle.lean`:258); `catMap`, `det_catMap`, `charpolyRev_catMap` (`Dynamics/CatMap.lean`:43, :56, :61); `sphereBundleChartedSpace`, `isManifold_sphereBundle`, `isSmoothEmbedding_coe_sphereBundle` (`…/Riemannian/Sphere.lean`:143, :161, :181); the four Lyapunov–Perron definitions (`Analysis/ODE/LyapunovPerron/Basic.lean`:529, `Graph.lean`:87, `Local.lean`:154, :393); `riemannianVolume`, `riemannianVolume_restrict_source` (`…/VolumeDensity/Volume.lean`:82, :87), `chartRiemannianVolume`, `chartRiemannianVolume_pos` (`…/Measure.lean`:113, :256). Every name D cites exists; the one used and not cited is R01.

**Duplication audit.** Search of the open heads and main for weak specification, entropy-expansive maps, Anosov systems, hyperbolic sets, SRB, Bowen–Margulis, Hadamard–Perron and local product structure: only ClassicalErgodicTheory, which places uniformly hyperbolic smooth dynamics outside its scope and names a roadmap on it as consumer of its §§8.4–8.6. Its text has "weak specification", "shadowing" and "local product" only in Bowen's specification with periodic shadowing (§8.4), and "entropy-expansive" only in the route of its §5.3.

Supplier citations resolved this round:
- ClassicalErgodicTheory at its open head: the Conventions paragraph "Separated sets and Bowen balls" and §§0.3, 1.4, 3.4, 5.1–5.5, 6.1–6.2, 6.4, 7.1–7.3, 8.1–8.2, 8.4–8.5 exist; the cited names exist there, checked for `IsExpansive`, `IsExpansiveFlow`, `HasBowenProperty`, `HasFlowBowenProperty`, `IsGibbsMeasure`, `HasSpecification`, `HasFlowSpecification`, `existsUnique_isEquilibriumState`, `existsUnique_isFlowEquilibriumState`, `measureEntropy_flow`, `toralEndomorphism`.
- GeometryOfNumbersAndQuadraticArithmetic §4.2, "Entropy and Haar measure on leaves"; ArithmeticDynamics §2.7.
- On main: ProbabilisticAndMetricNumberTheory `birkhoff_pointwise` (`TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md`:4650); DifferentialGeometry `toFlow` (:1287); GeometricCurrents G6 (:668, Grassmann bundle :671–681); GeneralizedCohomology G4.0b (:1082); RiemannianGeometry R2 (:1475), R4 (:2269); TangentialBordism §2.3 (B1.5) (:944).

Overlap facts: no other pull request changes this roadmap; no cited id is dropped. The lead "GeneralizedCohomology §G4.0b is defined only by an open revision" is refuted: main states G4.0b at the line above.

Overlap check: read ClassicalErgodicTheory, MathematicalBilliards, ArithmeticDynamics, OptimalTransport, ProbabilisticAndMetricNumberTheory, RiemannianGeometry; shared: the Bowen balls, toral endomorphisms and specification with periodic shadowing, owner ClassicalErgodicTheory, cited by this roadmap; nothing else shared (the other five name no Anosov system, hyperbolic set, pressure or equilibrium state; RiemannianGeometry has no connection map, which is the declared gap).

**Supplier direction.** The dependency check printed:

    candidate: HyperbolicDynamicsAndThermodynamicFormalism is not in the merge order yet; checked as if placed after ArithmeticDynamics (the intake inserts it when its design is accepted)
    depcheck: 245 roadmaps, 2237 edges, 0 problem(s)

No UPWARD or CYCLE line. No supplier is on the never-cite list.

**Declared gaps.** `gap:sphere-bundle-embedding` (TangentialBordism §2.3) and `gap:connection-map-jacobi-derivative` (RiemannianGeometry, Part II): same slugs in P's `gaps` and at D:131–132, each one statement with its hypotheses, used by §9.3 only. Neither asks for what the pins or RiemannianGeometry already have (no connection map or Sasaki metric there). Contracts, not findings.

**Shape.** Summary, Scope, Conventions, supplier contracts, build paragraph, eleven layers each with Examples and Dependencies, consumers, references. Layers are named by their mathematics. There is no `Suggested.lean` at the design stage, and elaboration is not available (this lane does not elaborate), so the one-tactic probe and the `#check` comparison do not apply. Headlines for the package stage: Bowen's criterion under weak specification (maps, flows); upper semicontinuity of entropy for expansive flows; Hadamard–Perron and local manifolds; local product structure of locally maximal hyperbolic sets; Bowen's theorem; the Bowen–Ruelle theorem; uniqueness of the Bowen–Margulis measure; the SRB theorem.

Source independence: 12 passages compared with 6 sources (BowenRuelle1975, ClimenhagaThompson2016, BowenPeriodicPoints1971, ClimenhagaPesin2016, BowenEntropyExpansive1972, Smale1967), none shared beyond formulas, standard names and hypothesis lists; largest share BowenRuelle1975, 45 of 137 locators; contents compared with BowenRuelle1975 (Introduction, Symbolic Dynamics, Equilibrium States, Attractors, Main Results, Appendix): independent. D has no symbolic-dynamics layer, and Layer 11 interleaves that source's Section 4 and Appendix in the order its Needs lines force (11.3 needs 11.2, 11.4 needs 11.3, 11.5 needs 11.4, 11.6 needs 11.5).

## Not verifiable

- Walters1982, Bowen1975, FH2019, KatokHasselblatt1995, Newhouse1989, BowenWalters1972, HirschPalisPughShub1970: settled as uncertified; cited by locator, not read. The sampled targets 7.7 and 8.6, and parts of 6.2, 6.6, 8.2 and 9.2, cite only these.
- The displayed formulas of BowenRuelle1975 Theorem 3.3, Theorem 5.1 and Lemma A.2 are garbled in the extraction; the prose hypotheses and conclusions were read.
- Lean elaboration: not available in this lane; there is no Lean file.

## Source issues

- **Error** in BowenRuelle1975 at the proof of Theorem 5.1, printed page 192: the source says the ball of radius 2ε about x contains the ε-ball about z once the two ε-balls meet; it should be radius 3ε, by the triangle inequality; affects the proof.
- **Gap** in ClimenhagaPesin2016 at the derivation of Theorem 11.1, page 40 of arXiv v1: the source says γ₀ need only satisfy λ(1 + γ₀) < μ; it should also satisfy γ₀ < μ − 1, without which no δ₀ meets its own condition (μ = 1.1, λ = 0.1, γ = 0.9); affects the proof.

## For the human reviewers

- ClassicalErgodicTheory, supplier of what Layers 1–5 import, is an open pull request by another author adding a new folder; it is not in `merge-order/ORDER.txt`, so the dependency check does not see that edge.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b832c299e87184d9f038d4fb627157022dede164", "job": "REV-DESIGN-HyperbolicDynamicsAndThermodynamicFormalism~8", "model": "fable", "worker": "chris-x82"} -->
