# Review of FlowMatching (pull request #2501 at 09a99b6)

**Verdict:** accepted

**Summary.** Accepted, as an incremental re-review of the 13 lines changed since `2a73dce`: the new citation of DiracScatteringAndNonlinearFourierTransform 1.7 as a second route to the existence of the integral curves in 1.1 is correct, its hypotheses are met by the fields of 1.1, and the section exists on main with the statement the contract gives. No finding. Four small corrections (three carried from the previous review, which the change did not address, and one on the description) and two format notes remain; none blocks. The three points for the human reviewers stand.

## C01 — The numerical Check of 5.2 is accurate to two decimals only

In the third Check of 5.2 (README line 653) the four numbers are still `0.211 ≤ 0.314 ≤ 0.332 ≤ 0.469`. A reader who recomputes them to test an implementation gets different third decimals, and the last two are not consistent with each other: they are `1.5718 ε` and `2.2255 ε` for the same `ε`, yet `0.469/2.2255 = 0.2107` and `0.332/1.5718 = 0.2112`. Recomputed in the previous review: `W₂ = 0.2113`, the theorem's bound `0.3159`, the two bounds of the display `0.3330` and `0.4715`, with `ε = 0.2118`. Replace the values by `0.211 ≤ 0.316 ≤ 0.333 ≤ 0.471`.

## C02 — The velocity–score identity of 3.1 needs the score to be measurable in time and space jointly, which no supplier states

In the velocity–score bullet of 3.1 the field `n t = −β t • noisyScore μ₁ (α t) (β t)` is used as a marginal velocity, which by 2.1 is measurable on `ℝ × E`. DenoisingDiffusion 3.1 and 3.2, the cited suppliers, are statements for fixed `(c, s)` and say nothing about the dependence on `(c, s)`, so the *Needs* line leaves a step nothing provides. The step is easy (the smoothed density and its gradient are continuous in `(c, s, y)` on `s > 0` by dominated convergence); add one clause saying that this joint continuity is proved here.

## C03 — `dist_le_of_trajectories_ODE` assumes a Lipschitz bound at all times, and the roadmap's fields have one only on `[a, b]`

The *Needs* lines of 1.1 and 1.2 (README lines 121 and 150) and the Mathlib contract (line 745) cite `dist_le_of_trajectories_ODE`, whose first hypothesis is `∀ t, LipschitzWith K (v t)` (`Mathlib/Analysis/ODE/Gronwall.lean`, line 228). By the Conventions a field is `K`-Lipschitz only for `t ∈ Icc a b`. The form that applies is `dist_le_of_trajectories_ODE_of_mem` (same file, line 208), with `s t = univ`; cite that one.

## C04 — The description does not say that 1.1 now also consumes DiracScatteringAndNonlinearFourierTransform 1.7

The description's paragraph on suppliers says of that roadmap only "Liouville's formula for linear systems is DiracScatteringAndNonlinearFourierTransform 1.4". At this head 1.1, the Dependencies of Layer 1 and the supplier contracts also cite its section 1.7 (the nonlinear Carathéodory theorem) for a second route to the existence of the integral curves. Add a clause, for example: "and its nonlinear Carathéodory theorem (1.7) gives a second route to the existence of the flow's curves in 1.1".

## N01 — The second Check of 1.1 writes two curves as if they were flows

Line 112: "both `φ t x = x` and `φ t x = t²` describe integral curves from `x = 0`" means the curves `t ↦ 0` and `t ↦ t²`; as written the first reads as the identity flow, which is not a flow of `2 √|x|`.

## N02 — A sentence that dates the text

Line 669, "No roadmap on main consumes this one", is true only on the day it was written; the sentence after it carries the content. (An open roadmap, DiffusionODESamplerGuarantee, already cites 1.1, 2.1, 3.1, 3.2 and 5.2.)

## Previous findings

- The previous report, of `2a73dce`, had no finding (no R01). Its small corrections C01, C02, C03 and format notes N01, N02 are not addressed by this change and are written again above; the change is the citation of supplier section 1.7 only.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 1.1 existence (`exists_isFlowOn`), second route by DiracScatteringAndNonlinearFourierTransform 1.7 with `I = [a,b]`, `L = K`, `m t = ‖v t x‖` | hypotheses of 1.7; `v t x = t•x` on `[0,2]`, `K = 2`; `a = b`; `a > b`; `2√|x|`; incomplete `E` | time sections continuous hence strongly measurable; `L`, `m` continuous on `[a,b]` hence integrable; `Y = x + ∫₀ᵗ s e^{s²/2}x ds = e^{t²/2}x`; 1.7 bound at `t = 2`: `e² − 1 = 6.39 ≤ 2e⁴ = 109.2`; dependence `e² ≤ e⁴`; `I = {a}`, `Y = x`; `I` empty, identity flow, route not needed; excluded by 1.7's own Check; 1.7 asks a Banach space, as the bullet does | true |
| Same route, integral equation to integral curve | `s ↦ v s (Y s)` | `‖v s y − v s₀ y₀‖ ≤ K‖y − y₀‖ + ‖v s y₀ − v s₀ y₀‖`, so jointly continuous on `[a,b] × E`; the integral of a function continuous on `[a,b]` has that derivative within `[a,b]`, one-sided at the ends | true; matches `IsIntegralCurveOn` on `Icc a b` |
| Contract line for 1.7 | set beside the supplier's text | measurable in time, Lipschitz with integrable `L`, `‖F(t, x₀)‖ ≤ m(t)` integrable, existence and uniqueness of a continuous `Y` on `I`: all in the supplier's 1.7 | agrees |

The rows of the previous review, of `2a73dce`, stand for every other statement: none was changed.

- Source locators: the diff adds none (1.1 is "proved here"); the seeded target 1.1 was checked against its only new input, the supplier section.
- Library declarations opened at the pin: `IsIntegralCurveOn` (`Mathlib/Analysis/ODE/Basic.lean`, line 44), `dist_le_of_trajectories_ODE` and `dist_le_of_trajectories_ODE_of_mem` (`Mathlib/Analysis/ODE/Gronwall.lean`, lines 228 and 208), `intervalIntegral.integral_hasDerivWithinAt_right` (`Mathlib/MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean`, line 867).
- Cross-roadmap citations resolved on main: DiracScatteringAndNonlinearFourierTransform 1.7 (heading "1.7 The nonlinear Carathéodory theorem"; Layer 1 there takes `E` a Banach space over `ℝ` or `ℂ` and `I` any interval) and 1.4; the roadmap is on main and earlier in the merge order.
- Dependency check: `depcheck: 176 roadmaps, 1985 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/FlowMatching/Suggested.lean`: exit 0, 16 warnings, all `sorry`; the file is unchanged since `2a73dce`, so the signature comparison and the one-tactic probe of the previous review stand. The automatic checks all passed.
- Nothing changed outside the folder; the pull request has two commits, the second touching the README only.
- Title and description against the head: a new roadmap, the same four supplier roadmaps; one omission, C04.

Overlap check: read ScoreBasedDiffusion, DiffusionODESamplerGuarantee, DenoisingDiffusion, OptimalTransport, DiracScatteringAndNonlinearFourierTransform; nothing shared. DiffusionODESamplerGuarantee is a consumer: it cites FlowMatching 1.1, 2.1, 3.1, 3.2 and 5.2 as the owner and restates none. DiracScatteringAndNonlinearFourierTransform 1.7 owns the single-curve Carathéodory theorem; 1.1 here owns the flow map (joint continuity, bijectivity, the two-sided Lipschitz bounds) and now cites 1.7. The other roadmaps of the previous review's overlap line stand as there.

Source independence: changed passages only: 3 passages (the added sentence of 1.1, the *Needs* clause, the contract line) compared with the supplier's section 1.7 and with no external source, since they cite none; none shared; largest share lipman2023, 3 of 11 locators, as before; no layer added, removed or reordered, so the arrangement was not compared again.

Research link: Layers 2 and 3 state the flow-matching theorems of Lipman, Chen, Ben-Hamu, Nickel and Le (2023) and Liu, Gong and Liu (2022); Layer 4 the probability-flow equation of Song et al. (2021); Layer 5 the Wasserstein error bound of Benton, Deligiannidis and Doucet (2024). Rests on the README's citations, each read at its locator.

## Not verifiable

- none

## Source issues

- **Misprint** in albergo2023 at Proposition 4, equation (28), first line, p. 7: the source says the score is minus `x` minus `(2/π) tan(πt/2)` times the velocity; it should be minus `x` plus `(2/π) tan(πt/2)` times the velocity, as (F.4) and the second line of (28) give; affects a stated result.

## For the human reviewers

- Scope: all six sources are machine-learning papers (three ICLR, one NeurIPS, one TMLR; liu2022 is cited as an arXiv preprint). Ten of the fourteen sections end "proved here", the sources stating the results without regularity hypotheses.
- Overlap: the open roadmap IncompressibleFlows, Layer 3 item 1, also plans Liouville's formula for flows, for jointly `C¹` fields. Section 1.2 here is more general in time regularity and does not name it; which roadmap owns the common case is undecided.
- Licence: `TauCetiRoadmap/FlowMatching/README.md`, in Scope and ownership, names the author's repository lean4-mlir (BSD-3) as provenance and says it has no proofs of this material. The repository was not opened; the Lean statements were not compared with it.
