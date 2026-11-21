# Review of RepeatedGamesAndBargaining (pull request #2939 at 3bfe3dd)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every stated theorem, definition and Check was recomputed (the Nash point and the axioms on the stated polygons, Rubinstein's shares and the sup–inf uniqueness route for pure profiles, the minmax values, the folk-theorem routes, the discounted cycle values) and every source locator was read at its place in Karlin–Peres and in Manea's two sets of slides; all agree with the text. There are no small corrections and one format note, not blocking. Three questions are left to the human reviewers (the sources are a textbook and lecture slides, three routes are the roadmap's own, and the licences of the copies read).

## N01 — The grim-trigger Check of 5.1 does not say which discount factors it ranges over

In the second Check of 5.1 (README line 478), "is subgame perfect exactly when `δ ≥ 1/3`" is meant for `0 ≤ δ < 1`, as in the Check before it; for `δ ≥ 1` the series in `discountedPayoff` is not summable and the comparison `(1 − δ) 4 + δ ≤ 3` is no longer what the definition computes. Adding "for `δ` in `[0, 1)`" would say so.

## Verified sound

| Target | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 bargaining problem, Nash point, `existsUnique_isNashPoint` | triangle `(0,0),(4,0),(0,2)`; segment; open triangle; three points | max of `x₁(2 − x₁/2)` at `x₁ = 2`, product `2`; segment: all products `0`; sup `1` not attained; products `2, 2` | each hypothesis needed; Checks true |
| 1.1 uniqueness route | two maximizers `a ≠ b`, `d = 0` | midpoint product `(2α + a₁b₂ + b₁a₂)/4 > α` unless `a₁b₂ = b₁a₂`, then `a = b` | sound |
| 1.2 `nash_bargaining` (→) | `Ψ '' S` against triangle `T = (0,0),(2,0),(0,2)` | `φ′(0) = x₁ + x₂ − 2 ≤ 0`; `x ≥ 0` from `d ≤ x`; `F T 0 = (c,c)`, `c ≤ 1`, Pareto gives `(1,1)` | sound; uses "every point ≥ d" |
| 1.2 (←) four axioms for the Nash point | scaling by `α`; `a′ ≥ a ≠ a′`; swap; subset | products scale by `α₁α₂ > 0`; product strictly larger since `a > d`; swap is a maximizer | sound |
| 1.2 covariance and IIA Checks | `α = (2,3)`, `β = (1,−1)`; quadrilateral | vertices `(1,−1),(9,−1),(1,5)`, Nash point `(5,2)`; quadrilateral inside triangle, contains `(2,1)` | true |
| 1.2 lexicographic and leximin rules | `T`; triangle of 1.1 and its image | lexicographic picks `(2,0)` vs `(1,1)`; leximin `(4/3,4/3) ↦ (11/3,3)` vs `(31/7,17/7)` (`t·7/24 = 1`); equal gains `(1,1)` dominated by `(2,1)` | true; each drops one axiom |
| 2.1 game, continuity at infinity | plays agreeing before stage `2K` | same first acceptance if `< K`, else both payoffs in `[0, δ_i^K]` | holds for `δ ∈ [0,1)²`; matches supplier's definition |
| 2.2 shares and `isStageSubgamePerfect_rubinsteinProfile` | `δ = (1/2,1/2), (9/10,1/2), (1/3,2/3), (0,0)`; `δ₁ = −1/2` | `2/3` and `1/3`; `10/11`; `3/7`; `1 − x*₀ = δ₁x*₁`; deviation `δ_p²x*_p ≤ x*_p`; negative: `6/5`, `3/5`, `11/40 > 1/4` | true; nonnegativity needed |
| 2.2 ties Check | responder rejects `2/3` at `δ = (1/2,1/2)` | proposer gets `y < 2/3` or `1/6`; no best offer | true |
| 2.3 `acceptedAt_and_offerAt_of_isStageSubgamePerfect` | sup `M_p`, inf `m_p` over open histories | `m_p ≥ 1 − δ_rM_r`; `M_p ≤ 1 − δ_rm_r`; gap `(1−δ_p) − m_r(δ_r−δ_p) ≥ 0`; `M₀ = m₀ = (1−δ₁)/(1−δ₀δ₁)`; odd offer `1 − x*₁ = δ₀x*₀` | sound for pure deviations only |
| 2.3 negative controls | `δ = (1/2,0)`; `δ = (1,1)` | modified profile subgame perfect, round-1 offer `1 ≠ 1/2`; constant-`c` profiles all equilibria, share `0/0 = 0` | both bounds on `δ` needed |
| 3.1 payoff polytope, `minmaxValue` | prisoner's dilemma; matching pennies; three-player game; one player | `1, 1`; `0` (pure: `1`); `4/9` at `p = q = 1/3` (values `4/9, 1/9, 4/9`), correlated `1/3`; one player: `max_b u` | true; independent mixing as in both sources |
| 3.2 `jointPMF`, `playLaw` | uniform × `(1/3,2/3)`; indexing of kernel `n` | masses `1/6,1/3,1/6,1/3`; kernel `n` reads stages `t₀..t₀+n`, history length `t₀+n+1` | matches README |
| 4.1 `IsAverageNash` | payoff `1` on `[2^k, 2^(k+1))`, `k` odd | averages at `2^(k+1)` tend to `2/3` (`k` odd) and `1/3` (`k` even) | Check true; definition matches source's two conditions |
| 4.2 `exists_isAverageNash_iff` | both directions; prisoner's dilemma cycle; matching pennies; `N` empty | averages `(10/3, 2)`; `(0,4)` excluded; only `(0,0)`; step `1/(t+1)` gives `(t+1)W_{t+1} = Σ_{s≤t} w_s` | sound; weak inequality suffices for Nash |
| 5.1 `discountedPayoff`, subgame perfection | constant profile; grim trigger | `u i a`; `4 − 3δ ≤ 3` iff `δ ≥ 1/3` | true |
| 5.2 `exists_isDiscountedSubgamePerfect` | cycle `(C,C),(C,C),(D,C)` at `δ = 3/4, 1/2`; mixed reversion; reordered cycle | `(120/37, 84/37)`; phase values of player `1`: `84/37, 75/37, 63/37` vs deviation `7/4`, `1`; `5/2 > 15/7`; `(2/3,2/3)`, `(5/3,4/3)`; `127/37` | true; approximate form justified |
| N01 grim-trigger range | `δ ≥ 1` | series not summable, junk value | format only |

- Source locators checked against the text: 12 in Karlin–Peres (Definitions 6.4.1, 6.4.7–6.4.9, Theorem 6.4.10, §6.4.3, (6.3), Definitions 12.4.2–12.4.4, Remark 12.4.5, Theorem 12.4.6, Notes p. 214; printed pages agree), 12 in Manea (bargaining slides 10, 11, 13, 14–18, 19, 20; repeated slides 3, 4, 6, 7, 14).
- Library declarations opened at the pin: 30 Mathlib names of the supplier contracts (for example `Kernel.trajMeasure`, `Mathlib/Probability/Kernel/IonescuTulcea/Traj.lean:763`; `Convex.integral_mem`, `Mathlib/Analysis/Convex/Integral.lean:56`; `MeasureTheory.Filtration.piLE`, `Mathlib/Probability/Process/Filtration.lean:490`) and `Kernel.ofPMF` with its Markov instance (`TauCeti/Probability/Kernel/PMF.lean:44, 50`); the pinned libraries have no bargaining problem, minmax value or folk theorem.
- Cross-roadmap citations resolved: ExtensiveFormGames 5.1 and 5.2 at its open head (the three copied declarations agree, `IsContinuousAtInfinity` and the pure one-shot principle are as cited); RegretMinimizationAndEquilibria Conventions and 3.1 on main (three copies agree, same variable line); MarkovDecisionProcesses 6.1 `ae_tendsto_zero_noise` and 1.1 on main; CooperativeGames and InfiniteGamesAndDeterminacy scope sentences.
- Dependency check: `depcheck: 170 roadmaps, 1975 edges, 0 problem(s)`; no UPWARD or CYCLE line. No supplier gap is declared.
- Elaboration: `Suggested.lean` elaborates with six `sorry` warnings and nothing else. The elaborated type of each of the 39 declarations was compared with its README statement: the six theorems keep every binder (including nonempty action sets); the definitions that drop section binders do not use them. Nothing changed.
- One-tactic probe on a copy of the file (`rfl`, `simp`, `infer_instance`, `simp` with the definitions unfolded, `aesop`, `exact?`): none of the six theorems closes. All four headline theorems are stated; nothing is padding.
- Pull request text read against the head: counts (6 theorems, 30 definitions, 3 abbreviations), imports, suppliers and the dependency on ExtensiveFormGames agree with the files.
- Automatic checks: all passed on this head.

Overlap check: read ExtensiveFormGames, PotentialGamesAndPriceOfAnarchy, EvolutionaryGameTheory, KakutaniFixedPointAndContinuousGames, FairDivision, RegretMinimizationAndEquilibria, MarkovDecisionProcesses; pure multi-stage profiles, plays and subgame perfection: owner ExtensiveFormGames (copied and cited); `simplex`, `expectedUtility`, `IsNash`: owner RegretMinimizationAndEquilibria (copied and cited); nothing else shared. Ownership was also searched by object across all open heads and main (bargaining, Rubinstein, repeated games, minmax value, payoff polytope, folk theorem): no second owner; the evolutionary folk theorem of EvolutionaryGameTheory is a different statement and is excluded in the scope.

Source independence: 17 passages compared with 3 sources (12 at the sampled locators, 5 further: the Conventions sentence on normalization, the routes of 1.2, 4.2 and 5.2, the docstring of `IsBargainingProblem`), none shared beyond formulas and standard names; largest share KarlinPeres, 12 of 24 locators; contents compared with KarlinPeres: independent (Layer 1 ↔ §12.4 and Layers 3–4 ↔ §6.4 in the reverse order of the book, Layers 2 and 5 not in it).

Research link: The headline targets are Nash's bargaining theorem (Nash 1950), Rubinstein's alternating-offers theorem (Rubinstein 1982), the folk theorem for average payoffs and Friedman's Nash-threat folk theorem (Friedman 1971), as attributed in the README's References through Karlin–Peres (2016) and Manea (2016); rests on the README and on those texts.

## Not verifiable

- none

## Source issues

- **Misprint** in KarlinPeres at Definition 6.4.9, p. 133: the source says the two displayed limits of averages sum the round payoffs from 1 to infinity under the factor 1/T; it should be from 1 to T, as in the upper-limit display; affects nothing.
- **Gap** in KarlinPeres at §6.4.3 (proof of Theorem 6.4.10), p. 133: the source says a per-round best reply, worth at least the minmax value in conditional expectation, refutes the equilibrium; it should be completed by a strong law for the realised averages; affects the proof.
- **Gap** in KarlinPeres at the proof of Theorem 12.4.6, p. 212: the source says the symmetry axiom applies to the convex hull of the set and its mirror image; it should first note that this hull is closed and bounded, hence a bargaining problem; affects the proof.

## For the human reviewers

- **Scope.** The only sources with locators are a textbook (KarlinPeres) and two sets of lecture slides (ManeaBargaining, ManeaRepeated); Nash 1950, Rubinstein 1982 and Friedman 1971 are attributed through them and not cited directly.
- **Scope.** Three routes are the roadmap's own and no opened text proves the statement as stated: uniqueness for pure profiles (2.3), the approximate Nash-threat theorem without public randomization (5.2), the triangle comparison in 1.2. I re-derived each.
- **Licence.** The KarlinPeres PDF on its author's page carries on every page a notice that it is licensed to the AMS with restrictions on redistribution; Manea's slides are CC BY-NC-SA 4.0. The README states their results in its own words.
