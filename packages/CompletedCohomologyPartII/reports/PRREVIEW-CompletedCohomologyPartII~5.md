# Review of CompletedCohomologyPartII (pull request #1035 at 867beac)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 867beac. The folder is unchanged and its gate passes; the one finding is in the pull request's description, which this round reads against the head for the first time.

## R01 (P3) — The description's dependency paragraph names one of eleven open suppliers and calls the rest consumers

**Location:** pull request description, paragraph "Dependencies": "By section, the README uses: NoncommutativeAndEquivariantIwasawa §§0.2, 0.4, 0.10–0.11, F.1–F.2, … Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite."

**Claim:** Apart from NoncommutativeAndEquivariantIwasawa and roadmaps on main, every roadmap the README names is a consumer.

**Witness:** `TauCetiRoadmap/CompletedCohomologyPartII/README.md` line 111 takes ALS.0–ALS.6 from ArithmeticLocallySymmetricSpaces (not on main; 27 `*Needs:*` lines); lines 131, 145, 149, 153, 157, 161, 169, 1759, 1775 cite nine more open suppliers by section. The description's own depends-on block lists them.

**Repair:** Replace the paragraph's second and third sentences by:

> Suppliers still in open pull requests, by section: ArithmeticLocallySymmetricSpaces ALS.0–ALS.6 (the base roadmap, of which this is Part II); NoncommutativeAndEquivariantIwasawa §§0.2, 0.4, 0.10–0.11, F.1–F.2; IntegralHeckeAndGaloisDeterminants §§2.1–2.2; PadicLocalLanglandsForGL2Qp §§0.1, 0.3; ArithmeticGaloisDuality §D7.3; DeformationAndDerivedPatchingAlgebra §§7.3, 7.5–7.7 and Layer 8; LocallyAnalyticDistributions §§0.0–0.3; ModularCurvesPartII §§9.11–9.12, 14.1–14.4a, 14.8, 14.11; ComplexComparisonPartII §§C6.1–C6.5; ShimuraVarieties Layers 5–6 and §§8.1–8.5, 8.8; HilbertModularVarietiesAndShimuraCurves §§R18.4.12–R18.4.13. Suppliers on main, also cited by section: AlgebraicTopology Stages 4–6, ProfiniteProPGroups, ProfiniteCohomology, SmoothRepresentationsOfLocalGroups SR.0–SR.1, PadicMeasuresIwasawaAlgebras, DerivedModuleAlgebra, EnhancedDerivedSheaves. TorsionCohomologyInfrastructure, CompletedCohomologyAndLocalGlobalCompatibility and CohomologyComparisons are consumers, not prerequisites.

## Previous findings

- none to account for: the previous report (of 867beac) was an acceptance with no finding; its R01–R04 bullets recorded repairs of the round before, and the folder has not changed since.

## Verified sound

| # | Statement | Instances | Values | Result | Change |
|---|---|---|---|---|---|
| 1 | `completedHecke_decomposition` (`Suggested.lean` line 59; README §8.11), the statement the description's summary cites as "completed Hecke algebra with its residual localisation" | `J = ℕᵒᵖ`, `F_s = ℤ/6^s`, `A₀ = ℤ/6`, `q_s` reduction, `j₀ = 1` | transitions surjective; `ker q_s = 6ℤ/6^s` nilpotent ⊂ Jacobson; `T̂ = ℤ₂ × ℤ₃`; `ker q₀ = 6T̂ = J(T̂)`; 2 maximal ideals ↔ `(2), (3)`; residue fields `𝔽₂, 𝔽₃`; localisations `ℤ₂`, `ℤ₃`, product `≅ T̂`, compact T2 | true | none |
| 2 | Description, "Dependencies" paragraph | each roadmap the README names: folder on main or not; `*Needs:*` lines citing it | on main: AlgebraicTopology, ProfiniteProPGroups, ProfiniteCohomology, SmoothRepresentationsOfLocalGroups, PadicMeasuresIwasawaAlgebras, DerivedModuleAlgebra, EnhancedDerivedSheaves; not on main with `*Needs:*` lines: ALS 27, DDPA 13, IHGD 9, NCEI 5, AGD 3, LAD 3, MCII 3, PLL 2, CCPII 1, SV 1, HMVSC 1 | sentence false | R01 |
| 3 | Description, NoncommutativeAndEquivariantIwasawa sections | README lines 21, 139–141 | §§0.2, 0.4, 0.10–0.11, F.1–F.2 there; §§0.1, 3.11, 5.1, 5.5, F.2 here: identical lists | true | none |
| 4 | Summary block and first prose paragraph against the README Summary (line 5) and Downstream consumers (lines 2206–2210) | each named result and consumer | supports ordinary, `c`, `∂` (line 45); modular, Siegel, unitary, Hilbert (line 5); TorsionCohomologyInfrastructure Layer 2 ← 8.6; CompletedCohomologyAndLocalGlobalCompatibility ← 8.4, 8.10–8.13; CohomologyComparisons CP.6 ← 2.5, 4.5; Fu, Marshall ← 6.3, 5.5–5.7 | agrees | none |
| 5 | Description, "Roadmap folder … (README, `Suggested.lean`, `metadata.toml`)" and "Validation" | diff stat against `origin/main`; gate; elaboration | 3 files, 2323 insertions, 0 deletions, nothing outside the folder; 3 Lean declarations, all with real bodies or `sorry` proof only; gate counters all 0; one `sorry` warning | agrees | none |

Rows for the statements of the folder stand as in the previous review, of `867beac`; no statement changed.

- Gate at 867beac, run from the worktree: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate adds `build=0`.
- Dependency check with `--movable`: `depcheck: 245 roadmaps, 2243 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The roadmap is at position 181 of the merge order; its last supplier HilbertModularVarietiesAndShimuraCurves is at 164, its consumers at 183, 188 and 256.
- Elaboration: `lake env lean` on `Suggested.lean`, 17 s, one warning (`59:8: declaration uses sorry`), no error. A scratch copy with `#check @completedHecke`, `@completedHeckeLocalTopology`, `@completedHecke_decomposition` prints the three types of the worker's `signatures.md`; no binder lost.
- Files outside the folder: `git diff --stat origin/main...HEAD` restricted to the rest of the repository is empty.
- Cross-roadmap citations: the worker's resolver reports none found nowhere (main 2248bbb, 474 open heads). Its five Lean-name leads (`CanonicalTower.*` at README line 1746, `DualitySupport.torsionDual`, `DualitySupport.traceComparison`) are names of suppliers' targets in text the previous reviews passed: a remark, no change asked.
- Overlaps: no other open pull request changes this roadmap, no cited id is dropped, no id is defined only by an open revision, no second copy on main.
- Source locators: none re-read this round (no passage changed); the seeded sample stands as verified by the earlier reviews.
- Remark, no change asked: the description does not say in so many words that the pull request adds a new folder; the repair text of R01 says it is Part II of ArithmeticLocallySymmetricSpaces, which the title and summary already imply.

Overlap check: no folder change, so the scopes of CompletedCohomologyAndLocalGlobalCompatibility, TorsionCohomologyInfrastructure and SelmerIwasawaCohomology were not re-read; the previous review's result (nothing shared; the first two consume §§8.4–8.13, 8.6) stands, and the third closest-roadmap list is empty.

Source independence: changed passages only; 0 passages changed, so 0 compared; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package, with author-side red-team passes to follow" in the description: a statement about process that the head neither supports nor contradicts.
- The seeded sample's source locators were not re-read in this incremental round.

## Source issues

- none

## For the human reviewers

- Licence: source E11 (Emerton, local–global compatibility manuscript of 23 March 2011) is listed in the README's References as unpublished, read from the author's page; F.1 and Layer 3 cite its Appendices B and C.
