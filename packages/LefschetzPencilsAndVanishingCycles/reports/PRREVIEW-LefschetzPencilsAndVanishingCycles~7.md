# Review of LefschetzPencilsAndVanishingCycles (pull request #873 at 306b5f0)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since `306b5f0`; this round reads the pull request's title and description against the head. The folder's files are unchanged and nothing in them is asked to change: the one finding is in the description.

## R01 (P3) — The description names three roadmaps the README does not cite, and points to a consumer list that is not there

**Location:** pull request description, the paragraph beginning “Dependencies”: “Roadmaps already on main that the README cites (SchemeAndStackFoundations, PadicMeasuresIwasawaAlgebras, AdicSpacesPartII, RigidAnalyticGeometry and the older roadmaps) … consumers of this roadmap are listed in the merge-order block, not here.”

**Claim:** The README at this head cites none of PadicMeasuresIwasawaAlgebras, AdicSpacesPartII, RigidAnalyticGeometry, and the description's merge-order block lists no consumer: it ends at this pull request.

**Witness:** `grep -c` on `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md`: `PadicMeasuresIwasawaAlgebras` 0, `AdicSpacesPartII` 0, `RigidAnalyticGeometry` 0 (the only “Rigid Analytic” is the Huber 1996 title, line 4498). `### From other roadmaps` (lines 198–289) has no such bullet.

**Repair:** Replace the sentence by: “Roadmaps already on main that the README cites (EtaleCohomologyFoundations, SchemeAndStackFoundations, StableReduction, EnhancedDerivedSheaves, DerivedModuleAlgebra, PurityOfBranchLocus, AbhyankarLemma, SmoothRepresentationsOfLocalGroups, AdelicAlgebraicGroups and the older roadmaps) are consumed from main and are not prerequisites; the consumers of this roadmap are in the README's `## Downstream consumers`.” Each of the nine has a folder on main (`3cf7342`) and a bullet under `### From other roadmaps`.

## Previous findings

- The previous report (of `306b5f0`, accepted) raised no finding; its one `## Previous findings` bullet, R01 of the review before it, was recorded as repaired and the passages it names (README lines 135, 165–182, 267–269) are unchanged at this head.

## Verified sound

| Statement (cited by the description) | Instances and values computed on each side | Result |
|---|---|---|
| Description: “the even-dimensional Picard–Lefschetz formula in characteristic two uses the centre of the even Clifford algebra over any base, extending Tau Ceti's `CliffordAlgebra.adjoinRootEquivCenterEven`”; README 2.2, `evenClifford_center_etale_azumaya` | Pinned declaration (`Even/Center.lean:336`) needs `[NeZero (2 : K)]`, an orthogonal list of even nonzero length. `x² + xy + y²` over `𝔽₂`: no orthogonal basis, polar determinant `1`, centre `𝔽₂[u]/(u² + u + 1) = 𝔽₄`, étale of rank `2`. `x² + y²` over `𝔽₂`: polar `0`, excluded by bijectivity. | Pass |
| Description, summary block: end theorems | README Summary lines 14–16 name 2.8, 3.4, 5.8, 6.2, 7a.8, 7b.5, 7b.11; absolute purity is 0.10 (line 896, Riou's proof; alterations and log blow-ups in 0.10). Each sentence of the block has its section at this head. | Pass |
| Description, summary block: consumers | `## Downstream consumers` (lines 4427–4449): DeligneWeightsAndPurity “Weil II 3.6.1, 6.2.9 and 6.2.12 and hence hard Lefschetz”; IgusaVarietiesAndTorsionConcentration (6.5, 1.10); EndoscopicTransferAndUnitaryTraceComparison (6.1–6.2); AutomorphicGaloisRepresentations (0.6, 7a.2). | Pass |
| Description: “README, `Suggested.lean`, `metadata.toml`”; “the Lean imports none of them” | Folder holds exactly these three files; imports are `import Mathlib` and `import TauCeti.LinearAlgebra.GeneralLinearGroup.Unipotent`; six declarations, one real-bodied `def`, five sorried theorems. | Pass |

The rows for the statements of the folder stand as in the previous review, of `306b5f0`: no statement changed.

- Head `306b5f0`, worktree clean; `git diff --stat origin/main...HEAD` outside the folder is empty; the folder's change since the previous review is 0 lines.
- Gate, run again on this head: `OK`, every scanner `0` (the worker's run adds `build=0`). Dependency check: `depcheck: 245 roadmaps, 2224 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `Suggested.lean`: five warnings, all `declaration uses 'sorry'` (lines 53, 85, 98, 114, 135), nothing else. `signatures.md` lists the same six elaborated types as before, none with a dropped binder.
- Library declarations opened at the pins (4): Tau Ceti `LinearAlgebra/CliffordAlgebra/Even/Center.lean:336` (`adjoinRootEquivCenterEven`); Mathlib `Algebra/Lie/Sl2.lean:38` (`IsSl2Triple`), `LinearAlgebra/Transvection/Basic.lean:56` (`LinearMap.transvection`), `LinearAlgebra/CliffordAlgebra/Even.lean:53` (`CliffordAlgebra.even`).
- Description against the README's supplier list: the eight open suppliers of the generated depends-on block (AbelianSchemesAndArithmeticModuli, AlgebraicModuliForArithmeticGeometry, ArithmeticGaloisDuality, ArithmeticGaloisRepresentations, ComplexComparisonPartII, CrystallineCohomology, InverseGaloisAndArithmeticFundamentalGroups, NeronModelsAndSemistableAbelianVarieties) each have a bullet under `### From other roadmaps`; every other roadmap cited there has a folder on main. The title equals the README's title. The description states that the pull request adds the roadmap; nothing is removed or renumbered (0 headings, 0 declarations removed).
- `overlaps.md`: no open pull request changes this roadmap, no cited id dropped, no id only an open revision defines, no second copy on main.
- Overlap check: read EtaleDualityAndPerverseSheaves, DeligneWeightsAndPurity, ClassicalAdicEtaleCohomology (open heads) and EtaleCohomologyFoundations (main); scheme nearby and vanishing cycles over a trait, the monodromy filtration and pencils: this roadmap (the three open ones cite its §§0.5–0.8, 1.1–1.6, 3.4, 7b.9 as supplier); formal and adic nearby cycles: ClassicalAdicEtaleCohomology Layer 4; field perversity and duality: EtaleCohomologyFoundations §§F.5–F.8.
- Source independence: changed passages only; the folder changed by 0 lines, so 0 passages compared with 0 sources; no layer added, removed or reordered, arrangement not compared again.
- Remark: the eight Lean names of `citations.md` are other roadmaps' declarations in untouched contract text, as the previous review recorded.

## Not verifiable

- No source was opened this round: no passage of the folder changed, and the seeded sample falls in no changed passage. The texts earlier reviews could not read (Schneider 2011, SGA 7 I–II, Fujiwara 2002, Illusie 2002, BBD, Jouanolou 1983, SGA 4, SGA 4½, SGA 5, Huber 1996, BLR, Illusie 2003, Vidal 2004b) were not attempted again.
- The description's generated blocks (`depends-on`, `merge-order`) are outside this check, except as compared above.

## Source issues

- none

## For the human reviewers

- none
