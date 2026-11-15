# Review of GeometricSatakeAndFusionPartII (pull request #1836 at 3ef4ea3)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 3ef4ea3; this round reads the pull request's title and description against the head. The folder needs no change: both findings are about the description.

## R01 (P3) — The description says the Lean states definitions and theorems; it declares nothing

**Location:** pull request description, paragraphs "Roadmap folder" and "Validation": “the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti” and “the targeted Lake build succeeds with `sorry` as the only warning”.

**Claim:** A reader concludes that `Suggested.lean` states headline theorems with `sorry`. At this head it states none, and the build has no `sorry` warning.

**Witness:** `TauCetiRoadmap/GeometricSatakeAndFusionPartII/Suggested.lean` lines 10–11: “None of the headline theorems is statable at the pins, so this file declares nothing”; line 61 is a comment between `namespace` and `end`. `lake env lean` on it: exit 0, no output.

**Repair:** Replace the two clauses by: “`Suggested.lean` declares nothing: none of the headline theorems is statable at the pinned Mathlib and Tau Ceti, and its module docstring names each headline with the carriers it lacks; every target is in the README.” and “Validation: the targeted Lake build succeeds with no warning (the file has no declaration, hence no `sorry`); …” (the rest of the sentence stands).

## R02 (P3) — A sentence of the description ends at a colon with nothing after it

**Location:** pull request description, first paragraph after the summary block: “Building on that, this roadmap constructs the scheme geometry of integral local models of Shimura varieties:”

**Claim:** The sentence announces a list of what the pull request adds; the next paragraph is “Roadmap folder …”, so the list is missing.

**Witness:** The head has nine layers (`README.md` lines 191, 339, 429, 569, 673, 872, 945, 1059, 1157); the description's prose names none of them after the colon.

**Repair:** Complete the sentence: “… of Shimura varieties: polynomial Schubert-bound closures and their comparisons (Layer 1), closed Hodge and lattice-chain embeddings (Layer 2), canonical and weakly normal representatives (Layer 3), formal-curve tangent spans (Layer 4), same-residue-field Schubert curves (Layer 5), EL and PEL models with the Drinfeld comparisons (Layer 6), connected tubes and minuscule normality at every prime (Layer 7), and the central test function (Layer 8), over the data and conventions of Layer 0.”

## Previous findings

- none: the previous review (of 3ef4ea3, accepted) had no finding; its two repaired findings R01 and R02 of bb281a2 concern passages that have not changed since.

## Verified sound

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| Description: “reuses Mathlib's `Module.Grassmannian`, `Algebra.trace` and `Submodule.span` and Tau Ceti's `…ZariskiTangentSpace`” | the four declarations at the pins (Mathlib f6090c7, Tau Ceti 358314d) | `Mathlib/RingTheory/Grassmannian.lean:66` structure; `RingTheory/Trace/Defs.lean:70` def; `LinearAlgebra/Span/Defs.lean:46` def; `TauCeti/AlgebraicGeometry/TangentSpace/Basic.lean:65` abbrev; all four in `README.md` lines 41, 45 | holds | none |
| §2.8 trace form, cited by the description through `Algebra.trace` | K=F(√d), char ≠ 2; inseparable F_p(t^(1/p))/F_p(t) | Gram matrix on (1,√d): diag(2,2d), det 4d ≠ 0; inseparable: trace(t^(i/p)) = 0 for all i, form zero. `traceForm_nondegenerate` (`Trace/Basic.lean:501`) carries `FiniteDimensional` and `Algebra.IsSeparable` | holds; separability needed | none |
| Description: “normal minuscule models … at every prime”; “any dominant bound”; “every reductive group, non-quasi-split inner forms included” | README Summary (line 3), Scope (line 7), §8.4 (lines 1212–1214) | Summary: tubes for every dominant bound, minuscule normality at every prime, test function for all reductive groups; §8.4 uses inner-form transfer from the quasi-split form | agrees | none |
| Description: “Why Tau Ceti wants it” | README Downstream consumers (line 1234) | very-good embeddings and integral Shimura models (ShimuraVarieties continuation), Kottwitz–Rapoport specialization paths, local Shimura geometry, Hecke and local-shtuka spaces, local trace calculations: all five named there | agrees | none |
| Description: “7 independent review rounds and 2 red-team rounds” | the package's report files | 7 package-review reports, 2 red-team rounds (two reports each) | agrees | none |
| Description: “outside-folder diff has 0 path(s)”, “no `set_option` overrides (0); sorry'd data: 0” | `git diff --stat origin/main...HEAD` outside the folder; gate | empty; `set_option=0 sorry-data=0 outside-folder=0` | agrees | none |

The rows for the roadmap's own statements stand as in the previous review, of `3ef4ea3`: the folder has not changed.

- Gate re-run at 3ef4ea3: `gate GeometricSatakeAndFusionPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
- Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. Merge order: GeometricSatakeAndFusion 133, DiamondsAndVStacksPartII 135, RootSystemsPartII 209, this roadmap 211.
- Elaboration: `lake env lean` on `Suggested.lean`: exit 0, no output. No `#check @name` file was needed: the file has no named declaration.
- Library declarations opened at the pins: 5 (the four above and `traceForm_nondegenerate`).
- Title: “GeometricSatakeAndFusionPartII: roadmap” agrees with the change (the folder is not on main; 1333 insertions, 0 deletions, 94 headings added, none removed). The twelve supplier headings of the README (lines 47–171) are the roadmaps the description's prose calls cited “by name and section”; six of them are on main, six are in the generated dependency block.
- Seeded sample: no seeded target falls in a changed passage (0 lines changed); source locators re-read this round: 0.
- Overlap check: not redone, since the folder did not change; the overlap list for this head shows no other pull request changing this roadmap, no dropped id, no id defined only by an open revision and no second copy (the folder is absent from main).
- Source independence: changed passages only — the folder has 0 changed lines, so 0 passages were compared with 0 sources; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- none
