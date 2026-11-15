# Review of AutomorphicFormsOnReductiveGroups (pull request #1037 at 4a03177)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: the description now reads “the targeted Lake build succeeds with the expected `sorry` warning and a warning about importing `Mathlib`, which is designed for the module system”, which is what the build prints at this head.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `compactFinite_dense_locallyConvex`, README §2.1 (cited by the summary block) | Trivial group on any `E`; `C₂` swapping coordinates of `ℂ²`; control: `ℝ` translating `L²(ℝ)` | Orbit-span dimensions `≤1` and `2` at `(1,0)`: set is all of `E`, dense. Control: finite-span vectors `{0}`, closure `{0}≠L²(ℝ)` | Holds; the control fails only `CompactSpace`, so compactness is needed | None |
| Description, validation paragraph (previous R01) | Targeted Lake build; direct Lean elaboration | Exit codes `0, 0`; warning kinds `2` (`sorry`, module-system import) and `1` (`sorry`); description states `2` for the targeted build | Agrees | Repaired |
| Summary block: “Van Est holds for real Lie groups with finitely many components” | README §1.2–§1.3 hypotheses | README lines 254 and 276: finite-dimensional real Lie group with finitely many components; no connectedness or reductivity assumed | Agrees | None |
| Description: suppliers on main or in the open chain | 11 supplier roadmaps of `## Exact supplier contracts` | On main: 9 (EtaleCohomologyFoundations, AnalyticNumberTheoryPartII, ReductiveGroups, ReductiveGroupsPartII, AdelicAlgebraicGroups, SmoothRepresentationsOfLocalGroups, LieGroups, LieHighestWeight, CompactGroups); open and earlier in the merge order: 2 (lines 58, 59 before 60) | Agrees | None |

The rows for untouched statements stand as in the previous review, of 4a03177.

- Previous findings: 1 checked, 1 repaired; folder diff since the previous review: 0 lines; files changed outside the folder: 0; worktree clean at `4a03177`.
- Title, summary block and prose read against the head and the base: the roadmap is new (3 files, 1417 insertions, 0 deletions, 73 headings and 1 Lean declaration added, none removed); 0 sentences contradicted. Claims checked against the README: consumers BorelRegulators and Polylogarithms (line 1317), `ℓ₀, q₀` and torsion eigensystems (line 1317), Hermitian datum “rather than requiring a Shimura variety” (line 15), “need not be cuspidal, unitary or generic” (line 17), smooth-topology density for Banach representations of compact Lie groups (lines 313, 489).
- Supplier claim of the description: LieHighestWeight §9.2 is on main (`TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:2819`) and README §2.2 cites its Layer 9.
- Gate rerun: every scanner count 0, `OK`; the worker's gate also reports `build=0`.
- Dependency check output: `depcheck: 245 roadmaps, 2220 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/Suggested.lean`: exit 0, `sorry` at line 47 the only warning; targeted build exit 0. The 1 elaborated signature was compared with README §2.1: 0 lost binders.
- Seeded sample: 0 targets fall in changed passages (the folder did not change); 0 source locators reopened; 0 cross-roadmap citations unresolved in the worker's resolver. The 5 Lean names it lists as found nowhere are supplier-roadmap names (EtaleCohomologyFoundations, ArithmeticGaloisRepresentations, ArithmeticLocallySymmetricSpaces), not pinned-library claims, as in the previous review.

Overlap check: the previous scope reads of AutomorphicSpectralTheory, AutomorphicLFunctionsAndLocalFactors, AutomorphicSpectralTheoryPartII, SmoothRepresentationsOfLocalGroups, LieHighestWeight and AdelicAlgebraicGroups stand, the folder being unchanged; finite-place representations belong to SmoothRepresentationsOfLocalGroups, reductive enveloping centres to LieHighestWeight, adelic foundations to AdelicAlgebraicGroups, spectral theory and L-functions to their named consumers. The worker's overlap list at this index shows 0 other pull requests changing this roadmap, 0 dropped cited ids and 0 ids defined only by an open revision.

Source independence: changed passages only; 0 folder passages changed, 0 compared with 0 sources; source shares unchanged; arrangement not compared again because no layer was added, removed or reordered.

## Not verifiable

- Unchanged source-access limitations from the earlier reviews: Borel–Jacquet, Flath and Langlands (Corvallis I); Knapp, *Lie Groups Beyond an Introduction*; Vogan 1984; Lapid; Kostant 1961. Nothing in this round needed them.

## Source issues

- none

## For the human reviewers

- none
