# Review of LimitsAndKanExtensions (pull request #2270 at a6d7928)
Folder: `TauCetiRoadmap/InfinityCategoryTheory/LimitsAndKanExtensions/`
**Verdict:** needs changes

## R01 (P1) — The acceptance test does not build at the pinned Tau Ceti

**Location:** `TauCetiRoadmap/InfinityCategoryTheory/LimitsAndKanExtensions/Suggested.lean`:8, 10–14, 16, and line 22: “against the pinned Mathlib and Tau Ceti”.
**Claim:** The headline signatures elaborate against the repository's pins.
**Witness:** Gate `build=15`: `bad import 'TauCeti.AlgebraicTopology.Quasicategory.CatInfty'` and six more. `lake-manifest.json` pins Tau Ceti `2fd255d`; none of the seven modules exists there.
**Repair:** Land the pin bump the description announces, merge main into this branch and rerun the gate at that pin; nothing in the file is checked until then. A build against another commit does not repair this head.

## R02 (P1) — The Tau Ceti contract lists declarations the pin does not have

**Location:** `TauCetiRoadmap/InfinityCategoryTheory/LimitsAndKanExtensions/README.md`:46 and 116–125: “Tau Ceti already has … They are inputs here, not targets.”
**Claim:** Every listed Tau Ceti declaration exists at the pin, in the file named.
**Witness:** At `2fd255d`, `TauCeti/AlgebraicTopology/SimplicialSet/Coslice.lean` has `coslice` (87), `homEquiv` (119), `π` (189) and no `map`, `IsColimit` or `isIso_π`; `Quasicategory/` has five files, none of `Limit`, `InitialVertex`, `TerminalVertex`, `OuterHorn`, `CatInfty`.
**Repair:** After the pin bump, resolve each of these at the new pin with its file, and make any that is still absent a target of its earliest owner: `coslice.map`, `coslice.isIso_π`, `slice.IsLimit`, `coslice.IsColimit`, `coslice.isColimit_iff_isLimit_op`, `coslice.isColimit_iff_nonempty_isInitial`, `IsInitialVertex`, `IsTerminalVertex`, `LeftFibration`, `RightFibration`, `leftAnodyneExtensions`, `rightAnodyneExtensions`, both `…_pushoutObjObjι`, `ihomOver` with `homEquiv` and `isTerminalId`, `SSet.IsWeakHomotopyEquivalence`, `isWeaklyContractible_iff_isWeakHomotopyEquivalence`, `Edge.isEquivalence_iff_hornFilling_zero`, `nerve.opIso`, `CoreEnriched`, `CatInftyΔ`, `catInfty`.

## R03 (P2) — Four targets have a second owner on main

**Location:** `TauCetiRoadmap/InfinityCategoryTheory/LimitsAndKanExtensions/README.md`:44–48 (Scope names no roadmap on main), with §4.3.1 (line 518), §5.4.2 (613), §5.4.3 (629) and §7.4.6 (930).
**Claim:** This Part is the single owner of the colimit criterion for cofinality, Theorem A, cofinality of a terminal fibre and the trivial fibration of left Kan extensions.
**Witness:** Main `TauCetiRoadmap/EnhancedDerivedSheaves/README.md`:215 (`IsFinal`, `isFinal_iff_colimit`, Theorem A), :1123 (`leftKanExtension_restrict_trivialFibration`, HTT 4.3.2.15, relative form), :1139 (`final_fibre_inclusion`).
**Repair:** Either cite EnhancedDerivedSheaves E0.4 and E3.1 in Scope and in the supplier contracts and replace the four coinciding targets by those citations, keeping what main does not state (arbitrary simplicial-set sources, §4.5, §4.6, §7.5–7.7); or have EnhancedDerivedSheaves and BordismFormalGroups F6.5 revised first so that they cite this Part, and say so in Scope. “Companion edits can follow” leaves two owners at the merge.

## R04 (P2) — §7.1.2, §7.5 and §7.6.5 drop the source's ∞-category hypotheses

**Location:** `TauCetiRoadmap/InfinityCategoryTheory/LimitsAndKanExtensions/README.md`:949, 953, 957: “for a categorical fibration `p : D ⟶ D'`”; also 765 and 982.
**Claim:** Invariance, transitivity, parameters and the fiberwise computation hold with D, D′ (and E) arbitrary simplicial sets.
**Witness:** HTT lines 12841, 12941, 13130, 13148 and 13755 all say “of ∞-categories”. The routes use §7.2.2, §7.2.3 and §7.4.1, which this README states for ∞-categories only.
**Repair:** Open §7.5.1–7.5.3 with “for ∞-categories C, D and D′, a categorical fibration `p : D ⟶ D′` …”, as §7.4.1 does; write “an inner fibration `p : D ⟶ D′` of ∞-categories” in §7.1.2; “of ∞-categories C⁰, C, D and E” in §7.6.5; add §7.5 and §7.6.5 to the list in the Λ[2,1] Check at line 867.

## R05 (P3) — Seven imports name modules the pin lacks

**Location:** `TauCetiRoadmap/InfinityCategoryTheory/LimitsAndKanExtensions/Suggested.lean`:8, 10–14, 16.
**Claim:** Each imported `TauCeti.*` module exists at the pinned Tau Ceti.
**Witness:** Gate `imports=7`: `Quasicategory.CatInfty`, `Quasicategory.Limit`, `SimplicialNerve.Basic`, `SimplicialSet.AnodyneExtensions.LeftRight.Basic`, `SimplicialSet.Fiber`, `SimplicialSet.InternalHom`, `SimplicialSet.WeakHomotopyEquivalence`.
**Repair:** Resolved by the pin bump of R01; rerun the gate and keep only the modules the file uses.

## R06 (P3) — §7.3.3 cites a supplier section for a lemma that section does not state

**Location:** `TauCetiRoadmap/InfinityCategoryTheory/LimitsAndKanExtensions/README.md`:889 and 893: “Part CartesianFibrations … §2.7.1 (HTT, Lemma 2.4.4.7)”.
**Claim:** Part CartesianFibrations §2.7.1 supplies HTT Lemma 2.4.4.7.
**Witness:** `TauCetiRoadmap/InfinityCategoryTheory/CartesianFibrations/README.md`:544–547: §2.7.1 states Prop. 2.4.4.9; 2.4.4.7 is a step of its route. Nerve of `a < b₁, a < b₂` over Δ[1]: 2.4.4.7 applies, 2.4.4.9 does not.
**Repair:** Give the lemma its own label in Part CartesianFibrations Layer 2 (“for a Cartesian fibration of ∞-categories, an object initial in its fiber over an initial object is initial”) and cite that label; or prove it inside §7.3.3 from Part CartesianFibrations §1.7.2.

## Verified sound

Previous review's findings at this head:

| Previous | Passage at this head | Status |
|---|---|---|
| R01 build | `Suggested.lean`:22 “against the pinned Mathlib and Tau Ceti”; gate `build=15` | Not repaired: R01 |
| R02 contract | README:46 “They are inputs here, not targets.” | Not repaired: R02 |
| R03 left fibration | README:888 “the projection `E₀ ⟶ D_{d/}` is itself no left fibration” | Repaired; matches HTT lines 12685–12699 |
| R04 elements | README:1170 “`Δ_{/K} ≃ (Functor.Elements K)ᵒᵖ`” with the two-versus-one witness | Repaired |
| R05 monicity | README:971 “c need not be monic, and when δ is the fold … it is an isomorphism” | Repaired |
| R06 owners | README:44 “This Part proves their theory.”; Scope names no roadmap on main | Not repaired: R03 |
| R07 hypotheses | README:861, 882, 886, 899 now say “of ∞-categories”; Check at 867 | Repaired there; same defect in §7.5: R04 |
| R08 imports | Gate `imports=7` | Not repaired: R05 |
| R09 references | README:927 “(§7.3.3, §7.2.2)”; Lean docstrings cite §7.4.6 | Repaired |
| R10 empty header | No Layer 9 header; gate `empty-sections=0` | Repaired |
| R11 stray file | Folder holds `README.md`, `Suggested.lean`; gate `stray-files=0` | Repaired |
| R12 API lists | API lists at README:266, 775, 800, 830, 1020, 1101, 1124, 1143 | Repaired |
| R13 Mathlib contract | README:106 names `LeftExtension.IsPointwiseLeftKanExtension` | Repaired |
| R14 description | “The availability notes are per file … LimitsAndKanExtensions defines the ∞-category of spaces” | Repaired |

Notation: pt a point, 2 two points, J the nerve of the free-living isomorphism, N[1] = Δ[1]. Pages are PDF pages.

| Statement | Instances | One side | Other side | Result |
|---|---|---|---|---|
| §1.3.1; HTT lines 11452, 11457, p. 260 | C = N[1]; (x,y) = (0,1), (1,0) | `Hom^R`: pt, ∅ | `Hom`, `Hom^L`: pt, ∅ | Agree; hypothesis “C an ∞-category” matches |
| §2.2.1; HTT line 10793, p. 246 | {1} ⊆ Δ[1]; {0} ⊆ Δ[1] | Right anodyne: yes (Λ[1,1]); no | Lifts against right fibration {0} ⊆ Δ[1]: yes; no | Agree |
| §2.2.2; HTT lines 10831–10849, 10856 | {1} ⊆ Δ[1] glued with id of pt along ∅ | Pushout map {1} ⊔ pt ⊆ Δ[1] ⊔ pt | Right anodyne; monos u, v are the README's “left legs” | Agree |
| §2.5.1–2.5.2; HTT lines 10659, 10673, p. 244 | v = {1}, {0} ⊆ Δ[1], p = id | Fibers of `C_{p/}` over 0, 1: ∅, pt | `C_{pv/}`: ∅, pt for {1}; pt, pt for {0} | Equivalence exactly for {1} |
| §2.6.1; HTT line 10723, p. 245 | pt → J; {0} ⊆ Δ[1] | Categorical equivalence: yes; no | Cofinal: yes; no | Agree; ∞-category target stated |
| §3.2.1; HTT line 12161, p. 275 | Kan complexes, span pt ← 2 → pt | Homotopy pushout S¹ | ∞-categorical pushout S¹; strict pushout pt | Agree; README adds “small”, used by its route |
| §3.3.1; HTT line 12278, p. 278 | A = Kan–Quillen, K = ∅ | Colimit ∅ | Limit pt | Both exist |
| §3.4.1; HTT line 14229, p. 318 | Monoid ℕ, G = ℕ; η = 0, 1 | f ↦ 0 + f bijective | f ↦ 1 + f misses 0 | η matters |
| §3.4.2–3.4.3; HTT lines 14241, 14247 | C = Δ[1], F ≡ pt; c = 1, 0 | Map(0,1) = Map(1,1) = pt | Map(1,0) = ∅ ≠ F(1); 1 final in total space | Agree |
| §3.6.1; HTT line 25638, p. 567 | Z = pt; Z a Kan complex, vertex z | Strict maps over Z from z: pt | Mapping space in `S_{/Z}`: loops at z | Fibrations needed; Z bifibrant as in source |
| §4.3.1 (R03) | {1}, {0} ⊆ Δ[1], C = N[1], p = id | Cofinal: yes; no | Colimit cocone at 1 restricts to id₁; to edge 0 → 1 | Agree, small test category suffices |
| §4.2.1 route, step 3 | Circle, vertex, ℤ-torsor | Sections over circle ∅ | Over vertex ℤ; `C₀` contains pt, so Map(pt, −) detects it | Small `C₀` argument checked |
| §4.4.1; HTT line 10723 | q : J → pt; p = ∅ → J, pt → J | q ∘ p cofinal: no; yes | p cofinal: no; yes | Agree |
| §5.2.1–5.2.3; HTT lines 11041, 11056, 11060, 11084 | {1} ⊆ Δ[1] left fibration; {0} ⊆ Δ[1] | Pull back {1} ⊆ Δ[1]: iso of pt | ∅ → pt, not right anodyne | Left fibration smooth; right fibration not |
| §5.3.1; HTT lines 11094, 11114, p. 253 | C = pt, fold 2 → pt | Covariant equivalence: no | Fiber map on π₀: 2 → 1 | Agree; C ∞-category, both maps smooth |
| §5.4.2 (R03) | {1}, {0} ⊆ Δ[1]; `∂Δ[2]` → pt | `C ×_D D_{d/}`: pt, pt; over 1 ∅; `∂Δ[2]` | Cofinal: yes; no; no | Agree |
| §5.4.3 (R03) | id of Δ[1], b = 0; {1} ⊆ Δ[1], b = 1 | `E_b`: {0}; {1} | `E ×_B B_{/b}`: {0}; pt | Isomorphisms, cofinal |
| §7.3.1–7.3.2; HTT lines 12474, 12537, 12586 | Source hypotheses | “inner fibration of ∞-categories”; “locally coCartesian … of ∞-categories” | README:878, 882 state both | Match |
| §7.3.3 (R06); HTT lines 12681–12722, 12791, 12827 | C = Δ[1], D = E = pt; c = 0, 1 | `p_e`-initial in fiber: yes; no | p-initial: yes; no | Agree; `E₀ ⟶ E_{e/}` Cartesian as HTT line 12719 |
| §7.3.4–7.3.5; HTT lines 14118, 14138 | Left fibration 2 → pt; K = pt, ∅ | K = pt: cone is f-colimit | K = ∅: vertex not initial in 2 | Contractibility needed |
| §7.4.6 (R03) | C⁰ = ∅, C = pt; D = N[1], 2 | K: {0}; ∅ | K⁰: pt; ∅ | Trivial fibrations |
| §7.5.1 (R04); HTT lines 12902, 12941 | C = J, C⁰ = {0}, F = id | Kan extension at 0: yes | At 1: yes, `C⁰_{/1}` has a final object | Agree; D, D′ ∞-categories missing |
| §7.5.2 (R04); HTT line 13129 | {0} ⊆ {0,1} ⊆ N[2], F constant | Extension from {0,1}: yes | From {0}: yes | Agree; hypothesis missing |
| §7.5.3 (R04); HTT line 13147 | C′ = 2, C⁰ = {0} ⊆ N[1] | Two slices `C⁰_{/c}` | `(C⁰ × C′)_{/(c,c′)}` = same, C′ discrete | Agree; hypothesis missing |
| §8.2.1–8.2.3; HTT lines 15105, 15127, 15152, 15158 | Fun(Δ[1], Δ[1]) = {00 < 01 < 11}, K = ∅ | Initial object 00 | Values 0, 0; identity 01 has value 1 at 1 | Pointwise criterion both ways |
| §8.3.1; HTT line 10387, p. 237 | K = ∅, value T; K = pt, edge T₀ → T₁ | Colimit iff T = ∅; iff edge an equivalence | ∅ → X weak equivalence iff X = ∅; X₀ ⊆ X̄ ≃ T₁ | Agree |
| `IsCofinal`, `sectionsRestrict` | {1}, {0} ⊆ Δ[1]; fold 2 → pt | Sections: equivalence; ∅ → pt | Fold: 2 → 4 | Right fibrations pin the variance |
| `isCofinal_iff_forall_isColimit` | As §4.3.1; test C in the universe of K | True; false | True; false | README:518 states the same generality |
| `isCofinal_comp_iff_of_isCategoricalEquivalence` | q : J → pt; p = ∅ → J, pt → J | `p ≫ q` cofinal: no; yes | p cofinal: no; yes | Agree |
| `isCofinal_iff_rlp_monomorphisms` | ∅ → pt; J × Δ[1] → Δ[1] | Cofinal: no; yes | Lifts against monos: no; yes | Agree |
| `isCofinal_iff_exists_rightAnodyne_trivialFibration` | id of ∅; ∅ → pt | Cofinal: yes; no | Factorization: ∅ = ∅ = ∅; none, middle must be nonempty | Agree |
| `isCofinal_iff_isWeaklyContractible` | {1}, {0} ⊆ Δ[1] | Cofinal: yes; no | Pullbacks with `D_{d/}`: pt, pt; ∅ over 1 | Coslice `D_{d/}`, as HTT 4.1.3.1 |
| `isCofinal_nerveMap_toSimplexCategory_op` | Over [0] | Fiber category `Δ_sᵒᵖ` over [0] | Contractible by adjoining an initial vertex | Direction `Δ_sᵒᵖ → Δᵒᵖ` as HTT line 31505 |
| `exists_isCofinal_nerve_elements_op` | K = pt | `(Elements K)ᵒᵖ` = Δ, two maps [0] → [1] | N(Δ) → pt cofinal, [0] terminal | Variance right |
| `exists_isCofinal_nerve_partialOrder` | K = ∅, pt | Empty poset; one point | Identity maps | Agree |
| `IsLeftKanExtensionAt`, `IsLeftKanExtension` | C = N[1], A = {0}; F = id, constant | At 1: cocone 0 → 1 over pt, not a colimit | Constant: identity cocone, colimit | `slice.homEquiv` restricts to `inr`, cone point c |
| `exists_isLeftKanExtension_iff` | P = False, C = pt, D = N[1], 2 | Extension exists; none | Initial object exists; none | Agree |
| `exists_rlp_monomorphisms_leftKanExtensions_restrict` | Same | {0} → pt; ∅ → ∅ | Range lies in K⁰ in both | Trivial fibrations |
| `exists_isLimit_spaces`, `exists_isColimit_spaces` | K = ∅; pt → S¹ ← pt | Limits pt, ΩS¹; colimit ∅ | Strict pullback pt is wrong | Agree |
| `exists_isLimit_catInfty`, `exists_isColimit_catInfty` | K = ∅ | pt | ∅; Map(pt, Δ[1]) is the core, 2 | Agree |
| `presheaf`, `exists_is(Co)Limit_presheaf` | K = ∅, pt, 2 | pt, S, S × S | Limits pointwise | Agree |
| `exists_isColimit_ihom`, `isColimit_iff_forall_isColimit_evalAt` | T = ∅; T = Δ[1], C = N[1] | Fun = pt, condition vacuous | As §8.2 | Agree; `hC` needed for “only if” |
| `isColimit_iff_isWeakHomotopyEquivalence` | K = ∅, g = T, X ≃ T | Colimit iff T = ∅ | `∅ → X` weak equivalence iff X = ∅ | Agree; `ClassifiesLeft` forces essentially small fibers of X |
| R06 separating instance | Nerve of `a < b₁, a < b₂` over Δ[1] | a initial in its fiber over initial 0, and in X | Fiber over 1 is 2, no initial object | 2.4.4.7 not a case of 2.4.4.9 |
| Headlines not stated (§3.1, §3.2, §3.3 general A, §3.8 identification) | Docstring lines 40–46 | Need combinatorial simplicial model categories, Cartesian model structure | Neither at the pin | Named as not statable |

- Source locators: 45 HTT statements located by number, page and hypotheses (all 15 sampled sections); 4 Kerodon locators read (Def. 4.5.4.1 line 28801; Thm. 7.2.3.1 line 57604; Variant 7.3.1.5 line 58006; Prop. 7.3.2.11 line 58362, which assumes ∞-categories as README:969 says).
- Library at the pin: Tau Ceti `SimplicialSet/Coslice.lean`:87, 119, 189; `Slice.lean`:271, 364; `WeaklyContractible.lean`:75; `Marked/Basic.lean`:49, 136, 204; Mathlib `SemiSimplexCategory.lean`:74, `Subcomplex.lean`:184, 222.
- Cross-Part citations: 78 distinct sections of Part InfinityCategoryFoundations and 44 of Part CartesianFibrations resolve to labels at this head; 12 ModelCategoryTheory sections spot-checked at the head of its open pull request.
- Dependency check: `depcheck: 261 roadmaps, 2595 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate: FAIL on `imports=7` and `build=15`; every other counter 0, including `outside-folder`, `stray-files`, `empty-sections`.
- Lean: 36 declarations read, 19 sorried theorems; none restates a definition or mirrors a Check; the definitions repeated from Part InfinityCategoryFoundations have that file's bodies (its lines 117, 496–541).
- Description: 35,789 words against “35.8k”; no change outside the family folder; the pin paragraph agrees with the gate.

Overlap check: read KanQuillen, EnrichedLocalization, SimplicialCategories, ModelCategories, ModelCategoryTheory (open), BordismFormalGroups, StableHomotopyKTheory, EnhancedDerivedSheaves (main). Model-categorical homotopy colimits and Kan extensions: SimplicialCategories; chunks: EnrichedLocalization; cofinality criterion, Theorem A, terminal fibre, Kan-extension trivial fibration: EnhancedDerivedSheaves E0.4, E3.1 on main (R03); rectification and `Cat∞` colimits: BordismFormalGroups F6.5 (R03).

Source independence: 12 passages compared with 1 source (HTT: Def. 4.4.4.1, proofs of 4.1.1.9, 4.1.2.16, 4.1.2.17, 4.3.1.13, 4.3.1.14, 4.3.2.5, 4.3.2.8, 4.3.2.9, 5.1.2.1, 5.1.2.2, statement 3.3.4.5), none shared beyond forced formulas; largest share HTT, 726 of 746 locators; contents compared with HTT: independent (Layers 1–6 run §4.2.1–2, §4.1.1–2, §4.2.4, §4.1.1, §4.1.3, §4.2.3 with §4.4; Layer 7 shares §4.3's order, forced by §7.1 → §7.2–7.3 → §7.4). HA and SAG were not read this round.

Research link: the headline targets are the cofinality, Theorem A, Kan-extension and colimit theorems of Lurie, Higher Topos Theory (2009), Chapter 4, after Joyal; §9.6–9.7 state the inputs Lurie's Higher Algebra (2017) §1.2.4 and Spectral Algebraic Geometry (2018) §A.5 use. Rests on the README's References.

## Not verifiable

- Elaboration, the `#check @name` comparison of elaborated signatures and the one-tactic probes: the seven missing modules stop the file before any declaration (R01); padding was judged by reading.
- The description's statement that the files elaborate against Tau Ceti `8b9f13d993`: that commit is not the pin and was not available to build.
- HA Lemmas 1.2.4.16–17 and SAG A.5.1.1–9 (§9.6, §9.7, outside the sample): texts not in the sources cache this round.
- ModelCategoryTheory citations beyond the 12 spot-checked: resolved by the citation tool only.

## Source issues

- **Misprint** in HTT at Lemma 5.1.2.1, proof, printed page 318: the source says the section map lands in the mapping object with Y and S exchanged; it should be sections of Y over S; affects nothing.
- **Misprint** in HTT at Lemma 5.1.2.1, proof, printed page 318: the source says fibers are taken over vertices of an undefined Q; it should be vertices of the section ∞-category C; affects nothing.

## For the human reviewers

- **Scope.** The description asks maintainers to choose the owner of generic ∞-categorical material between this family, BordismFormalGroups F6.5 and EnhancedDerivedSheaves E0–E3 (main), and open pull request #1807 (GeneralizedCohomology G2.1, G2.11). R03 records the overlap for this folder.
- **Licence.** HA and SAG are author-hosted manuscripts (README:1439–1446); Kerodon is an online resource. Their wording was not compared with §9.6–9.7 this round.
