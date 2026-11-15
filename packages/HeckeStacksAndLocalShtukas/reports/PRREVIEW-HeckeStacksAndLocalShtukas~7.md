# Review of HeckeStacksAndLocalShtukas (pull request #1252 at 7b6a2e2)

**Verdict:** accepted

Incremental re-review of 0 changed lines since 025265d; this round reads the pull request's title and description against the head. No finding.

## Previous findings

- R01 — repaired: the description now reads “No headline theorem is statable against the pinned Mathlib and Tau Ceti, so `Suggested.lean` declares nothing: its module docstring names the six headline groups … Every target is in the README.”
- R02 — repaired: “the targeted Lake build succeeds; since the file declares nothing there is no `sorry` warning, and the only warning is Lean's notice that the file does not use the module system … Codex and Claude for the red-team and review repairs it includes.”
- R03 — repaired: the title is “Roadmap: Hecke stacks and local shtuka cohomology”, which is `TauCetiRoadmap/HeckeStacksAndLocalShtukas/README.md` line 1.

## Verified sound

| Statement | Instance | Values | Result |
| --- | --- | --- | --- |
| HS2.15, nonempty admissible locus iff `[b]∈B(G,μ⁻¹)` (cited by the description's “nonemptiness and connectedness of admissible loci”) | `GL₂`, `μ=(1,0)`, flag variety `P¹`; four classes `b` | basic of slope `1/2`: all of `P¹`. `O(1)⊕O`: `P¹` minus one point (the line giving `O(1)⊕O(−1)`). `b=1`: degree `−1≠0`, empty. Slopes `(2,−1)`: only `O(2)⊕O(−2)`, `O(1)⊕O(−1)`, empty | agree: nonempty, connected and dense exactly for the two classes of `B(GL₂,μ⁻¹)` |
| HS2.15 Check, `O(1)⊕O` (line 1624) | automorphism group, stratum dimension | positive kernel `H⁰(O(1))`, dimension 1; stratum dimension `−⟨2ρ,ν⟩=−1`; `Hom(O(1),O)=H⁰(O(−1))=0` | agree |
| Description, “the only warning is Lean's notice that the file does not use the module system” | targeted build on this head | `Build completed successfully (18239 jobs)`; one warning, repeated: `Suggested.lean` imports `Mathlib` without `module`; no `sorry` warning | agree |
| Description, “six headline groups (HS1.5 and HS1.9; HS1.0; HS2.15; HS2.18; HS3.5, HS3.6 and HS3.8; HS4.1)” | `Suggested.lean` lines 10–33 | six bullets, the same ids in the same grouping, each with a missing carrier; the namespace (lines 36–38) is empty | agree |

Rows for untouched statements stand as in the previous review, of `025265d`.

- Gate rerun on this head: `OK`, every counter 0 (among them `outside-folder=0`, `stray-files=0`, `readme-ids-missing=0`), exit 0. `lake env lean` on `Suggested.lean`: exit 0, no output; no declaration, so no signature probe and no padding probe.
- Dependency check: `depcheck: 243 roadmaps, 2263 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Merge order: AutomorphicGaloisRepresentationsPartII 173, BunGAndNewtonStrata 195, this roadmap 197.
- Folder diff 025265d..7b6a2e2: empty (the head is a merge of main). `git diff --stat origin/main...HEAD` outside the roadmap folder: empty. No statement, locator, citation or supplier changed, so the seeded sample has no target in a changed passage.
- Description against the head, 19 claims checked and consistent. Title = README line 1. “Adds a roadmap”: not on main, 2689 insertions, 0 headings removed, 0 Lean declarations. Folder contents (README, `Suggested.lean`, `metadata.toml`): 3 files. Summary block: the 14 claims of the previous review stand (README unchanged). Top layer HS4.2–HS4.6 (lines 2300–2479). Consumer AdmissiblePairsAndPadicHodgeStructures, HS2.12 and HS2.15 (line 2599).
- Description, “Roadmaps on main are cited by name; everything else named in the README is a consumer”: of the 18 merge-order roadmaps the README names, 2 are on main, 15 are open suppliers and each is in the description's task list, 1 (AdmissiblePairsAndPadicHodgeStructures, position 260) is the consumer; AdicEtaleGeometry, AdicSpacesPartII, ClassFieldTheory, EnhancedDerivedSheaves, ReductiveGroups, ReductiveGroupsPartII and RepresentationTheory are on main.
- Remark, no change asked: the description's “The route is Fargues–Scholze's Chapter IX” is the description's wording only; the README does not say it follows a source (67 of its 110 chapter-numbered FS locators are in Chapter IX, the rest in II–VIII).
- Overlap check: read IgusaVarietiesAndTorsionConcentration, GeometricSatakeAndFusion, VStackSheavesAndLisseCategories, BunGAndNewtonStrata, AdmissiblePairsAndPadicHodgeStructures (open heads), SmoothRepresentationsOfLocalGroups, DiamondsAndVStacks (main); nothing shared. Boundaries, each stated the same way on both sides: local Hecke stacks, Grassmannians and Satake are GeometricSatakeAndFusion GS0–GS4, which leaves the geometric Hecke action downstream; `Bun_G`, strata and charts are VStackSheavesAndLisseCategories §VS4.0, arithmetic of `B(G)` BunGAndNewtonStrata Layers 0–4; IgusaVarietiesAndTorsionConcentration supplies §§0.11 and 0.27 and constructs no multi-leg or non-minuscule tower; AdmissiblePairsAndPadicHodgeStructures cites §§HS2.12 and HS2.15 as this roadmap's. The worker's list at this head: no other open pull request changes this roadmap, no cited id is dropped, none is defined only by an open revision, no second copy on main.
- Source independence: changed passages only — the folder has no changed passage, so 0 passages compared with 0 sources; largest share FS as in the earlier reviews; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- The description's generated blocks (`depends-on`, `merge-order`) are outside this check, apart from the membership of the 15 open suppliers in the task list.

## Source issues

- none

## For the human reviewers

- none
