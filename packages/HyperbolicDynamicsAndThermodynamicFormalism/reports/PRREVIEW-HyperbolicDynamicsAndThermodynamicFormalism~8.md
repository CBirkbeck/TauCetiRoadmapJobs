# Review of HyperbolicDynamicsAndThermodynamicFormalism (pull request #2441 at 842acc3)

**Verdict:** needs changes

**Summary.** Changes are needed for one finding, which is about ownership and not about the mathematics: the geodesic flow on the unit sphere bundle of a compact manifold, as a smooth global flow, is a target of RiemannianManifoldsWithConvexBoundary §5.1 on main, and §9.3 builds it again without citing it. No stated result was found false: the new Anosov-flow headline, the equivalence of the transitivity notions for Anosov systems, the Hölder-derivative form of §8.7 and the fifteen sampled sections were recomputed and hold. There are one small correction (the description still calls GeometryOfNumbersAndQuadraticArithmetic an open pull request) and one format note. Two points are left for the human reviewers.

## R01 (P2) — The smooth global geodesic flow on the unit sphere bundle of a compact manifold is a target of RiemannianManifoldsWithConvexBoundary §5.1 on main, and §9.3 constructs it again without citing it

Two roadmaps would each build the same flow on the same carrier, and an implementer of §9.3 cannot tell that the construction has an owner earlier in the merge order. RiemannianManifoldsWithConvexBoundary §5.1 on main (`TauCetiRoadmap/RiemannianManifoldsWithConvexBoundary/README.md`, lines 1419–1421) lists under "Prove": "The geodesic flow `φ_t` of `N` preserves `SN` and is a smooth local flow on it (global if `N` is compact); its generator `X` is a smooth vector field on `SN`", for a Hausdorff second-countable boundaryless `(N, g)` and Tau Ceti's sphere-bundle manifold `SN` of radius 1 (line 1407). §9.3 here, in the paragraph that proves the Anosov property (README line 720), derives the same statement from the same Tau Ceti inputs (smoothness on the open domain, completeness on a compact manifold, constant speed, corestriction through the embedding of the sphere bundle), and the module docstring of `Suggested.lean` (lines 32–38) calls the restricted flow "a construction of README §9.3". The README names RiemannianManifoldsWithConvexBoundary nowhere.

The smallest change: in that paragraph of §9.3, take the geodesic flow of `SM` as a smooth global flow, with smooth generator, from RiemannianManifoldsWithConvexBoundary §5.1 (the case `N = M` compact), and add that section to §9.3's *Needs:* line, to the list of what is stated by other roadmaps in the scope section, and to the supplier contracts. The sentence deriving it from Tau Ceti may stay as the route that section takes or go. In the docstring, "a construction of README §9.3" becomes a construction of that section; the headline stays not statable at the pins for the same reason. The connection map and the Jacobi-field form of the derivative remain §9.3's own: no other roadmap states them.

## C01 — The description still lists GeometryOfNumbersAndQuadraticArithmetic among the open pull requests

The dependency paragraph of the description says: "GeometryOfNumbersAndQuadraticArithmetic §4.2 and ArithmeticDynamics §2.7, which are open pull requests that merge first". GeometryOfNumbersAndQuadraticArithmetic is on main now, with §4.2 and its paragraph on entropy (`TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md`, lines 1258 and 1360–1362), so a reader counts one open supplier too many. The text that is right: ClassicalErgodicTheory and ArithmeticDynamics §2.7 are open pull requests that merge first; GeometryOfNumbersAndQuadraticArithmetic §4.2 joins the roadmaps on main. After R01 the same paragraph also names RiemannianManifoldsWithConvexBoundary §5.1, on main.

## N01 — DKRH2024 is cited with line locators but is not recorded in the roadmap's source manifest

The new consumer paragraph and the References cite DKRH2024 (arXiv:2106.03147v1) with lines 12–31, 159–161 and 2043–2054; the three locators are right in that version. The manifest of the package has no entry under that key, so the citation has no recorded copy. Record it (open repository, arXiv).

<details>
<summary>What was checked</summary>

- Earlier findings: the previous review, of `6cc594f`, had none open; nothing to repair.
- The automatic checks pass on this head: text scanners, dependency check (no upward or cyclic supply), targeted build.
- Elaboration of `Suggested.lean` at the pins: 16 `sorry` warnings and nothing else. One-tactic probe (`simp`, `rfl`, `infer_instance`) on a copy: none of the 16 theorems closes.
- Sources read at their locators: BowenRuelle1975, ClimenhagaThompson2016, BowenPeriodicPoints1971, BowenEntropyExpansive1972, BowenGroupEndomorphisms1971, Smale1967, ClimenhagaPesin2016, TsujiiZhang2023, DKRH2024.

</details>

## Verified sound

| Target | Instances tried | Statement side | Computed on the instance | Result |
|---|---|---|---|---|
| §1.2 entropy-expansive maps (sample) | full two-shift at {d ≤ 1/4}, n steps; identity of [0, 1]; compactified shifts on 2^m symbols | entropy equals entropy at the scale; finite | closeness fixes coordinates −1..n: 2^(n+2) cylinders, rate log 2 = h_top; identity: 0; third: sup m log 2 = ∞, hypothesis fails | holds |
| §1.3 expansive flows (sample) | periodic orbit; identity flow of circle and of two points; irrational linear flow | Γ_ε in an orbit arc; fixed points isolated | arc of time ε/speed; circle: non-isolated fixed points, fails; two points: y = x; torus: transverse segment in Γ_ε | holds |
| §5.3 criterion for flows (sample, headline) | periodic orbit; identity flow of two points; roof-one suspension of two-shift | unique state, lower Gibbs every scale | orbit: one invariant measure; two points: expansive, not transitive, every measure maximal, no specification; suspension: product measure | holds |
| §5.2 criterion for maps (headline) | two-shift, φ = 0, ε = 1/2; swap; two disjoint two-shifts | unique Gibbs state | ν(B_n) = 2^(−(n+2)), times 2^n = 1/4; swap: τ = 1 weak, parity blocks strong; union: segment of states | holds |
| §3.1 upper semicontinuity (headline) | period-one orbit; roof-one suspension, trivial partition | hμ(g^1) = hμ(g^1, ξ) for small ξ | orbit: both sides 0; suspension: log 2 against rate 0 for {X}, diameter hypothesis needed | holds |
| §6.1 local product axioms (sample) | two-shift; identity of finite set; identity of circle; irrational rotation | (A2), (A3) | W^s_(1/2): agree for i ≥ 0, c = 1, λ = 1/2; finite: singletons; circle and rotation: distances preserved, (A3) fails | holds |
| §6.2 expansivity, closing (sample) | two-shift β = 1 and 1/4; monotone shift | unique shadowing for 2β ≤ δ*; forward transitive gives dense periodic points | β = 1: every point shadows; 2·(1/4) = δ*; monotone shift: periodic points 0^ℤ, 1^ℤ only, cylinder {x₋₁ = 0, x₀ = 1} one point | holds |
| §6.8 abstract uniqueness (sample, headline) | swap; one point; monotone shift | unique state; finite or h_top > 0 | swap: h = 0, finite; point: Gibbs product 1; monotone: n + 1 words, h = 0, two point masses maximal, forward transitivity fails | holds |
| §7.2 hyperbolic sets of flows, `IsAnosovFlow` (sample) | rotation flow of circle; constant field on torus; suspended saddle; empty M | splitting E^s ⊕ ℝX ⊕ E^u; C¹; M compact | circle: E^s = E^u = 0, span X = T, Anosov; torus: Dg^t = Id, dimension 1 ≠ 2; saddle: κ = log 2; empty: vacuous | holds |
| §7.2 generator and flows of fields (changed) | C^r flow, r = 1, 2, ∞; flow of C² field on compact M | X is C^(r−1); C² flows with C² generator are flows of C² fields | tangent map C^m for m + 1 ≤ r; pinned flow theorem gives C^n, 1 ≤ n ≤ ∞, generator the field, integral curves are orbits | holds |
| §7.5 continuity (sample) | saddle ⊔ sink in ℝ² ⊔ ℝ²; diag(1 + t, 1/(1 + t)) | dim E^s locally constant | values 1 and 2 on two components; rate 1/(1 + t) → 1, limit identity has E^s = 0 | holds |
| §7.6 adapted metrics (sample) | series norm; Jordan block J = (1/2 1; 0 1/2), λ' = 3/4 | one-step contraction by λ' | shifted series gives ≤ λ'²; 2^n\|J^n(0,1)\| = (4n² + 1)^(1/2) unbounded; conjugate norm ((65/64)^(1/2) + 1/8)/2 ≈ 0.566 | holds |
| §7.7 inverses, iterates (sample) | cat matrix; diag(2, 1/2)², time-t map | E^s, E^u exchange; rate λ^k; time-t maps not Anosov | A·(1 −1; −1 2) = I; rate 1/4; Dg^t X = X∘g^t bounded both ways | holds |
| §8.1 Hadamard–Perron (headline) | linear maps; E^u = 0 with f = Id; f(x, y) = (2x, 0) | unique graphs, cone clause (iv) | φ = 0; constants {p} satisfy (i), need φ(0) = 0; (iv) needs δ(1 + γ)² ≤ γ(μ − λ); z_L = 2^(−L)x | holds |
| §8.6 nontriviality (sample) | Anosov diffeomorphism of finite set; cat map; circle flow; compact 3-manifold | zero bundle forces point or periodic orbit | m sets of diameter → 0 cover K: ≤ m points; cat: 1 + 1; circle: exception; dimension 3: positive, sum 2, so 1 and 1 | holds |
| §8.7 Hölder bundles (changed) | cat map α = 1, L = λ⁻¹; C² map | θ = α log λ⁻¹/(α log L + log λ⁻¹) ∈ (0, α) | balancing λ^n against (L^n d)^α gives the exponent; cat: θ = 1/2; C²: derivative locally Lipschitz, α = 1 | holds |
| §9.1 toral automorphisms (sample) | cat matrix; shear; rotation; n = 0 | Anosov; h_top = Σ log\|λ\| | A(1, 0.618) = 2.618(1, 0.618); h = 0.9624; shear: eigenvalue 1, 0; rotation: A⁴ = I; empty sum 0 | holds |
| §9.3 geodesic flows (sample) | curvature −4 read with a = 1; unit sphere; flat torus | \|J_T(t)\| ≤ sinh(a(T−t))/sinh(aT)\|w\| | sinh 1/sinh 2 = 0.324 ≤ 0.443, ≥ 0.287; sphere: J = sin t e₃, at π vertical with −e₃; torus: affine fields | holds; R01 on the flow itself |
| §10.1 transitivity of Anosov systems (changed) | dense orbit, x periodic or not; dim M = 1; monotone-shift horseshoe | signed, forward transitivity and basic set agree | non-periodic: finite orbit arcs nowhere dense, long returns, closing, periodic p ∈ V ∩ f^n(U) gives f^(kq+n); Λ ≠ M: fails | holds |
| §10.3 Bowen–Ruelle and Anosov headline (headline) | rotation flow of circle; periodic orbit of period p; F' = F + 5 + L_gψ | unique state, lower Gibbs every scale | circle: uniquely ergodic, Lebesgue; C_ε = (2s_ε/p)e^(−2p max\|F\|); pressure shifts by 5, state unchanged | holds |
| §10.2, §10.4 (headlines) | cat map φ = 0; saddle fixed point in ℝ²; periodic orbit | unique state; h > 0 unless finite or one orbit | Haar, entropy 0.9624; point mass, Gibbs product 1; orbit entropy 0, exception needed | holds |
| §11.3 bounded distortion (sample) | suspended cat map, E* spanned by e_u + b e_v, b = 0.1 | ratio in [e^(−θ), e^θ] | (1 + b²e^(−4aT))^(1/2)/(1 + b²)^(1/2) → 0.99504 < e^(−0.001); condition b² ≤ e^(2θ) − 1 | holds |
| §11.5 pressure of φ^u | attracting circle, δ = 1/(3.9m), ε = 1.01δ | covering radius 2δ + ε | distance (1.95² + 1.01²)^(1/2)δ = 2.196δ > 2.01δ, < 3.01δ | holds |
| §11.6 SRB theorem (sample, headline) | attracting circle, z = (0,0), x = (2ε,0), y = (0,ε); suspended cat map | covering radius 3ε; μ⁺ generic a.e. | balls meet at (ε,0); d(y,x) = √5 ε > 2ε, ≤ 3ε; μ⁺ = volume for ds du dv, density e^(3u(s)) otherwise | holds |
| Pull request text (C01) | dependency paragraph against main | three open suppliers named | GeometryOfNumbersAndQuadraticArithmetic on main; ClassicalErgodicTheory and ArithmeticDynamics open | corrected by C01 |

- Source locators checked against the text: 65, in 9 sources (BowenRuelle1975 19, ClimenhagaThompson2016 19, BowenPeriodicPoints1971 8, BowenEntropyExpansive1972 5, TsujiiZhang2023 5, ClimenhagaPesin2016 3, DKRH2024 3, BowenGroupEndomorphisms1971 2, Smale1967 1); all support the statements made.
- Library declarations opened at the pins (unchanged since the last reviewed head): Tau Ceti `Geometry/Manifold/IntegralCurve/GlobalFlow.lean` 90, 136, 147, 167; `Geometry/Manifold/Flow/Complete.lean` 154; `AlgebraicTopology/Singular/BrouwerFixedPoint.lean` 149; `Geometry/Manifold/VectorBundle/Riemannian/Existence.lean` 69; `Dynamics/Flow/Conjugacy.lean` 58; `Geometry/Manifold/VectorBundle/Riemannian/Sphere.lean` 181; `Geometry/Manifold/Instances/MappingTorus.lean` 431, 493; Mathlib `Geometry/Manifold/ContMDiffMFDeriv.lean` 338; `Topology/MetricSpace/HausdorffDimension.lean` 600; `Dynamics/TopologicalEntropy/CoverEntropy.lean` 418; `Dynamics/Flow.lean` 241; `Topology/VectorBundle/Riemannian.lean` 128; `MeasureTheory/Measure/Portmanteau.lean` 334. No pinned declaration states an Anosov system, a hyperbolic set, pressure or weak specification.
- Cross-roadmap citations resolved: ClassicalErgodicTheory at its open head `e3c5108` (§§0.3, 5.2–5.5, 7.3, 8.1, 8.4–8.5 opened); ArithmeticDynamics at its open head `a6b2f9b` (§2.7; §§2.67–2.92); on main GeometryOfNumbersAndQuadraticArithmetic §4.2, ProbabilisticAndMetricNumberTheory §4.1, GeometricCurrents G6, GeneralizedCohomology G4.0b, RiemannianGeometry R2 and R4.1, OperatorAlgebraDynamics D9, HeegaardFloer §1.0a. None missing.
- Dependency check: `depcheck: 199 roadmaps, 2189 edges, 0 problem(s)`; no UPWARD or CYCLE line. ClassicalErgodicTheory and ArithmeticDynamics are open pull requests that add new roadmap folders.
- Elaboration: `lake env lean` on `Suggested.lean`, 16 `sorry` warnings, no error. `#check` types compared with the README: the binders reported as dropped are `[MeasurableSpace X]` on six definitions that do not use it and `[FiniteDimensional]` on `hadamardPerronGraph` and `flowUnstableSubspace`, which do not need it; the theorems carry every hypothesis of their README statements.
- Headline theorems: 16 stated (§§3.1, 5.2, 5.3, 6.8(a), 6.8(b), 8.1, 8.4, 8.5, 10.2, 10.3 twice, 10.4 three times, 11.6 twice); two named in the docstring as not statable (§§8.2–8.3 plaques, §9.3 geodesic flow). Probe: none closes in one tactic; no padding.
- Overlap check: read ClassicalErgodicTheory, ArithmeticDynamics, ManifoldOptimization, LorentzianGeometry, FractalGeometry, MathematicalBilliards, RiemannianManifoldsWithConvexBoundary, RiemannianGeometry; pressure, equilibrium states, Gibbs, expansive and specification notions: ClassicalErgodicTheory (cited); measure entropy: GeometryOfNumbersAndQuadraticArithmetic (cited); Jacobi fields and Rauch: RiemannianGeometry (cited); the smooth geodesic flow on the unit sphere bundle: RiemannianManifoldsWithConvexBoundary §5.1 (not cited, R01); nothing else shared. No other roadmap, open or on main, states an Anosov system, a hyperbolic set or the connection map.
- Source independence: 28 passages compared with 9 sources, none shared (the axioms (A2), (A3) and clauses (i)–(iii) of the Hadamard–Perron theorem are formulas that can be written one way); largest share BowenRuelle1975, 46 of 133 locators; contents compared with BowenRuelle1975: independent (its Sections 4 and 5 and Appendix feed Layer 11 only, interleaved in the order the *Needs:* lines of §§11.2–11.6 force; its symbolic dynamics is not used; Layers 1–10 follow no section of it). KatokHasselblatt1995 (17 locators) could not be read.
- Research link: §10.3's unique equilibrium measure of a transitive Anosov flow and §2.1's mixing are the objects in which Tsujii and Zhang (2023) state exponential mixing in dimension three; §7.1's Anosov diffeomorphisms are the base of the examples of Dolgopyat, Kanigowski and Rodriguez-Hertz (2024); rests on README "Downstream consumers", TsujiiZhang2023 lines 106–127, DKRH2024 lines 2043–2054.

## Not verifiable

- KatokHasselblatt1995 (Sections 6.2, 6.4, 18.1, 18.4, 19.1, Chapter 17; the only source of §§7.7, 8.6 and 9.3 of the sample): settled as uncertified, not read; those sections were checked by computation only.
- Bowen1975, FH2019, Walters1982, Newhouse1989, BowenWalters1972, HirschPalisPughShub1970: settled as uncertified, not read.

## Source issues

- **Misprint** in ClimenhagaThompson2016 at Section 2.5, after (2.12), printed page 8: the source says the two-sided set at x is the intersection over t of the time-t images of the open Bowen balls of order 2t centred at x; it should be centred at the time −t image of x, with closed balls; affects nothing.
- **Error** in BowenRuelle1975 at the proof of Theorem 5.1, printed page 192: the source says that when the ball of z of order n meets the ball of x of order k ≤ n, the ball of x of radius 2ε contains the former; it should be radius 3ε, by the triangle inequality; affects the proof.
- **Misprint** in ClimenhagaPesin2016 at Theorem 11.1, printed page 40: the source gives the maps for n ≤ 0 but indexes the graphs by all integers and writes an indexed box in (i); it should use one index set and the fixed box; affects a stated result.

## For the human reviewers

- ClassicalErgodicTheory §5.5 (open pull request, README lines 1774–1777) states that on a compact metric space without isolated points ℝ-transitivity equals a dense forward orbit. The flow x' = x(1 − x) on [0, 1] contradicts it. This roadmap does not use that statement.
- RiemannianManifoldsWithConvexBoundary reached main while this pull request was open; R01 follows from that merge, not from a change in this roadmap's §9.3.
