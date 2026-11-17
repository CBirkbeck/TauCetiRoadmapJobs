# Review of RandomGraphs (pull request #1223 at f297bb0)

**Verdict:** needs changes

Incremental re-review of the 9 lines changed since `c113644`. No blocking finding; the four below are P3, three of them carried unchanged.

## R01 (P3) — The QE and decision maps remain a mandated implementation with no target

**Location:** `TauCetiRoadmap/RandomGraphs/README.md:734`: “This roadmap requires explicit Lean definitions of both maps, with computability and correctness proofs. Existence statements alone do not discharge this implementation requirement.”
**Claim:** Carried from the previous R01, partly repaired: the false general claim is gone, but the README still makes one route and an implementation mandatory, as a requirement that is no named target and that the acceptance file contradicts.
**Witness:** `Suggested.lean:493,510` state `∃ Q, Computable₂ Q ∧ …` and `∃ D, Computable D ∧ …`: exactly the existence statements the README says do not discharge it. No declaration or signature for either map appears in either file.
**Repair:** Replace the two sentences with: “Both targets are these existence theorems. One route exhibits the two maps through finite equality-and-adjacency patterns.” Keep the next sentence. Then drop “The README requires both maps to be defined in Lean and these theorems proved for them” from the description.

## R02 (P3) — Three boundary and Check-mirroring declarations remain in the acceptance file

**Location:** `TauCetiRoadmap/RandomGraphs/Suggested.lean:124,958,964`: `foRank_eq_zero_iff_isQF`, `satisfies_triangleSentence`, `satisfies_noIsolatedSentence`.
**Claim:** Carried from the previous R02, unchanged: a rank-zero boundary characterization and two syntax/count adapters that the README Checks already compute.
**Witness:** `README.md:674` lists the rank-zero statement as constructor API; the Layer 11 Checks compute triangle truth against `T_n > 0` and no-isolated truth against the isolated count.
**Repair:** Delete the three declarations from `Suggested.lean`; keep the statements in the README as prose, without backticks on the three names. On `K₂`/`K₃` triangle truth and count-positivity are F/T; on `Fin 0`/`K₁`/`K₂` no-isolated truth and count-zero are T/F/T.

## R03 (P3) — Extension requests have no Checks, and definition APIs are prose paragraphs

**Location:** `TauCetiRoadmap/RandomGraphs/README.md:375–390` (extension request, serving, stage membership); `:276,570,673,949` (“API: …” paragraphs).
**Claim:** Carried from the previous R03, unchanged: serving a request has no `**Checks.**` list, and the APIs are run-on paragraphs, not one bullet per fact.
**Witness:** No `**Checks**` heading lies between `README.md:337` and `:523`; `:276`, `:570`, `:673`, `:949` each open a paragraph with “API:”.
**Repair:** Add under 2.1 `**Checks** (served requests)`: the chain `Fin 0 ⊂ Fin 1 ⊂ ⋯` serves `f : Fin 1 ↪ Fin 2`, `f(0) = 1`, by `g(1) = 0`, `g(0) = 1` at stage 2; the constant `Fin 0` chain cannot serve `Fin 0 ↪ Fin 1`; the constant `Fin 2` chain serves every request in sets of size ≤ 2 and fails coverage of `Fin 3`. Turn each “API:” paragraph into one bullet per fact.

## R04 (P3) — The Lean file's sections are not in README layer order

**Location:** `TauCetiRoadmap/RandomGraphs/Suggested.lean:54,94,157,277`: “General Fraïssé and rooted interfaces (Layers 1–3)” precedes “Native realization and finite rank (Layers 0, 5)”.
**Claim:** Carried from the previous R04, unchanged: the section comments are not `/-! ## Layer k: <title> -/` in README order.
**Witness:** The headings at this head run Layers 1–3; 0, 5; 4; 5; 6–7; 8; 8.2; 9; 10; 8, 11 (`Suggested.lean:54,94,157,277,531,668,729,769,876,929`). The README runs 0, 1, …, 11.
**Repair:** Reorder the declarations by README layer and head each block `/-! ## Layer k: <title> -/`: `Satisfies`, `SatisfiesFormula`, `measurableSet_realize_jointly`, `sentenceProbability` under Layer 0; `foRank` and the coding under Layer 5; `triangleSentence`, `noIsolatedSentence` and the counts under Layer 11 where they are used.

## Previous findings

- R01 — partly repaired: `README.md:734`: “This roadmap requires explicit Lean definitions of both maps, with computability and correctness proofs. Existence statements alone do not discharge this implementation requirement.” The claim about every computability proof is gone. Written again as R01.
- R02 — not repaired: `Suggested.lean:124,958,964` still declare the three theorems. Written again as R02.
- R03 — not repaired: no Checks between `README.md:337` and `:523`; “API:” paragraphs at `:276,570,673,949`. Written again as R03.
- R04 — not repaired: `Suggested.lean:54,94`: “(Layers 1–3)” then “(Layers 0, 5)”. Written again as R04.
- R05 — repaired: description: “finite models of every sufficiently large size (`eventually_exists_finite_model`)”, “joint measurability of realization (`measurableSet_realize_jointly`)”, and “a target of CountableStructureSpaces (its Layer 0), and so are the graph events built from it (its Layer 2 …)”.

## Verified sound

| Statement | Instances | Left / construction value | Right / claimed value | Result | Change |
| --- | --- | --- | --- | --- | --- |
| `exists_computable_quantifierElimination` (cited by the changed passage) | `∃y Adj(x,y)`; `Adj(x,x)`; `∃y (Adj(x₀,y) ∧ ¬Adj(x₁,y))` over `Fin 2` | in every model of `T_R`: T; F; T iff `x₀ ≠ x₁` | outputs `⊤`; `⊥`; `¬ x₀ = x₁`, all `IsQF`, same context | statement consistent; `∃ Q` form, junk codes unconstrained | none (R01 concerns the prose) |
| `exists_computable_decide_rado` (cited by the changed passage) | `∃x∃y Adj`; `∃x Adj(x,x)`; `∀x∃y Adj`; `⊥` | truth in R: T, F, T, F | `D(code)`: true, false, true, false | statement consistent; `∃ D` form | none |
| README:734–736 against the two Lean statements | the README's requirement; the Lean existence forms | requirement: named maps defined, 0 declared in either file | acceptance test: 2 existence theorems, no map | the two disagree | R01 |
| README:736 “some QF equivalent … discharges neither” | per-formula equivalents chosen by `Classical.choice` | a function on formulas, no code-level map; `Computable₂` not obtained | sentence says neither theorem follows | true | — |
| `foRank_eq_zero_iff_isQF` | atom; `∀x ⊥` | rank 0; 1 | `IsQF` T; F | boundary statement | R02 |
| `satisfies_triangleSentence` | `K₂`, `K₃` | truth F, T | counts 0, 1 | mirrors a README Check | R02 |
| `satisfies_noIsolatedSentence` | `Fin 0`, `K₁`, `K₂` | truth T, F, T | isolated counts 0, 1, 0 | mirrors a README Check | R02 |

Rows for the statements the diff does not touch stand as in the previous review, of `c113644`.

- Diff since `c113644`: `README.md` only, 5 insertions and 4 deletions at `:734–738`; no Lean statement, locator, supplier, layer or heading changed; 0 files changed outside the folder.
- Sources: the diff adds or changes 0 source locators; none of the seeded targets other than 5.2 falls in the changed passage, and 5.2's changed sentences carry no locator.
- Cross-roadmap citations: the changed passage cites none; the worker's resolver lists 0 unresolved cross-roadmap citations. Its 4 unresolved Lean names (`Language.Theory.HasQuantifierElimination`, `IsQFEquivalent`, `Language.graph.ExtensionProperty.embedding_from_countable`, `…isFraisseLimit_finite_graphs`) are this file's own declarations.
- Dependency check: `depcheck: 261 roadmaps, 2595 edges, 0 problem(s)`; no UPWARD or CYCLE line. Worker's gate: every count 0, `OK`, targeted build included.
- Elaboration: exit 0, 0 errors, 75 `sorry` warnings and no other warning; the description's count (75) matches.
- Pull request text against this head: the description's sentences on the computational endpoints, the headline list, the suppliers and the validation agree with the head; the depends-on block lists CountableStructureSpaces.
- Overlaps: no other open pull request changes this roadmap; no cited id is dropped or defined only by an open revision.

Overlap check: read CountableStructureSpaces, CountableStructureSpacesPartII, HanfNumbers, InfinitaryModelExistence, CountableModelCounting, InfinitaryLogic and DenseGraphLimits for the object of the changed passage (computable quantifier elimination and decidability of the Rado theory); nothing shared. Graph decoding and graph events remain CountableStructureSpaces', cited here, as in the previous review.

Source independence: changed passages only; 1 passage (`README.md:734–738`) compared with 0 sources, since it cites none and states a requirement of the roadmap's own; none shared. Largest share spencer2001, 16 of 60 locators, as in the previous review; no layer was added, removed or reordered, so the arrangement was not compared again. Spencer's, Hodges's and Bollobás's theorem texts remain unread.

Research link: the principal theorem is the graph case of the Glebskii–Kogan–Liogon'kii–Talanov/Fagin zero–one law (Fagin 1976), with the dense varying-parameter laws of Spencer (2001), Fraïssé's theorem as in Hodges (1993), and the Erdős–Rényi (1960) and Bollobás (2001) Poisson limits as boundary cases; rests on the README's summary and reference list.

## Not verifiable

- spencer2001, hodges1993, bollobas2001, erdosrenyi1960: as in the previous reviews (paywalled or OCR-limited); the diff changes none of their locators and this round did not fetch them again.

## Source issues

- none

## For the human reviewers

- **Not tested:** Spencer has the largest locator share (16 of 60); only its contents were readable in an earlier review. Hodges and Bollobás theorem texts were unavailable, and the Erdős–Rényi mean formula was OCR-damaged.
- **Licence:** `TauCetiRoadmap/RandomGraphs/Suggested.lean:63,76,85` follows `cameronfreer/computable-model-theory` (`ModelTheory/FraisseExistence.lean`, `ModelTheory/RootedExtension.lean`) in names and signatures; its headers declare Apache-2.0. Attribution and reuse are yours to assess.
- **Scope of R01:** the author has now restated the “explicit Lean definitions of both maps” requirement as the roadmap's own (`README.md:734`) after two reviews asked for its removal; whether a roadmap may require the maps themselves is a policy decision.
