# Review of GroupActionsOnRiemannSurfaces (pull request #1728 at 3d4ce69)
**Verdict:** accepted

Incremental re-review of 36 changed lines since bb14724 (README only; `Suggested.lean` and `metadata.toml` unchanged). No finding. **README** means `TauCetiRoadmap/GroupActionsOnRiemannSurfaces/README.md`.

## Previous findings

- R01 — repaired: README:342–352 "From TeichmullerGeometry §0.0f: polygon schemas, the standard orientable model … From geometric topology Layer 1.7.2: the mapping class group `Mod(F)` … From algebraic topology Layer 1: the based van Kampen presentation"; no SurfaceTopology mention remains; gate `dropped=0`.
- R02 — repaired: description now reads "Builds on the open roadmaps HyperellipticCurves (#1707), TeichmullerGeometry (#1169), … The sibling drafts CanonicalModelsAndGonality (#1726) and FiniteGroupInvariants (#1708) consume it."

## Verified sound

| Statement | Instances tried; computed values on both sides | Result / change |
| --- | --- | --- |
| Supplier contract, README:342–345 (canonical word for `(h, r) ≠ (0, 0)`: `h` handle blocks, then `r` hole blocks) | TeichmullerGeometry §0.0f: word length `4h + 3r`; `(0,0)` is `a a⁻¹`, no blocks, so the exclusion is needed. `(1,1)`: length 7; `(0,3)`: length 9. | Agrees with the supplier's text. |
| §2.4 presentation of `π₁(Y ∖ B)` from the polygon word (README:761–764) | Cells: `1 + r` vertices, `2h + 2r` edges, one disc; `χ = 2 − 2h − r`. `(0,3)`: graph rank `6 − 4 + 1 = 3`, one relation, free rank `2 = 1 − χ`. `(1,1)`: rank `4 − 2 + 1 = 3`, relation `[a,b]·chc⁻¹`. `(2,0)`: 4 generators, 1 relation. | Pass; van Kampen (AlgebraicTopology §§1.3–1.5) supplies the step. |
| §3.4 boundary-relative mapping classes (README:346–350, 925–926) | GeometricTopology 1.7.2: `∂F ≠ ∅` gives `Mod = Mod⁺`; annulus `Mod ≅ ℤ` (twist nontrivial rel `∂`); `Mod⁺(S²)` trivial. Topological equivalence uses homeomorphisms: Layer 11.2.1 item 5 makes smooth and topological classes agree. | Pass. |
| §3.3 Hurwitz move (cited by §3.4's changed *Needs:* line) | S₃: `((12),(23)) ↦ ((13),(12))`; both products `(123)`; `[ (12),(23) ] = (132)`, `(132)(123) = 1`. | Pass. |

Rows for all other statements stand as in the previous review, of `bb14724`.

- Gate at 3d4ce69: every scanner 0 (`dropped=0`, `outside-folder=0`), build passed in the worker's run. A rerun of the full gate prints only `depcheck: NOT IN ORDER` (placement after the last supplier; not a finding).
- Dependency check with the candidate order: `depcheck: 237 roadmaps, 2250 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean` of `Suggested.lean` exits 0 with nine `declaration uses sorry` warnings (lines 117, 127, 132, 140, 147, 153, 159, 171, 176) and nothing else.
- Cross-roadmap citations of the changed passages resolved, 7 of 7: TeichmullerGeometry §0.0f (open head of its pull request, heading "0.0f Polygon schemas and the classification of compact surfaces"); GeometricTopology Layer 1.7.2 (main, README:1212), Layer 11.2.1 items 2 and 5 (main, README:7817, items "Isotopy to diffeomorphisms" and "Smooth and topological isotopy"); AlgebraicTopology Layer 1 (main, README:895), §1.3 (913), §1.4 (931), §1.5 (940).
- Description against the head: the nine roadmaps it names as on main are on main and cited; the five open suppliers match the generated depends-on block; the sentence on surface topology matches README:103–107 and 342–352; SurfaceTopology occurs nowhere in the folder. `SatoTateGroups` is cited only as a scope deferral (README:114, 160), not as a supplier.
- Seeded sample: none of the fifteen sampled sections lies in a changed passage; they stand as previously reviewed. No source locator was added or changed.
- Overlap check: read CanonicalModelsAndGonality, BelyiMaps, TeichmullerGeometry, FuchsianOrbifolds; the classification of compact surfaces is owned by TeichmullerGeometry §0.0f and mapping class groups by GeometricTopology Layer 1.7.2, both now cited; nothing else shared.
- Source independence: changed passages only; 6 changed passages compared, all citing roadmaps and no external source (0 sources), none shared; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- Unchanged from the previous report: Macbeath 1973 §2, Farkas–Kra V.2.9, Breuer beyond the excerpt, Broughton, Harvey Theorem 4, Singerman Theorem 1, Ries §3, Chevalley–Weil, Kani–Rosen (paywalled or not held); no changed line cites them.

## Source issues

- none

## For the human reviewers

- none
