# Review of RandomGraphs (pull request #1223 at 74db85e)

**Verdict:** needs changes

Incremental re-review of the 58 lines changed since `f297bb0`. No blocking finding; the four below are P3, three of them carried unchanged.

## R01 (P3) — The executable-definition mandate is still not a mathematical target, and its six names are declared nowhere

**Location:** `TauCetiRoadmap/RandomGraphs/README.md:754`: “This roadmap requires both maps as explicit executable Lean definitions … Existence statements alone do not discharge this requirement, and neither does a definition through `Classical.choose`”; `:740` “by pattern elimination (below)”; `Suggested.lean:28–30`.
**Claim:** Carried from the previous R01, partly repaired: the maps are now named and the two files no longer disagree, but what the README adds beyond the existence theorems is an implementation property (executability, one mandated route) that none of its four stated contracts expresses; `radoQE`, `decideRado` and the four theorem names of `README.md:741–751` are backticked or fenced Lean names that `Suggested.lean` does not declare.
**Witness:** Appended to a copy of `Suggested.lean`, `noncomputable def radoQE := Classical.choose exists_computable_quantifierElimination` (likewise `decideRado`) proves all four fenced signatures by `Classical.choose_spec` (elaborated at `M : Type`; other universes by Löwenheim–Skolem). The contracts cannot tell it from the required definition.
**Repair:** Replace `README.md:729–760` with: “The two endpoints are computability theorems on codes of formulas. **Computable quantifier elimination** (`exists_computable_quantifierElimination`): there is a `Computable₂` map `ℕ → ℕ → ℕ` that, for every `m` and every formula `φ` over `Fin m`, sends `m` and the code of `φ` to the code of a quantifier-free formula over `Fin m` with the same realizations in every model of `T_R`; its values off formula codes are unconstrained. **Decidability** (`exists_computable_decide_rado`): there is a `Computable` map `ℕ → Bool` whose value on the code of a sentence is `true` exactly when the Rado graph satisfies it. That each formula has some quantifier-free equivalent modulo `T_R` proves neither, since it gives no computable map on codes. One route exhibits the two maps through finite equality-and-adjacency patterns; build:”. In `Suggested.lean` restore the docstring sentence “Quantifier elimination and decidability are stated as existence of computable maps on a fixed structural coding of formulas, with their correctness specifications.” in place of `:26–30`, and delete the last sentence of the docstrings at `:494` and `:511–512`. In the description replace “The README names the two maps as construction targets … and semantic quantifier elimination discharges neither.” with “Semantic quantifier elimination discharges neither.” The Classical-choice instance above then satisfies exactly what is stated, and nothing unstated is required.

## R02 (P3) — Three boundary and Check-mirroring declarations remain in the acceptance file

**Location:** `TauCetiRoadmap/RandomGraphs/Suggested.lean:126,961,967`: `foRank_eq_zero_iff_isQF`, `satisfies_triangleSentence`, `satisfies_noIsolatedSentence`.
**Claim:** Carried from the previous R02, unchanged: a rank-zero boundary characterization and two syntax/count adapters that the README Checks already compute.
**Witness:** `README.md:674` lists the rank-zero statement as constructor API; the Layer 11 Checks (`README.md:1520,1527`) compute triangle truth against `T_n > 0` and no-isolated truth against the isolated count.
**Repair:** Delete the three declarations from `Suggested.lean`; keep the statements in the README as prose, without backticks on the three names (`README.md:674,1469,1510`). On `K₂`/`K₃` triangle truth and count-positivity are F/T; on `Fin 0`/`K₁`/`K₂` no-isolated truth and count-zero are T/F/T.

## R03 (P3) — Extension requests have no Checks, and definition APIs are prose paragraphs

**Location:** `TauCetiRoadmap/RandomGraphs/README.md:363–391` (extension request, serving, stage membership); `:276,570,673,972` (“API: …” paragraphs).
**Claim:** Carried from the previous R03, unchanged: serving a request has no `**Checks.**` list, and the APIs are run-on paragraphs, not one bullet per fact.
**Witness:** No `**Checks**` heading lies between `README.md:337` and `:523`; `:276`, `:570`, `:673`, `:972` each open a paragraph with “API:”.
**Repair:** Add under 2.1 `**Checks** (served requests)`: the chain `Fin 0 ⊂ Fin 1 ⊂ ⋯` serves `f : Fin 1 ↪ Fin 2`, `f(0) = 1`, by `g(1) = 0`, `g(0) = 1` at stage 2; the constant `Fin 0` chain cannot serve `Fin 0 ↪ Fin 1`; the constant `Fin 2` chain serves every request in sets of size ≤ 2 and fails coverage of `Fin 3`. Turn each “API:” paragraph into one bullet per fact.

## R04 (P3) — The Lean file's sections are not in README layer order

**Location:** `TauCetiRoadmap/RandomGraphs/Suggested.lean:56,96,159,279`: “General Fraïssé and rooted interfaces (Layers 1–3)” precedes “Native realization and finite rank (Layers 0, 5)”.
**Claim:** Carried from the previous R04, unchanged: the section comments are not `/-! ## Layer k: <title> -/` in README order.
**Witness:** The headings at this head run Layers 1–3; 0, 5; 4; 5; 6–7; 8; 8.2; 9; 10; 8, 11 (`Suggested.lean:56,96,159,279,534,671,732,772,879,932`). The README runs 0, 1, …, 11.
**Repair:** Reorder the declarations by README layer and head each block `/-! ## Layer k: <title> -/`: `Satisfies`, `SatisfiesFormula`, `measurableSet_realize_jointly`, `sentenceProbability` under Layer 0; `foRank` and the coding under Layer 5; `triangleSentence`, `noIsolatedSentence` and the counts under Layer 11 where they are used.

## Previous findings

- R01 — partly repaired: `README.md:754`: “This roadmap requires both maps as explicit executable Lean definitions, with these computability and correctness proofs.” The maps are now named (`:741–751`) and `Suggested.lean:26–30` agrees with the README. Written again as R01.
- R02 — not repaired: `Suggested.lean:126,961,967` still declare the three theorems. Written again as R02.
- R03 — not repaired: no Checks between `README.md:337` and `:523`; “API:” paragraphs at `:276,570,673,972`. Written again as R03.
- R04 — not repaired: `Suggested.lean:56,96`: “(Layers 1–3)” then “(Layers 0, 5)”. Written again as R04.

## Verified sound

| Statement | Instances | Left / construction value | Right / claimed value | Result | Change |
| --- | --- | --- | --- | --- | --- |
| `exists_computable_quantifierElimination` (docstring changed) | `∃y Adj(x,y)` over `Fin 1`; `Adj(x,x)`; `∃y (Adj(x₀,y) ∧ ¬Adj(x₁,y))` over `Fin 2`; `⊥` over `Fin 0` | in every model of `T_R`: T; F; T iff `x₀ ≠ x₁`; F | outputs `⊤`; `⊥`; `¬ x₀ = x₁`; `⊥`, all `IsQF`, same context | consistent; junk codes unconstrained | none (R01 concerns prose) |
| `exists_computable_decide_rado` (docstring changed) | `∃x∃y Adj`; `∃x Adj(x,x)`; `∀x∃y Adj`; `⊥` | truth in R: T, F, T, F | `D(code)`: true, false, true, false | consistent | none |
| README `radoQE_spec`, `decideRado_spec` (`:745–751`) against the two Lean statements | conjuncts compared one by one | fenced: `Computable₂ radoQE`; `∃ ψ, code ∧ IsQF ∧ ∀ M : Type w …`; `= true ↔ Satisfies` | Lean: the same three conjuncts under `∃ Q`, `∃ D` | identical bodies; “consequences, with the maps as witnesses” (`:757`) true | none |
| README:754–756 “neither does a definition through `Classical.choose`” | `Classical.choose` of each existence theorem, appended to a copy of the file | all four fenced signatures elaborate, 0 errors | README says this does not discharge the requirement | the requirement is not among the stated contracts | R01 |
| README:759 “gives neither map” | per-formula QF equivalents by choice | a function on formulas; no map on codes, no `Computable₂` | sentence says neither map follows | true | — |
| `foRank_eq_zero_iff_isQF` | atom; `∀x ⊥` | rank 0; 1 | `IsQF` T; F | boundary statement | R02 |
| `satisfies_triangleSentence` | `K₂`, `K₃` | truth F, T | counts 0, 1 | mirrors a README Check | R02 |
| `satisfies_noIsolatedSentence` | `Fin 0`, `K₁`, `K₂` | truth T, F, T | isolated counts 0, 1, 0 | mirrors a README Check | R02 |

Rows for the statements the diff does not touch stand as in the previous review, of `f297bb0`.

- Diff since `f297bb0`: `README.md:729–761` and three docstrings of `Suggested.lean` (`:26–31`, `:494`, `:511–512`); no Lean statement, locator, supplier, layer or heading changed; 0 files changed outside the folder.
- Sources: the diff adds or changes 0 source locators; of the seeded targets only 5.2 falls in the changed passage, and its changed sentences carry no locator.
- Library and ownership: `radoQE`, `decideRado` occur nowhere in the pinned Mathlib or Tau Ceti, nor in any other roadmap on main or at the 404 open heads (searched by name); `TauCeti.radoGraph`, `Computable₂`, `boundedCode` resolve in the elaboration.
- Cross-roadmap citations: the changed passage cites none; the worker's resolver lists 0 unresolved cross-roadmap citations, and its 4 unresolved Lean names are this file's own declarations.
- Dependency check: `depcheck: 239 roadmaps, 2527 edges, 0 problem(s)`; no UPWARD or CYCLE line. Worker's gate: every count 0, `OK`, targeted build included.
- Elaboration: exit 0, 0 errors, 75 `sorry` warnings and no other warning; the description's count (75) matches.
- Pull request text against this head: the description's sentences on the construction targets `radoQE`/`decideRado`, the headline list, the suppliers and the validation agree with the head; no section, declaration or supplier changed that it leaves unstated.
- Remark: `exists_computable_quantifierElimination` is universe-polymorphic in `M : Type w` under the `∃ Q`, so `Q` may depend on `w`; by Löwenheim–Skolem one `Q` serves every universe.

Overlap check: read CountableStructureSpaces, CountableStructureSpacesPartII, HanfNumbers, InfinitaryModelExistence, ClassifyingTopoi, FreeGroupsAndLimitGroups, CountableModelCounting and InfinitaryLogic for the object of the changed passage (computable quantifier-elimination and decision maps for the Rado theory); nothing shared. Graph decoding and graph events remain CountableStructureSpaces', and the group-language coding FreeGroupsAndLimitGroups §3.1's, both cited here, as in the previous review.

Source independence: changed passages only; 1 passage (`README.md:729–761`) and 3 docstrings compared with 0 sources, since they cite none and state a requirement of the roadmap's own; none shared. Largest share spencer2001, 16 of 60 locators, as in the previous review; no layer was added, removed or reordered, so the arrangement was not compared again. Spencer's, Hodges's and Bollobás's theorem texts remain unread.

Research link: the principal theorem is the graph case of the Glebskii–Kogan–Liogon'kii–Talanov/Fagin zero–one law (Fagin 1976), with the dense varying-parameter laws of Spencer (2001), Fraïssé's theorem as in Hodges (1993), and the Erdős–Rényi (1960) and Bollobás (2001) Poisson limits as boundary cases; rests on the README's summary and reference list.

## Not verifiable

- spencer2001, hodges1993, bollobas2001, erdosrenyi1960: as in the previous reviews (paywalled or OCR-limited); the diff changes none of their locators and this round did not fetch them again.

## Source issues

- none

## For the human reviewers

- **Not tested:** Spencer has the largest locator share (16 of 60); only its contents were readable in an earlier review. Hodges and Bollobás theorem texts were unavailable, and the Erdős–Rényi mean formula was OCR-damaged.
- **Licence:** `TauCetiRoadmap/RandomGraphs/Suggested.lean:63,76,85` follows `cameronfreer/computable-model-theory` (`ModelTheory/FraisseExistence.lean`, `ModelTheory/RootedExtension.lean`) in names and signatures; its headers declare Apache-2.0. Attribution and reuse are yours to assess.
- **Scope of R01:** across three reviews the author has kept, and now named (`README.md:741–754`), the requirement that the two maps be executable Lean definitions; whether a roadmap may require an implementation beyond the existence theorems is a policy decision.
