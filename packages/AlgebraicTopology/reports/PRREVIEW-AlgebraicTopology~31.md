# Review of AlgebraicTopology (pull request #1808 at 0439c6d)

**Verdict:** needs changes

The pull request changes only `TauCetiRoadmap/AlgebraicTopology/README.md` in this folder (394 insertions, 87 deletions against main): Stage 4.5 gains the simplicial-realization product comparison, Stage 4.8 (connected maps, weak equivalences, CW approximation), Stage 5.0 (spectral sequence of a filtered complex), the Serre machinery of Stage 5.5, Stages 8.8c (abelian Eilenberg–MacLane family) and 8.8d (Serre classes) are new, Stage 8.12 is rewritten as the native circle comparison, and the dependency table follows. `Suggested.lean` and the seven companion `.lean` files are byte-identical to main. Findings marked *predates the pull request* are visible on main's copy of the folder as well; they are reported because the gate fails on them and the brief counts every gate failure.

## R01 (P2) — Two owners of the ordinary Serre and Eilenberg–MacLane machinery: this folder and DGFloer on main

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` lines 102–116 ("The ordinary Serre and Eilenberg–MacLane machinery is owned here. Stage 4.8 owns … Stage 5.0 owns … Stage 5.5 owns … Stage 8.8c owns … Stage 8.8d owns …"), the new items at lines 874–902 (4.8), 918–954 (5.0), 1014–1140 (5.5), 2086–2173 (8.8c–8.8d).

**Claim.** These targets are owned by AlgebraicTopology; DGFloer Layer 1 "consumes these ordinary targets" (line 117).

**Witness.** `TauCetiRoadmap/DGFloer/README.md` on main (ffac5139), Layer 1 items 2–4, lines 461–800, owns the same objects in the same words: item 2 "Weak equivalences and CW approximation" with the tom Dieck 9.5.1 Eilenberg-subcomplex route, the Serre fibration sequence and both Serre spectral sequences with the multiplicative construction and arbitrary bases; item 3 the filtered-complex spectral sequence with the Classical and Complete Convergence theorems; item 4 the functorial `K(A,n)` family (bar in degree one, Dold–Kan `Γ(A[n])` above), uniqueness, `ΩK(A,n) ≃ K(A,n−1)`, the directed-union property, Serre classes and Hurewicz modulo a class. Its coordination paragraph at lines 217–223 states the opposite direction of supply: "AlgebraicTopology Stage 5.5 and GeneralizedCohomology consume these targets". The open revision of DGFloer at its head fc27fe2b keeps the same ownership (its `### 1.2` at line 562 and its supplier contract at lines 352–353: "Stage 5.5 consumes Layer 1 item 2 and supplies nothing to it"). The pull request does not touch the DGFloer folder (`git diff --stat origin/main...HEAD` lists no file under it), so after merge main would carry two owners of each object, and a mutual citation: DGFloer consumes AlgebraicTopology Stages 2–8 (its lines 105 and 346–362), while this README still consumes DGFloer Layer 1 item 1 at lines 115, 1904–1905 and 2417.

**Repair.** In this folder: own the degree-one Hurewicz isomorphism in Stage 8.3 (the map and its factorisation through the abelianisation are already 8.3's; the route is Hatcher Theorem 2A.1, hatcher line 7230, §2.A) and delete the three citations of DGFloer Layer 1 item 1 (lines 115, 1904–1905, table row 8.10 at 2417). For the supplier side, the move of ownership is only complete when DGFloer's README cites Stages 4.8, 5.0, 5.5, 8.3, 8.8c and 8.8d instead of building Layer 1 items 1–4: that edit belongs to the same pull request (which then names DGFloer among its folders) or to DGFloer's own open revision with the merge order stated. Until one of them exists the roadmap plans again what DGFloer on main plans.

## R02 (P1) — Dependency cycle reported by the gate

**Location.** Gate output: `CYCLE among: AlgebraicTopology, HilbertModules, HomotopySpheres, IndexTheory, OperatorKTheory, StringOrientation, TangentialBordism`. *Predates the pull request* (main's README carries the same HomotopySpheres citations).

**Claim.** The roadmap's suppliers are earlier in the merge order.

**Witness.** This README consumes HomotopySpheres §3A.1 and §3A.2 (lines 122–130, 580–588, 782, 2253, 2292, 2355, table rows at 2399, 2417, 2418), while HomotopySpheres at its head 52ebd6f8 consumes this roadmap: its §3A.2 line 680 "*Needs:* 3A.1; AlgebraicTopology Stage 4.5 cofibrations and contractible collapse, and Stage 8 relative homotopy", its §3A.4 line 737 "*Needs:* 3A.2–3; … AlgebraicTopology Stage 4.4 raw sphere suspension", its §3B.2–3B.4 lines 854–872. The depcheck run from the brief's command reproduces the two lines verbatim (`depcheck: 241 roadmaps, 2360 edges, 2 problem(s)`).

**Repair.** The notions consumed move down, as the brief prescribes. Stage 4.5 already lists the compact-generation facts it uses as its own targets (lines 794–799); make it own the whole interface it needs: the coreflection `k` as right adjoint to the inclusion of compactly generated spaces on native `UCompactlyGeneratedSpace` and `TopologicalSpace.compactlyGenerated` (Mathlib `Topology/Compactness/CompactlyGeneratedSpace.lean` lines 68 and 91), its counit, the CW comparison, `k(X×Y)` as the product and the interval-product comparison; then delete the §3A.1 citations in 4.4 (lines 580–582), 4.5 (782), 8.1 (1857 is a consumer mention and may stay), 8.10, 8.11a (2253, 2292), 8.11b (2355) and the three table rows. For the pointed suspension–loop adjunction and the convenient smash/suspension comparisons of §3A.2 consumed by 8.11b (lines 2316–2317, 2355): state the adjunction on the native fixed-interval loop carrier inside 8.11b, or move the adjunction-side comparison of 8.11b to AlgebraicTopologyPartII. HomotopySpheres then remains a consumer only.

## R03 (P2) — Upward supplier: an on-main roadmap citing an open pull request

**Location.** Gate output: `UPWARD: AlgebraicTopology (on main) -> HomotopySpheres (#65) at README lines [2399, 2417, 2418]`; also lines 122 and 124, which cite HomotopySpheres through a GitHub pull-request link (`…/pull/284`). *Predates the pull request.*

**Claim.** HomotopySpheres §3A.1/§3A.2 are suppliers of Stages 4.4, 4.5, 8.10, 8.11a and 8.11b.

**Witness.** HomotopySpheres is an open pull request (#1287 at 52ebd6f8, listed by `roadmaps list`); AlgebraicTopology is on main, so every supplier citation of it is upward whatever the merge order. Cross-roadmap citations are by roadmap name and section, never by pull-request number or link.

**Repair.** The repair of R02 removes the edges; replace the two `pull/284` links at lines 122 and 124 by the roadmap name and section.

## R04 (P2) — `set_option` in `Suggested.lean`

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` line 910: `set_option maxHeartbeats 800000 in` before `compactSupportTopClass_existsUnique`. *Predates the pull request.*

**Claim.** The acceptance file elaborates under the defaults.

**Witness.** Gate `set_option=1`; the principles make any `set_option` a blocking finding.

**Repair.** Restate the theorem so that it elaborates under the defaults: split the existence and the uniqueness statements, and name the local section's carrier once with an `abbrev` instead of repeating the orientation-system expressions in the statement.

## R05 (P2) — Sorry'd data in `Suggested.lean`

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean`: the gate counts 69 `def`/`abbrev`/`instance` declarations whose body is `sorry` (its list starts at line 160 `cellularToSingular`). My own scan finds these 60 declarations with a bare `sorry` body: `cellularToSingular` (L160), `finiteCoverTransfer` (180), `regularDeckSingularComplex` (230), `regularDeckSingularComplexForgetIso` (236), `regularCoverCoinvariantsChainsIso` (255), `cartanLeraySpectralSequence` (293), `cartanLerayE2Iso` (300), `twistedRestrictScalarsChainIso` (372), `chartAt` (486), `carrierHomeomorphOriginal` (552), `orientationFiberSquareIso` (602), `localTopOrientationTensorNatIso` (697), `localCoefficientExtensionClass` (724), `poincareDualityMap` (955), `relativeHomotopyGroup` (1055), `BasedTopPair.Hom.relativeHomotopyMap` (1060), `basedSubspaceHomotopyGroup` (1066), `relativeHomotopyBoundary` (1071), `relativeHomotopyChangeBasepoint` (1078), `relativeHomotopyAbelianization` (1087), `relativeHomotopyToAbelianization` (1093), `relativeHomotopyModule` (1100), `relativeHomotopyModuleIsoAbelianization` (1105), `relativeHurewicz` (1112), `compactManifoldFiniteCWType` (1155), `simplicialRealizationCW` (1265), `simplicialRealizationCellEquiv` (1273), `groupClassifyingSpaceFundamentalGroup` (1309), `ordinaryEilenbergMacLaneFamily` (1353), `cubicalSphereQuotient` (1428), `coordinateCubeSimplex` (1453), `cubicalSphereRepresentative` (1575), `sphereFundamentalGenerator` (1588), `spherePositiveCubeMap` (1594), `absoluteHurewicz` (1640), `ordinaryEMHurewiczIdentification` (1660), `ordinaryEMUniversalClass` (1675), `relativeCylinderCW` (1719), `relativeObstructionCochain` (1802), `relativeDifferenceCochain` (1825), `coordinateCubeSupBallHomeomorph` (1895), `supBallEuclideanDiskHomeomorph` (1905), `supBallEuclideanDiskPairMap` (1939), `diskQuotientSphereHomeomorph` (1998), `coordinateCubeQuotientSphereHomeomorph` (2002), `sphereSmashHomeomorph` (2056), `reducedSuspensionSphereHomeomorph` (2062), `basedSphereReferenceGenerator` (2092), `sphereSmashCubePairMap` (2118), `reducedSuspensionSphereCubePairMap` (2135), `sphereFactorInterchangePairMap` (2212), `basedDiskSpherePairMap` (2232), `compactBasedSmashCarrierComparison` (2321), `compactReducedSuspensionCarrierComparison` (2338), `cwReducedSuspensionKelleyComparison` (2355), `reducedSuspensionTwoStepHomeomorph` (2404), `normedUnitBallTopCatDiskHomeomorph` (2454), `compactConvexClosedBallHomeomorph` (2536), `relativeCWPushout` (2599), `relativeCWPushout_cell` (2621); the gate's higher count includes declarations that mention them. *Predates the pull request.*

**Claim.** `Suggested.lean` states headline theorems with only the simple definitions they need.

**Witness.** Gate `sorry-data=69`; every theorem whose statement mentions one of these (for example `relativeHurewicz_iso` on `relativeHomotopyGroup`, `poincareDuality_*` on `poincareDualityMap`, `cartanLeray_*`) is a statement about an unspecified object.

**Repair.** Delete every sorry'd `def`/`abbrev`/`instance` and every declaration that mentions one; they stay in the README as targets with their intended signatures (the README already carries each of them). Keep the definitions with real bodies (`ordinaryDoldKanSimplicialModel`, `ordinaryDoldKanLabeledSimplex`, `OrdinaryEMModel`, `NormalizedAbelianEMFamily`, `SimplyConnectedAtInfinity`, `LSCategoricalCover`, the Brouwer statements on native carriers) and the headlines statable on native carriers: Hurewicz and Whitehead are native at the pin, Poincaré duality with two-torsion coefficients is statable through `TopCat.singularCap` (`Cohomology/Cap/Basic.lean` line 101) existentially over the fundamental class, ordinary representability is statable on `OrdinaryEMModel`; name in the module docstring the headlines that are not statable (the Serre spectral sequence with its monodromy system, Cartan–Leray, Hurewicz modulo a Serre class, the relative obstruction class with local coefficients).

## R06 (P3) — Build warnings the gate counts

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` line 1 (`import Mathlib` without the module header) and line 486 (`chartAt` declares `[IsManifold I ∞ M]` twice). *Predates the pull request.*

**Witness.** Gate `build=3`: twice "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`" and the `linter.overlappingInstances` warning at 486:18. My run of `lake env lean` on the file reproduces exactly these warnings besides `sorry` (215 declarations).

**Repair.** Header `module`, `public import Mathlib` and the `TauCeti.*` imports as `public import`, then `@[expose] public section`; delete the second `[IsManifold I ∞ M]` binder of `chartAt`.

## R07 (P3) — `Suggested.lean` disagrees with the README after the ownership move

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` lines 1259 ("The abelian model is supplied by DGFloer"), 1330–1332 ("The definitive DGFloer constructor pins its spaces to bar in degree one and Dold–Kan in higher degree; this interface records its normalized maps without adding a constructor in AT"), and the block at lines 1778–1850 (`section SimplyConnectedObstructions`, `[SimplyConnectedSpace Y]`, `[Nontrivial (Fin n)]`).

**Claim.** README 8.8c (lines 2086–2135) owns the family `ordinaryEilenbergMacLaneFamily` with its Dold–Kan models; README 8.9 (lines 2178–2188) states the obstruction cochain for n ≥ 1 and a path-connected Y on which π₁Y acts trivially on π_nY.

**Witness.** The two docstrings name DGFloer as the supplier of the object the README now owns, and the Lean 8.9 block is stated only for simply connected Y and n ≥ 2 (`Nontrivial (Fin n)`), a narrower generality than the README's, with the docstring calling it "an advisory specialization". The module docstring (lines 26–31) names no headline as not statable.

**Repair.** Rewrite the two docstrings to say that the family is this roadmap's 8.8c target; either state 8.9 at the README's generality (n ≥ 1, trivial π₁-action, which needs a native action of π₁ on π_n and is therefore not statable at the pin) and say so in the module docstring, or narrow README 8.9's Lean names to the simply connected case explicitly; list in the module docstring every headline not statable at the pins.

## R08 (P3) — TeX-only syntax outside a code span

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` line 1392: `C_c^{cell,n}(X,A;ℤ)`. *Predates the pull request* (main line 1176).

**Witness.** Gate `tex=1`.

**Repair.** Write it as a code span: `` `C_c^cell,n(X,A;ℤ)` `` or in words ("the compactly supported cellular n-cochains of (X,A)").

## R09 (P3) — Backticked own names that `Suggested.lean` does not declare

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md`. The gate flags `coordinateCubeReferenceChain_eq_shuffle` (line 391, this roadmap's own) and `isQuotientCoveringMap_iff_isCoveringMap_and` (line 976, which is native: `TauCeti.isQuotientCoveringMap_iff_isCoveringMap_and` in `TauCeti/Topology/Covering/PuncturedDisc.lean`, used at line 251, namespace `TauCeti` from line 84). A scan of every backticked camel-case or underscore name in the README against the folder's `.lean` files and the pinned libraries finds 37 own names declared nowhere: `basedHomotopyInverseOfEquivalence` (755), `basedLoopCWType` (2252, 2290), `cofibrationTowerHomotopyEquivalence` (697, 746), `compactConvenientSmashComparison` (584), `compactConvenientSuspensionComparison` (584), `compactTriadPoincareLefschetz` (1750), `coordinateCubeReferenceChain_eq_shuffle` (391), `cwConvenientSuspensionComparison` (585, 2317), `cwProductKelley` (766, 1867), `cwSubcomplexNeighborhoods` (769), `cwSubcomplexTowerUnion` (714), `diskBoundaryRelCW` (638), `finiteSourceMappingCWType` (2251, 2255), `groupCohomologyCup` (2083), `homotopyGroupKelleyProduct` (1859), `homotopyPushoutGluingComparison` (672), `kanCubicalHomotopyComparison` (1873), `kanRealizationUnitHomotopyIso` (1891), `linearLocalGenerator_signDet` (1483), `localDiffeomorphism_localGenerator_signDet` (1493), `localLinearization_puncturedHomotopy` (1492), `mapsToGroupClassifyingSpaceEquiv` (2036), `or_M` (1590), `orderedSimplex_vertexSwap_neg` (1485), `ordinaryCohomologySuspension` (2304, 2326), `ordinaryEMLoopComparison` (2295), `ordinaryEMLoopComparison_pi` (2296), `ordinaryEMRelativeRepresentability` (2216), `ordinaryPairMappingConeCohomologyExactSequenceComparison` (815), `ordinaryPairMappingConeHomologyExactSequenceComparison` (814), `pathToIdentity_of_det_pos` (1488), `properWhiteheadSimplyConnectedCW` (1950), `relativeCWPushoutCWModel` (730), `relativeObstructionLocalSystem` (2174), `simplicialGroupKan` (1883), `simplicialGroupMooreHomotopyIso` (1884), `stableFundamentalGroupAtEnd` (1935). The three §3A.2 names at 584–585 are, by the README's own words, "proposed §3A.2 supplier targets", so they are not this roadmap's either.

**Repair.** State each fact in prose without the name (the gate's rule), or, for the few that are headlines, declare them; write the native one as `TauCeti.isQuotientCoveringMap_iff_isCoveringMap_and`.

## R10 (P3) — Edits outside the pull request's named folders

**Location.** Gate `outside-folder=2`: `Completed/ArithmeticDirichletSeries/README.md` (one line: "`LFunctions` consumes this package and supplies its own character-specific continuation") and `TauCetiRoadmap/SymplecticGeometry/README.md` (one line: "boundary and sign adapters consumed by HeegaardFloer and consumed by DGFloer").

**Witness.** The brief names fourteen other folders as the pull request's own; these two are not among them (the pull-request index does list both names in its title line, so this may be an indexing mismatch for the worker to settle).

**Repair.** Drop the two hunks from this pull request, or have the pull request name those folders as its own.

## R11 (P3) — Cited works missing from the References and the manifest

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` line 877 ("tom Dieck 9.5.1", new), line 2165 ("Serre 1953, Theorem 1", new), line 1935 ("FQ7.7", the only occurrence of the abbreviation), line 684 ("Milnor Lemmas 3.6–3.7"), line 688 ("Strøm's product theorem"); `## References` lines 2488–2509.

**Witness.** None of tom Dieck, *Algebraic Topology* (EMS 2008), Serre, *Groupes d'homotopie et classes de groupes abéliens* (Annals 58, 1953), Freedman–Quinn, *Topology of 4-Manifolds*, Strøm, or Milnor's *Morse Theory* (whose Lemmas 3.6–3.7 are the homotopic-attachment lemmas; the cached milnor1959 paper has Lemmas 1–4 and Theorems 1–4 only, milnor1959 lines 43–249) is in the References; the manifest records none of them, nor Weibel (cited at lines 931 and 945 and listed in References).

**Repair.** Add the five works to `## References` with the locators used, expand "FQ" at first use, name *Morse Theory* at line 684, and record them in `sources.toml` (tom Dieck and Serre 1953 as `uncertified`: paywalled at EMS Press and JSTOR, see Not verifiable).

## R12 (P3) — A compact-generation target without its hypotheses

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` lines 796–798 (new): "k(X×Y) is the product in the compactly generated category with the same compact subsets as X×Y, k(X×Y)=X×Y when either factor is locally compact".

**Claim.** For spaces X, Y with one factor locally compact, `k(X×Y) = X×Y`.

**Witness.** X an uncountable set with the cocountable topology, Y a point. Every compact subset of X is finite (an infinite compact K contains a sequence x_n; the cocountable opens U_n = X ∖ {x_m : m ≥ n} increase and cover K, and no U_N contains x_N), so kX is discrete, while X is not; Y is compact, yet k(X×Y) = kX ≠ X = X×Y.

**Repair.** Quantify the sentence: for compactly generated X and Y, `k(X×Y)` is their product in the compactly generated category; `k(X×Y)=X×Y` when X is compactly generated and Y is locally compact Hausdorff (and symmetrically). The Hausdorff CW case at line 781 already carries the right hypotheses.

## R13 (P3) — The route to the K(A,1) axiom does not reach the fixed-d Serre class

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` lines 2142–2148 (new): "the groups annihilated by some power of d … For the K(A,1) axiom reduce by 8.8c's directed-union property to finite A and apply Stage 5.3's transfer to 8.8a's finite covering Eπ→Bπ, so the group order annihilates the reduced integral homology of the bar model."

**Claim.** The transfer bound on finite subgroups, passed to the directed union, proves `H̃_*(K(A,1);ℤ)` is annihilated by a power of d whenever A is.

**Witness.** A = ⊕_ℕ ℤ/d (annihilated by d itself). Its finite subgroups A_i = (ℤ/d)^i have order d^i, so transfer only gives annihilation of `H̃_*(K(A_i,1))` by d^i; the colimit over i inherits no uniform exponent, and the class requires one. The statement is true (by Prüfer's theorem a bounded abelian group is a direct sum of cyclic groups; Künneth on finite sums shows `H̃_*(K((ℤ/d^k)^i,1))` is annihilated by d^k, since tensor products and Tor of groups annihilated by d^k are), but not by the route written. For the torsion class the written route suffices.

**Repair.** For the fixed-d instance state the route through Prüfer's decomposition and Künneth (or the exponent of the bar complex), keeping transfer plus directed union for the torsion class only.

## R14 (P3) — Stage 4.6 rebuilds a projectivization topology that is native at the pin

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` lines 279–287 ("Stage 4.6 builds the absent interface here with these shapes") and 820–823 ("Own #44117's generic quotient topology on native `Projectivization 𝕜 V`"). *Predates the pull request*, but the pin bump of #1800 made it stale.

**Witness.** Mathlib at the pin (1b1ccf4b) has `Mathlib/Topology/Algebra/Projectivization.lean` with `instTopologicalSpace` (line 44), `isQuotientMap_mk'` (47), `continuous_mk'` (51), `continuous_iff` (56), `continuous_mk` (61), `continuous_map` (71), `isOpenMap_mk'` (79), `isOpenQuotientMap_mk'` (83), exactly the declarations the README lists as absent; Tau Ceti at the pin (2fd255d9) adds `instSecondCountableTopology`, `instT2Space`, `instCompactSpace`, `instPathConnectedSpace` and the affine charts in `TauCeti/Topology/Algebra/Projectivization.lean` lines 90–311.

**Repair.** Cite these natives in the Inventory and in 4.6; keep in 4.6 only the real projective manifold structure, the CW structure and the sign system.

## R15 (P3) — Companion Lean files import another roadmap's module and carry `set_option`

**Location.** `TauCetiRoadmap/AlgebraicTopology/OrientationComparison.lean` lines 1–2 and 14–15, `GeneralModelOrientation.lean` lines 1–3, `CompactOrientationLaws.lean` 14–15, `BoundaryInteriorComparison.lean` 15–16, `ChartSimplexLocalImage.lean`, `BoundaryCarrierOrientation.lean`. *Predates the pull request.*

**Witness.** They import `TauCetiRoadmap.DifferentialGeometry.Suggested` and `TauCetiRoadmap.AlgebraicTopology.Suggested` and set `maxHeartbeats`/`synthInstance.maxHeartbeats`; they carry 42 `sorry`s between them. The brief's Lean form rules apply to each `.lean` file of the folder (single `import Mathlib`, no `set_option`, no other roadmap's module), and any deletion of a sorry'd definition from `Suggested.lean` (R05) breaks their build.

**Repair.** Fold the statements they carry into the README (Stage 6.3 already describes each) and delete the six orientation files, as the repair of the earlier AlgebraicTopology revision did; `TopologicalGroupFundamentalGroup.lean` may stay only with a single `import Mathlib` header.

## Verified sound

**Gate and build.** Gate at 0439c6d: FAIL on set_option=1, tex=1, sorry-data=69, readme-ids-missing=2, depcheck=2, outside-folder=2, build=3 (each is a finding above). `lake env lean TauCetiRoadmap/AlgebraicTopology/Suggested.lean` from the worktree: exit 0, 215 `declaration uses sorry`, the overlapping-instance warning at 486, the five `#check` outputs; no error. Depcheck output, verbatim:

```
UPWARD: AlgebraicTopology (on main) -> HomotopySpheres (#65) at README lines [2399, 2417, 2418]
CYCLE among: AlgebraicTopology, HilbertModules, HomotopySpheres, IndexTheory, OperatorKTheory, StringOrientation, TangentialBordism
depcheck: 241 roadmaps, 2360 edges, 2 problem(s)
```

**Padding probe.** A scratch copy of `Suggested.lean` with each of the 143 `theorem … := by sorry` proofs replaced by `first | (rfl; done) | (simp; done) | (infer_instance; done) | sorry` elaborated without error; the set of `declaration uses sorry` lines is identical to the original's (215 of 215), so no stated theorem closes by one tactic. No padding finding.

**Seeded sample of 15 locators** (random seed 1808031 over the 26 locator hits of the README; none chosen by heading):

| README line | locator | source line | result |
| --- | --- | --- | --- |
| 684 | Milnor Lemmas 3.6–3.7 | not in milnor1959 (Lemmas 1–4, Theorems 1–4 at lines 43–249); these are *Morse Theory* §3 | R11: work unnamed |
| 724 | Hatcher Prop. A.3 (CW complexes normal) | hatcher line 22617, printed p. 522 | supports 4.5's normality claim |
| 759 | Hatcher Prop. 0.19 (homotopy equivalence rel A under HEP) | hatcher line 867, p. 16 | supports the based inverse of 4.5 |
| 780 | Hatcher Thm A.6 (product CW structure on (X×Y)_c; equals X×Y if one factor locally compact) | hatcher line 22693, p. 524 | supports 4.5 line 780 (CW case) |
| 896 | Hatcher Lemma 4.6 (compression lemma) | hatcher line 15116, p. 346 | matches 4.8's statement |
| 899 | Hatcher Prop. 4.18 (maps between n-connected CW models, unique rel A) | hatcher line 15454, p. 354 | matches |
| 1159 | Hatcher §3.G transfer | hatcher line 14015, p. 321 | matches 5.3 |
| 1467 | Hatcher Lemma 3.27 (compact-support section/vanishing) | hatcher line 10255, p. 236 | matches 6.3 (a),(b) |
| 1986, 2011 | FTW Theorem 4.2 | ftw1973 line 600, printed p. 17 | matches 8.5: C finite dimensional, countably based, locally finite, C and its dual acyclic ⇒ locally finitely contractible |
| 2006 | FTW Corollary 4.9 | ftw1973 line 752, p. 21 | matches 8.5: proper f is a proper homotopy equivalence iff iso on H_* and H_c^* under SC and SC at infinity |
| 2129 | Hatcher 4.30 | hatcher line 15928 is *Proposition* 4.30 (uniqueness of the homotopy type of K(G,n)), p. 366 | matches; write "Proposition 4.30" |
| 2165 | Serre 1953 Theorem 1 | paywalled | Not verifiable |
| 2256 | Milnor 1959 Theorems 3–4 | milnor1959 lines 209–223 | matches 8.11a (function spaces from compact n-ads into W_n are in W; the based-loop corollary) |
| 2382 | Hatcher §4.3 | hatcher lines 17036–17064 (representability Thm 4.57 at 17069, obstruction theory p. 415) | matches |

Also read: Hatcher 4.13 (line 15375; the pair form is Example 4.14/Prop. 4.15), Lemma 4.31 (15931), Prop. 3.29 (10370), Thm 3.43 (10976), Prop. 2.21 (5222), Thm 4.32 (15961), Thm 4.5 (15109); FTW Lemma 4.3 (line 610). The Farrell–Taylor–Wagoner paper was fetched legally from Numdam during this review (cache `10d5f8cd…`); the manifest should record it under one key.

**Adversarial table.** One row per statement checked, with the values computed.

| statement | instances | values each side | result |
| --- | --- | --- | --- |
| 5.0 homological reindexing: E_r^(p,q) = native page r+1 at (a,b)=(1−2p−q,p−1) | (p,q)=(0,0); (2,1) | native page 2 at (a,b) is H^(a+b) of the cone of F_b→F_(b+1) (TauCeti `Filtered/SpectralObject.lean` lines 410–420): (1,−1): n=0, i₁=−1,i₂=0 ⇒ H_0(F_0/F_(−1)); (−4,1): n=−3, i₁=1,i₂=2 ⇒ H_3(F_2/F_1) | agrees with E¹_(p,q)=H_(p+q)(F_p/F_(p−1)); page shift r+1 agrees with the native first page numbered 2 |
| 5.0 cohomological reindexing (a,b)=(2p+q+1,−p−1) for G_t=F^(−t) | (p,q)=(1,2) | (5,−2): n=3=p+q, i₁=−2,i₂=−1 ⇒ G_(−1)/G_(−2)=F^1/F^2 | agrees with E_1^(p,q)=H^(p+q)(F^p/F^(p+1)) |
| 5.0 degreewise lower bound, no uniform bound | C_n=ℤ, F_pC_n=C_n iff p≥−n | F_(−n−1)C_n=0 for each n; inf_n s(n)=−∞ | README's remark is right; Weibel 5.5.1(2) hypotheses as stated (not readable, see below) |
| 5.0 regularity of first-quadrant sequences | d_r on E_r^(p,q) | target (p+r,q−r+1) vanishes for r>q+1 | regular and degreewise bounded, as claimed |
| 5.5 multiplicative sign (−1)^(q p′) | F=pt (q=0); B=pt (p′=0) | sign +1 in both | reduces to the base, resp. fibre, cup product |
| 5.5 fibre weak contractibility needs nonempty fibres | p: ∅→pt, every fibre empty hence vacuously contractible | π₀ not surjective | README's nonemptiness clause needed and present |
| 4.5 k(X×Y)=X×Y when one factor is locally compact | X cocountable uncountable, Y=pt | kX discrete ≠ X | R12 |
| 4.6 RP^n cellular differential d_k=1+(−1)^k | k=1,2 | 0, 2 | ±2 in positive even degree, 0 in odd: agrees |
| 4.6/6.1 RP² sign system | twisted: d₁=±2,d₂=0; cochains δ⁰=±2,δ¹=0 | H⁰=0, H¹=ℤ/2, H²=ℤ | agrees with 6.1 lines 1250–1251 and 6.3 lines 1573–1575 |
| 4.4 factor interchange on S^m∧S^n | m=n=1 | (−1)^1=−1 | the swap on S² has degree −1: agrees |
| 2.5 S⁰ reference class s₀=[q]−[−q] | local images; augmentation | +1 at q, −1 at −q; 1−1=0; a class with local image +1 at q is (1,c) for any c | uniqueness needs both data, as the README says |
| 6.3 boundary conversion (−1)^m | m=1: [−∂r]×[+] vs (−1)^1([+]×[r↑]) | both −[r↑]; m=2: (−1)^(1)·(−1)=+1 | formula agrees; D¹ check ∂[D¹]=[+1]−[−1] consistent |
| 6.2 cap boundary identity | degree k=0 | ∂(c⌢φ)=∂c⌢φ−c⌢δφ with sign +1 | Hatcher's convention (hatcher §3.3) |
| 6.5 linking symmetry (−1)^((i+1)(n−i)) | n=3,i=1; n=5,i=2; n=7,i=3 | +1, −1, +1 | symmetric on 3- and 7-manifolds, skew on 5-manifolds: agrees |
| 7 Euler values | S⁰, S¹, T⁰, CP⁰ | 2, 0, 1, 1 | χ(Tⁿ)=0 correctly restricted to n>0 |
| 8.1 relative CW connectivity | λ=2, (D²,S¹) | π₁(D²,S¹)=0; π₀ bijective; π₁(S¹)→π₁(D²)=0 surjective | agrees |
| 8.8c directed union vs topological colimit | S¹→S¹ by z↦z², colimit | points z~w iff z/w∈μ_(2^∞), dense ⇒ indiscrete | README's negative example is correct |
| 8.8c `π_n|Γ(A[n])|` | A=ℤ, n=2 | H_2(NΓ(ℤ[2]))=ℤ, other positive degrees 0 | K(A,n) as claimed |
| 8.8d fixed d^m not a Serre class | 0→ℤ/d^m→ℤ/d^(2m)→ℤ/d^m→0, d=2,m=1 | 2·(ℤ/4)≠0 | not closed under extensions: agrees |
| 8.8d "some power of d" closed under extensions | d^aA=0, d^b(G/A)=0 | d^(a+b)G=0 | closed; K(A,1) axiom route: R13 |
| 8.8d Hurewicz mod C degrees | n=2, C=0 | π₂≅H₂, π₃→H₃ onto | ordinary Hurewicz: agrees |
| 8.11b suspension/cone signs | n=0 | σ_right=δ; reflection·interval-first degree (−1)^1=−1 | agrees with "(−1)^(n+1)" |
| 8.12 circle class | period 1, loop t↦t mod ℤ | generator of π₁(AddCircle 1)=ℤ | `AddCircle.isEilenbergMacLaneSpaceOne` at `UniversalCover/Circle/EilenbergMacLane.lean` line 47 (p≠0): agrees |
| 5.3 transfer, zero sheets | E=∅ over nonempty B, d=0 | p_*∘transfer=0=0·id | agrees |
| 6.0/6.1 lim¹ of eventually constant towers | H^(n−1)(X^k) constant for k≥n | Mittag-Leffler ⇒ lim¹=0 | agrees |
| 1.6 π₁ of a space with continuous unital multiplication abelian | S¹; wedge of two circles (no multiplication) | ℤ abelian; free group nonabelian, no instance | hypothesis is what the theorem needs |

**Library declarations opened at the pins** (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9): `TauCeti.TopCat.serreFibrations` (`Topology/Homotopy/SerreFibration/Basic.lean` 107) with `IsStableUnderBaseChange` (114), `IsStableUnderProductsOfShape` (119), `RespectsIso` (112), `mem_serreFibrations_iff` (131), `mem_serreFibrations_iff_cube`, `mem_serreFibrations_pullbackFst`; `mem_serreFibrations_of_exists_trivialization` (`FiberBundle.lean` 365), `hasHomotopyLiftingProperty_proj_cube` (381), `mem_serreFibrations_proj` (395); `CochainComplex.spectralObject` (`Filtered/SpectralObject.lean` 147), `filtrationFunctor` (304), `spectralSequence` (409), `HomotopyCategory.spectralObjectMappingCone` (88–118), `coreE₂Cohomological` (Mathlib `SpectralObject/HasSpectralSequence.lean` 143); `IsEilenbergMacLaneSpaceOne` (`EilenbergMacLane/Basic.lean` 123), `AddCircle.isEilenbergMacLaneSpaceOne` (`UniversalCover/Circle/EilenbergMacLane.lean` 47); `pathLoopSpaceMulEquiv` (`HomotopyGroup/LoopSpace.lean` 321), `zerothHomotopyLoopSpaceEquivFundamentalGroup` (200); `TopPairing` (`ContCohomology/Cup/Graded/Basic.lean`), `nonempty_continuousCohomology_addEquiv_groupCohomology` (`ContCohomology/DiscreteGroup.lean` 166); `FundamentalGroup.mul_def` (Mathlib `FundamentalGroupoid/FundamentalGroup.lean` 44, reversed composition as the README says); `LocallyContractibleSpace` (Mathlib `Topology/Homotopy/LocallyContractible.lean`); `TopologicalSpace.compactlyGenerated`, `UCompactlyGeneratedSpace` (`CompactlyGeneratedSpace.lean` 68, 91); `sSetTopAdj`, `normalizedMooreComplex`, Dold–Kan `Γ` (Mathlib `AlgebraicTopology/DoldKan`); `isClosed_fixedPoints`, `IsMittagLeffler`, `embeddingDownNat`, `embeddingUpIntGE`, `IsLocallyCollared.isCollared`, `singularHomologyDiskBoundaryPairIso`, `reducedSingularHomologySphereZeroIso_inv_ι`, `reducedSingularHomologyTopCatSphereIso`, `TopCat.singularCap`, `cellularChainComplex`, `cellularSingularHomologyIso`, `finsum_finrank_singularHomology_of_finite_cwComplex`, `eilenbergZilberHomotopyEquiv`, `excisionMap`, `cechDiagram`, `contractibleSpace_disk`, `isZero_reducedSingularHomologyFunctor_of_contractibleSpace`, `hasHomotopyExtensionProperty_base`, `IsAspherical`, `singularHomologyPretheory`, `twistedChainComplex`, `twistedCochainComplex`, `LocalCoefficientSystem`: all present. `groupCohomologyCup` is this roadmap's own name (R09).

**Cross-roadmap citations resolved.** DGFloer on main Layer 1 items 1–4 (lines 442–800) and its coordination paragraph (217–223), and at #1798 head fc27fe2b (R01). HomotopySpheres at 52ebd6f8: §3A.1 line 663, §3A.2 678, §3A.4 735, §3B 817–872 (R02). GeneralizedCohomology in this pull request: G5 at line 2202, and its citations of Stages 4.5/4.8/5.0/5.5/8.8c/8.8d (lines 35–36, 233–236, 409–421, 538, 574, 627–631, 3043–3051); it still names `projectiveEMComparisons` (line 35), a name 8.12 no longer carries (its own review). CharacteristicClasses in this pull request: lines 64–71 and 722–731 consume 8.8b, 8.10 and 8.12's native circle comparison as this README says; C3 at 1028; S3/S5 at 523/527. TopologicalKTheory line 307 consumes 5.5's based sequence. ComplexKahlerGeometry K7 (1405), K8 (1535–1539, 1613) consumes 5.0. ClassifyingSpaces Stage 3 items 11–15 (lines 180–220) and Stage 4 items 16–18 (225–244). On main: DifferentialGeometry Layer 2 (341) with 2.2 (352), 2.4 (362), Layer 5 with 5.1 (507), 9.3 (872), 10.5 (890); MorseTheory M2 (144), M4 (481), M5 (857); RiemannianGeometry R3 (347), R4.7 (79, 276); AffineMorseLefschetz A4.0 (616), A4.1 (946); SmoothBundlesConnections B6.1 (1375); GeometricTopology Layer 1 (177), Layer 11 (831), smoothing-and-triangulation comparison (270, 930); ComplexManifolds Milestones 1–3 (172–221); BanachAlgebras A8 (155–181); UniversalCovers under `Completed/`. "CStarClassification CL8", "FourManifolds", "GT3g" occur only as consumers.

**Ownership against open pull requests** was checked by object for the moved targets (Serre spectral sequences, filtered-complex spectral sequence, CW approximation, K(A,n) family, Serre classes): the only other owner found is DGFloer (R01); AlgebraicTopologyPartII at #1694 builds none of them.

## Not verifiable

- Serre 1953, Theorem 1 (README line 2165): *Groupes d'homotopie et classes de groupes abéliens*, Annals 58, DOI 10.2307/1969789, JSTOR, paywalled; no open copy found by the sources service. Listed in `needs-references.toml`.
- tom Dieck, *Algebraic Topology*, Theorem 9.5.1 (README line 877): EMS Press, DOI 10.4171/048, paywalled. Listed in `needs-references.toml`.
- Weibel 5.5.1(2) and 5.5.10 (README lines 931, 945): *An Introduction to Homological Algebra*, Cambridge, paywalled; the hypotheses restated in the README (degreewise bounded below and exhaustive for the classical theorem; complete, exhaustive and regular for the complete one) agree with the theorems as I know them, not with a text read here.
- Lee, *Introduction to Smooth Manifolds* and Thom 1954 are settled as uncertified in the manifest.

## Source issues

- none
