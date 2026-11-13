<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13810#issuecomment-6850399768 -->
Review (claude) of 93d2394

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) the formula for `X` on `C^∞(SM)` is undefined at glancing points

   **Location.** `packages/RiemannianManifoldsWithConvexBoundary/design/README.md` 5.1, lines
   1059–1060: "on the regular domain `SM` it acts on smooth functions by
   `Xu(z) = d/dt u(φ_t z)|_{t=0}`"; `design/plan.json` target 5.1, API
   `geodesicVectorField_unitSphereBundle`.

   **Claim.** For `u ∈ C^∞(SM)` the derivative of `t ↦ u(φ_t z)` at `0` defines `Xu(z)` at every
   `z ∈ SM`. 5.4 (`Xσ = −2` on `SM`) and 5.5 (`X : C^∞(SM) → C^∞(SM)`) use it on all of `SM`.

   **Witness.** Closed unit disc, `z = ((0, −1), (1, 0)) ∈ ∂₀SM`: `φ_t z = ((t, −1), (1, 0))` and
   `|(t, −1)|² = 1 + t² > 1` for `t ≠ 0`, so `φ_t z ∉ SM` for every `t ≠ 0` and `u(φ_t z)` exists
   only at `t = 0`. The source defines `X` on `C^∞(SN)` and restricts (paternain-salo-uhlmann2023
   lines 3072–3079).

   **Exact repair.** Replace the clause by: "`X(z) ∈ T_z SN = dj(T_z SM)` for `z ∈ SM` (3.1), so `X`
   is a smooth vector field on the manifold with boundary `SM` and `Xu := du(X)` for `u ∈ C^∞(SM)`;
   `Xu(z) = d/dt ũ(φ_t z)|_{t=0}` for every smooth `ũ` extending `u` near `z` in `SN`, and it is the
   (one-sided) derivative of `u(φ_t z)` wherever `φ_t z` stays in `SM` on a one-sided neighbourhood
   of `0`." Use the same wording in the plan's API entry, and add the disc Check below to 5.1.

   **Repair test.** Same `z`, `u = σ`, extended by 6.1's formula `ũ(x, v) = −2⟨x, v⟩`:
   `ũ(φ_t z) = −2t`, derivative `−2`, which is 5.4's `Xσ = −2` at a point where the old formula
   has no value.

2. **F02** (P2) "every `(M, g)`" in three prose sentences, where 3.5 proves less

   **Location.** Same README, line 797: "by 3.5 every `(M, g)` is one"; lines 11–12: "the realisation of every `(M, g)` as a regular
   domain"; line 268: "proves that every `(M, g)` is such a domain".

   **Claim.** Every `(M, g)` of the Conventions is a regular domain of a boundaryless `N`.

   **Witness.** 3.5 (line 738) assumes `M` Hausdorff and second countable, and the Conventions
   (lines 105–106) make neither a standing hypothesis. The half-line `[0, ∞)` with the point `1`
   doubled is a manifold over `𝓡∂ 1` with a metric; it is not Hausdorff, so it is no subspace of
   the Hausdorff `N` of 3.1.

   **Exact repair.** Write "every Hausdorff second-countable `(M, g)`" in the three places (Summary,
   "How to read the build", Layer 4's opening sentence).

   **Repair test.** The doubled half-line is excluded by "Hausdorff"; `[0, 1]`, the disc and the
   half-space (3.3, 3.5 Checks) satisfy both hypotheses and are realised.

Two findings, each with an exact repair, so the design goes to a fix round. Both are graded P2 by
the rubric: R01 is a defining formula with no value on part of the domain where 5.4 and 5.5 use
it, and R02 is an overclaim in prose (a hypothesis of 3.5 dropped in three sentences). Both
repairs are local rewordings; no statement of a theorem changes. The three round-4 findings
that were applied are repaired. The fourth (F01, the overlap with an open RiemannianGeometry
revision) was marked not actionable in this package; its reason holds and it is not re-raised.
No design file, plan or manifest entry was changed by this review.

## Previous findings and repairs

| Round-4 finding | Repaired passage (README) | Assessment |
|---|---|---|
| F01 (P2), overlap with RiemannianGeometry R7.9 | no edit; marked not actionable | **Settled, not re-raised.** R7.9 is still absent from main (42813dd: `TauCetiRoadmap/RiemannianGeometry/README.md` has R7.0 at line 3942 and R7.1–R7.8 at line 3985, nothing after) and exists only in an open revision of that roadmap. A revision is never a dependency, so the citation the round-4 repair asked for is not available, and nothing at the pins states the facts (`TauCeti/Geometry/Manifold/RegularValue/Scalar/Sublevel.lean` has `isManifold_scalarRegularSublevel` :639, `boundary_…` :652, `interior_…` :675 and no inclusion or outward lemma). The reason given is correct. |
| F02 (P3), cutoff for `ρ̂` | lines 882–903: "choose smooth `ε₁, ε₂ : ∂M → (0, ∞)` with `ε₁ < ε₂ < ε` … `ψ` … equal to `0` on the closed set `N ∖ W₂`"; Check at lines 909–915; plan 4.3.3 and test `cutoff_frontier` | **Repaired.** Recomputed below. The closed-tube theorem read at the pin gives a smooth `r` with `0 < r < ε`, closed image in the prescribed open set and `IsClosedEmbedding` of the closed disc bundle (`TauCeti/Geometry/Manifold/TubularNeighborhood/Riemannian/Noncompact.lean:58–75`). |
| F03 (P3), second countability of `N` | lines 797–799: "In 4.3, 4.4 and 4.6 … `N` is moreover second countable; 4.1, 4.2 and 4.5 are local and do not assume it"; 6.4 line 1366 "boundaryless Hausdorff second-countable"; plan 6.4 hypotheses | **Repaired.** `[SecondCountableTopology N]` at `Noncompact.lean:50`; SmoothBundlesConnections B6.0 lines 1316–1328 on main. |
| F04 (P3), unit vectors in 5.2 | lines 1090–1093: "If `M` is compact, `(x, v) ∈ SM` (so `v` is a unit vector, as `μ` and `φ_t` require) and `τ(x, v) < ∞`"; plan `exitTime_flow` | **Repaired.** |

The repaired patterns were looked for elsewhere: cutoffs multiplying a function that is smooth
only on an open set (3.3 `φ₀·(χ∘t)`: support inside the bicollar; 3.4: the extended tensor is
smooth on all of `N`; 4.4 `η`: a minorant, no product) and `μ`, `φ_t` off the unit bundle (5.4,
5.5, 5.6 are all on `SM` or `∂SM`). R01 is a new instance of the second pattern's neighbour:
`φ_t` leaving `SM`.

No maintainer notes were supplied.

## Verified sound

**Coverage.** Read the whole README (1,474 lines), the plan (49 targets, 6 suppliers, `gaps: []`)
and the six manifest entries. All 12 definitions and constructions carry at least three Checks
(plan counts 3–4 each). Six layers, each with Examples and Dependencies. No LaTeX delimiters,
pull-request numbers, anchors, machine paths or process words in the README (searched). One
remark that needs no change: plan target 5.4.1 lists 5.4.4 (the fold form) as a prerequisite for
continuity at `∂₀SM`; 5.4.4 needs only 5.3.1, 4.2.1 and 5.2, so there is no cycle.

**Dependency check, exact output:**

```text
candidate: RiemannianManifoldsWithConvexBoundary is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 207 roadmaps, 1897 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The worker's citation report (main 42813dd, 437 open heads)
lists no citation or Lean name found nowhere; the overlap report lists no dropped id, no
revision-only id and no conflicting head.

**Supplier citations resolved on main (42813dd).** GeometricTopology 1.1
(`TauCetiRoadmap/GeometricTopology/README.md:788`, collar as data, existence for second-countable
`M`) and 1.3 (:851); DifferentialGeometry 5.1 (:1648), 12.1 (:2801), 12.2 (:2848), 12.3 (:2871),
12.5 (:2936, `exists_halfSpaceOutwardUnitNormal` at :2950 and `Suggested.lean:1020`);
RiemannianGeometry R1 (:914, normal-chart first derivatives at :1487) and R5a (:2895);
ComplexKahlerGeometry K5a (:1440, Seeley step at :1796); SmoothBundlesConnections B6.0 (:1306,
uniform normal radii with `IsNormalDomain` at :1327–1328); HopfRinow (completed);
AffineMorseLefschetz 4.5 (:819); PositiveMass 5.1–5.2 (:921, :957); PositiveScalarCurvature and
Yamabe exist on main (named as consumers only).

**Pinned declarations.** All 77 backticked identifiers of the README were resolved by script
against the pinned Mathlib and Tau Ceti (the four non-library ones are `Hess`, `h_eucl`, the
supplier's `exists_halfSpaceOutwardUnitNormal` and a source key). Opened: 
`exists_contMDiff_zero_iff_one_iff_of_isClosed` (Mathlib/Geometry/Manifold/PartitionOfUnity.lean:797),
`exists_contMDiffSection_forall_mem_convex_of_local` (:593),
`IsLeviCivitaConnection.uniqueness` (Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean:256),
`exists_isClosedEmbedding_normalExp_norm_le_subset` (TauCeti/Geometry/Manifold/TubularNeighborhood/Riemannian/Noncompact.lean:58),
`exists_partialDiffeomorph_normalExp_subset` (…/Riemannian/Coordinates.lean:89),
`hessian_apply_eq_mvfderiv_sub` and `hessian_symm` (TauCeti/Geometry/Manifold/Riemannian/Laplacian.lean:158, :197),
`hessian_rescale` (…/Riemannian/Hessian/WithMetric.lean:76),
`leviCivitaConnection_rescale_apply` (…/LeviCivita/Conformal.lean:260),
`restrictBoundaryTangentSpace` and its `_inner` (TauCeti/Geometry/Manifold/Riemannian/Boundary.lean:115, :146),
`ContMDiffNondegenerateMetricFamily` (…/NondegenerateMetric/Family.lean:73) and
`contMDiffAt_christoffelSymbol` (…/LeviCivita/Nondegenerate/Family.lean:116),
`IsRegularValue` (TauCeti/Geometry/Manifold/RegularValue.lean:92),
`mfderiv_subtypeVal_boundary` (…/Boundary/Derivative.lean:64),
`isSmoothEmbedding_subtypeVal_boundary` (…/Boundary/Charts.lean:374),
`exists_isOutwardPointingField` (…/Boundary/OutwardExistence.lean:75),
`ContDiff.sub_eq_hadamardFactor_apply` (TauCeti/Analysis/Calculus/Hadamard.lean:115),
`contDiff_intervalIntegral` (TauCeti/Analysis/Calculus/ParametricIntegral.lean:211),
`isManifold_sphereBundle` (…/VectorBundle/Riemannian/Sphere.lean:161, variable radius),
`contMDiffOn_maximalGeodesic` and `exists_contMDiffAt_localGeodesicFlow` (…/Geodesic/Flow.lean:117, :65),
`isGeodesicallyCompleteAt_of_compactSpace` (…/Geodesic/Compact.lean:75),
`sphereRoundMetric` (…/Riemannian/Sphere/Basic.lean:61),
`UpperHalfSpace.hyperbolicMetric` (…/Hyperbolic/UpperHalfSpace/Metric.lean:41).

**Seeded source sample** (every locator read in the cached text; the three certified sources).

| Target | Locator read | Result |
|---|---|---|
| 1.3 | uhlmann-vasy2016 lines 25–26, 134–136 | positive inside, zero with nonzero differential on the boundary; as cited |
| 2.1 | paternain-salo-uhlmann2023 lines 2738–2739, 2449–2461; stefanov-uhlmann-vasy2021 lines 89–90, 93 | positive definite `Π`; convexity at a point and everywhere; circle concavity; as cited |
| 3.1 | stefanov-uhlmann-vasy2021 lines 96–97; uhlmann-vasy2016 lines 25–26; paternain-salo-uhlmann2023 lines 2770–2772 | domain in a boundaryless extension with a defining function |
| 3.2 | stefanov-uhlmann-vasy2021 lines 128–129, 198–200, 203–205; uhlmann-vasy2016 lines 137–140, 507–509 | "strictly concave from the superlevel sets"; the distance example (the README's Euclidean formula is its own instance) |
| 3.4 | paternain-salo-uhlmann2023 lines 2755–2762 | the source proves only the Euclidean case and leaves the rest as an exercise; the design's statement and route are its own |
| 3.5 | paternain-salo-uhlmann2023 lines 2749–2762; stefanov-uhlmann-vasy2021 lines 96–97 | compact case in the source; hypotheses here (Hausdorff, second countable) are wider and stated |
| 4.1 | paternain-salo-uhlmann2023 lines 2646–2658, 2763–2765 | as cited |
| 4.3 | stefanov-uhlmann-vasy2021 lines 99–100, 220–221; paternain-salo-uhlmann2023 lines 2766–2773 | signed distance; `ρ = d(·, ∂M)` near `∂M`, three sign sets, `∇ρ = ν` |
| 4.5 | uhlmann-vasy2016 lines 30–32, 504–524; stefanov-uhlmann-vasy2021 lines 128–134 | `x̃ = −ρ − ε|z − p|²`, the `(U₀, C₀, δ)` bound and compactness for `0 ≤ c ≤ c₀`, as restated |
| 5.1 | paternain-salo-uhlmann2023 lines 2646–2648, 2682–2696, 2931, 3063–3079; stefanov-uhlmann-vasy2021 lines 151, 153 | strata with inward `ν`; the opposite labels of the second source are stated correctly; `X` is defined on `SN` there (R01) |
| 5.2 | paternain-salo-uhlmann2023 lines 2659–2661, 2674–2676, 2666, 2849–2861 | as cited |
| 5.3 | same, lines 2970–2982, 2985–3026, 3044–3045, 3039–3041 | fold lemma hypotheses and conclusion agree; the exercise is parameter-free, the README's parametrised form is what line 3039 uses |
| 5.4 | same, lines 2865–2886, 2896–2925, 2935–2949, 2955–2966, 3027–3043, 3046–3055, 3110–3113, 2868, 2891 | all seven lemma, remark and exercise locators agree; Lemma 3.2.9 indeed assumes no non-trapping |
| 5.5 | same, lines 3081–3106 | three equivalent conditions for compact `M` with strictly convex boundary |
| 6.3 | same, lines 2499–2521, 2677–2680 | small and large caps; hyperbolic and Euclidean subdomains non-trapping |

**Adversarial table** (values computed in this review).

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 1.2 chart formula | `g = [[1, a], [a, 1]]`, `a = 1/2` | `grad x⁰ ∝ (1, −a)`, norm² `1 − a²`; `(2/√3, −1/√3)`, `g(ν, e₁) = 0` | holds | none |
| 1.3 comparison, Checks | ball `ρ′ = (2 + x₁)ρ`; `ρ²`; `∂M = ∅` | `u ∈ [1, 3]`; `d(ρ²) = 0` on the sphere; constant `1` | holds | none |
| 1.6 conformal law | derivation; `φ = log 2`; `φ = −|x|²` | `Hess_ĝ ρ = Hess ρ + ⟨∇φ, ∇ρ⟩g` on `ker dρ`, `|dρ|_ĝ = e^{−φ}|dρ|`; `2h`; `e⁻¹(1 − 2)h`, `Ĥ = −e` | holds | none |
| 2.1 predicates | `{y ≥ x³}`; `n = 0` | `II(t, t) = 6x/(1 + 9x⁴)^{3/2}`; both strict predicates vacuous | holds | none |
| 2.2 Hessian iff (headline) | ball, `ρ` and `(2 + x₁)ρ` | `Hess ρ′ = u Hess ρ = −2(2 + x₁)h` on `T∂M` | holds | none |
| 2.3 uniform bound | hyperbola epigraph | `y″/(1 + y′²)^{3/2} = (1 + 2x²)^{−3/2} → 0` | compactness needed, as stated | none |
| 3.1 regular domains | `ρ′ = (2 + x₁)(1 − |x|²)` at `x₁ = −3`; on `x₁ = −2` | `(−1)(−8) = 8`; `dρ′ = (1 − |x|²)dx₁ ≠ 0` | holds | none |
| 3.2 sublevel `II` | `x = |z|²`; `x = −ρ` | `2h/(2√c) = h/√c`, superlevel `−h/√c`; `Hess x = −Hess ρ` | holds | none |
| 3.3 `ρ̃` | sign and zero set on the bicollar; `[0, 1]` | `sign ρ̃ = sign t`, `ρ̃ = t` where `φ₁ = 0`; `ρ̃ = 2x` for `|x| < 1/4` | regular value `0` | none |
| 3.4 metric gluing | `(x + 1/100)dx²` on `ℝ` | negative at `x = −1/50`; `ψ g_ext + (1 − ψ)g_N` positive where `ψ > 0` only inside the positive region | holds | none |
| 3.5 realisation (headline) | compact disconnected `M` with one closed component; non-Hausdorff `M` | double is compact, `{ρ_D ≥ 0}` the first copy; not embeddable in Hausdorff `N` | theorem holds as stated; prose "every" too wide | R02 |
| 4.1 geodesics | ball, `v ⊥ q`; `v = 0` | `|q + tv|² = 1 + t²|v|² > 1`; constant curve, `τ = ∞` | holds | none |
| 4.2 second-order contact (headline) | ball; exterior; `{y ≥ x⁴}` | `ρ = −t²`, `−|dρ|II = −2`; `ρ = t²`; `−t⁴` with `II = 0` | holds; converse correctly not claimed | none |
| 4.3 `ρ̂` (repaired) | ball `ε = 1`, `ε₂ = 3/4`, `ε₁ = 1/2`; point of `W ∖ M` with `r < −1`; `W ∩ M ∖ W₁` | `W₂ = {1/4 < |x| < 7/4}`, `ψ r = 0` near `0`, `ρ̂ = 1` there; `ρ̂ ≤ max(r, −1) = −1 < −ε`; `ρ̂ ≥ min(r, 1) > 0` | smooth; `M = {ρ̂ ≥ 0}`; sandwich holds | none |
| 4.3 old route | `ψ = |x|²` near `0` | `|x|² − |x|³`, third derivative `∓6` | fails, as the new Check says | none |
| 4.5 convexity function (headline) | disc at `(0, −1)`; exterior; `n = 0` | `Hess x̃ = (2 − 2ε)g`, `dx̃_q = (0, −2) = −dρ_q`, `K_c ⊆ {ε|z − q|² ≤ c}`; `−(2 + 2ε)g`; `K_c = {x + εx² ≤ c}` | holds | none |
| 4.6 enlargement | `(1 − r²)e^{−r²}` | derivative `−2r(2 − r²)e^{−r²}`, `−2/e` at `1`, minimum `−e⁻²` at `√2` | negative control valid | none |
| 5.1 strata | `μ` on the fibre sphere, `n ≥ 1`; `n = 0` | derivative of `μ` towards `ν` at `μ = 0` is `1`; `μ = ±1`, `∂₀SM = ∅` | holds | none |
| 5.1 generator on `SM` | disc, `z = ((0, −1), (1, 0))` | `|(t, −1)|² = 1 + t² > 1` for `t ≠ 0` | formula undefined at `z` | R01 |
| 5.2 exit time | annulus; `[a, b]`; `τ = 0` case of the exit bullet | `3/2 + √3` vs limit `3/2`; `τ(x + t, −1) = (x − a) + t`; `φ₀ = z`, `μ ≤ 0` on outward `z` | holds | none |
| 5.3 fold form | `y − t²`; `y − t⁴` | `g = 0`, `F = 1`, `Q = r`, `a = y`, roots `±√y`; `∂_t²h = 0` | holds | none |
| 5.4 regularity (headline) | disc; ball; `[a, b]` | `μ/τ̃ = sin θ/(2 sin θ) = 1/2 = II/2`; `σ = −2⟨x, v⟩`, `T = 1 − |x|²`, `a = σ² + 4T`, `τ² − στ − T = 0`; `μ/τ̃ = 1/(b − a)` at both ends | holds | none |
| 5.5 criteria (headline) | `u(φ_s z) = −∫_s^{τ_ε} h∘φ_t dt`; ball `f = ⟨x, v⟩`; `M = ∅`; nonempty closed `M` | derivative at `0` is `h(z)`; bound `2`; (T, T, T); (F, F, F) | holds | none |
| 5.6 scattering (headline) | ball; `[a, b]`; `P` on the disc | `α² = id` since `⟨x − 2⟨x, v⟩v, v⟩ = −⟨x, v⟩`; `α(b, +1) = (a, +1)`, `τ̃ = −(b − a)`; `|P|² = 1 − μ²`, `ℓ = 2√(1 − |w|²)` | holds | none |
| 6.1 ball `τ` | quadratic `t² + 2⟨x − c, v⟩t + |x − c|² − R² = 0`; ellipse vertex | stated root; `(2/b²)/(2/a) = a/b²` | holds | none |
| 6.3 caps, hyperbolic | `ρ = ⟨x, p⟩ − cos R`; `u = (|x|² + y² + 1)/(2y)` | `Hess ρ = −cos R g`, `|dρ| = sin R`, `II = cot R h`; `Hess u_xx = 1/(2y) + (x² + 1)/(2y³) = u/y²`; `coth 1 ≈ 1.313`, `cot 1 ≈ 0.642` | holds | none |
| 6.5 radial metric | `b = re^{φ(r²)}`; `φ = s² − 2s` | `b′/r = e^{φ}(1/r + 2rφ′)`, equal to 1.6 with `dφ(ν_in) = −2rφ′`; `b′ = e^{r⁴ − 2r²}(2r² − 1)²`, `b′(1) = e⁻¹`, `b′(1/√2) = 0` | holds | none |

**Duplication and ownership.** Object searches of the pins: no boundary defining function,
boundary second fundamental form, mean curvature, convexity predicate, exit time (the
`exitTime` hits are contour and combinatorial objects), scattering relation or outward unit
normal. `TauCeti.secondFundamentalForm` and `TauCeti.shapeOperator`
(TauCeti/Analysis/InnerProductSpace/SecondFundamentalForm.lean:82, ShapeOperator.lean:90) are
forms of a parametrised map into an inner product space; RiemannianGeometry R5a already ties
them to immersions (its README :601–613, :3102), and this roadmap reaches them only through
3.6, so nothing is restated. The pinned topological collar predicates
(TauCeti/Geometry/Manifold/Boundary/Collar/) are consumed through GeometricTopology 1.1, which
names them (:330–335). Object searches of main and the open heads (signed distance, boundary
defining function, exit time, scattering relation, strictly convex boundary, non-trapping,
boundary normal or Fermi coordinates, mean-convex) found no second owner: Surfaces' Fermi
coordinates are along a curve in a surface (`TauCetiRoadmap/RiemannianGeometry/Surfaces/README.md:300–309`);
the open MinimalSurfaces text uses R5a's form on a boundary and defines none (:1902). The three
board packages listed are not geometric.

Overlap check: read RiemannianGeometry (open revisions adding R7.9, R5c and others, and main),
ManifoldOptimization, LorentzianGeometry, MinimalSurfaces (open), HopfRinow, Surfaces, MorseTheory
(main); the inclusion of a regular sublevel with its outward criterion and normal, and the normal
collar of a compact two-sided hypersurface, are shared with RiemannianGeometry R7.9, which exists
only in an open revision: on main and at the pins this roadmap is the only owner, and the choice
between the two texts is the maintainers' (settled as F01); nothing else shared.

**Headline theorems and padding.** Seven end theorems in the Summary: the Hessian
characterisation (2.2), the realisation theorem (3.5), second-order leaving (4.2), convexity
functions (4.5), exit-time regularity (5.4), the non-trapping equivalence (5.5), the involution
and fixed-point theorem for `α` (5.6). There is no `Suggested.lean` at the design stage, so the
one-tactic probe, the binder audit and the import checks have nothing to inspect. Elaboration:
not available (this lane does not elaborate). No Lean command was run.

**Copyright and arrangement.** Twenty passages were set beside the sources at the locators of the
sample (among them the fold lemma, the five exit-time statements, Proposition 3.3.1, the
scattering relation, the closed-extension lemma, the convexity-function construction and the
definition of defining functions). Shared material is formulas and standard names only; the
route sentences are the design's own (several fill steps the sources leave as exercises).
Contents: paternain-salo-uhlmann2023 §3.1–3.3 against Layer 5 (5.1–5.2 ↔ §3.1 in part, 5.3–5.4 ↔
§3.2, 5.5–5.6 ↔ §3.3); the convexity material of §3.1 is spread over Layers 1–4, the order inside
Layer 5 is forced by its dependency lines (5.2 needs 5.1; 5.4 needs 5.1–5.3; 5.5 and 5.6 need
5.4), and Layers 1–4 and 6 have no counterpart run. No table, figure or exercise list is reused.

Source independence: 20 passages compared with 3 sources, none shared; largest share paternain-salo-uhlmann2023, 47 of 87 source mentions; contents compared with paternain-salo-uhlmann2023: independent.

## Not verifiable

- lee-riemannian2018 (Ch. 5–8), lee-smooth2012 (Theorem 9.25), sharafutdinov1994 (Ch. 4): settled
  as uncertified; not read, not requested again. The signs they are cited for are fixed by the
  computed ball, cylinder and exterior values.
- The arXiv texts were read at the recorded versions (uhlmann-vasy2016 v1,
  stefanov-uhlmann-vasy2021 v3), not against the journal typesetting.
- No elaboration: there is no Lean file and this lane does not elaborate.
- Open pull requests were read through the index of 2026-11-13; later heads were not sought.

## Source issues

- **Misprint** in paternain-salo-uhlmann2023 at Corollary 2.5.3(b), printed p. 47: the source says the derivative of `b` is positive at radius 1; it should be at the outer radius `r₁`; affects a stated result.
- **Misprint** in paternain-salo-uhlmann2023 at Lemma 3.2.11, printed p. 64: the source says the second factor of the product is the exit time at the single argument `x − v`; it should be at the pair `(x, −v)`; affects a stated result.

## For the human reviewers

- **Ownership across two pull requests.** The open RiemannianGeometry revision that adds R7.9 states the regular-sublevel inclusion, outward criterion and normal collar that this design states in 3.1 and 4.3 (`design/README.md` lines 580–587, 871–881). Which text keeps them is undecided.
- **Licence.** paternain-salo-uhlmann2023 was read from an author's page copy carrying the publisher's personal-use notice (`sources.toml`, `licence_class = "author-page"`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "93d2394511b346b01198e256366a0dbc89c1e058", "job": "REV-DESIGN-RiemannianManifoldsWithConvexBoundary~5", "model": "fable", "worker": "chris-x55"} -->
