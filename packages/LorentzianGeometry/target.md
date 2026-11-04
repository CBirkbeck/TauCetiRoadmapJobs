Verdict: design
Name: LorentzianGeometry
Base: none
Owner: none

## Scope

The first Lorentzian roadmap of the library: Lorentzian scalar products and their causal
cones, Lorentzian metrics of finite regularity on manifolds with boundary or corners, time
orientation and spacetimes, extensions of Lorentzian manifolds, and the causal type of
hypersurfaces with the theory of null hypersurfaces up to their null generators and the
identification of the characteristic hypersurfaces of the wave operator. It is a definitions-and-
foundations roadmap: everything a later roadmap on causality theory, on the Einstein equations,
or on the acoustical geometry of compressible flow needs to *state* its theorems, proved at the
generality the library needs.

Standing generality (binding for the design):

- **Dimension** `n + 1 ≥ 2` throughout; nothing is specialised to four dimensions.
- **Signature convention** `(−, +, …, +)`: a Lorentzian scalar product is a nondegenerate symmetric
  bilinear form of index 1 (one negative direction, `QuadraticForm.sigNeg = 1`), timelike means
  `b(v, v) < 0`. RelativisticQuantumFieldTheory (PR #1772) and LocalVariationalFieldTheory
  (PR #916) use `(+, −, −, −)` on fixed `ℝ⁴`; the roadmap records the sign-flip comparison
  `g ↦ −g` once, as a Check, and never adopts the other convention.
- **Manifolds** are Mathlib manifolds over an arbitrary `ModelWithCorners ℝ E H` with `E`
  finite-dimensional, Hausdorff and second countable, so boundary and corners are allowed
  everywhere a statement makes sense; theorems that need the boundary to be a manifold (the
  half-space model, DifferentialGeometry's convention) or need boundarylessness say so.
- **Regularity classes** `ℛ ∈ {C^∞, C^k (k ∈ ℕ), C^{k,α} (k ∈ ℕ, 0 < α ≤ 1)}` for the metric, defined
  through the chart coefficients and proved independent of the chart; the Levi-Civita
  connection needs `k ≥ 1`, the curvature tensors `k ≥ 2`, geodesic uniqueness `C^{1,1}`, and
  every theorem carries the least class the proof needs. `C^0` metrics are first-class objects
  (time orientation, causal character, extensions), because the consumers below are stated for
  continuous metrics.
- **Curves** are piecewise `C¹` with one-sided tangents; the locally Lipschitz causal curves of
  the low-regularity causality literature are *not* owned here (they belong to the causality
  Part II, see Consumers), but the definitions are written so that they can be added without
  change.

Owned, in four layers (the design fixes the exact numbering):

- **L0, Lorentzian linear algebra.** Lorentzian scalar products on a real vector space of
  dimension `n + 1 ≥ 2`; timelike, null, causal, spacelike vectors; the timecone theorem; the
  classification of hyperplanes `ker ξ` through `b⁻¹(ξ, ξ)`; orthogonal complements of timelike
  and null vectors; the reverse Cauchy–Schwarz inequality for causal vectors in one cone as a
  tool. Existence of orthonormal bases of the right signature is Mathlib's
  (`QuadraticForm.equivalent_one_neg_one_weighted_sum_squared`, `QuadraticForm.sigPos/sigNeg`).
- **L1, Lorentzian manifolds.** Lorentzian metrics of class `ℛ` as sections of the bundle of
  symmetric bilinear forms on `TM` (fibre `T_xM →L[ℝ] T_xM →L[ℝ] ℝ`, as the completed HopfRinow
  roadmap models nondegenerate metrics; Mathlib has no `Sym² T*M`) with a Lorentzian scalar
  product at every point; causal character of vectors, vector fields and piecewise `C¹` curves;
  the Levi-Civita connection of a `C^k` metric, `k ≥ 1`, with `C^{k−1}` Christoffel symbols and
  its chart transformation law, agreeing on smooth metrics with the smooth nondegenerate
  supplier of HopfRinow Layer 1 and, on positive-definite smooth metrics, with Mathlib's
  `CovariantDerivative.leviCivitaConnection`; the Riemann, Ricci and scalar curvature of a `C^k`
  metric, `k ≥ 2`, with RiemannianGeometry R1's sign conventions; geodesics as solutions of the
  geodesic equation and their uniqueness for `C^{1,1}` metrics; the examples Minkowski space,
  double null metrics and the acoustical metric.
- **L2, time orientation, spacetimes, extensions.** Continuous timelike vector fields,
  their equivalence `g(T, T') < 0`, time orientations as equivalence classes,
  time-orientability, the two-orientations theorem on connected manifolds, future- and
  past-directed causal vectors and curves, time-oriented Lorentzian manifolds, spacetimes;
  `C^k`-extensions of a connected Lorentzian manifold without boundary and
  `C^k`-(in)extendibility, with the monotonicity in `k` and the standard example of a
  `C^0`-extendible, `C²`-inextendible manifold as a Check.
- **L3, hypersurfaces.** Spacelike, timelike and null `C¹` hypersurfaces defined pointwise
  through the conormal, the equivalent descriptions of null hypersurfaces, null normals, optical
  functions and their level sets, the pregeodesic equation `∇_L L = κ L` of a null normal and
  `∇_L L = 0` for `L = −grad u`, null generators; the wave operator `□_g` of a `C¹` metric, its
  principal (top-order) symbol and characteristic covectors, and the identification of
  characteristic hypersurfaces with null hypersurfaces.

Not owned (boundaries):

- Causality theory proper: chronological and causal futures `I^±`, `J^±`, the causal
  conditions, global hyperbolicity, Cauchy surfaces and horizons, domains of dependence,
  achronal sets, limit-curve theorems, the locally Lipschitz causal curves of
  Chruściel–Grant. These are the natural Part II (`LorentzianGeometryPartII`, causality).
- The Einstein equations, energy conditions, Raychaudhuri and the null expansion, Gauss–Codazzi
  along null hypersurfaces, trapped surfaces, singularity theorems, and inextendibility
  *theorems* (Sbierski's Schwarzschild theorem): later roadmaps that consume this one.
- The Lorentz and Poincaré groups and their representations: NoncompactQuantumSymmetry
  (PR #1015) Layer 7; the Lorentzian Clifford algebra `realCliffordForm 3 1` and
  `Spin(3,1) ≃ SL₂(ℂ)`: pinned Tau Ceti.
- Field theory on fixed Minkowski space (Green operators, Wightman fields):
  RelativisticQuantumFieldTheory (PR #1772); Lagrangian variations of a Lorentzian metric:
  LocalVariationalFieldTheory (PR #916) LVF6.
- The compressible Euler theory of the acoustical metric (domains of dependence of a solution,
  developments, characteristic boundaries): `TARGET-CompressibleEulerEquations` (#6000), which
  names this target as its supplier of causal character and null hypersurfaces. This roadmap
  only proves that the acoustical form is a Lorentzian metric and records it as an example.
- Riemannian geometry (positive-definite metrics, distance, Hopf–Rinow, comparison): on main and
  completed; the smooth nondegenerate Levi-Civita supplier of HopfRinow Layer 1 is consumed,
  never re-planned.

## Final targets

Each is stated with its hypotheses; locators are to the recorded sources (paywalled ones by
locator alone, `uncertified`). `b` is a Lorentzian scalar product on `V`, `dim V = n + 1 ≥ 2`;
`(M, g)` a Lorentzian manifold over a model with corners, Hausdorff, second countable.

1. **Timecones.** The set of timelike vectors of `(V, b)` is the disjoint union of two nonempty
   open convex cones, exchanged by `v ↦ −v`; timelike `v, w` lie in the same cone iff
   `b(v, w) < 0`; every nonzero causal vector lies in the closure of exactly one cone, and the
   closure of a cone meets the closure of the other only in `0`. [O'Neill 1983, Ch. 5, the
   timecone lemmas (Lemma 26 and its neighbours), uncertified; Beem–Ehrlich–Easley 1996,
   Ch. 2, uncertified; Chruściel 2011, `chrusciel2011` lines 84–98 (two components, convexity,
   same cone iff `g(X, Y) < 0`); Minguzzi 2019, `minguzzi2019` §1.3 at lines 295–312 (causal,
   timelike, lightlike, null, spacelike; the two cones); Minguzzi 2019 (cone structures),
   `minguzzi2019cone` lines 236–244.]
2. **Hyperplanes.** For `ξ ∈ V^* ∖ 0` and `W = ker ξ`: `W` is spacelike (`b|_W` positive
   definite) iff `b⁻¹(ξ, ξ) < 0`, timelike (`b|_W` Lorentzian) iff `b⁻¹(ξ, ξ) > 0`, null
   (`b|_W` degenerate) iff `b⁻¹(ξ, ξ) = 0`; `W` is null iff it contains a null vector but no
   timelike vector, and then its null vectors form a single line `W ∩ W^⊥`. [O'Neill 1983,
   Ch. 5, uncertified; Galloway 2004, `galloway2004` lines 174–182 (one-dimensional radical,
   tangent vectors not parallel to `K` are spacelike).]
3. **Metrics of class ℛ.** For a `C^∞` manifold `M` over a model with corners the class `ℛ` of a
   section of symmetric bilinear forms on `TM` is independent of the chart; a Lorentzian metric
   of class `ℛ` is such a section, of class `ℛ`, Lorentzian at every point; the causal
   character of a `C^0` vector field is locally constant on connected sets where it is timelike
   or spacelike; on a connected `M` the index of `g` is constant. [Minguzzi 2019,
   `minguzzi2019` §1.5 at line 376 (manifolds) and §1.7 at lines 439–452 (continuity of the
   cone bundle; local timelike fields from a chart); Chruściel 2011,
   `chrusciel2011` lines 118–120 (`(M, g)^{C^k}`); Hawking–Ellis 1973, §2.6, uncertified.]
4. **Levi-Civita connection at finite regularity.** For `g` of class `C^k`, `k ≥ 1`, there is a
   unique torsion-free `g`-compatible connection on `C¹` vector fields; its Christoffel symbols
   are `C^{k−1}` and given by the usual formula; for `g` smooth it is the connection of
   HopfRinow Layer 1 (nondegenerate supplier), and for `g` smooth positive definite it is
   Mathlib's `leviCivitaConnection`. For `k ≥ 2` the Riemann, Ricci and scalar curvatures exist
   with the transformation laws and symmetries of RiemannianGeometry R1 (Lorentzian signature
   changes no sign convention there). [O'Neill 1983, Ch. 3 (the semi-Riemannian connection and
   curvature), uncertified; Chruściel–Grant 2012 and Minguzzi 2019 for the regularity
   bookkeeping.]
5. **Geodesic uniqueness for `C^{1,1}` metrics.** For `g ∈ C^{1,1}` two geodesics with the
   same initial point and velocity agree on their common domain; the geodesic equation is a
   locally Lipschitz ODE on `TM` (Mathlib's `ODE_solution_unique`). [Minguzzi 2019 (cone structures), `minguzzi2019cone` lines 81–92 (`C^{1,1}` is the
   optimal class for existence and uniqueness of geodesics); Minguzzi 2019, `minguzzi2019`
   lines 7421–7422 (convex neighbourhoods exist for `C^{1,1}` metrics); Chruściel–Grant 2012,
   `chruscielgrant2012`, introduction.]
6. **Two time orientations.** Equivalence of continuous timelike vector fields by
   `g(T, T') < 0` is an equivalence relation; `(M, g)` is time-orientable iff a continuous
   timelike vector field exists; a connected time-orientable Lorentzian manifold with `C^0`
   metric has exactly two time orientations. Future- and past-directed causal vectors and
   piecewise `C¹` causal curves are well defined; a spacetime is a connected time-oriented
   Lorentzian manifold. [Sbierski 2018, `sbierski2018` lines 263–268 and Definitions 2.1–2.2
   (lines 269–280); Chruściel 2011, `chrusciel2011` lines 99–120 (propagation of a local
   orientation, exactly two choices, Definition 2.1.1) and Proposition 2.1.3 at lines 163–171;
   Chruściel–Grant 2012, `chruscielgrant2012` line 73 and lines 137–138; Minguzzi 2019,
   `minguzzi2019` §1.7 at lines 439–462 (time orientability, the Geroch double cover);
   Minguzzi 2019 (cone structures), `minguzzi2019cone` lines 240–244; Hawking–Ellis 1973, §6.1, uncertified;
   Wald 1984, §8.1, uncertified.]
7. **Extensions.** For a connected Lorentzian manifold `(M, g)` without boundary of class `C^k`
   and `0 ≤ j ≤ k`: a `C^j`-extension is a smooth embedding `ι : M → M̃` onto a proper open
   subset of a connected Lorentzian manifold `(M̃, g̃)` of the same dimension with `g̃ ∈ C^j` and
   `ι^* g̃ = g`; `C^j`-extendible implies `C^i`-extendible for `i ≤ j`; an extension can be
   chosen time-oriented when `M` is (as a Check, through the time-orientable double cover of
   Chruściel 2011, `chrusciel2011` Remark 2.1.2 at lines 121–131, or recorded as a later target
   if the cover is not built). The manifold `((0, ∞) × ℝ, e^{2√t}(−dt² + dx²))`
   is `C^0`-extendible to `[0, ∞) × ℝ` and `C²`-inextendible (Check). [Sbierski 2018,
   `sbierski2018`, Definition 2.15 at lines 475–481 and §1.1 lines 106–119; Dafermos–Luk 2017,
   `dafermosluk2017`, §1.1.4 lines 366–383.]
8. **Null hypersurfaces.** For a `C¹` embedded hypersurface `H ⊆ M` with `g ∈ C^0` the
   following are equivalent at `p ∈ H`: the conormal of `H` at `p` is null; `T_pH` contains a
   null vector but no timelike vector; the induced form `g|_{T_pH}` is degenerate, with radical
   a null line `L_p ⊆ T_pH`. A null hypersurface admits locally a nowhere-vanishing null normal
   `L` (a `C^0` section of `TH` spanning the radical). An optical function `u : U → ℝ` of class
   `C¹` with `g⁻¹(du, du) = 0` and `du ≠ 0` has null level sets with null normal `−grad u`.
   [Galloway 2004, `galloway2004` lines 174–182; Kupeli 1987, uncertified; O'Neill 1983,
   Ch. 5, uncertified; Luo–Yu 2023, `luoyu2023` lines 1005–1008 (`L` generating the null
   geodesics of the level sets `C_u` of the acoustical function `u`).]
9. **Null generators.** For `g ∈ C¹`, a `C²` null hypersurface and a `C¹` null normal `L`,
   `∇_L L = κ L` for a continuous function `κ` on `H`; hence the integral curves of `L` are
   reparametrised null geodesics, the null generators, and `H` is ruled by them; for
   `L = −grad u` with `u ∈ C²` an optical function, `∇_L L = 0`, so the generators are affinely
   parametrised null geodesics. [Galloway 2004, `galloway2004` Proposition 3.1 at lines 183–194 (`∇_K K = λK`, null
   geodesic generators); Christodoulou 2007, Ch. 1–2, uncertified; Luo–Yu 2023 II, `luoyu2023b`
   lines 331–332 (rarefaction fronts are ruled by null geodesics of the acoustical metric).]
10. **Characteristic hypersurfaces of `□_g`.** For `g ∈ C¹` define `□_g u = g^{ab}∇_a∇_b u`
    on `C²` functions, its top-order symbol `σ(x, ξ) = g_x⁻¹(ξ, ξ)` and characteristic
    covectors `σ(x, ξ) = 0`, `ξ ≠ 0`; a `C¹` hypersurface is characteristic for `□_g` iff it is
    null; for smooth `g` the symbol agrees with PseudodifferentialOperators P1.0's homogeneous
    principal symbol (Check). [Christodoulou 2007, Ch. 1, uncertified;
    Luo–Yu 2023, `luoyu2023` line 95 (the acoustical metric and the wave equation it governs)
    and lines 422–424 (characteristic hypersurfaces are the null hypersurfaces of the
    acoustical metric); Luo–Yu 2023 II, `luoyu2023b` lines 211–214 and 418; Hawking–Ellis 1973,
    Ch. 2, uncertified.]

Checks (special cases, acceptance only): Minkowski space `(ℝ^{n+1}, η)` is a spacetime with
exactly two time orientations and `t = const` spacelike, `{t = |x|} ∖ {0}` null with radial null
generators and `u = t − |x|` optical away from the axis; the double null metric
`−2Ω²(du ⊗ dv + dv ⊗ du) + γ` has `u` and `v` optical and null level sets; the acoustical
form `−c² dt² + Σ(dx^i − v^i dt)²` is Lorentzian for `c > 0` with `∂_t + v·∇` timelike; the sign
flip `g ↦ −g` turns the library's convention into RelativisticQuantumFieldTheory's
`diag(+1, −1, −1, −1)` with timelike cones unchanged.

## Suppliers

- **Mathlib (pinned).** Manifolds with corners: `ModelWithCorners`, `ModelWithCorners.boundary`
  and `interior`, `BoundarylessManifold`, `modelWithCornersEuclideanQuadrant`
  (`Mathlib/Geometry/Manifold/IsManifold/InteriorBoundary.lean`, `Instances/Real.lean`);
  finite-order `ContMDiff` and `ContMDiffSection`; the Hom bundle `Bundle.ContinuousLinearMap`;
  `QuadraticForm.sigPos`, `sigNeg` and Sylvester's law
  (`Mathlib/LinearAlgebra/QuadraticForm/{Signature,Real}.lean`);
  `LinearMap.BilinForm.Nondegenerate`; convex cones (`Mathlib/Analysis/Convex/Cone`);
  `HolderWith`/`HolderOnWith` and `Mathlib/Analysis/Calculus/ContDiffHolder`;
  `ODE_solution_unique*` (`Mathlib/Analysis/ODE/ExistUnique.lean`) and
  `Mathlib/Geometry/Manifold/IntegralCurve`; `CovariantDerivative.leviCivitaConnection`,
  `IsLeviCivitaConnection`, `IsMetricCompatible` for the positive-definite comparison.
- **Tau Ceti (pinned).** `TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/{Basic,Regularity}.lean`
  (Koszul formula, regularity of the Riemannian connection), the Riemannian geodesic files, and
  `TauCeti.realCliffordForm 3 1` for the four-dimensional Minkowski Check only.
- **HopfRinow (Completed) Layer 1, nondegenerate supplier.** Smooth symmetric nondegenerate
  metrics, musical isomorphisms, signature, families, the Levi-Civita connection with Christoffel
  symbols and the positive-definite comparison; `Completed/HopfRinow/COMPLETION.md` records them
  at `VectorBundle/NondegenerateMetric/*` and `CovariantDerivative/LeviCivita/Nondegenerate/*`
  on Tau Ceti main. ⚠ The pinned Tau Ceti predates them (see Risks).
- **DifferentialGeometry (main).** Conventions for boundary and corners (its "Boundary and
  corners" section), Layer 0 tensor and alternating bundles over any model with corners,
  Layer 2 orientations (the model for time orientations), Layer 12 metric conventions
  (`mgradient`, `hessian`, `laplaceBeltrami`), which `grad u` and `□_g` must specialise to on
  positive-definite metrics.
- **RiemannianGeometry (main).** R1 curvature carriers and sign conventions (Riemann, Ricci,
  scalar; the Ricci identity), R4 for the hyperboloid model as a consumer-side Check.
- **PDE (main).** Lane A item 7, Hölder spaces `C^{k,α}(Ω)`, for the `C^{k,α}` class of chart
  coefficients.
- **PseudodifferentialOperators (main).** P1.0 and §4.2, the homogeneous principal symbol on
  `T^*M` of a smooth differential operator, for the comparison Check in target 10 only.

Merge order: after PDE, DifferentialGeometry, RiemannianGeometry and PseudodifferentialOperators
(all on main) and the completed HopfRinow; before `CompressibleEulerEquations` and before any
roadmap that consumes a Lorentzian manifold.

## Consumers

- `TARGET-CompressibleEulerEquations` (#6000): the acoustical metric of a `C¹` state, causal
  and null vectors, future-directed causal curves, null hypersurfaces and null generators of the
  characteristic boundary; it names this target as its supplier.
- A causality Part II (`LorentzianGeometryPartII`): `I^±`, `J^±`, causal conditions, global
  hyperbolicity, Cauchy horizons, domains of dependence, low-regularity causal curves
  (Chruściel–Grant, Minguzzi §2 onwards, O'Neill Ch. 14, Hawking–Ellis Ch. 6, Wald Ch. 8).
- Future general-relativity roadmaps: the Einstein vacuum equations in double null gauge and
  spacetimes with boundary (Rodnianski–Shlapentokh-Rothman, Ann. of Math. 198 (2023), art. 3;
  An, Ann. of Math. 201 (2025), art. 3), `C^0`-extensions across Cauchy horizons (Dafermos–Luk,
  Ann. of Math. 202 (2025), art. 1), `C^0`-inextendibility (Sbierski), characteristic
  rarefaction fronts (Luo–Yu, Ann. of Math. 202 (2025), arts. 2–3).
- PositiveMass (PR #956): the spacetime side it excludes (ADM momentum, dominant energy
  condition, Jang's equation) needs these definitions.
- RelativisticQuantumFieldTheory (PR #1772), LocalVariationalFieldTheory (PR #916) LVF6,
  NoncompactQuantumSymmetry (PR #1015): their fixed Minkowski conventions can be re-read as
  instances; no change to them is required.
- SpinGeometry, SmoothBundlesConnections: Lorentzian spin structures later.

## Sources

Recorded in `packages/LorentzianGeometry/sources.toml`; keys as below.

- `minguzzi2019` — E. Minguzzi, *Lorentzian causality theory*, Living Rev. Relativ. 22 (2019),
  art. 3, §§1–2 (low-regularity Lorentzian manifolds, time orientation, causal character of
  hypersurfaces). Open access (Living Reviews, DOI 10.1007/s41114-019-0019-x); the publisher's
  open-access full text is mirrored on INSPIRE. Not on arXiv.
- `minguzzi2019cone` — E. Minguzzi, *Causality theory for closed cone structures with
  applications*, Rev. Math. Phys. 31 (2019), 1930001, §1 (`C^{1,1}` geodesics, time
  orientation, spacetimes). Open repository, arXiv:1709.06494v4.
- `chrusciel2011` — P. T. Chruściel, *Elements of causality theory*, 2011, §§1–2. Open repository,
  arXiv:1110.6706 (the issue form's arXiv:1110.0214 is a different, unrelated paper).
- `chruscielgrant2012` — P. T. Chruściel, J. D. E. Grant, *On Lorentzian causality with
  continuous metrics*, Class. Quantum Grav. 29 (2012), 145001, §1. Open repository,
  arXiv:1111.0400v3.
- `sbierski2018` — J. Sbierski, *The C⁰-inextendibility of the Schwarzschild spacetime and the
  spacelike diameter in Lorentzian geometry*, J. Differential Geom. 108 (2018), §§1–2. Open
  repository, arXiv:1507.00601v2.
- `galloway2004` — G. J. Galloway, *Null geometry and the Einstein equations*, in *The Einstein
  Equations and the Large Scale Behavior of Gravitational Fields* (Cargèse 2002), Birkhäuser
  2004, the sections on null hypersurfaces and null generators. Author page (University of
  Miami).
- `dafermosluk2017` — M. Dafermos, J. Luk, *The interior of dynamical vacuum black holes I*,
  Ann. of Math. 202 (2025), 309–630, §1.1.4. Open repository, arXiv:1710.01722v1.
- `luoyu2023` — T.-W. Luo, P. Yu, *On the stability of multi-dimensional rarefaction waves I*,
  Ann. of Math. 202 (2025), 631–752, the acoustical-geometry section. Open repository,
  arXiv:2302.09714.
- `luoyu2023b` — T.-W. Luo, P. Yu, *On the stability of multi-dimensional rarefaction waves II*,
  Ann. of Math. 202 (2025), 753–855, §1. Open repository, arXiv:2305.06308.
- `rodnianskishlapentokhrothman2023` — I. Rodnianski, Y. Shlapentokh-Rothman, *Naked
  singularities for the Einstein vacuum equations: the exterior solution*, Ann. of Math. 198
  (2023), 231–391, §1 (double null spacetimes with boundary, motivation only). Open repository,
  arXiv:1912.08478v2 (`rodnianskishlapentokhrothman2023` line 263: a 1+1-dimensional
  Lorentzian manifold with boundary).
- `an2025` — X. An, *Naked singularity censoring with anisotropic apparent horizon*, Ann. of Math.
  201 (2025), 775–908, §1 (motivation only). Open repository, arXiv:2401.02003.
- `oneill1983` — B. O'Neill, *Semi-Riemannian Geometry with Applications to Relativity*, 1983,
  Ch. 2, 3, 5, 14. Paywalled, uncertified.
- `beemehrlicheasley1996` — J. K. Beem, P. E. Ehrlich, K. L. Easley, *Global Lorentzian
  Geometry*, 2nd ed., 1996, Ch. 2–3. Paywalled, uncertified.
- `hawkingellis1973` — S. W. Hawking, G. F. R. Ellis, *The Large Scale Structure of Space-Time*,
  1973, §2.6, §6.1, Ch. 6. Paywalled, uncertified.
- `wald1984` — R. M. Wald, *General Relativity*, 1984, Ch. 8. Paywalled, uncertified.
- `kupeli1987` — D. N. Kupeli, *On null submanifolds in spacetimes*, Geom. Dedicata 23 (1987),
  33–51. Paywalled (DOI 10.1007/bf00147389), uncertified.
- `christodoulou2007` — D. Christodoulou, *The Formation of Shocks in 3-Dimensional Fluids*,
  EMS Monographs 2007, Ch. 1–2. Paywalled, uncertified.

## Risks

- **Pin gap on the nondegenerate supplier.** HopfRinow's completion audit places the smooth
  nondegenerate metric and Levi-Civita files on Tau Ceti main at commit `daa66339a578`, but the
  pinned Tau Ceti (`358314d4ab97`) has no `NondegenerateMetric` directory. `Suggested.lean` must
  therefore carry its own minimal Lorentzian-metric structure (a section of
  `T_xM →L[ℝ] T_xM →L[ℝ] ℝ`, symmetry, index-one predicate) and may not name HopfRinow's
  declarations until the pin advances; the design must state its theorems against that local
  structure and record the identification with HopfRinow as a target, not an assumption.
- **Finite regularity has no Mathlib carrier.** `ContMDiff` has orders in `ℕ∞ω`, but `C^{k,α}`
  chart coefficients and `C^k` connections (Christoffel symbols as chart data with a
  transformation law, not a `CovariantDerivative` on smooth bundles) must be built here; the
  chart-independence proofs are routine but long. Keep the smooth case identified with Mathlib's
  objects and prove the finite-regularity statements in charts.
- **Corners.** The boundary of a manifold with corners is not a manifold (DifferentialGeometry's
  warning); hypersurface statements must be made for `C¹` embedded hypersurfaces with the
  corners of `M` handled by restriction to the interior or by hypotheses. The causal cone and
  time-orientation statements need no boundary hypothesis.
- **Conventions differ across sources.** Sign of the signature, future-directed through
  `g(T, X) < 0`, the sign of `grad u` as null normal, and whether an extension keeps the time
  orientation (Sbierski's Remark 2.16, `sbierski2018` lines 485–489) vary; the design fixes one
  set and records the comparisons.
- **Paywalled sources.** O'Neill, Beem–Ehrlich–Easley, Hawking–Ellis, Wald, Kupeli and
  Christodoulou are cited by locator only; every theorem above is also covered by an open source
  (Minguzzi, Chruściel, Chruściel–Grant, Sbierski, Galloway), so no statement depends on a text
  that cannot be read. The issue form's arXiv id for Chruściel's notes was wrong and is corrected
  in the manifest.
- **Scope creep toward causality theory.** Domains of dependence and Cauchy horizons are needed
  by the Annals papers but are a Part II; the design must stop at the definitions of
  future-directed curves and null generators and not plan `I^±`/`J^±`.
