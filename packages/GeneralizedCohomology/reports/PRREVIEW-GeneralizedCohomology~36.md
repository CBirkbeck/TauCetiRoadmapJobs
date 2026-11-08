# Review of GeneralizedCohomology (pull request #1808 at c9403e2)

**Verdict:** needs changes

This is an incremental re-review. `TauCetiRoadmap/GeneralizedCohomology/README.md` and `Suggested.lean` are byte-identical to the previous head (d1a45bf). Outside this folder, the pull request changed only the CharacteristicClasses and ComplexKahlerGeometry folders. So none of the seventeen previous findings is repaired by an edit. R02 is narrower because CStarAlgebras and HilbertModules have since merged to main. The push gate still fails: set_option, sorry-data, imports, mathlib-subimports, statement-hygiene, blob, latex, prnum, dropped, depcheck and outside-folder. The ids R01–R17 are kept so that each can be traced to the previous report.

## R01 (P1) — Supply cycle through HomotopySpheres, a roadmap that may never be cited as a supplier

**Location.** README line 37: "[HomotopySpheres Stage 3A](…/pull/284) | the native `CompactlyGenerated` inclusion and compact-generation right adjoint; pointed convenient mapping spaces, suspension/loop, smash, mapping cone/Puppe, stable sphere stems and Freudenthal". The same supplier is cited at lines 75, 241, 328 ("PR284's convenient …"), 2320 and 2487 ("PR284 … §4B / Stage 4B"), and in `Suggested.lean` line 513 ("PR284-owned compact-generation right adjoint").

**Claim.** HomotopySpheres is on the list of roadmaps that may never be cited as suppliers. The dependency check reports the edge as UPWARD: this roadmap is on main, and HomotopySpheres is #45 in the merge order. The cycle is real: HomotopySpheres consumes this roadmap.

**Witness.** HomotopySpheres at the head of its open pull request, README line 506: "From TauCetiRoadmap.GeneralizedCohomology. G4.0a supplies the right-quaternionic-line carrier…". Gate: "CYCLE among: GeneralizedCohomology, HomotopySpheres, StringOrientation, TangentialBordism". The gate's `dropped` hits (lines 37 and 2320) are these citations.

**Repair.**
1. Delete the line-37 row and every PR284 citation.
2. Take the compact-generation coreflection `k`, its counit and `k(X×Y)` from AlgebraicTopology Stage 4.5. This pull request's AlgebraicTopology README, lines 136–148, owns them.
3. State the pointed convenient smash, mapping cone/Puppe and the stems `π_n S` here, as G2.5 targets.
   - G2.5 already proves Freudenthal.
   - Delete "compatibility with the sphere-only supplier theorem" from G2.5, and "the supplier's stabilized stems" from G2.5 and G3.8.
4. State the real space-level Bott loop chain with its Clifford comparison as a G5.0/G5.4 target, and record the move in Scope.
5. Delete "PR284-owned" from the Lean docstring.
6. Lines 3419 ("before StringOrientation defines λ and BString") and 43 ("structured PT and geometric bordism remain TangentialBordism") are depcheck false positives. Reword both in the consumer form the check accepts at line 46, for example "StringOrientation, a consumer, defines λ and BString after G5.0".

After step 1 there is no GeneralizedCohomology → HomotopySpheres edge, and the cycle needs that edge.

## R02 (P2) — Upward supplier OperatorKTheory, and pull-request links for two suppliers now on main

**Location.** README line 45: "[HilbertModules H2, H4–H6](…/pull/861), [CStarAlgebras C5](…/pull/860), [OperatorKTheory K5](…/pull/866) | complex Hilbert compact operators/spatial tensors, strong-topology unitary contractibility, regular functional calculus and graded Clifford APIs". Line 2649 has the same three: "APIs consume CStarAlgebras C5, HilbertModules H2/H4–H6 and OperatorKTheory K5".

**Claim.** Partly repaired, by merges outside this pull request: CStarAlgebras and HilbertModules are now on main, and the cited sections resolve there. OperatorKTheory is still an open pull request, at merge-order position #9, so a roadmap on main consumes an unmerged plan. The two merged suppliers are still linked by pull-request URL.

**Witness.** Depcheck on this head: `UPWARD: GeneralizedCohomology (on main) -> OperatorKTheory (#9) at README lines [45]`. On main: CStarAlgebras "## Layer 5: C*-tensor products…" (line 1110); HilbertModules "## H2." (line 179), "## H4." (325), "## H5." (356), "## H6." (705).

**Repair.**
1. Relink CStarAlgebras and HilbertModules by path: `../CStarAlgebras/README.md`, Layer 5 (5.1–5.5), and `../HilbertModules/README.md`, H2 and H4–H6.
2. For OperatorKTheory K5 ("Graded cycles and KK-groups", line 1127 at the head of its open pull request): state the graded Clifford parity reduction and its sign adapter (lines 2650–2652) as a G5.5 target and record the move in Scope. OperatorKTheory already lists this roadmap as a consumer (same head, line 2332), so after the move it cites G5.5 instead.
3. Rerun the depcheck until no OperatorKTheory line remains.

## R03 (P2) — Sorry'd data in Suggested.lean (22 declarations)

**Location.** `Suggested.lean`:
- line 246 `nativeSpinFourQuaternionHomeomorph`;
- line 391 `quaternionFrameGroupChartedSpace`;
- line 485 `quaternionProjectiveGrassmannianHomeomorph`;
- line 514 `realizationProductKelleyComparison`;
- lines 537–660, the pointed, finite-bijection, Day and sphere instances and defs;
- lines 698–709 `spectrumSmash`, `freeSpectrum`, `freeEvaluationEquiv`;
- line 730 `coefficientDegreeEquiv`;
- line 748 `suspensionCohomologyEquiv`.

**Claim.** Every `def` or `instance` whose body or field is `sorry` is sorry'd data. Two of them also have the wrong type. The elaborated types of `coefficientDegreeEquiv` and `suspensionCohomologyEquiv` have lost the section binder `[∀ n : ℤ, (shiftFunctor C n).Additive]`, so they assert an `≃+` without additive shifts.

**Witness.** Gate `sorry-data=22`. `signatures.md`: `@coefficientDegreeEquiv : {C} → [Category C] → [Preadditive C] → [HasShift C ℤ] → … ≃+ …`, with no `Additive` binder.

**Repair.** Delete all 22 from `Suggested.lean`. Each stays in the README as a construction target with its intended signature: G2.1–G2.2 for the pointed and Day structures, G4.0 for the quaternionic carriers, G2.4 for the shift and cohomology isomorphisms. Most of the spectral ones already exist at the pin (R05).

## R04 (P2) — `set_option maxHeartbeats` in Suggested.lean

**Location.** `Suggested.lean` lines 333 and 355: "set_option maxHeartbeats 1000000 in", on `quaternionSpEmbeddedLieSubgroupData` and `quaternionSp_contMDiff_iff_comp_subtypeVal`.

**Claim.** `set_option` of any kind is forbidden.

**Witness.** Gate `set_option=2`, at lines 333 and 355.

**Repair.** Delete the `QuaternionSpLieData` section (lines 289–372) and the chart block at lines 377–408. These are G4.0b chart APIs, not headlines, and the README keeps them. The deletion also removes R09.

## R05 (P2) — Suggested.lean redeclares carriers the pinned Tau Ceti has; the README says the pin lacks them

**Location.**
- `Suggested.lean`:
  - line 499 `def PointedSSet := Under (Δ[0] : SSet)`;
  - line 523 `def FiniteBijection := ℕ`;
  - line 596 `SymmetricSequence`;
  - line 665 `abbrev SymmetricSpectrum`;
  - line 62 `IsHurewiczFibration`;
  - lines 51 and 87 `MappingPathSpace`, `MappingPathFiber`.
- README line 3525: "it does not supply a category of spectra".

**Claim.** These objects already exist at the pin with real bodies. The roadmap redeclares them, mostly with sorry'd instances. Its `IsHurewiczFibration` is a different definition: existence of a lifting function, where the pin's is continuity plus homotopy lifting.

**Witness.** Pinned Tau Ceti:
- `TauCeti.PointedSSet` (`TauCeti/AlgebraicTopology/SimplicialSet/Pointed/Basic.lean:33`);
- `TauCeti.SymmetricSpectrum` (`TauCeti/AlgebraicTopology/Spectra/SymmetricSpectrum.lean:92`);
- `TauCeti.IsHurewiczFibration` (`TauCeti/Topology/Homotopy/HurewiczFibration/Basic.lean:58`);
- `TauCeti.MappingPathFiber` (`TauCeti/Topology/Homotopy/MappingPath/Fiber.lean:51`).

**Repair.**
1. Delete the duplicates from `Suggested.lean`.
2. Add a "From Tau Ceti" supplier contract naming each pinned declaration:
   - `PointedSSet` and its smash monoidal/symmetric instances (`Pointed/Smash/Basic.lean:65, 69`);
   - `FiniteBijection` (`CategoryTheory/FiniteBijection.lean:45, 290, 344`);
   - `SymmetricSequence` (`Spectra/SymmetricSequence.lean:90`);
   - `SymmetricSequence.sphere` (`Spectra/SymmetricSpectrum.lean:82`);
   - `SymmetricSpectrum` with its smash and internal hom (`:92–104`);
   - `SymmetricSpectrum.free` and `freeEvaluationAdjunction` (`Spectra/Free.lean:174, 178`);
   - `MappingPathSpace` (`MappingPath/Basic.lean:40`);
   - `MappingPathFiber` and `mappingPathFiberConstHomeomorphPath` (`MappingPath/Fiber.lean:51, 177`);
   - `IsHurewiczFibration` with `isHurewiczFibration_iff_nonempty_liftingFunction` (`MappingPath/LiftingFunction.lean:172`);
   - `HasHomotopyLiftingProperty.zeroSetSDR_liftingInclusion` (`Topology/Homotopy/Lifting/Relative.lean:44`).
3. In G2.1, G2.2 and G2.10, mark those parts as available at the pin.
4. Rewrite line 3525: the pin has symmetric spectra with smash, internal hom, free spectra and limits/colimits, but no stable model structure, stable homotopy category or Brown representation.

## R06 (P2) — No headline theorem stated; the statable Kan–Quillen headline is absent; non-statable headlines are not named

**Location.** `Suggested.lean` lines 31–42: "**This file is not the roadmap and is not exhaustive.** … The statements here suggest Lean forms for particular milestones". README lines 18–19 call the file a check of "selected carrier and interface shapes".

**Claim.** The file is an API catalogue: its only sorried theorems are three G4.0 API facts. The README's headlines are the following.
- The Kan–Quillen model structure: statable at the pins, and absent.
- The stable model structure on symmetric spectra.
- Brown representability on arbitrary CW complexes.
- The Milnor sequence.
- The generalized Thom isomorphism.
- Spanier–Whitehead duality.
- Rational stable Hurewicz.

The docstring names none of the non-statable ones.

**Witness.** The previous review's probe elaborates under `import Mathlib` + `TauCeti.Topology.Category.TopCat.WeakEquivalence`. It states `∃ M : ModelCategory SSet.{0}` with cofibrations `= monomorphisms`, fibrations `= SSet.modelCategoryQuillen.fibrations`, and weak equivalences `= TauCeti.TopCat.weakEquivalences.inverseImage SSet.toTop`. The pins are unchanged.

**Repair.**
1. Retitle the docstring "GeneralizedCohomology: target signatures".
2. State the Kan–Quillen headline, unless R07 gives it to HigherToposTheory.
3. List as not statable, each with the carrier it lacks:
   - stable model structure: no stable equivalences on `TauCeti.SymmetricSpectrum`;
   - Brown representability and the Milnor sequence: no category of cohomology theories on pointed CW complexes;
   - Thom isomorphism: no generalized theory or orientation;
   - Spanier–Whitehead duality and rational Hurewicz: no stable homotopy category.
4. Drop README lines 18–21.

## R07 (P2) — G2.1/G2.11 and HigherToposTheory both own Kan–Quillen, Bergner, Joyal and straightening

**Location.** README line 222: "First build the unpointed Kan–Quillen model structure". Line 669: "These simplicial-set, quasicategorical and operadic foundations are construction targets of this item". G2.11 also covers the Bergner model (line 693), straightening (lines 955–1018) and the Joyal model (line 1059).

**Claim.** Two planned owners for the same objects.

**Witness.** HigherToposTheory, at the head of its open pull request (f522659):
- line 9: "F2 | … the Kan–Quillen model structure";
- line 18: "L3 | … the Joyal model structure";
- line 39: "simplicial categories, the Bergner model structure … (Layer F3)";
- line 40: "… straightening …".

Its only GeneralizedCohomology citation (line 197) is G2.1's realization product.

**Repair.** Settle one owner per object, by either of these:
- G2.1/G2.11 keep the objects, the Scope section says so, and HigherToposTheory F2/F3/L3/L4 cite G2.1/G2.11;
- G2.1/G2.11 cite HigherToposTheory F2, F3, L3 and L4 and keep only the spectral and module-specific instances, and the description names that pull request in its merge-order paragraph.

Delete the duplicated construction prose on the non-owning side.

## R08 (P3) — Imports

**Location.** `Suggested.lean` lines 1–29: 25 `import Mathlib.*` lines, and no `import Mathlib`.

**Claim.** The header must be the single line `import Mathlib`, followed only by the `TauCeti.*` modules used.

**Witness.** Gate `imports=1`, `mathlib-subimports=25`, `no-import-mathlib=1`. Line 1 reads "import Mathlib.Topology.Homotopy.HomotopyGroup".

**Repair.** Write `import Mathlib`, then only the `TauCeti.*` modules still used after R03–R06. For the Kan–Quillen headline that is `TauCeti.Topology.Category.TopCat.WeakEquivalence`.

## R09 (P3) — statement-hygiene: a definition chooses its datum

**Location.** `Suggested.lean` lines 328–329: "let q := Classical.choose hex" in `quaternionSpSliceChartData`.

**Claim.** A definition's datum is fixed by choice, not by a universal property or an argument.

**Witness.** Gate `statement-hygiene`, two P3 hits, at lines 328 and 329.

**Repair.** Delete it together with the R04 block. G4.0b keeps the slice chart as data of the embedded-subgroup construction.

## R10 (P3) — Padding and process comments in Suggested.lean

**Location.**
- Proved restatements closed by `rfl` or `ext; rfl`: lines 115, 120, 130, 135, 161, 167, 254, 492, 674, 678.
- Line 357: closed by `exact` with one library lemma.
- Line 69: `IsHurewiczFibration.lift`.
- `example`s at lines 286, 411 and 621–623.
- Thin definitions that no headline uses: `StablePi`, `SpectralCohomology`, `cohomologyPullback`, `stagewisePhantoms`, the Clifford synonyms, `QuaternionGrassmannian` and others.
- Process comments: line 465 "Delete this local specialization when AT4.6 supplies…"; line 513 "PR284-owned".

**Claim.** These are padding and process text, not acceptance-test statements.

**Witness.** Each listed theorem's proof in the file is `rfl`, `ext; rfl` or one `exact`. The `example`s only confirm instances.

**Repair.** Delete all of them from `Suggested.lean`. The README keeps each statement as a target or Check.

## R11 (P3) — The realization-product comparison moved to AlgebraicTopology 4.5 with no old → new line; roadmaps still cite it here

**Location.**
- README line 33: "Stage4.5's simplicial-realization product comparison".
- Lines 236–242: "Consume AT Stage 4.5's simplicial-realization product comparison".
- `Suggested.lean` line 514 still declares `realizationProductKelleyComparison`.

**Claim.** A dropped id that other roadmaps cite needs an old → new line.

**Witness.** Roadmaps citing "G2.1's `realizationProductKelleyComparison`":
- HigherToposTheory, open head, README lines 197 and 9774 (*Needs:*);
- StableHomotopyKTheory, open head, line 236;
- DGFloer on main, line 156.

This pull request's AlgebraicTopology README contains no such name (grep count 0).

**Repair.** Add to Scope: "G2.1's realization-product comparison (`realizationProductKelleyComparison`) → AlgebraicTopology Stage 4.5". Remove the Lean declaration (R03).

## R12 (P3) — README is not in TauCetiRoadmap form

**Location.**
- Line 1: "# Generalized cohomology, spectra and orientations", with no Summary.
- Line 23: "## Scope and suppliers".
- Items are numbered paragraphs hundreds of lines long: G2.11 is lines 669–1505, G5.7 is lines 3074–3373.

**Claim.** The README has none of the required sections or per-target structure.

**Witness.** The counts are 0 each for `**Checks`, `*Needs:*`, `### Examples`, `### Dependencies` and `**Summary`. Headings at this head: lines 23, 67, 138, 213, 1506, 1779, 2202, 3374 and 3470 only.

**Repair.**
1. Restructure the README:
   - title `# Roadmap: generalized cohomology, spectra and orientations`;
   - Summary, Scope and ownership, Conventions, Exact supplier contracts and How to read the build;
   - `## Layer k` with `### k.n` subsections.
2. Give each definition API bullets and three or more discriminating Checks, and each target a `*Needs:*` line. Ready Checks: G1.7's square-zero S¹ Check with the "2σ²=0 only" control, and G3.6's S_ℚ→ΣHZ phantom.
3. End each layer with Examples and Dependencies.
4. Delete the Lean implementation instructions at lines 20–21 and 3101–3107.

## R13 (P3) — No locators at the claims; one cited source is too weak for the stated generality

**Location.** No G1–G5 target outside G2.11 carries a theorem- or page-level locator. Lines 3499–3500 cite "Cohen … Chapter 10: Brown representation" for G3.1's arbitrary-CW statement.

**Claim.** Every claim needs a locator, and the cited source must support the statement as written.

**Witness.** `CohenBMH` line 10035 (Thm 10.3, p. 282) gives the bijection only for finite based CW X. The arbitrary-CW form is `HatcherAT` line 19338 (Thm 4E.2, p. 449).

**Repair.** Add verified locators at the claims:
- G2.3: HSS Def 3.1.3, Prop 3.1.4 (p. 21), Thm 3.4.4 (p. 35);
- G2.6: HSS Ex 3.1.10 (p. 23), Def 5.6.1 (p. 61);
- G2.5: Hatcher Thm 4.23, Cor 4.24 (p. 360);
- G3.1: Hatcher Thm 4E.1–4E.2 (pp. 448–449);
- G5.1–G5.2: Cohen §10.8.3 (p. 332).

Add Hatcher §4.2 to References.

## R14 (P3) — README and Suggested.lean disagree on names

**Location.** 90 of the 98 Lean declarations, for example `PointedSSet`, `coefficientDegreeEquiv` and `levelPermutation`, never appear in the README. About 60 backticked README names are declared nowhere, for example `connectiveSpectrumMapsToHA` (line 1671), `stableBSpin_homotopyGroupsThroughEight` (line 2322) and `topCatIdentityForget`.

**Claim.** Every Lean name must appear in the README, and every backticked name of this roadmap's own must be declared in `Suggested.lean`.

**Witness.** A script compared every `def`/`theorem`/`instance` name in `Suggested.lean` with the README, and every backticked README identifier with `Suggested.lean`. Both files are unchanged since that run.

**Repair.** After R03–R10 the Lean file holds only headlines, each named in the README. Un-backtick the README-only names.

## R15 (P3) — Commit-pinned links, pull-request numbers and a broken relative link

**Location.**
- Gate `blob` at lines 39, 42, 3112, 3260 and 3262.
- Gate `prnum` at lines 39, 75, 241, 328, 2320 and 2487.
- Line 41: `../SpinRepresentations/README.md`.

**Claim.** Cite by roadmap name and section, never by commit link or pull-request number.

**Witness.**
- Line 3262 anchors `#k7-projective-torus-and-hopf-examples`. This pull request's own ComplexKahlerGeometry now heads that section "## Layer 7: projective, torus, Riemann-surface and Hopf examples (K7)" (line 2180), so the anchor is gone here too. The id survives as "### 7.1 … (K7.1)" (line 2182).
- SpinRepresentations is at `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/` on main, so the line-41 relative link is broken.

**Repair.** Cite by name only:
- "ComplexKahlerGeometry K1, K7.1" (its line 488 maps K7.1 → 7.1);
- "SpinGeometry G1.3";
- "AlgebraicTopology 8.2";
- "SmoothBundlesConnections B1.4";
- "ComplexManifolds Milestones 1–2".

Drop every pull-request number, and fix the SpinRepresentations path.

## R16 (P3) — LaTeX delimiter outside a code span

**Location.** Line 3279: "specified compactifications V=K\A, Z=L\(A∩L), U=K\(A∪L), where".

**Claim.** `\(` outside a code span reads as a LaTeX delimiter.

**Witness.** Gate `latex=2`, both hits at line 3279.

**Repair.** Write `` `V=K∖A`, `Z=L∖(A∩L)`, `U=K∖(A∪L)` ``, using the Unicode set difference ∖ inside code spans.

## R17 (P3) — Edits outside the pull request's roadmap folders

**Location.**
- `Completed/ArithmeticDirichletSeries/README.md` line 331: "`LFunctions` consumes this package and supplies its own character-specific continuation".
- `TauCetiRoadmap/SymplecticGeometry/README.md` line 77: "boundary and sign adapters consumed by HeegaardFloer and consumed by DGFloer".

**Claim.** Neither folder is one of this pull request's roadmap folders.

**Witness.** Gate `outside-folder=2`. The brief's exclusion `git diff --stat` lists exactly these two files, with 1 line changed in each.

**Repair.** Move both one-line edits to a pull request that owns those folders, or revert them here.

## Previous findings

- R01 — not repaired: line 37 "[HomotopySpheres Stage 3A](…/pull/284) | the native `CompactlyGenerated` inclusion…"; lines 75, 241, 328, 2320, 2487 "PR284"; `Suggested.lean` line 513 "PR284-owned".
- R02 — partly repaired: CStarAlgebras and HilbertModules merged to main and resolve there. Line 45 still links "…/pull/861", "…/pull/860", and "[OperatorKTheory K5](…/pull/866)" is still UPWARD.
- R03 — not repaired: `Suggested.lean` lines 246–751, 22 sorry'd `def`/`instance`, including `coefficientDegreeEquiv` (line 730) without the shift-additivity binder.
- R04 — not repaired: `Suggested.lean` lines 333, 355 "set_option maxHeartbeats 1000000 in".
- R05 — not repaired: `Suggested.lean` line 499 "def PointedSSet := Under (Δ[0] : SSet)"; README line 3525 "it does not supply a category of spectra".
- R06 — not repaired: `Suggested.lean` line 32 "**This file is not the roadmap and is not exhaustive.**"; no headline stated.
- R07 — not repaired: line 222 "First build the unpointed Kan–Quillen model structure"; line 669 "…construction targets of this item".
- R08 — not repaired: `Suggested.lean` line 1 "import Mathlib.Topology.Homotopy.HomotopyGroup", with 25 submodule imports.
- R09 — not repaired: `Suggested.lean` lines 328–329 "let q := Classical.choose hex".
- R10 — not repaired: `Suggested.lean` line 465 "Delete this local specialization when AT4.6 supplies…"; the `rfl` restatements at lines 115–167, 254, 492, 674–678.
- R11 — not repaired: line 33 "Stage4.5's simplicial-realization product comparison"; `Suggested.lean` line 514 `realizationProductKelleyComparison`; no old → new line.
- R12 — not repaired: line 1 "# Generalized cohomology, spectra and orientations"; line 23 "## Scope and suppliers".
- R13 — not repaired: lines 3499–3500 "Cohen … Chapter 10: Brown representation"; no theorem-level locators in G1–G5.
- R14 — not repaired: 90 of the 98 Lean names are absent from the README.
- R15 — not repaired: gate `blob` lines 39, 42, 3112, 3260, 3262; `prnum` lines 39, 75, 241, 328, 2320, 2487; line 41 "../SpinRepresentations/README.md".
- R16 — not repaired: line 3279 "V=K\A, Z=L\(A∩L), U=K\(A∪L)".
- R17 — not repaired: `Completed/ArithmeticDirichletSeries/README.md` line 331 and `TauCetiRoadmap/SymplecticGeometry/README.md` line 77 still edited.

## Verified sound

**Change set.** `git diff d1a45bf c9403e2 -- TauCetiRoadmap/GeneralizedCohomology` is empty. Since d1a45bf the pull request changed only `TauCetiRoadmap/CharacteristicClasses/{README.md,Suggested.lean}` and `TauCetiRoadmap/ComplexKahlerGeometry/{README.md,Suggested.lean}`. `lake-manifest.json` is unchanged, so the pins are the same. This roadmap's README is identical at the heads of #1807, #1854 and this pull request (`roadmaps show --pr`, diff = the header line only). So there is no conflict on this roadmap, and #1187 conflicts only with main's identical `Suggested.lean`.

**Gate (rerun on this head).** Same failures as the worker's gate:
- set_option=2, blob=5, latex=2, prnum=6, sorry-data=22;
- imports=1, mathlib-subimports=25, no-import-mathlib=1;
- statement-hygiene=2, dropped=2, depcheck=5.

The bare rerun reports outside-folder=27 because it counts this pull request's other roadmap folders. The brief's exclusion diff leaves 2 (R17). Build: the worker's targeted build passes (build=0).

**Dependency check (this head):**

```
UPWARD: GeneralizedCohomology (on main) -> HomotopySpheres (#45) at README lines [37]
UPWARD: GeneralizedCohomology (on main) -> OperatorKTheory (#9) at README lines [45]
UPWARD: GeneralizedCohomology (on main) -> StringOrientation (#11) at README lines [3419]
UPWARD: GeneralizedCohomology (on main) -> TangentialBordism (#14) at README lines [43]
CYCLE among: GeneralizedCohomology, HomotopySpheres, StringOrientation, TangentialBordism
depcheck: 238 roadmaps, 2374 edges, 5 problem(s)
```

The CStarAlgebras and HilbertModules lines of the previous run are gone: both are now on main. The lines 3419 and 43 hits are false positives (R01).

**Elaboration.** `lake env lean TauCetiRoadmap/GeneralizedCohomology/Suggested.lean` exits 0 with 25 `declaration uses sorry` warnings and nothing else.

**Binder check.** `signatures.md` flags 11 declarations. The file and pins are identical to the previous review, whose `#check` run stands:
- `coefficientDegreeEquiv` and `suspensionCohomologyEquiv` lost the shift-additivity binder (R03);
- `realizationProductKelleyComparison` keeps its adjunction hypothesis;
- the other eight drop only binders their types do not use.

**Citations into the folders this change touched:**
- CharacteristicClasses numbering is unchanged at this head. The cited items exist with the cited content:
  - C1.2: C1.2a compact supports (line 585) and C1.2b's |Sing X|→X counit (line 675);
  - C1.5 torus classifier (line 775);
  - C2.1 Thom pair and Thom class (line 933);
  - C2.4 embedding Gysin (line 1171);
  - C2.5 fibrewise embedding and tubular comparison (line 1177);
  - C3.2 `c_r=e(E_R)` (line 1338).
- CharacteristicClasses' edits in C1–C3 since d1a45bf are renamings and locators only.
- ComplexKahlerGeometry K1 and K7.1 survive at this head as "Layer 1" and "### 7.1 Projective charts and orientation (K7.1)" (line 2182), with the old → new map at line 488. 7.1 still owns the real atlas, the complex orientation and the `OnePoint ℂ ≃ ℂP¹` upgrade used by G4.0b and lines 3403/3442. The only breakage is the commit-pinned anchor (R15).

**Other citations resolved:**
- CStarAlgebras Layer 5 (main line 1110) and HilbertModules H2/H4–H6 (main lines 179, 325, 356, 705).
- OperatorKTheory K5 (open head, line 1127) and its consumer line 2332.
- HomotopySpheres open head, lines 82, 169, 506, which consume G4.0a/G4.0b and G5 item 6.
- HigherToposTheory open head, lines 9, 18, 37–40, 197, 9772–9774; StableHomotopyKTheory open head, line 236; DGFloer main, line 156.
- AlgebraicTopology 8.2 (line 2649 at the head of its open revision) and SpinGeometry 1.3 (G1.3) (line 252 at the head of its open revision): the ids survive behind the renamed anchors.

**Library declarations re-opened at the pin:**
- `TauCeti/AlgebraicTopology/SimplicialSet/Pointed/Basic.lean:33`;
- `TauCeti/AlgebraicTopology/Spectra/SymmetricSequence.lean:90`;
- `TauCeti/AlgebraicTopology/Spectra/SymmetricSpectrum.lean:82, 92`;
- `TauCeti/CategoryTheory/FiniteBijection.lean:45`;
- `TauCeti/Topology/Homotopy/HurewiczFibration/Basic.lean:58`;
- `TauCeti/Topology/Homotopy/MappingPath/Basic.lean:40`;
- `TauCeti/Topology/Homotopy/MappingPath/Fiber.lean:51, 177`;
- `TauCeti/Topology/Homotopy/Lifting/Relative.lean:44`;
- `TauCeti/Topology/Category/TopCat/WeakEquivalence.lean:50`.

All are present as R05 and R06 use them.

**Seeded sample.** The worker's sample found no targets by heading: the README has no target headings (R12). With 0 changed lines, no sampled target falls in a changed passage. The previous review's seed-32 sample of 15 targets (G1.2, G1.3, G1.5, G1.7, G2.3, G2.7, G2.9, G2.10, G3.2, G3.3, G3.4, G3.5, G3.9, G4.3, G5.1) stands.

**Overlaps.** Every `overlaps.md` item was checked:
- the three conflicting pull requests do not differ on this roadmap;
- the four dropped anchors are in R15, and their ids survive at each head;
- no ids are dropped by this pull request;
- HigherToposTheory's double ownership is R07.

**Remarks on untouched text.** No R-number and no change requested, per the incremental rules:
- Seven backticked AlgebraicTopology names (line 35 `ordinaryEMUniversalClass` … `projectiveEMComparisons`, line 101, line 232 `simplicialGroupMooreHomotopyIso`) have grep count 0 in this pull request's AlgebraicTopology README; main has each of them.
- Line 1055 "HTTA.2.6.13" is an Example (isomorphisms form a perfect class, `LurieHTT` line 38362). The recognition result is Prop A.2.6.15 (line 38368).
- Line 1246 "HTT5.2.7.4" recognizes localization functors (line 17361). The precomposition statement is Prop 5.2.7.12 (line 17500).
- Line 2043 cites "CharacteristicClasses C2.1's disc/sphere quotient". The disk/sphere cell structure is CharacteristicClasses C2.0 (line 858); C2.1 is the Thom pair (E,E∖0).
- G4.0a (line 1844) consumes CharacteristicClasses C1.1b, while CharacteristicClasses C7.3 (its lines 2235, 2239) consumes G4.0a. This is acyclic by item but two-way by roadmap. This change removed the G4.0b half; the rest belongs to CharacteristicClasses' review.

**Adversarial table.** The rows are carried forward from the previous report (r32) for the statements this change leaves untouched, which is every statement. One row is added for the GeneralizedCohomology statement that consumes a supplier item edited in this change.

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
| `muHZThomEulerBaseChange` via CharacteristicClasses C3.2 `c_r=e(E_R)` (new) | rank 0; tautological γ on ℂP¹ | rank 0: c₀=1 and e=zero-section pullback of U=1, both 1; γ: ⟨c₁(γ),[ℂP¹]⟩=−1 (C1.5 pins x=−h), ⟨e(γ_ℝ),[ℂP¹]⟩=−1 in the complex orientation | holds; supplier edit changed no convention | none |

## Not verifiable

These are carried from the previous report. This re-review needed no new source.
- Adams, *Stable Homotopy and Generalised Homology*, Part III, cited for the G1.3–G1.6 conventions: commercial, no legal open copy (arXiv and author pages searched). The sign conventions were checked internally instead.
- Dold's countable disjoint-refinement lemma (G3.5): no locator is given, and Annals 1963 is behind JSTOR.
- Joachim (2001) and Hebestreit–Sagave: paywalled DOI pages, and neither falls in a changed passage.

## Source issues

- none
