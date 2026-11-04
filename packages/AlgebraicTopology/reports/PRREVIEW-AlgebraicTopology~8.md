# Review of AlgebraicTopology (pull request #1652 at f285cc1)

**Verdict:** accepted

No P1 or P2 finding. The gate passes at this head, the dependency check shows no UPWARD or CYCLE line, and the adversarial table below records computed values for the sampled targets, every admitted headline and every target a finding touches. The four findings are P3 and are the author's to take or leave.

## R01 (P3) — Hatcher Theorem 3.11 is on p.210, not p.215

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:986`: “the ordered-product interchange sign (Theorem 3.11, p.215)”.

**Claim:** The graded-commutativity theorem used for the factor-interchange degree (−1)^(mn) is on p.215.

**Witness:** In the cached Hatcher text (hatcher-at, line 9099) Theorem 3.11 sits on PDF page 219; the book's printed page is PDF page minus 9 throughout (Theorem 2.44 at PDF 155 = p.146, Example 3.16 at PDF 225 = p.216), so Theorem 3.11 is printed p.210.

**Repair:** Replace “p.215” by “p.210” at line 986. Every other Hatcher locator in the sampled targets agrees with the +9 offset (see Verified sound).

## R02 (P3) — Say what AlgebraicTopology owns, not what HomotopySpheres currently does

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:121`–`:124`: “HomotopySpheres §3A.1 and the foundation-only suspension–loop portion of §3A.2 use this foundation”; `:3243`–`:3245` repeats it; `:3341`–`:3344` (Worked examples): “The tower difference map, six-term sequence, Mittag–Leffler vanishing, integer-graded Milnor sequences and cofinal shifts satisfy their naturality diagrams. The derived-limit cone compares…”.

**Claim:** The first passages describe HomotopySpheres as already consuming Layer 4.0; the worked-example bullet describes the generic tower algebra as this roadmap's deliverable.

**Witness:** At its open head, `TauCetiRoadmap/HomotopySpheres/README.md:663`–`:676` (§3A.1, *Needs:* native topology only) still packages `TopologicalSpace.compactlyGenerated` as the right adjoint, proves the exponential law and the CW comparisons, and `:678`–`:700` (§3A.2) proves the suspension–loop adjunction itself. The tower bullet restates what Scope `:128`–`:133` and the supplier contract `:352`–`:363` now assign to DerivedModuleAlgebra §§1.T.1 and 1.1.

**Repair:** The ownership decision itself is right and is recorded below as the move of this notion into Layer 4.0 (HomotopySpheres consumes AlgebraicTopology Stages 4.5 and 8 at `:680`, `:737`, `:812`, so AlgebraicTopology cannot cite HomotopySpheres §3A.1 without a cycle; the duplicate construction is HomotopySpheres' repair, not this roadmap's). Reword `:121`–`:124` to a statement about this roadmap: “Layer 4.0 is the single owner of the compact-generation coreflection, convenient products, exponentials, CW comparisons and the foundational pointed suspension–loop adjunction; HomotopySpheres' pointed cones, Puppe sequences and stabilization are consumers of this foundation and of this roadmap's cofibration and relative-homotopy results.” Do the same at `:3243`. Rewrite the worked-example bullet at `:3341` as the adapter statement: the singular and cellular restriction towers have degreewise surjective restriction, their limits are the cochains of the whole pair, and the imported Milnor maps and homotopy-square comparisons transport along the cellular/singular comparison with their chosen homotopies. The tested values are unchanged: on the point tower δ(3,1,0,…) = (2,1,0,…) and lim¹ = 0; on the one-vertex circle the degree-one limit is M and H¹(S¹;M) = M.

## R03 (P3) — `finiteSourceMappingCWType` does not need `[T2Space Y]`

**Location:** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean:308`–`:310` and `README.md:3010`: “for compact Hausdorff X and Hausdorff Y equipped with a `CWTypeModel`”.

**Claim:** Hausdorffness of the target is a hypothesis of the mapping-space CW-type theorem.

**Witness:** `modelY` already supplies a homotopy equivalence e : Y ≃ K with K a Hausdorff CW complex (`CWTypeModel.hausdorff`, `Suggested.lean:212`). Postcomposition f ↦ e∘f and g ↦ e⁻¹∘g are continuous on compact-open spaces for any Y, and the homotopy H : e⁻¹∘e ≃ id_Y induces C(X,Y) × I → C(X,Y), (f,t) ↦ H_t∘f, continuous as the adjoint of (f,t,x) ↦ H(t,f(x)), which needs only continuity of evaluation C(X,Y) × X → Y, available for compact Hausdorff X (Hatcher A.14, p.530). So C(X,Y) ≃ C(X,K) and Milnor Theorem 3 (milnor-cw line 209, printed p.276) applies to K. For Y the Sierpiński space the statement holds with K a point.

**Repair:** Drop `[T2Space Y]` from the theorem and “Hausdorff Y” from `README.md:3010`; keep `[T2Space X]` with the reason the docstring already gives. No other declaration changes.

## R04 (P3) — Name the carriers two consumers cite by deleted Lean names

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:3251`–`:3270` (“The objects consumers cite are carried by the following sections”).

**Claim:** The list covers the objects consumers cite.

**Witness:** On main, `TauCetiRoadmap/GeneralizedCohomology/README.md:229`–`:239` cites `simplicialRealizationCW`, `simplicialGroupKan`, `simplicialGroupMooreHomotopyIso`, `kanRealizationUnitHomotopyIso`, `ordinaryEMRepresentability` and `ordinaryEMLoopComparison`; `TauCetiRoadmap/HeegaardFloer/README.md:586` cites `compactTriadPoincareLefschetz`; `TauCetiRoadmap/MorseTheory/README.md:483` cites `normalizedLSCategory`. None is declared in this head's `Suggested.lean` (correctly, since it states headlines only), and the list names MorseTheory's §6.2 carriers but not the GeneralizedCohomology or HeegaardFloer ones.

**Repair:** Add two bullets: “GeneralizedCohomology (G2.1) consumes §4.7's realization CW structure, §8.2's Kan/Moore/realization-unit comparisons, §8.10's representability and §8.11b's loop comparison” and “HeegaardFloer consumes §6.4's compact-triad Poincaré–Lefschetz theorem”. The consumer READMEs then repoint their Lean-name citations to these sections; that is their edit, not this pull request's.

## Verified sound

**Scope of this round.** This is a full review of the repaired head: the folder changed by 357 lines since bdd456c. I read the whole README (3392 lines) and `Suggested.lean` (369 lines), checked the four r7 findings passage by passage, verified the fifteen seeded targets against the cached texts, elaborated a probe copy, grepped the pins for every cited declaration, resolved every supplier and consumer citation on main or at the named open head, and ran the dependency check.

**Previous findings, checked against this head.**

| r7 finding | Passage now and result |
|---|---|
| R01 (P2), compact generation has two owners | Resolved by moving ownership, not by consuming HomotopySpheres. `README.md:119`–`:127` makes Layer 4.0 the owner; `:215`–`:224` names the pinned carriers (`CompactlyGenerated`, `compactlyGeneratedToTop`, `fullyFaithfulCompactlyGeneratedToTop`, `TopologicalSpace.compactlyGenerated`, `eq_compactlyGenerated`, `continuous_from_compactlyGenerated`, `continuous_from_uCompactlyGeneratedSpace`, all present at the Mathlib pin); `:778`–`:828` builds the coreflection and adjunction with seven Checks. The r7 repair (cite HomotopySpheres §3A.1) is not available: HomotopySpheres at its head consumes AlgebraicTopology Stage 4.5 and Stage 8 (`HomotopySpheres/README.md:680`, `:737`, `:812`, `:933`), and main's AlgebraicTopology (`TauCetiRoadmap/AlgebraicTopology/README.md:116`–`:121`, `:567`, `:768`) cited HomotopySpheres §3A.1 in return, a roadmap-level cycle. The notion therefore moves into this roadmap; recorded here as that move. Residual wording is R02. |
| R02 (P2), module-tower foundation duplicated | Repaired. `towerDifference` and both surjectivity theorems are gone from `Suggested.lean`; `README.md:352`–`:363` imports DerivedModuleAlgebra §1.T.1 (on main, `TauCetiRoadmap/DerivedModuleAlgebra/README.md:1403`–`:1424`: δ(x)_n = x_n − φ_n(x_(n+1)), lim, lim¹, six-term sequence, Milnor; `:1419` names AlgebraicTopology as the consumer and assigns the topological adapters to it) and §1.1 (`:1573`–`:1620`: product-cone model, cofinal shifts, `derivedLimit_homotopySquare` with specified homotopies, integer-graded chain version with left term lim¹ H_(j+1) and the possible degree −1). `README.md:1536`–`:1588` now states only the singular/cellular restriction-tower adapters. The module docstring `:27`–`:30` says the topological Milnor comparison is not statable and states nothing in its place. |
| R03 (P3), locators | Repaired. `:2019` cites DifferentialGeometry §5.1 (on main, `TauCetiRoadmap/DifferentialGeometry/README.md:508`–`:509`, `boundaryOrientation`) with §§2.5, 4.6, 6.3; `:2371`–`:2375` cites Theorem 2.44, p.146 and §2.2 Exercise 20, p.157 (hatcher-at lines 6380, 6854, both verified); `:2377`–`:2386` derives the bundle formula from §5.5's rational Serre sequence; `:2889`–`:2896` and `:3228` cite Vector Bundles §3.3, pp.99–102, Lemma 3.18, Proposition 3.19 and separate the untwisted source from the local-system extension. |
| R04 (P3), end Checks | Repaired. `:2669`–`:2686` give ℝ, ℝ², ℝ³ with ends 2, 1, 1; connectedness at infinity false, true, true; simple connectivity at infinity true, false, true; stable end groups (0,0), ℤ, 0, with the winding-1 circle outside L in ℝ²∖K as the obstruction and π₁(S²) = 0 for ℝ³. |

No repair report marks any finding “not actionable in this package”.

**Gate, dependency check, elaboration, padding.** The worker's gate at f285cc1 reports every counter zero and `OK` (build, stray-files, outside-folder, sorry-data, set_option, imports, readme-ids-missing included); `git diff --stat origin/main...HEAD` outside the folder is empty. The requested dependency command returned

```text
depcheck: 205 roadmaps, 1665 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line. A probe copy of `Suggested.lean` in my scratch directory, with every `sorry` replaced by `first | rfl | (simp; done) | infer_instance | decide | trivial | sorry` and `#check @name` for all 31 declarations, was elaborated with `lake env lean` from the pull-request checkout: all 18 admitted theorems still report `declaration uses 'sorry'`, so none closes by one tactic; the 31 elaborated types agree with the worker's `signatures.md` and with the README statements, and no section binder is lost (each instance argument occurs in its type). The probe's `#check`s of `compactlyGeneratedToTop`, `fullyFaithfulCompactlyGeneratedToTop`, `TopologicalSpace.compactlyGenerated`, `eq_compactlyGenerated`, `continuous_from_compactlyGenerated`, `continuous_from_uCompactlyGeneratedSpace`, `TauCeti.cellularSingularHomologyIso`, `TopCat.singularCap`, `TauCeti.IsEilenbergMacLaneSpaceOne`, `IsCoveringMap`, `isClosed_fixedPoints`, `LocallyContractibleSpace`, `ContinuousMap.Nullhomotopic`, `gauge`, `intrinsicInterior`, `ModelWithCorners.isClosed_boundary`, `SingleObj.comp_as_mul`, `Functor.IsMittagLeffler`, `HomologicalComplex.extend`, `sSetTopAdj`, `TopCat.sphere`, `TopCat.disk`, `TauCeti.cellularChainGroupIso`, `TauCeti.cellularDifferential`, `singularHomologyInclIso_hom_app` and `pullbackConstantIso` all elaborate. Names in Tau Ceti modules the file does not import were checked by grep at the pin instead (table below). No library-candidate one-lemma proof was found for any headline: finite-dimensional `cellularSingularHomologyIso` does not give the arbitrary-dimension comparison, `finsum_finrank_singularHomology_of_finite_cwComplex` is not homotopy/product/cover multiplicativity, and the model-category Whitehead needs cofibrant–fibrant objects.

**Lean form.** Single `import Mathlib` plus five existing `TauCeti.*` modules; one module docstring naming the non-statable headlines and what each lacks; `namespace TauCetiRoadmap.AlgebraicTopology`; layer section comments in README order; `theorem` throughout; no `set_option`, `lemma`, `#eval`, `#print axioms`, `True` placeholder or sorried data (`cupProduct`, `lsCategoryCount`, `lsCupLength`, `finiteCWEulerCharacteristic`, `groupClassifyingSpaceBasepoint`, `HasProperHomotopyInverse`, `HasProperHomotopyExtensionProperty` all have real bodies on native carriers). Every backticked own name in the README is declared (gate `readme-ids-missing=0`); no other roadmap's `Suggested.lean` on main or at the listed heads uses this namespace.

**Headline coverage.** README headlines: Brouwer (2.7), arbitrary-dimensional cellular comparison (4.3), transfer and Cartan–Leray (5.3), Wang and Künneth (5.1–5.2), Serre and cover descent (5.5, 5.7), the restriction-tower Milnor comparison (6.0), the LS bound (6.2), orientation and Poincaré–Lefschetz duality (6.3–6.4), linking (6.5), Euler invariance (7.2–7.3), Hurewicz (8.3–8.4), Whitehead and proper Whitehead (8.5), manifold CW type and homology-sphere recognition (8.7), nonabelian classifying spaces (8.8), obstruction theory (8.9), representability and EM loops (8.10–8.11). Stated: Brouwer, cellular comparison, transfer existence, LS bound, characteristic-two closed duality, four Euler statements, four Whitehead statements, two manifold CW-type statements, the recognition corollary, mapping-space CW type, K(G,1), proper strong deformation retraction. Named as not statable with the missing carrier: twisted/boundary/integral duality (orientation system, twisted cap), absolute and relative Hurewicz (no Hurewicz map or relative homotopy carrier), the Milnor comparison (restriction-tower adapter and derived-limit carrier), representability and EM loops (normalized EM family), obstruction criteria (cellular obstruction cochains), proper Whitehead (supported comparison), boundary-pair and marked-point CW type, countable locally finite CW type. I found no statable headline absent and none forced through a stand-in; the characteristic-two duality is a genuine special case stated on native carriers, not a substitute, and the docstring says so.

**Pinned declarations opened.** Mathlib pin `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` (the checkout's `lake-manifest.json`).

| Pin and file:line | What it says and what it does not include |
|---|---|
| Tau Ceti `TauCeti/AlgebraicTopology/Cohomology/Cap/Basic.lean:101`–`:106` | `singularCap X k u μ p q n h : H^p(X;R,M) →ₗ (H_n(X;T) ⟶ H_q(X;P))` with `h : p + q = n`, `u : T ⟶ R ⊗ S`, `μ : M ⊗ S ⟶ P`. With both unitor maps of `ModuleCat.of R R` every slot is the ring, so the Lean cap is H^p(M;R) → Hom(H_n(M;R), H_q(M;R)) evaluated at μ, as 6.4 states. |
| Mathlib `Mathlib/Topology/Covering/Basic.lean:39`–`:41`, `:287` | `IsEvenlyCovered` is discreteness of the fibre plus a local trivialization; `IsCoveringMap` is evenly covered at every point, with no surjectivity. Zero-sheet covers are covering maps, as 5.3 and the Euler cover theorem assume. |
| Tau Ceti `TauCeti/AlgebraicTopology/Cellular/Chains.lean:364`; `Cellular/Map.lean:77` | `cellularChainComplex C R` is `ChainComplex.of` cellular groups and differentials; `complexBasePair` is the pair (space, base) of a relative CW complex. The headline compares its homology with relative singular homology of that pair. |
| Tau Ceti `TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean:123`–`:125` | `IsEilenbergMacLaneSpaceOne G X x := IsAspherical X x ∧ Nonempty (FundamentalGroup X x ≃* G)`; no abelian hypothesis, so the nonabelian S₃ Check is in scope. |
| Tau Ceti `TauCeti/Topology/Homotopy/HomotopyGroup/Map.lean:36`, `:119` | `HomotopyGroup.map f hf` needs `hf : f x = y`, which `rfl` discharges in `ordinaryWhitehead` because the target point is `f x`. |
| Mathlib `Mathlib/Topology/Category/CompactlyGenerated.lean:32`, `:77`, `:81`; `Mathlib/Topology/Compactness/CompactlyGeneratedSpace.lean:71`, `:90`, `:134` | The structure, the inclusion functor and its full faithfulness; the continuity criterion from compact Hausdorff tests and the `UCompactlyGeneratedSpace` class. No right adjoint, counit, exponential law or separation axiom at the pin: Layer 4.0's targets are genuine. |
| Mathlib `Mathlib/Topology/Homotopy/LocallyContractible.lean:81` | `LocallyContractibleSpace` is a `def` (Prop): every neighborhood contains one whose inclusion is nullhomotopic, exactly the weaker sense 6.2 insists on. |
| Tau Ceti `TauCeti/AlgebraicTopology/LocalCoefficient.lean:43` | `LocalCoefficientSystem R X` is an abbreviation for a functor on the fundamental groupoid for a ring R, as 2.6 and 6.1 use it. |
| Tau Ceti (grep at the pin) | `cast_map_prod_mul` and the commutative-group instance in `FundamentalGroup/TopologicalMonoid.lean`; `IsLocallyCollared.isCollared` in `Geometry/Manifold/Boundary/Collar/Brown.lean`; `pathLoopSpaceMulEquiv`, `zerothHomotopyLoopSpaceEquivFundamentalGroup` in `Topology/Homotopy/HomotopyGroup/LoopSpace.lean`; `AddCircle.isEilenbergMacLaneSpaceOne` in `UniversalCover/Circle/EilenbergMacLane.lean`; `exists_strong_deformation_retraction` in `Extension/DeformationRetract.lean`; `hasHomotopyExtensionProperty_range_incl` in `Extension/MappingCylinder.lean`; `hasHomotopyExtensionProperty_base` in `Extension/CWComplex.lean`; `TopPairing.cup` and `nonempty_continuousCohomology_addEquiv_groupCohomology` in `RepresentationTheory/Homological/ContCohomology/`; `eilenbergZilberHomotopyEquiv` in `Singular/EilenbergZilber.lean`; `cechDiagram`, `isColimitCechCocone` in `FundamentalGroupoid/Cech/`; `twistedCochainComplex` in `Cohomology/Twisted/Basic.lean` and `Relative.lean`; `twistedHomologyMap` in `Singular/Twisted/Functoriality.lean`; `reducedSingularHomologySphereZeroIso_inv_ι` and `reducedSingularHomologySphereIso` in `Singular/Sphere.lean`; `singularHomologyDiskBoundaryPairIso`, `contractibleSpace_disk` in `Singular/DiskSphere.lean`; `diskBoundaryHomeomorph` in `Disk.lean`; `HomotopyGroup.prodEquiv` in `Topology/Homotopy/HomotopyGroup/Product.lean`; `excisionMap` in `Singular/Excision.lean`; `mayerVietoris_exact` in `Singular/MayerVietoris/Basic.lean`; `isZero_reducedSingularHomologyFunctor_of_contractibleSpace` in `Singular/Contractible.lean`; `finsum_finrank_singularHomology_of_finite_cwComplex` in `Cellular/EulerCharacteristic/Singular.lean`. Mathlib: `embeddingUpIntGE`, `embeddingDownNat` in `Algebra/Homology/Embedding/Basic.lean`; `isQuotientCoveringMap_iff_isCoveringMap_and` in `Topology/Covering/Quotient.lean`; `normalizedMooreComplex` in `AlgebraicTopology/DoldKan/Normalized.lean`; `intrinsicInterior` in `Analysis/Convex/Intrinsic.lean`; `gauge` in `Analysis/Convex/Gauge.lean`; `isClosed_fixedPoints` in `Dynamics/FixedPoints/Topology.lean`. Every README library name checked exists at its pin. |

**Ownership and supply.** Suppliers resolved on main: DerivedModuleAlgebra §§1.T.1/1.1 (above); GeneralizedCohomology G2.1 `realizationProductKelleyComparison` (`GeneralizedCohomology/README.md:234`); DGFloer Layer 1 items 1–4 and Layer 2 item 3 (`DGFloer/README.md:453`, `:461`, `:612`, `:650` with the EM family at `:664`–`:690`, `:882`; the Serre-fibration disc/cube vocabulary at `:449` and `arbitraryBaseSerreSpectralSequence` at `:533`); ClassifyingSpaces Stage 3 items 11–15 and Stage 4 items 16–18 (`ClassifyingSpaces/README.md:179`–`:243`); CharacteristicClasses C1.2a S0–S5 (`CharacteristicClasses/README.md:333`–`:343`), C3 (`:720`); TopologicalKTheory T1.6 and T7.0 (`TopologicalKTheory/README.md:26`, `:1150`); ComplexKahlerGeometry K7.1 (`ComplexKahlerGeometry/README.md:1405`–`:1407`); GeometricTopology smoothing-and-triangulation comparison (`GeometricTopology/README.md:270`, `:930`); DifferentialGeometry Layer 2 `orientationAt` (`DifferentialGeometry/README.md:349`), §5.1 `boundaryOrientation` (`:508`–`:509`), 9.3 `poincareDuality` as consumer (`:872`), 10.5 (`:143`); UniversalCovers in `Completed/`. Consumers resolved: BanachAlgebras A8 (`:1116`–`:1155`, finite-span Brouwer), MorseTheory M2/M4/M5 (`:124`, `:458`–`:492`, `:611`), AffineMorseLefschetz A4.0 (`:208`–`:210`), RiemannianGeometry R3 (`:347`, `:177` Freudenthal), FuchsianOrbifolds Layer 5 (`:81`, `:311`), SmoothBundlesConnections B6.1 (`:1375`), ComplexManifolds Milestones 1–3 (`:172`–`:221`), HeegaardFloer (`:586`–`:595`), and AlgebraicTopologyPartII at its head, whose Scope (`:11`) consumes Stages 2–8 and plans configuration cohomology, not these objects. HomotopySpheres, FourManifolds and ImplicitAtlases are open pull requests, not on main; they are cited only as consumers or scope deferrals, never in a `*Needs:*` line or supplier table, which the dependency check confirms. Ownership against the open roadmap pull requests the brief lists was checked by object for compact generation, module towers, Čech refinements, the LS bound, duality and classifying spaces: TopologicalSheafCohomology §§1.1–1.2 (main, 227 lines) owns raw Čech refinements as Scope `:134` says; no second owner of the restriction-tower adapters, the LS carriers or the characteristic-two duality was found; the one duplicate is HomotopySpheres §3A.1–3A.2 (R02), whose correct direction is recorded above. Packages on the board (AnalyticNumberTheory, AutomorphicCongruences, KatoEulerSystems, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory) are unrelated by subject.

**Seeded source audit.** Texts read from the worker's cache: hatcher-at (`pi.math.cornell.edu` AT.pdf; printed page = PDF page − 9), hatcher-vb (VB.pdf), milnor-cw (Edinburgh author-page copy, OCR; printed = PDF + 270), ftw (Numdam; printed = PDF − 1), cfh (Int. Press open full text; printed = PDF + 492), brown-groupoids (author page; printed = PDF − 25), strom (course copy). No passage is copied.

| Target | Locator and text checked | Assessment |
|---|---|---|
| 1.5 | Native wedge/circle groupoid calculations; Brown 6.7.2 (brown line 9424, p.240) and 3.6.4 (line 3995, p.91); Hatcher 1.20 (hatcher-at line 1956, p.43) | Locators correct; the pinned `WedgeSum` and `Circle` modules exist. |
| 2.5 | Hatcher 3B.1 (line 11612, pp.269–270), 3B.6 (line 11898, p.275, product formula continuing on p.276), 3.27 (line 10255, p.236) | Correct; the cube/sup-ball/disk formulas are the roadmap's own constructions, as it says. |
| 3.2 | Hatcher 2.21 (line 5222, pp.119–120) | Correct; small-chain inclusion is a chain-homotopy equivalence. |
| 3.5 | Hatcher Example 2.46 (line 6570, p.150) | Correct; hemispheres and the top-degree connecting isomorphism. |
| 4.0 | Hatcher A.14–A.16 (lines 23034–23067, pp.530–531), Appendix pp.523–524, Theorem A.6 (line 22693, p.524) | Correct; A.15 needs compactly generated Hausdorff X and locally compact Y, A.16 Hausdorff factors, as the README retains. |
| 4.2 | Cellular boundary formula (line 6086, p.140), Lemma 2.34 (line 5963, p.137) | Correct. |
| 4.4 | Hatcher 2.22 (line 5456, p.124), 3B.1 (p.269), **3.11 (line 9099, PDF 219 = p.210, README says p.215: R01)** | One page slip; the statements support the quotient comparison and the (−1)^(mn) interchange. |
| 5.1 | Hatcher 3B.5 (line 11810, p.274), 3B.6 (p.275) | Correct for the PID statement; the hereditary/general-ring forms cite Weibel, unreadable (Not verifiable). |
| 5.4 | Hatcher 3B.6 (p.275), Example 3.16 (line 9388, p.216) | Correct. |
| 6.0 | Hatcher A.1 (line 22534, p.520), Theorem 3.5 (line 8799, p.203); DerivedModuleAlgebra `:1542`–`:1560` Milnor sequence for degreewise surjective towers | Correct; the supplier's hypothesis (degreewise surjective transitions) is what extension by zero provides. |
| 6.4 | Hatcher p.235 (lines 10227–10229: nonorientable M is R-orientable iff R has a unit of order 2, iff 2 = 0), 3.26 (line 10237, p.236), 3.30 (line 10453, p.241), 3.43 (line 10976, p.254, five-lemma route) | Correct; the Lean hypothesis `(2 : R) = 0` is exactly the source's condition. |
| 6.5 | Hatcher §3.E (p.303), 3.2 (line 8476, p.195), 3.30; cfh Prop 1.2 (line 58, p.494), Lemma 2.5 (line 348, p.502), Lemma 2.6 (lines 398–451, pp.503–504), (2.2) (line 240, p.499) | Correct, and the sign chain reproduces the source: Lemma 2.6 gives ⟨u∪β⟩ = (−1)^a⟨α∪v⟩, (2.2) gives (−1)^(a(b−1)), product (−1)^(ab); for a = b = n+1 this is CFH Prop 1.1's “symmetric iff n odd”. |
| 7.2 | Hatcher 2.44 (line 6380, p.146), §2.2 Exercise 20 (line 6854, p.157) | Correct; the bundle formula is derived here from §5.5, not attributed to the exercise. |
| 8.4 | Hatcher 4.32 (lines 15961–15963, p.366) | Correct: the theorem's second sentence is the relative form with A simply connected and nonempty; the more general 4.37 (p.371) is not needed. |
| 8.10 | Hatcher §4.3, Theorem 4.57 (line 17069, p.393) | The README cites §4.3 without the theorem number; adding “Theorem 4.57, p.393” would be tidier but the section citation is accurate. |

Also checked: Milnor Theorem 2 (milnor-cw line 103, p.273), Theorem 3 and Corollary 3 (lines 209, 218, p.276); FTW Theorem 4.2 (ftw line 600, p.17), Lemma 4.3 (line 610, p.17), Corollary 4.9 (line 752, p.21); Hatcher 2.10 (p.111), 2.15 (p.114), 2.25 (p.126), 0.16–0.19 (pp.15–16), 3.29 (p.239), 4.8 (p.349), 4.12 (p.351), 4.33 (p.367), 4.48 (p.379), A.3 (p.522), A.11 (p.528), §3.C (p.281), §3.G (p.321), 4A.3 (p.422), Exercises 21–22 (p.157): all at the stated printed pages.

**Adversarial computations.** One row per statement; 0 denotes the trivial group or module; “retain” means no change on that test.

| Statement | Instances tried | Values on the two sides / discriminating value | Result; change |
|---|---|---|---|
| 1.5 wedge values | 0, 1, 2 circles | Free groups 1, ℤ, F₂; wedge of 0 circles is the point | Retain |
| 1.5 two-arc circle | Intersection two arcs vs one arc | Groupoid colimit gives ℤ; collapsing the intersection to one component gives 0 | Retain multiple basepoints |
| 1.6 pointwise product | U(1), windings m, n; squaring map | m+n; 2(m+n) = 2m+2n, a one-factor map gives 2m+n | Retain |
| 2.5 interval class | t ↦ t and t ↦ 1−t | ∂ = [1]−[0] and [0]−[1] | Retain |
| 2.5 square class | (1,2)-shuffle minus (2,1)-shuffle | Boundary right−left−top+bottom; unsigned sum not a cycle | Retain sign |
| 2.5 radial map | x = (1,1), x = 0 | ‖x‖∞/‖x‖₂·x = (1/√2,1/√2) of norm 1; 0 ↦ 0 | Retain zero branch |
| 2.5 S⁰ reference | s₀ = [q]−[−q] vs [q]+[−q] | Local images (+1,−1) with augmentation 0 vs (+1,+1) with augmentation 2 | Retain two-condition uniqueness |
| 2.7 Brouwer headline | Point; I with f(t) = 1−t; empty C; translation on ℝ | Fixed point 0; 1/2; no point; none (noncompact) | Retain nonempty, compact hypotheses |
| 2.7 reach vs gauge | Ball of radius r; triangle at centroid | Reach r = 1/gauge; vertex direction ‖v−c‖, opposite direction half of it | Retain direction-dependent reach |
| 3.2 small chains | Point covered twice | H₀ = R, not R² | Retain |
| 3.5 circle MV | Two arcs | (a,b) ↦ (a+b, −a−b), kernel ℤ·(1,−1) = H₁ | Retain (i_U, −i_V) |
| 4.0 coreflection | ∅, point, I, Sierpiński S | k∅ = ∅, k* = *, kI = I; {0} ⊂ S is not k-open (indicator of (0,1] from [0,1] is continuous), so kS = S, still not Hausdorff | Retain separate T2 hypothesis |
| 4.0 products, exponentials | k(I×I), C(S⁰,I) | I² retaining both coordinates; I² with (0,1) sending the vertices to 0,1 | Retain |
| 4.0 adjunction | Pointed S⁰, degree +1; reflection | Loop t ↦ exp(2πit), winding +1; −1 | Retain interval-last |
| 4.0 suspensions | *, S⁰, S¹ | Σ* = *, ΣS⁰ = S¹, ΣS¹ = S² with reduced H₂ = 0, 0, ℤ | Retain |
| 4.2 differentials | RP² over ℤ | d₂ = 2, d₁ = 0, H₁ = ℤ/2, H₂ = 0 | Retain |
| 4.3 comparison headline | Wedge of one Sⁿ per n ≥ 1; A = X; point | Cellular = singular = ℤ in each positive degree with no finite dimension; 0; M in degree 0 | Retain extension past the pinned finite-dimensional iso |
| 4.4 quotients | X/∅, X/X, (D⁰,∅), (I,∂I) | X₊ with H̃ = H(X); point; D⁰ ↦ −p and the added point ↦ p; t ↦ t goes to the +1 generator | Retain |
| 4.4 interchange | Sᵐ∧Sⁿ, (m,n) = (1,1), (2,1) | (−1)^(mn) = −1, +1 | Retain; R01 is the page only |
| 5.1 Künneth | T² over 𝔽₂ and 𝔽₃; RP²×RP² over ℤ degree 3 | Betti (1,2,1) both; Tor₁(ℤ/2,ℤ/2) = ℤ/2 = H₃ | Retain Tor term |
| 5.1 general ring | R = 𝔽₂[ε]/ε², module R/(ε) | Tor_p ≠ 0 for every p | Retain spectral sequence for non-hereditary R |
| 5.3 transfer headline | Two-sheet cover of a point over ℤ, 𝔽₂; ∅ → B; z ↦ z³ | tr(1) = (1,1), p∗tr = 2 (0 mod 2) with tr ≠ 0; tr = 0 = 0·id; on H₁: p∗ = 3, tr = 1 | Retain sum-of-lifts clause |
| 5.4 torus | n = 0, 1, 2 | Exterior ranks (1), (1,1), (1,2,1) | Retain |
| 6.0 point tower | Constant ℤ tower | δ(3,1,0,…) = (2,1,0,…); lim¹ = 0 | Retain imported convention |
| 6.0 circle tower | One vertex, one edge, degree 1 and 0 | 0 ← M ← M ← ⋯, limit M; degree-0 tower constant, lim¹ = 0, H¹(S¹;M) = M | Retain |
| 6.0 extension by zero | I with two vertices, cochain (0,1) | δ = 0 on X⁰; after extension δ(e) = 1−0 = 1 | Retain “graded splitting, not a cochain map” |
| 6.0 countable wedge | Degree-one cellular limit, M = ℤ | ∏ℕℤ contains the all-ones cochain; ⊕ℕℤ does not | Retain product |
| 6.0 Mittag–Leffler control | ×2 tower, target (1,0,1,0,…) | 3x₀ + 1 divisible by every 4ᵏ forces 3x₀ = −1 in ℤ, impossible | Retain hypothesis in the imported theorem |
| 6.1 local differential | S¹, u = 2 in ℤ/5 | u⁻¹a − a = 3a − a = 2a vs forward ua − a = a | Retain inverse transport |
| 6.2 LS carriers | Point; S¹ with R ≠ 0; ∅; zero ring | Cup-length 0, 1, 0, 0; counts 1, 2, 0, ≥1 | Retain nonempty hypothesis |
| 6.2 LS headline | S¹; T²; X = S¹ with R = 0 | 1+1 ≤ 2; 2+1 ≤ 3; 0+1 ≤ 2 (sSup ∅ = 0 in ℕ∞) | Retain |
| 6.3 local generator | ℝᵐ simplex v₀ = −Σe_i, v_i = e_i; reflection; m = 0 | det(I+J) = 1+m > 0; reflection acts −1; empty determinant +1 | Retain |
| 6.3 boundary sign | D¹, D² | Inward-first to outward-first conversion (−1)^m = −1, +1; ∂[D¹] = [+1]−[−1]; ∂[D²] counterclockwise | Retain |
| 6.3 ρₙ | Cyclic permutation of n+1 coordinates | Determinant (−1)ⁿ | Retain |
| 6.4 characteristic-two headline | S¹ over 𝔽₂; RP² over 𝔽₂; point; R = 0; M empty | Caps bijective with μ the generator, zero for μ = 0; Betti 1,1,1 matched p ↔ 2−p; a ↦ a; all modules 0; excluded by `ConnectedSpace` | Retain |
| 6.4 negative controls | RP² over ℤ and ℤ/4 | H⁰ = ℤ vs H₂ = 0; H⁰ = ℤ/4 vs H₂ = ker(2) ≅ ℤ/2 | Retain 2 = 0, not nilpotence |
| 6.4 Lefschetz form | D², any R | H⁰ ≅ H₂(D²,S¹) = R, H² (D²,S¹) ≅ H₀ = R, H¹ = H₁(D²,S¹) = 0; absolute H₂(D²) = 0 | Retain relative target |
| 6.5 symmetry exponent | (n,i) = (3,1), (5,2) | (i+1)(n−i) = 4, 9 | Retain; agrees with cfh Prop 1.1 |
| 6.5 lens spaces | L(5,1), L(5,2), reversed orientations | −1/5, −2/5; +1/5, +2/5; squares mod 5 are {1,4}, closed under negation, so the forms are inequivalent | Retain orientation marking |
| 7.1 Euler definition | ∅, point, interval, S² | 0, 1, 2−1, 1+1 | Retain |
| 7.2 homotopy and product headlines | I ≃ *; S²×S²; ∅×S² | 1 = 1; 1+2+1 = 4 = 2·2; 0 = 0·2 | Retain |
| 7.2 bundle formula | Hopf S³ → S²; Klein bottle over S¹ | 0 = 2·0 although d₂ = ±1; 1−2+1 = 0 = 0·0 with monodromy −1; local-coefficient chain dimension c_p(B)·b_q(F) | Retain, no trivial-monodromy hypothesis |
| 7.3 cover headline | S² → RP²; ∅ → B | 2 = 2·1; 0 = 0·χ(B) | Retain zero-sheet case |
| 7.4 values | Sⁿ, Tⁿ, CPⁿ | 1+(−1)ⁿ; 0 for n > 0 (T⁰ has 1); n+1 | Retain n > 0 |
| 8.1 relative connectivity | (RP², RP¹), λ = 2 | π₁(RP²,RP¹) = 0; ℤ → ℤ/2 surjective, not injective, at q = λ−1 | Retain range |
| 8.2 nerve order | g = (12), h = (23) | d₁ = hg = (132) sends 1 ↦ 3; gh = (123) sends 1 ↦ 2 | Retain |
| 8.3 Hurewicz normalization | S¹ degree k; S² antipodal | k·[S¹]; degree (−1)³ = −1 | Retain |
| 8.4 relative Hurewicz | (ℝ,(0,1)); (D²,S¹∨S¹) | All groups 0 with A not closed; π₂ = F₂ → H₂ = ℤ² is abelianization | Retain “A simply connected”, no cofibration |
| 8.5 ordinary Whitehead headline | S¹ → S¹ degrees 1, 2; ∅ → * | ×1 bijective, ×2 not; π₀ map 0 → 1 not bijective | Retain π₀ clause |
| 8.5 homological Whitehead headline | S² degrees 1, 2 | H₂ maps 1, 2 | Retain integral coefficients and simple connectivity |
| 8.5 proper SDR headline | A = X; A = {0} ⊂ I; A = {0} ⊂ ℝ | r = id; r = 0, H = (1−t)x, compact preimages; constant retraction has preimage ℝ, not proper | Retain properness |
| 8.5 ends | ℝ, ℝ², ℝ³ | Ends 2,1,1; groups (0,0), ℤ, 0; SC at infinity true, false, true | Retain (r7 R04 repaired) |
| 8.7 CW-type headlines | ∅; circle; two points; I and D² with boundary; ℝ | Finite models with 0; 1+1; 2 cells; point models; ℝ countable but not finite | Retain compactness |
| 8.7 recognition | Sⁿ; Poincaré sphere; n = 0, 1 | Identity; π₁ of order 120 excluded; n = 0 would be contractible, n = 1 contradictory | Retain n ≥ 2 |
| 8.8 K(G,1) headline | G = 1, ℤ, S₃ | π₁ = 1, ℤ, S₃ with π₂ = 0; abelianizing S₃ gives order 2 | Retain nonabelian scope |
| 8.9 obstruction | D² to S¹ identity; difference with degrees 1, k and attaching degree m | c(e²) = 1 ≠ 0; δd = m(k−1) = km − m | Retain convention |
| 8.10 representability | (S¹, ℤ, n = 1); (two points, n = 0); X = ∅ | ℤ = H¹(S¹;ℤ); A² = H⁰; one map class and H⁰(∅) = 0 | Retain degree 0 by components |
| 8.11 metric realization | Δ⁰, Δ¹, countable wedge | 0; vertex distance 2; d(x_j, v₀) = 2/j → 0 in K_m but not in K_w | Retain |
| 8.11 mapping-space headline | X = ∅; X = point; Y Sierpiński with model a point | C(∅,Y) = point; C(*,Y) = Y; C(X,Y) ≃ C(X,*) = point without T2 on Y | R03: drop `[T2Space Y]` |
| 8.11 domination | S¹ → * → S¹ | H₁ map 0 ≠ 1, no homotopy to id | Retain composite-homotopy clause |
| 8.12 EM classics | RP¹, CP¹ vs RP∞, CP∞ | π₁(RP¹) = ℤ, π₃(CP¹) = ℤ; infinite stages ℤ/2 in degree 1, ℤ in degree 2 | Retain infinite carriers |

**Consumer-side notes (not findings on this folder).** Because `Suggested.lean` now states headlines only, GeneralizedCohomology (`:229`–`:239`), MorseTheory (`:483`) and HeegaardFloer (`:586`) cite Lean names this head does not declare; R04 asks the README to name the carrying sections so those consumers can repoint. AlgebraicTopologyPartII, DerivedModuleAlgebra, BanachAlgebras and HeegaardFloer cite “Stage k”; this README's headings read “Layer k” with the same numbering, as the house shape requires. The pull-request description speaks of compact Čech pairs and cube modules; the folder at this head contains none of that (Scope `:138`–`:139` places it outside), so the description is stale relative to the folder, which is the author's text, not a defect of the roadmap.

## Not verifiable

- **eilenberg-steenrod**, Chapters I–III, **whitehead**, Chapters II–VII, **dold**, Chapters VII–VIII, **may**, Chapters 3 and 12, **mccleary**, Chapters 1–2, **weibel**, Chapters 3 and 5, **brown-cohomology**, Chapter VII, **freedman-quinn**, §7.7: no legal full text in the worker's cache and none found at author, institutional or open-publisher locations by the previous rounds; the title lookups resolve to publisher landing pages. The sampled statements they back were checked instead against Hatcher (Künneth over a PID, absolute and relative Hurewicz, representability) and against the pinned declarations (categorical coefficient generality); the hereditary-ring and general-ring Künneth and universal-coefficient forms, the Cartan–Leray construction and the image-stability end convention remain cited by locator only.
- **Hatcher, Vector Bundles and K-Theory**, §3.3 (hatcher-vb): read in the previous round; not re-read here beyond confirming the cache file, since the R03 repair only added locators into the passage already verified there.
- **Serre, Homologie singulière des espaces fibrés**: the cached Rochester copy was not re-read this round; the roadmap uses it only as the spine for 5.5, whose statements it consumes from DGFloer.

## Source issues

- **Misprint** in milnor-cw at proof of Theorem 2, implication (c)⇒(d), printed page 276: the source says the weak/strong comparison completes the proof of Theorem 3; it should be Theorem 2; affects nothing.
- **Misprint** in milnor-cw at proof of Corollary 3, printed page 276: the source says Theorem 4 asserts the triad statement; it should be Theorem 3; affects nothing.
- **Misprint** in cfh at proof of Lemma 2.6, printed page 504: the source says the reductions of g and f have degrees k and l respectively; it should be l and k respectively; affects nothing.
