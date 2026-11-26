# Review of StochasticOrders (pull request #3055 at 1dbbdb2)

**Verdict:** accepted

**Summary.** Accepted: the previous review left no finding, and the 51 lines changed since only turn six mentions of other roadmaps into relative links, with no statement, locator, section number or supplier altered. Every link target and every cited section exists on main, and the three copied definitions still agree with their owner there. There are no small corrections and no format notes. The four cited books still could not be read, so the locators, and the comparison of wording and arrangement with Shaked–Shanthikumar, are left to the human reviewers.

## Previous findings

- none: the previous report, of `a1cdb77`, had no finding, small correction or format note; its repairs of the round before (the Check of 5.4, `convexOn_lorenzCurve`, the docstrings of the copies, the route of 2.2) are untouched by this change.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Convex order with its stop-loss characterisation, cited from MeansMajorizationAndDiscreteInequalities §6.1 (Conventions, Scope, supplier contracts) | `μ = δ₀`, `ν = ½δ₋₁ + ½δ₁`; `t = −2, 0, 2`; `φ = x²`; reversed pair | means `0 = 0`; stop-loss `2 ≤ 2`, `0 ≤ ½`, `0 ≤ 0`; `∫x² = 0 ≤ 1`; reversed: `½ ≤ 0` fails at `t = 0` | true, direction as cited | none |
| The three copies (`ConvexOrderLE`, `maxSubsetSum`, `Majorizes`) against the owner on main | bodies set side by side, `Suggested.lean` lines 55–74 against the owner's lines 261–270 and 398–401 | identical bodies and binders (`Fin (Fintype.card ι)` index, `sup'` over `powersetCard i`; `Integrable id` on both laws); only docstrings differ | "copied verbatim" holds for the definitions | none |
| Downstream-consumer sentence on Holley's inequality | GibbsMeasuresAndTheIsingModel on main, lines 370–375 | it names Mathlib `holley` and `fkg` for monotonicity in the boundary condition, as the sentence says | true | none |

The rows for the untouched statements stand as in the previous review, of `a1cdb77`.

- Source locators checked against the text: 0; the diff adds, changes and removes no locator, and none of the four books could be read (below).
- Library declarations opened at the pin: none new; the change touches no library name. The three copied definitions were compared with the owner's `Suggested.lean` on main.
- Cross-roadmap citations resolved on main: MeansMajorizationAndDiscreteInequalities §4.1, §6.1, §6.2; StandardDistributions §7.9, §7.13; MathematicalStatisticsFoundations §6.3, §7.5; OptimalTransport §1.5, §2.4, §3.7; GibbsMeasuresAndTheIsingModel. The five link targets (`../<Name>/README.md`) all exist on main; MeansMajorizationAndDiscreteInequalities and GibbsMeasuresAndTheIsingModel are on main although the branch predates them.
- Dependency check: `depcheck: 101 roadmaps, 1129 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changes outside the roadmap folder.
- Elaboration: `Suggested.lean` (unchanged since `a1cdb77`) elaborates with exit code 0, 50 `sorry` warnings and no other message.
- Automatic checks: all passed on this head.
- Pull request text: read against this head; suppliers, sections, 48 headlines, 50 `sorry`, 11 owned definitions, 3 copies and the import list are as the head has them, and "No supplier is an open PR" is now true of every supplier, MeansMajorizationAndDiscreteInequalities included.
- Headlines: unchanged; none is declared not statable. No statement changed, so the one-tactic probe was not rerun.

Overlap check: read MeansMajorizationAndDiscreteInequalities, StandardDistributions, MathematicalStatisticsFoundations, OptimalTransport; nothing shared. As before, the convex order, its stop-loss form and majorization are owned by MeansMajorizationAndDiscreteInequalities §4.1 and §6.1–6.2, the usual order through distribution functions by StandardDistributions §7.13, the compact Strassen theorem by MathematicalStatisticsFoundations §7.5, primal attainment and Kantorovich duality by OptimalTransport §1.5 and §2.4; all are cited, not restated.

Source independence: changed passages only; 0 passages compared with 0 sources, since the diff adds only link markup around roadmap names and none of the four books could be read; largest share Shaked–Shanthikumar, 53 of 66 locators; the diff adds, removes and reorders no layer, so the arrangement was not compared again.

Research link: The headline targets are the ordered-coupling theorem of Strassen and Kamae–Krengel–O'Brien, Strassen's martingale coupling and the Karlin–Novikoff criterion, as stated in Shaked–Shanthikumar (2007), Marshall–Olkin–Arnold (2011), Rachev–Rüschendorf (1998) and Liggett (1985); the README names monotone-likelihood-ratio testing, stop-loss comparison of risks and Holley-type domination as uses. Rests on the README.

## Not verifiable

- The attribution of the route of 2.2 to Rachev–Rüschendorf: the book could not be read legally; the argument itself was recomputed in the previous review and holds.
- Every locator into Shaked–Shanthikumar, *Stochastic Orders*: paywalled, no legal copy found.
- Marshall–Olkin–Arnold, 17.A.5, 17.C.1, 17.C.8–17.C.10, 17.C.12, 17.C.15, (13a) and the page locators of 5.3–5.4: paywalled, no legal copy found.
- Rachev–Rüschendorf, Thm 3.5.5, pp. 146–147, and Liggett, Ch. II, Thm 2.4, p. 72 (2.2): no legal copy found.
- The attribution of the counterexample of 3.5 to Shaked–Shanthikumar, Remark 1.C.2: the numbers are right; whether the remark uses this example was not checked.
- The seeded sample of sections (1.1–1.3, 2.1, 2.3, 3.2, 3.4, 3.5, 4.1, 4.3–4.5, 5.1–5.3): none falls in a changed passage, and their locators are into the books above.

## Source issues

- none

## For the human reviewers

- Not tested: Shaked–Shanthikumar carries 53 of the 66 locators in the layers; neither its text nor its table of contents could be read, so wording and arrangement were not compared with it (nor with the other three books).
- Licence: nothing observed; the three definitions copied into `Suggested.lean` (lines 55–74) come from the roadmap MeansMajorizationAndDiscreteInequalities, which is now on main, so the earlier note that it must merge first no longer applies.
