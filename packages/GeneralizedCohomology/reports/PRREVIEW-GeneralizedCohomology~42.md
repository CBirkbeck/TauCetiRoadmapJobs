# Review of GeneralizedCohomology (pull request #1808 at a96d197)

**Verdict:** needs changes

This is an incremental re-review of 0 changed lines since c9403e2. `TauCetiRoadmap/GeneralizedCohomology/README.md` and `Suggested.lean` are byte-identical to the head the previous review read, and `lake-manifest.json` is unchanged (Tau Ceti 2fd255d9, Mathlib 1b1ccf4b). Since c9403e2 the pull request changed only the BordismFormalGroups and LocalPurity folders, both consumers of this roadmap; neither edit touches anything this README cites. So none of the seventeen previous findings is repaired, and no repair introduced a new problem. The push gate still fails on set_option, sorry-data, imports, mathlib-subimports, no-import-mathlib, statement-hygiene, blob, latex, prnum, dropped, depcheck and outside-folder. The ids R01–R17 are kept so that each can be traced to the previous report; every witness below was re-resolved at the current heads and pins.

## R01 (P1) — Supply cycle through HomotopySpheres, a roadmap that may never be cited as a supplier

**Location.** README line 37: "[HomotopySpheres Stage 3A](…/pull/284) | the native `CompactlyGenerated` inclusion and compact-generation right adjoint; pointed convenient mapping spaces…". The same supplier at lines 75, 241, 328 ("PR284's convenient …"), 2320 and 2487 ("PR284 … §4B / Stage 4B"), and `Suggested.lean` line 513 ("PR284-owned compact-generation right adjoint").

**Claim.** HomotopySpheres is on the list of roadmaps that may never be cited as suppliers, and it consumes this roadmap, so the edge closes a cycle.

**Witness.** HomotopySpheres at the head of its open pull request, README line 508: "From TauCetiRoadmap.GeneralizedCohomology. G4.0a supplies the right-quaternionic-line…"; lines 82 and 170 consume G4.0a–G4.0b and G5 item 6. Dependency check on this head: `UPWARD: GeneralizedCohomology (on main) -> HomotopySpheres (#45) at README lines [37]` and `CYCLE among: GeneralizedCohomology, HomotopySpheres, StringOrientation, TangentialBordism`. Gate `dropped` hits at lines 37 and 2320.

**Repair.**
1. Delete the line-37 row and every PR284 citation.
2. Take the compact-generation coreflection `k`, its counit and `k(X×Y)` from AlgebraicTopology Stage 4.5 (this pull request's AlgebraicTopology README, lines 136–148, owns them).
3. State the pointed convenient smash, mapping cone/Puppe and the stems `π_n S` here as G2.5 targets; G2.5 already proves Freudenthal. Delete "compatibility with the sphere-only supplier theorem" from G2.5 and "the supplier's stabilized stems" from G2.5 and G3.8.
4. State the real space-level Bott loop chain with its Clifford comparison as a G5.0/G5.4 target and record the move in Scope.
5. Delete "PR284-owned" from the Lean docstring.
6. Lines 3419 ("before StringOrientation defines λ and BString") and 43 ("…remain TangentialBordism") are depcheck false positives: reword both in the consumer form the check accepts at line 46, for example "StringOrientation, a consumer, defines λ and BString after G5.0".

After step 1 there is no GeneralizedCohomology → HomotopySpheres edge, and the cycle needs that edge.

## R02 (P2) — Upward supplier OperatorKTheory, and pull-request links for two suppliers now on main

**Location.** README line 45: "[HilbertModules H2, H4–H6](…/pull/861), [CStarAlgebras C5](…/pull/860), [OperatorKTheory K5](…/pull/866) | complex Hilbert compact operators/spatial tensors…"; line 2649 repeats the three.

**Claim.** OperatorKTheory is an open pull request at merge-order position 9, so a roadmap on main consumes an unmerged plan. CStarAlgebras and HilbertModules are on main but still linked by pull-request URL.

**Witness.** Dependency check on this head: `UPWARD: GeneralizedCohomology (on main) -> OperatorKTheory (#9) at README lines [45]`. OperatorKTheory at its open head: "## K5. Graded cycles and KK-groups" (line 1127) and line 2332 "GeneralizedCohomology … consumes K5's graded Clifford…". On main: CStarAlgebras Layer 5 (line 1110), HilbertModules H2/H4–H6 (lines 179, 325, 356, 705).

**Repair.**
1. Relink CStarAlgebras and HilbertModules by path (`../CStarAlgebras/README.md` Layer 5, `../HilbertModules/README.md` H2, H4–H6).
2. State the graded Clifford parity reduction and its sign adapter (lines 2650–2652) as a G5.5 target and record the move in Scope; OperatorKTheory already lists this roadmap as a consumer and cites G5.5 after the move.
3. Rerun the dependency check until no OperatorKTheory line remains.

## R03 (P2) — Sorry'd data in Suggested.lean (22 declarations)

**Location.** `Suggested.lean` line 246 `nativeSpinFourQuaternionHomeomorph`; line 391 `quaternionFrameGroupChartedSpace`; line 485 `quaternionProjectiveGrassmannianHomeomorph`; line 514 `realizationProductKelleyComparison`; lines 537–660 the pointed, finite-bijection, Day and sphere instances and defs; lines 698–709 `spectrumSmash`, `freeSpectrum`, `freeEvaluationEquiv`; line 730 `coefficientDegreeEquiv`; line 748 `suspensionCohomologyEquiv`.

**Claim.** Every `def` or `instance` whose body or field is `sorry` is sorry'd data. `coefficientDegreeEquiv` and `suspensionCohomologyEquiv` also lost the section binder `[∀ n : ℤ, (shiftFunctor C n).Additive]`, so they assert an `≃+` without additive shifts.

**Witness.** Gate `sorry-data=22`. The worker's `signatures.md` for this head: `@coefficientDegreeEquiv : {C} → [Category C] → [Preadditive C] → [HasShift C ℤ] → … ≃+ …`, with no `Additive` binder.

**Repair.** Delete all 22 from `Suggested.lean`; each stays in the README as a construction target with its intended signature (G2.1–G2.2 for the pointed and Day structures, G4.0 for the quaternionic carriers, G2.4 for the shift and cohomology isomorphisms). Most of the spectral ones exist at the pin (R05).

## R04 (P2) — `set_option maxHeartbeats` in Suggested.lean

**Location.** `Suggested.lean` lines 333 and 355: "set_option maxHeartbeats 1000000 in", on `quaternionSpEmbeddedLieSubgroupData` and `quaternionSp_contMDiff_iff_comp_subtypeVal`.

**Claim.** `set_option` of any kind is forbidden.

**Witness.** Gate `set_option=2`, lines 333 and 355.

**Repair.** Delete the `QuaternionSpLieData` section (lines 289–372) and the chart block at lines 377–408; they are G4.0b chart APIs, not headlines, and the README keeps them. This also removes R09.

## R05 (P2) — Suggested.lean redeclares carriers the pinned Tau Ceti has; the README says the pin lacks them

**Location.** `Suggested.lean` line 499 `def PointedSSet := Under (Δ[0] : SSet)`; line 523 `def FiniteBijection := ℕ`; line 596 `SymmetricSequence`; line 665 `abbrev SymmetricSpectrum`; line 62 `IsHurewiczFibration`; lines 51 and 87 `MappingPathSpace`, `MappingPathFiber`. README line 3525: "it does not supply a category of spectra".

**Claim.** These objects exist at the pin with real bodies; the roadmap redeclares them, mostly with sorry'd instances. Its `IsHurewiczFibration` is a different definition (existence of a lifting function, where the pin's is continuity plus homotopy lifting).

**Witness.** Re-opened at Tau Ceti 2fd255d9: `TauCeti/AlgebraicTopology/SimplicialSet/Pointed/Basic.lean:33` `abbrev PointedSSet := Under (Δ[0] : SSet.{u})`; `Spectra/SymmetricSequence.lean:90`; `Spectra/SymmetricSpectrum.lean:82, 92`; `CategoryTheory/FiniteBijection.lean:45`; `Topology/Homotopy/HurewiczFibration/Basic.lean:58`; `MappingPath/Basic.lean:40`; `MappingPath/Fiber.lean:51, 177`.

**Repair.**
1. Delete the duplicates from `Suggested.lean`.
2. Add a "From Tau Ceti" supplier contract naming each pinned declaration: `PointedSSet` with its smash monoidal/symmetric instances (`Pointed/Smash/Basic.lean:65, 69`); `FiniteBijection` (`CategoryTheory/FiniteBijection.lean:45, 290, 344`); `SymmetricSequence` (`:90`); `SymmetricSequence.sphere` (`SymmetricSpectrum.lean:82`); `SymmetricSpectrum` with smash and internal hom (`:92–104`); `SymmetricSpectrum.free` and `freeEvaluationAdjunction` (`Spectra/Free.lean:174, 178`); `MappingPathSpace` (`:40`); `MappingPathFiber` and `mappingPathFiberConstHomeomorphPath` (`:51, 177`); `IsHurewiczFibration` with `isHurewiczFibration_iff_nonempty_liftingFunction` (`MappingPath/LiftingFunction.lean:172`); `HasHomotopyLiftingProperty.zeroSetSDR_liftingInclusion` (`Lifting/Relative.lean:44`).
3. In G2.1, G2.2 and G2.10, mark those parts as available at the pin.
4. Rewrite line 3525: the pin has symmetric spectra with smash, internal hom, free spectra and limits/colimits, but no stable model structure, stable homotopy category or Brown representation.

## R06 (P2) — No headline theorem stated; the statable Kan–Quillen headline is absent; non-statable headlines are not named

**Location.** `Suggested.lean` lines 31–42: "**This file is not the roadmap and is not exhaustive.** … The statements here suggest Lean forms for particular milestones". README lines 18–19 call the file a check of "selected carrier and interface shapes".

**Claim.** The file is an API catalogue: its only sorried theorems are three G4.0 API facts. The README's headlines are the Kan–Quillen model structure (statable at the pins, absent), the stable model structure on symmetric spectra, Brown representability on arbitrary CW complexes, the Milnor sequence, the generalized Thom isomorphism, Spanier–Whitehead duality and rational stable Hurewicz. The docstring names none of the non-statable ones.

**Witness.** The earlier probe elaborates under `import Mathlib` + `TauCeti.Topology.Category.TopCat.WeakEquivalence`: `∃ M : ModelCategory SSet.{0}` with cofibrations `= monomorphisms`, fibrations `= SSet.modelCategoryQuillen.fibrations`, weak equivalences `= TauCeti.TopCat.weakEquivalences.inverseImage SSet.toTop`. `TauCeti/Topology/Category/TopCat/WeakEquivalence.lean:50` is unchanged at the pin.

**Repair.**
1. Retitle the docstring "GeneralizedCohomology: target signatures".
2. State the Kan–Quillen headline, unless R07 gives it to HigherToposTheory.
3. List as not statable, each with the carrier it lacks: stable model structure (no stable equivalences on `TauCeti.SymmetricSpectrum`); Brown representability and the Milnor sequence (no category of cohomology theories on pointed CW complexes); Thom isomorphism (no generalized theory or orientation); Spanier–Whitehead duality and rational Hurewicz (no stable homotopy category).
4. Drop README lines 18–21.

## R07 (P2) — G2.1/G2.11 and HigherToposTheory both own Kan–Quillen, Bergner, Joyal and straightening

**Location.** README line 222: "First build the unpointed Kan–Quillen model structure". Line 669: "These simplicial-set, quasicategorical and operadic foundations are construction targets of this item"; G2.11 also covers the Bergner model (line 693), straightening (lines 955–1018) and the Joyal model (line 1059).

**Claim.** Two planned owners for the same objects.

**Witness.** HigherToposTheory at the head of its open pull request: line 9 "F2 | Kan complexes, their homotopy theory, and the Kan–Quillen model structure"; line 18 "L3 | … the Joyal model structure"; line 19 "L4 | straightening and unstraightening"; line 39 "the Bergner model structure … (Layer F3)". Its only GeneralizedCohomology citation is G2.1's realization product.

**Repair.** Settle one owner per object: either G2.1/G2.11 keep the objects, Scope says so and HigherToposTheory F2/F3/L3/L4 cite G2.1/G2.11; or G2.1/G2.11 cite HigherToposTheory F2, F3, L3 and L4 and keep only the spectral and module-specific instances, with that pull request named in the merge-order paragraph. Delete the duplicated construction prose on the non-owning side.

## R08 (P3) — Imports

**Location.** `Suggested.lean` lines 1–29: 25 `import Mathlib.*` lines and no `import Mathlib`.

**Claim.** The header must be the single line `import Mathlib`, followed only by the `TauCeti.*` modules used.

**Witness.** Gate `imports=1`, `mathlib-subimports=25`, `no-import-mathlib=1`; line 1 "import Mathlib.Topology.Homotopy.HomotopyGroup".

**Repair.** Write `import Mathlib`, then only the `TauCeti.*` modules still used after R03–R06 (for the Kan–Quillen headline, `TauCeti.Topology.Category.TopCat.WeakEquivalence`).

## R09 (P3) — statement-hygiene: a definition chooses its datum

**Location.** `Suggested.lean` lines 328–329: "let q := Classical.choose hex" in `quaternionSpSliceChartData`.

**Claim.** A definition's datum is fixed by choice rather than by a universal property or an argument.

**Witness.** Gate `statement-hygiene`, two P3 hits at lines 328 and 329.

**Repair.** Delete it with the R04 block; G4.0b keeps the slice chart as data of the embedded-subgroup construction.

## R10 (P3) — Padding and process comments in Suggested.lean

**Location.** Proved restatements closed by `rfl` or `ext; rfl` at lines 115, 120, 130, 135, 161, 167, 254, 492, 674, 678; line 357 closed by one `exact`; line 69 `IsHurewiczFibration.lift`; `example`s at lines 286, 411 and 621–623; thin definitions no headline uses (`StablePi`, `SpectralCohomology`, `cohomologyPullback`, `stagewisePhantoms`, the Clifford synonyms, `QuaternionGrassmannian`); process comments at line 465 "Delete this local specialization when AT4.6 supplies…" and line 513 "PR284-owned".

**Claim.** Padding and process text, not acceptance-test statements.

**Witness.** Each listed theorem's proof in the file is `rfl`, `ext; rfl` or one `exact`; the `example`s only confirm instances.

**Repair.** Delete all of them from `Suggested.lean`; the README keeps each statement as a target or Check.

## R11 (P3) — The realization-product comparison moved to AlgebraicTopology 4.5 with no old → new line; roadmaps still cite it here

**Location.** README line 33 "Stage4.5's simplicial-realization product comparison"; lines 236–242; `Suggested.lean` line 514 still declares `realizationProductKelleyComparison`.

**Claim.** A dropped id that other roadmaps cite needs an old → new line.

**Witness.** HigherToposTheory (open head) lines 197 and 9774, StableHomotopyKTheory (open head) line 236 and DGFloer on main line 156 cite "G2.1's `realizationProductKelleyComparison`". This pull request's AlgebraicTopology README has no such name (grep count 0).

**Repair.** Add to Scope: "G2.1's realization-product comparison (`realizationProductKelleyComparison`) → AlgebraicTopology Stage 4.5". Remove the Lean declaration (R03).

## R12 (P3) — README is not in TauCetiRoadmap form

**Location.** Line 1 "# Generalized cohomology, spectra and orientations", no Summary; line 23 "## Scope and suppliers"; items are numbered paragraphs hundreds of lines long (G2.11 lines 669–1505, G5.7 lines 3074–3373).

**Claim.** None of the required sections or per-target structure.

**Witness.** Counts are 0 each for `**Checks`, `*Needs:*`, `### Examples`, `### Dependencies` and `**Summary`; headings only at lines 23, 67, 138, 213, 1506, 1779, 2202, 3374 and 3470.

**Repair.** Restructure: title `# Roadmap: generalized cohomology, spectra and orientations`; Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build; `## Layer k` with `### k.n` subsections; API bullets and three or more discriminating Checks per definition, a `*Needs:*` line per target (ready Checks: G1.7's square-zero S¹ Check with the "2σ²=0 only" control, G3.6's S_ℚ→ΣHZ phantom); Examples and Dependencies per layer. Delete the Lean implementation instructions at lines 20–21 and 3101–3107.

## R13 (P3) — No locators at the claims; one cited source is too weak for the stated generality

**Location.** No G1–G5 target outside G2.11 carries a theorem- or page-level locator. Lines 3499–3500 cite "Cohen … Chapter 10: Brown representation" for G3.1's arbitrary-CW statement.

**Claim.** Every claim needs a locator, and the source must support the statement as written.

**Witness.** `CohenBMH` line 10035 (Thm 10.3, p. 282) gives the bijection only for finite based CW X; the arbitrary-CW form is `HatcherAT` line 19338 (Thm 4E.2, p. 449).

**Repair.** Add verified locators at the claims: G2.3 HSS Def 3.1.3, Prop 3.1.4 (p. 21), Thm 3.4.4 (p. 35); G2.6 HSS Ex 3.1.10 (p. 23), Def 5.6.1 (p. 61); G2.5 Hatcher Thm 4.23, Cor 4.24 (p. 360); G3.1 Hatcher Thm 4E.1–4E.2 (pp. 448–449); G5.1–G5.2 Cohen §10.8.3 (p. 332). Add Hatcher §4.2 to References.

## R14 (P3) — README and Suggested.lean disagree on names

**Location.** 90 of the 98 Lean declarations (for example `PointedSSet`, `coefficientDegreeEquiv`, `levelPermutation`) never appear in the README; about 60 backticked README names are declared nowhere (for example `connectiveSpectrumMapsToHA` line 1671, `stableBSpin_homotopyGroupsThroughEight` line 2322, `topCatIdentityForget`).

**Claim.** Every Lean name must appear in the README and every backticked name of this roadmap's own must be declared in `Suggested.lean`.

**Witness.** The earlier script compared every `def`/`theorem`/`instance` name in `Suggested.lean` with the README and every backticked README identifier with `Suggested.lean`; both files are byte-identical to that run.

**Repair.** After R03–R10 the Lean file holds only headlines, each named in the README; un-backtick the README-only names.

## R15 (P3) — Commit-pinned links, pull-request numbers and a broken relative link

**Location.** Gate `blob` at lines 39, 42, 3112, 3260, 3262; `prnum` at lines 39, 75, 241, 328, 2320, 2487; line 41 `../SpinRepresentations/README.md`.

**Claim.** Cite by roadmap name and section, never by commit link or pull-request number.

**Witness.** Line 3262 anchors `#k7-projective-torus-and-hopf-examples`; this pull request's ComplexKahlerGeometry heads that section "## Layer 7: projective, torus, Riemann-surface and Hopf examples (K7)" (line 2180) and #1398's head "## Layer 7: projective, torus, and Hopf examples" (line 2401), so the anchor is gone at both; the id survives as "### 7.1 … (K7.1)" (lines 2182 and 2403). SpinRepresentations is at `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/` on main, so the line-41 link is broken.

**Repair.** Cite by name only: "ComplexKahlerGeometry K1, K7.1"; "SpinGeometry G1.3"; "AlgebraicTopology 8.2"; "SmoothBundlesConnections B1.4"; "ComplexManifolds Milestones 1–2". Drop every pull-request number and fix the SpinRepresentations path.

## R16 (P3) — LaTeX delimiter outside a code span

**Location.** Line 3279: "specified compactifications V=K\A, Z=L\(A∩L), U=K\(A∪L), where".

**Claim.** `\(` outside a code span reads as a LaTeX delimiter.

**Witness.** Gate `latex=2`, both at line 3279.

**Repair.** Write `` `V=K∖A`, `Z=L∖(A∩L)`, `U=K∖(A∪L)` `` with the Unicode set difference inside code spans.

## R17 (P3) — Edits outside the pull request's roadmap folders

**Location.** `Completed/ArithmeticDirichletSeries/README.md` line 331: "`LFunctions` consumes this package and supplies its own character-specific continuation". `TauCetiRoadmap/SymplecticGeometry/README.md` line 77: "boundary and sign adapters consumed by HeegaardFloer and consumed by DGFloer".

**Claim.** Neither folder is one of this pull request's roadmap folders.

**Witness.** The brief's exclusion `git diff --stat origin/main...HEAD` lists exactly these two files, one line changed in each; the gate rerun's `outside-folder` list contains both.

**Repair.** Move both one-line edits to a pull request that owns those folders, or revert them here.

## Previous findings

- R01 — not repaired: line 37 "[HomotopySpheres Stage 3A](…/pull/284) | the native `CompactlyGenerated` inclusion…"; lines 75, 241, 328, 2320, 2487 "PR284"; `Suggested.lean` line 513 "PR284-owned".
- R02 — not repaired (CStarAlgebras and HilbertModules had already merged before the previous review): line 45 still links "…/pull/861", "…/pull/860", "[OperatorKTheory K5](…/pull/866)", still UPWARD.
- R03 — not repaired: `Suggested.lean` lines 246–751, 22 sorry'd `def`/`instance`, `coefficientDegreeEquiv` (line 730) without the shift-additivity binder.
- R04 — not repaired: `Suggested.lean` lines 333, 355 "set_option maxHeartbeats 1000000 in".
- R05 — not repaired: `Suggested.lean` line 499 "def PointedSSet := Under (Δ[0] : SSet)"; README line 3525 "it does not supply a category of spectra".
- R06 — not repaired: `Suggested.lean` line 32 "**This file is not the roadmap and is not exhaustive.**"; no headline stated.
- R07 — not repaired: line 222 "First build the unpointed Kan–Quillen model structure"; line 669 "…construction targets of this item".
- R08 — not repaired: `Suggested.lean` line 1 "import Mathlib.Topology.Homotopy.HomotopyGroup", 25 submodule imports.
- R09 — not repaired: `Suggested.lean` lines 328–329 "let q := Classical.choose hex".
- R10 — not repaired: `Suggested.lean` line 465 "Delete this local specialization when AT4.6 supplies…"; `rfl` restatements at lines 115–167, 254, 492, 674–678.
- R11 — not repaired: line 33 "Stage4.5's simplicial-realization product comparison"; `Suggested.lean` line 514 `realizationProductKelleyComparison`; no old → new line.
- R12 — not repaired: line 1 "# Generalized cohomology, spectra and orientations"; line 23 "## Scope and suppliers".
- R13 — not repaired: lines 3499–3500 "Cohen … Chapter 10: Brown representation"; no theorem-level locators in G1–G5.
- R14 — not repaired: 90 of 98 Lean names absent from the README.
- R15 — not repaired: gate `blob` lines 39, 42, 3112, 3260, 3262; `prnum` lines 39, 75, 241, 328, 2320, 2487; line 41 "../SpinRepresentations/README.md".
- R16 — not repaired: line 3279 "V=K\A, Z=L\(A∩L), U=K\(A∪L)".
- R17 — not repaired: `Completed/ArithmeticDirichletSeries/README.md` line 331 and `TauCetiRoadmap/SymplecticGeometry/README.md` line 77 still edited.

## Verified sound

**Change set.** `git diff --stat c9403e2 a96d197 -- TauCetiRoadmap/GeneralizedCohomology` is empty. The two commits since c9403e2 changed `TauCetiRoadmap/BordismFormalGroups/{README.md,Suggested.lean}` and `TauCetiRoadmap/LocalPurity/{README.md,Suggested.lean}` only; `lake-manifest.json` is unchanged (Tau Ceti 2fd255d9, Mathlib 1b1ccf4b).

**The changed folders against this roadmap.** LocalPurity mentions GeneralizedCohomology nowhere (README and Lean, grep count 0). BordismFormalGroups is a consumer: at this head its supplier contract (README lines 109–117) consumes G2's spectral model, G2.7, G3.3, G3.8, G3.9, G4's projective-bundle comparison, G4.3 and G5.3–G5.5/G5.7, and its line 463 consumes "G4's chosen complex orientation and finite projective-bundle theorem"; this README's lines 2108–2130 prove the projective-bundle theorem and KP^n/KP^∞ calculations here and leave formal laws and universality to BordismFormalGroups, which agrees. "BordismFormalGroups F6.5" (this README lines 62, 674, 1322, 1454, 3391) is still "### F6.5. Local group actions and completion comparisons" (line 2117), and it still consumes G2.11 (lines 170, 2133, 2569). The mentions of GeneralizedCohomology in the old and new BordismFormalGroups README are the same six citations, renumbered by line only. Nothing in the two edited folders changes what this README cites or what cites it.

**Gate (rerun on this head).** Same failures as the worker's gate: set_option=2, blob=5, latex=2, prnum=6, sorry-data=22, imports=1, mathlib-subimports=25, no-import-mathlib=1, statement-hygiene=2, dropped=2, depcheck=5; the bare rerun reports outside-folder=29 because it counts this pull request's other roadmap folders, and the brief's exclusion diff leaves the 2 of R17. The worker's targeted build passes (build=0).

**Dependency check (this head):**

```
UPWARD: GeneralizedCohomology (on main) -> HomotopySpheres (#45) at README lines [37]
UPWARD: GeneralizedCohomology (on main) -> OperatorKTheory (#9) at README lines [45]
UPWARD: GeneralizedCohomology (on main) -> StringOrientation (#11) at README lines [3419]
UPWARD: GeneralizedCohomology (on main) -> TangentialBordism (#14) at README lines [43]
CYCLE among: GeneralizedCohomology, HomotopySpheres, StringOrientation, TangentialBordism
depcheck: 239 roadmaps, 2353 edges, 5 problem(s)
```

The lines 3419 and 43 hits are false positives (R01, step 6); the other three are R01 and R02.

**Elaboration.** `lake env lean TauCetiRoadmap/GeneralizedCohomology/Suggested.lean` exits 0 with 25 `declaration uses sorry` warnings and nothing else.

**Binder check.** The worker's `signatures.md` for this head flags 11 declarations; the file and pins are identical to the earlier `#check @name` run, which stands: `coefficientDegreeEquiv` and `suspensionCohomologyEquiv` lost the shift-additivity binder (R03); `realizationProductKelleyComparison` keeps its adjunction hypothesis; the other eight drop only binders their types do not use.

**Cross-roadmap citations re-resolved at the current heads:**
- HomotopySpheres (open head) lines 82, 170, 508: consumes G4.0a–G4.0b and G5 item 6 (the cycle of R01).
- OperatorKTheory (open head) "## K5. Graded cycles and KK-groups" (line 1127) and consumer line 2332 (R02).
- CStarAlgebras Layer 5 (main line 1110) and HilbertModules H2/H4–H6 (main lines 179, 325, 356, 705).
- HigherToposTheory (open head) lines 9, 17–19, 37–40: F2 Kan–Quillen, F3 Bergner, L3 Joyal, L4 straightening (R07).
- ComplexKahlerGeometry at #1398's head: "## Layer 7: projective, torus, and Hopf examples" (line 2401), "### 7.1 Projective charts and orientation (K7.1)" (line 2403); at this pull request's head the same id at line 2182 behind a renamed anchor (R15).
- AlgebraicTopology at #1652's head: "## Layer 8: relative homotopy, Hurewicz, Whitehead, and ordinary representability" (line 2610), "### 8.2 Kan and cubical comparison" (line 2661): the id survives behind the renamed anchor (R15).
- SpinGeometry at #1674's head: "### 1.3 Adjoints, Morita evaluation and scalar trace (G1.3)" (line 252): the id survives behind the renamed anchor (R15).
- AlgebraicTopology Stage 4.5 (this pull request's head, lines 136–148) owns the compact-generation coreflection R01 repoints to.

**Library declarations re-opened at the pin (Tau Ceti 2fd255d9):** `TauCeti/AlgebraicTopology/SimplicialSet/Pointed/Basic.lean:33`; `Pointed/Smash/Basic.lean:65`; `Spectra/SymmetricSequence.lean:90`; `Spectra/SymmetricSpectrum.lean:82, 92`; `Spectra/Free.lean:174, 178`; `CategoryTheory/FiniteBijection.lean:45`; `Topology/Homotopy/HurewiczFibration/Basic.lean:58`; `MappingPath/Basic.lean:40`; `MappingPath/Fiber.lean:51, 177`; `MappingPath/LiftingFunction.lean:172`; `Lifting/Relative.lean:44`; `Topology/Category/TopCat/WeakEquivalence.lean:50`. Each line is the declaration R05 or R06 names.

**Overlaps.** Every item of the worker's overlap list was checked:
- #1807 and #1854: this README is identical at their heads and this one (diff of the folder's README = 0 lines), so there is nothing to order on this roadmap. #1187 (the pin bump) carries main's version of the README and conflicts only in `Suggested.lean`, which this pull request leaves identical to main's; the previous reviews passed this as no finding and it is unchanged.
- The four dropped anchors (ComplexKahlerGeometry K7 at #1398 and #1807, AlgebraicTopology Stage 8 at #1652, SpinGeometry G1 at #1674) are in R15; their ids survive at each head as listed above.
- No ids are dropped by this pull request; none is defined only by an open revision.
- Closest in vocabulary: HigherToposTheory's double ownership is R07; StableHomotopyKTheory's citation of `realizationProductKelleyComparison` is R11; TangentialBordism, HomotopySpheres and BordismFormalGroups are consumers (lines 43, 37/508, 109).

**Seeded sample.** The worker's sample found no targets by heading: the README has no target headings (R12). With 0 changed lines, no sampled target falls in a changed passage, and no new source was needed. The earlier seed-32 sample of 15 targets (G1.2, G1.3, G1.5, G1.7, G2.3, G2.7, G2.9, G2.10, G3.2, G3.3, G3.4, G3.5, G3.9, G4.3, G5.1) stands.

**Remarks on untouched text** (no R-number, no change requested, per the incremental rules):
- Seven backticked AlgebraicTopology names (line 35 `ordinaryEMUniversalClass` … `projectiveEMComparisons`, line 101, line 232 `simplicialGroupMooreHomotopyIso`) have grep count 0 in this pull request's AlgebraicTopology README; main has each.
- Line 1055 "HTTA.2.6.13" is an Example (`LurieHTT` line 38362); the recognition result is Prop A.2.6.15 (line 38368).
- Line 1246 "HTT5.2.7.4" recognizes localization functors (line 17361); the precomposition statement is Prop 5.2.7.12 (line 17500).
- Line 2043 cites "CharacteristicClasses C2.1's disc/sphere quotient"; the disk/sphere cell structure is C2.0 (line 858), C2.1 is the Thom pair.
- G4.0a (line 1844) consumes CharacteristicClasses C1.1b while CharacteristicClasses C7.3 consumes G4.0a: acyclic by item, two-way by roadmap; the rest belongs to CharacteristicClasses' review.

**Adversarial table.** Every statement is untouched by this change, so every row is carried from the earlier reports (r32, and the r36 row for the CharacteristicClasses C3.2 supplier), each re-read against the unchanged file.

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| G1.2 `Eⁿ(X)≃Ẽⁿ(X₊)`, split (r32) | X=∅; X=* | Eⁿ(∅)=0=Ẽⁿ(*); Eⁿ(*)=Eⁿ(*)⊕0 | holds | none |
| G1.3 MV, `δ(a∪b)=(−1)^p a∪δb` (r32) | U=V=X; degrees | δ=0, both sides 0; both in E^(p+q+1) | holds | none |
| G1.5 smash lift, `(U×V)⁺≃U⁺∧V⁺` (r32) | X=Y=S⁰; U=V=ℝ | 0→E(*)→E(*)³→E(*)²→0 split; (ℝ²)⁺=S²=S¹∧S¹ | holds | none |
| G1.7 `Eⁿ(S¹)≃Eⁿ(*)⊕E^(n−1)(*)`, σ²=0 (r32) | r=0; HZ; graded commutativity | Ẽⁿ(S⁰)=Eⁿ(*); H²(S¹)=0; σ²=−σ² gives only 2σ²=0 | holds | Check (R12) |
| G2.3 stable equivalences (r32) | λ:F₁S¹→F₀S⁰ | Map(λ,E)=E₀→ΩE₁ a w.e. for Ω-spectra; naive π₀ ⊕ℤ vs ℤ | agrees with HSS 3.1.3/3.1.4 | locator (R13) |
| G2.7 HA levels (r32) | A=0; A=ℤ; cyclic sign | π_*=0; π₀=ℤ; sign (−1)ⁿ | holds | none |
| G2.9 πᵢGL_k(ℝ) table (r32) | k=0…5; S⁰, S¹ clutching | π₃SO(4)=ℤ², SO(3)→SO ×2; [S¹,GL₂ℝ]=D∞; [S⁰,GL_k]: 4 maps vs 2 bundles | holds | none |
| G2.10 mapping-path fibre (r32) | f=const_b; θ₃ at s=1,4 | fibre ≅ `Path b k`; θ₃(1)=3, θ₃(4)=4 | holds | duplicates pin (R05) |
| G3.2 Yoneda/representing levels (r32) | E=HZ | [X,ΣⁿHZ]=Hⁿ(X;ℤ) | holds | none |
| G3.3 arbitrary-CW comparison (r32) | countable wedge of S⁰ | ∏E^q(*) both sides; ⊕-valued functor excluded by wedge axiom | holds | none |
| G3.4 Milnor sequence (r32) | Xᵢ=S¹, degree 2 | H¹=lim=0; H²=lim¹=ℤ₂/ℤ≠0 | holds | none |
| G3.5 open covers (r32) | ℝ, Uᵢ=(−i,i) | Tel≃ℝ≃* | holds | none |
| G3.6 phantom S_ℚ→ΣHZ (r32) | lim¹ | [S,ΣHZ]=0; lim¹=Ext¹(ℚ,ℤ)≠0 | holds | Check (R12) |
| G3.9 localization/completion (r32) | S[½]; HZ; HQ; H(ℤ/p^∞) | ℤ[½]; ℤ_p; 0; π₁ ℤ_p≠0, so f.g. needed | hypothesis present | none |
| G4.3 Thom isomorphism (r32) | rank 0; Möbius with HF₂, HZ | U=1; H̃¹(RP²;F₂)=F₂=H⁰(S¹;F₂); H̃¹(RP²;ℤ)=0≠ℤ | orientation needed, as stated | negative-control Check |
| G4.4 `U∪U=π*e∪U` (r32) | ε¹ over a point | H²(D¹,S⁰)=0, e=0 | holds | none |
| G5.1 S–W duality (r32) | Sⁿ; Σ∞ℂP^∞ | E^q(Sⁿ)=π_(n−q)E=E_(−q)(S^(−n)); ℂP^∞ not dualizable | holds | none |
| G2.1 Kan–Quillen (headline, r32) | Δ[0]→Δ[1]; ∂Δ[1]→Δ[0] | trivial cofibration; π₀ 2→1, not a w.e. | statable at pins | state it (R06) |
| G2.5 Freudenthal (headline, r32) | S¹→ΩS²; S² | π₁S¹→π₂S² onto; π₂S²≅π₃S³; π₃S²=ℤ→π₄S³=ℤ/2 onto | holds | locator (R13) |
| G3.1 Brown (headline, r32) | finite vs arbitrary CW | Hatcher 4E.2 all connected CW; Cohen 10.3 finite only | reference too weak | R13 |
| G5.6 rational Hurewicz (headline, r32) | n=1,2; n=0 | Λ[x₁]; ℚ[x₂]; π₀S⊗ℚ=ℚ | holds | none |
| `coefficientDegreeEquiv` (Lean, r32) | elaborated type | `Hom(S,E⟦q⟧) ≃+ Hom(S⟦−q⟧,E)`, no additivity binder | missing hypothesis | delete (R03) |
| `IsHurewiczFibration` (Lean, r32) | p=id; general p | both true for id; ∃ lifting function vs continuous ∧ HLP | different definition | delete (R05) |
| `quaternionFrameAction_preserves` (Lean, r32) | g unitary | vᴴ(gᴴg)w=vᴴw; `simp` does not close | true, not a headline | delete (R10) |
| `muHZThomEulerBaseChange` via CharacteristicClasses C3.2 `c_r=e(E_R)` (r36) | rank 0; tautological γ on ℂP¹ | rank 0: c₀=1 and e=zero-section pullback of U=1, both 1; γ: ⟨c₁(γ),[ℂP¹]⟩=−1 (C1.5 pins x=−h), ⟨e(γ_ℝ),[ℂP¹]⟩=−1 in the complex orientation | holds | none |
| G4 projective-bundle theorem consumed by BordismFormalGroups line 463 (new, consumer check) | r=1 line bundle L over B; r=0 | E*(P(L))=E*(B)·1 with x=0 relation x−π*a₁(L)=0, a₁(L)=x_L; r=0: P(V)=∅, E*(∅)=0, free on the empty basis | both roadmaps state the same object with this roadmap as owner | none |

## Not verifiable

Carried from the earlier reports; this re-review needed no new source.
- Adams, *Stable Homotopy and Generalised Homology*, Part III, cited for the G1.3–G1.6 conventions: commercial, no legal open copy (arXiv and author pages searched). The sign conventions were checked internally instead.
- Dold's countable disjoint-refinement lemma (G3.5): no locator is given, and Annals 1963 is behind JSTOR.
- Joachim (2001) and Hebestreit–Sagave: paywalled DOI pages; neither falls in a changed passage.

## Source issues

- none
