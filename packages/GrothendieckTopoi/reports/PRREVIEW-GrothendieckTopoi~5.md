# Review of GrothendieckTopoi (pull request #1520 at a60ff1d)

**Verdict:** needs changes

Reviewed: `TauCetiRoadmap/GrothendieckTopoi/README.md` and `TauCetiRoadmap/GrothendieckTopoi/Suggested.lean` at a60ff1d, against Mathlib `f6090c7` and Tau Ceti `358314d` (the pins of the pull request's `lake-manifest.json`). The pull request changes nothing outside the folder (`git diff --stat origin/main...HEAD` outside the folder is empty); `metadata.toml` carries only the topic. The worker's gate at this head fails on `imports`, `no-import-mathlib`, `mathlib-subimports` (29), `sorry-data` (20), `prnum` (1) and `readme-ids-missing` (7); the targeted build itself succeeds (its 29 "build" lines are the module-system import warnings). My own elaboration of `Suggested.lean` with `lake env lean` exits 0 with `declaration uses sorry` as the only warnings.

## R01 (P1) — Twenty `def`/`instance` bodies contain `sorry` (sorry'd data)

Location: `TauCetiRoadmap/GrothendieckTopoi/Suggested.lean` lines 82–85, 135–153, 160–166, 202–203, 210–212, 227–243, 246–248, 259–262, 265–268, 297–300, 341–345, 348–350, 379–381, 395–410.

Claim: the file states its targets as definitions and instances whose bodies, or whose fields, are `sorry`.

Witness: gate `sorry-data=20`. Three groups:

- Pure sorry'd data: `IsGrothendieckTopos.subobjectFrame` (a `Order.Frame` instance), `GrothendieckToposCat.bicategory` (a `Bicategory` instance), `GeometricMorphism.global`, `GeometricMorphism.ofCocontinuous` (fields `inverse` and `adj`), `pointEquivalence`, `overSheafEquiv`, `GeometricMorphism.etale`, `subtoposEquivUniversalClosureOperator`, `sublocaleEquivSubtopos`.
- Definitions whose proof fields are `sorry`: `GeometricMorphism.id`, `.comp`, `.ofEquiv`, `.ofContinuous` (field `preservesFiniteLimits_inverse`), the `Category (GeometricMorphism E F)` instance (`id_comp`, `comp_id`, `assoc`), `Frame.grothendieckTopology` (`top_mem'`, `pullback_stable'`, `transitive'`).
- `Prop`-class instances proved by `sorry`: `LocallyCompactSpace.coreCompactSpace`, `ScatteredSpace.t0Space`, `ScatteredSpace.quasiSober`, `quasiSober_pi`, `quasiSober_prod`.

Repair, tested on a scratch copy at the pin:

- Delete the heavy constructions (`bicategory`, `global`, `ofCocontinuous`, `etale` with `etale_inverse`, `subobjectFrame`); they stay README targets with their intended signatures. State the four equivalences as theorems: `Nonempty (GrothendieckTopology.Point.{u} J ≌ GeometricMorphism (Type u) (Sheaf J (Type u)))`, `Nonempty (Sheaf (J.over c) (Type u) ≌ Over ((presheafToSheaf J (Type u)).obj (yoneda.obj c)))`, `Nonempty (UniversalClosureOperator E ≃ Subtopos E)`, `Nonempty (Sublocale L ≃ Subtopos (Sheaf (Frame.grothendieckTopology L) (Type u)))`.
- `preservesFiniteLimits_inverse := inferInstance` elaborates for `id`, `comp` and `ofEquiv` at the pin (the instances for `𝟭 E`, `g ⋙ f` and `e.inverse` exist). For `ofContinuous`, the instance `CategoryTheory.Functor.SmallCategories.instPreservesFiniteLimitsSheafSheafPullbackOfRepresentablyFlat` (`Mathlib/CategoryTheory/Sites/Pullback.lean` line 120) exists at the pin but default instance search times out on it; apply it by name. The hypothesis `[(G.sheafPushforwardContinuous (Type u) J K).IsRightAdjoint]` is redundant: it is itself an instance at the pin (`Pullback.lean` line 117; `inferInstance` closed it in my probe), and it makes the Lean signature narrower than the README's "`[G.IsContinuous J K]` and `[RepresentablyFlat G]`". Drop it.
- Prove the three `Category` fields (`ext`-lemma of `Hom` plus `simp`) and the three axioms of `Frame.grothendieckTopology` (the top sieve has supremum `U`; pullback stability is frame distributivity `V = V ⊓ ⨆ W = ⨆ (V ⊓ W)`; transitivity is `⨆_{V ∈ S} ⨆_{W ≤ V, W ∈ R} W = ⨆_{V ∈ S} V = U`).
- Restate the five `Prop`-class instances as `theorem`s (or delete them with R08).

## R02 (P2) — Statable headlines absent; the docstring names no unstatable one

Location: `TauCetiRoadmap/GrothendieckTopoi/Suggested.lean` lines 31–45 (module docstring), 115–250 (Layer 2).

Claim: the README's headline table names "the 2-category of topoi; Diaconescu's theorem" (Layer 2), "localic topoi ≃ locales; localic reflection" (Layer 7), "gluing" (Layer 4) and "existence" of fibre products with `Sh(S × T) ≃ Sh(S) × Sh(T)` (Layer 8). Diaconescu's theorem is statable at the pin and absent; the localic characterisation is statable and absent; the rest are not statable and the docstring does not say so.

Witness: Diaconescu needs only a `Prop` `IsFiltering J A` with a real body (the four jointly-epimorphic conditions of README lines 350–357, written as "every family of maps into the terminal object / the product / the equalizer that equalises all members is equal") on the native carriers `C ⥤ E`, `⊤_ E`, `⨯`, `equalizer`, then `Nonempty (GeometricMorphism E (Sheaf J (Type u)) ≌ (ObjectProperty.FullSubcategory (IsFiltering J (E := E)))ᵒᵖ)`. The localic characterisation is `∀ f : GeometricMorphism E (Type u), f.IsLocalic ↔ ∃ (L : Type u) (_ : Order.Frame L), Nonempty (E ≌ Sheaf (Frame.grothendieckTopology L) (Type u))` once `Frame.grothendieckTopology` has a real body (R01). Gluing (`Comma (𝟭 G) Φ` is a topos and `E ≌ Gl(Φ)`) needs the open and closed inclusions, which are heavy definitions; fibre products need the iso-comma universal property; the topos-level `Sh(S × T) ≃ Sh(S) × Sh(T)` needs the product of topoi. None of these three is named in the docstring, which instead says the file "suggests Lean forms for particular milestones" and that "`sorry` is permitted in this human-owned repository".

Repair: state the two statable headlines; rewrite the docstring in the required form ("Grothendieck topoi: target signatures", the roadmap is `README.md`, the file states the headline theorems against the pinned APIs) and list there the headlines not statable at the pins with the carrier each lacks (gluing: the open and closed inclusions; fibre products: the iso-comma universal property; the topos-level product theorem: the product of topoi), without process text.

## R03 (P2) — "For `E = Type u` and `J` trivial, J-filtering means `RepresentablyFlat`" is false

Location: `TauCetiRoadmap/GrothendieckTopoi/README.md` lines 361–362, "For `E = Type u` and `J` trivial, J-filtering means `RepresentablyFlat`."

Claim: a functor `A : C ⥤ Type u` is J-filtering for the trivial topology exactly when it is Mathlib's `RepresentablyFlat`.

Witness: `RepresentablyFlat A` (`Mathlib/CategoryTheory/Functor/Flat.lean` line 66) asks `IsCofiltered (StructuredArrow X A)` for every `X : Type u`; for `X = ∅` the category `StructuredArrow ∅ A` is `C` itself, so `RepresentablyFlat A` forces `C` cofiltered. Take `C` the discrete category on two objects `c, d` and `A c = PUnit`, `A d = ∅`. Conditions (i)–(iii) of lines 352–356 hold: `A c → ⊤` is epi; for `c ≠ d` the target `A c ⨯ A d = ∅` receives the empty family, which is jointly epi into `∅`; for `c = c` the diagonal suffices; the only parallel pairs are identities. Condition (iv) is empty for the trivial topology. So `A` is J-filtering (it is the inverse image on representables of the projection point `Type u → Type u × Type u`, which is left exact and cocontinuous), but `StructuredArrow ∅ A ≅ C` has no cone over `(c, d)`, so `A` is not `RepresentablyFlat`.

Repair: replace by "means that the category of elements `A.Elements` is cofiltered (Mac Lane–Moerdijk VII.6, Theorem 3), the condition Mathlib's `GrothendieckTopology.Point` imposes on its fibre functor (`Point.isCofiltered`)". `RepresentablyFlat` remains the sufficient condition `ofContinuous` uses; keep it there only.

## R04 (P2) — The existence criterion's proof route needs well-copoweredness, which no layer provides

Location: `TauCetiRoadmap/GrothendieckTopoi/README.md` lines 316–319 (Layer 2, "Existence criterion") and 276–284 (Layer 1, "Structure of a topos").

Claim: "a functor `F ⥤ E` is the inverse image of a geometric morphism `E → F` if and only if it preserves finite limits and `u`-small colimits, by Mathlib's `isLeftAdjoint_of_preservesColimits_of_isSeparating` applied with the small separating family of Layer 1."

Witness: at the pin that lemma (`Mathlib/CategoryTheory/Adjunction/AdjointFunctorTheorems.lean` line 118) elaborates to `[HasColimitsOfSize.{u,u} C] [LocallySmall.{u} C] [LocallySmall.{u} D] [WellPowered.{u} Cᵒᵖ] [ObjectProperty.Small.{u} P] → P.IsSeparating → ∀ F [PreservesColimitsOfSize.{u,u} F], F.IsLeftAdjoint`. The hypothesis `WellPowered Cᵒᵖ` (well-copowered) is not among the Layer 1 structure results, which list `WellPowered.{u} E` only.

Repair: add to Layer 1 "Structure of a topos" that a Grothendieck topos is well-copowered (`WellPowered Eᵒᵖ`: a quotient of `X` is determined by the kernel pair, a subobject of `X ⨯ X`), and cite it in the existence criterion's input list.

## R05 (P3) — Gate: imports, a pull-request number, seven backticked names not declared

Location: `TauCetiRoadmap/GrothendieckTopoi/Suggested.lean` lines 1–29; `README.md` line 459 and lines 213, 232–235.

Claim and witness: gate `imports=1`, `no-import-mathlib=1`, `mathlib-subimports=29`: the file imports 29 `Mathlib.*` submodules and never `import Mathlib`; the rule is the single line `import Mathlib` (my probe files elaborate under it). Gate `prnum=1` (line 459, `mathlib4#41216`). Gate `readme-ids-missing=7`: `Topos.Hom.isQuasicompact_comp`, `.isQuasicompact_pullback`, `.isQuasiseparated_comp`, `.isQuasiseparated_iff_diagonal`, `.isQuasiseparated_pullback` (line 232–234), `isConnected_of_mem`, `isSheaf_const_obj` (line 213). The README also links `../HomotopyTheoryOfCategories/README.md` (line 85), a folder that is not on main (it is an open pull request).

Repair: replace the import block by `import Mathlib`; remove the pull-request number (see R07); state the seven facts in prose without the backticked names (the AdicSpacesPartII lemmas are already described in words at R0.19.10, which the sentence can cite); name HomotopyTheoryOfCategories without a relative link.

## R06 (P3) — README shape: no `### k.n` subsections, no `*Needs:*` lines, no `**Checks.**` lists

Location: `TauCetiRoadmap/GrothendieckTopoi/README.md` lines 269–610 (Layers 1–8).

Claim: every layer is a bullet list of bold-led paragraphs; no definition has a `**Checks.**` list (`IsGrothendieckTopos`, `GeometricMorphism`, `Subtopos`, `UniversalClosureOperator`, `HasEnoughPoints`, `Frame.grothendieckTopology`, `IsFrameCoproduct`, `WayBelow`, `CoreCompactSpace`, `ScatteredSpace` have none; the only "*Check:*" is line 584); no target carries a `*Needs:*` line; no layer ends with `### Examples` and `### Dependencies`; there is no `## Exact supplier contracts` and no `## Downstream consumers` (the sections `## Existing foundations` and `## Examples and checks` carry that material).

Witness: compare `TauCetiRoadmap/SchemeAndStackFoundations/README.md` on main (`## Scope and ownership`, `## Exact supplier contracts`, `### 1.10 …` with `*Needs:*`, `### Examples`, `### Dependencies`).

Repair: recast each bold-led bullet as a `### k.n` subsection in prose with its `*Needs:*` line; give each definition an API list and at least three discriminating Checks (for example for `CoreCompactSpace`: `ℝ` through local compactness, `ℚ` fails, the one-point and empty spaces; for `IsHyperconnected`: `global` of `B G` is hyperconnected, `global` of `Sh(Sierpiński)` is not); end each layer with Examples and Dependencies; rename the sections to the upstream headings.

## R07 (P3) — Porting plan for two open Mathlib pull requests, with numbers, heads and a migration paragraph

Location: `TauCetiRoadmap/GrothendieckTopoi/README.md` lines 194–219 and the table rows at lines 38–39, 459.

Claim: two open Mathlib pull requests "are ported into Tau Ceti once, with the names, namespaces and signatures of the pull request at the head named below"; a "Migration" paragraph says what happens when they merge.

Witness: the repository README ("Working with Mathlib") asks for exactly this shape, built here now under the pull request's names, and the gate forbids pull-request numbers; the heads, numbers and the migration paragraph are process narrative that a reader a year from now cannot act on. `PowerObject`, `IsPowerObjectOf` and `IsLocallyConnectedSite` do not exist at the pin (grep of `Mathlib/` at `f6090c7` finds none).

Repair: make "Power objects" (Layer 1) and "Locally connected sites with `π₀`" (Layer 5) ordinary targets of this roadmap, stated mathematically with the pull requests' names and signatures, and record in Scope, in one sentence without numbers or heads, that Mathlib has open work on both under those names.

## R08 (P3) — Padding in `Suggested.lean`

Location: `TauCetiRoadmap/GrothendieckTopoi/Suggested.lean` lines 61–67, 270–273, 365–371, 383–401.

Witness (probed on a scratch copy at the pin): `isGrothendieckTopos_sheaf` closes by the single term `⟨C, inferInstance, J, ⟨CategoryTheory.Equivalence.refl⟩⟩`; `IsGrothendieckTopos.of_equivalence` is `obtain` plus `e.symm.trans e'`; `CompleteLattice.wayBelow_self_iff` closes by `(isCompactElement_iff_le_of_directed_sSup_le a).symm` (the definition is that lemma's right-hand side verbatim); `CompleteLattice.WayBelow.le` is the instance `s = {b}`; `not_coreCompactSpace_rat` mirrors the README's "*Check:* `ℚ` is not core-compact" (line 584); `scatteredSpace_iff` is agreement with the library notion `Preperfect`, a Check; `GeometricMorphism.etale_inverse` restates the field `inverse := Over.star X` of `etale`; `ScatteredSpace` with `ScatteredSpace.t0Space` and `ScatteredSpace.quasiSober` is used by no headline in the file.

Repair: delete these from `Suggested.lean`; the README keeps each as a target or Check.

## R09 (P3) — Locators into Isbell and Hofmann–Lawson

Location: `TauCetiRoadmap/GrothendieckTopoi/README.md` lines 603–606 and 699–706.

Witness: isbell1981 line 53–54 (Theorem 1) is the direct statement "the locale product `X × Y` is a space if `X` is quasi-locally compact and `Y` a space"; Theorem 4 (line 92–94) is the generalisation whose hypothesis a core-compact space satisfies only after the closed-subspace argument. For `ℚ × ℚ`, the OCR text of isbell1972 has no explicit statement; the clean source is isbell1981 Theorem 2 (line 62–63) applied to the disjoint dense subspaces `ℚ` and `ℚ + √2` of `ℝ`, both homeomorphic to `ℚ`, whose localic intersection is nonzero because every dense sublocale of `ℝ` contains the smallest dense sublocale (isbell1972 line 45–47 records the pointless part of `ℚ`). Hofmann–Lawson's definition of core-compact is 4.1 (hofmann-lawson1978 line 521–523), word for word the README's.

Repair: cite Isbell 1981 Theorem 1 for the product theorem, Isbell 1981 Theorem 2 (with the two dense copies of `ℚ`) or Stone Spaces II 2.14 for `ℚ × ℚ`, and Hofmann–Lawson Definition 4.1 for core-compactness.

## Verified sound

**Gate and build.** `lake env lean TauCetiRoadmap/GrothendieckTopoi/Suggested.lean` at a60ff1d: exit 0, 33 `declaration uses sorry` warnings, nothing else. Dependency check:

```
depcheck: 205 roadmaps, 1660 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The merge order lists GrothendieckTopoi last (line 374); every supplier it names is on main.

**Cross-roadmap citations resolved on main (929496d).** AdicSpacesPartII R0.19.10 exists (`TauCetiRoadmap/AdicSpacesPartII/README.md` line 8005) and defines, in prose, exactly the five predicates and seven lemmas the README consumes (lines 8027–8044); its `Suggested.lean` declares none of them, so they are README-level targets, cited correctly as "specified, not yet in Tau Ceti". SchemeAndStackFoundations §1.10 (line 2320, `smallEtale_map`), §1.18 (line 2745, `Stack.stackification`, `Stack.twoFibreProduct` at 2776), §§2.1–2.5 (lines 3265–3388), §2.10 (line 3631, `epsilonFppfEtale`), §§2.9–2.17 (3582–3924) all exist. EnhancedDerivedSheaves and RigidAnalyticGeometry §8.3 ("The image of the rigid–adic functor", line 738) exist. ClassifyingSpaces exists; HomotopyTheoryOfCategories is open pull request #1521 (R05).

**Ownership.** `roadmaps grep` over the 440 open pull requests and main for `GeometricMorphism`, `IsGrothendieckTopos|Giraud`, `Diaconescu`, `Subtopos|Lawvere–Tierney`, `localic`, `core-compact|CoreCompact`, `quasiSober_prod|quasiSober_pi`, `ScatteredSpace`, `IsFrameCoproduct|C-ideal`, `WayBelow`, `Frame.grothendieckTopology`: no other roadmap defines any of these objects. The hits for "geometric morphism" in CohomologicalPointCounting (#196) and AlgebraicModuliForArithmeticGeometry (#853) use morphisms of étale and classifying sheaf topoi of schemes, not a general carrier; "enough points" hits (#875, #922, #1002) are site-level uses of Mathlib's notion. HomotopyTheoryOfCategories (#1521) lists topoi as owned by this roadmap. This roadmap is the owner of the general topos-level carriers. Ownership against the five board packages listed in the brief's index was checked by name (none is about topoi).

**Library declarations opened at the pins** (file and line in `Mathlib/`): `GrothendieckTopology.Point` with `isCofiltered : IsCofiltered fiber.Elements` (`CategoryTheory/Sites/Point/Basic.lean` 68–74), `Point.Hom.hom : Φ₂.fiber ⟶ Φ₁.fiber` (`Sites/Point/Category.lean` 38–40, so the README's Convention 4 reading of Mathlib's direction is correct), `Point.sheafFiber` (Basic 275), `Point.skyscraperSheafFunctor`, `Point.map`, `Point.comap` (needs `RepresentablyFlat F` and `CoverPreserving`), `HasEnoughPoints` as a `w`-small conservative family (`Sites/Point/Conservative.lean` 258–261), its instance on `J.over X` (`Sites/Point/Over.lean` 86), `ObjectProperty.IsConservativeFamilyOfPoints`; `Functor.sheafPullback` (`Sites/Pullback.lean` 55, defined from `IsRightAdjoint`; instance at 117; finite-limit preservation at 120 for small sites and concrete `A`), `Functor.sheafAdjunctionContinuous`, `Functor.sheafPushforwardCocontinuous` (`Sites/CoverLifting.lean` 288), `Functor.sheafAdjunctionCocontinuous` (needs continuity and cocontinuity together, as the README says), `RepresentablyFlat` (`Functor/Flat.lean` 66), `CategoryTheory.final_of_representablyFlat` (146), `CategoryTheory.lan_preservesFiniteLimits_of_flat` (323), `GrothendieckTopology.IsLocalSite` (`Sites/LocalSite.lean` 59) and `IsLocalSite.ΓCoconstantSheafAdj` (142), `Sheaf.Γ` and `constantSheafΓAdj` (`Sites/GlobalSections.lean`), `Sheaf.Ω`, `Sheaf.classifier : Subobject.Classifier (Sheaf J (Type (max u v)))` (`Topos/Sheaf.lean` 161, 224), `HasSubobjectClassifier` (`Subobject/Classifier/Defs.lean` 156), `GrothendieckTopology.closureOperator`, `Functor.closedSieves`, `topologyOfClosureOperator` (`Sites/Closed.lean` 103, 272), `GrothendieckTopology.over`, `overPullback`, `overMapPullback` (`Sites/Over.lean` 415), `Opens.sheafEquivOver` (`Topology/Sheaves/Over.lean` 82), `Opens.grothendieckTopology` (`Sites/Spaces.lean` 47), `Equivalence.sheafCongr` (`Sites/Equivalence.lean` 109), `IsDenseSubsite.sheafEquiv` (`Sites/DenseSubsite/Basic.lean` 790), `GrothendieckTopology.yoneda` for subcanonical `J` (`Sites/Canonical.lean` 163), `MonoidalClosed (Sheaf J A)` (`Sites/CartesianClosed.lean` 26), `Precoherent`, `coherentTopology` (`Sites/Coherent/Basic.lean` 55, 82), `Subobject.exists` (needs `HasImages`), `Subobject.pullback : Subobject Y ⥤ Subobject X` for `X ⟶ Y`, `CoproductDisjoint`, `IsUniversalColimit`, `IsRegularEpiCategory`, `ObjectProperty.IsSeparating`, `ObjectProperty.Small`, `Over.star`, `Over.forgetAdjStar` (needs `HasBinaryProducts`), `Over.post`, `Over.iteratedSliceEquiv`, `ExponentiableMorphism` (needs `ChosenPullbacksAlong f`), `conjugateEquiv : (L₂ ⟶ L₁) ≃ (R₁ ⟶ R₂)`, `mateEquiv`, `Adjunction.leftAdjointUniq`, `Action.functorCategoryEquivalence : Action V G ≌ SingleObj G ⥤ V`, `SingleObj : Type* → Type` (so the README's `AsSmall` remark is right), `Algebra.GrothendieckGroup.of`, `Locale`, `topToLocale`, `Locale.pt`, `Locale.adjunctionTopToLocalePT`, `Locale.PT L = FrameHom L Prop`, `Sublocale`, `Nucleus.toSublocale`, `nucleusIsoSublocale : (Nucleus X)ᵒᵈ ≃o Sublocale X`, `TopCat.Sheaf.pushforward`, `TopCat.Sheaf.pullback`, `TopCat.Sheaf.pullbackPushforwardAdjunction`, `Opens.map`, `Preperfect`, `Prod.instT0Space`, `Pi.instT0Space`, `QuasiSober`, `isCompactElement_iff_le_of_directed_sSup_le`, `IsCompact.elim_directed_cover`, `Sheaf.H`. Tau Ceti `TauCeti/CategoryTheory/Sites/DenseSubsite.lean` and `TauCeti/CategoryTheory/Sites/SheafCohomology/` exist. The README's negative claims hold at the pin: no way-below relation, no core-compact or scattered spaces, no `QuasiSober` instance for products (only the open-cover lemma, `Topology/Sober.lean` 215–232), no `PowerObject` and no `IsLocallyConnectedSite`.

**Signatures.** The 16 "looks dropped" leads of the worker's signature file are all `[Category.{u} E]` binders that are present in the elaborated types as `inst`; none is a real loss.

**Seeded sample of 15 targets** (the worker named none by heading; I took the 15 claims with the most consequential locators): (1) Isbell 1981 Theorem 4 for `Sh(S × T)` with `S` core-compact: supported, Theorem 1 is the direct form (R09); (2) `ℚ × ℚ`, Isbell 1972: no explicit statement found, Isbell 1981 Theorem 2 supplies it (R09); (3) Hofmann–Lawson core-compact: Definition 4.1 matches; (4) Mathlib `Point.Hom` direction (Convention 4): verified; (5) Mathlib `HasEnoughPoints` as a `u`-small family: verified; (6) `sheafAdjunctionCocontinuous` needs both continuity and cocontinuity: verified; (7) `isLeftAdjoint_of_preservesColimits_of_isSeparating` hypotheses: verified, one missing in the README (R04); (8) `Sheaf.classifier` exists at the pin: verified; (9) `final_of_representablyFlat` name: verified as `CategoryTheory.final_of_representablyFlat`; (10) `Action.functorCategoryEquivalence` and `SingleObj` universe: verified; (11) AdicSpacesPartII R0.19.10 names: verified on main; (12) SchemeAndStackFoundations §1.18 and §2.10 names: verified on main; (13) `isCompactElement_iff_le_of_directed_sSup_le` quantifier pattern equals `WayBelow a a`: verified; (14) `IsCompact.elim_directed_cover` for `V ⊆ K ⊆ U ⇒ V ≪ U`: verified (needs `Nonempty ι`, supplied by nonemptiness of the directed set); (15) SGA 4 IV 3.2 for the 2-cell direction, IV 4.9, VI 9.0, Elephant A4.6.1–A4.6.6, C3.3.1, MM VII.9: not verifiable (below).

**Adversarial pass.** One row per statement; values computed on each side.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `IsGrothendieckTopos` | `Sheaf J (Type u)`; empty site; point site | witnesses `(C, J, Equivalence.refl)`; empty site gives the terminal category; point site gives `Type u` | holds in all three, as the README's examples say | none |
| `GeometricMorphism.comp` | `f : E → F`, `g : F → G` | `g.adj.comp f.adj : g.inverse ⋙ f.inverse ⊣ f.direct ⋙ g.direct` (elaborates) | matches Convention 3 | none |
| 2-cell direction (Convention 4, Examples) | Sierpiński space, open point `o`, closed point `c`, `c ∈ closure {o}` | stalk map `F_c = F(S) → F_o = F({o})`; nat. trans. `skyscraper_o ⟶ skyscraper_c` needs `S → *` on `U = {o}` (exists); the reverse needs `* → S` for `S = ∅` (fails) | only `o ⟶ c`, agreeing with README line 622 and with `Point.Hom` (`Φ₂.fiber ⟶ Φ₁.fiber`) | none |
| `homEquivInverse` | any `f g` | `(conjugateEquiv f.adj g.adj).symm : (f.direct ⟶ g.direct) ≃ (g.inverse ⟶ f.inverse)` | matches Convention 4 | none |
| Layer 7 2-cells for `Sh(X) → Sh(Y)` | points `f x`, `g x` | 2-cell `f ⟶ g` gives `g^* V ≤ f^* V`, i.e. `g x ∈ V ⇒ f x ∈ V` for all open `V`, i.e. `g x ∈ closure {f x}` | matches lines 553–555 and the `FrameHom` order of line 536 | none |
| `IsSurjection`, `IsEmbedding`, `IsConnected` | `id`; `global` of `Type u`; `global` of the degenerate topos | identities: all hold; degenerate: inverse `Type u → 1` not faithful | not connected, no point, as README line 616 says | none |
| `IsHyperconnected`, `IsLocalic`, the factorisation | `global` of `B G`; `global` of `Sh(X)` | `B G`: trivial actions are full and faithful and closed under sub-`G`-sets, so hyperconnected; `Sh(X)`: every sheaf is a quotient of a coproduct of subterminals, so localic; hyperconnected and localic gives `Sub(1) ≅ 2`, hence `E ≃ Sh(2) = Type u` | matches Layer 5 "Factorization" | none |
| `GiraudAxioms` | terminal category; `Type u`; `Ab` | terminal: all axioms hold (initial = terminal); `Type u`: separating `{PUnit}`; `Ab`: pullback of `ℤ ⊕ ℤ`'s injections along `(1,1) : ℤ → ℤ ⊕ ℤ` is `0 ← 0 → 0`, whose coproduct `0 ≠ ℤ` | `Ab` fails `coproduct_isUniversal`, as it must | none |
| `IsInternalEquivalenceRel` | diagonal `(𝟙, 𝟙) : X → X`; `(𝟙, 𝟙) : X ⊔ X → X` | diagonal: jointly mono, relation is equality; `X ⊔ X`: `inl ≫ 𝟙 = inr ≫ 𝟙` with `inl ≠ inr` | second fails `jointly_mono`, as it must | none |
| `Subtopos` | all of `E`; terminal objects; initial objects of `Type u` | reflector `𝟭`; reflector `X ↦ ⊤`, left exact; `X ↦ 0` has `Hom(0, F) ≠ Hom(X, F)` | third fails, degenerate subtopos counted (as in Elephant) | none |
| `UniversalClosureOperator`, `IsSheaf`, order reversal | identity closure; constant-`⊤` closure | identity: every object is a sheaf; constant `⊤`: `⊥ ↪ B` is dense so `Hom(B, F) ≅ Hom(0, F) = *`, sheaves are the terminal objects | largest operator ↔ smallest subtopos, as Convention 6 says | none |
| `HasEnoughPoints` | `Type u`; degenerate topos; `Sh(regular opens of ℝ)` | one point; empty family reflects isos (every map is an iso); no point at all and not degenerate | third fails, as Layer 6 says | none |
| `hasEnoughPoints_coherentTopology` | `C` terminal | trivial topology, `Sh = Type u`, one point | holds | none |
| `Frame.grothendieckTopology` | top sieve; empty sieve; `L = Opens X` | `sSup {V ≤ U} = U`; `sSup ∅ = ⊥ = U` only for `U = ⊥`; covering iff `∀ x ∈ U ∃ V ∈ S, x ∈ V` | agrees with `Opens.grothendieckTopology` | axioms must be proved (R01) |
| `WayBelow` | `L = Set ℕ`, `a = {0}`, `b = ℕ`; `a = b = ℕ`; `⊥ ≪ ⊥` with `s = ∅` | finite subsets cover: `{0}` lies in a member; `ℕ` in none; `s = ∅` would refute `⊥ ≪ ⊥` | `s.Nonempty` is needed and present | none |
| `CoreCompactSpace` | `ℝ`; `ℚ`; `V ⊆ K ⊆ U` compact `K` | `ℝ`: `V = interior K`; `ℚ`: Hausdorff and core-compact implies locally compact (Hofmann–Lawson 4.5), `ℚ` is not; compact `K` picks a member of any directed cover | matches Layer 8 | none |
| `isFrameCoproduct_opens_prod`, its negation | `S = T = ℝ`; `S = ∅`; `S = pt`; `S = T = ℚ` | `ℝ` quasi-locally compact (Isbell 1981 Thm 1); `Opens ∅ = 1` is terminal and `1 ⊗ M = 1`; `Opens pt = 2` is initial and `2 ⊗ M = M`; `ℚ`, `ℚ + √2 ⊆ ℝ` disjoint, dense, with nonzero localic meet (Isbell 1981 Thm 2) | all four agree with the two Lean statements | locator (R09) |
| `ScatteredSpace`, `scatteredSpace_iff`, `t0Space`, `quasiSober` | `ℚ`; discrete `ℕ`; Sierpiński; indiscrete two points; `A = {x, y}` | `ℚ` is nonempty preperfect; discrete and finite `T0` spaces have minimal points for `x ∈ closure {y}`; indiscrete: `W = X` never isolates; `{x, y}` gives the `T0` separation; a relatively isolated point of an irreducible closed `S` has `S = closure {x} ∪ (S ∖ W)` hence `S = closure {x}` | all consistent | padding (R08) |
| `quasiSober_pi` | `ι = ∅`; irreducible closed `S ⊆ Π X_i` | `ι = ∅`: a point; general: `ξ = (generic points of closure (π_i S))`, a basic open `U ∋ ξ` with finite support meets each `π_i^{-1} U_i ∩ S`, irreducibility gives `U ∩ S ≠ ∅`, so `ξ ∈ S` and `closure {ξ} ⊇ S` | proof route of line 594 is sound | none |
| Sierpiński example (gluing) | `X = {o, c}` | `Sh(X)` = arrow category; `Φ = i^* j_*` sends `S` to `S` | `Gl(𝟭) = Comma (𝟭) (𝟭)` = arrow category | none |
| Grothendieck-group example | `M = ℕ`; general commutative `M` | comma category `ℤ` with arrows `n ⟶ n + k`; cones: `g = a − b`, `g' = a' − b'` both over `h = −(b + b')`; parallel `m₁, m₂` with `of m₁ = of m₂` equalised by `k` with `k + m₁ = k + m₂` | `RepresentablyFlat` holds; `final_of_representablyFlat` exists | none |
| `B G` example | `Over G ≃ Type u`; points | fibre over `1`; inverse image of the étale morphism is `Over.star` then the fibre, the forgetful functor; flat functors on `SingleObj Gᵐᵒᵖ` are torsors | matches lines 626–633 | none |
| J-filtering for `E = Type u`, `J` trivial | discrete `C = {c, d}`, `A = (PUnit, ∅)` | (i)–(iii) hold; `StructuredArrow ∅ A ≅ C` not cofiltered | README claim false | R03 |
| Existence criterion | `isLeftAdjoint_of_preservesColimits_of_isSeparating` | hypotheses `HasColimitsOfSize.{u,u}`, `LocallySmall.{u}`, `WellPowered.{u} Cᵒᵖ`, `Small.{u} P` | one hypothesis unowned | R04 |
| `ofContinuous` for `Opens.map f` | `f : X → Y` | `Opens.map f : Opens Y ⥤ Opens X`, so `ofContinuous` gives `Sh(X) → Sh(Y)`; `Opens.map f` preserves finite meets, `Opens Y` has finite limits, hence flat | direction and hypotheses match line 341–343 | none |
| `ofContinuous (G ⋙ H)`; `etaleMap u ≫ etale X`; `etale (Over.mk u)` | sources and targets | `Sh(E) → Sh(C)` both sides; `Over Y → E` both sides; `Over (Over.mk u) → Over X` both sides | composable as written | none |
| Deligne's theorem, Lean form | `Precoherent C`, `HasPullbacks C` | `C/c` has finite limits, coverings finite effective-epimorphic families, so `Sheaf (coherentTopology C)` is locally coherent | statement at the generality of SGA 4 VI 9.0 (not verifiable in text) | none |
| qcqs change of site | `Φ : Sheaf J ≌ Sheaf K` | the R0.19.10 predicates are stated through effective-epimorphic families, pullbacks and finiteness, all transported by `Φ` | invariance claim sound | none |
| Universes | `Sheaf J (Type u)` for `C : Type u`; `GrothendieckToposCat.{u}` | `Type (u+1)` with `Category.{u}`; `Type (u+2)` | Convention 1 holds (elaborates) | none |

**Headlines against the pins.** Stated: Giraud, surjection–embedding factorisation, hyperconnected–localic factorisation, points of a site = points of its topos (as data, R01), `E/X` is a topos and `Sh(J.over c) ≃ Over (ℓ c)` (as data, R01), subtopoi ≃ universal closure operators (as data, R01), enough points for sheaves, Deligne, sublocales = subtopoi (as data, R01), `Opens (S × T)` as frame coproduct and its failure for `ℚ × ℚ`, products of quasi-sober spaces. Absent: Diaconescu, localic characterisation (R02). One-tactic probe results are in R08; `hasLimits`, `hasColimits`, `hasSubobjectClassifier`, `isGrothendieckTopos_iff_giraudAxioms`, the two factorisation theorems, `hasEnoughPoints_sheaf_iff`, `hasEnoughPoints_coherentTopology`, `quasiSober_pi`, `quasiSober_prod`, `isFrameCoproduct_opens_prod`, `not_isFrameCoproduct_opens_rat_prod` do not close by one tactic and are not padding.

**Declared gaps.** None declared (no readable `design/plan.json`); the README states none, and no citation of a nonexistent section was found.

## Not verifiable

- SGA 4 (Springer LNM 269–270): IV 1.2 (Giraud), IV 3.2 (2-cell direction), IV 4.9, IV 6.3, IV 9.5, III 2.3, VI 2.3, VI 9.0. No legal open copy: the sources service and the manifests of every board package know only SGA 4½ (IAS publications); the AdicSpacesPartII README's "transcription" is not recorded in any manifest.
- Johnstone, *Sketches of an Elephant* (OUP): A4.1.1, A4.2.10, A4.3–A4.6, B1.4, B3.4, C1.2, C1.4, C1.6, C2.2.8, C3.3.1, C3.6.1. Paywalled.
- Mac Lane–Moerdijk, *Sheaves in Geometry and Logic* (Springer): VII.6 Thm 3, VII.7–VII.10, IX.2, IX.5, IX.11, Appendix. Paywalled.
- Johnstone, *Stone Spaces* (CUP) II.2, VII.4; Gierz et al. I.1; Picado–Pultr III, VI; Godement II §1; Joyal–Tierney (Memoirs 309); Moerdijk–Vermeulen (Memoirs 705). Paywalled or out of print, no legal copy found.
- Isbell 1972 is an image-only scan read through OCR (isbell1972 at sha `778ee2ad…`); its §3.12 (line 998–1008) is legible, but I did not find an explicit `ℚ × ℚ` statement in the OCR text (R09).

## Source issues

- none
