# Review of GroupActionsOnRiemannSurfaces (pull request #1728 at d2b5f96)
**Verdict:** accepted

**Summary.** Accepted: the folder is unchanged since the previous review of `d2b5f96`, and this round read the pull request's title and description against that head and found them accurate. The one small correction of the previous report (the description presented CanonicalModelsAndGonality as a consumer) is repaired: the description now names it as the supplier of trigonal uniqueness for §6.4. No finding, no small correction, no format note; nothing is left for a human to decide beyond the final approval.

**README** below means `TauCetiRoadmap/GroupActionsOnRiemannSurfaces/README.md`.

## Previous findings

- The previous report, of `d2b5f96`, had no finding. Its small correction C01 — repaired: the description now reads "CanonicalModelsAndGonality 5.2(f) and 6.6 supply the uniqueness of the trigonal pencil in genus at least five used in §6.4" and lists it among the suppliers on main; the summary block no longer names it as a consumer.

## Verified sound

| Statement | Instances tried; computed values on both sides | Result / change |
| --- | --- | --- |
| Description: "9 layers and 48 milestones" | README has 9 headings `## Layer 0` … `## Layer 8` and 48 numbered `### k.n` subsections. | Agrees. |
| Description: suppliers (3 open, 12 on main); "SurfaceTopology is not a supplier" | Roadmaps named in the README: TeichmullerGeometry, HyperellipticCurves, MordellLawrenceVenkatesh (open); the same 12 on main; SurfaceTopology occurs 0 times. SatoTateGroups appears only as a scope deferral. | Agrees. |
| Description: surface topology from TeichmullerGeometry §0.0f, GeometricTopology Layer 1.7.2, AlgebraicTopology Layer 1; CanonicalModelsAndGonality 5.2(f), 6.6 for §6.4 | README:343–354, 375–378, 767–769, 930, 1410; each cited heading exists at the cited roadmap (open head or main). | Agrees. |
| Description: "FiniteGroupInvariants, on main, can compare its group data" | FiniteGroupInvariants is on main; README:1715–1717 names it as the consumer. | Agrees. |
| Summary block: Hurwitz bound and its equality (`GenVector.card_le_hurwitz`, `card_eq_hurwitz_iff`) | `μ(0;2,3,7) = −2 + 1/2 + 2/3 + 6/7 = 1/42`; `n = 168`: genus `1 + 168/84 = 3`, `84·(3−1) = 168`. `(0;2,3,8)`: `μ = 1/24`, `n = 48(g−1) < 84(g−1)`. | Pass. |
| Summary block: Wiman bound and equality (`wiman`, `wiman_eq_iff`) | `(0;2,5,10)`, `n = 10`: `μ = −2 + 1/2 + 4/5 + 9/10 = 1/5`, genus `1 + 10/10 = 2`, `4·2 + 2 = 10`. `g = 0` gives periods `[2,1,2]`, excluded by `2 ≤ m j`. | Pass. |
| Summary block: Harvey's criterion (`harvey_iff`) on `(0;2,5,10)`, `n = 10` | lcm `= 10 = n`; erasing one period: lcm(5,10), lcm(2,10), lcm(2,5) all `10`; `r = 3`; periods divisible by `2¹`: 2 and 10, count 2, even. Vector `(5, 2, 3)` in `ℤ/10`: sum 0, orders 2, 5, 10. | Pass, both sides true. |

Rows for all other statements stand as in the previous review, of `d2b5f96`.

- The folder changed by 0 lines since the previous review; no file outside the folder is changed.
- Title and description read against the head: every sentence of the summary block and the prose checked (layer and milestone counts, the three files, the metadata topic `math.AG`, the open and on-main suppliers, the consumer sentence); none is contradicted, and the change adds a roadmap not on main, with no section or declaration removed.
- Cross-roadmap citations named in the description resolved, 8 of 8: TeichmullerGeometry §0.0f, §5.6, §8.4, §10.1 and MordellLawrenceVenkatesh §5.9, §5.21, §8.11 and HyperellipticCurves §1.4 at their open heads; GeometricTopology Layer 1.7.2, AlgebraicTopology §§1.3–1.5 and CanonicalModelsAndGonality 5.2(f), 6.6 on main.
- Dependency check with the candidate order: `depcheck: 199 roadmaps, 2190 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Automatic checks at this head: all passed in the worker's run, including the targeted build.
- Elaboration: `lake env lean` of `Suggested.lean` gives nine `declaration uses sorry` warnings (lines 117, 127, 132, 140, 147, 153, 159, 171, 176) and nothing else.
- Seeded sample and source locators: no passage changed, so none of the sampled sections falls in a change; no locator was added or altered. The eight names the citation resolver could not find are the roadmap's own `Suggested.lean` declarations and one LMFDB knowl label, not library citations.
- Overlap check: read BelyiMaps, TeichmullerGeometry, SurfaceGroupCharacterVarieties, MappingClassGroupsAndCanonicalRepresentations, GeometricFreyMazur, NoncongruenceModularForms, CanonicalModelsAndGonality as listed closest; ownership stands as in the previous review (trigonal uniqueness and `IsCyclicTrigonal` owned by CanonicalModelsAndGonality 5.2(f), 6.6 and cited here; the family predicate on generating vectors owned here, §6.4); no open pull request changes this roadmap or drops an id it cites; nothing else shared.
- Source independence: changed passages only; 0 passages changed, so none compared; arrangement not compared again (no layer added, removed or reordered).
- Research link: the roadmap formalizes the classification of finite group actions on compact Riemann surfaces by generating vectors (Broughton 1991; Singerman 1972; Bujalance–Cirre–Conder 2003) and the Jacobian decompositions of Kani–Rosen 1989 and Lange–Recillas 2004, the mathematics behind the LMFDB database of Paulhus 2023; rests on the README's summary and references.

## Not verifiable

- Unchanged from the previous report: Macbeath 1973 §2, Farkas–Kra V.2.9, Breuer beyond the excerpt, Broughton, Harvey Theorem 4, Singerman Theorem 1, Ries §3, Chevalley–Weil, Kani–Rosen (paywalled or not held); no changed line cites them.
- The description's sentence "One of 23 roadmaps for the mathematics behind the LMFDB, opened as drafts" concerns other pull requests and was not checked.

## Source issues

- none

## For the human reviewers

- none
