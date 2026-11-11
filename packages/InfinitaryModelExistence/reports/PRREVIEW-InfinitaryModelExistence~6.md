# Review of InfinitaryModelExistence (pull request #1615 at 6601a3b)

**Verdict:** needs changes

## R01 (P3) — Padding: four declarations restate the library or another theorem of the file

**Location:** `Suggested.lean:61–74` `model_existence_omitting`; 85–94 `fragmentType`, `AElementary.fragmentType_comp`; 165–169 `craig_interpolation_relational`. `README.md:1036–1037`: "states only the targets the pin lacks, together with `model_existence_omitting`".

**Claim:** `Suggested.lean` states headline theorems only. An adapter over a library theorem, an unfolded library definition and a special case of another headline in the file are padding.

**Witness:** `model_existence_omitting` and `fragmentType_comp` are proved, without `sorry`, from Tau Ceti `ModelExistence/ModelExistence.lean:197` and `ModelExistence/AElementary.lean:65`. `(craig_interpolation φ ψ h).imp fun _ h => h.2` proves `craig_interpolation_relational` (scratch copy, exit 0).

**Repair:**
- **`Suggested.lean`:** delete lines 49–77 (the Layer 3 comment and the whole `section ModelExistence`), lines 84–95 and lines 163–170, and the imports `TauCeti.ModelTheory.ModelExistence.AElementary` and `TauCeti.ModelTheory.ModelExistence.ModelExistence`.
- **Module docstring:** end the sentence at line 32 with "This file states the targets the pin lacks." and delete the rest of it, through line 34.
- **Docstring of `craig_interpolation`:** name `craig_interpolation_relational` as the same statement under `[L.IsRelational]`, without the function-symbol bound, as the docstring of `lyndon_interpolation` does for its relational core.
- **`README.md:1036`:** end the sentence at "states only the targets the pin lacks."
- **`README.md:1054–1056`:** drop `fragmentType`, `AElementary.fragmentType_comp` and `craig_interpolation_relational` from the list.
- **`README.md:501`:** write "an `A`-elementary embedding preserves `A`-types" without the name.
- **Tested:** the trimmed copy elaborates with 7 `sorry` warnings and nothing else. The gate's `readme_identifiers_missing` on it, with the README edited at 1036 and 1054–1056, returns `[]`.

## R02 (P3) — Ten theorem names are presented as targets but exist nowhere

**Location:** `README.md:373`, 375 `aElementary_of_cocone`, `aElementary_directLimit_of`; 595 `morleyTheory_countable`, `morleyTypes_countable`; 660, 700 `entails_iff_graphTranslation`; 704, 708 `craig_pcSeparation`, `craig_pcSeparation_relational`; 757 `realize_mono_of_signed`; 768 `craig_of_lyndon_interpolation`; 784 `IsUniversal.realize_of_embedding`.

**Claim:** a backticked Lean name in an API bullet is declared in `Suggested.lean` or is a supplier declaration at the pins.

**Witness:** a word-boundary `grep` of each name over `Suggested.lean`, Tau Ceti `2fd255d` and Mathlib `1b1ccf4` finds none of them. The citation resolver also lists `IsUniversal.realize_of_embedding` (line 784) as found nowhere.

**Repair:** state each fact in prose without the name. For example: "the Morley theory and the Morley types are countable for countable `A`, with no countability of the language". Names that Tau Ceti declares at the pin stay as they are.

## R03 (P3) — No `**Checks.**` lists and no `*Needs:*` lines

**Location:** every subsection of Layers 0–8, for example `README.md:281` "### 1.2 Fragments" and `README.md:513` "### 4.2 Isolation over a theory and omitting types".

**Claim:** every definition carries at least three discriminating Checks, and every target its dependencies item by item.

**Witness:** in the README, `grep -c '\*\*Checks\.\*\*'` returns 0 and `grep -c '\*Needs:\*'` returns 0. The table at lines 57–67 gives dependencies per layer only.

**Repair:** add a `**Checks.**` list under each definition and a `*Needs:*` line under each target. The previous report's blocks still apply. For example, under §4.2 add these Checks, computed in row 11:
- the empty type is isolated by `⊤` when `T` is satisfiable, and no structure omits it;
- `{⊥}` is isolated by nothing, and every structure omits it;
- at `n = 0`, `{ψ}` is omitted exactly when `M ⊭ ψ`;
- in `Th(ℕ, 0, S)`, `{x ≠ Sⁿ0}` is not isolated, and `ℕ` omits it.

Under `Theoryω.exists_countable_model_omitting` add: "*Needs:* Tau Ceti `ConsistencyProperty.model_existence_omitting` (3.2), `ConsistencyProperty.ofSatisfiable` (3.3), `Fragment.FormationClosed` (1.2), `FirstOrder.Language.Theoryω.exists_countable_model` (2.5)."

## R04 (P3) — A claim about an unpinned Tau Ceti commit, naming a declaration absent at the pin

**Location:** `README.md:1058–1062`, "Tau Ceti commit `d2083f0` has declarations for all of them except … stated as `model_morleyTheory_and_omitsType_iff_eq_morleyExpansion`; its `pcSeparation`, in `Interpolation/Craig.lean`, takes …".

**Claim:** the README describes the library at the revision this repository pins.

**Witness:** `lake-manifest.json` pins Tau Ceti `2fd255d997…`. At that revision `TauCeti/ModelTheory/Interpolation/` holds only `PCClass.lean`, and none of `model_morleyTheory_and_omitsType_iff_eq_morleyExpansion`, `craig_interpolation` or `pcSeparation` occurs in the pinned `TauCeti/ModelTheory`.

**Repair:** delete the sentence from "Tau Ceti commit `d2083f0`" through "rather than in `Type`."

## R05 (P3) — Pull-request links for two sibling roadmaps

**Location:** `README.md:129–130`, "**CountableStructureSpaces** (proposed in [#1316](…/pull/1316))"; `README.md:134`, "**HanfNumbers** (proposed in [#1319](…/pull/1319))".

**Claim:** cross-roadmap citations name the roadmap and its section or target, never a pull-request number.

**Witness:** `roadmaps list` shows both as open new-roadmap pull requests (#1316 at `cf843fd`, #1319 at `2dc7d39`). These links go stale when the pull requests merge.

**Repair:** delete both parentheticals "(proposed in […])". Keep the bold names unlinked until the folders are on main.

## R06 (P3) — Chapter-level locator in a `Suggested.lean` docstring

**Location:** `Suggested.lean:138–139`, "**Layer 5 milestone, the first-order presentation of a countable fragment** (Marker 2016, Chapter 1)."

**Claim:** each headline carries an exact locator into a legal text.

**Witness:** the 2016 book is paywalled and cited by chapter only. `README.md:597–598` gives Theorem 1.31 and Exercise 1.32 of the 2013 notes. These are marker2013 line 356 (p. 11) and line 387 (p. 12).

**Repair:** replace the parenthetical with "(Theorem 1.31 and Exercise 1.32 of Marker's 2013 notes, pp. 11–12)".

## R07 (P3) — The description has two sentences that this head contradicts

**Location:** the description has two such passages:
- "Revisions after the 1–2 November review": "(§4.4: Theorem 4.27, Corollary 4.28, and the proof of 4.27, pp. 51–52)";
- "**Projective classes and PC separation** (Layer 7, README and the `PCMem`/`pcSeparation` docstrings)".

**Claim:** the pull request's text agrees with the head.

**Witness:**
- `README.md:1078–1079` puts the proof of 4.27 on pp. 52–53, and it ends at marker2013 line 1777 (p. 53). The description's own later bullet also says pp. 52–53.
- `Suggested.lean` declares no `PCMem`. `README.md:1050` uses Tau Ceti's `LHom.PCMem`.

**Repair:**
- Replace "and the proof of 4.27, pp. 51–52" with "Theorem 4.27 on p. 51, Corollary 4.28 on p. 52, and the proof of 4.27 on pp. 52–53".
- Replace "the `PCMem`/`pcSeparation` docstrings" with "the `pcSeparation` docstring; `PCMem` is Tau Ceti's `LHom.PCMem`".

## Previous findings

- R01 — repaired: lines 269, 382, 388, 725, 1044 and 1045 now write "`FirstOrder.Language.Theoryω.realize_conjunction_iff`", "`…exists_countable_model`", "`…entails_iff_countable`" and "`…entails_iff_not_isSatisfiable`". The gate reports `readme-ids-missing=0`.
- R02 — not repaired: `Suggested.lean` is unchanged since `35db8df`. It still has `model_existence_omitting` (line 61), `AElementary.fragmentType_comp` (91) and `craig_interpolation_relational` (165). Now R01.
- R03 — not repaired: "`aElementary_of_cocone`: for a directed system of `A`-elementary transition embeddings …" (line 373), and the nine other names at the same lines. Now R02.
- R04 — not repaired: "Tau Ceti commit `d2083f0` has declarations for all of them except the three first-order omitting-types items, Lyndon and Malitz" (line 1058). Now R04.
- R05 — not repaired: "**CountableStructureSpaces** (proposed in [#1316](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1316))" (lines 129–130). Now R05.
- R06 — not repaired: no `**Checks.**` list and no `*Needs:*` line; both counts are 0. Now R03.
- R07 — not repaired: "(Marker 2016, Chapter 1)" (`Suggested.lean:138–139`). Now R06.

## Verified sound

T/F are truth values.

| # | Statement | Instances tried | Values computed, each side | Result |
|---|---|---|---|---|
| 1 | `FirstOrder.Language.Theoryω.exists_countable_model` (README:382, 725) | `T = ∅` over `Language.empty`, target `Type` and `Type 3`; `T = {⊥}` | scratch term elaborates in both universes; `{⊥}`: `IsSatisfiable` F, conclusion F | matches Tau Ceti `CountableModel.lean:125`, "every universe" |
| 2 | `…Theoryω.entails_iff_countable` (README:388) | `T = ∅`, `φ = ⊥`; `φ = ⊤` | `⊥`: Entails F (PUnit), right side F (PUnit); `⊤`: T, T | `hT : T.Countable`, `M : Type w` free, as stated (`:141`) |
| 3 | `…Theoryω.realize_conjunction_iff` (README:269) | `T = ∅`; `T = {φ, ψ}` | empty `iInfAlong` realized T ↔ `∅.Model M` T; `φ ∧ ψ` ↔ model of both | needs `hT`, stated as "for countable `T`" (`Theory.lean:148`) |
| 4 | `…Theoryω.entails_iff_not_isSatisfiable` (README:1044) | `T = ∅`, `φ = ⊤`; `φ = ⊥` | T ↔ ¬Sat{¬⊤} = T; F ↔ ¬Sat{¬⊥} = F | both directions agree (`Satisfiability.lean:150`) |
| 5 | §7.2 route, step (1) (README:722–727) | `L` empty, `L₁ = L₂ = {f}`; `Θ₁`: `f` a fixed-point-free involution; `Θ₂`: `f = id` | unrenamed `Θ₁ ∧ Θ₂` unsat on nonempty; renamed `Θ₁⁺ ∧ Θ₂⁺` sat on `{0,1}`; `{0,1}` in both classes, `h` F | renaming apart needed, as stated; `{Θ₁⁺ ∧ Θ₂⁺}` countable, so the cited theorem applies |
| 6 | `pcSeparation` vs Corollary 4.23 | marker2013 lines 1666–1674 (p. 50), 1728–1729 (p. 51) | notes: disjoint PC classes give an interpolant; README: disjoint on countable nonempty members, with Löwenheim–Skolem | locator correct; route matches |
| 7 | `model_existence_omitting` (R01) | `P = ∅`; the head's proof, lines 70–74 | `P = ∅`: Tau Ceti's theorem with empty `ι`, i.e. model existence; the proof elaborates with no `sorry` | adapter: padding |
| 8 | `AElementary.fragmentType_comp` (R01) | `f = id`; `(ℤ,<) ↪ (ℚ,<)`, `n = 0`, `A` containing density `δ` | id: both sides `fragmentType A N a`; `δ` ∈ left (ℚ ⊨ δ T), ∉ right (ℤ ⊨ δ F) | `hf` needed; one term at line 94: padding |
| 9 | `craig_interpolation_relational` (R01) | one-term proof; `φ = ⊥` | `(craig_interpolation φ ψ h).imp fun _ h => h.2` elaborates; `θ = ⊥`, `relationsIn ⊥ = ∅` | special case of `craig_interpolation`: padding |
| 10 | `exists_firstOrder_presentation` docstring (R06) | marker2013 lines 356, 387 | Theorem 1.31 p. 11, Exercise 1.32 p. 12; docstring: "Marker 2016, Chapter 1" only | README:597 exact, docstring coarse |
| 11 | `IsolatesFO`, `OmitsFOType` (R03 Checks) | `p = ∅`; `p = {⊥}` | `∅`: isolated by `⊤` T, omitted F (a tuple exists); `{⊥}`: isolated F, omitted T | the proposed Checks discriminate |

The rows for untouched statements stand as in the previous review, of `35db8df`.

- **Gate** (my run at `6601a3b`): `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run adds `build=0`.
- **Elaboration:** `lake env lean TauCetiRoadmap/InfinitaryModelExistence/Suggested.lean` exits 0. It gives exactly 8 `declaration uses sorry` warnings, at lines 98, 122, 144, 165, 173, 186, 213 and 236. The file is unchanged since `35db8df`, so the 15 `#check @` signatures stand.
- **Dependency check** (exact output): `depcheck: 207 roadmaps, 1914 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- **Library declarations opened:** 4 at Tau Ceti `2fd255d`: `CountableModel.lean:125/141`, `Infinitary/Satisfiability.lean:150` and `Infinitary/Theory.lean:148`, all in `namespace FirstOrder.Language.Theoryω`. `#check @` of each in a scratch file matches README:269/382/388/1044.
- **Source locators checked:** 6 in marker2013 (author's copy, through the sources service):
  - Corollary 4.23, p. 50 (line 1666);
  - Löwenheim–Skolem step, p. 51 (lines 1728–1729);
  - Theorem 1.31, p. 11 (line 356);
  - Exercise 1.32, p. 12 (line 387);
  - Theorem 4.27, p. 51 (line 1734);
  - end of the proof of 4.27, p. 53 (line 1777).
- **Cross-roadmap citations resolved:** 3.
  - CountableStructureSpaces (head `cf843fd`, `Suggested.lean:439`) has a `pcSeparation` identical to `Suggested.lean:186–196`.
  - HanfNumbers (README:182) and CountableModelCounting (README:335) cite Tau Ceti's `Theoryω.realize_conjunction_iff`, which is unaffected.
  - `overlaps.md` lists nothing, and no other open pull request changes this roadmap.
- **Pull request text:** checked against the head, sentence by sentence; two sentences are contradicted (R07). It states the Tau Ceti rewrite of `Suggested.lean`, the removed declarations and the one added theorem with its predicate. No change is outside the folder.
- **Remark (no change asked):** README:1044–1045 now qualify these four names while the other `Theoryω.…` names in the same cells stay short. That is what the gate needs.

## Not verifiable

- Marker 2016 (CUP, Lecture Notes in Logic 46): paywalled. Every claim in the changed passages also carries a locator in the 2013 notes, which I checked.
- Keisler 1971, Malitz 1969, López-Escobar 1965, Harrison-Trainor–Kretschmer 2024 and Gao 2009: not cited by the changed passages, so not re-read this round.
- Tau Ceti `d2083f0` and `cameronfreer/infinitary-logic` at `518a366`: not pinned, so not consulted (R04).

## Source issues

- **Misprint** in marker2013 at the proof of Corollary 4.23, printed p. 50: the source introduces the two vocabularies with indices 0 and 1 but writes the disjointness assumption with indices 1 and 2; it should state that the vocabularies indexed 0 and 1 meet exactly in `τ`; affects nothing.
