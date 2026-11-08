# Review of AlgebraicTopology (pull request #1797 at 11a9ca1)

**Verdict:** needs changes

The pull request's own change to this folder is mechanical: the six side files are folded into `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` as sections, declaration for declaration (134 declarations, bodies unchanged; checked by diff against the side files on main), and the README changes one line (316–319). Two further head-part edits are not in the description: `FreshInteriorRechart.chartAt` (line 489) lost its duplicate `[IsManifold I ∞ M]` binder (harmless: the section variable at line 460 supplies it), and the `set_option maxHeartbeats 800000 in` at main's line 910 is gone (good: the gate's `set_option` count is now 0). Everything else below is the state of the folder as it is at this head; most of it is inherited from main, where the folder already fails the gate with the same classes of failure (set_option=1, tex=1, sorry-data=69, statement-hygiene=22, dropped=14, readme-ids-missing=2, depcheck=2). The folded sections add imports=1, six sorry'd definitions and fourteen hygiene hits. The worker's gate on this head: FAIL (tex=1, sorry-data=75, imports=1, statement-hygiene=36, dropped=14, readme-ids-missing=2, depcheck=2, build=0). No acceptance while the gate fails.

## R01 (P1) — HomotopySpheres is cited as a supplier: an upward edge and a cycle

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` lines 115, 117, 567, 621, 768, 1641, 1933, 1951, 1990, 2052, 2096, 2109, 2110, 2111 ("HomotopySpheres §3A.1's coreflection", "§3A's pointed compactly generated suspension–loop adjunction", dependency-table rows for Stages 4, 8.10, 8.11a, 8.11b).

**Claim.** Stage 4.4/4.5, 8.10, 8.11a and 8.11b consume HomotopySpheres §3A/§3A.1/§3A.2 (the Kelley coreflection k, its counit, CW compact generation, k(Y×I)≅k(Y)×I, the Σ⊣Ω adjunction).

**Witness.** The dependency check on this README:

```
UPWARD: AlgebraicTopology (on main) -> HomotopySpheres (#71) at README lines [2096, 2109, 2110, 2111]
CYCLE among: AlgebraicKTheory, AlgebraicTopology, HilbertModules, HomotopySpheres, IndexTheory, OperatorKTheory, StringOrientation, TangentialBordism
depcheck: 244 roadmaps, 2466 edges, 2 problem(s)
```

HomotopySpheres is not on main (no `TauCetiRoadmap/HomotopySpheres` in the content checkout), sits at merge-order line 72 as an open pull request, and is the first entry of the project's dropped-names list; the brief's never-cite list names it. The gate's `dropped` rule flags the fourteen lines above.

**Repair.** Remove every HomotopySpheres citation and state the consumed objects as this roadmap's own targets in Stage 4.4 (where the Lean already takes the coreflection as data: `compactBasedSmashCarrierComparison (k) (hk : compactlyGeneratedToTop ⊣ k)`, Suggested.lean 2323–2371): the right adjoint k of `CompactlyGenerated.compactlyGeneratedToTop` on Mathlib's `CompactlyGenerated`/`UCompactlyGeneratedSpace` (Mathlib `Topology/Category/CompactlyGenerated.lean` has the forgetful functor at line 78 and no coreflection at this pin), its counit, CW compact generation, the product comparison k(Y×I)≅k(Y)×I, and the pointed compactly generated Σ⊣Ω adjunction. Rewrite the four dependency-table rows accordingly. This is what cuts the cycle; the check must then show no UPWARD/CYCLE line for AlgebraicTopology.

## R02 (P2) — Suggested.lean imports another roadmap's module and states targets on its sorry'd data

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` line 27 (`import TauCetiRoadmap.DifferentialGeometry.Suggested`), used by the folded sections 2906–4629 (`OrientationLift`, `Manifold.Orientation`, `orientationAt`, `Manifold.Orientation.pullback`, `.neg`).

**Claim.** The orientation-comparison statements (pointGenerator, chosenSection, chosenCompactClass, carrierOrientation, pointGeneratorOnAmbient, …) are stated against DifferentialGeometry's Layer 2 prototypes.

**Witness.** The gate's `imports` rule: "only the individual `TauCeti.*` modules it uses". In `TauCetiRoadmap/DifferentialGeometry/Suggested.lean` the carriers are sorry'd data: `OrientationLift.setoid` has `iseqv := sorry` (line 928), `Manifold.Orientation.neg` (938), `orientationAt` (943) and `Manifold.Orientation.pullback` (996) are `sorry`. Every folded statement that mentions `orientationAt` or `pullback` (e.g. 3361, 3896, 4179, 4419) therefore mentions sorry'd data, which the acceptance-test rules forbid outright, and the import itself is refused by the gate.

**Repair.** Drop the import. The chart-sign and point-generator comparison is restated on carriers that exist at the pin, as Tau Ceti's own `AlgebraicTopology/Singular/LocalHomology/Orientation/Linear.lean` (`localOrientation`, line 138; `localOrientation_map` 170, `localOrientation_neg` 191) and `Orientation/Chart.lean` (`singularHomologyComplSingletonIsoOfOrientation`, 104, and its `_neg_hom` 134) already do with Mathlib's `Orientation ℝ E ι` on a chart, or it is named in the module docstring as not statable (the manifold-orientation carrier is missing at the pins) and nothing is stated in its place. See R04 for what the pin already proves here.

## R03 (P2) — 75 sorry'd definitions

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean`, the 75 `def`s the gate lists (sorry-data), from `cellularToSingular` (163) to `interiorFundamentalGroupoidEquivalence` (4515). Six are new to Suggested.lean through the fold: `disjointSupportExcisionIso` (4034, `LinearEquiv.ofBijective _ sorry`), `carrierValDiffeomorph` (4148), `chosenSection` (4232, a sorry'd field), `compactSupportFundamentalClass` (4254, sorry'd compactness proof inside the body), `chosenCompactDatum` (4310), `interiorFundamentalGroupoidEquivalence` (4515, sorry'd inverse and unit/counit). The other 69 are inherited from main (`orientationLocalSystem` 579 with `map := by sorry`, `relativeHomotopyGroup` 1057, `relativeHurewicz` 1114, `ordinaryEilenbergMacLaneFamily` 1355, `cubicalSphereQuotient` 1430, `sphereSmashHomeomorph` 2058, `poincareDualityMap` 957, …).

**Witness.** Principle: "no sorry'd data and no `set_option`"; the gate's `sorry-data` rule. Each of these is a construction whose existence is itself a theorem (a local system, a relative homotopy group, an EM family, a quotient homeomorphism with its formula, a duality map); the acceptance test may only state the theorems about them once the carriers exist.

**Repair.** Delete every sorry'd `def` together with the theorems that mention it; keep each construction as a README target with its intended signature. Where a native carrier exists (R04) state the headline on it. Where none does (the twisted orientation system `or_M`, the Poincaré–Lefschetz map, the EM family, the sphere quotient homeomorphisms with their pinned formulas), name the headline in the module docstring as not statable and what it lacks.

## R04 (P2) — Targets that the pinned Tau Ceti already proves, restated as sorries

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` and the README's Inventory (192–260), which does not list these modules.

**Claim.** The following are planned here as sorried targets.

**Witness** (file and line at the Tau Ceti pin `2fd255d9`, under `TauCeti/`):

- Stage 2.7 Brouwer, Suggested.lean 2441–2582: `AlgebraicTopology/Singular/BrouwerFixedPoint.lean` proves `noRetraction_diskBoundary` (71), `brouwerFixedPoint_topCatDisk` (91), `brouwerFixedPoint_compactConvex` (125), `_continuousOn` (140), `_closedBall` (149), `_compactConvex_finiteSpan` (159), with the same names and statements.
- Stage 5.3 transfer, 176–223: `Singular/Transfer/Basic.lean` `IsCoveringMap.singularTransfer` (179) and `Transfer/Degree.lean` `singularTransfer_comp_chainComplexMap` (42–76: p_*∘tr = d·id on chains and homology, locally constant degree) and `chainComplexMap_comp_singularTransfer_comp_chainComplexMap` (88–115); `Transfer/PermutationLocalSystem.lean` is the permutation system of README 902.
- Stage 8.1 carriers, 1031–1117: `Topology/Category/BasedTopPair.lean` `BasedTopPair` (41); `AlgebraicTopology/Homotopy/Relative/Basic.lean` `RelHomotopyGroup` (302).
- Stage 8.1 cell-dimension connectivity, 978–1025: `Homotopy/Relative/CellDimension.lean` 77, 90, 124, 136.
- Stage 8.3 absolute Hurewicz, 1642–1654: `Homotopy/Hurewicz/Absolute.lean` `bijective_hurewicz` (161), `hurewiczAddEquiv` (179); degree one `Homotopy/Hurewicz/One/Basic.lean` `hurewiczAddEquiv` (632), so Stage 8.3's "DGFloer Layer 1 item 1 owns the theorem" (README 1688) and 8.11b's "DGFloer 1.2's CW approximation" (2055) now point past the library: `Homotopy/CWApproximation/Basic.lean` (`cwApproximation`, `isWeakHomotopyEquivalence_cwApproximationMap`, header lines 38–53) and `Homotopy/Whitehead.lean` `IsWeakHomotopyEquivalence.homotopyEquiv` (243) are native.
- Stage 7 and 8.7, 1148–1210: `Topology/CWComplex/Classical/FiniteCWType.lean` `FiniteCWType` (74); `Cellular/EulerCharacteristic/FiniteCWType.lean` `eulerChar` (123), `eulerChar_eq_cwEulerChar` (143), `HomotopyEquiv.eulerChar_eq` (157); `Topology/Triangulable/FiniteCWType.lean` `IsTriangulable.finiteCWType` (41).
- Stage 6.0 towers, 1235–1255: `Algebra/Category/ModuleCat/Tower/Basic.lean` `ModuleTower` (78), `shift` (160), `lim` (170), and `Tower/Milnor/Basic.lean` (integer-graded tower complexes, 124–137).
- Stage 6.2 LS category, 2753–2886: `Topology/Homotopy/LusternikSchnirelmann.lean` `LSCategoricalCover` (84), `lsCategoryCount` (264), `lsCategoryCount_lt_top_iff` (302), `lsCategoryCount_sigma` (header 61).
- Stage 8.5 proper homotopy, 2682–2739: `Topology/Homotopy/Proper.lean` `HasProperHomotopyInverse` (41); `AlgebraicTopology/Homotopy/SimplyConnectedAtInfinity.lean` (71).
- Stage 6.3 compact-support lemma, 914–925: `Singular/LocalHomology/Compact.lean` `localHomology_ext_of_isCompact` (259), `exists_localHomologyRestriction_eq_of_isCompact` (294); `Orientation/Homological.lean` `HomologicalOrientation` (75); `LocalHomology/FundamentalClass.lean` `fundamentalClass` (204).
- Stage 4.3 all-dimension comparison, 163–171: `Cellular/Comparison.lean` `cellularSingularHomologyIsoUniv` (300).
- Stage 6.1 universal coefficients and Bockstein (README 1039–1052): `Cohomology/UniversalCoefficient.lean` (`singularKronecker_bijective_of_projective_homology` 101, `singularExtToCohomology` 136, exactness 172), `Cohomology/Bockstein.lean` (127, 278), `Cohomology/MayerVietoris/Basic.lean`; graded commutativity (README 1069) `Cohomology/GradedCommutativity.lean` 63; the K(π,1) group-cohomology comparison (README 1852–1854) `Cohomology/GroupCohomology.lean` `singularCohomologyIsoGroupCohomology` (248); classifying-space uniqueness `ClassifyingSpace/Uniqueness.lean` 94.
- Stage 5.1 field Künneth (README 861): `Singular/Kunneth/Basic.lean` `singularHomologyKunnethUnitIso` (326).

**Repair.** Delete the duplicated declarations from `Suggested.lean`, list the modules above under the README's Inventory as consumed, and repoint Stages 2.7, 5.3, 6.0, 6.2 (LS), 6.3 (compact support), 7, 8.1, 8.3, 8.5 to them. The headlines that are not native stay: homological Whitehead (1216), twisted Poincaré–Lefschetz, Cartan–Leray, ordinary EM representability and the obstruction criteria, mapping-space CW type, proper Whitehead; relative Hurewicz under the README's hypotheses (A, X simply connected and π_i(X,A)=0 below n) is wider than the native `bijective_hurewicz_of_subsingleton_homotopyGroup` (`Hurewicz/Relative.lean` 282, both spaces (n−1)-connected) and stays, stated on the native `RelHomotopyGroup`.

## R05 (P3) — Statement hygiene: 36 gate hits

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean`: `letI` in signatures at 211, 512, 520–521, 530–531, 539–540, 549, 1276, 2625, 2636, 4115, 4129, 4376, 4380, 4566–4574; `eqToHom` in conclusions at 1388, 1398, 1411, 1550, 2183, 2193, 2199, 2228; definitions by choice at 2298 (`Classical.choose`), 2309 (`Classical.arbitrary`), 3157, 3678, 3689 (`Classical.choice`), 3701 (`Classical.choose`).

**Witness.** The gate's `statement-hygiene` rule; fourteen of the hits (3157 onward) enter Suggested.lean through the fold.

**Repair.** As the rule says: instance binders or named instances instead of `letI`; conclusions restated without transport (for instance state `ordinaryEilenbergMacLaneFamily_one_point` as an equality in `groupClassifyingSpace (Multiplicative A)` after `_one_space` is replaced by an isomorphism of the two models); data defined by a universal property or taken as an argument (`pointGenerator` 3152 is the clearest case: its witness independence is the theorem at 3256, so the definition can take the chart simplex as an argument). Most of these disappear with R03/R04.

## R06 (P3) — Five open pull requests change this folder; no order is stated

**Location.** The pull request's description (data) names no other pull request.

**Witness.** The overlap index: #1854 (same author, "Cut the dependency loops main acquired after the pin bump") conflicts with #1797 in `TauCetiRoadmap/AlgebraicTopology/README.md` and `Suggested.lean`; #1652 and #1663 (kim-em) conflict in the same two files; #1808 conflicts in `Suggested.lean` and the deleted `TopologicalGroupFundamentalGroup.lean`; #1187 (pin bump) in `Suggested.lean`. #1854's head of this folder has `Suggested.lean` rebuilt on the native carriers (its import list is the modules of R04) and a gate without the failures of R01–R05.

**Repair.** State which merges first. The cheapest consistent order is #1797 (mechanical fold) under #1854 rebased on it, or #1854 first with #1797 dropping its AlgebraicTopology commit (the fold has nothing left to fold once #1854 removes the side files); either way the description names the order so that the other author's #1652/#1663 can be rebased once.

## R07 (P3) — README and module docstring are not in the TauCetiRoadmap form

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` throughout; `Suggested.lean` 29–35 (module docstring).

**Witness.** The README has no `## Scope and ownership`/`## Conventions`/`## Exact supplier contracts`/`## How to read the build` sections, no `**Checks.**` lists (its definitions carry prose checks only in Stages 2.5, 6.2 and 6.3), no `### Examples`/`### Dependencies` per layer, and most targets carry no locator (the README's explicit theorem locators number about fifteen; Stages 4, 5, 8.8–8.12 cite sections or chapters only). 384 of the 478 declarations of `Suggested.lean` (194 of its 224 theorems) are never named in the README, against "every Lean name appears in the README"; conversely the README names `coordinateCubeReferenceChain_eq_shuffle` (378) and `isQuotientCoveringMap_iff_isCoveringMap_and` (877) as its own declarations and `Suggested.lean` declares neither (gate `readme-ids-missing`). Line 1176 uses TeX subscripts (`C_c^{cell,n}`; gate `tex`). The module docstring (29–35) says the file "suggests Lean forms for load-bearing interfaces" and lists no headline that is not statable at the pins; the folded section docstrings (4336, 4480) repeat "not exhaustive … honest admitted targets remain below", which is process prose.

**Repair.** The docstring form: "<title>: target signatures", the roadmap is README.md, the file states the headline theorems against the pinned APIs, and which headlines are not statable and what each lacks (twisted Poincaré–Lefschetz lacks `or_M`; EM representability lacks the K(A,n) family; Cartan–Leray and Serre spectral sequences lack the spectral-sequence carriers' convergence API). The README: the section skeleton above, Checks per definition, a locator per theorem, and either a mention of each kept Lean name or the removal of the declaration (R03/R04/R08 remove most). Replace `C_c^{cell,n}(X,A;ℤ)` by a code span.

## R08 (P3) — Padding in Suggested.lean

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean`. None of the 178 sorried theorems closes with `rfl`, `simp`, `infer_instance` or `decide` (probe below), but the following restate definitions, follow from one library lemma, mirror README Checks, compute small values or treat boundary cases: `relativeChainShortComplex_shortExact` (109, the native theorem), `coordinateCubeSupBallPairMap_apply` (1937, `rfl`), `rawChartCoefficient_at_self` (3049, `rfl`), `pointGenerator_raw_representative` (3167, `rfl`), `chart_transition_determinant_sign` (3183, the structure field `sign_mul_sign`), `twistedSupportLocalMap_smul` (3565, `map_zsmul`), `pointGenerator_quotient_congr` (3397, `congrArg`), `commGroup_toGroup` (4705, `rfl`), `HasProperHomotopyInverse.exists_homotopyEquiv` (2690, projection), `lsCategoryCount_empty` (2777); small values and boundary cases `coordinateDiskNativeComparisonCoefficient_zero` (1972), `diskQuotientSphereHomeomorph_zero` (2021), `diskBoundaryReference_radial_zero` (2278), `normedUnitBallTopCatDiskHomeomorph_zero` (2474), `compactConvexClosedBallHomeomorph_zero` (2556), `lsCategoryCount_eq_zero_iff` (2793), `lsCategoryCount_discrete` (2817), `lsCategoryCount_contractible` (2821), `sphereSmashHomeomorph_unit_left/right` (2192, 2198); specialisations and adapters `brouwerFixedPoint_closedBall` (2501), `brouwerFixedPoint_unitClosedBall_continuous` (2507), `brouwerFixedPoint_compactConvex_continuousOn` (2494); the fully proved API of `TopologicalGroupFundamentalGroup` (4642–4726, π₁ of an H-space is abelian: a textbook lemma, not a headline) and the proved chart-sign algebra of `OrientationComparison` (3022–3130, 3214–3254, 3409–3438).

**Witness.** The acceptance-test rules: "API lemmas that restate a definition or follow in one tactic from the library; boundary and degenerate-case theorems; 'controls'; declarations that mirror README Checks; examples that compute values" are not wanted.

**Repair.** Delete them from `Suggested.lean`; the README keeps each as a target or Check.

## R09 (P3) — Locators and cross-roadmap descriptions that do not resolve

**Location and witness.**

- README 670 "(Milnor Lemmas 3.6–3.7)" for the homotopic-attachment equivalences. The only Milnor in the References (2202) is the 1959 CW-type paper, whose lemmas are Lemma 1–4 (milnor1959 lines 132, 246, 247, 254); the intended source is Milnor, *Morse Theory*, §3, Lemmas 3.6–3.7 (manifest key `milnor1963`, uncertified), which the References omit.
- README 1709 "GT3g and Four consume this predicate": GeometricTopology on main has no section "3g" and never mentions `SimplyConnectedAtInfinity`.
- README 82–89, 1205, 1320–1322, 1352: "DG9.3 consumes AT6.3's homological orientation system, chart-normalized point generators, chosen local section, `RelativeTwistedClassDatum` and compact-support class factory … owns the smooth/constant-system/real-coefficient conversions and the integration comparison". DifferentialGeometry on main, README line 872, has 9.3 as `poincareDuality` on de Rham cohomology by induction from its 6.2/6.4, and its README names no AlgebraicTopology orientation object (its four mentions of AlgebraicTopology, lines 128–178, are library modules). The contract described here is not what the supplier states.
- README 1357 "DG2.4's outward-first S² orientation": DG 2.4 (line 362) is the orientation double cover; the outward-first boundary orientation is 5.1 (line 507), and S² appears in 2.4 only as an orientability acceptance.

**Repair.** Cite "Milnor, *Morse Theory*, §3, Lemmas 3.6–3.7" and add the References entry; replace "GT3g" by the GeometricTopology section that consumes the predicate or drop the consumer mention; describe DG 9.3 as it is on main, or move the integration comparison into this roadmap's Stage 6.3 as a target with DG 5.2's `integralTopForm` as its input; cite DG 5.1 for the outward-first convention at 1357.

## Verified sound

**Fold faithfulness.** The six side files on main (OrientationComparison 60, CompactOrientationLaws 25, GeneralModelOrientation 25, BoundaryInteriorComparison 7, BoundaryCarrierOrientation 7, TopologicalGroupFundamentalGroup 10 declarations) and the folded sections 2891–4734 have the same 134 declaration names and, after stripping imports, `set_option`, `open`, `universe` and namespace lines, `diff -w` reports no other difference (two docstrings changed "file" to "section"). The head part 1–2890 differs from main's `Suggested.lean` only at lines 25–27 (imports), 489 (`chartAt` binder) and the removed `set_option` (main 910). `ChartSimplexLocalImage.lean` carried no declaration.

**Gate.** Re-run on this head without `--build`: the same counts as the worker's. The dependency check output is quoted under R01. On main's copy of the folder the gate already fails with set_option=1, tex=1, sorry-data=69, statement-hygiene=22, dropped=14, readme-ids-missing=2, depcheck=2.

**Build and probe.** The targeted build passed (worker, build=0; the olean exists in the worktree). One-tactic probe: a scratch copy with every `sorry` of each of the 178 sorried `theorem`s replaced by `first | (rfl; done) | (simp; done) | (infer_instance; done) | (decide; done) | sorry`, elaborated with `lake env lean` (52 s, exit 0): all 178 still report `declaration uses sorry`, so nothing closes in one tactic. The 85 remaining sorries are in definitions (R03).

**Signatures.** The worker's signature file (the module plus 502 `#check @name` lines) was elaborated in the worktree: 401 signatures printed, 101 errors all from malformed generated names (`FreshInteriorRechart.above`, a bare namespace). Compared with the README: `chartAt` (607) no longer carries `IsManifold` (not needed by its type); `isManifold` (648) carries `[FiniteDimensional ℝ E] [IsManifold I ∞ M]` as the README's 6.3 requires; `relativeHomotopyGroup` (1098) is `(n) → 2 ≤ n → BasedTopPair → GrpCat` as README 8.1 (group-valued from degree 2); `homologicalWhitehead` (1177) carries `T2Space`, `SimplyConnectedSpace`, `CWComplex` on both spaces and integral homology isomorphisms in all degrees, as README 8.5; `poincareDualityMap_isIso` (1063) carries `CompactSpace`, T2, second countable, boundaryless Euclidean model and the fundamental-class datum (constant coefficients: the corollary of README 6.4, not its twisted form, which R07 asks the docstring to name); `orientationLocalSystem` (702) carries T2 and second countability.

**Seeded sample (15 targets).** Verified at the locator in the cached texts (`<source id> line N`; Hatcher pdf page = printed page + 9 in Chapters 2–3):

| # | README line | Target | Source line | Result |
|---|---|---|---|---|
| 1 | 495 | small chains ↪ chains is a chain homotopy equivalence | hatcher 5222 (Prop 2.21) | supports, with the natural map ρ |
| 2 | 710 | CW complexes normal, hence Hausdorff, by ε-neighbourhoods | hatcher 22617 (Prop A.3) | supports |
| 3 | 745 | based inverse rel a 0-cell via HEP | hatcher 867 (Prop 0.19) | supports: (X,A),(Y,A) with HEP, f|A = id ⇒ equivalence rel A |
| 4 | 766 | product CW structure on (X×Y)_c; equals X×Y if a factor is locally compact | hatcher 22693 (Thm A.6) | supports |
| 5 | 1251 | compact-support lemma: unique class with given local images, H_i(M|A)=0 for i>n | hatcher 10255 (Lemma 3.27) | supports (constant R; the README's local-system form is its own target) |
| 6 | 1513 | H_i(U;L)=0 for i>m via the triple sequence | hatcher 10370 (Prop 3.29) | supports the route (Hatcher states i ≥ n for connected noncompact M; i > n for all M is the same argument) |
| 7 | 1551 | compact triad duality by the five lemma | hatcher 10976 (Thm 3.43) | supports: ∂M = A ∪ B with A∩B = ∂A = ∂B, cap with [M] |
| 8 | 944 | transfer for n-sheeted covers | hatcher 14042 (Prop 3G.1) | supports (section-level citation) |
| 9 | 2076 | Whitehead's theorem, Hurewicz | hatcher 15109 (Thm 4.5) | supports |
| 10 | 1954 | mapping spaces from a compact n-ad into W_n have CW n-ad type | milnor1959 209–212 (Thm 3), 218–223 (Cor 3, Thm 4) | supports |
| 11 | 1770 | locally finite contraction of an acyclic C with acyclic C∨ | ftw1973 600–607 (Thm 4.2) | supports: finite dimensional, countably based, locally finite |
| 12 | 1782 | controlled filling lemma | ftw1973 610–616 (Lemma 4.3) | supports |
| 13 | 1790 | proper Whitehead for simply connected, SC-at-infinity, finite-dimensional locally finite CW | ftw1973 752–756 (Cor 4.9) | supports (iff with H_* and H_c^* isomorphisms) |
| 14 | 674 | product of cofibered pairs, A closed | strom1972 181–185 (Thm 6) | supports |
| 15 | 172–176 | cap formula and ∂(σ⌢φ) = (−1)^k(∂σ⌢φ − σ⌢δφ) | hatcher 10393, 10400 | supports (Hatcher's ℓ = deg φ) |

Failing locator: README 670 (R09). Brown's groupoid van Kampen (README 322) is cited at chapter level; brown 9424 (6.7.2) is the pushout theorem.

**Adversarial pass** (values computed on each side):

| Statement | Instances | Values | Result |
|---|---|---|---|
| ∂[t↦t] = [1]−[0] (2.5, 344) | n=1 | alternating deletion: ∂[v₀,v₁] = [v₁]−[v₀] | agrees |
| ordered-edge determinant (6.3, 1264; Lean 2931–2933) | m=0,1,2,3 | matrix I+J: det = m+1 = 1, 2, 3, 4; empty det 1 | agrees with `orderedEdgeMatrix_det` |
| `orderedVector_coordinates` (2935) | m=1, t=(t₀,t₁) | coordinate = −t₀ + t₁ = −1 + 2t₁ = v₀ + 2x | agrees |
| S² antipodal frames (4.6, 803) | (x,v₁,v₂) vs (−x,−v₁,−v₂) | det(−I₃) = −1 | opposite signs, agrees |
| RP² cellular differentials (4.6, 810–811; 6.1, 1034) | ℤ and sign system ε | ℤ: d₂=±2, d₁=0; ε: d₂=0, d₁=±2; cochains δ⁰=±2, δ¹=0 ⇒ H⁰(ε)=0, H¹(ε)=ℤ/2, H²(ε)=ℤ | agrees with duality H^k(ε)≅H_{2−k}(ℤ) = 0, ℤ/2, ℤ |
| boundary conversion sign (−1)^m (6.3, 1413–1418) | m=1, 2 | swap past m−1 directions (−1)^{m−1}, inward→outward −1: total (−1)^m; D¹: ∂[D¹]=[+1]−[−1]; D²: outward-first boundary counterclockwise | agrees with 1423–1424 |
| S⁰ reference classes (2.5, 370; 4.4, 599; Lean 2104–2111, 2278) | q = p = e₀ | Stage 2.5: s₀ = [q]−[−q]; Stage 4.4 based: [−p]−[p] = −s₀; ∂[D¹] = [p]−[−p] = −([−p]−[p]) | the README (376, 619) and `diskBoundaryReference_radial_zero` record the opposite sign consistently |
| disk coefficient (4.4, 614; Lean 2316) | n=0, n≥1 | (n+1)-disk coefficient = −ε₀ for n=0, ε_n for n≥1 | agrees |
| cyclic permutation ρₙ (6.3, 1470) | n=1, 2 | (n+1)-cycle has sign (−1)^n: n=1 reflection, n=2 even | agrees with 1506 |
| factor interchange (4.4, 589; Lean 2225) | m=n=1 | (−1)^{mn} = −1 | standard |
| torsion linking symmetry (6.5, 1565) | n=3,i=1; n=5,i=2 | (−1)^{(i+1)(n−i)} = +1 (symmetric), −1 (skew) | agrees with the known (−1)^{k+1}-symmetry on Tor H_k of a (2k+1)-manifold |
| transfer identities (5.3, 871, 880; Lean 188, 215) | degree d; regular G | tr then p_* = d·id on C(B); p_* then tr = Σ_g g_* on C(E); d=0 allowed | agrees; `finiteCover_transfer_push` composes in the right order |
| Cartan–Leray E² (5.3, 890; Lean 303) | regular cover, deck G | E²_{p,q} = H_p(G; H_q(E;M)) with bidegree (−r, r−1) | agrees |
| tower δ (6.0, 960; Lean 1235) | surjective bonding maps | δ(x)_n = x_n − f_n(x_{n+1}); solving recursively from x₀ = 0 gives surjectivity | `towerDifference_surjective` true; lim = ker, lim¹ = coker |
| Euler characteristic checks (7.4, 1592) | Sⁿ, Tⁿ, CPⁿ | 1+(−1)ⁿ; 0 for n>0; n+1 | agrees |
| LS category (6.2, 1102, 1122; Lean 2793–2837, 2884) | point, discrete A, Sⁿ, ΣX_j | count(point)=1 ⇒ normalized 0; discrete: an open with two points is never categorical (paths are constant) so count = |A| = encard; Sⁿ: two contractible opens, top class nonzero ⇒ normalized 1; sigma: a categorical open lies in one component, count adds | agrees |
| Brouwer n=0 (2.7, 414; Lean 2441) | n=0 | D⁰ a point, S^{−1} empty: no map D⁰→∅, so no retraction | `noRetraction_diskBoundary 0` true; radius-0 ball: fixed point trivially |
| relative CW connectivity (8.1, 1622–1626; Lean 978–1000) | λ=2, q=0; λ=1 | cells of dim ≥ λ: π_q(A)→π_q(X) bijective for q+1<λ, surjective at q=λ−1; λ=2 gives π₀ bijective; λ=1 gives π₀ surjective | agrees |
| relative Hurewicz hypotheses (8.4, 1694; Lean 1135) | n=2 | π₁A=0 and π₁(X,A)=0 ⇒ π₁X=0, so the X hypothesis is redundant but harmless; π₂(X,A) abelian under these hypotheses (1121) | agrees with Hatcher 4.37 |
| EM representability free vs based (8.10, 1921; Lean 1714) | n=1, A abelian; X=∅ | free classes [X,K(A,1)] = Hom(π₁X,A)/conj = Hom(π₁X,A) = H¹(X;A) since A abelian; [∅,K]=1 element, H^n(∅)=0 for n≥1 | unbased, unreduced form correct for n ≥ 1 |
| obstruction criteria (8.9, 1887–1895; Lean 1816, 1838, 1867) | n ≥ 2 (`Nontrivial (Fin n)`) | c(f)=0 ⇔ extension of the fixed n-skeleton; δd(f₀,f₁)=c(f₁)−c(f₀); [c]=0 ⇔ extension after changing the n-skeleton | signs consistent with the README's pin |
| `isIso_supportOpenEmbeddingTwistedHomologyMap` (4603) | f open embedding, N T2, K compact | N∖f(M) is closed, N∖f(K) open (f(K) compact in T2 N), N∖f(M) ⊆ N∖f(K): excision in every degree | true |
| `isIso_embeddingIntegralLocalMap` (4426) | as above, K={x} | same excision with {f x} closed | true |
| `orientationFiberSquareIso_self` (614) | o and −o | (−o)⊗(−o) = o⊗o ↦ 1 | consistent on both generators |
| `lsCategoryCount_discrete` vs `_eq_zero_iff` (2793, 2817) | A=∅ | encard ∅ = 0 | consistent |
| `FundamentalGroup.mul_def` reversed composition (1.6, 316) | Mathlib pin | `FundamentalGroup.lean` 44: `p * q = .of (q.asHom.trans p.asHom)` | the README's convention statement is exact |
| `capProduct` degree (338) | p ≤ q | target degree q − p with hypothesis p ≤ q; no junk subtraction | agrees with the acceptance check at 2143 |
| `relativeClass_openEmbedding_natural` (3951) | — | `hK' : IsCompact (f '' K)` follows from `hK` and continuity | unused hypothesis, note only |
| `InteriorCarrier` (4493) | — | `[NeZero (n+1)]` is always satisfied | vacuous binder, note only |

**Citations resolved on main** (content checkout, `TauCetiRoadmap/`): DGFloer README Layer 1 items 1 (462), 2 (470), 3 (621), 4 (659) and its ownership paragraph (140–150) naming AT 5.5/6/8.1–8.7/8.8; ClassifyingSpaces Stage 3 items 11–15 (179–219) and Stage 4 items 16–18 (224–243); GeneralizedCohomology G2 `realizationProductKelleyComparison` (234); TopologicalKTheory T1 (163) and T7 (1148); CharacteristicClasses C1 (212), C2 (728), C3 (1000) and its C1.2a S0–S4 contract with the AT supported-cellular supplement (67); DifferentialGeometry Layer 2 (341), 2.2 (352), 2.4 (362), 5.1 (507), 9.3 (872), 10 (877), 10.5 (1022), 1.3 (322); GeometricTopology Layer 1 (177), Layer 11 (831) item 1 "Smooth implies PL" (938); MorseTheory, RiemannianGeometry, AffineMorseLefschetz, BanachAlgebras, SmoothBundlesConnections, ComplexKahlerGeometry, ComplexManifolds, HeegaardFloer, ProfiniteCohomology and `Completed/UniversalCovers` exist on main; CStarClassification and FourManifolds are open pull requests (#863, #936) and are cited only as consumers. The worker's citation check lists nothing unresolved; the two defects found by reading are in R09.

**Library names the README cites, present at the pins.** Tau Ceti: `TopCat.serreFibrations`, `mem_serreFibrations_of_exists_trivialization`, `mem_serreFibrations_proj`, `FiberBundle.hasHomotopyLiftingProperty_proj_cube` (`Topology/Homotopy/SerreFibration/`), `IsEilenbergMacLaneSpaceOne` and `AddCircle.isEilenbergMacLaneSpaceOne` (`UniversalCover/Circle/EilenbergMacLane.lean`), `ContCohomology.nonempty_continuousCohomology_addEquiv_groupCohomology` (`ContCohomology/DiscreteGroup.lean`), `IsLocallyCollared.isCollared` (`Boundary/Collar/Brown.lean`), `TopCat.contractibleSpace_disk`, `isZero_reducedSingularHomologyFunctor_of_contractibleSpace`, `reducedSingularHomologySphereZeroIso_inv_ι`, `singularHomology₀Section`, `finsum_finrank_singularHomology_of_finite_cwComplex`, `hasHomotopyExtensionProperty_base`, `isColimitCechCocone`, `HomotopyGroup.pathLoopSpaceMulEquiv` and `zerothHomotopyLoopSpaceEquivFundamentalGroup` (`Topology/PathSpace/Moore/Comparison/`). Mathlib: `isClosed_fixedPoints`, `Functor.IsMittagLeffler`, `ModelWithCorners.isClosed_boundary`, `ComplexShape.embeddingDownNat`/`embeddingUpIntGE`, `groupHomology.inhomogeneousChains`, `SSet.KanComplex`, `normalizedMooreComplex`, `sSetTopAdj`, `UCompactlyGeneratedSpace`, the `Projectivization` topology (`Topology/Algebra/Projectivization.lean`, so README 272 "builds the absent interface here" is stale: a remark, since Stage 4.6's text already says to import what the pin has). Not found by name: `TauCeti.TopPairing.cup` (README 1866; only `trivialF2TopPairing_cup_*` lemmas exist) and `ContCohomology.GroupCohomologyIso` (1861; the module is imported by the p-adic files but no declaration of that name was found): both are prose mentions in Stage 8.8 and would need the exact names when that stage is rewritten.

**Overlap and ownership.** Checked the overlap index and the vocabulary neighbours: CharacteristicClasses (#1807/#1854/#1808 heads) cites AT 6.0 and the supported-cellular supplement as a consumer; StableHomotopyKTheory (#1227) and HomotopySpheres (#1287) consume AT; HomotopySpheres is also cited here as a supplier (R01). DGFloer at #1798's head consumes Tau Ceti's degree-one Hurewicz and CW approximation directly, which is consistent with R04. No object is owned both here and by another open roadmap except through R01's supplier direction. Ownership against the open pull requests whose files the brief does not give was not checked.

## Not verifiable

- README 670 Milnor, *Morse Theory*, Lemmas 3.6–3.7: manifest key `milnor1963`, uncertified; cited by locator (and misattributed, R09).
- README 1719 Freedman–Quinn 7.7 (stable π₁ at an end): `fq1990` uncertified.
- Whitehead, *Elements of Homotopy Theory* (845, 2076, 2188); Dold, *Lectures* VII–VIII (1569); Serre 1951 (2193); McCleary Ch. 1–2 (942); K. Brown, *Cohomology of Groups* VII (2199); Eilenberg–Steenrod I–III (466): not in the manifest and not open; cited at chapter level only, no sampled target depends on them.
- Weibel Ch. 3, 5 (2197): `weibel` uncertified.
- May, *Simplicial Objects* Ch. 3, 12 (2077) and Hatcher, *Vector Bundles and K-Theory* §3.3 (2080): not in the manifest; not fetched for this review (chapter-level citations).
- Dowker, Arens–Eells, Wojdysławski, Dugundji (1961–1968): named without locators; the README should give them when 8.11a is rewritten.

## Source issues

- none
