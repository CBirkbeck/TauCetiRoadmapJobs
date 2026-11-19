# Review of HyperbolicDynamicsAndThermodynamicFormalism (pull request #2441 at 634c126)

**Verdict:** accepted

**Summary.** Accepted: no finding. The folder is unchanged since the previous review, which accepted it; this round read the title and the description against the head and found nothing the head contradicts and no change left unstated. The one small correction of the previous review (the summary's sentence on where geodesic flows and Jacobi fields come from) is repaired. There are no small corrections and no format notes. One point, unchanged from the previous review, is left for the human reviewers.

## Previous findings

- C01 (previous) — repaired: the summary now reads "uniqueness of Jacobi fields come from Mathlib and Tau Ceti, existence of Jacobi fields and Rauch comparison from RiemannianGeometry, and the geodesic flow of unit sphere bundles from RiemannianManifoldsWithConvexBoundary", as the README's contracts have it.

The previous review had no finding (R) to account for.

<details>
<summary>What was checked</summary>

- An incremental re-review of 0 changed lines since `634c126`: the folder is identical to the head the previous review accepted, and no file outside the folder is changed.
- The title and description against the head. The title says the pull request adds a roadmap, and the folder is not on main. The description's list of supplier sections of ClassicalErgodicTheory (Conventions, §§0.3, 1.4, 3.4, 5.1–5.5, 6.1–6.2, 6.4, 7.1–7.3, 8.1–8.2, 8.4–8.5) is the heading of the README's supplier contract word for word, and each section exists at that roadmap's open head; ArithmeticDynamics §2.7 exists at its open head; the six roadmaps said to be on main are on main, with the cited sections; ClassicalErgodicTheory and ArithmeticDynamics are open and not on main, as stated. The four roadmaps named as consumers or neighbours are named so in the README. The statements of the end theorems in the prose (weak specification, the two non-mixing examples, entropy positive unless the basic set is finite or a single periodic orbit, Haar measure for hyperbolic toral automorphisms, the SRB theorem for C² generators with a smooth metric on a compact manifold) agree with §§2.2, 5.2–5.3, 10.2–10.4 and 11.6. The Lean file imports `Mathlib` and one Tau Ceti module and no roadmap, as the description says.
- The automatic checks pass on this head (text scanners, dependency check, targeted build); none was set aside.
- Elaboration of `Suggested.lean` at the pins: 16 `sorry` warnings and nothing else.
- The seeded sample of sections falls in no changed passage (there is none); those sections stand as in the earlier reviews.
- The count of review rounds in the description's line on AI assistance was not checked: it describes the process, not the change.

</details>

## Verified sound

| Target | Instances tried | Statement side | Computed on the instance | Result |
|---|---|---|---|---|
| Description: weak specification covers the swap of two points (§§2.2, 5.2) | X = {a, b}, T the swap, potential φ | expansive, weak specification, not mixing; unique equilibrium state, Gibbs | gap τ ∈ {0, 1} reaches any point; T^n{a} ∩ {a} empty for odd n; only invariant μ = (δ_a + δ_b)/2; P = (φ(a) + φ(b))/2; μ(B_n) = 1/2 against exp(S_nφ − nP) ∈ {1, e^(±(φ(a) − φ(b))/2)} | holds |
| Description: Haar measure is Bowen's measure of a hyperbolic toral automorphism (§10.4) | cat matrix (2 1; 1 1); A = identity as negative control | Haar is the unique maximal-entropy measure when no eigenvalue has modulus 1 | cat: eigenvalues (3 ± √5)/2, h_top = h_Haar = log((3 + √5)/2) ≈ 0.962; identity: eigenvalue 1, excluded, every measure maximal | holds |
| Description: positive entropy unless finite, or one periodic orbit (§10.4) | fixed sink {p}; one closed orbit of a flow | h_top = 0 allowed exactly there | finite set: h_top = 0; periodic orbit: time-one map is a rotation, h_top = 0; both excluded by the stated exceptions | holds |
| Description: supplier sentences of the summary and the dependency paragraph | README supplier contracts and scope section | Jacobi uniqueness from Tau Ceti; existence and Rauch from RiemannianGeometry R2, R4.1; sphere-bundle flow from RiemannianManifoldsWithConvexBoundary §5.1 | Tau Ceti `Geometry/Manifold/Riemannian/Jacobi/Uniqueness.lean` exists at the pin and is the contract's citation; contract headings R2, R4.1 and §5.1 as stated; eight supplier roadmaps, all eight listed | holds |
| Supplier passage flagged for the humans (ClassicalErgodicTheory §5.5) | flow x' = x(1 − x) on [0, 1] | ℝ-transitive iff a dense forward orbit, no isolated points | all nonempty open sets meet (0, 1), one orbit: transitive; forward orbit of x is [x, 1), fixed points 0, 1: none dense | supplier statement fails; not used here |

The rows of the previous reviews for the untouched statements stand as in the previous review, of `634c126`.

- Source locators checked against the text: 0 new (nothing changed in the folder; the description cites no locator); those of the earlier reviews stand.
- Library declarations opened at the pins: Tau Ceti `Geometry/Manifold/Riemannian/Jacobi/Uniqueness.lean` (the file of the uniqueness theorem the contract names); the import `TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Volume` elaborates.
- Cross-roadmap citations resolved: ClassicalErgodicTheory at its open head `e3c5108` (Conventions and the 19 cited sections, each heading present); ArithmeticDynamics §2.7 at `a6b2f9b`; on main, RiemannianManifoldsWithConvexBoundary §5.1, RiemannianGeometry R2 and R4.1, GeometryOfNumbersAndQuadraticArithmetic §4.2, ProbabilisticAndMetricNumberTheory §4.1, GeometricCurrents G6, GeneralizedCohomology G4.0b. None missing.
- Dependency check: `depcheck: 199 roadmaps, 2190 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean`, 16 `sorry` warnings, no error. No signature changed, so the `#check` comparison, the one-tactic probe and the list of headline theorems of the earlier reviews stand (16 stated, two named in the docstring as not statable).
- Overlap check: read ClassicalErgodicTheory, ArithmeticDynamics, RiemannianManifoldsWithConvexBoundary, RiemannianGeometry (ManifoldOptimization, FractalGeometry, LorentzianGeometry, MathematicalBilliards, Varifolds as in the earlier reviews); pressure, equilibrium states, expansivity and specification: ClassicalErgodicTheory (cited); measure entropy: GeometryOfNumbersAndQuadraticArithmetic (cited); Jacobi fields and Rauch: RiemannianGeometry (cited); geodesic flow of the unit sphere bundle: RiemannianManifoldsWithConvexBoundary §5.1 (cited); nothing else shared. No open pull request changes this roadmap or drops an id it cites.
- Source independence: changed passages only: 0 passages compared with 0 sources, since the folder did not change; largest share BowenRuelle1975, 46 of 133 locators; contents not compared again (no layer added, removed or reordered): independent, as in the previous review. KatokHasselblatt1995 could not be read.
- Research link: §10.3's unique equilibrium measure of a transitive Anosov flow and §2.1's mixing are the objects in which Tsujii and Zhang (2023) state exponential mixing in dimension three; §7.1's Anosov diffeomorphisms are the base of the examples of Dolgopyat, Kanigowski and Rodriguez-Hertz (2024); rests on README "Downstream consumers", TsujiiZhang2023 lines 106–127, DKRH2024 lines 2043–2054.

## Not verifiable

- KatokHasselblatt1995, Bowen1975, FH2019, Walters1982, Newhouse1989, BowenWalters1972, HirschPalisPughShub1970: settled as uncertified, not read.
- The description's count of review and red-team rounds: a statement about the process, with nothing in the pull request to compare it with.

## Source issues

- none

## For the human reviewers

- ClassicalErgodicTheory §5.5 (open pull request, README lines 1774–1777) states that on a compact metric space without isolated points ℝ-transitivity equals a dense forward orbit. The flow x' = x(1 − x) on [0, 1] contradicts it. This roadmap does not use that statement.
