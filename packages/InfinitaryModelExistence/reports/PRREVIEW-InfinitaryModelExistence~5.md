# Review of InfinitaryModelExistence (pull request #1615 at 35db8df)

**Verdict:** needs changes

This is a full review. The folder changed by 695 lines since `786457c`. The pull request's diff against main touches only `TauCetiRoadmap/InfinitaryModelExistence/README.md` and `TauCetiRoadmap/InfinitaryModelExistence/Suggested.lean`; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/InfinitaryModelExistence'` prints nothing.

The gate fails on one check, `readme-ids-missing=4`. Build, imports, `set_option`, TeX, residue and depcheck all pass. No statement is false, and no finding is blocking.

The previous review's P2 (`set_option`) is repaired, and so are the Layer 8 route, the locators and the TeX display. What remains is P3:
- the gate hit;
- four padding declarations;
- ten theorem names that exist nowhere;
- the unpinned `d2083f0` sentence;
- two pull-request links;
- the missing Checks and *Needs:* lines;
- one coarse locator in a docstring.

## R01 (P3) — The gate fails: four Tau Ceti names read as this roadmap's own

**Location:** `README.md:269`, "`Theoryω.realize_conjunction_iff`"; 382, "`Theoryω.exists_countable_model`"; 388, "`Theoryω.entails_iff_countable`"; 725; 1044, "`Theoryω.entails_iff_not_isSatisfiable`"; 1045.

**Claim:** every backticked name that the README presents as this roadmap's own is declared or mentioned in `Suggested.lean`. `Suggested.lean:98` declares `Theoryω.exists_countable_model_omitting`, which makes `Theoryω` a namespace of this roadmap, so the gate reads every `Theoryω.…_…` name as an own name.

**Witness:** gate `readme-ids-missing=4`, for exactly these four names. Each is a Tau Ceti declaration at `2fd255d` in `FirstOrder.Language.Theoryω`:
- `exists_countable_model` (`ModelExistence/CountableModel.lean:125`);
- `entails_iff_countable` (`:141`);
- `entails_iff_not_isSatisfiable` (`Infinitary/Satisfiability.lean:150`);
- `realize_conjunction_iff` (`Infinitary/Theory.lean:148`).

**Repair:** write the four names fully qualified, `FirstOrder.Language.Theoryω.<name>`, at lines 269, 382, 388, 725, 1044 and 1045.

**Tested:** the gate's own `readme_identifiers_missing` on the repaired README returns `[]`, with the current `Suggested.lean` and with the trimmed one of R02.

Previous review: R05, partly repaired. The name `Theoryω.realize_conjunction_iff` was added, but in the form the gate reads as an own name.

## R02 (P3) — Padding: four declarations restate the library or another headline of the file

**Location:**
- `Suggested.lean:55–74`, `model_existence_omitting`, proved in four lines from the library;
- lines 84–94, `fragmentType` and `AElementary.fragmentType_comp`, the latter proved by "`Set.ext fun _ => and_congr_right fun h => hf.realize_iff h a`";
- lines 163–169, `craig_interpolation_relational`.

**Claim:** `README.md:1036–1038` says that `Suggested.lean` "states only the targets the pin lacks, together with `model_existence_omitting`".

**Witness:**
- `model_existence_omitting` reindexes Tau Ceti's `ConsistencyProperty.model_existence_omitting` (`ModelExistence/ModelExistence.lean:197`) over the subtype of `P`. The library theorem accepts any countable index type, so it already covers sets.
- `fragmentType_comp` is Tau Ceti's `AElementary` (`ModelExistence/AElementary.lean:65`) unfolded, and nothing else uses `fragmentType`.
- In a scratch copy, `(craig_interpolation φ ψ h).imp fun _ h => h.2` proves `craig_interpolation_relational`. It is a special case of a headline in the same file.

**Repair:**
- **Delete from `Suggested.lean`:** these four declarations, the `/-! ## Layer 3 … -/` section and its `section ModelExistence`, and the imports `TauCeti.ModelTheory.ModelExistence.AElementary` and `TauCeti.ModelTheory.ModelExistence.ModelExistence`.
- **Module docstring:** end the sentence at line 32 at "This file states the targets the pin lacks.", and delete the rest of it, through line 34, which introduces the adapter.
- **Docstring of `craig_interpolation`:** name the relational core `craig_interpolation_relational` as the same statement under `[L.IsRelational]` without the function-symbol bound, as the docstring of `lyndon_interpolation` already does for `lyndon_interpolation_relational`.
- **`README.md:1035–1038`:** end the sentence at "states only the targets the pin lacks".
- **`README.md:1053–1057`:** drop `fragmentType`, `AElementary.fragmentType_comp` and `craig_interpolation_relational` from the list.
- **`README.md:500–501`:** write "an `A`-elementary embedding preserves `A`-types" without the theorem name.

**Tested:**
- A scratch copy with exactly these deletions exits 0 under `lake env lean`, with 7 `sorry` warnings (lines 55, 79, 101, 122, 135, 162, 185) and nothing else.
- Together with R01's README edit, the gate's `readme_identifiers_missing` returns `[]` and `empty_lean_sections` returns `[]`.

Previous review: R02, partly repaired. 26 of its 27 theorems are gone, and the adapter and `fragmentType_comp` remain. `craig_interpolation_relational` is a new item.

## R03 (P3) — Ten theorem names are presented as targets but exist nowhere

**Location:**
- `README.md:373` and 375, `aElementary_of_cocone` and `aElementary_directLimit_of`;
- 595, `morleyTheory_countable` and `morleyTypes_countable`;
- 660 and 700, `entails_iff_graphTranslation`;
- 704 and 708, `craig_pcSeparation` and `craig_pcSeparation_relational`;
- 757, `realize_mono_of_signed`;
- 768, `craig_of_lyndon_interpolation`;
- 784, `IsUniversal.realize_of_embedding`.

**Claim:** an API bullet carries a backticked Lean name only when that declaration is in `Suggested.lean`; otherwise the name must be a supplier declaration at the pins.

**Witness:** a word-boundary `grep` of each name over `Suggested.lean`, Tau Ceti `2fd255d` and Mathlib `1b1ccf4` finds none of them. The citation resolver also lists `IsUniversal.realize_of_embedding` as found nowhere. The closest pinned names are different objects. Mathlib's `BoundedFormula.IsUniversal.realize_embedding` is first-order, and Mathlib's `IsUniversal` is the prenex `Π₁` class, not the `∀₁` class of §7.4.

**Repair:** state each fact in prose without the name, for example "the Morley theory and the Morley types are countable for countable `A`, with no countability of the language". Names that Tau Ceti declares at the pin stay as they are.

Definition names introduced by the bullet that defines them are not part of this finding. These are `expandSymbStructure`, `ConsistencyProperty.ofSatisfiable`, `Fragment.negationClosure`, `Fragment.NegationClosed`, `Fragment.slice`, `morleyTheory`, `morleyTypes`, `positiveRelationsIn`/`negativeRelationsIn` and `BoundedFormulaInf.toFormula`. They follow the house template ("Define `fooBar` as …"), and CountableModelCounting cites `fragmentType` and `Fragment.slice` by name. For that reason the previous review's item for `Fragment.NegationClosed` is not raised again.

Previous review: R05. Of its seven names, `realize_mono_of_signed` and `IsUniversal.realize_of_embedding` remain here, and `realize_conjunction_iff` is now R01.

## R04 (P3) — A claim about an unpinned Tau Ceti commit, naming a declaration absent at the pin

**Location:** `README.md:1058–1062`, "Tau Ceti commit `d2083f0` has declarations for all of them except … with the first-order presentation stated as `model_morleyTheory_and_omitsType_iff_eq_morleyExpansion`; its `pcSeparation`, in `Interpolation/Craig.lean`, takes …".

**Claim:** the README describes the library at the revision this repository pins.

**Witness:**
- `lake-manifest.json` pins Tau Ceti `2fd255d997…`.
- At that revision `TauCeti/ModelTheory/Interpolation/` holds only `PCClass.lean`.
- `grep -rl 'model_morleyTheory_and_omitsType_iff_eq_morleyExpansion\|craig_interpolation\|pcSeparation'` over the pinned `TauCeti/ModelTheory` finds nothing.

**Repair:** delete the sentence from "Tau Ceti commit `d2083f0`" to "rather than in `Type`." Keep the preceding list, edited as in R02. When the pin advances, the implementation table records the new declarations and any signature difference.

Previous review: R04, not repaired. The date was removed, but the claim stayed and gained a name.

## R05 (P3) — Pull-request links for two sibling roadmaps

**Location:** `README.md:129–130`, "**CountableStructureSpaces** (proposed in [#1316](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1316))"; line 134, "**HanfNumbers** (proposed in [#1319](…/pull/1319))".

**Claim:** cross-roadmap citations name the roadmap and its section or target, never a pull-request number, including for roadmaps still in pull requests.

**Witness:** `roadmaps list` shows both as open new-roadmap pull requests. The text goes stale at their merge, as `#1317` and `#1318` did, and those two were correctly removed this round.

**Repair:** delete both parentheticals "(proposed in […])". Keep the bold names, unlinked until the folders exist on main.

Previous review: R09, partly repaired. The residue, the Tau Ceti pull-request links and `#1317`/`#1318` are gone.

## R06 (P3) — No `**Checks.**` lists and no `*Needs:*` lines

**Location:** every subsection of Layers 0–8, for example `README.md:281`, "### 1.2 Fragments", and `README.md:513`, "### 4.2 Isolation over a theory and omitting types".

**Claim:** every definition carries at least three discriminating Checks, and every target its dependencies item by item.

**Witness:** in the README, `grep -c '\*\*Checks\.\*\*'` returns 0 and `grep -c '\*Needs:\*'` returns 0. The layer table at lines 57–67 gives layer-level dependencies only.

**Repair:** add a `**Checks.**` list under each definition and a `*Needs:*` line under each target. The blocks below are computed in the adversarial table.
- **`OmitsFOType` / `IsolatesFO`:**
  - the empty type is isolated by `⊤` whenever `T` is satisfiable, and is omitted by no structure (row 32);
  - `{⊥}` is isolated by nothing and is omitted by every structure;
  - at `n = 0`, `{ψ}` is omitted exactly when `M ⊭ ψ`;
  - in `Th(ℕ, 0, S)` the type `{x ≠ Sⁿ0}` is not isolated, and `ℕ` omits it (row 33).
- **`relationsInSigned`:**
  - `¬R` gives positive set `∅` and negative set `{R}`;
  - `R → R` gives `{R}` and `{R}`;
  - `t = t` gives `∅` and `∅`;
  - `∃x R(x)` gives `{R}` and `∅` (row 42).
- **`universalSigned`:** `∀x R` is universal and not existential; `∃x R` is existential and not universal; `⋀ᵢ ∃x θᵢ` is existential (row 44).
- **`Fragment.FormationClosed`:** the fragment generated by one sentence is not formation-closed, since it omits the atomic formulas of the other symbols (row 10). A countable formation-closed fragment forces countably many symbols (row 11).
- **`ConsistencyProperty`:**
  - the family `{∅}` fails `eq_refl`;
  - the satisfaction instance of `(ℕ, 0, S)` with `e = id` is one;
  - with a non-surjective `e` it fails `not_all` (rows 20 and 24).
- **`Needs` examples:**
  - §4.2 `Theoryω.exists_countable_model_omitting` needs Tau Ceti `ConsistencyProperty.model_existence_omitting` (3.2), the target `ConsistencyProperty.ofSatisfiable` (3.3), `Fragment.FormationClosed` (1.2) and `FirstOrder.Language.Theoryω.exists_countable_model` (2.5).
  - §7.2 `pcSeparation` needs `craig_interpolation`, Tau Ceti `LHom.exists_eq_onBoundedFormulaInf_of_subset_range` (0.3) and `Theoryω.Entails.realize` (2.5).

Previous review: R07, not repaired.

## R07 (P3) — Chapter-level locator in a `Suggested.lean` docstring

**Location:** `Suggested.lean:138–139`, "**Layer 5 milestone, the first-order presentation of a countable fragment** (Marker 2016, Chapter 1)."

**Claim:** each headline carries an exact locator into a legal text.

**Witness:** the book is paywalled and cited by chapter only. `README.md:597–598` gives the exact legal locator: Theorem 1.31 and Exercise 1.32 of the 2013 notes, pp. 11–12 (marker2013 lines 356–394).

**Repair:** replace the parenthetical by "(Theorem 1.31 and Exercise 1.32 of Marker's 2013 notes, pp. 11–12)".

## Previous findings

- **R01 (P2, `set_option`) — repaired.** `Suggested.lean` has no `set_option`; gate `set_option=0`.
- **R02 (padding) — partly repaired:** now R02.
- **R03 (Layer 8 route) — repaired.** The changes are at `README.md:33–36` ("The well-ordering theorems are proved directly for arbitrary languages"), line 67 (L8 consumes L0–L3), lines 71–72, lines 615–619 (Layer 6 is "a proof device for the theorems of Layer 7"), lines 819–824 ("No graph translation is needed"), the equality clause at lines 878–885 (arbitrary closed terms through `eq_name`) and line 943 (the chain without the graph translation).
- **R04 (`d2083f0`) — not repaired:** now R04.
- **R05 (seven names) — partly repaired:** three names fixed; two are now in R03, one is in R01, and `Fragment.NegationClosed` is withdrawn (see R03).
- **R06 (locators) — repaired.** The 2013 notes are cited at §§2.3, 3.1, 3.2, 4.2 (both theorems), 5.2, 7.1 and 7.2 (both theorems), and López-Escobar Theorem 4.1, p. 267, at §7.3. I checked each against marker2013 (Sources below).
- **R07 (Checks and *Needs*) — not repaired:** now R06.
- **R08 (TeX display) — repaired.** Lines 351–353 are a `text` fence, "`|N| ≤ max(ℵ₀, |X|, |A|, |Σ n, L.Functions n|)`"; gate `tex=0`.
- **R09 (residue, pull-request numbers) — partly repaired:** now R05. The "stand-in" paragraph and "checkpoint" are gone, the Tau Ceti links point to pinned files, and `#1317`/`#1318` are gone.

## Verified sound

**Gate** (my run at this head): `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=4 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL`. The worker's run also reports `build=0`.

**Build:** `lake env lean TauCetiRoadmap/InfinitaryModelExistence/Suggested.lean` exits 0, with exactly 8 `declaration uses sorry` warnings, at lines 98, 122, 144, 165, 173, 186, 213 and 236. No `def` or `instance` has a `sorry` body.

**Signatures.** I elaborated `#check @` for all 15 declarations in one scratch file and compared each with its README statement:
- No section binder was lost: each section declares only `L`, which every type mentions.
- `exists_countable_model_omitting_fo` keeps both countability instances, `hsat`, `hP` and `hiso`.
- `exists_firstOrder_presentation` chooses `T` and `Γ` before `M`.
- `pcSeparation` takes its hypothesis over `M : Type` and gives its conclusion over `M : Type u_7`.
- `Theoryω.exists_countable_model_omitting` has `hTA`, `hsat`, `hPA` and `hiso` exactly as §4.2 states them.

Nothing changed.

**One-tactic probe** (scratch copy, same imports):
- `craig_interpolation_relational` closes with one term from `craig_interpolation` (R02).
- `AElementary.fragmentType_comp` and `model_existence_omitting` are already proved from the library (R02).
- The other seven `sorry` theorems have no counterpart at either pin. `library-matches.md` lists only unrelated first-order lemmas, and `TauCeti/ModelTheory/Interpolation/` holds only `PCClass.lean`.

**Headline theorems.**
- **Statable headlines, all present in `Suggested.lean`:**
  - the omitting types theorem (`Theoryω.exists_countable_model_omitting`);
  - its first-order corollary (`exists_countable_model_omitting_fo`, with `IsolatesFO`, `OmitsFOType`);
  - the first-order presentation (`exists_firstOrder_presentation`);
  - Craig (`craig_interpolation`) and PC separation (`pcSeparation`);
  - Lyndon (`lyndon_interpolation`, with `relationsInSigned`);
  - Malitz (`malitz_interpolation`, with `universalSigned`).
- **Headlines Tau Ceti proves at the pin:** model existence (`ConsistencyProperty.model_existence`, `ModelExistence/ModelExistence.lean:84`, with omission requests at 197) and the Layer 8 theorems (`Sentenceω.exists_model_relChain_rat`, `wellFounded_boundedness`, `wellOrder_type_boundedness`, `wellOrdering_undefinable`, `WellOrdering.lean:644/676/689/722`). These are rightly not restated, and the module docstring says so at lines 29–31.
- No headline is forced through a stand-in, and no headline is missing.

**Dependency check** (exact output): `depcheck: 229 roadmaps, 2122 edges, 0 problem(s)`. No UPWARD or CYCLE line. The roadmap is on main. Its only roadmap supplier is the completed InfinitaryLogic. Its Layers 0–3 exist at `Completed/InfinitaryLogic/README.md:291/403/501/566`, and its line 686 lists model existence and Löwenheim–Skolem for fragments as out of scope, as `README.md:12–15` says. CountableStructureSpaces, HanfNumbers and CountableModelCounting appear only as consumers.

**Seeded sample.**

| Sample | Locator in README | Text checked | Verdict |
|---|---|---|---|
| 0.3 Sublanguages and expansions | library | Tau Ceti `Sublanguage.lean:63/72`, `Infinitary/Sublanguage.lean:68/210`, `Infinitary/SmallPresentation.lean:56/72/127` | statements match (rows 1–3); `expandSymbStructure` is a target absent at the pin |
| 0.4 Substitution | Mathlib `BoundedFormula.toFormula`, `constantsVarsEquiv` | Mathlib `ModelTheory/Syntax.lean:603/608`; Tau Ceti `Infinitary/SubstBounds.lean:75/94/194/271/300/438`, `Infinitary/ConstantAbstraction.lean:61` | match (rows 4–6); `inst` more general at the pin, recorded |
| 1.1 Theories and entailment | Mathlib `models_iff_not_satisfiable` | Mathlib `Satisfiability.lean:66/279/297`, `Bundled.lean:73`; Tau Ceti `Infinitary/Satisfiability.lean:78/84/150`, `Infinitary/Theory.lean:148/160` | universe `max u v`, nonempty models, as Convention 3 (rows 7–9) |
| 1.2 Fragments | none (Gao for comparison) | Tau Ceti `Infinitary/Fragment.lean:69/287/373`, `Infinitary/FormationClosed.lean:98/236/248/287/421`; notes Def 1.18, marker2013 lines 260–270 | sound (rows 10–11); formation closure differs from Marker's fragment as stated at lines 296–298 |
| 2.1 `A`-elementary embeddings | none | Tau Ceti `ModelExistence/AElementary.lean:65` | sound (rows 12–13) |
| 2.2 Tarski–Vaught | none | Tau Ceti `AElementary.lean:143`, `LowenheimSkolem.lean:139`; notes Exercise 1.24, marker2013 line 311 (Skolem-function route) | sound (rows 14–15) |
| 2.3 Löwenheim–Skolem | notes Theorem 1.23, p. 10 | marker2013 lines 303–308 (p. 10): bound `max(|A|,|X|)`, fragments with every atomic formula; Tau Ceti `LowenheimSkolem.lean:238/251/263` | locator correct; comparison right (row 16) |
| 2.4 Unions and limits | none | Tau Ceti `DirectedUnion.lean:56/75/83/91` | `[Nonempty ι]` present (row 17); `aElementary_of_cocone` absent (R03) |
| 2.5 Sentence-level consequences | none | Tau Ceti `CountableModel.lean:125/132/141/196/203` | sound (rows 18–19) |
| 3.1 The definition | notes Def 4.1, p. 39 | marker2013 lines 1288–1301 (p. 39) | locator correct; clause match (rows 20–21) |
| 3.2 Model existence | notes Theorem 4.6, p. 40 | marker2013 lines 1320–1321 (p. 40); Tau Ceti `ModelExistence.lean:84/197` | locator correct (rows 22–23) |
| 3.3 Satisfaction instance | none | Tau Ceti `ConsistencyProperty.lean:141`; notes proof of Theorem 4.9, marker2013 lines 1453–1461 (the family of finite satisfiable `σ₀`) | sound (rows 24–25) |
| 4.1 Types | none | Tau Ceti `ModelExistence/Types.lean:72/95/135/152/186` | sound (rows 26–28) |
| 5.1 Canonical expansion | none | Tau Ceti `ModelExistence/Morleyization.lean:80/165/189/240/309/384/426/462/478` | `morleyize : Language.{u, max u v}` as stated; sound |
| 7.2 Craig and PC separation | notes Theorem 4.21, p. 48; Corollary 4.23, p. 50 | marker2013 lines 1602–1604 (p. 48), 1666–1674 (p. 50), and 1728–1729 (the Löwenheim–Skolem step) | locators correct; the countable-member hypothesis is justified as in the notes (rows 37–41) |

**Further locators checked in marker2013** (printed page = PDF page):
- Definition 1.11, p. 7 (line 194);
- Theorem 1.31 and Exercise 1.32, pp. 11–12 (lines 356–394);
- Theorem 4.9, p. 44 (lines 1436–1449);
- Exercise 4.11, p. 45 (line 1491);
- Theorem 4.27, p. 51 (line 1734);
- Corollary 4.28, p. 52 (line 1741);
- (*), p. 52 (lines 1755–1758);
- the proof of 4.27, pp. 52–53 (lines 1744–1777).

All agree with `README.md:1075–1079`.

**Adversarial values** (T/F are truth values):

| # | Statement | Instances tried | Values computed, each side | Result |
|---|---|---|---|---|
| 1 | `exists_eq_onBoundedFormulaInf_of_subset_range` | `g` sending `R₁, R₂ ↦ R`; `φ' = R(x₀)`; `φ' = S(x₀)`, `S ∉ range g` | preimages `R₁(x₀)`, `R₂(x₀)`; `relationsIn φ' = {S} ⊄ range`: no preimage | no injectivity needed; range hypotheses `hF`, `hR` present |
| 2 | `expandSymbStructure` | carrier `∅`, `L = {c}`, `F = R = ∅`; relational `L = {P}` on `∅` | sublanguage structure exists, but `c^M ∈ ∅` is impossible; `P^M = ∅` works | nonemptiness needed exactly for function symbols, as lines 216–219 say |
| 3 | `smallPresentation` | `L` with `2^ℵ₀` relation symbols | `Shrink.{0}` needs `Small.{0}`, which the countability instance supplies | the instance is necessary and present |
| 4 | `realize_substBounds` | `m=1,k=0, σ 0 = c, φ = R(x₀)`; `m=2,k=1, σ = (x₀,x₀), φ = (x₀=x₁)` at `a` | `R(c^M)` both sides; `a = a` T both sides | sound |
| 5 | `mapBound f = substBounds (var ∘ inr ∘ f)` | `f : Fin 2 → Fin 1` constant, `φ = (x₀ = x₁)` | both `x₀ = x₀` | sound |
| 6 | `liftSubst` | `σ 0 = x₀`, past one `∀` | old position: `x₀ ↦ x₀` (castSucc); new position `1 ↦ x₁` (`Fin.last`) | matches "the new position goes to itself" |
| 7 | non-compactness, §1.1 | `{⋁ₖ c=Sᵏ0, c≠S⁰0,…,c≠S⁵0}`; whole theory | ℕ with `c = 6`: all T; the disjunction forces `c = Sᵏ0`, against `c ≠ Sᵏ0` | example correct |
| 8 | `entails_iff_not_isSatisfiable` | `T = ∅`, `φ = ⊤`; `φ = ⊥` | Entails T, `{¬⊤}` unsat T; Entails F (one point), `{¬⊥}` sat T | both directions agree |
| 9 | `conjunction`, `T = ∅` | `realize_conjunction_iff` | realized ↔ `M ⊨ ∅` = T | empty conjunction behaves as `⊤` |
| 10 | `Fragment.generated_countable` | relations `R_r`, `r ∈ ℝ`; `S = {⋁ₙ ∃x Rₙ(x)}` | members `φ`, `∃xRₙ`, `∀x¬Rₙ`, `¬Rₙ(x₀)`, `Rₙ(x₀)`, `⊥`: countable; no `R_r`, `r ∉ ℕ` | Worked example 2 and L1 acceptance check correct |
| 11 | countable formation-closed ⇒ countable symbols | `f` of arity `k`; `R` of arity `k` | `f(x̄)=f(x̄) ∈ A`, `R(x̄) ∈ A`: injections into `A` | lines 312–313 and §4.2's "no separate countability" correct |
| 12 | `AElementary` | `(ℤ,<) ↪ (ℚ,<)`, `A` generated by density `δ` | `ℤ ⊨ δ` F, `ℚ ⊨ δ` T; identity T↔T | not `A`-elementary, as expected |
| 13 | two-out-of-three | `f ∘ g` and `f` `A`-elementary | `φ(g a) ↔ φ(f(g a)) ↔ φ(a)` | sound |
| 14 | Tarski–Vaught | `ℤ ≤ ℚ`, `δ`, `a = (0,1)` | the only counterexamples lie in `(0,1) ∩ ℚ`, e.g. `½ ∉ ℤ`: the test fails | consistent with row 12 |
| 15 | witness hull, no `Nonempty` | `X = ∅`, nonempty `M`, no constants, `⟨0, ∀x⊥⟩ ∈ A` | `∅ ⊨ ∀x⊥` T, `M ⊨` F; TV forces a witness into `N` | hull nonempty exactly when needed |
| 16 | Löwenheim–Skolem bound | `A = ⊥`, `X = ∅`, `κ > ℵ₀` constants | `|N| = κ`; README `max(ℵ₀,0,0,κ) = κ` T; `max(|A|,|X|) = 0` F | function-symbol term needed; absorbed for Marker's fragments (Def 1.18 (i), (iii)) |
| 17 | `aElementary_iSup`, `ι = ∅` | `M = (ℚ,<)`, `∃x x=x ∈ A` | `⨆ = ⊥ = ∅ ⊭`, `ℚ ⊨` | `[Nonempty ι]` needed, present |
| 18 | `Theoryω.exists_countable_model` | `T = {⊤}`, no constants | without a chosen point the substructure is `∅`; with it nonempty | lines 386–387 right |
| 19 | `Theoryω.Entails.realize` | `T = {φ}`, `M` of size `ℶ₂` in `Type 3` | a countable substructure with a point, `A`-elementary for the fragment of `{φ, ψ}`, carries `¬ψ` down | sound for any universe |
| 20 | `ConsistencyProperty` vs Def 4.1 | C5, C6, C7a–c | `all` at every `L.con c`; `not_all` is C6 via `¬∀¬`; C7a from `eq_subst` and `eq_refl` (Tau Ceti `HenkinComplete.eq_symm`, `TermModel.lean:178`); `eq_name` is C7c | match; `{∅}` fails `eq_refl` at `c₀` |
| 21 | no chain-union clause | the chain of finite subsets in row 7 | each satisfiable, union unsatisfiable | the clause must be absent, as line 436 says |
| 22 | `model_existence`, `s = ∅` | term model | class of `c₀` exists; surjection from `ℕ` | countable, nonempty |
| 23 | omission requests, `p.2 = ∅` | `hreq` at `s` | needs `ψ ∈ ∅`: F | hypotheses inconsistent; matches `OmitsType M ∅` = F |
| 24 | `ofModel` without surjectivity | `M = {0,1}`, `e ≡ 0`, `P = {0}`, `¬∀x P(x)` T | `not_all` needs `c` with `¬P(e c) = ¬P(0)`: F | surjectivity needed, present |
| 25 | `ofSatisfiable`, formation closure | `not_all` adds `¬φ[c]` | `¬φ = φ → ⊥ ∈ A` needs `imp_mem` and `bot_mem` | hypothesis needed, stated |
| 26 | `exists_isolatingFormula`, `(ℚ,<)` | `n = 1`; `n = 2` | one type, `χ = ⊤`; three types, `χ_{(0,1)} ≡ x₀ < x₁` | Worked example 5 correct |
| 27 | same, `M = ∅` | `n = 0`; `n = 1` | one realized type, `χ = ⊤`; no tuple, vacuous | sound |
| 28 | `AElementary.fragmentType_comp` | unfold both sides | `{φ ∈ A ∣ φ(f∘a)} = {φ ∈ A ∣ φ(a)}` by `and_congr_right` | one term: padding (R02) |
| 29 | `Theoryω.exists_countable_model_omitting`, empty type | `p = ∅`, `⊥ → ⊥ ∈ A` | `T ∪ {∃x̄ ⊤}` sat T ⇒ isolated; `OmitsType M ∅` F | `hiso` excludes it, correctly |
| 30 | same, independent predicates | `L = {Pₙ}`, `T = ∅`, `p = {Pₙ(x₀)}`, `A` its formation closure | each `φ ∈ A` mentions finitely many `Pᵢ`; flipping an unmentioned `Pₘ` refutes isolation; `ℕ` with `Pₙ = ℕ∖{n}` omits `p` | sound |
| 31 | same vs notes Theorem 4.9 | `Θₙ = {¬ψ ∣ ψ ∈ pₙ}` | notes hypothesis ⇔ `¬IsolatesIn A T pₙ`; `T + ⋀ₙ ∀v̄ ⋁Θₙ` sat ⇔ omission | match; `¬ψ ∈ A` by formation closure |
| 32 | `IsolatesFO`, `OmitsFOType` | `p = ∅`; `p = {⊥}`; `n = 0`, `p = {ψ}` | `⊤` isolates `∅`, which no structure omits; `{⊥}` not isolated, omitted by all; `{ψ}` omitted iff `M ⊭ ψ` | the classical notions |
| 33 | `exists_countable_model_omitting_fo` | `T = {⊥}`; `T = Th(ℕ,0,S)`, `p = {x ≠ Sⁿ0 : n}` | `{⊥}`: `hiso` T, conclusion F, so `hsat` is needed; definable sets are finite or cofinite, so an isolator has no standard solution, is empty, and is inconsistent: `p` not isolated; `ℕ` omits `p` | sound |
| 34 | `exists_firstOrder_presentation`, wrong model | `φ = ⋀ₖ φₖ`, all `φₖ` T at `a`; `S`: `R_φ(a)` F, `R_{φₖ}(a)` T | the axioms `R_φ → R_{φₖ}` hold, but `a` realizes `{¬R_φ} ∪ {R_{φₖ}}` | the types are necessary; the iff is right |
| 35 | same, `M = ∅` | `n ≥ 1`; `n = 0` | `Fin n → ∅` empty, relations equal; 0-ary `R_φ` fixed by the axioms (`∀` true in `∅`) | sound |
| 36 | same vs Theorem 1.31 | axioms i)–vii) | the README table is i), iii), iv), vi) (corrected), with implication for `¬`; countable `A` suffices without countable `τ` | stronger in the language, same proof |
| 37 | `craig_interpolation` | `φ` unsat; `ψ` valid; `φ = P(c)`, `ψ = ∃x P(x)` | `⊥`, `⊤` with empty symbol sets; `θ = ∃xP(x)`, `functionsIn θ = ∅ ⊆ {c} ∩ ∅` | sound; Theorem 4.21 also bounds function and constant symbols |
| 38 | `craig_interpolation_relational` | from `craig_interpolation` | `(craig_interpolation φ ψ h).imp fun _ h => h.2` elaborates | special case: padding (R02) |
| 39 | `pcSeparation`, `Θ₁ = Θ₂` | no countable nonempty member | no nonempty member at all (Löwenheim–Skolem); `θ = ⊥` | consistent |
| 40 | `pcSeparation`, parity | Worked example 7 | even: swap T at 2, no fixed-point-free involution at 3; odd: `(12)(3)` T at 3, none at 2; `θ = ⋁ₙ` "exactly `2n`" | correct |
| 41 | `pcSeparation`, `Type`-only hypothesis | uncountable common member in `Type w` | `{Θ₁⁺, Θ₂⁺}` sat ⇒ countable model in `Type` ⇒ countable common member | hypothesis suffices (notes line 1728 uses the same step) |
| 42 | `relationsInSigned` | `¬R`; `R → R`; `t = t`; `∃x R(x)` | (pos, neg) = (`∅`,`{R}`); (`{R}`,`{R}`); (`∅`,`∅`); (`{R}`,`∅`); `pos ∪ neg = relationsIn` on each | López-Escobar polarity |
| 43 | `lyndon_interpolation` | `φ = ∀x(P→Q) ∧ ∃xP`, `ψ = ∃xQ` | `φ`: pos `{P,Q}`, neg `{P}`; `θ = ∃xQ`: pos `{Q}` ⊆ `{P,Q} ∩ {Q}`, neg `∅` | sound |
| 44 | `universalSigned` | `∀xR`; `∃xR`; `⋀ᵢ ∃x θᵢ` | (univ, exist) = (T,F); (F,T); (F,T) | `∀₁`/`∃₁`, as §7.4 states |
| 45 | `malitz_interpolation` | `φ = ∀xP ∧ ∃xQ`, `ψ = ∀xP`; `ψ = ⊤` | `θ = ∀xP`, universal T, `relationsIn {P}`; `θ = ⊤` universal, `∅` | sound |
| 46 | Layer 8 family without reserve | `φ`: strict linear order with a maximum; `σ = {∀x(lt(x,d₀) ∨ x=d₀)}` | `M = α+1`, `d₀ ↦ α`, `α ≤ b₁` T; adding `d₁` needs `b₂ ≥ b₁ + α > b₁ = max` for `α ≥ 1`: none | README's counterexample right |
| 47 | Layer 8 placement | `α = 0`; `α = ω`; first position | `β = 2`: `p = bᵢ+1`, `p < bᵢ+2 ≤ bᵢ₊₁`; `β = ω·2+1`: `p = bᵢ+ω+1`, `p+ω = bᵢ+ω·2 < bᵢ+β`; first: `p = α`, `α+α < β ≤ b₁`; right end `(bₙ+α+1)+α < bₙ+β < γ` | arithmetic correct |

**Tau Ceti declarations opened at `2fd255d`**, beyond those in the sample table:
- **Satisfiability and isolation:** `Theoryω.IsolatesIn` (`ModelExistence/Isolation.lean:71`) and `OmitsType` (`Infinitary/Theory.lean:160`).
- **Model existence:** `ConsistencyProperty` (`ModelExistence/ConsistencyProperty.lean:80`, all fourteen fields) and `HenkinComplete`, `truth_pos`, `truth_neg` (`ModelExistence/TermModel.lean:92/416/425`).
- **Projective classes:** `LHom.PCMem` (`Interpolation/PCClass.lean:76`) and `pcMem_iff`/`pcMem_id_iff`/`pcMem_comp_iff`/`pcMem_sumInl_inf_iff`/`pcMem_sumInl_sup_iff` (`PCClass.lean:239/103/120/175/194`).
- **Graph translation:** `GraphRelation` (`Infinitary/GraphTranslation/Language.lean:72`), `relSym_inter` (`:217`), `graphExpansion` (`:230`); `realize_relationalize` and `relationsIn_relationalize` (`GraphTranslation/Relationalize.lean:284/302`); `graphAxioms`, `reconstructStructure` and `realize_relationalize_reconstructStructure` (`GraphTranslation/Reconstruct.lean:161/248/294`); `backTranslate` and `realize_backTranslate` (`GraphTranslation/BackTranslate.lean:114/89`).
- **Well-ordering:** `RelChain`, `RelChain.not_wellFounded`, `RelChain.injective_of_irreflexive` and `HasWellOrderedChains` (`WellOrdering.lean:91/100/108/120`).

Every name in the "Tau Ceti implementation" table resolves at the pin.

**Mathlib declarations opened at `1b1ccf4`:**
- **Semantics and satisfiability:** `LHom.realize_onBoundedFormula` (`ModelTheory/Semantics.lean:508`), `Theory.IsSatisfiable` (`Satisfiability.lean:66`), `isSatisfiable_iff_isFinitelySatisfiable` (`:101`), `ModelsBoundedFormula` (`:279`), `models_iff_not_satisfiable` (`:297`) and `Theory.ModelType` (`Bundled.lean:73`).
- **Language maps:** `LHom.sumInl` (`LanguageMap.lean:84`), `sumMap` (`:165`), `LHom.Injective` (`:180`), `defaultExpansion` (`:187`), `LEquiv` (`:280`) and `withConstants` (`:382`).
- **Syntax:** `BoundedFormula.constantsVarsEquiv` (`Syntax.lean:603`) and `toFormula` (`:608`).
- **Löwenheim–Skolem and set theory:** `exists_elementarySubstructure_card_eq` (`Skolem.lean:126`) and `Cardinal.isRegular_aleph_one` (`SetTheory/Cardinal/Regular.lean:88`).

**Ownership and overlaps.**
- `roadmaps grep --fixed -i` over main and the 438 open heads finds `IsolatesFO`, `OmitsFOType`, `exists_firstOrder_presentation`, `relationsInSigned`, `universalSigned`, `malitz_interpolation`, `lyndon_interpolation`, `craig_interpolation` and `exists_countable_model_omitting` only in this roadmap and its main copy.
- `theorem pcSeparation` occurs here and in CountableStructureSpaces (head `31039c3`, `Suggested.lean:438`). That copy is a stand-in marked "Owner: the InfinitaryModelExistence roadmap … Checked against revision 35db8dff". It lives in namespace `TauCetiRoadmap.CountableStructureSpaces`, so it is not a duplicate fully qualified name, and its signature is identical to `Suggested.lean:186–196`.
- HanfNumbers (head `2dc7d39`, `Suggested.lean:514`) consumes Layer 6 through Tau Ceti's `graphLanguage`, as the new bullet at `README.md:147–150` says.
- CountableModelCounting (head `8584c5d`, `Suggested.lean:33`) cites `fragmentType` and `Fragment.slice` by name, consistent with `README.md:155–160`.
- `overlaps.md`: no other pull request changes this roadmap, and no cited id is dropped.

## Not verifiable

- **Marker 2016** (CUP, Lecture Notes in Logic 46): its chapter attributions are behind a paywall. Every claim also carries the exact locator in the author's 2013 notes, which I checked.
- **Keisler 1971** and **Malitz 1969**: no legal copy was looked for beyond the DOI. No statement depends on their exact text.
- **Gao 2009**: not consulted; it is cited only for comparison with Layer 1.
- **Harrison-Trainor–Kretschmer 2024, Theorem 4.5, p. 1831**, and **López-Escobar 1965, Theorem 4.1, p. 267**: not re-read in this round, since §§7.3–7.4 are outside the seeded sample. The previous review checked both, against arXiv 2209.05615v3 and the open scan.
- **Tau Ceti `d2083f0`** and **`cameronfreer/infinitary-logic` at `518a366`**: unpinned, not consulted (R04).

## Source issues

- **Error** in marker2013 at the proof of Theorem 4.27, condition (*) and clause C7c, printed pp. 52–53: the source says the initial and intermediate gaps make Σ a consistency property, and places a new rational only between two named ones; it should also reserve room after the last named position and place rationals below or above all named ones; affects the proof.
- **Misprint** in marker2013 at the proof of Theorem 1.31, clause vi), printed p. 12: the axiom for a universal formula carries a spurious inner universal quantifier over the outer variables; it should be `∀v (R_φ ↔ ∀w R_θ)`; affects nothing.
- **Misprint** in marker2013 at the proof of Corollary 4.23, printed p. 50: the two vocabularies are introduced with indices 0 and 1, but the disjointness assumption is written with indices 1 and 2; it should read `τ0 ∩ τ1 = τ`; affects nothing.
- **Misprint** in marker2013 at the proof of Theorem 4.27, clause C7c, printed p. 52: the named rationals are indexed from `i0`, while (*) indexes them from `i1`; it should read `i1 < … < im`; affects nothing.
