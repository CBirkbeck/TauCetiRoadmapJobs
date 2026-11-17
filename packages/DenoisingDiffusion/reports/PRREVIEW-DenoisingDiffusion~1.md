# Review of DenoisingDiffusion (pull request #2476 at 23ba0a5)

**Verdict:** needs changes

## R01 (P1) — Fourteen theorems are not stated: section variables elaborate to `Fin sorry`

**Location:** `TauCetiRoadmap/DenoisingDiffusion/Suggested.lean` lines 156–157 and 235: `{μ₀ : Measure E} [IsProbabilityMeasure μ₀] {X Z : Ω → E} {c s : ℝ}` and `variable {μ₀ : Measure E} [IsProbabilityMeasure μ₀] {T : ℕ} {rev κ : ℕ → Kernel E E}`.

**Claim:** Inside a `variable` binder the local notation `E` loses `d`. Nine theorems are never added to the environment (`hasLaw_smoothedDensity`, `tweedie_noise`, `tweedie`, `tweedie_covariance`, `memLp_noisyScore`, `dsm_eq_esm_add`, `noisePrediction_minimizer`, `forwardPath_reverse`, `posteriorLoss_minimizer`); five more have `sorry` in their types (`klDiv_forwardPath_eq`, `klDiv_le_klDiv_forwardPath`, `forwardPath_map_posterior`, `klDiv_posterior_rev_le`, `klDiv_posterior_gaussian_integral`). The build reports only 15 `sorry` warnings for 24 sorried theorems.

**Witness:** Append `#check @tweedie`: `Unknown identifier`. `#check @klDiv_forwardPath_eq` prints `{μ₀ : Measure (EuclideanSpace ℝ (Fin sorry))}` and `klDiv (forwardPath μ₀ β T) sorry = …`.

**Repair:** Write the two `variable` lines without the notation:

```lean
variable {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
  {μ₀ : Measure (EuclideanSpace ℝ (Fin d))} [IsProbabilityMeasure μ₀]
  {X Z : Ω → EuclideanSpace ℝ (Fin d)} {c s : ℝ}
```

```lean
variable {μ₀ : Measure (EuclideanSpace ℝ (Fin d))} [IsProbabilityMeasure μ₀] {T : ℕ}
  {rev κ : ℕ → Kernel (EuclideanSpace ℝ (Fin d)) (EuclideanSpace ℝ (Fin d))}
```

Tested on a scratch copy: 24 `sorry` warnings, no error, `#check @name` succeeds for all 42 declarations and no type contains `sorry`.

## R02 (P3) — README and Lean state 4.2's identity and 4.3's minimizer at different generality

**Location:** `TauCetiRoadmap/DenoisingDiffusion/README.md` lines 378–381 ("**the surrogate identity:** for `t ≥ 2`, `klDiv (ρₜ ⊗ₘ postKernel β t) …`") and lines 407, 416–418 ("For `t ≥ 2`, prove: … among such `ε̂ t` …").

**Claim:** `klDiv_posterior_eq_add` is stated in Lean for an arbitrary probability measure `ρ` on `E × E` and arbitrary Markov `post`, `rev`, `κ` under a marginalisation hypothesis; the README states it only for `ρₜ`, `postKernel β t`, `t ≥ 2`. `posteriorLoss_minimizer` has `1 ≤ t` in Lean and `t ≥ 2` in the README.

**Witness:** `Suggested.lean` lines 289–295 (no `β`, `t`, `μ₀` in the statement) and line 329 (`ht : 1 ≤ t`). At `t = 1`: `c = √α 1`, `s = √β 1 > 0`, so 3.3 applies.

**Repair:** In 4.2 replace the bullet's statement by: "for a probability measure `ρ` on `E × E` and Markov kernels `post : Kernel (E × E) E`, `rev, κ : Kernel E E` with `(ρ ⊗ₘ post).map (fun p ↦ (p.1.2, p.2)) = ρ.map Prod.snd ⊗ₘ rev`, `klDiv (ρ ⊗ₘ post) (ρ ⊗ₘ Kernel.prodMkLeft E κ) = klDiv (ρ.map Prod.snd ⊗ₘ rev) (ρ.map Prod.snd ⊗ₘ κ) + klDiv (ρ ⊗ₘ post) (ρ ⊗ₘ Kernel.prodMkLeft E rev)` in `ℝ≥0∞` (`klDiv_posterior_eq_add`); with `ρ = ρₜ`, `post = postKernel β t` and the first bullet this is the identity for `1 ≤ t ≤ T`." In 4.3 move the minimizer bullet out of "For `t ≥ 2`" and open it with "for `t ≥ 1`".

## R03 (P3) — README shape: no per-layer `### Dependencies`, no `## Downstream consumers`

**Location:** `TauCetiRoadmap/DenoisingDiffusion/README.md` line 434: "## Dependencies … Layer 1 uses MathematicalStatisticsNonparametric 1.3 and the Tau Ceti Gaussian suppliers. Layer 2 uses Layer 1."

**Claim:** Every layer ends with `### Examples` and `### Dependencies`, and the README has a `## Downstream consumers` section before `## References`; here the four layers end at `### Examples` and there is one global `## Dependencies`.

**Witness:** `TauCetiRoadmap/MathematicalStatisticsNonparametric/README.md` lines 583–588 (`### Examples`, `### Dependencies` closing Layer 1) and line 2924 (`## Downstream consumers`).

**Repair:** Split the four sentences of `## Dependencies` into a `### Dependencies` subsection after each layer's `### Examples` (Layer 1: MathematicalStatisticsNonparametric 1.3 and the Tau Ceti Gaussian suppliers; Layer 2: Layer 1; Layer 3: the Tau Ceti Gaussian density; Layer 4: Layers 1–3 and the Mathlib and Tau Ceti chain rules), delete `## Dependencies`, and add `## Downstream consumers`.

## R04 (P3) — `measurable_pathEval` has no docstring

**Location:** `TauCetiRoadmap/DenoisingDiffusion/Suggested.lean` line 80: `theorem measurable_pathEval {n : ℕ} (i : ℕ) (hi : i ≤ n) :`.

**Claim:** Every declaration carries a docstring stating the mathematics.

**Witness:** Lines 78–80: the docstring `/-- Evaluation of a path at time i. -/` belongs to `pathEval`; none precedes `measurable_pathEval`.

**Repair:** Add `/-- Evaluation of a path at a fixed time is measurable. -/` above line 80.

## R05 (P3) — 3.1 re-derives Gaussian-density bounds that Tau Ceti has as heat-kernel bounds

**Location:** `TauCetiRoadmap/DenoisingDiffusion/README.md` lines 247–248 and 258–259: "`‖y − c x‖^k φ_{s²}(y − c x)` is bounded in `x` for each `k`" with "*Needs:* Tau Ceti `multivariateGaussianPDFReal`, `multivariateGaussian_eq_withDensity`; Mathlib …".

**Claim:** The smoothness and weighted derivative bounds of `φ_{s²}` that differentiation under the integral uses exist at the pin and are not cited.

**Witness:** `TauCeti/Analysis/PDE/HeatKernel/Basic.lean` lines 76, 123 (`heatKernel`, `contDiff_heatKernel`); `Bounds.lean` line 181 (`exists_one_add_norm_pow_mul_norm_iteratedFDeriv_heatKernel_le`). `heatKernel (s²/2) y = (2πs²)^{−d/2} exp(−‖y‖²/(2s²)) = φ_{s²}(y)`.

**Repair:** Add to the Tau Ceti supplier contracts and to 3.1's *Needs:* "`TauCeti.heatKernel`, `TauCeti.contDiff_heatKernel`, `TauCeti.exists_one_add_norm_pow_mul_norm_iteratedFDeriv_heatKernel_le` (`TauCeti/Analysis/PDE/HeatKernel/Basic.lean`, `Bounds.lean`), with `φ_{s²} = heatKernel (s²/2)`", and state the identification `multivariateGaussianPDFReal 0 (s² • 1) = heatKernel (s²/2)` as an API bullet of 3.1.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 KL of isotropic Gaussians | `d=1, a=b, u=1, v=2`; `u=v`; `d=0` | `(1/2)(1/2−1+log 2)=0.0966`; variance term `0`, supplier's `‖a−b‖²/(2v)`; `0=0` | holds | none |
| 1.2 Bayes update | `c=0`; `u=0`; `u=v=c=1` | `w=v`, `K=N(m,u)`; `K=dirac m`; `w=2`, `K y=N(y/2,1/2)`; general variance `u−c²u²/w=uv/w` | holds | none |
| 2.1 composition | `a=b=1/2`; `a=1`; `a=0` | mean `√(ab)x=x/2`, variance `b(1−a)+1−b=3/4=1−ab`; `noiseKernel b`; `N(0,1)` | holds | none |
| 2.2 marginal bound | `μ₀=N(0,1), M=d`; `μ₀=dirac 0, d=1, ᾱ=1/2` | `−(d/2)log(1−ᾱ)≥0`; `(−1/2+log 2)/2=0.0966=klDiv N(0,1/2) N(0,1)` (tight) | holds | none |
| 2.3 posterior | `t=1`; constant `β=1/10, t=2`; coefficient of `x₀` from 1.2 | `β̃₁=0`, `μ̃=x₀`; `β̃₂=0.01/0.19=1/19`; `√ᾱ_{t−1}(1−ᾱ_t−α_t+ᾱ_t)/(1−ᾱ_t)=√ᾱ_{t−1}β_t/(1−ᾱ_t)`; `c²u+v=1−ᾱ_t` | holds | none |
| 2.3 noise form | `t=1` | LHS `x₀`; RHS `(1/√α₁)(√α₁x₀+√β₁ε−√β₁ε)=x₀` | holds | none |
| 3.1 density and score | `μ₀=dirac x₀`; `N(0,τ²)`; `c=0` | score `−(y−cx₀)/s²`; `−y/(c²τ²+s²)`; `p=φ_{s²}` | holds | R05 (suppliers) |
| 3.2 Tweedie, three forms | dirac; Gaussian `d=1`; sign of noise form | `c⁻¹(y−(y−cx₀))=x₀`, covariance `0`; variance `τ²s²/(c²τ²+s²)` both ways; `∇p/p=−E[Z∣Y]/s` | holds | R01 (not declared) |
| 3.3 DSM = ESM + const | `f=0`; dirac; Gaussian `d=1`; `c=0` minimizer | `d/s²=∫‖score‖²+(d/s²−∫‖score‖²)`; const `0`; `1/s²−1/(c²τ²+s²)≥0`; `−s·score(Y)=Z` | holds | R01 |
| 4.1 reverse chain, chain rule, bound | `T=0`; `T=1`; `κ=rev, π=q_T`; index bookkeeping | both sides `klDiv μ₀ π`; `klDiv q₁ π+klDiv(q₁⊗rev₁)(q₁⊗κ₁)`; `0`; step `n` uses `κ(T−n)`: time `T−n → T−n−1` | holds | R01 |
| 4.2 `Iₜ` bound | `ᾱ_{t−1}=α_t=9/10`, `μ₀=N(0,1)`; `τ²→∞`; `t=1` | `Iₜ=(1/2)log(0.1·19)=0.3209 ≤ (1/2)log(0.19/0.09)=0.3736`; limit `(1/2)log((1/9)·19)=0.3736`; `t=1` divides by `0`, excluded by `2 ≤ t` | holds | R01 |
| 4.2 surrogate identity | not `≪` cases; `μ₀=dirac x₀`; `t=1` | both sides `∞` when `post ≪̸ κ`; `Iₜ=0`; identity also holds at `t=1` (general form) | holds | R02 |
| 4.3 closed form | `ε̂=ε`; `σ²=β̃`; `β=1/10, t=2, σ²=1/19` | mean term `0`; variance term `0`; `w₂=0.01/(2·0.9·0.01)=5/9`; `‖μ̃−m‖²/(2σ²)=β²‖ε−ε̂‖²/(2σ²α(1−ᾱ))` | holds | R01, R02 |

- Source locators checked against the text: 12 of 13 (HoJainAbbeel2020 lines 68, 89, 95, 112, 116–123, 151, 166, 193, 203, 708; SohlDickstein2015 lines 501, 1384; Efron2011 lines 52, 111–151; Hyvarinen2005 line 109; Vincent2011 lines 250–292, 513).
- Library declarations opened at the pins: 17 (Tau Ceti `klDiv_compProd_right` and `klDiv_compProd_eq_add_lintegral`, `ChainRule.lean` 125, 150; `map_affine_multivariateGaussian`, `Affine.lean` 73; `condDistrib_multivariateGaussian`, `Conditional/Basic.lean` 532; `multivariateGaussianPDFReal`, `multivariateGaussian_eq_withDensity`, `Density.lean` 82, 265; `multivariateGaussian_conv_multivariateGaussian`, `Sum.lean` 33; Mathlib `multivariateGaussian`, `Multivariate.lean` 166; `klDiv_compProd_eq_add`, `ChainRule.lean` 203; `klDiv_map_le`, `DataProcessing.lean` 159; `Kernel.partialTraj`, `PartialTraj.lean` 102; `Kernel.prodMkLeft`, `MapComap.lean` 237; others by name). None proves a target.
- Cross-roadmap citations resolved: 1 (MathematicalStatisticsNonparametric 1.3 `klDiv_multivariateGaussian`, on main, README line 506, `Suggested.lean` line 187; equal variance only, so 1.1 is not a restatement).
- Dependency check: `depcheck: 241 roadmaps, 2530 edges, 0 problem(s)`. Gate at this head: every check passed; no change outside the folder.
- Elaboration: `sorry` the only warning, but see R01. One-tactic probe (`rfl`, `simp`, `infer_instance`) on the repaired copy closed none of the 24 sorried theorems.
- Note, not a finding: `hβ` is not needed by `klDiv_le_klDiv_forwardPath` (`noiseKernel a` is Markov for every real `a`).
- Overlap check: read RandomizedSmoothing, FirstOrderOptimization, MathematicalStatisticsSemiparametric, MathematicalStatisticsFoundations, MathematicalStatisticsNonparametric; nothing shared (equal-variance Gaussian divergence is owned by MathematicalStatisticsNonparametric 1.3 and cited).
- Source independence: 6 passages compared with 5 sources, none shared; largest share HoJainAbbeel2020, 6 of 11 locators; contents compared with HoJainAbbeel2020: independent (its Section 2 holds the bound, the marginals and the posterior together; Layer 3 has no counterpart there). Robbins1956 could not be read.
- Research link: Layers 2 and 4 state the forward process and variational bound of Sohl-Dickstein et al. 2015 and Ho, Jain and Abbeel 2020; Layer 3 is Tweedie's formula (Robbins 1956, Efron 2011) and the score-matching equivalence of Hyvärinen 2005 and Vincent 2011. Rests on the README's references and the texts read.

## Not verifiable

- Robbins 1956 (3.2): Project Euclid returned a block page and the publisher's landing page is in no licence class; the attribution to Tweedie was checked only through Efron2011 line 52.
- Vincent 2011 (3.3): read in the author's technical report, not the Neural Computation version; "Section 4 and Appendix" match the report's numbering.

## Source issues

- none

## For the human reviewers

- **Scope.** The two sources of Layers 2 and 4 (Ho–Jain–Abbeel, NeurIPS 2020; Sohl-Dickstein et al., ICML 2015) are machine-learning conference papers; Layer 3 rests on JASA, JMLR and Neural Computation articles. The README has no `## Downstream consumers` section.
- **Licence.** Efron 2011 and Vincent 2011 were read from author-hosted copies (a preprint and a technical report), whose licence status was not settled.
- **Not tested.** Robbins 1956 could not be read; its one locator (3.2) is unchecked.
