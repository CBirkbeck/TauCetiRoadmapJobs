# Review of GeneralizedCohomology (pull request #1807 at 3adc047)

**Verdict:** needs changes

The gate fails on this head. The re-run reproduces the worker's result: `set_option` 2, `blob` 5, `latex` 2, `prnum` 6, `sorry-data` 22, `imports`/`mathlib-subimports`/`no-import-mathlib`, `statement-hygiene` 2, `dropped` 2, and `depcheck` 5 (four UPWARD edges and a CYCLE). The re-run also reports `outside-folder` 21; every one of those files is in a folder this pull request owns, so that count is not a finding. `Suggested.lean` elaborates with 25 `sorry` warnings and no errors. The pull request leaves `Suggested.lean` unchanged and adds or rewrites 926 lines of `README.md`: G2.11 (lines 669–1504) is new, and supplier rows and G2.10 and G4.0b are rewritten.

## R01 (P1) — Supply cycle through HomotopySpheres, a roadmap that may not be cited as a supplier

**Location.** `TauCetiRoadmap/GeneralizedCohomology/README.md` line 37: "[HomotopySpheres Stage 3A](…/pull/284) | the native `CompactlyGenerated` inclusion and compact-generation right adjoint; pointed convenient mapping spaces, suspension/loop, smash, mapping cone/Puppe, stable sphere stems and Freudenthal". The same supplier is consumed again at lines 75, 241, 328, 2320 and 2487 ("PR284").

**Claim.** GeneralizedCohomology is on main. HomotopySpheres is not: it is 45th in the merge order, its open pull request is #1287, and it is on the brief's list of roadmaps that may never be cited as suppliers. It also consumes this roadmap, so the edge closes a cycle.

**Witness.** The dependency check prints `UPWARD: GeneralizedCohomology (on main) -> HomotopySpheres (#45) at README lines [37]` and `CYCLE among: GeneralizedCohomology, HomotopySpheres, StringOrientation, TangentialBordism`. The return edge is the HomotopySpheres README at #1287, line 508: "From TauCetiRoadmap.GeneralizedCohomology. G4.0a supplies …".

**Repair.**
- Delete the line-37 row and every "PR284" consumption.
- Use native Mathlib `CompactlyGenerated` and `CompactlyGenerated.compactlyGeneratedToTop` (`Mathlib/Topology/Category/CompactlyGenerated.lean:78`) and `TopologicalSpace.compactlyGenerated` (`Mathlib/Topology/Compactness/CompactlyGeneratedSpace.lean:68`).
- State the k-ification right adjoint, the pointed convenient smash, mapping cone and Puppe sequence as G2.1 targets. Where AlgebraicTopology already owns the raw comparisons (`compactBasedSmashCarrierComparison`, `cwReducedSuspensionKelleyComparison`, AlgebraicTopology README lines 579–580 at this head), cite them.
- G2.5 already proves the general Freudenthal theorem (lines 329–335). Drop "compatibility with the sphere-only supplier theorem" (line 335).
- At lines 395–398, define the stable stems as the colimit of `π_(n+k)(S^k)` here instead of "the supplier's stabilized sphere colimit".
- The other two UPWARD edges are false positives of the tool: line 43 says structured Pontryagin–Thom "remain[s] TangentialBordism", and line 3419 says "before StringOrientation defines λ and BString". Neither consumes those roadmaps, but both still fail the gate. Rewrite them as consumer sentences, for example "TangentialBordism, a consumer of G5, owns structured PT …" and "StringOrientation, which consumes G5.0, defines λ and BString after it". Then re-run the depcheck until it shows no UPWARD or CYCLE line.

## R02 (P2) — Upward supplier OperatorKTheory K5

**Location.** `README.md` line 45: "[OperatorKTheory K5](https://github.com/TauCetiProject/TauCetiRoadmap/pull/866) | complex Hilbert compact operators/spatial tensors, strong-topology unitary contractibility, regular functional calculus and graded Clifford APIs".

**Claim.** A roadmap on main consumes a roadmap that is not merged.

**Witness.** The depcheck prints `UPWARD: GeneralizedCohomology (on main) -> OperatorKTheory (#9) at README lines [45]`. There is no `OperatorKTheory` folder on main (`TauCetiRoadmap/` at a8eadd4). HilbertModules and CStarAlgebras, cited on the same line, are on main.

**Repair.** Drop OperatorKTheory from the row and state the graded Clifford and functional-calculus APIs that G5.5 needs as G5.5 targets. Cite HilbertModules H2, H4–H6 and CStarAlgebras C5 by relative link (`../HilbertModules/README.md`, `../CStarAlgebras/README.md`), not by pull-request link.

## R03 (P2) — Supplier drift: `projectiveEMComparisons` has moved to CharacteristicClasses C1.5a in this pull request

**Location.** `README.md` line 35: "AlgebraicTopology, Stage8 | … ordinaryCohomologySuspension and projectiveEMComparisons on arbitrary CW spaces". Line 2094: "and AT's projectiveEMComparisons pins h_AT to pair+1."

**Claim.** The cited declaration no longer exists in the cited supplier.

**Witness.**
- `projectiveEMComparisons` occurs 0 times in `TauCetiRoadmap/AlgebraicTopology/README.md` at this head, and once on main.
- The content is now `TauCetiRoadmap/CharacteristicClasses/README.md` lines 778–792, "C1.5a. Classical Eilenberg–MacLane comparisons": RP∞≃K(ℤ/2,1) and CP∞≃K(ℤ,2).
- The pull request description says it moves AlgebraicTopology Stage 8.12's comparisons into CharacteristicClasses.

**Repair.** At line 35, remove `projectiveEMComparisons` from the AlgebraicTopology row and add "CharacteristicClasses C1.5a: the RP∞/CP∞ Eilenberg–MacLane comparisons" to the CharacteristicClasses row (line 38). At line 2094, write "CC C1.5a's CP∞≃K(ℤ,2) comparison pins h_AT to pair +1". The sign itself is right: ⟨c₁(γ),[CP¹]⟩=−1.

## R04 (P2) — Ownership of the realization-product comparison is handed back and forth with the AlgebraicTopology revision #1652, which also drops four consumed names

**Location.** `README.md` lines 236–241: "Consume AT Stage 4.5's simplicial-realization product comparison, the homeomorphism |K×L|≃|K|×_k|L|". Lines 231–233 consume "AT4's `simplicialRealizationCW`, AT8.2's `simplicialGroupKan`, `simplicialGroupMooreHomotopyIso` and `kanRealizationUnitHomotopyIso`". `Suggested.lean` line 514 still declares `realizationProductKelleyComparison`, with a sorry'd body.

**Claim.** This pull request moves the comparison from G2.1 to AlgebraicTopology 4.5. The open AlgebraicTopology revision #1652 keeps the opposite direction. If both merge, each roadmap names the other as owner.

**Witness.**
- AlgebraicTopology README at #1652, lines 143–144: "GeneralizedCohomology G2.1 owns the simplicial-realization product comparison".
- Same file, line 3169: "Consume GeneralizedCohomology G2.1's foundational `realizationProductKelleyComparison`".
- At #1652 the four backticked names above occur 0 times. Their content is now §4.7 (line 1315) and §8.2 (lines 2667–2675).

**Repair.**
- In the pull request's merge-order paragraph, state that #1652 rebases on this pull request and adopts AlgebraicTopology 4.5 ownership.
- Cite the four names together with their location at #1652, for example "AT8.2's `simplicialGroupKan` (§8.2 at the AlgebraicTopology revision)". Per the brief this makes #1652 a stated dependency.
- Delete `realizationProductKelleyComparison` from `Suggested.lean`. Its owner is now AlgebraicTopology, and the README no longer names it.

## R05 (P2) — G2.1 and G2.11 share ownership of the ∞-categorical foundations with the open HigherToposTheory roadmap (#1901)

**Location.** `README.md` lines 693–715 (Bergner model and excellent base), 955–1018 (unmarked straightening, HTT 2.2), 1055–1070 (Joyal model), 1076–1136 (marked straightening), 1236–1251 (Kan extensions, adjunctions, localization) and 1330–1340 (presheaves, Ind). Line 222 adds G2.1's Kan–Quillen model structure.

**Claim.** The same objects have two owners.

**Witness.** HigherToposTheory README at #1901, "Scope and ownership": it "owns … the Kan–Quillen model structure on `SSet` … (Layer F2) … simplicial categories, the Bergner model structure and Dugger's theorem (Layer F3); joins, slices, mapping spaces, cores, functor ∞-categories, (co)limits, … the Joyal model structure, straightening, Kan extensions, presentability". It also names BordismFormalGroups and EnhancedDerivedSheaves as roadmaps that "take the notions … from here".

**Repair.** Settle a single owner. GeneralizedCohomology is on main and therefore earlier, so the default is that G2.1 and G2.11 keep these objects. In that case, add one Scope sentence: "HigherToposTheory, a consumer, cites G2.1 (Kan–Quillen) and G2.11 (Bergner, Joyal, straightening, Kan extensions, Ind) for these objects." The worker relays the citation requirement to #1901. If the board instead makes HigherToposTheory the owner, G2.11 can only follow after #1901 merges, with an old → new line per moved sub-lane.

## R06 (P2) — Sorry'd data and `set_option` in Suggested.lean

**Location.** `Suggested.lean`:
- lines 246–251 (`nativeSpinFourQuaternionHomeomorph`, `continuous_toFun := by sorry`);
- 391–394;
- 485–489;
- 514–518;
- 537, 566–577, 580–589, 592, 601–618, 626, 631–644, 646–652, 656, 660, 698, 703, 706, 730, 748.

Lines 333 and 355 have `set_option maxHeartbeats 1000000 in`. Lines 328–329 use `Classical.choose` in the body of `quaternionSpSliceChartData`.

**Claim.** The brief bars sorry'd data and `set_option`: each is a blocking defect. A definition that chooses its datum is a statement-hygiene defect (P3, folded in here).

**Witness.** Gate: `sorry-data=22`, `set_option=2`, `statement-hygiene=2`. Elaboration reports `declaration uses 'sorry'` at all of the lines above.

**Repair.** Delete every sorry'd `def`/`instance` and both `set_option` declarations: the quaternionic Sp chart block, lines 289–408. Most carriers already exist at the pin (R07). State the remaining constructions as README targets with their intended signatures. `Suggested.lean` keeps only headline theorems (R09) and definitions with real bodies.

## R07 (P2) — Suggested.lean and G2.1/G2.2/G2.10 restate declarations the pinned Tau Ceti already has

**Location.** `Suggested.lean`:
- `MappingPathSpace` (line 51), `IsHurewiczFibration` (62), `MappingPathFiber` (87), `mappingPathFiberConstHomeomorphPath` (97);
- `PointedSSet` (499) and its smash instances (537, 592);
- `FiniteBijection` (523), `SymmetricSequence` (596), `symmetricSphere` (656), `SymmetricSpectrum` (665);
- `spectrumSmash` (698), `freeSpectrum`/`freeEvaluationEquiv` (703–709);
- `quaternionProjectiveQuotientTopology` (467).

README lines 215–262 ("Define pointed simplicial sets … Construct Day convolution …") and line 638 ("Own `zeroSetSDR_liftingInclusion`"). README lines 1806 and 1809 consume the Spin(3) continuity from "SpinRepresentations L7".

**Claim.** These redeclare pinned objects instead of citing them, so each object gets a second owner.

**Witness.** At the Tau Ceti pin (2fd255d):
- `TauCeti/Topology/Homotopy/MappingPath/Basic.lean:40` `MappingPathSpace`;
- `…/MappingPath/Fiber.lean:51` `MappingPathFiber` and `:177` `mappingPathFiberConstHomeomorphPath`;
- `…/HurewiczFibration/Basic.lean:58` `IsHurewiczFibration`;
- `TauCeti/CategoryTheory/FiniteBijection.lean:45`;
- `TauCeti/AlgebraicTopology/Spectra/SymmetricSequence.lean:90`, `…/SymmetricSpectrum.lean:82,92` (sphere and spectrum, with monoidal, closed and symmetric instances at lines 101–116), `…/Free.lean:56` `freeEvaluationAdjunction`, `…/SphereMonoid.lean:60` `sphereMonoid k`;
- `TauCeti/Topology/Homotopy/Lifting/Relative.lean:44` `HasHomotopyLiftingProperty.zeroSetSDR_liftingInclusion`;
- `TauCeti/Topology/Algebra/Projectivization.lean:90` (quotient topology on `ℙ K V` for any division ring K);
- `TauCeti/Topology/Algebra/CliffordAlgebra/Spin/SimplyConnected.lean:96,124` (`realSpinThreeContinuousMulEquivQuaternionUnitary`, `realSpinThreeHomeomorphQuaternionSphere`).

The docstring at line 465 itself says to delete the projective topology "when AT4.6 supplies its generic quotient-topology instance".

**Repair.** Delete these declarations from `Suggested.lean`. Add a "From Tau Ceti" supplier contract listing them by full name. Rewrite the G2.1, G2.2 and G2.10 construction sentences as consumption of these declarations, keeping as targets only what the pin lacks: the wedge formula, the model structures and the k-ification comparisons. Change line 638 from "Own" to "Consume".

## R08 (P2) — G2.11 plans quasicategorical objects the pinned Tau Ceti already has

**Location.** `README.md` lines 1031–1039: "Construct joins and slice quasicategories by their simplicial universal property … Define Cartesian/coCartesian edges … Define a Cartesian fibration". Line 1070: "Construct the maximal Kan core". Lines 1076–1077: "Construct marked simplicial sets on native SSet". Lines 1014–1016 use the right mapping Kan spaces.

**Claim.** The new section restates pinned carriers as construction targets.

**Witness.** At the Tau Ceti pin:
- `TauCeti/AlgebraicTopology/SimplicialSet/Marked/Basic.lean:49` `TauCeti.MarkedSSet`, with `flatForgetAdj` at line 170, plus `Marked/Limits.lean` and `Marked/MappingSpace.lean`;
- `SimplicialSet/Join/Basic.lean:358` `SSet.join` (`homEquiv` at 511);
- `SimplicialSet/Slice.lean:103` `SSet.slice`;
- `Quasicategory/Cartesian.lean:65,110` `Edge.IsCartesian`, `CartesianFibration`;
- `Quasicategory/Core.lean:71,226` `Edge.IsEquivalence`, `core`;
- `Quasicategory/RightMappingSpace.lean:89` `rightMappingSpace` (quasicategory instance at line 278).

**Repair.** Cite these under "From Tau Ceti". Keep as G2.11 targets only what they do not supply: the marked model structures, the join and slice universal-property theorems beyond `homEquiv`, and coCartesian duals where they are missing. Remove "Construct"/"Define" for the existing carriers.

## R09 (P2) — Suggested.lean states no headline theorem; statable headlines are missing and the unstatable ones are not named

**Location.** The `Suggested.lean` docstring (lines 31–42): "The statements here suggest Lean forms for particular milestones". README lines 18–19: "`Suggested.lean` checks selected carrier and interface shapes; it is not an exhaustive checklist".

**Claim.** The file is an API catalogue. Of the roadmap's headlines, which are G3.1 Brown, G3.3 comparison, G3.4 Milnor, the G4 Thom isomorphism, G5 Spanier–Whitehead duality, G5.6 `π_n S⊗ℚ=0` and G2.5 Freudenthal, none is stated. At least two are statable at the pins.

**Witness.**
- G3.3, the comparison theorem for homology theories, is statable with Mathlib `TopPair.HomologyPretheory`, its `Hom` and `IsExtraordinaryEilenbergSteenrod` (`Mathlib/AlgebraicTopology/EilenbergSteenrod.lean:50,69,297`) together with Mathlib's relative CW complexes.
- G5.6 is statable in the stable range as "`HomotopyGroup.Pi (n+k)` of the k-sphere is torsion for 0<n<k−1", on Mathlib spheres.
- Freudenthal is not statable: the pins have no topological reduced suspension (`TauCeti.PointedSSet.suspension` is simplicial).

**Repair.**
- State G3.3 for extraordinary homology theories on CW pairs and G5.6 in the form above, each with `sorry` and a docstring locator.
- Rewrite the module docstring as "<title>: target signatures". It should say the roadmap is README.md, and name each unstatable headline with its missing carrier: Brown and Milnor need reduced cohomology theories on the pointed CW homotopy category; Thom, duality and the stable model structure need stable equivalences of `TauCeti.SymmetricSpectrum`; Freudenthal needs topological reduced suspension.
- Replace README lines 18–19 accordingly.

## R10 (P3) — Padding in Suggested.lean

**Location.** `Suggested.lean` lines 115–137 (four `rfl` simp lemmas), 139–171 (projection, endpoint and inclusion maps with two `rfl` lemmas), 254–257, 274–279 (`spinFourCalibratedPair_vectorAction`), 286, 411, 429–433 (`quaternionFrameAction_preserves`), 492–494, 621–623, 667–694 (`level`, `levelMap_id`/`_comp` by `rfl`), and 716–777 (the whole `StableInterfaces` section).

**Claim.** These declarations restate definitions, follow in one or a few tactics, or mirror README Checks. None is a headline.

**Witness.**
- `levelMap_id` closes by `rfl` (line 676).
- `coefficientDegreeEquiv` and `suspensionCohomologyEquiv` are hom-set equivalences from the ℤ-shift automorphism, true of any object named `sphere`, and mention none of the roadmap's objects.
- `spinFourCalibratedPair_vectorAction` follows from pinned `realSpinFourEquivQuaternionUnitaryProd_action` (`TauCeti/LinearAlgebra/CliffordAlgebra/Spin/Real/Four.lean:341`) because the pinned isometry is x↦−u x̄ u (row 23 of the adversarial table).

**Repair.** Delete them from `Suggested.lean`. The README keeps the statements as targets and Checks.

## R11 (P3) — Locators: two wrong, one imprecise, one wrong layer, and none at all for G1–G5

**Location and witness.**
- Line 1246, "the localization criterion of HTT5.2.7.4": HTT Proposition 5.2.7.4 (LurieHTT line 17361) is the three-way characterization of localization functors. The precomposition statement is Proposition 5.2.7.12 (LurieHTT line 17500, printed p. 368).
- Line 1055, "model recognition (HTTA.2.6.13)": A.2.6.13 is an Example, "isomorphisms form a perfect class" (LurieHTT line 38362). The recognition theorem is Proposition A.2.6.15 (line 38368, printed p. 825).
- Line 1377, "(HA4.8.1.10/13)": the characterization is Proposition 4.8.1.10 and Corollary 4.8.1.12 (LurieHA lines 27069, 27090, pp. 710–711). 4.8.1.13 is the Day-convolution remark.
- Lines 41 and 1809, "SpinRepresentations L7": the Spin(3) continuity and sphere comparison is in SpinRepresentations Layer 2 (main, `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md` lines 527–532). Layer 7 is real Clifford algebras.
- Outside G2.11 the README carries no theorem-level locator. A grep for "Theorem/Proposition/Lemma N" returns 0.

**Repair.** Correct the three HTT/HA locators as above. Cite SpinRepresentations Layer 2, or the pinned declarations of R07. Add a locator at each claim, for example Freudenthal and homotopy excision: Hatcher, Theorem 4.23 and Corollary 4.24, printed p. 360 (HatcherAT lines 15681–15688). F₁S¹ not semistable: HSS Example 3.1.10 and Definition 5.6.1 (HSS lines 1088, 2904–2907).

## R12 (P3) — G2.11's moved sub-lanes give EnhancedDerivedSheaves no old → new pointer

**Location.** `README.md` lines 62–65: "BordismFormalGroups F6.5 and EllipticCohomology consume G2.11's … foundations". The sub-lane headings at lines 678, 955, 1076 and 1137 are "Categorical model and functor spaces", "Unmarked straightening …", "Marked fibrations and Kan extensions" and "Coherent model diagrams and stable enhancements".

**Claim.** The main consumer of these sub-lanes still cites their old location.

**Witness.** EnhancedDerivedSheaves on main cites "BordismFormalGroups F6.5, 'Categorical model and functor spaces' and 'Unmarked straightening and the categorical model'" (its README lines 146–147, 189–197 and 244). At this head, BordismFormalGroups F6.5 (line 1897) only consumes G2.11.

**Repair.** In Scope, add one line per moved sub-lane, for example "BordismFormalGroups F6.5 'Marked fibrations and Kan extensions' → G2.11 'Marked fibrations and Kan extensions'". Name EnhancedDerivedSheaves E0–E5 among G2.11's consumers.

## R13 (P3) — Imports, commit-pinned links, pull-request numbers, LaTeX, broken link

**Location and witness.**
- `Suggested.lean` lines 1–29: 25 `import Mathlib.<submodule>` lines and no `import Mathlib` (gate `imports`, `mathlib-subimports`, `no-import-mathlib`).
- README blob links at lines 39, 42, 3112, 3260 and 3262.
- Pull-request numbers at lines 37, 39, 45, 75, 241, 328, 2320 and 2487 (PR284, PR279, #279, pull/860, 861, 866). Lines 3507–3509 link Mathlib pull requests.
- LaTeX-like `K\A`, `L\(A∩L)` at line 3279.
- `../SpinRepresentations/README.md` (line 41) does not exist; the folder is `RepresentationTheory/SpinRepresentations`.

**Repair.**
- Use `import Mathlib` followed by the `TauCeti.*` modules actually used.
- Cite by roadmap and section: ComplexKahlerGeometry §7.1 (K7.1), SpinGeometry §1.3 (G1.3), AlgebraicTopology §8.2, SmoothBundlesConnections B1.4. These exist on main and at #1398, #1674 and #1808.
- Drop the pull-request numbers and put the set differences in code spans.
- Fix the relative path.

## R14 (P3) — README is not in TauCetiRoadmap form, and README and Lean names disagree

**Location and witness.**
- Title line 1 is "# Generalized cohomology, spectra and orientations", not "# Roadmap: …", and there is no `**Summary.**`.
- "Scope and suppliers" is a table rather than "Scope and ownership" plus per-supplier "Exact supplier contracts". There is no "How to read the build".
- Layers are numbered lists, not `### k.n` subsections.
- The README has 0 `**Checks.**` lists, 0 `*Needs:*` lines and 0 `### Examples`/`### Dependencies` headings.
- Process wording: lines 48–49 "no claim that their current implementations are complete", line 52 "the current Mathlib design", line 3528 "current Mathlib", and `Suggested.lean` line 465 "Delete this local specialization when …".
- 85 of the 96 named `Suggested.lean` declarations never appear in the README, for example `SymmetricSpectrum`, `levelPermutation` and `stagewisePhantoms`.
- The README backticks `numerableFiberBundle_hurewicz` (line 657) as its own, but `Suggested.lean` does not declare it.

**Repair.**
- Restructure to the house shape: Summary, Scope and ownership, Conventions, per-supplier contracts, How to read the build, and `## Layer k` with `### k.n` prose subsections, each definition with an API list and at least three discriminating Checks, each target with a `*Needs:*` line, each layer ending in Examples and Dependencies.
- Remove the process wording.
- After R06, R09 and R10, make every remaining Lean name appear in the README, and un-backtick `numerableFiberBundle_hurewicz` or declare it.

## Verified sound

**Gate and build.**
- Depcheck re-run output, verbatim: `UPWARD: GeneralizedCohomology (on main) -> HomotopySpheres (#45) at README lines [37]` / `UPWARD: … -> OperatorKTheory (#9) at README lines [45]` / `UPWARD: … -> StringOrientation (#11) at README lines [3419]` / `UPWARD: … -> TangentialBordism (#14) at README lines [43]` / `CYCLE among: GeneralizedCohomology, HomotopySpheres, StringOrientation, TangentialBordism` / `depcheck: 239 roadmaps, 2384 edges, 5 problem(s)`. The lines 43 and 3419 edges are tool false positives (R01). The other three problems are real.
- `lake env lean` on `Suggested.lean` exits 0 in 55 s with 25 `sorry` warnings and no other message.
- Of the 11 "dropped binder" leads in the signatures file, all 11 carry their binders in the elaborated types (`[Category C]` appears as `[inst : Category.{u_1,u_2} C]`). `realizationProductKelleyComparison` keeps `hk` as an explicit argument. No change.

**Source sample (19 locators read in the cached texts).**

| Locator | Text read | Result |
| --- | --- | --- |
| HTT 1.2.4.3 | LurieHTT l.2066 | ✓ |
| HTT 1.2.9.3 | l.2434 | ✓ (README applies it to "under"-slices, by duality) |
| HTT 2.1.2.1 | l.3184 | ✓ |
| HTT 2.1.3.4 | l.3469 | ✓ |
| HTT 2.2.1.2 | l.3814 | ✓ |
| HTT 2.4.2.4 | l.5975 | ✓ |
| HTT 2.4.6.5 | l.6693 | ✓ |
| HTT 3.3.1.8 | l.9952 | ✓ |
| HTT 4.2.4.1 | l.12161 | ✓ |
| HTT 4.2.4.3 | l.12172 | ✓ |
| HTT 4.2.4.4 | l.12198 | ✓ (HTT states it for a chunk U) |
| HTT 5.2.7.4 | l.17361 | ✗ (R11) |
| HTT A.2.6.13 | l.38362 | ✗ (R11) |
| HTT A.3.2.16 | l.40160 | ✓ (A1–A5 match lines 703–714) |
| HA 4.8.1.10/12/13 | LurieHA l.27069–27104 | ~ (R11) |
| HA 7.3.2.6/7 | l.49435, 49482 | ✓ |
| HA 4.1.8.4 / 4.3.3.17 | l.18817, 21223 | ✓ |
| HSS Example 3.1.10 / Definition 5.6.1 | HSS l.1088, 2904–2907 | ✓ |
| Hatcher Theorem 4.23 / Corollary 4.24 | HatcherAT l.15681–15688 | ✓ |

**Cross-roadmap citations resolved (25).**
- AlgebraicTopology at this head: Stage 4.5 realization product (line 127), the 8.8c EM family (line 2098), 8.8d Serre classes (line 2162), and the 5.5 path-space lifting functions and Serre spectral sequences (lines 1049–1061). These eight ordinary-EM and pair names are present: `ordinaryPairQuotientComparison`, `ordinaryPairQuotientCohomologyComparison`, `ordinaryEMUniversalClass`, `ordinaryEMRepresentability`, `ordinaryEMRelativeRepresentability`, `ordinaryEMLoopComparison`, `ordinaryCohomologySuspension`, `simplicialRealizationCW`. So are `simplicialGroupKan`, `simplicialGroupMooreHomotopyIso` and `kanRealizationUnitHomotopyIso`.
- `projectiveEMComparisons` is absent (R03).
- TopologicalKTheory T1.5 smooth graph-chart upgrade (line 136). CharacteristicClasses C1.1b (line 332), C1.2 `|Sing X|→X` (line 666) and C1.5a (line 778).
- SmoothBundlesConnections B1.4 (main, line 31). SpinGeometry G1.3 `cliffordScalarTrace` (main line 233; #1674 line 252).
- ComplexKahlerGeometry K7.1 (this head line 1962; #1398 line 2403; #1808 line 2183).
- HilbertModules and CStarAlgebras are on main. ComplexManifolds is on main.
- The G2.11 native names are all present at the Mathlib pin: `EnrichedCat`, `EnrichedFunctor`, `ForgetEnrichment`, `enrichedOrdinaryCategory`, `SimplicialThickening` (`SimplicialNerve.lean:54`), `SimplicialNerve`, `Quasicategory`, `enrichedHomπ`, `ReedyStructure` and `.op` (`Reedy/Basic.lean:64`), `SimplexCategory.reedyStructure`, `Grothendieck`, `ModelCategory` and `InnerFibration`.

**Ownership against open pull requests.** Checked with `roadmaps grep` for "Bergner", "straightening", "Joyal model", "coherent nerve" and "quasicategor". Hits: HigherToposTheory #1901 (R05), EnhancedDerivedSheaves on main (R12), and AlgebraicTopology #1652 by direct reading (R04). The overlaps file's seven items:
- the CKG K7 anchor dropped by #1398 and #1808: K7.1 survives, fixed by R13;
- the AlgebraicTopology Stage 8 anchor dropped by #1652: R04;
- the SpinGeometry G1 anchor dropped by #1674: G1.3 survives, fixed by R13;
- #1187 (Tau Ceti bump) changes this folder's `Suggested.lean` and conflicts with this head. The description's merge-order paragraph ("No open pull request must merge before this one") puts #1187 after this pull request, so the order is stated. #1808 and #1854 also carry this folder, but their conflicts with this head are in other folders. No finding.

**Adversarial pass.**

| # | Statement (README line) | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | `Eⁿ(*)=π_(−n)E` (120) | E=HZ, n=0,−1 | H⁰(*)=ℤ=π₀HZ; H⁻¹(*)=π₁HZ=0 | holds | none |
| 2 | `δ_(CA,A)=−σ` (96–98) | A=S⁰, x=1 at non-base point | δx on the positive interval = x(1)−x(0) = 0−1 = −1; σ(x) gives +1 | holds | none |
| 3 | `σ_AT(a)=(−1)^n τ*σ(a)` (102) | n=0,1 | a×ι vs ι×a: +1, −1 | holds | none |
| 4 | `a×σ(b)=(−1)^p σ(a×b)` (182) | p=0,1 | a×ι×b = (−1)^p ι×a×b | holds | none |
| 5 | MV / boundary module identities (174, 200–201) | p=0,1 | left action carries (−1)^p, right action none; consistent with left suspension | consistent | none |
| 6 | `E*(S¹)`, σ²=0 (207–211) | E=HZ | ℤ[σ]/σ²; S¹→S¹∧S¹=S² is null; commutativity alone gives 2σ²=0 | holds | none |
| 7 | Freudenthal range (329–331) | k=1,2 | iso 1≤i≤2k−2, onto at 2k−1; Hatcher: iso i<2n−1, onto at 2n−1 | agrees | locator (R11) |
| 8 | homotopy excision (332–334) | two cones, m=n=k | X→ΩΣX is (2k−1)-connected | agrees with Hatcher 4.23 | locator |
| 9 | `S^(ℝⁿ)∧S^(iℝⁿ)` sign (356–357) | n=1,2,3 | inversions 0,1,3 → +1,−1,−1 = (−1)^(n(n−1)/2) | holds | none |
| 10 | transpose sign (362–365) | m=n=2; m=3; m=4 | −1; (−1)^(3C(n,2))=(−1)^C(n,2); (−1)^(6C(n,2))=+1 | holds | none |
| 11 | F₁S¹ non-semistable (405) | HSS | HSS l.2907 says so | holds | locator |
| 12 | cyclic block sign (432–433) | n=1,2 | (n+1)-cycle: −1, +1 | holds | none |
| 13 | GL_k(ℝ) table (496–503) | k=0…5 | O(0)=1; O(1)=ℤ/2; SO(2)=S¹ π₁=ℤ; SO(3)=ℝP³ π₁=ℤ/2, π₃=ℤ; SO(4)=(S³×S³)/±1 π₃=ℤ²; SO(5) π₃=ℤ | all rows agree | none |
| 14 | π₃ stabilization (525–528) | q↦(q,q); TS⁴ clutching | diagonal (1,1); TS⁴ = v↦qvq = (q,q⁻¹) = (1,−1) generates the kernel, so (a,b)↦a+b; SO(3)→SO(5) is ×2 | holds | none |
| 15 | reflection actions (508–510) | k=2, k=4 with r=diag(−1,1,1,1) | inverts SO(2); v↦−v̄ conjugates (q_L,q_R) to (q_R,q_L) | holds | none |
| 16 | `[S¹,GL₂(ℝ)]` (518–519) | (a,ε)(b,η)=(a+(−1)^ε b, ε+η) | infinite dihedral group | holds | none |
| 17 | Milnor sign (1564–1566) | i even, i odd | a_i−f*a_(i+1), −(a_i−f*a_(i+1)) | holds | none |
| 18 | phantom `S_ℚ→ΣHZ` (1609–1615) | towers | lim[S,ΣHZ]=0; lim¹(ℤ ←×2 ℤ ←×3 …)=Ext(ℚ,ℤ)≠0 | holds | none |
| 19 | `connectiveSpectrumMapsToHA` (1671–1673) | V=S | π₀Map(S,HA)=A=Hom(ℤ,A); π_i=H^(−i)(V;A)=0 for i>0 | holds | none |
| 20 | P0 cells, k−m≥2 (1699) | k−m=2 | first group killed is π₁; π₀ untouched | holds | none |
| 21 | completion Hom/Ext sequence (1740–1741) | E=S, n=0; E=H(ℤ/p^∞) | π₀S^∧_p=Ext(ℤ/p^∞,ℤ)=ℤ_p; H(ℤ/p^∞)^∧_p: π₁=ℤ_p, π₀=0 | holds | none |
| 22 | Sp(N) dimension (`Suggested.lean` 379) | N=1,2 | 1·3=3=dim S³; 2·5=10=dim Sp(2) | holds | none |
| 23 | calibrated Spin(4) pair (1814–1819; `Suggested.lean` 274) | pinned Φ(v)=⟨−v2,v1,−v0,v3⟩ | Φ=x↦−u x̄ u with u=(1+j)/√2 (1↦−j, i↦i, j↦−1, k↦k), so std(s•v)=(u n₂ ū)·v·(ū n̄₁ u) | true | padding (R10) |
| 24 | `quaternionFrameAction_preserves` (`Suggested.lean` 429) | g*g=1 | Σᵢ conj(Σⱼ gᵢⱼvⱼ)(Σₖ gᵢₖwₖ) = Σ conj(vⱼ)(g*g)ⱼₖwₖ | true | padding |
| 25 | `IsHurewiczFibration` (`Suggested.lean` 62) | E=∅; B=pt; {0}↪I | lift is vacuous; constant paths; γ(t)=t has no lift | determines the object | duplicate (R07) |
| 26 | `coefficientDegreeEquiv` (730) | q=0 | (S⟶E[0])≃(S[0]⟶E) by `shiftFunctorZero`, for any object S | true, but no roadmap object | padding |
| 27 | HTT 5.2.7.4 (1246) | LurieHTT l.17361 vs 17500 | 5.2.7.4 is the TFAE; the precomposition statement is 5.2.7.12 | wrong | R11 |
| 28 | HTT A.2.6.13 (1055) | l.38362 vs 38368 | Example vs Proposition A.2.6.15 | wrong | R11 |
| 29 | headline: G3.3 comparison | statability | `TopPair.HomologyPretheory`, `Hom`, `IsExtraordinaryEilenbergSteenrod` at the pin | statable, absent | R09 |
| 30 | headline: G5.6 `π_nS⊗ℚ=0` | statability | Mathlib `HomotopyGroup.Pi` on spheres, stable range | statable, absent | R09 |
| 31 | headline: Freudenthal | statability | no topological reduced suspension at the pins | not statable; the docstring must say so | R09 |
| 32 | `x_G^HZ=−x_CC=h_AT` (2093–2094) | CP¹ | ⟨c₁(γ),[CP¹]⟩=−1, h pairs to +1 | holds | locator only (R03) |

## Not verifiable

- Segal, *Categories and cohomology theories*; McDuff–Segal; Atiyah–Bott–Shapiro; Joachim, *KO*; Quillen, *Homotopical Algebra*: all settled as uncertified and not read. The G2.8 Γ-space claims and the G5 ABS and KO claims were checked only for internal consistency.
- Nikolaus–Scholze §I.3 and Appendix A (cited for G2.11's stable quotient and Ind): the text is cached but was not opened in this round.
- Bergner's model structure on simplicial categories (line 719, "Bergner's characterization for the fixed Kan base"): no source key in `sources.toml`. The claim was checked only against HTT A.3.2.

## Source issues

- none
