<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18017#issuecomment-6910241824 -->
Red team round 2 pass b (claude) of 39ea3d6

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) 3.1 plans again what the pin proves: Levi-Civita and Hessian naturality under local isometries; the isometry carrier and the geodesic transport are uncited

   - **Location.** `packages/RiemannianManifoldsWithConvexBoundary/README.md:730-733` ("Levi-Civita
     compatibility: … `dj(∇^D_X Y_D) = ∇^N_{dj X} Y` … consequently `Hess^D(f ∘ j) = Hess^N f`"), its
     `*Needs:*` at 769–770 ("Mathlib `CovariantDerivative.IsLeviCivitaConnection.uniqueness`"), and
     1004–1013, 1366–1368, 1562 (4.1, 5.2, 5.6: independence of the realisation).
   - **Claim.** These are targets of this roadmap, proved from the uniqueness of the Levi-Civita
     connection; "isometry of manifolds with boundary" (448, 522, 551, 629, 1326) has no carrier.
   - **Witness.** Pinned, for arbitrary models with corners (no `Boundaryless` binder):
     `TauCeti.IsLocalRiemannianIsometry.mfderiv_leviCivitaConnection_mpullback`
     (`TauCeti/Geometry/Manifold/Riemannian/Isometry/LeviCivita.lean:130`),
     `TauCeti.IsLocalRiemannianIsometry.hessian_comp` (`…/Riemannian/Hessian/Isometry.lean:45`),
     `TauCeti.RiemannianIsometry.isGeodesicCurveOn_comp_iff` and `…isGeodesicCurveOnFrom_comp_iff`
     (`…/Riemannian/Isometry/Geodesic.lean:92`, `:115`).
   - **Repair.**
     1. Replace the bullet at 730–733 by: "Levi-Civita compatibility: `j` is a local Riemannian
        isometry (`TauCeti.IsLocalRiemannianIsometry`: smooth with invertible differential by the
        first item, and inner-product preserving by the definition of the pullback metric). So Tau
        Ceti's `TauCeti.IsLocalRiemannianIsometry.mfderiv_leviCivitaConnection_mpullback` and
        `TauCeti.IsLocalRiemannianIsometry.hessian_comp`, neither of which assumes a boundaryless
        model, give `dj(∇^D_X Y_D) = ∇^N_{dj X} Y` for `x ∈ D_ρ`, `X ∈ T_x D_ρ` and a vector field `Y`
        on `N` differentiable at `x` (`Y_D` its pullback), and `Hess^D(f ∘ j) = Hess^N f` for `f` of
        class `C²` near `x`, boundary points included; both are consumed, not proved again. Prove
        `dj(grad^D(f ∘ j)) = grad^N f` on `D_ρ`."
     2. In 3.1's `*Needs:*` and in the Layer 3 Dependencies replace "Mathlib
        `CovariantDerivative.IsLeviCivitaConnection.uniqueness`" by the three Tau Ceti names; remove
        that Mathlib name from "From Mathlib" (line 235; no other section uses it).
     3. In "From Tau Ceti" add: "isometries `TauCeti.RiemannianIsometry`
        (`TauCeti/Geometry/Manifold/Riemannian/Isometry/Basic.lean`: a smooth diffeomorphism
        preserving the inner product, for arbitrary models with corners) and
        `TauCeti.IsLocalRiemannianIsometry` (`…/Isometry/Local.lean`), with
        `TauCeti.IsLocalRiemannianIsometry.mfderiv_leviCivitaConnection_mpullback`,
        `TauCeti.IsLocalRiemannianIsometry.hessian_comp`,
        `TauCeti.RiemannianIsometry.isGeodesicCurveOn_comp_iff` and
        `TauCeti.RiemannianIsometry.isGeodesicCurveOnFrom_comp_iff`".
     4. In Conventions, "Setting", add: "An isometry of Riemannian manifolds with boundary is a
        `TauCeti.RiemannianIsometry`."
     5. In 4.1, after the consequences, add: "For an abstract `(M, g)` and a realisation
        `Φ : M → {ρ̃ ≥ 0}` (3.5), a `TauCeti.RiemannianIsometry` of manifolds with boundary, geodesics
        and their initial data correspond by `TauCeti.RiemannianIsometry.isGeodesicCurveOn_comp_iff`
        and `TauCeti.RiemannianIsometry.isGeodesicCurveOnFrom_comp_iff`; through them `τ` (5.2) and
        `α` (5.6) of `(M, g)` are those of its realisation." Add the two names to 4.1's `*Needs:*`.

     Tested on the instance: closed unit ball, `f = 1 − |x|²`: `hessian_comp` gives
     `Hess^D(f ∘ j) = Hess^N f = −2g`, the value 1.4's Check uses (`II = h`). On the doubled
     half-line nothing changes: the pinned lemmas carry no Hausdorff hypothesis and none is claimed.

2. **F02** (P3) the route of the fold normal form (5.3) re-derives the pinned parametric Morse lemma

   - **Location.** `README.md:1399-1401`: "Route: the implicit function theorem for `∂_t h = 0`,
     Hadamard factorisation of `h` around the critical point, and the inverse function theorem for
     `r = s F(s, y)^{1/2}`."
   - **Claim.** The second and third steps are work of this roadmap.
   - **Witness.** `TauCeti.exists_parametric_morse_chart`
     (`TauCeti/Analysis/Calculus/Morse/Parametric.lean:100`): a jointly `C^{n+2}` family with critical
     zero section and invertible vertical Hessian has a parameter-preserving chart `ψ` with
     `f z = f (z.1, 0) + ½ D²_v f(z.1, 0)(ψ z).2²`.
   - **Repair.** Replace the Route sentence by: "Route: the implicit function theorem for
     `∂_t h = 0` gives the critical time `t = g(y)`; the family `f(y, s) := h(s + g(y), y)`, cut off
     to a globally smooth function, has a critical zero section and vertical Hessian
     `∂_s² f(y₀, 0) < 0`, so Tau Ceti's parametric Morse lemma
     `TauCeti.exists_parametric_morse_chart` (fibre `ℝ`, base `ℝ^K`) gives a chart
     `ψ(y, s) = (y, ρ(y, s))` with `f(y, s) = f(y, 0) − c(y) ρ(y, s)²`,
     `c(y) := −½ ∂_s² f(y, 0) > 0`; set `a(y) := f(y, 0) = h(g(y), y)`, and let `Q(r, y)` be `g(y)`
     plus the fibre component of `ψ⁻¹(y, r/√c(y))`." Add the name to 5.3's `*Needs:*` and to "From Tau
     Ceti"; the Hadamard names stay in 5.3's `*Needs:*`, the even-function lemma uses them. Tested on 5.3's first Check, `h = y − t²`:
     `g = 0`, `f(y, s) = y − s²`, `c = 1`, `ρ = s`, `a(y) = y`, `Q(r, y) = r`, roots `±√y`; on
     `h = y − t⁴` the vertical Hessian is `0` and the lemma does not apply, as the Check says.

3. **F03** (P3) the reordering added in round 1 is a pinned declaration, restated without its name

   - **Location.** `README.md:356-360` ("followed by the linear reordering `(y, t) ↦ (t, y)`, which
     carries `ℝⁿ × [0, ∞)` onto `EuclideanHalfSpace (n+1)`") and 816–817, 837.
   - **Claim.** The identification of the product model with the half-space model is described here.
   - **Witness.** `TauCeti.EuclideanHalfSpace.collarDiffeomorph`
     (`TauCeti/Geometry/Manifold/Boundary/Collar/Basic.lean:151`):
     `Diffeomorph ((𝓡 n).prod (𝓡∂ 1)) (𝓡∂ (n + 1)) (EuclideanSpace ℝ (Fin n) × EuclideanHalfSpace 1) (EuclideanHalfSpace (n + 1)) k`,
     normal coordinate in slot `0` (`collarAmbientEquiv_apply_zero`, line 84).
   - **Repair.** At 357–359 write: "followed by Tau Ceti's
     `TauCeti.EuclideanHalfSpace.collarDiffeomorph` (`TauCeti/Geometry/Manifold/Boundary/Collar/Basic.lean`),
     the diffeomorphism `(y, t) ↦ (t, y)` from the product model `(𝓡 n).prod (𝓡∂ 1)` onto
     `𝓡∂ (n+1)` that puts the normal coordinate in slot `0`"; at 816 and 837 write "the reordering
     `TauCeti.EuclideanHalfSpace.collarDiffeomorph` of the supplier contracts"; add the name to "From
     Tau Ceti" and to 3.3's `*Needs:*`. Tested: `n = 0`, `M = [0, 1]`: the map is the identity of
     `[0, ∞)`, 3.3's interval Check unchanged; half-space Check: `(y, t) ↦ (t, y)`, `x⁰ = t`.

4. **F04** (P2) one sentence of 5.4 reproduces the wording of its source

   - **Location.** `README.md:1449-1450`: "`μ/τ̃` on `∂SM ∖ ∂₀SM` extends to a smooth positive
     function on `∂SM` whose value at `(q, dι u) ∈ ∂₀SM` is `II_q(u, u)/2`."
   - **Claim.** The statement is in the roadmap's own words.
   - **Witness.** `paternain-salo-uhlmann2023` lines 2936–2939 (Lemma 3.2.8): 11 consecutive words
     shared ("extends to a smooth positive function on ∂SM whose value at"), and the rest of the
     sentence follows the source clause by clause.
   - **Repair.** Replace by: "The quotient `μ/τ̃`, defined where `τ̃ ≠ 0`, has a smooth extension to
     all of `∂SM`; the extension is positive, and at a glancing point `(q, dι u)` it equals
     `II_q(u, u)/2`." Tested on 5.4's Check: disc at `(0, −1)`, `μ/τ̃ = sin θ/(2 sin θ) = 1/2` off
     `θ ∈ {0, π}`, extension `1/2 = II/2` at the two glancing vectors.

5. **F05** (P3) the lens data `L`, `ℓ` and the projection `P` (5.6) have one Check

   - **Location.** `README.md:1545-1548` (definitions of `P`, `L`, `ℓ`); the only Check on them is
     1573.
   - **Claim.** Each definition has at least three discriminating Checks.
   - **Witness.** The Checks of 5.6 at 1571–1598 test `α` and `geodesicEndpoint`; only "Closed unit
     disc: `|L(x, w)| = |w|` … `ℓ(x, w) = 2√(1 − |w|²)`" tests `L`, `ℓ`, and it does not fix which of
     `∂±SM` the lift uses.
   - **Repair.** Add to the Checks of 5.6:
     - "Lens data on the closed unit disc at `x = (0, −1)`, `w = (c, 0)`, `|c| ≤ 1`: the lift is
       `v = (c, √(1 − c²))`, the exit point `y = (2c√(1 − c²), 1 − 2c²)`, and
       `L(x, w) = (y, v − ⟨v, y⟩ y) = (y, (c(2c² − 1), 2c²√(1 − c²)))`, of norm `|c|`; at `c = 0`,
       `L = ((0, 1), 0)` and `ℓ = 2`; at `|c| = 1` the lift is glancing, `L(x, w) = (x, w)` and
       `ℓ = 0`. Lifting through `∂₋SM` instead (`w − √(1 − |w|²) ν_in`, an outward vector) gives
       `ℓ ≡ 0`, not `2√(1 − |w|²)`."
     - "`M = [a, b]` (`n = 0`): `B∂M` is the two zero vectors, `(P|_{∂₊SM})⁻¹(a, 0) = (a, +1)`,
       `L(a, 0) = (b, 0)`, `L(b, 0) = (a, 0)` and `ℓ = b − a` at both."
     - "Ball of radius `R`: `ℓ(x, w) = 2R√(1 − |w|_h²)`, so `ℓ(x, 0) = 2R`, the diameter; `ℓ` scales
       with the metric while `B∂M` is taken for `h`."

6. **F06** (P3) "convexity function" is used as a term and never defined

   - **Location.** `README.md:17`, 51, 384, 1202 (title of 4.5), 1274, 1871;
     `Suggested.lean:206` ("**Convexity functions near a strictly convex boundary point.**") and
     the name `exists_convexityFunction`.
   - **Claim.** The term is standard or defined here.
   - **Witness.** `uhlmann-vasy2016` lines 137–140 and 507–509 and `stefanov-uhlmann-vasy2021`
     lines 128–129 describe the function by its properties and give it no name; 4.5 states the
     properties without attaching the name to them.
   - **Repair.** In 4.5, second bullet, after "(`exists_convexityFunction`)" insert: "a convexity
     function at `q` for `ρ`, by which this roadmap means"; so that it reads "There is
     (`exists_convexityFunction`) a convexity function at `q` for `ρ`, by which this roadmap means an
     open `U ∋ q` in `N`, `x̃ ∈ C^∞(U)` and `c₀ > 0` with …". Tested: the disc Check's
     `x̃ = |z|² − 1 − ε|z − q|²` satisfies every clause; `x = −ρ` on a small ball fails compactness
     of `K_c` and is not one.

7. **F07** (P3) chapter-level locators into `lee-riemannian2018` where suppliers on main give the item

   - **Location.** `README.md:1080` and 1151 ("Lee, *Introduction to Riemannian Manifolds*,
     Ch. 5–6"), 1753 ("Ch. 6").
   - **Claim.** Exact locators.
   - **Witness.** `TauCetiRoadmap/RiemannianGeometry/Surfaces/README.md:308` cites the same book as
     "'Tubular Neighborhoods and Fermi Coordinates', pp. 133–136";
     `TauCetiRoadmap/SmoothBundlesConnections/README.md:1325` as "Lemma 6.16 and Theorem 6.17".
   - **Repair.** 1080 and 1151: "Ch. 5, 'Tubular Neighborhoods and Fermi Coordinates', pp. 133–136,
     and Ch. 6 (Gauss lemma)"; 1753: "Ch. 6, Lemma 6.16 and Theorem 6.17 (uniformly normal and
     geodesically convex balls)"; the same in `sources.toml` `cited_for`. The source stays
     uncertified; the locators are those the two roadmaps on main carry.

Seven findings: two P2 (S01, S04) and five P3 (S02, S03, S05, S06, S07). No statement of
`packages/RiemannianManifoldsWithConvexBoundary/Suggested.lean` or of the README was found false.
Both files were read in full (`README.md`, 1899 lines; `Suggested.lean`, 378 lines). No Lean was
run; elaborated types are those of the worker's signature file.

## Round 1: each earlier finding at this head

| Id | Status | Repaired passage (README line unless said) | Witness |
|---|---|---|---|
| 1a/F01 | repaired | 1859–1865: "A Part II of PositiveMass for manifolds whose boundary is given intrinsically … PositiveMass itself (5.1–5.2) takes its mean curvature from RiemannianGeometry R5b's `A(X, Y) = ⟨B(X, Y), ν⟩` and does not consume this roadmap" | `TauCetiRoadmap/PositiveMass/README.md:935` (R5b's `A`), `:951-954` (`H = 1`, `H = −1`) |
| 1a/F02 | repaired (applied differently; the repairer's reason holds) | 1767–1782: "`E(x, v) = (x, exp_x v)` is smooth … injective … invertible differential … so `Hess F(p, ·)` … is continuous in `(p, y, w)`; it equals `2` at `y = p`" | `TauCetiRoadmap/SmoothBundlesConnections/README.md:1327-1328` exports "`IsNormalDomain` on every tangent ball of that normal radius"; pinned `IsNormalDomain` has `injOn`, `isLocalDiffeomorphOn` (`TauCeti/Geometry/Manifold/Riemannian/Geodesic/Normal/Basic.lean:89`). `|y|⁴`: `Hess(0) = 0`, strictly convex on lines, so the round-1 repair text would have been false |
| 1a/F03 | repaired | 606 "1.4 uses 1.1–1.3, DifferentialGeometry 12.3, …"; 1281 "4.4 uses 1.4, 4.3, GeometricTopology 1.1 (smooth collars) …"; 1613 "5.5 uses 2.1, 3.4–3.5, 4.2, 4.6, 5.1–5.2 and 5.4" | all 32 `*Needs:*` lines compared again with the six Dependencies paragraphs: sections and roadmap suppliers agree |
| 1b/F01 | repaired | `Suggested.lean:249-252` "For Hausdorff `M` … without the Hausdorff property the value can depend on the choice …, and every theorem about this map assumes `[T2Space M]`"; README 1539, 1550, 1588–1593 | doubled half-line: endpoints over `1` and `1′` at `T = 1`, equal at `T = 2`; both theorems using the map carry `[T2Space M]` |
| 1b/F02 | repaired; the repair introduced S03 | 356–360 "its charts are the product charts of 1.1 … followed by the linear reordering `(y, t) ↦ (t, y)`"; 816 | `TauCetiRoadmap/GeometricTopology/README.md:785-792`; the reordering is a pinned declaration that the repair does not cite (S03) |

No repair introduced a false statement.

## The computed pass

Context of `Suggested.lean`: `{n : ℕ} {M : Type u}`, `[TopologicalSpace M]`,
`[ChartedSpace (EuclideanHalfSpace (n + 1)) M]`, `[IsManifold (𝓡∂ (n + 1)) ∞ M]`; from line 80
`[RiemannianBundle …]`, `[IsContMDiffRiemannianBundle … 1 …]`; every theorem adds the `∞` instance.
"disc" is the closed unit disc at `x = (0, −1)`; "interval" is `[a, b]`, `n = 0`.

| Statement (README §) | Instances tried | Values computed | Result |
|---|---|---|---|
| `boundaryTangentSpace` (1.1) | half-plane at `0`; `n = 0` | range of zero-insertion `= span e₁ = ker dx⁰`; `0` | sound |
| `IsBoundaryDefiningFunctionOn` (1.3) | `1 − \|x\|²`; `(1 − \|x\|²)²`; `\|x\|² − 1`; `∂M = ∅` | passes; `dρ = 0` fails; negative inside fails; constant `1` passes | sound; lost `IsManifold` binder is unused by the fields |
| `secondFundamentalForm` (1.4) | ball radius `R`; exterior; half-space; `n = 0` | `−(−2)/(2R) h = h/R`; `−h`; `0`; form on `0`; slot `0` of `extChartAt` is the constrained coordinate (`IsOutwardPointing` reads the same slot) | sound |
| `IsStrictlyConvexAt`, `IsStrictlyConvexBoundary` (2.1) | ball; half-space `n ≥ 1`, `n = 0`; `{y ≥ x³}` | true; false, true; `6x/(1 + 9x⁴)^{3/2}` | sound |
| `isStrictlyConvexAt_iff_hessian_neg` (2.2) | `ρ = u x⁰`, `u(q) > 0`; `(2 + x₁)(1 − \|x\|²)`; `−ρ` | `Hess ρ = u(q) Hess x⁰` on `ker dx⁰`; `−2(2 + x₁)h`; excluded by `pos` | true both ways |
| `IsStrictlyConcaveLevelSetAt` (3.2) | `\|z\|²` at `y ≠ 0`, at `0`; affine, `dim ≥ 2`, `dim 1`; `dim 0` | true; `dx = 0` false; `Hess = 0` false, vacuous true; first clause false | sound |
| `exists_isSmoothEmbedding_regularDomain` (3.5) | `M = ∅`; closed `M`; interval; half-line; `S¹ ⊔ [0, 1]`; doubled half-line | `N = ∅`; `N = M`, `ρ ≡ 1`; circle, two regular zeros; `(−1, ∞)`; three circles, `ρ = −1` on the second copy of `S¹`, `ConnectedSpace M` false; excluded by `T2Space` | true as typed; Mathlib `ImmersionAtProp` (`Immersion.lean:143`) holds with `F = 0` on a half-space chart target |
| `not_exists_isGeodesicCurveOnFrom_of_isStrictlyConvexAt` (4.2) | ball `v ⊥ q`; exterior; `{y ≥ x⁴}`; `n = 0` | `x⁰∘γ`: value `0`, derivative `0`, second derivative `−\|dx⁰\| II(v, v) < 0`; `+t²` (hypothesis fails); `II = 0` (hypothesis fails); no nonzero `v` | true, no Hausdorff needed |
| `mem_interior_of_isGeodesicCurveOn` (4.2) | constant curve on `∂M`; interval; `a = b` | excluded by `hnc`; monotone affine curve; `Icc a a` not `UniqueDiffOn` | true |
| `exists_convexityFunction` (4.5) | disc; exterior; `x := −ρ` on a ball; `U = N` compact | `Hess x̃ = (2 − 2ε)g`, `dx̃_q = (0, −2) = −dρ_q`, `K_c ⊆ {ε\|z − q\|² ≤ c}`; `−(2 + 2ε)g`, hypothesis false; `K_c` not closed; `dx ≠ 0` impossible | true, not vacuous |
| `IsGlancing` (5.1) | disc `(1, 0)`, `(0, 1)`; zero vector at `∂M`; interior | yes, no; yes; no | sound |
| `exitTime`, `IsNonTrapping` (5.2) | disc; outward vector; zero vector; interval; closed `M`; `T ≤ 0` | `2 sin θ` / `0`; `0` (`x⁰∘γ ≥ 0` forbids a negative derivative); `⊤`; `(b − x)/v`; `⊤`; `ofReal T = 0` | sound |
| `geodesicEndpoint` (5.6) | disc `T = 1, 3, 0, −1`; doubled half-line | `((0, 0), (0, 1))`, `z`, `z` (`Icc 0 0` not `UniqueDiffOn`), `z` (`0 ∉ ∅`); two values | sound under `T2Space` |
| `scatteringRelation` (5.6) | inward, outward, glancing unit `z` on the ball; zero vector | `(x − 2⟨x, v⟩v, v)` by the first branch; the same by the else-branch (endpoint of `−z` negated); `z`; `z` (`⊤.toReal = 0`) | sound |
| `contMDiffOn_exitTime` (5.4) | disc; interval; outward non-glancing boundary vector; `M = ∅` | `2 sin θ`, smooth off `θ ∈ {0, π}`, continuous there; `(b − x)/v`, `(x − a)/\|v\|`; transversal root of `ρ(γ(t))` with value `0` on `∂M`; vacuous | true |
| `exists_contMDiff_eq_exitTime_sub_exitTime_neg` (5.4) | ball; interval | `F = −2⟨x, v⟩`, `dF(X) = −2\|v\|² = −2` on `SM`; `F = (a + b − 2x)v`, equal to `σ` at `v = ±1`, `dF(X) = −2v² = −2` | true; `dF(X)` on `SM` depends only on `F\|SM` |
| `exists_contMDiff_eq_exitTime_mul_exitTime_neg` (5.4) | ball; interval | `1 − \|x\|²`; `(b − x)(x − a)`, `σ² + 4T = (b − a)²` | true |
| `isNonTrapping_tfae` (5.5) | ball; nonempty closed `M`; `M = ∅`; half-circle | all hold (`f = ⟨x, v⟩`, `Xf = 1`); all fail (`u(φ_t z) = u(z) + t` unbounded on compact `SM`); all hold; all hold | true |
| `scatteringRelation_involutive` (5.6) | ball; interval | `⟨x′, v⟩ = −⟨x, v⟩`, twice gives `z`, fixed iff `⟨x, v⟩ = 0`; `(a, +1) ↦ (b, +1) ↦ (a, +1)`, no glancing unit vector | true |
| `exists_contMDiffOn_eq_scatteringRelation` (5.6) | ball | `F = α ∘ r`, `r(x⁰, x′, v) = (0, x′, v/\|v\|)`, values in `TM` over `∂M` | true |
| 1.6 conformal law | `φ = log 2`; `φ = −\|x\|²`; pinned `hessian_rescale` | `2h`; `e^{−1}(1 − 2)h`; `Hess_ĝ ρ = Hess ρ + \|dρ\| dφ(ν_in) g` on `ker dρ` | agrees |
| 3.3 `ρ̃` | interval, collar `t/2`; `x³(1 − x)³` | `ρ̃ = 2x` for `\|x\| < 1/4`; derivative `0` at the ends | agrees |
| 3.5 radial collar Check | `c(q, t) = (1 − t/2)q` | `M̃` = disc of radius `3/2`, `ρ̃ = 2(1 − \|x\|)` for `3/4 < \|x\| < 5/4` | agrees |
| 3.6 Gauss equation | sphere; cylinder; R5a's displayed sign | `0 + 1·1 − 0 = 1`; `0`; `+⟨B(X,W),B(Y,Z)⟩ − ⟨B(X,Z),B(Y,W)⟩` | agrees |
| 4.3 `ρ̂ = ψ r + (1 − ψ)s` | ball `ε₂ = 3/4`, `ε₁ = 1/2`; point with `ρ̂ ≥ −δ` off `M` | `W₂ = {1/4 < \|x\| < 7/4}`; `r < −δ` forces `ρ̂ < −δ` | agrees |
| 4.4 | ball; cap; strip | `−½ ∂_r(1 − r/R)² = 1/R`; `cot φ₀`; `d_M((0.8, 0), ∂M) = 0.2 ≠ 0.8` | agrees |
| 4.6 | `(1 − r²)e^{−r²}` | derivative `−2r(2 − r²)e^{−r²}`: `−2/e` at `1`, minimum `−e^{−2}` at `√2` | agrees |
| 5.2 annulus | `(−3/2, −1)`, `e₁` | `3/2 + √3`; limit `3/2 − √(2δ − δ²)` | agrees |
| 5.3 fold form | `y − t²`; `y − t⁴` | `Q = r`, `a = y`; no nondegenerate critical point | agrees (S02 for the route) |
| 5.4 fold Check | ball | `a = σ² + 4T = 4(⟨x, v⟩² + 1 − \|x\|²)`, `Q = (σ + r)/2` | agrees with Remark 3.2.13 |
| 5.5 route `(i) ⇒ (ii)` | `u = −∫₀^{τ_δ} h∘φ_t` | `u(φ_s z) = −∫_s^{τ_δ(z)} h(φ_t z) dt`, derivative `h(z)` | agrees |
| 5.6 lens data | disc `w = (c, 0)` | `\|P_y v\|² = c²(2c² − 1)² + 4c⁴(1 − c²) = c²`; `ℓ = 2√(1 − c²)` | agrees (S05) |
| 6.1 | general speed; ellipse | `(0 + √(1/16))/(1/16) = 4`; `(2/b²)/(2/a) = a/b²` | agrees |
| 6.3 | cap; `p = 2e`; hyperbolic `(0, 2)` | `cot R`; `1/√15`; `u = 5/4`, `\|du\| = 3/4`, `Hess u_xx = u/y²` | agrees |
| 6.4 | sphere; torus `R = 1/4` | eigenvalue `2s cot s < 0` for `s > π/2`; `II = 4h`, `τ ≤ 1/2` | agrees |
| 6.5 | `φ = s² − 2s`; `φ = −s` | `b′ = e^{r⁴ − 2r²}(2r² − 1)²`; `−e^{−1}h` | agrees with 1.6 |

## Verified sound

- **Declarations read:** 22 of 22 (11 definitions, 11 theorems); elaborated types compared with
  the README statements, nothing changed. Pinned definitions opened: `IsGeodesicCurveOn`
  (`UniqueDiffOn`, `C²`, any model), `IsGeodesicCurveOnFrom`, `curveVelocityWithin`,
  `geodesicSpray` (no `Boundaryless`), `hessian`, `mgradient`, `IsOutwardPointing`,
  `IsRegularValue`, `scalarRegularSublevelChartedSpace` (any `E` with `finrank = n + 1`, slot `0`
  is `a − f`), `IsNormalDomain`, Mathlib `ImmersionAtProp`.
- **Headlines.** Seven end theorems of the Summary, all stated; the `TM` forms of Layer 5 are
  equivalent to the `SM` statements. One-tactic probe by reading: no padding.
- **Targets read:** all 32 sections, 122 Checks; every Check value met in the table was
  recomputed.
- **Locators verified:** every line locator into `paternain-salo-uhlmann2023` (lines 307–310,
  2443–2530, 2640–3127), `stefanov-uhlmann-vasy2021` (lines 8–230) and `uhlmann-vasy2016` (lines
  15–56, 128–142, 494–524): 71 locators, none wrong.
- **Pinned names:** the 61 Tau Ceti names and 22 Mathlib names of the "From Tau Ceti" and "From Mathlib"
  paragraphs were each searched at the pins; all exist.
- **Sibling citations checked on main (14):** DifferentialGeometry 5.1, 12.1–12.3, 12.5
  (`exists_halfSpaceOutwardUnitNormal`, README line 2950 and Suggested line 1020); RiemannianGeometry
  conventions (lines 188–192), R5a Gauss equation, R5c, R7.9 (lines 4510–4595), 2.2 (R1.4);
  Surfaces 1.2–1.3; GeometricTopology 1.1, 1.3 and the Layer 1 convention; ComplexKahlerGeometry
  K5a (line 1795); SmoothBundlesConnections B6.0; AffineMorseLefschetz 4.5; PositiveMass 5.1;
  HopfRinow under `Completed/`.
- **Ownership.** `roadmaps grep` on main and the open heads for scattering relation,
  non-trapping, boundary defining function, convex boundary, geodesic vector field, convexity
  function, level-set concavity, the nine own Lean names: no second owner. LorentzianGeometry and
  ManifoldOptimization (closest by vocabulary) are not among the checkouts given; they were
  searched through `roadmaps grep` only.
- **Policy.** The pull request changes only the package folder. No `lemma`, `set_option`,
  `#eval`, sorry'd data, pull-request number or process narrative. No gap is declared
  (`design/plan.json` `gaps` is empty) and none is hidden.
- **Dependency check** (command of the brief): `depcheck: 252 roadmaps, 2395 edges, 0 problem(s)`;
  no UPWARD, CYCLE or `moved:` line.

## Not verifiable

- `lee-riemannian2018`, `lee-smooth2012`, `sharafutdinov1994`: uncertified, not read. The
  locators proposed in S07 are taken from two roadmaps on main, not from the text.
- Elaboration: no Lean was run (read-only pass).
- Whether the bundled pullback metric of 3.1 is installed on `D_ρ` as the instance that the
  pinned lemmas of S01 read is an implementation matter not visible in a README.
- Ownership against the open pull requests not in the list of checkouts was checked by
  `roadmaps grep` only.

Source independence: 83 passages compared with 3 sources (71 locators and 12 further passages: 1.4, 2.1, 3.5, 4.2, 4.5 twice, 5.2, 5.3 twice, 5.5 route, 5.6, two docstrings), one shared (S04, 11 words); largest share paternain-salo-uhlmann2023, 47 of 84 source citations; contents compared with paternain-salo-uhlmann2023 Sections 2.5 and 3.1–3.3: independent (its 3.1 is spread over Layers 1–5; inside Layer 5 the order 5.2 → 5.4 → 5.5, 5.6 is forced by the `*Needs:*` lines); the texts of lee-riemannian2018, lee-smooth2012 and sharafutdinov1994 could not be read.

## Source issues

- **Misprint** in paternain-salo-uhlmann2023 at Lemma 3.2.11, printed page 64: the source says the second factor of the product `T` is the exit time at the single argument `x − v`; it should be the exit time at the pair `(x, −v)`; affects nothing.
- **Misprint** in paternain-salo-uhlmann2023 at Corollary 2.5.3(b), printed page 47: the source says the derivative of `b` is positive at `1`; it should be at the outer radius `r₁` of the section's annulus; affects nothing.
- **Error** in paternain-salo-uhlmann2023 at Lemma 3.1.8, printed pages 56–57: the source says every compact manifold with boundary embeds isometrically in a closed connected manifold of the same dimension; it should assume no closed component other than a connected `M` itself (a closed component fills its extension); affects a stated result.
- **Gap** in paternain-salo-uhlmann2023 at Exercise 3.2.12, printed page 64: the source says an even smooth function of one variable is a smooth function of its square; it should be stated with smooth parameters, as the proof of Lemma 3.2.11 uses it; affects the proof.
- **Gap** in paternain-salo-uhlmann2023 at Lemma 3.2.3, printed pages 59–60: the source says the implicit function theorem at the transversal exit gives smoothness of the exit time; it should also show that the root found is the exit time of nearby vectors; affects the proof.
- **Misprint** in uhlmann-vasy2016 at Section 3, printed page 11: the source says the lower bound for the second Hamilton derivative of the new function holds over the cotangent space at `p`; it should be over the neighbourhood `U₀`; affects nothing.

## For the human reviewers

- **Licence.** `paternain-salo-uhlmann2023` was read from an author's copy on a university page (`packages/RiemannianManifoldsWithConvexBoundary/sources.toml`, `licence_class = "author-page"`, posted with the publisher's personal-use notice); the README cites locators only.
- **Not tested.** `lee-riemannian2018`, `lee-smooth2012` and `sharafutdinov1994` are uncertified; wording and arrangement of 1.5, 1.6, 3.6, 4.3, 4.4, 6.4 were not compared with them (none has the largest share of locators).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "39ea3d6832b8367f23655b0acfc17d1a676f4977", "job": "RT-RiemannianManifoldsWithConvexBoundary~2b", "model": "fable", "worker": "chris-x52"} -->
