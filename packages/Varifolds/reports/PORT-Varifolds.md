# PORT-Varifolds: port of the accepted Varifolds package

- **Branch:** `roadmap/varifolds`, from main at `0f9f711`.
- **Head commit:** `a85c365985db4c6d50fbbe5cc9265baec25870be`
  ("Varifolds: roadmap (README, Suggested.lean, metadata)"). It adds only
  `TauCetiRoadmap/Varifolds/README.md`, `TauCetiRoadmap/Varifolds/Suggested.lean` and
  `TauCetiRoadmap/Varifolds/metadata.toml` (`topic = "math.DG"`, as in the package and in the
  folders on main).
- **Build** (`lake build TauCetiRoadmap.Varifolds.Suggested`): `Build completed successfully
  (18406 jobs).` There are 15 warnings, all `declaration uses 'sorry'` (one per theorem), and no
  other warning or error.
- **Gate:** `gate Varifolds: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0
  sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0
  lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0
  round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0
  dirty=0 outside-folder=0 source-material=0 OK`
- **Dependency direction** (`gate --depcheck … --name Varifolds --movable`): output
  `depcheck: 249 roadmaps, 2375 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
  Varifolds is line 439 of the merge order. Its roadmap suppliers are GeometricCurrents (G1, G2,
  G5, G6), GeometricMeasureTheory (G2), RiemannianGeometry (R4 item 1, R5a, R5a.2) and HopfRinow
  (Completed, Layers 0–2 and 4). All four are on main.

## Draft pull request body

Adds the Varifolds roadmap: the general theory of k-dimensional varifolds on a Riemannian
manifold, in Allard's generality. A varifold is an arbitrary Radon measure on the Grassmann bundle
of unoriented k-planes, and the analysis covers every varifold of locally bounded first variation.
Every notion is intrinsic to (M, g), with Euclidean space as the flat case and no embedding
theorem used. The roadmap builds the Grassmann bundle in projection form, compared with Tau Ceti's
finite Grassmannian and with GeometricCurrents G6's bundle. On it come varifold convergence and
rectifiable and integral varifolds; push-forward and normal-coordinate blow-ups; the first
variation, with its Riesz decomposition into generalised mean curvature, boundary measure and
co-normal; and a two-metric comparison estimate, which reduces every Riemannian blow-up to a
Euclidean one. On these rest the end theorems: Euclidean and Riemannian monotonicity, with the
existence and upper semicontinuity of densities; the constancy theorem and the convex hull
property; Allard's rectifiability theorem; the rectifiable and integral compactness theorems, for
metrics converging in C², together with Allard's multiplicity lemma; varifold tangents and
rectifiable and integral tangent cones; the comparison of the intrinsic and ambient theories for an
embedded M ⊆ ℝ^L; and the identification of GeometricCurrents' auxiliary varifold of an integral
current. This general theory is what regularity (Allard's theorem, a Part II), min-max, Brakke
flow and cluster regularity are written in. GeometricCurrents develops density, monotonicity and
tangent cones only for the varifold of an integral current. `Suggested.lean` states the 15
headline theorems that are statable at the pinned Mathlib and Tau Ceti. Its module docstring names
those that are not statable at the pins (the Riemannian blow-up forms, the varying-metric
compactness theorems, the ambient comparison and the current comparison), each with the carrier it
lacks.

## Dependencies still in pull requests

None. Every cited roadmap is on main: GeometricCurrents, GeometricMeasureTheory, RiemannianGeometry
(with RiemannianGeometry/MinimalSurfaces, cited for ownership only, not consumed) and HopfRinow
(Completed). The citation resolver (`roadmaps resolve`) reports "Cross-roadmap citations found
nowhere: None. Lean names found nowhere: None." It checked against main at `2b9ce21`, which is
later than this branch's base `0f9f711`. Neither that main nor any open pull request has a
Varifolds folder (`roadmaps overlaps Varifolds`: "no roadmap Varifolds on main or in an open
roadmap pull request"). No id cited here is dropped by an open pull request.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already had the required form: 15 headline theorems and
23 definitions, each definition needed by a headline, no sorry'd data, no `set_option`, no
examples, and `import Mathlib` plus three `TauCeti.*` modules, each used. No declaration is padding.
In particular, `monotoneOn_exp_mul_densityRatio` needs a backward Grönwall argument and is the
classical form of monotonicity, not an API lemma.

No headline statable at the pins is missing. I considered three candidates: the convex hull
property (6.5), upper semicontinuity of densities under convergence (6.3, fourth bullet) and the
multiplicity lemma (7.5). The Summary does not name them as end theorems: they are tools or
corollaries, so they stay README targets.

One statement changed (see the fixes below): `exists_firstVariation_eq_riesz` gained two
measurability conjuncts.

## Supplier replacements and duplication removals

None were needed, so "Scope and ownership" is unchanged.

- **Library declarations, checked at the pins** (`.lake/packages` of this worktree, Mathlib
  `1b1ccf4`, TauCeti `2fd255d`). Every Mathlib and Tau Ceti name in the supplier contracts exists
  with the stated content. Among them:
  - `TauCeti.finiteGrassmannian`, `.toEuclidean`, `.toEuclidean_injective` and
    `.continuous_starProjection_toEuclidean` (`TauCeti/Topology/Grassmannian/Tautological.lean`
    lines 73, 80, 110);
  - `TauCeti.globalFlow`, `TauCeti.contMDiff_globalFlow_uncurry` and
    `TauCeti.globalFlowDiffeomorph`;
  - `TauCeti.isCompleteVectorField_of_isCompact_of_eq_zero_off`;
  - `TauCeti.RealRMK.posPart`, `TauCeti.RealRMK.negPart` and
    `TauCeti.RealRMK.integral_rieszMeasure_posPart_sub_integral_rieszMeasure_negPart`;
  - `Distribution.HasLocallyFiniteMass`, `Distribution.massMeasure`,
    `Distribution.massMeasure_preimage_coe` and
    `Distribution.enorm_apply_le_lintegral_massMeasure`;
  - `TauCeti.isCompact_closure_of_isTightMeasureSet_of_mass_le`;
  - both divergence theorems (`MeasureTheory.integral_divergence_eq_zero` in Tau Ceti's flat file,
    and `TauCeti.Manifold.integral_divergence_eq_zero`), and `TauCeti.Manifold.divergence`;
  - `TauCeti.riemannianVolume` and `TauCeti.eq_riemannianVolume_iff`;
  - `TauCeti.IsLocalRiemannianIsometry` and its `mfderiv_leviCivitaConnection_mpullback`;
  - `Bundle.ContMDiffRiemannianMetric.restrictOpenTangentSpace`;
  - `TauCeti.RiemannianIsometry.riemannianExp_mfderiv`;
  - `TauCeti.Manifold.IsNormalDomain` (a structure: open, contains 0, star-shaped, inside the
    domain of exp, injective, local diffeomorphism), with `exists_isNormalDomain_ball` and
    `IsNormalDomain.image_riemannianExp_ball`. The latter uses the same `Metric.ball 0 r` on the
    tangent space as `monotonicity_inequality`;
  - `CovariantDerivative.sectionalCurvature`;
  - `TauCeti.secondFundamentalForm` and `TauCeti.inducedRiemannianMetric`;
  - `TauCeti.CountablyRectifiable`;
  - Mathlib's `CovariantDerivative.leviCivitaConnection`. Its `toFun` has type
    `(Π x, V x) → Π x, T_xM →L V x`, so `cov X x v = ∇_v X`, which is the convention
    `firstVariation` needs;
  - `isMetricCompatible_leviCivitaConnection`, `ContMDiff.mpullback_vectorField` (Pullback.lean
    608), `MeasureTheory.Measure.Regular.of_sigmaCompactSpace_of_isLocallyFiniteMeasure`
    (Regular.lean 1183), `Measure.setLIntegral_rnDeriv_le`, `Besicovitch.ae_tendsto_rnDeriv`,
    `Vitali.exists_disjoint_subfamily_covering_enlargement`, `LinearMap.normDet_comp`,
    `MeasureTheory.Measure.support`, `μHE[d]`, and the instance `IsRiemannianManifold 𝓘(ℝ, F) F`
    (`Mathlib/Geometry/Manifold/Riemannian/Basic.lean` line 157).
- **Duplication by object at the pins.** Mathlib and Tau Ceti contain no varifold, no
  k-dimensional density (`densityRatio`, `HasDensity`, `upperDensity` and `unitBallVolume` have no
  counterpart) and no vague convergence of Radon measures (the only "vague" in Tau Ceti is a
  docstring in `Analysis/BoundedVariation/WeakConvergence.lean`). `Module.Grassmannian` is the
  algebraic functor. The five same-name leads of `scratch/library-matches.md` (`weight`,
  `IsIntegral` twice, `IsStationary` twice) are unrelated objects.
- **Duplication sweep against main and the open pull requests**, by object, after the edits. I ran
  `roadmaps grep` over every open head and main for: varifold, Allard, Grassmann bundle,
  monotonicity formula/identity, constancy theorem, tangent cone, first variation, convex hull
  property, approximate tangent, upper density, density ratio, rectifiability criterion and Riesz
  representation.
  - "varifold" and "Allard" occur only on main, in GeometricCurrents, GeometricMeasureTheory and
    MinimalSurfaces.
  - **GeometricCurrents G6.** It owns the unoriented Grassmann bundle and the auxiliary varifold of
    an integral current, with its density, monotonicity and tangent cones. This roadmap cites it;
    it keeps the projection presentation (1.2) and the statements for arbitrary varifolds (6.1–6.3,
    7.2, 8.2), and 9.3 identifies G6's object.
  - **MinimalSurfaces.** Its 3.1 (smooth monotonicity) and 3.3 (smooth convex hull property) are
    cited in Scope.
  - **GeometricMeasureTheory G2 and GeometricCurrents G2.** They own the approximate tangent planes
    of rectifiable sets, which are cited. Section 2.1 here extends them to weighted measures θHᵏ⌞Γ
    and adds the rectifiability criterion, which no other roadmap states.
  - **Open heads.** The only shared object is the Grassmann bundle in
    HyperbolicDynamicsAndThermodynamicFormalism (§11.2). It cites GeometricCurrents G6 as this
    roadmap does, and builds the bundle's smooth structure, which this roadmap does not use. The
    other "first variation" hits concern energy or length (FourManifolds, TeichmullerGeometry,
    ManifoldOptimization, SmoothBundlesConnections). The "upper density" hits are arithmetic
    densities. GaussianIsoperimetryAndClusters plans no varifold object.
  - Ownership against open work was checked for all the open roadmap heads listed in
    `scratch/open-pull-requests.md`, through the `roadmaps` tools. No declaration of
    `Suggested.lean` shares a fully qualified name with any roadmap declaration: all live in
    `TauCetiRoadmap.Varifolds`.

## Fixes made in reviewing the README and the Lean file

1. **Lean weaker than the README (generality mismatch, §4.4).** The README states
   H_V ∈ L¹_loc(‖V‖; TM) and a σ_V-measurable η_V. `exists_firstVariation_eq_riesz` asserted only
   `∫⁻_K ‖H_V‖ < ∞` and no measurability. With non-measurable witnesses, the Bochner integrals in
   its representation identity silently become 0, and a consumer such as
   `Euclidean.monotonicity_identity` (which needs `IntegrableOn`) could not be fed from it. I added
   `AEStronglyMeasurable (T% Hv) (weight V)` and `AEStronglyMeasurable (T% η) σ`.
   - Measurability is stated for the sections into the tangent bundle and not for the raw
     `E`-valued function. The raw components are taken in the chart `chartAt x`, an arbitrary
     choice of the atlas, so their measurability would not be a geometric condition.
   - The docstring and README §4.4 now say this.
   - The strengthened statement is still true: the true H_V and η_V are measurable sections, and
     the tangent bundle is second countable and metrizable, so measurable implies strongly
     measurable.
   - Elaborated, with the probe `AEStronglyMeasurable (T% Hv) μ` checked separately.
2. **Conventions, k > N.** The Lean theorems assume `1 ≤ k` but not `k ≤ N`, while the README said
   "1 ≤ k ≤ N". I added a sentence: for k > N the statements hold trivially and the Lean does not
   exclude that case. I checked each theorem in that case: the bundle is empty and V = 0; constancy
   is vacuous because no k-manifold immerses in M; and in the monotonicity identity a
   representation of δ0 forces η·σ = 0 on W, so both sides are 0.
3. **Timelessness.** "nothing at the pin transports…", "HopfRinow Layers 1–2 at the pin", "the
   pinned mass measure" and "(at the pin: …)" are now timeless ("neither … is supplied, and this
   roadmap uses neither", "in Tau Ceti").
4. **Downstream consumers.** "Future roadmaps on … use the same carrier" asserted use by roadmaps
   that do not exist. It now says those theories are formulated with this notion of varifold in
   the literature and that roadmaps on them consume Layers 1–8.
5. **References.** The "line N" locators had no stated basis. A sentence now names the version
   whose lines are counted: the 1983 ANU (Centre for Mathematical Analysis) edition of Simon1983,
   and the listed arXiv versions of Scharrer2022, AgnolettoCorreaHoyosDaSilvaNardulli2025,
   Simon2023 and EdelenSpolaor2023. It also says that Allard1972, Federer1969 and Maggi2012 are
   cited by section only; none of them is cited with a line number.
6. Cosmetic: the Summary paragraph is reflowed. It had a 135-character line.

The review's three P3 repairs (`FIX-PKG-Varifolds~2`) are present in the package text, so they are
present in the port: `exists_isVarifoldTangent` without `hV`/`hδ`, the MinimalSurfaces 3.3
citation with the catenoid Check, and `VarifoldTendsto` under Layer 1.

## Signature check

I put `#check @name` for all 38 declarations, plus instance probes, into one temporary block
appended to the module. I elaborated it once with the permitted
`lake build TauCetiRoadmap.Varifolds.Suggested`, then removed the block and rebuilt; the log is
kept as `scratch/build-probe.log`. Results:

- All 15 theorems carry `[I.Boundaryless]`, `[SecondCountableTopology M]`,
  `[IsRiemannianManifold I M]`, `[IsContMDiffRiemannianBundle …]` and `[BorelSpace M]` (the
  Euclidean ones carry `[BorelSpace F]`). Each elaborated type matches its README statement.
- The 16 binders flagged in `scratch/signatures.md` as dropped all belong to definitions or
  instances that do not need them:
  - `grassmannBundle` needs only `RiemannianBundle`.
  - `weight` and the Euclidean definitions need no `BorelSpace`.
  - `IsRectifiable` and `IsIntegral` keep `EMetricSpace`, `MeasurableSpace` and `BorelSpace`,
    which `μHE[k]` needs. Every theorem that uses them adds `IsRiemannianManifold`, so Hᵏ is that
    of d_g.
- Probes:
  - `‖v‖ ^ 2 = inner ℝ v v` on `TangentSpace I x`, so the norm is the Riemannian one.
  - `star A = ContinuousLinearMap.adjoint A` holds by `rfl`, so `IsStarProjection` means
    g_x-self-adjoint.
  - `ContinuousLinearMap.instMeasurableSpace` is the measurable structure on `F →L[ℝ] F`.
  - The tangent bundle carries a topology.
- The only elaborated type that changed is `exists_firstVariation_eq_riesz`, with the two new
  conjuncts.

## Adversarial pass

Values are computed by me.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Convention: operator-norm distance on G(E, k) | lines ℓ_θ, ℓ_0 of ℝ² | P_θ − P_0 = sin θ·[[−sin θ, cos θ],[cos θ, sin θ]]; the bracket is symmetric with trace 0 and det −1, eigenvalues ±1; norm \|sin θ\|, Frobenius √2\|sin θ\| | holds | none |
| `Euclidean.grassmannian` | G(ℝ,2); diag(1,1,0); wrong model P² = P | self-adjoint idempotents of ℝ are 0, 1 (ranks 0, 1): ∅; rank 2, so in G(ℝ³,2) and not in G(ℝ³,1); [[1,t],[0,0]]² = itself, norm √(1+t²) unbounded | rank and self-adjointness both needed | none |
| `grassmannBundle` | probe; h = diag(1,4), u = (1,1) | norm Riemannian, star = adjoint (`rfl`); h-projection e_1 ↦ (h(e_1,u)/h(u,u))u = u/5, Euclidean u/2 | depends on g as stated | none |
| 1.1 image-plane formula Q A⁻¹ Q* | L = diag(1,0), P = P_{ℓ_0}; P = P_{ℓ_{π/2}} | Q = diag(1,0), A = Q*Q + 1 − P = 1, result diag(1,0) = P_{ℓ_0}; at P_{ℓ_{π/2}}, A = diag(0,1) is singular | open-set statement holds | none |
| 1.1 comparison with `TauCeti.finiteGrassmannian` | e ↦ O∘e; rotation by φ | Φ_{Oe}(S) = e⁻¹O⁻¹P_S O e = Φ_e(O⁻¹S); ℓ_θ ↦ P_{ℓ_{θ−φ}}; frame (1,1) ↦ ½[[1,1],[1,1]], unnormalised [[1,1],[1,1]]² = 2[[1,1],[1,1]] | holds | none |
| `weight` / `Euclidean.weight` | horizontal and vertical lifts of H¹⌞(x-axis) | equal weights; test χ·tr(P diag(1,0)) integrates to ∫χ dH¹ and to 0 | weight does not determine V | none |
| `VarifoldTendsto` | j·δ_{(0,P)}; δ_{(je_1,P)} | masses j → ∞, no subsequence; masses 1, limit 0 | mass only lower semicontinuous | none |
| 2.1 normalisation and chart comparison | H¹⌞L, k = 1; φ = 2·id | λ⁻¹·2λ = 2 = θω_1; λ⁰·2λ → 0; λ⁻²·2λ → ∞; φ_*μ = ½H¹⌞L, θ/J = 1/2 | holds | none |
| `IsRectifiable` / `IsIntegral` (both carriers) | k = 0; k > dim; vertical lift | H⁰ = counting measure, V = Σθ(x)δ_{(x,0)}; bundle empty, V = 0 witnessed by U_j = ∅; planes vertical ≠ tangent line of every piece | determines v(Γ, θ); wrong model excluded | none |
| 2.3 weight of a C¹ graph | Σ = graph of \|t\|^{3/2} | ∫₋₁¹ √(1 + 9\|t\|/4) dt = (16/27)((13/4)^{3/2} − 1) = (26√13 − 16)/27 ≈ 2.879 > 2√2 ≈ 2.828 | holds | none |
| 3.1 push-forward | f = 2·id; f = t² on [−1,1]; f(y) = y_1, k = 2 | mass 2; ∫φ(t²)\|2t\| dt = 2∫₀¹φ; normDet(ℝ² → ℝ) = 0 and G_2(ℝ) = ∅, so f_#V = 0 | Jacobian needed | none |
| `Euclidean.blowUp` | V = v([0,1]×{0},1) | map under y ↦ y/λ is λH¹⌞([0,λ⁻¹]×{0}); times λ⁻¹ gives mass λ⁻¹; η_{0,μ}∘η_{x,λ} = η_{x,λμ} | scaling law holds | none |
| `firstVariation` / `Euclidean.firstVariation` | convention; unit circle, X = ψy | `cov X x v = ∇_v X`; tr(P∘∇X) = Σ_{i≤k} g(∇_{τ_i}X, τ_i) in an adapted orthonormal basis; div_{T_yC}X = 1, δ[C](X) = 2π = (d/dt)2πe^t at 0 | holds | none |
| `IsStationary`, `HasLocallyBoundedFirstVariation`, `firstVariationMass` | vertical lift; Lebesgue with constant line u | X_n = n⁻¹ψ sin(ny_2)e_2: ∂_2 X_n² on the axis = ψ(t,0), sup\|X_n\| ≤ 1/n, δV(X_n) = ∫ψ(t,0) dt; ∫∂_u⟨X,u⟩ dy = 0 | unbounded FV; stationary non-rectifiable | none |
| `exists_firstVariation_eq_riesz` | half hyperplane; v(L, 1 + y_1²); step multiplicity 1/2; k = 0 and k > N | δ[Σ](X) = −∫X¹ dH^{N−2}, η = −e_1; H = (2y_1/(1 + y_1²))e_1 tangential; δV(X) = −X¹(0), σ = δ_0, η = −e_1; δV = 0, H = 0, σ = 0 | holds; raw chart components not geometric | measurability of sections added |
| 4.4 dilation law | general; circle of radius R | D(Y∘η) = λ⁻¹(DY)∘η, so δV_{x,λ}(Y) = λ^{−k}·λ·δV(Y∘η); \|H\| = λ/R | holds | none |
| 4.5 two metrics | g = e^{4t}dt², h = 4g, V = δ_{(0,1)}, X = (1 − t²)² | Γ = ½g⁻¹g' = 2; div_gX(0) = 0 + 2·1 = 2; δ_hV^h = 2·2 = 4; LHS 2 > sup\|X'\| = 8/(3√3) ≈ 1.540; ‖h − g‖_{C⁰([−1,1])} = 3e⁴ ≈ 163.8 | Christoffel term needed | none |
| 5.1 first variation of C² Σ | S^k with X = ψx; graph of \|t\|^{5/2} | div_S x = k and −k∫⟨−x,x⟩ = kHᵏ(S^k); ∫φ'u'(1+u'²)^{−1/2} = −∫φu''(1+u'²)^{−3/2} = −∫⟨tr B, X⟩ dH¹ | sign pinned | none |
| 5.2 intrinsic vs ambient | helix on the unit cylinder | unit tangent cos α τ + sin α e_3; tr_S B = −cos²α ν = γ''/\|γ'\|² | trace over S, minus sign | none |
| `Euclidean.monotonicity_identity` | unit circle, x = 0, σ < 1 < ρ; line y_2 = a | LHS 2π/ρ; first term 2π; δV(X_t) = 2π for t > 1, 0 for t ≤ 1; second term −2π(1 − 1/ρ); RHS 2π/ρ. Line: both sides 2√(ρ² − a²)/ρ | holds; fails with a plus sign | none |
| 6.1 weighted identity | rederived | δV(X_ρ) = kI − ρI' + ρJ' + ∫φ(y − x)·P_S∇h dV, hence d/dρ(ρ^{−k}I) = ρ^{−k}J' + ρ^{−k−1}(∫φ(y − x)·P_S∇h dV − δV(X_ρ)) | README formula confirmed | none |
| `monotonicity_inequality` | derivation; S², k = 2 area; S², great circle | kI − tI' ≤ t‖δV‖(B_t) + kctI, c = (2/π)√κ ≤ √κ; f(ρ) = 2π(1 − cos ρ)/ρ², f(0+) = π > f(π/2) = 8/π ≈ 2.546; 2 ≤ 2 + 2(ρ − σ) | holds; curvature term needed | none |
| `monotoneOn_exp_mul_densityRatio` | backward Grönwall | g(σ) = f(ρ) + c∫_σ^ρ f ≥ f, (e^{cσ}g)' = ce^{cσ}(g − f) ≥ 0, so e^{cσ}f(σ) ≤ e^{cρ}f(ρ) | holds | none |
| `ae_hasDensity` | V = 0; θ(t) = e^{−1/\|t\|}; route | vacuous; ‖δV‖(B_ρ(0)) = 2e^{−1/ρ}, ‖V‖(B_ρ(0)) ≤ 2ρ²e^{−1/ρ}, ratio ≥ ρ^{−2}, Θ(0) = 0; doubling ratio ≥ (2r)⁻¹e^{1/(3r)}; S_1 ≤ f(ρ) + ½max(S_1, S_2) gives S_1 ≤ 2f(ρ) + S_2 | a.e., not everywhere | none |
| `hasDensity_and_limsup_le_of_firstVariationMass_le` | crossing lines; step multiplicity | Θ(0) = 2 ≥ 1; Θ(0) = (ρ + 2ρ)/(2ρ) = 3/2 < 2 = Θ(y > 0), with ‖δV‖(B_ρ(0)) = 1 > Λ·3ρ for small ρ | hypothesis needed | none |
| `one_le_upperDensity_of_mem_support` | v([−a,a]×{0},1), U = B_a(0); v(L, ½) | Θ = 1 on spt ∩ U; ‖V‖(B̄_{2a}(0)) = 2a < 4a = ω_1·2a when the ball leaves U; Θ = ½ when hθ fails | holds | none |
| `constancy` | sin(1/t) graph; g = e^{2t}dt²; V' = v(L,1) + δ_{(0,L)}; k > dim M | length ≥ ∫₁^∞\|cos u\| du = ∞, V = 0 with θ₀ = 0; δ[W](X) = ∫(e^tX)' dt = 0 with θ̃ = 1 while (θ̃w)' = e^t; Θ(0) = ∞ and δV'(ψy_1e_1) = 0 + 1 = 1; no immersion, vacuous | holds | none |
| 6.5 convex hull | catenoid piece, h = 1 | area 2π(1 + sinh 1 cosh 1) ≈ 2π·2.813 ≈ 17.67; cosh x₃ ≤ cosh 1 ≈ 1.543 on Σ; neck ρ = 1 inside | holds | none |
| `Euclidean.IsVarifoldTangent`, `exists_isVarifoldTangent` | vertical lift at 0; atom, k = 1; x near ∂W | blowUp V 0 s = V, Θ = 1, ‖δV‖(B_ρ) = ∞; Θ = lim 1/(2ρ) = ∞, excluded by hθ; early blow-ups may be infinite on compacts (x + sK ⊄ W), the tail is finite | holds | none |
| `IsVarifoldTangent.isStationary` | ball masses; μ = (1 + ½ sin(log r) cos ϑ)dr dϑ; non-measurable A | ‖C‖(B_ρ) ≤ θω_kρ^k ≤ ‖C‖(B̄_ρ), with equality by monotone limits; μ(B_ρ) = 2πρ but λ⁻¹∫_{B_λ}cos ϑ dμ = (π/4)(sin log λ − cos log λ) = −π/4 at λ = 1 and π/4 at λ = e^π; the dilation is a homeomorphism, so outer measures agree | holds | none |
| `isRectifiable_of_ae_density_pos` | Lebesgue with constant line; vertical lift | stationary, Θ = 0, not rectifiable; Θ = 1, not rectifiable, hV false | hypotheses needed | none |
| `rectifiable_compactness` | alternating lines y_2 ∈ {0, 1}; zigzags | test integrals alternate 1, 0; i = 2: ‖δV‖ = √2 + 2, in general √2(i − 1) + 2 → ∞; limit fibre ½δ_{P+} + ½δ_{P−}, not rectifiable | subsequential form; FV bound needed | none |
| `integral_compactness` | v(L,1) + v(L_i,1); ½v(L,1) | → v(L,2); input not integral, limit not integral | holds | none |
| `IsVarifoldTangent.isRectifiable` | ½v(L,1); step multiplicity, k = 1 | hlow fails (Θ = ½) and the conclusion still holds; ρ⁰‖δV‖(B_ρ(0)) = 1 does not tend to 0 | sufficient, not necessary | none |
| `IsVarifoldTangent.isIntegral` | v(P_1,1) + v(P_2,1); integral V | a cone of density 2; {Θ* < 1} is ‖V‖-null, so 8.1 applies | holds | none |
| `unitBallVolume`, `densityRatio`, `HasDensity`, `upperDensity` | ω_1, ω_2; atom; triple junction | 2, π; 1/(ω_kρ^k) → ∞; 3ρ/(2ρ) = 3/2 | holds | none |
| 7.5 Checks | disc of radius r; δ threshold | arc length 4r arcsin(ρ/(2r)) ≥ 2ρ, ratio ≥ 2ρ/(πρ²/2) = 4/(πρ); 3/2 + 3.5δ < 2 iff δ < 1/7 | holds | none |
| Conventions: k > N | each theorem | empty bundle, V = 0; constancy vacuous; identity 0 = 0 since η·σ vanishes on W | true | sentence added |

## Unresolved

- **9.4 (statement-level acceptance tests).** These two literature statements are "neither targets
  nor headline theorems"; the package review accepted them as tests of the definitions. A reviewer
  may still ask why a roadmap section states theorems it does not plan to prove. I kept the
  accepted decision.
- **Licence questions** raised by the package review for humans: AgnolettoCorreaHoyosDaSilvaNardulli2025
  is an arXiv preprint, and Simon1983 is read from the ANU institutional copy. They are still open.
- **Paywalled sources.** Allard1972, Federer1969 and Maggi2012 are uncertified. They are cited by
  section only, always beside a certified source or a route of this roadmap's own.
- **Not statable at the pins**, each recorded in the module docstring with the carrier it lacks:
  the Riemannian forms of 7.2, 8.1 and 8.2; the varying-metric forms of 7.4 and 7.6; 5.2; and 9.3.
- **Newer main.** The tool index refers to main at `2b9ce21`, newer than this branch's base
  `0f9f711`. The citation resolver checked against `2b9ce21` and found every citation, and that main
  has no Varifolds folder. No rebase was attempted.
- No suspicious instruction was found in the package, the review reports or the other roadmaps read.


Pull request: #2443 (roadmap/varifolds at a85c365)
