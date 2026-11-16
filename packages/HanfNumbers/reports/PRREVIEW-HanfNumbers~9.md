# Review of HanfNumbers (pull request #1319 at 84bb2ec)
**Verdict:** needs changes

## R01 (P3) — Two specializations remain as acceptance-test padding

**Location:** `TauCetiRoadmap/HanfNumbers/Suggested.lean:70`, `:339`: `partitionRel_succ_one` and `morley_omitting_types_of_countable` (file unchanged since 8b141bc).
**Claim:** These specializations belong among the headline acceptance statements.
**Witness:** Scratch probe at this head: `erdos_rado hκ 0` proves the first; the second closes by `exact morley_omitting_types T S (Set.to_countable _) hS (fun _ _ => Set.to_countable _) h hκ` after three countability lines from `Mathlib/ModelTheory/Encoding.lean:318`. Exit 0.
**Repair:** Delete both declarations from `Suggested.lean`; keep their statements in README 0.2 and 3.4 as prose targets, replacing the backticked labels at `README.md:324`, `:375` and `:910` by prose. Keep `erdos_rado` and `morley_omitting_types`.

## R02 (P3) — Three definitions serve no retained headline

**Location:** `TauCetiRoadmap/HanfNumbers/Suggested.lean:110`, `:139`, `:287`: `IsIndiscernibleOn`, `morleySeed`, `hanfNumber` (file unchanged since 8b141bc).
**Claim:** Every definition in the file is needed to state a headline theorem.
**Witness:** Each name occurs exactly once in `Suggested.lean`, at its own declaration; no theorem signature or other definition mentions it. `lomega1omegaHanfNumber` is built from `IsLω₁ωHanfBound`, not from `hanfNumber`.
**Repair:** Delete the three definitions from `Suggested.lean`. Keep their definitions, API and Checks in README 1.1, 1.3 and 3.1 in prose, without backticked declaration names (`README.md:106`, `:425`, `:436`, `:466`, `:493`, `:756`).

## R03 (P3) — Four constructions still lack three discriminating Checks

**Location:** `TauCetiRoadmap/HanfNumbers/README.md:535` (2.1 Skolem tower), `:579` (2.2 Skolem templates), `:643` (2.3 term model), `:969` (4.2 beth ladder); README text of these sections unchanged since 8b141bc.
**Claim:** Each definition has at least three discriminating Checks.
**Witness:** No `**Checks**` list lies between `:535`–`:578`, `:643`–`:693` or `:969`–`:1004`; the only list in 2.2 (`:634`) is headed “Ehrenfeucht–Mostowski sources” and tests no Skolem-template law.
**Repair:** Add four Checks lists. Tower: for `x = y` on `{0,1}` the Skolem function must be the identity, and `f = 0` fails at `x = 1`; for `⊥` any function serves; a unary tautology yields a nullary symbol, so the empty carrier has no expansion. Skolem templates: the injective equality template satisfies all three laws; assigning `⊥` true fails finite satisfiability; “every `Pᵢ` true, `⋀ᵢPᵢ` false” is finitely satisfiable and fails ω-completeness. Term model: the injective empty-language template gives `EM(J) = J`, including `J = ∅`; the constant template gives one element for nonempty `J`; `j ↦ 2j` induces the map sending generator `j` to `2j`. Ladder: at `α = 0` the levels have sizes `ℵ₀` and `2^ℵ₀`; two points with `E = ∅` and both levels full satisfy every clause except extensionality; at `α = ω`, taking `U_ω = V_(ω+ω+1)` has size `ℶ_(ω+1) > ℶ_ω` and violates the limit-union clause.

## Previous findings

- R01 — not repaired: `Suggested.lean:70` “theorem partitionRel_succ_one”, `:339` “theorem morley_omitting_types_of_countable”. R01 above.
- R02 — not repaired: `Suggested.lean:110` “def IsIndiscernibleOn”, `:139` “def morleySeed”, `:287` “noncomputable def hanfNumber”. R02 above.
- R03 — not repaired: `README.md:634` “**Checks** (Ehrenfeucht–Mostowski sources)” is still the only list in 2.1–2.3; 4.2 has none. R03 above.
- R04 — repaired: description, Partition calculus: “Mathlib supplies cardinal pigeonhole and regularity; this roadmap introduces partition-relation vocabulary and develops end-homogeneous sets and the finite-exponent Erdős–Rado theorem.”
- R05 — repaired: description, Validation: “exits 0 with 24 `declaration uses sorry` warnings and nothing else”; elaboration at this head gives 24.
- R06 — repaired: `README.md:1335` “Module paths below are relative to the `InfinitaryLogic/` directory at that commit; the linked dependency script is relative to the repository root.” No new problem (rows below).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result / change |
| --- | --- | --- | --- |
| Provenance path base (`README.md:1335`–`1337`, changed) | All 52 distinct `.lean` paths of the Provenance section against the 573-entry tree of commit 518a366 | 51 resolve under `InfinitaryLogic/`; 0 resolve only at the root; 1 absent (`Combinatorics/ErdosRado.lean`); `scripts/check_morley_hanf_deps.lean` is at the root | Correct; R06 repaired |
| Legacy file clause (`README.md:1342`–`1343`, changed) | Commit `dd5bd5c`; comparison `dd5bd5c...518a366`; branch `archive/legacy-erdos-rado` | Commit removes `InfinitaryLogic/Combinatorics/ErdosRado.lean`; 518a366 is 784 ahead, 0 behind; the branch tree contains the file | Correct; explains the one absent path |
| Guard script claim (cited by the changed clause) | Script at 518a366, read | Forbidden modules: `InfiniteRamsey`, `InfiniteRamseyFamily`, `ErdosRado` (lines 24–26); required witness `finiteArityHomogeneousUpTo_beth_stage` (line 30) | Matches the README sentence |
| `partitionRel_succ_one` | κ = ℵ₀; probe `erdos_rado hκ 0` | `iteratedTwoPow κ 0 = κ`, `0 + 1 = 1` by reduction: both sides `ℵ₁ → (ℵ₁)¹_ℵ₀`; probe elaborates | Padding, R01 |
| `morley_omitting_types_of_countable` | Countable language; `T`, each `p.2` | `Countable (Σ n, L.BoundedFormula Empty n)` from the pin, so `T` and every `p.2` countable; general theorem then gives the identical conclusion | Padding, R01 |
| `IsIndiscernibleOn`, `morleySeed`, `hanfNumber` | Occurrence count in `Suggested.lean` | 1, 1, 1 (own declaration only); 24 theorems reference none | R02 |
| 2.1 Skolem tower | `x = y` on `{0,1}`; `⊥`; unary tautology | `f = id` works, `f = 0` gives true → false at `x = 1`; any `f` for `⊥`; nullary symbol has 0 interpretations on `∅` | Checks to add, R03 |
| 2.2 Skolem templates | Injective equality template; `⊥ ↦ true`; finite-height assignment | Laws 3 of 3 hold; `{⊥}` has 0 models; each finite subset has a model, the conjunction has no false component | Checks to add, R03 |
| 2.3 term model | Empty language, injective and constant templates, `J = ∅, 1, ℵ₁` | Sizes 0, 1, ℵ₁ (injective); size 1 for nonempty `J` (constant) | Checks to add, R03 |
| 4.2 beth ladder | α = 0; α = ω with `U_ω = V_(ω+ω+1)` | Sizes ℵ₀ and ℶ₁; `#V_(ω+ω+1) = ℶ_(ω+1) > ℶ_ω` | Checks to add, R03 |
| Description, Validation count | Elaboration at this head | 24 `sorry` warnings, 0 other messages, exit 0; description says 24 | Agrees; R05 repaired |

Rows for untouched statements stand as in the previous review, of `8b141bc`.

- Change reviewed: 8 lines of `README.md` (Provenance), no change to `Suggested.lean` or `metadata.toml`, none outside the folder; no layer added, removed or reordered.
- Seeded sample: none of the 15 targets lies in or cites the changed passages; the README flags no locator as unverified.
- Library declarations opened at the pin: `Mathlib/ModelTheory/Encoding.lean:292` (`BoundedFormula.card_le`), `:318` (countability of bounded formulas, under `[Countable L.Symbols]`).
- Cross-roadmap citations: the changed passages add none; the worker's resolver lists none missing; the three flagged Lean names are this file's namespaced theorems and a name of the external formalization.
- Gate: every counter 0 (`… depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`); targeted build 0 in the worker's run. Elaboration: exit 0, 24 `sorry` warnings only. Probe copy with both R01 proofs: exit 0.
- Dependency check: `depcheck: 241 roadmaps, 2252 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Pull-request text: title and description read against this head; imports (Mathlib and four Tau Ceti modules), the warning count, the provenance commit and the supplier statements agree; the 8-line change needs no statement there.

Overlap check: read InfinitaryModelExistence (main and #1615), InfinitaryLogic, CountableModelCounting (main and #2012); nothing shared. The changed passages concern only the external formalization; the worker's overlap run lists no other open change, dropped id or second copy.

Source independence: changed passages only; 2 passages compared with 1 source (the header of `scripts/check_morley_hanf_deps.lean` in `cameronfreer/infinitary-logic` at 518a366), none shared; arrangement not compared again (no layer added, removed or reordered); largest share of locators Marker's notes, as in the previous review.

## Not verifiable

- The “declaration-level cone computation” of `README.md:1344` and the external integration harness were not executed; only the guard script's text was read.
- The unread texts of the previous review (the 2016 Marker book, Keisler 1971, Morley 1965, Kanamori) are untouched by this change and were not sought again.

## Source issues

- none

## For the human reviewers

- Licence: `Suggested.lean:393` reproduces the name, binders and body of `HighlyOrderTransitive` from `cameronfreer/infinitary-logic`, `InfinitaryLogic/Methods/HighlyOrderTransitive.lean:30`, commit 518a366. That repository's LICENSE states Apache 2.0; assess attribution and compatibility.
