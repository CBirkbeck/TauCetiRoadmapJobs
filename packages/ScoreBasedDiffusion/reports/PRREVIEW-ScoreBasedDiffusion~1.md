# Review of ScoreBasedDiffusion (pull request #2509 at 44822b3)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every identity, closed form and numerical Check of the three layers was recomputed (the Fokker–Planck coefficients of the three named paths, both Tweedie formulas, the two score bounds and their extremal cases, the backward moments, and the two-time derivative of 3.2, by hand and by quadrature), and every source locator, library declaration and DenoisingDiffusion citation was opened and agrees with the text. There is one small correction (Mathlib's posterior kernel is not cited in 3.1) and three format notes, none blocking. Three questions are left for the human reviewers (the kind of sources, the title against DenoisingDiffusion, and the provenance paragraph).

## C01 — The backward kernel and the posterior of the data in 3.1 are explicit versions of Mathlib's `ProbabilityTheory.posterior`, which the README never names

An implementer reading 3.1 (the Bayes' formula and posterior-of-the-data bullets, README lines 414–423) would build both kernels and their defining identity from nothing, although the pinned Mathlib already has the object and its characterisation. In `Mathlib/Probability/Kernel/Posterior.lean`, `posterior κ μ` (line 70) is a Markov kernel with `(κ ∘ₘ μ) ⊗ₘ κ†μ = (μ ⊗ₘ κ).map Prod.swap` (`compProd_posterior_eq_map_swap`, line 81), any kernel with that property equals it almost everywhere (`ae_eq_posterior_of_compProd_eq`, line 113), and `posterior_eq_withDensity` (line 287) gives it as `μ.withDensity` of a Radon–Nikodym derivative for almost every observation. With `κ = gaussianKernel c (s ^ 2)` and `μ = μ₀` that derivative is `φ_{s²} (y − c • x) / p y`, the density of the README's posterior law.

The statements of 3.1 are still worth keeping: they give the density explicitly and for every `y`, where Mathlib's are almost everywhere. The smallest change is one clause in each of the two bullets saying that the kernel is a version of `(gaussianKernel …)†(law at the first level)`, respectively `(gaussianKernel c (s ^ 2))†μ₀`, and differs from Mathlib's statement in being explicit at every point; plus the three Mathlib names under "From Mathlib" and in the *Needs:* line of 3.1.

## N01 — Anderson (1982) and Mikulincer–Shenfeld are named in the text but not listed under References

The Summary and 3.2 call the limit equation "Anderson's reverse-time equation", and 2.2 says the two-sided Hessian bound is taken from Mikulincer and Shenfeld; a reader cannot find either work from the reference list. Adding the two entries (Anderson, *Reverse-time diffusion equation models*, Stochastic Process. Appl. 12 (1982); Mikulincer and Shenfeld, *On the Lipschitz properties of transportation along heat flows*, the lemma that Chen et al. quote) would do.

## N02 — The module docstring of `Suggested.lean` carries a list of some forty supplier names

Lines 21–38 of `TauCetiRoadmap/ScoreBasedDiffusion/Suggested.lean` repeat the README's supplier contracts as a catalogue of names. The README already holds them; the docstring could stop after the paragraph on the three restated definitions.

## N03 — "the flow-matching roadmap" in the out-of-scope list points at a roadmap that is not on main

In Scope and ownership (README line 649) the probability-flow equation is said to be "the subject of the flow-matching roadmap". That roadmap exists only as an open pull request, so the pointer resolves to nothing on main. Since nothing is consumed from it, the sentence would read as well with the topic left simply out of scope, or with the name added once that roadmap is merged.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `gaussianKernel_comp` | `c=0.7,v=0.5,c′=−1.3,v′=0.2`; `v=v′=0`; `v<0` with `d≥1` | mean `−0.91`, variance `1.69·0.5+0.2=1.045`; reversed order `0.598`. For `v<0` Mathlib's Gaussian is a Dirac mass, so left variance `v′` ≠ right | true; `0 ≤ v` needed | none |
| 1.1 transition kernels, Chapman–Kolmogorov | levels `(1.1,0.3),(0.8,0.6),(0.5,0.9)` | step variances `0.312397`, `0.669375`; `0.390625·0.312397+0.669375=0.791405=0.81−0.206612·0.09` | true | none |
| 1.1 variance-preserving semigroup | `β=2`, times `0,1`; general `r≤t` | `m=α_t/α_r=√b`; variance `1−α_t²−b(1−α_r²)=1−b`; `e⁻¹=0.3679`, `1−e⁻²=0.8647` | true | none |
| 1.2 `hasDerivAt_smoothedDensity_path` | `∂_s`, `∂_c` by hand; Dirac, `d=1`, `β=2`; `d=0`; Cauchy at `c=0` | `∂_c p=−(1/c)(d p+⟪y,∇p⟫)−(s²/c)Δp` from `⟪z,∇φ_v⟫=−vΔφ_v−dφ_v`; both sides `(1−v)(y²−v)φ_v/v²`; Cauchy slope `−0.318310=−1/π` | true; `c t≠0` needed | none |
| 1.2 `hasDerivAt_smoothedDensity_vp`, VE, sub-VP | coefficient algebra; `μ₀=N(0,1)` | VP: `ss′−s²c′/c=α²β/2+(1−α²)β/2=β/2`; sub-VP: `(β/2)(1−α⁴)`; stationary: `(d−‖y‖²)φ₁+(‖y‖²−d)φ₁=0` | true | none |
| 1.3 Wasserstein bound | Dirac with `c=1`; `N(0,1)`, `c=0.9`, `s=0.4`; `c=1,s=0` | coupling cost `(1−c)²E‖X‖²+s²d`; exact `s√d` equals bound; `(√0.97−1)²=0.000228 ≤ 0.17`; `0=0` | true | none |
| Layer 1 Examples | `β=1`, `t_k=k/10`; `b=1/2`, `M=d=1` | `β_k=0.09516`; `ᾱ_k=(α t_k)²`; KL bound `0.3466 ≤ b(M+db)/2=0.375` via `−log(1−b) ≤ b+b²` | true | none |
| 2.1 `noisyScore_eq_denoiser` | Dirac; `N(0,τ²)`; `c=0` with no mean | `−(y−c m)/s²`; Gaussian `−y/(c²τ²+s²)`; `c=0`: `c•junk=0`, score `−y/s²` | true for every `c` | none |
| 2.1 `hasFDerivAt_noisyScore` | quotient rule by hand; `τ=s=1,c=2`; two-point at `y=0`; `c=0` | `Dm=(c/s²)Σ`; `(4·(1/5)−1)=−1/5` (wrong `c/s²` gives `−3/5`); `c²R²/s⁴−1/s²`; `c=0`: `−1/s²` | true; agrees with DenoisingDiffusion 3.2 second order | none |
| 2.2 `norm_noisyScore_le` | Dirac `‖x₀‖=R`, `y=−λx₀`; `c=0`; `R<0` | norm `(λR+cR)/s²` equals bound; `c=0`: `‖y‖/s²`; `R<0` impossible for a probability measure | true, attained | none |
| 2.2 `inner_fderiv_noisyScore_le`, Lipschitz constant | two-point law, `R=1.3,c=0.8,s=0.6` | `1.0816/0.1296−2.7778=5.5679`; symmetric form in `[−1/s², c²R²/s⁴−1/s²]` gives norm ≤ the stated max | true, attained | none |
| 2.3 time-integrated identity | Dirac; `N(0,1)`, VP `β=1`; `‖F‖²` non-integrable; `w=0`, `w=∞` | constant `0`; integrand `e^(−t)/(1−e^(−t))`, `log(0.63212/0.0099502)=4.1515`; weight `σ²`: `0.6321`; both inner integrals `∞` | true in `[0,∞]` | none |
| 3.1 two-time law, backward moments | VE levels `(1,√0.5),(1,√2)`, `y=1.2`; VP grid step; short step | mean `0.6=1.2+1.5·(−0.4)`; variance `0.75=1.5(1−0.5)`; `(y+β_k∇log p)/√(1−β_k)`; `v≈Gh`, `m≈1+ah` | true | C01 (citation only) |
| 3.2 `hasDerivAt_integral_twoTimeLaw` | derivation by hand (`m′=−am`, `v′=−m²G`, three integrations by parts); three-point law, `β t=1/2+t`, `r=0.6`, `T=1.5`; `g=1`; `c₂=0` | finite difference `0.0234601`, right side `0.0234601`; half score `0.0071358`; forward `0.0028103`; `g=1`: `0.0068400` both, forward `0.0068400` | true; no sign condition on `G` needed | none |
| 3.2 `reverseGenerator`, classical form | `N(0,1)` VP; Dirac VE `s=√u` | `(β/2)(Δf−⟪x,∇f⟫)` equals forward generator; `−⟪x,∇f⟫/u+Δf/2`; `∂_u q=a∇·(yq)−(G/2)Δq` both ways | true | none |
| Layer 3 Examples (reversed chain) | `k=1`, `k≥2` against DenoisingDiffusion 2.1, 2.3, 4.1, 4.2 | `noiseKernel (1−β_k)=gaussianKernel √(1−β_k) β_k`; `IsReverseKernel` is the swapped Bayes identity | consistent | none |

- Source locators checked against the text: 14 of 14 (SongSDE2021 lines 173, 202, 215, 248, 256, 264, 808–820, 936–953; ChenChewi2023 lines 296, 1335–1370; HoJainAbbeel2020 line 193; SongDurkan2021 lines 226–230, 757–780).
- Library declarations opened at the pins: 27 (Tau Ceti: `Gaussian/Sum.lean:33`, `Gaussian/Affine.lean:73`, `Gaussian/Density.lean:82, 265`, `HeatKernel/Basic.lean:76, 123, 131, 153`, `HeatKernel/Derivatives.lean:127, 178`, `HeatKernel/HeatEquation.lean:121, 277`, `Chi/Gaussian.lean:88`, `ChiSquared/Basic.lean:344`, `OptimalTransport/Coupling.lean`, `Wasserstein/Basic.lean:189, 203`; Mathlib: `ParametricIntegral.lean:222`, `Deriv/Comp.lean:375`, `FundThmCalculus.lean:725`, `LineDeriv/IntegrationByParts.lean:114`, `IntegralCompProd.lean:467`, `MeasureCompProd.lean:170`, `MeasureComp.lean:45`, `MeanValue.lean:515`, `Lebesgue/Add.lean:320`, `Measure/Prod.lean:123`, `Gaussian/Multivariate.lean:166`); hypotheses agree with the supplier contracts.
- Cross-roadmap citations resolved on main: DenoisingDiffusion 1.2, 2.1, 2.2, 2.3, 3.1, 3.2, 3.3, 4.1, 4.2 with the eleven declaration names; StochasticCalculus 7.3, 7.4, 9.1, 9.3, 9.4, 10.2; OptimalTransport 8.7, 8.8, 11.7, 11.9. All present and saying what is claimed. The three restated definitions have bodies identical to those of DenoisingDiffusion's Lean file and different fully qualified names.
- Dependency check: `depcheck: 210 roadmaps, 2259 edges, 0 problem(s)`; no UPWARD or CYCLE line. The only roadmap suppliers are on main.
- Elaboration of `TauCetiRoadmap/ScoreBasedDiffusion/Suggested.lean`: eight `sorry` warnings, nothing else; one import of Mathlib and one Tau Ceti module; no `set_option`, no sorried data. The 17 elaborated signatures were compared with the README statements: no binder lost, same generality.
- One-tactic probe (`rfl`, `simp`, `simp` with all definitions unfolded, `infer_instance`) on a copy: none of the eight theorems closes. Headlines of the Summary (Fokker–Planck with its variance-preserving case, both Tweedie formulas, both score bounds, time reversal) are all stated; no padding.
- Automatic checks at this head: all passed.
- Overlap check: read FlowMatching, LangevinAndHamiltonianMonteCarlo, DenoisingDiffusion, OptimalTransport, StochasticCalculus; nothing shared. FlowMatching takes a Fokker–Planck equation as a hypothesis and treats the denoiser as a marginal velocity of a coupling; DenoisingDiffusion owns `gaussianKernel`, `smoothedDensity`, `noisyScore` and is cited as owner; OptimalTransport owns the gradient-flow equation; the classical equation for Gaussian paths, the explicit posterior moments and the two-time generator identity are owned here only. KernelsAndSpectralMethods, HiddenMarkovModels, StatisticalLearningTheory and MathematicalStatisticsFoundations were searched by object (Tweedie, Fokker–Planck, reverse-time, score matching, backward kernel) with no hit.

Source independence: 11 passages compared with 4 sources, none shared; largest share SongSDE2021, 8 of 14 locators; contents compared with SongSDE2021 (forward SDE, reverse SDE, score estimation, examples, then solvers and controllable generation): independent, the layers are kernels and forward equation, score, time reversal, and the forward order is forced by 3.2 needing 1.1, 1.2 and 2.1.

Research link: The score bounds of 2.2 and the Wasserstein bound of 1.3 are the regularisation inputs of Chen, Chewi, Li, Li, Salim and Zhang 2023 (Lemma 20, used for Theorem 2); 3.2 is the generator form of the reverse-time equation of Song et al. 2021, equation (6). Rests on the README and on the sources read.

## Not verifiable

- Anderson 1982 and Mikulincer–Shenfeld: named in the text without locators; not opened, and no statement of the roadmap rests on them.
- The repository named in the provenance paragraph was not opened; the README says it contains no proofs of this material.

## Source issues

- none

## For the human reviewers

- Scope: the four references are machine-learning conference papers (ICLR 2021 and 2023, NeurIPS 2020 and 2021); most targets are marked "proved here", and the two-time form of 3.2 is stated in none of them.
- Scope: the roadmap continues DenoisingDiffusion on main, whose scope section lists continuous time as not owned; whether it should carry a "Part II" title instead of its own name is a naming decision.
- Licence: the README's provenance paragraph (line 656) links the author's BSD-3 repository of sampler code and says no proofs come from it; the repository was not read.
