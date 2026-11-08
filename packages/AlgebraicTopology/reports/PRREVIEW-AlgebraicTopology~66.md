# Review of AlgebraicTopology (pull request #1663 at 9c71949)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/AlgebraicTopology/README.md` (2929 lines) and `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` (663 lines). The folder changed by 327 lines since `8029fe9`.

The repair is written against a Tau Ceti pin other than the one this branch builds against. The README now cites 25 declarations that exist only at main's pin `2fd255d`, while the branch's manifest pins `358314d4` and `Suggested.lean` is elaborated there. Main moved to `2fd255d` in `a891cd19`, and the branch no longer merges into main.

At `358314d4`:
- the gate passes;
- the dependency check prints no problem;
- the file elaborates with `sorry` as its only warning;
- no headline closes in one tactic;
- the 15 sampled locators read as cited.

At `2fd255d` the same file restates eight of its 21 headlines and seven of its definitions (R02).

## R01 (P2) — Twenty-five cited Tau Ceti declarations do not exist at the branch's pin, and the branch no longer merges into main

**Location.** The citations by name:
- the Serre-fibration API: `README.md` lines 122, 354–361 and 1148–1155;
- six `TauCeti.eulerChar_…` theorems and "Tau Ceti's `ComplexProjectiveSpace`": lines 269–275 and 1920–1935;
- six `TopCat.singularHomologyKunneth…`/`…ToTor…` names: lines 283–290 and 1073–1082;
- `TauCeti.MappingTorus.wangδ`, `wang_exact₁`–`₃`, `wangCokernelEquiv` and `wangMappingConeMap_naturality`: lines 299–302 and 1090–1095;
- `TauCeti.isNullSet_image_criticalPoints`: line 2587.

`Suggested.lean` lines 47–52 also depend on them: "whose Wang sequence is Tau Ceti's"; "the field and hereditary-ring Künneth theorems on the pinned cross product `TopCat.singularHomologyCross` are Tau Ceti's".

**Claim.** The pinned Tau Ceti has these declarations, so the Wang sequence of a homeomorphism mapping torus and the field and hereditary-ring Künneth theorems are native and are not stated. This is the previous review's R01, unrepaired: lines 122, 354–361, 1148–1155 and 2587 are unchanged. It is now extended to this round's citations.

**Witness.** The manifest pins Tau Ceti `358314d4`, where `grep -rw` finds none of the 25: there is no `Singular/Kunneth/` and no Wang connecting map. All 25 exist at main's `2fd255d`. `git merge-tree HEAD origin/main` reports three conflicts.

**Repair.** Merge `origin/main` into the branch. The three conflicts are `Suggested.lean` and modify/delete conflicts on `GeneralModelOrientation.lean` and `TopologicalGroupFundamentalGroup.lean`:
- keep this branch's deletion of the two companion files;
- keep this head's `Suggested.lean`, which already carries main's syntax adaptations of `a891cd19` (for instance line 179's `PUnit.{u + 1}`).

The manifest then pins Tau Ceti `2fd255d`, Mathlib `1b1ccf4b` and Lean v4.36.0-rc2. Elaborate `Suggested.lean` there, re-run the gate, and make the changes of R02, which that pin forces.

The other route keeps `358314d4`: delete the 25 names, write 5.1, 5.2, 5.5 and 7.2–7.4 as owned targets, and state as headlines:
- the Wang sequence of `TauCeti.MappingTorus φ`;
- the field Künneth isomorphism on `TopCat.singularHomologyCross`.

Both carriers exist at that pin. That route leaves the conflict with main in place.

## R02 (P2) — At main's pin, which the README now cites, eight headlines and seven definitions restate Tau Ceti and four "not statable" reasons are false

**Location.** `Suggested.lean`:
- lines 104–122: both Brouwer forms;
- 126–142: `isIso_…_arbitraryDimension`;
- 202–211: `closedCofibrationCylinderHomotopyExtension`;
- 240–296: `FiniteCover`, `finiteCover_transfer_exists`, `RegularDeckAction`, `regularDeckChainMap`, `regularCover_push_transfer`;
- 420–432: `LSCategoricalCover`, `lsCategoryCount`;
- 482–490: `CWTypeModel`;
- 508–523: `relativeCWConnectivityOfCellDimension`;
- 525–540: `whitehead_homotopyEquiv`;
- 579–586: `HasProperHomotopyInverse`;
- docstring lines 45–58: "no spectral-sequence carrier on the pinned singular chains"; "absolute Hurewicz (no Hurewicz map …)"; "relative Hurewicz (no relative homotopy-group carrier)"; "the Milnor `lim¹` sequence".

`README.md`: 2.7 (lines 501–571), 4.3 (636–661), 4.5 (805–809), 5.3 (1102–1144), 6.0 (1199–1241), 6.2's categorical covers (1334–1369), and 8.1 and 8.3–8.5 (1952–2199).

**Claim.** These are results the roadmap still has to prove, or cannot yet state. This is a defect only once R01's merge installs main's pin; none of the counterparts below exists at `358314d4`. The head already writes 25 citations against main's pin.

**Witness.** At `2fd255d` these exist:
- `TauCeti.brouwerFixedPoint_compactConvex`;
- `TauCeti.HasHomotopyExtensionProperty.zero_one_prod_univ_union_univ_prod`;
- `IsCoveringMap.singularTransfer_comp_chainComplexMap`;
- `TauCeti.lsCategoryCount`;
- `TauCeti.CWType`;
- `ContinuousMap.HasProperHomotopyInverse`, which is word for word the file's definition;
- `ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv`;
- `HomotopyGroup.bijective_hurewicz`.

**Repair** (with R01's merge). Cite in the Inventory, all in Tau Ceti `2fd255d`:
- `TauCeti.brouwerFixedPoint_compactConvex` and `…_finiteSpan` (`AlgebraicTopology/Singular/BrouwerFixedPoint.lean` 125, 159; same hypotheses);
- `TauCeti.isIso_singularHomologyMap_skeletonBasePairToComplex_succ_of_hasExactColimitsOfShape` (`Cellular/Comparison.lean` 227: any relative CW complex, exact sequential colimits);
- `TauCeti.HasHomotopyExtensionProperty.zero_one_prod_univ_union_univ_prod` (`Topology/Homotopy/Extension/Prod.lean` 72: `HEP A`, `IsClosed A`);
- `IsCoveringMap.singularTransfer` with `singularTransfer_comp_chainComplexMap` (`Singular/Transfer/Basic.lean` 179, `Degree.lean` 65: `p_* ∘ t = d • id`);
- `IsQuotientCoveringMap.chainComplexMap_comp_singularTransfer` (`Transfer/Basic.lean` 273, deck sum);
- `TauCeti.LSCategoricalCover` and `TauCeti.lsCategoryCount` (`Topology/Homotopy/LusternikSchnirelmann.lean` 84, 264), with that file's deformation inequality (370), coproduct additivity (454) and homotopy invariance (536);
- `TauCeti.CWType` with the instance `CWType.of_cwComplex_univ` (`Topology/CWComplex/Classical/CWType.lean` 38, 72);
- `ContinuousMap.HasProperHomotopyInverse` (`Topology/Homotopy/Proper.lean` 41);
- `TauCeti.injective_homotopyGroupMap_of_isEmpty_cell` and `surjective_…` (`AlgebraicTopology/Homotopy/Relative/CellDimension.lean` 90, 77; `N = Fin q` gives the connectivity headline);
- `ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv` and `homotopyEquiv_toFun` (`AlgebraicTopology/Homotopy/Whitehead.lean` 243, 263).

Then:
- Delete from `Suggested.lean` the eight headlines and seven definitions listed under Location.
- Restate `lsCupLength_add_one_le_categoryCount` with `TauCeti.lsCategoryCount X Set.univ`, `finiteSourceMappingCWType` as `[TauCeti.CWType Y] : TauCeti.CWType C(X, Y)`, and `properStrongDeformationRetract_of_inverse` on `ContinuousMap.HasProperHomotopyInverse`.
- Re-decide the list of statements that are not statable at `2fd255d`. That pin has `TauCeti.filteredSpaceSpectralSequence` (`Singular/FilteredSpace.lean` 247) with `Algebra/Homology/SpectralSequence/Filtered/Convergence.lean`, `HomotopyGroup.bijective_hurewicz` (`Homotopy/Hurewicz/Absolute.lean` 161), `TauCeti.RelHomotopyGroup` (`Homotopy/Relative/Basic.lean` 302) with `Hurewicz/Relative.lean`, and `Algebra/Category/ModuleCat/Tower/Milnor/`.
- Turn 2.7, 4.3, 4.5's cylinder item, 5.3, 6.0, 6.2's cover paragraphs, 8.1 and 8.3–8.5 into consumption plus what remains: local-coefficient and non-regular transfer, the cup-length bound and homological Whitehead.
- Sweep the rest of the README against that pin. It also has `ClassifyingSpace/`, `Homotopy/CWApproximation/`, `Singular/Fibration/`, `Singular/LocalHomology/` (with untwisted compact-support uniqueness, `TauCeti.existsUnique_localHomologyRestriction_eq_of_isCompact`, `Compact.lean` 328) and `TauCeti.eulerChar_torus` (for the `χ(Tⁿ) = 0` check of 7.4).

## R03 (P3) — The order against five conflicting open revisions of this folder is still unstated

**Location.** The pull request description, which says "Previous roadmap content and dependency pins are preserved" and nothing about other revisions. `README.md` lines 1425, 1434, 2811 and 2814, which consume "CC C1.2a's S0–S4".

**Claim.** This is the previous review's R05, unrepaired. Another open pull request changes this roadmap with a conflicting head and no stated order: a P3 rule.

**Witness.** `overlaps.md`: #1652, #1797, #1807, #1808 and #1854 conflict in `README.md` and `Suggested.lean`. #1854's head (line 1667) makes this roadmap own the compactly supported local-coefficient cochains, which this head consumes from CharacteristicClasses C1.2a S0–S4.

**Repair.** State in the description the order among this pull request, #1652 and the loop-cutting revisions #1797, #1807, #1808 and #1854. Rebase onto the one this branch follows before either merges. If #1854 goes first, replace the C1.2a S0–S4 consumption at lines 1424–1434, 2811 and 2814 with its ownership of the supported cochains.

## R04 (P3) — A misnamed native declaration and two locators that name no work

**Location.**
- `README.md` lines 309 and 596: `TauCeti.AffineChain.exists_iterate_singularSubdivision_factor_small`.
- Line 808: "(Strøm's product theorem)". This is the route of the headline `closedCofibrationCylinderHomotopyExtension`, whose docstring (`Suggested.lean` lines 202–204) cites no source.
- Line 804: "(Milnor Lemmas 3.6–3.7)".

**Claim.** Each library name exists as written, and each claim carries a locator into a work in the References.

**Witness.** `Small/Chains.lean` closes `namespace AffineChain` at line 230, before the theorem at line 236 (`358314d4`; lines 236 and 242 at `2fd255d`). The References list neither Strøm nor Milnor's *Morse Theory*. Strøm's theorem is `strom1972` line 181 (Theorem 6, p. 135).

**Repair.**
- Write `TauCeti.exists_iterate_singularSubdivision_factor_small` at lines 309 and 596.
- At line 808 write "(Strøm, *Note on cofibrations II*, Math. Scand. 22 (1968), Theorem 6, p. 135, for `(I, ∂I) × (X, A)`)", and add the locator to the docstring at `Suggested.lean` lines 202–204.
- At line 804 write "(Milnor, *Morse Theory*, 1963, §3, Lemmas 3.6–3.7)".
- List both works in References.

After R02 the cylinder item cites `TauCeti.HasHomotopyExtensionProperty.zero_one_prod_univ_union_univ_prod` instead, and the Strøm locator moves with it.

## Previous findings (review of `8029fe9`)

- **R01** (Serre-fibration names and `TauCeti.isNullSet_image_criticalPoints` absent at the pin): **not repaired**. Lines 122, 354–361, 1148–1155 and 2587 are unchanged and the names are still absent at `358314d4`. It is carried as R01 above, extended to this round's new citations.
- **R02** (Stage 7 restates the native Euler characteristic): **repaired** in `Suggested.lean`. `finiteCWEulerCharacteristic`, its homotopy-invariance theorem and `FiniteCWTypeModel` are deleted; `compactManifoldFiniteCWType` concludes `TauCeti.FiniteCWType M`; docstring lines 39–42 name `TauCeti.eulerChar`, `TauCeti.eulerChar_eq_cwEulerChar` and `ContinuousMap.HomotopyEquiv.eulerChar_eq`, all present at `358314d4`. **Partly repaired** in the README: 7.1 is correct at this pin, but 7.2–7.4 and lines 269–275 cite six theorems that exist only at main's pin (R01).
- **R03** (dropped name HomotopySpheres): **repaired**. The name occurs nowhere and the gate reports `dropped=0`. Line 1988 now gives the Freudenthal theorem to RiemannianGeometry R3, which RiemannianGeometry line 603 supports.
- **R04** (cross products, mapping torus, subdivision, compact support, cylinder criterion, skeleton neighbourhoods planned again): **repaired** for everything present at `358314d4`. Lines 276–327 and items 3.1–3.2, 4.3, 4.5, 5.1, 5.2 and 6.2 now consume these, and every cited name resolves except the Künneth and Wang names (R01) and one namespace (R04).
- **R05** (order against conflicting open revisions): **not repaired**; the description is unchanged. Carried as R03.
- **R06** (five backticked names declared nowhere): **repaired**. `diskBoundarySubset`, `standardCellBallToOrderedSimplex`, `coverHomologyRep` and `homotopySpherePole` are gone; `rawChartCoefficient_at` is no longer in backticks (line 1568).

## Verified sound

**Gate and dependency check.** The worker's gate at `9c71949` and my re-run report every scanner at 0 (`dropped=0`, `readme-ids-missing=0`, `stray-files=0`, `outside-folder=0`, `build=0` in the worker's run) and `OK`. The dependency check (`gate --depcheck … --movable`) prints:

```
depcheck: 236 roadmaps, 2419 edges, 0 problem(s)
```

It prints no UPWARD, CYCLE or `moved:` line for this roadmap, which is on main and so not in `ORDER.txt`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AlgebraicTopology'` is empty. The folder holds `README.md`, `Suggested.lean`, `STATUS.md`, `PROGRESS.md` and `metadata.toml`.

**Elaboration.** I ran `lake env lean` on `Suggested.lean` from the worktree. `.lake/packages` is at the branch's pins: `git rev-parse` gives Tau Ceti `358314d4` and Mathlib `f6090c70`, with toolchain v4.35.0-rc3. All 15 imported `TauCeti.*` object files were present. Result: exit 0 in 1 m 46 s, exactly 21 `declaration uses sorry` warnings (lines 107, 117, 136, 196, 205, 220, 254, 286, 360, 412, 453, 465, 498, 513, 529, 545, 574, 605, 620, 633, 652) and the 9 `#check` outputs, nothing else.

Form: `module`, `public import Mathlib` plus 15 `public import TauCeti.*` lines, one module docstring, `namespace TauCetiRoadmap.AlgebraicTopology`, `theorem` throughout, no `lemma`, no `set_option`, no sorried data, `#check` only on library declarations.

Every one of the 52 declarations of `Suggested.lean` occurs in the README.

**`#check @` pass.** A scratch copy with `#check @name` for all 52 declarations (21 theorems, 17 defs, 7 abbrevs, 6 structures, 1 inductive) elaborated. Every binder the README states is in the elaborated type:
- `compactManifoldFiniteCWType` keeps `T2Space`, `SecondCountableTopology`, `CompactSpace`, the Euclidean `ChartedSpace` and `IsManifold … ↑⊤`, and concludes `TauCeti.FiniteCWType M`.
- `finiteSourceMappingCWType` keeps `CompactSpace X`, `T2Space X` and `T2Space Y`.
- `properStrongDeformationRetract_of_inverse` keeps `T2Space` and `LocallyCompactSpace`.
- `relativeCWConnectivityOfCellDimension` keeps `T2Space`, the `IsEmpty (cell …)` bound and `q + 1 < cellLowerBound`.
- `exists_transverse_circle_classifying_map` keeps `FiniteDimensional ℝ E`, `IsManifold I ↑⊤ M`, `I.Boundaryless`, `T2Space`, `SecondCountableTopology` and `CompactSpace`.
- `lsCupLength_add_one_le_categoryCount` keeps `[Nonempty ↑X]`.
- Both Brouwer forms keep `C.Nonempty`, `IsCompact`, `Convex` and the finite-dimensionality binder.

No binder was lost.

**One-tactic probe.** In the same copy every `sorry` was replaced by `first | rfl | trivial | infer_instance | (simp_all; done) | aesop | sorry`. No theorem closes: 10 fall through to `sorry`, and 11 end with aesop's "failed to prove the goal" and unsolved goals. Nothing in the file restates a definition, mirrors a Check or computes a value at this pin. The restatements R02 names exist only at main's pin.

**Library declarations opened at the branch's pin** (`358314d4`):
- Euler characteristic and finite CW type: `TauCeti.FiniteCWType` (`Topology/CWComplex/Classical/FiniteCWType.lean` 73, a `Prop` class with a finite CW model in a Hausdorff space of the same universe), `TauCeti.cwEulerChar` (`Cellular/EulerCharacteristic/Basic.lean` 64). In `…/EulerCharacteristic/FiniteCWType.lean`: `TauCeti.eulerChar` (92, requires `[FiniteCWType X]`), `eulerChar_eq_finsum_finrank_singularHomology` (102, any division ring), `eulerChar_eq_cwEulerChar` (112), `eulerChar_cwComplex` (120) and `ContinuousMap.HomotopyEquiv.eulerChar_eq` (126). The README's lines 260–268 and 1911–1919 and the docstring's lines 39–42 are correct.
- Cross products: `TopCat.singularHomologyCross` (`Singular/CrossProduct.lean` 73); `TauCeti.singularCross`, `singularCross_diagonal` and `singularCross_eq_singularCup` (`Cohomology/CrossProduct.lean` 56, 92, 104).
- Mapping torus: `TauCeti.MappingTorus` (`Topology/MappingTorus.lean` 79, relation `(x, t) ~ (φ x, t + 1)`), with `incl` (122), `monodromyHomotopy` (131), `map` (150), `map_comp_incl` (169), `map_id` (177), `map_comp` (186) and `proj_comp_map` (233). In `Singular/MappingTorus.lean`: `singularChainHomotopy` (49) and `homologyMap_monodromy_comp_incl` (70).
- Subdivision: `singularSubdivisionChainMap` and `singularSubdivision` (`Subdivision/Basic.lean` 205, 227); `TauCeti.AffineChain.prism`, `singularPrismX`, `singularSubdivisionHomotopy` and `homologyMap_singularSubdivisionChainMap` (`Subdivision/Homotopy.lean` 73, 192, 239, 250). Small chains: `TopCat.smallSingularSubcomplex` (`Small/Chains.lean` 60), `TopPair.isIso_homologyMap_restrictι_smallSingularSubcomplex` (`Small/Relative.lean` 76), and `singularSmallApprox` and `singularSmallApproxHomotopy` (`Small/Equiv.lean` 231, 243).
- CW topology: `finite_setOf_nonempty_inter_openCell_of_isCompact` and `exists_subset_skeletonLT_of_isCompact` (`Classical/CompactSupport.lean` 57, 99), `isColimitMapCoconeSingularHomology` (`Singular/DirectedUnion.lean` 95), `continuous_prod_complex_iff` (`Classical/Quotient.lean` 113, locally compact `Z`), and `skeletonNeighborhood` and `skeletonNeighborhoodHomotopy` (`Skeleton/Neighborhood.lean` 77, 266). Also `isIso_singularHomologyMap_skeletonPairToNeighborhood` and `cellularChainGroupIsoNeighborhood` (`Cellular/SkeletonNeighborhood.lean` 119, 133).
- The nine `#check`ed names, with the types printed by the elaboration.

Absent at this pin, consistently with the docstring's list of statements that are not statable: any Hurewicz map, a relative homotopy group, a Lusternik–Schnirelmann count, `CWType`, `HasProperHomotopyInverse`, and a Brouwer theorem.

**Cross-roadmap citations resolved** (main `829d7159`). RiemannianGeometry R3.4 (line 603: "the Morse proof of the sphere Freudenthal range") supports line 1988. DGFloer Layer 1 item 2 (lines 140, 230) consumes `TauCeti.TopCat.serreFibrations`, as line 122 says. CharacteristicClasses C1.2a S0 (line 514), and its sentence that the AT supported-cellular supplement consumes S0–S4 (lines 66–67), agree with lines 1424–1434. TangentialBordism at its head (`rev/942` lines 74–75, 260) consumes 8.13's three theorems for boundaryless sources and owns the corner extension and the Sard theorem in unequal dimensions, as lines 68–76 say.

No occurrence of the dropped name HomotopySpheres remains. The descriptive "homotopy-sphere roadmap" at lines 133–140, 755 and 1000 cites no section of it and is a consumer, not a supplier. `overlaps.md` lists no dropped id in either direction and no id that only an open revision defines; I checked each of its six items (R03).

**Ownership against open work.** I searched by object with `roadmaps grep` and in the sibling checkouts for the objects this head changed:
- The Wang sequence of a mapping torus of an arbitrary self-map: owned only here.
- Künneth over a general ring and its local-coefficient form: owned only here.
- The finite-CW-type Euler characteristic: consumed from Tau Ceti; no roadmap owns it.

The closest-vocabulary leads (CharacteristicClasses at #1807, #1808 and #1854, HomotopySpheres, TangentialBordism) are R03 and the citations above.

**Sources: the seeded sample** (15 targets; the worker's sample found none by heading). In `hatcher`, printed page = marker − 9; every target reads as cited:
- Example 2.48 (line 6588, p. 151: the mapping torus of `g` as `X × I/(x,0) ~ (g(x),1)`, with the sequence through `f_* − g_*`).
- Proposition 4.48 (16461, p. 379: fibre bundles lift homotopies of CW pairs; paracompact bases attributed to Huebsch–Hurewicz).
- Lemma 2.34(c) (5963, p. 137).
- Theorem 3B.6 (11898, p. 275: PID Künneth for CW complexes, split), and its relative form for CW pairs (11937, p. 276).
- Theorem 3.30 (10453, p. 241).
- Lemma 3.27 (10255, p. 236).
- Proposition 3.29 (10370, p. 239).
- Corollary 4.33 (16001, p. 367).
- Example 1B.7 (3844, p. 89).
- Proposition 1B.9 (3905, p. 90).
- Proposition A.16 (23081, p. 531: a homeomorphism for `Y` locally compact Hausdorff and `Z` Hausdorff, as line 1031 says).
- Theorem A.6 (22693, p. 524).
- Section 3.G (14019–14028, p. 321: the transfer sums the `n` lifts).

Outside `hatcher`:
- `brown` 7.4.2 and its Addendum (lines 11027–11043, pp. 285–286).
- `milnor1959` Theorem 3 (209–212, both assertions).

Strøm Theorem 6 (`strom1972` 181–185, p. 135) and Vogt's Proposition (`vogt1972` 28–31) also read as the README uses them; R04 concerns only the missing locator.

**Declared gaps.** None. There is no readable `design/plan.json`, and a revision of a roadmap on main declares none.

**Headlines that stay at main's pin.** I searched `2fd255d` by object, with a helper locating candidates and every line read before use. These headlines have no counterpart there:
- `homotopyInversePairExtension_left` (only Hatcher 0.19's homeomorphism case, `HasHomotopyExtensionProperty.exists_inverse_homotopicRel`, `Topology/Homotopy/Extension/HomotopyEquivRel.lean` 138);
- `ordinaryPairQuotientComparison`;
- `compactSupportTopClass_existsUnique` (only the untwisted form);
- `poincareDuality_of_fundamentalClass`;
- `lsCupLength_add_one_le_categoryCount`;
- `productBallImages_intersect`;
- `compactManifoldFiniteCWType`;
- `homologicalWhitehead`;
- `groupClassifyingSpace_isEMOne` (the native `TauCeti.isEilenbergMacLaneSpaceOne_classifyingSpace` is Milnor's model, not the nerve);
- `properStrongDeformationRetract_of_inverse`;
- `finiteSourceMappingCWType`;
- `exists_transverse_circle_classifying_map`;
- `elementaryAbelianPair_sphere_action_has_stabilizer`.

These stay as headlines after R02.

**Adversarial table** (statement, instances, values on each side, result). These are the 21 headlines, the definitions they rest on, and the two conventions this round touched.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| `brouwerFixedPoint_compactConvex` | `C = {c}`; `C = [0,1]`, `f(x) = 1 − x`; `C = (0,1)`, `f(x) = x/2`; `C = S¹ ⊆ ℝ²`, rotation by `π`; unit ball of `ℓ²` with Kakutani's map; `C = ∅` | `x = c`; `x = 1/2`; no fixed point, excluded by `IsCompact`; none, excluded by `Convex`; none, excluded by `FiniteDimensional`; no `x : C`, excluded by `hne` | holds; each hypothesis separates an instance |
| `brouwerFixedPoint_compactConvex_finiteSpan` | `E = ℓ²`, `V = span{e₁}`, `C = [0, e₁]`, `f(te₁) = (1−t)e₁` | fixed point `e₁/2 ∈ C ⊆ V` | holds |
| `isIso_…_arbitraryDimension` | `X = RP^∞`, `D = ∅`, `n = 1`; `n = 0`, `X` path connected; `X = D` | `H₁(RP²) = ℤ/2 → H₁(RP^∞) = ℤ/2` iso; `H₀(X¹) = ℤ → H₀(X) = ℤ`; identity on `H_n(D, D) = 0` | holds (Lemma 2.34(c), `k = n < n+1`) |
| `ordinaryPairQuotientComparison` | `B = ∅`; `X = ∅`; `(D¹, S⁰)` at `n = 1`, `n = 0` | `H_n(X) ≅ H_n(X₊, ∗)`; `0 ≅ H_n(∗, ∗) = 0`; `ℤ ≅ H₁(S¹, ∗) = ℤ`; `0 ≅ H₀(S¹, ∗) = 0` | holds |
| `closedCofibrationCylinderHomotopyExtension` | `A = ∅`; `A = X` | HEP of `{0,1} × X` (Strøm Thm 6 with `(I, ∂I)`, `∂I` closed); the whole cylinder | holds; `hAc` is not needed by Strøm's theorem, since the closed subspace there is `∂I` (note, not a finding) |
| `homotopyInversePairExtension_left` | `A = A' = ∅`; `e = e₀ = id`, `g₀ = id`, `H₀` constant | a homotopy inverse with left homotopy; `g = id`, `H` constant, stationary on `A` | holds |
| `finiteCover_transfer_exists` | `E = ∅` over nonempty `B`; `B = ∅`; identity cover; `z ↦ z²` on `S¹` | `degree = 0`, `t = 0`, both sides `0`; all chains `0`; `t = id`, `d = 1`; `p_* t σ = 2σ` | holds; `fiber_card` forces the degree on nonempty fibres |
| `regularCover_push_transfer` | `B ⊔ B → B`, `G = ℤ/2`; `E = ∅ ≠ B` | `t(p∘τ) = τ + swap τ = Σ_g g_*τ`; excluded by `pSurjective` | holds |
| `compactSupportTopClass_existsUnique` | `K = ∅`; `M = S²`, `K = V = S²`, `L = ℤ`, orientation section; `M = RP²`, `L = ℤ`; `R = 0` | unique `c = 0 ∈ H_m(M, M) = 0`; `c = [S²]`; only `s = 0` is locally represented globally, `c = 0`, `H₂(RP²) = 0`; all modules `0` | holds (Lemma 3.27(a) with local coefficients) |
| `poincareDuality_of_fundamentalClass` | `n = 0`, `M` finite discrete; `M = ∅`; `RP²` over `𝔽₂`, `p = 1`; `RP²` over `ℤ`; `p = n` | cap is multiplication by units on `R^M`; `0 → 0`; `𝔽₂ → 𝔽₂` bijective; no `μ` (local images of `H₂ = 0` span `0 ≠ ℤ`), vacuous; `H^n → H₀` | holds; `hp` blocks truncated `n − p` |
| `FundamentalClassDatum` | `S¹` over `ℤ`, `μ = [S¹]`; `μ = 2[S¹]` | local images `±1`, span `ℤ`; local images `±2`, span `2ℤ ≠ ⊤` | the wrong model (any nonzero class) is excluded |
| `lsCupLength_add_one_le_categoryCount` | point; `S¹`; `T²`; `R = 0`; `RP^∞` over `𝔽₂`; `X = ∅` | `0+1 ≤ 1`; `1+1 ≤ 2`; `2+1 ≤ 3`; `0+1 ≤ count ≥ 1`; `⊤ + 1 ≤ ⊤`; `1 ≤ 0` false, excluded by `[Nonempty X]` | holds |
| `lsCategoryCount`, `lsCupLength` | no finite categorical cover; no nonzero positive product | `sInf ∅ = ⊤`; `sSup ∅ = 0` | conventions as the README states |
| `productBallImages_intersect` | `p = q = 0`; `(p, q) = (1, 0)`; `(1, 1)`; constants `f ≡ (a,0)`, `g ≡ (0,b)` | both balls a point, `f 0 = g 0`; `hg` vacuous (`S₀ = ∅`), `g 0 = (c, 0)`, IVT gives `f₁(x) = c`; the square-crossing theorem; `f(−a) = (a,0) ≠ (−a,0)` violates `hf` | holds; the `(−1)^q d_f d_g` coefficient: `y ↦ −g₂(y)` acts by `(−1)^q` |
| `compactManifoldFiniteCWType` | `S²`; `ℝ`; `n = 0`; `M = ∅` | finite CW model; excluded by `CompactSpace`; finite discrete set; empty complex | holds; the model lives in `Type u` as `TauCeti.FiniteCWType` requires |
| `relativeCWConnectivityOfCellDimension` | `λ ≤ 1`; `(D², S¹)`, `λ = 2`, `q = 0`; `q = 1` | no `q`; `π₀(S¹) → π₀(D²)` bijective (`1 < 2`); `2 < 2` false and `π₁(S¹) = ℤ → 0` not injective | holds and is sharp (Cor. 4.12) |
| `whitehead_homotopyEquiv` | `∅ → ∅`; `S¹ ⊔ S¹ → S¹`; `S² ∨ S⁴` vs `CP²` | `e : ∅ ≃ₕ ∅`; `hinj` fails; no map is a `π_*` iso | holds |
| `homologicalWhitehead` | `S² → S²` of degree 1; Poincaré sphere `Σ → S³` | homotopy equivalence; homology iso but `π₁Σ` is the binary icosahedral group, excluded by `SimplyConnectedSpace` | holds; the hypothesis is necessary |
| `groupClassifyingSpace_isEMOne` | trivial `G`; `ℤ`; `ℤ/2`; `S₃` | a point; `S¹`; `RP^∞`; nonabelian allowed | holds |
| `properStrongDeformationRetract_of_inverse` | `A = ∅ ≠ X`; `A = X`; `X = [0,∞)`, `A = {0}` | no proper `g : X → ∅`, vacuous; `r = id`; `r ≡ 0` is not proper (`r⁻¹{0} = [0,∞)`), excluded | holds |
| `finiteSourceMappingCWType` | `X = ∅`; `X = pt`; `X = Y = S¹`; `X` a Cantor set | `C(∅,Y) = pt`; `C(pt,Y) ≅ Y`; `LS¹ ≃ S¹ × ℤ`; Milnor's Thm 3 needs only compactness | holds |
| `exists_transverse_circle_classifying_map` | `M = ∅`; `M = pt`; `M = S¹`, `a = b 0`, `a = −b 0`, `a = 2 b 0` | vacuous; `a = 0`, `f ≡ −1` (`f ≡ 1` would need `0 ↠ ℝ`); `f = id`; `f = conj`; `f = z²`, `f⁻¹(1) = {±1}` | holds; quantifying `b` covers both generators |
| `elementaryAbelianPair_sphere_action_has_stabilizer` | `p = 2`, `n = 0`; `n = 1`; `p = 3`, `n = 2` | 4 elements cannot act freely on 2 points; free actions on `S¹` have cyclic deck group; `dim H^{3}(BG;𝔽₃) = 4 > 1` | holds (Ex. 28 route) |
| Stage 5.2 convention | native `TauCeti.MappingTorus φ`, Hatcher Ex. 2.48 | native relation `(x, t) ~ (φ x, t + 1)` gives `(x,0) ~ (φx, 1)`; Hatcher `(x,0) ~ (g(x),1)` with `f_* − g_* = id − g_*` | the README's `id − f_*` agrees with both (and with main's `wangδ` docstring) |
| 8.5 example `RP² × S³` vs `S² × RP³` | Künneth in degree 2 | `H₂ = 0 ⊕ 0 ⊕ 0`, Tor terms `0`; `H₂ = ℤ ⊕ 0 ⊕ 0` | different, as stated |

## Not verifiable

- **Elaboration of `Suggested.lean` at main's pin.** Tau Ceti `2fd255d`, Mathlib `1b1ccf4b`, Lean v4.36.0-rc2: not run, because no build may be started outside the worktree's own pin. Whether this head's file elaborates there after the merge of R01 is untested. Main's own adaptation commit `a891cd19` changed only syntax in this file, and this head already contains those changes.
- **Sources recorded `uncertified`, cited by locator only:**
  - Lee 2012, Theorems 6.26, 6.35, 6.36 (8.13), and Thom 1954, Chapter II (8.13).
  - Milnor 1963, Lemmas 3.6–3.7 (line 804).
  - Weibel 1994 (5.1, 6.1).

  The 8.13 route was checked against the pinned declarations instead.
- **The conflicting heads of #1797, #1807, #1808 and #1187.** These are not in this worker's `rev/` checkouts. R03 relies on `overlaps.md` and on `roadmaps show AlgebraicTopology --pr 1854`.

## Source issues

- none
