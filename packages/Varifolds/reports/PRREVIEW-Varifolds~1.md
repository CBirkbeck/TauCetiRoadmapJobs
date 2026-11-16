# Review of Varifolds (pull request #2443 at a85c365)

**Verdict:** needs changes

## R01 (P3) — The docstring names a missing extended distance that the pins supply

**Location:** `TauCetiRoadmap/Varifolds/Suggested.lean` lines 46–50: "Missing are an `EMetricSpace` instance on these copies, over which the definitions of this file are stated (the Riemannian distance of `IsRiemannianManifold`, …), and the identification of §1.2"

**Claim:** At the pins, `TauCeti.WithMetric g` gets the Riemannian extended distance together with `IsRiemannianManifold`. `g_i → g` in C² is also at the pin. Only §1.2's identification is missing.

**Witness:** `Mathlib/Geometry/Manifold/Riemannian/Basic.lean:546` `EMetricSpace.ofRiemannianMetric`, with the `IsRiemannianManifold` instance at lines 533–537. A scratch file whose `letI` uses it and proves `IsRiemannianManifold I (TauCeti.WithMetric g)` by `inferInstance` elaborates. C² convergence is `Bundle.ContMDiffRiemannianMetric.chartC2Topology`.

**Repair:** Replace the sentence from "Missing are an" to "is read;" with: "On each copy, `EMetricSpace.ofRiemannianMetric` gives the Riemannian extended distance with `IsRiemannianManifold`, and `C²` convergence of metrics is `Bundle.ContMDiffRiemannianMetric.chartC2Topology`. What is missing is the identification of §1.2 between the Grassmann bundles of two metrics, through which `V_i → V` is read;"

## R02 (P3) — Layer 3 section comment does not carry the README's layer title

**Location:** `TauCetiRoadmap/Varifolds/Suggested.lean` line 179: `/-! ## Layer 3: dilations -/`

**Claim:** The section comments must use the README's layer titles. The other six do; this one does not.

**Witness:** `TauCetiRoadmap/Varifolds/README.md` line 779: `## Layer 3: push-forward, blow-ups and tangent spaces`.

**Repair:** Replace line 179 with `/-! ## Layer 3: push-forward, blow-ups and tangent spaces -/`.

## R03 (P3) — The description's dependency paragraph names no supplier

**Location:** Description: "Dependencies (the roadmaps the README cites by name and section, and what they in turn need; the Lean imports none of them). … Roadmaps on main are cited by name; …"

**Claim:** The paragraph introduces a list of the roadmaps the README depends on, but names none. A reader cannot tell what this new roadmap depends on.

**Witness:** The README's `## Exact supplier contracts` (lines 350–396, the roadmap subsections) consumes GeometricMeasureTheory G2, GeometricCurrents G1/G2/G5/G6, RiemannianGeometry R4/R5a/R5a.2 and HopfRinow (Completed) Layers 0–2.

**Repair:** Replace the paragraph with: "Dependencies, all on main (the Lean imports none of them): GeometricMeasureTheory G2; GeometricCurrents G1, G2, G5, G6; RiemannianGeometry R4 item 1, R5a, R5a.2; HopfRinow (Completed) Layers 0–2. RiemannianGeometry/MinimalSurfaces 3.3 is cited as an owner and not consumed. Varifolds, Part II is a consumer."

## Verified sound

| Statement | Instances tried | Values, one side | Values, other side | Result | Change |
|---|---|---|---|---|---|
| 1.2 Grassmann bundle | h = diag(1,4), u = (1,1) on ℝ²; h = 4g | h-projection sends e₁ to u/5, Euclidean to u/2 | for h = 4g both give u/2 | holds; Simon1983 line 7301–7305, Agnoletto line 151–156 support it | none |
| 1.3 weight, mass | horizontal vs vertical lift of H¹⌞axis; test χ·tr(P diag(1,0)) | equal weights H¹⌞axis; integrals ∫χ dH¹ vs 0 | mass on open unit disc 2 | holds; Simon1983 line 7308–7317 | none |
| 2.1 approximate tangent space | μ = H¹⌞L; Lebesgue (k = 1); δ₀; φ(y) = 2y | μ_{x,λ}(B₁) = 2, so θ = 1; πλ → 0; λ⁻¹ → ∞ | φ_*μ = ½H¹⌞L, θ/J = 1/2 | holds; Simon1983 11.8 line 2352–2364 | none |
| 2.3 [Σ] | graph of \|t\|^{3/2} on (−1,1); unit circle | H¹ = (26√13 − 16)/27 ≈ 2.879 | inscribed polygon 2√2 ≈ 2.828; circle mass 2π | holds; Simon1983 line 2861–2867, EdelenSpolaor2023 line 130 | none |
| 3.2 dilations | v([0,1]×0, 1); great circle on S² | 𝐌(V_{0,λ}) = λ⁻¹ = λ⁻ᵏ𝐌(V) | ‖V_{x,λ}‖(B_ρ(0)) = 2ρ for λρ < π | holds; Simon1983 line 7336–7338, 3407–3413 | none |
| 4.3 stationary, locally bounded first variation | vertical lift, X_n = n⁻¹ψ sin(ny₂)e₂; Lebesgue with constant line | sup\|X_n\| ≤ n⁻¹ sup ψ | δV(X_n) = ∫ψ(t,0)dt for all n; constant line ∫tr(P DX) = 0 | holds; Simon1983 39.3 line 7474–7486 | none |
| 4.4 Riesz decomposition | half hyperplane; v(L, 1 + y₁²) | δ[Σ](X) = −∫X¹ dH^{N−2}, so η = −e₁ | H = (θ′/θ)e₁, tangential, σ = 0 | holds; sign agrees with Simon1983 39.4 line 7486–7509 | none |
| 4.5 two metrics | g = e^{4t}dt², h = 4g, V = δ_(0,1), X = (1 − t²)² | left side \|4 − 2\| = 2 | derivative-only bound 8/(3√3) ≈ 1.54 < 2; Agnoletto line 1802–1803 unproved | holds | none |
| 5.2 ambient comparison | unit cylinder: vertical line, horizontal circle, helix at angle α | tr_S B_M = 0, −ν, −cos²α ν | curvature in ℝ³: 0, −ν, γ″/\|γ′\|² = −cos²α ν | holds; Simon1983 9.6, 16.4, 41.2(3) | none |
| 6.5 convex hull | segment with K its endpoints; circle with K = {0}; catenoid piece | segment inside hull; circle has H = −y ≠ 0 off {0} | cosh x₃ ≤ cosh h: inside the solid cylinder | holds; Simon1983 19.1–19.2 (rectifiable) | none |
| 7.1 lower density bounds | i segments of length 1/(2i); ½v(L,1) | ‖δV_i‖ = 2i → ∞, limit density ½ | ½v(L,1): density ½, hypothesis fails | holds; Simon1983 40.6 line 7566–7579 | none |
| 7.2 varifold tangents | density 1 + ½ sin(log r) cos ϑ; vertical lift | μ(B_ρ) = 2πρ; λ⁻¹∫_{B_λ} cos ϑ dμ = −π/4 at λ = 1, π/4 at λ = e^π | vertical lift: V_{0,λ} = V, Θ = 1, δV(φy₂e₂) = ∫φ > 0 | holds; Simon1983 42.1–42.3 | none |
| 7.4 rectifiable compactness | lines y₂ ∈ {0,1} alternating; zigzag i = 2 | test integrals 1, 0, 1, …; subsequences converge | ‖δV₂‖ = √2 + 2; limit fibre ½δ_{P+} + ½δ_{P−} | holds; Simon1983 42.7 line 7886–7898 | none |
| 8.2 integral tangent cones | v(P₁,1) + v(P₂,1); ½v(L,1); C_{p,q} | cone V, Θ(0) = 2 | ½v(L,1) not integral; C_{p,q} its own cone | holds; Simon1983 42.6, 42.8; EdelenSpolaor2023 Def. 1.1.1 | none |
| 9.3 currents comparison | [[P]] + (−[[P]]); 2[[P]] | θ_T = 1 − 1 = 0, Γ⁺ = ∅, varifold 0 | v(P,1) + v(P,1) = v(P,2) ≠ 0 | holds; Simon1983 line 7253–7293 | none |
| `exists_firstVariation_eq_riesz` | V = 0; v([0,∞)×0, 1) | V = 0: σ = 0, mass identity 0 = 0 + 0 | half-line: H = 0, σ = δ₀, η = −e₁, ‖δV‖(B₁(0)) = 1 = 0 + 1 | holds | none |
| `Euclidean.monotonicity_identity` | unit circle, x = 0, σ < 1 < ρ; line y₂ = a | left 2π/ρ | right 2π − 2π(1 − 1/ρ) = 2π/ρ; line 2√(ρ² − a²)/ρ on both sides | holds | none |
| `monotonicity_inequality` | S², k = 2, κ = 1, V = volume | f(0+) = π, f(π/2) = 8/π ≈ 2.546 | curvature term adds ≥ 8 − 5.09σ; without it, false | holds | none |
| `monotoneOn_exp_mul_densityRatio` | great circle on S², k = 1, κ = 1, Λ = 0 | `densityRatio` = 2ρ/(2ρ) = 1 | e^ρ · 1 non-decreasing on (0, π/2) | holds | none |
| `ae_hasDensity` | δ_(0,P) on ℝ²; v(L, e^{−1/\|t\|}) | atom: tr(P DX(0)) unbounded as sup\|X\| → 0, so not locally bounded | Θ(0) = 0 exists; Θ = e^{−1/\|t\|} elsewhere | holds | none |
| `hasDensity_and_limsup_le_of_firstVariationMass_le` | step multiplicity 1 \| 2; crossing lines | step: ‖δV‖(B_ρ(0)) = 1 > 3Λρ, hypothesis fails (Θ(0) = 3/2) | crossing: Θ(0) = 2 ≥ lim sup 1 | holds | none |
| `one_le_upperDensity_of_mem_support` | v([−a,a]×0, 1), U = B_a(0); ½v(L,1) | Θ(0) = 1 | ½v(L,1): `hθ` fails, Θ = ½ | holds | none |
| `constancy` | g = e^{2t}dt², V = [ℝ]; sin(1/t) graph; parallel lines 1, 2 | δV(X) = ∫(e^tX)′dt = 0, θ₀ = 1 | sin(1/t): V = 0 only, branch θ₀ = 0; disconnected Σ excluded by `ConnectedSpace N` | holds | none |
| `Euclidean.exists_isVarifoldTangent` | vertical lift, x = 0 | Θ(0) = 2ρ/(2ρ) = 1 | V_{0,λ} = V for all λ: a limit exists with no δV hypothesis | holds | none |
| `Euclidean.IsVarifoldTangent.isStationary` | two lines through 0; vertical lift | C = V, ‖C‖(B_ρ) = 4ρ = 2ω₁ρ | vertical lift: ‖δV‖(B_ρ) = ∞, `hδ` fails, limit not stationary | holds | none |
| `isRectifiable_of_ae_density_pos` | Lebesgue with constant line; vertical lift | Θ = lim πρ²/(2ρ) = 0: hypothesis fails | vertical lift: Θ = 1, not locally bounded (4.3) | holds | none |
| `rectifiable_compactness` | alternating lines; zigzags | hypotheses hold, full sequence diverges | zigzag ‖δV_i‖ = √2(i − 1) + 2 → ∞ violates `hmass` | holds | none |
| `integral_compactness` | v(L,1) + v(L_i,1); ½v(L,1) | limit v(L,2), multiplicity 2 | ½v(L,1): `hint` fails | holds | none |
| `Euclidean.IsVarifoldTangent.isRectifiable` | ½v(L,1); step multiplicity at 0 | ½v(L,1): `hlow` fails, cone ½v(L,1) still rectifiable | step: ρ⁰‖δV‖(B_ρ(0)) = 1 does not tend to 0 | holds | none |
| `Euclidean.IsVarifoldTangent.isIntegral` | v(P₁,1) + v(P₂,1); C_{p,q} | C = V, integral, Θ(0) = 2 | C_{p,q} with multiplicity 1 is its own cone | holds | none |
| R01 docstring bullet | `TauCeti.WithMetric g` with `EMetricSpace.ofRiemannianMetric` | docstring: instance missing | probe proving `IsRiemannianManifold` by `inferInstance` elaborates | R01 | docstring |
| R02 Layer 3 title | README line 779 vs Lean line 179 | "push-forward, blow-ups and tangent spaces" | "dilations" | R02 | rename |

- Source locators checked against the text: 48 (Simon1983 34, AgnolettoCorreaHoyosDaSilvaNardulli2025 8, Scharrer2022 3, Simon2023 2, EdelenSpolaor2023 1), all supporting the statement as written.
- Library declarations opened at the pins: 54 by `#check` in one scratch file. 12 more by source: the `TauCeti.finiteGrassmannian` family (its modules fail to import beside `import Mathlib` at the pin: duplicate `Projectivization` instance), `Distribution` mass, `TauCeti.secondFundamentalForm` and the `TauCeti.CountablyRectifiable` family.
- Cross-roadmap citations resolved on main (2b9ce21): 14 of 14. These are GeometricMeasureTheory G2; GeometricCurrents G1, G2, G5, G6; RiemannianGeometry R4 item 1, R5a, R5a.2, R5b; MinimalSurfaces 3.1, 3.3; HopfRinow Layers 0–2 and 4.
- Gate: every check passes. Dependency check: `depcheck: 252 roadmaps, 2396 edges, 0 problem(s)`.
- Elaboration: `lake env lean` gives 15 `declaration uses sorry` warnings and nothing else. Every theorem keeps `[IsRiemannianManifold I M]`, `[SecondCountableTopology M]` and `[I.Boundaryless]`; the defs drop only binders their bodies do not use.
- One-tactic probe (`rfl`, `infer_instance`, `trivial`, `simp_all`, `simp`, `aesop`) on all 15 theorems: none closes.
- Checks: all 34 subsections have at least three; about 120 Check values were recomputed and none fails.
- No other roadmap, open or on main, plans varifolds. Library near-matches with the same name (`IsIntegral`, `IsStationary`, `weight`) are unrelated objects.

Overlap check: read GaussianIsoperimetryAndClusters, HyperbolicDynamicsAndThermodynamicFormalism, ManifoldOptimization, LorentzianGeometry, RealSemisimpleLieGroups (open) and GeometricCurrents, RiemannianGeometry, MinimalSurfaces (main). Shared objects and their owners:
- Unoriented Grassmann bundle: GeometricCurrents G6. Here, 1.2 keeps the projection presentation with a comparison map; HyperbolicDynamicsAndThermodynamicFormalism 11.2 adds a smooth structure on G6's carrier.
- The auxiliary varifold's monotonicity and tangent cones: G6, compared in 9.3.
- Smooth convex hull property: MinimalSurfaces 3.3.
- First volume variation of immersions: RiemannianGeometry R5a.2.

Source independence: 26 passages compared with 5 sources. Nothing is shared beyond formulas and standard names; the longest common run is 4 words ("for each compact K", 4.2 vs Simon1983 line 868). Largest share: Simon1983, 90 of 148 source citations. Contents compared with Simon1983 (contents, lines 42–107): independent. Layers 3, 4, 6, 7 and 8 draw on §§38, 39, 40–41 and 42, but not one-to-one, and Layers 1, 2, 5 and 9 have no counterpart. The order is forced by the *Needs:* lines of 6.1 (4.1–4.4), 7.3 (6.1–7.2) and 8.1 (7.1–7.3).

## Not verifiable

- Allard1972 (Sections 3–6, 8), Federer1969 (2.5, 2.8, 3.2) and Maggi2012 (Part II) are uncertified in the manifest (paywalled) and cited by section only; not read.
- Simon1983 42.9 thresholds (README 7.5) and display (8) at line 7978 (the README 7.6 remark on the source's measure bound): the displays are illegible in the extraction.
- Simon1983 42.1, first display (line 7736): illegible, so it is unclear whether Θ > 0 is assumed. The README's weaker hypothesis is carried by its own route.

## Source issues

- **Error** in Simon1983 at 41.1, printed p. 240: the source takes M a connected C² submanifold of ℝ^{n+k}, not of U, with U ∩ spt μ_V ⊂ M; it should assume M ⊂ U or M ∩ U connected, since half-axes with multiplicities 1, 2 in U = ℝ² ∖ {0} refute it; affects a stated result.
- **Misprint** in Simon1983 at the proof of 42.8, printed p. 250 (line 7982): the source says max{ψ_i, N} converges in L¹ to θ₀; it should be min{ψ_i, N}, since the maximum is at least N > θ₀; affects nothing.

## For the human reviewers

- none
