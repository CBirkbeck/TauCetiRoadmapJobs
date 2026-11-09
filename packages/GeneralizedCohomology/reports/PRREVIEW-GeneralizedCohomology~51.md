# Review of GeneralizedCohomology (pull request #1854 at a7b81af)

**Verdict:** needs changes

The gate fails on this head (set_option, sorry-data, imports, blob, latex, prnum, dropped, statement-hygiene, depcheck, outside-folder). The pull request changes only `TauCetiRoadmap/GeneralizedCohomology/README.md` in this folder (+926/−84 lines against the merge base: the new G2.11 and G5.7, and AlgebraicTopology replacing DGFloer as a supplier). `Suggested.lean` is unchanged from main. As the brief asks, this is a full review of both files.

## R01 (P1) — The roadmap remains in a dependency cycle and cites four upward suppliers

**Location.** `TauCetiRoadmap/GeneralizedCohomology/README.md` line 37: "[HomotopySpheres Stage 3A](…/pull/284) | the native `CompactlyGenerated` inclusion …; pointed convenient mapping spaces, suspension/loop, smash, mapping cone/Puppe, stable sphere stems and Freudenthal". The same supplier appears as "PR284" at lines 75, 241, 328, 2320 and 2487, and in `Suggested.lean` line 513. Line 45 cites "[OperatorKTheory K5](…/pull/866)", consumed again at lines 2647–2652. Line 43 ends "…remain TangentialBordism", and line 3419 reads "…before StringOrientation defines λ and BString".

**Claim.** This roadmap is on main, so it may consume only main and the pins. HomotopySpheres, OperatorKTheory, StringOrientation and TangentialBordism are on neither. HomotopySpheres is also on the list of roadmaps never to be cited as a supplier. The pull request's purpose is to cut main's loops, but this folder's cycle survives unchanged; the main copy of the README gives the same five lines.

**Witness.** Dependency check output on this head:
```
UPWARD: GeneralizedCohomology (on main) -> HomotopySpheres (#45) at README lines [37]
UPWARD: GeneralizedCohomology (on main) -> OperatorKTheory (#9) at README lines [45]
UPWARD: GeneralizedCohomology (on main) -> StringOrientation (#11) at README lines [3419]
UPWARD: GeneralizedCohomology (on main) -> TangentialBordism (#14) at README lines [43]
CYCLE among: GeneralizedCohomology, HomotopySpheres, StringOrientation, TangentialBordism
```

**Repair.**
1. **Compact-generation interface.** Replace the HomotopySpheres row (line 37) with native Mathlib `CompactlyGenerated` and AlgebraicTopology Stage 4.5's compact-generation interface. At this head, AlgebraicTopology README line 139 reads "Stage 4.5 owns the compact-generation interface".
2. **Pointed convenient constructions.** State the pointed convenient smash, mapping cone and Puppe sequence as G1.3/G2.1 targets here. G2.5 already states general Freudenthal and homotopy excision. At lines 395–398, identify π_n S with G2.5's own Freudenthal colimit, not "the supplier's stabilized sphere colimit".
3. **Real Bott chain.** Repoint lines 2320 and 2487 to TopologicalKTheory's bundle-level real Bott isomorphism, which the line-38 row already consumes, or state the real loop-space Bott chain as a G5 target.
4. **Operator inputs.** Replace OperatorKTheory K5 (line 45; lines 2647–2652) with HilbertModules H2/H4–H6 and CStarAlgebras C5, which are on main, or state the graded Clifford and functional-calculus items in G5.5.
5. **Consumer-only mentions.** Move "structured PT and geometric bordism remain TangentialBordism" (line 43) and the StringOrientation clause (line 3419) into a "Downstream consumers" section that names them only as consumers.
6. **Check.** Re-run the dependency check; it must print no UPWARD or CYCLE line.

## R02 (P1) — Suggested.lean states sorry'd data, and most of it re-declares carriers the Tau Ceti pin already constructs

**Location.** The gate reports 22 sorry-data hits in `TauCetiRoadmap/GeneralizedCohomology/Suggested.lean`, for example:
- line 537: `noncomputable instance pointedSSetMonoidal : MonoidalCategory PointedSSet := by sorry`
- line 656: `symmetricSphere : Mon SymmetricSequence := by sorry`
- line 392: `quaternionFrameGroupChartedSpace … := by sorry`
- line 730: `coefficientDegreeEquiv … ≃+ … := by sorry`

**Claim.** A sorry'd carrier is unconstrained, so every declaration that mentions it is vacuous:
- **The sphere monoid.** `SymmetricSpectrum := Mod SymmetricSequence symmetricSphere.X` (line 665) is a module over an arbitrary monoid.
- **The smash product.** The cartesian monoidal structure inhabits the type of `pointedSSetMonoidal`, and only a docstring excludes it.
- **The Sp(N) criterion.** `quaternionFrameGroup_contMDiff_iff` (line 399) is a smoothness criterion for arbitrary sorry'd charts.
- **The coefficient sign.** `coefficientDegreeEquiv`, advertised as the "exact integer sign check" for `Eⁿ(*)=π_(−n)E`, pins no map: negation composed with any isomorphism has the same type.

**Witness.** The Tau Ceti pin already has these objects, with real constructions:

| Suggested.lean declaration | At the Tau Ceti pin |
| --- | --- |
| `PointedSSet` | `TauCeti.PointedSSet := Under Δ[0]` (`TauCeti/AlgebraicTopology/SimplicialSet/Pointed/Basic.lean:33`) |
| `pointedSSetMonoidal`, `pointedSSetSymmetric` | `PointedSSet.monoidalCategory`, `symmetricCategory`, the smash quotient (`Pointed/Smash/Basic.lean:65,69,234`) |
| `FiniteBijection` and its monoidal and symmetric instances | `TauCeti.FiniteBijection` with both instances (`TauCeti/CategoryTheory/FiniteBijection.lean:45,290,344`) |
| `SymmetricSequence` | `TauCeti.SymmetricSequence` (`Spectra/SymmetricSequence.lean:90`) |
| `symmetricSphere`, `sphereIsComm` | `SymmetricSequence.sphere` (`Spectra/SymmetricSpectrum.lean:82`); `DayFunctor.isCommMonObj` (`CategoryTheory/Monoidal/DayConvolution/Monoid.lean:134`) |
| `SymmetricSpectrum` | `TauCeti.SymmetricSpectrum` (`Spectra/SymmetricSpectrum.lean:92`) |
| `freeSpectrum`, `freeEvaluationEquiv` | `free n ⊣ evaluation n` (`Spectra/Free.lean:174,178`) |
| `MappingPathSpace`, `MappingPathFiber` | `TauCeti/Topology/Homotopy/MappingPath/Basic.lean:40`, `Fiber.lean:51` |
| `IsHurewiczFibration` | `TauCeti/Topology/Homotopy/HurewiczFibration/Basic.lean:58` |
| `mappingPathFiberConstHomeomorphPath` | `TauCeti/Topology/Homotopy/MappingPath/Fiber.lean:177` |

**Repair.** Delete every sorry'd `def`/`instance` and every declaration that mentions one:
- `level`, `levelMap*`, `levelPermutation`, `spectrumSmash`, `freeSpectrum`, `freeEvaluationEquiv`, `sequenceActionEquivalence`, `sequenceDayBraiding`
- `quaternionFrameGroupChartedSpace`, `quaternionFrameGroup_contMDiff_iff`
- `coefficientDegreeEquiv`, `suspensionCohomologyEquiv`, `realizationProductKelleyComparison`
- `nativeSpinFourQuaternionHomeomorph`, `quaternionProjectiveGrassmannianHomeomorph` (their only `sorry`s are continuity fields)

Also delete the duplicated carriers. Where a headline needs them (R04), import the Tau Ceti modules instead. The README keeps the constructions as targets and cites the pinned names (R07). On the refuting instance: Tau Ceti's `PointedSSet.monoidalCategory` is built from `smashProj` (`Smash/Basic.lean:234`), which excludes the cartesian product.

## R03 (P2) — `set_option` and a choice-defined datum in the Sp(N) Lie-data block

**Location.** `Suggested.lean` lines 333 and 355 have `set_option maxHeartbeats 1000000 in`. Lines 324–331 define `quaternionSpSliceChartData` by `Classical.choose` (gate statement-hygiene, lines 328–329).

**Claim.** `set_option` is a blocking policy violation. The block exists only to define `quaternionSpEmbeddedLieSubgroupData` and to prove `quaternionSp_contMDiff_iff_comp_subtypeVal`. That proof is the single term `exact Subgroup.contMDiff_iff_comp_subtypeVal_chartedSpaceOfIsSliceChart _ d.chart …` (line 368), so it is padding by the one-tactic test.

**Witness.** The gate's set_option list at lines 333 and 355, and its statement-hygiene P3 hits at lines 328–329.

**Repair.** Delete the section `QuaternionSpLieData` (lines 289–372) together with `QuaternionSpEuclideanModel` and `quaternionMatrixStdRealCoordinates`. G4.0b's README text keeps the smooth-into criterion as a target, citing `TauCeti.Lie.exists_isSliceChart_of_isClosed_subgroup` and `Subgroup.contMDiff_iff_comp_subtypeVal_chartedSpaceOfIsSliceChart`. The file then contains no `set_option` and no choice.

## R04 (P2) — No headline theorem is stated, although several are statable at the pins

**Location.** `Suggested.lean` module docstring, lines 31–42: "The statements here suggest Lean forms for particular milestones…". README lines 18–19: "`Suggested.lean` checks selected carrier and interface shapes; … its admitted constructions are targets."

**Claim.** The file is an API catalogue. None of its 98 declarations is a deep result the finished roadmap proves. The docstring does not have the required form ("<title>: target signatures"), and it does not name the headlines that cannot be stated or the carrier each one lacks.

**Witness.** A scratch file with `import Mathlib` and `import TauCeti.AlgebraicTopology.Homotopy.Hurewicz.Basic` elaborates the following two headlines, with `sorry` as the only warning:
- **G5.6, rational stable stems.** `∀ n j, 0 < n → ∀ x, Subsingleton ((Additive (HomotopyGroup (Fin ((2*n+j)+2)) (Metric.sphere (0 : EuclideanSpace ℝ (Fin (n+j+3))) 1) x)) ⊗[ℤ] ℚ)`. This is the stem n in the stable range k = n+j+2 ≥ n+2.
- **G5.6, unstable rational Hurewicz.** Take a CW space X that is (k−1)-connected with k ≥ 2, and a degree i+1 with 2 ≤ i+1 ≤ 2k−2. Then `HomotopyGroup.hurewiczHom (ModuleCat.of ℚ ℚ) i` has torsion kernel, and some positive multiple of every target element lies in its range. `hurewiczHom` is at `TauCeti/AlgebraicTopology/Homotopy/Hurewicz/Basic.lean:652`.

**Repair.**
- **State the two headlines.** Put both statements in `Suggested.lean`, each with its docstring and locator.
- **Rewrite the module docstring** in the required form. List as not statable at the pins:
  - Brown representability: there is no homotopy category of pointed CW complexes and no cohomology-theory carrier.
  - The stable model structure on `TauCeti.SymmetricSpectrum`: stable equivalences are not defined.
  - The Thom isomorphism, the Milnor sequence and Spanier–Whitehead duality: there is no stable homotopy category and no derived smash.
  - General Freudenthal: there is no reduced suspension of pointed topological spaces at the pins.
  - `H*(BSp(r);ℤ)=ℤ[a₁,…,a_r]`: there is no BSp(r) carrier.
- **Fix README lines 18–19** so they describe `Suggested.lean` as the acceptance test.

**Recheck on the instance.** The probe above elaborates on the same pins.

## R05 (P2) — This pull request's AlgebraicTopology no longer declares twelve names this roadmap consumes

**Location.** README lines 231–232: "Consume AT4's `simplicialRealizationCW`, AT8.2's `simplicialGroupKan`, `simplicialGroupMooreHomotopyIso` and `kanRealizationUnitHomotopyIso`". Further names appear at line 35 (`ordinaryEMUniversalClass`, `ordinaryEMRelativeRepresentability`, `ordinaryEMLoopComparison`, `ordinaryCohomologySuspension`, `projectiveEMComparisons`), lines 101 and 432, lines 1860 and 1865 (`supBallEuclideanDiskHomeomorph`, `diskQuotientSphereHomeomorph`) and line 1874 (`diskBoundarySubset`).

**Claim.** This is supplier drift that the pull request creates itself. On main, the AlgebraicTopology README names all twelve. In the copy at this head, the README and all its `.lean` files name none of them. The content moved into prose, so the backticked citations dangle.

**Witness.** A name count (`grep -c`) at this head gives 0 for each of the twelve names in `TauCetiRoadmap/AlgebraicTopology/README.md` and its Lean files. On main, each name appears in that README at least once.

**Repair.** Cite AlgebraicTopology by stage, item and description, as it reads at this head:
- Stage 8 item 2 for the Kan property of simplicial groups and the Moore comparison (AT README lines 2270–2276).
- Stage 4 item 7 for the realization CW structure (line 1095).
- Stage 2.5 for the sup-ball and Euclidean-disk homeomorphisms (lines 582–590).
- Stage 4.4 for the disk-quotient sphere homeomorphism (line 761).
- Native `TopCat.diskBoundary` for `diskBoundarySubset`.
- 8.8c, 8.10 (`ordinaryEMRepresentability`, line 2737) and 8.11b (line 2820) for the EM models, representability, suspension and loop comparison.

Each remaining citation must resolve at this head. The citations "AT4.5", "AT4.8", "AT5.5", "AT6.0", "AT6.4", "8.8c" and "8.8d" already resolve (see Verified sound).

## R06 (P2) — Two owners of the Kan–Quillen, Bergner, Joyal and straightening foundations

**Location.**
- README line 222: "First build the unpointed Kan–Quillen model structure…".
- G2.11, lines 669–1504, new in this pull request. It owns the Bergner model (line 693), the Joyal model and the coherent nerve (lines 1054–1074), unmarked and marked straightening (lines 955 and 1076), Kan extensions (line 1235) and Ind (line 1325).

**Claim.** The open pull request #1901 (HigherToposTheory, a new roadmap) owns the same objects. Its README, Scope and ownership, line 36 claims "the Kan–Quillen model structure on `SSet`", line 38 "the Bergner model structure", and line 39 "the Joyal model structure, straightening, Kan extensions". Its line 50 says that BordismFormalGroups and EnhancedDerivedSheaves take these notions from there. Each roadmap thus presents itself as the owner, and no single owner exists.

**Witness.** The HigherToposTheory README at #1901, lines 36, 38 and 39, against this README's lines 222 and 669–1504.

**Repair.** Settle a single owner. This roadmap is on main and HigherToposTheory is not in the merge order, so this roadmap cannot consume it. Keep the objects here, and add a Scope sentence stating that G2.1's Kan–Quillen structure and G2.11 are owned here. Name HigherToposTheory, BordismFormalGroups, EnhancedDerivedSheaves and StableHomotopyKTheory as their consumers. The HigherToposTheory pull request must then cite G2.1 and G2.11 in place of its F2, F3 and L2–L4 copies, and the board should be told. Re-check: after both edits, a search (`roadmaps grep 'Bergner model'`) finds one owner.

## R07 (P2) — The README plans as targets what the Tau Ceti pin already provides, and says the pin lacks spectra

**Location.**
- G2.1, lines 215–221: pointed simplicial sets as `Under Δ[0]`, the equivalence with simplicial objects in `Pointed`, the smash and the suspension/loop adjunction.
- G2.2, lines 243–257: finite bijections, Day convolution, the commutative sphere monoid, spectra as modules, free spectra and evaluation, and "For each integer k≥1 build the corresponding sphere monoid S^(k)".
- G2.10, lines 539–606: the Hurewicz predicate, its lifting-function equivalence, the Serre comparison, `MappingPathSpace`/`MappingPathFiber`, the constant-map homeomorphisms, the endpoint fibration, the reference-path loop equivalence and the fibre-inclusion loop comparison.
- G4.0a, lines 1811–1814: "determine the native factor order … prove the resulting rightHom vector action".
- Lines 3524–3526: "it does not supply a category of spectra".

**Claim.** Everything above exists at the pin. The README has no "From Tau Ceti" contract, and the sentence at lines 3524–3526 is false at the pin.

**Witness.** Pinned Tau Ceti declarations:

| Pinned Tau Ceti declaration | File and line |
| --- | --- |
| `simplicialPointedEquivalence` | `Pointed/Basic.lean:191` |
| `PointedSSet.suspensionLoopAdjunction` | `Pointed/Suspension.lean:47` |
| `SymmetricSequence.sphereMonoid k`, `SphereModule k` | `Spectra/SphereMonoid.lean:60,91` |
| `isHurewiczFibration_iff_nonempty_liftingFunction` | `MappingPath/LiftingFunction.lean:172` |
| `IsHurewiczFibration.mem_serreFibrations_ulift` | `HurewiczFibration/Universe.lean:57` |
| `isHurewiczFibration_endpoint` | `MappingPath/LiftingFunction.lean:267` |
| `projFiberHomotopyEquivLoopSpace` | `MappingPath/Fiber.lean:157` |
| `loopHomotopyEquiv` | `HurewiczFibration/FiberInclusion.lean:263` |
| `IsHurewiczFibration.exists_lift_of_ndrPair` | `HurewiczFibration/RelativeLifting.lean:47` |
| `realSpinFourEquivQuaternionUnitaryProd_action` (v ↦ n₁·v·n₂* under `realCliffordFourZeroQuaternionEquiv`) | `LinearAlgebra/CliffordAlgebra/Spin/Real/Four.lean:341` |

The carriers listed in R02 are also at the pin.

**Repair.**
- **Supplier contract.** Add an "Exact supplier contracts → From Tau Ceti" list with these names and files.
- **Targets.** Cut G2.1, G2.2, G2.10 and G4.0a down to what is still missing: the Kan–Quillen and pointed model structures, the induction/wedge formula, the smash over S, function spectra, k-ification and the LES comparison.
- **Calibration.** State the G4.0a calibration as a corollary of the pinned action theorem.
- **Lines 3522–3526.** Rewrite them to say that the pin supplies the symmetric-spectrum carrier but no stable model structure or stable homotopy category.

## R08 (P3) — Ids this pull request moves are cited elsewhere without an old → new line

**Location.** The four bold paragraphs at README lines 678, 955, 1076 and 1137 ("Categorical model and functor spaces", "Unmarked straightening and the categorical model", "Marked fibrations and Kan extensions", "Coherent model diagrams and stable enhancements") moved here from BordismFormalGroups F6.5. `realizationProductKelleyComparison` left G2.1 for AlgebraicTopology Stage 4.5.

**Claim.** Three other roadmaps cite the old ids, and no README gives the move.

**Witness.**
- EnhancedDerivedSheaves on main, README lines 146 and 189–197: "Supplied by `BordismFormalGroups` F6.5, “Categorical model and functor spaces”…". BordismFormalGroups F6.5 at this head (line 2674) no longer contains these paragraphs.
- StableHomotopyKTheory at #1227, README line 15: "BordismFormalGroups, F6.5, owns Sp∞…"; line 235: "GeneralizedCohomology G2.1's `realizationProductKelleyComparison`".
- HigherToposTheory at #1901, README line 197: the same G2.1 name.

**Repair.**
- Add one line per moved id to the README Scope, for example: "BordismFormalGroups F6.5 “Categorical model and functor spaces” → GeneralizedCohomology G2.11 “Categorical model and functor spaces”", and likewise for the other three paragraphs and for Sp∞.
- Add the line "GeneralizedCohomology G2.1 `realizationProductKelleyComparison` → AlgebraicTopology Stage 4.5's simplicial-realization product comparison".
- Name EnhancedDerivedSheaves and StableHomotopyKTheory among the consumers at lines 62–65.

## R09 (P3) — Padding in Suggested.lean

**Location.**
- rfl/simp lemmas: `mappingPathFiberConstHomeomorphPath_apply` and `_symm_apply`, the two `…LoopSpace…` variants, `mappingPathProjection_comp_inclusion`, `mappingPathEndpoint_comp_inclusion`, `levelMap_id`, `levelMap_comp`, `nativeSpinFourQuaternionHomeomorph_apply`, `quaternionProjectiveGrassmannianHomeomorph_toEquiv`.
- `example`s at lines 286, 411, 621 and 622.
- Restatements of library notions: `finiteDualEvaluation := ExactPairing.evaluation P DP` (line 771), `finiteDualCoevaluation`, `StablePi`, `SpectralCohomology`, `SpectralHomology`, `cohomologyPullback`, `externalProductClass`, `stagewisePhantoms`, `IntegerGradedCofunctor`.
- `IsHurewiczFibration.lift`, a duplicate of the pinned `IsHurewiczFibration` API.
- Two coordinate computations: `quaternionFrameAction_preserves` and `spinFourCalibratedPair_vectorAction`.

**Claim.** None of these is a headline. Each one restates a definition, closes with one term, or mirrors a README convention check.

**Witness.**
- **`quaternionFrameAction_preserves`.** `Σᵢ conj((gv)ᵢ)(gw)ᵢ = Σⱼₖ conj(vⱼ)(g*g)ⱼₖwₖ = h(v,w)`, using `g*g = 1` only.
- **`spinFourCalibratedPair_vectorAction`.** It follows from the pinned `realSpinFourEquivQuaternionUnitaryProd_action` together with one quaternion identity. With `Ψ(v) = −v₂+v₁i−v₀j+v₃k` (`RealForm/Four.lean:282`) and `u = (1+j)/√2`, the identity is `u·conj(Ψ v)·u = −(v₀+v₁i+v₂j+v₃k)`.

**Repair.** Delete these declarations from `Suggested.lean`. The README keeps them as targets and conventions.

## R10 (P3) — Three wrong locators and a broken link

**Location and witness.**

| README line | Cited | Correct | Witness |
| --- | --- | --- | --- |
| 1246 | "HTT5.2.7.4" for "precomposition identifies functors out of the target with functors inverting the unit maps" | HTT Proposition 5.2.7.12, p. 368 | LurieHTT line 17500. 5.2.7.4 (LurieHTT line 17361, p. 365) only gives equivalent descriptions of a localization functor. |
| 1055 | "model recognition (HTTA.2.6.13)" | HTT Proposition A.2.6.15, p. 825 | A.2.6.13 is the example that isomorphisms form a perfect class (LurieHTT line 38362); the recognition theorem is at LurieHTT line 38368. |
| 1377 | "(HA4.8.1.10/13)" for the universal property of Ind(C)^⊗ | HA Corollary 4.8.1.14, p. 711, with its clause (2′) | 4.8.1.13 is the Day-convolution remark (LurieHA line 27099); 4.8.1.14 is at LurieHA line 27108. |
| 41 | `../SpinRepresentations/README.md` | `../RepresentationTheory/SpinRepresentations/README.md` | The roadmap lives at `TauCetiRoadmap/RepresentationTheory/SpinRepresentations` on main. |

**Repair.** Replace each locator and the link as shown.

## R11 (P3) — README and Lean disagree on this roadmap's names

**Location.** README backticked names of this roadmap's own that `Suggested.lean` does not declare, for example `stableBSpin`, `stableSpinClassifierEquiv`, `complexThomOrientation_to_HZ`, `muCoefficientZeroIso`, `quaternionicHopfSphereHomeomorph`, `realHilbertContinuousFunctionalCalculus`, `realMixedCliffordIndexClassification` and `torusFiniteFreeMappingEulerInterface`. Conversely, `Suggested.lean` line 514 declares `realizationProductKelleyComparison`, which the README no longer names.

**Claim.** A backticked name of this roadmap's own is a claim that `Suggested.lean` declares it, so about 50 claims are unmet. One Lean name has no README counterpart.

**Witness.** Of the 125 backticked identifiers in the README, 60 resolve nowhere: not in `Suggested.lean`, not at the Mathlib pin and not at the Tau Ceti pin. About 50 of these are this roadmap's own; the rest are the AlgebraicTopology names of R05.

**Repair.** Write these names in prose, or declare the few that a headline of R04 needs. Delete `realizationProductKelleyComparison` from the Lean file (R02).

## R12 (P3) — The README is not in TauCetiRoadmap form and fails the gate's style rules

**Location.**
- **Title.** The title is "# Generalized cohomology, spectra and orientations"; it has no "Roadmap:" prefix and is followed by no **Summary.** paragraph.
- **Sections.** "Scope and suppliers" is a table. There is no Exact supplier contracts section and no How to read the build section. Layers G1–G5 are numbered lists with no `### k.n` subsections, no `**Checks.**`, no `*Needs:*`, and no Examples or Dependencies sections. There is no Downstream consumers section.
- **Locators.** Most claims have none. For example, G3.1 Brown representability gives no locator at the claim; Hatcher 4E.2 and Cohen Theorem 10.3 apply.
- **Gate style hits:**
  - commit-pinned blob links at lines 39, 42, 3112, 3260 and 3262, plus Mathlib blob links at lines 823, 3110 and 3116;
  - `K\A`, `L\(A∩L)` read as LaTeX at line 3279;
  - pull-request numbers at lines 39 ("#279", "PR279"), 75, 241, 328, 2320 and 2487, and Mathlib PR numbers at lines 3507–3509;
  - process words at lines 49 ("current implementations"), 2728 ("currently") and 3528;
  - in `Suggested.lean`: "PR284-owned" (line 513) and "Delete this local specialization when…" (line 465).

**Claim.** The house shape and the gate's text rules are not met.

**Witness.** The gate's blob, latex, prnum and dropped sections, at the lines above.

**Repair.**
- **Restructure** into Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, and `## Layer k` sections with `### k.n` prose subsections. Give each definition an API list and at least three Checks. Give each claim a locator in parentheses, and end each layer with Examples and Dependencies.
- **Text fixes.**
  - Write the set differences as code spans with `∖`.
  - Replace blob links with relative links or roadmap and section names.
  - Delete pull-request numbers and process words.

## R13 (P3) — Import form of Suggested.lean

**Location.** `Suggested.lean` lines 1–29 contain 25 `import Mathlib.<submodule>` lines and no `import Mathlib`.

**Claim.** The rule is the single line `import Mathlib`, followed only by the `TauCeti.*` modules the file uses.

**Witness.** The gate's imports, mathlib-subimports and no-import-mathlib sections.

**Repair.** After R02–R04, the header is `import Mathlib` and `import TauCeti.AlgebraicTopology.Homotopy.Hurewicz.Basic`. That header elaborated in the probe.

## R14 (P3) — Edits outside the pull request's named folders

**Location.** `Completed/ArithmeticDirichletSeries/README.md` (2 lines) and `TauCetiRoadmap/SymplecticGeometry/README.md` (6 lines).

**Claim.** Neither folder is among the pull request's own folders.

**Witness.** `git diff --stat origin/main...HEAD` with the pull request's folders excluded lists exactly these two files.

**Repair.** Move the two edits to pull requests of their own, or name both folders among this pull request's folders.

## Verified sound

**Gate and build.**
- `lake env lean` on `Suggested.lean` runs in 77 s. It gives 25 "declaration uses `sorry`" warnings and no other warning or error.
- I compared the 11 entries that `signatures.md` flags against the README, using the `#check @name` signatures. Ten of the flags are artefacts of how instance binders such as `[Category* C]` are displayed. `realizationProductKelleyComparison` keeps `hk` as an explicit argument. The `[∀ n, (shiftFunctor C n).Additive]` binder really is absent from the sorry'd `coefficientDegreeEquiv` and `suspensionCohomologyEquiv`; this is moot once they are deleted (R02).
- The dependency check output is reproduced in R01. Main's copy of the README gives the same five lines.

**Ownership.** I read the open pull requests HigherToposTheory (#1901), StableHomotopyKTheory (#1227) and SpinGeometry (#1674) at their heads, and EnhancedDerivedSheaves on main; the overlaps file also flags #1330 and #1630 (EnhancedDerivedSheaves revisions). Findings R06 and R08 follow. BordismFormalGroups at this head consumes G2.11 with no copy of its own (its README lines 46, 128 and 198–201), so within this pull request the move has a single owner.

**Cross-roadmap citations resolved at this head.**
- **AlgebraicTopology.** Stage 4.4 (line 761), 4.5 (lines 139 and 788), 4.6 (line 1054), 4.8 (line 1122), 5.5 (lines 118 and 1280), 6.0 (line 1458), 6.4's pair-map zigzag `(K,∂K)→(U,U∖int K)←(U,U∖K)` (lines 2122–2126), 8.8c (line 2579), 8.8d (line 2653), 8.10 (line 2737) and 8.11b (line 2820).
- **ComplexKahlerGeometry.** K7.1 resolves at this head through its mapping line "`K7.1` → 7.1" (line 501).
- **SpinGeometry.** G1.3 exists on main (line 136) and at #1674 as "### 1.3 … (G1.3)" (line 253), with `cliffordScalarTrace_exists`.
- **TopologicalKTheory.** At this head it defines `stableOrientedGrassmannianWhitneySum` and `stableOrientedGrassmannianInverse`.
- **Others.** SelfAdjointSpectralTheory SA-D15–D17 (lines 1034–1038), GeometricTopology's "The smoothing-and-triangulation comparison" (line 930), CompactGroups Layer 0 (line 205), SmoothBundlesConnections B1.4 (line 31), and CharacteristicClasses C1.1b, C1.2a/b, C1.5 and C2.1, which are named in its README.

**Library declarations opened.**
- Tau Ceti: the declarations listed in R02 and R07, plus `HomotopyGroup.hurewiczHom` (`Hurewicz/Basic.lean:652`), `realCliffordFourZeroQuaternionEquiv` (`RealForm/Four.lean:279–299`) and the Taylor norm (`Analysis/Normed/Module/Complexification.lean:22–39`).
- Mathlib: `Matrix.specialOrthogonalGroup` (`LinearAlgebra/UnitaryGroup.lean:338`), `Topology.CWComplex` (`Topology/CWComplex/Classical/Basic.lean:135`) and `singularHomologyFunctor` (`AlgebraicTopology/SingularHomology/Basic.lean:52`).

**Sources: sample of 16 locators** (the seeded sample found no targets by heading, so I chose them).

Twelve locators are correct:
- **HTT.**
  - 1.2.4.3 (LurieHTT line 2066, with n ≥ 2 implied by "first edge"), 1.2.9.3 (line 2434), 2.1.3.4 (line 3469).
  - 2.2.1.2 (line 3814; the Quillen adjunction is the first clause, with Quillen equivalence when φ is an equivalence), 2.4.2.4 (line 5975), 2.4.6.1 (line 4643), 3.3.1.8 (line 9952).
  - 4.2.4.1 (line 12161), 4.2.4.3 (line 12172), 4.2.4.4 (line 12198; HTT states it for a small C-chunk U, and the README's chunk construction supplies one).
- **HA.** 4.1.8.4 (LurieHA line 18817), 4.3.3.17 (line 21223), 4.8.1.10 (line 27069), and 7.3.2.6/7.3.2.7 (lines 49435 and 49482).
- **HSS** Definition 5.6.1: F₁S¹ is not semistable (HSS lines 2904–2907).
- **Schwede, Symmetric spectra, Chapter I.** Example 1.17 (SchwedeSymSpec line 857), Example 1.18: Φ(R)_n = map(Sⁿ,R_n), with the imaginary circle as the loop coordinate (line 896), Example 1.20: Λ(A,U) (line 963).
- **Nikolaus–Scholze.** Theorem I.3.3, with the filtered formula `Map_(C/D)(X,Y)≃colim_(Z∈D/Y)Map_C(X,cofib(Z→Y))` matching README line 1329 (NikolausScholze line 827); Theorem I.3.6, the lax approximation `C/D→Ind(C)→Ind(E)→E` (line 976); Theorem A.7 (line 6370).
- **Textbooks.** Hatcher §4.E, Theorems 4E.1 and 4E.2 on connected based CW complexes (HatcherAT lines 19285 and 19338). Cohen, Chapter 10, Brown Theorems 10.3 and 10.12 (CohenBMH lines 108 and 10228). Miller, Chapter 1 §§2–5 and Chapter 2 §§1–2 (MillerCobordism contents, lines 18–33).

The three wrong locators are in R10.

### Adversarial table

| Statement | Instances tried | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| G2.9 GL_k(ℝ) table | k=0,1,2,3,4,5 | GL₀ trivial: all 0. SO(2)=S¹: π₁=ℤ, π₃=0. SO(3)=ℝP³: π₁=ℤ/2, π₃=ℤ. SO(4)=(S³×S³)/±1: π₃=ℤ². k≥5: π₃=ℤ. | holds | none |
| G2.9 action of r_k | k=2; k=4; odd k | k=2: conjugation by a reflection inverts a rotation, so negation. k=4: r₄ = −(quaternion conjugation), and conj∘(v↦q_L v q_R⁻¹)∘conj = (v↦q_R v q_L⁻¹), so swap. Odd k: r_k = −(element of SO(k)), so inner, so trivial. | holds | none |
| G2.9 stabilization on π₃ | generators L=(q,1), R=(1,q) | SO(3)→SO(4): q↦(q,q) = L+R, diagonal. The clutching map of TS⁴ is v↦uvu = (u,u⁻¹) = L−R, which generates the kernel, so SO(4)→SO(5) is a+b. The composite is ×2, matching index 2. | holds | none |
| G2.9 S⁰ and S¹ | k≥1 | [S⁰,GL_k] = (ℤ/2)², 4 classes. Rank-k bundles over S¹: 2. | holds | none |
| G2.5 Freudenthal | k=1; k=2 with X=S² | k=1: π₁X→π₂ΣX = π₁X^ab, onto. k=2: π₂S²→π₃S³ is ℤ≅ℤ, and π₃S²=ℤ→π₄S³=ℤ/2 is onto. | holds | none |
| G2.5 homotopy excision | X=S², k=2 | Two 2-connected maps give a 3-cartesian square, so X→ΩΣX is 3-connected; π₃: ℤ→ℤ/2 is onto. | holds | none |
| G5.6 rational Hurewicz | X=S², k=2 | i=2: ℚ = H₂. i=3: π₃S²⊗ℚ=ℚ → H₃=0 is onto but not injective, so the range is sharp. | holds | none |
| G5.6 rational stable stems | n=0,1,3 | n=0: ℚ. n=1: ℤ/2⊗ℚ=0. n=3: ℤ/24⊗ℚ=0. Probe n=1, j=0: π₄S³=ℤ/2. | holds | statement proposed (R04) |
| Conventions `Eⁿ(*)=π_(−n)E` | E=KU, KO, n=−2, 4 | KU^{−2}(*) = π₂KU = ℤ. KO⁴(*) = π₋₄KO = KO₄ = ℤ. | holds | none |
| G1.7, S¹ | E=HZ | H⁰=ℤ, H¹=ℤ. σ² ∈ H²(S¹)=0. Odd degree gives only 2σ²=0. | holds | none |
| G3.4, MV sign | overlap i even / odd | even: a_i−f*a_{i+1}. odd: f*a_{i+1}−a_i = −(…), so (−1)^i, and ε turns this into 1−shift. | holds | none |
| G3.6 phantom | S_ℚ → ΣHZ | [S,ΣHZ] = 0. lim¹(ℤ←×2 ℤ←×3 ⋯) = Ext¹(ℚ,ℤ) ≠ 0. A preimage of (1,1,…) needs a₁ ≡ Σ_{j<N} j! mod N!, with 0 < Σ_{j<N} j! < N!, which is unbounded, so there is no integer. | holds | none |
| G3.9 completion sequence | E=S, n=0; E=HQ | S: Ext(ℤ/p^∞,ℤ) = ℤ_p, so π₀ = ℤ_p. HQ: Ext = Hom = 0, so HQ^∧_p ≃ 0, while ℚ⊗ℤ_p = ℚ_p ≠ 0. This confirms that the tensor formula needs finite generation. | holds | none |
| G3.8 `connectiveSpectrumMapsToHA` | V=S; V=Σ⁻¹S | S: π₀Map = A and π_{i>0} = 0, discrete, as claimed. Σ⁻¹S: Hom(π₀V,A) = 0 but π₁Map = A, so connectivity is required. | holds | none |
| G3.8 P0 cells | k−m = 1, 2 | Stable dimension 2 kills π₁ and keeps π₀. Dimension 1 would alter π₀, and is excluded. | holds | none |
| G4.5 projective relation | r=1; ℂP¹ | x−a₁ = 0 with x = c₁(V*) = −c₁(V), so a_i = (−1)^i c_i. x pairs to +1 on ℂP¹ and c₁(γ) = −h. | holds | none |
| G4.5 quaternionic classes | rank 1 | p₁ = c₁²−2c₂ = −2c₂. e^std = (−1)^r c_{2r}, since the bases (1,i,j,k) and (1,i,j,−k) differ per block. p₁ = 2e^std. | holds | none |
| G4.5 BSp torus restriction | r=1, 2 | c(Cξ\|T) = Π(1−x_j²), so a_i = (−1)^i e_i(x²); a₁ = −x₁². | holds | none |
| G5.4 KSp forgetting | [ℍ] = ab⁻¹ | real: a²b⁻¹ = 4. complex: 2u²·u⁻⁴·u² = 2. | holds | none |
| G5.5 π₀K_op,n | n=1, 4 | KO¹(*) = KO₇ = 0. KO⁴(*) = KO₄ = ℤ. | holds under the README's convention | sign of Cl convention: Not verifiable |
| G5.5 Cl(n,0)⁰ ≃ Cl(0,n)⁰ | e_ie_j ↦ −f_if_j | Both squares are −1. (−f_if_j)(−f_jf_k) = −f_if_k, the image of e_ie_k. | holds | none |
| G5.4 Pin⁺ | Q(v)=1 | star(ιv)ιv = −Q(v) = −1 ≠ 1, so not native-unitary. | holds | none |
| G5.5-ABS x = e₃e₇⋯ | v=e, v⊥e | −eve: e ↦ −e and v ↦ v, so the product is diag(1,1,1,−1)^r = F_r. | holds | none |
| Block signs | transpose of m×n; ε_r; (−1)^{p′q} | m=2, n=2: −1. m=3: (−1)^{C(n,2)}. m=4: +1. ε₂ = ε₁ε₁(−1) = −1. Cl(1,1)⊗Cl(1,1): −1. | holds | none |
| G5.5 Hilbert and Taylor norms | x=e₁,y=e₂; x=y=e₁ | ‖·‖_H = √2 and ‖·‖_T = 1 (right bound sharp). ‖·‖_H = √2 and ‖·‖_T = √2 (left bound sharp). | holds | none |
| G5.5 Hermite normalization | j=0, 1 | ∫h₀² = π^{−1/2}·√π = 1. ∫h₁² = π^{−1/2}·2·(√π/2) = 1. | holds | none |
| G4.0 Sp dimensions | N=1, r=1; N=2, r=1 | Sp(1) = S³: 3. HP¹: 4r(N−r) = 4. Lie model: 3N + 2N(N−1) = 3 at N=1. | holds | none |
| Lean `spinFourCalibratedPair_vectorAction` | Tau Ceti Ψ | u·conj(Ψv)·u = −Φ(v), which gives q_L = un₂u*, q_R = u*n₁u. | true | padding (R09) |
| Lean `quaternionFrameAction_preserves` | general g | Σ conj(v_j)(g*g)_{jk}w_k = h(v,w) | true | padding (R09) |
| Lean `pointedSSetMonoidal`, `coefficientDegreeEquiv` | the cartesian structure; negation∘iso | both inhabit the sorry'd types | vacuous | R02 |
| HTT 5.2.7.4, A.2.6.13; HA 4.8.1.13 | text at locator | characterization / example / remark against the README's claim | wrong locator | R10 |

## Not verifiable

- **The K_op,n Clifford sign convention** (positive generators giving KO^n, negative giving KO^{−n}, G5.5). Joachim's KO paper is settled as uncertified. The passage of Hebestreit–Sagave §7 that I read (HebestreitSagave line 1340) writes `Cl_n` without fixing the sign of the generators.
- **Adams, Stable Homotopy and Generalised Homology, Part III.** It is not in the manifest and has no legal open copy, so it was not read.
- **Joachim, Higher coherences for equivariant K-theory, §6.** It is not in the cache.
- **Settled as uncertified** (cited only at section level): McDuff–Segal, Segal (Categories and cohomology theories), Atiyah–Bott–Shapiro and Quillen.

## Source issues

- none
