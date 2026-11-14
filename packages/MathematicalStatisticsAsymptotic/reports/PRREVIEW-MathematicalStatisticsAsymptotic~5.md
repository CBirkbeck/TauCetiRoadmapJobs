# Review of MathematicalStatisticsAsymptotic (pull request #2320 at 2ec3d2e)

**Verdict:** needs changes

## R01 (P2) — Wald's theorem assumes a measurable supremum on one ball only

**Location:** TauCetiRoadmap/MathematicalStatisticsAsymptotic/README.md:1204, “every `θ` has a ball `U` with `sup_{θ' ∈ U} log(p_{θ'}/p_{θ₀})` measurable and of finite positive part”; TauCetiRoadmap/MathematicalStatisticsAsymptotic/Suggested.lean:648, `hball : ∀ θ, ∃ r > 0, …`.
**Claim:** The proof route needs the supremum over balls shrinking to `θ`; the hypothesis gives measurability at a single radius, and the supremum of an uncountable family over a smaller ball need not be measurable.
**Witness:** README.md:1210–1212 applies monotone convergence to `sup_U` on “small balls `U`” around each `θ ≠ θ₀`. With `hball` only one radius is measurable, so the decreasing limit is not licensed.
**Repair:** Ask for every sufficiently small ball: README “every `θ` has `r₀ > 0` such that for every ball `U` about `θ` of radius at most `r₀` the supremum is measurable with finite positive part”; Lean `∀ θ, ∃ r₀ > 0, ∀ r ∈ Set.Ioc 0 r₀, Measurable … ∧ … < ⊤` (elaborates). For `N(θ, 1)` on `[-1, 1]` every radius qualifies: the supremum over a ball equals the supremum over its rational points.

## R02 (P2) — The asymptotic equicontinuity route uses a semimetric that 2.3 does not supply

**Location:** TauCetiRoadmap/MathematicalStatisticsAsymptotic/README.md:1028, “By 2.3 the limit concentrates on `UC(T, ρ_P)` for the `L²(P)` semimetric, so the empirical process is asymptotically `ρ_P`-equicontinuous”.
**Claim:** 2.3 gives some totally bounded semimetric, not a named one, and `T` need not be totally bounded for the `L²(P)` seminorm. The step needs the Gaussian fact that the standard-deviation semimetric serves.
**Witness:** The constants `f_t = t`, `t ∈ ℝ`: the empirical process is `0`, so the class is Donsker, but `‖f_s - f_t‖_{L²(P)} = |s - t|` and `ℝ` is not totally bounded. The standard deviation of `f_s - f_t` is `0`.
**Repair:** Add to 2.3 the target: for a tight centred Gaussian law on `ℓ^∞(T)`, `T` is totally bounded for `ρ(s, t) = sd(X_s - X_t)` and the law is concentrated on `UC(T, ρ)` (van der Vaart, Lemma 18.15, Gaussian clause). In 3.6 use `ρ = sd_P(f_s - f_t) ≤ ‖f_s - f_t‖_{L²(P)}`; add it to the `*Needs:*` line. On the constants class the modulus is `0`, as it must be.

## R03 (P2) — The classical Glivenko–Cantelli theorem is a contract item with no signature

**Location:** TauCetiRoadmap/MathematicalStatisticsAsymptotic/README.md:145, “The empirical distribution function: the classical Glivenko–Cantelli theorem, `isDonsker_indicator_Iic` with …”; README.md:931.
**Claim:** A headline listed under *Supplied to later roadmaps*, whose “names are fixed”, has no name and no statement in `Suggested.lean`, although every carrier it needs is already declared there.
**Witness:** `theorem isGlivenkoCantelli_indicator_Iic (P : Measure ℝ) [IsProbabilityMeasure P] : IsGlivenkoCantelli P (fun t x ↦ (Set.Iic t).indicator (fun _ ↦ (1 : ℝ)) x) := sorry` elaborates on a copy of the file; `simp`, `rfl`, `infer_instance` do not close it.
**Repair:** Add that declaration after `isDonsker_indicator_Iic` and name it in README.md:931 and :145. For `P = δ₀` the supremum is `0` for every `n ≥ 1`.

## R04 (P3) — The composite-test bullet and its Lean statement are different theorems

**Location:** TauCetiRoadmap/MathematicalStatisticsAsymptotic/README.md:1991, “let the maximum likelihood hypotheses of 5.3 hold at `θ₀ ∈ Θ₀` with `I` continuous at `θ₀`”; Suggested.lean:1306.
**Claim:** The README assumes the smooth-likelihood hypotheses and uses plug-in statistics; the Lean assumes quadratic-mean differentiability, a Lipschitz log-likelihood, and `hsexp`, with `I(θ₀)` and `C = Dc(θ₀)` fixed.
**Witness:** README.md:1995 has `[Dc(θ̂ₙ) I(θ̂ₙ)⁻¹ Dc(θ̂ₙ)ᵀ]⁻¹` and `I(θ̃ₙ)⁻¹`; Suggested.lean:1345 and :1351 use `C` and the information at `θ₀`, and :1328 adds a hypothesis the README does not state.
**Repair:** State the README bullet with the Lean's hypotheses and statistics (as the simple-hypothesis bullet above it does), and add one sentence: with `I` and `Dc` continuous at `θ₀` the plug-in statistics differ from these by `o_P(1)`, by Slutsky. The `N₂(θ, I)` Check is unchanged: `χ²_1` with noncentrality `4`.

## R05 (P3) — Named bullets attach conclusions that the Lean statements omit

**Location:** TauCetiRoadmap/MathematicalStatisticsAsymptotic/README.md:41, “the headlines below that carry a Lean name, each with every conclusion the README attaches to it”; Suggested.lean:26.
**Claim:** At least four named bullets carry a conclusion that their declaration does not state.
**Witness:** README.md:1736 (`P_θ ℓ̇ = 0` at interior `θ`) against Suggested.lean:1030; README.md:2264 (“`IF` is the influence function of `T`”) against :1538; README.md:438 (joint Slutsky form) against :110; README.md:2394 (`G₀ = (1 - ε)Φ + εH₀`) against :1587.
**Repair:** Add the conjuncts, or move each sentence out of the named bullet into an unnamed one. The second is statable as `HasInfluenceFunction (fun G ↦ T (liftLinfty fun t ↦ cdf G t)) P IF` under the hypotheses already present (elaborates); for `T(z) = z(t₀)` it gives `1{x ≤ t₀} - F(t₀)`.

## R06 (P3) — A local asymptotic minimax Check claims a strict inequality that can fail

**Location:** TauCetiRoadmap/MathematicalStatisticsAsymptotic/README.md:1923, “the supremum over finite `H` is `sup ℓ`, which exceeds the bound for a nonconstant loss”.
**Claim:** A nonconstant lower semicontinuous bowl-shaped loss can have Gaussian mean equal to its supremum.
**Witness:** `ℓ = 1{x ≠ 0}`: sublevel sets `{0}` and the whole space, `{ℓ > a}` open; `sup ℓ = 1` and `∫ ℓ dN(0, 1) = 1`.
**Repair:** “… is `sup ℓ`, at least the bound, and strictly larger when `ℓ < sup ℓ` on a set of positive Gaussian measure: for squared error truncated at `1`, `1 > 0.5161`.”

## R07 (P3) — The influence function is defined on p. 292

**Location:** TauCetiRoadmap/MathematicalStatisticsAsymptotic/README.md:2229, “(van der Vaart, §20.1, p. 291)”; README.md:2266.
**Claim:** The definition and the expansion the two bullets cite are on the second page of the section.
**Witness:** vdv line 40 is the running head of p. 292; vdv line 65 names the influence function; vdv line 36 closes p. 291, which holds only the opening of §20.1.
**Repair:** Write “§20.1, p. 292” at :2229 and “§20.1, pp. 291–292, and Thm 20.8, p. 297” at :2266.

## R08 (P3) — Section numbers and links into roadmaps that cannot be read

**Location:** TauCetiRoadmap/MathematicalStatisticsAsymptotic/README.md:2104, “MathematicalStatisticsNonparametric (3.2–3.3, 4.2), which defines the signed-rank statistic in its rank form”; README.md:33–36.
**Claim:** The cited roadmap is neither on main nor at the head of any open pull request, so its sections and what it defines cannot be resolved; the four relative links at :33–36 have no target.
**Witness:** `roadmaps list` (473 open pull requests, index of 2026-11-14) has MathematicalStatisticsFoundations and this roadmap only; main has no `MathematicalStatisticsNonparametric`, `…Semiparametric`, `…HigherOrderAndResampling` or `…HighDimensional` folder.
**Repair:** Name the four roadmaps in plain text without links, and write “belong to MathematicalStatisticsNonparametric, which takes the signed-rank statistic in its rank form” with no section numbers. The rank identity that follows (`W⁺ = 3` for the sample `(1, 2)`) stays.

## R09 (P3) — The description repeats the claim of R05

**Location:** Pull-request description, “states the headlines of Layers 1–9 that have Lean names, each with all the conclusions the README attaches to it”.
**Claim:** The head contradicts the sentence, by the four instances of R05.
**Witness:** README.md:1736 against Suggested.lean:1030, where the declaration ends with the likelihood-ratio limit and has no conjunct on the mean of the score.
**Repair:** After R05, keep the sentence if the conjuncts were added; otherwise write “each with its principal conclusion; corollary sentences are prose targets”. The count “its 86 targets are admitted” becomes 87 with R03.

## Verified sound

| Statement | Instances | Computed, one side | Computed, other side | Result / change |
|---|---|---|---|---|
| 1.1 Slutsky on varying spaces | `Xₙ = Z`, `Yₙ = Z + 1/(n+1)`; `n·1_{[0,1/n]}` | distance `1/(n+1)`, tail set empty once `n+1 > 1/ε`; mean `1`, `μ{C < Xₙ} ≤ 1/n` | both laws `N(0,1)`; bounded in probability | agrees |
| 1.2 Lindeberg–Feller | Rademacher `±1/√n`; centred Bernoulli(`1/n`) | Lindeberg sum `0` once `ε > 1/√n`; `n·(1/n)(1-1/n)² → 1` | `N(0,1)`; centred Poisson | hypothesis rejects the second |
| 1.2 multivariate CLT | `X = (U, U)`, `U` Rademacher | covariance all-ones, rank `1` | singular `N(0, S)` allowed by the statement | agrees |
| 1.3 quadratic forms | `S = diag(2, 0)`; `k = 1`, `m = a`, `S = σ²` | `S⁺ = diag(1/2, 0)`, `x₁²/2` with `x₁ ~ N(0,2)` | `χ²_1 = χ²_{rank S}`; noncentrality `a²/σ²` | agrees |
| 1.4 second-order delta | `g = x²`, `θ = 0` | `D₂(z, z) = 2z²`, `n X̄²` | `½·2Z² = σ²χ²_1` | agrees |
| 2.1 outer integrals | Bernstein set `s` | outer integrals of `1_s`, `1_{sᶜ}`: `1 + 1 = 2`; lower integral `0` | outer integral of the sum `1`; `outerLIntegral = 1` | agrees |
| 2.2 portmanteau | Bernstein indicator, `L = δ₁`; filter `⊥` | outer probability of `{Xₙ ∈ G}` is `1`, inner `0`; `limsup = 0`, `liminf = ⊤` | `L(G) = 1`; both sides of each `iff` true | inner probability needed; agrees |
| 2.2 Prohorov | Bernstein indicators | values in compact `{0, 1}`; outer − inner `= 1` | tight, not asymptotically measurable, no limit | both hypotheses needed |
| 2.3 marginals and equicontinuity | `T = ∅`; `T = {0,1}`, `ρ ≡ 0`, `(0, Z)` | `Linfty ∅ = {0}`, hypotheses vacuous; modulus `|Z|` | limit `δ₀`; equicontinuity fails | agrees |
| 2.4 bridge law | uniform `P`, `s = 1/4`, `t = 1/2`; `t = 1` | `1/4 - 1/8` ; `F(1)(1 - F(1))` | `1/8`; `0` | agrees |
| 3.1 `IsDonsker` | constants `f_t = t`, `t ∈ ℝ` | process `0`, centred values `0` | `L²(P)` distance `|s - t|`, not totally bounded; sd `0` | Donsker; R02 |
| 3.1 `empiricalProcess` | `n = 1`, uniform, sample `1/2`; `n = 0` | `sup_t |1{t ≥ 1/2} - t|` | `1/2`; `0` | agrees |
| 3.2 `coveringNumberLp` | centre `1{b}` on `ℝ × Bool` with the σ-algebra of the first factor | lower integral of `|1_A(y) - 1{b}|` is `0` (proved on a scratch file) | pinned `eLpNorm` of a non-a.e.-measurable function is `∞` | no junk centre; no change |
| 3.2 bracketing numbers | constants `{0, 1}`; half-lines | `‖1 - 0‖ = 1`; fewer than `2/ε` brackets of `L¹` size `ε` | `1` for `ε ≥ 1`, `2` below; `N_[] ≤ 2/ε²` in `L²` | agrees |
| 3.3 sub-Gaussian maximum | `N = 2` independent normals; `N = 1` | `E max = 1/√π = 0.564`; `0` | `√(2 log 2) = 1.177`; `0` | agrees |
| 3.3 chaining | two points at distance `1`, `δ = 2`, process `(0, Z)` | `E|Z| = 0.798` | packing number `2` below `1`: integral `√(log 2) = 0.833`, times `K` | agrees |
| 3.3 bracketing inequality | one bounded `f`, large `n`; `n = 0` | `E|𝔾ₙ f| ≈ 0.798 sd(f) > 0`; `0` | `J = 0`, truncation term `0`, so `K δ` carries the bound | `δ` term needed; agrees |
| 3.4 `F`-bridge | uniform `P`, `s = 1/4`, `t = 1/2`; `P = δ₀` | `min(F(s), F(t)) - F(s)F(t)` | `1/8`; `0` | agrees |
| 3.5 VC covering bound | `C = {A}`, `d = 0`; `C = ∅` | covering numbers `1`; `0` | `K·1·4e·1`; any `K ≥ 0` | agrees |
| 3.5 Sauer–Shelah | half-lines on `3` points | traces `∅` and three initial segments: `4` | `1 + 3 = 4` | agrees |
| 3.6 random indices | constants class, any `τₙ` | `𝔾ₙ f_τ - 𝔾ₙ f_{t₀} = 0` | conclusion `0` | statement holds; route R02 |
| 4.1 quantile derivative | uniform `F`, `p = 1/2`, `h = 1`; `h = 1_{[1/2, ∞)}` | quantile of `F + t` is `1/2 - t`; level set `[1/2, ∞)` | `-h(ξ)/f = -1`; quotient `0 ≠ -1` | tangent set needed; agrees |
| 4.2 functional delta | vdv lines 255–259 | limit carried by `D₀`, `φ′` on the whole space | README adds separability for the extended mapping theorem | supported |
| 4.3 argmax | `Mₙ(h) = hZₙ - h²/2` | maximizer `Zₙ` | maximizer `Z` | agrees |
| 5.2 Wald | `N(θ,1)` on `[-1,1]`; `p₀ = 1`, `p₁ = 2` on a point | ball suprema measurable at every radius; `θ̂ = 1` always | consistent; excluded by `hnorm` | R01 |
| 5.3 Z-estimators | exponential rate `θ`; `V` singular in the normal form | `I = 1/θ²`; `V⁻¹ = 0` in Lean | limit `N(0, θ²)`; hypothesis forces limit `δ₀ = N(0, 0)` | agrees |
| 5.5 M-estimators | `m = -(x - θ)²`; `V` with a positive eigenvalue | `V = -2`, `ṁ = 2(x - θ₀)`; `ℙₙ m` larger off `θ₀` | `-V⁻¹ṁ = x - θ₀`; contradicts `n Rₙ → 0` | agrees; no false instance |
| 5.6 rate theorem | `φ(δ) = √δ`; `φ ≡ 0` | `r^{3/2} ≤ √n`; `c d² ≤ R` | `r = n^{1/3}`; `r² d² = O_P(1)` | agrees |
| 5.8 quantiles | normal median; `(δ₀ + δ₁)/2` | `(1/4)·2π` | `π/2 = 1.571`; not tight | agrees |
| 6.1 projection theorem | `T = X + Y`, `S = X` | `(1/√2 - 1)² + 1/2` | `2 - √2 = 0.586` | agrees |
| 6.2 U-statistics | sample variance, normal and Exp(1); Wilcoxon kernel | `μ₄ - σ⁴ = 2`, `8`; `4·(1/12)` | `2`, `8`; `1/3` | agrees |
| 6.3 Hoeffding variance and tail | `(x - y)²/2`, `n = 2`; `xy`, `N = 0`, `n = 2` | `4(1/2)/2 + 1`; `E(2X₁X₂)² = 4` | `2/(n - 1) = 2`; `2n/(n - 1) = 4` | agrees |
| 6.3 optimality | `m = n = 1`, finitely supported laws | unbiased at `δ_x` forces `δ(x) = h(x)` | `U₁ = h` | agrees |
| 6.4 trimmed mean | `(δ₋₁ + δ₁)/2`, `α = 0.1`; uniform, `α = 1/4`; Bernoulli(`1/2`), `α = 1/4` | `1/0.64`; `4(1/96 + 1/32)`; `4·(1/4)` | `25/16`; `1/6`; `1`, direct: `4·Var(N₁/n)·n = 1` | agrees |
| 7.1 first lemma | `N(1/√n,1)ⁿ`; `N(1,1)ⁿ` | `log` ratio `N(-1/2, 1)`, `E e^Y = 1`; ratio laws to `δ₀` | contiguous; mean `0`, not contiguous | agrees |
| 7.2 third lemma | Gaussian shift, `Λ = S - 1/2` | `Cov(S, Λ) = 1` | `N(1, 1)`, exact | agrees |
| 7.3 LAN within `s` | one-sided `s = [θ, ∞)` | `∫ (p_η - p_θ) = 0` gives `h P ℓ̇ = 0` for tangent `h` | expansion needs only that | holds without interior |
| 7.4 representation | `Tₙ = Δₙ` | `K(x) = δ_{Ix}`, `X ~ N(h, I⁻¹)` | `N(Ih, I)` | agrees |
| 7.5 Anderson | `S = 1`, `M = δ₁`, `1{|x| > 1}`; `1{x < 0}` | `Φ(-2) + 1/2 = 0.523`; `Φ(-1) = 0.159` | `0.317`; `0.5` | symmetry needed; agrees |
| 7.6 local asymptotic minimax | `ℓ = 1{x ≠ 0}`, constant estimator | `sup ℓ = 1` | Gaussian mean `1` | theorem holds; Check R06 |
| 7.7 superefficiency | Hodges at `0`; truncated loss | variance `0 < 1` on `{0}`; `1 - 2φ(1)` | null set; `0.5161` | agrees |
| 8.1 composite tests | `N₂(θ, I)`, `c = θ₁`, `h = (2, 3)` | `C I⁻¹ Cᵀ = 1`, `λₙ = (Z + 2)²` | noncentrality `(Ch)² = 4` | agrees; R04 on the text |
| 8.1 local sets | `Θ = [0, ∞)`, `Θ₀ = {0}`, `h = 0` | `X² - (X⁻)²` | `(X⁺)²`: `0` with probability `1/2` | agrees |
| 8.2 power envelope | `I = 1`, `α = 0.05`, `h = 1`; `n = 0` | `1 - Φ(1.645 - 1)`; `ψ(0) = 0 ≤ 0` | `0.2595`; level clause harmless | agrees |
| 8.3 Pitman efficiency | sign against `t`, normal; `X̄ + 1/n` | `N₁/N₀ → (1/σ²)/(4f(0)²)`; `1 - Φ(1.645 - 0.1)` | `π/2`, so efficiency `2/π`; `0.0612 > 0.05` | direction and calibration right |
| 8.3 Hodges–Lehmann bound | `1_{[1,2]}`; Epanechnikov | `12·(1/12)·1`; `12·(1/5)·(9/25)` | `1 ≥ 0.864`; `0.864` | agrees |
| 8.4 GMM optimal weight | `G = (1, 1)ᵀ`, `Ω = diag(1, 4)`, `W = I` | `5/4 - (1 + 1/4)⁻¹` | `9/20 ≥ 0` | agrees |
| 9.1–9.2 influence functions | `T(G) = G((-∞, t₀])`; quantile at `x = ξ` | contaminated value linear in `ε`; quantile stays `ξ` | `1{x ≤ t₀} - F(t₀)`; derivative `0` | agrees; locator R07 |
| 9.3 median bound | `Φ`, `ε = 0.1` | levels `4/9`, `5/9` | `±0.1397` | agrees |
| 9.4 breakdown | median, `n = 5`; least median of squares, `n = 6`, `p = 3` | three replacements; exact fits through four points: `(-2A, A, 0)`, `(0, -A/6, A/6)` | `3/5`; formula `2/6`, minimum-norm selection `3/6` | agrees; Theorem 1 at rousseeuw line 153 |
| 9.5 Hampel and Huber | `ε = 0.05`, `k = 1.3984` | `2φ(k)/k - 2Φ(-k) = 0.2146 - 0.1620` | `0.0526 = 0.05/0.95`; `k/(2Φ(k) - 1) → 1.2533` | agrees |
| 9.6 regression M-estimators | least absolute deviations, Laplace errors | `γ = 2·(1/2) = 1`, `E ψ² = 1` | `Q⁻¹`, half of least squares | agrees; hjort_pollard lines 176–179, 334, 369 |

Previous findings (head `dbee9ff`):

| Finding | Disposition | Passage at this head |
|---|---|---|
| R01 Pitman calibration | repaired | README.md:2079 “critical values calibrated to level at most `α` for every `n` and `cₙ,ᵢ → z_α`”; Suggested.lean:1408 |
| R02 trimmed-mean variance | repaired | README.md:1585 “`Var(clamp(X, a, b))`”; :1630 `1/24`, `1/6` |
| R03 L-statistic route | repaired | README.md:1606 “No identification of `Lₙ` with `∫ x φ(Fₙ(x)) dFₙ(x)` is used”; :1589 |
| R04 Huber example | repaired | README.md:1418 “with `P(|X - θ₀| < k) > 0`”; :1424 |
| R05 regression breakdown | repaired | README.md:2331 “`n ≥ 1` observations, `p ≥ 1` coefficients” |
| R06 omitted conclusions | repaired | Suggested.lean:1355, :1398, :1602 |
| R07 quantile influence | repaired | README.md:2290 “for `x ≠ ξ`” |
| R08 rare-event ranges | repaired | README.md:459 “for every `n ≥ 1` … `C ≥ 0`” |
| R09 bundled Checks | repaired | README.md:1556–1561, :2039–2043 |
| R10 LAD page | repaired | README.md:2439 “least absolute deviations, p. 9”; hjort_pollard line 369 |
| R11 bridge locator | repaired | README.md:739 “van der Vaart, §19.2, p. 269” (page not readable) |
| R12 Prékopa–Leindler | repaired | README.md:349–357, :1869–1872; four declarations pass `#check` |
| R13 median counting | repaired | README.md:2353 “leave at least `m + 1` unchanged observations” |
| R14 description | repaired | “cite theorem, definition, section or equation locators with printed pages” |

- Source locators checked against the text: 11 (vdv §20.1, §20.2, Ex 20.5, Thms 20.8, 20.9; rousseeuw Thm 1, §2, proof page; hjort_pollard Thm 2.2, §3D least squares and least absolute deviations); 10 agree, 1 is R07.
- Seeded sample: 15 targets recomputed; the text was readable for 9.6 only (hjort_pollard); the other 14 are under Not verifiable.
- Library declarations opened at the pin: `Mathlib/MeasureTheory/Function/LpSeminorm/Defs.lean:91` (`eLpNorm`), `Mathlib/MeasureTheory/Integral/Lebesgue/Basic.lean:48` (`lintegral`), `Mathlib/Topology/MetricSpace/CoveringNumbers.lean:80` (`packingNumber`), `TauCeti/Probability/Quantile.lean:164` (`quantile`); 83 `#check` lines of the file pass.
- Object search of the pinned Mathlib and Tau Ceti for 19 objects (Lindeberg, Glivenko–Cantelli, Hadamard derivative, U-statistic, contiguity, influence function and others): no existing declaration of a target.
- Cross-roadmap citations resolved: MathematicalStatisticsFoundations 1.3, 2.4, 4.2, 4.3, 6.2, 8.1–8.6, 9.1, 9.2 at its open head; StochasticCalculus §1.2, §1.4, §1.5, StandardDistributions §5.3 and OperatorTheory/PolarDecomposition PD-C19–PD-C27 on main; one unresolved (R08).
- Gate: every check passed. Dependency check: `depcheck: 244 roadmaps, 2198 edges, 0 problem(s)`, no UPWARD or CYCLE line. Nothing changed outside the folder.
- Elaboration of `Suggested.lean`: exit `0`, `sorry` the only warning. `#check @name` types read for the 126 declarations; the 7 binder leads are `MeasurableSpace` instances that the types do use; no change.
- One-tactic probe (`rfl`, `simp`, `infer_instance`) on a copy: 0 of 86 theorems closed; no padding.

Overlap check: read MathematicalStatisticsFoundations, ProbabilisticAndMetricNumberTheory, PointProcesses, ClassicalErgodicTheory, StandardDistributions, RandomMatrices, OptimalTransport; contiguity, the U-statistic, the fixed-space stochastic algebra, the empirical distribution function, the sample quantile and the Huber score are owned by Foundations and cited; the norm laws of Gaussian projections by StandardDistributions §5.3 and cited; StochasticCalculus §1.5 uses Cramér–Wold inside its own proof and states no multivariate central limit theorem; nothing else shared.

Source independence: 7 passages compared with 3 sources (vdv lines 65, 218, 255, 286; rousseeuw lines 93, 153; hjort_pollard line 176), none shared beyond formulas and standard names; largest share vdv, 89 of about 125 locator groups; contents compared with vdv: independent (Layers 1–9 draw on Chapters 2–3 and 17, 18, 19, 20, 5 and 21, 11–12 and 22, 6–8, 14–17, in an order the `*Needs:*` lines of 2.2, 3.1 and 4.2 force and that is not the book's). Only Chapter 20 of vdv could be read: the wording of the other chapters was not compared.

## Not verifiable

- vdv outside Chapter 20 (sampled 1.1, 1.2, 2.2, 2.3, 2.4, 3.1, 3.3, 5.2, 5.5, 6.2, 6.3, 7.1, 8.2, 9.5, and Lemma 18.15 of R02): the publisher page is paywalled; the author's page has Chapter 20 only.
- vdvw (2.2, 2.3, 2.4, 3.3 and every other locator): the DOI resolves to a paywalled page.
- js (9.4, 9.5, 9.6): the sources service found no legal copy.
- huber: the Project Euclid page offered no PDF link.
- lehmann, huber_ronchetti, hansen: not fetched in this round; their locators are outside the sample.
- lean-CKSD and Statlib at commit `af349698` (README.md:2491–2522): not opened; the claims about them are not certified.

## Source issues

- **Misprint** in vdv at proof of Theorem 20.8, p. 297 (vdv line 266): the source says the paired map is differentiable at the pair of the point with itself; it should be at the point, in the domain of the map; affects nothing.
- **Misprint** in hjort_pollard at §3D, p. 9 (hjort_pollard line 399): the source says the matrix of the linear-median case carries the scaled density at zero divided by the scale again; it should carry the scaled density alone; affects a stated result.

## For the human reviewers

- Not tested: vdv has the largest share of the locators (89 of about 125) and only its Chapter 20 was readable; wording was compared for that chapter alone, the contents for the whole book.
- Licence: TauCetiRoadmap/MathematicalStatisticsAsymptotic/README.md:2491–2522 says most targets are formalized in lean-CKSD and that `HasQMDWithinAt` follows the shape of Statlib's definition (Apache 2.0); neither repository was opened in this review.
- Scope: four roadmaps named as consumers and as owners of deferred material (README.md:33–36, :110–119) exist neither on main nor in an open pull request.
- Source status: hjort_pollard is a 1993 preprint (arXiv:1107.3806), cited beside a book for 9.6.
