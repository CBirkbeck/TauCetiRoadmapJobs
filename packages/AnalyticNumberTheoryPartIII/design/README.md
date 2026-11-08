# Roadmap: analytic number theory, part III — smoothing, contour shifts and the classical Dirichlet series

**Summary.** This part builds the general analytic tools that turn a zero-free region into an
error term for a prime sum, and the Dirichlet series of the classical arithmetic functions. It
starts from Mathlib's Fourier transform `𝓕`, `mellin`, `mellinInv`, `LSeries`, `riemannZeta` and
`ArithmeticFunction`, and from Tau Ceti's residue calculus and bounded-variation measures. In order
it proves: Fourier decay for functions of bounded variation and principal-value inversion on
vertical lines with a quantitative window (Layer 7); the rectangle residue theorem in edge form,
the derivative Borel–Carathéodory inequality and Landau's local logarithmic-derivative lemma
(Layer 8); Mellin convolution, Mellin transforms of compactly supported bumps, approximate
identities for `dx/x` and the smoothed cutoffs `1̃_ε` (Layer 9); the general transfer theorem from a
zero-free region of width `η(t)` and a polylogarithmic bound to the error `x exp(−c ω(x))`, and the
classical bound `L′/L ≪ log(|t| + 3)` in the de la Vallée Poussin region for every Dedekind zeta
function and Hecke `L`-function (Layer 10); completely multiplicative arithmetic functions, the
divisor functions `σ_ν` and `d_z` for complex parameters, Ramanujan's four-shift identity and the
series of `2^ω`, `μ²`, `λ` and `φ` with their exact abscissas (Layer 11); the Hardy–Landau
Tauberian theorem for Cesàro means (Layer 12); and the asymptotics of Erdős problem 392 and the
Goldbach-range propositions with their elementary transfers (Layer 13).

## Scope and ownership

**Place in the series.** AnalyticNumberTheoryPartI owns Layers 0–3 (quantitative primes, the
exclusion of Landau–Siegel zeros, explicit formulas, Hecke and Artin comparisons, multiplicative
means) and AnalyticNumberTheoryPartII owns Layers 4–6. This part owns Layers 7–13, numbered after
them so that section numbers never collide across the series. Part I uses contour shifts and
smoothing kernels as local steps of particular estimates (its §§0.11c and 1.2a are examples), and
it states two results for `ζ` alone: the logarithmic-derivative bound right of the de la Vallée
Poussin curve (§0.33a) and the divisor-square Euler identity (§3.24a). This part builds the tools
once, as general statements with their own hypotheses; it consumes those two `ζ` statements as
the `K = ℚ` instance of 10.3 and the `α = β = 0` instance of 11.3 and does not restate them. It
plans none of Part II's objects.

**Owned here.**

- Layer 7: decay of `𝓕f` for integrable functions of bounded variation and for functions with a
  derivative of bounded variation; the two uniform bounds on the truncated Dirichlet integral;
  pointwise principal-value inversion of the two-sided Laplace and the Mellin transform on a
  vertical line, and its windowed error.
- Layer 8: the rectangle residue theorem in Mathlib's edge form and the U-shaped contour identity
  that follows; Carathéodory's coefficient inequality and the derivative form of Borel–Carathéodory;
  Landau's local logarithmic-derivative lemma.
- Layer 9: Mellin convolution on `(0, ∞)`, Mellin transforms of compactly supported `C^k` bumps,
  the delta spikes `ν_ε` and their approximate-identity property, and the smoothed cutoffs `1̃_ε`.
- Layer 10: smoothed summatory functions of Dirichlet series as inverse Mellin integrals and their
  comparison with sharp sums; the transfer theorem in Ingham's zero-free-region form; the
  classical logarithmic-derivative bound for Dedekind zeta functions and Hecke `L`-functions of a
  fixed field and character. Its `K = ℚ`, `χ = 1` instance is AnalyticNumberTheoryPartI §0.33a;
  10.3 differs in covering every number field and every ray class character.
- Layer 11: the predicate of complete multiplicativity on `ArithmeticFunction R` and its equivalence
  with Mathlib's `ℕ →*₀ R`; `σ_ν` for `ν ∈ ℂ`; `d_z` for `z ∈ ℂ`; Ramanujan's four-shift identity;
  the series of `2^ω`, `μ²`, `λ` and `φ`, each with its exact abscissa of absolute convergence, and
  the series of `τ(n²)`. The `α = β = 0` instance of Ramanujan's identity,
  `Σ τ(n)² n^{−s} = ζ(s)⁴/ζ(2s)`, is AnalyticNumberTheoryPartI §3.24a. 11.1 is the `ℕ`-indexed
  predicate for an arbitrary monoid with zero `R`, with no condition on the primes where `f`
  vanishes; ArithmeticDirichletSeries §0.2's `TauCeti.MultiplicativeIdealWeight` is the
  ideal-indexed carrier `Ideal (𝓞 K) →*₀ ℂ` of a number field that kills only finitely many primes,
  with unit-modulus subtype `TauCeti.UnitaryIdealWeight`; at `K = ℚ` its image under
  `TauCeti.normCoeff` is completely multiplicative in the sense of 11.1, while 11.1 also admits
  functions vanishing at infinitely many primes. The Dirichlet series of `d_k = ζ^k`, `k ∈ ℕ`, is
  the `z = k` instance of 11.2 and is owned here;
  ArithmeticDirichletSeriesPartII, later in the merge order, owns the asymptotic of the partial
  sums of `d_k` (its §5.1) and consumes the series from 11.2.
- Layer 12: the Hardy–Landau Tauberian theorem for Cesàro means, one-sided for real sequences and
  two-sided in Banach spaces.
- Layer 13: the asymptotics of the least number of factors of `n!` bounded by `n²` (Erdős problem
  392) and by `n`; the Goldbach-range propositions, their transfers, and the published finite
  verifications as named propositions.

**Already in the libraries, consumed.**

- Mathlib: the value form of Borel–Carathéodory (`Complex.borelCaratheodory`); Mellin inversion for
  transforms integrable on the line (`mellinInv_mellin_eq`); `𝓜 1_(0,1] = 1/s`
  (`hasMellin_one_Ioc`); the smooth Fourier decay `(1 + u²)‖𝓕f(u)‖ ≤ ‖f‖₁ + ‖f″‖₁/(4π²)` for `C²`
  functions with integrable derivatives (`Real.one_add_sq_mul_norm_fourier_le`); the Euler
  products of `ζ` and of completely multiplicative `ℕ →*₀ F`; the Euler-product logarithm of `ζ`
  (`riemannZeta_eq_exp_LSeries`); `ArithmeticFunction.sigma k` for `k : ℕ`, `liouville`,
  `cardDistinctFactors`, `moebius`; Cesàro convergence of convergent sequences
  (`Filter.Tendsto.cesaro`); Stirling (`Stirling.factorial_isEquivalent_stirling`); Chebyshev's
  bound and Legendre's formula.
- Tau Ceti: the Dirichlet integral `TauCeti.Contour.tendsto_integral_sin_div_atTop`; the residue
  theorem; the truncated Perron kernel and its arithmetic formula; integration by parts against
  the derivative measure of a function of bounded variation.

**Stated by other roadmaps, not planned here.**

- Zero-free regions, zero counting, the explicit formula and the prime ideal theorem with
  classical error: ZerosOfLFunctions Layers 4–8 (its §8.5 at `K = ℚ` is a Check of 10.2–10.3 here).
- Effective and conductor-uniform estimates, the zero-free strip for `ζ` with logarithmic bounds
  for `ζ − 1/(s − 1)` and `1/ζ` (§0.33), the bounds for `ζ′` and `ζ′/ζ` after pole subtraction on
  the half-plane right of the curve (§0.33a), the Dirichlet divisor average (§3.22), the pointwise
  divisor bounds (§§3.1, 3.4) and the divisor-square Euler identity (§3.24a):
  AnalyticNumberTheoryPartI.
- Truncated Perron for `LSeries`, Abel–Stieltjes summation, Wiener–Ikehara and the transfer
  `ψ → θ → π`: ArithmeticDirichletSeries Layers 6, 9 and 10.
- Newman's Tauberian theorem: TauberianBoundaryConvergence N1–N2.
- Every decimal constant, the explicit smoothed Perron formulas, the Vinogradov–Korobov region,
  Pintz-type sharpenings and the published prime-gap verifications: the explicit roadmaps
  (ExplicitZetaBounds, ExplicitPrimeCounting, ExplicitMultiplicativeFunctions).
- The shift of a full vertical line across a strip with finitely many poles under uniform decay:
  AsymptoticExpansions §8.2. 8.1 here differs in being a finite-height rectangle statement with no
  decay hypothesis.
- The sine integral `Si` as an entire function, with its continuation, asymptotics and Gibbs
  phenomenon: SpecialFunctionsEiLiErfIncompleteGamma Layer 9. 7.2 here states only two uniform
  bounds on the real truncated Dirichlet integral, without defining a function.
- The Fejér means of circle `L¹` functions and their `L¹` approximation: ToeplitzOperators T1.
  Their uniform and `L^p` convergence is an extension of that roadmap and is not planned here.
- The residue calculus itself: ContourIntegration (realized in Tau Ceti).
- The Laplace carrier `HasLaplace` and Delange's theorem: ArithmeticDirichletSeriesPartII. Layer 7
  works with Mathlib's Fourier carrier and needs neither.

## Conventions

- **Fourier transform.** `𝓕 f ξ = ∫ e^{−2πixξ} f(x) dx` (Mathlib). Witness: for `f = 1_[0,1]`,
  `𝓕 f (1/2) = (1 − e^{−πi})/(πi) = −2i/π`.
- **Mellin transform and its inverse.** `mellin f s = ∫_{(0,∞)} t^{s−1} f(t) dt` and
  `mellinInv σ F x = (2π)⁻¹ ∫_ℝ x^{−(σ+iy)} F(σ + iy) dy` (Mathlib); the inverse integral is
  `(2πi)⁻¹ ∫_{(σ)} F(s) x^{−s} ds`. Witness: `mellin 1_(0,1] 2 = 1/2`.
- **Two-sided Laplace transform.** `G(s) = ∫_ℝ g(u) e^{−su} du` on a line `Re s = c` where
  `u ↦ e^{−cu} g(u)` is integrable; under `u = −log t`, `mellin f = G` for `g(u) = f(e^{−u})`
  (Mathlib's `mellin_eq_fourier` records the same substitution).
- **Truncations.** The truncated inverse integral at height `T > 0` is
  `(2π)⁻¹ ∫_{−T}^{T} F(σ + iy) x^{−(σ+iy)} dy`; it equals a convolution with the Dirichlet kernel
  `D_T(v) = sin(Tv)/(πv)`, `D_T(0) = T/π`, whose integral over `ℝ` is `1` as an improper integral.
  Witness: for `F = 1/s` (the Mellin transform of `1_(0,1]`) and `x = 1` the truncated integral is
  `π⁻¹ arctan(T/σ)`, Tau Ceti's `TauCeti.truncatedPerronKernel_one`; it tends to `1/2`, the mean of
  `1_(0,1](1⁻) = 1` and `1_(0,1](1⁺) = 0`.
- **One-sided limits and variation.** `f(x₀⁻)`, `f(x₀⁺)` are Mathlib's `Function.leftLim` and
  `Function.rightLim`; the total variation of `f` on a set `S` is `(eVariationOn f S).toReal`.
- **Mellin convolution.** For `x > 0`, `(f ⋆ g)(x) = ∫_{(0,∞)} f(y) g(x/y) dy/y`. Identities about
  `⋆` are asserted only at `x > 0`. Witness: `(1_(0,1] ⋆ 1_(0,1])(x) = log(1/x)` on `(0, 1]` and
  `0` on `(1, ∞)`, so its value at `x = e^{−1}` is `1`.
- **Delta spikes and smoothed cutoffs.** For `ν : ℝ → ℝ` and `ε > 0`, `ν_ε(x) = ε⁻¹ ν(x^{1/ε})` for
  `x > 0` and `ν_ε(x) = 0` for `x ≤ 0` (the explicit zero avoids Mathlib's junk values of `x^{1/ε}`
  at negative `x`); `1̃_ε = 1_(0,1] ⋆ ν_ε`, extended by `0` on `x ≤ 0`. The standing bump hypotheses
  are: `ν ≥ 0`, `support ν ⊆ [1/2, 2]` and `∫_{(0,∞)} ν(x) dx/x = 1`; the smoothness `ν ∈ C^k` is
  stated where used. Witness: `mellin ν_ε s = mellin ν (εs)`, so at `ε = 1` the spike is `ν`.
- **`LSeries` is total.** Mathlib's `LSeries a s` is `0` where the series does not converge
  absolutely and ignores `a 0`. Every identity below is stated on a half-plane of absolute
  convergence or with `LSeriesSummable`, and coefficients are compared only at `n ≥ 1`.
- **Complex powers of integers.** `n^ν = exp(ν log n)` for `n ≥ 1`; arithmetic functions built from
  `n^ν` take the value `0` at `n = 0`.
- **Generalized divisor functions.** `σ_ν(n) = Σ_{d|n} d^ν`; `d_z` is multiplicative with
  `d_z(p^a)` the multiset coefficient `z(z+1)⋯(z+a−1)/a!` (Mathlib's `Ring.multichoose z a`).
  Witness: `d_{1/2}(p²) = 3/8` and `d_{−1} = μ`.
- **The Euler-product logarithm.** `log ζ(s)` means `LSeries (fun n ↦ Λ(n)/log n) s` for
  `Re s > 1`, the function whose exponential is `ζ(s)` by `riemannZeta_eq_exp_LSeries`; it is not
  the principal logarithm of the value `ζ(s)`.
- **Cutoffs.** `Σ_{n≤x}` runs over `1 ≤ n ≤ ⌊x⌋` and includes `n = x`. The partial sums of a
  sequence `(a_i)` are `S_N = Σ_{i<N} a_i` and its Cesàro means `N⁻¹ Σ_{i<N} S_i` for `N ≥ 1`,
  Mathlib's convention in `Filter.Tendsto.cesaro`.
- **Zero-free widths.** A width is `η : ℝ → ℝ`, used on `[3, ∞)`, with
  `0 < η(t) ≤ 1/2` there; its region is `R_η = {s : 1 − η(|Im s| + 3) ≤ Re s}` and its Ingham
  exponent is `ω_η(x) = inf_{t ≥ 3} (η(t) log x + log t)`.
- **Constants.** Every constant is existential with its dependence stated; uniformity in a
  parameter means the constant is chosen before it. No decimal constant is asserted.

## Exact supplier contracts

### From Mathlib

- `𝓕` on `ℝ` (`Mathlib/Analysis/Fourier/FourierTransform.lean`), `Real.norm_fourier_le_integral_norm`,
  `Real.fourier_deriv` (for differentiable `f` with `f, f′` integrable) and
  `Real.one_add_sq_mul_norm_fourier_le` (`Mathlib/Analysis/Fourier/FourierTransformDeriv.lean`); the
  Riemann–Lebesgue lemma.
- `BoundedVariationOn`, `eVariationOn`, `Function.leftLim`, `Function.rightLim`;
  `BoundedVariationOn.vectorMeasure` and `BoundedVariationOn.variation_vectorMeasure_univ_le`
  (`Mathlib/MeasureTheory/VectorMeasure/BoundedVariation.lean`), with the vector-measure integral
  `∫ᵛ`, `MeasureTheory.VectorMeasure.norm_integral_le_of_norm_le_const` and
  `MeasureTheory.VectorMeasure.tendsto_integral_of_dominated_convergence`
  (`Mathlib/MeasureTheory/VectorMeasure/Integral.lean`).
- `mellin`, `mellinInv`, `MellinConvergent`, `HasMellin`, `Complex.VerticalIntegrable`,
  `hasMellin_one_Ioc`, `mellin_comp_rpow`, `mellin_comp_mul_left`,
  `mellin_differentiableAt_of_isBigO_rpow` (`Mathlib/Analysis/MellinTransform.lean`);
  `mellin_eq_fourier`, `mellinInv_mellin_eq` (`Mathlib/Analysis/MellinInversion.lean`; the latter
  takes `MellinConvergent f σ`, `VerticalIntegrable (mellin f) σ` and `ContinuousAt f x`).
- `Complex.integral_boundary_rect_eq_zero_of_differentiableOn`
  (`Mathlib/Analysis/Complex/CauchyIntegral.lean`); Cauchy's estimates; `circleIntegral`.
- `Complex.borelCaratheodory` (`Mathlib/Analysis/Complex/BorelCaratheodory.lean`: for `f`
  differentiable on `‖z‖ < R` with `Re f ≤ M`, `0 < M`, the bound
  `‖f z‖ ≤ 2M‖z‖/(R − ‖z‖) + ‖f 0‖(R + ‖z‖)/(R − ‖z‖)`); `AnalyticOnNhd.sum_divisor_le` (Jensen).
- `riemannZeta`, `LSeries`, `LSeriesSummable`, `LSeriesHasSum`, `LSeries.term`,
  `LSeries.abscissaOfAbsConv`, `ArithmeticFunction.LSeries_zeta_eq_riemannZeta`,
  `ArithmeticFunction.LSeries_vonMangoldt_eq_deriv_riemannZeta_div`, `LSeries_convolution'`,
  `ArithmeticFunction.LSeries_mul`, `riemannZeta_ne_zero_of_one_le_re`,
  `riemannZeta_eq_exp_LSeries` (`Mathlib/NumberTheory/EulerProduct/DirichletLSeries.lean`).
- `ArithmeticFunction` with Dirichlet convolution, `ArithmeticFunction.IsMultiplicative`,
  `ArithmeticFunction.zeta`, `ArithmeticFunction.sigma` (`k : ℕ`), `ArithmeticFunction.pow`,
  `ArithmeticFunction.moebius`, `ArithmeticFunction.liouville` with
  `ArithmeticFunction.liouville_apply_mul`, `ArithmeticFunction.cardDistinctFactors`,
  `ArithmeticFunction.vonMangoldt`, `ArithmeticFunction.pmul`, `Nat.totient`; the completely
  multiplicative Euler product `EulerProduct.eulerProduct_completely_multiplicative_tprod` for
  `ℕ →*₀ F` (`Mathlib/NumberTheory/EulerProduct/Basic.lean`); `Ring.multichoose` and its
  `BinomialRing ℂ` instance (`Mathlib/RingTheory/Binomial.lean`).
- `Filter.Tendsto.cesaro`, `Filter.Tendsto.cesaro_smul`
  (`Mathlib/Analysis/Asymptotics/SpecificAsymptotics.lean`).
- `Stirling.factorial_isEquivalent_stirling`, `Stirling.le_factorial_stirling`;
  `Chebyshev.theta_le_log4_mul_x` (`Mathlib/NumberTheory/Chebyshev.lean`); `Nat.factorization_factorial`
  (`Mathlib/Data/Nat/Choose/Factorization.lean`).

### From Tau Ceti

- `BoundedVariationOn.integral_deriv_smul_eq_neg_integral_vectorMeasure`
  (`TauCeti/Analysis/BoundedVariation/OneDimensional.lean`): for `f` of bounded variation on `ℝ`
  with values in a real Banach space and a real compactly supported `C¹` test function `φ`,
  `∫ φ′ • f = −∫ᵛ φ ∂(Df)`, with no integrability of `f` assumed.
- `TauCeti.Contour.tendsto_integral_sin_div_atTop`
  (`TauCeti/Analysis/Contour/WorkedExamples/HalfDisc/SineIntegral.lean`):
  `∫_0^R sin x/x dx → π/2`.
- `TauCeti.Contour.residue` (`TauCeti/Analysis/Contour/Residue/Basic.lean`) and
  `TauCeti.Contour.classicalResidueTheorem_nullHomologous`
  (`TauCeti/Analysis/Contour/Residue/Cycle.lean`): for `f` holomorphic on an open `U` off a finite
  `S`, meromorphic at the points of `S ∩ U`, and a closed piecewise-`C¹` null-homologous curve in
  `U` avoiding `S`, the contour integral is `2πi Σ_{s∈S} n(γ, s) Res_s f`.
- `TauCeti.truncatedPerronKernel`, `TauCeti.truncatedPerronKernel_one` and
  `TauCeti.truncatedPerron_LSeries` (`TauCeti/NumberTheory/ArithmeticDirichletSeries/Perron/`).
- `TauCeti.LFunctions.heckeLFunctionC` (`TauCeti/NumberTheory/LFunctions/Hecke/Basic.lean`), the
  continued `L`-function of a ray class character `χ : TauCeti.GlobalNumberFields.RayClassCharacter 𝔪`
  at its presentation modulus, and `TauCeti.LFunctions.heckeLFunctionC_eq_primitive`.

### From TauCetiRoadmap.ContourIntegration

Layers 2–4 (completed and realized in Tau Ceti): residues, winding numbers and the residue
theorem for null-homologous piecewise-`C¹` curves, with the exact hypotheses listed under From Tau
Ceti.

### From TauCetiRoadmap.ArithmeticDirichletSeries

§6.3 (truncated Perron kernel, its endpoint value `π⁻¹ arctan(T/c)` at `x = 1`) and §6.4 (the
arithmetic Perron formula), completed and realized as the Tau Ceti declarations above. They are
the `f = 1_(0,1]` instance of 7.3 and are used only as Checks.

### From TauCetiRoadmap.LFunctions

Layer 3 (the continued Dedekind zeta function and its simple pole at `1`), Layer 5 (finite-order
Hecke `L`-functions, their Euler products on `Re s > 1`, and the comparison of a presented
character with its primitive one) and Layer 7 (nonvanishing on `Re s = 1`). 10.3 uses the Euler
product to bound `|L(2 + it)|` below by a positive constant depending only on `[K:ℚ]`.

### From TauCetiRoadmap.ZerosOfLFunctions

- §3.4, the "wide strips above the poles" corollary: for a fixed record, `|L(σ + it)| ≤ C(|t| + 3)^B`
  for `σ` in a fixed closed strip and `|t| ≥ T₀` above the poles.
- §4.3 (Jensen's bound): for `f` analytic on `closedBall c R`, `f c ≠ 0`, `‖f‖ ≤ M` on the sphere
  with `M ≥ 1`, the number of zeros in `closedBall c r` is at most `log(M/‖f c‖)/log(R/r)`.
- §§6.2–6.4: for a primitive finite-order ray-class character `χ` of `K`, with
  `c = heckeZeroFreeConstant [K:ℚ]`, no zero `ρ` of `L(χ, ·)` with
  `Re ρ ≥ 1 − c/log analyticConductorAt d (i Im ρ)` except at most one real simple zero when
  `χ² = 1` (the predicate `IsExceptionalZero`); at a fixed `K` and `χ` the analytic conductor at
  height `γ` is at most `C_{K,χ} (|γ| + 3)^{[K:ℚ]}`.
- §6.5: no zero on `Re s = 1`.
- §8.5 at `K = ℚ`: `ψ(x) = x + O(x exp(−c √log x))`, used as a Check of 10.2–10.3.

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

- §0.33a (`riemannZeta_deriv_logDeriv_bound`): there are `0 < β < 1` and `C > 0` such that every
  `s ≠ 1` with `Re s ≥ 1 − β/log(|Im s| + 2)` has `ζ(s) ≠ 0` and
  `|ζ′/ζ(s) + 1/(s − 1)| ≤ C log(|Im s| + 2)`, the left side extending analytically across `1`.
  This is the `K = ℚ`, `χ = 1` instance of 10.3, consumed and not restated; it enters 10.3 as a
  Check.
- §§3.3–3.4 (the ordered factorization count `d_n` and its subpolynomial bound): `d_n` is the
  value at `z = n` of 11.2's `d_z`, a Check.
- §3.24a (`riemannZeta_pow_four_eq_mul_LSeries_divisor_sq`): for `Re s > 1` the series
  `Σ τ(n)² n^{−s}` converges absolutely and `ζ(s)⁴ = ζ(2s) Σ τ(n)² n^{−s}`. This is the
  `α = β = 0` instance of 11.3, consumed and not restated; it enters 11.3 as a Check.

There are no gaps: every prerequisite above exists at the pins or is a section of a roadmap on main
or earlier in the merge order.

## How to read the build

Layers 7, 8 and 11–13 are independent of one another and rest only on the libraries and the
suppliers above. Layer 9 is independent of Layer 7: its decay comes from integration by parts on compact supports. Layer 10 assembles 8.1–8.3, 9.1–9.4 and
the zero-free regions of ZerosOfLFunctions: 10.1 writes a smoothed sum as an inverse Mellin
integral, 10.2 shifts it across a rectangle inside the region, and 10.3 supplies the region and the
bound in the case of number-field `L`-functions. Layer 11 is pure arithmetic of `LSeries` on
half-planes of absolute convergence. A proof sketch names one route and its inputs; a target's
*Needs* line lists what its statement and that route use, so another route is not blocked.
`Suggested.lean` states the definitions `mellinConv`, `deltaSpike`, `smoothCutoff`,
`inghamExponent`, `IsCompletelyMultiplicative`, `sigmaC`, `generalizedDivisor`,
`factorialFactorCount`, `EvenGoldbachUpTo` and `OddGoldbachUpTo`, and the headline theorems of
7.1, 7.3, 8.1, 8.2, 8.3, 9.4, 10.1, 10.2, 10.3, 11.2–11.4, 12.1, 13.1 and 13.2. 8.1 is stated with
`TauCeti.Contour.residue` and Mathlib's rectangle edge expression, and 10.3 in its general form,
for `TauCeti.LFunctions.heckeLFunctionC χ` with `χ : TauCeti.GlobalNumberFields.RayClassCharacter 𝔪`
of finite order; `Suggested.lean` imports the Tau Ceti modules that declare these carriers. The
`K = ℚ`, `χ = 1` instance of 10.3 is AnalyticNumberTheoryPartI §0.33a and is not stated again.

## Layer 7: Fourier and Laplace tools

### 7.1 Fourier decay for bounded variation

*An integrable function of bounded variation.* Prove that if `f : ℝ → E`, `E` a complete normed
complex space, is integrable and of bounded variation on `ℝ`, then `f(x) → 0` as `x → ±∞` and
`‖f(x)‖ ≤ V` for every `x`, where `V = (eVariationOn f univ).toReal`. Bounded variation gives the
two limits; integrability forces them to be `0`.

*Decay.* For such `f` and every real `ξ ≠ 0`, `‖𝓕f(ξ)‖ ≤ V/(2π|ξ|)` (`kontorovichtao-pntplus`
line 189, Lemma 3.1.4; katznelson2004, Chapter I, for the analogue for Fourier coefficients on the circle). Route: apply the Tau Ceti integration by parts to the real and imaginary
parts of `φ_R(x) = χ(x/R) e^{−2πixξ}` with a fixed bump `χ`, equal to `1` near `0`; the terms with
`χ′(x/R)/R` vanish as `R → ∞` because `f` is integrable, dominated convergence for `∫ᵛ` passes to
the limit, and `2πiξ 𝓕f(ξ) = ∫ᵛ e^{−2πixξ} ∂(Df)`; the vector-measure norm bound and
`variation_vectorMeasure_univ_le` give `V`.

*A derivative of bounded variation.* Let `g : ℝ → E` be integrable and of bounded variation, of
total variation `V₁`, and `f(x) = f(0) + ∫_0^x g` with `f` integrable. Prove
`𝓕g(ξ) = 2πiξ 𝓕f(ξ)` for every `ξ`; hence `‖𝓕f(ξ)‖ ≤ V₁/(2π|ξ|)²` for `ξ ≠ 0` and
`(1 + ξ²)‖𝓕f(ξ)‖ ≤ ‖f‖₁ + V₁/(4π²)` for every `ξ` (`kontorovichtao-pntplus` lines 198–209, Lemmas
3.1.5–3.1.6). The first identity is the absolutely continuous form of `Real.fourier_deriv`: on
`[−R, R]` integrate by parts with the primitive, and `f(±R) → 0`.

*The `C²` form.* If `f` is `C²` and `|f(t)|, |f″(t)| ≤ A/(1 + t²)` for all `t`, then `f′` is
integrable and `(1 + ξ²)‖𝓕f(ξ)‖ ≤ (π + 1/(4π)) A` for every `ξ` (`kontorovichtao-pntplus` lines
210–220, Lemma 3.1.7). Route: `f′(t) = −∫_t^∞ f″` and the same on the left give `|f′(t)| ≤ πA`
and `f′(t) → 0`; on `[t, t + 1]`, `|f′(t)| ≤ 2 sup|f| + sup|f″|` gives `f′ = O(1/t²)`; then
`Real.one_add_sq_mul_norm_fourier_le` with `‖f‖₁, ‖f″‖₁ ≤ πA`.

**Checks.**

- `f = 1_[0,1]`: `V = 2` and `|𝓕f(ξ)| = |sin πξ|/(π|ξ|)`; at `ξ = 1/2` both sides of the decay bound
  equal `2/π`, so the constant `1/(2π)` is sharp, and a bound `V/(4π|ξ|)` would be false there.
- The hypothesis `ξ ≠ 0` is needed: at `ξ = 0` the right side is the junk value `V/0 = 0`, while
  `𝓕(1_[0,1])(0) = 1`.
- The tent `f(x) = max(0, 1 − |x|)` has `g = f′` of variation `V₁ = 4` and
  `𝓕f(ξ) = (sin πξ/(πξ))²`; at `ξ = 1/2` both sides of `‖𝓕f‖ ≤ V₁/(2πξ)²` equal `4/π²`, and the
  `(1 + ξ²)` form at `ξ = 0` reads `1 ≤ 1 + 1/π²`.
- `f(t) = 1/(1 + t²)` satisfies the `C²` hypotheses with `A = 2` (`|f″(t)| = |6t² − 2|/(1 + t²)³ ≤
  2/(1 + t²)`); `𝓕f(ξ) = π e^{−2π|ξ|}`, so the left side at `ξ = 0` is `π ≤ 2(π + 1/(4π))`.

*Needs:* Mathlib `BoundedVariationOn.vectorMeasure`, `BoundedVariationOn.variation_vectorMeasure_univ_le`,
`MeasureTheory.VectorMeasure.norm_integral_le_of_norm_le_const`,
`MeasureTheory.VectorMeasure.tendsto_integral_of_dominated_convergence`,
`Real.one_add_sq_mul_norm_fourier_le`, `Real.norm_fourier_le_integral_norm`; Tau Ceti
`BoundedVariationOn.integral_deriv_smul_eq_neg_integral_vectorMeasure`.

### 7.2 Bounds for the truncated Dirichlet integral

For real `x`, write `I(x) = ∫_0^x sin t/t dt`. Prove: `I` is odd and continuous; `|I(x)| ≤ I(π)`
for every real `x`; `|π/2 − I(x)| ≤ 2/x` for `x > 0`; and consequently
`|∫_a^b sin(Tv)/v dv| ≤ 2 I(π)` for all real `a ≤ b` and `T > 0`. The limit `I(x) → π/2` is Tau
Ceti's. Route: on `[kπ, (k+1)π]` the integrand has constant sign and its areas decrease, so the
local maxima `I((2k+1)π)` decrease and the minima `I(2kπ)` are positive (dlmf-ch6, §6.16, the first
maximum of `Si` at `π`); one integration by parts gives
`∫_x^R sin t/t dt = cos x/x − cos R/R − ∫_x^R cos t/t² dt`, of modulus at most `2/x`
(dlmf-ch6, 6.2.19 with 6.12.5–6.12.8 at `n = 0`: `0 < f(x) ≤ 1/x`, `0 < g(x) ≤ 1/x²`).

**Checks.**

- `I(π) ≈ 1.85194 > π/2 ≈ 1.5708`, so the plausible bound `|I(x)| ≤ π/2` is false at `x = π`.
- At `x = π`, `|π/2 − I(π)| ≈ 0.2811 ≤ 2/π ≈ 0.6366`; at `x = 2π`, `I(2π) ≈ 1.41815` and
  `|π/2 − I(2π)| ≈ 0.1526 ≤ 1/π`.
- The tail bound needs `x > 0`: at `x = −1`, `π/2 − I(−1) ≈ 2.517` exceeds `2/(−1) = −2`.

*Needs:* Tau Ceti `TauCeti.Contour.tendsto_integral_sin_div_atTop`; Mathlib interval integration.

### 7.3 Principal-value inversion on vertical lines

*Pointwise inversion, two-sided Laplace form.* Let `g : ℝ → ℂ`, `c ∈ ℝ`, with `h(u) = e^{−cu} g(u)`
integrable, and `G(c + iy) = ∫ g(u) e^{−(c+iy)u} du`. If `g` is of bounded variation on some
interval `[u₀ − δ, u₀ + δ]`, `δ > 0`, then
`(2π)⁻¹ ∫_{−T}^{T} G(c + iy) e^{(c+iy)u₀} dy → (g(u₀⁻) + g(u₀⁺))/2` as `T → ∞`
(montgomeryvaughan2007, Chapter 5, §5.1; titchmarsh1986, Chapter III, the truncated Perron lemma).
Route: the truncated integral equals `e^{cu₀} ∫ h(u₀ − v) D_T(v) dv`; split at `|v| = δ`; the tail
tends to `0` by the Riemann–Lebesgue lemma applied to `v ↦ h(u₀ − v) 1_{|v|>δ}/v`; on the window
write `h(u₀ ± v) = h(u₀^±) + (h(u₀ ± v) − h(u₀^±))` and use 7.2.

*Pointwise inversion, Mellin form.* Let `f : ℝ → ℂ`, `σ ∈ ℝ`, `MellinConvergent f σ`, `x₀ > 0`, and `f`
of bounded variation on a neighbourhood of `x₀`. Then
`(2π)⁻¹ ∫_{−T}^{T} x₀^{−(σ+iy)} mellin f (σ + iy) dy → (f(x₀⁻) + f(x₀⁺))/2`. It is the Laplace form
for `g(u) = f(e^{−u})`, `u₀ = −log x₀`; left and right exchange under `u = −log t`.

*Windowed error.* Let `h : ℝ → ℂ` be integrable and of bounded variation on `ℝ`, of total variation
`V`. There is an absolute constant `C` such that for all `u₀ ∈ ℝ`, `δ > 0` and `T > 0`:
`|∫ h(u₀ − v) D_T(v) dv − (h(u₀⁻) + h(u₀⁺))/2| ≤ C (V⁺_δ + V⁻_δ + V/(Tδ))`, where
`V⁺_δ = (eVariationOn h (Ioc u₀ (u₀ + δ))).toReal` and `V⁻_δ = (eVariationOn h (Ico (u₀ − δ) u₀)).toReal`.
Route: with the one-sided limits in place of `h`, the window contributes
`π⁻¹ I(Tδ)(h(u₀⁻) + h(u₀⁺))`, whose distance from the
means is at most `2(|h(u₀⁻)| + |h(u₀⁺)|)/(πTδ)` by 7.2, plus Stieltjes integrals of
`h(u₀ ± v) − h(u₀^±)` against `v ↦ I(Tv)`, bounded by `2 I(π) V^±_δ/π`; on the tail, integrate
`sin(Tv)` by parts against `h(u₀ − v)/v`, giving at most `(2 sup|h| + V)/(πTδ)` on each side, and
`sup|h| ≤ V` by 7.1.
Global bounded variation is required for the rate: integrability of `h` alone gives no rate in
`T` (see the Checks).

*The Perron instance.* For `f = 1_(0,1]` and `σ > 0`, `mellin f = 1/s`, the truncated integral at
`x₀ = 1/x` is `TauCeti.truncatedPerronKernel x σ T`; at `x = 1` it is `π⁻¹ arctan(T/σ) → 1/2`.

**Checks.**

- At the jump of `1_(0,1]` the limit is `1/2`, matching `TauCeti.truncatedPerronKernel_one`; a
  statement with limit `f(x₀)` would give `1` and fail.
- The tail rate fails for merely integrable `h`: for `h(u₀ − v) = sin(T₀v) 1_[δ,2δ](v)`, at `T = T₀`
  the tail integral is `(2π)⁻¹ ∫_δ^{2δ} (1 − cos 2T₀v)/v dv → (log 2)/(2π) ≈ 0.110` as `T₀ → ∞`,
  while `‖h‖₁/(T₀δ) ≤ 1/T₀ → 0`.
- For `h(u) = e^{−σu} 1_{u≥0}` (the Laplace form of `1_(0,1]` at the line `σ > 0`), `V = 2`,
  `V⁺_δ = 1 − e^{−σδ}`, `V⁻_δ = 0` at `u₀ = 0`; the true error `π⁻¹ arctan(σ/T)` is at most the
  bound `C(σδ + 2/(Tδ))` for every `δ`, consistent with optimizing at `δ = (σT)^{−1/2}`.

*Needs:* 7.1, 7.2; Mathlib `mellin_eq_fourier`, `MellinConvergent`, `Function.leftLim`,
`Function.rightLim`, the Riemann–Lebesgue lemma; Tau Ceti `TauCeti.truncatedPerronKernel_one` (for
the instance).

### Examples

- `𝓕(1_[0,1])` attains the bound of 7.1 at `ξ = 1/2`.
- The Mellin inverse of `1/s` truncated at height `T` at `x = 1` is `π⁻¹ arctan(T/σ)`, which tends
  to `1/2`.

### Dependencies

Mathlib Fourier analysis, bounded variation and vector-measure integrals, Mellin transform; Tau
Ceti one-dimensional bounded variation and the Dirichlet integral; ArithmeticDirichletSeries §6.3
for the Perron Check.

## Layer 8: contours and discs

### 8.1 Rectangles with poles and the U-shaped contour

Let `σ₁ < σ₂`, `t₁ < t₂`, `R = [σ₁, σ₂] ×ℂ [t₁, t₂]`, `U` open with `R ⊆ U`, `P` a finite subset of
the open rectangle `(σ₁, σ₂) ×ℂ (t₁, t₂)`, and `f` differentiable on `U ∖ P` and meromorphic at each
point of `P`. Then Mathlib's boundary expression of `Complex.integral_boundary_rect_eq_zero_of_differentiableOn`
at the corners `σ₁ + it₁`, `σ₂ + it₂`,
`∫_{σ₁}^{σ₂} f(x + it₁) dx − ∫_{σ₁}^{σ₂} f(x + it₂) dx + i ∫_{t₁}^{t₂} f(σ₂ + iy) dy − i ∫_{t₁}^{t₂} f(σ₁ + iy) dy`,
equals `2πi Σ_{p∈P} Res_p f`, with `TauCeti.Contour.residue` (kontorovichtao-pntplus lines 621–642,
Theorem 4.1.2 and Lemmas 4.1.2–4.1.4, for simple poles). Route: the counterclockwise boundary curve
of ZerosOfLFunctions §7.1 is piecewise `C¹`, closed, null-homologous in `U`, with winding number
`1` about each point of the open rectangle; apply `TauCeti.Contour.classicalResidueTheorem_nullHomologous`
and split the curve integral into the four edges.

*The U-shaped form.* If moreover `y ↦ f(σ₂ + iy)` is integrable on `ℝ` and `t₁ = −T`, `t₂ = T`,
then `∫_ℝ f(σ₂ + iy) dy` equals the sum of the two tails `∫_{|y|>T} f(σ₂ + iy) dy`, the left edge
`∫_{−T}^{T} f(σ₁ + iy) dy`, the horizontal term
`(∫_{σ₁}^{σ₂} f(x + iT) dx − ∫_{σ₁}^{σ₂} f(x − iT) dx)/i` (top edge minus bottom edge, divided by
`i`), and `2π Σ_{p∈P} Res_p f` (kontorovichtao-pntplus lines 596–613, Definitions 4.1.3–4.1.5 and
Lemma 4.1.1). This is the edge expression above divided by `i` and solved for the right edge.

**Checks.**

- `f = 1/s` on `[−1, 1] ×ℂ [−1, 1]`: the expression is `2πi`; the clockwise convention would give
  `−2πi`.
- `f = 1/(s − 2)` on the same rectangle, with `P = ∅` (the pole lies outside the rectangle; take
  `U` the disc of radius `3/2`): the expression is `0`, so a sum over all poles of `f` would be
  wrong.
- `f = 1/s²` on `[−1, 1] ×ℂ [−1, 1]`: a double pole with residue `0`, and the expression is `0`;
  a statement restricted to simple poles would not cover it.
- The sign of the horizontal term in the U-shaped form, tested on the finite-height identity behind
  it (right edge = left edge + horizontal term + `2π Σ_{p∈P} Res_p f`, which needs no integrability)
  at `f = 1/s`, `σ₁ = −1`, `σ₂ = 1`, `T = 1`: the right edge is `∫_{−1}^{1} dy/(1 + iy) = π/2`,
  the left edge `∫_{−1}^{1} dy/(−1 + iy) = −π/2`, the bottom edge `∫_{−1}^{1} dx/(x − i) = iπ/2`,
  the top edge `∫_{−1}^{1} dx/(x + i) = −iπ/2` and the residue sum `1`. The identity `π/2 = −π/2 + X + 2π` forces the horizontal term to be
  `X = −π = (−iπ/2 − iπ/2)/i`, top minus bottom over `i`; bottom minus top over `i`, the clockwise
  model, gives `+π` and fails.

*Needs:* ZerosOfLFunctions §7.1; Tau Ceti `TauCeti.Contour.classicalResidueTheorem_nullHomologous`,
`TauCeti.Contour.residue`; Mathlib `Complex.integral_boundary_rect_eq_zero_of_differentiableOn` (for
the edge bookkeeping); ContourIntegration Layers 2–4.

### 8.2 Carathéodory's inequality and the derivative form of Borel–Carathéodory

Let `f` be holomorphic on `|z − z₀| < R` with `Re f ≤ M` there, and write
`f(z) = Σ_n a_n (z − z₀)^n`. Prove Carathéodory's coefficient inequality `|a_n| R^n ≤ 2(M − Re a₀)` for
every `n ≥ 1`, and hence, for `k ≥ 1` and `|z − z₀| ≤ r < R`,
`|f^{(k)}(z)| ≤ 2 · k! · R · (M − Re f(z₀))/(R − r)^{k+1}` (kontorovichtao-pntplus lines 1751–1758,
Theorem 5.3.2, in the weaker form `16MR²/(R − r)³` at `k = 1`, `f(z₀) = 0`; montgomeryvaughan2007,
Chapter 6, §6.1). Route: for `ρ < R`, `−a_n ρ^n = π⁻¹ ∫_0^{2π} (M − Re f(z₀ + ρe^{iθ})) e^{−inθ} dθ`,
and the integrand `M − Re f ≥ 0` has mean `M − Re a₀`; then sum
`Σ_{n≥k} n!/(n−k)! |a_n| r^{n−k} ≤ 2(M − Re a₀) k! R/(R − r)^{k+1}`.

**Checks.**

- The extremal `f(z) = −2M(z − z₀)/(R − (z − z₀))` has `Re f < M` on the disc, `f(z₀) = 0`, and at
  `z = z₀ + r` attains the bound with equality for every `k`: `|f^{(k)}| = 2 k! M R/(R − r)^{k+1}`.
- At `k = 1`, `f(z₀) = 0`, `r = R/2` the bound is `8M/R`, below the source's `16MR²/(R − r)³ = 128M/R`.
- `k = 0` is excluded: `f ≡ i` has `M = 0 = Re f(z₀)`, so the formula would claim `|f| ≤ 0`.
- If `Re f` attains `M` at `z₀`, the bound is `0`, as it must be: `Re f` is then constant and so is
  `f`.

*Needs:* Mathlib power series of holomorphic functions on a disc, `circleIntegral`,
`Complex.borelCaratheodory` (the case `k = 0` is its value form).

### 8.3 Landau's local logarithmic-derivative lemma

Fix `0 < r₁ < r₂ < R`. There is `C = C(r₁/R, r₂/R)` such that: if `f` is holomorphic on a
neighbourhood of `|z − z₀| ≤ R`, `f(z₀) ≠ 0` and `|f(z)| ≤ e^M |f(z₀)|` on `|z − z₀| ≤ R` (so `M ≥ 0`),
then for every `z` with `|z − z₀| ≤ r₁` and `f(z) ≠ 0`,
`|f′(z)/f(z) − Σ_ρ m_ρ/(z − ρ)| ≤ C M/R`, the sum over the zeros `ρ` of `f` with `|ρ − z₀| ≤ r₂`,
counted with their orders `m_ρ` (kontorovichtao-pntplus lines 1971–1977, Theorem 5.3.7, with
explicit `C`; titchmarsh1986, Chapter III; montgomeryvaughan2007, Chapter 6, §6.1). Route: by
Jensen (ZerosOfLFunctions §4.3) the zeros in `|ρ − z₀| ≤ r₂` number `O(M)`; divide `f` by the Blaschke
factors of these zeros for the radius `R′ ∈ (r₂, R)`, take a holomorphic logarithm of the quotient
on the zero-free disc, bound its real part above by `M + O(M)`, and apply 8.2 with `k = 1`.

**Checks.**

- `f(z) = z − ρ` with `|ρ − z₀| ≤ r₂`, `ρ ≠ z₀`: both sides are `0`.
- `M = 0` forces `f` constant by the maximum principle; both sides are `0`.
- The zero sum is necessary: `f(z) = z − z₀ − ε` has `f′/f(z₀ + 2ε) = 1/ε` while
  `M = log((R + ε)/ε)`, so `CM/R ≪ 1/ε` as `ε → 0`.
- Scaling: replacing `f(z)` by `f(z₀ + λ(z − z₀))` multiplies `f′/f` and the zero sum by `λ` and
  divides `R` by `λ`, with `M` unchanged; the bound `CM/R` scales the same way.

*Needs:* 8.2; ZerosOfLFunctions §4.3; Mathlib holomorphic logarithms on a disc and
`AnalyticOnNhd.sum_divisor_le`.

### Examples

- For `f = ζ`, `z₀ = 2 + it`, `R = 3/2`, `|t| ≥ 3`: `M = O(log |t|)` by ZerosOfLFunctions §3.4 and
  `|ζ(2 + it)| ≥ ζ(4)/ζ(2)`, which is the input of 10.3.
- The rectangle `[1/2, 2] ×ℂ [−1, 1]` with `f = −ζ′(s)/ζ(s) · x^s/s` has the single pole `1` inside,
  with residue `x`.

### Dependencies

Mathlib complex analysis (Cauchy, power series, Borel–Carathéodory, Jensen); Tau Ceti residue
theorem; ZerosOfLFunctions §§4.3 and 7.1; ContourIntegration.

## Layer 9: Mellin smoothing

### 9.1 Mellin convolution

Define `mellinConv f g x = ∫_{(0,∞)} f(y) g(x/y) dy/y` for `f, g : ℝ → ℂ` and `x : ℝ`
(kontorovichtao-pntplus lines 893–898, Definition 4.3.1). API:

- For `x > 0`, `mellinConv f g x = mellinConv g f x`, with no integrability hypothesis: the
  substitution `y ↦ x/y` preserves `dy/y` on `(0, ∞)` and exchanges the two integrands, so both
  sides are integrals of the same function or both are the junk value `0` (lines 900–914,
  Lemma 4.3.2).
- If `(x, y) ↦ f(y) g(x/y) x^{s−1}/y` is integrable on `(0, ∞)²`, then
  `mellin (mellinConv f g) s = mellin f s · mellin g s` (lines 916–946, Theorem 4.3.1); it follows
  from Fubini and `mellin_comp_mul_left`.
- Linearity in each argument where the integrals converge, and `mellinConv f g x` depends on `f`
  and `g` only through their restrictions to `(0, ∞)` when `x > 0`.
- Support: if `f` vanishes off `[a, b]` and `g` off `[c, d]`, `0 < a, c`, then `mellinConv f g`
  vanishes on `(0, ∞)` off `[ac, bd]`.

**Checks.**

- `mellinConv 1_(0,1] 1_(0,1] x = log(1/x)` for `0 < x ≤ 1` and `0` for `x > 1`; its Mellin transform
  at `s` with `Re s > 0` is `1/s² = (1/s)(1/s)`. The additive convolution of the same indicators is
  the tent on `(0, 2)`, a different function.
- `x > 0` is needed for commutativity: with `f = 1_[0,1]` and `g = 1_[1,2]`,
  `mellinConv g f 0 = f(0) log 2 = log 2` while `mellinConv f g 0 = g(0) · (junk) = 0`.
- Support: `mellinConv 1_[1,2] 1_[1,2]` is supported in `[1, 4]` on `(0, ∞)`, with value `log 2` at
  `x = 2`, not in `[2, 4]` as an additive model would give.

*Needs:* Mathlib `mellin`, `mellin_comp_mul_left`, `MeasureTheory.integral_prod`, the measure
`dy/y` on `(0, ∞)` and its invariance under `y ↦ x/y`.

### 9.2 Mellin transforms of compactly supported bumps

Let `ν : ℝ → ℂ` be `C^k`, `k ≥ 1`, with support in `[a, b]`, `0 < a ≤ b`. Then: `mellin ν` is entire;
for every `σ₁ ≤ σ₂` there is `C` with `|mellin ν (s)| ≤ C (1 + |s|)^{−k}` on `σ₁ ≤ Re s ≤ σ₂`; and
`mellin ν 0 = ∫ ν(x) dx/x` (kontorovichtao-pntplus lines 947–962, Theorem 4.3.2, for `k = 1`).
Route: `mellin ν (s) = (−1)^k mellin (ν^{(k)}) (s + k)/(s(s + 1)⋯(s + k − 1))` by `k` integrations
by parts with no boundary terms, and continuity on the compact part of the strip.

**Checks.**

- For the `C¹` bump `ν(x) = (x − 1)²(2 − x)²` on `[1, 2]`, `0` elsewhere, `mellin ν 0 = 4 log 2 − 11/4 ≈ 0.0226`
  is the `dx/x`-mass, while `∫ ν dx = 1/30 ≈ 0.0333`.
- The support must stay away from `0`: `ν(x) = max(0, 1 − x)²` is `C¹` on `(0, ∞)` with support
  `[0, 1]`, and `mellin ν s = 2/(s(s + 1)(s + 2))` has poles at `0, −1, −2`, so it is not entire.
- The sign of the integration by parts at `k = 1`: `mellin ν 1 = −mellin ν′ 2`; for the bump of the
  first Check both sides are `1/30`, and the opposite sign would give `−1/30`.

*Needs:* Mathlib `mellin`, `mellin_differentiableAt_of_isBigO_rpow`, integration by parts on compact
intervals.

### 9.3 Delta spikes and the approximate identity for `dx/x`

Define `deltaSpike ν ε x = ε⁻¹ ν(x^{1/ε})` for `x > 0`, and `0` for `x ≤ 0` (kontorovichtao-pntplus
lines 964–966, Definition 4.3.2). Under the standing bump hypotheses on `ν` and `0 < ε`, prove:

- `deltaSpike ν ε` is supported in `[2^{−ε}, 2^{ε}]`, is `≥ 0` and has `dx/x`-mass `1`
  (lines 968–974, Lemma 4.3.3);
- `mellin (deltaSpike ν ε) s = mellin ν (εs)` for every `s` (lines 976–978, Theorem 4.3.3), by
  `mellin_comp_rpow`; hence `mellin (deltaSpike ν ε) 1 = mellin ν ε` and
  `|mellin ν ε − 1| ≤ C ε` for `0 < ε ≤ 1` (lines 980–1005, Lemma 4.3.4);
- for `f : ℝ → ℂ` locally integrable on `(0, ∞)` and continuous at `x > 0`,
  `mellinConv (deltaSpike ν ε) f x → f(x)` as `ε → 0⁺`, and the convergence is uniform on compact
  subsets of `(0, ∞)` when `f` is continuous there. Route:
  `|(ν_ε ⋆ f)(x) − f(x)| ≤ sup_{y∈[2^{−ε},2^{ε}]} |f(x/y) − f(x)|`.

**Checks.**

- At `ε = 1` the spike is `ν` itself on `(0, ∞)`; without the factor `ε⁻¹` the mass would be `ε`.
- For `ν` supported in `[1/2, 2]`, the spike at `ε = 1/2` is supported in `[2^{−1/2}, 2^{1/2}]`,
  not in `[1/4, 4]` (the support of `x ↦ ν(x²)`-type rescalings in the wrong direction).
- `deltaSpike ν ε 0 = 0` and `deltaSpike ν ε (−1) = 0`, whereas `ν((−1)^{1/ε})` uses Mathlib's
  junk value of a real power of a negative number.

*Needs:* 9.1; Mathlib `mellin_comp_rpow`, `MellinConvergent.comp_rpow`.

### 9.4 Smoothed cutoffs

Define `smoothCutoff ν ε = mellinConv 1_(0,1] (deltaSpike ν ε)` on `x > 0` and `0` on `x ≤ 0`
(kontorovichtao-pntplus lines 1015–1017, Definition 4.3.3). For `x > 0` it equals
`∫_x^∞ ν_ε(z) dz/z`. Under the standing bump hypotheses and `0 < ε ≤ 1`, prove:

- `0 ≤ smoothCutoff ν ε x ≤ 1` (lines 1069–1104, Lemmas 4.3.7–4.3.8);
- `smoothCutoff ν ε x = 1` for `0 < x ≤ 2^{−ε}` and `= 0` for `x ≥ 2^{ε}` (lines 1025–1068, Lemmas
  4.3.5–4.3.6, whose constants `1 − cε`, `1 + cε` are these thresholds weakened);
- `smoothCutoff ν ε` is continuous on `(0, ∞)`, and `MellinConvergent (smoothCutoff ν ε) s` for
  `Re s > 0`;
- for `Re s > 0`, `mellin (smoothCutoff ν ε) s = mellin ν (εs)/s` (lines 1107–1127, Lemma 4.3.9), by
  9.1, 9.3 and `hasMellin_one_Ioc`;
- if `ν` is `C^k`, `k ≥ 1`, then for `0 < σ₁ ≤ σ₂` there is `C_k` with
  `|mellin (smoothCutoff ν ε) s| ≤ C_k/(|s| (1 + ε|s|)^k)` for `σ₁ ≤ Re s ≤ σ₂` and `0 < ε ≤ 1`
  (lines 1128–1131, Lemma 4.3.10, the case `k = 1` in the form `O(1/(ε|s|²))`); in particular the
  transform is integrable on every such vertical line;
- `|mellin (smoothCutoff ν ε) 1 − 1| ≤ C ε` (lines 1132–1134, Lemma 4.3.11).

**Checks.**

- If `ν(1/x) = ν(x)` for all `x > 0`, then `smoothCutoff ν ε 1 = 1/2`, the mass of `ν_ε` on `[1, ∞)`.
- `smoothCutoff ν ε 0 = 0`, so a sum `Σ_{n≥0} a(n) smoothCutoff ν ε (n/X)` has no `n = 0` term.
- As `ε → 0⁺` the transform `mellin ν (εs)/s` tends to `1/s`, the transform of `1_(0,1]`; with the
  opposite normalization `mellin ν (s/ε)/s` it would tend to `0` on `Re s > 0`.
- The bound is uniform in `ε`: with `k = 1`, `s = 1 + iT`, it is `≍ 1/(T(1 + εT))`, which is
  `≍ 1/T` for `T ≤ 1/ε` and `≍ 1/(εT²)` beyond.

*Needs:* 9.1–9.3, 9.2 for the decay; Mathlib `hasMellin_one_Ioc`.

### Examples

- `smoothCutoff ν ε` with `ν` a symmetric `C^∞` bump: a `C^∞` function equal to `1` on `(0, 2^{−ε}]`,
  to `0` on `[2^{ε}, ∞)`, with value `1/2` at `1`.

### Dependencies

Mathlib Mellin transform and Fubini; Layer 7 is not needed; 9.2 feeds 9.4.

## Layer 10: from a zero-free region to an error term

### 10.1 Smoothed summatory functions

Let `a : ℕ → ℂ` with `LSeriesSummable a σ` for every `σ > 1`, `ν` a `C^k` bump with `k ≥ 1`
satisfying the standing hypotheses, `0 < ε ≤ 1`, `X > 0` and `σ > 1`. Then
`Σ_{n≥1} a(n) smoothCutoff ν ε (n/X) = mellinInv σ (fun s ↦ LSeries a s · mellin (smoothCutoff ν ε) s) X⁻¹`,
that is, `(2πi)⁻¹ ∫_{(σ)} F(s) 𝓜1̃_ε(s) X^s ds` (kontorovichtao-pntplus lines 1463–1498,
Definition 4.5.2 and Theorem 4.5.2). Route: `mellinInv_mellin_eq` at each `x = n/X` (9.4 gives its
three hypotheses), then exchange sum and integral by absolute convergence on `Re s = σ`.

*Comparison with the sharp sum.* If moreover `|a(n)| ≤ B log(n + 1)` for all `n ≥ 1`, there is an
absolute `C` such that for `X ≥ 2` and `0 < ε ≤ 1`,
`|Σ_{n≤X} a(n) − Σ_{n≥1} a(n) smoothCutoff ν ε (n/X)| ≤ C B (εX + 1) log X` (lines 1502–1506,
Theorem 4.5.3, stated there as `O(εX log X)` for `ε ≥ 1/X`). Route: the two weights agree off
`(2^{−ε}X, 2^{ε}X)`, which contains at most `2εX + 1` integers, and `|1 − 1̃_ε| ≤ 1`.

With `a = Λ` this is the smoothed Chebyshev function and its comparison with `Chebyshev.psi`.

**Checks.**

- `a = δ₁` (`a(1) = 1`, else `0`): both sides of the identity equal `smoothCutoff ν ε (1/X)`, by
  `mellinInv_mellin_eq` alone.
- The `+1` is necessary: for `a ≡ 1` (so `B = 1/log 2`), `X = 2` and symmetric `ν`, the difference
  is `1 − 1̃_ε(1) = 1/2` for every `ε ≤ log₂(3/2)`, while `CBεX log X = 2Cε → 0`; the corrected
  bound is `≥ C`.
- `k ≥ 1` is needed for the line integral to converge absolutely: for a merely continuous `ν` the
  transform is `O(1/|s|)` only and `y ↦ 𝓜1̃_ε(σ + iy)` need not be integrable.

*Needs:* 9.4; Mathlib `mellinInv_mellin_eq`, `LSeries`, `LSeriesSummable`, `Chebyshev.psi`.

### 10.2 The transfer theorem in Ingham's form

Define `inghamExponent η x = inf_{t≥3} (η(t) log x + log t)`. API, for `η` continuous on `[3, ∞)` with
`0 < η ≤ 1/2` there and `x ≥ 1`:

- the infimum is attained, since the function of `t` is continuous and tends to `∞`;
- `inghamExponent η` is nondecreasing in `x`, and `log 3 ≤ inghamExponent η x ≤ η(3) log x + log 3`;
- if `η(t) ≥ a₀ (log t)^{−A}`, then `inghamExponent η x ≥ c₁ (log x)^{1/(1+A)}` for `x ≥ 3`, with `c₁`
  depending on `a₀` and `A`;
- if `η ≤ η′` on `[3, ∞)` then `inghamExponent η ≤ inghamExponent η′`.

Hypotheses of the transfer theorem:

- `η` is continuous and nonincreasing on `[3, ∞)`, `0 < η(t) ≤ 1/2` there, and
  `η(t) ≥ a₀ (log t)^{−A}` for some `a₀, A > 0`;
- `a : ℕ → ℂ` with `|a(n)| ≤ B log(n + 1)` for `n ≥ 1`;
- `r ∈ ℂ`, `U ⊆ ℂ` open with `R_η ⊆ U`, and `G` holomorphic on `U` with
  `LSeries a s = G(s) + r/(s − 1)` for `Re s > 1`;
- `|G(s)| ≤ C₀ log(|Im s| + 3)^{B′}` on `R_η`.

Conclusion: there are `c > 0` and `C′` with `|Σ_{n≤x} a(n) − r x| ≤ C′ x exp(−c · inghamExponent η x)`
for every `x ≥ 3` (platttrudgian2020 lines 21–32, Ingham's theorem in the zero-free-region form for
`ψ`; kontorovichtao-pntplus lines 1507–1516 and 1673–1683, Definition 4.5.3 and Theorem 4.6.1, the
case `η = A₀/log^{n₁} t`; montgomeryvaughan2007, Chapter 6; tenenbaum2015, Chapter II.4;
iwanieckowalski2004, Chapter 5).

Route: by 10.1 with `σ₀ = 1 + 1/log x`, write the smoothed sum as an integral on `Re s = σ₀`; choose
`T ≥ 3` with `log T = η(T + 3) log x` (the function `t ↦ η(t + 3) log x − log t` is continuous and
strictly decreasing on `[3, ∞)` and tends to `−∞`, and it is positive at `3` once
`η(6) log x > log 3`; smaller `x` are absorbed in `C′`). Taking `t = T + 3 ≤ 2T` in the infimum gives
`inghamExponent η x ≤ log T + log(2T)`, so `η(T + 3) log x = log T ≥ (inghamExponent η x − log 2)/2`,
and the left edge saves `x^{−η(T + 3)} = 1/T`; apply 8.1
on `[1 − η(T + 3), σ₀] ×ℂ [−T, T] ⊆ R_η`, which has the single pole `1` with residue
`r · 𝓜1̃_ε(1) · x`; bound the tails by 9.4 and `|F(σ₀ + it)| ≤ B Σ log(n+1) n^{−σ₀} = O(B log² x)`,
the horizontal edges and the left edge by the hypothesis on `G` and `|r/(s − 1)| ≤ |r|/η(T + 3)`;
take `ε = T^{−1/2}` and absorb the factors `log^{O(1)} x` with
`inghamExponent η x ≥ c₁ (log x)^{1/(1+A)}`, which the lower bound on `η` gives; finish with the
comparison of 10.1. The constant `c` produced is an absolute fraction; Ingham's `1/2 − ε` and
Pintz's `1 − ε` (platttrudgian2020 lines 54–56) need zero-density input and are not claimed.

**Checks.**

- `η(t) = c₀/log t`: `inghamExponent η x = 2√(c₀ log x)` once `√(c₀ log x) ≥ log 3`; at `c₀ = 1`,
  `x = e^{100}` the infimum is `20`, attained at `log t = 10`. The conclusion is the classical
  `x exp(−c√log x)`, consistent with ZerosOfLFunctions §8.5 at `K = ℚ` through 10.3 at `K = ℚ`
  (AnalyticNumberTheoryPartI §0.33a).
- `η(t) = A₀/log^{n₁} t` gives `inghamExponent η x ≍ (log x)^{1/(1+n₁)}`; `n₁ = 9`
  is kontorovichtao-pntplus line 1684 (Theorem 4.6.2, error `exp(−c (log x)^{1/10})`).
- A constant width `η ≡ η₀` gives `inghamExponent η x = η₀ log x + log 3` and the power saving
  `x^{1−cη₀}`.
- A plausible wrong exponent, `η(x) log x` (the width evaluated at `x`), is the constant `c₀` for
  `η = c₀/log t` and gives no decay; the infimum over `t` is essential.
- `a = μ`, `r = 0`, `G = 1/ζ`: the conclusion is `M(x) = O(x exp(−c√log x))`, the zero-residue case.
- `a ≡ 1`, `r = 1`, `G = ζ − 1/(s − 1)`: the conclusion `⌊x⌋ − x = O(x exp(−cω))` holds trivially.
- The height in the route is chosen by `η(T + 3)`, not by `η(T)`. Take `η = 1/2` on `[3, T₀]`,
  linear on `[T₀, T₀ + 3]` down to `1/log²(T₀ + 3)`, and `1/log² t` beyond, which meets every
  hypothesis with `a₀ = 1/2`, `A = 2` for `T₀ ≥ 6`, and `log x = 2 log T₀`. Then
  `inghamExponent η x ≥ log T₀`; the choice `log T = η(T) log x` gives `T = T₀` and a left-edge
  saving `x^{−η(T₀ + 3)} = exp(−2 log T₀/log²(T₀ + 3)) → 1`, no power of `T₀`, while the choice by
  `η(T + 3)` saves `1/T` with `log T ≥ log(T₀ − 3)`.

*Needs:* 8.1, 9.4, 10.1; Mathlib `LSeries`, `riemannZeta`; ZerosOfLFunctions §8.5 for the Check.

### 10.3 The classical logarithmic-derivative bound

Let `K` be a number field, `𝔪` a modulus of `K`, `χ : RayClassCharacter 𝔪` of finite order, and
`L = TauCeti.LFunctions.heckeLFunctionC χ` (for the trivial character of modulus `1` this is the
continued Dedekind zeta function; at `K = ℚ`, `riemannZeta`). Put `δ_χ = 1` if `χ = 1` and `0`
otherwise. There are `c > 0` and `C`, depending on `K` and `χ`, such that, with
`R_c = {s : 1 − c/log(|Im s| + 3) ≤ Re s}`: `L(s) ≠ 0` for `s ∈ R_c ∖ {1}`, and there is `G`
holomorphic on an open set containing `R_c` with `−L′(s)/L(s) = G(s) + δ_χ/(s − 1)` for
`s ∈ R_c ∖ {1}` and `|G(s)| ≤ C log(|Im s| + 3)` on `R_c` (montgomeryvaughan2007, Chapter 6, §6.1; titchmarsh1986,
Chapter III; kontorovichtao-pntplus lines 1718–1723, Theorem 5.2.3, the weaker `log² t` bound).

Route: reduce to the primitive character (Tau Ceti `heckeLFunctionC_eq_primitive`; the deleted
Euler factors have no zeros and a bounded logarithmic derivative on `Re s ≥ 1/2`). Shrink the width
of ZerosOfLFunctions §§6.2–6.4 so that the region misses the at most one exceptional real zero,
a fixed point `β < 1` for fixed `χ`, and so that `c ≤ (log 3)/2`. For `|t| ≤ t₀` use compactness and
the simple pole. For `|t| ≥ t₀`, apply 8.3 at `z₀ = 2 + it`, `R = 3/2`, `r₁ = 11/10`, `r₂ = 6/5`:
`|L(2 + it)|` is bounded below by the Euler product (LFunctions Layer 5) and `|L| ≤ C(|t| + 3)^B` on
the disc (ZerosOfLFunctions §3.4), so `M = O(log |t|)`. Compare `s ∈ R_{c/2}` with
`s₁ = 1 + 1/log |t| + it`: each zero `ρ` in the disc has `Re ρ ≤ 1 − c/log |t|`, so
`|1/(s − ρ) − 1/(s₁ − ρ)| ≪ Re 1/(s₁ − ρ)`, and `Σ_ρ Re 1/(s₁ − ρ) = Re L′/L(s₁) + O(log |t|)`
is `O(log |t|)` because `|L′/L(σ + it)| ≤ [K:ℚ] |ζ′/ζ(σ)|` for `σ > 1`.

**Checks.**

- `K = ℚ`, `χ = 1` is AnalyticNumberTheoryPartI §0.33a: there `G = −ζ′/ζ − 1/(s − 1)`, extended
  across `1`, and with `c = β` (Part I's width) every `s ∈ R_c` has
  `Re s ≥ 1 − β/log(|Im s| + 3) > 1 − β/log(|Im s| + 2)`, inside the open half-plane right of Part
  I's curve, where `ζ` has no zero and `|G(s)| ≤ C log(|Im s| + 2) ≤ C log(|Im s| + 3)`; the residue
  term is `δ_χ = 1`. Part I's strip bounds of §0.33 alone, multiplied as `ζ′ · (1/ζ)`, give only
  `log³`, so the single logarithm here agrees with §0.33a and does not follow from §0.33.
- `δ_χ` is the residue of `−L′/L` at `1`: `ζ` has residue `1`, `ζ′/ζ` residue `−1`, so `−ζ′/ζ` has
  residue `+1`; a definition with `δ_χ` the residue of `L` itself would put the class number formula
  in place of `1` for `K ≠ ℚ`.
- An imprimitive presentation of the trivial character modulo `2` has
  `L(s) = (1 − 2^{−s}) ζ(s)`, with zeros on `Re s = 0` only, outside `R_c`; its `G` differs from
  that of `ζ` by `(log 2) 2^{−s}/(1 − 2^{−s})`, bounded on `Re s ≥ 1/2`.
- With 10.2 at `η(t) = c/log t` and `a(n) = Σ_{N𝔞 = n} Λ_K(𝔞) χ(𝔞)` (`|a(n)| ≤ [K:ℚ] log n`), this
  gives ZerosOfLFunctions §8.5 and §8.6 at fixed `K` and `χ`.

*Needs:* 8.3; ZerosOfLFunctions §§3.4, 6.2–6.5; LFunctions Layers 3, 5 and 7; Tau Ceti
`TauCeti.LFunctions.heckeLFunctionC`, `TauCeti.LFunctions.heckeLFunctionC_eq_primitive`;
AnalyticNumberTheoryPartI §0.33a for the Check.

### Examples

- 10.2 with 10.3 at `K = ℚ`, `χ = 1` (AnalyticNumberTheoryPartI §0.33a), `a = Λ`, `r = 1`:
  `ψ(x) = x + O(x exp(−c√log x))`.
- 10.2 with `a` the coefficients of `−L′/L(s, χ)` for a nontrivial Dirichlet character: `r = 0`.

### Dependencies

Layers 8 and 9; ZerosOfLFunctions §§3.4, 4.3, 6.2–6.5, 8.5; LFunctions Layers 3, 5, 7; Tau Ceti Hecke
`L`-functions; Mathlib Mellin inversion; AnalyticNumberTheoryPartI §0.33a for a Check.

## Layer 11: Dirichlet series of the classical arithmetic functions

### 11.1 Completely multiplicative functions

For `R` a monoid with zero, define `IsCompletelyMultiplicative f` for `f : ArithmeticFunction R` as
`f 1 = 1` and `f (m * n) = f m * f n` for all `m, n` (kontorovichtao-pntplus lines 3590–3604,
Definition 9.1.8, Theorems 9.1.66–9.1.67; apostol1976, Chapter 2). API:

- It implies `ArithmeticFunction.IsMultiplicative`.
- It is equivalent to `f` being the coercion of an `ℕ →*₀ R`, which is then unique: an equivalence
  between completely multiplicative arithmetic functions and `ℕ →*₀ R` commuting with evaluation.
- It is closed under pointwise product (`ArithmeticFunction.pmul`) for commutative `R`, and holds for
  `ArithmeticFunction.liouville`, for the arithmetic function of a Dirichlet character, and for
  `n ↦ n^ν` (`ν ∈ ℂ`, value `0` at `0`).
- For `R` a commutative semiring, `f · (g ⋆ h) = (f · g) ⋆ (f · h)`; for `R` a commutative ring, the
  Dirichlet inverse of `f` is `μ · f`.
- For `F` a complete normed field and `Σ ‖f(n)‖ < ∞`, `∏_p (1 − f(p))⁻¹ = Σ f(n)`, obtained from
  `EulerProduct.eulerProduct_completely_multiplicative_tprod` through the equivalence; for
  `F = ℂ` and `LSeriesSummable f s` this is the Euler product of `LSeries f s`.

**Checks.**

- `liouville`: `λ(4) = 1 = λ(2)²` and `λ(12) = −1 = λ(4) λ(3)`.
- `moebius` is multiplicative but not completely multiplicative: `μ(4) = 0 ≠ 1 = μ(2)²`; so the
  coprime-only condition, Mathlib's `IsMultiplicative`, is the wrong model.
- Dropping `f 1 = 1` admits the zero function, which is no `ℕ →*₀ R` for nontrivial `R`.
- The inverse formula at `f = λ`: `μλ = μ²`, and `Σ_{d|4} λ(d) μ²(4/d) = 0 − 1 + 1 = 0`.
- The indicator of the positive integers all of whose prime factors are `≡ 1 (mod 4)` is completely
  multiplicative (`f(1) = 1`, `f(5 · 13) = 1 = f(5) f(13)`, `f(5 · 3) = 0 = f(5) f(3)`) and vanishes
  at `2` and at every prime `≡ 3 (mod 4)`; a predicate requiring a finite set of zero primes, as the
  ideal weights of ArithmeticDirichletSeries §0.2 do, would exclude it.

*Needs:* Mathlib `ArithmeticFunction`, `ArithmeticFunction.IsMultiplicative`, `MonoidWithZeroHom`,
`ArithmeticFunction.liouville_apply_mul`, `EulerProduct.eulerProduct_completely_multiplicative_tprod`.

### 11.2 The divisor functions `σ_ν` and `d_z`

*`σ_ν`.* Define `sigmaC ν : ArithmeticFunction ℂ` by `sigmaC ν n = Σ_{d|n} d^ν`
(kontorovichtao-pntplus lines 3215–3297, Definitions 9.1.4–9.1.5, Theorems 9.1.16–9.1.29). API:

- `sigmaC (k : ℂ) n = (ArithmeticFunction.sigma k n : ℂ)` for `k : ℕ`;
- `sigmaC ν = ζ ⋆ p_ν` with `p_ν(n) = n^ν`; `sigmaC ν` is multiplicative, with
  `sigmaC ν (p^a) = Σ_{j≤a} p^{jν}`; `sigmaC ν n = n^ν sigmaC (−ν) n`;
- `LSeries (sigmaC ν) s = ζ(s) ζ(s − ν)` for `Re s > max(1, 1 + Re ν)` (lines 3316–3323, Theorem
  9.1.32);
- `LSeries.abscissaOfAbsConv (sigmaC ν) = max(1, 1 + Re ν)`. Route: the upper bound from
  `|σ_ν| ≤ σ_{Re ν}` and the product formula at real `s`; divergence at the abscissa from the
  primes, `|1 + p^ν| ≥ p^{Re ν} − 1` if `Re ν > 0`, `≥ 1 − 2^{Re ν}` if `Re ν < 0`, and, if
  `Re ν = 0`, `ν = it ≠ 0`, `|1 + p^{it}| ≥ 1 + cos(t log p)` with `Σ_p cos(t log p) p^{−σ}` bounded
  as `σ → 1⁺` because `ζ(1 + it) ≠ 0`.

*`d_z`.* Define `generalizedDivisor z : ArithmeticFunction ℂ` for `z ∈ ℂ` as the multiplicative
function with `generalizedDivisor z (p^a) = Ring.multichoose z a` (kontorovichtao-pntplus lines
3151–3212, Definition 9.1.3 and Theorems 9.1.12–9.1.15, for `z ∈ ℕ`; iwanieckowalski2004, (1.25);
tenenbaum2015, Chapter II.5). API:

- multiplicativity; `generalizedDivisor 0 = 1`, `generalizedDivisor 1 = ζ`,
  `generalizedDivisor (−1) = μ`, and `generalizedDivisor (k : ℂ) = ↑(ζ ^ k)` for `k : ℕ`, the ordered
  `k`-fold factorization count;
- `generalizedDivisor z ⋆ generalizedDivisor w = generalizedDivisor (z + w)` (Vandermonde for
  `Ring.multichoose`);
- `|generalizedDivisor z n| ≤ generalizedDivisor |z| n ≤ ↑(ζ ^ ⌈|z|⌉) n`;
- for `Re s > 1`, `LSeries (generalizedDivisor z) s = exp(z · LSeries (Λ/log) s)`, the Euler-product
  power `ζ(s)^z`; at `z = k : ℕ` it is `ζ(s)^k`;
- `LSeries.abscissaOfAbsConv (generalizedDivisor z) = 1` for `z ≠ 0`, and `= ⊥` for `z = 0`.

**Checks.**

- `sigmaC 1 6 = 12 = ArithmeticFunction.sigma 1 6`, `sigmaC (−1) 6 = 2 = 12/6`, and
  `sigmaC (1/2) 4 = 3 + √2`.
- `abscissaOfAbsConv (sigmaC 2) = 3` and `abscissaOfAbsConv (sigmaC (−2)) = 1`: the formula
  `1 + Re ν` alone would give `−1` for `ν = −2`, but `σ_{−2}(p) ≥ 1`.
- `generalizedDivisor (1/2) (p²) = 3/8`, and `d_{1/2} ⋆ d_{1/2}` at `p²` is `3/8 + 1/4 + 3/8 = 1 = ζ(p²)`.
- `generalizedDivisor 2 (p^a) = a + 1 = τ(p^a)` and `generalizedDivisor 3 4 = 6` (ordered
  factorizations; the unordered count is `2`), in agreement with AnalyticNumberTheoryPartI §3.3's
  `d_3`.
- The principal power `riemannZeta s ^ (1/2 : ℂ)` is not a correct model of
  `LSeries (generalizedDivisor (1/2)) s`: where `Im LSeries (Λ/log) s ∉ (−π, π]` the two square roots
  of `ζ(s)` differ by a sign; the definition through the Euler-product logarithm is required.
- At `z = 0` the series is `1` and its abscissa is `⊥`, so the hypothesis `z ≠ 0` of the abscissa
  statement is needed.

*Needs:* 11.1; Mathlib `ArithmeticFunction.sigma`, `ArithmeticFunction.zeta`, `Ring.multichoose`,
`LSeries_convolution'`, `ArithmeticFunction.LSeries_zeta_eq_riemannZeta`, `riemannZeta_eq_exp_LSeries`,
`riemannZeta_ne_zero_of_one_le_re`, `LSeries.abscissaOfAbsConv`; AnalyticNumberTheoryPartI §3.3 for
the Check.

### 11.3 Ramanujan's four-shift identity

Let `α, β ∈ ℂ` and `Re s > max(1, 1 + Re α, 1 + Re β, 1 + Re(α + β))`. Then
`Σ_n σ_α(n) σ_β(n) n^{−s}` converges absolutely and equals
`ζ(s) ζ(s − α) ζ(s − β) ζ(s − α − β)/ζ(2s − α − β)`, with `ζ(2s − α − β) ≠ 0` because
`Re(2s − α − β) > 2` (kontorovichtao-pntplus lines 3324–3329, Theorem 9.1.33; iwanieckowalski2004,
(1.28); titchmarsh1986, Chapter I). Route: both sides are Euler products on the half-plane; compare
the local factors, which are rational functions of `X = p^{−s}`, `p^α`, `p^β`. Corollary for
`Re s > 1`, by the same local comparison: `Σ τ(n²) n^{−s}` converges absolutely and equals
`ζ(s)³/ζ(2s)` (lines 3353–3363 and 3489–3494, Theorems 9.1.36 and 9.1.50).

**Checks.**

- At `α = β = 0` the identity is AnalyticNumberTheoryPartI §3.24a, `Σ τ(n)² n^{−s} = ζ(s)⁴/ζ(2s)`
  on `Re s > 1` (kontorovichtao-pntplus line 3336, Theorem 9.1.34), whose half-plane is the one
  here at `α = β = 0`. The local factor `(1 − X)^{−4}(1 − X²) = (1 + X)/(1 − X)³` has coefficients
  `1, 4, 9, 16, 25 = (k + 1)²`, Part I's prime-power statement; the `p²`-coefficient is
  `10 − 1 = 9 = τ(p²)²`, and without the factor `ζ(2s)` it would be `10`.
- `(1 − X)^{−3}(1 − X²) = 1 + 3X + 5X² + ⋯` gives `τ(p²) = 3` and `τ(p⁴) = 5`.
- The half-plane is needed: at `α = 2`, `β = 0`, real `s = 3` lies on the boundary
  `1 + Re α = 3`, and `Σ σ₂(n) τ(n) n^{−3} ≥ Σ_p 2(p² + 1)/p³ = ∞`.

*Needs:* 11.2; Mathlib Euler products (`EulerProduct.eulerProduct_tprod` via
`ArithmeticFunction.IsMultiplicative`), `riemannZeta_ne_zero_of_one_le_re`;
AnalyticNumberTheoryPartI §3.24a for the Check.

### 11.4 The series of `2^ω`, `μ²`, `λ` and `φ`

For `Re s > 1`: `Σ 2^{ω(n)} n^{−s} = ζ(s)²/ζ(2s)`, `Σ μ(n)² n^{−s} = ζ(s)/ζ(2s)` and
`Σ λ(n) n^{−s} = ζ(2s)/ζ(s)`; for `Re s > 2`: `Σ φ(n) n^{−s} = ζ(s − 1)/ζ(s)`
(kontorovichtao-pntplus lines 3454–3545 and 3605–3640, Theorems 9.1.49, 9.1.57, 9.1.68 and 9.1.70;
iwanieckowalski2004, (1.31)–(1.33) and (1.35); apostol1976, Chapter 11). The abscissas of absolute
convergence are `1, 1, 1, 2`. The coefficient functions are Mathlib's `ArithmeticFunction.cardDistinctFactors`
(in `n ↦ 2^{ω(n)}`), `ArithmeticFunction.moebius`, `ArithmeticFunction.liouville` and `Nat.totient`,
cast to `ℂ`; no new carrier is introduced for `2^ω`.

**Checks.**

- Local factors: `(1 − X)^{−2}(1 − X²) = 1 + 2X + 2X² + ⋯` (`2^{ω(p^a)} = 2`), `(1 − X)^{−1}(1 − X²) = 1 + X`,
  `(1 − X)/(1 − X²) = 1 − X + X² − ⋯` (`λ(p^a) = (−1)^a`), `(1 − X)/(1 − pX) = 1 + (p − 1)X + (p² − p)X² + ⋯`.
- The abscissa of `φ` is `2`, not `1`: `Σ φ(n) n^{−2} ≥ Σ_p (p − 1)/p² = ∞` (the blueprint records that
  a hypothesis `Re s > 1` is incorrect, kontorovichtao-pntplus line 3631).
- `μ²(n) = Σ_{d²|n} μ(d)` at `n = 12`: `μ(1) + μ(2) = 0 = μ²(12)`.

*Needs:* 11.1, 11.2; Mathlib `ArithmeticFunction.cardDistinctFactors`, `ArithmeticFunction.moebius`,
`ArithmeticFunction.liouville`, `Nat.totient`, Euler products, `LSeries.abscissaOfAbsConv`.

### Examples

- `L(d_{1/2}, s)² = ζ(s)` on `Re s > 1`, from the convolution law and the Euler-product logarithm.
- At `s = 3`, `ν = 1`: `Σ σ(n) n^{−3} = ζ(3) ζ(2) ≈ 1.97730`.

### Dependencies

Mathlib arithmetic functions, `LSeries`, Euler products, `Ring.multichoose`; AnalyticNumberTheoryPartI
§§3.3 and 3.24a for Checks.

## Layer 12: Cesàro summability

### 12.1 The Hardy–Landau Tauberian theorem

Let `(a_n)` be real, `S_N = Σ_{n<N} a_n`, and suppose the Cesàro means `N⁻¹ Σ_{i<N} S_i` converge to
`S`. If `n a_n ≥ −K` for all `n` and some `K`, then `S_N → S`. In a real Banach space the same
holds under `n ‖a_n‖ ≤ K` (estradavindas2012littlewood lines 32–35, the stronger one-sided theorem
of Hardy and Littlewood for Abel summability, which Cesàro summability implies; hardy1949,
Tauberian theorems for Cesàro means). The converse, convergence implies Cesàro convergence, is
Mathlib's `Filter.Tendsto.cesaro`. Route (Landau's argument): for `H > N`,
`(H − N)⁻¹ Σ_{N≤k<H} S_k = σ_H + N(σ_H − σ_N)/(H − N)` in terms of the Cesàro means `σ`, while
`S_k ≥ S_N − K(k − N)/N` for `k > N`; with `H = ⌈N(1 + δ)⌉` this gives `limsup S_N ≤ S + Kδ`, and the
symmetric choice `H < N` gives `liminf S_N ≥ S − Kδ`; let `δ → 0`. The two-sided form uses norms in
the same estimate.

**Checks.**

- `a_n = (−1)^n`: the means tend to `1/2` but `S_N` alternates `1, 0`; here `n a_n` is unbounded
  below, so the hypothesis excludes it.
- `a_n = 1` for all `n` satisfies `n a_n ≥ 0` but the means diverge, so the hypothesis of Cesàro
  convergence is not implied by the one-sided bound.
- The condition is on `n a_n`, not on `a_n`: `a_n = (−1)^n/√n` has `a_n → 0` and a convergent
  series, yet `n a_n` is unbounded below, so it lies outside the theorem; the theorem is a
  sufficient condition, not a characterization of convergent series.

*Needs:* Mathlib `Filter.Tendsto.cesaro`, `Filter.Tendsto.cesaro_smul`, finite sums.

### Examples

- The Cesàro means of the partial sums of `Σ (−1)^n/(n + 1)` converge to `log 2`; with `n a_n ≥ −1`
  the theorem returns convergence, already known here.

### Dependencies

Mathlib only.

## Layer 13: arithmetic applications

### 13.1 Factorizations of `n!` into bounded factors

Define `factorialFactorCount B n` as the least `t` such that `n! = a₁⋯a_t` with integers
`1 ≤ a_i ≤ B` (such a factorization exists for `B ≥ n`: the factors `1, 2, …, n`). API, for
`B ≥ max(n, 2)`:

- `factorialFactorCount B n ≤ n`, and `factorialFactorCount B n · log B ≥ log n!`;
- `factorialFactorCount` is antitone in `B`;
- `factorialFactorCount (B²) n ≤ ⌈factorialFactorCount B n / 2⌉`, by pairing factors.

Prove, as `n → ∞`:

- `factorialFactorCount (n²) n = n/2 − n/(2 log n) + o(n/log n)`;
- `factorialFactorCount n n = n − n/log n + o(n/log n)`.

The upper bounds are kontorovichtao-pntplus lines 3096–3101 (Theorems 8.1.1–8.1.2): a factorization
into factors at most `n`, balanced by the waste-and-score argument of lines 2984–3095, and pairing for
`n²`; their inputs are Legendre's formula, Chebyshev's bound `θ(x) ≤ x log 4` and
`π(n) ≤ √n + 2n log 4/log n` (Sublemma 8.1.16), and Stirling. The lower bounds are
`t log B ≥ log n!` with Stirling. Method background: alexeevetal2025factorial, §1 (the neighbouring
Erdős problem 391).

**Checks.**

- `factorialFactorCount 16 4 = 2` (`24 = 2 · 12`, and `24 > 16`) and `factorialFactorCount 4 4 = 3`
  (`24 = 2 · 3 · 4`, and two factors at most `4` give at most `16`); the lower bound
  `log 24/(2 log 4) ≈ 1.146` forces `t ≥ 2` in the first case.
- `factorialFactorCount B 0 = factorialFactorCount B 1 = 0`: `0! = 1! = 1` is the empty product.
- The main terms differ by the factor `2` between the two bounds, as `log(n²) = 2 log n` predicts; a
  statement with main term `n/2 − n/log n` for `B = n²` contradicts the lower bound
  `log n!/(2 log n) = n/2 − n/(2 log n) + O(1)`.

*Needs:* Mathlib `Nat.factorization_factorial`, `Chebyshev.theta_le_log4_mul_x`,
`Stirling.factorial_isEquivalent_stirling`, `Stirling.le_factorial_stirling`.

### 13.2 Goldbach ranges

Define, for real `H`, `EvenGoldbachUpTo H`: every even `n` with `4 ≤ n ≤ H` is a sum of two primes;
and `OddGoldbachUpTo H`: every odd `n` with `7 ≤ n ≤ H` is a sum of three primes (primes may
repeat). For each fixed real `H` both are decidable by a finite search over `n ≤ ⌊H⌋`. Prove:

- both are antitone in `H` as propositions (`H ≤ H′` and the statement at `H′` give it at `H`);
- `EvenGoldbachUpTo H → OddGoldbachUpTo (H + 3)` (subtract the prime `3`);
- the interval transfer: let `Δ > 1` and `x₀` with `x₀(1 − 1/Δ) ≥ 2`, and suppose every interval
  `(x(1 − 1/Δ), x]` with `x ≥ x₀` contains a prime. Then `EvenGoldbachUpTo H` and
  `OddGoldbachUpTo (x₀ + 4)` give `OddGoldbachUpTo ((H − 4)Δ + 4)` (the prime-ladder argument
  recalled in helfgottplatt2013 lines 27–31, with a multiplicative gap). Route: for odd
  `n > x₀ + 4` take a prime `p ∈ (x(1 − 1/Δ), x]` at `x = n − 4`; `p > 2` is odd, and `n − p` is even
  with `4 ≤ n − p < 4 + x/Δ ≤ H`.

The published verifications are named propositions that theorems take as hypotheses, never proved
here: `EvenGoldbachUpTo (4 · 10¹⁸)` (oliveiraesilva-herzog-pardi2014 lines 13–14) and
`OddGoldbachUpTo 8875694145621773516800000000000` (helfgottplatt2013 lines 9–10). The
short-interval prime hypothesis is a hypothesis of the transfer; its instances with published
prime-gap theorems belong to the explicit roadmaps.

**Checks.**

- `EvenGoldbachUpTo 30` and `OddGoldbachUpTo 33` by finite computation (`30 = 7 + 23`,
  `33 = 3 + 7 + 23`).
- The lower limits are needed: `2` is not a sum of two primes and `5` is not a sum of three, so a
  definition starting at `2` or `5` makes the propositions false at every `H ≥ 2` or `H ≥ 5`.
- `EvenGoldbachUpTo 3` and `OddGoldbachUpTo 6` hold vacuously.
- Transfer with Bertrand (`Δ = 2`, `x₀ = 5`, `x₀/2 ≥ 2`): `EvenGoldbachUpTo 30` and
  `OddGoldbachUpTo 9` give `OddGoldbachUpTo 56`; for instance `55 = 3 + 5 + 47`.

*Needs:* Mathlib `Nat.Prime`, `Even`, `Odd`; the published verifications only as hypotheses.

### Examples

- `EvenGoldbachUpTo (4 · 10¹⁸) → OddGoldbachUpTo (4 · 10¹⁸ + 3)`, an instance of the elementary
  transfer.

### Dependencies

Mathlib only, with the published computations as hypotheses.

## Downstream consumers

- ExplicitPrimeCounting §2.1 mollifies kernels of bounded variation multiplicatively and bounds
  their Mellin transforms: 7.1, 9.1–9.3.
- ExplicitZetaBounds §§6.1 and 7.10 (smoothed truncated Perron formulas; the reciprocal of `ζ` near
  the line one through Borel–Carathéodory and logarithmic derivatives): 7.3, 8.2, 8.3.
- ExplicitMultiplicativeFunctions §1.9 and its Layer 0 series of `μ²`, `τ_k`, `2^ω` and `φ`: 8.2 and
  Layer 11.
- ExplicitNumberFields: 7.3 and Layer 9 for its Perron and Mellin kernels.
- ArithmeticDirichletSeriesPartII §5.1: the Dirichlet series of `d_k = ζ^k` is the `z = k` case of
  11.2.
- A later part with zero-density input: Pintz-type sharpenings of 10.2 and the Vinogradov–Korobov
  width as an instance of it.

## References

- `kontorovichtao-pntplus`: A. Kontorovich, T. Tao and contributors, *Prime Number Theorem And …*,
  blueprint (Apache-2.0 project), §§3.1, 4.1–4.6, 5.2–5.3, 8.1, 9.1.
- `platttrudgian2020`: D. J. Platt, T. S. Trudgian, *The error term in the prime number theorem*,
  arXiv:1809.03134v2, §1.
- `oliveiraesilva-herzog-pardi2014`: T. Oliveira e Silva, S. Herzog, S. Pardi, Math. Comp. 83 (2014),
  abstract.
- `helfgottplatt2013`: H. A. Helfgott, D. J. Platt, arXiv:1305.3062v2, abstract.
- `alexeevetal2025factorial`: B. Alexeev et al., *Decomposing a factorial into large factors*,
  arXiv:2503.20170v4, §1.
- `estradavindas2012littlewood`: R. Estrada, J. Vindas, *Distributional versions of Littlewood's
  Tauberian theorem*, arXiv:1201.1408, §1.
- `dlmf-ch6`: N. M. Temme, NIST Digital Library of Mathematical Functions, Chapter 6, 6.2.19,
  6.12.5–6.12.8, §6.16.
- `montgomeryvaughan2007`: H. L. Montgomery, R. C. Vaughan, *Multiplicative Number Theory I*,
  Chapters 5–6 (cited by locator).
- `titchmarsh1986`: E. C. Titchmarsh, *The Theory of the Riemann Zeta-Function*, 2nd ed., Chapters I
  and III (cited by locator).
- `iwanieckowalski2004`: H. Iwaniec, E. Kowalski, *Analytic Number Theory*, (1.25), (1.28)–(1.33),
  (1.35), Chapter 5 (cited by locator).
- `tenenbaum2015`: G. Tenenbaum, *Introduction to Analytic and Probabilistic Number Theory*, 3rd ed.,
  Chapters II.4–II.5 (cited by locator).
- `apostol1976`: T. M. Apostol, *Introduction to Analytic Number Theory*, Chapters 2 and 11 (cited by
  locator).
- `hardy1949`: G. H. Hardy, *Divergent Series* (cited by locator).
- `katznelson2004`: Y. Katznelson, *An Introduction to Harmonic Analysis*, 3rd ed., Chapter I, the
  periodic analogue of 7.1 (cited by locator).
