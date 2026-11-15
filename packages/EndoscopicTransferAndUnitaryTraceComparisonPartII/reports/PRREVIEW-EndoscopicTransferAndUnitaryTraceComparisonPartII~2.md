# Review of EndoscopicTransferAndUnitaryTraceComparisonPartII (pull request #2256 at b6cbd63)

**Verdict:** accepted

Incremental re-review: the folder has 0 changed lines since the review of `b6cbd63`; this round read the pull request's title and description against the head.

## Previous findings

- none: the review of `b6cbd63` raised no finding.

## Verified sound

| Statement | Instances tried | Computed left side | Computed right side / negative control | Result |
|---|---|---|---|---|
| §2.2 base change by `Z_i↦T_i²` (description: "Hermitian spherical functions … through quadratic base change") | n=2; q=2, 3 | Sat_E(T₁₀)=q(Z₁+Z₂) ↦ q(T₁²+T₂²) | Sat_F(T₂₀)=q(T₁+T₂)²−(q+1)T₁T₂, so BC(T₁₀)=T₂₀−(q−1)T₁₁: T₂₀−T₁₁, T₂₀−2T₁₁ | Equal; odd-entry support present |
| §4.10 transfer factor at residue characteristic two (description: "including residue characteristic two") | a=b=1; D=π; q=2 | η(π)·|π|_F=(−1)(1/2)=−1/2 | Unit target value 1 requires κ-sum −2; |π|_E=q⁻²=1/4 would give −1/4 | Matches the Conventions Check; E-normalization excluded |

The rows for all other statements stand as in the previous review, of `b6cbd63`; the diff changes no statement.

- Title and description: title and 3 summary paragraphs plus 5 prose paragraphs read against the head; 0 sentences contradicted. Adds a new folder of 3 files, 970 insertions, 62 headings, 0 removed; described as a new Part II of the base roadmap.
- Remark: the description's sentences on the Lean ("states only real-bodied definitions and theorems", "`sorry` as the only warning") hold with zero declarations and zero warnings: `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparisonPartII/Suggested.lean` states no theorem and names all 5 headlines as not statable.
- Description's suppliers against the README: 8 `From TauCetiRoadmap.*` subsections; 4 open (AutomorphicLFunctionsAndLocalFactors, EndoscopicTransferAndUnitaryTraceComparison, GeometryOfNumbersAndQuadraticArithmetic, MetaplecticAutomorphicForms), 4 on main (AdelicAlgebraicGroups, SmoothRepresentationsOfLocalGroups, SchemeAndStackFoundations, ReductiveGroupsPartII); GanGrossPrasadUnitaryGroups appears only under Downstream consumers.
- Citations: the resolver's 1 lead, `IntegralHermitianLattice.ofCarrier` (README line 65), resolves to GeometryOfNumbersAndQuadraticArithmetic §2.7.1 (its README line 705 at its open head); 0 cross-roadmap citations unresolved.
- Dependencies: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; 0 UPWARD or CYCLE lines.
- Gate, rerun at `b6cbd63`: every check 0, `OK`; the worker's run includes `build=0`; 0 paths changed outside the folder.
- Lean: `lake env lean` on `Suggested.lean` exits 0 with no output; 0 declarations, so no signature or one-tactic probe applies.
- Seeded sample and declared gaps: 0 changed passages, so no sampled target falls in the change; the 15 locators and 7 gap contracts stand as checked at `b6cbd63`. Acceptance remains conditional on those 7 declared supplier contracts.

Overlap check: overlap facts recomputed against 475 open heads: no other pull request changes this roadmap, no cited id dropped, none defined only by a revision, no second copy. Closest roadmaps GanGrossPrasadUnitaryGroups, EndoscopicTransferAndUnitaryTraceComparison, AutomorphicLFunctionsAndLocalFactorsPartII, MetaplecticAutomorphicForms, FunctionFieldArithmetic: scopes as read at `b6cbd63`; nothing shared beyond the cited suppliers.

Source independence: changed passages only: 0 passages changed, so 0 compared; no layer added, removed or reordered, so the comparison of contents with Leslie25 (largest share, 65 of 91 locators) stands as independent.

## Not verifiable

- none

## Source issues

- none new in this round; the 22 entries of the review of `b6cbd63` stand.

## For the human reviewers

- none
