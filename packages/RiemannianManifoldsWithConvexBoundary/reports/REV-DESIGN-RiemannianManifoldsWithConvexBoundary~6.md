<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13810#issuecomment-6895126288 -->
Review (claude) of b2ba11e

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P2) 3.1 and 4.3 state as their own what RiemannianGeometry R7.9 states on main

   **Location.** `packages/RiemannianManifoldsWithConvexBoundary/design/README.md` 3.1, lines 583–584
   and 589: "`j` is a smooth closed embedding whose differential is invertible at every point,
   boundary points included" and "`dj(ν_in) = grad ρ/|grad ρ|` on `{ρ = 0}`"; 4.3, lines 878–880 (the
   tube for compact `Σ`) and 896–899 (`ρ̂`); Scope, lines 40–46 and 68–69; `design/plan.json`
   targets 3.1, 4.3.2, 4.3.3 and the RiemannianGeometry supplier entry (`"sections": ["§R1", "§R5a"]`).

   **Claim.** The Scope section lists the inclusion of a regular domain, its normal and the normal
   collar with its defining function as owned here, with only Tau Ceti's sublevel atlas as supplier.

   **Witness.** Main (1a19c9f), `TauCetiRoadmap/RiemannianGeometry/README.md`, R7.9 (heading at line
   4469): the inclusion of a regular sublevel `{φ ≤ a}`, for any smooth `φ` with regular value `a`, is
   smooth with invertible differential, and `v` is outward exactly when `dφ(dι v) > 0` (lines
   4586–4591); the normal collar `c_ν(x, t) = exp(tν(x))` of a compact two-sided hypersurface is a
   diffeomorphism onto an open neighbourhood (lines 4510–4516); a defining function equal to the
   collar coordinate near the hypersurface and to `±1` off the collar, with `grad φ = ν` (lines
   4568–4572); the outward unit normal of `D₋` is `ν` (lines 4594–4596).

   **History.** This is the overlap that round 4 raised and the round-5 repair report marked not
   actionable because R7.9 existed only in an open revision. That reason was right then and does not
   hold now: the revision is merged. The last repair report (round 6) marks nothing as not
   actionable, so this is raised as an ordinary finding with a repair the fix worker can apply; a
   roadmap on main is earlier than every open one, so this design cites it.

   **Exact repair.**

   1. Scope, "It leaves to other roadmaps": add "the inclusion of a regular sublevel as a smooth map
      with invertible differential, the outward criterion `dφ(dι v) > 0`, and the normal collar and
      defining function of a compact connected two-sided hypersurface that separates:
      RiemannianGeometry R7.9; this roadmap adds the closed-embedding and Levi-Civita statements, the
      unit normal and `II` of an arbitrary regular domain (3.1), and the tube, signed distance and
      normalised defining function for non-compact or disconnected `Σ` (4.3)".
   2. Supplier contracts, From TauCetiRoadmap.RiemannianGeometry: add R7.9 with the three statements
      above and its hypotheses (ambient manifold second countable; for the collar, `Σ` compact and
      connected, `M` connected).
   3. 3.1, first bullet: "`j` is smooth with invertible differential at every point (RiemannianGeometry
      R7.9 for `φ = −ρ`, `a = 0`, when `N` is second countable; the statement is local, so it holds
      for every Hausdorff `N`), and `j` is a closed embedding …". Third bullet: add "a vector `v` at a
      boundary point is outward iff `dρ(dj v) < 0` (R7.9)" as the cited input of
      `dj(ν_in) = grad ρ/|grad ρ|`.
   4. 4.3, Tube bullet: add "for compact connected `Σ` in a connected `N` this is R7.9's normal
      collar; the statement here allows non-compact `Σ` with a variable radius and adds the sign of
      `f`". Normalised defining function: add "for a compact connected separating `∂M` this is
      R7.9's defining function for `ν = ν_in`; `ρ̂` is built here for every regular domain".
   5. `*Needs:*` of 3.1 and 4.3 and the two Dependencies paragraphs: add RiemannianGeometry R7.9.
      Plan: add `"§R7.9"` to the supplier's sections and `roadmap:RiemannianGeometry §R7.9` to the
      prerequisites of 3.1, 4.3.2 and 4.3.3.

   **Repair test.** Closed unit ball, `ρ = 1 − |x|²`, `φ = −ρ = |x|² − 1`, `a = 0`: R7.9's criterion
   makes `v` outward at `x` iff `dφ(v) = 2⟨x, v⟩ > 0`, so `ν_out = x` and
   `ν_in = −x = grad ρ/|grad ρ| = −2x/2`, the value 3.1 states. R7.9's own Check (`(|y|² − 1)/2` on the
   unit sphere, `D₋` the closed ball with outward normal `ν = y`, collar `(1 + t)x` injective for
   `ε ≤ 1`) agrees with 4.3's Check (`E(q, r) = (1 − r)q` for `ν_Σ = −x`, `ε ≤ 1`) after `t = −r`.
   Half-plane strips of 4.4's Check (`∂M = {0, 1} × ℝ`, non-compact, disconnected): outside R7.9's
   hypotheses, so 4.3's own statement is still needed there.

2. **F02** (P3) "RiemannianGeometry R1 item 4" no longer names the cited fact, which is at the pin

   **Location.** README lines 73, 231–232, 1399, 1412, 1459 ("RiemannianGeometry R1 item 4 (in a
   normal chart at `p` the first derivatives of the metric vanish, so the Christoffel symbols vanish
   at `p`)"); plan target 6.4 (`roadmap:RiemannianGeometry §R1`).

   **Claim.** The vanishing of the Christoffel symbols at the centre of a normal chart is item 4 of R1.

   **Witness.** On main the fact is in "2.2 Normal-coordinate jets (R1.4)" (RiemannianGeometry README
   lines 1576 and 1628–1632), which credits it to Tau Ceti; under the heading R1, "§1.1 item 4" is the
   mixed polarization (line 330). Pin:
   `TauCeti/Geometry/Manifold/Riemannian/Geodesic/Normal/Coordinates.lean:270`,
   `leviCivitaConnection_normalCoordinateField_self`.

   **Exact repair.** In the Tau Ceti paragraph of the supplier contracts add
   `TauCeti.Manifold.IsNormalDomain.mfderiv_inner_normalCoordinateField_self` and
   `TauCeti.Manifold.IsNormalDomain.leviCivitaConnection_normalCoordinateField_self`; in the five
   places replace "RiemannianGeometry R1 (item 4)" by these two names (keeping "RiemannianGeometry
   2.2 (R1.4)" only as the roadmap section that records them); in the plan replace
   `roadmap:RiemannianGeometry §R1` in 6.4 by the two `tauceti:` prerequisites.

   **Repair test.** 6.4's route needs only `∇_{∂_i} ∂_j = 0` at `p`, which is the second declaration:
   `Hess |z|²(∂_i, ∂_j)(p) = 2δ_ij − 2 z_k Γ^k_ij = 2δ_ij` at `z = 0`.

Two findings: one P2 (an object that a roadmap on main now owns is still stated here as this
roadmap's own) and one P3 (a supplier locator that no longer names the cited content, which is a
pinned Tau Ceti declaration). Both round-5 findings are repaired. No mathematical defect was found:
every Check and formula recomputed in this round agrees with its statement. No design file, plan
or manifest entry was changed by this review.

## Previous findings and repairs

| Round-5 finding | Repaired passage | Assessment |
|---|---|---|
| F01 (P2), `X` on `C^∞(SM)` undefined at glancing points | 5.1, lines 1065–1075: "its generator `X` is a smooth vector field on `SN`, acting on `ũ ∈ C^∞(SN)` … `X(z) ∈ T_z SN = dj(T_z SM)` … `Xu := du(X)` for `u ∈ C^∞(SM)`"; Check lines 1082–1087; 5.4 route lines 1187–1190 | **Repaired.** Recomputed: disc, `z = ((0, −1), (1, 0))`, `|(t, −1)|² = 1 + t²`, `σ̃(φ_t z) = −2⟨(t, −1), (1, 0)⟩ = −2t`, `Xσ(z) = −2`. The source defines `X` on `C^∞(SN)` (paternain-salo-uhlmann2023 lines 3070–3079). |
| F02 (P2), "every `(M, g)`" without Hausdorff and second countable | Summary line 11, "How to read the build" line 269, Layer 4 line 804: "every Hausdorff second-countable `(M, g)`"; 3.5 Check lines 758–761 | **Repaired.** The doubled half-line has charts `[0, ∞)` twice, identity transition off `1`, and the two copies of `1` are inseparable. |

Repaired patterns sought elsewhere: derivatives along the flow of functions defined only on `SM`
(5.4 `Xσ` uses `int SM` and density; 5.5 differentiates along geodesic segments inside `SM` or
functions extended to `SN`); "every `M`" claims (1.2's first bullet argues chart by chart and
needs neither hypothesis; 1.3 global existence, 3.3, 3.4, 3.5, 4.3, 4.4, 4.6, Layer 5 and 6.4 each
state Hausdorff and second countable where partitions of unity or the tube theorems are used).
No further instance.

Maintainer notes: none were supplied.

## Verified sound

**Coverage.** Read all 1,498 lines of the README, the plan (6 layers, 49 targets, 6 suppliers,
`gaps: []`) and the six manifest entries. Every definition or construction (1.3, 1.4, 1.5, 2.1,
3.1, 3.2, 4.3, 5.1, 5.2, 5.6 and the constructions of 3.3, 4.5) has at least three Checks; every
layer ends with Examples and Dependencies; no LaTeX delimiters, pull-request numbers, anchors,
machine paths, process words or `set_option` (searched).

**Dependency check, exact output:**

```text
candidate: RiemannianManifoldsWithConvexBoundary is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2230 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The citation report (main 1a19c9f, 475 open heads) lists nothing
found nowhere; the overlap report lists no dropped id, no revision-only id, no conflicting head.

**Supplier citations resolved on main (1a19c9f).** DifferentialGeometry 5.1 (README :1648), 12.1
(:2801), 12.2 (:2848), 12.3 (:2871), 12.5 (:2936; `exists_halfSpaceOutwardUnitNormal` at :2950 and
`Suggested.lean:1020`, variable block :967–975 with `T2Space`, `SecondCountableTopology`,
`SigmaCompactSpace`, `BorelSpace`, as the contract says); HopfRinow, completed
(`Completed/HopfRinow/README.md` Layer 1 :264, Layer 2 :427, Layer 4 :495); RiemannianGeometry
R5a (:3205; conventions `B`, `S_η`, averaged `H`, `B = −g · position` at :188–193; `B = 0` iff
totally geodesic :3260) and R1 (:1050; see R02); GeometricTopology 1.1 (:788; collar existence for
second-countable `M`, the interior, the interval collar `t/2`, `1 − t/2`) and 1.3 (:851; bicollar
`∂M × (−1, 1)`, closed images, compactness and connectedness, the double); AffineMorseLefschetz 4.5
(:819); ComplexKahlerGeometry K5a (:1440; half-space Seeley step :1796); SmoothBundlesConnections
B6.0 (:1306; `IsNormalDomain` on tangent balls :1328); PositiveMass 5.1–5.2 (:921, :957);
PositiveScalarCurvature and Yamabe exist on main (consumers only).

**Pinned declarations.** All 67 backticked library identifiers of the README were resolved by
script against the pinned Mathlib and Tau Ceti (declaration keyword and final name component); the
14 others are mathematical notation or the supplier's `exists_halfSpaceOutwardUnitNormal`. The
round-5 review's file-and-line list for 27 of them was not repeated; opened this round:
`leviCivitaConnection_normalCoordinateField_self`
(`TauCeti/Geometry/Manifold/Riemannian/Geodesic/Normal/Coordinates.lean:270`).

**Seeded source sample** (read in the cached texts).

| Target | Locator read | Result |
|---|---|---|
| 1.1 | paternain-salo-uhlmann2023 lines 2684–2696 | influx and outflux vectors, glancing set as their intersection; as cited |
| 1.2 | same, lines 2687–2689 | inward unit normal; as cited (Lee Ch. 8 uncertified) |
| 1.6 | same, Lemma 2.5.2, lines 2462–2473 | sign of `b′` decides convexity of circles; the general law is the design's own derivation, recomputed below |
| 2.1 | same, lines 2738–2739 and 2449–2461; stefanov-uhlmann-vasy2021 lines 89–90, 93 | as cited; the source's circle is convex seen from the outer side, which is 6.5's ball `{|x| ≤ r}` |
| 3.3 | paternain-salo-uhlmann2023 lines 2749–2762 | closed extension and the double as an exercise; the route here is the design's own |
| 3.5 | same; stefanov-uhlmann-vasy2021 lines 96–97 | compact connected case in the book, non-compact `M ⊆ M̃` in the article |
| 4.3 | stefanov-uhlmann-vasy2021 lines 99–100; paternain-salo-uhlmann2023 lines 2766–2773 | signed distance; `ρ = d(·, ∂M)` near `∂M`, three sign sets, `∇ρ = ν` |
| 4.4 | stefanov-uhlmann-vasy2021 lines 20–22, 220–221 | normal coordinates relative to a hypersurface are named, not developed; statements rest on Lee (uncertified) and the computed Checks |
| 4.5 | uhlmann-vasy2016 lines 30–32, 504–524; stefanov-uhlmann-vasy2021 lines 128–134 | `x̃ = −ρ − ε|z − p|²`, `(U₀, C₀, δ)`, compactness for `0 ≤ c ≤ c₀`; as restated |
| 4.6 | paternain-salo-uhlmann2023 lines 3093–3096 | slightly larger `M₁`, strictly convex and non-trapping |
| 5.1 | same, lines 2646–2648, 2682–2696, 2931, 3063–3079; stefanov-uhlmann-vasy2021 lines 151, 153 | as cited; opposite labels correctly reported |
| 5.5 | paternain-salo-uhlmann2023 lines 3081–3106 | three equivalent conditions; the bound is the proof's `f(φ_t) − f ≥ ct` |
| 6.1 | same, lines 2849–2864, 307–310, 2677–2680 | disc exit time; Euclidean subdomains non-trapping |
| 6.3 | same, lines 2499–2521, 2677–2680 | small and large caps; hyperbolic subdomains |
| 6.5 | stefanov-uhlmann-vasy2021 lines 66–72; paternain-salo-uhlmann2023 lines 2462–2481 | `(r/c)′ > 0` with `r/c = b`; Corollary 2.5.3 (a)⇔(c) |

Also read: paternain-salo-uhlmann2023 lines 2801–2844 (4.2), 2865–3055 (5.3, 5.4), 3110–3127 (5.6).
No author-flagged unverified locator exists in the README or the manifest.

**Adversarial table** (values computed in this round).

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 1.2 chart formula | `g = [[1, a], [a, 1]]`, `a = 1/2` | `g(e₀ − a e₁, e₁) = 0`, norm² `1 − a² = 3/4`, `ν_in = (2/√3, −1/√3)` | holds | none |
| 1.6 conformal law | derivation; `φ = log 2`; `φ = −|x|²`, `n = 1` | `−Hess_ĝ ρ/|dρ|_ĝ = e^φ(II − dφ(ν_in)h)`; `2h = 4h/2`; `e⁻¹(1 − 2)h`, `Ĥ = e(1 − 2) = −e`, and `−e⁻¹h = −e ĥ` | holds | none |
| 2.1 predicates | `{y ≥ x³}`; `n = 0` | `Hess ρ(t, t) = −6x/(1 + 9x⁴)`, `|dρ| = √(1 + 9x⁴)`, `II = 6x/(1 + 9x⁴)^{3/2}`; both strict predicates vacuous | holds | none |
| 2.2 Hessian iff (headline) | ball, `ρ` and `(2 + x₁)ρ` | `−2h` and `−2(2 + x₁)h`, both negative | holds | none |
| 2.3 | hyperbola epigraph; `g_s` | `(1 + 2x²)^{−3/2} → 0`; `e^{−s}(1 − 2s)` | holds | none |
| 3.1 inclusion and normal | ball; `(2 + x₁)(1 − |x|²)` at `x₁ = −3` | `ν_in = −x`, R7.9 gives `ν_out = x`; `(−1)(−8) = 8` | holds; owner on main | R01 |
| 3.3 `ρ̃` | zeros; `[0, 1]`; `∂M = ∅`; compact `∂M` | `sign ρ̃ = sign t`, `ρ̃ = χ(t) = t` where `φ₁ = 0`; `2x` on `|x| < 1/4`; `ρ̃ ≡ 1`; `φ₁ = 0` on `|t| ≤ 1/2` | regular value `0` | none |
| 3.5 realisation (headline) | compact `M` with a closed component; doubled half-line; `∂M = ∅` | `DM` compact, `{ρ_D ≥ 0}` the first copy; not Hausdorff; `M̃ = M`, `ρ̃ ≡ 1` | holds | none |
| 3.6 Gauss sign | unit sphere; cylinder | `0 + 1·1 − 0 = 1`; `0 + 1·0 − 0 = 0` | holds | none |
| 4.2 second-order contact (headline) | ball; exterior; `{y ≥ x⁴}`; `n = 0` | `−t²`, `−|dρ|II = −2`; `t²`; `−t⁴` with `II = 0`; tangent vectors are `0` | holds | none |
| 4.3 tube, `ρ̂` | sphere `f = 1 − |x|²`; `W ∩ M ∖ W₁`; `W ∖ (M ∪ W₁)`; off `W` | `E = (1 − r)q`, `r_Σ = 1 − |x|`; `ψr + (1 − ψ) ≥ min(r, 1) > 0`; `≤ max(r, −1) < 0`; `±1` | `M = {ρ̂ ≥ 0}`; compact collar is R7.9's | R01 |
| 4.4 | ball `R`; exterior; strips | `−½∂_r(1 − r/R)²|₀ = 1/R`; `−1`; normal coordinate `0.8` against distance `0.2` | holds | none |
| 4.5 convexity function (headline) | disc at `(0, −1)`; exterior; `n = 0` | `(2 − 2ε)g`, `dx̃_q = (0, −2) = −dρ_q`, `K_c ⊆ {ε|z − q|² ≤ c}`; `−(2 + 2ε)g`; `δ < |dρ_q|` makes the first bullet vacuous | holds | none |
| 4.6 | `(1 − r²)e^{−r²}` | derivative `−2r(2 − r²)e^{−r²}`: `−2/e` at `1`, minimum `−e⁻²` at `√2` | control valid | none |
| 5.1 generator (repaired) | disc glancing point; `[a, b]` at `(a, −1)` | `1 + t² > 1`; one-sided for `t ≤ 0` | holds | none |
| 5.2 exit time | annulus; homogeneity | `3/2 + √3` against limit `3/2 − √(2δ − δ²) → 3/2`; `τ(0, e₁/4) = 4` | holds | none |
| 5.3 fold form | `y − t²`; general | `Q = r`, `a = y`; `a = h(g(y), y) ≥ h(0, y)` | holds | none |
| 5.4 regularity (headline) | disc; ball; `[a, b]` | `μ/τ̃ = sin θ/(2 sin θ) = 1/2`; `σ = −2⟨x, v⟩`, `T = 1 − |x|²`, `a = σ² + 4T`, `Q(±√a) = (σ ± √a)/2`; `σ(φ_t z) = σ(z) − 2t` | holds | none |
| 5.5 criteria (headline) | ball `f = ⟨x, v⟩`; `M = ∅`; closed `M ≠ ∅`; half-circle | bound `(1 + 1)/1 = 2`; (T, T, T); (F, F, F); `τ = π/2 ∓ θ` | holds | none |
| 5.6 scattering (headline) | ball; `[a, b]`; disc lens data | `⟨x − 2⟨x, v⟩v, v⟩ = −⟨x, v⟩`; `α(b, +1) = (a, +1)`, `τ̃ = −(b − a)`; `ℓ = 2μ = 2√(1 − |w|²)` | holds | none |
| 6.1 | root of `|x + tv|² = R²`; ellipse vertex | `(0 + √(1/16))/(1/16) = 4`; `(2/b²)/(2/a) = a/b²` | holds | none |
| 6.3 | cap; hyperbolic plane | `Hess ρ = −cos R g`, `|dρ| = sin R`; `1/y − (1/y)(½ − (x² + 1)/(2y²)) = u/y²`, `−x/y² + x/y² = 0`; `coth 1 ≈ 1.313`, `cot 1 ≈ 0.642` | holds | none |
| 6.4 route | normal chart | `Hess|z|² = 2δ − 2z_kΓ^k_ij`, `2δ` at `0` | holds; input is at the pin | R02 |
| 6.5 | `b = re^{φ(r²)}`; `φ = s² − 2s`; `φ = −st` | `b′/r = e^φ(1/r + 2rφ′)`; `1 − 4r² + 4r⁴ = (2r² − 1)²`, `b′(1) = e⁻¹`, `b′(1/√2) = 0`; `e^{−sr²}(1 − 2sr²)` | holds | none |

**Duplication and ownership.** Roadmap search (open heads and main) for boundary defining
function, scattering relation, exit time, non-trapping, strictly convex boundary, signed distance,
boundary normal or Fermi coordinates, mean-convex: the only second owner is RiemannianGeometry
R7.9 (R01). The other hits are different objects: stochastic and symplectic exit times; Fermi
coordinates along a curve in a surface (`TauCetiRoadmap/RiemannianGeometry/Surfaces/README.md:307`);
MinimalSurfaces uses R5a's form on a boundary and defines none (:1959); MathematicalBilliards
(open) works with planar tables as curves `γ : ℝ → ℂ` and Mathlib's `StrictConvex`, no manifold
with boundary; LorentzianGeometry (open) owns `k` and the null second fundamental form of
hypersurfaces in spacetimes; ManifoldOptimization (open) consumes R5a. The board's package index
lists no geometric package besides this one.

Overlap check: read ManifoldOptimization, LorentzianGeometry, SmoothBundlesConnections, MathematicalBilliards (open), RiemannianGeometry with MinimalSurfaces and Surfaces, HopfRinow (main); the inclusion of a regular sublevel with its outward criterion, and the normal collar and defining function of a compact separating two-sided hypersurface, are shared with RiemannianGeometry R7.9: owner RiemannianGeometry (on main), cited from here after R01; nothing else shared.

**Headline theorems and padding.** Seven end theorems in the Summary: 2.2, 3.5, 4.2, 4.5, 5.4,
5.5, 5.6. There is no `Suggested.lean` at the design stage, so the one-tactic probe, the binder
audit and the import check have nothing to inspect. Elaboration: not available (this lane does
not elaborate). No Lean command was run.

**Copyright and arrangement.** Sixteen passages were set beside the sources at the sampled
locators and at the fold lemma, Lemma 3.2.6, Lemma 3.2.8, Proposition 3.3.1's proof and the
convexity-function construction. Shared material is formulas and standard names; no run of
consecutive source words beyond a formula was found, and the routes of 3.3, 3.4, 4.3 and 5.4's
continuity are the design's own where the sources leave exercises. Contents of
paternain-salo-uhlmann2023 §3.1–3.3 against the layers: §3.1 is spread over Layers 1–5 (1.1, 1.4,
2.1, 3.5, 4.2, 4.3, 5.1, 5.2), §3.2 ↔ 5.3–5.4, §3.3 ↔ 5.1, 5.5, 5.6; the order inside Layer 5 is
forced (5.2 needs 5.1; 5.4 needs 5.1–5.3; 5.5 and 5.6 need 5.4), and Layers 1–4 and 6 map to no run
of sections. No table, figure or exercise list is reused.

Source independence: 16 passages compared with 3 sources, none shared; largest share paternain-salo-uhlmann2023, 47 of 87 source mentions (the round-5 count; the round-6 repair added no locator); contents compared with paternain-salo-uhlmann2023: independent.

## Not verifiable

- lee-riemannian2018 (Ch. 5–8), lee-smooth2012 (Theorem 9.25), sharafutdinov1994 (Ch. 4): settled
  as uncertified; not read. The signs they are cited for are fixed by the computed ball, cylinder
  and exterior values.
- The arXiv texts were read at the recorded versions (uhlmann-vasy2016 v1,
  stefanov-uhlmann-vasy2021 v3), not against the journal typesetting.
- No elaboration: there is no Lean file and this lane does not elaborate.
- The 67 pinned names were matched by declaration keyword and final name component; only the one
  named above was opened this round.

## Source issues

- **Misprint** in paternain-salo-uhlmann2023 at Corollary 2.5.3(b), printed p. 47: the source says the derivative of `b` is positive at radius 1; it should be at the outer radius `r₁`; affects a stated result.
- **Misprint** in paternain-salo-uhlmann2023 at Lemma 3.2.11, printed p. 64: the source says the second factor of the product is the exit time at the single argument `x − v`; it should be at the pair `(x, −v)`; affects a stated result.

## For the human reviewers

- **Licence.** paternain-salo-uhlmann2023 was read from an author's page copy carrying the publisher's personal-use notice (`sources.toml`, `licence_class = "author-page"`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b2ba11e85a42038abeab1db6f092a93d74380532", "job": "REV-DESIGN-RiemannianManifoldsWithConvexBoundary~6", "model": "fable", "worker": "chris-x26"} -->
