# Review of AccessibleInfinityCategories (pull request #2270 at 7e04598)
Folder: `TauCetiRoadmap/InfinityCategoryTheory/AccessibleInfinityCategories/`
**Verdict:** needs changes

Previous review (at 04df60e): R01 not repaired (below, R01); R02 not repaired (below, R02); R03 repaired (`README.md` lines 208, 305, 317, 1249, 1355, 1374 now cite §4.1 or Tau Ceti `SSet.slice.homEquiv`, `SSet.coslice.homEquiv`); R04 partly repaired (15 of 21 names; below, R06).

## R01 (P1) — `Suggested.lean` does not build at the pinned Tau Ceti

**Location:** `TauCetiRoadmap/InfinityCategoryTheory/AccessibleInfinityCategories/Suggested.lean` lines 9, 11, 13, 15, 16, 17; `README.md` lines 172–183, "At the pinned Tau Ceti, in `TauCeti/AlgebraicTopology/`".

**Claim:** Six imported modules do not exist at the pinned Tau Ceti (2fd255d), so the targeted build fails; the README still lists `SSet.LeftFibration`, `SSet.RightFibration`, `SSet.catInfty`, `SSet.slice.IsLimit`, `SSet.coslice.IsColimit`, `SSet.QCat.IsCategoricalEquivalence` as pinned.

**Witness:** Gate at 7e04598: `imports=6`, `build exited 1`, "bad import 'TauCeti.AlgebraicTopology.Quasicategory.CategoricalEquivalence'" and five more. `lake-manifest.json` pins `2fd255d997…`; the pinned `Quasicategory/` holds only `Cartesian`, `Core`, `FullSubcategory`, `LocallySmall`, `RightMappingSpace`.

**Repair:** Either wait for the repository's Tau Ceti pin (on main, its own change) to reach a commit with the six modules, merge main and re-run the gate; or, to pass at 2fd255d, reduce the file to a docstring naming every statement as not statable with its missing module, and retitle README lines 172–183 so that the six names are listed as carriers not at the pin.

## R02 (P2) — κ-accessible ∞-categories and accessible functors already have an owner on main

**Location:** `README.md` lines 54–55: "κ-accessible and accessible ∞-categories and accessible functors here, in §4.1"; §4.1.1 and §4.1.2 (lines 680, 705).

**Claim:** EnhancedDerivedSheaves on main owns the same three notions, and neither Scope and ownership nor the family index names it (zero occurrences of "EnhancedDerivedSheaves" in either file).

**Witness:** `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` (main) lines 390–392, E0.8: provides `IsKappaAccessible`, `IsAccessible`, `IsAccessibleFunctor` (HTT Def. 5.4.2.1, Prop. 5.4.2.2). Open LocallyPresentableCategories, `README.md` line 84, already cites E0.8 for them.

**Repair:** Add to Scope and ownership: "κ-accessible and accessible quasicategories and accessible functors are defined in EnhancedDerivedSheaves E0.8, for a locally small C, by generation under κ-filtered colimits from a small full subcategory of κ-compact objects (HTT, Prop. 5.4.2.2 (3)). §4.1.1 states the `Ind_κ` form of HTT, Def. 5.4.2.1, which E0.8 does not; §5.1.1 proves that the two agree; the accessible functors of §4.1.2 are those of E0.8." In §4.1.2 replace "Define a functor … to be accessible when" by a citation of E0.8, keeping its bullets and Checks.

## R03 (P2) — §4.5.3 has no statement

**Location:** `README.md` line 826: "**4.5.3.** Fix uncountable regular κ < τ and a τ-small ∞-category C … with Yoneda embedding `j : C → P(C)`. the retract statement and its corollary (HTT, Prop. 5.4.3.4 and Cor. 5.4.3.5, p. 448)."

**Claim:** The target states nothing: X and K in its route are undefined, and "the second step" (line 827) and "the first step" (line 817) point at a list that no longer exists. §5.3.1 consumes §4.5.3.

**Witness:** htt lines 20276–20281 and 20296–20299: the two statements are "a colimit of `j ∘ p` over a τ-filtered K is a retract of a representable" and "`j : C → Ind_τ(C)` is an idempotent completion".

**Repair:** Replace the first sentence pair of §4.5.3 by: "Prove that, for uncountable regular κ < τ, a τ-small ∞-category C whose mapping spaces are essentially κ-small, with Yoneda embedding `j : C → P(C)`, and a diagram `p : K → C` indexed by a τ-filtered ∞-category, every colimit X of `j ∘ p` in `P(C)` is a retract of `j(c)` for some object c of C (HTT, Prop. 5.4.3.4, p. 448), and that consequently `j : C → Ind_τ(C)` exhibits `Ind_τ(C)` as an idempotent completion of C (HTT, Cor. 5.4.3.5, p. 448)." In its route write "by §4.5.2"; in §4.5.2 write "apply §4.5.1".

## R04 (P3) — citations that point at the wrong labelled target

**Location:** `README.md` *Needs* lines, listed in the repair; for example line 652: "§3.1.1 (HTT, Def. 5.4.1.3; Prop. 5.4.1.2, (1) ⇒ (2), (5) ⇒ (1) and the invariance step)".

**Claim:** By the Conventions a label is one target; these lines attach to one label results that another label (here or in a supplier Part) states.

**Witness:** `README.md` line 549: (1) ⇒ (2) is §3.1.3; line 590: the invariance step is §3.1.6. ModelCategoryTheory, Part ModelCategories at its open head: §3.5.1 defines homotopy pushout squares, §3.5.3 homotopy pullback squares.

**Repair:** Repoint, keeping the HTT locators:
- line 652 (§3.3.1): §3.1.1, §3.1.3, §3.1.4, §3.1.6; line 744 (§4.2.1): the same four; line 774: §4.2.1 and §4.2.2;
- lines 1014, 1035, 1458, 1478, 1508, 1537, 1672, 1689, 1770: "§4.1.1 (Def. 5.4.2.1) and §4.1.2 (Def. 5.4.2.5)";
- lines 1030, 1383: add §5.2.3 for Rem. 5.4.2.11; lines 1454–1455: add §5.2.4 for Rem. 5.4.2.13;
- line 1369: §6.4.2 and §6.4.6; line 1438: §6.4.1 and §6.4.3–§6.4.5; line 1455: §6.4.1 and §6.4.6;
- lines 384, 1075, 1342, 1441, 1457, 1536, 1687: Part ModelCategories §3.5.3 (homotopy pullback squares), not §3.5.1;
- lines 415, 1763: Cor. 5.1.2.3 is Part LimitsAndKanExtensions §8.2.3; line 557: Prop. 2.2.4.1 is Part InfinityCategoryFoundations §8.1.1; line 790: Lemmas 5.1.5.2–5.1.5.3 are Part PresheavesAndCompletions §1.3.3–§1.3.4; line 854: Prop. 5.3.5.5 is its §6.4.3; lines 206, 923: Def. 5.3.5.1 is its §6.1.2; line 1133: Prop. 4.2.1.2 is Part LimitsAndKanExtensions §1.1.2; line 1589: Prop. 4.3.1.10 is its §7.3.2.

## R05 (P3) — the declaration of §6.4.2 is named under §6.4.1

**Location:** `README.md` lines 1218–1219, in §6.4.1: "The `Suggested.lean` declaration is `isCardinalCofinal_coslice_π`."

**Claim:** §6.4.1 is the definition; `isCardinalCofinal_coslice_π` states §6.4.2, which names no declaration.

**Witness:** `Suggested.lean` line 200: "README §6.4.2. For a τ-filtered ∞-category `I` and a τ-small diagram `p : K ⟶ I`, the projection `I_{p/} ⟶ I` is τ-cofinal."

**Repair:** Delete the sentence at lines 1218–1219 and append it to §6.4.2 after "hence weakly cofinal." (line 1255).

## R06 (P3) — six declarations of `Suggested.lean` are not named in the README

**Location:** `README.md`, Scope and ownership and §6.5.2; `Suggested.lean` lines 89, 95, 102, 108, 118, 249.

**Claim:** README and Lean must agree in both directions.

**Witness:** Zero occurrences in `README.md` of `` `IsCategoricalEquivalence` ``, `` `categoricalEquivalences` ``, `` `categoricalFibrations` ``, `` `sectionsRestrict` ``, `` `IsCofinal` `` and of this Part's `HasCardinalFilteredColimits` (its three occurrences are Mathlib's class).

**Repair:** In Scope and ownership add: "`Suggested.lean` repeats, with the same bodies, `IsCategoricalEquivalence`, `categoricalEquivalences` (Part InfinityCategoryFoundations §2.1.6) and `categoricalFibrations` (its §9.4.1), and `sectionsRestrict` and `IsCofinal` (Part LimitsAndKanExtensions §2.1.1)." In §6.5.2 add: "'Admits small τ-filtered colimits' is the `Suggested.lean` definition `HasCardinalFilteredColimits`."

## R07 (P3) — stray file `NOTES.md`

**Location:** `TauCetiRoadmap/InfinityCategoryTheory/AccessibleInfinityCategories/NOTES.md` (47 lines, added since 04df60e).

**Claim:** A roadmap folder holds only `README.md`, `Suggested.lean`, `metadata.toml` and nested roadmaps.

**Witness:** Gate: `stray-files=1`, "NOTES.md: not a roadmap file".

**Repair:** Delete it; sources are the README's references.

## R08 (P3) — six code spans are broken across lines

**Location:** `README.md` lines 1215–1216, 1264–1265, 1277–1278, 1290–1291, 1295–1296, 1346–1347, for example "`p : K →" at the end of line 1215 and "I`" at the start of 1216.

**Claim:** A code span split by a line break leaves `I_{p/}`, `J_{fp/}`, `C_{p'/}` outside code spans for the scanner.

**Witness:** Gate: `tex=12`, lines 1216, 1265, 1278, 1291, 1296, 1347.

**Repair:** Re-wrap the six paragraphs so that `p : K → I`, `p : K → J`, `K' → I_{p/}` and `p' : K' → C` each sit on one line.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1.1 (HTT 5.4.5.3) | K = ∅; A ⊆ B monic categorical equivalence | K = ∅: map is p itself; lifting against `K ⋆ A ⊆ K ⋆ B` as htt 20543–20547 | agrees, htt line 20540, p. 454; Lean binders equal README | none |
| §3.2.1 (HTT 5.4.1.5) | circle; discrete set of ℵ₁ points | π₁ = ℤ countable: essentially ℵ₁-small; π₀ has ℵ₁ elements: not | agrees, htt lines 19908–19922, p. 439; (6) read with the same κ | none |
| §3.3.1 (HTT 5.4.1.4) | C = ∅; `C × D → D` | ∅ has 0 simplices; product: fewer than κ·κ = κ classes | agrees, htt line 19885, p. 439 | R04 |
| §4.1.1, §4.1.2 (HTT 5.4.2.1, 5.4.2.5) | `Δ[0] ⊔ Δ[0]`; `X ↦ X^ℕ` | Ind of two points: presheaves (pt, ∅), (∅, pt); `ℕ^ℕ ≠ ⋃ F^ℕ`, so not ω-continuous | agrees, htt lines 19988, 20063, pp. 441, 443 | R02 |
| §4.3.1 (HTT 5.3.5.12) | C = `Δ[0]` | `P(C) = S`, `P^κ` = κ-compact spaces | agrees, htt line 19302, p. 426 | R04 |
| §4.4.1 (HTT 5.4.2.4) | f.g. free modules | compact objects of Ind = f.g. projectives = retracts of free | agrees, htt line 20018, p. 442 | none |
| §4.5.1–§4.5.3 (HTT 5.4.3.1–5.4.3.5) | statements compared | 5.4.3.1–3 match lines 800, 814; 5.4.3.4–5 not stated at line 826 | htt lines 20188, 20231, 20249, 20276, 20296, pp. 446–448 | R03 |
| §4.6.1 (HTT 5.3.5.15) | A = point; A = `{0 < 1}` | identity of `Ind_κ(C)`; morphisms are κ-filtered colimits of morphisms of C | agrees, htt line 19399, Warning at 19406, p. 428 | none |
| §5.4.1 (HTT 5.4.7.7) | left adjoint; right adjoint | left: all colimits; right: `Map(j(D), G −) ≃ Map(F j(D), −)`, τ-continuous as `F j(D)` τ-compact | agrees, htt lines 21266–21292, p. 469 | R04 |
| §6.1.1, §6.1.2 (HTT 5.4.4.1–2) | hypotheses compared | (i)–(iv) of htt 20359–20364 all present; κ < τ, κ ≪ τ present | agrees, pp. 449–450 | none |
| §6.4.1 definitions (HTT 5.4.5.8) | `{0} ⊆ ℕ`; object of `Idem` | no edge `n → 0`: not weakly cofinal; `g ∘ e = 1` has no solution in {1, e}: not κ-cofinal | agrees, htt line 20687, p. 457; Lean edge is `j ⟶ f i` | R05 |
| §6.4.2–§6.4.4 (HTT 5.4.5.9, 5.4.6.4, 5.4.5.11 (2)) | K = ∅; lifting of an edge with both ends fixed | K = ∅: identity; trivial fibrations lift against `∂Δ[1] ⊆ Δ[1]`, so weak cofinality transfers | agree, htt lines 20692, 21027, 20761; τ-filteredness unused in the routes | none |
| §6.4.5 (HTT 5.4.5.11 (1)) | κ = ℵ₁, τ = ω, I = J = `N(ℕ)`, f = p = id; p finite | p = id: no cone, `I_{p/} = ∅`, not filtered; p finite with max m: `N(ℕ_{≥m})`, filtered | README's τ-small hypothesis right, source's κ-small wrong | none |
| §6.4.6 (HTT 5.4.5.12) | evens ⊆ ℕ | `I ×_J J_{n/}` = evens ≥ n, filtered, weakly contractible | agrees; Lean takes `aleph0`-filtered I, J | none |
| §6.5.2 (HTT 5.4.5.14) | K = ∅; K not τ-small | `coslice p ≅ C`; cone on τ-small `L → K ⋆ I` with vertex in I ≠ ∅ | agrees, htt line 20826, p. 460 | R06 |
| §8.1.1 (HA 5.2.2.36) | C = ∅ | (a): all morphisms of `D_v` invertible; (b): final object; hence contractible | agrees, ha lines 31630–31641, p. 835 | none |
| §8.2.1 (HA 5.2.2.37) | hypotheses compared | (1)–(4) of ha 31696–31704 all present | agrees, p. 836 | none |
| §8.4.1 (HA 4.8.1.1) | 𝒦 = ∅; {∅} | `Cat∞`; `Δ[0] → N([1])` at 1 excluded, at 0 included | agrees, ha line 26968, p. 707 | none |
| §8.7.1 (HTT 5.4.7.15) | statement compared | sections = homotopy limit of `C → Fun({0}, D) ← Fun(Δ[1], D)` | agrees, htt line 21367, p. 471 | none |
| Headline §5.1.1 (HTT 5.4.2.2) | `Δ[0] ⊔ Δ[0]`; large discrete nerve | first: (2) holds with `C^ω` = C; second: `C^κ` = C not essentially small | consistent with §4.1.1 Checks | R02, R04 |
| Headline §5.2.2 (HTT 5.4.2.9) | ω ≪ τ; ℵ₁ ≪ ℵ₁ | `τ₀^n < τ`; `ℵ₀^ℵ₀ ≥ ℵ₁` fails | Mathlib `of_pow_lt` hypothesis `β ^ α < κ₂` equals ≪ with κ₁ < κ₂ | none |
| Headline §5.3.1 (HTT 5.4.3.6) | `Δ[0]`; monoid {1, e} | idempotent complete; no r, s with `rs = 1`, `sr = e` | consistent | R03 |
| Headline §7.1.4 (HTT 5.4.6.6) | `Y = Δ[0]` | returns `X × Y'`, the binary case of §6.3 | consistent | R04 |
| §7.3.1 Check 3 | sets with ≥ 2 elements, constant chain on a 2-element set | cocones ↔ points of Y; `|Hom(L, Y)| ≥ 2² = 4 ≠ 2` | Check holds | none |
| Lean `IsEssentiallySmall`, `isLocallySmall_iff_forall_isEssentiallySmall` | S = ∅; universes v = u | ∅ essentially small; v = u: both sides hold for every C (κ = successor of `max(#C.N, ℵ₀)`) | no false instance (read, not elaborated) | R01 |

- Source locators checked against the text: 32 (28 in htt, 4 in ha), statement and page, all agree; the 15 sampled targets are among them.
- Library declarations opened at the pins: 9 Mathlib (`Cardinal.SharplyLT.of_pow_lt` at `Presentable/SharplyLT/Lemmas.lean:62`, `uniformization` at `Presentable/Uniformization.lean:127`, `HasCardinalFilteredGenerator` at `CardinalFilteredPresentation.lean:170`, `IsCardinalAccessibleCategory` at `LocallyPresentable.lean:50`); 19 Tau Ceti names, 12 present (`SSet.IsCardinalFiltered` at `SimplicialSet/CardinalFiltered.lean:63`, `SSet.coslice.homEquiv` at `SimplicialSet/Coslice.lean:119`, `SSet.IsLocallySmall` at `Quasicategory/LocallySmall.lean:66`), 7 absent (R01, and `SSet.coslice.map`).
- Cross-roadmap citations resolved: 151 distinct citations of the six sibling Parts and 13 labels of ModelCategoryTheory Parts ModelCategories, KanQuillen, SimplicialCategories at their open head; every label exists; 8 mis-pointed (R04).
- Gate: FAIL (`imports=6`, `build=13`, `stray-files=1`, `tex=12`; every other check 0). Dependency check: `depcheck: 244 roadmaps, 2197 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the family folder.
- Elaboration: not possible at the pin (R01); the `#check` comparison and the one-tactic probe were not run. By reading: no declaration restates a definition, mirrors a Check or treats a boundary case; the five repeated definitions have the bodies of `InfinityCategoryFoundations/Suggested.lean` lines 187–193, 721–722 and `LimitsAndKanExtensions/Suggested.lean` lines 113–124.
- Headlines: all eight groups of the README need κ-compact objects, `Ind_κ`, accessible ∞-categories, `Cat∞` as a quasicategory or categorical pullback squares; the module docstring names each with its missing carrier.
- Pull request text: no sentence contradicts this folder's head (20.2k words; the pin paragraph matches R01).
- Overlap check: read ModelCategories, EnrichedLocalization, KanQuillen, SimplicialCategories, LocallyPresentableCategories (open), EnhancedDerivedSheaves, BordismFormalGroups (main); κ-accessible and accessible ∞-categories and accessible functors shared with EnhancedDerivedSheaves E0.8, owner EnhancedDerivedSheaves (R02); the others are 1-categorical or model-categorical and share nothing.
- Source independence: 12 passages compared with 2 sources, none shared beyond definitions and hypothesis lists the mathematics forces; largest share htt, 697 of 706 locators; contents compared with htt: independent (Layers 1–2 draw on §5.4.5 and §5.3.4 ahead of §5.4.1; §5.4.7 is spread over Layers 5–8; the order is forced by the *Needs* of §2.1.1 on §1.3.1 and of §6.5.1 on §1.3.1 and §2.1.1).

## Not verifiable

- Elaborated types of the 21 declarations: the file does not elaborate at the pinned Tau Ceti (R01); signatures were compared with the README by reading.
- The `Quasicategory` instance on `fiber p d` in `isEssentiallyCardinalSmall_of_cartesianFibration`: `TauCeti.AlgebraicTopology.SimplicialSet.Fiber` is absent at the pin.
- SAG, proof of Lemma 4.5.3.1 (§3.1.5): not in the sample and not opened this round.
- AR94 (Adámek–Rosický, Thm. 2.11): Cambridge University Press, no legal open copy found; cited for comparison only.
- Ownership against board packages not yet in a pull request: only the two in the board index were considered.

## Source issues

- **Error** in htt at Lemma 5.4.5.11 (1), PDF p. 458: the source says the pullback `I ×_J J_{p/}` is τ-filtered for a κ-small diagram p; it should be assume p τ-small (false for κ = ℵ₁, τ = ω, identity of `N(ℕ)`); affects a stated result.
- **Misprint** in htt at Cor. 5.4.1.5 (6), PDF p. 440: the source says essentially small; it should be essentially κ-small; affects nothing.

## For the human reviewers

- Pin: the build needs the repository's Tau Ceti pin moved from 2fd255d to a commit with the six modules of R01; that change is outside this folder.
- Ownership: the description asks the maintainers to choose between this family and EnhancedDerivedSheaves E0.8 (main, `README.md` lines 390–392) as owner of accessibility; R02 applies the standing rule.
- Sources: 697 of 706 locators are to htt, the author-page PDF of a book published by Princeton University Press; ha and SAG are author-page PDFs, SAG unpublished.
