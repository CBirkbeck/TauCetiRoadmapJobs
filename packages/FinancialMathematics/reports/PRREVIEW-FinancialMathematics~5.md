# Review of FinancialMathematics (pull request #2557 at 9196a42)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 33 lines changed since `507c038`: the two uniqueness theorems of §4.2 no longer assume joint continuity of the derivatives, which I checked against the pinned whole-space uniqueness theorem and by recomputing the transformed equation, and an explicit anchor keeps MarketImpact's link to Layer 1 valid. One small correction (no statement carries a literature locator) and one format note are carried over, neither blocking. The human reviewers still have to note that no source text could be read.

## C01 — No statement of the README carries a source locator

Carried from the earlier rounds; this head does not change it. The References say which work is the classical source of which result and that the hypotheses are the roadmap's own formulation, but the classical targets still cite nothing: completeness and pricing (§2.2), absence of arbitrage (§2.3), necessity of the pricing equation (§3.1), the call and put hedges (§4.1). A theorem and page number for each, in the four works already listed, would let a reader compare hypotheses; none could be checked in this review, since no legal copy of the four was readable.

## N01 — The domain D of Layer 3 is written without its lower time bound

Layer 3 (line 398) sets "D = {(s, t) : s > 0, t < T}", while the coefficients live on (0, ∞) × [0, T] and the starts have t₀ ∈ [0, T). Writing 0 ≤ t < T, with the time derivative at t = 0 taken from the right, says what §3.1 uses when it evaluates the operator at a start (s₀, 0).

## Previous findings

The previous report had no finding (R); its small corrections and format note are accounted for here.

- C01 — not repaired: the README still has no literature locator; carried as C01 above.
- C02 — repaired: `hcont_t`, `hcont_s`, `hcont_ss` are gone from both Lean theorems; §4.2 reads "twice continuously differentiable in s and differentiable in t on the open domain … without joint continuity of the derivatives", and the stochastic route says it "needs V of class C^(2,1)".
- C03 — repaired (it was deferred as D01): the README now carries `<a id="m01-assets-and-trading"></a>` before the heading of Layer 1 (line 84), the target of MarketImpact's link.
- N01 — not repaired: line 398 is unchanged; carried as N01 above.

## Deferred findings

- D01 — resolved: an explicit anchor `m01-assets-and-trading` before the Layer 1 heading (README line 84) keeps MarketImpact's link `../README.md#m01-assets-and-trading` valid without a change there.

## Verified sound

| Statement | Instances tried | Values computed (README side / my side) | Result |
|---|---|---|---|
| §4.2 `eq_callValue_of_pde`, weaker class: hypotheses of the pinned theorem | each hypothesis of `eqOn_of_deriv_sub_…_eq_of_eqOn_initial` for v = D(e^y, T − τ)/(1 + e^y) against 0 | continuity from `hcont`; \|v\| ≤ A + 1 from `hgrowth` and 0 ≤ C ≤ s; `ContDiffAt ℝ 2` from `hspot` (Ioi 0 open); `DifferentiableAt` from `htime`; no joint continuity asked | holds; nothing else needed |
| §4.2 transformed equation | D = w v, w = 1 + e^y, ρ = e^y/w | sD_s = w(v_y + ρv); s²D_ss = w(v_yy + (2ρ − 1)v_y); v_τ = (σ²/2)v_yy + (r − σ²/2 + σ²ρ)v_y − r(1 − ρ)v / same | holds; \|b\| ≤ \|r\| + σ²/2, c ≤ \|r\|, trace σ²/2 |
| §4.2 degenerate and boundary cases | A < 0; s = 0; t = T; t = 0; r < 0 | A < 0 makes `hgrowth` unsatisfiable (vacuous, true); s = 0 by `hcont`; τ = 0: callValue = (s − K)⁺; t = 0 inside Icc; c ≤ \|r\| for either sign | holds |
| §4.2 `eq_putValue_of_pde` | same route with P; 0 ≤ P ≤ K e^(−rτ) | \|D\| ≤ A(1 + s) + K max(1, e^(−rT)), so v bounded; terminal (K − s)⁺ = putValue at τ = 0 | holds |
| §4.2 class not droppable (Check) | Tychonoff solution added to C | fails `hgrowth`, satisfies the rest; the weaker differentiability class does not readmit it | Check still true |
| Overview headline 3 against §4.2 and Lean | elaborated types of the two theorems | "twice continuously differentiable in s and differentiable in t" / `ContDiffOn ℝ 2` on Ioi 0, `DifferentiableOn` on Ioo 0 T, no further regularity | agree |

The rows for the untouched statements stand as in the previous review, of `507c038`.

- Source locators checked: 0; the README carries none, and the changed passages add none.
- Library declarations opened at the pins: `TauCeti/Analysis/PDE/MaximumPrinciple/Parabolic/WholeSpace.lean` 474–497 (the uniqueness theorem: `ContDiffAt ℝ 2` in space, `DifferentiableAt` in time, continuity on the closed slab, bounded difference); `TauCeti/Probability/Finance/BlackScholes/Extension.lean` 124, 195, 230, 279, 298.
- Cross-roadmap citations resolved: MarketImpact's README on main (line 612) links `../README.md#m01-assets-and-trading`; the anchor exists at this head (README line 84). No other roadmap on main links an anchor of this README. The changed passages cite no new section.
- Dependency check: `depcheck: 182 roadmaps, 2069 edges, 0 problem(s)`. No change outside the folder; the MarketImpact sub-folder is untouched.
- Automatic checks: all passed.
- Elaboration: `Suggested.lean` gives three `sorry` warnings (lines 58, 83, 99) and nothing else. The elaborated types of the two changed theorems were compared with §4.2: no binder lost. One-tactic probes (`simp`, `rfl`, `simp_all`) close neither.
- Description against the head: its paragraph on the uniqueness class ("without joint continuity of the derivatives … the stopped-Itô argument is a second route, for solutions of class C^(2,1)") and its `Suggested.lean` paragraph agree with this head; nothing the change does is left unstated.

Overlap check: read MarketImpact, StochasticCalculus and DysonBrownianMotion on main and the open YoungIntegrationAndRoughPaths, MartingaleCentralLimitTheorem and LawOfTheIteratedLogarithm as in the previous review; nothing shared. The change adds no object; no open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only: 3 passages (the overview sentence, the §4.2 statement, the Lean docstring) compared with 0 sources, since the README has no source locator (largest share: none, 0 of 0) and none of its four references could be read legally; the change adds, removes or reorders no layer.

Research link: Layer 2 is the completeness and martingale-pricing theory of Harrison–Pliska (1981); Layer 4 is the Black–Scholes (1973) price and hedge; MarketImpact builds its feedback-pricing model on Layers 1–3. Rests on the README's and MarketImpact's reference lists; no source text was read.

## Not verifiable

- The seeded sample where it falls in the changed passages (§1.1's heading, §4.2) against the literature: no target carries a locator; §4.2 was checked by computation and against the pinned theorem instead.
- Black–Scholes 1973, Harrison–Pliska 1981, Karatzas–Shreve 1998 and Shreve 2004: no legal copy was found in the earlier rounds; not requested again.

## Source issues

- none

## For the human reviewers

- Not tested: the README's References cite Black–Scholes 1973, Harrison–Pliska 1981, Karatzas–Shreve 1998 and Shreve 2004 without locators, and none could be read legally; wording and arrangement were compared with no source.
- Scope: PDE on main still lists the bundled parabolic Hölder spaces as not at the pins (`TauCetiRoadmap/PDE/Suggested.lean`, line 48), while this roadmap states §3.3 on the pinned `TauCeti.ParabolicC2HolderSpace`.
