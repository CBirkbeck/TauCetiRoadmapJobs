# Review of ClassifyingSpaces (pull request #1808 at 60a92ec)

**Verdict:** needs changes

Full review: the folder changed by 1418 lines since 925dc8b. The README (810 lines) is now in the house form. It consumes the pinned `TauCeti/AlgebraicTopology/ClassifyingSpace/` directory by name and owns two layers: maps into aspherical spaces with pointed uniqueness, and the (co)homology of an arbitrary CW `K(G, 1)`. `Suggested.lean` (144 lines) states four headlines with no definitions. Two findings are blocking (P2): an ownership clash with AlgebraicTopology, and a cohomology clause that is missing a hypothesis. Seven are P3. The gate fails only on `outside-folder=2`.

## R01 (P2) — The classification of pointed maps into a `K(π, 1)` has two owners in this pull request

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` lines 79–82 ("The classification of pointed maps from a connected pointed CW complex into a `K(π, 1)` … is owned here, not in the algebraic-topology roadmap") and 782–784. `TauCetiRoadmap/AlgebraicTopology/README.md` at this head, lines 2065–2067: "For each connected pointed CW complex X prove `[X,Bπ]_*≃Hom(π₁X,π)`".

**Claim.** Both folders of this pull request plan the same theorem. Items 1.1–1.2 here, with the aspherical target `Bπ`, are exactly AlgebraicTopology's statement. AlgebraicTopology on main plans it too (main line 1850). This README says AlgebraicTopology does not own it, but the AlgebraicTopology README in the same pull request still does.

**Witness.** AlgebraicTopology README line 2066 at 60a92ec, and the identical sentence at main line 1850. Neither line cites ClassifyingSpaces.

**Repair.** Keep one owner. ClassifyingSpaces consumes nothing from AlgebraicTopology, and AlgebraicTopology 8.8b consumes ClassifyingSpaces Layer 1, so keeping the theorem here preserves the supply direction. In `TauCetiRoadmap/AlgebraicTopology/README.md` lines 2065–2067, replace "prove `[X,Bπ]_*≃Hom(π₁X,π)`" with a citation of ClassifyingSpaces Layer 1 items 1.1–1.2 applied to the target `Bπ`, which is aspherical by 8.8a. Base `X` at a vertex, as `exists_continuousMap_mapOfEq_eq_of_isAspherical` requires. AlgebraicTopology keeps only what is not stated here: the conjugation-orbit description of free classes and the disconnected case. Tested: AlgebraicTopology's nerve model is a Hausdorff CW `K(π, 1)` in the universe of `π` (8.8a, Stage 4.7 CW structure). With a vertex base point it meets every binder of the Layer 1 headline.

## R02 (P2) — Item 2.3 claims connecting maps for a short exact sequence of representations in cohomology, where none exists without a hypothesis

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` lines 722–725: "The isomorphisms are natural in `A` and carry the connecting maps of a short exact sequence of representations to `groupHomology.δ` and `groupCohomology.δ`".

**Claim.** The cohomological coefficient is `Homₖ(A, N)`, and `Homₖ(−, N)` is not exact. So a short exact sequence `0 → A₁ → A₂ → A₃ → 0` gives no short exact sequence of the `Homₖ(Aᵢ, N)`. Mathlib's `groupCohomology.δ` needs `ShortExact` and so has no input, and twisted cohomology with values in `N` has no long exact sequence in `A`. The pin's cohomology connecting map is the Bockstein for a sequence `0 → N₁ → N₂ → N₃ → 0` in the values, and it assumes `[Module.Projective k A]`: `TauCeti.twistedCohomologyBockstein_comp_classifyingSpaceTwistedCohomologyIsoGroupCohomology_hom` (`ClassifyingSpace/LocalCoefficients.lean` 331).

**Witness.** Take `k = ℤ`, `G = 1`, `X` a point, `N = ℤ` and `0 → ℤ →(·2) ℤ → ℤ/2 → 0`. Then `Homℤ(−, ℤ)` gives `0 → 0 → ℤ →(·2) ℤ → 0`, whose cokernel is `ℤ/2`, so it is not exact. On the space, the `H⁰` row reads `0, ℤ, ℤ` with `H¹ = 0`, again not exact.

**Repair.** Restate the cohomology half. It is natural in `A`, contravariantly (`TauCeti.classifyingSpaceTwistedCohomologyIsoGroupCohomology_hom_naturality_left`, line 281), and in `N` (`…_hom_naturality_right`, line 301). For `A` projective over `k`, it carries the Bockstein of a short exact sequence in `N` to `groupCohomology.δ` of `0 → Homₖ(A, N₁) → Homₖ(A, N₂) → Homₖ(A, N₃) → 0` (line 331). Alternatively, keep a sequence in `A` and add the hypothesis that it splits over `k`. Tested on the instance: with `A = k = ℤ` projective and the sequence in `N`, `Homℤ(ℤ, Nᵢ) = Nᵢ` is exact.

## R03 (P3) — The route of 2.3 leaves two pinned facts unnamed and needs a transport that the pin lacks; Scope item 3 promises a naturality that 2.3 does not state

**Location.** README lines 709–716 ("so the pullback has monodromy `A ∘ Ψ`, and `TauCeti.LocalCoefficientSystem.ofRepresentationMonodromyIso` identifies it with `L_A`"), the *Needs:* line 730–739, and Scope item 3, lines 53–57.

**Claim.** `ofRepresentationMonodromyIso L` is `ofRepresentation x (L.monodromyRepresentation x) ≅ L`. Its fibre is `L_x = (A ⊗ k[p_G⁻¹ b₀])_G`, not `A`. Reaching `L_A = ofRepresentation x (A ∘ Ψ)` takes three steps:

- (i) The pullback monodromy formula. It is pinned as `TauCeti.LocalCoefficientSystem.pullback_monodromyRepresentation` (`LocalCoefficient.lean` 395) but not named.
- (ii) The fibre identification. It is pinned as `IsQuotientCoveringMap.associatedLocalSystemFiberIso` (`LocalCoefficient/QuotientCovering/Exact.lean` 52) but not named.
- (iii) An isomorphism `ofRepresentation x ρ ≅ ofRepresentation x ρ'` induced by an isomorphism of representations. The pin does not have it: `LocalCoefficient/Representation.lean` declares only `ofRepresentation` (80), `ofRepresentation_obj`, `ofRepresentation_map_apply`, `monodromyRepresentation_ofRepresentation` (111) and `ofRepresentationMonodromyIso` (122).

Separately, Scope item 3 promises naturality "in `(X, Ψ)` along pointed maps" for all three items, but 2.3 states naturality only in `A`.

**Witness.** The pinned declarations and lines above. `grep -rn ofRepresentation` over the pinned Tau Ceti finds no transport along an isomorphism of representations.

**Repair.** Name (i) and (ii) in the route and in *Needs:*. Add to 2.3 an API bullet, owned by this item: "an isomorphism of representations `ρ ≅ ρ'` of `π₁(X, x)` induces `ofRepresentation x ρ ≅ ofRepresentation x ρ'`". Then either add the `(X, Ψ)`-naturality of 2.3 with its route, or narrow Scope item 3 to say naturality in `(X, Ψ)` for 2.1–2.2 and naturality in the coefficients for 2.3.

## R04 (P3) — The route of 1.2 uses an unnamed Mathlib lemma, and the supplier list names a declaration no target uses

**Location.** README lines 526–529 ("unwinding the definition of `g'` on `σ_a` and `σ_b` this is the statement that `f ∘ γ` and `g' ∘ γ` are homotopic relative to the end points"), the *Needs:* line 531–535, and line 365 ("each named at the target that uses it") with line 385.

**Claim.** Comparing `g' ∘ σ_a` with `f ∘ σ_a` needs the naturality square of a homotopy on path classes, because `σ_a` is a path from `x` to a different vertex `a`. That square is Mathlib's `ContinuousMap.Homotopy.eq_diag_path` (`Mathlib/AlgebraicTopology/FundamentalGroupoid/InducedMaps.lean` 256). The lemma that *Needs:* does name, `ContinuousMap.Homotopy.fundamentalGroupMulEquivOfPath_evalAt_map`, concerns loops at a single point. Separately, `ContinuousMap.Homotopy.exists_path_fundamentalGroupMulEquivOfPath_map_comp` (line 385) appears in no route.

**Witness.** The two declarations at the pins.

**Repair.** Name `ContinuousMap.Homotopy.eq_diag_path` in the route of 1.2 and in its *Needs:* line. Delete the line 385 entry, or name it at the target that uses it.

## R05 (P3) — The claims of Layer 2 carry no locator, and a Hatcher page is off by one

**Location.** README items 2.1–2.3 (lines 618–739), where Brown appears only under References (802–804). Line 113: "Proposition 1B.9 (p. 90, where the base point is a `0`-cell of the maximal tree)".

**Claim.** None of 2.1, 2.2 or 2.3 cites a source at its claim. The maximal-tree step of Hatcher's proof is on p. 91, not p. 90.

**Witness.** `hatcher-at` lines 3912–3914 (p. 90, the single-0-cell case) and lines 3938–3942 (p. 91, page header at line 3924: the maximal tree `T` with `f(T) = y₀`). `hatcher-at` lines 14326–14370 (§3.H, p. 328) define `Hₙ(X; M)` as the homology of `Cₙ(X̃) ⊗_π M`. `hatcher-at` lines 6471–6479 (p. 148) define `Hₙ(G)` as `Hₙ(K(G, 1))`.

**Repair.**
- 2.1: cite Hatcher §2.2, p. 148, and Brown, Ch. II §4, by locator.
- 2.3: cite Hatcher §3.H, p. 328 (local coefficients via `ℤ[π]`-modules) and Example 3H.1, p. 329 (a trivial module gives ordinary (co)homology, used in the third bullet), together with Brown Ch. III §1.
- 2.2: cite the same sources as 2.1, for cohomology.
- Line 113: write "pp. 90–91".

## R06 (P3) — Ids this pull request drops are cited by other roadmaps, and the README gives no old → new numbering

**Location.** The README replaces main's Stage 1–4 / item 1–19 numbering with Layers 1–2. No line maps the old ids.

**Claim.** These citations break when this pull request merges:

- FreeGroupsAndLimitGroups, on main and at this head: lines 29, 40, 2413, 2554 and 2771, "ClassifyingSpaces, Stage 2 item 7", with anchor `#stage-2-the-cellular-model`.
- AlgebraicTopology at this head: lines 97, 2046, 2049, 2062 and 2412, "CS Stage3 items11–15 and Stage4 items16–18". Its lines 93–96 also say ClassifyingSpaces "owns Milnor and presentation models … and the cellular/bar projective-resolution comparisons", which is not true at this head.
- Open heads:
  - ArithmeticLocallySymmetricSpaces lines 515, 516, 2011, 2029, 2065, 2073, 2347 and 2371 (Stage 3 item 13; Stage 4 items 16–18).
  - TangentialBordism lines 253, 2544 and 2868 (Stage 4).
  - StableHomotopyKTheory lines 473 and 504 (Stages 1.5–1.6, 3.11–3.15, 4.16–4.19).
  - ArithmeticKTheory lines 1087 and 1618 (Stage 3).

**Witness.** `roadmaps grep ClassifyingSpaces` at the listed heads; `scratch/overlaps.md`, "Ids of ClassifyingSpaces that this pull request drops".

**Repair.** Add one line per moved id under *Scope and ownership*:

- Stage 1 items 1–6 → *From Tau Ceti*, "Milnor's model", "Its fundamental group", "Functoriality".
- Stage 2 item 7 → `TauCeti.PresentationComplex` with `TauCeti.PresentationComplex.fundamentalGroupMulEquiv`.
- Items 8–10 → `TauCeti.killHomotopyGroups`, `TauCeti.cellularClassifyingSpace`, `TauCeti.exists_isEilenbergMacLaneSpaceOne_cellularClassifyingSpace`.
- Item 11 → Layer 1 items 1.1–1.2. For the cellular source these are pinned: `TauCeti.exists_mapOfEq_cellularClassifyingSpace`, `TauCeti.homotopicRel_of_mapOfEq_eq_cellularClassifyingSpace`.
- Item 12 → `TauCeti.IsAspherical.exists_homotopyEquiv` and Layer 1 item 1.3.
- Item 13 → `TauCeti.cwComplexPreimage`, `IsQuotientCoveringMap.cwComplexQuotient`.
- Item 14 → `TauCeti.cellularHomotopyEquivClassifyingSpace`.
- Item 15 → `TauCeti.classifyingSpaceHomotopyFunctor`.
- Items 16 and 18 → `TauCeti.universalGSpaceResolution`, `TauCeti.cellularResolutionOfIsAspherical`, `TauCeti.universalGSpaceStandardHomotopyEquiv`.
- Item 17 → the pinned (co)homology comparisons for Milnor's model, and Layer 2.
- Item 19 → the pinned examples.

In AlgebraicTopology, a folder of this pull request, repoint lines 93–100, 2045–2062 and 2412 to these names and to Layer 1 items 1.1–1.3.

## R07 (P3) — Two open pull requests change this folder with conflicting heads, and no order is stated

**Location.** The pull request's merge-order paragraph: "#1101 (ModularCurves) → #1807 (the other loops) → **this pull request**".

**Claim.** Two other open pull requests change this folder and conflict with this head (`scratch/overlaps.md`):

- #1854, by the same author, rewrites the ClassifyingSpaces README into the Stage form (539 lines, `## Inventory: what Mathlib and Tau Ceti already give`) and `Suggested.lean` (122 lines, whose docstring calls the pinned models "not statable").
- #1187 changes `TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` as part of a Tau Ceti pin bump.

Neither is ordered against this pull request. #1807 is ordered, and its head differs from this one only in the circle Check at lines 177–187.

**Witness.** `roadmaps show ClassifyingSpaces --pr 1854` and `--pr 1187`; the overlap listing.

**Repair.** State the order in the description. For example: #1854 drops its ClassifyingSpaces changes and rebases on this pull request; this folder's `Suggested.lean` is re-elaborated on #1187's pin, or #1187 rebases on this one.

## R08 (P3) — Two files outside the pull request's folders are edited

**Location.** `Completed/ArithmeticDirichletSeries/README.md` ("`LFunctions` consumes this package and supplies its own character-specific continuation") and `TauCetiRoadmap/SymplecticGeometry/README.md` ("boundary and sign adapters consumed by HeegaardFloer and consumed by DGFloer").

**Claim.** This is unchanged since the previous review (its R07). The gate fails on it.

**Witness.** The worker's gate at 60a92ec: `outside-folder=2 … FAIL`. Commits `e591d103` and `61e5385e`.

**Repair.** Move the two one-line edits to a pull request of their own, or name the two folders as this pull request's own. The SymplecticGeometry line also repeats "consumed by"; it should read "consumed by HeegaardFloer and DGFloer".

## R09 (P3) — An unfinished sentence, a symbol used for two things in one Check, and process wording in the Summary

**Location.**
- Lines 159–162: "sends the counterclockwise loop to `1`, so the map wrapping the circle around a loop `γ` with `m(γ) = −1`." The sentence has no main verb.
- Lines 656–659: "`G = ℤ/n`, `k = ℤ`, `n = 2`: both sides are zero …, and in degree one both sides are `ℤ/n`". Here `n` is both the order and the degree.
- Lines 10, 20 and 22: "already builds", "none of it is planned again", "What remains".

**Claim.** The first two impair the Checks; the third is process narrative, and library status belongs in *Scope and ownership*.

**Witness.** The pinned identification sends `γ` to `m(γ)⁻¹` (`ClassifyingSpace/EilenbergMacLane.lean` 77), and the circle loop goes to `1` (`ClassifyingSpace/Circle.lean` 79). So the intended clause is "`TauCeti.circleToClassifyingSpace` wraps the circle around a loop `γ` with `m(γ) = −1`".

**Repair.**
- Complete the sentence as above.
- Write the Check as "`G = ℤ/m`, `m ≥ 2`, `k = ℤ`: in degree two both sides are zero …, in degree one both are `ℤ/m`".
- Move the library-status sentences of lines 10–22 into *Scope and ownership* in timeless form ("Tau Ceti provides …").

## Previous findings

- R01 (sorry'd data): repaired. `Suggested.lean` declares four theorems and no `def`, `abbrev`, `instance` or `opaque`; the gate reports `sorry-data=0`.
- R02 (module-system build): repaired. Line 1 is `module`, the imports are `public import`, and the gate reports `build=0`. My `lake env lean` exits 0 with four `declaration uses sorry` warnings and nothing else.
- R03 (re-planning the pin): repaired. README lines 10–20 and 219–363 consume the pinned directory file by file. Layers 1–2 keep only the general-source targets the pin lacks.
- R04 (AlgebraicTopology ↔ ClassifyingSpaces cycle): repaired on this folder. Line 82 reads "This roadmap consumes nothing from the algebraic-topology roadmap", the Dependencies sections (608–610, 770–771) say "No other roadmap", and the dependency check reports no problem. AlgebraicTopology's stale citations of the old ids are R06 here.
- R05 (killing tower with three owners): repaired on this folder. The tower is cited from the pin (lines 276–287) and not owned here. AlgebraicTopology at this head still says "likewise own the general higher-cell killing construction" (line 2123); that is left to that folder's review.
- R06 (standing hypotheses of the cellular model): repaired. Lines 308–311 cite `TauCeti.instSemilocallySimplyConnectedSpaceCellularClassifyingSpace`, `TauCeti.instDeltaGeneratedSpaceOfCWComplexUniv` and `TauCeti.exists_isEilenbergMacLaneSpaceOne_cellularClassifyingSpace`.
- R07 (outside-folder edits): not repaired; R08 here.
- R08 (house shape, Checks, locators, direction of `π₁(BG) ≅ G`): mostly repaired.
  - Repaired: the house headings, Checks on every definition, the direction stated with an `S₃` and a `ℤ` witness (lines 137–164), Hatcher locators at Layer 1, and the `Suggested.lean` docstring form.
  - Still open: Layer 2 locators (R05) and process wording at lines 10–22 (R09).

## Verified sound

**Gate and dependency check.**
- The worker's gate at 60a92ec has every counter at 0 except `outside-folder=2` (R08); `build=0`.
- My own run of the gate on the worktree has every content counter at 0 and `outside-folder=23`. That count includes this pull request's own folders, which the worker's run excludes.
- Dependency check, verbatim: `depcheck: 243 roadmaps, 2456 edges, 0 problem(s)`. There is no UPWARD or CYCLE line. ClassifyingSpaces is on main and not in `ORDER.txt`.
- The README has no `*Needs:*` citation of any roadmap. Its only roadmap links are to UniversalCovers (Completed), AlgebraicTopology and CharacteristicClasses (as consumers), and ProfiniteCohomology (a scope boundary).

**Elaboration and signatures.**
- `lake env lean` on `Suggested.lean` exits 0 in 3.6 s, with four `declaration uses sorry` warnings and nothing else.
- In a scratch file importing the module, `#check @` of all four declarations gives types identical to `scratch/signatures.md`. Each keeps `T2Space`, `Topology.CWComplex Set.univ`, the vertex hypothesis and the asphericity it needs. The two Layer 2 headlines keep `[PathConnectedSpace X]`, which `ofRepresentation` requires as an instance (`LocalCoefficient/Representation.lean` 80). No binder is lost, and each type matches its README statement (1.1–1.2, 1.3, 2.3, 2.3).
- Imports: `import Mathlib` plus four `TauCeti.*` modules, all present at the pin.

**Padding probe.** I ran `first | simp | rfl | infer_instance | exact ⟨_, rfl, fun _ => rfl⟩ | aesop` on a scratch copy. All four headlines fail: three end in unsolved goals and `aesop` makes no progress on the fourth. Grepping the pin finds none of them as a theorem:
- the cellular source only: `exists_mapOfEq_cellularClassifyingSpace`, `Cellular.lean` 174;
- a single `0`-cell only: `homotopicRel_singleton_of_mapOfEq_eq_of_cwComplex`, `EilenbergMacLane/Homotopic.lean` 220;
- the unpointed form: `IsAspherical.exists_homotopyEquiv`, `Uniqueness.lean` 73;
- the covering-space form, whose application to the universal cover of `X` would need a semilocal simple connectivity of CW complexes that the pin lacks: `IsQuotientCoveringMap.twistedHomologyIsoGroupHomology`, `Singular/Twisted/GroupHomology.lean` 376.

**Names cited by the README.** I checked 184 of them with `#check` at the pin; 181 resolve and the three below I located by `grep`.
- `TauCeti.UniversalCover.deckFundamentalGroupEquiv` and `TauCeti.UniversalCover.deckFundamentalGroupEquiv_symm_op` are in `UniversalCover/Deck/FundamentalGroup/UniversalCover.lean` 105 and 115; that module has no build output.
- `TauCeti.twistedHomologyδ_comp_classifyingSpaceTwistedHomologyIsoGroupHomology_hom` is in `ClassifyingSpace/LocalCoefficients.lean` 247.

**Pinned declarations opened.** Under `TauCeti/AlgebraicTopology/` unless stated:
- `IsAspherical` (`EilenbergMacLane/Basic.lean` 59, path-connected and `π_{n+2}` trivial).
- `IsEilenbergMacLaneSpaceOne` (123, asphericity and a nonempty `π₁ ≃* G`).
- `homotopicRel_skeletonLT_one_of_forall_homotopicRel` (`EilenbergMacLane/Homotopic.lean` 138).
- `isWeakHomotopyEquivalence_iff` (`EilenbergMacLane/WeakHomotopyEquivalence.lean` 49).
- `isEilenbergMacLaneSpaceOne_killHomotopyGroups` (`Homotopy/KillHomotopyGroups.lean` 320). The tower attaches cells along every generalized loop (docstring, lines 12–16), which supports the claim of further free terms in dimensions at least three at README 185–187.
- `exists_comp_homotopic` (`Homotopy/Whitehead.lean` 203).
- `hasHomotopyExtensionProperty_skeletonLT` (`TauCeti/Topology/Homotopy/Extension/CWComplex.lean` 128).
- `zeroSkeletonDiscreteTopology` (`TauCeti/Topology/CWComplex/Classical/Zero.lean` 59).
- `CWType.of_cwComplex_univ` (`TauCeti/Topology/CWComplex/Classical/CWType.lean` 72).
- `exists_isEilenbergMacLaneSpaceOne_cellularClassifyingSpace` (`ClassifyingSpace/Comparison.lean` 287).
- `IsEilenbergMacLaneSpaceOne.nonempty_homotopyEquiv` (`Uniqueness.lean` 94).
- `classifyingSpaceFundamentalGroupMulEquiv_apply_eq_iff` (`EilenbergMacLane.lean` 77).
- `classifyingSpaceFundamentalGroupMulEquiv_mapOfEq_circleToClassifyingSpace` (`Circle.lean` 79).
- `UniversalCover.smul_mk` (`UniversalCover/Action.lean` 63) and `UniversalCover.isQuotientCoveringMap` (162).
- `cellularResolutionOfIsAspherical` (`EilenbergMacLane/Resolution.lean` 57).
- `IsCoveringMap.contractibleSpace_of_isAspherical` (`EilenbergMacLane/Contractible.lean` 53).
- `classifyingSpaceTwistedHomologyIsoGroupHomology` and its cohomology counterpart (`ClassifyingSpace/LocalCoefficients.lean` 136, 150), their naturality (174, 281, 301) and the Bockstein (331).
- `torusSingularHomologyIsoGroupHomology` (`Torus.lean` 172) and `wedgeCirclesSingularHomologyIsoGroupHomology` (`WedgeCircles.lean` 227). Both are defined as `singularHomologyIso` of the pinned homotopy equivalence followed by the Milnor-model isomorphism, which supports README 762–765.

**Routes checked step by step.**
- 1.1: the killing tower, the cellular model of `π₁(X, x)`, the weak equivalence `e`, the lift `ℓ`, the corrected path `δ`, and the base-point move by the homotopy extension property of the discrete `0`-skeleton. Universes are consistent: `exists_mapOfEq_cellularClassifyingSpace` keeps `S` and `Z` in one universe, and `π₁(X, x)` and `killHomotopyGroups 2 X x` live in the universe of `X`.
- 1.2: the pinned one-skeleton criterion applies after `g'` agrees with `f` on the `0`-skeleton (with the R04 caveat).
- 1.3: Whitehead with `homotopyEquiv_toFun`; `y` need not be a vertex.
- 2.1: transport and naturality through `MonoidHom.classifyingSpaceSingularHomologyIsoGroupHomology_hom_naturality`.

**Seeded sample.**
- 1.1 and 1.2 — Hatcher, Proposition 1B.9, p. 90. `hatcher-at` lines 3905–3907 state it; the proof runs through lines 3912–3950 (pp. 90–91).
  - Hatcher's target is a `K(G, 1)` with contractible universal cover. The README's target is only aspherical. The proof supports the weaker hypothesis: its only use of the target is that maps `S^{n−1} → Y`, `n > 2`, are null-homotopic (lines 3928–3931), which needs only `π_{n−1}(Y) = 0`.
  - Hatcher's source is a connected CW complex based at a `0`-cell, as the README requires.
- 1.3 — Theorem 1B.8, p. 90 (line 3897). The deduction at lines 3908–3911 gives pointed maps realizing a prescribed isomorphism. The README's route through Whitehead removes Hatcher's need for a vertex base point in `Y`.
- 1.1 route — Proposition 4.22, p. 357 (lines 15549–15550). Proposition 0.16, p. 15 (lines 818–819).
- 2.1–2.3 — no locator at the claim (R05). I read `hatcher-at` lines 6471–6479 (p. 148) and 14326–14412 (pp. 328–329) as the available support.
- Segal — `segal-1968` line 95 (§3, p. 107) and lines 115–127 support "Segal 1968, §3" at README line 87.

**Ownership against other roadmaps.**
- `roadmaps grep` for the four headline names finds only copies of this folder (main, #1187, #1807).
- `roadmaps grep` for `1B.9`, `[X,Bπ]` and `Hom(π₁X` finds AlgebraicTopology on main, #1652, #1663, #1797 and this head (R01), and nothing else.
- Mathlib at the pin has no `Aspherical` or `EilenbergMacLane` file.
- CharacteristicClasses (lines 62–68, 765) consumes AlgebraicTopology 8.8b's normalised `ℤ/2` model, as README 784–785 says.

**Adversarial table.**

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Headline 1.1 existence | `X = S¹` with one vertex, `Y = S¹`, `φ = ·2` | `z ↦ z²` is pointed and induces `1 ↦ 2` | holds | none |
| Headline 1.1, non-CW-type target | `X = S¹`, `Y = ℝP^∞`, `φ : ℤ ↠ ℤ/2` | the inclusion `ℝP¹ ⊂ ℝP^∞` induces the surjection | holds | none |
| Headline 1.2 uniqueness, negative control | `X = Y = S²`, identity versus constant | both trivial on `π₁ = 1`; degrees 1 and 0; not homotopic | asphericity needed, and assumed | none |
| Headline 1.2 | `X = S²`, `Y = S¹` | every pointed map lifts to `ℝ`, so it is null rel `x`; `φ` trivial | holds | none |
| Headline 1.1–1.2, degenerate | `X` a point | `f = const y`; exactly one pointed map | holds | none |
| 1.1 route, correction of `δ` (Check) | `X = S¹ ∨ S¹`, `Y = B(F₂)`, `φ = id` | conjugation by a nontrivial `w ∈ F₂` is not the identity, since `Z(F₂) = 1` | Check true | none |
| Headline 1.3 | `X = Y = S¹`, `e = −1` | `F = z ↦ z̄`, `F(1) = 1`, `F_* = −1` | holds | none |
| Headline 1.3, base point not a vertex | `Y = S¹` with one vertex `1`, `y = i` | the pointed `F` exists by 1.1, whose target base point is arbitrary | holds | none |
| Headline 1.3, negative control | a point and the Warsaw circle | all `πₙ` trivial on both; the Warsaw circle is not contractible | CW on `Y` needed, and assumed | none |
| Direction of `π₁(BG) ≃* G` | `G = S₃`, `s = (1 2)`, `t = (2 3)` | `m(ℓ_s ℓ_t) = t s`; `γ ↦ m(γ)⁻¹` gives `s t`, the product of the images; `γ ↦ m(γ)` gives `t s ≠ s t` | forced, matches pin line 77 | none |
| Direction, sign | `G = ℤ`, lift ends at `(0, 1)` | goes to `−1`; the circle loop goes to `1`, so `m = −1` | consistent; one sentence unfinished | R09 |
| Deck action Check | circle, `g • mk x q = mk x (g⁻¹·q)` | the lifted edge runs from `ṽ` to `t⁻¹ • ṽ`; boundary `(t⁻¹ − 1) ṽ` | Check true | none |
| Headline 2.3 homology | `X = S¹`, `A = k`, generator acts by a unit `u` | `H₀ = k/(u−1)k`, `H₁ = ker(u−1)` on both sides | holds | none |
| Headline 2.3 homology | `X = ℝP^∞`, `A = ℤ` with the sign action | twisted: `H₀ = ℤ/2`, `H₁ = 0`, `H₂ = ℤ/2`; trivial coefficients: `H₁ = ℤ/2`, `H₂ = 0` | holds | none |
| Headline 2.3, negative control | `X = S² ∨ S¹`, `G = ℤ`, `A = ℤ` trivial | `H₂(X) = ℤ`, `H₂(ℤ; ℤ) = 0` | asphericity needed, and assumed | none |
| Headline 2.3, degenerate | `k = 0`; `G = 1` with `X` contractible | both sides 0; `H₀ = A` and higher groups 0 on both sides | holds | none |
| Headline 2.3 cohomology | `X = S¹`, `A = k` with `u ≠ 1`, `N = k`, `k` a field | `Homₖ(A, N)` with `u⁻¹`: `H⁰ = H¹ = 0`; space `H₀ = H₁ = 0`, so `H⁰ = H¹ = 0` | holds | none |
| 2.3 cohomology connecting maps | `k = ℤ`, `G = 1`, a point, `N = ℤ`, `0→ℤ→ℤ→ℤ/2→0` | `Hom(−, ℤ)`: `0 → ℤ →(·2) ℤ`, cokernel `ℤ/2`, not exact | missing hypothesis | R02 |
| 2.1 Check | `G = ℤ/2`, degrees 1 and 2 | `H₁ = ℤ/2` on both sides, `H₂ = 0` on both sides | true; `n` used twice | R09 |
| 2.2 Bockstein Check | `G = ℤ/2`, `0 → ℤ/2 → ℤ/4 → ℤ/2 → 0` | `H¹(ℤ/2) → H¹(ℤ/4)` injective of order 2, so the next map is 0 and `δ : ℤ/2 → ℤ/2` is an isomorphism | Check true | none |
| 2.1 Examples, "on the nose" | torus and wedge | pinned definitions (`Torus.lean` 172–176, `WedgeCircles.lean` 227–231) = `singularHomologyIso(h) ≫` Milnor iso; `h` freely homotopic to `c_X` | holds | none |

## Not verifiable

- Brown, *Cohomology of Groups*, Ch. II §4 and Ch. III §1: settled as uncertified, so cited by locator only. Hatcher §3.H was read instead (R05).
- Schwamberger–Vogt, "Dold spaces in homotopy theory", §2: settled as uncertified. That the Warsaw circle has trivial homotopy groups and is not contractible is standard; the locator into the paper is not confirmed.
- Milnor, "Construction of universal bundles, II": settled as uncertified; `segal-1968` lines 115–127 were read instead.

## Source issues

- none
