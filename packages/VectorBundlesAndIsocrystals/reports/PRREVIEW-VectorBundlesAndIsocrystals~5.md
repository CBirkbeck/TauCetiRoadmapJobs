# Review of VectorBundlesAndIsocrystals (pull request #1205 at c1b63b8)

**Verdict:** accepted

Incremental re-review of 20 changed lines since 6f2c340 (pin hashes and one renamed Tau Ceti lemma in `TauCetiRoadmap/VectorBundlesAndIsocrystals/README.md`; one docstring sentence in `TauCetiRoadmap/VectorBundlesAndIsocrystals/Suggested.lean`), plus the check of the pull request's title and description against this head. No finding.

## Previous findings

- R01 — repaired: the description now lists, by section and layer, the eleven open suppliers (CrystallineCohomology §CR.4.7 … FarguesFontaineDiamonds F4) and ends "VectorBundlesAndIsocrystalsPartII is a consumer, not a prerequisite"; no `VB0`.
- R02 — repaired: the summary block now reads "Layer 1 transports the suppliers' mixed-characteristic Dieudonné–Manin classification, proves the equal-characteristic classification in every rank (`dieudonneManinEqualChar`)".

## Verified sound

The diff changes no statement; the rows are the library statements the changed text cites.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `SheafOfModules.LocalGeneratorsData.isFinitePresentation` (README 55, 408; renamed citation) | empty generator family; one generator; control: infinite index without `IsFiniteType` | pin: `(q) [q.IsLocallyFreeData] [q.IsFiniteType] : M.IsFinitePresentation`. Zero sheaf: 0 generators, relations `ULift Empty`, holds. `O`: 1 generator, holds. `O^(ℕ)`: instance absent, not claimed | README's "uses both conditions on the same family" matches the two instance binders | none |
| Docstring sentence on Tau Ceti's adic curve (`Suggested.lean` 26–29) | `spaXPresheaf`; `spaXAdicSpace`; `isSheaf_spaYPresheaf`; module sheaves on adic spaces | pin: `spaXPresheaf` a presheaf on `spaX hI`; `spaXAdicSpace (h : (spaYPresheaf P ϖ).IsSheaf) : AdicSpace`; sheaf theorem needs `v.Integers R`, `ϖ ≠ 0`, `v ϖ < 1`; no file under `AdicSpace` mentions `SheafOfModules` | each clause holds at the pin; Witt vectors are p-typical, so `E = ℚ_p` is right | none |
| Pins (README 43 and 34 link hashes) | `lake-manifest.json` | Mathlib `1b1ccf4…` (23 occurrences), Tau Ceti `2fd255d…` (11 occurrences); no occurrence of the former hashes in either file | equal to the manifest | none |

Rows for the untouched statements, `dieudonneManinEqualChar` included, stand as in the previous review, of 6f2c340.

- Library declarations opened at the pin: `TauCeti/Algebra/Category/ModuleCat/Sheaf/FinitePresentation.lean` 47; `TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/StructurePresheaf.lean` 312, `Adic.lean` 158 and 224, `PreAdicSpace.lean` 537; `Mathlib/RingTheory/WittVector/Isocrystal.lean` 179 (`isocrystal_classification`, named in the description). Every one of the README's linked files exists at the new pins and contains the name linked to it.
- Description against the head: each of the eleven open suppliers and its sections and layers was matched to README lines (for example PadicHodgeTheory §§0.2–0.5, 2.2, 3.5, 7.5–7.6 at README 17, 1297, 1637, 509; PhiGammaModulesAndIwasawaCohomology §§0.4, 1.0b, 1.5 at 1860; PrismaticCohomologyPartIII §7.0 in Layers 0, 2, 3, 4 at 165, 388, 775, 1059). The README cites no further roadmap that is not on main. Title, folder contents (3 files, 4 Lean declarations, a new roadmap) and the summary block agree with the head.
- Remark (untouched text, no change asked): README 62 says the Tau Ceti curve interfaces "give the orbit topology, not a relative or ramified-coefficient structure sheaf"; this stays true beside the new docstring, since the pinned presheaf is the fixed-field `ℚ_p` one.
- Gate, rerun on this head: every scanner 0, `OK`; the worker's targeted build passed. Dependency check: `depcheck: 245 roadmaps, 2244 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: one warning, `declaration uses sorry` at line 81; the four elaborated signatures are unchanged (only the module docstring changed), so the one-tactic probe was not rerun.
- Outside the folder: nothing changed against the base; the files listed since 6f2c340 come from merging main.
- Overlap check: the worker's overlap scan at this head lists no pull request changing this roadmap, no cited id dropped and none defined only by a revision; the scopes of VectorBundlesAndIsocrystalsPartII, RelativeFarguesFontaine and FarguesFontaineDiamonds were not read again, since the diff adds no object or cross-roadmap citation: nothing shared beyond what the earlier reviews recorded.
- Source independence: changed passages only; 2 passages compared with 0 literature sources (they cite none) and with the pinned Tau Ceti docstrings: the longest common run is 9 words, the name of a hypothesis ("the ring of integers of a valuation on a field"); no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- The fifteen seeded sample labels are all the same word ("API") and identify no target; none can be matched to the changed passages.
- The description's clause that Lake prints a notice about the module system for `Mathlib` is a build message; only the elaboration and the worker's build result were available, and they show the `sorry` warning.

## Source issues

- none

## For the human reviewers

- none
