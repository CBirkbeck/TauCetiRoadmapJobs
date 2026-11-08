# Review of GeneralizedCohomology (pull request #1808 at d1a45bf)

**Verdict:** needs changes

This pull request changes only `TauCetiRoadmap/GeneralizedCohomology/README.md` in this folder (926 insertions, 84 deletions: G2.11 moved in from BordismFormalGroups F6.5, the realization-product comparison moved out to AlgebraicTopology Stage 4.5). This is a full review, so `Suggested.lean` (unchanged from main) is reviewed too. The push gate fails on this head (set_option, sorry-data, imports, mathlib-subimports, statement-hygiene, blob, latex, prnum, dropped, depcheck, outside-folder). Every gate failure is listed below.

## R01 (P1) — Supply cycle with HomotopySpheres, a roadmap that may not be cited as a supplier

**Location.** `TauCetiRoadmap/GeneralizedCohomology/README.md` line 37: "[HomotopySpheres Stage 3A](…/pull/284) | the native `CompactlyGenerated` inclusion and compact-generation right adjoint; pointed convenient mapping spaces, suspension/loop, smash, mapping cone/Puppe, stable sphere stems and Freudenthal". The same supplier is used at lines 75, 241 and 328 ("PR284's convenient category"), line 2320 ("Bott/stable-O loop-chain theorem of HomotopySpheres PR284 §4B") and line 2487 ("PR284 Stage 4B's real loop-space Bott chain"), and in the docstring at `Suggested.lean` line 513 ("PR284-owned compact-generation right adjoint").

**Claim.** HomotopySpheres is on the list of roadmaps that may never be cited as suppliers. The dependency check also reports it as UPWARD (#71 in the merge order, while this roadmap is on main), and the cycle is real.

**Witness.** HomotopySpheres at the head of its open revision (`rev/1287`, README line 506) consumes "From TauCetiRoadmap.GeneralizedCohomology. G4.0a…", while this README consumes HomotopySpheres at Stage 3A and §4B. The gate prints "CYCLE among: GeneralizedCohomology, HomotopySpheres, StringOrientation, TangentialBordism". The gate's `dropped` hits (lines 37 and 2320) are these same citations.

**Repair.**
1. Delete the line-37 row and every PR284 citation.
2. Take the compact-generation coreflection `k`, its counit and the product `k(X×Y)` from AlgebraicTopology Stage 4.5. This pull request's AlgebraicTopology README (lines 136–148) already owns them.
3. State the pointed convenient smash, mapping cone/Puppe and the stable stems here, as G2.5 targets. G2.5 already proves Freudenthal for (k−1)-connected CW spaces with homotopy excision, so delete "compatibility with the sphere-only supplier theorem" (G2.5) and "the supplier's stabilized stems" (G3.8 and the end of G2.5), and define the stems as `π_n S`.
4. State the real space-level Bott loop chain with its Clifford comparison as a G5.0/G5.4 target, recording the move in Scope. It cannot be taken from TopologicalKTheory: that roadmap's README at this head (line 108) itself cites HomotopySpheres §4A–4B for it.
5. Delete "PR284-owned" from the Lean docstring.

After these changes the depcheck has no GeneralizedCohomology → HomotopySpheres edge, and the cycle needs that edge.

The other two names in the cycle line are depcheck false positives. Line 3419 ("before StringOrientation defines λ and BString") is ordering prose, and line 43 ("structured PT and geometric bordism remain TangentialBordism") is a boundary column. Neither consumes anything. Reword both in the consumer form the check already accepts on line 46 ("TangentialBordism consumes this interface"), for example "StringOrientation, a consumer, defines λ and BString after G5.0", so that the gate passes.

## R02 (P2) — Upward suppliers HilbertModules, CStarAlgebras, OperatorKTheory

**Location.** README line 45: "[HilbertModules H2, H4–H6](…/pull/861), [CStarAlgebras C5](…/pull/860), [OperatorKTheory K5](…/pull/866) | complex Hilbert compact operators/spatial tensors, strong-topology unitary contractibility, regular functional calculus and graded Clifford APIs". Also line 2649: "APIs consume CStarAlgebras C5, HilbertModules H2/H4–H6 and OperatorKTheory K5".

**Claim.** This roadmap is on main. These three are open roadmap pull requests at merge-order positions #7–#9, so a main roadmap would depend on unmerged plans.

**Witness.** The dependency check reports `UPWARD: GeneralizedCohomology (on main) -> CStarAlgebras (#7)`, `-> HilbertModules (#8)` and `-> OperatorKTheory (#9)`, all at README line 45. None of the three folders exists on main.

**Repair.** Repoint each item to Mathlib or to a roadmap on main, or state it here as a G5.5 target (the notion moves down; record the move in Scope):
- compact operators → CompactOperators (on main);
- functional calculus → Mathlib `IsometricContinuousFunctionalCalculus`, `ContinuousLinearMap.instStarOrderedRingRCLike`, already named in G5.5;
- Hilbert C*-modules → Mathlib `CStarModule`;
- spatial tensors, Kuiper-type contractibility and the graded Clifford K5 parity → G5.5 targets.

Rerun the depcheck until no UPWARD line remains.

## R03 (P2) — Sorry'd data in Suggested.lean (22 declarations)

**Location.** `Suggested.lean`:
- line 246 `nativeSpinFourQuaternionHomeomorph` (continuity fields `sorry`);
- line 391 `quaternionFrameGroupChartedSpace`;
- line 485 `quaternionProjectiveGrassmannianHomeomorph`;
- line 514 `realizationProductKelleyComparison`;
- lines 537–656 `pointedSSetMonoidal`, `finiteBijectionMonoidal`, `finiteBijectionSymmetric`, `pointedSSetSymmetric`, `symmetricSequenceConvolutions`, `symmetricSequenceUnitConvolution`, `pointedSmashLeft/RightPreserves`, `sequenceActionEquivalence`, `sequenceDayBraiding`, `symmetricSequenceSymmetric`, `symmetricSphere`, `sphereIsComm`;
- lines 698–709 `spectrumSmash`, `freeSpectrum`, `freeEvaluationEquiv`;
- line 730 `coefficientDegreeEquiv`;
- line 748 `suspensionCohomologyEquiv`.

**Claim.** Every `def` and `instance` whose body (or a field) is `sorry` is sorry'd data, which the acceptance-test rules forbid. Two of these also have a wrong type. `#check` shows that `coefficientDegreeEquiv` and `suspensionCohomologyEquiv` lost the section binder `[∀ n : ℤ, (shiftFunctor C n).Additive]`. Their `≃+` is then asserted without additive shifts, so an autoequivalence acting non-additively on hom groups is admitted.

**Witness.** Gate `sorry-data=22`. The elaborated type is `@coefficientDegreeEquiv : {C} → [Category C] → [Preadditive C] → [HasShift C ℤ] → (sphere E : C) → (q : ℤ) → SpectralCohomology E sphere q ≃+ StablePi sphere E (-q)`, with no `Additive` binder.

**Repair.** Delete all 22 from `Suggested.lean`. Each stays in the README as a construction target with its intended signature: G2.1–G2.2 for the pointed and Day structures, G4.0 for the quaternionic carriers, G2.4 for the shift and cohomology isomorphisms. Most of the spectral ones already exist at the pin (R05).

## R04 (P2) — `set_option maxHeartbeats` in Suggested.lean

**Location.** `Suggested.lean` lines 333 and 355: `set_option maxHeartbeats 1000000 in`, on `quaternionSpEmbeddedLieSubgroupData` and `quaternionSp_contMDiff_iff_comp_subtypeVal`.

**Claim.** `set_option` of any kind is forbidden. A statement that needs it is to be restated or removed.

**Witness.** Gate `set_option=2`.

**Repair.** Delete the whole `QuaternionSpLieData` section (lines 289–372), together with `QuaternionSpEuclideanModel`, `quaternionMatrixStdRealCoordinates`, `quaternionFrameGroupChartedSpace` and `quaternionFrameGroup_contMDiff_iff` (lines 377–408). These are G4.0b chart APIs, not headline theorems, and they belong in the README. Deleting them also removes the R09 hit.

## R05 (P2) — Suggested.lean redeclares carriers that the pinned Tau Ceti already has; the README says the pin lacks them

**Location.**
- `Suggested.lean` line 499 `def PointedSSet := Under (Δ[0] : SSet)`; line 523 `def FiniteBijection := ℕ`; line 596 `SymmetricSequence`; line 665 `abbrev SymmetricSpectrum := Mod SymmetricSequence symmetricSphere.X`; line 62 `IsHurewiczFibration`; lines 51 and 87 `MappingPathSpace`/`MappingPathFiber`; line 97 `mappingPathFiberConstHomeomorphPath`.
- README line 3525: "it does not supply a category of spectra".
- README G2.10: "Own `IsHurewiczFibration p`", "Own `zeroSetSDR_liftingInclusion`".

**Claim.** The pinned Tau Ceti already declares these objects with real bodies. `Suggested.lean` redeclares them under `TauCetiRoadmap.GeneralizedCohomology`, mostly with sorry'd instances. Its `IsHurewiczFibration` is a different definition (existence of a lifting function), whereas the pinned one is continuity plus homotopy lifting for every test space in a universe. The README's closing sentence about the pin is false, and the README never cites the pinned names.

**Witness (pinned Tau Ceti):**

| Suggested.lean declaration | Already at the pin |
| --- | --- |
| `PointedSSet` | `TauCeti.PointedSSet` (`AlgebraicTopology/SimplicialSet/Pointed/Basic.lean:33`) |
| `pointedSSetMonoidal`, `pointedSSetSymmetric` | its monoidal and symmetric instances (`Pointed/Smash/Basic.lean:65, 69`) |
| `FiniteBijection` and its instances | `TauCeti.FiniteBijection` with instances (`CategoryTheory/FiniteBijection.lean:45, 290, 344`) |
| `SymmetricSequence` | `TauCeti.SymmetricSequence` (`Spectra/SymmetricSequence.lean:90`) |
| `symmetricSphere`, `sphereIsComm` | `SymmetricSequence.sphere` (`Spectra/SymmetricSpectrum.lean:82`) |
| `SymmetricSpectrum` | `TauCeti.SymmetricSpectrum` (`Spectra/SymmetricSpectrum.lean:92`) |
| `spectrumSmash` | the smash and internal hom (`Spectra/SymmetricSpectrum.lean:95–104`; `Mod.monoidalCategory`, `CategoryTheory/Monoidal/Mod/Tensor.lean:121`) |
| `freeSpectrum`, `freeEvaluationEquiv` | `TauCeti.SymmetricSpectrum.free` and `freeEvaluationAdjunction` (`Spectra/Free.lean:174, 178`) |
| `MappingPathSpace` | `TauCeti.MappingPathSpace` (`MappingPath/Basic.lean:40`) |
| `MappingPathFiber` | `TauCeti.MappingPathFiber` (`MappingPath/Fiber.lean:51`) |
| `mappingPathFiberConstHomeomorphPath` | `TauCeti.mappingPathFiberConstHomeomorphPath` (`MappingPath/Fiber.lean:177`) |
| `IsHurewiczFibration` | `TauCeti.IsHurewiczFibration` (`HurewiczFibration/Basic.lean:58`), lifting-function form `isHurewiczFibration_iff_nonempty_liftingFunction` (`MappingPath/LiftingFunction.lean:172`) |
| (README G2.10) `zeroSetSDR_liftingInclusion` | `HasHomotopyLiftingProperty.zeroSetSDR_liftingInclusion` (`Topology/Homotopy/Lifting/Relative.lean:44`) |

**Repair.**
- Delete these declarations from `Suggested.lean`.
- Add a "From Tau Ceti" supplier contract naming each pinned declaration with its file. In G2.1, G2.2 and G2.10, mark those parts as available at the pin, so the remaining targets are the missing ones.
- Replace the sentence at README line 3525 with a correct one: the pin has symmetric spectra with their smash, internal hom, free spectra and limits/colimits, but no stable model structure, stable homotopy category or Brown representation.

## R06 (P2) — No headline theorem is stated; a statable headline is absent; the docstring does not name the non-statable ones

**Location.**
- `Suggested.lean` lines 31–42: the module docstring ("**This file is not the roadmap and is not exhaustive.** … suggest Lean forms for particular milestones…").
- README lines 18–19: "`Suggested.lean` checks selected carrier and interface shapes; … its admitted constructions are targets."

**Claim.** The file is an API catalogue. Of its 98 declarations, the only sorried theorems are three G4.0 API facts: `spinFourCalibratedPair_vectorAction`, `quaternionFrameAction_preserves` and `quaternionFrameGroup_contMDiff_iff`. None of them is a headline.

The headline results the README is built to reach (its introduction, G2.1, G2.3, G3.1, G3.4, G4.3, G5.1, G5.6) are:
- the Kan–Quillen model structure;
- the stable model structure on symmetric spectra;
- Brown representability on arbitrary CW complexes;
- the Milnor sequence;
- the generalized Thom isomorphism;
- Spanier–Whitehead/Atiyah duality;
- rational stable Hurewicz.

The Kan–Quillen model structure is statable at the pins and is absent. The docstring does not name which of the others are not statable or what each lacks.

**Witness.** This statement elaborates under `import Mathlib` plus `import TauCeti.Topology.Category.TopCat.WeakEquivalence` (scratch probe; the only warning is `sorry`):

```lean
open CategoryTheory HomotopicalAlgebra SSet.modelCategoryQuillen in
theorem exists_kanQuillenModelCategory :
    ∃ M : ModelCategory SSet.{0},
      M.categoryWithCofibrations.cofibrations = MorphismProperty.monomorphisms SSet.{0} ∧
      M.categoryWithFibrations.fibrations = fibrations SSet.{0} ∧
      M.categoryWithWeakEquivalences.weakEquivalences =
        TauCeti.TopCat.weakEquivalences.inverseImage SSet.toTop := by
  sorry
```

It uses Mathlib `SSet.modelCategoryQuillen` (`AlgebraicTopology/SimplicialSet/CategoryWithFibrations.lean:36, 70, 76`), `ModelCategory` (`AlgebraicTopology/ModelCategory/Basic.lean:43`) and Tau Ceti `TopCat.weakEquivalences` (`Topology/Category/TopCat/WeakEquivalence.lean:50`).

**Repair.**
- Rewrite the docstring as "GeneralizedCohomology: target signatures". It should say that README.md is the roadmap and this file states its headline theorems against the pinned APIs.
- State the Kan–Quillen headline above, unless R07 hands it to another owner.
- List as not statable, each with its missing carrier:
  - stable model structure: no stable equivalences on `TauCeti.SymmetricSpectrum`;
  - Brown representability and the Milnor sequence: no category of axiomatic cohomology theories on pointed CW complexes;
  - Thom isomorphism: no generalized theory or orientation;
  - Spanier–Whitehead duality and rational Hurewicz: no stable homotopy category.
- Drop the README lines 18–21 sentence that makes Suggested.lean a carrier/interface check.

## R07 (P2) — G2.1/G2.11 and HigherToposTheory both own the Kan–Quillen, Bergner and Joyal model structures and straightening

**Location.**
- README line 669: "11. **Enriched, quasicategorical and monoidal foundations.** These simplicial-set, quasicategorical and operadic foundations are construction targets of this item". Within G2.11, the Bergner model (line 693 "Construct the Bergner model on this category"), straightening (lines 955–1018) and the Joyal model (line 1059 "This constructs the Joyal model").
- G2.1 line 222: "First build the unpointed Kan–Quillen model structure".

**Claim.** These objects now have two planned owners. G2.11 is new in this pull request, moved here from BordismFormalGroups F6.5.

**Witness.** HigherToposTheory (open pull request #1901, another author's new roadmap) owns them in its README:
- line 9: Layer F2, "the Kan–Quillen model structure";
- line 228: Layer F3, "Bergner's model structure on simplicial categories | HTT A.3.2.4";
- line 230: Layer L3, "Joyal model structure, Quillen equivalent to Bergner's";
- line 232: Layer L4, "Straightening and unstraightening | HTT 3.2.0.1".

**Repair.** Settle one owner per object.
- Either: G2.1 and G2.11 keep them, and the Scope section says so explicitly. This roadmap is on main and Tau Ceti work on G2 has landed. HigherToposTheory F2/F3/L3/L4 then cite GeneralizedCohomology G2.1/G2.11.
- Or: G2.1 and G2.11 cite HigherToposTheory F2, F3, L3 and L4 by layer, keep only the spectral and module-specific instances, and the pull request names #1901 in its merge-order paragraph.

In either case, delete the duplicated construction prose from whichever side is not the owner.

## R08 (P3) — Imports

**Location.** `Suggested.lean` lines 1–29: 25 `import Mathlib.*` submodule lines, with no `import Mathlib`.

**Witness.** Gate `imports=1`, `mathlib-subimports=25`, `no-import-mathlib=1`. The probe replaced the header with `import Mathlib` plus the four `TauCeti.*` lines and elaborated the unchanged body with `sorry` warnings only.

**Repair.** Use the single line `import Mathlib`, then only the `TauCeti.*` modules still used after R03–R06. For the Kan–Quillen headline that is `TauCeti.Topology.Category.TopCat.WeakEquivalence`.

## R09 (P3) — statement-hygiene: a definition chooses its datum

**Location.** `Suggested.lean` lines 328–329: `let q := Classical.choose hex`, `let Φ := Classical.choose (Classical.choose_spec hex)` in `quaternionSpSliceChartData`.

**Witness.** Gate `statement-hygiene`, two P3 hits.

**Repair.** Delete the declaration with the R04 block. In the README, G4.0b keeps the slice chart as data of the embedded-subgroup construction.

## R10 (P3) — Padding and process comments in Suggested.lean

**Location.**
- Proved restatements of definitions, closed by `rfl` or `ext; rfl`: `mappingPathFiberConstHomeomorphPath_apply`/`_symm_apply` (lines 115, 120), the `…LoopSpace` versions (130, 135), `mappingPathProjection_comp_inclusion` (161), `mappingPathEndpoint_comp_inclusion` (167), `nativeSpinFourQuaternionHomeomorph_apply` (254), `quaternionProjectiveGrassmannianHomeomorph_toEquiv` (492), `levelMap_id`/`levelMap_comp` (674, 678).
- `quaternionSp_contMDiff_iff_comp_subtypeVal` (357): `exact` with one library lemma.
- `IsHurewiczFibration.lift` (69): the pinned lifting-function equivalence.
- `example`s at lines 286, 411, 621–623, which only confirm instances.
- Thin definitions with no headline using them: `StablePi`, `SpectralCohomology`, `SpectralHomology`, `cohomologyPullback`, `externalProductClass`, `stagewisePhantoms`, `finiteDualEvaluation`/`Coevaluation` (`ExactPairing` restated), `IntegerGradedCofunctor`, `RealHilbertComplexification`, `hilbertComplexificationInner`/`Norm`, the Clifford synonyms, `QuaternionGrassmannian` and its topology, `quaternionHermitian`, `quaternionFrameAction`.
- Process comments: line 465 "Delete this local specialization when AT4.6 supplies its generic quotient-topology instance"; line 513 "PR284-owned".

**Witness.** Each of the first group is closed by `rfl` or by one library lemma, as written in the file. The one-tactic probe `simp [quaternionHermitian, quaternionFrameAction]` does not close `quaternionFrameAction_preserves`, but that is a unitary-matrix API fact, not a headline.

**Repair.** Delete all of these from `Suggested.lean`; the README keeps each statement as a target or Check.

## R11 (P3) — The realization-product comparison moved to AlgebraicTopology 4.5 without an old → new line; open roadmaps still cite it here

**Location.**
- README line 33: "Stage4.5's simplicial-realization product comparison |K×L|≃k(|K|×|L|)".
- README lines 236–242: "Consume AT Stage 4.5's simplicial-realization product comparison".
- `Suggested.lean` line 514 still declares `realizationProductKelleyComparison`.

**Witness.** Two open roadmaps cite the old owner:
- HigherToposTheory (#1901) README line 198: "G2.1's `realizationProductKelleyComparison` … for the simplicial clause of HTT 7.1.2.1";
- StableHomotopyKTheory (#1227) README §1.9 line 236: "as GeneralizedCohomology G2.1's `realizationProductKelleyComparison`".

The AlgebraicTopology README at this head names no Lean declaration for it.

**Repair.** Add one line in Scope: "G2.1's realization-product comparison (`realizationProductKelleyComparison`) → AlgebraicTopology Stage 4.5". Remove the declaration from `Suggested.lean` (R03), so the citing roadmaps follow the move.

## R12 (P3) — README is not in TauCetiRoadmap form

**Location.**
- Line 1: "# Generalized cohomology, spectra and orientations", with no `**Summary.**` paragraph.
- Line 23: "## Scope and suppliers"; there are no `## Scope and ownership`, `## Exact supplier contracts` or `## How to read the build` sections.
- Every target is a numbered paragraph. A single item can run hundreds of lines: G2.11 is lines 669–1505, G5.7 lines 3074–3373.
- There are zero `**Checks.**` lists, zero `*Needs:*` lines and no `### Examples` or `### Dependencies`.
- Implementation instructions: lines 20–21 "Suggested implementation homes are `TauCeti/AlgebraicTopology/Spectra/`"; line 3102 "define the named, instance-reducible identity witness `topCatIdentityForget` once in a single module: `HasForget₂ TopCat TopCat` with `forget₂ := 𝟭 TopCat` and `forget_comp := rfl`".

**Witness.** A count over the README gives 0 matches each for `**Checks`, `*Needs:*`, `### Examples`, `### Dependencies` and `**Summary`.

**Repair.**
- Restructure as `# Roadmap: generalized cohomology, spectra and orientations` with a Summary, Scope and ownership, Conventions, Exact supplier contracts (From Mathlib / From Tau Ceti / From TauCetiRoadmap.X) and How to read the build.
- Turn G1–G5 into `## Layer k` with `### k.n` subsections.
- Give each definition its API bullets and at least three discriminating Checks, and each target a `*Needs:*` line. For example, G1.7 has the S¹ ideal square-zero Check and the "2σ²=0 only" negative control. G3.6 has the S_ℚ→ΣHZ phantom.
- End each layer with Examples and Dependencies.
- Delete the Lean implementation instructions (lines 20–21 and 3101–3107). Split G2.11 and G5.7 into subsections.

## R13 (P3) — No locators at the claims; one cited source does not support the stated generality

**Location.** No target in G1–G5 carries a theorem- or page-level locator; the README has no "Theorem n" locators at all. The only locators are HTT/HA numbers inside G2.11 and section ranges in References (line 3472 "Symmetric spectra … §§1–5"; line 3499 "Cohen … Chapter 10: Brown representation…"; Hatcher "§§4.1, 4.3 and 4.E").

**Witness.**
- G3.1 states Brown representability on **arbitrary** connected CW complexes. Cohen Thm 10.3 (`CohenBMH` line 10035, printed p. 282) states the bijection only for finite based CW X. The arbitrary-CW form is Hatcher Thm 4E.2 (`HatcherAT` line 19338, p. 449).
- G2.5's Freudenthal and homotopy-excision statements are Hatcher Cor 4.24 and Thm 4.23 (p. 360, §4.2), which is not among the cited §§4.1, 4.3, 4.E.

**Repair.** Add the locator at each claim. Verified locators:
- G2.3: HSS Def 3.1.3 and Prop 3.1.4 (p. 21), Thm 3.4.4 (p. 35).
- G2.6: HSS Example 3.1.10 (p. 23), Def 5.6.1 (p. 61).
- G2.5: Hatcher Thm 4.23, Cor 4.24 (p. 360).
- G3.1: Hatcher Thm 4E.1, 4E.2 (pp. 448–449).
- G5.1–G5.2: Cohen §10.8.3 (p. 332).

Add the remaining locators the same way, and add Hatcher §4.2 to References.

## R14 (P3) — README and Suggested.lean disagree on names

**Location.**
- 90 of the 98 Lean declarations, for example `PointedSSet`, `SymmetricSpectrum`, `coefficientDegreeEquiv`, `quaternionFrameAction`, `levelPermutation`, `stagewisePhantoms`, never appear in the README.
- About 60 backticked names of this roadmap's own are declared nowhere: `connectiveSpectrumMapsToHA` (line 1671), `spectrumPostnikovConvergence`, `stableBSpin_homotopyGroupsThroughEight` (line 2322), `stableBSpin_hopfGenerator_cTwo`, `quaternionicHopfSphereHomeomorph`, `realMixedCliffordIndexClassification`, `fibrewiseMU_to_HZ_homologyComparison`, `topCatIdentityForget`.

**Witness.** A script compared every `def`/`theorem`/`instance` name in `Suggested.lean` with the README text, and every backticked identifier in the README with `Suggested.lean`.

**Repair.** After R03–R10 the Lean file holds only headlines, and each must appear in the README. Un-backtick README-only names, or write them in italics as prose names, unless `Suggested.lean` declares them.

## R15 (P3) — Commit-pinned links, pull-request numbers and a broken relative link

**Location.**
- Gate `blob` at lines 39, 42, 3112, 3260 and 3262 (links to `…/TauCetiRoadmap/blob/<sha>/…`).
- Gate `prnum` at lines 39 ("ComplexManifolds PR279", "#279's"), 75, 241, 328, 2320 and 2487.
- Line 45 links three pull requests.
- Line 41 links `../SpinRepresentations/README.md`; on main that roadmap is at `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/`.

**Witness.** The anchors in three of these links are renamed by open revisions: `#k7-projective-torus-and-hopf-examples` (ComplexKahlerGeometry, #1398), `#stage-8-…` (AlgebraicTopology, #1652) and `#g1-negative-metric-…` (SpinGeometry, #1674). The ids themselves survive at those heads as labels: "7.1 … (K7.1)" at `rev/1398` line 2273, "8.2 Kan and cubical comparison" with the simplicial-group Kan statement at `rev/1652` lines 2600/2617, and "1.3 … (G1.3)" at `rev/1674` line 252.

**Repair.** Cite by roadmap name and section only: "ComplexKahlerGeometry K1, K7.1", "SpinGeometry G1.3", "AlgebraicTopology Stage 8.2", "SmoothBundlesConnections B1.4", "ComplexManifolds Milestones 1–2". Drop every PR number (the PR284 ones go with R01) and fix the SpinRepresentations path.

## R16 (P3) — LaTeX delimiter outside a code span

**Location.** Line 3279: "specified compactifications V=K\A, Z=L\(A∩L), U=K\(A∪L), where".

**Witness.** Gate `latex=2`: `\(` is read as a LaTeX delimiter.

**Repair.** Write `` `V=K∖A`, `Z=L∖(A∩L)`, `U=K∖(A∪L)` `` with the Unicode set difference ∖ inside code spans.

## R17 (P3) — Edits outside the pull request's roadmap folders

**Location.**
- `Completed/ArithmeticDirichletSeries/README.md` line 331 ("`LFunctions` consumes this package and supplies its own character-specific continuation").
- `TauCetiRoadmap/SymplecticGeometry/README.md` line 77 ("boundary and sign adapters consumed by HeegaardFloer and consumed by DGFloer").

**Witness.** Gate `outside-folder=2`. Neither folder is among this pull request's roadmap folders.

**Repair.** Move both one-line edits to a pull request that owns those folders, or revert them here.

## Verified sound

**Gate and dependency check.** The gate was re-read and the dependency check re-run on this head. Output:

```
UPWARD: GeneralizedCohomology (on main) -> CStarAlgebras (#7) at README lines [45]
UPWARD: GeneralizedCohomology (on main) -> HilbertModules (#8) at README lines [45]
UPWARD: GeneralizedCohomology (on main) -> HomotopySpheres (#71) at README lines [37]
UPWARD: GeneralizedCohomology (on main) -> OperatorKTheory (#9) at README lines [45]
UPWARD: GeneralizedCohomology (on main) -> StringOrientation (#11) at README lines [3419]
UPWARD: GeneralizedCohomology (on main) -> TangentialBordism (#14) at README lines [43]
CYCLE among: GeneralizedCohomology, HomotopySpheres, StringOrientation, TangentialBordism
depcheck: 240 roadmaps, 2462 edges, 7 problem(s)
```

Lines 3419 and 43 are false positives (R01). The other suppliers named are on main: AlgebraicTopology, TopologicalKTheory, CharacteristicClasses, ComplexKahlerGeometry, ComplexManifolds, SmoothBundlesConnections, GeometricTopology, SpinGeometry, BordismFormalGroups, EllipticCohomology, and RepresentationTheory/{SpinRepresentations, LieGroups, CompactGroups}. Consumers named only as consumers (DGFloer, RiemannianGeometry, IndexTheory, PositiveScalarCurvature) are not supplier edges.

**Elaboration.** `lake env lean TauCetiRoadmap/GeneralizedCohomology/Suggested.lean` exits 0 with 25 `sorry` warnings and nothing else. A scratch copy under `import Mathlib`, with the four `TauCeti.*` imports and `TauCeti.Topology.Category.TopCat.WeakEquivalence` (built first with `lake build`), elaborates the same body.

**Binder check.** `#check` was run on the 11 declarations flagged as having lost a binder:
- `realizationProductKelleyComparison` keeps its adjunction hypothesis; the flag was a false lead.
- `coefficientDegreeEquiv` and `suspensionCohomologyEquiv` lost `[∀ n, (shiftFunctor C n).Additive]` (R03).
- The other eight drop only `[Preadditive C]`, `[HasShift C ℤ]` or `[MonoidalCategory C]` binders that their types do not use.

**Cross-roadmap citations resolved:**
- AlgebraicTopology Stage 4.5 owns `k` and the realization product at this head (README lines 136–148); Stage 8 owns `simplicialGroupKan` (line 1914 here, line 1667 on main).
- SpinGeometry G1 `cliffordScalarTrace`: main line 233.
- ComplexKahlerGeometry `## K7.`: main and head line 1405.
- HomotopySpheres `rev/1287` line 506 consumes GeneralizedCohomology G4.0a.
- TopologicalKTheory head line 108 cites HomotopySpheres §4A–4B.
- HigherToposTheory #1901 lines 9, 197–198, 228–232; StableHomotopyKTheory #1227 lines 16, 236, 248.
- The GeneralizedCohomology README is byte-identical at the heads of #1807, #1854 and this pull request, so there is no conflict on this roadmap. #1187's conflict in `GeneralizedCohomology/Suggested.lean` is with main's file, which this pull request leaves unchanged. The PR description states the order #1101 → #1807 → this.

**Library declarations opened at the pins.** Tau Ceti:
- `AlgebraicTopology/Spectra/SymmetricSpectrum.lean:82, 92, 95–104`
- `Spectra/SymmetricSequence.lean:90`
- `Spectra/Free.lean:174, 178`
- `Spectra/SphereMonoid.lean:60, 91`
- `SimplicialSet/Pointed/Basic.lean:33`
- `Pointed/Smash/Basic.lean:65, 69`
- `CategoryTheory/FiniteBijection.lean:45, 290, 344`
- `CategoryTheory/Monoidal/Mod/Tensor.lean:121`
- `Topology/Homotopy/MappingPath/Basic.lean:40, 48, 55`
- `MappingPath/Fiber.lean:51, 157, 177`
- `MappingPath/LiftingFunction.lean:172, 267`
- `HurewiczFibration/Basic.lean:58, 90`
- `HurewiczFibration/FiberInclusion.lean:263`
- `Lifting/Relative.lean:44`
- `SerreFibration/Basic.lean:153`
- `Topology/Category/TopCat/WeakEquivalence.lean:50`
- `LinearAlgebra/CliffordAlgebra/Spin/Real/Four.lean` (`realSpinFourEquivQuaternionUnitaryProd`)
- `LinearAlgebra/CliffordAlgebra/RealForm/Basic.lean` (`realCliffordForm`)
- `Geometry/Lie/Subgroup/Embedded.lean` (`EmbeddedLieSubgroupData`)

Mathlib:
- `AlgebraicTopology/SimplicialSet/CategoryWithFibrations.lean:36, 70, 76`
- `AlgebraicTopology/ModelCategory/Basic.lean:43`
- `AlgebraicTopology/EilenbergSteenrod.lean:50` (`TopPair.HomologyPretheory`)
- `Geometry/Manifold/WhitneyEmbedding.lean:132`
- `AlgebraicTopology/Reedy/Basic.lean`
- `AlgebraicTopology/SimplicialNerve.lean`
- `Topology/Compactification/OnePoint/Sphere.lean`
- `Topology/Compactification/OnePoint/ProjectiveLine.lean`
- `CategoryTheory/Action/Continuous.lean`
- `Analysis/InnerProductSpace/Positive.lean`

All of these exist as the README or the Lean file uses them, except where R05 records duplication.

**Source sample.** Fifteen targets were drawn with seed 32 from the 42 numbered items: G1.2, G1.3, G1.5, G1.7, G2.3, G2.7, G2.9, G2.10, G3.2, G3.3, G3.4, G3.5, G3.9, G4.3, G5.1. None carries its own locator (R13). Each was checked against a legal text where one exists: HSS (arXiv), Hatcher (author page), Cohen (author page) and HTT (author page), at the locators in R13. HTT locators touched by R07 were checked too: Thm 2.2.1.2 (p. 92), Thm 4.2.4.1 and Lemma 4.2.4.3 (p. 275), and Prop 4.2.4.4 (p. 276; hypotheses: u: C[S]→C an equivalence, A combinatorial simplicial model category). All four match their G2.11 uses at lines 970–1018 and 1140–1178.

**Adversarial table.**

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| G1.2 `Eⁿ(X)≃Ẽⁿ(X₊)`, split `Eⁿ(X)≃Eⁿ(*)⊕Ẽⁿ(X)` | X=∅; X=* | Eⁿ(∅)=0 and Ẽⁿ(∅₊)=Ẽⁿ(*)=0; Eⁿ(*)=Eⁿ(*)⊕0 | holds | none |
| G1.3 MV, `δ(a|∪b)=(−1)^p a∪δb` | U=V=X; degree count | (r,−r) surjective so δ=0, both sides 0; both sides in E^(p+q+1)(X) | holds | none |
| G1.5 unique smash lift, `(U×V)⁺≃U⁺∧V⁺` | X=Y=S⁰; U=V=ℝ | wedge 3 pts, product 4, smash S⁰: 0→E(*)→E(*)³→E(*)²→0 split; (ℝ²)⁺=S²=S¹∧S¹ | holds | none |
| G1.7 `Eⁿ(S¹)≃Eⁿ(*)⊕E^(n−1)(*)`, σ²=0 | r=0; E=HZ; graded commutativity only | Ẽⁿ(S⁰)=Eⁿ(*); H²(S¹)=0; σ²=−σ² gives only 2σ²=0 | holds; the negative control is correct | make it a Check (R12) |
| G2.3 stable equivalences via Ω-spectra | λ:F₁S¹→F₀S⁰ | Map(λ,E)=E₀→ΩE₁, a weak equivalence for every Ω-spectrum E; naive π₀: ⊕ℤ vs ℤ (HSS Ex 3.1.10) | definition agrees with HSS Def 3.1.3 / Prop 3.1.4 | add locator (R13) |
| G2.7 HA levels Ã[Sⁿ] | A=0; A=ℤ; cyclic sign | all levels 0, π_*=0; Ã[S⁰]=ℤ, π₀=ℤ; cyclic shift of n+1 coordinates has sign (−1)ⁿ | holds | none |
| G2.9 low-rank πᵢGL_k(ℝ) table and stabilisation | k=0…5; Spin(4)=S³×S³; S⁰ and S¹ clutching | π₃SO(4)=ℤ², SO(3)→SO(4) diagonal, SO(4)→SO(5) sum, composite ×2 (π₃SO(3)→π₃SO is ×2); [S¹,GL₂ℝ]=ℤ⋊ℤ/2=D∞; [S⁰,GL_k]: 4 maps vs 2 bundles | holds | none |
| G2.10 mapping-path fibre, θ₃ | f=const_b; endpoint not in f(b)'s path component; θ₃ at s=1, 4 | fibre ≅ `Path b k` (also pinned, Fiber.lean:177); empty fibre; θ₃(1)=3 from both pieces, θ₃(4)=4 | holds | duplicates pin (R05) |
| G3.2 Yoneda and representing levels | E=HZ | [X,ΣⁿHZ]=Hⁿ(X;ℤ); natural transformations on all spectra correspond to [E,F] | holds | none |
| G3.3 arbitrary-CW comparison | countable wedge of S⁰ | ∏E^q(*) on both sides; fails for a ⊕-valued functor, which the wedge axiom of G1.1 excludes | holds | none |
| G3.4 Milnor sequence | Xᵢ=S¹, fᵢ degree 2 | H¹(hocolim)=lim=0; H²(hocolim)=lim¹(ℤ←2ℤ←…)=ℤ₂/ℤ=Ext(ℤ[½],ℤ)≠0 | holds | none |
| G3.5 increasing open covers | X=ℝ, Uᵢ=(−i,i) | Tel≃ℝ≃*; every compact set lies in some Uᵢ | holds | none |
| G3.6 phantom S_ℚ→ΣHZ | restriction groups, lim¹ | [S,ΣHZ]=π₋₁HZ=0; lim¹(ℤ←2ℤ←3…)=Ext¹(ℚ,ℤ)≠0; class (1,1,…) would need a₀≡Σ_{k≤n}k! mod (n+1)! for all n, impossible | holds | make it a Check (R12) |
| G3.9 localization/completion | E=S, S={2^k}; HZ; HQ; H(ℤ/p^∞) | π₀S[½]=ℤ[½]; π₀HZ^∧_p=Ext(ℤ/p^∞,ℤ)=ℤ_p; HQ^∧_p=0; π₁H(ℤ/p^∞)^∧_p=ℤ_p≠π₁⊗ℤ_p=0, so the f.g. hypothesis is needed | holds; hypothesis present | none |
| G4.3 Thom isomorphism | rank 0; Möbius over S¹ with HF₂ and HZ | U=1, iso = id; Th=RP²: H̃¹(RP²;F₂)=F₂=H⁰(S¹;F₂); H̃¹(RP²;ℤ)=0≠H⁰(S¹;ℤ)=ℤ, so an orientation is required as stated | holds | add the HZ case as a negative-control Check |
| G4.4 `U∪U=π*e∪U` | ε¹ over a point | H²(D¹,S⁰)=0 and e(ε)=0: 0=0 | holds | none |
| G5.1 S–W duality, `E^q(P)≃E_(−q)(DP)` | P=Sⁿ; P=Σ∞ℂP^∞ | E^q(Sⁿ)=π_(n−q)E=E_(−q)(S^(−n)); ℂP^∞ has infinite-rank H_*, so it is not dualizable, as stated | holds | none |
| G2.1 Kan–Quillen (headline) | Δ[0]→Δ[1]; ∂Δ[1]→Δ[0] | first is a mono with |·| a homotopy equivalence (trivial cofibration); second has π₀ 2→1, not a weak equivalence | statable at pins (R06 probe) | state it (R06) |
| G2.5 Freudenthal (headline) | k=1, X=S¹; k=2, X=S² | π₁S¹→π₂S² onto (i=2k−1=1); π₂S²≅π₃S³ (i=2≤2k−2); π₃S²=ℤ→π₄S³=ℤ/2 onto; matches Hatcher Cor 4.24 with n=k | holds | locator (R13) |
| G3.1 Brown (headline) | finite vs arbitrary CW | Hatcher 4E.2: all connected CW; Cohen 10.3: bijection for finite X only | statement right, reference too weak | R13 |
| G5.6 rational Hurewicz (headline) | n=1,2; n=0 | H*(K(ℤ,1);ℚ)=Λ[x₁]; H*(ℂP^∞;ℚ)=ℚ[x₂]; π₀S⊗ℚ=ℚ | holds | none |
| `coefficientDegreeEquiv` (Lean) | elaborated type | `Hom(S,E⟦q⟧) ≃+ Hom(S⟦−q⟧,E)` with no additivity binder | missing hypothesis | delete (R03) |
| `IsHurewiczFibration` (Lean) vs pin | p=id; general p | both true for id; Lean: ∃ lifting function; pin: continuous ∧ HLP in universe w, equivalent by LiftingFunction.lean:172 | duplicate, different definition | delete (R05) |
| `quaternionFrameAction_preserves` (Lean) | g unitary | Σ star((gv)ᵢ)(gw)ᵢ = vᴴ(gᴴg)w = Σ star(vᵢ)wᵢ; `simp` does not close it | true, not a headline | delete (R10) |

## Not verifiable

- Adams, *Stable Homotopy and Generalised Homology*, Part III. The README cites it for boundary and product conventions (G1.3–G1.6). It is a commercial book with no legal open copy; searched arXiv and the author pages. The sampled sign conventions were instead checked internally against G1.4/G1.6 (σ(a)×b=σ(a×b), a×σ(b)=(−1)^pσ(a×b), δ(i*a∪b)=(−1)^p a∪δb), which are mutually consistent.
- Dold's countable disjoint-refinement lemma (G3.5): no source or locator is given. Dold (Annals 1963) is behind JSTOR, so the statement was checked from the standard argument only.
- Joachim (Topology 40, 2001) and Hebestreit–Sagave (Math. Ann.): DOI landing pages are paywalled, and neither is in the sample.

## Source issues

- none
