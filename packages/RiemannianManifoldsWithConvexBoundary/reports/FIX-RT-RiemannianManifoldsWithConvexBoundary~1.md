# FIX-RT-RiemannianManifoldsWithConvexBoundary~1

Repair of red-team round 1 (passes a and b) on `packages/RiemannianManifoldsWithConvexBoundary`.
Five P3 findings: four applied, one applied differently. No finding overlaps another. Files
edited: `README.md`, `Suggested.lean` (one docstring). `metadata.toml`, `sources.toml` and
`design/plan.json` are unchanged; no supplier gap is needed.

## RT-RiemannianManifoldsWithConvexBoundary~1a/F01 (P3) — applied

Old → new: "**PositiveMass**, 5.1–5.2: the boundary mean curvature … (1.5) … by 3.6" → "A Part
II of PositiveMass for manifolds whose boundary is given intrinsically: … (1.5) … (3.6)". Added:
PositiveMass 5.1–5.2 takes `A = ⟨B, ν⟩` from RiemannianGeometry R5b, not from here; the
normalisations agree (`H = 1` on the sphere, `−1` on the exterior).

Evidence: `TauCetiRoadmap/PositiveMass/README.md` on main, §5.1, compares its mean curvature with
"R5b's `A(X,Y) = ⟨B(X,Y),ν⟩`", and its `*Needs:*` line names RiemannianGeometry R5b and no other
geometry supplier. `roadmaps grep RiemannianManifoldsWithConvexBoundary` finds no citation of this
roadmap. R5b is at `TauCetiRoadmap/RiemannianGeometry/README.md` §R5b (the `A(X,Y)=⟨B(X,Y),ν⟩` line).
The PositiveMass §5.1 Check gives `H = 1` for the unit ball and `H = −1` for the exterior, the
same values as 1.5 here. The 1.5 Check ("this is PositiveMass's averaged `tr A/(dim − 1)`") only
compares conventions and stays.

## RT-RiemannianManifoldsWithConvexBoundary~1a/F02 (P3) — applied differently

Old → new (6.4): "uniformity from SmoothBundlesConnections B6.0" → B6.0's uniform normal radius
makes `E(x, v) = (x, exp_x v)` a diffeomorphism, `d(p, y)²` jointly smooth with `y`-Hessian `2g` on
the diagonal, and compactness gives `r_K`.

Also changed: a new sphere Check in 6.4; *Needs:* gains HopfRinow Layer 1; the scope bullet and the
B6.0 contract name normal radii only.

What is right in the finding: "uniformity from B6.0" did not justify the claim. B6.0's uniform
normal radius does not control the constant in `Hess |z|² = 2g + O(|z|²)`. On the round
`S^{n+1}` the normal radius is `π`, but `Hess s² = 2 ds² + 2s cot s (g − ds²)` (with `s = d(p, ·)`)
is negative on the tangent space of the geodesic sphere for `π/2 < s < π`. This is now a Check in
6.4.

Disputed: the claim of duplication and the repair the review proposed. B6.0 (on main,
`TauCetiRoadmap/SmoothBundlesConnections/README.md` §B6.0) states strict convexity of the squared
radial distance along short geodesics. That is weaker than the positive definite Hessian which
3.2's sublevel statement and 5.5's Hessian criterion need. The proposed repair argues that strict
convexity, together with `(f∘γ)'' = Hess f(γ', γ')`, gives `Hess d(p, ·)² > 0`, and that step is
false. Counterexample: `f(y) = |y|⁴` on `ℝⁿ⁺¹`. Along every nonconstant line, `t ↦ |a + tb|⁴` is
the strictly increasing, strictly convex `s ↦ s²` composed with the strictly convex quadratic
`|a + tb|²`, so it is strictly convex. Yet `Hess f(0) = 0`. So 6.4 does not re-prove B6.0; it
derives a statement B6.0 does not make.

The repair follows from the pinned definition. `TauCeti.Manifold.IsNormalDomain`
(`TauCeti/Geometry/Manifold/Riemannian/Geodesic/Normal/Basic.lean`, structure at line 89) has the
fields `injOn` and `isLocalDiffeomorphOn`. So on B6.0's uniform tube, `E` is injective with
invertible (block-triangular) differential, hence a diffeomorphism onto its open image. The
pointwise normal-coordinate route still uses the three Tau Ceti normal-coordinate names, so they
stay, against the review's request to delete them. B6.0's strict convexity is no longer listed as
consumed: the contract says it is not consumed, and the scope bullet still leaves it to B6.0.

## RT-RiemannianManifoldsWithConvexBoundary~1a/F03 (P3) — applied

Old → new: 1.4 gains DifferentialGeometry 12.3; 4.4 gains GeometricTopology 1.1 (smooth collars);
5.5's "5.1–5.4" → "5.1–5.2 and 5.4".

Same pattern elsewhere: 2.1's "Layer 1" → "1.4–1.6"; 4.2's "Layer 1, …" → "1.1, 1.3–1.4, …, HopfRinow
Layer 1"; 3.3 and 3.4 gain Mathlib's partitions of unity; 6.1 gains Tau Ceti's second fundamental
form; 6.4 gains HopfRinow Layers 1–2.

Evidence: every `### Dependencies` paragraph was compared, section by section, with the
`*Needs:*` lines of Layers 1–6. 5.5 uses 5.4's smoothness of `τ_δ` but nothing from 5.3 directly;
5.3 reaches 5.5 only through 5.4. Every other section's sections and roadmap suppliers already
matched.

## RT-RiemannianManifoldsWithConvexBoundary~1b/F01 (P3) — applied

Old → new: the `geodesicEndpoint` docstring "…the choice of `γ` does not matter" → it does not
matter for Hausdorff `M`, can matter otherwise (doubled half-line, README §5.6), and every theorem
assumes `[T2Space M]`. README 5.6: "which, `M` being Hausdorff, does not depend on…"; first bullet
"For Hausdorff `M`, …"; a new negative-control Check.

Evidence: the witness holds. On `[0, ∞)` with `1` doubled (3.5's last Check) and the metric `dx²`,
the curves `t ↦ t` through `1` and through `1′` are both `C²` on `Icc 0 2`, have zero acceleration
(the metric is constant in the chart), and start at `0` with velocity `+1`. At `T = 1` they end
over `1` and `1′`; at `T = 2` they agree. The `def` has no `[T2Space M]` binder; the
two theorems that use it through `scatteringRelation` (`scatteringRelation_involutive`,
`exists_contMDiffOn_eq_scatteringRelation`) both carry `[T2Space M]`, so no statement changes.

## RT-RiemannianManifoldsWithConvexBoundary~1b/F02 (P3) — applied

Old → new: the GeometricTopology contract after "`f(q) = (q, 0)`" now puts `∂M × [0, 1)` over
`𝓡∂ (n+1)` by the reordering `(y, t) ↦ (t, y)`. The identity is a diffeomorphism between the two
structures, with the same boundary and collar, so 1.3 applies. 3.3 cites the reordering at `N`.

Same pattern elsewhere: 3.3's atlas comparison now composes the bicollar chart with the reordering
(`ρ̃ = t = x⁰`).

Evidence: GeometricTopology Layer 1 (on main) fixes the half-space model `𝓡∂ n` for its manifolds
with boundary. It gives `∂M × [0, 1)` "the product structure with the half-space model in the
second factor", where the constrained coordinate comes last. Mathlib's `EuclideanHalfSpace`
constrains coordinate `0`. For `n = 0` the reordering is the identity of `[0, ∞)`, and 3.3's
interval Check (`M̃ = (−1/2, 3/2)`) is unchanged. On the half-space Check, the chart `(y, t) ↦ (t, y)` of
`c(q, t) = q + t e₀` has `x⁰ = t`.

## Checks

- **Elaboration** (`lake env lean packages/RiemannianManifoldsWithConvexBoundary/Suggested.lean`
  from the content checkout): no errors; 11 `declaration uses 'sorry'` warnings, one for each
  theorem, as before. Only a docstring changed.
- **Signatures**: a scratch copy of `Suggested.lean` with `#check @name` for all 22 declarations
  was elaborated once. All 22 elaborated types are identical, after whitespace normalisation, to
  those recorded in the worker's signature file. The one binder that looked dropped
  (`[IsManifold (𝓡∂ (n + 1)) ∞ M]` on `IsBoundaryDefiningFunctionOn`) is still absent and still
  harmless: no field of the structure needs it, and the theorem consuming the structure carries
  the instance. Both reviews checked this too.
- **Dependency check** (the command of the brief):

      depcheck: 249 roadmaps, 2376 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line. The edge count fell by two because the Downstream
  consumers bullet no longer presents PositiveMass as a consumer.
- **Citations** (`roadmaps resolve` on the README): no cross-roadmap citation and no Lean name
  found nowhere.
- **Gate failures listed in the brief**: none.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 6.4 uniform `r_p` (new route) | flat torus `ℝ²/ℤ²`; round `S^{n+1}`; `S¹`; hyperbolic space; `K = {p}`; `K = ∅` | torus: `F = \|y − p\|²`, `Hess = 2g`, `r_K = r = 1/2`; sphere: eigenvalues `2` and `2s cot s`, positive iff `s < π/2`, normal radius `π`, so `r_K = π/2 < r`; `S¹`: only the radial eigenvalue `2`, `r_K = π`; hyperbolic: `2s coth s > 0`, every radius; `K = {p}` is the pointwise statement; `K = ∅` vacuous | holds; the sphere shows `r_K < r` is needed |
| "strict convexity ⇒ positive Hessian" (review's step) | `\|y\|⁴` on `ℝⁿ⁺¹` | `t ↦ (\|a\|² + 2t⟨a, b⟩ + t²\|b\|²)²` strictly convex for `b ≠ 0`; `Hess(0) = 0` | false; not used |
| `E(x, v) = (x, exp_x v)` diffeomorphism on the uniform tube | flat torus `r = 1/2`; sphere `r = π` | torus: `E(x, v) = (x, x + v)`, inverse `(p, y) ↦ (p, y − p)` for `\|y − p\| < 1/2`; sphere: `exp_x` injective on `B(0, π)`, `d(exp_x)_v` invertible for `\|v\| < π` | holds |
| `geodesicEndpoint` wording | doubled half-line at `T = 1, 2, 0, −1`; closed unit disc `z = ((0, −1), (0, 1))`, `T = 1` | `1` vs `1′`; `2` and `2`; `z`; `z`; disc `((0, 0), (0, 1))`, a single value (Hausdorff) | the claim now holds exactly under `T2Space` |
| GeometricTopology 1.3 on `∂M × [0, 1)` | `M = [0, 1]` (`n = 0`); half-space `n ≥ 1`; wrong model | `ℝ⁰ × [0, ∞) = [0, ∞)`, reordering the identity; `(y, t) ↦ (t, y)` gives `x⁰ = t ≥ 0`; without the reordering the chart lands in `{x_n ≥ 0}`, which is not `EuclideanHalfSpace (n+1)` for `n ≥ 1` | holds |
| 3.3 atlas comparison chart | half-space collar `c(q, t) = q + t e₀`; interval collar `c(0, t) = t/2` | `x⁰ = t`, `ρ̃ = x⁰`; near `0`, `t = 2x`, `ρ̃ = 2x` | agrees with 3.3's Checks |
| Downstream consumers bullet | unit sphere; exterior of the unit ball | here `H = tr_h II/n = 1`, PositiveMass `tr A/(dim M − 1) = 1`; here `H = −1`, there `H = −1` | agrees |
| Dependencies paragraphs | every section of Layers 1–6 | listed under F03 | agree with the `*Needs:*` lines |

## For the maintainer

- No Lean name changed, and no section, layer or target id changed. Other roadmaps cite nothing
  that changed.
- Ownership: no construction was added. The new uniformity argument uses only Tau Ceti's
  `IsNormalDomain`, HopfRinow Layers 1–2 and SmoothBundlesConnections B6.0, all on main. Ownership
  against open pull requests was checked with `roadmaps grep` and the worker's overlap file only.
- The review texts contain no instruction addressed to the repairer beyond their findings. The
  "Source issues" and "For the human reviewers" sections were read; no edit follows from them.
