# Review of CurieWeissModel (pull request #2981 at 50313ae)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement, Check and worked example was recomputed (the partition functions for `N ≤ 4`, the junk value of the rate function at `m = 2`, the mean-field analysis on both sides of `β = 1`, the binomial–entropy estimate, the exchangeable-pair constants and case split, the bottleneck constants, and the `N = 2` mixing times `3, 6, 11` in exact rational arithmetic), and every locator into the two books was read at its page; all agree with the text. There is one small correction (the roadmap does not name the open roadmap that owns the other half of the same theorem on the complete graph) and one format note, neither blocking. Nothing is left for a human to decide beyond the final approval.

## C01 — The scope does not say who owns fast mixing on the complete graph, and the two halves of LPW Theorem 15.4 are stated for two differently defined laws with no stated bridge

A reader of the "Not treated here" paragraph of Scope and ownership (line 525) is told that "fast mixing of the Glauber dynamics at high temperature" is not treated, and would conclude nobody plans it. The open roadmap GlauberDynamicsOfTheIsingModel states exactly that: its 3.2 is LPW Theorem 15.4(i) for `glauber (isingGibbs ⊤ (α/n))`, its 1.1 owns the Ising law `isingGibbs G β` of a finite graph, and its own scope paragraph leaves "the low-temperature slow mixing on the complete graph (`α > 1`) and the mean-field free energy" to others, which is what 5.1 and Layer 1 here provide. So the hand-off is consistent, but 5.1 is about `glauber (curieWeiss N β 0)` and that 3.2 about `glauber (isingGibbs ⊤ (α/n))`, and the only link is the prose computation in the Conventions (lines 56–60), made against LPW rather than against that roadmap's definition. I checked that the two measures agree on `Fin N → Bool`: `isingGibbs ⊤ (β/N)` weighs `x` by `exp((β/N) Σ_{i<j} σ_i σ_j) = exp(β M²/(2N) − β/2)`, and the constant cancels.

The smallest change: in the "Not treated here" sentence, name GlauberDynamicsOfTheIsingModel 3.2 as the place where the high-temperature half is stated. It would also help to add to the API of 1.1 the identity of `curieWeiss N β 0` with the Ising law of the complete graph on `Fin N` at inverse temperature `β/N`, so that an implementer can pass between the two halves of the theorem; whether to cite that roadmap's `isingGibbs` there is the author's choice, since it would add a dependency on a roadmap that is still open.

## N01 — The References entry for Friedli–Velenik lists (2.15) among the items used, and no layer cites it

In References (line 594), "(2.15)" appears in the "Used:" list, but the layers never cite it; the field form of the mean-field equation appears only implicitly in 4.3. Either cite (FV, (2.15), p. 66) where 4.3 says the bound puts `m_N` near a solution of `tanh(β m + h) = m`, or drop it from the list.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 law, energy convention | `N = 0, 1, 2, 3, 4`; coupling `−β/N` | `Z₁ = 2e^{β/2}cosh h`; `Z₂ = 2e^β+2`; `Z₃ = 6e^{β/6}+2e^{3β/2}`; `Z₄ = 8e^{β/2}+2e^{2β}+6`; wrong coupling gives `2e^{2β}+2` | agree with Checks; matches FV (2.2) at `d = ½` | none |
| 1.1 heat-bath formula | two configurations agreeing off `i` | weight ratio `exp(β((Nm̌+1)²−(Nm̌−1)²)/(2N)+2h) = exp(2(βm̌+h))` | `(1+tanh)/2` as stated; FV p. 71 | none |
| 1.2 definitions, junk values | `m = 0, ±1, 2`; `β = 0` | `s(0)=log 2`, `s(±1)=0`; `binEntropy(3/2) = −(3/2)log 3+log 2`; `rateFunction 1 0 2 = (3/2)log 3 − 2 < 0` since `27 < e⁴ ≈ 54.6` | Checks true; restriction to `[−1,1]` is needed | none |
| 1.2 derivative of `freeEnergy` | `p = (1+m)/2` in `deriv_binEntropy` | `−βm − ½ log((1−m)/(1+m)) = artanh m − βm` | as stated | none |
| 2.1 (sampled) | `β ≤ 0`, `0 < β ≤ 1`, `β = 1` | `tanh(βm) ≤ 0 < m`; `tanh(βm) < βm ≤ m`; `f₁+log 2 = m⁴/12+…`; `sSup{0}=0` | single solution, single minimiser; Lean sets `{0}` match | none |
| 2.2 (sampled) | `β = 2`; `β ↓ 1` | `tanh 1 > ½ ⇔ e² > 3`; `(artanh m − m − m³/3)' = m⁴/(1−m²)`; `m*² ≈ 3(β−1)/β³`; FV (2.24) at `d=½` gives the same | bound `m*² ≤ 3(β−1)` holds, constant sharp | none |
| 3.1 (sampled) | `β = 0`; `β < 0`; `N = 2, k = 1`; product law in the variational Check | `log(2cosh h)` both sides; `Z < 2^N`, `ψ = log 2`; `4/3 ≤ 2 ≤ 4`; `E_q[M²] = N²m²+N(1−m²)` | limit true, finite-`N` inequality only for `β ≥ 0`, as said | none |
| 3.1 binomial–entropy estimate | ratio test | `b_{j+1}/b_j ≥ 1 ⇔ j ≤ k−1+p ⇔ j ≤ k−1` | `b_k` maximal, bounds `e^{NH}/(N+1) ≤ C(N,k) ≤ e^{NH}` | none |
| 3.2 (sampled) | `J = {m₀}`; `[½,1]`; `{0}∪[½,1]`; `[−2,2]`; `[m*(2),1]` | lhs `0`, rhs `<0`; `−((3/4)log 3 − log 2)`, negative as `16<27`; even `N → 0`, odd `N →` negative; rhs positive; `0` | each hypothesis needed, statement true with them | none |
| 4.1 (sampled) | `ε ≥ 1`; two closed intervals | rate `= f_β(m) − f_β(0) ≥ r > 0`; `2e^{−Nr/2}` | `c = r/2`; FV Thm 2.2(1), `β ≤ β_c` | none |
| 4.2 (sampled) | `ε < min(m*, 1−m*)`; `β = 2, ε = ¼` | three intervals, `3e^{−Nr/2} ≤ 2e^{−Nr/4}` eventually; event forces `|m| > ¼` | `b = r/4`; extension to all `ε` valid by monotonicity | none |
| 4.3 (sampled) | `N = 0`; `N = 1`; `β = −1`; `β > Nε`; `ε > 1` | lhs `1`, rhs `0`; `Var f = 1 − tanh² h`; lhs `1`, rhs `0`; rhs `> 2/ε ≥ 2`; event empty | bound holds for all `N ≥ 1`, `β ≥ 0`; FV's "N large" not needed | none |
| 4.3 Lipschitz step | one-site change | `2/N + (N−1)/N · 2β/N ≤ (2+2β)/N`; `|f − (m − tanh)| ≤ β/N` | matches FV with `2dβ = β` | none |
| 5.1 (sampled) | `N = 1`; `N = 2` at `q = 3, 7, 15`; `β = 0` | `t_mix = 1`; `Φ(S) = 1/(1+q)`, bounds `1, 2, 4`, exact `t_mix = 3, 6, 11` (recomputed, rational arithmetic); `t_mix ≤ ⌈N log 4N⌉` | statement true with `C = ½`, `r = min(δ/2, log 2/N₁)` | none |
| 5.1 bottleneck constants | boundary levels `M ∈ {−1,−2}` | weight `≤ 2^N e^{2β/N}`; `μ(S) ≥ e^{N(log 2+δ)}/((N+1)Z)`; `Φ(S) ≤ (N+1)e^{2β}e^{−Nδ}` | as stated | none |
| Relation to the complete graph | unordered pairs | `Σ_{i<j} σσ = (M²−N)/2`; LPW `ϕ''(½) = −4(1−α)` | LPW's `α` is this `β` | none (C01) |

- Source locators checked against the text: 21 into Friedli–Velenik (author's revised version, all at the stated printed pages 58–75) and 5 into Levin–Peres (author's second-edition copy, pp. 44, 54, 90, 218); none wrong.
- Library declarations opened at the pins: 22 (among them `Real.deriv_binEntropy`, BinaryEntropy.lean:191; `Real.artanh_eq_half_log`, Artanh.lean:55; `Kernel.IsReversible.invariant`, Invariance.lean:63; `meas_ge_le_variance_div_sq`, Variance.lean:398; Tau Ceti `klDiv_tilted_neg_add_ofReal_neg_log`, Tilted.lean:72, and `Real.hasDerivAt_artanh`, Artanh.lean:185); all exist with the hypotheses the README gives.
- Cross-roadmap citations resolved at the open heads: MarkovChainMixing 1.2, 1.3, 3.1, 5.3, 6.1 with `mixingTime_le_iff`, `ceil_le_mixingTime_of_bottleneckRatio`, `isMarkovKernel_glauber`, `isReversible_glauber`; SimulatedAnnealing 3.1; QuantumOptimization 1.1. The six copied definitions are identical to the suppliers' bodies.
- Dependency check: `depcheck: 136 roadmaps, 1514 edges, 0 problem(s)`; no change outside the folder.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning (8 theorems). Signature pass: the 22 elaborated types were compared with the README; the four flagged binders (`[Fintype ι]` on `spin`, `[MeasurableSingletonClass S]` on `gibbs`, `tvToStationary`, `mixingTime`) are unused classes in verbatim copies and lose nothing. One-tactic probe (`simp`, with unfolding) on seven of the eight theorems, on a copy outside the repository: none closes; no padding.
- Headline theorems (thermodynamic limit 3.1 and 3.2, the transition 2.1, 2.2, 4.1, 4.2, the exchangeable-pair bound 4.3, slow mixing 5.1): all eight are stated in `Suggested.lean` at the README's generality.
- Duplication by object: no Curie–Weiss law, mean-field free energy or binomial–entropy bound in the pinned Mathlib or Tau Ceti; LargeDeviations lists the Curie–Weiss model as outside its scope.

Overlap check: read GlauberDynamicsOfTheIsingModel, GibbsMeasuresAndTheIsingModel, MarkovChainMixing (scope sections; RestrictedBoltzmannMachines, HopfieldNetworks and LargeDeviations searched for the shared objects); nothing shared. The Ising law of a general finite graph and fast mixing on the complete graph at `α < 1` are GlauberDynamicsOfTheIsingModel's, which leaves slow mixing at `α > 1` and the mean-field free energy to this roadmap (C01); Glauber dynamics, mixing times and the bottleneck bound are MarkovChainMixing's.

Source independence: 12 passages compared with 2 sources, none shared; largest share FV, 21 of 26 locators; contents compared with FV Chapter 2 (2.1 approximation, 2.2 zero field, 2.3 nonzero field, 2.5 complements): independent — the layers treat both fields together, put the mean-field equation before the limit as the dependency of 4.1–4.2 and 5.1 on 2.1–2.2 requires, and Layer 5 is from LPW.

Research link: The headline targets are the mean-field theory of Friedli–Velenik (2017), Chapter 2, with the exchangeable-pair bound they attribute to Chatterjee, and the slow-mixing half of Levin–Peres (2017), Theorem 15.4; rests on the README's sources, both read.

## Not verifiable

- none

## Source issues

- **Gap** in FV at Proposition 2.5, (2.7), printed page 61: the source says the exponential limit for the magnetisation holds for any interval inside `[−1, 1]`; it should be restricted to intervals with nonempty interior, since a one-point interval has probability zero for infinitely many `N`; affects a stated result.

## For the human reviewers

- none
