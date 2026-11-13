<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13810#issuecomment-6849195493 -->
Review (claude) of 6950c69

Verdict: needs_changes

1. **F01** (P2) Regular-sublevel inclusion and the normal collar are also stated by RiemannianGeometry R7.9

   **Location.** `design/README.md` 3.1, lines 580–587: "`j` is a smooth closed embedding whose differential is invertible at every point" and "`dj(ν_in) = grad ρ/|grad ρ|` on `{ρ = 0}`"; 4.3, lines 869–893 (tube, `r_Σ`, `ρ̂`); plan targets 3.1, 4.3.1–4.3.3.

   **Claim.** This roadmap owns these facts (Scope, lines 39–49). An open revision of a roadmap on main now states the same ones, and the Scope section names no owner or difference.

   **Witness.** Pull request #2223 (RiemannianGeometry, "R7.9, separating and two-sided hypersurfaces"), `TauCetiRoadmap/RiemannianGeometry/README.md` at its head:

   - lines 3960–3965: for any smooth `φ` with regular value `a`, the inclusion of `{φ ≤ a}` with `TauCeti.scalarRegularSublevelChartedSpace` is smooth with invertible differential, and `v` is outward iff `dφ(dι v) > 0`;
   - lines 3966–3970: for the pulled-back metric, DifferentialGeometry 12.5's outward unit normal is `±ν`;
   - lines 3884–3892 and 3942–3945: the normal collar `c_ν(x, t) = exp(tν(x))` of a compact two-sided hypersurface, its coordinate `t`, and a defining function `h∘t` extended by `±1`.

   With `φ = −ρ`, `a = 0`, the first two are 3.1's first and third bullets. The third is 4.3's tube and `ρ̂` for compact `Σ`. Neither exists at the pins (TauCeti/Geometry/Manifold/RegularValue/Scalar/Sublevel.lean has no inclusion-derivative or outward lemma), so both texts plan the same new targets.

   **Exact repair.** RiemannianGeometry is on main and earlier in the merge order, so this roadmap cites it.

   1. In "It leaves to other roadmaps", add: the smooth inclusion of a regular sublevel with invertible differential, the outward criterion `dφ(dι v) > 0`, the identification of DifferentialGeometry 12.5's normal on it, and the normal collar and `±1`-normalised defining function of a compact connected two-sided separating hypersurface: RiemannianGeometry R7.9.
   2. In 3.1, replace "whose differential is invertible at every point, boundary points included" and the proof of `dj(ν_in) = grad ρ/|grad ρ|` by citations of R7.9 for `φ = −ρ`, `a = 0`. Keep closedness, Levi-Civita compatibility, the `II` formula, independence of `ρ` and lengths.
   3. In 4.3, add one clause saying how the tube differs from R7.9's collar: it starts from `f`, allows noncompact and disconnected `Σ` with a smooth variable `ε`, and adds the Gauss lemma, `|grad r_Σ| = 1`, the distance identities and the sandwich bounds on `ρ̂`. State that for compact connected separating `Σ`, `E_Σ = c_ν` with `ν = ν_Σ`.
   4. Add `RiemannianGeometry §R7.9` to the plan's suppliers and to the prerequisites of 3.1 and 4.3.1–4.3.3, to the 3.1 and 4.3 *Needs* lines and to the Layer 3 and 4 Dependencies.

   R7.9 exists only at the head of #2223, so the citation makes that revision a dependency; the report records it here for the merge-order paragraph. If the maintainers prefer this roadmap as owner of the sublevel-inclusion facts, the change belongs in #2223, and this finding is settled by an ownership note instead.

   **Repair test.** Unit sphere in `ℝⁿ⁺¹`: R7.9's Check (line 4091) has `φ = (|y|² − 1)/2`, `D₋` the closed ball with outward normal `ν = y`. Here `ρ = 1 − |x|² = −2φ`, so `ν_in = −x = −ν` and `ν_out = x`: the two agree. `c_ν(x, t) = (1 + t)x` and `E(q, r) = (1 − r)q` agree with `r = −t`, since `ν_Σ = grad ρ/|grad ρ| = −ν`.

2. **F02** (P3) The cutoff route for `ρ̂` does not give a smooth function

   **Location.** `design/README.md` 4.3, lines 889–892: "a smooth cutoff `ψ : N → [0, 1]` equal to `1` on the closed tube `E_{∂M}({|r| ≤ ε₁(q)})` and to `0` off `W`"; plan target 4.3.3 (route sentence).

   **Claim.** `ρ̂ = ψ r_{∂M} + (1 − ψ) s` is smooth on `N`.

   **Witness.** Unit sphere, `ε = 1` (admitted: lines 897–898), `W = {0 < |x| < 2}`, `r = 1 − |x|`. A `ψ` with zero set exactly `N ∖ W ∋ 0`, for example `ψ = |x|²` near `0`, gives `ψ r = |x|² − |x|³`, not `C³` at `0`.

   `exists_contMDiff_zero_iff_one_iff_of_isClosed` (Mathlib/Geometry/Manifold/PartitionOfUnity.lean:797) gives a `ψ` positive on all of `W` minus the closed tube, so its support reaches `∂W`, where `r_{∂M}` need not extend smoothly. The statement itself is true.

   **Exact repair.** Choose a third radius `ε₁ < ε₂ < ε` (constant when `∂M` is compact) whose closed tube is closed in `N`, by the same closed-tube theorem, and take `ψ = 0` off `W₂ := E_{∂M}({|r| < ε₂(q)})`. Then `supp ψ` lies in the closed `ε₂`-tube, inside `W`, and `ψ r_{∂M}` extends by zero smoothly. Make the same change in plan 4.3.3 and add the sphere with `ε = 1` as a Check. The listed properties of `ρ̂` are unchanged.

   **Repair test.** Sphere with `ε = 1`, `ε₂ = 3/4`, `ε₁ = 1/2`: `ψ = 0` for `|x| ≤ 1/4`, so `ψ r` vanishes near `0`; `ρ̂ = s = 1` there, as required on `M ∖ W₁`.

3. **F03** (P3) Second countability of `N` is missing from 4.3, 4.6 and 6.4

   **Location.** `design/README.md` line 796: "`(N, g)` is a Hausdorff boundaryless Riemannian manifold as in 3.1"; 4.3 (line 869), 4.6 (line 974), 6.4 (line 1348: "boundaryless Hausdorff Riemannian `(N, g)`"); plan target 6.4 hypotheses.

   **Claim.** The tube, the enlargement and the uniform small-ball radius are proved from the cited inputs for every Hausdorff `N`.

   **Witness.** The tube theorems assume `[SecondCountableTopology N]` (TauCeti/Geometry/Manifold/TubularNeighborhood/Riemannian/Noncompact.lean:50). SmoothBundlesConnections B6.0 assumes it too (README line 1316). Plan targets 4.3.1–4.6 list "N second countable"; README 4.3 and 4.6 do not.

   README line 922 already relies on it ("second countable because `N` is, as for the tube of 4.3"). The statements stay true without it, component by component, so this is a README–plan–supplier mismatch, not a false claim.

   **Exact repair.** State "second countable" in the Layer 4 standing sentence for 4.3, 4.4 and 4.6, matching the plan. In 6.4, either add the hypothesis to README and plan, or add to the route: apply B6.0 on a second-countable open neighbourhood of the compact set of centres (a finite union of chart domains).

   **Repair test.** `N` an uncountable disjoint union of planes with `M` a disc in one of them: the pinned theorem does not apply to `N`; it applies to the component, which is the repaired statement.

4. **F04** (P3) The exit-point bullet of 5.2 uses `μ` and `φ_t` off the unit bundle

   **Location.** `design/README.md` lines 1073–1075: "If `M` is compact and `τ(x, v) < ∞`, the geodesic extends to `[0, τ(x, v)]`, ends on `∂M`, and `μ(φ_τ(x, v)) ≤ 0`".

   **Claim.** The bullet is stated for every tangent vector with finite exit time.

   **Witness.** `μ` is defined on `∂SM` (line 1034) and `φ_t` on `SN` (line 1041). For `v = e₁/4` at `0` in the unit ball, `τ = 4 < ∞` but `φ_τ(x, v)` is not defined. Plan 5.2 `exitTime_flow` says "unit v".

   **Exact repair.** Insert "for unit `v`" in the README bullet, as the plan has it; the two reversal identities in the same bullet are then also on `SM`.

   **Repair test.** Unit ball, `x = 0`, `v = e₁`: `τ = 1`, exit point `e₁`, `μ = ⟨e₁, −e₁⟩ = −1 ≤ 0`; `τ(e₁/2, e₁) = 1/2 = 1 − 1/2`.

Four findings: one P2 and three P3. All five round-3 findings are repaired. The blocking finding is new this round and comes from the open pull requests, not from the mathematics: an open revision of RiemannianGeometry now states facts that this design also owns. No design file, plan or manifest entry was changed by this review.

## Previous findings and repairs

Locations are in `packages/RiemannianManifoldsWithConvexBoundary/design/README.md` unless stated.

| Round 3 finding | Repaired passage | Assessment |
|---|---|---|
| R01 (P1), tube radius used as distance radius | Lines 917–919: "there is a smooth `η : ∂M → (0, ∞)` with `η ≤ ε`, constant when `∂M` is compact, such that `E({(q, r) : |r| < η(q)}) ⊆ W'`"; lines 936–944 add the unequal-strip Check; plan target 4.4 and test `unequal_strips`. | **Repaired.** Recomputed: at `(0.8, 0)`, `r = 0.8`, `d_M = 0.2`; with `η = 0.4`, `0.005` the half-tube is `[0, 0.4) ∪ (0.995, 1]` in `x`, where `min(x, 1 − x) = r`. The route for `η` (lower semicontinuous `m`, then a smooth minorant) is sound. |
| R02 (P2), unit speed in the ball formula and diameter bound | Lines 1252–1255: "for `x ∈ B̄(c, R)` and `|v| = 1`, hence, by the homogeneity of 5.2, …"; line 1260: "for every `(x, v) ∈ SD`"; plan 6.1.1, 6.1.2, test `speed`. | **Repaired.** `τ(0, e₁/4) = (0 + √(1/16))/(1/16) = 4 ≤ 2/(1/4) = 8`; `τ(0, e₁) = 1`; `τ(0, 0) = ∞`. |
| R03 (P1), empty closed manifold | Lines 1187–1194: "A nonempty compact manifold without boundary" and the empty-domain Check; plan 5.5.1 `closed_manifold`, 5.5.2 `closed_manifold`, `empty_domain`. | **Repaired.** `TauCeti.IsRegularValue` (TauCeti/Geometry/Manifold/RegularValue.lean:91–92) quantifies over the fibre, so `ρ ≡ −1` is admissible and gives (true, true, true); a nonempty closed `M` gives (false, false, false). |
| R04 (P2), sharp constant needs `n ≥ 1` | Lines 543–546: "The closed unit ball of `ℝⁿ⁺¹`, `n ≥ 1` … For `n = 0` … no largest constant"; plan 2.3.2 tests `unit_ball`, `unit_ball_dimension_one`. | **Repaired.** `n ≥ 1`: `1 ≥ c`; `n = 0`: `0 ≥ 0` for `c = 100`. |
| R05 (P3), slanted normal at `a = 0` | Lines 321–324: "For `a ≠ 0` … at `a = 1/2`, `ν_in = (2/√3, −1/√3)` … At `a = 0` the formula returns `e₀`"; plan 1.2 `slanted_metric`. | **Repaired.** `g(ν, ν) = 4/3 − 2/3 + 1/3 = 1`, `g(ν, e₁) = 1/√3 − 1/√3 = 0`. |

No finding was marked "not actionable in this package". No maintainer notes were supplied. The repaired patterns were searched for elsewhere: unit-speed qualifiers (5.4, 5.5, 6.1–6.3 Checks all carry them), "nonempty" on closed-manifold statements (5.2, 5.5 carry it), `n ≥ 1` on sign and sharpness statements (2.1, 2.3, 3.2, 4.6, 5.5, 6.2–6.5 carry it). One residue of the unit-speed pattern remains in 5.2 (R04 below).

## Verified sound

**Coverage and shape.** Read the whole 1,454-line README, the plan (49 targets, 127 Checks, 137 internal prerequisite edges, all resolving, acyclic by a depth-first check) and the six manifest entries. The 12 definitions and constructions each have at least three Checks. Six layers, each ending in Examples and Dependencies; the order is forced by the dependency lines (II → convexity → regular domains → boundary geodesics → exit time → examples), and no layer is named after a source chapter. No LaTeX delimiters, process words, pull-request numbers, anchors or machine paths in the README. No declared gap (`gaps: []`), consistent with the README.

**Dependency check, exact output:**

```text
candidate: RiemannianManifoldsWithConvexBoundary is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 206 roadmaps, 1897 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `roadmaps resolve` reported no citation or Lean name found nowhere.

**Supplier citations resolved on main (7342e8f).**

| Citation | File and line | Result |
|---|---|---|
| GeometricTopology 1.1 | TauCetiRoadmap/GeometricTopology/README.md:788–820 | Collar definition, existence for second-countable `M`, interior boundaryless, interval collar `t/2`, `1 − t/2` (the 3.3 Check) all present. |
| GeometricTopology 1.3 | same, :851–887 | Gluing with collars, `∂M × (−1, 1)` identification, closed images meeting in `∂M`, compactness, connectedness with `∂M ≠ ∅`, double closed iff `M` compact. Standing Hausdorff and second-countable convention at :785. |
| DifferentialGeometry 5.1, 12.1–12.3, 12.5 | TauCetiRoadmap/DifferentialGeometry/README.md:1648, :2801, :2848, :2871, :2936–2951; Suggested.lean:1020 | `exists_halfSpaceOutwardUnitNormal` has smoothness, norm one, outward, orthogonality; uniqueness stated in prose. |
| RiemannianGeometry R1 item 4, R5a | TauCetiRoadmap/RiemannianGeometry/README.md:1436, :2840–2895 | Gauss equation `⟨R^M(X,Y)Z,W⟩ = ⟨R^N(X,Y)Z,W⟩ + ⟨B(X,W),B(Y,Z)⟩ − ⟨B(X,Z),B(Y,W)⟩` matches 3.6; `B = 0` iff totally geodesic at :2892. |
| ComplexKahlerGeometry K5a | TauCetiRoadmap/ComplexKahlerGeometry/README.md:1440, :1796 | Half-space Seeley extension is a step of K5a, as the contract says. |
| SmoothBundlesConnections B6.0 | TauCetiRoadmap/SmoothBundlesConnections/README.md:1306–1333 | Uniform normal radii on compact sets with `IsNormalDomain`; second-countable hypothesis (R03). |
| HopfRinow Layers 1, 2, 4 | Completed/HopfRinow/README.md | Present, boundaryless (`[I.Boundaryless]` at :83). |
| PositiveMass 5.1–5.2 (consumer) | TauCetiRoadmap/PositiveMass/README.md:919, :949–958 | Averaged `tr A/(n−1)` for the inward normal; matches `H = 1` on the unit sphere. |
| AffineMorseLefschetz 4.5 | TauCetiRoadmap/AffineMorseLefschetz/README.md:819, :841 | Forms the collar extension from GeometricTopology; cited only as a remark. |

**Pinned declarations.** Every backticked library name in the README (71 names) was resolved by script against the pinned Mathlib and Tau Ceti; all exist. Ambiguous short names were opened: `leviCivitaConnection` (Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean:360), `isLeviCivitaConnection_leviCivitaConnection` (:409), `ModelWithCorners.interior`/`boundary` (Mathlib/Geometry/Manifold/IsManifold/InteriorBoundary.lean:103, :112), `pullback` (TauCeti/Geometry/Manifold/Riemannian/Pullback/Basic.lean:158), `rescale` (TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Conformal.lean:87), `hessian` (TauCeti/Geometry/Manifold/Riemannian/Laplacian.lean:135), `ContDiffAt.implicitFunction` (Mathlib/Analysis/Calculus/ImplicitContDiff.lean:55). `IsGeodesicCurveOn` (TauCeti/Geometry/Manifold/Riemannian/Geodesic/Basic.lean:102–111) has three fields and no speed condition. `exists_halfSpaceOutwardUnitNormal` is the supplier's name, not a library one.

**Seeded source sample.** All locators below were read in the cached texts.

| Target | Locator read | Result |
|---|---|---|
| 1.1 | paternain-salo-uhlmann2023 lines 2684–2696 | Influx and outflux sets with inward normal `ν`; supports the sign convention. The chart-kernel and curve statements are this roadmap's own. |
| 1.3 | uhlmann-vasy2016 lines 25–26, 134–136 | Positive inside, zero and nondegenerate on the boundary. |
| 1.5 | lee-riemannian2018 Ch. 8 | Uncertified; not readable. Signs fixed by the ball, cylinder and exterior computations below. |
| 1.6 | paternain-salo-uhlmann2023 Lemma 2.5.2, lines 2462–2473 | Sign of `b′` decides convexity of circles; with `b = r e^{φ(r²)}` this is the radial case of the law. |
| 2.3 | paternain-salo-uhlmann2023 lines 3093–3095; uhlmann-vasy2016 lines 49–51 | Openness of strict convexity and stability under small metric perturbations, as cited. |
| 3.2 | stefanov-uhlmann-vasy2021 lines 128–129, 198–200, 203–205; uhlmann-vasy2016 lines 137–140, 507–509 | "Strictly concave from the superlevel sets" and the distance example. |
| 3.3, 3.4 | paternain-salo-uhlmann2023 Lemma 3.1.8, Exercise 3.1.9, lines 2749–2762 | Compact case only, general case left as an exercise via the double; the design supplies the construction. |
| 3.6 | lee-riemannian2018 Ch. 8; paternain-salo-uhlmann2023 lines 2728–2737 | Lee uncertified; `Π = −⟨∇ν, ·⟩` with inward `ν` read. |
| 4.3 | stefanov-uhlmann-vasy2021 lines 99–100, 220–221; paternain-salo-uhlmann2023 Lemma 3.1.10, lines 2766–2773 | Signed distance from a hypersurface; `ρ = d(·, ∂M)` near `∂M` in `M`, with the three sign sets and `∇ρ = ν`. |
| 4.6 | paternain-salo-uhlmann2023 lines 3093–3096 | A slightly larger strictly convex non-trapping `M₁`. |
| 5.2 | same, Definitions 3.1.1 and 3.1.3 (lines 2659–2661, 2674–2676), Exercise 3.1.2(b) (line 2666), Example 3.2.1 (lines 2849–2861) | As cited. |
| 5.5 | same, Proposition 3.3.1, lines 3081–3106 | Three equivalent conditions under compactness and strict convexity; (iii) ⇒ (i) does not use convexity. |
| 6.4 | same, Example 3.1.4, lines 2677–2678 | Small caps only; the general statement rests on the suppliers. |
| 6.5 | stefanov-uhlmann-vasy2021 lines 66–72; paternain-salo-uhlmann2023 Corollary 2.5.3, lines 2478–2481 | `(r/c)′ > 0` with `r/c = b`; (a) ⇔ (c). The misprint in (b) is not adopted. |

**Adversarial table** (values computed in this review).

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 1.1 trichotomy | half-plane `±e₀`, `e₁`; `[0, 1]` | `dx⁰ = ±1, 0`; `T_q∂M = 0`, every nonzero vector inward or outward | holds | none |
| 1.3 global existence, comparison | `Σφᵢx⁰ᵢ`; ball `ρ′ = (2 + x₁)ρ`; `ρ²`; `x(1 − x)` | `dρ = Σφᵢ dx⁰ᵢ` on `∂M`, positive on inward; `u ∈ [1, 3]`; `d(ρ²) = 0`; `|dρ| = 1` at `0` and `1` | holds | none |
| 1.5 `S`, `H` | sphere; cylinder; exterior | `(1, …, 1)`, `H = 1`; `(1, 0)`, `H = 1/2`; `H = −1` | holds | none |
| 1.6 conformal law | `φ = log 2`; `φ = −|x|²`; derivation | `2h` vs radius-2 ball `ĥ/2 = 4h/2`; `e⁻¹(1 − 2)h`, `Ĥ = −e`; `Hess_ĝ ρ = Hess ρ + |dρ| dφ(ν_in) g` on `T∂M`, `|dρ|_ĝ = e^{−φ}|dρ|` | holds; wrong sign gives `3e⁻¹h` | none |
| 2.3 uniform bound, family | hyperbola epigraph; `g_s`; ball `n = 0, 1` | `κ = (1 + 2x²)^{−3/2} → 0`; `e^{−s}(1 − 2s) > 0` iff `s < 1/2`; `1 ≥ c` vs `0 ≥ 0` | holds | none |
| 3.2 sublevel `II` | `x = |z|²`, `c = 4`; SUV distance | `2h/(2·2) = h/2`, superlevel `−h/2`; `(g − dx⊗dx)/|z − z₀|` | holds | none |
| 3.3 `ρ̃` | `[0, 1]`; half-space; `x³(1 − x)³` | `ρ̃ = 2x` for `|x| < 1/4`, `φ₁ = 0` on `c̃(∂M × [−1/2, 1/2])`; `ρ̃ = x⁰`; derivative `0` at ends | holds | none |
| 3.4 extension | `√x`; `(x + 1/100)dx²` | derivative unbounded at `0`; negative at `x = −1/50`, cutoff with support in the positive region restores positivity | holds | none |
| 3.6 Gauss | sphere; cylinder; exterior | `0 + 1·1 − 0 = 1`; `0 + 1·0 − 0 = 0`; `⟨−h·x, x⟩ = −h` | matches R5a line 2877 | none |
| 3.1 against R7.9 | unit sphere | `ν_out = x` both ways; `E(q, r) = c_ν(q, −r)` | same facts, two owners | R01 |
| 4.3 `ρ̂` properties | `r = −3` in `W₁`; `r ∈ (−1, 0)` in `W ∖ W₁`; `r < −1` | `ρ̂ = −3 < −ε`; `ρ̂ ≤ r` so `ρ̂ ≥ −ε ⇒ r ≥ −ε`; `ρ̂ ≤ −1 < −ε` | properties hold | none |
| 4.3 route smoothness | sphere, `ε = 1`, `ψ = |x|²` near `0` | `ψ r = |x|² − |x|³`, third derivative discontinuous | route fails | R02 |
| 4.4 `η` (repaired) | strip | `m = 0.5`, `0.01`; `η = 0.4`, `0.005`; `d = r` on both half-tubes | holds | none |
| 4.6 enlargement | ball `ε = 1/2`, `ε₁ = 1/4`; cap; `(1 − |x|²)e^{−|x|²}` | radius `1 + ε`, `II = h/(1 + ε)`; `cot(R + ε) > 0` iff `R + ε < π/2`; radial derivative `−2r(2 − r²)e^{−r²}`, minimum `−e⁻²` at `√2` | holds | none |
| 5.2 exit time | annulus; reversal on `[a, b]`; ball `v = e₁/4` | `3/2 + √3` vs limit `3/2`; `τ(y, −1) = (x − a) + t`; `τ = 4`, `φ_τ` undefined off `SN` | definition sound; one bullet lacks "unit" | R04 |
| 5.5 criteria | ball `f = ⟨x, v⟩`; `u = −∫₀^{τ_ε − s}`; `∅`; `φ = s² − 2s` | bound `2`; `d/ds|₀ = h(z)`; (T, T, T); `b′ = e^{r⁴ − 2r²}(2r² − 1)²`, zero at `1/√2` | holds | none |
| 6.1 ball `τ` (repaired) | `x = e₁`, `v = ±2e₁` | `(−2 + 2)/4 = 0`; `(2 + 2)/4 = 1` | holds | none |
| 6.4 small balls | normal coordinates; `S¹`; torus | `Hess|z|² = 2δ − 2Γᵏz_k = 2g + O(|z|²)`; `θ²` smooth on `|θ| < π`; `II = h/R` for `R < 1/2` | holds; supplier hypothesis | R03 |
| 6.5 radial metric | `1.6` on `|x| = r`; `φ = −st` | `e^{φ}(1/r + 2rφ′) = b′/r`; `e^{−sr²}(1 − 2sr²) ≥ e^{−s}(1 − 2s)` for `s ≥ 0` | holds | none |

Headline groups (2.2, 3.5, 4.2, 4.5, 5.4, 5.5, 5.6) outside the sample: the round-3 table carries computed values for each, the text of those sections is unchanged apart from the "on `SM`" qualifiers checked above, and those rows are relied on.

**Duplication and ownership audit.** Object searches (`roadmaps grep`) for exit time, scattering relation, boundary defining function, strictly convex boundary, boundary normal coordinates, non-trapping and unit sphere bundle found no owner on main or at any open head other than this design; the "exit time" hits are stochastic and Hamiltonian-flow objects. The package index (three packages, none geometric) was read. The worker's overlap report lists no dropped or revision-only id and no conflicting head.

- Pull request #2223 (RiemannianGeometry R7.9): overlap, R01.
- Pull request #2222 (RiemannianGeometry R5c), README lines 3546–3550 and 3614: says in a proof route that every compact Riemannian manifold with boundary arises as a domain by a collar, gluing and K5a's Seeley extension. It is not a target there and has no API; 3.5 here is the general theorem. No change is asked of this design; the maintainers may want #2222 to cite 3.5 once this roadmap is placed.
- Pull request #2232 (LorentzianGeometry, new): boundaryless global theory and hypersurface `k`, `H = tr_h k`; owns nothing in common. The "future Lorentzian geometry roadmap" consumer line is still accurate for domains with boundary.
- Pull request #2226 (MinimalSurfaces, new) and #2247 (PositiveMass revision): consume R5a and R5c; no boundary-convexity object.
- Pull request #1797 (GeometricTopology revision): no dropped id per the overlap report; 1.1 and 1.3 cited as on main.

Overlap check: read RiemannianGeometry (#2222, #2223, #2224), Surfaces (#2225 and main), ManifoldOptimization (#1506), HopfRinow (main), MorseTheory (main); the regular-sublevel inclusion with its outward criterion and the normal collar of a compact two-sided hypersurface are shared with RiemannianGeometry R7.9 at #2223, owner RiemannianGeometry (R01); nothing else shared.

**Headline theorems and padding.** The Summary names seven end theorems: the Hessian characterisation (2.2), the realisation theorem (3.5), second-order leaving (4.2), convexity functions (4.5), exit-time regularity (5.4), the non-trapping equivalence (5.5) and the involution and fixed-point theorem for `α` (5.6). There is no `Suggested.lean` at the design stage, so the one-tactic probe, the `#check` binder audit and the import and `set_option` checks have nothing to inspect. Elaboration: not available (this lane does not elaborate). No Lean command was run.

## Not verifiable

- lee-riemannian2018 (Ch. 5–8), lee-smooth2012 (Theorem 9.25), sharafutdinov1994 (Ch. 4): settled as uncertified; not read, not requested again.
- The arXiv texts were read at the versions the manifest records (uhlmann-vasy2016 v1, stefanov-uhlmann-vasy2021 v3), not against the journal typesetting.
- No elaboration: there is no Lean file and this lane does not elaborate.
- Ownership against open pull requests was checked through the roadmap index of 2026-11-13 only; later heads were not sought.

## Source issues

- **Misprint** in paternain-salo-uhlmann2023 at Corollary 2.5.3(b), printed p. 47 (line 2480): the source says the derivative of `b` is positive at radius 1; it should be at the outer radius `r₁`; affects a stated result.
- **Misprint** in paternain-salo-uhlmann2023 at Lemma 3.2.11, printed p. 64 (line 3029): the source says the second factor of the product is the exit time at the single argument `x − v`; it should be at the pair `(x, −v)`; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6950c6968ab829a8f3fcdc73c38121a0e19fccf6", "job": "REV-DESIGN-RiemannianManifoldsWithConvexBoundary~4", "model": "fable", "worker": "chris-x14"} -->
