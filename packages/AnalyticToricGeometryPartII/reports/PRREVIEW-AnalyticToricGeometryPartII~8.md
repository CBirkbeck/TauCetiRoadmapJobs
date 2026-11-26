# Review of AnalyticToricGeometryPartII (pull request #3170 at 9552dbc)

**Verdict:** accepted

**Summary.** An incremental re-review of an unchanged folder: no line of it differs from the head the previous review accepted, so this round reads the pull request's title and description against the head. For this folder they are accurate: it revises a roadmap on main by one new section, §0.7, and one `Suggested.lean` declaration, with nothing removed or renumbered and no supplier added. There is no finding and no small correction; one format note is carried over (two books missing from References), and one placement question is left to the human reviewers.

## N01 — The two books §0.7 cites are missing from References

README line 168 cites Fulton, *Introduction to Toric Varieties*, §3.1, and Cox–Little–Schenck, *Toric Varieties*, Theorem 3.2.6; `## References` (line 783) lists only SCH12, FS94, FS25 and STACKS. Add the two entries with publisher and year, as AnalyticToricGeometry's References gives them.

## Previous findings

The previous report had no finding (R) and no small correction; its one remark is accounted for here.

- N01 — not repaired: References (README line 783) still lists SCH12, FS94, FS25 and STACKS only; written again above as N01.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Description: "AnalyticToricGeometryPartII, new §0.7: the orbit–cone correspondence as an order isomorphism onto orbits ordered by closure, reversed. `Suggested.lean`: `orbit_eq_of_subset_closure_of_subset_closure`" | diff of the folder against main | 42 insertions, 4 deletions; headings +1 (§0.7, README line 166), −0; declarations +1 (`Suggested.lean` line 66), −0; 7 layers keep ids and titles | agrees | none |
| Description: "This PR adds planned targets to sixteen roadmaps" (revision, not a new roadmap); title "sixteen roadmaps" | diffstat of the pull request against main | 31 files in 16 folders: 16 READMEs, 15 `Suggested.lean`; the folder without one is DynamicalDegreesOfRationalMaps, as the description says | agrees | none |
| Description: "a *Needs:* line citing pinned names, and Checks where a hypothesis is necessary"; "data … is listed there as not statable" | §0.7; module docstring | `*Needs:*` names 4 declarations, all at the pin (Fan/Orbit/Basic.lean 307, 327, 371, 384); two Checks (ℙ¹; irrational flow); docstring lists the order isomorphism as data | agrees | none |
| Description: "Dependency, scope and build-order lists are updated where a new section is added"; "the pin (`2fd255d`)" | this folder; manifest | Layer 0 Dependencies, Scope (line 695) and the AnalyticToricGeometry contract each gain a §0.7 sentence; manifest Tau Ceti rev `2fd255d9…`; supplier AnalyticToricGeometry was already one (Layer 0) | agrees | none |
| `orbit_eq_of_subset_closure_of_subset_closure` (cited by the description; unchanged) | fan of ℙ¹; empty fan; pinned criterion | ℙ¹: orbits ℂ×, {0}, {∞} with closures ℙ¹, {0}, {∞}; mutual containment only for equal orbits. Empty fan: empty space, no orbit, vacuous. Pin line 384: O(σ)⊆closure O(τ) ↔ τ≤σ, so both give σ=τ | holds; agrees with §0.7 | none |

The rows for untouched statements stand as in the previous review, of `9552dbc`.

- Change since `9552dbc`: 0 lines in the folder, no file outside it.
- Source locators: none checked; no passage changed, so no target of the seeded sample lies in or depends on a change.
- Library declarations opened at the pin: Tau Ceti `coneEquivOrbitRelQuotient` (Geometry/Toric/Analytic/Fan/Orbit/Basic.lean 307), `orbit_coneEquivOrbitRelQuotient` (327), `isLocallyClosed_analyticConeOrbit` (371), `analyticConeOrbit_subset_closure_iff` (384).
- Cross-roadmap citations: none added since the previous review; the citation tool reports none unresolved.
- Elaboration of `Suggested.lean`: one warning, the `sorry` at line 66. Elaborated signature of its single declaration compared with §0.7: binders `Φ`, `hΦ`, `q`, `q'` and both hypotheses present, none lost.
- Automatic checks: all of the worker's pass. Dependency check output: `depcheck: 94 roadmaps, 1060 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Overlaps: no other open pull request changes this roadmap or drops an id it cites; this change drops none. The description's merge-order block has no entry for this folder, consistent with that.

Overlap check: read DeligneWeightsAndPurityPartII, AnalyticToricGeometry, PerfectoidShimuraVarieties, MotivesAndAlgebraicCyclesPartII, DiamondsAndVStacks, CrystallineCohomology and EtaleDualityAndPerverseSheaves as in the previous review; the one shared object is the orbit–cone correspondence, owned by AnalyticToricGeometry Layer 4 item 2 (completed), which §0.7 cites, owning only the order structure. Nothing changed since.

Source independence: changed passages only; none changed since `9552dbc`, so 0 passages compared; largest share SCH12, 145 of 190 source mentions, as in the previous review; contents not compared, since no layer is added, removed or reordered.

Research link: Layers 3–6 are the toric comparison, cohomology and approximation theorems of Scholze 2012 (§8, Theorem 8.5 to Corollary 8.8), used there for weight–monodromy of complete intersections and consumed by DeligneWeightsAndPurityPartII; §0.7 is the classical orbit–cone correspondence. Rests on the README's summary and References.

## Not verifiable

- Fulton, *Introduction to Toric Varieties*, §3.1, and Cox–Little–Schenck, *Toric Varieties*, Theorem 3.2.6 (§0.7, line 168): commercial books, not in the roadmap's source manifest, not opened; the citation is untouched since the previous review.
- The description's sentence that two repository scripts pass: they concern the whole repository and were not run.
- The description's bullets for the other fifteen folders and its merge-order block for them: each belongs to that folder's review.

Automatic checks set aside as false positives: run by hand without the list of the pull request's own folders, the check for changes outside the folder reports the other fifteen roadmap folders of this pull request; they are its own, each with a review, and the worker's run passes.

## Source issues

- none

## For the human reviewers

- §0.7 (README line 166) is complex analytic, is used by no other section, and sits in Layer 0 of this nonarchimedean Part II; line 695 gives the reason: AnalyticToricGeometry, whose Layer 4 item 2 it completes, is under `Completed/`.
