# Review of HyperbolicDynamicsAndThermodynamicFormalism (pull request #2441 at 3d9508c)

**Verdict:** needs changes

## R01 (P2) — Declared gap `sphere-bundle-embedding` asks for what the pins provide

**Location** `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`, `gaps`, slug `sphere-bundle-embedding` (supplier TangentialBordism §2.3 (B1.5)): "a C^n map … into the total space with values in the sphere bundle is C^n into the sphere bundle".

**Claim** The plan still declares this gap, so the intake asks TangentialBordism for it. The pins already prove it, and the README (Mathlib contracts, `ContMDiff.iff_comp_isImmersion`; §9.3) uses that route and no longer declares the gap.

**Witness** Mathlib `ContMDiff.iff_comp_isImmersion` (Geometry/Manifold/Immersion.lean): `IsImmersion φ → (ContMDiff f ↔ Continuous f ∧ ContMDiff (φ ∘ f))`; `IsSmoothEmbedding.isImmersion` (SmoothEmbedding.lean:71); Tau Ceti `isSmoothEmbedding_coe_sphereBundle` (Riemannian/Sphere.lean:181).

**Repair** Delete the `sphere-bundle-embedding` entry from the plan's `gaps` and withdraw its announcement on TangentialBordism's job. The README needs no change.

## R02 (P2) — Declared gap `connection-map-jacobi-derivative` asks RiemannianGeometry for what §9.3 owns

**Location** `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`, `gaps`, slug `connection-map-jacobi-derivative` (supplier RiemannianGeometry, proposed Part II), against README.md:13: "the connection map of TM with the Jacobi-field form of the derivative of the geodesic flow, which no roadmap plans, is §9.3's".

**Claim** The plan asks RiemannianGeometry for the connection map K, the splitting (Dπ, K) and the Jacobi-field form Dφ^t ξ = (J(t), D_tJ(t)). README §9.3 now states and proves all three itself, so if the supplier acts on the announcement the objects get two owners.

**Witness** README.md:800–801: §9.3(a) says K is a smooth bundle map and (Dπ, K) an isomorphism onto π*(TM ⊕ TM); §9.3(b) says Dπ(Dφ^t_v ξ) = J(t) and K(Dφ^t_v ξ) = D_tJ(t). These are the gap's `needs`, clause by clause.

**Repair** Delete the `connection-map-jacobi-derivative` entry from the plan's `gaps` and withdraw its announcement on RiemannianGeometry's job. §9.3 stays the owner; README line 13 already says so.

## R03 (P3) — Summary block misstates the generality of the head

**Location** Pull request description, `<!-- roadmap-summary -->`: "Uniformly hyperbolic diffeomorphisms and flows on compact manifolds meet …"; "Norms come from a merely continuous Riemannian metric".

**Claim** The head states §§8.4–8.5 and 10.2–10.4 on σ-compact manifolds that need not be compact. Layer 11 measures norms, Jacobians and volume with a smooth metric, not a continuous one.

**Witness** Suggested.lean:551–552: "on a basic set of a `C¹` diffeomorphism of a σ-compact manifold, not necessarily compact". README.md:918: "the volume m … are those of a fixed smooth Riemannian metric".

**Repair** Change the first sentence to "Uniformly hyperbolic diffeomorphisms and flows on σ-compact manifolds (compact ones for Anosov systems and SRB measures) meet …". Change the second to "Norms come from a merely continuous Riemannian metric (a smooth one for the SRB theory of Layer 11)".

## R04 (P3) — The description announces a dependency list it never gives

**Location** Pull request description: "Dependencies (the roadmaps the README cites by name and section, and what they in turn need; the Lean imports none of them)."

**Claim** No list follows this sentence. The four suppliers on main are named nowhere in the description, and the depends-on block lists only the three open ones.

**Witness** README.md:104–126 has supplier contracts for ProbabilisticAndMetricNumberTheory §4.1, GeometricCurrents G6, GeneralizedCohomology G4.0b and RiemannianGeometry R2, R4.1 (all on main). None of them appears in the description.

**Repair** Replace the sentence with: "Dependencies: ClassicalErgodicTheory (Conventions, §§0.3–8.5), GeometryOfNumbersAndQuadraticArithmetic §4.2 and ArithmeticDynamics §2.7 (open, merging first); ProbabilisticAndMetricNumberTheory §4.1, GeometricCurrents G6, GeneralizedCohomology G4.0b and RiemannianGeometry R2, R4.1 (on main)."

## Verified sound

| Target | Instances tried | Statement side | Computed on the instance | Result |
|---|---|---|---|---|
| §1.1 Bowen balls (BowenRuelle1975 lines 99–101, 163–164; ClimenhagaThompson2016 lines 170–177, 945, 1600) | doubling map, ε = 1/8; full 2-shift, ε = 1/2 | B_n is the open d_n-ball, k < n | half-widths 1/8 (n = 1), 1/16 (n = 2) = 2^(−n−2); cylinder x₋₁…x_n | holds; locators match |
| §1.2 entropy-expansive (BowenEntropyExpansive1972 lines 35–56, 188–193) | full 2-shift, entourage {d ≤ 1/4} | h = h at the entourage | agreement on coordinates −1…n: 2^(n+2) covers, rate log 2 | holds |
| §2.1 mixing of flows (BowenRuelle1975 line 165; BCS2022 lines 43–44; TsujiiZhang2023 lines 125, 156) | periodic orbit of period p; roof-1 suspension | mixing ⇒ forward transitive; mixing iff time-t mixing | g^t U ∩ U = ∅ near t = p/2; time-p map is the identity; boxes meet only near 1/2 + ℤ | holds |
| §2.2 weak specification (`HasWeakSpecification`) | swap of two points; empty space; full shift at scale 2^(−m) | gluing times ≤ τ; k = 0 needs a point | (a,1),(a,1) needs 1+τ even, (a,1),(b,1) odd: weak but not strong; empty fails; full shift needs τ ≥ 2m | holds |
| §3.1 `upperSemicontinuousOn_measureEntropy_of_isExpansiveFlow` (ClimenhagaThompson2016 lines 504–535) | rotation flow of period 1; roof-1 suspension | USC on M(g¹) | g¹ = id: every entropy 0, USC trivially; trivial partition has rate 0 ≠ log 2 | holds |
| §5.2 `existsUnique_isEquilibriumState_of_hasWeakSpecification` (ClimenhagaThompson2016 lines 1717–1724, 1880–1887, 1908–1910, 1955, 1963–1965) | full 2-shift, φ = 0; scales | Gibbs at all small ε | μ(B_n(x,1/2)) = 2^(−(n+2)), times 2^n gives 1/4; source ε > 40δ, ρ ∈ (5δ, ε/8], γ ∈ (4δ, ε/4] | holds |
| §5.3 `existsUnique_isFlowEquilibriumState_of_hasFlowWeakSpecification` (ClimenhagaThompson2016 lines 140–147, 1243–1253, 1489) | one fixed point; two-point identity flow | unique ES, lower Gibbs at every ε | point: P = F(pt), product exp(tF − tF)·1 = 1, K = 1; two points: no weak specification | holds |
| §6.2 (BowenPeriodicPoints1971 lines 96–97, 101–104, 171–200) | full 2-shift, δ* = 1/2; monotone shift | expansive with δ*, closing, density under forward transitivity | β = 1/4 gives 2β = δ*, unique shadow; monotone shift has (A2), (A3), periodic points only 0^ℤ, 1^ℤ | holds |
| §6.8(a) `existsUnique_isEquilibriumState_of_hasHyperbolicLocalProductStructure` | one point; swap; monotone shift | unique ES, Gibbs, Finite X ∨ h > 0 | Dirac/uniform, Gibbs product 1, Finite X; monotone shift fails `htrans` (U = {x₀ = 1}, V = {x₀ = 0}) | holds |
| §6.8(b) `existsUnique_isFlowEquilibriumState_of_hasFlowHyperbolicLocalProductStructure` | periodic orbit of period 1 | (F2) unique v ∈ [−δ, δ] for δ ≤ δ₀ | δ = 0.6: v = 0.45 and −0.55 both fit; δ₀ = 1/4 unique; C_ε = (2s_ε/p)e^(−2p max\|F\|) | holds |
| §7.1 `IsHyperbolicSet` (Smale1967 lines 381–475) | diag(2, 1/2); diag(2, 1); identity | C, λ < 1, invariant splitting | C = 1, λ = 1/2; eigenvalue 1 neither contracted nor expanded; \|v\| ≤ Cλⁿ\|v\| forces v = 0; norm is the Riemannian instance | holds |
| §8.1 `exists_isHadamardPerronFamily` (ClimenhagaPesin2016 lines 281–283, 1822–1855) | K = ⊤; K = ⊥; f(x, y) = (2x, 0) | (i)–(iv), uniqueness through 0 | K = ⊤: graph = ball; K = ⊥: \|z_L\| ≥ \|z\|(ρ+δ)^(−L) with ν > ρ+δ, so (iii) vacuous; cone needs (1+γ)²δ ≤ γ(μ−λ), implied by line 1852 | holds |
| §8.3 strong/weak plaques (BowenRuelle1975 lines 96–108, 643–652) | roof-1 suspension of the cat map | chart conjugates g¹ to Dg¹ | (σ, a, b) ↦ (σ, 2.618a, 0.382b); y = g^c x is (c, 0, 0), not in W^s_ε | holds; docstring's not-statable reason checked |
| §8.4 `hasHyperbolicLocalProductStructure_of_isLocallyMaximal` | three copies of ℝ²; f = −Id, Λ = {(1,0)} | local maximality for f^k needs f(Λ) = Λ | U ∩ f(U) excludes c and isolates {a} for f²; for −Id, U ∩ f(U) = ∅ (hence `hinv` in Lean) | holds |
| §8.5 `hasFlowHyperbolicLocalProductStructure_of_isFlowLocallyMaximal` (BowenRuelle1975 lines 25–34) | cat suspension, W = {flat distance < 1/4}; c = (4/5, 3/5) | γ₀ isolated; U_t shrinking needed | \|Aỹ − ỹ'\| < (5+√5)/8 = 0.905 < 1 gives w = 0; Ac ≡ (1/5, 2/5), A²c ≡ c, distance √5/5 = 0.447 | holds |
| §9.3 connection map and Anosov geodesic flow (KatokHasselblatt1995 Ch. 17, uncertified) | flat ℝⁿ; round S²; curvature −4 read with a = 1 | Dφ^t ξ = (J, D_tJ); \|J_T\| ≤ e^(−at)\|w\| | (a+tb, b); J = sin t e₃, K-part −e₃ at t = π; sinh 1/sinh 2 = 0.324, between 0.287 and 0.443 | holds; gaps stale (R01, R02) |
| §10.2 `existsUnique_isEquilibriumState_of_isBasicSet` | {0} for diag(2, 1/2) on ℝ²; cat map with φ = −log 2.618 | Gibbs, invariance under φ + c + ψ∘f − ψ | ν(B_n)e^(nφ(0) − nφ(0)) = 1; P = 0.9624 − 0.9624 = 0, Haar | holds |
| §10.3 `existsUnique_isFlowEquilibriumState_of_isFlowBasicSet` (BowenRuelle1975 lines 213–222, 272–277) | periodic orbit of period p; F' = F + 5 + L_gψ | lower Gibbs at every ε; coboundary invariance | P = (1/p)∫F; −TP + ∫₀ᵀF ∈ [−2p max\|F\|, 2p max\|F\|]; pressure +5, same ν | holds |
| §10.4 `pos_coverEntropy_of_isFlowBasicSet`, `pos_coverEntropy_of_isBasicSet` (BowenRuelle1975 lines 77–78, 324–325; BowenPeriodicPoints1971 lines 421–426) | periodic orbit; cat map; finite Λ | h > 0 unless periodic orbit or finite | h = 0 falls in the first disjunct (p > 0, Λ = orbit); cat 0.9624 > 0; finite gives `Λ.Finite` | holds |
| §10.4 `isEquilibriumState_toralEndomorphism_zero_iff` (BowenPeriodicPoints1971 line 667) | d = 0; d = 1; cat matrix | MME ⇔ ν = volume | d = 0: det 1, no roots, P = 0 = 0 + 0, ν = volume = δ; d = 1: root ±1, vacuous; cat: Haar | holds |
| §11.1 geometric potential (BowenRuelle1975 lines 346–363, 409–413) | cat suspension with Sol-type metric; factor e^(2u(s)); no √ | ∫₀ᵀφ^u = −log λ_T; P(φ^u) = 0 | λ_t = e^(at), φ^u = −0.9624, P = 0; φ' = −a − 0.2π cos 2πs; without √: −1.925, P = −a < 0 | holds |
| §11.2 Grassmann lift (BowenRuelle1975 lines 702–715) | q = 1, dim M = 3; q = 0, q = dim M | stable dim E^s + q(dim − q), unstable q | 3 + 1 + 1 = 5 = dim G₁; fibre rates 2a, a; fibres are points at q = 0, dim M | holds |
| §11.3 distortion (BowenRuelle1975 lines 681–701, 718–738) | cat suspension, E* = span(e_u + 0.1e_v) | e^(−θ) ≤ Jac/λ_T ≤ e^θ with η(θ) | ratio → (1.01)^(−1/2) = 0.99504 < e^(−0.001) = 0.99900, so η depends on θ | holds |
| §11.4 volume lemmas (BowenRuelle1975 lines 364–375, 629, 740–808) | cat suspension; T = 0 | m(B_x(ε,T))λ_T(x) ∈ [c⁻¹, c] | volume ε·ε·εe^(−aT) × e^(aT) = ε³; the Appendix assumes only a hyperbolic set (line 629) | holds |
| §11.5 pressure of φ^u (BowenRuelle1975 lines 377–407) | attracting circle, δ = 1/(3.9m), ε = 1.01δ | covering radius 2δ + ε | distance √(1.95² + 1.01²)δ = 2.196δ > 2.01δ, < 3.01δ | holds |
| §11.6 `srb_of_isFlowAttractor`, `srb_of_isFlowBasicSet_univ` (BowenRuelle1975 lines 421–472) | attracting circle z = (0,0), x = (2ε,0), y = (0,ε); sink orbit | covering radius 3ε; φ^u on E^u = 0 | d(y, x) = √5ε = 2.236ε > 2ε; empty basis, Gram 1/1, λ_t = 1, φ^u = 0 | holds |
| R03 summary sentence | §§10.2–10.3 headlines | "on compact manifolds" | `[SigmaCompactSpace M]`, no `CompactSpace` in §§8.4–10.4 signatures | contradicts (R03) |

- Source locators checked against the text: 66 locators in 8 sources (BowenRuelle1975 23, ClimenhagaThompson2016 19, BowenPeriodicPoints1971 10, ClimenhagaPesin2016 4, TsujiiZhang2023 4, BowenEntropyExpansive1972 3, BCS2022 2, Smale1967 1). All 15 sampled targets have the theorem, line, hypotheses and statement as cited.
- Library declarations opened at the pins: 58 Tau Ceti declarations located by defining line, for example `isSmoothEmbedding_coe_sphereBundle` Sphere.lean:181, `alongCurve_curveVelocity_comm` AlongCurve/Surface.lean:167, `riemannianVolume` VolumeDensity/Volume.lean:82, `minimalPeriod_pos_iff` ClosedOrbit.lean:200. 25 Mathlib declarations were checked with `#check` and file path. No pinned declaration proves a target.
- Cross-roadmap citations resolved: ClassicalErgodicTheory (Conventions and every cited § at its head; its 11 Lean definitions are identical to the restated ones, and `IsGibbsMeasure` matches its §8.4 prose), GeometryOfNumbersAndQuadraticArithmetic §4.2 (the four entropy definitions match), ArithmeticDynamics §2.7, ProbabilisticAndMetricNumberTheory §4.1 (`birkhoff_pointwise`), GeometricCurrents G6, GeneralizedCohomology G4.0b (a labelled target in §G4 on main, so the "only an open revision" lead is void), RiemannianGeometry R2 and R4.1 (`exists_jacobi_initial_data`, `rauch_norm_ge_of_sectional_le`).
- Gate: every check 0, OK. Depcheck output: `depcheck: 248 roadmaps, 2375 edges, 0 problem(s)`.
- Elaboration: `lake env lean` gives 15 `sorry` warnings and nothing else. `#print` confirms the norms in `IsHyperbolicSet` use the Riemannian instance. The elaborated signatures drop 9 binders, all unused instance classes on definitions.
- One-tactic probe (`first | rfl | infer_instance | simp | aesop`) fails on all 15 theorems: no padding. Both not-statable claims in the module docstring were checked against the pins.
- Overlap check: read ClassicalErgodicTheory, ArithmeticDynamics, LorentzianGeometry, ManifoldOptimization, DimerModelsAndLozengeTilings, MathematicalBilliards, RiemannianGeometry. Shared objects: pressure, equilibrium states, Gibbs, expansive and specification notions (owner ClassicalErgodicTheory, cited); measure entropy (GeometryOfNumbersAndQuadraticArithmetic, cited); Jacobi fields and Rauch comparison (RiemannianGeometry, cited). Hyperbolic sets, Anosov systems and SRB are owned here only (ClassicalErgodicTheory excludes them).
- Source independence: 20 passages compared with 8 sources; shared wording occurs only in forced formulas, e.g. (A2) at BowenPeriodicPoints1971 lines 75–76. Largest share BowenRuelle1975, 48 of 151 citations. Contents compared with BowenRuelle1975 (§§1–5, Appendix): independent. Its §2 on symbolic dynamics has no counterpart here, and the order 11.1–11.6 is forced by the *Needs:* chain 11.2 → 11.3 → 11.4 → 11.5 → 11.6.

## Not verifiable

- KatokHasselblatt1995 (§§6.2, 6.4, 17, 18.1, 18.4, 19.1), Bowen1975 (Ch. 1, 3, 4), FH2019, Walters1982, Newhouse1989, BowenWalters1972, HirschPalisPughShub1970: the manifest settles them as uncertified (paywalled), so their locators were not read. §9.3's only cited source is KatokHasselblatt1995 Ch. 17.
- TsujiiZhang2023 (arXiv v1), ClimenhagaPesin2016 (arXiv v1), ClimenhagaThompson2016 and BCS2022 (arXiv v2): the arXiv versions were read; their theorem numbering was not compared with the journal versions the References also name.
- BowenRuelle1975 line 450: the extracted text reads radius 2ε where the triangle inequality gives 3ε. The text layer is garbled there, so a misprint is not confirmed; the README uses 3ε.

## Source issues

- **Misprint** in ClimenhagaPesin2016 at Theorem 11.1, p. 40: the source says the family W⁺_n is indexed by all n ∈ ℤ, while the maps f_n are given only for n ≤ 0; it should be indexed by n ≤ 0, or maps given for every n; affects nothing.
- **Misprint** in ClimenhagaPesin2016 at Theorem 11.1(ii), p. 40: the source says f_n expands by more than μ′ for all y, z on the graph; it should require y ≠ z; affects nothing.
- **Gap** in ClimenhagaPesin2016 at Theorem 11.1(iii), p. 40: the source applies inverses f_n⁻¹ although the f_n are C¹ maps of the box not assumed invertible; it should quantify over backward sequences z_L with f_(n−L)(z_L) = z_(L−1); affects a stated result.

## For the human reviewers

- none
