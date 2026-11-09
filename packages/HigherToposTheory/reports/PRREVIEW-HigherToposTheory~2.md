# Review of HigherToposTheory (pull request #1901 at 2176cc4)

**Verdict:** rejected

:robot: AI review (Claude Opus 5.5), incremental. The previous review read `f522659`. Head `2176cc4` has the same tree (`6804092`) and the same parent (`eaf17b1`). It has the same author and date as `f522659`, and changes 0 lines in `TauCetiRoadmap/HigherToposTheory/` and none outside it. The pins are also unchanged: Mathlib `1b1ccf4`, Tau Ceti `2fd255d`.

None of the 13 previous findings is repaired. The verdict stays **rejected** for the same reasons:

- **R01.** The roadmap re-plans sections of GeneralizedCohomology, BordismFormalGroups and EnhancedDerivedSheaves, which are on main and unchanged there since the last review. It also declares those roadmaps its consumers. Moving that ownership needs a human decision and revisions of those roadmaps.
- **R02.** The scope is a book-order restatement of HTT and HA chapter 1.
- **R03.** `Suggested.lean` is a 7,283-line catalogue whose milestones rest on `sorry`'d data.

The findings below are the previous ones, written again at this head. The repairs are unchanged except where noted.

## R01 (P1) — Re-plans three roadmaps on main and declares them its consumers

- **Location.** `TauCetiRoadmap/HigherToposTheory/README.md:50`: "BordismFormalGroups, EnhancedDerivedSheaves and DerivedModuleAlgebra build on this material; they take the notions of the Conventions table from here rather than defining their own." Also `:36–40` and `:94` ("The table binds every Lean definition of these notions, whichever roadmap's target introduces it").
- **Claim.** This roadmap claims ownership of the following, all of which roadmaps on main already plan:
  - the Kan–Quillen structure (F2) and Bergner's structure (F3);
  - joins, slices and mapping spaces, the Joyal structure, straightening, Kan extensions, presentability and stability (L1–L9).
- **Witness.** On main at `2083308`:
  - `TauCetiRoadmap/GeneralizedCohomology/README.md:220–222` builds Kan–Quillen and fixes realization-based weak equivalences (G2.1);
  - `TauCetiRoadmap/BordismFormalGroups/README.md:1561, 1823, 1927` (F6.5) builds Bergner, Joyal and straightening;
  - `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:187–190` (E0.1) takes joins and slices from F6.5.
- **Repair.** Choose one of two routes:
  1. Import those sections by name:
     - F2's model structure from GeneralizedCohomology G2.1;
     - joins, slices, mapping spaces, Bergner, Joyal, straightening, `Cat∞` and stability from BordismFormalGroups F6.5;
     - finality, Theorem A, local smallness, presentability, Kan extensions, adjoints and localizations from EnhancedDerivedSheaves E0, E3 and E5:presentability.

     Then restrict "It owns" to what those roadmaps do not plan, and delete line 50 and the binding clause of line 94.
  2. Have a human settle single ownership, implemented as revisions of those three roadmaps that cede the sections, with this roadmap placed before them in the merge order.

  The candidate order lists this roadmap last (line 398), so any supply from it to those roadmaps is upward today.

## R02 (P2) — Scope is a book-order restatement of HTT and HA chapter 1, not split into Parts

- **Location.** `README.md:30`: "A definition or result of HTT or of HA chapter 1 is in scope, and so is any Remark of those books that a definition or result depends on". Also `:125` ("The items of a layer are written in the book's order") and `:220` (total 1894 targets).
- **Claim.** The roadmap is organised by the source's numbering, not by objects and end theorems. It paraphrases essentially every numbered statement of HTT and HA chapter 1, section by section.
- **Witness.** The source rules forbid summarising a source section by section, and the house rules require an unwieldy roadmap to be split into Parts. Here there are 15 layers and 1,894 targets in a single 10,382-line README.
- **Repair.** Scope each Part by its objects and end theorems, and cite HTT and HA by locator only where a claim needs one. Drop targets that only restate Remarks. Split into Parts, for example:
  1. model-categorical foundations (whatever R01 leaves here);
  2. fibrations and straightening;
  3. limits, Kan extensions and presentability;
  4. stable ∞-categories;
  5. ∞-topoi;
  6. HTT chapter 7.

## R03 (P1) — Suggested.lean is a catalogue whose milestones rest on `sorry`'d data

- **Location.** `Suggested.lean`:
  - `:242` `instance (S : SSet.{u}) : Category.{u} (Rigidification S) := sorry`;
  - `:246` and `:251`, its simplicial structure and `rigidification.map`;
  - `:308` `def IsCategoricalEquivalence … := EnrichedFunctor.IsEquivalence (hoEnriched.map f)`.
- **Claim.** Categorical equivalence, the root notion of the Conventions table, is defined through `sorry`'d data, and so is everything built on it. The gate counts 316 `sorry`'d data bodies, and the file has 7,283 lines against a limit of 5,000.
- **Witness.** Each of these milestones is stated about a `sorry` definition:
  - `joyal_spec` (`:6718`) uses `rigidificationAdjunction := sorry` (`:6377`);
  - `markedStraightening_spec` (`:6789`) uses `:3012`;
  - `hoFunctor_isTriangulated` (`:6897`) uses the shift at `:4618`;
  - `isProperGeometricMorphism_sheafOnSpace_map` (`:6921`) uses `:5830`.
- **Repair.** Rewrite the file as the acceptance test:
  - state only the headline theorems that are statable at the pins, with small real-bodied definitions;
  - name each milestone that is not statable, and the carrier it lacks, in the module docstring;
  - move every other definition to a README target;
  - stay under 5,000 lines, with no `sorry` in any `def`, `abbrev` or `instance`.

  For example, HTT 2.4.6.1 is statable if categorical equivalence is defined by `hoFunctor.obj ((ihom B).obj C) ⥤ hoFunctor.obj ((ihom A).obj C)` being an equivalence for every quasicategory `C`. With that definition `X = Λ[2,1]` is decidably not fibrant.

## R04 (P1) — Two `sorry`'d instances in Suggested.lean are false

- **Location.** `Suggested.lean:4423`: `instance quasicategory_subcomplex {X : SSet.{u}} [Quasicategory X] (A : X.Subcomplex) : Quasicategory (A : SSet.{u}) := sorry`. Also `:4418`, `quasicategory_fibre`, which has no inner-fibration hypothesis.
- **Claim.** Every subcomplex of a quasicategory, and every fibre of any map out of one, is a quasicategory.
- **Witness.** A probe was elaborated at this head. With `import TauCetiRoadmap.HigherToposTheory.Suggested`, `infer_instance` proves `SSet.Quasicategory (Λ[2, 1] : SSet.Subcomplex Δ[2])`. But `Λ[2,1]` has no 2-simplex with faces `01` and `12`, so its identity horn has no filler. The fibre of `Δ[2] → Δ[2]/Λ[2,1]` is `Λ[2,1]`.
- **Repair.** Delete both instances as part of R03. If they are kept:
  - `quasicategory_fibre` needs `[InnerFibration p]`;
  - `quasicategory_subcomplex` must be restricted to full subcomplexes (Tau Ceti `SSet.fullEnhancedSubcategory`).

  On the witness, `Λ[2,1]` is not full, since vertices 0 and 2 span the edge `02`, which it lacks.

## R05 (P1) — False claim about degenerate simplices in "Homotopy relative to the boundary"

- **Location.** `README.md:3168`: "two simplices with the same boundary are related exactly when they are equivalent objects of the fibre … A degenerate simplex is related only to itself."
- **Claim.** A degenerate simplex is related to no other simplex. HTT proves less: two related degenerate simplices are equal (LurieHTT lines 5171–5173, proof of Proposition 2.3.3.8, PDF p. 122).
- **Witness.** Take `X = Sing([0,1])` over `Δ[0]` with `n = 1`. The constant path at 0 and `γ(t) = t(1−t)` have the same boundary `(0,0)`. The fibre is the contractible loop space, so the two simplices are related.
- **Repair.** Replace the last sentence with: "Two related degenerate simplices are equal, so each class contains at most one degenerate simplex." On the witness, the class of `γ` contains exactly one degenerate simplex.

## R06 (P2) — Plans to redefine library declarations that other roadmaps own

- **Location.** `README.md:174–188`, the table "Redefinitions of Tau Ceti declarations". `README.md:60`: "A Tau Ceti declaration that disagrees with the table is redefined". `Suggested.lean:77–84` declares a second scoped `CategoryWithWeakEquivalences SSet` instance.
- **Claim.** The README plans to redefine or rename the following Tau Ceti declarations:
  - the weak equivalences of `SSet`;
  - `SSet.QCat.IsCategoricalEquivalence`;
  - `SSet.IsWeaklyContractible`, `SSet.IsFullyFaithful` and `SSet.CategoricalFibration`.
- **Witness.** At the pin, `TauCeti/AlgebraicTopology/SimplicialSet/WeakEquivalence.lean:60` defines the weak equivalences as `TauCeti.TopCat.weakEquivalences.inverseImage toTop`. That is GeneralizedCohomology G2.1's definition. Two scoped instances of one class conflict when both namespaces are opened.
- **Repair.** Keep the library definitions. State Kerodon 3.1.7.12 as an `iff` target, citing G2.1's Kan-group criterion. Delete the redefinitions table and the second instance. On `∂Δ[1] → Δ[1]` with `Z = Δ[0] ⊔ Δ[0]`, both definitions reject the map: 2 components against 1, and 2 classes against 4.

## R07 (P2) — Supplier contracts cite Tau Ceti declarations that do not exist at the pin

- **Location.** `README.md:148`: "The baseline is Mathlib `1b1ccf4…` and Tau Ceti `7ac4960…`". `README.md:162–172` lists the "From Tau Ceti" names, and `Suggested.lean:136–217` copies some of them locally.
- **Claim.** The contracts describe a Tau Ceti revision other than the pin `2fd255d`.
- **Witness.** A grep of the pinned Tau Ceti and Mathlib trees, rerun this round, finds 0 occurrences of each of `IsTerminalVertex`, `LeftFibration`, `CatInftyΔ`, `IsDwyerKanEquivalence` and `markedAnodyneExtensions`. The only `IsWeakHomotopyEquivalence` there is `ContinuousMap.IsWeakHomotopyEquivalence`.
- **Repair.** Cite only declarations that exist at the pins. Anything newer becomes a target here, or is cited from its owner (R01). Delete the local copies and their "deleted when the pin is bumped" note. Afterwards, `#check` on each contract name must succeed at the pin.

## R08 (P3) — README shape: missing sections, too few Checks, indecisive "propose"

- **Location.** The whole README:
  - no layer ends with `### Examples` or `### Dependencies` (0 of 15), and there is no `## Downstream consumers`;
  - there are 272 `**Checks.**` blocks for 423 `*Lean:*` entries, and 169 of those blocks have a single Check;
  - "propose" appears 221 times.

  Examples: `README.md:668` (A.2.8.1) and `README.md:688` (Reedy categories, two Checks).
- **Claim.** This departs from the required shape: every definition needs at least three discriminating Checks, every layer needs its examples and dependencies, and every definition must be stated definitely.
- **Witness.** A.2.8.1's only Check (J discrete) also holds for the wrong definition "injective fibrations = levelwise fibrations".
- **Repair.**
  - Add `### Examples` and `### Dependencies` to every layer, and a `## Downstream consumers` section.
  - Give each definition at least three Checks, including a non-example. For A.2.8.1: with J = `[1]`, the diagram `Δ[0] ⊔ Δ[0] → Δ[0]` is injectively but not projectively cofibrant.
  - Write "Define `X`" instead of "propose `X`".

## R09 (P3) — Process residue, pull-request numbers and dated text

- **Location.**
  - `README.md:160` ("Mathlib work in progress", with mathlib4 PR numbers);
  - `:951` ("Follow Mathlib PR #44464");
  - `:2527, 3645, 3655` (Tau Ceti PR numbers);
  - `:1599` ("to be checked against the paper");
  - `:738` ("TODO");
  - `:115` ("as of 5 November 2026");
  - `:66, 183` ("to be renamed");
  - "Tau Ceti main" (63 occurrences), and `Suggested.lean`'s "*(added)*" markers.
- **Claim.** These are process words and dated statements. The README must be timeless and must not cite pull-request numbers.
- **Witness.** The gate rules `prnum` (7 hits) and `residue` (5 hits). Four of the residue hits are genuine; the hit at `README.md:9839` is a false positive.
- **Repair.**
  - Delete the PR numbers and the work-in-progress paragraph.
  - State the Dwyer–Kan route definitely, or remove it.
  - Drop the dates and "to be renamed".
  - Cite Tau Ceti at the pin, not "main".

## R10 (P3) — Gate `statement-hygiene` (14 hits)

- **Location.** In `Suggested.lean`:
  - choice in `def` bodies: `:1941`, `:5668`, `:5952`, `:6295`, `:6303`;
  - `haveI` in theorem signatures: `:6725–6728` (`joyal_spec`) and `:6734–6737`;
  - `:7181`: `sieve_slice_equiv` concludes `Nonempty (… ≃ …)`.
- **Claim / witness.** The gate rule names each hit at P3.
- **Repair.** Do what the gate says: take the chosen datum as an argument, use instance binders, and state the canonical map with `IsIso` or rename the theorem `nonempty_*`. Hits on declarations that R03's rewrite deletes need nothing more.

## R11 (P3) — Gate `readme-ids-missing` (72 hits, some false positives)

- **Location.** These are backticked names that the README presents as its own but that `Suggested.lean` does not declare. Examples:
  - `SSet.nerve_iff_uniqueInnerFillers` (`README.md:2147`);
  - `SSet.TStructure.heart_discrete`;
  - `SimplicialModelCategory.nonempty_iff`.
- **Claim / witness.** At least 12 of the 72 are real library names that the README labels as library names, so the gate is wrong about them. Two examples:
  - `MorphismProperty.llp_isStableUnderCoproductsOfShape` (`Mathlib/CategoryTheory/MorphismProperty/LiftingProperty.lean:86`);
  - `SSet.rlp_monomorphisms_iff` (`TauCeti/AlgebraicTopology/SimplicialSet/TrivialFibration.lean:171`).

  The others are this roadmap's own names with no declaration.
- **Repair.** State those API bullets and Checks in prose without the Lean name. Never add declarations just to satisfy the gate.

## R12 (P3) — Padding in Suggested.lean

- **Location.**
  - `Suggested.lean:7198`: `instance quasicategory_ihom (K C : SSet.{v}) [Quasicategory C] : Quasicategory ((ihom K).obj C) := sorry`;
  - 44 transport lemmas proved by `rfl`, such as `:6558`;
  - the definitional conjuncts of `modelCategoryQuillen_spec` (`:6656`).
- **Claim.** These restate the library or a definition.
- **Witness.** The probe `example (K C : SSet.{1}) [SSet.Quasicategory C] : SSet.Quasicategory ((ihom K).obj C) := by infer_instance` succeeds at the pin, rerun this round. The instance comes from `Mathlib/AlgebraicTopology/SimplicialSet/AnodyneExtensions/Inner/PushoutProduct.lean:157`.
- **Repair.** Delete them from `Suggested.lean`; the README keeps the statements.

## R13 (P3) — Milestone "Proper base change" points at the wrong statement

- **Location.** `README.md:240`: "| Proper base change | HTT 7.3.1.16 | L12 |". `Suggested.lean:6917–6924` gives the same docstring.
- **Claim.** HTT 7.3.1.16 says that `p_*` is proper (LurieHTT line 35041, PDF p. 773). The nonabelian proper base change theorem is Corollary 7.3.1.18 (LurieHTT line 35071, PDF p. 774).
- **Witness.** HTT's own title for 7.3.1.18 is "Nonabelian Proper Base Change Theorem".
- **Repair.** Either rename the milestone "`p_*` is a proper geometric morphism (HTT 7.3.1.16)", or make 7.3.1.18 the milestone.

## Previous findings

- R01 — not repaired: `README.md:50` still reads "BordismFormalGroups, EnhancedDerivedSheaves and DerivedModuleAlgebra build on this material; they take the notions of the Conventions table from here rather than defining their own."
- R02 — not repaired: `README.md:30` still puts every definition and result of HTT and HA chapter 1 in scope; `:220` still totals 1894 targets in 15 layers.
- R03 — not repaired: `Suggested.lean:242` is still `instance (S : SSet.{u}) : Category.{u} (Rigidification S) := sorry`; the gate counts sorry-data = 316 and lean-lines = 7283.
- R04 — not repaired: `Suggested.lean:4423`, `quasicategory_subcomplex … := sorry`, is unchanged; `infer_instance` now proves `Quasicategory Λ[2,1]` at this head.
- R05 — not repaired: `README.md:3168` still ends "A degenerate simplex is related only to itself."
- R06 — not repaired: `README.md:60` still reads "A Tau Ceti declaration that disagrees with the table is redefined"; the table at `:174–188` is unchanged.
- R07 — not repaired: `README.md:148` still gives the baseline as Tau Ceti `7ac4960…`, against the pin `2fd255d`.
- R08 — not repaired: still 0 of 15 layers with `### Examples`/`### Dependencies`, no `## Downstream consumers`, and 221 occurrences of "propose".
- R09 — not repaired: gate `prnum` 7 and `residue` 5. `README.md:951` still reads "Follow Mathlib PR #44464".
- R10 — not repaired: gate `statement-hygiene` 14, at the same lines.
- R11 — not repaired: gate `readme-ids-missing` 72, the same list.
- R12 — not repaired: `Suggested.lean:7198`, `quasicategory_ihom … := sorry`, is unchanged.
- R13 — not repaired: `README.md:240` still reads "| Proper base change | HTT 7.3.1.16 | L12 |".

## Verified sound

**What changed.** `git diff --stat f522659 2176cc4` is empty. Both commits have the tree `68040922` and the parent `eaf17b10`. `git diff --stat origin/main...HEAD` outside the folder is empty. The pins in `lake-manifest.json` are unchanged: Mathlib `1b1ccf4`, Tau Ceti `2fd255d`.

Main moved from `eaf17b1` to `2083308` (96 commits). In GeneralizedCohomology, BordismFormalGroups, EnhancedDerivedSheaves and DerivedModuleAlgebra, only `EnhancedDerivedSheaves/PROGRESS.md` and `EnhancedDerivedSheaves/STATUS.md` changed. R01's witness lines were reread at `2083308`.

**Gate (rerun at this head).** Counts are identical to the worker's: prnum 7, sorry-data 316, residue 5, lean-lines 1, statement-hygiene 14, readme-ids-missing 72. Every other check is 0, except `depcheck=1`. That hit is "NOT IN ORDER: HigherToposTheory" against the default order. It is not a finding, because the candidate order lists this roadmap at line 398. Each failing rule is carried as a finding: sorry-data and lean-lines as R03, prnum and residue as R09, statement-hygiene as R10, readme-ids-missing as R11.

**Dependency check.** Run against the candidate order, it printed `depcheck: 239 roadmaps, 2353 edges, 0 problem(s)`. There are no UPWARD or CYCLE lines.

**Elaboration.** `lake env lean TauCetiRoadmap/HigherToposTheory/Suggested.lean` exits 0 in 30 s, with 396 "declaration uses `sorry`" warnings and no other warning or error. All 23 `TauCeti.*` imports have object files at the pin.

**Probes** (scratch copies, not in the folder):
- R12's `infer_instance` probe for `ihom` succeeds.
- R04's probe, importing `TauCetiRoadmap.HigherToposTheory.Suggested`, derives `Quasicategory Λ[2,1]`; `Quasicategory Δ[2]` comes from `SSet.stdSimplex.quasicategory 2`.

**Signatures.** The file is byte-identical, so the worker's `signatures.md` (1,017 elaborated types) is current. I did not re-`#check` all declarations, because R03 requires a rewrite.

**Citations and overlaps.**
- The citation resolver reports "Cross-roadmap citations found nowhere: None" against main `2083308` and 466 open heads.
- `overlaps.md` reports no other open pull request that changes this roadmap, no dropped ids, and no ids that only an open revision defines.
- LocallyPresentableCategories, read at its head, still cedes Lurie's presentability, the small object argument and combinatorial model categories to this roadmap's F1.1, F1.3 and F1.6 (its README lines 81–83).

**Library declarations reopened at the pins.**
- `HomotopicalAlgebra.ModelCategory` (`Mathlib/AlgebraicTopology/ModelCategory/Basic.lean:43–55`, `cm1a : HasFiniteLimits`, `cm1b : HasFiniteColimits`). This confirms the README's statement that Lurie's model categories also ask for `[HasLimits C] [HasColimits C]`.
- `HomotopicalAlgebra.ReedyStructure` (`Mathlib/AlgebraicTopology/Reedy/Basic.lean:45`, fields `deg`, `lt₁`, `lt₂`, `nonempty_unique`, with `[WellFoundedLT α]`).
- `SSet.modelCategoryQuillen.instCategoryWithWeakEquivalences` (`TauCeti/AlgebraicTopology/SimplicialSet/WeakEquivalence.lean:58–60`).
- The `ihom` quasicategory instance (`PushoutProduct.lean:151, 157`).

**Seeded sample (15 targets, untouched text).** These were checked against the HTT author PDF of 9 April 2017 (LurieHTT) and the HA PDF of 18 September 2017 (LurieHA), fetched through the sources service from math.ias.edu/~lurie. Each theorem number, PDF page and hypothesis matches the README.
1. Model categories: HTT A.2.1.1, LurieHTT line 37591, p. 828; small limits and colimits.
2. Reedy categories: HTT A.2.9.1, line 38823, p. 853. The README's characterization is right in both directions (table).
3. Nerves: HTT 1.1.2.2, line 920, p. 27.
4. Unstraightening: §2.2.1, line 3798, p. 92. Lurie defines it as the right adjoint; the README's simplexwise formula is that adjoint.
5. HTT 2.2.3.11: line 4208, p. 101. Lurie's `(Set_Δ^{C[S]op})°` is the projectively fibrant-cofibrant objects.
6. HTT 2.4.4.6: line 6472, p. 150.
7. HTT 3.2.1.7–3.2.1.11: lines 8247–8305, pp. 190–192. 3.2.1.9's final-vertex hypothesis matches. 3.2.1.10's "edge sets containing the degenerate edges" is implicit in the README's marked simplicial sets.
8. Cylinder of δ: proof of HTT 4.3.3.10, lines 13800–13854, pp. 309–310. `S′ = N(E)`, `u′` is made a cofibration by a product with a contractible Kan complex, and the endpoints are swapped by the op.
9. HTT 4.4.5.20: line 14703, p. 328.
10. HTT 5.1.4.3–5.1.4.4: lines 15266–15287, p. 340.
11. HTT 5.5.4.14 (3) ⇒ (1): line 22544, pp. 498–500.
12. HA 1.1.2.9: LurieHA line 889, pp. 24–25.
13. HA 1.2.4.6: LurieHA line 2687, pp. 69–70, and Warning 1.2.4.8 (LurieHA line 2737).
14. HTT 6.1.4.3: line 25993, p. 575.
15. HTT 7.1.2.1: line 32221, pp. 710–711. The README's direction `Sing_X(Y,U) ⟶ Sing_X(Z,U)` is right, and it flags Lurie's reversed arrow (Source issues).

**Remarks on untouched text** (not findings of this incremental review):
- The Reedy (`README.md:688`) and Model categories (`:439`) Check blocks have two Checks, or name Lean counterparts ("propose"). This is R08's class.
- Covering dimension has two owners in open work. The AlgebraicKTheory pull request (#1142, merge order line 15) defines `HasCoveringDimensionLE` in its §4.3 (its README line 466). It also says "HigherToposTheory consumes the covering-dimension predicate of 4.3" (its README line 722). This README defines `TopologicalSpace.HasCoveringDimLE` itself and says no other roadmap supplies it (`README.md:9701, 9973`). A resubmission should cite AlgebraicKTheory §4.3.

**Adversarial table.** Rows marked (r1) are carried from the previous report for statements this head leaves untouched; their values are as computed there. ✓ means the computed values agree with the statement; ✗ marks a defect.

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| Model categories (A.2.1.1; `:435`) | C = FinSet with the trivial structure; C = SSet (Kan–Quillen) | FinSet: finite (co)limits ⇒ Mathlib `ModelCategory` holds; an ℕ-indexed coproduct of points is missing ⇒ Lurie's (1) and `[HasColimits C]` both fail. SSet: both hold | ✓ | — |
| Reedy categories (A.2.9.1; `:682`) | J = B(ℤ/2) with W₁ = all, W₂ = ids; J = [1] with W₂ = all, deg = id | B(ℤ/2): the non-identity σ ∈ W₁ forces deg X < deg X ⇒ no `ReedyStructure`; Lurie (1): σ is an iso ≠ id ⇒ not Reedy. [1]: 0 ≺₀ 1 and deg 0 < deg 1 ⇒ both Reedy | ✓ | — |
| Reedy characterization (`:686`), ⇐ | ≺₀ well-founded, no non-identity W-endomorphism | The rank of the transitive closure of ≺₀ into `Ordinal` (`LinearOrder`, `OrderBot`, `SuccOrder`, `WellFoundedLT`) is a degree: a non-identity W₁ map X → Y with X ≠ Y gives Y ≺₀ X | ✓ | — |
| Reedy Check "isos are identities" | f iso, f = w₂w₁ through Z | id_X = (g₂u₂)(u₁f₁) after refactoring g₁f₂ ⇒ by uniqueness u₁f₁ = id with u₁ : Z → X, so deg X ≤ deg Z ≤ deg X ⇒ f₁ = id; symmetrically f₂ = id | ✓ | — |
| Nerves (1.1.2.2; `:2147`) | K = Λ[2,1]; K = ∂Δ[2]; N(B(ℤ/2)) | Λ[2,1]: the identity inner horn has 0 fillers; ∂Δ[2]: 0 fillers (no 2-simplex); N(BG) outer horn Λ[2,0]: exactly 1 filler (g∘f⁻¹) | ✓ | — |
| Unstraightening (§2.2.1; `:2868`) | S = Δ[0], C = ∗, n = 0 | `(Un F)_0 = Hom(St(Δ[0]), F) = Hom(Δ[0], F) = F_0`, since `Map_{C[Δ[1]]}(0,1) = Δ[0]` | ✓ | — |
| HTT 2.2.3.11 (`:2964`) | S = ∅; S = Δ[0] | ∅: each side has one object; Δ[0]: projectively fibrant-cofibrant objects = Kan complexes = RFib(Δ[0]) | ✓ | — |
| HTT 2.4.4.6 (`:3490`) | `Δ[1] → Δ[0]`; `N(contractible groupoid on 2 objects) → Δ[0]` | First: not an equivalence (0→1 not invertible) and the lift of (1,0) against ∂Δ[1] → Δ[1] fails ⇒ both false. Second: both true | ✓ | — |
| HTT 3.2.1.8 (`:3863`), n = 0 | E = all edges of Δ[1] | B = {1}; `{1} ⊆ (Δ[1])♯` is the n = 1 generator of HTT 3.1.1.1 ⇒ marked anodyne | ✓ | — |
| HTT 3.2.1.10 | X = Δ[1], E = degenerate edges, E′ = all edges | id : Δ[1] → Δ[1] inverts E but not 0→1 ⇒ (2) false; Δ[1]♭ → Δ[1]♯ is not a Cartesian trivial cofibration ⇒ (1) false | ✓ | — |
| Cylinder of δ (`:4735`) | S = X = Y = Δ[0], δ = id | `M(δ) = Δ[1] ⊔_{Δ[0]} Δ[0] = Δ[1]`; M = Δ[1] → Δ[0] × Δ[1] (identity, coCartesian); fibre maps Δ[0] → Δ[0] are equivalences | ✓ | — |
| HTT 4.4.5.20 (`:4972`) | C = N(Set), X = {a,b}, e = const_a | e∘e = e strictly; Map(X,X) discrete ⇒ h = id and σ commutes; Idem → N(Set) via the functor on h(Idem) ⇒ both sides true | ✓ | — |
| HTT 5.1.4.3–5.1.4.4 (`:5034`) | K = ∅; f = id | `C_{/∅} = C`; for f = id, `C ×_C C_{/p} = C_{/p}`, and the identity is an idempotent completion | ✓ | — |
| HTT 5.5.4.14 (3)⇒(1) (`:6329`) | S = the equivalences of C | Generated by ∅ ⇒ small generation; D ≃ C (identity edges), accessible since C is presentable | ✓ | — |
| HA 1.1.2.9 (`:6861`) | C = Δ[0]; C = N(Ab) | Δ[0]: pointed, Σ = id; hC trivial, additive; `X ⊔ Y = 0 = cofib(0→0)`. N(Ab): Σℤ = cofib(ℤ→0) = 0 ⇒ the hypothesis fails, as it must | ✓ | — |
| HA 1.2.4.6 (`:7380`) | R = ℤ×ℤ; C = the objects of `D^perf(R)` with K₀-class in ℤ(1,1) (Thomason); C = `D^perf(R)` | e = (1,0) on R: its image has class (1,0) ∉ ℤ(1,1) ⇒ e splits neither in hC nor in C, both sides false; `D^perf(R)`: both true | ✓ | — |
| HTT 6.1.4.3 (`:8568`) | f = id; f constant at a terminal object | f∘U = U; the constant functor preserves pullbacks ⇒ left exact at U₀, and the constant object is a groupoid | ✓ | — |
| HTT 7.1.2.1 (`:9732`, `:9749`) | X = pt, B = {X} | `Sing_X(X,U)_n` is a single element ⇒ every object is fibrant; weak equivalences: Sing(Y) → Sing(Z) a homotopy equivalence (Quillen). Covariant direction confirmed; LurieHTT lines 32234 and 32244 reverse it | ✓ | errata |
| `quasicategory_subcomplex` (`:4423`), probe | Λ[2,1] ⊆ Δ[2] | `infer_instance` proves `Quasicategory Λ[2,1]` at this head; the true value is no filler for the identity horn | ✗ | R04 |
| `quasicategory_ihom` (`:7198`), probe | K, C : SSet.{1} | `infer_instance` closes it without Suggested.lean | padding | R12 |
| A.2.8.1 injective/projective classes (r1) | J = {a,b} discrete; J = ∅ | test map `(id, j)` ⇒ injective fibrations = levelwise fibrations; J = ∅: all classes = {id} | ✓ | R08 Checks |
| Weak homotopy equivalence (Kerodon 3.1.7.12; `:77`) (r1) | `∂Δ[1]→Δ[1]`, Z = `Δ[0]⊔Δ[0]`; `∅→Δ[0]`, Z = ∅ | 2 classes vs 4 ⇒ not bijective; `π₀Fun(Δ[0],∅) = ∅` vs `π₀Fun(∅,∅) = {∗}` | ✓ | — |
| Straightening St_φ (§2.2.1) (r1) | X = ∅; S = Δ[0] | `Map_M(c,v) = ∅` ⇒ empty functor; S = Δ[0]: `St X = |X|_{Q•}` | ✓ | — |
| Homotopy rel boundary (`:3168`) (r1) | `Sing[0,1]`, n = 1, const₀ vs `t(1−t)` | same boundary (0,0); contractible loop space ⇒ related; one degenerate, one not | ✗ | R05 |
| Remark 2.3.4.4 (r1) | n = 0, m = 2, C = N(0<1<2); m = 1 | 10 vs 10 maps ⇒ bijective; m = 1: 4 vs 3 ⇒ `m > n+1` is sharp | ✓ | — |
| Cor. 2.3.4.8 (r1) | n = −1, C = ∅; n = 0, C = X = Δ[1] | `Fun(X,∅)` = ∅ or Δ[0]; `Fun(Δ[1],Δ[1])` = nerve of a 3-chain | ✓ | — |
| n-category definition (r1) | n = −1, C = `Δ[0]⊔Δ[0]`; contractible 2-object groupoid | not (−1); a 1-category, not a 0-category | ✓ | — |
| Lemma 2.4.2.7 (r1) | `id : Δ[2] → Δ[2]` | all edges Cartesian; (1)–(3) all true | ✓ | — |
| Lemmas 5.1.6.6–7 (r1) | p : ∅ → C | `C_{/p} = C`; the two notions agree | ✓ | — |
| Lemmas 5.4.4.1–2 (r1) | K = ∅; κ = ω < τ | RLP for `∅ ⊆ Δ[0]` ⇔ fibres nonempty; τ uncountable | ✓ | — |
| 5.5.3.5/6/8 (r1) | empty family; K = ∅ | product = Δ[0]; `Fun(∅,C) = Δ[0]` | ✓ | — |
| HA 1.1.3.1 (r1) | K = ∅; K = Δ[0] | `Fun(∅,C) = Δ[0]` stable; `Fun(Δ[0],C) = C` | ✓ | — |
| HA 1.3.2.16 (r1) | `0 → M′`; `ℤ →2 ℤ` | `N′ = N ⊕ M′`; non-split: ℤ/2 vs the cone ⇒ hypothesis needed | ✓ | — |
| HA 1.3.2.19 (∗) (r1) | ℤ/2 in degree 0; ℤ in degree −1 | `H₀ = ℤ/2`, `H₁ = 0`; 0 on both sides | ✓ | — |
| HTT 6.1.0.1 (r1) | Type u; Grp | Type: (A)–(C) hold; Grp: colimits not universal | ✓ | — |
| HTT 7.3.1.14 vs `IsProperMap` (r1) | base change along g | closed map restricted to a full preimage is closed ⇒ agree | ✓ | — |
| HTT 7.3.1.16 (r1) | X = ∅; Sierpiński | ∅ ↪ Y closed, `p_*` proper; Sierpiński not T35, excluded | ✓ | — |
| `PowLT` Check (`:541`) (r1) | κ = ℵ₀, ℵ₁, inaccessible | finite^finite < ℵ₀; `2^ℵ₀ ≥ ℵ₁`; `τ′^κ′ < κ` | ✓ | — |
| Weak saturation Check (F1.1) (r1) | `{∅ → ∗}` in Type | every injection; `2 → 1` excluded | ✓ | — |
| t-structure dictionary (`:834–853`) (r1) | X ∈ `D_{≥0}`, shift 1 | `X⟦1⟧ ∈ le(−1) = D_{≥1}` | ✓ | — |
| `IsCategoricalEquivalence` (`:308`) (r1) | f = 𝟙 Δ[0] | value fixed by a `sorry` | ✗ | R03 |
| `joyal_isFibrant_iff` (`:6742`, HTT 2.4.6.1 headline) (r1) | X = Λ[2,1] | intended: not fibrant; Lean: undetermined | ✗ | R03 |
| `hoFunctor_isTriangulated` (`:6897`, HA 1.1.2.14 headline) (r1) | C = Δ[0] | intended: trivial; Lean: shift `:= sorry` | ✗ | R03 |
| `isProperGeometricMorphism_sheafOnSpace_map` (`:6921`) (r1) | X = Y = pt | intended: `p_* = id`; Lean: `sheafOnSpace.map := sorry` | ✗ | R03 |
| `modelCategoryQuillen_spec` (`:6656`, Kan–Quillen headline) (r1) | `Δ[0]⊔Δ[0] → Δ[0]` | Kan fibration, not a w.h.e.; conjuncts 1–3 rfl | ✓ / padding | R12 |
| `quasicategory_fibre` (`:4418`) (r1) | `Δ[2] → Δ[2]/Λ[2,1]` | fibre = Λ[2,1] | ✗ | R04 |
| Milestone "Proper base change" (r1) | locator | 7.3.1.16 = `p_*` proper; 7.3.1.18 = base change | ✗ | R13 |

**Headline theorems.** The 15 milestones (`README.md:224–240`, the milestones table) are as before. Their Lean forms in `Suggested.lean` rest on `sorry`'d carriers (R03), and the rows above for 2.4.6.1, HA 1.1.2.14, Kan–Quillen and 7.3.1.16 stand.

## Not verifiable

- None of the sampled statements: HTT and HA were read from the author's PDFs.
- Ownership by object was checked in three ways: against main; against the five closest open roadmaps in `overlaps.md`; and by a search of every open head for this roadmap's name, which found AlgebraicKTheory and LocallyPresentableCategories. It was not checked by object against all 466 open roadmap pull requests.

## Source issues

- **Misprint** in LurieHTT at Proposition 7.1.2.1, printed p. 693: in conditions (W) and (F), the source writes the map induced by `Y → Z` over X as going from `Sing_X(Z, U)` to `Sing_X(Y, U)`; it should go from `Sing_X(Y, U)` to `Sing_X(Z, U)`, since `Sing_X(−, U)` is covariant; affects nothing.
