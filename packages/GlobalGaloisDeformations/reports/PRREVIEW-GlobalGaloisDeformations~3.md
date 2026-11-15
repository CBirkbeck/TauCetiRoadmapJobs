# Review of GlobalGaloisDeformations (pull request #920 at c3a764e)

**Verdict:** needs changes

## R01 (P3) — Supplier links still use nonexistent fragments

**Location:** `TauCetiRoadmap/GlobalGaloisDeformations/README.md:423`, “[LocalGaloisDeformationRings §F.3.1](../LocalGaloisDeformationRings/README.md#local-deformation-problem)”; 65 links use 18 nonexistent fragments.
**Claim:** The links navigate to the named supplier sections.
**Witness:** At #923, `TauCetiRoadmap/LocalGaloisDeformationRings/README.md:963` reads “### F.3.1 Local deformation problems”, whose fragment is `#f31-local-deformation-problems`. No explicit anchors exist; none of the 18 cited fragments matches a heading.
**Repair:** Replace all 65 links with their existing section labels as plain text, e.g. “LocalGaloisDeformationRings §F.3.1”. All 18 section numbers resolve. Alternatively, replace every fragment with its numbered heading fragment.

## Previous findings

- R01 — not repaired: `README.md:423` still uses `#local-deformation-problem`; all 65 links retain the nonexistent fragments. The previous report’s accepted label does not remove its numbered finding.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §3.3 framed local restriction, cited beside R01 | A = ℤ/25; ρ(g) = [[1,1],[0,1]], α = [[1,0],[5,1]], β = diag(6,21); α, β reduce to I | α⁻¹ρ(g)α = [[6,1],[0,21]]; (βα)⁻¹(βρ(g)β⁻¹)(βα) = [[6,1],[0,21]]. Raw restrictions differ: upper-right entries 1 and 11. | Invariant representative agrees; raw matrix fails invariance | None |
| R01 supplier navigation | 65 links; 18 distinct fragments; 18 section labels | Heading/explicit-anchor matches: 0/65; section-label matches: 18/18; corrected sample fragment matches: 1/1 | Broken fragments, valid section numbers | Replace fragments or use plain section citations |

The untouched mathematical rows stand as in the previous review of `c3a764e`.

- Change: 0 folder lines since the previous head; 0 changes outside the folder; PR adds 3 files and 2297 lines against its base.
- PR text: title, summary block and prose checked against the added folder, ownership, headline declarations and supplier contracts; 0 additional findings.
- Sources: 0 changed mathematical passages or locators; no seeded target fell in a changed passage, so the previous source checks were not repeated.
- Citations: all 18 section numbers affected by R01 resolve at LocalGaloisDeformationRings #923; 65 fragments fail. Scope/ownership read in 6 closest roadmaps.
- Gate: all checks pass; targeted build succeeds; direct `lake env lean` succeeds with only the 2 expected `sorry` warnings.
- Signatures: scratch `#check @name` elaboration succeeds for all 3 declarations; residue-field finiteness/characteristic and finite-dimensionality binders match §§4.10 and 5.6; 0 lost hypotheses.

Dependency-check output:

```text
depcheck: 245 roadmaps, 2216 edges, 0 problem(s)
```

Overlap check: read LocalGaloisDeformationRings, PotentialAutomorphyInfrastructurePartII, GL2ModularityLifting, OrdinaryAutomorphicFormsAndModularityLiftingPartII, PotentialModularityAndCompatibleSystems and AutomorphyLiftingBeyondTaylorWiles; local interfaces belong to LocalGaloisDeformationRings, global presentations and finite-level deformation rings to GlobalGaloisDeformations, and their automorphic modules/patching applications to the respective consumers; the weight-algebra extensions belong to OrdinaryAutomorphicFormsAndModularityLiftingPartII. No overlap introduced by this 0-line change.

Source independence: changed passages only; 0 passages compared with 0 sources, because no roadmap wording or Lean changed. No layers were added, removed or reordered; the source-share and arrangement comparisons were not reopened.

## Not verifiable

- none within the incremental scope.

## Source issues

- none

## For the human reviewers

- none
