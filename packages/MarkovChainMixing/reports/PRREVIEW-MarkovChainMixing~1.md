# Review of MarkovChainMixing (pull request #2502 at dbbd410)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every stated theorem, definition and Check was recomputed on degenerate and small cases (one state, the two-state chain, reducible and periodic chains, point-mass and non-positive `π`, junk values of division and of empty infima) and every one of the 33 source locators was read against the text of Levin–Peres; all hold as written, including the statements that go beyond the source (non-reversible Cheeger, the lower bound without irreducibility, the general `d(t)^(1/t)` limit). There are two small corrections (one sentence of the pull request description, one incomplete *Needs:* line) and two format notes, none blocking. Two points are left for the human reviewers: the roadmap rests on a single textbook, and that textbook was read from its authors' page.

## C01 — The description says the absolute spectral gap is "positive exactly for aperiodic irreducible chains"; the README proves the equivalence only among irreducible chains, and the unrestricted reading is false

A reader of the description alone would take `γ⋆ > 0` to characterise aperiodic irreducible chains. The README (2.2, line 209) and `absSpectralGap_pos_iff` assume irreducibility and conclude `0 < γ⋆ ↔ aperiodic`; without that assumption the identity kernel on two states has spectrum `{1}`, so `λ⋆ = 0` and `γ⋆ = 1 > 0`, and it is reducible (this is the README's own third Check of 2.2).

Text that would be right: "the absolute spectral gap (for an irreducible chain, positive exactly when the chain is aperiodic)".

## C02 — The *Needs:* line of 6.4 omits two inputs of the stated route for the deviation bound

An implementer following the route ("compares the law of `X_r` with `π` in total variation and applies Chebyshev's inequality to the stationary chain", line 666) needs more than the line at 677 lists. The event concerns the whole block `(X_r, …, X_{r+t−1})`, so the route uses (a) that the path seen from time `r` has law `markovChainLaw ((κ ^ r) ∘ₘ ν) κ`, which is Tau Ceti's `MeasureTheory.Measure.markovChainLaw_map_shift_iterate` (`TauCeti/Probability/MarkovChain/MarkovProperty.lean`, line 122), and (b) that two path laws with the same kernel are no further apart in total variation than their initial laws. The listed `markovChainLaw_map_eval` gives only the one-time marginal, and I found no declaration for (b) at the pins (no `tvDist`/`etvDist` lemma for `map`, `comp` or `bind` in either library); 1.2 proves only the one-step, finite-state form.

Smallest change: add the shift lemma to the *Needs:* line and to the Tau Ceti contracts, and state (b) as a bullet of 1.2 (it is the same convexity argument as the monotonicity bullet there) or name it in 6.4 as proved there.

## N01 — Conventions counts two statements for countable `S`, and 4.1 has two of its own

"two statements (1.1 and the first of 4.1) do not use it and are stated for countable `S`" (line 54): in 4.1 both the first bullet and the coupling inequality are stated "on a countable `S`", and it is the second that `Suggested.lean` declares with `[Countable S]`. Say "1.1 and the first two of 4.1".

## N02 — The spectral Check of 2.1 needs `p, q > 0`

The two-state chain is introduced in 1.2 with `p + q > 0` only; the eigenfunction `f₂ = (√(p/q), −√(q/p))` of the first Check of 2.1 (line 189) needs both positive (otherwise `π` has a zero and the target's positivity hypothesis fails). Add "for `p, q > 0`".

## Verified sound

Adversarial table (values computed by hand or in exact rational arithmetic; LPW is the README's source, cited by line of its extracted text).

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.1 coupling characterisation (`isLeast_measureReal_ne_of_isCoupling`) | `μ = ν`; two point masses; two fair coins | least value `0`; unique coupling gives `1 = 2/2`; independent coupling `1/2 > 0` | true; LPW line 2922–2925 | none |
| 1.2 `d ≤ d̄`, `d̄(s+t) ≤ d̄(s)d̄(t)`, `d(s+t) ≤ d(s)d̄(t)` | two-state `p=3/10,q=1/10`; exchange chain; `s=0`, `t=0`; one state; non-stationary `π=δ_a`, `κ→b` | `d(1)=9/20`, `d̄(1)=3/5`; `d=1/2,d̄=1`; `d(t) ≤ (1−π_min)d̄(t)`; `0≤0`; `d(1)=1 > d̄(1)=0` | true; LPW 3062, 3091, 3267 | none |
| 1.2 monotonicity / 1.3 `mixingTime_le_iff` for every measure `π` | infinite `π`; finite non-probability `π` | Mathlib `tvDist = 0` when a side is not finite (Defs.lean:185), so `d ≡ 0`; convexity otherwise | true | none |
| 1.3 `t_mix(ε) ≤ ⌈log₂ ε⁻¹⌉ t_mix(1/4)` | `ε ≥ 1`; `ε=1/2`; `ε=0`; `t_mix(1/4)=⊤`; non-stationary `π=(19/25,6/25)` | `0 ≤ 0·⊤ = 0`; `1·t_mix`; `logb 2 0 = 0` (excluded by `0<ε`); `⊤`; `t_mix(1/4)=1`, `t_mix(1/10)=⊤ > 4` | true; LPW 3118–3125 | none |
| Layer 1 Examples, cycle `t_mix(1/4)` | `n = 4,…,8`, lazy symmetric walk, exact powers | `1, 3, 4, 5, 6` | true | none |
| 2.1 spectral decomposition | two-state chain at `t=1, x=y=a`; `t=0`; `π` with a zero | `q/(p+q)·(1+(1−p−q)p/q) = 1−p`; completeness relation; degenerate form | true; LPW 8192–8207 | N02 |
| 2.2 `γ⋆`, `absSpectralGap_pos_iff` | one state; empty type; period `m≥2`; identity on two states | `γ⋆=1`, aperiodic; spectrum `∅`, both sides true; eigenvalue `e^{2πi/m}`, `γ⋆=0`; `γ⋆=1` but reducible (hypothesis excludes) | true; LPW 8176–8181, 9036 | C01 (description) |
| 2.2 variance bound | non-reversible rows `(0,1,0),(½,0,½),(½,0,½)`, `f=(1,−1,0)` | eigenvalues `1,0,−½`; `Var f=2/3`, `Var Pf=1/2 > 1/6` | Check true; bound true under reversibility; LPW 8303 | none |
| 2.3 lower bound, every real `ε`, `γ⋆>0`, stationary | `ε≤0`; `ε≥1/2`; `λ⋆=0`; exchange chain `ε=9/10`; `p=3/10,q=1/10` | `⊤` or `⌈0⌉=0`; product `≤0`; `t_rel=1`, `0`; junk `⌈log(9/5)⌉=1 > 0`; `⌈1.04⌉=2 ≤ 3` | true; LPW 8363–8406 uses stationarity only | none |
| 2.3 upper bound and `d(t) ≤ (1−γ⋆)^t/(2√π_min)` | `t=0`; one state; `p=3/10,q=1/10`; non-reversible `π=(½,¼,¼)` | `2√x(1−x) ≤ 0.77`; `0 ≤ ½`; `⌈3.47⌉=4 ≥ 3`; `λ⋆=0`, `d(1)=¼` | true; LPW 8318–8362 | none |
| 2.3 `d(t)^(1/t) → λ⋆`, irreducible, non-reversible | one state; periodic; identity on two states | `0^{1/t}=0=λ⋆`; limit `1=λ⋆`; `d=½`, `λ⋆=0` (reducible, excluded) | true; `(P−Π)^t=P^t−Π`, `1` simple | none |
| 2.4 Dirichlet form, `γ`, lazy chain, `isGreatest_spectrum_diff_one` | two-state; cycle `n=4,6`; one state; identity kernel; biased 6-cycle `9/20, 1/20` | `γ=p+q`; `½, ¼`; `γ=0,γ⋆=1`; `γ=0`, no eigenvalue `≠1`; `γ=¼`, real eigenvalues `1, 0` only | true; LPW 9201–9246 | none |
| 2.4 comparison (`spectralGap_le_of_dirichletForm_le`) | `a<0`; `π` point mass stationary; README's non-stationary example | both forms `≡0`, `0≤0`; `E≡0 ⇒ γ'=0`; `E=½d²`, `E'=¼d²`, `γ'=1 > 0` | true; LPW 9493–9512, reversibility unused | none |
| 3.1 `d(t) ≥ 1−tΦ(A)−π(A)`, `⌈1/(4Φ⋆)⌉ ≤ t_mix(1/4)` | two-state; cycle `n=4,6,8` (all sets enumerated); identity kernel; `A=∅`; `π` point mass | `Φ=3/10`, `1≤3`; `Φ⋆=1/4,1/6,1/8`; `Φ⋆=0`, `0≤⊤`; `1≤d` false (excluded); junk `0` | true; LPW 4929–4944 | none |
| 3.2 Cheeger for stationary `π`, not reversible | hypercube `n=2`; 6-cycle; biased 6-cycle; one state; reducible reversible; `π` with zeros | `1/32 ≤ ½ = 2·¼`; `1/72 ≤ ¼ ≤ ⅓`; same `Φ⋆=1/6, γ=¼`; `0≤0≤0`; closed class gives `Φ⋆=0=γ`; support closed | true; LPW 9270–9274 plus symmetrisation | none |
| 4.1 coupling inequality | first-coordinate kernel; two-state optimal coupling; `K→(b,b)` with `π=δ_a` | second marginal `κ x`; `|1−p−q|^t = d̄(t)`; `d(1)=1 > 0` | true; LPW 3470–3484 | N01 |
| 4.2 path coupling, `d(t) ≤ c^t·diam` | `E=∅`; distance `¼`; one point; hypercube | fails for `c<1` (hypothesis); `½ ≤ ¼` false (hypothesis); `0≤0`; `c=1−1/n` | true; induction on distance; LPW 10315–10339 | none |
| 4.3 cycle walk, `4t·d(t) ≤ n²`, all `p` | `n=1,…,8`, `p=½`; `n=3,5,6,7`, `p∈{0,1/10,9/10,1}`, `t≤80` | max `4t·d(t)`: `0,0,2/3,1,11/5,27/8,255/56,729/128`; all `≤ n²`; `t_mix(6)=4` | true; distance walk is symmetric for every `p`; LPW 3526–3553 | none |
| 5.1 separation distance | two-state; rows `(¼,¾)` uniform `π`; non-reversible 3-state; `π=δ_a`; `t=0`, `u=0` | `s_a=(1−p−q)^t`; `½ ≤ ¼` false; `π=(1,2,4)/7`, `d̄(1)=½`, `s_a(2)=1`; `1 ≤ 0` false; `s_x(0)=1` | true; LPW 4505–4539, 4751 | none |
| 5.2 `s_x(t) ≤ P(τ>t)` | `τ=0`; `π` point mass; filtration form vs LPW (6.3) | forces one state; junk `s=1 > 0` (positivity assumed); same condition | true; LPW 4424–4480 | none |
| 5.3 hypercube and top-to-random | hypercube `n=1,2,3`, `t≤12`; shuffle `n=1,…,4`, `t≤25`; `σ=1,k=2` | `s(2)=½=2(½)²`; shuffle `s`: `1,1,⅓,1/9` (`n=3`) `≤` bound; cards `1,2,0`; uniform stationary | true; LPW 4307–4312, 4599–4618 | none |
| 6.1 Glauber dynamics | `V` empty; one site; `π(B)=0`; countable `A` | zero kernel, reversible trivially, Markov needs `Nonempty V`; row `π`; `δ_x`; detailed balance by `B(x,v)=B(y,v)` | true; LPW 2557–2580 | none |
| 6.2 colourings, `q > 2Δ` | path `P₃`, `q=5`; triangle `q=5`; edge `q=3`; `V` empty; improper starts | `t_mix=6 ≤ ⌈9 log 12⌉=23`; `t_mix=7`; bound holds all `t`; no invariant law (vacuous); contraction `1−(q−2Δ)/((q−Δ)n)` | true; LPW 10480–10560 | none |
| 6.3 ergodic theorem | exchange chain; identity kernel | limit `½`; limit `f(ω 0)` (reducible, excluded) | true; LPW 20325 | none |
| 6.4 second-moment bound and deviation bound | `t=0,1`; rows all `π`; `γ=0`; `λ=−1`; `t=0` in deviation | `0≤0`, `γ≤2`; `t·Var`, half the bound; `Var_π f=0` forced; sum `≤ Eφ²`; junk average excluded by `0<t` | true; LPW 8874–8974 (uses `γ`, as the README) | C02 |

- Source locators read against the text: 33 of 33 (all LPW), none unverified, none wrong.
- Library declarations opened at the pins: 37 (Mathlib 23, Tau Ceti 14), all present with the hypotheses the supplier contracts state.
- Cross-roadmap citations resolved on main: MarkovChainsAndRenewal Layer 1 item 1, 2.3, 2.4, 3.1, 3.2, 3.4, 3.5, 3.6; MathematicalStatisticsFoundations 9.2, 9.4; all make the statement they are cited for.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning; no `set_option`, no sorry'd data, imports are `Mathlib` and four existing Tau Ceti modules.
- Elaborated signatures compared with the README for all 56 declarations: the binders dropped (`MeasurableSingletonClass S` on eleven definitions, `DecidableEq V` on one) are not used by those bodies; every theorem keeps its hypotheses; nothing changed.
- One-tactic probe (`rfl`, `infer_instance`, `simp`, `simp` with the definitions unfolded) on all 38 theorems: none closes.
- Dependency check output: `depcheck: 211 roadmaps, 2258 edges, 0 problem(s)`. The automatic checks all passed; the pull request changes only this folder.
- Headline theorems (relaxation-time bounds, Cheeger with the bottleneck bound, path coupling, strong stationary times): all four stated in `Suggested.lean`; none declared not statable.

Duplication audit: neither pinned library has a mixing time, Dirichlet form of a kernel, bottleneck ratio, separation distance, Glauber kernel or the coupling characterisation of `tvDist`; the event form of total variation (Tau Ceti `etvDist_eq_two_mul_iSup_sub`) is deferred, not restated. No open pull request changes this roadmap and it drops no id.

Overlap check: read LangevinAndHamiltonianMonteCarlo, PopulationDynamics, DiscreteQuantumWalks, HiddenMarkovModels, ClassicalErgodicTheory (open) and MarkovChainsAndRenewal, MarkovDecisionProcesses, MathematicalStatisticsFoundations (main); nothing shared. The Metropolis–Hastings kernel stays with MathematicalStatisticsFoundations 9.4 and LangevinAndHamiltonianMonteCarlo Layer 1, the meeting-time coupling with MarkovChainsAndRenewal Layer 3 item 4, and the Wasserstein contraction of LangevinAndHamiltonianMonteCarlo 5.2 is specific to the Langevin step.

Source independence: 12 passages compared with 1 source (1.1 optimal coupling, 2.1 route, 3.2 reduction, 4.3 coupling, 5.2 definition, 5.3 stopping times, 6.1 and 6.2 definitions, 6.4 route, three docstrings), none shared beyond forced phrases of at most four words; largest share LPW, 33 of 33 locators; contents compared with LPW: independent (Layer 2 ↔ Ch. 12 and 13.2–13.4, Layer 3 ↔ 7.2 and 13.2.2, Layer 4 ↔ Ch. 5 and 14.2, Layer 5 ↔ Ch. 6, Layer 6 ↔ 3.3, 14.3, 12.7 and Appendix C; the spectral layer precedes couplings, the reverse of the source).

Research link: Layer 3 is the conductance bound of Sinclair–Jerrum (1989) and Lawler–Sokal (1988), and 4.2 the path coupling theorem of Bubley–Dyer (1997), applied in 6.2 to rapid mixing of the colouring sampler; rests on the attributions in LPW (Theorems 13.10, 14.6, 14.10), which the README does not repeat.

## Not verifiable

- "None of them treats mixing times" (Provenance and prior work, of the three Isabelle AFP entries): the entries were not opened.
- The description's account of numerical checks run by the author: not reproducible from the pull request; the README's own Checks were recomputed instead.

## Source issues

- **Error** in LPW at Exercise 12.3, p. 177: the source says every eigenvalue of the lazy matrix `(P + I)/2` is non-negative, for an arbitrary transition matrix; it should be assumed that `P` is reversible (rotation of a 3-cycle gives `(1 + ω)/2`, not real); affects nothing.
- **Error** in LPW at Theorem 12.4, (12.10), p. 163: the source says the ceiling is at most `t_rel log(1/(ε π_min))` with no restriction; it should exclude a one-point space (`t_rel = 1`, `π_min = 1`, `ε = 2/5`: `1 > log(5/2)`); affects nothing.
- **Gap** in LPW at the proof of Lemma 12.22, p. 175: the source says the case `−1 ≤ λ ≤ 0` is bounded "for `t ≥ 2`"; it should also treat `t = 1`, where the left side is `1 ≤ 2/(1 − λ)`; affects nothing.
- **Misprint** in LPW at Remark 13.8, p. 182: the source says a non-constant function `f : R → X`; it should be `f : X → R`; affects nothing.

## For the human reviewers

- **Scope.** All 33 locators of `TauCetiRoadmap/MarkovChainMixing/README.md` point to one text, Levin–Peres, *Markov chains and mixing times* (AMS, 2017); the primary papers behind Cheeger's inequality and path coupling are not cited.
- **Licence.** The source was read from the authors' hosted copy of the second edition (a University of Oregon personal page), which I classed as an author page; the book is an AMS publication.
