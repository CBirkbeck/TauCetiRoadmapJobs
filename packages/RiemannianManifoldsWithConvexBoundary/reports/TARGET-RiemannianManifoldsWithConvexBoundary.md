# Triage report: TARGET-RiemannianManifoldsWithConvexBoundary

Verdict: **design**, name `RiemannianManifoldsWithConvexBoundary` (the suggested name, free).
Brief: `packages/RiemannianManifoldsWithConvexBoundary/target.md`.
Manifest: `packages/RiemannianManifoldsWithConvexBoundary/sources.toml` (six entries, three
certified). No `needs-references.toml` is left: nothing the brief needs is unreadable.

## What I searched

**Consolidation against the board.** Every open target and design in the brief, by object.
The only candidates with a shared object were `DESIGN-LorentzianGeometry` (manifolds with
boundary allowed; hypersurfaces) and `TARGET-MathematicalBilliards` (convex plane tables).
Lorentzian's hypersurface theory is the causal character and null hypersurfaces of an
indefinite metric (`packages/LorentzianGeometry/target.md`, items L3, 8–10); it names
RiemannianGeometry for the positive-definite case and plans no second fundamental form of a
boundary. Billiards works with a `C^k` plane curve of positive curvature, not a Riemannian
manifold with boundary. `DESIGN-HyperbolicDynamicsAndThermodynamicFormalism` is on closed
manifolds. `DESIGN-CompressibleEulerEquations`, `TARGET-SobolevMapsBetweenManifolds`,
`DESIGN-QuasiregularMaps`, `TARGET-Varifolds` share at most a supplier. No merge.

**Ownership on main, in the open pull requests and on the board.** With the roadmap grep tool
(main plus 455 open pull requests): `strictly convex boundary`, `convex boundary`, `scattering
relation`, `boundary defining function`, `second fundamental form of the boundary`,
`mean-convex`, `Fermi coordinates | boundary normal coordinates | normal gauge`, `x-ray
transform`, `boundary rigidity`, `inverse problem`, `Santaló`, `non-trapping`, `geodesic ball`,
`strictly concave`: no match anywhere for the convexity, scattering and inverse-problem terms.
`exit time` matches only stochastic and symplectic uses. `collar neighbourhood` and `manifold
with boundary` match GeometricTopology Layer 1 (collars, boundary as a manifold), DifferentialGeometry
(boundary and corners, Stokes), PositiveMass, HomotopySpheres, AffineMorseLefschetz and others,
none of which defines a second fundamental form of the boundary. The board package list
(`board-packages-index.txt`) has no related package. The roadmap name list has nothing named for
convex boundaries.

**What the related roadmaps actually own.**
- `TauCetiRoadmap/RiemannianGeometry/README.md`, Conventions (boundaryless throughout), R5a
  (immersion `B`, `S`, Gauss–Codazzi, the sphere normalised by `B = −g · position`), R6 (normal
  exponential on its natural domain, focal geometry). Nothing on manifolds with boundary.
- `TauCetiRoadmap/DifferentialGeometry/README.md`, "Boundary and corners", 5.1 (outward
  pointing fields, boundary orientation), 12.1–12.5 (metrics including boundary metrics,
  gradient, Hessian, divergence theorem with the outward unit normal). No boundary curvature.
- `TauCetiRoadmap/GeometricTopology/README.md` Layer 1 on main and PR #903 sections 1.1
  (smooth collars as data, Lee Thm 9.25 with a fair-use extract in its references folder), 1.3
  (gluing along the boundary), 1.5 (tubular neighbourhoods and the normal exponential of an
  embedding into a Riemannian manifold).
- `Completed/HopfRinow/README.md`: the exponential map, Gauss lemma and distance, all under
  `[I.Boundaryless]`.
- `TauCetiRoadmap/PositiveScalarCurvature/README.md` lines 93–94 (tensors extend across
  boundary charts, collars for bordisms) and PositiveMass PR #956 §5.1–5.2 (mean curvature of a
  compact boundary for the inward normal, compared by hand with R5b): consumers, not owners. The
  issue's claim that PositiveScalarCurvature consumes R5a for mean-convex boundaries is not
  borne out by its README; it is recorded as data only.
- `TauCetiRoadmap/ComplexKahlerGeometry/README.md` K5 (line 867 on main): extension of smooth
  functions across a smooth boundary by a collar and the half-space Seeley extension, for bounded
  Euclidean domains. The only owner of a Seeley-type extension; named as supplier for the metric
  extension with a risk note.
- SmoothBundlesConnections B6.0 (open pull request, merge order line 8): uniform normal and
  strong-convexity radii, used for the small-geodesic-ball example.

**Libraries.** Mathlib (pinned): `ModelWithCorners.boundary`, `IsBoundaryPoint`,
`BoundarylessManifold` in `Mathlib/Geometry/Manifold/IsManifold/InteriorBoundary.lean`;
`IsRiemannianManifold` in `Mathlib/Geometry/Manifold/Riemannian/Basic.lean` (distance equals
infimum of path lengths; no boundary restriction); `leviCivitaConnection` in
`Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean`; no geodesics,
no second fundamental form. Tau Ceti (pinned): `TauCeti/Geometry/Manifold/Boundary/`
(`isManifold_boundary`, the half-space boundary model, collar charts
`collarChartedSpace` with `isManifold_collarChartedSpace`, the topological `IsCollar`
predicate and `EuclideanHalfSpace.boundaryCollar`); `TauCeti/Geometry/Manifold/Riemannian/`
(`riemannianExp`, `expDomain`, geodesic spray, `inducedRiemannianMetric`, open-submanifold
restriction, convex Euclidean domains); `TauCeti/Geometry/Manifold/TubularNeighborhood/`. No
smooth collar theorem, no second fundamental form, no Seeley extension (the only hit for
"extension across a half-space" is `LocallyFlat/Neat.lean`, a topological file).

## Why the verdict

Nothing owns the boundary of a manifold with boundary as a Riemannian hypersurface, the second
fundamental form of that boundary, convexity of the boundary, exit times or the scattering
relation. The target does not continue an existing roadmap in its own direction: RiemannianGeometry
is boundaryless by convention and GeometricTopology's boundary layer is differential-topological,
so neither a Part II nor a duplicate fits. The target is at the right generality already
(`n ≥ 2`, smooth up to the boundary, compactness only where needed); the brief adds the
non-compact local statements that Stefanov–Uhlmann–Vasy's Theorem 1.1 needs, the conformal
change law behind "dependence on the metric", and the covector form of strict convexity from
Uhlmann–Vasy, and it names the extension across the boundary (T2) as the structural foundation
because the library's geodesics are boundaryless.

## Sources

Fetched through the sources service into the manifest:
- `stefanov-uhlmann-vasy2021`, arXiv:1702.03638v3, certified. Theorems 1.1–1.4 at lines
  89–134 and 198–214; strict convexity at a point, lines 89–90; strictly concave level sets from
  the superlevel sets, lines 128–129 and 198–200.
- `uhlmann-vasy2016`, arXiv:1210.2084v1, certified. Defining functions and the convexity
  function, lines 25–30 and 133–142; the covector form of strict convexity and the construction
  `x̃ = −ρ − ε|z − p|²`, lines 498–524.
- `paternain-salo-uhlmann2023`, the authors' copy on G. Uhlmann's University of Washington
  publications page (carries the publisher's personal-use notice; recorded as author-page,
  certified). The DOI landing page resolves to Cambridge University Press and was not used.
  Chapter 3 locators: Definitions 3.1.1, 3.1.3, 3.1.7; Lemmas 3.1.8, 3.1.10, 3.1.12, 3.1.13,
  3.2.3, 3.2.6, 3.2.8, 3.2.11, 3.3.5; Proposition 3.3.1; Definition 3.3.4 (lines 2640–3126).
  Its second fundamental form `Π = −⟨∇_v ν, w⟩` uses the inward normal (its `∇ρ = ν` with
  `ρ ≥ 0` inside, line 2773), so it agrees with the issue's `⟨∇_X ν_out, Y⟩`.
- `lee-riemannian2018` and `lee-smooth2012`: Springer DOIs, paywalled, recorded uncertified
  and cited by locator only.
- `sharafutdinov1994`: the DOI landing page is on a de Gruyter host in no licence class; a web
  search found only an unverified third-party copy, which I did not use. Recorded by hand as
  uncertified with its DOI, and marked optional: Paternain–Salo–Uhlmann Chapter 3 is the
  certified source for the same material (compact non-trapping manifolds with strictly convex
  boundary). Because the brief needs no statement that only Sharafutdinov supplies, I did not
  park the job on it; the service's `[[missing]]` entry for it and the stale one for the book
  (written before its author-page copy was found) were removed.

## Notes for the design

- The merge order places the roadmap after SmoothBundlesConnections and before PositiveMass.
- The acceptance test should be the closed unit ball (`II` equals the induced metric) and the
  disc with the conformal metric `e^{−2|x|²} g_eucl` (strictly concave), which together pin the
  sign and the dependence on the metric.
- No fetched text contained instructions; nothing suspicious to report.
