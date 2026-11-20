# Review of StandardDistributions (pull request #2682 at 50d92b1)

**Verdict:** needs changes

**Summary.** Two Checks state something false. The Jacobian Check of §6.2 says that Muirhead's one-based exponent gives a wrong value, but it gives the right one. A sphere-coordinate Check of §12.1 gives the semicircle law variance `1/5`, which contradicts the `1/4` of §10.20. The real Wick–Isserlis formula, a headline of `Suggested.lean`, is also planned by RandomMatrices §2.5 on main, so it has two owners. Every other sampled statement, headline and Check value recomputes correctly, and `Suggested.lean` elaborates with `sorry` as its only warning. There are two small corrections and two format notes, none blocking. The human reviewers have three questions: the scope of the sources, a newer Tau Ceti that already proves some headlines, and a main source that could not be read.

## R01 (P2) — The last Check of §6.2 says that counting rows from one with exponents `p − i + 1` gives `4x³z²`, but it gives `4x²z`, the correct value

A reader who compares §6.2 with Muirhead's form of the Cholesky Jacobian, which counts rows from one with exponent `p − i + 1`, is told that this form is wrong. The Check (line 2627) says: "Counting rows from one, with exponents `p − i + 1`, would give `4x³z²` instead."

For `p = 2` and rows `i = 1, 2`, the exponents `p − i + 1` are `2` and `1`, which gives `2² · x² · z = 4x²z`. This is the Jacobian determinant of `(x, y, z) ↦ (x², xy, y² + z²)`, which is `2x · x · 2z`, the same value the Check computes two lines earlier. The value `4x³z²` comes only from applying `p − i + 1` to the zero-based index `i.val` of the formula at line 2600.

Smallest change: "Applying the one-based exponent `p − i + 1` to the zero-based index `i.val` would give `4x³z²` instead."

## R02 (P2) — A Check of §12.1 gives the semicircle law variance `1/5`, but it is `1/4`, as §10.20 states

The Check at lines 8247–8248 says that Beta parameters `(d/2, d/2)` "would give the semicircle law, of variance `1/5`". At `d = 3` these parameters are `(3/2, 3/2)`. For `Y ∼ Beta(3/2, 3/2)`, the variable `2Y − 1` has density `(2/π)√(1 − x²)` and variance `4 · Var Y = 4 · 1/16 = 1/4`.

§10.20 defines the semicircle law in exactly this way (line 7457), and its own Check gives the variance as `1/4` (line 7535). The value `1/5` belongs to the parameters `(2, 2)`, which give the ball coordinate density `(3/4)(1 − x²)`. The Check still tells the right law from the wrong one, since `1/3 ≠ 1/4`.

Smallest change: replace "`1/5`" by "`1/4`". If the ball's parameters were meant, write instead "parameters `((d + 1)/2, (d + 1)/2) = (2, 2)` would give the density `(3/4)(1 − x²)`, of variance `1/5`".

## R03 (P2) — The real Wick–Isserlis formula has two owners: §5.3 here and RandomMatrices §2.5 on main

`integral_prod_sub_multivariateGaussian_eq_sum_perfectMatching` is a headline of `Suggested.lean` (line 54), and §5.3 asks for it (line 1961). RandomMatrices on main asks for the same theorem: "Prove Gaussian integration by parts (AGZ Lemma 2.4.5), real and complex Wick/Isserlis formulas" (`TauCetiRoadmap/RandomMatrices/README.md`, line 560). An implementer may therefore build it twice.

Three open roadmaps already cite §5.3 as the owner:
- ConstructiveFieldTheoryPhi4 (#2432), in its README under "Gaussian moments" (line 722) and in 6.4;
- FreeProbability (#2575), lines 1330, 1639 and 1863;
- HabiroNahmSeries (#1427), line 2175.

RandomMatrices itself takes the multivariate Gaussian laws from this roadmap (its "Owned elsewhere", line 46), so this roadmap is the natural owner.

Smallest change here: say under Scope and ownership, or in the RandomMatrices entry of Downstream consumers (line 9720), that §5.3 owns the real Wick–Isserlis formula, and that RandomMatrices §2.5 uses it while keeping the complex formula and Gaussian integration by parts. The next revision of RandomMatrices would then cite §5.3 for the real case.

## C01 — `map_uniform_quantile` is the pinned `MeasureTheory.Measure.map_quantile_volume_Ioo` up to the null set `{1}`, so as a target it asks an implementer for nothing

On a copy of `Suggested.lean` the theorem closes with one tactic:

    simpa [TauCeti.Probability.uniformMeasure_eq_smul, MeasureTheory.restrict_Ioo_eq_restrict_Ioc] using MeasureTheory.Measure.map_quantile_volume_Ioo μ

The pinned theorem is at `TauCeti/Probability/Quantile.lean`, line 858. Yet the module docstring counts this theorem among the headline theorems "that the pinned libraries do not prove". Scope and ownership also lists "the quantile pushing the uniform law forward to `μ`" among the targets the pins do not state (line 9773). §7.2 itself describes it accurately (line 3255).

Smallest repair: mark it in its docstring as a sanity check that ties the interval uniform law of §0.3 to the pinned theorem, and drop the item from the Scope list. Moving it to §7.2 as a Check would also do.

## C02 — Most locators name a whole book or volume, and several sampled sections cite nothing at the claim, so a reader cannot find the statements

Examples:
- "(Johnson, Kotz and Balakrishnan, vol. 1)" in §3.6 and §7.1;
- "(Billingsley)" in §0.1–§0.4;
- "(Anderson 2003)" in §5.4;
- "(Eaton)" in §5.1–§5.3.

§7.8, §14.4 and §15.5 cite nothing at the claim. No stated result is left unsupported, because every statement already proved rests on a declaration at the pin.

Add chapter, theorem or page locators. For the texts that are openly readable:
- **Nolan's chapter 1**, the one the References link to:
  - Definition 1.7 (the S₀ characteristic function, §15.1);
  - (1.7) (the S₁ location);
  - Lemma 1.10 (the support, §15.4);
  - Theorem 1.12 (the tails, §15.5; stated there for `−1 < β ≤ 1`);
  - p. 15 with Problem 1.11 (the moment threshold).
- **§10.17**: Johnson, Kotz and Balakrishnan, vol. 2, pp. 502–503, where the R documentation places the ratio and Poisson-mixture definitions.

## N01 — `Nat.succ` is filed under Mathlib's `Init.lean` in the §9.10 contract (line 9899), but it is a Lean core declaration and is not in that file.

## N02 — "Design references" (lines 10087–10096) cites Mathlib pull-request numbers and a Zulip thread. Where these have merged, the Mathlib declarations they produced would be a more durable citation.

## Verified sound

| Statement | Instances tried | Values computed, each side | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 Density interfaces | Gaussian `v = 0`; Cauchy `γ = 0`; Gamma, all `a, r` | `δ_m{m} = 1` vs Lebesgue `0`; pdf `= 0` a.e. both sides; Gamma bridge has no positivity hypothesis (Gamma/PDF.lean:68) | agrees | none |
| 3.6 Inverse-gamma | `a = 3, r = 2`; `q = −1`; `1/Y` change of variables | mean `1`, variance `1`; `E[X⁻¹] = a/r`, the Gamma mean; density `rᵃx^(−a−1)e^(−r/x)/Γ(a)` | agrees; signatures match | none |
| 3.7 Student t | `ν = 1, x = −1`; `ν = 2, x = −1`; `ν = 3` | `F = 1/4 = 1/2 + arctan(−1)/π`; `I_(2/3)(1, 1/2)/2 = 0.21132` = closed form; swapped `0.408`; variance `3` | agrees | none |
| 4.5 Gamma-mixed Poisson | mass at `0`; moments; scale reading; `a = 0` | `(β/(β + 1))^r = p^r`; variance `r(1 − p)/p²`; scale gives `(1 − p)^r`; `NB(r, 1) = δ₀` | agrees | none |
| 5.4 Conditional Gaussian | `(Z, tZ)`; `Z` observed through `(Z, Z)`; `S₂₂ = diag(1, 0)` | slope `1/t`, residual `0` vs `N(0, 1)` at `t = 0`; `J⁺ = J/(4v)`, weights `(1/2, 1/2)`, residual `0`; `N(m₁ + b(u − m₂,₁), a − b²)` | agrees | none |
| 7.1 Affine transport | `δ₀, b = −1`; Exp(1), `b = −2`; `N(0, 1)`, `1 + 2x` | cdf `1 = 1 − μ(Iio 0)`; `D = (−1/2, ∞)` vs `(−2, ∞)`; `e^(t + 2t²)` = mgf of `N(1, 4)` | agrees | none |
| 7.8 Exponential tilting | `N(0, 1)` by `t`; Exp(1) by `2`; `Bin`, `p = 1/2`, `t = log 3` | `e^(ts + s²/2)`; zero measure; `p' = 3/4`; pinned domain `(t + ·)⁻¹' D` | agrees | none |
| 9.1 Finite uniform, categorical | die; `[2, 1]`; Rademacher `u = 1/2`; aggregation | mean `7/2`, variance `35/12`, `Q(1/2) = 3` (floor gives `4`), `M(log 2) = 21`; zero measure; `Q = −1`; `(0.2, 0.8)` | agrees | none |
| 10.2 Gumbel and GEV | `ξ = 1/2`; `ξ = 1`, `n = 2`; Fréchet `(2, 3)`; reversed Weibull `(2, 3/2)`; `D` table | mean `2(√π − 1) = 1.545`; `F² = GEV(m + s, 2s, 1)`; `e⁻¹`; `e^(−4/9) = 0.641`; `ξ = −1`: `(−1/s, ∞)` | agrees; SciPy's `c = −ξ` | none |
| 10.10 Uniform sums, bounded laws | `IH(2)` vs `Tri(0, 2, 1)`; `IH(3)`; triangular moment `n = 1`; `Kum(2, 3)` | variance `1/6` both; `F(1) = 1/6`; `(0, 1, 1/2)` gives `1/2`; `3B(3/2, 3) = 16/35` | agrees | none |
| 10.15 Logit-normal, log-uniform | `m = 1, v = 1`; `(a, b) = (1, e)` | mean `0.69673` (numerical) vs median `0.73106`; median `√e`, mean `e − 1`, `E[1/X] = 1 − e⁻¹` | agrees | none |
| 10.17 Noncentral Beta | `a = b = 1, λ = 2`; `a = 0, λ = 2`; ratio convention | mean `1 − e⁻¹ = 0.632`; weights of mean `λ` give `0.716`; atom `e⁻¹` | agrees with R doc | C02 (page) |
| 10.19 Hyperexponential | `p = (1/2, 1/2)`, rates `(1, 2)`; `p = (1, 0)`, rates `(2, −5)` | mean `3/4`, `E X² = 5/4`, variance `11/16`, `D = (−∞, 1)`; Exp(2) | agrees; pinned domain over active indices | none |
| 14.4 LKJ marginals | `p = 2, η = 1, 2`; `p = 3, η = 1` | density `1/2`; `(3/4)(1 − r²)`, `E det = 4/5`; variance `1/4 = 1/(2η + p − 1)`; semicircle and uniform `z` | agrees | none |
| 15.5 Moments and tails (headlines) | Cauchy `α = 1`; Lévy `α = 1/2, β = 1`; fractional formula at `α = 1, 2` | `C₁ = 1/π`, `xP → s/π`; `2C_(1/2)s^(1/2) = √(2s/π)`; `s^q/cos(πq/2)`; `N(0, 2s²)` moments | agrees with Nolan Thm 1.12 | C02 |
| Wick–Isserlis (headline) | `κ` empty; `2, 4, 6` positions; `S` not PSD | `1 = 1`; `S_(j₀j₁)`; three pairings; `15S₁₁³`; non-PSD: `N = δ_m`, so LHS `0` ≠ RHS | PSD needed and present | R03 |
| Gram rank (headline) | `ν = 0`; `S = 0`; `S` not PSD; `ν = 1, p = 2, S = I` | rank `0 = min`; `δ₀` rank `0` vs rank `S`; rank `1` | PSD needed and present; pin has only `≤` | none |
| `map_uniform_quantile` | `uniformMeasure 0 1` vs `volume` on `(0, 1)` | `cond volume (Ioc 0 1) = volume.restrict (Ioo 0 1)`; one `simpa` from the pinned theorem closes it | padding | C01 |
| LKJ normalization (headline) | `p = 0, 1, 2, 3`, `η = 1` | `1`; `B(1/2, η)`; Jacobian exponents `1/2, 1/2, 0` give `2 · (π/2)² = π²/2` | agrees | none |
| LKJ law, entries, partial correlations (headlines) | `p = 2`; `p = 3, η = 1` | `Beta(η, η)`; `α = 3/2`; `β_c = η + (p − c − 2)/2` gives `3/2, 3/2, 1` | agrees with direct Jacobian integration | none |
| LKJ determinant moments (headlines) | `p = 2, η = 1`, `q = 1, −1`; `p = 0, 1` | `2/3 = B(1/2, 2)/B(1/2, 1)`; diverges at `q = −η`; both sides `1` | agrees; `p ≥ 2` needed for the iff | none |
| Stable support (headline) | `α = 1/2, β = ±1`; `α = 1, β = 0`; `α = 2` | `[m − s, ∞)`; `(−∞, m + s]`; `ℝ`; `ℝ` | agrees with Nolan Lemma 1.10 | none |
| Stable exponential domain (headline) | `α = 1/2, β = 1, s = 1, m = 0, t = −1/2`; Cauchy; Gaussian | `K = −1/2` both sides; `D = {0}`; `ℝ`, `K = mt + s²t²` | agrees | none |
| 6.2 Jacobian Check | `p = 2`, `L = [[x, 0], [y, z]]` | determinant `4x²z`; one-based `p − i + 1` gives exponents `2, 1`, so `4x²z`, not `4x³z²` | false sentence | R01 |
| 12.1 sphere coordinate Check | `d = 3`, parameters `(3/2, 3/2)` | `Var(2Y − 1) = 1/(2α + 1) = 1/4`; §10.20 says `1/4`; Check says `1/5` | false value | R02 |
| 6.4–6.5 Wishart Checks | `p = 3, n = 3, Θ = S = 1`; `p = 2, n = 3` | `(−11 + 2i)^(−3/2) = −(1 − 2i)^(−9/2)`; `E det W = 6` both ways | agrees | none |

- Source locators checked against the text, all agreeing with the README:
  - Nolan2020 ch. 1: Def. 1.7 (lines 534–548), (1.7) (lines 666–675), Lemma 1.10 (lines 698–714), Thm 1.12 (lines 791–810), moments (lines 825–828);
  - RBetaDoc lines 85–91 and 122–123;
  - DLMF817 lines 704–735;
  - StanCorr lines 175–177;
  - SciPyGEV lines 213–221.
- Library declarations: about 180 signatures in the sampled sections were opened at the pin, and their hypotheses match the README. Examples: `cdf_inverseGammaMeasure_eq` (InverseGamma/Cdf.lean:35), `condDistrib_multivariateGaussian` (Gaussian/Conditional/Basic.lean:532), `lkjNormalizer` (LKJ/Normalizer.lean:56), `stableMeasure` (Stable/Basic.lean:69). Each of the 3,905 supplier-contract names was found in the file it is filed under, except `Nat.succ`.
- The headlines are absent at the pin:
  - no LKJ measure;
  - no stable support, moment, tail or domain theorem;
  - the Gram rank only as `≤` (Wishart/Basic.lean:322);
  - Wick–Isserlis only in degree 4 (Gaussian/MixedMoments.lean:146–178).
- Cross-roadmap citations:
  - OptimalTransport §3.7 resolves (main, line 1920).
  - On main, the citations of Layers 1–2, §8.1, §9.3, §12.1 and §12.2, and the two anchors, resolve at this head.
  - At open heads, GaussianLinearModels' 4.1, 4.2, 10.5 and 10.6 and three citations of §5.3 resolve.
- All 359 Check bullets were read and their numerical values recomputed. Some needed numerics: logit-normal mean `0.69673`; discrete Gaussian `0.21501`, `0.27842`, `1.29874`; lattice sum `2.00530`, `2.15137`, `7.50902`; noncentral χ² density `0.17225`. Two are false (R01, R02).
- Automatic checks: all passed, and none was set aside. Dependency check: `depcheck: 182 roadmaps, 2091 edges, 0 problem(s)`, with no UPWARD or CYCLE line. There is no change outside the folder.
- Elaboration: 14 "declaration uses `sorry`" warnings and nothing else. The 15 elaborated signatures were compared with the README: no binder was lost, and nothing changed. The probe with `rfl`, `infer_instance`, `simp` and `simp_all` leaves every theorem open; only `map_uniform_quantile` closes, with one `simpa`.

Overlap check: read GaussianLinearModels, PoissonApproximation, RandomProjectionsAndSketching, MathematicalStatisticsHigherOrderAndResampling, MathematicalStatisticsFoundations, MathematicalStatisticsAsymptotic, RandomMatrices, OptimalTransport and ConstructiveFieldTheoryPhi4. Shared objects and their owners:
- chi-squared, t, F and the noncentral laws: here (GaussianLinearModels cites 4.1, 4.2, 10.5, 10.6);
- the Poisson-binomial law: here, §9.4 (PoissonApproximation cites it);
- the Gram Wishart and uniform ball laws: here (RandomMatrices and RandomProjectionsAndSketching cite them);
- uniform order statistics: here (MathematicalStatisticsFoundations builds the general densities);
- the quantile: OptimalTransport §3.7;
- the real Wick–Isserlis formula: planned both here and in RandomMatrices §2.5 (R03).

Source independence: 10 passages compared with 5 sources (Nolan2020, RBetaDoc, DLMF817, StanCorr, SciPyGEV); nothing is shared beyond forced formulas. The largest share of locators is Johnson–Kotz–Balakrishnan's, about 52 of 180. Contents were not compared because that text is not readable. The layers (interfaces, special functions, generic operations, matrix laws) follow no handbook chapter order.

Research link: Layers 6, 14 and 15 state the Wishart theory (Muirhead 1982; the branch issue of Mayerhofer 2019), the LKJ partial-correlation construction (Lewandowski, Kurowicka and Joe 2009) and the stable laws (Nolan 2020) that RandomMatrices and the statistics roadmaps consume. This rests on the README's References and Downstream consumers and on Nolan2020 ch. 1.

## Not verifiable

- Johnson–Kotz–Balakrishnan (1994, 1995), Johnson–Kemp–Kotz (2005), Muirhead (1982), Anderson (2003), Eaton, Billingsley (1995), Coles (2001), Azzalini–Capitanio, Mardia–Jupp, Fisher: books, for which no legal copy is known.
- Lewandowski, Kurowicka and Joe 2009: the Elsevier DOI is paywalled, so the sources service recorded it as uncertified. The LKJ statements were checked by direct computation instead.
- Heyde 1963: the publisher's page returned HTTP 403.
- Aitchison and Shen 1980, and the PyMC logit-normal page: not read.

## Source issues

- none

## For the human reviewers

- Scope: the subject is the standard probability laws. The located sources are handbooks (Johnson–Kotz–Balakrishnan, Johnson–Kemp–Kotz, Muirhead), and several conventions rest on software documentation (SciPy, R, PyMC, Stan; README lines 10065, 10083). Twelve roadmaps on main consume this one.
- Pin: `STATUS.md` in this folder reports that Tau Ceti at aa6e43e (2026-11-13) proves the independence of the LKJ partial correlations and stable support and moment results. The pin is 2fd255d (2026-11-04), where these are absent. After a pin bump, several `Suggested.lean` headlines would restate library declarations.
- Not tested: Johnson–Kotz–Balakrishnan, the source with the most locators, could not be read, so neither the wording nor the arrangement was compared with it.
