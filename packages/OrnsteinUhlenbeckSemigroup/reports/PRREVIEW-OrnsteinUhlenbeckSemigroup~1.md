# Review of OrnsteinUhlenbeckSemigroup (pull request #2775 at 930e831)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement was instantiated and recomputed (Mehler's density and series, the backward equation, the Dirichlet form, the gradient commutation, the eigenrelations, the three decay statements, the sharpness computation, and every counterexample given as a Check), and all values agree with the text; the O'Donnell and DLMF locators were read and support the statements. There are two small corrections and one format note, none blocking. One thing is left for a human: the seventeen locators into van Handel's lecture notes could not be read, so they are unverified, and those notes are unpublished.

## C01 — The route of 3.2 says no semicontinuity of `klDiv` is available, but the pinned Tau Ceti proves it

In the route of 3.2 (line 359) the text says "Mathlib states no semicontinuity of `klDiv`, so this limit argument is part of the target." That is true of Mathlib, but an implementer reads it as "no pinned library has it" and rebuilds the Fatou step by hand. The pinned Tau Ceti has `TauCeti.lowerSemicontinuous_klDiv_probabilityMeasure` (`TauCeti/InformationTheory/KullbackLeibler/Variational.lean`, line 519): on a pseudo-metrizable Borel space, `(μ, ν) ↦ klDiv μ ν` is jointly lower semicontinuous for the weak topology on pairs of probability measures. Since `(P_t hₙ) · γ → (P_t h) · γ` weakly, it gives the inequality on the left side of the limit directly.

The smallest change: replace the sentence by one that names this declaration as an available input for the left-hand limit, and add it to the *Needs:* line of 3.2 and to the Tau Ceti contract. The convergence of the right side still has to be proved as the route says.

## C02 — The comparison with the semigroup of OptimalTransport 11.9 is said to be "left to that roadmap", which does not state it

In the scope section (lines 479–481) the text says "the identification of the two for `V = ‖x‖²/2` … are left to that roadmap". OptimalTransport 11.9 on main says only that for `V = ‖x‖²/2` its semigroup "is the Ornstein–Uhlenbeck semigroup, with invariant law `N(0,I)`"; it has no target that identifies its semigroup with the kernels `N(e^(−t) x, (1 − e^(−2t)) I)`, and being earlier in the merge order it cannot cite this roadmap. A reader therefore takes the comparison as owned when neither roadmap states it.

The smallest change: say that the identification is stated by neither roadmap (as the text already does for StochasticCalculus 9.4, "not treated here"). Stating it here as a target that consumes OptimalTransport 11.9 would also be legitimate, since that roadmap is on main; that is the author's choice.

## N01 — The contraction of `L^p(γ)` in 1.1 uses the invariance of 1.3, which the *Needs:* line of 1.1 omits

The third fact of 1.1 (lines 88–90) is proved "by Jensen's inequality and the invariance of 1.3", while 1.1's *Needs:* line lists no part of 1.3 and 1.3 needs 1.1. There is no cycle (1.3 uses only the definitions of 1.1), but an implementer following the lines meets the forward reference. Either add "1.3 (for the contraction)" to the line, or move that bullet to the consequences listed in 1.3.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 kernels, semigroup law, Mehler form | `s,t ≥ 0` with `a=e^(−2t)`, `b=e^(−2s)`; `t=0`; `f=(x 0)²`; wrong kernel; `t=−½log 2` | `ab=e^(−2(s+t))`, both in `[0,1]`; `noiseKernel 1 = id`; `P_t f = e^(−2t)x²+1−e^(−2t)`, mean 1; wrong variance `0.76746`; `e^(−t)=√2` | agrees | none |
| 1.2 `ouKernel_eq_withDensity` | quotient of densities of `N(ρx,(1−ρ²)I)` and `γ`; `d=0`; `t=0`, `d≥1` | exponent `−(ρ²‖x‖²−2ρ⟪x,y⟫+ρ²‖y‖²)/(2(1−ρ²))` both sides; `d=0`: kernel 1, both Dirac; `t=0`: Lean density is `0`, not Dirac | agrees; `t>0` needed | none |
| 1.2 `hasSum_mehlerKernel` | `d=1`, `ρ=0.4`, `(0.3,−0.7)`; `d=2`, `t=1` and `0.2`, series to `n<160` per coordinate; `d=0` | closed form `0.9342031102`; `1.0686382199` vs series `1.0686382199`; `0.6779163502` vs `0.6779163502`; `d=0`: `1=1` | agrees | none |
| 1.3 `isReversible_ouKernel` | `d=1`, `t=0.3`, `f=e^(−y²)(1+y)`, `g=sin 2y+y²`; `t=0`; `t<0`, `e^(−t)=2`, `A=[0,1]`, `B=[0,2]` | `0.4463293644` both sides; `γ(A∩B)` symmetric; `0.34134` vs `0.19146` | agrees; `0 ≤ t` needed | none |
| 2.1 `hasDerivWithinAt_ouSemigroup` | `d=2`, README's `f`, `x=(0.7,−0.4)`, `t=0.3` (central difference) and `t=0`; `f=(x 0)²` | difference quotient `1.52528`; `P_t L f = 1.5252743`; `L f(x) = 9.029586`; `2e^(−2t)(1−x²)` both sides | agrees | none |
| 2.1 `ouGenerator_ouSemigroup` | same `f`, `t=0.3`; `t=−½` | `ρ²P_tΔf−ρ⟪x,P_t∇f⟫ = 1.5252743 = P_t L f`; difference `(c²−1)Δf(cx)=22.8325` | agrees; `0 ≤ t` needed | none |
| 2.2 `integral_mul_ouGenerator` | `d=2`, README's `f`, `g`; `f=g=x 0`; `d=1`, `f=1`, `g′=√(2π)e^(x²/2)arctan x` | `−8.786549` both sides; `−1=−1`; `(g′φ)′=1/(1+x²)`, left `π`, right `0` | agrees; growth bound needed | none |
| 2.3 `gradient_ouSemigroup` | `d=2`, `t=0.3`; `t<0` | `(1.8594180, −0.2091590)` both sides; `c∇f(cx)` both sides | agrees | none |
| 2.4 `ouSemigroup_hermiteProd`, `ouGenerator_hermiteProd` | `α=(2,1)`, `x=(0.7,−0.4)`, `t=0.25`; `α=0`; physicists' `4x²−2`; `t=−½`, `α=(2)` | `H_α x=0.204`, `e^(−0.75)·0.204=0.0963628`; `1=1`; `L=8−8x²`; `0.33196` vs `−1.38632` | agrees; `0 ≤ t` needed for the semigroup | none |
| 3.1 `variance_ouSemigroup_le` | `f=x 0`; `f=sign`, `t=0.5`; `f=e^(x²/4)`, `t=1`; `f=x²`, `t<0` | `e^(−2t)=e^(−2t)`; `(2/π)arcsin(e^(−1))=0.23983 ≤ 0.36788`; right side junk `0`, left `0.018571`; `2c⁴ > 2c²` | agrees; `L²` and `0 ≤ t` needed | none |
| 3.2 `klDiv_bind_ouKernel_le` | `μ=N(m,I)`; `N(0,3)`, `t=0.5`; `μ=2γ`; `μ=γ`, `e^(−2t)=2`; `μ` not `≪ γ` | `e^(−2t)‖m‖²/2` both; `0.09216 ≤ 0.16580` (`0.45069` at start); `0.38629 > e^(−2t)·0.38629`; `0.15343d > 0`; right side `∞` | agrees; probability and `0 ≤ t` needed | none |
| 3.3 `eLpNorm_ouSemigroup_le` | `f=e^(λx)`: log ratio `(λ²/2)((q−1)e^(−2t)−(p−1))`; `t=½log 3`, `p=2`, `q=4`; `t=0`; `q<1`; `q≤0`; `p=¾`, `q=½`, `t=½log 2`, `f=1_[0,0.1]` | ratio exponent `0`, both norms `e`; `q≤p`; reduces to `q=1`; left `0`; `‖f‖_p=0.013601 < ‖P_t f‖_q=0.037540` | agrees; `p ≥ 1` needed | none |
| 3.4 `exists_eLpNorm_ouSemigroup_gt` | `t≥0`: `p=2`, `q=4`, `t=0.3`, `λ=1`; `t<0`: exponent `(λ²/2)(qc²−p)`; `d=0`; `C=0` | `0.32322>0`, grows like `λ²`; `qc²−p > c²−1 > 0`; `d=0`: `‖P_t f‖_q=‖f‖_p`, `C=1` fails; `0<‖P_t f‖_q` | agrees; `d ≥ 1` needed | none |
| Conventions: junk values | `√(1−e^(−2t))` for `t<0`; `variance` of a non-`L²` function; `klDiv` of `2γ`; `eLpNorm` at exponent `ofReal q`, `q≤0` | `0`; `0`; `2log 2−1`; `0` | as the text says | none |
| C01: semicontinuity of `klDiv` | pinned Tau Ceti, `Variational.lean` line 519 | weak joint lower semicontinuity on probability measures exists | text misleading | small correction |
| C02: OptimalTransport 11.9 | its text on main | names the semigroup for `V=‖x‖²/2`; no comparison with Gaussian kernels | unowned comparison | small correction |

- Source locators checked against the text: 10 of 27 (O'Donnell: Remark 11.14, Propositions 11.15, 11.26, 11.27, 11.28, 11.33, 11.37, Theorem 11.23, Exercise 11.10 (c), with their pages 331–339 and 371; DLMF 18.18.28). The 17 into van Handel's notes: not read.
- Library declarations opened at the pins: 24 (Mathlib: `Kernel.IsReversible` and `.invariant`, `Invariance.lean` 58 and 63; `Kernel.IsMarkovKernel.map`, `MapComap.lean` 118; `map_pi_eq_stdGaussian`, `Multivariate.lean` 135; `klDiv`, `Basic.lean` 56; `variance`, `Variance.lean` 64; `integral_map`, `integral_dirac`; `hasDerivAt_integral_of_dominated_loc_of_deriv_le`, `hasFDerivAt_integral_of_dominated_of_fderiv_le`, `ParametricIntegral.lean` 569 and 222; `laplacian_eq_iteratedFDeriv_orthonormalBasis`, `Laplacian.lean` 171; `hermite_succ`; `mgf_gaussianReal`; `eLpNorm_le_eLpNorm_of_exponent_le`; `multivariateGaussian`. Tau Ceti: `stdGaussian_eq_withDensity` and `multivariateGaussian_eq_withDensity`, `Density.lean` 164 and 265; `gaussianHermitePiBasis`, `coeFn_gaussianHermitePiBasis`, `Pi/Basis.lean` 54 and 71; `hasSum_gaussianHermitePi_expansion`, `Pi/Parseval.lean` 132; `Polynomial.derivative_hermite`, `Derivative.lean` 64; `hermiteFunction_oscillator`; `lowerSemicontinuous_klDiv_probabilityMeasure`). All exist with the stated content.
- Duplication by object: no Mehler kernel, Ornstein–Uhlenbeck semigroup or Gaussian hypercontractivity in the pinned Mathlib or Tau Ceti (searched by object); the copy of `noiseKernel` agrees character for character with `TauCetiRoadmap/DenoisingDiffusion/Suggested.lean` line 59 and carries a different fully qualified name.
- Cross-roadmap citations resolved: 11 (DenoisingDiffusion 2.1 and 2.2 with `noiseKernel_apply`, `noiseKernel_comp` and the forward marginal; RandomMatrices 2.2 and 2.5; MathematicalStatisticsFoundations 4.4 `gaussian_integration_by_parts`; OptimalTransport 11.9; SpecialFunctionsOrthogonalPolynomialsGeneral 8.2 with the value `0.9342031102`; StochasticCalculus 9.4; OrthogonalL2Bases; BooleanFunctionAnalysis, ScoreBasedDiffusion and LogConcaveFunctionalInequalities at their open heads).
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line. The three suppliers are on main.
- Elaboration of `TauCetiRoadmap/OrnsteinUhlenbeckSemigroup/Suggested.lean`: 13 `sorry` warnings and nothing else. The elaborated type of each of the 19 declarations was compared with its README statement: all agree, no binder lost. One-tactic probe (`rfl`, `simp`, `infer_instance`, unfolding the six definitions then `simp`) on a scratch copy: none of the 13 theorems closes. All 13 headline statements of the README are stated; none is declared not statable.
- The worker's automatic checks all passed on this head.
- Pull request text against the head: 13 theorems, 6 definitions, single `import Mathlib`, suppliers on main, nothing outside the folder: the description agrees with the head.

Overlap check: read ScoreBasedDiffusion, LogConcaveFunctionalInequalities, DenoisingDiffusion (and searched every open head and main by object for the Ornstein–Uhlenbeck semigroup, Mehler's kernel and hypercontractivity); `noiseKernel` and its composition law: owner DenoisingDiffusion 2.1, cited here; entropy decay along classical Fokker–Planck solutions: owner LogConcaveFunctionalInequalities Layer 4, which leaves the Ornstein–Uhlenbeck semigroup as such to this roadmap; nothing else shared.

Source independence: 8 passages compared with 2 sources (O'Donnell, DLMF), none shared beyond formulas; largest share van Handel's notes, 17 of 27 locators, whose text and table of contents could not be read; contents compared with O'Donnell Chapter 11 (§11.1 noise operator, hypercontractivity and generator together, §11.2 Hermite polynomials): independent.

Research link: Layer 3 is Nelson's hypercontractivity theorem (Nelson 1966, 1973) by the route of Gross (1975) through the Gaussian logarithmic Sobolev inequality; Layers 1–2 are the Gaussian noise operator and Hermite calculus that O'Donnell (2014), Chapter 11, uses for invariance principles. Rests on the README's references and O'Donnell's notes to Chapter 11.

## Not verifiable

- van Handel, *Probability in High Dimension* (lecture notes, 2016): Theorems 2.18, 2.25 (proof), 3.20, 3.24, 8.9, Lemmas 2.22, 8.8, Corollary 2.27, Examples 8.10, 8.13 and their pages. The sources service did not accept the Princeton address as an author's page (the address does not spell an author's name), and no other legal copy was sought. The constants quoted from it (`c = 1`, `c = 1/2`, `c = 1`) are consistent with the rates the roadmap states, which were recomputed independently.
- The papers of Mehler, Uhlenbeck and Ornstein, Nelson and Gross: cited by attribution only, as the README says; the attributions agree with O'Donnell's notes to Chapter 11.

## Source issues

- none

## For the human reviewers

- **Not tested / licence.** van Handel's notes carry 17 of the 27 source locators (README, References, lines 585–590). They are unpublished lecture notes on the author's university page; their text and table of contents were not read, so wording and arrangement were not compared with them.
- **Later library versions.** The pull request description says Tau Ceti after the pin has a one-dimensional Mehler operator and a Gaussian Poincaré inequality; at the pin neither file exists (checked in `TauCeti/Probability/Distributions/Gaussian/`). Whether to re-pin before merging is yours.
