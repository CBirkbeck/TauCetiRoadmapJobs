# Review of RelativeFarguesFontaine (pull request #1209 at d58cce9)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since `d58cce9`. The folder is unchanged and stands as accepted there; both findings are about the pull request's description, which no longer matches the head.

## R01 (P3) — The description's dependency paragraph names one supplier; the head has six that are not on main

**Location:** pull request description, paragraph "Dependencies": "By section, the README uses: AInfCohomology: the integral period-ring and Breuil–Kisin–Fargues inputs the boundary charts use. […] everything else named in the README is a consumer, not a prerequisite."

**Claim:** The head contradicts this. The README's supplier contracts consume five further roadmaps that are not on main, and the AInfCohomology clause does not describe what the README takes from it. The description's own `depends-on` block lists all six.

**Witness:** `TauCetiRoadmap/RelativeFarguesFontaine/README.md:127–129` (DeformationAndDerivedPatchingAlgebra §1.10), `:91` (FarguesFontaineDiamonds F4), `:133–141` (VectorBundlesAndIsocrystals Layers 5–6), `:137` (PadicHodgeTheory §0.2, PadicPeriodRings §§1.5, 4.1, 4.3), `:17` (AInfCohomology §§AI.2.1, AI.2.3).

**Repair:** Replace the paragraph's second and third sentences by: "By section, the README uses, from roadmaps not yet on main: VectorBundlesAndIsocrystals Layers 0–6 (coefficients, annuli, curve, generic divisors, twists, section charts, integral Frobenius and the ℤ_p torsor dictionary); DeformationAndDerivedPatchingAlgebra §1.10 (the faithfully flat complete residue extension behind §0.23); AInfCohomology §§AI.2.1 and AI.2.3 (regular-completion patching, punctured-spectrum triviality, no-leg descent and `BKF.reconstruct`); PadicHodgeTheory §0.2 and §5.5 (affinoid de Rham ring and filtration, field torsor dictionary); PadicPeriodRings §§1.5, 4.1 and 4.3 (geometric de Rham ring and fundamental sequence); FarguesFontaineDiamonds F4 (fixed-field ℚ_p Cartier divisor and marked-untilt comparison). Roadmaps on main are cited by name. BunGAndNewtonStrata, GeometricSatakeAndFusion and the Hecke and local-shtuka roadmaps are consumers, not prerequisites."

## R02 (P3) — "red-team passes to follow" is contradicted by the head's history

**Location:** pull request description, paragraph "Validation": "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package, with author-side red-team passes to follow."

**Claim:** The passes are no longer to follow: the head contains their repairs, and three later rounds of review repairs that the description does not mention.

**Witness:** `git log` at `d58cce9`: `b61b51d0` "red-team repairs (uniformizer-root descent and principal Cartier neighborhoods)", then `95b48551`, `956b64bc`, `d58cce9d` "review repairs".

**Repair:** Replace the clause by: "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package; author-side red-team repairs and three rounds of review repairs are included in this head."

## Previous findings

- none: the previous report (`PRREVIEW-RelativeFarguesFontaine~4`, of this same head) has no finding to account for; its only earlier finding (R01, the residue-extension ownership) was recorded there as repaired.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `ramifiedDworkCriterion` (§0.2; cited by the description's summary) | `O = A = ℤ_p`, `π = q = p`, `σ = id`; `x = (1,0,…)`, `x = (0,1,0,…)`, `y = (0,1,0,…)`; exponent `n − i` | `x=(1,0,…)`: ghost `(1,1,…)`, differences 0. `x=(0,1,0,…)`: ghost `(0,p,p,…)`, `p ∣ p`, `p² ∣ 0`. `y=(0,1,…)`: `p ∤ 1`, and `x₀^p + p·x₁ = 1` with `x₀ = 0` has no solution. `i ≤ n` in the sum, so no truncated subtraction. | both directions agree | none |
| Description summary: "ties the divisor completions to Mathlib's `PreTilt`, `WittVector.fontaineTheta` and `BDeRhamPlus`" | pinned Mathlib; README `:99` | `PreTilt` at `Mathlib/RingTheory/Perfection.lean:633`; `fontaineTheta` at `Mathlib/RingTheory/Perfectoid/FontaineTheta.lean:165`; `BDeRhamPlus` at `Mathlib/RingTheory/Perfectoid/BDeRham.lean:75`; all three in the README's Mathlib contract | present | none |
| Description summary: "rooting π alone breaks the boundary norm" | README `:700`, `|π| = |[ϖ]| = r`, `0 < r < 1` | whole ratio: `|s_m| = (r/r)^(1/p^m) = 1`; numerator only: `r^(1/p^m) / r = r^(1/p^m − 1) > 1` since the exponent is negative | agrees with the README | none |
| Description: "Roadmap folder … (README, `Suggested.lean`, `metadata.toml`)"; 25 declarations | diff against `origin/main` | 3 files, 3217 insertions, 0 deletions; nothing changed outside the folder; roadmap absent from main | agrees | none |

The rows of the previous review for the folder's statements stand as in the previous review, of `d58cce9`; no statement changed.

- Description sentences checked against the head: title against the README heading (equal); the three summary paragraphs (Dwork, Teichmüller and Cohen lifts §§0.2, 0.12, 0.23; `Div^d` and completions, Layer 3; glueing pairs "not assumed fpqc and no noetherian hypothesis", README `:79`; the consumers named at README `:2822`); the dependency and validation paragraphs (R01, R02).
- Supplier status resolved: AInfCohomology, DeformationAndDerivedPatchingAlgebra, FarguesFontaineDiamonds, PadicHodgeTheory, PadicPeriodRings and VectorBundlesAndIsocrystals are absent from main; DiamondsAndVStacks, DerivedModuleAlgebra, PerfectoidSpaces, AdicSpacesPartII–III, ReductiveGroups and SchemeAndStackFoundations are on main; LocalFieldsRamification is under `Completed/`.
- Gate rerun at `d58cce9`: every counter zero, `OK` (including `statement-hygiene=0`, `depcheck=0`, `outside-folder=0`).
- Dependency check: `depcheck: 245 roadmaps, 2238 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration of `TauCetiRoadmap/RelativeFarguesFontaine/Suggested.lean` with `lake env lean`: 14 `declaration uses sorry` warnings, nothing else.
- Source locators: none rechecked (no passage changed); the seeded sample falls in no changed passage.
- Overlap check: the overlap listing reports no other pull request changing this roadmap, no dropped id and no revision-only id; the scopes of FarguesFontaineDiamonds, VectorBundlesAndIsocrystals and RelativeFarguesFontainePartII were not reread this round and stand as in the previous review.
- Source independence: changed passages only; 0 passages compared, since the folder did not change; arrangement not compared again (no layer added, removed or reordered); locator shares not recounted.

## Not verifiable

- The description's claim that the port came "from the accepted explorer package": the package is not among the files of this review.
- The generated `depends-on` and `merge-order` blocks are outside the check of the text; their pull-request numbers were not resolved.

## Source issues

- none

## For the human reviewers

- **Licence.** The References cite author-hosted copies (Fargues–Scholze, Scholze–Weinstein, Fargues–Fontaine, Fargues, Scholze, Deligne–Milne). The previous report noted that the Fargues–Scholze URL had served an edition with a different page count from the one the README records.
