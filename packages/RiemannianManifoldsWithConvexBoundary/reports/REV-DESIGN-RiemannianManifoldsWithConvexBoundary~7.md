<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13810#issuecomment-6896329383 -->
Review (claude) of c2e5452

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P2) the compact case of 3.5 is stated by RiemannianGeometry R5c on main and is not cited

   **Location.** `packages/RiemannianManifoldsWithConvexBoundary/design/README.md`, Scope, lines
   40–46 ("the manifold-level extension of smooth functions and metrics across `∂M`, the realisation
   theorem") and 91–96; supplier contract, lines 253–268; 3.5, lines 788–796; `design/plan.json`
   targets 3.3.1, 3.4.2, 3.5 and the RiemannianGeometry supplier entry (`"sections": ["§R5a", "§R7.9"]`).

   **Claim.** The Scope lists the realisation of `(M, g)` inside a boundaryless Riemannian manifold,
   by a collar glued along the boundary and a Seeley extension of the metric, as owned here, with
   GeometricTopology 1.1, 1.3 and ComplexKahlerGeometry K5a as the only suppliers.

   **Witness.** Main (1a19c9f), `TauCetiRoadmap/RiemannianGeometry/README.md`, R5c (heading at line
   3715), scalar principal eigenfunction, item 1, lines 3870–3874: every compact Riemannian manifold
   with boundary is the closure of a relatively compact smooth domain, by a collar (GeometricTopology
   §1.1) glued along the boundary (§1.3) and K5a's Seeley extension of the metric; its `*Needs:*`
   (lines 3938–3941) names the same three inputs. R5c's domain convention is at lines 3749–3754.

   **Why it is the round-6 pattern.** Round 6 raised R7.9 on the same ground (a roadmap on main states
   what this design lists as its own) and the repair cited it. The search for the repaired pattern
   "in the rest of the design" finds this second instance: the object is the same (an isometric
   embedding of compact `(M, g)` as the closure of a domain of a boundaryless Riemannian manifold),
   the route is the same (3.3's collar extension, 3.4's metric extension), and the owner on main is
   earlier than every open roadmap.

   **Exact repair.**

   1. Scope, "It leaves to other roadmaps": add "the presentation of a compact Riemannian manifold with
      boundary as the closure of a relatively compact smooth domain of a boundaryless Riemannian
      manifold, by a collar glued along the boundary and a Seeley extension of the metric:
      RiemannianGeometry R5c (scalar principal eigenfunction, item 1); this roadmap adds the
      non-compact case, the defining function `ρ̃` with `0` a regular value and the identification
      of `M`'s atlas with Tau Ceti's sublevel atlas (3.3), the extension of functions and of
      arbitrary sections of `T*M ⊗ T*M` (3.4), and the compact, and compact connected, extension by
      the double (3.5)".
   2. Supplier contracts, From TauCetiRoadmap.RiemannianGeometry: add R5c with that statement and
      its hypotheses (`M` compact; R5c's standing manifolds are Hausdorff, second countable and
      boundaryless; a relatively compact smooth domain is an open `D` with compact closure each of
      whose boundary points has a chart of the ambient manifold in which `D` is the half-space
      `x_m > 0`, the last coordinate, where Mathlib's `EuclideanHalfSpace` constrains coordinate `0`).
   3. 3.5, after the statement: "For compact `M` the collar-extension case is RiemannianGeometry R5c's
      presentation: `int M` is a relatively compact smooth domain of `M̃` in R5c's sense, because in a
      sublevel chart of `{ρ̃ ≥ 0}` the set `int M` is `{x⁰ > 0}`; the statement here also covers
      non-compact `M`, gives `ρ̃`, and gives a compact `M̃`." Add one Check with the two conventions
      (below).
   4. `*Needs:*` of 3.5 and the Layer 3 Dependencies paragraph: add "RiemannianGeometry R5c (the
      compact case as the closure of a relatively compact domain)". Plan: add `"§R5c"` to the
      supplier's sections and `roadmap:RiemannianGeometry §R5c` to the prerequisites of 3.5.

   **Repair test.** Closed unit disc with its Euclidean metric and the radial collar
   `c(q, t) = (1 − t/2) q`: the collar extension is the open disc of radius `3/2`, `D = {|x| < 1}` has
   compact closure `M`, and in the chart `x⁰ = 1 − |x|` near the circle `D = {x⁰ > 0}`, which is R5c's
   half-space after moving coordinate `0` to the last place; `ρ̃ = t = 2(1 − |x|)` near the circle, so
   `M = {ρ̃ ≥ 0}`. The double `S²` (3.5's compact connected `M̃`) and the half-line `[0, ∞)`
   (non-compact, `M̃ ≅ (−1, ∞)`, `ρ̃ = x` near `0`) are outside R5c's sentence, so 3.5's own statement
   is still needed for both.

2. **F02** (P3) HopfRinow Layer 4 is in the supplier contract and in no `*Needs:*` line

   **Location.** README line 81 ("completeness of compact manifolds: HopfRinow Layers 1, 2 and 4") and
   lines 249–250 ("Layer 4 (compact manifolds are geodesically complete)").

   **Claim.** Layer 4 of HopfRinow is a consumed supplier section.

   **Witness.** The eight `*Needs:*` and Dependencies mentions of HopfRinow (lines 880, 915, 985,
   1102–1103, 1152, 1343, 1477, 1527) name Layers 1 and 2 only; the plan has no
   `roadmap:HopfRinow §Layer 4` prerequisite although its supplier entry lists it. The one use of
   completeness, 5.1's "global if `N` is compact", already names the pinned
   `TauCeti.Manifold.isGeodesicallyCompleteAt_of_compactSpace`
   (`TauCeti/Geometry/Manifold/Riemannian/Geodesic/Compact.lean:75`).

   **Exact repair.** Either add "HopfRinow Layer 4" to 5.1's `*Needs:*`, to the Layer 5 Dependencies
   paragraph and to the plan prerequisites of 5.1, or delete "and 4" at line 81, the Layer 4 clause at
   lines 249–250 and `"§Layer 4"` from the plan's supplier entry. The second is the smaller change and
   loses nothing: the pinned declaration is the input.

   **Repair test.** 5.1 on the closed unit disc in `N = S²` (3.5's double): the flow on `SN` is
   global by the pinned declaration alone, with `N` compact, boundaryless and Hausdorff, its stated
   hypotheses.

Two findings: one P2 (the compact case of the realisation theorem, with the route of 3.3–3.4, is
already a proof obligation of RiemannianGeometry R5c on main and is not cited) and one P3 (a
supplier section in the contracts that no `*Needs:*` line consumes). Both round-6 findings are
repaired. No mathematical defect was found: every Check and formula recomputed this round agrees
with its statement. This review changed no design file, plan or manifest entry.

## Previous findings and repairs

| Round-6 finding | Repaired passage | Assessment |
|---|---|---|
| F01 (P2), 3.1 and 4.3 state what RiemannianGeometry R7.9 states | Scope lines 70–79 ("the inclusion of a regular sublevel `{φ ≤ a}` … RiemannianGeometry R7.9; this roadmap adds …"); contract lines 256–268; 3.1 lines 616–621 and 626–630 ("outward iff `dρ(dj v) < 0` (RiemannianGeometry R7.9's outward criterion for `φ = −ρ` …)"); 4.3 lines 928–931 and 951–956; Needs lines 657–658 and 985–986; plan 3.1, 4.3.2, 4.3.3 | **Repaired.** Each clause of the contract was read against main: inclusion and outward criterion at R7.9 lines 4586–4591, collar 4509–4516, at most two components 4525–4529, defining function 4568–4571 (`h = ±1` beyond `±ε/2`), outward normals 4592–4596. Recomputed: ball `φ = |x|² − 1`, `dφ(v) = 2⟨x, v⟩`, `ν_out = x`; half-space `dφ(−e₀) = 1`. |
| F02 (P3), "R1 item 4" names nothing | Scope lines 84–88; contract lines 215–222; 6.4 route lines 1458–1465; Needs lines 1477–1481; plan 6.4 | **Repaired.** Pin: `TauCeti/Geometry/Manifold/Riemannian/Geodesic/Normal/Coordinates.lean:84` (`normalCoordinateField`), `:270` (`leviCivitaConnection … p = 0`), `:292` (`mfderiv … p = 0`); `…/Normal/Basic.lean:89` (`IsNormalDomain`). RiemannianGeometry heading "2.2 Normal-coordinate jets (R1.4)" at main line 1576. |

Adversarial pass on the changed passages: rows 3.1, 4.3 and 6.4 of the table. The repaired pattern
(an object stated on main and listed here as owned) was sought in the rest of the design by
object: R01 is the one further instance; 3.3's `ρ̃`, 4.4, 4.6 and 5.1 are not instances (the
round-7 repair report's reasons were checked and hold).

Maintainer notes: none were supplied.

## Verified sound

**Coverage.** All 1,567 lines of the README, the plan (6 layers, 49 targets, 6 suppliers,
`gaps: []`; every `target:` prerequisite resolves to a target id) and the six manifest entries.
Every definition or construction of the plan (1.3, 1.4, 1.5, 2.1, 3.1, 3.2, 4.3.1, 5.1, 5.2, 5.4.2,
5.6.1, 5.6.2) has at least three tests there and at least three Checks in the README; every layer
ends with Examples and Dependencies; no LaTeX delimiters, pull-request numbers, anchors, machine
paths or process words (searched); eight lines exceed 102 characters.

**Dependency check, exact output:**

```text
candidate: RiemannianManifoldsWithConvexBoundary is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2230 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. No supplier is on the never-cite list. No gap is declared and
none is needed: every cited section exists where cited.

**Supplier citations resolved on main (1a19c9f).** DifferentialGeometry 5.1 (README :1648), 12.1
(:2801), 12.2 (:2848), 12.3 (:2871), 12.5 (:2936; `exists_halfSpaceOutwardUnitNormal` at README
:2950 and `Suggested.lean:1020`, variable block :967–975 with `T2Space`, `SecondCountableTopology`,
`SigmaCompactSpace`, `BorelSpace`, as the contract says); HopfRinow, completed
(`Completed/HopfRinow/README.md` Layer 1 :264, Layer 2 :427, Layer 4 :495); RiemannianGeometry R5a
(:3205), R7.9 (:4469), 2.2 (R1.4) (:1576); GeometricTopology 1.1 (:788, collar for second-countable
`M`, Lee Theorem 9.25) and 1.3 (:851, bicollar `∂M × (−1, 1)`, closed images, compactness,
connectedness, the double); AffineMorseLefschetz 4.5 (:819, collar extension at :841);
ComplexKahlerGeometry K5a (:1440, Seeley step :1795–1796); SmoothBundlesConnections B6.0 (:1306,
`IsNormalDomain` on tangent balls :1327–1328); PositiveMass 5.1–5.2 (:921, :957; `tr A/(n−1)` for
the inward normal at :951); PositiveScalarCurvature and Yamabe exist on main (consumers only).

**Pinned declarations.** All 78 library identifiers of the README were matched by script against
the pinned Mathlib and Tau Ceti by declaration keyword and final name component, then the
ambiguous ones opened: `Bundle.ContMDiffRiemannianMetric.rescale`
(`TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Conformal.lean:87`), `.pullback`
(`TauCeti/Geometry/Manifold/Riemannian/Pullback/Basic.lean:158`), `.restrictBoundaryTangentSpace`
and `_inner` (`TauCeti/Geometry/Manifold/Riemannian/Boundary.lean:115`, `:146`),
`ModelWithCorners.boundary` and `.interior`
(`Mathlib/Geometry/Manifold/IsManifold/InteriorBoundary.lean:112`, `:103`),
`TauCeti.IsOutwardPointing` (`TauCeti/Geometry/Manifold/Boundary/Orientation.lean:46`),
`TauCeti.scalarRegularSublevelChartedSpace`
(`TauCeti/Geometry/Manifold/RegularValue/Scalar/Sublevel.lean:473`),
`TauCeti.SmoothEmbedding.exists_isClosedEmbedding_normalExp_norm_le_subset`
(`TauCeti/Geometry/Manifold/TubularNeighborhood/Riemannian/Noncompact.lean:58`),
`exists_contMDiff_zero_iff_one_iff_of_isClosed` (`Mathlib/Geometry/Manifold/PartitionOfUnity.lean:797`).
The only name not at the pins is `exists_halfSpaceOutwardUnitNormal`, which the README attributes
to DifferentialGeometry 12.5, where it is.

**Seeded source sample** (read in the cached texts this round).

| Target | Locator read | Result |
|---|---|---|
| 1.1 | paternain-salo-uhlmann2023 lines 2684–2696 | inward and outward unit vectors and their common part; as cited |
| 1.2 | same, lines 2687–2689 | inward unit normal; as cited (Lee Ch. 8 uncertified) |
| 2.3 | same, lines 3093–3095; uhlmann-vasy2016 lines 49–51 | strict convexity and `Xf > 0` are open; stability under small perturbations of the metric; as cited |
| 3.3 | paternain-salo-uhlmann2023 lines 2749–2762 | Lemma 3.1.8 with the double left as Exercise 3.1.9; the route here is the design's own |
| 3.5 | same; stefanov-uhlmann-vasy2021 lines 96–97 | compact case with a closed connected extension (the book's `M` is connected, line 2641); non-compact `M` in a boundaryless manifold in the article |
| 3.6 | lee-riemannian2018 Ch. 8 | not read (uncertified); the sign is fixed by the computed sphere and cylinder values |
| 4.1 | paternain-salo-uhlmann2023 lines 2646–2658, 2763–2765 | maximal geodesics in `M`; geodesics of the closed extension; as cited |
| 4.2 | same, lines 2781–2784, 2795–2798, 2801–2828, 2841–2844; uhlmann-vasy2016 lines 499–503 | Lemmas 3.1.12–3.1.13 for a normalised `ρ`; the design's `|dρ|` factor is its own and is correct; covector condition as cited |
| 4.5 | uhlmann-vasy2016 lines 30–32, 504–524; stefanov-uhlmann-vasy2021 lines 128–134 | `(U₀, C₀, δ)`, `x̃ = −ρ − ε|z − p|²`, compactness for `0 ≤ c ≤ c₀`; as restated |
| 4.6 | paternain-salo-uhlmann2023 lines 3093–3096 | slightly larger `M₁`, strictly convex and non-trapping |
| 5.1 | same, lines 2646–2648, 2682–2696, 2931, 3063–3079; stefanov-uhlmann-vasy2021 lines 151, 153 | as cited; the opposite labels are reported correctly |
| 5.2 | paternain-salo-uhlmann2023 lines 2659–2661, 2666, 2674–2676, 2849–2861 | Definitions 3.1.1 and 3.1.3, Exercise 3.1.2(b), Example 3.2.1; as cited |
| 5.6 | same, lines 3114–3127; stefanov-uhlmann-vasy2021 lines 150–163 | Definition 3.3.4, Lemma 3.3.5, Exercise 3.3.6; lens relation on the unit ball bundle |
| 6.4 | paternain-salo-uhlmann2023 lines 2677–2678 | small spherical caps are non-trapping; the general statement rests on Lee Ch. 6 (uncertified) and the computed route |
| 6.5 | stefanov-uhlmann-vasy2021 lines 66–72; paternain-salo-uhlmann2023 lines 2449–2481 | `(r/c)′ > 0`; Lemma 2.5.2 and Corollary 2.5.3; the book's circle is convex seen from the outer side, which is 6.5's ball `{|x| ≤ r}` |

No author-flagged unverified locator exists in the README or the manifest.

**Adversarial table** (values computed in this round; sampled targets, headlines, and the targets
the findings touch).

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 1.1 trichotomy | `[0, 1]` at `0`; `n = 0` | `c(t) = t²`: `c′(0) = 0` tangent; `c(t) = t`: `1 > 0` inward; `T_q∂M = 0` is a hyperplane of a line | holds | none |
| 1.2 chart formula | `g = [[1, a], [a, 1]]`, `a = 1/2` | `grad x⁰ = (1, −a)/(1 − a²)`, `|grad x⁰|² = 4/3`, quotient `(2/√3, −1/√3)`; `g(e₀ − ae₁, e₁) = 0` | holds | none |
| 1.6 conformal law | from `∇̂_X Y = ∇_X Y + … − ⟨X, Y⟩ grad φ`; `φ = log 2`; `φ = −|x|²` | `e^{2φ}g(∇_X Y − ⟨X, Y⟩grad φ, e^{−φ}ν_in) = e^φ(II − dφ(ν_in)h)`; `2h`; `e⁻¹(1 − 2)h`, `Ĥ = −e`, and `−e⁻¹h = −e·e⁻²h` | holds | none |
| 2.2 Hessian iff (headline) | ball, `ρ` and `(2 + x₁)ρ` | `−2h` and `−2(2 + x₁)h` on `T∂M`, both negative | holds | none |
| 2.3 | hyperbola epigraph; `g_s = e^{−2s|x|²}g`; `n = 0` | `y″/(1 + y′²)^{3/2} = (1 + 2x²)^{−3/2} → 0`; `dφ(ν_in) = 2s`, `II = e^{−s}(1 − 2s)h`; `0 ≥ c·0` for every `c` | holds | none |
| 3.1 inclusion, outward criterion (repaired) | ball; half-space; `ρ ≡ 1`; `ρ ≡ −1` | `dφ(v) = 2⟨x, v⟩`, `ν_out = x`, `grad ρ/|grad ρ| = −2x/2`; `dφ(−e₀) = 1`; `D_ρ = N`, no boundary; `D_ρ = ∅` | holds | none |
| 3.3 `ρ̃` | zeros; `[0, 1]` with `t/2`, `1 − t/2`; `∂M = ∅`; compact `∂M` | `ρ̃ = χ(t) = t` where `φ₁ = 0`, sign of `t`; `M̃ = (−1/2, 3/2)`, `ρ̃ = 2x` on `|x| < 1/4`; `ρ̃ ≡ 1`; `φ₁ = 0` on `|t| ≤ 1/2` | regular value `0` | none |
| 3.5 realisation (headline) | compact `M` with a closed component; closed `M`; doubled half-line; disc against R5c | first copy `= {ρ_D ≥ 0}`, `DM` compact; `M̃ = M`, `ρ̃ ≡ 1`; two copies of `1` inseparable; open disc of radius `3/2`, `D = {x⁰ > 0}`, `ρ̃ = 2(1 − |x|)` | holds; compact case is on main | R01 |
| 3.6 Gauss sign | unit sphere; cylinder; exterior | `0 + 1·1 − 0 = 1`; `0 + 1·0 − 0 = 0`; `⟨−⟨X, Y⟩x, x⟩ = −h` | holds | none |
| 4.1 | ball, `v ⊥ q`; `v = 0` | `|q + tv|² = 1 + t²|v|² > 1`; constant curve, `τ = ∞` as in 5.2 | holds | none |
| 4.2 second-order contact (headline) | ball; exterior; `{y ≥ x⁴}`; `n = 0` | `−t²`, `−|dρ|II = −2·1`; `t²`; `−t⁴` with `II = 0`; `dρ(γ′) = 0` forces `γ′ = 0` | holds | none |
| 4.3 against R7.9 (repaired) | sphere; nonempty compact connected `∂M`, `N` connected; strip | `(1 − r)q = (1 + t)q` at `t = −r`, injective for `ε ≤ 1`; `{ρ > 0}`, `{ρ < 0}` nonempty, disjoint, open, so two components with `Ω₊ = int M` for `ν = ν_in`; `{0, 1} × ℝ` outside R7.9 | consistent | none |
| 4.5 convexity function (headline) | disc at `(0, −1)`; exterior; `c = 0`; `n = 0` | `(2 − 2ε)g`, `dx̃_q = 2q = (0, −2) = −dρ_q`, `K_c ⊆ {ε|z − q|² ≤ c}`; `−(2 + 2ε)g`; `K₀ = {q}`; first bullet vacuous for `δ < |dρ_q|` | holds | none |
| 4.6 | ball `ε₁ = 1/4`; `(1 − r²)e^{−r²}`; set identity | radius `1 + ε`, `II = h/(1 + ε)`; derivative `−2r(2 − r²)e^{−r²}`: `−2/e` at `1`, minimum `−e⁻²` at `√2`; `−1 ≤ ρ̂ ≤ r < 0` on `W ∖ M` gives `r ≥ −ε > −ε₁` | holds | none |
| 5.1 strata | disc; `n = 0`; `n ≥ 1` regular value | torus, two circles, annulus; four points, `μ = ±1`; fibre height function critical only at `μ = ±1` | holds | none |
| 5.2 exit time | annulus; flow identities; homogeneity | `|(−3/2, −1)|² = 13/4`, `τ = 3/2 + √3` against `3/2 − √(2δ − δ²) → 3/2`; `τ(y, −w) = τ(x, −v) + t`; `τ(0, e₁/4) = 4` | holds | none |
| 5.3 fold form | `y − t²`; general | `Q = r`, `a = y`; `a(y) = max_t h(·, y) ≥ h(0, y)` | holds | none |
| 5.4 regularity (headline) | disc; ball; exit tangency | `μ/τ̃ = sin θ/(2 sin θ) = 1/2 = II/2`; `σ = −2⟨x, v⟩`, `T = 1 − |x|²`, `(σ + √(σ² + 4T))/2 = τ`; a tangential exit at `τ > 0` would give `ρ < 0` just before `τ` | holds | none |
| 5.5 criteria (headline) | ball `f = ⟨x, v⟩`; closed `M ≠ ∅`; `M = ∅`; `u(φ_s z) = −∫_s^{τ_ε} h` | bound `(1 − (−1))/1 = 2`; (F, F, F); (T, T, T); derivative `h` | holds | none |
| 5.6 scattering (headline) | ball; `[a, b]`; disc lens data | `⟨x − 2⟨x, v⟩v, v⟩ = −⟨x, v⟩`; `α(b, +1) = (a, +1)`, `τ̃ = −(b − a)`; `|P|² = 1 − μ²`, `ℓ = 2μ = 2√(1 − |w|²)` | holds | none |
| 6.4 route (repaired) | normal chart; flat torus | `2δ_ij − 2z_kΓ^k_ij` with `Γ = O(|z|)`, `g_ij = δ_ij + O(|z|²)`; `Γ ≡ 0`, `2δ` | holds | none |
| 6.5 | `b = re^{φ(r²)}`; `φ = s² − 2s`; `φ = −s` | `dφ(ν_in) = −2rφ′`, `e^φ(1/r + 2rφ′) = b′/r`; `4r⁴ − 4r² + 1 = (2r² − 1)²`, `b′(1) = e⁻¹`, `b′(1/√2) = 0`; `b′(1) = −e⁻¹` | holds | none |

**Duplication and ownership.** Roadmap search (open heads and main, index of 2026-11-15) for
scattering relation, exit time, non-trapping, boundary defining function, strictly convex
boundary, boundary normal coordinates, collar extension, second fundamental form of the boundary,
mean-convex, signed distance, Fermi coordinates, Seeley, unit sphere bundle, geodesic vector field
and defining function. Second owners: RiemannianGeometry R7.9 (cited since the last repair) and
R5c (R01). Other hits are different objects: stochastic exit times; AffineMorseLefschetz 4.5's
collar extension (cited in Scope); Fermi coordinates along curves in surfaces
(`TauCetiRoadmap/RiemannianGeometry/Surfaces/README.md:307`); MinimalSurfaces consumes R5a's form
on a boundary and defines none (`…/MinimalSurfaces/README.md:1959`); GeometricCurrents' signed
distance to planes (:870); LorentzianGeometry (open) allows boundary and corners for
semi-Riemannian metrics and states no boundary convexity; ManifoldOptimization (open) is
boundaryless and consumes R5a. SmoothBundlesConnections B6.0 states convexity of the squared radial
distance along short geodesics; 6.4 names B6.0 as supplier and derives the Hessian bound from
pinned declarations, which is a route, not a second statement. The board's package index lists no
geometric package besides this one. No open pull request changes this roadmap, and the overlap
report lists no dropped or revision-only id.

Overlap check: read ManifoldOptimization, LorentzianGeometry, SmoothBundlesConnections (open), RiemannianGeometry with MinimalSurfaces and Surfaces, HopfRinow (main); the sublevel inclusion, outward criterion, normal collar and defining function of a compact separating hypersurface: owner RiemannianGeometry R7.9, cited; the compact case of the realisation as the closure of a relatively compact domain: owner RiemannianGeometry R5c, to be cited (R01); nothing else shared.

**Shape.** Layers are named by their mathematics and ordered by their dependency lines (Layer 2
needs 1.4–1.6; Layer 3 needs Layer 1; Layer 4 needs 3.1, 3.5; Layer 5 needs 4.1–4.3, 4.6; Layer 6
needs all). The README does not say it follows a source.

**Headline theorems and padding.** Seven end theorems in the Summary: 2.2, 3.5, 4.2, 4.5, 5.4,
5.5, 5.6. There is no `Suggested.lean` at the design stage, so the one-tactic probe, the binder
audit and the import check have nothing to inspect. Elaboration: not available (this lane does not
elaborate). No Lean command was run.

**Copyright and arrangement.** Fifteen passages were set beside the sources: the sampled locators
above and 1.4 (lines 2728–2737), 2.1 (Definition 3.1.7), 3.2 (stefanov-uhlmann-vasy2021 lines
128–129, 198–205), 5.5 (Proposition 3.3.1 and its proof). Shared material is formulas, standard
names and statements of a dozen words; no run of consecutive source words beyond a formula. The
routes of 3.3, 3.4, 4.3, 4.6 and the surjectivity step of 5.5 are written out here where the
sources leave exercises or one sentence. Contents of paternain-salo-uhlmann2023 §2.5, §3.1–3.3
against the layers: §3.1 is spread over Layers 1–5 (1.1, 1.4, 2.1, 3.5, 4.2, 4.3, 5.1, 5.2),
§3.2 ↔ 5.3–5.4, §3.3 ↔ 5.1, 5.5, 5.6, §2.5 ↔ 6.5; the order inside Layer 5 is forced (5.2 needs 5.1;
5.4 needs 5.1–5.3; 5.5 and 5.6 need 5.4), and Layers 1–4 and 6 map onto no run of sections. No
table, figure or exercise list is reused.

Source independence: 15 passages compared with 3 sources, none shared; largest share paternain-salo-uhlmann2023, 47 of 85 source mentions; contents compared with paternain-salo-uhlmann2023: independent.

## Not verifiable

- lee-riemannian2018 (Ch. 5–8), lee-smooth2012 (Theorem 9.25), sharafutdinov1994 (Ch. 4): settled
  as uncertified; not read. The signs they are cited for are fixed by the computed ball, cylinder
  and exterior values; 3.6 and the general statement of 6.4 have no certified locator besides them.
- The arXiv texts were read at the recorded versions (uhlmann-vasy2016 v1,
  stefanov-uhlmann-vasy2021 v3), not against the journal typesetting.
- No elaboration: there is no Lean file and this lane does not elaborate.
- 3.1's locality remark relies on Tau Ceti's sublevel chart at a point being built from the
  ambient chart at that point; the definition at `Sublevel.lean:473` was located, its body was not
  traced line by line. The statement it supports (smoothness and invertible differential of the
  inclusion) is local and holds independently of the route.

## Source issues

- **Misprint** in paternain-salo-uhlmann2023 at Corollary 2.5.3(b), printed p. 47: the source says the derivative of `b` is positive at radius 1; it should be at the outer radius `r₁`; affects a stated result.

## For the human reviewers

- **Licence.** paternain-salo-uhlmann2023 was read from an author's page copy carrying the publisher's personal-use notice (`sources.toml`, `licence_class = "author-page"`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c2e54523b759708648c1f4628cd13727fdb20008", "job": "REV-DESIGN-RiemannianManifoldsWithConvexBoundary~7", "model": "fable", "worker": "chris-x55"} -->
