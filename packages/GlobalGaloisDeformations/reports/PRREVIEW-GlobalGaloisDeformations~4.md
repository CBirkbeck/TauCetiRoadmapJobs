# Review of GlobalGaloisDeformations (pull request #920 at 373d2c5)

**Verdict:** accepted

## Previous findings

- R01 — repaired: `TauCetiRoadmap/GlobalGaloisDeformations/README.md:423` now uses “LocalGaloisDeformationRings §F.3.1”; all 65 broken fragment links became plain citations, preserving their labels. All 18 distinct cited sections resolve at #923.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §3.3 framed restriction, using the changed §F.1.6 citation | A = ℤ/9; M = [[1,1],[0,1]], α = [[1,0],[3,1]], β = diag(4,7); α, β reduce to I | α⁻¹Mα = [[4,1],[0,7]]; (βα)⁻¹(βMβ⁻¹)(βα) = [[4,1],[0,7]]. Raw upper-right entries: 1 versus 7. | Framed representatives agree; raw matrices distinguish the wrong convention | None |
| R01 supplier citations | 65 link replacements, 18 distinct section numbers | 18/18 headings resolve; 65/65 labels preserved; 0 fragment links remain; link-stripped old README equals the head byte-for-byte | Repair complete | Plain section citations |

The untouched mathematical rows stand as in the previous review of `c3a764e`.

- Diff: 102 changed lines, solely link removal; 0 changed mathematical statements, source locators, layers or Lean declarations.
- PR text: title, `roadmap-summary` and prose checked against the 3-file, 2297-line addition, headline targets and supplier contracts; 0 discrepancies.
- Scope: 0 changes outside the folder against `origin/main...HEAD`; the between-head outside changes come from merging main.
- Citations: 65 affected occurrences resolved to 18 sections of LocalGaloisDeformationRings #923; their coefficient, framing, representability and local-condition contracts inspected.
- Sources: 0 source passages changed; seeded targets intersect only in supplier-link formatting, so no source-locator verification was reopened.
- Pins: 2 declarations opened, `Matrix.GeneralLinearGroup.scalar` and `map`, in `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:55` and `:188`.
- Gate and targeted build pass; direct elaboration has only 2 `sorry` warnings. The build also reports the existing Mathlib module-system warning.
- Signatures: scratch `#check @name` succeeds for all 3 declarations; §§4.10 and 5.6 retain locality, residue-field finiteness/characteristic and finite-dimensionality; 0 lost binders.

Dependency-check output:

```text
depcheck: 245 roadmaps, 2216 edges, 0 problem(s)
```

Overlap check: read LocalGaloisDeformationRings, PotentialAutomorphyInfrastructurePartII, GL2ModularityLifting, OrdinaryAutomorphicFormsAndModularityLiftingPartII, PotentialModularityAndCompatibleSystems and AutomorphyLiftingBeyondTaylorWiles; generic/local deformation interfaces belong to LocalGaloisDeformationRings, global presentations and finite-level deformation rings to GlobalGaloisDeformations, automorphic and patching applications to the consumers, and weight-algebra extensions to OrdinaryAutomorphicFormsAndModularityLiftingPartII. No ownership change in this diff.

Source independence: changed passages only; 0 mathematical prose passages compared with 0 external sources because all 65 edits only remove Markdown link destinations. No source wording, examples or material were added; no layers were added, removed or reordered, so the previous source-share and arrangement checks stand.

## Not verifiable

- none within the incremental scope.

## Source issues

- none

## For the human reviewers

- none

