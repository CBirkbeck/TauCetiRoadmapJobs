<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13791#issuecomment-6896292037 -->
Review (claude) of 2c199de

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P2) §9.2(a), (c): the mapping torus of a finitely differentiable diffeomorphism is not a manifold of the Conventions

   **Location:** D:762. "for a C^r Anosov diffeomorphism φ of a nonempty compact manifold N (r ≥ 1), the suspension flow on the smooth mapping torus … is a C^r Anosov flow"; and in (c) "the mapping torus of the C^{r+1} diffeomorphism φ is a C^{r+1} manifold".

   **Claim:** for every r ≥ 1 the suspension is an Anosov flow in the sense of §7.2, so that Layers 8, 10 and 11 apply to it.

   **Witness:** D:29 and D:511 make every manifold smooth. D:620 gives Layer 8 a smooth Riemannian metric from `TauCeti.nonempty_contMDiffRiemannianMetric`, which assumes `[IsManifold IB ∞ B]` (`TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Existence.lean`:69–72). Tau Ceti's mapping torus of a C^n diffeomorphism is a C^n manifold only (`TauCeti/Geometry/Manifold/Instances/MappingTorus.lean`:22–25, and D:69 says so). For a C¹ Anosov diffeomorphism that is not C², the mapping torus is a C¹ manifold: §7.2's definition does not apply to it, and §§8.3, 8.5 and 10.3 have no metric on it.

   **Exact repair:**
   - (a): "for a C^∞ Anosov diffeomorphism φ of a nonempty compact manifold N, the suspension flow on the smooth mapping torus … is a C^∞ Anosov flow …".
   - (c): "for a C^∞ Anosov diffeomorphism φ of a nonempty compact manifold N and a positive C^r function R on N (r ≥ 1) … It is well defined, positive and C^r, being 1/c near the fibre over 0, and ∂_t is a C^∞ vector field on the smooth mapping torus, so h∂_t is a C^r vector field." Delete the C^{r+1} clause.
   - D:69: after "a C^n manifold" add "(a manifold in the sense of the Conventions exactly when φ is C^∞)".
   - Scope, "Not part of this roadmap": add "suspensions of diffeomorphisms of finite differentiability, whose mapping torus is only a C^r manifold; Anosov diffeomorphisms of class C^r are covered directly by Layers 7, 8 and 10".
   - Mirror (a) and (c) in P's 9.2 statement.

   **Tested on the witness:** the cat map is analytic, so `IsManifold (𝓘(ℝ).prod I) ∞` holds for its mapping torus, the metric of D:620 exists, and every Check of §§9.2, 10 and 11 on the cat suspension is unchanged. The C¹-only diffeomorphism is no longer covered by the statement. (b) is on a smooth manifold already and needs no change.

2. **F02** (P3) §8.3: the route does not give W^s_{r/K}(x) ⊆ 𝒲^s_r(x)

   **Location:** D:650. "W^s_{r/K}(x) ⊆ 𝒲^s_r(x) ⊆ W^s_{Kr}(x) for the local strong stable sets W^s_ε(x) of §6.5 (points whose forward orbits stay ε-close and converge)"; route: "Apply the unstable statement of §8.1 … Then flow the strong plaques".

   **Claim:** §8.1 gives the first inclusion, as it does in §8.2. §8.5 takes (F3) from it.

   **Witness:** for the time −1 maps λ = 1, so λ' = 1 + (1 + γ⁻¹)δ > 1, and §8.1(iii) needs |z_L| < Cν^{−L}|z| with ν > λ' > 1. The set W^s_ε(x) gives convergence with no rate. In the linear model (x_s, x_0) ↦ (e^{κ'}x_s, x_0), the point z = (0, c) has z_L = z, bounded and not on the graph. In §8.2 λ' < 1 and ν = 1 works.

   **Exact repair:**
   - Add to §8.1: "(iv) if two points of B^u(r₀) × B^s(r₀) have difference (Δx, Δy) with |Δy| ≤ γ|Δx|, their images under f_n have difference in the same cone, with E^u-component of norm at least (μ − (1 + γ)δ)|Δx|." This is the cone step the section's proof of (iii) already uses.
   - Add to §8.3's route: "For the first inclusion let y ∈ W^s_ε(x), ε small, and let w be the point of the weak stable plaque of x with the same E^s_x ⊕ ℝX(x)-coordinate in the chart at x. The forward orbits of y and w stay in the boxes along the orbit of x and y − w lies in E^u_x, so by §8.1(iv) for the time-one maps y = w = g^v y' with y' ∈ 𝒲^s_r(x) and |v| ≤ r. Then d(g^{t+v}x, g^t x) → 0, so g^v fixes a limit point of the orbit of x; periods of orbits in Λ are bounded below because X has no zero on Λ, so v = 0 for small r."
   - Mirror both in P's 8.1 and 8.3.

   **Tested on the witness:** in the linear model, z = (0, c) differs from the weak plaque point by 0 and v = c ≠ 0 is excluded by the convergence clause. Cone step recomputed: |Δx'| ≥ (μ − δ(1 + γ))|Δx| and |Δy'| ≤ (λγ + δ(1 + γ))|Δx| ≤ γ|Δx'| for small δ, since λ < μ.

3. **F03** (P3) §4.1, first Check: "differs for nonconstant F" is the wrong condition

   **Location:** D:294. "P_{g'}(2F) = 2P_g(F), while using F instead of 2F gives 2P_g(F/2), which differs for nonconstant F."

   **Witness:** constant F = c ≠ 0: 2P_g(c/2) = 2h_top(g) + c and 2P_g(c) = 2h_top(g) + 2c differ. Nonconstant F = L_gψ: P_g(F/2) = P_g(0) = P_g(F) by the fourth item of the same section, so they agree.

   **Exact repair:** "…gives 2P_g(F/2), which differs from 2P_g(F) whenever P_g(F/2) ≠ P_g(F): for F = c ≠ 0 the values are 2h_top(g) + c and 2h_top(g) + 2c." Mirror in P's 4.1 test `rescale_pressure`.

   **Tested on the witness:** F = 1 on the roof-one suspension of the full two-shift: 2 log 2 + 1 against 2 log 2 + 2.

4. **F04** (P3) §6.6, first Check: integer periods are not why strong specification fails

   **Location:** D:468. "its periods are integers, so strong specification with a fixed gluing time fails".

   **Witness:** strong specification (D:231) has no periodic point in it, so periods do not enter. The conclusion is true for another reason, below.

   **Exact repair:** "the height advances at unit speed, so for small δ the segments ([0, a], 0), ([0, b], 1) force the common gluing time τ to be within 2δ of an integer and the segments ([0, a], 1/2), ([0, b], 1) force it to be within 2δ of 1/2 + ℤ; no τ does both, so strong specification fails." Mirror in P's 6.6 test.

   **Tested on the witness:** δ = 1/16: the two conditions are |τ − k| ≤ 1/8 and |τ − 1/2 − k'| ≤ 1/8, which are disjoint.

5. **F05** (P3) §10.4: the Needs line omits the flow inputs of its own route

   **Location:** D:854 and D:862. "Positivity of entropy uses weak specification and expansivity"; "*Needs:* Layers 6.3, 9.1, 10.2, 10.3."

   **Witness:** for flows weak specification is §6.6's and the local product structure is §8.5's; §6.3 is about homeomorphisms only. P's 10.4 has prerequisites 6.3, 9.1, 10.2, 10.3.

   **Exact repair:** "*Needs:* Layers 6.3, 6.6, 8.4, 8.5, 9.1, 10.1, 10.2, 10.3." Add `target:6.6`, `target:8.4`, `target:8.5`, `target:10.1` to P's 10.4. All are earlier than 10.4.

Five findings: one P2 and four P3. The three round-6 findings are repaired. **D** is `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/README.md`, **P** is `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`. Only this report and `design/review.json` were written. No source was fetched: every cited work is in the manifest. No maintainer notes were supplied.

## Previous findings, checked individually

| Round 6 | Repaired passage and what was recomputed | Status |
|---|---|---|
| F01 (P3), §8.3 neutral rate | D:650 "gives X(x) length 1 … the neutral block of Dg^{±1} has norm and conorm 1, and the hypotheses hold with λ = 1 < μ = e^{κ'}"; Check D:659. Block norms: max(e^{−κ'}, 1) = 1 for both applications. Check: crossing time ≤ 0.05·e^{3a} = 0.897 < 1, remaining distance ≤ e^{−3a} = 0.056 < 0.1, neutral norm e^{3a} = 17.9 > e^a = 2.618 > μ. | Repaired |
| F02 (P3), §8.7 exponent | D:720 "L > 1 a common Lipschitz constant of f and f⁻¹ … θ = α log λ⁻¹ / (α log L + log λ⁻¹)"; Check D:725. Cat map: θ = 1/2. α = 1/2, L = λ⁻¹: θ = 1/3 < α. | Repaired |
| F03 (P3), Sol metric | D:70 and D:889. `TauCeti/Geometry/Manifold/Riemannian/Sol/Basic.lean`:63 (`Sol`), :264 (`riemannianMetric`). Pull-back under (au, av, as): a²(ds² + e^{2as}du² + e^{−2as}dv²). | Repaired |

Nothing was marked "not actionable in this package"; nothing is re-raised. Repaired patterns searched in the rest of D: a route into §8.1 with a rate it cannot have (found: R02); exponent formulas (none other); Tau Ceti objects used and not cited (none: all 14 "From Tau Ceti" bullets are used, and no other `TauCeti.` name occurs).

## Verified sound

**Coverage.** D read in full (1003 lines, 11 layers, 45 targets). P parsed: 45 targets with D's ids; every `target:` prerequisite is earlier than its consumer; every target has at least three tests; baseline pins equal `lake-manifest.json` (Mathlib `1b1ccf4b…`, Tau Ceti `2fd255d9…`, both confirmed as the checkouts' heads). 18 manifest keys, each cited in D and conversely. No process words, pull-request numbers, LaTeX delimiters, machine paths, `set_option` or algorithm in D.

**Adversarial table** (sampled targets, headlines, repaired passages, findings, and the sections round 6 passed without values: 1.2, 1.3, 2.1, 4.1, 6.3, 7.1, 7.2, 9.2, 9.3).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §1.2 finiteness and Checks | two-shift at {d ≤ 1/4}; Fix(T^n) | closeness for T^0…T^{n−1} fixes coordinates −1…n: 2^{n+2} cylinders, rate log 2; separating time reduced mod n into [0, n) | Pass |
| §1.3 | identity flow on a finite set; Γ_ε for g^t with d_{abs(t)} | y = g^0 x for ε below the least distance; sup over s ∈ [0, 1] of d(g^{k+s}x, g^{k+s}y), all k ∈ ℤ, is the flow condition | Pass |
| §2.1 T^k mixing ⇒ T mixing; flow from time-t map | residues j < k | T^{kn+j}(U) ∩ V = T^{kn}(T^jU) ∩ V, n ≥ max n_j; offsets s_i with g^s(U) ⊇ g^{s_i}(U') | Pass |
| §3.1 | Γ_ε(x; g^1, d_1); USC | equals flow Γ_ε(x); atoms of ξ^n have boundary in ∪_{k<n} g^{−k}∂ξ, ν-null; infimum of functions continuous at ν | Pass |
| §4.1 items 1–3 | time-one average of aF along g_a; μ ∈ M(g) | ∫₀¹ aF(g^{as}x)ds = F_a(x); free energy t(hμ(g^1) + ∫F dμ) against tP_g(F) | Pass |
| §4.1 first Check | F = c; F = L_gψ | 2h + c vs 2h + 2c; P(F/2) = P(F) | R03 |
| §5.3 | uniform case of Theorem A; identity flow on two points | NE(ε) = ∅ so the obstruction pressure is −∞ < P; not transitive, every measure maximal | Pass |
| §6.3 | swap; residue classes | two pieces fixed by f²; gluing time ≤ M(ε) + m | Pass |
| §6.5 uniqueness of the bracket | p, p' in W^s_δ(g^v x) ∩ W^u_δ(z) | d(p, p') ≤ ce^{−κt}·2δ → 0 for 2δ ≤ δ* | Pass |
| §6.5 closedness of W^s_δ under limits | y_n ∈ W^s_δ(x_n), δ ≤ δ* | (F3) gives d(g^t x, g^t y) ≤ cδe^{−κt} in the limit, so the convergence clause survives | Pass |
| §6.6 expansivity | reparametrised orbit s(t) | w_t = g^{s(t)}w_0, v_t = v_0 + s(t) − t; d(w_0, g^{v_0}x) ≤ ce^{−κτ}δ → 0 and d(w_0, y) → 0, so y = g^{v_0}x | Pass |
| §6.6 first Check | segments at heights 0, 0 and 0 after time 1/2 | τ near ℤ and near 1/2 + ℤ | R04 |
| §6.8 | swap; monotone shift | h = 0, one invariant measure; M(T) a segment of free energy 0 | Pass |
| §7.1, §7.2 | diag(2, 1); constant field on 𝕋² | eigenvalue 1; Dg^t = Id forces dim T_xM = 1 ≠ 2 | Pass |
| §7.3 | metric × 4; Gram (2 1; 1 1) | K₁K₂ = 2·(1/2) = 1; (λ_max/λ_min)^{1/2} = (3 + √5)/2 = 2.618 | Pass |
| §7.7 | f² for diag(2, 1/2); time-t map | rate 1/4; X bounded forward and backward forces X = 0 if g^t were Anosov | Pass |
| §8.3 inclusion | time −1 maps; linear model | λ' > 1, z = (0, c) bounded off the graph | R02 |
| §8.5 | v ≥ 0 and v < 0 | g^v W^s_δ(x) ⊆ W^s_δ(g^v x) for v ≥ 0; for v < 0 the extra times are covered by a Lipschitz bound absorbed in K | Pass |
| §8.6(a) | m plaques | diameters ≤ 2KC'λ'^{pk}r₀ → 0, so at most m points | Pass |
| §8.6(b) | chain of m plaques | shifts ≤ 2(m − 1)r₀, total ≤ r₀ + 2mr₀ ≤ 3mr₀; arc has dimH ≤ 1 < 2 | Pass |
| §8.7 | α = 1, L = λ⁻¹; L → 1⁺; L → ∞ | 1/2; α; 0⁺ | Pass |
| §9.2(a), (c) regularity | φ of class C¹ only | mapping torus C¹, no `IsManifold … ∞` | R01 |
| §9.2(c) return time; Check 6 | h = 1/(c + (R − c)ρ) | ∫₀¹ ds/h = c + (R − c) = R; bump of integral 1 on an interval of length 1/2 exceeds 2 | Pass |
| §9.3 | curvature −a²; K ≤ −a² | (J, J') = e^{at}(E, aE), ratio e^{at}; stable field: norm ≤ (1 + b²)^{1/2}e^{−at} with K ≥ −b² | Pass |
| §10.1 torus Check | r' = −sin(2πr)/(2π) | linear part −r at 0, +x at 1/2; W^s_Λ(ε) = {abs(r) ≤ ε}, area 2ε | Pass |
| §10.2, §10.3 headlines | cat map, φ = −0.9624; periodic orbit | P = 0; P = (1/p)∫F | Pass given Layers 5–8 |
| §10.4 | cat map; periodic orbit | h = 0.9624 > 0; h = 0 | Pass; Needs: R05 |
| §11.1 Checks | Sol-type metric; conformal factor | e^{2a(s−1)}(e^a du)² = e^{2as}du²; φ'^u = −a − 0.2π cos 2πs; one-sided derivatives a ± 2π | Pass |
| §11.2(iii) | q = 1, d = 3 | (b, c) ↦ (be^{−2aT}, ce^{−aT}); 3 + 1 + 1 = 5 | Pass |
| §11.3 | b = 0.1 | (1.01)^{−1/2} = 0.99504 < e^{−0.001} = 0.99900; bound holds iff b² ≤ e^{2θ} − 1 | Pass |
| §11.3(a) real T | n = ⌊T⌋ | remainder ≤ Lip(ψ)·δ | Pass |
| §11.4 | cat suspension box | εe^{−aT}·ε·ε·e^{aT} = ε³ | Pass |
| §11.5(a) | maximal E, δ ≤ 3ε | separation ≥ δ > 2δ/3; cover radius 2δ + ε; Check: (1.95² + 1.01²)^{1/2} = 2.196 > 2.01 | Pass |
| §11.6 | deviation bookkeeping; z, x, y | 3δ/4 > δ/2; δ/2 − δ/4 = δ/4; d(y, x) = √5 ε = 2.236ε ≤ 3ε; limit of integer-time averages is flow invariant | Pass |

**Seeded source sample.** D and P flag no locator as unverified. Read at the cached texts:

- 3.1: ClimenhagaThompson2016 lines 504–509 (Theorem 3.2), 513–530, 533–535; BowenEntropyExpansive1972 lines 117–133.
- 5.3: ClimenhagaThompson2016 lines 140–147, 295–303, 1243–1244, 1251–1253, 1489.
- 6.5, 8.5: BowenRuelle1975 lines 25–34, 96–108.
- 6.6: BowenEntropyExpansive1972 lines 134–135.
- 6.8, 10.4: BowenPeriodicPoints1971 lines 421–426, 667, 749–750; BowenRuelle1975 lines 77–78, 324–325.
- 7.3: BowenRuelle1975 lines 412–413.
- 8.7: BowenRuelle1975 line 362.
- 11.3: BowenRuelle1975 lines 681–701 (A.2, r = 1, y ∈ M), 702–715 (A.3), 718–738 (A.4).
- 11.4: BowenRuelle1975 lines 364–375; the Appendix opens (lines 629–630) with a hyperbolic set of a C^r flow, so D's generality for hyperbolic sets is the source's.
- 11.5: BowenRuelle1975 lines 377–407 (its δ/2 and δ + ε are for the strict convention; D's δ/3 and 2δ + ε recomputed).
- 11.6: BowenRuelle1975 lines 421–472.

Each locator is at the stated lines and supports the statement. 7.7 and 8.6 cite only uncertified texts; their proofs are in D and were recomputed.

**Pins.** Opened this round: `DifferentiableOn.dense_compl_image_of_dimH_lt_finrank` (`Mathlib/Topology/MetricSpace/HausdorffDimension.lean`:600, hypothesis `dimH t < finrank ℝ F`); `TauCeti.nonempty_contMDiffRiemannianMetric` (`…/Riemannian/Existence.lean`:69, `[IsManifold IB ∞ B]`); `TauCeti.brouwerFixedPoint_closedBall` (`TauCeti/AlgebraicTopology/Singular/BrouwerFixedPoint.lean`:149); `TauCeti.SmoothMappingTorus.flow`, `flow_one_mk`, `contMDiff_uncurry_flow` (`…/Instances/MappingTorus.lean`:395, :431, :493); `TauCeti.isSmoothEmbedding_coe_sphereBundle` (`…/Riemannian/Sphere.lean`:181); `TauCeti.Sol`, `TauCeti.Sol.riemannianMetric`. The worker's `roadmaps resolve` lists no name of D as found nowhere.

**Duplication audit.** Search of all open heads and main for Anosov, hyperbolic sets, SRB, Bowen–Margulis, weak specification, Hadamard–Perron and local product structure: only ClassicalErgodicTheory (which places uniformly hyperbolic dynamics outside its scope and names a roadmap on it as consumer of its §§8.4–8.6) and example mentions in GeometricTopology and TaubesGromov. ClassicalErgodicTheory read at its head: Conventions ("Separated sets and Bowen balls"), §§0.3, 1.4, 3.4, 5.1–5.5, 6.1–6.2, 6.4, 7.1–7.3, 8.1–8.2, 8.4–8.5 exist; `IsExpansiveFlow`, `HasFlowSpecification`, `HasFlowBowenProperty` have the quantifiers D:93 states. On main: GeneralizedCohomology G4.0b (`TauCetiRoadmap/GeneralizedCohomology/README.md`:1082), ProbabilisticAndMetricNumberTheory `birkhoff_pointwise` (:4650), RiemannianGeometry R4.1, R4.4, DifferentialGeometry 3.3, GeometricCurrents G6, TangentialBordism §2.3.

Overlap facts: no other pull request changes this roadmap; no cited id is dropped. The lead "GeneralizedCohomology §G4.0b is defined only by an open revision" is refuted: main states G4.0b at the line above.

Overlap check: read ClassicalErgodicTheory, MathematicalBilliards, ArithmeticDynamics, ProbabilisticAndMetricNumberTheory, RiemannianGeometry, OptimalTransport (the scope and ownership section of each); shared: the Bowen balls, owner ClassicalErgodicTheory, cited by this roadmap; nothing else shared (MathematicalBilliards places dispersing billiards and their hyperbolicity outside its scope).

**Supplier direction.** The dependency check printed:

    candidate: HyperbolicDynamicsAndThermodynamicFormalism is not in the merge order yet; checked as if placed after ArithmeticDynamics (the intake inserts it when its design is accepted)
    depcheck: 245 roadmaps, 2233 edges, 0 problem(s)

No UPWARD or CYCLE line. No supplier is on the never-cite list.

**Declared gaps.** `gap:sphere-bundle-embedding` and `gap:connection-map-jacobi-derivative`: same slugs in P and at D:131–132, each one precise statement, used by §9.3 only. Minimality rechecked: the only corestriction at the pin is `Manifold.IsSmoothEmbedding.codRestrict` into an open subset (`TauCeti/Geometry/Manifold/SmoothEmbedding/LocalDiffeomorph.lean`:126), and the regular-level files have none. Contracts, not findings.

**Shape.** Summary, Scope, Conventions, supplier contracts, build paragraph, eleven layers each with Examples and Dependencies, consumers, references. Layers are named by their mathematics. There is no `Suggested.lean` at the design stage; elaboration is not available (this lane does not elaborate), so no one-tactic probe or `#check` comparison applies. Headlines for the package stage: Bowen's criterion under weak specification (maps, flows); upper semicontinuity of entropy for expansive flows; Hadamard–Perron and local manifolds; local product structure of locally maximal hyperbolic sets; Bowen's theorem; the Bowen–Ruelle theorem; uniqueness of the Bowen–Margulis measure; the SRB theorem.

Source independence: 14 passages compared with 4 sources (BowenRuelle1975, ClimenhagaThompson2016, BowenEntropyExpansive1972, BowenPeriodicPoints1971), none shared beyond formulas and hypothesis lists the mathematics forces; largest share BowenRuelle1975, 45 of 136 locators; contents compared with BowenRuelle1975 (Introduction, Symbolic Dynamics, Equilibrium States, Attractors, Main Results, Appendix): independent. D has no symbolic-dynamics layer, and Layer 11 interleaves that source's Section 4 and Appendix in an order its Needs lines force (11.3 needs 11.2, 11.4 needs 11.3, 11.5 needs 11.4, 11.6 needs 11.5).

## Not verifiable

- Walters1982, Bowen1975, FH2019, KatokHasselblatt1995, Newhouse1989, BowenWalters1972, HirschPalisPughShub1970: settled as uncertified; cited by locator, not read. The sampled targets 7.7 and 8.6, and parts of 6.6, 7.3, 8.5 and 8.7, cite only these.
- The displayed formulas of BowenRuelle1975 Theorem 5.1 and Lemma A.2 are garbled in the extraction; the prose hypotheses and conclusions were read.
- Lean elaboration: not available in this lane; there is no Lean file.

## Source issues

- none

## For the human reviewers

- ClassicalErgodicTheory, supplier of what Layers 1–5 import, is an open pull request by another author adding a new folder; it is not in `merge-order/ORDER.txt`, so the dependency check does not see that edge.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2c199dec2383f8ca767ce5d019d29f05afe3c4a9", "job": "REV-DESIGN-HyperbolicDynamicsAndThermodynamicFormalism~7", "model": "fable", "worker": "chris-x30"} -->
