# Review of AlgebraicTopology (pull request #1854 at d723ba1)

**Verdict:** needs changes

Full review. Since the head the previous review read (25e4020) the folder changed by 2206 lines in one commit: `Suggested.lean` shrinks from 1370 to 703 lines (26 `sorry`s), the catalogue definitions and API theorems are gone, CW approximation of arbitrary spaces, the cohomological pair-quotient comparison and the mapping-space CW-type theorems are stated, the Hurewicz, Whitehead, weak-equivalence, cellular-comparison, Künneth, Euler-characteristic, tower and Lusternik–Schnirelmann declarations are replaced by `#check` pins of the native ones, and the README's Inventory (lines 303–387) cites each native declaration by file and records the former names. The gate at this head fails only on `dropped=4` and `outside-folder=2`; `build=0`, `statement-hygiene=0`, `readme-ids-missing=0`, `sorry-data=0`, `set_option=0`. The dependency check prints `depcheck: 244 roadmaps, 2461 edges, 0 problem(s)`. Of the previous review's nine findings, five are repaired, one partly, and three stand (the DGFloer second owner, the out-of-folder hunks, the pull-request description). New: six of the 25 sorried theorems close by one `exact` of a pinned Tau Ceti theorem, the README still plans a dozen constructions the pinned Tau Ceti proves, two headlines the docstring calls not statable are statable on the native Hurewicz maps, and the README cites CharacteristicClasses C1.2a as a supplier while CharacteristicClasses consumes this roadmap.

## R01 (P2) — Two owners of the Serre machinery, CW approximation and Hurewicz modulo a class: this folder and DGFloer

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` lines 103–129 ("The ordinary Serre and Eilenberg–MacLane machinery is owned here … Stage 4.8 … CW approximation of arbitrary spaces … Stage 5.5 owns … the homological and cohomological Serre spectral sequences … Stage 8.8d … owns Hurewicz modulo a class. … DGFloer Layer 1 consumes these ordinary targets").

**Claim.** AlgebraicTopology owns these targets and DGFloer Layer 1 consumes them.

**Witness.** `TauCetiRoadmap/DGFloer/README.md` on main today (eaf17b10 is still the folder's last commit) builds them as its own: line 470 "Weak equivalences and CW approximation", line 659 "Serre classes and Hurewicz modulo a class", and line 232 states the opposite direction for the spectral sequence: "AlgebraicTopology Stage 5.5 and GeneralizedCohomology consume these targets". DGFloer's open revision (#1798) keeps the sections (lines 918, 1038 "the spectral sequence consumed by AlgebraicTopology Stage 5.5", 1060). The pull request does not touch the DGFloer folder. Carried from the previous review (its R01); the degree-one Hurewicz part of that finding is now moot on both sides, since both consume the native `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv`.

**Repair.** Complete the move on the supplier side: DGFloer's README cites Stages 4.8, 5.0, 5.5, 8.8c and 8.8d instead of building Layer 1 items 2 and 4 and its spectral sequence, and its line 232 states the direction this README states; either in this pull request (which then names DGFloer among its folders) or in DGFloer's revision with the order stated in both descriptions.

## R02 (P2) — Two headline theorems are statable on the native Hurewicz maps but the docstring calls them not statable

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` lines 86–89 ("relative Hurewicz in degrees at least three with only the subspace simply connected (Stage 8.4): it is a statement about the roadmap's extension of the native relative Hurewicz map; Hurewicz modulo a Serre class (Stage 8.8d): a `C`-isomorphism statement about the native Hurewicz map needs the roadmap's `C`-isomorphism vocabulary"); README 2097–2099 and 2364–2373.

**Claim.** Neither theorem can be written at the pins.

**Witness.** (a) The native relative Hurewicz map is defined in every degree: `TauCeti.RelHomotopyGroup.hurewicz R n : RelHomotopyGroup (Fin n) X → (R ⟶ X.pair.singularHomology R (n + 1))` (`AlgebraicTopology/Homotopy/Relative/Hurewicz.lean` line 324, from `RelGenLoop.hurewicz` at line 190), and `bijective_hurewicz_of_subsingleton_homotopyGroup` (`Hurewicz/Relative.lean` line 282) already states bijectivity of `fun a ↦ (hurewicz (ModuleCat.of ℤ ℤ) (n + 1) a).hom 1` under connectivity of `B` and `Y`. The Stage 8.4 theorem differs only in its hypotheses (`∀ k < 2, Subsingleton (HomotopyGroup (Fin k) B b)` and `∀ k, 1 ≤ k → k ≤ n + 1 → Subsingleton (RelHomotopyGroup (Fin k) ⟨TopPair.ofSubset B, b⟩)` with `n + 2 ≥ 3`); there is no extension of the map to write. (b) Hurewicz modulo a class needs only the predicate "kernel and cokernel lie in `C`" on an additive map: the native `HomotopyGroup.hurewiczHom : Additive (HomotopyGroup (Fin (n + 1)) X x) →+ (R ⟶ H_{n+1}(X; R))` (`Hurewicz/Basic.lean` line 652), Mathlib's `ObjectProperty.IsSerreClass` (`CategoryTheory/Abelian/SerreClass/Basic.lean` line 45) and the native instances `AddCommGrpCat.isTorsion`, `AddCommGrpCat.isKilledBySomePower d` (pinned at lines 150–151 of the file) are all there; a two-line `def IsCIso (C : ObjectProperty AddCommGrpCat.{0}) (f : A →+ B) : Prop := C (AddCommGrpCat.of f.ker) ∧ C (AddCommGrpCat.of (B ⧸ f.range))` is a definition with a real body of the kind the rules allow.

**Repair.** State both: `relHurewicz_bijective_of_simplyConnected_subspace` (Stage 8.4) on the native map, and `hurewicz_isCIso` (Stage 8.8d) for a simply connected `X`, `C` with `[C.IsSerreClass]`, `∀ i < n, C (π_i X)` giving `∀ i < n, C (H̃_i X)` and `IsCIso C (hurewiczHom … )` in degree `n`, with the `IsCIso` definition; drop the two docstring bullets.

## R03 (P2) — This roadmap and CharacteristicClasses cite each other as suppliers

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` line 1542 ("This supplement consumes ordinary Stage4 cellular data, ordinary6.1–6.2, and CC C1.2a's S0–S4 interfaces"), 1551, 2150–2152 ("Consume CC C1.2a's generic compact-relative support diagram, S0–S3 enlargement/cofinality comparisons and proper pullback, and S4 jointly proper homotopy invariance"), dependency table rows 2619 and 2622.

**Claim.** The supported-cellular supplement and the proper Whitehead theorem of Stage 8.5 consume CharacteristicClasses C1.2a S0–S4.

**Witness.** `TauCetiRoadmap/CharacteristicClasses/README.md` at this head consumes this roadmap throughout: line 54 "AlgebraicTopology Stages2–6", lines 69–73 "C1.2a consumes ordinary AT2–4 and ordinary6.1–6.2 only. The separate AT supported-cellular supplement consumes C1.2a S0–S4 …", line 521 (S0 "consume AT6.1's single local-coefficient singular cochain complex"), 598. So S0–S4 are built on this roadmap's 6.1 cochains and handed back up. The two READMEs acknowledge the two-way supply; the dependency check prints no CYCLE line even with the abbreviations spelled out (tested on a scratch copy with `CC C1.2a` replaced by `CharacteristicClasses C1.2a`: `0 problem(s)`), so this is the brief's "two roadmaps citing each other", not a tool report. Carried silently through earlier reviews, which resolved the CharacteristicClasses citations in the consumer direction only.

**Repair.** One direction. Either state S0–S4 here (compactly supported local-coefficient cochains as the filtered colimit of the complexes vanishing off compact sets, support enlargement and cofinality, proper pullback and open extension, jointly proper homotopy invariance), as targets of the supported-cellular supplement after 6.2 with their hypotheses, and let CharacteristicClasses C1.2a consume them; or move the supported-cellular supplement and the proper Whitehead block of 8.5 to AlgebraicTopologyPartII, which is later than CharacteristicClasses, and leave the ordinary Whitehead theorem here. Record the move in both READMEs.

## R04 (P3) — Six sorried theorems are pinned Tau Ceti theorems, and a seventh is a specialization of one

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` lines 159–204 (`noRetraction_diskBoundary`, `brouwerFixedPoint_topCatDisk`, `brouwerFixedPoint_compactConvex`, `brouwerFixedPoint_compactConvex_continuousOn`, `brouwerFixedPoint_compactConvex_finiteSpan`), 309–315 (`closedCofibrationCylinderHomotopyExtension`), 342–354 (`basedHomotopyInverseOfEquivalence`).

**Witness.** Tau Ceti at the pin: `AlgebraicTopology/Singular/BrouwerFixedPoint.lean` lines 71 (`TauCeti.noRetraction_diskBoundary`, as `IsEmpty (Retract (diskBoundary n) (disk n))`, including `n = 0`), 91, 125, 140, 159 with the same statements; `Topology/Homotopy/Extension/Prod.lean` line 72 `HasHomotopyExtensionProperty.zero_one_prod_univ_union_univ_prod` with exactly the set `({0, 1} : Set I) ×ˢ univ ∪ univ ×ˢ A`. The one-tactic probe (a scratch copy importing those two modules, each `sorry` replaced by `first | (exact <native>; done) | sorry`) closes all six: the remaining `declaration uses sorry` warnings are at the other 19 theorems only. `Topology/Homotopy/Extension/HomotopyEquivRel.lean` line 166 `HasHomotopyExtensionProperty.exists_basedInverse_homotopicRel` proves the seventh for any `x₀`, `y₀` whose singletons have the homotopy extension property, with the same three conclusions; the file's version adds only that a 0-cell of a Hausdorff CW complex has that property.

**Repair.** Delete the six and the seventh from `Suggested.lean`, add `#check` pins for the native names, and in the README replace "Own the single generic no-retraction and finite-dimensional Brouwer theorem … First prove `noRetraction_diskBoundary`" (516–586), "Own `closedCofibrationCylinderHomotopyExtension`" (797–802) and "Own `basedHomotopyInverseOfEquivalence`" (870–875) by consumption of the native theorems, keeping as targets only what they lack (the radial-reach and unit-ball formulas if a consumer needs them; the 0-cell HEP lemma).

## R05 (P3) — The README plans again constructions the pinned Tau Ceti proves

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md`, the stages listed below, and `Suggested.lean` lines 77–79 (the docstring says transfer "is a chain map the roadmap builds").

**Witness.** Each is at the pin, in `TauCeti/`:

- 5.2 (1114–1115) Wang sequence: `Singular/MappingTorus/Wang.lean` lines 203–223 `TopCat.wang_exact₁`–`₃`, `Naturality.lean` 83.
- 5.3 (1116–1118, 1146–1151) transfer, `p_* ∘ transfer = d`, composition, the permutation local system of a non-regular cover and the locally constant degree over a disconnected base: `Singular/Transfer/Basic.lean` 179 `IsCoveringMap.singularTransfer`, `Degree.lean` 42 and 65, `Composition.lean` 42, `PermutationLocalSystem.lean` 207 and 301.
- 5.5 (1189–1201) fixed-interval path and mapping-path fibrations with lifting functions, homotopy fibres and the pullback description: `Topology/Homotopy/MappingPath/PathFibration.lean` 160 `isHurewiczFibration_proj`, `LiftingFunction.lean` 70 and 172, `Fiber.lean` 88, `Homotopy.lean` 208.
- 5.6–5.7 (1296–1302) the Čech double complex, its quasi-isomorphism to singular chains and the spectral sequence: `Singular/Cech/DoubleComplex.lean` 65 `openCoverSingularBicomplex`, `QuasiIso.lean` 117, `SpectralSequence.lean` 55, 112, 136.
- 6.1 (1404–1420) universal coefficients over a hereditary ring, Bockstein and the cochain Mayer–Vietoris sequence: `Cohomology/UniversalCoefficient.lean` 172 and 209, `Bockstein.lean` 127 and 278, `Cohomology/MayerVietoris/Basic.lean` 428 and `Pair.lean` 432.
- 6.2 (1424–1429) cross product and graded commutativity: `Cohomology/CrossProduct.lean` 56 and 148, `GradedCommutativity.lean` 63.
- 6.3 (1654–1690) the determinant-sign action of linear maps and charts on local generators and the comparison with `Manifold.Orientation`: `Singular/LocalHomology/Orientation/Linear.lean` 138 and 170 `localOrientation_map`, `Chart.lean` 169 `OpenPartialHomeomorph.localOrientationOfOrientedChart` and 202 `localOrientationOfManifoldOrientation`, `OpenEmbedding.lean` 73, `Transport.lean` 48.
- 4.5 (876–880) the relative cylinder CW structure: `Topology/CWComplex/Classical/Cylinder.lean` 252 `relCWComplexCylinder`, cells first and interval last as the README prescribes; (762) cellular approximation: `CellularApproximation.lean` 94 and 106.
- 4.6 (955–960) the CW structure of complex projective space with one cell in each even dimension and the hemisphere characteristic maps: `ComplexProjective.lean` 167 and 271 on `TauCeti.ComplexProjectiveSpace` (the only work left is the comparison with `Projectivization ℂ`).
- 8.2 (2041–2043, 2055–2061) the Kan/cubical comparison and the Moore comparison for simplicial abelian groups: `AlgebraicTopology/Homotopy/SingularSet.lean` 282 `TopCat.toSSetPiMulEquivHomotopyGroup`, `DoldKan/HomotopyGroups.lean` 46 `doldKanPiAddEquivHomology`.
- 8.8 (2265–2268) `H*(Bπ; A) ≅ groupCohomology`: `Cohomology/GroupCohomology.lean` 248 `singularCohomologyIsoGroupCohomology` for any quotient covering by a contractible free action, hence for the bar model once `|Eπ|` is contractible; `ClassifyingSpace/Cohomology.lean` 89 and `LocalCoefficients.lean` 150 for the Milnor model.
- 8.8d (2353–2356) the `K(A, 1)` axiom for finite `A`: `ClassifyingSpace/Torsion.lean` 73 and 91 (`isKilledBySomePower_classifyingSpace_singularHomology`), transported to the bar model by `ClassifyingSpace/Uniqueness.lean` 94 `IsEilenbergMacLaneSpaceOne.nonempty_homotopyEquiv`.
- 8.12 (2576–2583) the circle comparison: `ClassifyingSpace/Circle.lean` 122 `circleHomotopyEquivClassifyingSpace`.

**Repair.** In each place write "consume" with the native name and file, as the Inventory already does for Hurewicz and Whitehead, and keep as targets only the local-coefficient, relative or bar-model extensions the native file lacks; delete the transfer bullet from the docstring's not-statable list (the Cartan–Leray sequence stays there).

## R06 (P3) — Gate: a name of the dropped-names list

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` lines 144, 146 ("HomotopySpheres §3A consumes the compact-generation interface … no stage here consumes HomotopySpheres"), 744, 2028.

**Witness.** Gate at this head `dropped=4` with the rule "no name of the project's dropped-names list"; HomotopySpheres is on that list (the brief's "never cite" list). The four mentions are consumer statements, but the rule refuses the name.

**Repair.** Remove the name: say "a consumer" or drop the four clauses; the ownership of the coreflection, the sphere identifications and the Freudenthal theorem is stated without it.

## R07 (P3) — Edits outside the pull request's named folders

**Location.** `git diff --stat origin/main...HEAD` excluding the sixteen folders the brief names: `Completed/ArithmeticDirichletSeries/README.md` (one line) and `TauCetiRoadmap/SymplecticGeometry/README.md` (three lines); gate `outside-folder=2`. Carried from the previous review (its R06).

**Repair.** Name the two folders as the pull request's own (each then gets its review), or drop the hunks.

## R08 (P3) — A backticked name of this roadmap's own that nothing declares

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` line 988 ("an orientation-preserving homeomorphism `standardCellBallToOrderedSimplex n` from the native sup-norm cell ball to Δ^n").

**Witness.** Declared in neither `Suggested.lean`, `TopologicalGroupFundamentalGroup.lean` nor the pins (grep of the folder and of `Mathlib/`, `TauCeti/`); the gate's heuristic skips camelCase names followed by an argument. The other 22 names of the previous review's R07(a) are now prose.

**Repair.** Write it in prose ("the radial homeomorphism from the cell ball to the ordered simplex") or declare it.

## R09 (P3) — Pull-request description: unstated order with the three other open revisions of this folder

**Location.** Pull-request description, merge-order paragraph ("#1101 → #1807 → this pull request … #1808 is independent of this pull request"), unchanged since the previous review.

**Witness.** The overlap index lists #1652, #1663, #1797 and #1808 as conflicting with this head in `README.md`, `Suggested.lean` and `TopologicalGroupFundamentalGroup.lean`; #1808 is called independent although it conflicts in all three files. Carried from the previous review (its R09).

**Repair.** State which of #1652, #1663, #1797, #1808 and this pull request is rebased on which.

## Previous findings

- R01 — not repaired: DGFloer on main eaf17b10 lines 232, 470, 659 and #1798 lines 918, 1038, 1060 (R01 above).
- R02 — repaired: `exists_cwApproximation` (364), `finiteSourceMappingCWType` (685) and `basedLoopCWType` (694) are stated; weak-equivalence invariance, Künneth over a field and the all-dimension cellular comparison are native and pinned at lines 117–119 and 145–146 (`isIso_singularHomologyMap` at `Singular/Homotopy/WeakHomotopyEquivalence.lean` 110, `TopCat.singularHomologyKunnethUnitIso` at `Singular/Kunneth/Basic.lean` 326 for a semisimple ring, `cellularSingularHomologyIsoUniv` at `Cellular/Comparison.lean` 300 with the exact-colimit instance at 227); the proper Whitehead theorem is in the docstring (90–91).
- R03 — repaired: `hurewicz_degreeOne` and `hurewicz_connected` are deleted; the native `hurewiczHomologyAddEquiv` (`Hurewicz/One/Basic.lean` 705) and `hurewiczAddEquiv` (`Hurewicz/Absolute.lean` 179) are pinned; `statement-hygiene=0`.
- R04 — repaired: `finiteCWEulerCharacteristic` and the examples are gone; `TauCeti.eulerChar`, `eulerChar_eq_cwEulerChar` and `HomotopyEquiv.eulerChar_eq` are pinned (131–133) and cited at README 351–357 and 1970–1978.
- R05 — repaired: `#check isQuotientCoveringMap_iff_isCoveringMap_and` at line 116; `readme-ids-missing=0`.
- R06 — not repaired (R07 above).
- R07 — partly repaired: (a) one own name left (R08 above); (b) every one of the 57 declarations is named in the README (checked mechanically); (c) every declaration has a docstring (checked mechanically), `lemma` does not occur.
- R08 — repaired: the catalogue is gone; every remaining definition is used by a stated theorem (the pair-quotient carrier by 263 and 271, the pushout carrier by 294 and 300, the twisted carriers by 464 and 480, `LSPositiveCupProduct`/`lsCupLength` by 527, `HasProperHomotopyExtensionProperty` by 563 and 576, the bar model by 619, `OrdinaryEMModel`/`continuousHomotopyClasses`/`ordinaryEMPullback` by 674).
- R09 — not repaired (R09 above). On its second part, HomotopySpheres' ownership of the coreflection: HomotopySpheres is on the dropped-names list, so the ownership is settled here by policy and only the four mentions are a defect (R06).

## Verified sound

**Gate, depcheck, build, probe at d723ba1.** The worker's gate: FAIL on `dropped=4` and `outside-folder=2` only; every other scanner 0, `build=0`. The brief's depcheck command, run today: `depcheck: 244 roadmaps, 2461 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line; the same on the scratch copy with the CharacteristicClasses abbreviations expanded. The one-tactic probe: a scratch copy with each of the 25 theorem `sorry`s replaced by `first | (rfl; done) | (simp; done) | (infer_instance; done) | sorry` and, for the seven theorems of R04, by `first | (exact <native>; done) | sorry`, with `TauCeti.AlgebraicTopology.Singular.BrouwerFixedPoint`, `Topology.Homotopy.Extension.Prod` and `Extension.HomotopyEquivRel` built and imported, elaborated with `lake env lean` from the worktree: exit 0, no error, 19 `declaration uses sorry` warnings (lines 263, 271, 294, 300, 321, 342, 364, 464, 480, 497, 527, 537, 563, 576, 594, 619, 674, 685, 694 of the file), none of them closed by `rfl`, `simp` or `infer_instance`; the six of R04 closed by `exact`. `TopologicalGroupFundamentalGroup.lean` elaborates alone with no warning. The worker's elaborated-signature transcript lists two declarations with a binder that looks dropped (`relativeCWPushoutInclusion`, `relativeCWPushoutCarrier`); both are abbreviations whose types do not mention `T2Space`, so nothing is lost; its three errors (`by`, `supported`, `of`) are artefacts of its name extraction.

**Seeded sample (15 of the 21 readable theorem-numbered locators; five of the six not sampled are the uncertified texts).** Read at the locator in the cached texts:

| target (README or Lean line) | source line | verdict |
| --- | --- | --- |
| Hatcher Prop 4.21 (1018) | hatcher 15508–15510 | weak equivalence induces isomorphisms on H_n and H^n for all coefficient groups: as cited, and the native theorem is pinned |
| Hatcher Prop 4.22 (2106) | hatcher 15549–15550 | weak equivalence gives bijections [X,Y]→[X,Z] for CW X: the lifting/uniqueness API as stated |
| Hatcher Prop 4.30 (2324) | hatcher 15928–15929 | CW K(G,n) unique up to homotopy type: as stated |
| Hatcher Lemma 4.31 (2314) | hatcher 15931–15935 | wedge of n-spheres with (n+1)-cells, n ≥ 1, Y path-connected, every ψ on π_n realized: as stated |
| Hatcher Prop 3.29 (1904) | hatcher 10370–10371 | connected noncompact n-manifold has H_i = 0 for i ≥ n; the README takes only its route for i > m |
| Hatcher Thm 3.43 (1942) | hatcher 10976–10980 | compact R-orientable M, ∂M = A ∪ B with common boundary, cap with [M] gives H^k(M,A) ≅ H_{n−k}(M,B): the README's local-system form is stated as its own extension |
| Hatcher Prop A.3 (837) | hatcher 22617 | CW complexes are normal, hence Hausdorff: as stated |
| Hatcher Prop 2.21 (617) | hatcher 5222–5224 | small chains inclusion is a chain homotopy equivalence: as stated |
| Hatcher Example 4.14 (1043) | hatcher 15379–15383 | CW approximation of a pair by the five lemma: as stated |
| Hatcher Prop 4.13 (1037, 1041) | hatcher 15375–15378 | every space has a CW approximation; path-connected case with one 0-cell: the split between native and `exists_cwApproximation` matches |
| Hatcher Prop 0.19 (874) | hatcher 867–869 | HEP pairs, equivalence restricting to the identity on A is one rel A: applied to basepoints |
| Milnor 1959 Thm 3 (2462) | milnor1959 209–212 | A in W_n, C a compact n-ad ⇒ the function n-ad is in W_n: `finiteSourceMappingCWType` is the pair case |
| Milnor 1959 Cor 3 (Lean 692) | milnor1959 218–223 | (A,a₀) in W₂ ⇒ (Ω, ω₀) in W₂, by Theorem 4 with C = (I; ∂I): `basedLoopCWType` as stated |
| Strøm Thm 6 (800) | strom1972 181–185 | product of cofibered pairs with A closed is cofibered: the README keeps "closed A"; the native theorem (R04) has the same hypothesis |
| FTW Cor 4.9 (2200) | ftw1973 752–756 | finite-dimensional locally finite CW, simply connected and at infinity: proper f is a proper homotopy equivalence iff H_* and H_c^* isomorphisms: as stated at 2142–2146 |

**Adversarial table.** Rows marked r31/r42/r52 carry values computed at earlier heads on text unchanged since; rows marked r63 were computed today.

| statement | instances | values each side | result | round |
| --- | --- | --- | --- | --- |
| `exists_cwApproximation` | X = ∅; X two points; X the Warsaw circle | Z = ∅, f the empty map, π₀ bijective; Z two points; Z a point, π₀ and all π_n bijective, no homotopy equivalence (Whitehead needs CW type on both sides) | as stated; conclusion is weak equivalence only | r63 |
| `ordinaryPairQuotientComparison` | B = ∅, n = 0; B = X; (D², S¹), n = 2 | H₀(X,∅) = H₀(X) → H₀(X₊,{*}) = H₀(X); H_n(X,X) = 0 → H_n(pt,pt) = 0; H₂(D²,S¹) = R → H̃₂(S²) = R | as stated | r63 |
| `ordinaryPairQuotientCohomologyComparison` | same three | H⁰(X₊,{*}) = H⁰(X) → H⁰(X,∅); 0 → 0; R → R | contravariant direction matches the native pair map | r63 |
| `relativeCWPushout_t2Space`, `_base_isClosedEmbedding` | Z = pt, (D¹,S⁰); B = ∅; Z = ∅ (then B = ∅) | circle, Hausdorff, point closed; Z ⊔ Y with Z clopen; Y | as stated | r63 |
| `closedCofibrationCylinderHomotopyExtension` | A = ∅; A = X | ∂I × X; all of I × X | native theorem, same hypotheses (R04) | r63 |
| `homotopyInversePairExtension_left` | A = A′ = ∅; A = X, A′ = X′ | a left inverse of a homotopy equivalence, also a right inverse; g = g₀, H = H₀ and g₀ ∘ e ≃ id forces e ∘ g₀ ≃ id | as stated; not the native `exists_leftInverse_homotopicRel`, which needs a homeomorphism on A | r63 |
| `basedHomotopyInverseOfEquivalence` | X = Y = pt; X = Y = S¹ with the 0-cell basepoints, e = id | g = id; g = id, homotopies constant | native for HEP points (R04) | r63 |
| `compactSupportTopClass_unique` | m = 0 discrete, L arbitrary; m = 1, ℝ, K = [0,1], L = ℤ | H₀(M,M∖K;L) = ⊕_{x∈K} L_x, images the coordinates; H₁(ℝ,ℝ∖K) = ℤ → ℤ iso | determined by local images | r52 |
| `compactSupportTopClass_exists` | K = ∅; S¹ with L = ℤ, s constant; S¹ with the sign system | c = 0; the fundamental class; locally represented sections of the sign system are 0, H₁(S¹;L) = 0 | as stated | r52 |
| `poincareDuality_zmodTwo` | n = 0, two points; RP²; M = ∅ | c = (1,1), H⁰ = (ℤ/2)² → H₀ bijective; H¹ = ℤ/2 → H₁, H⁰ → H₂ = ℤ/2; 0 → 0 | as stated; compact + charted gives second countability, so no hypothesis is missing | r52, r63 |
| `LSPositiveCupProduct` degree guard | the unit 1 ∈ H⁰ admitted; excluded | 1^r ≠ 0 for every r, cup length ⊤ for every nonempty X; excluded by `0 < d` and `0 < q` | guard needed and present | r63 |
| `lsCupLength_add_one_le_categoryCount` | Sⁿ; T²; pt; X = ∅ | 1+1 ≤ 2; 2+1 ≤ 3; 0+1 ≤ 1; 0+1 ≤ 0 false | `Nonempty X` needed and present | r52, r63 |
| `homologicalWhitehead` needs simple connectivity | Poincaré sphere P → S³ | H_* iso, π₁(P) ≠ 0, not an equivalence | hypothesis needed and present | r52 |
| `HasProperHomotopyExtensionProperty.cylinderBoundary` | A = ∅ | hypothesis: proper f extends by the constant homotopy (I compact); conclusion the pair (I×X, ∂I×X) | as stated | r63 |
| `properStrongDeformationRetract_of_inverse` | A = X; A = ∅ | r = id, H constant; the inclusion ∅ → X has a proper inverse only for X = ∅ | as stated; vacuous for ∅ | r63 |
| `compactManifoldFiniteCWType` | n = 0; M = ∅; S¹ | finite set, finite CW; ∅; one 0-cell and one 1-cell | as stated (`FiniteCWType.of_discreteTopology` covers the first two) | r63 |
| `groupClassifyingSpace_isEMOne` | G = 1; G = ℤ | realization a point, aspherical, π₁ = 1; S¹, π₁ = ℤ | matches `IsAspherical ∧ Nonempty (π₁ ≃* G)` (EilenbergMacLane/Basic.lean 59, 123) | r52 |
| `OrdinaryEMModel` | S¹ for (ℤ,1); S¹ ∨ S¹ for (ℤ,1) | π₁ = ℤ, π_j = 0 for j ≥ 2; π₁ free of rank 2, no isomorphism to Multiplicative ℤ | the wrong model is excluded by `homotopyIdentification` | r63 |
| `ordinaryEMRepresentability` | X = ∅; X = pt, n ≥ 1; X = S¹, A = ℤ, n = 1 | one class = H^n(∅) = 0; [pt,K] = π₀K = 1 = H^n(pt) = 0; [S¹,K(ℤ,1)] = ℤ = H¹ | as stated (K path connected, free classes equal based ones on components) | r52, r63 |
| `finiteSourceMappingCWType` | K = ∅; K = pt | C(∅,X) = pt; C(pt,X) ≅ X | as stated | r63 |
| `basedLoopCWType` | X = pt; X = S¹ | Ω = pt; Ω S¹ ≃ ℤ discrete | as stated | r63 |
| `capProduct` degree guard | p = q; p > q | H^p ⊗ H_p → H₀; excluded by `p ≤ q`; `Nat.add_sub_of_le` gives `p + (q − p) = q` for the native `singularCap` | no junk subtraction | r52, r63 |
| 8.8b normalisation κ_bar ∘ π₁(c_G) = κ_Z | G = 1; G = ℤ | constant map; generator ↦ edge +1, inverse convention gives −1 | the law fixes c_G | r42 |
| 5.3 transfer p_*τ = d·id | d = 0; d = 2 | 0 = 0; τ(σ) = σ̃₁ + σ̃₂ | agrees with hatcher 14031 and with the native degree theorem | r42, r63 |
| 5.0 reindexing (a,b) = (1−2p−q, p−1) | (0,0); (2,1) | (1,−1); (−4,1) | agrees with E¹ | r31 |
| 5.5 multiplicative sign (−1)^(qp′) | F = pt; B = pt | +1; +1 | reduces to cup | r31 |
| 4.6 RPⁿ differential 1+(−1)^k | k = 1, 2 | 0, 2 | agrees | r31 |
| 4.6/6.1 RP² sign system | twisted d, δ | H⁰ = 0, H¹ = ℤ/2, H² = ℤ | agrees with 6.1 and 6.3 | r31 |
| 2.5 S⁰ reference class | q, −q | +1, −1, augmentation 0 | uniqueness needs both | r31 |
| 6.3 boundary conversion (−1)^m | m = 1, 2 | both −[r↑]; +1 | agrees | r31 |
| 6.5 linking symmetry | (3,1), (5,2), (7,3) | +1, −1, +1 | agrees | r31 |
| 7 Euler values | S⁰, S¹, T⁰, CP⁰ | 2, 0, 1, 1 | χ(Tⁿ) = 0 restricted to n > 0 | r31 |
| 8.8c directed union vs colimit | S¹ → S¹, z ↦ z² | indiscrete | negative example correct | r31 |
| 8.8d fixed dᵐ not a Serre class | ℤ/2 → ℤ/4 → ℤ/2 | not closed under extensions | agrees | r31 |
| 8.8d fixed-d route | A = ⊕_ℕ ℤ/d | cyclic summands d-torsion by transfer, Künneth keeps the exponent, union keeps it | route correct | r52 |
| 4.5 k(X×Y) = X×Y | X cocountable uncountable, Y = pt | kX discrete ≠ X | counterexample kept; hypotheses right | r52 |
| 8.11b suspension–loop adjunction | B = pt; B = S⁰ | ΣB = pt, 1 = 1; ΣS⁰ = S¹, based maps S¹ → Y = loops | exponential law for compact Hausdorff I | r52 |
| 1.6 π₁ abelian under unital multiplication | S¹; S¹ ∨ S¹ | ℤ; F₂ has no such multiplication | hypothesis needed; the companion file proves it, 0 warnings | r31, r63 |

**Library declarations opened at the pins (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9), file and line.** Mathlib: `isQuotientCoveringMap_iff_isCoveringMap_and` (`Topology/Covering/Quotient.lean` 339), `ObjectProperty.IsSerreClass` (`CategoryTheory/Abelian/SerreClass/Basic.lean` 45), `Projectivization.continuous_mk'` (`Topology/Algebra/Projectivization.lean` 51). Tau Ceti: the seven theorems of R04 and the native files of R05 at the lines given there; `TauCeti.CWType` (`Topology/CWComplex/Classical/CWType.lean` 38: a homotopy equivalence to a classical CW complex in a Hausdorff ambient space, so the Lean generality of `exists_cwApproximation`, `homologicalWhitehead` and `finiteSourceMappingCWType` is the README's "Hausdorff CW model"); `FiniteCWType` and its instances (`FiniteCWType.lean` 74–115); `cwComplexProd` (`Product.lean` 194, finite complexes only, so 4.5's product on `k(X × Y)` for arbitrary CW complexes is a genuine target); `IsTriangulable.finiteCWType` (`Topology/Triangulable/FiniteCWType.lean` 41; no smooth triangulation at the pin, so `compactManifoldFiniteCWType` is a genuine target through GeometricTopology Layer 11); `RelHomotopyGroup.hurewicz` (`Homotopy/Relative/Hurewicz.lean` 324), `bijective_hurewicz_of_subsingleton_homotopyGroup` and `surjective_hurewicz` (`Hurewicz/Relative.lean` 282, 199), `hurewiczHom` (`Hurewicz/Basic.lean` 652), `hurewiczAddEquiv` (`Absolute.lean` 179, universe zero), `hurewiczHomologyAddEquiv` (`One/Basic.lean` 705); `IsWeakHomotopyEquivalence.isIso_singularHomologyMap` and `isIso_twistedHomologyMap` (`Singular/Homotopy/WeakHomotopyEquivalence.lean` 110, 169); `isWeakHomotopyEquivalence_cwApproximationMap` (`CWApproximation/Basic.lean` 336, path-connected only, so `exists_cwApproximation` is a genuine target) and `cwApproximationLift` (`Naturality.lean` 84); `cellularSingularHomologyIsoUniv` (`Cellular/Comparison.lean` 300) and the exact-colimit instance (227); `singularHomologyKunnethUnitIso` (`Kunneth/Basic.lean` 326) and `singularHomologyKunnethShortComplex` (`Sequence.lean` 201); `ModuleTower.shift`, `limOne`, `shift_surjective`, `subsingleton_limOne_of_isMittagLeffler` (pinned, elaborated in the probe log); `LSCategoricalCover`, `lsCategoryCount`, `lsCategoryCount_le_of_homotopic_id` (`LusternikSchnirelmann.lean` 84 and the pinned signatures); `exists_localHomologyRestriction_eq_of_isCompact`, `localHomology_ext_of_isCompact` (`LocalHomology/Compact.lean` 294, 259), `HomologicalOrientation` (`Orientation/Homological.lean` 75), `fundamentalClass` (`FundamentalClass.lean` 204); `HasProperHomotopyInverse` (`Topology/Homotopy/Proper.lean` 41, no proper strong deformation retraction there, so 8.5's rectification is a genuine target); `SimplyConnectedAtInfinity`; `IsEilenbergMacLaneSpaceOne`, `IsAspherical` (`EilenbergMacLane/Basic.lean` 123, 59); `classifyingSpace` (`ClassifyingSpace/Basic.lean` 73, Milnor's join; no nerve model at the pin, so `groupClassifyingSpace_isEMOne` is a genuine target); `singularCap` (`Cohomology/Cap/Basic.lean` 101, degrees `p + q = n`); `AddCommGrpCat.isTorsion`, `isKilledBySomePower` (`SerreClass/Torsion.lean` 41, `PowerTorsion.lean` 33, 44). Every other backticked library name of the README (313 backticked spans) resolves by its last component at the pins (checked mechanically; `mayerVietoris_exact₁` is `TopCat.mayerVietoris_exact₁` of `Singular/MayerVietoris/Basic.lean`).

**Cross-roadmap citations resolved today.** DGFloer on main eaf17b10 lines 232, 462, 470, 659 and #1798 lines 153, 918, 1038, 1060, 1218, 1328 (R01); CharacteristicClasses at this head lines 54, 69–73, 514, 521, 598 (R03); ClassifyingSpaces at this head lines 20, 69, 100–107 (consumes Stage 8 item 8a's nerve model, owns the comparison, as this README says at 94–102); MorseNovikov at this head line 406 (consumes "Stage 8 item 3"); GeneralizedCohomology G2.1, G2.10, G5; TopologicalKTheory T1.5, T1.6, T7.0; ComplexKahlerGeometry K7, K8; MorseTheory M2, M4, M5; RiemannianGeometry R3, R4.7; AffineMorseLefschetz A4, A4.0; SmoothBundlesConnections B6.1; BanachAlgebras A8; GeometricTopology Layer 11 (triangulations) and its collar theorem; DifferentialGeometry Layer 2 and 10.5; UniversalCovers (Completed); ProfiniteCohomology; HeegaardFloer's outward-first boundary orientation: each exists on main. CStarClassification, DeRhamCohomologyAndDuality and FourManifolds have no folder on main and are named here only as consumers. HomotopySpheres #1287 (lines 146–147, 320–322, 434, 859) still owns the coreflection; the name is on the dropped-names list (R06).

**Ownership against open pull requests.** Checked by object for what this head states: the compact-generation coreflection (HomotopySpheres, settled by the dropped-names policy); the Serre and Eilenberg–MacLane machinery (DGFloer, R01); the compact-support cochain foundations (CharacteristicClasses C1.2a, R03); the nerve/bar model and its comparison (ClassifyingSpaces in this pull request, one owner each side); Lusternik–Schnirelmann cup length, the proper-homotopy predicates, the pair-quotient carrier, the relative CW pushout, the `K(A,n)` record and representability: no second owner among the sibling checkouts. The four other revisions of this folder (#1652, #1663, #1797, #1808) were read only through the overlap index (R09). StableHomotopyKTheory (#1227), nearest in vocabulary, is not given with its files and was not checked.

**Headlines.** Stated: Brouwer (native, R04), pair quotients and pushouts, CW approximation, the local-coefficient compact-support theorem, ℤ/2 Poincaré duality, the cup-length bound, homological Whitehead, proper rectification, finite CW type of compact manifolds, the bar `K(π,1)`, representability, mapping-space CW type. Native and pinned: Hurewicz (three forms), Whitehead, weak-equivalence invariance, cellular comparison, Künneth over a field, Euler characteristic, towers, LS count. Not statable, correctly named: Serre and Cartan–Leray spectral sequences, the cellular chain comparison with local coefficients, integral and twisted duality, the obstruction class, the `K(A,n)` family and the loop comparison, the proper Whitehead theorem. Wrongly named as not statable: the two of R02. The homology-sphere corollary of 8.7 and bundle Euler multiplicativity of 7.2 are corollaries of stated or native theorems and are left to the README, as in the two other open revisions of this folder.

**Shape.** The README keeps the Stage form it has on main rather than the Layer/`**Checks.**` shape; like the earlier reviews of this decycling pull request, this one does not ask the pull request to recast it. `Suggested.lean` has the module header, a single `public import Mathlib` plus existing `TauCeti.*` modules, one module docstring, `theorem` only, a docstring on every declaration, `#check` only on library names, no `set_option`, no sorry'd data. `TopologicalGroupFundamentalGroup.lean` is fully proved and its eight names (437–443) are declared.

## Not verifiable

- tom Dieck 9.5.1 (README 1021, 2727), Weibel 5.5.1(2) and 5.5.10 (1077, 1090), Milnor *Morse Theory* 3.6–3.7 (796), Serre 1953 Theorem 1 (2370), Freedman–Quinn §7.7 (2127), Lee, Thom 1954: settled as uncertified in the manifest; not in today's sample.
- Hatcher, *Vector Bundles and K-Theory*, Section 3.3 (README 2595): not in the manifest; cited for the section-obstruction route only.
- Milnor 1959 Theorem 4 (README 2462): the cached text refers to it at milnor1959 lines 181 and 221 but its statement is not findable by its label in the recognised text; Theorem 3 and Corollary 3 were read.

## Source issues

- none
