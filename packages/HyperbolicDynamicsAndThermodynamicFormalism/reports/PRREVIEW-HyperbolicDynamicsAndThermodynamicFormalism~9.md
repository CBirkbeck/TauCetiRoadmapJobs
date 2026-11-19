# Review of HyperbolicDynamicsAndThermodynamicFormalism (pull request #2441 at 634c126)

**Verdict:** accepted

**Summary.** Accepted: no finding remains. The one finding of the previous review is repaired: §9.3 now takes the smooth global geodesic flow of the unit sphere bundle from RiemannianManifoldsWithConvexBoundary §5.1 on main, in its text, its *Needs:* line, the scope section, the supplier contracts and the module docstring, and the import was checked against that section and recomputed on two instances. There is one small correction, to a sentence of the description, and no format note; it does not block. One point, unchanged from the previous review, is left for the human reviewers.

## C01 — The description's summary still says that geodesic flows come from Mathlib and Tau Ceti

The last sentence of the summary that opens the description reads: "Topological entropy, flows, geodesic flows and Jacobi fields come from Mathlib and Tau Ceti." At this head the geodesic flow that §9.3 uses, the smooth global flow on the unit sphere bundle of a compact manifold, is imported from RiemannianManifoldsWithConvexBoundary §5.1 (README line 720 and the supplier contract at line 1039), and the existence of Jacobi fields with given initial data from RiemannianGeometry R2; only the flow on the open domain of the tangent bundle and the Jacobi-field API are Tau Ceti's. The dependency paragraph of the same description says this correctly, so a reader of the summary alone is told of one supplier too few. A sentence that would be right: topological entropy, flows of complete vector fields, the geodesic flow of the tangent bundle and the Jacobi-field API come from Mathlib and Tau Ceti; the flow on the unit sphere bundle and the existence of Jacobi fields come from RiemannianManifoldsWithConvexBoundary and RiemannianGeometry.

## Previous findings

- R01 — repaired: "the geodesic flow preserves SM and is a smooth global flow on it with smooth generator, by RiemannianManifoldsWithConvexBoundary §5.1 applied to N = M, which is compact and hence second countable" (README line 720); also in *Needs:*, scope, contracts, docstring.
- C01 (previous) — repaired: the description now lists GeometryOfNumbersAndQuadraticArithmetic §4.2 and RiemannianManifoldsWithConvexBoundary §5.1 among the roadmaps "which are on main", and only ClassicalErgodicTheory and ArithmeticDynamics as open.
- N01 (previous) — repaired: the package's source manifest records DKRH2024 (arXiv:2106.03147v1, open repository).

<details>
<summary>What was checked</summary>

- An incremental re-review of the 27 lines changed since `842acc3`: the proof paragraph and *Needs:* line of §9.3, the Dependencies line of Layer 9, the scope section, the Mathlib and Tau Ceti supplier contracts, the new contract for RiemannianManifoldsWithConvexBoundary §5.1, and the module docstring of `Suggested.lean`. No Lean statement changed. No file outside the folder is changed.
- The repair introduced no problem: the three pinned declarations whose contract lines were removed (the corestriction criterion for immersions, completeness of compact manifolds, constant speed of geodesics) are named nowhere else in the README or the Lean file, so nothing is left dangling.
- The automatic checks pass on this head: text scanners, dependency check (no upward or cyclic supply), targeted build. None was set aside.
- Elaboration of `Suggested.lean` at the pins: 16 `sorry` warnings and nothing else.
- The seeded sample of sections falls in none of the changed passages; those sections stand as in the previous review.

</details>

## Verified sound

| Target | Instances tried | Statement side | Computed on the instance | Result |
|---|---|---|---|---|
| §9.3, import of the geodesic flow of SM from RiemannianManifoldsWithConvexBoundary §5.1 (changed) | flat torus ℝ²/ℤ²; round S²; open unit disc, flat (not compact); dim M against the supplier's n + 1 | flow preserves SM, smooth, global for compact N, smooth generator; derivative is (J(0), D_tJ(0)) ↦ (J(t), D_tJ(t)) | torus: φ_t(x, v) = (x + tv, v), \|v\| = 1 kept, X = (v, 0), Dφ_t(ξ, η) = (ξ + tη, η), J = ξ + tη; S²: SM = SO(3), period 2π; disc: exit time ≤ 2, local only; dim M ≥ 2 gives n ≥ 1 | holds |
| §9.3, hypotheses of the supplier met (changed) | M of the Conventions, compact; model (E, I) against Euclidean model | N Hausdorff, second countable, boundaryless, Euclidean model | Hausdorff: Conventions; compact with finitely many charts: second countable; charts composed with I and a linear isomorphism E ≅ ℝ^d: transition maps linear conjugates, same smooth structure | holds |
| Module docstring, §9.3 headline not statable (changed) | pinned Tau Ceti and Mathlib | no `Flow ℝ` on the sphere bundle at the pins | Tau Ceti `Geometry/Manifold/Riemannian/Geodesic/Flow.lean` 106 gives smoothness on the open domain of TM only; `VectorBundle/Riemannian/Sphere.lean` 143, 161, 181 give the manifold and embedding, no flow | holds |
| Pull request text (C01) | summary block against README lines 720, 940, 1039 | geodesic flows and Jacobi fields from Mathlib and Tau Ceti | sphere-bundle flow from RiemannianManifoldsWithConvexBoundary §5.1; existence of Jacobi fields from RiemannianGeometry R2 | corrected by C01 |

The rows of the previous review for the untouched statements stand as in that review, of `842acc3`.

- Source locators checked against the text: 0 new (the changed passages cite a roadmap section and pinned declarations, no source); the 65 of the previous review stand.
- Library declarations opened at the pins (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`, the commits the README names): Tau Ceti `Geometry/Manifold/Riemannian/Geodesic/Flow.lean` 106; `Geometry/Manifold/VectorBundle/Riemannian/Sphere.lean` 143, 161, 181; Mathlib `Geometry/Manifold/SmoothEmbedding.lean` 17.
- Cross-roadmap citations resolved: RiemannianManifoldsWithConvexBoundary §5.1 on main (`TauCetiRoadmap/RiemannianManifoldsWithConvexBoundary/README.md`, lines 1404–1421: third item, the flow on `SN`, global for compact `N`, smooth generator; line 1398 for the Hausdorff second-countable boundaryless `N`; §3.5 at line 979). ClassicalErgodicTheory and ArithmeticDynamics are at the heads the previous review read (`e3c5108`, `a6b2f9b`). None missing.
- Dependency check: `depcheck: 199 roadmaps, 2189 edges, 0 problem(s)`; no UPWARD or CYCLE line. RiemannianManifoldsWithConvexBoundary is on main and earlier in the merge order.
- Elaboration: `lake env lean` on `Suggested.lean`, 16 `sorry` warnings, no error. No signature changed, so the `#check` comparison and the one-tactic probe of the previous review stand; headline theorems as there (16 stated, two named in the docstring as not statable).
- Overlap check: read ClassicalErgodicTheory, ArithmeticDynamics, RiemannianManifoldsWithConvexBoundary, RiemannianGeometry, Varifolds (ManifoldOptimization, LorentzianGeometry, FractalGeometry, MathematicalBilliards as in the previous review); pressure, equilibrium states, expansive and specification notions: ClassicalErgodicTheory (cited); measure entropy: GeometryOfNumbersAndQuadraticArithmetic (cited); Jacobi fields and Rauch: RiemannianGeometry (cited); the smooth geodesic flow on the unit sphere bundle: RiemannianManifoldsWithConvexBoundary §5.1 (now cited); nothing else shared. No open pull request changes this roadmap or drops an id it cites.
- Source independence: changed passages only: 4 passages compared (§9.3 paragraph, scope sentence, the new contract, the docstring) with 0 sources, since they cite no source, and with the supplier's §5.1, whose wording they do not repeat; largest share BowenRuelle1975, 46 of 133 locators; contents not compared again (no layer added, removed or reordered): independent, as in the previous review. KatokHasselblatt1995 could not be read.
- Research link: §10.3's unique equilibrium measure of a transitive Anosov flow and §2.1's mixing are the objects in which Tsujii and Zhang (2023) state exponential mixing in dimension three; §7.1's Anosov diffeomorphisms are the base of the examples of Dolgopyat, Kanigowski and Rodriguez-Hertz (2024); rests on README "Downstream consumers", TsujiiZhang2023 lines 106–127, DKRH2024 lines 2043–2054.

## Not verifiable

- KatokHasselblatt1995 (Chapter 17, cited by the changed paragraph of §9.3 for the Anosov property): settled as uncertified, not read; the paragraph was checked by computation and against the supplier section only.
- Bowen1975, FH2019, Walters1982, Newhouse1989, BowenWalters1972, HirschPalisPughShub1970: settled as uncertified, not read.

## Source issues

- none

## For the human reviewers

- ClassicalErgodicTheory §5.5 (open pull request, README lines 1774–1777) states that on a compact metric space without isolated points ℝ-transitivity equals a dense forward orbit. The flow x' = x(1 − x) on [0, 1] contradicts it. This roadmap does not use that statement.
