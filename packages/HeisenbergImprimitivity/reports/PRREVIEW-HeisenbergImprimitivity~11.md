# Review of HeisenbergImprimitivity (pull request #1149 at 185669b)
Folder: `TauCetiRoadmap/HilbertModules/HeisenbergImprimitivity/`
**Verdict:** needs changes

Incremental re-review of the 1 line changed since 926979b (the folder's `metadata.toml` deleted), and the first check of the pull request's title and description against the head. The folder's files have no finding; all four findings are about the description, which was written for an earlier head. Main is 3cf7342.

## R01 (P3) — The description calls HilbertModules and OperatorAlgebraDynamics unmerged

**Location** pull request description: "Depends on the unmerged HilbertModules parent #861, OperatorAlgebraDynamics #1137 …"; "#861 supplies its parent/topic/link structure and is not yet merged"; "The unmerged parent/topic dependency above remains explicit."
**Claim** The head contradicts these sentences: both suppliers are on main, and the parent's topic is on main.
**Witness** Main 3cf7342: `TauCetiRoadmap/HilbertModules/README.md` (H1–H6, child link at line 119) and `metadata.toml` (`topic = "math.OA"`); `TauCetiRoadmap/OperatorAlgebraDynamics/README.md` line 933 `### D1.CentralTwists`, line 1659 `### D2.CentralTwists`.
**Repair** Replace the paragraph with: "Suppliers HilbertModules (H1–H3) and OperatorAlgebraDynamics (D1.CentralTwists, D2.CentralTwists) are on main. The child inherits the parent's math.OA topic from `TauCetiRoadmap/HilbertModules/metadata.toml` on main and has no metadata of its own. This PR adds only the two child files." Delete the unchecked lines "depends on: #861" and "depends on: #1137", and the sentence about the topic checker.

## R02 (P3) — The description names a supplier the README does not consume

**Location** pull request description: "… and SmoothBanachRepresentations #1145 for smooth inverse closure."; "- [ ] depends on: #1145".
**Claim** The head has no SmoothBanachRepresentations supplier; the description leaves the dropped supplier unstated and still lists it.
**Witness** `README.md` has no occurrence of "SmoothBanach"; Scope and ownership: "The inverse-closedness of S(L,c) is Mathlib's smoothness of inversion at units, `contDiffAt_ringInverse` … no general theory of smooth elements of Banach-algebra actions is built here"; §5.1 `*Needs:*` line 703.
**Repair** Delete the clause and the "depends on: #1145" line; write instead: "Inverse-closedness of the rapid-decay algebra uses Mathlib's `contDiffAt_ringInverse` along the gauge orbit; no open pull request is a supplier." (The summary block already says "Mathlib's smooth inversion".)

## R03 (P3) — The validation paragraph describes another file

**Location** pull request description: "passed with five intentional theorem-admission warnings and no other diagnostics"; "with five intentional own admissions and no other own warnings".
**Claim** `Suggested.lean` at the head has three sorried theorems, not five; the paragraph's counts and CI run are of an earlier head.
**Witness** `lake env lean` on `Suggested.lean` at 185669b: exactly three `declaration uses sorry` warnings, lines 84 (`fundamental_identity`), 105 (`exists_parsevalFrame`), 114 (`parsevalFrame_trace`); 10 declarations in all.
**Repair** Replace the Validation paragraph with: "`Suggested.lean` states three headline theorems with `sorry` (`fundamental_identity`, `exists_parsevalFrame`, `parsevalFrame_trace`) and seven definitions with real bodies; it elaborates with those three warnings only. These are target signatures, not proofs."

## R04 (P3) — "H1–H6" is not the head's numbering

**Location** pull request description: "Develop the complete H1–H6 Heisenberg imprimitivity theory for M=R^k × Z^p × T^q × F …".
**Claim** The head has Layers 1–6 with sections 1.1–6.3; H1–H6 are the parent's layers, and the child's H-numbering survives only as a mapped former id.
**Witness** `README.md` headings `## Layer 1` … `## Layer 6`; lines 238–239: "HilbertModules H5 cites … as HeisenbergImprimitivity H6; under this roadmap's numbering it is §6.3."
**Repair** "Develop Heisenberg imprimitivity theory (Layers 1–6) for M=ℝ^k × ℤ^p × 𝕋^q × F with finite abelian F, including arbitrary mixed phase-space lattices."

## Previous findings

- none: the review of 926979b had no finding and accepted the folder.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Deleted `metadata.toml` (the change) | topic of the child after deletion | parent `TauCetiRoadmap/HilbertModules/metadata.toml` on main: `topic = "math.OA"`, equal to the deleted line; gate `metadata=0`, `stray-files=0` | topic unchanged, inherited | none |
| Description: "covol(E) = covol(D)⁻¹" against §6.3 | θ=⅓ | `σ((nθ,χ_m),(l,χ_u))=e(ml−unθ)=1` for all m,n iff l∈ℤ, u∈3ℤ; `c_E=⅓`, `c_D=3`, product 1 | equal | none |
| Description: "finite Parseval frames … module dimension" against `parsevalFrame_trace` (R03) | k=0, n=1, g=1 | frame sum `|⟨g,f⟩|²=|f|²`; `Σ‖g‖²=1`; covolume of the zero lattice in a 0-dimensional space 1 | equal; three sorried theorems | none |
| Description: "contains only the two new child files" | `git diff --stat origin/main...HEAD` | `README.md` 893 insertions, `Suggested.lean` 119; nothing else; parent README identical to main | true | none |
| Description: "permits 2-torsion", "failed theta=0 embedding" | README lines 253, 275, 847, 856 | "no factor 1/2 is used, so 2-torsion in M is allowed"; "At θ=0, E_0 is not a lattice" | supported | none |

Rows for the statements of the folder stand as in the previous review, of 926979b: the diff changes no statement.

- Gate: the worker's gate at 185669b passes every check, `build=0`. My run of the brief's command gives every text check 0 and `depcheck: NOT IN ORDER: HeisenbergImprimitivity` against the default order, which is not a finding.
- Dependency check (brief's command, candidate order, `--movable`): `depcheck: 245 roadmaps, 2212 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` gives three `sorry` warnings (lines 84, 105, 114) and no other diagnostic; the file is unchanged since 926979b, so the signature comparison of that review stands.
- Citations resolved on main 3cf7342: HilbertModules H1–H6 (lines 126–705), OperatorAlgebraDynamics D1/D2.CentralTwists (933, 1659), NoncommutativeGeometry N6, N7 (1478, 1670); AmenableGroups and ThetaSeries folders present. `roadmaps resolve`: none found nowhere.
- Overlaps: no other open pull request changes this roadmap; no cited id dropped; none defined only by an open revision (D1.CentralTwists is now on main).
- Overlap check: read CompactQuantumMetricSpaces, ThetaInvariantsOfEuclideanLattices, OperatorAlgebraDynamics, HilbertModules, OperatorKTheory; `C*(G,ω)` owner OperatorAlgebraDynamics, Euclidean lattice Poisson owner ThetaSeries/Tau Ceti, completions owner HilbertModules; nothing owned twice.
- Seeded sample: no sampled target and no source locator lies in the changed line; the locator checks of the earlier reviews stand.
- Source independence: changed passages only: 0 passages compared (the diff removes one metadata line and changes no prose); arrangement not compared again, no layer added, removed or reordered.

## Not verifiable

- Hewitt–Ross, *Abstract Harmonic Analysis I*, Theorem 24.10 (§1.2): `uncertified` in the manifest, cited by its locator only; untouched by the change.
- The description's claims about private review, "23 selected Luna Markdown source variants", the "24-node/32-edge dependency graph" and the linked CI run: no file of the head records them.

## Source issues

- none

## For the human reviewers

- none
