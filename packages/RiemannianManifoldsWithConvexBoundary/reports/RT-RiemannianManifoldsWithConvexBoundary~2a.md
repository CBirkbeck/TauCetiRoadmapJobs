<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18017#issuecomment-6909983346 -->
Red team round 2 pass a (claude) of 39ea3d6

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) 6.4 takes the distance identity on the whole normal ball from a supplier statement made on a shrunken ball

   **Location.** `packages/RiemannianManifoldsWithConvexBoundary/README.md:1758` ("in normal
   coordinates `z` at `p`, `d(p, ·) = |z|` (HopfRinow Layer 2)") and `:1772-1773` ("a diffeomorphism of
   `W` onto `{(p, y) : p ∈ int K', d(p, y) < r}` (HopfRinow Layer 2's local distance identity)").

   **Claim.** HopfRinow Layer 2 gives `d(x, exp_x v) = |v|` for every `|v| < r`, `r` the uniform normal
   radius, and `exp_x(B(0, r)) = B(x, r)`.

   **Witness.** `Completed/HopfRinow/README.md:440-443`: "shrink the normal ball … global-infimum
   statement … for radial segments in the smaller ball". The full-ball form is pinned:
   `TauCeti/Geometry/Manifold/Riemannian/Geodesic/Gauss/Distance.lean:151` and `:194`.

   **Repair.** The mathematics is right; cite the pinned declarations that carry it at full radius.

   1. `README.md:1758`: replace "(HopfRinow Layer 2)" by "(HopfRinow Layer 2; on every tangent ball
      contained in a normal domain by Tau Ceti
      `TauCeti.Manifold.IsNormalDomain.edist_riemannianExp_eq_of_mem_ball`)".
   2. `README.md:1773`: replace "(HopfRinow Layer 2's local distance identity)" by "(the image is that
      set by Tau Ceti `TauCeti.Manifold.IsNormalDomain.edist_riemannianExp_eq_of_mem_ball`,
      `d(x, exp_x v) = |v|` for `|v| < r`, and
      `TauCeti.Manifold.IsNormalDomain.edist_eq_ofReal_add_infEDist`, by which a point off
      `exp_x(B(0, s))` is at distance at least `s` from `x`, for every `s < r`; both for the distance
      `Manifold.riemannianEDist`, which is their `IsRiemannianManifold` hypothesis)".
   3. Add the two names to the "From Tau Ceti" paragraph after
      `TauCeti.Manifold.IsNormalDomain.leviCivitaConnection_normalCoordinateField_self`
      (`README.md:278-279`), to the `*Needs:*` of 6.4 (`:1801-1805`) and, as "Tau Ceti's distance
      identity on normal balls", to the Layer 6 Dependencies (`:1853-1854`).

   Tested on the instance: on `S^{n+1}` the tangent ball of radius `π` is a normal domain; the pinned
   identity gives `d(p, exp_p v) = |v|` for all `|v| < π` and the image `{d(p, ·) < π}`, the punctured
   sphere, which a statement on an unspecified smaller ball does not determine.

One P3 finding (S01), a citation to sharpen; no P1 or P2 finding survived the computed pass. Both
files were read in full (`packages/RiemannianManifoldsWithConvexBoundary/README.md`, 1899 lines;
`packages/RiemannianManifoldsWithConvexBoundary/Suggested.lean`, 378 lines). No Lean was run
(read-only pass); elaborated types are those of the worker's signature file.

## Round 1 findings at this head

| Finding | Status | Witness at 39ea3d6 |
|---|---|---|
| 1a/F01 (PositiveMass listed as consumer) | repaired | `README.md:1859-1865`: "A Part II of PositiveMass for manifolds whose boundary is given intrinsically … PositiveMass itself (5.1–5.2) takes its mean curvature from RiemannianGeometry R5b's `A(X, Y) = ⟨B(X, Y), ν⟩` and does not consume this roadmap". `TauCetiRoadmap/PositiveMass/README.md` §5.1 on main names R5b. |
| 1a/F02 (6.4 uniformity from B6.0) | repaired (differently, reason sound) | `README.md:1767-1782`: "let `r > 0` be SmoothBundlesConnections B6.0's uniform normal radius on a compact neighbourhood `K'` of `K` … there is `r_K ∈ (0, r]` such that `Hess F(p, ·)` is positive definite on `B(p, r_K)`". The repair's reason holds: `\|y\|⁴` is strictly convex along lines with `Hess(0) = 0`. New Check `README.md:1786-1792` recomputed below. One loose citation inside the new route: S01. |
| 1a/F03 (Dependencies versus `*Needs:*`) | repaired | `README.md:606` "1.4 uses 1.1–1.3, DifferentialGeometry 12.3, …"; `:1281` "4.4 uses 1.4, 4.3, GeometricTopology 1.1 (smooth collars) and Mathlib's partitions of unity"; `:1613` "5.5 uses 2.1, 3.4–3.5, 4.2, 4.6, 5.1–5.2 and 5.4". All six Dependencies paragraphs were compared again with the 32 `*Needs:*` lines: they agree. |
| 1b/F01 (`geodesicEndpoint` independence without Hausdorff) | repaired | `Suggested.lean:249-252`: "For Hausdorff `M`, … the choice of `γ` does not matter; without the Hausdorff property the value can depend on the choice"; `README.md:1539` "which, `M` being Hausdorff, does not depend on the choice of `γ` (4.1)"; Check at `:1588-1593`. Only a docstring changed; the two theorems that use the map carry `[T2Space M]`. |
| 1b/F02 (GeometricTopology 1.3 on `∂M × [0, 1)`) | repaired | `README.md:356-360`: "`∂M × [0, 1)` is taken over `𝓡∂ (n+1)` … followed by the linear reordering `(y, t) ↦ (t, y)`"; used at `:816` and `:836-837`. `TauCetiRoadmap/GeometricTopology/README.md:785-792` has the half-space model and the product structure "with the half-space model in the second factor". |

No repair introduced an error. Values recomputed on the changed text:

| Changed statement | Instances | Values | Result |
|---|---|---|---|
| 6.4 uniform radius | `S^{n+1}`, `n ≥ 1`; `S¹`; flat torus; `K = ∅` | `Hess s² = 2ds² + 2s cot s (g − ds²)`: eigenvalue `2s cot s`, `> 0` iff `s < π/2`, normal radius `π`, so `r_K ≤ π/2 < r`; `S¹`: only eigenvalue `2`, `r_K = π`; torus: `Hess = 2g`, `r_K = r = 1/2`; vacuous | holds; `r_K < r` can be forced |
| 6.4 `E(x, v) = (x, exp_x v)` | torus `r = 1/2` | `E(x, v) = (x, x + v)`, inverse `(p, y) ↦ (p, y − p)` on `\|y − p\| < 1/2`, image `{d(p, y) < 1/2}` | holds; see S01 for the citation of the image |
| `geodesicEndpoint` wording | doubled half-line, `T = 1, 2` | endpoints over `1` and `1′`; both over `2` | claim now exactly under `T2Space` |
| reordering `(y, t) ↦ (t, y)` | `n = 0`; half-space `n ≥ 1` | identity of `[0, ∞)`; `x⁰ = t ≥ 0` | holds |

## The computed pass

Context of `Suggested.lean`: `{n : ℕ} {M : Type u}`, `[TopologicalSpace M]`,
`[ChartedSpace (EuclideanHalfSpace (n + 1)) M]`, `[IsManifold (𝓡∂ (n + 1)) ∞ M]`; from line 80
`[RiemannianBundle …]` and `[IsContMDiffRiemannianBundle (𝓡∂ (n + 1)) 1 …]`; every theorem adds
the `∞` instance in its own signature; the two `LevelSets` sections add `E`, `N` over `𝓘(ℝ, E)`
with `[FiniteDimensional ℝ E]` and a `C¹` metric. "disc" is the closed unit disc at `x = (0, −1)`.

| Declaration (README §) | Instances tried, values on each side | Result |
|---|---|---|
| `boundaryTangentSpace` (1.1) | half-plane at `0`: range of zero-insertion `= span e₁ = ker dx⁰`; `n = 0`: range of the map from the zero space `= 0` | sound |
| `IsBoundaryDefiningFunctionOn` (1.3) | ball: `1 − \|x\|²` passes; `(1 − \|x\|²)²` fails (`dρ = 0`); `\|x\|² − 1` fails `pos`; glued global `ρ = Σφ_i x⁰_i + φ₀`: on `∂M`, `dρ = Σφ_i dx⁰_i`, positive on inward vectors | sound; dropped `IsManifold` binder is used by no field |
| `secondFundamentalForm` (1.4) | ball radius `R`: `−(−2)/(2R) h = h/R`; exterior `−h`; half-space `0`; `n = 0`: form on `0`; slot `0` is the constrained coordinate (`TauCeti.IsOutwardPointing` reads the same slot with `< 0`) | sound |
| `IsStrictlyConvexAt`, `IsStrictlyConvexBoundary` (2.1) | ball true; half-space false for `n ≥ 1`, true for `n = 0`; `{y ≥ x³}`: `6x/(1 + 9x⁴)^{3/2}` | sound |
| `isStrictlyConvexAt_iff_hessian_neg` (2.2) | `ρ = u x⁰`: `Hess ρ = u(q) Hess x⁰` on `ker dx⁰`, `u(q) > 0`; ball with `(2 + x₁)(1 − \|x\|²)`: `−2(2 + x₁)h`; `n = 0`: both sides vacuous | true both ways |
| `IsStrictlyConcaveLevelSetAt` (3.2) | `\|z\|²`: true off `0`, false at `0`; affine: false for `dim ≥ 2`, true in `dim 1`; `dim E = 0`: false (`dx = 0`) | sound |
| `exists_isSmoothEmbedding_regularDomain` (3.5) | `[0, 1]` → circle; half-line → `(−1, ∞)`; closed `M`: `N = M`, `ρ ≡ 1`; `M = ∅`; `S¹ ⊔ [0, 1]`: double of three circles, `ρ_D = −1` on the second copy of `S¹`, compact, `ConnectedSpace M` false; Mathlib's `ImmersionAtProp` asks equality only on `(domChart.extend I).target`, so a codimension-0 map from a half-space chart qualifies with `F = 0` | true as typed |
| `not_exists_isGeodesicCurveOnFrom_of_isStrictlyConvexAt` (4.2) | ball, unit `v ⊥ q`: `x⁰ ∘ γ` has value `0`, derivative `0`, second derivative `−\|dx⁰\| II(v, v) < 0`; exterior: `+t²`, hypothesis fails; `n = 0`: no nonzero `v` | true, no `T2Space` needed |
| `mem_interior_of_isGeodesicCurveOn` (4.2) | interior touch: minimum of `x⁰ ∘ γ ≥ 0`, tangent velocity, nonzero constant speed, previous row; `Icc a b` with `a ≥ b`: no geodesic (`UniqueDiffOn` fails or `hnc` fails) | true |
| `exists_convexityFunction` (4.5) | disc: `x̃ = \|z\|² − 1 − ε\|z − q\|²`, `Hess = (2 − 2ε)g`, `dx̃_q = (0, −2) = −dρ_q`, `K_c ⊆ {ε\|z − q\|² ≤ c}`, `K₀ = {q}`; exterior: hypothesis fails; `dim E = 1`: `−x − εx²`; `dim E = 0`: hypothesis false | true, not vacuous |
| `IsGlancing` (5.1) | disc `(1, 0)` yes, `(0, 1)` no; zero vector at a boundary point yes; interior no | sound |
| `exitTime`, `IsNonTrapping` (5.2) | disc `2 sin θ` / `0`; `T ≤ 0` contributes `0` (`Icc 0 0` is not `UniqueDiffOn`, `0 ∉ Icc 0 T` for `T < 0`); zero vector `⊤`; `[a, b]`: `b − x`; closed manifold `⊤` | sound |
| `geodesicEndpoint`, `scatteringRelation` (5.6) | disc, `T = 1, 3, 0, −1`: `((0, 0), (0, 1))`, `z`, `z`, `z`; outward `v = (0, −1)`: else-branch gives `((0, 1), (0, −1)) = x − 2⟨x, v⟩v`; glancing unit vector fixed; zero vector fixed | sound |
| `contMDiffOn_exitTime` (5.4) | disc `2 sin θ`; outward non-glancing boundary vector: nearby root of `ρ(γ(t)) = 0` with `∂_t = dρ(v) < 0`, equal to `0` on `∂M`; `[a, b]`: `(b − x)/v` | true |
| `exists_contMDiff_eq_exitTime_sub_exitTime_neg` (5.4) | ball `F = −2⟨x, v⟩`, `XF = −2\|v\|² = −2`; `[a, b]`: `(a + b − 2x)v`, `XF = −2v² = −2`; `σ(φ_t z) = (τ − t) − (τ(x, −v) + t)` | true |
| `exists_contMDiff_eq_exitTime_mul_exitTime_neg` (5.4) | ball `1 − \|x\|²`; `[a, b]`: `(b − x)(x − a)`, `σ² + 4T = (b − a)²`, root `b − x` | true |
| `isNonTrapping_tfae` (5.5) | ball: all hold (`f = ⟨x, v⟩`, `Xf = 1`); nonempty closed `M`: all fail; `M = ∅`: all hold; `S¹ ⊔` ball: all fail; `u(φ_s z) = −∫_s^{τ_δ} h`, `Xu = h` | true |
| `scatteringRelation_involutive` (5.6) | ball `α(x, v) = (x − 2⟨x, v⟩v, v)`, `⟨x′, v⟩ = −⟨x, v⟩`; exit cannot be tangent (`ρ ∘ γ ≈ −c(t − τ)² < 0` before `τ`); `[a, b]`: `α(a, +1) = (b, +1)` | true |
| `exists_contMDiffOn_eq_scatteringRelation` (5.6) | `F = α ∘ r`, `r(x⁰, x′, v) = (0, x′, v/\|v\|_g)`; values in `TM` | true |

README statements recomputed with fresh instances (the values of round 1 were not reused):

| Statement | Values | Result |
|---|---|---|
| 1.3 comparison | `ρ′ = uρ`, `u = \|dρ′\|/\|dρ\|` on `∂M`: ball, `u = 2 + x₁` | agrees |
| 3.1 second Check | `{ρ′ ≥ 0}` = ball ∪ `{x₁ ≤ −2}`; `dρ′ = (1 − \|x\|²)dx₁` on `x₁ = −2`, `\|x\|² ≥ 4` | agrees |
| 3.3 `ρ̃ = φ₀ χ(t) + φ₁ s` | both terms `≥ 0` on `int M` and one `> 0`; `ρ̃ = t` where `φ₁ = 0`, `\|t\| ≤ 1/2`; `[0, 1]`: `2x` for `\|x\| < 1/4` | agrees |
| 3.6 Gauss equation | sphere `0 + 1·1 − 0 = 1`; cylinder `0` | agrees |
| 4.3 tube sign and `ρ̂` | injectivity keeps `E(q, r) ∉ Σ` for `r ≠ 0`, so the sign is constant on `(0, ε(q))`; off `M`, `r < −δ` gives `ρ̂ < −δ` (convex combination with `−1`) | agrees |
| 4.4 | ball `−½∂_r(1 − r/R)² = 1/R`; strip `d((0.8, 0), ∂M) = 0.2` | agrees |
| 4.6 | `(1 − s)e^{−s}`: minimum `−e^{−2}` at `s = 2`; arc of `S¹`: outward tube `< π − R` | agrees |
| 5.2 annulus | `3/2 + √3`; limit `3/2 − √(2δ − δ²) → 3/2` | agrees |
| 5.3 fold form | `a(y) = max_t h(t, y) ≥ h(0, y)`; ball: `a = 4(⟨x, v⟩² + 1 − \|x\|²)`, `Q(±√a) = −⟨x, v⟩ ± √(…)` | agrees with `paternain-salo-uhlmann2023` lines 2970–2982 |
| 5.4 `μ/τ̃` | `h = \|dρ\|μt − ½\|dρ\| II t² + …`, root `≈ 2μ/II`; disc `1/2` | agrees |
| 5.6 lens data | disc `ℓ = 2μ = 2√(1 − \|w\|²)`; `τ̃(α(a, +1)) = −(b − a)` | agrees |
| 6.1 | ellipse vertex `(2/b²)/(2/a) = a/b²`; `τ(0, e₁/4) = 4` | agrees |
| 6.3 | `cot(arccos ¼) = 1/√15`; `coth 1 ≈ 1.313`, `cot 1 ≈ 0.642`; `Hess(−⟨x, p⟩) = ⟨x, p⟩g` | agrees |
| 6.5 | `1 + 2r²(2r² − 2) = (2r² − 1)²`; `φ = −s`: `e^{−1}(1 − 2)` | agrees with 1.6 |

## Verified sound

- **Counts.** Declarations read: 22 of 22 (11 definitions, 11 theorems). README sections read:
  all 32 numbered sections with their 32 Check blocks. Line locators opened in this pass: 45
  (`paternain-salo-uhlmann2023` 27, `stefanov-uhlmann-vasy2021` 11, `uhlmann-vasy2016` 7), none
  wrong. Sibling citations resolved on main in this pass: 14 (statements read for B6.0, HopfRinow
  Layer 2, GeometricTopology 1.1 and 1.3, DifferentialGeometry 12.5 and PositiveMass 5.1; for the
  others the section was confirmed to exist under the cited id, their statements having been
  compared in round 1 and main being unchanged for them). Library names: the 87 backticked
  Mathlib and Tau Ceti names of the README were each found declared at the pins (searched by
  final name component).
- **Headlines and padding.** The seven end theorems of the Summary are all stated (2.2, 3.5, 4.2
  twice, 4.5, 5.4 three times, 5.5, 5.6 twice); the module docstring names none as not statable,
  correctly. Each of the 11 definitions occurs in a stated theorem; no theorem follows from a
  definition or one pinned lemma; no `example`, `#check`, `set_option`, `lemma` or sorry'd data.
  Imports: `import Mathlib` and six `TauCeti.*` modules.
- **Signatures.** All 22 elaborated types compared with the README: `T2Space`, `CompactSpace`,
  `SecondCountableTopology` and the `∞` metric instance are present where the README has them;
  the one dropped binder (`IsManifold` on `IsBoundaryDefiningFunctionOn`) is used by no field.
  Nothing changed (read-only).
- **Pinned definitions read.** `TauCeti.Manifold.IsGeodesicCurveOn` and `IsGeodesicCurveOnFrom`
  (`UniqueDiffOn`, `C²`, `0 ∈ s`, initial data in `TM`); `TauCeti.Manifold.hessian` (`IsManifold I 2`,
  `C¹` metric, no boundaryless hypothesis); `TauCeti.IsOutwardPointing` (contains `x ∈ ∂M`, slot `0`
  negative); `TauCeti.Manifold.IsNormalDomain` (fields `injOn`, `isLocalDiffeomorphOn`, as 6.4 uses);
  `TauCeti.secondFundamentalForm 𝕜 i x` (normal projection of `D²i`, as 6.1 uses); Mathlib
  `ImmersionAtProp`, `Manifold.IsSmoothEmbedding`.
- **Suppliers resolved on main.** SmoothBundlesConnections B6.0 ("positive uniform normal …
  radius bounds on each compact set …, with `IsNormalDomain` on every tangent ball of that normal
  radius", lines 1327–1328); HopfRinow Layers 1–2 under `Completed/`; GeometricTopology 1.1, 1.3 and
  the interval collar Check (line 815); DifferentialGeometry 12.5 (`exists_halfSpaceOutwardUnitNormal`,
  three laws, uniqueness sentence); RiemannianGeometry R5a, R5b, R5c, R7.9, 2.2 (R1.4);
  RiemannianGeometry/Surfaces 1.2–1.3; ComplexKahlerGeometry K5a; AffineMorseLefschetz 4.5;
  PositiveMass 5.1–5.2. Note, not a finding: B6.0 also plans the local inverse-function theorem
  for `(x, v) ↦ (x, exp_x v)`; 6.4 derives the invertibility of the differential in one clause
  from `IsNormalDomain` and needs the global statement on the tube, which B6.0 does not state.
- **Dependency check** (the command of the brief): `depcheck: 249 roadmaps, 2376 edges, 0
  problem(s)`; no UPWARD, CYCLE or `moved:` line.
- **Declared gaps.** None declared (`design/plan.json` has `gaps = []`); none hidden: every cited
  section exists on main with the statement the contract gives.
- **Ownership.** `roadmaps grep` on main and at the open heads for scattering relation,
  non-trapping, boundary defining function, (strictly) convex boundary, glancing, mean-convex: no
  match outside this roadmap. Signed distance and Fermi coordinates occur on main only in
  RiemannianGeometry R7.9 and Surfaces 1.2–1.3, which the scope section cites; "second fundamental
  form of the boundary" occurs in RiemannianGeometry/MinimalSurfaces 10.1 as R5a's `B`, the object
  3.6 identifies with `II`. The overlap file lists no shared roadmap, dropped id or second copy;
  none found.
- **Policy.** The pull request changes only the package folder (README, Suggested.lean, metadata,
  sources.toml, reports). No pull-request number or process narrative in the README or
  docstrings. `sources.toml` has no local path; its `cited_for` covers every chapter the README
  cites.

## Not verifiable

- `lee-riemannian2018`, `lee-smooth2012`, `sharafutdinov1994`: uncertified, texts not read. Their
  locators are at chapter level (Ch. 5–6, 6, 7–8, 8; Theorem 9.25; Ch. 4) and are the only source
  cited for 1.5 and 3.6; the mathematics of those sections was checked independently. Whether the
  conformal change law of `II` (1.6) is in Ch. 7–8 of `lee-riemannian2018` was not confirmed.
- Agreement of the theorem numbers of the author-page copy of `paternain-salo-uhlmann2023` with
  the printed edition was not checked.
- Elaboration: no Lean was run; types are those of the worker's signature file.
- Ownership against open pull requests was checked through `roadmaps grep` and the overlap file,
  not by reading each sibling checkout.

Source independence: 13 passages compared with 3 sources (2.1, 3.5, 4.2, 4.5, 5.3 fold form, 5.4 route for `τ̃` and for `μ/τ̃`, 5.5 route, 5.6 definition and lens data, three docstrings), none shared beyond hypothesis lists the mathematics forces; largest share paternain-salo-uhlmann2023, 38 of the 66 source mentions in Layers 1–6 (counted by line and source); contents compared with paternain-salo-uhlmann2023 Sections 2.5 and 3.1–3.3: independent (its 3.1 is spread over Layers 1–5; inside Layer 5 the order exit time, regularity, criteria and scattering relation is forced by the `*Needs:*` lines 5.2 → 5.4 → 5.5, 5.6, and 5.1 and 5.3 have no counterpart section); the texts of lee-riemannian2018, lee-smooth2012 and sharafutdinov1994 could not be read.

## Source issues

- **Misprint** in paternain-salo-uhlmann2023 at Lemma 3.2.11, printed page 64: the source says the second factor of the product `T` is the exit time at the single argument `x − v`; it should be the exit time at the pair `(x, −v)`; affects nothing.
- **Gap** in paternain-salo-uhlmann2023 at Exercise 3.2.12, printed page 64: the source says an even smooth function of one variable is a smooth function of the square; it should be the version with smooth parameters, which the proof of Lemma 3.2.11 uses; affects the proof.
- **Gap** in paternain-salo-uhlmann2023 at Lemma 3.1.8, printed pages 56–57: the source says a compact manifold with boundary has a closed connected extension; it should assume `M` connected (the section's standing hypothesis), since a closed component is its own extension; affects a stated result.
- **Misprint** in uhlmann-vasy2016 at Section 3, printed page 11 (line 519): the source says the lower bound for the second Hamilton derivative of the new function holds over the cotangent space at `p`; it should be over the neighbourhood `U₀`; affects nothing.

## For the human reviewers

- **Licence.** `paternain-salo-uhlmann2023` was read from an author's copy on a university page (`packages/RiemannianManifoldsWithConvexBoundary/sources.toml`, `licence_class = "author-page"`); the roadmap cites locators only.
- **Not tested.** `lee-riemannian2018`, `lee-smooth2012` and `sharafutdinov1994` are uncertified: wording and arrangement of 1.5, 1.6, 3.6, 4.3, 4.4 and 6.4 were not compared with them (none has the largest share of locators).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "39ea3d6832b8367f23655b0acfc17d1a676f4977", "job": "RT-RiemannianManifoldsWithConvexBoundary~2a", "model": "fable", "worker": "chris-x30"} -->
