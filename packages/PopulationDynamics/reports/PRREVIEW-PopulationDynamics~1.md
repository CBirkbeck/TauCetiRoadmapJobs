# Review of PopulationDynamics (pull request #2513 at 61cf2e9)

**Verdict:** needs changes

**Summary.** Changes are needed, for one sentence only: the list of equilibria of the competition system in 2.4 is false when `a b = 1` and `K₁ = a K₂`, where a whole segment of equilibria appears. Every stated theorem, formula, Check and worked example that I recomputed is correct, all 51 source locators support the statements as written, and `Suggested.lean` elaborates with `sorry` as its only warning. There is one format note and no small correction; two facts about scope and source copies are left for the human reviewers.

## R01 (P2) — The list of equilibria of the competition system in 2.4 is false when `a b = 1` and `K₁ = a K₂`

The opening paragraph of 2.4 (README lines 362–364) is stated for all positive `r₁, r₂, K₁, K₂, a, b` and says that the equilibria in the closed quadrant are `(0, 0)`, `(K₁, 0)`, `(0, K₂)` "and, when the two numbers below are positive, the interior equilibrium". A reader takes this as the complete list, and the second bullet ("its limit is an equilibrium") is then read against it.

Take `a = b = 1` and `K₁ = K₂ = 1`. The field is `(r₁ x (1 − x − y), r₂ y (1 − x − y))`, which vanishes on the whole segment `x + y = 1`, `x, y ≥ 0`; for instance `(½, ½)` is an equilibrium. The two numbers `(K₁ − a K₂)/(1 − a b)` and `(K₂ − b K₁)/(1 − a b)` are `0/0 = 0`, not positive, so the sentence asserts that there are exactly three equilibria. In general the two nullclines `x + a y = K₁` and `b x + y = K₂` coincide exactly when `a b = 1` and `K₁ = a K₂`. The three convergence theorems are unaffected: each assumes two strict inequalities that exclude this case, and the convergence bullet stays true.

Smallest change: add the exception to that sentence, for example "… unless `a b = 1` and `K₁ = a K₂`, when every point of the segment `x + a y = K₁` is an equilibrium", or restrict the sentence to `a b ≠ 1`.

## N01 — The Hardy–Weinberg law in 3.1 is attributed to Hardy and to Weinberg, 1908, but neither paper is in the References

Either list the two papers or drop the year; as it stands the attribution cannot be followed.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 1.1 kernel, generating function `(f s)^n` | `ν = ½δ_0 + ½δ_2` from 2; `δ_0`, `δ_1`; `ν{2^j} = 2^(−j)` | next state 0, 2, 4 with ¼, ½, ¼; power 0 is `δ_0` (absorbing), power 1 is `ν`; `m = Σ 1 = ∞` | holds | none |
| 1.2 `E[s^(Z n)] = f^[n] s`, mean, variance | `n = 0, 1, 2`; `ν = ¼δ_0 + ¼δ_1 + ½δ_2`; `δ_0`; `m = ∞` | `σ² = 9/4 − 25/16 = 11/16`; `Var Z_2 = (11/16)(45/16) = 495/256`; recursion `σ² m^n + m² Var Z_n` reproduces the sum; `0^0 = 1` | holds | none |
| 1.3 martingale `Z n / m^n` | `δ_2`; `δ_0` (`m = 0`); `m = ∞` | constant 1; values 1 then `0/0 = 0`, excluded by `m ≠ 0`; not integrable, excluded by `m ≠ ⊤` | holds | none |
| 1.4 least fixed point; `q = 1` iff `m ≤ 1`, `p_1 ≠ 1`; dichotomy | `δ_1`; `δ_0`; `(⅛, ⅜, ⅜, ⅛)`; `½δ_0 + ½δ_2`; binary splitting | `q = 0`, least fixed point 0; `q = 1 = f`; `s³ + 3s² − 5s + 1 = (s − 1)(s² + 4s − 1)`, `q = √5 − 2`; `(1 − s)²/2` | holds, both directions | none |
| 1.5 `L²` limit `W` | `δ_2`; `¼δ_0 + ¼δ_1 + ½δ_2` | `Var(Z_n/m^n) = σ² Σ_{j=2}^{n+1} m^(−j) → σ²/(m(m − 1))`; `0/(2·1) = 0`; `(11/16)/(5/16) = 11/5` | holds | none |
| 1.6 geometric law | `p = ⅓, ½, 1, 0`; identity for `S_n` | `f(S_n/S_(n+1)) = S_(n+1)/S_(n+2)` reduces to `p = p`; `p = ⅓`: ⅓, 3/7, 7/15 by iteration and by formula; `p = 0`: 0 then 1 | holds | none |
| 2.1 half-line existence | `v = x²`, `x₀ = 1`; `v = −x`, `K = [0, 1]`; `x₀ ∉ K` | `1/(1 − t)` leaves every compact before 1; `exp(−t)` stays; hypothesis false, statement vacuous | holds | none |
| 2.2 logistic iff | `x₀ = 0, K, ½`; `x₀ < 0` | denominator `x₀(1 − e^(−rt)) + K e^(−rt) > 0`; formula 0, `K`, `1/(1 + e^(−t))`; pole at positive time | holds, both directions | none |
| 2.3 first integral, periodicity, Volterra | derivative along the field; opposite signs; `α = β = γ = δ = 1` from `(½, ½)`; axis `x = 0` | `(δx − γ)(α − βy) + (βy − α)(δx − γ) = 0`; `2(αδx − βγy)`; period 6.6940 by Runge–Kutta; `u v′ − v u′ = δ y u² + β x v²` | holds | none |
| 2.4 competition | `(2, 3/2, ½, 2/5)`; `(1, 1, 3/2, 2)`; `a = b = 1`, `K₁ = K₂` | `(25/16, 7/8)`; `(¼, ½)`; `P′ = −(r₁/K₁)(xP + a y Q)`; segment `x + y = 1` of equilibria | theorems hold; equilibria sentence false | R01 |
| 2.5 SIR conserved quantity, peak, final size | `(β, γ, S₀, I₀) = (2, 1, .99, .01)`, `(1, 2, .9, .1)`; data of the Examples | derivative `−γI + ρβI = 0`; peak 0.15845, `s = 0.19979`; `s = 0.82431`; 17790.53 and 1704.43 | holds | none |
| 2.6 SIS | `β = 2, γ = 1`; `β = γ = 1`; `β < γ` | `(β − γ) i − β i²` both sides; `1/(2 + t)`; denominator `K < 0` decreasing, limit 0 | holds | none |
| 3.1 Hardy–Weinberg | `(½, 0, ½)`; `(1/5, 3/10, 1/2)`; `(0, 1, 0)` | `(¼, ½, ¼)`; `p = 7/20`, `(49, 182, 169)/400`; `(¼, ½, ¼)` | holds | N01 |
| 3.2 Wright–Fisher | `N = 0, 1, 2`; `N = 5`, `i = 2`; `i > N` | `E[B(N − B)] = N(N − 1)x(1 − x)`; iterated matrix gives 0.4000 = 2/5; `N = 0`: `0 = 0` | holds | none |
| 3.3 birth–death, Moran | `d 1 = 0`, `N = 2`; `N = 3, i = 1, r = 2`; neutral `N = 2, 4, 5, 7`, all `i` | `φ 2 = 1`; `4/7`; up/down ratio `1/r`; exact linear solve equals the formula for every `i` (28/3 at `N = 4`, `i = 2`) | holds | none |
| 3.4 coalescence times, segregating sites | `n = 0, 1, 2`; `θ = 0, 1`; `n = 10` | `Σ 2/(k(k − 1)) = 2(1 − 1/n)`; both generating functions `∏ j/(j + θ(1 − s))`; geometric variance `θ/j + θ²/j²`; `H_9 = 2.82897` | holds | none |
| Headline: Lotka–Volterra existence and uniqueness, Lean form | `∃!` with `z 0 = z₀`, all four parameters positive | hypotheses of README and Lean agree; sublevel sets compact in the open quadrant | holds | none |
| Headline: Moran fixation, Lean form | `i = 0`, `i = N`, `r = 1` | `0/φ N = 0`; `1`; sum form gives `i/N` where the closed form is `0/0` | holds | none |

- Source locators checked against the text: 51 (Lyons–Peres 12, Durrett PTE 13, Durrett DNA 12, Teschl 6, Weiss 8); all support the statements as written. Lyons–Peres was read in the authors' version of 19 August 2026, whose numbering in Section 5.1 and the exercises agrees with the README's.
- Library declarations: all 49 cited ones located at the pins (31 in Tau Ceti, 18 in Mathlib) and the statements of 38 read (for example `TauCeti/Geometry/Manifold/IntegralCurve/Maximal.lean:367`, `TauCeti/Probability/MarkovChain/MarkovProperty.lean:157`, `TauCeti/Probability/MarkovChain/Visits.lean:167`, `TauCeti/Probability/GeneratingFunction.lean:192, 266, 366, 421, 444, 467`) and 18 in Mathlib (for example `Mathlib/Analysis/ODE/ExistUnique.lean:194`, `Mathlib/Probability/Distributions/Geometric.lean:52`, `Mathlib/Probability/Martingale/Convergence.lean:213`); every hypothesis of the supplier contracts that I read agrees.
- Duplication by object: neither pinned library states the Galton–Watson process, the Lotka–Volterra, logistic or SIR equations, the Wright–Fisher or Moran chains, birth–death fixation or coalescence times; Tau Ceti has global solutions only for globally Lipschitz fields and the manifold escape lemma, so 2.1 is not a restatement.
- Cross-roadmap citations resolved on main: MarkovChainsAndRenewal Layer 0 item 3 and Layer 1 item 1, StochasticCalculus 2.3 (gambler's ruin), RegretMinimizationAndEquilibria (scope).
- Dependency check: `depcheck: 200 roadmaps, 2183 edges, 0 problem(s)`; no UPWARD or CYCLE line. The only roadmap supplier, MarkovChainsAndRenewal, is on main.
- Elaboration of `TauCetiRoadmap/PopulationDynamics/Suggested.lean`: 32 `sorry` warnings and nothing else. `#check`-level comparison of the 50 elaborated types with the README: no lost binder, coercions `↑j + 2` in `coalescentTimes` and `↑↑j + 2` in `treeLength` are the intended ones.
- One-tactic probe on a copy: none of the 32 theorems closes by `rfl` or by `simp`. Every headline theorem of the Summary is stated; the module docstring's claim that all are statable holds.
- Pull-request text against the head: no sentence contradicted; nothing outside the roadmap folder is changed; the automatic checks all passed.

Overlap check: read MarkovChainMixing, PointProcesses, HiddenMarkovModels, MarkovChainsAndRenewal, StochasticCalculus, MarkovDecisionProcesses; one shared object: PointProcesses Layer 12 states that the generation sizes of the Hawkes family tree form a Galton–Watson process with Poisson offspring and says it is not a branching-process library, so the general process is owned here and the Poisson family tree there; nothing else shared.

Source independence: 56 passages compared with 5 sources (the 51 locators and 5 further passages: the Summary, the Conventions on chains, the route of 2.1, and two docstrings), none shared; largest share PTE, 13 of 51 locators; contents compared with PTE (Chapters 4 and 5) and with DNA (Chapter 1, Sections 1.2 to 1.5): independent.

Research link: Layer 1 is the second-moment case of the Kesten–Stigum theorem (Lyons and Peres 2016, Section 5.1 and Chapter 12); 3.4 gives the coalescence times of Kingman's coalescent and Watterson's formulas as in Durrett 2008, Chapter 1. It rests on the sources read.

## Not verifiable

- The sentence of "Provenance and prior work" that no entry on the probability theory page of the Isabelle Archive of Formal Proofs concerns branching processes or population genetics: the Archive was not consulted.
- The numbering of the 8 November 2016 version of Lyons–Peres that the README names: only the later authors' version was read, and its numbering agrees at every cited item.

## Source issues

- **Misprint** in DNA at the proof of Theorem 1.32, printed page 48: the source says the rate of leaving state j is j(2N − j)/2N; it should be 2j(2N − j)/2N, as the same proof uses for (1.39); affects nothing.

## For the human reviewers

- Scope: several targets are exercises or problems in the cited textbooks (Teschl Problems 1.15 and 7.2; Lyons–Peres Exercises 5.27 and 5.28), and 3.1 is elementary algebra; the sources are refereed textbooks and one expository article (Weiss).
- Licence: Durrett's two books were read from the author's university page and Weiss from the journal's own site; I classed both hosts myself as author-page copies.
