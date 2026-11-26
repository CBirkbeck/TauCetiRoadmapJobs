# Review of ClassifyingSpaces (pull request #3170 at 9552dbc)

**Verdict:** accepted

**Summary.** An incremental re-review: the folder has not changed since `0c3be17` (0 lines), so this round checks the pull request's title and description against this head. The description now states what the previous review asked for: its ClassifyingSpaces bullet says that `Suggested.lean` gains no declaration and that a docstring paragraph presents the adjunction of §1.4 as a packaging of the headline `exists_continuousMap_mapOfEq_eq_of_isAspherical`, which is what the file says. Accepted with no finding and no small correction; two format notes are carried over, neither blocking. Nothing is left for a human to decide.

## N01 — The scope sentence for item 1.4 sits under scope item 2 (pointed uniqueness, item 1.3), while the adjunction packages items 1.1 and 1.2

README lines 934–935. It would be easier to find at the end of scope item 1.

## N02 — The `G = 1` Check of item 1.4 does not tell pointed homotopy classes from free ones

README line 500: free classes into the contractible `B1` are also a point. A Check that separates them: `X = S¹`, `G = S₃` gives `Hom(ℤ, S₃)` with 6 elements and `[S¹, BS₃]_* = π₁(BS₃)` with 6, while the free classes are the 3 conjugacy classes.

## Previous findings

The previous review, of `0c3be17`, had no finding (no R-numbered remark); its small correction and format notes are accounted for here.

- C01 (previous) — repaired: the description's bullet now reads "`Suggested.lean`: no declaration; a docstring paragraph says that the adjunction packages the existence and uniqueness clauses of the headline `exists_continuousMap_mapOfEq_eq_of_isAspherical` with target `TauCeti.classifyingSpace G`".
- N01 (previous) — not repaired: the sentence is still the last of scope item 2 (README lines 934–935); written again as N01.
- N02 (previous) — not repaired: the Check (README line 500) is unchanged; written again as N02.

The repair of the description introduces no new problem.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Item 1.4, hom-equivalence `(π₁(X, x) →* G) ≃ [X, BG]_*`, as the description's bullet and the docstring (lines 49–54) describe it | `X = S¹`, `G = S₃`; `X = T²`, `G = S₃`; `G = 1` | `S¹`: `Hom(ℤ, S₃)` 6 = `[S¹, BS₃]_*` 6 (free classes 3). `T²`: commuting pairs `6·3 = 18` on both sides. `G = 1`: 1 = 1 | bijection is the existence (surjective) and uniqueness rel `{x}` (injective) clauses of the one headline, `Y = BG` | none |
| Item 1.4, counit and "B is fully faithful" (description: "with counit …") | direction of `π₁ ⊣ B`; pin `HomotopyFunctor.lean` 119 | counit is `π₁ ∘ B ⟶ 𝟭` on `GrpCat`, the pinned natural isomorphism; counit iso ⇔ right adjoint fully faithful | direction and conclusion correct | none |
| Description: "In InductionRestriction and ClassifyingSpaces the addition is stated in the README only" | diff of the folder against the base | README +1 heading (1.4); `Suggested.lean` 7 lines, module docstring only; declarations 0 removed, 0 added, 0 restated | true | none |

The rows for the untouched statements (items 1.1–1.3, the Checks of 1.4, 2.1–2.3, the four headlines) stand as in the previous review, of `0c3be17`; the seeded sample (1.1–1.4, 2.1–2.3) falls in no changed passage, since the folder's diff is empty.

- Source locators checked against the text: 0 new (no locator added or changed; the 7 Hatcher locators of the sample stand as verified earlier).
- Library declarations opened at the pins (Tau Ceti `2fd255d`): `TauCeti.classifyingSpaceHomotopyFunctorCompFundamentalGroupFunctorIso` at `TauCeti/AlgebraicTopology/ClassifyingSpace/HomotopyFunctor.lean` 119; the headline's signature at `Suggested.lean` 91–99.
- Cross-roadmap citations: none added; the tools report none unresolved, and no overlap with an open pull request (none changes this roadmap, none drops an id it cites, this one drops none).
- Dependency check: `depcheck: 93 roadmaps, 1031 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` gives four `sorry` warnings (lines 91, 109, 130, 145) and nothing else.
- Record: against the merge base, no layer or item removed or renumbered, one heading added (1.4), no `Suggested.lean` declaration removed, added or restated.
- Automatic checks at this head: all passed. The only file changed since `0c3be17` is `TauCetiRoadmap/BelyiMaps/README.md`, a folder the pull request declares as its own; nothing changes outside the sixteen folders.
- Pull request text: title "sixteen roadmaps" (sixteen folders changed; fifteen `Suggested.lean` files changed, DynamicalDegreesOfRationalMaps the exception, as stated); pin `2fd255d` is the manifest's; the ClassifyingSpaces bullet ("new §1.4: `π₁ ⊣ B` on path-connected Hausdorff CW complexes, with counit …; `Suggested.lean`: no declaration; …") and "Dependency, scope and build-order lists are updated where a new section is added" agree with the head. It says the pull request revises roadmaps ("adds planned targets to sixteen roadmaps") and names the one new section; no section, headline, declaration or supplier of this folder is removed.

Overlap check: read AlgebraicTopology (this pull request's head and main), FinitenessAndDualityOfGroups, CohomologyOfGroups, UniversalCovers, StableHomotopyKTheory (scopes as read at `0c3be17`; the folder adds no object since); nothing shared.

Source independence: changed passages only: 0 passages in the folder changed since `0c3be17`, so 0 compared; largest share `hatcher-at`, 14 of 18 locators; no layer added, removed or reordered, so the contents were not compared again.

Research link: Layer 1 is Proposition 1B.9 and Theorem 1B.8 of Hatcher (2002) for arbitrary base points and non-CW aspherical targets; Layer 2 identifies the (co)homology of any CW `K(G, 1)` with group (co)homology (Brown 1982, Ch. III), the comparison used to compute group cohomology from geometric models. Rests on the README's overview and downstream consumers.

## Not verifiable

- Brown, Chapter III, Section 1; Milnor 1956; Schwamberger–Vogt 2009, §2: settled as uncertified, cited by locator only; none is cited by a changed passage.

## Source issues

- none

## For the human reviewers

- none
