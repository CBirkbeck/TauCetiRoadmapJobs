# Review of RootSystems (pull request #2212 at 6b70111)
Folder: `TauCetiRoadmap/RepresentationTheory/RootSystems/`

**Verdict:** accepted

Incremental re-review of 0 changed lines since `46cd680`; this round reads the pull request's title and description against the head. No finding.

## Previous findings

The review of `46cd680` had no finding; its seven repaired items (R01–R07 of the review before it) stand, the folder being byte-identical to `46cd680`.

## Verified sound

| Statement (as the description cites it) | Instances tried | Values computed on the two sides | Result |
|---|---|---|---|
| `finite_iff_geometricForm_posDef` ("finitely many generators and positive definite"; "on the natural numbers, the chain … infinite group") | I₂(5); two nodes, infinite entry; ℕ chain with labels 3 | \|W\|=10, Gram det sin²(π/5)=(5−√5)/8≈0.345>0; W infinite, B(1,1)=1+1−2=0; segment of n nodes det(2B)=n+1>0, W ⊇ S_{n+1}, I infinite | Pass; the description matches `Suggested.lean:122` and `README.md:852–859` |
| Type D convention ("in Mathlib's `CoxeterMatrix.D 4` the nodes 1, 2, 3 are pairwise joined and the form vanishes at (0,1,1,1)") | n=4 at the pin | Mathlib entry 3 at (0,1),(1,2),(2,3),(3,1): value 3+3·2·(−1/2)=0; native D 4: entry 2 at (2,3), centre 1, det(2B)=4 | Pass |
| `FiniteCoxeterType.Valid` for I m ("`CoxeterMatrix.I (m - 2)`, validity asks 5 ≤ m") | m=2,3,4,5,6 | entry (m−2)+2: 2 (disconnected), 3 (=A 2), 4 (=B 2), 5, 6 (=G₂); only m≥5 is new | Pass |
| `existsUnique_finiteCoxeterType` ("noncrystallographic types H₃, H₄ and I₂(m) for m = 5 and m ≥ 7") | H₃; chain 3,7 | leading Gram minors 1, 3/4, (3−√5)/8≈0.095>0; det 3/4−cos²(π/7)≈−0.062<0 | Pass |

Rows for the untouched statements stand as in the previous review, of `46cd680`; the diff changes no statement.

- Pull request text against the head, sentence by sentence: title; summary block (three sections §§3.3–3.5 added, 0 headings removed, Layers 1, 2, 4–6 and §§3.1–3.2 without a hunk, new sections cite §§1.2, 1.3, 2.1 at `README.md:918`, `981`, `1013`); route (cone and unit ball, averaged form, comparison with seven vectors at `README.md:1036–1059`, tree with labels in {3,4,5}); the two added imports, `FiniteCoxeterType` with `rank`, `Valid`, `coxeterMatrix`, and the five theorems with their sections; the ten Davis locators, all in `README.md:852–1033` and the References; suppliers Mathlib and Tau Ceti only. No sentence contradicts the head and no change of the folder is left unstated.
- Library declarations opened at the pin (4): `TauCeti.isFiniteType_of` (`TauCeti/LinearAlgebra/RootSystem/FiniteType/Basic.lean:139`), `TauCeti.IsFiniteType.existsUnique_dynkinType` (`FiniteType/Classification.lean:88`), `TauCeti.IsTree.nonempty_iso_pathGraph_of_degree_le_two` (`TauCeti/Combinatorics/SimpleGraph/PathGraph.lean:140`), `TauCeti.DynkinType.coxeterMatrix_D_apply` and `coxeterMatrix_D_ne_coxeterMatrix_D` (`Coxeter/DynkinType.lean:224`, `236`); Mathlib `CoxeterMatrix.D` and `CoxeterMatrix.I` (`Mathlib/GroupTheory/Coxeter/Matrix.lean:143`, `160`). The pins are those of `46cd680`.
- Gate rerun at this head: OK, every counter 0. Dependency check: `depcheck: 244 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `Suggested.lean`: exit 0, 15 `declaration uses sorry` warnings and nothing else. File and pins unchanged since `46cd680`, so the signatures and the one-tactic probe stand.
- Outside the folder: `git diff origin/main...HEAD` lists only the two files of the folder; the sixteen `PROGRESS.md` and `STATUS.md` files that differ from `46cd680` come from the merge of main and are not changes of this pull request.
- Cross-roadmap: no open pull request changes RootSystems or drops an id it cites; the resolver's one lead, `FiniteCoxeterType.connected_graph_and_posDef`, is declared at `Suggested.lean:176`. Source locators re-checked this round: 0 (no changed passage).
- Overlap check: read RootSystemsPartII, KacMoody, ReductiveGroups (main), OrthogonalTamagawaAndLatticeMass, SchubertGeometry, EnriquesSurfaces, PseudolineArrangementsAndOrientedMatroids, LieHighestWeight (open); nothing shared. A search of main and all open heads for `FiniteCoxeterType` and the classification of finite Coxeter groups finds this pull request only; the pinned Tau Ceti has no such declaration.
- Source independence: changed passages only; 0 passages compared with 0 sources, since the folder did not change; the arrangement was not compared again (no layer added, removed or reordered since `46cd680`).

## Not verifiable

- humphreys90, bourbaki46, bjornerbrenti05, humphreys72, kac90: settled as uncertified; no changed passage cites them.
- The description's sentences "the quoted matrix entries were checked by `decide`" and "every locator was checked against the author's copy" report the author's own checks; the entries and locators themselves agree with the pins and with davis08 as recorded in the earlier reviews.
- The 15 admitted theorems were elaborated and tested on instances, not proved.

## Source issues

- none

## For the human reviewers

- none
