# Review of AlgebraicTopology (pull request #1808 at dc47c7e)

**Verdict:** needs changes

This is an incremental re-review of 0 changed lines since 6931121. The folder is byte-identical to the head the previous review read. The two commits since then (c9403e22, dc47c7e0) touch only CharacteristicClasses and LocalPurity. None of the eleven previous findings is repaired, so all eleven are written again below with their line numbers re-checked at this head. The outside facts their witnesses rest on have not moved:

- DGFloer, DifferentialGeometry, GeometricTopology and GeneralizedCohomology have no commit on main since c58403cb.
- ComplexKahlerGeometry and GeneralizedCohomology are unchanged at this head.
- The pins are unchanged (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9).
- DGFloer's open head moved to a64ca16f and keeps the same ownership claims.

The diff introduces no new finding. The gate still fails on the two outside-folder hunks (R05).

## R01 (P2) — Two owners of the ordinary Serre and Eilenberg–MacLane machinery: this folder and DGFloer

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` lines 113–131: "The ordinary Serre and Eilenberg–MacLane machinery is owned here. Stage 4.8 owns … Stage 5.0 owns … Stage 5.5 owns … [DGFloer] Layer 1 consumes these ordinary targets".

**Claim.** Stages 4.8, 5.0, 5.5, 8.8c and 8.8d are stated as the owners of these objects: CW approximation, the filtered-complex spectral sequence, the Serre spectral sequences, the functorial `K(A, n)` family, and Hurewicz modulo a Serre class. DGFloer still owns the same objects and states the opposite direction.

**Witness.** DGFloer on main, line 232: "AlgebraicTopology Stage 5.5 and GeneralizedCohomology consume these targets"; its items 2–4 are at lines 470, 621 and 659. At DGFloer's open head (a64ca16f): own-list lines 60–69, items 1.2–1.4 at lines 951, 1153 and 1207, and line 4281 "Stage 5.5 consumes Layer 1 item 2's …".

**Repair.** The direction this folder chose is the right one: DGFloer's supplier table consumes AlgebraicTopology Stages 2–8 (line 182 at a64ca16f), so DGFloer cannot supply Stage 5.5. Complete the move on the DGFloer side in one of two ways:

- In this pull request, naming DGFloer among its folders: replace DGFloer Layer 1 items 2–4 (1.2–1.4 at the open head) by citations of Stages 4.8, 5.0, 5.5, 8.8c and 8.8d, keeping only DGFloer's cubical transports. Delete main's line 232 and reword the open head's line 4281 as consumption of this roadmap.
- Or state in the description that the DGFloer revision is rebased on this pull request and makes that change, with the order given.

Either way, each object ends with one owner.

## R02 (P2) — The finite CW structure on ℂPⁿ has no owner

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` lines 1839–1846: "The complex-projective check consumes ComplexKahlerGeometry K7.1's projective model and K7.2's finite CW structure. … No complex-projective construction is required in Stage4". Stage 4.6 (lines 816–845) builds real projective space only.

**Claim.** Stage 7.4 hands the ℂPⁿ cell structure to ComplexKahlerGeometry K7.2, and K7.2 hands it back to Stage 4.6, so neither folder builds it.

**Witness.** `TauCetiRoadmap/ComplexKahlerGeometry/README.md` at this head, line 2242: "Consume AlgebraicTopology Stage 4.6's finite CW structure on `Projectivization ℂ (Fin (n+1) → ℂ)`". The same handoff appears in its scope lines 81–82, its supplier block (line 405) and its *Needs* lines 2221 and 2271. CharacteristicClasses line 766 reads "the finite AT4.6 RPⁿ and CKG K7 CPⁿ carriers".

**Repair.** Give Stage 4.6 the complex case beside the real one. Build the finite CW structure on native `Projectivization ℂ (Fin (n+1) → ℂ)`:

- one cell in each even dimension;
- characteristic maps `z ↦ [z : √(1−|z|²)]`;
- cellular differential zero;
- the cellular/singular comparison.

Build it from Stages 2–4 and the native quotient topology, by the real case's route. Then lines 1839–1846 cite 4.6: Stage 7.4 consumes 4.6 for `χ(ℂPⁿ) = n + 1` and keeps K7.1 only for the complex-manifold structure. ComplexKahlerGeometry's four citations and CharacteristicClasses line 766 then stand as written.

## R03 (P2) — Stages 4.8, 8.3 and 8.8c claim to own theorems of the pinned Tau Ceti

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md`:

- line 125: "Stage 8.3 owns the degree-one Hurewicz isomorphism `π₁(X)ᵃᵇ≅H₁(X;ℤ)`";
- line 889: "Own CW approximation: every space, and every pair, has a CW approximation";
- lines 873–887: the weak-equivalence specialization;
- line 1938: "own the theorem that the induced map … is an isomorphism";
- line 2197: "own the general higher-cell killing construction".

**Claim.** These passages state as targets of this roadmap theorems that the pinned Tau Ceti already proves.

**Witness.** All at Tau Ceti 2fd255d9:

- `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv` (`Hurewicz/One/Basic.lean` line 705);
- `TauCeti.isWeakHomotopyEquivalence_cwApproximationMap` (`CWApproximation/Basic.lean` line 336);
- `ContinuousMap.IsWeakHomotopyEquivalence.isIso_singularHomologyMap` and `isIso_twistedHomologyMap` (`WeakHomotopyEquivalence.lean` lines 110 and 169);
- `TauCeti.killHomotopyGroups` with its laws (`KillHomotopyGroups.lean` lines 260–465).

**Repair.** At lines 125, 1938, 889, 873–887 and 2197, replace "own" by consumption of the declarations above, entered in the *Inventory* with file and name:

- `HomotopyGroup.hurewiczHom_hom_one_eq_neg_hurewicz₁` for the sign;
- `cwApproximationLift` and its naturality (`CWApproximation/Naturality.lean` lines 84–125);
- `bijective_homotopyGroupMap_killHomotopyGroupsIncl`, `subsingleton_homotopyGroup_killHomotopyGroups`, `cwType_killHomotopyGroups` and `TopCat.Hom.exists_killHomotopyGroupsIncl_comp_eq`.

Keep as targets only what the pin lacks:

- CW approximation of a space that is not path-connected, and of a pair;
- the `n`-connected CW models and the uniqueness of Hatcher 4.18;
- the `k`-connected comparison of tom Dieck 9.5.1;
- the cohomology/Hom form of weak-equivalence invariance;
- the use of the pinned killing tower in the `K(A, n)` model.

Point Stage 8.10, Stage 8.8d and the DGFloer paragraph at the pinned isomorphism rather than at Stage 8.3.

## R04 (P3) — Further pinned constructions restated as targets

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md`:

- lines 478–485: 3.1–3.2, affine/barycentric subdivision and the prism operator;
- lines 958–963: 5.1, the Künneth sequence and its splitting;
- line 965: 5.2, Wang;
- lines 968–969: 5.3, "construct transfer on chains by summing lifts and prove `p_* transfer = d * id`";
- lines 1146–1152: 5.6–5.7, Čech;
- lines 1173–1185: 6.0, lim/lim¹;
- lines 1250–1263: 6.1, the universal-coefficient sequence and its splitting, the coefficient sequence and the Bockstein;
- line 540: `coordinateCubeQuotientSphereHomeomorph`;
- line 667: `closedCofibrationCylinderHomotopyExtension`;
- line 737: `basedHomotopyInverseOfEquivalence`;
- line 743: `relativeCylinderCW`;
- line 1866: `relativeCWConnectivityOfCellDimension`.

**Claim.** Each of these passages states as a target a construction or theorem that the pinned Tau Ceti already provides.

**Witness.** At the pin:

- `Singular/Subdivision/`;
- `singularHomologyKunnethSplitting` (`Kunneth/Sequence.lean` line 251);
- `wang_exact_total` (`MappingTorus/Wang.lean` line 104);
- `homologyMap_singularTransfer_comp_homologyMap` (`Transfer/Degree.lean` line 76);
- `cechSpectralSequenceAbutmentIso` (`Cech/SpectralSequence.lean` line 136);
- `TauCeti.ModuleTower.limOne` (`Tower/Basic.lean`);
- `singularExtToCohomology` (`UniversalCoefficient.lean` line 136);
- `singularCohomologyBockstein` (`Bockstein.lean` lines 127 and 278).

**Repair.** In each passage, cite the pinned declaration and keep as the target only the extension the pin lacks:

- the local-coefficient forms of subdivision, transfer and Čech;
- the hereditary-ring Künneth and the general-ring spectral sequence;
- the integer-graded Milnor sequences beyond the pinned tower API;
- the Ext spectral sequence of 6.1;
- the cube-quotient sign normalization against Stage 2.5's class.

For the named 4.4, 4.5 and 8.1 items, cite these pinned declarations:

- `cubeQuotientHomeomorphSphere` (`Sphere/CubeQuotient.lean` line 361);
- `HasHomotopyExtensionProperty.zero_one_prod_univ_union_univ_prod` (`Extension/Prod.lean` line 72);
- `exists_basedInverse_homotopicRel` (`Extension/HomotopyEquivRel.lean` line 166);
- `relCWComplexCylinder` (`Classical/Cylinder.lean` line 252);
- the lemmas of `Homotopy/Relative/CellDimension.lean`, lines 64–110.

Add the pinned names to the *Inventory*.

## R05 (P3) — Edits outside the pull request's folders (gate `outside-folder`, FAIL)

**Location.** `Completed/ArithmeticDirichletSeries/README.md` line 331 ("`LFunctions` consumes this package and supplies its own character-specific continuation.") and `TauCetiRoadmap/SymplecticGeometry/README.md` line 77 ("boundary and sign adapters consumed by HeegaardFloer and consumed by DGFloer").

**Claim.** The pull request edits two files in folders that are not among its own.

**Witness.** `git diff --stat origin/main...HEAD`, excluding the fifteen named folders, lists exactly these two files with one line each. The worker's gate at dc47c7e reports `outside-folder=2`, FAIL.

**Repair.** Drop the two hunks from this pull request, or name `Completed/ArithmeticDirichletSeries` and `TauCetiRoadmap/SymplecticGeometry` as its own folders.

## R06 (P3) — The six orientation companion files import other modules, set heartbeats, and cannot elaborate

**Location.** `OrientationComparison.lean` lines 1–3 and 27; `GeneralModelOrientation.lean` lines 1–3; `CompactOrientationLaws.lean` lines 1–3; `BoundaryInteriorComparison.lean` lines 1–2; `BoundaryCarrierOrientation.lean` lines 1–2; `ChartSimplexLocalImage.lean` line 1.

**Claim.** These six files are not acceptance files in the required form, and they no longer match the acceptance file they import.

**Witness.**

- The files have no hunk against main.
- They import `TauCetiRoadmap.AlgebraicTopology.Suggested` and `TauCetiRoadmap.DifferentialGeometry.Suggested`.
- Three of them carry two `set_option` lines each.
- They hold 42 `sorry`s.
- `OrientationComparison.lean` lines 27 and 58 use `puncturedPair` and `coordinateSimplexPair`, which occur 0 times in `Suggested.lean`.

**Repair.** Delete the six files. Stage 6.3 (README lines 1402–1746) already states every construction they carried.

## R07 (P3) — The docstring's necessity witness for the relative Hurewicz theorem is not a counterexample

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` lines 184–186: "Simple connectivity of `B` cannot be dropped: for `(D², S¹)` the relative `π₂` is `ℤ` with the nontrivial action of `π₁(S¹)` … but `(D², S¹)` is not `2`-connected."

**Claim.** The pair `(D², S¹)` does not show that `π₁(B) = 0` is needed: the Hurewicz map is bijective for it in every degree.

**Witness.** For `(D², S¹)`:

- `π₂(D², S¹) ≅ π₁(S¹) = ℤ ≅ H₂(D², S¹; ℤ)`;
- in degree three both sides are 0;
- `π₁(S¹)` acts trivially on the abelian `ℤ`.

The Hurewicz map is therefore bijective in every degree, and the pair refutes nothing.

**Repair.** Use `(X, A) = (S¹ ∨ S², S¹)` with `n = 0`:

- `π₁(X, A) = 0`, because `π₁(S¹) → π₁(X)` is an isomorphism;
- `π₂(X, A) ≅ π₂(X) ≅ ℤ[t, t⁻¹]`, by the universal cover (a line with a sphere at each integer);
- `H₂(X, A; ℤ) ≅ ℤ`, by the exact sequence;
- the Hurewicz map is the augmentation, which is not injective.

Hatcher, Example 4.35, shows the same phenomenon.

## R08 (P3) — Locators: a wrong Hatcher number, works without a References entry, a name absent at the pins

**Location.** `Suggested.lean` line 280 ("Hatcher, Example 4.30 and Lemma 4.31"); README lines 2354 ("Dowker's K_w≃K_m comparison"), 2358 ("Arens–Eells/Wojdysławski closed embedding"), 2361 ("Dugundji's extension theorem"), 2071 (Farrell–Taylor–Wagoner, inline only) and 1720 (`q=ULift.up (homotopySpherePole 0)`).

**Claim.** One locator names the wrong Hatcher result. Four works have no entry in `## References`. One backticked name does not exist at either pin.

**Witness.**

- hatcher line 15928 is Proposition 4.30, uniqueness; the construction is Example 4.29 (line 15863).
- `## References` has no entry for Dowker, Arens–Eells/Wojdysławski, Dugundji (dugundji1951 Theorem 4.1) or Farrell–Taylor–Wagoner.
- `homotopySpherePole` occurs in neither pin.

**Repair.**

- At line 280, write "Hatcher, Example 4.29 and Lemma 4.31".
- Add to the References, with locators: Dowker (*Topology of metric complexes*, 1952); Arens–Eells (1956, Theorem 5.1) or Wojdysławski; Dugundji (Theorem 4.1); Farrell–Taylor–Wagoner (Theorem 4.2, Corollary 4.9). Record each work in `sources.toml`.
- At line 1720, name the pinned point `TauCeti.spherePole` (`Sphere/Basic.lean` line 61) or describe it in words.

## R09 (P3) — Ids this pull request drops that other roadmaps cite, with no old → new line

**Location.** These names occur nowhere in this README at this head: `ordinaryEMUniversalClass`, `ordinaryEMRepresentability`, `ordinaryEMRelativeRepresentability`, `ordinaryEMLoopComparison`, `ordinaryCohomologySuspension`, `projectiveEMComparisons`, `compactReducedSuspensionCarrierComparison`.

**Claim.** Other roadmaps still cite these names, and this README gives no old → new numbering for them.

**Witness.**

- `TauCetiRoadmap/GeneralizedCohomology/README.md` at this head cites them at line 35 (supplier table), line 101 (`ordinaryCohomologySuspension`), line 432 (`ordinaryEMLoopComparison`) and line 2094 (`projectiveEMComparisons`).
- DGFloer on main cites `compactReducedSuspensionCarrierComparison` at lines 188 and 1584.

**Repair.**

- In GeneralizedCohomology lines 35, 101, 432 and 2094, cite 8.10 by its present names (`ordinaryEMPullback`, `exists_universalClass_ordinaryEMPullback_bijective`) and cite 8.11b/8.12 by section. The projective comparisons now live in CharacteristicClasses C1.5a.
- For DGFloer's name, add one old → new line to this README, or restore the name in the 4.4 prose.

## R10 (P3) — Stale consumer statements about DifferentialGeometry 9.3 and GeometricTopology "3g"

**Location.** README lines 82–85: "DG9.3 consumes AT6.3's homological orientation system, chart-normalized point generators, chosen local section, RelativeTwistedClassDatum and compact-support class factory". The claim is repeated at lines 1437, 1552 and 1584. Line 1985: "GT3g and Four consume this native predicate".

**Claim.** These passages name consumers that do not consume what is stated: DifferentialGeometry 9.3 uses nothing of Stage 6.3, and GeometricTopology has no item "3g".

**Witness.** DifferentialGeometry on main, line 872: 9.3 is `poincareDuality` for de Rham cohomology "by the induction principle from the base cases 6.2 and 6.4", naming nothing of Stage 6.3. GeometricTopology on main contains no "3g".

**Repair.** State DifferentialGeometry's actual consumption (Layer 8.1–8.2, and Layer 10's degree comparison for Stage 6.5) and drop the DG9.3 claims. Replace "GT3g" by the GeometricTopology section meant, or drop it.

## R11 (P3) — Conflicting open heads that change this folder, with no stated order

**Location.** The description's merge-order paragraph: "#1101 (ModularCurves) → #1807 (the other loops) → this pull request. It depends on no other author's open pull request."

**Claim.** Several open pull requests change this folder and conflict with this head, and the description states no order between them and this one.

**Witness.** `overlaps.md` lists these conflicts in `AlgebraicTopology/{README.md,Suggested.lean,TopologicalGroupFundamentalGroup.lean}`, and none is named in the description:

- #1652 and #1663 (kim-em);
- #1797 and #1854 (same author);
- #1187 (Tau Ceti bump), which conflicts in `Suggested.lean` and `TopologicalGroupFundamentalGroup.lean`.

**Repair.** In the merge-order paragraph, state which of #1797, #1854, #1652, #1663 and #1187 is rebased on which.

## Previous findings

- R01 — not repaired: README lines 113–131 still say "owned here … DGFloer Layer 1 consumes these ordinary targets". DGFloer on main (line 232) and at a64ca16f (line 4281) still say the opposite. Now R01.
- R02 — not repaired: lines 1839–1846 "consumes … K7.2's finite CW structure … No complex-projective construction is required in Stage4"; ComplexKahlerGeometry line 2242 unchanged. Now R02.
- R03 — not repaired: line 125 "Stage 8.3 owns the degree-one Hurewicz isomorphism"; line 889 "Own CW approximation: every space, and every pair". Now R03.
- R04 — not repaired: lines 968–969 "construct transfer on chains by summing lifts and prove `p_* transfer = d * id`" and the other passages. Now R04, with the 6.1 lines corrected to 1250–1263.
- R05 — not repaired: two one-line hunks in `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`; gate `outside-folder=2`. Now R05.
- R06 — not repaired: the six companion files are unchanged; `OrientationComparison.lean` line 27 still uses `puncturedPair`. Now R06.
- R07 — not repaired: `Suggested.lean` lines 184–186 still use `(D², S¹)` as the necessity witness. Now R07.
- R08 — not repaired: `Suggested.lean` line 280 "Hatcher, Example 4.30 and Lemma 4.31"; README line 1720 `homotopySpherePole`; no References entries. Now R08.
- R09 — not repaired: the seven names are still absent; GeneralizedCohomology lines 35, 101, 432 and 2094 still cite them. Now R09.
- R10 — not repaired: lines 82–85 "DG9.3 consumes AT6.3's homological orientation system …"; line 1985 "GT3g and Four consume this native predicate". Now R10.
- R11 — not repaired: the description's merge-order paragraph is unchanged. Now R11, which also names #1187.

## Verified sound

**Gate, dependency check, build and probe at dc47c7e.**

- **Worker's gate.** Every scanner reports 0 except `outside-folder=2` (R05); `build=0`. My re-run of the gate (without the pull request's own-folder list) also counts the fourteen other named folders under `outside-folder`. Excluding them, `git diff --stat` leaves the same two files.
- **Dependency check.** Run with the brief's command, the output is:

  ```
  depcheck: 238 roadmaps, 2351 edges, 0 problem(s)
  ```

- **Elaboration.** `lake env lean TauCetiRoadmap/AlgebraicTopology/Suggested.lean` exits 0 with fourteen `declaration uses sorry` warnings, at lines 92, 116, 135, 171, 187, 206, 221, 229, 284, 292, 315, 350, 367 and 415. There is no error and no other warning.
- **One-tactic probe.** I ran it again on a scratch copy, replacing each of the fourteen `sorry`s by `first | (rfl; done) | (simp; done) | (infer_instance; done) | (aesop; done) | sorry`. The copy elaborates (exit 0) with the same fourteen `sorry` warnings. No theorem closes by one tactic, so there is no padding.
- **Signatures.** The signatures (28 declarations, 0 dropped binders) are unchanged, because the file is unchanged. The comparison with the README in the previous report stands.

**Adversarial table.** No statement changed, so every row is carried from the previous report (PRREVIEW-AlgebraicTopology~69). Its values were re-read against this head, which is identical to that one. The R07 row was recomputed.

| statement | instances | values each side | result | change |
| --- | --- | --- | --- | --- |
| `compactlyGeneratedToTop_isLeftAdjoint` (4.5), *carried r69* | X uncountable cocountable; X compact Hausdorff | kX discrete, counit a continuous bijection, not a homeomorphism; kX = X | true, not pinned | none |
| `bijective_singularCap_fundamentalClass` (6.4), *carried r69* | n=0, M = k points; M=∅; M=ℝ | H⁰=ℤᵏ ≅ H₀=ℤᵏ; 0→0; H⁰=ℤ vs H₁=0 fails | compactness needed and present | none |
| `eulerChar_totalSpace` (7.2), *carried r69* | Hopf S¹→S³→S²; Klein bottle over S¹; B=∅; B=S²⊔S², F=S¹ | 0=2·0; 0=0·0; 0=0·χF; 0=4·0 | holds with monodromy and disconnected base | none |
| `lsCupLength_add_one_le_lsCategoryCount`, *carried r69* | point; Sⁿ; torus; zero ring; ℝⁿ | 0+1≤1; 1+1≤2; 2+1≤3; 0+1≤count; 0+1≤1 | holds; ⊤ case consistent | none |
| `bijective_relativeHurewicz_of_simplyConnected` (8.4), recomputed | (D²,S¹); (S¹∨S²,S¹), n=0 | π₂=ℤ=H₂, π₃=0=H₃ (bijective); π₁(X,A)=0, π₂(X,A)=ℤ[t,t⁻¹] → H₂(X,A)=ℤ by augmentation, not injective | statement right; docstring witness wrong | R07 |
| `isWeakHomotopyEquivalence_of_isIso_singularHomologyMap` (8.5), *carried r69* | pt→Poincaré homology sphere; id | homology iso, π₁≠0: hypothesis needed; trivial | holds | none |
| `finiteCWType_of_compactSpace_of_isManifold(_halfSpace)` (8.7), *carried r69* | n=0 finite discrete; M=∅; S¹; D² | finite CW type in each case | true, not one-tactic | none |
| `OrdinaryEMModel`, `nonempty_ordinaryEMModel` (8.8c), *carried r69* | A=0; S², n=2; S¹, n=1, A=ℤ | point satisfies; S² fails `vanishing` at j=3 (π₃S²=ℤ); S¹ satisfies | definition discriminates | none |
| `NormalizedAbelianEMFamily`, *carried r69* | f=id; A=0→A′; ×2 on ℤ, n=1 | `map_id`; constant map; π₁ multiplied by 2 | strict functoriality holds | none |
| `exists_ordinaryEMModel_iso_doldKanRealization`, *carried r69* | A=0; A=ℤ, degree 2 | Γ(0)=point; Γ(ℤ[2])₀=0, one vertex | holds for n+2≥2 | none |
| `hurewiczInt`, `IsSerreIso`, `IsSerreEpi`, *carried r69* | f=0: ℤ→ℤ; f=×2 | ker ℤ, coker ℤ: not iso; ker 0, coker ℤ/2: torsion-iso and epi | discriminate | none |
| `hurewicz_mod_isTorsion` (8.8d), *carried r69* | n=0; S²; K(ℤ/2,2) | H₁=0, h₂ iso; π₂=ℤ not torsion; H̃_* 2-torsion | agrees with Serre | none |
| `hurewicz_mod_isKilledBySomePower`, *carried r69* | d=1; d=2, K(ℤ/3,2) | ordinary Hurewicz; π₂ ∉ class | holds | none |
| `exists_universalClass_ordinaryEMPullback_bijective` (8.10), *carried r69* | m=0, X=S¹; X=pt; X=S⁰; m=1, X=S² | [S¹,S¹]=ℤ=H¹; one class = 0; one class = 0; ℤ=H²(S²) | holds | none |
| 8.8d fixed dᵐ not a Serre class, *carried r69* | 0→ℤ/2→ℤ/4→ℤ/2→0 | 2·(ℤ/4)≠0 | not closed under extensions | none |
| 5.0 reindexing, *carried r69* | (p,q)=(0,0),(2,1); cohomological (1,2) | (1,−1); (−4,1); (5,−2) | agrees with `coreE₂Cohomological` | none |
| 4.6 ℝPⁿ differential 1+(−1)^k, ℝP² sign system, *carried r69* | k=1,2; twisted d₁=±2, d₂=0 | 0, 2; H⁰=0, H¹=ℤ/2, H²=ℤ | agrees with 6.1, 6.3 | none |
| Ownership of the ℂPⁿ CW structure, re-read | AT lines 1839–1846; CKG line 2242; CC line 766 | "K7.2's finite CW structure" / "Consume … Stage 4.6's finite CW structure" | 0 owners | R02 |
| Ownership of Serre spectral sequences, CW approximation, K(A,n), Hurewicz mod C, re-read | AT lines 113–131; DGFloer main line 232; DGFloer at a64ca16f lines 60–69 and 4281 | AT owns and DGFloer consumes / DGFloer owns and AT 5.5 consumes | 2 owners | R01 |
| Degree-one Hurewicz, CW approximation, weak-equivalence invariance, killing tower, re-read | README lines 125, 889, 1938, 2197 vs the pin | "own" vs `Basic.lean` line 705, `CWApproximation/Basic.lean` line 336, `WeakHomotopyEquivalence.lean` lines 110/169, `KillHomotopyGroups.lean` lines 260/269 | pinned theorems restated | R03 |

**Library declarations re-opened at the pins** (unchanged pins):

- `hurewiczHomologyAddEquiv` (`Hurewicz/One/Basic.lean` line 705);
- `isWeakHomotopyEquivalence_cwApproximationMap` (`CWApproximation/Basic.lean` line 336);
- `bijective_homotopyGroupMap_killHomotopyGroupsIncl` and `subsingleton_homotopyGroup_killHomotopyGroups` (`KillHomotopyGroups.lean` lines 260 and 269);
- `isIso_singularHomologyMap` and `isIso_twistedHomologyMap` (`WeakHomotopyEquivalence.lean` lines 110 and 169);
- `wang_exact_total` and `wang_exact₁` (`Wang.lean` lines 104 and 203);
- `singularHomologyKunnethSplitting` (`Sequence.lean` line 251);
- `homologyMap_singularTransfer_comp_homologyMap` (`Transfer/Degree.lean` line 76);
- `cechSpectralSequenceAbutmentIso` (`Cech/SpectralSequence.lean` line 136);
- `singularExtToCohomology` (`UniversalCoefficient.lean` line 136);
- `singularCohomologyBockstein` (`Bockstein.lean` lines 127 and 278);
- `ModuleTower.limOne` (`Tower/Basic.lean`).

`homotopySpherePole` is absent from both pins (R08). The other 88 declarations resolved in the previous report are unchanged at the same pins.

**Cross-roadmap citations re-resolved for the changed folders.**

- **CharacteristicClasses at dc47c7e** cites this roadmap in its changed passages, and each citation resolves to a README passage that states what is cited:
  - AT4.5's coreflection, relative CW pushout and homotopy-pushout gluing (README lines 136, 640, 654, 712);
  - AT4.7's realization CW structure (line 846);
  - AT4.8's connected-map comparison and its weak-equivalence Hom comparison (lines 872–899, which name CC C1.2 as consumer);
  - AT5.5's fibration sequence and multiplicative cohomological Serre sequence (lines 1007 and 1164);
  - AT8.2's `SSet.KanComplex` comparison (line 1914);
  - AT8.3's absolute Hurewicz (line 1932);
  - AT8.5, AT8.8b, AT8.10 and AT8.12 (lines 1969, 2099, 2301 and 2456).
- **LocalPurity at dc47c7e** names nothing of this roadmap.
- **DGFloer.** Main has no commit since c58403cb; the open head is a64ca16f (R01).
- **ComplexKahlerGeometry and GeneralizedCohomology** are unchanged since 6931121 (R02, R09).
- **DifferentialGeometry and GeometricTopology** are unchanged on main (R10).
- **ClassifyingSpaces Layer 1** (only in #1807, which the description orders first): unchanged.

Remark, with no change asked: README line 153 lists CharacteristicClasses C1.5's use of Stages 8.8b, 8.10 and 8.12. C1.5 now also applies Stage 8.3's absolute Hurewicz theorem (CharacteristicClasses line 806), which line 153 does not mention.

**Seeded sample.** The worker seeded no target (none was found by heading), and no locator lies in a changed passage. The README flags no locator as unverified. Two of the previous report's 24 sampled locators were re-read in the caches:

- hatcher lines 15863 and 15928 (Example 4.29 and Proposition 4.30, R08);
- dugundji1951 line 198 (Theorem 4.1).

**Ownership against open pull requests.** The objects compared and their outcomes are those of the previous report: the compact-generation coreflection, cup length, cap-product duality, the nerve `K(π,1)`, the Serre machinery (R01) and the ℂPⁿ cells (R02). The diff touches none of them.

## Not verifiable

- Serre 1953, Theorem 1 (README lines 2250 and 2608; `Suggested.lean` lines 336 and 358): Annals 58, paywalled, settled as uncertified.
- tom Dieck, *Algebraic Topology*, 9.5.1 (README line 876): EMS, paywalled, uncertified.
- Weibel 5.5.1(2) and 5.5.10 (README lines 951 and 963): Cambridge, uncertified.
- Milnor, *Morse Theory*, Lemmas 3.6–3.7; Freedman–Quinn 7.7; Lee; Thom 1954: all uncertified in the manifest.
- Eilenberg–Steenrod, Whitehead, Dold, May, McCleary, Kenneth Brown: cited for standard facts without a theorem-level locator, and not in the cache.

## Source issues

- none
