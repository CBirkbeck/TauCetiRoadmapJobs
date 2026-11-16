# PKG-RiemannianManifoldsWithConvexBoundary

Package written from the accepted design (review round 17, accepted, no findings). Deliverables:
`packages/RiemannianManifoldsWithConvexBoundary/README.md`, `Suggested.lean`, `metadata.toml`
(`topic = "math.DG"`); `sources.toml` unchanged (every cited work was already recorded);
`design/plan.json` unchanged (`gaps: []`, no supplier gap is needed).

## Headline theorems

All seven end theorems of the design are statable at the pins and are stated; there is no
"not statable" item.

| Headline (README) | Status | Lean name |
|---|---|---|
| Hessian characterisation of strict convexity (2.2) | stated | `isStrictlyConvexAt_iff_hessian_neg` |
| Realisation of every Hausdorff second-countable `(M, g)` as a regular domain, compact and connected refinements (3.5) | stated | `exists_isSmoothEmbedding_regularDomain` |
| Second-order leaving of tangent geodesics (4.2) | stated, intrinsic | `not_exists_isGeodesicCurveOnFrom_of_isStrictlyConvexAt` |
| No interior tangency (4.2) | stated, intrinsic | `mem_interior_of_isGeodesicCurveOn` |
| Convexity functions near a strictly convex boundary point (4.5) | stated | `exists_convexityFunction` |
| Regularity of the exit time: smooth off the glancing set, continuous (5.4) | stated on `TM` | `contMDiffOn_exitTime` |
| `σ` smooth with `Xσ = −2` (hence `τ̃` smooth on `∂SM`) (5.4) | stated on `TM` | `exists_contMDiff_eq_exitTime_sub_exitTime_neg` |
| Proposition 3.3.1: non-trapping ⇔ `X` surjective ⇔ some `Xf > 0` (5.5) | stated on `TM` | `isNonTrapping_tfae` |
| Scattering relation: involution, fixed points `∂₀SM`, exchanges `∂±` (5.6) | stated on `TM` | `scatteringRelation_involutive` |
| Scattering relation is smooth (with the involution: a diffeomorphism of `∂SM`) (5.6) | stated on `TM` | `exists_contMDiffOn_eq_scatteringRelation` |

Definitions added only to make these statable (all with real bodies on native carriers):
`boundaryTangentSpace` (range of `dι_q` for Tau Ceti's boundary atlas), `IsBoundaryDefiningFunctionOn`,
`secondFundamentalForm` (`−Hess x⁰/|dx⁰|` for the normal coordinate of the preferred chart),
`IsStrictlyConvexAt`, `IsStrictlyConvexBoundary`, `IsStrictlyConcaveLevelSetAt`, `IsGlancing`,
`exitTime`, `IsNonTrapping`, `geodesicEndpoint`, `scatteringRelation`. No sorry'd data, no
`set_option`, no `lemma`, no `#check`.

Why the Layer 5 statements are on `TM`: `SM` and `∂SM` have no manifold structure at the pins (the
tangent bundle of a manifold with boundary is modelled on `ModelProd`, outside Tau Ceti's `𝓡∂`
boundary theory; `TauCeti.sphereBundleChartedSpace` assumes `[I.Boundaryless]`, checked in
`TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Sphere.lean` line 135). Tau Ceti's
`TauCeti.Manifold.geodesicSpray` and `TauCeti.Manifold.IsGeodesicCurveOnFrom` are defined for every
model with corners, so the statements are intrinsic: smoothness on `SM ∖ ∂₀SM` of the degree `−1`
homogeneous `τ` is smoothness on the open cone of nonzero non-glancing vectors; smooth functions on
`SM` are restrictions of smooth functions on `TM`. These are equivalent readings, not weakened
stand-ins; the README states both readings at 5.4–5.6.

## Corrections and changes relative to the design

- 1.1: `T_q∂M` is now the definition `boundaryTangentSpace`; added a naturality bullet and three
  Checks (half-plane: kernel of `dx⁰` versus the wrong coordinate `dx¹`; disc at `(0, −1)`:
  `(t, 1)` inward, `(t, −1)` outward; `[0, 1]`: zero space). `*Needs:*` adds
  `TauCeti.boundaryChartedSpace`.
- 1.4: "bilinear" is now an API claim (the Lean form is a function on `T_q∂M × T_q∂M`).
- 2.2: "open neighbourhood `U`" (the Lean predicate carries `IsOpen U`).
- 3.2: the predicate includes `dx_y ≠ 0`; "strictly concave on `U`" rephrased accordingly.
- 3.5: stated as a smooth isometric embedding `j` onto `{ρ̃ ≥ 0}` (Mathlib
  `Manifold.IsSmoothEmbedding`, Tau Ceti `TauCeti.IsRegularValue`), equivalent by 3.1 and the
  inverse function theorem to the design's diffeomorphism onto the regular domain; one `M̃` serves
  for the compact and compact-connected refinements; `M̃` lives in the universe of `M`.
- 4.2: added the intrinsic readings (no geodesic of `(M, g)` on `[0, ε)` with nonzero tangent
  initial velocity; no interior tangency) and the statement that both hold for every `(M, g)` of
  the Conventions without Hausdorff or countability hypotheses (local computation with `ρ = x⁰`).
- 4.5: hypothesis restated on `N` as strict concavity at `q` of the level set of `−ρ`
  (equivalent, by 3.2, to strict convexity of `∂{ρ ≥ 0}` at `q`); no regular-value hypothesis
  away from `q`, which matches Uhlmann–Vasy's local setting (`uhlmann-vasy2016` lines 25–32).
- Layer 5: preamble rewritten (intrinsic definitions on `TM`, routes through the realisation, the
  compact Hausdorff reading); 5.1 adds `IsGlancing`, the spray bullet and a Check (zero vectors at
  boundary points are glancing; a `μ = 0` definition on all of `TM` is wrong); 5.2 names
  `exitTime`/`IsNonTrapping` and displays the definition; 5.4, 5.5, 5.6 add the `TM` readings; 5.6
  adds the intrinsic definition of `α` through `geodesicEndpoint`, an API bullet and two Checks
  (the backward branch at an outward vector; the endpoint map at `T = 1`, `T = 3 > τ`, `T = 0` and
  the zero vector). `*Needs:*` of 5.1, 5.4–5.6 add 3.5 and the Tau Ceti geodesic names; the Layer 5
  Dependencies paragraph matches.
- 6.1: added the parametrised form `II_q(di u, di w) = ⟨B_i(u, w), ν_in⟩` with
  `B_i = TauCeti.secondFundamentalForm ℝ i x`, and a Check on the unit circle (`+1` with `ν_in`,
  `−1` with `ν_out`).
- Conventions: new "Lean carriers" bullet (`C¹` metric in definitions, smooth metric in every
  theorem; geodesics of `(M, g)` itself; `SM` as a set of `TM`).
- Review note applied: the two overlong source lines (design 830 and 1496) and the other long
  lines were reflowed; no line exceeds 103 characters.

What the README could not support: nothing. Notions moved down from later roadmaps: none.

## Duplication sweep and ownership

No target of the design was found elsewhere, so nothing was deleted. Checked by object:

- Pinned Tau Ceti: `TauCeti.secondFundamentalForm` and `TauCeti.shapeOperator`
  (`TauCeti/Analysis/InnerProductSpace/SecondFundamentalForm.lean` line 82, `ShapeOperator.lean`
  line 90) are the second fundamental form of a map into an inner product space, not of the boundary
  of an abstract manifold with boundary; cited in Scope, supplier contracts and 6.1. No boundary
  second fundamental form, convexity predicate, exit time, scattering relation or defining-function
  predicate exists at the pins (grep for `secondFundamentalForm`, `shapeOperator`,
  `IsStrictlyConvex`, `exitTime`, `scatteringRelation`, `boundaryDefiningFunction`,
  `OutwardUnitNormal`: only the Euclidean form and private Brauer/contour helpers). The global smooth
  collar theorem is not at the pins (`Boundary/Collar/*` stop at local collars and Brown's
  topological theorem), so GeometricTopology 1.1 remains the supplier.
- SmoothBundlesConnections B6.0 (now on main) also proves strongly convex neighbourhoods and strict
  convexity of the squared radial distance along short geodesics; it does not state Hessian
  positivity, so 6.4 keeps its coordinate estimate and consumes B6.0's uniform radii, and the Scope
  bullet says which side owns what.
- Roadmaps on main and the 454 open roadmap heads (`roadmaps grep`): "scattering relation",
  "non-trapping", "boundary defining function", "strictly convex boundary", "lens data|lens
  relation", "convexity function", "geodesic X-ray", "glancing", "Weingarten map", "mean.convex":
  no match. "exit time": DysonBrownianMotion, StochasticCalculus (stopping times) and
  SymplecticGeometry/IntegrableSystems (flow exit from a region `P`): different objects. "Fermi
  coordinates": RiemannianGeometry/Surfaces 1.2–1.3 (cited) and ComplexCurveModuli 152 (unrelated).
  RiemannianGeometry/MinimalSurfaces 10.1 consumes R5a's second fundamental form of a domain's
  boundary in a boundaryless manifold, consistent with 3.6 (unit ball `A = g_Σ`, the sign of `II`).
  Board packages: only HardSphereDynamicsAndKineticLimits mentions an exit time (a line leaving a
  ball), a different object. The overlap report lists no dropped id, no revision-only id, no other
  pull request changing this roadmap and no second copy.
- Ownership: this roadmap owns the boundary hypersurface geometry, convexity theory, exit time and
  scattering relation; no other roadmap or open head states them. No declaration of
  `Suggested.lean` reuses a fully qualified name of a roadmap I can read.

## Supplier citations (resolved this round)

Main is `51d880d`; it differs from the review's `818115d7` only in AbelianSchemesAndArithmeticModuli.
Re-read: RiemannianGeometry R5a (README 3205–3300 and Conventions 189–195), R7.9 (4469, 4588–4596),
DifferentialGeometry 12.5 (`exists_halfSpaceOutwardUnitNormal`, README 2950, Suggested.lean 1020),
SmoothBundlesConnections B6.0 (1306–1330), GeometricTopology 1.1/1.3 (788, 851), ComplexKahlerGeometry
K5a (1440, 1796), HopfRinow Layers 1–2 (264, 427), Surfaces 1.2–1.3 (296, 340). Every backticked
library name of the README (85 names) was sought at the pins by script and found; the
non-matches are mathematical symbols (`II_q`, `K_c`, `T_qM`, …) and `exists_halfSpaceOutwardUnitNormal`,
a DifferentialGeometry target cited as such. `roadmaps resolve`: no unresolved citation or Lean name.

## Binder audit

`#check @name` for all 21 declarations in one scratch file, elaborated once. Every theorem carries
exactly the hypotheses of its README statement: `[T2Space M] [SecondCountableTopology M]` on the
realisation; `[T2Space M] [CompactSpace M]` on 5.4–5.6; `[T2Space N]` on 4.5; the smooth-metric
instance on every theorem; none on the definitions beyond what their bodies use
(`IsBoundaryDefiningFunctionOn` and `boundaryTangentSpace` carry no metric). Changed after the audit:
`n` (and `E` for `IsStrictlyConcaveLevelSetAt`) made explicit where it could not be inferred.
Instance check: `inner`/`‖·‖` on `TangentSpace 𝓘(ℝ, EuclideanSpace ℝ (Fin 2)) y` resolve to the
Riemannian-bundle instances (`instInnerProductSpaceReal y`,
`instNormedAddCommGroupOfRiemannianBundle…`), not to `EuclideanSpace`'s.

Lean note: under default heartbeats Mathlib cannot synthesise
`IsContMDiffRiemannianBundle (𝓡∂ (n + 1)) 1 …` from the `∞` instance (the `LEInfty` route times
out on this model; it succeeds with 200000 synthesis heartbeats). Since `set_option` is excluded,
the section declares the `C¹` instance (what the Levi-Civita connection, Hessian and geodesics
consume) and each theorem adds the `∞` instance; the two are `Prop`s, so there is no diamond.

## Elaboration

`lake env lean packages/RiemannianManifoldsWithConvexBoundary/Suggested.lean` from the content
checkout (all imported `TauCeti.*` object files present; nothing built): exactly **10** warnings,
all `declaration uses 'sorry'` (lines 113, 150, 179, 190, 213, 276, 291, 308, 329, 347); no other
message. About 13 s.

## Dependency check

```text
depcheck: 242 roadmaps, 2262 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Suppliers: DifferentialGeometry, HopfRinow (completed),
RiemannianGeometry (with Surfaces), GeometricTopology, ComplexKahlerGeometry (main) and
SmoothBundlesConnections (main; the line above this roadmap in the merge order).

## Adversarial pass

Statements written or changed in this package. `II` sign: unit ball `II = h`.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `boundaryTangentSpace` | half-plane at `0`; disc at `(0, −1)`; `[0, 1]`; `n = 0` in general | `ker dx⁰ = span e₁`, `ker dx¹ = span e₀` (all inward/outward); `⟨(t, ±1), (0, 1)⟩ = ±1`, `⟨(1, 0), (0, 1)⟩ = 0`; range of a map from `ℝ⁰` is `0` | trichotomy holds; wrong coordinate excluded | Checks added |
| `IsBoundaryDefiningFunctionOn` | ball `1 − |x|²`; `(1 − |x|²)²`; `−(1 − |x|²)` | `dρ = −2x ≠ 0` on the sphere; `dρ = −4x(1 − |x|²) = 0` there; value `−1` at `0` | first is one, the others fail `mfderiv_ne_zero`, `pos` | none |
| `secondFundamentalForm` (chart independence) | ball radius `R` with `x⁰ = R − |x|` and `x⁰ = R² − |x|²` | `−Hess(R − |x|) = (g − x̂⊗x̂)/|x|`, on `T∂M` `h/R`, `|d| = 1`; `2h/(2R) = h/R` | equal; `⟨∇ν_in, ·⟩` gives `−h/R` | none |
| `IsStrictlyConvexAt`, `IsStrictlyConvexBoundary` | ball; exterior; half-space `n ≥ 1`; `n = 0` | `II(u, u) = |u|²`, `−|u|²`, `0`; no nonzero `u` | T, F, F, vacuously T | none |
| `isStrictlyConvexAt_iff_hessian_neg` | ball `ρ = 1 − |x|²`, `ρ' = (2 + x₁)ρ`; exterior; half-space; `n = 0` | `Hess ρ(v, v) = −2|v|²`; `Hess ρ' = (2 + x₁)Hess ρ` on `T∂M` (`ρ = dρ = 0` there), factor in `[1, 3]`; `+2|v|²`; `0`; vacuous | both sides T,T / F,F / F,F / T,T | none |
| `IsStrictlyConcaveLevelSetAt` | `x = |z|²` at `y ≠ 0` and `y = 0`; `−|z|²`; affine; dimension one | `dx = 2y`, `Hess = 2g`; `dx = 0`; `−2g`; `0`; `ker = 0` | T, F, F, F, T | `dx_y ≠ 0` inside the predicate |
| `exists_isSmoothEmbedding_regularDomain` | disc; `[0, ∞)`; `M = ∅`; doubled point | `N = S²` (double), `ρ_D` regular, compact and connected (not `ℝ²`, which fails the compact clause); `N ≅ (−1, ∞)`, `ρ = x` near `0`; `N = ∅`; no Hausdorff `N` | existential satisfiable in each admissible case; non-Hausdorff excluded by hypothesis | restated as embedding |
| `not_exists_isGeodesicCurveOnFrom_of_isStrictlyConvexAt` | disc `q = (0, −1)`, `v = (1, 0)`; half-space; exterior; `n = 0` | `|(t, −1)|² = 1 + t² > 1`; line `t e₁ ⊆ ∂M` is a geodesic of `M` (hypothesis `II = 0` fails); `(t, −1)` stays in the exterior (`II = −h`, hypothesis fails); no `v ≠ 0` | holds; the two negative controls violate only the hypothesis | intrinsic form added |
| `mem_interior_of_isGeodesicCurveOn` | disc chord `(0, −1 + t)` on `[0, 2]`; half-space boundary line; constant curve at `q ∈ ∂M`; `[0, 1]`, `γ(t) = t` | `|γ(t)| = |t − 1| < 1` for `0 < t < 2`; line in `∂M` (hypothesis fails); nonconstancy fails; `0 < t < 1` interior | holds; Hausdorff not used | intrinsic form added |
| `exists_convexityFunction` | disc `q = (0, −1)`, `x̃ = |z|² − 1 − ε|z − q|²`; exterior; dimension one; `c = 0` | hypothesis: `d(−ρ)_q = 2q ≠ 0`, `Hess(−ρ) = 2g`; `dx̃_q = (0, −2) = −dρ_q`; `Hess x̃ = (2 − 2ε)g`; `K_c ⊆ {ε|z − q|² ≤ c}`; exterior `Hess(−ρ) = −2g` fails; `K_c = {x + εx² ≤ c} ∩ [0, 1]`; `K_0 = {q}` | holds | hypothesis restated on `N` |
| `IsGlancing` | disc vectors at `(0, −1)`; interior vector; `[a, b]` | `(1, 0)` glancing, `(0, 1)` not; base not on `∂M`; only zero vectors at `a`, `b` | as stated | Check added |
| `exitTime`, `IsNonTrapping` | disc at `(0, −1)`, `v_θ`; zero vector; `S²` | `τ = 2 sin θ` on `[0, π]` (`θ = π/2`: `2`), `0` on `[−π, 0]`, `θ = 0`: `0` (no geodesic on `[0, T]`, `T > 0`); constant curve on every `[0, T]`: `∞`; `τ ≡ ∞` | disc non-trapping, `S²` not | none |
| `contMDiffOn_exitTime` | unit ball, `τ(x, v) = (−⟨x, v⟩ + √(⟨x, v⟩² + |v|²(1 − |x|²)))/|v|²`; `[a, b]` | radicand `> 0` off the glancing set (interior: `1 − |x|² > 0`; outward boundary: `⟨x, v⟩² > 0`, `τ = 0`), `= 0` at glancing vectors where `τ → 0`; `τ(x, v) = (b − x)/v`, `(x − a)/|v|` | smooth on the stated set, continuous at glancing | `TM` reading added |
| `exists_contMDiff_eq_exitTime_sub_exitTime_neg` | ball, `F(x, v) = −2⟨x, v⟩`; `[a, b]`, `F(x, v) = (a + b − 2x)v` | `σ = −2⟨x, v⟩` on `SM`; `d/dt(−2⟨x + tv, v⟩) = −2|v|² = −2`; `σ(x, ±1) = ±(a + b − 2x)`, `d/dt = −2v² = −2` | holds | `TM` reading added |
| `isNonTrapping_tfae` | ball `f = ⟨x, v⟩`; nonempty closed `M`; `M = ∅`; half-circle (`n = 0`) | `Xf = |v|² = 1`; `Xf = 0` at a maximum of `f` on compact `SM`, `1 ≠ Xu`, `τ ≡ ∞`; `SM = ∅`; `τ(θ, ±1) = π/2 ∓ θ`, `f = θ v`, `Xf = 1` | T,T,T / F,F,F / T,T,T / T,T,T | `TM` reading added |
| `geodesicEndpoint` | disc `z = ((0, −1), (0, 1))`, `T = 1, 2, 3, 0`; zero vector | `((0, 0), (0, 1))`; `((0, 1), (0, 1))`; `z` (no geodesic of `M` on `[0, 3]`; flow of `ℝ²` gives `(0, 2) ∉ M`); `z` (`{0}` not `UniqueDiffOn`); `(x, 0)` | as stated | Checks added |
| `scatteringRelation_involutive` | ball `α(x, v) = (x − 2⟨x, v⟩v, v)`; outward `v = (0, −1)` at `(0, −1)`; `[a, b]` | `⟨x − 2⟨x, v⟩v, v⟩ = −⟨x, v⟩`, so `α² = id`, fixed iff `⟨x, v⟩ = 0`, inward ↦ outward; backward branch `((0, 1), (0, −1))` equals the formula, without the sign change `((0, 1), (0, 1))` breaks `α² = id`; `α(a, +1) = (b, +1)`, `α(b, +1) = (a, +1)`, no fixed points, `∂₀SM = ∅` | holds | definition and Check added |
| `exists_contMDiffOn_eq_scatteringRelation` | ball | `(x, v) ↦ (x − 2⟨x, v⟩v, v)` is polynomial on all of `TM` | holds | `TM` reading added |
| 6.1 parametrised form | unit circle `i(θ)`; ellipse `(a cos t, b sin t)` at `t = 0` | `D²i = −i`, `⟨−i, −i⟩ = 1`, with `ν_out` `−1`; `D²i = (−a, 0)`, `⟨(−a, 0), (−1, 0)⟩ = a`, `|i′|² = b²`, `II = a/b²` (agrees with the existing vertex Check) | holds | added |
| Layer 5 preamble: compact manifold second countable | finitely many chart domains | each homeomorphic to an open subset of `ℝ^{n+1}_+`, a finite union of second-countable open sets | holds without Hausdorff | added |

## Sources

No new source; no text is missing; `scratch/needs-references.toml` was not created. Locators used in
`Suggested.lean` docstrings were re-read: `paternain-salo-uhlmann2023` lines 2795–2798 (tangent
geodesics stay outside, maximal geodesics interior) and 3114–3122 (Definition 3.3.4, Lemma 3.3.5),
`uhlmann-vasy2016` lines 25–32 (defining function convention; the theorem with `x̃(p) = 0`,
`dx̃(p) = −dρ(p)`).

No suspicious instruction was found in any text read.
