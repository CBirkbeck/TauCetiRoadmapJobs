# Review of RegretMinimizationAndEquilibria (pull request #2482 at ee8c93c)

**Verdict:** needs changes

## R01 (P3) — Three citations carry no locator

**Location:** `TauCetiRoadmap/RegretMinimizationAndEquilibria/README.md` lines 459–460 and 697–698: "Moulin and Vial 1978 for the coarse notion, and Hannan 1957 for the no-regret property behind it" and "(Kuhn 1950 for the value;".

**Claim:** Each of the three works is cited as a whole, with no section, theorem or page, for a definition (coarse correlated equilibrium), a property (Hannan consistency) and a number (`−1/18`).

**Witness:** The same two sentences give "Aumann 1974, Section 3 … Example 2.7" and "Zinkevich, Johanson, Bowling and Piccione 2007, Theorem 2"; the three works above are 21, 43 and 7 pages long.

**Repair:** Add the section or theorem and the printed page to each of the three (none of the three texts could be read for this review, so the numbers are the author's to supply). For the no-regret property a locator that was checked is available as a second citation: "Hart and Mas-Colell 2000, Section 4(c)" (HartMasColell2000 lines 464–470 attribute the property to Hannan 1957).

## R02 (P3) — Three definitions have fewer than three discriminating Checks

**Location:** `TauCetiRoadmap/RegretMinimizationAndEquilibria/README.md` 4.1 (`IsSequenceForm`: no Check), 3.3 line 500 (`deviationPayoff`: one Check) and 3.3 lines 498–499 (`empiricalDistribution`: "`T = 1`: `μ` is a product", "`T = 0` … is not a distribution").

**Claim:** `IsSequenceForm` has no Check of its own, `deviationPayoff` has one, and the two Checks of `empiricalDistribution` do not separate it from the product of the averaged marginals, which agrees with it at `T = 1` and at `T = 0`.

**Witness:** Two players, two actions, `σ 0 = (e₀, e₀)`, `σ 1 = (e₁, e₁)`, `T = 2`: `empiricalDistribution` is `1/2` on `(0,0)` and `(1,1)` and `0` elsewhere; the product of the averaged marginals is `1/4` everywhere. No Check sees the difference.

**Repair:** Add these Checks (values computed for this review).

- 4.1, `IsSequenceForm`: with `j₀` (actions `a`, `a'`, parent `none`) and `j₁` (actions `c`, `c'`, parent `⟨j₀, a⟩`), `b j₀ = (1/2, 1/2)` and `b j₁ = (1/4, 3/4)` give `x = (1; 1/2, 1/2; 1/8, 3/8)`, and `1/8 + 3/8 = x (some ⟨j₀, a⟩)`; setting `x (some ⟨j, a⟩) = b j a` would give `(1/4, 3/4)` at `j₁`, of sum `1 ≠ 1/2`.
- 4.1, `IsSequenceForm`: with `b j₀ = (0, 1)` in the same process, `x` vanishes on both sequences of `j₁` for every `b j₁`, so distinct behavioral strategies have the same sequence form.
- 4.1, `IsSequenceForm`: for one decision point and `b j = (2, −1)`, `x = (1; 2, −1)` is the sequence form of `b` and is not in `Q`; the realization theorem uses `b j ∈ simplex (A j)`.
- 3.3, `deviationPayoff`: in matching pennies with `σ t 2 = (1, 0)`, `deviationPayoff u σ 1 t = (1, −1)` whatever `σ t 1` is.
- 3.3, `deviationPayoff`: `⟨σ t i, deviationPayoff u σ i t⟩ = U i (σ t)`; in the previous example with `σ t 1 = (1/4, 3/4)` both sides are `−1/2`.
- 3.3, `empiricalDistribution`: the witness above (`1/2, 0, 0, 1/2`, against `1/4` everywhere for the product of the averaged marginals).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `sum_sub_eq_sum_mul_regret`, `regret_le_swapRegret`, `abs_instRegret_le` | `ι = Fin 2`, `p = (1,0)`, `u = (0,1)`; `p = (0,1)`; `T = 0`; `n = 1` | regret vs `1`: `T`, swap `T` (φ = const 1); second: `−T`, `0`, swap `0`; `T = 0`: `0 = 0`; instantaneous regret in `[−Δ, Δ]` | holds; `Σ q = 1` and `Σ p t = 1` are both used | none |
| 1.2 `hedge_regret_le`, `hedge_regret_le_sqrt` | `η = √(8 log n/T)/Δ`; `n = 1`; `T = 0`; `Δ = 0`; `u = (1,0)` | `log n/η = ηΔ²T/8 = Δ√(T log n/8)`, sum `Δ√(T log n/2)`; `n = 1`, `T = 0`, `Δ = 0`: `0 ≤ 0`; `p t 1 = 1/(1+e^{ηt})` | holds; shift by `c t` cancels in the normalisation | none |
| 1.3 `regretMatching_sum_sq_pos_le`, `_regret_le`, `_of_ranges` | `u t = (1,0)`; `u 0 = (1,0), u 1 = (0,1)`; `R⁺ = 0` | `R 1 = (1/2,−1/2)`, `R 2 = (1/2,−3/2)`, regret `1/2 ≤ √(2T)`; second `R 2 = (1/2,1/2)`; `⟨R⁺, r⟩ = 0` in both branches | holds | none |
| 1.4 `regretMatchingPlus_regret_le` | same two sequences | `Q 1 = (1/2,0)`, `Q 2 = (1/2,0)`; second `Q 2 = (1/2,1)`, play `(1/3,2/3)` vs `(1/2,1/2)`; `Q ≥ R` by induction | holds | none |
| 1.5 `blackwell_approachability` | recursion at `T`; base `T = 1`; `r` constant; `g ∈ S` | `T²d_T² ≤ (T−1)²d²_{T−1} + ‖r−π‖²`, `‖r−π‖ ≤ ‖r−g‖ ≤ D`; `d₁ ≤ D` since `S` meets the hull; constant `r`: `0 ≤ 0` | holds; `hne` follows from `hresp` | none |
| 1.5 `blackwell_converse` | `E = ℝ`, `S = (−∞,0]`, `M = [[1],[1]]`; `S = ∅` | averages `= 1`, `infDist = 1 = δ`; `infDist x ∅ = 0 < δ` | holds; nonempty `S` is used, convexity is not | none |
| 2.1 `Matrix.exists_saddle_point`, `exists_mixedNash`, `iSup_iInf_payoff_eq` | `[[2,0],[0,1]]`; `[[1],[0]]`; matching pennies | maximiser `2x = 1−x`, `x = 1/3`, value `2/3`, `b = (1/3,2/3)`; one column: value `1` vs saddle payoff `0`; pennies `0` | holds; saddle of `−M` is the Nash pair | none |
| 2.2 `gap_le_of_regret`, `regretMatching_selfPlay_gap_le` | sum of the two regret inequalities at pure `i`, `j`; ranges of `M *ᵥ y`, `−(x ᵥ* M)` | `T(payoff eᵢ ȳ − payoff x̄ eⱼ) ≤ R₁+R₂`; both ranges `Δ`; `Δ(√(card ι)+√(card κ))√T/T` | holds | none |
| 3.1 `exists_isNash`, `isNash_iff_pure` | battle of the sexes; `N` empty; `A i` empty | mixed: `p = 2/3`, `q = 1/3`; empty `N`: one profile; empty `A i`: `simplex = ∅`, excluded by `Nonempty` | holds; `Nonempty (A i)` is in the elaborated type | none |
| 3.2 correlated and coarse correlated equilibria | chicken `[[6,2],[7,0]]`; RPS ties; pennies `ε = (−1,−1)` | payoff `15/3 = 5`; told C: `4 ≥ 3.5`, told D: `7 ≥ 6`; Nash `q = 2/3`, `14/3`; RPS swap gains `1`; deviations average `0 > −1` | holds | none |
| 3.3 `isCoarseCorrelatedEq_of_regret`, `isCorrelatedEq_of_swapRegret` | linearity in slot `i`; RPS `Δ = 2`, `n = 3`; `T = 0` | `Σ_a μ a u i (update a i b) = (1/T) Σ_t dev t b`; `⟨σ t i, dev t⟩ = U i (σ t)`; `2√(3T)/T = 2√(3/T)`; `μ = 0` | holds | R02 |
| 3.4 `exists_stationary_distribution`, `swapRegret_le_sum_regret`, `blumMansour_regretMatching_le` | `Q = [[1,0],[1,0]]`; swap; fixed φ; Cauchy–Schwarz | `p ᵥ* Q = (1,0)`, `Q *ᵥ p = (1,1)`; swap matrix: `(1/2,1/2)`; `Σ_b regret_b(φ b)` equals the φ-term; `Δ√n·√(nT) = Δ n √T` | holds; only stationarity used in the first | none |
| 4.1 `mem_sequenceFormPolytope_iff`, `isGreatest_linear_bestResponse` | one point; `J` empty; self-parent; `ℓ = −1` | `{1} × simplex`; `{1}`, max `ℓ none`; self-parent: unbounded; max `−2`; Kuhn `1 + 6·2 = 13` | holds; `ρ` is needed for `⇐` and for `x ≤ 1` | R02 |
| 4.2 `laminar_regret_le` | identity with arbitrary `b`, `y` with flow constraints | both sides `Σ_{s≠none} ℓ s y s − Σ_{parent j = none} v_j`; `x (parent j) v_j` is the subtree sum without `Σ b = 1` | holds; `y ≥ 0`, `y ≤ 1` only in the inequality | none |
| 4.3 `cfr_regret_le` | one point; Kuhn player 1 and 2 | local regret equals `rmRegret` of `V t ⟨j,·⟩`; Kuhn largest absolute value `2/3` (computed), `6·(4/3)√(2T) = 8√(2T)` | holds | none |
| 4.4 `cfr_selfPlay_gap_le`, `kuhnPoker_value` | the 13×13 `kuhnPayoff`; `α ∈ {0, 0.1, 1/3}`; 1000 rounds | player 1 guarantees `−0.0555556` for each `α`; player 2 holds to `−0.0555556`; run: value `−0.0555572`, gap `0.014538`; bound `0.7155` | holds; entries `2/6`, `−1/6`, `−1/6` as stated | R01 |

- Source locators checked against the text: 23 of 37 (Blackwell1956 lines 110, 196; BlumMansour2007 lines 152, 202, 222, 235, 302; Zinkevich2007 lines 136, 181, 205; FarinaKroerSandholm2019 lines 333, 350, 437, 616; Tammelin2014 line 26; TammelinBurchJohansonBowling2015 line 252; HartMasColell2000 lines 292, 490; HartMasColell2001 line 729; vonStengel1996 lines 317, 321, 391; FreundSchapire1997 line 210; FreundSchapire1999 lines 334, 379).
- Library declarations opened at the pins: `Topology/Sion.lean:545`, `Order/SaddlePoint.lean:48`, `Probability/Moments/SubGaussian.lean:851`, `LinearAlgebra/Matrix/Stochastic.lean:43, 81, 102`, `Analysis/Normed/Module/Convex.lean:166`, `Analysis/InnerProductSpace/Projection/Minimal.lean:40, 145`, `Geometry/Convex/ConvexSpace/Defs.lean:61, 111`, `…/Topology.lean:165`, `…/CompactSpaceStdSimplex.lean:69`, `Analysis/Convex/StdSimplex.lean:39` (deprecated), `SetTheory/Cardinal/Cofinality/Club.lean:261`; Tau Ceti `Analysis/Convex/StdSimplex.lean:57`, `AlgebraicTopology/Singular/BrouwerFixedPoint.lean:140`. No regret, Nash-equilibrium, approachability or matrix-game declaration exists at either pin.
- Cross-roadmap citations resolved: MarkovChainsAndRenewal Layer 3 (main, README lines 234–262: existence only for irreducible positive recurrent chains), MathematicalStatisticsFoundations 7.2 (main, line 1206), FirstOrderOptimization 6.4 (open head, line 767; its exclusions at lines 51–53). Mathlib pull requests 39393 and 34713 exist, are open, and declare the names cited.
- Gate at this head: every check passes. Dependency check: `depcheck: 237 roadmaps, 2516 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changed outside the roadmap folder.
- Elaboration of `Suggested.lean`: exit 0, 29 `sorry` warnings and nothing else. Elaborated types compared with the README for all 60 declarations: every theorem keeps `Nonempty`, `Fintype` and `DecidableEq`; the dropped instance binders are on definitions whose bodies do not use them.
- One-tactic probe (`rfl`, `simp` with the definitions unfolded, `simp_all`, `positivity`) on a scratch copy: 0 of 29 theorems close. Headline theorems of the README (regret bounds 1.2–1.4, Blackwell and converse, minimax, self-play gap, Nash existence, convergence to equilibria, Blum–Mansour, realization, best response, laminar decomposition, CFR bound, CFR self-play, Kuhn value) are all stated; none is forced through a stand-in.
- The hypotheses `hn`, `hT`, `hΔ` of `hedge_regret_le_sqrt` and `hne` of `blackwell_approachability` are not needed for truth (values in the table); they match the README and are left.
- Pull request text read against the head: 29 theorems counted, bounds, suppliers and boundaries agree with the README; no sentence is contradicted.

Overlap check: read FirstOrderOptimization, MathematicalStatisticsFoundations, MarkovChainsAndRenewal; stationary distributions are shared with MarkovChainsAndRenewal Layer 3, which owns stationarity and the irreducible case, while this roadmap owns only existence for an arbitrary finite row-stochastic matrix, which that roadmap does not state; nothing else shared.

Source independence: 12 passages compared with 11 sources, none shared; largest share CesaBianchiLugosi2006, 5 of 37 locators, text not readable; contents compared with its chapter list (twelve chapters) only: Layers 1–4 do not follow it (Layer 1 draws on its chapters 2, 4 and 7, Layer 4 has no counterpart).

Research link: Layers 1–3 state results of Blackwell 1956, Hart and Mas-Colell 2000 and Blum and Mansour 2007; Layer 4 states the counterfactual-regret bounds of Zinkevich, Johanson, Bowling and Piccione 2007 and Farina, Kroer and Sandholm 2019, which Tammelin, Burch, Johanson and Bowling 2015 use to solve heads-up limit hold'em. Rests on the README references and the texts read.

## Not verifiable

- Cesa-Bianchi and Lugosi 2006, Sections 2.1, 4.4, 7.3, 7.4 and Theorem 2.2 (1.1, 1.2, 2.2, 3.3): a book with no open copy; only the publisher's chapter list was read.
- Nash 1951, Theorem 1 (3.1): JSTOR only.
- von Neumann 1928, Sections 2 and 3 (2.1): only the EuDML record was read, not the scan.
- Aumann 1974, Section 3 and Example 2.7 (3.2): paywalled.
- Koller, Megiddo and von Stengel 1994, Lemma 5.1 (4.1): ACM page refused; no author copy found.
- Moulin and Vial 1978, Hannan 1957, Kuhn 1950 (3.2, 4.4): paywalled or a book chapter; see R01.
- Freund and Schapire 1999 was read in the authors' version dated April 1999, which carries the journal's page range; its section numbers were not compared with the printed article.
- Ownership against the board's packages under review was not checked beyond the index of their names.

## Source issues

- none

## For the human reviewers

- **Scope.** The sources are refereed, in venues of computer science and economics (JMLR, NeurIPS, AAAI, IJCAI, Econometrica, Games Econom. Behav.) besides Pacific J. Math., Ann. of Math. and Math. Ann.; `metadata.toml` gives topic `math.OC`.
- **Licence.** README lines 745–753 name four BSD-3 Lean repositories covering regret matching, Nash existence and Blackwell obstructions; only the front page of one was read, and `Suggested.lean` was not compared with them declaration by declaration.
- **Not tested.** CesaBianchiLugosi2006, the source with the most locators (5 of 37): neither its text nor its section-level contents could be read; wording and arrangement were checked against its chapter list only.
- **Mathlib deference.** Mathlib pull request 34713, whose name 3.4 adopts, has been a draft since June 2026 and a reviewer there called it unsuitable as it stands; 39393 is open with a merge conflict since September 2026.
- **Numerical Check.** 4.4 reports a 1000-round self-play run (`−0.05556`, gap `0.0145`); it was reproduced exactly here, but it is a computation and not a hand-checkable value.
