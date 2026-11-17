# Review of HanfNumbers (pull request #1319 at 84bb2ec)
**Verdict:** needs changes

## R01 (P3) — Two specializations remain as acceptance-test padding

**Location:** `TauCetiRoadmap/HanfNumbers/Suggested.lean:70`, `:339`: `partitionRel_succ_one` and `morley_omitting_types_of_countable` (file unchanged).
**Claim:** These specializations belong among the headline acceptance statements.
**Witness:** Scratch probe at this head, exit 0: `erdos_rado hκ 0` proves the first; `exact morley_omitting_types T S (Set.to_countable _) hS (fun _ _ => Set.to_countable _) h hκ` proves the second after two countability lines (`Mathlib/ModelTheory/Encoding.lean:318`).
**Repair:** Delete both declarations from `Suggested.lean`; keep their statements in README 0.2 and 3.4 as prose targets, replacing the backticked labels at `README.md:324`, `:375` and `:910` by prose. Keep `erdos_rado` and `morley_omitting_types`. The description's count of 24 `sorry` warnings then becomes 22.

## R02 (P3) — Three definitions serve no retained headline

**Location:** `TauCetiRoadmap/HanfNumbers/Suggested.lean:110`, `:139`, `:287`: `IsIndiscernibleOn`, `morleySeed`, `hanfNumber` (file unchanged); description, Validation: “It states the roadmap's headline theorems and milestones, each with sorry, with the definitions they need.”
**Claim:** Every definition in the file is needed to state a headline theorem.
**Witness:** Each name occurs exactly once in `Suggested.lean`, at its own declaration; no theorem signature or other definition mentions it. `lomega1omegaHanfNumber` is built from `IsLω₁ωHanfBound`, not from `hanfNumber`.
**Repair:** Delete the three definitions from `Suggested.lean`. Keep their definitions, API and Checks in README 1.1, 1.3 and 3.1 in prose, without backticked declaration names (`README.md:106`, `:425`, `:436`, `:466`, `:493`, `:756`). In the description, say that the interface checks on indiscernibility, the Morley seed and the Hanf number of a sentence compile against definitions the integration harness states itself.

## R03 (P3) — Four constructions still lack three discriminating Checks

**Location:** `TauCetiRoadmap/HanfNumbers/README.md:535` (2.1 Skolem tower), `:579` (2.2 Skolem templates), `:643` (2.3 term model), `:969` (4.2 beth ladder); README unchanged.
**Claim:** Each definition has at least three discriminating Checks.
**Witness:** No `**Checks**` list lies between `:535`–`:578`, `:643`–`:693` or `:969`–`:1004`; the only list in 2.2 (`:634`) is headed “Ehrenfeucht–Mostowski sources” and tests no Skolem-template law.
**Repair:** Add four Checks lists. Tower: for `x = y` on `{0,1}` the Skolem function must be the identity, and `f = 0` fails at `x = 1`; for `⊥` any function serves; a unary tautology yields a nullary symbol, so the empty carrier has no expansion. Skolem templates: the injective equality template satisfies all three laws; assigning `⊥` true fails finite satisfiability; “every `Pᵢ` true, `⋀ᵢPᵢ` false” is finitely satisfiable and fails ω-completeness. Term model: the injective empty-language template gives `EM(J) = J`, including `J = ∅`; the constant template gives one element for nonempty `J`; `j ↦ 2j` induces the map sending generator `j` to `2j`. Ladder: at `α = 0` the levels have sizes `ℵ₀` and `2^ℵ₀`; two points with `E = ∅` and both levels full satisfy every clause except extensionality; at `α = ω`, taking `U_ω = V_(ω+ω+1)` has size `ℶ_(ω+1) > ℶ_ω` and violates the limit-union clause.

## R04 (P3) — The description states the direction of the Morley–Hanf hypothesis backwards

**Location:** description, Ownership and coordination, last bullet: “the roadmap generalizes its universes, strengthens the Morley–Hanf hypothesis to models of size at least ℶ_α for all α < ω₁ with exact cardinalities”.
**Claim:** The roadmap's hypothesis is stronger than the provenance source's.
**Witness:** `README.md:1325`–`1326`: the source “assumes one model of cardinality at least `ℶ_ω₁`”. Such a model has size at least `ℶ_α` for every `α < ω₁`, so the cofinal hypothesis of `exists_model_card_eq_of_forall_beth` is the weaker one.
**Repair:** Replace the clause by: “weakens the Morley–Hanf hypothesis to models of size at least ℶ_α for every α < ω₁ and strengthens the conclusion to a model of every infinite cardinality”.

## Previous findings

- R01 — not repaired: `Suggested.lean:70` “theorem partitionRel_succ_one”, `:339` “theorem morley_omitting_types_of_countable”. R01 above.
- R02 — not repaired: `Suggested.lean:110` “def IsIndiscernibleOn”, `:139` “def morleySeed”, `:287` “noncomputable def hanfNumber”. R02 above.
- R03 — not repaired: `README.md:634` “**Checks** (Ehrenfeucht–Mostowski sources)” is still the only list in 2.1–2.3; 4.2 has none. R03 above.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result / change |
| --- | --- | --- | --- |
| `partitionRel_succ_one` | κ infinite; probe `erdos_rado hκ 0` | `iteratedTwoPow κ 0 = κ` and `0 + 1 = 1` by reduction: both sides `κ⁺ → (κ⁺)¹_κ`; probe exit 0 | Padding, R01 |
| `morley_omitting_types_of_countable` | Countable language; `T`, each `p.2` | `Countable (Σ n, L.BoundedFormula Empty n)` at the pin gives `T` and every `p.2` countable; the general theorem returns the identical conclusion; probe exit 0 | Padding, R01 |
| `IsIndiscernibleOn`, `morleySeed`, `hanfNumber` | Occurrence count in `Suggested.lean` | 1, 1, 1 (own declaration only); 24 theorems mention none | R02 |
| 2.1, 2.2, 2.3, 4.2 constructions | `**Checks**` lists per section | 0, 1 (sources only), 0, 0 | R03 |
| Description: hypothesis of `exists_model_card_eq_of_forall_beth` against the source's `morley_hanf` | One model `M` with `#M ≥ ℶ_ω₁` | `#M ≥ ℶ_ω₁ ≥ ℶ_α` for all `α < ω₁`: source hypothesis ⇒ cofinal hypothesis | Roadmap hypothesis weaker; R04 |
| Description: “24 `declaration uses sorry` warnings and nothing else” | Elaboration at this head | 24 warnings, 0 other messages, exit 0 | Agrees |
| Description: “Mathlib and four Tau Ceti modules” | Import lines of `Suggested.lean` | 1 Mathlib, 4 `TauCeti.*` (`Infinitary.Fragment`, `Infinitary.LanguageMap`, `ModelExistence.Types`, `Scott.Sentence`) | Agrees |
| Description: pins | `lean-toolchain`, `lake-manifest.json` | `v4.36.0-rc2`; Mathlib `1b1ccf4b0…`; Tau Ceti `2fd255d99…` | Agrees |
| Description: series status | Folders on main; open index | InfinitaryModelExistence, BorelEquivalenceRelations, CountableModelCounting on main; InfinitaryLogic under `Completed/`; CountableStructureSpaces only open | Agrees |
| Description: zero-colour convention of `PartitionRel` | `κ = λ = μ = 0`, `n = 1` | `J`, `D` empty: `H = ∅`, `0 ≤ #H`, homogeneity vacuous: holds; a colour-witness form needs a colour in empty `D`: fails | Agrees with `README.md:290` |

Rows for untouched statements stand as in the previous review, of `84bb2ec`.

- Change reviewed: 0 lines in the folder, none outside it; the rewritten title and description read claim by claim against the head. Apart from R02 and R04, every checked sentence agrees: the title and “adds a roadmap”, the declaration names it cites (each in `Suggested.lean` or as README-only targets at `README.md:627`, `:665`, `:860`), worked example 10 (`:1231`), Conventions 6 and 7, the three “not at the pin” items (`:168`–`:233`), the declarations it lists as README-only.
- Library declarations opened at the pin: `Mathlib/SetTheory/Cardinal/Pigeonhole.lean:47` (`infinite_pigeonhole_card`), `Mathlib/SetTheory/Cardinal/Regular.lean:76`, `:88` (`isRegular_succ`, `isRegular_aleph_one`), `Mathlib/ModelTheory/Encoding.lean:318`. No `ErdosRado` or `PartitionRel` declaration in either pinned library.
- Cross-roadmap citations resolved on main: BanachSpaceTheory §B4.1 (infinite Ramsey, its `README.md:627` under heading `:512`); InfinitaryModelExistence 0.1–0.4, 1.1, 1.2, 2.2, 2.3, 4.1, Layer 6 (headings `:171`–`:597`); CountableModelCounting `:72` and InfinitaryModelExistence `:885` leave this subject to HanfNumbers. The resolver's three Lean-name leads are two namespaced theorems of this file and one name of the external formalization.
- Seeded sample: no sampled target lies in a changed passage (the folder is unchanged); the README flags no locator as unverified.
- Gate (worker's run at this head): every counter 0, `build=0 OK`. Elaboration: exit 0, 24 `sorry` warnings only. Probe copy with both R01 proofs: exit 0.
- Dependency check: `depcheck: 261 roadmaps, 2595 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Description's claim that each definition of `Suggested.lean` has three Checks: lists at `README.md:137`, `:144`, `:288`, `:295`, `:442`, `:474`, `:500`, `:634`, `:767`, `:835`, `:959`, `:1062`, `:1085`, `:1126` cover the 22 definitions, three or more bullets each. R03 concerns README constructions without Lean definitions.

Overlap check: read InfinitaryModelExistence, InfinitaryLogic and CountableModelCounting as they are on main; nothing shared. The worker's overlap run lists no other open change to this roadmap, no dropped id and no second copy.

Source independence: changed passages only; the folder is unchanged, so no roadmap passage was compared again (the rewritten description is not roadmap text); arrangement not compared again (no layer added, removed or reordered); largest share of locators Marker's notes, as in the earlier reviews.

Research link: The headline targets are Morley's theorem that the Hanf number of Lω₁ω is ℶ_ω₁ (Morley 1965; Hanf 1964), stated as Theorem 1.6.2 of Keisler–Knight 2004, and the small-model and complete-sentence theory of Marker's 2016 lectures, Chapter 5, built on Ehrenfeucht–Mostowski 1956 and Erdős–Rado 1956; rests on the README's summary and references.

## Not verifiable

- The integration run at `475cc1bf` on the author's fork, its `ALL COMPILED` result and its finding-by-finding record: outside the pull request's head; not executed or read.
- The description's “declaration-level cone computation” on `cameronfreer/infinitary-logic`: not executed (the guard script's text was read in the previous review).
- The description's statement that locators were checked in Marker's 2013 notes and the Keisler–Knight preprint: the sources were not opened again in this re-review; the 2016 Marker book, Keisler 1971, Morley 1965 and Kanamori remain unread, as before.

## Source issues

- none

## For the human reviewers

- Licence: `Suggested.lean:393` reproduces the name, binders and body of `HighlyOrderTransitive` from `cameronfreer/infinitary-logic`, `InfinitaryLogic/Methods/HighlyOrderTransitive.lean:30`, commit 518a366. That repository's LICENSE states Apache 2.0; assess attribution and compatibility.
