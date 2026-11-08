Verdict: design
Name: RiemannianManifoldsWithConvexBoundary
Base: none
Owner: none

## Scope

The roadmap owns the geometry of the boundary of a smooth Riemannian manifold with boundary, as a
hypersurface with its own second fundamental form, and the convexity conditions on that boundary
that geometric inverse problems, boundary rigidity and comparison geometry on domains assume.

**Setting.** `M` is a finite-dimensional, Hausdorff, second-countable smooth manifold with boundary
of dimension `n ≥ 2`, modelled on Mathlib's half-space `modelWithCornersEuclideanHalfSpace n`, so
that `∂M = I.boundary M` carries Tau Ceti's manifold structure `TauCeti.isManifold_boundary`
(a closed embedded hypersurface, boundaryless, of dimension `n − 1`). The metric `g` is a smooth
Riemannian metric on `M` in Mathlib's sense (`RiemannianBundle` with
`IsContMDiffRiemannianBundle` on the tangent bundle, `IsRiemannianManifold` wherever a distance
is used), smooth up to the boundary. Corners are excluded. Compactness, connectedness and
non-trapping are hypotheses of the individual theorems that need them, never standing
assumptions: the local statements (strict convexity at a point, the convexity function near a
point) are stated for non-compact `M`, as Stefanov–Uhlmann–Vasy's local theorem needs
(`stefanov-uhlmann-vasy2021` lines 84–92).

**Owned.**

1. The boundary as a Riemannian hypersurface: induced metric, the outward and inward unit normal
   fields `ν_out`, `ν_in = −ν_out`, boundary defining functions, the signed distance to `∂M`.
2. Extension across the boundary: an open boundaryless Riemannian manifold `(M̃, g̃)` containing
   `M` as a closed domain with `g̃|_M = g`, built on a smooth collar and Seeley extension of the
   metric coefficients; for compact `M`, a closed extension (the double). Every object below that
   is defined through `M̃` is proved independent of the extension.
3. Boundary normal (Fermi) coordinates `g = dr² + h_r` near `∂M`, with `r` the distance to the
   boundary, through the normal exponential map of `∂M` in `M̃` and the collar theorem.
4. The second fundamental form `II` of `∂M`, both sign conventions reconciled, with the ball as
   the normalisation test; the three computations (Hessian of a defining function, `∂_r h_r`,
   second derivative of `ρ` along a tangent geodesic); the conformal change law; dependence of
   `II` on the metric.
5. Convexity: strict convexity and convexity at a point and everywhere, strict concavity, their
   Hessian characterisations, openness, the uniform bound on compact strictly convex boundaries,
   tangent geodesics leaving to second order, sublevel sets of functions whose level sets are
   strictly concave from the superlevel sets (the convexity functions of Uhlmann–Vasy and
   Stefanov–Uhlmann–Vasy), and the existence of such a function near a strictly convex boundary
   point.
6. Compact manifolds with strictly convex boundary and the geodesic flow of the extension: the
   unit sphere bundle `SM` with its boundary strata `∂_± SM`, `∂_0 SM`, the exit time `τ`,
   non-trapping, continuity and smoothness of `τ`, the odd extension, the glancing-point
   asymptotics in terms of `II`, and the scattering relation `α : ∂SM → ∂SM`.
7. Examples: closed balls and smooth convex domains in `ℝⁿ`, half-spaces (convex, not strictly),
   exteriors of balls (strictly concave), small closed geodesic balls in any Riemannian manifold,
   compact subdomains of Euclidean and hyperbolic space as non-trapping examples, and a conformal
   change that makes the boundary of the unit disc strictly concave.

**Not owned.** The Gauss, Codazzi and Ricci equations and the second fundamental form of a general
isometric immersion (RiemannianGeometry R5a, imported); the collar theorem and the tubular
neighbourhood theorem (GeometricTopology Layer 1); Seeley extension of smooth functions across a
half-space boundary (ComplexKahlerGeometry K5); the Hessian, divergence theorem and outward
pointing fields (DifferentialGeometry 5.1, 12.3, 12.5); the exponential map and geodesic flow
(HopfRinow); the geodesic X-ray transform, lens and boundary rigidity, simple manifolds and
Pestov identities (future roadmaps that consume this one); mean-convexity applications to
scalar curvature (PositiveMass, PositiveScalarCurvature); manifolds with corners.

## Final targets

Notation: `(M, g)` as in the setting, `(M̃, g̃)` an extension as in T2, `∇` the Levi-Civita
connection of `g̃`, `Hess_g f = ∇df`, `ρ` a boundary defining function (T3), `⟨·,·⟩ = g`.

**T1 (boundary hypersurface and normals).** `∂M` with the structure `TauCeti.isManifold_boundary`
is a closed embedded hypersurface of `M`; the inclusion is an isometric embedding for the induced
metric; there is a unique smooth unit normal field `ν_out` along `∂M` that is outward pointing in
the sense of DifferentialGeometry 5.1, and `ν_in = −ν_out`. Locator: Lee, *Introduction to
Riemannian Manifolds*, Ch. 8 (hypersurfaces) (`lee-riemannian2018`, uncertified); the inward
normal `ν` of `paternain-salo-uhlmann2023` lines 2766–2773.

**T2 (extension across the boundary).** For `(M, g)` as above there is a boundaryless
Riemannian manifold `(M̃, g̃)` of dimension `n`, with `M ⊆ M̃` closed, `∂M` the topological
frontier of `M` in `M̃`, `g̃|_M = g`, and a smooth collar of `∂M` in `M̃` of the form
`∂M × (−1, 1)` extending a smooth collar of `M` (GeometricTopology 1.1). For compact `M` the
extension may be taken compact and connected if `M` is connected (the double). Any two
constructions of the objects T3–T6 and T8–T11 through two extensions agree on `M` and on
`∂SM`. Locator: `paternain-salo-uhlmann2023` Lemma 3.1.8, lines 2749–2762 (closed extension);
the open extension `M ⊂ M̃` of `stefanov-uhlmann-vasy2021` lines 96–97.

**T3 (boundary defining functions).** A boundary defining function is `ρ ∈ C^∞(M̃)` with
`M = {ρ ≥ 0}`, `∂M = {ρ = 0}` and `dρ ≠ 0 on ∂M`. Theorems: such `ρ` exist; the signed distance
to `∂M` (positive inside) is smooth on a neighbourhood of `∂M` in `M̃`, is a defining function
there with `∇ρ = ν_in` on `∂M`, and agrees with the intrinsic distance of `(M, g)` to `∂M` on a
neighbourhood of `∂M` in `M`; for any defining function `ρ`, `∇ρ = |dρ|_g ν_in` on `∂M`; two
defining functions differ by a smooth positive factor near `∂M`. Locator:
`paternain-salo-uhlmann2023` Lemma 3.1.10, lines 2766–2773; `uhlmann-vasy2016` lines 25–26,
134–136.

**T4 (boundary normal coordinates).** The map `(p, r) ↦ exp_p(r ν_in(p))` restricted to
`∂M × [0, ε)`, for a smooth positive `ε : ∂M → ℝ` (constant when `∂M` is compact), is a
diffeomorphism onto a neighbourhood of `∂M` in `M`, inverse to a smooth collar; in these
coordinates `r` is the distance to `∂M` and `g = dr² + h_r` with `h_r` a smooth family of
metrics on `∂M` (the Gauss lemma for the normal exponential of a hypersurface). Locator: Lee,
*Introduction to Riemannian Manifolds*, Ch. 5 (tubular neighbourhoods and Fermi coordinates)
and Ch. 6 (Gauss lemma) (`lee-riemannian2018`, uncertified); the normal gauge of
`stefanov-uhlmann-vasy2021` lines 20–22 and 220–221; the collar of `lee-smooth2012` Theorem
9.25 (uncertified), supplied by GeometricTopology 1.1.

**T5 (second fundamental form of the boundary).** For `p ∈ ∂M` and `X, Y ∈ T_p∂M`,
`II_p(X, Y) := ⟨∇_X ν_out, Y⟩`, with `ν_out` extended arbitrarily to a smooth field near `p`.
Theorems: `II` is well defined, symmetric, tensorial and smooth on `∂M`; it equals
`⟨∇_X Ỹ, ν_in⟩` for any extension `Ỹ` of `Y` tangent to `∂M`; it equals
`⟨B(X, Y), ν_in⟩` for RiemannianGeometry R5a's `B` of the inclusion `∂M → M̃`, so
`II = S_{ν_in}` in R5a's shape-operator convention; it equals the form
`Π_x(v, w) = −⟨∇_v ν, w⟩` with `ν` the inward normal of `paternain-salo-uhlmann2023` lines
2730–2737; it depends only on `g` (not on the extension). Normalisation: for the closed unit
ball in `ℝⁿ`, `II` is the induced metric of the unit sphere (R5a's sphere convention
`B = −g · position` gives `⟨B, ν_in⟩ = g` since `ν_in = −position`). Locator: Lee,
*Introduction to Riemannian Manifolds*, Ch. 8 (`lee-riemannian2018`, uncertified);
`paternain-salo-uhlmann2023` lines 2728–2739; `stefanov-uhlmann-vasy2021` line 53.

**T6 (computations).** (a) For every boundary defining function `ρ`,
`II = −(Hess_g ρ)|_{T∂M} / |dρ|_g` on `∂M`; for the signed distance the factor is 1.
(b) In boundary normal coordinates, `II = −½ ∂_r h_r |_{r=0}`. (c) For an `M̃`-geodesic `γ`
with `γ(0) = p ∈ ∂M` and `γ'(0) ∈ T_p∂M`, `(ρ∘γ)(0) = 0`, `(ρ∘γ)'(0) = 0` and
`(ρ∘γ)''(0) = −|dρ|_g(p) · II_p(γ'(0), γ'(0))`; more generally, for any `M̃`-geodesic through a
boundary point `x_0 = γ(t_0)`, `(ρ∘γ)'(t_0) = ⟨∇ρ, γ'(t_0)⟩` and
`(ρ∘γ)''(t_0) = Hess_g ρ(γ'(t_0), γ'(t_0))`. (d) Conformal change: for `ĝ = e^{2φ} g`,
`II^ĝ = e^{φ}(II − (ν_in φ) g|_{T∂M})`. Locator: `paternain-salo-uhlmann2023` Lemma 3.1.12,
lines 2781–2784 and Lemma 3.1.13, lines 2801–2809, with the proofs at lines 2810–2839; (b) and
(d) are standard computations from Lee, *Introduction to Riemannian Manifolds*, Ch. 7–8
(`lee-riemannian2018`, uncertified).

**T7 (convexity and its Hessian characterisation).** Definitions: `∂M` is strictly convex at
`p` if `II_p` is positive definite, convex at `p` if positive semidefinite, strictly concave at
`p` if negative definite; strictly convex if strictly convex at every point. Theorems: `∂M` is
strictly convex at `p` iff `Hess_g ρ` is negative definite on `T_p∂M` for one, equivalently
every, boundary defining function `ρ`; iff, in the covector form of `uhlmann-vasy2016` lines
499–503, `H_G ρ(β) = 0` implies `H²_G ρ(β) < 0` for nonzero covectors `β` at `p` (`G` the dual
metric Hamiltonian); the set of points where `∂M` is strictly convex is open in `∂M`; for
compact strictly convex `∂M` there is `c > 0` with `II ≥ c · g|_{T∂M}`; strict convexity of a
compact boundary is stable under small `C²` perturbations of `g` (openness in the metric,
`paternain-salo-uhlmann2023` lines 3093–3096). Locator: `paternain-salo-uhlmann2023` Definition
3.1.7, lines 2738–2739, and lines 2840–2841; `stefanov-uhlmann-vasy2021` lines 89–90 (strict
convexity at a point) and 93 (everywhere); `uhlmann-vasy2016` lines 499–506.

**T8 (tangent geodesics leave to second order).** If `∂M` is strictly convex at `p` and `γ` is
an `M̃`-geodesic with `γ(0) = p` and `0 ≠ γ'(0) ∈ T_p∂M`, then
`ρ(γ(t)) = −½ |dρ|_g(p) II_p(γ'(0), γ'(0)) t² + O(t³)`, so `γ(t) ∉ M` for all small `t ≠ 0`;
hence, for `∂M` strictly convex, every maximal geodesic of `M` that starts on `∂M` pointing
inward lies in the interior except at its endpoints, and no geodesic segment of positive length
in `M` is tangent to `∂M` at an interior parameter. Locator: `paternain-salo-uhlmann2023`
lines 2791–2798 and 2840–2844.

**T9 (sublevel sets and convexity functions).** For `x` smooth on an open `U ⊆ M̃` with
`dx ≠ 0`, define the level set `{x = c}` to be strictly concave from the superlevel sets at a
point if `Hess_g x` is positive definite on `ker dx` there. Theorems: if `D = {x ≤ c} ∩ U` is a
manifold with boundary `{x = c}`, its boundary is strictly convex exactly where the level set is
strictly concave from the superlevel sets, with `II = (Hess_g x)|_{ker dx} / |dx|_g`; the model
is `x = −ρ` for a boundary defining function; for `∂M` strictly convex at `p`, there is a smooth
`x̃` near `p` with `x̃(p) = 0`, `dx̃(p) = −dρ(p)`, `dx̃ ≠ 0`, whose level sets are strictly
concave from the superlevel sets, and `c_0 > 0` such that `{x̃ ≥ −c} ∩ M` is compact for
`0 ≤ c ≤ c_0` (the construction `x̃ = −ρ − ε|z − p|²` in a chart). With these definitions the
hypotheses of `stefanov-uhlmann-vasy2021` Theorem 1.1 (lines 89–95), Theorem 1.2 (lines
99–134) and Theorem 1.3 (lines 198–202) are statable in Lean; the theorems themselves are not
targets. Locator: `uhlmann-vasy2016` lines 28–30, 137–140, 507–524;
`stefanov-uhlmann-vasy2021` lines 128–129, 198–200.

**T10 (exit time on compact manifolds with strictly convex boundary).** Let `M` be compact with
strictly convex boundary, `N` a closed extension. Define `SM`, `∂SM = {(x, v) ∈ SM : x ∈ ∂M}`,
`∂_+SM` (inward pointing, `⟨v, ν_in⟩ > 0`), `∂_−SM` (outward pointing), `∂_0SM` (tangent),
the forward exit time `τ(x, v) ∈ [0, ∞]` of the `N`-geodesic `γ_{x,v}` from `M`, and
non-trapping (`τ < ∞` on `SM`). Theorems, for compact non-trapping `M` with strictly convex
boundary: `τ` is continuous on `SM` and smooth on `SM ∖ ∂_0SM`; in particular non-tangential
geodesics exit transversally and `τ` is continuous on `∂_+SM` and extends continuously (by 0)
to `∂_0SM`; the odd extension `τ̃` of `τ|_{∂_+SM}` to `∂SM` is smooth; with
`µ(x, v) = ⟨v, ν_in⟩`, the ratio `µ/τ̃` extends to a smooth positive function on `∂SM` whose
value at `(x, v) ∈ ∂_0SM` is `II_x(v, v)/2`; `τ(x, v) − τ(x, −v)` and `τ(x, v) τ(x, −v)` are
smooth on `SM`; `M` is non-trapping iff the geodesic vector field `X` is surjective on
`C^∞(SM)` iff some `f ∈ C^∞(SM)` has `Xf > 0`. Locator: `paternain-salo-uhlmann2023`
Definitions 3.1.1 and 3.1.3, lines 2659–2676; Lemma 3.2.3, lines 2865–2867; Lemma 3.2.6, lines
2896–2902; Lemma 3.2.8, lines 2935–2939; Lemma 3.2.11, lines 3027–3030; Proposition 3.3.1,
lines 3081–3085.

**T11 (scattering relation).** For compact non-trapping `M` with strictly convex boundary,
`α : ∂SM → ∂SM`, `α(x, v) = φ_{τ̃(x,v)}(x, v)` with `φ` the geodesic flow of `N`, is a
diffeomorphism, an involution, maps `∂_±SM` onto `∂_∓SM` and fixes `∂_0SM` pointwise; it is
independent of the closed extension. Locator: `paternain-salo-uhlmann2023` Definition 3.3.4 and
Lemma 3.3.5, lines 3114–3126.

**T12 (examples and dependence on the metric).** (a) The closed unit ball in `ℝⁿ` has
`II = g|_{T∂M}` and is strictly convex and non-trapping. (b) A compact domain in `ℝⁿ` with smooth
boundary that is convex has `II ≥ 0`; it is strictly convex in the sense of T7 iff its Euclidean
principal curvatures are positive, equivalently iff the local graph functions of the boundary over
their tangent planes have positive definite Hessian; compact subdomains of `ℝⁿ` and of
hyperbolic space are non-trapping. (c) A closed half-space has `II = 0`: convex, nowhere strictly
convex. (d) The closed exterior of the unit ball in `ℝⁿ` is strictly concave. (e) For any
Riemannian manifold without boundary and any point `p`, the closed geodesic ball of radius `r`
below the strong-convexity radius at `p` is a compact manifold with strictly convex boundary.
(f) Dependence on the metric: for the closed unit disc in `ℝ²` and `ĝ = e^{−2|x|²} g_{eucl}`,
T6(d) gives `II^ĝ = −e^{−1} g|_{T∂M}`, so the same domain is strictly convex for the Euclidean
metric and strictly concave for `ĝ`. Locator: `paternain-salo-uhlmann2023` Example 3.1.4, lines
2677–2680, Example 3.2.1, lines 2849–2864, and lines 307–310; (e) uses SmoothBundlesConnections
B6.0 and RiemannianGeometry R4.

## Suppliers

All on main unless stated; the new roadmap sits in the merge order after
SmoothBundlesConnections and before PositiveMass.

- **HopfRinow** (Completed), Layers 0–4: Levi-Civita connection, covariant differentiation
  along curves, geodesic spray and flow, `TauCeti.Manifold.riemannianExp` on its natural domain,
  normal balls, Gauss lemma, Riemannian distance. All of it is boundaryless (`[I.Boundaryless]`),
  which is why every geodesic statement here lives on the extension `M̃` of T2.
- **RiemannianGeometry** R1 (curvature conventions), R5a (immersion `B`, `S`, Gauss–Codazzi
  with pinned signs; T5 identifies `II` with `⟨B, ν_in⟩` for the inclusion `∂M → M̃`), R4
  (comparison for T12(e)), R6 (normal exponential on its natural domain; T4 uses the hypersurface
  case).
- **GeometricTopology** Layer 1: `TauCeti.isManifold_boundary` (boundary as a manifold, the
  inclusion a closed embedding), 1.1 smooth collars as data and the collar theorem (Lee,
  *Introduction to Smooth Manifolds*, Theorem 9.25; its main text lists it, PR #903 specifies
  it), 1.3 gluing along the boundary (for the double in T2), 1.5 tubular neighbourhoods and the
  normal exponential of an embedding.
- **DifferentialGeometry** 5.1 (the boundary interface: `IsOutwardPointing`, outward fields),
  12.1 (boundary metrics), 12.2–12.3 (`mgradient`, `hessian`), 12.5 (the outward unit normal in
  the divergence theorem; T1's `ν_out` must be the same object).
- **ComplexKahlerGeometry** K5: extension of smooth functions across a smooth boundary by a
  collar, the half-space Seeley extension and a partition of unity (used for `g̃` in T2).
- **SmoothBundlesConnections** B6.0 (open pull request, earlier in the merge order): uniform
  normal and strong-convexity radii on compact sets (T12(e)).
- **Mathlib** (pinned): `ModelWithCorners.boundary`, `IsBoundaryPoint`, `BoundarylessManifold`
  (`Mathlib/Geometry/Manifold/IsManifold/InteriorBoundary.lean`),
  `modelWithCornersEuclideanHalfSpace`, `RiemannianBundle`, `IsContMDiffRiemannianBundle`,
  `IsRiemannianManifold`, `leviCivitaConnection`. **Tau Ceti** (pinned):
  `TauCeti.isManifold_boundary`, the collar charts `TauCeti.collarChartedSpace` and
  `TauCeti.isManifold_collarChartedSpace`, `TauCeti.IsCollar`,
  `TauCeti.EuclideanHalfSpace.boundaryCollar`, `TauCeti.Manifold.riemannianExp` and
  `expDomain`, `TauCeti.inducedRiemannianMetric`, the open-submanifold metric restriction.

## Consumers

- **PositiveMass** (PR #956), 5.1–5.2: the mean curvature of a compact boundary for the inward
  normal, currently compared by hand with R5b's `A(X, Y) = ⟨B(X, Y), ν⟩`; T1 and T5 give it the
  boundary normal and `II` directly, with the sign fixed by the ball.
- **PositiveScalarCurvature** and **Yamabe** (main): boundary problems on compact manifolds with
  boundary (mean-convex boundaries, Yamabe-type problems on domains) once they are planned; the
  collars and metric extension of T2 also serve PositiveScalarCurvature's bordism collars.
- Future roadmaps on the geodesic X-ray transform, lens and boundary rigidity, and simple
  manifolds (`stefanov-uhlmann-vasy2021`, `uhlmann-vasy2016`, `paternain-salo-uhlmann2023`
  Chs. 4–5): they need exactly T7–T11 to state their theorems.
- **LorentzianGeometry** (design on the board) allows manifolds with boundary; T2–T4 (collar,
  defining functions, boundary normal coordinates) are reusable there, its own signature-specific
  hypersurface theory is not.

## Sources

Manifest `packages/RiemannianManifoldsWithConvexBoundary/sources.toml`.

- `stefanov-uhlmann-vasy2021`: P. Stefanov, G. Uhlmann, A. Vasy, *Local and global boundary
  rigidity and the geodesic X-ray transform in the normal gauge*, Ann. of Math. 194 (2021), no.
  1; read as arXiv:1702.03638v3 (open repository, certified). Theorems 1.1–1.4 (lines 89–134,
  198–214) are the statements whose hypotheses T7 and T9 make statable.
- `uhlmann-vasy2016`: G. Uhlmann, A. Vasy, *The inverse problem for the local geodesic ray
  transform*, Invent. Math. 205 (2016); read as arXiv:1210.2084v1 (open repository, certified).
  Section 1 (lines 15–70, 133–142) and Section 3 (lines 498–524): defining functions, the
  covector form of strict convexity, the convexity function `x̃`.
- `paternain-salo-uhlmann2023`: G. P. Paternain, M. Salo, G. Uhlmann, *Geometric Inverse
  Problems with Emphasis on Two Dimensions*, Cambridge Studies in Advanced Mathematics 204
  (2023); the authors' copy on G. Uhlmann's publications page, posted with the publisher's
  personal-use notice (author page, certified; its numbering is the published one). Chapter 3,
  Sections 3.1–3.3 (lines 2640–3126) are the primary source for T2, T3, T5–T8, T10, T11.
- `lee-riemannian2018`: J. M. Lee, *Introduction to Riemannian Manifolds*, 2nd ed., GTM 176
  (2018), Ch. 5 (Fermi coordinates), Ch. 6 (Gauss lemma), Ch. 8 (hypersurfaces, second
  fundamental form); paywalled, uncertified, cited by locator.
- `lee-smooth2012`: J. M. Lee, *Introduction to Smooth Manifolds*, 2nd ed., GTM 218 (2012),
  Theorem 9.25 (collar neighbourhoods), Theorem 9.24 (boundary flowout); paywalled, uncertified;
  the same theorem is already supplied by GeometricTopology 1.1, whose references folder holds a
  fair-use extract.
- `sharafutdinov1994`: V. A. Sharafutdinov, *Integral Geometry of Tensor Fields*, VSP (1994),
  Ch. 4 (compact dissipative Riemannian manifolds); paywalled, uncertified, optional: everything
  the target cites it for is in `paternain-salo-uhlmann2023` Ch. 3.

No text is missing: every statement in T1–T12 has a certified source or is a standard textbook
fact, so no `needs-references.toml` was left for this job.

## Risks

- **Geodesics only exist boundaryless in the library.** Tau Ceti's exponential map and flow
  assume `[I.Boundaryless]`, so T2 (extension of `(M, g)` across `∂M`) is the structural
  foundation of everything from T4 on. It needs three pieces that are specified but not yet
  built: GeometricTopology 1.1's smooth collar theorem (Tau Ceti has the collar *charts*
  `collarChartedSpace`, not the existence theorem), GeometricTopology 1.3's gluing for the
  double, and ComplexKahlerGeometry K5's Seeley extension transported to half-space charts with
  a partition of unity, keeping positive definiteness near `∂M`. If K5's item stays Euclidean,
  the design must own the manifold version.
- **Two distances.** Mathlib's `IsRiemannianManifold` ties the distance of `M` to lengths of
  paths in `M`; the distance of `M̃` is different in general. T3's claim that the signed distance
  agrees with the intrinsic distance to `∂M` near `∂M` must be proved (short minimising paths
  stay in the collar), not assumed.
- **The unit sphere bundle with boundary.** `SM` is a manifold with boundary `∂SM` and the
  smoothness statements of T10 at glancing points use an implicit-function argument with the
  Hessian computation of T6(c) (`paternain-salo-uhlmann2023` Lemmas 3.2.9–3.2.10, lines
  2955–2983). The design must choose a carrier for `SM` that Tau Ceti's sphere bundle and
  boundary interfaces support.
- **Sign conventions.** Three conventions meet here: R5a's `B` and `S_η` with the sphere
  normalised by `B = −g · position`, Paternain–Salo–Uhlmann's `Π = −⟨∇_v ν, w⟩` with the inward
  normal, and the Hessian form `−Hess ρ` of Uhlmann–Vasy. T5–T6 reconcile them; the ball must be
  the acceptance test in `Suggested.lean`, and PositiveMass's inward-normal mean curvature must
  come out as `tr II/(n−1)` with `H = 1` on the unit sphere.
- **Paywalled textbooks.** Both Lee volumes are uncertified. Every statement that cites them
  also has a certified locator in `paternain-salo-uhlmann2023` or is a standard computation; the
  design should not rely on a Lee theorem number it cannot check beyond those already recorded by
  GeometricTopology's extract (Theorem 9.25).
- **Generality creep.** The inverse-problem sources work in dimension `n ≥ 3` or on surfaces
  (`n = 2`); the roadmap states everything for `n ≥ 2`, and `Suggested.lean` must not import
  a dimension restriction from them.
