# Review of GeneralizedCohomology (pull request #1807 at 70140e6)

**Verdict:** needs changes

Scope of the change under review: in this folder the pull request edits only `TauCetiRoadmap/GeneralizedCohomology/README.md` (+926/−84). It moves BordismFormalGroups F6.5's generic foundations into a new G2.11, reroutes the supplier citations from DGFloer to AlgebraicTopology Stages 4.5, 4.8, 5.0, 5.5, 8.8c and 8.8d, and hands G4.0b's real and complex Grassmannian smooth upgrade to TopologicalKTheory T1.5. `Suggested.lean` is byte-identical to main (3b3f7ef). The gate fails, so the folder cannot be accepted. Several gate failures predate this pull request; the locations below say which. They are listed because the gate blocks acceptance on them, whoever introduced them.

## R01 (P1) — The dependency cycle with HomotopySpheres, StringOrientation and TangentialBordism remains, and HomotopySpheres is a dropped roadmap cited as a supplier

**Location.** `TauCetiRoadmap/GeneralizedCohomology/README.md` line 37 (supplier row "HomotopySpheres Stage 3A … pointed convenient mapping spaces, suspension/loop, smash, mapping cone/Puppe, stable sphere stems and Freudenthal"). Also lines 75, 241 (rewritten by this pull request, which keeps "only AT4/8.2 and PR284 Stage3A"), 328, 2320 and 2487 ("PR284 Stage 4B's real loop-space Bott chain"). Line 43 ("structured PT and geometric bordism remain TangentialBordism") and line 3419 ("before StringOrientation defines λ and BString") close the cycle.

**Claim.** HomotopySpheres is on the project's dropped-names and never-cite lists, so the convenient category, pointed smash, Puppe sequence and real Bott loop chain that G2.1, G2.5, G5.0 and G5.4 consume have no owner. The dependency check reports a cycle through this roadmap.

**Witness.** The depcheck at this head prints `CYCLE among: GeneralizedCohomology, HomotopySpheres, StringOrientation, TangentialBordism`, plus UPWARD lines at README lines 37, 43 and 3419. The gate's `dropped` rule fires at lines 37 and 2320. Main prints the same lines, so this predates the pull request.

**Repair.**
1. Replace the Stage 3A row with Mathlib's `TopologicalSpace.compactlyGenerated` (`Mathlib/Topology/Compactness/CompactlyGeneratedSpace.lean:68`) and `CompactlyGenerated.compactlyGeneratedToTop` (`Mathlib/Topology/Category/CompactlyGenerated.lean:78`). State the k-coreflection adjunction, the pointed convenient smash, suspension–loop and the mapping cone and Puppe sequence as G2.1 targets. Alternatively, cite AlgebraicTopology Stage 4 item 8 once this pull request's AlgebraicTopology revision owns that interface, as the open revision #1663 proposes. Freudenthal is already G2.5's own.
2. State the real Bott/stable-O loop chain of lines 2320 and 2487 as a G5.0/G5.4 target. TopologicalKTheory cannot supply it: it also consumes HomotopySpheres §4A–4B (TopologicalKTheory README line 191).
3. Rewrite lines 43 and 3419 as consumer sentences, for example "TangentialBordism consumes …" and "StringOrientation consumes G5.0's low-homotopy supplement …", as this pull request already does for other roadmaps.
4. Rerun the depcheck until it prints no CYCLE line.

## R02 (P2) — Supplier citations of unmerged roadmaps from a roadmap on main

**Location.** `README.md` line 45 ("[HilbertModules H2, H4–H6](…/pull/861), [CStarAlgebras C5](…/pull/860), [OperatorKTheory K5](…/pull/866)"), consumed at line 2649 ("APIs consume CStarAlgebras C5, HilbertModules H2/H4–H6 and OperatorKTheory K5").

**Claim.** GeneralizedCohomology is on main, but it draws G5.5's operator foundations from three roadmaps that exist only as pull requests.

**Witness.** The depcheck prints `UPWARD: GeneralizedCohomology (on main) -> CStarAlgebras (#7)`, `-> HilbertModules (#8)` and `-> OperatorKTheory (#9)` at README line 45. Main prints the same lines.

**Repair.** Cite the pinned Mathlib carriers where they exist: `CStarModule` (`Mathlib/Analysis/CStarAlgebra/Module/Defs.lean:73`), `IsCompactOperator` (`Mathlib/Analysis/Normed/Operator/Compact/Basic.lean:69`) and `cfc` (`Mathlib/Analysis/CStarAlgebra/ContinuousFunctionalCalculus/Unital.lean:306`). State the rest as G5.5 targets: spatial tensors, strong-topology unitary contractibility, regular functional calculus and graded Clifford APIs. Otherwise move the operator-model sub-lanes of G5.5 to a GeneralizedCohomology Part II placed after those suppliers.

## R03 (P2) — G2.11's foundations have a second owner in the open HigherToposTheory roadmap

**Location.** `README.md` lines 669–676: "These simplicial-set, quasicategorical and operadic foundations are construction targets of this item … BordismFormalGroups F6.5 and EllipticCohomology consume these targets". The Bergner model, Joyal model, unmarked and marked straightening, Kan extensions, Ind and stable ∞-categories follow at lines 678–1504.

**Claim.** The open new-roadmap pull request #1901 (HigherToposTheory) claims ownership of the same objects. G2.11's scope does not mention it, so the objects have two owners.

**Witness.** HigherToposTheory README, Scope and ownership: it owns "simplicial categories, the Bergner model structure" (F3), "joins, slices … the Joyal model structure, straightening, Kan extensions, presentability" (L1–L8) and "stable ∞-categories" (L9). It adds: "BordismFormalGroups, EnhancedDerivedSheaves … build on this material".

**Repair.** In G2.11's opening paragraph, name HigherToposTheory F3, L1–L6 and L9 as overlapping and state the single owner. GeneralizedCohomology is on main and is the earlier owner, so HigherToposTheory then cites G2.11 for these targets rather than planning them again.

## R04 (P2) — G2.10's endpoint fibration is rerouted through AlgebraicTopology 5.5, giving it two owners although it is already proved at the Tau Ceti pin

**Location.** `README.md` lines 536–539, "uses G2.1, native continuous maps, the compact-open path topology and AT5.5's fixed-interval path-space lifting functions", and lines 574–577, "Consume AT5.5's continuous parametrized path-concatenation lifting functions … to prove the endpoint map is a Hurewicz, hence Serre, fibration". Line 3420 still says the raw construction uses only G2.1.

**Claim.** At this head, AlgebraicTopology Stage 5 item 5 (README line 1055) also owns "the mapping path space of f … its endpoint projection is a Serre fibration … the constant-path inclusion … is a homotopy equivalence over Y". G2.10 owns the same carrier. Both results are already proved in Tau Ceti under G2.10.

**Witness.** Pinned Tau Ceti has `TauCeti.MappingPathSpace.endpointLiftingFunction` (`TauCeti/Topology/Homotopy/MappingPath/LiftingFunction.lean:226`), `TauCeti.MappingPathSpace.isHurewiczFibration_endpoint` (`LiftingFunction.lean:267`) and `TauCeti.MappingPathSpace.homotopyEquiv` (`MappingPath/Basic.lean:123`).

**Repair.**
- Cite these three declarations in G2.10.
- Remove "AT5.5's fixed-interval path-space lifting functions" from G2.10's inputs (lines 538 and 574–577). Only the long-exact-sequence application at lines 627–631 consumes AT5.5.
- Make line 3420 agree with the change.
- Have AlgebraicTopology 5.5 cite the pinned declarations instead of owning the mapping-path fibration.

## R05 (P2) — A supplier name that both open AlgebraicTopology revisions drop

**Location.** `README.md` line 231, "Consume AT4's `simplicialRealizationCW`, AT8.2's `simplicialGroupKan`, `simplicialGroupMooreHomotopyIso` …", and line 3112 (a link to `simplicialGroupKan` anchored at `#stage-8-relative-homotopy-hurewicz-whitehead-and-ordinary-representability`).

**Claim.** The open revisions #1652 and #1663 of AlgebraicTopology keep the result but drop the name `simplicialGroupKan`. #1652 also renames the anchor. The citation breaks when either merges.

**Witness.** `simplicialGroupKan` occurs 0 times in both heads. The result is still stated there: #1652 line 2617 and #1663 line 2013 say "every simplicial group is a native `SSet.KanComplex`". The overlaps file lists the anchor drop.

**Repair.** Cite by content: "AlgebraicTopology Stage 8 item 2 (§8.2): every simplicial group is a Kan complex (`SSet.KanComplex`)", without the pinned anchor. Check lines 231 and 3112 against both heads.

## R06 (P2) — Suggested.lean: sorry'd data and `set_option` (predates this pull request)

**Location.** `TauCetiRoadmap/GeneralizedCohomology/Suggested.lean`:
- `set_option maxHeartbeats 1000000 in` at lines 333 and 355.
- Data whose body is `sorry`: `nativeSpinFourQuaternionHomeomorph` (246), `quaternionFrameGroupChartedSpace` (392), `quaternionProjectiveGrassmannianHomeomorph` (485), `realizationProductKelleyComparison` (514), the instances at 537–616 and 646–660, `sequenceActionEquivalence` (626), `symmetricSphere` (656), `spectrumSmash` (698), `freeSpectrum` (703), `freeEvaluationEquiv` (706), `coefficientDegreeEquiv` (730) and `suspensionCohomologyEquiv` (748).

**Claim.** Both are blocking under the Suggested.lean rules. The gate reports `set_option=2` and `sorry-data=22`.

**Witness.** In `coefficientDegreeEquiv` and `suspensionCohomologyEquiv`, the elaborated types (worker's `#check @` transcript) lose the section binder `[∀ n : ℤ, (shiftFunctor C n).Additive]`. Their `≃+` is therefore unconstrained `sorry` data, not the canonical additive comparison.

**Repair.** Delete every sorry'd `def`, `abbrev` and `instance`; the README keeps them as construction targets. Delete `quaternionSpEmbeddedLieSubgroupData` and `quaternionSp_contMDiff_iff_comp_subtypeVal`, so neither `set_option` is needed.

## R07 (P2) — Suggested.lean states no headline theorem, names none as unstatable, and redeclares carriers already pinned in Tau Ceti

**Location.** The module docstring (lines 31–42), "The statements here suggest Lean forms for particular milestones …", and the whole file.

**Claim.** The file is an API catalogue, not an acceptance test.
- It states none of the README's end theorems: Brown representability (G3.1–2), the Milnor sequence (G3.4), Leray–Hirsch and the Thom isomorphism (G4.1, G4.3), Spanier–Whitehead duality (G5.1), `π_n S⊗ℚ=0` (G5.6), Freudenthal (G2.5), and G2.11's straightening equivalence and the rectification equivalence of HTT Proposition 4.2.4.4.
- The docstring does not name which of them are unstatable at the pins, or what carrier each lacks.
- It redeclares under `TauCetiRoadmap.GeneralizedCohomology` carriers that the pin already has, with `sorry` structure where the pin has proofs.

**Witness.** Pinned Tau Ceti has:
- `TauCeti.PointedSSet` (`AlgebraicTopology/SimplicialSet/Pointed/Basic.lean:33`)
- `TauCeti.FiniteBijection` (`CategoryTheory/FiniteBijection.lean:45`)
- `TauCeti.SymmetricSequence` (`AlgebraicTopology/Spectra/SymmetricSequence.lean:90`)
- `TauCeti.SymmetricSpectrum` (`AlgebraicTopology/Spectra/SymmetricSpectrum.lean:92`)
- `TauCeti.IsHurewiczFibration` (`Topology/Homotopy/HurewiczFibration/Basic.lean:58`)
- `TauCeti.MappingPathSpace` (`Topology/Homotopy/MappingPath/Basic.lean:40`)
- `TauCeti.MappingPathFiber` (`Topology/Homotopy/MappingPath/Fiber.lean:51`)

The file instead redefines these with `pointedSSetMonoidal := by sorry`.

**Repair.** Rewrite the file as the acceptance test:
- State each headline that is statable on the pinned `TauCeti.*` and Mathlib carriers.
- List the rest in the docstring with the missing carrier: no stable homotopy category or represented cohomology theory at the pins, and no Joyal or covariant model structure.
- Import the pinned carriers instead of redefining them.

## R08 (P3) — G2.11 locators that do not point to the stated result

**Location.** `README.md` lines 1055, 1246, 982, 1004 and 1118.

**Claim.** Two printed HTT locators point to the wrong result. Three more are Lurie's internal LaTeX labels, not printed numbers.
- Line 1055, "model recognition (HTTA.2.6.13)": HTT A.2.6.13 is an Example, not the recognition theorem.
- Line 1246, "the localization criterion of HTT5.2.7.4": the stated functor-precomposition property is a different proposition.
- Line 982 ("HTT2.2's simfun"), line 1004 ("HTT's weakcompatequiv") and line 1118 ("HTT spek3–spek5") are internal labels.

**Witness.**
- LurieHTT line 38362: Example A.2.6.13 only says that isomorphisms form a perfect class. The recognition theorem is Proposition A.2.6.15 (LurieHTT line 38368, printed p. 825).
- LurieHTT line 17361: Proposition 5.2.7.4 is the equivalent descriptions of a localization functor. The precomposition statement is Proposition 5.2.7.12 (LurieHTT line 17500, printed p. 368).
- The enriched Quillen-equivalence criterion is Proposition A.3.1.10 (LurieHTT line 39789, printed p. 855).
- The marked product comparison and the images of marked anodyne cells are Propositions 3.2.1.13 and 3.2.1.11 (LurieHTT lines 8420 and 8305, printed pp. 176 and 174).

**Repair.** Write "HTT Prop. A.2.6.15 (with Def. A.2.6.12)", "HTT Prop. 5.2.7.12 (with 5.2.7.4)", "HTT Prop. A.3.1.10" and "HTT Props. 3.2.1.11 and 3.2.1.13". For "simfun", give the printed number of the statement meant.

## R09 (P3) — The moved BordismFormalGroups F6.5 sub-lanes are cited elsewhere, with no old → new mapping

**Location.** `README.md` lines 62–65 and 674–676, which name BordismFormalGroups F6.5 and EllipticCohomology as the only consumers of G2.11.

**Claim.** At this head, BordismFormalGroups no longer contains the F6.5 sub-lanes "Categorical model and functor spaces", "Unmarked straightening and the categorical model", "Marked fibrations and Kan extensions" and "Coherent model diagrams and stable enhancements". The monoidal/fibration and quotient/Ind sub-lanes are also gone. G2.11 now holds them under the same titles. Other roadmaps still cite them at F6.5.

**Witness.**
- EnhancedDerivedSheaves on main, README lines 32 and 146–148, cites "`BordismFormalGroups` F6.5, 'Categorical model and functor spaces' …". Its line 33 says GeneralizedCohomology "consumes BordismFormalGroups F6.5", which is now false.
- GeometryOfNumbersAndQuadraticArithmetic (#851, lines 203–229), StableHomotopyKTheory (#1227) and RefinedTraceMethods (#1493) cite the same sub-lanes.

**Repair.**
- In G2.11's opening, add one line per moved sub-lane, for example "BordismFormalGroups F6.5 'Categorical model and functor spaces' → GeneralizedCohomology G2.11, same title".
- List EnhancedDerivedSheaves among G2.11's consumers.
- Repoint EnhancedDerivedSheaves' citations in this pull request, or name that repointing in its merge-order paragraph.

## R10 (P3) — `realizationProductKelleyComparison` left behind in Suggested.lean, and the open AlgebraicTopology revisions give it back to G2.1

**Location.**
- `Suggested.lean` line 514: `noncomputable def realizationProductKelleyComparison`, documented as "PR284-owned".
- `README.md` lines 236–241: "Consume AT Stage 4.5's simplicial-realization product comparison".

**Claim.**
- The README no longer names this declaration and gives the comparison to AlgebraicTopology Stage 4 item 5, yet this file still declares it, as sorry'd data.
- DGFloer on main (README line 156) cites "Early G2.1 supplies … realizationProductKelleyComparison".
- The open revisions #1652 (AlgebraicTopology README lines 415–420, "From TauCetiRoadmap.GeneralizedCohomology: G2.1's realization product comparison …") and #1663 (lines 141–142) still have AlgebraicTopology consume it from G2.1. No order between them and this pull request is stated.

**Witness.** `grep realizationProductKelleyComparison` over the head finds only `Suggested.lean:514` and `DGFloer/README.md:156`. AlgebraicTopology at this head (lines 787–804) owns the comparison.

**Repair.**
- Delete the declaration from `Suggested.lean`.
- Add to G2.1 the line "G2.1 `realizationProductKelleyComparison` → AlgebraicTopology Stage 4 item 5 simplicial-realization product comparison".
- In the merge-order paragraph, state that #1652 and #1663 rebase onto this pull request and drop their "from G2.1" contracts.

## R11 (P3) — Unescaped pipes break the AlgebraicTopology supplier row

**Location.** `README.md` line 33, added by this pull request: "Stage4.5's simplicial-realization product comparison |K×L|≃k(|K|×|L|) with its compact-generation facts".

**Claim.** The six unescaped `|` characters split the cell. GitHub renders "K×L" in the Boundary column and drops the rest of the contract, including the real boundary "singular chains … remain there".

**Witness.** Line 33 has 10 pipes; every other row of the table (lines 31–46) has 4.

**Repair.** Write "the realization of K×L is homeomorphic to k(|K|×|L|)" with each `|` escaped as `\|`, or use "‖K×L‖".

## R12 (P3) — Stale consumer claims about DGFloer Layer 1 item 2

**Location.** `README.md` line 649, "DGF1.2 consumes it in its Hurewicz-based LES lane", and line 664, "the separate existing native Serre theorem consumed by DGF1.2".

**Claim.** After this pull request, the fibration long exact sequence belongs to AlgebraicTopology Stage 5 item 5, which builds it "directly by relative lifting and endpoint restriction" (AlgebraicTopology README line 1034) without `zeroSetSDR_liftingInclusion`. DGFloer's own revision says that layer takes no GeneralizedCohomology input.

**Witness.** DGFloer at #1798, README line 1063: "These targets use AlgebraicTopology Stages 1–4 and item 3, with no Stage 5.5 or GeneralizedCohomology input".

**Repair.** Name the actual consumer of `zeroSetSDR_liftingInclusion` and `numerableFiberBundle_hurewicz` (for example DGFloer Layer 2's Moore-path replacements, as at line 557), or delete the two clauses.

## R13 (P3) — None of the 15 sampled targets has a locator (predates this pull request)

**Location.** G1.1, G1.2, G1.3, G1.4, G1.5, G1.7, G2.2, G2.4, G2.6, G2.10, G3.7, G4.1, G4.2, G4.4 and G5.4 (README lines 143–211, 243–304, 399–407, 536–667, 1616–1625, 2028–2074 and 2388–2515).

**Claim.** Each states theorems with no theorem or page locator. The References section (lines 3470–3530) cites whole chapters only.

**Witness.** G2.6 requires "a nonsemistable counterexample F₁S¹" but cites nothing. The statement is HSS2000 line 1088 (Example 3.1.10, p. 23) together with line 2907 (after Definition 5.6.1, p. 61).

**Repair.** Add a locator at each claim, for example "(HSS, Ex. 3.1.10 and Def. 5.6.1)" in G2.6. Do the same for every numbered target.

## R14 (P3) — Style gate: links pinned to commits, pull-request numbers and a LaTeX delimiter

**Location.**
- Links pinned to commits (`blob/<sha>`): README lines 39, 42, 3112, 3260 and 3262.
- Pull-request numbers: lines 39 ("ComplexManifolds PR279", "#279"), 75, 241, 328, 2320 and 2487 ("PR284").
- Line 3279: "V=K\A, Z=L\(A∩L), U=K\(A∪L)", where `\(` is read as a LaTeX delimiter.

**Claim.** These break the README house rules. The anchors at lines 42 and 3262 are also renamed by the open revisions #1674 (SpinGeometry G1.3, still present at its line 252) and #1398 (ComplexKahlerGeometry K7.1, still present at its line 2273).

**Witness.** The gate reports `blob=5`, `prnum=6` and `latex=2`.

**Repair.**
- Cite by roadmap name and section: "SpinGeometry G1.3", "ComplexKahlerGeometry K1 and K7.1", "SmoothBundlesConnections B1.4", "ComplexManifolds Milestones 1–2".
- Drop the pull-request numbers.
- Write the set differences with `∖` (U+2216) or inside a code span.

## R15 (P3) — Suggested.lean imports, statement hygiene and padding (predates this pull request)

**Location.** `Suggested.lean` lines 1–29 (twenty-five `import Mathlib.<…>` lines and no `import Mathlib`), lines 324–331 (`Classical.choose` in `quaternionSpSliceChartData`), and the `rfl` lemmas and examples.

**Claim.**
- The imports and the use of choice in a `def` break the Suggested.lean form rules.
- The following restate definitions or close in one step: `levelMap_id` (674), `levelMap_comp` (678), the four `mappingPathFiberConst…_apply`/`_symm_apply` lemmas, the two `…_comp_inclusion` lemmas, `nativeSpinFourQuaternionHomeomorph_apply` and `quaternionProjectiveGrassmannianHomeomorph_toEquiv`. `quaternionSp_contMDiff_iff_comp_subtypeVal` is closed by `exact Subgroup.contMDiff_iff_comp_subtypeVal_chartedSpaceOfIsSliceChart …`. The examples are at lines 286, 411 and 621–623.

**Witness.** The gate reports `mathlib-subimports=25`, `no-import-mathlib=1` and `statement-hygiene=2`. Each listed lemma's proof is `rfl`, `ext; rfl` or the single library lemma above.

**Repair.** Use the single line `import Mathlib` followed by the `TauCeti.*` modules actually used. Delete the listed lemmas, the examples and `quaternionSpSliceChartData`; the README keeps the statements.

## R16 (P3) — The README is not in the current roadmap shape (predates this pull request)

**Location.** The whole of `README.md`: headings "# Generalized cohomology, spectra and orientations", "## Scope and suppliers", "## G1. …" through "## G5. …", and numbered items with no `###` subsections.

**Claim.** The README lacks the required shape:
- the `# Roadmap:` title and `**Summary.**`
- the `## Exact supplier contracts` and `## How to read the build` sections
- `**Checks.**` lists: there are none, so no definition has its three discriminating Checks
- per-layer `### Examples` and `### Dependencies`
- `*Needs:*` lines

**Witness.** `grep -c 'Checks\.'` returns 0, and `grep -c '^### '` returns 0.

**Repair.** Restructure the README in the house shape. Add Checks to each definition, for example the F₁S¹ naive-versus-true `π₀` and the `[S¹,GL₂(ℝ)]` infinite dihedral group already stated in prose. Add Examples and Dependencies to each layer.

## Verified sound

**Gate and depcheck.**
- I reran the gate. Its counts match `scratch/gate.md`. The `outside-folder` hits of a bare rerun are the pull request's own sibling folders and are not findings.
- `git diff --stat origin/main...HEAD` outside the 14 listed folders is empty.
- Depcheck output at this head, identical to main except that the StringOrientation hit moves from line 2589 to line 3419:

```
UPWARD: GeneralizedCohomology (on main) -> CStarAlgebras (#7) at README lines [45]
UPWARD: GeneralizedCohomology (on main) -> HilbertModules (#8) at README lines [45]
UPWARD: GeneralizedCohomology (on main) -> HomotopySpheres (#71) at README lines [37]
UPWARD: GeneralizedCohomology (on main) -> OperatorKTheory (#9) at README lines [45]
UPWARD: GeneralizedCohomology (on main) -> StringOrientation (#11) at README lines [3419]
UPWARD: GeneralizedCohomology (on main) -> TangentialBordism (#14) at README lines [43]
CYCLE among: GeneralizedCohomology, HomotopySpheres, StringOrientation, TangentialBordism
depcheck: 240 roadmaps, 2464 edges, 7 problem(s)
```

The hits at lines 43 and 3419 are consumer and boundary mentions that the tool reads as supplier edges. They are repaired by rewording (R01), not by changing ownership.

**Elaboration.** `lake env lean TauCetiRoadmap/GeneralizedCohomology/Suggested.lean` exits 0. Its only warnings are 25 "declaration uses `sorry`".

**Signatures.** I compared the worker's `#check @` transcript for all 98 declarations with the README. Of the 11 flagged leads, the `[Category* C]` and `hk` leads are false: the binder is present as `inst`, or kept by `have _ := hk`. The genuine loss is `(shiftFunctor C n).Additive` in two sorry'd `≃+` (R06). The file is unchanged, so nothing changed there.

**G2.11 is a move, not new planning.** G2.11 matches BordismFormalGroups F6.5 on main for 48,647 of its 49,008 whitespace-normalised characters. At this head, BordismFormalGroups F6.5 (lines 1881–1964 and 2296–2335) consumes G2.11 with no returned input. AlgebraicTopology names GeneralizedCohomology only as a consumer (lines 119, 132, 609, 802, 909, 1059, 1144, 1905, 2159 and 2184), so there is no AlgebraicTopology↔GeneralizedCohomology cycle.

**Cross-roadmap citations resolved at this head.**
- AlgebraicTopology Stage 4 items 5 (realization product, lines 787–804), 6 (RP, 821), 7 (`simplicialRealizationCW`, 856) and 8 (CW approximation, 882).
- AlgebraicTopology Stage 5 items 0 (filtered complex, 926) and 5 (Serre predicate, the long exact sequence, path-space fibrations and Serre spectral sequences, 1017–1075).
- AlgebraicTopology Stage 8 items 8.8c (2098), 8.8d (2162), 10 (2227) and 11b (2307).
- TopologicalKTheory T1.5: smooth graph charts, interleaved blocks, rank-one diffeomorphisms (lines 136–148 and 453–470).
- ComplexKahlerGeometry K7.1 (line 1962).
- At open heads: SpinGeometry G1.3 at #1674 (line 252, `cliffordScalarTrace`); ComplexKahlerGeometry K7.1 at #1398 (line 2273); DGFloer at #1798 (line 1063); EnhancedDerivedSheaves on main (lines 7, 32 and 146–148); HigherToposTheory #1901 (scope); AlgebraicTopology #1652 (lines 415–420, 456–467 and 2617) and #1663 (lines 132–145 and 2013).

**Library declarations opened at the pins.**
- Mathlib: `TopologicalSpace.compactlyGenerated` (`Topology/Compactness/CompactlyGeneratedSpace.lean:68`), `CompactlyGenerated.compactlyGeneratedToTop` (`Topology/Category/CompactlyGenerated.lean:78`), `compactlyGeneratedAdjunction` (`Condensed/TopCatAdjunction.lean:175`, which goes through condensed sets; there is no direct k-coreflector), `CStarModule`, `IsCompactOperator`, `cfc`.
- Tau Ceti: the seven carriers of R07, plus `MappingPathSpace.homotopyEquiv` (`MappingPath/Basic.lean:123`), `endpointLiftingFunction` (`LiftingFunction.lean:226`), `isHurewiczFibration_endpoint` (`:267`), `FiberInclusionPathFiber.loopHomotopyEquiv` (`HurewiczFibration/FiberInclusion.lean:263`) and `realSpinFourEquivQuaternionUnitaryProd`.
- No Joyal, Bergner or straightening development exists at either pin, so G2.11 duplicates nothing pinned.

**Overlaps file.**
- #1187 conflicts in this folder's `Suggested.lean`, but this pull request leaves that file identical to main 3b3f7ef, so the conflict is not this pull request's.
- #1808 is stacked on this pull request and its order is stated.
- #1854 conflicts only in AlgebraicCurves.
- The three dropped anchors are covered by R05 and R14.
- Closest in vocabulary: HigherToposTheory (R03) and StableHomotopyKTheory (R09).

**Adversarial table** (sampled targets, headlines, and the targets the findings touch):

| Statement | Instances tried | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| G1.2 `Eⁿ(X)≃Eⁿ(*)⊕Ẽⁿ(X)`, X nonempty | X=S⁰; X=∅ | S⁰: E(*)² / E(*)⊕E(*). ∅: 0 / Eⁿ(*)≠0 | holds; "nonempty" needed and present | none |
| G1.3/G1.6 `δ(a∪b)=(−1)^p a∪δb`, right action unsigned | left-suspension convention of G1.4 | moving a (degree p) past the left suspension coordinate gives (−1)^p; the right factor gives +1 | agrees with G1.4 | none |
| G1.5 `(U×V)⁺≃U⁺∧V⁺` | U=V=ℝ; U=∅ | (ℝ²)⁺=S² / S¹∧S¹=S². pt / pt∧V⁺=pt | holds | none |
| G1.7 σ²=0 | E=H𝔽₂; reduced diagonal S¹→S² | commutativity alone gives 2σ²=0 (empty for 𝔽₂); π₁S²=0, so the diagonal is null and σ²=0 | the README's distinction is correct | none |
| G2.2 Day wedge formula | n=0, n=1 | A₀∧B₀; (Σ₁)₊∧(A₀∧B₁∨A₁∧B₀) | holds | none |
| G2.6 F₁S¹ not semistable | naive versus true π₀ | ⊕_ℕℤ / ℤ (HSS2000 line 1088) | holds | locator (R13) |
| G2.9 π₃ table and stabilizations | SO(3), SO(4), SO(5) | ℤ; ℤ²; SO(3)→SO(4) is (1,1); kernel of SO(4)→SO(5) is (1,−1)=TS⁴ clutching (e=2, p₁=0); SO(3)→SO(5) is ×2 | holds | none |
| G2.10 fibre over b equals Ω(K,k) | f(b) and k in different path components | Path(f(b),k)=∅ / Ω(K,k)≠∅ | the empty-fibre clause is needed and present | none |
| G2.10 endpoint map Hurewicz | pinned Tau Ceti | proved at `LiftingFunction.lean:267` / rerouted through AlgebraicTopology 5.5 | two owners | R04 |
| G2.5 Freudenthal | X=S² (k=2); X=S¹∨S¹ (k=1) | π₂S²=ℤ→π₃S³=ℤ iso; π₃S²=ℤ→π₄S³=ℤ/2 onto. F₂→ℤ² onto, not iso | the ranges are exact | none |
| G2.5 homotopy excision | the two cones on a (k−1)-connected X | (k,k)-connected square gives (2k−1)-cartesian, so X→ΩΣX is (2k−1)-connected | consistent | none |
| G3.4 Milnor sequence | constant tower, identity maps | lim¹=0; E^q(hocolim)=E^q(X)=lim | holds | none |
| G3.6 phantom S_ℚ→ΣHZ | constant-one class in coker(1−shift) | a₀≡1,3,9,33,153 mod 2!,3!,4!,5!,6!; (k+1)!−S_k=1,3,15,87,567 strictly increasing | no integer a₀ works, so the class is nonzero | none |
| G3.7 finite-source formula | X=S⁰, E=HZ, n=0 | π₀HZ=ℤ / colim_k π_kK(ℤ,k)=ℤ | holds | none |
| G4.1 Leray–Hirsch | F=F₀; B×S² with E=HZ | 0 / 0. H^q(B×S²) / H^q(B)⊕H^(q−2)(B) | holds | none |
| G4.2 Thom spaces | rank 0; ε^r over a point | Th(0_B)=B₊; S^r=Σ^rS⁰ | holds | none |
| G4.3 orientations | Möbius bundle over S¹ | Th=ℝP²; mod 2 a Thom class exists; integrally none (H²(ℝP²;ℤ)=ℤ/2, not a unit on the fibre) | holds | none |
| G4.4 `U∪U=π*e∪U` | ε¹ over a point, E=HZ | H²(D¹,S⁰)=0 / e(ε¹)=0 | both sides 0 | none |
| G5.4 MSO orientation twist | n=2, σ a transposition | the wedge of swapped columns is −(original) / sgn σ=−1 | holds | none |
| G5.4 Pin⁺ and even parts | star(ιv)ιv; e₁e₂ and e₁e₃ | −Q(v)=−1 for a unit v, so excluded from `pinGroup`. (e₁e₂)²=−1=(−f₁f₂)². e₁e₂·e₂e₃=e₁e₃ ↦ −f₁f₃ | holds | none |
| G5.6 `π_nS⊗ℚ=0`, n>0 | n=0; n=3 | ℚ (excluded); ℤ/24⊗ℚ=0 | holds | none |
| G2.11 Ind_κ(C) zero | represented zero versus empty presheaf | y(0)≃* is terminal in presheaves; ∅ is initial | the distinction is correct | none |
| G2.11 sphere cofibrancy | stable projective versus positive model | F₀S⁰ cofibrant; not cofibrant in the positive model | holds | none |
| G2.11 HTT 3.3.1.8, 2.4.2.4, 2.1.3.4 chain | read at LurieHTT lines 9952, 5975, 3469 | over a Kan complex, categorical fibration ⇔ Cartesian; Kan fibres ⇒ right fibration; contractible fibres ⇒ trivial (dual of the left-fibration form) | holds | none |
| G2.11 HTT 5.2.7.4 and A.2.6.13 | read at LurieHTT lines 17361, 17500, 38362, 38368 | 5.2.7.4 characterizes localization functors; 5.2.7.12 is the stated property. A.2.6.13 is an Example; A.2.6.15 is the recognition theorem | wrong locators | R08 |
| G2.11 HA 4.8.1.10/13, 7.3.2.6/7, 4.1.8, 4.3.3 | read at LurieHA lines 27069, 27099, 49435, 49482, 18817, 21223 | universal monoidal extension; Day convolution remark; relative adjoints over O⊗; Theorems 4.1.8.4 and 4.3.3.17 | locators correct | none |
| G2.11 HTT 1.2.4.3, 2.2.1.2, 4.2.4.3, 4.2.4.4, 4.2.4.1 | read at LurieHTT lines 2066, 3814, 12172, 12198, 12161 | Joyal's horn criterion (n≥2 implicit); Quillen adjunction plus equivalence; Lemma 4.2.4.3; Proposition 4.2.4.4; Theorem 4.2.4.1 | locators correct | none |

**Seeded source sample.** The 15 targets drawn were G1.1, G1.2, G1.3, G1.4, G1.5, G1.7, G2.2, G2.4, G2.6, G2.10, G3.7, G4.1, G4.2, G4.4 and G5.4. None carries a locator (R13). I checked their mathematics in the table above, and checked G2.6 against HSS2000 lines 1088 and 2904–2907. For the locator-bearing text this pull request adds (G2.11), I checked 22 HTT and HA locators against LurieHTT and LurieHA: 17 resolve to the stated result, 2 point to the wrong result, and 3 are internal labels (R08). The 17 correct ones:
- HTT 1.2.4.3, 1.2.9.3, 2.1.3.4, 2.2.1.2, 2.4.2.4, 2.4.6.5, 3.3.1.8, 4.2.4.1, 4.2.4.3, 4.2.4.4 and A.3.2.16.
- HA 4.1.8.4, 4.3.3.17, 4.8.1.10, 4.8.1.13, 7.3.2.6 and 7.3.2.7.

## Not verifiable

- J. F. Adams, *Stable Homotopy and Generalised Homology*, Part III. I found no legal open copy and did not fetch it. No sampled target carries an Adams locator, so nothing depends on it.
- Mathlib pull requests #41744, #44464 and #41735, and Riou's project. These are design references, not theorem sources; I did not open them.
- The `simfun` label of R08: I could not tie it to one printed HTT result. The surrounding text of HTT §2.2.1 and Lemma 2.2.3.10 is relevant, but I did not identify the label itself.

## Source issues

- none
