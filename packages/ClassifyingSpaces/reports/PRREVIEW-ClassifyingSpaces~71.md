# Review of ClassifyingSpaces (pull request #3170 at 0c3be17)

**Verdict:** accepted

**Summary.** An incremental re-review of the 27 lines changed since `f17d28c`, and a check of the pull request's title and description against this head. The change repairs both small corrections of the previous review: the `Suggested.lean` docstring now credits the hom-set bijection of item 1.4 to the one headline that supplies it, and the *Needs:* line and the supplier contracts now record everything item 1.4 consumes; every added name and file was opened at the pins and says what the text says. Accepted with no finding; one small correction (the description's ClassifyingSpaces bullet does not say what happens in `Suggested.lean`) and two format notes carried over, none blocking. Nothing is left for a human to decide.

## C01 — The description's ClassifyingSpaces bullet does not say that `Suggested.lean` gains no declaration, and its general sentence gives a reason the file no longer gives

The description says, of all sixteen folders, that "data (categories, functors, equivalences) is listed there as not statable", and every other bullet whose folder adds no declaration says so ("`Suggested.lean`: no declaration; …"). The ClassifyingSpaces bullet is silent, and at this head the docstring of `TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` (lines 49–54) no longer calls the adjunction data or not statable: it says the adjunction "is a packaging of the headline `exists_continuousMap_mapOfEq_eq_of_isAspherical` and is not stated here". A reader of the description alone cannot tell whether a declaration was added for §1.4 or why not. The bullet would be right with one more sentence: "`Suggested.lean`: no declaration; a docstring paragraph says the adjunction packages the existence and uniqueness clauses of the headline `exists_continuousMap_mapOfEq_eq_of_isAspherical` for the target `BG`."

## N01 — The scope sentence for item 1.4 sits under scope item 2 (pointed uniqueness, item 1.3), while the adjunction packages items 1.1 and 1.2

README lines 934–935. It would be easier to find at the end of scope item 1.

## N02 — The `G = 1` Check of item 1.4 does not tell pointed homotopy classes from free ones

README line 500: free classes into the contractible `B1` are also a point. A Check that separates them: `X = S¹`, `G = S₃` gives `Hom(ℤ, S₃)` with 6 elements and `[S¹, BS₃]_* = π₁(BS₃)` with 6, while the free classes are the 3 conjugacy classes.

## Previous findings

The previous review, of `f17d28c`, had no finding (no R-numbered remark); its small corrections and format notes are accounted for here.

- C01 (previous) — repaired: the docstring now reads "a packaging of the headline `exists_continuousMap_mapOfEq_eq_of_isAspherical` … its hom-set bijections are the existence and uniqueness clauses of that headline with target `TauCeti.classifyingSpace G`".
- C02 (previous) — repaired: the *Needs:* line of 1.4 adds the five omitted Tau Ceti names; the contracts add a Mathlib bullet for `CategoryTheory.Adjunction` and `ObjectProperty.FullSubcategory` and a bullet "The pointed homotopy category"; the Layer 1 Dependencies paragraph names it.
- N01 (previous) — not repaired: the sentence is still the last of scope item 2; written again as N01.
- N02 (previous) — not repaired: the Check is unchanged; written again as N02.

The repairs introduce no new problem.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Docstring: hom-set bijection of 1.4 = both clauses of `exists_continuousMap_mapOfEq_eq_of_isAspherical` with `Y = BG` (changed) | `X = S¹`, `G = S₃`; `G = 1` | existence gives surjectivity, uniqueness rel `{x}` injectivity: `Hom(ℤ, S₃)` 6 = `[S¹, BS₃]_*` 6 (free classes 3); `G = 1`: 1 = 1 | true; one headline suffices | none |
| Contract bullet: morphisms of `TauCeti.PointedHomotopyCat` (added) | pin `PointedHomotopyCat.lean` 66–67, 122–123 | quotient by `HomotopicRel … {X.basepoint}`, `X` the source; same relation as the headline's `f.HomotopicRel g {x}` | description agrees with the pin | none |
| Contract bullet: `PointedHomotopyCat.fundamentalGroupFunctor` on maps (added) | pin lines 87–89, 149–151 | `map f = ofHom (FundamentalGroup.mapOfEq f.toContinuousMap f.map_basepoint)`, lifted through the quotient | agrees; same induced map as the headline | none |
| *Needs:* line of 1.4 (changed) | each added name at the pin | `classifyingSpaceFundamentalGroupMulEquiv` `EilenbergMacLane.lean` 67; `isEilenbergMacLaneSpaceOne_classifyingSpace` 104; instances `Basic.lean` 151, `CWComplex.lean` 358, 365 | all exist; each is used in the item's text | none |
| Mathlib contract bullet (added) | files at the pin | `structure Adjunction` at `Adjunction/Basic.lean` 108; `structure FullSubcategory` at `ObjectProperty/FullSubcategory.lean` 39 | names and paths correct | none |
| Layer 1 Dependencies paragraph (changed) | README 1.4 *Needs:* | pointed homotopy category is a pin, named in 1.4; no roadmap supplier added | true | none |
| 1.1/1.2 (sample; cited by the changed docstring) | `X = Y = S¹`, `φ = ×2` | `z ↦ z²` pointed, induces ×2; unique rel `{1}` as `[S¹, S¹]_* = ℤ` | matches the Lean signature at line 91 | none |

The rows for the untouched statements (items 1.3, 1.4's statement and Checks, 2.1–2.3, the four headlines) stand as in the previous review, of `f17d28c`; the seeded sample (1.1–1.4, 2.1–2.3) falls in no changed locator, since the diff adds none.

- Source locators checked against the text: 0 new (the diff adds no locator; the 7 Hatcher locators of the sample stand as verified at `f17d28c`).
- Library declarations opened at the pins: 9 in Tau Ceti (`PointedHomotopyCat.lean` 67, 87, 122, 149; `EilenbergMacLane.lean` 67, 104; `Basic.lean` 151; `CWComplex.lean` 358, 365; `HomotopyFunctor.lean` 119) and 2 in Mathlib (above).
- Cross-roadmap citations: the diff adds none; the tools report none unresolved.
- Dependency check: `depcheck: 95 roadmaps, 1064 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` gives four `sorry` warnings (lines 91, 109, 130, 145) and nothing else; the diff changes the module docstring only, and the four elaborated signatures are those compared with the README at `f17d28c`.
- Record: against the merge base, no layer or item removed or renumbered, one heading added (1.4), no `Suggested.lean` declaration removed, added or restated.
- Automatic checks at this head: all passed. No change outside the folders the pull request declares as its own.
- Pull request text: the title (sixteen roadmaps, sixteen folders changed) and the ClassifyingSpaces bullet ("new §1.4: `π₁ ⊣ B` on path-connected Hausdorff CW complexes, with counit …") agree with the head; "Dependency, scope and build-order lists are updated where a new section is added" is now true of this folder; the omission is C01.

Overlap check: read AlgebraicTopology (this pull request's head and main), FinitenessAndDualityOfGroups, CohomologyOfGroups, UniversalCovers, StableHomotopyKTheory (as at `f17d28c`; the diff adds no object); nothing shared.

Source independence: changed passages only: 4 passages (the *Needs:* line of 1.4, the Dependencies paragraph, the two contract bullets, the `Suggested.lean` paragraph) compared with 1 source (`hatcher-at` §1.B, pp. 90–91), none shared (they are lists of library names and descriptions of pinned declarations); largest share `hatcher-at`, 14 of 18 locators; the diff adds no layer, so the contents were not compared again.

Research link: Layer 1 is Proposition 1B.9 and Theorem 1B.8 of Hatcher (2002) for arbitrary base points and non-CW aspherical targets; Layer 2 identifies the (co)homology of any CW `K(G, 1)` with group (co)homology (Brown 1982, Ch. III), the comparison used to compute group cohomology from geometric models. Rests on the README's overview and downstream consumers.

## Not verifiable

- Brown, Chapter III, Section 1; Milnor 1956; Schwamberger–Vogt 2009, §2: settled as uncertified, cited by locator only; none is cited by the changed text.

## Source issues

- none

## For the human reviewers

- none
