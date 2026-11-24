# Review of AdaptiveTimeSteppingForODEs (pull request #3078 at 6dcac25)

**Verdict:** accepted

**Summary.** Accepted: this head repairs the one finding of the previous review, since `Suggested.lean` now states asymptotic exactness (1.2), the meshwise residual bound (2.1), finite completion of the defined run (4.2, 4.3) and the global tolerance bound (5.1) on the roadmap's own objects, and I found each of them, and every formula and Check of the README that I recomputed, to be true. There is one small correction (the Lean statement attached to 5.2 assumes the supplier's error bound and is only the final limit) and one format note, neither blocking. Three questions are left for the human reviewers (scope and a licence).

## C01 — The Lean statement for 5.2 assumes the error bound and proves only a limit of `gronwallBound`

A reader who takes `nodal_error_tendsto_zero` (`Suggested.lean` line 360, under the comment "Headline 5.2") as the test of tolerance convergence finds that it mentions neither `adaptiveRun`, a step map, a defect nor a step cap acting on a mesh: its hypothesis `hbound` is already the conclusion of OneStepMethodsForODEs 1.4, and what remains is that `gronwallBound δ L (C H^p) d → 0` as `δ, H → 0`. On a copy of the file I proved it in ten lines (`Tendsto.pow`, `Tendsto.const_mul`, unfolding `gronwallBound`, `filter_upwards`), and without `hC : 0 ≤ C` or `hT : 0 ≤ duration`, which the statement does not need. The statement is true and its docstring describes it honestly, so nothing is wrong; but as a target it asks an implementer for little.

The smallest change is to call it what the module docstring calls the other proved fragments, a step of the route, and to change the section comment accordingly. If 5.2 is meant as a headline, it is statable with what the file already defines: `adaptiveRun` with `Ψ t u h = u + h • Φ t u h` and `Hmax = H tol`, `Φ t · h` Lipschitz with constant `L`, `‖y (t + h) − y t − h • Φ t (y t) h‖ ≤ C h^(p+1)`, a completion index `N tol`, and the same conclusion about `(run n).value` and `y (run n).time`.

## N01 — Three theorems about the run carry a normed-space structure they do not use

`acceptedStep_spec`, `adaptiveRun_completion` and `indicatorRun_completion` elaborate with `[NormedAddCommGroup E] [NormedSpace ℝ E]`, although `AdaptiveState`, `acceptedStep` and `adaptiveRun` are defined for an arbitrary type `E` and the statements use no norm on `E`. An `omit … in` line, as before `observation_error_le`, would give the generality the definitions have.

## Verified sound

Previous review (head a5c8d55), finding by finding:

- R01 (headlines absent from `Suggested.lean`): repaired. `embedded_asymptotically_exact` (line 209), `meshwise_reconstruction_error_le` (219), `adaptiveRun_completion` (283), `indicatorRun_completion` (312), `global_reconstruction_tolerance` (338); the module docstring names the instantiations of 1.1 as not stated, "the supplier's `ButcherTableau` implementation is absent from pinned Tau Ceti".
- C01 (proved declarations as targets): repaired; docstring: "Proved elementary lemmas are sanity checks or steps of the proof route, not outstanding targets."
- C02 (three unneeded hypotheses): repaired; `heunReconstruction_endpoint` has no `0 < h` ("the endpoint identity also holds at zero"), `proposalFactor_bounds` no `0 < lower`, `heunEuler_indicator_le` no `0 ≤ Mt`.
- C03: repaired; "PopulationDynamics is a source of example fields".
- N01–N04: repaired; title "Adaptive time stepping: target signatures", layer comments, each Lean name given where its object is defined (2.1, 3.1, 3.2, 4.1, 5.1), the recurrence of 2.1 as an indented block, "Süli, Definition 15 and Example 7 (printed p. 58)" in 1.1.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 Shared stages, Heun–Euler | `u′=u`, `z=h`; `h=0` | Heun `u(1+z+z²/2)`, Euler `u(1+z)`; Δ `= u z²/2`; `0` at `h=0` | agrees with Check | none |
| 1.1 Bogacki–Shampine pair | `u′=u`; order sums | `k4=1+z+z²/2+z³/6`; ΨL `=1+z+z²/2+3z³/16+z⁴/48`; Δ `=−(z³+z⁴)/48`; `∑b̂=1`, `∑b̂c=1/2`, `∑b̂c²=3/8≠1/3`; row 4 `= b` | true | none |
| 1.2 identity, two-sided bound | algebra | `eL−Δ=x−ΨH=eH`; reverse triangle inequality gives both bounds | true | none |
| 1.2 `embedded_asymptotically_exact` | `v≠0`; `v=0` | scaled by `h^(−(p+1))`, `h>0`: ratio `→‖v−0‖/‖v‖=1`; `v=0` excluded by `hv` | true | none |
| 1.2 Check | `f=t(1−t)`, one step `h=1` | `k1=f(0)=0`, `k2=f(1)=0`; outputs `0`, `Δ=0`; `∫₀¹ t(1−t)=1/6` | true | none |
| 1.3 `heunEuler_indicator_le` | `f=u`; `h=0` | `‖k2−k1‖≤Lh‖k1‖+M_t h`; `f=u`: `h²‖u‖/2` on both sides; `h=0`: `0≤0` | true | none |
| 2.1 `meshwise_reconstruction_error_le` | induction on `n`; `N=0`; `L=0`; `f=0`, `U=(t−a)v` | node error `≤B_n` by join and previous interval; Mathlib theorem on `[t_n,t_(n+1)]`; `N=0` vacuous; Check: `(t−a)‖v‖` both sides | true | none |
| 2.1 weighted recurrence | `L≠0`, `L=0` | `gronwallBound B L ε h = B e^(Lh)+gronwallBound 0 L ε h`; sum formula by induction; `L=0`: `B_0+∑ε_j h_j` | true | none |
| 2.2 Euler certificate | triangle inequality | residual `f(t,u)−f(t+s,u+s f)`, norm `≤M_t s+L s‖f‖` | true | none |
| 2.2 Heun certificate | `s=0`, `s=h`; `f=t`; `f=u`, `u=1` | `r(0)=0`; `r(h)=f(t+h,u+hk1)−f(t+h,u+(h/2)(k1+k2))`, `≤Lh‖k2−k1‖/2`; `f=u`: `r=−s²/2`, and `s²/2≤sh−s²/2` | true | none |
| 2.2 constant `M_r` | chain rule | `γ′=(1,U′)`, `‖U′‖≤‖k1‖+Kh`, `γ″=(0,(k2−k1)/h)`, `‖γ″‖≤K`; `‖r″‖≤M2(1+‖k1‖+Kh)²+M1K`; kernel integral max `h²/8` | true | none |
| 3.1 `scaledError_le_one_iff`, `scaledError_units` | empty `ι`; `rtol=0`; `scale_i>0` | `s_i≥atol_i>0`; sup norm `≤1` iff each `|Δ_i/s_i|≤1`; empty: `0≤1`, right side vacuous; scaled `s′=λs`, quotient unchanged | true | none |
| 3.2 `proposalFactor`, `one_le_proposalFactor` | `w=0`; `w=σ^r`; `0<w<σ^r`; `η=Ch^r` | `w=0`: `upper≥1`; `σw^(−1/r)≥1` so clipped value `≥1`; power law: new error `σ^r` | true | none |
| 3.2 `acceptedStep`, `adaptiveRun` | `time≥T`; no accepted trial; trial `k=0` clipped | stationary at `time≥T`; fallback `0`; `H=min(proposal,T−time)`, first trial `H`, so `time+h≤T` | as README says | none |
| 4.1 `exists_firstAccepted`, lower bound, `acceptedStep_spec` | `k=0`; `k≥1` | `k=0`: step `H`; `k≥1`: trial `k−1` rejected so `θ^(k−1)H>δ`, step `>θδ`; `Nat.find` minimality gives `1<w` earlier | true | none |
| 4.2 `adaptiveRun_completion` | invariant `m≤proposal≤Hmax`; clipped final step; `h≤δ_g`, `h>δ_g`; `s0.time=T`; steps `2^(−n−2)` | nonfinal step is `proposal≥m` or `>θδ_a≥m`; next `P≥h` or `P≥κh>κδ_g≥m`; `(N−1)m<T−a` so `N≤⌈(T−a)/m⌉`; `N=0≤1`; Check sum `1/2` | true | none |
| 4.3 `indicatorRun_completion` | `C_w>0`; `C_w=0`; componentwise | `h≤(1/C_w)^(1/r)`: `w≤1`; `h≤(σ^r/C_w)^(1/r)`: `w≤σ^r`, `G≥1`; `G≥lower`; `C_w=0`: `w=0`, `G=upper`; `w≤C_Δh^r/a_min` | true | none |
| 5.1 `residualTolerance_spec`, `global_reconstruction_tolerance` | `L=0`; `L>0`; `N=0` | denominator `d` or `(e^(Ld)−1)/L>0`; `gronwallBound 0 L τ x` linear in `τ`, increasing in `x`; bound at `T−a` equals `Tol`; `N=0` contradicts `a<T` | true | none |
| 5.1 Euler and Heun thresholds | exponents | Euler `ε≤Ch`, accepted for `h≤τ/C`, `r=1`; Heun `ε≤(LK/2+M/8)h²`, `r=2` | true | none |
| 5.2 convergence with a cap | supplier 1.4; `f=0`, `Y_0=1` | supplier bound at `t_n−a≤T−a`, monotone since `δ,C≥0`; limit `gronwallBound 0 L 0 d=0`; Check: error `1` on every mesh | true; Lean form is the limit only | C01 |
| Observable corollary | `K=0` | `‖g u−g v‖≤K‖u−v‖≤KB`; `0≤0` | true | none |

- Source locators checked against the text: 5. Suli2022 line 2740 (§5, printed p. 56), lines 2793–2816 (equations (94)–(96), printed p. 57), line 2825 (Definition 15) and line 2837 (Example 7), both printed p. 58 (printed page = PDF page − 2); RanochaGiesselmann2024 lines 65–126 (§2) and 127–135 (§2.1). The README flags no locator as unverified.
- Library declarations opened at the pin (Mathlib 1b1ccf4): `Mathlib/Analysis/ODE/Gronwall.lean` `gronwallBound` :43, `gronwallBound_K0` :46, `gronwallBound_of_K_ne_0` :49, `dist_le_of_approx_trajectories_ODE` (used by the proved `reconstruction_error_le`); `Mathlib/Analysis/ODE/Basic.lean` `IsIntegralCurveOn` :44. The pinned Tau Ceti has no `ButcherTableau` or `oneStepSeq`.
- Cross-roadmap citations resolved on main (OneStepMethodsForODEs): 1.1 `meshNode`, 1.2 `oneStepDefect`, 1.4 `norm_sub_oneStepSeq_le` (bound `gronwallBound ‖y t₀ − y₀‖ L (C hmax^p) (t_n − t₀)`), 2.1 `IsStage`, `increment`, `existsUnique_isStage_of_isExplicit`, 3.1 `explicitEuler`, 3.2 `heun`, 4.1 `OrderConditions`, 4.3 `hasOrder_iff_orderConditions`. The one name the citation tool found nowhere, `ButcherTableau.IsStage`, is the supplier's 2.1 `T.IsStage`.
- Dependency check: `depcheck: 129 roadmaps, 1436 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder. The worker's automatic checks all passed.
- Elaboration: `Suggested.lean` elaborates with `sorry` the only warning (15 declarations); single `import Mathlib`, no `set_option`, no sorried data. Elaborated types of all 35 declarations compared with the README: the definitions of the run lose only instance binders they do not use (N01); nothing the statements need is lost.
- One-tactic probe on a copy (`simp`, `rfl`, `simp_all`, `positivity` for each of the 15 sorried statements): none closes. `nodal_error_tendsto_zero` proved in ten lines without two hypotheses (C01).
- Duplication: searched the roadmaps on main and the open heads for embedded pairs, step-size control, adaptive stepping, dense output and a posteriori bounds; the only hit on the subject is the exclusion in OneStepMethodsForODEs ("embedded pairs, error estimators and adaptive step-size control"). No shared fully qualified name.
- Pull-request text: eight proved and fifteen admitted statements, the toolchain v4.36.0-rc2, the Mathlib pin, the three open roadmaps named and the list of headline signatures all agree with the head.

Overlap check: read OneStepMethodsForODEs, LinearMultistepMethods, ExponentialIntegrators, DiffusionODESamplerGuarantee; nothing shared (OneStepMethodsForODEs excludes adaptivity and owns meshes, tableaux, Euler and Heun, which this roadmap cites; the other three cite OneStepMethodsForODEs and own no step selection).

Source independence: 8 passages compared with 2 sources, none shared; largest share Suli2022, 3 of 6 locators; contents compared with Suli2022 (its §5 has no subsections; the roadmap's five layers do not follow its eight sections): independent. BogackiShampine1989 could not be read.

Research link: Layers 2 and 5 give, for Lipschitz fields, the residual-based a posteriori bound and the tolerance convergence that Ranocha–Giesselmann (2023) discuss for step-size control (Lemma 2.1, §2.2); Layers 1 and 3 are the embedded estimate and proposal rule of Süli (2022) §5. Rests on RanochaGiesselmann2024 lines 127–146, 216–219 and Suli2022 lines 2788–2820.

## Not verifiable

- BogackiShampine1989 (Applied Mathematics Letters 2, 321–325): paywalled, settled as uncertified; cited for attribution only, and the coefficients, both orders and the failure of the next order were checked algebraically.
- The description's counts of READMEs and pull requests searched and its "21 author-run local rational controller traces": nothing in the folder records them, as the description itself says.

## Source issues

- none

## For the human reviewers

- **Scope.** Numerical analysis of an adaptive step-size procedure (`math.NA`). Sources: lecture notes (Suli2022, unpublished), one arXiv paper (RanochaGiesselmann2024) and an attribution; Layers 2–5, including the completion theorems 4.2 and 4.3, cite no source and are derived in the README.
- **Scope.** The project excludes computational algorithms; 3.2 defines a controller's trial transitions as noncomputable sequences and Layers 4–5 prove termination and error bounds about them; executable and floating-point solvers are excluded (README lines 56–59, 245–246).
- **Licence.** Suli2022 was read from its author's own university page and carries no stated licence; it is cited by locator only.
