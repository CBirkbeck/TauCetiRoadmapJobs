# Review of EvolutionaryGameTheory (pull request #2928 at eec2672)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement, Check and printed number was recomputed (by hand or numerically) and agrees with the text, the three supplier roadmaps say what is cited of them, and `Suggested.lean` elaborates with `sorry` as its only warning and no statement closing in one tactic. There is one small correction (a scope sentence about PotentialGamesAndPriceOfAnarchy) and one format note, neither blocking. Two of the five sources (van Strien's notes, which carry the largest share of the locators, and Sandholm's survey) could not be read through a legal route, so their locators and the wording against them are left for a human to decide.

## C01 — PotentialGamesAndPriceOfAnarchy does not name the replicator equation among its exclusions

In "Scope and ownership" (README line 649) the sentence "PotentialGamesAndPriceOfAnarchy treats pure-strategy potential games and excludes mixed strategies and the replicator equation" attributes to that roadmap an exclusion it does not state, so a reader who follows the pointer finds nothing about the replicator equation there. At its open head, the scope section of PotentialGamesAndPriceOfAnarchy excludes "mixed strategies in potential games" and "best-response, better-response and no-regret dynamics as procedures"; the only mention of the replicator equation (its README line 607) is a remark that PopulationDynamics excludes it. The conclusion drawn (no statement in common with 5.1) stands.

The smallest change: "…treats pure-strategy potential games and excludes mixed strategies in potential games and game dynamics; it does not mention the replicator equation". The pull-request description repeats the sentence ("excludes the replicator equation") and would take the same wording.

## N01 — The reference entry for Sandholm omits Table II

Section 5.2 cites Sandholm's Table II (p. 21); the References entry lists only §VII.4 with equation (18) and §VII.5.1. Adding "Table II (p. 21)" there keeps the list complete.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 symmetric Nash | `A = I`, n = 2; `A = 0`; RPS `e₁`; ι empty | `A(p,1−p) = (p,1−p)`, equal on support iff p ∈ {0, 1/2, 1}; RPS `A e₁ = (0, w, −ℓ)`, w > 0 = mean | true | none |
| 1.1 two-player comparison | player 1 deviates to τ | `Σ x(a₀) τ(a₁) A(a₁)(a₀) = τ · A x`, same as player 0 | true | none |
| 1.2 ESS | `[[0,0],[0,−1]]`; 3×3 pure-mutant matrix; `A = 0`; n = 1 | `y·Ay = −y₂² < 0`; `y = (0,½,½)`: `Ay = (0,½,½)`, `y·Ay = ½ > 0`; line: `s' = s²(1−2s)`; limit `(0, .5, .5)` numerically | true | none |
| 1.2 invasion barrier | affine in ε | `(y−x)·A w = a + εb`; `(y−x)·A y = a + b` | true | none |
| 1.3 local superiority | `A = I`, `x = e₁`, `y = (1−t, t)`; counterexample matrix; ι empty; n = 1 | `1−t` vs `1−2t+2t²`: holds iff t < ½; `t²/2 > 0` for all t; both sides false; both true | true | none |
| 1.3 route | forward and backward | `y·Ay − x·Ay = s(a + s b)`; `(w−x)·A w = ε(a + εb)` | true | none |
| 1.4 interior criterion | RPS (w,ℓ) = (2,1), (1,1), (1,2); `[[1,5,0],[0,1,5],[5,0,4]]`; hawk–dove; n = 1 | form at `(1,−1,0)`: −1, 0, 1; det 7, 0, −7; `A x = 43/18` each; `z·Az = 3z₁z₂`; eigenvalues `−0.1111 ± 1.2423i` | true | none |
| 1.5 global superiority, uniqueness | RPS centre; `A = I` boundary ESS | `(w−ℓ)(Σy²/2 − 1/6) = ½(w−ℓ)Σ(yᵢ−⅓)²`; `e₁·A e₂ = 0 < 1` | true | none |
| 2.1 replicator field | sum; column shift; n = 2; RPS w = ℓ | `Σ fᵢ = m(1−s)`; shift changes `(Ax)ᵢ` by `c xⱼ`, `m` by `c xⱼ s`; `p(1−p)((Ax)₁−(Ax)₂)`; product drift `1.2·10⁻¹⁵` to t = 100 | true | none |
| 2.2 forward solutions | against supplier | identical body to LyapunovStabilityOfODEs 1.1 at its head | agrees | none |
| 2.3 invariance | edge `x₂ = 0`; shifted hawk–dove off the simplex; ι empty | `p' = p(1−p)(5p−4)`, limit `e₃`; `s − 1 = 0.1515` at t = ½ from 0.001 | true | none |
| 2.4 global solutions | n = 1; `A = I`, n = 2; gluing at 0 | field 0 at `{1}`; `p' = p(1−p)(2p−1)`; both one-sided derivatives equal `f(x)` | true | none |
| 3.1 stability within a set | `S = univ`; point at distance ≥ 1; shifted hawk–dove | Lean body equals supplier's 1.2, 1.3 with `x ∈ univ`; vacuous for δ ≤ 1; `u' = −m u`, `m ≈ −9.5` | true | none |
| 3.2 Nash ⇒ rest point | `[[0,1,0],[0,0,2],[0,0,1]]` | `A e₂ = (1,0,0)`, `A e₃ = (0,2,1)`: only `e₁` Nash, all supports checked | true | none |
| 3.3 stable ⇒ Nash | `A = I`, `(½,½)`; x outside simplex | `γⱼ ≥ yⱼ e^{ct}` exceeds 1; hypothesis `x ∈ simplex` present in Lean | true | none |
| 3.4 interior limit ⇒ Nash | RPS w = 1, ℓ = 2 from `(0.3, 0.33, 0.37)`; start at `e₂` | min coordinate `10⁻¹³⁹`, max `1 − 10⁻⁴⁶` on [200, 400]; constant solution | true | none |
| 4.1 ESS ⇒ asymptotically stable | `A = I`, n = 3; `[[0,0],[0,−1]]`; n = 1; n ≥ 2 sphere nonempty | `−(0.6 − 0.46) = −0.14`; `y₂(1000) = 0.001003`; `dist(x, e_k) ≥ ½ > ε' ≤ ¼` | true | none |
| 4.2 interior ESS attracts | RPS (2,1) from `(0.05, 0.05, 0.9)`; `A = I` from `(¼, ¾)` | distance `3·10⁻¹⁵` at t = 400; tends to `e₂`; bound `zᵢ ≥ xᵢ exp(−(H(y)+n)/xᵢ)` rederived | true | none |
| 5.1 mean payoff monotone | `[[1,2,0],[2,0,3],[0,3,−1]]`; RPS (1,2) | derivative 0.0462469 vs 0.0462469; limit `(⅔, ⅓, 0)`, `Ay = (4/3, 4/3, 1)`; 1893 increases, 1106 decreases | true | none |
| 5.2 convergence to rest points | `A = I` from `(0.4, 0.4, 0.2)`; RPS w = ℓ; ι empty | limit `(½, ½, 0)`; kernel of `A` is `(1,1,1)`, no edge rest point; hypothesis false | true | none |
| C01 scope sentence | PotentialGamesAndPriceOfAnarchy scope at its head | excludes "mixed strategies in potential games" and dynamics; no exclusion of the replicator equation | misattributed | reword |

- Source locators checked against the text: 24 (HofbauerSigmund2003 lines 132, 146, 154–165, 166–171, 175–191, 218, 248–259, 349–351, 359–367; Miekisz2007 lines 333, 347, 349, 350, 375–381; Prazak2022 lines 88–97, 119–122, 123–126, 127–138, 139–148, 165–166).
- Library declarations opened at the pin: 27 Mathlib names of the supplier contracts, each found in the file named (for example `Convexity.StdSimplex.range_toFun_comp_weights` at `Mathlib/Geometry/Convex/ConvexSpace/Defs.lean:111`, `ODE_solution_unique_of_mem_Icc_left` at `Mathlib/Analysis/ODE/ExistUnique.lean:209`, `HasFDerivAt.comp_hasDerivWithinAt` at `Mathlib/Analysis/Calculus/Deriv/Comp.lean:364`); Tau Ceti `Flow.exists_tendsto_atTop_of_antitone` at `TauCeti/Dynamics/Flow/Lyapunov.lean:124`, hypotheses as the README describes. No replicator field, ESS or Nash notion in either library.
- Cross-roadmap citations resolved: RegretMinimizationAndEquilibria Conventions and 3.1 (on main); LyapunovStabilityOfODEs 1.1, 1.2, 1.3, 3.1, 3.2, 3.3 and PopulationDynamics 2.1 (open heads). All say what is cited; the copied bodies of `simplex` and `forwardSolutions` are identical and sit in this roadmap's namespace.
- Dependency check: `depcheck: 171 roadmaps, 1988 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `TauCetiRoadmap/EvolutionaryGameTheory/Suggested.lean` gives 12 `sorry` warnings and nothing else; single `import Mathlib`, no `set_option`, every definition has a body. The 19 elaborated types were compared with the README statements: no binder lost, generality equal.
- One-tactic probe on a scratch copy (`rfl`, `simp` with the roadmap's definitions unfolded, `aesop`, `positivity`, `infer_instance`): none of the 12 theorems closes.
- Headline theorems (1.3, 1.4, 1.5, 2.3, 2.4, 3.2, 3.3, 3.4, 4.1, 4.2, 5.1, 5.2) are all stated; none is forced through a stand-in.
- No change outside the roadmap folder; the description's counts (12 theorems, 7 definitions) and its two dependencies match the head.

Overlap check: read LyapunovStabilityOfODEs, PopulationDynamics, PotentialGamesAndPriceOfAnarchy, RegretMinimizationAndEquilibria (scope and cited sections), and searched ExtensiveFormGames and KakutaniFixedPointAndContinuousGames for the objects; `simplex` is owned by RegretMinimizationAndEquilibria and forward solutions by LyapunovStabilityOfODEs (both cited, copied only because a roadmap module cannot be imported); stability relative to a set, symmetric Nash equilibria, ESS and the replicator equation are owned here and appear nowhere else.

Source independence: 30 passages compared with 3 sources (HofbauerSigmund2003, Miekisz2007, Prazak2022), none shared beyond formulas; largest share van Strien, 20 of 54 layer locators, whose text and table of contents could not be read; contents compared with HofbauerSigmund2003 (18 of 54): independent (Layer 1 ↔ §2.1 and §2.6, Layer 2 ↔ §2.2, Layer 3 ↔ §2.3, Layer 4 ↔ §2.6, Layer 5 ↔ none).

Research link: Layers 3 and 4 are the folk theorem and the theorem of Hofbauer, Schuster and Sigmund (1979) that an ESS is asymptotically stable, as stated in Hofbauer and Sigmund (2003, §2.3 and Theorem 7), where they are the starting point for permanence and other game dynamics; rests on HofbauerSigmund2003 lines 175–191 and 359–367.

## Not verifiable

- Every van Strien locator (equations (1.1)–(1.3), (1.6), Lemmas 1.1–1.4, Theorem 1.1, Examples 1.1, 1.3, 1.4, 1.7, 1.10), and the README's remark in 3.3 on what the proof of Lemma 1.4 (3) concludes: the notes are on the author's Imperial College page, but the sources service did not accept that address as an author's page, so the text was not read.
- Every Sandholm locator (§VII.4 with equation (18), §VII.5.1, Table II): same reason, for the copy on the author's University of Wisconsin page. Consequently 1.4 and 5.2 have no locator checked against a text; both statements were verified mathematically.
- The wording of the routes of 1.3, 4.1 and 4.2, which the README says follow van Strien's proofs, was not compared with those proofs.

## Source issues

- **Error** in Prazak2022 at the example after Theorem 7.4, p. 3: the source says the interior equilibrium is not an ESS because the third pure strategy earns more than the mean there; it should be that all three earn 43/18 and the form `3 z₁ z₂` is indefinite on sum-zero vectors; affects nothing.
- **Misprint** in Prazak2022 at Theorem 7.5, p. 4: the source says the derivative of the mean payoff is nonnegative with inequality exactly at stationary points; it should be equality exactly at stationary points; affects nothing.

## For the human reviewers

- **Not tested.** van Strien's lecture notes carry the largest share of the locators (20 of 54) and are the stated source of the routes of 1.3, 4.1 and 4.2; their text and contents page were not read, so wording and arrangement were not checked against them.
- **Licence.** Two sources are unpublished lecture notes on course pages (van Strien, 2024; Pražák, 2022) and one is a survey draft on its author's page (Sandholm, 2007); the hosts of the van Strien and Sandholm copies could not be classified.
