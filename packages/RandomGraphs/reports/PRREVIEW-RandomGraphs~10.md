# Review of RandomGraphs (pull request #1223 at c113644)

**Verdict:** needs changes

Incremental re-review of the 113 lines changed since `3a5d950`. No blocking finding remains; the five below are P3.

## R01 (P3) — The QE and decision maps are still a mandated implementation

**Location:** `TauCetiRoadmap/RandomGraphs/README.md:733`: “A computability proof needs an explicit witness: define both maps in Lean and prove these theorems for them.”
**Claim:** Carried from the previous R02, here at P3: the sentence makes one proof route and an implementation mandatory, and its general claim is false. The targets are the two existence theorems.
**Witness:** `n ↦ if (an open arithmetic statement) then 1 else 0` is constant in either case, so `∃ f, Computable f ∧ …` is provable by cases with no map defined. `Suggested.lean` states only the existence forms.
**Repair:** Replace the sentence with: “Both targets are these existence theorems. One route exhibits the two maps through finite equality-and-adjacency patterns.” Keep the next sentence (a quantifier-free equivalent for each formula discharges neither). Then drop “The README requires both maps to be defined in Lean” from the description.

## R02 (P3) — Three boundary and Check-mirroring declarations remain in the acceptance file

**Location:** `TauCetiRoadmap/RandomGraphs/Suggested.lean:124,958,964`: `foRank_eq_zero_iff_isQF`, `satisfies_triangleSentence`, `satisfies_noIsolatedSentence`.
**Claim:** Carried from the previous R06, unchanged: a rank-zero boundary characterization and two syntax/count adapters that the README Checks already compute.
**Witness:** `README.md:674` lists the rank-zero statement as constructor API; `README.md:1496,1503` Checks compute triangle truth against `T_n > 0` and no-isolated truth against the isolated count.
**Repair:** Delete the three declarations from `Suggested.lean`; keep the statements in the README as prose (remove the backticks at `README.md:674,1445,1486`). On `K₂`/`K₃` triangle truth and count-positivity are F/T; on `Fin 0`/`K₁`/`K₂` no-isolated truth and count-zero are T/F/T.

## R03 (P3) — Extension requests have no Checks, and definition APIs are prose paragraphs

**Location:** `TauCetiRoadmap/RandomGraphs/README.md:374–390` (extension request, serving, stage membership); `:276,570,673,948` (“API: …” paragraphs).
**Claim:** Carried from the previous R07. The new negative example covers stage membership only; serving a request still has no `**Checks.**` list, and the APIs are run-on paragraphs, not per-fact bullets.
**Witness:** Layer 2 has no `**Checks**` heading (the 36 in the file start at `:258`, `:329`, `:523`, none between `:337` and `:523`).
**Repair:** Add under 2.1 `**Checks** (served requests)`: the chain `Fin 0 ⊂ Fin 1 ⊂ ⋯` serves `f : Fin 1 ↪ Fin 2`, `f(0) = 1`, by `g(1) = 0`, `g(0) = 1` at stage 2; the constant `Fin 0` chain cannot serve `Fin 0 ↪ Fin 1`; the constant `Fin 2` chain serves every request in sets of size ≤ 2 and fails coverage of `Fin 3`. Turn each “API:” paragraph into one bullet per fact.

## R04 (P3) — The Lean file's sections are not in README layer order

**Location:** `TauCetiRoadmap/RandomGraphs/Suggested.lean:54,94,157,277`: “General Fraïssé and rooted interfaces (Layers 1–3)” precedes “Native realization and finite rank (Layers 0, 5)”.
**Claim:** Carried from the previous R08, unchanged: the section comments are not `/-! ## Layer k: <title> -/` in README order.
**Witness:** The headings at this head run Layers 1–3; 0, 5; 4; 5; 6–7; 8; 8.2; 9; 10; 8, 11. The README runs 0, 1, …, 11.
**Repair:** Reorder the declarations by README layer and head each block `/-! ## Layer k: <title> -/`: `Satisfies`, `SatisfiesFormula`, `measurableSet_realize_jointly`, `sentenceProbability` under Layer 0; `foRank` and the coding under Layer 5; `triangleSentence`, `noIsolatedSentence` and the counts under Layer 11 where they are used.

## R05 (P3) — The description still lists the removed graph-event theorem and names only Layer 0 of its supplier

**Location:** PR description, Scope and interfaces: “the fixed-assignment graph events (`measurableSet_setOf_realize_graph`) and joint measurability” and “is a target of CountableStructureSpaces (its Layer 0) and is consumed here for the fixed-assignment graph events.”
**Claim:** The head removes that declaration from `Suggested.lean` and consumes the events from CountableStructureSpaces Layer 2 (the previous R10, partly repaired); the description says neither, nor that the finite-model headline was added.
**Witness:** `Suggested.lean` has no `measurableSet_setOf_realize_graph`; `README.md:118` reads “CountableStructureSpaces, Layers 0 and 2”; `Suggested.lean:608` declares `eventually_exists_finite_model`.
**Repair:** In the headline list write “joint measurability of realization (`measurableSet_realize_jointly`); the finite-model consequence (`eventually_exists_finite_model`)”. In the supplier bullet write “CountableStructureSpaces supplies the decoding identity `toStructure_toRelationalConfiguration` (Layer 0) and the graph events, at fixed assignments included (Layer 2); this roadmap adds joint measurability and the probability laws.”

## Previous findings

- R01 — repaired: `README.md:381–385`: “Expose stage membership (every stage `D_i` lies in the representative class) … For a representative class with HP and AP, prove … from these three”; the `R ⊔ K₁` chain is the fourth Layer 2 example.
- R02 — not repaired: `README.md:733`: “A computability proof needs an explicit witness: define both maps in Lean and prove these theorems for them.” Written again as R01, at P3.
- R03 — repaired: `README.md:398–402`: “The countability of the embedding sets is Mathlib's `FirstOrder.Language.Structure.FG.countable_embedding` … Use that theorem to enumerate outgoing embeddings”; supplier row at `:109`, Needs at `:361`.
- R04 — repaired: `README.md:227–230`: “so are the graph events built from it (its Layer 2) … This roadmap consumes these events and does not restate them”; the Lean theorem is gone.
- R05 — repaired: `Suggested.lean:608`: `theorem eventually_exists_finite_model (φ : Language.graph.Sentence) (hφ : Satisfies TauCeti.radoGraph φ) : ∀ᶠ n in atTop, ∃ G : SimpleGraph (Fin n), Satisfies G φ`; named at `README.md:982`.
- R06 — not repaired: `Suggested.lean:124,958,964` still declare the three theorems. Written again as R02.
- R07 — partly repaired: one negative example added (`README.md:436–441`); no Checks for served requests, “API:” paragraphs unchanged. Written again as R03.
- R08 — not repaired: `Suggested.lean:54,94`: “(Layers 1–3)” then “(Layers 0, 5)”. Written again as R04.
- R09 — repaired: description: “only the expected `sorry` warnings (75) … It includes the theory-level quantifier-elimination theorem alongside the computable QE theorem”; the count at this head is 75.
- R10 — partly repaired: description names “CountableStructureSpaces (its Layer 0)” and the depends-on block lists it; Layer 2 is not named. Written again in R05.

## Verified sound

| Statement | Instances | Left / construction value | Right / claimed value | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 2.1 criterion with stage membership | constant `R ⊔ K₁`, K = finite graphs | stages in K: F; coverage T; requests served vacuously T | limit ultrahomogeneous F (isolated vertex ↦ vertex of R does not extend) | excluded by the new hypothesis | previous R01 repaired |
| 2.1 criterion, positive instances | `Fin n` chain, all finite sets; constant `Fin 2`, sets of size ≤ 2 | stages in K T/T; coverage T/T; served T/T (bijection inverted) | limits ℕ and `Fin 2`; ages exact; ultrahomogeneous T/T | consistent | — |
| 2.1 criterion, failing coverage | constant `Fin 0`, sets of size ≤ 1 | stages in K T; `Fin 0 ↪ Fin 1` unserved; coverage F | limit `Fin 0`, age ≠ K | consistent | — |
| 2.1 substructure requests | A = `Fin 1` ⊂ D = `Fin 2`, B = `Fin 2` | amalgam of D and B over A has 3 points; needs D ∈ K, A ∈ K by HP | served at stage 3 of the `Fin n` chain | consistent with the stated use of AP and HP | — |
| 2.2 `Structure.FG.countable_embedding` | ℤ with successor/predecessor into itself | embeddings = translations, fixed by the image of 0 | pinned `Mathlib/ModelTheory/FinitelyGenerated.lean:241`: `[Countable N]`, `FG L M`, no hypothesis on `L`; ℵ₀ | cited, not restated | previous R03 repaired |
| 0.3 consumed graph events | `Adj(0,1)` on ℕ; `Adj(x₀,x₁)` at (0,1) on `Fin 2` | edge cylinder, mass p; `{K₂}` of 2 graphs, mass p | CountableStructureSpaces Layer 2 (its README:440–448): sentences on ℕ, fixed assignments on every countable `V` | supplier states what is consumed | previous R04 repaired |
| `measurableSet_realize_jointly` | `Fin 2`, `Adj(x₀,x₁)` | 2 graphs × 4 tuples = 8 points; 2 satisfy; section at (0,1) is `{K₂}` | measurable; sections recover the fixed-assignment events | consistent; all five binders in the elaborated type | docstring only |
| `eventually_exists_finite_model` | `∀x∃y Adj`; “not exactly 3 vertices”; `∃x∃y Adj`; `⊥` | R: T, T, T, F | model sizes {0,2,3,…}; ℕ∖{3}; {2,3,…}; hypothesis fails | eventual thresholds 2, 4, 2; “every n” would be false | added (previous R05) |
| `foRank_eq_zero_iff_isQF` | atom; `∀x ⊥` | rank 0; 1 | `IsQF` T; F | boundary statement | R02 |
| `satisfies_triangleSentence` | `K₂`, `K₃` | truth F, T | counts 0, 1 | mirrors Checks at README:1496 | R02 |
| `satisfies_noIsolatedSentence` | `Fin 0`, `K₁`, `K₂` | truth T, F, T | isolated counts 0, 1, 0 | mirrors Checks at README:1503 | R02 |
| `exists_computable_quantifierElimination` | `∃y Adj(x,y)`; loop sentence | T, F in every model of `T_R` | outputs ⊤, ⊥ | statement consistent; the mandate around it is R01 | R01 |

Rows for the statements the diff does not touch stand as in the previous review, of `3a5d950`.

- Sources: the diff adds or changes 0 literary locators; the seeded targets falling in changed passages (0.3, 2.2, 7.1) were checked against the pinned library and the supplier's head.
- Pinned declarations opened: `Mathlib/ModelTheory/FinitelyGenerated.lean:241` (`FirstOrder.Language.Structure.FG.countable_embedding`, namespace at `:38,40,193`).
- Cross-roadmap citations resolved: CountableStructureSpaces Layer 0 (`toStructure_toRelationalConfiguration`, its README:281) and Layer 2 (graph events, its README:440–448, `Suggested.lean:138`), at the head of its open pull request; it adds a new roadmap folder, so the supply is downward.
- Dependency check: `depcheck: 241 roadmaps, 2252 edges, 0 problem(s)`; no UPWARD or CYCLE line. Worker's gate: every count 0, `OK`, targeted build included. 0 files changed outside the folder.
- Elaboration: 0 errors, 75 `sorry` warnings and no other warning. `#check @eventually_exists_finite_model` and `#check @measurableSet_realize_jointly` give the README statements; nothing lost a binder in the changed declarations.
- Padding probe on the added theorem: `simp`, `simp_all [Satisfies]`, `rfl` and `infer_instance` all fail; `measurability` fails on `measurableSet_realize_jointly`.
- Duplication: `eventually_exists_finite_model`, “finite models of every sufficiently large”, `measurableSet_realize_jointly`, `countable_embedding` and extension-rich chains occur in no other roadmap, open or on main; `measurableSet_setOf_realize_graph` only in CountableStructureSpaces.

Overlap check: read CountableStructureSpaces (Layers 0 and 2 and its Suggested.lean) and searched CountableStructureSpacesPartII, HanfNumbers, InfinitaryModelExistence, CountableModelCounting, InfinitaryLogic and DenseGraphLimits for the objects of the changed passages. Graph decoding and graph events, fixed assignments included: CountableStructureSpaces, cited here. Joint measurability, the stage-membership criterion and the finite-model consequence: this roadmap only.

Source independence: changed passages only; 5 passages (0.3, 2.1, 2.2, the Layer 2 example, the new docstring) compared with 2 texts (CountableStructureSpaces README:440–448, the pinned Mathlib declaration), none shared; no literary source is cited in them. Largest share spencer2001, 16 of 60 locators, as in the previous review; no layer was added, removed or reordered, so the arrangement was not compared again. Spencer's, Hodges's and Bollobás's theorem texts remain unread.

## Not verifiable

- spencer2001, hodges1993, bollobas2001, erdosrenyi1960: as in the previous review (paywalled or OCR-limited); the diff changes none of their locators and this round did not fetch them again.

## Source issues

- none

## For the human reviewers

- **Not tested:** Spencer has the largest locator share (16 of 60); only its contents were readable in the previous review. Hodges and Bollobás theorem texts were unavailable, and the Erdős–Rényi mean formula was OCR-damaged.
- **Licence:** `TauCetiRoadmap/RandomGraphs/Suggested.lean:63,76,85` follows `cameronfreer/computable-model-theory` (`ModelTheory/FraisseExistence.lean`, `ModelTheory/RootedExtension.lean`) in names and signatures; its headers declare Apache-2.0. Attribution and reuse are yours to assess.
- **Scope of R01:** the author reinstated the “define both maps in Lean” requirement at `3a5d950` after an earlier review asked for its removal; whether a roadmap may require the maps themselves is a policy decision.
