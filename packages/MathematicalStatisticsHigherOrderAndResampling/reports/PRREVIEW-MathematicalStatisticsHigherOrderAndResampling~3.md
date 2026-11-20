# Review of MathematicalStatisticsHigherOrderAndResampling (pull request #2504 at 294a0d2)

**Verdict:** accepted

**Summary.** Accepted: no finding. The one finding of the previous review (analyticity in place of `C^∞` in the three Layer 8 statements) is repaired, and so is its small correction; every statement, Check and worked example was recomputed and none failed. There are two small corrections (a superfluous hypothesis in the inconsistency statement of 6.5, and a Check of 7.2 computed at the wrong scale) and one format note, none blocking. None of the cited books could be read legally, so no locator was checked against a text; this, and the README's remark that a printed theorem of Politis–Romano–Wolf has an insufficient hypothesis, are left to the human reviewers.

## C01 — The inconsistency statement of 6.5 holds for every sample, so continuity of `F` and "almost surely" are not needed

In 6.5 (README line 1034, `le_kolmogorovDist_bootstrap_max` in `Suggested.lean` line 762) the bound `kolmogorovDist ≥ (1 - (1 - 1/n)ⁿ)/2` is stated "if `F` is continuous, then almost surely", and the route says the sample values are almost surely distinct. Distinctness is not used: if the maximum of `x : Fin n → ℝ` is attained at `k ≥ 1` indices, the resample maximum equals it with probability `1 - (1 - k/n)ⁿ ≥ 1 - (1 - 1/n)ⁿ` (for `x = (1, 1)` it is `1 ≥ 3/4`, as the Check of 6.5 itself computes), and for `bₙ = 0` the atom at `0` has mass `1`. The jump bound of 1.1 then gives the inequality at every `ω`, for every law `P`. An implementer is asked to carry `hP : Continuous (cdf P)` and an almost-sure quantifier that the proof never touches.

Would the author either drop the hypothesis and state the bound for every sample `x` (the i.i.d. sequence then plays no part), or keep the statement and add a sentence that continuity is only what makes the atom exactly `1 - (1 - 1/n)ⁿ`?

## C02 — The Check of 7.2 on `b = n - 1` uses the scale `n - 1`, not the scale `τ_b` of the subsampling law

The last Check of 7.2 (README line 1186) says that for the mean with `b = n - 1` "the values `(n - 1)(θ̂_{n,b,i} - θ̂ₙ) = X̄ₙ - Xᵢ` have the empirical law of `X̄ₙ - Xᵢ`, which tends to the law of `μ - X₁`". The identity is right, but `subsamplingLaw` multiplies by `τ_b`, and for the mean `τ_b = √(n - 1)`: the subsampling law is that of `(X̄ₙ - Xᵢ)/√(n - 1)`, which tends to `δ₀`. A reader takes the displayed law for the subsampling law of this roadmap, which it is not. The conclusion (no convergence to `N(0, σ²)` when `b/n` does not tend to `0`) stands either way; stating the value at the scale `√(n - 1)`, with limit `δ₀`, would make the Check test the definition of 7.2. Note also that `τ_b/τₙ → 1` here, so the example violates two hypotheses at once.

## N01 — One pointer still reads "below" after the sections were reordered

In Scope and ownership (README line 1578), "The numbers are those of the layers below": the layers now stand above that section.

## Earlier findings

- R01 of the previous review (in Layer 8 the Lean hypothesis on `g` was analyticity): repaired. The three hypotheses now read `ContDiffOn ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) g U` (`Suggested.lean` lines 923, 970, 997), which is the `C^∞` level at the pin (`Mathlib/Analysis/Calculus/ContDiff/FTaylorSeries.lean` line 120); the elaborated types show the coercion `↑⊤`.
- C01 of the previous review (two Dependencies lines omitted a supplier): repaired. Layer 1 now reads "Mathlib, ArithmeticStatisticsPartVIII §5.14, Foundations 9.2, and Tau Ceti's bounded Lipschitz characterization and `leftLim_cdf`" and Layer 2 "Layer 1, Mathlib, Tau Ceti's Fourier inversion, Foundations 8.5".
- The rest of the change since that head is a reordering of the README (scope, supplier contracts and the build guide moved); compared as multisets of lines, the two texts differ only in the two Dependencies lines above.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 Kolmogorov distance, Pólya | `δ₀` vs `N(0,1)`; `N(0,1)` vs `N(0,4)`; `δ_{1/n}` vs `δ₀` | `1/2` at `t = 0`; `c² = (8/3) log 2 = 1.848`, `Φ(1.3595) - Φ(0.6798) = 0.1613`; distance `1` | true | none |
| 1.2 bounded Lipschitz distance | `δ₀`, `δ_a`; `tvDist` normalisation at the pin | `f(a) - f(0) = min(1, a/2) + min(1, a/2) = min(a, 2)`; `tvDist` is the variation norm, in `[0, 2]` | true | none |
| 1.3 Kolmogorov form | `N(1/n, 1)`; nonmeasurable `A` of outer measure `1` | `Φ(1/(2n)) - Φ(-1/(2n))`; `μ{1/2 < d_BL(δ₁, δ₀) = 1} = μ A = 1` | true | none |
| 2.1 Pólya density, Hermite rule | scaling by `L`; `k = 3`, `t = 1`; `1_{[0,1]}` at `π` | `2∫_a^∞ 2/(πLx²) = 4/(πLa)`; `i³e^{-1/2} = -0.6065i`; `(e^{iπ} - 1)/(iπ) = 2i/π` | true | none |
| 2.2 smoothing inequality (sampled) | `P = δ₀`, `g = φ`, `x = 0`, `T = 1, 5` | left `0.5`; right `0.1413 + 3.0477 = 3.189`; `0.9877 + 0.6095 = 1.597` | true | none |
| 2.3 Berry–Esseen, sharpness | Rademacher `n = 100`; `k = 0`; `k → ∞` | bound `0.275`, atom `0.079589`; `1/2 ≤ 1/2` at `k = 0`; `√(2k)/(2√(πk)) = 1/√(2π)` | true | none |
| 3.1 lattice laws (sampled) | `1 + 2B`; Bernoulli; `(δ₀ + δ_{√2})/2` | support `{1, 3}`: `1` in `aℕ`, `2` with shift; spans `1`, `1/2`; `(1 + e^{2πi})/2 = 1` | true | none |
| 3.2 Cramér's condition, atoms | uniform; `(δ₀ + N)/2`; dimension `0`; `n = 0` | `≤ 2/|t| ≤ 1/2` at `R = 4`; `(1 + e^{-t²/2})/2 > 1/2`; vacuous, atom `1`; atom `1 ≤ C` | true; `⨆ x, f x ≤ C` parses as a real supremum | none |
| 4.1 cumulants and polynomials (sampled) | recursion `r = 2, 3`; exponential; Rademacher; `x = -2` | `g₁²/2 + g₂`, `g₁³/6 + g₁g₂ + g₃`; `p₂ = -x⁵/18 + 11x³/36 - x/12`; `He₃/12`; `Φ(-2) - φ(2) = -0.0312` | true | none |
| 4.2 one-term expansion, sharp constant | extrema of `(x² - 1)φ`; exponential `n = 10..10³` | `φ(0) = 0.3989`, `2φ(√3) = 0.178`; errors `0.0252, 0.0068, 0.0020`; `0.1330` vs `0.13298` | true | none |
| 4.3 lattice expansion (sampled) | Rademacher, `n` even, `x = 0`; `n = 100, 400, 1600`; Bernoulli `0.3` | both sides `1/2 + 1/√(2πn)`; `0.0125, 0.0062, 0.0031`; `0.0235, 0.0116, 0.0058`; without sawtooth `0.399` | true | none |
| 4.4 every order | `-X`; class with `a > 1`; `d = 0` | `p_r(x) = -p̃_r(-x)`; `cε^a ≤ max(c,1)ε`; empty determinant `1`, `Qₙ(A) = 1_A(0)` | true | none |
| 4.5 smooth functions, `t` statistic (sampled) | `A₁ = 0, A₂ = γ`; `A₁ = -γ/2, A₂ = -2γ`; samples `(0,1)`, `(1,3)` | `p₁ = -γ(x² - 1)/6`; `q₁ = γ(2x² + 1)/6`; plug-in variance `1/4`, `16` | true | none |
| 4.6 local expansion | exponential, `n = 10..10³` | `n · sup = 0.162, 0.115, 0.105` | true | none |
| 4.7 Cornish–Fisher (sampled) | exponential, `α = 0.05, 0.5, 0.95`, `n = 100, 1000` | `0.0193, 0.0002, -0.0199`; `0.0062, 0.00002, -0.0062`; median `n - 1/3` | true | none |
| 5.1 tilting (sampled) | `n = 0`; density ratio | both sides `δ₀`, factor `1`; `dPⁿ/dP_sⁿ = e^{n(K(s) - s x̄)}` | true | none |
| 5.2 saddlepoint (sampled) | exponential `n = 1, 2, 10, 100`; `N(m, 1)` | ratio `0.92214, 0.95950, 0.99170, 0.99917`; exponent `-n(x - m)²/2`, exact | true | none |
| 6.1 resampling kernel (sampled) | `x = (0, 1)`; non-Borel `A`; arbitrary `h` | masses `1/4, 1/2, 1/4`, variance `1/4`; law `(δ₀ + δ₁)/2`; `h` is a.e. a simple function | true | none |
| 6.2 bootstrap of the mean | `x = (0, 1, 2)` | `7/27` at `0`, `1/27` at `±√3`, variance `2/3` | true | none |
| 6.3 bootstrap Donsker | `n = 2`, `t ∈ [a, b)` | values `±1/√2, 0` with `1/4, 1/2, 1/4`; variance `1/4 = F̂(1 - F̂)` | consistent | none |
| 6.4 delta method, failure (sampled) | union of axes; `x²` at `0` | `min(|X₀ + Y₀|₁, |·|₂) = 1{X₀ ≠ Y₀}` → `(δ₀ + δ₁)/2 ≠ δ₀`; `Var(W² + 2zW) = 2 + 4z²` | true | none |
| 6.5 sample maximum | `x = (0, 1)`; `x = (1, 1)`; `bₙ = 0`; `n = 1, 2, 10, 100` | `3/4`; `1 ≥ 3/4`; atom `1`; `1, 0.75, 0.65132, 0.63397` | true for every sample; hypothesis superfluous | C01 |
| 7.1 jackknife | `x = (0, 1, 2)`, `g = id`, `g = t²` | `1/3`; deviations `13/12, -1/6, -11/12`, `(2/3)(294/144) = 49/36`; variant `1/4` | true | none |
| 7.2 subsampling (sampled) | bracketing of the quantile; the counterexample; `b = n - 1` | `J(c - ε) < 1 - α < J(c + ε)`; `(1 + b/n)(1 + 1/n) < 1 + 1/b`, coverage → `1`; `(X̄ - Xᵢ)/√(n - 1) → 0` | theorem true; one Check at the wrong scale | C02 |
| 7.3 empirical likelihood (sampled) | `x = (0, 2)`, `m = 1/2, 0, 3`; two-point law | `R = 3/4`, `-2 log R = 0.57536`; `R = 0`, `0`; `1 - 2^{1-n}` | true | none |
| 8.2 bootstrap expansion (sampled) | small `n`; indices `r > j`; sign of the quantile term | `C ≥ n₀^λ` makes the bound trivial; `p̂_r = p_r` there; `v̂ = z - n^{-1/2} q̂₁(z)` | consistent; `g` now `C^∞` | none |
| 8.3 accuracy (sampled) | `j = 2` for `T`, `j = 1` for `T*` | difference `n^{-1/2}(q̂₁ - q₁)φ + O(n⁻¹) = O_P(n⁻¹)` | consistent | none |
| 8.4 coverage | one-sided normal, percentile; two-sided; `α = 0.05`, `γ = 2`, `n = 25` | `1 - α - n^{-1/2}q₁φ`; `-(p₁ + q₁)`; even terms cancel; `0.1102`, `0.0809`; `-0.044`, `-0.032` | true | none |
| 9.1 invariance (sampled) | `block = (0,1,1)`, `q = (1, ½, ½)`; `p` with a zero | `2 + 1 + 1 = 4`; `16 - 16/9 = 128/9` both sides; variant `8/3 ≠ 10/3`; both sides `0` | true for all `p, u, v, w` | none |
| 9.2 Čencov | `m = 2`; rational point; centre embedding | forms on a line: dimension `1`; image `c_N`, `N ≥ 2`; `a_m = a_{mk}` | consistent | none |
| 9.3 trilinear forms | `m = 2, 3, ≥ 4`; `u = (2, -1, -1)` | multiplicity of `V` in `V ⊗ V`: `0, 1, 1`; `6m² ≠ 0`; at `c₂`, `4(abc - abc) = 0` | consistent | none |

- Source locators checked against the text: 0 (no cited text could be read legally; see Not verifiable). Every sampled statement was checked by computation instead.
- Library declarations opened at the pin: `tvDist` and `etvDist` (`Mathlib/MeasureTheory/Measure/TotalVariation/Defs.lean` lines 53–62, `Mathlib/MeasureTheory/VectorMeasure/TotalVariation.lean` line 41), the notations `ω` and `∞` (`Mathlib/Analysis/Calculus/ContDiff/FTaylorSeries.lean` lines 118, 120), `ciSup_le_iff'` (`Mathlib/Order/ConditionallyCompleteLattice/Indexed.lean` line 448), `MeasureTheory.Measure.quantile` (`TauCeti/Probability/Quantile.lean` line 164), `leftLim_cdf` (`TauCeti/Probability/Cdf.lean` line 263), `eq_withDensity_charFunDensity` (`TauCeti/Analysis/Bochner/CharFun/Inversion.lean` line 184); the 47 names of the `#check` block elaborate. No pinned declaration states a Kolmogorov distance, a cumulant, a lattice law, Cramér's condition or the Fisher–Rao form.
- Cross-roadmap citations resolved: ArithmeticStatisticsPartVIII §5.14 "Kolmogorov distance" at the head of its open pull request (README lines 355–359, the five facts as cited); MathematicalStatisticsFoundations 8.1–8.5, 9.1, 9.2 and MathematicalStatisticsAsymptotic 1.2, 1.3, 2.1–2.4, 3.4, 4.1, 4.2 on main; MarkovChainsAndRenewal Layer 5 item 3 on main (README line 325); MathematicalStatisticsNonparametric's pointer to this roadmap (README line 2937). The eleven local copies in `Suggested.lean` agree with the owners' definitions token for token.
- Dependency check: `depcheck: 182 roadmaps, 2069 edges, 0 problem(s)`; no UPWARD or CYCLE line. ArithmeticStatisticsPartVIII stands directly before this roadmap in the merge order. No change outside the roadmap folder.
- Automatic checks: all passed on this head. Elaboration of `Suggested.lean`: exit `0`, 50 `sorry` warnings and no other; no `set_option`, no sorry'd data.
- Elaborated signatures compared with the README statements for all 50 theorems: they agree; only `sample` drops a section binder, which it does not need.
- One-tactic probe on a copy of the file: `isMarkovKernel_bootstrapKernel` closes (it is marked as a check of the definition); the conditional-law statement, the nonlattice bound and the two invariance theorems do not close with `simp`.
- The pull request's title and description agree with the head: a new roadmap, nine layers, 50 admitted theorems, three roadmap suppliers, merge after ArithmeticStatisticsPartVIII.

Overlap check: read LocalLimitTheorems (open), MathematicalStatisticsAsymptotic, MathematicalStatisticsFoundations and MathematicalStatisticsNonparametric (main); MartingaleCentralLimitTheorem and SeriesOfIndependentRandomVariables (open) were searched by object only. Kolmogorov distance: owner ArithmeticStatisticsPartVIII §5.14, cited here. Lattice laws on `ℝ` with their characterization: owner this roadmap (3.1); LocalLimitTheorems keeps integer laws of maximal span one as a proof step and says so. The bounded continuous density of `Sₙ` for `n ≥ ν`: a proof step in 4.6 here and in LocalLimitTheorems 3.1–3.2, a target in neither. Berry–Esseen bounds, Edgeworth expansions, the bootstrap, the jackknife, empirical likelihood and subsampling: assigned to this roadmap by MathematicalStatisticsAsymptotic (README line 107). Nothing else shared.

Source independence: 0 passages compared with 0 sources (no cited text could be read legally); largest share Hall, about 30 of 99 page locators; Hall's contents could not be read, so the arrangement was not compared with it. On the README's own evidence Hall is cited only in 3.2, 4.1, 4.5, 4.7 and Layer 8, and Layers 1, 2, 5, 6, 7 and 9 cite other books only.

Research link: The headlines are theorems of Petrov (1975), Bhattacharya–Ranga Rao (1986), Hall (1992), Shao–Tu (1995), Politis–Romano–Wolf (1999), Owen (2001) and Čencov (1982) on Edgeworth expansions, the bootstrap, subsampling, empirical likelihood and invariant metrics, which later resampling and information-geometry work builds on; rests on the README's locators alone.

## Not verifiable

- Hall (3.2, 4.1, 4.5, 4.7, 8.1–8.4), Petrov (2.2, 2.3, 4.2–4.4), Bhattacharya–Ranga Rao (2.2, 2.3, 4.2, 4.4, 4.6, 5.2), Shao–Tu (6.2, 6.4, 6.5, 7.1), van der Vaart (1.1, 6.2–6.5), van der Vaart–Wellner (1.2), Durrett (2.1–2.3, 3.1), Severini (5.1, 5.2), Owen (7.3), Politis–Romano–Wolf (7.2), Čencov (9.1–9.3), Amari–Nagaoka (9.2): the sources service found no legal copy (publisher pages paywalled or on hosts it does not classify; the Čencov lookup failed on a rate limit). The operator's local texts contain none of them.
- All fifteen sampled targets therefore have unchecked locators (6.1 has none); each was checked by computation (table above).
- The printed page numbers of Durrett: the previous review read the author's online copy, whose pagination differs from the README's; the printed Cambridge edition was not opened in either round.
- The README's sentence in 7.2 that Politis–Romano–Wolf, Thm 2.2.1(iii), assumes only continuity at the quantile.
- Ownership against board packages not yet in a pull request was not checked.

## Source issues

- none

## For the human reviewers

- **Not tested.** Hall (1992) carries about 30 of 99 page locators and could not be read legally, nor could any other cited book; the wording and arrangement checks against sources were not made.
- **Source claim.** 7.2 (README line 1152) says Politis–Romano–Wolf, Thm 2.2.1(iii), p. 43, is printed with an insufficient hypothesis. The README's counterexample is correct (recomputed); whether the book prints only that hypothesis was not checked.
- **Licence.** The README's "Prior formalization" section (line 1739) says parts of Layers 1, 3–6, 8, 9 are stated in `CKSD/Asymptotics/` of bjbraams/lean-CKSD (Apache 2.0, the author's own project); the Lean was not compared with it this round.
