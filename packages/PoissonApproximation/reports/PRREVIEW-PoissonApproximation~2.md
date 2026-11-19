# Review of PoissonApproximation (pull request #2569 at 1a6eef3)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every stated bound, every Check with a numerical value and every locator was recomputed or read at the source, and all agree; the Lean statements match the README, including the junk values at `λ = 0`, `d = 0` and `n = 0`. There is one small correction (a Check that calls an independence "vacuous" when it holds for another reason) and one format note, neither blocking. One licence question about the copy of Arratia, Goldstein and Gordon is left to the human reviewers.

## C01 — In the first Check of 3.1 the independence does not hold vacuously; it holds because the indicator is almost surely constant

A reader who takes "vacuously" at its word concludes that an empty neighbourhood always satisfies the independence hypothesis, and then misreads what the Check shows about `i ∈ Nᵢ`. In the first Check of 3.1 (README line 240), with one index and `N₁ = ∅`, the indices outside `N₁` are `{1}`, so the hypothesis asks that `x₁` be independent of `x₁` itself. That is a real condition: it holds exactly when `x₁` is almost surely constant, which is the case here because `p₁ = 1`; for `p₁ = 1/2` and `N₁ = ∅` it fails. The computed values in the Check are right (`b₁ = b₂ = 0`, distance `2(1 − e^(−1)) = 1.2642`).

The smallest change: replace "the independence holds vacuously" by "the independence holds because `x₁` is almost surely constant".

## N01 — The MarkovChainMixing contract describes the state of a pull request

In the supplier contract for MarkovChainMixing (README lines 565–566), "is an open roadmap, not on main" will be out of date once that roadmap merges. The sentence would read the same without the clause: "this roadmap depends on MarkovChainMixing for this one statement; it is used in 1.1 and 3.3".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 coupling characterization (cited) | MarkovChainMixing 1.1 at its open head; LevinPeres2017 line 2922 | Supplier states `IsLeast … (tvDist μ ν / 2)` on a countable type; Prop. 4.7 on printed p. 50 | agrees | none |
| 1.1 Bernoulli–Poisson coupling | marginals, `p = 0`, `p = 1/2` | first marginal `1 − p`, `p`; second `Po(p)`; `γ{x≠y} = p(1 − e^(−p))`; exact distance at `1/2`: 0.39347 both | sound, optimal | none |
| 1.1 Check `δ₀` vs `Po(r)` | general `r` | mass differences `(1 − e^(−r)) + (1 − e^(−r))` | sound | none |
| 2.1 Stein characterization | `r = 0`; `δ₁`; `Po(r')`; non-integrable integrand | `r = 0`: `j μ{j} = 0` forces `δ₀ = Po(0)`; `δ₁`: integral `−1`; `Po(r')`: `e^(−r')(r − r')`; indicators suffice for converse | sound; Ross2011 line 1624 | none |
| 2.2 `steinSolution`, equation | `k = 0`, `k ≥ 1`, `r = 1`, `A = {0}`, `r = 0` | `f(0) = 0`; `r f(1) = 1_A(0) − Po(A)`; `f(1) = 0.63212`, `f(2) = 0.26424`; `r = 0`: `f ≡ 0` | sound; Ross2011 line 1632 | none |
| 2.3 increment bound | `r ∈ {0.01,…,40}`, all `A`, `k = 0` included; `r = 0` | max increment equals `(1 − e^(−r))/r` at every rate (0.632121 at 1, 0.025 at 40); `r = 0`: `0 ≤ 0` | sound; Ross2011 line 1669 | none |
| 2.3 sup bound | same rates | max `|f|`: 0.6321 (r=1), 0.4455 (2), 0.2809 (5), 0.1984 (10), 0.1402 (20), 0.0991 (40) vs `min(1, r^(−1/2))` | sound | none |
| 3.1 `occurrences`, `intensity` | empty `ι`, zero probabilities | count 0, intensity 0; both sides of every bound 0 | determine their objects | none |
| 3.1 local dependence | `p = 1`, `N = ∅`; two equal indicators; runs, 264 cases | 1.2642 vs 0 (shows `i ∈ Nᵢ` needed); 0.8964 vs 0.6321 (fails) and 2.5285 (holds); runs: 0 violations | sound; AGG1989 lines 116–121, 157–158 | C01 |
| 3.2 Barbour–Hall | one indicator; two at 1/2; ten at 1/10; empty `ι` | `2p(1 − e^(−p))` both sides; 0.39636 vs 0.63212; 0.05862 vs 0.12642; `0 ≤ 0` | sound; AGG1989 lines 139–142, Ross2011 line 1726 | none |
| 3.3 Le Cam | `p = 1`; all `pᵢ = 0`; source's `λϖ` | 1.2642 < 2; `0 ≤ 0`; `λϖ = ∑ pⱼ²`, norm is total mass | sound; LeCam1960 lines 117–123, 69 | none |
| 3.3 not in the Lean file | factor `(1 − e^(−λ))/λ ≤ 1`, `0` at `λ = 0` | follows from 3.2 by one multiplication; module docstring says so | not a missing headline | none |
| 3.4 monotone couplings | independent family; two equal indicators; identity `∑pᵢE[W+1−Wᵢ]` | `λ − Var W = ∑pᵢ²`; `λ − Var W = 0`, distance 0.8964, hypothesis fails; `λ² + λ − E[W²]` | sound; Ross2011 lines 2272–2300, 1945–1949 | none |
| 4.1 birthdays | `(n,d)`: (2,1), (2,2), (3,2), (5,10), (6,5), (1,3), (0,2); `d = 0` | 1.2642=1.2642; 0.3935=0.3935; 1.0796 vs 3.8843; 0.3018 vs 1.6435; 0.4222 vs 6.4614; 0 vs 0; `d = 0`: 1 vs 0 | sound; AGG1989 lines 259–287 | none |
| 4.2 count by fixed points | `n = 4`; `j > n` | 9, 8, 6, 0, 1 (sum 24); `choose n j = 0` | sound | none |
| 4.2 fixed points bound | `n = 0…8` | 1.2642 vs 2; 1.2642 vs 2; 0.8964 vs 1.3333; …; 0.001173 vs 0.001411; ratios 0.632–0.831 | sound; Ross2011 lines 2507–2527 | none |
| 4.3 empty boxes | `(n,k)`: (1,0), (1,3), (2,2), (3,3), (2,0), (6,7); `n = 0` | 1.2642=1.2642; 0=0; 0.3935=0.3935; 0.6025 vs 0.7525; 1.4587 vs 1.7293; 0.4673 vs 1.0172 | sound; Ross2011 lines 2337–2374 | none |
| Conventions: Stein factor | `λ = 0`, `λ = 1` | Lean value 0 at 0; 0.6321 vs `min(1, 1/λ) = 1` at 1 | sound | none |

- Source locators checked against the text: 20 of 20 (Ross 12, Arratia–Goldstein–Gordon 6, Le Cam 1, Levin–Peres 1).
- Library declarations at the pins: 28 located by file and line, of which 9 statements were read in full (for example `MeasureTheory.etvDist` at `Mathlib/MeasureTheory/Measure/TotalVariation/Defs.lean:53`, `etvDist_le_two_mul_iff` at `TauCeti/MeasureTheory/Measure/TotalVariation.lean:94`, `IsCoupling` at `TauCeti/MeasureTheory/OptimalTransport/Coupling.lean:120`, `withDensity_natCast_poissonMeasure` at `TauCeti/Probability/Distributions/Poisson/SizeBias.lean:39`, `hasLaw_card_filter_mem_pi` at `TauCeti/Probability/Distributions/PoissonBinomial/Count.lean:63`, `numDerangements_sum` at `Mathlib/Combinatorics/Derangements/Finite.lean:107`); all exist, and those read say what the README says.
- Duplication by object: no Stein equation for the Poisson law, no total-variation bound against `poissonMeasure`, and no count of permutations by fixed points at either pin; none in any roadmap on main or open.
- Cross-roadmap citations resolved: 5 (MarkovChainMixing 1.1 at its open head; MarkovChainsAndRenewal Layer 3 items 4 and 5, MathematicalStatisticsFoundations 9.2, MathematicalStatisticsNonparametric 1.4, StandardDistributions 9.4 on main).
- Dependency check output: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`. The one supplier not on main, MarkovChainMixing, is an open pull request adding a new roadmap; no change outside the folder.
- Elaboration of `TauCetiRoadmap/PoissonApproximation/Suggested.lean`: `sorry` the only warning (11 theorems); the 14 elaborated signatures compared with the README, none lost a binder. One-tactic probe (`rfl`, `simp`, unfolding the definitions then `simp`) closes none of the 11 theorems.
- Automatic checks: all passed. Title and description read against the head: nothing contradicted, nothing left out.
- Overlap check: read MarkovChainMixing, FiniteSamplingDiscrepancy, PopulationDynamics, RandomProjectionsAndSketching, MathematicalStatisticsFoundations, StandardDistributions (and RandomGraphs, PointProcesses for Poisson limits); the coupling characterization of total variation is shared with MarkovChainMixing, which owns it (1.1) and is cited; nothing else shared.

Source independence: 11 passages compared with 4 sources (the routes of 2.1, 2.3, 3.1, 3.3, 3.4, 4.1, 4.3 and four statements), none shared beyond formulas the mathematics forces; largest share Ross2011, 12 of 20 locators; contents compared with Ross2011 §4: independent (Layer 1 and 3.3 are not in it, 3.1 precedes 3.2 against its 4.1 then 4.2, applications are gathered in Layer 4; Layer 2 before Layer 3 is forced by the Needs lines of 3.1 and 3.4).

Research link: The Stein–Chen method for Poisson approximation: Chen (1975), Barbour and Hall (1984), Arratia, Goldstein and Gordon (1989), Barbour, Holst and Janson (1992), surveyed by Ross (2011); the headline bounds are the stated theorems of those works. Rests on the README's references and on Ross2011 §4 and AGG1989 §2, which were read.

## Not verifiable

- The attribution of the factor `(1 − e^(−λ))/λ` to Barbour and Hall (1984) and of the bound on the Stein solution to Barbour, Holst and Janson (1992): those texts were not read; the README gives them without locators, and Ross2011 line 1678 and AGG1989 line 62 point to the same works.
- The counts in three Checks ("309 families" in 3.2, "200 choices" in 3.1, "300000 configurations" in 4.3) were not reproduced as counts; the bounds themselves were recomputed on overlapping ranges with no violation.

## Source issues

- **Error** in Ross2011 at Theorem 4.7, p. 41 (arXiv version 1): the source says the neighbourhood of an index is any set outside which independence holds; it should also require each index to lie in its own neighbourhood; affects a stated result.
- **Error** in Ross2011 at the proof of Lemma 4.4, p. 39: the source says the increments of the solution for the set containing only zero are negative everywhere; it should exclude the first increment, which equals the bound and is positive; affects the proof.
- **Misprint** in Ross2011 at the proof of Lemma 4.4, p. 39, the display before (4.3): the source says the increment of the solution is a sum of singleton solutions; it should be the sum of their increments; affects nothing.

## For the human reviewers

- Licence: the Arratia–Goldstein–Gordon text was read from the second author's university page; that copy is a JSTOR scan carrying JSTOR's terms-of-use footer (AGG1989 lines 135–136). Project Euclid's copy could not be read automatically.
