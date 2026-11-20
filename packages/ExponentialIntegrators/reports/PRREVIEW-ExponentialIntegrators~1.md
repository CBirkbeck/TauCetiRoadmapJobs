# Review of ExponentialIntegrators (pull request #2780 at 5b50f8f)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every defect and global-error constant of Layers 3, 4 and 5 was re-derived, every number printed in a Check was recomputed, and the φ-function, log-SNR and DDIM identities were checked by hand; all agree with the README and with `Suggested.lean`, which elaborates with `sorry` as its only warning. There are two small corrections and one format note, none blocking. One thing is left to the human reviewers: the text of Hochbruck–Ostermann 2010, which carries 18 of the 29 source locators, could not be read from a place the project's source rules allow, so its locators (all of Layers 1 to 4) are unverified.

## C01 — `λ = log (α/σ)` is half the logarithm of the signal-to-noise ratio, not its logarithm

A reader who takes the usual signal-to-noise ratio `α²/σ²` gets `log SNR = 2λ`, and with it the equation `dx/dλ = σ² x − σ ε` and the growth bound `(1, 1)` of 5.1 off by a factor of two. The summary says "In the logarithm `λ` of the signal-to-noise ratio" (line 28), Layer 5.1 is headed "Log signal-to-noise time" (line 472), and the docstrings of `lsnrSignal` and `lsnrNoise` say "at log signal-to-noise ratio `λ`" (`Suggested.lean` lines 207 and 210), while 5.1 itself proves `α/σ = e^λ` (line 477). The source the layer cites defines the same variable as `log (α_t/σ_t)` and calls it one half of the log-SNR (lu2022dpmsolver line 193).

The smallest change: say once, in the summary and in 5.1, that `λ = log (α/σ)` is half the logarithm of the signal-to-noise ratio `α²/σ²` (or that the ratio meant is `α/σ`). No statement changes.

## C02 — The substitution lemma cited for the weights of 2.2 is stated for real-valued integrands only

An implementer who follows the route of 2.2 is stuck at the first step: the integrand `((r − t)/h)^k / k! • exp ((t + h − r) • A)` takes values in `E →L[ℝ] E`, and Mathlib's `intervalIntegral.integral_comp_mul_deriv` is stated for `f f' g : ℝ → ℝ` (`Mathlib/MeasureTheory/Integral/IntervalIntegral/IntegrationByParts.lean`, line 511). It is cited in the weights bullet (line 221), in the *Needs:* line of 2.2 (line 237), in the Dependencies of Layer 2 (line 247) and in the Mathlib contract (line 645).

The substitution `r = t + θh` is affine, and the affine rules hold for integrands in any real normed space: `intervalIntegral.integral_comp_add_mul` and `intervalIntegral.smul_integral_comp_add_mul` (`Mathlib/MeasureTheory/Integral/IntervalIntegral/Basic.lean`, lines 974 and 979). Citing one of these in the four places makes the route usable as written; the identity `∫ … = h • phi (k + 1) (h • A)` itself is correct (recomputed for `k = 0, 1`).

## N01 — The docstring of `expRK2Step` calls the Euler stage `a`

In `Suggested.lean` lines 153–155 the stage is "the exponential Euler step `a`", while `a` is the left end of the interval in every theorem of the file and the README calls the stage `v` (4.1). Using `v` in the docstring would match.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `IsEvolutionFamily`, `HasGrowthBound`, `IsMildSolutionOn` | `U = (t−s+1)•1` at `(0,1,2)`; `a = −20(1+sin 5t)+1/2`; `A = (−1,10;0,−2)`; semigroup family | `2·2 = 4 ≠ 3`; `max a = 1/2`, `min a = −39.5`; `max_t ‖exp(tA)‖ = 2.563 > 1`; `realOperator` is `id` for `t<0`, so `U t t = 1` | true; composition law excludes the wrong model | none |
| 1.1 semigroup and propagator bullets | Tau Ceti `HasGrowthBound` (`1 ≤ M ∧ …`), `IsMildSolution.eq_realOperator`; Dirac 1.3 bullets | `S(t)v = S(t−s)S(s)v`; `‖N_P‖ ≤ exp∫‖P‖ ≤ e^(ω(t−s))` | agree with the cited declarations and section | none |
| 1.2 `norm_le_exp_mul_norm_of_inner_le` | Jordan block; `A(t)` of the Check; `s = t₁`; `s > t₁`; `ω < 0` | `‖exp(2N)‖ = 1+√2 = 2.414 ≤ e`; `‖exp(sN)‖ = (s+√(s²+4))/2 ≤ e^(s/2)`; `max‖A(t)‖ = 6.396`; empty/one-point interval: trivial | true | none |
| 2.1 `phi`, recursion | `k = 0`; `N² = 0`; real `x = 1`; `X = 0` | `exp X = 1 + Xφ₁`; `φ₁(N) = 1+N/2`, `φ₂(N) = 1/2+N/6`; `φ₂(1) = e−2 = 0.718`; `1,1,1/2,1/6` | true; wrong `(e^x−1)/x²` gives `1.718` | none |
| 2.2 `norm_phi_succ_le`, weights | `X = −K`; Jordan block; zero algebra; `k = 0, A = 0` | `(1−e^(−K))/K ≤ 1`; `‖φ₁(N)‖ = 1.2808 ≤ 2(e^(1/2)−1) = 1.2974`; `∫θ^k/k!·Me^(ω(1−θ)) = Mφ_(k+1)(ω)`; weight `h` | true | C02 (cited lemma) |
| 3.1 `expEulerStep`, increment | `h = 0`; `x' = −x+1`; DDIM vs frozen `−σε` | step `= u`; `1−e^(−1) = 0.632`; `1.22074` vs `1.33336` | true | none |
| 3.2 defect bound | `U = 1, F = t`; `ω = −50`; `h = 0` | `h²/2` (equality); defect `(49+e^(−50))/2500 = 0.0196` vs `e^(−50)/2 = 9.6·10⁻²³`; `0 ≤ 0` | true; `ω ≥ 0` needed | none |
| 3.3 global error | re-derivation; `N = 0` with `hmax < 0`; `E = 0`; `A = −1000`, `h = 0.01` | `η_n ≤ M‖e₀‖ + BMM₂h(t_n−a)/2 + MBLΣh_kη_k`, Grönwall gives the stated bound; `n = 0`: `‖e₀‖ ≤ M‖e₀‖` since `M ≥ ‖U a a‖ = 1`; `(1−e^(−10))/0.01 = 99.9955` | true | none |
| 4.1 `expRK2Step` | `U = 1, b = 1`; numeric Check; weight `1` | `u+(h/2)(F(t,u)+F(t+h,v))`; both `0.7167548591`; defect `−h²/2` | true; Heun recovered | N01 |
| 4.2 defect bound | `F = t²`; interpolation error; `h = 0` | `h³/3−h³/2 = −h³/6 = M₃h³/12`; `(1−s/h)M₃s²/2+(s/h)M₃(h−s)²/2 = M₃s(h−s)/2`, integral `M₃h³/12`; second term `BMe^(ωh)(h/2)·L·BMM₂e^(ωh)h²/2` | true, equality attained | none |
| 4.3 global error | re-derivation; `U = 1` | weights `≤ BMe^(ω(t_n−t_k))h_k/2`; stage `Me^(ωh)(1+BhL)`; `C`, `D` as stated; `C = L(1+h_max L/2)` | true | none |
| 5.1 `lsnrSignal`, `lsnrNoise`, `lsnrFamily` | identities; noising-path coefficients; Gaussian `s² = 0.04` | `α²+σ² = 1`, `α/σ = e^λ`, `α' = σ²α`, `σ' = −α²σ`; `a = σ²`, `G = −2σ²`; `v(2)/v(−3) = 0.239589` | true; wrong sign of `G` makes the example grow | C01 (wording) |
| 5.2 `ddimStep_eq_expEulerStep` | `h = 0`; `h < 0`; numeric; DPM-Solver-1 form | `α(λ+h)(e^(−λ)−e^(−λ−h)) = α(λ+h)σ(λ)/α(λ) − σ(λ+h)`; three forms `1.33336382`; exact `0.544968`, DDIM `0.520537`, Euler `0.538462` | true for every real `h` | none |
| 5.3 `norm_sub_ddimSeq_le` | 3.3 with `M = 1, ω = 1, B = 1`; 10 and 40 steps | `α(λ')/α(λ) = exp∫σ² ≤ e^(λ'−λ)`; errors `0.019732`, `0.005081`, ratio `3.883` | true | none |

- Source locators checked against the text: 10 of lu2022dpmsolver (lines 133, 146, 162, 186–219, 292, 350–353, 384–401, 900–907) and 1 of song2021ddim (lines 236–245); all agree with the README. The 18 of Hochbruck–Ostermann 2010 were not checked (see below).
- Library declarations opened at the pins: 8 in Mathlib (`discrete_gronwall_prod_general` `Analysis/ODE/DiscreteGronwall.lean:51`, `hasDerivAt_exp_smul_const` `Analysis/SpecialFunctions/Exponential.lean:382`, `HasDerivWithinAt.inner`, `image_le_of_liminf_slope_right_le_deriv_boundary` `Analysis/Calculus/MeanValue.lean:137`, `integral_eq_sub_of_hasDerivAt`, `integral_comp_mul_deriv`, `norm_integral_le_of_norm_le` `IntervalIntegral/Basic.lean:754`, `Real.add_one_le_exp`) and 14 in Tau Ceti (all those named in the Tau Ceti contract; each exists in the file given and says what the contract says).
- Cross-roadmap citations resolved: OneStepMethodsForODEs 1.1, 1.2, 1.4, 3.1, 3.2 at its open head (the three copied definitions are identical to its `Suggested.lean` lines 40–52); DiracScatteringAndNonlinearFourierTransform 1.3, DenoisingDiffusion 3.3, StochasticCalculus 9.4 on main; ScoreBasedDiffusion Conventions and 1.2, FlowMatching 4.1 and 5.2 at their open heads (neither puts a sign condition on the diffusion coefficient or matrix).
- Dependency check: `depcheck: 182 roadmaps, 2069 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing in the pull request changes a file outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates, nine `sorry` warnings and nothing else. One-tactic probe (`rfl`, `simp`, `simp` with the definitions unfolded) on a scratch copy closes none of the nine theorems. Elaborated types compared with the README statements: all agree; `phi` does not carry `[CompleteSpace 𝔸]`, which its body does not need and both theorems about it carry.
- Headline theorems: the five of the summary (growth bound; φ recursion and bound; exponential Euler convergence; second-order convergence; DDIM identity and error) are all stated; the reduction to Heun's method needs another roadmap's tableau and stays a README target.
- Automatic checks: all passed at this head.
- Pull request text: 9 theorems, 16 definitions, three open suppliers and the two on main, as the description says.

Overlap check: read DiffusionODESamplerGuarantee, OneStepMethodsForODEs, ScoreBasedDiffusion, FlowMatching, OneParameterSemigroups, DenoisingDiffusion; nothing shared (DiffusionODESamplerGuarantee and DenoisingDiffusion exclude DDIM and exponential integrators in their scope sections; OneStepMethodsForODEs 6.1 bounds discrete steps under a one-sided Lipschitz condition, not solutions; OneParameterSemigroups has only the homogeneous Cauchy problem). The open IncompressibleFlows states a mild equation for a single semigroup with a forcing; the two-parameter, weighted predicate here is a different object under a different namespace.

Source independence: 9 passages compared with 2 sources (lu2022dpmsolver, song2021ddim), none shared; largest share Hochbruck–Ostermann 2010, 18 of 29 locators; its text and table of contents could not be read, so wording and contents were not compared with it.

Research link: Layers 3–4 give explicit constants for the convergence theorems the README attributes to Hochbruck–Ostermann 2010 (Theorems 2.14, 2.17; not read); Layer 5 makes quantitative the first-order statement and the DDIM identity of Lu, Zhou, Bao, Chen, Li, Zhu 2022 (Theorem 3.2, Section 4.1; read) for Song, Meng, Ermon 2021 (12).

## Not verifiable

- Hochbruck and Ostermann, *Exponential integrators*, Acta Numerica 19 (2010): Assumption 2.2 with (2.6), Example 2.3, (2.10), (2.11), Lemma 2.4, (2.19), Example 2.12 with (2.29), (2.31), (2.32), Theorems 2.14 and 2.17, Assumptions 2.9, 2.10, 2.16, Example 2.18 with (2.39). These are the locators of the sampled targets 1.1, 1.2, 2.1, 2.2, 3.1, 3.2, 3.3, 4.1, 4.2, 4.3. Looked at: the DOI 10.5445/IR/1000024914 (the KIT repository, a host the source service does not classify) and the publisher's DOI 10.1017/S0962492910000048 (publisher page); neither could be read under the project's rules. The README claims of each only that the source states the constant-generator case with unspecified constants and that the statements here are proved in the roadmap; the mathematics of those statements was verified independently above.

## Source issues

- none

## For the human reviewers

- **Not tested.** Hochbruck–Ostermann 2010 has the largest share of locators (18 of 29) and its text and table of contents were not read: wording and arrangement were not compared with it. All its locators lie in its Section 2.
- **Licence.** The README (References, line 717) points to the copy of that article in the KIT repository (`publikationen.bibliothek.kit.edu/1000024914`), an institutional repository the source service does not classify; whether it is a legal place to read from is yours to settle.
- **Scope.** Layer 5 rests on two machine-learning conference papers (lu2022dpmsolver, NeurIPS 2022; song2021ddim, ICLR 2021), read as arXiv preprints; Layers 1–4 rest on one Acta Numerica survey. The topic file says `math.CA`.
