# PKG-Varifolds: package report

Deliverables: `packages/Varifolds/README.md` (2115 lines, from the accepted design with the changes
below), `packages/Varifolds/Suggested.lean` (545 lines, 25 definitions and instances, 15 theorems),
`packages/Varifolds/metadata.toml` (`topic = "math.DG"`, as `TauCetiRoadmap/GeometricCurrents/metadata.toml`).
`packages/Varifolds/sources.toml` and the `gaps` list of `packages/Varifolds/design/plan.json` are
unchanged: no new work is cited (Simon1983 §11, used for the C¹-piece form of rectifiability, is
already within its recorded locator and its `cited_for` 2.2), and no supplier gap is needed (every
input is stated by its owner on main or at the pins).

## Headline theorems

The Summary names the end theorems. Each is listed with its status at the pins (Mathlib `1b1ccf4b`,
Tau Ceti `2fd255d9`).

| Headline (README) | Status | Lean name |
|---|---|---|
| Riesz decomposition of δV into H_V, σ_V, η_V (4.4), on (M, g) | stated | `exists_firstVariation_eq_riesz` |
| Euclidean monotonicity identity (6.1) | stated | `Euclidean.monotonicity_identity` |
| Riemannian monotonicity inequality and its exponential form (6.2) | stated | `monotonicity_inequality`, `monotoneOn_exp_mul_densityRatio` |
| Existence of densities a.e.; existence everywhere and upper semicontinuity under a ratio bound; lower bound on the support (6.3) | stated | `ae_hasDensity`, `hasDensity_and_limsup_le_of_firstVariationMass_le`, `one_le_upperDensity_of_mem_support` |
| Constancy theorem (6.4), on (M, g) | stated | `constancy` |
| Varifold tangents (7.2), Euclidean | stated | `Euclidean.exists_isVarifoldTangent`, `Euclidean.IsVarifoldTangent.isStationary` |
| Varifold tangents (7.2), Riemannian | not statable: needs the varifold push-forward of 3.1 along d(λ⁻¹ log_x) (image-plane map between fibres, k-Jacobian weight); the pins have `TauCeti.Manifold.riemannianLog` but no push-forward of measures on Grassmann bundles | — |
| Allard's rectifiability theorem (7.3), on (M, g) | stated | `isRectifiable_of_ae_density_pos` |
| Compactness of rectifiable varifolds (7.4), fixed metric, on (M, g) | stated | `rectifiable_compactness` |
| Integral compactness (7.6), fixed metric, on (M, g) | stated | `integral_compactness` |
| 7.4 and 7.6 for metrics g_i → g in C² | not statable: the metric is the instance `Bundle.RiemannianBundle`; a sequence of metrics on one manifold with their Grassmann bundles and 1.2's identification has no carrier | — |
| Rectifiable tangent cones (8.1), Euclidean | stated | `Euclidean.IsVarifoldTangent.isRectifiable` |
| Integral tangent cones (8.2), Euclidean | stated | `Euclidean.IsVarifoldTangent.isIntegral` |
| 8.1, 8.2 on (M, g) | not statable: same missing push-forward as 7.2 | — |
| Intrinsic against ambient for M ⊆ ℝ^L (5.2) | not statable: the push-forward ι_# into W × G(ℝ^L, k) and B_M as a tensor on TM are not at the pins (`TauCeti.secondFundamentalForm` is the form of a map out of a normed space) | — |
| Identification of GeometricCurrents G6's auxiliary varifold (9.3) | not statable: no integral currents or auxiliary varifold in Mathlib or Tau Ceti | — |

The definitions kept, each with a real body on native carriers: `grassmannBundle` (with its Borel
structure `grassmannBundle.instMeasurableSpace`, `grassmannBundle.instBorelSpace`), `weight`,
`IsRectifiable`, `IsIntegral`, `firstVariation`, `IsStationary`, `HasLocallyBoundedFirstVariation`,
`firstVariationMass`, `unitBallVolume`, `densityRatio`, `HasDensity`, `upperDensity`,
`VarifoldTendsto`, and in `Euclidean`: `grassmannian`, `weight`, `IsRectifiable`, `IsIntegral`,
`blowUp`, `firstVariation`, `IsStationary`, `HasLocallyBoundedFirstVariation`,
`firstVariationMass`, `IsVarifoldTangent`. No sorry'd data, no `set_option`, imports `Mathlib` and
three Tau Ceti modules (`…Geodesic.Normal.Basic`, `…Curvature.Sectional`, `…LeviCivita.Regularity`),
all with object files at the pin.

Two carrier choices, recorded in the README Conventions ("Lean carriers"): the Riemannian
statements take W = M (an open subset with `Bundle.ContMDiffRiemannianMetric.restrictOpenTangentSpace`
is a Riemannian manifold; its small geodesic balls agree with those of M); rectifiability is stated
in the C¹-piece form (countably many injective C¹ immersions of open sets of ℝ^k carrying the weight,
planes the tangent planes of the pieces), proved equivalent to v(Γ, θ) in the new bullet of 2.2 from
Simon1983 line 2204–2207 (11.1). For the Euclidean-only statements the README registers the
Euclidean form in the section ("For W open in E … is `Euclidean.…`"), and for 7.4/7.6 the
fixed-metric form, so README and Lean have the same generality.

## What the README could not support; notions moved down

Nothing is unsupported; no notion was moved down from a later roadmap (all suppliers are on main:
GeometricCurrents, GeometricMeasureTheory, RiemannianGeometry, HopfRinow under `Completed/`).

## Corrections to the design (all recorded in the README)

1. 6.3 lower bound: hypothesis "V rectifiable with Θ ≥ 1 a.e." replaced by "Θ ≥ 1 ‖V‖-a.e."
   (REV-DESIGN-Varifolds~14's remark that rectifiability is not used, applied). The statement is
   strictly more general; under the ratio bound such V is rectifiable on U anyway by 7.3.
2. 6.2 stated with open balls (Scharrer2022 uses closed balls), with the equivalence argument in the
   README; this matches `firstVariationMass` on open sets.
3. 6.1: the extension δV(1_{B_t}(y − x)) is written out through a representation (H, σ, η) of δV
   with |η| ≤ 1; the identity holds for every such representation.
4. 6.4: the conclusion is also given in the equivalent "weight and planes" form with Σ = ι(N), ι a
   C² embedding of a connected k-manifold.
5. 4.3: ‖δV‖(U) is now defined for every varifold as a supremum over C¹ fields (`firstVariationMass`),
   with the C⁰/C¹ approximation argument.
6. Conventions: a limit of varifolds is required to be Radon (without it, a measure infinite on a
   compact set "converges" through the junk value 0 of non-integrable integrals; see the table).
7. 6.2 Checks: added a discriminating Check (the volume of S², k = 2) that the curvature term
   cannot be dropped.
8. 2.2: the C¹-piece characterisation with two discriminating Checks (vertical lift; Dirac
   varifold and figure-eight image).

## Duplication sweep and ownership

By object, against main, the open roadmap pull requests at their heads (`roadmaps grep` for
"varifold", "Allard", "Grassmann bundle", "monotonicity formula", "first variation", "constancy
theorem", "tangent cone") and the pins (grep of both libraries for varifold, measure densities
Θ^k, approximate tangent planes). No target of the design exists elsewhere, so nothing was deleted.
Varifold text exists only on main (GeometricCurrents G6, GeometricMeasureTheory line 12,
RiemannianGeometry/MinimalSurfaces); the open hits for "first variation" (FourManifolds,
TeichmullerGeometry, ManifoldOptimization, SmoothBundlesConnections) are energy or length
variations, and "monotonicity formula" in GaugeQuiltFieldTheory is unrelated. The closest open
roadmap, GaussianIsoperimetryAndClusters, owns weighted perimeter and Gaussian isoperimetry and
nothing varifold-shaped.

Citations added or ownership narrowed (no target removed):

- Second fundamental form of a submanifold of a Euclidean space: Tau Ceti
  `TauCeti.secondFundamentalForm` (`TauCeti/Analysis/InnerProductSpace/SecondFundamentalForm.lean:82`);
  the Scope now limits this roadmap's B to a Riemannian ambient and cites Tau Ceti for E (5.1, 5.2).
- Induced metric of 5.2: `TauCeti.inducedRiemannianMetric` (`TauCeti/Geometry/Manifold/Riemannian/Induced.lean:62`).
- Normal balls: `TauCeti.Manifold.riemannianExp`, `TauCeti.Manifold.riemannianLog`,
  `TauCeti.Manifold.IsNormalDomain`, `TauCeti.Manifold.exists_isNormalDomain_ball`
  (`…/Geodesic/Normal/Basic.lean:89, 163, 225`), `TauCeti.Manifold.IsNormalDomain.image_riemannianExp_ball`
  (`…/Geodesic/Gauss/Distance.lean:251`): HopfRinow Layers 1–2 at the pin, now cited in 6.2–6.3.
- Sectional curvature: `CovariantDerivative.sectionalCurvature`
  (`TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Sectional.lean:77`).
- Mathlib `MeasureTheory.Measure.support` (`Mathlib/MeasureTheory/Measure/Support.lean:59`),
  `Manifold.IsSmoothEmbedding` (`Mathlib/Geometry/Manifold/SmoothEmbedding.lean:70`), `Metric.eball`.
- Boundary with MinimalSurfaces: its Scope and 3.1 (main, line 86 and 709) attribute "monotonicity
  for stationary varifolds" to GeometricCurrents G6, whose text (line 679–689) scopes it to the
  auxiliary varifold of an integral current. The Scope now says so: G6's statement is the case of 9.3,
  the general one is 6.1–6.2 here. No Hessian comparison of the distance function is at the pin
  (no `cot` comparison in Tau Ceti's Riemannian files), so RiemannianGeometry R4 item 1 (main line
  2311) stays the supplier.

Ownership against open pull requests was checked through `roadmaps grep` over the heads of the
open roadmap pull requests (index of 2026-11-16) and `roadmaps resolve` (454 heads); the overlap
report lists no pull request changing this roadmap, no dropped id and no second copy. No declaration
of `Suggested.lean` reuses a qualified name of another roadmap (all are under
`TauCetiRoadmap.Varifolds`).

## Citations and library names

`roadmaps resolve packages/Varifolds/README.md`: "Cross-roadmap citations found nowhere: None.
Lean names found nowhere: None." It did not check names outside TauCetiRoadmap on this host, so all
86 library identifiers backticked in the README were checked at the pins: 73 by `#check` in one
scratch file importing the cited Tau Ceti modules (with `LinearMap.normDet_comp` for the unqualified
`normDet` and `normDet_comp` of the Mathlib contract), and the 11 in modules without object files
(`Distribution.HasLocallyFiniteMass`, `Distribution.massMeasure`, `Distribution.massMeasure_preimage_coe`,
`Distribution.enorm_apply_le_lintegral_massMeasure`, `TauCeti.isCompact_closure_of_isTightMeasureSet_of_mass_le`,
`TauCeti.CountablyRectifiable` and its four lemmas, `TauCeti.secondFundamentalForm`) by their
declarations in the source. One fix: `RiemannianBundle` → `Bundle.RiemannianBundle`.
The gate's identifier rule: a script over the README found no backticked name of this roadmap's
own that `Suggested.lean` does not declare, and every one of the 40 declarations appears in the
README in its own code span.

## Elaboration

`lake env lean packages/Varifolds/Suggested.lean`, run from the content checkout: exit 0, exactly
15 warnings, all `declaration uses 'sorry'` (one per theorem), no other message.

`#check` comparison: all 40 declarations were `#check @`-ed in one scratch copy and the elaborated
types compared with the README statements. Every Riemannian theorem carries `[I.Boundaryless]`,
`[SecondCountableTopology M]`, `[IsRiemannianManifold I M]`, `[BorelSpace M]`,
`[IsContMDiffRiemannianBundle I ∞ E …]`, `[IsFiniteMeasureOnCompacts V]` and `1 ≤ k`; every Euclidean
theorem `[BorelSpace F]`, `[IsFiniteMeasureOnCompacts V]` and `1 ≤ k`; definitions keep only what
their bodies use. Instance sanity checks in the same file: `‖v‖² = ⟪v, v⟫` on `TangentSpace I x`
(the norm and inner product both come from `Bundle.RiemannianBundle`; the model space has no inner
product in context), and `BorelSpace (W × Euclidean.grassmannian F k)` is found. Nothing changed
after the comparison.

## Dependency check

    depcheck: 242 roadmaps, 2261 edges, 0 problem(s)

No UPWARD, CYCLE or moved line; Varifolds is at line 434 of the merge order and every supplier is
on main.

## Adversarial pass

Values computed this round. Units: ω_1 = 2, ω_2 = π; Θ is the k-density.

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| `grassmannBundle` | k = 0, k = N; h = diag(1, 4) on ℝ², P_e = ½[[1,1],[1,1]] | k = 0: {(x, 0)}; k = N: {(x, 1)}; h-adjoint of P_e is h⁻¹P_eᵀh = ½[[1, 4], [¼, 1]] ≠ P_e, so the Euclidean projection is excluded for h | sound | none |
| `Euclidean.grassmannian` | G(ℝ, 2); [[1, t], [0, 0]]; diag(1, 1, 0) | ∅ (ranks 0, 1 only); idempotent but adjoint [[1, 0], [t, 0]] ≠ it for t ≠ 0, excluded; in G(ℝ³, 2), trace 2 | sound | none |
| `weight` / `Euclidean.weight` | δ_{(x,P)}; v(L, 1) on W = B_1(0) ⊆ ℝ² | δ_x; H¹⌞(L ∩ W), mass 2 | sound | none |
| `IsRectifiable` (both) | v(L, 1); vertical lift of H¹⌞L; δ_{(0,P)}, k ≥ 1; k = 0 | f(t) = te_1, θ = 1: holds; pieces carrying H¹⌞L have horizontal tangent at H¹-a.e. point, V-a.e. plane vertical: fails; δ_0 ≠ θH¹⌞Γ since H¹({0}) = 0: fails; k = 0: ℝ⁰ a point, μHE[0] counting, planes {0} = range 0: Σθ(x)δ_{(x,0)} | sound | README 2.2 bullet and two Checks added |
| `IsIntegral` | v(L, 2); v(L, ½) | θ = 2 ∈ ℕ; density of the weight w.r.t. H¹ is ½ a.e., no ℕ-valued θ | sound | none |
| `Euclidean.blowUp` | v([0, 1] × {0}, 1), x = 0 | mass s⁻¹·1 = mass of v([0, s⁻¹] × {0}, 1); without s^{−k}: 1 | sound | none |
| `firstVariation` (both) | unit circle C, X = ψy (flat); k = 0; vertical lift, X = ψy_2e_2 | div = 1, δ = 2π = d/dt(2πe^t)|₀; P = 0 gives trace 0, δV = 0; div_S X = ψ on the axis, δV = ∫ψ ≠ 0 although X = 0 on the support | sound | none |
| `firstVariationMass` | stationary V; [C]; vertical lift | X = 0 admissible, value 0, so 0; sup over |X| ≤ 1 of −∫⟨H, X⟩ = H¹(C ∩ U); nX_n has |·| ≤ 1 and δ = n∫ψ → ∞, so ∞ | sound | README 4.3 defines it for every V |
| `unitBallVolume`, `densityRatio`, `HasDensity`, `upperDensity` | k = 0, 1, 2; H¹⌞L; δ_x, k = 1; ρ ≤ 0 | ω_0 = 1 (ℝ⁰ is a point), ω_1 = 2, ω_2 = π; 2ρ/(2ρ) = 1; 1/(2ρ) → ∞, so `HasDensity … ∞`; ofReal ρ = 0, empty ball, 0/0 = 0 in [0, ∞], outside 𝓝[>] 0 | sound | Conventions record that a density may be ∞ |
| `VarifoldTendsto` | δ_{(1/j,P)}; δ_{(je_1,P)}; V_i = 0 with V' = ∞·δ_p | → δ_{(0,P)}; → 0, mass 1 to 0; ∫f dV' is the junk 0 (non-integrable) for every f, so "converges" | sound only with a Radon limit | `IsVarifoldTangent` and both compactness theorems require `IsFiniteMeasureOnCompacts` of the limit; Conventions say so |
| 4.4 `exists_firstVariation_eq_riesz` | circle; half-line (0, ∞) × {0}; step multiplicity 1 | 2; stationary | H = −y, σ = 0, ‖δV‖(U) = H¹(C ∩ U) = ∫_U |H|; δV(X) = ∫_0^∞ ∂_1X¹ = −X¹(0) = ⟨−e_1, X(0)⟩: σ = δ_0, η = −e_1; δV(X) = X¹(0) − 2X¹(0) = −X¹(0), same σ, η, ‖δV‖(U ∋ 0) = 1 = σ(U); H = 0, σ = 0, ‖δV‖ = 0 | sound | none |
| 6.1 `Euclidean.monotonicity_identity` | unit circle, x = 0, σ < 1 < ρ; line y_2 = a, σ < a < ρ; V = 0 | left 2π/ρ; right 2π − ∫_1^ρ t^{−2}·2π dt = 2π − 2π(1 − 1/ρ) = 2π/ρ (−∫⟨H, y⟩ = +2π, H = −y); left 2√(ρ² − a²)/ρ, right ∫ a²(t² + a²)^{−3/2} dt over |t| < √(ρ² − a²) = 2√(ρ² − a²)/ρ, no first-variation term; 0 = 0, and any (H, σ, η) representing 0 has ησ = 0 as a vector measure, so the t-term is 0 | sound; sign pinned (a + sign gives 2π + 2π(1 − 1/ρ)) | README states the extension through (H, σ, η) |
| 6.2 `monotonicity_inequality` | S², κ = 1, great circle, ρ_0 = π/2; S² volume, k = 2, σ = 0.1, ρ = π/2; flat, unit circle, σ = 2, ρ = 4 | 2 ≤ 2 + 2(ρ − σ); f(0.1) = 3.1390 ≤ f(π/2) + ∫2f = 2.5465 + 8.5974 = 11.1438, while without the curvature term 3.1390 ≤ 2.5465 fails; 2π/2 = 3.1416 ≤ 2π/4 + 2π log 2 = 5.9260 | sound; curvature term necessary | Check added; open balls |
| 6.2 `monotoneOn_exp_mul_densityRatio` | S² volume, Λ = 0, κ = 1, k = 2; derivative at ρ = 1 | e^{0.2}f(0.1) = 3.834 ≤ e^{π}f(π/2) = 58.93; 2f(1) = 5.777 > |f′(1)| = 0.489 | sound | none |
| 6.3 `ae_hasDensity` | v(L, θ), θ = e^{−1/|t|}; δ_{(x,P)} | Θ(0) = 0 exists (‖V‖(B_ρ(0)) ≤ 2ρ²e^{−1/ρ}, ratio ≤ ρe^{−1/ρ} → 0), θ(t) finite on L; Dirac has Θ = ∞ but fails `HasLocallyBoundedFirstVariation` (δV depends on DX(x)) | sound | none |
| 6.3 `hasDensity_and_limsup_le_…` | two crossing lines, Λ = 0; step multiplicity | Θ(0) = 2 ≥ limsup Θ(y) = 1; ‖δV‖(B_r(0)) = 1 > Λ·2r·(3/2) for small r, no Λ: hypothesis fails, and indeed Θ(0) = 3/2 < limsup = 2 | sound | none |
| 6.3 `one_le_upperDensity_of_mem_support` | triple junction; v(L, ½); v([−a, a] × {0}, 1), U = B_a(0) | Θ(0) = 3/2 ≥ 1; hθ fails (Θ = ½); Θ(0) = 1 | sound | hypothesis generalised to Θ ≥ 1 a.e. |
| 6.4 `constancy` | v(L, 3); two parallel lines; plane ∖ {0} in ℝ³ (k = 2); sin(1/t) graph; ℝ with e^{2t}dt², V = [ℝ] | θ_0 = 3, closed; N disconnected, excluded by `ConnectedSpace N`; spt = plane ⊄ range ι, excluded (with only ‖V‖(Σᶜ) = 0 the closedness conclusion would fail); only V = 0, θ_0 = 0; weight e^t dt = H¹ for d_g, θ_0 = 1 | sound | none |
| 7.2 `Euclidean.IsVarifoldTangent.isStationary` | crossing lines at 0; triple junction; Lebesgue with a constant line, k = 1; polar density 1 + ½ sin(log r)cos ϑ | ‖C‖(B_ρ) = 4ρ = 2·ω_1·ρ, ‖C‖(sB_1) = 4s = s·4; 3ρ = (3/2)·2·ρ; Θ = 0, C = 0; ball masses 2πρ, angular test (π/4)(sin log λ − cos log λ) = −π/4 at 1, π/4 at e^π: not a stationary weight | sound | none |
| 7.2 `Euclidean.exists_isVarifoldTangent` | v(L, 1), x ∈ L | λ^{−1}‖V‖(B_{λR}(x)) = 2R bounded, limit v(L − x, 1) | sound | hV, hδ unused by this statement (P3) |
| 7.3 `isRectifiable_of_ae_density_pos` | Lebesgue with constant line; vertical lift; triple junction | Θ = 0: hypothesis fails; hV fails; three rays as pieces, θ = 1 | sound | none |
| 7.4 `rectifiable_compactness` | lines y_2 = 0 / 1 alternating; zigzags amplitude 1/i; circles radius 1/i | test integrals alternate 1, 0, subsequences converge; ‖δV_i‖ = √2(i − 1) + 2 → ∞, hmass fails; masses 2π/i → 0, ‖δV_i‖ = 2π bounded, limit 0 rectifiable | sound | Radon limit required |
| 7.6 `integral_compactness` | v(L, 1) + v(L_i, 1); ½v(L, 1); segments of 7.1 | → v(L, 2), integral; not integral input; ‖δV_i‖ = 2i, hmass fails | sound | density hypothesis dropped as implied (B_i = ∅) |
| 8.1 `Euclidean.IsVarifoldTangent.isRectifiable` | ½v(L, 1); crossing planes | ρ^{−1}·‖V‖(B_ρ ∩ {Θ* < 1}) = ρ^{−1}·ρ = 1 ↛ 0: hypothesis fails, cone still rectifiable (sufficiency only); C = V, blowUp C 0 s = C | sound | none |
| 8.2 `Euclidean.IsVarifoldTangent.isIntegral` | v(P_1, 1) + v(P_2, 1); C_{p,q} | integral cone, density 2; own tangent cone | sound | none |
| 2.2 C¹-piece equivalence (README) | figure-eight; overlapping pieces | two immersed intervals meeting at an H¹-null point, θ = 1; at H¹-a.e. point of an overlap the tangent planes agree, so "some j" is ‖V‖-a.e. unambiguous | sound | new bullet |
| 6.2 open/closed balls (README) | S² great circle | ‖V‖(B_ρ) = ‖V‖(B̄_ρ) = 2ρ; closed-to-open by s ↑ σ, ρ' ↑ ρ, spheres charged for countably many t | sound | new sentence |

Context check (item 2): every theorem's standing hypotheses were read off the `#check` output
(above). Generality (item 3): README and Lean agree after the registrations listed; the Lean
Riemannian statements take W = M, the README says why this loses nothing. Vacuity (item 6): every
theorem's hypotheses tie the data to V (representation of δV, density of ‖V‖, support of ‖V‖); the
one junk-value route found (non-Radon limits) is closed. Unused hypotheses (P3, no change): `hV` in
`monotonicity_inequality` (the inequality in [0, ∞] is trivial when ‖δV‖ is infinite);
`hV`, `hδ`, `hx` in `Euclidean.exists_isVarifoldTangent` (only the density bound is used).
Measurability of the sections H_V, η_V is not asserted in `exists_firstVariation_eq_riesz` (no
native measurability for sections of `TangentSpace`); the open-set identity and σ ⟂ ‖V‖ pin them
(P3).

## Sources

No source was fetched; `scratch/needs-references.toml` was not created. Locators re-read this
round: Scharrer2022 line 1120–1127 (Lemma 3.3, closed balls, t^{−m}, m∫(1 − a)/r) and line
1184–1203 (Remark 3.4, the bound by m√b‖V‖ for t < π/(2√b)); Simon1983 line 2204–2207 (11.1) and
line 7550–7556 (40.5). Federer1969, Allard1972 and Maggi2012 remain settled as uncertified.

## Notes for reviewers

- The two licence questions of REV-DESIGN-Varifolds~14 (Simon1983 host terms; the arXiv-only
  AgnolettoCorreaHoyosDaSilvaNardulli2025) are unchanged.
- REV-DESIGN-Varifolds~14's source issue (Simon1983 41.1 should require M ∩ U connected) is
  consistent with 6.4, which requires Σ connected and `ConnectedSpace N` in Lean.
- README notation: no TeX brace syntax (`_{…}`, `^{…}`) remains outside code. Exponents and simple
  subscripts are Unicode (λ⁻ᵏ, ℝᵏ⁺¹, c²ᵏ, B_ρ₀, Aᵢⱼ, ∫₋₁¹); compound subscripts, and the formulas
  that carry them, are code spans (`V_{x,λ}`, `δ_{(x,P)}`, `P_{ℓ_θ}`, `C_{p,q}`, `Θ^{*k}`). No
  statement, Check or citation changed and the line count is the same; the README text scans (tex,
  latex, residue, readme-ids-missing and the rest of the folder scan) report 0, `roadmaps resolve`
  finds no unresolved citation or name, and the dependency check output above is unchanged.
- No suspicious instruction was found in any text read.
