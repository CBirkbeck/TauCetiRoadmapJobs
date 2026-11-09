# Review of DGFloerPartII (pull request #1799 at 0cb1f18)

**Verdict:** needs changes

A full review: the folder changed by 162 lines since 58c40ae, the head the previous review read.
The pull request description has not changed since then.

- **Gate.** The worker's gate passes. My run with the build, against the brief's moved order,
  passes every check; the dependency check reports 0 problems.
- **Build.** `lake env lean` prints exactly 24 `sorry` warnings and nothing else.
- **Repairs.** Of the previous review's seven findings, three are repaired in the folder (R01, R04
  and R05 there), one is not applied and is not carried (its R02, see Ownership below), and three
  are description findings that the unchanged description still carries (R01–R03 here).
- **New.** R04 is a Check wording defect in 4.3.

## R01 (P2) — Not repaired: main's DGFloer still owns Theorem B and the §§6.3–6.4 and §7 material, and the description does not put #1798 first

This carries the previous review's R03 (and the one before it).

**Location.**

- README lines 41–43: "The base roadmap, cited as **DGFloer** by layer and item, owns every
  other numbered statement of the source".
- The description's merge-order paragraph ends "#1742 (GeneralAlgebraicKTheoryPartII) → **this
  pull request** (#1799)".

**Claim.** This roadmap is the single owner of Theorem B, §§6.3–6.4, §7 and their carriers.

**Witness.** Main's DGFloer (folder unchanged since 6aa0bc9c) holds Layer 1 items 7–8 (lines 834,
841: the homogeneous carriers and the explicit degrees), Layer 5 item 7 (line 1053: the projective
Morse–Bott energy), Layer 10 item 5's "Multiple realization and Theorem5.14/TheoremB" (line 1567)
and Layer 11 (line 1577: abundance, covering, homogeneous spaces, projective spaces, Theorem G).
These are 1.3, 1.4, Layer 2, 3.1–3.2 and Layer 4 here.

**Repair.** The README needs no change. Add to the description's merge-order paragraph:

> #1798 (DGFloer) merges before this pull request or together with it. It moves the source's
> Theorem B, §§6.3–6.4 and §7, and the homogeneous carriers, explicit degree computations and
> projective loop-space computations they rest on, out of DGFloer's Layers 1, 5, 10 and 11 and
> into this roadmap. Every DGFloer id this README cites resolves on main and at #1798.

**Tested.** #1798 (7d8ad276) lines 50–54 hand the material to DGFloerPartII, and its line 4241
lists what DGFloerPartII consumes; at that head 10.5 is "Theorems A and C" and Layer 11 is the
finite cover. Every DGFloer id cited here resolves on main (Verified sound).

## R02 (P3) — Not repaired: TopologicalKTheory #1807 still consumes 4.2a–4.2b in T1.6, and the description does not order it

This carries the previous review's R06.

**Location.**

- README lines 1933–1935: "It cannot consume 4.2a–4.2c in T1.5–T1.6 or in T2's `K` and `KO`
  groups".
- The description's merge-order paragraph does not name #1807.

**Witness.** At #1807's current head, `TopologicalKTheory/README.md` line 499 (T1.6a) reads
"equivalent to DGFloerPartII 4.2a's stable `O`", and line 824 (T1.6d) "comparison with
DGFloerPartII 4.2b's Grassmannian member Ω₇". Its T7 uses are lines 1505, 1525, 1537, 1576 and
1626.

**Repair.** The README needs no change. Add to the merge-order paragraph:

> #1807 (TopologicalKTheory, with its other roadmaps) merges after this pull request, and only
> once its T1.6a and T1.6d citations of DGFloerPartII 4.2a–4.2b have moved to T7: 4.2a–4.2b
> consume GeneralizedCohomology G4.0b, which consumes TopologicalKTheory T1.5–T1.6.

**Tested.** As #1807 stands the citations close a cycle: T1.6a → 4.2a (#1807 line 499) → G4.0b
(README line 1339) → TopologicalKTheory T1.5–T1.6 (main's GeneralizedCohomology line 2612).

## R03 (P3) — Not repaired: the description is stale

This carries the previous review's R07.

**Location.** The description says "`Suggested.lean` states the rotation family at a fixed pole,
the low-rank values of `π_(n−1)(SO(n))` and its torsion for odd `n`", "HomotopySpheres' James
construction and Bott periodicity", and "TangentialBordism's compact-image embedding".

**Witness.** `Suggested.lean` has no rotation family (0 occurrences of "rotation"); the folder
has 0 occurrences of "HomotopySpheres"; 3.1 uses TangentialBordism B5 and B6.3 (README lines
1118–1119); `Suggested.lean` now also states the splitting (line 328).

**Repair.** Three changes to the description:

- **Summary.** Replace "HomotopySpheres' James construction and Bott periodicity" with
  "GeneralAlgebraicKTheoryPartII's James construction and Bott–Samelson theorem; real Bott
  periodicity is proved here (4.2a–4.2c)".
- **Layer 3 sentence.** Replace "TangentialBordism's compact-image embedding" with
  "TangentialBordism B5's geometric Pontryagin–Thom and B6.3's rational oriented-bordism
  surjection".
- **Last sentence.** Replace it with:

  > `Suggested.lean` states the compact-generation coreflection and the product criterion of
  > 1.0; Theorem B; the finiteness of the capacity in Theorem I for spheres, manifolds covered by
  > diffeomorphisms, non-aspherical compact Lie groups, `CPᵈ` and `HPᵈ`; the finite-to-stable
  > range and real Bott periodicity of `π_i(SO(n))`; Lemma 6.35's seven low-rank values, its
  > splitting for odd `n ≥ 17` and its torsion for every odd `n`; and Theorem G.

**Tested.** Every name and statement in the replacement is in `Suggested.lean` at this head
(lines 94, 103, 120, 141–224, 256–291, 297–338, 354).

## R04 (P3) — The 4.3 Check says the splitting formula is false below its range; it fails only at `n = 3` and `n = 7`

**Location.** README lines 1654–1657: "The splitting formula is false below its range: for
`n = 7` it would give … while `π₆(SO(7)) = 0`; for `n = 3` it would give `0 ⊕ ℤ/2` while
`π₂(SO(3)) = 0`. The range `n ≥ 17` (`n ≥ 16` and odd) is part of the target."

**Claim.** Below `n = 17` the formula `π_(n−1)(SO(n)) ≅ π_(n−1)(O) ⊕ π_n(V_(n+2,2))` is false.

**Witness.** The README's own low-rank values (line 1605–1606) satisfy it: `n = 5` gives
`π₄(O) ⊕ π₅(V_(7,2)) = 0 ⊕ ℤ/2 = π₄(SO(5))`; `n = 9` gives `ℤ/2 ⊕ ℤ/2 = π₈(SO(9))` (line 1660
says "`n = 9` fits the same pattern"); `n = 11, 13, 15` give `0 ⊕ ℤ/2 = ℤ/2`. It fails only at
`n = 3` and `n = 7`, where the sphere is parallelizable and the boundary `π_n(Sⁿ) → π_(n−1)(SO(n))`
is zero.

**Repair.** Replace "The splitting formula is false below its range:" with "The splitting
formula fails at the parallelizable spheres `S³` and `S⁷`, so the target states it only in the
range of its source:". Keep the two instances and the last sentence.

**Tested.** Values for `n = 3, 5, 7, 9, 11, 13, 15, 17, 19` are in the adversarial table; the
reworded sentence adds no backticked name, LaTeX, process word or pull-request number, so it
touches nothing the gate's text scanners look for.

## Previous findings

| Finding at 58c40ae | Status at 0cb1f18 | Carried as |
| --- | --- | --- |
| R01 (P2): Lemma 7.7 restated for `d ≥ 2` | repaired: README lines 1822–1836 prove it for every `m ≥ 1` with the degrees `m = 2k − 3`, `k − 2`, and the Check at lines 1891–1896 works `T⁸ # (S³ × S⁵)`; verified against `bdho-cotangent` lines 5503–5505 (statement, `d ≥ 2`) and 5534–5536 (applied with `d = k − 2` or `2k − 3`) | — |
| R02 (P2): coreflection and product criterion owned by AlgebraicTopology #1808 | not applied; not carried, see Ownership | — |
| R03 (P2): description does not order #1798 | not repaired | R01 |
| R04 (P2): splitting statable but absent | repaired: `nonempty_pi_SO_mulEquiv_prod_stiefel` (lines 328–332) with `n = k + 3`, `Odd (k + 3)`, `14 ≤ k`, stable term in `SO(k+4)`, Stiefel term `π_(k+3)` of `TauCeti.stiefel (EuclideanSpace ℝ (Fin (k+5))) 2`; docstring lines 49–52 and 70–74; README lines 1623–1626 and the contract line 267–270 | — |
| R05 (P3): finite-stage factorization cited through AlgebraicTopology | repaired: contract lines 287–299, 1.0 lines 535–553 and 590–594, Layer 1 Dependencies line 891–892; `doubleFirstHomologySphereAddEquiv` in the contract (lines 219–222), 4.2 (lines 1272–1274, 1308–1309) and Layer 4 Dependencies; the four `TauCeti.TopCat` names and their hypotheses match the pin (below) | — |
| R06 (P3): #1807 order | not repaired | R02 |
| R07 (P3): stale description | not repaired | R03 |

No repair report accompanies 0cb1f18 on the board; the commit message names the three folder
repairs. None of the carried findings was marked "not actionable in this package".

## Verified sound

### Gate, dependency check and order

My run of the push gate on this head, with `--build` and the brief's moved order:

    gate DGFloerPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK

The brief's dependency check against `merge-order-moved.txt`:

    depcheck: 237 roadmaps, 2309 edges, 0 problem(s)

- In that order TangentialBordism is line 14, GeneralAlgebraicKTheoryPartII line 332,
  DGFloerPartII line 333. Every other supplier is on main: DGFloer, GeneralizedCohomology,
  ComplexKahlerGeometry, SmoothBundlesConnections, LieGroups, RiemannianGeometry, MorseTheory,
  GeometricTopology, AlgebraicTopology.
- No roadmap on the never-cite list appears in the folder. TopologicalKTheory appears only under
  Downstream consumers (lines 1929–1935).
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`,
  `Suggested.lean` and `metadata.toml`.
- Pins: Mathlib 1b1ccf4b, Tau Ceti 2fd255d9, the same as main's.
- The citation and overlap tools report nothing for this README.

### Build, signatures and padding

- **Build.** `lake env lean TauCetiRoadmap/DGFloerPartII/Suggested.lean` exits 0 with 24
  messages, all "declaration uses `sorry`", at lines 94, 103, 120, 141, 156, 174, 204, 217, 256,
  263, 270, 276, 283, 289, 297, 300, 303, 307, 311, 315, 319, 328, 337 and 354.
- **Signatures.** The elaborated types of all 24 sorried theorems, the abbreviation `SO`, the
  definition `soBlockInclusion`, the proved `soBlockInclusion_one` and the instance
  `instIsManifoldRealComplexProjectiveSpace` (`signatures.md`; its entries `of` and `on` are
  misparsed docstring words) were compared with the README statements: the hypotheses agree
  (connectedness only in Theorem B and the covering and Lie-group theorems; `2 ≤ n` for spheres;
  `0 < ℓ`; `Odd (k + 3)`; `14 ≤ k`; the stable ranges `j + 3 ≤ m`, `j + 11 ≤ m`, `i + 2 ≤ n`,
  `i + 1 ≤ n`). No section binder is lost: the file declares every binder in the signatures.
  - The Lie-group theorem carries no `IsManifold` or `T2Space` binder; neither is missing.
    Mathlib's `ContMDiffMul` extends `IsManifold I n G`
    (`Mathlib/Geometry/Manifold/Algebra/Monoid.lean` line 70) and `LieGroup` extends it (line 75
    of `LieGroup.lean`), so `CotangentBundle.symplecticForm`, defined under `[IsManifold I ∞ M]`
    (`TauCeti/Geometry/Symplectic/Cotangent/Bundle/Liouville.lean` line 273), elaborates; and a
    charted group is locally Hausdorff, hence T1, hence Hausdorff.
- **Padding probe.** Each of the 24 sorried theorems was tried, on a scratch file importing the
  built module, with `rfl`, `infer_instance`, `simp`, `decide`, `trivial`, and the same after
  `intros`: 24 failures. The proved `soBlockInclusion_one` is the basepoint proof that
  `HomotopyGroup.map` needs, not padding.

### Library declarations opened at the pins

Tau Ceti (2fd255d9), with the hypotheses the README states:

- `TauCeti.TopCat.exists_subset_range_ι_of_isCompact`
  (`TauCeti/Topology/Category/TopCat/Compact.lean` line 88): sequential colimit, injective
  transition maps, T1 stages, compact subset in one stage.
- `TauCeti.TopCat.exists_lift_of_compactSpace` (line 133): T1 stages and embeddings
  `c.ι.app n`, every map from a compact space factors through one stage.
- `TauCeti.TopCat.uCompactlyGeneratedSpace_of_isColimit` (line 75): any diagram.
- `TauCeti.TopCat.isClosedEmbedding_ι_of_isColimit`
  (`TauCeti/Topology/Category/TopCat/ClosedEmbedding.lean` line 158): directed preorder, closed
  embeddings as transitions.
- `TauCeti.MooreLoopSpace.doubleFirstHomologySphereAddEquiv`
  (`TauCeti/AlgebraicTopology/Sphere/HomotopyGroup.lean` line 135): `H₁` of the double Moore
  loop space of the unit sphere with an orthonormal basis indexed by `Fin 4`, to `ℤ`; and
  `subsingleton_homotopyGroup_sphere_of_lt` (line 66), `homotopyGroupSphereAddEquiv` (line 110).
- `TauCeti.stiefel` (`TauCeti/Geometry/Manifold/Instances/Stiefel.lean` line 162), a set of
  `Fin k → E`, with `mem_stiefel_iff` the orthonormality.
- `TauCeti.SmoothTwoForm.IsContractibleHZAdmissible` and `contractibleHZCapacity`
  (`TauCeti/Geometry/Symplectic/Capacity/HoferZehnder.lean` lines 179, 193);
  `IsNondegenerate.contractibleHZCapacity_smul` (line 246: `c > 0`) and `_image` (line 295).
- `HasContractibleAlmostExistence` (`TauCeti/Geometry/Symplectic/Hamiltonian/AlmostExistence.lean`
  line 167): for some `ε > 0`, almost every regular level in `(c − ε, c + ε)` carries a closed
  characteristic contractible in `W`; with `W = Set.univ` this is contractibility in `T*Q`.
- `symplecticForm` is `−dλ` (`Liouville.lean` line 279), the sign 3.3 uses;
  `mpullback_vectorBundleTranslateDiffeomorph_symplecticForm` (`Fiberwise.lean` line 114) gives
  `ω − …`, as the contract says.
- `TauCeti.IsAspherical` (`TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean` line 59):
  path connected and every `π_(n+2)` trivial.
- `codiscBundle` (`Codisc.lean` line 82): covectors of norm at most one for a
  `RiemannianBundle` on the tangent bundle.
- `TauCeti.ComplexProjectiveSpace` (`TauCeti/Topology/ComplexProjectiveSpace/Basic.lean` line
  58): orbit quotient of the unit sphere of `EuclideanSpace ℂ (Fin (n+1))` by unit complex
  scalars; `QuaternionicProjectiveSpace` (line 62): quotient by the opposite group of unit
  quaternions, that is right multiplication, as 1.3's Check says.
- Also opened: `IsRegularValue` (`RegularValue.lean` 92), `NormalSpace` (59),
  `instTopologicalSpaceNormalBundle` (70), `mapFundamentalClass` (275),
  `continuousOrthogonalToDiffSphere` (315), `nonempty_ndrPair_iff` (556),
  `twistedCochainComplexIso` (269), `realClifford_classification` (339), `realCliffordForm`
  (113), `pathLoopSpaceMulEquiv` (321), `IsCoveringMap.homotopyGroupPiMulEquiv` (174),
  `HomotopyGroup.map` (45), `HomologicalOrientation` (75), `LocalCoefficientSystem` (46),
  `NDRPair` (86).
- **Absences.** No homotopy group of `specialOrthogonalGroup`, no homotopy of `stiefel`, no
  finiteness of `contractibleHZCapacity` on a codisc bundle, no real-manifold instance on
  `ComplexProjectiveSpace`, no smooth `G/H`, no compactly generated product or coreflection.
  `TauCeti/LinearAlgebra/CliffordAlgebra/BottPeriodicity.lean` is the algebraic `(1, 1)`
  periodicity of Clifford algebras, not the homotopy theorem of 4.2c.

Mathlib (1b1ccf4b):

- `GeneratedByTopCat.adj` (`Mathlib/Topology/Convenient/Category.lean` line 295), with the
  family in `Type u` and `TopCat.{v}` in independent universes (lines 38, 42), so 1.0's "for all
  universes `u` and `w`" is available; `TopCat.toGeneratedByTopCat` (277);
  `generatedBy_eq_coinduced` (`GeneratedBy.lean` 55); `Quot/Sum/Sigma.isGeneratedBy` (257, 267,
  272); `ContinuousMapGeneratedBy.curryEquiv` and `ev` (`HomSpace.lean` 96, 120).
- `CompactlyGeneratedSpace.lean`: the sequential-space instance (line 211) and the weakly locally
  compact instance (line 355, proved through `compactlyGeneratedSpace_of_isClosed_of_t2`, so with
  Hausdorffness); `to_compactlyCoherentSpace` (365), `of_compactlyCoherentSpace_of_t2` (370).
  No product instance exists, and `compactlyGeneratedToTop` has no adjunction except
  `Condensed/TopCatAdjunction.lean` line 177 through condensed sets.
- `Topology.IsQuotientMap.continuous_lift_prod_left` (`CompactOpen.lean` 587); `IsMulTorsion`
  (`GroupTheory/Torsion.lean` 56); `Trivialization.IsLinear` (`VectorBundle/Basic.lean` 165);
  `specialOrthogonalGroup` (`UnitaryGroup.lean` 338).

### Cross-roadmap citations resolved

Main is 9ce8311; open heads are those of the 11:38 index.

- **DGFloer, main** (folder at 6aa0bc9c): Layer 0 (line 422); Layer 1 items 1–6 with item 5 the
  Pontryagin–Thom collapse (line 826) and item 6 the evaluation bundle (832); Layer 2 (846);
  Layer 3 (928); Layer 4 item 5, the arbitrary-CW Brown resolution (1004); Layer 5 items 1–6
  (1013–1050); Layer 6 items 3–5 (1085, 1097, 1107); Layer 10 items 1–5 (1549–1562); Layer 11
  item 3's finite cover and torus criterion (1620–1623).
- **DGFloer #1798 (7d8ad276).** Headings 1.1–1.6, 2.1–2.3, 4.1, 5.1–5.6, 6.3–6.5, 10.1–10.5,
  11.1–11.3; line 4241 names what DGFloerPartII consumes.
- **GeneralizedCohomology, main.** G2.10 (line 533), G4.0 and G4.0b (938–958), G4.3–G4.5
  (1224–1246), G5 (1373) with item 2 (1523) and item 6 (2212).
- **TangentialBordism #942 (7022ba93).** B5.1 (line 1329: the coefficient collapse compared with
  G5.2's unframed collapse; a positive point collapses to a degree-one map, a reversed framing to
  degree −1, the empty cycle to the basepoint), B5.5 (1677: the signed count), B6.3 (2726: the
  orientation-map surjectivity, rational surjection, geometric preimages).
- **GeneralAlgebraicKTheoryPartII #1742 (ca443590).** `### 4.30b The James reduced product`:
  universal property, functoriality, cells, filtration quotients, homology over a ring `R` with
  `H̃_*(W; R)` flat, Bott–Samelson through the James equivalence for connected `W`, the James
  map a homotopy equivalence for connected `W`, Moore loops `TauCeti.MooreLoopSpace`. The
  contract of this README (lines 363–384) matches.
- **Other suppliers on main.** ComplexKahlerGeometry K7.1 (1407), K7.2 (1444);
  SmoothBundlesConnections B1.4 (421), B2.2 (605), B2.5 (802), B6.2 (1668), B6.3 (1716);
  LieGroups Layer 2 (`RepresentationTheory/LieGroups/README.md` 356); RiemannianGeometry R1 (186),
  R2 (322), R3 (369); MorseTheory M5 (857); GeometricTopology Layer 1 (177), Layer 3 (357);
  AlgebraicTopology Stage 4.4 (544–580, `reducedSuspensionSphereHomeomorph`), Stage 4 item 5
  (683, `cofibrationTowerHomotopyEquivalence`), Stage 6 item 5 (the degree characterization),
  Stage 8 items 5, 7 and 11a (1700, 1811, 1949), Stage 8.1–8.7.
- **Who cites this roadmap.** `roadmaps grep DGFloerPartII`: #1798 (5 lines) and #1807 (8 lines;
  R02). Nothing on main.

### Ownership

- **The coreflection and the product criterion (previous R02).** On main, AlgebraicTopology
  assigns the compact-generation coreflection to HomotopySpheres §3A.1 (its lines 117–118, 567,
  768), which is not on main and is on the brief's never-cite list. The revisions #1808 (its
  README lines 139–147, `Suggested.lean` line 110) and #1807 give it to a Stage 4.5, and
  HomotopySpheres #1287 (29eac994) line 436 now consumes it from an AlgebraicTopology "Stage 4
  item 8"; none of these is on main. A revision of a roadmap on main is never a dependency, so
  this roadmap cannot cite Stage 4.5, and a citation of it would resolve nowhere on main. The
  notion therefore moves down into 1.0, as 4.2a–4.2c already do for HomotopySpheres' Bott
  periodicity (#1287 `Suggested.lean` lines 127–132 state the same periodicity on `O(n)`), and
  this review does not carry the previous R02. When Stage 4.5 reaches main, 1.0's coreflection
  bullet, `compactlyGeneratedToTop_isLeftAdjoint` and `compactlyGeneratedSpace_prod` become
  citations of it; the two Lean names are declared in distinct namespaces, so no fully qualified
  name is shared.
- **4.2a–4.2c.** HomotopySpheres #1287 is on the never-cite list; the overlap is for it to settle.
- **TopologicalKTheory** owns the `BO` comparisons, as the Downstream bullet says (R02).
- **DGFloer** is the other owner on main of everything in Layers 1–4 here (R01).

### Seeded source sample

| Target | Locator checked | Result |
| --- | --- | --- |
| 1.0 | `strickland-cgwh` lines 122 (Prop 2.6: locally compact Hausdorff × CG), 159 (2.11), 177 (2.12), 290 (2.20), 1033 (5.1), 1086 (5.7), 1096 (Cor 5.8); `rezk-cg-spaces` 292 (his "locally compact" is Hausdorff), 313 (7.3), 382 (8.6), 409 (8.8), 433 (9.2); Hatcher A.6 (cache bebb3032 line 22693, printed p. 524) | as stated; A.6 gives `(X×Y)_c = X×Y` for one factor locally compact or both countable |
| 1.1 | Mathlib's sequential-space instance (line 211) | the metrizable lane is the instance; no external source |
| 1.2 | `bdho-cotangent` 4685–4687 (Prop 6.18, p. 108): polynomial, not graded commutative, degree `n − 1`; Hatcher 4J.1 (cache line 20284, p. 471); #1742 §4.30b | as stated |
| 1.3 | Tau Ceti projective models (lines 58, 62); Milnor–Stasheff, Steenrod not verifiable | dimensions and the right-line Check recomputed below |
| 1.5 | GeneralizedCohomology G5 item 2 (1523); TangentialBordism B5.1 (1329), B5.5 (1677) | the suppliers state the collapse, the signed point count and the independence used |
| 2.1 | `bdho-cotangent` 5283–5288 (Prop 6.39 proof, p. 122): `C_k ≅ T¹_pHPⁿ`, dimension `4n − 1`, index `2(k−1)(2n+1) + 3`, Ziller Thm 3, perfectness Thm 8; Ziller not verifiable | indices recomputed below |
| 2.3 | the same lines | gaps `4d − 1` and `3` recomputed |
| 2.4 | BDHO 2025 book not verifiable; DGFloer Layer 4 item 5 and Layer 5 item 4 on main | the Checks recomputed below |
| 2.5 | GeneralizedCohomology G4.0, G4.3–4.5 | bidegrees recomputed below |
| 2.6 | `bdho-cotangent` 5222–5240 (Prop 6.38, p. 120), 5257–5300 (Prop 6.39, pp. 121–122), 4792–4796 (Rem 6.19, p. 110), 5201–5210 (Ex 6.37, p. 120) | as stated; the source's "twice" for `CPⁿ` is a source issue |
| 3.1 | 4273–4275 (Thm 5.14 proof, p. 98: Thom's theorem); TangentialBordism B6.3; G5 item 6 | as stated |
| 3.3 | Tau Ceti `symplecticForm = −dλ` and the translation lemma | sign recomputed below |
| 4.1 | 4517–4528 (Def 6.11, Thm 6.12, p. 104), 4541–4578 (the `α − σ_*ev_*α` step), 4608–4616 (Prop 6.13, p. 106) | as stated |
| 4.2b | `eschenburg-hanke-bott` 264 (eq. (3)), 240–246 (Thm 2), 286–288 (Thm 3: module dimensions `1, 2, 4, 4, 8, 8, 8, 8, 16`, two modules for `k ≡ 3 mod 4`), 299–303 (Thm 4) | as stated |
| 4.4 | 5141–5142 (standing hypotheses, p. 118), 5156–5200 (Prop 6.36, pp. 119), 5201–5210 (Ex 6.37) | as stated; the nonorientable split is a source issue |
| 4.3 | 5073–5094 (Lem 6.35, p. 117: the seven values with `ℤ/4`, the splitting for `n ≥ 16`, Bott's table, `π_n(V) = ℤ/2`), 5095–5121 (first proof), 5122–5139 (second proof) | as stated with `π₈(SO(9))` corrected |
| 4.5 | 430–445 (Thm I, p. 11), 5218, 5247 | as stated without `CaP²`; the `ℓ`-covered clause is a source issue |
| 4.6 | 5354–5372 (setting and Thm 7.1, pp. 123–124), 5382–5396 (Ex 7.4), 5404–5423 (Prop 7.5 and the kernel bound), 5429–5431 (`α₀` of degree `3k − 3` or `2k − 2`), 5467–5501 (Lem 7.6), 5503–5536 (Lem 7.7 and its application) | as stated; the `d ≥ 2` gap is a source issue |
| 3.2 | 4267–4272 (Thm 5.14), 4140–4150 (Thm 5.10, p. 95); Hatcher 3.26 (cache line 10237, printed p. 236: `H_n(M; ℤ)` is `ℤ` or `0` by orientability) | as stated |

### Adversarial table

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Theorem B (Lean) | `T^r`; `ℝP³`; `U = ∅`; a point; `S² ⊔ T²` with `U = D*T²` | every `π_(ℓ≥2)(T^r) = 0`, `hQ` false; `π₃(ℝP³) = ℤ`, `hQ` true; `H_n(∅) = 0`, `hU` false; point: `π₂ = 0`; disconnected: hypotheses hold, the flat cosphere levels carry no contractible orbit | true; `ConnectedSpace` needed and present | none |
| Theorem B, nonorientable `Q` | closed connected nonorientable | `H_n(Q; ℤ) = 0` (Hatcher 3.26(b) with `R = ℤ`: image `{r : 2r = 0} = 0`), `hU` false | orientability implied | none |
| Theorem B route | `x` of infinite order, `d = Nb` | `d^m x ≠ 0` for every `m`, Thm 5.10 condition 2; `|d| = 1` is condition 1 | sound | none |
| 1.0 coreflection (Lean) | metrizable `Y`; `k(kY)` | `kY = Y` (sequential); `k(kY) = kY` since probes agree | true for all `u, w` | none (Ownership) |
| 1.0 product criterion (Lean) | `ℝ/ℤ₊ × ℚ`; `ℝ/ℤ₊ × [0,1]` | the first is not a quotient of `ℝ × ℚ` (Munkres), so not CG; the second is CG by the criterion | local compactness needed | none |
| 1.0 `S^∞` Check | `q_r = (e₀ + e_r/r)/|…|` | meets `S^s` in `s` points; norm limit `e₀`; closed discrete in the colimit, so no limit | as stated | none |
| 1.0 finite-stage lemmas | stages compact Hausdorff, bonding closed embeddings | T1 holds; `isClosedEmbedding_ι_of_isColimit` gives embeddings, so `exists_lift_of_compactSpace` applies | hypotheses met | none |
| 1.2 ring | `n = 2, 3`; `W = S⁰` | `H_k(ΩS²) = ℤ` all `k`, `x² ≠ 0` (graded commutativity would force `2x² = 0`); `ΩS³`: degrees `0, 2, 4, …`; `J(S⁰) = ℕ ≠ ΩS¹` so `n ≥ 2` needed | as stated | none |
| 1.3 dimensions | `V_(3,2)`; `U(2)/U(0)`; `CPᵈ`, `HPᵈ` | `2·3 − 3 = 3 = dim SO(3)`; `4·2 − 4 = 4 = dim U(2)`; `2d`, `4d` | as stated | none |
| 1.3 right lines | `v = (1, j)`, `λ = i` | `vλ = (i, −k)`; the only `μv` with first entry `i` is `(i, k)` | right action required; pin is `ᵐᵒᵖ` | none |
| 1.3 metric | `CP¹` of radius `1/2` | curvature `4`, period `π`, area `π = π∫ω_FS` | as stated | none |
| 1.4 `τ_u`, rotation family | `n = 1, 2, 3, 4` | `1 + (−1)ⁿ = 0, 2, 0, 2` for `τ`; `1 + (−1)^(n−1) = 2, 0, 2, 0` for `ev_p ∘ f`; `H₂(SO(3)) = 0`, `H₃(SO(4)) = ℤ²` | as stated, as `bdho` 5131 | none |
| 1.5 collapses | `N = ∅`; a framed point; the circle in `S³` | constant map, degree `0`; `±1`; `Th ν ≃ S³ ∨ S²`, compare after the Thom map | as stated | none |
| 2.1 indices | `CPᵈ`, `HPᵈ`, `k`; `d = 1` | `(2k−1) + (k−1)(2d−2) = 2d(k−1) + 1`; `3(2k−1) + (k−1)(4d−4) = 2(k−1)(2d+1) + 3`; `2k − 1`, `6k − 3` | as stated | none |
| 2.2 cells | `CP²` | degrees `0, 1, 4, 5, 8, 9`; `a₂ − b₁ = 5 − 4 = 1`; `H_*(S¹ × ΩS⁵)` in the same degrees | rank count needed | none |
| 2.3 cells | `HP²`; `HP¹`; general | `3, 10, 13, 20`; `3k`; `a_(k+1) − b_k = 2(2d+1) − (4d − 1) = 3` | as stated | none |
| 2.4 Checks | `CP¹`; `d = 0` | `E_(2,q) → E_(0,q+1)` iso since `P_pS²` contractible; point: both models `ℤ` | as stated | none |
| 2.5 bidegrees | `CP²`; `CPᵈ`; `HPᵈ` | `d₂: E_(2,4) → E_(0,5)`, `d₄: E_(4,1) → E_(0,4)`; `(2d,1) → (0,2d)` drops total degree `2d+1 → 2d`; `(4d,3) → (0,4d+2)` | as stated | none |
| 2.6 classes | `CPᵈ`; `HPᵈ`; `HP¹` | fibre `S¹ → S¹` degree `±1`; `S² × S¹ → S³` degree `1 + (−1)² = 2`; `dim Σ_p = 2d − 1`, `4d + 1` (`5` for `HP¹`) | `±g`, `±2g` | none |
| 3.3 sign | `T*ℝ²`, `σ = q₁dq₂` | `−d(p₁dq₁ + (p₂ − q₁)dq₂) = ω + dq₁∧dq₂` | `Ψ'*ω = ω + π*dσ`; pin `τ_α*ω = ω − π*dα` at `α = −σ` | none |
| 4.1 abundance | point; `T^r`; products | `Map(S², pt) = pt`, reduced shriek `0`; `Ω²T^r ≃ pt`; `deg(α × [N]) = deg α + dim N` | not, not, yes | none |
| 4.2 Serre comparison | twistor `S² → CP³ → S⁴` | `π₃(CP³) = π₃(S⁷) = 0`; `E_(2,0) → E_(0,1)` onto, class dies | `2n`-connectivity needed | none |
| 4.2 `n = 3` class | `H₁(Ω²S³)` | `π₁(Ω²S³) = π₃(S³) = ℤ`; pin: `H₁(ΩᴹΩᴹS³) ≅ ℤ` | as stated | none |
| 4.2a range (Lean) | `(n, i) = (2, 0), (2, 1), (3, 3), (4, 3), (1, 0)` | `π₀(SO(2)) → π₀(SO(3))`: pt → pt (`i = n − 2`); `π₁(SO(2)) = ℤ → π₁(SO(3)) = ℤ/2` onto, not injective (`i = n − 1`); `π₃(SO(3)) = ℤ → π₃(SO(4)) = ℤ²` not onto (`i = n`, neither hypothesis); `π₃(SO(4)) → π₃(SO(5)) = ℤ` onto (`i = n − 1`); `π₀(SO(1)) → π₀(SO(2))` onto | bounds sharp | none |
| Bott and stable values (Lean) | `(j, m) = (0, 11)`; `j = 1, 3, 4, 5`; `j = 0, 7`; `j = 2, 6`, `m = 5, 9` | `π₉(SO(11)) = ℤ/2 = π₁(SO(11))`; `π₂, π₄, π₅, π₆ = 0`; `π₁, π₈ = ℤ/2`; `π₃(SO(5)) = ℤ`, `π₇(SO(9)) = ℤ` | true; `i = 0` excluded (`π₈ = ℤ/2` vs `π₀ = pt`) | none |
| 4.2c index bounds | `m = 1`, `k = 0, 1, 3, 4, 5, 7`; `k = 2, 6`, `c = 0` | `λ = 7, 3, 1, 1, 1, 0`; `w = c`, `2c` (`m₂/4 = 1`, `m₆/4 = 2`); `2p ≥ s + c` from `p + q ≥ s`, `p − q = c`, so index `≥ (s − |c|)/4` | as stated | none |
| 4.2c stable members | `k = 1..8` | `Ω₁ = O(16m)/U(8m)`, …, `Ω₈ = O(m)`; `Cl₄ = M₂(ℍ)` gives `Sp(2m)`, `Cl₆ = M₈(ℝ)` gives `G_p(ℝ^(2m))`, `Cl₈ = M₁₆(ℝ)` gives `O(m)` | as stated | none |
| 4.2c stable groups | `i = 1..8` | `π₀(Ω_i)` has `2, 1, ℤ, 1, 1, 1, ℤ, 2` elements; `π₃ = π₁(U/Sp) = π₁(U) = ℤ` (`π₀(Sp) = π₁(Sp) = 0`); `π₇ = π₃(Sp) = π₃(S³) = ℤ` | as stated | none |
| Lemma 6.35 values (Lean) | `n = 3, 5, 7, 9, 11, 13, 15`; `n = 4` | `0, ℤ/2, 0, (ℤ/2)², ℤ/2, ℤ/2, ℤ/2`, by Kervaire's table (`n ≡ 1`: `(ℤ/2)²`; `n ≡ 3, 5, 7 mod 8`, `n ≥ 11`: `ℤ/2`); `π₃(SO(4)) = ℤ²` | `Odd` needed | none |
| Splitting (Lean) | `n = 17, 19, 21, 23, 25` | `π₁₆(O) ⊕ ℤ/2 = (ℤ/2)²`; `0 ⊕ ℤ/2 = ℤ/2` (`18 ≡ 2`); `0 ⊕ ℤ/2` (`20 ≡ 4`); `0 ⊕ ℤ/2` (`22 ≡ 6`); `ℤ/2 ⊕ ℤ/2` (`24 ≡ 0`); stable term read in `SO(n+1)`: `n − 1 ≤ (n+1) − 2` | true in the stated range; Stiefel term `ℤ/2` from `π_(n+1)(S^(n+1)) → π_n(Sⁿ)` multiplication by `χ(S^(n+1)) = 2` | none |
| Splitting below the range | `n = 3, 5, 7, 9, 11, 13, 15` | `0 ⊕ ℤ/2 ≠ 0`; `0 ⊕ ℤ/2 = ℤ/2` ✓; `0 ⊕ ℤ/2 ≠ 0`; `(ℤ/2)²` ✓; `ℤ/2` ✓; `ℤ/2` ✓; `ℤ/2` ✓ | fails only at `3, 7` | R04 |
| `π₈(SO(9))` | `css-derivative` 222, 249–252 | stabilization to `π₈(SO) = ℤ/2` split with kernel `ℤ/2`; `(ℤ/2)³ = π₈(SO(8))` onto | `(ℤ/2)²`, not `ℤ/4` | none |
| ℓ-covered (Lean) | `ℓ = 0`; `T^r`; `S³`, `ℓ = 1, 2` | `A = 0` excluded by `hℓ`; `hM` false; `π₃(S³) = ℤ` has `x^ℓ ≠ 1` | true; `ℓ = 1` is non-asphericity | none |
| Lie group (Lean) | `T^r`; `SU(2)`; trivial group | aspherical, excluded; `π₃ ≠ 0`; aspherical | true | none |
| Capacity (Lean) | `CP⁰`; `S⁰`; `S¹` | one-point `W`: admissible `F` vanishes, capacity `0 < ⊤`; `F = a` at one point admissible, so `∞`; flat `S¹`: `∞` | `2 ≤ n` needed, `d ≥ 0` fine | none |
| Metric independence | `D*_g₁ ⊆ λD*_g₂` | `c°(λW) = λc°(W)` (`contractibleHZCapacity_smul`, `λ > 0`); inclusion `π₁`-injective via the zero-section retractions | as stated | none |
| 4.4 `ℝP²` | `diag(A, −1)`, `det A = −1` | based lift `diag(−A, 1)σ̃` of determinant `−1`; `χ = −1`; coorientation `−1` | `(Φ_H)_*([H]×α) ≠ 0` | none |
| 4.6 degrees of `α₀` | `k = 2, 3, 4` | `3k − 3 = 3`, `2k − 2 = 4`, `3k − 3 = 9`; `m = 2k − 3 = 1`, `k − 2 = 1`, `2k − 3 = 5`; `ℓ = 2k − 2 = 2`, `k − 1 = 2`, `6` = `m + 1` | as `bdho` 5430, 5536 | none |
| Lemma 7.7 for `m ≥ 1` | `Y` `(m+1)`-connected | `E²_(p,q) = H_p(Y; H_q(Ω²Q))` untwisted (`π₁(Y) = 0`), zero for `1 ≤ p ≤ m + 1`; `d_r` into `E_(0,q)` starts at `E_(r, q−r+1)` with `2 ≤ r ≤ q + 1 ≤ m + 1`, zero; `E^∞_(p, i−p) = 0` for `1 ≤ p ≤ i ≤ m` | fibre inclusion iso on `H_i`, `i ≤ m` | none |
| Theorem G (Lean) | `S² × S⁴` (`k = 2`); `T⁸ # (S³ × S⁵)` (`k = 3`); `T⁶ ⊔ (S² × S⁴)`, `S = ∅`; `k = n` | `ℓ = 2, 2`; `d ≠ 0` needed (`g_*[∅] = 0`); `Y` a point, `n ≥ 3k − 1` fails, conclusion via Theorem H | true | none |
| 4.6 bound Check | `k < n` | `H_(n−k)(Y) = ℤ ≠ 0` and `H_j(Y) = 0` for `j ≤ ℓ` force `n − k ≥ ℓ + 1` | as `bdho` 5363–5364 | none |
| Downstream bullet | #1807 head | T1.6a → 4.2a → G4.0b → T1.5–T1.6 | cycle unless reordered | R02 |

### Headline theorems

- **Stated:** Theorem B (line 120); Theorem I's capacity forms (141, 156, 174, 204, 217);
  Theorem G (354); Lemma 6.35's values, splitting and torsion (297–338); the finite-to-stable
  range, Bott periodicity and the stable values (256–291); 1.0's coreflection and product
  criterion (94, 103).
- **Named as not statable, correctly:** Theorem H and the abundance conclusions (no shriek map for
  `Map(S², Q) → Q` at the pins); fibered families, sphere bundles and products; Proposition 6.36
  (no smooth `G/H`); the stable `O` with its Bott equivalences; the Clifford chain's index bounds.
- **Statable but absent:** none. The splitting of the previous review's R04 is now stated.

## Not verifiable

- **Paywalled, values recomputed instead:** J. Milnor, *Morse Theory*, §§22–24 (the index bounds
  and the colimit identifications of 4.2b–4.2c; Eschenburg–Hanke Theorems 2–4 support the
  qualitative statements); R. Bott, Ann. of Math. 70 (1959); W. Ziller, Invent. Math. 41 (1977),
  DOI 10.1007/BF01390161 (the index formula of 2.1 was recomputed from conjugate points and agrees
  with the source's restatement at `bdho-cotangent` line 5285).
- **Paywalled or not held, not read:** BDHO, *Morse homology with DG coefficients* (Birkhäuser
  2025), the chapter numbers of Layer 2; Thom (1954); [Jap87]; Steenrod, *The Topology of Fibre
  Bundles*; Milnor–Stasheff, *Characteristic Classes*; Pontryagin, *Smooth manifolds …*; Munkres,
  *Topology*, §22 Example 7.
- **Read from the cache, not in the manifest.** Hatcher, *Algebraic Topology* (author page,
  cache bebb3032): Theorem 3.26 (line 10237), Theorem 4J.1 (line 20284), Theorem A.6 (line
  22693). The board's `sources.toml` does not record it.

## Source issues

- **Error** in bdho-cotangent at proof of Lemma 6.35, printed page 117: the source says `π₈(SO(9)) = ℤ/4`; it should be `(ℤ/2)²`, the stabilization to `π₈(SO) = ℤ/2` being split with kernel `ℤ/2` (css-derivative, proof of Lemma 2.2); affects nothing.
- **Misprint** in bdho-cotangent at second proof of Proposition 6.34, printed page 118: the source concludes with Proposition 6.29 after showing `Sⁿ` is 2-covered; it should cite Proposition 6.33, the ℓ-covered form; affects nothing.
- **Error** in bdho-cotangent at proof of Proposition 6.38, printed page 120: the source says the `CPⁿ` family gives up to sign twice a generator of `H_(2n)(ΩCPⁿ)`; it should be a generator, one frame `(v, Iv)` per direction (Remark 6.19 at `n = 1`); affects nothing.
- **Misprint** in bdho-cotangent at proof of Proposition 6.23, printed page 113: the source describes the odd-case fibre as unit tangent vectors orthogonal to `u(p)`, `v(p)`; it should be the equator of sphere points of Example 6.20; affects nothing.
- **Gap** in bdho-cotangent at Lemma 7.7 and the end of the proof of Proposition 7.5, printed pages 126–127: the source states Lemma 7.7 for `d ≥ 2` but applies it with `d = k − 2` or `2k − 3`, which is `1` for `k = 2, 3`; it should state `d ≥ 1`, where its spectral-sequence argument works; affects the proof.
- **Error** in bdho-cotangent at §7 before Theorem 7.1, printed page 123: the source says ℓ-connectivity of `Y` forces `n ≥ 3k − 1` (even `k`) or `n ≥ 2k` (odd `k`); it should exclude `k = n`, where `Y` is a point; affects nothing.
- **Gap** in bdho-cotangent at Theorem I(ii), printed page 11: the source lists every non-`K(π,1)` manifold ℓ-covered in the sense of Definition 6.32; it should also require `π₂ ≠ 0` or a first nontrivial `π_k`, `k ≥ 3`, not ℓ-torsion, as Proposition 6.33 does; affects a stated result.
- **Gap** in bdho-cotangent at Proposition 6.36, printed page 119: the source concludes abundance for every closed positive-dimensional `H`; it should restrict to orientable `G/H`, since Definition 6.11 needs an orientation and `ℝP² = SO(3)/O(2)` is not orientable; affects a stated result.
