# Review of EnriquesSurfacesAndIntegralNonexistence (pull request #1488 at 4a347b3)

**Verdict:** accepted

Incremental re-review of 6 changed lines since c7e72bb, with the title and description read against this head. No finding.

## Previous findings

- R01 — repaired: the description now reads "Completeness of the fourteen-model rational-Jacobian classification is imported from NeronModelsAndSemistableAbelianVarietiesPartII §7.4; the fourteen-entry Enriques enumeration (§5.1) and the three additional configuration exclusions (§5.7) are separate proof targets here"; the summary block agrees.

## Verified sound

| Statement | Instances tried | Computed values on the two sides | Result; change |
| --- | --- | --- | --- |
| `README.md:3` (Summary): completeness "imported under Exact supplier contracts", exclusions "a proof target of Layer 5" | Owner of each at this head | `README.md:75`: NeronModelsAndSemistableAbelianVarietiesPartII §7.4 supplies completeness; `### 5.7` sits under `## Layer 5` (`README.md:1310`, `:1402`) | Agrees with §5.1 (`:1316`, `:1318`); none |
| `README.md:105` (How to read the build): "imported from a supplier … exclusions of §5.7 … depends on both" | Hypothesis lines of the consumers | 15 targets from §5.8 to §8.7 assume both (e.g. `:1426`, `:1889`); §5.1 assumes completeness only, §5.7 neither | Agrees; none |
| `README.md:1519` (Layer 5 Dependencies): "classification of NeronModelsAndSemistableAbelianVarietiesPartII §7.4" | Supplier's open head | Heading `### 7.4 completeness of the fourteen-model list`; statement: every surface of the §6.1 family over `P¹_F₂` is equivalent to one of fourteen models | Citation resolves, statement is the one consumed; none |
| §5.7, cited by all three changed passages: triples I₂*+E₄+Ĩ₂, I₃*+E₄+Ĩ₁, IV*+E₄+Ĩ₂ | F₂-point count against constant Picard | Fibres: I₂* 7·3−6=15, I₃* 8·3−7=17, IV* 7·3−6=15, E₄ 4, Ĩ₂ 6, Ĩ₁ 4; sums 25, 25, 25; `1+10·2+4 = 25` | Counting does not exclude them, so §5.7 is a real target; none |
| Description, summary block: "three configuration exclusions beyond Schröer's paper, are proof targets; fourteen-model Jacobian completeness comes from NeronModelsAndSemistableAbelianVarietiesPartII" | `README.md:75`, `:1406`, `:1917` | Same owner and same split in all three places | Agrees; none |
| Description: "six supplier extension contracts … SchemeAndStackFoundations (three of them)" | `What … must provide (gap:…)` lines | 6 lines (`README.md:81`–`:99`): SchemeAndStackFoundations 3, the other three suppliers 1 each; slugs equal the six declared gaps | Agrees; none |
| Description: folder contents, imports, "adds a roadmap", reals, `TauCeti.IntegralLattice` and `LineBundleClass` | `ls`; import lines; base comparison; `README.md:17`, `:52`, `:1911` | 3 files; `import Mathlib` plus 5 `TauCeti.*` modules; folder absent on main, 2069 insertions, 0 removals; all three phrases present | Agrees; none |

Rows for the untouched statements stand as in the previous review, of c7e72bb.

- Gate, rerun at this head: every counter 0, `OK`; the worker's run adds `build=0`.
- Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `Suggested.lean`: 4 `declaration uses sorry` warnings (lines 51, 69, 117, 123), 0 errors; no Lean line changed since c7e72bb.
- Diff since c7e72bb: 6 lines in `README.md` (lines 3, 105, 1519), 0 statements, 0 locators; 0 files outside the folder against the base. No seeded-sample target falls in a changed passage.
- Pins: the branch manifest now has Tau Ceti 2fd255d and Mathlib 1b1ccf4, the commits the README names; `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean` lines 63–73 are the five-field `IntegralLattice` structure, as `README.md:52` says.
- Cross-roadmap citations resolved: 1 (NeronModelsAndSemistableAbelianVarietiesPartII §7.4, at its open head). Overlap leads: no other open pull request changes this roadmap, none drops an id it cites, no second copy on main.
- Overlap check: read EnriquesSurfaces, K3SurfacesAndSymplecticBoundedness, NeronModelsAndSemistableAbelianVarietiesPartII; fourteen-model completeness is owned by NeronModelsAndSemistableAbelianVarietiesPartII §7.4 and cited here, nothing has two owners. Ownership against open pull requests without supplied files was not checked.
- Source independence: changed passages only; 3 passages compared with 1 source (SCH23), none shared (they name suppliers and sections, no source statement); largest share SCH23, 99 of 127 locators; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- CDL2021, BM1977 and Fontaine are waived, CD89 and LLR04 uncertified; no locator depending on them changed.
- The description's statement of review rounds ("0 independent review rounds and 2 red-team rounds") and its generated `depends-on` and `merge-order` blocks are outside this check.

## Source issues

- none

## For the human reviewers

- Scope: `README.md:1406` calls §5.7 "a new proof target" beyond SCH23, which lists eleven equations against the roadmap's fourteen (`README.md:1917`); the endpoints §§8.6–8.7 assume both. No refereed source states the three exclusions.
- Not tested: the wording and arrangement were not compared again with SCH23 (99 of 127 locators) this round beyond the three changed passages; earlier rounds' comparison stands.
