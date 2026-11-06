<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/6965#issuecomment-6676362238 -->
Review (claude) of 92b62a2

Verdict: needs_changes

1. **F01** (P2) 4.6 enlargement is false for an admissible defining function

   **Location.** `design/README.md`, 4.6 (line 842 onward): "if `∂M` is compact and strictly convex
   and `ρ̂` is the defining function of 4.3, there is `ε₀ > 0` such that for `0 < ε ≤ ε₀`, `−ε` is a
   regular value of `ρ̂`, `M_ε := {ρ̂ ≥ −ε}` is a regular domain with strictly convex boundary … if
   `M` is compact, so is `M_ε`"; route: "`{|ρ̂| ≤ ε₀}` is the closed tube of 4.3, compact".

   **Claim.** Every `ρ̂` satisfying 4.3's specification (`ρ̂ = r_{∂M}` near `∂M`, `M = {ρ̂ ≥ 0}`,
   `N ∖ M = {ρ̂ < 0}`, `grad ρ̂ = ν_in` on `∂M`) yields such enlargements.

   **Witness.** `N = ℝ²`, `ρ(x) = (1 − |x|²) e^{−|x|²}`, `M = {ρ ≥ 0}` the closed unit disc (`0`
   regular: `ρ'(1) = −2/e`). 4.3's route `ρ̂ = ψ r + (1 − ψ) ρ` with `ψ` supported in the tube
   `{3/4 < |x| < 5/4}` gives `ρ̂ = ρ` for `|x| ≥ 5/4`. Values computed: `ρ(5/4) ≈ −0.118`,
   `ρ(√2) = −e^{−2} ≈ −0.135` (minimum, `ρ'(√2) = 0`), `ρ(r) → 0⁻` as `r → ∞`. For every
   `0 < ε < e^{−2}`: `{ρ̂ ≥ −ε} ⊇ {|x| ≥ r₂(ε)}` with `r₂ > √2`, so `M_ε` is not compact although `M`
   is; its outer boundary component `{|x| = r₂}` is the boundary of a disc exterior, `II = −h/r₂ < 0`,
   so `∂M_ε` is not strictly convex; `{|ρ̂| ≤ ε₀}` is unbounded, not the closed tube; and for
   `ε = e^{−2}` the value `−ε` is critical. Every clause of 4.6 fails for every small `ε`.

   **Repair** (tested on the witness). In 4.3 strengthen the construction of `ρ̂`: with `W'' ⋐ W'`
   tube neighbourhoods of `∂M` and `ψ = 1` on `W''`, supported in `W'`, take a smooth `s : N → ℝ`
   equal to `1` on the closed set `M ∖ W''` and to `−1` on the closed set `N ∖ (M ∪ W'')`
   (Mathlib `exists_contMDiff_zero_iff_one_iff_of_isClosed`, rescaled), and set
   `ρ̂ := ψ r_{∂M} + (1 − ψ) s`. Add to 4.3's list the property "there is `ε₁ > 0` with
   `ρ̂ ≤ −ε₁` on `N ∖ (M ∪ W')`" (on `W' ∖ W''` off `M`, `r ≤ −r₁ < 0` and `s = −1`, so
   `ρ̂ ≤ −min(r₁, 1)`). In 4.6 state `ε₀ < ε₁` and note `M_ε = M ∪ E(∂M × [−ε, 0))`; then the tube
   claim, compactness, regularity and convexity follow as routed. Add the witness above as a
   negative-control Check in 4.6: with the unmodified `ρ`, `M_ε` is unbounded and has a strictly
   concave component. On the witness the repaired `ρ̂` equals `−1` for `|x| ≥ 5/4`, so
   `{ρ̂ ≥ −ε} = {|x| ≤ 1 + ε}` for `ε < 1/4`, the ball with `II = h/(1 + ε)`, as 4.6's first Check
   says.

2. **F02** (P2) gap `gt-full-boundary-gluing` asks for more than the library lacks

   **Location.** `design/plan.json`, `gaps[1]` (`gt-full-boundary-gluing`, needed by 3.3.1 and
   3.3.2); `design/README.md`, "Required of GeometricTopology Layer 1 (gluing along a piece of the
   boundary)" (lines 219–226) and 3.3.

   **Claim.** The collar extension `M̃ = M ∪_{∂M} (∂M × [0, 1))` and the double `DM` need a
   full-boundary gluing theorem from GeometricTopology.

   **Witness.** Tau Ceti at the pin glues manifolds along open pieces:
   `TauCeti/Geometry/Manifold/Gluing/GlueData.lean` line 84 `TopCat.GlueData.chartedSpace`, line 155
   `TopCat.GlueData.IsCompatible.isManifold`, line 207 `TopCat.GlueData.IsCompatible.isLocalDiffeomorph_ι`,
   line 179 `TopCat.GlueData.IsCompatible.partialDiffeomorphι` (a `C^n` manifold on the glued space,
   with each canonical map a diffeomorphism onto its open image). `M̃` is the open gluing of the
   boundaryless pieces `int M` and `∂M × (−1, 1)` along the open collar `c(∂M × (0, 1))`; `DM` is the
   open gluing of two copies of `int M` and the bicollar `∂M × (−1, 1)`. Only the collar `c` is
   GeometricTopology's. The remaining clauses of the gap (Hausdorffness and second countability of a
   two- or three-piece open gluing with closed seam, `M` closed in `M̃`, the identity of `M` a
   diffeomorphism onto the sublevel atlas of `{ρ̃ ≥ 0}`) are elementary consequences that this
   roadmap can own in 3.3; Tau Ceti has the Hausdorff criterion only for the double along an open
   subset (`TauCeti/Topology/Category/TopCat/GlueData/Double.lean` line 155
   `t2Space_doubleGlueData_iff`).

   **Repair.** Delete the gap from `plan.json` and the README. In 3.3 construct `M̃` and `DM` as
   compatible open gluings (`TopCat.GlueData.chartedSpace`, `TopCat.GlueData.IsCompatible.isManifold`,
   `TopCat.GlueData.IsCompatible.isLocalDiffeomorph_ι`) of `int M` and the bicollar, with GeometricTopology
   Layer 1 cited for the collar only, and add as targets of 3.3: the glued space is Hausdorff
   (the seam `∂M × {0}` is closed in the bicollar and the transition is a homeomorphism of open sets
   whose graph is closed) and second countable; `M` is closed in `M̃`; and the identity of `M` is a
   diffeomorphism onto Tau Ceti's sublevel atlas of `{ρ̃ ≥ 0}` (half-space charts of `M` restricted to
   `int M` and the collar chart agree with glued charts). If the package stage finds one of these
   genuinely belongs to GeometricTopology, re-declare a gap narrowed to that clause alone. Add the
   Tau Ceti names to *From Tau Ceti* and to 3.3's `*Needs:*` line.

3. **F03** (P3) gap slugs absent from the README

   **Location.** `design/README.md` lines 190–196 ("Required of DifferentialGeometry 12.5") and
   219–226 ("Required of GeometricTopology Layer 1"); `design/plan.json` `gaps`.

   **Claim.** The gaps are declared where the intake reads them.

   **Witness.** The slugs `dg-outward-unit-normal` and `gt-full-boundary-gluing` occur only in
   `plan.json`; the README states both contracts without a slug.

   **Repair.** Write each surviving contract as "What DifferentialGeometry must provide
   (`gap:dg-outward-unit-normal`): …" with the plan's `needs` sentence, so the slug matches in both
   files (R02 removes the second gap).

4. **F04** (P3) two locator slips

   **Location.** `design/README.md` 1.3 (line 290: "Paternain–Salo–Uhlmann, Lemma 3.1.10, lines
   2766–2773") and 6.4 (line 1170: "Paternain–Salo–Uhlmann, lines 307–310").

   **Claim.** The cited passages state the cited notions.

   **Witness.** `paternain-salo-uhlmann2023` lines 2766–2773 define the defining function with the
   extra properties `ρ = d(·, ∂M)` near `∂M` and `∇ρ = ν`, which is 4.3's `ρ̂`, not 1.3's weaker
   notion (that one is `uhlmann-vasy2016` lines 134–136, also cited). `paternain-salo-uhlmann2023`
   lines 307–310 list strictly convex Euclidean and hemispherical domains and perturbations as
   simple manifolds; small geodesic balls are not mentioned there.

   **Repair.** In 1.3 cite Uhlmann–Vasy lines 134–136 (and lines 25–26) for the definition and move
   the Lemma 3.1.10 locator to 4.3 (where it already appears). In 6.4 drop lines 307–310 and keep
   Lee, *Introduction to Riemannian Manifolds*, Ch. 6, or cite Example 3.1.4 (lines 2677–2678) for
   the small-cap instance.

5. **F05** (P3) a downstream consumer that exists nowhere

   **Location.** `design/README.md` line 1211 ("**LorentzianGeometry** (domains with boundary)");
   `design/plan.json` `consumers[1]`.

   **Witness.** No roadmap named LorentzianGeometry is on main, among the 460 open roadmap pull
   requests, or in the board index (`roadmaps grep 'LorentzianGeometry'`: no match).

   **Repair.** Say "a future Lorentzian geometry roadmap (domains with boundary)", as the X-ray and
   rigidity consumers are described, or drop the bullet.

6. **F06** (P3) pin the ComplexKahlerGeometry K5a citation to its sentence

   **Location.** `design/README.md` lines 228–230 ("From TauCetiRoadmap.ComplexKahlerGeometry: K5a,
   the half-space Seeley extension …") and 3.4, 5.3 `*Needs:*`.

   **Witness.** `TauCetiRoadmap/ComplexKahlerGeometry/README.md` line 867 states the half-space
   Seeley extension inside K5a's paragraph on diffeomorphisms of closures of bounded smooth domains
   ("Construct extension of smooth functions/maps across a smooth boundary by a collar, the
   half-space Seeley extension and a finite partition of unity"); K5a has no separately numbered
   item for it.

   **Repair.** Cite it as "ComplexKahlerGeometry K5a (extension of smooth functions across a smooth
   boundary: the half-space Seeley extension)" so the package stage resolves the sentence rather than
   a free-standing theorem; no gap is needed, the sentence constructs the half-space extension.

Independent review of `packages/RiemannianManifoldsWithConvexBoundary/design/README.md`,
`design/plan.json` and `sources.toml` (round 1, no previous review). Two P2 findings, four P3
notes. Everything else checked is recorded under *Verified sound*.

## Verified sound

**Principles.** No route-specific shortcut; no re-planned roadmap (HopfRinow, RiemannianGeometry
R5a, GeometricTopology, DifferentialGeometry 12.x are consumed by section, never restated); no
copied passages (source lines are cited by number); no algorithms; a design, so no `Suggested.lean`
(no sorry'd data, no `set_option`, no elaboration: this lane does not elaborate and the design
stage has no Lean file).

**Gate.** `tauceti-roadmap gate --candidate … --only RiemannianManifoldsWithConvexBoundary`:
`candidate: RiemannianManifoldsWithConvexBoundary is not in the merge order yet; checked as if
placed after GlaubermanZStar` / `depcheck: 242 roadmaps, 2367 edges, 0 problem(s)`. No UPWARD or
CYCLE line. Suppliers: DifferentialGeometry, RiemannianGeometry, GeometricTopology,
ComplexKahlerGeometry (all on main), HopfRinow (`Completed/HopfRinow`), SmoothBundlesConnections
(merge order line 8). Consumers PositiveMass (open pull request 956, head 3d0220a: averaged
`tr A/(n−1)` for the inward normal at its line 907, sections 5.1 and 5.2 at lines 877 and 913)
and PositiveScalarCurvature, Yamabe (on main). `roadmaps resolve`: no unresolved citation or name.

**Library names at the pins** (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9), opened file and line:
`IsOutwardPointing` Boundary/Orientation.lean 46 (negative derivative of coordinate 0 in the
preferred chart, as the Conventions say); `isOutwardPointing_iff_tangentCoordChange` ibid. 63;
`tangentCoordChange_normal_pos` Boundary/TransitionNormal.lean 36; `exists_isOutwardPointingField`
Boundary/OutwardExistence.lean 75; `isManifold_boundary` Boundary/Charts.lean 321;
`isSmoothEmbedding_subtypeVal_boundary` ibid. 374;
`ModelWithCorners.mem_boundary_euclideanHalfSpace_iff_of_mem_atlas` ibid. 107;
`mfderiv_subtypeVal_boundary` Boundary/Derivative.lean 64 (zero-insertion map);
`restrictBoundaryTangentSpace` and `_inner` Riemannian/Boundary.lean 115, 146;
`Bundle.ContMDiffRiemannianMetric.pullback` Riemannian/Pullback/Basic.lean 158 (needs injective
`mfderiv`); `.rescale` VectorBundle/Riemannian/Conformal.lean 87; `hessian_rescale`
Riemannian/Hessian/Conformal.lean 81 (formula `Hess_ĝ u = Hess_g u − (2f)⁻¹(df⊗du + du⊗df −
⟨grad f, grad u⟩ g)`, which with `f = e^{2φ}` and `dρ = 0` on `T∂M` is exactly 1.6's route);
`leviCivitaConnection_rescale_apply` CovariantDerivative/LeviCivita/Conformal.lean 260;
`ContMDiffNondegenerateMetricFamily` NondegenerateMetric/Family.lean 73 and
`contMDiffAt_christoffelSymbol` LeviCivita/Nondegenerate/Family.lean 116 (no `Boundaryless`);
`Manifold.mgradient` Riemannian/Gradient/Basic.lean 73; `Manifold.hessian` Riemannian/Laplacian.lean
135, `hessian_apply_eq_mvfderiv_sub` 158, `hessian_symm` 197 (all `IsManifold I 2 M`, no
`Boundaryless`); `IsLeviCivitaConnection.inner_apply_eq_inner_mvfderiv` LeviCivita/Immersion.lean
65; `IsRegularValue` RegularValue.lean 92; `scalarRegularSublevelChartedSpace` RegularValue/Scalar/
Sublevel.lean 473, `isManifold_scalarRegularSublevel` 639, `boundary_` 652, `interior_` 675
(ambient `I.Boundaryless`, `finrank E = n + 1`, as 3.1 states); `regularLevelChartedSpace`
RegularValue/Level.lean 234, `isManifold_regularLevel` 435, `isSmoothEmbedding_coe_regularLevel`
485; `IsGeodesicCurveOn` Geodesic/Basic.lean 102 and `IsGeodesicCurveOnFrom` 134 (no
`Boundaryless`, as 4.1 claims); `geodesicInterval`, `maximalGeodesic` Geodesic/Trajectory.lean 76;
`riemannianExp` Geodesic/Exponential.lean 104; `expDomain`;
`exists_contMDiffAt_localGeodesicFlow` Geodesic/Flow.lean 65 and `contMDiffOn_maximalGeodesic`
117 (`Boundaryless`, `T2Space`); `isGeodesicallyCompleteAt_of_compactSpace` Geodesic/Compact.lean
75 (`Boundaryless`, `T2Space`, `CompactSpace`); `SmoothEmbedding.normalExp`
TubularNeighborhood/Riemannian/Basic.lean 113; `exists_partialDiffeomorph_normalExp_subset`
Coordinates.lean 89 (`SecondCountableTopology N`, `Nonempty M`);
`exists_isClosedEmbedding_normalExp_norm_le_subset` Noncompact.lean 58 (closed range, no
completeness: matches 4.3); `sphereBundleChartedSpace` VectorBundle/Riemannian/Sphere.lean 143,
`isManifold_sphereBundle` 161, `isSmoothEmbedding_coe_sphereBundle` 181 (`I.Boundaryless`: 5.1
builds `SN` over boundaryless `N`); `ContDiff.sub_eq_hadamardFactor_apply` Analysis/Calculus/
Hadamard.lean 115, `contDiff_hadamardFactor` 131; `contDiff_intervalIntegral`
ParametricIntegral.lean 211; `sphereRoundMetric` Riemannian/Sphere/Basic.lean 61; `UpperHalfSpace`
Hyperbolic/UpperHalfSpace/Basic.lean 91, `.hyperbolicMetric` Metric.lean 41,
`.hasConstantSectionalCurvature` Curvature.lean 139; `nonempty_contMDiffRiemannianMetric`
VectorBundle/Riemannian/Existence.lean 69 (`T2Space`, `SigmaCompactSpace`). Mathlib:
`ModelWithCorners.boundary`/`interior`/`isClosed_boundary` IsManifold/InteriorBoundary.lean 112,
103, 330; `EuclideanHalfSpace` and `modelWithCornersEuclideanHalfSpace` Instances/Real.lean 60,
200; `RiemannianBundle` Topology/VectorBundle/Riemannian.lean 420; `IsContMDiffRiemannianBundle`
and `ContMDiffRiemannianMetric` VectorBundle/Riemannian.lean 68, 245; `IsRiemannianManifold`
Riemannian/Basic.lean 80; `pathELength`, `riemannianEDist` Riemannian/PathELength.lean 66, 208;
`CovariantDerivative.leviCivitaConnection` CovariantDerivative/LeviCivita.lean 356 and
`isLeviCivitaConnection_leviCivitaConnection` (variables: `IsManifold I 2 M`, `C¹` metric,
`FiniteDimensional ℝ E` at line 206, no `Boundaryless`: the Conventions' claim is correct);
`IsLeviCivitaConnection.uniqueness` ibid. 256; `ContDiffAt.implicitFunction` and
`ContDiffAt.contDiffAt_implicitFunction` Analysis/Calculus/ImplicitContDiff.lean 55, 91;
`SmoothPartitionOfUnity`, `exists_contMDiffSection_forall_mem_convex_of_local`,
`exists_contMDiff_zero_iff_one_iff_of_isClosed` PartitionOfUnity.lean 123, 593, 797.

**Supplier sections.** DifferentialGeometry 5.1 (line 507: boundary interface,
`IsOutwardPointing`, smooth outward field), 12.1–12.3 (lines 915–922), 12.5 (line 930: divergence
theorem "with the outward unit normal", not named: the gap `dg-outward-unit-normal` is precise and
minimal, Tau Ceti has no unit normal declaration). HopfRinow (`Completed/HopfRinow/README.md`)
Layer 1 line 264 (spray, flow, exponential), Layer 2 line 427 (normal neighbourhoods, Gauss
lemma, covariant differentiation in both variation directions), Layer 4 line 495 (compact ⇒
complete, no connectedness). RiemannianGeometry R1 item 4 (line 210: first derivatives of `g`
vanish in a normal chart), R5a (line 1044: Gauss equation pinned as `⟨R^M⟩ = ⟨R^N⟩ + ⟨B(X,W),B(Y,Z)⟩
− ⟨B(X,Z),B(Y,W)⟩`, R5a.2 line 1118: unit sphere `H = −position`, averaged); 3.6's Gauss
equation and sphere witness agree with both. GeometricTopology Layer 1 lines 205–222 (collar,
Lee Theorem 9.25; gluing along a piece of the boundary in the corners category).
ComplexKahlerGeometry K5a line 867 (R06). SmoothBundlesConnections B6.0 lines 1306–1333 (uniform
normal and strong-convexity radii on compact sets with `IsNormalDomain`).

**Sources, seeded sample and locators.** `paternain-salo-uhlmann2023`: 3.1 lines 2640–2844
(Definitions 3.1.1, 3.1.3, 3.1.7, Lemmas 3.1.8, 3.1.10, 3.1.12, 3.1.13, Exercises 3.1.2, 3.1.9),
3.2 lines 2845–3055 (Example 3.2.1, Lemmas 3.2.3, 3.2.6, 3.2.8, 3.2.9, 3.2.10 with proof,
3.2.11, Exercises 3.2.4, 3.2.12, Remark 3.2.13), 3.3 lines 3058–3127 (Proposition 3.3.1,
Exercise 3.3.3, Definition 3.3.4, Lemma 3.3.5, Exercise 3.3.6), 2.5 lines 2443–2521 (Definition
2.5.1, Lemma 2.5.2, Corollary 2.5.3, Examples 2.5.4–2.5.5), lines 300–310: every line range
cited in 1.1, 1.2, 1.4, 2.1–2.3, 3.1–3.5, 4.1, 4.2, 4.6, 5.1–5.6, 6.1–6.5 was read and supports
the statement at the generality restated (the source's standing hypotheses compact, connected,
oriented, `n ≥ 2` are dropped only where the proof is pointwise; see the table). Sign convention:
`Π_x(v,w) = −⟨∇_v ν, w⟩` with inward `ν` (line 2732) equals the README's `⟨∇_u ν_out, w⟩`.
`stefanov-uhlmann-vasy2021`: lines 53, 66–72 (Herglotz `(r/c)' > 0`), 84–97, 99–100,
128–134 (Theorem 1.2 hypotheses), 150–163 (`∂₊SM` points outside, `L : ∂₋SM → ∂₊SM`,
identification with `B∂M`), 198–205, 220–221: all as cited. `uhlmann-vasy2016`: lines 25–26,
30–32, 46–51, 134–140, 499–524: all as cited, including the `C₀, δ` statement (lines 504–506)
and `x̃ = −ρ − ε|z − p|²` (line 512). Manifest: six entries, three certified with sha256, three
settled uncertified; `cited_for` lists agree with the README's citations; no local paths.

**Duplication by object.** `roadmaps grep` (main and 460 open heads) for the second fundamental
form of a boundary, "strictly convex boundary", "boundary defining function", "exit time" (only
stochastic hits), "scattering relation", "non-trapping", the double of a manifold with boundary,
boundary normal coordinates: no owner other than this roadmap. Tau Ceti at the pin has no unit
normal of the boundary, no boundary gluing (only open gluing: R02), no exit time or sphere-bundle
strata. PositiveMass consumes, not defines, the boundary mean curvature.

**Shape.** Summary, Scope and ownership, Conventions (each sign pinned by a computed witness),
Exact supplier contracts, How to read the build, six layers with `### Examples` and
`### Dependencies`, Downstream consumers, References. Every definition (1.3, 1.4, 1.5, 2.1, 3.2,
4.3, 5.1, 5.2, 5.4 odd extension, 5.6 `α`, `P`, `L`, `ℓ`) has an API list and at least three
Checks (counts 4, 4, 4, 3, 3, 3, 3, 3, 4, 3); every theorem has hypotheses in the sentence and a
locator; every `*Needs:*` item is a target, a named supplier section or a pinned declaration; no
`*Needs:*` cycle (5.4.1 → 5.4.4 → 5.2, 5.3.1, 4.2.1 is acyclic). No LaTeX delimiters, pull-request
numbers, dates, paths or process words (grep for `#NNN`, `PR`, `20YY-MM`, `http`, `$`, `\(`,
"so far", "checkpoint": none).

**Headline theorems, for the package stage.** From the Summary: the Hessian characterisation
(2.2), the realisation theorem (3.5), second-order leaving of tangent geodesics (4.2), convexity
functions (4.5), regularity of the exit time (5.4), Proposition 3.3.1 (5.5), the involution and
fixed-point theorem for `α` (5.6). All carriers exist at the pins: manifolds over `𝓡∂ (n+1)` with
`RiemannianBundle`, `TauCeti.Manifold.hessian` at boundary points, the sublevel atlas and
`IsRegularValue`, `IsGeodesicCurveOnFrom`, the sphere bundle over a boundaryless `N`. 2.2, 3.5,
4.2 and 4.5 are statable with one simple definition (`II` through `hessian` of the chart
coordinate); 5.4–5.6 are statable with `SM` as `{p : SN // ρ (π p) ≥ 0}` and `τ` as a supremum,
at the cost of a few lines of definitions with real bodies. None needs a stand-in.

**Adversarial table** (sampled targets, headline theorems and the targets of the findings).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 trichotomy, one-sided curve velocities | half-plane, `n = 0` (`[0,1]`) | `x⁰∘c ≥ 0`, `= 0` at `0` ⇒ `(x⁰∘c)'(0) ≥ 0`; two-sided ⇒ `= 0`; `tangentCoordChange` scales coordinate 0 by `a > 0` so kernels agree | sound | none |
| 1.2 uniqueness, chart formula, sign test | `g = [[1,a],[a,1]]`, `|a|<1`; unit ball; `[0,1]` | `g(e₀ − ae₁, e₁) = a − a = 0`, `|e₀ − ae₁|² = 1 − a²`, coordinate 0 of `e₀ − ae₁` is `1 > 0` (inward); `e₀` fails orthogonality (`g(e₀,e₁) = a`); ball `ν_out = x`; `[0,1]`: `ν_out(0) = −∂_x`, `ν_out(1) = +∂_x` | sound | none |
| 1.3 definition, global existence, comparison | ball `ρ = 1 − |x|²`, `ρ' = (2+x₁)ρ`, `ρ'' = ρ²`, `−ρ`; `∂M = ∅`; `[0,1]` | `|dρ| = 2`, `grad ρ = −2x = 2ν_in`; `u = 2 + x₁ ∈ [1,3]`; `dρ'' = 2ρ dρ = 0` on sphere (fails); `−ρ < 0` inside (fails); constant `1` for `∂M = ∅`; `x(1−x)` has `|1 − 2x| = 1` at ends; partition-of-unity sum has `dρ(ν_in) = Σψ_i dx⁰_i(ν_in) > 0` since `ψ_int = 0` near `∂M` | sound | R04 (locator only) |
| 1.4 `II` in four descriptions | ball `R`; half-space; exterior; inward-normal wrong model; `n = 0` | `Hess ρ = −2g`, `|dρ| = 2R`, `II = h/R`; `Hess x⁰ = 0 ⇒ II = 0`; exterior `II = −h`; `⟨∇_X ν_in, Y⟩ = −h` on the ball (excluded by the ball witness); independence of `ρ`: `Hess(uρ) = u Hess ρ` on `T∂M`, `|d(uρ)| = u|dρ|`; `⟨∇_u N, w⟩ = −Hess ρ(u,w)/|dρ|` from `grad ρ = −|dρ| N` and `w ⊥ N`; PSU `Π = −⟨∇_v ν, w⟩`, `ν = −N` | sound | none |
| 1.5 `S`, `H` | sphere, cylinder, exterior, `n = 0` | `S = id`, `H = 1`; `κ = 1, 0`, `H = 1/2`; `H = −1`; `n = 0` undefined | sound | none |
| 1.6 conformal law | pin's `hessian_rescale` with `f = e^{2φ}`; `φ = log 2`; `φ = −|x|²` on disc; `φ = (|x|²−1)²` | `(2f)⁻¹df = dφ`; on `T∂M`: `Hess_ĝ ρ = Hess_g ρ + |dρ| dφ(ν_in) g`, `|dρ|_ĝ = e^{−φ}|dρ|_g` ⇒ `II^ĝ = e^{φ}(II − dφ(ν_in)h)`; `II^ĝ = 2h = (4h)/2`; `dφ(ν_in) = 2|x|² = 2`, `II^ĝ = −e^{−1}h`, `Ĥ = e(1−2) = −e`, wrong sign gives `+3e^{−1}h`; `dφ = 0` on sphere ⇒ `II^ĝ = h` | sound | none |
| 2.1 predicates | ball, half-space, exterior, cylinder, `{y ≥ x³}`, `n = 0` | `II(t,t) = 6x/(1+9x⁴)^{3/2}` (`Hess ρ = −6x dx²`, `|dρ| = √(1+9x⁴)`, unit `t = (1,3x²)/√(1+9x⁴)`): sign of `x`; `n = 0` both vacuous | sound | none |
| 2.2 Hessian characterisation | `ρ` vs `(2+x₁)ρ` on ball; `−ρ` | `Hess ρ' = −2(2+x₁)h` on `T∂M`, same sign; `−ρ` not admissible | sound | none |
| 2.3 openness, uniform bound, families | hyperbola epigraph; `{y ≥ x³}`; `g_s = e^{−2s|x|²}g` | `κ = (1+2x²)^{−3/2} → 0`; convex set `{x ≥ 0}` closed not open; `II^{g_s} = e^{−s}(1−2s)h`, threshold `s = 1/2` | sound | none |
| 3.1 regular domains | `(2+x₁)(1−|x|²)`; `(1−|x|²)³`; `x₀² − x₁²` | same set, same `II = h`; `d(ρ³) = 3ρ²dρ = 0` on sphere; cone at origin | sound | none |
| 3.2 level-set concavity | `|z|²`, `−|z|²`, affine, SUV's `|z−z₀| − sup` | `Hess = 2g`, ball `II = 2h/(2√c) = h/√c`; `−2g` fails; `0` fails; `(g − dx⊗dx)/|z−z₀| > 0` on `ker dx`; `{x ≤ c}` with `ρ = c − x` has `II = Hess x/|dx|` | sound | none |
| 3.3 collar extension, double | `[0,1]`; half-space; `∂M = ∅` | `DM = S¹`, `M̃` open interval; `M̃ ≅ ℝⁿ × (−1,∞)`; `M ⊔ M` disconnected | sound as mathematics; route re-owned | R02 |
| 3.4 Seeley extension of functions and metrics | `√x` on `[0,1]`; `(x + 1/100)dx²`; `∂M = ∅` | no smooth extension; positive only for `x > −1/100`; no Seeley step | sound | R06 (citation form) |
| 3.5 realisation | disc in `ℝ²` and in `S²`; `[0,1]` with `(1+x)²dx²`; closed `M` | `II = h` both; length `∫₀¹(1+x)dx = 3/2`; `ρ̃ ≡ 1` | sound | none |
| 3.6 comparison with R5a | sphere, cylinder, exterior | `⟨B, ν_in⟩ = ⟨−⟨X,Y⟩x, −x⟩ = ⟨X,Y⟩`; Gauss `0 + 1·1 − 0 = 1`; cylinder `0 + 1·0 − 0 = 0`; exterior `⟨B, +x⟩ = −h` | sound | none |
| 4.1 geodesics of a domain | ball tangent `v ⊥ q`; half-space tangent line | `|q + tv|² = 1 + t² > 1`; `ρ ≡ 0` along the line | sound | none |
| 4.2 second-order contact, no interior tangency | ball; exterior; half-space; `{y ≥ x⁴}` | `ρ(q+tv) = −t²`, `(ρ∘γ)'' = −2 = −|dρ|·II(v,v) = −2·1`; `+t²` stays; `≡ 0`; `−t⁴` leaves with `II = 0` | sound | none |
| 4.3 normal exponential, signed distance, `ρ̂` | `S^n` with `f = 1 − |x|²`; exterior; slanted collar | `ν_Σ = −x`, `E(q,r) = (1−r)q`, `r_Σ = 1 − |x|`, `|grad r_Σ| = 1`, `ε ≤ 1`; `r_Σ = |x| − 1`; cross term `⟨∂_r, ∂_{x₁}⟩ = 1 ≠ 0` | sound; `ρ̂` under-specified for 4.6 | R01 |
| 4.4 boundary normal coordinates | ball `R`; exterior; half-space; `n = 0` | `h_r = (1 − r/R)²h₀`, `−½∂_r h_r|₀ = h₀/R`; `(1+r)²h₀ ⇒ −h₀`; `h_r = h₀ ⇒ 0`; sign from `∂_r h_r(u,u) = 2⟨∇_u ν_in, u⟩ = −2 II(u,u)` | sound | none |
| 4.5 convexity functions | unit disc at `q = (0,−1)`; exterior of disc; `[0,1]` | `Hess x̃ = (2 − 2ε)g`, `dx̃_q = 2q = (0,−2) = −dρ_q`, `K_c ⊆ {ε|z−q|² ≤ c}`; `−(2+2ε)g`; `x̃ = −x − εx²`, `K_c` an interval | sound | none |
| 4.6 enlargements | ball with `ρ̂ = 1 − |x|` near sphere; cap `R`; half-space; **`ρ = (1−|x|²)e^{−|x|²}`** | `M_ε` ball `1+ε`, `II = h/(1+ε)`; `ε₀ < π/2 − R`; flat; **`ρ(√2) = −e^{−2}` critical, `{ρ ≥ −ε}` unbounded, outer `II = −h/r₂`** | **false for an admissible `ρ̂`** | R01 |
| 5.1 strata | unit disc; `[a,b]`; SUV labels | `∂SM` torus, `∂₀SM` two circles, `(0,1) ∈ ∂₊`, `(1,0) ∈ ∂₀` at `(0,−1)`; four points, `μ = ±1`, `∂₀ = ∅`; `d/ds⟨cos s v + sin s ν_in, ν_in⟩|₀ = 1` so `0` regular for `n ≥ 1`; SUV `∂₊` = outside (line 151) | sound | none |
| 5.2 exit time | disc at `(0,−1)`; annulus `1 ≤ |x| ≤ 2`; half-space; `[a,b]`; `v = 0` | `τ = 2 sin θ` / `0`; from `(−3/2,−1)`, `v = e₁`: tangent at `(0,−1)`, exits at `x = √3`, `τ = 3/2 + √3`; from `(−3/2, −1+δ)`: `3/2 − √(2δ−δ²) → 3/2`, discontinuous; `τ = ∞` on tangents; `b − x`; `sup = ∞` | sound | none |
| 5.3 fold and even-function lemmas | `h = y − t²`; `h = y − t⁴`; `cos r`, `r²`, `|r|`; `K = 0` | `Q = r`, `a = y`; quartic: `2y^{1/4} = √a·G` forces `√y a₁G² = 4`, impossible; `H(s) = Σ(−s)^k/(2k)!`, `H = s`; `|r|` excluded; `∂_rQ(0,y₀) = ∂_rS(0,y₀) > 0` (PSU line 3000, 3021) | sound | none |
| 5.4 regularity of `τ` | disc at `(0,−1)`; ball; `[a,b]`; Remark 3.2.13 | `τ̃ = 2 sin θ` smooth, one-sided derivatives `2`, `0`; `μ/τ̃ = sin θ/(2 sin θ) = 1/2 = II/2`; `τ(x,v) − τ(x,−v) = −2⟨x,v⟩`, product `D − ⟨x,v⟩² = 1 − |x|²`, `d/dt(−2⟨x+tv,v⟩) = −2`; `a + b − 2x`, `X = d/dx ⇒ −2`; `a = τ̃² + 4T = 4(⟨x,v⟩² + 1 − |x|²)`, `Q(√a) = −⟨x,v⟩ + √D = τ` | sound | none |
| 5.5 non-trapping criteria | ball `u = |x|²/2`; closed `M`; hemisphere; `M = ∅` | `f = ⟨x,v⟩`, `Xf = 1`, `τ ≤ 2`; `Xf = 0` at a max, `1 ≠ Xu`, `τ ≡ ∞`; equator geodesic, `II = cot(π/2) = 0`; all vacuous-true | sound (route needs 4.6 repaired) | R01 |
| 5.6 scattering relation, lens data | ball; disc; `[a,b]` | `α(x,v) = (x − 2⟨x,v⟩v, v)`, `⟨x − 2⟨x,v⟩v, v⟩ = −⟨x,v⟩` ⇒ `α² = id`; fixed iff `⟨x,v⟩ = 0`; `|P|² = 1 − ⟨x,v⟩² = |w|²`, `ℓ = 2√(1−|w|²)`; `α(a,+1) = (b,+1)`, `τ̃ = ±(b−a)`, no fixed points | sound | none |
| 6.1 balls, Euclidean domains | `R = 1`; ellipse at `(a,0)`; `{y ≥ x³}` | `sin θ + |sin θ|`; `dρ = (−2/a,0)`, `Hess ρ(e_y,e_y) = −2/b²`, `II = a/b²`; `w'' = 6x` | sound | none |
| 6.3 caps, hyperbolic balls | cap `R = π/4, π/2`; `n = 1` hyperbolic plane; radius `1` | `Hess ρ = −cos R g`, `|dρ| = sin R`, `II = cot R h`; `Γ^x_{xy} = −1/y`, `Γ^y_{xx} = 1/y`, `Γ^y_{yy} = −1/y`, `u_x = x/y`, `u_y = ½ − (x²+1)/(2y²)`, `Hess u_{xx} = 1/(2y) + (x²+1)/(2y³) = u/y²`, `Hess u_{xy} = 0`, `Hess u_{yy} = u/y²`; `coth 1 ≈ 1.313`, `cot 1 ≈ 0.642` | sound | none |
| 6.4 small geodesic balls | sphere; `ℝⁿ⁺¹`; torus `ℝ²/ℤ²` | `r_p ≤ π/2`; every radius; smooth on `B(p,1/2)` only, `II = h/R`; `Hess|z|² = 2δ − 2Γ^k_{ij}z_k = 2g + O(|z|²)` | sound | R04 (locator only) |
| 6.5 Herglotz–Wiechert | `φ ≡ 0`, `log c`, `−st`; SUV `(r/c)' > 0` | `b(r) = re^{φ(r²)}`, `b'(1) = e^{φ(1)}(1 + 2φ'(1))`; `dφ̃(ν_in) = −2φ'(1)` ⇒ 1.6 gives the same; `e^{−s}(1−2s)`, threshold `1/2`; `c = e^{−φ(r²)}`, `r/c = b` | sound | none |

## Not verifiable

- `lee-riemannian2018` (Ch. 5–8), `lee-smooth2012` (Theorem 9.25) and `sharafutdinov1994`
  (Ch. 4): settled uncertified in the manifest, cited by locator; not opened. Every statement they
  are cited for is also carried by a certified source or verified by computation above.
- The gap contract to DifferentialGeometry 12.5 and the GeometricTopology collar are supplier
  contracts, not checked beyond the supplier text quoted above.
- Ownership against open pull requests was checked through `roadmaps grep` over the 460 heads of
  the index of 2026-11-06; pull requests not in that index were not searched.
- Elaboration: not applicable (design stage, no `Suggested.lean`); this lane does not elaborate.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "92b62a22da421a176d556555dc7e8c5afd34aba8", "job": "REV-DESIGN-RiemannianManifoldsWithConvexBoundary", "model": "fable", "worker": "chris-x10"} -->
