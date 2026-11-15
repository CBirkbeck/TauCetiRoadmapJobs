<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13810#issuecomment-6899060690 -->
Review (claude) of 75730c4

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P3) The plan drops Layer 5's second-countability hypothesis from ten targets

   **Location.** `packages/RiemannianManifoldsWithConvexBoundary/design/plan.json`, `hypotheses` of
   targets 5.2, 5.4.1–5.4.5, 5.5.1, 5.5.2, 5.6.1, 5.6.2; against `design/README.md`, Layer 5, line
   1177: "Throughout, `M = {ρ ≥ 0}` is a regular domain of a Hausdorff second-countable boundaryless
   `(N, g)`."

   **Claim.** The plan's hypotheses of each target are the README's.

   **Witness.** Plan 5.5.2 lists `target:3.4.1` and `target:4.6` as prerequisites; both carry
   "N second countable", 5.5.2 does not. Plan 6.4 calls it "the standing hypothesis of Layer 5, whose
   criterion 5.5.1 the route applies"; 5.5.1 omits it. Only 5.1 has it.

   **Why P3.** No statement becomes false: `M` is compact in 5.4–5.6, so a finite union of chart
   domains is a second-countable open neighbourhood, and 5.2 is a definition by geodesics. The route
   is what breaks: for `N` an uncountable disjoint union of planes and `M` the closed unit disc of
   one, the plan's 5.5.2 cannot apply 3.4.1 to `SN` (no partition of unity on a space that is not
   σ-compact), while the README's Layer 5 excludes this `N`.

   **Exact repair.** Add the hypothesis string "N second countable" (as in plan 5.1) to the
   `hypotheses` of 5.2, 5.4.1, 5.4.2, 5.4.3, 5.4.4, 5.4.5, 5.5.1, 5.5.2, 5.6.1 and 5.6.2. No README
   change.

   **Repair test.** On the instance above every repaired target excludes `N`; on the closed unit
   disc in `ℝ²` the hypothesis holds and 5.5.2's route reads 3.4.1 and 4.6 with their own hypotheses
   met.

2. **F02** (P3) Three cited sections are missing from the manifest's `cited_for` lists

   **Location.** `packages/RiemannianManifoldsWithConvexBoundary/sources.toml`, `cited_for` of
   `stefanov-uhlmann-vasy2021` and of `paternain-salo-uhlmann2023`.

   **Claim.** Each manifest entry lists every README section that cites the work.

   **Witness.** README 1.4, line 442, cites Stefanov–Uhlmann–Vasy line 53; 3.5, line 829, cites its
   lines 96–97; 3.4, line 807, cites Paternain–Salo–Uhlmann lines 2755–2762. No `cited_for` item of
   the two entries names 1.4, 3.5 or 3.4 respectively (the line ranges appear under 2.1, 3.1 and
   "3.3, 3.5").

   **Exact repair.** In `stefanov-uhlmann-vasy2021`: add "1.4 strict convexity as a positive second
   fundamental form (line 53)" and "3.5 a manifold with boundary as a domain in a boundaryless
   extension (lines 96-97)". In `paternain-salo-uhlmann2023`: change "3.3, 3.5 closed extension and
   double" to "3.3, 3.4, 3.5 closed extension, extension of the metric and double". Nothing else in
   the entries changes.

   **Repair test.** The section-by-section comparison below (66 named source mentions in sections
   1.1–6.5) then reports no section missing from its work's list.

Two findings, both P3 and both outside the README's mathematics: the plan's Layer 5 hypothesis
lists, and three section entries of the manifest. Neither is blocking (no P1 or P2), but each
carries a repair, so the verdict asks for changes and a fix round applies them.
Both round-9 findings are repaired. No false, vacuous or unowned statement was found: every Check
and formula recomputed this round agrees with its statement. No gap is declared.
This review changed no design file, plan or manifest entry.

## Previous findings and repairs

| Round-9 finding | Repaired passage | Assessment |
|---|---|---|
| F01 (P3), the Scope does not name the surface case of RiemannianGeometry's Surfaces sub-roadmap | Scope, lines 94–102: "the normal strip of an embedded arc in a boundaryless surface, `F*g = dt² + a(s, t)² ds²` … RiemannianGeometry/Surfaces 1.2–1.3; this roadmap states, in every dimension and on a tube along the whole hypersurface …"; 4.4 Check, lines 1078–1085; plan test `surface_case` | **Repaired.** Main, `TauCetiRoadmap/RiemannianGeometry/Surfaces/README.md`: 1.2 (lines 296–305: strip form, `a_tt + (K ∘ F)a = 0`, `a(s,0) = 1`, `a_t(s,0) = −k_g`), line 320 (boundary arc, inward normal, `t ≥ 0`), 1.3 (lines 340–347), conventions lines 110–112 (`k_g = 1` on the unit circle). The repair did not add Surfaces 1.2 to 4.4's `*Needs:*`; that is correct, since neither the statement nor the route of 4.4 uses it and only a Check compares values. |
| F02 (P3), 5.4 proves continuity of `τ` from a fold form stated later | 5.4, lines 1296–1304 (fold form first, with its route, "Continuity of `τ` is not used"); line 1311 ("by the fold form above"); plan order `… 5.3.2, 5.4.4, 5.4.1 …`, 5.4.4 with prerequisites 5.3.1, 4.2.1, 5.1, 5.2 | **Repaired.** Script over the plan: 49 targets, every `target:` prerequisite resolves and precedes its user. Source: paternain-salo-uhlmann2023 lines 2967–2969 derive Lemma 3.2.9 from Lemma 3.2.10 alone. |

Adversarial pass on the changed passages (values below, rows "Scope / 4.4 Check" and "5.4 fold
route"). The repaired patterns were sought again: a route or statement that uses a later item
(none: the later sections named in 1.3, 4.3 and in the Checks of 4.1, 4.4, 4.6, 5.1, 5.2, 5.4, 5.5
are remarks or comparisons, no proof step); an object of this roadmap that another roadmap states
and the Scope does not name (eleven searches below, none). Maintainer notes: none were supplied.

## Verified sound

**Coverage.** All 1,655 lines of the README, read in full; the plan (6 layers, 49 targets: 30
theorems, 10 definitions, 2 constructions, 7 examples; 6 suppliers; `gaps: []`); the six manifest
entries. By script: every definition has at least three tests, every target a locator, 31
`**Checks.**` blocks; every layer ends with Examples and Dependencies. Searched and found none:
LaTeX delimiters, pull-request numbers, machine paths, HTML anchors, process words, "optional",
"deferred", `lemma` as a declaration keyword (the 27 lines with the word are source lemma numbers, "Gauss
lemma", "tube lemma" and one "`_inner` lemma" of the library).

**Dependency check, exact output:**

```text
candidate: RiemannianManifoldsWithConvexBoundary is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2242 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. No supplier is on the never-cite list. No gap is declared and
none is needed.

**Supplier citations resolved** on main (1a19c9f, the head round 9 read; its line numbers were
re-opened for the items marked *).

- DifferentialGeometry: 5.1* "The boundary interface" (1648, under Layer 5), Layer 12 (2796), 12.5* `exists_halfSpaceOutwardUnitNormal`
  with the three laws and pointwise determination (2949–2951).
- HopfRinow (`Completed/HopfRinow/README.md`): Layers 1 and 2.
- RiemannianGeometry: 2.2 (R1.4) (1576), R5a (3205; averaged vector and position-vector sign at
  190–192), R5c* (3715; dimension `m ≥ 1`), R7.9* (4469; second countable, normal collar
  `c_ν(x,t) = exp(tν)`, at most two components).
- RiemannianGeometry/Surfaces 1.2–1.3*: as in the table above.
- GeometricTopology: 1.1 (788), 1.3 (851). At the head of its open revision (5cb54fc) both
  headings and statements are kept: 1.1 "Every second-countable … smooth manifold with boundary
  has a smooth collar" with Lee's Theorem 9.25; 1.3 the glued manifold, the two interiors
  embedding openly, `∂M × (−1, 1)`, closed images, compactness and connectedness, the double
  "closed exactly when `M` is compact"; Layer 1 "Hausdorff and second countable".
- ComplexKahlerGeometry: K5a (5.1 at 1440), the half-space Seeley step* (1795–1796).
- SmoothBundlesConnections: B6.0* (1306; "positive uniform normal … radius bounds on each compact
  set … `IsNormalDomain` on every tangent ball"); the same words at the head of its open revision
  (ca84a4a, lines 1625–1626).
- Consumers: PositiveMass 5.1–5.2* (921, 957; `tr A/(n−1)` for the inward normal at 951);
  AffineMorseLefschetz 4.5 (819); PositiveScalarCurvature and Yamabe exist on main.

The overlap report lists no dropped id, no revision-only id and no other pull request changing
this roadmap; re-run this round, same result. The citation resolver reports none found nowhere.

**Pinned declarations.** 50 cited names were located at the pins by declaration, and the
namespaces of those whose last component is ambiguous were opened:

- `Bundle.ContMDiffRiemannianMetric.hessian_rescale`:
  `TauCeti/Geometry/Manifold/Riemannian/Hessian/Conformal.lean:81` (the homonym at
  `Hessian/WithMetric.lean:76` is `TauCeti.WithMetric.hessian_rescale`). Its correction term for
  the factor `f` is `−(2f)⁻¹(df ⊗ du + du ⊗ df − ⟨grad f, grad u⟩ g)`; with `f = e^{2φ}` and
  `u = ρ` on `T∂M` (where `dρ = 0`) this is `+⟨grad φ, grad ρ⟩ g`, as 1.6's route says.
- `Bundle.ContMDiffRiemannianMetric.leviCivitaConnection_rescale_apply`:
  `…/CovariantDerivative/LeviCivita/Conformal.lean:260`; `rescale`:
  `…/VectorBundle/Riemannian/Conformal.lean:87`.
- `TauCeti.UpperHalfSpace.hasConstantSectionalCurvature`:
  `…/Hyperbolic/UpperHalfSpace/Curvature.lean:139`; `hyperbolicMetric`: `…/Metric.lean:41`;
  `TauCeti.UpperHalfSpace`: `…/Basic.lean:91`.
- `TauCeti.Manifold.ContMDiffNondegenerateMetricFamily`:
  `…/VectorBundle/NondegenerateMetric/Family.lean:73`; `.contMDiffAt_christoffelSymbol`:
  `…/LeviCivita/Nondegenerate/Family.lean:116`.
- `CovariantDerivative.leviCivitaConnection`, `.isLeviCivitaConnection_leviCivitaConnection`,
  `.IsLeviCivitaConnection.uniqueness`:
  `Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean:360, 409, 256`.
- `ContDiffAt.implicitFunction`, `ContDiffAt.contDiffAt_implicitFunction`:
  `Mathlib/Analysis/Calculus/ImplicitContDiff.lean:55, 91`.
- `exists_contMDiff_zero_iff_one_iff_of_isClosed`, `exists_contMDiffSection_forall_mem_convex_of_local`:
  `Mathlib/Geometry/Manifold/PartitionOfUnity.lean:797, 593`.
- `ContDiff.sub_eq_hadamardFactor_apply`, `ContDiff.contDiff_hadamardFactor`:
  `TauCeti/Analysis/Calculus/Hadamard.lean:115, 131`; `TauCeti.contDiff_intervalIntegral`:
  `TauCeti/Analysis/Calculus/ParametricIntegral.lean:211`.
- `TauCeti.IsOutwardPointing`: `…/Boundary/Orientation.lean:46`; `TauCeti.isManifold_boundary`:
  `…/Boundary/Charts.lean:321`; `TauCeti.IsRegularValue`: `…/RegularValue.lean:92`;
  `TauCeti.Manifold.IsGeodesicCurveOn`: `…/Geodesic/Basic.lean:102`; the sublevel lemmas at
  `…/RegularValue/Scalar/Sublevel.lean:639, 652, 675`; the level lemmas at
  `…/RegularValue/Level.lean:234, 435, 485`; the normal-coordinate lemmas at
  `…/Geodesic/Normal/Coordinates.lean:84, 270, 292`; the geodesic-flow lemmas at
  `…/Geodesic/Flow.lean:65, 117` and `…/Geodesic/Compact.lean:75`.

For the eleven names round 9 opened by hand (the tube theorems, the sphere bundle, the sublevel
charted space and others) its file-and-line record is relied on; the pins are unchanged.

**Seeded source sample** (read in the cached texts this round).

| Target | Locator read | Result |
|---|---|---|
| 1.2 | paternain-salo-uhlmann2023 lines 2687–2689 | `ν` is the inward unit normal; the strata use it; as cited. lee-riemannian2018 Ch. 8 not read (uncertified) |
| 1.3 | uhlmann-vasy2016 lines 25–26, 134–136; book Lemma 3.1.10, lines 2766–2773 | positive inside, zero and nondegenerate on the boundary; the book's function is the normalised one; as cited |
| 1.6 | book Definition 2.5.1 and Lemma 2.5.2, lines 2449–2473 | sign of `b′(r̄)` decides convexity of the circle: the rotationally symmetric case; the general law rests on the pinned conformal Hessian and the computed values |
| 2.3 | book lines 3093–3095; uhlmann-vasy2016 lines 49–51 | strict convexity is an open condition; the hypotheses persist under small perturbations of the metric; as cited |
| 3.4 | book lines 2755–2762 | the source extends the metric in the Euclidean case and leaves the general case as an exercise; the route is the design's own |
| 3.5 | book Lemma 3.1.8, lines 2749–2762; stefanov-uhlmann-vasy2021 lines 96–97 | compact `M` embeds isometrically in a closed connected manifold; a not necessarily compact `M` as a subset of a boundaryless manifold; as cited |
| 4.3 | stefanov-uhlmann-vasy2021 lines 99–100, 220–221; book Lemma 3.1.10 | signed distance from a hypersurface; `ρ = d(·, ∂M)` near `∂M`, the three sign sets, `∇ρ = ν`; as cited |
| 4.6 | book lines 3093–3096 | a slightly larger compact `M₁` with strictly convex boundary, non-trapping; as cited |
| 5.3 | book Lemma 3.2.10, lines 2970–2982, proof 2985–3026; Exercise 3.2.12, lines 3044–3045; use at 3039–3041 | hypotheses and conclusion as restated; `a = h(g(y), y)`, `Q = g + S` increasing in `r` (line 3021), which is the README's `∂_r Q(0, y₀) > 0`; the source's exercise has no parameters, the README's lemma has them, as line 3039 needs |
| 5.5 | book Proposition 3.3.1, lines 3081–3106 | compact, strictly convex boundary; the three conditions; (iii) ⇒ (i) uses no convexity (lines 3087–3090), as the README's first item says |
| 5.6 | book Definition 3.3.4, Lemma 3.3.5, Exercise 3.3.6, lines 3114–3127; article lines 150–163 | `α = φ_τ̃`, diffeomorphism, fixed points `∂₀SM`, `α(∂±) = ∂∓`, involution, `τ̃ ∘ α = −τ̃`; the article's `∂±` are the opposite ones and its `L`, `ℓ` live on `B∂M`; as cited |
| 6.1 | book Example 3.2.1, lines 2849–2864; lines 307–310; Example 3.1.4, lines 2677–2680 | disc exit time and odd extension; strictly convex Euclidean domains; Euclidean subdomains non-trapping; as cited |
| 6.2 | book lines 2449–2473 | `r̈(0) > 0` is "strictly convex", viewed from the outer radius (lines 2454–2458); the README's reading for the exterior is the correct one |
| 6.4 | book Example 3.1.4, lines 2677–2678 | small spherical caps: the instance, as the README says; the general statement rests on lee-riemannian2018 Ch. 6 (uncertified) and the route |
| 6.5 | article lines 66–72; book Lemma 2.5.2, Corollary 2.5.3, lines 2462–2481 | `(r/c)′ > 0`, equivalent to strict convexity of the spheres; (a) ⇔ (c); `r/c = r e^{φ(r²)} = b` |

Also read: book lines 2640–2700, 2725–2870, 2886–2900, 2926–3127; uhlmann-vasy2016 lines 23–33,
47–52, 132–141, 497–524; article lines 18–24, 50–56, 62–74, 86–102, 126–136, 148–163, 196–206,
218–222. Every locator of 1.1, 2.1, 2.2, 3.1, 3.2, 4.2, 4.4, 4.5, 5.1, 5.2, 5.4 and 6.3 falls in
these ranges and supports its statement. No author-flagged unverified locator exists.

**Adversarial table** (values computed this round; the sampled targets, the headlines and the
targets the findings and repairs touch).

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 1.2 chart formula, sign test | `g = [[1, a], [a, 1]]`, `a = 1/2`; `[0, 1]` | `grad x⁰ ∝ e₀ − a e₁`, `g(e₀ − a e₁, e₁) = 0`, norm² `3/4`, `ν_in = (2/√3, −1/√3)`; `ν_out(0) = −∂_x`, `ν_out(1) = +∂_x` | holds | none |
| 1.3 existence, comparison | `Σ φ_i x⁰_i + φ₀`; ball, `ρ′ = (2 + x₁)ρ`; `(1 − ǀxǀ²)²`; `x(1 − x)` | at `q ∈ ∂M`: every `x⁰_i(q) = 0`, `dφ₀(q) = 0`, differential `Σ φ_i dx⁰_i` positive on inward vectors; `u ∈ [1, 3]`; `dρ″ = 0` on the sphere; derivatives `1`, `−1` | holds | none |
| 1.6 conformal law | `φ = log 2`; `φ = −ǀxǀ²` on the disc; `φ = (ǀxǀ² − 1)²`; `c² g` | `2h` and `4h/2`; `dφ(ν_in) = 2`, `e⁻¹(1 − 2)h`, `Ĥ = e(1 − 2) = −e`; `II`; `Ŝ = e^{−φ}(S − dφ(ν_in))` from `e^{2φ} h(Ŝu, w) = II^ĝ` | holds | none |
| 2.2 Hessian iff (headline) | ball with `ρ`, `(2 + x₁)ρ`; `−ρ` | on `T∂M`: `−2h`, `−2(2 + x₁)h`, both negative; `+2h` and negative inside | holds | none |
| 2.3 | epigraph of `√(1 + x²)`; ball, `n = 0`; `e^{−2sǀxǀ²} g` | `y″/(1 + y′²)^{3/2} = (1 + x²)^{−3/2} · ((1 + x²)/(1 + 2x²))^{3/2} = (1 + 2x²)^{−3/2}`, infimum `0`; `0 = c · 0`; `e^{−s}(1 − 2s)`, zero at `1/2` | holds | none |
| 3.3 `ρ̃ = φ₀ χ(t) + φ₁ s` | `t > 0`; `t = 0`; compact `∂M`, `ǀtǀ ≤ 1/2`; `[0, 1]` | both terms `≥ 0`, sum `> 0`; `φ₁ = 0` near `∂M`, `ρ̃ = t`; `φ₀ = 1`, `ρ̃ = χ(t) = t`; `M̃ = (−1/2, 3/2)`, `ρ̃ = 2x` near `0` | regular value `0` | none |
| 3.4 | `√x`; `(x + 1/100) dx²`; empty boundary | not `C¹` at `0`; positive only for `x > −1/100`; no Seeley step | holds | none |
| 3.5 realisation (headline) | disc; closed `M`; `[0, ∞)`; compact `M` with a closed component; doubled point | `ℝ²` or `S²`, `II = h` on the disc itself; `ρ̃ ≡ 1`; `M̃ ≅ (−1, ∞)`; the double carries the component twice, first copy `{ρ_D ≥ 0}`; not Hausdorff, no realisation | holds | none |
| 4.2 second-order contact (headline) | ball; exterior; `{y ≥ x⁴}`; `n = 0` | `ρ(q + tv) = −t²`, `−ǀdρǀ II = −2`; `+t²`; `−t⁴` with `II = 0`; no nonzero tangent vector, both sides vacuous | holds | none |
| 4.3 tube, `ρ̂` | sphere, `f = 1 − ǀxǀ²`; `ρ̂ = ψ r + (1 − ψ)s`; bad cutoff | `E = (1 − r)q`, `r_Σ = 1 − ǀxǀ`; on `W₁`: `r`; on `W ∩ M ∖ W₁`: between `r ≥ ε₁ > 0` and `1`; off `M ∪ W`: `−1 < −ε`; on `W ∖ M` with `ρ̂ ≥ −ε > −1`: `r ≥ −ε`; `ǀxǀ² − ǀxǀ³`, third derivative jumps by `12` | holds | none |
| Scope / 4.4 Check (repaired) | disc `R = 2`, `r = 1/2`; cap `φ₀ = π/3, π/2, 2π/3`; outward normal | `a = 3/4`, `h_r = 9/16 ds²`, `−½ ∂_r(1 − r/2)²ǀ₀ = 1/2 = k_g`; `−a_t(s,0) = cot φ₀ = 0.577, 0, −0.577`, equal to 6.3's `cot R` and to Surfaces' `k_g`; `a = 1 + r/R`, `−1/R` | holds; agrees with Surfaces 1.2 | none |
| 4.5 convexity function (headline) | disc at `(0, −1)`; exterior; `c = 0`; `[0, 1]` | `Hess x̃ = (2 − 2ε)g`, `dx̃_q = (0, −2) = −dρ_q`, `K_c ⊆ {εǀz − qǀ² ≤ c}`; `−(2 + 2ε)g`; `K₀ = {q}`; `K_c = {x + εx² ≤ c}` | holds | none |
| 4.6 | ball; cap in `S^{n+1}`; arc of `S¹`; `(1 − ǀxǀ²)e^{−ǀxǀ²}` | radius `1 + ε`, `II = h/(1 + ε)`; convex iff `R + ε < π/2`; tube needs `ε ≤ min(R, π − R)`; radial derivative `−2r(2 − r²)e^{−r²}`: `−2/e` at `1`, zero at `√2`, minimum `−e⁻²` | holds | none |
| 5.3 fold form, even functions | `y − t²`; `y − t⁴`; `cos r`; `ǀrǀ` | `Q = r`, `a = y`, `∂_r Q = 1 > 0`; roots `±y^{1/4}`, no such form; `H(s) = Σ (−s)^k/(2k)!`; not smooth | holds | none |
| 5.4 fold route (repaired) and regularity (headline) | unit ball, `b = ⟨x, v⟩`, `c = 1 − ǀxǀ²`; glancing `y`; inner circle of an annulus | `h = c − 2bt − t²`, `∂_t² h = −2 = −ǀdρǀ II`; `h(0, y) = c ≥ 0`, roots `−b ± √(b² + c)`, larger `= τ(x, v)`, smaller `= −τ(x, −v)`; `a = 4(b² + c)`, `Q(±√a) = (−2b ± √a)/2`, `∂_r Q = 1/2`; `a = 0`, `τ = 0 = Q(0)`; `∂_t² h = +2`, the route does not apply and `τ` jumps (5.2) | holds | none |
| 5.4 `σ`, `T`, `μ/τ̃`, `Xσ` | ball; disc at `(0, −1)`; `[a, b]` | `σ = −2b`, `T = c`, `(σ + √(σ² + 4T))/2 = −b + √(b² + c)`; `sin θ/(2 sin θ) = 1/2 = II/2`; `a + b − 2x`, derivative `−2` | holds | none |
| 5.5 criteria (headline) | ball, `f = ⟨x, v⟩`; closed `M ≠ ∅`; `M = ∅`; half-circle; `u = −∫₀^{τ_ε} h ∘ φ_t` | `(1 − (−1))/1 = 2`; (F, F, F); (T, T, T); `τ(θ, ±1) = π/2 ∓ θ`; `u(φ_s z) = −∫_s^{τ_ε(z)} h(φ_t z) dt`, derivative `+h(z)` | holds | none |
| 5.6 scattering (headline) | ball; disc; `[a, b]` | `⟨x − 2bv, v⟩ = −b`, so `α² = id`, fixed points `b = 0`; `μ = √(1 − ǀwǀ²)`, `ℓ = 2μ`, `ǀLǀ = ǀwǀ`; `α(a, +1) = (b, +1)`, no fixed point, `B∂M` two points | holds | none |
| 6.1 | root; speed `1/4`; ellipse vertex; graph form | `t² + 2bt + ǀx − cǀ² − R² = 0`; `(0 + 1/4)/(1/16) = 4 ≤ 2/(1/4)`; `(2/b²)/(2/a) = a/b²`; `ρ = x₀ − w`, `II = D²w(0)` | holds | none |
| 6.2 | unit circle, `q = (1, 0)`, `v = (0, 1)` | `ǀq + tvǀ² = 1 + t²`, `r̈(0) = 1`; exterior `ρ = t²`, `II = −h`; ball `ρ = −t²`, `II = h` | holds | none |
| 6.3 | cap; hyperbolic plane; `R = 1` | `−Hess ρ/ǀdρǀ = cos R/sin R`; `u_x = x/y`, `u_y = ½ − (x² + 1)/(2y²)`, `Hess_xx = 1/(2y) + (x² + 1)/(2y³) = u/y²`; `coth 1 = 1.3130`, `cot 1 = 0.6421` | holds | none |
| 6.4 | flat torus, `R = 1/4`; `S¹` | `II = 2h/(2 · 1/4) = 4h`, `τ ≤ 1/2`; `d² = θ²` on `B(p, π)` | holds | none |
| 6.5 | general `φ`; `φ = s² − 2s`; `φ = −s t` | `b′ = e^φ(1 + 2r²φ′)`, `II = e^φ(1/r + 2rφ′)h = (b′/r)h`; `1 + 2r²(2r² − 2) = (2r² − 1)²`, zero at `1/√2`, `b′(1) = e⁻¹`; `d/dr b_s′ = −2sr e^{−sr²}(3 − 2sr²) ≤ 0` for `0 ≤ s < 1/2` | holds | none |
| R01 | `N` an uncountable disjoint union of planes, `M` a unit disc | README Layer 5 excludes `N`; plan 5.5.2 admits it and cites 3.4.1, which does not | plan and README differ | R01 |

Sections outside the sample and not changed since round 9 (1.1, 1.4, 1.5, 2.1, 3.1, 3.2, 3.6,
4.1, 5.1, 5.2) were re-read; round 9's rows for them carry computed values and were spot-checked
(`{y ≥ x³}`: `6x/(1 + 9x⁴)^{3/2}`; the half-space cut by `(2 + x₁)(1 − ǀxǀ²)`: value `8` at
`x₁ = −3`; the annulus: `3/2 + √3` against `3/2 − √(2δ − δ²)`), with the same results.

**Duplication and ownership.** Roadmap search this round (open heads, then main), README text,
for: scattering relation, exit time, non-trapping, boundary defining function, strictly convex
boundary, boundary normal coordinates, lens data and rigidity, X-ray transform, second fundamental
form of the boundary, mean-convex, signed distance. No roadmap, open or on main, states the
first, third to eighth or tenth. "Exit time" on main is the stochastic one (StochasticCalculus,
DysonBrownianMotion) and a flow-box one (SymplecticGeometry/IntegrableSystems). "Signed distance":
RiemannianGeometry R7.9 (cited) and GeometricCurrents (a barrier). "Second fundamental form of the
boundary": MinimalSurfaces, a consumer of R5a. MathematicalBilliards (open, new) owns planar
strictly convex tables as curves in `ℂ` with their chords and ball map: another carrier, and no
object of this roadmap. The board's package index lists AnalyticNumberTheory and
LawrenceVenkateshMethod only. Ownership against the open pull requests was checked through the
roadmap tools at their heads.

Overlap check: read ManifoldOptimization, LorentzianGeometry, SmoothBundlesConnections, TeichmullerGeometry, RealSemisimpleLieGroups (open), RiemannianGeometry, Surfaces, HopfRinow (main); the sublevel inclusion, outward criterion, normal collar and defining function of a compact separating hypersurface: owner RiemannianGeometry R7.9, cited; the compact case of the realisation: owner RiemannianGeometry R5c, cited; the normal strip of an arc in a surface: owner Surfaces 1.2–1.3, named in the Scope; uniform normal radii: owner SmoothBundlesConnections B6.0, cited; nothing else shared. The third list (results and headings) is empty.

**Shape.** Layers are named by their mathematics. The order is forced by the dependency lines:
Layer 2 needs 1.4–1.6; Layer 3 needs Layer 1; Layer 4 needs 3.1 and 3.5; Layer 5 needs 4.1–4.3 and
4.6; Layer 6 needs all. The README does not say it follows a source.

**Headline theorems and padding.** Seven end theorems in the Summary: 2.2, 3.5, 4.2, 4.5, 5.4, 5.5,
5.6. There is no `Suggested.lean` at the design stage, so the one-tactic probe, the binder audit
and the import check have nothing to inspect; the README attributes no backticked name to this
roadmap. Elaboration: not available (this lane does not elaborate). No Lean command was run.

**Copyright and arrangement.** Twenty-one passages were set beside the sources: the fifteen
sampled sections and 2.1 (Definition 3.1.7), 4.2 (Lemma 3.1.13), 4.5 (the article's Section 3),
5.2 (Definitions 3.1.1, 3.1.3), 5.4's fold route (lines 2967–2969) and 5.1's Check on the
article's labels. What is shared is formulas, standard names and lemma statements whose hypotheses
can be written one way; no run of consecutive source words beyond a formula. Contents of
paternain-salo-uhlmann2023 against the layers: §3.1 is spread over 1.1, 1.4, 2.1, 3.5, 4.1, 4.2,
4.3, 5.1, 5.2; §3.2 ↔ 5.3–5.4; §3.3 ↔ 5.1, 5.5, 5.6; §2.5 ↔ 1.6, 6.2, 6.5. The order inside
Layer 5 is forced (5.2 needs 5.1; 5.4 needs 5.1–5.3; 5.5 and 5.6 need 5.4). Layers 1–4 and 6 map
onto no run of sections. No table, figure or exercise list is reused.

Source independence: 21 passages compared with 3 sources, none shared; largest share paternain-salo-uhlmann2023, 38 of 66 named source mentions in the sections; contents compared with paternain-salo-uhlmann2023: independent.

## Not verifiable

- lee-riemannian2018 (Ch. 5–8), lee-smooth2012 (Theorem 9.25), sharafutdinov1994 (Ch. 4): settled
  as uncertified; not read. 1.5, 3.6, 4.4 and the general statement of 6.4 have no certified
  locator besides them; their signs and normalisations are fixed by the computed values above.
- The arXiv texts were read at the recorded versions (uhlmann-vasy2016 v1,
  stefanov-uhlmann-vasy2021 v3), not against the journal typesetting.
- No elaboration: there is no Lean file and this lane does not elaborate.
- The citation resolver did not check Lean names outside the roadmaps on this host; the pinned
  names were checked by hand as listed, not all 80.
- The draft revisions of DifferentialGeometry and of GeometricTopology with neighbouring roadmaps
  were not read beyond the overlap report, which lists nothing for them.

## Source issues

- **Misprint** in paternain-salo-uhlmann2023 at Corollary 2.5.3(b), printed p. 47: the source says the derivative of `b` is positive at radius 1; it should be at the outer radius `r₁`; affects a stated result.
- **Misprint** in paternain-salo-uhlmann2023 at Lemma 3.2.11, printed p. 64: the source says the second factor of `T` is the exit time at the point "x minus v"; it should be the exit time of the reversed vector `(x, −v)`; affects a stated result.

## For the human reviewers

- **Licence.** paternain-salo-uhlmann2023 was read from an author's page copy carrying the publisher's personal-use notice (`packages/RiemannianManifoldsWithConvexBoundary/sources.toml`, `licence_class = "author-page"`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "75730c40f85719271ebdc526e084a560a654f804", "job": "REV-DESIGN-RiemannianManifoldsWithConvexBoundary~10", "model": "fable", "worker": "chris-x82"} -->
