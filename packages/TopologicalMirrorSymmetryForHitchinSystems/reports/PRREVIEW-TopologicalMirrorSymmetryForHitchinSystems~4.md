# Review of TopologicalMirrorSymmetryForHitchinSystems (pull request #1814 at cd94b28)

**Verdict:** accepted

Incremental re-review of the 18 lines changed in `TauCetiRoadmap/TopologicalMirrorSymmetryForHitchinSystems/` since 12073e7, and the check of the pull request's title and description against this head. No finding.

## Previous findings

- R01 — repaired: the description now reads "the Lean file declares nothing: none of the 32 headline theorems is statable against the pinned Mathlib and Tau Ceti" and "the targeted Lake build succeeds with no warning (the file has no declaration and no `sorry`)".

## Verified sound

The diff changes no statement, hypothesis, locator or supplier: it adds eleven own-section items to five `*Needs:*` lines (§§2.1, 2.7, 3.8, 4.7, 5.1) and three `### Dependencies` lines (Layers 2, 4, 5), and one clause to the group sentence of §3.1.

| Statement | Instances tried | Values on each side | Result / change |
|---|---|---|---|
| §2.1 `*Needs:*` gains §0.1 | the section's own use; U quasi-projective; a non-example | line 482: "good in the sense of §0.1"; §0.1 line 163 defines the E-polynomial for a good action; quasi-projective U: every finite orbit lies in an affine open; a proper non-projective threefold with involution fails it | holds |
| §2.7 `*Needs:*` gains §2.1 | the statement's own use | line 605: "the nonsplit finite étale Γ admitted by §2.1"; the group sentence of §2.1 (line 478) already said §§2.5–2.7 use it | holds |
| §3.8 `*Needs:*` gains §3.6 | the section's own use | line 782: "hypotheses of §3.6 apply"; the route dualizes the norm-kernel sequence of §3.6 | holds |
| §4.7 `*Needs:*` gains §3.7 | the route; n = 2, g = 2 | line 945: "Use §3.7 for the globally étale isogeny"; kernel Γ of order n^(2g) = 16, a unit for p ≠ 2; group sentence line 740 says "§4.7 uses §§3.7–3.8" | holds; repairs the remark of the review of 12073e7 |
| §5.1 `*Needs:*` gains §3.3; §3.1 sentence gains "§5.1" | the statement's own use; n = 1; n = 2, g = 2, q = 3⁸ | line 985: trace identity "descended as in §3.3"; n = 1: both sides 1; q − 1 = 6560 = 32·205, root order n^(2g+1) = 32 divides it, \|Γ\| = 16 | holds; §3.3 lies in the group the §3.1 sentence describes |
| `### Dependencies` of Layers 2, 4, 5 (gain §0.1; §3.7; §3.3, §0.6, §0.4) | for each layer, the own-section items of its `*Needs:*` lines outside the layer against the Dependencies line, both directions | Layer 2: §0.1 from line 502; Layer 4: §3.7 from line 953; Layer 5: §3.3 from line 998, §0.6 and §0.4 from §5.4's line 1052 ("§§0.4, 0.6–0.7"); difference empty both ways in all six layers | holds |

Rows for every other statement stand as in the previous review, of `12073e7`; no statement changed.

- Gate (worker, at cd94b28): every check 0, `OK`. Dependency check, my run: `depcheck: 234 roadmaps, 2228 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/TopologicalMirrorSymmetryForHitchinSystems/Suggested.lean` exits 0 with no output; the file is unchanged and declares nothing, so there is nothing for `#check` or the one-tactic probe; its docstring names 32 headline theorems.
- `git diff --stat origin/main...HEAD` outside the folder: empty.
- Pull request text: the title, the summary block, the thirteen contracts (13 `What … must provide (gap:…)` lines in the README, one per slug), the end theorems (§§5.1, 5.2, 5.4, 5.6), "the Lean file declares nothing", "32 headline theorems", "no warning", "the Lean imports none of them" and the folder's three files agree with the head. The change since 12073e7 adds, removes and renumbers no section, target or supplier, so the description leaves nothing unstated.
- Group sentences against the new `*Needs:*` items: lines 478, 643 and 740 agree with them; no group sentence is made wrong.
- Source locators: the changed passages carry none. The sampled targets §3.1 and §5.1 are touched only in a group sentence and a `*Needs:*` line; their statements and locators are as read by the reviews of cceef7d and 12073e7.
- Cross-roadmap citations: none added or changed; the worker's resolver and overlap check list none unresolved, dropped or shared.
- Remark (untouched practice): §§2.5, 2.7 and 2.8 are stated "for a dual pair" and reach §2.2 through §2.3 or §2.6 rather than listing it.

Overlap check: read CountingBundlesAndHallAlgebrasOfCurves, GlobalShtukasAndFunctionFieldLanglands, AlgebraicModuliForArithmeticGeometry (the list of roadmaps close by results is empty); nothing shared: the change adds no object, and the ownership recorded by the review of 12073e7 stands.

Source independence: changed passages only; 9 changed lines (eight lists of section numbers with their titles, one group sentence) compared with 1 source (GWZ20): they contain no source wording and no locator, none shared; largest share GWZ20, 77 of 101 locators as counted by the review of 12073e7; no layer was added, removed or reordered, so the contents were not compared again.

## Not verifiable

- GWZ20 published version (Inventiones 221, 2020): paywalled, recorded `uncertified`; not read again this round, since no changed passage carries a locator. The numbering offset between the arXiv copy and the published version recorded by the earlier reviews stands.
- Ownership against the open pull requests beyond the three closest roadmaps was not searched again: the diff adds no object.

## Source issues

- none

## For the human reviewers

- none
