# Review of ModelCategories (pull request #2269 at 3bceb5a)
Folder: `TauCetiRoadmap/ModelCategoryTheory/ModelCategories/`
**Verdict:** needs changes

## R01 (P2) — Scope does not name the two roadmaps on main that plan instances of §3.3, §7.2 and §§7.5–7.7

**Location** `TauCetiRoadmap/ModelCategoryTheory/ModelCategories/README.md` lines 37–56 (`## Scope and ownership`) and 172–174: "### From TauCetiRoadmap / None."

**Claim** The section lists Mathlib and the sibling Parts only. Main already plans the under-category model structure and Reedy/projective diagram structures at particular carriers; the README neither cites them nor says how its statements differ, so these objects have two owners.

**Witness** Main `TauCetiRoadmap/GeneralizedCohomology/README.md` lines 226–227 (G2 item 1): "the pointed undercategory model structure". Main `TauCetiRoadmap/BordismFormalGroups/README.md` lines 1663–1666 and 1692–1694 (§F6.5): projective diagram models; "Construct their Reedy model structures, latching/matching objects".

**Repair** Add to `## Scope and ownership`: "Two roadmaps on main plan instances of statements kept here in general form. GeneralizedCohomology G2 item 1 builds the model structure on pointed simplicial sets as `Under Δ[0]`; §3.3 is the same structure under an arbitrary object of an arbitrary model category. BordismFormalGroups §F6.5 builds projective diagram structures, latching and matching objects and Reedy model structures for diagrams in its Bergner model category only; §7.2 and §§7.5–7.7 state them for an arbitrary combinatorial, respectively arbitrary, model category."

## R02 (P3) — §5.4.1 and §5.4.2 use the criterion of §5.3.1 at cardinals the stated criterion does not cover

**Location** README line 866: "for arbitrarily large τ with κ ≪ τ, f preserves τ-compact objects (Mathlib `IsCardinalAccessibleCategory.uniformization` …), so the criterion for D₀ gives the criterion for its preimage"; line 838: "for all sufficiently large regular τ with κ ≪ τ".

**Claim** §5.3.1 is stated as an equivalence with the condition at all sufficiently large τ; the routes of §5.4.1 and §5.4.2 establish it only at arbitrarily large (respectively one) τ. The cited Mathlib lemma yields a single cardinal with no relation to κ.

**Witness** Pinned `Mathlib/CategoryTheory/Presentable/Uniformization.lean` line 127: `uniformization … : ∃ (κ : Cardinal.{w}) (_ : Fact κ.IsRegular), …` (one cardinal). HTT line 38098–38100: the proof of the "if" direction fixes one τ.

**Repair** Add to §5.3.1: "For the 'if' direction one regular τ with κ ≪ τ suffices, provided C is locally τ-presentable and the condition holds at τ (HTT, proof of Prop. A.2.6.5, p. 838)." In §5.4.1 replace the parenthesis by "(Mathlib `IsCardinalAccessibleCategory.uniformization` for one cardinal κ₀ ≥ κ, then `uniformization_aux` for every τ sharply above κ₀, for instance the successor of `2 ^ ν` with ν ≥ κ₀, which also satisfies κ ≪ τ)", and add `Cardinal.SharplyLT` to its `*Needs:*`.

## R03 (P3) — The Summary's headline for §5.5 is narrower than the target and the Lean statement

**Location** README line 29: "The preimage of a perfect class under a colimit-preserving functor is perfect (§5.5)."

**Claim** §5.5.1 (line 898), `isPerfect_inverseImage` and the source assume only that the functor preserves filtered colimits.

**Witness** `Suggested.lean` line 211: `[PreservesFilteredColimitsOfSize.{w, w} F]`; HTT line 38365–38367 (Cor. A.2.6.14): a functor "which preserves filtered colimits".

**Repair** Replace the line by: "The preimage of a perfect class under a functor preserving filtered colimits is perfect (§5.5)."

## R04 (P3) — `le_transfiniteCompositions_pushouts` carries a hypothesis implied by another

**Location** `TauCetiRoadmap/ModelCategoryTheory/ModelCategories/Suggested.lean` line 69: `(S : MorphismProperty C) (hS : IsWeaklySaturated.{w} S)`.

**Claim** `hgen : weakSaturation.{w} (…) = S` already makes `S` weakly saturated, so `hS` is redundant and the theorem holds without it.

**Witness** README §1.3.1, second API bullet (line 280): "Any intersection of weakly saturated classes is weakly saturated"; `weakSaturation` is such an intersection (`Suggested.lean` line 48).

**Repair** Delete `(hS : IsWeaklySaturated.{w} S)` from the signature; keep the README sentence "S̄ a weakly saturated class" as it is (it follows from the generation hypothesis).

## R05 (P3) — The description misstates what LocallyPresentableCategories defers to

**Location** Pull request description: "TauCetiProject/TauCetiRoadmap#1926 defers to Part ModelCategories Lurie's form of presentability, weakly saturated classes and the small object argument in a presentable category, and combinatorial model categories."

**Claim** At its head that roadmap hands these objects to HigherToposTheory, the draft this pull request says will be closed; nothing there names Part ModelCategories.

**Witness** LocallyPresentableCategories README at the head of #1926, `## Scope and ownership`, lines 82–84: these "are HigherToposTheory's Layer F1 (§§F1.1, F1.3, F1.6)".

**Repair** Replace the sentence by: "LocallyPresentableCategories leaves Lurie's form of presentability, weakly saturated classes, the small object argument in a presentable category, accessible subcategories and combinatorial model categories to HigherToposTheory Layer F1; with that draft closed, the owner is Part ModelCategories §§1.2–1.5, 5.1 and 6.1, and that roadmap's deferral needs repointing."

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.3 `IsWeaklySaturated`, `weakSaturation` (HTT Def. A.1.2.2, p. 807) | Sets: cofinite-image injections; isos ∪ empty-source maps; S = ∅ | ω-chain ∅→{0}→… has colimit ℕ, complement infinite: not closed. Pushout of ∅→∗ along ∅→∗ is ∗→∗⊔∗: neither. `weakSaturation ∅` = isos via shape `PUnit` | holds; Checks agree | none |
| §1.5 `llp_rlp_eq_weakSaturation` (Cor. A.1.2.7, p. 809) | Sets, I = {∅→∗}; I = {∗⊔∗→∗}; I = ∅ | rlp = surjections, llp = injections = generated class; rlp = injections, llp = surjections; rlp = all, llp = isos | holds | none |
| §2.1 cell trees (Def. A.1.5.1, pp. 817–818; Not. A.1.5.2, p. 818) | empty poset; discrete 2-point poset, root ∗, cells ∅→∗; chain ℕ ∪ {ω} | Y_A = X; Y_A has 3 points under X, 4 in C; ω has ℵ₀ predecessors: ℵ₁-good, not ℵ₀-good | definition and Checks agree with source | none |
| §2.2 (Lemma A.1.5.6, p. 818; Rem. A.1.5.3, A.1.5.5) | A″ = ∅, A′ = A well-ordered | reduces to transfinite composite of pushouts of S | source supports statement | none |
| §2.3 (Lemma A.1.5.11, p. 824) | hypotheses compared | source: sources κ-compact, A κ-small, C κ-accessible; README same; X′ κ-compact (source prints X) | matches | none |
| §2.4 `le_transfiniteCompositions_pushouts` (Prop. A.1.5.12, p. 826; Cor. A.1.5.13, p. 827) | Sets, S̄ = injections, κ = ℵ₁; S̄ = isos | attach points of Y∖X one at a time: no retract; isos = `weakSaturation ∅`, conclusion via shape `PUnit` | holds; `hS` redundant | R04 |
| §3.2 `exists_extension_of_cofibration` (Prop. A.2.3.1, p. 830) | trivial structure on sets; i = id | homotopy classes are maps, g′ = g; g′ = f | holds | none |
| §3.3 `modelCategoryUnder` | S initial; S = Sⁿ in `CochainComplex.Plus`; injective structure on sets under ∗ | `Under ∅ ≌ C`; Sⁿ→0 not mono: not cofibrant; ∗⊔∗→∗ surjective, not injective: fibration only | three classes are `MorphismProperty.under` by construction | R01 (ownership) |
| §3.4 `IsLeftProper`, `isLeftProper_of_isCofibrant` (Def. A.2.4.1, Prop. A.2.4.2, Lemma A.2.4.3, p. 832) | D = (ℤ →id ℤ) in degrees n, n+1; 0→Sⁿ along 0→D | D→Sⁿ is a cochain map, pushout of D→0 is Sⁿ→0: not quasi-iso (leg not mono). Sⁿ→D⊕Sⁿ quasi-iso, D→D⊕Sⁿ not | orientation `IsPushout i j j' i'` matches source square | none |
| §4.1 `isQuillenAdjunction_tfae` | identity injective→trivial on sets; identity trivial→injective | ∅→∗ trivial cofibration ↦ non-bijection, all four fail; fold map cofibration ↦ non-injection, ∗⊔∗→∗ trivial fibration ↦ non-bijection, all four fail | consistent in both directions | none |
| §4.2 `IsQuillenEquivalence`, `isQuillenEquivalence_iff_isEquivalence` (Prop. A.2.5.1, p. 835) | terminal → sets (injective), picking ∅; X ↦ X⊔X on trivial structure | fibrant Y nonempty: ∗→∗ and ∅→Y both weak equivalences; Ho of both sides terminal. ∗→∗×∗ bijection, ∗⊔∗→∗ not | definition is condition (3); theorem consistent | none |
| §5.2 relation κ ≪ τ (Def. A.2.6.3, p. 837) | ℵ₀ ≪ ℵ₀; ℵ₁ ≪ ℵ₁; ℵ₁ ≪ (2^ℵ₀)⁺; τ = (τ₀^κ)⁺ | finite^finite finite: holds; ℵ₀^ℵ₀ ≥ ℵ₁: fails; τ′^ℵ₀ ≤ 2^ℵ₀ < τ: holds; τ′^κ′ ≤ τ₀^κ < τ | matches `Cardinal.SharplyLT.of_pow_lt` hypotheses | none |
| §5.3–5.4 (Prop. A.2.6.5, p. 837; Cor. A.2.6.7, p. 838) | quantifier on τ in statement and in the two routes | statement: all sufficiently large τ; routes: arbitrarily large / one τ; Mathlib `uniformization`: one cardinal | statements true, routes do not meet the stated criterion | R02 |
| §5.5 `IsPerfect`, `isPerfect_inverseImage` (Def. A.2.6.12, Cor. A.2.6.14, p. 843) | W = isos, F constant; sets: isos ∪ finite maps; injections | preimage = all maps, perfect with W₀ finite maps; {0..n}→{0..n,∗} has colimit ℕ→ℕ⊔∗: not stable; 2-of-3 fails | Lean hypothesis is filtered colimits, as source | R03 |
| §6.1 `IsCombinatorial`, `isAccessibleSubcategory_of_isCombinatorial` (Def. A.2.6.1, p. 836; Cor. A.2.6.8, p. 838) | trivial structure on sets | I = {∅→∗, ∗⊔∗→∗}: rlp = bijections, llp = all; J = ∅ gives isos; fibrations = all, accessible | holds | none |
| §6.3 `exists_modelCategory_of_smith` (Prop. A.2.6.10, p. 841) | sets: (Cof, W) = (all, isos); (isos, all) | hypotheses hold in both; output: trivial structure; cofibrations isos, fibrations all: both model structures | five hypotheses equal the source's (1)–(5); finite limits explicit | none |
| §6.3 `exists_modelCategory_of_isPerfect` (Prop. A.2.6.15, p. 843) | W = all, C₀ = ∅; W = bijections, C₀ = {∅→∗, ∗⊔∗→∗} | cofibrations isos, left proper; trivial structure, `hpush`: pushout of a bijection is a bijection | `hpush` squares oriented as source's (2) | none |
| §6.4 `exists_transferred` (Berger–Moerdijk §2.5; §2.6) | proof recomputed for A not presentable; F = G = identity | `(F I).rlp = G⁻¹(I.rlp)`, `F J ⊆ (F I).rlp.llp`, cof ∩ W = generated by F J by retract argument; identity returns A's classes | holds; source's (i) automatic in presentable B | none |
| §7.1 classes (Def. A.2.8.1, pp. 847–848) | J = walking arrow, sets with injective structure | ∅→(∗⊔∗→∗) levelwise injective, no lift against (id on ∗⊔∗)→(∗⊔∗→∗); (∗→∗⊔∗)→(∗→∗) no lift against (∅→∗)→(∗→∗) | Checks correct | none |
| §7.2 `exists_projective` (Prop. A.2.8.2, p. 848) | J discrete | product structure; cofibrations = llp of levelwise trivial fibrations = levelwise cofibrations | holds | R01 (ownership) |
| §7.3 (Lemma A.2.8.10, p. 852) | g identity; g : C′→∗ with C′ discrete | g_! identity; g_! = coproduct over C′ of trivial cofibrations: trivial cofibration | source supports statement | none |
| §7.4 Reedy characterization (Def. A.2.9.1, Rem. A.2.9.2, Ex. A.2.9.5–6, p. 853; Not. A.2.9.11, Rem. A.2.9.12–13, p. 855) | monoid ℕ, W₁ = {id}, W₂ = all; C₂; Δ | ℕ: satisfies source's two conditions, `lt₂` would give deg < deg: excluded; C₂: non-identity iso excluded; [1]→[0] lowers degree 1→0 | README condition on endomorphisms is needed and correct | none |
| §7.5 latching and matching (Not. A.2.9.7, Ex. A.2.9.8, p. 854) | Δ[0] on Δᵒᵖ; J = {0<1}, sets injective | L₁ = point, L₀ = ∅; relative latching map at 1 of (∅→∗)→(∗→∗) is ∗⊔∗→∗ | W₂ = degree-raising class (`lt₂`: deg X < deg Y) indexes latching, as in Lean | none |
| §7.7 `exists_reedy`, `reedyCofibrations_inf_eq`, `reedyFibrations_inf_eq` (Prop. A.2.9.19, p. 859; Lemma A.2.9.20, pp. 859–860) | J discrete; J = {0<1}; J empty | levelwise classes; fibrations levelwise, cofibrations X(0)→Y(0), X(1)⊔_{X(0)}Y(0)→Y(1): projective structure; terminal category | holds; (WF) read as trivial fibration | R01 (ownership) |
| §8.1 (Ex. A.1.3.1, p. 811; Def. A.1.3.4, p. 812; Def. A.1.3.5, pp. 812–813) | sets with ×; finite sets with ⊔; Ab→Set | closed, unit ∗; A⊔− does not preserve ∅: not left-closed; lax structure A×B→A⊗B, no oplax one | `MonoidalClosed` = right adjoints to `tensorLeft` = left-closed | none |
| §8.3 coends (HTT p. 865) | C₂ acting on itself twice; walking arrow, F constant, G representable at 1 | 4 points, (0,0)~(1,1), (0,1)~(1,0): 2 classes; one point | Checks correct | none |

- Source locators checked against the text: 68 in HTT (HTT lines 36532–39400 and 21307), 2 in Berger–Moerdijk (BM lines 229–267); all pages and statement numbers agree with the cited PDF.
- Library declarations opened at the pins (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9): 57 names of the supplier contracts found, among them `AlgebraicTopology/Reedy/Basic.lean:46`, `AlgebraicTopology/ModelCategory/Basic.lean:89–116` (`mk'` needs two-out-of-three and two weak factorization systems only), `CategoryTheory/SmallObject/Basic.lean:127`, `CategoryTheory/MorphismProperty/IsSmall.lean:35`, `CategoryTheory/Presentable/SharplyLT/Lemmas.lean:62`, `CategoryTheory/Presentable/Uniformization.lean:61,127`, `CategoryTheory/MorphismProperty/Comma.lean:112`, Tau Ceti `AlgebraicTopology/SimplicialSet/Join/Basic.lean:358`.
- No pinned declaration states weak saturation, left properness, Quillen adjunctions, combinatorial model categories, perfect classes, an under-category model structure or latching maps (grep of both pins by object).
- Cross-roadmap citations: none in the README; sibling Part SimplicialCategories restates four definitions in its own namespace, no fully qualified name is shared.
- Gate: every check passed. Elaboration of `Suggested.lean`: 17 `sorry` warnings, nothing else. Elaborated signatures compared with the README for all 38 declarations: no binder lost (the listed leads are instance binders that are present).
- One-tactic probe (`rfl`, `infer_instance`, `simp`, `constructor <;> rfl`) on all 17 sorried theorems: none closes. All twelve headline items of the Summary are stated.
- Dependency check: `depcheck: 223 roadmaps, 1972 edges, 0 problem(s)`. No change outside the family folder.
- Overlap check: read LocallyPresentableCategories, HomotopyTheoryOfCategories, PresentableInfinityCategories, AccessibleInfinityCategories, AdjunctionsAndLocalizations, Straightening, BordismFormalGroups, GeneralizedCohomology, EnhancedDerivedSheaves; shared: under-category model structure (instance owned by GeneralizedCohomology G2 item 1), projective and Reedy diagram structures (instances owned by BordismFormalGroups §F6.5), see R01; the Reedy characterization of §7.4.2 is cited, not owned, by HomotopyTheoryOfCategories 7.2 (under the name HigherToposTheory F1.8).
- Source independence: 16 passages compared with 2 sources, none shared beyond standard terms (longest common run 5 words); largest share HTT, 69 of 76 locators; contents compared with HTT Appendix: not one to one (Layer 1 ↔ A.1.1–A.1.2, Layer 2 ↔ A.1.5, Layer 3 ↔ A.2.2–A.2.4, Layer 4 ↔ A.2.5, Layers 5–6 ↔ A.2.6, Layer 7 ↔ part of A.2.8 with A.2.9, Layer 8 ↔ A.1.3–A.1.4 moved last; §3.3, §6.4 and the route of §7.6 are from other sources); the order of Layers 1–7 is that of the Appendix and is forced where 2 needs 1, 4 needs 3, 5 needs 1, 6 needs 1–5 and 7 needs 1 and 6. Hirschhorn, May–Ponto, Adámek–Rosický, Hovey and Crans could not be read.

## Not verifiable

- Hirschhorn, Thm. 7.6.5 (§3.3): AMS book, the sources service found no legal copy.
- May–Ponto, §15.3 (§3.3): publisher page only, no legal copy found.
- Adámek–Rosický, ch. 2 (§5.2, §5.3, §5.4.2): no legal copy found.
- Hovey, §5.1 (§7.6.1): no legal copy found.
- Crans (§6.4.1): resolves to a paywalled page only; cited by locator.

## Source issues

- **Misprint** in HTT at Lemma A.1.5.11, printed page 806: the source says the map X′ → X has X κ-compact; it should be X′ that is κ-compact; affects nothing.
- **Misprint** in HTT at Def. A.2.6.12, printed page 825: the source says W is a class of morphisms in C; it should be in the presentable category A just introduced; affects nothing.
- **Error** in HTT at Def. A.2.9.1, printed page 835: the source's two conditions admit the one-object category of the monoid ℕ with left class the identity and right class everything; it should also exclude non-identity endomorphisms from both classes; affects a stated result.
- **Misprint** in HTT at Rem. A.2.9.10, printed pages 836–837: the source says the matching object is the colimit over the larger category of maps into J; it should be the latching object; affects nothing.
- **Misprint** in HTT at Prop. A.2.9.19, printed page 841: the source says a map is a fibration exactly when it satisfies (WF); it should be a trivial fibration; affects a stated result.
- **Misprint** in HTT at the proof of Lemma A.2.9.20, printed page 842: the source says the comparison maps are to be shown equivalences; it should be cofibrations; affects the proof.
- **Misprint** in HTT at §A.2.9, definition of the coend functor, printed page 847: the source says the target category admits small limits; it should be small colimits, a coequalizer of coproducts being formed; affects nothing.

## For the human reviewers

- **Scope.** The description states that this family is to become the supplier of material that BordismFormalGroups §F6.5 and GeneralizedCohomology G2 item 1 (both on main) plan at particular carriers, and that #1807 assigns the owners differently; which roadmap owns it is left to the maintainers (R01 only asks the README to state the difference).
- **Scope.** 69 of the README's 76 source locators are to the Appendix of HTT, and Layers 1–7 run in the order of its sections A.1.1–A.2.9 (pairs under `Source independence:`); whether that arrangement is acceptable is a human decision.
- **Licence.** HTT was read from the author's page (PDF of 9 April 2017), not the published edition; the README cites that PDF's numbering and pages.
- **Not tested.** Hirschhorn, May–Ponto, Adámek–Rosický, Hovey and Crans could not be read; the wording of §3.3, §5.3 and §7.6.1 was not compared with them.
- The description says three sibling `Suggested.lean` files need a Tau Ceti pin bump before their `build` check passes; this folder imports only Mathlib and builds at the present pins.
