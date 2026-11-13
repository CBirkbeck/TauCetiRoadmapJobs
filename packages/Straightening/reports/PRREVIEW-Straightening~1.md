# Review of Straightening (pull request #2270 at 04df60e)
Folder: `TauCetiRoadmap/InfinityCategoryTheory/Straightening/`
**Verdict:** needs changes

## R01 (P1) — `Suggested.lean` does not build at the pinned Tau Ceti

**Location** `TauCetiRoadmap/InfinityCategoryTheory/Straightening/Suggested.lean` lines 5–7 and 108–127: imports of `TauCeti.AlgebraicTopology.Quasicategory.CatInfty`, `…Quasicategory.Limit`, `…SimplicialNerve.Basic`; `CatInfty.vertex`, `CatInfty.colimit_induction`.
**Claim** The file is the acceptance test against the pinned Tau Ceti; the gate's targeted build exits 1 with three `bad import` errors.
**Witness** Pin `2fd255d` of `lake-manifest.json`: `TauCeti/AlgebraicTopology/Quasicategory/` holds only `Cartesian`, `Core`, `FullSubcategory`, `LocallySmall`, `RightMappingSpace`; `SimplicialNerve/` has no `Basic.lean`.
**Repair** Either the pin bump lands on main first and main is merged into the branch, or: delete lines 5–7 and the `## Layer 3` section, add to the docstring's not-statable list "the generation of `Cat∞` by `Δ[0]` and `Δ[1]` (§3.4, Nikolaus–Scholze, Lemma A.17): it needs `Cat∞` as a simplicial set and colimits in a quasicategory", and drop "`Suggested.lean` declaration `CatInfty.colimit_induction`" from README §3.4.2. Tested: that copy elaborates at the pin with four `sorry` warnings only.

## R02 (P1) — §1.2.1: the straightening of a flat marked simplicial set is not flat

**Location** `README.md` line 229: "`St⁺_φ(X^♭)` marks only degenerate edges, since `G^*` of a degenerate edge is degenerate." The same reason is given in the first Check of §1.1 (line 214) for an unspecified C.
**Claim** For a degenerate edge `s₀(c)` and an edge G of `Map_{Cᵒᵖ}(C, φ c)`, `G^* s₀(c̃)` is the image of G under composition with `c̃`; it is nondegenerate in general.
**Witness** S = Δ[2], φ = 𝟙, X = `{2}^♭`: `(St X)(0) = Map_{C[Δ[2]]}(0, 2) = Δ[1]`, and its nondegenerate edge G gives `G^* s₀(2̃) = G`, marked. HTT line 8322 marks `{a} × Δ[1]` in `St⁺` of `(Δ[n])^♭`.
**Repair** Replace the clause by: "and the marked edges of `St⁺_φ(X^♭)(C)` are the edges `G^* s₀(c̃)`, for c a vertex of X and G an edge of `Map_{Cᵒᵖ}(C, φ c)`; they are all degenerate when the mapping objects of C are discrete, as for C a point or `C[Δ[1]]ᵒᵖ`, and not in general." Add the witness as a negative-control Check of §1.2 (value at 0 is `Δ[1]^♯`, Cartesian equivalent to the fiber Δ[0] of the fibrant replacement `𝟙 Δ[2]`; `Δ[1]^♭` would not be). In the first Check of §1.1 fix "C the point".

## R03 (P2) — Objects owned by a roadmap on main are planned again without citation

**Location** `README.md` lines 43–52 (Scope and ownership names only this family and ModelCategoryTheory); targets §1.5.2–§1.7.2, §1.8.5, §2.3.2, §3.2.2, §3.4.1, §3.4.2, §5.2.1.
**Claim** `BordismFormalGroups` §F6.5 on main already owns marked straightening as a Quillen equivalence, its identification with `Fun(S, Cat∞)` natural under pullback, the Joyal–marked comparison, descent of coCartesian fibrations, generation of `Cat∞` by Δ[0] and Δ[1], and colimits of localizations.
**Witness** `TauCetiRoadmap/BordismFormalGroups/README.md` on main, lines 1966–2002, 2058–2061, 2083–2100; `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` lines 32, 362–364 (limits as coCartesian sections, HTT Cor. 3.3.3.2).
**Repair** One owner per object: a roadmap on main is earlier than this one, so cite `BordismFormalGroups` §F6.5 (by its paragraph titles "Marked fibrations and Kan extensions", "Coherent model diagrams and stable enhancements") for each target it states and keep here only what it does not state, saying so in Scope and ownership; or first land the revision of `BordismFormalGroups` and `EnhancedDerivedSheaves` that hands these objects to this family, and name that order in the description.

## R04 (P2) — "Already in the library" names nine Tau Ceti declarations absent at the pin

**Location** `README.md` lines 54–57 and 121–131: "`SSet.catInfty`", "`SSet.CatInftyΔ`", "`SSet.core_sHom_eq_top`", "`SSet.RightFibration`, `SSet.LeftFibration`", "`SSet.slice.IsLimit`, `SSet.coslice.IsColimit`", "`SSet.Edge.isEquivalence_iff_hornFilling_zero`", "`SSet.isWeaklyContractible_iff_isWeakHomotopyEquivalence`".
**Claim** The supplier contract cites these as existing; none is declared at the pinned Tau Ceti, and the files `CatInfty.lean`, `Limit.lean`, `OuterHorn.lean`, `WeakHomotopyEquivalence.lean` and the folder `AnodyneExtensions/LeftRight/` do not exist there.
**Witness** `grep -rn` of each name over `TauCeti/AlgebraicTopology` at `2fd255d`: no hit. Present there: `SSet.CartesianFibration` (`Quasicategory/Cartesian.lean` line 110), `SSet.Edge.CompStruct.isEquivalence₀₂` (`Quasicategory/Core.lean` line 122), `TauCeti.MarkedSSet` (`SimplicialSet/Marked/Basic.lean` line 49).
**Repair** With the pin bump of R01 on main, no change. Otherwise remove the nine names from "From Tau Ceti" and from "Already in the library", and in each `*Needs:*` line cite the Part that states the object (`Cat∞`, left and right fibrations, limits and colimits in an ∞-category) by section.

## R05 (P3) — Gate rule `imports`

**Location** `Suggested.lean` lines 5–7.
**Claim** Every `TauCeti.*` module imported must exist at the pinned Tau Ceti.
**Witness** Gate at 04df60e: `imports=3`, lines 5, 6, 7, "does not exist at the pinned Tau Ceti".
**Repair** The repair of R01.

## R06 (P3) — Two definitions have two Checks

**Location** `README.md` §1.8.5 (lines 543–548, the ∞-category of coCartesian fibrations) and §1.8.2 (lines 463–468, `Tw`, `D^co`).
**Claim** Each definition carries at least three discriminating Checks.
**Witness** §1.8.5 lists two bullets, §1.8.2 two.
**Repair** §1.8.5, add: "Over S = Δ[1], for `pr₂ : Δ[1] × Δ[1] ⟶ Δ[1]`, whose coCartesian edges are those with degenerate first component, the diagonal is a map over S from `𝟙 Δ[1]` that is not a morphism: `(0,0) ⟶ (1,1)` is not coCartesian. Taking all maps over S would admit it." §1.8.2, add: "`Tw(Δ[1])` has three vertices and two nondegenerate edges and no nondegenerate 2-simplex, while the arrow ∞-category `Fun(Δ[1], Δ[1]) = N(00 ⟶ 01 ⟶ 11)` has one; a definition by arrows and commuting squares would give the latter."

## R07 (P3) — §1.1.1: the description of `Un⁺_φ` is not at the cited locator

**Location** `README.md` lines 205–208: "an edge is marked when its map extends over `St⁺_φ(Δ[1]^♯)` (HTT, Def. 3.2.1.2, p. 189)".
**Claim** The cited definition contains the explicit description of marked unstraightening.
**Witness** HTT lines 8194–8203: Def. 3.2.1.2 defines `St⁺_φ` only; `Un⁺_φ` appears in Cor. 3.2.1.5 (HTT lines 8233–8239), by the adjoint functor theorem, the direct construction left to the reader.
**Repair** "(HTT, Def. 3.2.1.2, p. 189, for `St⁺_φ`; `Un⁺_φ` is the right adjoint of HTT, Cor. 3.2.1.5, p. 190, which does not write it out; the description here is the adjunction evaluated on `Δ[n]^♭` and `Δ[1]^♯`)".

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §1.2.1 flat markings | S = Δ[2], X = `{2}^♭`, φ = 𝟙 | `(St X)(0) = Δ[1]`; nondegenerate edge marked; README predicts unmarked | refuted, R02 |
| §1.2 Check 2, Conventions (variance) | S = Δ[1], C = `C[Δ[1]]ᵒᵖ` | mapping objects Δ[0], so G degenerate; values `Δ[1]^♭` at 0, Δ[0] at 1 | agrees |
| §1.3.1 | HTT 3.2.1.4 (1)–(3), Cor. 3.2.1.5 | pp. 189–190; `Map^♯` enrichment sends `G^*(vertex)` to a marked edge, so simplices of `Un⁺` are those of `Un` | agrees |
| §1.4.1 | generators of HTT 3.2.1.7, four cases of 3.2.1.11 | composition generator: E = degenerate, `Δ[1]×{0}`, `Δ[1]×{1}`, `{1}×Δ[1]` (HTT lines 8349–8350) | agrees; the cube markings contradict §1.2.1 (R02) |
| §1.6.1 | HTT 3.2.3.1–3.2.3.4 | pp. 206, 206, 207, 209; 3.2.3.2 needs φ essentially surjective and fibrant objects, as stated | agrees |
| §1.7.1 (headline) | S = Δ[0], C a point | T is a Quillen self-equivalence (3.2.3.1); Thm. 3.2.0.1 p. 187, Lemmas 3.2.4.1, 3.2.4.2 pp. 210–211 | agrees |
| §1.8.2 | m = 1; K = Δ[1] | `A₁` = path `0'–0–1–1'` in Δ[3]; `Tw(Δ[1]) = N(00 ⟵ 01 ⟶ 11)`, no edge 00 ⟶ 11 over 0 ⟶ 1 | Kan hypothesis needed |
| §1.8.4, §1.8.5, §2.1.2 dual | S = Δ[0] | `(op ∘ f)ᵒᵖ` classifies `Xᵒᵖ`: `X ≃ f(∗)`; HTT's literal wording: `f(∗) ≃ Xᵒᵖ` | README's convention matches 3.2.5.21 (3) |
| §2.1.1 | edge D ⟶ C of `Cat∞ᵒᵖ` from g : C ⟶ D | Cartesian transport from the fiber over the target: `U(C) ⟶ U(D)`, the direction of g | agrees |
| §2.2.1 (headline, Lean) | S = T, j = 𝟙; X = ∅ | Y = X, f the pullback isomorphism; Y = ∅ | elaborates at the pin |
| §2.3.1 (headline, Lean) | X = ∅; `𝟙 Λ[2,1]` | lifting forces A = B = ∅; base not an ∞-category, statement still holds | elaborates at the pin |
| §2.3.2 (headline) | S = Δ[1] | `{1}^♭ ⊆ Δ[1]^♯` marked anodyne (n = 1 generator); `{1} ⊆ Δ[1]` not a categorical equivalence | Kan hypothesis needed, as HTT 3.1.5.3 |
| §2.4.1, §2.4.3 (Lean) | S = ∅; route inputs | both sides true; Part CartesianFibrations §7.2.1 (∞-category base), §7.3.1 (any base) at the head do not use the target | not circular |
| §2.6.1 | HTT p. 233 | `St⁺_φ(K^♯ × Z) ⟶ St⁺_φ(K^♯) ⊠ St⁺(Z) ⟶ δ St⁺(Z)`, injective structure | agrees |
| §3.2.1, §3.2.3 (headline) | K = ∅ | `Map^♭(Δ[0]^♯, C^♮) = C ⟶ Δ[0]` an equivalence iff C ≃ Δ[0]; spaces: X̄ contractible | agrees |
| §3.3.1, §3.3.2 (headline) | K = ∅; K = Δ[1] | `∅ ⊆ X̄^♮` equivalence iff X̄ = ∅; colimit of `X₁ ⟶ X₀` is `X₀` | agrees |
| §3.4.1 Check | `Λ[2,0] ⊆ Δ[2]` | isofibration of posets; no lift of 1 ⟶ 2 from 1; pushout has 2 components, `Λ[2,0]` has 1 | agrees |
| §3.4.2 (headline, Lean) | Kan complexes; K = ∅ | contains Δ[0], closed under colimits, misses Δ[1]; `hcolim` at ∅ gives P(∅) | matches A.17; not elaborable (R01) |
| §4.1.2 (headline) | Y = S, δ = 𝟙 | HTT 4.3.3.10 p. 308: p, q coCartesian, δ preserves coCartesian edges; equivalences detected pointwise | agrees |
| §5.1.1 | C = [1], D = C' = D' = ∗ | `q^*` picks 0, γ = (0 ⟶ 1), not invertible; right mate is `𝟙₁` | left and right separated |
| §5.1.3 (headline) | Liu–Zheng 2.2.4, I = {1,2}, J = {2} | conditions (1), (2) and conclusions (1)–(4) at lines 3906–3918, pp. 79–80 | agrees |
| §5.2.1 | K = ∅; NS lines 6799–6806 | ∅ ⟶ ∅; `Fun(colim, D) ≃ lim Fun^{W_i} ≃ Fun^W(X, D)`, p. 143 | agrees |
| §5.3.1 | Δ[2], fibers [1], `s_!` constant 1, `t_!` = 𝟙 | `Lt_! ∘ Ls_!` = 0, `Lu_!` = 1, comparison 0 ⟶ 1 | condition 3 independent |
| §5.3.3 (headline) | NS A.14 | p. 138, S an ∞-category, three assertions; README requires ∞-categories in §5.3.1 | agrees |
| Conventions witnesses | C = Δ[1]; C = Δ[0] ⊔ Δ[0] | monotone maps: 4 from [2], 5 from {0<1, 0<2}; 2 and 4 objects | agrees |
| §1.9.1 Check 2 | C = [1], f picks 0 in Δ[1] | edges over 0 ⟶ 1 end at b with an edge 0 ⟶ b: b = 0, 1 | agrees |

- Source locators checked against the text: 95 (HTT 80, Nikolaus–Scholze 9, HA 4, Liu–Zheng 2); every page the README gives matches the PDF page of the edition in References.
- Library declarations opened at the pins: 19; 10 present (Mathlib `SSet.QCat.bicategory` `Quasicategory/StrictBicategory.lean` line 66, `HomotopicalAlgebra.ModelCategory.over` `ModelCategory/Over.lean` line 143, `CofibrantBrownFactorization` `BrownLemma.lean` line 48, `SSet.opFunctor`, `SSet.hoFunctor`, `SimplicialNerve`, `anodyneExtensions`, `innerAnodyneExtensions`; Tau Ceti `CartesianFibration`, `MarkedSSet`), 9 absent (R04).
- `SSet.CartesianFibration` at the pin: an inner fibration with a Cartesian lift of every edge ending at the image of a vertex; no hypothesis on the base.
- Cross-roadmap citations resolved: 131 distinct `Part X §a.b.c` ids, against the four earlier Parts at this head and the four ModelCategoryTheory Parts at the head of their pull request; none missing. No earlier Part cites this one as a supplier.
- Dependency check: `depcheck: 223 roadmaps, 1972 edges, 0 problem(s)`.
- Gate: fails on `imports=3` and `build=7`; every other check 0. No change outside the pull request's own folders.
- Elaboration: the full file cannot be elaborated at the pin. A copy without lines 5–7 and Layer 3 elaborates with `sorry` the only warning; `#check @name` of its seven declarations agrees with README §2.2.1, §2.3.1, §2.4.1, §2.4.3 (no binder lost). One-tactic probe (`simp`, `rfl`, `infer_instance`) closes none of the four theorems.
- Description read against the head: no sentence contradicted for this folder (new roadmap, 22.1k words, pin stated).

Overlap check: read EnrichedLocalization, KanQuillen, SimplicialCategories, ModelCategories, BordismFormalGroups, EnhancedDerivedSheaves, GeneralizedCohomology; marked straightening, its `Fun(S, Cat∞)` form, descent, generators of `Cat∞`, colimits of localizations: owner BordismFormalGroups §F6.5 (main); limits as coCartesian sections: EnhancedDerivedSheaves E0.7 (main); see R03. Nothing shared with the ModelCategoryTheory Parts.

Source independence: 24 passages compared with 4 sources, none shared beyond formulas and phrases of at most 8 words; largest share HTT, 427 of 457 locators; contents compared with HTT: Layer 1 ↔ §3.2 and Layers 2–3 ↔ §3.3 in the same order, forced by the `*Needs:*` lines of §2.2.1 (§1.7.1) and §3.2.1 (§2.5.2, §2.6.1); sections are not one to one (§1.1–§1.5 ↔ §3.2.1, §2.3.2 ↔ §3.1.5, §1.8, §3.3.3, §3.4 and Layers 4–5 outside that run): independent.

## Not verifiable

- `CatInfty.vertex` and `CatInfty.colimit_induction`: their carriers are not at the pin, so their elaborated types were not compared with README §3.4.2.
- The description's statement that all files elaborate against Tau Ceti `8b9f13d993`: that commit is not the pin and was not built.
- Ownership against the board's unpublished packages was not checked; main and the open pull requests were.

## Source issues

- **Misprint** in HTT at Prop. 3.3.3.1, p. 232, and Cor. 3.3.3.2, p. 234: the source says the diagram into the opposite of `Cat∞` is a diagram in the ∞-category of spaces; it should be of ∞-categories; affects nothing.
- **Misprint** in HTT at the proof of Prop. 3.3.3.1, p. 233: the source says the fibration may be taken to be the straightening of the diagram; it should be its unstraightening; affects nothing.
- **Misprint** in HTT at the proof of Prop. 3.3.4.2, p. 237: the source says the diagram is the nerve of a functor on the cone category; it should be on its opposite; affects nothing.
- **Misprint** in HTT at Remark 7.3.1.3, p. 769: the source says the map P induces a second functor named `q′_*` from D′ to D; it should be `p_*`; affects nothing.
- **Error** in HTT at Def. 3.3.2.2, p. 229: the source says a map to `Cat∞` classifies a coCartesian fibration when its opposite classifies the opposite fibration; it should compose with the opposite-category involution of `Cat∞`, as Prop. 3.2.5.21 (3) uses; affects a stated result.

## For the human reviewers

- **Scope.** The description asks the maintainers to choose the owner of marked straightening, `Cat∞` colimits and descent between `BordismFormalGroups` §F6.5 on main (README lines 1966–2100) and this family; R03 depends on that choice.
- **Not tested.** Eleven of the family's `Suggested.lean` files need a Tau Ceti newer than the pin `2fd255d`; whether to bump the pin before this pull request is a decision outside the folder (R01, R04).
