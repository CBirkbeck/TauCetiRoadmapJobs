# PORT-RiemannianManifoldsWithConvexBoundary

- Branch: `roadmap/riemannian-manifolds-with-convex-boundary`, from main `ef3d21f`.
- Head commit: `bde64ee` ("RiemannianManifoldsWithConvexBoundary: roadmap (README, Suggested.lean,
  metadata)").
- Files: `TauCetiRoadmap/RiemannianManifoldsWithConvexBoundary/README.md`,
  `TauCetiRoadmap/RiemannianManifoldsWithConvexBoundary/Suggested.lean`,
  `TauCetiRoadmap/RiemannianManifoldsWithConvexBoundary/metadata.toml` (`topic = "math.DG"`, the
  form every folder on main uses). Nothing outside the folder is touched.

## Build

`lake build TauCetiRoadmap.RiemannianManifoldsWithConvexBoundary.Suggested`:

    Build completed successfully (18390 jobs).

11 warnings, all `declaration uses 'sorry'` (lines 113, 150, 179, 190, 214, 280, 296, 313, 328,
349, 367 of `Suggested.lean`, one per theorem); no errors, no other messages.

## Gate

    gate RiemannianManifoldsWithConvexBoundary: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Dependency check (`gate --depcheck … --movable`), on the committed README:

    depcheck: 256 roadmaps, 2432 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The merge order lists this roadmap directly after its last
supplier there, SmoothBundlesConnections (lines 13–14 of the order). The same command on the
package README gives the same counts, so the edits below changed no edge. An earlier run of the
same command, before the index refresh of 08:38, printed `257 roadmaps, 2434 edges, 0 problem(s)`.

`roadmaps resolve` on the committed README: no cross-roadmap citation and no Lean name found
nowhere.

## Draft pull request body

Develop the geometry of the boundary of a smooth Riemannian manifold with boundary in Mathlib's
sense, modelled on `𝓡∂ (n+1)`: boundary defining functions, the scalar second fundamental form,
Weingarten map and mean curvature of `∂M` with their conformal change law, and strictly convex,
convex and strictly concave boundaries with their Hessian characterisations, openness and stability
under families of metrics. The roadmap realises every Hausdorff second-countable Riemannian manifold
with boundary as a regular domain `{ρ ≥ 0}` of a boundaryless Riemannian manifold (compact when `M`
is, and connected when `M` is compact and connected), studies geodesics at the boundary (tangent
geodesics leave a strictly convex boundary, nonconstant geodesics meet it only at their endpoints,
the normal exponential and signed distance of a hypersurface, boundary normal coordinates
`g = dr² + h_r`, and the convexity functions with strictly concave level sets of Uhlmann–Vasy and
Stefanov–Uhlmann–Vasy), and, on compact non-trapping manifolds with strictly convex boundary,
builds the exit time with its regularity at the glancing set, the smoothness of
`τ(x, v) − τ(x, −v)` and `τ(x, v) τ(x, −v)` with `Xσ = −2`, the characterisation of non-trapping
by the geodesic vector field, and the scattering relation as a smooth involution of `∂SM` fixing
exactly the glancing set, with the boundary lens data. These are the standing hypotheses and the
first tools of geometric inverse problems (the geodesic X-ray transform, boundary and lens
rigidity) and of comparison geometry on domains, stated intrinsically on `(M, g)` and its tangent
bundle so that nothing depends on a choice of ambient manifold; the acceptance examples are balls,
half-spaces, ball exteriors, spherical caps, hyperbolic balls, small geodesic balls and conformal
balls whose boundary turns strictly concave.

AI assistance: Claude (Opus 5.5) performed the port, the citation, ownership and library checks,
the mathematical self-review and the Lean signature validation.

## Dependencies still in pull requests

None. Every supplier is on main: DifferentialGeometry (5.1, 12.1–12.3, 12.5), RiemannianGeometry
(R5a, R5c, R7.9), GeometricTopology (1.1, 1.3), ComplexKahlerGeometry (K5a),
SmoothBundlesConnections (B6.0) and Completed/HopfRinow (Layers 1–2). RiemannianGeometry/Surfaces
(1.2–1.3), RiemannianGeometry 2.2 (R1.4) and AffineMorseLefschetz (4.5) are cited in Scope and
ownership and in Checks only; PositiveMass (5.1–5.2) is cited as a non-consumer in Downstream
consumers. No roadmap of the never-cite list is named.

No id this README cites is dropped at an open head: GeometricTopology 1.1 and 1.3 are present at
the head of its open revision (lines 1270, 1368 of its README there), K5a at both open revisions
that touch ComplexKahlerGeometry, and B6.0 at the open revision of SmoothBundlesConnections
(line 1603). See "Unresolved" for an old draft that replaces DifferentialGeometry's README.

## What moved from the Lean to the README

Nothing. `Suggested.lean` is the package file unchanged (byte-identical, checked with `cmp`). It
states the 11 headline theorems the README names as end theorems, with the 11 definitions they need
(10 with real bodies and one `Prop` structure), no sorry'd data, no `example`, no `set_option`, no
`lemma`, a single `import Mathlib` followed by six `TauCeti.*` modules, each used and each present
and built at the pin `2fd255d` of this worktree's manifest
(`TauCeti/Geometry/Manifold/Boundary/Charts.lean`, `…/Boundary/Orientation.lean`,
`…/Riemannian/Laplacian.lean`, `…/Riemannian/Geodesic/Basic.lean`, `…/Riemannian/Geodesic/Spray.lean`,
`…/Geometry/Manifold/RegularValue.lean`). No headline that is statable at the pins is missing: the
Summary's end theorems map to `isStrictlyConvexAt_iff_hessian_neg`,
`exists_isSmoothEmbedding_regularDomain`, `not_exists_isGeodesicCurveOnFrom_of_isStrictlyConvexAt`,
`mem_interior_of_isGeodesicCurveOn`, `exists_convexityFunction`, `contMDiffOn_exitTime`,
`exists_contMDiff_eq_exitTime_sub_exitTime_neg`, `exists_contMDiff_eq_exitTime_mul_exitTime_neg`,
`isNonTrapping_tfae`, `scatteringRelation_involutive` and
`exists_contMDiffOn_eq_scatteringRelation`; the module docstring correctly says that every headline
is statable at the pins.

**Signature check.** I appended `#check @…` for all 22 declarations and for nine pinned library
declarations the statements use (`TauCeti.Manifold.hessian`, `mgradient`, `IsGeodesicCurveOn`,
`IsGeodesicCurveOnFrom`, `geodesicSpray`, `curveVelocityWithin`, `TauCeti.IsOutwardPointing`,
`TauCeti.IsRegularValue`, `Manifold.IsSmoothEmbedding`) to the module, elaborated it once with the
build command above, and restored the file. I then compared each elaborated type with its README
statement. Every theorem keeps the `C¹` metric binder of its definitions and adds the smooth one.
The five Layer 5 theorems and the `T` theorem keep `[T2Space M] [CompactSpace M]`. The realisation
keeps `[T2Space M] [SecondCountableTopology M]` and puts `N` in the universe of `M`.
`exists_convexityFunction` keeps `[T2Space N]` and `[FiniteDimensional ℝ E]`.

The one binder missing from an elaborated type is `[IsManifold (𝓡∂ (n + 1)) ∞ M]` on
`IsBoundaryDefiningFunctionOn`. Its fields (`ContMDiffOn`, `mfderiv`, `interior`, `boundary`) use
only the charted space, so nothing is lost and nothing changed. The `inner` and `‖·‖` in the
statements are the Riemannian ones on `TangentSpace`: Mathlib gives `TangentSpace` no norm of its
own, and the `RiemannianBundle` instance supplies them.

## Supplier replacements and duplication removals

None needed. The README already cites suppliers rather than restating them. Checked by object:

- `boundaryTangentSpace` against Tau Ceti `TauCeti.mfderiv_subtypeVal_boundary`, which is consumed.
- The outward unit normal against DifferentialGeometry 12.5 `exists_halfSpaceOutwardUnitNormal`,
  which is consumed; 1.2 adds the chart formula, the sign test and naturality.
- The tube of 4.3 against Tau Ceti `TauCeti.SmoothEmbedding.exists_partialDiffeomorph_normalExp_subset`
  (`TauCeti/Geometry/Manifold/TubularNeighborhood/Riemannian/Coordinates.lean` line 89). That
  theorem gives a partial diffeomorphism on some neighbourhood of the zero section. 4.3 adds a
  radius function, the trivialisation by `ν_Σ` and the sign of `f`, so it is not a restatement.
- The normal collar and defining function against RiemannianGeometry R7.9 (compact connected case,
  cited).
- The compact realisation against RiemannianGeometry R5c (cited; the kept variant adds the
  non-compact case, the normalisation `ρ̃ ∘ c̃ = t`, the sublevel atlas and the compact connected
  extension).
- The immersion `B` against RiemannianGeometry R5a (cited in 3.6).
- Normal strips against Surfaces 1.2–1.3 (cited).
- Uniform normal radii against SmoothBundlesConnections B6.0 (cited).

Every backticked fully qualified library name in the README (Mathlib and Tau Ceti) was resolved
against the pinned sources with a namespace-aware scan: each names a declaration of exactly that
full name at the pins. The 22 Lean names of this roadmap all occur in the README, and the gate's
`readme-ids-missing=0` confirms the converse.

Duplication sweep by object (`roadmaps grep` over main and the open heads; the index listed 457
open pull requests and later 458):

- No other roadmap has the scattering relation, non-trapping, glancing vectors, boundary defining
  functions, strictly convex or convex boundary, boundary normal coordinates, convexity functions,
  lens data, the X-ray transform, Santaló or Pestov.
- "Exit time" matches stopping times (DysonBrownianMotion, StochasticCalculus), the exit time of a
  flow from a region (SymplecticGeometry/IntegrableSystems) and the straight-line exit from a ball
  of a hard-sphere collision (HardSphereDynamicsAndKineticLimits, open). These are different
  objects.
- "Boundary rigidity" matches LorentzianGeometry §10.2 "Push-up and boundary rigidity" (open), a
  causal statement and a different object.
- "Weingarten" matches ManifoldOptimization (the immersion Weingarten term of RiemannianGeometry
  R5a), FreeProbability and RandomMatrices (Weingarten calculus). These are different objects.
- "Signed distance" matches RiemannianGeometry R7.9 (cited), GeometricCurrents (a barrier) and
  GaussianIsoperimetryAndClusters (a hyperplane offset).
- "Second fundamental form of the boundary" matches RiemannianGeometry/MinimalSurfaces 10.1, which
  takes it from R5a. That is the `⟨B, ν_in⟩` that 3.6 identifies with `II`, so it is a use, not a
  second owner.
- LorentzianGeometry (open) owns the scalar second fundamental form of nondegenerate hypersurfaces
  of semi-Riemannian manifolds, an immersion object. It defines no boundary of a manifold with
  boundary, so nothing is owned twice.
- Varifolds and HyperbolicDynamicsAndThermodynamicFormalism (open) treat submanifolds of Euclidean
  space and geodesic flows of closed manifolds.

This roadmap is the owner of the intrinsic boundary geometry, the convexity predicates, regular
domains with their realisation, and the exit time and scattering relation. No declaration of
`Suggested.lean` shares its fully qualified name with a declaration of another roadmap.

## Fixes made as upstream reviewer

1. **Supplier contracts restructured.** The contracts were nine bold-led paragraphs, the Tau Ceti
   one a single 77-line paragraph. They are now `### From Mathlib`, `### From Tau Ceti`,
   `### From TauCetiRoadmap.<X>` and `### From Completed.HopfRinow` subsections, as 137 roadmaps
   on main have them. Mathlib and Tau Ceti are grouped into bullets by topic, and each roadmap
   item (5.1, 12.1, …; R5a, R7.9, R5c; 1.1, 1.3) is a bullet. The multiset of code spans before
   and after is identical (checked mechanically), so no supplier name or formula was lost.
2. **Summary names its end theorems by content.** "Proposition 3.3.1 of the same book" became "the
   characterisation of non-trapping by the geodesic vector field (Proposition 3.3.1 of the same
   book)". The end-theorem list now also names what the Lean file states and the Summary omitted:
   the absence of interior tangency, the smoothness of `σ` and of `τ(x, v) τ(x, −v)`, and the
   smoothness of `α`. Lines whose code spans were split across a line break (`g = dr² + h_r`) were
   rewrapped.
3. **Downstream consumer made definite.** "A future Lorentzian geometry roadmap (domains with
   boundary): regular domains (3.1), … and the defining-function calculus (1.3), where the metric
   is Riemannian" was self-contradictory: a Lorentzian consumer of statements made for Riemannian
   metrics. It now says that Lorentzian geometry on domains with boundary consumes the parts that
   do not use the metric: 1.3 except the gradient formula, the manifold structure of 3.1, and the
   defining functions of 3.3.

I found no wrong, vacuous or unsourced mathematical claim. The checks behind this are in the table
below.

## Adversarial mathematics pass

Values are computed; `n` is `dim M − 1`. The second table records the convention witnesses.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `boundaryTangentSpace` (1.1) | half-plane at `0`; disc at `(0, −1)`; `[0, 1]`; wrong model `ker dx¹` | `ker dx⁰ = ℝe₁`, `dx⁰(−e₀) = −1` outward; `⟨(t, ±1), ν_in = (0, 1)⟩ = ±1`; `T_q∂M = 0`, `+∂_x` inward at `0`, outward at `1`; `ker dx¹ = ℝe₀`, all nonzero vectors inward or outward, trichotomy fails | sound | none |
| `ν_in` (1.2) | constant metric `[[1, a], [a, 1]]`, `a = 1/2`; `a = 0`; `[0, 1]` | `g(e₀ − ae₁, e₁) = a − a = 0`, `g(e₀ − ae₁, e₀ − ae₁) = 1 − a² = 3/4`, `ν_in = (2/√3, −1/√3)`; `e₀`; `ν_out(0) = −∂_x`, `ν_out(1) = +∂_x` | sound | none |
| `IsBoundaryDefiningFunctionOn` (1.3) | `1 − |x|²`; `(2 + x₁)(1 − |x|²)`; `(1 − |x|²)²`; `−ρ`; `x(1 − x)` on `[0, 1]`; empty boundary, `1` | `|dρ| = 2`, `grad ρ = −2x`; `u = 2 + x₁ ∈ [1, 3]`; `dρ″ = 0` on the sphere, fails `mfderiv_ne_zero`; negative inside, fails `pos`; `ρ′(0) = 1`, `ρ′(1) = −1`; vacuous boundary clauses | sound | none |
| `secondFundamentalForm` (1.4) | ball of radius `R`; half-space; exterior; wrong model `⟨∇ν_in, ·⟩`; `n = 0` | `Hess ρ = −2g`, `|dρ| = 2R`, `II = h/R`; `Hess x⁰ = 0`, `II = 0`; `Hess = 2g`, `|dρ| = 2`, `II = −h`; gives `−h` on the ball; zero form on `0` | sound | none |
| 1.5 Weingarten, `H` | unit sphere; solid cylinder in `ℝ³`; exterior | `S = id`, `H = 1`; curvatures `1, 0`, `H = 1/2`; `H = −1` | sound | none |
| 1.6 conformal law | derivation; `φ = log 2`; `φ = −|x|²` on the disc; `φ = (|x|² − 1)²`; wrong sign | `ĝ(∇̂_XY, ν̂_in) = e^φ(II − dφ(ν_in)h)` from `∇̂_XY = ∇_XY + X(φ)Y + Y(φ)X − g(X,Y)grad φ`; `2h = 4h/2`; `dφ(ν_in) = 2`, `II = −e⁻¹h`, `Ĥ = e(1 − 2) = −e`; `dφ = 0` on the sphere, `II = h`; `+3e⁻¹h` | sound | none |
| `IsStrictlyConvexAt`, `IsStrictlyConvexBoundary` (2.1) | `{y ≥ x³}`; half-space `n ≥ 1`; `n = 0` | `II = 6x/(1 + 9x⁴)^{3/2}`: `> 0`, `< 0`, `0` at `x = 1, −1, 0`; `II = 0`, not strict; vacuous, true | sound | none |
| `isStrictlyConvexAt_iff_hessian_neg` (2.2) | `ρ = u x⁰`, `u(q) > 0`; `ρ′ = (2 + x₁)ρ` on the ball; `−ρ`; `n = 0`; half-space `n ≥ 1` | on `T_q∂M`: `Hess ρ = u(q) Hess x⁰` (`dx⁰ = 0`, `x⁰ = 0`), `II = −Hess x⁰/|dx⁰|`, both sides agree; `−2(2 + x₁)h < 0`; excluded by `pos`; both sides vacuous; both false | sound, both directions | none |
| 2.3 uniform bound, families | hyperbola epigraph; ball; `n = 0`; `e^{−2s|x|²}g` | `κ = (1 + 2x²)^{−3/2} → 0`; best `c = 1`; every `c > 0` holds; `II = e^{−s}(1 − 2s)h`, strict iff `s < 1/2` | sound | none |
| 3.1 regular domains | `(2 + x₁)(1 − |x|²)` at `x₁ = −3`; `(1 − |x|²)³`; `x₀² − x₁²`; outward criterion on the ball | `(−1)(−8) = 8`, extra half-space `{x₁ ≤ −2}`, `dρ′ = (1 − |x|²)dx₁ ≠ 0` there; critical value; double cone; `dφ(v) = 2⟨x, v⟩`, `dj(ν_in) = −2x/2 = −x` | sound | none |
| `IsStrictlyConcaveLevelSetAt` (3.2) | `|z|²`, `c > 0`; `c = 0`; `−|z|²`; affine; `n = 0`; `|z − z₀|` | `II = 2h/(2√c) = h/√c`; `{0}`, critical; `Hess = −2g`, fails; `Hess = 0`, fails; vacuous given `dx ≠ 0`; `Hess = (g − dr⊗dr)/r`, positive on `ker dr` | sound | none |
| 3.3 collar extension, `ρ̃` | `[0, 1]`, `c(0, t) = t/2`; `x³(1 − x)³`; empty boundary | `M̃ = (−1/2, 3/2)`, `ρ̃ = 2x` near `0`, `|dρ̃/dx| = 2`; sign pattern right, derivative `0` at both ends; `ρ̃ ≡ 1` | sound | none |
| `exists_isSmoothEmbedding_regularDomain` (3.5) | `M = ∅`; closed `M`; `[0, ∞)`; disc in `ℝ²` and in `S²`; `[0, 1]` with `(1 + x)²dx²`; doubled point | `N = ∅`, connectedness clause vacuous (`ConnectedSpace ∅` false); `N = M`, `ρ ≡ 1`; `M̃ ≅ (−1, ∞)`; `II = h` in both; length `∫₀¹(1 + x)dx = 3/2`; no Hausdorff `M̃` | sound | none |
| 3.6 Gauss equation | unit sphere; cylinder; exterior | `0 + 1·1 − 0 = 1`; `0 + 1·0 − 0 = 0`; `⟨B, ν_in = +x⟩ = −h` | sound | none |
| 4.1 geodesics of a domain | ball, `v ⊥ q`; `v = 0`; half-space | `|q + tv|² = 1 + t²|v|² > 1`; constant curve on `ℝ`, `τ = ∞`; line in `∂M` | sound | none |
| `not_exists_isGeodesicCurveOnFrom_of_isStrictlyConvexAt` (4.2) | ball, unit `v ⊥ q`; exterior; `{y ≥ x⁴}`; `n = 0`; `ε > 0` | `ρ(q + tv) = −t²`, `(ρ∘γ)″ = −2 = −|dρ|II(v, v)`; `+t²`, stays in `M`; `−t⁴`, leaves although `II = 0`; `v ≠ 0` impossible in `0`, vacuous; `Ico 0 ε` has unique derivatives | sound | none |
| `mem_interior_of_isGeodesicCurveOn` (4.2) | chord of the ball; `a = b`; `n = 0`, `[0, 1]`; constant curve | interior for `0 < t < 2`; `Ioo` empty; interior touch forces speed `0`, so constant, excluded by `hnc`; excluded by `hnc` | sound | none |
| 4.3 tube, `ρ̂` | `S^n`, `f = 1 − |x|²`; cutoff `|x|²`; exterior | `E(q, r) = (1 − r)q`, `r_Σ = 1 − |x|`, `ε ≤ 1`; `|x|² − |x|³` not `C³` at `0`, `W₂ = {1/4 < |x| < 7/4}` | sound | none |
| 4.4 boundary normal coordinates | ball radius `R`; exterior; cap `{φ ≤ φ₀}`; strip `[0, 1] × ℝ` | `h_r = (1 − r/R)²h₀`, `−½∂_r = h₀/R`; `(1 + r)²`, `−h₀`; `a = sin(φ₀ − r)/sin φ₀`, `II = cot φ₀`; at `(0.8, 0)` coordinate `0.8`, distance `0.2` | sound | none |
| `exists_convexityFunction` (4.5) | disc at `q = (0, −1)`, `x̃ = |z|² − 1 − ε|z − q|²`; `x̃ = −ρ` on `B(q, 1/2)`; exterior; `dim E = 1`; `dim E = 0`; `c = 0` | `Hess = (2 − 2ε)g`, `dx̃_q = (0, −2) = −dρ_q`, `K_c ⊆ {ε|z − q|² ≤ c}`; `K₀` an open arc, not compact; `Hess = −(2 + 2ε)g`; kernel `0`, `K_c` an interval; `mfderiv = 0`, hypothesis false; `K₀ = {q}` | sound, not vacuous | none |
| 4.6 enlargement | ball, `ε₁ = 1/4`; cap of radius `R`; `(1 − |x|²)e^{−|x|²}` | radius `1 + δ`, `II = h/(1 + δ)`; strict iff `R + δ < π/2`; radial derivative `−2/e` at `1`, minimum `−e^{−2}` at `√2`, critical value | sound | none |
| `IsGlancing` (5.1) | disc; `[a, b]`; zero vector at `∂M`; wrong model `μ = 0` on `TM` | two circles; `∂₀SM = ∅`, glancing vectors are the two zero vectors; glancing; would call every interior vector glancing | sound | none |
| `exitTime` (5.2) | disc at `(0, −1)`; annulus `1 ≤ |x| ≤ 2`; `[a, b]`; `τ(0, e₁/4)`; `T ≤ 0` | `2 sin θ`; `3/2 + √3` against the limit `3/2`; `b − x`; `4`, not the unit-speed `1`; `Icc 0 T` empty or `{0}`, no geodesic, `sup ∅ = 0` | sound | none |
| `IsNonTrapping` (5.2) | ball; nonempty closed `M`; `∅`; hemisphere `n ≥ 1`; half-circle `n = 0` | `τ ≤ 2`; `τ ≡ ∞`; vacuous; great circle in `∂M`; `τ = π/2 ∓ θ` | sound | none |
| 5.3 fold form, even functions | `y − t²`; `y − t⁴`; `cos r`; `|r|` | `Q = r`, `a = y`; degenerate, no `Q`; `H(s) = Σ(−s)^k/(2k)!`; not smooth, excluded | sound | none |
| `contMDiffOn_exitTime` (5.4) | `[a, b]`; outward boundary vector; glancing | `(b − x)/v`, smooth across `x = b`; implicit-function root, negative off `M`; `Q(√a)`, `Q(0, z₀) = 0` | sound | none |
| `exists_contMDiff_eq_exitTime_sub_exitTime_neg` (5.4) | ball; `[a, b]`; glancing point of the disc | `σ = −2⟨x, v⟩`, `d/dt = −2`; `F = (a + b − 2x)v`, `dF(v, 0) = −2v² = −2`; `σ̃(φ_t z) = −2t` | sound | none |
| `exists_contMDiff_eq_exitTime_mul_exitTime_neg` (5.4) | ball; `[a, b]`; wrong model `G ≡ 0` | `1 − |x|²`; `(b − x)(x − a)`, `σ² + 4T = (b − a)²`, `(σ + (b − a))/2 = b − x`; `T(0, v) = 1 ≠ 0` | sound | none |
| `isNonTrapping_tfae` (5.5) | `∅`; nonempty closed `M`; `[0, 1]`; ball with `u = |x|²/2` | all true; all false (`Xf = 0` at a maximum of `f`, `1 ≠ Xu`, `τ ≡ ∞`); `f = xv`, `Xf = 1`; `Xf = 1`, bound `(1 − (−1))/1 = 2` | sound | none |
| `geodesicEndpoint` (5.6) | disc, `z = ((0, −1), (0, 1))`, `T = 1, 3, 0, −1`; doubled point, `T = 1, 2` | `((0, 0), (0, 1))`; `z`, not `((0, 2), (0, 1))`; `z`; `z`; two copies of `1`, one point `2` | sound | none |
| `scatteringRelation`, `scatteringRelation_involutive` (5.6) | ball; outward `v = (0, −1)` at `(0, −1)`; glancing; zero vector; `[a, b]` | `α(α(x, v)) = x − 2⟨x,v⟩v + 2⟨x,v⟩v = x`; `α = ((0, 1), (0, −1))`, without the sign change `α ∘ α ≠ id`; fixed; `(x, 0)`; `α(a, 1) = (b, 1)`, `α(b, 1) = (a, 1)`, no fixed point | sound | none |
| `exists_contMDiffOn_eq_scatteringRelation` (5.6) | ball, `F(x, v) = (x − 2⟨x, v⟩v, v)` | polynomial, so smooth on all of `TM`, and equal to `α` on `∂SM` by the ball formula | sound | none |
| lens data (5.6) | disc, `w = (c, 0)`; `[a, b]`; radius `R` | `y = (2c√(1 − c²), 1 − 2c²)`, `|y| = 1`, `|L|² = c²(2c² − 1)² + 4c⁴(1 − c²) = c²`; `ℓ = b − a`; `ℓ(x, 0) = 2R` | sound | none |
| 6.1 balls, Euclidean domains | ellipse vertex `(a, 0)`; `a = −1`; circle parametrisation | `II = (2/b²)/(2/a) = a/b²`; formula gives `−1`, true value `1`; `⟨B_i(1, 1), ν_in⟩ = 1` | sound | none |
| 6.3 caps, hyperbolic balls | `p = 2e`, `R = π/3`; hyperbolic `(0, 2)`; `R = 1` | `II = 1/√15 ≈ 0.258` vs `1/√3 ≈ 0.577`; `u = 5/4 = cosh log 2`, `|du| = 3/4 = sinh log 2`, `Hess u_xy = −x/y² + x/y² = 0`; `coth 1 ≈ 1.313`, `cot 1 ≈ 0.642` | sound | none |
| 6.4 small balls | `S^{n+1}`; flat torus, `R = 1/4` | eigenvalue `2s cot s < 0` for `s > π/2`; `II = 4h`, `τ ≤ 1/2` | sound | none |
| 6.5 conformal balls | `φ(s) = s² − 2s`; `φ_s(t) = −st`; `n = 0` | `b′ = e^{r⁴ − 2r²}(2r² − 1)²`, `b′(1) = e⁻¹`, `b′(1/√2) = 0`; `b_s′(1) = e^{−s}(1 − 2s)`; boundary strictly convex for every `φ` | sound | none |
| Downstream: PositiveMass | PositiveMass README line 935 | its mean curvature is R5b's `A(X, Y) = ⟨B(X, Y), ν⟩` | agrees | none |
| Downstream: Lorentzian consumer | 1.3, 3.1, 3.3 | 1.3's gradient formula and 3.1's metric items use `g` | text contradicted itself | fixed (fix 3) |

Convention witnesses:

| Convention | Witness | Value |
|---|---|---|
| sign of `II` | unit ball | `II = h` |
| outward vectors | model half-space | `−e₀` outward |
| inward normal | unit ball | `ν_in(x) = −x` |
| defining functions | `1 − |x|²` | positive inside, `grad ρ = 2ν_in` |
| mean curvature | unit sphere; exterior | `H = 1`; `H = −1` |
| `∂±SM` labels | disc at `(0, −1)` | `(0, 1) ∈ ∂₊SM` |
| conformal factor `e^{2φ}` | `φ = log 2` | `II` doubles |

Context: every theorem's binders were read off the elaborated types (section "What moved"). No
statement relies on a hypothesis that is out of scope.

Generality: the README and the Lean agree. One small asymmetry is harmless: 4.5 places `N` in
Layer 4's setting (`finrank E = n + 1`), while the Lean allows any finite-dimensional `E`. In
dimension 0 the Lean hypothesis `mfderiv ≠ 0` is false, so the extra case is vacuous.

## Ownership against open pull requests

Checked against the open roadmap pull requests whose heads the brief lists, by object (sweep
above). Nothing this roadmap owns is planned in another open roadmap, and nothing it cites is
owned only by an open roadmap.

## Unresolved

- An old draft pull request on DifferentialGeometry replaces its README wholesale with a different
  text, "differential forms and smooth flows", which opens with a discussion heading and has no
  5.1 or 12.5. The overlap tool does not list it as dropping any id, and the brief says a revision
  is never a dependency, so the citations stay at main's DifferentialGeometry 5.1, 12.1–12.3 and
  12.5. If that draft ever merges, 1.1–1.3 and the supplier contracts would need new locators for
  the outward-pointing interface and `exists_halfSpaceOutwardUnitNormal`.
- `lee-riemannian2018`, `lee-smooth2012` and `sharafutdinov1994` are paywalled and uncertified in
  `sources.toml`. Their chapter- and theorem-level locators were not checked against the text.
  `lee-smooth2012` Theorem 9.25 is also GeometricTopology 1.1's locator.
- Licence note carried from the accepted review: `paternain-salo-uhlmann2023` was read from the
  authors' copy on an author's university page (`licence_class = "author-page"`), a decision for
  the human reviewers.
- No suspicious text was found in the package, the reviews or the other roadmaps read.


Pull request: #2451 (roadmap/riemannian-manifolds-with-convex-boundary at bde64ee)
