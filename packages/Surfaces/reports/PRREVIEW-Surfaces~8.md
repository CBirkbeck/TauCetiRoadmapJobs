# Review of Surfaces (pull request #2225 at 0ba7c9c)
Folder: `TauCetiRoadmap/RiemannianGeometry/Surfaces/`
**Verdict:** needs changes

## R01 (P2) — Layer 6 headlines are statable at the pins but absent from `Suggested.lean`

**Location:** `Suggested.lean` 27–28: "Layer 6, the logarithmic cutoff, is specified in `README.md` and has no signature here."

**Claim:** Both Layer 6 headlines can be stated at the pins: the energy bound of 6.1 and the extension of 6.2 across a finite set. Every carrier they need exists there (`mgradient`, `riemannianVolume`, `Real.smoothTransition`, `dist`, `tsupport`), plus one profile definition with a real body. Neither is stated, and the docstring names no missing carrier.

**Witness:** I added the block below to a scratch copy of `Suggested.lean`. It elaborates under `lake env lean` with only `sorry` warnings. `#check @…` keeps `[I.Boundaryless]`, `IsRiemannianManifold` and the measure binders. `first | rfl | simp | infer_instance` closes neither theorem.

**Repair:**
- Delete the quoted sentence.
- Insert the block below before `end TauCetiRoadmap.RiemannianGeometry.Surfaces`.
- In README 6.1, after the energy bound, add: "Lean names: `logCutoffProfile` for ψ_ε and `exists_abs_integral_norm_mgradient_logCutoff_sub_le`."
- In README 6.2, after the deduction, add: "Lean name: `integral_mul_sq_le_integral_norm_mgradient_sq_of_finite`."

```lean
/-! ## Layer 6: the logarithmic cutoff -/

section LogCutoff

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {M : Type*} [MetricSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
  [IsRiemannianManifold I M] [MeasurableSpace M] [BorelSpace M] [LindelofSpace M]
  [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)]

open TauCeti TauCeti.Manifold

/-- Layer 6.1: the logarithmic cutoff profile `ψ_ε`, built from `Real.smoothTransition`; for
`0 < 4ε ≤ δ` it is `0` on `[0, ε]`, `log(r/ε)/log(δ/ε)` on `[2ε, δ/2]` and `1` on `[δ, ∞)`. -/
def logCutoffProfile (ε δ r : ℝ) : ℝ :=
  if r ≤ 0 then 0 else
    Real.log (r / ε) / Real.log (δ / ε) * Real.smoothTransition (Real.logb 2 (r / ε)) +
      (1 - Real.log (r / ε) / Real.log (δ / ε)) *
        (1 - Real.smoothTransition (Real.logb 2 (δ / r)))

/-- Layer 6.1: on a metric normal ball of radius `R` with compact closure, the logarithmic
cutoff `χ_ε = ψ_ε(d(p, ·))` is smooth and its Dirichlet energy is `2π/log(δ/ε)` up to
`C/log(δ/ε)²`, with `C` independent of `ε`. -/
theorem exists_abs_integral_norm_mgradient_logCutoff_sub_le (hE : Module.finrank ℝ E = 2)
    (p : M) {R : ℝ} (hR : 0 < R)
    (hdom : Metric.ball (0 : TangentSpace I p) R ⊆ expDomain I M p)
    (hbij : BijOn (riemannianExp I M p) (Metric.ball 0 R) (Metric.ball p R))
    (hdist : ∀ v ∈ Metric.ball (0 : TangentSpace I p) R, dist p (riemannianExp I M p v) = ‖v‖)
    (hcpt : IsCompact (Metric.closedBall p R)) {δ : ℝ} (hδ : 0 < δ) (hδR : δ < R) :
    ∃ C : ℝ, ∀ ε : ℝ, 0 < ε → 4 * ε ≤ δ →
      ContMDiff I 𝓘(ℝ) ∞ (fun x ↦ logCutoffProfile ε δ (dist p x)) ∧
      |(∫ x, ‖mgradient I (fun y ↦ logCutoffProfile ε δ (dist p y)) x‖ ^ 2
          ∂riemannianVolume I M) - 2 * Real.pi / Real.log (δ / ε)| ≤
        C / Real.log (δ / ε) ^ 2 := by
  sorry

/-- Layer 6.2: on a surface, an inequality `∫ V φ² ≤ ∫ |grad φ|²` with `V` continuous that holds
for the compactly supported `C^k` functions whose support misses a finite set `B` holds for every
compactly supported `C^k` function. -/
theorem integral_mul_sq_le_integral_norm_mgradient_sq_of_finite (hE : Module.finrank ℝ E = 2)
    {B : Set M} (hB : B.Finite) {k : ℕ∞} (hk : 1 ≤ k) (V : M → ℝ) (hV : Continuous V)
    (h : ∀ φ : M → ℝ, ContMDiff I 𝓘(ℝ) k φ → HasCompactSupport φ → Disjoint (tsupport φ) B →
      ∫ x, V x * φ x ^ 2 ∂riemannianVolume I M ≤
        ∫ x, ‖mgradient I φ x‖ ^ 2 ∂riemannianVolume I M)
    (φ : M → ℝ) (hφ : ContMDiff I 𝓘(ℝ) k φ) (hφc : HasCompactSupport φ) :
    ∫ x, V x * φ x ^ 2 ∂riemannianVolume I M ≤
      ∫ x, ‖mgradient I φ x‖ ^ 2 ∂riemannianVolume I M := by
  sorry

end LogCutoff
```

## R02 (P3) — Downstream consumers denies a consumer that is on main

**Location:** `README.md` 928–929: "No roadmap on main consumes this sub-roadmap; RiemannianGeometry R1, R2, R3, R4.2, R4.9.6a and R6 supply it and take nothing back."

**Claim:** This is false. PositiveMass, which the paragraph's first sentence names as a consumer, is on main and consumes S3.

**Witness:** On main, `TauCetiRoadmap/PositiveMass/README.md:148` has the heading "From TauCetiRoadmap.RiemannianGeometry.Surfaces (on main)". S3 is used in §3.1 at lines 50, 729 and 736.

**Repair:** Replace the quoted sentence with "RiemannianGeometry R1, R2, R3, R4.2, R4.9.6a and R6 supply it and take nothing back."

## Verified sound

| Statement | Instances | Computed values (left / right) | Result | Change |
|---|---|---|---|---|
| 6.1 profile ψ_ε | `4ε ≤ δ`; r = ε, 2ε, δ/2, δ | `ψ(ε) = 0`; at 2ε and δ/2 both τ-factors are 1, so `ψ = λ`; `ψ(δ) = 1` (the last proved in the scratch probe) | holds | none |
| 6.1, `4ε ≤ δ` | δ = 2ε, r = 1.5ε | `1 − λ = 0.415`, `τ(log₂(4/3)) ∈ (0,1)`, so the second term is nonzero and `ψ ≠ λτ` on `[ε, 2ε]` | hypothesis load-bearing | none |
| 6.1 `ψ_ε′ ≤ c₀/(rΛ)` | `[ε, 2ε]` with v = log₂(r/ε); `[δ/2, δ]` | `ψ′ = (τ + vτ′)/(rΛ)` on both end zones; numerical `sup τ′ = 2.000`, so `c₀ = 3` | holds | none |
| 6.1 flat λ | δ = 1, ε = e⁻¹⁰ | `∫_ε^δ (rΛ)⁻² 2πr dr = 2π/Λ = 0.6283` / `0.6283` | holds | none |
| 6.1 curved λ | unit sphere, ℍ²; same δ, ε | `0.6232`, `0.6337` / `2π/Λ = 0.6283`; deviations `−0.0051`, `+0.0054` against `(2π/12)δ²/Λ² = 0.0052` | holds | none |
| 6.1 smooth χ_ε in the plane | Λ = 10 | `∫₀¹(τ + vτ′)² = 1.4408`, `c = 3.8397`; quadrature of the full profile `0.66672` / `0.6283 + 0.0384 = 0.6667` | holds | none |
| 6.1 bound with the stated C | unit sphere and ℍ², δ = 1, Λ = 10 | `|E − 2π/Λ| = 0.0328`, `0.0442` / `C/Λ² = 0.872` (M = 2π), `1.010` (M = 2π sinh 1) | holds | none |
| 6.1 constants | M, `|L − 2πr|`, middle zone | `L ≤ (2π + κ₀V(δ))r`; `V(ρ) ≤ Mρ²/2` gives `κ₀Mr³/6`; `(κ₀M/6Λ²)·δ²/8 = κ₀Mδ²/(48Λ²)` | holds | none |
| 6.1 API `1 − χ_ε ≤ log(2δ/r)/Λ` | r ≤ 2ε; r ∈ [δ/2, δ] | `log(2δ/r) ≥ Λ`; `(1−λ)τ ≤ log(δ/r)/Λ`; `∫₀^δ r log(2δ/r)² dr = 0.8368δ² ≤ δ²` | holds | none |
| 6.1 negative controls | linear cutoff, ε = 0.01; the line | quadrature `9.42478` / `3π = 9.42478`; Cauchy–Schwarz gives `≥ 1/δ` on each side / `2/δ` | holds | none |
| Scope, n ≥ 3 | linear cutoff, n = 3 and 4, ε = 0.1 | quadrature `2.93215`, `0.74022` / `(2ⁿ − 1)ω_n ε^(n−2) = 2.93215`, `0.74022` | holds | none |
| 6.2 radius from a normal ball | `0 < R < R′` | `image_riemannianExp_ball` (Distance:251) gives the metric R-ball; `closedBall 0 R ⊆ ball 0 R′` feeds Distance:227 and Normal/Basic:185 | holds; `R < R′` needed for compactness | none |
| 6.2 support of φ_ε | b ∈ B | `ψ_ε = 0` on `[0, ε]` and `> 0` on `(ε, ∞)`, so `tsupport ⊆ {d(b,·) ≥ ε}` and misses b | extension hypothesis applies | none |
| 6.2 `W^(1,2)` bound | `mgradient_mul` (Basic:141) | `|a + b|² ≤ 2|a|² + 2|b|²` with `a = (χ^B − 1)∇φ`, `b = φ∇χ^B` gives exactly the two stated terms | holds | none |
| 6.2 Checks | B = ∅; plane B = {0}, δ = 1; B = {(±1, 0)}, δ = 1/2 | empty product 1; `∫|φ_ε − φ|² ≤ 0.84·2π/Λ²`, `φ(0) − φ_ε(0) = 1`; centres 2 apart, `2δ = 1`, `E = 2E(χ_ε)` | holds | none |
| 6.2, dimension 1 | V = `1/(4 max(1, x²))`; T = 20 and 16 | T = 20: `∫φ′² ≤ 0.4 < 0.5 ≤ ∫Vφ²`; T = 16: `0.5` against `≥ 0.5`, no contradiction | fails exactly for T > 16, as stated | none |
| Layer 6 Examples | a = R, b = R²; inversion `1/z` | `2π/log(R²/R) = 2π/log R`; `[R, R²]` maps to `[R⁻², R⁻¹]`, Chodosh's radii `ε², ε` with ε = 1/R | matches PositiveMass README:837 | none |
| R01 Lean 6.1 | quantifier order; denominators | `∃ C, ∀ ε` with C fixed before ε; `δ/ε ≥ 4`, so `log(δ/ε) ≥ 1.386 > 0` | matches README | add (R01) |
| R01 Lean 6.2 | k = 1 and ⊤; B = ∅ | `1 ≤ k` admits `C¹` and `C^∞`; for B = ∅ the hypothesis is the conclusion; `hE` excludes the line counterexample | matches README | add (R01) |
| Downstream consumers | PositiveMass on main | main README:148 consumes S3 / the text says no roadmap on main consumes this one | false | R02 |
| 1.1 `polar_jacobian_ode` | ℝ², S², ℍ²; `j = r` on S² | `0 + 0 = 0`; `−sin r + sin r = 0`; `sinh r − sinh r = 0`; `0 + r ≠ 0` | holds | none |
| 1.2 `normalStrip_jacobian` | circle of radius ρ, inward; latitude φ₀ | `a_t(0) = −1/ρ = −k_g`; `a_t(0) = −cot φ₀ = −k_g` and `a_tt + a = 0` | holds | none |
| 1.3 | `[0,1]` with the points (1/2, 2) and (2, 1) | `(0, −2)·(1, 0) = 0`; `(−1, −1)·(1, 0) = −1` | interior hypothesis load-bearing | none |
| 1.4 `hasDerivAt_polarLength_and_volume_ball` | S², r = 1 | `2π(sin 1 − 1) = −0.9961` on both sides; `2π(1 − cos 1) − π = −0.2532 = −2π(1/2 − (1 − cos 1))` | holds | none |
| 2.1 | disk of radius ρ; rectangle; hemisphere | `c ≡ ρ`; `c ≡ b`; `c ≡ π/2` | holds | none |
| 2.2 | ρ = 1, ℓ = 2, R = 3/2 and 1/2 | `π` / `2π∫₀¹(1 − t)dt = π`; `3π/4` / `2π(1/2 − 1/8) = 3π/4` | holds | none |
| 3.1 `integral_signedCurvature_add_sum_exteriorAngle_eq_two_pi` | circle; square; L-shape | `2π`; `4·π/2`; `5π/2 − π/2`: all equal `2π` | holds | none |
| 3.2 `integral_curvature_…_eq_two_pi` | unit disk; octant; lune of angle β | `0 + 2π + 0`; `π/2 + 0 + 3π/2`; `2β + 0 + 2(π − β)`: all equal `2π` | holds | none |
| 4.1 `exists_disk_of_simpleClosedCurve` | annulus core circle; hyperbolic triangle with angles π/4 | the hole lies in the filled hull but outside Ω; `−A + 9π/4 = 2π` gives `A = π/4` | holds | none |
| 4.2 `riemannianExp_bijOn_ball_of_curvature_nonpos` | lune; equator as a loop | `2β = β + β`; `2π = π + π`; both positive, so excluded under `K ≤ 0` | holds | none |
| 5.1 `integral_norm_mgradient_sq_rescale` (proved) | ℝ² with f = e^(2x); ℝ³ | `f·f⁻¹ = 1`; `f^(3/2)·f⁻¹ = e^x ≠ 1` | holds | none |
| 5.1 density locator | `det(fg) = f^N det g` | `(f^N)^(1/2) = f^(N/2)`, which is `f` for N = 2; LeeParker1987 line 239 | holds | none |
| 5.2 `integral_norm_mgradient_sq_comp_eq_of_pullback_eq_rescale` | Φ(z) = 2z | `∫ 4|∇φ(2z)|² dz` / `∫ |∇φ|² dw` with `dw = 4 dz` | holds | none |

- **Previous review and diff:** PRREVIEW-Surfaces~7 had no findings, so nothing to re-check; Layers 1–5 are byte-identical to main (#1974 merged); the diff touches `Surfaces/README.md` (+186/−5), the `Suggested.lean` docstring and the parent index.
- **Source locators checked against the text (3):** Chodosh2025 (author page, dated 15 September 2025) Lemma 5.8 on printed p. 20 (line 766, cutoff at 767–781) and Lemma 33.5 on printed p. 81 (lines 3576–3578); LeeParker1987 (AMS open archive) p. 42, line 239.
- **Library declarations opened at the pins (12):** Mathlib `SmoothTransition.lean` :147, :162, :169, :223; Tau Ceti `Geodesic/Normal/Basic.lean` :163, :185; `Geodesic/Gauss/Distance.lean` :227, :251, :292; `Gradient/Basic.lean` :73, :141; `Gradient/ChainRule.lean` :143.
- **Cross-roadmap citations resolved (4):** PositiveMass §3.3 (main, README 811–839: cutoff on `R ≤ r ≤ R²`, energy `2π/log R`); ComplexCurveModuli D6 (main, README:143: annulus minimizer, capacity/modulus identity); PositiveMass's S3 citation (main, README:148); consumer MinimalSurfaces at its open head (README 171–182, 995–1001) matches S6.
- **Gate:** the worker's gate at 0ba7c9c is all 0 with `build=0`; my rerun prints only `outside-folder: TauCetiRoadmap/RiemannianGeometry/README.md`, the parent index the brief names as this pull request's own (exclusion diff empty); dependency check verbatim: `depcheck: 206 roadmaps, 1897 edges, 0 problem(s)`.
- **Elaboration and signatures:** `lake env lean` gives 8 `sorry` warnings (lines 57, 78, 103, 131, 166, 211, 237, 286) and nothing else; `first | rfl | simp | infer_instance` fails on all 8 and on both R01 theorems; `#check` of the R01 theorems keeps every binder they use.
- **Duplication:** `capacity` and `logarithmic cut` find no log cutoff or point capacity in pinned Mathlib or Tau Ceti; the only hit, `TauCeti/Analysis/SpecialFunctions/Log/NatCastAdd.lean`, concerns the natural numbers.
- **Overlap check:** read RiemannianGeometry (main; #2222–#2224, #2226), MinimalSurfaces (#2226), PositiveMass, HopfRinow and ComplexCurveModuli (main), CanonicalModelsAndGonality (open); cutoff at infinity: PositiveMass §3.3; annulus capacity: ComplexCurveModuli D6; cutoff at a point: this roadmap, cited by MinimalSurfaces and used without ownership in CanonicalModelsAndGonality 8.3/8.5.

## Not verifiable

- do Carmo, *Differential Geometry of Curves and Surfaces* (1976), §4-5, §4-6 and §5-7, cited for 1.1, 1.4, 3.1 and 3.2: the sources service found no legal copy.
- Lee, *Introduction to Riemannian Manifolds*, 2nd ed., cited for 1.1–1.3, 2.1, 3.1, 3.2 and 4.1–5.2: DOI 10.1007/978-3-319-91755-9 is paywalled, so the citation is uncertified.
- Chavel, *Riemannian Geometry*, 2nd ed., §III.1, §III.2 and §III.6, cited for 1.2, 1.4, 2.1 and 2.2: only the CUP landing page is reachable, with no open copy.
- do Carmo, *Riemannian Geometry* (1992), Chapter 7, Theorem 3.1, cited for 4.2: the Springer DOI is paywalled, so the citation is uncertified.

## Source issues

- **Misprint** in Chodosh2025 at the proof of Lemma 5.8, printed p. 20: the source says the planar log-cutoff between the radii ε² and ε has Dirichlet energy `1/|log ε|`; it should be `2π/|log ε|`, since the factor 2π of the integral just before it is dropped; affects nothing.
