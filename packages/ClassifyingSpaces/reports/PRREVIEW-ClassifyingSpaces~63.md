# Review of ClassifyingSpaces (pull request #1807 at 8a250a2)

**Verdict:** needs changes

## R01 (P2) — The nerve-target case of Hatcher 1B.9 still has two owners (carried from r62 R01)

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md:82–84`: "is owned here, as items 1.1 and 1.2, for every aspherical target and every base point. The bijection `[X, Bπ]_* ≃ Hom(π₁(X), π)` of that roadmap's item 8.8, for its nerve model `Bπ`, is the case of items 1.1 and 1.2".

**Claim.** This README owns 1B.9 for every aspherical target. This pull request's AlgebraicTopology 8.8 still plans its own proof of the case with target `Bπ`, and it names nothing of this roadmap as an input. One result therefore has two owners.

**Witness.** `TauCetiRoadmap/AlgebraicTopology/README.md:4275–4276` at this head: "the generic CW/cover proof is supplied only here. For each connected pointed CW complex X prove `[X,Bπ]_*≃Hom(π₁X,π)`". Line 149: "nothing of it is consumed here". The *Needs:* line, 4243, names no ClassifyingSpaces item.

**Repair.** Edit this pull request's `TauCetiRoadmap/AlgebraicTopology/README.md`. This README needs no change.
- Lines 4275–4277: replace "the generic CW/cover proof is supplied only here. For each connected pointed CW complex X prove `[X,Bπ]_*≃Hom(π₁X,π)` and that forgetting basepoints gives the conjugation-orbit description of `[X,Bπ]` (Hatcher, Proposition 1B.9, p.90);" with "the generic CW/cover proof of the bar model is supplied only here. For each connected pointed Hausdorff CW complex X, `[X,Bπ]_*≃Hom(π₁X,π)` is ClassifyingSpaces Layer 1, items 1.1 and 1.2, with target Bπ (aspherical by 8.8a), composed with 8.8a's identification π₁(Bπ)≃π (Hatcher, Proposition 1B.9, p.90); prove here that forgetting basepoints gives the conjugation-orbit description of `[X,Bπ]`;". Keep the componentwise treatment of a disconnected X.
- Line 4243 (*Needs:*): replace "for the model comparison." with "for the model comparison; ClassifyingSpaces Layer 1, items 1.1 and 1.2, for the pointed classification."
- Lines 148–149: replace "and nothing of it is consumed here." with "and Layer 8.8 consumes its items 1.1 and 1.2 for the pointed classification of maps into Bπ, and nothing else of it."

Tested on a scratch copy of AlgebraicTopology's README with the citations applied:
- `gate --depcheck … --name AlgebraicTopology` prints `207 roadmaps, 1954 edges, 0 problem(s)`, the same as before the edit.
- This README names no AlgebraicTopology supplier, so no cycle forms.
- CharacteristicClasses C1.5a (lines 1033–1036) cites AlgebraicTopology 8.8's bijection. That citation stays valid.

## R02 (P3) — The description does not say how this pull request rewrites ClassifyingSpaces

**Location.** The description's only account of this folder: "ClassifyingSpaces replaces model construction targets with pointed aspherical comparisons and group (co)homology comparisons for arbitrary Hausdorff CW K(G,1) spaces."

**Claim.** This pull request rewrites the ClassifyingSpaces roadmap on main (1838 changed lines), and the description leaves three changes unstated:
- Stages 1–4 become Layers 1–2.
- AlgebraicTopology and GeometricTopology are dropped as suppliers.
- `Suggested.lean` drops 26 named declarations.

**Witness.** On main, *Ownership and dependencies* consumes AlgebraicTopology Stages 1, 2, 4 and 8 and GeometricTopology Layer 11. This head's *Exact supplier contracts* (lines 276–308) lists only Mathlib and Tau Ceti. The description names GeometricTopology only for CharacteristicClasses.

**Repair.** Add this paragraph to the description, after the AlgebraicCurves paragraph: "**ClassifyingSpaces** (on main) is rewritten in the house shape. Its Stages 1–4 become Layers 1–2, and a *Stage and item numbers* list maps every former Stage, item and the Stage 2 heading to its owner. Milnor's model, the cellular model, their comparison, functoriality and resolutions, and the (co)homology of Milnor's model are pinned in Tau Ceti and consumed by name. The roadmap therefore no longer consumes AlgebraicTopology (Stages 1, 2, 4 and 8) or GeometricTopology (Layer 11). Layer 1 owns Hatcher's Proposition 1B.9 for any base point and any aspherical target, together with pointed uniqueness. Layer 2 owns the (co)homology of any Hausdorff CW K(G,1), with local coefficients. Its Suggested.lean drops 26 named declarations and 16 instances, keeps `exists_homotopyEquiv_of_isAspherical` and adds three headlines."

## Previous findings

- R01 — not repaired: `AlgebraicTopology/README.md:4275–4276` still reads "the generic CW/cover proof is supplied only here. For each connected pointed CW complex X prove `[X,Bπ]_*≃Hom(π₁X,π)`". Line 149 still says "nothing of it is consumed here". Carried as R01.

## Verified sound

| Statement | Instance | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| Headline 1, case `Y = Bπ` (lines 82–84) | `π = S₃`, `X = S¹` | `|Hom(ℤ, S₃)| = 6`; `[S¹, BS₃]_* = π₁(BS₃) ≅ S₃`: 6 | holds, covered by items 1.1–1.2 | none |
| Same | `π = ℤ/2`, `X = T²` | `|Hom(ℤ², ℤ/2)| = 4`; `[T², RP^∞]_* = H¹(T²; ℤ/2) = (ℤ/2)²`: 4 | holds | none |
| Single owner of the `Bπ` case | CS 82–84 against AT 149, 4243, 4275–4277 | CS: items 1.1–1.2, every aspherical target. AT 8.8 inputs: §4.7, §6.1, nerve, Tau Ceti; it proves the case itself | two owners | R01 |
| R01 repair, supply direction | AT depcheck on a scratch copy | before: 207 roadmaps, 1954 edges, 0 problems; after: the same; CS → AT supplier edges: 0 | no cycle | R01 repair |
| CC C1.5a's pointed map (changed CC text, cites AT 8.8's bijection) | `X = RP^∞`, `π = ℤ/2`, `φ` the isomorphism | `|Hom(ℤ/2, ℤ/2)| = 2`; `[RP^∞, Bℤ/2]_* = H¹(RP^∞; ℤ/2)`: 2; `φ` goes to the nonzero class; `π₁` iso, `π_n = 0` on both sides | holds; a case of headline 1 | none |
| AT §8.14, `n = 1` (lines 5161–5164) | `X = S¹`, `Y` = Warsaw circle `W` | `|Hom(ℤ, 1)| = 1`; `[S¹, W]_* = 1` (W weakly contractible); 8.8 needs `W ≃ B1 = pt`, false | covered only by items 1.1–1.2 | remark |
| Description against the head (R02) | suppliers; named Lean declarations | main: UniversalCovers, GeometricTopology L11, AT Stages 1, 2, 4, 8; head: Mathlib, Tau Ceti. Declarations: main 27, head 4, one kept | unstated | R02 |

The rows for the untouched statements (headlines 2–4, the Checks of Layers 1–2, the conventions) stand as in the previous review, of 806b373.

- **Gate.** The worker's gate at 8a250a2 passes every check, `build=0` included. My run prints 0 for every content counter. Its only failure, `outside-folder=24`, counts the 24 files of the 12 sibling folders this pull request owns. With those folders and this one excluded, `git diff --stat origin/main...HEAD` is empty (exit 0).
- **Dependency check.** `depcheck: 207 roadmaps, 1915 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` exits 0 in 5 s, with only four `declaration uses 'sorry'` warnings (lines 84, 102, 123 and 138). In a scratch copy, `#check @` of all four declarations matches `signatures.md`; no binder is lost. The folder, `lake-manifest.json` and `lean-toolchain` are unchanged since 806b373.
- **Source locators re-read: 8, all in `hatcher-at`.** 1B.8 and 1B.9, p. 90 (lines 3897, 3905–3907); §2.2, p. 148 (6471–6479); §3.H, p. 328 (14349–14350); Example 3H.1, p. 329 (14373); Proposition 0.16, p. 15 (818); Proposition 4.22, p. 357 (15549); Proposition A.4, p. 522 (22629).
- **Library declarations at the pin: 3.** `AlgebraicTopology/EilenbergMacLane/Basic.lean:59` (`TauCeti.IsAspherical`: path-connected, `π_(n+2)` trivial); `ClassifyingSpace/HomotopyFunctor.lean:209` (the classifier out of the cellular model); `ClassifyingSpace/Uniqueness.lean:73` (`TauCeti.IsAspherical.exists_homotopyEquiv`).
- **Cross-roadmap citations resolved at this head: 9.** AT §8.8 (4237), 8.8a and 8.8b (4259–4262), AT line 148; CC C1.1b (472, 564–566), C1.5a (1019–1036), and CC lines 64, 190 and 1116. `citations.md` lists none unresolved.
- **Overlaps.** #1808 and #1854 change this folder after this pull request, by the description's shared-folder order. `git merge-tree --write-tree HEAD origin/main` is clean. No id this README cites is dropped by an open pull request.
- **Remarks (no change requested).** AlgebraicTopology §8.14, lines 5161–5164, takes its `n = 1` case from "the existing K(π,1) classifier"; for a target that is not CW, that case is items 1.1–1.2 (table row above). CharacteristicClasses line 190 names this roadmap for the pinned join model. The anchor `#stage-2-the-cellular-model`, cited by FreeGroupsAndLimitGroups at main line 29, is mapped by the *Stage and item numbers* list.

## Not verifiable

- `brown-cohomology`, Chapter III §1 (items 2.1–2.3): uncertified, no legal text; untouched since the previous review.
- `schwamberger-vogt-2009`, §2 (the Warsaw circle): uncertified; used only for the table's negative instance.
- `milnor-1956`, §3: uncertified; cited only for the pinned model.

## Source issues

- none
