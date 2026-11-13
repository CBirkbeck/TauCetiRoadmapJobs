# Review of AdjunctionsAndLocalizations (pull request #2270 at 04df60e)
Folder: `TauCetiRoadmap/InfinityCategoryTheory/AdjunctionsAndLocalizations/`
**Verdict:** needs changes

## R01 (P1) — `Suggested.lean` does not build at the pinned Tau Ceti

**Location:** `TauCetiRoadmap/InfinityCategoryTheory/AdjunctionsAndLocalizations/Suggested.lean` lines 10–13 and 15: `public import TauCeti.AlgebraicTopology.Quasicategory.FullyFaithful` … `InitialVertex` … `Limit` … `TerminalVertex` … `SimplicialSet.Fiber`.
**Claim:** The five modules exist at the pin and the file elaborates with `sorry` as the only warning.
**Witness:** Pin `2fd255d` (`lake-manifest.json`): `TauCeti/AlgebraicTopology/Quasicategory/` holds only `Cartesian`, `Core`, `FullSubcategory`, `LocallySmall`, `RightMappingSpace`; no `SimplicialSet/Fiber.lean`. Gate: `imports=5`, `build=11`, "bad import" for each.
**Repair:** The file must build on the branch's own pin. Either rebase onto a main whose Tau Ceti pin contains the five modules and re-run the gate, or, to merge at `2fd255d`, delete the five imports and every declaration that needs `coslice.IsColimit`, `slice.IsLimit`, `coslice.map`, `IsInitialVertex`, `IsTerminalVertex`, `IsFullyFaithful` or `fiber`, naming each such headline in the module docstring as not statable with the missing carrier.

## R02 (P1) — supplier contracts cite Tau Ceti declarations that are absent at the pin

**Location:** `README.md` lines 159–164: "`SSet.coslice.IsColimit`, `SSet.slice.IsLimit` (`TauCeti/AlgebraicTopology/Quasicategory/Limit.lean`), `SSet.IsInitialVertex`, `SSet.IsTerminalVertex` … `SSet.IsFullyFaithful` (`Quasicategory/FullyFaithful.lean`) … `SSet.LeftFibration`, `SSet.RightFibration` (`SimplicialSet/AnodyneExtensions/LeftRight/`)"; also `SSet.coslice.map` (line 157) and `SSet.fiber` (line 586).
**Claim:** These are pinned Tau Ceti declarations, consumed "From Tau Ceti".
**Witness:** At `2fd255d` none of the nine names occurs in `TauCeti/`; `Coslice.lean` defines `homEquiv` (l. 119) and `π` (l. 189) but no `map`; `Slice.lean:364` has `slice.map` only; no `AnodyneExtensions/` directory in Tau Ceti.
**Repair:** Same condition as R01: after the pin contains them, re-check each name and file path with `#check`. To merge at `2fd255d`, move these nine names out of "From Tau Ceti" and cite the sibling sections that state the notions (Part InfinityCategoryFoundations §1.2.4 for colimits and limits, §2.1.8 for fully faithful maps, §5.4 for left fibrations), in the Conventions and every `*Needs:*` line that names them.

## R03 (P2) — objects already owned by BordismFormalGroups on main are planned again without citation

**Location:** `README.md` lines 32–50 (`## Scope and ownership`), which name no roadmap outside the two families; targets §1.1.1, §2.4.1–§2.4.5, §2.7.1, §2.7.3.
**Claim:** This Part is the sole owner of ∞-categorical adjunctions, the localization `C[W⁻¹]` with its universal property, the localization criterion, and derived functors as absolute right Kan extensions.
**Witness:** Main, `TauCetiRoadmap/BordismFormalGroups/README.md` F6.5: lines 2057–2060 (relative localization `(C,W)`, functor-space universal property), 2064–2067 (enriched Dwyer–Kan localization, nerve), 2108–2114 (adjunctions; HTT 5.2.7.4), 2164–2166 (absolute right Kan extensions of left-derived functors). `EnhancedDerivedSheaves/README.md` line 32 names F6.5 the owner.
**Repair:** A roadmap on main is earlier than an open one. Add to `## Scope and ownership` a bullet "Stated by BordismFormalGroups F6.5" listing these four objects, and for each either cite F6.5 and delete the target here, or keep it with one clause saying how it differs (for instance: §1.1.1 is the bicategorical definition, F6.5's is by a mapping-space pairing, compared in §1.3.2). If ownership is instead to move to this family, that needs a revision of BordismFormalGroups and EnhancedDerivedSheaves that hands the objects over, named in this README's scope and in the description as a dependency.

## R04 (P3) — three definitions in `Suggested.lean` serve no stated headline

**Location:** `Suggested.lean` lines 205–206 (`IsReflectiveLocalization`), 210–211 (`IsColocalization`), 223–224 (`IsRetract`).
**Claim:** Each definition is needed to state a headline theorem of the file.
**Witness:** None of the three names occurs in any `theorem` of the file: `IsLocalizationFunctor` (l. 216–218) unfolds the adjunction itself, and no theorem mentions retracts or colocalizations. Parts PresentableInfinityCategories and PresheavesAndCompletions declare their own copies.
**Repair:** Delete the three declarations from `Suggested.lean` and the words "colocalization … and retract" from its docstring (l. 33–34); in `README.md` drop the `Suggested.lean` clauses at lines 631 and 648 for these names. §2.1.1 and §2.1.2 keep the definitions and Checks.

## R05 (P3) — `exists_leftAdjoint_restrict` is weaker than §1.8.2 and the headline

**Location:** `Suggested.lean` lines 195–198: "`∃ L : funQCat K D ⟶ funQCat K' D, Nonempty (Bicategory.Adjunction L (restrict δ D))`"; `README.md` line 24 and §1.8.2, "a left Kan extension functor `δ_!` … is left adjoint to `δ^*`".
**Claim:** The Lean statement has the generality of HTT, Prop. 4.3.3.7.
**Witness:** HTT line 13680–13683 (p. 306): the left adjoint is the functor of left Kan extension along `δ`. The Lean conclusion never mentions `IsLeftKanExtensionAlong`: nothing relates `L` to the extensions the hypothesis provides.
**Repair:** Add to the conclusion, after the adjunction: for every `F : mappingCylinder δ ⟶ D.obj` with `IsLeftKanExtensionAlong δ F`, the vertex of `Fun(K′, D)` given by `mappingCylinder.ι₁ δ ≫ F` is joined by an edge with `Edge.IsEquivalence` to the image under `L.hom` of the vertex given by `mappingCylinder.ι₀ δ ≫ F`. (Not elaborated here: see R01.) Otherwise name the headline in the docstring as stated only in its existence form and say so at README line 24.

## R06 (P3) — fifteen Lean declarations are not named in the README

**Location:** `Suggested.lean`: `sectionFiberVertex`, `IsCategoricalEquivalence`, `subcomplexOver`, `subcomplexOverCocone`, `IsLeftKanExtensionAt`, `IsLeftKanExtension`, `cylinderAt`, `mappingCylinder` (with `.π`, `.ι₀`, `.ι₁`), `IsLeftKanExtensionAlong`, `funQCat`, `restrict`, `fullSubcategory`, `fullSubcategoryι`, `essImage`, `corestrict`.
**Claim:** Every Lean name appears in the README.
**Witness:** Each of the fifteen names has 0 backticked occurrences in `README.md`; §1.8.2 says only that the Kan extensions are "written out through the mapping cylinder".
**Repair:** Name them where they are used: `sectionFiberVertex` in §1.6.2; the six repeated definitions and the mapping-cylinder declarations, `funQCat` and `restrict` in §1.8.2 (one sentence each for what is repeated from Part InfinityCategoryFoundations §2.1.6 and Part LimitsAndKanExtensions §7.1.2–§7.1.4); `fullSubcategory`, `fullSubcategoryι`, `essImage`, `corestrict` in §2.3.1.

## R07 (P3) — colocalizations are attributed to a definition that does not contain them

**Location:** `README.md` lines 626–628: "a colocalization when it has a fully faithful left adjoint (HTT, Def. 5.2.7.2, p. 383, where a reflective localization is called a localization)"; `Suggested.lean` line 209.
**Claim:** HTT, Def. 5.2.7.2 defines colocalizations.
**Witness:** HTT line 17338–17339: the definition covers only functors with a fully faithful right adjoint; the string "colocal" occurs nowhere in the HTT text.
**Repair:** "… when it has a fully faithful right adjoint (HTT, Def. 5.2.7.2, p. 383, where it is called a localization), and a colocalization when it has a fully faithful left adjoint (the dual notion; HTT does not name it)." Drop the locator from the docstring of `IsColocalization` if R04 does not delete it.

## R08 (P3) — Part InfinityCategoryFoundations §4.1.1 is cited for a statement it does not make

**Location:** `README.md` line 448 "Part InfinityCategoryFoundations §4.1.1 (HTT, Prop. 1.2.9.2)", line 945 "§4.1.1 (HTT, Prop. 1.2.9.2, slices)", line 985.
**Claim:** §4.1.1 of that Part is the universal property of slices.
**Witness:** `TauCetiRoadmap/InfinityCategoryTheory/InfinityCategoryFoundations/README.md` line 1053: §4.1.1 is Joyal's pushout-join lemmas (HTT, Lemmas 2.1.2.3, 2.1.2.4); Prop. 1.2.9.2 is in the §4.1 preamble, lines 1048–1050.
**Repair:** Cite "Part InfinityCategoryFoundations §4.1 (HTT, Prop. 1.2.9.2; Tau Ceti `SSet.slice.homEquiv`, `SSet.coslice.homEquiv`)" in the three places.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1 adjunction, associated functor, HTT adjunction | `Δ[2] ⟶ Δ[1]`; `Λ[2,2]`; `Λ[2,0]` | `1⟶2` Cartesian (fibres `pt→pt`, `∅→∅`); `0⟶2` not: `Map(1,0)=∅`, `Map(1,2)=pt`. `Λ[2,2]`: no Cartesian edge; `Λ[2,0]`: `Map(1,2)=∅` vs `pt` | Checks hold | none |
| §1.2 correspondence of a functor (HTT 5.2.1.3, 5.2.1.5) | source at HTT line 15903, 16103 | three parts and `f∘g` over `{0,2}` match; fibres isomorphic in (1), equivalent in (2) | agrees | none |
| §1.3 unit transformations; three definitions agree | `C=Δ[0]`, `D=N[1]`, `f=1` and `f=0`; `D` connected spaces, `d=S¹` | `f=1,d=0`: `∅ → pt`, fails; `f=0`: `pt → pt`; `S¹ → ∗` bijective on `π₀`, not an equivalence | Checks hold; Kerodon 02FX (2)⇒(1) matches | none |
| §1.4 adjoints on `H`-enriched homotopy categories | HTT line 16373 | hypothesis is an `H`-enriched right adjoint of `hf`, as stated | agrees | none |
| §1.5 `isColimit_map_of_adjunction`, `isLimit_map_of_adjunction` | `K=∅`, `Δ[1] ⟶ Δ[0] ⊣ 1` | left adjoint sends initial `0` to the point (initial); right adjoint `1` is final in `Δ[1]` | true | none |
| §1.6 `exists_rightAdjoint_iff` | `C ⟶ Δ[0]`; `C=∅`; `D=∅`; `C=∂Δ[1]` | pullback is `C`; `C=∅`: no `g`, no vertex; `D=∅`: both sides true; `∂Δ[1]`: no final vertex, no adjoint | iff holds both ways | none |
| §1.6 `nonempty_adjunction_of_isInitialVertex` | `p : Δ[1] ⟶ Δ[0]`, `s=0` and `s=1` | `s=0`: initial in fibre, `0 ⊣ p` true; `s=1`: hypothesis fails (`Map(1,0)=∅`), and `1 ⊣ p` false | hypothesis needed and sufficient here | none |
| §1.7 simplicial and Quillen adjunctions | HTT line 16733, 16759, 16721 | fibrant simplicial categories; fibrant-cofibrant objects; Prop. 5.2.4.4 criterion as restated | agrees | none |
| §1.8 `exists_leftAdjoint_restrict` | `K=∅`; `δ : ∂Δ[1] ⊆ Δ[1]` | `K=∅`: hypothesis says `D` has an initial object (if `K′≠∅`), conclusion: `Fun(K′,D)` has one; `∂Δ[1]`: `(x,y) ↦ (x ⟶ x⊔y)` | true; conclusion weaker than README | R05 |
| §2.1 reflective localization, localization functor, retract | `Δ[1] ⟶ Δ[0]`; `0 : Δ[0] ⟶ Δ[1]`; `L = const₁`, `const₀` on `N[1]` | `0 ⊣ (Δ[1]→Δ[0])`, adjoint not fully faithful (`∅ → pt`); `const₁`: `α=(0⟶1, id)`; `const₀`: needs `1⟶0`, none | Checks hold | R04, R07 |
| §2.2–§2.3 `exists_leftAdjoint_fullSubcategoryι_iff` | `N[1]`, `P={1}`, `{0}`, `∅`, all; poset `0<1, 0<2`, `P={1,2}` | `{1}`: `0⟶1` initial; `{0}`: none for `1`; `∅`: no `hv`; `{1,2}`: `Map(1,2)=∅` vs `Map(0,2)=pt` | iff consistent in each case | none |
| §2.3 `isLocalizationFunctor_tfae` | `L=id`; `const₁`; `const₀` on `N[1]`; `C=∅` | `id`: all three true; `const₁`: all true (`L◁α`, `α▷L` identities); `const₀`: all false; whiskerings have components `α(Lc)`, `L(αc)` | TFAE consistent | none |
| §2.4 `IsLocalizationAt`, `exists_isLocalizationAt`, `isLocalizationAt_corestrict` | `W=∅`; `W` = equivalences; `N[1]` at its edge; `Δ[1] ⊆ J` with `W=∅`; `C=∅` | `id` works for the first two; `N[1][W⁻¹]=Δ[0]`; `J`: fully faithful, essential image too small; `C=∅` forces `D=∅` (test `E=∅`) | definition excludes each wrong model | R01–R03 |
| §2.4.5, §2.4.6 mapping-space form; homotopy equivalence of pairs | `E` and `Fun(Δ[1],E)`; `F∘(i r)` for `W`-inverting `F` | a functor to `Fun(Δ[1],E)` inverts `W` iff both ends do; `F` of a `W`-zigzag is invertible | routes close | none |
| §2.5 orthogonality, factorization systems (HTT 5.2.8.1, 5.2.8.8, 5.2.8.19) | `N[1]`; finite sets; `∗⊔∗ ⟶ ∗` against `∗ ⟶ S¹` | `0⟶1 ⊥ 0⟶1` fails (no lift); two lifts `∗ ⟶ {a,b}`; pullback corner `∗ ×_{S¹×S¹} S¹ ≃ ℤ ≠ ∗` | Checks hold; three axioms match source | none |
| §2.6 underlying ∞-category (HA 1.3.4.15–17) | trivial model structure; Kan–Quillen; `Q`, `R` on `A^c`, `A^f`, `A°` | `QX ⟶ X` trivial fibration so `Q` keeps fibrant; `X ⟶ RX` trivial cofibration so `R` keeps cofibrant; `π₀` inverts `W`, not `∂Δ[1]⟶Δ[0]` | §2.6.2 follows from §2.4.6 | none |
| §2.7 absolute Kan extensions, derived functors (N–S, A.9, A.10) | `X=X′=Δ[0]`, `Y=Δ[1]`; `X=∅`; `i : Δ[1]⟶Δ[0]`; `β_{RG}`, `R(β_G)` | `Map(1,0)=∅` vs `pt`; `p(1)=1` not final in `Δ[2]`; components `G(Q(q_X))`, `G(q_{QX})`: weak equivalences between cofibrants | Checks and route hold | R03 |

- Source locators checked against the text: 52 in HTT (statement number, page, hypotheses), 6 in HA, 3 in Nikolaus–Scholze, 2 in Kerodon (tags 02EK, 02FX); all agree except R07.
- Library declarations opened at the pins: 24 in Mathlib (among them `SSet.QCat.bicategory`, `Quasicategory/StrictBicategory.lean:66`; `Bicategory.Adjunction.comp`, `Bicategory/Adjunction/Basic.lean:161`; `CofibrantObject.localizerMorphism`, `CofibrantObjectHomotopy.lean:281`), 12 in Tau Ceti; 9 absent (R02).
- Cross-roadmap citations resolved at the head: 25 ids in Part InfinityCategoryFoundations, 27 in Part CartesianFibrations, 10 in Part LimitsAndKanExtensions, 15 in ModelCategoryTheory (its open head); all exist, one misdirected (R08).
- Dependency check: `depcheck: 223 roadmaps, 1972 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate: FAIL (`imports=5`, `build=11`; every other check 0). Elaboration and the `#check` comparison of signatures could not run (R01); binders were compared by reading: the file has no `variable` line, every binder is explicit.
- One-tactic probe, by reading: no `theorem` closes by `simp`, `rfl`, `infer_instance` or one library lemma; no `set_option`, no sorried data, no `example`.
- Pull request text: the member list, the 13.4k word count, the pin `2fd255d`, the named supplier (ModelCategoryTheory) and the statement that the build needs a newer pin agree with the head.
- Overlap check: read KanQuillen, SimplicialCategories, EnrichedLocalization, ModelCategories (open), BordismFormalGroups, EnhancedDerivedSheaves (main); localization of simplicial categories: EnrichedLocalization §2.1 (cited); adjunctions, `C[W⁻¹]`, the localization criterion, derived functors as absolute Kan extensions: BordismFormalGroups F6.5 (R03).
- Source independence: 63 locators and 5 further passages (routes of §1.2.1, §2.4.4, §2.7.3, the definition in §2.5.2, the docstring of `IsLocalizationAt`) compared with 4 sources, none shared beyond formulas and hypothesis lists; largest share HTT, 270 of 302 locators; contents compared with HTT §5.2: §1.2–§1.7 run parallel to §5.2.1–§5.2.4 (six sections onto four, order forced by the `*Needs:*` chain §1.2.1 → §1.3.2 → §1.5.1, §1.6.1, §1.7.1), the rest (§1.1, §1.8, §2.4, §2.6, §2.7) is drawn from HTT Ch. 4, HA, Kerodon and Nikolaus–Scholze: independent.

## Not verifiable

- Elaboration of `Suggested.lean`, its elaborated signatures and the tactic probe by machine: the imports do not exist at the pin.
- The description's sentence that every file elaborates against Tau Ceti `8b9f13d993`: that commit is not in the pinned checkout.
- Ownership against pull request #1807 (GeneralizedCohomology G2.1, G2.11): its files were not read; only the description's account of it was.
- The "not statable" claim for the Quillen derived-functor headline (§2.7.3) was not tested by an attempted encoding.

## Source issues

- none

## For the human reviewers

- **Ownership.** The description asks the maintainers to choose the owner of the generic ∞-categorical material among this family, BordismFormalGroups F6.5 with EnhancedDerivedSheaves (main), and pull request #1807; R03 applies the standing rule in the meantime.
- **Pin.** The folder cannot pass the gate until the repository's Tau Ceti pin moves past `2fd255d`; the description names `8b9f13d993`. The bump is outside the folder.
- **Licence.** Kerodon (kerodon.net, tags 02EK and 02FX) is an online, unrefereed text on its author's site; it was read as an author's page, with no licence statement checked.
- **Arrangement.** `README.md` §1.2–§1.7 run in the order of HTT §5.2.1–§5.2.4, and 270 of 302 locators are to HTT; judged independent above because of the dependency chain and the sections drawn from elsewhere.
