# Review of AlgebraicTopology (pull request #3170 at 0c3be17)

**Verdict:** accepted

**Summary.** An incremental re-review: the folder is unchanged since `4aaba98` (0 lines), so this round read the pull request's title and description against the head. Every sentence that concerns this folder agrees with it: §5.8 is new, `Suggested.lean` gains the three declarations the bullet names, and the general paragraph now says that this folder defines its category and states the equivalence as an existence statement. No finding and no small correction; one format note carried over from the previous review, not blocking. Nothing is left for a human to decide.

## N01 — "Item 8" in the Layer 5 introduction names an item the stage mapping does not have

The Layer 5 introduction (README line 1299) still calls the new section "Item 8", while the mapping at lines 104–106 says Stage 5 has items 1–7 and lists §5.8 beside §5.0 as a section. "§5.8, pointed covers and subgroups, consumes only …" would match.

## Previous findings

- C01 — repaired: the description now reads "Two folders instead define such data in `Suggested.lean`, built from pinned carriers: AlgebraicTopology §5.8 defines its category of pointed connected covers … and each states its equivalence or adjunction as an existence statement."
- N01 — not repaired: README line 1299 still reads "Item 8, pointed covers and subgroups, consumes only Tau Ceti's covering-space classification." Written again above as N01.

(The previous report had no finding R01, R02, …: it accepted with one small correction and one format note.)

## Verified sound

| Statement | Instances tried | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| `exists_pointedConnectedCover_equivalence` (§5.8, cited by the description's bullet) | S¹ with covers zⁿ, zᵐ; base with π₁ = S₃ | S¹: pointed map zⁿ→zᵐ (w ↦ w^(n/m)) exists iff m∣n / nℤ ≤ mℤ iff m∣n. S₃: two conjugate order-2 subgroups, no pointed map either way / incomparable | holds, covariant | none |
| `exists_connectedPointedCoverClass_equiv_index` (§5.8, cited by the bullet) | π₁ = S₃, n = 3, 2, 6; S¹ with n = 0 | n=3: one cover, trivial deck group, 3 base points → 3 classes / 3 subgroups of index 3; n=2: 1/1; n=6: 1/1; n=0: empty / contains ⊥ (so `NeZero`) | holds | none |
| Description, AlgebraicTopology bullet | diff against the merge base | named: `PointedConnectedCover`, `exists_pointedConnectedCover_equivalence`, `exists_connectedPointedCoverClass_equiv_index` / added by the diff: the same three, one heading "5.8 Pointed covers and subgroups" | agrees | none |
| Description, "The one folder whose `Suggested.lean` does not change is DynamicalDegreesOfRationalMaps" | file list of the pull request | 16 README files, 15 `Suggested.lean` files changed; the folder without one is DynamicalDegreesOfRationalMaps | agrees | none |
| Title, "sixteen roadmaps" | folders changed against the base | 16 folders, 31 files | agrees | none |
| Description, pin `2fd255d` | `lake-manifest.json` | Tau Ceti rev `2fd255d997f4…` | agrees | none |

The rows of the previous review for the untouched statements stand as in that review, of `4aaba98`.

- Changed lines in the folder since `4aaba98`: 0; nothing in the folder was re-reviewed beyond the passages the description cites. None of the fifteen seeded targets lies in a changed passage; no locator is flagged as unverified.
- Description sentences checked against the head: the general paragraph (5 sentences), the AlgebraicTopology bullet, the closing paragraph (dependency, scope and build-order lists updated: stage mapping, Layer 5 introduction and Dependencies, build-order table row "5.8", scope item 4 and the universal-covers supplier paragraph all cite §5.8; elaboration claim confirmed below). The generated merge-order block is outside this check; it orders the one other open pull request that changes this folder after this one, and the two merge cleanly.
- Library declarations re-opened at the pinned Tau Ceti: `Topology/Homotopy/Monodromy/Basic.lean` 301 (`IsCoveringMap.card_fiber_eq_index`); `UniversalCover/Classification/RecoveredSubgroup.lean` 207; `UniversalCover/Classification/FundamentalGroupAction.lean` 103; `ThricePuncturedSphere/SubgroupClassification.lean` 182.
- Changes outside the listed roadmap folders: none (31 files, all in the sixteen folders).
- Record: no layer, item or id removed or retitled against the merge base; one heading added (§5.8); 0 declarations removed, 3 added.
- Dependency check: `depcheck: 99 roadmaps, 1127 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed on this head.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 22 `sorry` warnings and nothing else; no `set_option`; imports are `Mathlib` and individual `TauCeti.*` modules.

Overlap check: read CharacteristicClasses, ClassifyingSpaces, DGFloer, DGFloerPartII, GeneralizedCohomology, StableHomotopyKTheory (as in the previous review; the folder and the lists are unchanged); nothing shared with §5.8.

Source independence: changed passages only; 0 passages changed since `4aaba98`, so none compared in this round (the previous review compared 8 passages with hatcher, none shared); largest share hatcher, about 100 locators; contents not compared (no layer added, removed or reordered).

Research link: §8.5 owns the stable fundamental group at an end of Freedman–Quinn (1990, §7.7); §8.13 gives smooth representatives of low-codimension homology classes after Thom (1954); §7.2's bundle formula for the Euler characteristic is stated against Klein–Malkiewich–Ramzi (2022). Rests on the README (lines 2888, 3243, References).

## Not verifiable

- Nothing in the changed passages or in the description's sentences about this folder.

## Source issues

- none

## For the human reviewers

- none
