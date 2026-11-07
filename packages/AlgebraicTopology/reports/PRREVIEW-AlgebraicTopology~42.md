# Review of AlgebraicTopology (pull request #1854 at 5c83375)

**Verdict:** needs changes

Full review. This pull request carries the AlgebraicTopology folder of #1807 (the ownership moves of the Serre and Eilenberg–MacLane machinery, CPⁿ's cell structure and the degree-one Hurewicz theorem into this roadmap) plus one further change, commit 8d836d80: Stage 8.8b now owns only the bar model's normalized pointed interface, and the identity-on-π₁ comparison with the Milnor and presentation models is ClassifyingSpaces'. Against the head the previous review read (925dc8b of #1808, whose AlgebraicTopology folder is byte-identical to #1807's), `TauCetiRoadmap/AlgebraicTopology/README.md` differs by that one 8.8b passage (54 insertions, 41 deletions at lines 93–101, 2057–2076 and the table row at 2425); `Suggested.lean` and the seven companion `.lean` files are unchanged from main. Every finding of the previous review is checked again below at this head; two are partly repaired by the pull request's own commits, the rest stand, and two findings are new (the gate's statement-hygiene hits, which no earlier review itemised, and the unstated order with the two other open pull requests that rewrite this README).

## R01 (P2) — Two owners of the ordinary Serre and Eilenberg–MacLane machinery: this folder and DGFloer on main

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` lines 102–120 ("The ordinary Serre and Eilenberg–MacLane machinery is owned here. Stage 4.8 owns … Stage 5.0 owns … Stage 5.5 owns … Stage 8.8c owns … Stage 8.8d owns … DGFloer Layer 1 consumes these ordinary targets"), the items at lines 882–910 (4.8), 926–962 (5.0), 1017–1148 (5.5), 2099–2186 (8.8c–8.8d).

**Claim.** These targets are owned by AlgebraicTopology and DGFloer Layer 1 consumes them.

**Witness.** `TauCetiRoadmap/DGFloer/README.md` on main today (eaf17b10) still builds the same objects as its own: Layer 1 item 1 "Hurewicz in degree one" (line 453), item 2 "Weak equivalences and CW approximation" with `connectedMapHomologyComparison` (470–475), item 3 the filtered-complex spectral sequence and item 4 "Serre classes and Hurewicz modulo a class" with the K(A,n) family (659–699); its coordination paragraph states the opposite direction of supply at line 232: "AlgebraicTopology Stage 5.5 and GeneralizedCohomology consume these targets". DGFloer's open revision #1798 (head a3913c8f) keeps them too: §1.2 "Weak equivalences, CW approximation, Serre fibrations and their spectral sequences" (line 620) and line 703 "the spectral sequence consumed by AlgebraicTopology Stage 5.5 under the name …". DGFloer also consumes this roadmap (main lines 188, 1584: Stage 4.4's suspension comparisons), so the two READMEs cite each other. The pull request does not touch the DGFloer folder.

**Repair.** The AlgebraicTopology side is done (see Previous findings). Complete the move on the supplier side: DGFloer's README cites Stages 4.8, 5.0, 5.5, 8.3, 8.8c and 8.8d instead of building Layer 1 items 1–4, and line 232 states the direction this README states; either in this pull request (which then names DGFloer among its folders) or in DGFloer's own revision with the merge order stated. Until then the roadmap plans again what DGFloer on main plans.

## R02 (P1) — Dependency cycle reported by the gate

**Location.** Depcheck at this head: `CYCLE among: AlgebraicTopology, HilbertModules, HomotopySpheres, IndexTheory, OperatorKTheory, StringOrientation, TangentialBordism`. README citations of HomotopySpheres §3A.1/§3A.2/§3A as supplier at lines 123–127, 581–582, 585–589, 783, 2305, 2329, 2366–2369 and table rows 2412, 2430, 2431. *Predates the pull request.*

**Claim.** The roadmap's suppliers are earlier in the merge order.

**Witness.** HomotopySpheres at its open head (#1287, 52ebd6f8) consumes this roadmap: line 680 "*Needs:* 3A.1; AlgebraicTopology Stage 4.5 cofibrations and contractible collapse, and Stage 8 relative homotopy", line 737 "AlgebraicTopology Stage 4.4 raw sphere suspension", lines 812, 822, 1390. Its §3A.1 (lines 663–675) packages `TopologicalSpace.compactlyGenerated` as the right adjoint `k` with its counit and the CW/locally compact comparisons, exactly what lines 581, 783 and 2305 here consume. The depcheck command of the brief, run at this head, prints the cycle line verbatim (`depcheck: 239 roadmaps, 2355 edges, 2 problem(s)`).

**Repair.** The consumed notions move down. Let Stage 4.5 own the compact-generation interface it uses (the coreflection `k` as right adjoint to the inclusion on native `UCompactlyGeneratedSpace` and `TopologicalSpace.compactlyGenerated`, Mathlib `Topology/Compactness/CompactlyGeneratedSpace.lean` lines 68 and 91, its counit, the CW comparison, `k(X×Y)` as the product and the interval-product comparison), delete the §3A.1 citations at lines 123–127, 581–582, 783, 2305 and the three table rows, state the pointed suspension–loop adjunction used by 8.11b (lines 2366–2369) on the native fixed-interval loop carrier inside 8.11b or move that comparison to AlgebraicTopologyPartII, and drop the §3A.2 consumer-supplier sentences at 584–589 and 2329. HomotopySpheres then remains a consumer only.

## R03 (P2) — Upward supplier: an on-main roadmap citing an open pull request

**Location.** Depcheck at this head: `UPWARD: AlgebraicTopology (on main) -> HomotopySpheres (#65) at README lines [2412, 2430, 2431]`; README lines 123 and 125 cite HomotopySpheres through a GitHub pull-request link (`…/pull/284`). *Predates the pull request.*

**Claim.** HomotopySpheres §3A.1/§3A.2 supply Stages 4.4, 4.5, 8.10, 8.11a and 8.11b.

**Witness.** HomotopySpheres is an open pull request (merge-order line 66); AlgebraicTopology is on main, so every supplier citation of it is upward whatever the order. Cross-roadmap citations are by roadmap name and section, never by pull-request number or link.

**Repair.** The repair of R02 removes the edges; replace the two `pull/284` links at lines 123 and 125 by the roadmap name and section.

## R04 (P2) — `set_option` in `Suggested.lean`

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` line 910: `set_option maxHeartbeats 800000 in` before `compactSupportTopClass_existsUnique`. *Predates the pull request.*

**Claim.** The acceptance file elaborates under the defaults.

**Witness.** Gate at this head `set_option=1`; the principles make any `set_option` a blocking finding.

**Repair.** Split the existence and the uniqueness statements and name the local section's carrier once with an `abbrev`, so that each part elaborates without the override.

## R05 (P2) — Sorry'd data in `Suggested.lean`

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean`: the gate counts 69 `def`/`abbrev`/`instance` declarations whose body is `sorry`, starting at line 160 `cellularToSingular`, 180 `finiteCoverTransfer`, 230 `regularDeckSingularComplex`, 293 `cartanLeraySpectralSequence`, 486 `chartAt`, 576 `orientationLocalSystem`, 955 `poincareDualityMap`, 1055 `relativeHomotopyGroup`, and on through the relative-homotopy, CW-type, cubical-sphere and Eilenberg–MacLane blocks. *Predates the pull request.*

**Claim.** `Suggested.lean` states headline theorems with only the simple definitions they need.

**Witness.** Gate `sorry-data=69`; every theorem whose statement mentions one of these (`relativeHurewicz_iso` on `relativeHomotopyGroup`, the `poincareDuality_*` theorems on `poincareDualityMap`, the `cartanLeray_*` theorems) is a statement about an unspecified object.

**Repair.** Delete every sorry'd `def`/`abbrev`/`instance` and every declaration that mentions one (the README already carries each as a target with its intended signature). Keep the definitions with real bodies (`ordinaryDoldKanSimplicialModel`, `ordinaryDoldKanLabeledSimplex`, `OrdinaryEMModel`, `NormalizedAbelianEMFamily`, `SimplyConnectedAtInfinity`, `LSCategoricalCover`, the Brouwer statements on native carriers) and the headlines statable on native carriers (Hurewicz and Whitehead are native at the pin; Poincaré duality with two-torsion coefficients is statable through `TopCat.singularCap`, `Cohomology/Cap/Basic.lean` line 101, existentially over the fundamental class; ordinary representability on `OrdinaryEMModel`); name in the module docstring the headlines that are not statable (Serre spectral sequence with its monodromy system, Cartan–Leray, Hurewicz modulo a Serre class, the relative obstruction class with local coefficients).

## R06 (P3) — Build warnings the gate counts

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` line 1 (`import Mathlib` without the module header) and line 486 (`chartAt` declares `[IsManifold I ∞ M]` twice). *Predates the pull request.*

**Witness.** Gate `build=3` (twice "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`", and the `linter.overlappingInstances` warning at 486:18). My run of `lake env lean` on the file at this head: exit 0, 215 `declaration uses sorry`, the overlapping-instance warning at 486:18, the five `#check` outputs, nothing else.

**Repair.** Header `module`, `public import Mathlib` and the `TauCeti.*` imports as `public import`, then `@[expose] public section`; delete the second `[IsManifold I ∞ M]` binder of `chartAt`.

## R07 (P3) — `Suggested.lean` disagrees with the README after the ownership move

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` line 1259 ("The abelian model is supplied by DGFloer"), lines 1330–1332 ("The definitive DGFloer constructor pins its spaces to bar in degree one and Dold–Kan in higher degree; this interface records its normalized maps without adding a constructor in AT"), and `section SimplyConnectedObstructions` at lines 1787–1881 with `[Nontrivial (Fin n)]` at 1792.

**Claim.** README 8.8c (lines 2099–2162) owns the family `ordinaryEilenbergMacLaneFamily` with its Dold–Kan models; README 8.9 (lines 2187–2227) states the obstruction cochain for n ≥ 1 and a path-connected Y on which π₁Y acts trivially on π_nY.

**Witness.** The two docstrings name DGFloer as the supplier of the object the README now owns; the Lean 8.9 block is stated only for simply connected Y and n ≥ 2, narrower than the README; the module docstring (lines 26–31) names no headline as not statable.

**Repair.** Rewrite the two docstrings to say the family is this roadmap's 8.8c target; either state 8.9 at the README's generality (not statable at the pin without a native π₁-action on π_n, in which case the docstring says so) or narrow README 8.9's Lean names to the simply connected case explicitly; list in the module docstring every headline not statable at the pins.

## R08 (P3) — TeX-only syntax outside a code span

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` line 1400: `C_c^{cell,n}(X,A;ℤ)`. *Predates the pull request.*

**Witness.** Gate `tex=1` at this head.

**Repair.** Write it as a code span, `` `C_c^cell,n(X,A;ℤ)` ``, or in words ("the compactly supported cellular n-cochains of (X,A)").

## R09 (P3) — Backticked own names that `Suggested.lean` does not declare

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` line 392 (`coordinateCubeReferenceChain_eq_shuffle`) and line 984 (`isQuotientCoveringMap_iff_isCoveringMap_and`), both flagged by the gate; and the further own names the earlier reviews listed (for example `basedHomotopyInverseOfEquivalence` at 756, `basedLoopCWType` at 2265 and 2303, `cwProductKelley` at 767 and 1874, `groupCohomologyCup` at 2096, `ordinaryEMLoopComparison` at 2308, `ordinaryCohomologySuspension` at 2317 and 2339), none declared in the folder's `.lean` files.

**Witness.** Gate `readme-ids-missing=2`; the gate's rule: a backticked own name is a claim that `Suggested.lean` declares it. The second name is Mathlib's: `isQuotientCoveringMap_iff_isCoveringMap_and`, `Mathlib/Topology/Covering/Quotient.lean` line 339, on the structure `IsQuotientCoveringMap` of line 39 (the previous review placed it in Tau Ceti; it is in Mathlib at the pin).

**Repair.** State each fact in prose without the name, or, for the few that are headlines, declare them; at line 984 write "Mathlib's `isQuotientCoveringMap_iff_isCoveringMap_and` (`Topology/Covering/Quotient.lean`)" so that the citation is a library citation and not an own name.

## R10 (P3) — Edits outside the pull request's named folders

**Location.** `git diff --stat origin/main...HEAD` excluding the sixteen folders the brief names: `Completed/ArithmeticDirichletSeries/README.md` (one line) and `TauCetiRoadmap/SymplecticGeometry/README.md` (one line); gate `outside-folder=2`.

**Witness.** Neither folder is among the pull request's own as the brief lists them. The description does announce both edits (the ArithmeticDirichletSeries → LFunctions and SymplecticGeometry → DGFloer cuts), so the defect is the folder list, not the hunks.

**Repair.** Have the pull request name those two folders as its own (each then gets its review), or drop the two hunks.

## R11 (P3) — Cited works missing from the References

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` line 885 ("tom Dieck 9.5.1"), line 2178 ("Serre 1953, Theorem 1"), line 1947 ("FQ7.7", the only occurrence), line 685 ("Milnor Lemmas 3.6–3.7"), line 689 ("Strøm's product theorem"); `## References` lines 2501–2522.

**Witness.** None of tom Dieck, Serre 1953, Freedman–Quinn, Strøm or Milnor's *Morse Theory* (the listed Milnor 1959 paper has Theorems 1–4 only) is in the References; "FQ" is never expanded. The manifest now records all five (tom Dieck, Serre 1953, Freedman–Quinn and Milnor 1963 as uncertified; Strøm 1972 fetched), so only the README list is open.

**Repair.** Add the five works to `## References` with the locators used (Strøm, *Note on cofibrations II*, Math. Scand. 22 (1968), Theorem 6; Milnor, *Morse Theory*, Lemmas 3.6–3.7; Freedman–Quinn, *Topology of 4-Manifolds*, §7.7 (not FQ7.7); tom Dieck, *Algebraic Topology*, 9.5.1; Serre 1953, Theorem 1), and expand "FQ" at first use.

## R12 (P3) — A compact-generation target without its hypotheses

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` lines 797–799: "k(X×Y) is the product in the compactly generated category with the same compact subsets as X×Y, k(X×Y)=X×Y when either factor is locally compact".

**Claim.** For spaces X, Y with one factor locally compact, `k(X×Y) = X×Y`.

**Witness.** X an uncountable set with the cocountable topology, Y a point: every compact subset of X is finite, so kX is discrete while X is not; Y is compact, yet k(X×Y) = kX ≠ X = X×Y.

**Repair.** Quantify: for compactly generated X and Y, `k(X×Y)` is their product in the compactly generated category; `k(X×Y)=X×Y` when X is compactly generated and Y is locally compact Hausdorff (and symmetrically). The CW case at line 781 (Hatcher Theorem A.6, hatcher line 22693) already carries the right hypotheses.

## R13 (P3) — The route to the K(A,1) axiom does not reach the fixed-d Serre class

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` lines 2169–2172: transfer on 8.8a's finite covering plus 8.8c's directed-union property, for "the groups annihilated by some power of d".

**Witness.** A = ⊕_ℕ ℤ/d: its finite subgroups (ℤ/d)^i have order d^i, so transfer gives annihilation of `H̃_*(K((ℤ/d)^i,1))` only by d^i, and the colimit inherits no uniform exponent. The statement is true by Prüfer's decomposition of a bounded abelian group and Künneth on finite sums, not by the route written; for the torsion class the written route suffices.

**Repair.** State the fixed-d route through Prüfer and Künneth (or the exponent of the bar complex), keeping transfer plus directed union for the torsion class only.

## R14 (P3) — Stage 4.6 rebuilds a projectivization topology that is native at the pin

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` lines 280–288 (the "absent" `Projectivization` topology API, cited through a mathlib4 pull-request link) and 821–824 ("Own #44117's generic quotient topology on native `Projectivization 𝕜 V`"). *Predates the pull request*, made stale by the pin bump.

**Witness.** Mathlib at the pin has `Mathlib/Topology/Algebra/Projectivization.lean` with `instTopologicalSpace` (line 44), `isQuotientMap_mk'` (47), `continuous_mk'` (51), `continuous_iff` (56), `continuous_mk` (61), `continuous_map` (71), `isOpenMap_mk'` (79), `isOpenQuotientMap_mk'` (83); Tau Ceti at the pin adds `instSecondCountableTopology`, `instT2Space`, `instCompactSpace`, `instPathConnectedSpace` and the affine charts in `TauCeti/Topology/Algebra/Projectivization.lean` lines 90–311.

**Repair.** Cite these natives in the Inventory and in 4.6; keep in 4.6 only the real projective manifold structure, the CW structure and the sign system; drop the pull-request link.

## R15 (P3) — Companion Lean files import another roadmap's module and carry `set_option`

**Location.** `TauCetiRoadmap/AlgebraicTopology/OrientationComparison.lean` lines 1–3 and 14–15, `GeneralModelOrientation.lean` lines 1–3, `CompactOrientationLaws.lean` 1–3 and 14–15, `BoundaryInteriorComparison.lean` 1–2 and 15–16, `ChartSimplexLocalImage.lean` 1, `BoundaryCarrierOrientation.lean` 1–2; `TopologicalGroupFundamentalGroup.lean` lines 1–4. *Predates the pull request.*

**Witness.** At this head the six orientation files import `TauCetiRoadmap.AlgebraicTopology.Suggested`, two of them `TauCetiRoadmap.DifferentialGeometry.Suggested`, three set `maxHeartbeats`/`synthInstance.maxHeartbeats`, and they carry 42 `sorry`s between them; `TopologicalGroupFundamentalGroup.lean` imports four `Mathlib.*` submodules instead of the single `import Mathlib`. The Lean form rules apply to each `.lean` file of the folder, and the deletions of R05 break their build.

**Repair.** Fold the statements they carry into the README (Stage 6.3 already describes each) and delete the six orientation files; keep `TopologicalGroupFundamentalGroup.lean` only with a single `import Mathlib` header.

## R16 (P3) — Statement-hygiene hits of the gate

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean`: `letI` in the signatures of `RegularDeckAction.isQuotientCoveringMap` (208), `isManifold` (509), `valContMDiff` (517–518), `isLocalDiffeomorph_val` (527–528), `mfderiv_val` (536–537), `boundaryless` (546) and the def `simplicialRealizationCellEquiv` (1274); `eqToHom` in the conclusions of `ordinaryEilenbergMacLaneFamily_one_point` (1386), `_one_identification` (1396), `_higher_point` (1409), `_higher_identification` (1548), `sphereSmashHomeomorph_assoc` (2181), `_unit_left` (2191), `_unit_right` (2197), `sphereFactorInterchangePairMap_referenceClass` (2226); `Classical.choose` in the def `nativeSphereReferenceComparisonUnit` (2296) and `Classical.arbitrary` in `nativeSphereZeroPole` (2307). *Predates the pull request.*

**Witness.** Gate `statement-hygiene=22`, each hit P3 with the repair it names.

**Repair.** Use instance binders or named instances instead of `letI`; restate the eight conclusions without transport (equalities of elements after a stated isomorphism, or equalities of the maps' components); define the two chosen data through a universal property or take them as arguments. Most of these declarations disappear under R05 anyway.

## R17 (P3) — Two other open pull requests rewrite this README with no stated order

**Location.** Pull request description, merge-order paragraph ("#1101 → #1807 → this pull request … #1808 is independent").

**Witness.** The overlap index lists #1652 (AlgebraicTopology: compact Čech pairs and relative cup modules, head 61ee7a2) and #1663 (intersections, representatives and a Whitehead counterexample, head 8029fe9) as conflicting with this head in `TauCetiRoadmap/AlgebraicTopology/README.md`, `Suggested.lean`, `GeneralModelOrientation.lean` and `TopologicalGroupFundamentalGroup.lean`. Read at their heads, #1652's README differs from main's in 2515 lines and from this head's in 2989; #1663's in 990 and 1538. Neither is named in the merge-order paragraph.

**Repair.** State which of the three is rebased on which before any merges (this pull request's README-only cut rebases cleanly on either), and do not restate what the earlier one already changes.

## Previous findings

- R01 — partly repaired: the AlgebraicTopology side is done at this head (line 114–116 "Stage 8.3 owns the degree-one Hurewicz isomorphism … Stage 8.10 consumes … that degree-one isomorphism", 8.3 at lines 1911–1917 owns it with Hatcher 2A.1, table row 8.10 at 2429 cites 8.3; MorseNovikov in this pull request consumes AT8.3 at its lines 161 and 406); the DGFloer side is not: DGFloer on main (eaf17b10) still builds Layer 1 items 1–4 (lines 453–699) and line 232 states the opposite direction.
- R02 — not repaired: depcheck at this head prints the same CYCLE line; HomotopySpheres §3A citations at lines 123–127, 581, 783, 2305, 2329, 2368 and table rows 2412, 2430, 2431.
- R03 — not repaired: the same UPWARD line; `pull/284` links at lines 123 and 125.
- R04 — not repaired: `set_option maxHeartbeats 800000 in` at `Suggested.lean` line 910.
- R05 — not repaired: gate `sorry-data=69`, first at line 160 `cellularToSingular`.
- R06 — not repaired: `import Mathlib` without `module` at line 1; duplicate `[IsManifold I ∞ M]` at line 486, warning reproduced by my elaboration.
- R07 — not repaired: docstrings at lines 1259 and 1330–1332 still name DGFloer as supplier; `[Nontrivial (Fin n)]` at 1792.
- R08 — not repaired: `C_c^{cell,n}(X,A;ℤ)` at README line 1400.
- R09 — not repaired: `coordinateCubeReferenceChain_eq_shuffle` at line 392, `isQuotientCoveringMap_iff_isCoveringMap_and` at line 984, flagged by the gate.
- R10 — not repaired: the two one-line hunks in `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md` are still in the diff against main.
- R11 — partly repaired: the manifest now records tom Dieck, Serre 1953, Freedman–Quinn, Milnor 1963 and Weibel as uncertified and Strøm 1972 as fetched; the README's References (lines 2501–2522) still lack the five works and "FQ" is still unexpanded at 1947.
- R12 — not repaired: lines 797–799 unchanged.
- R13 — not repaired: lines 2169–2172 unchanged.
- R14 — not repaired: lines 280–288 and 821–824 unchanged.
- R15 — not repaired: the six orientation files still import the roadmap modules and set heartbeats; `TopologicalGroupFundamentalGroup.lean` still imports `Mathlib.*` submodules.

## Verified sound

**The change since the previous head.** `git diff 925dc8b HEAD -- TauCetiRoadmap/AlgebraicTopology` is the single commit 8d836d80: the Ownership bullet at lines 93–101, the 8.8b paragraph at 2057–2076 and the table row at 2425. Its content was resolved on both sides. ClassifyingSpaces at this pull request's head says the same thing in the other direction: lines 100–107 "the nerve model of the classifying space with its `K(G, 1)` property and its identification of `π₁` (its Stage 8 item 8a) … the comparison of its nerve model with the models here is owned here, not there", and its item at lines 376–388 constructs the normalized `c_G` from the nerve model to its two models, *Needs:* "AlgebraicTopology Stage 8 item 8a". No stage of this README cites ClassifyingSpaces as a supplier any more (occurrences: lines 93 and 2072, both consumer statements), and the gate's depcheck no longer lists an edge to it. CharacteristicClasses in this pull request (lines 64, 733, 753) consumes "AT8.8b's normalized ℤ/2 model", which the new 8.8b supplies as `c_{ℤ/2}` for any Hausdorff CW K(ℤ/2,1) with a chosen κ_Z. The 8.8b paragraph's own claims: the mapping bijection `[X,Bπ]_* ≃ Hom(π₁X,π)` of line 2079 applies to Z (connected, since a K(G,1)), so `c_G` exists with `κ_bar ∘ π₁(c_G) = κ_Z`; it induces an isomorphism on π₁ and the zero map on all higher groups of both sides, hence is a weak equivalence; 8.5 (Whitehead for Hausdorff CW complexes) with 4.5's based inverse gives the pointed homotopy equivalence; the pointed inverse is unique up to pointed homotopy because post-composition with the pointed homotopy equivalence `c_G` is a bijection `[Bπ,Z]_* → [Bπ,Bπ]_*`. One remark that needs no change: 4.5's `basedHomotopyInverseOfEquivalence` (line 756) asks for 0-cell basepoints, and 8.8b's basepoint of Z is any point of a CW complex; every point of a CW complex is a nondegenerate basepoint, so the statement holds as written.

**Gate, depcheck and build at 5c83375.** The worker's gate: FAIL on set_option=1, tex=1, sorry-data=69, statement-hygiene=22, readme-ids-missing=2, depcheck=2, outside-folder=2, build=3. Depcheck output of the brief's command, verbatim:

```
UPWARD: AlgebraicTopology (on main) -> HomotopySpheres (#65) at README lines [2412, 2430, 2431]
CYCLE among: AlgebraicTopology, HilbertModules, HomotopySpheres, IndexTheory, OperatorKTheory, StringOrientation, TangentialBordism
depcheck: 239 roadmaps, 2355 edges, 2 problem(s)
```

`lake env lean TauCetiRoadmap/AlgebraicTopology/Suggested.lean` from the worktree today: exit 0; 215 `declaration uses sorry` warnings; the overlapping-instance warning at 486:18; the five `#check` outputs; no error. The file is 2887 lines, byte-identical to main's; the pins are those of the previous review (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9, `lake-manifest.json` unchanged by the pull request). The worker's signature transcript lists 10 declarations with a binder that looks dropped; all 10 lie in the sorry'd-data blocks that R05 deletes, so no separate finding.

**Padding probe, re-run today.** A scratch copy with each of the 203 standalone `  sorry` proof lines replaced by `first | (rfl; done) | (simp; done) | (infer_instance; done) | sorry`, elaborated the same way: 0 errors and still 215 `declaration uses sorry`, so no theorem closes by one tactic. No padding finding.

**Seeded sample (15 targets, seed 1854042 over the 26 theorem-numbered locators of the README).** Read at the locator in the cached texts:

| target (README line) | source line | verdict |
| --- | --- | --- |
| Hatcher Thm 2A.1 (1914) | hatcher 7230–7233 | path-connected X, kernel the commutator subgroup, iso from the abelianisation: as stated |
| Hatcher Lemma 4.6 (904) | hatcher 15116–15122 | compression needs π_n(Y,B)=0 for each n with an n-cell in X−A and B≠∅; the README's "n-connected pair, cells of dimension at most n" implies both |
| Hatcher Prop 4.18 (907) | hatcher 15454–15460 | maps between n-connected CW models, unique up to homotopy rel A: as stated |
| Hatcher Lemma 4.31 (2132) | hatcher 15931–15935 | wedge of n-spheres with (n+1)-cells, n≥1, Y path-connected, every ψ on π_n realised: as stated |
| Hatcher Prop A.3 (725) | hatcher 22617–22619 | CW complexes normal, hence Hausdorff, by the N_ε construction: as stated |
| Hatcher Prop 3.29 (1737) | hatcher 10370–10376 | source: connected noncompact, H_i=0 for i≥n; the README takes only the i>n part of the route, which uses Lemma 3.27 and no noncompactness: as stated |
| Hatcher §3.G transfer (1167, 978) | hatcher 14023–14031 | τ sums the n lifts, π♯τ = n: as stated |
| FTW Thm 4.2 (1998) | ftw1973 600–607, dual defined 575–579 | finite-dimensional, countably based, locally finite, C and its finite-support dual acyclic ⇒ locally finite contraction; the README's "finite-support dual C∨" is FTW's C* of lines 575–579 |
| FTW Lemma 4.3 (2010) | ftw1973 610–614 | neighbourhood-of-infinity filling lemma: as stated at lines 2004–2010 |
| Strøm product theorem (689) | strom1972 181–185 (Theorem 6) | (X,A)×(Y,B) cofibered when A is closed: the README keeps "closed A" |
| Brown Chapters 6–7 (336) | brown 85–93 (contents), 9424–9447 (6.7.2 and its proof) | 6.7.2 is the groupoid van Kampen for a set A representative in each piece; its proof's topological part is the subdivision argument the README describes; Chapter 7 is cofibrations |
| tom Dieck 9.5.1 (885) | — | not verifiable (below) |
| Weibel 5.5.1(2) (940) | — | not verifiable |
| Weibel 5.5.10 (953) | — | not verifiable |
| Milnor, *Morse Theory*, 3.6–3.7 (685) | — | not verifiable |

**Adversarial table.** Rows marked r31 are carried from the review at 0439c6d with the values computed there; the statements and the Lean are unchanged since. Rows marked r42 were computed today.

| statement | instances | values each side | result | source |
| --- | --- | --- | --- | --- |
| 8.8b normalisation κ_bar∘π₁(c_G)=κ_Z | G=1: Z contractible; G=ℤ: Z=S¹, κ_Z(generator)=1 | G=1: Bπ a point, c_G the constant map, unique; G=ℤ: π₁(c_G)=κ_bar⁻¹κ_Z sends the generator to the edge labelled +1; the inverse convention would send it to the edge labelled −1, degree −1 | the law fixes c_G; agrees with 8.12's edge +1 ↦ t↦t mod ℤ | r42 |
| 8.8b pointed inverse unique up to pointed homotopy | d, d′ two pointed inverses | c_G∘d ≃_* id ≃_* c_G∘d′; post-composition with c_G bijective on [Bπ,Z]_* ⇒ d ≃_* d′ | as stated | r42 |
| 8.8b c_G a weak equivalence | π_k, k≥2 | 0 = 0 on both sides; π₁: κ_bar⁻¹κ_Z an isomorphism; π₀: both singletons | weak equivalence, Whitehead applies | r42 |
| 5.3 transfer p_*τ = d·id | d=0: E=∅ over nonempty B; d=2: S¹→S¹ | τ=0, p_*τ=0=0·id; τ(σ)=σ̃₁+σ̃₂, p_*τ(σ)=2σ | agrees with hatcher 14031 | r42 |
| 4.8 compression (Hatcher 4.6) hypotheses | (X,A) with one 2-cell, (Y,B) 1-connected but π₂(Y,B)≠0 | compression can fail: the README asks n-connected with cells ≤ n, so n=2 here and π₂=0 is required | hypotheses match the source | r42 |
| 6.3 H_i(U;L)=0 for i>m (route of 3.29) | U=Sᵐ compact | H_i(Sᵐ)=0 for i>m; i=m is ℤ, so the source's i≥n needs noncompactness, which the README does not claim | as stated | r42 |
| 5.0 homological reindexing: E_r^(p,q) = native page r+1 at (a,b)=(1−2p−q,p−1) | (p,q)=(0,0); (2,1) | (1,−1): n=0, i₁=−1,i₂=0 ⇒ H_0(F_0/F_(−1)); (−4,1): n=−3, i₁=1,i₂=2 ⇒ H_3(F_2/F_1) (TauCeti `Filtered/SpectralObject.lean` 410–420) | agrees with E¹_(p,q)=H_(p+q)(F_p/F_(p−1)) | r31 |
| 5.0 cohomological reindexing (a,b)=(2p+q+1,−p−1) | (p,q)=(1,2) | (5,−2): n=3, i₁=−2,i₂=−1 ⇒ F^1/F^2 | agrees | r31 |
| 5.0 degreewise lower bound, no uniform bound | C_n=ℤ, F_pC_n=C_n iff p≥−n | F_(−n−1)C_n=0 each n; inf s(n)=−∞ | README's remark right | r31 |
| 5.0 first-quadrant regularity | d_r on E_r^(p,q) | target (p+r,q−r+1) vanishes for r>q+1 | regular, degreewise bounded | r31 |
| 5.5 multiplicative sign (−1)^(q p′) | F=pt; B=pt | +1, +1 | reduces to base/fibre cup | r31 |
| 5.5 fibre weak contractibility needs nonempty fibres | p: ∅→pt | π₀ not surjective | nonemptiness clause present | r31 |
| 4.5 k(X×Y)=X×Y, one factor locally compact | X cocountable uncountable, Y=pt | kX discrete ≠ X | R12 | r31 |
| 4.6 RPⁿ cellular differential 1+(−1)^k | k=1,2 | 0, 2 | agrees | r31 |
| 4.6/6.1 RP² sign system | twisted d₁=±2,d₂=0; δ⁰=±2,δ¹=0 | H⁰=0,H¹=ℤ/2,H²=ℤ | agrees with 6.1 and 6.3 | r31 |
| 4.4 factor interchange on Sᵐ∧Sⁿ | m=n=1 | −1 | swap on S² has degree −1 | r31 |
| 2.5 S⁰ reference class s₀=[q]−[−q] | local images; augmentation | +1 at q, −1 at −q; sum 0 | uniqueness needs both data | r31 |
| 6.3 boundary conversion (−1)^m | m=1; m=2 | both −[r↑]; (−1)·(−1)=+1 | agrees; ∂[D¹]=[+1]−[−1] | r31 |
| 6.2 cap boundary identity | k=0 | ∂(c⌢φ)=∂c⌢φ−c⌢δφ, sign +1 | Hatcher's convention | r31 |
| 6.5 linking symmetry (−1)^((i+1)(n−i)) | (n,i)=(3,1),(5,2),(7,3) | +1,−1,+1 | agrees | r31 |
| 7 Euler values | S⁰,S¹,T⁰,CP⁰ | 2,0,1,1 | χ(Tⁿ)=0 restricted to n>0 | r31 |
| 8.1 relative CW connectivity | λ=2,(D²,S¹) | π₁(D²,S¹)=0; π₀ bijective; π₁ onto | agrees | r31 |
| 8.8c directed union vs topological colimit | S¹→S¹, z↦z² | z~w iff z/w∈μ_(2^∞), dense ⇒ indiscrete | negative example correct | r31 |
| 8.8c π_n of Γ(A[n]) | A=ℤ,n=2 | H_2=ℤ, other positive degrees 0 | K(A,n) | r31 |
| 8.8d fixed dᵐ not a Serre class | 0→ℤ/2→ℤ/4→ℤ/2→0 | 2·(ℤ/4)≠0 | not closed under extensions | r31 |
| 8.8d "some power of d" closed under extensions | d^aA=0,d^b(G/A)=0 | d^(a+b)G=0 | closed; K(A,1) route R13 | r31 |
| 8.8d Hurewicz mod C degrees | n=2,C=0 | π₂≅H₂, π₃→H₃ onto | agrees | r31 |
| 8.11b suspension/cone signs | n=0 | σ_right=δ; (−1)^1=−1 | agrees with (−1)^(n+1) | r31 |
| 8.12 circle class | period 1 | generator of π₁(AddCircle 1)=ℤ | `AddCircle.isEilenbergMacLaneSpaceOne` (`UniversalCover/Circle/EilenbergMacLane.lean` 47, re-opened today) | r31 |
| 5.3 transfer, zero sheets | E=∅ over nonempty B | p_*∘transfer=0=0·id | agrees | r31 |
| 6.0/6.1 lim¹ of eventually constant towers | H^(n−1)(X^k) constant k≥n | Mittag-Leffler ⇒ lim¹=0 | agrees | r31 |
| 1.6 π₁ abelian under continuous unital multiplication | S¹; wedge of two circles | ℤ; free group, no instance | hypothesis needed | r31 |

**Library declarations opened at the pins (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9).** Re-opened today: Mathlib `isQuotientCoveringMap_iff_isCoveringMap_and` and `IsQuotientCoveringMap` (`Topology/Covering/Quotient.lean` 339, 39); Tau Ceti `AddCircle.isEilenbergMacLaneSpaceOne` (`AlgebraicTopology/UniversalCover/Circle/EilenbergMacLane.lean` 47), `isEilenbergMacLaneSpaceOne_iff` (`EilenbergMacLane/Basic.lean` 128). Carried from the previous reviews, pins unchanged: `TauCeti.TopCat.serreFibrations` (`Topology/Homotopy/SerreFibration/Basic.lean` 107), `TopCat.singularCap` (`Cohomology/Cap/Basic.lean` 101), `Projectivization.instTopologicalSpace` and `isQuotientMap_mk'` (Mathlib `Topology/Algebra/Projectivization.lean` 44, 47), `TopologicalSpace.compactlyGenerated` and `UCompactlyGeneratedSpace` (`CompactlyGeneratedSpace.lean` 68, 91).

**Cross-roadmap citations resolved today.** DGFloer on main eaf17b10 lines 188, 232, 453–475, 659–699, 1584 (R01); DGFloer #1798 head a3913c8f lines 59, 620–703 (R01); HomotopySpheres #1287 head 52ebd6f8 lines 663–690 (§3A.1–3A.2), 680, 737, 812, 822, 1390 (R02); ClassifyingSpaces in this pull request lines 95–107, 269–271, 376–388, 486 (the 8.8b move and its consumption of 8.8a, 8.8c's killing construction and 8.3); MorseNovikov in this pull request lines 157–161, 406 (consumes AT8.3); CharacteristicClasses in this pull request lines 64–68, 74–80, 733, 753 (AT4.8, 5.5, 8.5, 8.8b, 8.10, 8.12); GeneralizedCohomology in this pull request (AT4.5, 4.8, 5.0, 5.5, 6.0, 6.4, 8.8c, 8.8d at lines 35–44, 409–421, 3049–3051, 3423–3429); TopologicalKTheory (AT4.5, 4.6, 5.5, 8.1, 8.5 at 66, 310, 366, 1246–1258, 1423–1424); ComplexKahlerGeometry (AT4.5, 4.6, 4.7, 5.0, 6.3 at 1327–1666). The relative links of the Ownership section resolve on main (`Completed/UniversalCovers`, `GeometricTopology`, `DifferentialGeometry`, `HeegaardFloer`, `ProfiniteCohomology`). Merge order: HomotopySpheres line 66, DGFloerPartII 67, AlgebraicTopologyPartII 219; AlgebraicTopology, DGFloer, ClassifyingSpaces, CharacteristicClasses, GeneralizedCohomology and MorseNovikov are on main and not listed, as expected.

**Ownership against open pull requests.** Checked by object for the objects this head moves or states: the Serre and filtered-complex spectral sequences, CW approximation, the K(A,n) family and Serre classes (second owner DGFloer, R01); the compact-generation coreflection (HomotopySpheres §3A.1, R02); the nerve/bar model and its normalized comparison (ClassifyingSpaces, now one owner each side); the degree-one Hurewicz theorem (MorseNovikov and ClassifyingSpaces consume 8.3; DGFloer Layer 1 item 1 on main still builds it, R01). The two open revisions of this folder by another author, #1652 and #1663, were read at their heads for R17; whether they move ownership of any object is their reviews' matter. Among the vocabulary-nearest open roadmaps the index lists, StableHomotopyKTheory (#1227) was not given with its files and was not checked.

## Not verifiable

- tom Dieck, *Algebraic Topology*, Theorem 9.5.1 (README line 885): EMS Press, DOI 10.4171/048, settled as uncertified in the manifest.
- Weibel 5.5.1(2) and 5.5.10 (README lines 940, 953): Cambridge, settled as uncertified; the hypotheses the README restates (degreewise bounded-below exhaustive increasing filtrations; complete exhaustive decreasing filtrations with regular spectral sequence) agree with the theorems as known, not with a text read here.
- Milnor, *Morse Theory*, Lemmas 3.6–3.7 (README line 685): Princeton, settled as uncertified.
- Serre 1953, Theorem 1 (README line 2178), Freedman–Quinn §7.7 (line 1947), Lee and Thom 1954: settled as uncertified in the manifest; not in today's sample.

## Source issues

- none
