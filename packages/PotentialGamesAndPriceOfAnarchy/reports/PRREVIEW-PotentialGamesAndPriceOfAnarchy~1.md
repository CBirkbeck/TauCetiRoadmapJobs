# Review of PotentialGamesAndPriceOfAnarchy (pull request #2717 at ceb07d8)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every stated theorem was re-derived under the Lean definitions as elaborated, every Check with a definite value was recomputed, and every locator into the three Roughgarden texts was read at its place; nothing false, vacuous or unsupported was found. There are two small corrections (an attribution in one docstring, and affine hypotheses asked on a larger domain than the Conventions say matters) and three format notes, none blocking. For the human reviewers: the seven primary papers were not consulted by the author and the Layer 1 theorems carry no locator.

## C01 — The docstring of `CongestionGame.isSmooth_of_affine` attributes `(5/3, 1/3)`-smoothness to Christodoulou–Koutsoupias and Awerbuch–Azar–Epstein, who do not state it

A reader of `Suggested.lean` (the docstring of 4.1, line 188) is sent to the 2005 papers for a statement about smooth games, a notion introduced later. The README's own 4.1 has it right: Christodoulou and Koutsoupias for the inequality `3y(z+1) ≤ 5y² + z²`, Roughgarden 2015, Example 2.5, for the smoothness statement; that is also what the source says (roughgarden-robust-2015 lines 269–272: the smoothness claim is the paper's own, the inequality is credited to Lemma 1 of the earlier paper). The smallest change is to make the docstring read as the README does, for instance "Roughgarden (Example 2.5), using an inequality of Christodoulou–Koutsoupias".

## C02 — The affine hypotheses are asked at every real load and at load `0`, although the Conventions say only `[0, ∞)` and loads `1, …, |N|` matter

In `Suggested.lean` the hypothesis of 5.4 is `∀ e x, G.latency e x = α e * x + β e` (line 293) and that of 4.1 and 4.2 is `∀ e k, G.resourceCost e k = α e * k + β e` (lines 191, 199, 209). A latency that is affine on `[0, ∞)` and defined otherwise below `0` (say `fun x ↦ α * max x 0 + β`), or a resource cost with a conventional value at load `0`, does not satisfy them, so the theorems cannot be applied to it, while 5.2 and 5.3 are careful to ask continuity and monotonicity on `Set.Ici 0` only. Both proofs use less: in 5.4 the route evaluates latencies only at loads of feasible flows, which are nonnegative; in 4.1 a resource cost is evaluated at `load a e + 1 ≥ 1`, and in the social cost formula at `load e`, multiplied by `load e`. The statements would match the Conventions as `∀ e, ∀ x ≥ 0, …` and `∀ e, ∀ k ≥ 1, …` (README sentences of 4.1, 4.2 and 5.4 adjusted with "for `x ≥ 0`" and "for `k ≥ 1`"). Offered, not required: the present statements are true.

## N01 — Seven Checks report a past random experiment rather than something a reader can evaluate

The last Checks of 1.2, 1.3, 2.1, 4.1, 4.2, 5.3 and 5.4 ("On 3000 random games …", "the largest ratio met was `9/7`") name no instance and no value that can be recomputed, so they test nothing for an implementer. Each could be dropped, or replaced by one definite instance with its value.

## N02 — Three sentences describe the state of the project or of the drafting

"open roadmaps not on main" (Scope and ownership, line 607) and "they were not consulted, and no locator is given for them" (References, lines 681–683) will be out of date or unclear to a later reader; "CooperativeGames and PopulationDynamics have no statement in common with this one" and "attributed as the sources above attribute them" say the same timelessly.

## N03 — Small mismatches of wording and labels

In the prisoner's dilemma Check of 1.1 (line 122) "the two mixed profiles" means the two profiles in which exactly one player defects; "mixed" reads as mixed strategies. In `Suggested.lean` the docstring of `NonatomicGame.totalLatency` is labelled 5.4 while the README defines it in 5.1, and the section comments of Layers 3, 4 and 5 carry longer titles than the README headings.

## Questions for the author

- Would the Layer 1 targets carry locators into Monderer and Shapley, *Potential games*, Games and Economic Behavior 14 (1996)? From memory the existence of a pure equilibrium is its Corollary 2.2, the finite improvement property against generalized ordinal potentials its Lemma 2.5, uniqueness up to a constant its Lemma 2.7 and the closed-path and four-cycle criterion its Theorem 2.8, but the paper is behind a paywall and I could not open it, so these numbers are unverified and are not asked for as a change. A paywalled published theorem may be cited by its locator alone.
- The overview attributes the four-cycle criterion to Monderer and Shapley for games with arbitrary strategy sets. I verified the statement itself (by the exchange argument of 1.3) but not that the paper states it in that generality, for the same reason.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 potentials, Checks | prisoner's dilemma; the two separating 2×2 games | PD: cost changes −1, −1 equal Φ changes 0→−1→−2; four-cycle `0, 2, 0, −1` total 1; indifferences force Φ constant yet Φ(2,1)<Φ(2,2) needed | holds | N03 wording |
| 1.2 `exists_isPureNash_of_isGeneralizedOrdinalPotential` | infinite `N` (finite-class/infinite-class game on `{0,1}^ℕ`); `A = ℕ`, cost `−n`; empty `N` | infinite `N`: no equilibrium, potential `∓Σ 2^(−i) a_i` exists; elaborated type keeps `[Fintype N]`, so excluded | holds | none |
| 1.2 `hasFiniteImprovementProperty_iff` | matching pennies; players `ℕ` with `Φ = Σ 2^(−i)[a i = 0]`; an empty `A i` | pennies: 4-cycle, each step cost 1→−1; reachability count drops strictly along a step (else a cycle); empty profile type: both sides true | holds | none |
| 1.3 `exists_isExactPotential_iff_closedPath` | empty path; one player `b₀→b₁→b₀`; empty `A i` | empty path 0 = 0; telescoping Φ(end)−Φ(start); path-independence from closed paths `p ++ r`, `q ++ r` | holds | none |
| 1.3 `exists_isExactPotential_iff_fourCycle` | matching pennies from (1,1); exchange of two consecutive deviations | pennies: `2+2+2+2 = 8 ≠ 0`; exchange difference equals the four-cycle sum term by term; Lean third and fourth terms return `i` then `j` | holds | none |
| 2.1 Rosenthal, `exists_isPureNash` | two players, `u` cost 2, `v` cost `k`; negative costs | Φ = 3, 3, 3, 4; social costs 3, 4, 4; equilibria (u,v), (v,u), (v,v); move S→S′ changes cost and Φ by `Σ c(n+1) − Σ c(n)` | holds | none |
| 3.1 smoothness and pure bound | one player, costs 0, 1; λ of any sign | `(1,0)`: `C(o) ≤ C(o)`; `(0,1/2)`: `0 ≤ 1/2` holds, `1 ≤ 0` fails; `(1−μ)·cost(a) ≤ λ·cost(o)` | holds | none |
| 3.2 `expectedSocialCost_le_of_isSmooth` | `μ = 1` one strategy cost 1; uniform on costs 0, 1; empty `N`; negative ε | `μ=1`: `1 > (0+0)/0 = 0`, excluded by `μ < 1`; uniform: `1/2 ≤ (0 + 1/2)/1`; empty `N`: `0 ≤ 0`; sign of `−C` gives `E C_i ≤ E C_i(b) + ε_i` | holds | none |
| 4.1 `isSmooth_of_affine` | `y, z < 60`; `y = 1/2, z = 0`; cost `−1` | equality only at (0,0), (1,1), (1,2) for `y, z < 6`; reals `3/2 > 5/4`; `β<0`: `−1 > −5/3` | holds | C01, C02 |
| 4.2 bound `5/2` (pure and coarse correlated) | three-player game, all 8 profiles; `β = −1`; `α = −2` | social costs 6, 13×3, 16×3, 15; equilibria only all-first and all-second; `15 = 5/3·6 + 1/3·15`; `−1 > −5/2`; `4 > 5/2·0` | holds | C02 |
| 5.1 Wardrop, variational inequality | Pigou; Braess; empty route set; demand 0 | Pigou: only `(0,1)`, totals 1 and 3/4; Braess: `L₃−L₁ = −a`, `L₃−L₂ = −b`, total 2 vs 3/2; VI: `Σ_p g·L ≥ d·L = Σ_p f·L` | holds | none |
| 5.2 `isWardrop_of_isMinOn`, `isMinOn_of_isWardrop`, `exists_isWardrop` | step latency (`x`, then 2 from 1); latencies 1 and `2−2x` | step: potential `1−t+t²/2` minimal at `t=1`, not Wardrop (2 > 1); decreasing: potentials 1, 5/4, 1 at three equilibria | holds | none |
| 5.3 `latency_load_eq_of_isWardrop` | latencies 1 and `2−2x`; two constant routes; the thesis's B.1.2 network | non-monotone: latencies 2, 1, 0 and totals 1, 1, 0; B.1.2 flows: route used at latency 1 against 0, and 1 against 1/2, so not Wardrop | holds | none |
| 5.4 `totalLatency_le_of_affine` | Pigou; Braess; latency `−1`; latency `2−2x` | `α(xy−y²−x²/4) = −α(y−x/2)² ≤ 0`; 1 vs 3/4; 2 vs 3/2; `−1 > −4/3`; `1 > 4/3·0` | holds | C02 |
| Supplier definitions `simplex`, `IsCoarseCorrelatedEq` | compared with RegretMinimizationAndEquilibria on main | bodies identical to that roadmap's `Suggested.lean` lines 33–34 and 262–264; the copy writes the `Fintype (A i)` binder explicitly | agrees | none |

- Source locators checked against the text: 29 (roughgarden-robust-2015: Definition 2.1 line 171, (3)–(5) lines 185–197, Example 2.5 lines 258–299, (15) line 549, Theorem 3.2 lines 579–610, (23) line 619, (25) line 653, Example 4.11 lines 908–916; roughgarden-thesis-2002: Definition 2.2.1 line 823, Propositions 2.2.2 and 2.2.4 lines 837, 853, Proposition 2.5.1 line 1147, Remark 2.5.2 line 1184, Corollary 2.5.3 line 1229, Theorem 3.2.6 line 1662, Propositions B.1.1 and B.1.2 lines 5403, 5421; the four lecture notes: L11 Theorem 3.3 line 239, Section 4 line 242, (5) line 335; L12 Theorem 2.1 line 258; L13 Theorem 1.1 line 24, Section 2 lines 81–109; L14 Definition 3.1 line 211, Theorem 4.2 line 271).
- Library declarations opened at the pin: 11 (`Finite.exists_min` Data/Fintype/Lattice.lean:59; `Finite.wellFounded_of_trans_of_irrefl` Data/Fintype/Card.lean:436; `Convexity.StdSimplex` and `range_toFun_comp_weights` Geometry/Convex/ConvexSpace/Defs.lean:61, 111; `integral_hasDerivWithinAt_right` FundThmCalculus.lean:867; `continuousOn_primitive_interval` DominatedConvergence.lean:484; `integral_interval_sub_left`, `integral_mono_on`, `MonotoneOn.intervalIntegrable` IntervalIntegral/Basic.lean:1117, 1427, 527; `IsCompact.exists_isMinOn` Topology/Order/Compact.lean:255; `Metric.isCompact_of_isClosed_isBounded` Topology/MetricSpace/Bounded.lean:320). No strategic game, potential, congestion game or Wardrop equilibrium exists in Mathlib or Tau Ceti at the pins (the only "Nash" modules are Nash functions in real algebraic geometry).
- Cross-roadmap citations resolved: RegretMinimizationAndEquilibria on main, Conventions, 3.1, 3.2 and 3.3 (the product-distribution and no-regret statements are there as cited; its scope line excludes potential and congestion games); GraphConnectivityAndFlows and MathematicalStatisticsFoundations 7.2 on main; CooperativeGames and PopulationDynamics at their open heads.
- Dependency check output: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with 15 `sorry` warnings and nothing else; `#check @name` types read for all 37 declarations against the README (every theorem keeps `[Fintype N]`, resp. `[Fintype K]`, `[∀ k, Fintype (P k)]`, `[Fintype E]`; the definitions drop only binders their bodies do not use); nothing changed.
- One-tactic probe on a copy: `rfl`, `simp`, `infer_instance` and `simp` with the definitions unfolded close none of the 15 theorems.
- Headline theorems (Monderer–Shapley existence, improvement property, closed paths, four-cycles; Rosenthal and existence; smoothness extension; `(5/3, 1/3)`-smoothness and the two `5/2` bounds; the three Beckmann statements; uniqueness of latencies; `4/3`): all 15 stated; none declared not statable.
- The automatic checks all passed on this head; the pull request changes nothing outside the folder; title and description agree with the head (15 theorems, 20 definitions, 2 structures counted).

Overlap check: read RegretMinimizationAndEquilibria (main and its open revision of section order), CooperativeGames, OnlineConvexOptimization, ApproximationGuarantees, StableMatching (searched for pure Nash equilibria, potentials, congestion games, Wardrop equilibria, smoothness); nothing shared. Coarse correlated equilibria and the simplex are owned by RegretMinimizationAndEquilibria and cited, the two definitions being copied only so that the Lean file can state 3.2 and 4.2.

Source independence: 15 passages compared with 6 texts of 3 works, none shared (the route of 4.1 follows the same inequalities as roughgarden-robust-2015 Example 2.5, which the mathematics forces, in different words; the route of 5.4 differs from the thesis's proof); largest share roughgarden-thesis-2002, 14 of 32 locators; contents compared with roughgarden-thesis-2002 (chapters 1–7, appendices A, B): independent, Layers 1–4 have no counterpart there and Layer 5 draws on its Sections 2.2, 2.5, 3.2 and B.1 only.

Research link: The headline targets are the theorems of Monderer–Shapley (1996), Rosenthal (1973), Beckmann–McGuire–Winsten (1956), Roughgarden–Tardos (2002), Awerbuch–Azar–Epstein and Christodoulou–Koutsoupias (2005), and Roughgarden's smoothness extension theorem (J. ACM 2015), on which later price-of-anarchy work builds; rests on the README's references and on roughgarden-robust-2015 Sections 2–3, which I read.

## Not verifiable

- Monderer and Shapley 1996 (Layer 1 attributions, the generality of the four-cycle criterion): paywalled, not opened; the statements themselves were verified by proof.
- Wardrop 1952, Beckmann–McGuire–Winsten 1956, Rosenthal 1973, Roughgarden–Tardos 2002, Awerbuch–Azar–Epstein 2005, Christodoulou–Koutsoupias 2005: cited without locators and not opened; the attributions were checked only as the three Roughgarden texts give them.
- The seven Checks that report random experiments (N01): no instance is given to recompute.
- Ownership against packages under review that are not yet roadmap pull requests was checked by name only (two such packages, neither on this subject).

## Source issues

- none

## For the human reviewers

- **Scope/sources.** The README's References say the seven primary papers "were not consulted"; all locators are into three texts by one author (a J. ACM paper's author version, a PhD thesis, lecture notes), read on that author's page. Layer 1 theorems have no locator.
- **Licence.** The CS364A lecture notes carry the line "provided for personal use only" (roughgarden-cs364a-l13 line 30); the roadmap cites them by locator and I found no shared wording.
