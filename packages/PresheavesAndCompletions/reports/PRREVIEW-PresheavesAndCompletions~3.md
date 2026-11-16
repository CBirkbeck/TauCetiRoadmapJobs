# Review of PresheavesAndCompletions (pull request #2270 at a6d7928)
Folder: `TauCetiRoadmap/InfinityCategoryTheory/PresheavesAndCompletions/`
**Verdict:** needs changes

## R01 (P1) — `Suggested.lean` does not build at the pins (previous R01: not repaired)

**Location:** `TauCetiRoadmap/InfinityCategoryTheory/PresheavesAndCompletions/Suggested.lean` lines 4–8, 10, 11; `README.md` lines 161–193 ("From Tau Ceti") and line 1913.
**Claim:** Seven imported `TauCeti.*` modules exist at the pinned Tau Ceti, and so do `SSet.coslice.IsColimit`, `SSet.slice.IsLimit`, `SSet.IsFullyFaithful`, `SSet.LeftFibration`, `SSet.RightFibration`, `SSet.IsWeakHomotopyEquivalence`, `SSet.catInfty`, `SSet.QCat.IsCategoricalEquivalence`, `SSet.IsTerminalVertex`, `SSet.ihomOver`, `SSet.ihomObj₀Equiv`, `SSet.rightAnodyneExtensions_pushoutObjObjι'`, `SSet.Truncated.HomotopyCategory₂.equivalence`.
**Witness:** Gate at this head: `imports=7`, `build=15`, exit 1. Pin 2fd255d (also main's pin): `TauCeti/AlgebraicTopology/Quasicategory/` holds only `Cartesian`, `Core`, `FullSubcategory`, `LocallySmall`, `RightMappingSpace`; none of the thirteen names is declared there.
**Repair:** Rebase once main's Tau Ceti pin contains the seven modules; or delete the seven imports and every declaration using them, list each under "Not statable at the pins" with its missing carrier, and mark the thirteen names in "From Tau Ceti" as not at the pin.

## R02 (P2) — objects owned here are owned by two roadmaps on main (previous R02: not repaired)

**Location:** `README.md` lines 34–54 (`## Scope and ownership`), which names neither roadmap.
**Claim:** This Part owns Yoneda's lemma (§1.3.1), idempotent completions (§3.2.1, §3.3.2), sifted simplicial sets (§5.1.1, §5.3.1, §5.3.2), `Ind_κ` with its universal property (§6.1.2, §6.5.3) and the comparison with Mathlib's `Ind` (§6.4.5).
**Witness:** Main: `TauCetiRoadmap/BordismFormalGroups/README.md` lines 2197–2204 (F6.5: presheaves, Yoneda, `Ind_κ`, its universal property); `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` lines 1544 (`idemCompletion`), 1613 (`indOrdinaryComparison`), 1902 (`IsSiftedInfinity`).
**Repair:** Add to `## Scope and ownership` a bullet citing BordismFormalGroups §F6.5 and EnhancedDerivedSheaves E5:abstract, E5:presentability.1, E5:animation.1 as owners and narrow the listed targets to what those sections do not state; or first land on main the revision of those two roadmaps that hands these targets over, with its old → new mapping.

## R03 (P3) — one `*Needs:*` line still cites a sibling section without its Part (previous R05: partly repaired)

**Location:** `README.md` line 1207 (§4.5.3): "Tau Ceti `SSet.slice.homEquiv`, `SSet.coslice.homEquiv` (HTT, Prop. 1.2.9.2) and §4.3.1 (HTT, Cor. 2.1.2.2)".
**Claim:** A bare `§x.y.z` is a target of this Part (Conventions, lines 60–62).
**Witness:** This Part's §4.3.1 is HTT Example 5.3.1.9 (line 1134); Cor. 2.1.2.2 is Part InfinityCategoryFoundations §4.3.1 (its README lines 1146–1147). Lines 1512 and 1724 are repaired.
**Repair:** "… (HTT, Prop. 1.2.9.2) and Part InfinityCategoryFoundations §4.3.1 (HTT, Cor. 2.1.2.2)".

## R04 (P3) — §6.2.1 still cites the homotopy-pushout target for homotopy pullbacks (previous R06: partly repaired)

**Location:** `README.md` line 1641 (§6.2.1): "ModelCategoryTheory, Part ModelCategories §3.4.1 (HTT, Def. A.2.4.1) and §3.5.1 (HTT, §A.2.4, homotopy pullbacks)".
**Claim:** Part ModelCategories §3.5.1 supplies homotopy pullback squares.
**Witness:** At the head of the ModelCategoryTheory pull request, ModelCategories §3.5.1 is "Define a cofibrant resolution of a span" (homotopy pushouts); §3.5.3 is "Define homotopy pullback squares dually". Lines 719 and 1695 are repaired.
**Repair:** "… and §3.5.3 (homotopy pullbacks, the dual of HTT, §A.2.4)", as in §1.6.4 and §6.3.1.

## R05 (P3) — the lists of restated definitions do not match the files

**Location:** `README.md` lines 197–202: "restates, with the same names and bodies … `categoricalFibrations` (Part InfinityCategoryFoundations §9.4.1) and `IsLimitDiagram` (Part InfinityCategoryFoundations §1.2.4)"; `Suggested.lean` lines 37–40.
**Claim:** `IsLimitDiagram` repeats a declaration of Part InfinityCategoryFoundations; the two lists name every restated definition.
**Witness:** `InfinityCategoryFoundations/Suggested.lean` line 95 declares `IsColimitDiagram` and no `IsLimitDiagram`. The README list omits `IsColimitDiagram` and `IsRetract`; the docstring list omits `IsCategoricalEquivalence`, `categoricalEquivalences`, `categoricalFibrations`.
**Repair:** README: "… `categoricalFibrations` (§9.4.1) and `IsColimitDiagram` (§1.2.4); … It also states `IsLimitDiagram`, `IsRelativeColimit` and `IsRetract`, after Part InfinityCategoryFoundations §1.2.4, Part LimitsAndKanExtensions §7.1.1 and Part AdjunctionsAndLocalizations §2.1.2, whose files do not declare them." Make the docstring paragraph say the same.

## R06 (P3) — §6.4.6 is three targets under one label and one `*Needs:*` line

**Location:** `README.md` lines 1878–1884: "This is a large target: its three parts have separate routes and separate suppliers, and HTT states none of them, so there is no locator to divide it along and they stay one statement."
**Claim:** One labeled statement is one target (Conventions, lines 60–62), with a `*Needs:*` line listing what its statement and route need.
**Witness:** `Suggested.lean` states (1) and (2) as separate theorems (lines 576, 585) and (3) not at all; the single `*Needs:*` (lines 1972–1988) puts (1), whose route uses none of them, behind §1.1.2, §6.1.1 and §6.4.5.
**Repair:** Delete the quoted sentence. Split into §6.4.6 (1), §6.4.7 (2), §6.4.8 (3), each "(implicit in HTT, Remark 5.3.5.6, p. 423)" with its own `*Needs:*`: (1) the Mathlib `IsCardinalFiltered` lemmas, Part InfinityCategoryFoundations §2.1.5, §2.3.1, §2.6.3, Part LimitsAndKanExtensions §1.4.2, §4.1.1; (2) adds §6.4.6, Part LimitsAndKanExtensions §1.4.1; (3) adds §6.4.7, §1.1.2, §6.1.1, §6.4.5, Part LimitsAndKanExtensions §3.2.1, §3.3.1, Part InfinityCategoryFoundations §7.1.2, §10.6.1, §10.6.5. Repoint `PrestableInfinityCategories/README.md` line 927 to §6.4.8.

## R07 (P3) — the statement of §3.1.2 is interrupted by its declaration sentence

**Location:** `README.md` lines 960–962: "pass to slices (HTT, Lemma 5.1.4.3, p. 340; Lemma 5.1.4.4, p. 340): The `Suggested.lean` declarations are `IsIdempotentComplete.slice`, …"; lines 1170–1171 (§4.5.1).
**Claim:** Each target reads as a statement with its hypotheses in the sentence.
**Witness:** The colon of line 961 introduces the two bullets of lines 964–966, not the declaration sentence. §4.5.1 gives "`Suggested.lean` declaration: `IsCardinalRightExact`. The `Suggested.lean` declarations are `IsCardinalRightExact.comp` and `IsCardinalRightExact.of_iso`."
**Repair:** §3.1.2: end line 961 with the colon and move the declaration sentence after line 966. §4.5.1: "`Suggested.lean` declarations: `IsCardinalRightExact`, and for the first two API bullets `IsCardinalRightExact.comp` and `IsCardinalRightExact.of_iso`."

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1.1, §1.1.2 Yoneda embedding, corepresented functors (HTT §5.1.3, §5.1.6) | `K = Δ[1]`, `Δ[2]` | `j(0) = (pt, ∅)`, `j(1) = (pt, pt)`; `j_1(0) = ∅`, `j_0(1) = pt`; `Map_{C[Δ[2]]}(0, 2) = Δ[1]`, not Kan | Checks hold | none |
| §1.3.1 Yoneda (headline; Prop. 5.1.3.1, p. 338) | `K = Δ[1]` | `Map(j1, j0) = ∅ = Map_K(1, 0)`; `Map(j0, j1) = pt = Map_K(0, 1)` | holds; not statable, named | none |
| §1.4.1, §1.4.3 free cocompletion (headline; 5.1.5.1, 5.1.5.6, pp. 342, 345) | `S = ∅`, `C = N([1])`; `C = Δ[0] ⊔ Δ[0]` | left: initial objects, `{0}`, resp. `∅`; right: `Fun(∅, C) = Δ[0]`; second `C` has no colimits | holds; cocompleteness needed; not statable, named | none |
| §1.4.4, §1.4.5 (Def. 5.1.5.7, Cor. 5.1.5.8) | lattice `⊥ < a, b < c < ⊤`; `A = ∅` in `S` | `a ∨ b = c ∉ {⊥, a, b, ⊤}`; generated subcategory `{∅}` | Checks hold | none |
| §1.6.1, §1.6.5 completely compact (Def. 5.1.6.2, Prop. 5.1.6.8, pp. 346, 349) | `S = ∂Δ[1]`; `S = ∅`; `∗ ⊔ ∗` in `S` | `(∗, ∅)`, `(∅, ∗)` compact; `Map((∗,∗), −) = X × Y`; `P(∅) = Δ[0]`: `j_∗(∅-colimit) = pt ≠ ∅` | agrees with Example 5.1.6.9 | none |
| §1.6.2 and Lean `isColimitDiagram_of_isRetract` (Lemmas 5.1.6.3–4, p. 347) | `K = ∅`, `C = N([1])` | `q = 0` initial; retracts of `0` in `Fun(Δ[0], C)`: only `0` | holds | none |
| §2.1.1 and Lean `idemPlus`, `ret` (Def. 4.4.5.2, p. 322) | Karoubi envelope of `{1, 0}`, elaborated at the pin | hom-sets `{1, 0}`, `{0}`, `{0}`, `{0}`; `i ≫ r = 𝟙 Y` by `rfl`; `(r ≫ i).f = 0 = e` | agrees | none |
| §2.1.2 idempotent completeness (§5.1.4, p. 339) | `Δ[1]`, `∂Δ[1]`, free `ℤ × ℤ`-modules | constant idempotents: colimit the object; `(1, 0)`: image `ℤ × 0` not free | Checks hold | none |
| §2.2.1, §2.2.2 (Def. 4.4.5.4, Prop. 4.4.5.6, Lemma 4.4.5.8, pp. 322–323) | horn `X ⟶ Y ⟶ X` | `Ret`: edges `i`, `r`, no `e`, no filler; `Idem⁺`: filler with long edge `e` | holds | none |
| §2.3.1, §2.3.2 (4.4.5.12, 4.4.5.14–15, pp. 325–326) | `N(Set)`, `X = {a, b}`, `e` constant `a` | colimit `X/(x ∼ e x) = {a}`; limit `Fix(e) = {a}`; extension `Y = {a}` | three conditions agree | none |
| §2.4.1 (Prop. 4.4.5.17, p. 326) and Lean | `A = ∅`; `A = {0}`; `A = ℕ` | `∅`: fibre empty; `{0}`: colimit `X ≠ im e`; `ℕ`: `colim = {a} = im e` | `Nonempty`, `NoMaxOrder` both needed, both in Lean | none |
| §3.1.1, §3.1.2 (Def. 5.1.4.1, Lemmas 5.1.4.3–4, pp. 339–340) | `Δ[0] ⊔ Δ[0] ⟶ Δ[0]`; Yoneda into `Set`-presheaves | `Map(a, b) = ∅` against `pt`; non-retract presheaves exist | each clause needed | R07 |
| §3.2.1 (Prop. 5.1.4.2, p. 339) and Lean | `C = N(B{1, e})` | completion: 2 objects, 5 morphisms; `D` in `SSet.{u+1}`, source `uliftFunctor.obj C` | holds | none |
| §3.3.2 uniqueness (headline; Prop. 5.1.4.9, p. 341) | `E = N(Set)`; `E = C = N(B{1, e})` | `(X, e) ↦ (X, im e)` essentially bijective; `id_C` has no extension to `N(R)` | holds; `hE` needed, in Lean | none |
| §4.1.1 (Def. 5.3.1.7, Remark 5.3.1.17, pp. 400, 404) | `∅`; `Λ[2,1] ⋆ Δ[0]`; `N(ℤ/2)` | no vertex; extension `f ⋆ id` then collapse, but no filler of `0 ⟶ 1 ⟶ 2`; `σ = 1` forced | Checks hold | none |
| §4.2.1 (Remarks 5.3.1.11–12, p. 401) and Lean | κ = 0 (first theorem); `A` finite, κ = ω | κ = 0: no `K`, both sides true; second theorem carries `κ.IsRegular` | holds | none |
| §4.2.2 (Lemma 5.3.1.14, p. 401) | `n = 0, 1` on `∅`, `∂Δ[1]` | `n = 0`: no vertex in `∅`; `n = 1`: no cone on the two points | holds | none |
| §4.3.2 filtered ⇒ weakly contractible (headline; Lemma 5.3.1.20, p. 406) | `∂Δ[1]`, `N(ℤ/2)` | 2 components; `π₁ = ℤ/2`; neither filtered | holds; stated | none |
| §4.5.1–§4.5.3 (Def. 5.3.2.1, Props. 5.3.2.5, 5.3.2.9, pp. 407–410) | `Δ[0] ⟶ C` circle; `∂Δ[1] ⟶ Δ[0]` | fibre `Map(c, c) = ℤ`, not filtered; pullback `∂Δ[1]`, not filtered, yet existing colimits preserved | converse needs `hA`; in Lean | R03 |
| §5.1.1 (Def. 5.5.8.1, p. 524) | `∅`, `∂Δ[1]`, `Δ^op` | diagonal of `∅` iso, excluded; 2 components to 4; `d⁰`, `d¹` composites constant 1 and 0 | holds | none |
| §5.2.1 (Lemma 5.5.2.3, p. 481) and Lean | `X = Y = ∅`; `X = ∅`, `Y` any | hypothesis and both conclusions: `p(∞₀, ∞)` `q`-initial; colimit over `Y` of `q`-initial objects | holds | none |
| §5.3.4 sifted ⇒ weakly contractible (headline; Prop. 5.5.8.7, p. 525) | `∂Δ[1]`; parallel pair | `π₀`: 2 to 4; `π₁`: `ℤ ⟶ ℤ²` | neither sifted; stated | none |
| §5.3.5–§5.3.6 (headline; Lemma 5.5.8.11, Remark 5.5.8.12, p. 526) | parallel pair, constant point | colimit `S¹`; product of colimits `T²`; colimit of product `S¹` | fails off sifted shapes; not statable, named | none |
| §6.1.1, §6.1.2 (Defs. 5.3.4.5, 5.3.5.1, pp. 414, 421) | `N(ℕ ∪ {∞})`; `C = Δ[0]`, `∅`, `∂Δ[1]` | `colim_n Map(∞, n) = ∅`, `Map(∞, ∞) = pt`; `Ind`: contractible spaces, `∅`, two representables | Checks hold | none |
| §6.2.1 (Prop. 5.3.3.3, proof, p. 413) | supplier target | ModelCategories §3.5.1: spans, pushouts; §3.5.3: homotopy pullbacks | wrong target | R04 |
| §6.2.2 (headline; Prop. 5.3.3.3, p. 412) | `I = ∂Δ[1]`; `I = ∅` | `(X ⊔ Y) × (X′ ⊔ Y′)`: 4 summands against 2; empty limit `pt ↦ ∅` | fails off filtered `I`; not statable, named | none |
| §6.3.1, §6.3.2 (Lemmas 5.3.4.8–12, pp. 414–416) | κ = ω, `∏_ℕ S`, object `(∗, ∗, …)` | `Map = ∏ X_n`, not finitary: "κ-small family" and "κ uncountable" needed; both stated | holds | none |
| §6.4.5 (Remark 5.3.5.6, p. 423) | `P = ℕ`; `C = Δ[0]`; `A = BG` | ideals `ℕ ∪ {∞}`; `P(Δ[0]) = S` not an n-category; `Ind A ≃ A`, universes `u + 1`, `u` | holds | none |
| §6.4.6 and Lean (1), (2) | `J = B(ℤ/2)`, κ = ω | `N(J)` not ω-small yet `J` finite: route through `isCardinalFiltered_iff`, both sides false | holds | R06 |
| §6.5.3 universal property (headline; Prop. 5.3.5.10, p. 424) | `C = Δ[0]`; `C = ∅` | `Ind = Δ[0]`, continuous functors `= D = Fun(Δ[0], D)`; `Ind(∅) = ∅`, both sides `Δ[0]` | holds; not statable, named | none |
| Restated supplier definitions | bodies against the sibling `Suggested.lean` files | 7 names identical in LimitsAndKanExtensions, 4 in InfinityCategoryFoundations; `IsLimitDiagram` absent there | agree; lists wrong | R05 |

- Previous findings: R03 (stray file), R04 (Lean names; all 69 now backticked at their targets), R07 (`Fun^colim` in the Check of §1.4.1), R08 (docstring) repaired; R05, R06 partly (R03, R04 above); R01, R02 not repaired.
- Source locators: all 116 HTT label-and-page locators matched to the PDF pages; statements of the fifteen sampled sections read at HTT lines 14405–14440, 14489–14492, 14557–14648, 14655–14686, 15243–15260, 15266–15365, 15381–15383, 15522–15548, 15572–15586, 15626–15654, 15716–15720, 15751–15797, 18190–18237, 18499–18541, 18610–18661, 18705–18718, 18801–18815, 18832–18835, 18855–18860, 18894–18905, 21824–21847, 23744–23756; also 5.2.6.2–7, 5.3.1.18–22, 5.3.5.3–14, 5.4.5.10, 5.4.6.2, 5.5.8.6–13, 4.4.5.20–21.
- Library declarations opened at the pins: `SSet.IsCardinalFiltered` (`CardinalFiltered.lean` 63), `isCardinalFiltered_nerve_iff` (164, preorders only), `SSet.IsWeaklyContractible` (`WeaklyContractible.lean` 99), `SSet.rlp_monomorphisms_iff` (`TrivialFibration.lean` 171), `isCardinalFiltered_iff` (`Presentable/IsCardinalFiltered.lean` 295), `IsCardinalFiltered.multicoequalizer` (334), `isCardinalFiltered_aleph0_iff` (171), `Ind.yonedaCompInclusion` (`Indization/Category.lean` 117), `isIndObject_iff` (`IndObject.lean` 185); 81 backticked library names searched, 13 absent (R01).
- Cross-roadmap citations: none unresolved in the worker's list; about 25 sibling and ModelCategoryTheory targets opened and compared with what they are cited for; one wrong target (R04), one without its Part (R03). QuasicoherentSheavesOnPrestacks cites §1.4.3 of this Part, which states what it is cited for.
- Dependency check: `depcheck: 261 roadmaps, 2595 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside `TauCetiRoadmap/InfinityCategoryTheory/`.
- Gate: fails on `imports=7`, `build=15` (R01); every other check is 0. Partial elaboration at the pin of the declarations that need no missing module (`IdemMonoid` to `ret`, `IsFiltered`, and the statements of §2.2.2, §4.2.1, §4.2.2, §4.3.1, §4.3.2, §6.4.6 (1)): they elaborate, and none closes with `simp`, `rfl`, `infer_instance` or `exact isCardinalFiltered_nerve_iff`. The other signatures were compared with the README by reading; no padding found.
- Pull request text: the sentences about this folder (25.6k words, supplier ModelCategoryTheory, pin 2fd255d, headlines not statable) agree with the head.
- Overlap check: read KanQuillen, EnrichedLocalization, SimplicialCategories, ModelCategories, ModelCategoryTheory (open), EnhancedDerivedSheaves, BordismFormalGroups, StableHomotopyKTheory (main); Yoneda, `Ind_κ` and its universal property: BordismFormalGroups §F6.5; idempotent completion, sifted ∞-categories, the `Ind` comparison: EnhancedDerivedSheaves (R02); EnrichedLocalization §2.4.3 owns homotopy sifted 1-categories, a different object; nothing shared with the others.
- Source independence: 30 passages compared with 1 source, none shared beyond statements the mathematics forces (longest common run 7 words, HTT line 15547 against §1.4.5); largest share HTT, about 760 of 765 locators; contents compared with HTT: independent (Layers 1–6 draw on §5.1.1–5.1.3 with §5.1.5–5.1.6 and §5.2.6, §4.4.5, §5.1.4, §5.3.1–5.3.2, §5.5.8 with §5.5.2, §5.4.5–6 and §A.2.9, §5.3.3–5.3.5 with §4.4.5; Layer 4 before Layer 6 is forced by §6.1.2, §6.2.2 and §6.3.1 needing §4.1.1 and §4.4.1).
- Research link: the headline targets are the presheaf, idempotent-completion, filtered, sifted and Ind results of Lurie, *Higher Topos Theory* (2009), §4.4.5, §5.1, §5.3, §5.5.8, prerequisites of accessible and presentable ∞-categories there and in the later Parts; rests on the README and HTT.

## Not verifiable

- Elaboration of the whole `Suggested.lean`, its elaborated signatures and the one-tactic probe of the declarations that use the seven absent modules.
- The description's claim that the files elaborate against Tau Ceti 8b9f13d993: that commit is not the pin.
- Kerodon, Prop. 3.1.7.9 (cited in §5.3 through Part KanQuillen §3.6.1): not opened.
- HTT locators given by label without a page, outside the sections listed above: label only, text not read.
- Ownership against open pull requests other than those found by searching for the HTT numbers of the seven headlines and the closest-roadmap lists: not checked.

## Source issues

- **Misprint** in HTT at Definition 4.4.5.2, PDF p. 322: the source says `Idem⁺` is the nerve of a category `J` and `Idem` a full subcategory of `Idem`; it should be the nerve of `R` and a full subcategory of `Idem⁺`; affects nothing.
- **Gap** in HTT at Proposition 4.4.5.17, PDF p. 326: the source says the map from the nerve of any linearly ordered set without largest element is cofinal; it should assume the set nonempty, since the empty nerve is not weakly contractible; affects a stated result.
- **Misprint** in HTT at Counterexample 4.4.5.19, PDF p. 327: the source says the map from `BG` to the sequential colimit would have a left homotopy inverse; it should be a right homotopy inverse, which gives surjectivity on fundamental groups; affects nothing.
- **Error** in HTT at Lemma 5.3.2.6, PDF p. 410: the source says the fiber of a Cartesian fibration with filtered total space over an initial object is a contractible Kan complex; it should be weakly contractible, and Kan only for right fibrations (`Δ[1] ⟶ Δ[0]`); affects a stated result.
- **Misprint** in HTT at Proposition 5.3.3.3, proof, PDF p. 412: the source says the cofinal map from the nerve of the filtered poset goes to the ∞-category of spaces; it should go to the index ∞-category `I`; affects nothing.

## For the human reviewers

- Ownership: the description asks maintainers to choose between this family and BordismFormalGroups §F6.5, EnhancedDerivedSheaves (both on main) and the GeneralizedCohomology revision of pull request #1807 as owner of presheaves, Yoneda, `Ind` and sifted colimits (R02).
- Licence: the only text read is HTT from the author's page (version of 9 April 2017), classified author-page; about 760 of 765 README locators point to it, and most proof routes are labelled "Lurie's".
- Pin: the build needs main's Tau Ceti pin moved from 2fd255d to a commit with the seven imported modules; that change lies outside this pull request, and this is the third review with the same P1.
