# Review of AdicSpacesPartV (pull request #2133 at 28193cd)

**Verdict:** needs changes

Incremental re-review of the 2 lines of `TauCetiRoadmap/AdicSpacesPartV/README.md` changed since `a70c9f5` (the statement of §1.2), plus the pull request's title and description read against this head.

## R01 (P3) — The description says DiamondsAndVStacks is not on main

- **Location:** Pull request description, Dependencies paragraph: "Four roadmaps that are not on main are named without being prerequisites: … and DiamondsAndVStacks D6.9 and AbelianSchemesAndArithmeticModuliPartII B2.10 are cited in Scope and ownership for comparison only, …; both are in open pull requests."
- **Claim:** DiamondsAndVStacks is on main, and no open pull request revises it. Only three of the roadmaps the README names are missing from main. LieGroupoidsPoisson G0.1, also cited for comparison, is on main as well.
- **Witness:** On main at `4d169a9`, `TauCetiRoadmap/DiamondsAndVStacks/README.md` line 9495 is "### D6.9 Seminormal rigid full faithfulness". It merged on 2026-11-13, after this branch's merge base `b54415b`. The open-pull-request index has DiamondsAndVStacksPartII only.
- **Repair:** Replace the sentence with: "Three roadmaps that are not on main are named without being prerequisites: AdmissiblePairsAndPadicHodgeStructures and ClassicalAdicEtaleCohomologyPartII are consumers, and AbelianSchemesAndArithmeticModuliPartII B2.10, in an open pull request, is cited in Scope and ownership for comparison only. DiamondsAndVStacks D6.9 and LieGroupoidsPoisson G0.1, both on main, are also cited there for comparison only. They own neighbouring statements from which §5.3 and §6.1 differ, and neither is a supplier."

## Previous findings

- none: the review of `a70c9f5` raised no finding. Its R01 and R02 bullets accounted for findings of the review of `5aa51b7`, and both were repaired there.

## Verified sound

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| §1.2 line 341, forward direction and cokernel clause | cusp t ↦ (t², t³); node XY = 0; disc with f = id; X = ∅ | Cusp: coker K⟨t⟩/K⟨t²,t³⟩ ≅ K·t, support {0} = non-normal locus, f⁻¹(0) one point. Node: coker ≅ K via (f,g) ↦ f(0) − g(0), support {origin}, f⁻¹ two points. Disc: coker 0, support ∅ | true as reworded |
| §1.2 line 341, converse; Checks lines 351–353 | one axis into XY = 0; X ⊔ Spa K → X with the extra point sent into Z | Axis: an isomorphism over X − Z forces Z ⊇ other axis, dim 1 = dim X, so Z is not nowhere dense: fails. Union: f⁻¹(Z) contains an open point: fails. Neither is a normalization | true; both density conditions needed |
| §1.2 line 341, hypothesis "reduced" | X = Spa K⟨T⟩/(T²), Y = Spa K | O_X → f_*O_Y is K[T]/(T²) → K, kernel (T) ≠ 0. The zero-kernel clause needs X reduced, and the statement assumes it | hypothesis in scope |
| Description, "Four roadmaps that are not on main" | each roadmap the README names, checked against main at `4d169a9` | Not on main: AdmissiblePairsAndPadicHodgeStructures, ClassicalAdicEtaleCohomologyPartII, AbelianSchemesAndArithmeticModuliPartII (3). On main: DiamondsAndVStacks (line 9495), LieGroupoidsPoisson (line 299), all nine suppliers | false: R01 |

The rows for untouched statements (the three Lean headlines, `IsUnitGaussPoint` and the README targets) stand as in the previous review, of `a70c9f5`.

- **Source locators (5):** CONRAD99 line 459 (Theorem 2.1.2, statement on p. 10; page markers at lines 439 and 491, proof ends on p. 11). Also line 463 (injectivity, coherent cokernel), line 469 (cokernel support = non-normal locus) and lines 451–458 (nowhere density). Hypotheses match the roadmap's: reduced source and target, any complete nonarchimedean ground field. The other seeded targets lie in untouched text.
- **Wording:** the new §1.2 text against CONRAD99 lines 459–464. The longest shared runs are 4 words ("nowhere dense in Y", "an isomorphism over the"), with the clauses reordered. The replaced text shared a run of about 16 words.
- **Citations resolved (6):** DiamondsAndVStacks D6.9 on main (line 9495; its proper-surjective relative-analytification claim matches README line 18). LieGroupoidsPoisson G0.1 on main (line 299). AbelianSchemesAndArithmeticModuliPartII B2.10 at its open head (line 1612). §1.4's *Needs:* §1.2 (line 404) is unaffected. No other roadmap cites RZ.1 / normalization-characterisation. No other roadmap owns the criterion (searched by theorem and wording).
- **Description, other claims:** every other claim holds at this head:
  - the five gap contracts (lines 102, 112, 126, 145, 156);
  - the three §0.5 lemmas and §7.0 composition (lines 18, 124);
  - the generically reduced §§7.5–7.6 input (line 18);
  - Bartenwerfer's direct route (line 452);
  - the three Lean headlines (`Suggested.lean` lines 76, 97, 131), on the stated carriers;
  - the consumers (lines 1069–1073);
  - suppliers all on main.
  
  The title "AdicSpacesPartV: roadmap" fits a pull request that adds the folder.
- **Gate:** rerun at this head; every scanner 0, ending `outside-folder=0 source-material=0 OK`. The worker's gate adds `build=0`. Dependency check: `depcheck: 244 roadmaps, 2206 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. The diff outside the folder is empty.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives three `declaration uses sorry` warnings (lines 76, 97, 131) and nothing else. The file is byte-identical to `a70c9f5`, so its `#check @` comparison and one-tactic probe stand.
- **Overlaps:** `scratch/overlaps.md` reports no other pull request changing this folder, no dropped id and no revision-only id. Overlap check: the change touches only §1.2, whose criterion no other roadmap owns; the closest-roadmap comparison stands as in the previous reviews.
- Source independence: changed passages only: 1 passage compared with 1 source (CONRAD99), longest shared run 4 words; largest share HK2, 19 of 68 line locators; arrangement not re-compared (no layer added, removed or reordered).
- **Declared gaps:** the five slugs are untouched by the diff.

## Not verifiable

- SCHNEIDER11, BARTENWERFER76 and LUTKEBOHMERT74 are recorded as uncertified and were not read. None is cited in the changed passage.

## Source issues

- none

## For the human reviewers

- none
