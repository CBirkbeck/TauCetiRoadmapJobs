# Review of AccessibleInfinityCategories (pull request #2270 at a6d7928)
Folder: `TauCetiRoadmap/InfinityCategoryTheory/AccessibleInfinityCategories/`
**Verdict:** needs changes

Previous review (at 7e04598): R01 not repaired (below, R01); R02 not repaired (below, R02; neither `README.md` nor the family index names EnhancedDerivedSheaves); R03 repaired (`README.md` line 856 now states both results: "there is an object c of C with X a retract of `j(c)`, and … exhibits `Ind_τ(C)` as an idempotent completion of C"); R04 partly repaired (every repointing made except the homotopy pullback squares, six lines; below, R03); R05 repaired (lines 1290–1291, in §6.4.2); R06 repaired (lines 82–84 and 1388–1389); R07 repaired (`NOTES.md` deleted); R08 repaired (gate `tex=0`).

## R01 (P1) — `Suggested.lean` does not build at the pinned Tau Ceti

**Location:** `TauCetiRoadmap/InfinityCategoryTheory/AccessibleInfinityCategories/Suggested.lean` lines 9, 11, 13, 15, 16, 17; `README.md` lines 176–187, "At the pinned Tau Ceti, in `TauCeti/AlgebraicTopology/`".

**Claim:** Six imported modules do not exist at the pinned Tau Ceti (2fd255d), so the targeted build fails; the README lists `SSet.LeftFibration`, `SSet.RightFibration`, `SSet.catInfty`, `SSet.slice.IsLimit`, `SSet.coslice.IsColimit`, `SSet.QCat.IsCategoricalEquivalence` as pinned.

**Witness:** Gate at a6d7928: `imports=6`, `build exited 1`, "bad import 'TauCeti.AlgebraicTopology.Quasicategory.CategoricalEquivalence'" and five more. The pinned `Quasicategory/` holds only `Cartesian`, `Core`, `FullSubcategory`, `LocallySmall`, `RightMappingSpace`; `SimplicialSet/Coslice.lean` has no `coslice.map`.

**Repair:** Either wait for the repository's Tau Ceti pin (on main, its own change) to reach a commit with the six modules, merge main and re-run the gate; or, to pass at 2fd255d, reduce the file to a docstring naming every statement as not statable with its missing module, and retitle README lines 176–187 so that the six names are listed as carriers not at the pin.

## R02 (P2) — κ-accessible ∞-categories and accessible functors already have an owner on main

**Location:** `README.md` lines 54–55: "κ-accessible and accessible ∞-categories and accessible functors here, in §4.1"; §4.1.1 and §4.1.2 (lines 704, 729).

**Claim:** EnhancedDerivedSheaves on main owns the same three notions, and neither Scope and ownership nor the family index names it (zero occurrences of "EnhancedDerivedSheaves" in either file). A roadmap on main is earlier than every open one.

**Witness:** `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` (main, 59c8654) lines 390–392, E0.8: provides `IsKappaAccessible`, `IsAccessible`, `IsAccessibleFunctor` (HTT Def. 5.4.2.1, Prop. 5.4.2.2).

**Repair:** Add to Scope and ownership: "κ-accessible and accessible quasicategories and accessible functors are defined in EnhancedDerivedSheaves E0.8, for a locally small C, by generation under κ-filtered colimits from a small full subcategory of κ-compact objects (HTT, Prop. 5.4.2.2 (3)). §4.1.1 states the `Ind_κ` form of HTT, Def. 5.4.2.1, which E0.8 does not; §5.1.1 proves that the two agree; the accessible functors of §4.1.2 are those of E0.8." In §4.1.2 replace "Define a functor … to be accessible when" by a citation of E0.8, keeping its bullets and Checks.

## R03 (P3) — citations that point at the wrong target, and names missing from the contracts

**Location:** `README.md` lines 388, 1378, 1486, 1518, 1599, 1755: "ModelCategoryTheory, Part ModelCategories §3.5.1 (HTT, §A.2.4, p. 833)"; lines 1611–1612; line 212; lines 176–191.

**Claim:** These six *Needs* lines use homotopy pullback (categorical pullback) squares but cite the target that defines homotopy pushout squares; one citation has no section; the contracts attribute to a Part what the *Needs* take from Tau Ceti.

**Witness:** ModelCategories at its open head: "**3.5.1.** Define a cofibrant resolution of a span … homotopy pushout square"; "**3.5.3.** Define homotopy pullback squares dually". `README.md` line 1110 already cites §3.5.3.

**Repair:** In the six lines write "Part ModelCategories §3.5.3 (homotopy pullback squares, the dual of HTT, §A.2.4, p. 833)". Line 1611: "Part ModelCategories §5.4.2". Line 212: delete "the join–slice correspondence (§4.1, HTT, Prop. 1.2.9.2, p. 60);" and add `SSet.slice.homEquiv`, `SSet.coslice.homEquiv` and `TauCeti.MarkedSSet` (used at lines 309 and 1770) to "From Tau Ceti".

## R04 (P3) — a claim about Mathlib's `Functor.IsAccessible` that the pin contradicts

**Location:** `README.md` lines 731–732, §4.1.2: "Mathlib's `CategoryTheory.Functor.IsAccessible` asks for accessible categories on both sides."

**Claim:** At the pinned Mathlib the class has no hypothesis on source or target; like HTT's definition it constrains neither to be accessible.

**Witness:** `Mathlib/CategoryTheory/Presentable/Basic.lean` line 111: `class IsAccessible (F : C ⥤ D) : Prop where exists_cardinal : ∃ (κ : Cardinal.{w}) (_ : Fact κ.IsRegular), IsCardinalAccessible F κ`, for arbitrary categories C and D.

**Repair:** Replace the sentence by: "Mathlib's `CategoryTheory.Functor.IsAccessible` likewise asks only that the functor preserve κ-filtered colimits for some regular κ, with no accessibility hypothesis on either category."

## R05 (P3) — two docstrings of `Suggested.lean` disagree with the README or carry a process remark

**Location:** `Suggested.lean` line 160: "README §3.1.4, conditions (3) and (4)."; lines 70–71: "Whether a faithful headline can be written from Mathlib's poset and colimit API has not been tried;".

**Claim:** The equivalence (3) ⇔ (4) is README §3.1.3 (§3.1.4 is the case κ = ω). The second sentence is process narrative and leaves statability undecided; a docstring names the missing carrier or the statement is made.

**Witness:** `README.md` lines 559–560: "`Suggested.lean` declaration `isEssentiallyCardinalSmall_iff_exists_isCategoricalEquivalence` states (3) ⇔ (4)", inside **3.1.3**; line 619: "**3.1.4.** Prove the case κ = ω".

**Repair:** Line 160: "README §3.1.3, conditions (3) and (4)." Lines 65–71: end the bullet at "which nothing in Mathlib, Tau Ceti or this file provides as a predicate;" and delete the last sentence (§4.5.1 is not among the README's headline theorems, so nothing is owed in its place).

## R06 (P3) — an object and its ∞-category share a letter in six statements

**Location:** `README.md` lines 1251 ("for every object J of J there are an object I of I and a morphism `J → f(I)`"), 1258, 1350, 1445 ("an object C of C, the induced functor `C^τ_{/C} → D^τ_{/f(C)}`"), 1462, 1077–1078.

**Claim:** Without the source's calligraphic letters the statements are ambiguous: in `C^τ_{/C}`, `I_{I/}`, `I ×_J J_{J/}` and `Map(j(C), D)` the same letter is the ∞-category and one of its objects.

**Witness:** Line 1076–1078: "a τ-small ∞-category C and an object D of `Ind_κ(C)`, D is τ-compact exactly when every mapping space `Map(j(C), D)` is essentially τ-small": `j(C)` is `j` applied to an object, C is the ∞-category.

**Repair:** Use lower-case letters for objects: line 1251 "for every object y of J there are an object x of I and a morphism `y → f(x)`"; line 1258 `I_{x/} → J_{f(x)/}`; line 1350 `I ×_J J_{y/}`; line 1445 "an object c of C … `C^τ_{/c} → D^τ_{/f(c)}`"; line 1462 "objects x of X and `x'` of `X'` with `p(x)` and `p'(x')` equivalent"; lines 1077–1085 `Map(j(c), D)` "for every object c of C".

## R07 (P3) — the route of §6.2.1 uses a cardinal κ it never introduces

**Location:** `README.md` line 1214, §6.2.1: "Route: choose τ ≫ κ with C τ-accessible (§5.2) and K τ-small."

**Claim:** κ is not in the statement and is not chosen; §6.1.2, which the route applies, needs κ < τ, κ ≪ τ and fibers with τ-small κ-filtered colimits, so κ must be one for which C has small κ-filtered colimits.

**Witness:** htt lines 20450–20452 (proof of Prop. 5.4.4.3, p. 452): κ is first chosen with small κ-filtered colimits in C, then τ with τ ≫ κ, τ > κ, K τ-small and C τ-accessible. `README.md` line 1177: "Let κ < τ be regular with κ ≪ τ".

**Repair:** "Route: choose a regular κ for which C has small κ-filtered colimits, then a regular τ > κ with κ ≪ τ, C τ-accessible (§5.2.2) and K τ-small."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1.1 (HTT 5.4.5.3) | K = ∅; A ⊆ B monic categorical equivalence | K = ∅: the map is p; lifting against `K ⋆ A ⊆ K ⋆ B` | agrees, htt line 20540, p. 454; Lean binders equal README | none |
| §1.3.1 (HTT 5.4.5.7, 5.4.5.6) | `Y = Δ[0]`; hypotheses compared | product `X × Y'`; (2) asks compact images in X, `Y'` and Y, as README | agrees, htt lines 20590, 20627–20644, pp. 455–456 | R03 |
| §2.1.1 (HTT 5.3.4.13) | K = `∂Δ[1]`; K = ∅ | `Fun(K, C) = C × C`, pair of compact objects compact; K = ∅: `Δ[0]`, its object compact | agrees, htt line 18931, p. 417 | none |
| §2.2.1, §2.2.2 (HTT 5.3.4.14–15) | circle = pushout of `Δ[0] ← ∂Δ[1] → Δ[0]`; ℕ in S | circle ω-compact; ℕ not (identity factors through no finite stage) | agrees, htt lines 18996, 19010, p. 419 | none |
| §3.3.1 (HTT 5.4.1.4) | C = ∅; `C × D → D` | 0 simplices; fewer than κ·κ = κ classes | agrees, htt line 19885, p. 439 | none |
| §3.1.4 (SAG, proof of 4.5.3.1) | n = 0; K finite | core commutes with filtered colimits; `Fun(K, colim D_i) = colim Fun(K, D_i)` for finite K | agrees, sag line 14591, p. 403 | none |
| §4.1.2 Checks | `X ↦ X × X`; `X ↦ X^ℕ`; power set | 4 summands ≠ 2; `ℕ^ℕ ≠ ⋃ F^ℕ`; `X ∈ P(X)` in no stage | Checks hold; the Mathlib sentence does not | R04 |
| §4.2.1, §4.2.2 (HTT 5.4.1.7–8) | S = ∅; universes u > v and u < v in the Lean | ∅ essentially small; u > v: both sides always true; u < v: HTT's statement | agrees, htt lines 19967, 19977, p. 441 | none |
| §4.3.1 (HTT 5.3.5.12) | C = `Δ[0]` | `P(C) = S`, `P^κ` = κ-compact spaces | agrees, htt line 19302, p. 426 | none |
| §4.4.1 (HTT 5.4.2.4) | f.g. free modules | compact objects of Ind = f.g. projectives = retracts of free | agrees, htt line 20018, p. 442 | none |
| §4.5.1–§4.5.3 (HTT 5.4.3.1–5) | hypotheses compared | κ < τ uncountable regular, A τ-filtered, values essentially κ-small, in all five | agrees, htt lines 20188, 20231, 20249, 20276, 20296, pp. 446–448 | R05 |
| §5.2.1 (HTT 5.4.2.8) | κ = κ' = ω; I only κ-filtered | finite set plus upper bound has a top; Mathlib `isCardinalFiltered_subtype` assumes `IsCardinalFiltered J κ₁` only | README's κ-filtered form is the one the application needs | none |
| §5.2.2–§5.2.4 (HTT 5.4.2.9, .11, .13) | ω ≪ τ; ℵ₁ ≪ ℵ₁ | `τ₀^n < τ`; `ℵ₀^ℵ₀ ≥ ℵ₁` fails; `of_pow_lt` hypothesis `β ^ α < κ₂` equals ≪ | agrees, htt lines 20093, 20111, 20119, p. 444 | none |
| §5.4.1 (HTT 5.4.7.7) | right adjoint G, τ-filtered diagram | `Map(d, colim G x_i) ≃ colim Map(Fd, x_i) ≃ Map(d, G colim x_i)` for d κ-compact, Fd τ-compact | agrees, htt line 21266, p. 469 | none |
| §5.5.1–§5.5.3 (HTT 5.4.7.4–6) | hypotheses compared | τ ≫ κ, τ uncountable, C τ-small; `C^κ` essentially τ-small | agrees, htt lines 21218, 21222, 21246, p. 468 | R06 |
| §6.2.1 (HTT 5.4.4.3) | K = `∂Δ[1]`, C = S | `S × S`, accessible also by §6.3 | agrees, htt line 20447, p. 452; κ of the route not chosen | R07 |
| §6.3.1 (HTT 5.4.7.1–2) | A = two points | `Fun(A, C₁ ⊔ C₂)` has 4 summands; the identity summand is `C₁ × C₂` | agrees, htt lines 21178, 21182, p. 467 | none |
| §6.4.1 definitions (HTT 5.4.5.8) | `{0} ⊆ ℕ`; object of `Idem`; terminal object | no edge `n → 0`; `g ∘ e = 1` unsolvable in {1, e}; extension to terminal vertex exists | agrees, htt line 20687, p. 457; Lean edge is `j ⟶ f i` | R06 |
| §6.4.2–§6.4.4 (HTT 5.4.5.9, 5.4.6.4, 5.4.5.11 (2)) | `K' = ∂Δ[1]`, `K = Δ[0]` | fibre of `C_{q/} → C_{q|K'/}` is a space of homotopies, not contractible: weak contractibility of `K'` is needed and assumed | agree, htt lines 20692, 21027, 20761 | none |
| §6.4.5 (HTT 5.4.5.11 (1)) | κ = ℵ₁, τ = ω, I = J = `N(ℕ)`, f = p = id; `Λ[2,0] ⊆ Δ[2]` step | `I_{p/} = ∅`, not filtered; `K' ⋆ Λ[2,0] ∪ Δ[2] ⊆ K' ⋆ Δ[2]` inner anodyne | README's τ-small hypothesis right, source's κ-small wrong | none |
| §6.4.6 (HTT 5.4.5.12) | evens ⊆ ℕ | `I ×_J J_{n/}` = evens ≥ n, filtered | agrees, htt line 20793, p. 459 | R06 |
| §6.5.1–§6.5.4 (HTT 5.4.5.13–16) | K = ∅; `K ⋆ I` with I τ-filtered | `coslice p ≅ C`; cone on τ-small `L → K ⋆ I` with vertex in I ≠ ∅ | agree, htt lines 20799, 20826, 20834, 20875, pp. 459–461 | none |
| §7.1.1–§7.1.4 (HTT 5.4.6.1, .3, .5, .6) | `Y = Δ[0]`; hypotheses compared | `X × Y'`; τ ≫ κ in 5.4.6.1, τ > κ in 5.4.6.3 and 5.4.6.5, as README | agree, htt lines 20895, 20955, 21043, 21086 | R03, R06 |
| §7.3.1 Check 3 | chain of constant maps on a 2-element set | cocones ↔ points of Y; `|Hom(L, Y)| ≥ 2² = 4 ≠ 2` | Check holds | none |
| §8.3.1 (HA 5.2.2.39) | K = ∅ | (1): f-initial object over `p(∞)`; (2): `χ(p(∞))` contractible | agrees, ha line 31734, p. 837, with its (3) | none |
| §8.4.1, §8.5.1 (HA 4.8.1.1; HTT 5.4.2.14) | 𝒦 = {∅}; constant functor at κ points | `Δ[0] → N([1])` at 1 excluded; κ-continuous, value not κ-compact | agree, ha line 26968, p. 707; htt line 20135, p. 445 | none |
| Headline §5.1.1 (HTT 5.4.2.2) | `Δ[0] ⊔ Δ[0]`; large discrete nerve | (2) holds with `C^ω = C`; `C^κ = C` not essentially small | agrees, htt line 19995, pp. 441–442 | R02 |
| Headline §5.3.1 (HTT 5.4.3.6) | `Δ[0]`; monoid {1, e} | idempotent complete; no r, s with `rs = 1`, `sr = e` | agrees, htt line 20306, p. 449 | none |
| Headline §4.6.1 (HTT 5.3.5.15) | A = point; A = `{0 < 1}` | identity of `Ind_κ(C)`; morphisms are κ-filtered colimits of morphisms of C | agrees, htt line 19399, p. 428 | none |
| Headlines §8.6.1, §8.9.1 (HTT 5.4.7.3, 5.4.7.17) | S = `Δ[0]`; S a small set | one accessible ∞-category; §6.3 | agree, htt lines 21194, 21477, pp. 467, 474 | none |
| Headlines §8.1.1, §8.2.1 (HA 5.2.2.36–37) | C = ∅ | (a): all morphisms of `D_v` invertible; (b): final object; contractible | agree, ha lines 31630, 31694, pp. 835–836 | none |
| Lean `HasCardinalFilteredColimits`, `hasCardinalFilteredColimits_coslice` | K = ∅; I = ∅ | `coslice p ≅ C`; ∅ is not τ-filtered (no extension of `∅ → ∅` to `Δ[0]`), so no vacuous diagram | no false instance (read, not elaborated) | R01 |

- Source locators checked against the text: 62 (57 in htt, 4 in ha, 1 in sag), statement, hypotheses and page; all agree; the 15 sampled targets are among them. The README flags no locator as unverified.
- Library declarations opened at the pins: 16 Mathlib, all present (`Cardinal.SharplyLT.of_pow_lt` at `Presentable/SharplyLT/Lemmas.lean:62`, `exists_isCardinalFiltered_set` at `SharplyLT/Basic.lean:570`, `isCardinalFiltered_subtype` at `:464`, `Functor.IsAccessible` at `Presentable/Basic.lean:111`, `SSet.opFunctor` at `SimplicialSet/Op.lean:44`); 20 Tau Ceti names, 13 present (`SSet.IsCardinalFiltered` at `SimplicialSet/CardinalFiltered.lean:63`, `SSet.coslice.homEquiv` at `Coslice.lean:119`, `SSet.coslice.π` at `:189`, `SSet.IsLocallySmall` at `Quasicategory/LocallySmall.lean:66`), 7 absent (R01).
- Cross-roadmap citations resolved: 161 distinct labelled citations of the six sibling Parts and of ModelCategoryTheory Parts ModelCategories, KanQuillen, SimplicialCategories at their open head; every label exists; 115 carry a source locator that the cited target's text contains; 6 mis-pointed and 1 without a section (R03).
- Gate: FAIL (`imports=6`, `build=13`; every other check 0). Dependency check: `depcheck: 261 roadmaps, 2594 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the family folder.
- Elaboration: not possible at the pin (R01); the `#check` comparison and the one-tactic probe were not run. By reading: no declaration restates a definition, mirrors a Check or treats a boundary case; the five repeated definitions have the bodies of `InfinityCategoryFoundations/Suggested.lean` lines 117–120, 650–651 and `LimitsAndKanExtensions/Suggested.lean` lines 113–124, each in its own namespace.
- Headlines: the eight groups of the README need κ-compact objects, `Ind_κ`, accessible ∞-categories, `Cat∞` as a quasicategory or categorical pullback squares; the module docstring names each with its missing carrier. Pull request text: no sentence contradicts this folder's head (21.4k words; the pin paragraph matches R01).
- Overlap check: read ModelCategories, KanQuillen, EnrichedLocalization, SimplicialCategories, LocallyPresentableCategories (open), EnhancedDerivedSheaves, BordismFormalGroups, StableHomotopyKTheory (main); κ-accessible and accessible ∞-categories and accessible functors shared with EnhancedDerivedSheaves E0.8, owner EnhancedDerivedSheaves (R02); the others are 1-categorical or model-categorical and share nothing.
- Source independence: 14 passages compared with 3 sources, none shared beyond definitions and hypothesis lists the mathematics forces; largest share htt, 744 of 754 locators; contents compared with htt: independent (Layers 1–2 draw on §5.4.5 and §5.3.4 ahead of §5.4.1; §5.4.7 is spread over Layers 5–8; the order is forced by the *Needs* of §2.1.1 on §1.3.1 and of §6.5.1 on §1.3.1 and §2.1.1).
- Research link: Layers 4–7 are the accessibility theory that Lurie, *Higher Topos Theory* (2009), §5.5 builds presentable ∞-categories and the adjoint functor theorem on; Layer 8 states the limit criteria of Lurie, *Higher Algebra* (2017), §5.2.2; rests on the README's sources and the texts read.

## Not verifiable

- Elaborated types of the 21 declarations: the file does not elaborate at the pinned Tau Ceti (R01); signatures were compared with the README by reading.
- The `Quasicategory` instance on `fiber p d`, and `QCat.IsCategoricalEquivalence` against the repeated `IsCategoricalEquivalence` in `isEssentiallyCardinalSmall_iff_exists_isCategoricalEquivalence`: both modules are absent at the pin.
- Kerodon, Thm. 3.2.6.1 (§3.3.1, through Part KanQuillen §1.2.3): not opened; the label and its title were resolved.
- AR94 (Adámek–Rosický, Thm. 2.11): Cambridge University Press, no legal open copy found; cited for comparison only.
- Ownership against board packages not yet in a pull request: only the two in the board index were considered.

## Source issues

- **Error** in htt at Lemma 5.4.5.11 (1), PDF p. 458: the source says the pullback `I ×_J J_{p/}` is τ-filtered for a κ-small diagram p; it should be assume p τ-small (false for κ = ℵ₁, τ = ω, identity of `N(ℕ)`); affects a stated result.
- **Gap** in htt at Lemma 5.4.2.8, PDF p. 443: the source says the poset is κ′-filtered; it should be κ-filtered, which is what its proof uses and what the proof of Prop. 5.4.2.9 applies it to; affects the proof.
- **Misprint** in htt at Cor. 5.4.1.5 (6), PDF p. 440: the source says essentially small; it should be essentially κ-small; affects nothing.
- **Misprint** in htt at Example 5.4.1.8, PDF p. 441: the source says the functor ∞-category is essentially small; it should be locally small, as its last sentences conclude; affects nothing.
- **Misprint** in htt at Lemma 5.4.5.13, PDF p. 459: the source says the diagram lands in the τ-compact objects; it should be the κ-compact objects; affects nothing.
- **Misprint** in htt at Lemma 5.4.6.1, proof, PDF p. 461: the source says the test diagram is τ-small; it should be κ-small, as the definition of κ-cofinal asks; affects nothing.
- **Misprint** in htt at Lemma 5.4.5.12, proof, PDF p. 459: the source says the fibre product is κ-filtered; it should be filtered, the case τ = ω of Lemma 5.4.5.11; affects nothing.
- **Misprint** in htt at Prop. 5.4.6.6, PDF p. 465: the source says a functor from C to X; it should be to the pullback `X′`; affects nothing.

## For the human reviewers

- Pin: the build needs the repository's Tau Ceti pin moved from 2fd255d to a commit with the six modules of R01 (the description names 8b9f13d993); that change is outside this folder.
- Ownership: the description asks the maintainers to choose between this family and EnhancedDerivedSheaves E0.8 (main, `README.md` lines 390–392) as owner of accessibility; R02 applies the standing rule that the roadmap on main is cited.
- Sources: 744 of 754 locators are to htt, the author-page PDF of a book published by Princeton University Press; ha and sag are author-page PDFs, sag unpublished.
