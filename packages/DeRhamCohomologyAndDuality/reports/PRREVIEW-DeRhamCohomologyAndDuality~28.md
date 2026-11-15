# Review of DeRhamCohomologyAndDuality (pull request #2085 at df0682f)

**Verdict:** accepted

## Previous findings

The previous review accepted this head with no outstanding findings. Its two recorded repairs remain present:

- R01 — repaired: the title names manifold primitives, relative smooth chains and transversality; the description identifies a revision of main and retains ComplexKahlerGeometry K6.1 as a consumer.
- R02 — repaired: `TauCetiRoadmap/DeRhamCohomologyAndDuality/README.md:1004` lists the integration-comparison inputs; line 1060 lists the boundary formula's Tau Ceti and Mathlib inputs.

## Verified sound

| Statement | Instance | Computed left side | Computed right side | Result | Change |
|---|---|---|---|---|---|
| §5.3 manifold relative perturbation, cited by the PR summary | M = V = ℝ, N a point, f(x) = x, β(x) = x², j = 0 | gₚ(x) = x + px²; zeros 0 and −1/p for p ≠ 0; derivatives 1 and −1 | Bad parameters ∅; μ(∅) = 0. On β⁻¹(0) = {0}, gₚ(0) = f(0) = 0 | Both conclusions hold, including p = 0 | None |

The other adversarial rows stand as in the previous review of df0682f.

- Increment: 0 changed folder lines; 0 outside-folder changes; exact head confirmed as df0682fbc24934e93aa19d069ae18700fbb97123.
- PR text: title, prose and `roadmap-summary` checked against the 1,134 insertions/398 deletions from base; the planar-to-manifold replacement, chain comparison, cocone route, orientation convention and manifold transversality changes are represented.
- Sources: 0 new or changed locators in the seeded sample; no source verification reopened.
- Pinned library: opened Mathlib `Geometry/Manifold/MFDeriv/NormedSpace.lean:786` for the derivative identification in the computed row.
- Roadmap references in the PR text: resolved DifferentialGeometry §§8.3–8.5, AlgebraicTopology §6.3 and ComplexKahlerGeometry K6.1 on main; the last explicitly consumes this roadmap's §§2.4, 3.1–3.3 and 4.1.
- Gate: all 28 reported checks returned 0, exit 0; the worker additionally records `build=0`. Independent targeted build succeeded.
- Dependency output: `depcheck: 244 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD or CYCLE.
- Elaboration: original file and scratch `#check @` copy both exit 0, only six `sorry` warnings; all 13 signatures inspected, no needed binder lost. The unused scalar-space binders of `incidenceEquation` are unnecessary for subtraction.

Overlap check: read main scopes of DifferentialGeometry, AlgebraicTopology, ComplexKahlerGeometry, TangentialBordism and MorseNovikov from the three closest-roadmap lists. Absolute de Rham theory belongs to DifferentialGeometry; fundamental classes to AlgebraicTopology/Tau Ceti; relative de Rham integration to this roadmap; complex-coefficient comparison to ComplexKahlerGeometry; geometric transversality extensions to TangentialBordism; Novikov complexes to MorseNovikov. No changed ownership to audit; supplied overlaps report no conflicts or dropped citations.

Source independence: changed passages only; 0 passages compared with 0 sources because the folder diff is empty. Largest share: lee, 10 of 14 bracketed source-citation groups. No layer was added, removed or reordered since df0682f, so arrangement was not rechecked. Lee and Bott–Tu remain uncertified.

## Not verifiable

- `lee` and `bott-tu`: settled as uncertified; their texts were not reopened or requested.
- Closest open revisions without supplied checkouts: their scopes were not independently checked; the supplied overlap report and the main scopes were read.

## Source issues

- none

## For the human reviewers

- Not tested: `lee` has the largest citation share; its text and contents remain unavailable under the settled uncertified status. Wording and arrangement against it were not independently tested this round; `bott-tu` is likewise uncertified.
