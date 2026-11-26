# Review of AlgebraicTopology (pull request #3170 at 9552dbc)

**Verdict:** accepted

**Summary.** An incremental re-review: the folder is unchanged since the review of `0c3be17` (0 lines; the only file changed since is in BelyiMaps), so this round read the pull request's title and description against this head. Every sentence about this folder agrees with it: the pull request revises a roadmap on main, adds §5.8 and the three `Suggested.lean` declarations its bullet names, removes or renumbers nothing, and adds no roadmap supplier. No finding and no small correction; one format note carried over, not blocking. Nothing is left for a human to decide.

## N01 — "Item 8" in the Layer 5 introduction names an item the stage mapping does not have

The Layer 5 introduction (README line 1299) calls the new section "Item 8", while the mapping at lines 104–106 says Stage 5 has items 1–7 and lists §5.8 beside §5.0 as a section. "§5.8, pointed covers and subgroups, consumes only …" would match.

## Previous findings

- N01 — not repaired: README line 1299 still reads "Item 8, pointed covers and subgroups, consumes only Tau Ceti's covering-space classification." Written again above as N01.

(The previous report had no finding R01, R02, … and no small correction: it accepted with this one format note.)

## Verified sound

| Statement | Instances tried | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| `exists_connectedPointedCoverClass_equiv_index` (§5.8, cited by the description's bullet) | figure eight, π₁ = F₂, n = 2; S¹, π₁ = ℤ, n = 3; n = 0 | F₂, n=2: 3 connected double covers, each regular, so 3 pointed classes / 3 kernels of surjections F₂→ℤ/2. ℤ, n=3: z³ with 3 base points in one deck orbit, 1 class / {3ℤ}. n=0: empty / contains ⊥, hence `NeZero n` | holds | none |
| `exists_pointedConnectedCover_equivalence` (§5.8, cited by the bullet) | S¹ with zⁿ, zᵐ; identity and universal cover | pointed map zⁿ→zᵐ exists iff m∣n / nℤ ≤ mℤ iff m∣n; identity ↦ ⊤, ℝ→S¹ ↦ ⊥ | holds, covariant | none |
| Description, AlgebraicTopology bullet | diff against the merge base `87e7f72` | names "new §5.8", `PointedConnectedCover`, `exists_pointedConnectedCover_equivalence`, `exists_connectedPointedCoverClass_equiv_index` / diff adds exactly that heading and those three declarations; 0 removed; 92 insertions, 9 deletions | agrees | none |
| Description, "the index-`n` slice through which `MarkedIsoClass.subgroupEquiv` factors" | README §5.8 last sentence of the statement | README: the pinned `TauCeti.MarkedIsoClass.subgroupEquiv` is the slice composed with the inverse of `markedClassEquiv` | agrees | none |
| Description, "AlgebraicTopology §5.8 defines its category … and each states its equivalence … as an existence statement" | `Suggested.lean` lines 130–147 | `abbrev PointedConnectedCover` with a real body (category of elements) / theorem of shape `∃ E : … ≌ Subgroup …, ∀ c, …` | agrees | none |
| Title "sixteen roadmaps"; pin `2fd255d`; "The one folder whose `Suggested.lean` does not change" | file list against the base; `lake-manifest.json` | 16 README files, 15 `Suggested.lean` files, 31 files in all / Tau Ceti rev `2fd255d997f4…`; the folder without a Lean change is DynamicalDegreesOfRationalMaps | agrees | none |

The rows of the previous review for the untouched statements stand as in the previous review, of `0c3be17`.

- Changed lines in the folder since the previous review: 0. None of the fifteen seeded targets lies in a changed passage; no locator is flagged as unverified. The two locators of §5.8 were re-opened: hatcher line 2977 (Theorem 1.38) and hatcher line 2707 (Proposition 1.32); both are where the README says.
- Description sentences checked against the head: the general paragraph, the AlgebraicTopology bullet, the closing paragraph ("Dependency, scope and build-order lists are updated": the stage mapping, the Layer 5 introduction and Dependencies, the build-order row "5.8", scope item 4 and the universal-covers supplier paragraph all name §5.8). The text says the pull request adds targets to existing roadmaps; in this folder nothing is removed or renumbered, no declaration is removed, and §5.8's only supplier is the pinned Tau Ceti. The generated merge-order block is outside this check.
- Record: against the merge base, 0 layers or headings removed or retitled, 1 heading added, 0 declarations removed, 3 added.
- Library declaration opened at the pin: `ConnectedPointedCoverClass.mk_eq_mk_of_range_eq`, `TauCeti/AlgebraicTopology/UniversalCover/Classification/NumberedFiber.lean` line 358.
- Changes outside the sixteen listed folders: none. The one file changed since the previous review is `TauCetiRoadmap/BelyiMaps/README.md`, the pull request's own, covered by that folder's review; this roadmap cites nothing in it.
- Overlap: one other open pull request changes this folder (a references chore); the two merge cleanly and the description's shared-folder list orders it after this one. No cited id is dropped anywhere.
- Dependency check: `depcheck: 94 roadmaps, 1068 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed on this head. Elaboration: `lake env lean` on `Suggested.lean` gives 22 `sorry` warnings and nothing else; no `set_option`; imports are `Mathlib` and individual `TauCeti.*` modules.

Overlap check: read CharacteristicClasses, ClassifyingSpaces, DGFloer, DGFloerPartII, GeneralizedCohomology, StableHomotopyKTheory (as in the previous review; the folder and the lists are unchanged); nothing shared with §5.8.

Source independence: changed passages only; 0 passages changed since the previous review, so none compared in this round (the earlier review compared 8 passages with hatcher, none shared); largest share hatcher, about 100 locators; contents not compared (no layer added, removed or reordered).

Research link: §8.5 owns the stable fundamental group at an end of Freedman–Quinn (1990, §7.7); §8.13 gives smooth representatives of low-codimension homology classes after Thom (1954); §7.2's bundle formula for the Euler characteristic is stated against Klein–Malkiewich–Ramzi (2022). Rests on the README (lines 2888, 3243, References).

## Not verifiable

- Nothing in the changed passages or in the description's sentences about this folder.

## Source issues

- none

## For the human reviewers

- none
