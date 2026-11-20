# Review of HittingAndCoverTimes (pull request #2796 at 60a3301)

**Verdict:** accepted

**Summary.** Accepted: no statement, Check or route was found false, and every source locator was read at its place in the three cited texts and supports the statement as written. Each of the ten headline theorems was instantiated on degenerate and small cases and every number printed in a Check was recomputed exactly. There are three small corrections (the set version of the hitting time identity, a missing locator in 1.2, a citation of a numbering that only an open revision has) and two format notes, none blocking. The humans who approve decide on the standing of the unfinished Aldous–Fill monograph as the only locator for 2.1, and on merging behind three open supplier roadmaps.

## C01 — The hitting time identity of the source is for a target set `Z`; 1.4 states it for a single vertex and does not say so

A reader who opens Lyons–Peres, Proposition 2.20 (p. 48) finds the identity for a vertex `a` and a set `Z` of vertices not containing it, with the voltage of the unit current from `a` to `Z`. In 1.4 (README line 153) and in `Network.meanHittingTime_walk_eq_sum` the target is one vertex `z`, because the copied `voltage` is grounded at one vertex; the README cites the proposition without saying that it is the case `Z = {z}`, and the scope paragraph (line 492) lists "hitting times of sets in terms of resistance between sets" as not treated without saying that the cited proposition covers them. Since 1.3 already treats a general target set `A`, the set version costs only a grounded Laplacian with the rows and columns of `Z` deleted.

The smallest change is one clause in 1.4: "LP state it for a target set `Z`; here `Z = {z}`, the case the voltage of ElectricalNetworksAndRandomWalks 2.1 expresses". Stating the set version as a second target, with the voltage grounded on `Z` defined here, would be the fuller repair; which of the two is the author's choice.

## C02 — Theorem 1.2 is the only target with no locator, and its attribution names no work

In 1.2 (README lines 101–103) the least-solution theorem is attributed to "the theory of minimal nonnegative solutions of Markov chain equations". An implementer cannot open anything to compare the statement with, and the sentence reads as an attribution while naming neither an author nor a text. Every other theorem of the roadmap carries a theorem number and a page.

Give one locator for the statement on a countable state space with values in `[0, ∞]`. From memory, and not opened for this review, J. R. Norris, *Markov chains* (Cambridge University Press, 1997), §1.3, states exactly this (the vector of mean hitting times is the minimal nonnegative solution); the author should check the theorem number before citing it.

## C03 — "item 3" of the conventions of MarkovChainsAndRenewal exists only in an open revision of that roadmap

The Conventions (README line 63, "the first entrance `H_A` of the conventions of MarkovChainsAndRenewal (item 3 there)") and the scope section (line 472, "its conventions, item 3") cite a numbered item. On main the Conventions of MarkovChainsAndRenewal are unnumbered paragraphs, and the first entrance `H_A` is defined in the paragraph that begins "On a path X, distinguish the first entrance"; the numbered list whose item 3 is "Hitting times" is in the open template revision of that roadmap only. A reader of main finds no item 3.

Cite it as it is on main, for instance "its Conventions, the paragraph on first entrance and first return", optionally with "(item 3 in its sectioned numbering)", as the README already does for §3.2 and §3.5.

## N01 — `Matrix.trace` is listed under the wrong file

In the Mathlib contracts (README line 516) `Matrix.trace` closes the bullet for `Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean`; it is defined in `Mathlib/LinearAlgebra/Matrix/Trace.lean` (line 43 at the pin).

## N02 — "the left side" in 4.3 refers to the Lean statement, not to the displayed inequality

In 4.3 (README line 412) "For `|A| ≤ 1` the left side is the junk product `⊤ · 0 = 0`" follows the display `E_x τ_cov^A ≥ t_min^A H_(|A| − 1)`, where the product is on the right. "The bound is the junk product" would read correctly against both forms.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `meanHittingTime` | path 0—1—2; identity kernel on 2 states; `A = ∅`; `x ∈ A` | `E_0 τ_2 = 4`, `E_1 τ_2 = 3`, `E_1 τ_{0,2} = 1`; return-time variant gives `1 + 3 = 4` at 2; `E_1 τ_0 = ⊤`; `τ_∅ = ⊤`; `0` | sound | none |
| 1.2 least solution | walk on ℕ down 2/3, up 1/3, `A = {0}`; absorbing 1 | homogeneous roots of `r² − 3r + 2`: 1, 2, so `3x + c(2^x − 1)` solves, `c = 0` least; `h(1) = 1 + h(1)` forces `⊤` | sound | C02 (locator) |
| 1.3 real system | cycle `n = 4`; reducible chain of 1.2; `S` empty; one state | `E_k τ_0 = (0, 3, 4, 3) = k(4 − k)`; `h(1) = 1 + h(1)` has no real solution; vacuous; `A = S`, `h = 0` both sides | sound | none |
| 1.4 hitting time identity | unit path; edge with unit loop at `a`; two vertices, no edge; `a = z`; one vertex | voltage `(2, 1, 0)`, weights `(1, 2, 1)`: `4 = 4`; commute `8 = 4 · 2`; loop: `c(a) v(a) = 2 · 1 = 2 = E`; `⊤` vs junk `0` (connectivity excludes); `0 = 0` | sound | C01 (set `Z`) |
| 2.1 mean hitting time formula | two-state `p = 1/3, q = 1/2`; exchange chain (period 2); `x = y`; one state | `π = (3/5, 2/5)`, `Z = [[12/25, −12/25], [−18/25, 18/25]]`; `(30/25)/(2/5) = 3`, `(30/25)/(3/5) = 2`; `Z = ±1/4`, `E = 1`; `0 = 0`; `Z = 0` | sound | none |
| 2.2 hitting from stationarity | two-state chain; cycle `n = 4` | `(2/5) · 2 = 4/5 = (12/25)/(3/5)`; Kemeny–Snell matrix gives `(27/25)/(3/5) = 9/5`; `(0 + 3 + 4 + 3)/4 = 5/2 = (16 − 1)/6` | sound | none |
| 2.3 random target lemma | two-state chain from `a` and `b`; identity kernel with `π = δ_0` | `6/5`, `6/5`, `trace Z = 12/25 + 18/25 = 6/5`; `0` from 0 and `⊤` from 1 (irreducibility excludes) | sound | none |
| 2.4 cycle identity | biased triangle 2/3, 1/3; unit path; `a = b = c` | `E` to next state `12/7`, to previous `15/7`: `36/7 ≠ 45/7` (not reversible); `1 + 3 + 4 = 8 = 4 + 1 + 3`; `0 = 0` | sound | none |
| 3.1 mixing bound | exchange chain; lazy rotation on ℤ/11; lazy 4-cycle; absorbing example; one state | `E_π τ = 1/2`, bound 2, `d ≡ 1/2`; `E_π τ = 10`, bound 21, `d(22) = 1495409/5767168 ≈ 0.2593`, `d(23) ≈ 0.2450`; `E_π τ = 5`, bound 11, `d(1) = 1/4`; `⊤`; `0 ≤ 1` | sound | none |
| 3.1 non-irreducible claim | reversible, `supp π ≠ S`; `supp π = S` with two classes | detailed balance closes `supp π`, so a state off it has `E_π τ = ⊤`; full support makes classes closed, the other class is missed with positive mass | sound | none |
| 4.1 `coverTime` | cycle 4; `K_4` with and without loops; path 5; `A = ∅`; one state | `6`; `11/2`, `22/3`; `16` from an end, `20` from the middle; `sup ∅ = 0`; `0` | sound | none |
| 4.2 Matthews upper | `K_n`; cycle 4; one state; reducible `n = 2` | `t_hit = n − 1`, bound `(n − 1) H_(n−1)` attained; `4 · 11/6 = 22/3 ≥ 6`; `0 ≤ 0 · 0`; `t_hit = ⊤`, `⊤ · 1 = ⊤` | sound | none |
| 4.3 Matthews lower | path ends; star, start outside `A`; cycle 4; absorbing chain; `|A| ≤ 1` | `(n − 1)² · 1` attained; `t_min = 4 ≤ 5`; `3 · 11/6 = 11/2 ≤ 6`; `t_min = 2 = E_1 τ_cov^A`, `⊤` from 0; `⊤ · 0 = 0`; sum `1 − 1/|A| + Σ_{k=2}^{|A|} 1/k = H_(|A|−1)` | sound | N02 |
| Copied definitions | each of the 12 copies against its owner's file at the open head | text identical for `Network`, `weight`, `graph`, `walkPMF`, `walk`, the instance, `laplacian`, `groundedLaplacian`, `voltage`, `transitionMatrix`, `stationaryMatrix`, `fundamentalMatrix`, `tvToStationary`, `mixingTime` | sound | none |

- Source locators read against the text: 14 in Levin–Peres (second edition, first author's page), 5 in Lyons–Peres (versions of 8 November 2016 and 19 August 2026, same numbering and pages), 5 in Aldous–Fill (recompiled 2014); all agree in number, page and hypotheses.
- Library declarations opened at the pins: 19 (`hittingAfter` HittingTime.lean:66, `ENat.toENNReal` Mathlib/Basic/Real/ENatENNReal.lean:34, `lintegral_iSup` Add.lean:39, `Invariant`/`IsReversible`/`IsReversible.invariant` Invariance.lean:39/58/63, `IsIrreducible` Irreducible.lean:56, `tvDist` TotalVariation/Defs.lean:62, `mul_nonsing_inv`/`nonsing_inv_apply_not_isUnit` NonsingularInverse.lean:209/173, `harmonic` Harmonic/Defs.lean:25, `markovChainLaw` and `markovChainLaw_eq_comp` MarkovChain.lean:161/188, the Markov property MarkovProperty.lean:131, the strong Markov property StrongMarkov.lean:69, `IsAperiodic` Period.lean:108, `isIrreducible_count_iff_forall_reaches` Reachability.lean:126, `toMatrix` Kernel/Matrix.lean:44, `ofPMF` Kernel/PMF.lean:44).
- Cross-roadmap citations resolved: MarkovChainsAndRenewal on main (Layer 2 item 3, Layer 3 items 2 and 5, conventions); ElectricalNetworksAndRandomWalks 1.1, 2.1, 3.2; MarkovChainMixing 1.2, 1.3, 2.1; MCMCAsymptoticVariance 1.1, 1.2, at their open heads. Each of the three open suppliers lists hitting times (and cover times) as outside its scope.
- Duplication by object at the pins: no mean hitting time, cover time or fundamental matrix in Mathlib or Tau Ceti; the only same-name library hit is `laplacian`, a different object (the copy is the network Laplacian of the supplier).
- Dependency check output: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/HittingAndCoverTimes/Suggested.lean`: exit 0, ten `sorry` warnings and nothing else. One-tactic probe (`simp`, `rfl`) on a copy: none of the ten theorems closes. Elaborated types compared with the README statements: no hypothesis lost; the binders dropped from definitions are `MeasurableSingletonClass` (and `MeasurableSpace` for `coverTime`), which their bodies do not use.
- Headline theorems: ten in the README, ten stated in `Suggested.lean`; the module docstring says all are statable. Title and description read against the head: the counts (10 theorems, 15 definitions, 1 structure, 1 instance, 12 copies), the suppliers and the locators agree; nothing to correct.
- The automatic checks all passed on this head.

Overlap check: read ElectricalNetworksAndRandomWalks, MarkovChainMixing, MCMCAsymptoticVariance, MarkovChainsAndRenewal (main and its open revision), ComparisonOfMarkovChains, MarkovDecisionProcesses, StochasticCalculus; networks, voltages and the commute time identity are owned by ElectricalNetworksAndRandomWalks, the transition matrix and mixing time by MarkovChainMixing, the fundamental matrix by MCMCAsymptoticVariance, first entrance and return times and Kac's formula by MarkovChainsAndRenewal; mean hitting times and cover times are owned here and by no other.

Source independence: 14 passages compared with 3 sources, none shared (longest common run about six words, in the definition of the times `T_k` of 4.2 against the proof of Lyons–Peres Theorem 2.22); largest share Levin–Peres, 14 of 24 locators; contents compared with Levin–Peres Chapters 10–11: independent (Layers 1 and 2 correspond to no section of it; Layer 3 uses its §10.7 and Layer 4 its §§11.1–11.2, in the order the *Needs:* lines of 3.1 and 4.2 force).

Research link: Headlines are Matthews' cover time bounds (1988), Tetali's hitting time identity (1991), the cycle identity of Coppersmith, Tetali and Winkler (1993) and the Aldous–Fill mean hitting time formula, the hitting-time tools of the mixing-time literature (Levin–Peres 2017, Chapters 10–11, whose Theorem 10.22 is headline 3.1). Rests on the README and the notes of the sources read.

## Not verifiable

- The Norris reference suggested in C02 was not opened; it is offered from memory and marked so.
- The printed Cambridge University Press edition of Lyons–Peres was not read; numbering and pages were checked in the two online versions on the first author's site.

## Source issues

- **Misprint** in Levin–Peres (second edition) at Proposition 11.4, printed page 151: the source fixes a subset `A` in the hypothesis and then maximises over all subsets `A` in the conclusion; it should fix no set and define `t_min^A` for every `A`; affects nothing.

## For the human reviewers

- Scope/licence: the only locator for the mean hitting time formula (2.1) is Aldous–Fill, an unfinished monograph that was never published (2.2 and 2.3 also have locators in Levin–Peres); read from the first author's page.
- Suppliers: three suppliers (ElectricalNetworksAndRandomWalks, MarkovChainMixing, MCMCAsymptoticVariance) are open pull requests by the same author; the 12 copied definitions are identical to those heads today and must be compared again if those heads change before merging.
