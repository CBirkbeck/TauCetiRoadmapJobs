# Repair report: RiemannianManifoldsWithConvexBoundary design, round 7

Findings settled: the two findings of `REV-DESIGN-RiemannianManifoldsWithConvexBoundary~6`.
Files changed: `packages/RiemannianManifoldsWithConvexBoundary/design/README.md` and
`packages/RiemannianManifoldsWithConvexBoundary/design/plan.json`. `sources.toml` is unchanged
(no new source is cited).

## F01 (P2) — applied

Old: 3.1 and 4.3 stated the sublevel inclusion, outward normal, normal collar and defining function
as owned here. New: Scope defers them to RiemannianGeometry R7.9 and says what 3.1 and 4.3 add;
supplier contract states R7.9 with hypotheses; 3.1 bullets 1, 3 and 4.3 tube and `ρ̂` cite R7.9;
Needs, Dependencies, plan prerequisites (3.1, 4.3.2, 4.3.3) and supplier sections updated.

Verification on main (`TauCetiRoadmap/RiemannianGeometry/README.md`, heading R7.9). The general
statement that the inclusion of a regular sublevel `{φ ≤ a}` (any smooth `φ`, regular value `a`,
Tau Ceti's sublevel atlas) is smooth with invertible differential, and that `v` is outward iff
`dφ(dι v) > 0`, is in the defining-function paragraph. The normal collar `c_ν(x, t) = exp(tν(x))`
is a diffeomorphism onto an open neighbourhood for small `ε`, under "M connected, Σ compact and
connected, f two-sided". The defining function `φ = h∘t` on the collar, `±1` on `Ω± ∖ U`,
`grad φ = ν`, exists once `M ∖ f(Σ)` has two components. The outward unit normal is `ν` on
`D₋ = {φ ≤ 0}` and `−ν` on `D₊`. RiemannianGeometry's standing convention (Conventions
paragraph) is Hausdorff, second countable and boundaryless. Pinned Tau Ceti: no inclusion
lemma for the sublevel exists; `TauCeti.scalarRegularSublevelChartedSpace`
(`TauCeti/Geometry/Manifold/RegularValue/Scalar/Sublevel.lean`) assumes neither `T2Space` nor
second countability, and builds the chart at a point from the ambient chart there (face chart from
the submersion chart, interior chart otherwise). That is the basis of the locality remark that
extends R7.9's first statement from second-countable to Hausdorff `N`, the generality 3.1 has.

Added with the citation, as the convention witness the new input needs: a 3.1 Check giving the sign
of the outward criterion on the ball and the half-space and what the wrong reading gives (plan
test `outward_criterion`), and in 4.3's first Check the identification `(1 − r)q = (1 + t)q` at
`t = −r` with R7.9's collar.

The same pattern elsewhere:

- 3.3's `ρ̃` and `ρ_D` are not R7.9's object. They are metric-free and normalised against
  GeometricTopology 1.3's bicollar (`ρ̃ ∘ c̃ = t`), which the atlas comparison needs. They cover the
  double, and `∂M` need not be connected. No change.
- 4.4 (collar from the tube, distance collar) and 4.6 (`M_ε` from `ρ̂`) consume 4.3. No change.
- 5.1 applies "the first item of 3.1" to `SM ⊆ SN`. `SN` is Hausdorff and second countable under
  Layer 5's standing hypotheses, so R7.9 applies there directly. No change.
- The Conventions witness (`grad ρ = −2x = 2ν_in` on the sphere) agrees with the new 3.1 Check.

## F02 (P3) — applied

Old: "RiemannianGeometry R1 item 4" in Scope, supplier contract, 6.4 route, Needs and
Dependencies; plan 6.4 `roadmap:RiemannianGeometry §R1`. New: the pinned
`TauCeti.Manifold.IsNormalDomain.mfderiv_inner_normalCoordinateField_self` and
`…leviCivitaConnection_normalCoordinateField_self` (with `IsNormalDomain`,
`normalCoordinateField`) in all five places and the plan. RiemannianGeometry 2.2 (R1.4) is named
as the section that records them. `§R1` is dropped.

Verification: on main, "§1.1 item 4" of RiemannianGeometry is the mixed polarization, and the
normal-chart fact is in "2.2 Normal-coordinate jets (R1.4)", which consumes it from Tau Ceti. At the
pin, `TauCeti/Geometry/Manifold/Riemannian/Geodesic/Normal/Coordinates.lean` declares
`TauCeti.Manifold.normalCoordinateField` (line 84), `…IsNormalDomain.leviCivitaConnection_normalCoordinateField_self`
(line 270: `leviCivitaConnection I M (normalCoordinateField I M p U w) p = 0`) and
`…IsNormalDomain.mfderiv_inner_normalCoordinateField_self` (line 292). Their hypotheses are
`[I.Boundaryless] [T2Space M]`, finite dimension, a smooth Riemannian metric and
`h : IsNormalDomain I M p U`, and `TauCeti.Manifold.IsNormalDomain` is the structure at
`…/Geodesic/Normal/Basic.lean:89`. 6.4's `N` (boundaryless, Hausdorff, second countable) meets them.
The route now uses both names: `g_ij = δ_ij + O(|z|²)` from the first and `Γ(p) = 0` from the
second, so `Hess |z|²(∂_i, ∂_j) = 2δ_ij − 2 z_k Γ^k_ij = 2g_ij + O(|z|²)`. Plan 6.4 now lists the
four `tauceti:` prerequisites. No other target cited `§R1`; the 6.3.2 test named `compare_R1`
means "compare at radius 1" and is unrelated.

## Checks run

**Dependency check** (exact output, after the final edit):

```text
candidate: RiemannianManifoldsWithConvexBoundary is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2230 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. RiemannianGeometry is on main, and R7.9 does not
consume this roadmap.

**Citation resolver** (`roadmaps resolve` on the README after the edits): no cross-roadmap citation
and no Lean name of a roadmap found nowhere. It says "Lean names outside TauCetiRoadmap were not
checked: no pinned Lake packages on this host". So the four new Tau Ceti names were checked by hand
at the pin, with file and line given above.

**Gate failures listed in the brief:** none.

**Suggested.lean:** there is none at the design stage, so the `#check @name` binder audit, the
import check and elaboration have nothing to inspect. No Lean command was run.

**Other:** `plan.json` parses, and its formatting is preserved; only the touched entries differ.
The README has no LaTeX delimiters, and the new text has no process words or machine paths. The
three README lines over 102 characters are untouched lines.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 3.1 outward criterion and `dj(ν_in)` | unit ball, `ρ = 1 − |x|²`; half-space `ρ = x⁰`; half-plane with `g = [[1, a], [a, 1]]`, `a = 1/2`; `[0, 1] ⊆ ℝ`, `ρ = x(1 − x)` | `dφ(v) = 2⟨x, v⟩`, so `ν_out = x`, `ν_in = −x = −2x/2`. `dφ(−e₀) = 1 > 0`. `grad x⁰ = (1, −a)/(1 − a²)`, `|grad x⁰| = (1 − a²)^{−1/2}`, quotient `(2/√3, −1/√3)`, equal to 1.2's Check. `dρ = 1 − 2x`: `dρ(−∂_x)` at `0` is `−1 < 0` and `dρ(+∂_x)` at `1` is `−1 < 0`, so both are outward, as 1.2's Check says | holds; the wrong reading (`ρ` for `φ`) makes `x` inward and `e₀` outward | new Check |
| 3.1 locality to non-second-countable `N` | `N` = uncountable disjoint union of copies of `ℝ`, `ρ = x` on each | each point lies in a second-countable chart domain, and `D_ρ` is the disjoint union of half-lines `[0, ∞)`. `dj` is the identity on `ℝ`, `dρ(e₀) = 1 > 0`, so `e₀` is inward | holds | stated |
| 3.1 degenerate `ρ` | `ρ ≡ 1`; `ρ ≡ −1` | `D_ρ = N` with no boundary and `j = id`; `D_ρ = ∅` | vacuous or trivial | none |
| 4.3 tube against R7.9 collar | unit sphere; strip `{0, 1} × ℝ`; two spheres `|x| = 1, 2` | `(1 − r)q = (1 + t)q` at `t = −r`, injective for `ε ≤ 1` on both sides. The strip boundary is non-compact and disconnected, and the two spheres are disconnected: both are outside R7.9 and covered by 4.3 | consistent | tube note and Check |
| 4.3 `ρ̂` against R7.9's `φ` | ball in `ℝⁿ⁺¹`, `n ≥ 1`; `[0, ∞) ⊆ ℝ`; `[0, 1] ⊆ ℝ`; disc in the first copy of `ℝ² ⊔ ℝ²` | `{|x| < 1}`, `{|x| > 1}`: two components. `(−∞, 0)`, `(0, ∞)`: R7.9's own Check gives `x − p`, and `ρ̂ = x` near `0`, `±1` beyond. `ℝ ∖ {0, 1}` has 3 components, outside R7.9; `ρ̂ = 1` on `M ∖ W` and `−1` off. `N` is disconnected, outside R7.9; `ρ̂ = −1` on the second copy | consistent; sign: `c_ν(q, t)` for `t > 0` with `ν = ν_in` lies in `{ρ > 0}`, so `Ω₊ = int M` | comparison sentence |
| 4.6 use of the normalisation | R7.9's `h` nondecreasing with `h(t) = t` on `(−δ, δ)` | `h(t) ≥ −ε` with `ε < δ` forces `t ≥ −ε`. `ρ̂` gets the same bound from lying between `r` and `−1` | both suffice | none |
| 6.4 route | unit `S²` at the pole; flat torus | `Hess r² = 2dr² + 2r cot r sin²r dθ² = 2g − (2r²/3)(g − dr²) + O(r⁴)`, positive iff `r < π/2`, matching 6.4's Check `r_p ≤ π/2`. `Γ ≡ 0`, so `Hess |z|² = 2δ` | holds | route rewritten |

## Ownership and overlap

No new construction is stated: both repairs replace an own statement or a stale locator by a
citation. The cited owners are RiemannianGeometry R7.9 (on main, earlier than every open roadmap)
and the pinned Tau Ceti. The overlap report lists no open pull request that changes this
roadmap, no dropped id and no revision-only id. The closest roadmaps listed there (ManifoldOptimization,
LorentzianGeometry, SmoothBundlesConnections, TeichmullerGeometry, RealSemisimpleLieGroups open;
RiemannianGeometry, HopfRinow, Surfaces on main) were compared by the round-6 review. The only
shared object it found is R7.9, settled here. I did not repeat the search over the open heads
because this round adds no object.

## For the maintainer

- The plan's supplier entry for RiemannianGeometry changed from sections `§R1, §R5a` to
  `§R5a, §R7.9`. No identifier of this roadmap that others cite changed: no section, layer or
  target was renumbered or renamed, and only test `outward_criterion` was added under 3.1.
- R7.9 states the inclusion for second-countable ambients. 3.1 keeps Hausdorff-only `N` through a
  stated locality argument. If R7.9 is ever restated without second countability, that parenthesis
  can shrink to a bare citation.
- No suspicious instructions were found in the review text.
