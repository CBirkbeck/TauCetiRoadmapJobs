<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13810#issuecomment-6899577748 -->
Review (claude) of 71fd170

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P3) 6.1 states the signed distance of 4.3 without listing 4.3

   **Location.** `packages/RiemannianManifoldsWithConvexBoundary/design/README.md`, 6.1: "the signed
   distance to the sphere is `R − |x − c|`", with "*Needs:* 1.4, 1.5, 2.1, 3.1, 3.2, 5.2, 5.4, 5.5,
   5.6."; `design/plan.json`, target 6.1.1, `prerequisites`.

   **Claim.** The `*Needs:*` line lists what the statement and its route need, item by item.

   **Witness.** The signed distance `r_Σ` is defined in 4.3 (plan 4.3.1). Transitive closure of
   6.1.1's prerequisites in the plan: 4.1, 5.1, 5.2 reachable; 4.3.1, 4.3.2, 4.3.3 not reachable.

   **Exact repair.** README 6.1: "*Needs:* 1.4, 1.5, 2.1, 3.1, 3.2, 4.3, 5.2, 5.4, 5.5, 5.6." Plan
   6.1.1: add `target:4.3.1` and `target:4.3.2` to `prerequisites` (4.3.1 defines `r_Σ`, 4.3.2 gives
   the tube on which it is defined). Nothing else changes.

   **Repair test.** With the two prerequisites added, the closure of 6.1.1 contains 4.3.1 and 4.3.2,
   both earlier in the plan's order; the value agrees with 4.3's first Check (`r_Σ = 1 − |x|` for
   `R = 1`, `c = 0`).

2. **F02** (P3) the letter `ε` is the tube radius and the enlargement parameter in one sentence

   **Location.** `design/README.md`, 4.6: "with constant tube radii `ε₁ < ε` there, there is `ε₀` with
   `0 < ε₀ < min(ε₁, 1)` such that for `0 < ε ≤ ε₀`: `M_ε := {ρ̂ ≥ −ε}`"; its first Check; 4.3: "for
   `0 < ε < 1` every point of `{ρ̂ ≥ −ε} ∖ M`"; plan 4.6 and 4.3.3 statements.

   **Claim.** Each symbol denotes one quantity.

   **Witness.** 4.6's first Check: "tube radius `ε = 1/2` and `ε₁ = 1/4` … for `ε < 1/4`, `M_ε` is the
   ball of radius `1 + ε`". Read with the first `ε`, `M_ε` is the ball of radius `3/2`, outside the
   range `ε < 1/4` of the same sentence.

   **Exact repair.** Keep `ε` for the tube radius of 4.3. In 4.3 write "for `0 < δ < 1` every point of
   `{ρ̂ ≥ −δ} ∖ M` lies in `W` with `r_{∂M} ≥ −δ`". In 4.6, its route and its Checks, in 5.5's route
   (`SM_ε`, `M_ε`, `τ_ε`) and in plan 4.3.3, 4.6 and 5.5.2, write the enlargement parameter as `δ`:
   "there is `δ₀` with `0 < δ₀ < min(ε₁, 1)` such that for `0 < δ ≤ δ₀`: `M_δ := {ρ̂ ≥ −δ}` equals
   `M ∪ E_{∂M}(∂M × [−δ, 0))` …".

   **Repair test.** The Check then reads: tube radius `ε = 1/2`, `ε₁ = 1/4`; for `δ < 1/4`, `M_δ` is
   the ball of radius `1 + δ ≤ 5/4`, with `II = h/(1 + δ)`: one value for each symbol.

Two findings, both P3 (no P1, no P2): a missing `*Needs:*` item in 6.1 and a letter used for two
quantities in 4.3 and 4.6. Neither changes a statement, but each has a repair, so the verdict asks for changes. Both
round-10 findings are repaired. No false, vacuous or unowned statement was found; every Check and
formula recomputed this round agrees with its statement. No gap is declared. This review changed no design file, plan or manifest entry.

## Previous findings and repairs

| Round-10 finding | Repaired passage | Assessment |
|---|---|---|
| F01, priority P3: the plan drops Layer 5's second countability from ten targets | `design/plan.json`, `hypotheses` of 5.2, 5.4.1–5.4.5, 5.5.1, 5.5.2, 5.6.1, 5.6.2: each now lists "N second countable" after the regular-domain line | **Repaired.** Script over the plan: 11 of the 13 Layer-5 targets carry the string; the two without it are 5.3.1 and 5.3.2, calculus lemmas on `ℝ × ℝ^K` with no `N`. The diff of the plan against the previous head is the ten inserted strings only. |
| F02, priority P3: three cited sections missing from the manifest | `sources.toml`: `stefanov-uhlmann-vasy2021` gains "1.4 strict convexity as a positive second fundamental form (line 53)" and "3.1, 3.5 … (lines 96-97)"; `paternain-salo-uhlmann2023` has "3.3, 3.4, 3.5 closed extension, extension of the metric and double", "1.3, 4.3 normalised boundary defining function" and a new 3.1 item | **Repaired.** My own script (README split at `###`, each work found by its author string, compared with the leading section numbers of every `cited_for` item): for all six entries, no section cited and not listed, none listed and not cited. |

Adversarial pass on what the repairs changed: the added hypothesis excludes no intended instance
(rows "5.x with second countability" below); the manifest edit adds labels only (`url`, `sha256`,
`status` unchanged in the diff). The repaired patterns were sought in the rest of the design: a plan
hypothesis list narrower than its README layer (Layers 3, 4 and 6 compared: none); a README
`*Needs:*` line or plan prerequisite list that omits an item the statement uses (one: R01).
Maintainer notes: none were supplied.

## Verified sound

**Coverage.** All 1,655 lines of the README were read in full this round; the plan (6 layers, 49
targets: 30 theorems, 10 definitions, 2 constructions, 7 examples; 6 suppliers; `gaps: []`); the six
manifest entries. By script: every `target:` prerequisite resolves and precedes its user; every
definition and construction has at least three tests; every target has a locator; 31 `**Checks.**`
blocks; each of the six layers ends with Examples and Dependencies. Searched and found none: LaTeX
delimiters, pull-request numbers, machine paths, HTML anchors, `set_option`, the words "optional",
"deferred", "removed", "current", "so far", "checkpoint", "handoff".

**Dependency check, exact output:**

```text
candidate: RiemannianManifoldsWithConvexBoundary is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2242 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. No supplier is on the never-cite list. No gap is declared and
none is needed: every cited section and declaration exists where it is cited.

**Supplier citations resolved** on main (1a19c9f), by heading and statement, this round:

- DifferentialGeometry: Layer 5 (line 1644) with "5.1 The boundary interface" (1648:
  `TauCeti.IsOutwardPointing`, `TauCeti.exists_isOutwardPointingField`); Layer 12 (2796) with 12.1
  (2801), 12.2 (2848), 12.3 (2871), 12.5 (2936; `exists_halfSpaceOutwardUnitNormal` at 2949–2951,
  "norm one, orthogonal …, these three laws determine N at each point"; declared in its
  `Suggested.lean`, line 1020).
- HopfRinow (`Completed/HopfRinow/README.md`): Layer 1 (264), Layer 2 (427).
- RiemannianGeometry: 2.2 (R1.4) (1576); R5a (3205; averaged vector and position-vector sign at
  190–192); R5c (3715; "relatively compact smooth domain" at 3718, 3751); R7.9 (4469: second
  countable, normal collar, "at most two connected components", `φ = h∘t` on `U` and `±1` off it
  with `grad φ = ν`, the inclusion of `{φ ≤ a}` smooth with invertible differential and outward
  exactly when `dφ(dι v) > 0`).
- RiemannianGeometry/Surfaces: 1.2 Normal strips (296), 1.3 Distance to an arc (340).
- GeometricTopology: Layer 1 (783), 1.1 Smooth collars (788), 1.3 Gluing along the boundary (851).
- ComplexKahlerGeometry: K5a (5.1 at 1440; the half-space Seeley step at 1795–1796). Its two open
  revisions keep the K5a headings and the Seeley sentence.
- SmoothBundlesConnections: B6.0 (1306; "positive uniform normal … radius bounds on each compact
  set … with `IsNormalDomain` on every tangent ball of that normal radius", 1327–1328).
- Consumers: PositiveMass 5.1 (921), 5.2 (957); AffineMorseLefschetz 4.5 (819);
  PositiveScalarCurvature and Yamabe are folders on main.

The overlap report lists no dropped id, no revision-only id, no other pull request changing this
roadmap and no second copy (no folder of this name on main). The citation resolver, re-run, reports
no cross-roadmap citation and no Lean name found nowhere.

**Pinned declarations.** The plan's baseline (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`) equals the
pins of `lake-manifest.json`. All 71 library names the README cites were located at the pins by
declaration (script over both libraries, then the namespaces of the ambiguous last components
opened by hand):

- Mathlib: `CovariantDerivative.leviCivitaConnection`,
  `.isLeviCivitaConnection_leviCivitaConnection`, `.IsLeviCivitaConnection.uniqueness`
  (`Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean:360, 409, 256`,
  namespace at 195); `ContDiffAt.implicitFunction`, `ContDiffAt.contDiffAt_implicitFunction`
  (`Mathlib/Analysis/Calculus/ImplicitContDiff.lean:55, 91`, namespace `ContDiffAt` 50–101);
  `ModelWithCorners.interior`, `.boundary`, `.isClosed_boundary`
  (`Mathlib/Geometry/Manifold/IsManifold/InteriorBoundary.lean:103, 112, 330`);
  `EuclideanHalfSpace`, `modelWithCornersEuclideanHalfSpace`
  (`Mathlib/Geometry/Manifold/Instances/Real.lean:60, 200`); `SmoothPartitionOfUnity`,
  `exists_contMDiffSection_forall_mem_convex_of_local`,
  `exists_contMDiff_zero_iff_one_iff_of_isClosed`
  (`Mathlib/Geometry/Manifold/PartitionOfUnity.lean:123, 593, 797`); `Bundle.RiemannianBundle`
  (`Mathlib/Topology/VectorBundle/Riemannian.lean:420`); `IsContMDiffRiemannianBundle`,
  `Bundle.ContMDiffRiemannianMetric` (`Mathlib/Geometry/Manifold/VectorBundle/Riemannian.lean:68,
  245`); `IsRiemannianManifold` (`Mathlib/Geometry/Manifold/Riemannian/Basic.lean:80`);
  `Manifold.pathELength`, `Manifold.riemannianEDist`
  (`Mathlib/Geometry/Manifold/Riemannian/PathELength.lean:66, 208`).
- Tau Ceti: `Bundle.ContMDiffRiemannianMetric.hessian_rescale`
  (`TauCeti/Geometry/Manifold/Riemannian/Hessian/Conformal.lean:81`, namespace at 43; its docstring
  formula is `Hess_ĝ u = Hess_g u − (2f)⁻¹(df ⊗ du + du ⊗ df − ⟨grad f, grad u⟩ g)`, which for
  `f = e^{2φ}` on `ker du` is `+⟨grad φ, grad u⟩ g`, the term of 1.6's route); `.rescale`
  (`…/VectorBundle/Riemannian/Conformal.lean:87`); `.pullback`
  (`…/Riemannian/Pullback/Basic.lean:158`, namespace at 139);
  `.leviCivitaConnection_rescale_apply` (`…/LeviCivita/Conformal.lean:260`);
  `.restrictBoundaryTangentSpace` (`…/Riemannian/Boundary.lean:115`);
  `TauCeti.Manifold.hessian`, `.hessian_apply_eq_mvfderiv_sub`, `.hessian_symm`
  (`…/Riemannian/Laplacian.lean:135, 158, 197`); `TauCeti.Manifold.mgradient`, `.inner_mgradient`
  (`…/Riemannian/Gradient/Basic.lean:73, 85`); `TauCeti.IsOutwardPointing`,
  `.isOutwardPointing_iff_tangentCoordChange` (`…/Boundary/Orientation.lean:46, 63`);
  `TauCeti.tangentCoordChange_normal_pos` (`…/Boundary/TransitionNormal.lean:36`);
  `TauCeti.exists_isOutwardPointingField` (`…/Boundary/OutwardExistence.lean:75`);
  `TauCeti.isManifold_boundary`, `.isSmoothEmbedding_subtypeVal_boundary`,
  `.ModelWithCorners.mem_boundary_euclideanHalfSpace_iff_of_mem_atlas`
  (`…/Boundary/Charts.lean:321, 374, 107`); `TauCeti.mfderiv_subtypeVal_boundary`
  (`…/Boundary/Derivative.lean:64`); `TauCeti.IsRegularValue` (`…/RegularValue.lean:92`); the
  sublevel declarations (`…/RegularValue/Scalar/Sublevel.lean:473, 639, 652, 675`); the level
  declarations (`…/RegularValue/Level.lean:234, 435, 485`); the geodesic declarations
  (`…/Geodesic/Basic.lean:102, 134`, `Maximal.lean:107`, `Trajectory.lean:76`,
  `Exponential.lean:98, 104`, `Flow.lean:65, 117`, `Compact.lean:75` with `[T2Space M]
  [CompactSpace M]` at 71); the normal-coordinate declarations (`…/Geodesic/Normal/Basic.lean:89`,
  `Coordinates.lean:84, 270, 292`); the tube declarations
  (`…/TubularNeighborhood/Riemannian/Basic.lean:113`, `Coordinates.lean:89`, `Noncompact.lean:58`
  with `[T2Space N] [SecondCountableTopology N]` and boundaryless models at 50, as the README
  says); the sphere bundle (`…/VectorBundle/Riemannian/Sphere.lean:143, 161, 181`);
  `TauCeti.sphereRoundMetric` (`…/Riemannian/Sphere/Basic.lean:61`); `TauCeti.UpperHalfSpace`
  (`…/Hyperbolic/UpperHalfSpace/Basic.lean:91`), `.hyperbolicMetric` (`Metric.lean:41`),
  `.hasConstantSectionalCurvature` (`Curvature.lean:139`);
  `TauCeti.Manifold.ContMDiffNondegenerateMetricFamily` (`…/NondegenerateMetric/Family.lean:73`),
  `.contMDiffAt_christoffelSymbol` (`…/LeviCivita/Nondegenerate/Family.lean:116`);
  `CovariantDerivative.IsLeviCivitaConnection.inner_apply_eq_inner_mvfderiv`
  (`…/LeviCivita/Immersion.lean:65`); `TauCeti.nonempty_contMDiffRiemannianMetric`
  (`…/VectorBundle/Riemannian/Existence.lean:69`); the Hadamard and parametric-integral lemmas
  (`TauCeti/Analysis/Calculus/Hadamard.lean:115, 131`, `ParametricIntegral.lean:211`).

No name is missing at the pins.

**Seeded source sample** (read in the cached texts this round; "book" is
paternain-salo-uhlmann2023).

| Target | Locator read | Result |
|---|---|---|
| 1.3 | uhlmann-vasy2016 lines 25–26, 134–136; book lines 2766–2773 | positive inside, negative outside, non-degenerate zero on the boundary; the three conditions of line 135; Lemma 3.1.10 is the normalised function; as cited |
| 1.4 | book lines 2728–2737, 2781–2784; stefanov-uhlmann-vasy2021 line 53 | `Π = −⟨∇_v ν, w⟩`, `ν` inward (line 2688), independent of the extension; `−Π = Hess ρ` on glancing vectors; strict convexity as a positive form; as cited |
| 1.5 | lee-riemannian2018 Ch. 8 | not read (uncertified); the averaged convention is checked against RiemannianGeometry lines 190–192 and the values below |
| 2.2 | book Lemma 3.1.12, lines 2838–2841; uhlmann-vasy2016 lines 499–503 | strict convexity ⇔ `∂_t² h < 0` on glancing vectors; the covector form; as cited |
| 4.2 | book lines 2801–2828, 2795–2798, 2841–2844 | the three derivatives of `ρ ∘ γ`; tangent geodesics stay outside for small `t ≠ 0`; maximal geodesics stay in the interior; Taylor form with `|dρ| = 1`; as cited |
| 4.3 | stefanov-uhlmann-vasy2021 lines 99–100, 220–221; book Lemma 3.1.10 | signed distance from a hypersurface, defined near it; boundary normal coordinates; `ρ = d(·, ∂M)` near `∂M` in `M`, sign sets, `∇ρ = ν`; as cited |
| 4.4 | stefanov-uhlmann-vasy2021 lines 20–22, 220–221 | normal coordinates relative to a hypersurface; the jets in boundary normal coordinates; the statement `dr² + h_r` itself rests on lee-riemannian2018 (uncertified) and the values below |
| 4.5 | uhlmann-vasy2016 lines 30–32, 504–524; stefanov-uhlmann-vasy2021 lines 128–134 | `x̃(p) = 0`, `dx̃(p) = −dρ(p)`; `U₀`, `C₀`, `δ` (505–506); `x̃ = −ρ − ε|z − p|²` (512); compactness for `0 ≤ c ≤ c₀` (522–524); as cited |
| 4.6 | book lines 3093–3096 | a slightly larger compact `M₁`, strictly convex and non-trapping; as cited |
| 5.1 | book lines 2646–2648, 2682–2696, 2931, 3063–3079; article lines 151–153 | `SM`, `∂±SM` with the inward normal, `∂₀SM`, `μ`, the flow and `X`; the article's `∂₊` points outside and its `L` goes from `∂₋` to `∂₊`; as cited |
| 5.2 | book lines 2659–2661, 2674–2676, 2666, 2849–2861 | Definitions 3.1.1 and 3.1.3; Exercise 3.1.2(b); Example 3.2.1; as cited |
| 5.3 | book lines 2970–2982, 2985–3026, 3044–3045, 3039–3041 | hypotheses and conclusion as restated; `a = h(g(y), y)`, `Q = g + S` with `∂_r S(0, y₀) > 0` (3021); the exercise has no parameters, line 3039 uses them; as cited |
| 5.6 | book lines 3114–3127; article lines 150–163 | Definition 3.3.4, Lemma 3.3.5, Exercise 3.3.6; `L`, `ℓ` on `B∂M`; as cited |
| 6.1 | book lines 2849–2864, 307–310, 2677–2680 | the disc's exit time and odd extension; strictly convex Euclidean domains; Euclidean subdomains non-trapping; as cited |
| 6.3 | book lines 2499–2521, 2677–2680 | small and large caps of `S²`, the equator trapped in the large one; hyperbolic subdomains non-trapping; as cited |

No author-flagged unverified locator exists. Also read: book lines 2443–2481 (2.1, 6.2, 6.5), 2749–2762
(3.3–3.5), 2865–2869, 2926–2966, 3027–3055 (5.4), 3081–3113 (5.5); article lines 66–72 (6.5), 89–97
(2.1, 3.1), 198–205 (3.2); uhlmann-vasy2016 lines 47–52 (2.3), 137–140 (3.2). Each supports its
statement.

**Adversarial table** (values computed this round: the sampled targets, the headlines, and the
targets the findings and repairs touch).

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 1.3 defining functions | ball `ρ = 1 − ǀxǀ²`; `(2 + x₁)ρ`; `ρ²`; `[0, 1]`, `x(1 − x)` | `ǀdρǀ = 2`, `grad ρ = −2x = 2ν_in`; ratio `2 + x₁ ∈ [1, 3]`; `d(ρ²) = 2ρ dρ = 0` on the sphere; derivative `1 − 2x = 1, −1` at the ends | holds | none |
| 1.4 `II` and its three forms | ball radius `R`; exterior; half-space; inward normal in form 1 | `−(−2g)/(2R) = h/R`; `−(2g)/2 = −h`; `0`; `⟨∇_X(−x), Y⟩ = −h` | holds; the wrong convention is excluded | none |
| 1.5 `S`, `H` | unit sphere; solid cylinder; exterior; `n = 0` | `S = id`, `H = n/n = 1`; eigenvalues `1, 0`, `H = 1/2`; `−1`, `H = −1`; no average over zero directions | holds | none |
| 1.6 conformal law | derivation; disc with `φ = −ǀxǀ²`; `φ = log 2` | `ĝ(∇̂_X Y, ν̂_in) = e^{φ}⟨∇_X Y − ⟨X, Y⟩ grad φ, ν_in⟩ = e^{φ}(II − dφ(ν_in) h)`; `dφ(−x) = 2`, `e^{−1}(1 − 2) h`, `Ĥ = e(1 − 2) = −e`; `2h` | holds | none |
| 2.2 Hessian iff (headline) | ball with `ρ` and `(2 + x₁)ρ`; `−ρ` | on `T∂M`: `−2h` and `−2(2 + x₁)h`, both negative; `+2h` with a function negative inside | holds in both directions | none |
| 2.3 uniform bound | epigraph of `√(1 + x²)`; `e^{−2sǀxǀ²} g` on the disc | curvature `(1 + 2x²)^{−3/2} → 0`; `e^{−s}(1 − 2s)`: positive iff `s < 1/2` | compactness needed; openness in `s` | none |
| 3.1 regular domains | `(2 + x₁)(1 − ǀxǀ²)` at `x₁ = −3`; `x₀² − x₁²`; ball, outward test | `(−1)(−8) = 8 ≥ 0`: a second piece `{x₁ ≤ −2}`, `dρ′ = (1 − ǀxǀ²) dx₁ ≠ 0` there; critical at `0`; `dφ(v) = 2⟨x, v⟩ > 0` for `v = x` | holds | none |
| 3.3 `ρ̃ = φ₀ χ(t) + φ₁ s` | `t > 0`; `t < 0`; near `∂M`; `[0, 1]`, collar `t/2` | both terms `≥ 0`, sum `> 0`; both `≤ 0`, sum `< 0`; `φ₁ = 0`, `ρ̃ = t`; `M̃ = (−1/2, 3/2)`, `ρ̃ = 2x` for `ǀxǀ < 1/4` | regular value `0`, `M = {ρ̃ ≥ 0}` | none |
| 3.5 realisation (headline) | disc; closed `M`; `[0, ∞)`; compact `M` with a closed component; doubled point | `ℝ²` or `S²`; `ρ̃ ≡ 1`; `(−1, ∞)`; double carries the component twice with `ρ_D = ±1`, so `{ρ_D ≥ 0}` is the first copy; not Hausdorff, no realisation | holds | none |
| 3.6 Gauss equation | unit sphere; cylinder | `K = 0 + 1·1 − 0 = 1`; `0 + 1·0 − 0 = 0` | sign agrees with R5a's | none |
| 4.2 second-order contact (headline) | ball; exterior; `{y ≥ x⁴}`; `n = 0` | `ρ(q + tv) = −t²`, `−ǀdρǀ II = −2`; `+t²`; `−t⁴` with `II = 0`; no nonzero tangent vector | iff holds; leaving does not give strict convexity | none |
| 4.3 tube and `ρ̂` | sphere, `f = 1 − ǀxǀ²`; `ρ̂ = ψ r + (1 − ψ)s` on each region; `0 < δ < 1` | `E = (1 − r)q`, `r_Σ = 1 − ǀxǀ`; `W₁`: `r`; `(W ∩ M) ∖ W₁`: between `r ≥ ε₁` and `1`; `(W ∖ M) ∖ W₁`: between `r ≤ −ε₁` and `−1`; off `M ∪ W`: `−1`; `ρ̂ ≥ −δ` off `M` forces `r ≥ −δ` (if `r < −1` then `ρ̂ ≤ −1 < −δ`) | holds | R02 (notation) |
| 4.4 normal coordinates | ball radius `R`; exterior; cap `φ₀`; strip `[0, 1] × ℝ` | `h_r = (1 − r/R)² h₀`, `−½ ∂_r = h₀/R`; `(1 + r)² h₀`, `−h₀`; `a = sin(φ₀ − r)/sin φ₀`, `−a_r(0) = cot φ₀`; at `(0.8, 0)`: normal coordinate `0.8`, distance `0.2` | holds; tube radius is not a distance radius | none |
| 4.5 convexity function (headline) | disc at `q = (0, −1)`; exterior; `c = 0`; `[0, 1]` | `Hess x̃ = (2 − 2ε)g`, `dx̃_q = 2q = −dρ_q`, `K_c ⊆ {εǀz − qǀ² ≤ c}`; `−(2 + 2ε)g`; `K₀ = {q}`; `{x + εx² ≤ c}` | holds | none |
| 4.6 enlargement | ball, `ε₁ = 1/4`; cap `R < π/2`; `(1 − ǀxǀ²)e^{−ǀxǀ²}` | radius `1 + δ`, `II = h/(1 + δ)`; convex iff `R + δ < π/2`; radial derivative `−2r(2 − r²)e^{−r²}`: `−2/e` at `1`, `0` at `√2`, minimum `−e^{−2}` | holds | R02 (notation) |
| 5.1 strata | disc; `[a, b]`; `μ` on `∂SM`, `n ≥ 1` | torus, two circles, closed annulus; four points, `μ = ±1`, `∂₀ = ∅`; `dμ` on the fibre is `⟨·, ν⟩ ≠ 0` at `v ⊥ ν`; `dim SN = 2(n + 1) − 1` | holds | none |
| 5.2 exit time | disc at `(0, −1)`; annulus at `(−3/2, −1)`; half-space; speed `λ` | `2 sin θ` or `0`; `3/2 + √3` against `3/2 − √(2δ − δ²)`; `∞` on tangent vectors; `τ(x, λv) = τ(x, v)/λ` | holds; discontinuous without convexity | none |
| 5.3 fold form, even functions | `y − t²`; `y − t⁴`; `cos r`; `ǀrǀ` | `Q = r`, `a = y`, `∂_r Q = 1`; roots `±y^{1/4}`, no smooth `Q`, `a`; `H(s) = Σ(−s)^k/(2k)!`; excluded | holds | none |
| 5.4 regularity (headline) | ball, `b = ⟨x, v⟩`, `c = 1 − ǀxǀ²`; disc; `[a, b]` | `h = c − 2bt − t²`, roots `−b ± √(b² + c)`; `σ = −2b`, `T = c`, `(σ + √(σ² + 4T))/2 = −b + √(b² + c)`; `a = 4(b² + c)`, `Q(±√a) = (−2b ± √a)/2`; `μ/τ̃ = sin θ/(2 sin θ) = 1/2 = II/2`; `σ = a + b − 2x`, `Xσ = −2` | holds | none |
| 5.x with second countability (repaired) | `N` uncountably many planes, `M` a disc in one; compact `M` in any Hausdorff `N` | `N` excluded by README and plan alike; finitely many charts cover `M`, their union is a second-countable open `N′` with `{ρǀN′ ≥ 0} = M` | no intended instance lost | none |
| 5.5 criteria (headline) | ball, `f = ⟨x, v⟩`; closed `M ≠ ∅`; `M = ∅`; half-circle; `u = −∫₀^{τ_δ} h ∘ φ_t` | `(1 − (−1))/1 = 2`, the diameter; (F, F, F); (T, T, T); `τ(θ, ±1) = π/2 ∓ θ`; `u(φ_s z) = −∫_s^{τ_δ(z)} h(φ_t z) dt`, derivative `+h(z)` | equivalence holds on each | none |
| 5.6 scattering (headline) | ball; disc; `[a, b]` | `⟨x − 2bv, v⟩ = −b`, so `α² = id`, fixed points `b = 0`; `ℓ = 2√(1 − ǀwǀ²)`, `ǀLǀ = ǀwǀ`; `α(a, +1) = (b, +1)`, no fixed point | holds | none |
| 6.1 ball and convex domains | `∂₊`: `b ≤ 0`; speed `1/4`; ellipse vertex; graph form | `τ = −b + ǀbǀ = −2b`; `(0 + 1/4)/(1/16) = 4 ≤ 2/(1/4)`; `(2/b²)/(2/a) = a/b²`; `ρ = x₀ − w`, `II = D²w(0)` | holds | R01 (Needs) |
| 6.3 caps, hyperbolic | cap; hyperbolic plane; `R = 1` | `−(−cos R · g)/sin R = cot R · h`; `Hess_xx = 1/y − u_y/y = 1/(2y) + (x² + 1)/(2y³) = u/y²`, `Hess_xy = −x/y² + x/y² = 0`; `coth 1 = 1.3130`, `cot 1 = 0.6421` | holds | none |
| 6.5 conformal ball | general `φ`; `φ = s² − 2s`; `φ = −s` | `b′ = e^{φ}(1 + 2r²φ′)`, `II = e^{φ}(1/r + 2rφ′)h = (b′/r)h`; `1 + 2r²(2r² − 2) = (2r² − 1)²`, zero at `1/√2`; `b′(1) = −e^{−1}` | holds | none |

Sections 1.1, 1.2, 2.1, 3.2, 3.4, 4.1, 6.2 and 6.4 were re-read and their Checks recomputed with the
same results as round 10's rows (for instance `g(e₀ − a e₁, e₁) = a − a = 0`;
`6x/(1 + 9x⁴)^{3/2}`; `Hess ǀzǀ² = 2δ_ij − 2z_k Γ^k_ij`; `II = 2h/(2 · 1/4) = 4h` on the flat torus).

**Duplication and ownership.** Roadmap search this round (open heads, then main), README text,
for: scattering relation, exit time, non-trapping, boundary defining function, (strictly) convex
boundary, boundary normal or Fermi coordinates, signed distance, lens or boundary rigidity, X-ray
transform, mean-convex, Weingarten, collar extension, Seeley. No roadmap states the scattering
relation, non-trapping, a boundary defining function, a convex boundary, the X-ray transform or
mean-convexity. "Exit time" on main is the stochastic or flow-box one. "Fermi coordinates":
RiemannianGeometry/Surfaces 1.2 (named in the Scope) and ComplexCurveModuli (hyperbolic collars of
geodesics, another object). "Signed distance": RiemannianGeometry R7.9 (cited) and GeometricCurrents
(a barrier). "Weingarten": the unitary Weingarten calculus of FreeProbability and RandomMatrices,
and ManifoldOptimization O1.3, which states its formula in R5a's terms. "Boundary rigidity" in
LorentzianGeometry 10.2 is about `∂I⁺ = ∂J⁺`, another notion. Ownership against the open pull
requests was checked through the roadmap tools at their heads; the board's package index lists
AnalyticNumberTheory and LawrenceVenkateshMethod only.

LorentzianGeometry (open) defines, for an immersed nondegenerate hypersurface of a boundaryless
semi-Riemannian manifold with a chosen unit normal, `k(X, Y) = g(∇_X ν, Y)` with R5a's
`B = −ε k ν`. Its carrier is an immersion, not the boundary of a half-space-modelled manifold, so
no object is shared; the conventions agree: for `ε = 1`, `ν = ν_out`, `k = II` and
`B = II ν_in` (unit ball: `k = h`), which is 3.6.

Overlap check: read ManifoldOptimization, LorentzianGeometry, SmoothBundlesConnections, TeichmullerGeometry, RealSemisimpleLieGroups (open), RiemannianGeometry, Surfaces, HopfRinow (main); the sublevel inclusion, outward criterion, normal collar and defining function of a compact separating hypersurface: owner RiemannianGeometry R7.9, cited; the compact case of the realisation: owner RiemannianGeometry R5c, cited; the normal strip of an arc in a surface: owner Surfaces 1.2–1.3, named in the Scope; uniform normal radii: owner SmoothBundlesConnections B6.0, cited; nothing else shared. The third list (results and headings) is empty.

**Shape.** Layers are named by their mathematics and the README does not say it follows a source.
The order is forced by the dependency lines: Layer 2 needs 1.4–1.6; Layer 3 needs Layer 1; Layer 4
needs 3.1 and 3.5; Layer 5 needs 4.1–4.3 and 4.6; Layer 6 needs all. Every definition (1.3, 1.4,
1.5, 2.1, 3.1, 3.2, 5.1, 5.2, 5.4's `τ̃`, 5.6) has its API bullets and at least three Checks; every
theorem has its hypotheses in the sentence and a locator.

**Headline theorems and padding.** Seven end theorems in the Summary: 2.2, 3.5, 4.2, 4.5, 5.4, 5.5,
5.6. There is no `Suggested.lean` at the design stage, so the one-tactic probe, the binder audit and
the import check have nothing to inspect; the README attributes no backticked Lean name to this
roadmap. Elaboration: not available (this lane does not elaborate). No Lean command was run.

**Copyright and arrangement.** Twenty-two passages were set beside the sources: the fifteen sampled
sections and 2.1 (Definition 3.1.7), 2.3 (uhlmann-vasy2016 lines 49–51), 3.5 (Lemma 3.1.8), 5.4's
fold route (book lines 2967–2969), 5.5's route (lines 3086–3106), 3.2 (article lines 198–205) and
6.5 (lines 66–72). What is shared is formulas, standard names and lemma statements whose hypotheses
can be written one way; no run of consecutive source words beyond a formula or a standard
three-word term. Contents of the book against the layers: §3.1 is spread over 1.1, 1.4, 2.1, 3.5,
4.1, 4.2, 4.3, 5.1, 5.2; §3.2 ↔ 5.3–5.4; §3.3 ↔ 5.1, 5.5, 5.6; §2.5 ↔ 1.6, 6.2, 6.5. The order
inside Layer 5 is forced (5.2 needs 5.1; 5.4 needs 5.1–5.3; 5.5 and 5.6 need 5.4). Layers 1–4 and 6
map onto no run of sections. No table, figure or exercise list is reused.

Source independence: 22 passages compared with 3 sources, none shared; largest share paternain-salo-uhlmann2023, 38 of 66 named source mentions in the layers; contents compared with paternain-salo-uhlmann2023: independent.

## Not verifiable

- lee-riemannian2018 (Ch. 5–8), lee-smooth2012 (Theorem 9.25), sharafutdinov1994 (Ch. 4): settled
  as uncertified; not read. 1.5, 3.6, the form `dr² + h_r` of 4.4 and the general statement of 6.4
  have no certified locator besides them; their signs and normalisations are fixed by the computed
  values above.
- The arXiv texts were read at the recorded versions (uhlmann-vasy2016 v1,
  stefanov-uhlmann-vasy2021 v3), not against the journal typesetting.
- No elaboration: there is no Lean file and this lane does not elaborate.
- The draft revisions of DifferentialGeometry, GeometricTopology and RiemannianGeometry that share
  pull requests with other roadmaps were not read beyond the overlap report, which lists no dropped
  id for this roadmap.

## Source issues

- **Misprint** in paternain-salo-uhlmann2023 at Corollary 2.5.3(b), printed p. 47: the source says the derivative of `b` is positive at radius 1; it should be at the outer radius `r₁`; affects a stated result.
- **Misprint** in paternain-salo-uhlmann2023 at Lemma 3.2.11, printed p. 64: the source says the second factor of `T` is the exit time at the point "x minus v"; it should be the exit time of the reversed vector `(x, −v)`; affects a stated result.

## For the human reviewers

- **Licence.** paternain-salo-uhlmann2023 was read from an author's page copy carrying the publisher's personal-use notice (`packages/RiemannianManifoldsWithConvexBoundary/sources.toml`, `licence_class = "author-page"`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "71fd1709f19807bef39b39e918b550c2b72e6843", "job": "REV-DESIGN-RiemannianManifoldsWithConvexBoundary~11", "model": "fable", "worker": "chris-x82"} -->
