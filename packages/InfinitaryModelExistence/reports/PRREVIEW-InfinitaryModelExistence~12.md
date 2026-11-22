# Review of InfinitaryModelExistence (pull request #1615 at 660240a)

**Verdict:** accepted

**Summary.** Accepted: this was an incremental re-review of the 130 lines changed since `8c93fec`, which move the ownership text and the supplier table after the layers, rename three headings and mark the opening paragraph as the summary; no statement, hypothesis, locator or Lean declaration changes, and nothing false was introduced. No finding remains; there are two small corrections and one format note, none blocking. One provenance question is left for a human.

## C01 — The description does not say that the README's sections were renamed and moved

A reader who follows an older link or looks for the supplier table where the description's reader last saw it will not find it: the headings “Scope and dependency order”, “Standing conventions” and “Existing library and ownership” are now “How to read the build” (line 55), “Conventions” (line 74), and the two sections “Scope and ownership” (line 1215) and “Exact supplier contracts” (line 1255), the last two placed after the layers and the Provenance section. The description's Scope, Interfaces and Validation paragraphs state none of this. No roadmap on main or in an open pull request links to the three old anchors (searched by anchor and by heading text), so nothing breaks.

One sentence under Interfaces would do: “The README is in the repository layout: the opening paragraph is the summary, ‘Scope and dependency order’ is ‘How to read the build’, ‘Standing conventions’ is ‘Conventions’, and ‘Existing library and ownership’ is split into ‘Scope and ownership’ and ‘Exact supplier contracts’ after the layers; no layer or section number changes.”

## C02 — `Fragment.slice` and `fragmentType` occur in none of the seven theorems of `Suggested.lean`

The two definitions (`Suggested.lean`, lines 60 and 65) are declared only because CountableModelCounting cites them by name, as the description says; no headline statement needs them, so as acceptance-test content they ask an implementer for nothing beyond their one-line bodies. The names occur in the file only at their own declarations and docstrings. If they are kept as the named interface for that consumer, a clause in each docstring saying so would make the reason visible in the file; otherwise they would move to §4.1 as prose.

## N01 — §0.4 gives the infinitary `toFormula` no Check

The form of `toFormula` (README line 213) is the one definition the pin lacks that has a Needs line and no Check; a variant that captures a bound variable is the evident wrong one. A suggested Check: `∀y x₀ = y` at one bound position becomes `∀y (inr 0) = y` with `y` still bound; on `{0, 1}` at `x₀ = 0` both sides are false, while the capturing variant `∀y y = y` is true.

## Previous findings

- R01 — not repaired, and no longer raised: the layers keep the statements the pin proves (for example `model_existence`) and the “Tau Ceti implementation” table names their declarations; for a roadmap on main these items are its record and stay.
- R02 — not repaired: `def Fragment.slice (A : L.Fragment) (n : ℕ)` and `def fragmentType (A : L.Fragment) (M : Type w)` are still used by no theorem (C02 above).
- R03 — not repaired: “The infinitary form of Mathlib's `BoundedFormula.toFormula` … with their realization laws”, followed by a Needs line and no Checks (N01 above).
- R04 — partly repaired: the head has `**Summary.**`, “How to read the build”, “Conventions”, “Scope and ownership” and “Exact supplier contracts”; layers still end with an acceptance example rather than Examples and Dependencies, which is shape and is not raised.

## Verified sound

| Statement | Instance | Left / input value | Right / output value | Result |
|---|---|---|---|---|
| `pcSeparation` (cited by the moved ownership text as the contract of CountableStructureSpaces) | `L = L₁ = L₂` empty, `Θ₁ = ⊤`, `Θ₂ = ⊥` | class 1 = all structures, class 2 = ∅; hypothesis holds | `θ = ⊤`: true on class 1, class 2 empty | Holds |
| same | `Θ₁` = “exactly one element”, `Θ₂` = “at least two” | no countable common member | `θ = Θ₁`: true on 1-point, false on 2-point models | Holds |
| same, hypothesis needed | `Θ₁ = Θ₂ = ⊤` | one-point structure in both classes: hypothesis false | any `θ` would be both true and false there | Nothing claimed; hypothesis is necessary |
| Ownership sentence “consumes exactly `PCMem` and `pcSeparation`” | CountableStructureSpaces README on main, lines 717–791 | names cited there: `LHom.PCMem`, `pcSeparation` (Layer 7) | names listed here: `PCMem`, `pcSeparation` | Agree |
| Moved text against the text at `8c93fec` | sorted removed lines against sorted added lines | 64 removed | 66 added; differences: 5 headings, `**Summary.**` with its reflow, “in the layers below” → “in its layers” | Pure relocation otherwise |

The rows for every statement the diff does not touch stand as in the previous review, of `8c93fec`.

- Diff since `8c93fec`: README only, 66 insertions and 64 deletions; `Suggested.lean` unchanged; nothing outside the folder.
- Direction words after the move: “in its layers” replaces “in the layers below”; the remaining “above”/“below” in the README (lines 76, 587, 775, 994–1024, 1175, 1191) refer to nearby text and stay correct; the two internal links (`#out-of-scope`, `#tau-ceti-implementation`) resolve.
- Library declarations opened at the pins for the moved supplier table: Mathlib `ModelTheory/Skolem.lean:126` (`exists_elementarySubstructure_card_eq`), `Satisfiability.lean:101` and `:279`, `LanguageMap.lean:140` and `:200`, `Syntax.lean:203` and `:608`, `Semantics.lean:508`, `SetTheory/Cardinal/Regular.lean:88`; Tau Ceti `Infinitary/CodedConnectives.lean:62`, `IndexCoding.lean:140`, `Reindex.lean:66` and `:235`, `Operations.lean:85` and `:197`, `QuantifierRank.lean:69`, `Semantics.lean:168`, `Equiv.lean:69`, `BackAndForth/Karp.lean:73`, `Equivalence.lean:49`, `Scott/Sentence.lean:99`, `Scott/Isomorphism.lean:62` and `:70`, `Interpolation/PCClass.lean:76`, `Infinitary/Fragment.lean:373`. All 26 present.
- Cross-roadmap citations resolved: CountableStructureSpaces (main) cites `pcSeparation` and `LHom.PCMem` as stated; no roadmap on main or open links to the three renamed heading anchors; no dropped id, no other open pull request changes this folder.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0, prints the one `#check` signature and seven `declaration uses sorry` warnings, nothing else.
- Automatic checks at this head: every check passed.
- Dependency check: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Record: the nine layers of the README at the merge base keep their ids and titles; the diff touches no layer. The source sample falls in no changed passage (the diff adds or changes no locator); padding probes of the earlier reviews stand, the Lean file being unchanged.

Overlap check: read HanfNumbers, CountableModelCounting, CountableStructureSpaces and InfinitaryLogic for the objects the moved ownership text names; nothing shared: each listed interface is owned here (or by Tau Ceti at the pin) and consumed there by name.

Source independence: changed passages only; 3 passages compared (the summary's opening sentence, the reworded ownership sentence, the five headings), all the roadmap's own relocated text with no counterpart in a source, 0 sources opened this round, none shared; largest share `marker2013`, 17 of 19 locators as counted in the earlier review; the diff adds, removes and reorders no layer, so the contents were not compared again.

Research link: the headline targets are the model existence, omitting types and interpolation theorems of Lω₁ω (López-Escobar 1965; Malitz 1969; Keisler 1971; Marker 2016), with Malitz interpolation as restated by Harrison-Trainor and Kretschmer (2024, Theorem 4.5); `pcSeparation` is consumed by CountableStructureSpaces. Rests on the README's summary and References.

## Not verifiable

- `marker2016`, `keisler1971`, `malitz1969`, `gao2009`: no legal full text, as in the previous reviews; no changed passage cites them.
- The Provenance table's file names of the external formalisation were not opened.

## Source issues

- none

## For the human reviewers

- Licence/provenance: `TauCetiRoadmap/InfinitaryModelExistence/README.md`, the Provenance section (line 1166 onwards), cites an Apache-2.0 external formalisation as the origin of the constructions; an earlier review confirmed the licence header only, and whole-repository reuse was not audited.
