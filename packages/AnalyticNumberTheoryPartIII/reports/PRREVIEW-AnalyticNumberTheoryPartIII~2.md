# Review of AnalyticNumberTheoryPartIII (pull request #2008 at 0121ecc)

**Verdict:** needs changes

There are two findings, both P3; neither blocks. The gate passes at this head. All seven findings of the previous review are repaired; the evidence is the first item under Verified sound.

## R01 (P3) — 11.2's route uses pinned declarations it does not name

**Location.** `TauCetiRoadmap/AnalyticNumberTheoryPartIII/README.md`, lines 1180–1182, the route of `LSeries_generalizedDivisor`:

> "Route: the local factor `Σ_a Ring.multichoose z a X^a = exp(z Σ_{j≥1} X^j/j)` at `X = p^{−s}`, multiplied over the primes under absolute convergence"

Neither input is named in 11.2's *Needs:* line (lines 1213–1216). From Tau Ceti (lines 290–313) does not list the binomial series.

**Claim.** Every input a route uses must be a target here, a named supplier section, or a named pinned declaration. This route has two inputs, and both are at the pins:

- The binomial series of `Ring.multichoose` is a Tau Ceti declaration that the README does not cite.
- The Euler product of a multiplicative function, `EulerProduct.eulerProduct_tprod`, is listed under From Mathlib (line 279) but is missing from 11.2's *Needs:*.

The convolution law `d_z ⋆ d_w = d_{z+w}` (line 1176), whose stated reason is "Vandermonde for `Ring.multichoose`", follows from the same series by comparing coefficients.

**Witness.** `TauCeti.hasSum_multichoose_mul_geometric_complex_of_norm_lt_one` (`TauCeti/Analysis/Analytic/Binomial.lean:46`) states: for complex `r` and `‖z‖ < 1`, the series `Σ_n Ring.multichoose r n · zⁿ` has sum `1/(1 − z)^r`. It wraps Mathlib's `Complex.one_div_one_sub_cpow_hasFPowerSeriesOnBall_zero` (`Mathlib/Analysis/Analytic/Binomial.lean:154`).

**Repair.**

1. In the route, write the local factor as `(1 − p^{−s})^{−z}` by `TauCeti.hasSum_multichoose_mul_geometric_complex_of_norm_lt_one`; the hypothesis `‖p^{−s}‖ < 1` holds for `Re s > 0`.
2. Turn that into `exp(z Σ_{j≥1} p^{−js}/j)` by Mathlib's `Complex.hasSum_taylorSeries_neg_log` (`Mathlib/Analysis/SpecialFunctions/Complex/LogBounds.lean:280`).
3. Add the Tau Ceti declaration, with its file, under From Tau Ceti.
4. Add the Tau Ceti declaration, `Complex.hasSum_taylorSeries_neg_log` and `EulerProduct.eulerProduct_tprod` to 11.2's *Needs:* line.
5. Give the convolution law the reason "compare coefficients in `(1 − X)^{−z}(1 − X)^{−w} = (1 − X)^{−(z+w)}`". Alternatively, cite Mathlib's `Ring.add_choose_eq` (`Mathlib/RingTheory/Binomial.lean:525`) through `Ring.multichoose_eq`.

I tested the identity this repair relies on. In each case the multichoose series, `(1 − X)^{−z}` and `exp(z Σ X^j/j)` agree:

| `z` | `X` | common value |
|---|---|---|
| `1/2` | `1/4` | `1.1547005` |
| `i` | `1/8` | `0.9910979 + 0.1331349i` |
| `0.3 + i` | `i/2` | `0.6080501 + 0.0167393i` |

## R02 (P3) — Three headline theorems carry no source locator

**Location.**

- `norm_dirichletKernel_integral_sub_mean_le`: README lines 512–517, and `Suggested.lean` lines 81–85. The README reads: "There is an absolute constant `C` such that for every integrable `h : ℝ → ℂ` of bounded variation on `ℝ` … this is `norm_dirichletKernel_integral_sub_mean_le`".
- `abscissaOfAbsConv_sigmaC`: README line 1162, and `Suggested.lean` lines 307–308.
- `abscissaOfAbsConv_generalizedDivisor`: README lines 1183–1184, and `Suggested.lean` lines 323–325.

**Claim.** All three are headline theorems stated in `Suggested.lean`, and neither file gives any of them a source.

- The windowed error is a paragraph of its own. The locators of 7.3 (`montgomeryvaughan2007` and `titchmarsh1986`, line 499) belong to the Laplace form only.
- The two abscissa statements follow the definitions of `sigmaC` and `generalizedDivisor`. The locators there (`kontorovichtao-pntplus` lines 3215–3297 and 3151–3212) contain no abscissa.

Every theorem needs a locator, so a theorem without one is a policy defect.

**Witness.** The only abscissa statement in `kontorovichtao-pntplus` §9.1 is at line 3309 (Theorem 9.1.31, printed p. 83). It bounds the abscissa of `n ↦ n^ν` above by `Re ν + 1`. That covers a different function, and only one direction.

**Repair.** Add a parenthetical locator at each statement, and name the same source in each docstring.

- `abscissaOfAbsConv_sigmaC`: "(the upper bound from kontorovichtao-pntplus line 3309, Theorem 9.1.31, for `n ↦ n^ν` convolved with `ζ`; the divergence on the boundary is proved by the route below)".
- `abscissaOfAbsConv_generalizedDivisor`: "(tenenbaum2015, Chapter II.5, absolute convergence on `Re s > 1`; divergence at `s = 1` from `Σ_p |z|/p = ∞`)".
- The windowed error: cite the text whose quantitative bound this is. If no source states it in this form, cite its two inputs, 7.2's `dlmf-ch6` locators and `montgomeryvaughan2007` Chapter 5, §5.1. Then add one clause saying that the combination is stated here.

I tested the sigmaC citation at `ν = −2`:

- Theorem 9.1.31 bounds the abscissa of `n^{−2}` by `−1`.
- With `ζ` this gives the upper bound `max(1, −1) = 1`.
- The README's own Check (`σ_{−2}(p) ≥ 1`, line 1192) supplies the matching lower bound.

## Verified sound

### The previous review's findings: all repaired

| Previous finding | Status at this head |
|---|---|
| R01 (P2), the certificate bullet | Repaired. The bullet at old lines 1485–1495 is gone. Line 288 now ends "and Bertrand's postulate `Nat.exists_prime_lt_and_le_two_mul`". `grep -E 'lucas\|Pratt'` gives no hits in either file. |
| R02 (P3), `tex` | Repaired. Lines 1388–1390 put each of the five terms in its own code span. The gate reports `tex=0`. |
| R03 (P3), locators of 8.1a and 8.1b | Repaired. Line 672 cites "ieantn-contourintegration lines 60–90, with the same hypotheses on `r`, `P` and `f`". Lines 718–719 cite "ieantn-ch2v4 lines 93–110 and 135–162, stated there with differentiability on the whole strip". Both checked against the text; see below. |
| R04 (P3), manifest | Repaired. `sources.toml` has `brown1967` (uncertified, with its DOI) and six `ieantn-*` keys at commit `466b41b…`, each with line locators. `primenumbertheoremand` no longer occurs in the README. |
| R05 (P3), the 10.1 locator | Repaired. Lines 963–965: "Theorem 4.5.3, for `a = Λ`, stated there as `O(εX log X)` with no condition on `ε`; the term `+1` … is added here". |
| R06 (P3), padding | Repaired. `samplingSum_aliasing_sharp` occurs in neither file. README lines 556–560 and the docstring at `Suggested.lean` lines 100–102 keep the sharpness in prose. |
| R07 (P3), AsymptoticExpansions §8.1 | Repaired. Lines 154–158 (Not owned here) and lines 833–834 (9.1). AsymptoticExpansions at its head has "### 8.1 Parseval" at line 905, with `𝓜I(z) = 𝓜f(1 − z)𝓜h(z)` and its inversion. |

### Gate, build and dependency check

- **Gate.** I reran it at this head. Every counter is 0 (`set_option`, `tex`, `sorry-data`, `imports`, `readme-ids-missing`, `depcheck`, `stray-files`, `outside-folder`, `statement-hygiene` and the rest), and the result is `OK`. The worker's gate at this head also reports `build=0`.
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AnalyticNumberTheoryPartIII'` is empty.
- **Dependency check.** Output: `depcheck: 238 roadmaps, 2349 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. In `ORDER.txt` this roadmap is at line 271, after all its suppliers:
  - LFunctions (27)
  - ZerosOfLFunctions (48)
  - AnalyticNumberTheoryPartI (49)
  - ProbabilisticAndMetricNumberTheory (60)
  - ArithmeticDirichletSeriesPartII (90)
  - ExplicitZetaBounds (265)
  - ExplicitPrimeCounting (267)
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0. Its only output is 27 "declaration uses `sorry`" warnings, one for each theorem. The file has 27 theorems and 8 definitions, all with real bodies, and no `variable` block.
- **Signatures.** In a scratch copy I ran `#check @` on all 35 declarations and on 78 Mathlib and Tau Ceti names that the README cites; everything elaborated. I compared each elaborated type with its README statement and found no lost binder and no difference in generality. `LSeries_generalizedDivisor` uses exactly the series `fun n => ↑(Λ n) / ↑(Real.log ↑n)` of `riemannZeta_eq_exp_LSeries`.
- **Padding probe.** I replaced every `sorry` with `by first | rfl | (simp; done) | (norm_num; done) | decide | infer_instance | positivity | exact le_rfl`. All 27 theorems still fail, so there is no padding. The deleted `samplingSum_aliasing_sharp` was the only padding at the previous head.

### Headline theorems

The README's Summary names the headline theorems:

- Layer 7: Fourier decay for bounded variation; principal-value inversion and its window; Brown's bound.
- Layer 8: the rectangle residue theorem in two forms; the L-shaped shift; the derivative form of Borel–Carathéodory; Landau's lemma.
- Layer 9: the transform and the decay of the smoothed cutoff.
- Layer 10: the smoothed sum as an inverse Mellin integral; the Ingham transfer; the Hecke `L′/L` bound.
- Layer 11: the series and abscissas of `σ_ν` and `d_z`; Ramanujan's identity; the series of `2^ω`, `μ²`, `λ`, `φ`.
- Layer 12: Hardy–Landau, in both forms.
- Layer 13: Erdős 392 for `B = n²` and `B = n`; the interval transfer.

All of them are statable at the pins, and all are stated, none through a stand-in. The module docstring lists the remaining targets as lemmas or instances. These are: 7.2; the Laplace form of 7.3; 9.1–9.3; the 10.1 comparison; 11.1; the `τ(n²)` series; the waste-and-score framework; the elementary Goldbach transfers; the derived ranges.

### Sources: the seeded sample (15 targets) and the new IEANTN locators

Each locator below was read at the cited lines.

**7.1**
- `kontorovichtao-pntplus` line 189 (Lemma 3.1.4, `‖ψ‖_TV/(2π|u|)`).
- Lines 198–209 (Lemmas 3.1.5–3.1.6, `‖ψ′‖_TV/(2π|u|)²` and `(‖ψ‖₁ + ‖ψ′‖_TV/(2π)²)/(1 + u²)`).
- Lines 210–220 (Lemma 3.1.7, `C = π + 1/(4π)`).

**7.3**
- `montgomeryvaughan2007` and `titchmarsh1986` are settled uncertified texts; see Not verifiable.
- The Perron instance is `TauCeti.truncatedPerronKernel_one` (`Perron/Basic.lean:204`).

**7.4**
- `brown1967` is uncertified.
- `ieantn-brown1967` lines 37–40: Theorem 1 under integrability only, constant `(1/π)∫_{|ω|>2πW}`, shown to be optimal.
- Lines 52–56: the symmetric partial sums.
- The conversion `ω = 2πξ` gives `(1/π)·2π ∫_{|ξ|>W} |G| = 2∫|G|`.

**8.1**
- Lines 621–642: Theorem 4.1.2 and Lemmas 4.1.2–4.1.4, for simple poles, as the README says.
- Lines 596–613: Definitions 4.1.3–4.1.5 and Lemma 4.1.1.

**8.1a**
- `ieantn-contourintegration` lines 60–90. The hypotheses `z.re < ρ.re − r ∧ ρ.re + r < w.re ∧ …` and `2r < dist ρ σ` say that the closed discs lie in the open rectangle and are pairwise disjoint.
- Differentiability is required on the closed rectangle minus `P`.
- So the README's "same hypotheses" is exact.

**8.1b**
- `ieantn-ch2v4` lines 93–110: `lContourIntegral`, the same three terms.
- Lines 135–162: `contour_shift`, with `DifferentiableOn ℂ f (UpperRegion T \ P)` and `DecaysLeft T f` on all of `[0, T]`.
- The README's weakening is correct. Its route needs differentiability only on `[−X, 1] ×ℂ [Im w, T]` and `[Re w, 1] ×ℂ [0, Im w]`, both inside `D_w`. It needs decay only on the left edge `Im w ≤ Im s ≤ T`.
- Numerical check: see the table row for 8.1b.

**8.2**
- Lines 1751–1758: Theorem 5.3.2, `16MR²/(R − r)³` with `f(0) = 0`.
- The README's `2·k!·R(M − Re f(z₀))/(R − r)^{k+1}` follows from Carathéodory's inequality by summing `Σ_{m≥0} (m + k)!/m! x^m = k!/(1 − x)^{k+1}`.

**8.3**
- Lines 1971–1977: Theorem 5.3.7, with `f(0) = 1`, `|f| ≤ B` on `|z| ≤ R < 1`, zeros summed in radius `r`, evaluation in `r′ < r`.
- With `B = e^M` this gives the README's form at fixed radii.

**9.2**
- Lines 947–962: Theorem 4.3.2, `O(1/|s|)` on `σ₁ ≤ Re s ≤ 2`, entire.

**9.4**
- Lines 1015–1017: Definition 4.3.3.
- Lines 1025–1068: Lemmas 4.3.5–4.3.6, with `c = log 2` and `c = 2 log 2`, the thresholds `2^{∓ε}` weakened.
- Lines 1069–1104: Lemmas 4.3.7–4.3.8.
- Lines 1107–1127: Lemma 4.3.9.
- Lines 1128–1131: Lemma 4.3.10, `O(1/(ε|s|²))`.
- Lines 1132–1134: Lemma 4.3.11.

**10.2**
- `platttrudgian2020` lines 21–32: Ingham's `exp(−½(1 − ε)ω(x))` with `ω = min_{t≥1}(η(t) log x + log t)`.
- Lines 54–56: Pintz deletes the `½`.
- `kontorovichtao-pntplus` lines 1507–1516: Definition 4.5.3.
- Lines 1673–1683: Theorem 4.6.1, error `exp(−c(log x)^{1/(1+n₁)})`.
- Line 1684: Theorem 4.6.2, `(log x)^{1/10}`.

**11.2**
- Lines 3151–3212: Definition 9.1.3 (`d_k`) and Theorems 9.1.12–9.1.15.
- Lines 3215–3297: Definitions 9.1.4–9.1.5 and Theorems 9.1.16–9.1.29.
- Lines 3316–3323: Theorem 9.1.32, `Re s > 1`, `Re(s − ν) > 1`.
- The abscissas are R02.

**11.4**
- Line 3454: Theorem 9.1.49. Line 3533: Theorem 9.1.57. Line 3605: Theorem 9.1.68. Line 3626: Theorem 9.1.70, `Re s > 2`.
- Line 3631 is the source's own correction.

**12.1**
- `estradavindas2012littlewood` lines 32–35: the one-sided Hardy–Littlewood theorem, `−C < n c_n`, for Abel summability. Cesàro summability implies Abel summability with the same sum, so it covers 12.1.

**13.1**
- `ieantn-erdos392` lines 16–21: the problem, answered "and it does".
- Lines 25–26 and 62–65: `factors_le_n`.
- Lines 72–75: `factors_le_n_sq`.
- Lines 87–89: the lower bound for every `n ≥ 2`.
- `kontorovichtao-pntplus` lines 3096–3101: Theorems 8.1.1–8.1.2.
- Lines 2984–3095: the framework.
- Line 3080: Sublemma 8.1.16, `π(n) ≤ √n + 2n log 4/log n`.
- `alexeevetal2025factorial` line 75: problem 391.

**13.2**
- `ieantn-goldbach-vocabulary` lines 25–36 and 38–51: natural `H`, lower ends `4` and `7`.
- `ieantn-goldbach` lines 46–52: `even_implies_odd`.
- Lines 54–73: natural `x₀`, `H`, `Δ`, with the interval `(x(1 − 1/Δ), x]`.
- Lines 91–98: `1.1325·10²⁶`.
- Lines 100–115: Kadiri–Lumley, and the Ramaré–Saouter bridge to `e⁵⁹`.
- `helfgottplatt2013` lines 9–10 and 27–31.
- `oliveiraesilva-herzog-pardi2014` lines 13–14.

### Cross-roadmap citations resolved (55)

**On main:**
- ZerosOfLFunctions §§3.4 (line 755), 4.3, 6.2–6.5 (`heckeZeroFreeConstant ≤ log 3/2`, `IsExceptionalZero`), 7.1 (*rectBoundary*, null-homologous for every open `U ⊇ R`), 7.2, 8.5 and 8.6.
  - The two open revisions of ZerosOfLFunctions keep all of these section numbers: #1907 at lines 731–1555, #1913 at lines 796–1565.
- LFunctions Layers 3, 5 and 7.
- `Completed/ContourIntegration` Layers 2–4.
- `Completed/ArithmeticDirichletSeries` §§0.2, 6.3, 6.4 and Layers 6, 9, 10.
- TauberianBoundaryConvergence N1–N2.
- ToeplitzOperators T1 ("L¹ Fourier uniqueness by Fejér means and their L¹ approximation").

**At open heads:**
- AnalyticNumberTheoryPartI (#1126):
  - §0.11c (line 396), §0.30a (`riemannZeta_local_logDeriv`, with the same quantifiers plus `s ≠ 1`), §0.33 (line 864), §0.33a (`riemannZeta_deriv_logDeriv_bound`), §1.2a.
  - §§3.1, 3.3 and 3.4 (`d_n` with `d_n(p^a) = C(a + n − 1, n − 1)`), §3.22, §3.24a (`riemannZeta_pow_four_eq_mul_LSeries_divisor_sq`).
- AnalyticNumberTheoryPartII (#1167): Layers 4–6.
- ArithmeticDirichletSeriesPartII (#1415): §0.1 (`HasLaplace`), §3.2, §5.1 (`LSeriesHasSum_zeta_pow`).
- ProbabilisticAndMetricNumberTheory (#1421) §0.1a: `powOfAdditive`, `IsCompletelyAdditive.powOfAdditive_mul` and `isMultiplicative_powOfAdditive_cardDistinctFactors`. The citation tool's lead on `powOfAdditive_mul` is therefore a supplier README name, not a defect.
- ExplicitPrimeCounting (#1945):
  - §1.4, §2.1 (the bound `max(1, b)V/|s|²`), §3.1 (forms (c) and (d)), §3.6.
  - §7.1 (`x > 2 010 759.9`, `x/16597`), §7.2 (`28 314 000`, `10 726 905 041`), §7.3 (`1 946 282 821` at `e⁵⁹`, `1 966 196 911` at `e⁶⁰`, open interval).
- ExplicitZetaBounds (#1954): §6.1, Layer 7 and §7.6.
- AsymptoticExpansions (#1857): §§8.1 and 8.2.
- SpecialFunctionsEiLiErfIncompleteGamma (#1924): Layer 9, including §9.7 (Gibbs).

The overlaps tool reports no id dropped by an open pull request, and none dropped by this one.

### Library declarations opened at the pins

**Tau Ceti:**
- `TauCeti.Contour.classicalResidueTheorem_nullHomologous` (`Residue/Cycle.lean:226`): open `U`, differentiability on `U ∖ S`, meromorphy on `S ∩ U`, a piecewise-`C¹` closed null-homologous curve avoiding `S`.
- `BoundedVariationOn.integral_deriv_smul_eq_neg_integral_vectorMeasure` (`BoundedVariation/OneDimensional.lean:48`): `C¹` compactly supported `φ`, no integrability of `f`.
- `TauCeti.Contour.tendsto_integral_sin_div_atTop` (`SineIntegral.lean:351`).
- `TauCeti.truncatedPerronKernel_one` (`c ≠ 0`, value `π⁻¹ arctan(T/c)`) and `TauCeti.truncatedPerron_LSeries` (`Perron/Formula.lean:130`).
- `TauCeti.LFunctions.heckeLFunctionC`, `…_eq_primitive` and `…_eventuallyEq_primitive` (`Hecke/Basic.lean:74, 130, 138`).
- `TauCeti.GlobalNumberFields.finite_rayClassGroup` (`RayClass/Finite.lean:155`).
- `TauCeti.MultiplicativeIdealWeight` (`Weight.lean:116`). It kills only finitely many height-one primes, as Scope says.
- `TauCeti.hasSum_multichoose_mul_geometric_complex_of_norm_lt_one` (R01).

**Mathlib:**
- `Complex.borelCaratheodory` (`BorelCaratheodory.lean:109`, `0 < M`).
- `Real.one_add_sq_mul_norm_fourier_le` (`FourierTransformDeriv.lean:856`).
- `mellinInv_mellin_eq` (`MellinInversion.lean:92`).
- `Complex.integral_boundary_rect_eq_zero_of_differentiableOn` (`CauchyIntegral.lean:313`). Its four-edge expression is the one 8.1, 8.1a and 8.1b use.
- `riemannZeta_eq_exp_LSeries` (`DirichletLSeries.lean:264`).
- `hasMellin_one_Ioc` (`MellinTransform.lean:438`, `0 < Re s`).
- `AnalyticOnNhd.sum_divisor_le` (`JensenFormula.lean:389`).
- `Filter.Tendsto.cesaro` (`SpecificAsymptotics.lean:191`). It has the same `N⁻¹ Σ_{i<N}` convention as 12.1.
- `LSeries_zeta_mul_Lseries_moebius` (`LSeries/Dirichlet.lean:296`).
- `EulerProduct.eulerProduct_tprod` (`EulerProduct/Basic.lean:225`).
- `Ring.add_choose_eq` (`RingTheory/Binomial.lean:525`).
- `Complex.hasSum_taylorSeries_neg_log` (`LogBounds.lean:280`).

### Duplication and ownership, by object

**Pinned Mathlib and Tau Ceti have none of the following:**
- a completely-multiplicative predicate on `ArithmeticFunction` (Mathlib has only the `CompletelyMultiplicative` section of `EulerProduct/Basic.lean`, for `ℕ →*₀ F`);
- the series of `σ_ν`, `d_z`, `2^ω`, `μ²`, `λ`, `φ`;
- a Cesàro Tauberian theorem;
- a rectangle residue theorem;
- Fourier decay for bounded variation (`TauCeti/Analysis/Fourier/Decay.lean` is for smooth compactly supported functions);
- a derivative Borel–Carathéodory;
- Mellin convolution or smoothed cutoffs;
- Goldbach predicates.

`Mathlib/NumberTheory/ArithmeticFunction/LFunction.lean` (`ofPowerSeries`, `eulerProduct`) is formal and states no analytic series.

**Open roadmaps, searched by object over all open heads:**
- **Goldbach.** SieveMethodsAndPrimePatterns (#1495) has only Selberg and Chen bounds, and CircleMethodThreePrimes (#1803) excludes numerical values.
- **Borel–Carathéodory.** ExplicitZetaBounds, ExplicitMultiplicativeFunctions and Part I use it only in routes.
- **Rectangle residue.** Part I, ExplicitPrimeCounting, EffectiveClassNumbers and AsymptoticExpansions use the residue theorem; none owns a rectangle statement.
- **`Real.sinc`.** ArithmeticDirichletSeriesPartII owns `squaredSinc`, a different kernel.
- **Owned only here:** Erdős 392, Hardy–Landau, `IsCompletelyMultiplicative`, `sigmaC`, `inghamExponent`, the smoothing kernels.

No declaration of `Suggested.lean` reuses a fully qualified name from a readable roadmap.

### The adversarial pass

Values come from closed forms, quadrature and partial sums in scratch code; brute-force values come from exhaustive factorization.

| Statement | Instances tried | Values computed (left vs right) | Result | Change |
|---|---|---|---|---|
| Conventions | `𝓕1_[0,1](1/2)`; `4^{1/2}`; `log ζ(2)`; Cesàro at `N = 2`; `LSeries 1 1` | `(1 − e^{−πi})/(πi) = −2i/π`; `2`, so `σ_{1/2}(4) = 3 + √2`; `log(π²/6) = 0.497700`; `(S₀ + S₁)/2 = 1/2`; junk `0` | hold | none |
| 7.1 `norm_fourier_le_eVariationOn_div` | `1_[0,1]` at `ξ = 1/2`; `ξ = 0`; `1_[0,∞)` | `2/π` vs `V/(2π·½) = 2/π` (equality); `1` vs junk `V/0 = 0`; `V = 1`, limit `1`, not integrable | holds; constant sharp; `ξ ≠ 0` needed | none |
| 7.1 derivative and `C²` forms | tent at `ξ = 1/2`; `1/(1 + t²)` | `4/π²` vs `V₁/(2π·½)² = 4/π²`; `sup (1 + t²)|f″| = 2` at `0` (`9/8` at `t² = 5/3`); `π ≤ 2(π + 1/(4π)) = 6.442` | hold | none |
| 7.2 truncated Dirichlet integral | `x = 5`, `π`, `−1` | `I(5) = 1.549931`, `|π/2 − I(5)| = 0.020865 ≤ 0.4`; `I(π) = 1.85194 > π/2`; at `−1`, `2.517` vs `−2` | holds; `x > 0` needed | none |
| 7.3 `tendsto_truncated_mellinInv` | `1_(0,1]`, `σ = 1`, `x₀ = 1`, `T = 10`; `σ = 0` | `arctan(10)/π = 0.46827 → 1/2 = (1 + 0)/2`; at `σ = 0` the truncation is `0` vs `1/2` | holds; convergence needed | none |
| 7.3 `norm_dirichletKernel_integral_sub_mean_le` | `e^{−σu}1_{u≥0}`, `u₀ = 0`, `(σ, T) = (1, 10), (10, 1), (1000, 1)`; `1_[0,1]`, `u₀ = ½`, `δ = ¼`, `T = 10` | errors `0.0317, 0.4683, 0.4997` vs `min_δ(σδ + 2/(Tδ)) = 0.894, 8.94, 89.4`; `|(2/π) Si(5) − 1| = 0.013283` vs `C·V/(Tδ) = 0.8C` | holds | R02 |
| 7.4 `exists_tendsto_samplingSum_norm_sub_le` | `W = 1`, `G = e^{−πiξ/2}` on `(1, 3)`, `t = ¼`; sample point | `S_N = −1.96134, −1.99597, −1.99959, −1.99996` at `N = 10, 10², 10³, 10⁴`; `f(¼) = 2`; error `4` vs `2∫|G| = 4`; at `t = m/2W` error `0` | holds with equality | none |
| 8.1 `rectangle_boundary_integral_eq_residues` | `1/s` on `[−1, 1]²`; `1/s²`; `1/(s − 2)`, `P = ∅`; `exp(1/s)` | four edges `iπ/2`, sum `2πi = 2πi·1`; `0 = 2πi·0`; `0`; edge `2πi` vs junk residue `0` | holds; meromorphy needed | none |
| 8.1 U-shaped form | `1/s`, `σ = ±1`, `T = 1` | right `π/2` = left `−π/2` + `(top − bottom)/i = −π` + `2π`; the clockwise sign gives `5π/2` | holds | none |
| 8.1a `…_sum_circleIntegral` | `exp(1/s)`, `r = ½`; `1/s`, `P = {0, 0.3}` | `2πi` on both sides; overlapping circles give `4πi` vs `2πi` | holds; disjointness needed | none |
| 8.1b `vertical_integral_eq_lShaped_add_sum_circleIntegral` | `eˢ/s` (pole `0` in the removed block), `w = 0.5 + 0.5i`, `T = 2`, `P = ∅` | left `−0.852950 + 3.701501i`, right `−0.852950 + 3.701501i`; counting the block pole would give `−0.852950 + 9.984687i` | holds under the weakened hypotheses | none |
| 8.2 `norm_iteratedDeriv_le_borelCaratheodory` | `−2z/(1 − z)`, `M = R = 1`, `z = r = ½`, `k = 1, 2, 3`; `k = 0`, `f ≡ i` | `|f^{(k)}| = 8, 32, 192` vs bound `8, 32, 192`; at `k = 0`, `1 ≤ 0` would be claimed | holds with equality; `k ≥ 1` needed | none |
| 8.3 `norm_logDeriv_sub_sum_zeros_le` | `(z − 0.3)e^{2z}`, `R = 1`, `r₁ = ¼`, `r₂ = ½`; `z − ε` | `M = log(0.7e²/0.3) = 2.847`, left side `2`; without the zero sum, `1/ε` vs `C log((1 + ε)/ε)` | holds; zero sum needed | none |
| 9.1 Parseval correspondence (new text) | `f = e^{−t}`, `h = 1_(0,1]`, `x = ½`, `z = ½` | `(F ⋆ h)(½) = 0.8646647 = I(½) = 1 − e^{−2}`; `𝓜I(½) = 3.5449077 = Γ(½)·2 = 𝓜f(½)𝓜h(½)`; `𝓜F(z) = Γ(1 − z) = 𝓜f(1 − z)` | holds | none |
| 9.1 Tonelli claim (new text) | substitution `x = yu` | `∫∫|f(y)g(x/y)|x^{σ−1}/y = ∫|f|y^{σ−1} · ∫|g|u^{σ−1}` | holds | none |
| 9.2 bump transforms | `(x − 1)²(2 − x)²`; `max(0, 1 − x)²` | `∫ν = B(3,3) = 1/30`; `mellin ν 1 = −mellin ν′ 2` from `mellin ν(s) = −mellin ν′(s + 1)/s`; `2/(s(s + 1)(s + 2))` has poles | holds | none |
| 9.3 `deltaSpike` | `ε = ½`; `x = 0, −1`; `|y^ε − 1|` at `ε = 1` | support `[0.7071, 1.4142]` vs wrong `[¼, 4]`; `0, 0`; `1 ≤ 2 log 2 = 1.386` | holds | none |
| 9.4 `smoothCutoff`, `mellin_smoothCutoff` | `ν = (2/3)x` on `[½, 2]` (mass 1), `ε = ½`, `s = 1.3 + 2i`; symmetric `ν` | quadrature `0.329708 − 0.303958i` vs `mellin ν(εs)/s = 0.329708 − 0.303958i`; opposite `mellin ν(s/ε)/s = 0.371777 + 0.504363i`; value `½` at `1` | holds | none |
| 9.4 `norm_mellin_smoothCutoff_le` | `k = 1`, `s = 1 + iT` | `Re(εs) ∈ [0, σ₂]`, bound `≍ 1/(T(1 + εT))`: `1/T` for `T ≤ 1/ε`, `1/(εT²)` beyond (Lemma 4.3.10) | holds | none |
| 10.1 `smoothedSum_eq_mellinInv` and comparison | `a = δ₁`; `a ≡ 1`, `X = 2`, symmetric `ν`, `ε ≤ log₂(3/2) = 0.585` | both sides `smoothCutoff ν ε (1/X)`; difference `2 − 1.5 = ½` vs `C(2ε + 1)`; without `+1` `2Cε → 0` | holds; `+1` needed | none |
| 10.2 `inghamExponent` | `η = 1/log t`, `log x = 100`; `η ≡ ¼` | `min_L(100/L + L) = 20` at `L = 10`; `25 + log 3 = 26.0986` at `t = 3` | holds | none |
| 10.2 `norm_sum_sub_mul_le_of_zeroFreeRegion` | `η = c/log t`; the height step | `η(3) ≤ ½` iff `c ≤ 0.5493`; `T + 3 ≤ 2T` gives `log T ≥ (ω − log 2)/2`; `x^{−η(T+3)} = 1/T`; with `ε = T^{−½}` the error is `x(log x)^{O(1)}e^{−ω/4}` | holds | none |
| 10.3 `logDeriv_heckeLFunctionC_bound` | `K = ℚ`, `χ = 1`; imprimitive trivial character mod `2`; with 10.2 | residue of `−ζ′/ζ` is `+1 = δ_χ`; `R_c ⊆ {Re s ≥ ½}` vs the zeros of `1 − 2^{−s}` on `Re s = 0`; `R_c = R_η` at `η = c/log t`, `r = δ_χ`, `B′ = 1` | holds | none |
| 11.1 *IsCompletelyMultiplicative* | `λ`; `μ`; `μλ` | `λ(4) = 1 = λ(2)²`; `μ(4) = 0 ≠ 1`; `Σ_{d∣4} λ(d)μ²(4/d) = 0` | holds | none |
| 11.2 `sigmaC` and its series and abscissa | `(1, 6)`, `(−1, 6)`, `(½, 4)`; `ν = ±2`; `ν = it` | `12`, `2`, `4.41421`; abscissas `3` and `1`; `|1 + p^{it}| ≥ 1 + cos(t log p)`, divergent at `σ = 1` | holds | R02 |
| 11.2 `generalizedDivisor` and its series and abscissa | `z = ½`, `s = 2`; `z = 3`; `z = −1`; local factor | `Σ_{n≤2·10⁵} d_{½}(n)n^{−2} = 1.2825491` vs `√ζ(2) = 1.2825498`; `d₃(4) = 6`; `d_{−1}(p²) = 0`; `Ring.choose 2 2 = 1 ≠ 3`; local factor `1.1547005` three ways | holds | R01 |
| 11.3 `LSeries_sigmaC_mul_sigmaC` | `α = 1`, `β = 0`, `s = 3`; `α = 2`, `s = 3` | partial sum to `2·10⁵` is `3.770344` vs `(ζ(2)ζ(3))²/ζ(5) = 3.770497` (tail `O(log N/N)`); `Σ_p 2(p² + 1)/p³ = ∞` | holds; half-plane needed | none |
| 11.4 series and abscissas | `s = 3`, `s = 4`; `φ` at `Re s = 2` | `1.4203083`, `1.1815649`, `0.8463352` equal `ζ(3)²/ζ(6)`, `ζ(3)/ζ(6)`, `ζ(6)/ζ(3)`; `1.1106265 = ζ(3)/ζ(4)`; `Σ(p − 1)/p² = ∞` | holds | none |
| 12.1 both forms | `(−1)ⁿ`; `aₙ = 1`; shift `a₀` by `d` | means `0.5` at `N = 2000`, `S_N` alternates `1, 0`, `n aₙ = −n` at odd `n`; means diverge; both limits move by `d` | holds | none |
| 13.1 `factorialFactorCount` | `(16, 4)`, `(4, 4)`; `B = n = 10`; `B = 100`, `n = 10` | `2`, `3`; `10! = 7·10·10·9·9·8·8` and `10⁶ < 10!`, so `7`; `10! = 100·81·64·7` and `100³ < 10!`, so `4` | holds | none |
| 13.1 both asymptotics | lower bound | `t ≥ log n!/(2 log n) = n/2 − n/(2 log n) + O(1)`; ieantn-erdos392 lines 87–89 state it for `n ≥ 2` | holds | none |
| 13.2 predicates | `H = 30, 33`; lower ends | `30 = 7 + 23`, `33 = 3 + 7 + 23`; `2` and `5` are not sums | hold | none |
| 13.2 `oddGoldbachUpTo_of_primeGaps` (real parameters, where IEANTN has natural ones) | `Δ = 2`, `x₀ = 2`, `H = 30`; `Δ ≤ 0`; `Δ = 3/2`, `n = 9`; `0 < Δ < 1` | Bertrand gives `OddGoldbachUpTo 56`; `(x(1 − 1/Δ), x]` is empty for natural `x ≥ max(x₀, 1)`; `9 − 5 = 4 = 2 + 2`; no prime in `(neg, 1]`, so `x₀ > 1` is forced | holds | none |
| 13.2 Examples | Ramaré–Saouter; Kadiri–Lumley | `(4·10¹⁸ − 4)·28 314 000 + 4 = 113 255 999 999 999 999 886 744 004`; `e⁵⁹ = 4.20·10²⁵ < 1.1325·10²⁶ < e⁶⁰ = 1.142·10²⁶ < 7.785·10²⁷` | true | none |

## Not verifiable

- `brown1967`, Theorem 1 (7.4): paywalled (DOI 10.1016/0022-247X(67)90183-7), recorded as uncertified. The hypotheses, the constant and the optimality claim are checked against `ieantn-brown1967` lines 37–40; the sharp instance is computed above.
- The settled uncertified texts, cited by locator only:
  - `montgomeryvaughan2007`, Chapters 5–6;
  - `titchmarsh1986`, Chapters I and III;
  - `iwanieckowalski2004`, (1.25), (1.28)–(1.33), (1.35) and Chapter 5;
  - `tenenbaum2015`, II.4–II.5;
  - `apostol1976`, Chapters 2 and 11;
  - `hardy1949`;
  - `katznelson2004`, Chapter I.
- The `ieantn-*` files state their conclusions as `Prop` definitions. I checked them as statement locators; their proofs are not part of what is cited, and I did not check them.

## Source issues

- **Misprint** in kontorovichtao-pntplus at Lemma 4.1.4, printed p. 17 (line 636): the source says the rectangle integral of `g + A/(s − p)` is `A`; it should be `2πiA`, or `A` for the `1/(2πi)`-normalised integral of Definition 4.1.2; affects nothing.
- **Gap** in kontorovichtao-pntplus at Lemma 4.3.9, printed p. 27 (line 1107): the source gives `𝓜(1̃_ε)(s) = 𝓜ν(εs)/s` with no condition on `s`; it should assume `Re s > 0`, since `1̃_ε = 1` near `0`; affects a stated result.
- **Error** in kontorovichtao-pntplus at Theorem 4.5.3, printed p. 37 (line 1502): the source says `ψ_ε(X) = ψ(X) + O(εX log X)` with no condition on `ε`; it should be `O((εX + 1) log X)`, since at `X = 2` the difference stays `(log 2)/2` as `ε → 0`; affects a stated result.
- **Gap** in kontorovichtao-pntplus at Sublemma 8.1.11, printed p. 76 (line 3047): the source bounds a tiny prime's deficit by `M log n + M L π(n)`; its proof (up to `L` copies in each of up to `M L π(n)` removed factors) gives `M L² π(n)`; affects nothing.
- **Gap** in kontorovichtao-pntplus at Sublemma 8.1.17, printed p. 77 (line 3088): the source sums `(M log n + M L π(n)) log L` over `p ≤ L`; with the deficit bound its proofs give, the term is `M L² π(n)`, still `o(n)`; affects nothing.
- **Gap** in kontorovichtao-pntplus at Sublemmas 8.1.9–8.1.10, printed pp. 75–76 (lines 3039, 3044): the source bounds surplus and deficit by `M log n`; its proof (at most `log n/log 2` powers of `p`) gives `M log n/log 2`; affects nothing.
- **Gap** in kontorovichtao-pntplus at Theorem 9.1.36, printed p. 84 (line 3353): the source states `ζ(s)³ = ζ(2s) Σ τ(n²) n^{−s}` with no half-plane; it should restrict to `Re s > 1`, as Theorem 9.1.50 does; affects a stated result.
- **Gap** in kontorovichtao-pntplus at Theorem 9.1.68, printed p. 89 (line 3605): the source states `L(λ, s) = ζ(2s)/ζ(s)` with no half-plane; it should restrict to `Re s > 1`; affects a stated result.
- **Misprint** in kontorovichtao-pntplus at Lemma 3.1.3, printed p. 6 (line 187): the statement ends by naming an absolute constant `C` that does not occur in it; the clause should be deleted; affects nothing.
- **Misprint** in kontorovichtao-pntplus at the proof of Lemma 4.3.4, printed pp. 24–25 (lines 985, 1006): the proof cites "Lemma 4.3.1" and "Theorem 4.3.5" for steps that are Corollary 4.3.1 and Lemma 4.3.3; affects nothing.
