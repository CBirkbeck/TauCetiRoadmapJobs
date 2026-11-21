# Review of PortfolioTheory (pull request #2902 at 1eec69c)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement of the four layers was recomputed at its degenerate inputs (ruin, `m = 0` and `1`, `n = 0`, `p = 0` and `p → 1`, singular and indefinite matrices, a negative price relative) and every number printed in a Check was recomputed; the locators into Algoet–Cover and Cover were read in the texts. There is one small correction (a dependency line of Layer 3) and two format notes, none blocking. Three sources (Breiman, Blum–Kalai, Haugh) could not be read from a place the review may use, and two questions are left to the human reviewers.

## C01 — Layer 3 says it uses no other layer, but Cover's bound is stated for the portfolios of 1.1

The Dependencies of Layer 3 (line 431) end with "No other layer", the overview (line 44) says "Layers 3 and 4 use no other layer", and the *Needs* line of 3.2 (line 418) lists only 3.1 and library declarations. The statement of 3.2 quantifies over "every portfolio `b`", and in `TauCetiRoadmap/PortfolioTheory/Suggested.lean` (line 212) the hypothesis is `hb : b ∈ portfolios m`, the abbreviation defined in 1.1. An implementer who takes the dependency lines at their word would start Layer 3 without the definition its headline is stated with.

The smallest change: add "1.1 (the definition of `portfolios`)" to the *Needs* line of 3.2 and to the Dependencies of Layer 3, and let the overview say that Layers 3 and 4 use no theorem of another layer.

## N01 — The Cover reference heads with the published article but gives only the typescript's numbering

The reference (lines 674–676) and the citations in 3.1 and 3.2 use the numbering of a typescript of 1996. In the article as printed in Mathematical Finance 1 (1991), which is also on Cover's page, the same items are equation (1.3), p. 2 (the universal portfolio), equation (1.7), p. 3 (universality, for bounded sequences) and Lemma 2.5, p. 5 (the wealth identity). Would add these beside the typescript's numbers, so that a reader holding the journal finds them.

## N02 — One section comment of the Lean file carries another title than the README's layer

`TauCetiRoadmap/PortfolioTheory/Suggested.lean` line 127 reads "Layer 2: repeated investment and asymptotic optimality"; the README's heading is "Layer 2: asymptotic optimality of log-optimal investment".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 definitions, Checks | cash-and-stock market; fair race at `(1,0)`; `m = 1`; `m = 0` | returns `1.4`, `0.84`; rate `0.134589 − 0.104612 = 0.029977`; `(1,0)`: return `0` w.p. ½, face value `0 > −log 2`; `m = 0`: no portfolio | true | none |
| 1.2 Kuhn–Tucker iff | `(3/5,2/5)`; `(1,0)`; `X = (0,1)` at `(1,0)`; `X = (1,½)` | scores `0.285714 + 0.714286 = 1`, `0.571429 + 0.428571 = 1`; `1.16 > 1`; `∞` in `ℝ≥0∞`; `1` and `½` | true both directions | none |
| 1.2 route | `λ ≤ ½`, `Z ≥ −1` | `log(1−λ)/λ` decreasing in `λ`, value `2 log ½` at `½`; `∑ b_j score_j = 1` forces equality on the support | sound | none |
| 1.3 existence, uniqueness | two identical assets; `X = (1,½)`; uniform portfolio | all splits optimal, equal returns; unique `(1,0)`; relative return `≥ 1/m`, so finite rate | true | none |
| 1.4 horse race | odds `(2,2)`, `p = 0.6`; odds `(10,1)`; `P{j} = 0` with `b_j > 0` | score `P{j}/b_j` (`0·∞ = 0`); `log 2 − H(0.6) = 0.693147 − 0.673012 = 0.020135`; some winnable `b_j < P{j}` | true | none |
| 1.5 Kelly | `(0.6,1)`; `(0.3,3)`; `(0.2,3)`; `p = 0`; `p = 1`; `f = 1` junk | `f* = 0.2`, growth `0.020136`; `1/15`; `0`; `0`; no maximum on `[0,1)`; `0.9 log 2 = 0.6238 > 0.368064` | true | none |
| 2.1 asymptotic optimality | `n = 0`; market of 1.1 with `b 0 = (1,0)`; `X = (0,1)`, `bstar = (1,0)` | ratio `1`; `0.4/1.4 + 0.6/0.84 = 1`; junk quotients `0`, wealths `1` against `0`: positivity needed | true | none |
| 2.1 route | `R(n+1) = R n · Q n` with junk division | `(ac)/(bd) = (a/b)(c/d)` in a field, zeros included; `E[min(R,K) Q] ≤ E R ≤ 1` | sound | none |
| 2.2 Breiman | market of 1.1; stock alone; `X 0 = (Y,Y)`, `E (log Y)⁺ = ∞` | `0.029977`; `0.277259 − 0.306495 = −0.029236`; rate `+∞`, first item trivial | true | none |
| 3.1 wealth identity | `m = 0, n = 0`; `x 0 = (1,−1)` twice; basis-vector market | `1` against `0` (zero measure): `m ≥ 1` needed; product `0` against `E(b₁−b₂)² > 0`: nonnegativity used; `(m−1)! ∏ k_j!/(n+m−1)!` | true | none |
| 3.2 Cover's bound | `m = 1`; `n = 0`; all `e_1`, `m = 2`, `n = 4`; `x 0 = (1,−1)` | equality `1·W`; `1 ≤ 1`; universal wealth `1/5`, bound attained; `1` against `0` | true | none |
| 3.2 route and Check | `∫₀¹ (1−x^(1/n))^(m−1) dx`; halving-and-doubling market | `n·B(n,m) = n!(m−1)!/(n+m−1)!`; `0.95097`, `1.04131`; exact integrals `1.08333` and `134.6899`; deficits `0.021958`, `0.001555`, `0.147379` | true | none |
| 4.1 frontier iff | variances `1, 4`, means `0, 1`, `w = (0.8,0.2)`; `S = −I`; equal means | variance `0.64 + 0.16 = 0.8`, `S w = (0.8,0.8)`; `S w = −⅓·1`, variance unbounded below; `S w ∈ span{1}` | true | none |
| 4.2 existence | all-ones matrix, equal means; no asset; means `c ≠ r` | every portfolio variance `σ²`; no feasible vector in both other cases | true | none |
| 4.3 two-fund | `diag(1,1,−1)`, `μ = (0,0,1)`; example of 4.1, `α = 0.8` | minimum of `w₁² + w₂² − r²` at `w₁ = w₂ = (1−r)/2`; `(0.8,0.2)` of mean `0.2`; cross term `d·T w = 0` passes to combinations | true for every `S` | none |
| 4.4 closed form | example of 4.1; `μ = c·1`; one asset | `A = B = ¼`, `C = 5/4`, `D = ¼`; `aC + cB = 1`, `aB + cA = r`; variance `5r² − 2r + 1 = 1, 0.8, 4`; `D = 0`; hypothesis vacuous | true | none |
| C01 | 3.2 against 1.1 | hypothesis `b ∈ portfolios m` in the Lean statement; "No other layer" in the README | dependency line incomplete | small correction |

- Source locators checked against the text: 12 in Algoet–Cover (Definition (15), Theorem 1 and (19), p. 881; p. 882 twice; (20)–(23); Theorem 2, p. 883; Theorem 5 and its proof, pp. 888–889; §6, p. 889; Theorem 6; §8, p. 895), 3 in Cover in the published numbering.
- Library declarations opened at the pins: 27 of Mathlib (all those of the supplier contracts, each in the file named) and 5 of Tau Ceti; `dirichletMeasure` is the zero measure for an empty index type (`TauCeti/Probability/Distributions/Dirichlet/Basic.lean` line 122), `Matrix.PosSemidef` includes `IsHermitian` (`Mathlib/LinearAlgebra/Matrix/PosDef.lean` line 62).
- Cross-roadmap citations resolved: 6 (RegretMinimizationAndEquilibria 1.1 on main, body of `simplex` identical; StatisticalLearningTheory 1.3; ConvexAnalysisAndDuality 5.2; OnlineConvexOptimization, EntropyAndSourceCoding and FinancialMathematics scope).
- Duplication by object: no other roadmap, on main or open, and neither pinned library states log-optimal portfolios, Kelly's criterion, constant rebalanced or universal portfolios, or the mean–variance frontier.
- Dependency check: `depcheck: 171 roadmaps, 1988 edges, 0 problem(s)`; no change outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates with 13 `sorry` warnings and nothing else; all 29 signatures compared with the README, no binder lost.
- One-tactic probe (`rfl`, `simp`, `infer_instance`) on a copy: none of the 13 theorems closes; all 13 README headlines are stated.
- The automatic checks all passed on this head; the description was read against the head (13 theorems, 16 definitions, one Tau Ceti import: as stated).

Overlap check: read DiscreteTimeFinance, RuinTheory, RiskMeasures, OptimalStopping, FinancialMathematics, MarketImpact, RegretMinimizationAndEquilibria; one object shared, `simplex`, owned by RegretMinimizationAndEquilibria 1.1 and cited here; DiscreteTimeFinance leaves portfolio optimization out of its scope.

Source independence: 7 passages compared with 2 sources (Algoet–Cover, Cover), none shared; largest share Algoet–Cover, 17 of the 43 citations that name a source (Breiman 11, Blum–Kalai 7, Haugh 5, Cover 3); contents compared with Algoet–Cover: independent (1.2 ↔ §2, 1.3 ↔ §§2–3, 1.4 ↔ §8, 2.1 ↔ §5, 2.2 ↔ §6, with §4 and §7 absent, §8 moved before §5, and Layers 1.5, 3 and 4 from elsewhere). Breiman, Blum–Kalai and Haugh could not be read.

Research link: Layers 1 and 2 are the Kuhn–Tucker conditions and the asymptotic optimality principle of Algoet and Cover (1988), which extends Breiman (1961); Layer 3 is the universal portfolio of Cover (1991) with the bound of Blum and Kalai (1999). Rests on the README's references and on the texts of Algoet–Cover and Cover.

## Not verifiable

- Breiman (1961), p. 66, Propositions 1–3 and Theorem 2: the open archive's page refused the request twice, and the university collection's host is one the review cannot classify.
- Blum–Kalai, Definition 1, equation (1), Theorem 1 with its proof, the example of p. 1, Theorem 2: the journal is paywalled and the preprint's address names no author, so it could not be fetched as an author's page. The statement of 3.2 and the integral in its route were proved independently above.
- Haugh's notes, §1.1, problem (2) and Exercise 2: the address names no author, so it could not be fetched as an author's page. The statements of Layer 4 are proved in the roadmap and were checked directly.
- Cover's typescript of 1996 (equations (3), (7), Lemma 1, p. 6): not found; the same items were read in the published article (N01).
- Algoet–Cover, the number (41) of the display in §6, p. 889: the display is not legible in the scan's text; the sentence around it, attributing the rate to Breiman, is.

## Source issues

- none

## For the human reviewers

- Scope: Layer 4 (the mean–variance frontier) cites only lecture notes (Haugh, Columbia, 2016), for the problem and an exercise; its four theorems are marked "Proved here", and the description says Merton's 1972 derivation was not retrieved.
- Licence: three sources were read by the author from hosts this review could not classify: Blum–Kalai's preprint (a Carnegie Mellon page), Haugh's notes (a Columbia page), Breiman's paper (the University of California digital collection). `README.md`, References.
- Licence: `simplex` in `TauCetiRoadmap/PortfolioTheory/Suggested.lean` (line 37) is, by the README's own statement, the definition of RegretMinimizationAndEquilibria 1.1 with its docstring, a roadmap of the same project.
