# Repair of RiemannianManifoldsWithConvexBoundary (design, round 3)

Review settled: `reports/REV-DESIGN-RiemannianManifoldsWithConvexBoundary~2.md` (verdict in
`design/review.json`), seven findings R01–R07. Six are applied as asked. R01 is applied
differently: the supplier is GeometricTopology 1.3, not AffineMorseLefschetz 4.5. Files edited:
`packages/RiemannianManifoldsWithConvexBoundary/design/README.md`, `design/plan.json`,
`sources.toml` (`cited_for` strings only). This is the design stage, so there is no
`Suggested.lean`.

## R01 (P2) — applied differently

Old: §3.3 built `int M`, the collar extension `M̃` and the double `DM` as Tau Ceti open gluings. New: `int M` is imported from GeometricTopology 1.1; `M̃` (1.3's `M ∪_f N`, `N = ∂M × [0, 1)`) and `DM = M ∪_id M` from 1.3. §3.3 keeps only `ρ̃`, `ρ_D` and the atlas comparison; gluing names removed.

- Why it differs from the review: the review said to import the collar extension from AffineMorseLefschetz 4.5. That section forms `M⁺ = M ∪ (∂M × (−1, 0])` only as one step inside its duality target (`TauCetiRoadmap/AffineMorseLefschetz/README.md:841–842`) and states no laws for it. AffineMorseLefschetz itself says that GeometricTopology Layer 1 owns collars and gluing along the boundary (lines 19–23, 134–139). GeometricTopology 1.3 (`TauCetiRoadmap/GeometricTopology/README.md:851–872`) states the laws used here: the two interiors embed openly; the union of the two collars is `∂M × (−1, 1)`; the images of `M` and `N` are closed and meet in `∂M`; it covers compactness, connectedness and the double. So 1.3 is the supplier, and Scope names AffineMorseLefschetz 4.5 as another place where the same `M⁺` is formed.
- Other places changed:
  - Scope, both bullets.
  - The supplier contracts: GeometricTopology rewritten to 1.1 and 1.3; Tau Ceti and Mathlib gluing names deleted.
  - §3.3, rewritten and retitled "Defining functions on the collar extension and the double". The Hausdorff Check on Tau Ceti's double of `int M` is deleted, since that object is no longer this roadmap's. New Checks: `M̃ ≅ (−1/2, 3/2)` with `ρ̃ = 2x` near the ends; the half-space with `ρ̃ = x⁰`; the non-example `x³(1 − x)³`; empty boundary.
  - §3.5 route and Needs; §4.4 collar citation (1.1); Layer 3 Dependencies; Summary; the Lorentzian consumer line; the `lee-smooth2012` `cited_for` entry.
  - In the plan, targets 3.3.1 and 3.3.2 became theorems `collarExtension_isRegularDomain` and `boundaryDouble_isRegularDomain`, with new prerequisites, API and tests. Target 3.5 and 4.4 prerequisites, the GeometricTopology supplier entry (`§1.1`, `§1.3`), the summary and the consumers entry were also updated.

## R02 (P2) — applied

Old: a `gap:dg-outward-unit-normal` claimed that DifferentialGeometry 12.5 does not name the normal, and §1.2 restated its uniqueness and smoothness. New: §1.2 consumes `exists_halfSpaceOutwardUnitNormal` (DifferentialGeometry 12.5; `Suggested.lean:1020–1028` on main), including pointwise uniqueness and smoothness. It keeps the chart formula, sign test, decomposition, inward uniqueness and naturality. The gap is deleted.

- The wider variant is stated separately, with its hypotheses. DifferentialGeometry's signature assumes `M` second countable (and also σ-compact, Borel, with a continuous metric, all automatic in that case). For Hausdorff `M` that is not second countable, the supplier is applied on chart sources, which are second countable open submanifolds, and the pieces are glued by pointwise uniqueness.
- Other places changed: the Scope bullet; the DifferentialGeometry contract (now quotes the three laws and the context); §1.2 Needs; plan 1.2 (statement, prerequisites, API; `contMDiff_outwardUnitNormal` and `outwardUnitNormal_unique` dropped, `outwardUnitNormal_of_chartSources` and `outwardUnitNormal_isometry` added); the plan `gaps` list is now `[]`; the DifferentialGeometry supplier `what`.
- The review's repair test checks: `a = 1/2` gives `ν_in = (2/√3, −1/√3)`, the same as §1.2's formula `(e₀ − a e₁)/√(1 − a²)`.

## R03 (P1) — applied

Old: the cap, half-space, affine-level, conformal-sign and small-sphere classifications, and `H`, had no dimension restriction; the Conventions called one-dimensional manifolds "finite unions of intervals". New: all are stated for `n ≥ 1`, with explicit `n = 0` Checks; the Conventions describe `n = 0` correctly (discrete `∂M`, zero `T_q∂M`) and cite PSU line 2642.

- New `n = 0` content:
  - §6.3: caps in `S¹` are non-trapping for every `0 < R < π`, with `τ(θ, ±1) = R ∓ θ`; Check `C_{3π/4}`.
  - §5.5: the half-circle is non-trapping.
  - §6.4: `r_p ∈ (0, π]` is admissible on `S¹`.
  - §6.2, §2.1: `[0, ∞)` has strictly convex boundary.
  - §3.2: the condition holds vacuously, including for `x(t) = t` and `x = −|z|²`.
  - §6.5: `{±1}` has strictly convex boundary even when `b′(1) < 0`.
- `H` is restricted to `n ≥ 1` in: §1.6 (`Ĥ`), Layer 1 Examples, §2.1 API, §6.1 statement and Check, §6.2, and the PositiveMass consumer line.
- Plan targets updated: 1.6, 2.1 (API and two tests), 3.2 (two tests plus a new `dimension_one`), 4.6 (`cap`, `halfspace`), 5.5.2 (`hemisphere`), 6.1.1, 6.2 (statement plus `halfline`), 6.3.1 (statement plus `arc`), 6.3.2 (`compare_R1`), 6.4 (`sphere`), 6.5.
- Also qualified: the Layer 4 and Layer 5 Examples (caps and hemisphere in `S^{n+1}`, `n ≥ 1`).

## R04 (P1) — applied

Old: the §3.1 Check said `{(2 + x₁)(1 − |x|²) ≥ 0}` is the unit ball. New: the Check uses `e^{x₁}(1 − |x|²)`, with an everywhere-positive multiplier. A new negative control shows that `(2 + x₁)(1 − |x|²)` cuts out the ball plus `{x₁ ≤ −2}` (value `8` at `x₁ = −3`, `0` regular on both pieces).

- Other places changed: §1.3 and §2.2 now say explicitly that `2 + x₁` is used as a function on the closed ball, where `2 + x₁ ≥ 1`; plan tests 1.3 `ratio`, 2.2 `ratio_invariance` and 3.1 `unit_ball` were updated, and a new 3.1 test `multiplier_positive_only_on_M` was added.
- Also: the Layer 3 Examples list the extra half-space. The `(1 − |x|²)e^{−|x|²}` construction in §4.6 was checked: its multiplier is positive everywhere, so it is correct.

## R05 (P2) — applied

Old: the §4.1 Check denied an `M`-geodesic for every `v ⊥ q`, with `|q + tv|² = 1 + t²`. New: it is for `0 ≠ v ⊥ q`, with `1 + t²|v|²`; `v = 0` is a negative control (constant geodesic, `τ(q, 0) = ∞`). Exterior statements give `t²|v|²` and need `v ≠ 0`.

- Other places changed: the §4.2 exterior Check (same unit `v`); the §6.2 statement (`0 ≠ v ⊥ (q − c)`, `ρ(q + tv) = t²|v|²`) and its Check; plan 4.1 (`ball_outward` plus a new `zero_velocity`), 4.2.2 (`exterior_halfspace`), and the 6.2 statement and `exterior` test.
- The §4.2 theorem already required `0 ≠ γ'(0)` and is unchanged.

## R06 (P2) — applied

Old: the §6.1 ball, §6.2 exterior, plan exterior and hyperbolic balls, and the ellipse lacked sign hypotheses. New: `R > 0` throughout, `a, b > 0` for the ellipse, and two negative controls: `R = 0` gives `{c}`, where `dρ` vanishes; `a = −1, b = 1` gives the unit disc, where `II = 1` but `a/b² = −1`.

- Other places changed: the §1.4 and §4.4 ball Checks (`R > 0`); `c > 0` for the sublevel balls `{|z|² ≤ c}` (Conventions witness, §3.2 Check, plan 3.2 `norm_squared`); `0 < R` for the §4.6 cap Check.
- Plan: 6.2 and 6.3.2 hypotheses; 6.1.1 gets a new test `radius_zero`; 6.1.2 `ellipse`; 1.4 `ball_radius_R`; 4.4 `ball_fermi`.

## R07 (P3) — applied

Old: §6.5 called `b′(1) > 0` "the Herglotz–Wiechert condition". New: §6.5 proves `II^ĝ = (b′(r)/r) h_eucl` on each sphere `|x| = r ≤ 1`, calls `b′(1) > 0` the outer-boundary restriction of the Herglotz condition, and states the full condition (`b′ > 0` on `(0, 1]`) as all spheres strictly convex. `φ(s) = s² − 2s` separates them.

- Sources: SUV (1.1), lines 66–72; PSU Corollary 2.5.3(a)⇔(c) and Lemma 2.5.2(b), line 2464. Clause (b) of Corollary 2.5.3, which carries the misprint the review noted at line 2480, is not cited.
- Other places changed: §6.5 Checks (direct formula at radius `r`; the `φ_s` family, for which the two tests coincide when `s < 1/2`); a new §5.5 Check (strict convexity without non-trapping); the Layer 5 Examples; §6.5 Needs (3.6 and RiemannianGeometry R5a: `B = 0` is equivalent to total geodesicity); the Layer 6 Dependencies. In the plan: the 6.5 statement, hypotheses, locator and prerequisites; tests `family` and `direct`; new tests `outer_boundary_not_full_herglotz` and `dimension_one`; and the 5.5.2 test `strictly_convex_trapped`. The SUV `cited_for` entry was updated too.

## Adversarial mathematics pass

One row per statement added or changed this round.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.2 imported normal plus chart formula | `g = [[1, 1/2], [1/2, 1]]` on the half-plane; `M = [0, 1]`; long ray `[0, ω₁)` | `ν_in = (2/√3, −1/√3)`: `g(ν, ν) = 4/3 − 2/3 + 1/3 = 1`, `g(ν, e₁) = 1/√3 − 1/√3 = 0`, `x⁰`-component `> 0`. `grad x⁰ = (1, −a)/(1 − a²)`, `|grad x⁰|² = 1/(1 − a²)`, normalised `(1, −a)/√(1 − a²)`, the same vector. `[0, 1]`: `ν_out = ∓∂_x` at `0`, `1`. Long ray: chart source `[0, ε)` is second countable, `ν_out(0) = −∂` | Sound; wider variant justified | R02 |
| 1.3 / 2.2 multiplier `2 + x₁` on the ball | `|x| ≤ 1` | `2 + x₁ ∈ [1, 3]`, `Hess(uρ)` on `T∂M` equals `u · (−2h)`, `|d(uρ)| = 2u`, ratio `h` | Sound on `M` | wording |
| 3.1 equal-set Check | `x₁ = −3`; `x₁ = −2`; the sphere | `(2 + x₁)(1 − |x|²)` equals `(−1)(−8) = 8`; at `x₁ = −2`: value `0`, `dρ' = −(3 + |y|²) dx₁ ≠ 0`. `e^{x₁}(1 − |x|²)` at `x₁ = −3`: `−8e^{−3} ≈ −0.398`; on the sphere `II = 2e^{x₁}h/(2e^{x₁}) = h` | Old Check false, new Check and control sound | R04 |
| 3.2 level-set Checks | `n = 0`, `x = t`, `x = −|z|²`; `c ≤ 0` | `ker dx = 0`: both satisfy the condition vacuously. `{|z|² ≤ c}` with `c ≤ 0` is empty on `ℝⁿ⁺¹ ∖ {0}`. `n ≥ 1`, `x = −|z|²`: `Hess = −2g < 0` | `n ≥ 1` and `c > 0` needed | R03, R06 |
| 3.3 `M̃` and `ρ̃` (collar extension) | `[0, 1]` with `c = t/2`, `1 − t/2`; half-space; empty boundary | `x = t/2` on `(−1/2, 0)`, `x = 1 − t/2` on `(1, 3/2)`, so `M̃ ≅ (−1/2, 3/2)`. `ρ̃ = t = 2x` for `|x| < 1/4`, `2(1 − x)` for `|x − 1| < 1/4`, `dρ̃/dx = ±2`. Half-space `x⁰ ∘ c̃ = t` everywhere. `∂M = ∅`: `N = ∅`, `φ₀ = 0`, `ρ̃ = s = 1` | Sound | R01 |
| 3.3 route signs | point of `int M` with `φ₀ > 0`; point of `M̃ ∖ M`; point of `∂M` | `t > 0`, `χ(t) > 0` (χ positive on `(0, 1)`, a hypothesis added this round), `φ₁ s ≥ 0`, so the sum is `> 0`. Off `M`: `t < 0`, `χ < 0`, `s = −1`, so `< 0`. On `∂M`: `φ₁ = 0`, `ρ̃ = χ(0) = 0`, `dρ̃(∂_t) = 1` | Sound (positivity of χ added) | R01 |
| 3.3 non-example | `x³(1 − x)³` on `(−1/2, 3/2)` | value `> 0` on `(0, 1)`, `< 0` outside; derivative `3x²(1 − x)²(1 − 2x)` is `0` at `0` and `1` | Regular-value clause discriminates | R01 |
| 3.3 double `ρ_D` | `D[0, 1]`; annulus | circle: zeros are the two seam points, `dρ_D(∂_t) = 1`; annulus double = torus, zeros are the two seam circles | Sound | R01 |
| 4.1 tangent-geodesic Check | `q = (1, 0)`, `v = 0, (0, 1), (0, 2)` | `|q + tv|² = 1`, `1 + t²`, `1 + 4t²`; `v = 0` is a constant geodesic of `M`, `τ = ∞` | Fixed | R05 |
| 4.2 / 6.2 exterior | same `v`; `c = 0`, `R = 1` | `ρ = |q + tv|² − 1 = 0`, `t²`, `4t²` = `t²|v|²` | Fixed | R05 |
| 4.6 cap Check | `S²`, `R = π/4`; `S¹`, `R = 3π/4` | `S²`: `M_ε` strictly convex iff `π/4 + ε < π/2`. `S¹`: vacuous; tubes about `±R` disjoint iff `ε₁ < min(R, π − R)`, so `R + ε₀ < π` | `n ≥ 1` for the threshold | R03 |
| 5.5 hemisphere / trapping Checks | `S¹` half-circle; `S²` hemisphere; `φ(s) = s² − 2s` | `τ(θ, ±1) = π/2 ∓ θ ≤ π`; `S²` equator has `τ = ∞`. `b′(1) = e^{−1}`, `b′(1/√2) = e^{−3/4} · 0 = 0` | Sound | R03, R07 |
| 6.1 ball, `R = 0`, ellipse | `R = 0`; `a = 2, b = 1`; `a = −1, b = 1` | `{c}` with `dρ(c) = 0`. `|dρ| = 2/a = 1`, `II = (2/1)/1 = 2 = a/b²`. `a = −1`: unit disc, `II = 1`, `a/b² = −1`; general `|a|/b²` | Hypotheses needed | R06 |
| 6.2 half-space | `n = 0`, `[0, ∞)`; `n = 1` | `n = 0`: `T∂M = 0`, strictly convex vacuously, `II = 0`. `n = 1`: `II(e₁, e₁) = 0`, not strictly convex | `n ≥ 1` | R03 |
| 6.3 caps | `S¹`, `R = 3π/4`; `S²`, `R = π/2`; `S²`, `R = π/4` | `τ = 3π/4 ∓ θ ∈ [0, 3π/2]`. Great circles of `{⟨x, p⟩ = 0}` lie in `C_R` iff `cos R ≤ 0`, giving `τ = ∞`. `Hess u = cos(π/4) g > 0` on the boundary | `n ≥ 1` classification, `n = 0` formula | R03 |
| 6.3.2 hyperbolic balls | `R = 0`; `R = 1` | `{u ≤ 1} = {(0, 1)}`, `du = 0` there; `R = 1`: `|grad u| = sinh 1 > 0` | `R > 0` | R06 |
| 6.4 `S¹` bound | `r_p = π` | `d(p, ·)² = θ²` smooth for `|θ| < π`; `d(θ²) = 2θ dθ ≠ 0` at `θ = ±R`; arcs non-trapping | Bound `π/2` needs `n ≥ 1` | R03 |
| 6.5 radius formula | `φ = −s` at `r = 1, 1/2`; `n = 0` | `b′(1) = −e^{−1}`, `II = −e^{−1}h` (agrees). `r = 1/2`: `b′/r = (e^{−1/4}/2)/(1/2) = e^{−1/4}`; direct `e^{−1/4}(2 − 1) = e^{−1/4}`. `n = 0`: strictly convex vacuously although `b′(1) < 0` | Sound; `n ≥ 1` for the iff | R03, R07 |
| 6.5 family `φ_s = −st` | `s = −1, 1/4, 1/2, 2` | `b′ = e^{r²}(1 + 2r²) > 0`; `e^{−r²/4}(1 − r²/2)`, minimum `e^{−1/4}/2` at `r = 1`; `b′(1) = 0`; `−3e^{−2}` at `r = 1`. Note `s = 2 > 3/2` has its minimum at `r = √(3/4)`, not at `1`, so the Check states coincidence of the two tests, not "minimum at `r = 1`" | Sound as restated | R07 |
| 6.5 endpoint vs full | `φ = s² − 2s` | `b′(r) = e^{r⁴ − 2r²}(1 + 4r⁴ − 4r²) = e^{r⁴ − 2r²}(2r² − 1)²`; `φ(1) = −1`, `φ′(1) = 0`, `II = e^{−1}h > 0`; sphere `r = 1/√2` has `II = 0`, totally geodesic (R5a `B = 0`), so its great circles are trapped | Endpoint test is not the full condition | R07 |

## Checks run

Dependency gate (exact output):

```text
candidate: RiemannianManifoldsWithConvexBoundary is not in the merge order yet; checked as if placed after QuasiregularMaps (the intake inserts it when its design is accepted)
depcheck: 236 roadmaps, 2133 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Every supplier named is on main: DifferentialGeometry, HopfRinow, RiemannianGeometry, GeometricTopology, ComplexKahlerGeometry; AffineMorseLefschetz appears only in a Scope sentence. SmoothBundlesConnections is earlier in the order.

`roadmaps resolve` on the edited README found no cross-roadmap citations and no Lean names that resolve nowhere. Lean names outside TauCetiRoadmap were not checked by that tool. `exists_halfSpaceOutwardUnitNormal` was opened directly in `TauCetiRoadmap/DifferentialGeometry/Suggested.lean:1020` on main.

`plan.json` checks: it round-trips in its original serialisation; every `target:` prerequisite exists; `gaps` is empty. The README and plan agree on every changed statement.

Suggested.lean: none at the design stage. No `#check` audit or elaboration was possible, and none was run.

## Ownership and overlaps

- GeometricTopology 1.1 and 1.3 and DifferentialGeometry 12.5 are on main, so they are earlier than every open roadmap. This roadmap now owns only the defining functions `ρ̃` and `ρ_D`, the atlas comparison, and the extension of the metric. A `roadmaps grep` over main and the 438 indexed open heads for "boundary defining function", "collar extension" and "regular domain {" found no other owner of these. The other hits are collar extensions of other objects: spinor traces in PositiveMass, PL pieces in GeneralizedCohomology, collar data in DeRhamCohomologyAndDuality and ExponentialSumsAndCircleMethodPartII.
- The overlaps report lists no open pull request that changes this roadmap, no dropped id this roadmap cites, and no id that only an open revision defines.

## For the maintainer

- Plan names changed: `collarExtension` → `collarExtension_isRegularDomain` (3.3.1) and `boundaryDouble` → `boundaryDouble_isRegularDomain` (3.3.2). Plan API names dropped: `interiorBoundaryless`, `collarExtension_boundaryless`, `collarExtension_bicollar`, `boundaryDouble_compact`, `boundaryDouble_connected`, `outwardUnitNormal_unique`, `contMDiff_outwardUnitNormal`. The `gaps` entry `dg-outward-unit-normal` is gone. This roadmap is not on main, so no other roadmap cites any of these.
- This roadmap now cites GeometricTopology 1.1 and 1.3 by section, instead of "Layer 1". GeometricTopology 1.3's statement that the glued manifold is Hausdorff and second countable is read from its Layer 1 standing convention; the contract states that assumption explicitly.
- No source was fetched and no text is missing: no `needs-references.toml` was written. The settled uncertified entries (`lee-riemannian2018`, `lee-smooth2012`, `sharafutdinov1994`) were not requested again.
- No suspicious instructions were found in the review or in the sibling roadmaps read.
