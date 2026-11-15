# Review of EnriquesSurfacesAndIntegralNonexistence (pull request #1488 at c7e72bb)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since c7e72bb; this round reads the pull request's title and description against the head. One P3 finding, in the description only: no file in the folder needs a change.

## R01 (P3) — The description presents the fourteen-case Jacobian classification as this roadmap's proof target

**Location:** pull request description, second prose paragraph: "The fourteen-case Jacobian classification and the three additional Enriques configuration exclusions remain explicit, separate proof targets." Also the summary block (`<!-- roadmap-summary -->`): "the fourteen-case classification beyond Schröer's paper, are proof targets", followed by "every target is in the README".

**Claim:** At this head the Jacobian classification is not a target of this roadmap: it is imported from a supplier. Only the Enriques enumeration built on it (§5.1) and the three exclusions (§5.7) are targets here. The description names no owner for it.

**Witness:** `TauCetiRoadmap/EnriquesSurfacesAndIntegralNonexistence/README.md:75`: NeronModelsAndSemistableAbelianVarietiesPartII "§7.4 supplies completeness of the fourteen-model rational-elliptic classification … imported rather than constructed here"; `README.md:1318`: "Proving completeness is a separate supplier obligation". The supplier's open head has `### 7.4 completeness of the fourteen-model list`.

**Repair:** Replace the paragraph's last sentence by: "Completeness of the fourteen-model rational-Jacobian classification is imported from NeronModelsAndSemistableAbelianVarietiesPartII §7.4; the fourteen-entry Enriques enumeration (§5.1) and the three additional configuration exclusions (§5.7) are separate proof targets here." In the summary block, replace "and the fourteen-case classification beyond Schröer's paper, are proof targets" by "and the three configuration exclusions beyond Schröer's paper, are proof targets; the fourteen-model Jacobian classification is imported from NeronModelsAndSemistableAbelianVarietiesPartII §7.4".

## Previous findings

- none — the previous report (of c7e72bb, the same head) was an acceptance with no finding of its own. Its two carried items stand unchanged: `README.md:52` still reads "Basic.lean lines 63–73"; the manifest-pin question stays settled, with no folder change.

## Verified sound

| Statement | Instances tried | Computed values on the two sides | Result; change |
| --- | --- | --- | --- |
| Description: "fourteen-case Jacobian classification … proof targets" versus README §5.1 and line 75 (R01) | Owner of completeness at this head and at e3096fd; SCH23 count; the three extra rows | README:75 and :1318: supplier §7.4 at both commits; SCH23 lines 111, 1242: eleven equations; extra rows 15+4+6, 17+4+4, 15+4+6, each 25 = 1+10·2+4 | The three rows pass the count, so §5.7 is a real target here; completeness is the supplier's. R01 |
| Description: "six supplier extensions" | `What … must provide (gap:…)` lines | 6, at README:81, 91, 93, 95, 97, 99; slugs equal the six declared gaps | Agrees; none |
| Description: "four unit square classes of ℤ[1/2]" | Units ±2ⁿ modulo squares | {1, −1, 2, −2}: 4 classes; README §3.5 uses the same four | Agrees; none |
| Description: "over other fields, such as the reals"; "usable separately" | README:1911 | Same three reusable items (numerical-descent adapters, canonical-cover comparison, deformation statements) and the reals as the example | Agrees; none |
| Description: folder contents, Lean imports, validation line | `ls`; import lines; gate; outside-folder diff | 3 files (README, `Suggested.lean`, `metadata.toml`); `import Mathlib` plus 5 `TauCeti.*` modules, 0 roadmap modules; 0 gate failures; 0 outside paths | Agrees; none |
| Title and "adds a roadmap" | Worker's base comparison | Folder absent on main; 2069 insertions, 0 deletions; 0 headings and 0 Lean declarations removed | Title "roadmap" and the prose describe an addition; none |
| Lean form at this head | `lake env lean` on `Suggested.lean` | 4 `declaration uses sorry` warnings (lines 51, 69, 117, 123), 0 errors; 10 declarations, 0 lost binders in the worker's signature listing | Unchanged; none |

Rows for the untouched statements stand as in the previous review, of c7e72bb.

- Gate, rerun at this head: every counter 0, `OK` (the worker's run adds `build=0`).
- Dependency check: `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Diff since c7e72bb: 0 lines in the folder, 0 files outside it; no statement, locator or citation changed, so no seeded-sample target falls in a changed passage.
- Source lines opened: 3 (SCH23 lines 111, 1242, 1451). Supplier sections resolved: 1 (NeronModelsAndSemistableAbelianVarietiesPartII §7.4, at its open head).
- Overlap leads: no other open pull request changes this roadmap, none drops an id it cites, no second copy on main.
- Overlap check: read EnriquesSurfaces, K3SurfacesAndSymplecticBoundedness, NeronModelsAndSemistableAbelianVarietiesPartII (scope as cited at README:9, :19–20, :74–75); fourteen-model completeness and the genus-one carrier are owned by NeronModelsAndSemistableAbelianVarietiesPartII, the Jacobian comparisons by K3SurfacesAndSymplecticBoundedness §6.0b, the characteristic-not-two core by EnriquesSurfaces; nothing has two owners. Ownership against open pull requests without supplied files was not checked.
- Source independence: changed passages only; 0 passages changed, so 0 compared; largest share SCH23, 99 of 127 locators; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- Elaboration at the pins the README names (Mathlib 1b1ccf4, Tau Ceti 2fd255d) was not run: Lean runs only from this worktree, at the branch manifest's pins. As in the previous review.
- CDL2021, BM1977 and Fontaine are waived, CD89 and LLR04 uncertified; no locator depending on them changed.
- The generated `depends-on` and `merge-order` blocks of the description are outside this check.

## Source issues

- none

## For the human reviewers

- Scope: `README.md:1406` calls §5.7 "a new proof target" beyond SCH23, which lists eleven equations (SCH23 lines 111, 1242) against the roadmap's fourteen; the endpoints §§8.6–8.7 assume both. No refereed source states the three exclusions.
- Not tested: the wording and arrangement were not compared again with SCH23 (99 of 127 locators) this round, since no passage changed; earlier rounds' comparison stands.
