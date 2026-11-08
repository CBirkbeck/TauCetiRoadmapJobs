# Review of HigherToposTheory (pull request #1901 at f522659)

**Verdict:** rejected

:robot: AI review (Claude Opus 5.5). This reviews only the folder `TauCetiRoadmap/HigherToposTheory/` (README.md, Suggested.lean, metadata.toml). The pull request changes no file outside that folder.

**Why rejected rather than "needs changes".** This review cannot be fixed by editing this folder alone. Large parts of the roadmap re-plan three roadmaps already on main (R01), and it says those roadmaps will take their definitions from it. That would need revisions of GeneralizedCohomology, BordismFormalGroups and EnhancedDerivedSheaves, with this roadmap placed before them in the merge order. Whether to move ownership that way is a decision for a human. The scope is also wrong in kind: it restates every numbered statement of HTT and HA chapter 1, in book order, as 1,894 targets (R02). Finally, `Suggested.lean` is a 7,283-line catalogue built on `sorry`'d data, so its milestone theorems cannot be falsified (R03). Within that scope the locators checked are accurate and the mathematics mostly sound. R04–R13 list the defects a resubmission must also fix.

## R01 (P1) — Re-plans three roadmaps on main and declares them its consumers

- **Location.** `TauCetiRoadmap/HigherToposTheory/README.md:36–40, 50, 94`. Line 50: "BordismFormalGroups, EnhancedDerivedSheaves and DerivedModuleAlgebra build on this material; they take the notions of the Conventions table from here rather than defining their own." Line 94: "The table binds every Lean definition of these notions, whichever roadmap's target introduces it".
- **Claim.** This roadmap owns the Kan–Quillen model structure (F2), Bergner's structure (F3), and joins, slices, mapping spaces, cores, functor ∞-categories, (co)limits, the Joyal structure, straightening, Kan extensions, presentability, stability and ∞-topoi (L1–L9). Three roadmaps on main already plan these objects.
- **Witness.** `TauCetiRoadmap/GeneralizedCohomology/README.md:219–224` builds the Kan–Quillen structure and fixes realization-based weak equivalences (G2.1). `TauCetiRoadmap/BordismFormalGroups/README.md:1546, 1561, 1823, 1927, 1968–1999` (F6.5) plans the categorical model, Bergner, Joyal and marked straightening. `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:187–415` (E0) plans finality, Theorem A, stable fibres, `IsLocallySmall` and presentability.
- **Repair.** Either:
  1. import those sections by name: F2's model structure and weak equivalences from GeneralizedCohomology G2.1; joins, slices, right mapping spaces, categorical equivalences, the Bergner and Joyal models, straightening, `Cat∞`, `Spaces` and stability from BordismFormalGroups F6.5; finality, Theorem A, local smallness, accessibility, presentability, Kan extensions, adjoints and localizations from EnhancedDerivedSheaves E0, E3 and E5:presentability. Then restrict "It owns" to what they do not plan, and delete line 50 and the binding clause of line 94; or
  2. if one owner is wanted, have a human decide it, and implement it as revisions of those three roadmaps that cede the sections, with this roadmap ahead of them in the merge order.

  This roadmap is listed last (line 398 of the candidate order), so as it stands any supply from it to those roadmaps would be upward.

## R02 (P2) — Scope is a book-order restatement of HTT and HA chapter 1, not split into Parts

- **Location.** `README.md:30` ("A definition or result of HTT or of HA chapter 1 is in scope, and so is any Remark of those books that a definition or result depends on"); `README.md:125` ("The items of a layer are written in the book's order"); `README.md:220` (total 1,894 targets; README 1.33 MB).
- **Claim.** The roadmap is organised by the source's numbering rather than by objects and headline theorems. It paraphrases essentially every numbered statement of HTT and of HA chapter 1, section by section, including expository Remarks.
- **Witness.** The source rules forbid summarising a source section by section. The house rules require a roadmap that is unwieldy to be split into Parts. Fifteen layers and 1,894 targets in one README do neither.
- **Repair.** Scope each Part by its objects and end theorems, and cite HTT and HA by locator only where a claim needs them. Drop targets that only restate Remarks or expository numbering. Split into Parts, for example:
  1. model-categorical foundations (whatever R01 leaves here);
  2. fibrations and straightening;
  3. limits, Kan extensions and presentability;
  4. stable ∞-categories;
  5. ∞-topoi;
  6. HTT chapter 7.

## R03 (P1) — Suggested.lean is a catalogue whose milestones rest on `sorry`'d data

- **Location.** `TauCetiRoadmap/HigherToposTheory/Suggested.lean`:
  - `:238–251`: `instance (S : SSet.{u}) : Category.{u} (Rigidification S) := sorry`, its `SimplicialCategory` instance, and `rigidification.map … := sorry`;
  - `:100`: `H.cartesianMonoidalCategory … := sorry`;
  - `:308`: `def IsCategoricalEquivalence … := EnrichedFunctor.IsEquivalence (hoEnriched.map f)`.
- **Claim.** The root notion of the Conventions table, categorical equivalence, is defined through `sorry`'d data. So is everything built on it: full faithfulness, `mapH`, the Joyal structure, Dwyer–Kan comparisons. Every theorem about these notions is unfalsifiable. The gate counts 316 `sorry`'d data bodies across 1,017 declarations (805 `def`/`abbrev`, 103 `instance`) in 7,283 lines, against a limit of 5,000.
- **Witness.** These milestones are stated about `sorry` data:
  - `joyal_spec` (`:6718`) uses `rigidificationAdjunction := sorry` (`:6377`);
  - `simplicialNerveCounit_weakEquivalence` (`:6697`) uses `simplicialNerveCounit := sorry` (`:6366`);
  - `markedStraightening_spec` (`:6789`) uses `markedStraightening := sorry` (`:3012`);
  - `hoFunctor_isTriangulated` (`:6897`) uses `hoFunctor.hasShift := sorry` (`:4618`);
  - `isProperGeometricMorphism_sheafOnSpace_map` (`:6921`) uses `sheafOnSpace.map := sorry` (`:5830`).
- **Repair.** Rewrite `Suggested.lean` as the acceptance test:
  - state only the headline theorems that are statable at the pins, with small real-bodied definitions on Mathlib and Tau Ceti carriers. For example, HTT 2.4.6.1 can be stated with categorical equivalences defined through `hoFunctor.obj ((ihom B).obj C) ⥤ hoFunctor.obj ((ihom A).obj C)` being an equivalence for every quasicategory `C` (a real body);
  - in the module docstring, name each milestone that is not statable and the carrier it lacks (`C[S]` as a simplicial category, straightening, `Shv(X)` functoriality, the shift on `hC`, and so on);
  - move every other definition to a README target with its intended signature;
  - stay under 5,000 lines, with no `sorry` in any `def`, `abbrev` or `instance`.

  Applied to `joyal_isFibrant_iff`, the statement is then about a definition with a body, and `X = Λ[2,1]` is decidably not fibrant.

## R04 (P1) — Two `sorry`'d instances in Suggested.lean are false

- **Location.** `Suggested.lean:4423`: `instance quasicategory_subcomplex {X : SSet.{u}} [Quasicategory X] (A : X.Subcomplex) : Quasicategory (A : SSet.{u}) := sorry`. `Suggested.lean:4418`: `instance quasicategory_fibre {X S : SSet.{u}} [Quasicategory X] (p : X ⟶ S) (s : S _⦋0⦌) : Quasicategory (fibre p s) := sorry`.
- **Claim.** Every subcomplex of a quasicategory, and every fibre of any map out of one, is a quasicategory. Because these are instances, any elaborated statement may rely on them silently.
- **Witness.** `Λ[2,1] ⊆ Δ[2]`: none of the 2-simplices of `Λ[2,1]` has faces `01` and `12`, so the identity horn of `Λ[2,1]` has no filler. For `p : Δ[2] → Δ[2]/Λ[2,1]`, the fibre over the collapsed vertex is `Λ[2,1]`.
- **Repair.** Delete both instances in the rewrite of R03. If they are kept, `quasicategory_fibre` needs `[InnerFibration p]`, as its own docstring says. The subcomplex instance must be restricted to full subcomplexes (Tau Ceti `SSet.fullEnhancedSubcategory`). Rechecked on the witness: `Λ[2,1]` is not full, since vertices 0 and 2 span the edge `02`, which `Λ[2,1]` does not contain. And `p` is not an inner fibration: the horn lifts only to the identity 2-simplex, which does not lie over the constant 2-simplex.

## R05 (P1) — False claim about degenerate simplices in "Homotopy relative to the boundary"

- **Location.** `README.md:3168`: "two simplices with the same boundary are related exactly when they are equivalent objects of the fibre … A degenerate simplex is related only to itself."
- **Claim.** The README says a degenerate simplex is related to no other simplex. HTT shows only that two related degenerate simplices are equal (LurieHTT lines 5171–5173, proof of Proposition 2.3.3.8, PDF p. 122).
- **Witness.** Take `X = Sing([0,1])` over `Δ[0]` and `n = 1`. The constant path at 0 (degenerate) and `γ(t) = t(1−t)` (nondegenerate) have the same boundary `(0, 0)`. The fibre is the loop space at 0, which is contractible, so the two are related.
- **Repair.** Replace the last sentence with: "Two related degenerate simplices are equal, so each class contains at most one degenerate simplex." Checked on the witness: the class of `γ` contains exactly one degenerate simplex, the constant path, so the construction of `HTT.2.3.3.8/retract/subset` (representatives containing every degenerate simplex) still makes sense.

## R06 (P2) — Plans to redefine library declarations that other roadmaps own

- **Location.** `README.md:174–188` (table "Redefinitions of Tau Ceti declarations"), `README.md:60` ("A Tau Ceti declaration that disagrees with the table is redefined"). `Suggested.lean:77–84` declares a second scoped `CategoryWithWeakEquivalences SSet` instance with Kerodon's class.
- **Claim.** The README redefines Tau Ceti's `weakEquivalences SSet` and renames `SSet.QCat.IsCategoricalEquivalence`. It also redefines `SSet.IsWeaklyContractible`, `SSet.IsFullyFaithful` and `SSet.CategoricalFibration`.
- **Witness.** At the pin, `TauCeti/AlgebraicTopology/SimplicialSet/WeakEquivalence.lean:60` defines the weak equivalences as `TauCeti.TopCat.weakEquivalences.inverseImage toTop`. That is GeneralizedCohomology G2.1's definition (`TauCetiRoadmap/GeneralizedCohomology/README.md:220–222`). Two scoped instances on one class conflict when both namespaces are opened.
- **Repair.** Keep the library definitions as the definitions. State Kerodon 3.1.7.12 (bijection on `π₀ Fun(−, Z)` for all Kan `Z`) as an `iff` target; G2.1 already plans the Kan-group criterion, so cite it. Remove the redefinitions table, and the second instance from `Suggested.lean`. Checked on `∂Δ[1] → Δ[1]` with `Z = Δ[0] ⊔ Δ[0]`: both definitions reject it (realization: `π₀` has 2 elements against 1; Kerodon: 2 classes against 4).

## R07 (P2) — Supplier contracts cite Tau Ceti declarations that do not exist at the pin

- **Location.** `README.md:148`: "The baseline is Mathlib `1b1ccf4…` and Tau Ceti `7ac4960…`". `README.md:162–172` lists the "From Tau Ceti" names. `Suggested.lean:136–217` copies some of them locally.
- **Claim.** The supplier contracts describe a Tau Ceti revision other than the pin `2fd255d…`.
- **Witness.** `#check` with Suggested.lean's imports, at the pin, reports unknown constants:
  - `SSet.IsTerminalVertex`, `SSet.IsInitialVertex`;
  - `SSet.LeftFibration`, `SSet.RightFibration`, `SSet.leftAnodyneExtensions`, `SSet.rightAnodyneExtensions`;
  - `SSet.IsLimit`, `SSet.IsColimit`;
  - `SSet.CatInftyΔ`, `SSet.catInfty`;
  - `SSet.QCat.IsCategoricalEquivalence`, `SSet.IsFullyFaithful`, `SSet.CategoricalFibration`, `CategoryTheory.EnrichedFunctor.IsDwyerKanEquivalence`;
  - `TauCeti.MarkedSSet.markedAnodyneExtensions`, `SSet.IsWeakHomotopyEquivalence`;
  - `SSet.Edge.isEquivalence_iff_hornFilling_zero`, `SSet.slice.rightFibration_π`.

  A grep of the pinned tree finds none of them under these names. The only `IsWeakHomotopyEquivalence` there is `ContinuousMap.IsWeakHomotopyEquivalence` (`TauCeti/Topology/Homotopy/HomotopyGroup/WeakHomotopyEquivalence.lean:78`).
- **Repair.** Cite only declarations at the pins. Anything newer becomes a target here, or is cited from the roadmap that owns it (see R01). Delete the local copies and their process note ("deleted when the pin is bumped"). After the repair, `#check` on each contract name at the pin must succeed.

## R08 (P3) — README shape: missing sections, too few Checks, indecisive "propose"

- **Location.** Whole README. No layer ends with `### Examples` or `### Dependencies` (0 of 15). There is no `## Downstream consumers`. There are 423 `*Lean:*` definition entries against 272 `**Checks.**` blocks. Of those blocks, 169 have one Check and 70 have two. Examples: `README.md:668` (A.2.8.1, one Check) and `README.md:2853–2856` (straightening, two). "propose" appears 221 times, while `README.md:117` says "Every definition target states its Lean definition precisely".
- **Claim.** These depart from the required README shape: at least three discriminating Checks per definition, every layer ending with its examples and dependencies, and definite definitions.
- **Witness.** A.2.8.1's only Check (J discrete) also holds for the wrong definition "injective fibrations = levelwise fibrations". At J discrete the two definitions agree, so the Check cannot tell them apart.
- **Repair.** Add per-layer `### Examples` and `### Dependencies` and a `## Downstream consumers` section. Give each definition at least three Checks, including a non-example and a degenerate case. For A.2.8.1, add: for J = `[1]` and A = Kan–Quillen `SSet`, the diagram `Δ[0] ⊔ Δ[0] → Δ[0]` is levelwise (injectively) cofibrant but not projectively cofibrant. Lifting it against the levelwise trivial fibration from `({0,1} ↪ Δ[1])` to `(Δ[0] ⊔ Δ[0] → Δ[0])` would send one point to both 0 and 1. Replace "propose `X`" with "Define `X`".

## R09 (P3) — Process residue, pull-request numbers and dated text

- **Location.**
  - `README.md:160`: "Mathlib work in progress" with mathlib4 PR numbers.
  - `README.md:951`: "Follow Mathlib PR #44464".
  - `README.md:2527, 3645, 3655`: Tau Ceti PR numbers.
  - `README.md:1599`: "their route is to be checked against the paper".
  - `README.md:738`: "This is the TODO of Mathlib's …".
  - `README.md:115`: "Both links served these editions as of 5 November 2026".
  - `README.md:66, 183`: "to be renamed".
  - "Tau Ceti main" appears 63 times in the README.
  - `Suggested.lean` has 48 "*(added)*" markers, and its docstring says "deleted when the pin is bumped".
- **Claim.** These are process words, review residue and time-stamped statements. The README must be timeless and must not cite pull-request numbers. The gate's residue hit at `README.md:9839` ("has to be checked" about a topology) is a false positive.
- **Witness.** Gate rules `prnum` (7 hits) and `residue` (5 hits, 4 genuine).
- **Repair.** Delete the PR numbers and the work-in-progress paragraph; per "Defer to Mathlib", the shape of the Mathlib work is stated in the targets themselves. State the Dwyer–Kan route definitely or remove it. Drop the dates and "to be renamed". Cite Tau Ceti at the pin, not "main".

## R10 (P3) — Gate `statement-hygiene` (14 hits)

- **Location.**
  - Choice in `def` bodies: `Suggested.lean:1941` (`Bergner.cofibrationClass`), `:5668` (`geometricImage`), `:5952` (`shape`), `:6295` (`IsCellLike`), `:6303` (`HasEnoughPoints`).
  - `haveI` in theorem signatures: `:6725–6728` (`joyal_spec`), `:6734–6737` (`rigidificationFunctor_cofibration`).
  - `:7181`: `sieve_slice_equiv` concludes `Nonempty (… ≃ …)`.
- **Claim / witness.** The gate rule names each of these, all at P3.
- **Repair.** As the gate names: take the chosen datum as an argument or define it by a universal property; use instance binders instead of `haveI`; state the canonical map and `IsIso`, or rename to `nonempty_*`. If R03's rewrite deletes these declarations, they need no separate fix.

## R11 (P3) — Gate `readme-ids-missing` (72 hits, some false positives)

- **Location.** README backticked names presented as this roadmap's own but not declared in Suggested.lean. Examples: `SSet.TStructure.heart_discrete`, `SSet.exInfty.anodyne_ι`, `SimplicialModelCategory.nonempty_iff`, `TopologicalSpace.IsANR.of_isOpen`, `SSet.mapH_iso_rightMappingSpace`.
- **Claim / witness.** At least 12 of the 72 are real library names that the README labels as library names, so the gate is wrong about them:
  - `MorphismProperty.llp_isStableUnderCoproductsOfShape` (`Mathlib/CategoryTheory/MorphismProperty/LiftingProperty.lean:86`);
  - `MorphismProperty.llp_rlp_of_hasSmallObjectArgument` (`Mathlib/CategoryTheory/SmallObject/Basic.lean`);
  - `MorphismProperty.isLocallyPresentable_isLocal` (`Mathlib/CategoryTheory/Presentable/OrthogonalReflection.lean`);
  - `TopCat.continuous_iff_of_isColimit`;
  - `SSet.innerFibration_pullbackObjObjπ`;
  - `SSet.rlp_monomorphisms_iff` (`TauCeti/AlgebraicTopology/SimplicialSet/TrivialFibration.lean:171`).

  The rest are this roadmap's names with no declaration.
- **Repair.** State those API bullets and Checks in prose without the Lean name; never add declarations to satisfy the gate.

## R12 (P3) — Padding in Suggested.lean

- **Location.** `Suggested.lean:7198`: `instance quasicategory_ihom (K C : SSet.{v}) [Quasicategory C] : Quasicategory ((ihom K).obj C) := sorry`. There are also 44 transport lemmas proved by `rfl`, such as `Cartesian.weakEquivalences_eq` (`:6558`), and the first three conjuncts of `modelCategoryQuillen_spec` (`:6656`) are definitional.
- **Claim.** These restate the library or a definition.
- **Witness.** The probe `example (K C : SSet.{1}) [SSet.Quasicategory C] : SSet.Quasicategory ((ihom K).obj C) := by infer_instance` succeeds at the pin, from `Mathlib/AlgebraicTopology/SimplicialSet/AnodyneExtensions/Inner/PushoutProduct.lean:157`.
- **Repair.** Delete them from `Suggested.lean`. The README keeps the transport lemmas as part of the synonym convention.

## R13 (P3) — Milestone "Proper base change" points at the wrong statement

- **Location.** `README.md:240`: "| Proper base change | HTT 7.3.1.16 | L12 |". `Suggested.lean:6917–6924` gives the milestone docstring "Proper base change" to HTT 7.3.1.16.
- **Claim.** HTT 7.3.1.16 says that `p_*` is proper (LurieHTT line 35041, PDF p. 773). The nonabelian proper base change theorem is Corollary 7.3.1.18 (LurieHTT line 35071, PDF p. 774).
- **Witness.** HTT's own title for 7.3.1.18 is the Nonabelian Proper Base Change Theorem.
- **Repair.** Either rename the milestone "`p_*` is a proper geometric morphism (HTT 7.3.1.16)", or make 7.3.1.18 (left adjointability of the square of `Shv`, for locally compact Hausdorff spaces) the milestone.

## Verified sound

**Gate and build.**
- I reran the gate at this head. The counts are the same as the worker's: prnum 7, sorry-data 316, residue 5, lean-lines 1, statement-hygiene 14, readme-ids-missing 72. Everything else is 0, except a `depcheck` "NOT IN ORDER" line from the default order; it is not a finding, because the candidate order lists this roadmap at line 398.
- The dependency check against the candidate order printed `depcheck: 245 roadmaps, 2466 edges, 0 problem(s)`, so there are no UPWARD or CYCLE lines.
- `lake env lean` on `Suggested.lean` exits 0, with 396 "declaration uses `sorry`" warnings and no other warnings or errors.
- `metadata.toml` is `topic = "math.CT"`. There are no files outside the folder.

**Seeded sample (15 targets).** I checked each against the author PDF of HTT (9 April 2017, matching `README.md:115`) as LurieHTT, HA (18 September 2017) as LurieHA, and Kerodon online:
1. Injective and projective classes: HTT A.2.8.1, PDF pp. 847–848, LurieHTT lines 38561–38578. Correct.
2. Weak homotopy equivalences: Kerodon Definition 3.1.7.12 (tag 00UA) is the `π₀ Fun(−, Z)` definition, and §3.3.7 (tag 00ZM) gives its characterizations. Correct.
3. Straightening and unstraightening: HTT §2.2.1, PDF p. 91, LurieHTT lines 3779–3792. The definitions of `φ`, `M` and `St_φ X(c) = Map_M(c, v)` match. The Check `S = Δ[0]` matches LurieHTT lines 3876–3885.
4. Homotopy relative to the boundary: the locator (proof of 2.3.3.8, PDF p. 122) is correct; the statement is not (R05).
5. Boundary extension: HTT Remark 2.3.4.4, PDF p. 125. Correct.
6. Functor categories into n-categories: HTT Corollary 2.3.4.8, PDF p. 126. Correct.
7. Cartesian edges in a locally Cartesian fibration: HTT Lemma 2.4.2.7, PDF p. 141. All three conditions match.
8. Completely compact left fibrations: HTT Lemmas 5.1.6.6–5.1.6.7, PDF p. 348. The stated weakening of 5.1.6.7 (small limits and colimits instead of presentable) holds, because the proof uses only a limit of `p` and 1.2.13.8 (LurieHTT lines 15679–15715).
9. Sections of coCartesian fibrations: HTT Lemmas 5.4.4.1–5.4.4.2, PDF pp. 449–450. The hypotheses (i)–(iv) and the `T(K)` universal property match.
10. Products and functor ∞-categories: HTT 5.5.3.5, 5.5.3.6, 5.5.3.8, PDF pp. 485–486. Correct.
11. Functor ∞-categories are stable: HA Proposition 1.1.3.1, PDF p. 30. Correct.
12. Degreewise split pushouts: HA Corollary 1.3.2.16, PDF pp. 90–91. Correct.
13. Projective approximation: HA 1.3.2.19 (∗), PDF p. 93. I recomputed that the construction is an isomorphism on `H_k` for `k ≥ 0`, in both directions.
14. Giraud for ordinary topoi: HTT Proposition 6.1.0.1, PDF pp. 546–547. Correct.
15. Proper maps and proper base change: HTT 7.3.1.12, 7.3.1.14, 7.3.1.16, 7.3.1.18, PDF pp. 772–774. The statements are correct; the milestone label is not (R13).

**Library declarations opened at the pins.**
- Mathlib:
  - `SSet.modelCategoryQuillen` (cofibrations and fibrations only; `Mathlib/AlgebraicTopology/SimplicialSet/CategoryWithFibrations.lean:36–126`);
  - `T35Space extends T0Space, CompletelyRegularSpace` (`Mathlib/Topology/Separation/CompletelyRegular.lean:249`);
  - `isProperMap_iff_universally_closed` (`Mathlib/Topology/Maps/Proper/UniversallyClosed.lean:98`);
  - `isEmbedding_stoneCechUnit` (`CompletelyRegular.lean:291`);
  - `hasStrictInitial_of_isUniversal` (`Mathlib/CategoryTheory/Limits/VanKampen.lean:406`);
  - `IsUniversalColimit.map_reflective` (`VanKampen.lean:249`);
  - `IsEquivalenceRelation`, `IsEffectiveEquivalenceRelation` (`Mathlib/CategoryTheory/EquivalenceRelation.lean:98, 268`);
  - `IsLocallyPresentable` (`Mathlib/CategoryTheory/Presentable/LocallyPresentable.lean:80`);
  - `ModelCategory.transport`;
  - the `ihom` quasicategory instance (`PushoutProduct.lean:157`).
- `#check` resolves these Mathlib contract names: `SSet.QCat.bicategory`, `SSet.Truncated.HomotopyCategory₂`, `SimplicialThickening`, `SimplicialNerve`, `SSet.anodyneExtensions`, `SSet.FundamentalGroupoid`, `Triangulated.TStructure`, `Idempotents.DoldKan.equivalence`, `Functor.IsLocalization`, `IsCardinalAccessibleCategory`, `Reflective`.
- Tau Ceti: `SSet.coslice`, `SSet.rightMappingSpace`, `SSet.fullEnhancedSubcategory`, `SSet.Edge.IsEquivalence`, `SSet.Edge.IsCartesian`, `SSet.CartesianFibration`, `TauCeti.MarkedSSet`, `SSet.IsLocallySmall`, `TauCeti.HasSmallSpaceModel`, `SSet.IsCardinalFiltered`, `TauCeti.DGCategory`, `TauCeti.dgNerve` and `SSet.KanComplex.π` exist at the pin.

**Cross-roadmap citations resolved on main.**
- AlgebraicTopology Stage 4 (`TauCetiRoadmap/AlgebraicTopology/README.md:499`) and Stage 8 item 2 (`:1655`; Kan homotopy groups and the realization unit).
- GeneralizedCohomology G2.1 `realizationProductKelleyComparison` (`TauCetiRoadmap/GeneralizedCohomology/README.md:234`).
- The README's boundary with DGAInfinity (Tabuada's model structure).

**Open pull requests.**
- The overlap listing shows no dropped ids and no other pull request that changes this roadmap.
- LocallyPresentableCategories, read at its head with the roadmaps tool, explicitly cedes Lurie's presentability, the small object argument, weakly saturated classes and accessible subcategories to this roadmap's F1.1, F1.3 and F1.6. No conflict.
- HomotopyTheoryOfCategories owns Theorem A for basic localizers on `Cat`, a different object from L5's ∞-categorical Theorem A.

**Lean signatures.**
- I read the worker's `signatures.md` (all 1,017 elaborated types). Its 169 "dropped binder" leads are mostly `[Category]` binders that the types mention through other arguments. The real defect class is the missing `[InnerFibration p]` in `quasicategory_fibre` (R04).
- I did not re-`#check` all 1,017 declarations, because R03 requires the file to be rewritten.

**Adversarial table.** ✓ means the stated values agree; ✗ means a defect.

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| A.2.8.1 injective/projective classes | J = {a,b} discrete; J = ∅ | test map `(id, j)`, j a trivial cofibration ⇒ inj. fibrations = levelwise fibrations; J = ∅: one object, all classes = {id} | ✓ | add Checks (R08) |
| Weak homotopy equivalence (Kerodon 3.1.7.12; Lean `:77`) | `∂Δ[1]→Δ[1]`, Z = `Δ[0]⊔Δ[0]`; `∅→Δ[0]`, Z = ∅ | 2 classes vs 4 ⇒ not bijective; `π₀Fun(Δ[0],∅)=∅` vs `π₀Fun(∅,∅)={∗}` ⇒ not w.h.e.; `(pre f).app Z : (ihom Y).obj Z ⟶ (ihom X).obj Z` is precomposition | ✓ | — |
| Straightening St_φ (§2.2.1) | X = ∅; S = Δ[0] | `M = {v} ⊔ Cᵒᵖ`, `Map_M(c,v) = ∅` ⇒ empty functor; S = Δ[0]: `St X = |X|_{Q•}` (LurieHTT 3876–3885) | ✓ | — |
| Homotopy rel boundary (`:3168`) | `Sing[0,1]`, n = 1, const₀ vs `t(1−t)` | same boundary (0,0); loop space contractible ⇒ related; one degenerate, one not | ✗ | R05 |
| Remark 2.3.4.4 | n = 0, m = 2, C = N(0<1<2); m = 1 | 10 maps `∂Δ[2]→C` vs 10 maps `Δ[2]→C` ⇒ bijective; m = 1: 4 vs 3 ⇒ not bijective, so `m > n+1` is sharp | ✓ | — |
| Cor. 2.3.4.8 | n = −1, C = ∅; n = 0, C = X = Δ[1] | `Fun(X,∅)` = ∅ or Δ[0]; `Fun(Δ[1],Δ[1])` = nerve of the 3-element chain 00 ≤ 01 ≤ 11 | ✓ | — |
| n-category definition | n = −1, C = `Δ[0]⊔Δ[0]`; contractible groupoid on 2 objects | two vertices with equal empty boundary ⇒ not (−1); groupoid: 1-category, and x ≅ y with x ≠ y ⇒ not 0 | ✓ | — |
| Lemma 2.4.2.7 | `p = id : Δ[2] → Δ[2]` | all edges p-Cartesian; conditions (1)–(3) all true | ✓ | — |
| Lemmas 5.1.6.6–7 | p : ∅ → C | `C_{/p} = C`; completely compact in both coincide | ✓ | departure sound |
| Lemmas 5.4.4.1–2 | K = ∅; κ = ω < τ | RLP for `∅ ⊆ Δ[0]` ⇔ fibres nonempty (τ-filtered ⇒ nonempty); κ < τ ⇒ τ uncountable, as Lurie's proof uses | ✓ | — |
| 5.5.3.5/6/8 | empty family; K = ∅ | product = Δ[0], presentable; `Fun(∅,C) = Δ[0]` | ✓ | — |
| HA 1.1.3.1 | K = ∅; K = Δ[0] | `Fun(∅,C) = Δ[0]` stable; `Fun(Δ[0],C) = C` | ✓ | — |
| HA 1.3.2.16 | `0 → M′`; `ℤ →2 ℤ` (not split) | `N′ = N ⊕ M′`, homotopy pushout; strict pushout ℤ/2 vs cone `ℤ→2ℤ`, not chain-homotopy equivalent ⇒ the split hypothesis is needed | ✓ | — |
| HA 1.3.2.19 (∗) | A = ℤ/2 in degree 0; ℤ in degree −1 | `P = (ℤ →2 ℤ)`: `H₀ = ℤ/2`, `H₁ = 0`; degree −1: `P = 0`, `H_k = 0` for k ≥ 0 on both sides | ✓ | — |
| HTT 6.1.0.1 | C = Type u; C = Grp | Type: (A), (B), (C) all hold; Grp: colimits not universal, not a sheaf topos | ✓ | — |
| HTT 7.3.1.14 vs `IsProperMap` | base change along `g : Y′→Y` | `X×_Y Y′ = (p×id)⁻¹(graph g)`; a closed map restricted to a full preimage is closed ⇒ the two definitions agree | ✓ | — |
| HTT 7.3.1.16 | X = ∅; X Sierpiński | ∅ ↪ Y is a closed immersion, `p_*` proper; Sierpiński is not T35, excluded | ✓ | — |
| `PowLT` Check (`:541`) | κ = ℵ₀; κ = ℵ₁; κ inaccessible | finite^finite < ℵ₀; `2^ℵ₀ ≥ ℵ₁` ⇒ ¬PowLT ℵ₁ ℵ₁; `τ′^κ′ ≤ 2^{τ′κ′} < κ` | ✓ | — |
| Weak saturation Check (F1.1) | `{∅ → ∗}` in Type | pushouts and transfinite composites give every injection `A ↪ A ⊔ (B∖A)`; `2 → 1` not in the class | ✓ | — |
| t-structure dictionary (Lean `:834–853`) | X ∈ `D_{≥0}`, shift by 1 | `le n X := Dge(X⟦n⟧)`: X ∈ le 0 ⇒ `X⟦1⟧` ∈ le(−1) = `D_{≥1}` = ΣD_{≥0} | ✓ | — |
| `IsCategoricalEquivalence` (`:308`) | f = 𝟙 Δ[0] | value fixed by `rigidification.map := sorry`; not determined | ✗ | R03 |
| `joyal_isFibrant_iff` (`:6742`) | X = Λ[2,1] | intended: not fibrant (inner anodyne `Λ[2,1] ⊆ Δ[2]`, no retraction); Lean: fibrations through a sorry'd notion, undetermined | ✗ | R03 |
| `hoFunctor_isTriangulated` (`:6897`) | C = Δ[0] | intended: trivial triangulated category; Lean: shift `:= sorry`, an arbitrary structure | ✗ | R03 |
| `isProperGeometricMorphism_sheafOnSpace_map` (`:6921`) | X = Y = pt, p = id | intended: `p_* = id`, proper; Lean: `sheafOnSpace.map := sorry` | ✗ | R03 |
| `modelCategoryQuillen_spec` (`:6656`) | `Δ[0]⊔Δ[0] → Δ[0]` | Kan fibration, not w.h.e. (π₀: 2 vs 1), not in `mono.rlp`; conjuncts 1–3 rfl | ✓ (padding parts) | R12 |
| `quasicategory_subcomplex` (`:4423`) | Λ[2,1] ⊆ Δ[2] | no 2-simplex with faces 01 and 12 ⇒ not a quasicategory | ✗ | R04 |
| `quasicategory_fibre` (`:4418`) | `Δ[2] → Δ[2]/Λ[2,1]` | fibre = Λ[2,1] | ✗ | R04 |
| `quasicategory_ihom` (`:7198`) | probe | `infer_instance` closes it at the pin | padding | R12 |
| Milestone "Proper base change" | locator | 7.3.1.16 = `p_*` proper; 7.3.1.18 = base change | ✗ | R13 |

## Not verifiable

- None of the sampled statements. Kerodon was read online (kerodon.net tags 00UA, 00U1, 00ZM, 00SY). The sources service has no PDF of Kerodon, and this roadmap has no `sources.toml` entry for Kerodon, HTT or HA.
- Ownership was checked by object against main, the five closest open roadmaps in the overlap listing and the two read above. It was not checked by object against all 478 open roadmap pull requests.

## Source issues

- **Misprint** in LurieHTT at the proof of Corollary 2.3.4.8, PDF p. 126: the source says the restrictions are homotopic relative to `f|sk_{n−1}K`; it should be relative to `sk_{n−1}K`; affects nothing.
- **Misprint** in LurieHTT at the proof of Lemma 5.4.4.2, PDF p. 450: the source states the universal property of `T(K)` for maps `A → K′`; it should be maps `A → T(K)`; affects nothing.
- **Misprint** in LurieHTT at the proof of Lemma 5.4.4.1, PDF p. 449: the source asks for an edge `ẽ` lifting `ẽ`; it should be an edge `ẽ` lifting `e`; affects nothing.
- **Misprint** in LurieHTT at the proof of Lemma 5.1.6.6, PDF p. 348: the source uses the letter F both for the left fibration over C and for the functor classifying F′; the classifying functor should get its own letter; affects nothing.
- **Misprint** in LurieHTT at the proof of Lemma A.2.8.10, PDF p. 852: the source writes the left adjoint first as `g_!` and then as `q_!`; it should be `g_!` throughout; affects nothing.
