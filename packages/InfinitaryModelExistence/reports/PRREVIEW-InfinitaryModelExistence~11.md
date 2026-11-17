# Review of InfinitaryModelExistence (pull request #1615 at 8c93fec)

**Verdict:** needs changes

Incremental re-review of the 3 lines changed since `bd6b3b7`. The gate now passes and the description is repaired; the four P3 findings below are carried from the previous review, and none is new.

## R01 (P3) — Results the pin proves are still written as targets

**Location:** `TauCetiRoadmap/InfinitaryModelExistence/README.md:503`, “`model_existence`: let `L` have countably many function and relation symbols”; likewise the targets listed in the table at `README.md:1251`–`1261`.
**Claim:** The layers still plan constructions and theorems that Tau Ceti proves at the pin; the table cites them but the targets are not replaced by supplier citations.
**Witness:** `TauCeti/ModelTheory/ModelExistence/ModelExistence.lean:84` (`model_existence`) and `TauCeti/ModelTheory/WellOrdering.lean:689` (`wellOrder_type_boundedness`); the table's last column records “none” for Layers 2, 4, 5 and 8.
**Repair:** Move the statements the table lists into the ownership and supplier-contract text, each with its fully qualified declaration and file; keep as targets only what the pin lacks (the variants in the table's last column and the declarations of `Suggested.lean`); keep every section number, with a mapping where a section becomes a contract.

## R02 (P3) — Two Lean definitions support no headline theorem

**Location:** `TauCetiRoadmap/InfinitaryModelExistence/Suggested.lean:60`, `Fragment.slice`; `TauCetiRoadmap/InfinitaryModelExistence/Suggested.lean:65`, `fragmentType`.
**Claim:** Neither definition occurs in any of the seven theorem statements. A definition stays in `Suggested.lean` only to make a headline statable; a consumer's citation by name is served by the README.
**Witness:** With both definitions deleted from a copy of this head's file, it elaborates with the same seven `sorry` warnings and no error.
**Repair:** Delete both from `Suggested.lean`; keep their definitions, API and Checks in §4.1 as prose (without backticks on the two names, or the gate will ask for them); remove them from the list at `README.md:1263`–`1267` and from the description's declaration lists.

## R03 (P3) — The infinitary `toFormula` has no Checks

**Location:** `TauCetiRoadmap/InfinitaryModelExistence/README.md:267`, “The infinitary form of Mathlib's `BoundedFormula.toFormula` (bound positions become free variables `α ⊕ Fin n`)”.
**Claim:** The README says Tau Ceti lacks this definition at the pin (`README.md:274`) and gives it a Needs line but no Check; §0.4 has no `**Checks**` list. The description now states the exception; the Checks are still owed.
**Witness:** The first `**Checks**` list after §0.3 (`README.md:244`) is at `README.md:357`, in §1.2.
**Repair:** Add to §0.4 a `**Checks**` list: `R(a)` at arity `0` becomes `R(inl a)`; `R(x₀)` at arity `1` becomes `R(inr 0)`; `∀y x₀ = y` becomes `∀y (inr 0) = y`, with `y` still bound. On `{0, 1}` with `R = {0}`, `a = 1`, `x₀ = 0` the truth values are false, true, false on both sides; the third rejects a definition that captures `y`. Then drop “except the bound-opening `toFormula` (§0.4)” from the description.

## R04 (P3) — The README lacks the required sections

**Location:** `TauCetiRoadmap/InfinitaryModelExistence/README.md:55`, “## Scope and dependency order”; the nine layers, `README.md:165`–`1110`.
**Claim:** There is no `**Summary.**` paragraph, no `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build` or `## Downstream consumers` heading, and no layer ends with `### Examples` and `### Dependencies`.
**Witness:** `grep -c '^### Examples\|^### Dependencies'` gives 0 for nine `## Layer` headings; the headings present are “Standing conventions”, “Existing library and ownership”, “Coordination”, “Provenance”.
**Repair:** Rename and regroup under the six headings (the supplier table of `README.md:113`–`120` and the implementation table become the supplier contracts; the consumer list of `README.md:125`–`157` becomes Downstream consumers); end each layer with `### Examples` (its acceptance example) and `### Dependencies` (its row of the table at `README.md:57`–`67`). No section number changes.

## Previous findings

- R01 — repaired: `Suggested.lean:54`–`55` has a `--` comment and `#check @FirstOrder.Language.Fragment.generated_countable` after the `variable` line of `section Types`; the gate reports `readme-ids-missing=0`.
- R02 — not repaired: “`model_existence`: let `L` have countably many function and relation symbols. If `s` is a countable member of a consistency property, then `s` has a countable model” (R01 above).
- R03 — not repaired: `def Fragment.slice (A : L.Fragment) (n : ℕ)` and `def fragmentType (A : L.Fragment) (M : Type w)` are still declared and used by no theorem (R02 above).
- R04 — not repaired: “The infinitary form of Mathlib's `BoundedFormula.toFormula` … with their realization laws”, followed by a Needs line and no Checks (R03 above).
- R05 — not repaired: headings “Scope and dependency order”, “Standing conventions”, “Existing library and ownership”; no `### Examples` or `### Dependencies` (R04 above).
- R06 — repaired: the description now reads “for every definition Tau Ceti lacks at the pin except the bound-opening `toFormula` (§0.4)”, states the move of the polarity laws to §7.3 and the countable fragment of §5.2, and describes the one `#check`.

## Verified sound

| Statement | Instance | Left / input value | Right / output value | Result |
|---|---|---|---|---|
| `#check @FirstOrder.Language.Fragment.generated_countable` against README §1.2 (“a countable `S` generates a countable fragment, over any language”) | elaborated type at the pin | `∀ {L} {S : Set ((n : ℕ) × L.BoundedFormulaω Empty n)}, S.Countable → (↑(Fragment.generated S)).Countable` | README: countable `S`, no hypothesis on `L` | Same hypotheses and conclusion; no countability instance on `L` |
| same | `S = ∅` | `S` countable | generated fragment is the least one, `∅`: 0 members | Holds |
| same | `S = {⟨0, ⋁ₖ ⊥⟩}`, any `L` | `S` has 1 member | generated fragment `{⋁ₖ ⊥, ⊥}`: 2 members | Holds |
| same, hypothesis needed | `S = {R_r(x₀) : r ∈ ℝ}` | `S` uncountable | generated fragment contains `S`: uncountable | Conclusion fails without `S.Countable`; the statement assumes it |
| The two definitions of R02 | file with both deleted | 13 declarations, 7 `sorry` warnings | 11 declarations, 7 `sorry` warnings, no error | No theorem depends on them |

The rows of the previous review, of `bd6b3b7`, stand for every statement the diff does not touch.

- Diff since `bd6b3b7`: 3 inserted lines in `Suggested.lean` (a comment and one `#check`), no README change, nothing outside the folder; the `#check` pins a library declaration, carries no docstring and names no process.
- Library declaration opened at the pin: `TauCeti/ModelTheory/Infinitary/Fragment.lean:373` (`generated_countable`, hypothesis `S.Countable`), the name the README cites at lines 142, 155, 337, 348, 593 and 1254.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0, prints the `#check` signature and seven `declaration uses sorry` warnings, nothing else, as the description's Validation paragraph says.
- Gate at `8c93fec`: every check passed (`readme-ids-missing=0`, `build=0`, `stray-files=0`, `outside-folder=0`).
- Dependency check: `depcheck: 261 roadmaps, 2595 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Pull-request text read against this head: the thirteen names of “What `Suggested.lean` states” are the thirteen declarations of the file; the Interfaces and Validation paragraphs agree with the head; no sentence is contradicted.
- Citations and overlaps: the one lead, `Theoryω.exists_countable_model_omitting` (README line 614), is declared at `Suggested.lean:71`; no dropped id and no other open pull request changes this folder. The source sample falls in no changed passage (the diff adds no locator).
- Padding: the `#check` is not a declaration; the seven theorems are unchanged, so the probes of the earlier reviews stand.

Overlap check: read HanfNumbers, CountableStructureSpaces, CountableModelCounting (open and main) and InfinitaryLogic for the object the diff touches (the countability of a generated fragment); nothing shared: it is Tau Ceti's and is cited, not restated.

Source independence: changed passages only; 1 passage compared (the comment before the `#check`) with 1 source (`marker2013`), none shared; largest share `marker2013`, 17 of 19 locators as counted in the earlier review; the diff adds, removes and reorders no layer, so the contents were not compared again.

Research link: the headline targets are the model existence, omitting types and interpolation theorems of Lω₁ω (López-Escobar 1965; Malitz 1969; Keisler 1971; Marker 2016), with Malitz interpolation as restated by Harrison-Trainor and Kretschmer (2024, Theorem 4.5); `pcSeparation` is consumed by CountableStructureSpaces. Rests on the README's summary and References.

## Not verifiable

- `marker2016`, `keisler1971`, `malitz1969`, `gao2009`: no legal full text, as in the previous reviews; no changed passage cites them.
- The Provenance table's file names of the external formalisation were not opened.

## Source issues

- **Misprint** in marker2013 at Theorem 1.31 proof, axiom (vi), p. 12, line 384: the source says the defining equivalence for a universal formula quantifies the free tuple a second time on the right; it should be quantify only the newly bound variable there; affects the proof.

## For the human reviewers

- Licence/provenance: `TauCetiRoadmap/InfinitaryModelExistence/README.md:1220` onwards cites an Apache-2.0 external formalisation as the origin of the constructions; an earlier review confirmed the licence header only, and whole-repository reuse was not audited.
