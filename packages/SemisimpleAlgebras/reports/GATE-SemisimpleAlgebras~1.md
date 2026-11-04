# GATE-SemisimpleAlgebras~1: answers to human review at 0fbb5b6

## H01 (CBirkbeck) — applied

`TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/Suggested.lean` now imports `TauCeti.Algebra.BrauerGroup.Group` and `TauCeti.Algebra.CentralSimple.Splitting` (lines 2–3) and declares `export TauCeti.Algebra (IsSplittingField)` inside its namespace (line 27), so the branch's copy of `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` again finds the `CommGroup (BrauerGroup K)` instance and `IsSplittingField`; the targeted build goes from 26 errors to 0. The README says so in "How to read the build" (last sentence: "… with no auxiliary definitions" → "…; it also imports the pinned Brauer group law `TauCeti.BrauerGroup.instCommGroup` and re-exports `TauCeti.Algebra.IsSplittingField` into its namespace, which is how QuadraticFormInvariants reads both.") and in the QuadraticFormInvariants entry of "Downstream consumers"; the module docstring has the matching paragraph.

Context for the merge (not a dispute of the repair): on main (fa41b374) `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` no longer imports this module (0 occurrences of `SemisimpleAlgebras`) and takes both names from Tau Ceti directly. The consumer failure comes from the branch's merge-base copy (73b8e2ea). The import and export are therefore needed only while the branch carries that copy, and are harmless after main is merged.

## Changes

Commit `3e33c662` "SemisimpleAlgebras: review repairs (import Brauer group law, re-export IsSplittingField for QuadraticFormInvariants)":

- `Suggested.lean`: two `TauCeti.*` imports; one `export` line; one docstring paragraph. The three theorems (`skolemNoether`, `centralizer_isSimpleRing`, `centralizer_centralizer`, now at lines 38, 47, 55) are textually unchanged. No definition, instance or sorry'd data was added.
- `README.md`: two sentences, as quoted under H01.

## Build

`lake build TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras.Suggested TauCetiRoadmap.QuadraticFormInvariants.Suggested` at 3e33c662: **exit 0**, "Build completed successfully (9593 jobs)", 0 errors. This module emits exactly its three `sorry` warnings (lines 38, 47, 55). The remaining `sorry` warnings come from QuadraticFormInvariants.

## Gate

    gate SemisimpleAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Dependency check output:

    depcheck: 204 roadmaps, 1544 edges, 0 problem(s)

The output has no UPWARD, CYCLE or `moved:` line.

## Signatures

The three declarations' texts are unchanged, and each carries all of its binders in its own signature (no section `variable`s). Adding the imports does not change their binders: `Algebra.IsCentral K A`, `IsSimpleRing A`, `FiniteDimensional K A` and simplicity of the source or subalgebra are all present, matching README §§5.1–5.3. I did not elaborate a separate `#check @name` scratch file, because the brief allows only the `lake build` command above. That build elaborated all three.

## Adversarial pass (material this round touches)

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | Consumer reads the group law and `IsSplittingField` through this module | branch copy of QuadraticFormInvariants `Suggested.lean` | imports of this module: 1; errors before: 26; after: 0 | needed at the branch's base | applied |
| 2 | The export is the same predicate the consumer expects | `TauCeti/Algebra/CentralSimple/Splitting.lean:120` | explicit arguments (K A L); body ∃ n, Nonempty (L ⊗[K] A ≃ₐ[L] Matrix (Fin n) (Fin n) L); consumer sites elaborate: 2/2 (lines 1603, 1613) | agrees | applied |
| 3 | The instance has a real body and the right universe | `TauCeti/Algebra/BrauerGroup/Group.lean:174`, `CommGroup (BrauerGroup.{u, u} K)` | consumer `BrauerGroup K` sites with stuck universe or instance after the change: 0 | agrees | applied |
| 4 | No sorry'd data and no new declaration | gate counters | sorry-data 0, forbidden 0, readme-ids-missing 0 | holds | none |
| 5 | The headline theorems are unchanged | lines 38, 47, 55 | `sorry` warnings here: 3 (before 3) | holds | none |
| 6 | Main's consumer is independent of this module | QuadraticFormInvariants at fa41b374 | occurrences of `SemisimpleAlgebras`: 0 | the shim is inert after the merge | noted |

Rows 1–41 of the previous review's table cover statements that are byte-identical and are carried forward unchanged.

## Ownership and sources

Nothing new is constructed: both names are Tau Ceti's at the pin (a91d3aafa), cited in README §6.1 and §6.2. No source was needed, and I did not write `needs-references.toml`. I did not re-check ownership against open pull requests, because no object changed.

## Deliverable paths

The roadmap is tracked at `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/` (`README.md`, `Suggested.lean`). The gate passes with `--folder RepresentationTheory/SemisimpleAlgebras`.
