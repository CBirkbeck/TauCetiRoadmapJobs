# Review of DenoisingDiffusion (pull request #2476 at afd8629)

**Verdict:** needs changes

## R01 (P3) — 4.1: "for every `β`" is vacuous for two of the three statements

**Location:** `TauCetiRoadmap/DenoisingDiffusion/README.md` lines 411–413: "These three statements hold for every `β : ℕ → ℝ`: they use only that `forwardPath μ₀ β T` is the path law of a Markov chain started at `μ₀`"; `Suggested.lean` lines 248–264 (`forwardPath_reverse`, `klDiv_forwardPath_eq`, no `hβ`).

**Claim:** `IsReverseKernel` is stated with `forwardMarginal μ₀ β t = μ₀.bind (noiseKernel (ᾱ t))`, which is the time-`t` marginal of `forwardPath` only when 2.1's composition law applies. Off a schedule no `rev` satisfies it, so the two theorems that assume it say nothing there; "Such kernels exist" (line 396) fails too.

**Witness:** `d = 1`, `μ₀ = dirac 0`, `β 1 = 1/2`, `β 2 = −1`, `T = 2`: `x₁ ~ N(0, 1/2)`, `x₂ = √2 • x₁ ~ N(0, 1)`; `ᾱ 2 = 1`, `forwardMarginal μ₀ β 2 = dirac 0`. First marginals differ.

**Repair:** Add `(hβ : ∀ t, 1 ≤ t → 0 < β t ∧ β t < 1)` to `forwardPath_reverse` and `klDiv_forwardPath_eq` and end their docstrings before "; this holds for every `β`" (the witness then violates `hβ`). Replace lines 411–413 by: "The variational bound holds for every `β : ℕ → ℝ`: `noiseKernel a` is a Markov kernel for every real `a`, and the time-`0` marginal of `forwardPath μ₀ β T` is `μ₀`. The reverse Markov property and the chain rule assume a schedule, for which `qₜ` is the time-`t` marginal of the path law (2.2)."

## R02 (P3) — `## How to read the build` does not give the layer order

**Location:** `TauCetiRoadmap/DenoisingDiffusion/README.md` lines 110–113: "Each layer opens with its definitions. Each numbered target ends with a **Checks** list … `Suggested.lean` declares every roadmap-owned name used below."

**Claim:** The section is one paragraph on the layer order and what each layer delivers; this one describes the layout of a target and says nothing about the four layers or which of them depend on which.

**Witness:** Lines 380 and 515: Layer 3 uses no other layer, Layer 4 uses Layers 1–3; neither fact is in the section.

**Repair:** Open the section with: "Layer 1 proves the two Gaussian facts everything else uses: the divergence between isotropic Gaussian laws and the Bayes update. Layer 2 builds the forward chain on them: the noising kernels, the path law, its marginals and the posterior. Layer 3 is independent of Layers 1 and 2: the smoothed density, Tweedie's formula and score matching. Layer 4 combines the three into the variational bound, its surrogate and the noise-prediction closed form."

## R03 (P3) — 3.3: Vincent's locator is the technical report's, the reference is the journal's

**Location:** `TauCetiRoadmap/DenoisingDiffusion/README.md` lines 361 and 542–543: "Vincent 2011, Section 4.2, equation (11), and the Appendix" against "P. Vincent, … Neural Comput. **23** (2011), 1661–1674."

**Claim:** "Section 4.2, equation (11)" is the numbering of the December 2010 technical report, the only version checked; the reference names the journal article, whose equation numbering was not compared.

**Witness:** Vincent2011 lines 12–16 (Technical Report 1358, a preprint of the Neural Computation note), line 271 (Section 4.2), line 290 (equation (11)), line 513 (Appendix).

**Repair:** Cite the version read. Reference: "P. Vincent, *A connection between score matching and denoising autoencoders*, Technical Report 1358, DIRO, Université de Montréal, 2010; published in Neural Comput. **23** (2011), 1661–1674." Locator at line 361: "Vincent 2011 (technical report numbering), Section 4.2, equation (11), and the Appendix".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `klDiv_multivariateGaussian_smul_one` | `d=1, a=b, u=1, v=2`; `u=v`; `d=0` | `(1/2)(1/2−1+log 2)=0.0966`; variance term `0`, leaves `‖a−b‖²/(2v)` (supplier 1.3); `0=0` | holds | none |
| 1.2 `compProd_gaussianKernel_eq_swap` | `c=0`; `u=0`; `d=1, m=0, u=v=c=1` | `w=v`, `K y=N(m,u)`; `uv/w=0`, `K y=dirac m`; `w=2`, gain `1/2`, variance `1−1/2=1/2` | holds | none |
| 2.1 `noiseKernel_apply`, `noiseKernel_comp` | `a=b=1/2`; `a=1`; `a=0`; `a=2` | mean `x/2`, variance `b(1−a)+1−b=3/4=1−ab`; identity; `N(0,1)`; `√(1−a)=0`, `dirac (√2 x)`, still Markov | holds on `[0,1]` | none |
| 2.2 `forwardPath_map_eval`, `klDiv_forwardMarginal_le` | `t=0`; `μ₀=N(0,1), M=d`; `μ₀=dirac 0, d=1, ᾱ=1/2, M=0` | `ᾱ 0=1`, marginal `μ₀`; bound `−(d/2)log(1−ᾱ)≥0`, true value `0`; bound `0.0966 = klDiv N(0,1/2) N(0,1)` | holds, tight | none |
| 2.3 `ddpm_posterior`, `postMean_eq_noise` | `t=1`; `β=1/10, t=2`; coefficient identities | `β̃₁=0`, `μ̃=x₀`; `β̃₂=0.01/0.19=1/19`; `c²u+v=α−ᾱ_t+β=1−ᾱ_t`; `x`-coefficient `(β+α−ᾱ_t)/(√α(1−ᾱ_t))=1/√α` | holds | none |
| 3.1 `hasLaw_smoothedDensity`, heat-kernel identification | `μ₀=dirac x₀`; `N(0,τ²)`; `c=0`; `t=s²/2` | score `−(y−cx₀)/s²`; `−y/(c²τ²+s²)`; `p=φ_{s²}`; `(4πt)^{−d/2}e^{−‖y‖²/(4t)}=(2πs²)^{−d/2}e^{−‖y‖²/(2s²)}`, bound side `heatKernel (2t)=heatKernel s²` | holds | none |
| 3.2 `tweedie_noise`, `tweedie`, `tweedie_covariance` | dirac; Gaussian `d=1`; `X` not integrable | `∇p/p=−E[Z∣Y]/s`; `c⁻¹(y−(y−cx₀))=x₀`, covariance `0`; `(s²/c²)(1−s²/(c²τ²+s²))=τ²s²/(c²τ²+s²)`; `condExp X=0`, so `hXi` needed | holds | none |
| 3.3 `memLp_noisyScore`, `dsm_eq_esm_add`, `noisePrediction_minimizer` | `f=0`; dirac; Gaussian `d=1`; `c=0` | `d/s² = ∫‖score‖² + (d/s²−∫‖score‖²)`; constant `0`; `1/s²−1/(c²τ²+s²)≥0`; `−s·score(Y)=Z`, loss `0` | holds | none |
| 4.1 `forwardPath_reverse`, `klDiv_forwardPath_eq` | `T=0`; `T=1`; index of `modelPath`; `β 1=1/2, β 2=−1` | both sides `klDiv μ₀ π`; `klDiv q₁ π + klDiv(q₁⊗rev 1)(q₁⊗κ 1)`; step `n` uses `κ(T−n)`: `x_{T−n} → x_{T−n−1}`; marginal `N(0,1)` vs `dirac 0` | true; vacuous off schedules | R01 |
| 4.1 `klDiv_le_klDiv_forwardPath` | arbitrary `β`; both sides `∞` | time-`0` marginal of `forwardPath` is `μ₀` for every `β`; `∞ ≤ ∞` | holds for every `β` | none |
| 4.2 `forwardPath_map_posterior`, `klDiv_posterior_eq_add` | `t=1`; `κ=rev`; `post ≪̸ κ` | `postKernel β 1 (x₀,x)=dirac x₀`, law of `((x₀,x₁),x₀)`; `0 + Iₜ = Iₜ`; both sides `∞` | holds | none |
| 4.2 `klDiv_posterior_rev_le` | `ᾱ_{t−1}=α_t=9/10`, `μ₀=N(0,1)`; `τ²→∞`; `Q x=N(x/√α, β/α)`; `t=1` | `Iₜ=(1/2)log 1.9=0.3209 ≤ (1/2)log(0.19/0.09)=0.3736`; limit `(1/2)log(19/9)=0.3736`; `r+β/(1−ᾱ_t)=1`; `β̃₁=0`, excluded by `2≤t` | holds, sharp | none |
| 4.3 `klDiv_postKernel_gaussian`, `klDiv_posterior_gaussian_integral`, `posteriorLoss_minimizer` | `ε̂=ε`; `σ²=β̃`; `β=1/10, t=2, σ²=1/19`; `t=1` | mean term `0`; variance term `0`; `w₂=0.01/0.018=5/9`; `‖μ̃−m‖²/(2σ²)=β²‖ε−ε̂‖²/(2σ²α(1−ᾱ))`; `s=√β₁>0`, minimizer statement applies | holds | none |
| 3.3 locator (Vincent) | technical report against the reference | Section 4.2 line 271, equation (11) line 290, Appendix line 513; journal numbering not compared | report numbering | R03 |

- Previous review (at 23ba0a5): R01 repaired (`Suggested.lean` lines 159–161, 239–240, no notation in `variable`; 42 declarations elaborate, no `sorry` in a type); R02 repaired (README lines 436–440, 494); R03 repaired (lines 183, 274, 377, 513, 520); R04 repaired (`Suggested.lean` line 82); R05 repaired (README lines 81–84, 292–297, 307–309).
- Source locators checked against the text: 13 of 14 — HoJainAbbeel2020 lines 85 (2), 89 (3), 95 (4), 112 (5), 116–123 (6)–(7), 151 (8), 166 (10), 193–203 (11)–(12), 413 (16), 713–749 (17)–(22); SohlDickstein2015 lines 501, 1384; Efron2011 lines 58–65, 151; Hyvarinen2005 line 109; Vincent2011 lines 271, 290, 513.
- Library declarations opened at the pins: 22 — Tau Ceti `heatKernel` (`HeatKernel/Basic.lean` 76), `contDiff_heatKernel` (123), `exists_one_add_norm_pow_mul_norm_iteratedFDeriv_heatKernel_le` (`Bounds.lean` 181, right side `C * heatKernel (2 * t)`), `multivariateGaussianPDFReal` (`Density.lean` 82), `multivariateGaussian_eq_withDensity` (265, `PosDef`), `multivariateGaussian_conv_multivariateGaussian` (`Sum.lean` 33), `map_affine_multivariateGaussian`, `map_comp_multivariateGaussian` (`Affine.lean` 73, 126), `indepFun_sumEquivProd_multivariateGaussian_iff` (`Multivariate.lean` 154), `gaussianCondMean_of_posDef`, `gaussianCondCov_of_posDef`, `gaussianCondKernel`, `map_snd_fst_multivariateGaussian`, `condDistrib_multivariateGaussian` (`Conditional/Basic.lean` 87, 121, 194, 486, 532), `klDiv_compProd_right`, `klDiv_compProd_eq_add_lintegral` (`ChainRule.lean` 125, 150); Mathlib `multivariateGaussian` (`Multivariate.lean` 166), `klDiv_compProd_eq_add` (`ChainRule.lean` 203), `klDiv_map_le` (`DataProcessing.lean` 159), `Kernel.partialTraj` (`PartialTraj.lean` 102), `Kernel.prodMkLeft` (`MapComap.lean` 237), `eLpNorm_condExp_le_eLpNorm` (`ConditionalExpectation/Real.lean` 285). None proves a target; no Gaussian `klDiv` formula, Tweedie identity or score-matching statement at either pin.
- Cross-roadmap citations resolved: 1 — MathematicalStatisticsNonparametric 1.3 `klDiv_multivariateGaussian` on main (README line 506, `Suggested.lean` line 187), equal variance only. No `Suggested.lean` name here is declared by another roadmap on main or at an open head (9 names searched).
- Gate at this head: every check passed; no change outside the folder. Dependency check: `depcheck: 239 roadmaps, 2527 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Elaboration: 24 `sorry` warnings for 24 theorems, no error and no other warning. Elaborated signatures of all 42 declarations compared with the README: no section binder lost, generality equal except as in R01.
- One-tactic probe (`rfl`, `simp`, `simp` with the roadmap's definitions unfolded, `infer_instance`) on a scratch copy: closed 0 of the 24 sorried theorems.
- Pull request text read against the head: title and description agree with it (new roadmap, one roadmap supplier, the Tau Ceti suppliers named, 24 theorems, 42 declarations).

Overlap check: read FirstOrderOptimization, MathematicalStatisticsSemiparametric, MathematicalStatisticsFoundations, MathematicalStatisticsHighDimensional; nothing shared. The scores there are parametric likelihood scores; MathematicalStatisticsFoundations 9.4 owns the scalar normal-location posterior as a density on `ℝ`, and 1.2 is the joint-law form on `ℝ^d` with a scale `c`, proved from Tau Ceti's conditional Gaussian kernel.

Source independence: 8 passages compared with 5 sources, none shared; largest share HoJainAbbeel2020, 6 of 12 locators; contents compared with HoJainAbbeel2020: independent (its Section 2 holds the bound, the marginals and the posterior together, its Section 3.2 the closed form; Layers 1 and 3 have no counterpart there). Robbins1956 could not be read.

Research link: Layers 2 and 4 state the forward process and variational bound of Sohl-Dickstein et al. 2015 and Ho, Jain and Abbeel 2020; Layer 3 is Tweedie's formula (Robbins 1956, Efron 2011) and the score-matching equivalence of Hyvärinen 2005 and Vincent 2011. Rests on the README's references and the five texts read.

## Not verifiable

- Robbins 1956, equations (44)–(46), p. 162 (3.2): the cached text of Robbins1956 is the host's block page (line 5), and a second request to Project Euclid returned no content; the credit to Tweedie was checked only through Efron2011 lines 52 and 112.
- Vincent 2011 in its Neural Computation numbering (3.3): only the author's technical report was read (R03).

## Source issues

- **Misprint** in Efron2011 at equation (1.3), page 2 of the author-hosted preprint: the source says the bracketed normal density has argument `µ` on the left, `z` on the right, and exponent `−z²/σ²`; it should be `φ_σ(z) = (2πσ²)^{−1/2} exp(−z²/(2σ²))`; affects nothing.

## For the human reviewers

- **Scope.** Layers 2 and 4 rest on two machine-learning conference papers (HoJainAbbeel2020, NeurIPS; SohlDickstein2015, ICML); Layer 3 on journal articles (Efron2011, Hyvarinen2005, Vincent2011) and Robbins1956. README line 522: no roadmap on main consumes this one.
- **Licence.** Efron2011 and Vincent2011 were read from author-hosted copies (a preprint and a technical report); their licence status was not settled.
- **Not tested.** Robbins1956 could not be read; its one locator (3.2) is unchecked. The largest-share source, HoJainAbbeel2020, was read in full.
