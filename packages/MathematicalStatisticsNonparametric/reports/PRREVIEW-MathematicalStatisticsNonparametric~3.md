# Review of MathematicalStatisticsNonparametric (pull request #2368 at ec0b560)

**Verdict:** needs changes

## R01 (P1) — 5.5: the boundary mean squared error is not its leading term times `1 + o_P(1)`

**Location:** `README.md` lines 1806–1812: "the conditional mean squared error `Bias² + Var` of `m̂_ν(x₀)` is, for every `p ≥ ν`, its interior leading term with `K*_ν` replaced by the boundary kernel … times `1 + o_P(1)`"; `Suggested.lean` lines 1947–1976 (`tendstoInMeasure_localPolynomial_boundary`, limit `fun _ ↦ 1`).
**Claim:** The ratio of `bias² + variance` to `B² h^{2(p+1-ν)} + V/(n h^{1+2ν})` tends to `1` in probability under the stated hypotheses. It fails whenever the leading bias coefficient `B` vanishes: the true bias is then of lower order but need not be small against the variance.
**Witness:** `p = ν = 0`, `c = 1`, `K = ½ 1_{[-1,1]}`, `X ~ U[0,1]`, `Y = X² + N(0,1)`, `h = n^{-1/6}`: `B = 0`, bias `4h²/3 - h² = h²/3`, variance `1/(2nh)`; ratio `1 + (2/9) n h⁵ = 1 + (2/9) n^{1/6} → ∞`.
**Repair:** State the two limits, as in the interior theorem. README: "for every `p ≥ ν`, conditionally on the design, `n h^{1+2ν} Var m̂_ν(x₀) → ν!² ∫ K*_{ν,c}² σ²(0+)/f_X(0+)` and `Bias m̂_ν(x₀) / h^{p+1-ν} → ν!/(p+1)! (∫ t^{p+1} K*_{ν,c}) m^{(p+1)}(0+)`, both in probability", and delete the sentence on `σ²(0+) > 0`. Lean: replace the conclusion by

      TendstoInMeasure μ (fun (n : ℕ) ω ↦ n * h n ^ (1 + 2 * (ν : ℕ)) *
          (((ν : ℕ).factorial : ℝ) ^ 2 * ∑ i : Fin n, localPolynomialCoeff K (h n) p
            (fun j : Fin n ↦ (Z j ω).1) (Pi.single i 1) (c * h n) ν ^ 2 * s2 (Z i ω).1) -
          ((ν : ℕ).factorial : ℝ) ^ 2 * (∫ t, equivalentKernel (Ici (-c)) K p ν t ^ 2) * s2 0 /
            fX 0) atTop (fun _ ↦ 0) ∧
      TendstoInMeasure μ (fun (n : ℕ) ω ↦
          (((ν : ℕ).factorial : ℝ) * localPolynomialCoeff K (h n) p (fun j : Fin n ↦ (Z j ω).1)
              (fun j : Fin n ↦ m (Z j ω).1) (c * h n) ν -
            iteratedDerivWithin ν m (Ici 0) (c * h n)) / h n ^ (p + 1 - (ν : ℕ)) -
          ((ν : ℕ).factorial : ℝ) / ((p + 1).factorial : ℝ) *
            (∫ t, t ^ (p + 1) * equivalentKernel (Ici (-c)) K p ν t) *
            iteratedDerivWithin (p + 1) m (Ici 0) 0) atTop (fun _ ↦ 0)

  On the witness: `n h · 1/(2nh) - ½ = 0` and `(h²/3)/h - 0 = h/3 → 0`. The file with this conclusion elaborates with `sorry` warnings only.

## R02 (P3) — Two facts the pins already state are restated or cited at a weaker declaration

**Location:** `Suggested.lean` lines 2862–2864 (third conjunct of `fpca_consistency`); `README.md` lines 2773–2774: "Tau Ceti `abs_singularValues_sub_singularValues_le` for the Lipschitz bound in finite rank and `singularValue_eq_iInf_nnnorm_comp_orthogonal` in general"; `README.md` lines 2699–2701: "Uniqueness by `Measure.ext_of_charFunDual`".
**Claim:** What exists at the pins is cited by its exact name and not restated. The Lipschitz bound for approximation numbers of bounded operators and the uniqueness of a Gaussian measure on a Hilbert space given mean and covariance are both pinned declarations.
**Witness:** Tau Ceti `Analysis/OperatorIdeal/ApproximationNumber/Basic.lean` line 186, `ContinuousLinearMap.abs_singularValue_sub_singularValue_le (S T) (n)`: `|aₙ(S) - aₙ(T)| ≤ ‖S - T‖`. Mathlib `Probability/Distributions/Gaussian/CharFun.lean` line 186, `IsGaussian.ext`.
**Repair:** Delete the third conjunct of `fpca_consistency`; in 8.6 write "`|λ̂_j - λ_j| ≤ ‖Ĉ_n - C‖` is Tau Ceti's `ContinuousLinearMap.abs_singularValue_sub_singularValue_le`", put that name in the `*Needs:*` line and in the Tau Ceti contract in place of the two names quoted. In 8.4 and the Mathlib contract cite `IsGaussian.ext` for the uniqueness step of `eq_gaussianHilbert`.

## R03 (P3) — Padding in `Suggested.lean`

**Location:** `Suggested.lean` lines 264 (`sqHellinger_pi_const`), 271 (`hellingerAffinity_le_map`), 303 (`klDiv_pi_const`), 362 (`ofReal_tvDist_sq_le_two_mul_klDiv`), 368 (`ofReal_log_one_add_chiSqDiv_le`), 1060 (`gnedenkoKorolyuk_of_lt`), 2815 (`isProbabilityMeasure_gaussianHilbert`), 552–553 (second and third conjuncts of `max_measure_ge_of_packing`).
**Claim:** The file states headlines only: no declaration that follows in one tactic from the library or from a neighbour, no boundary case, no computed value.
**Witness:** On a copy: `simpa [tvDist] using TauCeti.etvDist_sq_le_two_mul_klDiv`, `simp [klDiv_pi]`, `simp [sqHellinger, hellingerAffinity_pi]`, `simpa [Measure.deterministic_comp_eq_map] using hellingerAffinity_le_comp …` close the first four; line 368 is `log (1 + x) ≤ x`; line 1060 is the case `k > n`; line 553 is `0.24 < 1 - 1/8 - log 2 / log 3`.
**Repair:** Delete the seven declarations from `Suggested.lean` and keep only the first conjunct of `max_measure_ge_of_packing`. The README keeps each statement as prose; remove the backticks from the deleted names there.

## R04 (P3) — Five Lean names do not appear in the README

**Location:** `Suggested.lean` lines 90 (`IsStatisticalTest`), 105 (`empiricalCdf`), 117 (`firstN`), 2599 (`logConcaveDensities`), 2848 (`empiricalCovariance`).
**Claim:** Every Lean name appears in the README. These five objects are described there only by symbols (`𝓕_d`, `Ĉ_n`, `F̂ₙ`) or not at all.
**Witness:** A search of `README.md` for each of the five names returns nothing; 7.5 line 2489 writes "Let `𝓕_d` be", 8.6 line 2739 "the empirical covariance `Ĉ_n = …`".
**Repair:** 7.5: "Let `logConcaveDensities d`, written `𝓕_d`, be …". 8.6: "the empirical covariance `empiricalCovariance x = Ĉ_n = …`". Layer 4 opening: "`firstN X N` is the sample of the first `N` terms of a sequence `X`". Foundations contract: "1.3: statistical tests `IsStatisticalTest` …" and "9.1: the empirical distribution function `empiricalCdf` …".

## R05 (P3) — A pull-request reference, and five results with an author and a year only

**Location:** `README.md` lines 2890–2893 ("The Mathlib pull request [#27579] …"); lines 1052 (Gnedenko and Korolyuk, 1951), 1349 (Chernoff–Savage, 1958), 1395 (Hodges and Lehmann, 1963), 1654 (Parzen, 1962), 1845 (Stone 1977); lines 24–26.
**Claim:** A README carries no pull-request reference, and lines 24–26 say each restated headline has a locator "with its printed page". This is the unrepaired part of R05 of the previous review.
**Witness:** The bullet at 2890–2893 is unchanged; the five targets still cite no theorem or page, while the References give the page ranges 525–528, 972–994, 598–611, 1065–1076 and 595–645.
**Repair:** Delete the bullet at 2890–2893 (Mathlib's `minimaxRisk` is already in the contract). At each of the five targets write the theorem or equation number and printed page of the paper; where that cannot be supplied, remove the paper from the parenthesis, so that the target stands on the secondary locator already given and its proof route.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.2 Le Cam | normal mean, `θ₁ = n^{-1/2}`; `n = 0` in `max_measure_ge_of_pi`; `s < 0` | `(1/(4n)) · max(0.1516, 0.25) = 1/(16n)`; `e₀ + e₁ ≥ 1`, so `½ ≤ max`; both sets are everything, `1 ≥ ½` | holds | none |
| 2.4 Fano | four Diracs; `M = 2` equal laws; packing with `M + 1` laws; `M = 2` Diracs in the mixture identity | `-1/2 ≤ 0`; `0 ≤ 1/2`; `1 - (α log M + log 2)/log (M+1) ≥ 1 - α - log 2/log 3 = 0.2441`; both sides `log 2` | holds | R03 (two conjuncts) |
| 3.4 Hodges–Lehmann | `(1,2,6)`; `a = -1`; `a = 0`; `θ` equal to the upper median | medians `2`, `3.5`, value `2.75`; `-2.75`; `0`; then `θ` is a Walsh average, excluded, so the strict inequality holds | holds | none |
| 3.6 Kolmogorov and CvM laws | `x = 1`; integer `n D`; `n = 0`; moments | `1 - 2(e^{-2} - e^{-8} + e^{-18}) = 0.73000`; `nD < y ⟺ nD < ⌈y⌉`; both sides `1`; `1/6`, `(2/π⁴)(π⁴/90) = 1/45` | holds | none |
| 4.1 projection and rank CLT | `N = 2`, `φ u = u`, `c = (1,0)`; constant `c`; means | approximating sum `½ + (u₀-u₁)/2`, Hájek `½ + (u₀-u₁)/3`; `0/0 = 0`; both `N c̄ ā` since `∑ (c_i - c̄) = 0` | holds | none |
| 4.2 classical limits | Kendall; signed rank; Kruskal–Wallis `k = 1`; exact `E H` | `4 · 1/9 = 4/9`, `n · 2(2n+5)/(9n(n-1)) → 4/9`; `Var(2W⁺)/n³ → 1/3`; `H = 0`, `χ²₀ = δ₀` at the pin; `(k-1) + 3(N+1) - 3(N+1)` | holds | none |
| 4.7 CvM and two-sample limits | cosine identity at `u = 0`; mean; `P ≠ Q` | `(1 - (-1)^j)/(jπ) + (-1)^j/(jπ) = 1/(jπ)`; `1/6` for every `n`; right-continuous distribution functions differ at a rational | holds | none |
| 6.2 Sobolev ellipsoids | weights at `j = 1, 2, 3` | `0`, `2^β`, `2^β`: `(2/3)^β j^β ≤ a_j ≤ j^β` for `j ≥ 2`, the hypothesis of `gaussSeqMinimax_two_sided`; named in the docstring as not stated | holds | none |
| 6.6 detection boundary | `m = (R/ρ)^{1/β}`; `ρ > R`; fixed `ρ` | `∑_{j ≤ m} j^{2β} ρ²/m ≤ R²`; exponent `n² ρ^{4+1/β} R^{-1/β}/2 → 0 ⟺ ρ ≪ n^{-2β/(4β+1)}`; empty alternative, `0`; `ρ² ≫ ε² √m` | holds | none |
| 7.1 isotonic least squares | `y = (3,1,2)`; weights `(1,2)`, `y = (2,1)`; index of the left slope | `(2,2,2)`, loss `2` against `5`; `4/3` against `3/2`; `W = ∑_{j ≤ i} w_j` is point `k = i + 1` of the diagram | holds | none |
| 7.2 isotonic risk | constant `θ*`; `n = 1` | `C log(e n)/n`; bounded normal mean with `τ = 1`, risk bounded below by a constant | holds | none |
| 7.3 Grenander | sample `(1,3)`; `a = ¼`; `a = ½`; uniqueness at a point of `(x₍ᵢ₋₁₎, x₍ᵢ₎)` | `½`, `¼`, integral `1`; maximizers `{1,3}`, `ŝ = 1`; `{0,1}`, `ŝ = 0`; `f > ĝ` there forces positive excess mass | holds | none |
| 7.5 log-concave | KimSamworth16 lines 170–174, 183; `d = 0`; closed versions | `h² = ∫ (√f - √g)²`; `c_d` for each `d`, `n ≥ d + 1`; `f = 1`, value `0`; a closed concave function is fixed by its interior values | holds; previous R02 repaired | R04 (name) |
| 8.3 Karhunen–Loève and principal components | `C = diag(½, 2)`; `k = 0`; `λ_j = 0` | `λ = (2, ½)`, `span e₂`, residual `½`; tail `= E‖X - m‖²`; score mean `⟪E(X - m), φ_j⟫ = 0` for arbitrary `φ_j` | holds | none |
| 8.6 functional principal components | `x = (0,2)`; Gaussian `X`; operator Lipschitz bound | `Ĉ₂ = 1`, `2` with `(n-1)⁻¹`; `2λ_j²`; third conjunct is the pinned lemma | holds | R02, R04 |
| 1.4 comparison inequalities | `N(0,1)`, `N(1,1)`; pin normalization | `0.2350 ≤ 0.76585 ≤ 0.9406`, `0.5865 ≤ 1`; `tvDist = (etvDist).toReal`, `2` for singular laws | holds | R03 (two declarations) |
| 2.3 Varshamov–Gilbert | `m = 8`, `16`; exponent | `256/9 = 28.4`, `65536/137 = 478`; `2(3m/8)²/m = 9m/32`, `e^{2.25} = 9.49 ≥ 3` | holds | none |
| 2.5 Assouad | `m = 0`; metric form; `α < 0` in the Hellinger form | `0 ≤ 0`; `(c/4)(m/2) = cm/8`; forces `m = 0`, `0 ≤ 0` | holds | none |
| 4.3–4.4 power and Chernoff–Savage | logistic; Laplace; uniform | `(1/6)/(1/√12) = 1/√3 = √I_f`; `2 · (2/π) = 4/π`; `∞ ≥ 1` | holds | none |
| 4.5 Hodges–Lehmann limit and influence function | median equation at `ε = 0`; normal | `T' = (2F(x-θ) - 1)/(2∫f²)`; variance `(1/12)/(∫f²)² = π/3` | holds; previous R04 repaired | none |
| 4.6 DKW bound | maximum of `2(n+1)` sub-Gaussians; McDiarmid with `1/n` | `√(2 · (1/(4n)) · log(2n+2))`; `exp(-2t²/(n · n⁻²)) = exp(-2nt²)` | holds | none |
| 5.2 optimal bandwidth and coverage | stationarity; Gaussian case, `κ = 1` | `h⁵ = B/(An)`, minimum `(5/4) A h⁴`; `b = -0.5946`, coverage `0.9086 < 0.95` | holds | none |
| 5.4 leave-one-out fits | Nadaraya–Watson with `∑ K = 0`; signed kernel | both sides `0`; `L i i = 0`, formula `0`, true fit `Y j` | holds | none |
| 5.5 boundary | `p = ν = 0`, `c = 1`, `m = x²`, uniform design, `h = n^{-1/6}` | `B = 0`; bias `h²/3`; variance `1/(2nh)`; ratio `1 + (2/9) n^{1/6}` | false | R01 |
| 5.5 local linear | remainder | `√(nh) · o(h²) = o(√(n h⁵)) = o(1)` | holds | none |
| 5.8 smoothing splines | zero-based `Q`, `R` at `n = 3`, `t = (0,1,2)` | `Q = (1,-2,1)ᵀ`, `R = (2/3)`, `∫ g''² = 6 = (3/2) · 4` | holds | none |
| 6.3 Pinsker | Johnstone17 lines 7890–7906, 8083, 8245–8256; `a_j = j`, `C = 1` | condition (ii) in white noise is `1/#{aᵢ ≤ μ/2} → 0`, automatic; `3^{1/3} 2^{-2/3} = 0.9086` | holds | none |
| 6.4 soft thresholding | Johnstone17 lines 11736–11753, 11760, 11812, 12158–12164; `n = 1` | `e^{-λ²/2}` for all `λ`; lemma for `λ > 0`, `λ = 0` gives risk `1`; `σ² ≤ σ² + min` | holds | none |
| 6.5 chi-bar-squared | orthant; weight at `j = 0` | `½ · 0.1 + ¼ · e^{-1.353} = 0.1146`; `chiSquaredMeasure 0 = δ₀` at the pin | holds | none |
| 7.4 cube-root limit | scaling constant | `2c (σ/c)^{2/3} = 2^{2/3} |f' f|^{1/3} = |4 f' f|^{1/3}` | holds | none |
| 8.2, 8.4 eigen-expansions and Gaussian measures | index convention at the pin; uniqueness | `singularValue T n` is the infimum over rank `≤ n`, `a₀ = ‖T‖`; `nuclearENorm = ∑' n, singularValue n`; `IsGaussian.ext` | holds | R02, R03 |

- Previous review: R01, R02, R03, R04 and R06 are repaired (no `set_option`; `(d) (hd) : ∃ c > 0`; six headlines named in the docstring; 4.5 influence function with 9.1–9.2 in the contract; RandomMatrices moved to "Not owned here", §1.4 written). R05 is repaired in part (R05 here).
- Source locators checked against the text: KimSamworth16 lines 170–174 and 183; Johnstone17 lines 7890 (Thm 5.1, p. 142), 7905, 8083 ((5.15), p. 145), 8245–8256 (Thm 5.3, p. 148), 11736–11753 ((8.5)–(8.7), p. 220), 11760 (Lemma 8.3), 11812 ((8.12), p. 221), 12158 (Prop 8.8, p. 227); all as cited.
- Library declarations opened at the pin: Mathlib `MeasureTheory/Measure/TotalVariation/Defs.lean` lines 53, 62 and `Basic.lean` lines 42, 121; `MeasureTheory/Function/ConvergenceInDistribution.lean` line 64; `Probability/Decision/Risk/Defs.lean` line 60; `Probability/Distributions/Gaussian/CharFun.lean` line 186. Tau Ceti `Probability/Distributions/ChiSquared/Basic.lean` lines 209, 219; `Analysis/OperatorIdeal/ApproximationNumber/Basic.lean` lines 77, 186; `Analysis/OperatorIdeal/Nuclear/Basic.lean` line 53; `InformationTheory/KullbackLeibler/Pinsker.lean` line 149. No Hellinger, chi-squared divergence, finite-product or Gaussian Kullback–Leibler, Fano, Assouad, isotonic or soft-threshold declaration exists at the pins.
- Cross-roadmap citations resolved: Foundations 1.3, 2.4, 5.1, 6.2, 8.1–8.6, 9.1–9.4 and Asymptotic 1.2, 2.1–2.4, 3.3–3.5, 4.3, 5.6, 6.1, 6.2, 7.2, 7.3, 8.2, 8.3, 9.1, 9.2 at their open heads; StochasticCalculus §1.4, RandomMatrices §2.5 and OperatorTheory/OperatorIdeals on main. The local copies agree with Foundations `Suggested.lean` lines 64, 178, 784 and Asymptotic `Suggested.lean` line 1520.
- Dependency check: `depcheck: 245 roadmaps, 2230 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing outside the folder changes.
- Gate: every check passed. Elaboration: exit `0`, 211 `sorry` warnings and nothing else. The elaborated types were compared with the README through the `#check @name` list: of the 10 flagged, 7 are definitions or the structure, whose types do not use the binder, and the three theorems of 4.3 bind their own `μ`.
- One-tactic probe: `first | (simp; done) | rfl | infer_instance | (norm_num; done)` closes none of the 211; the targeted tactics of R03 close four, and two more follow from a neighbour in two steps.
- Pull request text: 211 theorems, six headlines named as not stated, the suppliers and their sections agree with the head.

Overlap check: read MathematicalStatisticsAsymptotic, MathematicalStatisticsFoundations, MathematicalStatisticsSemiparametric, StandardDistributions, RandomMatrices, OptimalTransport (ClassicalErgodicTheory and PointProcesses searched by object only); the Hájek projection is owned by Asymptotic 6.1 and contrasted here; the Kolmogorov–Smirnov statistic, the empirical distribution function and the kernel density estimator by Foundations 9.1–9.3, cited; the signed-rank statistic is in rank form here and in U-statistic form in Asymptotic 8.3, each stating the relation; the Kolmogorov law, the chi-bar-squared law and the Hodges–Lehmann influence function are handed here by Asymptotic and owned in 3.6, 6.5 and 4.5; Asymptotic and Semiparametric use the squared Hellinger distance in proof routes and define none; order statistics by StandardDistributions 4.6 and Tau Ceti, cited; the Kullback–Leibler API by Mathlib and Tau Ceti, as in OptimalTransport.

Source independence: 9 passages compared with 2 sources (Johnstone17, KimSamworth16), none shared beyond formulas and one statement of a dozen words; largest share van der Vaart, 54 of 207 locators (Tsybakov 49); contents compared with van der Vaart and Tsybakov by the cited chapter and section numbers only (van der Vaart's Chapters 12, 13, 15, 19 and 24 are spread over Layers 3, 4, 5 and 7; Tsybakov's 2.2–2.7 over Layers 1 and 2 with the divergences first, its Chapters 1 and 3 over Layers 5 and 6): independent as far as checked; neither text nor its table of contents could be read.

## Not verifiable

- 2.2, 2.4, 6.2 (Tsybakov, Springer 2009): paywalled; the sources service records it as uncertified.
- 3.6, 4.1, 4.2, 4.7, 7.3 (van der Vaart, CUP 1998): no legal copy found by the sources service.
- 2.2, 2.4, 7.2, 7.5 (Samworth–Shah, CUP 2026) and 2.2, 2.4 (Wainwright, CUP 2019): no legal copy found; the lower bound of 7.5 was checked on the primary paper.
- 3.4 (Hollander–Wolfe–Chicken), 6.6 (Ingster–Suslina), 7.1 (Robertson–Wright–Dykstra), 7.1, 7.3 (Groeneboom–Jongbloed), 8.3, 8.6 (Hsing–Eubank): commercial books; the service found no legal copy, or was refused by the publisher's host.
- Chernoff–Savage, Hodges–Lehmann, Parzen, Stone and Kim–Pollard: Project Euclid gave the sources service no PDF link; Gnedenko–Korolyuk was not found.
- Devroye–Györfi–Lugosi (5.6): the co-author's page failed certificate verification in this run; not in the sample.
- Ownership against the two board packages listed (AnalyticNumberTheory, LawrenceVenkateshMethod) was not checked; neither concerns statistics.

## Source issues

- none

## For the human reviewers

- **Not tested.** van der Vaart (54 of 207 locators) and Tsybakov (49) could not be read, nor their tables of contents: wording and arrangement were not checked against them.
- **Licence.** `README.md` lines 2852–2880 map the layers to files of lean-CKSD (Apache 2.0, the author's project); whether declarations of `Suggested.lean` are adapted from it was not compared.
- **Licence.** `README.md` lines 2888–2889 say Layers 1 and 2 "may port these proofs with attribution" from Statlib (Apache 2.0).
- **Licence.** Johnstone17 is an unpublished draft (version of August 9, 2017) read from the author's page; 10 locators point into it.
- **Scope.** `README.md` lines 125–126 and 2908–2910 hand the high-dimensional theory and the Kolmogorov distance to MathematicalStatisticsHighDimensional and MathematicalStatisticsHigherOrderAndResampling, which are neither on main nor in an open pull request.
