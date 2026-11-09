# Review of AlgebraicTopology (pull request #1807 at 5d047eb)

**Verdict:** needs changes

## R01 (P1) — Six orientation Lean files in the folder no longer elaborate, and they and a seventh break the Lean form

**Location.** Seven auxiliary files in `TauCetiRoadmap/AlgebraicTopology/`:

- `CompactOrientationLaws.lean` line 125: `(d : RelativeTwistedClassDatum ℤ (TopPair.ofSubset Kᶜ) (IntegralSystem M) m`;
- `OrientationComparison.lean` line 58: `map : (coordinateSimplexPair m).fst ⟶ TopCat.of M`;
- `BoundaryInteriorComparison.lean` lines 26–32: `FreshInteriorRechart.Carrier`;
- `GeneralModelOrientation.lean`, `BoundaryCarrierOrientation.lean` and `ChartSimplexLocalImage.lean` import these;
- `TopologicalGroupFundamentalGroup.lean`.

**Claim.** The files `import TauCetiRoadmap.AlgebraicTopology.Suggested` and use declarations this pull request deletes from it. They cannot elaborate. The gate builds only `Suggested.lean`, which imports none of them, so the gate does not see the break. They also break the Lean form:

- `set_option maxHeartbeats` at `OrientationComparison.lean` 14–15, `CompactOrientationLaws.lean` 14–15 and `BoundaryInteriorComparison.lean` 15–16;
- imports of another roadmap's module, `TauCetiRoadmap.DifferentialGeometry.Suggested`, at `OrientationComparison.lean` 2 and `GeneralModelOrientation.lean` 3;
- sorry'd data:
  - `BoundaryCarrierOrientation.lean` 47–62: `interiorFundamentalGroupoidEquivalence` has `inverse := by sorry`;
  - `GeneralModelOrientation.lean` 183–217: `chosenSection` and `compactSupportFundamentalClass` have sorry'd bodies;
- `TopologicalGroupFundamentalGroup.lean` lines 1–4 import Mathlib submodules, and its content is native (R02).

**Witness.** Main's `Suggested.lean` has `structure RelativeTwistedClassDatum` at line 423 and `namespace FreshInteriorRechart` at line 444. The head's `Suggested.lean` has no occurrence of `RelativeTwistedClassDatum`, `FreshInteriorRechart` or `coordinateSimplexPair`.

**Repair.**

- Delete the seven auxiliary `.lean` files. `Suggested.lean` is the folder's only Lean file, and Stage 6.3's prose already states the orientation-comparison targets.
- In README Stage 1 item 6 (lines 559–566), drop the link to `TopologicalGroupFundamentalGroup.lean` and its backticked names `multiplicationMap`, `pointwise_one_left`, `pointwise_one_right`, `pointwise_interchange`, `pointwise_eq_mul`, `mapOfEq_pointwise`, `fundamentalGroup_mul_comm`, `commGroup` and `commGroup_toGroup`. Then cite the native declarations (R02).
- No other roadmap imports these modules. A grep of every `.lean` file outside the folder for `import TauCetiRoadmap.AlgebraicTopology` finds nothing, so deleting them breaks no consumer.

## R02 (P2) — Targets owned here that the pinned Tau Ceti already proves

**Location.**

- README 549–558, Stage 1 item 6: "construct pointwise multiplication … prove that `FundamentalGroup G 1` is abelian";
- README 1215–1220, Stage 5.0: "prove natural strong convergence: the induced filtration … is exhaustive …";
- README 1369–1371, Stage 5.5: "Own … the two-endpoint evaluation … membership of these Hurewicz fibrations in `serreFibrations`";
- README 1381–1386: the skeletal filtration `E_p=p⁻¹(B^(p))` fed to "item 0's filtered-complex construction".

**Claim.** These README items own constructions and theorems that the pinned Tau Ceti already proves, and the README cites none of the native declarations.

**Witness.** At the Tau Ceti pin `2fd255d`:

- `FundamentalGroup.instCommGroup` (`FundamentalGroup/TopologicalMonoid.lean` 120);
- `CochainComplex.filtrationSpectralSequencePageXIsoGradedOfExhaustive` (`Filtered/Exhaustive.lean` 177);
- `TauCeti.filteredSpaceSpectralSequenceFirstPageXIso` (`Singular/FilteredSpace.lean` 255);
- `TauCeti.IsHurewiczFibration.mem_serreFibrations` (`HurewiczFibration/Basic.lean` 90).

**Repair.** Add these natives to the Inventory, all opened at the pin:

- `FundamentalGroup.cast_map_prod_mul` (`TopologicalMonoid.lean` 110);
- `CochainComplex.exists_mem_range_filtrationAbutmentFiltrationι` and `isIso_homologyMap_of_isIso_spectralSequence_page_of_exhaustive` (`Exhaustive.lean` 102, 200);
- `CochainComplex.spectralSequence_first_page_d_eq` (`Filtered/FirstPage.lean` 89);
- `TauCeti.filteredSpaceAbutmentIso` and `filteredSpaceSpectralSequence_first_page_d_eq` (`FilteredSpace.lean` 275, 420);
- `TauCeti.HasHomotopyExtensionProperty.isHurewiczFibration_restrict` (`Topology/MappingSpace/Fibration.lean` 41). Restriction along `{0,1} ⊆ I` is the two-endpoint fibration.

Then consume them where the README now owns them:

- Stage 1.6: consume the native instance and keep only what it lacks, here the naturality under continuous monoid maps.
- Stage 5.0: keep only the homological regrading with degreewise lower bounds and the complete-convergence form.
- Stage 5.5:
  - build the Serre filtration on `TauCeti.singularChainFiltration` and `TauCeti.filteredSpaceSpectralSequence`;
  - cite `IsHurewiczFibration.mem_serreFibrations`;
  - derive the endpoint fibration from `isHurewiczFibration_restrict`, keeping only the concatenation lifting function.

## R03 (P2) — Integral Poincaré duality is statable at the pins, yet absent; the docstring says it is not statable

**Location.** `Suggested.lean` 127–129: "integral and twisted Poincaré–Lefschetz duality … : the homological orientation local system with coefficients in a local system is a construction of the roadmap". Lines 498–509 state only the `ℤ/2` form. Scope item 5 and README 2209 promise the oriented integral corollaries.

**Claim.** The integral form for a closed oriented manifold needs no local-system orientation, so it is a headline that is statable at the pins but absent.

**Witness.** The pinned Tau Ceti has:

- `TauCeti.HomologicalOrientation M E d` (`Singular/LocalHomology/Orientation/Homological.lean` 75);
- its `fundamentalClass` (`FundamentalClass.lean` 204), for compact Hausdorff `M` charted on `E`.

Only the twisted form needs the local-system orientation.

**Repair.**

- Add the theorem below to Stage 6.4 of `Suggested.lean`. On a scratch copy of the file it elaborated, with only the `sorry` warning, after adding `public import TauCeti.AlgebraicTopology.Singular.LocalHomology.Orientation.Homological`:

  ```lean
  theorem poincareDuality_int (n : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
      [CompactSpace M] [ChartedSpace (EuclideanSpace ℝ (Fin n)) M]
      (_o : TauCeti.HomologicalOrientation M (EuclideanSpace ℝ (Fin n)) n) :
      ∃ c : SingularHomology ℤ (ModuleCat.of ℤ ℤ) (TopCat.of M) n,
        ∀ (p : ℕ) (hp : p ≤ n), Function.Bijective (fun a : singularCohomology ℤ (TopCat.of M) p =>
          (capProduct ℤ (TopCat.of M) p n hp).hom a c)
  ```

- Name it in README 6.4 with Hatcher, Theorem 3.30 (p. 241).
- Narrow the docstring's "not statable" entry to the twisted and boundary forms.

## R04 (P3) — Padding: `relativeCWPushout_base_isClosedEmbedding` closes in one tactic, and its Hausdorff hypotheses are unused

**Location.** `Suggested.lean` 321–326.

**Claim.** The theorem follows in one step from a native lemma, so it is padding, not a headline.

**Witness.** On a scratch copy, this one `exact` elaborates:

```lean
exact TauCeti.TopCat.isClosedEmbedding_of_isPushout (IsPushout.of_hasPushout _ _).flip
  (Topology.RelCWComplex.isClosedBase (C := (Set.univ : Set Y)) (D := B)).isClosedEmbedding_subtypeVal
```

Lean then reports `[T2Space Y]` and `[T2Space Z]` as unused.

**Repair.** Delete the theorem from `Suggested.lean`. At README 879–880, keep the statement and cite `TauCeti.TopCat.isClosedEmbedding_of_isPushout` (`Topology/Category/TopCat/ClosedEmbedding.lean` 93) with Mathlib's `RelCWComplex.isClosedBase`.

## R05 (P3) — Locators that do not support the statement as written

**Location.**

- README 2803 and 3089, `Suggested.lean` 772: "Milnor 1959 Theorems 3–4";
- README 2006 and 2967: "DG2.4's outward-first S² orientation";
- `Suggested.lean` 695–697 and README 2707–2709: Hatcher SSAT Theorem 1.8 for `hurewicz_isCIso`;
- README 2802–2805: "`finiteSourceMappingCWType`, the finite-CW-source pair specialization … for n-ads".

**Claim.** Each cited text says less than, or something other than, what it is cited for. The README also gives `finiteSourceMappingCWType` the pair generality, while its Lean statement is the absolute form `C(K,X)`.

**Witness.**

- Milnor numbers only Theorems 1–3. Theorem 3 is at milnor1959 line 209 (p. 276).
- DifferentialGeometry 2.4 is the orientation double cover; the outward-first `boundaryOrientation` is 5.1.
- SSAT 1.8 (hatcher-ssat line 849) states only the degree-n C-isomorphism.

**Repair.**

- Cite "Milnor 1959, Theorem 3 (p. 276)" for `finiteSourceMappingCWType` and "Corollary 3 (p. 276)" for `basedLoopCWType`.
- Repoint the S² orientation to DifferentialGeometry 5.1, with S² = ∂D³.
- Cite SSAT 1.8 for the C-isomorphism clause only, and Serre III Theorem 1 for the other two clauses.
- Say that the Lean target is the n = 1 case of the n-ad statement.

## R06 (P3) — Headline targets without a locator

**Location.** The README items named below. For example, README 911–917 gives `homotopyInversePairExtension_left` a route ("Use the relative mapping-cylinder/HEP construction and the native cylinder theorem") but no source.

**Claim.** Every theorem needs a locator at its claim. These headlines of `Suggested.lean` have none in the README.

**Witness.** Searching each item's text finds no theorem number or page. The manifest records Brown §7.4 and Vogt 1972 for Stage 4.5, but the README never cites them.

**Repair.** Add these locators, each verified in the cached text:

- `homotopyInversePairExtension_left` (README 911–917).
  - Cite Brown, *Topology and Groupoids*, 7.4.2 and its Addendum (brown lines 11027–11043, pp. 285–286), and Vogt 1972, Proposition (vogt1972 line 28).
  - Say how the exact left restriction follows. The Addendum extends `f∘g≃1` exactly, but `g∘f≃1` only as the track sum `K0+g0H0f0−g0f0K0`.
  - Vogt's identity `f∘H≃K∘(f×1)` makes that sum homotopic to `H₀` rel ends. Strøm Theorem 6, applied to the pair (I×X, ∂I×X ∪ I×A), then makes the restriction equal to `H₀` exactly.
- `ordinaryEMRepresentability` (README 2758–2788): Hatcher, Theorem 4.57 (p. 393; hatcher line 17069).
- `groupClassifyingSpace_isEMOne` (README 2510–2519): Hatcher, Example 1B.7 (p. 89; hatcher line 3844).
- `poincareDuality_zmodTwo` (README 2206–2208): Hatcher, Theorem 3.30 (p. 241; hatcher line 10453).
- `ordinaryPairQuotientComparison` and its cohomology form (README 1062–1068): Hatcher, Proposition 2.22 (p. 124; hatcher line 5456).
- These have no source at all; add one each:
  - `lsCupLength_add_one_le_categoryCount`;
  - `relativeCWPushout_t2Space`;
  - `HasProperHomotopyExtensionProperty.cylinderBoundary`;
  - `properStrongDeformationRetract_of_inverse`;
  - `compactManifoldFiniteCWType`.
- For `relativeCWPushout_t2Space`, the native `TopCat.RelativeCWComplex.t2Space` (`Topology/CWComplex/Abstract/Hausdorff.lean` 163) and `TauCeti.toRelativeCWComplex` give a route.

## R07 (P3) — A false Check in the compactly supported cochain foundation

**Location.** README 1793–1795: "the contraction (t,x)↦(1−t)x of ℝ is proper on every slice but not jointly proper".

**Claim.** The Check's example does not have the property it asserts.

**Witness.** At t = 1 the slice is the constant map 0. The preimage of {0} under it is ℝ, which is not compact, so that slice is not proper.

**Repair.** Use the homotopy below instead.

- Take H(t,x) = (1−t)x + t x².
- Every slice is proper. At t = 0 the slice is the identity, and for t ∈ (0,1] it is a quadratic with positive leading coefficient.
- H is not jointly proper. The point (t, −(1−t)/t) lies in H⁻¹(0) for every t ∈ (0,1], so H⁻¹(0) is unbounded.
- Its ends act on `H_c^1(ℝ;ℤ)=ℤ` by 1 and by 0. So slicewise properness does not give homotopy invariance.

## R08 (P3) — The docstring gives a false reason, and the README does not consume the native π₁-action

**Location.** `Suggested.lean` 132–134: "the pinned libraries have no action of `π₁` on `π_n`". README 2265 says "Extend them with basepoint change", and 2720–2731 (Stage 8.9) uses that action.

**Claim.** The action exists at the pin. The obstruction class is still not statable, but for another reason.

**Witness.** The pinned Tau Ceti has:

- `MulAction` and `MulDistribMulAction (FundamentalGroup X x) (HomotopyGroup N X x)` (`Topology/Homotopy/HomotopyGroup/FundamentalGroupAction.lean` 136, 167);
- `TauCeti.homotopyGroupEquivOfPath` (`BasepointChange.lean` 352).

**Repair.**

- Restate the reason: the obstruction cochain is data that the roadmap constructs.
- In Stages 8.1 and 8.9, consume the native action and the native path transport.

## R09 (P3) — README form: no Checks or `*Needs:*` for the declared definitions, process words, and missing spaces

**Location.**

- The definitions `Suggested.lean` declares have no `**Checks.**` list, and no target has a `*Needs:*` line: `ordinaryPairQuotient`, `LocallyRepresentedTopSection`, `LSPositiveCupProduct`/`lsCupLength`, `HasProperHomotopyExtensionProperty`, `IsCIso`/`IsCEpi`, `SatisfiesSerreAxioms`, `OrdinaryEMModel` and `groupClassifyingSpace`.
- Process words at lines 227, 513 ("now"), 691 ("when it lands"), 910 and 990 ("the earlier interface"), 2117, 2124, 2135 and 2958–2959 ("current").
- Missing spaces, such as `Stage6.5` (87), `of6.2` (1654), `to∞` (1664), `count0` (1676), `properStage8.5` (1745), `Lemma3.27` (1887), `Theorem4.2` (2459) and `Compositio27` (2484).

**Claim.** The README does not meet the house form for the definitions it declares, and it carries process words and typographical slips.

**Witness.** The Stage/numbered-list form predates this pull request, but the pull request rewrote 2047 README lines without adding Checks for the definitions it newly declares.

**Repair.** Give each declared definition at least three discriminating Checks. These were computed for this review:

- `ordinaryPairQuotient`: B = ∅ gives X₊, and (D¹, S⁰) gives S¹.
- `lsCupLength`:
  - (T²; ℤ) gives 2;
  - (pt; R) gives 0;
  - (RP²; ℤ/2) gives 2, while (RP²; ℤ) gives 1.
- `OrdinaryEMModel`: S¹ is a K(ℤ,1), and S² fails the vanishing field.

Add `*Needs:*` lines per target, replace the process words, and restore the spaces.

## Verified sound

**Gate and dependencies.** The worker's gate at this head passes every check. No file outside the folders the pull request names changes.

The dependency check gives:

```text
depcheck: 235 roadmaps, 2255 edges, 0 problem(s)
```

The suppliers cited are all on main:

- DifferentialGeometry Layers 2.1–2.4, 5.1, 9.3 and 10;
- GeometricTopology Layers 1.1, 1.5 and 11.1/11.3;
- UniversalCovers (`Completed/`).

The other roadmaps named are consumer sentences only.

**Overlaps.**

- DGFloer's revision #1798 repoints CW approximation, the fibration sequence, the Serre spectral sequences and Hurewicz modulo a class to this roadmap, at its README 163–173. The description names #1798, so these do not have two owners.
- AlgebraicTopologyPartII (#1694) still cites DGFloer Layer 1 item 2 and StableHomotopyKTheory §§3.36–3.37 for these. StableHomotopyKTheory (#1227) §3.35 owns K(A,n) homology in three classes, which this roadmap's 8.8d covers in general. Both repairs belong to those pull requests, since this roadmap is on main.
- The description's merge-order paragraph puts this pull request first, which orders it against #1652, #1797, #1854 and #1187.

**Names, signatures and padding probe.**

- All 320 backticked qualified names in the README resolve at the pins or in `Suggested.lean`, checked by a declaration index of Mathlib `1b1ccf4` and Tau Ceti `2fd255d`.
- Every one of the 54 declarations in `Suggested.lean` is named in the README.
- I ran `#check @name` for all 54 declarations on a scratch copy. Elaboration gave only `sorry` warnings, apart from R04's unused-variable warning. The two abbreviations flagged by `signatures.md` (`relativeCWPushoutInclusion` and `relativeCWPushoutCarrier`) drop `T2Space`, which neither needs.
- One-tactic probe: only R04 closed. The others need constructions, by reading against the natives listed below.

**Library declarations opened** (Tau Ceti unless marked):

- `RelHomotopyGroup` (`Homotopy/Relative/Basic.lean` 302) indexes π_{k+1} by `Fin k`.
- `bijective_hurewicz_of_subsingleton_homotopyGroup` (`Hurewicz/Relative.lean` 282).
- `HomotopyGroup.hurewiczHom` (`Hurewicz/Basic.lean` 652) maps π_{n+1} to `R ⟶ H_{n+1}`.
- `hurewiczHom_hom_one_eq_neg_hurewicz₁` (`One/Comparison.lean` 160) has sign −1, which matches README 2341.
- `LSCategoricalCover` (`LusternikSchnirelmann.lean` 84) uses open sets, so the cup-length bound holds without separation.
- `CWType` (`CWType.lean` 38), `IsAspherical` and `IsEilenbergMacLaneSpaceOne` (`EilenbergMacLane/Basic.lean` 59, 123).
- `HasProperHomotopyInverse` (`Topology/Homotopy/Proper.lean` 41) includes properness of the map, so A is closed.
- Mathlib: `IsSerreClass` (`SerreClass/Basic.lean` 45), `IsClosed.isClosedEmbedding_subtypeVal` (`Constructions.lean` 408) and `RelCWComplex.isClosedBase` (`CWComplex/Classical/Basic.lean` 129).

**Source sample (15 targets, plus R06's).**

- Hatcher, at its printed pages:
  - 4.13 (p. 353);
  - 4.41 (p. 376), whose bijection needs no path-connected base;
  - 3.27 (p. 236);
  - 4.37 (p. 371);
  - 4.33 (p. 367);
  - 1B.9 (p. 90, as the README says);
  - 0.19 (p. 16);
  - Example 0.6 (pp. 6–7), whose cell map matches README 1091;
  - 3.43 (p. 254);
  - 4.21 (p. 356);
  - A.6 (p. 524);
  - 4.57 (p. 393).
- Hatcher SSAT 1.8 (p. 14), only partly, as R05 says.
- Milnor 1959, Theorem 3 and Corollary 3 (p. 276); the "Theorem 4" in the citation is wrong (R05).
- Strøm 1968, Theorem 6 (strom1972 line 181).
- Farrell–Taylor–Wagoner, Theorem 4.2, Lemma 4.3 and Corollary 4.9 (ftw1973 lines 600, 610, 752).
- Brown 7.4.2 and its Addendum, and Vogt's Proposition (R06).

**Adversarial table.**

| Statement | Instances | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| `ordinaryPairQuotientComparison` | B=∅; (D¹,S⁰) | H_n(X)=H̃_n(X₊); H_1(D¹,S⁰)=ℤ=H̃_1(S¹) | holds | locator (R06) |
| its cohomology form | (D¹,S⁰) | H¹(D¹,S⁰)=ℤ=H̃¹(S¹) | holds | locator |
| `relativeCWPushout_t2Space` | Y=D¹, B=S⁰, Z=pt; Z Sierpiński | pushout S¹, T2; the closed copy of Z is non-T2, so the hypothesis is needed | holds | none |
| `relativeCWPushout_base_isClosedEmbedding` | probe | closes in one `exact`; T2 unused | padding | R04 |
| `homotopyInversePairExtension_left` | A=X, A′=X′; A=A′=∅ | g=g₀, H=H₀; plain homotopy inverse | holds by Brown, Vogt and Strøm | R06 |
| `exists_cwApproximation` | ∅; Warsaw circle; two points | Z=∅; Z=pt, all πₙ=0; Z = two points | holds | none |
| `relHomotopyGroup_map_bijective…` | ℝ→S¹ (n=0); p=id; [0,1]→S¹ | ℤ/ℤ; equal sides; 2 elements vs ℤ, so the fibration hypothesis is needed | holds | none |
| `compactSupportTopClass_exists/unique` | m=0, M=ℤ discrete, K={0,1}; K=∅; M=ℝ, K=[0,1] | L₀⊕L₁ and projections; 0; ℤ with an iso to each local group | holds | none |
| `poincareDuality_zmodTwo` | ∅; n=0, 3 points; RP² | 0/0; (ℤ/2)³ both; H⁰,H¹,H² = ℤ/2 ↔ H₂,H₁,H₀ = ℤ/2 | holds | locator |
| integral PD (absent) | S², T² | H¹(T²)=ℤ²=H₁(T²) | statable | R03 |
| `lsCupLength_add_one_le_categoryCount` | pt; Sⁿ (ℤ); T² (ℤ); zero ring; ∅ | 1≤1; 2≤2; 3≤3; 1≤count; ∅ would give 1≤0, so `Nonempty` is needed | holds | locator |
| `LSPositiveCupProduct`/`lsCupLength` | RP² over ℤ/2 and ℤ | a∪a≠0 gives 2; only H²=ℤ/2 gives 1 | discriminating | Checks (R09) |
| `relHurewicz_bijective_of_simplyConnected_subspace` | n=0; (S²,pt); S²⊔S² with B in the first | π₁Y=0 by the pair sequence; ℤ=H₂; π₂=ℤ vs H₂=ℤ², so path-connectedness is needed | holds | none |
| `homologicalWhitehead` | degree-1 S²→S²; pt→acyclic Higman complex | iso; homology iso but π₁≠0, so simple connectivity is needed | holds | none |
| `HasProperHomotopyExtensionProperty` | X=[0,1], A=(0,1] | no proper H exists, so vacuous; hence `IsClosed A` is needed, present in `cylinderBoundary` | consistent | none |
| `properStrongDeformationRetract_of_inverse` | A=X; ([0,∞),{0}) | r=id; the constant inverse is not proper, so the hypothesis fails | holds | locator |
| `compactManifoldFiniteCWType` | Sⁿ, RP² | finite CW | holds | locator |
| `groupClassifyingSpace_isEMOne` | G=1; G=ℤ | contractible; ≃S¹ | holds | locator |
| `exists_mapOfEq_eq_of_isAspherical_cwComplex` | S¹→S¹, ×2; target S²; Warsaw circle | z²; id and const not homotopic; non-CW counterexample | holds | none |
| `hurewicz_isCIso` | C=0; C=⊤; S³ with torsion, n=1 | classical; trivial; h₃:ℤ≅ℤ and h₄:ℤ/2→0 C-epi | holds | R05 |
| `ordinaryEMRepresentability` | X=∅; S¹ with K=S¹ (n=1); S¹⊔S¹ | 1↔0 group; ℤ↔ℤ; ℤ²↔ℤ² | holds | locator |
| `finiteSourceMappingCWType` | K=pt; K=∅; K=X=S¹ | X; pt; LS¹≃S¹×ℤ | holds | R05 |
| `basedLoopCWType` | S¹ at a 0-cell | ΩS¹≃ℤ | holds | none |
| Check 6.2, (1−t)x | t=1 | slice is constant, so not proper | false | R07 |
| Check 5.5 covering | ℝ→S¹, n=0 | paths from an integer to 0 ↔ ℤ | holds | none |
| Spectral sequence regrading 5.0 | homological (p,q); cohomological | (1−2p−q, p−1), and d_r lands at (p−r, q+r−1); (2p+q+1, −p−1) | consistent | none |
| Boundary sign 6.3 | [−∂r]×o_∂ | −(−1)^(m−1) = (−1)^m | holds | none |
| Ordered simplex 6.3 | edge matrix I+J | det = m+1 > 0; barycentre 0 | holds | none |
| ∂[D¹], ∂[D²] | outward-first | [+1]−[−1]; counterclockwise S¹ | holds | none |
| Linking sign 6.5 | p+q=n−1 | (−1)^((i+1)(n−i)) = (−1)^((p+1)(q+1)) | holds | none |
| RP² sign system 6.1/4.6 | δ⁰=±2, δ¹=0 | H⁰=0, H¹=ℤ/2, H²=ℤ; dual H₂=0, H₁=ℤ/2, H₀=ℤ | holds | none |
| Radial weights 4.7 | z≠0 | Σw=0, weights ≥ (1−r)/(n+1), m>0 | holds | none |
| Colimit check 8.8c | S¹ under ×2 | ℝ/ℤ[1/2] with a dense subgroup, so indiscrete | holds | none |
| k-ification 4.5 | cocountable uncountable X | compact sets finite, so kX is discrete ≠ X | holds | none |
| χ checks 7.4 | Sⁿ, Tⁿ, CPⁿ | 1+(−1)ⁿ, 0, n+1 | holds | none |

## Not verifiable

- These are uncertified in the manifest, so I did not read them. I took their locators as given:
  - Serre 1953, Chapter III Theorem 1, which carries the clauses in R05;
  - Weibel 5.5.1 and 5.5.10;
  - tom Dieck 9.5.1;
  - Freedman–Quinn §7.7;
  - Milnor, *Morse Theory*, Lemmas 3.6–3.7;
  - Dowker 1952.
- May 1967 is an image-only scan that this worker cannot read; it is already in `needs-references.toml`.
- These References have no manifest key: Eilenberg–Steenrod, G. W. Whitehead, Dold, McCleary, K. Brown, and Serre 1951. The manifest's `cited_for` still lists sections 8.13–8.16, which do not exist in the README. Both are for the worker to update.
- I checked ownership against the open roadmap pull requests whose files the brief gives. I did not search the board's other packages beyond the three listed in its index.

## Source issues

- **Misprint** in milnor1959 at the proof of Corollary 3, p. 276: the proof (as read from the OCR text, line 221) invokes Theorem 4, but the paper numbers only Theorems 1–3; it should be Theorem 3; affects nothing.
