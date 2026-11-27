# Review of QuadraticFormsAndMultivariateTests (pull request #3199 at 5213fe7)

**Verdict:** accepted

**Summary.** Accepted: every statement of the four layers was re-derived and every Check recomputed, and no statement, Check or route step was found false, vacuous or unowned. There are three small corrections (the centred case of 2.4 is already a Tau Ceti theorem and is not cited; the source cited for 4.1 proves a neighbouring model, not a case of 4.1; the univariate case of 3.1 is owned by MathematicalStatisticsFoundations 5.2 and is not named) and one format note, none blocking. Two of the four sources (Ogawa–Olkin 2008 and Styan 1969) could not be read legally, so the locators of Layers 1 and 2 are not verified against the text; that, and the standing of the sources, is left to the human reviewers.

## C01 — The centred term of 2.4 is already in Tau Ceti and is neither cited nor used

In 2.4 (README lines 208–223) the covariance is labelled "Proved here", with only Ogawa–Olkin's case `C = 1`, `μ = 0` named as prior, and the route obtains `2 tr(ACBC)` from the fourth-moment formula. The pinned Tau Ceti already has this term: `TauCeti.Probability.covariance_trace_mul_wishartGramMeasure` (`TauCeti/Probability/Distributions/Wishart/Moments.lean`, line 464) gives, for `S ⪰ 0` and symmetric `Θ`, `Φ`, the covariance `2 ν tr(Θ S Φ S)` of `tr(ΘW)` and `tr(ΦW)` under `wishartGramMeasure ν S`; at `ν = 1` the Gram sum is `x xᵀ` and `tr(Θ x xᵀ) = ⟪x, Θx⟫`, so this is 2.4 with `μ = 0` on `Fin p`. RandomProjectionsAndSketching already cites the variance companion for the same purpose. An implementer following the route as written would prove the centred case a second time.

The statement stays (the mean term `4 ⟪μ, ACBμ⟫` and the general index type are new). The smallest change: say in 2.4 that the centred case on `Fin p` is the `ν = 1` case of that declaration, add it to the *Needs:* line and to "From Tau Ceti", and list it under "Already in the library" in the scope section.

## C02 — The theorem cited for 4.1 is not a case of 4.1

The locator of 4.1 (README line 381) reads "von Luxburg–Franz 2007, §2.2, Definition 2 and Theorem 3, pp. 8–9, for a paired normal sample", which a reader takes to mean that the source's theorem is the statement restricted to a paired sample. It is not: their Theorem 3 (their text, lines 296–298, with the pivot at lines 300–305) has an i.i.d. sample from `N(μ, C)` with the whole matrix `C` unknown, and the set is built from the sample covariance matrix, with `n − 1` degrees of freedom. In 4.1 the matrix `V` is fixed and only the scale `σ²` is estimated by an independent `s²`, so `fiellerSet Y V (q² s²)` cannot take a random matrix in the place of `V`; neither statement contains the other. The locator and the page numbers are right, and 4.1 itself is true as stated: I checked the route (`D = Y₀ − ρY₁` has law `N(0, σ² ⟪w, Vw⟫)`, `T = D/(|s| √⟪w, Vw⟫)` is Student, `s = 0` is null).

The smallest change: write that 4.1 is proved here in the model with covariance known up to scale, and that the source states the paired-sample analogue with an estimated covariance matrix. If the paired-sample form is wanted as well, it would be a separate statement: Layer 3 already supplies its inputs (3.1 gives `x̄` and the scatter matrix independent, and `⟪w, Ww⟫` is a scaled `χ²(n − 1)` for `w ≠ 0`).

## C03 — The scope section does not name the owner of the univariate case of 3.1 and 3.3

MathematicalStatisticsFoundations 5.2 (`gaussian_sample_mean_residual_laws`, README on main, lines 792–796) states, for an i.i.d. `N(m, v)` sample with `n ≥ 2` and `v > 0`, that `SS/v` is `χ²(n − 1)`, that `SS` is independent of `x̄`, and the Student law of the one-sample statistic. This is the case `p = 1` of 3.1 and of the central case of 3.3 (the Check "`p = 1`: `T² = t²`", line 358, refers to exactly that statistic). The scope section (lines 451–463) lists MathematicalStatisticsFoundations 9.5 but not 5.2, so a reader cannot tell that the one-dimensional case has an owner, or that 3.1 is kept as the multivariate statement. GaussianLinearModels makes the corresponding remark about its 3.4 and 3.5.

The smallest change: one clause under "Left to others", for example that MathematicalStatisticsFoundations 5.2 states Student's theorem for a real Gaussian sample, of which 3.1 is the vector form with a possibly singular covariance and 3.3 the vector form of the statistic.

## N01 — The Wilkinson reference has no date

The lecture notes are a web book whose result numbers can change when it is rebuilt; the reference (line 528) gives neither a year nor a date of access. Adding the date at which Proposition 7.4, Proposition 7.10, Definition 7.4, Propositions 7.11–7.12 and Corollary 7.4 carried these numbers would keep the locators checkable.

## Questions for the author

- 2.2 cites Styan's Theorem 5 "with mean `0`", which suggests the source treats a general mean, and the scope section lists only "noncentral forms of Craig's theorem" as not treated. Do Styan's Theorems 2 and 5 state the noncentral chi-squared and independence criteria for `N(μ, C)`? If so, the scope line would also name the noncentral form of 2.1 and of 2.3 as outside this roadmap. I could not read the report (see below), so this is a question and not a remark.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 determinant identity | `A = [[0,−1],[−1,0]]`, `B = diag(1,−1)`; non-symmetric `A = diag(1,0)`, `B = [[0,1],[0,0]]` | first: lhs − rhs `= −s²t²`, `AB ≠ 0`; second: both sides `1 − s`, `AB = B ≠ 0` | iff holds; symmetry needed | none |
| 1.1 route, steps 4–5 | the 3×3 pair of the third Check | `4 tr(A²B²) + 2 tr(ABAB) = 314`; `2 tr(GGᵀ) + tr(G²) = 157` | sound | none |
| 2.1 chi-squared forms | `C = diag(1,0)` with `A = [[1,5],[5,7]]` and `A = [[0,1],[1,0]]`; `C = 0` | first: `CACAC = CAC = diag(1,0)`, `tr(AC) = 1`; second: `CAC = 0`, `(AC)² = 0 ≠ AC`; `χ²(0) = dirac 0` | sound | none |
| 2.2 Craig | `C = 1`, pair of 1.1; `C = diag(1,0)`, `A = diag(1,0)`, `B = [[0,1],[1,0]]`; `A = B` | `tr(AB) = 0`, `AB ≠ 0`; singular: `AB ≠ 0`, `CACBC = 0`; `A = B`: `CACAC = 0 ⟺ KAK = 0` | sound both ways | none |
| 2.3 Kac | `C = 1`, `a = e₁`, `A = e₂e₂ᵀ`, `e₁e₁ᵀ`; `C = diag(1,0)`, `a = e₂`; `a = 0` | `Aa = 0`, `Aa = e₁`; singular: `Ca = 0`, `CACa = 0`; `C a aᵀ C A C = (Ca)(CACa)ᵀ` | sound | none |
| 2.4 covariance | `L = [[2,0],[1,3]]`, `μ = (1,−2)`; singular `L = [[1,0],[2,0]]`, `μ = (3,1)`; non-symmetric `A` | exact moments vs formula: `−3644 = −3644`; `603 = 603`; control `0 ≠ 4` | sound; symmetry needed | C01 |
| 3.1 multivariate Student | `n = 1`; `n = 0`; `n = p = 2`, `x = ((1,2),(0,−1))` | `n = 1`: scatter `0`, `W(0,S) = dirac 0`; `n = 0`: `x̄ = 0` vs `dirac μ`; scatter `½(1,3)(1,3)ᵀ` | sound; `n ≥ 1` needed | C03 |
| 3.2 Gaussian against Wishart | `m < p`; `p = 1`; means at `p = 2`, `k = 5`, `λ = 3` | `m < p`: `dirac 0` vs zero measure; `p = 1`: `m y²/W`; mean `k(p+λ)/(p(k−2)) = 25/6` both sides | sound; `p ≤ m` needed | none |
| 3.3 Hotelling | 5-point sample, `μ₀ = (1,1)`; `n ≤ p` | `W = [[10,8],[8,21.2]]`, det `148`, `T² = 8/37`, scaled `3/37`; `n ≤ p`: `T² = 0` vs zero measure | sound | C03 |
| 4.1 Fieller | `μ = 0`; `q = 0`; `V = [[2,1],[1,1]]` | `μ = 0`: law free of `ρ`; `q = 0`: `P(D = 0) = 0 = t(ν)({0})`; `min(2 − 2r + r²) = 1` | sound | C02 |
| 4.2 shape of the set | `V = [[2,1],[1,1]]`, `c = 1`, `y = (3,4)`, `(3,½)`, `(3,1)`, `(1,1)`; `c = 0` | `a = 15, Q = 17`, roots `7/15, 1`; `a = −¾`, roots `(−2 ± 2√22)/3`; `[7/4, ∞)`; `e = −1 < 0`; `{3/4}` | sound; `b² − ae = c det V (Q − c)` | none |
| Matrix lemma of Layer 2 | arbitrary `M`, `K = √C` | `CMC = K(KMK)K`; conversely `KMK` vanishes on `range K` and on `ker K` | sound | none |
| `hotellingTSq`, `fiellerSet` | divisor `n` in the sample covariance; ratio reversed | divisor `n`: `10/37 ≠ 8/37`; reversed ratio at `y = (3,1)`: `[0, 4/7] ≠ [7/4, ∞)` | the Checks separate them | none |

- Source locators checked against the text: 8 (von Luxburg–Franz §2.2, Definition 2, Theorem 3, pp. 8–9; Wilkinson Proposition 7.4, Proposition 7.10, Definition 7.4, Propositions 7.11 and 7.12, Corollary 7.4, with the divisor `n`).
- Library declarations opened at the pins: 18 of Tau Ceti (all those of "From Tau Ceti", each with its hypotheses as the README states them, among them `mgf_inner_toEuclideanLin_multivariateGaussian` at `Gaussian/QuadraticForm.lean:160`, `map_inv_inv_apply_nonsingularWishartMeasure` at `Wishart/Inverse/Marginal.lean:112`, `wishartGramMeasure_eq_nonsingularWishartMeasure` at `Wishart/Agreement.lean:63`) and 12 of Mathlib (`multivariateGaussian` and `multivariateGaussian_of_not_posSemidef` at `Probability/Distributions/Gaussian/Multivariate.lean:166–172`, `stdGaussian_map`, `IndepFun.mgf_add`, `Matrix.det_one_sub_mul_comm`, `Matrix.inv_def`, `Matrix.det_fin_two`, and the others named in the *Needs:* lines).
- Junk values at the pin: `chiSquaredMeasure 0 = dirac 0`; `noncentralFMeasure` is `0` unless both degrees are positive; `Matrix.inv` of a singular matrix is `0`. The README states each of these correctly.
- Cross-roadmap citations resolved on main: 4 (GaussianLinearModels 3.3 and 2.2, MathematicalStatisticsAsymptotic 1.3, MathematicalStatisticsFoundations 9.5).
- Dependency check: `depcheck: 19 roadmaps, 22 edges, 0 problem(s)`; no UPWARD or CYCLE line. Every *Needs:* line read; all suppliers are the pins or roadmaps on main.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning (10 warnings, 10 theorems). Elaborated types of the 12 declarations compared with the README statements: equal generality, no binder lost.
- One-tactic probe (`simp`, `rfl`) on a copy: none of the 10 theorems closes. Headline theorems (1.1, 2.1–2.4, 3.1–3.3, 4.1, 4.2) are all stated; none is named as not statable and none needs to be.
- The worker's automatic checks all passed on this head; nothing was set aside. The pull request changes nothing outside the folder; its title and description agree with the head (10 theorems, 2 definitions, three Tau Ceti imports, a new roadmap).

Overlap check: read GaussianLinearModels, RandomProjectionsAndSketching, StandardDistributions (main), CharacterizationsOfTheNormalLaw, GaussianComparisonInequalities, DiscriminantAnalysisAndLogisticRegression (open); nothing shared. Neighbouring statements: the standard-Gaussian chi-squared characterisation (GaussianLinearModels 3.3, cited), the univariate Student theorem (MathematicalStatisticsFoundations 5.2, C03), the Wishart trace covariance (Tau Ceti, C01). No roadmap on main or open states Craig's or Kac's criterion, Hotelling's law or Fieller's sets. This roadmap owns them.

Source independence: 13 passages compared with 2 sources (von Luxburg–Franz, Wilkinson), none shared; largest share Ogawa–Olkin 2008, 7 of 16 locators; contents not compared with it: its text could not be read, and neither could Styan 1969. Against Wilkinson's contents (§7.1.5, §7.2, §7.3) Layer 3 merges the first two into 3.1 and adds 3.2 with a noncentral law; the order 3.1, 3.2 → 3.3 is forced by the *Needs:* line of 3.3.

Research link: Layer 4 states the Fieller sets that von Luxburg–Franz (2007) reconstruct geometrically and extend to bootstrap sets (their text read); Layers 1–2 are the Craig–Sakamoto–Matusita theorem that Ogawa–Olkin (2008) survey (README references only; text not read). The README names no current research that uses the results.

## Not verifiable

- Ogawa–Olkin 2008 (§2 (C), (O); §3 (3.1), (3.2); §5; §7), cited in 1.1, 2.2, 2.3, 2.4: the DOI resolves only to the publisher's paywalled page; no open copy found through the sources service. The statements were checked by computation, not against the text.
- Styan 1969 (Theorem 2 p. 2, Theorem 3 p. 2, Theorem 5 p. 6), cited in 2.1 and 2.2: the University of Minnesota Digital Conservancy is in no licence class of the sources service and its handle answered HTTP 403; a DTIC address failed on name resolution twice. Not read.
- Fieller 1954, Kac 1945, Khatri 1963: named without locators; not looked for.

## Source issues

- **Error** in von Luxburg–Franz 2007 (arXiv:0711.0198v1) at Definition 2, pp. 8–9: the source says the set is the bounded interval between `l₁` and `l₂` in every case outside the two unbounded ones; it should be a closed half-line when the denominator `μ̂₁² − q² ĉ₁₁` is `0` and `q² < q²_complete`, where `l₁,₂` is undefined; affects nothing.
- **Gap** in Wilkinson, MATH3030 notes at Proposition 7.4, §7.1.5: the source says the mean is independent of the sample variance matrix because it is independent of each deviation `xᵢ − x̄`; it should use that the mean is uncorrelated with, and jointly normal with, the whole vector of deviations; affects nothing.
- **Misprint** in Wilkinson, MATH3030 notes at the proof of Corollary 7.3, §7.3: the source says the independence of mean and covariance matrix is "Theorem 7.4"; it should be Proposition 7.4; affects nothing.

## For the human reviewers

- Scope: the headline theorems date from 1931–1954 and are textbook multivariate statistics; the README's sources are one 2008 survey article, a 1969 technical report, a 2007 arXiv preprint and undergraduate lecture notes. Whether this is in scope is yours to decide.
- Scope: Layer 3's only locators are to lecture notes for an undergraduate module (Wilkinson, MATH3030), which leave the `F` law of `T²` unproved (Proposition 7.12, "beyond the scope of the module"); no refereed source is cited with a locator for Hotelling's theorem.
- Licence: Styan 1969 is an unpublished technical report held in the University of Minnesota Digital Conservancy, a host the sources service does not classify; Wilkinson's notes are on the author's GitHub page with no licence statement in the pages read.
- Not tested: Ogawa–Olkin 2008 has the largest share of the locators (7 of 16) and its text and table of contents could not be read; wording and arrangement were not checked against it, nor against Styan 1969.
