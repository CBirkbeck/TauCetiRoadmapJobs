<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13845#issuecomment-6897932689 -->
Review (claude) of 27a6338

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) 7.6's route does not follow from 7.5 as stated

   **Location.** `packages/Varifolds/design/README.md:1529–1532`: "Then 7.5 applied to Ṽ_i, together
   with the convergence of the fibre multiplicities given by the area formula (3.1), shows that
   min(ψ_i, m) converges in L¹ to θ(x) for every integer m > θ(x)". Also `:1476–1478` (7.5's
   conclusion) and `plan.json` 7.5.

   **Claim.** The two named inputs give the L¹ convergence: (a) 7.5's conclusion, a bound
   ψ_i ≤ (1 + δ)θ + 2δ outside a set A_i of Lebesgue measure less than δ, and (b) the convergence of
   ψ_i·Lᵏ to θ·Lᵏ as measures.

   **Witness.** On B_1 ⊆ ℝ^k let ψ_i = 1 + i·1_{E_i}, with E_i a union of small balls of density 1/(2i)
   in every ball. Then ψ_i is integer valued, ψ_i·Lᵏ → (3/2)Lᵏ, and ψ_i = 1 ≤ 3/2 off E_i with
   Lᵏ(E_i) → 0: (a) and (b) hold with θ = 3/2. But min(ψ_i, 2) = 1 + 1_{E_i} → 1 in L¹, not 3/2, and
   θ is not an integer. What is missing is that the mass of Ṽ_i lying over A_i tends to 0
   (∫_{A_i} ψ_i → 0). The statement of 7.5 (Simon's 42.9) does not say this; its proof does: the
   exceptional set is A = p(A_1 ∪ A_2) for the set A_1 ∪ A_2 of points where a ratio bound fails, whose
   ‖V‖-measure is at most cε (Simon1983 line 8021–8048), and the slab estimates are used only at the
   fibre points themselves (line 8052, 8088).

   **Exact repair.**

   1. In 7.5 replace the conclusion ("Then there is a Borel set A … + δ.") by: "Then there is a Borel
      set Z ⊆ spt‖V‖ ∩ B_2(0) with ‖V‖(Z) < δ, whose projection p(Z) ∩ B_1(0) lies in a Borel set
      A ⊆ B_1(0) ∩ (ℝ^k × {0}) of k-dimensional Lebesgue measure less than δ, such that for every
      x ∈ B_1(0) ∩ (ℝ^k × {0}) the sum of Θ^k(‖V‖, y) (the density for h) over the points
      y ∈ (p⁻¹(x) ∩ spt‖V‖) ∖ Z with |q(y)| < ε is at most (1 + δ)(ω_k 2^k)⁻¹‖V‖(B_2(x)) + δ. In
      particular the sum over all of p⁻¹(x) ∩ spt‖V‖ ∩ {|q| < ε} satisfies this bound for x ∉ A, which
      is Simon1983 line 7991–8000 (42.9) when h = e; the set Z = A_1 ∪ A_2 and its mass bound are in
      the proof (line 8021–8048)." In the route, step (i), add "this set is Z, and A covers p(Z)". Make
      the same change in `plan.json` 7.5 (statement and one test: the spike functions above as a
      non-example of the weaker conclusion).
   2. In 7.6 replace the last sentence of the route by: "Write ψ_i = ψ'_i + ψ''_i, the sums over the
      fibre points outside and inside the set Z_i of 7.5 for Ṽ_i. By 7.5, ψ'_i ≤ (1 + δ)θ(x) + 2δ on
      B_1(0) for large i, and by the area formula (3.1, the Jacobian of p on a k-plane is at most 1)
      ∫ ψ''_i dLᵏ ≤ ‖Ṽ_i‖(Z_i) < δ. The area formula and tilt → 0 give ψ_i·Lᵏ → θ(x)·Lᵏ as measures, so
      ∫_{B_1(0)} ψ'_i ≥ θ(x)ω_k − δ − o(1). Hence lim sup_i ∫_{B_1(0)} |ψ'_i − θ(x)| ≤ 2(δθ(x) + 2δ)ω_k + δ;
      ψ'_i is integer valued, so the distance from θ(x) to ℤ is at most 2(δθ(x) + 2δ) + δ/ω_k for every
      δ, and θ(x) is an integer."

   Tested on the witness: the spikes cannot be put into ψ' (it must stay ≤ 3/2 + small everywhere) and
   ∫ ψ'' would be ω_k/2, not less than δ, so the strengthened conclusion excludes the instance; and for
   ψ_i ≡ 2 → θ = 2 the repaired route gives distance 0.

2. **F02** (P3) 9.3 writes v(Γ_T, |θ_T|) where θ_T may vanish

   **Location.** `packages/Varifolds/design/README.md:1660–1661`: "an integer multiplicity θ_T, and let
   𝐯_T be GeometricCurrents G6's auxiliary varifold of T. Through 1.2's homeomorphism,
   𝐯_T = v(Γ_T, |θ_T|)".

   **Claim.** v(Γ_T, |θ_T|) is defined by 2.2.

   **Witness.** 2.2 (line 550) requires θ : Γ → (0, ∞). 9.3's own Check: [[P]] + (−[[P]]) = 0 is
   represented on the carrier P with multiplicity 0, and v(P, 0) is not defined by 2.2.

   **Exact repair.** Write Γ_T⁺ = {x ∈ Γ_T : θ_T(x) ≠ 0} and replace v(Γ_T, |θ_T|) by v(Γ_T⁺, |θ_T|)
   throughout 9.3 and in `plan.json` 9.3. Tested: for the cancelling sum Γ_T⁺ = ∅ and v(∅, ·) = 0, the
   value the Check states; for an oriented plane of multiplicity 2, Γ_T⁺ = P and v(P, 2).

Two findings: one P2 (a proof route whose stated inputs do not give its conclusion, in a passage the
last repair rewrote) and one P3. Both findings of REV-DESIGN-Varifolds~7 are repaired. No gap is
declared and none is needed. No maintainer notes were supplied. No file of the design and no
manifest entry was edited; no source was fetched (all eight cited works are recorded in
`packages/Varifolds/sources.toml`). There is no `Suggested.lean` at the design stage; elaboration:
not available (this lane does not elaborate).

## Verified sound

### Previous review (REV-DESIGN-Varifolds~7), finding by finding

| Prior finding | Repaired passage (quoted) | Status and my test |
|---|---|---|
| F01 (6.3's mass lower bound did not confine the ball to U) | "If moreover x ∈ spt‖V‖ ∩ U, κ ≥ 0 and ρ_0 are as in 6.2 … and B_{ρ_0}(x) ⊆ U, then 6.2's ratio bound holds for 0 < t < ρ_0, and ‖V‖(B̄_ρ(x)) ≥ e^{−(Λ + k√κ)ρ} ω_k ρ^k for 0 < ρ < ρ_0" (line 1166–1169), with the new Check (1197–1200) | **Repaired.** B̄_t(x) ⊆ B_{ρ_0}(x) ⊆ U for t < ρ_0, so ‖δV‖(B̄_t) ≤ Λ‖V‖(B̄_t); 6.2 makes e^{(Λ+k√κ)ρ}ρ^{−k}‖V‖(B̄_ρ) non-decreasing with limit ω_kΘ ≥ ω_k. Segment [−a, a], U = B_a(0): ρ = 2a gives 2a against 4a (excluded now); ρ < a gives 2ρ = ω_1ρ. Unit circle, Λ = 1, ρ = 1: 4 arcsin(1/2) = 2.094 against e^{−1}·2 = 0.736. |
| F02 (W named a varifold in 7.5 and 7.6) | "and V an integral varifold on B_3(0) for h" (line 1471); "the rescaled varifolds Ṽ_i of V_i at x with scale λ_i … for the metrics h_i(z) = (exp_x^* g_i)(λ_i z) → g_x in C²" (1526–1527) | **Repaired** as notation; grep for `W_i`, `dW`, `‖W‖`, `δW`, `M(V`, `integers N` finds nothing. h_i − g_x = G_i(λ_i z) − G(0) → 0, Dh_i = λ_i DG_i(λ_i ·), D²h_i = λ_i² D²G_i(λ_i ·) → 0. The rewritten last sentence of the route is R01. |

Same patterns elsewhere. A ball not confined to the set carrying the hypothesis: 6.1 (two
companion bullets state B_ρ(x), ρ < ρ_0 ≤ dist(x, E ∖ W)), 6.3 semicontinuity clauses (local), 8.2
("near x"): none. One letter for two objects: none found beyond the repaired ones. No finding of
the repair report was marked not actionable.

### Principles, shape, plan

Read all 1764 lines of the README, `plan.json` (9 layers, 34 targets, 34 distinct ids, no
prerequisite on a later target, no `gap:` prerequisite, `gaps` empty, at least 3 tests per target)
and the manifest (8 entries, no machine path). No route-specific narrowing; no re-planned roadmap
(GeometricCurrents G6's auxiliary varifold is compared in 9.3, not rebuilt); no algorithm; no Lean
file. Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
build, nine layers each ending in Examples and Dependencies, Downstream consumers, References. Grep
for LaTeX delimiters, pull-request numbers, machine paths, HTML anchors, round labels, "optional",
"deferred", "so far", "handoff", "checkpoint": none. The Summary's "in the generality of Allard's
theory as presented in Chapter 8 of Simon's lectures" names a generality, not an order. No
backticked name is presented as this roadmap's own.

### Adversarial table (values computed this round)

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 1.1 comparison and image-plane formula | e = R_φ; O-law; L = diag(1, 0) on ℓ_0 | R_{−φ}P_{ℓ_θ}R_φ = P_{ℓ_{θ−φ}}; (Oe)⁻¹P_S(Oe) = e⁻¹P_{O⁻¹S}e; Q A⁻¹Q* = B(B*B)⁻¹B* with B = L restricted to range P, = P_{ℓ_0} | sound |
| 1.1 bounds | \|tr(P A)\| = \|Σ⟨Aτ_i, τ_i⟩\|; k = 0 | ≤ k‖A‖; G = {0} | sound |
| 1.3 weight, mass | horizontal and vertical lifts of H¹⌞axis; unit disc | ∫χ against 0 for χ·tr(P diag(1, 0)); mass 2 | sound |
| 2.1 normalisation, chart law | H¹⌞L, k = 1; δ_0; Lebesgue on ℝ²; φ = 2·id | λ⁻¹·2λ = 2 (λ⁰·2λ → 0, λ⁻²·2λ → ∞ for the wrong exponents); λ⁻¹ → ∞; πλ → 0; φ_*μ(A) = ½H¹(L ∩ A), 1/J = 1/2 | sound |
| 2.1 criterion, null points | point with tangent plane, θ > 0 | Θ^k(μ, x) = θ(x) > 0, so Hᵏ of a μ-null subset of Γ is 0 | sound |
| 2.3 weight identity | graph of \|t\|^{3/2} | 2·(4/9)(2/3)((13/4)^{3/2} − 1) = (26√13 − 16)/27 = 2.879 > 2√2 = 2.828 | sound |
| 3.2 scaling | [0, 1] × {0}; composition; great circle on S² | mass λ⁻¹; η_{0,μ} ∘ η_{x,λ} = η_{x,λμ}; λ⁻¹·2λρ = 2ρ for λρ < π | sound |
| 4.2 Riesz for fields | ⟨X(0), 2e_1⟩; ∫(X¹ + X²); v = 0 | 2δ_0, η = e_1; √2·vol (2·vol for the sup norm); ‖L‖ = 0 and η undetermined | sound |
| 4.2 route, \|η\| = 1 | domination and open-set formula | ∫⟨η, ψ⟩ ≤ ∫\|ψ\| gives \|η\| ≤ 1; ‖L‖(U') ≤ ∫_{U'}\|η\| gives ∫(1 − \|η\|) ≤ 0 | sound |
| 4.4 decomposition (headline) | dilation; half hyperplane; θ = 1 + y_1² | δV_{x,λ}(Y) = λ^{1−k}δV(Y ∘ η), H' ∘ η = λH; η = −e_1; H = (θ'/θ)e_1 | sound |
| 4.5 estimate and blow-up form | Γ_h − Γ_g; g = e^{4t}dt², h = 4g; m(z) = λz | h⁻¹(Dh − Dg) + (h⁻¹ − g⁻¹)Dg, so no bound on Dh is needed; Γ = 2, 2 against 4, sup\|X'\| = 8/(3√3) = 1.54; m*(λ⁻²g̃) = g̃(λ·), ‖δ‖ scales by λ^{1−k} | sound |
| 5.2 intrinsic against ambient (headline) | great S^k ⊆ S^N; extension of a tangent field | div_S X^⊥ = −⟨X, tr_S B_M⟩, H_{ι_#V} = H_V + tr_S B = −kx; for X tangent along W the B-term is 0, so ‖δV‖ ≤ ‖δ(ι_#V)‖; \|tr_S B\| ≤ k\|B\| | sound |
| 6.1 identity (headline) | line y_2 = a; unit circle | 2√(ρ² − a²)/ρ both sides; 2π/ρ = 2π − 2π(1 − 1/ρ) | sound |
| 6.1 exponential form | f' ≥ J' − Λf | (e^{Λρ}f)' ≥ e^{Λρ}J' ≥ J' | sound |
| 6.2 Riemannian form (headline) | ∇(r∇r) = dr⊗dr + r Hess r; x = π/2 | ≥ x cot x · g since x cot x ≤ 1; 1 − x cot x ≤ (2/π)x ≤ x, giving the term k√κ‖V‖(B̄_t) | sound |
| 6.3 lower bound (changed) | see F01 row | 2a against 4a; 2ρ against 2ρ; 2.094 against 0.736 | sound |
| 6.4 constancy (headline) | atom on a line; g = e^{2t}dt²; a line through two disjoint balls | ratio 2r/(2r + 1) → 0, δV'(X) = 1; (e^tX)' integrates to 0; multiplicities 1 and 2 are stationary on the disconnected Σ, so connectedness of Σ itself (not of a larger manifold) is what the statement needs and has | sound |
| 6.4 route | ν(B̄_r) ≤ c_t r^k | D(t) ≥ ω_k/c_t > 0, ∫_A D dν ≤ dt(A) = 0, so ν(A) = 0 | sound |
| 7.2 varifold tangents (headline) | bounds; μ = (1 + ½ sin log r cos ϑ)dr dϑ | λ^{1−k}‖δV‖(B_{λR}) = R^{k−1}(λR)^{1−k}‖δV‖(B_{λR}) → 0; d/dλ of λ^{−k}∫h(y/λ) is −λ^{−k−1}∫(kh_λ + y·∇h_λ) = 0; μ(B_ρ) = 2πρ, angular test −π/4 at 1 and π/4 at e^π | sound |
| 7.3 rectifiability (headline) | stationary C with ‖C‖(B_R(0)) = Θω_kR^k | ρ^{−k}‖C‖(B_ρ(y)) ≤ lim_R R^{−k}‖C‖(B_{R+\|y\|}(0)) = Θω_k and ≥ ω_kΘ(‖C‖, y) ≥ Θω_k: equality, so P_{S^⊥}(z − y) = 0 | sound |
| 7.4 compactness (headline) | alternating lines; zigzag, i = 2; circles 1/i | integrals 1, 0, 1, …; √2 + 2, general √2(i − 1) + 2, weight √2H¹; ‖δV_i‖ = 2π, mass 2π/i | sound |
| 7.5 lemma | m planes; two sheets | m ≤ (1 + δ)m + δ; 2 ≤ 2(1 + δ)(1 − ε²/16)^{1/2} + δ | statement sound; too weak for 7.6: R01 |
| 7.6 integral compactness (headline) | ψ_i = 1 + i·1_{E_i} | weak limit 3/2, bound off E_i, min(ψ_i, 2) → 1 | route: R01; statement sound |
| 8.1 rectifiable cones | ½v(L, 1); step multiplicity; rescaled exceptional sets | ρ⁻¹·½·2ρ = 1 ↛ 0; ρ⁰·1 = 1 ↛ 0; λ^{−k}‖V‖({Θ < 1} ∩ B_{λR}) → 0 gives 7.1's hypothesis | sound |
| 8.2 integral cones (headline) | integral V; x ∉ spt‖V‖ | {Θ < 1} is ‖V‖-null, so 8.1 applies; VarTan = {0} | sound (inherits R01 through 7.6) |
| 9.3 comparison (headline) | [[P]] − [[P]]; multiplicity 2, both orientations; unit circle | 0 against v(P, 2); v(P, 2) twice; H = −x = γ'' | sound; R02 |
| 9.4 | C_{p,q} ⊆ ℝ^{p+q+2}, p + q = n − 1 ≥ 7 | ambient dimension ≥ 9, every such cone minimizing | sound |

### Sources: the seeded sample, read at the locators

No locator was flagged unverified by the author.

| Target | Text opened | Outcome |
|---|---|---|
| 1.1 | Simon1983 line 7295–7305 | subspaces with the metric of the projections; G_n(K) compact. Match. |
| 1.3 | Simon1983 line 7308–7317 | varifold, weight through π, mass, restriction. Match. |
| 2.1 | Simon1983 line 2276–2301, 2352–2374 | 11.4–11.6, 11.8 (μ_{x,λ}, the set M, θ extended by 0, μ = Hⁿ⌞θ), 11.9. Match. |
| 2.3 | Simon1983 line 2861–2867, 1855–1859, 7318–7320 | rectifiable varifold and weight; area of a C¹ graph; the multiplicity-one notation is at 7318–7320. Match. |
| 3.2 | Simon1983 line 7336–7338, 3407–3413 | V_{x,λ} in 38.1; enlargements. Match. |
| 4.2 | Simon1983 line 857–882 | 4.1 and 4.2 (open-set formula). Match; uniqueness is the README's addition. |
| 4.4 | Simon1983 line 7486–7509 | read by the earlier round with computed values; statement unchanged. |
| 5.2 | Simon1983 line 2005–2016, 2954–2971, 7675–7682 | 9.6 (stationarity in N with the trace of B), 16.4, 41.2(3). Support the formula's special cases; the general formula is derived in the route, recomputed above. |
| 6.2 | Scharrer2022 line 1120–1127, 1184–1203 | Lemma 3.3 (closed balls, the term m∫(1 − a)/r), Remark 3.4 (c(π/2) = 2/π, bound m√b‖V‖(B̄_t)). Match. |
| 6.4 | Simon1983 line 7664–7732 | 41.1, 41.2(1), proof (f grad f, density from monotonicity, coordinate derivatives). Match; see Source issues. |
| 7.2 | Simon1983 line 7733–7735, 7793–7808 | 42.1 displays lost in the extraction (Not verifiable); earlier round's reading of 42.2–42.3 relied on. |
| 7.4 | Simon1983 line 7882–7898 | 42.7: sup of mass plus first variation, density ≥ 1 off A_j, subsequence, lim inf. Match. |
| 8.1 | Simon1983 line 7793–7805 | 42.6 with the hypothesis on {Θ < 1}, the cone property and y ∈ T_yM. Match. |
| 8.2 | Simon1983 line 7899–7912; EdelenSpolaor2023 line 104–112 | 42.8; tangent cone equal up to rotation to C_{p,q} with multiplicity one. Match. |
| 9.3 | Simon1983 line 7253–7265 | the motivating passage on varifolds of integer multiplicity currents. Supports the context only; the comparison is the README's own, as it says. |

Also read: Simon1983 line 7916–8151 (proof of 42.8, 42.9, 42.10), which gave R01.

### Duplication audit, pins, suppliers, direction

- Pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, as in `lake-manifest.json`). Opened this round:
  `Besicovitch.vitaliFamily`, `ae_tendsto_rnDeriv`, `ae_tendsto_measure_inter_div_of_measurableSet`
  (`Mathlib/MeasureTheory/Covering/Besicovitch.lean:1020, 1077, 1088`; the second needs both measures
  locally finite, as 6.4's route provides), `VitaliFamily.ae_tendsto_average`
  (`…/Covering/Differentiation.lean:856`), `Vitali.vitaliFamily` (`…/Covering/Vitali.lean:460`),
  `Measure.setLIntegral_rnDeriv_le` (`…/Measure/Decomposition/RadonNikodym.lean:319`, no
  σ-finiteness), `MeasureTheory.Measure.condKernel` (`Mathlib/Probability/Kernel/Disintegration/StandardBorel.lean:361`,
  finite measures), `RealRMK.rieszMeasure`, `integral_rieszMeasure`,
  `Measure.ext_of_integral_eq_on_compactlySupported` (`…/RieszMarkovKakutani/Real.lean:66, 341, 408`),
  `Continuous.homeoOfEquivCompactToT2` (`Mathlib/Topology/Homeomorph/Lemmas.lean:479`),
  `LinearMap.normDet`, `normDet_comp` (`Mathlib/Analysis/InnerProductSpace/NormDet.lean:69, 324`),
  `InnerProductSpace.euclideanHausdorffMeasure_eq_volume` (`Mathlib/Geometry/Euclidean/Volume/Measure.lean:191`),
  `isStarProjection_starProjection`, `isStarProjection_iff_eq_starProjection_range`
  (`Mathlib/Analysis/InnerProductSpace/Adjoint.lean:507, 513`); Tau Ceti `finiteGrassmannian`
  (`TauCeti/Topology/Grassmannian/Basic.lean:52`), its `CompactSpace` (`Orthonormal.lean:225`) and
  `T2Space` (`Plucker.lean:89`), `toEuclidean`, `toEuclidean_injective`,
  `continuous_starProjection_toEuclidean` (`Tautological.lean:73, 80, 110`),
  `Distribution.HasLocallyFiniteMass` (`…/Distribution/Mass/Basic.lean:353`), `massMeasure`,
  `massMeasure_preimage_coe`, `enorm_apply_le_lintegral_massMeasure` (`…/Mass/Measure.lean:191, 213, 306`),
  `RealRMK.posPart` (`…/RieszMarkovKakutani/Signed.lean:160`), `globalFlow`,
  `contMDiff_globalFlow_uncurry`, `globalFlowDiffeomorph` (`…/IntegralCurve/GlobalFlow.lean:60, 147, 190`),
  `isCompleteVectorField_of_isCompact_of_eq_zero_off` (`…/Flow/Complete.lean:144`),
  `riemannianVolume`, `eq_riemannianVolume_iff` (`…/VolumeDensity/Volume.lean:82, 93`),
  `Manifold.divergence` (`…/Riemannian/Laplacian.lean:55`), `Manifold.integral_divergence_eq_zero`
  (`…/Riemannian/DivergenceTheorem.lean:225`), the flat `integral_divergence_eq_zero`
  (`…/DivergenceTheorem/CompactSupport.lean:30`), `CountablyRectifiable`, `mono`, `congr`, `iUnion`,
  `image` (`…/Rectifiable/Basic.lean:44, 74, 78, 122, 135`),
  `isCompact_closure_of_isTightMeasureSet_of_mass_le` (`TauCeti/MeasureTheory/Measure/Prokhorov.lean:52`).
  Grep of both pins for "varifold": nothing.
- Suppliers resolved on main (`1a19c9f`). GeometricCurrents: G1 constancy criterion (line 229–238);
  G2 manifold/chart comparison and mass = |multiplicity|·Hᵏ (240–247), locally integral currents
  (249–259), mass measure of a compact oriented smooth source = Riemannian volume (268–272); G5
  local area minimization by comparison with T + ∂Q on relatively compact variation domains
  (638–640); G6 unoriented Grassmann bundle, compactness, auxiliary varifold, first variation,
  stationarity of local minimizers, monotonicity, tangent cones (668–690). GeometricMeasureTheory
  G2 (148–165): approximate tangent planes, tangential differentiation, C¹ graphs, area formula
  with extended multiplicities, injective and tangential versions. RiemannianGeometry R4 item 1
  (2311–2318): radial Hessian zero and the transverse lower bound by s_κ'/s_κ under K ≤ κ before
  the first zero; R5a signs (189–191: B = −g·x on the outward unit sphere, H = (1/m) tr B); R5a.2
  (3362). HopfRinow under `Completed/`, Layers 0–2 (229, 264, 427: normal balls, local logarithm,
  Gauss lemma, local distance identity). None of these roadmaps has an open revision in the list of
  open pull requests.
- Ownership against open work: `roadmaps grep -i varifold` over main and the 476 open heads finds
  the word only on main (GeometricCurrents, GeometricMeasureTheory, RiemannianGeometry/MinimalSurfaces).
  MinimalSurfaces 3.1 (line 708–709) is the smooth monotonicity and uses no varifold.
  ManifoldOptimization (open) uses the pinned `finiteGrassmannian` with GeneralizedCohomology
  G4.0b's smooth structure and builds no bundle of planes over a manifold. The board package index
  (AnalyticNumberTheory, LawrenceVenkateshMethod) holds no package on this subject. Overlap
  report: no pull request changes this roadmap, no dropped id, no revision-only id, no second copy.
- `roadmaps resolve`: no cross-roadmap citation and no Lean name found nowhere.

Overlap check: read GeometricCurrents, GeometricMeasureTheory, MinimalSurfaces (main), ManifoldOptimization, LorentzianGeometry, PointProcesses, QuasiregularMaps, BanachSpaceTheory (open, by vocabulary; the third list is empty); the unoriented Grassmann bundle by orientation quotient, its Radon compactness and the auxiliary varifold of an integral current with its first variation, monotonicity and tangent cones: owner GeometricCurrents G6 (cited, compared in 1.2 and 9.3); approximate tangent planes and the area formula: owner GeometricMeasureTheory G2 (cited); monotonicity for smooth proper minimal immersions: owner MinimalSurfaces 3.1 (not restated); the coordinate Grassmannian: Tau Ceti at the pin (cited, compared in 1.1); the general varifold carrier and its theory: this roadmap; the open five share nothing.

Dependency check:

    candidate: Varifolds is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
    depcheck: 245 roadmaps, 2233 edges, 0 problem(s)

No UPWARD or CYCLE line. No supplier is on the never-cite list.

### Headlines and Lean form

Headline theorems (Summary): the Riesz decomposition (4.4); monotonicity, Euclidean and Riemannian
(6.1–6.2), with existence and semicontinuity of densities (6.3); Allard's rectifiability theorem
(7.3); compactness of rectifiable and of integral varifolds (7.4, 7.6); varifold tangents and
rectifiable and integral cones (7.2, 8.1–8.2); constancy (6.4); intrinsic against ambient (5.2);
comparison with GeometricCurrents G6 (9.3). There is no `Suggested.lean` at this stage, so the
padding probe, the `#check` comparison and the import header do not apply.

### Copyright, arrangement, reuse

Wording: the README was set beside the source at each locator of the sample table and at
Simon1983 line 7916–8151. The statements share only forced formulas and standard names; 2.1 adds
the manifold form and chart law, 6.4 changes the conclusion (the alternative V = 0, closedness),
7.4 is stated for varying metrics with all subsequential limits, 7.5–7.6 routes are summaries in
three steps with the README's own accounting. Arrangement: Simon1983's Chapter 8 runs §38–§42; the
README splits §38 over 1.1–1.3 and 3.3, takes Layer 2 from §11 and §15, merges §40–§41 with
§17–§19 in Layer 6, moves 40.6 to 7.1, splits §42 over Layers 7 and 8, and adds Layers 5 and 9,
4.5 and 6.2 from other sources: no one-to-one run. The order first variation → monotonicity →
tangents → rectifiability is forced by the *Needs:* lines (6.1 needs 4.1–4.4; 7.2 needs 6.1, 6.3;
7.3 needs 7.1–7.2, 6.4). Reuse: no table, figure or exercise list taken over.

Source independence: 15 passages compared with 3 sources (Simon1983, Scharrer2022, EdelenSpolaor2023), none shared; largest share Simon1983, 82 of 132 source references; contents compared with Simon1983 (Chapters 3, 4 and 8): independent. Federer1969, Allard1972 and Maggi2012 could not be read (settled as uncertified).

## Not verifiable

- Federer1969 2.5, 2.8, 3.2; Allard1972 Sections 3–6, 8; Maggi2012 Part II: settled as uncertified,
  cited by locator only; not requested.
- Simon1983 42.1 (line 7735), the displays (7), (8) of the proof of 42.8 (line 7975–7978) and the
  displayed hypotheses of 42.9 (line 7992–8000) are lost in the extracted text. R01 does not depend
  on them: its witness is against the README's own statement of 7.5 and its route.
- That the induction in the proof of 42.9 uses the slab estimates only at the chosen fibre points
  (so that the strengthened conclusion of R01's repair is what the proof gives): read at line
  8047–8151, where part of the displays is lost; the fix worker should confirm it there.
- 7.5 for h ≠ e: no source states it; the README marks it as its own with a route.
- Lean elaboration, one-tactic probes, `#check` comparison: no Lean file at the design stage.

## Source issues

- **Gap** in Simon1983 at proof of 42.8, printed page 249–250: the source says L¹ convergence of the truncated fibre multiplicities follows from their convergence as measures and the bound of 42.9 off small sets; it should be also using that the varifold mass over the exceptional sets tends to zero, as the proof of 42.9 gives; affects the proof.
- **Misprint** in Simon1983 at proof of 42.8, printed page 250: the source says the maximum of the fibre multiplicity and an integer N above the limit converges to the limit; it should be the minimum; affects the proof.
- **Error** in Simon1983 at Theorem 41.1, printed page 240: the source says a stationary varifold supported in a connected submanifold M of the whole space is a constant multiple of M in U; it should be requiring M ∩ U connected (a line through two disjoint balls carries two multiplicities); affects a stated result.

## For the human reviewers

- **Licence.** `Simon1983` is recorded with `licence_class = "institutional"` in `packages/Varifolds/sources.toml` (line 69); I read the cached text and did not verify the host's terms.
- **Licence.** `AgnolettoCorreaHoyosDaSilvaNardulli2025` is an arXiv preprint (v3) with no published version recorded; it is cited for Riemannian definitions and Theorems 2.30, 2.32, each beside a Simon1983 locator.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "27a6338ceff9bdc936278305cee86a5b5dbf72b7", "job": "REV-DESIGN-Varifolds~8", "model": "fable", "worker": "chris-x79"} -->
