# Review of MarkovChainMonteCarloGuarantees (pull request #3121 at f51e4ab)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement of Layers 1 to 3 was recomputed (the eight theorems on exact examples, the bounds of 1.2, 2.1 and 2.2 on 341 random chains with a finite mixing time, every numerical Check with rational arithmetic) and none failed; the file elaborates with `sorry` as its only warning and no theorem closes by one tactic. There are two small corrections (two pointers into supplier roadmaps) and two format notes, none blocking. One question of scope is left to the human reviewers: most targets are marked "proved here" and have no refereed statement in this form.

## C01 — The oscillation inequality is not one of the facts of MarkovChainMixing 1.2

In the route of 1.2 (README line 150) the text announces "three facts of its 1.2 that carry no Lean name": that `d` is nonincreasing, that `d̄(t) ≤ 2 d(t)`, and that `|μ u − μ' u| ≤ c · tvDist μ μ' / 2` for `u` of oscillation at most `c`. MarkovChainMixing 1.2 on main states the first two (its second and third bullets) and nothing like the third; a reader who looks for it there finds nothing. The supplier contract of this README (line 753) already lists only the first two as README facts of that section.

Say "two facts of its 1.2 … and a third, proved here", so that the oscillation inequality is visibly this roadmap's own lemma. Its proof as given (subtract the midpoint of the range of `u`) is correct.

## C02 — The value `σ²(f) = −Var_π f` for the identity kernel is in MCMCAsymptoticVariance 3.1, not in the Checks of its 2.1

In the last Check of 3.3 (README line 576) the identity kernel on two states is given `σ²(f) = −Var_π f` with the pointer "MCMCAsymptoticVariance 2.1, Checks". At that roadmap's head the Checks of 2.1 treat two disjoint copies of the exchange chain; the identity kernel with `Z = −Π` is in the Checks of its 1.1, and the value `−1/4 = −Var_π f` for the indicator of `a` is in the Checks of its 3.1. The value itself is right (recomputed: `−1/4`). Point to 3.1.

## N01 — The route of 2.2 redoes by hand an induction Mathlib has

The scope section says Mathlib owns the Azuma–Hoeffding bound, but the route of 2.2 runs the induction on `E e^{s M_n}` and the Chernoff step itself. `ProbabilityTheory.measure_sum_ge_le_of_hasCondSubgaussianMGF` (`Mathlib/Probability/Moments/SubGaussian.lean`, line 915) gives `exp(−ε²/(2 Σ c_i))` for conditionally sub-Gaussian increments on a standard Borel space; with parameter `c²/4` for each `D_j` (Hoeffding's lemma under `κ x`) and `ε = t − c` this is `exp(−2(t − c)²/(n c²))`. The route would shorten to the conditional sub-Gaussianity of `D_j` and the boundary term; the lemma could then be listed under the Mathlib contracts.

## N02 — `∇φ` in the remark on ratio estimators is not introduced

The remark after 3.3 writes the limit variance as `∇φᵀ Σ ∇φ` without saying that `φ` is the map `(x, y) ↦ x/y` at `(E_π u, E_π w)`.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 Poisson martingale, martingale part, conditional variance | two-state `p = 1/3`, `q = 1/2`, `g = (12/25, −18/25)`; two exchange copies; `n = 0` | `P g = (2/25, −3/25)`; `h = (8/25, 9/25)`; both forms of the martingale part equal `Σ_{i≤n} g(X_i) − Σ_{i<n} (P g)(X_i)`; `D = 0`, `h = 0` | holds | none |
| 1.2 Poisson solution under `t_mix(1/4) ≤ T` | two-state; lazy 4-cycle; transient state; one state; identity kernel; 341 random chains, `T ≤ 8` | `d(t) = (3/5)(1/6)^t`; `Z f = (2, 0, −2, 0)`, oscillation `4 = 2Tc`; `Z f = (1/2, −1/2, 27/4)`; largest ratio oscillation/`2Tc` found `6/7` on random chains | holds, sharp | C01 |
| 1.2 stationarity Check | rows `(1/4,1/4,1/2)`, `(1/3,1/3,1/3)` twice, `π = (1/4,1/4,1/2)` | `Z f = (3/4, −9/52, −9/52)`; defect of the Poisson equation `−3/52` at every state | Check true | none |
| 1.3 `γ² Var_π g ≤ Var_π f` | two-state; exchange chain; 3-cycle; `γ = 0`; non-stationary `π` | `(25/36)(216/625) = 6/25`; `4 · 1/16 = 1/4`; `(9/4)(2/27) = 1/6 ≤ 2/9`; non-stationary: `γ = 25/24`, `625/1152 > 1/2` | holds; hypothesis needed | none |
| 2.1 bias and mean-square bound | 341 random chains, every start, `B ≤ 3`, `n ≤ 4`; two-state `B = 0`, `n = 1`; chain `0 → {1,2}`, `1 ↔ 2` | no violation; `E S² = 4/25` against `(√(42/125 + 18/25) + 6/5)²`; counterexample: `σ² = 0`, `E S² = 5/4 > 1` | holds; hypothesis needed | none |
| 2.1 stationarity Check | same non-stationary pair, `f = (−1, 1, 0)` | definition gives `1/2`; with the stationary law `(4/13, 4/13, 5/13)` it is `8/13` | Check true | none |
| 2.2 Hoeffding | 341 random chains, every atom `t ≥ c`; two-state `p = 3/10`, `q = 1/10`, `n = 20`, `t = 5`; `n = 0`, `c = 0` | no violation; probability `1165973576739823103/5000000000000000000 ≈ 0.2332 > e^{−8/5} ≈ 0.2019`; `Z f = (15/8, −5/8)`; right side `exp 0 = 1` | holds; `c` of `g` needed | N01 |
| 3.1 consistency of batch means | algebraic identity; moment bounds of steps 1 to 4; `b = 1`; `a = 2` fair bits; exchange chain; identity kernel | `σ̂² = (ΣB_k² − S_n²/a)/((a−1)b)`; `c⁴ ab(b−1)/8 / n² ≤ c⁴/(8a)`; limit `6/25 ≠ 42/125`; mean `1/4`, variance `1/8 − 1/(16b)`; `σ² = −1/4` | holds; Checks true | none |
| 3.2 confidence interval | `z < 0`, `z = 0`; exchange chain with `b = 2m` | empty interval, both sides `0`; event `{A_n = E_π f}`, limit `0`; `σ̂² = 0`, `A_n = 1/2`, probability `1` | holds; `σ² > 0` needed | none |
| 3.3 multivariate limit | reversible 3-state chain, `f = (1_a, (0,1,2))`; polarisation; `k = 1`; identity kernel | `Σ = [[7/16, −15/16], [−15/16, 39/16]]`, determinant `3/16`; `Q(u+v) − Q(u) − Q(v) = 2B(u,v)`; `(−1/4)` not positive semidefinite | holds | C02 |
| Layer 3 remark and Examples | path `a – b – c`; two-state | `σ² = 1/8`; `σ² = 42/125 = pq(2−p−q)/(p+q)³` | consistent with both suppliers | none |

- Source locators checked against the text: 11 (Rudolf Theorem 2.20 with (2.13)–(2.14), p. 24, and Theorem 3.34, p. 56; Flegal–Jones p. 2, (6) p. 7, p. 8, (7) p. 8, Remark 7 p. 9; Levin–Peres Notes to Chapter 12, p. 178; Aldous–Fill (2.6); Fan–Jiang–Sun related literature and Glynn–Ormoneit bibliographic data, in arXiv:1802.00211v4).
- Library declarations opened at the pin: 27 by `#check` or by file (among them `etvDist_eq_iSup_finPartition_enorm`, `martingalePart` at `Mathlib/Probability/Martingale/Centering.lean` line 127, `Kernel.IsIrreducible` at `Mathlib/Probability/Kernel/Irreducible.lean` line 56, `Kernel.toMatrix` with values in `NNReal`, `condExp_shift_iterate_markovChainLaw` at `TauCeti/Probability/MarkovChain/MarkovProperty.lean` line 157, `blockAverage` at `TauCeti/Probability/Process/BlockAverage/Basic.lean` line 61); all exist with the hypotheses the README states.
- Cross-roadmap citations resolved: MarkovChainMixing 1.2, 1.3, 2.1, 2.4, 4.3, 6.2, 6.3, 6.4 and MarkovChainsAndRenewal 3.5, MathematicalStatisticsFoundations 8.2–8.4 and 9.4, RandomMatrices 2.1 on main; MCMCAsymptoticVariance 1.1–1.3, 2.1, 2.2, 3.2 and MartingaleCentralLimitTheorem 4.1 at their open heads. The eight copied definitions agree character for character with their owners.
- Elaboration: `lake env lean` on `TauCetiRoadmap/MarkovChainMonteCarloGuarantees/Suggested.lean` gives eight `sorry` warnings and nothing else. Elaborated types compared with the README statements for all 19 declarations: the 11 definitions omit `[MeasurableSingletonClass S]`, which none of their bodies uses; the 8 theorems carry it. Nothing changed.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `simp` with the definitions unfolded) on a copy: none of the 8 theorems closes.
- Automatic checks: all passed on this head. Dependency check: `depcheck: 122 roadmaps, 1386 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Headline theorems (README): Poisson martingale (1.1), Poisson solution under a mixing-time bound (1.2) and by the spectral gap (1.3), mean-square error after burn-in (2.1), Hoeffding (2.2), batch means (3.1), interval (3.2), multivariate limit (3.3). All eight are stated; none is forced through a stand-in.
- Duplication by object: Poisson equation, fundamental matrix, batch means, asymptotic covariance, Hoeffding for chains and Cramér–Wold searched in every roadmap on main and at the open heads, and in the pinned Tau Ceti. MCMCAsymptoticVariance 1.2 has the series for `Z` for irreducible aperiodic chains and 2.1 the Poisson formula for irreducible chains; 1.2 here has other hypotheses (a mixing-time bound, no irreducibility) and the README says so in its scope.

Overlap check: read MCMCAsymptoticVariance, MartingaleCentralLimitTheorem, MarkovChainMixing (and MarkovChainsAndRenewal 3.5, MathematicalStatisticsFoundations 8.2–8.4); shared objects: fundamental matrix, Poisson equation, asymptotic variance — owner MCMCAsymptoticVariance, copied definitions only; distances, mixing time, spectral gap, ergodic theorem — owner MarkovChainMixing; the chain central limit theorem — owner MartingaleCentralLimitTheorem; batch means, the Poisson martingale as a stated target and the bounds on the Poisson solution — owned here, stated nowhere else.

Source independence: 8 passages compared with 5 sources, none shared (the longest common run is the standard phrase "minorization and drift conditions"); largest share Flegal–Jones, 5 of 11 locators; contents compared with Flegal–Jones (introduction, spectral variance methods, batch means, examples, appendices): independent, only 3.1 and 3.2 touch its Section 3.

Research link: The README's own sources: Layer 2 sits beside the explicit error bounds of Rudolf (2012, reversible chains) and the Hoeffding bounds of Glynn–Ormoneit (2002), León–Perron (2004) and Fan–Jiang–Sun (2021); Layer 3 is the output analysis of Flegal–Jones (2010); the limit theorem goes back to Gordin (1969). Rests on the README and the texts read.

## Not verifiable

- Fan–Jiang–Sun, JMLR 22 (2021), "Theorem 1, p. 5; Theorem 3, p. 6" and "Section 1, p. 4": the journal's copy is on a host the sources service does not classify; the arXiv version read (1802.00211v4) numbers its theorems 2.1–2.4 and has other pages. The content cited (bounds through the spectral gap; Glynn–Ormoneit placed among the minorization and drift methods) is in the version read.
- Glynn–Ormoneit (2002) and Gordin (1969): cited for attribution only; checked by their bibliographic data in the reference lists of texts read, not by their text.
- Authorship of the supplier roadmaps named in the description: not checked.

## Source issues

- none

## For the human reviewers

- **Scope.** The README marks 1.1, 1.2, 1.3, 2.1, 2.2, 3.1, 3.2 and 3.3 as "proved here"; the cited sources state neighbouring results (Rudolf Theorem 2.20 for reversible chains, Flegal–Jones for strong consistency), not these forms. Each was recomputed and no counterexample found.
- **Licence.** Fan–Jiang–Sun was read in its arXiv version 1802.00211v4, whose theorem numbers and pages differ from the JMLR version the README cites; the JMLR locators were not checked.
