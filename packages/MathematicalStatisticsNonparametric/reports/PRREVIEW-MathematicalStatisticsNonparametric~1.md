# Review of MathematicalStatisticsNonparametric (pull request #2368 at 5e9de0b)

**Verdict:** needs changes

## R01 (P1) — `chernoffSavage`: the variance is parsed as one integral, and the statement is false for a nonzero mean

**Location:** `TauCetiRoadmap/MathematicalStatisticsNonparametric/Suggested.lean` line 631: `ENNReal.ofReal (∫ x, x ^ 2 * f x - (∫ x, x * f x) ^ 2)`.
**Claim:** The binder `∫ x,` extends over the subtraction, so the term is `∫ x, (x² f x − m²)` with `m` the mean. For `m ≠ 0` the integrand is not integrable, the Bochner integral is `0`, and the theorem reads `1 ≤ 0`.
**Witness:** `f` the density of `N(1, 1)`, `q x = x − 1`: variance term `0`, efficacy integral `1`, so `1 ≤ 0 · 1²`. The parse is confirmed by `rfl` at the pin; `∫ x, g x − c = 0` for integrable `g`, `c ≠ 0` proved there.
**Repair:** `ENNReal.ofReal ((∫ x, x ^ 2 * f x) - (∫ x, x * f x) ^ 2)`. On the witness it is `2 − 1 = 1` and the statement reads `1 ≤ 1`. The repaired file elaborates.

## R02 (P1) — `integral_mise_eq`: the right side is one integral over `t` of a non-integrable function

**Location:** `Suggested.lean` lines 747–748: `∫ t, ((∫ y, h⁻¹ * K ((t - y) / h) * f y) - f t) ^ 2 + (∫ u, K u ^ 2) / (n * h) - (n : ℝ)⁻¹ * ∫ t, (…) ^ 2`.
**Claim:** The first `∫ t,` takes the two constant terms into its integrand, so the right side is `0` whenever `R(K)/(n h) ≠ n⁻¹ ∫ (K_h * f)²`, while the left side is the positive risk.
**Witness:** `K = f` the standard normal density, `h = 1`, `n = 1`: the constant is `0.2821 − 0.1995 = 0.0826`, the right side is `0`, the left side is `0.0209 + 0.0826 = 0.1035`.
**Repair:** `(∫ t, ((∫ y, h⁻¹ * K ((t - y) / h) * f y) - f t) ^ 2) + (∫ u, K u ^ 2) / (n * h) - (n : ℝ)⁻¹ * ∫ t, (∫ y, h⁻¹ * K ((t - y) / h) * f y) ^ 2`. On the witness both sides are `0.1035`. The repaired file elaborates.

## R03 (P2) — 7.5: the lower-bound constant is claimed free of the dimension

**Location:** `README.md` line 2272: "there is a universal `c > 0` such that for every `d ≥ 1` and `n ≥ d + 1`".
**Claim:** The constant of the log-concave minimax lower bound depends on `d` in the primary source; a constant uniform in `d` is a stronger statement that no readable source supports.
**Witness:** KimSamworth16 line 183 (arXiv:1404.2298v2, Theorem 1): for each `d` there is `c_d > 0`, with `c_1 n^{-4/5}` and `c_d n^{-2/(d+1)}`. Samworth–Shah, Thm 9.26(b) could not be read.
**Repair:** "for every `d ≥ 1` there is `c_d > 0` such that for every `n ≥ d + 1` and every estimator, `sup_{f₀ ∈ 𝓕_d} E sqHellinger(f̃_n, f₀) ≥ c_1 n^{-4/5}` for `d = 1` and `≥ c_d n^{-2/(d+1)}` for `d ≥ 2`", or give the line of Samworth–Shah that makes the constant free of `d`.

## R04 (P2) — Headlines statable at the pins are absent, and the docstring names no headline as not statable

**Location:** `Suggested.lean` lines 41–43: "The README's other headlines are targets of the same standing, stated there in prose with their locators or proof routes, and are not stated here."
**Claim:** Every headline statable at the pins is stated, and each one that is not is named in the module docstring with the carrier it lacks. A blanket omission is neither.
**Witness:** `README.md` lines 9–19 name asymptotically optimal rank tests (4.3), Stone's theorem (5.6), the Hölder and Sobolev minimax rates (5.9) and the log-concave Hellinger rates (7.5); none is declared. The Kruskal–Wallis limit (4.2) needs only `kruskalWallis` and `chiSquaredMeasure`.
**Repair:** State each of: the Kruskal–Wallis, Mann–Whitney and signed-rank limits (4.2), the power of rank tests against the envelope (4.3), Stone's theorem (5.6), the Hölder regression and Sobolev density rates (5.9), the log-concave rate and lower bounds (7.5); or name it in the docstring with its missing carrier. Delete the quoted sentence.

## R05 (P2) — A `sorry`'d instance (gate: `sorry-data`)

**Location:** `Suggested.lean` line 552: `instance isProbabilityMeasure_kolmogorovMeasure : IsProbabilityMeasure kolmogorovMeasure := by sorry`.
**Claim:** No `instance` has the body `sorry`, and nothing mentions one; four later statements resolve this instance silently.
**Witness:** Gate line `sorry-data=1`, line 552.
**Repair:** Make it a `theorem`, and add the binder `[IsProbabilityMeasure kolmogorovMeasure]` to `cdf_kolmogorovMeasure`, `tendstoInDistribution_sqrt_mul_ksStatistic` and `tendstoInDistribution_twoSampleKS`. The file elaborates with these changes.

## R06 (P3) — `haveI` in two signatures (gate: `statement-hygiene`)

**Location:** `Suggested.lean` line 670 (`tendstoInDistribution_cvmStatistic`) and line 1240 (`tendstoInDistribution_hilbert_clt`).
**Claim:** A signature carries no `haveI`.
**Witness:** Gate lines `statement-hygiene (2)`, lines 670 and 1240.
**Repair:** Replace them by the instance binders `[IsProbabilityMeasure cvmLimitLaw]` and `[IsProbabilityMeasure (gaussianHilbert lam φ)]`. The file elaborates with these changes.

## R07 (P3) — `hajekProjection` is not the Hájek projection, and the name belongs to MathematicalStatisticsAsymptotic 6.1

**Location:** `README.md` line 1100: "`hajekProjection P φ c x = N c̄ ā + ∑ i, (c i - c̄) φ (F (x i))`, Hájek's projection of the linear rank statistic `T_N`".
**Claim:** This sum approximates the projection but is not `∑ᵢ E(T | Xᵢ) − (N − 1) E T`, which MathematicalStatisticsAsymptotic 6.1 defines under the same name, also for the namespace `TauCeti`.
**Witness:** `N = 2`, `φ u = u`, `c = (1, 0)`, uniform law: Asymptotic 6.1 gives `1/2 + (u₀ − u₁)/3`; this definition gives `1/2 + (u₀ − u₁)/2`. Asymptotic `Suggested.lean` line 835.
**Repair:** Rename it (for example `rankStatisticProjection`) in the README and in `Suggested.lean`, describe it as the approximating sum of van der Vaart, Thm 13.5, and add the instance above as a negative-control Check.

## R08 (P3) — Padding in `Suggested.lean`

**Location:** `Suggested.lean` line 209 (`ofReal_tvDist_sq_le_two_mul_klDiv`) and line 799 (`sum_sq_loo_eq`).
**Claim:** The first follows in one tactic from the pinned libraries; the second is algebra on a free matrix and vector and names no object of the roadmap.
**Witness:** `simpa [ofReal_tvDist] using TauCeti.etvDist_sq_le_two_mul_klDiv (μ := P) (ν := Q)` closes the first at the pin; the coordinate identity of the second closes with `Finset.add_sum_erase`, `field_simp`, `ring`.
**Repair:** Delete both from `Suggested.lean`; the README keeps the statements (1.4 cites Tau Ceti's `etvDist_sq_le_two_mul_klDiv` with Mathlib's `ofReal_tvDist`).

## R09 (P3) — `isGaussian_gaussianHilbert` drops the centring that 8.4 states

**Location:** `Suggested.lean` line 1217: `IsGaussian (gaussianHilbert lam φ) ∧ covarianceOperator (gaussianHilbert lam φ) = T`.
**Claim:** `README.md` line 2438 says the measure "is centered"; Mathlib's `covarianceOperator` is uncentered, so the Lean conclusion does not fix the mean, and `eq_gaussianHilbert` assumes it of the other measure.
**Witness:** Mathlib `Probability/Moments/CovarianceBilin.lean` lines 190–193: the operator of the uncentered bilinear form; a Gaussian law of mean `v` and covariance `T − v ⊗ v` has the same value.
**Repair:** `IsGaussian (gaussianHilbert lam φ) ∧ ∫ x, x ∂(gaussianHilbert lam φ) = 0 ∧ covarianceOperator (gaussianHilbert lam φ) = T`. The file elaborates with this change.

## R10 (P3) — Supplier citations without a section or an owner

**Location:** `README.md` line 2219 ("StochasticCalculus: `B t / t → 0`"), lines 350–355 ("the operator-ideal roadmap of OperatorTheory"), line 1268 ("Gaussian integration by parts"), lines 1880 and 1987 (Foundations 9.4 and 1.3).
**Claim:** A supplier is cited by roadmap and section; every consumed section is in the supplier contracts; an input of a route has an owner.
**Witness:** StochasticCalculus `README.md` line 988 on main puts `B_t/t → 0` in §1.4; RandomMatrices §2.5 (line 558) owns Gaussian integration by parts for smooth functions; `README.md` lines 303–315 list neither Foundations 1.3 nor 9.4.
**Repair:** Write "StochasticCalculus §1.4"; name `OperatorTheory/OperatorIdeals` with its section or drop the subsection, since nothing is consumed; add Foundations 1.3 and 9.4 to the contract; cite RandomMatrices §2.5 and state the Stieltjes form `Cov(g(Z), Z) = ∫ φ_N dg` for nondecreasing `g` as a target of 4.4.

## R11 (P3) — Process text and source-following in the README

**Location:** `README.md` lines 24–25 ("The material is the graduate content of Tsybakov, Johnstone, van der Vaart (Chapters 13, 15, 19 and 24)"), lines 2623–2626 ("The open Mathlib pull request #27579 … stated against the merged part"), Checks at lines 963 and 1014 ("the prototype").
**Claim:** A roadmap does not say it follows a source's chapters, carries no pull-request reference or state of work, and a Check never names a Lean counterpart.
**Witness:** The three quoted passages.
**Repair:** Delete lines 24–26 up to "(see References)" (the references list the texts) and the bullet at 2623–2626; in the Checks write "the definition takes the value `0` by convention" and "with a zero-based index" in place of "the prototype".

## R12 (P3) — No `## Downstream consumers` section

**Location:** `README.md`, headings after `## Layer 8` (lines 2555, 2583, 2628).
**Claim:** The README shape has `## Downstream consumers`; the consumer contract is spread over lines 30–36 and 723–732.
**Witness:** `grep '^## '` on the README: Layer 8 is followed by "Beyond this roadmap", "Prior formalization" and "References" only.
**Repair:** Add `## Downstream consumers` before `## References`, holding the stable-name contract of 2.6 (lines 723–732) and the statement that MathematicalStatisticsHighDimensional consumes Layers 1, 2 and 6.4.

## R13 (P3) — Classical results stated without a locator

**Location:** `README.md` line 997 (Gnedenko–Korolyuk formula), line 1284 (Hodges–Lehmann limit), line 1499 (pointwise asymptotic normality of the kernel estimator), line 2435 (Gaussian measures with trace-class covariance).
**Claim:** A result that appears in a source is cited with an exact locator; these four carry a proof route only.
**Witness:** The four bullets have no parenthesised source, while each is a published theorem (Gnedenko–Korolyuk 1951; Hodges–Lehmann 1963; Parzen 1962; the Hilbert-space Gaussian measure theorem of the functional-data texts).
**Repair:** Add to each the theorem and page of a text under References (van der Vaart or Hollander–Wolfe–Chicken for the first two, Wand–Jones or Tsybakov for the third, Hsing–Eubank for the fourth), or the original paper with its page.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.3 Kullback–Leibler complements | `N(0,1)`, `N(1,1)`; `Ber 1/2`, `Ber 1/4`; `a = 1, M = 2`; `n = 0` | `1/2 = 1/2`; `klBin` `0.14384` and `0.13081` swapped; `log 2 ≥ 0`; empty product `0 = 0` | holds | none |
| 3.4 Hodges–Lehmann | `(1,2,6)`; `(0,1)`; `x ↦ −x`; tie `(1,1)`, `θ = 0` | medians `2`, `3.5`, value `2.75`; `M/2 = 1.5` real, value `0.5`; medians swap; `W⁺ = 4` against `3` | holds; tie hypothesis needed | none |
| 3.5 goodness-of-fit statistics | `gnedenkoKorolyuk` at `(1,1)`, `(3,2)`, `(3,3)`, `n = 0`; CvM `n = 1`, `u = 0` | `0`; `8/20`; `18/20`; `1 = P(0 < k)`; `1/3 = 1/3` | holds | none |
| 4.1 projection and rank CLT | Wilcoxon scores; `N = 2`, `φ u = u`, `c = (1,0)` | `mn/(12(N+1))`, `mn/(12N)`, ratio `1/N`; `(u₀−u₁)/2` here, `(u₀−u₁)/3` in Asymptotic 6.1 | theorem holds; name wrong | R07 |
| 4.3 optimal rank tests | logistic; normal with Wilcoxon scores | `(1/6)/(1/√12) = 1/√3 = √I_f`; `√(3/π) = 0.9772 < 1`; information `λ(1−λ)I_f` | consistent | none |
| 4.6 Kolmogorov limit, DKW | integer `n D`; `n = 100`; McDiarmid `cᵢ = 1/n` | `nD < ⌈x√(2n)⌉ ⟺ √(n/2) D < x`; `0.163 + 0.01 = 0.173`; `exp(−2nt²)` | holds | none |
| 4.7 Cramér–von Mises | sine coefficient at `u = 0`; mean; variance | `1/(jπ)` both sides; `∑(jπ)⁻² = 1/6 = ∫ t(1−t)`; `∑ 2(jπ)⁻⁴ = 1/45` | holds | none |
| 5.2 `integral_mise_eq` | `K = f = N(0,1)`, `h = 1`, `n = 1` | left `0.1035`; Lean right side `0` (constant `0.0826` under `∫ t`); README formula `0.1035` | Lean false | R02 |
| 5.2 optimal bandwidth | Gaussian kernel and density | `R(K) = 0.2821`, `∫ f''² = 0.2116`, `h* = (4/3)^{1/5} = 1.0592` | holds | none |
| 5.5 local polynomials | `p = 1`, `ν = 0`, symmetric `K` | `S = diag(1, μ₂)`, `K*₀ = K`, variance `R(K) σ²/f_X` | consistent with 5.4 | none |
| 5.7 cross-validation | `K u = 1/(2√u)`, uniform `f`, `h = 1`, `n = 2`; `X = (0,1)`, `h = 2` | `∫K² = ∞`, `E K = 2/3`, junk `−4/3` against `−1`; both forms `1/2` | holds with `∫K² < ∞` | none |
| 5.9 minimax rates | two-point bump, `h = n^{-1/(2β+1)}` | separation `L h^β φ(0)`; `χ²` per observation `O(h^{2β+1}) = O(1/n)` | consistent with `kde_risk_le` | none |
| 7.1 isotonic least squares | `(3,1,2)`; `(1,3,2)`; weights `(1,2)`, `y = (2,1)` | `(2,2,2)`, loss `2` against `5`; `(1, 2.5, 2.5)`; `4/3` against `3/2` | holds | none |
| 7.5 log-concave likelihood | Kim–Samworth Thm 1; `d = 0`; two points | constant `c_d`; unique `f = 1`, value `0`; uniform on `[x₁, x₂]` | constant overclaimed | R03 |
| 8.2 eigen-expansions | `diag(½, 2)`; zero operator; bridge kernel | `λ = (2, ½, 0, …)`; `λ ≡ 0`, any `φ`; `∑ (jπ)⁻² = 1/6` | holds | none |
| 8.6 functional principal components | `x = (0, 2)`; Gaussian score | `Ĉ₂ = 1` against `2`; `λ² Var Z² = 2λ²` | holds | none |
| 1.4 comparison inequalities | `N(0,1)`, `N(1,1)`; `δ₀`, `δ₁` | `0.2350 ≤ 0.7659 ≤ 0.9406`; `0.6171 ≥ 0.3033`; `2 ≤ 2 ≤ 2` | holds | none |
| 2.2 Le Cam, normal mean | `θ₁ = n^{-1/2}`, `s = n^{-1/2}/2` | `(1/(4n)) · max(0.1516, 0.25) = 1/(16n)` | holds | none |
| 2.3 Varshamov–Gilbert | `m = 8` | ball `9`, `256/9 = 28.4 ≥ 2`; `e^{9/4} = 9.49 ≥ 3` | holds | none |
| 2.4 Fano | four Diracs; `M = 2` equal laws; `M = 0`; packing | `−1/2 ≤ 0`; `0 ≤ 1/2`; `0 ≤ 0`; `0.2441` | holds | none |
| 2.5 Assouad | `m = 0`; `m = 1`; metric form | `0 ≤ 0` (junk infimum times `0`); `½(1 − tv/2)`; `(c/4)(m/2) = cm/8` | holds | none |
| 3.2, 3.3 rank moments | `N = 3`, `c = (1,0,0)`; Kendall `n = 3`; Kruskal–Wallis | `2/3`; `22/54 = 11/27`; `(1/N) ∑ (N − n_j) = k − 1`, `N = 1`: `0` | holds | none |
| 4.4 `chernoffSavage` | `N(1,1)`; logistic; Laplace | Lean: `1 ≤ 0 · 1`; README: `π/3`, `4/π` | Lean false | R01 |
| 4.5 Hodges–Lehmann limit | slope of `P(W⁺ ≤ M/2)`; normal | `√12 ∫f² · t`; variance `π/3`, ratio `3/π` | holds | none |
| 6.3 Pinsker | one active coordinate; `a_j = j`; Johnstone (ii), white noise | `ε²C²/(ε² + C²)` both ways; `P₁ = 0.9086`; `1/#{aᵢ ≤ μ/2} → 0` | holds | none |
| 6.4 soft thresholding | `λ = 1`, `θ = 0`; `n = 1`; `n = 100` | `0.1507 ≤ 0.6065`; `σ² ≤ σ² + min`; `20.42 σ²` | holds | none |
| 6.6 detection boundary | `m = ρ^{-1/β}`; `ρ > R` | `n² ρ^{4+1/β} → 0 ⟺ ρ ≪ n^{-2β/(4β+1)}`; alternative empty, value `0` | holds | none |
| 7.3 Grenander, switching | sample `(1, 3)`; `a = ¼, ½, 0.1` | `½`, `¼`; `ŝ = 1, 0, 3`; likelihood `1/8 > 1/9` | holds | none |
| 7.4 cube-root limit | scaling; rate | `2c(σ/c)^{2/3} = \|4 f' f\|^{1/3}`; `r_n² φ_n(1/r_n) = √n` | holds | none |
| 8.4 Gaussian measures | `λ_j = 1/(j+1)`; Lean conclusion | series diverges a.s., Dirac at `0`; mean not stated | README holds; Lean incomplete | R09 |

- Source locators checked against the text: 7 in Johnstone17 (Thm 5.1 line 7890, p. 142; Thm 5.3 line 8253 with conditions at lines 8245–8252, p. 148; (5.15) line 8083, p. 145; (8.7) line 11753 and Lemma 8.3 line 11760, p. 220; (8.12) line 11812, p. 221; Prop 8.8 line 12158, p. 227), all as cited; 1 in KimSamworth16 (line 183).
- Library declarations opened at the pin: Mathlib `MeasureTheory/Measure/TotalVariation/Defs.lean` lines 62 and 195, `Probability/Moments/CovarianceBilin.lean` line 193, `Probability/BrownianMotion/Basic.lean` line 302, `Probability/Decision/Risk/Defs.lean` line 60; Tau Ceti `InformationTheory/KullbackLeibler/Pinsker.lean` line 149, `ChainRule.lean` line 224, `Probability/Distributions/ChiSquared/Basic.lean` line 209. All 120 `#check` pins elaborate. No Hellinger, chi-squared divergence, Fano, isotonic or soft-threshold declaration exists at the pins.
- Cross-roadmap citations resolved: Foundations 1.3, 2.4, 5.1, 6.2, 8.1–8.6, 9.1–9.4 and Asymptotic 1.2, 2.1–2.4, 3.3–3.5, 4.3, 5.6, 6.2, 7.2, 7.3, 8.2, 8.3 at the heads of their open pull requests; StochasticCalculus §1.2 and §1.4 on main. The local copies agree with Foundations `Suggested.lean` lines 64, 178 and 784.
- Dependency check: `depcheck: 245 roadmaps, 2230 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate: fails on `sorry-data=1` (R05) and `statement-hygiene=2` (R06); the targeted build passes.
- Elaboration: `lake env lean` on `Suggested.lean` exits `0` with 94 `sorry` warnings and nothing else. The 7 declarations flagged for dropped section binders are definitions and one structure whose types do not use them (`firstN`, `twoSided`, `chernoffArgmax`, `centeredCovariance`, `IsEigenExpansion`, `gaussianHilbert`, `empiricalCovariance`); no theorem lost a hypothesis.
- One-tactic probe: none of the 94 admitted declarations closes with `simp`, `rfl`, `infer_instance` or `norm_num`; the two of R08 close as stated there. A copy with the repairs of R01, R02, R05, R06 and R09 elaborates.

Overlap check: read MathematicalStatisticsAsymptotic, MathematicalStatisticsFoundations, StandardDistributions, RandomMatrices, OptimalTransport (ClassicalErgodicTheory and PointProcesses, scores 0.10 and 0.09, not read); the Hájek projection is owned by Asymptotic 6.1 (R07); the Kolmogorov–Smirnov statistic by Foundations 9.2, cited; the signed-rank statistic is in rank form here and in U-statistic form in Asymptotic 8.3, each stating the relation; Gaussian integration by parts by RandomMatrices §2.5 (R10).

Source independence: 13 passages compared with 2 sources (Johnstone17, KimSamworth16), none shared; largest share van der Vaart, 48 of 189 locators (Tsybakov 47); contents compared with van der Vaart by the cited chapter numbers only (Chapters 12–15, 19 and 24 fall in Layers 3, 4, 5 and 7, in no single run): independent as far as checked; neither text nor its table of contents could be read.

## Not verifiable

- 1.3, 5.7, 5.9 (Tsybakov, Springer 2009): paywalled; the sources service records it as uncertified.
- 3.5, 4.1, 4.3, 4.6, 4.7, 5.2, 5.9 (van der Vaart, CUP 1998): no legal copy found by the sources service.
- 1.3, 7.5 (Samworth–Shah, CUP 2026): no legal copy found; R03 rests on the primary paper.
- 3.4 (Hollander–Wolfe–Chicken), 5.2 (Wand–Jones), 5.5 (Fan–Gijbels), 7.1 (Robertson–Wright–Dykstra, Groeneboom–Jongbloed), 8.2 and 8.6 (Hsing–Eubank): commercial books, not fetched; their locators are unchecked.
- 5.6: whether Devroye–Györfi–Lugosi, Thm 6.4 covers distance ties broken by index for every law could not be checked.
- 7.4: Kim–Pollard, Lemma 2.6: the Project Euclid page gave no PDF to the sources service.
- Ownership against the two board packages listed (AnalyticNumberTheory, LawrenceVenkateshMethod) was not checked; neither concerns statistics.

## Source issues

- none

## For the human reviewers

- **Not tested.** van der Vaart (48 of 189 locators) and Tsybakov (47) could not be read, nor their tables of contents: wording and arrangement were not checked against them.
- **Licence.** `README.md` lines 2585–2613 map the layers to files of lean-CKSD (Apache 2.0, the author's project); whether declarations of `Suggested.lean` are adapted from it was not compared.
- **Licence.** `README.md` lines 2616–2622 say Layers 1 and 2 "may port these proofs with attribution" from Statlib (Apache 2.0).
- **Licence.** Johnstone17 is an unpublished draft (version of August 9, 2017) read from the author's page; 8 locators point into it.
- **Scope.** `README.md` lines 123 and 731 hand the high-dimensional theory and the Kolmogorov distance to MathematicalStatisticsHighDimensional and MathematicalStatisticsHigherOrderAndResampling, which are neither on main nor in an open pull request.
