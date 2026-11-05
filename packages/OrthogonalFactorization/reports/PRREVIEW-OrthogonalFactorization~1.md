# Review of OrthogonalFactorization (pull request #341 at d6490d0)

**Verdict:** needs changes

The mathematics is sound: every statement I computed on degenerate instances holds, the headline theorems (the codiagonal criterion, the Galois connection, L ⊓ R = isomorphisms, uniqueness of factorizations, the arrow reflection, the cellular description without retracts, filtered colimits in the right class, the comparison with `isLocal`) agree with Anel's paper where it covers them and with the pinned Mathlib declarations they build on. What blocks acceptance is the form of the deliverables: `Suggested.lean` carries 23 sorry'd data declarations and lives in Mathlib's namespace, where a sibling open pull request declares the same fully qualified names, and the README is not in the roadmap shape (no supplier contracts, no layers, no `*Needs:*` lines, no Checks, almost no locators) and names an unmerged Mathlib pull request throughout. The gate fails on four checks.

## R01 (P1) — Twenty-three declarations are sorry'd data

Location: `TauCetiRoadmap/OrthogonalFactorization/Suggested.lean` lines 100, 180, 300–332, 370, 464, 470, 476, 483, 488, 495, 505 (gate check `sorry-data=23`).

Claim: sixteen `instance … := sorry` (for example line 300 `instance leftOrthogonal_isMultiplicative : T.leftOrthogonal.IsMultiplicative := sorry`) and five `noncomputable def … := sorry` (`arrowReflection`, `arrowReflectionAdjunction`, `reflective_arrows_ι`, `coreflective_arrows_ι`, `ObjectProperty.reflective_ιOfLE_inf`).

Witness: the gate rule "no `sorry` in the body of a `def`, `abbrev`, `instance` or `opaque`"; `Reflective` is data at the pin (`Mathlib/CategoryTheory/Adjunction/Reflective.lean:38` has fields `L` and `adj`), so lines 483 and 488 are sorry'd functors.

Repair, tested on line 483: every `instance … := sorry` becomes `theorem … := sorry` (they are all `Prop`s). The reflection headline is stated through the `Prop` `Functor.IsRightAdjoint` (`Mathlib/CategoryTheory/Adjunction/Basic.lean:138`): `theorem isRightAdjoint_arrows_ι (L R) [IsOrthogonalPair L R] [HasFactorization L R] : R.arrows.ι.IsRightAdjoint := sorry`, dually `L.arrows.ι.IsLeftAdjoint`, and F3 as `(ObjectProperty.ιOfLE (inf_le_right : D ⊓ E ≤ E)).IsRightAdjoint` under the hypothesis `h` on an arbitrary `adj : L ⊣ D.ι`. The functors `arrowReflection`, `arrowReflectionAdjunction` are README targets with their intended signatures, not Lean declarations.

## R02 (P2) — The file declares its objects in Mathlib's namespace, and a sibling pull request declares the same fully qualified names

Location: `Suggested.lean` line 30 `namespace CategoryTheory`, line 244 `namespace MorphismProperty`; declarations such as `CategoryTheory.HasAtMostOneLiftingProperty` (line 73) and `CategoryTheory.MorphismProperty.leftOrthogonal` (line 251).

Claim: the required form is `namespace TauCetiRoadmap.OrthogonalFactorization`. As written, the file owns names inside Mathlib's own namespace, and the open roadmap pull request CommRingFactorizationSystems (`TauCetiRoadmap/CommRingFactorizationSystems/Suggested.lean` lines 45–65 at its head) declares `CategoryTheory.HasAtMostOneLiftingProperty`, `CategoryTheory.HasUniqueLiftingProperty`, `CategoryTheory.MorphismProperty.leftOrthogonal`, `rightOrthogonal`, `IsOrthogonalFactorizationSystem`, `cellular`, `localObjects` with the same fully qualified names "as stand-ins". Two `Suggested.lean` files that declare one fully qualified name cannot both be imported, and when Mathlib's unique-lifting file lands under these names the file stops building against `import Mathlib`.

Witness: `roadmaps grep --lean-only 'class HasAtMostOneLiftingProperty'` returns both files; at the pin (Mathlib `6b7abb3`, 2026-09-28) `Mathlib/CategoryTheory/LiftingProperties/` has no `Unique.lean`, so the build passes today only by timing.

Repair: wrap the file in `namespace TauCetiRoadmap.OrthogonalFactorization` with `open CategoryTheory Limits MorphismProperty`, and write the operators applicatively (`leftOrthogonal T`, `rightOrthogonal T`) or define them as `MorphismProperty.leftOrthogonal` inside that namespace and refer to them by their full name, since dot notation `T.leftOrthogonal` only resolves against `CategoryTheory.MorphismProperty`. The consumer roadmap then cites `TauCetiRoadmap.OrthogonalFactorization` by name and section; its stand-ins are its own review's concern.

## R03 (P3) — Process narrative: an unmerged Mathlib pull request is named five times, "In open review", "once the PR lands", "catalogue"

Location: README lines 15 ("open review (leanprover-community/mathlib4#43441) but not merged"), 89–96 ("**In open review, not yet merged.** … once the PR lands; until then it is built here"), 283, 289–290 ("Names and signatures in B1 follow mathlib4#43441 exactly"); `Suggested.lean` docstrings at lines 121 and 128; README line 426 ("The catalogue of operations"). Gate checks `prnum=1` and `residue=1`.

Claim: the README is not timeless; a reader a year from now sees which parts were pending upstream. The seeded target "In open review, not yet merged" is accurate today (the pull request page, fetched 2026-10-28, still reads "wants to merge", and every name the README lists is in it), but it is a process statement, not a mathematical one.

Repair: delete every pull-request reference; state once in `## Scope and ownership` that B1's names follow the pattern of Mathlib's `HasLiftingProperty` API (`of_comp_left`, `of_arrow_iso_left`, `RetractArrow.rightLiftingProperty`, `op`/`unop`) so that a later Mathlib version can replace it by an import, and nothing more. Replace "catalogue" at line 426 by "list". The `## Provenance` section is allowed as secondary, but "the author's `P` repository" names nothing a contributor can open; name the repository or drop the file map.

## R04 (P3) — The README is not in roadmap form: no supplier contracts, no layers, no `*Needs:*` lines, no Checks, no locators

Location: README lines 3 (`## Overview` instead of `**Summary.**`), 52 (`## What Mathlib already has (consume)`), 111 (`## Scope boundary`), 131 (`## Conventions, pinned up front`), 193–884 (`## Milestone A` … `## Milestone J` with `*Acceptance:*` and `*Depends on:*`), 914 (`## References`); no `## Exact supplier contracts`, `## How to read the build`, `## Layer k`, `### k.n`, `**Checks.**`, `### Examples`, `### Dependencies`, `## Downstream consumers`.

Claim: the definitions `HasAtMostOneLiftingProperty`, `HasUniqueLiftingProperty`, `leftOrthogonal`, `rightOrthogonal`, `IsOrthogonalPair`, `IsOrthogonalFactorizationSystem`, `arrows`, `codiagonalGenerators`, `orthogonalGenerators`, `cellular`, `localObjects` have no Checks list (the `*Acceptance:*` lines give at most two facts per milestone and none says what a wrong definition would get wrong). Of the roughly 140 targets only D3 carries a locator (anel2009 Definition 1, Lemma 2, Proposition 3; verified at the text's page 8–9). The References entry for Freyd and Kelly has no theorem or page, the two nLab entries no section, and the folder has no `sources.toml`. Line 19 names `CategoryTheory.ObjectProperty.Orthogonal`, which does not exist at the pin: the file `Mathlib/CategoryTheory/ObjectProperty/Orthogonal.lean` defines `ObjectProperty.rightOrthogonal` and `leftOrthogonal` (lines 38, 47) as "every map from a `P`-object is zero" in a category with zero morphisms, not an orthogonality "under `Hom`".

Witness: compare `TauCetiRoadmap/SchemeAndStackFoundations/README.md` on main (lines 46, 253, 295, 445, 463, with 259 `*Needs:*`/`**Checks.**` occurrences).

Repair: rewrite in the shape of the roadmaps on main, milestones becoming layers and `*Depends on:*` becoming per-target `*Needs:*` lines. Locators that Anel's paper supplies and the README does not use: B2 is anel2009 Lemma 5, p. 11; H5's "right cancellation and codiagonals" is Lemma 4, p. 10; D2's cancellation is Proposition 3(3), p. 9; D2/F2's limits in the arrow category is Proposition 3(4), p. 9; G3's `orthogonalGenerators_le_leftOrthogonal_rightOrthogonal` is Proposition 3(5), p. 9; G3's small-object route is §2.3, p. 13. Record anel2009 and Freyd–Kelly (as `uncertified`) in `sources.toml`; correct line 19 to name `ObjectProperty.leftOrthogonal`/`rightOrthogonal` and say what they are.

## R05 (P3) — 46 backticked names of the roadmap's own are not declared in `Suggested.lean`

Location: README, for example line 206 `MorphismProperty.sigmaMap_mem` is declared but lines 91–94 (`CommSq.uniqueLiftStruct`, `of_comp_left`, …), 334 (`IsPullback.hasAtMostOneLiftingProperty` companions), 373 (`transfiniteComposition.comp_ext`, declared under a different name at Lean line 207), 513 (`exists_comparison`), 571–572 (`restrictedReflector`, `restrictedReflectorAdjunction`), 777 (`of_isColimit_of_isCardinalPresentable`) are not. Gate check `readme-ids-missing=46`.

Claim: a backticked name of the roadmap's own is a claim that `Suggested.lean` declares it.

Repair: state each such API bullet in prose without the name (the gate rule forbids repairing by adding declarations). After R06 trims the Lean file to its headlines, most backticked names go the same way.

## R06 (P3) — `Suggested.lean` is an API catalogue: eleven declarations close in one term, two restate Mathlib, and the docstring says the file lists "suggested forms"

Location: `Suggested.lean` lines 10–13 ("The statements here suggest Lean forms for particular milestones"), and the declarations below.

Claim: on a copy elaborated with `lake env lean` at the pin, the following closed with the one term shown, so they are API lemmas, not headlines:

| line | declaration | closing term |
|---|---|---|
| 41 | `sigmaMap_mem` | `MorphismProperty.colimMap _ (fun ⟨j⟩ ↦ hf j)` (Mathlib `Limits.lean:610`; the README's "Mathlib has both halves of each input but neither conclusion" at line 196 is wrong for this item) |
| 104 | `HasUniqueLiftingProperty.mk'` | `{}` |
| 259 | `le_leftOrthogonal_iff_le_rightOrthogonal` | `⟨fun h _ _ g hg _ _ f hf ↦ h f hf g hg, fun h _ _ f hf _ _ g hg ↦ h g hg f hf⟩` |
| 264 | `le_leftOrthogonal_rightOrthogonal` | `fun _ _ f hf _ _ g hg ↦ hg f hf` |
| 280 | `leftOrthogonal_le_llp` | `fun _ _ f hf _ _ g hg ↦ (hf g hg).toHasLiftingProperty` |
| 287 | `rightOrthogonal_ofHoms_iff` | `⟨fun h i ↦ h _ ⟨i⟩, fun h _ _ _ ⟨i⟩ ↦ h i⟩` |
| 382 | `IsOrthogonalPair.left_isStableUnderCobaseChange` | `IsOrthogonalPair.left_eq (A := A) (B := B) ▸ inferInstance` |
| 420 | `MapFactorizationData.commSq` | `⟨by rw [fac.fac, fac'.fac]⟩` |
| 457 | `mem_toSet_iff_arrows` | `Iff.rfl` |
| 505 | `epimorphisms_hasOfPrecompProperty` | `⟨fun f g _ (h : Epi (f ≫ g)) ↦ epi_of_epi f g⟩` |
| 621 | `le_cellular` | `le_pushouts`, `le_coproducts`, `le_transfiniteCompositions` composed |

Also line 332 `leftOrthogonal_isStableUnderTransfiniteComposition`: Mathlib derives `IsStableUnderTransfiniteCompositionOfShape J` from `IsMultiplicative`, `RespectsIso` and colimit stability for every well-ordered shape (`Mathlib/CategoryTheory/MorphismProperty/TransfiniteComposition.lean:276`, instance at line 307 from `IsStableUnderFilteredColimits`), all of which D2 states for `leftOrthogonal`; the README's "from C3" at line 447 names the longer route, and C3's single-morphism targets (lines 207–238) are corollaries of the same lemma applied to the class of maps with at most one lift against `p`. The file has 103 declarations; the remaining D1 and D2 bare-form items (lines 268–329), the C1 instances, and the H1 lemmas (`cellular_monotone`, `cellular_respectsIso`) are API bullets of the README.

Repair: delete these from `Suggested.lean` (the README keeps each as a target or Check) and keep the headlines: `hasAtMostOneLiftingProperty_iff_codiagonal`, `HasUniqueLiftingProperty.of_isLimit`, `IsOrthogonalPair.inf_eq_isomorphisms`, `MapFactorizationData.exists_iso`, the reflection as `IsRightAdjoint` (R01), `rightOrthogonal_eq_rlp_orthogonalGenerators`, `hasSmallObjectArgument_orthogonalGenerators`, `generatedOrthogonalFactorizationSystem`, `leftOrthogonal_rightOrthogonal_eq_cellular`, `leftOrthogonal_rightOrthogonal_eq_cellular_of_epi`, `leftOrthogonal_rightOrthogonal_le_epimorphisms`, `rightOrthogonal_isStableUnderColimitsOfShape_of_presentable`, `localObjects_rightOrthogonal_eq_isLocal`, `localObjects_rlp_of_epi_of_liftsAlong`, `localObjects_of_llp_of_epi`, `leftOrthogonal_of_isColimit_under`, `eq_of_hasFactorization_of_le`, with the few definitions they need. Rewrite the module docstring to the acceptance-test form (the roadmap is `README.md`; this file states the headline theorems against the pins; none is unstatable).

## R07 (P3) — A2's `forget_under` form needs only `Nonempty J`; the README calls connectedness "a genuine hypothesis"

Location: README lines 227–231 and 249–250 ("Connectedness is a genuine hypothesis of this form only, witnessed by the empty diagram above"); `Suggested.lean` line 349 `[IsConnected J]`.

Claim: the theorem is true with `[Nonempty J]`. If `c` is a cocone in `Under X` whose image under `Under.forget X` is a colimit in `C` and `J` is nonempty, then `c` is a colimit in `Under X`: for a cocone `d` the induced `m : c.pt.right ⟶ d.pt.right` satisfies `c.pt.hom ≫ m = (F.obj j).hom ≫ (c.ι.app j).right ≫ m = (F.obj j).hom ≫ (d.ι.app j).right = d.pt.hom` for any `j`, and `Under.forget` is faithful. The `Under X` target (line 338) then applies with no hypothesis on `J`. The empty diagram separates only `Nonempty`.

Witness: `J` the discrete two-object category is nonempty and disconnected; the argument above goes through unchanged.

Repair: weaken line 349 to `[Nonempty J]` and say in the README that the colimit-stability route (`isColimitConstCocone`, `Mathlib/CategoryTheory/Limits/Connected.lean:79`) needs connectedness while the reflection route needs only nonemptiness.

## R08 (P3) — `[Epi f]` is unused in both J2 theorems

Location: `Suggested.lean` lines 767–781; README lines 857–866.

Claim: in `localObjects_rlp_of_epi_of_liftsAlong`, given `u : X ⟶ Q` with `I i` for `i : X ⟶ Y`, the hypothesis `hlift` gives `v : X ⟶ A` with `v ≫ f = u`, `hA` extends `v` to `w : Y ⟶ A` with `i ≫ w = v`, and `w ≫ f` extends `u` along `i`. No property of `f` is used. The second theorem reduces to the first through H4 (`I ≤ epimorphisms C` gives `I.rightOrthogonal = I.rlp`), again without `Epi f`.

Repair: drop `[Epi f]` from both statements; the README keeps "quotient" as motivation only.

## R09 (P3) — README promises closure under limits and a reflection in F3 where the Lean states only `HasLimitsOfShape`

Location: README lines 580–582 ("the arrows lying in both `R` and `Q` are reflective in, and therefore closed under the limits of, the `Q`-arrows"), 560 ("`R.arrows` is closed under all limits of arrows"); `Suggested.lean` lines 511–516.

Claim: `hasLimitsOfShape_arrows_inf` concludes `HasLimitsOfShape J (R ⊓ Q).arrows.FullSubcategory`, existence of limits inside the subcategory, which neither says the inclusion into `Q.arrows.FullSubcategory` creates them nor that it is reflective; `reflective_arrows_inf_ιOfLE` and `arrows_arrowReflectionObj` are not in the file.

Repair: state the F3 headline as `(ObjectProperty.ιOfLE (inf_le_right : (R ⊓ Q).arrows ≤ Q.arrows)).IsRightAdjoint` under `[Q.RespectsIso] [Q.HasOfPrecompProperty L]`, from which `HasLimitsOfShape` and creation of limits follow by Mathlib's reflective-subcategory API; or state closure as `(R ⊓ Q).arrows.IsClosedUnderLimitsOfShape J` relative to `Q.arrows`.

## Verified sound

**Gate.** Rerun at d6490d0: `build=0`, `depcheck=0`, `set_option=0`, `imports=0`; failing checks `prnum=1`, `sorry-data=23`, `residue=1`, `readme-ids-missing=46` (R01, R03, R05).

**Dependency check.** `gate --depcheck … --movable`: `depcheck: 156 roadmaps, 1060 edges, 0 problem(s)`. The roadmap is at line 353 of the merge order and cites no roadmap as supplier (Mathlib only); no UPWARD or CYCLE line. No change outside the roadmap folder (`git diff --stat origin/main...HEAD` excluding the folder is empty).

**Ownership.** `roadmaps grep` over main and the 383 open heads for `HasUniqueLiftingProperty`, `IsOrthogonalPair`, `orthogonal factorization system`, `unique lifting`, `cellular`, `localObjects`: the only other hits are the consumer CommRingFactorizationSystems (R02), which cites this roadmap by name and section (`*Depends on:* … G2, G3, H4, I2 of OrthogonalFactorization`). This roadmap is the owner of the unique-lifting theory; nothing on main states it. Tau Ceti at pin `a91d3aa` has no lifting-property material.

**Sources, seeded sample.** anel2009 (arXiv:0902.1130v2, open repository): Definition 1 at line 356 (p. 8) is `IsOrthogonalPair` as stated (A = ⊥B, B = A⊥); Lemma 2 at line 359 (p. 8) is `rightOrthogonal_isOrthogonalPair`; Proposition 3 at lines 373–383 (pp. 8–9) gives composition, A ∩ B = isomorphisms, pullback stability with "left cancellation" for B, limits in the arrow category, and the codiagonal property. "Cancellation orientation": Anel's "left cancellation" at lines 364–369 is `vu ∈ B, v ∈ B ⇒ u ∈ B`, which is Mathlib's `HasOfPostcompProperty` (`Composition.lean:370`): the README's claim that the paper uses the opposite vocabulary is correct, and `HasOfPostcompProperty.of_le` / `HasOfPrecompProperty.of_le` exist at `Composition.lean:404/408`; `HasTwoOutOfThreeProperty` (line 380) extends both. "In open review, not yet merged": pull request 43441 fetched 2026-10-28, open, all twelve names the README attributes to it occur in its text; no `LiftingProperties/Unique.lean` at the Mathlib pin. "In scope"/"Out of scope": consistent with the targets (no concrete category appears; `CategoryTheory.Localization` is not used). "Naming": `leftOrthogonal`/`rightOrthogonal` do not clash with Mathlib's `ObjectProperty.leftOrthogonal` (different carrier) but see R02/R04. "Uniqueness is separated from existence": `HasUniqueLiftingProperty extends HasLiftingProperty i p, HasAtMostOneLiftingProperty i p` (line 79) matches. "Every closure property is stated twice": the instance form closes by `left_eq ▸ inferInstance` (R06). "Forgetful passages are named theorems": lines 406, 412 are theorems, but line 483/488 are sorry'd `def`s (R01). "Universes": `cellular.{w}` is `@[pp_with_univ]` and `transfiniteCompositions.{w}` carries `w` at the pin (`TransfiniteComposition.lean:339`). "Duality": `HasUniqueLiftingProperty.op : … p.op i.op` matches Mathlib's `HasLiftingProperty.op` (`Basic.lean:60`).

**Pinned declarations opened** (file:line at Mathlib `6b7abb3`): `IsStableUnderColimitsOfShape` `Limits.lean:589` (arbitrary colimit cocones, so J1's constant-cocone argument needs no `RespectsIso`); `IsStableUnderCoproductsOfShape` abbrev `698`; `colimMap` `610`; `coproducts` `644` (includes the empty index); `IsWeakFactorizationSystem` `WeakFactorizationSystem.lean:35` (`rlp`, `llp`, `hasFactorization`); `IsCardinalForSmallObjectArgument` `IsCardinalForSmallObjectArgument.lean:75` (fields `hasPushouts`, `hasCoproducts`, `preservesColimit` on relative cell complexes); `HasSmallObjectArgument` `SmallObject/Basic.lean:88`; `llp_rlp_of_hasSmallObjectArgument` `127` (`= (transfiniteCompositions (coproducts I).pushouts).retracts`, so `cellular` is the right class to name); `HasFunctorialFactorization I.rlp.llp I.rlp` `109`; `IsCardinalFiltered κ.ord.ToType κ` `IsCardinalFiltered.lean:198` (G2's route); `isCardinalPresentable_of_isColimit` `Presentable/Limits.lean:181`; `isClosedUnderColimitsOfShape_isLocal` `OrthogonalReflection.lean:74`, `isRightAdjoint_ι_isLocal` `457`, `isLocallyPresentable_isLocal` `469` (all with both endpoints presentable, as the README says); `isLocal` `Local.lean:43`; `Reflective` `Reflective.lean:38`; `ιOfLE` `FullSubcategory.lean:133`; `isColimitConstCocone` `Connected.lean:79` under `[IsConnected J]`; `StructuredArrow.proj` creates connected colimits `Over/Connected.lean:122`; `of_coprod_inl_with_id` `IsPullback/Basic.lean:716`; `liftToFinset` `Constructions/Filtered.lean:84`; `hasLiftingProperty_ι_app_bot` `TransfiniteCompositionLifting.lean:249`; `isIso_codiagonal_iff` `Diagonal.lean:528`; `IsPushout.hasLiftingProperty`/`IsPullback.hasLiftingProperty` `LiftingProperties/Limits.lean:30/38` (same square orientation as C1); `RetractArrow.rightLiftingProperty` with `@[to_dual]` `Basic.lean:121`; `transfiniteCompositionsOfShape` `RespectsIso` `197` (no instance for `transfiniteCompositions`, so H1's `transfiniteCompositions_respectsIso` is a genuine target); `IsStableUnderTransfiniteCompositionOfShape.of_isStableUnderColimitsOfShape` `276`.

**Signatures.** The worker's 99 "dropped binder" flags are all `[Category.{v} C]` (90) or `[Category.{v} C], [HasTerminal C]` (9), both present as `inst` in every elaborated type (for example `localObjects_rightOrthogonal_eq_isLocal` carries `[HasTerminal C]`); no binder is actually lost.

**Adversarial table.** Instances tried and the values computed:

| statement | instances | values | result |
|---|---|---|---|
| B1 `isIso_of_hasLiftingProperty_self` | identity square `(𝟙 X, f, f, 𝟙 Y)` | lift `l` with `f ≫ l = 𝟙 X`, `l ≫ f = 𝟙 Y`: two-sided inverse | holds |
| B1 `of_epi` | `i` epi, any `p` | two lifts `l₁ l₂` with `i ≫ l₁ = i ≫ l₂ = f` ⇒ `l₁ = l₂` | holds, no hypothesis on `p` |
| B2 codiagonal criterion | `i` epi: `∇ i` iso (`isIso_codiagonal_iff`); `i = 𝟙`: `∇ = 𝟙` | both sides true; ⇒: lifts `l₁,l₂` of `(a,i,p,b)` are the legs of a square from `∇ i`; ⇐: `inl ≫ ∇ ≫ m = m` | holds both ways |
| B2 diagonal criterion | `p` mono: `Δ p` iso | both sides true | holds |
| C2 `of_isLimit` | `J` empty: `c₁.pt, c₂.pt` terminal, `f` iso; `J` discrete two points: `Pi.map` | component lifts `l_j` satisfy `F₁(u) ≫ l_j = l_{j'}` by uniqueness, assemble; `J = ∅` gives iso, which lifts uniquely | holds for every `J` |
| C3 `comp_ext` without `hp` | `J = {0 < 1}`, `F 0 = ∅`, `F 1 = 1` in `Type`, `p = 𝟙 Bool` | `m₁ ≠ m₂ : 1 → Bool` agree after `∅ → 1`, not at stage 1 | README's counterexample confirmed |
| C3 without continuity | `WithTop ℕ`, finite stages `X` with identities, top `Y` | colimit is `F ⊤ = Y`, `c.ι.app ⊥` arbitrary | README's counterexample confirmed |
| D1 Galois connection | `T = ⊥`: `leftOrthogonal ⊥ = ⊤`; `T = ⊤`: `rightOrthogonal ⊤ = isomorphisms` | `p ⊥ p ⇒ p` iso; isos lift uniquely against everything | holds |
| D1 triple identity | `T = isomorphisms`: `ro = ⊤`, `lo = isomorphisms`, `ro = ⊤` | `⊤ = ⊤` | holds |
| D2 `HasOfPrecompProperty` for `leftOrthogonal` | `f : A→B`, `g : B→C`, `gf, f ∈ L`, square of `g` against `r ∈ R` | lift `h` of `gf`-square; `h ∘ g` and `u` both lift the `f`-square ⇒ equal; uniqueness via the `gf`-square | holds; fails for `llp` (retract phenomenon) |
| D2 all-shapes colimit stability | `J` empty: map between initial objects | iso ∈ `leftOrthogonal` | holds |
| D3 `inf_eq_isomorphisms` | `(isomorphisms, ⊤)`, `(⊤, isomorphisms)` | `⊓ = isomorphisms` both | holds |
| E1 `isWeakFactorizationSystem` | `p ∈ L.rlp`, factor `p = i ≫ r` | `p` retract of `r ∈ R`, `R` retract-closed ⇒ `L.rlp = R` | holds, needs factorization |
| E1 `of_isWeakFactorizationSystem` | WFS with unique lifts | `R ≤ L.ro ≤ L.rlp = R` | holds |
| E2 `commSq` | types `CommSq fac'.i fac.i fac'.p fac.p` | `fac.i ≫ fac.p = f = fac'.i ≫ fac'.p` | well-formed, closes by `rw` |
| E2 `exists_iso` with `L ≤ R.leftOrthogonal` only | `fac = fac'` | comparison `𝟙`; `l ≫ l'` and `𝟙` both lift the `(fac.i, fac.p)` square | holds without `HasFactorization` |
| F2 reflection | arrow `f = i ≫ p`, `g ∈ R`, square `(a, b) : f → g` | unique `a' : Z → U` with `i ≫ a' = a`, `a' ≫ g = p ≫ b` = unique lift of `i ∈ L` against `g` | reflective; a `Prop` form exists (R01) |
| F3 `epimorphisms_hasOfPrecompProperty` | any `W` | `f ≫ g` epi ⇒ `g` epi (`epi_of_epi`) | holds, one term |
| G1 `rightOrthogonal_eq_rlp_orthogonalGenerators` | `I = ⊥`: both `⊤`; `I ≤ epi`: `codiagonalGenerators` isos | `p ∈ (I ⊔ ∇I).rlp ⇔ ∀ i, lifts ∧ codiagonal lifts ⇔` B2 | holds |
| G2 `isFinitelyPresentable_pushout` | `WalkingSpan`, `Arrow WalkingSpan` finite | `isCardinalPresentable_of_isColimit` with `ℵ₀` | holds |
| G3 `orthogonalGenerators_le_…` | `∇ i` split epi, lifts against `R` by G1 | split epi ⇒ at most one lift | holds (anel2009 Prop. 3(5)) |
| G3 `generatedOrthogonalFactorizationSystem` | `I = isomorphisms`: `(isomorphisms, ⊤)` | fields: `(I.ro.lo).ro = I.ro`, `(I.ro).lo = I.ro.lo`, factorization transported from `HasFunctorialFactorization (orthGen).rlp.llp (orthGen).rlp` | holds |
| H2 collapse criterion | `K = isomorphisms`, `L = isomorphisms`, `R = ⊤` | `f = 𝟙 ≫ f`, `f ∈ R`, `f ∈ L ⊓ R` ⇒ iso ⇒ `K = L` | holds; needs `K.RespectsIso` (present) |
| H3 `eq_cellular` | `I = ⊥`: `K = isomorphisms`, `cellular ⊥` = transfinite composites of pushouts of empty coproducts = isomorphisms | equal | holds |
| H3 `eq_cellular` | `I = ⊤`: `K = ⊤`, `cellular ⊤ ⊇ ⊤` | equal | holds |
| H4 `eq_cellular_of_epi` | single epi `e` | `I.ro = I.rlp`, Mathlib description plus collapse | holds; `HasSmallObjectArgument I` supplies `HasPushouts` |
| H5 `le_epimorphisms` | `I = ⊥` (vacuously `≤ epi`) | `K = isomorphisms ≤ epi` | holds |
| H5 `le_epimorphisms` without small object argument | `I` any, `f ∈ K` | only `Hom(Y,Z) → Hom(X,Z)` injective for `Z` local | SOA hypothesis genuinely used |
| I2 uniqueness half | lifts `l, l'` into `colim F₁` | factor through stage `k` (`B` presentable), equalize `l_k ≫ i` (`A`), equalize `φ ≫ l_k` (`B`), then one square against `φ_{k''} ∈ R` | holds, both endpoints used |
| J1 comparison with `isLocal` | `A` any, `i : X → Y ∈ I` | squares `(a, i, terminal.from A, _)` ↔ maps `X → A`; unique filler ↔ `Hom(Y,A) → Hom(X,A)` bijective | equal (`Local.lean:43`) |
| J1 `localObjects_of_isLimit` | `J` empty: `c.pt` terminal | cone over `const ⊤` with apex `⊤` is a limit for every `J` | holds without connectedness |
| J1 `localObjects_of_isColimit` | `J` discrete two points | `colim (const ⊤) = ⊤ ⊔ ⊤ ≠ ⊤` in general | connectedness needed |
| J2 `liftsAlong` | `f` not epi | proof uses only `hlift` and `hA` | holds without `Epi f` (R08) |
| J3 `isSplitMono` | square `(𝟙 A, s, terminal.from A, _)` | lift `r` with `s ≫ r = 𝟙 A` | holds |
| A1 finite coproducts | `J` empty | map between initial objects is iso; `W` contains isos (`IsMultiplicative`, `RespectsIso`) | holds |
| A2 `Under X`, any `J` | `J` empty | initial object of `Under X` is `𝟙 X ∈ leftOrthogonal` | holds |
| A2 `forget_under` | `J` discrete two points (nonempty) | reflection argument gives colimit in `Under X` | holds with `Nonempty J` (R07) |

**Cross-roadmap citations resolved:** none made by this roadmap; the consumer CommRingFactorizationSystems cites sections A–J, G2, G3, H4, I2, which exist.

**One-tactic probe.** 13 probes on a scratch copy; 11 closed (R06), `orthogonalGenerators_isSmall := inferInstance` and `codiagonalGenerators_le_epimorphisms := fun _ _ _ ⟨i⟩ ↦ inferInstance` did not close as written, so those two are genuine (small) targets.

## Not verifiable

- Freyd and Kelly, *Categories of continuous functors I* (JPAA 2, 1972): the DOI resolves only to a paywalled publisher page; recorded as `uncertified`. The README cites it without theorem or page, so there is nothing to check at a locator.
- The two nLab pages: cited without section; the host is in no licence class of the sources service, and the claims they are cited for (uniqueness up to unique isomorphism, the small object argument) were checked against anel2009 and the Mathlib pin instead.
- The author's `P` repository named in `## Provenance`: not identified by a URL; not consulted (the roadmap says it is not prescriptive).
- Ownership against open pull requests was checked through `roadmaps grep` over the 383 open heads; no further pull requests without files were named in the brief.

## Source issues

- none
