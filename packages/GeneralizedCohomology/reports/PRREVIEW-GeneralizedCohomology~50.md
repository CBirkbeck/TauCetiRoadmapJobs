# Review of GeneralizedCohomology (pull request #1807 at 6d06f1d)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/GeneralizedCohomology/` at 6d06f1d. The pull request leaves `Suggested.lean` unchanged. It rewrites or adds 926 lines of `README.md`: G2.11 (lines 669–1504, moved from BordismFormalGroups F6.5) is new, and the supplier rows, G2.1, G2.7, G2.10, G4.0b, G5.6 and the dependency paragraph are rewritten.

Both checks were re-run on this head:

- **Gate.** The counts match the worker's: `set_option` 2, `blob` 5, `latex` 2, `prnum` 6, `sorry-data` 22, `imports`/`mathlib-subimports` 25/`no-import-mathlib`, `statement-hygiene` 2, `dropped` 2, `depcheck` 5, **FAIL**. The re-run also reports `outside-folder` 22, but every one of those files is in a folder this pull request owns, so that count is not a finding.
- **Elaboration.** `lake env lean` of `Suggested.lean` gives 25 `sorry` warnings and no errors (46 s).

## R01 (P1) — Supply cycle through HomotopySpheres, plus three more upward suppliers

**Location.** README line 37: "[HomotopySpheres Stage 3A](…/pull/284) | the native `CompactlyGenerated` inclusion and compact-generation right adjoint; pointed convenient mapping spaces, suspension/loop, smash, mapping cone/Puppe, stable sphere stems and Freudenthal". The same supplier appears at lines 75, 241 and 328 ("PR284's convenient …"), 2320 ("HomotopySpheres PR284 §4B") and 2487.

**Claim.** GeneralizedCohomology is on main. The roadmaps it cites at four places are not:

- **HomotopySpheres** is 45th in the merge order and may never be cited as a supplier.
- **OperatorKTheory**: line 45, "OperatorKTheory K5", open pull request #866.
- **TangentialBordism**: line 43, "structured PT and geometric bordism remain TangentialBordism".
- **StringOrientation**: line 3419, "before StringOrientation defines λ and BString".

These edges close a cycle, which this pull request exists to cut.

**Witness.** Dependency check on this head:
```
UPWARD: GeneralizedCohomology (on main) -> HomotopySpheres (#45) at README lines [37]
UPWARD: GeneralizedCohomology (on main) -> OperatorKTheory (#9) at README lines [45]
UPWARD: GeneralizedCohomology (on main) -> StringOrientation (#11) at README lines [3419]
UPWARD: GeneralizedCohomology (on main) -> TangentialBordism (#14) at README lines [43]
CYCLE among: GeneralizedCohomology, HomotopySpheres, StringOrientation, TangentialBordism
```

**Repair.**
- **Convenient category (lines 37, 75, 241, 328).** Cite AlgebraicTopology Stage 4.5. At this head it owns the coreflection k = `TopologicalSpace.compactlyGenerated`, right adjoint to `CompactlyGenerated.compactlyGeneratedToTop`, and the products k(X×Y) (AlgebraicTopology README lines 139–146 and 1029–1049).
- **Based suspension–loop adjunction.** Cite AlgebraicTopology 8.11b (its README line 2898).
- **Pointed smash, cone and Puppe.** Make these targets of G1.3 and G2.5.
- **Stable stems.** G2.5 already proves general Freudenthal. Make G2.5 the owner of the stabilized sphere colimit and delete "compatibility with the sphere-only supplier theorem" (line 335).
- **Real Bott loop chain (lines 2320 and 2487).** State it here as a G5.0/G5.4 target (the notion moves down), or cite a roadmap on main that states it.
- **OperatorKTheory K5 (line 45).** Cite HilbertModules and CStarAlgebras, both on main, by section. Make what neither states (the graded Clifford and regular-calculus pieces) a target of G5.5.
- **Lines 43 and 3419.** Rewrite as consumer sentences, for example "TangentialBordism, which consumes G5, owns structured PT", or delete them; line 46 already records that consumer.

Re-run the dependency check; it must print no UPWARD or CYCLE line.

## R02 (P1) — Sorry'd data and `set_option` in Suggested.lean

**Location.** `Suggested.lean` has 22 `def`/`instance` bodies that are `sorry`:

- `nativeSpinFourQuaternionHomeomorph` (246)
- `quaternionFrameGroupChartedSpace` (392)
- `quaternionProjectiveGrassmannianHomeomorph` (485)
- `realizationProductKelleyComparison` (514)
- `pointedSSetMonoidal` (537), `finiteBijectionMonoidal` (566), `finiteBijectionSymmetric` (580), `pointedSSetSymmetric` (592)
- the four Day convolution and colimit-preservation instances (601–616)
- `sequenceActionEquivalence` (626), `sequenceDayBraiding` (631)
- `symmetricSequenceSymmetric` (646), `symmetricSphere` (656), `sphereIsComm` (660)
- `spectrumSmash` (698), `freeSpectrum` (703), `freeEvaluationEquiv` (706)
- `coefficientDegreeEquiv` (730), `suspensionCohomologyEquiv` (748)

`set_option maxHeartbeats 1000000 in` appears at lines 333 and 355.

**Claim.** Both are blocking under the acceptance-test rules. `SymmetricSpectrum` (665) is `Mod SymmetricSequence symmetricSphere.X`, so the file's central carrier mentions sorry'd data.

**Witness.** The gate lists `sorry-data` 22 and `set_option` lines 333 and 355. Line 656 reads `noncomputable def symmetricSphere : Mon SymmetricSequence := by sorry`.

**Repair.**
- Delete all 22 declarations.
- Where a carrier is needed, import Tau Ceti's real one:
  - `TauCeti.PointedSSet` (`TauCeti/AlgebraicTopology/SimplicialSet/Pointed/Basic.lean:33`), with `PointedSSet.symmetricCategory` (`…/Pointed/Smash/Basic.lean:69`)
  - `TauCeti.FiniteBijection` (`TauCeti/CategoryTheory/FiniteBijection.lean:45`)
  - `TauCeti.SymmetricSequence` (`TauCeti/AlgebraicTopology/Spectra/SymmetricSequence.lean:90`)
  - `TauCeti.SymmetricSequence.sphere` and `TauCeti.SymmetricSpectrum` (`…/Spectra/SymmetricSpectrum.lean:82, 92`)
  - `TauCeti.SymmetricSequence.free` and `freeEvaluationAdjunction` (`…/Spectra/Free.lean:51, 56`)
- Delete `quaternionSpEmbeddedLieSubgroupData` and `quaternionSp_contMDiff_iff_comp_subtypeVal`. They are not headlines, and deleting them removes both `set_option`s.

## R03 (P2) — No headline theorem is stated; two statable headlines are absent; the unstatable ones are not named

**Location.** `Suggested.lean` docstring, lines 31–42: "The statements here suggest Lean forms for particular milestones … The final section checks stable interfaces parametrically". README lines 18–19: "`Suggested.lean` checks selected carrier and interface shapes".

**Claim.** The file is an API catalogue, not an acceptance test, and none of its declarations is a headline theorem. Two headlines are statable at the pins with no new definitions, and both are absent:

- **G3.3 comparison theorem** (README lines 1553–1559), in its homology form on Mathlib's `TopPair.HomologyPretheory` and `Topology.CWComplex`. The README itself, at G1.1 line 149, says to shape homology theories after `HomologyPretheory`.
- **G5.6 unstable rational Hurewicz range** (README lines 3069–3072), on Tau Ceti's `HomotopyGroup.hurewiczHom` (`TauCeti/AlgebraicTopology/Homotopy/Hurewicz/Basic.lean:652`).

**Witness.** Both statements below elaborate at the pins (scratch file, two `sorry` warnings, no errors).
```lean
theorem comparison {C : Type*} [Category* C] [Abelian C]
    (HP HP' : TopPair.HomologyPretheory.{u} C (ComplexShape.down ℤ))
    [HP.IsExtraordinaryEilenbergSteenrod] [HP'.IsExtraordinaryEilenbergSteenrod]
    (f : HP ⟶ HP') (hpt : ∀ i, IsIso ((f.hom i).app (TopCat.of PUnit.{u + 1})))
    (X : TopCat.{u}) [Topology.CWComplex (Set.univ : Set X)] (i : ℤ) :
    IsIso ((f.hom i).app X)
theorem rationalHurewicz {X : Type} [TopologicalSpace X] [PathConnectedSpace X] (x : X)
    (k : ℕ) (hk : 2 ≤ k) (hconn : ∀ j < k, Subsingleton (HomotopyGroup (Fin j) X x))
    (n : ℕ) (hn₁ : 1 ≤ n) (hn₂ : n + 1 ≤ 2 * k - 2) :
    (∀ a, HomotopyGroup.hurewiczHom (X := X) (x := x) (C := ModuleCat.{0} ℚ)
        (ModuleCat.of ℚ ℚ) n a = 0 → IsOfFinAddOrder a) ∧
      Submodule.span ℚ (Set.range (HomotopyGroup.hurewiczHom (X := X) (x := x)
        (C := ModuleCat.{0} ℚ) (ModuleCat.of ℚ ℚ) n)) = ⊤
```

**Repair.**
- Add these two theorems, each with a docstring and a locator.
- Rewrite the module docstring to name each headline that is not statable at the pins, and its missing carrier:
  - G2.3 stable model structure: no stable equivalences.
  - G2.5 symmetric/sequential Quillen equivalence: no sequential spectra.
  - G2.5 Freudenthal: no topological reduced suspension or suspension homomorphism.
  - G3.1 Brown representability: no homotopy category of pointed connected CW complexes.
  - G3.4 Milnor sequence: Mathlib has homology pretheories only, no cohomology theory.
  - G4.1/G4.3 Leray–Hirsch and Thom isomorphism; G5.1 Spanier–Whitehead duality; the stable form of G5.6: no stable homotopy category.
- Replace README lines 18–19 with the acceptance-test description.

## R04 (P2) — README and Suggested.lean re-plan objects that the pinned Tau Ceti and Mathlib already have

**Location.**
- G2.11, line 1031: "Construct joins and slice quasicategories by their simplicial universal property"
- line 1039: "Define a Cartesian fibration as an inner fibration admitting Cartesian lifts"
- line 1070: "Construct the maximal Kan core"
- line 1076: "Construct marked simplicial sets on native SSet …"
- G2.1, G2.2 and G2.10 ("Define pointed simplicial sets as the native undercategory", "Own `IsHurewiczFibration p`", "construct `MappingPathSpace f`")
- line 3525: "it does not supply a category of spectra"
- `Suggested.lean` lines 51–171 and 498–709, and line 467 `quaternionProjectiveQuotientTopology`

**Claim.** Each object exists at the pins under these names. The README neither cites them nor records them in its supplier contracts, and `Suggested.lean` redefines them as stand-ins.

**Witness.** Tau Ceti 2fd255d:
- `TauCeti.MarkedSSet` (`…/SimplicialSet/Marked/Basic.lean:49`, "marked edges containing every degenerate edge"), with limits and colimits (`Marked/Limits.lean`) and `mapFlat`/`mapSharp` (`Marked/MappingSpace.lean:77, 83`)
- `SSet.join` (`…/Join/Basic.lean:358`), `SSet.slice` (`…/Slice.lean:103`)
- `SSet.Edge.IsCartesian` and `SSet.CartesianFibration` (`…/Quasicategory/Cartesian.lean:65, 110`), `SSet.Edge.IsEquivalence` and `core` (`…/Quasicategory/Core.lean:71, 226`)
- `TauCeti.MappingPathSpace` (`…/MappingPath/Basic.lean:40`), `MappingPathFiber` (`…/MappingPath/Fiber.lean:51`)
- `TauCeti.IsHurewiczFibration` with `mem_serreFibrations` (`…/HurewiczFibration/Basic.lean:58, 90`) and `isHurewiczFibration_iff_nonempty_liftingFunction` (`…/MappingPath/LiftingFunction.lean:172`)
- `TauCeti.SymmetricSpectrum` (R02)

Mathlib 1b1ccf4: `Projectivization.instTopologicalSpace` (`Mathlib/Topology/Algebra/Projectivization.lean`), the quotient topology for any division ring.

**Repair.**
- Add a "From Tau Ceti" supplier contract naming each declaration and its file.
- Rewrite these G2.1, G2.2, G2.10 and G2.11 sentences as "consume …". Keep as targets only what is missing, such as the marked model structures and straightening.
- Correct line 3525.
- In `Suggested.lean`, import the native declarations and delete the local copies, including `quaternionProjectiveQuotientTopology`, whose own docstring asks for its deletion once the generic instance exists.

## R05 (P2) — G2.1 and G2.11 and the open HigherToposTheory roadmap own the same objects

**Location.** README G2.1 line 222: "First build the unpointed Kan–Quillen model structure". G2.11, lines 693, 1059, 1107, 1235, 1333 and 1173: the Bergner model, the Joyal model, marked straightening, Kan extensions, Ind, and stable ∞-categories.

**Claim.** Pull request #1901 (HigherToposTheory, new) gives the same objects to itself. Neither roadmap names the other, so these objects have two owners.

**Witness.** HigherToposTheory README at #1901, "Scope and ownership": it owns "the Kan–Quillen model structure on `SSet` … simplicial categories, the Bergner model structure … the Joyal model structure, straightening, Kan extensions … stable ∞-categories (L9)".

**Repair.** Settle one owner. GeneralizedCohomology is on main, so it is the earlier owner unless G2.11 moves into a foundations roadmap ahead of both. State in "Scope and suppliers" which G2.1 and G2.11 objects are owned here and that HigherToposTheory consumes them. Alternatively, cut G2.11 down to its instances on G2's spectral models and move the generic ∞-category theory to one owner earlier in the merge order.

## R06 (P2) — Supplier drift: `projectiveEMComparisons` is no longer in AlgebraicTopology at this head

**Location.** README line 35: "AlgebraicTopology, Stage8 | … ordinaryCohomologySuspension and projectiveEMComparisons on arbitrary CW spaces". Line 2094: "AT's projectiveEMComparisons pins h_AT to pair+1".

**Claim.** This pull request moves the classical Eilenberg–MacLane comparisons from AlgebraicTopology 8.12 into CharacteristicClasses C1.5a, without the name. This README still cites the AlgebraicTopology declaration.

**Witness.** On main, AlgebraicTopology README line 2061 reads "12. Classical EM comparisons (`projectiveEMComparisons`)". At this head the name occurs in no README except this one. AlgebraicTopology item 12 is now the "Native circle comparison of the degree-one model", and CharacteristicClasses line 779 has "C1.5a. Classical Eilenberg–MacLane comparisons", which pins the CP¹ pairing to +1.

**Repair.** Cite CharacteristicClasses C1.5a at line 35 (move the item to the CharacteristicClasses row) and at line 2094 ("CC C1.5a's f_h pairs to +1 on complex-oriented CP¹").

## R07 (P2) — Supplier citations through commit-pinned links whose anchors or names are dropped

**Location.**
- line 39 and line 3262: `…/blob/a452db2…/ComplexKahlerGeometry/README.md#k7-projective-torus-and-hopf-examples`
- line 3112: [`simplicialGroupKan`](…/blob/a02281f…/AlgebraicTopology/README.md#stage-8-relative-homotopy-…)
- line 42: `…/blob/41b8e27…/SpinGeometry/README.md#g1-negative-metric-clifford-modules-…`
- line 3260: `…/blob/791dd40…` (SmoothBundlesConnections B1.4)

**Claim.** These are supplier citations pinned to old commits (gate `blob` 5). Their anchors and names are gone:

- **ComplexKahlerGeometry.** At this head, in this pull request's own folder, the heading is "## Layer 7: … (K7)" with "### 7.1 … (K7.1)". #1398 and #1808 drop the anchor as well.
- **AlgebraicTopology.** #1652 renames "Stage 8" to "Layer 8" and no longer names `simplicialGroupKan`.
- **SpinGeometry.** #1674 renames G1 to "Layer 1 … §1.3 (G1.3)".

**Witness.** `grep -n simplicialGroupKan` on #1652's AlgebraicTopology README finds no match; its §8.2 is "Kan and cubical comparison". In this pull request, ComplexKahlerGeometry README line 2187 reads "## Layer 7: projective, torus, Riemann-surface and Hopf examples (K7)".

**Repair.** Replace each blob link by a relative link and the stable label:
- `../ComplexKahlerGeometry/README.md`, "ComplexKahlerGeometry K7.1"
- "AlgebraicTopology §8.2 (Kan and cubical comparison)"
- "SpinGeometry G1.3"
- "SmoothBundlesConnections B1.4"

Name the AlgebraicTopology 8.2 content by what it states, not by a name that one open revision drops.

## R08 (P2) — The realization-product comparison is handed in opposite directions by this pull request and #1652

**Location.** README line 236: "Consume AT Stage 4.5's simplicial-realization product comparison, the homeomorphism |K×L|≃|K|×_k|L|". This pull request deletes the target `realizationProductKelleyComparison` from G2.1, but `Suggested.lean` line 514 still declares it.

**Claim.** The open AlgebraicTopology revision #1652 makes AlgebraicTopology consume this same comparison from GeneralizedCohomology G2.1, so each roadmap hands the object to the other. There is also no old → new line for the dropped id.

**Witness.** #1652 AlgebraicTopology README lines 3195–3196: "Consume GeneralizedCohomology G2.1's foundational `realizationProductKelleyComparison`". The same edge is in its dependency table at lines 3175 and 3562.

**Repair.**
- Add an old → new line under "Scope and suppliers": "`realizationProductKelleyComparison` (G2.1) → AlgebraicTopology Stage 4.5".
- Delete the declaration from `Suggested.lean`.
- Settle the order with #1652 in the pull-request description, so that #1652 rebases onto Stage 4.5's ownership.

## R09 (P3) — Padding in Suggested.lean

**Location.** These closed by `rfl` or by one library lemma:
- `levelMap_id` and `levelMap_comp` (674, 678)
- `mappingPathProjection_comp_inclusion` and `mappingPathEndpoint_comp_inclusion` (161, 167)
- the four `mappingPathFiberConstHomeomorph…_apply`/`_symm_apply` lemmas (115–137)
- `nativeSpinFourQuaternionHomeomorph_apply` (254) and `quaternionProjectiveGrassmannianHomeomorph_toEquiv` (492)
- `IsHurewiczFibration.lift` (69)

Convention lemmas: `spinFourCalibratedPair_vectorAction` (274) and `quaternionFrameAction_preserves` (429).

Statements about an arbitrary preadditive category with a ℤ-shift that name none of this roadmap's objects: `StablePi`, `SpectralCohomology`, `coefficientDegreeEquiv`, `cohomologyPullback`, `SpectralHomology`, `suspensionCohomologyEquiv`, `externalProductClass`, `stagewisePhantoms`, `finiteDualEvaluation`/`Coevaluation` (721–775). Also the `example … := inferInstance` lines (286, 411, 621–623).

**Claim.** These restate definitions, follow in one step, or mirror README conventions; none is a headline.

**Witness.** On a copy of the file, `example … : (mappingPathProjection f).comp (mappingPathInclusion f) = ContinuousMap.id B := by rfl` elaborates. `coefficientDegreeEquiv` is the shift auto-equivalence Hom(S,E⟦q⟧) ≅ Hom(S⟦−q⟧,E), which holds in every such category.

**Repair.** Delete them from `Suggested.lean`; the README keeps the statements.

## R10 (P3) — Lean form: imports, choice in a definition, and names that disagree with the README

**Location.**
- Lines 1–29: 25 `import Mathlib.<submodule>` lines and no `import Mathlib`.
- Lines 328–329, in `quaternionSpSliceChartData`: `Classical.choose hex`.
- 85 of the 97 declaration names in `Suggested.lean` occur nowhere in the README, for example `FiniteBijection`, `SymmetricSpectrum`, `StablePi`, `freeSpectrum` and `levelPermutation`.

**Claim.** These break the import rule and statement hygiene, and the rule that every Lean name appears in the README.

**Witness.** The gate reports `mathlib-subimports` 25, `no-import-mathlib` 1 and `statement-hygiene` lines 328–329. A grep of each declared name against the README found 85 absent.

**Repair.**
- Use `import Mathlib` plus only the `TauCeti.*` modules that are used.
- Delete `quaternionSpSliceChartData`, which is not a headline.
- After R02, R03 and R09, make sure every kept name appears in the README and every backticked own name in the README is declared.

## R11 (P3) — Pull-request numbers, dropped names, process words, a broken link and a LaTeX delimiter

**Location.**
- **Pull-request references.** Lines 39 ("ComplexManifolds PR279", "#279's"), 45 (links to pulls 861, 860 and 866; HilbertModules and CStarAlgebras are on main), 75, 241, 328, 2320 and 2487 ("PR284").
- **Dropped names.** Lines 37 and 2320 (HomotopySpheres).
- **Process words.** Lines 49 and 52 ("current implementations", "current Mathlib design"), 2728 ("currently requires"), 3528 ("current Mathlib").
- **Broken link.** Line 41: `[SpinRepresentations](../SpinRepresentations/README.md)`.
- **LaTeX delimiter.** Line 3279: "V=K\A, Z=L\(A∩L), U=K\(A∪L)".

**Claim.** These violate the rules against pull-request numbers, dropped names, process wording and LaTeX delimiters. The link at line 41 is broken: SpinRepresentations is at `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/` on main.

**Witness.** The gate reports `prnum` 6, `dropped` 2 and `latex` 2 at line 3279. `ls TauCetiRoadmap/SpinRepresentations` fails, and TopologicalKTheory line 186 links `../RepresentationTheory/SpinRepresentations/README.md`.

**Repair.**
- Name each roadmap and section with relative links ("ComplexManifolds Milestones 1–2", "HilbertModules H2, H4–H6", "CStarAlgebras C5").
- Drop "current" and "currently".
- Fix the SpinRepresentations path.
- Put the three quotient formulas at line 3279 in code spans.

## R12 (P3) — Three wrong locators, and no locators at most claims

**Location.**
- Line 1055: "apply model recognition (HTTA.2.6.13)"
- line 1246: "(the localization criterion of HTT5.2.7.4)" for "precomposition identifies functors out of the target with functors inverting the unit maps"
- line 1377: "characterized by that universal property (HA4.8.1.10/13)" for the Ind(C) enhancement

**Claim.**
- HTT A.2.6.13 is an Example (isomorphisms form a perfect class); the recognition theorem is Proposition A.2.6.15.
- HTT 5.2.7.4 characterizes localization functors; the precomposition statement is Proposition 5.2.7.12.
- HA Remark 4.8.1.13 concerns Day convolution on presheaves; the Ind characterization is Corollary 4.8.1.14.

Separately, G1–G5 give no locator at their theorems (Freudenthal, Blakers–Massey, Brown, the F₁S¹ counterexample, Milnor), and the References section cites only whole chapters.

**Witness.** `LurieHTT` lines 38362 (Example A.2.6.13), 38368 (Proposition A.2.6.15), 17361 (5.2.7.4) and 17500 (5.2.7.12); `LurieHA` lines 27099 (4.8.1.13) and 27108 (4.8.1.14).

**Repair.**
- Cite HTT A.2.6.15, HTT 5.2.7.12 and HA 4.8.1.10, 4.8.1.13 and 4.8.1.14.
- Add locators at the G1–G5 claims, for example:
  - Brown: Hatcher, *Algebraic Topology*, Theorems 4E.1 and 4E.2, pp. 448–449.
  - F₁S¹ is not semistable: HSS Example 3.1.10 and Definition 5.6.1.

## R13 (P3) — README is not in TauCetiRoadmap form

**Location.** The whole README: 3530 lines and 246 KB.

**Claim.** The README lacks the required parts:

- the `# Roadmap:` title and the **Summary.**
- "Exact supplier contracts" with From Mathlib / From Tau Ceti / From TauCetiRoadmap.X
- "How to read the build"
- `## Layer k` sections with `### k.n` subsections
- API bullet lists, **Checks.** (three per definition), `*Needs:*` lines, `### Examples` and `### Dependencies`
- "Downstream consumers"

Theorems are run-on paragraphs that mix construction, proof route and ownership.

**Witness.** In `README.md`, `grep -c` gives 0 for each of `**Checks`, `*Needs:*`, `### Examples`, `### Dependencies`, `**Summary` and `Exact supplier`. The file has no `###` heading at all.

**Repair.** Restructure into the house shape, with Checks and *Needs:* per target. Split off G2.11, about 840 lines of ∞-category foundations, as its own roadmap; R05 decides where it goes.

## Adversarial table

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| G2.9 π-table of GL_k(ℝ), k=0…≥5 | k=0,1,2,3,4,6 | k=0: GL₀ trivial, all 0 = table; k=1: ℝˣ has two contractible components, so π₀=ℤ/2, π₁=0 = table; k=2: SO(2)=S¹, π₁=ℤ, π₃=0 = table; k=3: SO(3)=RP³, π₁=ℤ/2, π₃=ℤ = table; k=4: SO(4)=(S³×S³)/±1, π₃=ℤ² = table | holds | none |
| G2.9 stabilization on π₃ | SO(3)→SO(4)→SO(5) | The stabilizer of 1 under v↦q_L v q_R⁻¹ forces q_L=q_R, so the first map is diagonal; (a,b)↦a+b; composite is 2 = known index of π₃SO(3)→π₃SO(5) | holds | none |
| G2.9 reflection action, k=4 | r₄=diag(−1,1,1,1), i.e. v↦−v̄ | r∘(v↦q_L v q_R⁻¹)∘r = v↦q_R v q_L⁻¹, a swap = README | holds | none |
| G2.9 [S¹,GL₂ℝ] group | semidirect product | ℤ⋊ℤ/2 with negation = D_∞ = README | holds | none |
| G2.5 Freudenthal range | X=S², k=2; k=1 | π₂S²=ℤ→π₃S³=ℤ is an iso (i=2≤2k−2=2); π₃S²=ℤ→π₄S³=ℤ/2 is onto (i=3); for k=1 the iso range is empty and π₁→π₂ΣX is onto | holds | none |
| G2.5 Blakers–Massey on cones | X (k−1)-connected | X→CX is k-connected on both legs, so (2k−1)-cartesian; X=S¹: π₁(ΩS²)=π₂S²=ℤ, an iso | holds | none |
| G2.5 grid-transpose sign (−1)^(C(m,2)C(n,2)) | (m,n)=(2,2),(3,2),(4,n) | (2,2): one transposition gives −1, formula gives −1; (3,2): −1 and (−1)^(n(n−1)/2)=−1; m=4: C(4,2)=6, so +1 | holds | none |
| G1.7 σ²=0 | E=HF₂ | graded commutativity gives only 2σ²=0, vacuous over F₂; the diagonal null-homotopy gives σ²=0 | holds; the README's warning is needed | none |
| Conventions Eⁿ(*)=π₋ₙE | E=KU, n=−2 | KU⁻²(*)=π₂KU=ℤ (Bott) | holds | none |
| G2.6 F₁S¹ not semistable | HSS Ex. 3.1.10 | naive π₀F₁S¹ = ⊕ℤ versus true π₀ = ℤ | holds | none |
| G3.4 Milnor sequence | constant tower; tower ℤ←ℤ←ℤ⋯ with maps ·2, ·3, ⋯ | lim¹ of a constant tower is 0, so E^q(Tel)=E^q(X); lim¹ of the second tower is Ext¹(ℚ,ℤ)≠0 | holds | none |
| G3.6 phantom S_ℚ→ΣHZ | stage restrictions | [S,ΣHZ]=π₋₁HZ=0; lim¹[ΣS,ΣHZ]=lim¹(ℤ,·n)=Ext¹(ℚ,ℤ); total class in H¹(S_ℚ;ℤ)=Ext(ℚ,ℤ)≠0 | holds | none |
| G3.9 π of E^∧_p | E=HZ, E=HQ | HZ: Ext(ℤ/p^∞,ℤ)=ℤ_p = ℤ⊗ℤ_p (finitely generated case); HQ: Ext=Hom=0, so HQ^∧_p≃0, whereas ℚ⊗ℤ_p=ℚ_p, and the README rightly restricts the ⊗ formula | holds | none |
| G3.8 connectivity of symmetric powers "for k≥0" | V=Σ⁻¹S, m=2 | (Σ⁻¹S)^∧2 is (−2)-connective, and homotopy orbits keep it so; the bound mk also holds for k<0 | holds; hypothesis narrower than needed | note only |
| G5.6 rational Hurewicz range (R03 statement) | X=S², k=2; X=S³, k=3 | S²: π₂⊗ℚ=ℚ→H₂=ℚ iso; π₃S²⊗ℚ=ℚ→H₃=0 onto, not injective; S³: π₄S³⊗ℚ=0, H₄=0 | holds, range sharp | add to Lean (R03) |
| G3.3 comparison (R03 statement) | f=id; Warsaw circle W | id: iso; Čech vs singular H₁(W): ℤ vs 0, and both are ℤ on a point, so the CW hypothesis is needed | holds as stated | add to Lean (R03) |
| `spinFourCalibratedPair_vectorAction` | Tau Ceti `realCliffordFourZeroQuaternionEquiv v = ⟨−v₂,v₁,−v₀,v₃⟩` | This equals −u·conj(ψv)·u with u=(1+j)/√2; with φ(s•v)=n₁φ(v)n₂* (Four.lean:341) this gives ψ(s•v)=(u n₂ u*)ψ(v)(u* n₁ u)* = stated | true | delete (R09) |
| `coefficientDegreeEquiv` | any preadditive C with ℤ-shift | Hom(S,E⟦q⟧) ≅ Hom(S⟦−q⟧,E) via the shift auto-equivalence; the signature dropped `[∀ n, (shiftFunctor C n).Additive]` | true but generic | delete (R09) |
| HTT 1.2.4.3 (README line 1035) | n≥2 horns Λⁿ₀ | source: φ is an equivalence iff every Λⁿ₀→C with first edge φ, n≥2, extends (`LurieHTT` line 2066) | matches | none |
| HTT 1.2.9.3 / 2.4.5 (line 1047) | q a categorical equivalence | C/p→C′/qp is a categorical equivalence (line 2434) | matches | none |
| HTT 2.1.4 (line 965) | covariant model, SM7 | Prop. 2.1.4.8: simplicial model category (line 3644) | matches | none |
| HTT 2.2.1.2 "first clause" (line 970) | contravariant ↔ projective | Quillen adjunction for every φ, equivalence if φ is an equivalence (line 3814) | matches | none |
| HTT 2.4.6 (lines 1050, 1062) | Joyal fibrant objects | Thm 2.4.6.1 (line 6629); Cor 2.4.6.5 (line 6693) | matches | none |
| HTT 3.3.1.8 / 2.4.2.4 / 2.1.3.4 (line 1449) | S a Kan complex | Cartesian ⇔ coCartesian ⇔ categorical fibration (9952); right fibration ⇔ Cartesian with Kan fibres (5975); contractible fibres give a trivial fibration (3469; the right case is the dual in the proof) | matches | none |
| HTT 4.2.4.1 / 4.2.4.3 / 4.2.4.4 (lines 1143, 1172, 1178) | U a C-chunk | 4.2.4.4 needs a C-chunk U (line 12198); the proof reduces to small chunks, so U=M is admissible | matches | none |
| HTT 5.2.7.4 (line 1246) | precomposition claim | 5.2.7.4 is the localization-functor characterization (17361); the claim is 5.2.7.12 (17500) | wrong locator | R12 |
| HTT A.2.6.13 (line 1055) | model recognition | A.2.6.13 is an Example (38362); recognition is A.2.6.15 (38368) | wrong locator | R12 |
| HTT A.3.2 excellent base (line 704) | Kan–Quillen with × | A.3.2.16 (A1)–(A5) (40160); A.3.2.18 says SSet is excellent (40174); invertibility (∗) (40147) | matches | none |
| HA 4.8.1.10/13 (line 1377) | Ind(C)^⊗ characterization | 4.8.1.13 is Day convolution on P(C) (27099); Ind is Cor. 4.8.1.14 (27108) | partly wrong | R12 |
| HA 7.3.2.6/7 (line 1393) | map of ∞-operads with fibrewise right adjoints | relative right adjoint exists and is a map of ∞-operads (49482) | matches | none |
| Schwede SymSpec I, Ex. 1.17–1.20 (line 3484) | Φ-looping of MU and MSp | Φ(R)ₙ=map(Sⁿ,Rₙ); real/imaginary circles; MSp=Φ³ (lines 896–951) = L₄=Φ₂Φ₃Φ₄ | matches | none |
| Hatcher 4E.1–4E.2 (G3.1) | connected pointed CW, wedge and MV axioms | Thm 4E.2 (`HatcherAT` line 19338); h(pt) trivial follows from the wedge axiom (19352) | matches | add the locator (R12) |
| HSS Def. 5.6.1 / Ex. 3.1.10 (G2.6) | F₁S¹ | F₁S¹ is not semistable (`HSS` line 2907) | matches | add the locator (R12) |

## Verified sound

- **Gate and elaboration.** The gate was re-run; its counts are listed at the top. `lake env lean Suggested.lean`: 25 `sorry` warnings, 0 errors.
- **Binder check.** `#check @` on 8 declarations. `coefficientDegreeEquiv` and `suspensionCohomologyEquiv` lose `[∀ n, (shiftFunctor C n).Additive]`; R09 deletes them. `realizationProductKelleyComparison` keeps `k` and `hk`.
- **Sources.** 17 locators sampled, listed in the table: 14 match and 3 are wrong (R12). Sources read: `LurieHTT`, `LurieHA`, `SchwedeSymSpec`, `HSS`, `HatcherAT`.
- **Library declarations opened at the pins (34).**
  - Mathlib 1b1ccf4:
    - `TopPair.HomologyPretheory` and its classes (`Mathlib/AlgebraicTopology/EilenbergSteenrod.lean:50, 297`)
    - `Topology.CWComplex` and `RelCWComplex` (`Mathlib/Topology/CWComplex/Classical/Basic.lean:99, 135`)
    - `Projectivization.instTopologicalSpace`
    - `SSet.modelCategoryQuillen.I`/`J`, with cofibration and fibration classes only and no `ModelCategory SSet` (`Mathlib/AlgebraicTopology/SimplicialSet/CategoryWithFibrations.lean`)
    - `CompactlyGenerated.compactlyGeneratedToTop`, with no k-ification adjunction in Mathlib
  - Tau Ceti 2fd255d:
    - the declarations listed in R02 and R04
    - `HomotopyGroup.hurewicz` and `hurewiczHom` (`Hurewicz/Basic.lean:201, 652`)
    - `realSpinFourEquivQuaternionUnitaryProd_action` (`Spin/Real/Four.lean:341`)
    - `realCliffordFourZeroQuaternionEquiv` (`RealForm/Four.lean:279`)
- **Cross-roadmap citations resolved at this head.**
  - AlgebraicTopology:
    - Stage 4.5, the compact-generation coreflection (lines 139–146, 1029–1049)
    - 4.6 and 4.7 (lines 1078, 1125); 4.8 (line 1152)
    - 5.0 (line 1208); 5.5, the Serre fibrations and the fibration exact sequence (line 1314)
    - 8.2, with `simplicialGroupKan` at line 498
    - 8.8c (2596), 8.8d (2670), 8.10 (2758), 8.11a/b (2798, 2841)
  - TopologicalKTheory T1.5: the graph-chart upgrade and rank-one comparisons (lines 136–145, 459–462).
  - BordismFormalGroups: lines 86–95 map F6.5's moved sublanes to "GeneralizedCohomology G2.11, the same heading", so the moved ids have old → new lines there.
  - CharacteristicClasses C1.5a (line 779).
  - ComplexKahlerGeometry §7.1 (K7.1) at this head.
  - SpinGeometry G1.3 `cliffordScalarTrace` on main (line 233).
  - Relative links: 7 of 8 resolve; line 41 does not (R11).
- **Overlaps.** Of the 7 overlap leads:
  - #1854 and #1808 carry a GeneralizedCohomology README byte-identical to this head, so there is no conflicting change.
  - #1187 conflicts only in `Suggested.lean` and is ordered by the description's "No open pull request must merge before this one".
  - The anchors dropped by #1398, #1652 and #1674 are R07.
  - HigherToposTheory #1901 is R05. StableHomotopyKTheory #1227 names GeneralizedCohomology G2, G3 and G5.4–G5.6 as the owner of the spectral model, so there is no second owner there.
  - Ownership against the other open pull requests was checked with `roadmaps grep`/`show` for the G2.11 objects only.
- **Adversarial pass.** 33 rows, above.

## Not verifiable

- Adams, *Stable Homotopy and Generalised Homology*, Part III (References line 3475): not in the sources cache, and no legal open copy was looked for in this review. Not sampled.
- `JoachimKO`, `McDuffSegal`, `SegalCategories`, `ABSClifford`, `QuillenHA`: settled as uncertified. Not sampled.
- Cohen, *Bundles, Manifolds, and Homotopy*, Ch. 10, and Miller, *Notes on Cobordism*, Ch. 1–2: cached but cited only at chapter level, so there is no claim-level locator to check (R12).

## Source issues

- **Misprint** in LurieHTT at Definition A.2.6.12, printed p. 825: the source introduces a presentable category A, then defines a perfect class of morphisms "in C"; it should be "in A"; affects nothing.
