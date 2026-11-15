# Review of MinimalSurfaces (pull request #2321 at 664cc10)
Folder: `TauCetiRoadmap/RiemannianGeometry/MinimalSurfaces/`
**Verdict:** accepted

Incremental re-review of 0 changed lines since 664cc10; this round reads the title and description against the head. No finding.

## Previous findings

- none: the previous report, of 664cc10, had no finding (its four bullets recorded repairs of an earlier report, and the passages they quote are unchanged at this head).

## Verified sound

| Statement | Instance | Roadmap side | Computed side | Result |
|---|---|---|---|---|
| 2.6 translation law `w_(k+ℓ)(p) = w_k(p) + w_ℓ(τ_k p)` | `u = cθ`, k = 2, ℓ = −3 | `w_(−1) = w_2 + w_(−3)∘τ_2` | `w_(−1) = −2πc`; `4πc + (−6πc) = −2πc` | holds |
| 2.6 injectivity on a strip | `Ω = (1,2) × (0,5π)`, `u = cθ`, `c > 0` | `w > 0` on `Ω_1` gives `G_u` injective | `Ω_1`: `θ ∈ (0,3π)`, `w = 2πc`; `Ω_2`: `θ ∈ (0,π)`, `w_2 = 4πc`; `Ω_k = ∅` for `|k| ≥ 3` | holds |
| 2.6 negative Check, disconnected sections | `Ω = (1,2) × ((0,π/4) ∪ (4π,4π+π/4))`, `u = 0` | `Ω_1` empty, `Ω_2` not; not injective | `θ+2π ∈ (2π,2π+π/4) ∪ (6π,6π+π/4)` misses Ω; `θ+4π ∈ (4π,4π+π/4)`; `G_u(ρ,θ) = G_u(ρ,θ+4π)` | holds |
| 2.6 scaling law | `u = cθ`, λ = 3 | `w_(u_λ,1)(ρ,θ) = λ w_(u,1)(ρ/λ,θ)` | `u_λ = 3cθ`, `w = 6πc`; right side `3 · 2πc = 6πc` | holds |
| Description: "changes the first source of MS2.5 … from [CM, §1.7] to [CM, §1.9]" | diff of `README.md` against the base, 2.5 | one *Sources:* line changed | base `[CM, §1.7]`, head `[CM, §1.9]`; second source unchanged | holds |
| Description: "`Suggested.lean` … has no MS2 target signatures" | section comments of `Suggested.lean` | no Layer 2 declaration | Layers 4, 5, 7, 10 only; 0 Lean lines changed against the base | holds |

The rows for the untouched statements stand as in the previous review, of 664cc10.

- Title and description, sentence by sentence against the diff from the base (83 lines, `README.md` only, 0 headings and 0 Lean declarations added or removed): the 2.6 extension (deck overlaps, separation, strip injectivity, local Harnack and gradient bounds from 2.5, scaling, Checks), the kept sentence on the consumers of 2.6 (`README.md` lines 600–601), the 2.2 locator, the 2.5 source and "only `README.md` changes" each hold. Nothing a reader must know is left out: no section is removed or renumbered, no declaration is removed, and no supplier is added (PDE E23, cited by the new 2.2 line, is cited by 2.2 on the base already).
- Cross-roadmap citations resolved for the passages the description names: PDE §5.4 (E23) on main; parent R5a.2, `TauCetiRoadmap/RiemannianGeometry/README.md` line 3422, "pitch a".
- Gate at 664cc10: the worker's run and this review's run pass, every check 0. Depcheck: `depcheck: 245 roadmaps, 2209 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 5 `sorry` warnings and nothing else; the 7 elaborated signatures are those of the previous review.
- Nothing outside the folder changes against the base; the folder is unchanged since 664cc10, so the seeded sample falls in no changed passage and no source locator was read again.

Overlap check: read LorentzianGeometry, ManifoldOptimization, PDE, TeichmullerGeometry and YangMillsConnectionsAndCaloricGauge (open), and RiemannianGeometry, Surfaces and PositiveMass (main), as in the review of 664cc10; shared: the helicoid and its pitch (owner RiemannianGeometry R5a.2, cited) and the De Giorgi–Nash–Moser Hölder estimate (owner PDE E23, cited). No open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only; 0 lines changed since 664cc10, so 0 passages compared with 0 sources; largest share Chodosh, 58 of 181 locators (the previous count); no layer was added, removed or reordered, so the contents were not compared again.

## Not verifiable

- [CM] (AMS GSM 121): no legal copy was found, so the [CM, §1.9] locators of 2.5 and 2.6, which the description names, remain unread.
- The paywalled sources of the sample ([ChoiSchoen], [ChoiWang], [Reilly], [Frankel], [WhiteReg], [Bernstein], [Schoen], [FCS], [Pogorelov], [GT]) were not read again; their status is as in the previous reviews.

## Source issues

- none

## For the human reviewers

- Scope: no item of this roadmap consumes 2.6 (`README.md` line 600). This pull request enlarges 2.6 for the one-sided curvature estimate and [CM4], which the Scope section (lines 105–110) places outside the roadmap.
- Scope: the route of 7.4 follows [Lynch], an unrefereed preprint (arXiv:2611.12758v1, 2026). The theorem it serves, 7.5, is Schoen's published estimate.
- Licence: [Chodosh] was fetched from the author's Stanford page (web.stanford.edu/~ochodosh), a host that the sources service has no class for; an earlier review classified it as author-page.
- Not tested: [CM], with 32 of 181 locators (the second largest share), could not be read, including the [CM, §1.9] locators of this pull request.
