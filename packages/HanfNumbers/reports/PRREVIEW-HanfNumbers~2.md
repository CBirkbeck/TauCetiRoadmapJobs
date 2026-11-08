# Review of HanfNumbers (pull request #1319 at d590c4e)
**Verdict:** needs changes

Incremental re-review of the 31 lines changed since 41959b5 (the supplier-table row for the Scott-sentence contracts, the zero-colour convention of `PartitionRel`, the source universe of `exists_emModel` and `exists_emModel_card_eq`, and the module docstring), together with the gate, the elaboration and every previous finding. Three of the eleven previous findings are repaired or partly repaired; the other eight were left unchanged by the author's stated choice and are carried below. No pull-request file was changed.

## R01 (P1) — The build gate still fails

**Location:** `TauCetiRoadmap/HanfNumbers/Suggested.lean:1`–`2` and the worker's gate at this head.

**Claim:** The folder is ready for its acceptance build.

**Witness:** The gate reports `build=2 FAIL`: the module-system warning for this file and for `Completed/InfinitaryLogic/Suggested.lean`, which it imports. Direct elaboration exits 0 with exactly 32 admission warnings, so this is a gate failure, not a type error. Carried from the previous report's R01.

**Repair:** As before: drop the prototype import (R02 below) and give the retained native statements a module-system-compatible header, so that the targeted build returns `build=0` with only admission warnings. Do not edit the supplier prototype.

## R02 (P2) — Suggested.lean still imports the parent prototype and keeps three copied stand-ins

**Location:** `TauCetiRoadmap/HanfNumbers/Suggested.lean:2` (`import Completed.InfinitaryLogic.Suggested`), `:21`–`:24`, `:471`, `:477`.

**Claim:** The infinitary headlines are stated against carriers available at the pins.

**Witness:** The gate reports `imports=1`. The pinned Tau Ceti has no infinitary model theory at all: `TauCeti/ModelTheory/` at `358314d` contains only `Algebra`. The elaborated signatures of `exists_emModel` and `exists_emModel_card_eq` use `TauCetiRoadmap.InfinitaryLogic.BoundedFormulaω` and `SentenceInf.Realize` from the prototype, and `onBoundedFormulaInf`, `infinitaryType` and `realizedTypes` copy InfinitaryModelExistence's definitions. Carried from the previous report's R04; the author's description says the import is kept by choice.

**Repair:** Delete the import and the three copies. Keep the native partition-calculus, ordered-field and first-order omitting-types headlines with the simple definitions they need. Name each infinitary headline that is not statable at the pins in the module docstring, with the carrier it lacks, and state nothing in its place. The native omitting-types probe of the previous review shows the first-order theorem survives without the import.

## R03 (P3) — Cite the Scott-sentence suppliers by the parent's contracts, not by names at a later Tau Ceti revision

**Location:** `TauCetiRoadmap/HanfNumbers/README.md:130`, `:811`–`:815`, `:842`; `Suggested.lean:14`–`:17`.

**Claim:** `TauCeti.bfEquiv_of_realize_scottSentence`, `TauCeti.potentialIso_iff_bfEquiv_all` and `TauCeti.PotentialIso.infEquivAt` are the supplier declarations of the §5.4 route.

**Witness:** None of the three exists at the pinned Tau Ceti (`TauCeti/ModelTheory/` holds only `Algebra`). The table row now also names the parent's contracts, which do exist on main: `Completed/InfinitaryLogic/README.md:590`–`:599` (`scottSentenceAt`, `realize_scottSentenceAt_self`, `isTupleBFSystem_of_realize_scottSentenceAt`, in any model `N`) and `:444`, `:470` (`potentialIso_iff_exists_isTupleBFSystem`, `karp_theorem`). Line 811–815 and the API warning at line 842 still give only the later-revision names. Partly repaired previous R02: the owner is now identified, so the citation is no longer unowned.

**Repair:** In §5.4 and the API warning, cite the parent's Layer 3 and Layer 1 contracts by the names above, and drop the names that exist only at revision 85f3eb5 from the table, the route and the docstring: a library declaration is cited at the pin, and a roadmap contract by roadmap and section. The route is unchanged: the Scott sentence at the stabilizing level, its self-satisfaction, tuple systems in any model, then potential isomorphism and Karp's forward direction.

## R04 (P3) — Delete the option override

**Location:** `TauCetiRoadmap/HanfNumbers/Suggested.lean:28`: `set_option autoImplicit false`.

**Claim:** The file follows the required Lean form.

**Witness:** The gate reports `set_option=1`. Carried from the previous report's R06; the previous padding probe elaborated without the line.

**Repair:** Delete the line.

## R05 (P3) — Delete the Check and elementary-API padding

**Location:** `TauCetiRoadmap/HanfNumbers/Suggested.lean:485` (`isLω₁ωSmall_of_countable`), `:180` (`isIndiscernibleOn_morleySeed`), and the API-only targets at `:66`, `:76`, `:87`, `:140`, `:165`, `:362`, `:399`.

**Claim:** These are acceptance-test milestones.

**Witness:** Countable smallness closed with one `exact Set.countable_range` application in the previous review's probe; the seed theorem is the Layer 1 worked example (README lines 345 and 845). Carried from the previous report's R07.

**Repair:** Delete them from `Suggested.lean`; the README keeps the statements.

## R06 (P3) — Give each target a locator and record the sources

**Location:** `TauCetiRoadmap/HanfNumbers/README.md:209`, `:393`, `:566`, `:789`, `:1006`; the folder and board package have no `sources.toml`.

**Claim:** The references let a reader verify each target.

**Witness:** No seeded target subsection attaches a theorem or page to its principal claim; Marker is cited by chapter only. Carried from the previous report's R08, unchanged at this head.

**Repair:** Add locators at the claims (the previous report lists usable starting points in the 2013 Marker notes and in Erdős–Rado) and add the `sources.toml` entries.

## R07 (P3) — Supply the Checks, Needs lines and layer endings

**Location:** `TauCetiRoadmap/HanfNumbers/README.md:209`, `:321`, `:393`, `:537`, `:759`.

**Claim:** Every definition has three discriminating Checks and every target its dependencies.

**Witness:** Zero `**Checks.**` blocks, zero `*Needs:*` lines, no `### Examples` or `### Dependencies` sections. The new zero-colour prose at line 218–224 computes the right values (see the table) but is not a Checks list for `PartitionRel`. Carried from the previous report's R09.

**Repair:** As before: three Checks per definition (for `PartitionRel`: `0 → (0)¹_0` true, `0 → (0)⁰_0` true, `2 → (2)¹_2` false), per-target `*Needs:*` lines, and the layer endings.

## R08 (P3) — Remove the TeX, the process narrative and the pin reference

**Location:** `TauCetiRoadmap/HanfNumbers/README.md:467`, `:510` (TeX), `:940`, `:962`, `:1043` (`checkpoint`), `:131` (a pull-request number), and `Suggested.lean:16`–`:17` (“later than this repository's Tau Ceti pin `358314d`”).

**Claim:** The document is timeless Unicode prose.

**Witness:** The gate reports `tex=2` and `residue=3`, unchanged. The new docstring sentence ties the file to the current pin, which a reader a year from now cannot interpret. Carried from the previous report's R10, with the docstring sentence new at this head.

**Repair:** Write the two bounds as inline code (`|E| ≤ max(ℵ₀, |J|, |L'_fun|)`), drop “checkpoint” and the pull-request numbers, and replace the pin sentence by the list of headlines not statable at the pins (R02).

## R09 (P3) — Own-name claims without declarations

**Location:** `TauCetiRoadmap/HanfNumbers/README.md:541`, `:639`, `:685`, `:811` and the gate's ten `readme-ids-missing` entries.

**Claim:** Every backticked own name is declared in `Suggested.lean`.

**Witness:** The ten entries are unchanged at this head (`hanfNumber_le_iff_isHanfBound`, `isEMSource_em`, `isCompleteSentence_scottSentence`, …). Carried from the previous report's R11.

**Repair:** State the facts in prose without the name; do not add declarations. Make the external-provenance names (`morleySeed_indiscernibleOn`, `hasArbLargeModels_of_seed_realizability`, `Lomega1omegaHanfNumber_eq_beth_omega1`) and the IME-supplied `onBoundedFormulaInf_substBounds` unambiguous as not this roadmap's own.

## Previous findings

- R01 — not repaired: the gate still reports `build=2 FAIL` (module-system warnings for this file and the imported prototype); the author's description defers the migration. Re-raised as R01.
- R02 — partly repaired: the table row now names the parent's Layer 3 and Layer 1 contracts, which exist on main; §5.4 and the API warning still cite `TauCeti.bfEquiv_of_realize_scottSentence` and two other names absent at the pin. Re-raised as R03 (P3).
- R03 — repaired: “This agrees with Erdős and Rado's relation for `μ ≥ 1`. At `μ = 0` it does not … `0 → (0)¹_0` holds here and fails for them” (README 218–224, docstrings at Lean 55–59 and 64–65); every value verified below.
- R04 — not repaired: `import Completed.InfinitaryLogic.Suggested` and the three stand-ins remain. Re-raised as R02.
- R05 — repaired: `{N : Type u''}` in both stretching theorems; elaborated types show `N : Type u_2` and `J : Type u_1` independent, and the cross-universe instances below elaborate.
- R06 — not repaired: `set_option autoImplicit false` at line 28. Re-raised as R04.
- R07 — not repaired: the padding declarations are unchanged. Re-raised as R05.
- R08 — not repaired: no locators or `sources.toml` added. Re-raised as R06.
- R09 — not repaired: no Checks, Needs lines or layer endings. Re-raised as R07.
- R10 — not repaired: `tex=2`, `residue=3`; a pin hash was added to the docstring. Re-raised as R08.
- R11 — not repaired: `readme-ids-missing=10`. Re-raised as R09.

## Verified sound

**Gate at this head** (worker's run, data): `set_option=1 tex=2 residue=3 imports=1 readme-ids-missing=10 build=2 FAIL`; every other counter 0, including `sorry-data`, `stray-files`, `outside-folder`, `depcheck`, `prnum`. The diff outside the folder is empty. The worktree is clean.

**Elaboration.** `lake env lean TauCetiRoadmap/HanfNumbers/Suggested.lean` from the pull-request worktree: exit 0, exactly 32 `declaration uses 'sorry'` warnings, nothing else. A scratch file importing the module and printing `#check @` for `PartitionRel`, `partitionRel_iff_finset`, `IsEMSource`, `exists_emModel`, `exists_emModel_card_eq`, `templateOf` and `EMTemplate.RealizesOn` elaborated; the elaborated types agree with the README statements at lines 216–224 and 504–519. In the same file, `exists_emModel h J` elaborates with `N : Type 1` and `J : Type`, with `N : Type 1` and `J : Type 2`, and `exists_emModel_card_eq h ha J` with `N : Type 3` and `J : Type`. The universe name `u''` is also used by the Approximation section's language, in a separate section; the elaborated statements carry distinct universe parameters for `N` and `J`. The cardinality bound `max ℵ₀ (max #J (lift #(Σ n, L'.Functions n)))` has no term in `N`, so the universe generalisation changes no value.

**Zero-colour probe** (scratch, elaborated): `PartitionRel.{0} 0 0 1 0` proved (take `H = ∅`; homogeneity is vacuous because `s 0 ∈ ∅` is false), and `PartitionRel.{0} 0 0 0 0` proved (`#D ≤ 0` makes `D` empty, `OrderEmbedding.ofIsEmpty : Fin 0 ↪o J` is a tuple, so no colouring `c` exists), confirming both README sentences.

**Dependency check:**

```text
depcheck: 234 roadmaps, 2129 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. HanfNumbers is at merge-order line 379; InfinitaryModelExistence and InfinitaryLogic are on main.

**Adversarial table.** New rows for the changed statements; the rows for the untouched statements are carried from the previous report's 107-row table, cited by group.

| Statement / convention | Instances tried | Values computed on the two sides | Result / change |
| --- | --- | --- | --- |
| `PartitionRel` at zero colours, arity 1 | (κ,λ,n,μ) = (0,0,1,0) | Here: `J = ∅`, `D = ∅`, the empty colouring exists, `H = ∅` has `0 ≤ 0` and is homogeneous: T (proved in scratch). Erdős–Rado (`ed3b7345… line 114`–`118`, printed p. 429): needs `ν < k = 0`: F | Matches README 221–222. |
| `PartitionRel` at zero colours, arity 0 | (0,0,0,0) | Here: `Fin 0 ↪o J` inhabited, `D` empty, no colouring, vacuous T (proved). Erdős–Rado: `[S]⁰ = {∅}` is not the empty sum, hypothesis fails, vacuous T | Matches README 222–223. |
| Agreement for `μ ≥ 1` | (3,2,1,2); (2,2,1,2) | First: two colours on three points give a fibre of size ≥ 2: T both. Second: identity colouring has fibres 1,1: F both. Erdős–Rado asks `|B| = b` exactly; a subset of a homogeneous set is homogeneous, so `λ ≤ #H` and `#H = λ` agree | Matches. |
| Order-free form at zero colours | (0,0,1,0) through `partitionRel_iff_finset` | `X = ∅`, `{s : Finset X // s.card = 1} = ∅`, `H = ∅`: T, same as the ordered side | Consistent. |
| “Every partition theorem of Layer 0 has an infinite colour bound” | `partitionRel_succ_one`, `exists_isEndHomogeneousOn`, `erdos_rado`, `erdos_rado_beth`, `exists_unbounded_fiber` | Colour bounds κ with `ℵ₀ ≤ κ` (Lean 93–94, 106–107); λ with `ℵ₀ ≤ λ` and `#D ≤ λ` (99–101); `ℶ_α ≥ ℵ₀` (111–112); `Countable D`, bound ℵ₀ (117) | T; no theorem reaches the `μ = 0` divergence. |
| `exists_emModel`, source universe | atomic-order source on `ℚ : Type 0` and on `ULift.{1} ℚ : Type 1`; `J : Type 0`, `Type 2` | Signature accepts both carriers (scratch examples elaborate); stretched model is `J` in both cases, `#E = #J ≤ max(ℵ₀, #J, 0)` | Repaired R05; bound unchanged. |
| `exists_emModel_card_eq`, source universe | `N : Type 3`, `J : Type`, `J` infinite | elaborates; `#E = #J`, independent of `#N` | Repaired. |
| Supplier row, Scott-sentence contracts | parent on main vs pinned Tau Ceti | On main: `scottSentenceAt`, `realize_scottSentenceAt_self`, `isTupleBFSystem_of_realize_scottSentenceAt` (`Completed/InfinitaryLogic/README.md:590`–`599`), `potentialIso_iff_exists_isTupleBFSystem` (`:444`, `:470`), `karp_theorem` (`:473`): present. At the pin: 0 of the 5 `TauCeti.*` names (no `ModelTheory` beyond `Algebra`) | R03. |
| Layer 0 homogeneity, end-homogeneity, monotonicity, iterated powers, pigeonholes, end-homogeneous extraction, Erdős–Rado indexing (11 rows) | as in the previous report | unchanged statements; values as recorded there | carried. |
| Layer 1 indiscernibility, templates, Morley seed, height counterexample (14 rows) | as in the previous report | unchanged | carried. |
| Layer 2 language maps, Skolem tower and templates, witness assignment, term model, truth lemma, functoriality, EM sources, stretching bounds (19 rows) | as in the previous report | unchanged apart from the universe of `N` (new rows above) | carried. |
| Layer 3 approximation, decisions, witnesses, enumeration, Hanf predicates, extraction, exact Morley–Hanf, corollaries, omitting types (22 rows) | as in the previous report | unchanged | carried. |
| Layer 4 global bounds, ladder sentences, von Neumann ladder, sharpness (9 rows) | as in the previous report | unchanged | carried. |
| Layer 5 order-transitivity, ordered fields, types, smallness, companions, Scott sentences, completions, worked spectrum (17 rows) | as in the previous report | unchanged; the Scott-sentence row's citation is R03 | carried. |
| Conventions and opening claims (8 rows) | as in the previous report | unchanged | carried. |

**Sources, where the sample falls in the changed passages.** 0.1 Vocabulary: Erdős–Rado 1956 (`ed3b734594321052eb3d0b1ba2451e13c8fadcfc97dc3a8f49994bbf67f84c9f`, Bull. AMS 62, lines 110–125, printed pp. 429–430): the relation `a → (b_ν)ʳ_{ν<k}` demands a colour index `ν < k` and a set `B` with `|B| = b_ν` and `[B]ʳ ⊆ K_ν`; the README's reading of the zero-colour cases is exactly this. 2.4 Ehrenfeucht–Mostowski sources: the statement is unchanged except for the universe of `N`; the previous report's Marker locators stand. The other thirteen seeded targets are untouched by the diff and were checked in the previous report.

**Library and cross-roadmap resolutions this round:** `OrderEmbedding.ofIsEmpty` (`Mathlib/Order/Hom/Basic.lean:712`); `Cardinal.mk_eq_zero_iff`; pinned Tau Ceti `TauCeti/ModelTheory/` (only `Algebra`); `Completed/InfinitaryLogic/README.md` lines 440–475 and 586–606 on main (commit cf0ced74); `TauCetiRoadmap/InfinitaryModelExistence/` present on main. Ownership against open pull requests: unchanged objects, previous report's search stands; the diff introduces no new object.

## Not verifiable

- Tau Ceti revision 85f3eb5 was not read: declarations are checked at the pin, and the brief forbids relying on a newer library; the README's claim that those files implement the parent's contracts is therefore uncertified, which is why R03 asks for the parent's names.
- The previous report's items stand: Marker 2016 pagination (the 2013 author notes were read), Kanamori, Keisler 1971, Morley 1965, Ehrenfeucht–Mostowski 1956 and Hanf 1964 full texts, López-Escobar 1966, the external formalization's properties, and the exact literature support for the Skolem-template interface and the infinitary truth lemma.
- No headline theorem was proved; the probes rule out specific errors in the changed statements only.

## Source issues

- none new this round; the four Marker 2013 items recorded in the previous report stand.
