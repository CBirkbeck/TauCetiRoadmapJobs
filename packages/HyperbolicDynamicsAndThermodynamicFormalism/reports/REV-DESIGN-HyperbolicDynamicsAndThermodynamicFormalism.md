<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/6936#issuecomment-6675109652 -->
Review (claude) of 3c26d7e

Verdict: needs_changes

1. **F01** (P2) Two Gibbs measures need not be equivalent without expansivity

   - Location: `design/README.md` line 600, §5.1 API: "Two Gibbs measures for the same φ and scale are mutually absolutely continuous with bounded densities; if one is ergodic they are equal". Same claim in `design/plan.json` target 5.1, api `gibbs_equivalent`.
   - Claim: for a homeomorphism T of a compact metric space with P_T(φ) finite, any two measures with the Gibbs property for φ at one scale ε are equivalent.
   - Witness: T = identity of [0, 1], φ = 0, ε = 1. Then P_T(0) = 0, B_n(x, 1) = [0, 1] for every n, so every μ ∈ M(T) satisfies the Gibbs inequality with K = 1; δ₀ and δ₁ are both Gibbs and mutually singular. (At ε = 1/10, Lebesgue measure and the uniform measure on {k/20} are both Gibbs with K = 20 and are mutually singular.)
   - Repair: add the hypothesis of API bullet 2 to bullet 3: "If T is expansive and ε is below an expansivity constant, two Gibbs measures for φ at scale ε are mutually absolutely continuous with bounded densities; if one is ergodic they are equal." With that hypothesis the claim holds: invariance and uniform expansivity (BowenPeriodicPoints1971 line 98, Lemma 2.4) give the Gibbs bounds at every smaller scale with other constants, and a 5r-covering argument in the two-sided dynamical metrics, whose balls shrink to points by expansivity, gives μ(A) ≤ K K' ν(A) on closed sets, then on Borel sets by regularity. Tested on the refuting instance: the identity of [0, 1] is not expansive, so it is excluded.

2. **F02** (P2) Uniqueness of the shadowing point needs β small

   - Location: `design/README.md` line 670, §6.2: "for every β > 0 there is α > 0 such that every α-pseudo-orbit … is β-shadowed by exactly one point y". Same in `design/plan.json` target 6.2 ("shadowing of pseudo-orbits by unique points").
   - Claim: existence and uniqueness of the shadowing point for every β.
   - Witness: the full two-shift with the metric of §1.5 (diameter 1), β = 1 and any α: every point 1-shadows every pseudo-orbit, so the shadowing point is not unique. Uniqueness needs 2β below the expansivity constant δ*.
   - Repair: "for every β > 0 there is α > 0 such that every α-pseudo-orbit is β-shadowed by some point y, and y is unique when 2β ≤ δ*" (or state existence for all β and uniqueness for β < δ*/2). Tested: with β = 1 > δ*/2 on the two-shift the uniqueness clause no longer applies.

3. **F03** (P2) ArithmeticDynamics §2.6 does not state the conditional inequality for arbitrary finite partitions

   - Location: `design/README.md` line 74 (supplier contract: "§2.6: … with the inequality hμ(T, P) ≤ hμ(T, Q) + Hμ(P | Q) for finite partitions") and its uses at line 389 (§3.3, with η and ξ_k unrelated), line 371 (§3.2) and line 430 (§3.6); `design/plan.json` targets 3.2, 3.3, 3.6 list `roadmap:ArithmeticDynamics §2.6` for it.
   - Claim: ArithmeticDynamics §2.6 supplies hμ(T, P) ≤ hμ(T, Q) + Hμ(P | Q) for all finite partitions P, Q.
   - Witness: ArithmeticDynamics (open pull request head, README §2.6 "Ergodic foundations for measure entropy") states the inequality only as a proof step "for a finite truncation Q of P" (a coarsening of P) inside the sentence proving hμ(T) = sup over finite P; no general statement appears in §2.6 or §2.7 (the only occurrence of the inequality in that README).
   - Repair: state the general inequality as a target of this roadmap, as a bullet of §3.2: "for finite partitions P, Q, hμ(T, P) ≤ hμ(T, Q) + Hμ(P | Q), from the chain rule of GeometryOfNumbersAndQuadraticArithmetic §4.2 applied to the n-fold joins: Hμ(Pⁿ) ≤ Hμ(Qⁿ) + Σ_{i<n} Hμ(T^{−i}P | T^{−i}Q) = Hμ(Qⁿ) + n Hμ(P | Q)", and cite ArithmeticDynamics §2.6 only for hμ(T) = sup over finite partitions. Update the *Needs:* lines of §§3.2, 3.3, 3.6 and the prerequisites of plan targets 3.2, 3.3, 3.6 accordingly.

4. **F04** (P2) The empty set is a basic set, and §10.2–10.3 fail on it

   - Location: `design/README.md` line 1049 (§10.1 definition of a basic set) and lines 1067, 1079 (§10.2, §10.3: "exactly one equilibrium state").
   - Claim: every basic set of a C¹ diffeomorphism or flow carries exactly one equilibrium state for each Hölder potential.
   - Witness: Λ = ∅ is compact, f(∅) = ∅, hyperbolic (the conditions quantify over x ∈ Λ), locally maximal with U = ∅, and `AddAction.IsTopologicallyTransitive` holds vacuously on the empty space; M(f|∅) is empty, so there is no equilibrium state. Layers 5 and 6 assume "nonempty compact metric space"; §10.1 does not.
   - Repair: in §10.1 define basic sets as *nonempty* locally maximal hyperbolic sets on which the map or flow is transitive (and add "Λ nonempty" to the hypotheses of plan targets 10.1–10.4, 11.4, 11.5). Tested: ∅ is then excluded and §6.8 applies as the route says.

5. **F05** (P2) Finite entropy of expansive flows is used but not owned

   - Location: `design/README.md` line 1079 (§10.3 derives the coboundary and time-change clauses from §4.9) and line 566 (§4.9 assumes h_top(g) < ∞); line 191 (§1.6 API, time-t maps entropy-expansive, no finiteness clause); line 173 (§1.5 API 3 states finite entropy for expansive homeomorphisms only, "citing BowenEntropyExpansive1972 Theorem 2.4 for the more general entropy-expansive maps" without stating that generality as a target).
   - Claim: §10.3's invariance under F + c + L_gψ and the time-change clause follow from §4.9 for a basic set of a C¹ flow.
   - Witness: §4.9 requires h_top(g|Λ) < ∞. No target states h_top(g) < ∞ for Bowen–Walters expansive flows (or for C¹ flows on compact manifolds); §1.6 gives entropy-expansivity of g^1 but the finiteness theorem for entropy-expansive maps (BowenEntropyExpansive1972 line 192, Theorem 2.4: h(f) = h(f, ε) for an h-expansive constant ε, finite on a compact metric space) is not a target.
   - Repair: add to §1.5 API 3 the statement at its source's generality ("an entropy-expansive map of a compact metric space has finite entropy, equal to its entropy at the expansive scale", BowenEntropyExpansive1972 line 192) and to §1.6 API 3 the consequence "hence h_top(g) = `Dynamics.coverEntropy` (g 1) univ < ∞ for a Bowen–Walters expansive flow on a compact metric space"; then §6.6 supplies finiteness to §4.9 in §10.3. Add the item to plan targets 1.5 and 1.6.

6. **F06** (P3) h_top(T) < ∞ is unused for existence in §4.6, and §4.7 needs it

   - Location: `design/README.md` line 524 (§4.6 hypotheses "h_top(T) < ∞ and μ ↦ hμ(T) upper semicontinuous") and line 536 (§4.7: "consequently every continuous potential has an equilibrium state for f").
   - Claim: §4.6 needs h_top < ∞; §4.7's consequence follows from §4.6.
   - Witness: an upper semicontinuous [0, ∞]-valued function on the nonempty compact set M(T) attains its supremum also when the supremum is ∞, so ES_T(φ) ≠ ∅ without h_top < ∞. Conversely §4.7 invokes §4.6 for a C^∞ map, and no target gives h_top(f) < ∞ for a C¹ map of a compact manifold.
   - Repair: drop "h_top(T) < ∞" from the existence clause of §4.6 (keep it for compactness of ES_T(φ) if that is where it is used), so that §4.7's consequence follows from Newhouse's statement alone; or add "a Lipschitz map of a compact manifold has finite entropy" as a target. Mirror in plan target 4.6's hypotheses.

7. **F07** (P3) Walters locator for the power rule and conjugacy invariance

   - Location: `design/README.md` line 302, §2.3 cites Walters1982 Theorem 9.7 for all six items, including P_{T^k}(S_kφ) = k P_T(φ) and conjugacy invariance.
   - Witness: Walters1982 is uncertified (cited by locator only). Theorem 9.7 is the list of properties of P(T, ·) for a fixed T (P(0) = h, monotonicity, Lipschitz, convexity, coboundaries, constants); the power rule P(T^k, S_kf) = k P(T, f) and the behaviour under conjugacy are stated in the following numbered theorem (9.8) of the same section. To be confirmed against a copy.
   - Repair: cite Walters1982 Theorem 9.8 for the power rule and conjugacy invariance, Theorem 9.7 for the rest.

8. **F08** (P3) Shape: §1.4 has no API list; §1.1 API 5 needs compactness

   - Location: `design/README.md` lines 153–163 (§1.4 is a definition whose three API facts are folded into the prose; `design/plan.json` target 1.4 lists `topEntropy_time`, `topEntropy_reverse`, `topEntropy_separated`); line 113 (§1.1 API 5: Γ_ε(x) "is compact", stated for a homeomorphism of a pseudometric space).
   - Witness: the house shape requires each definition to list its API as bullets; Γ_ε(x) is closed but compact only when X is compact (ClimenhagaThompson2016 line 358 assumes X compact).
   - Repair: add "Its API:" bullets to §1.4 with the three facts of the plan; in §1.1 API 5 write "closed, and compact when X is compact".

9. **F09** (P3) §8.1 cites Tau Ceti Lyapunov–Perron results that do not exist

   - Location: `design/README.md` line 905, §8.1 *Needs:* "TauCeti's Lyapunov–Perron results serve only as a model for the continuous-time case".
   - Witness: at the pinned Tau Ceti, "Perron" occurs only in `TauCeti/LinearAlgebra/Matrix/PerronFrobenius/*` and `TauCeti/NumberTheory/ArithmeticDirichletSeries/Perron/Formula.lean`; `TauCeti/Dynamics/Flow/Lyapunov.lean` is about Lyapunov functions (orbits converging to a finite set), not Lyapunov–Perron.
   - Repair: delete the clause.

10. **F10** (P3) Supplier contract list omits declarations the layers cite

   - Location: `design/README.md` lines 38–52 (From Mathlib) versus line 464 (`MeasureTheory.Measure.exists_regular_eq_of_compactSpace`, §4.2), line 825 (`Continuous.inner_bundle`, §7.3), line 917 (`extChartAt`, §8.2), line 905 (`ContractingWith`, `fderiv`, §8.1).
   - Witness: all four exist at the pin: `Mathlib/MeasureTheory/Integral/RieszMarkovKakutani/Real.lean:451` (hypotheses `[T2Space X] [BorelSpace X] [LocallyCompactSpace X] [CompactSpace X]`, finite μ, gives a regular ν with the same integrals of bounded continuous functions), `Mathlib/Topology/VectorBundle/Riemannian.lean:128`, `Mathlib/Geometry/Manifold/IsManifold/ExtChartAt.lean:437`, `Mathlib/Topology/MetricSpace/Contracting.lean:42`; none is in the contract list.
   - Repair: add them to "From Mathlib" with their files.

11. **F11** (P3) Declared gaps: slugs absent from the README; connection-map contract without hypotheses

   - Location: `design/README.md` lines 88–93 ("Required extensions") versus `design/plan.json` gaps `sphere-bundle-embedding` and `connection-map-jacobi-derivative`.
   - Witness: the intake reads the same slug in plan.json and in the README; the README states the two contracts without their slugs. The second `needs` sentence lists the connection map, the splitting of T(TM) and the Jacobi-derivative identity without the hypotheses the theorem needs (smooth Riemannian manifold with its Levi-Civita connection, J the Jacobi field along the geodesic of v with the given initial data, t in the geodesic's domain). Neither contract asks for something already provided: at the pin no connection map or horizontal–vertical splitting exists in Mathlib or Tau Ceti (the only "Connection" file is `TauCeti/Geometry/Manifold/Riemannian/SL2Tilde/Connection.lean`, specific to SL₂~), and TangentialBordism §2.3 (open head, B1.5) supplies sphere bundles as manifolds with a topological comparison to the literal subset, not a smooth embedding.
   - Repair: label the two items "gap:sphere-bundle-embedding" and "gap:connection-map-jacobi-derivative" in the README, and add the hypotheses to the second `needs` in both files.

12. **F12** (P3) Separated-set convention for flows

   - Location: `design/README.md` line 23 (Conventions: separated = Mathlib dynamical net, i.e. pairwise disjoint dynamical balls, for maps) versus lines 155 and 321 (§1.4, §2.4: "(T, ε)-separated sets for d_T" for flows, undefined).
   - Witness: `Mathlib/Dynamics/TopologicalEntropy/NetEntropy.lean:69`: `IsDynNetIn` asks the balls `(dynEntourage T U n).inv.ball x` to be pairwise disjoint, which for U = {d < ε} is d_n ≥ 2ε-type separation, not d_n > ε; the two notions differ by a factor two in scale (harmless in the limit, but a Check at a fixed scale, such as §2.1 Check 3 "at the cylinder scale", reads differently under each).
   - Repair: add to the Conventions one sentence fixing the flow notion ("E is (T, ε)-separated when the open d_T-balls of radius ε about its points are pairwise disjoint", or the classical d_T(x, y) > ε, with the remark that the limits agree).

13. **F13** (P3) §1.4's rescaling law at t = 0 on the empty space

   - Location: `design/README.md` line 155: "on a compact Hausdorff space `Dynamics.coverEntropy` (g t) Set.univ = |t| h_top(g) for every real t, with the convention 0 · ∞ = 0".
   - Witness: on the empty space h_top(g) = ⊥ (`Mathlib/Dynamics/TopologicalEntropy/CoverEntropy.lean:488`, `coverEntropy_empty`), and the left side at t = 0 is ⊥ while |0| · ⊥ = 0 in EReal; §1.3 Check 2 already records the same phenomenon and assumes k ≥ 1.
   - Repair: add "nonempty" (as §1.3 does), or restrict t = 0 to nonempty spaces.

Files reviewed: `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/README.md` (1210 lines, 11 layers, 65 targets), `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`, `packages/HyperbolicDynamicsAndThermodynamicFormalism/sources.toml`. No previous review. The design is sound in its architecture: the route through Bowen's criterion (Climenhaga–Thompson) is general, nothing re-plans an existing roadmap, every supplier is earlier in the merge order or on main, and the gate is clean. The five blocking findings are local: one false API bullet, one missing smallness hypothesis, one supplier citation for a statement the supplier only makes in a special case, one missing nonemptiness hypothesis, and one finiteness step no layer owns. All have one-line repairs.

## Verified sound

**Principles.** No route-specific shortcut: the summit is reached through §§5–6 for every compact metric system with the abstract axioms, and the examples of Layer 9 are consumers of the general theorems. No re-planning: measure entropy, Birkhoff, conditional entropy, SMB and the ergodic decomposition are imported by name (checked against the open heads, below); the duplication audit found no owner of hyperbolic sets, pressure, equilibrium states, specification, expansivity, invariant manifolds or SRB measures anywhere (`roadmaps grep` on main and the 459 open heads: "hyperbolic set" only in VStackSheavesAndLisseCategories in another sense; "Anosov" only as examples in GeometricTopology (open head) and TaubesGromov main line 438; "equilibrium state" and "variational principle" only in OperatorAlgebraDynamics D8–D9, quantum; "measure of maximal entropy" only in ArithmeticDynamics §§2.67–2.92 for rational maps; no match for "topological pressure", "specification property", "expansive homeomorphism|expansive flow", "Hadamard–Perron|stable manifold theorem", "SRB measure", "Gibbs property", "Bowen ball"). At the pins: Mathlib has no power rule for entropy (only `IsDynCoverOf.iterate_le_pow`, `CoverEntropy.lean:116`), no mixing, expansivity, specification, pressure or Gibbs notion in `Mathlib/Dynamics` or `Mathlib/Topology`; Tau Ceti has no Anosov, hyperbolic-set, pressure or measure-entropy declaration (`TauCeti/Dynamics/Flow/Stable.lean` defines stable sets of points of a flow only). No copied passages, no algorithms, no LaTeX delimiters, no pull-request numbers, hand-off notes or machine paths in the README (grep for dollar signs, LaTeX parentheses, `PR #`, `#NNN`, `handoff`, `checkpoint`, `TODO`, `so far`, `removed`, `round N`, paths: none). The commit pins at README lines 36 and 56 follow the practice of 63 READMEs on main that cite commit hashes.

**Dependency gate** (run as instructed):

    candidate: HyperbolicDynamicsAndThermodynamicFormalism is not in the merge order yet; checked as if placed after ArithmeticDynamics (the intake inserts it when its design is accepted)
    depcheck: 242 roadmaps, 2368 edges, 0 problem(s)

No UPWARD or CYCLE line. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.

**Suppliers resolved (every citation, at main or the open head).** GeometryOfNumbersAndQuadraticArithmetic §4.2 (open head, README line 1538–1542, "Entropy and Haar measure on leaves"): `finitePartitionEntropy`, `countablePartitionEntropy`, `conditionalPartitionEntropy`, `iteratedPartitionLabel`, `partitionEntropyRate` (= inf over n ≥ 1 of H(join_n a)/n, as §3.2 of this design uses), `measureEntropy` (sup over finite-entropy labels into ℕ, value in [0, ∞], natural logarithms), chain rule, conjugacy invariance and `entropy_inverse`: all present. ProbabilisticAndMetricNumberTheory §4.1 (open head, lines 4504–4556): `birkhoff_pointwise` (limit = conditional expectation on `MeasurableSpace.invariants T`) and `birkhoff_pointwise_ergodic`: present. ArithmeticDynamics §2.6 (open head, lines 2479–2522): hμ(T) = sup over finite partitions ✓ (the conditional inequality only for truncations: R03); §2.7 (lines 2524–2647): conditional entropy against a sub-σ-algebra with chain rule, SMB, EReal image of hμ(T) ≤ `Dynamics.coverEntropy T Set.univ` on nonempty compact metric spaces, finite Borel partitions of small diameter with μ-null boundaries, ergodic decomposition kernel on nonempty standard Borel spaces with hμ(T) = ∫⁻ h_{μ_x}(T) dμ: all present as cited. DifferentialGeometry (main) Layer 3.3: `toFlow : Flow ℝ M` and compact-manifold completeness (README line 388–390); Layer 12.1: `nonempty_contMDiffRiemannianMetric` (line 915). RiemannianGeometry (main) R2 (lines 300–345): Jacobi fields, existence and uniqueness for initial data, variations through geodesics, constant-curvature solutions in a parallel frame; R4 item 1 (lines 609–617): the Rauch bound |J(t)| ≥ s_κ(t)|D_tJ(0)| for K ≤ κ and the Riccati tools; R4 item 4 (line 676): Cartan–Hadamard; the unit tangent sphere bundle and cut-time continuity at lines 693–695. TangentialBordism §2.3 (open head, lines 406–435, B1.5): sphere bundles as smooth manifolds compared with the literal subsets. Merge-order lines: TangentialBordism 10, GeometryOfNumbersAndQuadraticArithmetic 68, ProbabilisticAndMetricNumberTheory 260, ArithmeticDynamics 322; the candidate is placed after 322. Consumers: TaubesGromov §TG11.2 (main line 430–439) names the Anosov test matrix; ArithmeticDynamics §§2.67, 2.85, 2.90, 2.92 exist; OperatorAlgebraDynamics D9 (main line 627) is the quantum pressure. No RiemannianGeometry Part II exists (`roadmaps list`), so the second gap is a contract on a proposed extension, as declared.

**Library declarations opened at the pins** (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, the pins of `lake-manifest.json`). Mathlib: `Dynamics.dynEntourage` (`DynamicalEntourage.lean:52`, `∀ k < n`), `mem_dynEntourage` (:59), `mem_ball_dynEntourage` (:62); `IsDynCoverOf`, `coverMincard` (`CoverEntropy.lean:212`), `coverEntropyEntourage` (:338), `coverEntropy` (:434, `⨆ U ∈ 𝓤 X`, limsup form), `coverEntropyInf` (:441), `coverEntropyInf_eq_coverEntropy` (:502), `coverEntropy_empty = ⊥` (:488); `IsDynNetIn` (`NetEntropy.lean:69`), `netMaxcard` (:103), `netEntropyEntourage` (:254, `expGrowthSup` of `netMaxcard`), `coverEntropy_eq_iSup_netEntropyEntourage` (:348); `coverEntropy_restrict` (`Semiconj.lean:190`), `coverEntropy_image_le_of_uniformContinuous` (:195); `ExpGrowth.expGrowthSup` (`ExpGrowth.lean:41`); `Flow` (`Flow.lean:85`, `map_add'` in the order ϕ (t₁+t₂) x = ϕ t₁ (ϕ t₂ x)), `IsInvariant` (:48), `Flow.fromIter` (:143), `Flow.restrict` (:178), `Flow.toAddAction` (:196, a def), `Flow.toHomeomorph` (:301), `Flow.reverse` (:335); `birkhoffSum` (`BirkhoffSum/Basic.lean:31`); `AddAction.IsTopologicallyTransitive` (`Transitive.lean:31`, the identity element allowed, as the README says); `Ergodic.iff_mem_extremePoints` (`Extreme.lean:111`, `[IsProbabilityMeasure μ]`), `Ergodic.of_mem_extremePoints_measure_univ_eq` (:33); `ErgodicVAdd` (`Action/Basic.lean:31`, instance-implicit `[VAdd G α]`); `MeasureTheory.exists_measurePreserving_probabilityMeasure` (`EmpiricalMeasure.lean:108`, `[BorelSpace X] [T2Space X] [CompactSpace X] [Nonempty X]`, continuous f, regular invariant probability measure: matches §3.1); `empiricalMeasure` (:58); `ProbabilityMeasure.tendsto_measure_of_null_frontier_of_tendsto` (`Portmanteau.lean:351`); compact-space instance for `ProbabilityMeasure` (`Prokhorov.lean:176`); `UpperSemicontinuous` (`Semicontinuity/Defs.lean:317`); `HolderWith` (`Holder.lean:51`); `Bundle.ContinuousRiemannianMetric` (`Topology/VectorBundle/Riemannian.lean:468`, fields inner/symm/pos/isVonNBounded/continuous), `Bundle.RiemannianBundle` (:420), `IsContinuousRiemannianBundle` (:60), `Continuous.inner_bundle` (:128); `Bundle.ContMDiffRiemannianMetric` (`Geometry/Manifold/VectorBundle/Riemannian.lean:245`), `IsContMDiffRiemannianBundle` (:68); `IsRiemannianManifold` (`Riemannian/Basic.lean:80`); `Diffeomorph` (`LocalDiffeomorph.lean`, notation `M ≃ₘ^n⟮I, J⟯ N`), `extChartAt` (`ExtChartAt.lean:437`); `MeasureTheory.lintegral_image_eq_lintegral_abs_det_fderiv_mul` (`Jacobian.lean:1184`); `Measure.exists_regular_eq_of_compactSpace` (`RieszMarkovKakutani/Real.lean:451`); `ContractingWith` (`Contracting.lean:42`); `AddAction.IsMinimal` (`Minimal.lean:33`); `Subshift` (`SymbolicDynamics/Basic.lean:233`). Tau Ceti: `TauCeti.riemannianVolume` and `riemannianVolume_restrict_source` (`VolumeDensity/Volume.lean:65–87`), `chartRiemannianVolume` (`VolumeDensity/Measure.lean:113`), `chartRiemannianVolume_pos` (:256, `[IsContinuousRiemannianBundle …]`, positive on the chart source); `TauCeti.Manifold.contMDiffOn_maximalIntegralCurve_geodesicSpray` (`Geodesic/Flow.lean:106`, smooth on the open domain), `isGeodesicallyCompleteAt_of_compactSpace` (`Geodesic/Compact.lean:75`), `IsGeodesicCurveOn.norm_curveVelocityWithin_eq` (`Geodesic/ConstantSpeed.lean:109`); `TauCeti.SmoothMappingTorus` (`Instances/MappingTorus.lean:245`), `.mk` (:260), `.flow` (:395), `.flow_one_mk` (:431), `.contMDiff_uncurry_flow` (:493); `AddCircle.instIsManifold` (`Instances/AddCircle.lean:258`); `TauCeti.catMap` (`Dynamics/CatMap.lean:43`), `det_catMap` (:56), `charpolyRev_catMap` (:61, `1 - 3 * X + X ^ 2`). All 45 Mathlib names and all 14 Tau Ceti names in the README exist at the pins with the hypotheses the README attributes to them. Mathlib has no measure-theoretic entropy at the pin (grep for `measureEntropy`, Kolmogorov–Sinai: none), which the package stage must record: every headline mentioning hμ (variational principles, equilibrium states, Bowen, Bowen–Ruelle, SRB) is not statable at the pins until GeometryOfNumbersAndQuadraticArithmetic §4.2 merges; pressure, hyperbolic sets, Anosov systems, the Hadamard–Perron theorem (§8.1), local stable manifolds (§8.2), the Anosov property of toral automorphisms (§9.1), suspensions (§9.2) and geodesic flows (§9.3, modulo the two gaps) are statable with definitions of real body on native carriers.

**Sources: the seeded sample, verified at the locators** (`<id> line N`; uncertified texts listed under Not verifiable).

| Target | Locator checked | Result |
|---|---|---|
| 2.3 | BowenRuelle1975 line 174 (P(f, 0) = h(f)) | ✓; Walters 9.7 uncertified (R07) |
| 3.2 | Walters 8.1 | uncertified; the affinity and the Jensen inequality recomputed below |
| 3.5 | ClimenhagaThompson2016 lines 504–535 (Theorem 3.2 for ergodic μ with diam A ≤ ε; Prop 3.3 Γ_ε(x) = Γ_ε(x; f_t, d_t); Prop 3.4) and BowenEntropyExpansive1972 lines 117–133 (Example 1.6: Γ_ε(x) ⊆ φ_{[−s,s]}x makes each φ_t h-expansive) | ✓; the README's reduction of general μ to ergodic components through the ergodic decomposition and §3.2 is needed exactly because Theorem 3.2 is for ergodic μ, as the README says |
| 4.2 | Misiurewicz1976 lines 48–73 (X nonempty compact Hausdorff, regular Borel probability measures, the uniformity of all diagonal neighbourhoods), 95–102 (definitions (1)–(3)), 119–121 (statement), 125 (Part I), 221–240 (Part II: separated sets realising P_{n,δ} up to 1, atomic measures weighted by exp f_n); BowenRuelle1975 lines 176–178 | ✓ |
| 4.4 | BowenRuelle1975 lines 180–181; BCS2022 lines 54–55 (Definition 1.1) | ✓ |
| 4.7 | BCS2022 lines 59–60; Buzzi2014 lines 25–29 (Newhouse: C^∞ gives maximal measures; sharp for every r < ∞) and 114–116 (Corollary 1) | ✓; Newhouse1989 uncertified |
| 5.1 | BowenRuelle1975 lines 213–222 (Prop 3.1, (d) the lower bound C_ε exp(−cT + ∫₀ᵀ φ)) and 272–277 (Theorem 3.3: Hölder φ on a basic set, unique, ergodic, positive on open sets, lower bound); ClimenhagaThompson2016 lines 1251–1253 (Lemma 4.16) and 1963–1965 (Prop 6.17 upper bound with Φ_γ) | ✓ |
| 5.3 | ClimenhagaThompson2016 lines 140–147 (Theorem A), 1243–1244 (Prop 4.15 existence), 1489 (Prop 4.19 ergodicity), 411–420 (Theorem 2.9: ε > 40δ, tail specification) | ✓ |
| 6.3 | BowenPeriodicPoints1971 lines 105–168 (2.6 C-dense, 2.7 decomposition with permutation, 2.8, 2.9 specifications, 2.10 periodic shadowing for M(ε)-delayed specifications), 421–426 (Remark 4.4: transitive iff the permutation is a cycle; h(f) > 0 unless X finite) | ✓ |
| 6.8 | BowenPeriodicPoints1971 lines 749–750 (8.1: Axiom A* transitive gives h_{μ_f}(f) = h(f)), 421–426 | ✓ |
| 7.4 | KatokHasselblatt1995 §6.4, FH2019 Part II | uncertified; the characterisation recomputed below |
| 8.3 | BowenRuelle1975 lines 96–108 (W^s_x with convergence, W^{cs}, d_T, B_x(ε, T) closed, W^s_x(ε)), 643–652 (A.1 charts straightening W^{cs}, W^{cu}) | ✓ |
| 8.4 | BowenPeriodicPoints1971 lines 66–83 ((A1)–(A3) attributed to Smale and Hirsch–Pugh at line 73) | ✓; KH 6.4/18.4 uncertified |
| 8.5 | BowenRuelle1975 lines 25–34, 96–108 | ✓ |
| 8.7 | BowenRuelle1975 line 362 ("x ↦ E^u_x is Hölder, 3.1 of [19]") with [19] = Pugh, Ergodicity of Anosov actions (line 838) | ✓; KH 19.1 uncertified |

Further locators opened while reading: BowenRuelle1975 lines 10–24 (hyperbolic set, adapted metric with c = 1 for t > t₀), 160–173 (pressure with k ∈ [0, n]), 182–201 (flow pressure, P(F, φ) = P(f¹, Φ), M(F) ⊆ M(f¹), equilibrium state for flows), 204–235 (Abramov used at 225), 324–325 (Remark 3.4), 346–363 (λ_t, φ^{(u)}, the integral identity, Lemma 4.1), 364–376 (volume lemmas), 377–407 (Prop 4.4), 409–413 (Remark 4.5), 421–425 (Theorem 5.1), 470–472 (Remark 5.2), 587–592 (Theorem 5.6), 616–619 (Corollary 5.7), 681–701 (Lemma A.2); ClimenhagaThompson2016 lines 174–178, 295–303, 333–342, 356–381, 448–463, 586–590, 1661–1690, 1717–1724, 1727–1734, 1908–1910, 1944–1965; BowenPeriodicPoints1971 lines 94–104, 615–618, 664–667; BowenGroupEndomorphisms1971 lines 110–123, 313–337, 485–495; BowenEntropyExpansive1972 lines 134–135, 192–193, 297–299; Smale1967 lines 381–473; ClimenhagaPesin2016 lines 281–283, 1822–1843; TsujiiZhang2023 lines 106–127, 485–495; BCS2022 lines 43–51, 61–64, 195–213. Every one supports the statement at its citation. Manifest: all 16 cited works recorded with status; no local path.

**Adversarial table** (sampled targets, headline theorems, targets touched by a finding, and the convention witnesses).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conv. §1.1 Bowen ball, doubling map | ε = 1/8, n = 1, 2 | half-width 2^{−n−2}: 1/8, 1/16; the k ≤ n convention gives 1/16 at n = 1 | ✓ | — |
| §1.1 API 5 Γ_ε(x) | identity of ℝ (noncompact) | Γ_ε(x) = closed ε-ball, closed, not compact | compactness needs X compact | R08 |
| §1.3 power rule, empty space | k = 0, X = ∅ | lhs ⊥, rhs 0·⊥ = 0 | ✓ (k ≥ 1 assumed) | — |
| §1.4 rescaling | t = 0, X = ∅ | lhs ⊥, rhs 0·⊥ = 0 | fails on ∅ | R13 |
| §1.4 rescaling | suspension of the 2-shift, t = 2; g'(t) = g(2t) | 2 log 2; 2 log 2 | ✓ | — |
| §1.5 expansivity of T^k | k ≠ 0, compact X | constant c' from uniform continuity of T^r, r < |k| | ✓ ("smaller constant") | — |
| §1.6 API 3 | time-one map of an expansive flow | Γ_ε(x; g¹, d_1) = Γ_ε(x; g) ⊆ g^{[−η,η]}x, entropy-expansive; finiteness of h_top(g) not concluded | missing step | R05 |
| §1.7 flow mixing ⇔ time-t mixing | U' = {x : g^{[−ρ,ρ]}x ⊆ U}, ρ-net r_i of [0, t] | g^{r_i}U' ⊆ g^rU for |r − r_i| ≤ ρ | ✓ | — |
| §1.8 swap, strong specification | (a,1),(a,1) vs (a,1),(b,1) | 1 + τ even vs odd | ✓ no strong spec. | — |
| §1.8 full shift, strong spec. | scale 2^{−m} | windows [N_{j−1}+τ_{j−1}−m, N_j−1+m] disjoint for τ ≥ 2m; README τ = 2m+1 | ✓ | — |
| §1.9 non-Bowen potential | x = 0^∞, y_n = 1 | S_{n−1}φ(y) − S_{n−1}φ(x) = 1/2 + ⋯ + 1/n (1.929 at n = 10) | ✓ unbounded | — |
| §2.1 pressure on ∅ and on a point | ∅; one point | Z_n = 0 ⇒ ⊥; e^{nφ(pt)} ⇒ φ(pt) | ✓ | — |
| §2.3 power rule Check | 2-shift, φ = x₀, k = 2 | P(φ) = log(1+e) = 1.3133; P_{T²}(S₂φ) = log((1+e)²) = 2.6265 = 2 log(1+e) | ✓ | locator R07 |
| §2.3 bounds | nonempty compact, φ bounded | h + min φ ≤ P ≤ h + max φ; finite iff h finite | ✓ | — |
| §2.4 rescaling Check | g'(t) = g(2t), potential 2F | Z^{g'}_T(2F) = Z^g_{2T}(F) ⇒ 2P_g(F) | ✓ | — |
| §3.2 affinity Check | ½B(½,½) + ½B(⅓,⅔) vs B(5/12, 7/12) | 0.6648 vs 0.6792 | ✓ | — |
| §3.2 Jensen inequality for a partition | inf_n and ∫ | ∫ inf_n ≤ inf_n ∫ gives hμ(T,ξ) ≥ ∫ h_{μ_x}(T,ξ); the sup over ξ does not pass | ✓ (stated for a fixed ξ) | — |
| §3.3 conditional inequality | η, ξ_k unrelated partitions | supplier states it only for a truncation Q of P | drift | R03 |
| §3.4 partition Check | coordinates x₋₁, x₀, x₁ | diameter 2^{−2} = 1/4 < 1/2; rate H(p) | ✓ | — |
| §3.5 reduction to ergodic components | μ ∈ M(g¹), ξ of d_1-diameter < ε | hμ = ∫h_{μ_x} = ∫h_{μ_x}(ξ) ≤ hμ(ξ) ≤ hμ | ✓ | — |
| §3.6 Abramov route | m = ⌈nt/s⌉+1; atoms of ζ^{(s)}_m under g^{jt}, j < n | jt ≤ (m−1)s, diam < ω(ρ); H(ξ|γ) ≤ H₂(μ(E_ω)) + μ(E_ω) log|ξ| | ✓ | — |
| §3.6 Check | roof-2 suspension of B(½,½) | hμ(g²) = log 2, hμ(g¹) = ½ log 2; t = 0 gives 0·∞ = 0 | ✓ | — |
| §4.1/§4.2 regularity | compact Hausdorff non-metrisable | Misiurewicz's 𝔐(X) is the regular measures (line 55) | ✓ matches | — |
| §4.2 Check | k-shift, φ(x₀) | sup attained at weights e^{φ(a)}/Σe^{φ(b)}, value log Σ e^{φ(b)} | ✓ | — |
| §4.4 Check | identity of {a,b}, φ = (1,0); swap | P = 1, ES = {δ_a}; unique invariant measure | ✓ | — |
| §4.5 face property | (δ_a+δ_b)/2 for the identity with φ = (1,0) | free energy ½ < 1 | ✓ not an ES | — |
| §4.6 existence without h_top < ∞ | u.s.c. h on compact M(T), sup = ∞ | attained | hypothesis unused | R06 |
| §4.7 consequence | C^∞ map, h_top(f) < ∞ needed by §4.6 | no target | R06 | R06 |
| §4.8 flow variational principle | μ = ∫₀¹(g^s)_*μ' ds | ∫F dμ = ∫F₁ dμ'; hμ(g¹,ξ_k) ≥ ∫₀¹ h_{(g^s)_*μ'}(g¹,ξ_k) ds; Fatou | ✓ | — |
| §4.8 Check 3 | period-1 orbit, nonconstant F | F₁ constant; point masses are g¹-maximisers not in M(g) | ✓ | — |
| §4.9 item 1 | μ ∈ M(g), t > 0 | FE_{g^t,F_t}(μ) = t·FE_{g,F}(μ), P_{g^t}(F_t) = tP_g(F) | ✓ (needs h_top < ∞ supplied) | R05 |
| §5.1 Gibbs Check 1 | B(½,½), φ = 0, ε = ½ | B_n(x,½) = cylinder [−1, n], measure 2^{−n−2}; product ¼ | ✓ K = 4 | — |
| §5.1 Check 2 | swap, small ε | P = (φ(a)+φ(b))/2; |nP − S_nφ| ≤ |φ(a)−φ(b)|/2 | ✓ | — |
| §5.1 API 3 | identity of [0,1], φ = 0, ε = 1 | every μ Gibbs with K = 1; δ₀ ⊥ δ₁ | false | R01 |
| §5.1 API 3 with expansivity | expansive T, ε < c | lower bound at scale ε' via T^{−N}B_{n+2N}(T^{−N}x, ε) ⊆ B_n(x, ε'), constant K⁻¹e^{−2N(P+‖φ‖)}; 5r-covering in d^{(−j,j)}; ∩_j N_j(A) = A | true after repair | R01 |
| §5.2 hypotheses vs CT Thm 5.6 | expansive, weak spec. at all scales, Bowen at scale ε₀ | choose ε < min(c, ε₀), δ < ε/40: P^⊥_exp(φ,ε) = −∞ | ✓ | — |
| §5.2 Gibbs at small scales | ρ ∈ (4δ, ε/8] | lower (6.13) and upper (6.17 with Φ_γ ≤ S_nφ + K) at one scale; δ → 0 | ✓ | — |
| §5.3 | expansive flow, NE(ε) = ∅ | P^⊥_exp = −∞; Theorem A with G = X × ℝ⁺ | ✓ | — |
| §6.1 Check 1 | 2-shift, d = 2^{−N} | W^s_{½}(x) = agree on i ≥ 0; d(Tⁿx,Tⁿy) = 2^{−n}d(x,y); bracket needs x₀ = z₀, e(δ) ≤ ½ | ✓ | — |
| §6.1 API 1 uniqueness of [x,z] | y, y' in W^s_δ(x) ∩ W^u_δ(z) | y' ∈ Γ_{2δ}(y), 2δ ≤ δ* | ✓ | — |
| §6.2 expansivity | d(fⁿx,fⁿy) ≤ δ* ∀n | fⁿy ∈ W^u_{δ*}(fⁿx), d(x,y) ≤ cλⁿδ* | ✓ | — |
| §6.2 shadowing uniqueness | 2-shift, β = 1 | every point shadows | false for large β | R02 |
| §6.3 weak spec. from pieces | m pieces, f^m C-dense on X₁ | gluing time ≡ i_{j+1} − i_j − n_j mod m, ≤ M(ε)+m | ✓ | — |
| §6.4 Hölder ⇒ Bowen | z = [x,y], scales ε + cδ ≤ δ* | Σ 2C(cδ)^θ λ^{kθ} ≤ 2C(cδ)^θ/(1−λ^θ) | ✓ | — |
| §6.5 Check 2 | periodic orbit | W^s_δ(x) = {x} (d(g^tx, g^{t+u}x) periodic, → 0 only for u ≡ 0) | ✓ | — |
| §6.8 | finite X (swap) | h_top = 0, unique measure | ✓ | — |
| §7.1 Checks | diag(2,½), diag(2,1), identity, λ = 1 | E^s = second axis, C = 1, λ = ½; eigenvalue 1 fails; no nonempty hyperbolic set; isometries would qualify | ✓ | — |
| §7.3 Check 2 | Gram (2 1; 1 1) | eigenvalues 2.618, 0.382; K₁ = 1.618, K₂ = 1.618, K₁K₂ = 2.618 = (3+√5)/2 | ✓ | — |
| §7.4 characterisation | diag(2,½): (1,0), (0,1), (1,1); rotation of ℝ² | 2ⁿ, 2^{−n}, unbounded; all bounded, none decays | ✓ | — |
| §7.5 local constancy | closed bundles, dims summing to dim M | both dims u.s.c. ⇒ locally constant | ✓ | — |
| §7.6 adapted norm | |v|'² = Σ λ'^{−2n}|Dfⁿv|²; flows ∫₀^∞e^{2κ's}|Dg^sv|²ds | |Dfv|' ≤ λ'|v|'; |Dg^tv|' ≤ e^{−κ't}|v|' for all t ≥ 0 | ✓ | — |
| §7.6 Check 3 | Jordan block (½ 1; 0 ½) | Jⁿ entries 2^{−n}, n2^{1−n} (n = 5: 0.03125, 0.3125) | ✓ only λ' > ½ | — |
| §7.7 Check 1 | cat matrix | A⁻¹ = (1 −1; −1 2), same eigenlines | ✓ | — |
| §8.1 vs ClimenhagaPesin Thm 11.1 | μ > max(1,λ), |A_n⁻¹| ≤ μ⁻¹, |B_n| ≤ λ | (i)–(iii) as stated; λ ≥ 1 allowed | ✓ | — |
| §8.3 dominated splitting for W^s | λ = flow rate | needs |X| ≡ 1 normalisation so λ = 1 < μ = e^{κ'} | ✓ (proof detail) | — |
| §8.4 bracket in Λ | y ∈ W^s_ε(x) ∩ W^u_ε(z) | whole orbit in the ε-neighbourhood ⊆ U ⇒ y ∈ Λ | ✓ | — |
| §8.6 (a) | component K, E^u = 0, f^{nk}K = K | K ⊆ ∪ f^{nk}(U_i), diameters → 0 ⇒ K finite, connected ⇒ point | ✓ | — |
| §8.6 (b) | tubes of radius C''εe^{−κT} | vol ≤ C e^{−κT(dim M−1)} → 0 unless dim M = 1 | ✓ | — |
| §8.7 | C¹ only | bundles merely continuous | ✓ hypothesis C² needed | — |
| §9.1 Check 1 | cat matrix | eigenvalues (3±√5)/2 = 2.618, 0.382; E^u slope (√5−1)/2 = 0.618 = λ − 2; h_top = 0.9624 | ✓ | — |
| §9.1 Check 3 | (0 −1; 1 0); n = 1 | A⁴ = I; ±1 have modulus 1 | ✓ | — |
| §9.2 (c) conjugacy | roof r, h = 1/r | (x,s) ↦ (x, s/r(x)) conjugates the special flow to the flow of (1/r)∂_t | ✓ | — |
| §9.3 rate | K ≤ −a², Sasaki norm | stable Riccati U_s ≤ −a ⇒ |J_s(t)| ≤ e^{−at}|J_s(0)|; Sasaki constant C = (1+b²)^{1/2} for K ≥ −b²; K ≡ −1: C = 1 | ✓ ("rate", not C = 1) | — |
| §9.3 Checks | flat torus; round sphere | J = p + tq affine; sin t fields, periodic flow | ✓ | — |
| §10.1 basic set | Λ = ∅ | hyperbolic, locally maximal, transitive vacuously; M(f|∅) = ∅ | §10.2 false on ∅ | R04 |
| §10.2 Check 2 | cat map, φ^u = −log 2.618 | P = 0.9624 − 0.9624 = 0 | ✓ | — |
| §10.3 coboundary clause | via §4.9 | needs h_top(g|Λ) < ∞ | unowned | R05 |
| §10.4 | periodic orbit | entropy 0, time measure | ✓ exception | — |
| §11.1 sign Check | cat suspension | ∫₀ᵀφ^u = −log λ_T; P(φ^u) = 0; opposite sign gives 2h_top | ✓ | — |
| §11.1 metric change | ψ = log of the ratio of volume forms on E^u | t ↦ ψ(g^tx) is C¹ since E^u_{g^tx} = Dg^tE^u_x | ✓ | — |
| §11.3 Check 1 | cat suspension, flat metric | box ε·ε·ε λ_T^{−1}; times λ_T = ε³ | ✓ | — |
| §11.4 Check 3 | periodic orbit, E^u ≠ 0 | P(φ^u) = −(1/p) log λ_p < 0 | ✓ | — |
| §11.5 ergodic theorem route | g¹ and u₁, flow-ergodic μ⁺ | limit flow-invariant ⇒ constant | ✓ (non-ergodic `birkhoff_pointwise` suffices) | — |

**Shape and completeness.** All 11 layers end with `### Examples` and `### Dependencies`; every target has a *Needs:* line and a locator; the 21 definitions (1.1, 1.2, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9, 2.1, 2.4, 3.1, 4.4, 4.8, 5.1, 6.1, 6.5, 7.1, 7.2, 9.1, 10.1, 11.1) each have at least three Checks (195 tests in the plan), and all but §1.4 list their API as bullets (R08). Conventions pin logarithms, EReal values, the sign of the potential (witness P(c) = log k + c), Bowen-ball indexing (witness doubling map), contraction constants (witness diag(2, ½)), the geometric potential's sign (witness curvature −1) and weak versus strong specification. No `lemma` keyword, no `set_option`, no sorry'd data (no Lean file at this stage). Elaboration: not available (this lane does not elaborate; the design has no `Suggested.lean`). Headline theorems for the package stage, from the summary: variational principles (§§4.2–4.3, 4.8), Bowen's criterion (§§5.2–5.3), Hadamard–Perron (§8.1), Anosov examples (§§9.1–9.3), Bowen (§10.2), Bowen–Ruelle (§10.3), Bowen–Margulis (§10.4), SRB (§11.5); of these, only those not mentioning hμ are statable at the pins (see the library paragraph), and the package must name the others in its docstring with the missing carrier (measure entropy).

**Declared gaps.** `gap:sphere-bundle-embedding` (TangentialBordism §2.3, B1.5) and `gap:connection-map-jacobi-derivative` (RiemannianGeometry, proposed Part II) are both named-supplier contracts, needed only by §9.3, declared in `plan.json` with `neededBy`, precise, and minimal (R11 for the slugs in the README and the hypotheses of the second).

## Not verifiable

- Walters1982 (Theorems 8.1, 8.2, 8.3, 8.6, 9.7, 9.10, 9.13; Chapter 7), Bowen1975 (Chapters 1, 3, 4, Theorem 4.1), KatokHasselblatt1995 (§§6.2, 6.4, 18.1, 18.4, 19.1, Chapter 17), FH2019 (Part II), Newhouse1989 (Theorem 1), BowenWalters1972: settled as uncertified in the manifest (paywalled); cited by locator alone. Their statements were checked instead against the certified sources where these overlap (Bowen–Ruelle for pressure, equilibrium states, Abramov, adapted metrics and basic sets; Bowen 1971 for Axiom A*, closing and spectral decomposition; Climenhaga–Thompson for expansivity, specification and the Bowen property; Bowen 1972 for entropy-expansivity; Climenhaga–Pesin for Hadamard–Perron) and by direct computation in the table.
- The sampled targets 3.2 and 7.4 cite only uncertified texts; both were recomputed (table rows §3.2, §7.4).
- Ownership against open pull requests whose files the brief does not give was not checked beyond `roadmaps grep` over the 459 open heads and the three board packages (AnalyticNumberTheory, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory), none of which concerns hyperbolic dynamics.

## Source issues

- **Misprint** in ClimenhagaPesin2016 at Theorem 11.1, arXiv v1 printed page 40 (lines 1822–1840): the source says the maps f_n are given for n ≤ 0 and then asks for a unique family W⁺_n indexed by all integers n ∈ ℤ; it should index the maps and the family by the same set; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3c26d7ebae78746e7a123838a712771006a98e46", "job": "REV-DESIGN-HyperbolicDynamicsAndThermodynamicFormalism", "model": "fable", "worker": "chris-x17"} -->
