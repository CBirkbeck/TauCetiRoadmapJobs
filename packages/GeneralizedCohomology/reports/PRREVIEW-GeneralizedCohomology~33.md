# Review of GeneralizedCohomology (pull request #1854 at c9c60d0)

**Verdict:** needs changes

In this folder the pull request changes only `TauCetiRoadmap/GeneralizedCohomology/README.md`: 926 insertions and 84 deletions against main. G2.11 moves in from BordismFormalGroups F6.5, and the realization-product comparison moves out to AlgebraicTopology Stage 4.5. `Suggested.lean` is byte-identical to main's. Neither file has changed since the previous review, so all seventeen of its findings still apply. One improvement came from outside this pull request: CStarAlgebras has since merged to main (R02).

The push gate fails on this head (set_option, sorry-data, imports, mathlib-subimports, statement-hygiene, blob, latex, prnum, dropped, depcheck, outside-folder). Each gate failure is a finding below.

This head also rewrites the AlgebraicTopology README in the same pull request. As a result, this README now cites nine AlgebraicTopology names that are no longer defined, and one AlgebraicTopology item whose content has moved to CharacteristicClasses (new R18). Two HTT locators in G2.11 point at the wrong statement (new R19).

## Status of the previous review's findings

| Id | Passage at this head | Status |
| --- | --- | --- |
| R01 | line 37 "[HomotopySpheres Stage 3A](…/pull/284) \| the native `CompactlyGenerated` inclusion…"; lines 75, 241, 328, 2320, 2487; `Suggested.lean` line 513 "PR284-owned" | not repaired |
| R02 | line 45 "[HilbertModules H2, H4–H6](…/pull/861), [CStarAlgebras C5](…/pull/860), [OperatorKTheory K5](…/pull/866)" | partly: CStarAlgebras is now on main and its C5 resolves (main README line 1110, "C*-tensor products"); HilbertModules and OperatorKTheory are still unmerged |
| R03 | `Suggested.lean` lines 246–751, 22 sorry'd `def`/`instance` | not repaired |
| R04 | `Suggested.lean` lines 333, 355 `set_option maxHeartbeats 1000000 in` | not repaired |
| R05 | `Suggested.lean` lines 51–137, 499, 523–665, 698–709; README line 3525 "it does not supply a category of spectra" | not repaired (extended below) |
| R06 | `Suggested.lean` lines 31–42 "**This file is not the roadmap and is not exhaustive.**" | not repaired |
| R07 | line 669 "These simplicial-set, quasicategorical and operadic foundations are construction targets of this item"; line 222 "First build the unpointed Kan–Quillen model structure" | not repaired |
| R08 | `Suggested.lean` lines 1–29 | not repaired |
| R09 | `Suggested.lean` lines 328–329 `Classical.choose` | not repaired |
| R10 | `Suggested.lean` lines 115–171, 254, 286, 411, 465, 492, 513, 621–623, 674–681 | not repaired |
| R11 | line 33 "Stage4.5's simplicial-realization product comparison"; `Suggested.lean` line 514 | not repaired |
| R12 | line 1 "# Generalized cohomology, spectra and orientations"; line 23 "## Scope and suppliers" | not repaired |
| R13 | no theorem-level locator in G1–G5 outside G2.11 | not repaired |
| R14 | 90 of 98 Lean names absent from the README | not repaired |
| R15 | gate `blob` lines 39, 42, 3112, 3260, 3262; `prnum` lines 39, 75, 241, 328, 2320, 2487; line 41 `../SpinRepresentations/README.md` | not repaired |
| R16 | line 3279 "V=K\A, Z=L\(A∩L), U=K\(A∪L)" | not repaired |
| R17 | `Completed/ArithmeticDirichletSeries/README.md`, `TauCetiRoadmap/SymplecticGeometry/README.md` | not repaired |

## R01 (P1) — Supply cycle through HomotopySpheres, a roadmap that may never be cited as a supplier

**Location.**
- README line 37: "[HomotopySpheres Stage 3A](…/pull/284) | the native `CompactlyGenerated` inclusion and compact-generation right adjoint; pointed convenient mapping spaces, suspension/loop, smash, mapping cone/Puppe, stable sphere stems and Freudenthal".
- The same supplier is used at line 75 ("PR284's convenient category"), line 241, line 328, line 2320 ("HomotopySpheres PR284 §4B") and line 2487.
- `Suggested.lean` line 513: "PR284-owned compact-generation right adjoint".

**Claim.** HomotopySpheres is on the list of roadmaps that may never be cited as suppliers. The dependency check reports the edge as UPWARD and as part of a cycle.

**Witness.** HomotopySpheres at the head of its open revision consumes "From TauCetiRoadmap.GeneralizedCohomology. G4.0a…" (README line 506 there). The depcheck prints `CYCLE among: GeneralizedCohomology, HomotopySpheres, StringOrientation, TangentialBordism`. The gate's `dropped` hits (lines 37 and 2320) are these citations.

**Repair.**
1. Delete the line-37 row and every PR284 citation.
2. Take the compact-generation coreflection, its counit and `k(X×Y)` from AlgebraicTopology Stage 4.5. At this head the AlgebraicTopology README owns them at lines 134–141 ("Own the compact-generation interface… right adjoint to the inclusion").
3. State the pointed convenient smash, mapping cone/Puppe and stems `π_n S` as G2.5 targets. G2.5 already proves Freudenthal with homotopy excision, so delete "compatibility with the sphere-only supplier theorem" and "the supplier's stabilized sphere colimit" (end of G2.5).
4. State the real space-level Bott loop chain as a G5.0/G5.4 target, recording the move in Scope. TopologicalKTheory cannot supply it: its README at this head (line 111) itself cites HomotopySpheres §4A–4B.
5. Delete "PR284-owned" from the Lean docstring.

The other two names in the cycle line are depcheck false positives:
- line 3419, "before StringOrientation defines λ and BString";
- line 43, "structured PT and geometric bordism remain TangentialBordism".

Neither consumes anything. Reword both in the consumer form the check accepts on line 46 ("TangentialBordism consumes this interface"). For example: "StringOrientation, a consumer, defines λ and BString after G5.0". Test: rerun the depcheck; no UPWARD or CYCLE line should remain.

## R02 (P2) — Upward suppliers HilbertModules and OperatorKTheory

**Location.** Line 45: "[HilbertModules H2, H4–H6](…/pull/861), … [OperatorKTheory K5](…/pull/866) | complex Hilbert compact operators/spatial tensors, strong-topology unitary contractibility, regular functional calculus and graded Clifford APIs". Also line 2649.

**Claim.** This roadmap is on main, and these two are open new-roadmap pull requests at positions #8 and #9 of the merge order. A main roadmap must not depend on unmerged plans.

**Witness.** Depcheck at this head: `UPWARD: GeneralizedCohomology (on main) -> HilbertModules (#8)` and `-> OperatorKTheory (#9)`, both at README line 45. Neither folder exists on main. CStarAlgebras is no longer flagged because it is now on main.

**Repair.** Repoint each item:
- compact operators → CompactOperators (on main);
- functional calculus → Mathlib `IsometricContinuousFunctionalCalculus`, already named in G5.5;
- Hilbert C*-modules → Mathlib `CStarModule`;
- spatial tensors → CStarAlgebras C5 (main);
- Kuiper-type contractibility and the graded Clifford K5 parity → G5.5 targets, recording the move in Scope.

Rerun the depcheck.

## R03 (P2) — 22 sorry'd data declarations in Suggested.lean

**Location.** `Suggested.lean`:
- line 246 `nativeSpinFourQuaternionHomeomorph`;
- line 392 `quaternionFrameGroupChartedSpace`;
- line 485 `quaternionProjectiveGrassmannianHomeomorph`;
- line 514 `realizationProductKelleyComparison`;
- lines 537–660, the PointedSSet, FiniteBijection, Day and sphere instances;
- lines 698–709 `spectrumSmash`, `freeSpectrum`, `freeEvaluationEquiv`;
- line 730 `coefficientDegreeEquiv`;
- line 748 `suspensionCohomologyEquiv`.

**Claim.** Every `def` and `instance` with a `sorry` body or field is forbidden. Two of them also have the wrong type.

**Witness.** Gate `sorry-data=22`. The elaborated signature of `coefficientDegreeEquiv` is `{C} → [Category C] → [Preadditive C] → [HasShift C ℤ] → (sphere E : C) → (q : ℤ) → SpectralCohomology E sphere q ≃+ StablePi sphere E (-q)`. It has lost `[∀ n, (shiftFunctor C n).Additive]`. `suspensionCohomologyEquiv` has lost the same binder. Without that binder an autoequivalence need not be additive on hom groups: on a one-object preadditive category with endomorphism ring 𝔽₅, the monoid automorphism x↦x³ sends 1+1 to 3, not 2.

**Repair.** Delete all 22. Each stays in the README as a construction target with its intended signature (G2.1–G2.4, G4.0).

## R04 (P2) — `set_option` in Suggested.lean

**Location.** `Suggested.lean` lines 333 and 355: `set_option maxHeartbeats 1000000 in`, on `quaternionSpEmbeddedLieSubgroupData` and `quaternionSp_contMDiff_iff_comp_subtypeVal`.

**Witness.** Gate `set_option=2`.

**Repair.** Delete the `QuaternionSpLieData` section (lines 289–372) and the chart APIs at lines 377–408. These are G4.0b chart facts, not headlines, and the README keeps them. This also removes R09.

## R05 (P2) — Suggested.lean redeclares carriers the pins already have; the README says the pin lacks them

**Location.**
- `Suggested.lean`: line 499 `PointedSSet`, line 523 `FiniteBijection`, line 596 `SymmetricSequence`, line 665 `SymmetricSpectrum`, line 62 `IsHurewiczFibration`, lines 51 and 87 `MappingPathSpace`/`MappingPathFiber`, line 97 `mappingPathFiberConstHomeomorphPath`, line 467 `quaternionProjectiveQuotientTopology`.
- README line 3525: "it does not supply a category of spectra".
- README G4.0 lines 1791–1792: "consume AT4.6's generic division-ring quotient topology"; also lines 1847 and 1880.

**Claim.** Each object is declared at the pins with a real body, and `Suggested.lean` redeclares it under `TauCetiRoadmap.GeneralizedCohomology`. Its `IsHurewiczFibration` is a different definition: existence of a lifting function, where the pinned one is continuity plus homotopy lifting. The projective topology is Mathlib's. AlgebraicTopology 4.6 at this head (line 1024) only consumes "Mathlib's quotient topology on `Projectivization 𝕜 V`" and does not supply it.

**Witness (re-opened at this pin):**

| Suggested.lean | At the pin |
| --- | --- |
| `PointedSSet` | Tau Ceti `AlgebraicTopology/SimplicialSet/Pointed/Basic.lean:33` |
| `pointedSSetMonoidal`, `pointedSSetSymmetric` | `Pointed/Smash/Basic.lean:65, 69` |
| `FiniteBijection` and its instances | `CategoryTheory/FiniteBijection.lean:45, 290, 344` |
| `SymmetricSequence` | `Spectra/SymmetricSequence.lean:90` |
| `symmetricSphere`, `SymmetricSpectrum` | `Spectra/SymmetricSpectrum.lean:82, 92` |
| `freeSpectrum`, `freeEvaluationEquiv` | `Spectra/Free.lean:174, 178` (`SymmetricSpectrum.free`, `freeEvaluationAdjunction`) |
| colimits, mapping spaces | `Spectra/Colimits.lean:68`, `Spectra/MappingSpace.lean` |
| `MappingPathSpace`, `MappingPathFiber`, `mappingPathFiberConstHomeomorphPath` | `Topology/Homotopy/MappingPath/Basic.lean:40`, `Fiber.lean:51, 177` |
| `IsHurewiczFibration` | `HurewiczFibration/Basic.lean:58`; lifting-function form `MappingPath/LiftingFunction.lean:172` |
| `quaternionProjectiveQuotientTopology` | Mathlib `Projectivization.instTopologicalSpace`, `Topology/Algebra/Projectivization.lean:44`, any `DivisionRing K`. A scratch probe proves the two equal by `rfl` at `(Quaternion ℝ)ᵐᵒᵖ`. |

**Repair.**
- Delete these declarations.
- Add a "From Tau Ceti" and "From Mathlib" supplier contract naming each pinned declaration with its file.
- In G4.0, replace "AT4.6's generic division-ring quotient topology" by Mathlib `Projectivization.instTopologicalSpace` with `Projectivization.isOpenQuotientMap_mk'` (line 83).
- Replace README line 3525 by a true sentence: the pin has symmetric spectra with smash, free spectra, limits, colimits and mapping spaces, but no stable equivalences, stable model structure or Brown representation.

## R06 (P2) — No headline theorem is stated; a statable headline is absent

**Location.** `Suggested.lean` lines 31–42 (module docstring). README lines 18–19: "`Suggested.lean` checks selected carrier and interface shapes".

**Claim.** The file is an API catalogue: its three sorried theorems are G4.0 chart/action facts. The headlines are:
- Kan–Quillen (G2.1);
- the stable model structure on symmetric spectra (G2.3);
- Brown representability on arbitrary CW (G3.1);
- the Milnor sequence (G3.4);
- the generalized Thom isomorphism (G4.3);
- Spanier–Whitehead/Atiyah duality (G5.1–G5.2);
- rational stable Hurewicz (G5.6).

Kan–Quillen is statable at the pins and absent. The docstring does not say which of the others are not statable.

**Witness.** This statement elaborates at this pin under `import Mathlib` plus `import TauCeti.Topology.Category.TopCat.WeakEquivalence`, with only the `sorry` warning (scratch probe):

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

Neither pin has a `ModelCategory SSet` instance: Mathlib's only model-category instances are on cochain complexes (`Algebra/Homology/ModelCategory/Injective.lean:205`), so the statement is not already proved.

**Repair.**
- Rewrite the docstring as "GeneralizedCohomology: target signatures". It should say that README.md is the roadmap and that this file states its headline theorems.
- State the Kan–Quillen headline.
- List as not statable, each with what is missing:
  - the stable model structure: no stable equivalences on `TauCeti.SymmetricSpectrum` (`Spectra/MappingSpace.lean` says they need the stable model structure);
  - Brown and Milnor: no category of axiomatic cohomology theories on pointed CW complexes;
  - Thom: no generalized theory or orientation;
  - duality and rational Hurewicz: no stable homotopy category.
- Delete the README lines 18–21 sentence.

## R07 (P2) — G2.1/G2.11 and HigherToposTheory both own Kan–Quillen, Bergner, Joyal and straightening

**Location.**
- Line 669: "These simplicial-set, quasicategorical and operadic foundations are construction targets of this item".
- Line 1059: "This constructs the Joyal model".
- Line 222: "First build the unpointed Kan–Quillen model structure".
- Lines 62–65: "BordismFormalGroups F6.5 and EllipticCohomology consume G2.11's enriched, quasicategorical, straightening, monoidal-localization and operadic foundations".

**Claim.** These objects have two planned owners. Separately, the consumer claim about EllipticCohomology is unsupported.

**Witness.**
- HigherToposTheory (#1901, another author's open new roadmap) owns Kan–Quillen as F2 (its README lines 9 and 37), Bergner as F3 (line 228), Joyal as L3 (line 230) and straightening as L4 (line 232).
- EllipticCohomology on main cites only G2.5, G2.8 and G3.8 (its lines 115, 850, 1675, 1725) and never G2.11.

**Repair.**
- This roadmap is on main and earlier, so it is the owner. Say so in Scope: "G2.1 owns the Kan–Quillen structure; G2.11 owns the Bergner and Joyal structures and marked straightening; HigherToposTheory consumes them."
- HigherToposTheory's own review must then repoint F2/F3/L3/L4.
- Drop "and EllipticCohomology" from lines 62–65.

## R08 (P3) — Imports

**Location.** `Suggested.lean` lines 1–29: 25 `import Mathlib.*` lines and no `import Mathlib`.

**Witness.** Gate `imports=1`, `mathlib-subimports=25`, `no-import-mathlib=1`.

**Repair.** Use `import Mathlib`, then only the `TauCeti.*` modules still used after R03–R06. For the Kan–Quillen headline that is `TauCeti.Topology.Category.TopCat.WeakEquivalence`, which the probe built and elaborated.

## R09 (P3) — statement-hygiene: a definition chooses its datum

**Location.** `Suggested.lean` lines 328–329, `Classical.choose` in `quaternionSpSliceChartData`.

**Witness.** Gate `statement-hygiene`, two P3 hits.

**Repair.** Delete it with the R04 block.

## R10 (P3) — Padding and process comments in Suggested.lean

**Location.**
- Restatements closed by `rfl` or `ext; rfl`: lines 115, 120, 130, 135, 161, 167, 254, 492, 674, 678.
- Line 357: `exact` with one library lemma.
- Line 69 `IsHurewiczFibration.lift`: the pinned lifting-function equivalence.
- Instance-only `example`s: lines 286, 411, 621–623.
- Thin definitions no headline uses: `StablePi`, `SpectralCohomology`, `SpectralHomology`, `cohomologyPullback`, `externalProductClass`, `stagewisePhantoms`, `finiteDualEvaluation`/`Coevaluation` (`ExactPairing` restated), `IntegerGradedCofunctor`, the Clifford and Hilbert synonyms, `QuaternionGrassmannian`, `quaternionHermitian`, `quaternionFrameAction`.
- Process comments: line 465 "Delete this local specialization when AT4.6 supplies…" (Mathlib already does, R05); line 513 "PR284-owned".

**Witness.** Each is closed by `rfl` or by one library lemma as written in the file.

**Repair.** Delete them from `Suggested.lean`; the README keeps each statement.

## R11 (P3) — Moved ids without old → new lines

**Location.**
- Line 33 and lines 236–242: the realization-product comparison is now consumed from AlgebraicTopology Stage 4.5. `Suggested.lean` line 514 still declares `realizationProductKelleyComparison`.
- Lines 62–65: G2.11 receives BordismFormalGroups F6.5's foundations.

**Witness.**
- HigherToposTheory #1901 line 198 and StableHomotopyKTheory #1227 line 236 still cite "G2.1's `realizationProductKelleyComparison`". AlgebraicTopology at this head owns the comparison at line 975 under no Lean name.
- StableHomotopyKTheory #1227 line 16 still names "BordismFormalGroups, F6.5" as owner of "Sp∞, symmetric coherence, infinity-operad interfaces and the monoidal model-localization comparison".

**Repair.** Add one line per move in Scope:
- "G2.1's realization-product comparison (`realizationProductKelleyComparison`) → AlgebraicTopology Stage 4.5";
- "BordismFormalGroups F6.5's enriched/quasicategorical/monoidal-localization foundations → G2.11".

Delete the Lean declaration (R03).

## R12 (P3) — README is not in TauCetiRoadmap form

**Location.**
- Line 1 has no `**Summary.**`.
- Line 23 "## Scope and suppliers"; there are no Scope and ownership, Exact supplier contracts or How to read the build sections.
- Items are numbered paragraphs hundreds of lines long (G2.11 is lines 669–1505, G5.7 lines 3074–3373).
- Implementation instructions at lines 20–21 and 3101–3107.

**Witness.** Zero matches for `**Checks`, `*Needs:*`, `### Examples`, `### Dependencies` and `**Summary`.

**Repair.**
- Use `# Roadmap: generalized cohomology, spectra and orientations` with a Summary and the standard sections.
- Turn G1–G5 into `## Layer k` with `### k.n` subsections.
- Give each definition API bullets and three Checks; candidates are the G1.7 square-zero test with its 2σ²=0 negative control, the G3.6 phantom, the G4.3 Möbius/HZ failure and the G2.6 F₁S¹ nonsemistable spectrum.
- Give each target a `*Needs:*` line.
- End each layer with Examples and Dependencies.
- Delete the implementation instructions.

## R13 (P3) — Claims carry no locators; two cited sources are weaker than the statements

**Location.**
- No target in G1–G5 outside G2.11 has a theorem-level locator.
- G3.1 states Brown on arbitrary connected CW.
- G4.3 (lines 2053–2067) states the Thom isomorphism for every ring spectrum E.

**Witness.**
- Cohen Thm 10.3 (`CohenBMH` line 10035, printed p. 282) gives the bijection only for finite CW. The arbitrary form is Hatcher Thm 4E.2 (`HatcherAT` line 19338, p. 449).
- Cohen Thm 10.40 (`CohenBMH` line 11933, p. 330) assumes a connective E and a connected base.
- G4.3 is still true for every E: it is G4.1's relative Leray–Hirsch with (F,F₀)=(Dʳ,Sʳ⁻¹) and the single basis class U.

**Repair.**
- Add a locator at each claim. Verified locators:
  - G2.3: HSS Def 3.1.3 and Prop 3.1.4 (p. 21), Thm 3.4.4 (p. 35);
  - G2.4: Shipley Prop 4.1 and Cor 4.3 (p. 8);
  - G2.5: Hatcher Thm 4.23 and Cor 4.24 (p. 360);
  - G2.6: HSS Def 5.6.1 (p. 61);
  - G3.1: Hatcher Thm 4E.1–4E.2 (pp. 448–449);
  - G3.4: Hatcher Thm 3F.8 (p. 314);
  - G5.1: Cohen Thm 10.43 (p. 334);
  - G5.2: Cohen Thm 10.46 (p. 339);
  - G5.6: Cohen Thm 10.19 and Prop 10.22 (p. 295).
- Write G4.3's route as "*Needs:* G4.1", citing Cohen 10.40 only for the connective case.

## R14 (P3) — README and Suggested.lean disagree on names

**Location.**
- 90 of 98 Lean names (`PointedSSet`, `coefficientDegreeEquiv`, `levelPermutation`, …) never occur in the README.
- About 60 backticked names of this roadmap's own are declared nowhere, for example `connectiveSpectrumMapsToHA`, `stableBSpin_homotopyGroupsThroughEight`, `quaternionicHopfSphereHomeomorph`, `topCatIdentityForget`.

**Witness.** A script compared every Lean declaration name with the README text, and every backticked README identifier with `Suggested.lean`.

**Repair.** After R03–R10 the Lean file holds only headlines; name each in the README. Un-backtick README-only names unless `Suggested.lean` declares them.

## R15 (P3) — Commit-pinned links, pull-request numbers, a broken relative link

**Location.**
- Gate `blob` lines 39, 42, 3112, 3260, 3262.
- Gate `prnum` lines 39 ("ComplexManifolds PR279", "#279's"), 75, 241, 328, 2320, 2487.
- Line 45 links three pull requests.
- Line 41 links `../SpinRepresentations/README.md`; on main that roadmap is at `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/`.

**Witness.** Open revisions rename three of the anchors: ComplexKahlerGeometry `#k7-…` (#1398, #1807, #1808), AlgebraicTopology `#stage-8-…` (#1652) and SpinGeometry `#g1-…` (#1674). The labels K7.1, Stage 8.2 and G1.3 survive at those heads.

**Repair.** Cite by name and section ("ComplexKahlerGeometry K1, K7.1", "SpinGeometry G1.3", "AlgebraicTopology Stage 8.2", "SmoothBundlesConnections B1.4", "ComplexManifolds Milestones 1–2"). Drop PR numbers and fix the SpinRepresentations path.

## R16 (P3) — LaTeX delimiter outside a code span

**Location.** Line 3279: "specified compactifications V=K\A, Z=L\(A∩L), U=K\(A∪L), where".

**Witness.** Gate `latex=2`.

**Repair.** Write `` `V=K∖A` ``, `` `Z=L∖(A∩L)` ``, `` `U=K∖(A∪L)` ``, using ∖ inside code spans.

## R17 (P3) — Edits outside this pull request's roadmap folders

**Location.**
- `Completed/ArithmeticDirichletSeries/README.md` line 331 ("`LFunctions` consumes this package alongside its own character-specific continuation").
- `TauCetiRoadmap/SymplecticGeometry/README.md` lines 76–78 ("HeegaardFloer and DGFloer consume the geometric boundary and sign adapters of CG6").

**Witness.** Gate `outside-folder=2`. Neither folder is among the folders this pull request is reviewed for, although its description explains both one-line cuts.

**Repair.** Move both edits to a pull request that owns those folders, or have them registered as folders of this one so that they are reviewed.

## R18 (P2) — Supplier drift against this pull request's own AlgebraicTopology README

**Location.**
- Line 35: "Stage 8.8c's functorial abelian EM models; ordinaryEMUniversalClass, ordinaryEMRepresentability, ordinaryEMRelativeRepresentability, ordinaryEMLoopComparison, ordinaryCohomologySuspension and projectiveEMComparisons".
- Lines 2093–2094: "where CC C1.5's x_CC=c₁(γ) pairs to −1 and AT's projectiveEMComparisons pins h_AT to pair+1".
- Line 101 `ordinaryCohomologySuspension`; lines 231–232 `simplicialRealizationCW`, `simplicialGroupKan`, `simplicialGroupMooreHomotopyIso`, `kanRealizationUnitHomotopyIso`; line 432.

**Claim.** AlgebraicTopology at this head (commits "catalogue removed") defines none of these names. Its item 8.12 no longer contains the projective EM comparisons, and AlgebraicTopology disclaims them. After merge, G4.5's sign normalization and the line-35 contract would cite a supplier that does not provide them.

**Witness.**
- `grep -c` over AlgebraicTopology's README at this head returns 0 for each of the nine names. Main has all nine.
- AlgebraicTopology 8.12 at this head (line 2788) is "Native circle comparison of the degree-one model". It ends: "no projective carrier, characteristic-class definition or finite-projective comparison is constructed here".
- CharacteristicClasses C1.5a at this head (line 722) owns the CP∞≃K(ℤ,2) comparison by f_h, "whose restriction to complex-oriented CP¹ pairs to +1".

**Repair.** Cite by item, not by the removed names:
- AlgebraicTopology 8.2 (line 2221) for the Kan property of simplicial groups, the Moore comparison and the Kan realization-unit comparison;
- 4.7 (line 1064) for the realization CW structure;
- 8.10 (line 2629) for the universal class and absolute and relative representability;
- 8.11b (line 2712) for the EM loop comparison and the ordinary cohomology suspension σ_right = a×u. This agrees with line 102's `σ_AT(a)=(−1)^n τ*σ(a)`: the cross-product swap gives a×ι=(−1)^n τ*(ι×a).
- CharacteristicClasses C1.5a for "h pairs to +1 on CP¹", in line 35 and lines 2093–2094.

Rerun `roadmaps resolve` on the README against this head.

## R19 (P3) — Two HTT locators in G2.11 point at the wrong statement

**Location.**
- Lines 1055–1056: "apply model recognition (HTTA.2.6.13) with monomorphism cofibrations".
- Lines 1243–1246: "precomposition identifies functors out of the target with functors inverting the unit maps … (the localization criterion of HTT5.2.7.4)".

**Witness.**
- HTT A.2.6.13 (`LurieHTT` line 38362, p. 825) is the Example stating that isomorphisms form a perfect class. The recognition theorem is Prop A.2.6.15 (line 38368, pp. 825–826), with perfectness from Def A.2.6.12.
- HTT 5.2.7.4 (line 17361, p. 365) characterizes localization functors. The precomposition statement is Prop 5.2.7.12 (line 17500, p. 368).

**Repair.** Cite "HTT A.2.6.15 (perfect class: Def A.2.6.12)" and "HTT 5.2.7.4, 5.2.7.12".

## Verified sound

**Gate and dependency check.** The gate was re-run on this head. Its counts match the worker's; `outside-folder` matches once the pull request's folder list is supplied. Depcheck output:

```
UPWARD: GeneralizedCohomology (on main) -> HilbertModules (#8) at README lines [45]
UPWARD: GeneralizedCohomology (on main) -> HomotopySpheres (#47) at README lines [37]
UPWARD: GeneralizedCohomology (on main) -> OperatorKTheory (#9) at README lines [45]
UPWARD: GeneralizedCohomology (on main) -> StringOrientation (#11) at README lines [3419]
UPWARD: GeneralizedCohomology (on main) -> TangentialBordism (#14) at README lines [43]
CYCLE among: GeneralizedCohomology, HomotopySpheres, StringOrientation, TangentialBordism
depcheck: 237 roadmaps, 2451 edges, 6 problem(s)
```

Lines 3419 and 43 are false positives (R01).

**Elaboration.** `lake env lean TauCetiRoadmap/GeneralizedCohomology/Suggested.lean` exits 0 with 25 `sorry` warnings and nothing else. A scratch probe under `import Mathlib` elaborates:
- the Kan–Quillen headline (R06);
- the `rfl` equality of the local quaternionic projective topology with Mathlib's instance (R05).

**Binder check.** All 11 flagged signatures were compared with the README:
- `coefficientDegreeEquiv` and `suspensionCohomologyEquiv` lost the additivity binder (R03);
- `realizationProductKelleyComparison` drops `hk`, which its type does not mention (a sorry'd def, R03);
- the other eight drop only binders their types do not use.

**Library declarations opened at the pins (24).**
- Tau Ceti:
  - `Pointed/Basic.lean:33`;
  - `Pointed/Smash/Basic.lean:65, 69`;
  - `FiniteBijection.lean:45, 126, 290, 344`;
  - `Spectra/SymmetricSequence.lean:90`;
  - `Spectra/SymmetricSpectrum.lean:82, 92`;
  - `Spectra/Free.lean:51, 56, 174, 178`;
  - `Spectra/Colimits.lean:68`;
  - `Spectra/MappingSpace.lean:46`;
  - `MappingPath/Basic.lean:40`;
  - `MappingPath/Fiber.lean:51, 177`;
  - `HurewiczFibration/Basic.lean:58`;
  - `MappingPath/LiftingFunction.lean:172`;
  - `Lifting/Relative.lean:44`;
  - `TopCat/WeakEquivalence.lean:18`;
  - `Pointed/Suspension.lean:38`.
- Mathlib:
  - `Topology/Algebra/Projectivization.lean:44, 50, 83`;
  - `Topology/Category/CompactlyGenerated.lean:78`: no right adjoint at the pin, so the Lean `k`/`hk` hypotheses are needed;
  - `Topology/Compactification/OnePoint/ProjectiveLine.lean:84`;
  - `Algebra/Homology/ModelCategory/Injective.lean:205`;
  - `SimplicialSet/AnodyneExtensions/Basic.lean:85`.

**Cross-roadmap citations resolved (41).**
- AlgebraicTopology at this head: 4.5 (lines 821, 975, 1007), 4.6 (1023), 4.7 (1064), 4.8 (1091), 5.0 (1143), 5.5 (1249), 6.0 (1427), 8.2 (2221), 8.8c (2483), 8.8d (2545), 8.10 (2629), 8.11a/b (2669, 2712), 8.12 (2788), compact generation (134–141).
- CharacteristicClasses at this head: C1.1b (279), C1.2b counit (606–624), C1.5a (722), C2 (788), C3 (1065).
- TopologicalKTheory at this head: T1.5 (63, 250), T1.5a (307), T1.6a (381), T1.6c `stableOrientedGrassmannianWhitneySum` (608), T6 items 1–9, T7.0 (1238).
- BordismFormalGroups F6.5 (1750, 1766).
- On main: CStarAlgebras C5 (1110); EllipticCohomology (115, 850, 1675, 1725); ComplexManifolds, SmoothBundlesConnections, GeometricTopology, SpinGeometry, CompactOperators, RepresentationTheory/{SpinRepresentations, CompactGroups, LieGroups}.
- Open pull requests: HigherToposTheory #1901 (lines 9, 37–40, 198, 227–232); StableHomotopyKTheory #1227 (11, 16, 236); HomotopySpheres revision line 506.

**Overlaps checked.**
- #1807 and #1808 carry this folder byte-identical to this head, so they do not conflict here.
- #1187's conflict in `GeneralizedCohomology/Suggested.lean` is a one-token difference (`Aut.of` versus `.of`, line 686) with main's file, which this pull request leaves unchanged.
- The three anchors that open pull requests drop are covered by R15.
- No id of this roadmap is dropped.

**Source sample.** Fifteen targets were drawn with seed 33 from the 42 numbered items: G2.3, G2.4, G2.5, G2.8, G2.11, G3.3, G3.4, G4.2, G4.4, G4.5, G5.0, G5.1, G5.2, G5.3, G5.5. None outside G2.11 carries a locator (R13). Each was checked against the legal texts in the cache:
- HSS 3.1.3, 3.4.4, 5.6.1;
- Shipley 2.5, 3.2, 4.1, 4.3;
- Hatcher 3F.8, 4.23, 4.24, 4E.1–2;
- Cohen 10.3, 10.19, 10.22, 10.39, 10.40, 10.43, 10.45–10.47;
- HTT 1.2.4.3, 1.2.9.3, 2.2.1.2, 3.3.1.8, 5.2.7.4, 5.2.7.12, A.2.6.12–15;
- HA 4.8.1.10;
- Hebestreit–Sagave §§6–7, whose §7.8 takes the ABS orientation from Joachim's §6, as G5.5 says.

**Adversarial table.**

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| G2.3 stable equivalences via derived maps into Ω-spectra | λ:F₁S¹→F₀S⁰; zero spectrum | Map(λ,E)=(E₀→ΩE₁), a weak equivalence for every Ω-spectrum E; naive π₀F₁S¹ is not ℤ (HSS Ex 3.1.10); *→* trivially | holds; equivalent to HSS Def 3.1.3 / Prop 3.1.4 (injective form) | locator (R13) |
| G2.4 compact generator, flat smash | wedges; zero object; commutative cofibrant A | [S,∨Eᵢ]=⊕π₀Eᵢ; π_*E=0 ⇒ E≃0; Shipley 4.1/4.3: R-alg-cofibrant ⇒ R-cofibrant | holds | locator |
| G2.5 Freudenthal, (k−1)-connected X | k=1, X=S¹; k=2, X=S² | π₁S¹→π₂S² onto (i=2k−1=1); π₂S²≅π₃S³ (i=2≤2k−2); π₃S²=ℤ→π₄S³=ℤ/2 onto; Hatcher 4.24 with n=k | holds | locator |
| G2.5 excision → unit X→ΩΣX | X (k−1)-connected | X→CX k-connected on both sides ⇒ (2k−1)-cartesian ⇒ unit (2k−1)-connected | consistent with Hatcher 4.23 | none |
| G2.5 shuffle signs | m×n grid transpose; complex interleave | m=2: (−1)^C(n,2), n=2 gives −1 (one transposition); m=3: (−1)^(3C(n,2))=(−1)^C(n,2); m=4: +1; interleave inversions Σ(n−j)=n(n−1)/2 | holds | none |
| G2.8 special/very special Γ-spaces | X(n₊)=Aⁿ for A=ℕ and A=ℤ | Segal map A²→A×A identity; ℕ special, not very special; group completion ℤ | holds | none |
| G2.11 HTT locators | 1.2.4.3, 1.2.9.3, 2.2.1.2, 3.3.1.8, A.2.6.13, 5.2.7.4 | four match their use; A.2.6.13 is an Example about isomorphisms; 5.2.7.4 lacks the precomposition clause (5.2.7.12) | two wrong | R19 |
| G3.3 comparison theorem | Hℤ→Hℚ; countable wedge of S¹; KU | ℤ→ℚ not an iso, so excluded; ∏E^q(S¹) on both sides; KU⁰(*)=ℤ, no connectivity needed | holds | none |
| G3.4 Milnor and signs | Xᵢ=S¹ with degree-2 maps; overlap i | H¹(Tel)=lim=0; H²=lim¹=ℤ₂/ℤ≠0; i even: aᵢ−fᵢ*aᵢ₊₁, i odd: fᵢ*aᵢ₊₁−aᵢ, so (−1)^i(aᵢ−fᵢ*aᵢ₊₁); ε turns it into 1−shift | holds (Hatcher 3F.8) | locator |
| G4.2 Thom spaces | rank 0; ε¹ over a point; Möbius over S¹ | Th(0_B)=B/∅=B₊; D¹/S⁰=S¹; Th(ε^r_B)=S^r∧B₊; Th(Möbius)=RP² | holds | none |
| G4.3 Thom (headline) | Möbius with HF₂ and Hℤ; general E | H̃¹(RP²;F₂)=F₂=H⁰(S¹;F₂); H̃¹(RP²;ℤ)=0≠ℤ, so orientation needed; Cohen 10.40 needs connective E, but G4.1 with (Dʳ,Sʳ⁻¹) gives every E | holds; source too weak | R13 |
| G4.4 `U∪U=π*e∪U` | rank 0; ε¹ over a point; TS² with Hℤ | 1=1·1; Δ:S¹→S¹∧S¹ null, so U∪U=0=e(ε)∪U; e=2u | holds | none |
| G4.5 projective-bundle signs | r=1; Grothendieck relation; CP¹; quaternionic line | x−a₁=0 ⇒ a₁=x_L=c₁(L*); Σcᵢ(V)ζ^(r−i)=0 with ζ=c₁(O(1)) ⇒ aᵢ=(−1)^i cᵢ(V); ⟨c₁(γ),CP¹⟩=−1; right-ℂ basis (1,i,j,−k) flips (1,i,j,k), so U^c=(−1)^r U^std | consistent | supplier citation of h fixed (R18) |
| G5.0 Spin stabilization signs | ε_k=(−1)^(k(k−1)/2); BSpin; Mathlib Spin(0) | ε_kε_(k+1)(−1)^k=(−1)^(k²+k)=1; ε_k=−1 iff k≡2,3 mod 4; π₃Spin=ℤ ⇒ π₄BSpin=ℤ, π_(≤3)=0; Lipschitz group of the zero form is the closure of ∅, so trivial ≠ μ₂ | holds | none |
| G5.1 S–W duality | P=Sⁿ | E^q(Sⁿ)=π_(n−q)E; E_(−q)(S^(−n))=π_(−q+n)E | holds | locator |
| G5.2 Atiyah duality | M=pt in ℝ^N; S¹⊂ℝ² | Σ^(−N)S^N=S=D(S⁰); Σ^(−2)(S²∨S¹)=S∨S^(−1)=D(S¹₊); Cohen 10.46: Σ∞Tν≃Σ^(n+k)D(M₊) | holds | locator |
| G5.3 diagram Thom spectra | trivial block on the left | Σ^(r_j−r_i)Thξᵢ=Th(ε⊕ξᵢ) by G4.2, matching ΣX=S¹∧X | consistent | none |
| G5.5 MU cells and orientation table | Gr₁(ℂ²); Gr₂(ℂ⁴); ε_(r+s); HZ on RP² | cells of dimension 0,1; dimensions 0,1,2,2,3,4 (6=C(4,2)); ε₂=−1=ε₁ε₁(−1); Hℤ fails on the Möbius line | holds | none |
| G5.6 rational Hurewicz (headline) | E=S; X=S², k=2 | π₀S⊗ℚ=ℚ, π_(n>0)⊗ℚ=0 (Cohen 10.19); π₂⊗ℚ=ℚ≅H₂; π₃S²⊗ℚ=ℚ→H₃=0 onto, not injective, as stated | holds (Cohen 10.22) | locator |
| G2.1 Kan–Quillen (headline) | Δ[0]→Δ[1]; ∂Δ[1]→Δ[0] | mono with contractible realizations, a trivial cofibration; π₀: 2→1, not a weak equivalence | statable (probe) | state it (R06) |
| G3.1 Brown (headline) | finite versus arbitrary CW | Hatcher 4E.2: all connected CW; Cohen 10.3: finite only | statement right, source weak | R13 |
| `coefficientDegreeEquiv` (Lean) | elaborated type; 𝔽₅ one-object category | no additivity binder; x↦x³ sends 1+1 to 3≠2, so the shift need not be additive | missing hypothesis | delete (R03) |
| `IsHurewiczFibration` (Lean) versus pin | p=id; general p | both hold for id; Lean: ∃ lifting function; pin: continuity plus HLP, equivalent by LiftingFunction.lean:172 | duplicate | delete (R05) |
| `quaternionProjectiveQuotientTopology` | rfl probe | coinduced by mk' on both sides; `rfl` closes | duplicate of Mathlib | delete (R05) |
| AT 8.11b suspension versus line 102 | \|a\|=n, \|ι\|=1 | AT: σ_right(a)=a×u; README: σ(a)=ι×a; τ*(ι×a)=(−1)^n a×ι | consistent | rename citation (R18) |
| `quaternionFrameAction_preserves` (Lean) | g unitary | Σ star((gv)ᵢ)(gw)ᵢ=vᴴ(gᴴg)w | true, not a headline | delete (R10) |

## Not verifiable

- Adams, *Stable Homotopy and Generalised Homology*, Part III: a commercial book with no legal open copy; arXiv and author pages were searched. The G1.3–G1.6 sign conventions were checked internally instead and are mutually consistent.
- Dold's countable disjoint-refinement lemma (G3.5): Dold (Annals 1963) is behind JSTOR. It was checked from the standard argument only.
- Segal, McDuff–Segal, Atiyah–Bott–Shapiro and Joachim (KO, 2001) are recorded as uncertified in the manifest and are cited by locator only. Joachim's "Higher coherences" §6 is reached only through Hebestreit–Sagave §7.8, which was read.

## Source issues

- none
