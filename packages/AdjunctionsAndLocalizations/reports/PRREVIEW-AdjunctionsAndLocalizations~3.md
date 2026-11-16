# Review of AdjunctionsAndLocalizations (pull request #2270 at a6d7928)
Folder: `TauCetiRoadmap/InfinityCategoryTheory/AdjunctionsAndLocalizations/`
**Verdict:** needs changes

## R01 (P1) — `Suggested.lean` does not build at the pinned Tau Ceti

**Location:** `TauCetiRoadmap/InfinityCategoryTheory/AdjunctionsAndLocalizations/Suggested.lean` lines 10–13 and 15: `public import TauCeti.AlgebraicTopology.Quasicategory.FullyFaithful` … `InitialVertex` … `Limit` … `TerminalVertex` … `SimplicialSet.Fiber`.
**Claim:** The five modules exist at the pin and the file elaborates with `sorry` as the only warning.
**Witness:** Pin `2fd255d` (`lake-manifest.json`): `TauCeti/AlgebraicTopology/Quasicategory/` holds only `Cartesian`, `Core`, `FullSubcategory`, `LocallySmall`, `RightMappingSpace`; no `SimplicialSet/Fiber.lean`. Gate at this head: `imports=5`, `build=11`, FAIL.
**Repair:** Unchanged: rebase onto a main whose Tau Ceti pin contains the five modules and re-run the gate; or, to merge at `2fd255d`, delete the five imports and every declaration using `coslice.IsColimit`, `slice.IsLimit`, `coslice.map`, `IsInitialVertex`, `IsTerminalVertex`, `IsFullyFaithful` or `fiber`, and name each such headline in the module docstring as not statable with its missing carrier.

## R02 (P1) — eleven Tau Ceti declarations cited as supplied are absent at the pin

**Location:** `README.md` lines 162–169 (`SSet.coslice.map`, `SSet.coslice.IsColimit`, `SSet.slice.IsLimit`, `SSet.IsInitialVertex`, `SSet.IsTerminalVertex`, `SSet.IsFullyFaithful`, `SSet.LeftFibration`, `SSet.RightFibration`); line 302 (`TauCeti.MarkedSSet.markedAnodyneExtensions`); line 541 (`CategoryTheory.simplicialNerveMap`); line 601 (`SSet.fiber`).
**Claim:** These are pinned Tau Ceti declarations.
**Witness:** At `2fd255d`: `SimplicialSet/Coslice.lean` defines `coslice`, `homEquiv` (line 119) and `π` (line 189), no `map`; `IsInitialVertex`, `IsFullyFaithful`, `LeftFibration`, `markedAnodyne`, `simplicialNerveMap` occur in no file of `TauCeti/`; `Marked/` holds `Basic`, `Limits`, `MappingSpace`.
**Repair:** As R01 for the names the Lean file uses. In the README, at `2fd255d` cite the owner instead: line 302 "Part CartesianFibrations §5.2 (HTT, Def. 3.1.1.1, marked anodyne maps)"; line 541 "Part InfinityCategoryFoundations §2.1 (HTT, Def. 1.1.5.5, the simplicial nerve)"; after a pin bump, confirm each name with `#check` and list `markedAnodyneExtensions`, `simplicialNerveMap` and `SSet.fiber` under `### From Tau Ceti`, which omits them.

## R03 (P2) — objects already owned by BordismFormalGroups on main are planned again without citation

**Location:** `README.md` lines 33–51 (`## Scope and ownership`), which name no roadmap outside the two families; targets §1.1.1, §2.3.2, §2.4.1–§2.4.5, §2.7.1, §2.7.3.
**Claim:** This Part is the sole owner of ∞-categorical adjunctions, the localization `C[W⁻¹]` with its universal property, the localization criterion, and derived functors as absolute right Kan extensions.
**Witness:** Main, `TauCetiRoadmap/BordismFormalGroups/README.md` F6.5: line 2064 (enriched Dwyer–Kan localization), 2108–2114 (adjunctions; "the localization criterion of HTT5.2.7.4"), 2164 (absolute right Kan extensions for derived functors); `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` line 32 names F6.5 as owner.
**Repair:** Unchanged: add to `## Scope and ownership` a bullet "Stated by BordismFormalGroups F6.5" listing the four objects, and for each either cite F6.5 and delete the target, or keep it with one clause saying how it differs (for instance: §1.1.1 is the bicategorical definition, F6.5's is by a mapping-space pairing, compared in §1.3.2). A transfer of ownership to this family instead needs a revision of BordismFormalGroups and EnhancedDerivedSheaves, named in this README's scope.

## R04 (P3) — the supplier contract cites Part CartesianFibrations §3.4, which does not exist

**Location:** `README.md` line 186: "initial objects in a Cartesian fibration (§2.7); functor ∞-categories (§3.4); correspondences and the source fibration of an arrow ∞-category (§4.1, §4.4)".
**Claim:** Part CartesianFibrations has a §3.4 on functor ∞-categories.
**Witness:** `TauCetiRoadmap/InfinityCategoryTheory/CartesianFibrations/README.md` lines 569, 586, 611: Layer 3 has §3.1–§3.3 only; line 611 is "### 3.3 Functor ∞-categories and the forms of categorical equivalence". This README's own line 831 cites §3.3.1.
**Repair:** "functor ∞-categories (§3.3)".

## R05 (P3) — `TauCeti.MarkedSSet` is listed twice in the `*Needs:*` of §2.4.2

**Location:** `README.md` line 849: "Tau Ceti `TauCeti.MarkedSSet` (HTT, Def. 3.1.0.1);" and line 853: "Tau Ceti `TauCeti.MarkedSSet`; Mathlib `HomotopicalAlgebra.ModelCategory`."
**Claim:** Each item of a `*Needs:*` list is a distinct input.
**Witness:** Lines 849 and 853 name the same structure (`Marked/Basic.lean:49` at the pin); the previous review's R08 asked for the second to be dropped.
**Repair:** Line 853: "Mathlib `HomotopicalAlgebra.ModelCategory`."

## Previous findings

- R01 — not repaired: `Suggested.lean` lines 10–13, 15 still import the five modules absent at `2fd255d`; gate `imports=5`, `build=11` (this report's R01).
- R02 — not repaired: `README.md` lines 162–169 and 302 unchanged; line 541 adds `CategoryTheory.simplicialNerveMap`, also absent (this report's R02).
- R03 — not repaired: "BordismFormalGroups" occurs nowhere in the README or the family index (this report's R03).
- R04 — repaired: the module docstring reads "the definition of localization functor (§2.1)".
- R05 — repaired by the second alternative: README lines 24–25, "the Lean form states the existence of the left adjoint"; lines 569–570 and the docstring of `exists_leftAdjoint_restrict` say the same.
- R06 — repaired: `sectionFiberVertex` (line 496), the repeated definitions, the mapping-cylinder declarations, `funQCat`, `restrict` (lines 593–596), `fullSubcategory`, `fullSubcategoryι` (line 683), `essImage`, `corestrict` (line 745) are named.
- R07 — repaired: lines 642–643, "a colocalization when it has a fully faithful left adjoint (the dual notion; HTT does not name it)".
- R08 — partly repaired: lines 302–304, 455, 978, 1020 now name the Part before each id; the repeated `TauCeti.MarkedSSet` remains (this report's R05).
- R09 — repaired: line 563, "Part LimitsAndKanExtensions §7.4.5 (HTT, Lemma 4.3.2.12) and §7.4.6 (HTT, Cor. 4.3.2.16)".
- R10 — repaired: the folder holds `README.md` and `Suggested.lean` only; gate `stray-files=0`.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1 adjunctions, associated functors (HTT, Defs. 5.2.1.1, 5.2.2.1; Kerodon 02EK) | `M = Δ[2]`, `Λ[2,2]`, `Λ[2,0]` over `Δ[1]` | `Δ[2]`: `1 ⟶ 2` Cartesian (`Map(0,1) = Map(0,2) = pt`), `0 ⟶ 2` not (`Map(1,0) = ∅`, `Map(1,2) = pt`). `Λ[2,2]`: not Cartesian. `Λ[2,0]`: not coCartesian | Checks true; HTT lines 15886, 16140; Kerodon line 51455 | none |
| §1.2 correspondence of a functor (HTT, Props. 5.2.1.3, 5.2.1.5) | source at pp. 354, 357 | HTT lines 15903, 16103: three assertions and the composition over `Δ[2]` as restated; variance fiber over 1 to fiber over 0 | matches | none |
| §1.3 unit transformations (HTT, Def. 5.2.2.7, Prop. 5.2.2.8, Cor. 5.2.2.5; Kerodon 02FX) | `C = [1]`, `D = Δ[0]`, `g = 1` and `g = 0`; `C = Δ[0]`, `D = [1]`, `f = 1` | `g = 1`: `pt ⟶ pt`, unit. `g = 0`: no `1 ⟶ 0`. `f = 1`, `d = 0`: `∅ ⟶ pt`, not a unit | true; HTT lines 16259, 16272, 16214; Kerodon line 52647 | none |
| §1.4 detection on homotopy categories (HTT, Prop. 5.2.2.12) | source p. 363 | HTT line 16373: `hf` has an `H`-enriched right adjoint ⇒ `f` has one; Lemmas 5.2.2.10, 5.2.2.11 at lines 16343, 16354 | matches | none |
| §1.5 `isColimit_map_of_adjunction`, `isLimit_map_of_adjunction` (HTT, Prop. 5.2.3.5) | `K = ∅`; `Δ[1] ⟶ Δ[0] ⊣ 1` | `K = ∅`: left adjoint carries initial to initial: `0 ↦ pt`. Right adjoint `1` carries the final vertex of `Δ[0]` to `1`, final | true; HTT line 16562 | none |
| §1.6 `exists_rightAdjoint_iff` (HTT, Prop. 5.2.4.2 with 4.4.4.5) | `C = ∅`, `D = Δ[0]`; `C = D = ∅`; `C = ∂Δ[1] ⟶ Δ[0]` | `∅ ⟶ Δ[0]`: no `g`; pullback empty, no vertex: false = false. `∅ = ∅`: true = true. `∂Δ[1]`: no final vertex: false = false | iff holds both ways | none |
| §1.6 `nonempty_adjunction_of_isInitialVertex` (HTT, Prop. 5.2.4.3) | `p : Δ[1] ⟶ Δ[0]`, `s = 0` and `s = 1` | `s = 0`: fiber `Δ[1]`, `0` initial, `0 ⊣ p` true. `s = 1`: hypothesis fails (`Map(1,0) = ∅`), and `1 ⊣ p` is false | true; HTT line 16649 | none |
| §1.7 simplicial and Quillen adjunctions (HTT, Cor. 5.2.4.5, Prop. 5.2.4.6, Remark 5.2.4.7) | source pp. 370–372 | HTT lines 16721, 16733, 16759, 16784: fibrant simplicial categories; simplicial model categories, fibrant-cofibrant objects | matches | none |
| §1.8 `exists_leftAdjoint_restrict` (HTT, Props. 4.3.2.17, 4.3.3.7) | `K = ∅`; `∂Δ[1] ⊆ Δ[1]` | `K = ∅`: hypothesis "some `K′ ⟶ D` with initial values", conclusion "`Fun(K′, D)` has an initial object": agree. `∂Δ[1]`: `(x, y) ↦ (x ⟶ x ⊔ y)` | true in existence form; HTT lines 13509, 13680; `j^*` coCartesian by base change of target evaluation (line 6964, dual) | none |
| §2.1 `IsLocalizationFunctor` (HTT, Def. 5.2.7.2) | `L = const₁`, `const₀`, `id` on `N[1]` | `const₁`: `D = Δ[0]`, `g = 1` fully faithful: true. `const₀`: `g = 0` needs `Map(1,0) = ∅ ≃ pt`: false. `id`: true | definition separates them; HTT line 17338 | none |
| §2.1.2 retracts (HTT, §4.4.5, p. 321) | `N[1]`; sets | `0` not a retract of `1` (no `1 ⟶ 0`); `∅` not a retract of a point | true; HTT line 14372 | none |
| §2.2 `IsSubcategoryLocalization`, `IsReflectiveSubcategory` (HTT, Def. 5.2.7.6, Remarks 5.2.7.7, 5.2.7.9) | `N[1]` with `{1}`, `{0}`; poset `0 < 1, 0 < 2`; `P` empty | `{1}`: `0 ⟶ 1` initial: reflective. `{0}`: none for `1`. Poset: `Map(1,2) = ∅ ≠ Map(0,2) = pt`. Empty `P`: no `hv` | Lean subcomplex equals `C_{c/} ×_C C⁰`; HTT lines 17449, 17454 | none |
| §2.3.1 `exists_leftAdjoint_fullSubcategoryι_iff` (HTT, Prop. 5.2.7.8) | `P` empty with `C ≠ ∅`; `C = ∅`; `N[1]`, `{0}` | Empty `P`: no `f : C ⟶ ∅`, no localization: false = false. `C = ∅`: true = true. `{0}`: false = false | iff holds; HTT line 17458 | none |
| §2.3.2 `isLocalizationFunctor_tfae` (HTT, Prop. 5.2.7.4) | `L = const₀`, `const₁`, `id` on `N[1]` | `const₀`: (1) false, (2) false, (3) no `α` at `1`. `const₁`: all true, `α = (0 ⟶ 1, id)`. `L ◁ α` has components `α(L c)`, `α ▷ L` has `L(α c)` | three conditions agree; HTT line 17361 | none |
| §2.4.1 `IsLocalizationAt` (HA, Def. 1.3.4.1) | `W` = equivalences, `f = id`; `N[1]`, `W` = edge; `Δ[1] ⊆ J`, `W = ∅` | `id`: true. `N[1] ⟶ Δ[0]`: true. `Δ[1] ⊆ J`: fully faithful, image = edge-inverting functors ≠ all: false | essential-image clause needed; HA line 4075 | none |
| §2.4.2 `exists_isLocalizationAt` (HA, Remark 1.3.4.2) | `W = ∅`; `C = ∅` | `W = ∅`: `D = C`. `C = ∅`: `D = ∅`. Fibrant replacement stays in the universe of `C` | true; HA line 4083 | none |
| §2.4.3 presentation by simplicial categories (HTT, Notation A.3.5.1, Lemma A.3.5.4, Prop. A.3.5.5) | source pp. 909–911 | HTT lines 41482, 41525, 41534: `φ` injective with image the `W`-inverting classes; bijection on `[K, −]` for all `K` gives the equivalence | matches | none |
| §2.4.4 `isLocalizationAt_corestrict` (HTT, Prop. 5.2.7.12; HA, Example 1.3.4.3) | `L = const₁` on `N[1]`; `L = id` | `const₁`: `LC = {1}`, `W` = all edges, `N[1][W⁻¹] = Δ[0]`: true. `id`: `W` = equivalences: true | true; HTT line 17500, HA line 4088 | none |
| §2.4.5, §2.4.6 mapping-space form; invariance under homotopy equivalence of pairs | `E` and `Fun(Δ[1], E)`; `i`, `r = Q` | Fibers of source-target on cores are the morphism spaces; `F ∘ i ∘ r ≃ F` for `W`-inverting `F` | both hold | none |
| §2.5 orthogonality, factorization systems (HTT, Defs. 5.2.8.1, 5.2.8.8, Props. 5.2.8.6, 5.2.8.11, Lemma 5.2.8.19) | `N[1]`; finite sets; `∗ ⊔ ∗ ⟶ ∗` against `∗ ⟶ S¹` in `S` | `0 ⟶ 1 ⊥ 0 ⟶ 1` fails (lifts `1 ⟶ 0`: none). Sets: two lifts. `S`: `∗ ×_{S¹×S¹} S¹ ≃ ΩS¹ ≃ ℤ ≠ ∗` | Checks true; HTT lines 17554, 17611, 17672, 17694, 17781 | none |
| §2.6 underlying ∞-category of a model category (HA, Def. 1.3.4.15, Remark 1.3.4.16, Notation 1.3.4.17) | trivial model structure; Kan–Quillen | Trivial: `N(A)`. Kan–Quillen: `π₀` inverts `W` but not `∂Δ[1] ⟶ Δ[0]`. `Q` preserves fibrant, `R` cofibrant objects | true; HA lines 4360, 4364, 4380 | none |
| §2.7 absolute Kan extensions, derived functors (Nikolaus–Scholze, App. A, Exs. A.9, A.10) | `X = X′ = Δ[0]`, `Y = Δ[1]`; `X = ∅`; `i : Δ[1] ⟶ Δ[0]`, `f = id` | `(0, 0 ⟶ 1)`: `Map(1,0) = ∅ ≠ pt`. `∅`: final `1`, image in `Δ[2]` not final. `lim id = 0`, absolute, `ε` not invertible. `β_{RG} = G(Q q_X)`, `R β_G = G(q_{QX})` | true; Nikolaus–Scholze lines 6391–6413, 6441, 6464 | none |
| Headline 8, not stated (§2.7.3) | pinned libraries | No `IsQuillen`, `QuillenAdjunction` or `LeftQuillen` declaration in pinned Mathlib or Tau Ceti; named in the module docstring with the missing carrier | docstring correct | none |
| Supplier contract, Part CartesianFibrations | sibling headings | Layer 3: §3.1, §3.2, §3.3; no §3.4 | one id wrong | R04 |
| `*Needs:*` of §1.2.1, §1.5.1, §1.7.1, §1.8.2, §2.4.2 | pin `2fd255d` | `slice.homEquiv` (`Slice.lean:271`), `coslice.homEquiv` (`Coslice.lean:119`), `slice.map` (`Slice.lean:364`) exist; eleven names absent | absent names | R02, R05 |
| Repeated definitions in `Suggested.lean` | sibling `Suggested.lean` files | `IsCategoricalEquivalence` body identical to Part InfinityCategoryFoundations line 117; `subcomplexOver` … `IsLeftKanExtension` identical to Part LimitsAndKanExtensions lines 221–241; namespaces differ | no shared fully qualified name | none |

- Source locators checked against the text: 103 in HTT (statement number and page; 40 statements read in full), 6 in HA, 3 in Nikolaus–Scholze, 3 in Kerodon; none wrong.
- Library declarations opened at the pin: 23 in Mathlib (among them `QCat.bicategory`, `StrictBicategory.lean:66`; `Bicategory.Adjunction.comp`, `Adjunction/Basic.lean:161`; `CofibrantBrownFactorization`, `BrownLemma.lean:48`; `SSet.opFunctor`, `Op.lean:44`), 18 in Tau Ceti; 11 names absent (R02).
- Cross-roadmap citations resolved at the heads: every `Part … §…` id of the README, about 90 distinct, in Parts InfinityCategoryFoundations, CartesianFibrations, LimitsAndKanExtensions and, at the head of pull request #2269, ModelCategories, KanQuillen, SimplicialCategories, EnrichedLocalization; one does not exist (R04).
- Dependency check: `depcheck: 261 roadmaps, 2594 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate: FAIL (`imports=5`, `build=11`; every other check 0). Elaboration stops on the missing object file of `TauCeti.AlgebraicTopology.Quasicategory.FullyFaithful`; signatures were compared with the README by reading, and padding judged by reading: no declaration restates a definition or closes from one library lemma.
- Headlines: seven of the README's eight are stated (`isColimit_map_of_adjunction`, `exists_rightAdjoint_iff`, `exists_leftAdjoint_restrict`, `isLocalizationFunctor_tfae`, `exists_leftAdjoint_fullSubcategoryι_iff`, `isLocalizationAt_corestrict`, `exists_isLocalizationAt`); the eighth is named in the docstring.
- Pull request text: adds a roadmap; 14.0k words (13,977 counted); pin `2fd255d`; the named supplier and the stated overlap with BordismFormalGroups F6.5 agree with the head.
- Overlap check: read KanQuillen, SimplicialCategories, EnrichedLocalization, ModelCategories (open), BordismFormalGroups, EnhancedDerivedSheaves, StableHomotopyKTheory (main); localization of simplicial categories: EnrichedLocalization §2.1 (cited); adjunctions, `C[W⁻¹]`, the localization criterion, derived functors as absolute Kan extensions: BordismFormalGroups F6.5 (R03); nothing shared with StableHomotopyKTheory.
- Source independence: 56 passages compared with 4 sources (40 HTT statements and 4 proofs, 6 HA, 3 Nikolaus–Scholze, 3 Kerodon), none shared beyond statements the mathematics forces; largest share HTT, 271 of 299 locators; contents compared with HTT §5.2.1–§5.2.8: independent (Layer 1 draws §1.1 from Kerodon and §1.8 from HTT §4.3, omits §5.2.5–§5.2.6; Layer 2 interleaves HA §1.3.4, HTT §A.3.5 and Nikolaus–Scholze App. A; the order §1.2 → §1.3 → §1.5, §1.6 is forced by their `*Needs:*` lines).
- Research link: §2.4 and §2.6 are the localization and underlying ∞-category of a model category that Lurie (HA, 2017, §1.3.4) uses for derived ∞-categories; §2.7 is the absolute Kan extension framework of Nikolaus–Scholze (2018, App. A) for topological cyclic homology; rests on the README's references and the texts read.

## Not verifiable

- Elaboration of `Suggested.lean`, its `#check` signatures and the one-tactic probe by machine: five imports do not exist at the pin.
- The description's sentence that every file elaborates against Tau Ceti `8b9f13d993`: that commit is not the pinned checkout.
- Ownership against pull requests #1807 (GeneralizedCohomology G2.1, G2.11) and #1901: their files were not read.

## Source issues

- none

## For the human reviewers

- **Ownership.** The description asks the maintainers to choose the owner of the generic ∞-categorical material among this family, BordismFormalGroups F6.5 with EnhancedDerivedSheaves (main), and pull request #1807; R03 applies the standing rule meanwhile.
- **Pin.** The folder cannot pass the gate until the repository's Tau Ceti pin moves past `2fd255d`; the description names `8b9f13d993`. The bump is outside the folder.
- **Licence.** Kerodon (kerodon.net, tags 02EK and 02FX; also Def. 4.5.4.1 in a docstring of `Suggested.lean`) is an online, unrefereed text on its author's site; read as an author's page, no licence statement checked.
- **Arrangement.** `README.md` §1.2–§1.7 run in the order of HTT §5.2.1–§5.2.4, and 271 of 299 locators are to HTT; judged independent above because of the dependency chain and the sections drawn from elsewhere.
