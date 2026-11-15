<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13810#issuecomment-6898216393 -->
Review (claude) of 6fde428

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P3) Scope does not name the surface case that RiemannianGeometry's Surfaces sub-roadmap states

   **Location.** `packages/RiemannianManifoldsWithConvexBoundary/design/README.md`, Scope, lines
   48–51 ("the normal exponential and signed distance of a two-sided hypersurface with its Gauss
   lemma, boundary normal coordinates") and 4.3–4.4, lines 984–989 and 1058–1060.

   **Claim.** The Scope lists every place where another roadmap states one of this roadmap's objects.

   **Witness.** Main, `TauCetiRoadmap/RiemannianGeometry/Surfaces/README.md`, 1.2 (lines 296–321):
   for an embedded arc with unit normal, `F*g = dt² + a² ds²`, `a_t(s,0) = −k_g`, also for a boundary
   arc with inward normal; 1.3 (lines 340–347): `t` is the distance on a small tube.

   **Why P3 and not a second owner.** The objects differ in generality: Surfaces owns arcs in
   boundaryless surfaces, locally, with the Jacobi equation `a_tt + Ka = 0`; this roadmap owns regular
   level hypersurfaces in every dimension with a global tube. For `n = 1` the two statements coincide
   (`h_r = a² ds²`, `II = −½ ∂_r h_r|₀ = k_g ds²`). The conventions agree: plane circle of radius `R`
   with inward normal, Surfaces gives `k_g = 1/R`, `a = 1 − t/R`; 4.4 gives `h_r = (1 − r/R)² h₀`,
   `II = h₀/R`. Nothing is false; the relation is missing from the one place that records it.

   **Exact repair.** Add to the Scope's "leaves to other roadmaps" list: "the normal strip of an
   embedded arc in a boundaryless surface, `F*g = dt² + a(s,t)² ds²` with `a_t(s,0) = −k_g` and the
   Jacobi equation for `a`, and the distance to an arc on a small tube: RiemannianGeometry, Surfaces
   1.2–1.3; this roadmap states the form `dr² + h_r` and `II = −½ ∂_r h_r|₀` for a regular level
   hypersurface in every dimension (4.3–4.4), which for `n = 1` is `h_r = a² ds²` and `II = k_g ds²`
   for the inward normal". Add a Check to 4.4 with the circle values above, and "RiemannianGeometry
   Surfaces 1.2 (the surface case, for the comparison)" to 4.4's `*Needs:*`.

   **Repair test.** Unit sphere latitude at polar angle `φ₀`, normal toward the pole (Surfaces 1.2's
   Check): `a = sin(φ₀ − t)/sin φ₀`, `−a_t(s,0) = cot φ₀`; 6.3's cap of radius `R = φ₀` has
   `II = cot R · h`. Equal.

2. **F02** (P3) 5.4 proves continuity of `τ` from the fold form that it states later

   **Location.** README, 5.4, lines 1284–1286 ("at `∂₀SM` by the fold form below") and 1291–1293;
   `design/plan.json`, target 5.4.1, prerequisite `target:5.4.4`.

   **Claim.** The items of 5.4 are in build order.

   **Witness.** Plan script: target order `… 5.4.1, 5.4.2, 5.4.3, 5.4.4, 5.4.5 …`; 5.4.1 has
   prerequisite 5.4.4. The graph is acyclic: 5.4.4 needs only 5.3.1, 4.2.1 and 5.2.

   **Exact repair.** In 5.4 move the fold-form bullet (Lemma 3.2.9) to the first place, before the
   smoothness and continuity bullets, and write "by the fold form above". In the plan list target
   5.4.4 before 5.4.1, keeping both ids (no roadmap cites them).

   **Repair test.** Closed unit ball: the fold form `a = 4(⟨x,v⟩² + 1 − |x|²)`,
   `Q(r,x,v) = (−2⟨x,v⟩ + r)/2` uses only the root formula of 6.1 and no continuity of `τ`; at a
   glancing `z₀`, `a(z₀) = 0` and `Q(0, z₀) = 0 = τ(z₀)`, which is the continuity argument.

Two findings, both P3: neither is blocking, but each asks for a repair, so a fix round applies
them before the design is accepted. The three round-8
findings are repaired. No false, vacuous or unowned statement was found: every Check and formula
recomputed this round agrees with its statement. This review changed no design file, plan or
manifest entry.

## Previous findings and repairs

| Round-8 finding | Repaired passage | Assessment |
|---|---|---|
| F01 (P3), 6.4 names no ambient manifold on which the defining function is smooth | 6.4, lines 1509–1517: "a compact regular domain of the open submanifold `B(p, r_p)` (Hausdorff, second countable and boundaryless, with the restricted metric), with defining function `R² − d(p, ·)²`"; route lines 1525–1526; flat-torus Check lines 1535–1540 | **Repaired.** Recomputed: on `B(p, 1/2)`, `ρ = 1/16 − |z|²`, `dρ = −2z ≠ 0` on `|z| = 1/4`, `II = 2h/(2·1/4) = 4h`; `min(s², (1−s)²)` has one-sided derivatives `1`, `−1` at `s = 1/2`. Plan statement and test `flat_torus` agree. |
| F02 (P3), 6.2's locator names the circle from the other side | 6.2, lines 1448–1452 ("the source names a circle `{r = r̄}` as seen from the side of the larger radii … strictly concave boundary of the exterior `{r ≥ R}`"), Check lines 1460–1463; 2.1, lines 539–542 | **Repaired.** paternain-salo-uhlmann2023 lines 2449–2451 (`r̈(0) > 0`), 2456–2458 (viewed from the outer radius), 2463 (`b′ > 0`). Unit circle, `q = (1,0)`, `v = (0,1)`: `|q + tv|² = 1 + t²`, `r̈(0) = 1`; exterior `II = −h`, ball `II = h`. |
| F03 (P3), the GeometricTopology 1.1 contract states a clause that section does not | Contract lines 293–296 ("Assumed: the structure of `M ∖ ∂M` is the open-submanifold one, whose charts are the charts of `M` restricted to the interior …"); 3.3 lines 724–726 | **Repaired.** Main, `TauCetiRoadmap/GeometricTopology/README.md` lines 809–810 (interior boundaryless, inclusion a homotopy equivalence; structure not named) and 855 (the interiors embed openly in the glued manifold). |

The repaired patterns were sought again: all 31 occurrences of "regular domain" (6.4 is the only
one with a defining function smooth on an open subset only; 3.2 already says "of the open
submanifold `U`"); the five citations of Definition 2.5.1 and Lemma 2.5.2 (1.6 and 6.5 concern the
ball `{r ≤ r̄}`, the side the source names); every supplier contract sentence against its section
on main (below). No further instance. Maintainer notes: none were supplied.

## Verified sound

**Coverage.** All 1,632 lines of the README; the plan (6 layers, 49 targets: 30 theorems, 10
definitions, 2 constructions, 7 examples; 6 suppliers; `gaps: []`); the six manifest entries. By
script: every `target:` prerequisite resolves, every definition has at least three tests, every
target has a locator, every supplier section listed is used. 31 `**Checks.**` blocks. Every layer
ends with Examples and Dependencies. Searched and found none: LaTeX delimiters, pull-request
numbers, machine paths, process words ("round" occurs only in "round sphere"/"round metric").

**Dependency check, exact output:**

```text
candidate: RiemannianManifoldsWithConvexBoundary is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2242 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. No supplier is on the never-cite list. No gap is declared and
none is needed: every prerequisite is a target, a pinned declaration or a section that exists on
main.

**Supplier citations resolved on main (1a19c9f).**

- DifferentialGeometry: 5.1 (line 1648), 12.1 (2801), 12.2 (2848), 12.3 (2871), 12.5 (2936;
  `exists_halfSpaceOutwardUnitNormal` with the three laws and pointwise uniqueness at 2949–2951).
- HopfRinow (`Completed/HopfRinow/README.md`): Layer 1 (264), Layer 2 (427).
- RiemannianGeometry: 2.2 (R1.4) (1576), R5a (3205), R5c (3715), R7.9 (4469).
- GeometricTopology: standing convention (785–786), 1.1 (788; collar 797–799; interior 809–810),
  1.3 (851; bicollar 855–856; closed images, compactness, connectedness 864–866; double 870–871).
- ComplexKahlerGeometry: K5a (5.1 at 1440; the Seeley step at 1795–1796).
- SmoothBundlesConnections: B6.0 (1306).
- AffineMorseLefschetz 4.5 (819; collar extension 841); PositiveMass 5.1–5.2 (921, 957);
  PositiveScalarCurvature and Yamabe exist on main (consumers).

Open pull requests that change a supplier, read at their heads: GeometricTopology (1.1 and 1.3
keep their headings), ComplexKahlerGeometry (two revisions; both keep the K5a sections and the
Seeley step), SmoothBundlesConnections (B6.0 kept, uniform normal radii with `IsNormalDomain`
kept). Two draft revisions (of DifferentialGeometry and GeometricTopology) carry short discussion
texts, not the sections; the overlap report lists no dropped or revision-only id, and none was
found.

**Pinned declarations.** The 102 distinct backticked identifiers of the README were matched by
script against the pinned libraries. 21 are mathematical symbols or a source key (`II_q`, `h_r`,
`SM`, …). `exists_halfSpaceOutwardUnitNormal` is DifferentialGeometry 12.5's, as the README says.
The 80 others exist. Opened by hand (the script matches the last name component only):

- `Bundle.ContMDiffRiemannianMetric.pullback`: `TauCeti/Geometry/Manifold/Riemannian/Pullback/Basic.lean:158`
- `Bundle.ContMDiffRiemannianMetric.rescale`: `TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Conformal.lean:87`
- `CovariantDerivative.IsLeviCivitaConnection.uniqueness`: `Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean:256`
- `TauCeti.Manifold.hessian`: `TauCeti/Geometry/Manifold/Riemannian/Laplacian.lean:135`
- `ModelWithCorners.interior`, `.boundary`: `Mathlib/Geometry/Manifold/IsManifold/InteriorBoundary.lean:103, 112`
- `TauCeti.UpperHalfSpace`: `TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/UpperHalfSpace/Basic.lean:91`
- `TauCeti.scalarRegularSublevelChartedSpace`: `TauCeti/Geometry/Manifold/RegularValue/Scalar/Sublevel.lean:473`.
  Its type is `ChartedSpace (EuclideanHalfSpace (n + 1)) {x | f x ≤ a}` for any boundaryless
  finite-dimensional model; it assumes no separation axiom. Boundary and interior at lines 652, 675.
- `TauCeti.SmoothEmbedding.exists_isClosedEmbedding_normalExp_norm_le_subset`:
  `TauCeti/Geometry/Manifold/TubularNeighborhood/Riemannian/Noncompact.lean:58`. It assumes
  `T2Space N`, `SecondCountableTopology N`, a closed range, and gives a smooth radius below any
  continuous positive `ε`, with no completeness: as 4.3 uses it.
- `TauCeti.SmoothEmbedding.exists_partialDiffeomorph_normalExp_subset`:
  `TauCeti/Geometry/Manifold/TubularNeighborhood/Riemannian/Coordinates.lean:89`. It assumes
  `[SecondCountableTopology N] [Nonempty M]`; for empty `Σ` the tube statement of 4.3 is empty.
- `TauCeti.sphereBundleChartedSpace`, `isManifold_sphereBundle`:
  `TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Sphere.lean:143, 161`. The model is
  `𝓘(ℝ, Fin (finrank (E × F) − 1) → ℝ)`, of dimension `2(n+1) − 1 = 2n + 1`, so `SN` is a
  boundaryless manifold in the setting of 3.1, as 5.1 says.

**Seeded source sample** (read in the cached texts this round).

| Target | Locator read | Result |
|---|---|---|
| 1.3 | uhlmann-vasy2016 lines 25–26, 134–136; book Lemma 3.1.10, lines 2766–2773 | positive inside, zero and nondegenerate on the boundary; the normalised function is the book's; as cited |
| 3.2 | stefanov-uhlmann-vasy2021 lines 128–129, 198–200, 203–205; uhlmann-vasy2016 lines 137–140, 507–509 | "strictly concave from the superlevel sets" is the article's term; the distance-function example is at 203–205; as cited |
| 3.3 | book Lemma 3.1.8 and Exercise 3.1.9, lines 2749–2762 | closed extension, by the double; the defining function and atlas comparison are the design's own; lee-smooth2012 not read (uncertified) |
| 3.4 | book lines 2755–2762 | the source extends the metric in the Euclidean case and leaves the general case as an exercise; the route is the design's own |
| 3.6 | lee-riemannian2018 Ch. 8 | not read (uncertified); signs fixed by the computed sphere and cylinder below |
| 4.1 | book lines 2646–2658, 2763–2765 | maximal geodesic of `M`; geodesics of the closed extension; as cited |
| 4.3 | stefanov-uhlmann-vasy2021 lines 99–100, 220–221; book Lemma 3.1.10 | signed distance from a hypersurface; `ρ = d(·, ∂M)` near `∂M`, sign sets, `∇ρ = ν`; as cited |
| 4.4 | stefanov-uhlmann-vasy2021 lines 20–22, 220–221 | the normal gauge and boundary normal coordinates are named there; the statements rest on lee-riemannian2018 Ch. 5–6 (uncertified) and the computed values below |
| 4.6 | book lines 3093–3096 | a slightly larger compact `M₁` with strictly convex boundary, non-trapping; as cited |
| 5.1 | book lines 2646–2648, 2682–2696, 2931, 3063–3079; article lines 151, 153 | strata with inward `ν`, `μ`, flow and generator; the article's opposite labels are reported correctly |
| 5.2 | book Definitions 3.1.1, 3.1.3, lines 2659–2661, 2674–2676; Exercise 3.1.2(b), line 2666; Example 3.2.1, lines 2849–2861 | as cited; the supremum form equals the source's `τ₊` |
| 5.3 | book Lemma 3.2.10, lines 2970–2982, proof 2985–3026; Exercise 3.2.12, lines 3044–3045; use at 3039–3041 | hypotheses and conclusion as restated; `a(y) = h(g(y), y) ≥ h(0, y)`; `Q = g + S` increasing in `r` |
| 6.1 | book Example 3.2.1, lines 2849–2864; lines 307–310; Example 3.1.4, lines 2677–2680 | disc exit time and odd extension; Euclidean subdomains non-trapping; as cited |
| 6.4 | book Example 3.1.4, lines 2677–2678 | small spherical caps non-trapping: the instance, as the README says; the general statement rests on lee-riemannian2018 Ch. 6 (uncertified) and the route |
| 6.5 | article lines 66–72; book Lemma 2.5.2 and Corollary 2.5.3, lines 2462–2481 | `(r/c)′ > 0` and its equivalence with strict convexity of the spheres; `r/c = r e^{φ(r²)} = b` |

Also read for the headlines: book Lemmas 3.1.12–3.1.13 (2781–2844), 3.2.3 (2865–2886), 3.2.6
(2896–2925), 3.2.8 (2935–2949), 3.2.9 (2955–2966), 3.2.11 (3027–3043), Remark 3.2.13 (3046–3055),
Proposition 3.3.1 (3081–3106), Exercise 3.3.3 (3110–3113), Definition 3.3.4 and Lemma 3.3.5
(3114–3127); uhlmann-vasy2016 Theorem (30–32) and construction (504–524); article lines 89–97 and
150–163. Each supports its statement as written. No author-flagged unverified locator exists.

**Adversarial table** (values computed this round).

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 1.2 chart formula | `g = [[1, a], [a, 1]]` | `g⁻¹e⁰ = (1, −a)/(1 − a²)`, parallel to `e₀ − a e₁`; `g(e₀ − a e₁, e₁) = 0`, norm² `1 − a²` | holds | none |
| 1.3 global existence, comparison | `Σ φ_i x⁰_i + φ₀`; ball `ρ′ = (2 + x₁)ρ`; `[0,1]`, `x(1 − x)` | at `q ∈ ∂M`: `d = Σ φ_i dx⁰_i` (each `x⁰_i(q) = 0`, `q ∉ supp φ₀`), positive on inward vectors; `u ∈ [1, 3]`; derivatives `1`, `−1` | holds | none |
| 1.4 third description | `W` tangent along `∂M` | `⟨∇_u W, ν_in⟩ = −⟨W, ∇_u ν_in⟩ = ⟨W, ∇_u ν_out⟩` | equals `II` | none |
| 1.6 | `φ = −|x|²` on the disc; `φ = log c` | `dφ(ν_in) = 2`, `e⁻¹(1 − 2)h`, `Ĥ = e(1 − 2) = −e`; `c·h` | holds | none |
| 2.1 Checks | `{y ≥ x³}`; hyperbola epigraph (2.3) | `6x/(1 + 9x⁴)^{3/2}`; `y″/(1 + y′²)^{3/2} = (1 + 2x²)^{−3/2}` | holds | none |
| 2.2 Hessian iff (headline) | ball with `ρ`, `(2 + x₁)ρ` | on `T∂M`: `−2h`, `−2(2 + x₁)h`, both negative | holds | none |
| 3.2 | `x = |z|²`; `x = |z − z₀| − const` | `II = 2h/(2√c) = h/√c`; `Hess = (g − dx ⊗ dx)/|z − z₀|`, positive on `ker dx` | holds | none |
| 3.3 `ρ̃ = φ₀ χ(t) + φ₁ s` | `t ∈ (0,1)`; `t = 0`; `|t| ≤ 1/2`, `∂M` compact; `[0,1]`; `x³(1 − x)³` | `φ₀χ + φ₁ > 0`; `φ₁ = 0` near `∂M`, value `χ(0) = 0`; `φ₀ = 1`, `ρ̃ = t`; `M̃ = (−1/2, 3/2)`, `ρ̃ = 2x`; sign pattern right, derivative `0` at `0`, `1` | regular value `0`; the negative control fails as stated | none |
| 3.4 | `√x`; `(x + 1/100) dx²` | not `C¹` at `0`; positive only for `x > −1/100` | holds | none |
| 3.5 realisation (headline) | disc; closed `M`; `[0, ∞)`; `M` compact with a closed component | `S²` or `ℝ²`, `II = h` on the disc itself; `ρ̃ ≡ 1`; `M̃ ≅ (−1, ∞)`; the double carries two copies, first copy `{ρ_D ≥ 0}` | holds | none |
| 3.6 | sphere; cylinder; exterior; R5a's `S_η = −(∇η)^⊤` | `0 + 1·1 − 0 = 1`; `0 + 1·0 − 0 = 0`; `⟨B, +x⟩ = −h`; `S_{ν_in} = (∇ν_out)^⊤ = S` | holds | none |
| 4.1 | ball, `v ⊥ q`; `v = 0` | `|q + tv|² = 1 + t²|v|² > 1`; constant curve, `τ = ∞` | holds | none |
| 4.2 second-order contact (headline) | ball; exterior; `{y ≥ x⁴}` | `−t²`, `−|dρ| II = −2`; `+t²`; `−t⁴` with `II = 0` | holds | none |
| 4.3 tube, `ρ̂` | sphere `f = 1 − |x|²`; `{ρ̂ ≥ −ε} ∖ M`; bad cutoff | `E = (1 − r)q`, `r_Σ = 1 − |x|`; off `M ∪ W`: `−1 < −ε`, on `W ∖ M`: `ρ̂ ≤ max(r, −1)`; `|x|² − |x|³`, third derivative `∓6` jump | holds | none |
| 4.4 and R01 | ball radius `R`; strip; Surfaces 1.2 circle | `h_r = (1 − r/R)² h₀`, `−½ ∂_r = h₀/R`; coordinate `0.8`, distance `0.2`; `a = 1 − t/R`, `k_g = 1/R` | holds; agrees with Surfaces | R01 |
| 4.5 convexity function (headline) | disc at `(0, −1)`; `v ∈ ker dx̃`; `c = 0` | `Hess x̃ = (2 − 2ε)g`, `dx̃_q = 2q = −dρ_q`; `|dρ(v)| ≤ C′ε < δ`, `Hess x̃ ≥ C₀ − C″ε`; `K₀ = {q}` | holds | none |
| 4.6 | ball; cap in `S¹`; `(1 − |x|²)e^{−|x|²}` | radius `1 + ε`, `II = h/(1 + ε)`; `ε₁ < π − R`; radial derivative `−2/e`, minimum `−e⁻²` at `√2` | holds | none |
| 5.1 | `dim SN`; disc; `[a, b]`; `μ` | `2(n+1) − 1 = 2n + 1`; torus, two circles, annulus; four points; `d/ds ⟨v cos s + ν sin s, ν⟩ = 1` at a zero | holds | none |
| 5.2 | annulus `1 ≤ |x| ≤ 2`; exit sign | `τ = 3/2 + √3` against `3/2 − √(2δ − δ²) → 3/2`; `μ > 0` at the end would give `ρ < 0` just before | holds | none |
| 5.3 | `y − t²`; `y − t⁴`; `cos r` | `Q = r`, `a = y`; no such form; `d/ds f(√s) = g(√s)/2` for `f′ = r g` | holds | none |
| 5.4 regularity (headline) and R02 | ball; disc at `(0, −1)` | `σ = −2b`, `T = (−b + √(b² + c))(b + √(b² + c)) = c`, `a = 4(b² + c)`, `Q(±√a) = (−2b ± √a)/2`; `μ/τ̃ = 1/2 = II/2` | holds; order of items | R02 |
| 5.5 criteria (headline) | ball `f = ⟨x, v⟩`; closed `M ≠ ∅`; `M = ∅`; half-circle | `(1 − (−1))/1 = 2`; (F, F, F); (T, T, T); `τ(θ, ±1) = π/2 ∓ θ` | holds | none |
| 5.6 scattering (headline) | ball; `[a, b]`; disc | `⟨x − 2bv, v⟩ = −b`; `α(b, +1) = (a, +1)`; `ℓ = 2√(1 − |w|²)` | holds | none |
| 6.1 | root; ellipse; graph form | `t² + 2bt + |x − c|² − R² = 0`; `(2/b²)/(2/a) = a/b²`; `ρ = x₀ − w`, `II = D²w(0)` | holds | none |
| 6.2 (repaired) | unit circle | `r̈(0) = 1`, exterior `II = −h`, ball `II = h` | holds | none |
| 6.3 | cap; hyperbolic plane | `cos R/ sin R`; `Hess_xx = 1/y − (1/y)(½ − (x²+1)/(2y²)) = u/y²`, `Hess_xy = −x/y² + x/y² = 0`, `Hess_yy = (x²+1)/y³ + (1/y)(½ − (x²+1)/(2y²)) = u/y²` | holds | none |
| 6.4 (repaired) | flat torus; `S²`; `S¹` | `II = 4h`, `τ ≤ 1/2`; `r_p ≤ π/2`; `d² = θ²` on `B(p, π)` | holds | none |
| 6.5 | general `φ`; `φ = s² − 2s`; `φ = −s` | `b′ = e^φ(1 + 2r²φ′)`, `II = e^φ(1/r + 2rφ′)h = (b′/r)h`; `(2r² − 1)²e^{r⁴ − 2r²}`, zero at `1/√2`; `−e⁻¹` | holds | none |

**Duplication and ownership.** Roadmap search (open heads, then main) for: scattering relation,
exit time, non-trapping, boundary defining function, strictly convex boundary, convex boundary,
boundary normal coordinates, Fermi coordinates, signed distance, lens data and rigidity,
mean-convex, X-ray transform, Weingarten, collar extension, second fundamental form of the
boundary. Only this design states the first, third to seventh, tenth, eleventh and twelfth. "Exit
time" on main is the stochastic one and a flow-box one in SymplecticGeometry. "Weingarten" is the
matrix-integral calculus, and ManifoldOptimization's term is for boundaryless submanifolds.
"Collar extension": AffineMorseLefschetz 4.5 (named in the Scope) and unrelated uses. "Signed
distance": RiemannianGeometry R7.9 (cited) and GeometricCurrents (a barrier, no construction).
"Second fundamental form of the boundary": MinimalSurfaces 10.1, a consumer of R5a's form. "Fermi
coordinates": Surfaces 1.2–1.3 (R01). Second owners on main already cited: RiemannianGeometry R7.9
and R5c. The board's package index lists AnalyticNumberTheory and LawrenceVenkateshMethod only.

Overlap check: read ManifoldOptimization, LorentzianGeometry, SmoothBundlesConnections (open), RiemannianGeometry, Surfaces, HopfRinow (main); the sublevel inclusion, outward criterion, normal collar and defining function of a compact separating hypersurface: owner RiemannianGeometry R7.9, cited; the compact case of the realisation: owner RiemannianGeometry R5c, cited; the normal strip of an arc in a surface: owner Surfaces 1.2–1.3, to be named in the Scope (R01); nothing else shared. The third list (results and headings) is empty.

**Shape.** Layers are named by their mathematics. The order is forced by the dependency lines:
Layer 2 needs 1.4–1.6; Layer 3 needs Layer 1; Layer 4 needs 3.1 and 3.5; Layer 5 needs 4.1–4.3 and
4.6; Layer 6 needs all. The README does not say it follows a source.

**Headline theorems and padding.** Seven end theorems in the Summary: 2.2, 3.5, 4.2, 4.5, 5.4, 5.5,
5.6. There is no `Suggested.lean` at the design stage, so the one-tactic probe, the binder audit
and the import check have nothing to inspect. Elaboration: not available (this lane does not
elaborate). No Lean command was run.

**Copyright and arrangement.** Seventeen passages were set beside the sources: 1.3, 2.1, 3.2,
3.3 with 3.5, 4.1, 4.2, 4.3, 4.5, 4.6, 5.1, 5.2, 5.3 (statement and route), 5.4, 5.5 (statement
and route), 5.6 (against both the book and the article), 6.2, 6.5. What is shared is formulas,
standard names and theorem statements whose hypotheses can be written one way; no run of
consecutive source words beyond a formula. Contents of paternain-salo-uhlmann2023 against the
layers: §3.1 is spread over 1.1, 1.4, 2.1, 3.5, 4.1, 4.2, 4.3, 5.1, 5.2; §3.2 ↔ 5.3–5.4;
§3.3 ↔ 5.1, 5.5, 5.6; §2.5 ↔ 6.5. The order inside Layer 5 is forced (5.2 needs 5.1; 5.4 needs
5.1–5.3; 5.5 and 5.6 need 5.4). Layers 1–4 and 6 map onto no run of sections. No table, figure or
exercise list is reused.

Source independence: 17 passages compared with 3 sources, none shared; largest share paternain-salo-uhlmann2023, 48 of 86 source mentions; contents compared with paternain-salo-uhlmann2023: independent.

## Not verifiable

- lee-riemannian2018 (Ch. 5–8), lee-smooth2012 (Theorem 9.25), sharafutdinov1994 (Ch. 4): settled
  as uncertified; not read. 1.5, 3.6, 4.4 and the general statement of 6.4 have no certified
  locator besides them; their signs and normalisations are fixed by the computed values above.
- The arXiv texts were read at the recorded versions (uhlmann-vasy2016 v1,
  stefanov-uhlmann-vasy2021 v3), not against the journal typesetting.
- No elaboration: there is no Lean file and this lane does not elaborate.
- The two draft revisions of DifferentialGeometry and GeometricTopology were read only as far as
  the tool prints them (short discussion texts); the overlap report is relied on for them.

## Source issues

- **Misprint** in paternain-salo-uhlmann2023 at Corollary 2.5.3(b), printed p. 47: the source says the derivative of `b` is positive at radius 1; it should be at the outer radius `r₁`; affects a stated result.
- **Misprint** in paternain-salo-uhlmann2023 at Lemma 3.2.11, printed p. 64: the source says the second factor of `T` is the exit time at the point "x minus v"; it should be the exit time of the reversed vector `(x, −v)`; affects a stated result.

## For the human reviewers

- **Licence.** paternain-salo-uhlmann2023 was read from an author's page copy carrying the publisher's personal-use notice (`packages/RiemannianManifoldsWithConvexBoundary/sources.toml`, `licence_class = "author-page"`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6fde428678a2e91d61deb50c8762110b3cd68c9e", "job": "REV-DESIGN-RiemannianManifoldsWithConvexBoundary~9", "model": "fable", "worker": "chris-x83"} -->
