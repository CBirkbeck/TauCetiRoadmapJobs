# Review of FirstOrderOptimization (pull request #2474 at 36119b2)

**Verdict:** accepted

Incremental re-review of the 24 lines changed since a209c5a. No finding.

## Previous findings

- R01 — repaired: README lines 370–373, "`convexProjection C x` is the nearest point of `C` to `x` when exactly one exists, and `x` otherwise; for nonempty closed convex `C` it equals `metricProj C x`"; line 389, "can differ only outside".
- R02 — repaired: `Suggested.lean` lines 1–3 import `Mathlib`, `TauCeti.Analysis.Convex.Subdifferential` and `TauCeti.Analysis.GradientFlow.MoreauYosida.Basic` only; the file elaborates with the same 35 `sorry` warnings.
- R03 — repaired: `gradient_toReal_mem_subdifferential` and `Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le` occur nowhere in the README (lines 110–111, 113–114) or in `Suggested.lean` (lines 13–21).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 3.1 definition of `convexProjection` (README lines 370–373 against `Suggested.lean` lines 163–165) | `C = {−1, 1} ⊆ ℝ`, `x = 0`; `C = ∅`; `C = closedBall 0 1`, `‖x‖ = 2` | Two nearest points: README `0`, Lean `0`, `metricProj` `±1`. Empty: `x`, `x`, `0`. Ball: `x/2` in all three. | README and Lean agree | none |
| 3.1 "equals `metricProj C x`" for nonempty closed convex `C` | `C = Set.Icc (−1) 1`, `x = 3`; `C = {c}` | `‖3 − 1‖ = 2 = infDist`, unique nearest point `1` in both maps; singleton: `c` in both. Closed in complete `E` gives `IsComplete C`. | holds | none |
| 3.1 `convexProjection_firmlyNonexpansive` | unit ball, `x = 2e`, `y = 0`; `C = {c}` | `‖e‖² = 1 ≤ ⟪e, 2e⟫ = 2`; `0 ≤ 0`. | holds | none |

The rows for the statements the change does not touch stand as in the previous review, of a209c5a.

- Changed passages read: 4 (README lines 110–111, 113–116, 370–373, 389–390) and `Suggested.lean` lines 1–3, 13–21.
- Library declarations opened at the pins: 3. `exists_norm_eq_iInf_of_complete_convex` (`Mathlib/Analysis/InnerProductSpace/Projection/Minimal.lean:40`, hypotheses nonempty, `IsComplete`, convex), `exists_affine_le_of_lt` (`TauCeti/Analysis/Convex/FenchelMoreau.lean:147`), `StrongConvexOn.add_add_le_of_hasFDerivWithinAt` (`TauCeti/Analysis/Convex/Strong.lean:45`); the last two stay in the contract list and need no import, since no statement mentions them.
- Cross-roadmap citations resolved: 1. `metricProj` on main, `TauCetiRoadmap/MathematicalStatisticsNonparametric/Suggested.lean` lines 2338–2339 (a point at distance `infDist`, else `0`), section 6.5 at its README line 2184.
- Seeded sample within the change: 3.1 only; its locator (Bauschke–Combettes 2017, Theorem 3.16 and Proposition 4.16) is unchanged and is under `## Not verifiable`.
- Dependency check: `depcheck: 239 roadmaps, 2527 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate: every check passes (worker's run at 36119b2); nothing outside the folder changes.
- Elaboration of `Suggested.lean`: 35 `sorry` warnings, nothing else. The change touches no statement, so the one-tactic probe and the signature comparison stand as at a209c5a.
- Pull request text read against this head: no sentence contradicted; the change removes no section, declaration or supplier, so nothing is left unstated.

Overlap check: read ManifoldOptimization, DenoisingDiffusion, SpectralSteepestDescent, OptimalTransport, MathematicalStatisticsHighDimensional, MathematicalStatisticsNonparametric; descent lemma: SpectralSteepestDescent 5.1 (cited); soft-threshold map and nearest-point map: MathematicalStatisticsNonparametric 6.4 and 6.5 (cited); Moreau–Yosida resolvent: Tau Ceti (cited); lasso estimators: MathematicalStatisticsHighDimensional (named as a consumer); manifold descent and the manifold Polyak–Łojasiewicz inequality: ManifoldOptimization, on a different carrier.

Source independence: changed passages only; 2 passages compared (README lines 370–373 and 389–390, written from the Lean definition, with no source locator in them), none shared; largest share Nesterov 2018, 11 of 47 locators; contents not compared with Nesterov 2018, whose text and contents page could not be read; the change adds, removes and reorders no layer.

Research link: The rates are those of Nesterov 2018 and Beck–Teboulle 2009; 5.1 is the Robbins–Siegmund 1971 theorem as Combettes–Pesquet 2015 use it for stochastic quasi-Fejér iterations; 2.3 is Karimi–Nutini–Schmidt 2016; 6.2 is Ward–Wu–Bottou 2019; 6.4 is Reddi–Kale–Kumar 2018. Rests on the README's references and on CP15, KNS16, WWB19 and RKK18 as read.

## Not verifiable

- Bauschke–Combettes 2017 (Theorem 3.16, Proposition 4.16; sampled target 3.1, the one sampled target in the change): paywalled publisher page only.
- The other items of the previous review's list (Nesterov 2018, Beck 2017, Beck–Teboulle 2009, Polyak 1964 and 1987, Bertsekas 1999, Robbins–Siegmund 1971, Robbins–Monro 1951, the five Mathlib pull requests, the published numbering of BCN18, GL13 and CP15) stand as at a209c5a; the change bears on none of them.

## Source issues

- none

## For the human reviewers

- **Scope.** Sections 6.2–6.4 rest on conference papers (KB15 ICLR 2015, RKK18 ICLR 2018, WWB19 ICML 2019); Layers 1–5 cite textbooks and journal articles (README lines 822–850).
- **Licence.** The README's Provenance section names three public Lean repositories (lean4-mlir BSD-3, Optlib Apache-2.0, nesterov-lean MIT) as reference material; `Suggested.lean` was not compared with them.
- **Licence.** `LipschitzSmoothWith` in `Suggested.lean` is stated to take the name and field names of the open Mathlib pull request 39574; that pull request was not opened.
- **Not tested.** Nesterov 2018 has the largest share of the locators (11 of 47); neither its text nor its table of contents could be read, so wording and arrangement were not checked against it.
