# Review of StandardDistributions (pull request #2682 at b0d099d)

**Verdict:** accepted

**Summary.** Accepted. The two false Checks are corrected: §6.2 now gives the right Jacobian value and §12.1 the right semicircle variance. §5.3 is now declared the owner of the real Wick–Isserlis formula, and the quantile statement that one tactic closed is gone from `Suggested.lean`. All three recompute correctly at this head, and the new Nolan locators of Layer 15 match the text. The earlier locator correction is only partly repaired, and the §10.17 locator has a new slip: two small corrections, no format notes, none blocking. The three questions for the human reviewers from the previous review still stand.

## C01 — Many locators still cite a whole book, and §7.8 and §14.4 cite nothing at the claim

The repair gave Layer 15 and §10.17 exact locators, but elsewhere a reader still cannot find the cited statement in the source. The remaining whole-book citations are:

- "(Billingsley)" in §0.1, §0.2, §0.4, §4.6, §7.2, §7.3, §7.4, §7.11 and §13.3 (for example lines 219, 268, 3207, 3939);
- "(Eaton)" in §5.1–§5.3 and §11.2 (lines 1812, 1853, 1903, 7696);
- "(Anderson 2003)" in §5.4 (line 2031);
- "(Johnson, Kotz and Balakrishnan, vol. 1)" at fifteen places from §1.5 on (line 592 is the first).

§7.8 and §14.4 still cite nothing at the claim. No stated result is left unsupported, because each statement already proved rests on a declaration at the pin. Adding a chapter, section or theorem number to each of these would make the citations usable.

## C02 — §10.17 cites the Details section of the R documentation for both conventions, but the Poisson mixture is in its Source section

The passage at line 7113 reads "R noncentral Beta documentation, Details, ratio and Poisson-mixture conventions". Under Details (RNoncentralBetaDoc lines 85–91) a reader finds only the ratio definition `X/(X + Y)`, with Johnson et al. p. 502. The derivation as a Poisson mixture of Beta laws, with pp. 502–503, is under Source (lines 117–123). Writing "Details for the ratio, Source for the Poisson mixture" would point to both places.

## Previous findings

- R01 — repaired: "Applying the one-based exponent `p − i + 1` to the zero-based index `i.val` would give `4x³z²` instead." (line 2626). The exponents `3, 2` give `4x³z²`; the Check is now true.
- R02 — repaired: "parameters `(d/2, d/2)` would give the semicircle law, of variance `1/4`" (line 8252), as in §10.20.
- R03 — repaired: "It owns the real Wick–Isserlis formula (§5.3): RandomMatrices … takes the real case of its §2.5 from here and owns the complex formula" (line 9765). RandomMatrices §2.5 on main (line 560) still lists both formulas until its next revision.
- C01 — repaired: `map_uniform_quantile` is gone from `Suggested.lean`, its docstring and the Scope list. §7.2 now states the identity through `TauCeti.Probability.uniformMeasure_eq_smul` and `MeasureTheory.restrict_Ioo_eq_restrict_Ioc`.
- C02 — partly repaired: Nolan locators were added in §15.1, §15.4 and §15.5, and JKB vol. 2, pp. 502–503, in §10.17. The whole-book locators and the uncited §7.8 and §14.4 remain (C01 above).
- N01 — repaired: "`Nat.succ` (§9.10) is not Mathlib's: it is a constructor of Lean core's `Nat`, in `Init/Prelude.lean` of the Lean toolchain."
- N02 — repaired: the two merged proposals are replaced by `ProbabilityTheory.integral_of_hasLaw_binomial` and `MeasureTheory.Measure.uniformOfFinset`. The rest have no counterpart at the pin; binomial variance, for example, is absent.

## Verified sound

| Statement | Instances tried | Values computed, each side | Result | Change |
| --- | --- | --- | --- | --- |
| 6.2 Jacobian Check (R01) | `p = 2`, `L = [[x, 0], [y, z]]` | rows `(2x,0,0), (y,x,0), (0,2y,2z)`: det `4x²z`; `p − i.val + 1 = 3, 2` gives `4x³z²` | true | none |
| 12.1 sphere-coordinate Check (R02) | `d = 3`; Beta `(3/2, 3/2)` vs `(1, 1)` | `Var Y = 1/16`, `Var(2Y − 1) = 1/4` (§10.20: `1/4`); right law `1/3` | true | none |
| 7.2 uniform-law quantile (old C01) | `uniformMeasure 0 1`; `μ = δ₅` | `ofReal(1)⁻¹ • vol\|(0,1] = vol\|(0,1)`; Quantile.lean:858 gives `μ`; `Q ≡ 5` on `(0, 1]`, image `δ₅` | true, prose only | none |
| 15.1 exponent and `S₁` location (seeded) | `u = st`, `α ≠ 1` and `α = 1`; `u = e`, `β = 1` | both match Nolan (1.4), (1.6); `d = m − βs tan(πα/2)` = (1.7); `−1.73051`; `−1.72965` (`α = 0.999`); `−1.73060` (`α = 1.0001`) | agrees | none |
| 15.4 `support_stableMeasure` (headline) | `α = 1/2, β = ±1, s = 1, m = 0`; `α = 1, β = 1` | Lemma 1.10 `S₀`: `[−1, ∞)`, `(−∞, 1]` = `[d, ∞)`, `(−∞, d]`; `ℝ` | agrees with p. 12 | none |
| 15.5 moment threshold, mean (headline) | Cauchy `α = 1`; `α = 3/2, β = 1` | `\|x\|^q` integrable iff `q < 1`; Prop. 1.13 mean `δ₀ − βγ tan(3π/4) = m + s = d`; `α ≤ 1`: `E\|X\| = ∞` (p. 16) | agrees | none |
| 15.5 tail limits (headline) | Cauchy; Lévy `α = 1/2, β = 1`; `β = −1` right tail | `C₁ = 1/π`: `s/(πx)`; `2C_(1/2) = 0.79788 = √(2/π)`; `β = −1`, `α < 1`: tail `0` eventually `= C(1 + β)` | limit form holds; Nolan states `β ≠ −1`, as the text says | none |
| 15.6 exponential domain (seeded, uses 15.1's `d`) | `α = 1/2, β = 1, s = 1, m = 0, t = −1/2` | `K = dt − √(2s\|t\|) = 1/2 − 1 = −1/2` = Lévy(−1, 1) cgf | agrees | none |
| 10.17 locator | R documentation Details vs Source | ratio at lines 85–91 (p. 502); Poisson mixture at lines 122–123 (pp. 502–3) | section slip | C02 |
| 5.3 Wick–Isserlis (headline; ownership sentence) | positions `(i, i, j, j)`; `(i, i, i, i)`; odd; empty | `S_ii S_jj + 2S_ij²`; `3S_ii²`; `0`; `1` | agrees; owner here, RandomMatrices to cite | none |

The rows for the statements the diff does not touch stand as in the previous review, of `50d92b1`.

- Source locators checked against the text. Nolan2020: Def. 1.7 (line 534, p. 8), (1.7) (line 675, p. 11), Lemma 1.10 (line 698, p. 12), Thm 1.12 and its reflection (lines 791–810, pp. 14–15), moments (lines 825–828, p. 15), Problem 1.11 (line 1197, p. 23), Prop. 1.13 and the `α ≤ 1` mean (lines 843–847, p. 16). The printed page is the PDF page minus 10. RNoncentralBetaDoc: lines 57, 85–91, 117–123.
- Library declarations opened at the pin: `TauCeti.Probability.uniformMeasure` (Uniform/Basic.lean:106) and `uniformMeasure_eq_smul` (:117); Mathlib `MeasureTheory.restrict_Ioo_eq_restrict_Ioc` (Typeclasses/NullSingletonClass.lean:138), `ProbabilityTheory.integral_of_hasLaw_binomial` (Distributions/Binomial.lean:185), `MeasureTheory.Measure.uniformOfFinset` (Distributions/Uniform.lean:199); `MeasureTheory.Measure.map_quantile_volume_Ioo` (TauCeti Probability/Quantile.lean:858); `Nat` (Lean v4.36.0-rc2 `Init/Prelude.lean`:1357).
- Cross-roadmap citations resolved:
  - RandomMatrices §2.5 (main, lines 558–560);
  - the §5.3 Wick–Isserlis citations at the heads of ConstructiveFieldTheoryPhi4 (line 722), FreeProbability (lines 1330, 1639, 1863) and HabiroNahmSeries (line 2175).
  - No open pull request changes this roadmap or RandomMatrices.
- Scope list of Layer 7 (`§7.1, §7.3, §7.4, §7.11`): each item matches a remaining target at lines 3166, 3329, 3456, 3967 and 3985. §7.2 has no target left.
- Automatic checks: all passed, and none was set aside. The gate rerun on this head reports OK on every check. The dependency check gives `depcheck: 191 roadmaps, 2122 edges, 0 problem(s)`, with no UPWARD or CYCLE line. There is no change outside the folder.
- Elaboration: 13 "declaration uses `sorry`" warnings and nothing else. `#check @` was run on all 14 declarations: every signature matches its README statement, no binder was lost, and no statement changed. The seven `TauCeti.*` imports are all built.
- The pull request's description was read against this head and agrees with it on every point: the Wick ownership, the seven imports, `map_uniform_quantile` not restated, and the merged Mathlib proposals.

Overlap check: RandomMatrices (main) was read, and every roadmap was searched for the Wick–Isserlis formula. The real formula is owned here (§5.3); RandomMatrices §2.5 still lists it until revised. For GaussianLinearModels, RandomProjectionsAndSketching, PoissonApproximation, MathematicalStatisticsFoundations, MathematicalStatisticsHigherOrderAndResampling and MathematicalStatisticsAsymptotic, the shared objects and owners stand as in the previous review; no change here touches them.

Source independence: changed passages only. 7 passages were compared with 2 sources (Nolan2020, RNoncentralBetaDoc), and none shares wording beyond formulas and theorem labels. No layer was added, removed or reordered, so the arrangement stands as in the previous review. The largest share of locators is still Johnson–Kotz–Balakrishnan's (38 citations in the layers by plain count), and its text could not be read.

Research link: Layers 6, 14 and 15 state the Wishart theory (Muirhead 1982; the branch issue of Mayerhofer 2019), the LKJ partial-correlation construction (Lewandowski, Kurowicka and Joe 2009) and the stable laws (Nolan 2020) that RandomMatrices and the statistics roadmaps consume. This rests on the README's References and Downstream consumers and on Nolan2020 ch. 1.

## Not verifiable

- Johnson–Kotz–Balakrishnan (1994, 1995), Johnson–Kemp–Kotz (2005), Muirhead (1982), Anderson (2003), Eaton, Billingsley (1995), Coles (2001), Azzalini–Capitanio, Mardia–Jupp, Fisher: books with no known legal copy. This includes JKB vol. 2, pp. 502–503, which was checked only through the R documentation's citation of it.
- Lewandowski, Kurowicka and Joe 2009: paywalled, recorded as uncertified.
- Heyde 1963: the publisher's page returned HTTP 403.
- Aitchison and Shen 1980, and the PyMC logit-normal page: not read.

## Source issues

- **Gap** in Nolan2020 at §1.5, p. 15, with Problem 1.11, p. 23: the source says Problem 1.11 yields the moment threshold `p < α` for every stable law with `α < 2`, but the problem assumes both tails Pareto-like, which fails for `|β| = 1`; it should be: a Pareto upper bound on both tails and a Pareto lower bound on one tail suffice; affects nothing.
- **Misprint** in RNoncentralBetaDoc at Details, line 86: the source cites a single page as "pp. 502"; it should be "p. 502" (the Source section gives pp. 502–3); affects nothing.

## For the human reviewers

- Scope: the subject is the standard probability laws. The located sources are handbooks (Johnson–Kotz–Balakrishnan, Johnson–Kemp–Kotz, Muirhead), and several conventions rest on software documentation (SciPy, R, PyMC, Stan; README References). Twelve roadmaps on main consume this one.
- Pin: `STATUS.md` in this folder reports that Tau Ceti at aa6e43e (2026-11-13) proves the independence of the LKJ partial correlations and stable support and moment results. The pin is 2fd255d (2026-11-04), where these are absent. After a pin bump, several `Suggested.lean` headlines would restate library declarations.
- Not tested: Johnson–Kotz–Balakrishnan, the source with the most locators, could not be read, so neither the wording nor the arrangement was compared with it.
