# Review of StochasticOrders (pull request #3055 at 23ac071)

**Verdict:** needs changes

**Summary.** Changes are needed for one reason: a Check in Layer 5 gives the mean absolute difference of the square of a uniform variable as `2/3`, where it is `1/3`, and with the printed value the Check contradicts the Gini index `1/2` it is meant to confirm. Every stated theorem and every other Check and worked example survived the computed pass, and `Suggested.lean` elaborates with `sorry` as its only warning. There is one small correction and one format note, neither blocking. None of the four cited books could be read legally, so no locator was checked against its text; that, and the comparison of wording and arrangement with Shaked–Shanthikumar, is left to the human reviewers.

## R01 (P2) — The Check of 5.4 on the uniform law and its square gives `E|Y − Y'| = 2/3`; the value is `1/3`, and with `2/3` the Check yields Gini index `1`, not `1/2`

In the third Check after 5.4 (README line 675) the text says "the mean differences `E|X − X'| = 1/3` and `E|Y − Y'| = 2/3` divided by `2 · 1/2` and `2 · 1/3` give the same values". An implementer who uses this Check to test the mean-difference formula of 5.3 against the Lorenz-curve definition gets `(2/3) / (2/3) = 1` for the law of `U²`, against the Gini index `1/2` stated one clause earlier, and would conclude that one of the two definitions is wrong.

For `Y = U²` with `U` uniform on `(0, 1)`: `E|Y − Y'| = 2 E max(Y, Y') − 2 E Y`, the maximum of two independent uniforms has density `2m`, so `E max(U, U')² = ∫ 2m³ dm = 1/2`, and `E|Y − Y'| = 1 − 2/3 = 1/3`. The same value comes from the formula in the proof route of 5.3: `2 ∫ (2u − 1) u² du = 2 (1/2 − 1/3) = 1/3`. Then `(1/3) / (2 · 1/3) = 1/2`, which agrees with `1 − 2 ∫ u³ du = 1/2`. The value for `X = U` is right: `(1/3) / (2 · 1/2) = 1/3`.

The smallest change is to replace `E|Y − Y'| = 2/3` by `E|Y − Y'| = 1/3`.

## C01 — The README attaches the endpoint values of the Lorenz curve to `convexOn_lorenzCurve`, and the Lean statement has convexity only

In 5.3 (README line 615) the target named `convexOn_lorenzCurve` reads "the Lorenz curve is convex on `[0, 1]`, with value `0` at `0` and `1` at `1`". The declaration in `Suggested.lean` (line 445) concludes `ConvexOn ℝ (Icc 0 1) (lorenzCurve μ)` and nothing about the endpoints, while the module docstring and the scope section both say that each named headline is stated "with every conclusion the README attaches to it". A reader matching prose to formal statement finds the normalisation `lorenzCurve μ 1 = 1` promised and not tested; it is the conclusion that pins the factor `(∫ x dμ)⁻¹`.

Either add the two endpoint equalities to the Lean statement as further conjuncts, or move "with value `0` at `0` and `1` at `1`" to a separate prose target in 5.3.

## N01 — Two docstrings in `Suggested.lean` carry a pull-request number

The docstrings of the local copies `maxSubsetSum` and `Majorizes` (lines 61 and 68) say "in the shape of Mathlib PR #41898". A reader a year from now cannot tell what that number refers to; "in the shape of Mathlib's majorization preorder" or naming the owner's section alone would do.

## Questions for the author

- In the proof route of 2.2 (README lines 184–187), the Polish case approximates `μ, ν` "by laws on compact sets with masses kept ordered on upper sets". Restricting two laws to a compact set and renormalising does not in general preserve `μ(U) ≤ ν(U)` on upper sets, and I could not see which construction is meant. Is this the argument of Rachev–Rüschendorf, Thm 3.5.5, or is a different reduction intended (for instance the general closed-set form of Strassen's marginal theorem)? What stopped me: the text of Rachev–Rüschendorf could not be read, so the step was not checked at its source. The stated theorem itself is the Kamae–Krengel–O'Brien theorem and is not in doubt.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 1.1 monotone test functions; equality | indicator of `Ioi x`; `δ_0` vs uniform `{0,1}` with `g = min x 0` | integrals `1 − F_μ(x)`, `1 − F_ν(x)`; `∫g = 0` for both, laws differ | true; strictness needed | none |
| 1.2 mixtures | `ρ` a point mass; `θ ↦ 1 − cdf(κ θ) x` nondecreasing | reduces to hypothesis; 1.1 applied to `ρ₁, ρ₂` | true | none |
| 1.3 weak limits and Checks | `N(0,1)`, `N(1,1)` at 0; Poisson 1, 2 at 0 | `0.5` vs `Φ(−1) = 0.15866`; `e⁻¹ = 0.36788` vs `e⁻² = 0.13534` | true | none |
| 2.1 upper sets, line and test functions | upper sets of `ℝ`; `univ` as upper set | `μ(Ioi x) ≤ ν(Ioi x)` ⇔ `F_ν(x) ≤ F_μ(x)`; `{f > c}` upper, layer cake | true | none |
| 2.2 ordered coupling | `δ_(0,1)`, `δ_(1,0)` on `ℝ²`; `⇐` on any upper set | sets `{1 ≤ z.2}`, `{1 ≤ z.1}` give masses `1 > 0` each way: incomparable | true (KKO) | none; question on route |
| 2.3 sequential criterion, products | `μ₁ = ν₁ = δ_0`, `κ x = δ_x`, `η y = δ_(y+1)`; `n = 0` | joint laws `δ_(0,0)`, `δ_(0,1)` ordered; `Fin 0` product is a point mass | true | none |
| 3.1/3.2 definitions and implications | `s = Ioc x y, t = Ioi y`; `x → −∞`; vanishing survival | adding `μ(Ioi y)ν(Ioi y)` gives hr; limit gives `S_μ(y) ≤ S_ν(y)`; `S_ν(y)=0<S_μ(y)` fails hr | true | none |
| 3.3 densities | rectangles `Iic q × Ioi q`, `q` rational | `∫∫_{s×t}(f(x)g(y) − f(y)g(x)) ≥ 0` on a semiring ⇒ integrand `≥ 0` a.e. | true both ways | none |
| 3.3 conditional laws | disjoint `s < t`; common point `c = max s = min t`; `μ(s ∪ t) = 0` | `μ(s)ν(A) ≤ μ(A)ν(s)` after adding `μ(A)ν(A)`; common point split into three lr inequalities; `0 ≤ 0` | true both ways | none |
| 3.3 residual lives, hazard functions | `S_ν(t) = 0 < S_μ(t)`; `cdf ν t = 1 > cdf μ t` | both sides of the iff fail (take `x = sup supp ν`); `g/0 = 0` passes hazard clause, so `hsupp` is needed | true | none |
| 3.4 maps and convolution | common level set `L = φ⁻¹{c}`; `ρ = δ_0`; uniform `{0,1}` | three lr inequalities sum to the claim; `S = 1_{x<0}` log-concave; `log S` values `0, −log 2` not concave | true | none |
| 3.5 families and Checks | Poisson 1, 2; binomial 4, 7 at 0.4; `Γ(3,1)` vs `Γ(2,2)`; `N(0,1)`, `N(0,4)`; `r = 0`, `v = 0` | `0.36788, 0.73576, 1.47152`; `0.216, 0.378, 0.756, 1.89, 7.56`; `8e⁻ˣ/x`; `e^(3x²/8)/2`; Dirac cases hold | true | none |
| 3.5 lr negative control | uniform `{1..4}` vs `(.1,.3,.2,.4)` | `S_ν/S_μ = 1, 1.2, 1.2, 1.6`; `F_ν/F_μ = .4, .8, .8, 1`; `{2},{3}`: `.075 > .05` | true | none |
| 3.1/4.5 mean residual life | `δ_1` vs uniform `{0,2}` at `t = 0`; `S_ν(t) = 0 < S_μ(t)` | clause `1·1 ≤ ½·1` false; near `sup supp ν` clause forces `S_μ = 0`, so no junk pair | true; mrl ⇒ icx holds | none |
| 4.1 icx, stop-loss and quantile forms | `p = 0`, `p = 1`; `δ_0` vs uniform `{0,2}` | `p=0`: means `0 ≤ 1`; `p=1`: `0 ≤ 0`; stop-loss `max(−t,0) ≤ ½max(−t,0)+½max(2−t,0)` | true | none |
| 4.2 martingale and submartingale couplings | Cauchy `μ = ν`, `κ x = δ_x`; `δ_0` vs uniform `{0,2}`; Rademacher chain | right side holds, left fails without `Integrable`: hypotheses needed; `c = 1`, `ρ = δ_1`; kernel means `±1`, mixture `½, ½` | true | none |
| 4.3 cut criterion | `N(0,1)`, `N(0,4)`, `c = 0`; `δ_1` vs uniform `{0,2}`, `c = 1` | `D(t) = ∫_t^∞(F_μ − F_ν) ≥ 0`; stop-loss at 0: `0.39894`, `0.79788`; reversed pair: `½ > 0` | true | none |
| 4.4 closure and equality | a.e. kernel inequality; strictly convex `φ` | `∫φ d(κ∘ρ) = ∫∫φ dκ_a dρ`; strict Jensen forces `κ x = δ_x` | true | none |
| 4.5 residual-life form | `u ≥ t`; `S_ν(t) = 0` | cond. stop-loss `π(u)/S(t)`; `π_μ(u)/π_ν(u) ≤ π_μ(t)/π_ν(t) ≤ S_μ(t)/S_ν(t)` | true both ways | none |
| 5.1 dispersive order | `Exp(2)`, `Exp(1)`; `N(0,1)` vs `N(−5,4)`; lower vs upper quantile | spreads ratio `½`; difference `Φ⁻¹(u) − 5` nondecreasing, usual order fails; one-sided limits transfer the inequality | true | none |
| 5.2 star order | law on `(0,∞)`; `U` vs `U²` | `Q > 0` on `(0,1)`; `log` turns ratio into difference; `Q_ν/Q_μ = u` | true | none |
| 5.3 Lorenz, Gini, mean difference | `U`, `U²`, exponential, `δ_m` | curves `u²`, `u³`, `u+(1−u)log(1−u)` (`0.15343` at ½), `u`; Gini `⅓, ½, ½, 0`; `E\|Y−Y'\| = ⅓` not `⅔` | theorems true; Check value false | R01 |
| 5.3 `convexOn_lorenzCurve` | elaborated type | conclusion `ConvexOn ℝ (Icc 0 1) (lorenzCurve μ)` only; README adds values `0`, `1` | README ≠ Lean | C01 |
| 5.4 majorization | `x = (½,½)`, `y = (1,0)` | top-1 sums `½ ≤ 1`; `L_y = max(2u−1, 0) = ½` at ¾, below `¾` | true, direction consistent | none |

- Source locators checked against the text: 0 of 66 (53 Shaked–Shanthikumar, 10 Marshall–Olkin–Arnold, 2 Liggett, 1 Rachev–Rüschendorf); no text was readable.
- Library declarations opened at the pin: `TauCeti.LogConcave` (`TauCeti/Analysis/Convex/LogConcave.lean:73`), `TauCeti.Probability.empiricalFiniteMeasure` (`TauCeti/Probability/Process/EmpiricalMeasure.lean:58`, normalised), the eight theorems of `TauCeti/Probability/StochasticOrder.lean`, Mathlib `gammaMeasure (a r)` (`Mathlib/Probability/Distributions/Gamma.lean:128`), `poissonMeasure`, `binomial (n) (p : I)`; all 56 `#check` lines resolve.
- Cross-roadmap citations resolved: StandardDistributions §7.9 and §7.13, MathematicalStatisticsFoundations §6.3 and §7.5 (`exists_dilation_of_convexOrder`), OptimalTransport §3.7 on main; MeansMajorizationAndDiscreteInequalities §4.1, §6.1, §6.2 at its open head, where the three copied definitions agree with the owner's bodies.
- Duplication by object: no convex-type, hazard, likelihood-ratio, Lorenz, Gini or upper-set order of laws in the pinned Mathlib or Tau Ceti; the one same-name lead (`ConvexOrderLE.conv`) is no library declaration.
- Dependency check: `depcheck: 132 roadmaps, 1464 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changes outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates, `sorry` the only warning; `#check @name` on 17 declarations of a scratch copy shows every probability-measure binder kept; four one-tactic probes (`simp` with the definitions unfolded) close nothing.
- Automatic checks: all passed on this head.
- Headlines: the 48 named targets of the README are each stated; no headline is declared not statable; the two extra statements are marked as sanity checks.

Overlap check: read MeansMajorizationAndDiscreteInequalities, StandardDistributions, MathematicalStatisticsFoundations; nothing shared. The convex order, its stop-loss form and majorization are owned by MeansMajorizationAndDiscreteInequalities §4.1 and §6.1–6.2 and copied or consumed here, and that roadmap's own text leaves Strassen's theorem for a finite mean and the increasing convex, dispersive and star orders outside itself; the usual order through distribution functions is owned by StandardDistributions §7.13, which states none of the test-function, mixture or upper-set forms; the compact Strassen theorem is owned by MathematicalStatisticsFoundations §7.5 and consumed in 4.2. The Gini index of the open roadmap StatisticalLearningTheory is the impurity `1 − ∑ p²`, a different object.

Source independence: 0 passages compared with 0 sources, since none of the four books could be read; largest share Shaked–Shanthikumar, 53 of 66 locators; its contents could not be opened, and by the section numbers the README itself cites the layers draw on §1.A, §6.B, §1.B–1.C with §2.A, §4.A with §3.A, §3.B with §4.B in that order, which is not a run of its sections.

Research link: The headline targets are the ordered-coupling theorem of Strassen and Kamae–Krengel–O'Brien, Strassen's martingale coupling and the Karlin–Novikoff criterion, as stated in Shaked–Shanthikumar (2007), Marshall–Olkin–Arnold (2011), Rachev–Rüschendorf (1998) and Liggett (1985); the README names monotone-likelihood-ratio testing, stop-loss comparison of risks and Holley-type domination as uses. Rests on the README.

## Not verifiable

- Every locator into Shaked–Shanthikumar, *Stochastic Orders* (all fifteen sampled subsections cite it): the book is behind the publisher's paywall and no legal copy was found.
- Marshall–Olkin–Arnold, 17.A.5, 17.C.1, 17.C.8–17.C.10, 17.C.12, 17.C.15, (13a) and the page locators of 5.3–5.4: paywalled, no legal copy found.
- Rachev–Rüschendorf, Thm 3.5.5, pp. 146–147 (2.2): no legal copy found.
- Liggett, Ch. II, Thm 2.4, p. 72 (2.2): paywalled, no legal copy found.
- The attribution of the counterexample of 3.5 to Shaked–Shanthikumar, Remark 1.C.2: the numbers were recomputed and are right; whether the remark uses this example was not checked.

## Source issues

- none

## For the human reviewers

- Not tested: Shaked–Shanthikumar carries 53 of the 66 locators in the layers; neither its text nor its table of contents could be read, so wording and arrangement were not compared with it (nor with the other three books).
- Licence: nothing observed; the three definitions copied into `Suggested.lean` (lines 53–72) come from the roadmap MeansMajorizationAndDiscreteInequalities, which is itself still an open pull request and must merge first.
