# Review of GlauberDynamicsOfTheIsingModel (pull request #2979 at 3b52933)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement was recomputed on degenerate and small cases (empty vertex set, one vertex, one edge, `β = 0`, `β < 0`, `n = 2, 3` for the cycle, `b = 0, 1, 2` for the tree) and every numerical Check reproduces; all eleven sampled targets agree with Levin–Peres at the cited locators, and the four supplier roadmaps carry the cited sections and declarations with the hypotheses the README attributes to them. There are no small corrections and two format notes, neither blocking. One point is left to the human reviewers: the roadmap rests on a single textbook, and five of its sections run in the order of that book's Sections 15.1–15.4.

## N01 — The third Check of 1.2 reports that a comparison was made but states no value

In the Checks of 1.2 (README lines 128–132) the bullet says the formula "was compared exactly" with the conditional-law definition on seven graphs at four temperatures. A reader cannot recompute anything from it, and it is written as a report of work done. One computed row would do the job, for example on the path with three vertices at `e^β = 2` and `x` all `+1`: the middle vertex has `S = 2` and `p = (1 + tanh 2β)/2 = 16/17`, which is the conditional probability `e^{2β}/(e^{2β} + e^{−2β})`.

## N02 — In 3.1, the threshold "as soon as `ε < 1/n`" is not the threshold

In the paragraph after the two items of 3.1 (README lines 281–284): for `c < 0` the right side of the mixing-time bound is `0` exactly when `log n + log(1/ε) ≥ 0`, that is for every `ε ≤ n`, and for `c = 0` it is `0` for every `ε`. The sentence is true as written (`ε < 1/n` is sufficient) but suggests a smaller range than the one that holds. Would "for every `ε ≤ n`" serve, or "for every `ε < 1/2`, where the mixing time is positive"?

## Questions for the author

- Is the restriction to unit couplings and zero field deliberate for 1.1–1.3? The supplier's energy is `ising J h` for an arbitrary coupling matrix and field, and the heat-bath computation of 1.2 and the monotonicity argument of 1.3 look as if they go through for a symmetric `J ≥ 0` with zero diagonal and any `h`, with `β S(x, v)` replaced by the local field. I did not verify this at that generality and read no source that states Layers 2–4 there, so it is a question and not a request.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 Ising law, `isingGibbs` | one edge at `e^β = 2`; coupling `−A` instead of `−½A`; `β = 0`; `V` empty | `Z = 2·2 + 2·½ = 5`, agreement `4/5`; with `−A`: `8 + ½ = 17/2`; uniform; one configuration of mass 1 | agrees with LPW (3.8)–(3.10), line 2646–2661 | none |
| 1.2 heat-bath formula | one edge, neighbour `+1`; `β = 0`; `V` empty in Lean | `(1 + tanh β)/2 = e^β/(e^β + e^{−β})`; both sides `½`; both sides `⊤ • 0 = 0` | true for every real `β`; LPW (15.1) p. 215 | none |
| 1.3 `map_isingUpdate`, `monotone_isingUpdate` | `β ≥ 0`, `x ≤ y`; one edge `β < 0`; `β = 0` | `S(y,v) ≤ S(x,v)` so `p(y) ≤ p(x)`, `decide(p(x) < u) ≤ decide(p(y) < u)`; `β < 0`: images `(−,+)` and `(+,−)`, incomparable | true; negative control true; LPW Ex. 22.2 pp. 305–306, §25.2 pp. 350–351 | none |
| 2.1 Chen's theorem | two points, rows `(½,½)`; swap kernel; `S` empty; `θ ≥ 1`; complex eigenvector | eigenvalues `1, 0`, `θ = 0`; eigenvalues `1, −1`, `W₁ = d` forces `θ ≥ 1`; empty spectrum; trivial since `|λ| ≤ 1` | true without `θ < 1`; LPW Thm 13.1 p. 180 | none |
| 2.2 one-step coupling | one edge `e^β = 6/5`; one edge `e^β = ½`; two isolated vertices; one vertex | coupling `36/61` = bound = Lipschitz lower bound; TV `½` vs bound `1/5`; `½ = ½`; `0 = 0` | true, attained; `β ≥ 0` needed; LPW (15.10)–(15.12), Lemma 15.3 | none |
| 2.2 even-degree form | `φ(1) = tanh 2β`, `s` odd when degrees even; `C₄` | `½φ(s) ≤ ½ tanh 2β`; bound `1 − (1 − tanh 2β)/4` | true; LPW proof of (ii) p. 217 | none |
| 3.1 fast mixing | ten graphs up to `K₅`, seven `e^β` in `[1, 5]`, `t ≤ 30`, nine `ε`; one edge `e^β = ⅓` | no violation of gap, `d(t)` or mixing bound; `β < 0`: `d(1) = 9/20 > 1/5`, eigenvalues `1, 9/10, 1/10, 0` | true; LPW Thm 15.1 pp. 215–216 | none |
| 3.1 even form, negative control | `C₄` at `e^β = ½` | staggered magnetization eigenvalue `1 − (1 − 15/17)/4 = 33/34`; claimed gap `8/17` | Check true | none |
| 3.2 complete graph | `n = 1`; `n = 2`, `e^{α/2} = 5/4`; `n = 2`, `e^β = ⅓` | `t_mix ≤ 1 ≤ ⌈log(1/ε)/(1−α)⌉` for `ε < ½`; `9/41 ≤ 0.446`, `c = 32/41 ≥ 0.554`; bound `2`, `d(2) = 81/200 > ¼` | true; LPW Thm 15.4(i), (15.13), p. 218 | none |
| 3.3 coalescence bound | `V` empty; one vertex; `c ≤ 0`; one edge `e^β = ⅓`, `t = 1` | `0 ≤ 0`; `1 ≤ 2` at `t = 0`, then `0 ≤ 0`; right side `≥ 2n²`; `P(T > 1) = 1 > 4/5` | true; route uses CouplingFromThePast 3.2 with `ℓ = n`, `d̄ ≤ 2d` | none |
| 4.1 cycle | `n = 3, 4, 5` at `e^β = 1, 2, 3`; `n = 2`; triangle `e^β = ½` | gaps `1/3, 2/51, 1/123; 1/4, 1/34, 1/164; 1/5, 2/85, 1/205` on both sides; `1/10` vs `1/82`; eigenvalue `83/102`, formula `32/51` | true for `n ≥ 3`, `β ≥ 0`; both controls true; LPW Thm 15.5, (15.15), (15.17) | none |
| 4.2 `baryTree` | `(b,k) = (2,1), (2,2), (1,3), (0,k)` | edges `{0,1},{0,2}`; seven vertices, parents `0,0,1,1,2,2`; path on four vertices; one vertex | intended graph | none |
| 4.2 tree bound | depth 1 at `e^β = 1, 6/5, 5/4`, `ε = ¼, 1/100`; depth 2 at five `e^β ≤ 13/10`, `ε = ¼`; `e^β = ⅓` | `3,4,4` ≤ `10,19,25`; `11,15,16` ≤ `19,39,50`; `10,11,13,14,16` ≤ `31,42,62,80,110`; `19 > 3` | true; README's numbers reproduce; LPW Thm 15.6, (15.19) | none |
| 4.3 removing edges | nine graphs, random subgraphs, four `e^β ≥ 1`; one edge to empty at `e^β = 2`; `G' = G`, `e^β = ⅓`; `V` empty | no violation; `½ ≤ 64/5`; `1/10 > 1/90`; `0 ≤ 0` | true; LPW Prop. 15.8 pp. 221–222, proved in the stated form | none |
| Conventions: total variation normalisation | Mathlib `tvDist` at the pin | variation of `μ − ν` on the whole space, values in `[0, 2]`; halved in `tvToStationary` | matches `d(t) ∈ [0, 1]` | none |
| Conventions: relaxation time | LPW §12.2 | `t_rel = 1/γ⋆`, absolute gap, p. 163 (line 8299) | matches `(absSpectralGap κ)⁻¹` | none |

- Source locators checked against the text: 17 of 17 README locators into LPW (Section 3.3.5; §12.2 p. 163; Thm 13.1 p. 180; Ex. 13.4 p. 181; (15.1) p. 215; Thm 15.1 and its proof pp. 215–217; Lemma 15.3; Thm 15.4(i); Thm 15.5; Thm 15.6; Prop. 15.8; Ex. 22.2; §25.2).
- Library declarations opened at the pin: 27, among them `MeasureTheory.tvDist` (`Mathlib/MeasureTheory/Measure/TotalVariation/Defs.lean:62`), `Measure.uniformOfFinset` (`Mathlib/Probability/Distributions/Uniform.lean:199`), `SimpleGraph.cycleGraph` (`Mathlib/Combinatorics/SimpleGraph/CycleGraph.lean:30`), `SimpleGraph.fromRel` (`Mathlib/Combinatorics/SimpleGraph/Basic.lean:135`), `Kernel.IsReversible.invariant` (`Mathlib/Probability/Kernel/Invariance.lean:63`), `TauCeti.wassersteinEDist` and `TauCeti.wassersteinEDist_le` (`TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Basic.lean:189, 203`), `TauCeti.IsCoupling` (`TauCeti/MeasureTheory/OptimalTransport/Coupling.lean:120`). No Ising law, Glauber dynamics, mixing time or spectral gap of a kernel exists in the pinned Mathlib or Tau Ceti.
- Cross-roadmap citations resolved at the open heads: MarkovChainMixing 1.2, 1.3, 2.1, 2.2, 2.4, 4.2, 5.3, 6.1 with `mixingTime_le_iff`, `spectralGap_le_of_dirichletForm_le`, `wassersteinEDist_comp_le`, `tvToStationary_le_pow_mul_diam`, `isMarkovKernel_glauber`, `isReversible_glauber`, `hypercubeWalk`; SimulatedAnnealing 3.1; QuantumOptimization 1.1; CouplingFromThePast Conventions, 1.1, 2.1, 3.2 with `measureReal_lt_backwardCoalescenceTime_le_height_mul`. The twelve copied definitions are identical, character for character, to their owners'.
- Dependency check: `depcheck: 139 roadmaps, 1545 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with `sorry` the only warning (13 declarations). The elaborated types of all 29 declarations were compared with the README; the binders dropped from definitions are ones their types do not need, and no statement lost a hypothesis.
- One-tactic probe (`simp`, `rfl`, `infer_instance`) on a copy: none of the 13 theorems closes. All headline theorems of the README are stated; none is a stand-in.
- Automatic checks: all passed at this head. Nothing outside the roadmap folder is changed.
- Pull request text: title and description agree with the head (13 theorems, 16 definitions of which 12 copied, the four suppliers, the locators).

Overlap check: read MarkovChainMixing, CouplingFromThePast, HopfieldNetworks, GibbsMeasuresAndTheIsingModel, ComparisonOfMarkovChains, OptimalTransport, DimerModelsAndLozengeTilings; nothing shared. MarkovChainMixing owns the Glauber dynamics of an arbitrary law and is cited for it; GibbsMeasuresAndTheIsingModel treats infinite-volume states on `ℤ^d` and names MarkovChainMixing, not this roadmap's objects; Chen's theorem and the Ising statements have no other owner on main or at an open head.

Source independence: 14 passages compared with 1 source, none shared beyond formulas and standard names (longest common run about six words); largest share LPW, 17 of 17 locators; contents compared with LPW: the four layers are not its chapters (Layer 1 draws on Chapters 3, 22, 25; Layer 2 on Chapter 13 and a proof inside 15.1; 3.3 is the roadmap's own), but sections 3.1, 3.2, 4.1, 4.2, 4.3 follow 15.1, 15.2, 15.3, 15.4, 15.4 in order with narrower scope each; judged independent, flagged to the human reviewers.

Research link: the targets are the high-temperature fast-mixing theory of Ising Glauber dynamics as LPW Chapter 15 presents it, resting on Chen (1998), Bubley–Dyer (1997) and Propp–Wilson coupling from the past; LPW p. 215 describes the slow/fast mixing transition as active since the late 1980s. Rests on the README References and LPW.

## Not verifiable

- none

## Source issues

- **Gap** in LPW at Theorem 13.1, p. 180: the source defines the Lipschitz constant for real functions and applies it to an eigenfunction, which is complex for a complex eigenvalue; it should define it with the modulus for complex functions; affects the proof.
- **Misprint** in LPW at Example 13.4, p. 181: the source sums the Hamming distance over coordinates `1` to `d` on the cube of dimension `n`; it should sum to `n`; affects nothing.
- **Misprint** in LPW at the proof of Theorem 15.1, p. 217: the source writes the neighbour sum with its arguments in the order vertex, configuration; it should be configuration, vertex, as in (15.1); affects nothing.
- **Gap** in LPW at Theorem 15.6, p. 221: the source states the mixing-time bound without an integer part; it should carry the ceiling that Corollary 14.8 gives, since the proof yields no more; affects a stated result.
- **Error** in LPW at the proof of Proposition 15.8, p. 222: the source asserts the upper bound on the transition probability of the smaller graph for all pairs; it should exclude the diagonal, where it fails already at `β = 0`, `n ≥ 2`; affects the proof.

## For the human reviewers

- Scope: every locator (17 of 17) is to one textbook, Levin–Peres, *Markov Chains and Mixing Times*, 2nd ed. (AMS 2017), Chapters 3, 12, 13, 15, 22, 25; no research article is cited directly.
- Scope: README sections 3.1, 3.2, 4.1, 4.2, 4.3 follow LPW Sections 15.1–15.4 in order; Layers 1–2 and 3.3 do not. I judged the arrangement independent; a human may weigh it differently.
- Scope: all four supplier roadmaps (MarkovChainMixing, QuantumOptimization, SimulatedAnnealing, CouplingFromThePast) are open pull requests by the same author; this roadmap cannot merge before them.
