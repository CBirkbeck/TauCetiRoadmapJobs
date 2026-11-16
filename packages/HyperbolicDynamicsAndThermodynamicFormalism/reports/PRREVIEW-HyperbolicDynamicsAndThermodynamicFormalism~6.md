# Review of HyperbolicDynamicsAndThermodynamicFormalism (pull request #2441 at fe970db)

**Verdict:** needs changes

The head is the one the previous review read. The roadmap folder has no finding; both findings concern the board's plan and are carried from the previous report.

## R01 (P2) — Declared gap `sphere-bundle-embedding` asks for what the pins provide

**Location** `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`, line 2442, `gaps`, slug `sphere-bundle-embedding` (supplier TangentialBordism §2.3 (B1.5)): "a C^n map … into the total space with values in the sphere bundle is C^n into the sphere bundle".

**Claim** Not repaired: the entry is still in the board's file, last changed in `62e124d`. The pins prove the statement, README.md:55 and README.md:819 use that route, and the README declares no such gap.

**Witness** Mathlib `ContMDiff.iff_comp_isImmersion` (Geometry/Manifold/Immersion.lean:995): `IsImmersion J J' n φ → (CMDiff n f ↔ Continuous f ∧ CMDiff n (φ ∘ f))`; Tau Ceti `isSmoothEmbedding_coe_sphereBundle` (Geometry/Manifold/VectorBundle/Riemannian/Sphere.lean:181).

**Repair** Delete the `sphere-bundle-embedding` entry from `gaps` in the board's plan and withdraw its announcement on TangentialBordism's job. The roadmap folder needs no change.

Re-raised: R01 of PRREVIEW-HyperbolicDynamicsAndThermodynamicFormalism~4 and ~5 (H01 of the replies to ~1, ~2 and ~3, each marked "applied"). No reason was given for leaving it, and the stated repair is not in the board's file.

## R02 (P2) — Declared gap `connection-map-jacobi-derivative` asks RiemannianGeometry for what §9.3 owns

**Location** `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`, line 2453, `gaps`, slug `connection-map-jacobi-derivative` (supplier RiemannianGeometry, proposed Part II), against README.md:13: "the connection map of TM with the Jacobi-field form of the derivative of the geodesic flow, which no roadmap plans, is §9.3's".

**Claim** Not repaired: the entry is still in the board's file. It asks RiemannianGeometry for K, the isomorphism (Dπ, K) and Dφ^t ξ = (J(t), D_tJ(t)), which README §9.3 states and owns: two owners if the supplier acts on the announcement.

**Witness** README.md:800: K is a smooth bundle map and ξ ↦ (Dπ_v ξ, K_v ξ) an isomorphism onto the pull-back of TM ⊕ TM. README.md:801: Dπ(Dφ^t_v ξ) = J(t), K(Dφ^t_v ξ) = D_tJ(t).

**Repair** Delete the `connection-map-jacobi-derivative` entry from `gaps` in the board's plan and withdraw its announcement on RiemannianGeometry's job. §9.3 stays the owner; the roadmap folder needs no change.

Re-raised: R02 of PRREVIEW-HyperbolicDynamicsAndThermodynamicFormalism~4 and ~5 (H02 of the replies to ~1, ~2 and ~3, each marked "applied"). No reason was given for leaving it, and the stated repair is not in the board's file.

## Previous findings

- R01 — not repaired: board `plan.json` line 2442 still has slug `sphere-bundle-embedding`, supplier TangentialBordism §2.3 (B1.5).
- R02 — not repaired: board `plan.json` line 2453 still has slug `connection-map-jacobi-derivative`, supplier RiemannianGeometry "proposed Part II".

## Verified sound

| Target | Instances tried | Statement side | Computed on the instance | Result |
|---|---|---|---|---|
| §1.3 Bowen–Walters expansive flows | periodic orbit; irrational linear flow on 𝕋²; identity flow of two points | Γ_ε(x) ⊆ g^([−η, η])x; fixed points isolated | ClimenhagaThompson2016 lines 359–362, 380–381. Irrational flow: y = x + (η, 0) stays at distance \|η\|, off every short orbit arc. Two points: δ ≤ d(a, b) forces y = x | holds |
| §3.1 entropy of expansive flows; `upperSemicontinuousOn_measureEntropy_of_isExpansiveFlow` | roof-one suspension of the two-shift; period-1 orbit; empty X | hμ(g¹) = hμ(g¹, ξ) for d₁-diameter < ε; upper semicontinuity on M(g¹) | Trivial partition: rate 0 ≠ log 2. Γ_ε(x; g¹, d₁) = Γ_ε(x) (line 516). Theorem 3.2 (504–509) is for ergodic μ: README decomposes. Empty X: no probabilities | holds |
| §5.3 criterion for flows; `existsUnique_isFlowEquilibriumState_of_hasFlowWeakSpecification` | one-point space; identity flow of two points; periodic orbit | unique state, flow-ergodic, lower Gibbs at every ε | One point: ν(B) = 1, tP − ∫F = 0, product 1. Two points: not transitive, no weak specification, every probability maximal. Theorem A at lines 140–147 | holds |
| §5.2; `existsUnique_isEquilibriumState_of_hasWeakSpecification` | swap of two points; full two-shift at ε = 1/2; scales | unique, ergodic, Gibbs at small scales | Swap: ν(B_n) = 1/2, \|nP − S_nφ\| ≤ \|φ(a) − φ(b)\|/2. Shift: 2^(−(n+2))·2^n = 1/4. r ≤ ε/8, δ < r/5 gives r ∈ (5δ, ε/8] ∩ (4δ, ε/4] | holds |
| §6.7 Bowen property for flows | constant φ; circle flow conjugated by s ↦ s³ | bound 2δ max\|φ\| + two geometric integrals | Each integral ≤ C(cδ)^θ/(κθ). d(x, g^v x) = \|v\|³: no bound of \|v\| by d, and none is used. BowenRuelle1975 Lemma A.2 at lines 681–701 | holds |
| §6.8; both abstract uniqueness theorems | swap; full shift; monotone shift; periodic orbit | unique state under forward transitivity; h_top > 0 unless X finite | Swap: h = 0, X finite. Monotone shift: n + 1 words, h = 0, two point masses maximal, so signed-time transitivity fails. Lean `htrans` uses n : ℕ and t ≥ 0 | holds |
| Transitivity convention (Conventions, §6.6 fifth Check) | roof-one suspension of the monotone shift | signed-time transitivity is strictly weaker | No isolated points, ℝ-transitive, no dense forward orbit (closure misses the earlier switch points). ClassicalErgodicTheory §5.5's stated equivalence fails on it; this roadmap does not consume it | holds here |
| §7.2 hyperbolic sets of flows; `IsFlowHyperbolicSet` | constant field on 𝕋²; Λ = ∅; zero of X | T_xM = E^s ⊕ ℝX ⊕ E^u with rates | Dg^t = id forces E^s = E^u = 0, dimension 1 ≠ 2. Empty set qualifies vacuously, excluded later by nonemptiness. BowenRuelle1975 lines 10–18, line 11 for zeros | holds |
| §7.4 characterisation of the splitting | diag(2, 1/2); rotation; saddle ⊔ sink | E^s = bounded = decaying vectors | (1, 1) grows like 2^n. Rotation: all bounded, none decays. Union: λ = max(1/2, 1/3) = 1/2, dim E^s = 1 and 2 | holds |
| §7.5 continuity of the splitting | saddle ⊔ sink; diag(1 + t, 1/(1 + t)) | closed subbundles, locally constant dimensions | Both dimensions upper semicontinuous, sum dim M (dim M + 1 for the weak bundles). Values 1 and 2 on the union. Rate → 1 as t → 0 | holds |
| §7.6 adapted metrics | Jordan block (1/2 1; 0 1/2), λ' = 3/4 | adapted metric for every λ' > λ | 2^n\|J^n(0, 1)\| = √(4n² + 1) unbounded. Norm of (1/2 1/8; 0 1/2) = (√65 + 1)/16 ≈ 0.566 ≤ 3/4. BowenRuelle1975 lines 19–24 | holds |
| §8.1; `exists_isHadamardPerronFamily`, `IsHadamardPerronFamily` | K = ⊥; Kᗮ = ⊥; cone step; strictness of (ii) | unique family, (i)–(iv), max(1, ρ') < μ' | K = ⊥: \|z\| ≤ ρ'^L\|z_L\| < C(ρ'/ν)^L\|z\| → 0, (iii) vacuous. Cone needs (1 + γ)²δ ≤ γ(μ − ρ), implied by line 1852. √(1 + γ²) < 1 + γ | holds |
| §9.3 geodesic flows | curvature −4 with a = 1, T = 1, t = 1/2; flat ℝⁿ; round S² | \|J_T(t)\| ≤ e^(−at)\|w\|; Dφ^t = (J, D_tJ) | sinh 1/sinh 2 = 0.324 ≤ sinh(1/2)/sinh 1 = 0.443; Rauch lower bound 0.287. sinh(a(T − t))/sinh(aT) ≤ e^(−at). Flat: (a + tb, b) | holds |
| §10.1; `IsBasicSet`, `IsFlowBasicSet`, `IsFlowAttractor` | attracting circle r' = −sin(2πr)/(2π); saddle orbit; ∅ | agreement with BowenRuelle1975 lines 25–34, 95; local stable sets | Periodic p ∈ V ∩ fⁿ(U), n < 0: p ∈ f^(kq+n)(U), kq + n ≥ 0. U = {\|r\| < 1/4}; vol W^s_Λ(ε) = 2ε; saddle: volume 0 | holds |
| §10.2; `existsUnique_isEquilibriumState_of_isBasicSet` | Λ = {0} for diag(2, 1/2) on ℝ²; cat map, φ = 0 and φ = −log 2.618 | unique Gibbs state on a noncompact M | Point: product 1, P = φ(0). Cat: Haar, h = log 2.618 = 0.9624; second potential gives P = 0. ClimenhagaThompson2016 lines 1717–1724 | holds |
| §10.3; `existsUnique_isFlowEquilibriumState_of_isFlowBasicSet` | periodic orbit of period p; F' = F + 5 + L_gψ | lower Gibbs at every ε; time-t and rescaling clauses | C_ε = (2s_ε/p)e^(−2p max\|F\|). Free energy for (g^t, F_t) is t times that for (g, F). BowenRuelle1975 Theorem 3.3 at lines 272–277 | holds |
| §10.4; `pos_coverEntropy_*`, `isEquilibriumState_toralEndomorphism_zero_iff` | d = 0; d = 1; cat matrix; periodic orbit | Haar is the unique maximal measure; h > 0 unless finite or one orbit | d = 0: point, Dirac = volume, 0 + 0 = 0. d = 1: root ±1 has norm 1, excluded. Cat: 0.9624. Orbit: h = 0. BowenPeriodicPoints1971 lines 421–426, 667 | holds |
| §11.2 Grassmann bundle | q = 0, q = dim M; cat suspension, q = 1 | dimension dim M + q(dim M − q); Λ* hyperbolic | Both ends give dim M. Fibre coordinates contract at rates 2a and a; 3 + 1 + 1 = 5 = 3 + 1·2. BowenRuelle1975 Lemma A.3 at lines 702–715 | holds |
| §11.4 volume lemmas | cat suspension with the metric of §11.1; T = 0 | c⁻¹ ≤ m(B_x(ε, T))λ_T(x) ≤ c on a hyperbolic set | Box ε·ε·εe^(−aT) times e^(aT) ≈ ε³. BowenRuelle1975 lines 364–375 assume a basic set; its Appendix (line 629) assumes only a hyperbolic set, as here | holds |
| §11.5 pressure of φ^u | attracting circle, δ = 1/(3.9m), ε = 1.01δ; saddle orbit | covering radius 2δ + ε; P ≤ 0, P = 0 on attractors | Distance 2.196δ > δ + ε = 2.01δ, within 3.01δ. Saddle: P = −(1/p) log λ_p < 0. Cat suspension: a − a = 0 | holds |
| §11.6; `srb_of_isFlowAttractor`, `srb_of_isFlowBasicSet_univ` | z = (0, 0), x = (2ε, 0), y = (0, ε) on the attracting circle | covering radius 3ε; absolutely continuous invariant ν equals μ⁺ | d(y, x) = √5 ε > 2ε, ≤ 3ε. Birkhoff for ν gives ∫u dν = ∫u dμ⁺. BowenRuelle1975 lines 421–472 | holds |
| §8.4–8.5; both local product structure theorems | Λ = ∅; −Id with Λ = {(1, 0)}; U ∪ B in the cat suspension | (A2)–(A3), (F2)–(F3) on Λ | Empty: all clauses vacuous. Uniqueness of v needs 2δ₀ below τ_Λ. Ac ≡ (1/5, 2/5), A²c = c, distance √5/5 > 1/4 | holds |
| Restated supplier definitions (Suggested.lean:64–164, 629) | ClassicalErgodicTheory and GeometryOfNumbersAndQuadraticArithmetic at their open heads | same bodies as the owners' | 14 bodies identical to the owner's Lean, `flowInvariantProbabilities` its ℝ case; `IsGibbsMeasure` equals ClassicalErgodicTheory README §8.4's formula | agrees |
| R01, R02 (board plan) | board `plan.json`; pins; README §9.3 | gaps removed | slugs at lines 2442 and 2453; Immersion.lean:995; Sphere.lean:181; README.md:800–801 | not repaired |
| Pull request text | title, summary block, prose, dependency sentence | adds the roadmap; three open and four main suppliers | ClassicalErgodicTheory, GeometryOfNumbersAndQuadraticArithmetic, ArithmeticDynamics open; the other four on main; 3 files added, none outside | agrees |

- Source locators read against the text: 59 (BowenRuelle1975 20, ClimenhagaThompson2016 18, BowenPeriodicPoints1971 9, BowenEntropyExpansive1972 5, ClimenhagaPesin2016 4, TsujiiZhang2023 3); every one supports its statement.
- Library names: all 164 backticked Mathlib and Tau Ceti names of the README exist at the pins. Opened: `ContMDiff.iff_comp_isImmersion` (Immersion.lean:995), `Manifold.IsSmoothEmbedding` (SmoothEmbedding.lean:70), `Flow.restrictNonneg` (Dynamics/Flow.lean:241), `AddAction.IsTopologicallyTransitive` (Dynamics/Transitive.lean:31), `Dynamics.coverEntropyEntourage_finite_of_isCompact_invariant` (CoverEntropy.lean:418), `DifferentiableOn.dense_compl_image_of_dimH_lt_finrank` (HausdorffDimension.lean:600), `TauCeti.riemannianVolume` (VolumeDensity/Volume.lean:82), `TauCeti.nonempty_contMDiffRiemannianMetric` (Existence.lean:69), `TauCeti.brouwerFixedPoint_closedBall` (BrouwerFixedPoint.lean:149), `Flow.minimalPeriod_pos_iff` (ClosedOrbit.lean:200), `Homeomorph.conjFlow` (Conjugacy.lean:58).
- Cross-roadmap citations resolved: ClassicalErgodicTheory at `e3c5108` (Conventions, §§0.3, 3.4, 5.3, 5.5, 8.4, 8.5 read; the other cited sections exist), GeometryOfNumbersAndQuadraticArithmetic §4.2 at `81b8a64`, ArithmeticDynamics §§2.7, 2.67–2.92 at `ae79f44`, and on main (`5ff4294`) ProbabilisticAndMetricNumberTheory §4.1, GeometricCurrents G6, GeneralizedCohomology G4.0b (so the lead "only an open revision defines G4.0b" is void), RiemannianGeometry R2 and R4.1, OperatorAlgebraDynamics D9, HeegaardFloer §1.0a.
- Gate at `fe970db`: every check 0, OK. Dependency check: `depcheck: 258 roadmaps, 2463 edges, 0 problem(s)`. No change outside the roadmap folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives 15 `sorry` warnings and nothing else. One-tactic probe on scratch copies: none of the 15 theorems closes with `simp`, `rfl`, `infer_instance` or `trivial`. `#check` of all declarations: the 9 definitions flagged for a dropped section instance do not need it (`[MeasurableSpace X]` for the pressure and Bowen-property definitions, `[FiniteDimensional]` for `hadamardPerronGraph` and `flowUnstableSubspace`); nothing changed.
- Headlines: the criteria of §§5.2–5.3, §3.1, §6.8, §8.1, §§8.4–8.5, §§10.2–10.4 and §11.6 are stated; the local manifold theorems (§§8.2–8.3) and the Anosov property of geodesic flows (§9.3) are named in the module docstring with the missing carrier.
- Overlap check: read ClassicalErgodicTheory, ArithmeticDynamics, Varifolds, RiemannianManifoldsWithConvexBoundary, ManifoldOptimization, MathematicalBilliards, RiemannianGeometry (no `Surfaces` folder is on main at `5ff4294`); pressure, equilibrium states, Gibbs, expansive and specification notions: ClassicalErgodicTheory (cited); measure entropy: GeometryOfNumbersAndQuadraticArithmetic (cited); Jacobi fields: RiemannianGeometry (cited); topological Grassmann bundle: GeometricCurrents G6 (cited; Varifolds owns only a projection presentation, this roadmap the smooth structure); nothing else shared. Searched every open head and main for connection map, Hadamard–Perron, weak specification, entropy-expansive, SRB, stable manifold and isolating neighbourhood: no second owner.
- Source independence: 14 passages compared with 5 sources, none shared; largest share BowenRuelle1975, 46 of 132 locators; contents compared with BowenRuelle1975 (Introduction, Symbolic dynamics, Equilibrium states, Attractors, Main results, Appendix): independent, only Layer 11 draws on its Sections 4–5 and Appendix, in the order its own *Needs:* lines force (11.1 → 11.3 → 11.4 → 11.5 → 11.6).

## Not verifiable

- KatokHasselblatt1995 (Sections 6.4, 18.1, 18.4, 19.1, Chapter 17; cited by §§7.4, 7.5, 9.3 of the sample), Bowen1975 (Theorem 4.1, §10.2), FH2019, Walters1982, Newhouse1989, BowenWalters1972, HirschPalisPughShub1970: settled as uncertified; their locators were not read.

## Source issues

- **Error** in BowenRuelle1975 at the proof of Theorem 5.1, printed page 192: the source says that when B_z(ε, n) meets B_x(ε, k) with k ≤ n, the ball B_x(2ε, k) contains B_z(ε, n); it should be B_x(3ε, k), by the triangle inequality through a common point; affects the proof.
- **Misprint** in ClimenhagaPesin2016 at Theorem 11.1, printed page 40: the source gives the maps f_n for n ≤ 0 but indexes the family of graphs by all integers and writes Ω_(n+1) for the fixed box; it should use one index set and Ω; affects a stated result.

## For the human reviewers

- R01 and R02 concern the board's `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`, which this pull request does not carry; the file is unchanged since `62e124d` through six reviews. Inside the roadmap folder no finding remains at `fe970db`.
- ClassicalErgodicTheory §5.5 (its open pull request) states that ℝ-transitivity equals a dense forward orbit on compact spaces without isolated points; README.md:475 gives a counterexample. This roadmap does not use that statement.
