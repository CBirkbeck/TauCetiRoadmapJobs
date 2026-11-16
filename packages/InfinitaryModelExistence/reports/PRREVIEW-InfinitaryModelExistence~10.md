# Review of InfinitaryModelExistence (pull request #1615 at bd6b3b7)

**Verdict:** needs changes

Incremental re-review of the 69 lines changed since `92ff6a6`. The three P2 findings of the previous review are repaired; the six P3 findings below are carried, none is new.

## R01 (P3) — The gate still fails on a native name

**Location:** `TauCetiRoadmap/InfinitaryModelExistence/README.md:337`, “`Fragment.generated_countable`: a countable `S` generates a countable fragment”; gate: `readme-ids-missing: Fragment.generated_countable`.
**Claim:** The push gate fails at this head with that one line, so the folder cannot be accepted. The name is Tau Ceti's, but `Suggested.lean` declares `Fragment.slice` and never mentions this name.
**Witness:** Gate rerun at `bd6b3b7`: `readme-ids-missing=1`, every other count 0. The declaration is `TauCeti/ModelTheory/Infinitary/Fragment.lean:373`. Writing the name fully qualified at README line 337 leaves the count at 1.
**Repair:** Add the bare line `#check @FirstOrder.Language.Fragment.generated_countable` to `Suggested.lean` after the `variable` line of `section Types`, with a `--` comment and no docstring (a docstring before `#check` is a parse error). Tested on a copy: it elaborates and the gate reports `readme-ids-missing=0`.

## R02 (P3) — Results the pin proves are still written as targets

**Location:** `TauCetiRoadmap/InfinitaryModelExistence/README.md:503`, “`model_existence`: let `L` have countably many function and relation symbols”; likewise the targets listed in the table at `README.md:1251`–`1261`.
**Claim:** The layers still plan constructions and theorems that Tau Ceti proves at the pin; the table cites them but the targets are not replaced by supplier citations.
**Witness:** `TauCeti/ModelTheory/ModelExistence/ModelExistence.lean:84` (`model_existence`) and `TauCeti/ModelTheory/WellOrdering.lean:689` (`wellOrder_type_boundedness`); the table's last column records “none” for Layers 2, 4, 5 and 8.
**Repair:** Move the statements the table lists into the ownership and supplier-contract text, each with its fully qualified declaration and file; keep as targets only what the pin lacks (the variants in the table's last column and the thirteen declarations of `Suggested.lean`); keep every section number, with a mapping where a section becomes a contract.

## R03 (P3) — Two Lean definitions support no headline theorem

**Location:** `TauCetiRoadmap/InfinitaryModelExistence/Suggested.lean:57`, `Fragment.slice`; `TauCetiRoadmap/InfinitaryModelExistence/Suggested.lean:62`, `fragmentType`.
**Claim:** Neither definition occurs in any of the seven theorem statements. A definition stays in `Suggested.lean` only to make a headline statable; a consumer's citation by name is served by the README.
**Witness:** With both definitions deleted from a copy, the file elaborates with the same seven `sorry` warnings and no error.
**Repair:** Delete both from `Suggested.lean`; keep their definitions, API and Checks in §4.1 as prose (without backticks on the two names, or the gate will ask for them), and remove them from the list at `README.md:1263`–`1267` and from the description.

## R04 (P3) — The infinitary `toFormula` has no Checks

**Location:** `TauCetiRoadmap/InfinitaryModelExistence/README.md:267`, “The infinitary form of Mathlib's `BoundedFormula.toFormula` (bound positions become free variables `α ⊕ Fin n`)”.
**Claim:** The README says Tau Ceti lacks this definition at the pin (`README.md:274`), and gives it a Needs line but no Check; §0.4 has no `**Checks**` list.
**Witness:** `toFormula` occurs in the pinned Tau Ceti only as `AtomicIdx.toFormula` (`TauCeti/ModelTheory/Scott/AtomicDiagram.lean:41`), a different object; the next Checks list after §0.3 is in §1.2.
**Repair:** Add to §0.4 a `**Checks**` list: `R(a)` at arity `0` becomes `R(inl a)`; `R(x₀)` at arity `1` becomes `R(inr 0)`; `∀y x₀ = y` becomes `∀y (inr 0) = y`, with `y` still bound. On `{0, 1}` with `R = {0}`, `a = 1`, `x₀ = 0` the truth values are false, true, false on both sides; the third rejects a definition that captures `y`.

## R05 (P3) — The README lacks the required sections

**Location:** `TauCetiRoadmap/InfinitaryModelExistence/README.md:55`, “## Scope and dependency order”; the nine layers, `README.md:165`–`1110`.
**Claim:** There is no `**Summary.**` paragraph, no `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build` or `## Downstream consumers` heading, and no layer ends with `### Examples` and `### Dependencies`.
**Witness:** `grep -c '^### Examples\|^### Dependencies'` gives 0 for nine `## Layer` headings; the headings present are “Standing conventions”, “Existing library and ownership”, “Coordination”, “Provenance”.
**Repair:** Rename and regroup under the six headings (the supplier table of `README.md:113`–`120` and the implementation table become the supplier contracts; the consumer list of `README.md:125`–`157` becomes Downstream consumers); end each layer with `### Examples` (its acceptance example) and `### Dependencies` (its row of the table at `README.md:57`–`67`). No section number changes.

## R06 (P3) — The description is contradicted in one sentence and omits this head's moves

**Location:** Pull-request description, “there are `**Checks**` lists for every definition Tau Ceti lacks at the pin”.
**Claim:** The head has a definition Tau Ceti lacks with no Checks (R04). The description also does not say that the polarity laws of `relationalize` and `backTranslate` moved from Layer 6 to §7.3, nor that the §5.2 corollary now assumes a countable fragment.
**Witness:** `README.md:267`–`276` (no Checks); `README.md:920`–`927` (the polarity laws, formerly in Layer 6); `README.md:727` (“for a countable fragment `A`”).
**Repair:** After R04, the sentence is true once it names the bound-opening `toFormula` (§0.4) in its list. Add to Interfaces: “The polarity laws of the graph translation are stated in §7.3 after `relationsInSigned`; Layer 6 keeps the unsigned laws and entailment transfer. The corollary of §5.2 assumes a countable fragment.” After R03, drop `Fragment.slice` and `fragmentType` from the declaration lists.

## Previous findings

- R01 — repaired: “for a countable fragment `A` and a sentence `φ` with `⟨0, φ⟩ ∈ A`, the models of `φ` are exactly the reducts of the models of the countable first-order theory `T(A) ∪ {R_φ}` that omit `Γ(A)`”.
- R02 — repaired: “`functionsIn φ ⊆ functionsIn (substBounds σ φ) ⊆ functionsIn φ ∪ ⋃ i, Term.functionsIn (σ i)` … at `φ = ⊥` and `σ 0 = c` the three sets are `∅`, `∅` and `{c}`”.
- R03 — repaired: Layer 6 says “Its polarity law needs the signed occurrences of Layer 7 and is stated in 7.3”; §7.3 has “Polarity under the graph translation” after `relationsInSigned`, with its own Needs line.
- R04 — not repaired: “`model_existence`: let `L` have countably many function and relation symbols. If `s` is a countable member of a consistency property, then `s` has a countable model” (R02 above).
- R05 — not repaired: `def Fragment.slice (A : L.Fragment) (n : ℕ)` and `def fragmentType (A : L.Fragment) (M : Type w)` are still declared and used by no theorem (R03 above).
- R06 — not repaired: “The infinitary form of Mathlib's `BoundedFormula.toFormula` … with their realization laws”, followed by a Needs line and no Checks (R04 above).
- R07 — not repaired: headings “Scope and dependency order”, “Standing conventions”, “Existing library and ownership”; no `### Examples` or `### Dependencies` (R05 above).
- R08 — not repaired: “`Fragment.generated_countable`: a countable `S` generates a countable fragment”; the gate reports `readme-ids-missing: Fragment.generated_countable` (R01 above).
- R09 — partly repaired: the convention and “no Checks” sentences are gone and the new declarations are listed; “there are `**Checks**` lists for every definition Tau Ceti lacks at the pin” is still contradicted (R06 above).

## Verified sound

| Statement | Instance | Left / input value | Right / output value | Result |
|---|---|---|---|---|
| 0.2 occurrence law of `substBounds` | `φ = ⊥` at arity 1, `σ 0 = c` | `functionsIn φ = ∅`; `functionsIn (substBounds σ φ) = ∅` | `∅ ∪ {c} = {c}`; relations `∅ = ∅` | `∅ ⊆ ∅ ⊆ {c}`; upper inclusion strict, as the text says |
| 0.2 same law | `φ = R(x₀)`, `σ 0 = f(c)` | `functionsIn φ = ∅`; result `R(f(c))` has `{f, c}` | `∅ ∪ {f, c}`; relations `{R} = {R}` | Upper bound attained; lower inclusion strict |
| 5.2 corollary, countable `A` | `A` generated by `⋁ₖ ⊥`, `φ = ⋁ₖ ⊥` | Models of `φ`: none | `T(A) ∪ {R_φ}` omitting `{R_φ, ¬R_⊥}`: `R_⊥` false forces the type realized; none | Both sides empty |
| 5.2 corollary, countability | atoms `R_r(x₀)`, `r ∈ ℝ` | `A` has continuum many members | `T(A)`: one axiom `∀x (R_{R_r(x₀)}(x) ↔ R_r(x))` per `r`, pairwise distinct | Not countable; hypothesis needed |
| 7.3 polarity under `relationalize` | `φ = R(f(x))`; pinned body `∃y ((G-part) ⊓ R(y))`, `ex = not all not`, `⊓ = (φ → ¬ψ) → ⊥` | `φ`: positive `{R}`, negative `∅` | Translation: `R` under 2 flips from `ex` and 2 from `⊓`: positive `{base R}`, negative `∅` | Base polarity kept |
| 7.3 polarity under `relationalize` | `¬R(f(x))` | positive `∅`, negative `{R}` | Translation is `relationalize(R(f(x))) → ⊥`: positive base `∅`, negative `{base R}`; `G_f` negative | Kept; graph symbol takes the other sign too |
| 7.3 signed calculus of `backTranslate` | `θ = G_f(x, y) → R(x)` | positive `{base R}`, negative `{G_f}` | `f(x) = y → R(x)`: positive `{R}`, negative `∅` | Base symbols by sign; graph atom drops out |
| 7.3 `lyndon_interpolation` Needs | build order | Polarity laws need `relationsInSigned` (7.3) and Layer 6 at the pin | Lyndon needs them from 7.3 and entailment transfer from Layer 6 | No Layer 6 → Layer 7 edge remains |
| Layer 6 Needs (entailment transfer) | names at the pin | `graphExpansion`, `realize_relationalize`, `graphAxioms`, `reconstructStructure`, `realize_relationalize_reconstructStructure` | `GraphTranslation/Language.lean:230`, `Relationalize.lean:284`, `Reconstruct.lean:161`, `:248`, `:294` | All exist; no entailment-transfer theorem at the pin |

The rows of the previous review, of `92ff6a6`, stand for every statement the diff does not touch.

- Source locators: 1 reopened for the changed corollary, `marker2013` lines 356–394 (Theorem 1.31, p. 11, and Exercise 1.32, p. 12: countable vocabulary and countable theory, so the added hypothesis agrees with the source). The other changed passages carry no locator.
- Library declarations opened at the pin: `TauCeti/ModelTheory/Infinitary/SubstBounds.lean:343`, `:356`, `:383` (the three names the new 0.2 text cites, statements as quoted); `GraphTranslation/Relationalize.lean:172`, `BackTranslate.lean:114`, `:233`, `:251`; `Infinitary/Syntax.lean:119`–`150`; `Infinitary/Fragment.lean:373`.
- Cross-roadmap: no open roadmap or roadmap on main cites the polarity laws, `relationsInSigned`, `exists_firstOrder_presentation` or the Morley theory (search of all open heads and main); `scratch/overlaps.md` lists no dropped id and no other pull request changing this folder.
- Dependency check: `depcheck: 241 roadmaps, 2252 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Gate at `bd6b3b7`: FAIL, `readme-ids-missing=1` (`Fragment.generated_countable`, R01); every other count 0; nothing changed outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with seven `declaration uses sorry` warnings and nothing else, as the description says. The diff changes only the module docstring, so the 13 signatures and the padding probes of the previous review stand.
- Pins as the description states: Lean `v4.36.0-rc2`, Mathlib `1b1ccf4b0`, Tau Ceti `2fd255d99`.

Overlap check: read HanfNumbers, CountableStructureSpaces, CountableModelCounting (open and main) and InfinitaryLogic for the objects the diff touches; nothing shared. Ownership is as in the previous review.

Source independence: changed passages only; 3 passages compared with 1 source (`marker2013`), none shared; largest share `marker2013`, 17 of 19 locators as counted in the previous review; the diff adds, removes and reorders no layer, so the contents were not compared again.

## Not verifiable

- `marker2016`, `keisler1971`, `malitz1969`, `gao2009`: no legal full text, as in the previous review; no changed passage cites them.
- The Provenance table's move of `LyndonRelationalize` from the L6 row to the L7 row names a file of the external formalisation, which was not opened.

## Source issues

- **Misprint** in marker2013 at Theorem 1.31 proof, axiom (vi), p. 12, line 384: the source says the defining equivalence for a universal formula quantifies the free tuple a second time on the right; it should be quantify only the newly bound variable there; affects the proof.

## For the human reviewers

- Licence/provenance: `TauCetiRoadmap/InfinitaryModelExistence/README.md:1220` onwards cites an Apache-2.0 external formalisation as the origin of the constructions; the previous review confirmed the licence header only, and whole-repository reuse was not audited.
