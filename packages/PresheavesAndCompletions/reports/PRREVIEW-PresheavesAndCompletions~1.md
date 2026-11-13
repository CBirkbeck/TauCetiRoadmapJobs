# Review of PresheavesAndCompletions (pull request #2270 at 04df60e)
Folder: `TauCetiRoadmap/InfinityCategoryTheory/PresheavesAndCompletions/`
**Verdict:** needs changes

## R01 (P1) — `Suggested.lean` does not build at the pins; thirteen cited Tau Ceti declarations are absent there

**Location:** `TauCetiRoadmap/InfinityCategoryTheory/PresheavesAndCompletions/Suggested.lean` lines 4–8, 10, 11; `README.md` lines 159–189 ("From Tau Ceti").
**Claim:** The file imports seven `TauCeti.*` modules and the README cites `SSet.coslice.IsColimit`, `SSet.slice.IsLimit`, `SSet.IsFullyFaithful`, `SSet.LeftFibration`, `SSet.RightFibration`, `SSet.IsWeakHomotopyEquivalence`, `SSet.catInfty`, `SSet.CatInftyΔ`, `SSet.QCat.IsCategoricalEquivalence`, `SSet.IsTerminalVertex`, `SSet.ihomOver`, `SSet.ihomObj₀Equiv`, `SSet.rightAnodyneExtensions_pushoutObjObjι'` as pinned.
**Witness:** Gate: `imports=7`, `build=15`, exit 1. At the pinned Tau Ceti (2fd255d) `TauCeti/AlgebraicTopology/Quasicategory/` holds only `Cartesian`, `Core`, `FullSubcategory`, `LocallySmall`, `RightMappingSpace`; none of the thirteen names occurs.
**Repair:** Either rebase once main's Tau Ceti pin contains these modules, or delete the seven imports and every declaration using them, name each in the docstring's "Not statable at the pins" list with its missing carrier, and mark the thirteen declarations in the supplier contract as not at the pin.

## R02 (P2) — objects owned here are already owned by two roadmaps on main

**Location:** `README.md` lines 34–54 (`## Scope and ownership`), which names neither roadmap.
**Claim:** This Part owns the presheaf Yoneda lemma (§1.3.1), idempotent completions (§3.2.1, §3.3.2), sifted simplicial sets (§5.1.1, §5.3.1, §5.3.2), `Ind_κ` with its universal property (§6.1.2, §6.5.3) and the comparison with Mathlib's `Ind` (§6.4.5).
**Witness:** On main, `TauCetiRoadmap/BordismFormalGroups/README.md` lines 2197–2204 (F6.5: presheaves, Yoneda, `Ind_κ`, universal property); `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` lines 1544 (`idemCompletion`), 1613 (`indOrdinaryComparison`), 1902 (`IsSiftedInfinity`).
**Repair:** Add to `## Scope and ownership` a bullet citing BordismFormalGroups §F6.5 and EnhancedDerivedSheaves E5:abstract, E5:presentability.1 and E5:animation.1 as owners, and delete or narrow the listed targets to what those sections do not state. If this Part is to be the owner, a revision of the two roadmaps on main that removes those targets (with an old → new mapping) has to be on main first.

## R03 (P3) — 51 of the 69 Lean declarations are not named in the README

**Location:** `Suggested.lean`, for example lines 243 (`innerAnodyneExtensions_ret_ι`), 311 (`IsIdempotentComplete.slice`), 413 (`isCardinalFiltered_coslice`), 518 (`isRelativeColimit_of_two_variables`), 573 (`isCardinalContinuous_limit_π`).
**Claim:** README and Lean agree: every Lean name appears in the README.
**Witness:** A search of `README.md` for each declared name in backticks finds 18; absent are, among others, `IsCofinal`, `IsRelativeColimit`, `tfae_isIdempotentComplete`, `exists_isIdempotentCompletion`, `isCardinalRightExact_iff_slice`, `IsSifted.isWeaklyContractible`, `catInftyObj`.
**Repair:** At each target that has a Lean statement add the sentence already used in §3.3.2 and §4.3.2 ("`Suggested.lean` declaration: `<name>`"), and name the restated supplier definitions and the helper definitions (`IdemMonoid`, `idemPlusX`, `idemPlusY`, `idemPlusI`, `idemPlusR`, `toIdemMonoid`, `catInftyObj`) at §2.1.1, §2.4.1 and §6.6.2.

## R04 (P3) — padding in `Suggested.lean`

**Location:** `Suggested.lean` lines 383–386 (`isCardinalFiltered_of_retraction`) and 444–446 (`IsCardinalRightExact.id`).
**Claim:** Both are stated as headline targets.
**Witness:** By the pinned definition (`TauCeti/AlgebraicTopology/SimplicialSet/CardinalFiltered.lean` lines 58–60) the first is the term `⟨fun _ _ f ↦ ⟨join.map f (𝟙 _) ≫ r, _⟩⟩`; the second is `IsCardinalFiltered.of_iso` (line 71) along `pullback (𝟙 A) q ≅ B'`. Decided by reading: elaboration is unavailable (R01).
**Repair:** Delete both from `Suggested.lean`; the README keeps the statements (§4.3.1, §4.5.1).

## R05 (P3) — the retract in the Check on idempotents of `hS` points the wrong way

**Location:** `README.md` lines 813–815: "otherwise `BG` would be a retract, up to homotopy, of the colimit of `BG ⟶ BG ⟶ ⋯` along `e` (HTT, Rem. 4.4.5.18), and on fundamental groups `G` would surject onto the colimit".
**Claim:** A lift of `e` makes `BG` a retract of the sequential colimit, and that gives the surjection.
**Witness:** §2.1.1 has `r ∘ i = id_Y`, and §2.4.1 identifies `Y` with the colimit: the colimit is the retract of `X = BG`. A retraction of `BG` off the colimit would make `G ⟶ colim G` injective on `π₁`, not surjective.
**Repair:** "otherwise the colimit of `BG ⟶ BG ⟶ ⋯` along `e` would be a retract, up to homotopy, of `BG`, the map from the first stage having a right homotopy inverse (HTT, Rem. 4.4.5.18), and on fundamental groups `G` would surject, up to conjugacy, onto the colimit of `G ⟶ G ⟶ ⋯` along `λ`."

## R06 (P3) — `Fun^L` denotes two different full subcategories

**Location:** `README.md` lines 399–401 (§1.4.1: `Fun^L(P(S), C)`, functors preserving small colimits) and 509–511 (§1.5.1: `Fun^L(C, D)`, left adjoints).
**Claim:** One notation, used in §1.4.3 and §1.5.2–§1.5.3 for both.
**Witness:** `S ⊆ Ŝ` out of `P(Δ[0]) = S` preserves small colimits (the README's own line 1820) but has no right adjoint: `G(Y) ≃ Map(∗, G Y) ≃ Y` fails for `Y` not essentially small. It lies in the first `Fun^L(S, Ŝ)` and not in the second.
**Repair:** Write `Fun^colim(P(S), C)` in §1.4.1, §1.4.3 and wherever colimit preservation is meant, and add to §1.5.1: "For `D` locally small with small colimits, a functor `P(C) ⟶ D` is a left adjoint exactly when it preserves small colimits (§1.5.5)."

## R07 (P3) — homotopy pullbacks are cited at the target that defines homotopy pushouts

**Location:** `README.md` lines 701, 1531, 1585: "ModelCategoryTheory, Part ModelCategories §3.5.1 (HTT, §A.2.4, homotopy pullbacks)".
**Claim:** §3.5.1 of Part ModelCategories supplies homotopy pullback squares.
**Witness:** At the head of the ModelCategoryTheory pull request, ModelCategories §3.5.1 defines cofibrant resolutions of spans; "Define homotopy pullback squares dually, through fibrant resolutions of cospans" is §3.5.3.
**Repair:** In §1.6.4, §6.2.1 and §6.3.1 cite "Part ModelCategories §3.5.3 (HTT, §A.2.4, homotopy pullbacks)"; §5.4.1 keeps §3.5.1 for homotopy pushouts.

## R08 (P3) — a Check of §4.2.2 is false for preorders

**Location:** `README.md` line 1055: "the nerve of a preorder with two maximal elements is not, in agreement with the order-theoretic notion."
**Claim:** Two maximal elements prevent filteredness.
**Witness:** The preorder `{a, b}` with `a ≤ b ≤ a` has two maximal elements and every subset bounded above, so its nerve is filtered by `SSet.isCardinalFiltered_nerve_iff` (`CardinalFiltered.lean` line 137).
**Repair:** "the nerve of a partially ordered set with two distinct maximal elements is not, in agreement with the order-theoretic notion."

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.2.1 three models (HTT 5.1.1.1, p. 334) | `S = Δ[0]` | `P = S`; `P'` and `P''` are both `N(Kan)`: the same ∞-category on each side | holds | none |
| §1.3.1 Yoneda (headline; 5.1.3.1, p. 338) | `K = Δ[1]` | `j(0) = (pt, ∅)`, `j(1) = (pt, pt)`; `Map(j1, j0) = ∅ = Map_K(1, 0)`, `Map(j0, j1) = pt` | holds; docstring names it not statable | none |
| §1.4.3 free cocompletion (headline; 5.1.5.6, p. 345) | `S = ∅` | left: initial objects of `C`, contractible; right: `Fun(∅, C) = Δ[0]` | holds; not statable, named | R06 |
| §1.5.1–§1.5.2 (5.2.6.1–2, p. 378) | `C = Δ[0]`, `D = N([1])` | `Fun^L = {0}`; `Fun^R(D, C) = {D ⟶ Δ[0]}`, one object; `{0} ≃ {pt}^op` | holds | R06 |
| §1.5.5 (Cor. 5.2.6.5, p. 381) | `C = Δ[0]`, `D = S`, `F = id` | `G(d) = Map(∗, d) = d`; `Lan_f f (d) = colim_{∗→d} ∗ = d = F G d` | holds; Kan-extension clause is in the source | none |
| §2.1.1 `R`, `idemPlus` (Def. 4.4.5.2, p. 322) | Karoubi envelope of `{1, e}` | `Hom(X,X) = {1,e}`, the other three hom-sets `{e}`: five morphisms; `i∘r = e`, `r∘i = id_Y` | agrees with `idemPlusY.p = 0` | none |
| §2.1.2 fourth Check (Counterexample 4.4.5.19, p. 327) | retraction direction | colimit `Y` retract of `BG` gives `π₁` surjection; `BG` retract of `Y` gives injection | sentence reversed | R05 |
| §2.2.2 (Prop. 4.4.5.6, Cor. 4.4.5.7, p. 323) | horn `X ⟶ Y ⟶ X` | `Ret` has edges `i`, `r` and degenerate ones, not `e`: no filler; `Idem⁺` fills with `e` | holds | none |
| §2.4.1 (Prop. 4.4.5.17, p. 326) | `A = ∅`; `A = ℕ` | `∅ ⟶ Idem`: source not weakly contractible (constant maps into `∂Δ[1]`), target is; `ℕ`: fiber poset `A × {0,1}` nonempty, directed union | Lean has `[Nonempty A]` | none |
| §3.1.1 (Def. 5.1.4.1, p. 339) | `Δ[0] ⊔ Δ[0] ⟶ Δ[0]` | `Map(a, b) = ∅` against `pt`: not fully faithful; other two clauses hold | excluded by the first clause | none |
| §3.2.1 (Prop. 5.1.4.2, p. 339) | `C = N(B{1,e})` | retracts of the representable: two objects, `N` of the Karoubi envelope | holds | R02 |
| §3.3.1 (Lemma 5.1.4.6, p. 341) | `N(B{1,e}) ⟶ N(R)` | fiber under `X` has initial object `(X, 1)`; under `Y` it is `Idem`, a retract of `Idem^▷` | cofinal | none |
| §3.3.2 uniqueness (headline; 5.1.4.9, p. 341) | `C = N(B{1,e})`, `E = N(Set)` | `Fun(C, E)`: pairs `(X, e)`; `Fun(D, E)`: `(X, im e, i, r)`; restriction essentially bijective | holds; stated as `isCategoricalEquivalence_pre` | R02 |
| §4.1.1 (Def. 5.3.1.7, p. 400) | `∅`; `Λ[2,1] ⋆ Δ[0]`; `N(ℤ/2)` | `∅` fails at `K = ∅`; the cone extends every map but lacks the edge `0 ⟶ 2`; `h·1 = h·σ` forces `σ = 1` | definition needs both clauses | none |
| §4.2.1 (Remarks 5.3.1.11–12, p. 401) | `C = ∂Δ[1]`, `A` discrete on two points | `N(A) ⟶ C` onto both vertices has no cone; `C` not filtered: both sides false | holds | none |
| §4.2.2 (Lemma 5.3.1.14, p. 401) | `n = 0, 1, 2` in a nerve | nonempty; common target; triangle `(id, f, g)` yields `c f = c g` | recovers Mathlib's three conditions | R08 |
| §4.3.2 filtered ⇒ weakly contractible (headline; 5.3.1.20, p. 406) | `∅`, `N(ℤ/2)`, `Idem` | `∅`, `N(ℤ/2) ≃ ℝP^∞`: not filtered, not contractible; `Idem`: filtered by retraction `Z ↦ X`, `f ↦ e`, contractible | holds; stated | none |
| §4.5.1–§4.5.2 (Def. 5.3.2.1, Prop. 5.3.2.5, pp. 407–408) | `Δ[0] ⟶ C`, `C` one-vertex Kan circle | `Δ[0] ×_C C_{/c} ≃ Map(c, c) = ℤ`, discrete and not filtered; `c` not initial | both sides false | none |
| §4.5.3 (Prop. 5.3.2.9, p. 410) | `∂Δ[1] ⟶ Δ[0]` | preserves every existing finite colimit; fiber product `∂Δ[1]` not filtered; source lacks an initial object | converse needs `hA`, which Lean has | none |
| §5.3.4 sifted ⇒ weakly contractible (headline; 5.5.8.7, p. 525) | `∂Δ[1]`; parallel pair | diagonal: 2 components to 4; `π₁`: `ℤ ⟶ ℤ²` not bijective | neither is sifted; stated | R02 |
| §5.3.5–§5.3.6 sifted colimits and products (headline; 5.5.8.11, p. 526) | parallel pair, constant point | colimit `S¹`; product of colimits `T²`; colimit of product `S¹` | fails off sifted shapes; not statable, named | none |
| §5.4.1 (Lemma 5.4.5.10, p. 457) | `B = Δ[0]`; `B = ∂Δ[1]`, `A = C = Δ[0]` | `Λ[2,1] ⊆ Δ[2]`, inner anodyne; two morphisms `a ⟶ c` against one | hypothesis on `B` needed | none |
| §5.4.2 (Lemma 5.4.6.2, p. 462) | `A₀ = {0,1}` with `B = {1}`, `B = {0}`; `A₀ = ∅` | `Λ[2,1] ⊆ Δ[2]`; `Λ[2,0] ⊆ Δ[2]`, `B` not cofinal; `N({∞})` both sides | holds | none |
| §6.2.2 filtered colimits and κ-small limits (headline; 5.3.3.3, p. 412) | `I = ∂Δ[1]`, binary product | `(X ⊔ Y) × (X' ⊔ Y')` has four summands, `colim(F × G)` two | fails off filtered `I`; not statable, named | none |
| §6.1.1, §6.3.1 (Def. 5.3.4.5, Lemma 5.3.4.8, p. 414) | `N(ℕ ∪ {∞})` | `colim_n Map(∞, n) = ∅`, `Map(∞, ∞) = pt`; `Map(0, −)` constant `pt` | `∞` not compact, `0` compact | none |
| §6.3.2 (Lemmas 5.3.4.9–12, pp. 415–416) | `S^ℕ`, `κ = ω`, object `(∗)_n` | `Map = ∏_n X_n`, which does not commute with filtered colimits | κ-smallness of the family needed, stated | none |
| §6.5.1 (Lemma 5.3.5.7, p. 423) | `D = Δ[0] ⊔ Δ[0]` | `D' = (Ŝ × Ŝ)^op`, `i(a) = (pt, ∅)`; initial object of `D'` is `(pt, pt)`: empty cocone not a colimit on either side | holds | none |
| §6.5.3 universal property of `Ind_κ` (headline; 5.3.5.10, p. 424) | `C = Δ[0]`; `C = ∅` | `Ind = ` contractible spaces `≃ Δ[0]`, continuous functors `= D = Fun(Δ[0], D)`; `Ind(∅) = ∅`, both sides `Δ[0]` | holds; not statable, named | R02 |
| §6.6.1 (Prop. 4.4.5.20, p. 328) | `C` a nerve; `BG` in `S` | `E` discrete: `h` exists iff `e = e∘e`, coherence automatic; in `S`, `h² ≠ hλ(h)` | consistent with §2.1.2 | none |
| §6.6.2 (Cor. 4.4.5.21, p. 328) | 3-skeleton of `Idem` | finitely many nondegenerate simplices (one per dimension ≤ 3): factors through a stage | holds | none |
| `IsCardinalRightExact.comp`, `.of_iso` without regularity | `κ` finite | `A ×_B (B ×_C C') ≅ A ×_C C'`; base change of an equivalence of ∞-categories along a right fibration | hold for every κ | none |

- Source locators: about 110 HTT statement labels matched to their PDF pages (all agree with the README); the statements of the fifteen sampled sections read at HTT lines 14405–14730, 15022–15370, 17084–17300, 18190–18662, 18775–18912, 19024–19266, 20698, 20927.
- Library declarations opened at the pins: `SSet.IsCardinalFiltered` (`CardinalFiltered.lean` 58), `isCardinalFiltered_nerve_iff` (137), `SSet.IsWeaklyContractible` (`WeaklyContractible.lean` 99), `QCat.bicategory` (`StrictBicategory.lean` 66), `SSet.opFunctor` (`Op.lean` 44), `isCardinalFiltered_iff` (`IsCardinalFiltered.lean` 295), `exists_max` (104), `multicoequalizer` (334), the `ihom` quasicategory instance (`Inner/PushoutProduct.lean` 157).
- Cross-roadmap citations resolved: 108 section ids (33 LimitsAndKanExtensions, 28 InfinityCategoryFoundations, 8 AdjunctionsAndLocalizations, 5 Straightening, 9 CartesianFibrations, 25 in the ModelCategoryTheory pull request, of which 13 ModelCategories, 8 KanQuillen, 4 SimplicialCategories); one wrong target (R07).
- Dependency check: `depcheck: 223 roadmaps, 1972 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate: fails on `imports=7` and `build=15` (R01); every other check is 0. No change outside `TauCetiRoadmap/InfinityCategoryTheory/`.
- Elaboration and the `#check` comparison could not be run (R01); the 69 signatures were compared with the README by reading, and none differs in generality.
- Pull request text: the description's sentences about this folder (24.8k words, supplier ModelCategoryTheory, pin 2fd255d, headlines not statable) agree with the head.
- Overlap check: read KanQuillen, ModelCategories, SimplicialCategories, EnrichedLocalization (ModelCategoryTheory pull request), EnhancedDerivedSheaves, BordismFormalGroups (main); Yoneda, `Ind_κ` and its universal property: BordismFormalGroups §F6.5; idempotent completion, sifted ∞-categories, the `Ind` comparison: EnhancedDerivedSheaves (R02); nothing shared with the open four.
- Source independence: 20 passages compared with 1 source (and a seven-word shared-run scan of both files against it), none shared beyond statements the mathematics forces (longest run 19 words, a formula); largest share HTT, about 725 of 728 locators; contents compared with HTT: independent (Layers 1–6 draw on §5.1 with §5.2.6, §4.4.5, §5.1.4, §5.3.1–2, §5.5.8 with §5.4 and §A.2.9, §5.3.3–5 with §4.4.5, not in the source's order).

## Not verifiable

- Elaboration of `Suggested.lean`, the one-tactic probe and elaborated signatures: seven imports do not exist at the pinned Tau Ceti.
- The description's claim that the files elaborate against Tau Ceti 8b9f13d: that commit is not the pin.
- Statements behind HTT locators outside the fifteen sampled sections: label and page checked, text not read.
- Kerodon, Prop. 3.1.7.9 (cited in §5.3): not opened.
- Ownership against open pull requests other than the ModelCategoryTheory one and the closest-roadmap lists: searched by the grep tool only.

## Source issues

- **Misprint** in HTT at Definition 4.4.5.2, PDF p. 322: the source says `Idem⁺` is the nerve of a category `J` and `Idem` a full subcategory of `Idem`; it should be the nerve of `R` and a full subcategory of `Idem⁺`; affects nothing.
- **Gap** in HTT at Proposition 4.4.5.17, PDF p. 326: the source says the map from the nerve of any linearly ordered set without largest element is cofinal; it should assume the set nonempty, since the empty set maps to a weakly contractible target; affects a stated result.
- **Misprint** in HTT at Counterexample 4.4.5.19, PDF p. 327: the source says the map from `BG` to the sequential colimit would have a left homotopy inverse; it should be a right homotopy inverse, which is what gives surjectivity on fundamental groups; affects nothing.
- **Error** in HTT at Lemma 5.3.2.6, PDF p. 410: the source says the fiber of a Cartesian fibration with filtered total space over an initial object is a contractible Kan complex; it should be weakly contractible, and Kan only for right fibrations (`Δ¹ ⟶ Δ⁰`); affects a stated result.

## For the human reviewers

- Ownership: the description asks maintainers to choose between this family and BordismFormalGroups §F6.5, EnhancedDerivedSheaves (both on main) and the GeneralizedCohomology revision in pull request #1807 as owner of presheaves, Yoneda, `Ind` and sifted colimits (R02).
- Licence: the only text read is HTT from the author's page (`math.ias.edu/~lurie/papers/HTT.pdf`, version of 9 April 2017), classified author-page; about 725 of 728 locators point to it.
- Pin: the build needs main's Tau Ceti pin moved from 2fd255d to a commit with the seven imported modules; that change lies outside this pull request.
