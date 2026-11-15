# Review of ToposTheoreticBridges (pull request #2337 at 62e6753)

**Verdict:** accepted

No findings. Incremental re-review: the folder has 0 changed lines since `1c43589`; the only change is the pull-request description, which now carries the repair the previous review asked for.

## Previous findings

- R01 — repaired: the description no longer names head `f1fdd745`; its supplier paragraph reads “Mathlib, GrothendieckTopoi §§4.1–4.2, 6.5 and ClassifyingTopoi §§1.1, 1.3–1.4, 2.1, 2.4–2.6” and states the Lean content and Layer 4's semantic classes.

## Verified sound

| Statement | Instances tried | Left-side value | Right-side value | Result / change |
|---|---|---|---|---|
| §1.2 Karoubi criterion (cited by the description) | `C` = monoid `{1,e}`, `e²=e`; `D` = its Karoubi envelope (two objects) | Presheaves on `C`: sets with an idempotent; on `D`: a set with a retract; equivalent via the image | `Karoubi C` has 2 isomorphism classes; `Karoubi D ≌ D ≌ Karoubi C` | Both sides true, though `C ≄ D` (1 versus 2 classes) |
| §1.2 Karoubi criterion, negative control | `C` = one point, `D` = two discrete points | Terminal presheaf indecomposable on `C`, equals `(1,0) ⊔ (0,1)` on `D`: not equivalent | Envelopes have 1 and 2 isomorphism classes: not equivalent | Both sides false; no change |

The diff changes no statement; the remaining adversarial rows stand as in the previous review, of `1c43589`.

- Description against the head: every prose sentence compared with `TauCetiRoadmap/ToposTheoreticBridges/README.md` and `Suggested.lean`: 4 layers, 9 declarations (6 sorried theorems, 3 definitions with bodies), `topic = "math.CT"`, 16 supplier sections, 10 source locators, “Downstream: None”; no sentence is contradicted. `Suggested.lean` is identical to its state at `1a800453`, as the description says.
- Remark: the description's source list names “Definitions 3.4 and 3.5, p. 14” of « Lattices of theories »; the README cites only Definition 3.4 (README:417–418). Nothing depends on it.
- Citations resolved again at the open heads: GrothendieckTopoi §4.1 (`Subtopos`, Convention 6), §4.2 (subtopoi of `Sheaf J (Type u)` ↔ `J' ≥ J`), §6.5 (`Idempotents.Karoubi C`); ClassifyingTopoi §§1.3, 1.4, 2.1, 2.4, 2.5, 2.6 with `CatStructure.IsModel`, `CatStructure.IsModel.map`, `IsClassifyingSite.exists_equivalence`, `exists_quotient_topology`, `exists_quotient_theory`, `MoritaEquivalent`. The three scanner leads are these ClassifyingTopoi names.
- Pinned API: `GrothendieckTopology.RightOreCondition` at `Mathlib/CategoryTheory/Sites/Grothendieck.lean:394`; the pins (`lake-manifest.json`, `lean-toolchain`) are unchanged since `1c43589`.
- Gate, rerun on this head: every scanner 0, `outside-folder=0`, `OK`; the worker's targeted build passes. `git diff --stat origin/main...HEAD` outside the folder is empty (the files listed as changed since `1c43589` come from merging main).
- Elaboration of `Suggested.lean`: six `sorry` warnings (lines 40, 54, 59, 74, 79, 89), nothing else. Signatures and one-tactic probes stand from the previous review, the file being unchanged.
- Dependency output: `depcheck: 245 roadmaps, 2231 edges, 0 problem(s)`.
- Overlap check: read ClassifyingTopoi, GrothendieckTopoi, TotallyDistributiveTopoi, HomotopyTheoryOfCategories, LocallyPresentableCategories; nothing shared (GrothendieckTopoi owns subtopoi, the site correspondence and the Karoubi identification; ClassifyingTopoi owns geometric theories, classifying sites and Morita equivalence of theories; both are cited). No overlap fact is listed for this roadmap.
- Source independence: changed passages only; 0 passages changed, so 0 compared with 0 sources; largest share Caramello2017Lattices, 4 of 11 locators; no layer added, removed or reordered, so the previous comparison of contents (independent) stands.

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- none
