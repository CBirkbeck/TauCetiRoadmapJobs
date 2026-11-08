# Review of ClassifyingSpaces (pull request #1807 at 0f7ed58)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 4f06ba2 in `TauCetiRoadmap/ClassifyingSpaces/` (`README.md` and `Suggested.lean` byte-identical; the only commit since, 0f7ed58, edits `TauCetiRoadmap/BordismFormalGroups/` alone). The pins are the same as at 4f06ba2 and on main (Tau Ceti `2fd255d99`, Mathlib `1b1ccf4b0`), so the pinned directory `TauCeti/AlgebraicTopology/ClassifyingSpace/` (30 files, no `sorry`) still proves what Stages 1–4 plan. The `AlgebraicTopology` and `CharacteristicClasses` READMEs are also byte-identical since 4f06ba2. None of the six findings of the previous review is repaired at this head; each is written again below with its witnesses re-verified at this head and pin (the one-term probe re-elaborated, the pinned names re-checked, the source lines re-read). No new finding.

## R01 (P2) — Stages 1–4 plan, as targets, constructions and theorems the pinned Tau Ceti already provides under the roadmap's own suggested home

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` line 24 ("Suggested home: `TauCeti/AlgebraicTopology/ClassifyingSpace/`"), lines 61–73 ("It owns the two models (Stages 1 and 2) … the transfer of CW structures … the chain-level comparison … the resulting identification of the (co)homology comparisons"), lines 112–143 (the Inventory, whose Tau Ceti bullet names only the universal cover, its deck group, `IsAspherical`, `IsEilenbergMacLaneSpaceOne` and the recognition theorems), and items 1–13, 16, 18, 19 (lines 150–370, 401–488).

**Claim.** At the pin `2fd255d99` (this head's `lake-manifest.json`, identical to main's) the directory the README names as its home exists and proves, with no `sorry`, the objects and theorems the README states as this roadmap's targets. Item by item (files under `TauCeti/AlgebraicTopology/ClassifyingSpace/` unless said otherwise):

- Item 1: `TauCeti.universalGSpace`, `universalGSpaceBasepoint`, `MonoidHom.universalGSpaceMap` (`CountableJoin.lean` 26–40).
- Item 2: `instSimplyConnectedSpaceUniversalGSpace`, `subsingleton_homotopyGroup_universalGSpace` (`WeakContractibility.lean` 28–45); `instContractibleSpaceUniversalGSpace` (`Contractible.lean` 19).
- Item 3: `instMulActionUniversalGSpace`, `instIsCancelSMulUniversalGSpace` (`Action.lean` 96, 150); `classifyingSpace`, `classifyingSpaceProj`, `isQuotientCoveringMap_classifyingSpaceProj`, `classifyingSpaceDeckMulEquiv` (`Basic.lean` 73–133).
- Item 4: `instPathConnectedSpaceClassifyingSpace`, `instLocallyPathConnectedSpaceClassifyingSpace`, `instSemilocallySimplyConnectedSpaceClassifyingSpace` (`Basic.lean`).
- Item 5: `classifyingSpaceFundamentalGroupMulEquiv` (`EilenbergMacLane.lean` 67), `classifyingSpaceFundamentalGroupMulEquiv_apply_eq_iff` (77–83, re-elaborated this round: `γ ↦ g` exactly when the monodromy of `γ` from the base vertex is the vertex `⟨0, g⁻¹⟩`, the README's `γ ↦ m(γ)⁻¹`), `isEilenbergMacLaneSpaceOne_classifyingSpace` (104), `exists_isEilenbergMacLaneSpaceOne` (120–122), `universalGSpaceHomeomorphUniversalCover`.
- Item 6: `MonoidHom.classifyingSpaceMap`, `_id`, `_comp`, `_basepoint`, `classifyingSpaceFundamentalGroupMulEquiv_mapOfEq` (`Functoriality.lean`).
- Item 7: `PresentationComplex`, `PresentationComplex.fundamentalGroupMulEquiv`, `instCWComplex` (288), `cellOneEquiv` (304), `cellTwoEquiv` (`PresentationComplex.lean`; `cellTwoEquiv R : cell univ 2 ≃ R` re-elaborated this round).
- Items 8–9: `killingTower`, `killHomotopyGroups`, `subsingleton_homotopyGroup_killHomotopyGroups` (269), `bijective_homotopyGroupMap_killHomotopyGroupsIncl` (260), `killHomotopyGroupsCWComplex` (358), `cwType_killHomotopyGroups` (400), `TopCat.Hom.exists_killHomotopyGroupsIncl_comp_eq` (465), in `TauCeti/AlgebraicTopology/Homotopy/KillHomotopyGroups.lean`, for any Hausdorff space and every `n ≥ 1`.
- Item 10: `cellularClassifyingSpace` (`Cellular.lean` 113), `isEilenbergMacLaneSpaceOne_cellularClassifyingSpace` (161), `instCWComplexCellularClassifyingSpace` (209), `exists_isEilenbergMacLaneSpaceOne_cellularClassifyingSpace` (`Comparison.lean` 287–296).
- Item 11: existence out of the cellular model `exists_mapOfEq_cellularClassifyingSpace` (`Cellular.lean` 174–180, re-elaborated this round); uniqueness relative to the base point `homotopicRel_of_mapOfEq_eq_cellularClassifyingSpace` (242–248) and, for a CW complex with one `0`-cell, `homotopicRel_singleton_of_mapOfEq_eq_of_cwComplex` (`TauCeti/AlgebraicTopology/EilenbergMacLane/Homotopic.lean` 220).
- Item 12: `IsAspherical.exists_homotopyEquiv` (`Uniqueness.lean` 73–77, CW type, the isomorphism realised after a change of base point along a path), `IsEilenbergMacLaneSpaceOne.nonempty_homotopyEquiv` (94–97), `IsAspherical.exists_homotopyEquiv_classifyingSpace` (109–114), `cellularClassifyingSpaceHomotopyEquiv` (`Comparison.lean` 130).
- Item 13: `IsQuotientCoveringMap.cwComplexQuotient`, `instCWComplexUniversalGSpace`, `instMulActionCellUniversalGSpace`, `instCWComplexClassifyingSpace` (`CWComplex.lean` 358), `instT2SpaceClassifyingSpace` (365), `classifyingSpaceCellEquiv`.
- Item 14, first paragraph: `cellularHomotopyEquivClassifyingSpace` (`Comparison.lean` 211–212, inducing the given `PresentedGroup R ≃* G`).
- Item 15: `classifyingSpaceFunctor`, `classifyingSpaceHomotopyFunctor`, `classifyingSpaceHomotopyFunctorCompFundamentalGroupFunctorIso` (`HomotopyFunctor.lean`).
- Item 16: `universalGSpaceResolution` (`Resolution.lean`), `cellularClassifyingSpaceResolution`, `cellularResolutionOfIsAspherical` (`PresentedGroupResolution.lean`), with the deck convention `UniversalCover.smul_mk`.
- Item 17, first paragraph: `classifyingSpaceSingularHomologyIsoGroupHomology` (`Homology.lean` 69–71), `classifyingSpaceSingularCohomologyIsoGroupCohomology` (`Cohomology.lean` 89–91), naturality and Bockstein compatibility (headers), `classifyingSpaceLocalSystem`, `classifyingSpaceTwistedHomologyIsoGroupHomology`, `classifyingSpaceTwistedCohomologyIsoGroupCohomology` (`LocalCoefficients.lean`).
- Item 18: `universalGSpaceToStandardComplex` (`StandardComplex.lean`), `universalGSpaceChainComplexToStandardComplex`, `universalGSpaceStandardHomotopyEquiv`, `universalGSpaceChainComplexToStandardComplexHomotopy` (`StandardResolution.lean`), naturality (`Naturality.lean`).
- Item 19 and the Acceptance checks: `classifyingSpaceFirstHomologyAddEquiv` (`FirstHomology.lean`), `circleHomotopyEquivClassifyingSpace` (`Circle.lean`), `wedgeCirclesHomotopyEquivClassifyingSpace`, `wedgeCirclesHomotopyEquivCellularClassifyingSpace` (`WedgeCircles.lean`), `subsingleton_classifyingSpace_singularHomology_int_of_even` (`FiniteCyclic.lean`), `Torus.lean`.

What the pin does not have (grep over `TauCeti/AlgebraicTopology/` at `2fd255d99`): a nerve model of `BG` (the "nerve" matches are Čech nerves), hence nothing of item 14's second paragraph and item 17's second paragraph; the existence clause of item 11 for an arbitrary path-connected Hausdorff CW complex; and the pointed form of item 12 for two arbitrary CW `K(G, 1)` spaces. Everything else in Stages 1–4 is a theorem of the pin, and the principles say what exists at the pins is cited in the supplier contracts by exact name and file, not planned again.

**Witness.** `ls .lake/packages/TauCeti/TauCeti/AlgebraicTopology/ClassifyingSpace/` at this head: the 30 files; `grep -rl sorry` over them: none. A scratch probe importing `…ClassifyingSpace.{Comparison,Homology,Cohomology,Uniqueness}` (object files present in the worktree's build) elaborates this round, exit 0, the `#check` of the names cited above with a line number and the terms of R02.

**Repair.** Unchanged from the previous review. In `README.md`: (i) rewrite `## Ownership and dependencies` and the Inventory so that `From Tau Ceti` lists, by exact name and file, the declarations above for items 1–13, 15, 16, 18 and 19, and says the two models, their comparison, the CW structures, the resolutions and the (co)homology identifications are consumed from `TauCeti/AlgebraicTopology/ClassifyingSpace/`; (ii) delete those items as targets, keeping their conventions under `## Conventions` with the pinned declarations that fix them (`classifyingSpaceFundamentalGroupMulEquiv_apply_eq_iff`, `UniversalCover.deckFundamentalGroupEquiv_symm_op`); (iii) keep as targets only what the pin lacks: the nerve-model comparison normalised to the identity on `G` and its naturality (item 14, second paragraph), the identification of the three models' (co)homology comparisons (item 17, second paragraph), the existence clause of item 11 for an arbitrary path-connected Hausdorff CW complex, and the pointed uniqueness of item 12, each with a `*Needs:*` line naming the pinned declarations it starts from; (iv) `Suggested.lean` keeps only headlines that are not theorems of the pin (R02 for the first; the fifth and sixth stay, their module docstring saying the model case is `classifyingSpaceSingularHomologyIsoGroupHomology` and `classifyingSpaceSingularCohomologyIsoGroupCohomology` at the pin and the general case is their transport along `IsEilenbergMacLaneSpaceOne.nonempty_homotopyEquiv`). Whether the roadmap should instead be moved to `Completed/` is the maintainers' decision; this finding asks only that the README stop planning what the pin proves.

## R02 (P3) — The first headline of `Suggested.lean` closes from the pin in one term

**Location.** `TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` lines 50–57 (`exists_cwComplex_isEilenbergMacLaneSpaceOne`); its name at README line 288 and in the module docstring, line 11.

**Claim.** With the pinned modules imported the statement is closed by one anonymous constructor of pinned declarations and instances, so it is not an acceptance test of this roadmap.

**Witness.** Re-elaborated this round in my scratch probe (imports `Mathlib` and `TauCeti.AlgebraicTopology.ClassifyingSpace.Comparison`), no error:

```lean
theorem probe1 (G : Type u) [Group G] :
    ∃ (X : Type u) (_ : TopologicalSpace X) (_ : T2Space X)
      (_ : Topology.CWComplex (Set.univ : Set X)) (x : X),
      IsEilenbergMacLaneSpaceOne G X x :=
  ⟨classifyingSpace G, inferInstance, inferInstance, inferInstance, classifyingSpaceBasepoint G,
    isEilenbergMacLaneSpaceOne_classifyingSpace G⟩
```

(`instT2SpaceClassifyingSpace`, `CWComplex.lean` 365; `instCWComplexClassifyingSpace`, 358; `isEilenbergMacLaneSpaceOne_classifyingSpace`, `EilenbergMacLane.lean` 104.) The other five headlines do not close in one tactic: the second needs a cell count above dimension 2 that the pin does not state; the third's existence clause and the fourth's pointedness are not at the pin; the fifth and sixth close in one term only for `X = classifyingSpace G` (the probe elaborates `⟨(classifyingSpaceSingularHomologyIsoGroupHomology k G n).symm⟩` and `⟨(classifyingSpaceSingularCohomologyIsoGroupCohomology k G k n).symm⟩` for the model) and need the transport along `IsEilenbergMacLaneSpaceOne.nonempty_homotopyEquiv` for an arbitrary Hausdorff CW `K(G, 1)`.

**Repair.** Delete `exists_cwComplex_isEilenbergMacLaneSpaceOne` from `Suggested.lean`; the README cites `exists_isEilenbergMacLaneSpaceOne` (`EilenbergMacLane.lean` 120) and `exists_isEilenbergMacLaneSpaceOne_cellularClassifyingSpace` (`Comparison.lean` 287) as the pinned existence theorems; remove the backticked name from README line 288 and from the module docstring at line 11.

## R03 (P2) — AlgebraicTopology 8.8b still names this roadmap's Stages 3–4 as its supplier: two owners of the nerve-model comparison

Re-raised: F01 of the round-7 repair report (which answered it as an edit of another folder; that repair commit never reached the pull request). The reason fails because `TauCetiRoadmap/AlgebraicTopology/` and `TauCetiRoadmap/CharacteristicClasses/` are folders this pull request itself changes, so the edit is within its reach.

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` lines 20–22 ("its comparison with the two models here, normalised to be the identity on `G`, is also a theorem of this roadmap"), 69–72, 105–107 ("the comparison of its nerve model with the models here is owned here, not there"); `TauCetiRoadmap/AlgebraicTopology/README.md` at this head, lines 93–101 ("Stage8.8b owns only its normalized comparison with those ClassifyingSpaces models"), 2057–2062 ("Compare this bar model pointedly with ClassifyingSpaces' Milnor and presentation models, using its Stage 3 items11–15 and Stage 4 items16–18"), 2073–2076, and the table row at line 2424 ("8.8b normalized model comparison | AT8.8a bar model; CS Stage3 items11–15 and Stage4 items16–18 | 8.9").

**Claim.** Unchanged: the AlgebraicTopology README is byte-identical since 4f06ba2 (`git diff 4f06ba2 HEAD -- TauCetiRoadmap/AlgebraicTopology` empty), so the comparison has two owners and the two roadmaps supply each other (AT 8.3/8.5/8.8a → CS 11–18 → AT 8.8b), which lines 105–107 here deny. The dependency check does not see it because the AT row is not a `*Needs:*` line (`depcheck: 242 roadmaps, 2367 edges, 0 problem(s)`). Downstream, `TauCetiRoadmap/CharacteristicClasses/README.md` at this head still cites the AT owner at lines 64 ("AT8.8b's normalized ℤ/2 model"), 733 ("through AT8.8b's normalized model comparison") and 753 (`*Needs:*` "AT8.3, AT8.5, AT8.8b, AT8.10"), also byte-identical since 4f06ba2.

**Witness.** The lines quoted, read at 0f7ed58.

**Repair.** In `TauCetiRoadmap/AlgebraicTopology/README.md` lines 93–101 become a consumer sentence ("ClassifyingSpaces Stage 3 item 14 and Stage 4 item 17 compare the nerve model of 8.8a with the Milnor and presentation models and identify the three (co)homology comparisons"), lines 2057–2062 and 2073–2076 are deleted, 8.8b is deleted or reduced to what 8.8a does not own, and the row at line 2424 loses its CS entry; in `TauCetiRoadmap/CharacteristicClasses/README.md` lines 64, 733 and 753 cite ClassifyingSpaces Stage 3 item 14 and Stage 4 item 17 in place of AT8.8b. After R01 the models the comparison is normalised against are the pinned `classifyingSpace G` and `cellularClassifyingSpace R`, which both READMEs then name.

## R04 (P2) — The presentation-complex `K(A, 1)` tower for abelian `A` is built in AlgebraicTopology 8.8c, in Stage 2 here, and at the pin

Re-raised: F02 of the round-7 repair report (answered as an AlgebraicTopology-side edit; same reason as R03: that folder is the pull request's own).

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` line 67 ("It owns the two models (Stages 1 and 2)"), items 7–10 (lines 240–291); `TauCetiRoadmap/AlgebraicTopology/README.md` at this head, lines 2124–2130 ("for n=1 the group-presentation 2-complex, followed by killing successive higher homotopy groups by cells in dimensions ≥n+2, respectively ≥3. Prove each stage preserves π_n and the lower groups, and the limit's homotopy groups by compact-family factorization through the CW tower").

**Claim.** Unchanged on both sides, so the cellular `K(A, 1)` of an abelian group has two roadmap owners and, at the pin, a third: `TauCeti.cellularClassifyingSpace` with `isEilenbergMacLaneSpaceOne_cellularClassifyingSpace` (`Cellular.lean` 113, 161) and `killHomotopyGroups` for any Hausdorff space and every `n ≥ 1` (`KillHomotopyGroups.lean` 269, 320).

**Witness.** The AT lines quoted; Stage 2's Check at lines 258–259 (`S = {a}`, `R = {aⁿ}`) is an instance of AT 8.8c's `n = 1` model and of the pinned `cellularClassifyingSpace`.

**Repair.** Both READMEs cite the pin for the presentation 2-complex and the killing tower: here, Stage 2 becomes citations (R01, items 7–10); in `TauCetiRoadmap/AlgebraicTopology/README.md` 8.8c's `n = 1` presentation model and its general killing construction (lines 2124–2137) cite `TauCeti.PresentationComplex`, `TauCeti.killHomotopyGroups`, `TauCeti.cellularClassifyingSpace` and keep only the `n ≥ 2` wedge-of-spheres models the pin lacks. If a roadmap-side owner is kept, there is exactly one, in the upstream roadmap.

## R05 (P2) — Scope item 1 promises the cellular model is locally path-connected and semilocally simply connected, and no item or supplier in the README provides it

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` lines 32–36 ("Each is proved path-connected, locally path-connected and semilocally simply connected, so that the classification theorems of the universal-covers roadmap apply to it"); item 10, lines 285–291, whose `*Needs:*` lists (7), (9) and `IsEilenbergMacLaneSpaceOne` only.

**Claim.** Unchanged: Stage 1 proves the standing hypotheses for the simplicial model (item 4); for the cellular model nothing in the README proves or cites them. The pin states exactly this: `instSemilocallySimplyConnectedSpaceCellularClassifyingSpace` (`Comparison.lean` 275–276), `instDeltaGeneratedSpaceOfCWComplexUniv` (a Hausdorff CW complex is delta-generated, hence locally path-connected), and `exists_isEilenbergMacLaneSpaceOne_cellularClassifyingSpace` (`Comparison.lean` 287–291), whose conclusion carries both hypotheses.

**Witness.** `#check` of the three names re-elaborated this round (signatures: `∀ {S} (R : Set (FreeGroup S)), SemilocallySimplyConnectedSpace (cellularClassifyingSpace R)`; `[T2Space X] [Topology.CWComplex Set.univ] → DeltaGeneratedSpace X`; `∃ R, LocallyPathConnectedSpace _ ∧ SemilocallySimplyConnectedSpace _ ∧ IsEilenbergMacLaneSpaceOne G _ _`). Hatcher, Proposition A.4, p. 522 (`hatcher-at` line 22629) is the textbook statement.

**Repair.** In item 10 (or in the `From Tau Ceti` contract after R01) cite `exists_isEilenbergMacLaneSpaceOne_cellularClassifyingSpace` as the existence theorem with the standing hypotheses, and `instDeltaGeneratedSpaceOfCWComplexUniv` with `instSemilocallySimplyConnectedSpaceCellularClassifyingSpace` as the two instances; item 16's `*Needs:*` then names them for the universal cover of the cellular model.

## R06 (P3) — Segal's remark on Milnor's join is in his §3, not §2

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` lines 152–153 ("Segal 1968, §2, the remark comparing `BG` with Milnor's join") and 536–538 ("Section 2. The simplicial viewpoint on the same construction").

**Claim.** Unchanged. The remark is in §3, "The classifying space of a topological group".

**Witness.** `segal-1968` line 64 (§2 heading, "Categories and classifying spaces"), line 95 (§3 heading), lines 115–127 (the comparison of `BG` with `(G * G * …)/G`, the collapse of degenerate simplices, the unravelled category whose classifying space is Milnor's), re-read this round.

**Repair.** Replace "§2" by "§3" at line 152 and "Section 2" by "Section 3" at line 537.

## Previous findings

- R01 — not repaired: README lines 24, 61–73, 112–143 and items 1–19 byte-identical since 4f06ba2; the pin `2fd255d99` unchanged and its `ClassifyingSpace/` directory still proves items 1–13, 15, 16, 18, 19 (R01 here).
- R02 — not repaired: `Suggested.lean` lines 54–57 unchanged; the six-component term re-elaborates at this head (R02 here).
- R03 — not repaired: `TauCetiRoadmap/AlgebraicTopology/README.md` lines 93–101, 2057–2062, 2073–2076, 2424 and `CharacteristicClasses/README.md` lines 64, 733, 753 byte-identical (R03 here).
- R04 — not repaired: AT lines 2124–2130 and Stage 2 here unchanged (R04 here).
- R05 — not repaired: lines 32–36 and item 10's `*Needs:*` unchanged; the pinned instances still unmentioned (R05 here).
- R06 — not repaired: line 152 still "§2", line 537 still "Section 2" (R06 here).

## Verified sound

**Change set.** `git diff --stat 4f06ba2 HEAD -- TauCetiRoadmap/ClassifyingSpaces`: empty; the same for `TauCetiRoadmap/AlgebraicTopology` and `TauCetiRoadmap/CharacteristicClasses`. `git diff --stat origin/main...HEAD` outside the fourteen folders the brief names as the pull request's own: empty. The two files `changes.md` lists outside the folder (`BordismFormalGroups/README.md`, `Suggested.lean`) are the only edits of 0f7ed58 and this roadmap cites nothing in them. The repair commit the round-7 repair report named (`7f95ca57`) does not exist in this repository (`git log --all`), so its edits never reached the pull request. Pins at HEAD, 4f06ba2 and origin/main: Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`, Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` (read from each `lake-manifest.json`).

**Gate.** Worker's gate at 0f7ed58: every check 0, `OK`. My run from the worktree against `origin/main`: every check 0 except `outside-folder=17`, every listed file in `AlgebraicCurves`, `AlgebraicTopology`, `BordismFormalGroups`, `CharacteristicClasses`, `ComplexKahlerGeometry`, `GeneralizedCohomology`, `LocalPurity` or `PadicFunctionalAnalysis`, all folders the brief names as the pull request's own, so not a finding. Dependency check, verbatim: `depcheck: 242 roadmaps, 2367 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line for this roadmap; its suppliers (UniversalCovers in `Completed/`, AlgebraicTopology, GeometricTopology, ProfiniteCohomology) are on main.

**Elaboration.** `lake env lean TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` from the worktree at this head: exit 0, six `declaration uses sorry` warnings (lines 54, 62, 76, 91, 104, 114), nothing else; the file is in module form (`module`, `public import Mathlib`, two `public import TauCeti.*` lines, `public section`), with no `set_option`, no sorry'd data, `theorem` throughout. The worker's `signatures.md` (6 declarations, none with a dropped binder) agrees with the previous reviews' `#check` comparison, which stands since the file is unchanged: existence with no hypothesis beyond `Group G`; the 2-complex with `PathConnectedSpace`, `IsEmpty (cell univ n)` for `2 < n`, `Nonempty (π₁ ≃* G)`; maps into an aspherical space with `[PathConnectedSpace X]` explicit; uniqueness with both `T2Space` and both `CWComplex` instances; (co)homology with `k`, `G`, `X` in one universe.

**Pinned modules probed this round.** Object files of `TauCeti.AlgebraicTopology.ClassifyingSpace.{Comparison,Homology,Cohomology,Uniqueness}` are present in the worktree's build; a scratch probe importing them elaborates (exit 0) the term of R02, the two model-level (co)homology terms, and `#check` of `classifyingSpaceFundamentalGroupMulEquiv_apply_eq_iff`, `exists_isEilenbergMacLaneSpaceOne_cellularClassifyingSpace`, `instSemilocallySimplyConnectedSpaceCellularClassifyingSpace`, `instDeltaGeneratedSpaceOfCWComplexUniv`, `cellularHomotopyEquivClassifyingSpace`, `IsAspherical.exists_homotopyEquiv`, `IsEilenbergMacLaneSpaceOne.nonempty_homotopyEquiv`, `instCWComplexClassifyingSpace`, `instT2SpaceClassifyingSpace`, `PresentationComplex.cellTwoEquiv`, `exists_mapOfEq_cellularClassifyingSpace` (signatures as cited in R01, R02 and R05). The remaining names of R01 are cited from the file headers and the previous review's probe, at the same pin.

**Sources re-read at this review.** Seeded sample "Both models are wanted" (README lines 14–22): `hatcher-at` lines 3844–3846 (Example 1B.7, `EG` on ordered tuples), 3897–3899 (Theorem 1B.8, the homotopy type of a CW `K(G, 1)` is determined by `G`), 3905–3908 (Proposition 1B.9, maps out of a connected CW complex into a `K(G, 1)`, unique up to based homotopy); `segal-1968` lines 64, 95, 115–127; the paragraph's mathematical claims hold, its locator slip is R06, its last sentence is contradicted by AT 8.8b (R03). `hatcher-at` line 22629 (Proposition A.4) for R05.

**Cross-roadmap citations.** Carried from the previous reports (README unchanged, the cited roadmaps on main the same files): UniversalCovers items 5, 6, 11–14; GeometricTopology Layer 11; AlgebraicTopology Stage 1 item 4, Stage 2 item 6, Stage 4 items 1–3, 4.5, 4.7, 4.8, 8.3, 8.5, 8.8a, 8.8c; ProfiniteCohomology on main. Re-resolved at this head: AlgebraicTopology lines 93–101, 2057–2076, 2122–2132, 2424 (R03, R04) and CharacteristicClasses lines 64, 733, 753. The worker's `roadmaps resolve` found no unresolved citation or Lean name.

**Ownership.** Against the pinned library: R01, R04, R05. Against roadmaps on main and the open heads: carried from the previous reports (no roadmap other than this one and AlgebraicTopology 8.8c builds the presentation-complex tower, none builds Milnor's countable join for a discrete group, no other folder declares a `TauCetiRoadmap.ClassifyingSpaces.*` name); not redone, the folder being unchanged and the worker's index re-run (`citations.md`: none found nowhere).

**Adversarial table.** Rows for the unchanged statements carry forward from the previous report (review of 4f06ba2, rows 1.1–4.19 and the six Lean rows, with the values it computed); the rows below record what this review recomputed at this head.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.1–1.4, 1.6, 2.7–2.9, 3.11–3.13, 4.16–4.19 | as in the review of 4f06ba2 | as there (carried) | sound as statements; theorems of the pin | R01 |
| 1.5 direction of `π₁(BG) ≃* G` | `S₃` loops `ℓ_s`, `ℓ_t`; `ℤ` | pin (re-elaborated): `classifyingSpaceFundamentalGroupMulEquiv G γ = g ↔` monodromy of `γ` from the base vertex is `⟨0, g⁻¹⟩`, i.e. `g = m(γ)⁻¹`; README: `γ ↦ m(γ)⁻¹`; on `S₃`, `ℓ_s * ℓ_t ↦ (ts)⁻¹ = st` both sides | same convention | none |
| 1.5, 4.16 deck convention | `g`, `g⁻¹`, the base lift | carried: `deckFundamentalGroupEquiv_symm_op g = loopDeck x₀ g⁻¹`, carrying the base lift to the end of the lift of `g`, as the README says | same convention | none |
| 2.10 standing hypotheses of the cellular model | the tautological presentation | pin (re-elaborated): `exists_isEilenbergMacLaneSpaceOne_cellularClassifyingSpace G : ∃ R, LocallyPathConnectedSpace _ ∧ SemilocallySimplyConnectedSpace _ ∧ IsEilenbergMacLaneSpaceOne G _ _`; README lines 32–36: asserted, not supplied | overclaim in the README, supplied by the pin | R05 |
| 3.14 the two models agree; nerve model | `PresentedGroup R ≃* G` given | pin (re-elaborated): `cellularHomotopyEquivClassifyingSpace R e : cellularClassifyingSpace R ≃ₕ classifyingSpace G`; nerve model: no declaration at the pin | first paragraph at the pin; second a genuine target | R01, R03 |
| Lean `exists_cwComplex_isEilenbergMacLaneSpaceOne` | `classifyingSpace G` | the six-component term elaborates at this head (probe, exit 0) | padding at this pin | R02 |
| Lean `exists_cwComplex_dim_le_two_fundamentalGroup_mulEquiv` | `PresentationComplex P.rel`, `P` tautological | pin: `cellTwoEquiv R : cell univ 2 ≃ R` (re-elaborated), `cellOneEquiv`, `fundamentalGroupMulEquiv`; no lemma `IsEmpty (cell univ n)` for `2 < n` | not one tactic; keep | none |
| Lean `exists_continuousMap_mapOfEq_eq_of_isAspherical` | `X` arbitrary path-connected Hausdorff CW | pin (re-elaborated): `exists_mapOfEq_cellularClassifyingSpace` gives existence only out of `cellularClassifyingSpace R`, with `Subsingleton (HomotopyGroup.Pi k Z z)` for `k ≥ 2`; no general-CW existence | keep | none |
| Lean `exists_homotopyEquiv_of_isAspherical` | two Hausdorff CW aspherical spaces | pin (re-elaborated): `IsAspherical.exists_homotopyEquiv` yields `e`, a path `γ` and `fundamentalGroupMulEquivOfPath γ ∘ map e x = φ`; the headline demands `F x = y` | keep (pointed form is stronger) | none |
| Lean (co)homology headlines | `X = classifyingSpace G`; `X` arbitrary | model: `⟨(classifyingSpaceSingularHomologyIsoGroupHomology k G n).symm⟩` and the cohomology analogue elaborate at this head; general `X`: needs `IsEilenbergMacLaneSpaceOne.nonempty_homotopyEquiv` (re-elaborated: two `CWType` spaces, `Nonempty (X ≃ₕ Y)`) plus homotopy invariance | keep; docstring to name the pinned model case | R01 (iv) |

## Not verifiable

- Milnor, "Construction of universal bundles, II", Ann. of Math. 63 (1956): settled as uncertified; cited by locator only. Segal §3 (`segal-1968` lines 115–127) read instead.
- Brown, *Cohomology of Groups*, §I.4 and Chapters I–III: settled as uncertified; cited by locator only (items 13, 16).
- tom Dieck, *Transformation Groups*, §II.1: settled as uncertified; cited by locator only (item 13).
- Schwamberger–Vogt, "Dold spaces in homotopy theory", §2: settled as uncertified; the Warsaw-circle claim is standard; the locator into the paper is not confirmed.
- Ownership against open pull requests whose files the brief does not list: not checked beyond the worker's index.

## Source issues

- none
