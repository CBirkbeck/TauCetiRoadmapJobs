# Review of CouplingFromThePast (pull request #2793 at aa8fbf5)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement, route and Check was recomputed (the compositions, the tails of both coalescence times, `d`, `d̄`, the mixing time, the laws of the backward and forward values, the height bound and its failure without monotonicity, all by exact enumeration), every locator into Levin–Peres was read at its page, and every supplier and library citation resolves. There are two small corrections, both about how two citations of Levin–Peres are worded, and no format note; one point is left to the human reviewers (the 1996 paper of Propp and Wilson could not be read).

## C01 — Example 22.8 of Levin–Peres gives the kernel of the walk on `{0, …, n}`, not the update that moves every state in the same direction

In the Examples of Layer 3 (`TauCetiRoadmap/CouplingFromThePast/README.md`, lines 345–347) the locator "(LPW, Example 22.8, p. 308)" follows the words "with the update that moves every state in the same direction", so a reader looks there for the update. Example 22.8 (LPW lines 15323–15329) states the kernel, up with probability `p` and down with `1 − p` with moves outside the interval suppressed, and proves monotonicity by comparing `Pf(x)` with `Pf(y)`; it constructs no update or coupling. The simultaneous update appears, for the symmetric walk only, in Example 22.1 on p. 305 (LPW lines 15186–15193).

Smallest change: attach the locator to the walk ("the walk … staying put at the ends (LPW, Example 22.8, p. 308), with the update that moves every state in the same direction"), or add that the update is this roadmap's.

## C02 — The constant `ℓ` of 3.2 is one less than the `ℓ` of the theorem it cites, and the text does not say so

In 3.2 (lines 306–309) the bound `P(T > t) ≤ ℓ d̄(t)` with `ℓ = Order.height ⊤` is credited to "LPW, Theorem 22.26, p. 319". There `ℓ` is described as the length of the longest totally ordered subset (LPW lines 15880–15884); read as a number of elements this is `3` on `{1, 2, 3}`, where `Order.height ⊤ = 2`, and the README's own Check (lines 333–335) notes that with `3` the bound would not be the equality `2^(1 − t) = 2 · 2^(−t)`. The sharper constant is correct and is what the cited proof gives (its last step bounds by `max h − min h`, the number of strict steps; LPW lines 15885–15889), and the route in 3.2 proves it; but a reader comparing the statement with the source finds constants that differ by one with no remark.

Smallest change: one clause at the citation, for example "(LPW state the bound with the number of elements of a longest chain; the proof gives the number of strict steps, used here)".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.1 `backwardMap`, `forwardMap` | walk on `{1,2,3}`, noise (up, down); `t = 0, 1` | `F_2 = (2,2,3)`, `G_2 = (1,2,2)`; `F_0 = G_0 = id`, `F_1 = G_1` | Lean recursion gives `F_{t+1} = F_t ∘ f(·,u t)`; matches README | none |
| 1.1 link to `randomizedChain` | definition at `TauCeti/Probability/MarkovChain/Simulation.lean:48` | `X_0 = g(u 0)`, `X_{n+1} = f(X_n, u(n+1))`; with `g` constant equals `G_n(x)` for noise `k ↦ u(k+1)` | holds | none |
| 1.2 `map_backwardMap_eq_map_forwardMap` | fair coin, `t = 2`; non-i.i.d. noise | both laws uniform on `(3,3,3),(2,2,3),(1,2,2),(1,1,1)`; with `U 0 = up`: `{333,223}` vs `{333,122}` | true; i.i.d. needed | none |
| 1.2 `map_backwardMap_apply` | `t = 0, 1, 2`, `x = 1` | `t=0`: `dirac x`; `t=1`: `ρ.map (f x)`; `t=2`: `(1/2,1/4,1/4)` = row 1 of `κ²` | true | none |
| 2.1 definitions of `T`, `T_forward` | one point, empty `S`, two-state swap/collapse | `T = 0` iff subsingleton; noise `a,b`: `G_1 ≡ 0`, `G_2 ≡ 1`, `F_1 ≡ F_2 ≡ 0` | determine the object | none |
| 2.1 submultiplicativity | monotone, permutation and non-monotone updates of the walk, `t ≤ 7` | tails `1,1,1/2,1/4,1/8,…`; `1,1,1,…`; `1,1,3/4,1/2,5/16,3/16,7/64,1/16`; `P(T>4)=1/8 < 1/4` | holds in all | none |
| 2.1 almost-sure coalescence iff | permutation update; identity kernel; monotone update | `P(T ≤ t) = 0` all `t` and `T = ⊤`; `P(T ≤ 2) = 1/2` and tail `2^(1−t) → 0` | both directions hold | none |
| 2.1 equality of laws of `T`, `T_forward` | three updates above, `t ≤ 7` | backward and forward tails identical in each case | true | none |
| 2.1 `d̄(t) ≤ P(T > t)` | walk, `t ≤ 6`; `t = 0` | `d̄ = 1,1/2,1/4,…,1/64`; `P(T>t) = 1,1,1/2,…,1/32` | true; `/2` normalisation right | none |
| 2.2 exactness | walk; two-state chain `(1/2,1/2),(1,0)`; permutation update; non-invariant `π` | backward value `(1/3,1/3,1/3)` and `(2/3,1/3)`; forward `(1/2,0,1/2)` and `(1,0)`; junk value `dirac x` | true; both hypotheses needed | none |
| 2.2 invariance of the law | same chains; empty `S` | `(1/3,1/3,1/3)κ = (1/3,1/3,1/3)`; `(2/3,1/3)κ = (2/3,1/3)`; empty: vacuous | true | none |
| 3.1 extreme trajectories | monotone update; update `(1,1,3)/(2,3,2)`; one point | sandwich `F_t(⊥) ≤ F_t(x) ≤ F_t(⊤)`; non-monotone: `F_1(1)=F_1(3)=2`, `F_1(2)=3` | true; monotonicity needed | none |
| 3.2 `P(T>t) ≤ ℓ d̄(t)` | walk `ℓ=2`; non-monotone update; `t=0`; one point | `2^(1−t) = 2·2^(−t)`; `3/4 > 1/2`, `1/2 > 1/4`; `1 ≤ ℓ·1`; `0 ≤ 0` | true; sharp; monotonicity needed | C02 |
| 3.2 `P(T > j t) ≤ ℓ(2ε)^j` | walk, `ε = 1/4`, `t = 2`; `j = 0`; `ε < 0`; infinite `π` | `d = 2/3,1/3,1/6`; `t_mix(1/4)=2`; `2·4^(−j) ≤ 2·2^(−j)`; `ε<0`: `t_mix = ⊤`, vacuous | true; `π` finite is used (`tvDist_triangle`) | none |
| Copied `tvToStationary`, `tvBetweenStarts`, `mixingTime` | compared with MarkovChainMixing `Suggested.lean` lines 45–46, 49–50, 71–72 | bodies identical character for character; namespaces differ | marked copies, no shared qualified name | none |
| Layer 3 Example (walk on `{0,…,n}`) | LPW Example 22.8 | kernel and monotonicity there; `ℓ = n`; no update there | locator misplaced | C01 |

- Source locators checked against the text: 14 of 14 into LPW (Prop. 1.5 p. 6; Thm 5.4 p. 62; §5.4 and (5.17) p. 69; §22.3, Prop. 22.7, Ex. 22.8 p. 308; Thm 22.26 p. 319; §25.2 pp. 351–353; Remark 25.1 pp. 353–354; §25.3 pp. 354, 355).
- Library declarations opened at the pins: 15 (`Kernel.exists_measurable_map_eq_unitInterval` `Representation.lean:110`; `iIndepFun.isProbabilityMeasure` `Independence/Basic.lean:789`; `HasLaw` `HasLaw.lean:39`; `Kernel.Invariant` `Invariance.lean:39`; kernel `Monoid` `Composition/Comp.lean:238`; `tvDist` `TotalVariation/Defs.lean:62`, `tvDist_triangle` `:221`; `Order.height` `KrullDimension.lean:88`, `height_mono` `:267`, `height_strictMono` `:280`; `infinitePi` `ProductMeasure.lean:354`; `randomizedChain` `Simulation.lean:48`, `hasLaw_randomizedChain` `:111`; `markovChainLaw` `Process/MarkovChain.lean:161`, `markovChainLaw_map_eval` `:340`; `IsCoupling`).
- Cross-roadmap citations resolved: MarkovChainMixing 1.1, 1.2, 1.3, 4.1 and its scope (open head); MarkovChainsAndRenewal Layer 0 item 4 and Layer 3 item 4 (main), 0.4 and 3.4 (open revision); SimulatedAnnealing, BernoulliPercolation scopes (open heads). All say what is claimed.
- Dependency check: `depcheck: 174 roadmaps, 1964 edges, 0 problem(s)`; no UPWARD or CYCLE line. The one roadmap supplier, MarkovChainMixing, is an open pull request adding a new folder.
- Elaboration: `Suggested.lean` elaborates with 11 `sorry` warnings and nothing else; no `set_option`, no sorry'd data, single `import Mathlib`. Elaborated signatures compared with the README statements: no binder lost, generality equal.
- One-tactic probe (`rfl`, `simp`, `simp` with the four definitions unfolded, `infer_instance`) on a copy: none of the 11 theorems closes. No padding.
- Headline theorems of the README (exactness and invariance; submultiplicative tail, almost-sure coalescence, equality of the two laws; extreme trajectories, `d̄ ≤ P(T>t) ≤ ℓ d̄`, the mixing-time tail): all stated.
- Automatic checks: all passed. Pull request text read against the head: title, counts (11 theorems, 7 definitions), suppliers and locators agree.

Overlap check: read MarkovChainMixing, HittingAndCoverTimes, RandomWalkFluctuationTheory, MarkovChainsAndRenewal (main and its open revision), RandomWalksOnFiniteGroups, MarkovDecisionProcesses, DimerModelsAndLozengeTilings; shared objects: `d`, `d̄`, the mixing time and the coupling characterization of total variation, owner MarkovChainMixing (cited, definitions copied and marked); uniform samplers of kernels, owner MarkovChainsAndRenewal (cited); nothing else shared. No other roadmap, open or on main, states compositions of random maps, coalescence times or coupling from the past; MarkovChainMixing and HittingAndCoverTimes list them outside their scope.

Source independence: 12 passages compared with 1 source, none shared (longest common run 3 words); largest share LPW, 14 of 14 locators; contents compared with LPW Chapters 22 and 25: independent (general compositions and exactness before the monotone case, the reverse of 25.2 → 25.3, with material drawn from §1.2, §5.2, §5.4 and §22.7). Propp–Wilson 1996 could not be read; it carries no locator.

Research link: The headline is the exactness theorem of Propp and Wilson (1996), with their bound `P(T > t) ≤ ℓ d̄(t)` (LPW Theorem 22.26, attributed there to Propp–Wilson 1996, Theorem 5); exposition in Levin–Peres 2017, Chapter 25. Rests on the README's references and on LPW as read.

## Not verifiable

- J. G. Propp and D. B. Wilson, *Random Structures and Algorithms* 9 (1996): the publisher's page refused access and no legal copy was found; the README cites it without locator, by Levin–Peres's attribution, which was read (LPW lines 17185–17186, 15880).

## Source issues

- none

## For the human reviewers

- **Licence / not tested.** Every locator is into one textbook, Levin–Peres 2nd ed., read from D. Levin's page; its Chapter 25 carries its own copyright line (Propp and Wilson, 2008). The 1996 primary paper was not read. No reuse of wording, tables or examples was found.
