# Review of DiscreteTimeFinance (pull request #2876 at 918cdfb)

**Verdict:** accepted

**Summary.** Accepted: every statement, Check and worked number was recomputed (degenerate cases `T = 0`, `d = 0`, `P = 0`, null points, non-measurable singletons, `a ≤ −1`) and none is false; `Suggested.lean` elaborates with `sorry` as its only warning and none of its 13 theorems closes in one tactic. There is one small correction (the Summary's binomial criterion omits `T ≥ 1` and `S₀ > 0`) and one format note, neither blocking. No legal copy of any of the three cited lecture notes could be read, so no source locator and none of the README's remarks on Cuchiero's proofs was checked against the text; this, and the fact that every locator points to unpublished lecture notes, is left to the human reviewers.

## C01 — The Summary's criterion for the binomial tree omits `T ≥ 1` and `S₀ > 0`, without which it fails

A reader who takes the Summary as the statement gets an equivalence that the roadmap's own Checks refute. The Summary (README lines 27–28) says: "In the Cox–Ross–Rubinstein tree with discounted returns `a < b` and every path charged, there is no arbitrage if and only if `a < 0 < b`". The Conventions allow `T = 0`, and the Checks of 4.2 (lines 631–634) give the counterexamples: for `T = 0`, `a = 1/10`, `b = 3/10` there is no arbitrage although `a < 0` fails, and for `S₀ = 0` there is never an arbitrage. Section 4.2 and `crr_noArbitrage_iff` carry both hypotheses, so no stated result is affected.

The smallest change: "In the Cox–Ross–Rubinstein tree with at least one period, a positive initial price, discounted returns `a < b` and every path charged, …".

## N01 — The References give no address for the three lecture notes

The entries for Cuchiero, Grasselli and Kevei (README lines 930–937) describe where each PDF is ("on W. Schachermayer's page", "on the Fields Institute's site", "on the author's page") without a URL, and a search by author, title and year found no copy that could be read. A reader who wants to check a locator has the same difficulty. Giving the address of each PDF, as the entry for the prior formalization gives its arXiv number, would settle it; for Kevei's notes, whose cited version is dated two days before this head, the address is the only way to find that version.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `gains`, `NoArbitrage` | unfold at `t = 0, 1`; `Ω = {u,d}` incr `(1,−1)`, `(1,2)`; `P = (1/2,1/2,0)` incr `(0,0,5)` | `gains 0 = 0`, `gains 1 = ⟨H 0, X 1 − X 0⟩`; `(h,−h)` never ≥ 0 nonzero; `(1,2)` arbitrage; `(0,0,5h) = 0` a.s. | holds | none |
| 1.2 martingale measures | `T = 0`, `X t = t`; `P = (1/2,1/2,0)` incr `(1,2,−1)` | stopped process `0`, `E[X 1] = 1 ≠ 0`; `1/5 + 2/5 − 3/5 = 0`, charges null point; `Q₁ + 2Q₂ > 0` | holds | none |
| 1.3 pricing | `T = 0`; non-measurable `f`; `Ω = ℕ × {±1}` | `∫ f dQ = a`; `f =ᵐ[Q]` measurable function suffices; `∑ 2·2^(−n−2) = 1`, `E|gains| = ∑ 2^n 2^(−n−1) = ∞`, integral `0 ≠ 1` | holds; finiteness needed | none |
| 1.4 first theorem | `T = 0`; `d = 0`; `P = 0`; null point; non-measurable singletons; `X 0 = (0,1)` with `ℱ 0` trivial | `P` is EMM at `T = 0`, `d = 0`; `P = 0` and non-adapted: NA true, no `Q`; Dirac sum on charged points has `P`'s null sets | holds; each hypothesis needed | none |
| 1.5 bridge | `n = 0` one point `β = (1,0)`, `S = (1,0)`; both directions with `selfFinancingBond id 0` | wealth `0` both sides; junk price `1 → 0`, holding `−1` gains `1`; cost exactly `0`, discounted wealth = gains | holds; `β > 0` needed | none |
| 2.1 completeness, atoms | `T = 0`, two charged points, `ℱ 0 = ⊤`, claim `(1,2)`; `atomOf ⊥` | gains `0`, so `(1,2) ≠ a`; all `Q` charging both points are EMMs and differ on `ℱ 0`; `atomOf ⊥ ω = Ω` | holds | none |
| 2.2 second theorem | `P = 0`; trinomial; `{1,2,3}` coarse `ℱ 1` incr `(1,−1,−1)`; incr `(1,2,3)`; `d = 0`; `T = 0` | both sides true; EMMs `(s,1−2s,s)`, span dim 2 < 3; complete, `Q{1} = 1/2` only on `ℱ 1`; arbitrage: RHS true, LHS false | holds; NA needed | none |
| 2.3 branching bound | binomial; `T = 2` with `X 2 − X 1 = 1`; non-adapted `(1,−1,0)`, `(0,1,−1)` | 2 ≤ 2; complete with arbitrage, 3 children > 2; gains ⟂ `(1,1,1)`, span `ℝ³`, 3 children > 2 | holds; both hypotheses needed | none |
| 3.1 superhedging set | trinomial, `f = (1,0,0)`; incr `(1,2)` | `a + h ≥ 1`, `a ≥ 0`, `a − h ≥ 0` give `[1/2, ∞)` at `h = 1/2`; all of `ℝ` | holds | none |
| 3.2 duality | trinomial call; `T = 0`; `m0 = ⊥`; `P = 0`; Tucker step with `s = 0`, `x_e > 0` | `π = 1/2` at `(1/2,0,1/2)`; EMM means `1/4`, `1/3`; `T = 0`: both `max f` on charged points; `m0 = ⊥`: price `1`, integral `0` | holds; hypotheses needed | none |
| 3.3 price interval | trinomial call; binomial; `m0 = ⊥`, `f = 1_{ω₁}`; `P = 0` | means `s ∈ (0,1/2)`; one point; set `{0}` but `P{f ≠ 0} = 1`; empty set, neither alternative | holds | none |
| 3.4 arbitrage-free prices | `T = 0` with `ℱ 0` trivial; `T = 0`, two atoms, `f = (1,2)`; `P = 0`, `T = 1` | both sides `a = c`; means `(1,2)` but `Y 0 = a = f` impossible; every `a` on the left, none on the right | holds | none |
| 3.5 optional decomposition | `P = 0`; incr `(1,0)`, `ΔV = (0,1)`; trinomial `V = 1/2, (1,0,0)`; `T = 0`, `d = 0`, `V 0 = (0,1)`; pasted measure | all true; (1) vacuous, (2),(3) false; `C 1 = (0,1/2,0)`, constant forces `h = 1 = 0`; (3) true, (1) false; pasting keeps `ℱ t`-law | holds; NA, `hV`, `hX` needed | none |
| 4.2 tree criterion (and C01) | `T = 0`; `a = b = 0`; `S₀ = 0`; point mass, `T = 2`; `a ≤ −1` | `q b + (1−q) a = 0`; `T = 0`: NA with `a = 1/10`; `S₀ = 0`: gains `0`; point mass: gain `S₀ b > 0` | 4.2 holds; Summary omits `T ≥ 1`, `S₀ > 0` | C01 |
| 4.3 tree measure | `T = 0`; `a = −1`, `b = 1/2`, `T = 2`; `a = −1/5`, `b = 3/10`; call `T = 3` | Dirac both sides; `4/9 + 2/9 + s/3 + (1−s)/3 = 1`, EMM for all `s`; `q = 2/5`; `(72.8 + 6·29.6)/27 = 1252/135` | holds; `a ≠ −1` needed | none |
| 5.1 American prices | trinomial `Z 0 = 3/5`, `Z 1 = (1,0,0)`; `T = 0` | `max(3/5, 1/2)` gives `[3/5, ∞)`; a.s. upper bounds of `Z 0` | holds | none |
| 5.2 seller's price | put `K = 105`, tree `(1.2, 0.9, 0.05)`, `T = 3`; trinomial `Z 0 = 2/5`; `T = 0`, `Z 0 = (0,1)` | American `7.985099`, European `5.992873`; envelope `2/5` < price `1/2`; price `1`, mean `1/2` | holds; completeness and `hZ` needed | none |
| 5.3 American call | same tree `K = 105`; `K = −10`; `r = −0.05`; `B = (0,1)`, `K = 1`, `X ≡ 1` | `15.289925` both; `110` vs `108.638376`; `q = 1/6`, `3.295751` vs `2.358620`; envelope `1`, conditional mean `0` | holds; each hypothesis needed | none |

- Source locators checked against the text: 0 of 32 citation sites (23 Cuchiero, 4 Grasselli, 5 Kevei); no text was readable.
- Tau Ceti declarations opened at the pin: 14 (`Probability/Finance/Arbitrage.lean` 68, 78, 87, 103, 119, 189, 228; `SimpleStrategy.lean` 117, 192, 365, 550, 568, 584, 592; `Analysis/Convex/Stiemke.lean` 55; `Geometry/Convex/Cone/Alternative.lean` 159), each matching its description in the supplier contracts.
- Mathlib declarations located at the pin: 22, among them `Martingale` (`Probability/Martingale/Basic.lean` 53), `martingale_nat` (479), `supermartingale_nat` (425), `Submartingale.monotone_predictablePart` (`Centering.lean` 85), `Submartingale.expected_stoppedValue_mono` (`OptionalStopping.lean` 43), `ConvexOn.map_condExp_le` (`CondJensen.lean` 168), `Integrable.of_bound` (`IntegrableOn.lean` 171), `condExp_mono` (`ConditionalExpectation/Basic.lean` 484), `Measure.trim` (`Trim.lean` 36).
- Cross-roadmap citations resolved: OptimalStopping 1.1, 1.3, 1.4 at its open head (five theorem names found with the hypotheses the README states; `snellEnvelope` and `optimalStoppingTime` agree character for character with the copies); ConvexAnalysisAndDuality 1.4 and 5.3 at its open head; FinancialMathematics, StochasticCalculus, MarkovDecisionProcesses on main.
- Duplication by object: no multi-asset gains, martingale-measure existence, completeness, superhedging, Snell envelope or binomial tree in the pinned Mathlib or Tau Ceti; no other roadmap, on main or open, states them (RiskMeasures cites 3.2 and uses nothing).
- Dependency check: `depcheck: 171 roadmaps, 1988 edges, 0 problem(s)`; no UPWARD or CYCLE line. The only roadmap supplier, OptimalStopping, is an open pull request adding a new folder and is named in the description.
- Elaboration: `sorry` the only warning (13 theorems). All 27 elaborated types compared with the README statements; only `gains` drops `[MeasurableSpace Ω]`, which its statement does not need. One-tactic probe (`rfl`, `simp`, `infer_instance`, `simp` with the definitions unfolded): none of the 13 closes.
- Pull request text: title and description agree with the head (13 theorems, 14 definitions, the two imports, the open supplier); no change outside the folder.

Overlap check: read FinancialMathematics (on main and its open revision), OptimalStopping, MartingaleCentralLimitTheorem, MarketImpact, StochasticCalculus; the Snell envelope and the first meeting time are OptimalStopping's (1.1, 1.3) and are cited and copied, not owned here; nothing else shared.

Source independence: 0 passages compared with 0 sources, since none of the three texts could be read; largest share Cuchiero, 23 of 32 citation sites; contents of Cuchiero not compared (table of contents not readable).

Research link: The README attributes the first fundamental theorem on a finite space to Harrison and Pliska, the optional decomposition to Kramkov, the tree to Cox, Ross and Rubinstein, and names Dalang–Morton–Willinger as the extension to general spaces; it gives no years or locators for them. Rests on the README's References only.

## Not verifiable

- Every locator into Cuchiero's notes (Definitions 2.2.1, 2.2.13, 2.3.1, 2.4.1; Theorems 2.2.9, 2.2.16, 2.4.2, 2.5.1, 3.1.1, 4.2.3; the corollaries, propositions and remarks cited in 1.3–5.3): no legal copy found by author, title and year; the README places the PDF on another person's page.
- Every locator into Grasselli's notes (Theorem 1.2.7, Corollary 1.2.8, Propositions 1.2.9, 1.2.10): no copy found.
- Every locator into Kevei's notes (Theorem 1, Theorem 6, §5.2, §5.3): no copy found; the README gives no address.
- The README's three remarks on Cuchiero's proofs (Proposition 2.2.24 rests on an unproved bipolar theorem, in 2.2; the lim sup step of Lemma 2.2.8, in 3.2; the unconditional inequality in the proof of Theorem 2.5.1, in 3.5): the text could not be read. The two-point example of 3.5 was recomputed and is correct as arithmetic (`E_Q[V_2 − V_1] = 0` under the only equivalent measure `(1/2, 1/2)`, and `1 ≤ 0` fails at the first point).
- Agreement of `Suggested.lean` with the Lean library `formal-mathfin` named in the References: not compared.

## Source issues

- none

## For the human reviewers

- **Scope.** All 32 source citations are to three unpublished lecture notes (Cuchiero 2016 draft, Grasselli 2010, Kevei 2026); the refereed literature (Harrison–Pliska, Kramkov, Cox–Ross–Rubinstein, Föllmer–Schied) is attributed in prose without locators (README lines 949–952).
- **Licence.** Cuchiero's notes are cited from a PDF on another person's university page (README lines 931–932); Grasselli's notes are written up by two note-takers on an institute's site (lines 933–935). No legal copy of either was found.
- **Licence.** The References name a public Apache-2.0 Lean library, `formal-mathfin`, covering the same theorems for one asset; the description says `NoArbitrage` and `IsCompleteMarket` occur there with different statements. This was not compared.
- **Not tested.** Cuchiero (23 of 32 locators) could not be read: wording and arrangement unchecked. By locator numbers, Layers 1–5 ↔ §2.1–2.2, §2.3, §2.4–2.5, §3.1, §4.2; the `*Needs:*` lines force only Layer 1 first and Layer 5 after Layer 2.
