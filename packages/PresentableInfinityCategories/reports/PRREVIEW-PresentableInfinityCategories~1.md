# Review of PresentableInfinityCategories (pull request #2270 at 04df60e)
Folder: `TauCetiRoadmap/InfinityCategoryTheory/PresentableInfinityCategories/`
**Verdict:** needs changes

## R01 (P1) — `Suggested.lean` does not build at the pins

**Location** `TauCetiRoadmap/InfinityCategoryTheory/PresentableInfinityCategories/Suggested.lean` lines 8, 9, 11: "public import TauCeti.AlgebraicTopology.Quasicategory.FullyFaithful", "…Quasicategory.Limit", "…SimplicialSet.WeakHomotopyEquivalence".
**Claim** The file is stated against the pinned Tau Ceti.
**Witness** Gate `build`: exit 1, "bad import" for the three modules. Pinned Tau Ceti (`lake-manifest.json`, rev 2fd255d) has no `Quasicategory/FullyFaithful.lean`, `Quasicategory/Limit.lean`, `SimplicialSet/WeakHomotopyEquivalence.lean`; so no `SSet.slice.IsLimit`, `SSet.coslice.IsColimit`, `IsFullyFaithful`, `SSet.IsWeakHomotopyEquivalence`.
**Repair** Until the pin carries these modules: delete the three imports and the Layer 4 and Layer 7 sections, and name §4.5.1 and §7.6.1 (fourth assertion) in the docstring as not statable (missing: limit and colimit cones in a quasicategory, fully faithful maps). Keep Layer 9 with `public import TauCeti.AlgebraicTopology.SimplicialSet.WeakEquivalence` and `def weakHomotopyEquivalences : MorphismProperty SSet.{u} := HomotopicalAlgebra.weakEquivalences SSet.{u}` (the pinned scoped instance `SSet.modelCategoryQuillen.instCategoryWithWeakEquivalences`). Tested: with that change the Layer 9 section elaborates at the pins, `sorry` the only warning. If the pin is moved first instead, no change to the file is needed, and the next review elaborates it as it is.

## R02 (P3) — gate `imports`: three modules absent at the pinned Tau Ceti

**Location** `Suggested.lean` lines 8, 9, 11 (as in R01).
**Claim** Each imported `TauCeti.*` module exists at the pinned Tau Ceti.
**Witness** Gate `imports` (3): "TauCeti module TauCeti.AlgebraicTopology.Quasicategory.FullyFaithful does not exist at the pinned Tau Ceti", likewise `Quasicategory.Limit` and `SimplicialSet.WeakHomotopyEquivalence`.
**Repair** The repair of R01.

## R03 (P2) — supplier contract cites Tau Ceti declarations that are not at the pin

**Location** `README.md` lines 116 and 118: "`SSet.slice.IsLimit` and `SSet.coslice.IsColimit` (`TauCeti/AlgebraicTopology/Quasicategory/Limit.lean`)" and "`SSet.catInfty` (`TauCeti/AlgebraicTopology/Quasicategory/CatInfty.lean`)"; also line 72 and the `*Needs:*` of §4.7.1, §5.7.1, §5.7.2, §6.4.1, §6.7.1, §6.8.1.
**Claim** "From Tau Ceti" lists declarations of the pinned library.
**Witness** At the pin `TauCeti/AlgebraicTopology/Quasicategory/` contains only `Cartesian`, `Core`, `FullSubcategory`, `LocallySmall`, `RightMappingSpace`; `catInfty`, `slice.IsLimit`, `coslice.IsColimit` occur nowhere in the pinned sources. The other four Tau Ceti bullets resolve (see the counts).
**Repair** Replace the two bullets by citations of the Parts that state the notions (limit and colimit diagrams: Part InfinityCategoryFoundations §1.2.4; `Cat∞`: Part LimitsAndKanExtensions §3.8.1), and repoint the six `*Needs:*` lines and line 72 the same way; restore the Tau Ceti names when the pin has them.

## R04 (P2) — presentability targets already owned by EnhancedDerivedSheaves on main, not cited

**Location** `README.md` lines 50–61 (`## Scope and ownership`), which names no roadmap on main; targets §1.1.1, §1.6.1, §2.1.2, §2.2.2, §4.4.1, §5.2.1, §5.2.6, §5.7.1, §7.1.1, §7.3.1.
**Claim** This Part is the single owner of these objects.
**Witness** main, `TauCetiRoadmap/EnhancedDerivedSheaves/README.md`: line 390 `IsPresentable`; 403 `isPresentable_iff_accessibleLocalization`; 1155 `representable_iff_preservesLimits`; 1167 `adjointFunctorTheorem`; 1179 `accessibleLocalization`; 1626–1648 `PrL`, `PrR`, `presentable_limit`, `presentable_limit_right`; 1746 compactly assembled; 1915 `nonabelianDerived` (`PΣ`).
**Repair** A roadmap on main is the earlier owner. Either cite those targets in `## Scope and ownership` and delete or narrow the ten targets to what main does not state (each kept variant says in one clause how it differs), or bring into this pull request the revision of EnhancedDerivedSheaves that replaces its targets by citations of this Part, with an old → new table for the ids it drops. The pull request's description leaves the choice open; the folder cannot be accepted with two owners.

## R05 (P3) — eight supplier citations name the wrong item

**Location** `README.md` lines 352 and 749 ("Part InfinityCategoryFoundations §4.1.1 (HTT, Prop. 1.2.9.2)"); 699 and 710 ("Part PresheavesAndCompletions §1.3.1 (HTT, Prop. 5.1.3.1; Lemma 5.1.5.2)"); 699 ("§6.5.1 (HTT, Lemma 5.3.5.7; the arguments of Lemma 5.3.5.8 and Prop. 5.3.5.11)"); 865 ("Part CartesianFibrations §5.2.1 (HTT, Def. 3.1.1.1"); 1025 ("§10.1.2 (HTT, Def. 2.3.4.1; Def. 5.5.6.1)"); 1147 and 1149 ("Part SimplicialCategories … §4.4.2 (HTT, Cor. A.2.9.30, Ex. A.2.9.31)").
**Claim** Each cited item states the cited result.
**Witness** At this head: InfinityCategoryFoundations §4.1.1 is the pushout-join lemma, Prop. 1.2.9.2 is in the opening of §4.1 (line 1049); PresheavesAndCompletions Lemma 5.1.5.2 is §1.3.3, Lemma 5.3.5.8 is §6.5.2, Prop. 5.3.5.11 is §6.5.4; CartesianFibrations Def. 3.1.1.1 is in the opening of §5.2 (line 779); InfinityCategoryFoundations Def. 5.5.6.1 is §10.1.3; SimplicialCategories Ex. A.2.9.31 is §4.4.3.
**Repair** Write: "Part InfinityCategoryFoundations §4.1 (HTT, Prop. 1.2.9.2)"; "§1.3.1 (HTT, Prop. 5.1.3.1) and §1.3.3 (HTT, Lemma 5.1.5.2)"; "§6.5.1 (HTT, Lemma 5.3.5.7), §6.5.2 (the argument of Lemma 5.3.5.8) and §6.5.4 (the argument of Prop. 5.3.5.11)"; "Part CartesianFibrations §5.2 (HTT, Def. 3.1.1.1)"; "§10.1.2 (HTT, Def. 2.3.4.1) and §10.1.3 (HTT, Def. 5.5.6.1)"; "§4.4.2 (HTT, Cor. A.2.9.30) and §4.4.3 (HTT, Ex. A.2.9.31)".

## R06 (P3) — wrong page for HTT Cor. 5.2.2.5

**Location** `README.md` line 559: "Over Δ[1], a presentable fibration is an adjunction between presentable ∞-categories (HTT, Cor. 5.2.2.5, p. 357)."
**Claim** Cor. 5.2.2.5 is on page 357 of the cited PDF.
**Witness** HTT line 16214: Corollary 5.2.2.5 begins on PDF page 359 (Part AdjunctionsAndLocalizations line 385 gives p. 359).
**Repair** "(HTT, Cor. 5.2.2.5, p. 359)".

## R07 (P3) — eleven declarations of `Suggested.lean` are not named in the README

**Location** `Suggested.lean` lines 67–118, 142–167, 207: `IsLimitDiagram`, `IsLeftExact`, `cospanCoord₁`, `cospanCoord₂`, `coneShape`, `IsPullbackSquare`, `IsReflectiveLocalization`, `IsColimitDiagram`, `HomotopicRelBoundary`, `IsNCategory`, `weakHomotopyEquivalences`.
**Claim** Every Lean name appears in the README.
**Witness** `grep -c` of each backticked name in `README.md` gives 0; the other eight declared names each occur once.
**Repair** In §4.5.1, §7.6.1 and §9.1.1 add one sentence each naming the repeated definitions the statement uses and their owners (Part InfinityCategoryFoundations §1.2.4 and §10.1, Part AdjunctionsAndLocalizations §2.1.1, ModelCategoryTheory, Part KanQuillen §3.1.1), as the module docstring already does. (After R01's first repair only `weakHomotopyEquivalences` remains.)

## R08 (P3) — undefined label "manual:" in a locator

**Location** `README.md` line 992: "Prove the dual statement for totalizations (manual: the dual of HA, Lemma 1.3.3.10 and of its proof, pp. 102–103)."
**Claim** Locators are written in the README's one form.
**Witness** "manual:" occurs once in the file and is defined nowhere; every other locator is "(source, statement, page)".
**Repair** "(the dual of HA, Lemma 1.3.3.10 and of its proof, pp. 102–103)".

## R09 (P3) — section comments of `Suggested.lean` do not carry the README's layer titles

**Location** `Suggested.lean` lines 59, 132, 198: "## Layer 4: The pullback criterion for left exact localizations", "## Layer 7: Geometric realizations in n-categories", "## Layer 9: Product-preserving simplicial functors".
**Claim** Section comments are `## Layer k: <title>` with the README's titles.
**Witness** `README.md`: "## Layer 4: Localization at a small set of morphisms", "## Layer 7: `P_Σ` and projectively generated ∞-categories", "## Layer 9: Product-preserving simplicial functors and Bergner's comparison".
**Repair** Use the README's three titles; the present titles can follow as the first sentence of each section comment.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.2.1 local objects (HTT Def. 5.5.4.1, p. 491) | Δ[1], S = {0→1}; spaces, S = fold map | Z=0: `Map(1,0)=∅`, `Map(0,0)=pt`, not local; Z=1 local. Fold: local ⇔ `Z ≃ Z×Z` ⇔ empty or contractible; S¹ excluded | agrees | none |
| §1.4.1–1.4.3 (HTT 5.5.1.3, 5.5.1.4, 5.5.7.2, 5.5.7.3; pp. 477, 519) | π₀ : spaces → sets | inclusion preserves filtered colimits ⇒ π₀(finite space) finite set | hypotheses and pages match | none |
| §2.1.1 (HTT Lemma 5.5.2.1, p. 480) | K = Δ[0] | `Map(j(pt), f) ≃ f(pt)`; source's "corepresented" would give `Map(f, j(pt))` | README's variance correct | none |
| §2.1.2–2.1.4, §2.2.2 (HTT 5.5.2.2, 5.5.2.4, Rem. 5.5.1.7, 5.5.2.9) | S, object Δ[0], K discrete non-small | `Map(Δ[0], ∂Δ[1])^K` has `2^K` components, not small | smallness caveat needed, present | none |
| §4.1.1, §4.1.3 saturation Checks | π₀-surjections; monomorphisms | `fold ∘ incl = id`, incl not π₀-surjective; pushout of `∅→∂Δ[1]` gives `∂Δ[1]→Δ[0]`, not mono | agree | none |
| §4.5.1 = `isLeftExact_iff_isEquivalence_pullback` (HTT 6.2.1.1, p. 589) | X=Y=Δ[0]; X=N[1]→Δ[0]; π₀ on spaces | both sides true, true; π₀: `pt→S¹` inverted, pullback `ℤ→pt` not, both sides false | iff holds; edge `(t,1)` hypothesis, `(t,0)` conclusion, direction right | none (R01) |
| §4.7.1–4.7.5 (HTT Not. 5.3.6.1, Prop. 5.3.6.2, pp. 430–433) | C=∂Δ[1], 𝒦={∅}, R={∅^▷→a} | local F: F(a) contractible; `Lj(a)=(pt,∅)`, `Lj(b)=(pt,pt)`; result N{0<1}; unlocalized closure 3 objects | agrees with (1)–(3) | none |
| §5.1.1 `Pr^L`, `Pr^R` Checks | `pt: Δ[0]→S`; `X↦X×X` | point not initial; `(1⊔1)²` has 4 components, `1²⊔1²` has 2 | agree | none |
| §5.7.1, §5.7.3 compactly assembled (SAG 21.1.2.1–21.1.2.14, pp. 1584–1589) | [0,1]; O(ℚ); ∅; ordinals | `V∘U(x)=sup([0,x)∪{0})=x`; only ∅ ≪ ℚ in O(ℚ), so `G F(ℚ)=∅≠ℚ`; successor ordinals compact | agree with Thm. 21.1.2.10 | none |
| §6.1.1–6.1.5 (HTT 5.5.6.5–5.5.6.16, pp. 512–514) | Rem. 5.5.6.7 at k=−2 | `Map_M(D′,C)=∅`, not contractible: C not (−2)-truncated in M, is in the fiber | README's restriction k ≥ −1 right | none |
| §6.2.1–6.2.4 (HTT 5.5.6.18, 5.5.6.22, 5.5.6.28, 5.5.7.4) | `X↦X×A` on S | `τ≤0(X×A)=π₀X×π₀A ≠ π₀X×A`; not left exact | left exactness needed, stated | none |
| §6.3.1–6.3.3 (HTT 5.5.6.23–5.5.6.27, pp. 516–518) | constant pretower S¹; sets tower pt,2,2,…,pt; ∏K(ℤ,n) | `τ≤0S¹=pt≠S¹`; bijection only at k′=0; k=n works, no uniform k | agree | none |
| §6.5.1–6.5.4, §6.6.1 (HTT 7.3.4.2–7.3.4.7, pp. 787–788) | closed subsets of ℝ; `D_k(n)` | `{0}∩⋁[1/k,1]={0}`, `⋁({0}∩[1/k,1])=∅`; `∏colim=pt`, `colim∏=∅` | agree | none |
| §6.7.1, §6.8.1 (HA A.7.10–A.7.11, p. 1440; SAG 4.5.3.1, p. 403) | C=Δ[0]; C a set | `G(C)` constant at point, at the set | agree | none |
| §7.3.1, §7.3.2 (HTT 5.5.8.15, 5.5.8.17, pp. 528–529) | C = finite sets | `P_Σ(C)=S`, derived functor of FinSet→Set is π₀ | three assertions match | none |
| §7.5.1 (HTT Rem. 5.5.8.26, p. 533) | f.g. free abelian groups, F(ℤ)=K(A,1) | `τ≤0F` has value `π₀K(A,1)=pt`, the zero group | agrees | none |
| §7.6.1 = `isColimitDiagram_iff_truncated_of_isNCategory` (HA 1.3.3.10, pp. 102–103) | n=0 poset; n=1 sets; n=−1 for `IsNCategory` | poset: all `U_k=U_0`, colimit `U_0` both sides; sets: coequalizer of `X_1⇉X_0` both sides; n=−1: ∅ or Δ[0] | holds; Lean is the strict n-category case, said in README and docstring | none (R01) |
| §9.1.1 = `exists_modelCategory_productPreserving` (HTT 5.5.9.1, p. 534) | C terminal | A ≃ terminal category; structure exists; simplicial clause dropped and named | elaborates at pins with R01's repair | R01 |
| §9.2.1–9.2.3 (HTT Not. 5.5.9.4, Rem. 5.5.9.5, Not. 5.5.9.11) | C terminal; `M(Δ[1])`; `M(∂Δ[1])` | `Env⁺=FinSet^op`, ∅ final, `L⁺(F)=F^∅=pt`; 3 vertices, 7 edges; 3 vertices discrete | agree | none |
| §9.3.1 = `nonempty_fullyFaithful_localizedFunctor_productPreserving` (HTT 5.5.9.2, p. 535) | C terminal | J=∅ gives `F(*)→pt` weak equivalence: image = weakly contractible, = image of terminal hA | elaborates at pins with R01's repair | R01 |
| §9.4.1, §9.4.2 (HTT 5.5.9.3, 5.5.9.14, 5.5.9.15, pp. 535, 543) | C terminal; C = (f.g. free abelian groups)^op | `N(A°)=Δ[0]=P_Σ(Δ[0])`; simplicial abelian groups | agree; not statable, named in docstring | none |
| §1.6.1 (HTT Thm. 5.5.1.1, p. 475) | Δ[0], ∅, Set^op, [0,1], ℕ∪{∞} | presentable; no initial object; not accessible; ℵ₁-accessible, only 0 compact; compactly generated | six conditions match | R04 |
| §2.2.2, §4.4.1, §4.4.2 (HTT 5.5.2.9, 5.5.4.15, 5.5.4.20) | S={fold} on spaces; C=Δ[0], S all | `S⁻¹S` = {∅, pt}; `S⁻¹C=C` | statements and hypotheses match | R04 |
| §5.1.2 (HTT Def. 5.5.3.2, Cor. 5.2.2.5) | transport `X↦X⊔X` | `pt⊔pt≠pt`: no left adjoint, not coCartesian | agrees | R06 |

- Source locators checked against the text: 62 HTT statement pages by script (61 match, R06), and 58 statements read at their lines (HTT 36, SAG 15, HA 7); Dugger Thm. 1.1 (arXiv v1 line 37).
- Library declarations opened at the pins: `SSet.CartesianFibration` (`Quasicategory/Cartesian.lean:110`), `SSet.Edge.IsCartesian` (`:65`), `SSet.IsLocallySmall` (`Quasicategory/LocallySmall.lean:66`), `SSet.IsCardinalFiltered` (`SimplicialSet/CardinalFiltered.lean:63`), `SSet.fullEnhancedSubcategory` (`Quasicategory/FullSubcategory.lean:53`), `SSet.modelCategoryQuillen.instCategoryWithWeakEquivalences` (`SimplicialSet/WeakEquivalence.lean`), Mathlib `Functor.essImage` (`CategoryTheory/EssentialImage.lean:45`), `piComparison` (`Limits/Shapes/Products.lean:448`); three absent (R03).
- Cross-roadmap citations resolved: 505 section citations against the seven earlier Parts at this head and the four ModelCategoryTheory Parts at their open head; 497 resolve to the cited statement, 8 name the wrong item (R05).
- Repeated definitions: the ten of Layers 4 and 7 have the same bodies as in the owning Parts' `Suggested.lean` (different namespaces; no shared fully qualified name).
- Gate: FAIL (`imports` 3, `build` 7); every other check 0. Dependency check: `depcheck: 223 roadmaps, 1972 edges, 0 problem(s)`.
- Elaboration: the file as it is cannot elaborate at the pins (R01); the Layer 9 section with R01's repair elaborates, `sorry` the only warning, and the `#check` types of both theorems carry `[SmallCategory C] [HasFiniteProducts C]`. Padding probe by reading: no declaration closes in one tactic; none restates a definition.
- Pull request text: read against the head for this folder (word count 31.4k, suppliers, the pin paragraph); no sentence contradicted. No change outside the family folder.
- Overlap check: read EnrichedLocalization, ModelCategories, SimplicialCategories, ModelCategoryTheory, KanQuillen (open), EnhancedDerivedSheaves, BordismFormalGroups (main); presentable ∞-categories, representability, the adjoint functor theorem, localization at a small set, limits in `Pr^L`/`Pr^R`, `P_Σ`, compactly assembled: owner on main EnhancedDerivedSheaves (R04); left Bousfield localization and Dugger's theorem: EnrichedLocalization (cited); weak homotopy equivalences: KanQuillen (cited). Ownership against the 218 listed open heads was checked with the roadmaps search only for these objects.
- Source independence: 16 passages compared with 3 sources (and a search for shared runs of 8 or more words over the whole README and Lean file), longest shared run 16 words (the definition of §6.5.1, HTT line 35688), none a copied passage; largest share HTT, about 885 of about 943 locator mentions; contents compared with HTT §5.5: Layers 2, 7, 9 have the scope of §§5.5.2, 5.5.8, 5.5.9, Layers 1, 3, 4, 5, 6, 8 do not match a section (§5.5.3 and §5.5.4 are each split over two layers, §5.5.5 is merged into Layer 4), order forced by §1.6 → §2.1 → §3 → §4.4 → §5, §6.2 → §7 → §9: independent.

## Not verifiable

- Adámek–Rosický, Thm. 1.64 and Cor. 2.47 (a Check of §1.1.1): no legal copy found by the sources service; cited by locator only.
- `Suggested.lean` Layers 4 and 7 at the pins: their carriers are absent (R01); their statements were checked by reading, not by elaboration.

## Source issues

- **Misprint** in HTT at Lemma 5.5.2.1, PDF p. 480: the source says the composite of the Yoneda map out of S with the functor corepresented by f is f; it should be the opposite Yoneda map composed with the functor represented by f; affects nothing.
- **Gap** in HTT at Remark 5.5.1.7, PDF pp. 478–479: the source says the tensor `C ⊗ S` exists for every simplicial set S; it should be for every small simplicial set, as the mapping-space formula fails for a non-small discrete S; affects a stated result.
- **Error** in HTT at Remark 5.5.6.7, PDF p. 512: the source says the object C is k-truncated in the total space M for every k ≥ −2; it should be for k ≥ −1 in M, and for all k in the fibre; affects nothing.
- **Misprint** in HTT at Remark 5.5.6.27, PDF p. 518: the source says a highly connected tower whose underlying pretower is highly connected is a Postnikov tower; it should be whose underlying pretower is a Postnikov pretower; affects nothing.
- **Misprint** in HTT at Lemma 5.5.9.9, proof of (1), PDF p. 537: the source says G preserves fibrations and trivial cofibrations; it should be fibrations and trivial fibrations; affects nothing.
- **Misprint** in SAG at Remark 21.1.2.6, p. 1585: the source says the agreement follows from HTT Prop. 5.3.5.3 and an unresolved corollary reference; it should be HTT Cor. 5.3.5.4; affects nothing.
- **Misprint** in SAG at Remark 21.1.2.12, p. 1587: the source says compactly assembled ∞-categories are those of Definition 21.1.2.5; it should be Definition 21.1.2.1; affects nothing.

## For the human reviewers

- Ownership: the description asks the maintainers to choose between this family and EnhancedDerivedSheaves E0.8, E3.2, E5 and BordismFormalGroups §F6.5 (main), and pull request #1807; R04 records the overlap with EnhancedDerivedSheaves by line.
- Pin: `Suggested.lean` needs Tau Ceti modules newer than the pinned 2fd255d (`lake-manifest.json`); the description asks for a separate pin bump. Whether to bump first or restate (R01) is not the author's alone.
- Licence: HA (version of 18 September 2017) and SAG (version of 3 February 2018) are unpublished manuscripts read from the author's page; 54 locators rest on them.
- Arrangement: about 94% of the locators are HTT's, and Layers 2, 7, 9 have the scope of HTT §§5.5.2, 5.5.8, 5.5.9; the other six layers do not map onto a section.
- Not tested: Adámek–Rosický could not be read; two locators of one Check rest on it.
