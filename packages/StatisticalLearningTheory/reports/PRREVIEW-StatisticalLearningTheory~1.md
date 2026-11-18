# Review of StatisticalLearningTheory (pull request #2515 at e974000)

**Verdict:** needs changes

**Summary.** Changes are needed, for two reasons: one Check in 3.1 asserts something false (its example for the realizable convention is not realizable under either convention), and `Suggested.lean` leaves out headline theorems that are statable with the definitions it already has, without saying which headlines are not statable. No stated theorem was found false: every statement was recomputed at small cases and the 45 Lean statements elaborate with `sorry` as the only warning. There are nine small corrections and four format notes, none blocking. Two points are left to the human reviewers: the most-cited source could not be read, and the Lean file was not compared with the author's earlier formalization.

## R01 (P2) — The negative control for the realizable convention in 3.1 is not an example: under `δ_(0, true)` the infimum of the errors is `1`, not `0`

The last Check of 3.1 (line 625) says that with "infimum of the errors is zero" in place of "some member has error zero", the class `{x ↦ decide (x ≤ t) | t < 0}` under `δ_(0, true)` "would be realizable although every member errs at `0` with probability `1`". Every member predicts `false` at `0` (since `0 ≤ t` fails for `t < 0`), so every member has error exactly `1` and the infimum is `1`: the law is realizable under neither convention, and the Check does not separate them. A reader who uses it to see why the Conventions choose the stronger notion is misled. No point mass can serve, because under a point mass every error is `0` or `1`, so the infimum is attained.

The smallest repair is a law whose errors accumulate at `0`: the same class with `X` uniform on `(-1, 0)` and `Y = true`. The member with threshold `t` errs with probability `P(X > t) = -t`, so the infimum over `t < 0` is `0` and no member attains it.

## R02 (P2) — Headline theorems that are statable with the file's own definitions are absent from `Suggested.lean`, and its docstring does not say which headlines are not statable

The README says the Lean file "is not an exhaustive acceptance test" and that the other bold results "are targets of the same standing"; the module docstring repeats this without naming any of them or what each lacks. An implementer therefore cannot tell which of the README's headline results the finished library is tested against, and several of the deepest ones are tested by nothing. In 5.2 the only Lean statement, `bayesRisk_le_nnRisk_le`, is an inequality between integrals of an arbitrary `η` and mentions no nearest-neighbour rule, while the theorems of that section (the limit of the 1-NN error, the `k`-NN limits and consistency) are absent.

I checked statability by elaborating the statements appended to a copy of the file, using only its existing definitions: Massart's lemma (2.1) with `empiricalRademacherComplexity` on a `Fintype` class; the finite-class deviation bound of 2.4 with `empiricalError` and `classificationError`; and the infinite-VC lower bound of 3.3 with `vcDim` (the result 3.4 relies on). All three elaborate with `sorry` as the only warning. The 1-NN limit needs one more definition, the index of the nearest sample point with ties broken by index, of the size of `aboveThresholdIndex`.

The smallest change: state the absent headlines that are statable (at least the three above and the 1-NN limit), and list in the module docstring each headline that is not stated, with the carrier it lacks (for advanced composition, the `k`-fold adaptive composition).

## C01 — The Azuma inequality that 7.3 needs is not in Tau Ceti's bounded-differences file

The `*Needs:*` line of 7.3 (line 1292) cites "Azuma's inequality from Tau Ceti's bounded-differences file, in its martingale form". `TauCeti/Probability/McDiarmid.lean` at the pin has two public theorems, both for functions on a finite product (`hasSubgaussianMGF_of_bounded_differences`, line 351, and its `Fin n` form, line 383), and no martingale statement. The martingale form is in Mathlib: `ProbabilityTheory.measure_sum_ge_le_of_hasCondSubgaussianMGF` (`Mathlib/Probability/Moments/SubGaussian.lean`, line 915). Cite that, and add it under "From Mathlib".

## C02 — The Check after 3.5 that the bound cannot be raised to `1/2 + ε` uses `n = 0`, where it can be raised to `1`

The Check (line 743) argues from the average over random labellings, which is `1/2`. But the theorem asks for one law per rule, and for `n = 0` the rule is a fixed classifier `g`: the law `δ_(x, ¬g(x))` has a classifier of error zero and gives the rule error `1`. A witness that does show sharpness: the majority-label rule with `n` odd, whose error on a law with a fraction `p ≥ 1/2` of one label is `P(maj right)(1 - p) + P(maj wrong) p ≤ 1/2`.

## C03 — 5.2 attributes random tie-breaking to Devroye–Györfi–Lugosi, who break distance ties by index in the theorems cited

The paragraph after the bullets of 5.2 (line 936) says the source breaks ties "by independent uniform marks" and that the limits agree "by the same argument". In the source the `k`-NN rule of Thm 6.4 is defined with ties broken by comparing indices (DGL1996 lines 3876–3877, p. 101), and the source states that index comparison suffices for weak universal consistency (DGL1996 lines 5984–5985, p. 170); randomization appears only in §11.2, for strong consistency. So the convention here is the source's own and the bridging sentence can go.

## C04 — The Check of 2.3 cites Asymptotic 3.2 for a class with a non-measurable supremum, which 3.2 does not contain

The second Check of 2.3 (line 546) says "Asymptotic 3.2 records a class without it whose supremum is not measurable". The Check in MathematicalStatisticsAsymptotic 3.2 shows that the singleton indicators `1_{t}`, `t ∈ [0, 1]`, are not pointwise separable; it says nothing about measurability, and the supremum of that class is the constant `1`. Say that 3.2 records a class that is not pointwise separable, or give a class with a non-measurable supremum here.

## C05 — Basic composition is stated adaptively but cited to a theorem about independently run mechanisms

7.3 (line 1275) states the two-step adaptive form and cites Dwork–Roth, Thm 3.16, p. 43. That theorem is for `M(x) = (M₁(x), …, M_k(x))` with each `M_i` a function of the data only (DworkRoth2014 lines 1534–1537). The adaptive two-step form with `δ > 0` is Thm B.1 of Appendix B (DworkRoth2014 lines 9653–9658). Cite Thm B.1 beside Thm 3.16.

## C06 — 4.2 cites Nonparametric 5.8 for the existence of minimizers, which 5.8 does not state and 4.2 does not use

The `*Needs:*` line of 4.2 (line 815) cites MathematicalStatisticsNonparametric 5.8 "for the existence of minimizers in the span of the kernel functions". The representer theorem there says that every minimizer lies in the span; it does not assert that one exists. The stability statement takes "any minimizer" as a hypothesis and its route uses only strong convexity, so the item can be dropped.

## C07 — Two Lean statements ask an implementer for nothing

`le_add_two_mul_add_of_isApproxMin` (1.1) is closed by `grind` alone, and also by one `linarith` from its hypotheses; it names no object of the roadmap. The first half of `impurityDecrease_nonneg` (6.2) is one `linarith` from `StrictConcaveOn.concaveOn`, and the README says of it "The first is the definition of strict concavity". If they are kept as sanity checks, mark them so in their docstrings; otherwise the README statements suffice as targets.

## C08 — The scope promises consistency of response-independent forests, and 5.3 states no such theorem

Item 5 of the scope lists "the consistency of response-independent forests". The forest bullet of 5.3 (line 972) says only that Stone's theorem "applies once the three conditions are verified for the partition scheme", with a parenthesis about shrinking cells and growing counts. Either state the theorem with its hypotheses (diameter of the cell of `X` tending to `0` and the number of sample points in it tending to infinity, both in probability, and what is assumed for the domination condition), or word the scope as "local weight estimates, with forests as an example".

## C09 — In the contraction route, "for the empty class both sides are `⊥`" fails for `L = 0`

In the proof route of 2.1 (line 476): for `L = 0` the right side is `0 · ⊥ = 0` in `EReal`, not `⊥`. The inequality `⊥ ≤ 0` still holds; say "the left side is `⊥`".

## N01 — The closing `#check` block of `Suggested.lean` checks four of the file's own declarations

The block is headed "Supplier declarations" but includes `CostTree.cost`, `CostTree.numLeaves`, `CostTree.IsPruning` and `CostTree.existsUnique_isSmallestMinimizer`, and the section header has no declaration under it. Drop those four lines; the rest could move to the top or go.

## N02 — Four sentences refer to roadmaps "in an open pull request"

Lines 104, 106, 1569 and 1573. That wording dates the text; name the roadmaps (the bandits one is MultiArmedBandits) or say only what is outside the scope.

## N03 — Three results cited to papers have exact locators that could be given

Split conformal coverage is Lei et al., Thm 2.2 (Lei2018 line 360; its upper bound `1 - α + 2/(n + 2)` at calibration size `n/2` is the `1/(n + 1)` of 5.1); the contraction of 7.4 is Duchi–Jordan–Wainwright, Thm 1 (DJW2013 line 316), with constant `min{4, e^(2ε)}`; the sequential form is their Cor 1 (DJW2013 line 339).

## N04 — The table "Coverage of CKSD 107" cannot be resolved by a reader

It maps entry numbers of a synopsis that the README neither cites nor links. Link the synopsis or drop the table.

## Questions for the author

- 5.4 assumes a unique minimizing set of at most `k` centers. As I recall Pollard's theorem, it assumes uniqueness of the optimal set for every `j ≤ k`. The route given here (a center that escapes serves vanishing mass, so the rest would be a near-optimal set of `k - 1` centers, which uniqueness at level `k` forbids) seems to need only level `k`; is the weaker hypothesis intended, and should the difference from the source be recorded? I could not open the paper: Project Euclid refused the automated download.
- The Check of 3.1 that a finite nonempty class is agnostically learnable does not ask the members to be measurable, while the Hoeffding step of 2.4 does. Is measurability meant? I did not construct a counterexample.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.2 Bayes risk, excess identity (sampled) | `η ≡ 0.8`, `g ≡ false`; `η ≡ 0.2` | excess `0.8 − 0.2 = 0.6 = |2·0.8 − 1|`; risk `0.2 = min(η, 1−η)`; source Thm 2.1 p. 10, Thm 2.2 p. 16 read | holds |
| 1.2 plug-in margin bound | `η(x) = x` uniform, `η̂ = η + 0.1`; `η ≡ 1/2 + δ/2` | excess `∫_{0.4}^{0.5}(1−2x) = 0.01 ≤ 0.04`; `C ≥ 2/δ` gives `2Cδ² ≥ 4δ ≥ δ` | holds |
| 1.3 log loss, Brier (sampled) | `p = (.5,.3,.2)`, `q = (.2,.5,.3)` | `1.2534 = 1.0297 + 0.2237`; Brier excess `0.09+0.04+0.01 = 0.14`; expansion uses only `∑p = 1` | holds; source not read |
| 1.4 calibration, Zhang | hinge and squared hinge at `η = 0.8`; `η = 1`; `h ≡ 0`; both risks `⊤` | gaps `0.6`, `0.36`; `inf_g ≤ Φ(0) < ⊤` so no `⊤ − ⊤`; tie case gives `1 − 1/2 > 0` on left, `0` on right | holds with tie hypothesis |
| 2.1 complexity, contraction, Massart | empty class; `n = 0`; `{a, −a}`; two unit vectors, `n = 2`; `L = 0` | `⊥`; `0`; `1/2`; `1/4 ≤ 0.589`; `L = 0`: left `0` or `⊥`, right `0` | holds; C09 |
| 2.2 kernel ball (sampled) | `n = 1`, `K = 2`, `B = 3`; Gaussian kernel, two points; `n = 0` | `3√2` both sides; `0.6946 ≤ 0.7071`; `0 ≤ 0` | holds; source not read |
| 2.3 Rademacher bound | one-member class; `n = 1` | reduces to Hoeffding; `√(log(2/δ)/2) > 1` iff `δ < 2e⁻²` | holds |
| 2.4 finite classes, hold-out (sampled) | `t = √(log(2N/δ)/(2l))`; `N = 1`; `l = 0` | `2N e^{−2lt²} = δ`; `2t = √(2 log(2N/δ)/l)`; source Thm 8.3 p. 127 read | holds |
| 3.1 definitions and Checks (sampled) | `{h, ¬h}` on one point; `∅`; thresholds `t < 0` under `δ_(0,true)` | complexity `(1+0)/2`; `∅` not learnable; every error `1`, infimum `1` | definitions sound; Check false, R01 |
| 3.2 upper bounds (sampled) | `d = 0`; `n ≥ 2`; `ε → 1` | `log(en) ≤ 3 log n` iff `n ≥ 1.65`; `ln(12/ε) ≤ (1 + ln 6/ln 2) ln(2/ε)`; `d = 0` trivial | holds; sources not read |
| 3.3 lower bounds | `{h, ¬h}` on one point; three members, `d = 1`; `δ < 1/64` | sample complexity `≤ 1`; `ln(1/(8δ)) ≥ ½ ln(1/δ)`; finite support makes outer and discrete probabilities agree | holds |
| 3.4 fundamental theorem (sampled) | `ε = δ = 1/8`, shattered `K ≫ n` points | learnable gives `E R ≤ 1/4 < (1 − n/K)/2` | holds; sources not read |
| 3.5 no free lunch | `K ≥ n/(2ε)`; `n = 0` | `(1 − n/K)/2 ≥ 1/2 − ε`; at `n = 0` error `1` under `δ_(x,¬g(x))` | holds; Check C02 |
| 4.1 margin bound (sampled) | `u = ρ/2`, `−ρ`; one-sided 2.3 plus contraction `1/ρ` | ramp `1/2`, `1` (hinge `2`); `1{u ≤ 0} ≤ ramp ≤ 1{u ≤ ρ}` | holds; source not read |
| 4.2 stability | `n = 1`, `β = M`; two minimizers | `c = 2β + M/n` gives `(2nβ+M)√(log(1/δ)/(2n))`; `‖Δ‖ ≤ Gr/(nλ)`, loss change `G²r²/(nλ)` | holds |
| 4.3 kernel ridge | `n = 1`, `K = 1`; finite rank `m = 3`, `n = 100`; rank one, `μ → 0`; Sobolev `n = 5, 100` | `y/(1+2λ)`; both sides `0.24`; variance `≤ R²δ²/32`; `0.494`, `0.409` | holds, expectation form included |
| 5.1 split conformal (sampled) | `n = 9, α = .1`; `n = 4, α = .25`; `n = 1, α = .25`; ties | `k = 9`, `0.9`; `k = 4`, `0.8`; `k = 2 > n`, `⊤`; coverage `1` | holds; Lei Thm 2.2 read |
| 5.2 Cover–Hart and limits | `η ≡ 1/2`; `η ∈ {.1, .3}` | `1/2 = 1/2 = 1/2`; `0.2 ≤ 0.30 ≤ 0.32 ≤ 0.4`; source (3.1) p. 22, Thms 5.1–5.6, 6.4 read | holds; C03 |
| 5.3 Stone | bounded `g` versus integrable `g`; non-integrable `m` | monotone convergence; `m` determined a.e. on `{|m| ≤ N}` | holds; C08 |
| 5.4 `k`-means (sampled) | `C = ∅`; `k = 0`; support of `j < k` points; escaping center | `⊤`; both sets empty; two minimizers of risk `0`; contradiction with `m_{k−1} > m_k` | holds; sources not read |
| 6.1 pruning | `node 5 (leaf 2) (leaf 1)`, `α = 1, 2` | `5 < 6` keeps; `7 = 7` prunes; nesting from `opt_α' ≥ opt_α + (α' − α)` per child | holds |
| 6.2 impurity (sampled) | Gini and misclassification, `qL = (.9,.1)`, `qR = (.6,.4)` | `0.375 − 0.33 = 0.045`; `0.25 − 0.25 = 0` | holds; source not read; C07 |
| 6.3, 6.4 | `r = (1,2)`, `h = (1,.3)`, `ν = 1/2`; `B = 2, 5` | `cos = 0.6854`, factor `0.6477`; `1.3`, `0.88` | holds |
| 6.5 AdaBoost | `ε = 1/4`; `γ = .25, ρ = 0`; `γ = .3, ρ = .29` | `α = 0.549`; `0.866 < 0.882`; `u = 0.978`; `log u ≈ −(4/3)γ⁴` at `ρ = γ` | holds |
| 7.1 definitions, post-processing, groups (sampled) | `δ < 0`; `ε < 0`; `k = 0` | `A = ∅` refutes; `A = univ` refutes; `D = D'`; source Def 2.4 p. 17, Prop 2.1 p. 19, Thm 2.2 p. 20 read | holds |
| 7.2 mechanisms (sampled) | Gaussian `ε = .5, δ = 10⁻³`; `ε = 10, δ = .1`; exponential on 3 outputs; `|R| = 1` | `c = 3.776`, exact `δ(ε) ≈ 3·10⁻⁶`; `≈ 0.40 > 0.1`; ratio `1.79 ≤ e`; event empty | holds; source Thms 3.6, 3.10, 3.11, 3.22 read |
| 7.3 composition | route with `min(1, e^{ε₂}g + δ₂)` | `≤ e^{ε₁+ε₂}∫g + δ₁ + δ₂` | holds; C01, C05 |
| 7.4 randomized response, contraction (sampled) | `ε = .5, 1` between `δ₁`, `δ₋₁`; `ε ≤ 1` | `2·tanh(ε/2)·ε = 0.245, 0.924 ≤ 1.68, 11.8`; `1/tanh²(1/2) = 4.683` | holds; DJW Thm 1 and Claim 3.5 p. 30 read |
| 7.5 minimax rates | `n = 10, ε = 1`; `n = 100, ε = .1` | `0.1 + 0.08 = 0.18`; `0.01 + 0.08 = 0.09`; local rate `min(1, 1) = 1` | holds |
| 7.6 sparse vector | `k = 5, β = .1, ε = 1`; `k = 1` | `α = 36.84`; `23.97`; failure `(β/2k)² + β/2 ≤ β` | holds; source Thms 3.23, 3.24 read |
| 8.1 fairness | `S = Y`; `S = A` with base rates `.8, .4`; empty cell | `g = id`; sufficiency only; `(p₀ − p₁)(ν₁ − ν₀) = 0` forces `ν₁ = ν₀` | holds; source Props 1–4 read |
| 8.2 shift, adaptation, weights (sampled) | thresholds `1/2`, `−1` between `δ₀`, `δ₁`; `B = 1, n = 100, δ = .05`; `w ≡ 8` | divergence `2`; `t = 0.296`, exponent `3.99 ≥ 3.69`; variance `16 > 8` | holds; sources not read |
| 8.3 label shift | `K = 2`, `pS = (.5,.5)`, `pT = (.8,.2)` | `C w = (0.76, 0.24)`; odds factor `4` | holds |

- Source locators checked against the text: 41 (Devroye–Györfi–Lugosi 17, Dwork–Roth 13, Barocas–Hardt–Narayanan 7, Hardt–Recht 4), all at the stated pages; plus Lei et al. Thm 2.2 and Duchi–Jordan–Wainwright Thm 1 and Cor 1.
- Library declarations opened at the pin: 14 (Tau Ceti McDiarmid 351 and 383, Bernstein 173, Laplace 199, `ExchangeableFamily` 53, `empiricalMeasure` 354, `orderStatistic` 53, Wasserstein empirical 56, relative-entropy chain rule 150; Mathlib `RKHS.norm_apply_le` 239, `inner_kerFun` 167, `posSemidef_kernel` 282, Azuma–Hoeffding 915, `rnDeriv_measure_compProd_left` 96).
- Cross-roadmap citations resolved on main: 10 (Asymptotic 3.2, 3.3, 3.5; Nonparametric 1.4, 2.2, 5.6, 5.8; Foundations 8.5, 9.1; RegretMinimizationAndEquilibria 1.2); the two local copies in the Lean file agree with the owner's definitions word for word.
- Elaboration: `Suggested.lean` elaborates with 45 `sorry` warnings and nothing else; no `set_option`, no sorry'd data; every declaration carries its binders in its own signature (the three `variable` lines hold only types and `MeasurableSpace X`).
- One-tactic probes: 3 statements probed on a copy; 2 close (C07), `brierScore_sub_eq` does not close by `simp`. Three absent headlines elaborate when appended to a copy of the file (R02).
- Dependency check: `depcheck: 200 roadmaps, 2183 edges, 0 problem(s)`; no change outside the roadmap folder.
- Pull-request text read against the head: 45 admitted theorems, eight layers, suppliers and ownership as stated; nothing to correct.

Overlap check: read KernelsAndSpectralMethods, MultiArmedBandits, MathematicalStatisticsHigherOrderAndResampling, MathematicalStatisticsNonparametric, MathematicalStatisticsAsymptotic, MathematicalStatisticsHighDimensional; kernel ridge regression is handed to this roadmap by KernelsAndSpectralMethods and owned here; VC theory of set families stays with Asymptotic 3.5 and the two regression consistency theorems with Nonparametric 5.6; Hedge stays with MultiArmedBandits and RegretMinimizationAndEquilibria and is not stated here; nothing has two owners. Ownership against open pull requests was checked through the search over their heads, not from sibling checkouts.

Source independence: 22 passages compared with 6 sources, none shared beyond formulas and statements of a dozen words; largest share Mohri–Rostamizadeh–Talwalkar, 23 of 97 locators, whose text could not be read; contents compared through the theorem numbers cited (Layer 1 ↔ Ch. 4; Layer 2 ↔ Ch. 3, 5, 6, 7; Layer 3 ↔ Ch. 2, 3; Layer 4 ↔ Ch. 5, 14; Layer 6 ↔ Ch. 7) and against the read contents of DGL1996 and DworkRoth2014: independent.

Research link: The headline targets are the distribution-free learning results that the README's paper sources build on or prove: Zhang (2004) on surrogate consistency, Duchi–Jordan–Wainwright (2013) on local-privacy minimax rates, Ben-David et al. (2010) on domain adaptation, Lei et al. (2018) on conformal inference, Pollard (1981) on `k`-means; rests on the README and on DJW2013 and Lei2018 as read.

## Not verifiable

- Mohri–Rostamizadeh–Talwalkar (sampled 2.2, 3.1, 3.2, 4.1): the publisher's page refused the request and the author's page links to a file host the sources service does not classify.
- Anthony–Bartlett (sampled 3.1, 3.2, 3.4), Vapnik, Schölkopf–Smola, Boucheron–Lugosi–Massart (3.2, 3.4): paywalled; no legal copy found.
- Breiman–Friedman–Olshen–Stone (sampled 1.3, 6.2): paywalled.
- Linder in Györfi (ed.) and Pollard 1981 (sampled 5.4): the book is paywalled; Project Euclid refused the automated download of the paper.
- Quiñonero-Candela et al. and Ben-David et al. 2010 (sampled 8.2): paywalled hosts.
- Wainwright, Cucker–Zhou, Koltchinskii, Zhang 2004, Lipton–Wang–Smola 2018, Vovk–Gammerman–Shafer 2005: not in the sample and not fetched.

## Source issues

- none

## For the human reviewers

- **Not tested.** The source with the largest share of locators (Mohri–Rostamizadeh–Talwalkar, 23 of 97) could not be read: its wording was not compared, and its arrangement only through the theorem numbers the README cites.
- **Licence.** The README and the description name an earlier formalization by the author (lean-CKSD, `CKSD/Learning/`, Apache 2.0) and say no code is copied; `Suggested.lean` was not compared with that repository.
