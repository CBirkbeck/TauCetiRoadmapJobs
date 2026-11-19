# Review of GroupActionsOnRiemannSurfaces (pull request #1728 at d2b5f96)
**Verdict:** accepted

**Summary.** Accepted: an incremental re-review of the 22 lines changed since `3d4ce69` (README only) found no finding. The uniqueness and normality of the cyclic trigonal subgroup in genus at least five (§6.4) now rests on CanonicalModelsAndGonality 5.2(f) and 6.6, which are on main and state exactly what is cited; the supply runs one way. One small correction, not blocking: the pull request's description still says CanonicalModelsAndGonality consumes this roadmap. Nothing is left for a human to decide beyond the final approval.

**README** below means `TauCetiRoadmap/GroupActionsOnRiemannSurfaces/README.md`.

## C01 — The description still presents CanonicalModelsAndGonality as a consumer, while the head cites it as a supplier

A reader of the description gets the direction of supply backwards and looks for a supplier among open drafts that is in fact on main. The summary block says "The action criteria and fixed-point formulas supply CanonicalModelsAndGonality", and the prose says "The sibling drafts CanonicalModelsAndGonality (#1726) and FiniteGroupInvariants (#1708) consume it." At this head README:375–378, the *Needs:* line of §6.4 (README:1410) and the Dependencies of Layer 6 (README:1425–1426) take trigonal uniqueness from CanonicalModelsAndGonality 5.2(f) and 6.6, and the Downstream consumers section (README:1715–1717) no longer names it. Both CanonicalModelsAndGonality and FiniteGroupInvariants are on main, not drafts.

A text that would be right: add CanonicalModelsAndGonality to the list of roadmaps on main that the roadmap builds on ("… and on AlgebraicCurves, AlgebraicTopology, BelyiMaps, CanonicalModelsAndGonality, …"), say "CanonicalModelsAndGonality 5.2(f) and 6.6 supply the uniqueness of the trigonal pencil in genus at least five used in §6.4", and replace the last sentence by "FiniteGroupInvariants, on main, can compare its group data with the action invariants." In the summary block, "The action criteria and fixed-point formulas supply CanonicalModelsAndGonality, while" would go.

## Previous findings

- The previous report, of `3d4ce69`, had no finding (its R01 and R02 bullets record repairs of an earlier round; both stand: SurfaceTopology occurs nowhere in the folder, and README:342–352 is unchanged).

## Verified sound

| Statement | Instances tried; computed values on both sides | Result / change |
| --- | --- | --- |
| §6.4, README:1403–1406: for `g ≥ 5` the cyclic trigonal subgroup is unique, hence normal in `G` | Two distinct index-3 rational subfields: compositum is `F` (prime degree), Castelnuovo gives `g ≤ 3·0 + 3·0 + (3−1)(3−1) = 4`. Conjugate `σHσ⁻¹` has fixed field `σ(F^H)`, rational of index 3, so equal. | Pass; agrees with CanonicalModelsAndGonality 5.2(f), 6.6. |
| Sharpness of `g ≥ 5` (README:1407, "for g≤4 … without claiming uniqueness") | `y³(x³+1) = −(x³+c)`, bidegree (3,3): `y`-cover branches at `x³ = −1, −c`, 6 points, `g = 6 − 2 = 4`; symmetric in `x, y`, so two cyclic trigonal subgroups. | Pass: uniqueness fails at `g = 4`, as the text allows. |
| §6.4 Riemann–Hurwitz, `2g−2 = 3(−2) + 2·FixCount` | `g = 5`: Fix `= 7 = g+2`. `g = 2` (S₃): `2 = −6 + 8`, Fix 4. `g = 10`: `18 = −6 + 24`, Fix 12. | Pass. |
| Check of §6.4, C₃² in genus ten (README:1416–1417), against the new uniqueness claim | Signature `(0; 3⁶)`: `18 = 9(−2 + 6·⅔)`. Vector `(x, x, x², x², y, y²)`: Fix(x) `= 9·4/3 = 12`, Fix(y) `= 9·2/3 = 6`, Fix(xy) `= 0`. Only `⟨x⟩` has 12. | Pass: exactly one cyclic trigonal subgroup, `g = 10 ≥ 5`. |
| Supplier contract, README:375–378 ("genus at least five over a perfect field") | Main's statement: `[PerfectField k]`, `5 ≤ genus k F`, two elements with `finrank k⟮x⟯ F = 3` give equal subfields; 6.6: subgroup unique and normal in `Aut(F/k)`. `ℂ` is perfect. | Hypotheses agree. |

Rows for all other statements stand as in the previous review, of `3d4ce69`.

- Cross-roadmap citations of the changed passages resolved, 2 of 2, on main: CanonicalModelsAndGonality 5.2 item (f) (its README:1356–1357, heading "5.2 Castelnuovo–Severi and its corollaries") and 6.6 (its README:1607–1617, "Cyclic trigonal curves and Kummer normal form"). Its own text names this roadmap as the consumer of 5.2(f) and 6.6 (README:183–185, 2184) and cites this roadmap only as a scope deferral (README:1501, 1645, 2085): no cycle.
- Library declarations opened: none at the pins (the change cites a roadmap only); the roadmap statement opened is `adjoin_eq_adjoin_of_finrank_adjoin_eq_three` and `IsCyclicTrigonal` in `TauCetiRoadmap/CanonicalModelsAndGonality/Suggested.lean`:505, 520 on main.
- Dependency check with the candidate order: `depcheck: 199 roadmaps, 2189 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Automatic checks at this head: all text scanners report zero and the targeted build passed in the worker's run. A rerun without the candidate order reports only that the roadmap is not yet in the merge order (placed after its last supplier; not a finding).
- Elaboration: `lake env lean` of `Suggested.lean` exits with nine `declaration uses sorry` warnings (lines 117, 127, 132, 140, 147, 153, 159, 171, 176) and nothing else. `Suggested.lean` is unchanged; no statement of it is touched.
- Seeded sample: none of the fifteen sampled sections lies in a changed passage (the change is in §6.4, the scope list, the supplier contracts, the Layer 6 dependencies and the consumers paragraph). No external source locator was added or changed.
- No file outside the folder is changed.
- Overlap check: read CanonicalModelsAndGonality, BelyiMaps, NoncongruenceModularForms, TeichmullerGeometry; trigonal uniqueness and the single-function-field predicate `IsCyclicTrigonal` are owned by CanonicalModelsAndGonality (5.2(f), 6.6) and cited here; the family predicate on generating vectors is owned here (§6.4), as CanonicalModelsAndGonality 6.7 says; nothing else shared.
- Source independence: changed passages only; 5 changed passages compared with the cited sections of CanonicalModelsAndGonality (a roadmap; 0 external sources), none shared; arrangement not compared again (no layer added, removed or reordered).
- Research link: the roadmap formalizes the classification of finite group actions on compact Riemann surfaces by generating vectors (Broughton 1991; Singerman 1972; Bujalance–Cirre–Conder 2003) and the Jacobian decompositions of Kani–Rosen 1989 and Lange–Recillas 2004, the mathematics behind the LMFDB database of Paulhus 2023; rests on the README's summary and references.

## Not verifiable

- Unchanged from the previous report: Macbeath 1973 §2, Farkas–Kra V.2.9, Breuer beyond the excerpt, Broughton, Harvey Theorem 4, Singerman Theorem 1, Ries §3, Chevalley–Weil, Kani–Rosen (paywalled or not held); no changed line cites them.

## Source issues

- none

## For the human reviewers

- none
