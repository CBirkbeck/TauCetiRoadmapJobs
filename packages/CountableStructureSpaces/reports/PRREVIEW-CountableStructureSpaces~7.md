# Review of CountableStructureSpaces (pull request #1316 at cf843fd)

**Verdict:** needs changes

`README.md` and `Suggested.lean` are in `TauCetiRoadmap/CountableStructureSpaces/`; Tau Ceti and Mathlib paths are at the pins (Mathlib `1b1ccf4b0`, Tau Ceti `2fd255d99`). R01 and R02 are new and come from this round's change. R03–R09 carry the previous review's R02–R08.

## R01 (P3) — Step 0 and the negative control rebuild what the pins provide, and the supplier table omits it

**Location:** `README.md:591–594`, "A set measurable for the product σ-algebra (Convention 5) is determined by countably many atoms. Let `L₀` be the countable relational sublanguage of their symbols, `g : L₀ →ᴸ L` its inclusion"; `README.md:633`, "a single sentence mentions only countably many symbols".

**Claim:** This roadmap has to build the countable sublanguage, the countable support of a measurable set and the countability of a sentence's symbols itself, and the table at 126–141 lists everything Layer 5 consumes.

**Witness:** Mathlib `MeasurableSet.eq_preimage_restrict_countable` (`MeasureTheory/Constructions/Cylinders.lean:476`); Tau Ceti `symbSublang`, `symbSublangIncl`, `countable_relations_symbSublang` (`ModelTheory/Sublanguage.lean:63, 72, 105`), `BoundedFormulaInf.relationsIn_countable` (`Infinitary/Symbols.lean:289`). The table names none of these, nor `LHom.reductConfiguration`.

**Repair:**
- Step 0, first two sentences: "By Mathlib's `MeasurableSet.eq_preimage_restrict_countable`, `B` is determined by a countable set of atoms. Let `R` be the set of their symbols, `L₀ := symbSublang ∅ R` (countably many symbols, `countable_relations_symbSublang`) and `g := symbSublangIncl ∅ R`."
- §5.4: "a single sentence mentions only countably many symbols (`BoundedFormulaInf.relationsIn_countable`), and its truth depends only on them (`realize_restrictSymbols`)".
- Add to the table:
  - the Mathlib measurable-spaces row: `MeasurableSet.eq_preimage_restrict_countable`;
  - the Tau Ceti `ModelTheory/Infinitary/` row: `LHom.onBoundedFormulaInf`, `BoundedFormulaInf.relationsIn_countable` and `realize_restrictSymbols`, with `symbSublang`, `symbSublangIncl` and `countable_relations_symbSublang` from `ModelTheory/Sublanguage.lean`;
  - the `RelationalConfiguration/` row: `LHom.reductConfiguration` with `measurable_reductConfiguration`, `reductConfiguration_perm_smul` and `realize_sentenceInf_reductConfiguration` (`LanguageMap.lean`).

Tested in a scratch file: with `g := symbSublangIncl ∅ R` the last line of step 0 elaborates (`[L.IsRelational]` alone gives the sublanguage's instance), and `Countable R` gives `Countable (L₀.Relations n)` for each `n`.

## R02 (P3) — Convention 5 says "relation symbols" where it means atoms

**Location:** `README.md:84–86`, "With uncountably many relation symbols the two differ: the topology is compact but not metrizable, and its Borel σ-algebra is strictly larger".

**Claim:** With uncountably many relation symbols, the product σ-algebra is smaller than the Borel σ-algebra on every carrier.

**Witness:** Take the carrier `Fin 0` (an instance, by Convention 2) and uncountably many unary symbols. `Atom L (Fin 0)` is empty because `Fin 1 → Fin 0` is, so the space is a single point, it is metrizable, and both σ-algebras are `⊤`.

**Repair:** "With uncountably many atoms (for instance uncountably many relation symbols on a nonempty carrier such as `ℕ`) the two differ: …". On `Fin 0` the hypothesis now fails. On `ℕ` with `P_r` for `r ∈ ℝ` it holds, and the all-empty singleton separates the two σ-algebras.

## R03 (P3) — Padding: twelve lemmas proved in place, two computed values, an unused definition

**Location:** `Suggested.lean`:
- proved in place: 94 `hasBasis_nhds_one_fixingSubgroup`, 104 `eval_smul_atom`, 113 `continuousSMul_relationalConfiguration`, 131 `isFixedBlock_iff_isomorphismInvariant`, 140 `measurableSet_iInf_invariants_iff`, 160 `analyticSet_orbitRel_graph`, 183 `isomorphismInvariant_modelsOf`, 214 `body_mono`, 288 `setOf_iso_eq_modelsOf_scottSentence`, 301 `bfEquiv_of_selfStabilizesCompletely`, 336 `orbitRank_le_scottHeight`, 544 `saturated_iff_isFixedBlock`;
- computed values: 639 `scottHeight_fin_pureSet`, 645 `scottHeight_nat_pureSet`;
- 608 `descTree`, which no statement uses.

`README.md:193–195` says `Suggested.lean` "restates only those whose form here differs from the library's … proving them by the library's theorems".

**Claim:** These declarations belong in the acceptance test.

**Witness:** Each of the twelve is closed in the file by one to three pinned declarations, for example line 97 `Equiv.Perm.hasBasis_nhds_one_fixingSubgroup.to_hasBasis` and line 294 `realize_scottSentence_iff`. `descTree` occurs only at line 608.

**Repair:** Delete the fifteen declarations. The README keeps each statement, cited to the library declaration that gives it, and names with no declaration become prose:

| README name | Write instead |
| --- | --- |
| `eval_smul_atom` | `eval_perm_smul` |
| `hasBasis_nhds_one_fixingSubgroup` | `Equiv.Perm.hasBasis_nhds_one_fixingSubgroup`, reindexed |
| `isFixedBlock_iff_isomorphismInvariant` | `isomorphismInvariant_iff_isInvariantBlock` with `MulAction.isInvariantBlock_iff_isFixedBlock` |
| `isomorphismInvariant_modelsOf` | `Language.Equiv.mem_modelsOf_iff` (the name stays as a README target, because CountableModelCounting consumes it) |
| `setOf_iso_eq_modelsOf_scottSentence` | `realize_scottSentence_iff` |
| `bfEquiv_of_selfStabilizesCompletely` | `SelfStabilizesCompletely.bfEquiv_add_one_of_isSuccLimit` with `bfEquiv_of_le_of_forall_add_one` |
| the other nine | prose |

At 193–195 write "cites the implemented milestones by name". Carried from the previous review's R02.

## R04 (P3) — The `pcSeparation` stand-in is still in the acceptance file

**Location:** `Suggested.lean:425–448`, "Checked against revision 35db8dff of that roadmap (follow-up TauCetiRoadmap #1615). The copy is prototype scaffolding"; the docstring sentence at 38–40; `README.md:793–795`, "`Suggested.lean` repeats that roadmap's statement verbatim, marked with its owner and the owner's revision it matches".

**Claim:** The acceptance test needs a copy of the supplier's theorem.

**Witness:** No statement in the file uses `pcSeparation`. InfinitaryModelExistence on main states it (`README.md:685`, `Suggested.lean:723–733`). Line 428 carries a pull-request number.

**Repair:** Delete lines 425–448 and the sentence at 38–40. At `README.md:793–795` keep "`pcSeparation` is not at the pin" and drop the rest of the sentence. Carried from the previous review's R03.

## R05 (P3) — Four backticked names of this roadmap that `Suggested.lean` does not declare

**Location:** `README.md:207, 396` (`IsBranch`); 575, 613 (`realize_pcSentence_standardWitness`); 578, 603 (`exists_code_of_realize_pcSentence`); 607 (`sumStructure_reducts`).

**Claim:** Each backticked name of this roadmap's own is declared in `Suggested.lean`.

**Witness:** None of the four occurs in `Suggested.lean`, the pinned Tau Ceti or the pinned Mathlib. Lines 572–573 themselves say that the two PC-sentence statements are recorded together as `exists_pcSentence`.

**Repair:** State the four facts in prose ("branches", "completeness", "soundness", "an `(L.sum W)`-structure is the sum of its two reducts") and add no declarations. Carried from the previous review's R04.

## R06 (P3) — No claim-level locators

**Location:** `README.md:283–690` (§§1.1–6.2, including the new §5.3 step 0 and the §5.4 negative control); the References at 829–846 cite whole works.

**Claim:** Every theorem has an exact locator into a legal source.

**Witness:** §5.3 states the hard direction with no locator, although Marker's 2013 notes prove it at Theorem 4.26, p. 51 (`marker2016` line 1724), for countable vocabularies (the standing assumption at line 1284).

**Repair:** Attach locators at the claims:

| Claim | Locator |
| --- | --- |
| Action convention (§1.2) | Marker notes p. 30 (`marker2016` lines 995–998) |
| Model classes Borel and invariant (§5.1) | Marker notes Lemma 3.1 and Corollary 3.3, pp. 29–30 |
| Orbits Borel (§4.1) | Marker notes Corollary 3.4, p. 30; Vaught 1974, Corollary 2.6, p. 280 |
| PC sentence of a tree (§5.2) | Marker notes Lemma 4.24, pp. 50–51 |
| Hard direction, countable `L` (§5.3, steps 1–4) | Marker notes Corollary 4.23 and Theorem 4.26, pp. 50–51; Vaught 1974, Corollary 3.3, p. 285 |
| Every relational `L` (§5.3, step 0) | this roadmap's own reduction, with `MeasurableSet.eq_preimage_restrict_countable`. Do not cite Vaught's remark after Corollary 3.3 (p. 285) here: his uncountable case uses the logic of p. 283, whose closed formulas may be uncountable conjunctions |
| Negative control (§5.4) | Vaught 1974, p. 283 (why his topological form holds there and fails for `L.Sentenceω`) |
| Invariant separation (§6.1) | Vaught 1974, statement (10), p. 281; Marker notes Corollary 4.25, p. 51 |

Cite Marker as the 2013 notes, record Kechris and Gao as uncertified, and say that §§4.2–4.4 are this roadmap's own statements. Carried from the previous review's R05. That review cited p. 285 as agreeing with step 0, and the last two rows correct this.

## R07 (P3) — No `**Checks.**` lists

**Location:** The README has no `**Checks.**` list. `queryCode` (259), `StrictExt` and `treeHeight` (398–403), `KBLT` (404), `bfTree` (518), `pcWitnessLanguage` and `standardWitness` (556–577), and `codeRel`, `wellOrderClass` and `descTree` (662–675) have at most one acceptance check per layer.

**Claim:** Every definition has at least three discriminating Checks.

**Witness:** `treeHeight` of ⊥, `{[]}` and the decreasing-sequence tree is 0, 1 and ω + 1, while a supremum of ranks gives 0, 0 and ω. For `bfTree`, P = {0} against P = ∅ gives the tree `{[]}`.

**Repair:** Add at least three Checks per definition:
- `treeHeight`: the three values above.
- `KBLT`: `[0,1] <KB [0]` and `[0,5] <KB [1]` hold; `[1] <KB [0,5]` fails.
- `queryCode`: constantly `false` in the empty language; `c.eval a = queryCode c (encode a)`; two codes that differ at one atom differ at its index.
- `bfTree`: P = {0} against P = ∅ gives `{[]}` of height 1; a disagreeing nullary relation gives ⊥; P = {0} against P = {1} has the branch of (0 1).
- the PC sentence: the standard witness is a model; ℕ with a disjoint ℤ-chain fails the numeral axiom; `T = ⊥` has no model.
- `wellOrderClass` and `descTree`: (ℕ, <) is in the class, with tree height ω + 1; (ℤ, <) has a branch; a reflexive relation is not in the class.

Carried from the previous review's R06.

## R08 (P3) — README shape, dependencies and the Lean docstring

**Location:** Headings at `README.md:37, 122, 224–660, 728, 782, 809`; `Suggested.lean:20–42`.

**Claim:** The README and the Lean file follow the house form.

**Witness:**
- There is no `**Summary.**`, no `*Needs:*`, no `### Examples` and no `### Dependencies` (a search finds 0 of each).
- `## Scope and ownership`, `## Exact supplier contracts`, `## How to read the build` and `## Downstream consumers` are absent.
- The docstring is titled "suggested signatures" and says "Names and namespaces are provisional".

**Repair:**
- Map the material onto the house sections: Scope and ownership from 37–56 and 186–222; supplier contracts from 122–184 and the "At the pin" paragraphs; consumers from 803–804.
- Give each target a `*Needs:*` line, for example `lopez_escobar`: `MeasurableSet.eq_preimage_restrict_countable`, `symbSublang`, `realize_sentenceInf_reductConfiguration`, `exists_tree_of_analyticSet`, §5.2, `pcSeparation` (InfinitaryModelExistence Layer 7), `isoSetoid`, `Equiv.encodeVia`.
- End each layer with Examples and Dependencies.
- Title the docstring "…: target signatures", say that it states the headline theorems against the pinned APIs, and drop "allowed in this human-owned roadmap library" and "Names and namespaces are provisional".

Carried from the previous review's R07.

## R09 (P3) — The pull-request description contradicts the head in two places

**Location:** The description, in the author's text: "(72 → 44 `sorry`)" under "Native imports at the new pin"; "a compact space, Polish for countable carriers (ℕ and the finite carriers `Fin n` included)" under "The space and the action".

**Claim:** The description states what the head contains.

**Witness:** The head has 39 `sorry` (elaboration: 39 warnings). `README.md:64–66` makes Polishness need countably many relation symbols as well, and 84–86 say that with uncountably many the space is not metrizable.

**Repair:** Write "(72 → 39 `sorry`)" and "a compact space, Polish for countable carriers (ℕ and `Fin n` included) when the language has countably many relation symbols". Carried from the previous review's R08 (the first sentence). The second sentence is wrong now that the description covers every relational language.

## Previous findings

- R01 — repaired: `Suggested.lean:500` "theorem lopez_escobar [L.IsRelational]" (likewise 507, 513, 520); `README.md:588` "for every relational `L`"; step 0 at 591–598; the negative control at 630–635. The repair introduced R01 and R02 here.
- R02 — not repaired: `Suggested.lean:97` "Equiv.Perm.hasBasis_nhds_one_fixingSubgroup.to_hasBasis"; the twelve proved lemmas, the two pure-set values and `descTree` (608) are unchanged (R03 here).
- R03 — not repaired: `Suggested.lean:428` "Checked against revision 35db8dff of that roadmap (follow-up TauCetiRoadmap #1615)" (R04 here).
- R04 — not repaired: `README.md:607` "The step uses `sumStructure_reducts`" (R05 here).
- R05 — not repaired: §§1.1–6.2 carry no locator, and neither does the new step 0 (R06 here).
- R06 — not repaired: the README has no `**Checks.**` list (R07 here).
- R07 — not repaired: `README.md:37` "## Scope and dependency order"; `Suggested.lean:21` "suggested signatures" (R08 here).
- R08 — partly repaired: "the logic action is Tau Ceti's relabelling action", "sorry warnings (39)", "consumes three remaining targets", `saturated_iff_isFixedBlock`; "(72 → 44 `sorry`)" remains (R09 here).

## Verified sound

P{S} is the code of a unary predicate P = S on ℕ; c₀ is the all-empty code for `P_r`, `r ∈ ℝ`; ext is extension by `false`.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `lopez_escobar`, every relational `L` | empty language; `P_r`, B = {P₀ ≠ ∅}; B = {c₀}; B = {P₀(0)} | ∅ = Mod ⊥, univ = Mod ⊤; I = {P₀(n)}, L₀ = {P₀}, φ₀ = ∃x P₀x, B = Mod(g φ₀); {c₀} not measurable; not invariant, and no model class | pass | — |
| §5.3 step 0 | σ = (0 1); c an `L`-code | (σ•ext c₀)(R,v) = [R ∈ L₀]·c₀(R,σ⁻¹v) = ext(σ•c₀)(R,v); ext(reduct c) = c on atoms of L₀ ⊇ I, so B = reduct⁻¹ B₀ | pass; the transfer elaborates | R01 |
| `lopezEscobar_iff`, easy half | any relational `L`, φ = ∃x P₀x | `measurableSet_modelsOf` needs only `[L.IsRelational] [Countable ι] [Countable V]` (`ModelsOf.lean:165`); measurable and invariant | pass | — |
| `lopezEscobar_action_iff` | B = {P₀ ≠ ∅}; B = {P₀(0)} | fixed by every σ: T ↔ T; (0 1) sends B to {P₀(1)} ≠ B: F ↔ F | pass | — |
| `measurableSet_iInf_invariants_iff_exists_modelsOf` | the same two B | T ↔ T; F ↔ F; follows from `measurableSet_iInf_invariants_iff` (every `L`) and the action form | pass | — |
| `analyticSet_iff_exists_pc`, countability kept | `P_r` with {c₀}; one P with "exactly one P" | {c₀} is analytic (constant map) and invariant but not PC (ψ omits some P_r, and changing it keeps ψ true): the hypothesis is needed; T ↔ T | pass | — |
| Convention 5, "the two differ" | ℕ with `P_r`; `Fin 0` with unary `P_r` | {c₀} is closed but not product-measurable: they differ; `Atom` is empty, one point: equal | fails on `Fin 0` | R02 |
| §5.4 negative control | `P_r`, {c₀} | closed (Hausdorff); a measurable set containing c₀ contains the code with P_r = {0} for every r ∉ I (`eq_preimage_restrict_countable`) | pass | R01 |

The rows for untouched statements stand as in the previous review, of `31039c3`.

- **Gate**, run at `cf843fd`: `set_option=0 … imports=0 … statement-hygiene=0 … readme-ids-missing=0 … depcheck=0 … stray-files=0 … outside-folder=0 … OK`. The worker's run adds `build=0`. There are no changes outside the folder.
- **Dependency check:** `depcheck: 207 roadmaps, 1914 edges, 0 problem(s)`.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0 with 39 warnings, all `declaration uses 'sorry'`. The elaborated types of the five changed declarations match §§5.3–5.4; only `analyticSet_iff_exists_pc` keeps `[∀ n, Countable (L.Relations n)]`.
- **Padding probe:** on the five changed statements, `first | rfl | infer_instance | (simp; done) | exact?` failed all five times.
- **Lean probe of step 0:** with `g := symbSublangIncl ∅ R`, `B = modelsOf (g.onBoundedFormulaInf φ₀)` follows from `realize_sentenceInf_reductConfiguration`, and `measurableSet_modelsOf` elaborates with no countability of `L`.
- **Library declarations opened at the pins (14):** Tau Ceti `RelationalConfiguration/Basic.lean:182` (the σ-algebra is `MeasurableSpace.pi`), `Topology.lean:103`, `LanguageMap.lean:79, 107, 112, 167`, `ModelsOf.lean:165`, `ModelTheory/Sublanguage.lean:63, 72, 105`, `Infinitary/Symbols.lean:289`, `Infinitary/Sublanguage.lean:195`, `Infinitary/LanguageMap.lean:76`; Mathlib `MeasureTheory/Constructions/Cylinders.lean:476`.
- **Sources at the changed passages (5 locators):** Vaught 1974, §3 setup p. 283, Corollary 3.3 and the remark after it p. 285 (`vaught1974`, read from the page images); Marker notes, standing assumption of §4 (`marker2016` line 1284) and Theorem 4.26 (line 1724).
- **Cross-roadmap:** InfinitaryModelExistence on main states `pcSeparation` (`Suggested.lean:723`); `overlaps.md` lists no dropped id. Remark: InfinitaryModelExistence at its open revision (README 683–684) still says López–Escobar "needs the countable language". This head now says that only of the analytic half; it is a matter for that roadmap's review.

## Not verifiable

- Kechris (1995), Gao (2009), Keisler (1971) and Marker (2016, the book) are paywalled with no legal open copy, so they were not read. Marker's 2013 author notes were read instead.
- Vaught (1974): only pp. 282–285 were read, from the page images; the OCR of the scan interleaves the two columns of each spread.

## Source issues

- none
