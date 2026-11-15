# Review of GeometricSatakeAndFusionPartII (pull request #1836 at 46b7eae)

**Verdict:** accepted

Incremental re-review of 18 changed lines since 3ef4ea3 (the two supplier paragraphs “From Mathlib” and “From Tau Ceti” of `README.md`, and three passages of the module docstring of `Suggested.lean`), and of the pull request's title and description against this head. No finding.

## Previous findings

- R01 — repaired: the description now reads “`Suggested.lean` declares nothing: none of the headline theorems is statable at the pinned Mathlib and Tau Ceti” and “the targeted Lake build succeeds with no warning”.
- R02 — repaired: the sentence ending “of Shimura varieties:” now continues with Layer 0 through Layer 8, each named with its content; the nine names agree with the headings at `README.md` lines 191–1157.

## Verified sound

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| `README.md` line 41: Mathlib pin and six locators | pin of `lake-manifest.json`; each file at that commit | pin 1b1ccf4 = manifest; `Span/Defs.lean:46` `span`; `Trace/Defs.lean:70` `trace`; `Grassmannian.lean:66` structure; `Trace/Basic.lean:502` `traceForm_nondegenerate`; `Scheme.lean:40`; `ZariskisMainTheorem.lean:393` | all seven agree | none |
| `README.md` line 45: Tau Ceti pin and five locators | pin of `lake-manifest.json`; each file at that commit | pin 2fd255d = manifest; `TangentSpace/Basic.lean:66` `ZariskiTangentSpace`; `Grassmannian/Basic.lean:161` `scheme`; `Points.lean:405` `schemeHomEquiv`; `Proper.lean:230` `isProper_toSpec`; `RootSpace.lean:110` `adjointWeightSpace` | all six agree | none |
| Line 45: “for an R-module M in the universe of R”; “proper over Spec R for finite M” | binders at the pin | `Grassmannian/Basic.lean:71`: `(R : Type u) (M : Type u)`; `isProper_toSpec` carries `[Module.Finite R M]`; `schemeHomEquiv` takes `A : Type u`, target `G(k, A ⊗[R] M; A)` | as stated | none |
| Line 45: “used with k=h−d for our rank-d subspace convention” | h=2 with d=1, d=0, d=2; the zero ring | Mathlib's k is the quotient rank: d=1 gives k=1, P¹; d=0 gives k=2, submodule 0, one point; d=2 gives k=0, one point. R=0: one point of `G(k, M; 0)`, one morphism from the empty scheme | agrees with the §2.5 Checks (P¹ for d=1; `Spec k` for d=0) | none |
| Line 41: affine base from Tau Ceti, general base and base change from ModularCurves §0G | ModularCurves on main (1a19c9f) | its table maps “Layer 0G” to “Layer 0.7” (README line 4509); Layer 0.7 (lines 1076–1100) takes the affine scheme from Tau Ceti and owns the gluing over a general base with base change | citation resolves; division of ownership agrees | none |
| `Suggested.lean` lines 13–16, 25–27, 30: no lattice-chain incidence subscheme at the pins; §2.5 not statable | search of both pins for lattice chain, incidence, Schubert, parahoric, kimberlite, nearby cycle | Tau Ceti `Grassmannian/` has seven files, none with a product or incidence subscheme; `IdealSheaf/IncidenceLocus.lean` is containment of closed subschemes on a base, not of Grassmannian points | holds; §2.5 would need the incidence subscheme constructed as data | none |
| §2.5 flatness (cited by the changed docstring), GL₂ Iwahori, d=1 | chart x₀=y₁=1 of the product of two copies of P¹ over O_F; generic and special fibre | equation xy=π_F: O_F[x,y]/(xy−π_F) is π_F-torsion-free, special fibre xy=0 reduced with two components, generic fibre the diagonal P¹ | flat; a closed subscheme of a product of two Grassmannian schemes, as the docstring says | none |
| §2.5 source locators (seeded sample, cited by the changed passages) | GORGL lines 643, 1325, 1406, 1414; GORSP lines 95, 149; KP line 1523 | Corollary 3.4.4 on p. 19; Theorem 4.5.1 on p. 35; Theorem 4.5.3 and Corollary 4.5.4 on p. 37; GORSP §2 on p. 3, Theorem 2.1 on p. 4; KP §2.3.4 | all at the stated locators; flatness in arbitrary characteristic as the README says | none |
| Description: build “with no warning”, “outside-folder diff has 0 path(s)”, “0 problem(s)” | elaboration, `git diff --stat origin/main...HEAD` outside the folder, dependency check | exit 0 with no output; 0 lines; `0 problem(s)` | agrees | none |
| Description: Layer 2 “flat GL and GSp lattice-chain incidence models and the trace symplectic form on a restriction of scalars” | README §§2.5, 2.8 | §2.5 proves flatness of both incidence schemes; §2.8 is the trace symplectic form | agrees | none |

The rows for the roadmap's other statements stand as in the previous review, of `3ef4ea3`.

- Gate re-run at 46b7eae: `gate GeometricSatakeAndFusionPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate also has `build=0`.
- Dependency check: `depcheck: 244 roadmaps, 2233 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. Merge order: GeometricSatakeAndFusion 134, DiamondsAndVStacksPartII 136, RootSystemsPartII 210, this roadmap 212.
- Elaboration: `lake env lean` on `Suggested.lean`: exit 0, no output. No `#check @name` file: the file has no named declaration.
- Library declarations opened at the pins: 11 (six in Mathlib, five in Tau Ceti), plus the variable lines of the three Grassmannian files.
- Source locators checked against the text: 7 (GORGL 4, GORSP 2, KP 1), all for §2.5; no other seeded target cites or is cited by a changed passage.
- Cross-roadmap citations resolved: 1 (ModularCurves §0G, through main's former-label table). The pull request changes no file outside the folder.
- Title “GeometricSatakeAndFusionPartII: roadmap” agrees with the change (the folder is not on main; 1335 insertions, no heading or declaration removed). Remark: the summary's list of reused declarations does not name `Module.Grassmannian.scheme`, which the README now also cites; the sentence is not contradicted.
- Overlap check: read GeometricSatakeAndFusion, DiamondsAndVStacksPartII, ReductiveGroupsPartII (their contracts in this README are untouched) and ModularCurves Layer 0.7; the Grassmannian scheme is owned by Tau Ceti (affine base) and ModularCurves (general base), the lattice-chain incidence models by this roadmap (no other roadmap, open or on main, states them); nothing shared.
- Source independence: changed passages only — 3 passages (the two supplier paragraphs and the §2.5 docstring bullet with the section it names) compared with 3 sources (GORGL, GORSP, KP), none shared; the changed passages carry no source locator, so the shares were not recounted; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- none
