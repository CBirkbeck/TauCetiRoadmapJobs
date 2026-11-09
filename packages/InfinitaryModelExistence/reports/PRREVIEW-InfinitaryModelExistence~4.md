# Review of InfinitaryModelExistence (pull request #1615 at 786457c)

**Verdict:** needs changes

Full review. The folder changed by 897 lines since `bf6203d`. The pull request's own diff against main touches only `TauCetiRoadmap/InfinitaryModelExistence/README.md` and `TauCetiRoadmap/InfinitaryModelExistence/Suggested.lean`; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/InfinitaryModelExistence'` prints nothing. `PROGRESS.md` and `STATUS.md` arrived with the merge of main.

The gate fails with `set_option=1 tex=1 residue=3 readme-ids-missing=5`. Build, imports and depcheck pass. The previous review's blocking finding is repaired: `Suggested.lean` now imports Tau Ceti modules that exist at the pin, and it elaborates. No statement is false. One P2 finding remains, the `set_option`, which the principles list as blocking. The P3 findings are padding (27 restatements of pinned Tau Ceti theorems), a Layer 8 route that the README still makes mandatory although the pinned implementation proves the theorems another way, a dated claim about an unpinned Tau Ceti revision, and the inherited locator, shape, TeX and residue items.

## R01 (P2) — `set_option` in the acceptance file

**Location:** `TauCetiRoadmap/InfinitaryModelExistence/Suggested.lean:52`, "set_option autoImplicit false".

**Claim:** `Suggested.lean` contains no `set_option`. The principles list a `set_option` as a blocking finding.

**Witness:** gate `set_option=1`, "line 52: set_option autoImplicit false". Every declaration binds its variables explicitly or through `variable` lines, so the override changes nothing that elaborates.

**Repair:** delete line 52. Every universe is declared at line 54 and every variable is bound, so nothing depends on it. Tested together with R02's trimming: the scratch copy without the line exits 0 with only `sorry` warnings. Previous review: R04, not repaired.

## R02 (P3) — 27 declarations restate pinned Tau Ceti theorems, plus one definitional unfolding

**Location:** `TauCetiRoadmap/InfinitaryModelExistence/Suggested.lean:70–541`, e.g. line 74, "g.realize_onBoundedFormulaInf φ v xs"; lines 290–298, `fragmentType` and `AElementary.fragmentType_comp`; module docstring lines 37–47; `README.md:1016–1019`, "proves its statement of each listed theorem by the Tau Ceti theorem".

**Claim:** `Suggested.lean` states the headline theorems that the finished roadmap still has to prove.

**Witness:** each of these 27 theorems is proved by one pinned Tau Ceti theorem, applied directly or after an `obtain`/`rw [max_assoc]` reshuffle:
- `realize_onBoundedFormulaInf`, `relationsIn_countable`, `realize_congr_of_agreeOn`, `exists_eq_onBoundedFormulaInf_of_subset_range`, `realize_substBounds`, `onBoundedFormulaInf_substBounds`, `realize_smallPresentation`;
- `Theoryω.entails_iff_not_isSatisfiable`, `Fragment.generated_countable`;
- `exists_aElementary_substructure`, `exists_countable_aElementary_substructure`, `aElementary_iSup`, `Theoryω.exists_countable_model`, `Theoryω.entails_iff_countable`, `Theoryω.Entails.realize`;
- `model_existence`, `model_existence_omitting`, `exists_isolatingFormula`;
- `countable_relations_morleyize`, `isExpansionOn_morleyExpansion`, `nonempty_morleyEquiv_iff`;
- `relSym_inter`, `exists_relationalize`, `realize_backTranslate`;
- `exists_model_relChain_rat`, `wellOrder_type_boundedness`, `wellOrdering_undefinable`.

In a scratch copy, `AElementary.fragmentType_comp` closes with the single term `Set.ext fun φ => and_congr_right fun h => hf φ h a`. That is Tau Ceti's `AElementary` (`ModelExistence/AElementary.lean:66`) unfolded, and `lake env lean` exits 0. `fragmentType` is used by nothing else.

**Repair:**
- **Delete from `Suggested.lean`:** the 27 theorems, `AElementary.fragmentType_comp` and `fragmentType`, and the now unused imports. The README keeps every statement as a target. The "Tau Ceti implementation" table already names the Tau Ceti declaration of each, with the differences.
- **What stays:** `OmitsFOType`, `IsolatesFO`, `relationsInSigned` and `universalSigned`, which make the headlines statable, and the eight `sorry` headlines (`Theoryω.exists_countable_model_omitting`, `exists_countable_model_omitting_fo`, `exists_firstOrder_presentation`, `craig_interpolation_relational`, `craig_interpolation`, `pcSeparation`, `lyndon_interpolation`, `malitz_interpolation`). The imports they need are `Mathlib` and `TauCeti.ModelTheory.{Infinitary.Symbols, Infinitary.FormationClosed, ModelExistence.Isolation, ModelExistence.Morleyization, Interpolation.PCClass}`.
- **Tested:** a scratch copy with exactly these declarations, these imports and no `set_option` (the R01 repair) exits 0 under `lake env lean`, with 8 `sorry` warnings and nothing else.
- **Module docstring:** title it "Infinitary model existence, omitting types and interpolation: target signatures". Say that model existence and the Layer 8 theorems are proved in Tau Ceti at the pin and are therefore not restated.
- **`README.md:1016–1019`:** change the sentence to say that `Suggested.lean` states only the targets the pin lacks.
- **Gate:** re-run it after the deletion. An API bullet whose name was mentioned only by a deleted proof may become a `readme-ids-missing` hit. Treat each such hit as in R05.

Previous review: R10, not repaired (it covered two declarations; it now covers 28).

## R03 (P3) — Layer 8 still requires a relational core and the graph translation, which the pinned implementation shows are unnecessary

**Location:** `README.md:804–809`, "the relational cores (`exists_model_relChain_rat_relational` and its consequences) are named milestones … Layer 6 to remove function symbols". Also lines 33–35, 66 (L8 consumes L6), 605–609 ("a proof device for the theorems of Layers 7 and 8"), 925–926 (completion chain "… the rational chain → graph translation → boundedness …"), 863 ("The closed terms of the relational `L[[ℕ]]` are its constants"), and `Suggested.lean:34–35`.

**Claim:** the Layer 8 theorems are reached through a relational core transferred by Layer 6, and the completion criteria require that this chain "must be visible".

**Witness:** the README's own table at line 1031 records that Layer 8 is "proved for arbitrary languages directly, with no relational core stated".
- Tau Ceti `WellOrdering.lean:69` says that no graph translation is needed, because model existence handles closed terms through its naming clause.
- `WellOrdering.lean:627–634` applies `ConsistencyProperty.model_existence` directly over `L[[ℕ]]` with function symbols.

So the completion criterion at lines 925–926 cannot be met by the existing implementation, and the house rule says a route is never mandatory.

**Repair:**
- **Lines 804–809:** state the Layer 8 theorems for arbitrary `L`. Present the relational core plus graph translation as one route, and the direct route, with closed terms named by `eq_name`, as the other. Drop "named milestones": the relational core is now `exists_model_relChain_rat` under `[L.IsRelational]`, a specialization.
- **Line 863:** say that the closed terms are constants on the relational route.
- **Line 66:** list L0–L3 as the L8 consumption.
- **Lines 607–609:** call Layer 6 a proof device for Layer 7.
- **Lines 925–926:** read "the gap-and-reserve consistency property → model existence → the rational chain → boundedness → undefinability".
- **Lines 33–35 and `Suggested.lean:34–35`:** say that the interpolation theorems are proved for relational languages and transferred.

## R04 (P3) — A dated claim about an unpinned Tau Ceti revision

**Location:** `README.md:1038–1041`, "Tau Ceti main at `d2083f0` (2026-11-08) implements all of them except the three first-order omitting-types items, Lyndon and Malitz."

**Claim:** Tau Ceti implements Craig, `pcSeparation` and the omitting types theorem in `Interpolation/Craig.lean`, with a different `pcSeparation` hypothesis.

**Witness:** at the pin `2fd255d`, `TauCeti/ModelTheory/Interpolation/` holds only `PCClass.lean`. The pinned `TauCeti/ModelTheory` contains no `interpolat` or `omitting` declaration, only comments (`grep` over the tree). The sentence can only be checked against a revision that the repository does not pin. It carries a date, and it goes stale at the next pin bump. Roadmaps are timeless.

**Repair:** delete the sentence from "Tau Ceti main at" to "rather than in `Type`." Keep the preceding list of targets that the pin lacks: I checked all 14, and they are absent at `2fd255d`. When the pin advances, the implementation table records the new declarations and any signature difference, such as a hypothesis over countable structures in an arbitrary universe.

## R05 (P3) — Seven backticked names presented as this roadmap's own are declared nowhere under that name

**Location:**
- `README.md:263`, "`realize_conjunction_iff`";
- line 559, "`realize_unMorleyize`";
- line 114, "`realize_scottSentence_iff`";
- line 639, "`realize_relationalize_reconstruct`";
- line 743, "`realize_mono_of_signed`";
- line 307, "`Fragment.NegationClosed`";
- line 769, "`IsUniversal.realize_of_embedding`".

**Claim:** each backticked name of this roadmap's own is declared in `Suggested.lean`.

**Witness:** the gate reports `readme-ids-missing=5` (the first five names). The citation resolver finds the last two nowhere at the pins. At the pin:
- `Theoryω.realize_conjunction_iff` is at `Infinitary/Theory.lean:148`.
- `BoundedFormulaInf.realize_unMorleyize` is at `ModelExistence/Morleyization.lean:384`.
- `TauCeti.realize_scottSentence_iff` is at `Scott/Isomorphism.lean:62`.
- The reconstruction law is named `BoundedFormulaInf.realize_relationalize_reconstructStructure` (`GraphTranslation/Reconstruct.lean:294`).
- The other three exist nowhere.

**Repair:**
- **Lines 263 and 559:** state the fact in prose without the name. Add `Theoryω.realize_conjunction_iff` to the L1 row and `BoundedFormulaInf.realize_unMorleyize` to the L5 row of the Tau Ceti implementation table.
- **Line 114:** write `TauCeti.realize_scottSentence_iff`, since the line is a supplier row.
- **Line 639:** use the pinned name.
- **Lines 743, 307 and 769:** state the facts in prose without names.

Previous review: R05, partly repaired (15 → 5 gate hits).

## R06 (P3) — Whole-chapter or missing locators for the named theorems; the legal text has exact ones

**Location:**
- `README.md:350` and 588, "(Marker 2016, Chapter 1)";
- line 421, "Marker 2016, Chapter 4, and Keisler 1971";
- §3.2 `model_existence`, §4.2 `Theoryω.exists_countable_model_omitting`, §7.1 `PCMem`, §7.2 `craig_interpolation` and `pcSeparation`, and §7.3 `lyndon_interpolation`, which carry no locator at all.

**Claim:** each theorem carries an exact locator into a legal text.

**Witness:** the author's copy of the 2013 notes (`marker2013`, printed page = PDF page) has each result:

| Target | Notes result | Page | marker2013 line |
|---|---|---|---|
| PC classes | Definition 1.11 | 7 | 194 |
| Downward Löwenheim–Skolem, bound `max(|A|,|X|)` | Theorem 1.23 | 10 | 303 |
| First-order presentation (Chang) | Theorem 1.31 and Exercise 1.32 | 11–12 | 356–393 |
| Consistency property | Definition 4.1 | 39 | 1288 |
| Model existence | Theorem 4.6 | 40 | 1320 |
| Omitting types | Theorem 4.9 | 44 | 1436 |
| First-order omitting types corollary | Exercise 4.11 | 45 | 1491 |
| Craig, with function and constant symbols | Theorem 4.21 | 48 | 1602 |
| PC separation | Corollary 4.23 | 50 | 1666 |

The Lyndon form with relation polarity is López-Escobar 1965, Theorem 4.1 (.4), p. 267 (`lopezEscobar1965`, read from the scan). It is stated for relational systems with nonempty universes, and (.3) is the equality clause that §7.3 says it omits.

**Repair:** attach these locators at the claims, citing "Marker, lecture notes 2013" as at line 1051, or the book with its own verified numbers. Add the López-Escobar locator to §§7.2–7.3. The Layer 8 locators are now correct (see Previous findings). Previous review: R07, partly repaired.

## R07 (P3) — No `**Checks.**` blocks and no `*Needs:*` lines

**Location:** `README.md:182`, "### 0.2 Occurrences and symbol locality", and every subsection of Layers 0–8.

**Claim:** every definition carries at least three discriminating Checks, and every target its dependencies.

**Witness:** `grep -c '\*\*Checks\.\*\*\|\*Needs:\*' README.md` returns 0. The per-layer "Acceptance example" lines and the dependency table at lines 56–66 are layer-level only.

**Repair:** add a `**Checks.**` list to each definition. Ready blocks, each computed in the table below:
- **`relationsInSigned`:** `¬R` gives positive set `∅` and negative set `{R}`; `R → R` gives `{R}` and `{R}`; `t = t` gives `∅` and `∅`.
- **`universalSigned`:** `∀x R(x)` is universal and not existential; `∃x R(x)` is existential and not universal; `⋀ᵢ ∃x θᵢ(x)` is existential.
- **`IsolatesFO`:** the empty type is isolated by `⊤`; `{⊥}` is isolated by nothing; at `n = 0`, `{ψ}` is isolated iff some consistent sentence entails `ψ` modulo `T`.

Add a `*Needs:*` line to each target, item by item. For example, §4.2 `Theoryω.exists_countable_model_omitting` needs `model_existence_omitting` (3.2), `ConsistencyProperty.ofSatisfiable` (3.3), `FormationClosed` (1.2) and `Theoryω.entails_iff_countable` (2.5). Previous review: R06, not repaired.

## R08 (P3) — TeX display

**Location:** `README.md:345`, "|N| \le \max(\aleph_0,\ |X|,\ |A|,\ |\textstyle\sum_n L_{\mathrm{fun},n}|),".

**Witness:** gate `tex=1`.

**Repair:** replace the `math` fence (lines 344–346) by the code span `|N| ≤ max(ℵ₀, |X|, |A|, |Σ n, L.Functions n|)`. Previous review: R08, not repaired.

## R09 (P3) — Process residue, pull-request numbers and stand-in instructions

**Location:**
- `README.md:153–159`, "is reproduced in the consuming prototype as a marked stand-in, recording the revision of this roadmap it was checked against";
- lines 993 and 1073, "checkpoint";
- lines 127, 131, 147 and 958, roadmap pull-request numbers `#1316`, `#1319`, `#1318`, `#1317`;
- lines 197, 970–971 and 974–976, Tau Ceti pull-request links.

**Claim:** the README is timeless and cites roadmaps by name and section.

**Witness:**
- The gate reports `residue=3` (lines 156, 993, 1073).
- `CountableModelCounting` and `BorelEquivalenceRelations` are on main, so `#1318` and `#1317` are stale.
- `../CountableStructureSpaces/README.md` and `../HanfNumbers/README.md` resolve to no folder on main.
- The Tau Ceti work behind the links is at the pin: `Infinitary/FreeVarSupport.lean`, `Scott/Isomorphism.lean`, `BackAndForth/Karp.lean` and `Scott/RandomGraph.lean`.
- Lines 155–159 tell consumers to copy `pcSeparation`, but what another roadmap plans is imported by name and section.

**Repair:**
- **Lines 153–159:** replace them by "Consumers cite these interfaces by name and section of this roadmap; where Tau Ceti implements one, they use the Tau Ceti declaration."
- **Lines 993 and 1073:** write "at revision `518a366`".
- **Pull-request numbers:** drop them, and name CountableStructureSpaces and HanfNumbers without links until their folders exist on main.
- **Tau Ceti links:** replace them by the pinned files listed above.

Previous review: R09, not repaired.

## Previous findings

- **R01 (P2, roadmap-module import) — repaired.** `Suggested.lean:1–22` is `module` followed by `public import Mathlib` and 19 `public import TauCeti.*` modules, each present at Tau Ceti `2fd255d`. The gate reports `imports=0`, and `lake env lean` exits 0.
- **R02 (P3, `IsolatesFO` unnamed) — repaired.** `README.md:532–535` names `IsolatesFO` (with `insert φ.exs T` and `T ⊨ᵇ φ.imp ψ`) and `OmitsFOType`. A mechanical check finds all 41 declaration names of `Suggested.lean` in the README.
- **R03 (P3, Marker page spans) — repaired.** `README.md:1054–1055` reads "Theorem 4.27 (p. 51), Corollary 4.28 (p. 52), and the proof … (pp. 52–53)", and line 826 reads "(§4.4, p. 52, printed after Corollary 4.28)". Checked at marker2013 lines 1734 (p. 51), 1741 (p. 52), 1744–1777 (pp. 52–53) and 1755–1758 (p. 52).
- **R04 (`set_option`) — not repaired:** now R01, at P2 per the principles.
- **R05 (15 names) — partly repaired:** 5 gate hits remain, now R05.
- **R06 (Checks and Needs) — not repaired:** now R07.
- **R07 (locators) — partly repaired:** Layer 8 is exact; the rest is now R06. The `sources.toml` part of the old finding is dropped, because the manifest is the board's record, not a file of this folder.
- **R08 (TeX) — not repaired:** now R08.
- **R09 (residue) — not repaired:** now R09, extended.
- **R10 (padding) — not repaired:** now R02, extended.

## Verified sound

**Gate and build.** Gate at this head (worker's run): `set_option=1 tex=1 residue=3 readme-ids-missing=5`; every other check is 0, including `build`, `imports`, `depcheck`, `sorry-data`, `stray-files` and `outside-folder`.

`lake env lean TauCetiRoadmap/InfinitaryModelExistence/Suggested.lean` exits 0 in 7 s, with exactly 9 `declaration uses sorry` warnings, at lines 295, 302, 326, 370, 430, 438, 451, 478 and 501, and nothing else. No `def`, `abbrev` or `instance` has a `sorry` body.

**Signatures.** I compared the elaborated `#check @` type of every declaration (worker's `signatures.md`; 42 entries: the 41 declarations plus one parse artefact named `;`) with the README statement:
- No section binder was lost: every section declares only `L`, plus `L'`, `ι`, `α` in Layer 0, which the types mention.
- `exists_countable_model_omitting_fo` keeps both countability instances, `hsat`, `hP` and `hiso`.
- `pcSeparation` has its hypothesis over `M : Type` and its conclusion over `M : Type u_7`.
- `exists_firstOrder_presentation` quantifies `M` after `T` and `Γ`.

**One-tactic probe** (scratch copy, same imports):
- `fragmentType_comp` closes with one term (R02).
- `simp_all` leaves `Theoryω.exists_countable_model_omitting` open.
- The other seven `sorry` theorems have no library counterpart at either pin. `grep -ril 'interpolat\|omitting'` over Mathlib `ModelTheory` and Tau Ceti `ModelTheory` finds only comments.

**Dependency check** (exact output): `depcheck: 239 roadmaps, 2323 edges, 0 problem(s)`. No UPWARD or CYCLE line. The roadmap is on main and is not in `ORDER.txt`. Its only roadmap supplier is the completed InfinitaryLogic, whose links resolve to `Completed/InfinitaryLogic/README.md`.

**Tau Ceti declarations opened at `2fd255d`** (each table name at lines 113–114 and 1023–1031; file:line):
- **Infinitary syntax and occurrences:** `LHom.onBoundedFormulaInf` (Infinitary/LanguageMap.lean:76), `realize_onBoundedFormulaInf` (134), `BoundedFormulaInf.functionsIn`/`relationsIn` (Infinitary/Symbols.lean:40/51), `functionsIn_countable` (230), `relationsIn_countable` (289), `realize_congr_of_agreeOn` (348), `constantSupport` (Infinitary/ConstantSupport.lean:134), `symbSublang` (Sublanguage.lean:63), `restrictSymbols` (Infinitary/Sublanguage.lean:68), `exists_eq_onBoundedFormulaInf_of_subset_range` (210).
- **Presentation and substitution:** `smallPresentation` (Infinitary/SmallPresentation.lean:56, `Language.{0, 0}`), `smallPresentationEquiv` (72), `realize_smallPresentation` (127), `liftSubst` (Infinitary/SubstBounds.lean:75), `substBounds` (94), `realize_substBounds` (194), `mapBound_eq_substBounds` (271), `inst` (300), `onBoundedFormulaInf_substBounds` (438), `constantsVarsEquiv` (Infinitary/ConstantAbstraction.lean:61, `L[[γ]].BoundedFormulaInf ι α n ≃ L.BoundedFormulaInf ι (γ ⊕ α) n`), `IsAtomic` (Infinitary/Syntax.lean:213).
- **Theories, satisfiability and fragments:** `Theoryω` (Infinitary/Theory.lean:75), `conjunction` (135), `OmitsType` (160: every tuple refutes some member), `IsSatisfiable`/`Entails` (Infinitary/Satisfiability.lean:78/84: nonempty models in `Type (max u v)`), `entails_iff_not_isSatisfiable` (150), `Fragment` (Infinitary/Fragment.lean:69: component closure only), `generated_countable` (373), `FormationClosed` (Infinitary/FormationClosed.lean:98, with fields `bot_mem`, `atomic_mem`, `imp_mem`, `all_mem` and `mapBound_mem`).
- **Fragment elementarity and Löwenheim–Skolem:** `AElementary` (ModelExistence/AElementary.lean:66, an iff at every tuple), `OmitsType.of_aElementary` (125), `aElementary_of_tarskiVaught` (143), `exists_aElementary_substructure` (ModelExistence/LowenheimSkolem.lean:238), `exists_countable_aElementary_substructure` (251), `exists_aElementary_substructure_of_eq_univ` (263), `aElementary_iSup` (ModelExistence/DirectedUnion.lean:56), `aElementary_inclusion_iSup` (75), `OmitsType.iSup` (91), `Theoryω.exists_countable_model` (ModelExistence/CountableModel.lean:125), `entails_iff_countable` (141), `Entails.realize` (132).
- **Model existence and types:** `ConsistencyProperty` (ModelExistence/ConsistencyProperty.lean:80), `ofModel` (141), `model_existence` (ModelExistence/ModelExistence.lean:84), `model_existence_omitting` (197), `infinitaryType` (ModelExistence/Types.lean:72), `exists_isolatingFormula` (152), `infEquivAt_nat_iff_realizedTypes_zero_eq` (186), `Theoryω.IsolatesIn` (ModelExistence/Isolation.lean:71, a member `φ` of `A` with `insert φ.exs T` satisfiable and `T.Entails (φ.imp ψ).alls`).
- **Morleyization and graph translation:** `morleyize` (ModelExistence/Morleyization.lean:80), `morleyExpansion` (142), `eq_morleyExpansion_of_model_definingTheory` (240), `nonempty_morleyEquiv_iff` (462), `relSym_inter` (Infinitary/GraphTranslation/Language.lean:217), `relationalize` (Relationalize.lean:172), `graphAxioms` (Reconstruct.lean:161), `backTranslate` (BackTranslate.lean:114).
- **Projective classes and well-ordering:** `PCMem` (Interpolation/PCClass.lean:76: an expansion along `g` satisfying `Θ`, no nonemptiness), `pcMem_sumInl_sup_iff` (194, with `[Nonempty (L₁.Structure M)]`), `RelChain` (WellOrdering.lean:91), `HasWellOrderedChains` (120), `exists_model_relChain_rat` (644), `wellOrder_type_boundedness` (689), `wellOrdering_undefinable` (722).

The 14 targets that the README says the pin lacks are absent.

**Mathlib declarations opened at `1b1ccf4`:**
- **Semantics and satisfiability:** `LHom.realize_onBoundedFormula` (Semantics.lean:508), `models_iff_not_satisfiable` (Satisfiability.lean:297), `isSatisfiable_iff_isFinitelySatisfiable` (101).
- **Syntax and language maps:** `BoundedFormula.constantsVarsEquiv` (Syntax.lean:603), `BoundedFormula.toFormula` (608), `LHom.sumInl` (LanguageMap.lean:84), `sumMap` (165), `LHom.Injective` (180), `LEquiv` (280), `withConstants` (382).
- **Structures and set theory:** `ModelType` (Bundled.lean:73), `defaultExpansion` (146), `exists_elementarySubstructure_card_eq` (Skolem.lean:126), `Cardinal.isRegular_aleph_one` (SetTheory/Cardinal/Regular.lean:88).

**Ownership.**
- `roadmaps grep --fixed` over main and the 469 open heads: `ConsistencyProperty`, `craig_interpolation`, `Lyndon interpolation`, `exists_countable_model_omitting`, `graphLanguage`, `IsolatesFO`, `OmitsFOType` and `exists_firstOrder_presentation` occur only in this roadmap and its main copy. `pcSeparation` occurs here, on main and in CountableStructureSpaces only.
- CountableStructureSpaces (#1316) carries a stand-in `pcSeparation` (its `Suggested.lean:548`, "checked against revision 786457c7"). Its signature is identical to `Suggested.lean:451–461` here, so there is one owner and no conflict.
- `morleyize` in CountableModelCounting (main, README:253) is consumed from here.
- `overlaps.md`: no other pull request changes this roadmap, and no cited id is dropped.

**Sources read.**
- **marker2013**, the author's copy, printed page = PDF page: lines 194, 260–270, 303–308, 356–393, 1288–1301, 1320–1321, 1436–1449, 1491, 1602–1604, 1666–1672, 1734–1777.
- **harrisonTrainorKretschmer2024**, arXiv 2209.05615v3: lines 137–152 (§2.2, the definitions of ∀ₙ/∃ₙ) and 699–702 (§4.2.2, Theorem 4.5, p. 16 of the preprint).
- **lopezEscobar1965**, the open ICM scan of Fund. Math. 57, rendered: pp. 253 and 266–267.

**Seeded sample.**

| Sample | Locator in README | Text checked | Verdict |
|---|---|---|---|
| 0.1 Language maps | Mathlib `LHom.realize_onBoundedFormula` | Semantics.lean:508; Tau Ceti LanguageMap.lean:134 | the infinitary statement has the same hypotheses (`IsExpansionOn`); sound |
| 0.3 Sublanguages and expansions | none (library) | Tau Ceti Sublanguage.lean:63/72, Infinitary/Sublanguage.lean:68/210, SmallPresentation.lean:56–127 | statements match the pin; sound |
| 0.4 Substitution | Mathlib `toFormula`, `constantsVarsEquiv` | Syntax.lean:603/608; Tau Ceti SubstBounds.lean:94/194/271/300/438, ConstantAbstraction.lean:61 | the types match the README; `inst` is more general at the pin (recorded) |
| 1.1 Theories and entailment | Mathlib `models_iff_not_satisfiable` | Satisfiability.lean:297; Tau Ceti Satisfiability.lean:78–150 | universe `max u v` and nonempty models as in Convention 3; non-compactness example recomputed (table) |
| 2.2 Tarski–Vaught | none | notes Exercise 1.24 route (line 311); Tau Ceti AElementary.lean:143 | sound |
| 2.3 Löwenheim–Skolem | "Marker 2016, Chapter 1" | notes Theorem 1.23, p. 10, line 303: bound `max(|A|,|X|)`, fragments containing all atomic formulas | the README's comparison is right; locator coarse (R06) |
| 2.4 Unions and limits | none | Tau Ceti DirectedUnion.lean:56–91 | `[Nonempty ι]` needed (table) and present |
| 3.1 Consistency property | "Marker 2016, Chapter 4, and Keisler" | notes Definition 4.1, p. 39, lines 1288–1301 | clause-by-clause match (table); C5 ranges over all added constants, as here; locator coarse (R06) |
| 4.1 Types | none | Tau Ceti Types.lean:72–186 | sound |
| 4.2 Isolation, omitting types | none | notes Theorem 4.9, p. 44, lines 1436–1449; Exercise 4.11, line 1491 | hypothesis = non-isolation with `Θₙ = ¬pₙ`; conclusion = omission; formation closure replaces Marker's fragment (stated at line 286); locator missing (R06) |
| 5.1 Canonical expansion | none | Tau Ceti Morleyization.lean:80–240 | sound |
| 5.2 First-order presentation | "Marker 2016, Chapter 1" | notes Theorem 1.31, pp. 11–12, lines 356–393 | the axiom table and the types match clauses i)–iv); README's `∀` axiom is the correct form of clause vi) (Source issues); locator coarse (R06) |
| 7.1 Projective classes | none | notes Definition 1.11, p. 7, line 194; Tau Ceti PCClass.lean:76 | sound; locator missing (R06) |
| 7.3 Lyndon | "López-Escobar's interpolation theorem" | López-Escobar 1965, Theorem 4.1, p. 267: (.3) equality occurs only where in `φ → Φ`, (.4) polarity; relational systems, nonempty universes | README's "polarity in full, equality clause not part" is right; locator missing (R06) |
| 7.4 Malitz | H-T&K Theorem 4.5 (p. 1831), §2 | arXiv v3 §4.2.2 Theorem 4.5 (p. 16), §2.2 clauses (1)–(5) | statement matches: no function symbols, `ψ ∈ ∀₁`, universal interpolant with shared symbols; `universalSigned` = ∀₁/∃₁ |

**Adversarial values** (T/F are truth values):

| # | Statement | Instances tried | Values computed, each side | Result |
|---|---|---|---|---|
| 1 | `realize_onBoundedFormulaInf` | `L = {R}`, `g = id`, `M = {0,1}`, `R = {0}`, `φ = R(x₀)` at `0`, `1`; non-expansion `R' = {1}` | expansion: T/T at 0, F/F at 1; non-expansion at 0: image F, original T | `[g.IsExpansionOn M]` needed, present (line 71) |
| 2 | `onBoundedFormulaInf` injective for injective `g` | `g` sending `R₁, R₂ ↦ R` | `R₁(x₀) ≠ R₂(x₀)`, both map to `R(x₀)` | injectivity needed, stated |
| 3 | occurrence sets | `φ = (f(x₀) = c)`; `φ = R(x₀) → ⊥` | `functionsIn = {f, c}`, `relationsIn = ∅`; `relationsIn = {R}` | equality logical, as stated |
| 4 | `relationsIn_countable` | carrier `ι = ℝ`, `φ = ⋁_{r∈ℝ} R_r(x₀)` | `relationsIn` has size `2^ℵ₀` | `[Countable ι]` needed, present (line 79) |
| 5 | `exists_eq_onBoundedFormulaInf_of_subset_range` | `g` as in row 2, `φ' = R(x₀)`; `φ' = S(x₀)`, `S ∉ range` | preimages `R₁(x₀)` and `R₂(x₀)` both work; no preimage | no injectivity needed; `hr` needed |
| 6 | `expandSymbStructure` | carrier `∅`, `L = {c}`, `F = R = ∅`; relational `L` on `∅` | sublanguage structure exists, no `L`-structure on `∅`; expansion exists | nonemptiness needed exactly for function symbols, as stated |
| 7 | `realize_substBounds` | `m=1, k=0, σ 0 = c, φ = R(x₀)`; `m=2, k=1, σ = (x₀,x₀), φ = (x₀ = x₁)` | `R(c^M)` both sides; `a = a` T both sides | sound |
| 8 | `mapBound = substBounds ∘ var` | `f : Fin 2 → Fin 1` constant, `φ = (x₀ = x₁)` | both give `x₀ = x₀` | sound (SubstBounds.lean:271) |
| 9 | non-compactness, §1.1 | finite subset `{⋁ₖ c=Sᵏ0, c≠S⁰0,…,c≠S⁵0}`; the whole theory | ℕ with `c = 6` satisfies it; the disjunction forces `c = Sᵏ0` for some `k`, against `c ≠ Sᵏ0` | example correct |
| 10 | `entails_iff_not_isSatisfiable` | `T = ∅`, `φ = ⊤`; `φ = ⊥` | Entails T, `{¬⊤}` unsatisfiable; Entails F, `{¬⊥}` satisfiable (one point) | both directions agree |
| 11 | `Fragment.generated_countable` | relations `R_r`, `r ∈ ℝ`; `S = {⋁ₙ ∃x Rₙ(x)}` | members: `φ`, `∃xRₙ`, `∀x¬Rₙ`, `¬Rₙ(x₀)`, `Rₙ(x₀)`, `⊥`: countable, no `R_r` with `r ∉ ℕ` | Worked example 2 correct |
| 12 | countable formation-closed ⇒ countable symbols | `f` of arity `k`; `R` of arity `k` | `f(x̄) = f(x̄) ∈ A`, `R(x̄) ∈ A` at arity `k`: an injection into `A` | §4.2 "no separate countability" correct |
| 13 | `AElementary` two-out-of-three | `f ∘ g` and `f` `A`-elementary | `φ(g a) ↔ φ(f(g a)) ↔ φ(a)` | sound |
| 14 | Tarski–Vaught | `(ℤ,<) ≤ (ℚ,<)`, density `δ ∈ A`, `a = (0,1)` | counterexample `½ ∉ ℤ`: test fails; `ℤ ⊭ δ`, `ℚ ⊨ δ` | consistent |
| 15 | `exists_aElementary_substructure` bound | `A = ⊥`, `X = ∅`, `κ > ℵ₀` constants | `|N| = κ`; README bound `max(ℵ₀,0,0,κ) = κ`; Marker's `max(|A|,|X|) = 0` fails | function-symbol term needed, as stated; absorbed for infinite formation-closed `A` (row 12) |
| 16 | `aElementary_iSup`, empty `ι` | `ι = ∅`, `M = (ℚ,<)`, `¬∀x¬(x=x) ∈ A` | `⨆ = ∅ ⊭`, `ℚ ⊨` | `[Nonempty ι]` needed, present (line 196) |
| 17 | `Theoryω.exists_countable_model` | `T = {⊤}`, empty language | the model must be nonempty; Lean concludes `Nonempty M` | matches README's chosen-element remark |
| 18 | consistency property vs notes Definition 4.1 | C5 (instances at `c ∈ C`); C7a–c | README `all` over every `L.con c` = all added constants; `eq_subst` + `eq_refl` give C7a (with `φ(x) := x = t`); `eq_name` = C7c | match; the family `{∅}` fails `eq_refl` at `c₀` |
| 19 | `model_existence` | every element named | surjection `ℕ → M` ⇒ countable and nonempty | Lean omits `Nonempty`, implied |
| 20 | `model_existence_omitting`, `p.2 = ∅` | `hreq` at `s` | needs `ψ ∈ ∅`: F, so the hypotheses are inconsistent | consistent with `OmitsType M ∅` = F |
| 21 | `exists_isolatingFormula` on `(ℚ,<)` | `n = 1`; `n = 2` | one type, `χ = (x₀ = x₀)`; three types, `χ = (x₀ < x₁)` true of `b` iff `type b = type (0,1)` | Worked example 5 correct |
| 22 | same, `M = ∅` | `n = 0`; `n = 1` | one realized type, `χ = ⊤`; no tuple, vacuous | sound |
| 23 | `AElementary.fragmentType_comp` | unfold `fragmentType` and `AElementary` | `{φ ∣ φ ∈ A ∧ φ(f∘a)} = {φ ∣ φ ∈ A ∧ φ(a)}` by `and_congr_right` | one term: padding (R02) |
| 24 | `IsolatesIn`, empty type | `p = ∅`, `n = 1`, `φ = ⊥ → ⊥ ∈ A` (`bot_mem`, `imp_mem`) | `T ∪ {∃x ⊤}` satisfiable; `∀ψ ∈ ∅` vacuous: isolated T; `OmitsType M ∅` = F | `hiso` excludes it, correctly |
| 25 | `Theoryω.exists_countable_model_omitting` | `L = {Pₙ}` unary, `T = ∅`, `p = {Pₙ(x₀)}`, `A` = formation closure of `p` | each `φ ∈ A` mentions finitely many `Pᵢ`; flip an unmentioned `Pₘ`: non-isolated T; `ℕ` with `Pₙ = ℕ∖{n}` omits `p`, countable | sound |
| 26 | same, `n = 0` | `p = {ψ}`, `T ⊭ ψ` | `⊤` isolates iff `T ⊨ ψ`; non-isolated ⇒ a countable model fails `ψ` | sound |
| 27 | same vs notes Theorem 4.9 | `Θₙ = {¬ψ ∣ ψ ∈ pₙ}` | notes hypothesis ⇔ `¬IsolatesIn A T pₙ`; `T + ⋀ₙ ∀v ⋁Θₙ` satisfiable ⇔ omission | match |
| 28 | `IsolatesFO`, `{⊥}` | any `φ` with `insert φ.exs T` satisfiable | `T ⊨ᵇ φ.imp ⊥` F; not isolated; omitting model: every tuple refutes `⊥`, T | sound |
| 29 | `exists_countable_model_omitting_fo`, `hsat` | `T = {⊥}` | `hiso` T (nothing satisfiable); conclusion `M ⊨ {⊥}` F | `hsat` needed, present |
| 30 | `morleyExpansion` | `Φ = {⟨1, P(x₀) → ⊥⟩}`, `M = {0,1}`, `P = {0}` | `R_φ = {1}` = `¬P`; reduct = `M` | sound |
| 31 | `exists_firstOrder_presentation`, wrong model | `φ = ⋀ₖ φₖ`, all `φₖ` true; `S`: `R_φ` = F, `R_{φₖ}` = T | `S ⊨` axioms (`R_φ → R_{φₖ}` vacuous) but realizes `{¬R_φ} ∪ {R_{φₖ}}` | types necessary; iff right |
| 32 | same, empty `M` | members at `n ≥ 1`; `n = 0` | `Fin n → ∅` empty, relations equal; 0-ary symbols fixed by axioms (`∀`-member true in `∅`) | sound |
| 33 | `PCMem`, parity | `|M| = 2, 3` for even; `|M| = 3` for odd | swap: T; no fixed-point-free involution: F; `(12)(3)`: T | Worked example 7 correct |
| 34 | `craig_interpolation`, degenerate | `φ` unsatisfiable; `ψ` valid | `⊥` with empty occurrence sets; `⊤` | acceptance example correct |
| 35 | `craig_interpolation`, constants | `φ = P(c)`, `ψ = ∃x P(x)` | `θ = ∃x P(x)`, `functionsIn θ = ∅ ⊆ {c} ∩ ∅` | sound; notes Theorem 4.21 bounds functions and constants |
| 36 | `pcSeparation`, Type-only hypothesis | uncountable common member in `Type w` | `{Θ₁⁺, Θ₂⁺}` satisfiable ⇒ countable model in `Type` ⇒ countable common member | hypothesis suffices; parity: `θ = ⋁ₙ` "exactly `2n`" separates |
| 37 | `relationsInSigned` | `¬R`; `R → R`; `t = t`; `∀x R(x)` | (pos, neg) = (`∅`,`{R}`); (`{R}`,`{R}`); (`∅`,`∅`); (`{R}`,`∅`) | matches López-Escobar polarity |
| 38 | `lyndon_interpolation` | `φ = ∀x(P→Q) ∧ ∃x P`, `ψ = ∃x Q` | `θ = ∃x Q`: pos `{Q}` ⊆ `{P,Q}` ∩ `{Q}`, neg `∅` | sound; graph route preserves base polarity (checked through `entails_iff_graphTranslation`) |
| 39 | `universalSigned` vs H-T&K §2.2 | `∀x R`; `∃x R`; `⋀ᵢ ∃x θᵢ` | (univ, exist) = (T,F); (F,T); (F,T) | equals ∀₁/∃₁ |
| 40 | `malitz_interpolation` | `φ = ∀x P ∧ ∃x Q`, `ψ = ∀x P` | `θ = ∀x P`, universal T, `relationsIn = {P}` | sound; `[L.IsRelational]` = "no function symbols" |
| 41 | Layer 8 family without reserve | `φ`: strict linear order with greatest element; `σ = {∀x(lt(x,d₀) ∨ x=d₀)}` | witness `M = α+1`, `d₀ ↦ α`, `α ≤ b₁` ✓; adding `d₁` needs `b₂ > b₁ = max`: none | README's counterexample is right; it also refutes notes C7c (Source issues) |
| 42 | placement lemma | `α = 0`; `α = ω`; first position | `β = 2`, `p = bᵢ+1`, `bᵢ < p`, `p + 0 < bᵢ+2 ≤ bᵢ₊₁` ✓; `β = ω·2+1`, `p = bᵢ+ω+1`, `p + ω = bᵢ+ω·2 < bᵢ+β ≤ bᵢ₊₁` ✓; first position `p = α`, `p + α = α·2 ≤ β ≤ b₁` ✓ | arithmetic correct |
| 43 | `RelChain` from `ℚ` | `f(−1), f(−2), …` | `lt(f(−n−1), f(−n))` for all `n` | ill-founded (Tau Ceti WellOrdering.lean:100) |
| 44 | Theorem 4.27 ↔ `exists_model_relChain_rat` | embeddings vs chains | notes: `(α,<)` embeds ⇒ `(ℚ,<)` embeds; roadmap: chain hypothesis ⇒ chain conclusion | weaker hypothesis and conclusion, same proof; injectivity separate (WellOrdering.lean:108) |
| 45 | Corollary 4.28 ↔ `wellOrder_type_boundedness` | "at most α" vs `< α` | `α ↦ α+1 < ω₁` | match |
| 46 | `wellOrdering_undefinable`, empty structure | no constants, `M = ∅` | `IsWellOrder ∅` T, so a defining `φ` must hold in `∅` | no conflict with `¬∃` |
| 47 | Worked example 8 | `α < ω₁`, `⋁_{β<α}` Scott sentences of `(β,<)` | countable models = well-orders of type `< α` | correct (`TauCeti.scott_isomorphism`) |

## Not verifiable

- **Marker 2016**: the theorem numbers and pages of Chapters 1 and 4 of the book. It is CUP Lecture Notes in Logic 46, behind a paywall. I checked the author's 2013 notes instead and gave their locators in R06.
- **Keisler 1971** (North-Holland), **Malitz 1969** (Duke Math. J.) and **Gao 2009** (CRC): no legal copy was looked for beyond the DOI. No statement here depends on their exact text: the notes and López-Escobar support each statement.
- **The published page of Harrison-Trainor–Kretschmer, Theorem 4.5**: "p. 1831". The CUP landing page has no open licence class. arXiv v3 has the same section and theorem numbers (§4.2.2, Theorem 4.5, preprint p. 16).
- **Tau Ceti main at `d2083f0`**: not pinned and not checked (R04).
- **The external formalization at `518a366`**: not consulted; it is a provenance pointer only.

## Source issues

- **Error** in marker2013 at the proof of Theorem 4.27, condition (*) and clause C7c, printed pp. 52–53: the source says the initial and intermediate gaps make Σ a consistency property, and places a new rational only between two named ones. It should also reserve room after the last named position and handle a rational below or above all named ones. As printed, C7c fails for a rational above the greatest element. Affects the proof.
- **Misprint** in marker2013 at the proof of Theorem 1.31, clause vi), printed p. 12: for `φ = ∀w θ` the axiom has a spurious inner `∀v`, reading `R_φ ↔ ∀v∀w R_θ`. It should be `∀v (R_φ ↔ ∀w R_θ)`. Affects nothing.
