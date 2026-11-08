# Review of AlgebraicTopology (pull request #1854 at 25e4020)

**Verdict:** needs changes

Full review. Since the head the previous review read (5c83375) the folder changed by 4023 lines in one commit: the six orientation companion files are deleted, `Suggested.lean` shrinks from 2887 to 1370 lines with every sorry'd `def`/`abbrev`/`instance` removed and a module-system header added, `TopologicalGroupFundamentalGroup.lean` gets the header and a single `import Mathlib`, and the README takes over the compact-generation interface from HomotopySpheres (Stage 4.5), cites Mathlib's projectivization topology, repairs the k(X×Y) hypotheses and the fixed-d Serre-class route, adds the five missing references, and drops most of the backticked own names the gate flagged. The dependency check is clean (`depcheck: 239 roadmaps, 2423 edges, 0 problem(s)`), the targeted build passes, and the one-tactic probe closes nothing. Of the previous review's seventeen findings, twelve are repaired, two partly, and three stand (the DGFloer second owner, the two out-of-folder hunks, the pull-request description). Two findings are new: headline theorems that are statable at the pins but absent, and a native Euler characteristic restated.

## R01 (P2) — Two owners of the ordinary Serre and Eilenberg–MacLane machinery: this folder and DGFloer

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` lines 102–120 ("The ordinary Serre and Eilenberg–MacLane machinery is owned here. Stage 4.8 owns … Stage 5.0 owns … Stage 5.5 owns … Stage 8.8c owns … Stage 8.8d owns … DGFloer Layer 1 consumes these ordinary targets").

**Claim.** AlgebraicTopology owns these targets and DGFloer Layer 1 consumes them.

**Witness.** `TauCetiRoadmap/DGFloer/README.md` on main today (eaf17b10, the merge base of this head) still builds them as its own: line 462 "Hurewicz in degree one", line 470 "Weak equivalences and CW approximation" with `connectedMapHomologyComparison` at 474, line 659 "Serre classes and Hurewicz modulo a class"; and line 232 states the opposite direction, "AlgebraicTopology Stage 5.5 and GeneralizedCohomology consume these targets". DGFloer's open revision (#1798, head 95dc9359) keeps the same sections (§1.1 at line 878, §1.2 at 905, §1.4 at 1156) and at line 998 calls its spectral sequence "the spectral sequence consumed by AlgebraicTopology Stage 5.5". The pull request does not touch the DGFloer folder. Carried from the previous review (its R01); the AlgebraicTopology side is done.

**Repair.** Complete the move on the supplier side: DGFloer's README cites Stages 4.8, 5.0, 5.5, 8.3, 8.8c and 8.8d instead of building Layer 1 items 1, 2 and 4, and its line 232 states the direction this README states; either in this pull request (which then names DGFloer among its folders) or in DGFloer's revision with the order stated in both descriptions.

## R02 (P2) — Headline theorems statable at the pins but absent, and one not statable that the docstring does not name

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` lines 28–67 (module docstring) and the file as a whole.

**Claim.** The file states every headline that is statable on native carriers and names each one that is not.

**Witness.** Five deliverables the README treats as end theorems have every carrier at the pins and are not stated:

- *CW approximation* (README 918–921, Hatcher 4.13): for every `X : TopCat.{u}` there is a Hausdorff CW complex `Z` and `f : C(Z, X)` inducing a surjection on path components and bijections on every `HomotopyGroup (Fin n) Z z`; the carriers are those of `whitehead` (line 641).
- *Weak-equivalence invariance of homology* (README 901–917, tom Dieck 9.5.1): with the hypotheses of `whitehead` on `f`, `IsIso` of `((AlgebraicTopology.singularHomologyFunctor (ModuleCat R) n).obj M).map (TopCat.ofHom f)` for every `R`, `M`, `n`; the carrier is the one used at line 660.
- *Künneth over a field* (README 987–988): `Nonempty (SingularHomology k (ModuleCat.of k k) (TopCat.of (X × Y)) n ≃ₗ[k] ⨁ (ij : {ij : ℕ × ℕ // ij.1 + ij.2 = n}), H_(ij.1)(X) ⊗[k] H_(ij.2)(Y))`, all native.
- *Cellular comparison in arbitrary dimension* (README 537–538): `Nonempty ((cellularChainComplex R X).homology n ≅ SingularHomology R (ModuleCat.of R R) (TopCat.of X) n)` for every Hausdorff `[CWComplex univ]` X; `cellularChainComplex` (line 171) carries no finite-dimension hypothesis, and the docstring's reason at 51–52 ("the chain map is data") does not apply to the isomorphism statement.
- *Mapping-space CW type* (README 2293–2296, Milnor 1959 Theorems 3–4): for a finite Hausdorff CW `K` and a Hausdorff CW `X`, `∃ Z, …, Nonempty (C(K, X) ≃ₕ Z)` on Mathlib's compact-open `C(K, X)`; the shape is that of `FiniteCWTypeModel` (line 542).

Conversely the proper Whitehead theorem (README 1983–1988) is not statable, since compactly supported cohomology is not at the pins, and the docstring names "proper homotopy rectification (Stage 8.5)" as stated without saying that the theorem itself is not.

**Repair.** State the five as `sorry`'d theorems (the three existence statements under `nonempty_*` names, per the hygiene rule) and add the proper Whitehead theorem, with what it lacks, to the docstring's not-statable list.

## R03 (P3) — Statement hygiene: an existence of isomorphism not named `nonempty_*`

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` line 623 `hurewicz_degreeOne` concluding `Nonempty (Additive (Abelianization (FundamentalGroup X x)) ≃+ …)`; line 630 `hurewicz_connected`, whose second conjunct has the same shape.

**Witness.** Gate at this head `statement-hygiene=1` on line 624 with the repair it names; the docstring at 613–618 says the Hurewicz map itself is data at the pins, so the canonical-map form is not available.

**Repair.** Rename to `nonempty_hurewicz_degreeOne_addEquiv` and `nonempty_hurewicz_connected_addEquiv` (or split the second into the vanishing statement and a `nonempty_*` corollary).

## R04 (P3) — A native Euler characteristic restated

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` lines 563–565 `finiteCWEulerCharacteristic`, used by `FiniteCWTypeModel.eulerCharacteristic` (568) and `finiteCWEulerCharacteristic_eq_of_homotopyEquiv` (599), with the two `example`s at 577–597 proving it equal to the native invariant.

**Witness.** Tau Ceti at the pin: `cwEulerChar` in `AlgebraicTopology/Cellular/EulerCharacteristic/Basic.lean` lines 64–65 is `∑ᶠ n, (-1)^n * Nat.card (cell C n)` for any relative CW complex `C`, the same formula; the README's own Inventory (lines 246–250) says to "transport the native alternating cell count … rather than introducing another cellular Euler invariant".

**Repair.** Delete `finiteCWEulerCharacteristic` and the two examples; let `FiniteCWTypeModel.eulerCharacteristic` return `TauCeti.cwEulerChar (Set.univ : Set m.X)` and state the homotopy-invariance headline on `TauCeti.cwEulerChar (Set.univ : Set X)`.

## R05 (P3) — Gate: a backticked identifier the README presents as its own

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` line 1003 "via Mathlib's `isQuotientCoveringMap_iff_isCoveringMap_and` (`Topology/Covering/Quotient.lean`)".

**Witness.** Gate at this head `readme-ids-missing=1` on that name; it is Mathlib's (`Topology/Covering/Quotient.lean` line 339 at the pin), and the gate's rule accepts a name that is declared or mentioned in `Suggested.lean`. The previous review's suggested wording ("Mathlib's …") does not satisfy the gate.

**Repair.** Add `#check isQuotientCoveringMap_iff_isCoveringMap_and` to the pin block at lines 79–83 (the roadmap consumes it in 5.3), or write the fact in prose without the name.

## R06 (P3) — Edits outside the pull request's named folders

**Location.** `git diff --stat origin/main...HEAD` excluding the sixteen folders the brief names: `Completed/ArithmeticDirichletSeries/README.md` (one line) and `TauCetiRoadmap/SymplecticGeometry/README.md` (three lines); gate `outside-folder=2`. Carried from the previous review (its R10).

**Witness.** Neither folder is among the pull request's own; the description announces both cuts, so the defect is the folder list.

**Repair.** Name the two folders as the pull request's own (each then gets its review), or drop the hunks.

## R07 (P3) — README and Lean do not agree: own names undeclared, Lean names unnamed, docstrings missing

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` and `Suggested.lean`.

**Witness.** (a) Twenty-three backticked names of this roadmap's own are declared nowhere in the folder's Lean files nor in the pinned libraries: `supBallEuclideanDiskHomeomorph` (370, 575), `diskQuotientSphereHomeomorph` (565), `reducedSuspensionSphereHomeomorph` (567, 594, 598), `compactReducedSuspensionCarrierComparison` (588), `diskBoundaryRelCW` (643), `relativeCWPushout` (663), `homotopyPushoutGluingComparison` (677), `cofibrationTowerHomotopyEquivalence` (703, 752), `cwSubcomplexTowerUnion` (720), `relativeCWPushoutCWModel` (736), `cwProductKelley` (772, 1894), `cwSubcomplexNeighborhoods` (775), `simplicialRealizationCW` (875), `compactTriadPoincareLefschetz` (1778), `homotopyGroupKelleyProduct` (1886), `simplicialGroupKan` (1910), `simplicialGroupMooreHomotopyIso` (1911), `kanRealizationUnitHomotopyIso` (1918), `ordinaryEMRelativeRepresentability` (2254), `finiteSourceMappingCWType` (2289, 2293), `basedLoopCWType` (2290, 2328), `ordinaryEMLoopComparison` (2332), `ordinaryCohomologySuspension` (2340, 2362). The previous review's R09 listed several of these; the gate flags only theorem-style names. (b) 110 of the 155 declarations of `Suggested.lean` are named nowhere in the README (among them `hurewicz_degreeOne`, `whitehead`, `homologicalWhitehead`, `poincareDuality_zmodTwo`, `compactSupportTopClass_exists`, `compactManifoldFiniteCWType`, `towerDifference_surjective`, every `lsCategoryCount_*`). (c) 45 declarations carry no docstring (lines 87, 91, 143, 264, 274, 307, 599, 688, 719, 802–816, 823, 831, 866, 887, 931–994, 1008, 1047–1061, 1268–1316, 1360, 1365).

**Repair.** State (a) in prose (DGFloer on main and RiemannianGeometry cite `reducedSuspensionSphereHomeomorph` and `compactReducedSuspensionCarrierComparison` by name, so give those two a one-line prose description they can follow); name in the README each declaration kept after R08; give every kept declaration a docstring stating the mathematics.

## R08 (P3) — `Suggested.lean` is still an API catalogue

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean`.

**Witness.** Definitions no stated headline mentions: `cechFundamentalGroupoidDiagram`/`Cocone` and `fundamentalGroupoid_openCover_isColimit` (139–151), `mayerVietorisConnecting` (162), `cellularChainComplex` (171, used only by examples), `FiniteCover`, `RegularDeckAction`, `regularDeckChainMap`, `coverHomologyAction`, `coverHomologyRep` (187–251), `nativeEilenbergZilber` (255), `dualSystemRelativeCochainComplex` (269), `restrictCoefficientSystem` (312), `relativeLocalPairMap`, `twistedRelativeLocalMap`, `RelativeTwistedClassDatum` (317–344), `embeddingLocalPairMap`, `embeddingIntegralLocalMap` (383–398), `FundamentalClassDatum` (436), `BasedTopPair`, `NDRPairData` (514–535), `countableLimOne` (685), `ordinaryDoldKanSimplicialModel`, `ordinaryDoldKanLabeledSimplex`, `ordinaryDoldKanBasepoint`, `NormalizedAbelianEMFamily`, `ordinaryEMModelFromFamily` (740–781), `coordinateCubePair`, `coordinateSimplexPair`, `coordinateSimplexIdentityChain`/`_cycle`/`Class`, `homotopySpherePolePair` (793–824), `coordinateSupBall`/`Pair` (928–932), the disk, cube, smash, suspension and cone carriers (937–998), `compactConvexRadialReach` (1043). Theorems that are API, adapters or boundary cases: `RegularDeckAction.isQuotientCoveringMap` (209), `relativeCWConnectivityOfCellDimension_transport` (487, a transport along bijections), the three `compactConvexRadialReach` lemmas (1047–1066), `brouwerFixedPoint_closedBall`, `_unitClosedBall_continuous`, `_continuousOn` (1024–1040), `HasProperHomotopyInverse.exists_homotopyEquiv` (1171), `lsCategoricalCoverEmpty`, `lsCategoryCount_empty`, `_le_iff`, `_eq_zero_iff`, `_mono`, `_union_le`, `_le_of_homotopic_id`, `_homotopyEquiv`, `_discrete`, `_contractible`, `_eq_normalized_add_one`, `_sigma` (1247–1319), `isZero_singularCohomology_point`, `lsCohomology_restrict_eq_zero` (1335–1349), and the five `example`s. The one-tactic probe closed none of the 51 `sorry`s, so none is trivial; they are catalogue entries, not acceptance tests.

**Repair.** Delete them from `Suggested.lean` (the README keeps each as a target or Check), keeping the definitions a stated headline needs: the singular, twisted, supported and cohomology carriers of Stage 6.3–6.4, `LocallyRepresentedTopSection`, `capProduct`, `cupProduct`, `FiniteCWTypeModel`, `ordinaryIntegralHomology`, `towerDifference`, `groupClassifyingSpace` with its basepoint, `OrdinaryEMModel`, `continuousHomotopyClasses`, `ordinaryEMPullback`, `ordinaryPairQuotient` with its maps, `relativeCWPushoutCarrier`, the proper-homotopy predicates, `LSCategoricalCover`, `lsCategoryCount`, `LSPositiveCupProduct`, `lsCupLength`.

## R09 (P3) — Pull-request description: unstated order with the two other revisions of this folder, and a second owner of the coreflection

**Location.** Pull-request description, merge-order paragraph ("#1101 → #1807 → this pull request … #1808 is independent"), unchanged since the previous review.

**Witness.** (a) The overlap index lists #1652 (compact Čech pairs and relative cup modules) and #1663 (intersections, representatives and a Whitehead counterexample) as conflicting with this head in `README.md`, `Suggested.lean` and `TopologicalGroupFundamentalGroup.lean`; neither is named (previous review's R17). (b) HomotopySpheres at its head (#1287, b3f62ce9) still "owns `TopologicalSpace.compactlyGenerated` packaged as the right adjoint k in the coreflection" (its README lines 142–143, 399, 811–815), the object this README's Stage 4.5 now owns at lines 124–137 and 801–823 as the previous review's R02 prescribed; the folder is right (AlgebraicTopology is on main and HomotopySpheres consumes it), but the second owner is settled only when that revision cites Stage 4.5.

**Repair.** State which of #1652, #1663 and this pull request is rebased on which, and record that HomotopySpheres' §3A.1 is to cite AlgebraicTopology Stage 4.5 for the coreflection, its counit and the product comparisons (a note for that pull request's review; no change to this folder).

## Previous findings

- R01 — not repaired: DGFloer on main (eaf17b10) lines 232, 462–478, 659 and #1798 head lines 878, 905, 998, 1156 (R01 above).
- R02 — repaired: depcheck prints `0 problem(s)`; the HomotopySpheres §3A citations are gone (README 124–137 and 801–823 own the interface; 135–137 make HomotopySpheres a consumer; 2389–2396 own the suspension–loop adjunction; 2329–2331 and 586–592 cite Stage 4.5).
- R03 — repaired: no `pull/284` link and no UPWARD line.
- R04 — repaired: `set_option=0`; the compact-support theorem is split into `compactSupportTopClass_exists` (408) and `_unique` (422).
- R05 — repaired: `sorry-data=0`; every sorry'd definition and every theorem on one is gone.
- R06 — repaired: `module`, `public import Mathlib`, `public import TauCeti.*`, `@[expose] public section` at lines 1–69; `chartAt` deleted; `build=0`.
- R07 — repaired: the 8.8c docstrings at 698–701 and 737–739 name the family as this roadmap's target; the 8.9 block is deleted and the docstring (60–62) names it as not statable.
- R08 — repaired: line 1419 writes the compactly supported cochains as a code span; `tex=0`.
- R09 — partly repaired: `coordinateCubeReferenceChain_eq_shuffle` and the other theorem-style names are gone; the Mathlib name stays (R05 above) and 23 camelCase own names stay (R07 above).
- R10 — not repaired (R06 above).
- R11 — repaired: References 2553–2563 list Strøm, Milnor's *Morse Theory*, tom Dieck, Serre 1953 and Freedman–Quinn with their locators; "FQ" is expanded at 1968.
- R12 — repaired: lines 811–812 require X compactly generated and Y locally compact Hausdorff, with the cocountable counterexample kept at 815–818.
- R13 — repaired: lines 2189–2200 give the Prüfer-and-Künneth route for the fixed-d class and keep transfer plus directed union for the torsion class.
- R14 — repaired: Inventory 279–291 and 4.6 at 840–845 cite the Mathlib topology and Tau Ceti's instances; the mathlib4#44117 link is gone.
- R15 — repaired: the six orientation files are deleted; `TopologicalGroupFundamentalGroup.lean` has the module header and a single `public import Mathlib`.
- R16 — repaired except one hit: `statement-hygiene=1` (R03 above).
- R17 — not repaired (R09 above).

## Verified sound

**Gate, depcheck, build, probe at 25e4020.** The worker's gate: FAIL on `statement-hygiene=1`, `readme-ids-missing=1`, `outside-folder=2` only; `set_option=0`, `sorry-data=0`, `tex=0`, `depcheck=0`, `build=0`. The brief's depcheck command, run today: `depcheck: 239 roadmaps, 2423 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line. The one-tactic probe (a scratch copy with each of the 51 `sorry`s replaced by `first | (rfl; done) | (simp; done) | (infer_instance; done) | sorry`, elaborated with `lake env lean` from the worktree): exit 0, no error, still 51 declarations using `sorry`, so no theorem closes by one tactic. The worker's elaborated-signature transcript lists three declarations with a binder that looks dropped (`compactConvexRadialReach`, `relativeCWPushoutInclusion`, `relativeCWPushoutCarrier`); all three are definitions whose types do not mention the binder, so nothing is lost, and the transcript's one error (`TauCetiRoadmap.AlgebraicTopology.of`) is an artefact of its name extraction, not a declaration of the file. The README's new claim that Tau Ceti's `Topology/Algebra/Projectivization.lean` cannot be imported beside `Mathlib` (lines 289–291) was tested: a two-import scratch file fails with "environment already contains `Projectivization.instTopologicalSpace._aux_1` from `Mathlib.Topology.Algebra.Projectivization`".

**Seeded sample (15 of the 26 theorem-numbered locators, seed 1854052).** Read at the locator in the cached texts:

| target (README line) | source line | verdict |
| --- | --- | --- |
| Hatcher Thm 2A.1 (1934) | hatcher 7230–7233 | path-connected X, kernel the commutator subgroup, iso from the abelianisation: as stated; `hurewicz_degreeOne` carries `PathConnectedSpace` |
| Hatcher Lemma 4.6 (923) | hatcher 15116–15122 | B ≠ ∅ and π_n(Y,B) = 0 for each n with an n-cell in X−A; the README's n-connected pair with cells ≤ n implies both |
| Hatcher Lemma 3.27 (1494) | hatcher 10255–10259 | (a) unique class with prescribed local images over compact A, (b) vanishing above n; the README's local-system form is stated as its own extension of this route |
| Hatcher Prop 4.13 (921) | hatcher 15375–15383 | every space has a CW approximation; pairs by Example 4.14: as stated |
| Hatcher Thm A.6 (786) | hatcher 22693–22697 | product cells give a CW structure on (X×Y)_c; equality with X×Y when a factor is locally compact: as stated at 786–788 |
| Hatcher Prop 4.18 (926) | hatcher 15454–15460 | maps between n-connected models, unique up to homotopy rel A: as stated |
| Hatcher Lemma 4.31 (2152) | hatcher 15931–15935 | wedge of n-spheres with (n+1)-cells, n ≥ 1, Y path-connected, every ψ on π_n realised: as stated |
| Hatcher Prop 0.19 (765) | hatcher 867–869 | HEP pairs, homotopy equivalence with f restricting to the identity on A is one rel A; applied to the 0-cell basepoint |
| Hatcher §3.G transfer (1006) | hatcher 14023–14031 | τ sums the n lifts, a chain map with π♯τ = n: as stated at 996–998 |
| FTW Thm 4.2 (2019) | ftw1973 600–607 | finite-dimensional, countably based, locally finite C with C and its dual acyclic ⇒ locally finite contraction: as stated |
| FTW Lemma 4.3 (2031) | ftw1973 610–614 | neighbourhood-of-infinity filling: as stated at 2024–2031 |
| FTW Cor 4.9 (2039) | ftw1973 752–756 | finite-dimensional locally finite CW, simply connected and at infinity: proper f is a proper homotopy equivalence iff H_* and H_c^* isomorphisms: as stated at 1983–1988 |
| Strøm Thm 6 (694) | strom1972 181–185 | (X,A)×(Y,B) cofibered when A is closed: the README keeps "closed A" |
| Brown Ch. 6–7 (344) | brown 9424–9431 (6.7.2) | groupoid van Kampen for a representative set of basepoints: the spine claimed |
| FQ §7.7 (1968) | — | not verifiable (below) |

**Adversarial table.** Rows marked r31/r42 carry values computed at earlier heads on text unchanged since; rows marked r52 were computed today.

| statement | instances | values each side | result | source |
| --- | --- | --- | --- | --- |
| `hurewicz_degreeOne` | S¹; S¹∨S¹; point | ℤ=ℤ; (F₂)ᵃᵇ=ℤ²=H₁; 0=0 | as stated | r52 |
| `hurewicz_connected` | S², n=0; S³, n=1 | π₁=0 ⇒ H₁=0, π₂=ℤ=H₂; π₁=π₂=0 ⇒ H₁=H₂=0, π₃=ℤ=H₃ | as stated | r52 |
| `whitehead` needs `hf₀` | X=∅, Y=pt | `hf` vacuous, no equivalence ∅≃ₕpt | hypothesis needed and present | r52 |
| `homologicalWhitehead` needs simple connectivity | Poincaré sphere P → S³ | H_* iso, π₁(P)≠0, not an equivalence | hypothesis needed and present | r52 |
| `poincareDuality_zmodTwo` | n=0, M two points; RP²; M=∅ | c=(1,1), H⁰=(ℤ/2)²→H₀ bijective; H¹=ℤ/2→H₁=ℤ/2, H⁰→H₂=ℤ/2; 0→0 | as stated | r52 |
| `compactSupportTopClass_unique` | m=0 discrete, L arbitrary; m=1, ℝ, K=[0,1], L=ℤ | H₀(M,M∖K;L)=⊕_{x∈K}L_x, images the coordinates; H₁(ℝ,ℝ∖K)=ℤ→ℤ iso | determined by local images | r52 |
| `compactSupportTopClass_exists` | K=∅; S¹ with L=ℤ, s constant; S¹ with L the sign system | c=0; c the fundamental class; locally represented sections of the sign system are 0, H₁(S¹;L)=0 | as stated | r52 |
| `relativeCWConnectivityOfCellDimension` | (D²,S¹), λ=2; (Dⁿ,Sⁿ⁻¹), λ=n | π₀ bijective, π₁(S¹)=ℤ→0 onto; iso for q≤n−2 (0=0), onto at n−1 | as stated; `2 ≤ cellLowerBound` unused (vacuous below 2) | r52 |
| `ordinaryEMRepresentability` | X=S¹, A=ℤ, n=1; X=S¹⊔S¹; X=pt | [S¹,K(ℤ,1)]=ℤ=H¹; ℤ²=ℤ²; 1 class = H¹(pt)=0 | free classes equal based ones on components (K simple) | r52 |
| `towerDifference_surjective` | constant tower ℤ; the 2-adic tower (maps ·2) | δ onto; coker δ = ℤ₂/ℤ ≠ 0 | surjectivity hypothesis needed and present | r52 |
| `RegularDeckAction.isQuotientCoveringMap` | ℤ/2 on S¹→S¹, z↦z²; E=B=∅ | sheets separate, g U∩U≠∅ ⇒ g=1; vacuous | matches Mathlib's `disjoint` and orbit fields (Quotient.lean 39–41) | r52 |
| `groupClassifyingSpace_isEMOne` | G=1; G=ℤ | realization a point, aspherical, π₁=1; S¹, π₁=ℤ | matches `IsAspherical ∧ Nonempty (π₁ ≃* G)` (Basic.lean 59, 123) | r52 |
| `ordinaryPairQuotientComparison` at n=0 | B≠∅; B=∅ | H₀(X,B) free on components missing B = H̃₀(X/B); H₀(X)=H̃₀(X₊) | as stated for all n | r52 |
| `noRetraction_diskBoundary`, n=0 | D⁰, ∂D⁰=∅ | no map D⁰→∅ | vacuously as stated | r52 |
| `brouwerFixedPoint_closedBall` | r=0 | ball {a}, fixed | as stated | r52 |
| `compactConvexRadialReach` | C={c} (direction 0) | no unit vector, lemmas vacuous | consistent | r52 |
| `lsCategoryCount` values | ∅; point; two-point discrete; Sⁿ; Cantor set | 0; 1; 2; 2; ∞ (a categorical open of a totally disconnected space is a point) | `_discrete`, `_contractible`, `_lt_top_of_compact` consistent | r52 |
| `lsCategoryCount_sigma` | J=∅; two components | 0=0; 1+1=2, a nullhomotopy path stays in one clopen summand | as stated | r52 |
| `lsCupLength_add_one_le_categoryCount` | Sⁿ; T²; X=∅ | 1+1≤2; 2+1≤3; 0+1≤0 false | `Nonempty X` needed and present | r52 |
| `LocallyContractibleSpace` reading (README 1352–1357) | Mathlib def, lines 81–83 | neighbourhood V ⊆ U with `Nullhomotopic (inclusion hVU)` | as read; interior V gives the open categorical set | r52 |
| 8.11b suspension–loop adjunction (2389–2396) | B=pt; B=S⁰ | ΣB=pt, 1=1; ΣS⁰=S¹, based maps S¹→Y = loops = based maps S⁰→ΩY | exponential law for the compact Hausdorff I and q×id_I quotient | r52 |
| 8.8d fixed-d route (2189–2200) | A=⊕_ℕ ℤ/d | each cyclic summand d-torsion by transfer, Künneth keeps exponent d, union keeps it | repaired route correct | r52 |
| 4.5 k(X×Y)=X×Y (811–812) | X cocountable uncountable, Y=pt | kX discrete ≠ X | counterexample kept; hypotheses now right | r52 |
| `relativeCWPushout_t2Space` | Z=pt, (D¹,S⁰) | circle, Hausdorff | as stated | r52 |
| `closedCofibrationCylinderHomotopyExtension` | A=∅; A=X | ∂I×X in I×X; all of I×X | as stated (Strøm Thm 6 with (I,∂I)) | r52 |
| `capProduct` degree guard | p=q; p>q | H^p⊗H_p→H₀; excluded | no junk subtraction | r52 |
| `finiteCWEulerCharacteristic_eq_of_homotopyEquiv` | S¹ with 1+1 cells; with 2+2 cells | 0; 0 | as stated (and restates `cwEulerChar`, R04) | r52 |
| 8.8b normalisation κ_bar∘π₁(c_G)=κ_Z | G=1; G=ℤ | constant map; generator ↦ edge +1, inverse convention gives −1 | the law fixes c_G | r42 |
| 8.8b pointed inverse unique | d, d′ | post-composition with c_G bijective on [Bπ,Z]_* | as stated | r42 |
| 5.3 transfer p_*τ=d·id | d=0; d=2 | 0=0; τ(σ)=σ̃₁+σ̃₂ | agrees with hatcher 14031 | r42 |
| 5.0 reindexing (a,b)=(1−2p−q,p−1) | (0,0); (2,1) | (1,−1); (−4,1) | agrees with E¹ | r31 |
| 5.0 cohomological reindexing | (1,2) | (5,−2) | agrees | r31 |
| 5.5 multiplicative sign (−1)^(qp′) | F=pt; B=pt | +1; +1 | reduces to cup | r31 |
| 4.6 RPⁿ differential 1+(−1)^k | k=1,2 | 0, 2 | agrees | r31 |
| 4.6/6.1 RP² sign system | twisted d, δ | H⁰=0, H¹=ℤ/2, H²=ℤ | agrees with 6.1 and 6.3 | r31 |
| 4.4 factor interchange | m=n=1 | −1 | agrees | r31 |
| 2.5 S⁰ reference class | q, −q | +1, −1, augmentation 0 | uniqueness needs both | r31 |
| 6.3 boundary conversion (−1)^m | m=1,2 | both −[r↑]; +1 | agrees | r31 |
| 6.5 linking symmetry | (3,1),(5,2),(7,3) | +1,−1,+1 | agrees | r31 |
| 7 Euler values | S⁰,S¹,T⁰,CP⁰ | 2,0,1,1 | χ(Tⁿ)=0 restricted to n>0 | r31 |
| 8.8c directed union vs colimit | S¹→S¹, z↦z² | indiscrete | negative example correct | r31 |
| 8.8d fixed dᵐ not a Serre class | ℤ/2→ℤ/4→ℤ/2 | not closed under extensions | agrees | r31 |
| 1.6 π₁ abelian under unital multiplication | S¹; S¹∨S¹ | ℤ; F₂ has no such multiplication | hypothesis needed; file proves it | r31 |

**Library declarations opened at the pins (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9).** Mathlib: `IsQuotientCoveringMap` (`Topology/Covering/Quotient.lean` 39–41) and `isQuotientCoveringMap_iff_isCoveringMap_and` (339–341); `LocallyContractibleSpace` (`Topology/Homotopy/LocallyContractible.lean` 81–83); `Nullhomotopic` (`Topology/Homotopy/Contractible.lean` 29); `TopologicalSpace.compactlyGenerated` (`Compactness/CompactlyGeneratedSpace.lean` 68), `UCompactlyGeneratedSpace` (91), `CompactlyGenerated` and `compactlyGeneratedToTop` (`Category/CompactlyGenerated.lean` 33, 78); `TopCat.disk`, `diskBoundary`, `sphere` (`Category/TopCat/Sphere.lean` 28–37); `TopPair.diag` (`Category/TopPair.lean` 106); `Projectivization.instTopologicalSpace` (`Topology/Algebra/Projectivization.lean` 44); `RelCWComplex` with its closed base (`CWComplex/Classical/Basic.lean` 109–128). Tau Ceti: `IsEilenbergMacLaneSpaceOne` and `IsAspherical` (`EilenbergMacLane/Basic.lean` 123, 59); `HasHomotopyExtensionProperty` (`Extension/Basic.lean` 97); `cwEulerChar` (`Cellular/EulerCharacteristic/Basic.lean` 64); `IsLocallyCollared.isCollared` with `[CompactSpace N] [T2Space M]` (`Boundary/Collar/Brown.lean` 459); the projectivization instances (`Topology/Algebra/Projectivization.lean` 90, 149, 188, 215, 251, 311). Each of the 63 other library names the README cites (`serreFibrations` and its six lemmas, `IsCollar`, the sphere and disk isomorphisms, `pathLoopSpaceMulEquiv`, `zerothHomotopyLoopSpaceEquivFundamentalGroup`, `hasHomotopyExtensionProperty_base`, `finsum_finrank_singularHomology_of_finite_cwComplex`, `cellularChainGroupIso`, `cellularDifferential`, `singularHomologyPretheory`, `isClosed_fixedPoints`, `isClosed_boundary`, the two embedding shapes, `spectralObjectMappingCone`, `coreE₂Cohomological`, `KanComplex`, `normalizedMooreComplex`, `sSetTopAdj`, the inhomogeneous chains and cochains, `HomologyPretheory`, `SSetPair`, `ZerothHomotopy`, the Čech names, `eilenbergZilberHomotopyEquiv`, `FundamentalGroup.mul_def`, `comp_prod_eq_prod_comp`, `gauge`, `intrinsicInterior`, `nonempty_continuousCohomology_addEquiv_groupCohomology`, `TopPairing.cup`) resolves by name at the pins.

**Cross-roadmap citations resolved today.** DGFloer on main eaf17b10 lines 186–188, 232, 462–478, 659 and #1798 head 95dc9359 lines 153, 182, 878, 905, 998, 1156 (R01); HomotopySpheres #1287 head b3f62ce9 lines 142–143, 316, 399, 811–815, 849, 660–692 (consumes AlgebraicTopology Stages 2–4, 6, 8, `homologicalWhitehead` and finite CW type; still owns the coreflection, R09); in this pull request, ClassifyingSpaces (consumes Stage 8 items 8a and 8c, Stages 1, 2, 4), CharacteristicClasses (AT 2.5, 4.5, 4.6, 4.8, 5.5, 6.0, 6.1, 8.2, 8.3, 8.5, 8.8b, 8.9, 8.10, 8.12), GeneralizedCohomology (AT 4.4–4.8, 5.0, 5.5, 6.0, 6.4, 8.2, 8.8c, 8.8d, 8.10), TopologicalKTheory (AT 4.5, 4.6, 5.5, 8.1, 8.5, 8.10), ComplexKahlerGeometry (AT 4.5–4.7, 5.0, 6.3, 8.12), MorseNovikov (AT 4.2, 4.3, 8.3, Stage 8 item 3): every cited stage exists in this README. The relative links of the Ownership section resolve on main. Merge order: AlgebraicTopology, DGFloer, ClassifyingSpaces, CharacteristicClasses, GeneralizedCohomology and MorseNovikov are on main; HomotopySpheres is at line 66.

**Ownership against open pull requests.** Checked by object for what this head states: the compact-generation coreflection (HomotopySpheres §3A.1, R09); the Serre and Eilenberg–MacLane machinery (DGFloer, R01); the nerve/bar model and its normalized comparison (ClassifyingSpaces in this pull request, one owner each side, unchanged since the previous review); the degree-one Hurewicz theorem (MorseNovikov and ClassifyingSpaces consume 8.3; DGFloer still builds it, R01); the Euler characteristic (Tau Ceti owns the cell count, R04); Lusternik–Schnirelmann category, the proper-homotopy predicates and `SimplyConnectedAtInfinity` (no second owner among the sibling checkouts; GeometricTopology and FourManifolds consume the predicate). The two other revisions of this folder, #1652 and #1663, were not re-read beyond the overlap index. StableHomotopyKTheory (#1227), nearest in vocabulary, is not given with its files and was not checked.

**Shape.** The README keeps the Stage form it has on main rather than the Layer/`**Checks.**` shape; like the earlier reviews of this decycling pull request, this one does not ask the pull request to recast it. `TopologicalGroupFundamentalGroup.lean` is fully proved (no `sorry`), with the header the rules require.

## Not verifiable

- Freedman–Quinn, *Topology of 4-Manifolds*, §7.7 (README 1968; sampled): Princeton, settled as uncertified in the manifest.
- tom Dieck 9.5.1 (904), Weibel 5.5.1(2) and 5.5.10 (959, 972), Milnor *Morse Theory* 3.6–3.7 (689), Serre 1953 Theorem 1 (2206), Lee, Thom 1954: settled as uncertified; not in today's sample.
- Hatcher, *Vector Bundles and K-Theory*, Section 3.3 (README 2427): not in the manifest; cited for the section-obstruction route only, no theorem number.

## Source issues

- none
