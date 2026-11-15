# Review of PresentationsOfMonoidalCategories (pull request #2308 at 6c64227)

**Verdict:** accepted

No finding. Incremental re-review of 0 changed lines since 6c64227; this round read the pull request's title and description against the head.

## Previous findings

- none: the previous report, of 6c64227, listed no finding.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `existsUnique_fSymbols` (description: "stating extraction of F- and R-symbols") | Free part of `Vec^ω_{C₂}` over ℤ, ω(1,1,1) = −1, standard bases, a=b=c=d=1 | `Left`, `Right` each one element (e = f = 0). Left family 1; right family across α is −1; so F = −1, Finv = −1 forced. | Exactly one `FSymbols` | none |
| `existsUnique_rSymbols` (same sentence) | C₂, F = 1, symmetric and super braidings | β = 1 gives R¹¹₀ = 1; β = −1 gives R¹¹₀ = −1; forward hexagon at (1,1,1): 1 = r² holds for both. | One `RSymbols` per braiding | none |
| Description: "pivotal structures by one unit scalar per simple" | C₂ over ℤ and ℤ/8 | t₁² = 1: ℤ gives ±1 (2 structures); ℤ/8 gives 1, 9, 25, 49 ≡ 1, so t₁ ∈ {1,3,5,7} (4 structures). | Agrees with README Conventions Check | none |
| Description: "#2311 … `IsSplitSimpleFamily` that Layer 2 cites and … `VecTwisted R G ω` that Layer 3 cites" | PivotalSpherical at 13e0bd5 and on main | At 13e0bd5: §3.3 defines `IsSplitSimpleFamily R S`, §8.1 `VecTwisted R G ω`. Main: 0 hits for `IsSplitSimpleFamily`, no §3.3 or §8.1. README cites them at lines 278, 322 (Layer 2) and 367, 381 (Layer 3). | Sentence correct; revision named | none |
| Description: "only the comparison with the abelian, field-based definitions … needs a field" | README lines 33–35, §2.4 line 298; Lean binders | README states the same; `Suggested.lean` extraction binders are `[CommRing R] [Nontrivial R]`, no `Field`. | Agrees | none |
| Description: "`Suggested.lean` giving the Layer 0 structures real bodies" | 9 declarations | 3 structures, 2 abbrevs, 2 defs with bodies; 2 theorems with `sorry`; no sorry'd data. | Agrees | none |

The rows for untouched statements stand as in the previous review, of `6c64227`.

- Pull-request text: title and 4 prose paragraphs read against the head and the new-folder diff (669 insertions, 42 headings, 9 declarations, 0 removed); no sentence contradicted, no unstated removal, renumbering or supplier; no `roadmap-summary` block is present.
- Cross-roadmap: 2 supplier sections resolved at PivotalSpherical #2311 (head 13e0bd5, §§3.3 and 8.1); its Downstream consumers names this roadmap for Layers 2 and 3.
- Gate: rerun at this head, every check 0, `OK`; the worker's targeted build passes. 0 files changed outside the folder; worktree clean.
- Dependency check output: `depcheck: 245 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Lean: `Suggested.lean` elaborates with exactly 2 `sorry` warnings (lines 125, 142); the elaborated types of all 9 declarations keep every section binder (the "looks dropped" leads are instance binders that are present, unnamed).
- Sources: no passage changed, so no locator re-checked this round; the previous review's 10 locators stand.
- Remark on untouched text: README line 143 names `b.homDual`; PivotalSpherical §3.3 names `IsSplitSimpleFamily.exists_homDual`.
- Remark on a generated block: `depends-on` and `merge-order` say no open pull request must merge first, while the prose (correctly) names #2311; the blocks are outside this check.

Overlap check: read OcneanuRigidity (#2316), PivotalSpherical (main and #2311), CategoricalOperatorAlgebras, TemperleyLieb; PivotalSpherical owns split simple families, pivotal infrastructure and `VecTwisted`; this roadmap owns matrix presentations; OcneanuRigidity their deformations; nothing has two owners.

Source independence: changed passages only; 0 passages changed, none to compare; largest share Kitaev2006, 16 of 26 locators; no layer added, removed or reordered, so the previous contents comparison stands.

## Not verifiable

- JoyalStreet1993, Kelly1964 and Bonderson2007 are settled uncertified entries.
- The description's numerical runs on Rep(A4) and Rep(D(S3)) have no artifact in the pull request.

## Source issues

- none

## For the human reviewers

- **Licence.** EGNO2015 line 3985 marks the cached text as the authors' final version made available with the publisher's permission, with redistribution restrictions; the roadmap uses only statements and locators from it.
- **Merge order.** README lines 141–144 cite PivotalSpherical §§3.3 and 8.1, which exist only at #2311 (not on main); the generated `merge-order` block says this pull request can merge as soon as approved.
