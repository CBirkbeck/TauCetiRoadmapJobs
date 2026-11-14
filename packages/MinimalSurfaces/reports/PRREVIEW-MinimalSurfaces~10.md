# Review of MinimalSurfaces (pull request #2321 at 664cc10)
Folder: `TauCetiRoadmap/RiemannianGeometry/MinimalSurfaces/`
**Verdict:** accepted

Incremental re-review of the 16 lines changed since 11039d6. No finding.

## Previous findings

- R01 — repaired: "the helicoid `(v cos t, v sin t, ct)`, of pitch c in R5a's convention (rise `2πc` per turn), with `w ≡ 2πc`"; "Under dilation by λ, c becomes λc and the separation becomes `2πλc`."
- R02 — repaired: "apply 2.5 in the planar coordinates with `R = s` to obtain, on the part of D lying over `B_(s/2)(x₀)`,"
- R03 — repaired: "*Sources:* [Chodosh, proof of Lemma 19.1, with the interior Schauder estimate (A.2) of Appendix A], for the bootstrap; the Hölder bound on Du is PDE E23 …, and the factor `R^(1−k)` is the scaling Check."
- R04 — repaired: the description now reads "It also adds a source locator for the MS2.2 interior estimate and changes the first source of MS2.5 (several sheets) from [CM, §1.7] to [CM, §1.9]."

## Verified sound

| Statement | Instance | Roadmap side | Computed side | Result |
|---|---|---|---|---|
| 2.2 *Sources:* line (sample) | Chodosh lines 2278–2301 (pp. 51–52) and 3825–3835 (p. 86) | bootstrap from the proof of Lemma 19.1 with (A.2) | the proof invokes (A.2) for `C^(2,α)`, then differentiates and repeats; (A.2) is the interior `C^(k+2,α)` estimate | locator holds |
| 2.2 Hölder bound on Du via PDE E23 | `D_k u` on `B_(2r)`, `|Du| ≤ M`; `u_λ` | E23 gives a seminorm bound of degree −α in r | `C r^(−α) r^(−n/2) ‖D_k u‖_(L²(B_(2r))) ≤ C′ M r^(−α)`; `[Du_λ]_α = λ^(−α)[Du]_α` | consistent with PDE §5.4 |
| 2.2 factor `R^(1−k)` | Scherk `log cos x − log cos y`, k = 2, λ = 2 | `D²u_λ(0) = λ^(−1) D²u(0)` | `u_xx(0) = −1`, `u_yy(0) = 1`: `√2` and `√2/2` | holds |
| 2.6 helicoid of pitch c | `(v cos t, v sin t, ct)`, `v > 0`, `t = θ` | graph of `u = cθ`; rise `2πc` per turn; `w ≡ 2πc` | height at `t+2π` minus height at t: `2πc`; parent R5a.2 calls a its pitch in `(v cos u, v sin u, a u)` | agrees with the parent |
| 2.6 dilation | `u = cθ`, λ = 3 | c becomes λc, separation `2πλc` | `u_λ = λ·c·θ = 3cθ`; `w = 6πc`; scaling law gives `λ·2πc = 6πc` | holds |
| 2.6 local estimates | 2.5 with `R = s` on `B_s(x₀)`; `u = cθ`, `c > 0` | bounds over `B_(s/2)(x₀)`, `|Dw| ≤ (C/s) w` | 2.5 gives `B_(R/2)` and `C/R`; on the helicoid sup/inf = 1 and `Dw = 0` | region and constant match 2.5 |

The rows for the untouched statements stand as in the previous review, of 11039d6.

- Source locators checked against the text: 2 (Chodosh, proof of Lemma 19.1, lines 2278–2301; Chodosh Appendix A (A.2), line 3826); both hold.
- Cross-roadmap citations resolved: PDE §5.4 (E23) on main, a ball Hölder estimate for weak solutions of divergence-form equations with bounded measurable coefficients; parent R5a.2, `TauCetiRoadmap/RiemannianGeometry/README.md` line 3422, "pitch a".
- Gate at 664cc10: the worker's run and this review's run both pass, every check 0. Depcheck: `depcheck: 244 roadmaps, 2200 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives 5 `sorry` warnings and nothing else. The file is unchanged since 11039d6, so the signatures and the one-tactic probe stand.
- Nothing outside the folder changes against the base. Since 11039d6 only `README.md` changed, in 2.2 and 2.6.
- The title and description were read against the head: each sentence holds, and the two additions outside 2.6 (the 2.2 locator, the 2.5 source) are stated.
- The seeded sample falls in the changed passages at 2.2 only.

Overlap check: read LorentzianGeometry, ManifoldOptimization, PDE, TeichmullerGeometry and YangMillsConnectionsAndCaloricGauge (open), and RiemannianGeometry, Surfaces and PositiveMass (main); shared with the changed passages: the helicoid and its pitch (owner RiemannianGeometry R5a.2; 2.6 uses it in Checks and now in the parent's convention) and the De Giorgi–Nash–Moser Hölder estimate (owner PDE E23, cited). Multi-valued graphs have no other owner.

Source independence: changed passages only; 3 passages compared with 1 source (Chodosh lines 2278–2301 and 3825–3835), none shared beyond the names "Schauder" and "minimal surface equation"; largest share Chodosh, 58 of 181 locators (the previous count and the one this change adds); no layer was added, removed or reordered, so the contents were not compared again.

## Not verifiable

- [CM] (AMS GSM 121): no legal copy was found, so the [CM, §1.9] locators of 2.5 and 2.6 remain unread.
- The paywalled sources of the sample outside the changed passages ([ChoiSchoen], [ChoiWang], [Reilly], [Frankel], [WhiteReg], [Bernstein], [Schoen], [FCS], [Pogorelov], [GT]) were not read again; their status is as in the previous review.

## Source issues

- none

## For the human reviewers

- Scope: no item of this roadmap consumes 2.6 (README line 600). This pull request enlarges 2.6 for the one-sided curvature estimate and [CM4], which the Scope section (lines 105–110) places outside the roadmap.
- Scope: the route of 7.4 follows [Lynch], an unrefereed preprint (arXiv:2611.12758v1, 2026). The theorem it serves, 7.5, is Schoen's published estimate.
- Licence: [Chodosh] was fetched from the author's Stanford page (web.stanford.edu/~ochodosh), a host that the sources service has no class for; this review classified it as author-page.
- Not tested: [CM], with 32 of 181 locators (the second largest share), could not be read, including the [CM, §1.9] locators of this pull request.
