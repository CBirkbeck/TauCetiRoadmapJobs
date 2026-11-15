# Review of AdicSpacesPartV (pull request #2133 at 28193cd)

**Verdict:** accepted

Incremental re-review of 0 changed lines since `28193cd`: the folder is unchanged, and this round reads the pull request's title and description, as they stand now, against this head. No finding.

## Previous findings

- R01 — repaired: the description now reads "Three roadmaps that are not on main are named without being prerequisites: … DiamondsAndVStacks D6.9 and LieGroupoidsPoisson G0.1, both on main, are cited there for comparison only as well."

## Verified sound

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| Description: "Three roadmaps that are not on main"; "Every supplier is a roadmap on main" | every roadmap name in the README, against main at `4d169a9` and the open-pull-request index | Not on main: AdmissiblePairsAndPadicHodgeStructures, ClassicalAdicEtaleCohomologyPartII, AbelianSchemesAndArithmeticModuliPartII = 3, all open. On main: DiamondsAndVStacks, LieGroupoidsPoisson and the 9 suppliers | true |
| Description: five supplier gaps, three §0.5 lemmas, §7.0 composition | README lines 100, 108, 122, 140, 156; line 16; lines 280–282 | 5 "must provide" sentences with the 5 slugs, suppliers and sections as described; line 16 names the same three lemmas; composition cited to §7.0 | true |
| `gaussPoint_mem_closure_rationalPoints` (cited by the description as the first Lean headline) | K = ℚ₂, n = 1, f = T(T − 1); n = 0 | Gauss norm of f is 1; ‖f(a)‖ ≤ 1/2 for every a ∈ ℤ₂, so {‖f‖ ≥ 1} contains η and no rational point: fails, and `Infinite` (residue field) excludes it. n = 0: one evaluation point, equal to η | true with the hypothesis |
| `analytic_germ_eq_zero_of_subfield` (third Lean headline; description: "without completeness or characteristic restrictions") | m = 0; E = ℚ ⊆ C = ℚ_p, f = z; E with discrete topology | m = 0: hypothesis is f(0) = 0, conclusion the same. f = z: f(x) = x ≠ 0 for x = pⁿ → 0, hypothesis fails. Discrete E: 𝓝 0 = {0}, f = z would refute; excluded by `NontriviallyNormedField E` | true |

The rows for untouched statements stand as in the previous review, of `28193cd`.

- **Title and description against the head:** title "AdicSpacesPartV: roadmap" fits a pull request that adds the folder (1236 insertions, 0 deletions, 67 headings added, none removed). Summary block and prose checked sentence by sentence: series position and where AdicSpacesPartII stops (README line 7); end theorems (line 3); Bartenwerfer's route under ordinary normality (line 449); every complete nontrivially normed characteristic-zero field for group atlases (line 17); D6.9, G0.1 and B2.10 as comparison only (lines 16, 18); consumers (lines 1069–1073); three Lean headlines on the named carriers (`Suggested.lean` lines 76, 97, 131). No sentence is contradicted and no change is left unstated.
- **Citations resolved (3):** DiamondsAndVStacks D6.9 on main (line 9495); LieGroupoidsPoisson G0.1 on main (line 299); AbelianSchemesAndArithmeticModuliPartII B2.10 at its open head (line 1612).
- **Gate:** rerun at this head, every scanner 0, ending `outside-folder=0 source-material=0 OK`; the worker's gate adds `build=0`. Dependency check: `depcheck: 244 roadmaps, 2206 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. The diff outside the folder is empty.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives three `declaration uses sorry` warnings (lines 76, 97, 131) and nothing else. The file is unchanged, so the `#check @` comparison and the one-tactic probe of the earlier reviews stand.
- **Overlaps:** `scratch/overlaps.md` reports no other pull request changing this folder, no dropped id, no revision-only id and no second copy; its third closest-roadmap list (results and headings) is empty.
- Source independence: changed passages only: 0 passages changed, so 0 compared; largest share HK2, 19 of 68 line locators; arrangement not re-compared (no layer added, removed or reordered).
- **Declared gaps:** the five slugs are unchanged and are declared in the README under their suppliers; the acceptance is conditional on them.
- **Seeded sample:** every sampled target lies in untouched text, read by the earlier reviews; none re-read this round.

Overlap check: read AdicSpacesPartIV, ResolutionOfSingularitiesCharacteristicZero, AdicSpacesPartII, RigidAnalyticGeometry, ClassicalAdicEtaleCohomology, ClassicalAdicEtaleCohomologyPartII, AdicCoefficientsAndComparisonsPartII; nothing shared. Objects that touch: affinoid algebra, canonical reduction, subdomains and the classical identity principle — owner RigidAnalyticGeometry, cited (README lines 75, 187, 215, 234); R0–R1 — owner AdicSpacesPartII, cited (line 7); scheme resolution and composition of regular maps — owner ResolutionOfSingularitiesCharacteristicZero §§7.0, 7.5–7.6, cited; étale sites and dagger geometry — owner AdicSpacesPartIV; connectedness under extension of an algebraically closed base — owner ClassicalAdicEtaleCohomology, not stated here; scheme alterations and normalization — AdicCoefficientsAndComparisonsPartII and SchemeAndStackFoundations, not stated here.

## Not verifiable

- SCHNEIDER11, BARTENWERFER76 and LUTKEBOHMERT74 are recorded as uncertified and were not read.
- The description's sentence on the number of review and red-team rounds describes the process, not the head; it was not checked.

## Source issues

- none

## For the human reviewers

- none
