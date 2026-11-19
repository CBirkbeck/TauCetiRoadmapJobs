# Review of OnlineConvexOptimization (pull request #2570 at 806dd2c)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every theorem, route and Check was recomputed (degenerate cases, junk values, both directions of each equality case) and every source locator was read in the text; nothing stated is false or unsupported, the thirteen statements of `Suggested.lean` elaborate with `sorry` as the only warning, and none closes in one tactic. There is one small correction (positivity hypotheses that three statements do not need) and two format notes, none blocking. Two facts about the sources are left for the human reviewers.

## C01 — The tuned and the non-increasing-step bounds of Layer 2 hold without `T ≥ 1`, `D > 0` and `G > 0`

The Conventions say each statement "carries the hypotheses that keep it away from these values or is true at them"; three statements carry hypotheses of the first kind although they are true at the junk values, so a caller with `T = 0` or a one-point set must split cases for nothing.

- `regret_ogd_le_of_antitone` (2.2, `hT`): at `T = 0` the regret is the empty sum `0` and the right side is `D² / (2 η 0) ≥ 0`.
- `regret_ogd_le_mul_sqrt` (2.1, `hT`, `hD`, `hG`): at `T = 0` the step is `D / (G · 0) = 0` and both sides are `0`. At `D = 0`, `‖u − x₀‖ ≤ 0` gives `x₀ = u ∈ K`, the step is `0`, every iterate is `x₀`, and the regret is `0 ≤ 0`. At `G = 0`, every `g t = 0`, the subgradient hypothesis says each iterate minimizes `f t` over `K`, and the regret is `≤ 0`. `D < 0` and `G < 0` contradict `‖u − x₀‖ ≤ D` and `‖g 0‖ ≤ G`.
- `regret_ogd_le_three_halves` (2.2, `hD0`, `hG`): at `D = 0`, `K = {x₀}`, the step is `0`, and the regret against `u = x₀` is `0`; `G = 0` is as above.

The hypotheses could be weakened to `0 ≤ D`, `0 ≤ G` (or dropped) and `hT` dropped, in the README sentences of 2.1 and 2.2 and in the three signatures; or they could stay, with a clause in the Checks saying the statements remain true at these values.

## N01 — "on main" and "an open roadmap, not on main" will go stale

The Scope section (lines 651 and 666 of the README) and the module docstring of `Suggested.lean` (line 18) describe other roadmaps by their repository state ("roadmaps on main", "FirstOrderOptimization (an open roadmap, not on main)"). Naming the roadmap and its section is enough and stays true after the merges.

## N02 — No Check of 3.1 has `η ≠ 1`, so none tells the objective `ψ + η ∑ g` from `η ψ + ∑ g`

A Check that would: `ψ y = y² / 2` on `K = ℝ`, `η = 2`, `g 0 = g 1 = 1`, `T = 2`, `u = −4`. Then `x 0 = 0`, `x 1 = −2`, the regret is `4 + 2 = 6` and the bound is `8/2 + (2/2) · 2 = 6`, an equality; with the regularizer scaled the other way `x 1 = −1/2` and the regret is `7.5 > 6`.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 regret, linearization | `f=\|y−1\|, x=0, u=1, T=3`; `f=y², x=1, g=2, m=2, u=0` | regret `3` (reversed `−3`); per round regret `1`, bound `2·1−1=1` | holds, equality |
| 1.2 `metricProj_mem_and_sq_norm_sub_add_le` | `K=[−1,1], y=3`; axis in `ℝ²`; `K={−1,1}`; `K=(0,1]` | `4+4≤16`, `0+4=4`; `4+4=8`; `4.64>1.44`; projection `0∉K` | holds; both hypotheses needed |
| 2.1 `regret_ogd_le` | `K=[−1,1], x₀=0, g=1, η=1, u=−1`; `x₀=2∉K=[0,1]`; `η=0`; `T=0` | `1=1/2+1/2`; `2≤5/2`; right side `0`, regret `T`; `0≤‖u−x₀‖²/(2η)` | holds; `η>0` needed |
| 2.1 `regret_ogd_le_mul_sqrt` | `D=G=T=1`; `T=0`; `D=0`; `G=0` | each term `DG√T/2`; `1=1`; `0≤0` in the three junk cases | holds; see C01 |
| 2.2 `regret_ogd_le_of_antitone` | `K={0}, x₀=1`; `η=(1/10,100)` on `[−1,1]`; `T=0` | regret `1`, bound `1/2`; regret `2`, bound `0.07`; `0≤D²/(2η 0)` | holds; `x₀∈K`, antitone needed; see C01 |
| 2.2 `regret_ogd_le_three_halves` | general `T`; `T=0`; Zinkevich steps | `DG√T/2+(DG/2)(2√T−1)≤(3/2)DG√T`; `0≤0`; `D²√T/2+G²(√T−1/2)` | holds |
| 2.3 `regret_ogd_le_of_strongConvex` | `f=(y−1)²/2` on `[−1,1]`, `x₀=0` and `x₀=3` | `1/(2η t)−μ t/2=1/(2η(t−1))`; regret `1/2`, bound `1/2`; regret `2`, bound `2` | holds, equality |
| 2.3 `regret_ogd_le_log` | `T=0`; `G<0` | `0≤G²/(2α)` since `log 0=0`; hypothesis `‖g 0‖≤G` empty | holds |
| 3.1 `regret_le_of_isFTRL` | `ψ=y²/2, η=1, g=1, u=−1`; `η=2, T=2, u=−4`; `ψ=0` | `1=1/2+1/2`; `6=4+2`; follow-the-leader regret `T−1/2` | holds; strong convexity needed |
| 3.2 `hedge_play_neg_isMinOn_entropicObjective` | `c=(log 2,0)`; payoffs `+g`; `t=0`; `n=1`; `q=(1,0)` | `p=(1/3,2/3)`, value `−log(3/2)≈−0.405`; `−0.174`; `−log n`; `η∑g`; `log 2` | holds; sign pinned |
| 4.1 `bregmanDiv`, three-point identity | `ψ=‖·‖²/2`; entropy, `u=(1,0), v=(1/2,1/2)`; `ψ=\|·\|` at `0` | `‖u−v‖²/2` (derivative at `u`: `−‖u−v‖²/2`); `log 2`; `\|u\|`; identity expands to `0=0` | holds |
| 4.2 `regret_le_of_isMirrorDescent` | entropic, `x₀=(1/2,1/2), g=(1,0), u=(0,1)`; `ψ=y²/2+\|y−1\|+2y, x₀=1` | `x₁=(1/(1+e),e/(1+e))`, `1/2≤log 2+1/2`; `x₁=−1`, regret `1`, bound `−1` | holds; differentiability needed |
| 5.1 `integral_risk_weightedAverage_le` | `T=1`; `x t=ξ t` on `[−1,1]`; `T=0` on `[1,2]` | both sides `∫F(x 0)`; left `1`, right `1−1=0`; left `0`, right `−1` | holds; independence, `T≥1` needed |
| 6.1 `sqrt_half_le_mean_abs_sum_signs` | `T=0..6`; induction step; fourth-moment bound at `T=3` | `0,1,1,3/2,3/2,15/8,15/8`; `(2m+1)²≥4m(m+1)`; `1.134<1.225` | holds, equality at `T=2` |
| 6.2 `exists_regret_ge` | `ℝ, v=1, w=−1, L=1, T=2`, strategy `x₁=−g₀`; `v=w`; `T=0` | bound `1`; `max(−ab+\|a+b\|)=1` on `[−1,1]²`; `0≤0` with `g=0` | holds, attained |
| Layer 6 Examples, minimax on `[−1,1]` | potential `V(s,n)=E\|s+S_n\|`, play `(V(s−1)−V(s+1))/2` | both adversary moves give `V(s,n)`; value `E\|S_T\|` | true |

- Source locators checked against the text: 37 of 37 (Orabona 25, Hazan 8, Bubeck 3, Zinkevich 1), e.g. Orabona lines 979, 1001, 1353, 1561, 2240, 2298, 3114, 4189, 4213, 4234, 4325, 4352, 4981, 5023, 6208, 6281, 6305, 17902; Hazan lines 482, 1032, 1770, 1873, 1970, 2832, 2906, 3120; Bubeck lines 1114, 2232, 2295; Zinkevich line 276.
- Library declarations opened at the pins: 34 in Mathlib (e.g. `Analysis/InnerProductSpace/Projection/Minimal.lean` 40 and 145, `Analysis/Convex/Strong.lean` 87 and 135, `Analysis/Calculus/LocalExtr/Basic.lean` 92 and 143, `Probability/Independence/Basic.lean` 370 and 702, `NumberTheory/Harmonic/Bounds.lean` 34, `Data/Nat/Choose/Central.lean` 80) and 5 in Tau Ceti (`Analysis/Convex/Strong.lean` 45, `Analysis/Convex/Subdifferential.lean` 89 and 151, `InformationTheory/KullbackLeibler/Variational.lean` 76 and 88, `Tilted.lean` 72); all exist with the stated content.
- Cross-roadmap citations resolved: 6 (RegretMinimizationAndEquilibria Conventions, 1.1, 1.2 and its scope line 55; MathematicalStatisticsNonparametric 6.5; NoncommutativeIntegration 6.3); the five restated definitions have bodies identical to their owners'.
- Duplication by object: no regret, Bregman divergence, online gradient descent, mirror descent or metric-projection inequality in Mathlib or Tau Ceti at the pins, nor owned by another roadmap on main or open.
- Elaboration: exit 0, 13 `sorry` warnings and nothing else; the 24 elaborated types were compared with the README (the four section binders reported as dropped are `[Fintype ι]`, `[Nonempty ι]` on definitions that do not use them; the theorem keeps both).
- One-tactic probe (`simp` with the definitions unfolded, then `rfl`): 0 of 13 theorems close.
- Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no UPWARD or CYCLE line. All suppliers are on main.
- Automatic checks: all passed; none set aside. The pull request's title and description agree with the head (13 theorems, 11 definitions, single import, suppliers as stated).

Overlap check: read FirstOrderOptimization, RegretMinimizationAndEquilibria, MultiArmedBandits, ConvexAnalysisAndDuality, StatisticalLearningTheory, OptimalTransport, VariationalMethods; shared objects: `simplex`, `OnlineAlgorithm`, `hedge` and Hedge's regret bound (owner RegretMinimizationAndEquilibria), `metricProj` (owner MathematicalStatisticsNonparametric 6.5), both cited; nothing else shared.

Source independence: 16 passages compared with 4 sources, none shared; largest share Orabona, 25 of 37 locators; contents compared with Orabona: independent (Layer 1 ↔ Ch. 1–2, Layer 2 ↔ Ch. 2 and §4.1, Layer 3 ↔ Ch. 7, Layer 4 ↔ Ch. 6, Layer 5 ↔ Ch. 3, Layer 6 ↔ Ch. 5: not in the source's order, and Layer 2 merges two chapters).

Research link: the headline targets are the regret bounds of Zinkevich 2003 (online gradient descent), Hazan and coauthors 2006–2007 (logarithmic regret, per Orabona line 3019), mirror descent after Chen–Teboulle 1993, and the online-to-batch conversion that Cesa-Bianchi–Conconi–Gentile 2004 refine; rests on the README's references and Orabona.

## Not verifiable

- The attribution of the sharp `p = 1` Khintchine constant to Szarek (6.1): no primary text opened; Orabona line 17902 and following credits Haagerup 1981 for the constants only.
- The attribution of the high-probability online-to-batch conversion to Cesa-Bianchi, Conconi and Gentile (Scope, References): made in prose without a locator; the paper was not opened.

## Source issues

- none

## For the human reviewers

- **Scope.** The source with the largest share of the locators (25 of 37), Orabona, is cited as an arXiv monograph (version 10, June 2026) with no publisher; the other three are published (Hazan, Bubeck, Zinkevich ICML 2003).
- **Licence.** Zinkevich 2003 was read from the copy on the AAAI digital library host that the README names; its host class was set by hand, not recognised automatically.
