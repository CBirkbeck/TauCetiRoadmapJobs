# Review of ClassifyingSpaces (pull request #1854 at c9c60d0)

**Verdict:** needs changes

This is a full review. The previous review (r28) read pull request #1808 at a3b1e14, whose folder is a different text. `git diff --stat a3b1e14 HEAD -- TauCetiRoadmap/ClassifyingSpaces` reports 2 files changed, 605 insertions and 900 deletions, so the brief's "no change since the head it read" does not hold.

At this head the folder is byte-identical to its state at 113b939 and 4f06ba2 (two earlier heads of #1807, reviewed in rounds 7 and 11). 113b939 is an ancestor of this head and is the only commit since main that touches the folder. The README keeps main's Stage 1–4 / items 1–19 numbering.

The pin is unchanged from main: Tau Ceti `2fd255d99`, Mathlib `1b1ccf4b`. At that pin, `TauCeti/AlgebraicTopology/ClassifyingSpace/` holds 30 files, 5,827 lines, with no `sorry`. The gate fails on two files outside the folder.

## R01 (P1) — Item 13 has a false Check: the join of the trivial group has infinitely many cells in each degree, not one

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` lines 369–370: "The free `ℤ[G]`-module of `n`-chains of `E` has rank the number of `n`-cells of `B`: for the join of the trivial group, every rank is one."

**Claim.** For `G = 1`, `E = B` is the countable join of one-point sets. By item 1's own Check (lines 160–161), that is the infinite simplex on the vertices `{(i, 1) : i ∈ ℕ}`. Its `n`-cells are its `n`-simplices, one for each `(n+1)`-element subset of `ℕ`. Every rank is therefore countably infinite.

**Witness.** In degree 0 the rank is `|ℕ|`. Item 18's Check (lines 477–478) says the same thing: "the join has `ℤ^(ℕ)` and the standard complex `ℤ`". So the two Checks of the same roadmap contradict each other.

**Repair.** Replace the second clause with: "for the trivial group, the rank in degree `n` is the number of `(n+1)`-element subsets of `ℕ`, countably infinite, so already in degree 0 the module is `ℤ^(ℕ)` (item 18)". Or use a finite example: "for `ℤ` acting on `ℝ` over the one-vertex circle, every rank is one in degrees 0 and 1". Tested: both versions agree with item 18's degree-0 value `ℤ^(ℕ)`.

## R02 (P2) — Stages 1–4 plan, as targets, what the pinned Tau Ceti already proves in the roadmap's own suggested home

**Location.**
- Line 24: "Suggested home: `TauCeti/AlgebraicTopology/ClassifyingSpace/`".
- Lines 61–73: "It owns the two models (Stages 1 and 2), … the transfer of CW structures … the chain-level comparison …".
- Lines 134–138: the Inventory, whose Tau Ceti entry lists only the universal cover, `IsAspherical`, `IsEilenbergMacLaneSpaceOne` and the recognition theorems.
- Items 1–19, lines 150–487.
- Scope item 1, lines 32–36: the cellular model "is proved … locally path-connected and semilocally simply connected". Item 10 (lines 285–291) neither proves nor cites this; its *Needs:* is "(7), (9); … `IsEilenbergMacLaneSpaceOne`".

**Claim.** The suggested home exists at the pin and proves, with no `sorry`, the constructions and theorems the README states as this roadmap's targets. The pin also supplies the standing hypotheses that Scope item 1 promises and no item provides. The principles require that what exists at the pins is cited by exact name and file, not planned again.

**Witness.** All files below are under `TauCeti/AlgebraicTopology/ClassifyingSpace/` at the pin unless another path is given; `grep -rln sorry` over that directory and over `Homotopy/KillHomotopyGroups.lean` finds nothing.

- **Item 1:** `universalGSpace`, `universalGSpaceBasepoint` and `MonoidHom.universalGSpaceMap` (`CountableJoin.lean` 41, 46, 66).
- **Item 2:** `instSimplyConnectedSpaceUniversalGSpace` and `subsingleton_homotopyGroup_universalGSpace` (`WeakContractibility.lean` 40, 45); `instContractibleSpaceUniversalGSpace` (`Contractible.lean` 33).
- **Item 3:** `instMulActionUniversalGSpace` (`Action.lean` 96). In `Basic.lean`: `classifyingSpace` (73), `classifyingSpaceProj` (81), `classifyingSpaceBasepoint` (86), `classifyingSpaceProj_eq_iff_existsUnique` (125), `isQuotientCoveringMap_classifyingSpaceProj` (141), `classifyingSpaceLift` (169) and `classifyingSpaceDeckMulEquiv` (196).
- **Item 4:** `instPathConnectedSpaceClassifyingSpace`, `instLocallyPathConnectedSpaceClassifyingSpace` and `instSemilocallySimplyConnectedSpaceClassifyingSpace` (`Basic.lean` 151, 156, 162).
- **Item 5:** in `EilenbergMacLane.lean`, `classifyingSpaceFundamentalGroupMulEquiv` (67) and `classifyingSpaceFundamentalGroupMulEquiv_apply_eq_iff` (77). The latter sends `γ` to `g` exactly when the lift ends at the vertex `⟨0, g⁻¹⟩`, which is the README's `m(γ)⁻¹`. Also `isEilenbergMacLaneSpaceOne_classifyingSpace` (104), `exists_isEilenbergMacLaneSpaceOne` (120) and `universalGSpaceHomeomorphUniversalCover` (129).
- **Item 6:** `MonoidHom.classifyingSpaceMap` (60), its `_id` (82) and `_comp` (90) laws, and `classifyingSpaceFundamentalGroupMulEquiv_mapOfEq` (101), all in `Functoriality.lean`.
- **Item 7:** `PresentationComplex`, `PresentationComplex.fundamentalGroupMulEquiv`, `PresentationComplex.instCWComplex` and `PresentationComplex.isEmpty_cell` (`PresentationComplex.lean` 117, 238, 288, 329).
- **Items 8–9:** `killHomotopyGroups`, together with `instT2SpaceKillHomotopyGroups` (249), `bijective_homotopyGroupMap_killHomotopyGroupsIncl` (260), `subsingleton_homotopyGroup_killHomotopyGroups` (269), `killHomotopyGroupsCWComplex` (358) and `TopCat.Hom.exists_killHomotopyGroupsIncl_comp_eq` (465), in `Homotopy/KillHomotopyGroups.lean`.
- **Item 10:**
  - `cellularClassifyingSpace`, `isEilenbergMacLaneSpaceOne_cellularClassifyingSpace` and `instCWComplexCellularClassifyingSpace` (`Cellular.lean` 113, 161, 209);
  - `exists_isEilenbergMacLaneSpaceOne_cellularClassifyingSpace` (`Comparison.lean` 287), whose conclusion includes `LocallyPathConnectedSpace` and `SemilocallySimplyConnectedSpace`;
  - `instSemilocallySimplyConnectedSpaceCellularClassifyingSpace` (`Comparison.lean` 275);
  - `TauCeti.instDeltaGeneratedSpaceOfCWComplexUniv` (`Topology/CWComplex/Classical/DeltaGenerated.lean` 66).
- **Item 11, partly:**
  - existence out of the cellular model, `exists_mapOfEq_cellularClassifyingSpace` (`Cellular.lean` 174);
  - uniqueness out of the cellular model, `homotopicRel_of_mapOfEq_eq_cellularClassifyingSpace` (242);
  - uniqueness out of any CW complex with a single 0-cell, `homotopicRel_singleton_of_mapOfEq_eq_of_cwComplex` (`EilenbergMacLane/Homotopic.lean` 220).
- **Item 12, up to a change of base point:** `IsAspherical.exists_homotopyEquiv`, `IsEilenbergMacLaneSpaceOne.nonempty_homotopyEquiv` and `IsAspherical.exists_homotopyEquiv_classifyingSpace` (`Uniqueness.lean` 73, 94, 109).
- **Item 13:**
  - `cwComplexPreimage` (`Topology/CWComplex/Classical/Covering.lean` 398);
  - `IsQuotientCoveringMap.cwComplexQuotient` (`Topology/CWComplex/Classical/OrbitSpace.lean` 290);
  - `instCWComplexUniversalGSpace`, `instCWComplexClassifyingSpace`, `instT2SpaceClassifyingSpace` and `classifyingSpaceCellEquiv` (`CWComplex.lean` 138, 358, 365, 382).
- **Item 14, first paragraph:** `cellularHomotopyEquivClassifyingSpace` (`Comparison.lean` 211), with its `π₁` compatibility (230), pointed uniqueness (242) and inverse (256).
- **Item 15:** `classifyingSpaceFunctor`, `classifyingSpaceHomotopyFunctor` and `classifyingSpaceHomotopyFunctorCompFundamentalGroupFunctorIso` (`HomotopyFunctor.lean` 79, 107, 119).
- **Item 16:** `universalGSpaceResolution` (`Resolution.lean` 218), `cellularClassifyingSpaceResolution` (`PresentedGroupResolution.lean` 105) and `cellularResolutionOfIsAspherical` (`EilenbergMacLane/Resolution.lean` 57).
- **Item 17, first paragraph:**
  - `classifyingSpaceSingularHomologyIsoGroupHomology` (`Homology.lean` 69; naturality in `G` at 112);
  - `classifyingSpaceSingularCohomologyIsoGroupCohomology` (`Cohomology.lean` 89; naturality at 103 and 149; Bockstein at 122);
  - `classifyingSpaceLocalSystem`, `classifyingSpaceTwistedHomologyIsoGroupHomology` and `classifyingSpaceTwistedCohomologyIsoGroupCohomology` (`LocalCoefficients.lean` 126, 136, 150), with connecting maps at 247 and 331.
- **Item 18:** `universalGSpaceToStandard` (`StandardComplex.lean` 88), `universalGSpaceChainComplexToStandardComplex` and `universalGSpaceStandardHomotopyEquiv` (`StandardResolution.lean` 94, 176), and `universalGSpaceChainComplexToStandardComplex_naturality` (`Naturality.lean` 119).
- **Item 19 and the Acceptance checks:**
  - `classifyingSpaceFirstHomologyAddEquiv` (`FirstHomology.lean` 73);
  - `circleHomotopyEquivClassifyingSpace` (`Circle.lean` 122);
  - `wedgeCirclesHomotopyEquivClassifyingSpace` and `wedgeCirclesHomotopyEquivCellularClassifyingSpace` (`WedgeCircles.lean` 126, 172);
  - `subsingleton_classifyingSpace_singularHomology_int_of_even` (`FiniteCyclic.lean` 118);
  - `torusHomotopyEquivClassifyingSpace` (`Torus.lean` 87).

**Repair.**
1. Rewrite `## Ownership and dependencies` and the Inventory as a `From Tau Ceti` contract that lists the declarations above by name and file. In the same contract name the pinned Hurewicz, Whitehead and cellular–singular comparison that AlgebraicTopology 8.3, 8.5 and 4.3 themselves consume.
2. Delete items 1–10, 13, 14 ¶1, 15, 16, 17 ¶1, 18 and 19 as targets.
3. Keep the conventions those items fix as `## Conventions`, pinned by `classifyingSpaceFundamentalGroupMulEquiv_apply_eq_iff`: the direction `γ ↦ m(γ)⁻¹` and the `S₃` and `ℤ` Checks.
4. Keep as targets only what the pin lacks:
   - existence in item 11 for an arbitrary path-connected Hausdorff CW source;
   - the pointed form of item 12;
   - item 17 for an arbitrary Hausdorff CW `K(G, 1)`, with trivial and with local coefficients (R04);
   - whatever of items 14 ¶2 and 17 ¶2 survives R03.
5. Give each remaining target a *Needs:* line naming the pinned declarations it starts from.

The folder at #1807's head (804 lines, Layer form) already makes this restructuring; its text can be taken over.

## R03 (P2) — Three objects have two owners: this roadmap and this pull request's own AlgebraicTopology folder

**Location.** Here:
- lines 20–22: "its comparison with the two models here, normalised to be the identity on `G`, is also a theorem of this roadmap";
- lines 69 and 105–107: "the comparison of its nerve model with the models here is owned here, not there";
- item 11 (lines 295–306);
- item 14 ¶2 (lines 376–386);
- items 7–10.

In `TauCetiRoadmap/AlgebraicTopology/README.md` at this head:
- lines 2435–2440: "For a Hausdorff CW K(G,1) Z with a chosen identification κ_Z:π₁Z≅G, construct … the pointed map c_G:Z→Bπ … unique up to pointed homotopy";
- lines 2453–2456: "For each connected pointed CW complex X prove `[X,Bπ]_*≃Hom(π₁X,π)`";
- lines 2507–2513: "for n=1 the group-presentation 2-complex, followed by killing successive higher homotopy groups by cells in dimensions … ≥3".

**Claim.** The pull request description says Stage 8.8b "now states only the bar model's own normalized pointed interface". That does not hold at this head.

- **The comparison `c_G`.** AlgebraicTopology 8.8b builds the normalised pointed homotopy equivalence `c_G` for *every* Hausdorff CW `K(G, 1)`, including the two models here. It also builds its naturality in `G` and the `Deck ≃ π₁ᵐᵒᵖ` conversion (2441–2444). Item 14 ¶2 builds the same equivalence in the other direction, with the same normalisation, uniqueness and naturality.
- **Maps into `Bπ`.** AlgebraicTopology 8.8 proves the case `Y = Bπ` of item 11 itself. Its `c_G` is constructed "through the mapping bijection below" (line 2436), so AlgebraicTopology needs that case.
- **The presentation model.** AlgebraicTopology 8.8c builds the presentation-complex `K(A, 1)` tower for abelian `A`, and items 7–10 build it for every group. The pin builds it as `cellularClassifyingSpace`.

AlgebraicTopology is this roadmap's supplier, so it cannot cite these items here.

**Witness.** Take `G = S₃` and `Z = TauCeti.classifyingSpace S₃` with κ_Z = `classifyingSpaceFundamentalGroupMulEquiv`. AlgebraicTopology lines 2435–2440 produce a pointed homotopy equivalence `Z → Bπ` inducing the identity of `S₃`, unique up to pointed homotopy. Item 14 ¶2 asks for the inverse of the same map, unique up to the same relation.

**Repair.** Give each object one owner, upstream.

1. **Item 14 ¶2.** Consume AlgebraicTopology 8.8b's `c_G` at `Z = TauCeti.classifyingSpace G` and `Z = TauCeti.cellularClassifyingSpace R`, with their pinned identifications. Delete the construction here, and the ownership claims at lines 20–22, 69 and 105–107.
   - Alternative, matching the description: narrow AlgebraicTopology lines 2435–2444 to the bar model's own `π₁` identification. That repair belongs to that folder.
2. **Item 11.** Move the general statement (any aspherical target, which is the same proof) into AlgebraicTopology 8.8, of which `[X,Bπ]_*` is the case `Y = Bπ`, and make item 11 a citation of it. Then the headline `exists_continuousMap_mapOfEq_eq_of_isAspherical` moves to that roadmap's `Suggested.lean`.
3. **Items 7–10 and AlgebraicTopology 8.8c's `n = 1` model.** Cite `TauCeti.PresentationComplex`, `TauCeti.killHomotopyGroups` and `TauCeti.cellularClassifyingSpace` from the pin (R02).

Tested on the `S₃` instance: after the repair there is one map `Z → Bπ`, from 8.8b, and item 14 ¶2 cites it.

## R04 (P2) — The module docstring calls the local-coefficient comparison unstatable, but it elaborates at the pin

**Location.** `TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` lines 31–33: "the comparison with local coefficients (Stage 4 item 17): the pinned local coefficient systems are functors on the fundamental groupoid, and the system attached to a `G`-module through a chosen `π₁(X, x) ≃* G` is itself a construction of the roadmap." Scope item 4 (lines 45–47) makes this comparison part of the completion criterion.

**Claim.** The pin attaches a local system to any representation of `π₁(X, x)`: `TauCeti.LocalCoefficientSystem.ofRepresentation` (`LocalCoefficient/Representation.lean` 80, assuming `[PathConnectedSpace X]`). Composing a `G`-module with a chosen `Ψ` is therefore one term. The headline is statable at the pins and absent.

**Witness.** In my scratch probe, the following elaborates with only a `sorry` warning. It imports `Mathlib` and the Tau Ceti modules `EilenbergMacLane.Basic`, `Cohomology.Twisted.Basic`, `LocalCoefficient.Representation` and `Singular.Twisted.Basic`.

```lean
theorem probeLocalHom (k : Type u) [CommRing k] (G : Type u) [Group G]
    {X : Type u} [TopologicalSpace X] [T2Space X] [Topology.CWComplex (Set.univ : Set X)]
    [PathConnectedSpace X] {x : X} (_hX : IsAspherical X x) (Ψ : FundamentalGroup X x ≃* G)
    (A : Rep k G) (n : ℕ) :
    Nonempty (groupHomology A n ≅ LocalCoefficientSystem.twistedHomology
      (LocalCoefficientSystem.ofRepresentation (X := TopCat.of X) x (A.ρ.comp Ψ.toMonoidHom)) n) :=
  sorry
```

The cohomology analogue also elaborates. Its target is `groupCohomology ((Rep.ihom A).obj (Rep.trivial k G N)) n`, and its source is `(ofRepresentation x (A.ρ.comp Ψ.toMonoidHom)).twistedCohomology k (ModuleCat.of k N) n`.

**Repair.**
1. Add both statements to `Suggested.lean`, under the names `nonempty_twistedHomology_iso_groupHomology` and `nonempty_twistedCohomology_iso_groupCohomology`, with the binders above.
2. Delete the docstring bullet at lines 31–33.
3. In item 17, state the cohomology clause in the pinned form `Hⁿ(X; A, N) ≅ Hⁿ(G, Homₖ(A, N))`, the form of `classifyingSpaceTwistedCohomologyIsoGroupCohomology`. The covariant "groupCohomology of `M`" at line 437 has no carrier at the pin.
4. Add the route inputs to item 17's *Needs:*: `LocalCoefficientSystem.pullback_monodromyRepresentation` (`LocalCoefficient.lean` 395) and `IsQuotientCoveringMap.associatedLocalSystemFiberIso` (`LocalCoefficient/QuotientCovering/Exact.lean` 52), plus an owned target transporting `ofRepresentation` along an isomorphism of representations.

Asphericity cannot be dropped: for `X = S² ∨ S¹`, `G = ℤ` and `A = ℤ` trivial, `H₂` is `ℤ` against `0`.

## R05 (P3) — The first two headlines of `Suggested.lean` follow in one term from the pin

**Location.** `Suggested.lean` lines 50–57 (`exists_cwComplex_isEilenbergMacLaneSpaceOne`) and 59–67 (`exists_cwComplex_dim_le_two_fundamentalGroup_mulEquiv`).

**Claim.** With the pinned `ClassifyingSpace` modules imported, each statement is closed by one anonymous-constructor term made of pinned declarations and instances. Neither is an acceptance test of work left to do.

**Witness.** In my scratch probe both elaborate without error.

- First headline: `⟨classifyingSpace G, inferInstance, inferInstance, inferInstance, classifyingSpaceBasepoint G, isEilenbergMacLaneSpaceOne_classifyingSpace G⟩`.
- Second headline: with `P := Group.Presentation.ofFreeGroupHom (FreeGroup.lift id) _ (FreeGroup.lift id).ker (Subgroup.normalClosure_eq_self _).symm`, the term is `⟨PresentationComplex P.rel, inferInstance, inferInstance, inferInstance, PresentationComplex.basepoint P.rel, inferInstance, fun _ hn ↦ PresentationComplex.isEmpty_cell P.rel hn, ⟨(PresentationComplex.fundamentalGroupMulEquiv P.rel).trans P.presentedGroupEquiv⟩⟩`.

**Repair.**
1. Delete both theorems from `Suggested.lean`.
2. In the module docstring, name `TauCeti.exists_isEilenbergMacLaneSpaceOne`, `TauCeti.exists_isEilenbergMacLaneSpaceOne_cellularClassifyingSpace`, `TauCeti.PresentationComplex.fundamentalGroupMulEquiv` and `TauCeti.PresentationComplex.isEmpty_cell` as theorems of the pin.
3. Remove the two backticked names from README lines 53–54, 246 and 288. The README keeps both statements as citations.

## R06 (P3) — The base point is arbitrary in items 11–12 and their headlines, but the cited proof treats only a 0-cell; item 12 does not say its headline is pointed

**Location.**
- README item 11 (lines 295–306): "with base point `x`". Its route reads "a one-cell goes to a loop representing the image of its class".
- `Suggested.lean` lines 76–84 and 91–97: `(x : X)` and `{x : X} {y : Y}`, with no vertex hypothesis.
- Item 12 (lines 310–314) never says that the headline is pointed (`F.toFun x = y`).

**Claim.** Hatcher's proof of Proposition 1B.9 builds the map with the base point as a 0-cell: first a single 0-cell, then a maximal tree sent to `y₀`. The README route is the same skeletal extension, so it does not cover a base point inside an open cell.

The statements are still true for such a point, because a CW complex is well-pointed at every point. But that step is neither a target, a supplier section nor a pinned declaration here.

Separately, the Lean headline of item 12 is pointed, which is stronger than the pin's `IsAspherical.exists_homotopyEquiv` (a path `γ : Path (e x) y`). The README states only the unpointed CW-type form, so README and Lean differ in generality.

**Witness.** `hatcher-at` line 3912 (the single 0-cell case) and lines 3938–3942 (the maximal tree `T` with `f(T) = y₀`), pp. 90–91. Example: `X = S¹` with one vertex at `1` and base point `x = −1`. The route's first step, a 1-cell sent to a loop at `x`, does not apply.

**Repair.** Choose one:
- add `(_hx : x ∈ Topology.RelCWComplex.skeletonLT (Set.univ : Set X) 1)` to both headlines and "with base point a vertex" to items 11–12;
- or add to item 11's route the well-pointedness of `(X, {x})` for any point of a CW complex, with an owner.

In item 12, add the sentence "for Hausdorff CW complexes the equivalence can be taken pointed, `F(x) = y`, inducing `e`". Tested: with the vertex hypothesis, `S¹` based at `1` and `φ = ·2` give `z ↦ z²`.

## R07 (P3) — Segal's remark on Milnor's join is in §3, not §2

**Location.** README line 152 ("Segal 1968, §2, the remark comparing `BG` with Milnor's join") and line 537 ("Section 2. The simplicial viewpoint on the same construction").

**Claim and witness.** `segal-1968` line 64 opens §2, "Categories and classifying spaces". Line 95 opens §3, "The classifying space of a topological group", on p. 107 (line 94). The comparison with `(G*G*…)/G` and Milnor's universal space is at lines 115–127, inside §3.

**Repair.** Replace "§2" with "§3, p. 107" at line 152, and "Section 2" with "Section 3" at line 537.

## R08 (P3) — Missing locators and Checks, a loose Check, and the README shape

**Location and claim.**
- **No locator** for the theorems of items 4, 5, 6, 10, 14, 15, 17 and 18. Item 17's (co)homology comparison cites nothing; Brown appears only under References.
- **Fewer than three Checks** for these definitions: item 3 (`BG`, `p_G`), item 6 (the induced maps) and item 9 (the tower union) have none; items 14 (`c_G`), 16 (the resolution) and 18 (the chain map) have two each.
- **Item 7's Check `S = ∅`** (line 257) says "a point". With `S = ∅`, `FreeGroup ∅ = {1}`, and `R = {1}` attaches a 2-cell along the constant loop, which gives `S²`. The trivial `π₁` survives; "a point" does not.
- **Shape.** The README does not use the house shape. It has no `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, `## Layer k` with `### k.n` subsections, per-layer `### Examples` and `### Dependencies`, or `## Downstream consumers`.

**Witness.**
- For item 17, Hatcher §2.2, p. 148 and §3.H, pp. 328–329 (`hatcher-at` lines 6471–6479 and 14326–14412) carry the cellular-chain and local-coefficient statements.
- Item 7: `S = ∅` with `R = {1}` gives a sphere.

**Repair.**
1. Apply this to the targets that remain after R02.
2. Give each remaining theorem its locator: Hatcher §2.2, p. 148 and §3.H, p. 328 for item 17; Brown Ch. II §4 and Ch. III §1.
3. Give each remaining definition three Checks.
4. Write "`S = ∅`, `R = ∅`: a point; `R = {1}`: the 2-sphere, also simply connected".
5. Restructure into the house headings. The folder at #1807's head does this.

## R09 (P3) — Item 17 ¶2 asserts the three-model comparison for every coefficient ring, but its supplier gives it over `ℤ` only

**Location.** README line 447: "the composite is the identity on `groupCohomology` for every `A : Rep R G`". `R` is not defined anywhere in this README. `TauCetiRoadmap/AlgebraicTopology/README.md` line 2467 supplies the bar-model comparison "for every `A : Rep ℤ π`".

**Claim.** The composite runs through AlgebraicTopology's bar-model comparison, which exists only for integral coefficients. For any other ring the input has no owner.

**Witness.** Take `R = 𝔽₂` and `G = ℤ/2`. No AlgebraicTopology item identifies `H*(Bπ; A)` with `groupCohomology A` for `A : Rep 𝔽₂ (ℤ/2)`.

**Repair.** Write `A : Rep ℤ G` at line 447. If a general ring is wanted, request "every commutative ring `k`" from AlgebraicTopology 8.8 under `## Exact supplier contracts`.

## R10 (P3) — Two files outside the pull request's folders are edited, and the gate fails

Carried from r28 R08; unchanged.

**Location.** `Completed/ArithmeticDirichletSeries/README.md` line 331 and `TauCetiRoadmap/SymplecticGeometry/README.md` lines 77–79.

**Witness.** The worker's gate at c9c60d0 reads `outside-folder=2 … FAIL` and lists these two files. `git diff origin/main...HEAD` outside the 17 named folders shows exactly these two hunks: "`LFunctions` consumes this package alongside …" and "HeegaardFloer and DGFloer consume the geometric boundary and sign adapters of [CG6]…".

**Repair.** Move both edits to a pull request of their own, or name `Completed/ArithmeticDirichletSeries` and `TauCetiRoadmap/SymplecticGeometry` as this pull request's own folders.

## R11 (P3) — Other open pull requests change this folder with conflicting heads, and the description calls one of them independent

Carried from r28 R07; not repaired.

**Location.** The description's merge-order paragraph: "#1101 → #1807 → this pull request … #1808 is independent of this pull request."

**Claim.**
- **#1808 is not independent here.** It rewrites this folder into a 1,057-line Layer README, and `scratch/overlaps.md` reports that #1808 and #1854 conflict in `TauCetiRoadmap/ClassifyingSpaces/README.md` and `Suggested.lean`.
- **#1187 also conflicts** in `Suggested.lean`, which it re-pins, and nothing orders it against this pull request.
- **#1807 already carries a later revision.** This folder is 113b939, a commit in #1807's history, and #1807's head has the 804-line revision. In the stated order this folder's change is superseded by #1807 and changes nothing.

**Witness.** `roadmaps show ClassifyingSpaces --pr N` gives 304 lines for #1187, 804 for #1807, 1,057 for #1808 and 539 for #1854. `git merge-base --is-ancestor 113b939 HEAD` succeeds.

**Repair.** Say in the description which revision of this folder wins, and in what order relative to #1808 and #1187.

For example: this pull request drops its ClassifyingSpaces changes and keeps only what the AlgebraicTopology ownership move needs, which is R03's citation. #1808 rebases on #1807. `Suggested.lean` is re-elaborated on #1187's pin, or #1187 rebases.

## Previous findings (r28, read at #1808 a3b1e14)

- **R01 (free classes handed to this roadmap): repaired at this head, in the sense that no hand-over exists.** AlgebraicTopology lines 2453–2456 now state "`[X,Bπ]_*≃Hom(π₁X,π)` … the conjugation-orbit description of `[X,Bπ]`. Treat disconnected X componentwise" themselves. The pointed part now has two owners (R03).
- **R02 (connecting maps for a sequence in `A`): not applicable.** That text is absent here. Item 17 (lines 435–441) states cohomology with local coefficients in `M`, covariant in `M`, with long exact sequences in `M`. That statement is true but has no pinned carrier (R04).
- **R03 (the route of 2.3): not applicable.** The text is absent here. Its two pinned inputs return in R04's repair.
- **R04 (`eq_diag_path`, an unused supplier entry): not applicable.** Neither text is present.
- **R05 (Layer 2 locators, p. 90 versus p. 91): partly applicable.** Item 11 cites "Proposition 1B.9, p. 90", which is correct for the statement (`hatcher-at` line 3905, p. 90). Item 17 still has no locator (R08).
- **R06 (dropped ids): not applicable.** This head keeps main's numbering. `scratch/overlaps.md` reports no dropped id. The anchor `#stage-2-the-cellular-model`, cited by FreeGroupsAndLimitGroups, still exists (line 235).
- **R07 (order of the open pull requests): not repaired** (R11).
- **R08 (outside-folder edits): not repaired** (R10). These are the same two hunks.
- **R09 (unfinished sentence, `n` used twice, process wording): not applicable.** The item 5 Check at lines 223–225 is a complete sentence, and item 19 uses `n` once.

## Verified sound

**Gate.**
- The worker's gate at c9c60d0 has every counter at 0 except `outside-folder=2` (R10).
- My own run of `gate … ClassifyingSpaces --base origin/main` has every content counter at 0: `set_option`, `sorry-data`, `imports`, `statement-hygiene`, `readme-ids-missing`, `layer-ids`, `target-ids`, `depcheck`, `stray-files` and `source-material`. It reports `outside-folder=33` because it also counts this pull request's 16 other folders.

**Dependency check**, verbatim: `depcheck: 238 roadmaps, 2429 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. ClassifyingSpaces and its suppliers (AlgebraicTopology, GeometricTopology, ProfiniteCohomology, and UniversalCovers in `Completed/`) are all on main and absent from `ORDER.txt`.

**Elaboration.**
- `lake env lean …/Suggested.lean` exits 0 in 6 s, with six `declaration uses sorry` warnings (lines 54, 62, 76, 91, 104, 114) and nothing else.
- Imports: `Mathlib`, `TauCeti.AlgebraicTopology.EilenbergMacLane.Basic` and `TauCeti.AlgebraicTopology.Cohomology.Basic`, both present at the pin.
- I compared the six elaborated types in `scratch/signatures.md` with the README.
  - Headline 1 has no hypothesis beyond `Group G`.
  - Headline 2 has `PathConnectedSpace`, `IsEmpty (cell univ n)` for `2 < n`, and `Nonempty (π₁ ≃* G)`.
  - Headline 3 has `[T2Space X] [CWComplex univ] [PathConnectedSpace X]`, `IsAspherical Y y`, and `X`, `Y` in independent universes.
  - Headline 4 has both `T2Space`, both `CWComplex`, both `IsAspherical`, and is pointed (R06).
  - Headlines 5 and 6 have `k`, `G` and `X` in one universe and `IsEilenbergMacLaneSpaceOne G X x`.
- No binder is lost, and the README matches except as noted in R06.

**Padding probe.**
- A scratch copy with each `sorry` replaced by `first | simp | rfl | infer_instance | aesop` fails on all six: unsolved goals at the first three, "aesop made no progress" at the last three.
- With the pinned `ClassifyingSpace` modules imported, headlines 1 and 2 close by one term (R05).
- Headlines 5 and 6 close by one term only at `X = classifyingSpace G`: `⟨(classifyingSpaceSingularHomologyIsoGroupHomology k G n).symm⟩` and `⟨(classifyingSpaceSingularCohomologyIsoGroupCohomology k G k n).symm⟩` both elaborate. They are kept because the general `X` needs transport along `IsEilenbergMacLaneSpaceOne.nonempty_homotopyEquiv`.
- Headline 4 is kept because the pin's `hX.exists_homotopyEquiv hY e` elaborates but is unpointed.

**Pinned declarations opened.** I opened every name in R02 at the file and line given, 71 names across 23 files. Of these, 26 were also elaborated by `#check` or by a term in my probes, among them:
- `IsAspherical.exists_homotopyEquiv` and `CWType`;
- `exists_mapOfEq_cellularClassifyingSpace` and `homotopicRel_singleton_of_mapOfEq_eq_of_cwComplex`;
- `IsEilenbergMacLaneSpaceOne.nonempty_homotopyEquiv`;
- `TauCeti.Deck.IsQuotientCoveringMap.deckMulEquiv` and `TauCeti.SemilocallySimplyConnectedSpace.of_isCoveringMap`;
- `Topology.IsQuotientMap.locallyPathConnectedSpace`;
- `classifyingSpaceFundamentalGroupMulEquiv_apply_eq_iff`;
- `TauCeti.UniversalCover.deckFundamentalGroupEquiv` (`UniversalCover/Deck/FundamentalGroup/UniversalCover.lean` 105, under `LocallyPathConnectedSpace`, `PathConnectedSpace` and `SemilocallySimplyConnectedSpace`);
- `LocalCoefficientSystem.ofRepresentation`, `PresentationComplex.isEmpty_cell` and `Group.Presentation.ofFreeGroupHom`.

The definitions `IsAspherical` (`EilenbergMacLane/Basic.lean` 59: path-connected, with `π_{n+2}` subsingleton) and `IsEilenbergMacLaneSpaceOne` (123: `IsAspherical ∧ Nonempty (π₁ ≃* G)`) include path-connectedness, so headlines 4–6 need no separate `PathConnectedSpace`.

Mathlib at the pin:
- `IsQuotientCoveringMap` (`Topology/Covering/Quotient.lean` 39);
- `classifyingSpaceUniversalCover`, `Rep.standardComplex` and `Rep.standardResolution` (`RepresentationTheory/Homological/Resolution.lean` 86, 168, 321);
- `ProjectiveResolution.homotopyEquiv` (`CategoryTheory/Abelian/Projective/Resolution.lean` 180);
- `FundamentalGroup.mul_def`, `p * q = .of (q.asHom.trans p.asHom)`, so `q` runs first, as item 5 says (`FundamentalGroup.lean` 44);
- `FundamentalGroup.mapOfEq` (85), `IsCoveringMap.liftPath` (`Topology/Homotopy/Lifting.lean` 258) and `AlgebraicTopology.singularHomologyFunctor` (`SingularHomology/Basic.lean` 52).

**Cross-roadmap citations resolved.**
- **UniversalCovers** (`Completed/`): item 5 (`Deck ≃* π₁ᵐᵒᵖ`, line 91), item 6 (the lifting criterion with `[PathConnectedSpace A] [LocPathConnectedSpace A]`, which disks satisfy, line 100) and items 11–14 (lines 141–151).
- **GeometricTopology Layer 11** (line 831, same as main): realization, restriction, compact factorisation, realized cones, `|K|` as a CW complex with ordered simplicial cellular chains.
- **AlgebraicTopology at this head:**
  - Stage 1 item 4 (presentation corollaries, line 500) and Stage 2 item 6 (local coefficient systems, line 586);
  - Stage 4 items 1–3 (lines 690–700), 4.5 (cell attachment and the tower union, lines 821–880), 4.7 (realization CW, line 1064) and 4.8 (CW approximation, line 1091);
  - Stage 8 items 3 (Hurewicz, line 2258) and 5 (Whitehead, line 2296), 8.8a (nerve model, line 2422) and 8.8c (killing construction, lines 2517–2519).
- **ProfiniteCohomology** exists.
- The worker's `roadmaps resolve` found nothing unresolved.

**Overlap facts** (`scratch/overlaps.md`, each checked):
1. Open pull requests changing this folder: #1187, #1807 and #1808 (R11).
2. Ids this README cites that an open pull request drops: none.
3. Ids that only an open revision defines: none.
4. Ids this pull request drops: none. The numbering is main's.
5. Closest in vocabulary: AlgebraicTopology at #1797, #1808, #1652, #1663 and #1807. These revise that roadmap; I compared against this pull request's own AlgebraicTopology folder (R03).

**Ownership.**
- `roadmaps grep -i 'countable join'` finds only GeometricTopology line 896 (a consumer note) and an unrelated VonNeumannAlgebras line.
- `namespace TauCetiRoadmap.ClassifyingSpaces` occurs only in copies of this folder (main, #1187, #1807, #1808, #1854).
- No other roadmap owns Milnor's model. The nerve model is AlgebraicTopology's (R03).

**Sources and the seeded sample "Both models are wanted"** (README lines 14–22). The paragraph carries no locator. I checked each of its claims against the texts:
- Milnor's countable join, with no presentation needed: `segal-1968` lines 115–127 (§3, p. 107). Milnor 1956 is uncertified.
- The cellular model: Hatcher Corollary 1.28, p. 52 (`hatcher-at` line 2353), and Example 4.16, p. 354 (line 15407), which attaches cells to kill `πᵢ` for `i > n` on a connected CW complex.
- The comparison making "the" classifying space well defined: Theorem 1B.8, p. 90 (line 3897), for CW complexes. Scope item 2's CW-type hypothesis on both spaces is consistent with it.
- The nerve model is AlgebraicTopology's: line 2422.
- The last sentence ("is also a theorem of this roadmap") is contradicted by AlgebraicTopology lines 2435–2440 (R03).
- "Building both and proving they agree is not duplication" is contradicted by the pin (R02).
- Other locators, by printed page: Example 1B.7, p. 89 (line 3844, the ordered-tuple nerve model with a free action that permutes simplices, as item 3 says); Proposition 1B.9, p. 90 (line 3905); Proposition A.1, p. 520 (line 22534, compact sets lie in finite subcomplexes).

**Adversarial table.**

| Statement | Instances tried | Values computed (README side / other side) | Result | Change |
| --- | --- | --- | --- | --- |
| Headline 1, existence of a CW `K(G,1)` | `G = 1`; `G = ℤ`; `G = ℚ` (no finite presentation) | a point; `S¹` with cells (1, 1); Milnor model; the pin term of R05 elaborates | true; one term from the pin | R05 |
| Headline 2, dimension ≤ 2 | `G = ℤ/2`; `G = 1` tautological; a wrong bound ≤ 1 | `ℝP²` with cells (1, 1, 1), `π₁ = ℤ/2`; relator `x·x·x⁻¹ = x` gives a disk; a 1-complex has free `π₁` ≠ `ℤ/2` | true, and the bound is sharp | R05 |
| Headline 3, maps into an aspherical space | `X = Y = S¹`, `φ = ·2`; `X = Y = S²`, id and const; `X` a point | `z ↦ z²` sends `1 ↦ 2`; both trivial on `π₁ = 1`, degrees 1 and 0, not homotopic; unique constant map | true; asphericity needed and assumed | none |
| Headline 3, base point not a vertex | `S¹` with vertex `1`, `x = −1` | true by well-pointedness; the route's first step needs a 0-cell (`hatcher-at` 3912, 3938–3942) | route gap | R06 |
| Headline 4, pointed uniqueness | `X = Y = S¹`, `e = −1`; point and Warsaw circle | `F = z ↦ z̄`, `F(1) = 1`, `F_* = −1`; the Warsaw circle has trivial `πₙ`, is not contractible, and is excluded by `[CWComplex univ]` | true; stronger than the pin (path `γ`) | R06 (README wording) |
| Headline 5, homology | `S¹`, `G = ℤ`, `k = ℤ`; `ℝP^∞`, `ℤ/2`, `k = ℤ` and `k = 𝔽₂`; `k = 0` | `H₀ = ℤ`, `H₁ = ℤ`, `H₂ = 0` on both sides; `H₁ = ℤ/2`, `H₂ = 0` on both; `𝔽₂` in every degree on both; 0 = 0 | true | none |
| Headline 5, negative control | `X = S² ∨ S¹`, `G = ℤ` | `H₂(X) = ℤ` against `H₂(ℤ; ℤ) = 0` | hypothesis needed, and present | none |
| Headline 6, cohomology | `S¹`, `k = ℤ`; `ℝP^∞`, `k = ℤ` | `H⁰ = ℤ`, `H¹ = ℤ` on both sides; `H¹ = 0`, `H² = ℤ/2` on both | true | none |
| Local-coefficient comparison | Probe2 statement; `X = S¹`, `A = k` with generator acting by a unit `u ≠ 1`, `k` a field | elaborates at the pin; `H₀ = k/(u−1) = 0`, `H₁ = ker(u−1) = 0` on both sides | statable and absent | R04 |
| Item 5, direction of `π₁ ≃* G` | `S₃`, `s = (12)`, `t = (23)` | `st = (123)`, `ts = (132)`; `m(ℓ_s ℓ_t) = ts`; `γ ↦ m(γ)⁻¹` gives `st`, the product; the pin gives `γ ↦ g` iff the end vertex is `⟨0, g⁻¹⟩` | same convention as the pin | none |
| Item 5, sign Check | `G = ℤ`, lift ends at `(0, 1)` | `m = 1`, image `−1` | Check true | none |
| Item 1 Checks | trivial group; `ℤ/2`; empty family | infinite simplex; `{(0,0),(0,1)}` is not a face and `{(0,0),(1,1)}` is; empty realization | true | none |
| Item 2 hypothesis | `A 0 = {a, b}`, every other `A i` empty | the realization is two points, not path-connected | "infinitely many nonempty" needed | none |
| Item 7 Checks | `R = ∅`; `S = {a}`, `R = {aⁿ}`; `S = ∅`, `R = {1}` | `FreeGroup S`; `ℤ/n`, a disk for `n = 1`; `S²`, not a point | last Check loose | R08 |
| Item 13, rank Check | `G = 1`, degree 0 | Check: rank 1; actual: `|ℕ|` vertices; item 18 Check: `ℤ^(ℕ)` | false | R01 |
| Item 13, circle Check | `ℤ` acting on `ℝ` over the one-vertex `S¹` | `∂(1-cell) = t − 1` in `ℤ[ℤ]` | true | none |
| Item 13, negative control | `ℤ` acting on `ℝ²∖0` by `(2x, y/2)` | free; `(1, 2⁻ⁿ) → (1, 0)` while `g⁻ⁿ·(1, 2⁻ⁿ) = (2⁻ⁿ, 1) → (0, 1)`: two orbits that cannot be separated | Check true | none |
| Item 16 Check | `G = ℤ` | `ℤ[t^±] →(t−1) ℤ[t^±] →ε ℤ`: the kernel of `t − 1` is 0 and its image is `ker ε` | exact | none |
| Item 18 Checks | `G = 1`, degree 0; face `j` | `ℤ^(ℕ)` against `ℤ`, not an isomorphism; face `j` goes to `(g₀, …, ĝⱼ, …, gₙ)` | true | none |
| Item 19 | `G = S₃`; `ℤ/n` | `H₁ = S₃ᵃᵇ = ℤ/2`; `H₂(ℤ/n; ℤ) = 0`, pinned in `FiniteCyclic.lean` 118 | true; already at the pin | R02 |
| Item 14 Checks | `ℤ/2`; `S₃` | `g⁻¹ = g`, so inversion is invisible; on `S₃`, `γ ↦ m(γ)` is not a homomorphism | true | R03 (ownership) |
| Item 14 ¶2 against AlgebraicTopology 8.8b | `Z = classifyingSpace S₃` | AlgebraicTopology builds `c_G : Z → Bπ` (identity on `S₃`, unique up to pointed homotopy); item 14 builds its inverse | two owners | R03 |
| Item 17 ¶2 coefficients | `R = 𝔽₂`, `G = ℤ/2` | AlgebraicTopology supplies only `Rep ℤ π` (line 2467) | input missing | R09 |
| Scope item 1, cellular standing hypotheses | tautological presentation | README: promised, no item supplies it; pin: `exists_isEilenbergMacLaneSpaceOne_cellularClassifyingSpace` concludes both | overclaim, supplied by the pin | R02 |

## Not verifiable

- Milnor, "Construction of universal bundles, II" (1956): settled as uncertified, so cited by locator only. I read `segal-1968` §3 lines 115–127 instead.
- Brown, *Cohomology of Groups*, §I.4 and Chapters I–III: settled as uncertified (items 13 and 16).
- tom Dieck, *Transformation Groups*, §II.1: settled as uncertified (item 13).
- Schwamberger–Vogt, "Dold spaces in homotopy theory", §2: settled as uncertified. The Warsaw-circle claim is standard; the locator into the paper is not confirmed.

## Source issues

- **Gap** in hatcher-at at Proposition 1B.9, printed pp. 90–91: the statement allows any base point `x₀` of the CW complex, but the proof treats only a base point that is a 0-cell (one 0-cell, then a maximal tree sent to `y₀`); it should require `x₀` to be a 0-cell or add the well-pointedness of `(X, {x₀})`; affects the proof.
