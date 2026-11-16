# Review of Straightening (pull request #2270 at a6d7928)
Folder: `TauCetiRoadmap/InfinityCategoryTheory/Straightening/`
**Verdict:** needs changes

## R01 (P1) — `Suggested.lean` does not build at the pinned Tau Ceti

**Location** `TauCetiRoadmap/InfinityCategoryTheory/Straightening/Suggested.lean` lines 5–7 and 114–133: imports of `TauCeti.AlgebraicTopology.Quasicategory.CatInfty`, `…Quasicategory.Limit`, `…SimplicialNerve.Basic`; `CatInfty.vertex`, `CatInfty.colimit_induction`. Unchanged since the two previous reviews (their R01: not repaired).
**Claim** The file states its theorems against the pinned Tau Ceti; the gate's targeted build exits 1 with three `bad import` errors.
**Witness** Pin `2fd255d` of `lake-manifest.json`: `TauCeti/AlgebraicTopology/Quasicategory/` holds only `Cartesian`, `Core`, `FullSubcategory`, `LocallySmall`, `RightMappingSpace`; `SimplicialNerve/` holds `HornThickening`, `SimplicialThickening`.
**Repair** Either the pin bump lands on main first and main is merged into the branch, or: delete lines 5–7 and the `## Layer 3` section (lines 114–133), move "the generation of `Cat∞` by `Δ[0]` and `Δ[1]` (§3.4.3, Nikolaus–Scholze, Lemma A.17)" from the docstring's "Stated" list to its not-statable list with "it needs `Cat∞` as a simplicial set and colimits in a quasicategory", drop "`CatInfty.vertex` is local to this file" there, and drop "`Suggested.lean` declaration `CatInfty.colimit_induction`" from README §3.4.3. Tested: that copy elaborates at the pin with four `sorry` warnings and nothing else.

## R02 (P2) — Objects owned by roadmaps on main are planned again without citation

**Location** `README.md` lines 43–57 (Scope and ownership names only this family, ModelCategoryTheory and the libraries); targets §1.5.2–§1.7.2, §1.8.5, §2.3.2, §3.2.2, §3.4.1–§3.4.3, §5.1.1, §5.1.3, §5.2.1, §5.3.1, §5.3.3, §5.3.4. Unchanged (previous R02: not repaired).
**Claim** Marked straightening as a Quillen equivalence, its `Fun(S, Cat∞)` form, descent, generators of `Cat∞`, colimits of localizations, limits as sections, coherent mates and left derivable families have no other owner.
**Witness** Main (`d12aa5b`): `TauCetiRoadmap/BordismFormalGroups/README.md` lines 1975–2002, 2083–2100; `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` lines 362–364 (E0.7, HTT Cor. 3.3.3.2), 1257 (E3.4, coherent mates), 1498 and 1508 (E5:abstract.3, Nikolaus–Scholze A.8, A.16–A.17).
**Repair** One owner per object, and main is earlier: in Scope and ownership cite `BordismFormalGroups` §F6.5 ("Marked fibrations and Kan extensions", "Coherent model diagrams and stable enhancements") and `EnhancedDerivedSheaves` E0.7, E3.4, E5:abstract.3 for what they state and keep here only what they do not; or first land the revision of those two roadmaps that hands these objects to this family, and name that order in the description, whose overlap list omits E3.4 and E5:abstract.3.

## R03 (P2) — The supplier contract names ten Tau Ceti declarations absent at the pin

**Location** `README.md` lines 54–55, 98, 125–135 and 655: "`SSet.catInfty`", "`SSet.CatInftyΔ`", "`SSet.core_sHom_eq_top`", "`SSet.RightFibration`, `SSet.LeftFibration`", "`SSet.slice.IsLimit`, `SSet.coslice.IsColimit`", "`SSet.Edge.isEquivalence_iff_hornFilling_zero`", "`SSet.isWeaklyContractible_iff_isWeakHomotopyEquivalence`", "Tau Ceti `CategoryTheory.simplicialNerveMap`". Previous R03: not repaired; the tenth name is new in this report.
**Claim** These exist at the pinned Tau Ceti ("Already in the library, and cited rather than planned").
**Witness** `grep -rn` of the ten names over `TauCeti/` at `2fd255d`: no hit. `CatInfty.lean`, `Limit.lean`, `OuterHorn.lean`, `WeakHomotopyEquivalence.lean` and `AnodyneExtensions/LeftRight/` are not there; `simplicialNerveMap` is in no file and is missing from "From Tau Ceti".
**Repair** With the pin bump of R01 on main: add `CategoryTheory.simplicialNerveMap` with its file to "From Tau Ceti", nothing else. Otherwise remove the ten names from "From Tau Ceti", from "Already in the library" and from the `*Needs:*` lines, citing instead the Part that states each object (`Cat∞`, left and right fibrations, limits and colimits in an ∞-category, the nerve map) by section.

## R04 (P3) — Gate rule `imports`

**Location** `Suggested.lean` lines 5–7.
**Claim** Every `TauCeti.*` module imported exists at the pinned Tau Ceti.
**Witness** Gate at a6d7928: `imports=3`, lines 5, 6, 7, "does not exist at the pinned Tau Ceti"; `build=7`.
**Repair** The repair of R01.

## R05 (P3) — Supplier contract cites a section Part CartesianFibrations does not have

**Location** `README.md` line 149: "functor ∞-categories and the forms of categorical equivalence (§3.4); correspondences (§4.1)".
**Claim** Part CartesianFibrations has a §3.4 with that content.
**Witness** `TauCetiRoadmap/InfinityCategoryTheory/CartesianFibrations/README.md` line 611: "### 3.3 Functor ∞-categories and the forms of categorical equivalence"; line 654 opens Layer 4; there is no §3.4.
**Repair** "functor ∞-categories and the forms of categorical equivalence (§3.3); correspondences (§4.1)".

## R06 (P3) — Two wrong internal ids, an incomplete reference entry, backticks in a code block

**Location** `README.md` line 1022: "q' is compared with it in §2.5.4 of this Part"; line 1790: "§2.4.1 (HTT, Prop. 3.3.1.3, base change; Prop. 3.3.1.5, fiberwise equivalences)"; lines 1829–1830: "Cited here: Cor. 4.7.4.18 (3), p. 699 (compared in §5.1)"; line 479.
**Claim** §2.5.4 holds the comparison; §2.4.1 states Prop. 3.3.1.5; HA is cited once; the display of §1.7.2 renders as written.
**Witness** Line 1037: the comparison is §2.5.5 (§2.5.4 is the sentence's own target). Line 870: Prop. 3.3.1.5 is §2.4.3. Lines 537, 547, 1643: HA Construction 5.2.1.1, Props. 5.2.1.3, 5.2.1.10, Def. 1.3.4.1. Line 479: an indented block prints the backticks of `Cat∞`.
**Repair** Line 1022: "in §2.5.5 of this Part". Line 1790: "§2.4.1 (HTT, Prop. 3.3.1.3, base change) and §2.4.3 (HTT, Prop. 3.3.1.5, fiberwise equivalences)". HA entry: "Cited here: Def. 1.3.4.1, p. 108; Cor. 4.7.4.18 (3), p. 699 (compared in §5.1); Construction 5.2.1.1, p. 804, Prop. 5.2.1.3, p. 805, and Prop. 5.2.1.10, p. 807 (§1.8)." (pages checked against the PDF). Line 479: `Fun(Sᵒᵖ, Cat∞)` without the inner backticks.

## R07 (P3) — §1.8.2 has two Checks

**Location** `README.md` lines 563–568 (§1.8.2, which defines `Tw(K)`, `D^co` and `Tw_*D`: two bullets). Previous R09: repaired for §1.8.5 (three bullets, lines 644–651), not for §1.8.2.
**Claim** Each definition has at least three discriminating Checks.
**Witness** Two bullets: the path `A_1` and the failure of the lift for `Tw(Δ[1])`.
**Repair** Add: "`Tw(Δ[1])` has three vertices, two nondegenerate edges and no nondegenerate 2-simplex, while the arrow ∞-category `Fun(Δ[1], Δ[1]) = N(00 ⟶ 01 ⟶ 11)` has one; a definition by arrows and commuting squares would give the latter." (Computed: `Tw(Δ[1])` is the nerve of the poset `00 ⟵ 01 ⟶ 11`, which has no chain of length 2.)

## R08 (P3) — `Suggested.lean`: process narrative in the docstring, section titles, names the README lacks

**Location** `Suggested.lean` lines 33–34: "Earlier revisions of this list named only §1.7 and §1.8, which left the rest of Layer 1 with no deliverable of record;"; lines 75 and 114; the names `IsCategoricalEquivalence`, `categoricalEquivalences`, `CatInfty.vertex`.
**Claim** The docstring is timeless; the section comments carry the README's layer titles; every Lean name appears in the README.
**Witness** The sentence narrates the file's history. README lines 697 and 1135 title the layers "Cartesian fibrations over arbitrary bases and their classifying maps" and "Limits, colimits and descent in `Cat∞`". `grep -c` of each of the three names in `README.md`: 0.
**Repair** End the bullet at "all have to be built first;" and delete the sentence. Use the README's two titles in the `/-! ## Layer k -/` comments. Add to the Conventions bullet on categorical equivalences: "`Suggested.lean` restates them as `IsCategoricalEquivalence`, `categoricalEquivalences` and `categoricalFibrations`", and to §3.4.3: "with `CatInfty.vertex` the vertex of `Cat∞` given by a small ∞-category" (the last only if Layer 3 stays, R01).

## R09 (P3) — §1.9.1: the base-change isomorphism is ill-typed as written

**Location** `README.md` lines 660 and 665–666: "for a small category C and a functor `f : C ⥤ SSet`" … "for `g : C ⥤ D`, `N_{f ∘ g}(C) ≅ N_f(D) ×_{N(D)} N(C)`".
**Claim** With `f : C ⥤ SSet` and `g : C ⥤ D`, the composite `f ∘ g` and `N_f(D)` are defined.
**Witness** `f ∘ g` needs f on D. HTT lines 9302–9304 (Rem. 3.2.5.7, p. 214) takes g between small categories and the diagram on the target of g; the left adjoint is Rem. 3.2.5.5, p. 214.
**Repair** "`f ↦ N_f(C)` has a left adjoint `X ↦ F_X(C)` from simplicial sets over `N(C)` to `SSet^C` (HTT, Rem. 3.2.5.5, p. 214), and for a functor `g : C ⥤ D` of small categories and `h : D ⥤ SSet`, `N_{h ∘ g}(C) ≅ N_h(D) ×_{N(D)} N(C)` (HTT, Rem. 3.2.5.7, p. 214)."

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §1.2.1 (sample) | S = Δ[2], X = `{2}^♭`; S = Δ[1], φ = 𝟙 | value at 0 is `Map_{C[Δ[2]]}(0,2) = Δ[1]`, `G^* s₀(2̃) = G` marked: `Δ[1]^♯`; discrete mapping objects: only degenerate edges marked | agrees; HTT line 8204, p. 189 |
| §1.3.1 (sample) | X = ∅; `S' = S`, p = 𝟙 | both sides the empty functor; identity isomorphism; HTT lines 8211–8239, pp. 189–190, (1)–(3) and Cor. 3.2.1.5 | agrees |
| §1.4 (sample) | n = 0 in the cylinder; marked last horn n = 1; K = Δ[1] | `{1}^♯ ⊆ Δ[1]^♯`; at 0 the point `{0,1,2}`, the target of `Map(0,2) = Δ[1]`; `Δ[1]^♭ ⟶ Δ[1]^♯` not an equivalence | agrees; HTT lines 8247–8312, pp. 190–192 |
| §1.6 (sample) | n = 0; i = n; i < n | T self-equivalence (line 8944); ψ an isomorphism (line 9017); `{n−1} ⊆ Δ[n−1]`, `Δ^{n−1,n} ⊆ Δ[n]` right anodyne by cancellation at the final vertex | agrees; pp. 206–209 |
| §1.7.1, §1.7.2 (headline, sample) | S = Δ[0]; S = Δ[1], `pr₂` | `Map^♯(Δ[0]^♮, Δ[1]^♮)` two points, `Map^♭` is Δ[1]; vertices into `(Δ[1]×Δ[1])^♮`: 2 from `Δ[1]^♯`, 3 from `Δ[1]^♭` | agrees; HTT lines 8113–8125, 9139, 9155, 12198 |
| §1.8.2 | m = 0, 1; K = Δ[1] | `A_0 = {0} ⊆ Δ[1]`; `A_1` the path `0'–0–1–1'`; `Tw(Δ[1]) = N(00 ⟵ 01 ⟶ 11)`, no edge `00 ⟶ 11` | Kan hypothesis needed; R07 |
| §1.8.4, §1.8.5 (headline) | P = {a<b, a<c}; `Δ[2] ⟶ Δ[1]` | `N(P)` has initial a, `N(P)ᵒᵖ` has none; transport picks 1, initial in `Δ{1,2}`, final without op | agrees |
| §1.9.1 (sample) | C = [0]; C = [1], `Δ[0] ⟶ Δ[1]` at 0; `Δ[1] ⟶ Δ[0]` | `N_f = f(0)`; edges over `0 ⟶ 1` end at b with an edge `0 ⟶ b`: 2; one edge from each vertex | agrees with HTT lines 9263–9304, pp. 213–214; R09 |
| §2.1 (sample) | g : Δ[0] ⟶ Δ[1] picking 1; vertex ∅ | `Δ[2] ⟶ Δ[1]`: Cartesian edge `1 ⟶ 2`, transport 1; `N({0<1, 0<2})`: transport 0; `U(∅) = ∅` | discriminates; HTT lines 9970–9998 |
| §2.2.1 (headline, sample, Lean) | j = 𝟙; X = ∅ | Y = X, f the pullback isomorphism; Y = ∅; one-tactic probe leaves the goal | agrees; HTT lines 9690–9717, pp. 222–223 |
| §2.3.1 (headline, Lean) | `rfl`, `simp`, `infer_instance`, unfolding | goal `(monomorphisms ⊓ categoricalEquivalences).rlp p` remains | not padding; HTT line 9892, p. 227 |
| §2.3.2 (headline, sample) | S = Δ[1]; S = Δ[0], J | `{1}^♭ ⊆ Δ[1]^♯` marked anodyne, `{1} ⊆ Δ[1]` not a categorical equivalence; `J^♮ = J^♯ ≠ J^♭` | Kan hypothesis needed; HTT line 7912, p. 183 |
| §2.4.1, §2.4.3 (Lean) | S = ∅; g = 𝟙; probes | both sides of the iff true; `pullback.fst` an isomorphism; `pullback.map p s q s f (𝟙 Δ[0]) (𝟙 S)` typed fiber to fiber; probes fail | elaborates; HTT lines 9725, 9798 |
| §2.5 (sample) | K = Δ[0] ⊔ Δ[0]; `Δ[1] ⟵ Δ[0]` at 1 | `U(K)`: 2 vertices, no nondegenerate edge; mapping simplex `Λ[2,1]`; the comparison is §2.5.5, cited as §2.5.4 | HTT lines 9999–10051, 10107; R06 |
| §2.6.1 (sample) | C = ∅ | sections over ∅ are Δ[0], the homotopy limit of the empty diagram; the two maps of HTT line 10171 | agrees; HTT lines 10151–10202, pp. 232–233 |
| §3.1.1 | S = Δ[1], S' = {0}; S' = ∅ | `{0}ᵒᵖ` final in `Δ[1]ᵒᵖ`, `X₀^♮ ⊆ X^♮`: colimit of `X₁ ⟶ X₀` is X₀; cofinal forces S = ∅ | agrees; HTT lines 10254–10291 |
| §3.2 (headline, sample) | K = ∅; K = Δ[1] | `C ⟶ Δ[0]` an equivalence iff C ≃ Δ[0]; sections determined over 1: limit X₁ | agrees; HTT lines 10128–10134, 10208–10241, pp. 232–234 |
| §3.3 (headline, sample) | K = ∅; K = Δ[1]; T = ∅ | `∅ ⊆ X̄^♮` equivalence iff X̄ = ∅; colimit X₀; constant ∅ a colimit diagram | agrees; HTT lines 10295–10300, 10372, 7748 |
| §3.4 (headline, sample) | `Λ[2,0] ⊆ Δ[2]`; Kan complexes; empty diagram | pushout `Δ{0,1} ⊔ {2}`: 2 components against 1; contains Δ[0], closed under colimits, misses Δ[1]; X = ∅ | matches A.16, A.17 (NS lines 6639–6689, pp. 140–141); Lean not elaborable (R01) |
| §4.1.2 (headline, sample) | X = Y = S, δ = 𝟙; S = Δ[0] | α invertible iff each `α_s` is; the statement is its own fiber | agrees; HTT lines 13783–13800, pp. 308–309 |
| §5.1.1, §5.1.3 (headline) | C = [1], D = C' = D' = ∗; transpose; `∅ ⟶ ∗` | γ = (0 ⟶ 1), right mate `𝟙₁`; transposed γ an identity; no adjoint | agrees; HTT lines 34778–34785, p. 768; Liu–Zheng lines 3906–3918, I = {1,2}, J = {2} |
| §5.2.1 | K = ∅; poset `0 < 1 > 2` | ∅ ⟶ ∅; pushout of points along a point is Δ[0] | agrees; NS p. 143 |
| §5.3 (headline) | Δ[2], fibers [1], `s_!` constant 1, `t_!` = 𝟙; S = X = Δ[1] | `Lt_! ∘ Ls_!` = 0, `Lu_!` = 1, comparison `0 ⟶ 1`; condition 1 fails | conditions independent; NS lines 6414–6440, 6547–6566 |
| Supplier contract, Part CartesianFibrations | §3.4 against its headings | Layer 3 has §3.1–§3.3 only | R05 |

- Previous findings: R01 not repaired (R01); R02 not (R02); R03 not (R03); R04 not (R04); R05 repaired (`NOTES.md` gone, `stray-files=0`); R06 repaired (`tex=0`, the span of line 639 on one line); R07 repaired ("Part CartesianFibrations §5.8.3 (the `Map^♯` enrichment)", lines 228–229); R08 repaired ("C the point", line 219; the bullet of line 245); R09 partly (R07); R10 repaired ("defines `St⁺_φ`; `Un⁺_φ` is the right adjoint of HTT, Cor. 3.2.1.5", lines 212–214).
- Source locators checked against the text: 73 statement numbers with their pages (HTT 58, Nikolaus–Scholze 8, HA 5, Liu–Zheng 2), all matching; the statements were read for the 15 sampled targets.
- Library declarations opened at the pins: 15; present are Tau Ceti `SSet.Edge.IsCartesian` (`Quasicategory/Cartesian.lean` line 65), `SSet.CartesianFibration` (line 110) with `of_isPullback` (line 130) and `comp` (line 160), `SSet.Edge.CompStruct.isEquivalence₀₂` (`Quasicategory/Core.lean` line 122), `TauCeti.MarkedSSet` (`SimplicialSet/Marked/Basic.lean` line 49); ten absent (R03). No categorical equivalence is defined at the pinned Tau Ceti, so the three restated definitions duplicate nothing there.
- Cross-roadmap citations resolved: about 700 section ids against the four earlier Parts at this head and the four ModelCategoryTheory Parts at the head of their pull request, and about 290 internal ids; one unresolved (R05), two internal ids wrong (R06). The 52 citations of Part Straightening by sibling Parts all resolve at this head.
- Dependency check: `depcheck: 261 roadmaps, 2594 edges, 0 problem(s)`.
- Gate: fails on `build=7` and `imports=3`; every other check 0. No change outside the pull request's own folders.
- Elaboration: the full file cannot be elaborated at the pin. A copy without lines 5–7 and Layer 3 elaborates with `sorry` the only warning; `#check @name` of its seven declarations agrees with README §2.2.1, §2.3.1, §2.4.1, §2.4.3 (no binder lost, nothing changed); the three definitions have the bodies of `InfinityCategoryFoundations/Suggested.lean` lines 117–123 and 650–651, in a different namespace. `first | rfl | simp | infer_instance | simp [defs] | exact?` closes none of the four theorems.
- Description read against the head: 24.4k words (counted 24,442), a new roadmap, the pin stated; no sentence contradicted for this folder; its overlap list omits two items (R02).

Overlap check: read EnrichedLocalization, KanQuillen, SimplicialCategories, ModelCategories (open, suppliers: none states straightening, twisted arrows, adjointable squares or derivable fibrations; no other Part of this family states twisted arrows), BordismFormalGroups, EnhancedDerivedSheaves, StableHomotopyKTheory (main); marked straightening, its `Fun(S, Cat∞)` form, descent, generators of `Cat∞`, colimits of localizations: owner BordismFormalGroups §F6.5; limits as coCartesian sections, coherent mates, left derivable families: owner EnhancedDerivedSheaves E0.7, E3.4, E5:abstract.3; see R02. Nothing shared with StableHomotopyKTheory.

Source independence: 21 passages compared with 3 sources (HTT, Nikolaus–Scholze, Liu–Zheng), none shared beyond formulas and runs of at most 6 words; largest share HTT, 502 of 544 source mentions; contents compared with HTT: Layer 1 ↔ §3.2 and Layers 2–3 ↔ §3.3 in the same order, forced by the `*Needs:*` lines of §2.2.1 (§1.7.1) and §3.2.1 (§2.5.2, §2.6.1); sections are not one to one (§1.1–§1.5 ↔ §3.2.1, §2.1 and §2.5 ↔ §3.3.2 on both sides of §3.3.1, §2.3.2 ↔ §3.1.5; §1.8, §3.3.3, §3.4 and Layers 4–5 outside that run): independent.

Research link: Layer 1 is the straightening theorem of Lurie (2009, HTT Thm. 3.2.0.1); Layer 5 states the tools Nikolaus–Scholze (2018, Prop. A.14) use for derived functors in topological cyclic homology and Liu–Zheng (arXiv 2012, Prop. 2.2.4) use for six operations on Artin stacks; rests on the README's locators and the texts read.

## Not verifiable

- `CatInfty.vertex` and `CatInfty.colimit_induction`: their carriers are not at the pin, so their elaborated types (in particular the universe of `K : SSet.{u + 1}`) were not compared with README §3.4.3.
- Whether the ten names of R03 exist at a Tau Ceti newer than the pin, and the description's statement that all files elaborate against Tau Ceti `8b9f13d993`: that commit is not the pin and was not built.
- Ownership against the board's unpublished packages: only the board index was read (two packages, neither on this subject); main and the open pull requests were searched.

## Source issues

- **Misprint** in HTT at Lemma 3.2.3.2, proof, p. 206: the source says it suffices that the map from F(C) to F(D) is an equivalence, for s with ψ(s) = C; it should be F(C) to G(C), with φ(s) = C; affects nothing.
- **Misprint** in HTT at Prop. 3.3.3.1, p. 232, and Cor. 3.3.3.2, p. 234: the source says the diagram into the opposite of `Cat∞` is a diagram in the ∞-category of spaces; it should be of ∞-categories; affects nothing.
- **Misprint** in HTT at the proof of Prop. 3.3.3.1, p. 233: the source says the fibration may be taken to be the straightening of the diagram; it should be its unstraightening; affects nothing.
- **Error** in HTT at Def. 3.3.2.2, p. 229: the source says a map to `Cat∞` classifies a coCartesian fibration when its opposite classifies the opposite fibration; it should compose with the opposite-category involution of `Cat∞`, as Prop. 3.2.5.21 (3) uses; affects a stated result.
- **Misprint** in Nikolaus–Scholze at Lemma A.16, proof of (2), p. 140: the source says the pullback of `F_j` along `S_i ⟶ S_j` is `F_j`; it should be `F_i`; affects nothing.

## For the human reviewers

- **Scope.** The description asks the maintainers to choose the owner of marked straightening, `Cat∞` colimits and descent between `BordismFormalGroups` §F6.5 and `EnhancedDerivedSheaves` on main (README lines 1975–2100; 362, 1257, 1498) and this family; R02 depends on that choice.
- **Not tested.** `Suggested.lean` needs a Tau Ceti newer than the pin `2fd255d` (the description names `8b9f13d993`); R01, R03 and R04 have stood for three reviews, and whether to bump the pin before this pull request is a decision outside the folder.
- **Licence.** Liu–Zheng (arXiv:1211.5948v4) is cited as an arXiv preprint with no journal reference in `README.md` line 1834, and HA from the author's PDF; both were read from arXiv and the author's page.
