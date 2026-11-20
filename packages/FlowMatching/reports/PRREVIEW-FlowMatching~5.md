# Review of FlowMatching (pull request #2501 at 4abc8bd)

**Verdict:** accepted

**Summary.** Accepted, as an incremental re-review of the 4 lines changed since `c639a57`: the one small correction of the previous review (the sentence in 3.1 that called the schedule continuous) is repaired, and the repair is correct: the joint measurability of the score now rests on the continuity of the smoothed density and its gradient in the three parameters and on the measurability of `α` and `β`, which is the hypothesis the bullet states. No finding, no small correction and no format note. The three points for the human reviewers stand.

## Previous findings

- The previous report, of `c639a57`, had no finding (no R01). Its small correction at this head:
- C01 (the sentence added to 3.1 assumed `α`, `β` continuous) — repaired: "the smoothed density and its gradient are continuous in `(c, s, y)` on `s > 0`, by dominated convergence, and `α`, `β` are measurable" (README lines 397–398).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 3.1 velocity–score identity, the changed sentence (measurability of `(t, x) ↦ s_t x` on `(a, b) × E`) | general probability `μ₁`; `μ₁ = dirac x₀` with `α` a step function; `s → 0` | integrands bounded by `(2πs²)^{−d/2}` and `(2πs²)^{−d/2} e^{−1/2}/s` (maximum of `r e^{−r²/2s²}/s²` at `r = s`), locally bounded on `s > 0`; Dirac score `−(y − c x₀)/s²`: continuous in `(c, s, y)`, discontinuous in `t` for a step `α`, still measurable | true as now worded; the earlier "continuous in `(t, x)`" would fail for the step `α` |
| DenoisingDiffusion 3.1, as cited by the sentence | `smoothedDensity μ₀ c s y`, `noisyScore μ₀ c s y` on main | density `∫ φ_{s²}(y − c • x) dμ₀ x`, positive for `s > 0`; score `∇ log` of it, so `∇p/p` is continuous where `p` and `∇p` are; `β t > 0` on `(a, b)` puts `(α t, β t, x)` in `s > 0` | the letters `(c, s, y)` are the supplier's, repeated in this README's contract for DenoisingDiffusion 3.1 |

The rows of the earlier reviews stand for every other statement, as in the previous review, of `c639a57`: none was changed.

- Source locators: the diff adds or changes none; the seeded target 3.1 was checked where the diff falls in it (the changed passage is "proved here"); the other seeded targets are untouched.
- Library declarations opened at the pin: none needed by the change.
- Cross-roadmap citations resolved on main: DenoisingDiffusion 3.1 (`smoothedDensity` and `noisyScore`, `TauCetiRoadmap/DenoisingDiffusion/Suggested.lean` lines 146 and 150; README lines 259–267).
- Dependency check: `depcheck: 182 roadmaps, 2070 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/FlowMatching/Suggested.lean`: exit 0, 16 warnings, all `sorry`; the file is unchanged since `2a73dce`, so the signature comparison and the one-tactic probe of the first review stand. The automatic checks all passed.
- Nothing changed outside the folder.
- Title and description against the head: a new roadmap, four supplier roadmaps, the same sections and declarations; the change touches nothing they describe; nothing contradicted or left out.

Overlap check: read ScoreBasedDiffusion, DiffusionODESamplerGuarantee, DenoisingDiffusion, OptimalTransport, DiracScatteringAndNonlinearFourierTransform; nothing shared. As in the previous reviews: DiffusionODESamplerGuarantee is a consumer that cites this roadmap as owner; the change touches no ownership, and no open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only: 1 passage (the sentence of 3.1 on the measurability of the score) compared with albergo2023 at Proposition 4 (line 418) and with DenoisingDiffusion 3.1; none shared (neither text has the argument); largest share lipman2023, 3 of 11 locators, as before; no layer added, removed or reordered, so the arrangement was not compared again.

Research link: Layers 2 and 3 state the flow-matching theorems of Lipman, Chen, Ben-Hamu, Nickel and Le (2023) and Liu, Gong and Liu (2022); Layer 4 the probability-flow equation of Song et al. (2021); Layer 5 the Wasserstein error bound of Benton, Deligiannidis and Doucet (2024). Rests on the README's citations, each read at its locator.

## Not verifiable

- none

## Source issues

- **Misprint** in albergo2023 at Proposition 4, equation (28), first line, p. 7: the source says the score is minus `x` minus `(2/π) tan(πt/2)` times the velocity; it should be minus `x` plus `(2/π) tan(πt/2)` times the velocity, as (F.4) and the second line of (28) give; affects a stated result.

## For the human reviewers

- Scope: all six sources are machine-learning papers (three ICLR, one NeurIPS, one TMLR; liu2022 is cited as an arXiv preprint). Ten of the fourteen sections end "proved here", the sources stating the results without regularity hypotheses.
- Overlap: the open roadmap IncompressibleFlows, Layer 3 item 1, also plans Liouville's formula for flows, for jointly `C¹` fields. Section 1.2 here is more general in time regularity and does not name it; which roadmap owns the common case is undecided.
- Licence: `TauCetiRoadmap/FlowMatching/README.md`, in Scope and ownership, names the author's repository lean4-mlir (BSD-3) as provenance and says it has no proofs of this material. The repository was not opened; the Lean statements were not compared with it.
