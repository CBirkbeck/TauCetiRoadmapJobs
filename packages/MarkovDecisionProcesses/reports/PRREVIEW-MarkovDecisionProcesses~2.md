# Review of MarkovDecisionProcesses (pull request #2481 at 5ee1415)

**Verdict:** accepted

No findings. Both findings of the previous review (at `6ca8483`) are repaired; the first two rows of the table record how.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Previous R01 (finite `S` only) | README line 58 "`S` is a nonempty countable type"; `Suggested.lean` line 58; `S = ℕ` shift, reward `(−1)^n` | `(−1)^n + γ(−1)^(n+1)/(1+γ) = (−1)^n/(1+γ)`; `bellman` now on `lp ∞`, `[Fintype S]` only in 9 theorems | repaired | none |
| Previous R02 (law of later actions) | README lines 185–188 "the action at time `n + 1` has conditional law `π.next n (h, sₙ₊₁)`"; line 288 "given the history and the state `sₙ`" | `trans s a = pure a`: action at `n+1` is `π (n+1)` of the new state, as the bullet now states | repaired | none |
| 1.1 `trajLaw`, tail bound | `N = 0`; one state reward `c`; `S` or `A` empty with `R < 0` | `Σ_{n≥N} γ^n R = γ^N R/(1−γ)`; `c/(1−γ) − c(1−γ^N)/(1−γ) = cγ^N/(1−γ)`; elaborated type keeps `[Nonempty S] [Nonempty A]`, so `R ≥ 0` | holds | none |
| 1.1 `trajLaw_ofStationary` | two-state swap; general | `P(sₙ₊₁ = s' | s₀..sₙ) = Σ_a π sₙ a · trans sₙ a s'`, the row of `(π s).bind (trans s)` | holds | none |
| 1.2 contractions, fixed points | one state one action; `γ = 0`; `γ = 1`; shift on `ℕ` | `T v − T w = γ(v − w)`; `T v = max_a reward`; `T^k 0 = k`, no limit, `hγ` in every statement; fixed point norm `1/(1+γ)` | holds | none |
| 1.2 `norm_value_le` | `S = ∅`, `R = −1` | would give `0 ≤ −1/(1−γ)`; excluded: signature keeps `[Nonempty S] [Nonempty A]` | holds | none |
| 1.2 `value_eq_inverse` | two-state swap | `(1−γP)⁻¹ = (1+γP)/(1−γ²)`: rows `(1,γ)/(1−γ²)`, `(γ,1)/(1−γ²)`; `‖γP‖ = γ < 1` | holds | none |
| 1.3 `expectedReturn_eq_value` | alternating chain, rewards `1, 0`; shift on `ℕ` | `V₀ = 1 + γV₁`, `V₁ = γV₀`: `(1/(1−γ²), γ/(1−γ²))`; `Σ_k γ^k(−1)^(n+k) = (−1)^n/(1+γ)` | holds | none |
| 2.1 `backwardInduction` | `γ = 1`, `N = 2`, `g = (2,0)`, `trans s a = pure a`; `N = 0` | `T g = max(0+2, 1+0) = 2`, `T² g = max(2, 1+2) = 3`; play `1,0`: `1+0+2 = 3`; index `T^n g`: `0+1+0 = 1`; `N−n−1` has no junk for `n < N` | holds | none |
| 3.1 optimality (four theorems) | same MDP; alternating Markov policy; shift on `ℕ` with two actions | `V⋆ = 1/(1−γ)`; alternating return `Σ γ^(2k) = 1/(1−γ²) < 1/(1−γ)` for `γ > 0`; greedy for own value gives `T V^π = V^π` | holds | none |
| 3.2 `optimalQ_apply`, `maxQ_optimalQ` | same MDP; `γ = 0`; min in place of max | `Q⋆(s,1) = 1/(1−γ)`, `Q⋆(s,0) = γ/(1−γ)`; `H q = reward`; with min: `m = min(γm, 1+γm) = 0`, `Q = (1, 0)` | holds | none |
| 3.3 `value_le_of_improve` | strict state `s` | `V^(π') = lim (T^(π'))^k V^π ≥ T^(π') V^π > V^π` at `s` | holds | none |
| 3.3 `occupancy`, `performanceDifference` | `π = 0`, `π' = 1`; `π' = π`; `γ = 0`; alternating chain; shift | left `1/(1−γ)`, right `1/(1−γ)·1`; `0 = 0`; Dirac at `s`; masses sum `(1−γ)(1+γ)/(1−γ²) = 1`; `(1−γ)γ^n` | holds | none |
| 4.1 `value_greedy_le`, eventual optimality | `v = V⋆`; `γ = 0`; countable counterexample | bound `0`; at state `n`: action `0` gives `1/n`, action `1` gives `γ^(k+1)`, so `1` is greedy for `n > γ^(−k−1)` | holds | none |
| 4.2 `policyIteration_rate`, `_terminates` | general; `|S| = |A| = 1`; no tie rule | `0 ≤ V⋆ − V^(π_{k+1}) ≤ T V⋆ − T V^(π_k)`; non-optimal `π_k` forces `k + 2 ≤ |A|^|S|` distinct policies; bound `1` | holds | none |
| 5.1 primal (two theorems) | `v = R/(1−γ)`; `μ s₁ = 0` | `r + γR/(1−γ) ≤ R/(1−γ)`; raising `v s₁` by `δ` changes its own constraint by `δ − γpδ ≥ 0`, objective unchanged | holds | none |
| 5.2 dual (four theorems) | `μ` with a negative entry; two-action MDP, `μ = (1/2,1/2)`, `π = 1`; sum precedence in `IsFeasibleOccupancy` | `d = Σ_a x ≥ 0` solves `d − γ d P^π = μ` uniquely; `x(0,1) = 1/2`, `x(1,1) = 1/2 + γ/(1−γ)`, reward `1/(1−γ)`; `(∑ a, x) − γ * ∑ …` | holds | none |
| 6.1 `ae_tendsto_zero_noise` | `w = 0`; `α = 1`; `α t = 1/(t+2)²`; non-measurable `B` | stopped martingale `E M² ≤ k·k`; `W(t+1) = w t`; `Π_{n≥2}(1−1/n²) = 1/2`; route uses `P[(w t)² | ℱ t]`, not `B` | holds | none |
| 6.2 `ae_bddAbove_asyncSA` | `β = 1`, `F x = x+1`; `B < 0`; arbitrary `F`, `τ` | `x(t+1) = x t + α t` unbounded; variance then `≤ A`; `G t` is `ℱ t`-measurable from `adapted_x` alone | holds | none |
| 6.2 `ae_tendsto_asyncSA` | `F = id`, `β = 1`; `τ = 0`, `F x = x/2`; `β < 0` | limit `x₀ + Σ w_t/(t+1)` random; `x t = 1/2 ≠ 0`; `β < 0` unsatisfiable on nonempty `ι`; `D = (1+β)‖x⋆‖_ξ` | holds | none |
| 6.3 `qLearning_ae_tendsto` | noise moments; wrong-law sampler; `rew = reward`; event `α = 0` | `w² ≤ 2(rew−reward)² + 8γ²‖q‖²`, so `≤ 2C + 8γ²‖q t‖²`; `Q⋆(0,1) = γ/(1−γ)` versus limit `0`; `R + γm ≤ m`; update reads `q(t+1) = q t` | holds | none |
| 6.4 `td0_ae_tendsto` | alternating chain; `γ = 0`; deterministic case | limit `(1/(1−γ²), γ/(1−γ²))` as 1.3; `v t s → r^π s`; noise `0` | holds | none |

- Source locators checked against the text: 13 of 37 (Tsitsiklis1994 lines 129–148, 162–172, 177–182, 339–346, 420–422, 440–446; WatkinsDayan1992 lines 45–71, 107–109; Sutton1988 lines 304, 1299; KakadeLangford2002 lines 71, 360–363; JaakkolaJordanSingh1994 lines 215–221, 325).
- Library declarations opened at the pins: 27, all present with the stated hypotheses (`Contracting.lean:259,286,295,302`; `lpSpace.lean:92,450,600,1357`; `Bochner/Basic.lean:1002`; `Normed.lean:419`; `Units.lean:97`; `Comp.lean:238`; `Traj.lean:519,687,763,785`; `Convergence.lean:195`; `Stopping.lean:75,839`; `HittingTime.lean:66`; `Adapted.lean:104`; `MarkovChain.lean:161,340,437`; `MarkovProperty.lean:157`; `PMF.lean:44,50`; `Matrix.lean:44,94,114`).
- Cross-roadmap citations resolved: 2 (MarkovChainsAndRenewal on main, Layers 2 and 3; FirstOrderOptimization at its open head, Layer 5, 5.1); neither is a supplier.
- Dependency check: `depcheck: 237 roadmaps, 2516 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate at this head: every check passed. Elaboration of `Suggested.lean`: 36 `sorry` warnings, nothing else.
- Signatures: all 64 elaborated types compared with the README; the 22 dropped binders are on definitions that do not use them (`[Nonempty S]`, `[Nonempty A]`, `[Countable S]`, `[MeasurableSingletonClass S]`); every theorem keeps all section instances. Nothing changed.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `aesop`) on a scratch copy: none of the 36 sorried theorems closes; no library declaration at the pins states a target.
- Pull-request text read against the head and the folder's change: no sentence contradicted, nothing left out.

Overlap check: read FirstOrderOptimization, DenoisingDiffusion, PointProcesses, MarkovChainsAndRenewal, StochasticCalculus, OptimalTransport; nothing shared (the Robbins–Siegmund theorem and stochastic gradient descent are FirstOrderOptimization's, chain classification and equilibrium are MarkovChainsAndRenewal's, and this README defers both).

Source independence: 14 passages compared with 5 sources (Tsitsiklis1994, WatkinsDayan1992, Sutton1988, KakadeLangford2002, JaakkolaJordanSingh1994), none shared; largest share Puterman1994, 20 of 37 locators; the text and contents of Puterman1994 could not be read, so the arrangement was not compared with it.

Research link: Layer 6 states Theorems 1, 3 and 4(a) of Tsitsiklis 1994 and the Q-learning theorem of Watkins and Dayan 1992; 3.3 is Lemma 6.1 of Kakade and Langford 2002, used there for conservative policy iteration. Rests on sources read: Tsitsiklis1994 lines 167–172 and 440–446, KakadeLangford2002 line 360.

## Not verifiable

- Puterman 1994 (20 locators: Sections 2.1.6, 5.3, 6.9.1; Theorems 4.5.1, 6.1.1, 6.2.2, 6.2.5, 6.2.6, 6.2.7, 6.2.10, 6.3.1, 6.4.2, 6.4.6, 6.9.1, 6.9.4; Propositions 6.2.4, 6.4.1): the publisher's page refuses access and no legal copy was found.
- Bertsekas and Tsitsiklis 1996, Proposition 4.4: no legal copy found.
- Howard 1960, Chapter 7: no legal copy found.
- Singh and Yee 1994, Main Theorem: the publisher's page is paywalled; the author's page did not resolve.
- Jaakkola, Jordan and Singh 1994, Theorems 2 and 3: read in the technical-report version on an author's page; that its numbering equals the journal's was not checked.

## Source issues

- none

## For the human reviewers

- **Not tested.** Puterman1994 has the largest share of the locators (20 of 37); neither its text nor its table of contents could be read legally, so wording and arrangement were not compared with it.
- **Licence.** `TauCetiRoadmap/MarkovDecisionProcesses/README.md` lines 786–788 name rl-theory-in-lean (Lean 4, MIT) as formalizing the Q-Bellman contraction and Q-learning; `Suggested.lean` was not compared with that repository.
- **Scope.** `metadata.toml` gives `math.OC`; 4.1, 4.2, 6.3 and 6.4 are convergence theorems about value iteration, policy iteration, Q-learning and TD(0), stated as sequences with no procedures.
