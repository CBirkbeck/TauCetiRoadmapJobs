# Review of Varifolds (pull request #2443 at 2a4c677)

**Verdict:** accepted

## Previous findings

The previous review (of this same head) listed no finding, so there is nothing to check for repair. The folder is unchanged since it (0 lines). Every row below was computed again in this round.

## Verified sound

| Statement | Instances tried | Values, one side | Values, other side | Result | Change |
|---|---|---|---|---|---|
| §1.2 Grassmann bundle, map `G_k^g → G_k^h` | h = diag(1, 4) and h = 4e on ℝ², u = (1, 1) | h-projection: e₁ ↦ h(e₁,u)/h(u,u)·u = u/5 | Euclidean: u/2; h = 4e: 4/8 = 1/2, the identity | holds | none |
| §1.3 weight, mass, support (`weight`, `Euclidean.weight`) | horizontal and vertical lifts of H¹⌞(x-axis), test χ·tr(P diag(1, 0)) | horizontal: ∫χ dH¹; mass on unit disc 2 | vertical: 0, same weight | holds; Lean `weight` is `V.map` of the projection | none |
| §1.4 `VarifoldTendsto`, compactness | δ at (j e₁, P); j·δ at (0, P) | masses 1, limit 0: mass only lower semicontinuous | ∫f = j f(0, P) → ∞: no limit, bound needed | holds; every Lean limit carries `IsFiniteMeasureOnCompacts` | none |
| §2.1 approximate tangent space, criterion | H¹⌞L; Lebesgue on ℝ² (k = 1); δ₀; chart φ = 2y | λ⁻¹·2λ = 2 = H¹(L ∩ B₁); πλ → 0; 1/λ → ∞ | φ_*μ = ½H¹⌞L and 1/J_L(2·id) = 1/2 | holds | none |
| §2.2 `IsRectifiable`, `IsIntegral` (C¹-piece form) | vertical lift; two crossing lines; non-measurable θ | pieces covering the axis have tangent the axis a.e.; lift's planes vertical: excluded | crossing point H¹-null; `withDensity θ` ≪ σ-finite Hᵏ⌞⋃f_j(U_j), so a measurable density exists | holds; no wider class admitted | none |
| §2.3 [Σ], weight = Riemannian volume | graph of \|t\|^{3/2} over (−1, 1) | 2∫₀¹√(1 + 9t/4) dt = (16/27)((13/4)^{3/2} − 1) = (26√13 − 16)/27 ≈ 2.8794 | inscribed polygon 2√2 ≈ 2.8284, smaller | holds | none |
| §3.3 tangent spaces, fibre measures | \|y₁\|H¹⌞L + \|y\|⁻¹L² on ℝ²; two crossing lines | ‖V‖(B_r(0)) = r² + 2πr, Θ¹(0) = π; (‖V‖⌞L)(B̄₃ᵣ) = 9r² | doubling ratio 9 > 3^k + 1 = 4 on D: density points needed, as stated | holds | none |
| §4.3 `IsStationary`, `HasLocallyBoundedFirstVariation`, `firstVariationMass` | X_n = n⁻¹ψ sin(n y₂)e₂ on the vertical lift; scaling X ↦ cX | sup\|X_n\| ≤ 1/n, δV(X_n) = ∫ψ(t, 0)dt for all n | Lean form "\|X\| ≤ 1 ⇒ \|δV X\| ≤ C" equals "≤ C_K sup\|X\|" by homogeneity | holds; Lean norm is the `RiemannianBundle` fibre norm (probe) | none |
| §4.4 `exists_firstVariation_eq_riesz` | half hyperplane {x_N = 0, x₁ > 0}; v(L, 1 + y₁²); unit circle | δ[Σ](X) = −∫_{x₁=0}X¹: σ = Hᴺ⁻², η = −e₁ outward; H = 2y₁/(1 + y₁²)·e₁ | circle: H = −x, σ = 0, ‖δV‖(U) = H¹(C ∩ U) = ∫_U\|H\| + 0 | holds; sign convention is the README's own (Simon1983 line 7498 uses the other) and is witnessed | none |
| §5.1 first variation of a C² submanifold | S^k with X = ψx; graph of \|t\|^{5/2} | div_S X = k: δ = kHᵏ(S^k); −k∫⟨−x, x⟩ = kHᵏ(S^k) | ∫φ′u′(1 + u′²)^{−1/2} = −∫φu″(1 + u′²)^{−3/2} by parts | holds | none |
| §5.2 intrinsic versus ambient | unit cylinder: vertical line, circle, helix of angle α; S¹ ⊆ ℝ² | tr_S B_M: 0; −ν; cos²α·B(τ, τ) = −cos²α ν | curvature vectors: 0; −ν; γ″/\|γ′\|² = −ν/sec²α | holds; S¹: 0 + tr_S B = −x | none |
| §6.1 `Euclidean.monotonicity_identity` | line y₂ = a, σ < a < ρ; unit circle, σ < 1 < ρ | line: 2√(ρ² − a²)/ρ; circle: 2π/ρ | line: ∫a²(t² + a²)^{−3/2} = 2T/ρ, T = √(ρ² − a²); circle: 2π − 2π(1 − 1/ρ) | holds; a plus sign gives 2π(2 − 1/ρ) ≠ 2π/ρ | none |
| §6.2 `monotonicity_inequality` | S², k = 2, V = volume, σ ↓ 0, ρ = π/2; great circle, k = 1 | f(ρ) = 2π(1 − cos ρ)/ρ²: f(0+) = 3.1416, f(π/2) = 8/π = 2.5465 | 2.5465 + ∫2f ≥ 2.5465 + 8; great circle: 2 ≤ 2 + 2(ρ − σ) | holds; derivation rechecked with t cot t ≥ 1 − t on [0, π/2] | none |
| §6.2 `monotoneOn_exp_mul_densityRatio` | S² volume, κ = 1, Λ = 0, k = 2 | d/dρ log(e^{2ρ}(1 − cos ρ)/ρ²) = 2 + cot(ρ/2) − 2/ρ | ≈ 2 − ρ/6 near 0; 3 − 4/π = 1.727 at π/2: positive | holds | none |
| §6.3 `ae_hasDensity` | v(L, e^{−1/\|t\|}) at 0; triple junction | ‖δV‖(B_ρ) = 2e^{−1/ρ}, ‖V‖(B_ρ) ≤ 2ρ²e^{−1/ρ}: ratio ≥ ρ⁻² | Θ¹(0) = 0 exists all the same; junction 3ρ/(2ρ) = 3/2 | holds | none |
| §6.3 `hasDensity_and_limsup_le_of_firstVariationMass_le` | two crossing lines; step multiplicity 1, 2 on the axis | Θ(0) = 2 ≥ lim sup = 1 | step: Θ(0) = 3/2 < 2 = lim sup, and ‖δV‖{0} = 1 breaks the hypothesis | holds | none |
| §6.3 `one_le_upperDensity_of_mem_support` | v(L, ½); v([−a, a] × {0}, 1) at the endpoint | Θ = ½: the a.e. hypothesis fails | endpoint Θ = ½, and ‖δV‖ has an atom there, so no U ∋ endpoint satisfies the bound | holds | none |
| §6.4 `constancy` | two parallel lines, multiplicities 1, 2; g = e²ᵗdt² on ℝ; graph of sin(1/t); open segment | disconnected: non-constant; δ[W](X) = ∫(eᵗX)′dt = 0 with θ̃ = 1, (θ̃w)′ = eᵗ ≠ 0 | sin(1/t): length ∫₁^∞\|cos u\|du = ∞, only V = 0; Lean `θ₀ = 0 ∨ IsClosed (range ι)` covers it | holds; `0 • μ = 0` also when Hᵏ⌞Σ is not locally finite | none |
| §7.1 semicontinuity of lower density bounds | i segments of length 1/(2i); constant ½v(L, 1) | Θ = 1, ‖δV_i‖ = 2i → ∞, limit density ½: excluded by lim inf‖δV_i‖ < ∞ | density ½ in, ½ out: density hypothesis needed | holds | none |
| §7.2 `Euclidean.exists_isVarifoldTangent`, `IsVarifoldTangent.isStationary` | μ = (1 + ½ sin(log r)cos ϑ)dr dϑ; vertical lift at 0; scaling of ‖δV‖ | μ(B_ρ) = 2πρ; λ⁻¹∫_{B_λ}cos ϑ dμ = (π/4)(sin log λ − cos log λ): −π/4 at 1, +π/4 at e^π | vertical lift: Θ = 1, V_{0,λ} = V, δV(X) = ∫φ(t, 0) > 0; λ^{1−k}‖δV‖(B_{λR}) = R^{k−1}(λR)^{1−k}‖δV‖(B_{λR}) → 0 | holds; existence carries no δV hypothesis, stationarity carries the decay | none |
| §7.3 `isRectifiable_of_ae_density_pos` | Lebesgue on ℝ² with a constant line; vertical lift; triple junction | Θ¹ = πρ²/(2ρ) → 0: density hypothesis fails, not rectifiable | vertical lift: Θ = 1 but δV(X_n) bounded below with sup\|X_n\| → 0: not locally bounded | holds | none |
| §7.4 `rectifiable_compactness` | lines y₂ = 0, y₂ = 1 alternating; zigzags of slope ±1 | test integrals 1, 0, 1, 0: only subsequences converge | ‖δV_i‖ = √2(i − 1) + 2 (i = 2: √2 + 2); limit √2H¹ with fibre ½δ₊ + ½δ₋ | holds; Lean gives a subsequence and concludes for every Radon subsequential limit | none |
| §7.6 `integral_compactness` | v(L, 1) + v(L_i, 1); ½v(L, 1); ψ_i = 1 + i·1_{E_i} | limit v(L, 2); constant ½: not integral in, not integral out | ψ_iLᵏ → (3/2)Lᵏ but min(ψ_i, 2) → 1: the mass bound on Z is what excludes it | holds | none |
| §8.1 `Euclidean.IsVarifoldTangent.isRectifiable` | ½v(L, 1) at 0; C = v(P, 1) under `blowUp C 0 s` | ρ⁻¹·½·2ρ = 1 ↛ 0: hypothesis fails, cone still rectifiable | s⁻ᵏ·(sᵏHᵏ⌞P) = Hᵏ⌞P: `blowUp C 0 s = C` is the cone law | holds; Simon1983 line 7793–7805 needs no global bound on δV | none |
| §8.2 `Euclidean.IsVarifoldTangent.isIntegral` | v(P₁, 1) + v(P₂, 1) at 0; step multiplicity, k = 1 | C = V, Θ = 2, integral | ρ⁰‖δV‖(B_ρ(0)) = 1 ↛ 0: decay fails | holds | none |
| §9.4 acceptance statements | Simon2023 Theorem 1.1 with n = 3, m = 5, ℓ = 1; EdelenSpolaor2023 Theorem 1.4 | ambient ℝ⁹, n + m = 8 ≥ 8; Σ = (ℝ⁸ × {0}) ∖ {0} has reg = ℝ⁸ × {0} ≠ Σ | p + q = n − 1 ≥ 7 for n ≥ 8: every C_{p,q} minimizing (EdelenSpolaor2023 line 120) | holds | none |
| Docstring: forms not statable at the pins | varifold push-forward; currents; map between Grassmann bundles of two metrics | "varifold": 0 files in pinned Mathlib and Tau Ceti; no integral currents; nothing under `Geometry` mentions Grassmann | `riemannianLog`, `WithMetric`, `chartC2Topology`, `EMetricSpace.ofRiemannianMetric` exist as the docstring says | holds | none |

- Source passages read at their locators: 40. Simon1983 30 (covering 3.3, 3.5, 4.1, 4.4, 9.3–9.6, 11.1, 11.4–11.9, 15.1, 16.4, 16.6, 17.8–17.9, 19.1, 19.3, 38.1–38.4, 39.1–39.4, 40.5–40.7, 41.1–41.2, 42.1–42.9); AgnolettoCorreaHoyosDaSilvaNardulli2025 4 (line 87–93, 149–176, 262–304, 1786–1812); Scharrer2022 3 (line 823–854, 1120–1127, 1184–1203); Simon2023 2 (line 73–96, 432–441); EdelenSpolaor2023 1 (line 104–135). Each supports the statement as written.
- Library declarations resolved at the pins: all 85 backticked library names of the README. Opened: `TauCeti.Manifold.IsNormalDomain` (`TauCeti/Geometry/Manifold/Riemannian/Geodesic/Normal/Basic.lean:89`), `IsNormalDomain.image_riemannianExp_ball` (`…/Geodesic/Gauss/Distance.lean:251`), `Vitali.exists_disjoint_subfamily_covering_enlargement` (`Mathlib/MeasureTheory/Covering/Vitali.lean:62`), `Measure.setLIntegral_rnDeriv_le` (`Mathlib/MeasureTheory/Measure/Decomposition/RadonNikodym.lean:319`, no σ-finiteness), `TauCeti.CountablyRectifiable` (`TauCeti/Geometry/MeasureTheory/Rectifiable/Basic.lean:44`), the fibre norm instance (`Mathlib/Topology/VectorBundle/Riemannian.lean:431`), `chartC2Topology` (`TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Topology.lean:270`).
- Cross-roadmap citations resolved on main (d68af47): 14 of 14. GeometricMeasureTheory G2; GeometricCurrents G1 (constancy criterion, README line 229–233), G2, G5, G6 (line 668–689); RiemannianGeometry R4 item 1 (Hessian bounds, line 2311–2318), R5a, R5a.2, R5b; MinimalSurfaces Scope, 3.1, 3.3; HopfRinow Layers 0–2 and 4.
- Gate: every check passes. Dependency check, run again: `depcheck: 256 roadmaps, 2432 edges, 0 problem(s)`. No change outside the folder.
- Elaboration (`lake env lean`): 15 `declaration uses sorry` warnings and nothing else. All three `TauCeti.*` imports are used: `monotonicity_inequality` and `monotoneOn_exp_mul_densityRatio` use `IsNormalDomain`, `sectionalCurvature` and the instance of `LeviCivita/Regularity.lean`.
- Elaborated signatures compared with the README, all 38: each of the 10 manifold theorems keeps `[I.Boundaryless]`, `[SecondCountableTopology M]`, `[IsContMDiffRiemannianBundle …]`, `[IsRiemannianManifold I M]` and `[BorelSpace M]`; the definitions drop only binders their bodies do not mention. Nothing changed.
- One-tactic probe on a scratch copy (`simp`, `rfl`, `infer_instance`, `trivial`, `simp_all` on each of the 15 theorems): none closes. Headlines of the README Summary: all stated or named in the module docstring with the missing carrier. Same-name hits (`weight`, `IsIntegral`, `IsStationary`) are unrelated objects.
- Pull request text against this head: 15 theorems, the four families not statable, the suppliers and "adds the roadmap" all agree; no sentence is contradicted. Remark: `monotonicity_inequality` holds without `hV` (its right side is ∞ when ‖δV‖(B_t) = ∞); the README states the hypothesis too, so the two agree.

Overlap check: read RiemannianManifoldsWithConvexBoundary, GaussianIsoperimetryAndClusters, HyperbolicDynamicsAndThermodynamicFormalism, ManifoldOptimization, LorentzianGeometry (open) and GeometricCurrents, RiemannianGeometry, MinimalSurfaces (main). Shared objects and owners: the unoriented Grassmann bundle and the auxiliary varifold of an integral current, GeometricCurrents G6 (cited here and by HyperbolicDynamicsAndThermodynamicFormalism 11.2); the smooth convex hull property, MinimalSurfaces 3.3; the first volume variation and B for smooth immersions, RiemannianGeometry R5a and R5a.2. `varifold` occurs in no other open roadmap.

Source independence: 17 passages compared with 5 sources (1.1, 1.3, 2.1, 3.3, 4.3, 4.4, 6.2, 6.4, 7.1, 7.2, 7.4, 8.1, 9.1, both statements of 9.4, and the docstrings of `constancy` and `rectifiable_compactness`), none shared beyond formulas and standard names (longest run 6 words, 9.4 against Simon2023 line 89–90); largest share Simon1983, 88 of 132 citations; contents compared with Simon1983 (line 47–107): independent. §38 feeds Layers 1, 2 and 3, §40 feeds 6 and 7.1, §42 feeds 7 and 8; Layers 2, 5, 9 and 4.2, 4.5, 6.2, 6.5 come from elsewhere; the order 1 → 4 → 6 → 7 is forced by the `*Needs:*` lines of 4.1, 6.1 and 7.3.

## Not verifiable

- Allard1972, Federer1969 and Maggi2012 are uncertified in the manifest (cited by section only) and were not read.
- Simon1983 display (8) in the proof of 42.8 (line 7977–7979) is illegible in the extraction, so the README's remark in 7.6 on what that step uses could not be compared with the print.

## Source issues

- **Misprint** in Simon1983 at Remark 42.8, proof, printed p. 250 (line 7982–7983): the source says the maximum of ψ_i and an integer N above θ₀ converges in L¹ to θ₀; it should be the minimum of ψ_i and N; affects nothing.
- **Gap** in AgnolettoCorreaHoyosDaSilvaNardulli2025 at Theorem 2.32, proof, p. 17 (line 1802–1803): the source says locally bounded first variation passes to the push-forward by a bi-Lipschitz chart, without argument; it should be supported by an estimate comparing the first variations for the two metrics; affects the proof.

## For the human reviewers

- **Scope.** `TauCetiRoadmap/Varifolds/README.md` line 2103–2125 (§9.4) states two theorems (Simon2023, EdelenSpolaor2023) that the roadmap does not prove and calls "neither targets nor headline theorems"; whether such test statements belong in a roadmap is yours to decide.
