# Review of MathematicalStatisticsNonparametric (pull request #2368 at a23a79f)

**Verdict:** needs changes

## R01 (P2) — Seven `set_option` lines (gate: `set_option`)

**Location:** `TauCetiRoadmap/MathematicalStatisticsNonparametric/Suggested.lean` lines 552, 651, 735, 759, 768, 835, 857: `set_option linter.concreteInstances false in`; lines 548–550: "the `concreteInstances` linter is silenced on them".
**Claim:** The file carries no `set_option` of any kind and no process comment. The linter fires only on instance-implicit binders without variables, so the override is avoidable.
**Witness:** Gate line `set_option=7`. Mathlib `Tactic/Linter/DeclType.lean` lines 48–54: only `bi.isInstImplicit` binders with no bound variable are flagged; line 651's binder mentions `k` and is not flagged at all.
**Repair:** Delete the seven lines and the comment at 548–550. Write the concrete instances as named hypotheses: `(hK : IsProbabilityMeasure kolmogorovMeasure)` (lines 738, 771), `(hC : IsProbabilityMeasure cvmLimitLaw)` (762), `(mL : MeasurableSpace (Lp ℝ 2 (volume : Measure ℝ))) (hL : BorelSpace (Lp ℝ 2 (volume : Measure ℝ)))` (841), and likewise the four binders of 865–868; drop the binder of `cdf_kolmogorovMeasure` (554), since `cdf` takes any measure. The copy with these changes elaborates with the 103 `sorry` warnings only, and the text gate gives `set_option=0`, `statement-hygiene=0`.

## R02 (P2) — 7.5: the lower-bound constant is still claimed free of the dimension

**Location:** `README.md` lines 2313–2314: "there is a universal `c > 0` such that for every `d ≥ 1` and `n ≥ d + 1`"; `Suggested.lean` line 1336: `∃ c > 0, ∀ d : ℕ, 1 ≤ d → ∀ n : ℕ, d + 1 ≤ n →`.
**Claim:** This is R03 of the previous review, unchanged; the Lean docstring (line 1332) now repeats it. The readable primary source gives a constant for each `d`; no line of Samworth–Shah making it uniform in `d` is given.
**Witness:** KimSamworth16 line 183 (arXiv:1404.2298v2, Theorem 1): for each `d` there exists `c_d > 0` such that for every `n ≥ d + 1` the bound holds, with `c_1 n^{-4/5}` and `c_d n^{-2/(d+1)}`.
**Repair:** README: "for every `d ≥ 1` there is `c_d > 0` such that for every `n ≥ d + 1` and every estimator, `sup_{f₀ ∈ 𝓕_d} E sqHellinger(f̃_n, f₀) ≥ c_1 n^{-4/5}` for `d = 1` and `≥ c_d n^{-2/(d+1)}` for `d ≥ 2`". Lean: `theorem logConcave_minimax_lower (d : ℕ) (hd : 1 ≤ d) : ∃ c > 0, ∀ n : ℕ, d + 1 ≤ n → …`, docstring "with a constant depending on `d`".

## R03 (P2) — Headlines absent without a reason, and two definitions no statement uses

**Location:** `Suggested.lean` lines 41–42: "The README's other headlines are targets of the same standing, stated there in prose with their locators or proof routes."; lines 941 and 946 (`nadarayaWatson`, `localPolynomialCoeff`); `README.md` lines 39–40.
**Claim:** A headline statable at the pins is stated; one that is not is named in the module docstring with the carrier it lacks; a definition is kept only when a statement needs it. R04 of the previous review added eight statements but kept the blanket sentence.
**Witness:** `README.md` lines 72–73 list "Nadaraya–Watson and local polynomial asymptotics" (5.5); no declaration uses `localPolynomialCoeff`, and `nadarayaWatson` occurs only in a docstring (line 954). Spearman's rho (3.3, 4.2), 4.7 estimated parameters, 6.2, 7.4's local empirical process and 8.7 have no statement and no docstring entry.
**Repair:** State the local linear limit of 5.5 with `localPolynomialCoeff K h 1` and the Nadaraya–Watson limit with `nadarayaWatson`, or delete both definitions. State Spearman's null moments, or name it. Replace lines 41–42 by the list of headlines not stated, each with its missing carrier: 4.7 estimated parameters and 7.4 local empirical process (weak convergence in `ℓ^∞(T)` and the law of a Gaussian process), 6.2 (the periodic Sobolev class), 8.7 (the Sobolev space `W_q` and the penalized minimizer). Delete "It is not an exhaustive acceptance test … proof routes." from `README.md` lines 39–40.

## R04 (P3) — The Hodges–Lehmann influence function is handed to this roadmap and is no target here

**Location:** `README.md` 4.5, lines 1305–1322 (the only target on the estimator's asymptotics); `### From MathematicalStatisticsAsymptotic`, lines 321–345.
**Claim:** MathematicalStatisticsAsymptotic assigns the influence function of the Hodges–Lehmann estimator to this roadmap, which neither states it nor consumes the sections named.
**Witness:** MathematicalStatisticsAsymptotic `README.md` at its open head, lines 2486–2487 (Layer 9, Examples): "its influence function is a target of MathematicalStatisticsNonparametric, which consumes 9.1–9.2". This README has no occurrence of "influence".
**Repair:** Add to 4.5: "**Influence function.** For `f` symmetric with `∫ f² < ∞`, the Hodges–Lehmann functional has influence function `x ↦ (F(x - θ) - ½) / ∫ f²` in the sense of MathematicalStatisticsAsymptotic 9.1; its variance `(1/12)/(∫ f²)²` is the limit variance above. *Needs:* MathematicalStatisticsAsymptotic 9.1, 9.2.", and add 9.1–9.2 to the contract at lines 321–345.

## R05 (P3) — A pull-request reference and five results cited without a page

**Location:** `README.md` lines 2667–2670 ("The Mathlib pull request [#27579] …"); line 2721 ("Original papers, cited without a checked page"); lines 992 (Gnedenko–Korolyuk), 1263 and 1266 (Chernoff–Savage), 1307 (Hodges–Lehmann), 1523 (Parzen), 1671 (Stone).
**Claim:** A README carries no pull-request reference and no statement about the state of its own checking, and a result that appears in a source has a theorem and page. R11 and R13 of the previous review are repaired in part only.
**Witness:** The quoted bullet survives reworded; the five targets cite author and year, while the References give the page ranges 972–994, 598–611, 1065–1076, 595–645 and 525–528.
**Repair:** Delete the bullet at 2667–2670. At each of the five targets write the theorem or equation number and the printed page of the paper, and delete the parenthetical at line 2721.

## R06 (P3) — A supplier contract for a roadmap that is not consumed, and one without a section

**Location:** `README.md` lines 354–358 (`### From RandomMatrices`: "Layer 4 does not consume it"); lines 349–352 (`### From StochasticCalculus`) and line 2366 ("StochasticCalculus: the growth of Brownian motion").
**Claim:** `## Exact supplier contracts` lists what is consumed, by section; what another roadmap owns and this one does not use belongs to `## Scope and ownership`. R10 of the previous review is repaired in 7.4 only.
**Witness:** Line 357: "Layer 4 does not consume it"; lines 2182 and 2257 cite "StochasticCalculus §1.4" (its `README.md` line 988 on main), the contract and the Layer 7 dependencies do not.
**Repair:** Delete `### From RandomMatrices` and add under "Not owned here": "Gaussian integration by parts for smooth functions, owned by RandomMatrices §2.5; 4.4 states the form for nondecreasing maps as its own target." Write "§1.4" at lines 350–351 and 2366.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.3 Kullback–Leibler complements | `N(0,1)`, `N(1,1)`; `klBin` both orders; `a = 1, M = 2`; `Q A = 0` | `1/2 = 1/2`; `0.14384`, `0.13081`; `log 2 ≥ 0`; junk `(1 - a) log (1 - a) ≤ 0` | holds | none |
| 2.5 Assouad | `m = 0`; `m = 1`; constant `P`; metric form against van der Vaart 24.3, `p = 2` | `0 ≤ 0`; `½(1 − tv/2)`; `m/2` attained; `(c/4)(m/2) = cm/8` | holds | none |
| 2.6 minimax corollaries | normal mean, `θ₁ = n^{-1/2}`; four Diracs, singular `Q` | `(1/(4n)) · max(0.1516, 0.25) = 1/(16n)`; `toReal ∞ = 0` gives `1/2`, excluded by the finiteness hypothesis | holds | none |
| 3.2 linear rank statistics | `N = 3`, `c = (1,0,0)`; normal scores `N = 2` | mean `2`, variance `½ · ⅔ · 2 = ⅔` (`4/9` with `N⁻¹`); `−0.56419` against `−0.43073` | holds | none |
| 3.3 classical rank statistics | Kruskal–Wallis; `k = N = 1`; Kendall `n = 3`; `W⁺`, `n = 3` | `(1/N) ∑ (N − n_j) = k − 1`; `6 − 6 = 0`; `22/54 = 11/27`; mean `3`, variance `3.5` | holds | none |
| 3.4 Hodges–Lehmann | `(1,2,6)`; `M = 3`; `x ↦ −x`; tie `(1,1)`, `θ = 0` | medians `2`, `3.5`, value `2.75`; `M/2 = 1.5` real; `−2.75`; `W⁺ = 4` against `3` | holds | none |
| 3.6 Kolmogorov and CvM laws | `x = 1`; integer `n D`; CvM moments | `1 − 2(0.135335 − 0.000335) = 0.73000`; `nD < ⌈y⌉ ⟺ nD < y`; `1/6`, `∑ 2(jπ)⁻⁴ = 1/45` | holds | none |
| 4.6 Kolmogorov limit, DKW | `n = 1`; maximum of `2(n + 1)` sub-Gaussians; `n = 100` | `E D₁ = ¾ ≤ 1.83`; `√(2 log(2n+2)/(4n))`; `exp(−2nt²)`; `0.163 + 0.01 = 0.173` | holds | none |
| 5.2 kernel density on the line | Gaussian `K`, `f`; MISE identity; limit under `n h⁵ = O(1)` | `h* = (0.2821/0.2116)^{1/5} = 1.0592`; `∫ K_h² * f = R(K)/h`; `√(nh) · o(h²) = o(1)` | holds | none |
| 5.3 multivariate estimator | `d = 2`, box kernel, `h = 2`; `d = 0`; one observation changed | `¼` on area `4`, integral `1` (`2` with `(nh)⁻¹`); `1`; `exp(−n t²/(2(∫\|K\|)²))` | holds | none |
| 5.6 Stone's theorem | DGL96 lines 3793, 3876, 3883; `X ≡ 0` with index ties | Thm 6.3 p. 98, Thm 6.4 p. 101, ties by index; first `k` indices, average `→ E Y` | holds | none |
| 5.8 smoothing splines | `t = (0,1,2)`, `g = (0,1,0)`; Lean `Q`, `R` indices; one-point RKHS | `R = ⅔`, `g''(1) = −3`, `6 = (3/2) · 4`; agree with the one-based formulas; `Y/(1 + λ)` | holds | none |
| 6.1 sequence model | one coordinate; `a = 1`; identity estimator; `Θ = ∅` | `c = C²/(C²+ε²)`, `ε²C²/(ε²+C²)`; `C²`; `∞` (Bochner `0`); `0` | holds | none |
| 8.1 covariance operator | uniform on `{±e₁, ±2e₂}`; `X ≡ v` | `diag(½, 2)`, trace `5/2 = E‖X‖²`; centred `0`, uncentred trace `‖v‖²` | holds | none |
| 8.5 Hilbertian CLT | tail projection; `H = ℝ` | `E‖P_{V_k^⊥} S_n‖² = ∑_{j ≥ k} λ_j` for every `n`; `N(0, σ²)` | holds | none |
| 2.4 Fano | four Diracs; `M = 2` equal laws; packing | `−1/2 ≤ 0`; `0 ≤ 1/2`; `1 − 1/8 − 0.6309 = 0.2441` | holds | none |
| 3.5 Gnedenko–Korolyuk | `(n,k) = (1,1)`, `(3,2)`, `(3,3)`; `n = 0` | `0`; `8/20`; `18/20`; `1 = 1` | holds | none |
| 4.3 power of rank tests | covariance with the log likelihood ratio; logistic | `h(mn/N)⟨φ,φ_f⟩/(√N √(mn/N) ‖φ − φ̄‖) = h√(λ(1−λ))⟨φ,φ_f⟩/‖φ − φ̄‖`; `1/√3 = √I_f` | holds | none |
| 4.4 `chernoffSavage` | `N(1,1)`, `q x = x − 1`; uniform law | `(2 − 1) · 1² = 1 ≥ 1`; `∞ ≥ 1` | holds; previous R01 repaired | none |
| 5.2 `integral_mise_eq` | `K = f = N(0,1)`, `h = n = 1` | both sides `0.0209 + 0.2821 − 0.1995 = 0.1035` | holds; previous R02 repaired | none |
| 4.5 Hodges–Lehmann limit | normal; variance of `(F − ½)/∫f²` | `π/3`; `(1/12)/(∫f²)²`, equal to the limit variance | holds; influence function unowned | R04 |
| 6.3 Pinsker | Johnstone17 lines 7890, 7905, 8245–8253; `a_j = j`, `C = 1` | condition (ii) is `1/#{aᵢ ≤ μ/2} → 0` in white noise; `0.9083 → 3^{1/3} 2^{-2/3} = 0.90856` | holds | none |
| 6.4 soft thresholding | Johnstone17 lines 11748, 11760, 12158; `n = 1` | `λ > 0` in the lemma, `λ = 0` gives `1`; `n e^{−log n} = 1`; `σ² ≤ σ² + min` | holds | none |
| 6.6 detection boundary | `m = (R/ρ)^{1/β}`; empty alternative; one alternative | `∏ cosh(ρ²n/m) ≤ exp(n²ρ⁴/(2m))`; `0`; `2Φ(−1) = 0.3173` | holds | none |
| 7.3 Grenander | sample `(1,3)`; `a = ¼`; `a = ½` | `½`, `¼`; maximizers `{1,3}`, infimum `1`; `{0,1}`, infimum `0`, `ĝ ≤ ½` for all `t > 0` | holds | none |
| 7.5 log-concave projection | `d = 0`; boundary value `2` at an endpoint | no `v ≠ 0`, `f = 1`, value `0`; `1 ≥ 2^{1−t}` fails, so the version is unique | holds | none |
| 7.5 lower bound | KimSamworth16 line 183; Lean quantifiers | `c_d` for each `d`; `∃ c > 0, ∀ d` | overclaim | R02 |
| 8.2, 8.3 trace and principal components | pin: `nuclearENorm` is `∑` approximation numbers; `k = 0` | positive compact: `∑ λ_j = ∑ ⟪T bᵢ, bᵢ⟫`; tail `= E‖X − m‖²` at `V = ⊥` | holds | none |
| Instance binders of the limit laws | copy with named hypotheses, no `set_option` | 103 `sorry` warnings, nothing else; `set_option=0`, `statement-hygiene=0` | repair tested | R01 |

- Previous review: R01, R02, R06, R07, R08, R09 and R12 are repaired; R05 is repaired through a `set_option` (R01 here); R03 is not (R02); R04, R10, R11 and R13 in part (R03, R06, R05).
- Source locators checked against the text: 3 in DGL96 (lines 3793, 3876, 3883), 7 in Johnstone17 (lines 7890, 7905, 8253, 11748, 11760, 12158 and the conditions at 8245–8252), 1 in KimSamworth16 (line 183); all as cited except the constant of R02.
- Library declarations opened at the pin: Mathlib `Tactic/Linter/DeclType.lean` lines 48–54, `MeasureTheory/Function/ConvergenceInDistribution.lean` line 64, `Probability/Decision/Risk/Defs.lean` line 60, `MeasureTheory/Measure/Typeclasses/NullSingletonClass.lean` line 31; Tau Ceti `Probability/Distributions/ChiSquared/Basic.lean` lines 209 and 229, `Analysis/OperatorIdeal/Nuclear/Basic.lean` line 53. No Hellinger, chi-squared divergence, Fano, Assouad, isotonic or soft-threshold declaration, and no `klDiv_pi` or `klDiv_gaussianReal`, exists at the pins.
- Cross-roadmap citations resolved: Foundations 1.3, 2.4, 5.1, 6.2, 8.1–8.6, 9.1–9.4 and Asymptotic 1.2, 2.1–2.4, 3.3–3.5, 4.3, 5.6, 6.1, 6.2, 7.2, 7.3, 8.2, 8.3 at their open heads; StochasticCalculus §1.4, RandomMatrices §2.5 and OperatorTheory/OperatorIdeals on main. The local copies agree with Foundations `Suggested.lean` lines 64, 178, 784 and its README 9.1–9.3.
- Dependency check: `depcheck: 245 roadmaps, 2230 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate: fails on `set_option=7` (R01); the targeted build passes. Elaboration: exit `0`, 103 `sorry` warnings and nothing else. Of the 9 declarations flagged for dropped section binders, 7 are definitions or the structure, whose types do not use them, and `limsup_power_le_envelope` and `tendsto_power_rankTest` do not use the section's `μ`.
- One-tactic probe: `first | simp | rfl | infer_instance | norm_num` closes none of the 103 admitted theorems.
- Pull request text: the counts (103 theorems), the suppliers and their sections agree with the head; nothing outside the folder changes.

Overlap check: read MathematicalStatisticsAsymptotic, MathematicalStatisticsFoundations, StandardDistributions, RandomMatrices, OptimalTransport (ClassicalErgodicTheory and PointProcesses, scores 0.10 and 0.09, searched by object only); the Hájek projection is owned by Asymptotic 6.1 and no longer named here; the Kolmogorov–Smirnov statistic by Foundations 9.2, cited; the signed-rank statistic is in rank form here and in U-statistic form in Asymptotic 8.3, each stating the relation; the law of the Kolmogorov limit and the chi-bar-squared law are handed here by Asymptotic and owned in 4.6 and 6.5; the Hodges–Lehmann influence function is handed here and unowned (R04); order statistics by StandardDistributions 4.6 and Tau Ceti, cited; the Kullback–Leibler API by Mathlib and Tau Ceti, as in OptimalTransport.

Source independence: 11 passages compared with 3 sources (Johnstone17, DGL96, KimSamworth16), none shared beyond formulas; largest share Tsybakov, 48 of 192 locators (van der Vaart 47); contents compared with Tsybakov and van der Vaart by the cited section and chapter numbers only (Tsybakov's 2.2–2.7 fall in Layers 1 and 2 with the divergences first, its Chapters 1 and 3 in Layers 5 and 6; van der Vaart's Chapters 12–15, 19 and 24 in Layers 3, 4, 5 and 7): independent as far as checked; neither text nor its table of contents could be read.

## Not verifiable

- 1.3, 2.5, 5.1, 5.7, 5.9, 6.2 (Tsybakov, Springer 2009): paywalled; the sources service records it as uncertified.
- 2.5, 3.2, 3.3, 3.6, 4.6, 5.2 (van der Vaart, CUP 1998): no legal copy found by the sources service.
- 1.3, 2.5, 7.2, 7.5 (Samworth–Shah, CUP 2026): no legal copy found; R02 rests on the primary paper.
- 3.3, 3.4 (Hollander–Wolfe–Chicken), 5.2 (Wand–Jones, Fan–Gijbels), 5.3 (Devroye–Lugosi), 5.8 (Wahba, Green–Silverman), 8.1, 8.5 (Hsing–Eubank): commercial books, not fetched; their locators are unchecked.
- The five papers of `README.md` line 2721 that the README marks as cited without a checked page, and Kim–Pollard's Lemma 2.6: Project Euclid refused the download to the sources service; Gnedenko–Korolyuk was not found.
- Ownership against the two board packages listed (AnalyticNumberTheory, LawrenceVenkateshMethod) was not checked; neither concerns statistics.

## Source issues

- none

## For the human reviewers

- **Not tested.** Tsybakov (48 of 192 locators) and van der Vaart (47) could not be read, nor their tables of contents: wording and arrangement were not checked against them.
- **Licence.** `README.md` lines 2629–2657 map the layers to files of lean-CKSD (Apache 2.0, the author's project); whether declarations of `Suggested.lean` are adapted from it was not compared.
- **Licence.** `README.md` lines 2660–2666 say Layers 1 and 2 "may port these proofs with attribution" from Statlib (Apache 2.0).
- **Licence.** Johnstone17 is an unpublished draft (version of August 9, 2017) read from the author's page; 9 locators point into it. DGL96 was read from a co-author's university page.
- **Scope.** `README.md` lines 123–124 and 2685–2687 hand the high-dimensional theory and the Kolmogorov distance to MathematicalStatisticsHighDimensional and MathematicalStatisticsHigherOrderAndResampling, which are neither on main nor in an open pull request.
