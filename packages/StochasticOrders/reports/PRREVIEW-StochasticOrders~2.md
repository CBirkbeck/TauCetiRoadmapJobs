# Review of StochasticOrders (pull request #3055 at a1cdb77)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired, and no finding, small correction or format note remains. The Check of 5.4 now gives `E|Y − Y'| = 1/3`, the Lean statement of `convexOn_lorenzCurve` carries the two endpoint values, and the new proof route of 2.2 through Kantorovich duality was recomputed step by step and rests on two declarations that exist at the pinned Tau Ceti. The four cited books still could not be read, so the locators, and the comparison of wording and arrangement with Shaked–Shanthikumar, are left to the human reviewers.

## Previous findings

- R01 — repaired: the third Check after 5.4 (README line 679) now reads "the mean differences `E|X − X'| = 1/3` and `E|Y − Y'| = 1/3` divided by `2 · 1/2` and `2 · 1/3` give the same values"; `(1/3)/(2/3) = 1/2`.
- C01 — repaired: `convexOn_lorenzCurve` (`Suggested.lean` line 447) concludes `ConvexOn ℝ (Icc 0 1) (lorenzCurve μ) ∧ lorenzCurve μ 0 = 0 ∧ lorenzCurve μ 1 = 1`, as the README's target in 5.3 says.
- N01 — repaired: the docstrings of `maxSubsetSum` and `Majorizes` name the owner's §4.1 only; no pull-request number remains in either file.
- Question on the route of 2.2 — answered: the compact-approximation step is gone; the `⇒` direction now goes through an optimal coupling for the `0`–`1` cost of the closed order and duality over bounded continuous potentials.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 5.4 Check, `U` and `U²` | `Y = U²`: `E max(Y,Y') = ∫ 2m³ dm` | `E\|Y−Y'\| = 2·½ − 2·⅓ = ⅓`; Gini `(⅓)/(2·⅓) = ½ = 1 − 2∫u³`; `X`: `(⅓)/(2·½) = ⅓` | true | none |
| 5.3 `convexOn_lorenzCurve` with endpoints | `u = 0`; `u = 1`; `U`; `δ_m`, `m > 0` | `Ioc 0 0 = ∅` gives `0`; `∫_(0,1] Q = ∫ x dμ` (point `1` null) gives `m⁻¹·m = 1`; `U`: `2·½ = 1`; `δ_m`: `m/m = 1` | true; needs `hpos`, present | none |
| 2.2 route, cost and attainment | `c = 1` off `R`, `0` on `R` | `Rᶜ` open, so `c` lower semicontinuous, values in `{0,1}`; `exists_isOptimalCoupling` asks Polish, Borel, `LowerSemicontinuous c` only | step holds | none |
| 2.2 route, upper hull | `K` compact in `{φ ≥ t}`, `y` in the hull | hull = projection of `(K × α) ∩ R` along compact `K`: closed, Borel, upper by transitivity, contains `K`; `ψ(y) ≤ −φ(x) ≤ −t` | step holds | none |
| 2.2 route, layer cake | `\|φ\|, \|ψ\| ≤ M` | `∫φ dμ = ∫_(−M)^M μ{φ ≥ t} dt − M ≤ ∫_(−M)^M ν{−ψ ≥ t} dt − M = ∫(−ψ) dν`; dual value `≤ 0`, `ofReal` gives `0` | step holds | none |
| 2.2 route, conclusion; statement | `δ_(0,1)`, `δ_(1,0)` on `ℝ²` | least upper bound `0` = transport cost = `π(Rᶜ)`, so `π` carried by `R`; incomparable pair: masses `1 > 0` both ways, cost `1` | true | none |

The rows for the untouched statements stand as in the previous review, of `23ac071`.

- Source locators checked against the text: 0; the diff adds no locator, and the route of 2.2 is attributed to a book that could not be read (below).
- Library declarations opened at the pin: `TauCeti.exists_isOptimalCoupling` (`TauCeti/MeasureTheory/OptimalTransport/Existence/Basic.lean:226`), `TauCeti.isLUB_ofReal_kantorovichDualValue_boundedContinuous_of_lowerSemicontinuous` (`TauCeti/MeasureTheory/OptimalTransport/Duality/LowerSemicontinuous.lean:199`, potentials `X →ᵇ ℝ`, value in `ℝ≥0∞` through `ENNReal.ofReal`), `TauCeti.transportCost` (`Cost/Basic.lean:111`), `TauCeti.kantorovichDualValue` (`Duality/Basic.lean:147`), `MeasureTheory.Measure.setIntegral_quantile_eq_integral` (`TauCeti/Probability/Quantile.lean:893`, over `Ioo 0 1`).
- Cross-roadmap citations resolved: OptimalTransport §1.5 (primal attainment, names `TauCeti.exists_isOptimalCoupling`), §2.4 (strong Kantorovich duality, Polish lower semicontinuous case, bounded continuous and integrable dual classes) and §3.7 on main.
- Dependency check: `depcheck: 129 roadmaps, 1436 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changes outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates with exit code 0, 50 `sorry` warnings and no other message; the two new `#check` lines print the signatures read above. The one changed statement was judged by reading: its convexity conjunct is not a one-tactic consequence of the library.
- Automatic checks: all passed on this head.
- Pull request text: read against this head; it names the two new imports, OptimalTransport §1.5 and §2.4 as consumed in 2.2, 48 headlines, 50 `sorry`, 11 owned definitions and 3 copies, all as the head has them.
- Headlines: unchanged in number; no headline is declared not statable.

Overlap check: read MeansMajorizationAndDiscreteInequalities, StandardDistributions, MathematicalStatisticsFoundations, OptimalTransport; nothing shared. As in the previous review, the convex order, its stop-loss form and majorization are owned by MeansMajorizationAndDiscreteInequalities §4.1 and §6.1–6.2, the usual order through distribution functions by StandardDistributions §7.13, the compact Strassen theorem by MathematicalStatisticsFoundations §7.5; primal attainment and Kantorovich duality, newly consumed in 2.2, are owned by OptimalTransport §1.5 and §2.4 and cited, not restated.

Source independence: changed passages only; 0 passages compared with 0 sources, since none of the four books could be read; largest share Shaked–Shanthikumar, 53 of 66 locators; the diff adds, removes and reorders no layer, so the arrangement was not compared again.

Research link: The headline targets are the ordered-coupling theorem of Strassen and Kamae–Krengel–O'Brien, Strassen's martingale coupling and the Karlin–Novikoff criterion, as stated in Shaked–Shanthikumar (2007), Marshall–Olkin–Arnold (2011), Rachev–Rüschendorf (1998) and Liggett (1985); the README names monotone-likelihood-ratio testing, stop-loss comparison of risks and Holley-type domination as uses. Rests on the README.

## Not verifiable

- The attribution of the new route of 2.2 to Rachev–Rüschendorf ("Rachev–Rüschendorf's proof, through duality"): the book could not be read legally; the argument itself was recomputed and holds.
- Every locator into Shaked–Shanthikumar, *Stochastic Orders*: paywalled, no legal copy found.
- Marshall–Olkin–Arnold, 17.A.5, 17.C.1, 17.C.8–17.C.10, 17.C.12, 17.C.15, (13a) and the page locators of 5.3–5.4: paywalled, no legal copy found.
- Rachev–Rüschendorf, Thm 3.5.5, pp. 146–147, and Liggett, Ch. II, Thm 2.4, p. 72 (2.2): no legal copy found.
- The attribution of the counterexample of 3.5 to Shaked–Shanthikumar, Remark 1.C.2: the numbers are right; whether the remark uses this example was not checked.

## Source issues

- none

## For the human reviewers

- Not tested: Shaked–Shanthikumar carries 53 of the 66 locators in the layers; neither its text nor its table of contents could be read, so wording and arrangement were not compared with it (nor with the other three books).
- Licence: nothing observed; the three definitions copied into `Suggested.lean` (lines 55–74) come from the roadmap MeansMajorizationAndDiscreteInequalities, which is itself still an open pull request and must merge first.
