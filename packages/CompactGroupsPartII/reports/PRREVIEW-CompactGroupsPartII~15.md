# Review of CompactGroupsPartII (pull request #1047 at 7fcba97)
Folder: `TauCetiRoadmap/RepresentationTheory/CompactGroupsPartII/`
**Verdict:** accepted

Incremental re-review of 0 changed lines since 7fcba97. This round read the pull request's title and description against the head. No finding; the gate passes.

Unless otherwise specified, README locations mean `TauCetiRoadmap/RepresentationTheory/CompactGroupsPartII/README.md`; Lean locations mean its `Suggested.lean`.

## Previous findings

- none: the previous report (of 7fcba97, the same head) had no finding; its R01 and R02 bullets recorded repairs of an earlier report, and the family index :50–54 and :100–108 they quote are unchanged.

## Verified sound

| Statement | Instances | Computed values on both sides / wrong model | Result | Change |
| --- | --- | --- | --- | --- |
| Description: "three definitions and fifteen headline theorems"; "builds with fifteen admitted theorems" | Declarations of the Lean file; elaboration | 18 declarations = 3 definitions (`IsGFinite`, `gFiniteSubmodule`, `compactCharacter`) + 15 theorems; 15 `sorry` warnings, 0 errors. | Agrees. | None |
| Description: "changes only the family index" besides the two folder files; base folder unchanged | Diff against main | 3 files: README 1739, Lean 311, index 14 insertions; 0 deletions; 0 lines in `CompactGroups/`. | Agrees. | None |
| Description: suppliers "LieGroups Layers 0, 2–5, 5A, 6 and 7 … ConvexityToric T1 … BanachSpaceTheory B5", "all consumed roadmap contracts are on main" | README:375–400 against main at 8ad4192 | 8 of 8 named suppliers occur in the contracts; LieGroups headings :252, :356, :446, :463, :518, :641, :673, :787; ConvexityToric :200, :206; BanachSpaceTheory :42, :841; 0 named suppliers off main. | Agrees. | None |
| Description: energy identity "for every compact Hausdorff space with a finite Borel measure" (Lean:53, README:484–499) | Two points of mass 1 and 2, k=1 | Basis images have squared norms 1·3 and 2·3, energy 9; product integral 3²=9. Probability normalisation would give 1. | Agrees. | None |
| Description: "for any group and with no continuity hypothesis … unitarily equivalent" (Lean:86, README:701–720) | ℤ: 1 ↦ diag(i,−i) and 1 ↦ rotation by π/2 | Traces iⁿ+(−i)ⁿ on both sides; unitary with columns (1,−i)/√2, (1,i)/√2 intertwines: rotation sends (1,−i) to i(1,−i). | Agrees. | None |
| Summary block: "embeddings corresponding to partitions containing an even part" (README:1677–1684) | n=4, n=5; (3,2) and (3,1,1) | n=4: 5−2=3 classes; n=5: 7−3=4, namely (4,1),(3,2),(2,2,1),(2,1,1,1). (3,2): kernels {±I}∩{I}={I}; (3,1,1): kernel {±I}, not faithful. | Agrees. | None |
| Description: U(2) "descend through its kernel, retaining … central characters" (README:1571–1575) | (a,b)=(1,−1) and (1,0) | (−1,−I) acts by (−1)^(a+b)(−1)^(a−b)=(−1)^(2a)=1 in both; (a+b)−(a−b)=2b=−2, 0. | Agrees. | None |
| Summary block: consumers of the density theorem and of §6.7 | README:1711–1722, :60–65 | 3 of 3 named consumers (AutomorphicFormsOnReductiveGroups §2.1, SmoothBanachRepresentations §4.1, TopologicalKTheory T6) are in Downstream consumers; representation ring owned by T6, 0 ring constructions here. | Agrees. | None |

The rows for the roadmap's own statements stand as in the previous review, of `7fcba97`: no statement changed.

- Description, every sentence of the summary block and of the author's paragraphs read against the head: 0 contradicted, 0 changes left unstated (it says the folder is new, names every supplier, and states the index change). Title "CompactGroupsPartII: roadmap" fits a pull request that adds the roadmap.
- Gate at 7fcba97: every counter 0, `build=0 OK`. Dependency check: `depcheck: 246 roadmaps, 2235 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of the Lean file: exit 0, exactly 15 `declaration uses sorry` warnings (lines 53, 68, 86, 148, 163, 170, 189, 204, 218, 241, 250, 257, 269, 289, 302), nothing else. Signatures unchanged, so the `#check` comparison of the previous review stands.
- Cross-roadmap citations resolved on main at 8ad4192: 4 supplier roadmaps (above), plus LieHighestWeight Layers 7 and 9 (:1744, :2695), OperatorIdeals Part C (:530), TopologicalKTheory T6 (:1202). Citation and overlap inventories for this index list nothing unresolved, dropped or revision-only; main has no `CompactGroupsPartII` folder (no second copy).
- Outside the folder and the family index: the diff is empty.
- Sources: no passage changed, so no seeded target falls in a changed passage; the locator table of the earlier full review stands.
- Remark (untouched text, no change asked): TopologicalKTheory on main (:83–93), and the open AutomorphicFormsOnReductiveGroups, SmoothBanachRepresentations and NoncompactQuantumSymmetry, address `gap:banach-gfinite-density` to "CompactGroups Layer 5"; the declarations they name are those of §2.1 here, as README:1711–1717 records.

Overlap check: read CompactGroups, LieGroups, ClassicalGroups (main), SatoTateGroups, NoncompactQuantumSymmetry, AutomorphicFormsOnReductiveGroups, SmoothBanachRepresentations, LieHighestWeight; nothing shared. SatoTateGroups consumes CompactGroups and LieGroups Layer 6 Weyl integration and owns no object of this roadmap; ClassicalGroups (:627) treats algebraic groups, not compact unitary ones; the G-finite predicate and density theorem are owned here and consumed by the three Banach-representation roadmaps.

Source independence: changed passages only: 0 passages changed, so 0 compared; largest share Knapp2021, 19 of 24 citations by name; contents not compared again, since no layer was added, removed or reordered.

## Not verifiable

- Conway1990, VII.9, Exercises 8–11 (§§4.1, 5.1): settled as uncertified in the manifest; no text read, none requested.

## Source issues

- none

## For the human reviewers

- none
