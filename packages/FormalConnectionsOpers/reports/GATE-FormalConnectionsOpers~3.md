# GATE-FormalConnectionsOpers~3: answers to human review

One unanswered comment (mycaule, 2026-11-16T06:49:53Z). It makes two points: that the roadmap
no longer depends on any open pull request (H01), and that it should be merged to unblock the
roadmaps that depend on it (H02). Neither asks for a change to the roadmap, and none was made:
`TauCetiRoadmap/FormalConnectionsOpers/README.md` and `TauCetiRoadmap/FormalConnectionsOpers/Suggested.lean`
are unchanged at `4b3f57b`, and there is no commit.

## H01 (mycaule) — answered

Confirmed: all 18 supplier roadmaps listed under "Exact supplier contracts" (README lines 304–472) are on main at `2b9ce21`. That is the top-level folders, plus LieGroups, LieHighestWeight and RootSystems under `RepresentationTheory/` and AnalyticToricGeometry under `Completed/`. The dependency check reports `depcheck: 248 roadmaps, 2375 edges, 0 problem(s)`, with no UPWARD or CYCLE line, and no open pull request changes this roadmap or drops an id it cites.

## H02 (mycaule) — answered

Whether to merge is up to the human reviewers. These facts bear on it: the build and the gate pass at `4b3f57b` (outcomes below). Four roadmaps on main already cite this one as a supplier: AffineLieAlgebras (README line 118, "From TauCetiRoadmap.FormalConnectionsOpers"), GeometricRepresentationCategories (lines 47, 64), NilpotentOrbits (lines 60, 63, 313) and SchubertGeometry (line 111). Thirteen open roadmap pull requests cite it too, eleven of them new roadmaps, PCurvature among them. Every id they cite exists in this README: F1–F8, F2.1, F2.2, F2.4, F4.3, F7.5, §2.1, §2.3, §2.4, §3A.5, §6.2, Layer 3A and `IsomOp`.

Merging does not fix two links in main's NilpotentOrbits README. Lines 60 and 63 point at the anchors `#f2-algebraic-sheaf-connections-and-differential-operators` and `#f4-intrinsic-opers-and-the-dskostant-slice`. Those anchors belonged to the headings `## F2. …` and `## F4. …`, which this README now titles `## Layer 2: … (F2)` and `## Layer 4: … (F4)`. The ids in the link text, F2.4 and F4.3, still resolve; only the two anchors need changing, and that edit belongs in NilpotentOrbits, not in this folder. GeometricRepresentationCategories line 47 links to this pull request rather than to the roadmap folder, so that link also needs updating once this merges.

## Other checks

- **Citation lead.** The one name the resolver could not find, `AffineWeylGroup.not_all_of_N` (README line 1330), is not missing. It is the PGL₂ non-example under ReductiveGroupsPartII RG2.1 on main (that README, line 2280), and the citation names it as that roadmap's non-example. Likewise `sl2_eq_affineWeyl` (README line 1327) is ReductiveGroupsPartII's Check at line 5576 on main.
- **Adversarial pass.** No statement was added or changed, so there was nothing new to run the pass on.
- **Signatures.** `Suggested.lean` is unchanged, so `#check @name` was not re-run. The provided elaborated signatures show 0 of the 9 declarations having lost a section binder.
- **Ownership.** No construction was added, so no new ownership question arises.
- **Suspicious text.** The comment contains no instructions aimed at the job.

## Build

`lake build TauCetiRoadmap.FormalConnectionsOpers.Suggested`: `Build completed successfully (18586 jobs).` It gives three `declaration uses 'sorry'` warnings, at `Suggested.lean` lines 74, 133 and 163.

## Gate

`gate FormalConnectionsOpers: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

## Dependency check

`depcheck: 248 roadmaps, 2375 edges, 0 problem(s)`
