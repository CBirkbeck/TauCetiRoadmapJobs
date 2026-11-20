# Review of StandardDistributions (pull request #2682 at b0d099d)

**Verdict:** accepted

**Summary.** Accepted: no finding. The fifteen sampled sections, the thirteen sorried headline statements and the LKJ definition were recomputed (degenerate parameters, both directions of each "exactly when", the conventions of the LKJ column index and of the stable `S₀`/`S₁` locations) and nothing false was found; none of the headline statements is at the pin or closes in one tactic. There are three small corrections and no format note, none blocking: most book citations still name a whole book, the §10.17 locator names the wrong section of the R documentation, and the Pareto natural-moment target of §1.11 is a cast of two pinned theorems. Three questions are left for the human reviewers (scope of the sources, the pin, and the main source not being readable).

## C01 — Most book citations name a whole book, and §5.7, §7.8 and §14.4 cite nothing at the claim

A reader who wants to check a formula against its source cannot find it: "(Billingsley)" in §0.1, §0.2 and elsewhere (lines 219, 268), "(Eaton)" in §5.1–§5.3 (lines 1853, 1903), "(Anderson 2003)" in §5.4 (line 2031), "(Johnson, Kotz and Balakrishnan, vol. 1)" or "vol. 2" at some fifty places (for instance §1.11 line 775, §3.2 line 1114, §3.8 line 1391, §7.9 line 3829, §10.1 line 5516, §10.10 line 6433), with no volume at all in §10.12 (line 6789) and §10.18 (line 7246), "(Coles 2001)" in §10.3 (line 5707) and "(Azzalini and Capitanio 2014)" in §10.9 (line 6370). §5.7, §7.8 and §14.4 carry no citation. No stated result is left unsupported, since each of these statements names the pinned declaration that proves it, and the statements open in Layers 14 and 15 do have exact locators.

A chapter, section or theorem number at each of these places would make the citations usable; for §7.8 a standard reference for exponential tilting (or the sentence "these are Mathlib's and Tau Ceti's declarations, no source is used") would do.

## C02 — §10.17 cites the Details section of the R documentation for both conventions, but the Poisson mixture is in its Source section

The passage at line 7112 reads "R noncentral Beta documentation, Details, ratio and Poisson-mixture conventions". Under Details (RNoncentralBetaDoc lines 85–91) there is only the ratio `X/(X + Y)` of a noncentral and a central chi-squared variable, with Johnson et al. p. 502; the derivation as a Poisson mixture of Beta laws, with pp. 502–3, is under Source (RNoncentralBetaDoc lines 122–123). "Details for the ratio, Source for the Poisson mixture" points to both.

## C03 — The Pareto natural-moment target of §1.11 is the pinned real-power statement at `q = n`

§1.11 asks (line 797) to "prove that for every natural `n`, `Xⁿ` is integrable exactly when `n < r`, and that then `E[Xⁿ] = r tⁿ/(r − n)`", and the scope list counts it among the open targets. The same section cites `TauCeti.Probability.integrable_rpow_paretoMeasure_iff` and `TauCeti.Probability.integral_rpow_paretoMeasure` (Tau Ceti `Probability/Distributions/Pareto/Basic.lean`, lines 117 and 139), which state exactly this for every real `q` under `t, r > 0`; with Mathlib's `Real.rpow_natCast`, which the *Needs:* line already lists, the natural case is the instance `q = n`. As a target it asks an implementer for one rewrite. Calling it a corollary of the real-power row (as the section already does for the Gamma and Beta laws, whose natural-power forms are at the pin) and dropping it from the list of open targets in the scope section would say what it is.

## Previous findings

The previous review read this same head and raised no finding; its two small corrections stand unchanged, because the head is unchanged.

- Whole-book locators and the uncited §7.8 and §14.4 — not repaired: "(Billingsley)" (line 219), "(Eaton)" (line 1853), "(Anderson 2003)" (line 2031) are as they were. C01 above.
- The §10.17 locator — not repaired: "R noncentral Beta documentation, Details, ratio and Poisson-mixture conventions" (line 7112). C02 above.
- The earlier findings (the Jacobian Check of §6.2, the sphere-coordinate Check of §12.1, the Wick–Isserlis ownership sentence, the removed quantile statement) remain repaired: line 2626 gives `4x³z²`, line 8252 gives variance `1/4`, line 9765 states the ownership, and `Suggested.lean` has no quantile statement.

## Verified sound

| Statement | Instances tried | Values computed, each side | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 density interfaces (sample) | Gaussian `v = 0`; Cauchy scale `0` | law `δ_m`: point mass `1`, Lebesgue `0`, no density; pdf identity `0 = 0` a.e. | true; `v ≠ 0` needed | none |
| 1.11 real-power moments (sample) | Gamma `(3, 2)`, `q = 1`; `q = −a`; Pareto `q = n` | `2⁻¹Γ(4)/Γ(3) = 3/2 = a/r`; integrand `~ x⁻¹` at `0`, divergent; `r tⁿ/(r − n)` from rpow row | true | C03 |
| 3.2 log-normal (sample) | `m = 0, v = 1`; `q = 2`; `v = 0` | mean `1.6487`, variance `4.6708`, median `1`; `E X² = e² = 7.389`; `e^(qm)` | true | none |
| 3.8 Fisher's F (sample) | `m = n = 2`; `m = 2, n = 6` | density `(1+x)⁻²`, `F(3) = 3/4`; mean `3/2`, `E X² = 9`, variance `27/4 = 432/64` | true | none |
| 4.4 sums and differences (sample) | `b = 2`; `b ≤ 0`; `n = 2, r = 1`; empty family; `p = 1` | variance `8 = 2b²`; both sides zero measure; `1 − 2/e = 0.2642`; `δ₀` vs zero measure; `δ₀ = δ₀` | true | none |
| 5.2 Gaussian density (sample) | `S = diag(1, 4)`; `diag(1, 0)`; all-ones 2×2 | `1/(4π) = 0.0796`; formula `0^(−1/2) = 0`, singular; support `m + ℝ(1, 1)` | true | none |
| 5.7 parameter measurability (sample) | Mathlib `measurable_multivariateGaussian` at the pin | measurable in `(m, S)` uncurried on all matrices, invalid ones included | agrees | C01 |
| 7.6 mixed Poisson (sample) | Gamma shape `2`, rate `1`; `ρ = δ_λ` | NB`(2, 1/2)`: mean `2`, variance `4 = 2 + 2`, `E[N(N−1)] = 6`; mgf finite iff `t < log 2`; variance `λ` | true | none |
| 7.8 exponential tilting (sample) | `N(0,1)` by `t`; Exp(1) by `t = 2`; Bin `p = 1/2`, `t = log 3`; non-integrable `e^(tX)` | `e^(ts + s²/2)`; zero measure; `p' = 3/4`; both sides `0` by totalized division | true | C01 |
| 7.9 survival and hazard (sample) | Weibull `(2, 1)`; `δ₁`; min of Exp(1), Exp(2) | hazard `2x`, `H = x²`; `S(0)·e⁰ = 1 ≠ S(1) = 0`; hazard `3` | true; absolute continuity needed | none |
| 10.1 logistic (sample) | `m = 0, s = 1` | `F(log 3) = 3/4`; variance `π²/3`; `M(1/2) = Γ(1/2)Γ(3/2) = π/2`; `D = (−1, 1)` | true | none |
| 10.3 generalized Pareto (sample) | `s = 2, ξ = −1`; `s = 2, ξ = 0.4, v = 3`; `ξ > 0` shift | `E X² = 4/3`, uniform `(0, 2]`; scale `3.2`, survival `1.0625^(−2.5) = 0.859`; Pareto`(s/ξ, 1/ξ)` | true | none |
| 10.9 truncated and skew normal (sample) | `N(0,1)` on `(−1, 2)`; half-normal; `SN` with `α = 1`; `v = 0` on `(m, ∞)` | mean `0.2296`, variance `0.5198`, median `0.1712`; `√(2v/π)`; `F(m) = 1/4`, mean `m + s/√π`; both zero measure | true | none |
| 10.10 uniform sums, bounded laws (sample) | `IH(2)`, `IH(3)`; `Bates(2)`; `Tri(0,1,0)`; `Kum(2, 3)`; triangular moment `n = 0, 1` | variance `1/6`, `F(1) = 1/6`; `1/24`; `Q(0.36) = 0.2`; `16/35`; `1`, `1/3` | true | none |
| 10.18 hypoexponential (sample) | rates `(1, 2)`; `(1, 1, 2)`; empty | `A = 2, −2`, `Q(1/4) = log 2`, mean `3/2`, variance `5/4`; `A = −2, 2, 2`, mass `1`, mean `5/2`, `F(1.3) = 0.2171`; `δ₀` | true | C01 |
| 5.3 Wick–Isserlis (headline) | positions `(1,1,1,1,1,1)`; `(1,1,2,2)`; odd; empty; `S ⋡ 0` | `15 S₁₁³`; `S₁₁S₂₂ + 2S₁₂²`; no matching, `0`; one empty matching, `1`; Dirac fallback, hypothesis present | true; Lean = README | none |
| 5.4 conditional Gaussian (headline, at the pin) | `(Z, tZ)`; `v₁ = 4, v₂ = 1`, cov `1`; `S₂₂ = vJ` | point mass for `t ≠ 0`, `N(0,1)` at `t = 0`; slope `1`, variance `3`; `S₂₂⁺ = J/(4v)`, residual `0` | true | none |
| 6.4 exact Gram rank (headline) | `ν = 0`; `S = 0`; `ν = 1, p = 2, S = 1`; `S = diag(1, −1)` | rank `0 = min`; `0`; `1`; `δ₀` of rank `0` against `min ν 1`, so `S ⪰ 0` needed | true; Lean = README | none |
| 6.4–6.5 Wishart and Bartlett (headline, at the pin) | `p = 3, n = 3, S = Θ = 1`; `p = 2, n = 3`; `p = 3, n = 2.5` | `(1 − 2i)³ = −11 + 2i`, argument sum `−3.32 < −π`, sign flip; `E det W = 6`; degrees `2.5, 1.5, 0.5` | true | none |
| 14.2 Jacobian and normalization (headline) | general `p`: own row gives `i − 1 − k`, later rows `p − i`; `p = 3`; `p ≤ 1` | exponent `(p − k − 1)/2`; diagonal `1, 1, √((1−z₂₁²)(1−z₃₁²))`; `Z₃(1) = π²/2`; both sides `1` | true; Lean = README | none |
| 14.3 `lkjMeasure` and entry marginal (headline) | `p = 2`; `p = 3, η = 1`; `η ≤ 0` | density `(1−r²)^(η−1)/B(1/2, η)`, Beta`(η, η)`; variance `1/4 = 1/(2η + p − 1)`; zero measure | true; excludes exponent `(p − j)/2` (gives `8π/9`) | none |
| 14.3 partial correlations (headline) | zero-based column `c = j − 1`; `p = 3, η = 1`; `p ≤ 1` | `β = η + (p − c − 2)/2`; columns `3/2, 3/2, 1` (semicircle, semicircle, uniform); empty product, both Dirac | true; Lean = README | none |
| 14.3 determinant moments (headline) | `p = 2, η = 1`, `q = 1`, `q = −1`; `p = 2, η = 2`; `p ≤ 1` | `2/3 = B(1/2, 2)/B(1/2, 1)`; divergent at `q = −η`; `4/5`; both sides `1` (hence `p ≥ 2` in the iff only) | true | none |
| 15.4 support (headline) | `α = 1/2, β = ±1`; `α = 1, β = 1`; `α = 2` | `[m − s, ∞)`, `(−∞, m + s]` = Nolan Lemma 1.10; `ℝ`; Gaussian of variance `2s² > 0`, `ℝ` | true | none |
| 15.5 moment threshold (headline) | Cauchy; `α = 1/2, β = 1` (one tail vanishes); `β = 0`, `α = 1`, `q = 1/2` | iff `q < 1`; right tail `~ x^(−1/2)` keeps the iff; `√2 s^(1/2)` both ways | true | none |
| 15.5 tail limits (headline) | Cauchy; Lévy; `β = −1` right tail; Lévy-measure tail | `s/(πx)`; `2C_(1/2) = √(2/π)`; limit `0 = C(1 + β)`; `Γ(1+α)sin/(πα) = C_α` | true as limits; Nolan Thm 1.12 has `−1 < β ≤ 1` | none |
| 15.6 exponential domain (headline) | `s = 0`; `α = 2`; `α = 1/2, β = 1, t = −1/2`; `α = 1, β = ±1` by scaling and reflection | `ℝ`; `ℝ`; `K = dt − √(2s|t|) = −1/2`; `dt − (2/π)βst log|t|` both signs | true | none |
| 15.1–15.3 conventions used by the headlines | `u = e, β = 1`; (1.7) at `α = 1`; two `S₀(1,1,1,0)`; `α = 1/2, β = 1, t = 1` | `−1.7305`, `−1.7296` at `α = 0.999`; `h₁ = (2/π)βs log s`; location `(4/π) log 2 = 0.883`; integral `−1 = Ψ(1)` | agrees with Nolan (1.4)–(1.7) | none |
| 10.17 locator | R documentation, Details against Source | ratio at lines 85–91 (p. 502); Poisson mixture at lines 122–123 (pp. 502–3) | wrong section named | C02 |
| 5.3 ownership sentence | RandomMatrices §2.5 on main; main's own §5.3 | main already lists Wick–Isserlis in both; RandomMatrices consumes Layer 5 | earlier owner is this roadmap | none |

- Source locators checked against the text: 8 in Nolan2020 (Definition 1.7 at line 534, (1.7) at lines 667–675, Lemma 1.10 at line 698, Theorem 1.12 at line 791 and its reflection at lines 807–810, the moment threshold at lines 825–828 on printed p. 15, Proposition 1.13 at line 845, the mean for `α ≤ 1` at lines 843–844 on p. 16) and 2 in RNoncentralBetaDoc (lines 85–91, 117–123). The README flags no locator as unverified.
- Library declarations opened at the pins (Tau Ceti 2fd255d, Mathlib 1b1ccf4): 38. Definitions behind the headlines: `stableMeasure` (Stable/Basic.lean:69), `stableS1Location` (Stable/Exponent.lean:384), `stableTailConstant` (Stable/Tails.lean:44), `lkjNormalizer` (LKJ/Normalizer.lean:56), `correlationLebesgue` and `partialCorrelationOfCorrelationCoordinates` (SymmetricMatrix/Correlation.lean:252, 421), `strictLowerTriangle` and `Matrix.partialCorrelationOfCholesky` (Analysis/Matrix/PartialCorrelation.lean:49, 288), `PerfectMatching` (Combinatorics/Enumerative/PerfectMatching.lean:129), `wishartGramMeasure` (Wishart/Basic.lean:171), Mathlib `multivariateGaussian` (Gaussian/Multivariate.lean:166). Seventeen cited theorems of the sampled sections were compared with the prose, hypotheses included, and agree.
- Not at the pin (searched by name and by object in both libraries): the Wick formula beyond degree four, the exact Gram rank (only the bound `ae_rank_le_wishartGramMeasure`, Wishart/Basic.lean:322), any LKJ measure (the LKJ folder holds only the normalizer), and the stable support, moment threshold, tail limits and exponential domain (only the Lévy-measure tails, Stable/Tails.lean:60–99).
- Cross-roadmap citations resolved on main: OptimalTransport §3.7 (line 1920), §5.3 (line 2232), §12.8 (line 4584); OrthogonalL2Bases and OneParameterSemigroups under `Completed/`; RandomMatrices §2.5 (line 560). Citations of this roadmap by GaussianLinearModels (4.1, 4.2, 10.5, 10.6), PoissonApproximation (Layer 9), MathematicalStatisticsFoundations (4.6, 7.8) and MathematicalStatisticsAsymptotic (§5.3) all resolve at this head.
- Automatic checks: all passed on this head and none was set aside. The dependency check, rerun, prints `depcheck: 182 roadmaps, 2071 edges, 0 problem(s)`, with no UPWARD or CYCLE line. The pull request changes nothing outside the folder.
- Elaboration of `Suggested.lean`: 13 "declaration uses `sorry`" warnings and nothing else; no `set_option`, no sorried data (the one `def`, `lkjMeasure`, has a real body), `import Mathlib` and seven `TauCeti.*` modules. The elaborated type of each of the 14 declarations was compared with its README statement: all agree, no binder is lost.
- One-tactic probe on a copy of the file (`rfl`, `simp`, `simp [lkjMeasure]`, `infer_instance` on each of the 13 theorems): none closes. Nothing in the file is padding.
- The pull request's description was read against the head: 359 Checks over 124 sections, seven Tau Ceti imports, the section renumbering, the list of open targets and the Wick ownership all agree with it; it says that the roadmap is revised and that most of `Suggested.lean` is removed.

Overlap check: read GaussianLinearModels, RandomProjectionsAndSketching, PoissonApproximation, MathematicalStatisticsHigherOrderAndResampling (open), MathematicalStatisticsFoundations, MathematicalStatisticsAsymptotic and RandomMatrices (main). Each cites this roadmap as owner of the laws it uses; the one shared object is the real Wick–Isserlis formula, which main already lists both here (§5.3) and in RandomMatrices §2.5: this roadmap, the supplier of RandomMatrices, is the owner, and RandomMatrices should cite §5.3 at its next revision. No other roadmap, open or on main, declares an LKJ or a stable law, or any of the fourteen Lean names.

Source independence: 10 passages compared with 2 sources (Nolan2020, RNoncentralBetaDoc), none shared beyond formulas and theorem labels; largest share Johnson–Kotz–Balakrishnan, 52 of about 150 citations by plain count, whose text and contents could not be read; contents compared with Nolan2020 (lines 22–30): Layer 15 is independent (§15.2 and §15.6 have no counterpart among its sections 1.1–1.9, and §15.3 precedes §15.4 where the source has sums after densities and tails). The layers are organised by kind of object and operation, not by family in a handbook's order.

Research link: Layers 6, 14 and 15 state the Wishart theory (Muirhead 1982; the branch issue of Mayerhofer 2019), the LKJ partial-correlation construction (Lewandowski, Kurowicka and Joe 2009) and the stable laws (Nolan 2020) that RandomMatrices and the statistics roadmaps build on; rests on the README's References and Downstream consumers and on Nolan2020 ch. 1.

## Not verifiable

- Johnson–Kotz–Balakrishnan (1994, 1995), cited by nine of the fifteen sampled sections (§1.11, §3.2, §3.8, §4.4, §7.9, §10.1, §10.9, §10.10, §10.18): not in the sources manifest or cache; the README links a publisher catalogue page only.
- Johnson–Kemp–Kotz 2005 (§4.4, §7.6), Billingsley 1995 (§0.1), Eaton (§5.2), Coles 2001 (§10.3), Azzalini–Capitanio 2014 (§10.9), Muirhead 1982, Anderson 2003, Mardia–Jupp, Fisher: books, not in the manifest or cache; the mathematics of the sampled sections was recomputed instead.
- Lewandowski, Kurowicka and Joe 2009 (Layer 14): paywalled; the Jacobian exponent and the normalizer were derived independently (table above).
- Heyde 1963, Aitchison–Shen 1980 and the software documentation pages other than R's: not read in this review.

## Source issues

- **Gap** in Nolan2020 at §1.5, p. 15, with Problem 1.11, p. 23: the source says Problem 1.11 yields the moment threshold for every stable law with index below two; it should be noted that for totally skewed laws one tail is not a power law, so one heavy tail must suffice; affects nothing.
- **Misprint** in RNoncentralBetaDoc at Details, line 86: the source cites a single page as "pp. 502"; it should be "p. 502" (the Source section gives pp. 502–3); affects nothing.

## For the human reviewers

- Scope: the located sources are handbooks (Johnson–Kotz–Balakrishnan, Johnson–Kemp–Kotz, Muirhead) and several conventions rest on software documentation (SciPy, R, PyMC, Stan; README References). The README lists twelve consuming roadmaps under Downstream consumers.
- Pin: `TauCetiRoadmap/StandardDistributions/STATUS.md` reports that Tau Ceti at aa6e43e (2026-11-13) proves the LKJ independence and stable support and moment results; at the pin 2fd255d (2026-11-04) they are absent. After a pin bump several `Suggested.lean` headlines would restate library declarations.
- Not tested: Johnson–Kotz–Balakrishnan, the source with the most citations, could not be read, so neither wording nor arrangement was compared with it.
- Ownership: RandomMatrices §2.5 on main (line 560) still lists the real Wick–Isserlis formula that §5.3 here owns; the change needed is in RandomMatrices, not in this pull request.
