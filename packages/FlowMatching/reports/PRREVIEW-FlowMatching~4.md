# Review of FlowMatching (pull request #2501 at c639a57)

**Verdict:** accepted

**Summary.** Accepted, as an incremental re-review of the 20 lines changed since `09a99b6`: the four small corrections and two format notes of the previous review are all repaired, and the repairs are correct (the four numbers of the Check of 5.2 were recomputed, the Grönwall lemma now cited was opened at the pin, the joint regularity of the score was verified). No finding. One small correction remains, on the wording of the sentence added in 3.1; it does not block. The three points for the human reviewers stand.

## C01 — The sentence added to 3.1 calls `α` and `β` continuous, but the bullet it stands in assumes them only measurable

The velocity–score bullet of 3.1 is one of the three introduced by "and, for measurable `α`, `β`:" (README line 373), and the new sentence (lines 396–398) argues "`α` and `β` are continuous, so the smoothed density and its gradient are continuous in `(t, x)` where `β t > 0`". A reader takes continuity of the schedule as a hypothesis of the identity that is stated nowhere, or takes the argument as not covering the stated case.

The conclusion the sentence is there for, the measurability of `(t, x) ↦ s_t x`, holds without it: for a probability measure `μ₁` the smoothed density `∫ φ_{s²}(y − c x) dμ₁ x` has integrand at most `(2πs²)^{−d/2}`, and its gradient has integrand at most `(2πs²)^{−d/2} e^{−1/2}/s`, both locally bounded on `s > 0`, so by dominated convergence the density (which is positive) and its gradient are continuous in `(c, s, y)` on `s > 0`; composing with the measurable map `(t, x) ↦ (α t, β t, x)` gives the measurability. The smallest change: "…is proved here: the smoothed density and its gradient are continuous in `(c, s, y)` on `s > 0`, by dominated convergence, and `α`, `β` are measurable."

## Previous findings

- The previous report, of `09a99b6`, had no finding (no R01). Its small corrections and format notes at this head:
- C01 (values of the Check of 5.2) — repaired: "`0.211 ≤ 0.316 ≤ 0.333 ≤ 0.471`" (line 656); recomputed, see the table.
- C02 (joint measurability of the score in 3.1) — repaired: "The measurability of `(t, x) ↦ s_t x` on `(a, b) × E` that a marginal velocity needs is proved here"; the reason given misstates a hypothesis, C01 above.
- C03 (Grönwall citation) — repaired: the *Needs* lines of 1.1 and 1.2 and the Mathlib contract cite `dist_le_of_trajectories_ODE_of_mem` with "`∀ t ∈ Ico a b, LipschitzOnWith K (v t) (s t)`… here `s t = univ`".
- C04 (description and supplier section 1.7) — repaired: the description now says "and its nonlinear Carathéodory theorem (1.7) gives a second route to the existence of the flow's curves in 1.1".
- N01 (second Check of 1.1) — repaired: "both `t ↦ 0` and `t ↦ t²` are integral curves from `x = 0`".
- N02 (dated sentence in Downstream consumers) — repaired: the sentence is gone; the section opens "The discretization error of a numerical integrator…".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 5.2 Wasserstein bound, third Check (`wassersteinEDist_map_flow_le` and the display) | `u = sin x + t`, `w = (4/5) tanh x + (9/10) t`, `μ = N(0,1)`, `[0,1]`, `p = 2`, `K = 4/5`; RK4, 1000 steps, 1801 nodes | both time-1 maps increasing, so `W₂ = ‖φ₁ − ψ₁‖_{L²(μ)} = 0.21127`; theorem's bound `0.31590`; `ε = 0.21186`; `1.5718 ε = 0.33300`; `e^{0.8} ε = 0.47150` | true; README's `0.211 ≤ 0.316 ≤ 0.333 ≤ 0.471` agrees |
| 1.1 Lipschitz bounds and 1.2, by `dist_le_of_trajectories_ODE_of_mem` | hypotheses with `s t = univ`; `v t x = t•x` on `[0,2]`, `K = 2`; `a = b` | lemma asks `LipschitzOnWith K (v t) (s t)` for `t ∈ Ico a b` only: supplied by the Conventions on `[a,b]`; `e² = 7.39 ≤ e⁴ = 54.6` at `t = 2`; `Ico a a` empty, bound `δ` at `t = a` | true; contract line matches the declaration |
| 1.1 second Check (non-uniqueness) | `γ = 0`, `γ = t²` for `v = 2√|x|`, `t ≥ 0` | `γ' = 0 = 2√0`; `γ' = 2t = 2√(t²)`; both start at `0` | true as now worded |
| 3.1 velocity–score identity, added sentence | `μ₁ = dirac x₀`; general probability `μ₁`; `s → 0` | score `−(y − c x₀)/s²`, continuous on `s > 0`, unbounded as `s → 0`; integrand bounds `(2πs²)^{−d/2}` and `(2πs²)^{−d/2} e^{−1/2}/s` | measurability true; stated reason assumes continuity of `α`, `β` (C01) |

The rows of the earlier reviews stand for every other statement, as in the previous review, of `09a99b6`: none was changed.

- Source locators: the diff adds or changes none; the seeded targets 1.1, 1.2, 3.1 and 5.2 were checked where the diff falls in them (their changed passages are "proved here" or cite the library).
- Library declarations opened at the pin: `dist_le_of_trajectories_ODE_of_mem` and `dist_le_of_trajectories_ODE` (`Mathlib/Analysis/ODE/Gronwall.lean`, lines 208 and 228).
- Cross-roadmap citations resolved on main: DenoisingDiffusion 3.1 (the smoothed density, positive and `C^∞` for fixed `(c, s)`, and `noisyScore`); no roadmap on main cites FlowMatching.
- Dependency check: `depcheck: 182 roadmaps, 2070 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/FlowMatching/Suggested.lean`: exit 0, 16 warnings, all `sorry`; the file is unchanged since `2a73dce`, so the signature comparison and the one-tactic probe of the first review stand. The automatic checks all passed.
- Nothing changed outside the folder.
- Title and description against the head: a new roadmap, four supplier roadmaps, section 1.7 now named; nothing contradicted or left out.

Overlap check: read ScoreBasedDiffusion, DiffusionODESamplerGuarantee, DenoisingDiffusion, OptimalTransport, DiracScatteringAndNonlinearFourierTransform; nothing shared. As in the previous review: DiffusionODESamplerGuarantee is a consumer that cites this roadmap as owner; the change touches no ownership, and no open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only: 5 passages (the Check of 1.1, the two *Needs* lines, the sentence added to 3.1, the Mathlib contract line) compared with albergo2023 at Proposition 4 and with the Mathlib docstring; none shared; largest share lipman2023, 3 of 11 locators, as before; no layer added, removed or reordered, so the arrangement was not compared again.

Research link: Layers 2 and 3 state the flow-matching theorems of Lipman, Chen, Ben-Hamu, Nickel and Le (2023) and Liu, Gong and Liu (2022); Layer 4 the probability-flow equation of Song et al. (2021); Layer 5 the Wasserstein error bound of Benton, Deligiannidis and Doucet (2024). Rests on the README's citations, each read at its locator.

## Not verifiable

- none

## Source issues

- **Misprint** in albergo2023 at Proposition 4, equation (28), first line, p. 7: the source says the score is minus `x` minus `(2/π) tan(πt/2)` times the velocity; it should be minus `x` plus `(2/π) tan(πt/2)` times the velocity, as (F.4) and the second line of (28) give; affects a stated result.

## For the human reviewers

- Scope: all six sources are machine-learning papers (three ICLR, one NeurIPS, one TMLR; liu2022 is cited as an arXiv preprint). Ten of the fourteen sections end "proved here", the sources stating the results without regularity hypotheses.
- Overlap: the open roadmap IncompressibleFlows, Layer 3 item 1, also plans Liouville's formula for flows, for jointly `C¹` fields. Section 1.2 here is more general in time regularity and does not name it; which roadmap owns the common case is undecided.
- Licence: `TauCetiRoadmap/FlowMatching/README.md`, in Scope and ownership, names the author's repository lean4-mlir (BSD-3) as provenance and says it has no proofs of this material. The repository was not opened; the Lean statements were not compared with it.
