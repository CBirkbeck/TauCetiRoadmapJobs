# Review of AbelianSchemesAndArithmeticModuli (pull request #849 at 4ed5f32)

**Verdict:** accepted

## Previous findings

- R01 — repaired: the description names ten cited roadmaps on main and points to the README's Downstream consumers section; all ten names occur in the README and have folders on main.
- R02 — repaired: “This pull request adds a new roadmap folder” and “JacobianChallenge on main is cited, not revised” agree with three added files, 4471 insertions, and no changes outside the folder.

## Verified sound

| Statement | Instances tried | Values on the two sides | Result | Change |
|---|---|---|---|---|
| Summary's degree-polynomial construction; `exists_charpoly`, A6.10 | Elliptic curve over ℂ, α = [3], r = 0, 1, 3 | P = X² − 6X + 9; P(r) = (9, 4, 0); deg([3 − r]) = (9, 4, 0) | Equal, including the non-isogeny at r = 3 | none |
| Summary's `charpolyTate`; A6.11 | Same curve and α; ℓ = 2 and 3 | Tate matrix 3I₂; det(XI₂ − 3I₂) = X² − 6X + 9 = P mapped to ℤ_ℓ[X] | Equal for both invertible primes | none |

Untouched-statement rows stand as in the previous review of `4ed5f32`.

- Change counts: 0 folder lines since `4ed5f32`; 0 outside-folder changes; 0 removed headings or declarations against the base; the new-folder description matches the diff.
- Text check: title, all three `roadmap-summary` paragraphs, and all three prose paragraphs agree with the head's summary, ownership, declarations and downstream consumers; both previous findings repaired.
- Supplier names: 10 of 10 names in the repaired paragraph resolve on main and occur in `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md`; imports are Mathlib plus five Tau Ceti modules, with no roadmap import.
- Source sample: 0 changed targets or locators; the seeded sample has no member in the empty folder diff. No source locator or pinned declaration needed reopening for the description repairs.
- Gate: all 28 reported checks returned 0, `OK`; the worker's gate additionally reports `build=0 OK`.
- Dependency-check output: `depcheck: 245 roadmaps, 2215 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Direct elaboration: exit 0, 21 `declaration uses sorry` warnings only. Targeted build: success; it also replayed the Mathlib module-system advisory on the untouched import.

Overlap check: read JacobianChallengePartII, PELModuli, FaltingsFinitenessAndIsogenyTheorems, FiniteFlatGroupsAndIntegralPadicHodgeTheory and NeronModelsAndSemistableAbelianVarieties (open), and JacobianChallenge, ModularCurves and SchemeAndStackFoundations (main). General abelian schemes, their realizations and relative extension belong here; relative curve Jacobians belong to JacobianChallengePartII, PEL moduli to PELModuli, arithmetic finiteness to FaltingsFinitenessAndIsogenyTheorems, integral classification to FiniteFlatGroupsAndIntegralPadicHodgeTheory, and Néron models to NeronModelsAndSemistableAbelianVarieties. Field Jacobians, elliptic theory and general scheme/stack foundations remain with their named main suppliers. No overlap change affects the repairs.

Source independence: changed passages only; 0 changed folder passages, 0 source comparisons. No layer was added, removed or reordered since `4ed5f32`; source shares and arrangement were not reassessed.

## Not verifiable

- Source access limitations recorded by the previous review remain: faltings-chai I.5 p. 25 and I.1.6 p. 4; blr; messing; bbm; chai-conrad-oort §1.7.4. No changed passage requires reopening them.

## Source issues

- none

## For the human reviewers

- none
