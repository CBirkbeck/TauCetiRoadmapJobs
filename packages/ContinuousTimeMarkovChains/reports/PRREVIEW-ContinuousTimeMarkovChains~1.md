# Review of ContinuousTimeMarkovChains (pull request #2688 at 1a4c432)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every stated theorem, Check and worked value was recomputed and holds, including the degenerate cases (empty and one-point state space, `Q = 0`, `r = 0`, negative times, reducible and non-Metzler matrices); every locator into Levin–Peres and Kelly was read at its page and supports the statement; every cited Mathlib and Tau Ceti declaration exists at the pins with the hypotheses the README gives. There is one small correction (the word "communication" for a one-directional relation) and two format notes, none blocking. For the humans: the copy of Kelly's chapter that was read, and the citation of Norris without locators.

## C01 — "Communication" names the symmetric relation in the literature, but the relation defined in 1.1 is the one-directional "leads to"

A reader who knows the class structure of chains takes "communication" to mean that each of two states leads to the other, and looks in 1.1 for communicating classes that are not there. The heading of 1.1 (line 69), the layer guide (line 35), the title of Layer 4 (line 298) and the ownership sentence "the relation of communication and irreducible generators" (lines 486–487) all use the word for `LeadsTo`, which is not symmetric: in the absorbing example of the Checks of 1.1 the first state leads to the second and not conversely. Levin–Peres use "communicates" only for the two-sided relation (LPW line 1233, §1.7), and the README itself attributes "i leads to j" to Norris for the object it defines.

The smallest change: write "accessibility" or "the relation *leads to*" in those four places (for example "1.1 Q-matrices, Metzler matrices and the relation *leads to*"). No statement changes.

## N01 — The scope section dates itself

"(an open roadmap, not on main)", three times in lines 526–531, and "(on main)" in lines 520 and 524, describe the state of other roadmaps on the day of writing; once those merge the sentences are false. Naming the roadmap and its section is enough.

## N02 — The title writes "markov" in lower case

Line 1 and the pull request's title: a lower-case title still keeps the capital of a proper name ("continuous-time Markov chains"), as the body does for Kolmogorov and Poisson.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 definitions; irreducible generator ⇔ `1 + r⁻¹Q` irreducible | `[[−1,1],[2,−2]]`; `[[−1,1],[0,0]]`; one state; empty type; `C₃` | First irreducible; second: state 2 leads only to itself; one state `K = 1` has a loop, Mathlib needs positive-length paths: holds; empty: both vacuous | holds | C01 (name only) |
| 1.2 `exp(tB) ≥ 0` ∀ `t ≥ 0` ⇔ Metzler | `[[0,−1],[0,0]]`; `[[1,1],[0,1]]`; `t = −1` on `[[−1,1],[1,−1]]`; empty type | `[[1,−t],[0,1]]`, entry `−t < 0`; `e^t[[1,t],[0,1]] ≥ 0`; `(1−e²)/2 ≈ −3.19`; both sides true on empty | holds both ways | none |
| 1.3 `exp(tQ)` stochastic ∀ `t ≥ 0` ⇔ Q-matrix | `[[−1,1],[2,−2]]`; `[[−1,1],[0,−1]]`; one state | `P₁₂ = (1−e^(−3t))/3`, `P₁₁ = (2+e^(−3t))/3`, sum 1; `exp(B) = e⁻¹[[1,1],[0,1]]`, row sums `2/e`, `1/e`; `Q = 0`, `exp = 1` | holds | none |
| 2.1 forward and backward uniqueness | step function for `Q = 0`; closed form of 1.3 | Right derivative 0 everywhere but `P(1) = 2 ≠ 1`: within-`[0,∞)` derivative excludes it at `t = 1`; `P′₁₂ = e^(−3t) = P₁₁ − 2P₁₂` | holds | none |
| 2.2 continuous stochastic semigroup = `exp(tQ)`, unique Q-matrix | idempotent all-`1/2` family; empty type | Semigroup law and stochasticity hold, limit at `0⁺` is not `1`: continuity needed; empty: unique empty matrix, `∃!` true | holds | none |
| 3.1 uniformization, `r ≠ 0`, all real `t` | `[[−2,2],[1,−1]]` at `r = 2, 1`; `Q = 0`; `r = 0` | `K = [[0,1],[½,½]]`; `[[−1,2],[1,0]]`; `tQ = rt(K−1)` for any `r ≠ 0`; at `r = 0` series is `1`, entry 0 vs `(1−e⁻²)/2 ≈ 0.432` | holds; `r ≠ 0` needed | none |
| 3.1 API: `K` stochastic ⇔ Q-matrix with `−q_ii ≤ r` (`r > 0`) | entries of `K` | `K_ij = q_ij/r`, `K_ii = 1 + q_ii/r ≥ 0 ⇔ −q_ii ≤ r`, row sum `1 + (row sum of Q)/r` | holds | none |
| 4.1 `πQ = 0` ⇔ `π exp(tQ) = π` ∀ `t ≥ 0` | `(2/3,1/3)` with `[[−1,1],[2,−2]]`; rotation generator `R` | `(−2/3+2/3, 2/3−2/3) = 0`; `exp(R) = 1`, `(1,0)R = (0,2π)`, `exp(R/2) = −1` | holds; all `t` needed | none |
| 4.2 Metzler, `t > 0`: `exp(tB)_ij > 0` ⇔ `i` leads to `j` | absorbing matrix; `C₃`; one state; `i = j` | `P₁₂ = 1−e^(−t) > 0`, `P₂₁ = 0`; `q₁₃ = 0` but path 1→2→3; `e^(t b₁₁) > 0`, reflexive | holds | none |
| 4.3 unique stationary probability vector | birth–death 3×3; `C₃`; `Q = 0` on two states; empty type | `(4/7,2/7,1/7)Q = (0,0,0)`; uniform; every vector stationary; no vector sums to 1; route gives `μ = 1` by summing `Kᵀv = μv` | holds; both hypotheses needed | none |
| 4.4 `exp(tQ)_ij → π_j` | symmetric two-state; `Q = 0` | `P(t) = ½[[1+e^(−2t),1−e^(−2t)],…] → ½`, `K = [[0,1],[1,0]]` periodic; `P(t) = 1` no common rows; contraction factor `1 − |S|δ` from `P = δJ + (1−|S|δ)R` | holds | none |
| 5.1 detailed balance for `Q` ⇔ for `exp(tQ)`, `t ≥ 0` | birth–death; `C₃`; arbitrary real `π` | `4/7 = 4/7`, `2/7 = 2/7`; `1/3 ≠ 0`; `DQ = QᵀD ⇒ D exp(tQ) = exp(tQ)ᵀD`, no sign of `π` used | holds | none |
| 5.2 Kolmogorov's criterion (Metzler, irreducible, any index type) | absorbing matrix; `[[−2,1,1],[−1,0,1],[1,−1,0]]`; `C₃`; `n = 0`; empty type; stay-put steps | Cycle condition holds, `π₁ = 0` forced; signed weights `(1,−1,1)` balance, so all cycle products agree, no positive weights; `1 ≠ 0`; empty products `1 = 1`; diagonal factor equal on both sides | holds; both hypotheses needed | none |
| Lean signatures against the README | all 17 elaborated types | Definitions keep exactly the binders they use (`IsQMatrix` keeps `Fintype`); theorems keep `Fintype`, `DecidableEq`; 5.2 on any type as the README says | agree | none |

- Source locators checked against the text: 11 (LPW 6: lines 14016–14021, 14024–14040, 14054–14063; Kelly 5: lines 95–103, 229–247, 799–838, 848–851).
- Library declarations opened at the pins: 24 (Mathlib 17, among them `Matrix/Stochastic.lean:43`, `Matrix/Irreducible/Defs.lean:83,116,207`, `SpecialFunctions/Exponential.lean:382,386`, `Calculus/MeanValue.lean:360`, `ODE/ExistUnique.lean:194`; Tau Ceti 7, among them `PerronFrobenius/Irreducible.lean:137,157`, `Semigroups/UniformlyContinuous.lean:233`, `Semigroups/BoundedGenerator/Basic.lean:69,151`, `Semigroups/CauchyProblem/Uniqueness.lean:80`).
- Cross-roadmap citations resolved: 6 (MarkovChainsAndRenewal Layer 3 and scope, StochasticCalculus §0.6, OneParameterSemigroups Part A in `Completed/`, MarkovChainMixing scope, LinearSystemsAndControl Layer 5, PopulationDynamics §3.3).
- Duplication by object: no other roadmap, on main or open, and neither pinned library, states Metzler matrices, Q-matrices, uniformization or Kolmogorov's criterion.
- Dependency check: `depcheck: 191 roadmaps, 2119 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: 12 `sorry` warnings and nothing else.
- One-tactic probe (`simp`, `rfl`, `infer_instance`, `simp` with the five definitions unfolded) on a copy: all 12 theorems remain open; no padding. All 12 headline theorems of the README are stated; none is declared not statable.
- `#check`-level comparison of the 17 elaborated types with the README: no dropped hypothesis; nothing changed.

Overlap check: read MarkovChainsAndRenewal (main and its open revision), MarkovChainMixing, PopulationDynamics, DiscreteQuantumWalks, MartingaleCentralLimitTheorem; nothing shared.

Source independence: 16 passages compared with 2 sources, none shared; largest share LPW, 6 of 11 locators; contents compared with LPW (Chapter 20: §§20.1–20.4): independent. Norris was not read.

Research link: The headline targets are the finite-state facts behind continuous-time mixing (Levin and Peres 2017, Theorems 20.1 and 20.3) and reversibility of Markov processes and stochastic networks (Kelly 1979, Theorems 1.3 and 1.8); rests on LPW §20.2 and Kelly §§1.2, 1.5 as read.

## Not verifiable

- Norris, *Markov Chains* (1997), Chapters 2 and 3: cited in prose without locators for the term "i leads to j" (1.1) and for positivity of `P(t)` for Q-matrices (4.2); no legal copy of those chapters was found, so the attributions were not checked. No stated result rests on them.

## Source issues

- **Gap** in LPW at §20.1, printed page 281: the source says the uniformizing rate is the largest total jump rate and divides by it, without excluding the case where every rate is zero; it should take any positive rate at least that large; affects nothing.

## For the human reviewers

- Licence: Kelly's Chapter 1 was read in the Internet Archive's copy of the file on the author's page (the author's server failed certificate verification); the README (lines 603–606) says it is posted with the copyright holder's permission.
- Not tested: Norris 1997 is cited in prose for two attributions (README lines 77 and 325) and its text was not read.
