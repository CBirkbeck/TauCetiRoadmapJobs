# Review of AdaptiveTimeSteppingForODEs (pull request #3078 at a5c8d55)

**Verdict:** needs changes

**Summary.** Changes are needed, for one reason: `Suggested.lean` states none of the roadmap's headline theorems (the meshwise residual bound of 2.1, the finite-completion theorems of 4.2 and 4.3, the global tolerance bound of 5.1, the asymptotic exactness of 1.2), although each is statable against Mathlib alone; it states their elementary fragments instead. Every formula, Check and constant of the README that I recomputed is correct, including the Bogacki–Shampine coefficients, the Heun residual constants and the step lower bound `m` of 4.2. There are three small corrections and four format notes, none blocking, and two questions for the human reviewers (scope and sources).

## R01 (P2) — `Suggested.lean` states fragments of the headline theorems, not the theorems

An implementer who proves everything in the file has not proved that the controller reaches `T`, nor any error bound over more than one step: the file cannot serve as the acceptance test of the roadmap. The README's headline results are (a) 1.2, asymptotic exactness `‖Δ‖/‖eL‖ → 1`; (b) 2.1, the bound `‖y(t)−U_n(t)‖ ≤ gronwallBound B_n L ε_n (t−t_n)` on every accepted interval; (c) 4.2, every accepted nonfinal step has length at least `min(H0,θδ_a,κδ_g)` and `T` is reached; (d) 4.3, the same for the clipped I-controller; (e) 5.1, the global bound and the tolerance `τ`. What the file has in their place: for (b), `reconstruction_error_le` (lines 65–79), a single interval, which is Mathlib's `dist_le_of_approx_trajectories_ODE` with `εf = 0` and is proved there by one `simpa`; for (c), `reaches_endpoint` (line 153), about an arbitrary real sequence and mentioning no object of the roadmap, and `proposal_ge_lowerBound` (line 160), algebra on its own hypotheses; for (e), `residualTolerance_spec`, an identity about `gronwallBound` with no trajectory in it; for (a) and (d), nothing. The module docstring calls the file "selected interface prototypes" and does not say that any of these is not statable.

All five are statable at the pins with `import Mathlib` only. For (b): a monotone node sequence `t : ℕ → ℝ` with `h n = t (n+1) − t n`, `y` and `U` continuous on each `Icc (t n) (t (n+1))` with the right derivatives and residual bounds `ε n` of `reconstruction_error_le`, `‖y (t 0) − U (t 0)‖ ≤ δ`, and conclusion `‖y s − U s‖ ≤ gronwallBound (residualBudget δ L h ε n) L (ε n) (s − t n)` for `s ∈ Icc (t n) (t (n+1))`; (e) is its corollary with `ε n ≤ residualTolerance Tol L (T − a)` and conclusion `≤ Tol`. For (a): three functions `ℝ → E` and `Tendsto … (𝓝[>] 0)`. For (c) and (d): one definition with a real body, the run of the trial transition of 3.2 on states `(t, u, h)` for a supplied step map and acceptance predicate, then the lower bound on accepted nonfinal steps and `∃ n, t n = T` under the hypotheses of 4.2, and for 4.3 with `proposalFactor` and `w ≤ C_w h^r`. State these; the fragments can stay if marked as steps of the route (see C01). The embedded-pair instantiations of 1.1 do need the supplier's `ButcherTableau`, which the pinned Tau Ceti does not have: the docstring should name them as not statable for that reason, which it nearly does.

## C01 — Eight declarations of `Suggested.lean` ask an implementer for nothing

`embedded_error_remainder`, `embedded_error_bounds`, `residualBudget_zero`, `reconstruction_error_le`, `proposal_ge_lowerBound` and `observation_error_le` are already proved in the file, the first, fourth and sixth from one library lemma each (`abs_norm_sub_norm_le`, `dist_le_of_approx_trajectories_ODE`, `LipschitzWith.norm_sub_le`). `proposalFactor_bounds` closes with `unfold proposalFactor; split_ifs <;> simp [hlu]`, and `heunReconstruction_endpoint` with `field_simp` and `module`; I elaborated both on a copy. As targets they test nothing. They would be marked as sanity checks on the definitions, or moved to the README as Checks; the README already carries each statement.

## C02 — Three hypotheses are not needed, and one docstring says the opposite

`heunReconstruction_endpoint` (line 86) assumes `0 < h` and its docstring says the zero step is "deliberately excluded", but the identity holds at `h = 0` as well: `0^2/(2·0) = 0` in Lean, and both sides are `u`. `proposalFactor_bounds` (line 119) does not use `0 < lower`; `heunEuler_indicator_le` (line 57) does not use `0 ≤ Mt`. I proved all three without the hypothesis on a copy of the file. Drop the hypotheses, or say in the docstrings that they record the README's standing assumptions; the exclusion of `h = 0` belongs to the derivative of the reconstruction in 2.2, not to its endpoint value.

## C03 — The summary says PopulationDynamics "supplies example ODEs", but nothing is consumed from it

A reader of the summary (line 19) expects a supplier; the supplier contracts list only OneStepMethodsForODEs and Mathlib, no layer names an equation from PopulationDynamics, and the section on downstream consumers says its models "can supply a field". "PopulationDynamics is a source of example fields" would agree with the rest.

## N01 — Form of `Suggested.lean`

The module docstring is titled "selected interface prototypes" where the house form is "<title>: target signatures" with the list of headline theorems not statable at the pins; the file has no `/-! ## Layer k -/` comments; `open scoped BigOperators` is not needed.

## N02 — The Lean names do not appear in the README

`residualBudget`, `toleranceScale`, `scaledError`, `proposalFactor`, `FirstAccepted` and `residualTolerance` are `B_n`, `s_i`, `w`, `G(w)`, "first accepted index" and `τ` in the README, so a prose statement cannot be matched to its formal one. Name each once where it is defined (2.1, 3.1, 3.2, 4.1, 5.1).

## N03 — The weighted recurrence of 2.1 is a code span broken over two lines

Lines 150–151 hold one code span with a TeX-style subscript `∑_{j<N}` and a line break inside it; an indented block, as for the neighbouring displays, with `∑ j < N` would read better.

## N04 — A locator offered for 1.1

Süli's notes define embedded pairs and give the Heun–Euler tableau in Definition 15 and Example 7 (printed p. 58), just after the pages already cited; 1.1 could cite them.

## Questions for the author

- Layers 2–5 cite no source: 4.2, 4.3, the Heun certificate of 2.2 and 5.2 are "derived here". I verified each by computation, so nothing is wrong; but is there a refereed statement of finite completion or of tolerance convergence for an embedded-pair controller that 4.2 and 5.2 should cite (the literature on convergence of local error control for `ode23`-type codes)? I opened no such text, so this is not a required change.
- The Bogacki–Shampine paper is behind a paywall and was not read; the coefficients, both orders, the failure of the next order and the first-same-as-last property were checked algebraically (table below).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 difference formula, Heun–Euler | `u′=u`, `z=h` | Heun `u(1+z+z²/2)`, Euler `u(1+z)`; Δ `= u z²/2` | agrees with Check | none |
| 1.1 Bogacki–Shampine pair | `u′=u`; order conditions | ΨH `u(1+z+z²/2+z³/6)`; ΨL `z³` coeff `3/16`, `z⁴` coeff `1/48`; Δ `= −u(z³+z⁴)/48` | agrees | none |
| 1.1 orders 3/2 and failure of next | `∑b c³`, `∑b̂ c²`, row sums | `∑b=1`, `∑bc=1/2`, `∑bc²=1/3`, `bAc=1/6`; `∑bc³=11/48≠1/4`; `∑b̂c=1/2`, `∑b̂c²=3/8≠1/3`; rows sum to `c`; row 4 `= b`, `c₄=1` | true | none |
| 1.2 identity and two-sided bound | algebra; `R<0` | `eL−Δ = x−ΨH = eH`; Lean bound follows from `abs_norm_sub_norm_le`; `R<0` makes hypothesis false | true | C01 |
| 1.2 asymptotic exactness | `v≠0`; `v=0` | `Δ/h^(p+1) → v`, ratio `‖v‖/‖v‖=1`; with `v=0` ratio undefined, hypothesis excludes it | true | R01 (absent in Lean) |
| 1.2 Check (blind spot) | `f=t(1−t)`, `h=1` | `k1=f(0)=0`, `k2=f(1)=0`, both outputs `0`; `∫₀¹t(1−t)=1/6` | true | none |
| 1.3 indicator bound | `f=u`; `h=0`; `Mt<0` | `Δ=(h/2)(k2−k1)`; `‖k2−k1‖≤Lh‖k1‖+M_t h`; `f=u`: `h²‖u‖/2` both sides; `h=0`: `0≤0` | true; `0≤Mt` unused | C02 |
| 2.1 one interval / recurrence | `f=0,y=0,U=(t−a)v`; `L=0`; induction | error `(t−a)‖v‖` = bound; `B_(n+1)=B_n e^(Lh_n)+gronwallBound 0 L ε_n h_n` gives the weighted sum; `L=0`: `B_0+∑ε_j h_j` | true | R01 (meshwise form absent) |
| 2.2 Euler certificate | triangle inequality | residual `f(t,u)−f(t+s,u+s f)`; norm `≤ M_t s + L s‖f‖` | true | none |
| 2.2 Heun reconstruction | `s=h`; `h=0`; `f=t`; `f=u,u=1,t=0` | `U(h)=u+(h/2)(k1+k2)`; `h=0`: `u=u`; `f=t`: `U=u+ts+s²/2` exact; `f=u`: `r=−s²/2`, sup `h²/2 = Lh‖k2−k1‖/2` | true; `0<h` unused | C02 |
| 2.2 interpolation remainder and `M_r` | Green kernel; chain rule | `∫|G|=s(h−s)/2`, max `h²/8`; `‖γ′‖≤1+‖k1‖+K h`, `‖γ″‖≤K`; `‖r″‖≤M2(1+‖k1‖+Kh)²+M1 K` | true | none |
| 3.1 scaled indicator | empty `ι`; `rtol=0`; units `λ_i>0` | `s_i ≥ atol_i > 0`; sup norm `≤1` iff each `|Δ_i|≤s_i`; empty: `0`; `s′=λs`, `Δ′/s′=Δ/s` | true | none |
| 3.2 proposal multiplier | `w=0`; `w=σ^r`; `w` large; `lower≤0` | `w=0`: `gmax`; `w=σ^r`: `σw^(−1/r)=1`, `G≥1`; clipped into `[gmin,gmax]` for any `lower≤upper` | true; `0<lower` unused | C01, C02 |
| 3.2 power-law calculation | `η=Ch^r` | `η(hσw^(−1/r))/tol = σ^r`; per unit time exponent `r−1` | true | none |
| 4.1 local termination | `k=0`; `k≥1` | `k=0`: step `H`; `k≥1`: trial `k−1` rejected so `θ^(k−1)H>δ`, step `>θδ`; bound `min(H,θδ)` | true | none |
| 4.2 finite progress | clipped trial accepted/rejected; `h≤δ_g`, `h>δ_g`; `a=T`; `h_n=2^(−n−2)` | `P≥h≥m` or `P≥κh>κδ_g≥m`; rejected clipped trial gives step `>θδ_a`; nonfinal steps `<(T−a)/m`; total `≤⌈(T−a)/m⌉`; Check sum `1/2` | true (stated count not sharp) | R01 (absent in Lean) |
| 4.3 clipped I-controller | `C_w>0`; `C_w=0`; componentwise | `h≤(1/C_w)^(1/r)` gives `w≤1`; `h≤(σ^r/C_w)^(1/r)` gives `G≥1`; `κ=gmin`; `w≤C_Δh^r/a_min` | true | R01 (absent in Lean) |
| 5.1 global tolerance | `L=0`; `L>0`; duration `0` | `gronwallBound 0 L ε x` linear in `ε`; `L=0`: `τ(T−a)=Tol`; denominator `(e^(Lx)−1)/L>0`; `x=0` excluded by `a<T` | true | R01 (trajectory form absent) |
| 5.1 Euler/Heun thresholds | exponents | Euler `ε≤Ch`, `δ_a=τ/C`, `r=1`; Heun `ε≤(LK/2+M/8)h²`, `r=2` | true | none |
| 5.2 convergence with a cap | supplier 1.4 | bound `gronwallBound 0 L (C H^p) (T−a) → 0` as `H→0`, `p≥1`; `p=0` fails (supplier's Check) | true | none |
| Observable corollary | `K=0` | `‖g u−g v‖≤K‖u−v‖≤KB`; `K=0`: `0≤0` | true; one library lemma | C01 |

- Source locators checked against the text: 2 (Suli2022 lines 2740–2821, §5, printed pp. 56–57, equations (94)–(96); RanochaGiesselmann2024 lines 95–212, §2 and §2.1); 1 not readable (below).
- Library declarations opened at the pin (Mathlib 1b1ccf4): 7. `Mathlib/Analysis/ODE/Gronwall.lean`: `gronwallBound` :43, `gronwallBound_K0` :46, `gronwallBound_x0` :72, `gronwallBound_mono` :94, `dist_le_of_approx_trajectories_ODE_of_mem` :162, `dist_le_of_approx_trajectories_ODE` :188; `Mathlib/Analysis/ODE/Basic.lean`: `IsIntegralCurveOn` :44 (time-dependent field, derivative within the set). The pinned Tau Ceti has no `ButcherTableau`, `oneStepSeq` or `meshNode`.
- Cross-roadmap citations resolved on main: OneStepMethodsForODEs 1.1–1.2, 1.4 (`norm_sub_oneStepSeq_le`), 2.1 (`ButcherTableau.IsStage`, `increment`, `existsUnique_isStage_of_isExplicit`), 3.1–3.2 (`explicitEuler`, `heun`), 4.1–4.3 (`OrderConditions`, `hasOrder_iff_orderConditions`); its scope lists embedded pairs, error estimators and adaptive step-size control as out of scope.
- Dependency check: `depcheck: 132 roadmaps, 1464 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.
- Elaboration: `Suggested.lean` elaborates, `sorry` the only warning (10 declarations); no `set_option`, no sorried data, single `import Mathlib`. Elaborated types of all 23 declarations compared with the README: `heunReconstruction` keeps `[NormedSpace ℝ E]`, which it uses; nothing lost.
- Probes on a copy: three statements re-proved without a hypothesis (C02); two closed in two tactics and two from one library lemma (C01).
- Duplication: searched all roadmaps on main and the open heads for embedded pairs, step-size control, a posteriori residual bounds, dense output, the Mathlib trajectory theorem and this file's declaration names; no other owner, no shared name.
- Pull-request text: six proved and ten admitted statements, the toolchain and the Mathlib pin, the three open roadmaps named and the supplier's exclusion of adaptivity all agree with the head.

Overlap check: read OneStepMethodsForODEs, LinearMultistepMethods, ExponentialIntegrators, DiffusionODESamplerGuarantee; nothing shared (OneStepMethodsForODEs excludes adaptivity; LinearMultistepMethods excludes variable steps).

Source independence: 8 passages compared with 2 sources, none shared; largest share Suli2022, 2 of 5 locators; contents compared with Suli2022 (one section, §5, of eight): independent. BogackiShampine1989 could not be read.

Research link: Layers 2 and 5 formalise, for Lipschitz fields, the residual-based a posteriori bound that Ranocha–Giesselmann (2023, after Dedner–Giesselmann 2016) use for step-size control; Layers 1 and 3 are the embedded-pair estimate and proposal rule of Süli (2022) §5. Rests on RanochaGiesselmann2024 lines 11–19, 127–146 and Suli2022 lines 2788–2820.

## Not verifiable

- BogackiShampine1989 (Applied Mathematics Letters 2, 321–325): paywalled, recorded as uncertified; the README cites it for attribution only and the coefficients were checked algebraically.
- The description's counts of roadmaps and pull requests searched and its "21 rational controller traces": nothing in the folder records them.

## Source issues

- none

## For the human reviewers

- **Scope.** The subject is the analysis of an adaptive step-size algorithm (numerical analysis, `math.NA`). The README's sources are lecture notes (Suli2022, not published), one refereed paper (RanochaGiesselmann2024) and an attribution; Layers 2–5, including the completion theorems 4.2 and 4.3, cite no source.
- **Scope.** The project excludes computational algorithms; this roadmap defines a controller's trial transitions (3.2) and proves termination and error bounds about them, and excludes executable and floating-point solvers (README lines 56–59). Whether that is on the right side of the line is yours.
- **Licence.** Suli2022 was read from its author's own university page; it carries no stated licence. It is cited by locator only.
