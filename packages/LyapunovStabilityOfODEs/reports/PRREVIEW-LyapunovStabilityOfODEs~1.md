# Review of LyapunovStabilityOfODEs (pull request #2748 at f5e7198)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement, Check and worked example was recomputed (degenerate cases, the Lie-derivative identities, the matrix identities of Layer 5, the numerical values) and all hold; `Suggested.lean` elaborates with `sorry` as its only warning and no theorem closes under a one-tactic probe. There are no small corrections and two format notes, neither blocking. One thing is left for the human reviewers: Teschl's book, which carries 14 of the 23 source locators, could not be read through the sources service, so its locators and wording are unchecked; all of Sontag's were read and agree.

## N01 — The scope section describes the two suppliers by their merge status

In "Left to other roadmaps" (lines 612 and 616) LinearSystemsAndControl and PopulationDynamics are each called "an open roadmap, not on main, on which this one depends". The sentence becomes untrue the day they merge. Dropping the parenthesis loses nothing: the supplier contracts already name the sections consumed.

## N02 — The field of the Check "convergence without stability" in 1.3 has no stated value at the origin

The field is given in polar coordinates (line 142) and called "`C¹` away from the origin". In Cartesian coordinates its components contain `x²/r` and `x y/r`, which extend continuously by `0` but are not differentiable at `0`, so the field lies outside the standing hypothesis of the Conventions and is a total function only once `f 0 = 0` is said. Would you add "extended by `0` at the origin, where it is continuous; only the definitions of Layer 1, which assume nothing of `f`, are being tested"?

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 forward solutions | `x²` from `a>0`, `a≤0`; shift by `s≥0` | `a/(1−at)` blows up at `1/a`; for `a≤0` denominator `1+|a|t>0`, limit `0`; shift lands on `Ici(−s) ⊇ Ici 0` | holds | none |
| 1.2 Lyapunov stability | `x²`, `ax`, oscillator, `E=0`; stable ⇒ `f x₀=0` | no solution from `a>0` so unstable; sup-norm `δ=ε/√2` since `‖·‖_∞ ≤ ‖·‖₂ ≤ √2‖·‖_∞`; `γ≡x₀` forces `f x₀=0` | holds | none |
| 1.3 asymptotic, global | polar field; `−x+x²` from `1.1` | `θ'=1−cos θ≥0`, max distance `2 sin(π/2)=2>1.999`; `u=1/x` gives `u'=u−1`, blow-up `log 11=2.3979` | holds | N02 |
| 1.4 exponential | `−x³`; `C` sign; radius `min δ (ε/(|C|+1))` | `a/√(1+2a²t)` solves; `√t·x`: `0.70535` (`a=0.1`), `0.70704` (`a=0.5`), limit `0.70711`; `|C|ε/(|C|+1)<ε` | holds | none |
| 2.1 complete orbits | `−x` on `[−1,1]`; `x²` on `ℝ`; circle | `{0}`; `{0}` (blow-up at `1/a`, backward for `a<0`); whole circle; compact `S` ⇒ largest invariant subset | holds | none |
| 2.2 ω-limit set | `f=1`; `−x`; oscillator; `E=0` | `Ω=∅` unbounded case; `{0}`; unit circle; constant curve gives `Ω={0}` | holds | none |
| 3.1 Lyapunov stability theorem | `V=1−x²`, `V=−x²` with `f=x`; oscillator; predator–prey `H`; `E=0` | Lie derivatives `−2x²`, `−2x²`, `2xy−2yx=0`, `(δx−γ)(α−βy)+(βy−α)(δx−γ)=0`; route's `ρ<min ε r` gives strict `<ε` | holds | none |
| 3.2 asymptotic stability theorem | oscillator; `−x³` with `x²`; Lean drops the condition at `x₀` | `0`; `−2x⁴`; at `x₀` `V` has a minimum so `fderiv V x₀=0`, condition automatic | holds; README = Lean | none |
| 3.3 LaSalle | `f=1`, `V=−x`; damped oscillator; constant `V` | Lie `−1`, `Z=∅`; Lie `−2x₂²`, `Z∩`complete orbits `={0}`; norms at `t=60`: `1.2e−13`, `3.6e−13`, `7.8e−13` | holds | none |
| 3.4 Barbashin–Krasovskii | non-radially-unbounded example; `E=0` | Lie `=−12x₁²/(1+x₁²)⁴−4x₂²/(1+x₁²)²` matches; at `t=10⁴`: `x₁=39266, 19561, 78827`, `x₂=1.96, 0.98, 3.94` | holds | none |
| 4.1 Chetaev | saddle; `x³`; `−x` with `−x²`; `V x₀>0`; `E=0` | `2x²+2y²`; `2x⁴`; `{V>0}=∅`; `V x₀>0` forces `f x₀≠0`; in `E=0` hypotheses contradictory | holds | none |
| 5.1 indefinite Lyapunov equation | block `J⊕[1]`; `diag(1,0)`; `J` alone; route | `diag(0,0,2)` both sides; `diag(2,0)` both sides; `P=−I` gives `0=0`, negative definite; `Bᵀ P+P B=Q ⇔ Aᵀ P+P A=cP+Q` | holds | none |
| 5.2 exponential stability | damped pendulum; `−x+1`; `n` empty | `Aᵀ P+P A=−I` for `P=[[3/2,1/2],[1/2,1]]`; fitted rate `−0.5002`; spectrum empty, `E=0` trivially stable | holds | none |
| 5.3 instability | inverted pendulum; `x−x³`; `[[1,−1],[1,1]]`; `f x₀≠0` | eigenvalues `±1`; `f'(±1)=−2`; `1±i`; Lie of `V` `=cV+wᵀQw+2wᵀPg` | holds | none |

- Source locators checked against the text: 11 in Sontag (Definition 5.5.2 p. 211; Remark 5.7.2 and Theorem 17 p. 220; Lemma 5.7.8 p. 226; Example 5.7.11 p. 228; Theorem 19 p. 234; Proposition 5.8.5 p. 236; Definition 5.8.6 and Theorem 20 p. 237; Corollary 5.8.7 p. 238), all agree; 0 in Teschl.
- Library declarations opened at the pins: 28 in Mathlib (for example `IsIntegralCurveOn`, `Mathlib/Analysis/ODE/Basic.lean:44`; `antitoneOn_of_hasDerivWithinAt_nonpos`, `Mathlib/Analysis/Calculus/Deriv/MeanValue.lean:499`; `exists_forall_mem_closedBall_eq_hasDerivWithinAt_lipschitzOnWith`, `Mathlib/Analysis/ODE/ExistUnique.lean:79`) and 9 in Tau Ceti (for example `setOf_mapClusterPt_atTop_eq_iInter`, `TauCeti/Topology/OmegaLimit.lean:75`; `exists_tendsto_atTop_of_antitone`, `TauCeti/Dynamics/Flow/Lyapunov.lean:124`); every name is where the README says and states what the README says. No stability notion exists in either library.
- Cross-roadmap citations resolved at the open heads: PopulationDynamics 2.1 and 2.3; LinearSystemsAndControl 5.1 (`IsHurwitz`, same expression as written out here) and 5.2 (`isHurwitz_iff_forall_posDef_exists_posDef`, `lyapunov_eq_iff`). Both roadmaps exclude this subject in their scope sections.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`.
- Elaboration: `Suggested.lean` gives 7 `sorry` warnings and nothing else; `#check @name` on all 13 declarations agrees with the README statements, no binder lost; the probe (`simp_all`, `rfl`, `infer_instance`, `exact?`) closes none of the 7 theorems.
- Automatic checks: all passed; no change outside the folder; the description agrees with the head.

Overlap check: read LinearSystemsAndControl, PopulationDynamics, OneStepMethodsForODEs, StochasticApproximationAveraging; Hurwitz matrices and the Lyapunov equation are owned by LinearSystemsAndControl 5.1–5.2 and existence on `[0, ∞)` by PopulationDynamics 2.1, both cited here and not restated; nothing else shared. No roadmap on main is close.

Source independence: 10 passages compared with 1 source (sontag-mct-1998), none shared beyond formulas; largest share Teschl, 14 of 23 locators, text and table of contents not readable; by the README's own locators the layers do not follow it (Layer 1 ↔ §6.5, Layer 2 ↔ §6.3, Layer 3 ↔ §6.6, Layer 5 ↔ §6.5 and Sontag §5.8, Layer 4 ↔ Sontag §5.8): independent as far as tested.

Research link: Layers 3 to 5 are the Lyapunov-function and linearization theorems that Sontag (1998, §5.7–5.8) uses for feedback stabilization (control-Lyapunov functions, Theorem 19, Corollary 5.8.8); rests on sontag-mct-1998, pp. 220–238.

## Not verifiable

- Teschl, *Ordinary Differential Equations and Dynamical Systems* (all its locators: Lemmas 6.3, 6.5–6.7; §6.5 with (6.27), Theorem 6.10, (6.30), Problem 6.16; Lemmas 6.11–6.12, Theorems 6.13–6.15, (6.40), the example on p. 202; Corollary 3.27): the sources service refused the author's-page address (it does not contain the author's surname) and the DOI resolves to a page it does not class as open. The statements cited to it were checked as mathematics, not against the text.

## Source issues

- none

## For the human reviewers

- **Not tested.** Teschl's book has the largest share of the locators (14 of 23) and could not be read through the sources service; wording and arrangement were compared with Sontag only.
- **Licence.** Sontag's text was read from the PDF on sontaglab.org, taken as the author's own site; Teschl's is cited from his University of Vienna page "with the publisher's permission" (README line 693), which was not confirmed.
- **Scope.** The headline theorems are classical (Lyapunov 1892, Chetaev 1934, Barbashin–Krasovskii 1952, LaSalle 1960) and both sources are graduate textbooks; the one later theory found using them is Sontag's feedback stabilization (§5.7–5.9).
