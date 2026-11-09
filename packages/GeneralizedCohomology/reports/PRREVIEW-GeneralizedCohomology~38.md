# Review of GeneralizedCohomology (pull request #1854 at 1ccc517)

**Verdict:** needs changes

This is an incremental re-review. `TauCetiRoadmap/GeneralizedCohomology/README.md` and `Suggested.lean` are byte-identical to c9c60d0, the head the previous review read. Since then the pull request changed only the AlgebraicTopology and CharacteristicClasses folders, and the pins are unchanged. So no previous finding is repaired by an edit.

- R02 is narrower: HilbertModules has since merged to main, as CStarAlgebras had. OperatorKTheory is still upward.
- The AlgebraicTopology edits (8.8b aspherical-target classification, the 8.8c killing tower, relative Hurewicz from degree two) touch no item this README cites.
- The CharacteristicClasses edits keep every cited item with its content.
- No new finding.

The push gate still fails on: set_option, sorry-data, imports, mathlib-subimports, no-import-mathlib, statement-hygiene, blob, latex, prnum, dropped, depcheck and outside-folder. The ids R01–R19 are kept from the previous report so each can be traced.

## R01 (P1) — Supply cycle through HomotopySpheres, a roadmap that may never be cited as a supplier

**Location.** README line 37: "[HomotopySpheres Stage 3A](…/pull/284) | the native `CompactlyGenerated` inclusion and compact-generation right adjoint; pointed convenient mapping spaces, suspension/loop, smash, mapping cone/Puppe, stable sphere stems and Freudenthal". The same supplier is cited elsewhere:
- line 75: "PR284's convenient category";
- line 241: "PR284 Stage3A";
- line 328: "PR284's convenient spaces";
- line 2320: "HomotopySpheres PR284 §4B";
- line 2487: "PR284 Stage 4B's real loop-space Bott chain";
- `Suggested.lean` line 513: "PR284-owned compact-generation right adjoint".

**Claim.** HomotopySpheres is on the list of roadmaps that may never be cited as suppliers. This roadmap is on main, and HomotopySpheres is #45 in the merge order. The cycle is real, because HomotopySpheres consumes this roadmap.

**Witness.** HomotopySpheres at the head of its open pull request, README line 508: "From TauCetiRoadmap.GeneralizedCohomology. G4.0a supplies the right-quaternionic-line…". Depcheck: `CYCLE among: GeneralizedCohomology, HomotopySpheres, StringOrientation, TangentialBordism`. The gate's `dropped` hits (lines 37 and 2320) are these citations.

**Repair.**
1. Delete the line-37 row and every PR284 citation.
2. Take the following from AlgebraicTopology, as this pull request's AlgebraicTopology README states them:
   - the compact-generation coreflection `k`, its counit and `k(X×Y)`, from Stage 4.5 (lines 139–152);
   - the based suspension–loop adjunction, from 8.11b (lines 137–138).
3. State the pointed convenient smash, mapping cone/Puppe and stems `π_n S` here, as G2.5 targets. G2.5 already proves Freudenthal, so delete "compatibility with the sphere-only supplier theorem" and "the supplier's stabilized sphere colimit".
4. State the real space-level Bott loop chain as a G5.0/G5.4 target and record the move in Scope.
5. Delete "PR284-owned" from the Lean docstring.
6. Reword the two depcheck false positives in the consumer form that line 46 shows the check accepts:
   - line 3419: "before StringOrientation defines λ and BString";
   - line 43: "structured PT and geometric bordism remain TangentialBordism".
   For example: "StringOrientation, a consumer, defines λ and BString after G5.0".

Test: rerun the depcheck; no UPWARD or CYCLE line may remain.

## R02 (P2) — Upward supplier OperatorKTheory; two suppliers now on main are still linked by pull-request URL

**Location.** README line 45: "[HilbertModules H2, H4–H6](…/pull/861), [CStarAlgebras C5](…/pull/860), [OperatorKTheory K5](…/pull/866) | complex Hilbert compact operators/spatial tensors, strong-topology unitary contractibility, regular functional calculus and graded Clifford APIs". Line 2649 cites the same three: "APIs consume CStarAlgebras C5, HilbertModules H2/H4–H6 and OperatorKTheory K5".

**Claim.** Partly repaired, by merges outside this pull request:
- CStarAlgebras and HilbertModules are now on main, and the cited sections resolve there.
- OperatorKTheory is still an open new-roadmap pull request at merge-order position #9, so a roadmap on main consumes an unmerged plan.
- The two merged suppliers are still linked by pull-request URL.

**Witness.**
- Depcheck on this head: `UPWARD: GeneralizedCohomology (on main) -> OperatorKTheory (#9) at README lines [45]`. No HilbertModules line remains.
- HilbertModules on main has H2 (line 179), H4 (325), H5 (356) and H6 (705). Strong-topology contractibility of U(H) is at lines 664–670.

**Repair.**
1. Relink by path and section: `../HilbertModules/README.md` H2 and H4–H6, and `../CStarAlgebras/README.md` C5.
2. From OperatorKTheory K5, state here, as a G5.5 target, the complex graded C*-algebra/Clifford conventions consumed from K5.1 (line 1129 at its head), together with the swapped two-odd-factor parity reduction and its sign adapter (README lines 2650–2652). Record the move in Scope. OperatorKTheory already lists this roadmap as a consumer (its line 2332), so after the move it cites G5.5.
3. Rerun the depcheck until no OperatorKTheory line remains.

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

**Claim.** A `def` or `instance` with a `sorry` body or field is forbidden. Two of them also have the wrong type.

**Witness.** Gate `sorry-data=22`. The elaborated type of `coefficientDegreeEquiv` (`signatures.md`) lacks `[∀ n, (shiftFunctor C n).Additive]`. On a one-object preadditive category with endomorphism ring 𝔽₅, the monoid automorphism x↦x³ is a shift that sends 1+1 to 3, not 2. `suspensionCohomologyEquiv` lacks the same binder.

**Repair.** Delete all 22. Each stays in the README as a construction target with its intended signature (G2.1–G2.4, G4.0).

## R04 (P2) — `set_option` in Suggested.lean

**Location.** `Suggested.lean` lines 333 and 355: `set_option maxHeartbeats 1000000 in`, on `quaternionSpEmbeddedLieSubgroupData` and `quaternionSp_contMDiff_iff_comp_subtypeVal`.

**Witness.** Gate `set_option=2`.

**Repair.** Delete the `QuaternionSpLieData` section (lines 289–372) and the chart APIs at lines 377–408. These are G4.0b chart facts, not headlines, and the README keeps them. This also removes R09.

## R05 (P2) — Suggested.lean redeclares carriers the pins already have; the README says the pin lacks them

**Location.**
- `Suggested.lean`: `PointedSSet` (line 499), `FiniteBijection` (523), `SymmetricSequence` (596), `SymmetricSpectrum` (665), `IsHurewiczFibration` (62), `MappingPathSpace`/`MappingPathFiber` (51, 87), `mappingPathFiberConstHomeomorphPath` (97), `quaternionProjectiveQuotientTopology` (467).
- README line 3525: "it does not supply a category of spectra".
- README lines 1791–1792: "consume AT4.6's generic division-ring quotient topology".

**Claim.** Each object is declared at the pins with a real body, and `Suggested.lean` redeclares it under `TauCetiRoadmap.GeneralizedCohomology`. Its `IsHurewiczFibration` is a different definition: existence of a lifting function, where the pinned one is continuity plus homotopy lifting.

**Witness (re-opened at the unchanged pin).**

| Suggested.lean | At the pin |
| --- | --- |
| `PointedSSet` | Tau Ceti `AlgebraicTopology/SimplicialSet/Pointed/Basic.lean:33` (`abbrev PointedSSet := Under Δ[0]`) |
| `FiniteBijection` | `CategoryTheory/FiniteBijection.lean:45` |
| `SymmetricSequence` | `AlgebraicTopology/Spectra/SymmetricSequence.lean:90` |
| `SymmetricSpectrum` | `AlgebraicTopology/Spectra/SymmetricSpectrum.lean:92` (`Mod SymmetricSequence SymmetricSequence.sphere`) |
| `IsHurewiczFibration` | `Topology/Homotopy/HurewiczFibration/Basic.lean:58` |
| `quaternionProjectiveQuotientTopology` | Mathlib `Projectivization.instTopologicalSpace`, `Topology/Algebra/Projectivization.lean:44` (any `DivisionRing K`); the previous review's probe closed the equality by `rfl` |

**Repair.**
1. Delete these declarations.
2. Add "From Tau Ceti" and "From Mathlib" supplier contracts naming each pinned declaration with its file.
3. In G4.0, replace "AT4.6's generic division-ring quotient topology" by Mathlib `Projectivization.instTopologicalSpace`.
4. Replace line 3525 by a true sentence: the pin has symmetric spectra with smash, free spectra, limits, colimits and mapping spaces, but no stable equivalences, no stable model structure and no Brown representation.

## R06 (P2) — No headline theorem is stated; the statable Kan–Quillen headline is absent

**Location.** `Suggested.lean` lines 31–42: "**This file is not the roadmap and is not exhaustive.** … The statements here suggest Lean forms for particular milestones". README lines 18–19: "`Suggested.lean` checks selected carrier and interface shapes".

**Claim.** The file is an API catalogue. The README's headlines are:
- Kan–Quillen (G2.1);
- the stable model structure on symmetric spectra (G2.3);
- Brown representability on arbitrary CW (G3.1);
- the Milnor sequence (G3.4);
- the generalized Thom isomorphism (G4.3);
- Spanier–Whitehead/Atiyah duality (G5.1–G5.2);
- rational stable Hurewicz (G5.6).

Kan–Quillen is statable at the pins and absent. The docstring does not say which of the others are not statable.

**Witness.** The previous review's probe elaborated the following under `import Mathlib` and `import TauCeti.Topology.Category.TopCat.WeakEquivalence`. The pins are unchanged, and neither pin has a `ModelCategory SSet` instance: Mathlib's only global model-category instance is on cochain complexes (`Algebra/Homology/ModelCategory/Injective.lean:205`), and a grep of Tau Ceti finds none.

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

**Repair.**
1. Write the docstring as "GeneralizedCohomology: target signatures". It says that README.md is the roadmap and that this file states its headline theorems.
2. State the Kan–Quillen headline.
3. List each headline that is not statable, with what is missing:
   - the stable model structure: there are no stable equivalences on `TauCeti.SymmetricSpectrum`;
   - Brown and Milnor: there is no category of axiomatic cohomology theories on pointed CW complexes;
   - Thom: there is no generalized theory or orientation;
   - duality and rational Hurewicz: there is no stable homotopy category.
4. Delete the sentence at README lines 18–21.

## R07 (P2) — G2.1/G2.11 and HigherToposTheory both own Kan–Quillen, Bergner, Joyal and straightening

**Location.**
- Line 222: "First build the unpointed Kan–Quillen model structure".
- Lines 669–671: "Enriched, quasicategorical and monoidal foundations. These simplicial-set, quasicategorical and operadic foundations are construction targets of this item".
- Line 1059: "This constructs the Joyal model".
- Lines 62–65: "BordismFormalGroups F6.5 and EllipticCohomology consume G2.11's enriched, quasicategorical…".

**Claim.** These objects have two planned owners. Separately, the claim that EllipticCohomology consumes G2.11 is unsupported.

**Witness.**
- HigherToposTheory, another author's open new roadmap, at its head: Kan–Quillen as F2 (lines 9, 37), Bergner as F3 (lines 39, 228), Joyal as L3 (lines 18, 230), straightening as L4 (lines 19, 232).
- EllipticCohomology on main cites only G2.5, G2.8 and G3.8, never G2.11.

**Repair.**
1. This roadmap is on main and earlier, so it is the owner. Say so in Scope: "G2.1 owns the Kan–Quillen structure; G2.11 owns the Bergner and Joyal structures and marked straightening; HigherToposTheory consumes them."
2. Drop "and EllipticCohomology" from lines 62–65.

## R08 (P3) — Imports

**Location.** `Suggested.lean` lines 1–29: 25 `import Mathlib.*` lines and no `import Mathlib`.

**Witness.** Gate `imports=1`, `mathlib-subimports=25`, `no-import-mathlib=1`.

**Repair.** Use `import Mathlib`, then only the `TauCeti.*` modules still used after R03–R06. For the Kan–Quillen headline that is `TauCeti.Topology.Category.TopCat.WeakEquivalence`, which exists at the pin.

## R09 (P3) — statement-hygiene: a definition chooses its datum

**Location.** `Suggested.lean` lines 328–329, `Classical.choose` in `quaternionSpSliceChartData`.

**Witness.** Gate `statement-hygiene`, two P3 hits.

**Repair.** Delete it with the R04 block.

## R10 (P3) — Padding and process comments in Suggested.lean

**Location.**
- Restatements closed by `rfl` or `ext; rfl`: lines 115, 120, 130, 135, 161, 167, 254, 492, 674, 678.
- Line 357: `exact` with one library lemma.
- Line 69, `IsHurewiczFibration.lift`.
- Instance-only `example`s: lines 286, 411, 621–623.
- Thin definitions that no headline uses: `StablePi`, `SpectralCohomology`, `SpectralHomology`, `cohomologyPullback`, `externalProductClass`, `stagewisePhantoms`, `finiteDualEvaluation`/`Coevaluation`, `IntegerGradedCofunctor`, the Clifford and Hilbert synonyms, `QuaternionGrassmannian`, `quaternionHermitian`, `quaternionFrameAction`.
- Process comments: line 465, "Delete this local specialization when AT4.6 supplies…"; line 513, "PR284-owned".

**Witness.** Each listed proof closes by `rfl` or by one library lemma as written in the file, which is unchanged since the previous review's probe.

**Repair.** Delete them from `Suggested.lean`; the README keeps each statement.

## R11 (P3) — Moved ids without old → new lines

**Location.**
- Line 33: "Stage4.5's simplicial-realization product comparison |K×L|≃k(|K|×|L|)". `Suggested.lean` line 514 still declares `realizationProductKelleyComparison`.
- Lines 62–65: G2.11 receives BordismFormalGroups F6.5's foundations.

**Witness.**
- These cite "G2.1's `realizationProductKelleyComparison`" at their heads: HigherToposTheory line 198 and StableHomotopyKTheory line 236. DGFloer on main also cites it, at line 156.
- StableHomotopyKTheory line 16 still names "BordismFormalGroups, F6.5" as the owner of "Sp∞, symmetric coherence, infinity-operad interfaces".

**Repair.** Add one line per move in Scope:
- "G2.1's realization-product comparison (`realizationProductKelleyComparison`) → AlgebraicTopology Stage 4.5";
- "BordismFormalGroups F6.5's enriched/quasicategorical/monoidal-localization foundations → G2.11".

Delete the Lean declaration (R03).

## R12 (P3) — README is not in TauCetiRoadmap form

**Location.**
- Line 1 is "# Generalized cohomology, spectra and orientations", with no `**Summary.**`.
- Line 23 is "## Scope and suppliers". There are no Scope and ownership, Exact supplier contracts or How to read the build sections.
- Items are numbered paragraphs hundreds of lines long (G2.11 is lines 669–1505).
- Lines 20–21 are implementation instructions.

**Witness.** Zero matches for `**Checks`, `*Needs:*`, `### Examples`, `### Dependencies` and `**Summary`. The worker's seeded sample found no targets by heading.

**Repair.**
1. Use `# Roadmap: generalized cohomology, spectra and orientations` with a Summary and the standard sections.
2. Turn G1–G5 into `## Layer k` with `### k.n` subsections.
3. Give each definition API bullets and three Checks. Candidates:
   - the G1.7 square-zero test with its 2σ²=0 negative control;
   - the G3.6 phantom;
   - the G4.3 Möbius/Hℤ failure;
   - the G2.6 F₁S¹ nonsemistable spectrum.
4. Give each target a `*Needs:*` line, and end each layer with Examples and Dependencies.
5. Delete the implementation instructions.

## R13 (P3) — Claims carry no locators; two cited sources are weaker than the statements

**Location.**
- No target in G1–G5 outside G2.11 has a theorem-level locator.
- G3.1 states Brown representability on arbitrary connected CW.
- G4.3 (line 2053) states the Thom isomorphism for every ring spectrum E.

**Witness.**
- Cohen Thm 10.3 (`CohenBMH` line 10035, p. 282) gives the bijection for finite CW only. The arbitrary form is Hatcher Thm 4E.2 (`HatcherAT` line 19338, p. 449).
- Cohen Thm 10.40 (`CohenBMH` line 11933, p. 330) assumes connective E and a connected base.

**Repair.**
1. Add a locator at each claim. The previous review verified these:
   - G2.3: HSS Def 3.1.3, Prop 3.1.4, Thm 3.4.4;
   - G2.4: Shipley Prop 4.1, Cor 4.3;
   - G2.5: Hatcher 4.23–4.24;
   - G2.6: HSS 5.6.1;
   - G3.1: Hatcher 4E.1–4E.2;
   - G3.4: Hatcher 3F.8;
   - G5.1: Cohen 10.43;
   - G5.2: Cohen 10.46;
   - G5.6: Cohen 10.19 and 10.22.
2. Write G4.3's route as "*Needs:* G4.1" (relative Leray–Hirsch with (Dʳ,Sʳ⁻¹) and the basis class U), and cite Cohen 10.40 only for the connective case.

## R14 (P3) — README and Suggested.lean disagree on names

**Location.** 90 of the 98 Lean names never occur in the README (`PointedSSet`, `coefficientDegreeEquiv`, `levelPermutation`, …). About 60 backticked names of this roadmap's own are declared nowhere, for example `connectiveSpectrumMapsToHA`, `stableBSpin_homotopyGroupsThroughEight` and `quaternionicHopfSphereHomeomorph`.

**Witness.** Both files are byte-identical to the previous review's, whose script compared every Lean name with the README and every backticked README identifier with `Suggested.lean`.

**Repair.** After R03–R10 the Lean file holds only headlines; name each in the README. Remove the backticks from README-only names unless `Suggested.lean` declares them.

## R15 (P3) — Commit-pinned links, pull-request numbers, a broken relative link

**Location.**
- Gate `blob` lines 39, 42, 3112, 3260, 3262.
- Gate `prnum` lines 39 ("ComplexManifolds PR279", "#279's"), 75, 241, 328, 2320, 2487.
- Line 45 links three pull requests.
- Line 41 links `../SpinRepresentations/README.md`; on main that roadmap is at `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/`.

**Witness.** Open revisions rename three of the pinned anchors:
- ComplexKahlerGeometry `#k7-…`, in three open pull requests;
- AlgebraicTopology `#stage-8-…`, in its open revision;
- SpinGeometry `#g1-…`, in its open revision.

The labels survive at those heads: "### 7.1 Projective charts and orientation (K7.1)", "### 8.2 Kan and cubical comparison", "G1.3".

**Repair.** Cite by name and section: "ComplexKahlerGeometry K1, K7.1", "SpinGeometry G1.3", "AlgebraicTopology Stage 8.2", "SmoothBundlesConnections B1.4", "ComplexManifolds Milestones 1–2". Drop the PR numbers and fix the SpinRepresentations path.

## R16 (P3) — LaTeX delimiter outside a code span

**Location.** Line 3279: "specified compactifications V=K\A, Z=L\(A∩L), U=K\(A∪L), where".

**Witness.** Gate `latex=2`.

**Repair.** Write `` `V=K∖A` ``, `` `Z=L∖(A∩L)` ``, `` `U=K∖(A∪L)` ``, with ∖ inside code spans.

## R17 (P3) — Edits outside this pull request's roadmap folders

**Location.**
- `Completed/ArithmeticDirichletSeries/README.md`: one line, "LFunctions consumes this package…".
- `TauCetiRoadmap/SymplecticGeometry/README.md`: three lines, "HeegaardFloer and DGFloer consume the geometric boundary and sign adapters of CG6".

**Witness.** The brief's exclusion diff (`git diff --stat origin/main...HEAD` minus this pull request's 17 folders) lists exactly these two files, with 4 insertions and 4 deletions. Neither folder is among the folders this pull request is reviewed for.

**Repair.** Move both edits to a pull request that owns those folders, or have the folders registered as folders of this one so that they are reviewed.

## R18 (P2) — Supplier drift against this pull request's own AlgebraicTopology README

**Location.**
- Line 35: "Stage 8.8c's functorial abelian EM models; ordinaryEMUniversalClass, ordinaryEMRepresentability, ordinaryEMRelativeRepresentability, ordinaryEMLoopComparison, ordinaryCohomologySuspension and projectiveEMComparisons".
- Lines 2093–2094: "CC C1.5's x_CC=c₁(γ) pairs to −1 and AT's projectiveEMComparisons pins h_AT to pair+1".
- Line 101 `ordinaryCohomologySuspension`, and lines 231–232 `simplicialRealizationCW`, `simplicialGroupKan`, `simplicialGroupMooreHomotopyIso`, `kanRealizationUnitHomotopyIso`.

**Claim.** AlgebraicTopology at this head does not define these names. After the merge, the line-35 contract and G4.5's sign normalization cite a supplier that does not provide them.

**Witness.** `grep -c -F` over AlgebraicTopology's README returns 0 at this head (and at c9c60d0) for nine names: `ordinaryEMUniversalClass`, `ordinaryEMRelativeRepresentability`, `ordinaryEMLoopComparison`, `ordinaryCohomologySuspension`, `projectiveEMComparisons`, `simplicialRealizationCW`, `simplicialGroupKan`, `simplicialGroupMooreHomotopyIso`, `kanRealizationUnitHomotopyIso`. Main has every one. AlgebraicTopology 8.12 (line 2847) constructs no projective carrier.

**Repair.** Cite by item, with the line numbers at this head:
- AlgebraicTopology 8.2 (line 2240) for the Kan property of simplicial groups, the Moore comparison and the Kan realization-unit comparison;
- 4.7 (line 1083) for the realization CW structure;
- 8.10 (line 2688) for the universal class and absolute and relative representability;
- 8.11b (line 2771) for the EM loop comparison and the ordinary cohomology suspension σ_right=a×u;
- CharacteristicClasses C1.5a (line 788) for "f_h pairs to +1 on CP¹" (line 802), in line 35 and in lines 2093–2094.

The signs agree (table below). Rerun `roadmaps resolve` afterwards.

## R19 (P3) — Two HTT locators in G2.11 point at the wrong statement

**Location.**
- Line 1055: "recognition (HTTA.2.6.13) with monomorphism cofibrations".
- Lines 1243–1246: "precomposition identifies functors out of the target with functors inverting the unit maps … (the localization criterion of HTT5.2.7.4)".

**Witness.**
- HTT A.2.6.13 (`LurieHTT` line 38362, p. 825) is an Example: isomorphisms form a perfect class. The recognition result is Prop A.2.6.15 (line 38368).
- HTT 5.2.7.4 (line 17361, p. 365) characterizes localization functors. The precomposition statement is Prop 5.2.7.12 (line 17500, p. 368).

**Repair.** Cite "HTT A.2.6.15 (perfect class: Def A.2.6.12)" and "HTT 5.2.7.4, 5.2.7.12".

## Previous findings

- R01 — not repaired: line 37 "[HomotopySpheres Stage 3A](…/pull/284) | the native `CompactlyGenerated` inclusion and compact-generation right adjoint…"; lines 75, 241, 328, 2320, 2487; `Suggested.lean` line 513 "PR284-owned".
- R02 — partly repaired: line 45 is unchanged, but HilbertModules has merged to main (H2/H4–H6 resolve) as CStarAlgebras had. OperatorKTheory (#9) is still UPWARD, and all three links are still pull-request URLs.
- R03 — not repaired: `Suggested.lean` lines 246–751, 22 sorry'd `def`/`instance`; `coefficientDegreeEquiv` still lacks the additivity binder.
- R04 — not repaired: `Suggested.lean` lines 333, 355, `set_option maxHeartbeats 1000000 in`.
- R05 — not repaired: `Suggested.lean` lines 51–137, 467, 499, 523–665; README line 3525 "it does not supply a category of spectra".
- R06 — not repaired: `Suggested.lean` lines 31–42 "**This file is not the roadmap and is not exhaustive.**"; no Kan–Quillen statement.
- R07 — not repaired: line 222 "First build the unpointed Kan–Quillen model structure"; line 670 "simplicial-set, quasicategorical and operadic foundations are construction targets of this item".
- R08 — not repaired: `Suggested.lean` lines 1–29, 25 `import Mathlib.*` lines.
- R09 — not repaired: `Suggested.lean` lines 328–329 `Classical.choose`.
- R10 — not repaired: `Suggested.lean` lines 115–171, 254, 286, 411, 465, 492, 513, 621–623, 674–681.
- R11 — not repaired: line 33 "Stage4.5's simplicial-realization product comparison"; `Suggested.lean` line 514; no old → new line.
- R12 — not repaired: line 1 "# Generalized cohomology, spectra and orientations"; line 23 "## Scope and suppliers".
- R13 — not repaired: no theorem-level locator in G1–G5 outside G2.11.
- R14 — not repaired: 90 of 98 Lean names absent from the README.
- R15 — not repaired: gate `blob` lines 39, 42, 3112, 3260, 3262; `prnum` lines 39, 75, 241, 328, 2320, 2487; line 41 `../SpinRepresentations/README.md`.
- R16 — not repaired: line 3279 "V=K\A, Z=L\(A∩L), U=K\(A∪L)".
- R17 — not repaired: `Completed/ArithmeticDirichletSeries/README.md`, `TauCetiRoadmap/SymplecticGeometry/README.md`.
- R18 — not repaired: line 35 "ordinaryEMUniversalClass, … ordinaryCohomologySuspension and projectiveEMComparisons"; lines 2093–2094 "AT's projectiveEMComparisons pins h_AT to pair+1".
- R19 — not repaired: line 1055 "recognition (HTTA.2.6.13)"; line 1246 "the localization criterion of HTT5.2.7.4".

## Verified sound

**Change set.** `git diff c9c60d0..1ccc517 -- TauCetiRoadmap/GeneralizedCohomology` is empty. Over that range the pull request changed only `TauCetiRoadmap/AlgebraicTopology/{README.md,Suggested.lean}` and `TauCetiRoadmap/CharacteristicClasses/{README.md,Suggested.lean}`. `lake-manifest.json` and `lean-toolchain` are unchanged, and `Suggested.lean` is identical to main's.

**Gate (rerun on this head).** Same failures as the worker's gate:
- set_option=2, blob=5, latex=2, prnum=6, sorry-data=22;
- imports=1, mathlib-subimports=25, no-import-mathlib=1;
- statement-hygiene=2, dropped=2, depcheck=5.

The bare rerun reports outside-folder=34 because it counts this pull request's own roadmap folders. The brief's exclusion diff leaves 2 (R17).

**Dependency check (this head, `--movable`):**

```
UPWARD: GeneralizedCohomology (on main) -> HomotopySpheres (#45) at README lines [37]
UPWARD: GeneralizedCohomology (on main) -> OperatorKTheory (#9) at README lines [45]
UPWARD: GeneralizedCohomology (on main) -> StringOrientation (#11) at README lines [3419]
UPWARD: GeneralizedCohomology (on main) -> TangentialBordism (#14) at README lines [43]
CYCLE among: GeneralizedCohomology, HomotopySpheres, StringOrientation, TangentialBordism
depcheck: 239 roadmaps, 2380 edges, 5 problem(s)
```

The HilbertModules line of the previous run is gone, because HilbertModules is now on main. The hits at lines 3419 and 43 are false positives (R01, step 6).

**Elaboration.** `lake env lean TauCetiRoadmap/GeneralizedCohomology/Suggested.lean` exits 0 in 1 min 18 s, with 25 "declaration uses `sorry`" warnings and nothing else.

**Binder check.** `signatures.md` flags 11 declarations, the same 11 as the previous review, whose `#check` comparison stands because the file and pins are identical:
- `coefficientDegreeEquiv` and `suspensionCohomologyEquiv` lose the shift-additivity binder (R03);
- `realizationProductKelleyComparison` drops `hk`, which its type does not mention (R03);
- the other eight drop only binders their types do not use.

**Citations into the folders this change touched (this head).**

AlgebraicTopology. The diff hunks are at old lines 100, 446, 2284–2294, 2453, 2510 and 2845: 8.8b ownership, the pinned inventory, relative Hurewicz, the 8.8b/8.8c presentation-complex and killing-tower text, and the dependency table. This README cites none of 8.8a, 8.8b, the relative Hurewicz item or the killing tower. Every cited item exists with the cited content:
- 4.5 compact generation (lines 139–152, 1003);
- 4.5 `ordinaryPairQuotientComparison`/`…CohomologyComparison` (1026);
- 4.7 realization CW (1083);
- 4.8 CW approximation (1110);
- 5.5 (1268);
- 6.0 countable towers (1446);
- 8.2 Kan/Moore/realization unit (2240);
- 8.8c functorial K(A,n) (2530);
- 8.8d Serre classes (2604);
- 8.10 (2688);
- 8.11b suspension σ_right (2779–2794);
- 8.12 (2847).

AlgebraicTopology's 11 references to this roadmap are unchanged in count and content.

CharacteristicClasses. The numbering is unchanged, and each cited item has the cited content:
- C1.1b numerable join (line 332);
- C1.2a compact supports (583);
- C1.2b |Sing X|→X counit (670–679);
- C1.5: x pairs to −1 on CP¹ (781); torus models `ET_N=(S^(2N+1))^m`, `BT_N=(CP^N)^m` (772–774);
- C1.5a: f_h pairs to +1 (788, 802);
- C2.1 Thom pair (931);
- C2.4 embedding Gysin (1169);
- C2.5 fibre integration with fibrewise tube (1175, 1195);
- C3.2 `c_r=e(E_R)` (1337).

The only edit in this window to a line naming a roadmap is a LieGroupoidsPoisson link. CharacteristicClasses' two references to this roadmap (lines 2233, 2237) are unchanged.

**Other citations resolved (this round).**
- On main: HilbertModules H2/H4/H5/H6 (lines 179, 325, 356, 705; strong topology at 664–670), CStarAlgebras C5, DGFloer line 156.
- At open heads:
  - OperatorKTheory K5 (line 1127), its 5.1 (1129) and its consumer line 2332;
  - HomotopySpheres, lines 82, 170, 508;
  - HigherToposTheory, lines 9, 17–19, 37–40, 197–198, 227–232;
  - StableHomotopyKTheory, lines 16, 236;
  - ComplexKahlerGeometry, "### 7.1 … (K7.1)" (line 2273);
  - AlgebraicTopology, "### 8.2 Kan and cubical comparison" (line 2649);
  - SpinGeometry, "G1.3" (line 57).

`roadmaps resolve` reports no citation found nowhere. The R18 names resolve only because main's AlgebraicTopology still has them.

**Library declarations re-opened at the pins:**
- Tau Ceti:
  - `AlgebraicTopology/SimplicialSet/Pointed/Basic.lean:33`;
  - `AlgebraicTopology/Spectra/SymmetricSequence.lean:90`;
  - `AlgebraicTopology/Spectra/SymmetricSpectrum.lean:92`;
  - `CategoryTheory/FiniteBijection.lean:45`;
  - `Topology/Homotopy/HurewiczFibration/Basic.lean:58`;
  - `Topology/Category/TopCat/WeakEquivalence.lean` (present).
- Mathlib:
  - `Topology/Algebra/Projectivization.lean:44`;
  - `Algebra/Homology/ModelCategory/Injective.lean:205`, the only global `ModelCategory` instance (`ModelCategory/Over.lean:143` is generic over `Over`).

No `ModelCategory SSet` or Kan–Quillen declaration exists in Tau Ceti.

**Overlaps.** Every `overlaps.md` item was checked:
- #1807 and #1808 carry this README byte-identical to this head, and #1187 carries main's. None differs from this pull request on this roadmap.
- #1187's `Suggested.lean` conflict is with main's file, which this pull request leaves unchanged.
- The three dropped anchors are covered by R15, and their ids survive at each head.
- No id of this roadmap is dropped.
- The closest-vocabulary entries are HigherToposTheory (R07, R11), StableHomotopyKTheory (R11), TangentialBordism (R01's false positive) and BordismFormalGroups (R11).

**Seeded sample.** The worker's sample found no targets by heading, because the README has no target headings (R12). With 0 changed lines, no target falls in a changed passage. The README flags no locator as unverified. The previous review's seed-33 sample stands: G2.3, G2.4, G2.5, G2.8, G2.11, G3.3, G3.4, G4.2, G4.4, G4.5, G5.0, G5.1, G5.2, G5.3, G5.5.

**Remarks on untouched text** (no R-number, no change requested):
- Line 2043 cites "CharacteristicClasses C2.1's disc/sphere quotient". The disk/sphere cell structure is CharacteristicClasses C2.0 (line 856); C2.1 is the Thom pair (E,E∖0), and its last sentence compares the two pairs.
- G4.0a (line 1844) consumes CharacteristicClasses C1.1b, while CharacteristicClasses C7 (lines 2233, 2237) consumes G4.0a. This is acyclic by item but two-way by roadmap. Both roadmaps are on main, so the depcheck does not flag it.

**Adversarial table.** The rows for statements this change leaves untouched (all of them) are carried from the previous report (PRREVIEW-GeneralizedCohomology~33), with its computed values. Four rows are added, one for each statement that consumes a supplier item in a folder this change touched; they are marked "new".

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| new: line 102 `σ_AT(a)=(−1)^n τ*σ(a)` against AlgebraicTopology 8.11b σ_right=a×u | \|a\|=0, a=1; \|a\|=1 | n=0: σ_AT(1)=u and τ*(ι×1)=ι, equal. n=1: τ*(ι×a)=−a×ι, times (−1)¹ gives a×ι. In general (−1)^n·(−1)^n a×ι=a×ι | consistent | none |
| new: line 107 `δ_(X,A)=(−1)^(n+1)c_AT*σ_AT` against AlgebraicTopology 8.11b `δ_(X,B)=(−1)^(n+1)c_AT^*σ_right` | n=0, n=1 | signs −1 and +1 on both sides; same collapse c_AT | consistent | none |
| new: lines 2093–2094 `x_G^HZ=−x_CC=h_AT` against CharacteristicClasses C1.5/C1.5a | CP¹ with γ=O(−1); the wrong sign x_G=+x_CC | ⟨x_CC,[CP¹]⟩=⟨c₁(O(−1)),[CP¹]⟩=−1 (C1.5, line 781); ⟨−x_CC,[CP¹]⟩=+1=⟨h,[CP¹]⟩ (C1.5a, line 802); +x_CC gives −1≠+1 | consistent; the supplier name is wrong | R18 |
| new: line 2588 `c_r^CC(ν)=e_HZ(ν)` against CharacteristicClasses C3.2 `c_r=e(E_R)` | rank 0; O(−1) on CP¹ | rank 0: c₀=1 and the rank-0 Thom class is the sign +1, so e=1; rank 1: ⟨c₁,[CP¹]⟩=−1 and the Euler number of O(−1)_ℝ is the zero-section self-intersection −1 | consistent | none |
| G2.3 stable equivalences via derived maps into Ω-spectra | λ:F₁S¹→F₀S⁰; zero spectrum | Map(λ,E)=(E₀→ΩE₁) is a weak equivalence for every Ω-spectrum E; naive π₀F₁S¹ is not ℤ (HSS Ex 3.1.10) | holds (r33) | locator (R13) |
| G2.4 compact generator, flat smash | wedges; zero object | [S,∨Eᵢ]=⊕π₀Eᵢ; π_*E=0 ⇒ E≃0 | holds (r33) | locator |
| G2.5 Freudenthal, (k−1)-connected X | k=1, X=S¹; k=2, X=S² | π₁S¹→π₂S² onto; π₂S²≅π₃S³; π₃S²=ℤ→π₄S³=ℤ/2 onto | holds (r33) | locator |
| G2.5 shuffle signs | m×n transpose; complex interleave | m=2: (−1)^C(n,2), so n=2 gives −1; m=4: +1; interleave inversions n(n−1)/2 | holds (r33) | none |
| G2.8 special/very special Γ-spaces | X(n₊)=Aⁿ for A=ℕ, ℤ | Segal map is the identity; ℕ special, not very special; group completion ℤ | holds (r33) | none |
| G2.11 HTT locators | A.2.6.13, 5.2.7.4 | A.2.6.13 is an Example on isomorphisms; 5.2.7.4 lacks the precomposition clause (5.2.7.12) | two wrong (r33) | R19 |
| G3.3 comparison theorem | Hℤ→Hℚ; KU | ℤ→ℚ not an isomorphism, so excluded; KU⁰(*)=ℤ | holds (r33) | none |
| G3.4 Milnor | Xᵢ=S¹, degree-2 maps | H¹(Tel)=lim=0; H²=lim¹=ℤ₂/ℤ≠0; sign (−1)^i(aᵢ−fᵢ*aᵢ₊₁) | holds (r33) | locator |
| G4.2 Thom spaces | rank 0; ε¹ over a point; Möbius | Th(0_B)=B₊; D¹/S⁰=S¹; Th(Möbius)=RP² | holds (r33) | none |
| G4.3 Thom (headline) | Möbius with HF₂ and Hℤ | H̃¹(RP²;F₂)=F₂=H⁰(S¹;F₂); H̃¹(RP²;ℤ)=0≠ℤ, so an orientation is needed | holds; source too weak (r33) | R13 |
| G4.4 `U∪U=π*e∪U` | rank 0; ε¹; TS² | 1=1·1; U∪U=0=e(ε)∪U; e=2u | holds (r33) | none |
| G4.5 projective-bundle signs | r=1; CP¹; quaternionic line | aᵢ=(−1)^i cᵢ(V); ⟨c₁(γ),CP¹⟩=−1; U^c=(−1)^r U^std | consistent (r33) | R18 (name only) |
| G5.0 Spin stabilization | ε_k=(−1)^(k(k−1)/2) | ε_kε_(k+1)(−1)^k=1; π₃Spin=ℤ ⇒ π₄BSpin=ℤ | holds (r33) | none |
| G5.1 S–W duality | P=Sⁿ | E^q(Sⁿ)=π_(n−q)E=E_(−q)(S^(−n)) | holds (r33) | locator |
| G5.2 Atiyah duality | point in ℝ^N; S¹⊂ℝ² | Σ^(−N)S^N=S=D(S⁰); Σ^(−2)(S²∨S¹)=S∨S^(−1)=D(S¹₊) | holds (r33) | locator |
| G5.3 diagram Thom spectra | trivial block | Σ^(r_j−r_i)Thξᵢ=Th(ε⊕ξᵢ) | consistent (r33) | none |
| G5.5 MU cells and orientations | Gr₂(ℂ⁴); Hℤ on RP² | cells of dimensions 0,1,2,2,3,4; Hℤ fails on the Möbius line | holds (r33) | none |
| G5.6 rational Hurewicz (headline) | E=S; X=S² | π₀S⊗ℚ=ℚ; π₃S²⊗ℚ=ℚ→H₃=0, onto but not injective | holds (r33) | locator |
| G2.1 Kan–Quillen (headline) | Δ[0]→Δ[1]; ∂Δ[1]→Δ[0] | a monomorphism with contractible realizations; π₀ goes 2→1, not a weak equivalence | statable (r33 probe) | R06 |
| G3.1 Brown (headline) | finite versus arbitrary CW | Hatcher 4E.2 covers all connected CW; Cohen 10.3 finite only | source weak (r33) | R13 |
| `coefficientDegreeEquiv` (Lean) | 𝔽₅ one-object category | x↦x³ sends 1+1 to 3≠2 | missing binder (r33) | R03 |
| `IsHurewiczFibration` (Lean) versus the pin | p=id | holds for both; ∃ lifting function versus continuity plus HLP | duplicate (r33) | R05 |
| `quaternionProjectiveQuotientTopology` | `rfl` probe | coinduced by mk' on both sides | duplicate of Mathlib (r33) | R05 |

## Not verifiable

- Adams, *Stable Homotopy and Generalised Homology*, Part III: a commercial book with no legal open copy (arXiv and author pages searched in the previous round). The G1.3–G1.6 signs were checked internally instead.
- Dold's countable disjoint-refinement lemma (G3.5): Dold (Annals 1963) is behind JSTOR. It was checked from the standard argument only.
- Segal, McDuff–Segal, Atiyah–Bott–Shapiro and Joachim (KO, 2001) are settled as uncertified in the manifest and are cited by locator only.
- No new source was opened this round, because no passage changed.

## Source issues

- none
