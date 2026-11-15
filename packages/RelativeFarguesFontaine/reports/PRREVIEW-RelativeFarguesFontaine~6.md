# Review of RelativeFarguesFontaine (pull request #1209 at 068d2af)

**Verdict:** accepted

Incremental re-review of 0 changed lines since `d58cce9`. The folder is unchanged; this round read the pull request's title and description against the head. No finding.

## Previous findings

- R01 — repaired: the description now reads "By section, the README uses, from roadmaps not yet on main:" and lists VectorBundlesAndIsocrystals, PadicHodgeTheory, PadicPeriodRings, AInfCohomology, DeformationAndDerivedPatchingAlgebra and FarguesFontaineDiamonds, each with its sections.
- R02 — repaired: "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package and the author-side red-team repairs; Claude, through Claude Code, for the review repairs."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `ramifiedDworkCriterion` (§0.2; named in the description's summary) | `O = A = ℤ_p`, `π = q = p`, `σ = id`; `x = (1,0,…)`, `(0,1,0,…)`; `p = 2`, `x = (1,1,0,…)`; `y = (0,1,0,…)` | ghosts `(1,1,…)`: differences 0; `(0,p,p,…)`: `p ∣ p`, `p² ∣ 0`; `(1,3,3)`: `2 ∣ 2`, `4 ∣ 0`; `y`: `p ∤ 1`, and `x₀ = 0`, `p·x₁ = 1` unsolvable | both directions agree | none |
| Description: sections used from the six suppliers not on main | every `<Supplier> Layer/§` citation of the README, tallied | VectorBundlesAndIsocrystals Layers 0, 1, 2, 3, 5, 6 only (Layer 4 named in scope, not consumed); PadicHodgeTheory §§0.2, 5.5, 7.5, 7.6; PadicPeriodRings §§1.5, 4.1, 4.3; AInfCohomology §§AI.2.1, AI.2.3; DeformationAndDerivedPatchingAlgebra §1.10; FarguesFontaineDiamonds F4 | equals the description's list | none |
| Description: "its only `sorry`s are the proofs of its 14 headline theorems … no `set_option` and no sorry'd data" | `TauCetiRoadmap/RelativeFarguesFontaine/Suggested.lean` | 14 `theorem`, 14 `sorry`, 14 `declaration uses sorry` warnings on elaboration; gate `set_option=0 sorry-data=0`; one import, `import Mathlib` | agrees | none |
| Description: "Roadmap folder … (README, `Suggested.lean`, `metadata.toml`)"; adds a roadmap | diff against `origin/main` | 3 files, 3217 insertions, 0 deletions; folder absent from main; no file changed outside the folder | agrees | none |

The rows of the previous review for the folder's statements stand as in the previous review, of `d58cce9`; no statement changed.

- Description sentences checked against the head: the title (equal to the README heading), the three summary paragraphs, the dependency list (six suppliers, each gloss compared with the README's supplier contracts at README `:15`, `:17`, `:137`, `:141`, `:238`), the consumer sentence (README `:2822`), the validation paragraph.
- Supplier status resolved: the six listed suppliers are absent from main and each is an open new-roadmap pull request; DiamondsAndVStacks, DerivedModuleAlgebra, PerfectoidSpaces, AdicSpacesPartII–III, ReductiveGroups and SchemeAndStackFoundations are on main; LocalFieldsRamification is under `Completed/`.
- Cross-roadmap sections resolved at the open heads, 13 headings: AInfCohomology AI.2.1, AI.2.3; DeformationAndDerivedPatchingAlgebra 1.10; FarguesFontaineDiamonds Layer F4; PadicHodgeTheory 0.2, 5.5, 7.5, 7.6; PadicPeriodRings 1.5, 4.1, 4.3; VectorBundlesAndIsocrystals Layers 0–6, and 12 of its quoted target titles, each in the layer cited.
- Remark (untouched text, no change asked): the backticked supplier names `AInf.linear_module_patching`, `AInf.punctured_spectrum_triviality`, `AInf.integral_robba_frobenius_descent`, `AInf.analytic_vector_bundle_extension` and `BKF.reconstruct_*` do not occur in AInfCohomology's README or `Suggested.lean` at its open head; §§AI.2.1 and AI.2.3 state the content under titled targets.
- Remark (untouched text, no change asked): likewise `relativePeriodSheaf`, `RelativeBPair`, `relativePeriodDerivedComparison`, `tensorIsomTorsor` and `bdRPlusAffinoid` do not occur in PadicHodgeTheory at its open head; its §§0.2, 5.5, 7.5 and 7.6 state the content, §§7.5–7.6 by reference to PhiGammaModulesAndIwasawaCohomology §§1.0b–1.0c.
- Gate rerun at `068d2af`: every counter zero, `OK` (including `statement-hygiene=0`, `depcheck=0`, `outside-folder=0`, `stray-files=0`). Dependency check: `depcheck: 245 roadmaps, 2238 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Source locators: none rechecked (no passage changed); the seeded sample falls in no changed passage.
- Overlap check: the overlap listing reports no other pull request changing this roadmap, no dropped id and no revision-only id; the scopes of FarguesFontaineDiamonds, VectorBundlesAndIsocrystals and RelativeFarguesFontainePartII were not reread this round and stand as in the review of `d58cce9`.
- Source independence: changed passages only; 0 passages compared, since the folder did not change; arrangement not compared again (no layer added, removed or reordered); locator shares not recounted.

## Not verifiable

- The description's claim that the port came "from the accepted explorer package", and which assistant made which repair: neither the package nor the sessions are among the files of this review.
- The generated `depends-on` and `merge-order` blocks are outside the check of the text; their pull-request numbers were compared only with the open-pull-request listing for the six suppliers (#940, #964, #1034, #1044, #1062, #1205: all match).

## Source issues

- none

## For the human reviewers

- **Licence.** The References cite author-hosted copies (Fargues–Scholze, Scholze–Weinstein, Fargues–Fontaine, Fargues, Scholze, Deligne–Milne). An earlier report noted that the Fargues–Scholze URL had served an edition with a different page count from the one the README records.
