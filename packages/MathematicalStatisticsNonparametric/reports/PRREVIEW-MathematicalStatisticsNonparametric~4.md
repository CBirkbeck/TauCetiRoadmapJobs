# Review of MathematicalStatisticsNonparametric (pull request #2368 at af2f0d7)

**Verdict:** needs changes

## R01 (P2) — 5.3: the bias limit is attributed to a pinned lemma that does not state it

**Location:** `README.md` lines 1689–1691: "for integrable `K` with `∫ K = 1` and every density `f`, `∫ |K_h * f - f| → 0` as `h → 0`, Tau Ceti's `tendsto_eLpNorm_normed_convolution_sub` for `p = 1`"; also lines 280–281, 378–379, 1701, 2028.
**Claim:** The `L¹` approximate identity for an arbitrary integrable kernel of integral `1` is the pinned Tau Ceti lemma at `p = 1`, so 5.3 has that lemma as its single nonelementary input.
**Witness:** Tau Ceti `MeasureTheory/Function/Lp/ApproximateIdentity.lean` line 165: the lemma takes `phi : I → ContDiffBump (0 : E)` with `(phi i).rOut → 0` and concludes for `(phi i).normed mu`. `K = ½ 1_{[-1,1]}` is no `ContDiffBump`.
**Repair:** Line 1690–1691: "… as `h → 0`. Proof: since `∫ K = 1`, `K_h * f - f = ∫ K(u) (f(· - h u) - f) du`, so `∫ |K_h * f - f| ≤ ∫ |K(u)| ‖f(· - h u) - f‖₁ du`, which tends to `0` by the continuity of translation in `L¹` (Tau Ceti `MeasureTheory.Measure.continuous_translateLp`, `MeasureTheory/Function/Lp/Translation.lean`) and dominated convergence with the bound `2 |K(u)|`." Replace the lemma by `MeasureTheory.Measure.continuous_translateLp` in the Tau Ceti contract (lines 280–281) and in the `*Needs:*` line 1701; in lines 378–379 and 2028 write "the continuity of translation in `L¹` of Tau Ceti". On the witness: `‖f(· - h u) - f‖₁ → 0` for each `u ∈ [-1, 1]`, bounded by `2`, and `∫ ½ 1_{[-1,1]} · 2 = 2 < ∞`.

## R02 (P3) — 8.6: the eigenvector rate rests on a perturbation bound that main owns and the roadmap does not cite

**Location:** `README.md` lines 2774–2784: "(`fpca_eigenvector`, Hsing–Eubank, Thm 5.1.8, p. 138, and Thm 9.1.3, p. 255) … `‖φ̂_j - φ_j‖ = O_P(n^{-1/2})`"; "*Needs:* 8.1–8.5; Foundations 8.2–8.4; Tau Ceti `…abs_singularValue_sub_singularValue_le` …".
**Claim:** Every deterministic input of the route is a target, a supplier section or a pinned declaration. The bound of `‖φ̂_j - φ_j‖` by `‖Ĉ_n - C‖` over the spectral gap is none of them here: it is cited to a book theorem only.
**Witness:** Main, `OperatorTheory/SpectralSubspacePerturbation/README.md` lines 329–336, SSP-C15 and SSP-C16: for bounded symmetric `A`, `B` on arbitrary Hilbert spaces with form separation `g`, `‖P_U - P_V‖ ≤ ‖B - A‖/g`.
**Repair:** In 8.6, Eigenfunctions, add: "The rate is the dimension-free projector bound of OperatorTheory/SpectralSubspacePerturbation (SSP-C16), applied to the spans of the first `j + 1` and of the first `j` eigenvectors of `C` and `Ĉ_n`: with `g = min_{k ≠ j} |λ_j - λ_k|` and `‖Ĉ_n - C‖ ≤ g/4`, each projector moves by at most `2 ‖Ĉ_n - C‖/g`, so the rank-one projector moves by at most `4 ‖Ĉ_n - C‖/g` and `‖φ̂_j - φ_j‖ ≤ √2 · 4 ‖Ĉ_n - C‖/g`; the first-order term is proved here." Add "OperatorTheory/SpectralSubspacePerturbation SSP-C16" to the `*Needs:*` line of 8.6, to the Layer 8 Dependencies and, with one line, to "Not owned here". Tested: the eigenvalues of `Ĉ_n` move by at most `g/4` (the pinned Lipschitz bound), so each form separation is at least `3g/4` and `‖Ĉ_n - C‖/(3g/4) ≤ 2 ‖Ĉ_n - C‖/g`; for unit vectors with `⟪φ̂, φ⟫ = cos θ ≥ 0`, `‖φ̂ - φ‖² = 2 - 2 cos θ ≤ 2 sin² θ`.

## R03 (P3) — `limsup_power_le_envelope` is already the name of a different headline of the supplier

**Location:** `README.md` line 1281: "**Power envelope** (`limsup_power_le_envelope`, van der Vaart, Cor 15.14, p. 224)"; `Suggested.lean` lines 1202 and 1218.
**Claim:** The name identifies the two-sample shift envelope in the implementation namespace `TauCeti` (Conventions, line 135).
**Witness:** MathematicalStatisticsAsymptotic 8.2 (open head), `README.md` line 2070 and `Suggested.lean` line 1373: `limsup_power_le_envelope` is the envelope for a locally asymptotically normal sequence, in the same implementation namespace; this roadmap's 4.3 cites that section as its supplier.
**Repair:** Rename the declaration here to `limsup_power_twoSample_le_envelope` in `Suggested.lean` line 1202, in the docstring of `tendsto_power_rankTest` (line 1218) and in `README.md` line 1281. The new name occurs in neither statistics roadmap.

## R04 (P3) — Padding in `Suggested.lean`: two unfoldings of `rank`

**Location:** `Suggested.lean` lines 810–812 (`rank_comp_strictMono`) and 815–817 (`rank_comp_perm`); `README.md` lines 783–785.
**Claim:** The file states headlines only, with no declaration that follows in one tactic from the library or restates a definition.
**Witness:** On a copy, `simp [funext_iff, rank, hf.le_iff_le]` closes `rank_comp_strictMono`; `funext i; simp [rank]; exact Finset.card_bij (fun j _ ↦ σ j) …` closes `rank_comp_perm`. Both elaborate with no error.
**Repair:** Delete the two declarations from `Suggested.lean`. In `README.md` lines 783–785 keep the two sentences and remove the backticked names `rank_comp_strictMono` and `rank_comp_perm`.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.2 chi-squared divergence | `N(1,1)` against `N(0,1)`; `Ber ½`, `Ber ¼`; `δ₀` and `Ber ½` both ways; `n = 0` product; mixture on `{±1}` | `e - 1 = 1.7183`; `1 + 1/3 - 1 = 1/3`; `∞` and `4 · ½ - 1 = 1`; `1 = ` empty product; `cosh 1 = 1.5431` | holds | none |
| 2.2 Le Cam | normal mean, `θ₁ = n^{-1/2}`; `s < 0`; Hellinger form at `H² < 2` | `(1/(4n)) max(0.1516, 0.25) = 1/(16n)`; both events everything, `1 ≥ ½`; `tvDist/2 ≤ √(α(1 - α/4))` | holds | none |
| 2.5 Assouad | `m = 0`; `m = 1`; constant `P`; metric form | `0 ≤ 0`; `½ (1 - tvDist/2)`; `m/2` attained by the uniform estimator; `d² ≥ (c/4) ·` Hamming gives `(c/8) m` | holds | none |
| 4.2 classical rank limits | Kendall; signed rank; Kruskal–Wallis `k = 1`; bivariate normal `ρ = ½` | `n · 2(2n+5)/(9n(n-1)) → 4/9`; `4n(n+1)(2n+1)/(24n³) → 1/3`; `H = 3(N+1) - 3(N+1) = 0`, `χ²₀ = δ₀` at the pin; `τ = 1/3`, `0.48258` | holds | none |
| 4.3 power of rank tests | logistic; normal with Wilcoxon scores; `φ = φ_f` | `(1/6)/(1/√12) = 1/√3 = √I_f`; `(1/(2√π)) √12 = 0.97721 < 1`; `I_f/√I_f = √I_f`, the envelope | holds | R03 (name) |
| 4.6 Kolmogorov limit, DKW | `x = 1`, `n = 20000`, `20001`; DKW at `n = 100`; McDiarmid constant | `k_n = 200`, `201`; `√(log 202/200) + 0.01 = 0.173`; `exp(-2t²/(n · n⁻²)) = exp(-2nt²)` | holds | none |
| 4.7 Cramér–von Mises, two-sample | sine coefficient at general `u` and at `u = 0`; `P ≠ Q` with atoms | `(cos jπu - (-1)^j)/(jπ) + (-1)^j/(jπ) = cos(jπu)/(jπ)`; `1/(jπ)`; Glivenko–Cantelli needs no continuity | holds | none |
| 5.2 kernel density on the line | stationarity of `¼ A h⁴ + B/(nh)`; `A = 0.7`, `B = 0.3`, `n = 100`; Gaussian case; remainder | `h⁵ = B/(An)`; `0.336051`, minimum `0.011159`; `(4/3)^{1/5} = 1.0592`; `√(nh) o(h²) = o(1)` | holds | none |
| 5.3 `L¹` bias and consistency | the pinned lemma's binder; McDiarmid constant; `d = 0` | `ContDiffBump` only; `exp(-n t²/(2 (∫\|K\|)²))`; one point, `f̂ = 1` | statement holds, attribution false | R01 |
| 5.7 cross-validation | `n = 2`, `X = (0,1)`, `h = 2`; `K = 1/(2√u)` | `2/(4·2) · 2 = ½ = 2 · ¼ · 1`; `∫ K² = ∞`, `E K = 2/3`, `-4/3` against `-1` | holds | none |
| 5.8 splines | `t = (0,1,2)`, `g = (0,1,0)`; `α = 1`, `Y = (0,1,3)` | `R = 2/3`, `γ = -3`, `∫ g''² = 6 = (3/2) · 4`; `A = I - (3/20) v vᵀ`, `0.9/0.6 = 1.5` | holds | none |
| 7.1 isotonic least squares | `(3,1,2)`; `(1,3,2)`; weights `(1,2)`, `y = (2,1)` | `(2,2,2)`, loss `2` against `5`; `(1, 2.5, 2.5)`; `4/3` against `3/2` | holds | none |
| 7.2 isotonic risk | `n = 1`; constant `θ*`; exponent units | variance `1 ≤ C`; `C log(en)/n`; `(V/n)^{2/3}` is a squared length for `σ = 1` | holds | none |
| 7.3 Grenander | sample `(1,3)`; `a = ¼`, `0.1`, `½`; uniqueness on `(0, 1)` | `½`, `¼`, mass `1`, likelihood `1/8 > 1/9`; `ŝ = 1`, `3`, `0`; `f > ½` on `(0,t]` forces mass above `½` | holds | none |
| 8.1 covariance operator | uniform on `{±e₁, ±2e₂}`; constant `X`; Bernoulli | `diag(½, 2)`, trace `5/2 = 10/4`; `0` against `‖v‖²`; `p(1-p)` against `p` | holds | none |
| 8.6 functional principal components | `x = (0,2)`; Gaussian scores; gap bound | `Ĉ₂ = 1` (`2` with `(n-1)⁻¹`); `2λ_j²`; `‖φ̂ - φ‖ ≤ 4√2 ‖Ĉ_n - C‖/g` from SSP-C16 | holds | R02 |
| 1.4 comparison inequalities | `N(0,1)`, `N(1,1)`; Bernoulli pair | `0.2350 ≤ 0.76585 ≤ 0.9406`; `0.6171 ≥ 0.3894`, `0.3033`; `¼ ≤ 0.2877`, `0.1438 ≤ 0.2877` | holds | none |
| 2.3 Varshamov–Gilbert | `m = 8, 16, 24, 32` | balls `9`, `137`, `2325`, `41449`; ratios `28.4`, `478`, `7216`, `103621`; `e^{2.25} = 9.49 ≥ 3` | holds | none |
| 2.4 Fano | four Diracs; `M = 2` equal laws; packing form | `-½`; `0`; `1 - (α log M + log 2)/log(M+1) ≥ 1 - α - log 2/log(M+1)` | holds | none |
| 3.1–3.3 exact rank theory | `rank` unfolded; `n = 3` signed rank; `m = n = 2`; Kruskal–Wallis mean | one `simp`; `(1,1,1,2,1,1,1)/8`, variance `3.5`; `(1,1,2,1,1)/6`, `5/3`; `(k - 1) + 3(N+1) - 3(N+1)` | holds | R04 |
| 3.4 Hodges–Lehmann | `(1,2,6)`; `θ = 3`; ties `(1,1)` | medians `2`, `3.5`, value `2.75`; `W⁺ = 3 = ` three Walsh averages; `4 ≠ 3` | holds | none |
| 3.5–3.6 goodness of fit | Gnedenko–Korolyuk `n = 1, 3, 4, 5`; `n = 0`; integer `nD` | `0`; `0, 0.4, 0.9`; `16/70`; `162/252`; both sides `1`; `nD < ⌈y⌉ ⟺ nD < y` | holds | none |
| 4.1 projection | `N = 2`, `c = (1,0)`; two-sample `φ u = u` | `½ + (u₀-u₁)/2` against Hájek `½ + (u₀-u₁)/3`; ratio `(N+1)/N - 1 = 1/N` | holds | none |
| 4.4 Chernoff–Savage | normal; Laplace; logistic; uniform | `1`; `2 · 2/π = 4/π`; `π/3`; `∞ ≥ 1` in `ℝ≥0∞` | holds | none |
| 4.5 Hodges–Lehmann limit | median equation at `ε = 0`; normal; logistic | `(F(x-θ) - ½)/∫f²`; `1.2100` at `x = 1`, variance `π/3`; `1.3863`, variance `3` | holds | none |
| 5.4–5.5 linear smoothers | Epanechnikov `K*_{0,2}(½)`; boundary `c = 1`, `m = x²`; Nadaraya–Watson with `∑ K = 0` | `(15/8 - 35/32) · 0.5625 = 0.43945`; bias `h²/3`, variance `1/(2nh)`, both limits hold; `0 = 0` | holds | none |
| 5.9 minimax rates | coverage at `κ = 1`; class on `ℝ` against `[0,1]` | `b = -0.5946`, `0.9086 < 0.95`; bumps are globally Hölder, upper bounds restrict | holds | none |
| 6.3 Pinsker | Johnstone17 lines 7890–7906, 8083–8089, 8245–8256; `β = 1, 2` | proviso for `a_i = 0`; condition (ii) is `1/#{a_i ≤ μ/2} → 0` in white noise; `0.90856`, `0.99752` | holds | none |
| 6.4 soft thresholding | Johnstone17 lines 11736–11762, 11812, 12158–12164; `λ = 1`; `n = 100`, `θ = 3σ` | `0.15068 ≤ 0.60653`; `99 · 0.00035 + 7.18 = 7.22 ≤ 20.42` | holds | none |
| 6.5–6.6 chi-bar-squared, detection | orthant; `m = (R/ρ)^{1/β}`; one alternative | `0.05 + ¼ e^{-1.353} = 0.1146`; exponent `n² ρ^{4+1/β}/2`; `2Φ(-1) = 0.3173` | holds | none |
| 7.4 cube-root limit | scaling; modulus | `2c(σ/c)^{2/3} = \|4 f' f\|^{1/3}`; `n^{2/3}(n^{-1/6} + n^{-1/6})/2 = √n` | holds | none |
| 7.5 log-concave | KimSamworth16 lines 183–191; `d = 0` | `c_d` for each `d`, `n ≥ d + 1`, `n^{-4/5}` and `n^{-2/(d+1)}`; one point, value `0` | holds | none |
| 8.2–8.5 operators and Gaussian laws | `diag(½, 2)`; `λ ≡ 0`; `λ_j = 1/(j+1)` | `λ = (2, ½)`, residual `½`; any `φ`; series diverges a.s., image `δ₀` | holds | none |

- Previous review: R01–R05 are repaired (two separate boundary limits with the vanishing-coefficient Check; the third conjunct of `fpca_consistency` gone and `ContinuousLinearMap.abs_singularValue_sub_singularValue_le`, `IsGaussian.ext` cited; the seven declarations and two conjuncts deleted; the five names in the README; no pull-request reference, the five papers cited by secondary locators).
- Source locators checked against the text: 9, all as cited: Johnstone17 lines 7890 (Thm 5.1, p. 142), 7905, 8083 ((5.15), p. 145), 8253 (Thm 5.3, p. 148), 11736–11753 ((8.5)–(8.7), p. 220), 11760 (Lemma 8.3), 11812 ((8.12), p. 221), 12158 (Prop 8.8, p. 227); KimSamworth16 line 183.
- Library declarations opened at the pin: Tau Ceti `MeasureTheory/Function/Lp/ApproximateIdentity.lean` line 165, `MeasureTheory/Function/Lp/Translation.lean` lines 108 and 161, `Analysis/OperatorIdeal/ApproximationNumber/Basic.lean` line 186, `Analysis/OperatorIdeal/Nuclear/Basic.lean` (no diagonal formula), `Probability/Distributions/PoissonBinomial/Count.lean` line 63, `Probability/Quantile.lean` lines 858 and 934, `Probability/Distributions/ChiSquared/Basic.lean` line 209; Mathlib `Probability/Distributions/Gaussian/CharFun.lean` line 186. No Hellinger, chi-squared divergence, finite-product or Gaussian Kullback–Leibler, Fano, Assouad, isotonic or soft-threshold declaration at the pins.
- Cross-roadmap citations resolved: Foundations 1.3, 2.4, 5.1, 6.2, 8.1–8.6, 9.1–9.4 and Asymptotic 1.2, 2.1–2.4, 3.3–3.5, 4.3, 5.6, 6.1, 6.2, 7.2, 7.3, 8.2, 8.3, 9.1, 9.2 at their open heads; StochasticCalculus §1.4, RandomMatrices §2.5 and OperatorTheory/OperatorIdeals on main. The five local copies agree with Foundations `Suggested.lean` lines 64, 178, 784 and Asymptotic `Suggested.lean` lines 72, 78, 1520.
- Dependency check: `depcheck: 245 roadmaps, 2232 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing outside the folder changes.
- Gate: every check passed. Elaboration: exit `0`, 204 `sorry` warnings and nothing else. The `#check @name` types were compared with the README: of the 10 flagged, 7 are definitions or the structure, whose types do not use the binder, and the three theorems of 4.3 bind their own measure.
- One-tactic probe: `first | rfl | (simp; done) | (norm_num; done) | infer_instance | (simp_all; done)` closes none of the 204; of 27 targeted probes one closes (R04).
- Pull request text: 204 theorems, six headlines named as not stated, the suppliers and their sections agree with the head.

Overlap check: read MathematicalStatisticsAsymptotic, MathematicalStatisticsFoundations, MathematicalStatisticsSemiparametric, StandardDistributions, RandomMatrices, OptimalTransport (ClassicalErgodicTheory and PointProcesses searched by object only); the Hájek projection is owned by Asymptotic 6.1 and contrasted here; the empirical distribution function, the Kolmogorov–Smirnov statistic and the kernel density estimator by Foundations 9.1–9.3, cited; the signed-rank statistic is in rank form here and in U-statistic form in Asymptotic 8.3, each stating the relation; the Kolmogorov law, the chi-bar-squared law, the rank tests and the Hodges–Lehmann influence function are handed here by Asymptotic and owned in 3.6, 6.5, Layers 3–4 and 4.5; binary Kullback–Leibler tensorization is planned by OptimalTransport and pinned as Tau Ceti's `klDiv_prod_prod`, cited as the pinned declaration, the finite-product form kept here; order statistics are the pinned `TauCeti.orderStatistic` (uniform case in StandardDistributions 4.6), cited as pinned; Semiparametric shares nothing.

Source independence: 8 passages compared with 2 sources (Johnstone17, KimSamworth16), none shared beyond formulas and one statement of a dozen words; largest share van der Vaart, 51 of 198 locators (Tsybakov 49); contents not compared: neither van der Vaart's nor Tsybakov's text or table of contents could be read.

## Not verifiable

- 1.2, 2.2, 2.5, 5.7 (Tsybakov, Springer 2009): paywalled; the sources service records it as uncertified.
- 2.5, 4.2, 4.3, 4.6, 4.7, 5.2, 7.3 (van der Vaart, CUP 1998): the sources service found no legal copy.
- 2.2, 2.5, 7.2 (Samworth–Shah, CUP 2026) and 2.2 (Wainwright, CUP 2019): no legal copy found.
- 5.2 (Wand–Jones, Fan–Gijbels) and 5.8 (Green–Silverman): paywalled, uncertified; 5.8 (Wahba, SIAM): the publisher's host refused the request.
- 7.1 (Robertson–Wright–Dykstra), 7.1 and 7.3 (Groeneboom–Jongbloed), 8.1 and 8.6 (Hsing–Eubank): commercial books, no legal copy found.
- Devroye–Györfi–Lugosi (5.6, not in the sample): the co-author's page failed certificate verification.
- Ownership against the two board packages listed (AnalyticNumberTheory, LawrenceVenkateshMethod) was not checked; neither concerns statistics.

## Source issues

- none

## For the human reviewers

- **Not tested.** van der Vaart (51 of 198 locators) and Tsybakov (49) could not be read, nor their tables of contents: wording and arrangement were not checked against them; 13 of the 15 sampled sections rest on unread books.
- **Licence.** `README.md` lines 2859–2889 map the layers to files of lean-CKSD (Apache 2.0, the author's project); whether declarations of `Suggested.lean` are adapted from it was not compared.
- **Licence.** `README.md` lines 2892–2898 say Layers 1 and 2 "may port these proofs with attribution" from Statlib (Apache 2.0).
- **Licence.** Johnstone17 is an unpublished draft (version of August 9, 2017) read from the author's page; 8 locators point into it.
- **Scope.** `README.md` lines 125–126 and 2913–2915 hand the high-dimensional theory and the Kolmogorov distance to MathematicalStatisticsHighDimensional and MathematicalStatisticsHigherOrderAndResampling, which are neither on main nor in an open pull request.
