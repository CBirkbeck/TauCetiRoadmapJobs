# Review of BinomialToBlackScholes (pull request #2961 at 22c09ae)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement, Check and supplier citation was recomputed or opened and holds: the third-order expansion of the risk-neutral probability, the limits of the mean and variance of the log-return, the convergence of put and call prices (checked numerically against the closed forms), and all negative-control Checks. There is one small correction (the first headline of the summary omits `T > 0`) and no format note. Bingham's lecture notes, the only source with locators, could not be read through a legal channel the tools recognise, so its five locators are unverified; that, the status of the source, and the restriction to one refinement are left to the human reviewers.

## C01 — The first headline of the summary needs `T > 0`, which only the fourth bullet states

The summary says that `σ` is positive, `r` real and `s` positive "throughout", and gives `T > 0` only in the bullet on the call (line 23). A reader therefore takes the first three bullets for every fixed horizon, and the second and third do hold at `T = 0` (2.1 and 3.1 assume `T ≥ 0`). The first does not: at `T = 0` the up-probability is `0` for every `N`, so `N^(3/2)` times the error is `−N^(3/2)/2`, which is the README's own Check in 1.2 (line 177), and the theorem of 1.2 assumes `T > 0`. Adding "for `T > 0`" to the bullet on the risk-neutral probability (line 14) makes the summary agree with 1.2.

## Questions for the author

- Would the statement of 2.1 for an arbitrary sequence of two-point trees (returns `a_N < 0 < b_N`, log-moves tending to `0`, `N` times the mean and variance of one log-move converging) be the right target, with the refinement here as its first instance? The route of 2.1 uses nothing else about the refinement, and by the README's own account (1.2, lines 147–151, and the conventions, line 50) the tree of the cited notes, with the simple bank factor `1 + ρT/N`, is not an instance of the theorems stated. I could not compare with the notes: their text was not readable through the sources service.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Conventions: no arbitrage iff `r²T < σ²N` | `r=σ=T=1`, `N=1,2`; `r=−1`; `r=0` | `N=1`: `b = e^0−1 = 0`; `N=2`: `b = e^(0.207)−1 > 0`, `a<0`; `r=−1,N=1`: `a=0`; `r=0`: `q = 1/(1+e^(σh))` | holds | none |
| Conventions: two-period tree | `σ=log 2, T=N=2, r=log(5/4)` and `r=0` | `u=2, d=1/2, B=5/4, a=−3/5, b=3/5, q=1/2`; `r=0`: `q=(1/2)/(3/2)=1/3` | holds | none |
| Conventions: `crrMeasure` probability iff `0≤q≤1` | `N=2, q=3/2`; general `q>1`, `q<0` | clipped masses `9/4,0,0,1/4`, total `5/2`; positive terms alone exceed the signed sum `1` | holds | none |
| Conventions: degenerate parameters | `N=0`; `T=0`; `T<0`; `σ=0` | `T/0=0`: `a=b=0`, `q=−0/0=0`, point mass; `T<0`: `√(T/N)=0`, undiscounted price `1` | holds | none |
| 1.1 log-return, mean and variance (sampled) | `σ=log 2, T=N=2, r=0` | values `±2 log 2, 0`, masses `1/9,4/9,4/9`; mean `−2/3 = N(2q−1)`; variance `20/9−4/9 = 16/9 = N·4q(1−q)` | holds | none |
| 1.1 tree call, put, parity | `r=log(5/4)`, `s=K=1` | prices `4,1,1/4`; call `(16/25)(3/4)=12/25`; put `(16/25)(3/16)=3/25`; difference `9/25 = 1−16/25` | holds | none |
| 1.1 `q(1+b)+(1−q)(1+a)=1` | symbolic | `1+a+q(b−a) = 1+a−a` | holds for `b≠a` | none |
| 1.2 expansion (sampled, headline) | series by hand; numeric `(r,σ,T)=(0.05,0.2,1)`, `(−0.3,0.5,2)`, `(0,1,1)` at `N=10⁴` | h³: `((r²/2−σ⁴/24)−(r−σ²/2)σ²/6)/(2σ) = (12r²−4rσ²+σ⁴)/(48σ)`; numeric `0.00245834 / 0.00245833`, `0.169996 / 0.170000`, `0.0208331 / 0.0208333` | holds | none |
| 1.2 Checks: `T=0`, `σ=0`, simple bank factor, `r=0` | as stated | `q=0` gives `−N√N/2` (with `r/0=0` at `σ=0`); simple factor h³: `(σ⁴−4rσ²)/(48σ)`, difference `−r²/(4σ)`; `1/(1+e^x) = 1/2−x/4+x³/48` | hold | none |
| Summary, first bullet | `T=0` | left side `−N^(3/2)/2`, no finite limit | false without `T>0` | C01 |
| 2.1 convergence in law (sampled, headline) | `T=0`; `T>0`; second route | `T=0`: both sides `f(0)`; `N x(2q−1) → (r−σ²/2)T`, `N x²·4q(1−q) → σ²T`; `cos(tx)+i(2q−1)sin(tx) = 1+(it(r−σ²/2)T−σ²Tt²/2)/N+O(N⁻²)` | holds | none |
| 2.1 Checks: `σ=0`; `T=−1`; mean of the limit | as stated | `σ=0`: log-return `0`, limit `δ_(rT)`; `T=−1,r=0,σ=1`: log-return `0`, limit `δ_(1/2)`; `E e^Y = e^(μ+σ²T/2) = e^(rT)` | hold | none |
| 2.1 Lindeberg route against the supplier | `m n = N₀+n`, `k=1` | summands bounded by `2x_N`, so the truncated sum is `0` once `2x_N ≤ ε`; supplier needs probability measures for all `n`: true from `N₀` | route sound | none |
| 3.1 bounded payoffs (sampled, headline) | `T=0`; put `s=1,K=1.1`, three parameter sets, `N=50,500,5000` | `T=0`: both `h s`; puts `0.106959, 0.106775, 0.106752` → `0.106753`; `1.087429, 1.087134, 1.087095` → `1.087098` | holds | none |
| 3.1 Checks: unbounded, discontinuous, `s<0` | `h=e^(x²)`; indicator of the countable set of tree values; `s=−1`, `h=e^((min x 0)²)` | tree side `≥ e^(−rT)` or `= e^(−rT)`; limit side `0` (not integrable, or null set) | hold | none |
| 3.2 call (sampled, headline) | call `s=1,K=1.1`, same parameters | `0.060607, 0.060422, 0.060400` → `0.060401`; `0.083099, 0.082803, 0.082764` → `0.082767`; parity: tree call − put `= s−Ke^(−rT)` | holds | none |
| 3.2 Checks: `T=0`; `K<0`; `σ<0` | `s=2,K=1`; `s=1,K=−1,r=0,σ=T=1`; `s=K=T=1,r=0,σ=−1` | `1` against `(s−K)/2 = 1/2` (`Φ(0)=1/2` confirmed by `simp`); `2` against `Φ(1/2)+Φ(−1/2)=1`; `Φ(−1/2)−Φ(1/2)<0` against nonnegative tree prices | hold | none |
| `Suggested.lean` against the README | `#check @` of the four theorems and three of the definitions; `simp`, `rfl`, unfolding `simp` on each theorem | elaborated hypotheses equal the README's (`0<σ`, `0<T` or `0≤T`, `0<s`, `0<K`); no probe closes a theorem | agree; no padding | none |

- Source locators checked against the text: 0 of 5 (all in Bingham's notes, not readable; see below).
- Library declarations opened at the pin: 21 Mathlib names and 9 Tau Ceti names of the supplier contracts all resolve with the stated namespaces (one scratch file of `#check`); statements read for `TendstoInDistribution` (`MeasureTheory/Function/ConvergenceInDistribution.lean:64`), `measurePreserving_eval_multivariateGaussian` (`Probability/Distributions/Gaussian/Multivariate.lean:223`), `Real.exp_bound` (`Analysis/Complex/Exponential.lean:513`), `tendsto_pow_exp_of_isLittleO_sub_add_div` (`Analysis/SpecialFunctions/Complex/LogBounds.lean:371`), and in `TauCeti/Probability/Finance/BlackScholes/Basic.lean`: `terminalSpot` (85), `riskNeutralPrice` (136), `riskNeutralPrice_zero` (147), `dPlus` (175), `callPrice` (232), `putPrice` (244), `putPrice_eq_callPrice` (262), `riskNeutralPrice_call` (298), `riskNeutralPrice_put` (319).
- Cross-roadmap citations resolved: DiscreteTimeFinance at its open head, 4.1 (`crrPrice`, `crrMeasure`, identical bodies), 4.2, 4.3, 1.3, 2.2, 5.3 and its "not treated" line; MathematicalStatisticsAsymptotic 1.2 on main (`tendstoInDistribution_sum_of_lindeberg`, hypotheses as the contract states); FinancialMathematics M0.4 on main.
- Duplication: nothing in the pinned Tau Ceti finance files or Mathlib states a binomial tree or its limit; no other roadmap, on main or open, names the Cox–Ross–Rubinstein limit. Tau Ceti's `riskNeutralPrice_call` gives the limit of 3.2 its closed form and is cited, not restated.
- Overlap check: read DiscreteTimeFinance, FinancialMathematics (main and its open revision), MathematicalStatisticsAsymptotic; searched MartingaleCentralLimitTheorem, SeriesOfIndependentRandomVariables, StochasticApproximationAveraging and MarketImpact for the tree and its limit, no hit. The tree: DiscreteTimeFinance; the closed forms: Tau Ceti and FinancialMathematics; Lindeberg–Feller: MathematicalStatisticsAsymptotic; the limit of tree prices: this roadmap (DiscreteTimeFinance excludes it by name).
- Dependency check: `depcheck: 168 roadmaps, 1958 edges, 0 problem(s)`; no UPWARD or CYCLE line. DiscreteTimeFinance is an open pull request adding a new roadmap, named in the description's dependency block.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: four `sorry` warnings, nothing else. No `set_option`, no sorry'd data, imports `Mathlib` and one `TauCeti` module; no change outside the folder.
- The pull request's title and description agree with the head (4 theorems, 7 definitions, 2 copied, suppliers as listed).

Source independence: 0 passages compared with 1 source, because the text and contents of Bingham's notes (5 of 5 locators) could not be read; by the README's locators the notes run Lemma, expansion, call, general payoff, while the layers run expansion, law, bounded payoffs, call, an order the dependency lines 1.2 → 2.1 → 3.1 → 3.2 force.

Research link: the headline targets are the limit theorem that Cox, Ross and Rubinstein attached to their binomial tree, with limit the Black–Scholes–Merton formula; this rests on the README's References, which attribute these without locators or years, and on its use of MathematicalStatisticsAsymptotic 1.2 (Lindeberg–Feller).

## Not verifiable

- Bingham, *M345F22 Mathematical Finance*, Lectures 17 and 18 (all five locators: the Lemma on p. 2 and the expansion on p. 3 of Lecture 17; p. 1 and formula (∗) of Lecture 18): the sources service refused both URLs, since the address does not spell the author's name and so is not shown to be the author's page; no other copy was sought. The README's description of the notes (a different refinement, a Lemma lacking a Lindeberg-type condition, the quoted phrase in 3.1) is unchecked.

## Source issues

- none

## For the human reviewers

- Not tested: Bingham's lecture notes carry all five locators, and neither their text nor their contents could be read, so wording and arrangement were not compared with them.
- Scope: the only source with locators is a set of unpublished 2016 course notes; Cox–Ross–Rubinstein, Black–Scholes and Merton are attributed in the References without locators (README lines 472–480).
- Licence: the notes are cited at an Imperial College address whose path is a user id, not the author's name; whether that page is the author's own could not be settled by the tools.
- Scope: the theorems cover one refinement (`u = e^(σ√(T/N))`, bank factor `e^(rT/N)`); the scope section excludes other refinements, which by the README's account include the cited notes' own tree (README lines 50, 147–151, 403–404).
