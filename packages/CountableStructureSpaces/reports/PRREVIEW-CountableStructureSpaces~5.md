# Review of CountableStructureSpaces (pull request #1316 at 31039c3)

**Verdict:** needs changes

This is a full review: the folder changed by 545 lines since `7cb889e`. The gate passes on every check, `Suggested.lean` elaborates with 39 `sorry` warnings and nothing else, and the dependency check reports no problem. I found no false or vacuous statement. All eight findings are P3. One is new (R01: the López–Escobar statements carry a countable-language hypothesis they do not need, and the README says it is needed); the other seven are what remains of the previous review's findings.

Paths: `README.md` and `Suggested.lean` are in `TauCetiRoadmap/CountableStructureSpaces/`. Tau Ceti paths are under `TauCeti/` and Mathlib paths under `Mathlib/`, at the pins (Mathlib `1b1ccf4b0`, Tau Ceti `2fd255d99`; the branch and main pin the same revisions).

## R01 (P3) — López–Escobar does not need countably many relation symbols

**Location:** `Suggested.lean:496, 503, 509, 516–517` (`lopez_escobar`, `lopezEscobar_iff`, `lopezEscobar_action_iff`, `measurableSet_iInf_invariants_iff_exists_modelsOf`, each with `[∀ n, Countable (L.Relations n)]`); `README.md:582` ("for countable relation symbols"); `README.md:150–151`, "A countable carrier alone does not give this correspondence: it needs the countable language."

**Claim:** The identification of invariant Borel sets with Lω₁ω model classes needs a countable language.

**Witness:** For the product σ-algebra (Convention 5) a measurable `B` depends on countably many atoms, hence on a countable sublanguage `L₀`; the countable case there gives `φ₀`, and its image in `L` defines `B`. Vaught 1974, remark after Corollary 3.3, p. 285, says the same.

In detail: let `S` be a countable set of atoms that decides membership in `B`, `L₀` the sublanguage of the symbols occurring in `S`, and `B₀` the set of `L₀`-codes whose extension by `false` lies in `B`. Then `B₀` is measurable and invariant (extension by `false` is measurable and commutes with the action), `B` is the preimage of `B₀` under Tau Ceti's `reductConfiguration`, and `realize_sentenceInf_reductConfiguration` (`ModelTheory/RelationalConfiguration/LanguageMap.lean:167`) transfers the sentence. The easy direction already needs no countability (`measurableSet_modelsOf`, `ModelsOf.lean:165`).

**Repair:**
- Drop `[∀ n, Countable (L.Relations n)]` from the four declarations.
- In §5.3 add the reduction to a countable sublanguage as step 0, and write "for every relational `L`" at line 582.
- Replace the sentence at 150–151 by: the analytic half (`analyticSet_iff_exists_pc`) needs countably many relation symbols; the Borel half does not.
- Add the negative control as a Check for the analytic half: with unary predicates `P_r` for `r ∈ ℝ`, the code with every `P_r` empty is a fixed point, so its singleton is invariant and analytic, but it is not a PC class (a single sentence mentions countably many symbols).

Tested on that language: `{c | P₀ ≠ ∅}` is measurable, invariant and equal to `Mod(∃x P₀ x)`; the singleton above is not measurable and not a model class, so both sides of `lopezEscobar_iff` are false there.

## R02 (P3) — Padding: twelve lemmas proved in place, two computed values, an unused definition

**Location:** `Suggested.lean`
- proved in place: 94 `hasBasis_nhds_one_fixingSubgroup`, 104 `eval_smul_atom`, 113 `continuousSMul_relationalConfiguration`, 131 `isFixedBlock_iff_isomorphismInvariant`, 140 `measurableSet_iInf_invariants_iff`, 160 `analyticSet_orbitRel_graph`, 183 `isomorphismInvariant_modelsOf`, 214 `body_mono`, 288 `setOf_iso_eq_modelsOf_scottSentence`, 301 `bfEquiv_of_selfStabilizesCompletely`, 336 `orbitRank_le_scottHeight`, 537 `saturated_iff_isFixedBlock`;
- computed worked-example values: 632 `scottHeight_fin_pureSet`, 638 `scottHeight_nat_pureSet`;
- 601 `descTree`, which no statement uses.

`README.md:187–189` says `Suggested.lean` "restates only those whose form here differs from the library's … proving them by the library's theorems".

**Claim:** These belong in the acceptance test.

**Witness:** Each of the twelve is closed in the file by one to three pinned declarations, for example `Equiv.Perm.hasBasis_nhds_one_fixingSubgroup.to_hasBasis` (line 97) and `realize_scottSentence_iff` (line 294). `descTree` occurs only at line 601.

**Repair:** Delete the fifteen declarations; the previous review asked for deletion, not for proofs in place. The README keeps each statement, cited to the library declaration that gives it, and names without a declaration become prose:

| README name | Write instead |
| --- | --- |
| `eval_smul_atom` | `eval_perm_smul` |
| `hasBasis_nhds_one_fixingSubgroup` (Finset form) | `Equiv.Perm.hasBasis_nhds_one_fixingSubgroup`, reindexed |
| `isFixedBlock_iff_isomorphismInvariant` | `isomorphismInvariant_iff_isInvariantBlock` with `MulAction.isInvariantBlock_iff_isFixedBlock` |
| `isomorphismInvariant_modelsOf` | `Language.Equiv.mem_modelsOf_iff` (the name stays as a README target, since CountableModelCounting consumes it) |
| `setOf_iso_eq_modelsOf_scottSentence` | `realize_scottSentence_iff` |
| `bfEquiv_of_selfStabilizesCompletely` | `SelfStabilizesCompletely.bfEquiv_add_one_of_isSuccLimit` with `bfEquiv_of_le_of_forall_add_one` |
| the other nine | prose |

The one-tactic probe found no padding among the 39 sorried statements (see Verified sound). Carried from the previous review's R01 and R02: the "still to build" lists are now correct and 25 restatements came down to 12, but the seven one-step targets were proved in place.

## R03 (P3) — The `pcSeparation` stand-in is still in the acceptance file

**Location:** `Suggested.lean:425–448`, "Checked against revision 35db8dff of that roadmap (follow-up TauCetiRoadmap #1615). The copy is prototype scaffolding"; the docstring sentence at 38–40; `README.md:773–775`, "`Suggested.lean` repeats that roadmap's statement verbatim, marked with its owner and the owner's revision it matches".

**Claim:** The acceptance test needs a copy of the supplier's theorem.

**Witness:** No statement in the file uses `pcSeparation`; line 438 only declares it. InfinitaryModelExistence on main states it (`README.md:685`, `Suggested.lean:723–733`). Line 428 also carries a pull-request number and a revision record.

**Repair:** Delete lines 425–448 and the sentence at 38–40. At `README.md:773–775` keep "`pcSeparation` is not at the pin" and drop the rest of the sentence. The contract at `README.md:139–178` stays as it is. Carried from the previous review's R04; only the revision hash changed.

## R04 (P3) — Four backticked names of this roadmap that `Suggested.lean` does not declare

**Location:** `README.md:201, 390` (`IsBranch`); 569, 599 (`realize_pcSentence_standardWitness`); 572, 589 (`exists_code_of_realize_pcSentence`); 593 (`sumStructure_reducts`).

**Claim:** A backticked name of this roadmap's own is declared in `Suggested.lean`.

**Witness:** A search of `Suggested.lean`, the pinned Tau Ceti and the pinned Mathlib finds none of the four. Line 566–567 itself says the two PC-sentence statements are recorded together as `exists_pcSentence`.

**Repair:** State the four facts in prose ("completeness", "soundness", "an `(L.sum W)`-structure is the sum of its two reducts", "branches"), and add no declarations. Carried from the previous review's R07; the other six names of that finding are repaired.

## R05 (P3) — No claim-level locators

**Location:** `README.md:277–670` (§§1.1–6.2) has no theorem, page or section locator at any claim; the References at 811–826 cite whole works.

**Claim:** Every theorem has an exact locator into a legal source.

**Witness:** Locators I read at the text this round (the two Fundamenta papers are open scans at IMPAN's archive; Marker is the 2013 author notes):

| Claim | Locator |
| --- | --- |
| Action convention (§1.2) | Marker notes p. 30 (`marker2016` lines 995–998) |
| Model classes Borel and invariant (§5.1) | Marker notes Lemma 3.1 and Corollary 3.3, pp. 29–30 |
| Orbits Borel (§4.1) | Marker notes Corollary 3.4, p. 30; Vaught 1974, Corollary 2.6, p. 280 |
| PC sentence of a tree (§5.2) | Marker notes Lemma 4.24, pp. 50–51 |
| Hard direction (§5.3) | Marker notes Corollary 4.23, Theorem 4.26 and footnote 8, pp. 50–51; Vaught 1974, Corollary 3.3, p. 285 |
| López-Escobar's own form | López-Escobar 1965, §5: the set form is stated in the text of p. 268 (credited there to D. Scott, conditional on interpolation); Theorem 5.3, p. 269, is the function form |
| Invariant separation (§6.1) | Vaught 1974, statement (10), p. 281; Marker notes Corollary 4.25, p. 51 |

**Repair:** Attach these at the claims. Cite Marker as the 2013 notes, since the 2016 numbering is unverified. Record Kechris §§2, 9, 31 and Gao as uncertified. Say that §§4.2–4.4 are this roadmap's own statements and cite the reference formalization by revision and declaration. Carried from the previous review's R09.

## R06 (P3) — No `**Checks.**` lists

**Location:** The README has no `**Checks.**` list. `queryCode` (253), `StrictExt` and `treeHeight` (392–397), `KBLT` (398), `bfTree` (512), `pcWitnessLanguage` and `standardWitness` (550–571), `codeRel`, `wellOrderClass` and `descTree` (642–655) have at most one acceptance check per layer.

**Claim:** Every definition has at least three discriminating Checks.

**Witness:** Values a wrong definition gets wrong, recomputed this round: `treeHeight` of ⊥, `{[]}` and the decreasing-sequence tree is 0, 1, ω + 1, while a supremum of ranks gives 0, 0, ω. For `bfTree`, P = {0} against P = ∅ gives the tree `{[]}`.

**Repair:** Add at least three Checks per definition:
- `treeHeight`: the three values above.
- `KBLT`: `[0,1] <KB [0]` and `[0,5] <KB [1]` hold; `[1] <KB [0,5]` fails.
- `queryCode`: constantly `false` in the empty language; `c.eval a = queryCode c (encode a)`; two codes differing at one atom differ at its index.
- `bfTree`: P = {0} against P = ∅ gives `{[]}`, of height 1 (and `BFEquiv 0` holds, `BFEquiv 1` fails); a disagreeing nullary relation gives ⊥; P = {0} against P = {1} has the branch of the transposition (0 1).
- the PC sentence: the standard witness is a model; ℕ with a disjoint ℤ-chain fails the numeral axiom; a 2-cycle successor fails "range misses zero"; `T = ⊥` has no model.
- `wellOrderClass` and `descTree`: (ℕ, <) is in the class with tree height ω + 1; (ℤ, <) transported to ℕ has a branch; a reflexive relation is not in the class.

Carried from the previous review's R10.

## R07 (P3) — README shape, dependencies and the Lean docstring

**Location:** Headings at `README.md:37, 118, 218–627, 708, 762, 789`; `Suggested.lean:20–42`.

**Claim:** The README and the Lean file follow the house form.

**Witness:**
- There is no `**Summary.**`, no `*Needs:*` line, no `### Examples` and no `### Dependencies`.
- There is no `## Scope and ownership`, `## Exact supplier contracts`, `## How to read the build` or `## Downstream consumers`; `## Completion criteria`, `## Coordination` and `## Provenance` are not house sections.
- "At the pin." library inventories sit inside Layers 0, 1.1, 1.2, 2 and 4.1 (220, 279, 298, 342, 428).
- The module docstring is titled "suggested signatures" and says "allowed in this human-owned roadmap library" and "Names and namespaces are provisional".

**Repair:**
- Map the material onto the house sections: Scope and ownership from 37–56 and 180–216; supplier contracts from 118–178 and the "At the pin" paragraphs; consumers from 783–784.
- Give each target a `*Needs:*` line. For example `lopez_escobar`: `exists_tree_of_analyticSet`, §5.2, `pcSeparation` (InfinitaryModelExistence Layer 7), Tau Ceti `isoSetoid` and `Equiv.encodeVia`.
- End each layer with Examples and Dependencies.
- Title the docstring "…: target signatures", say that it states the headline theorems against the pinned APIs, and drop the two quoted phrases.

Carried from the previous review's R11.

## R08 (P3) — The pull-request description no longer describes the head

**Location:** The description, in the author's text (no generated block).

**Claim:** The description states what the head contains.

**Witness:** Sentences that the head contradicts:
- "the logic action is Mathlib's `arrowAction`": `README.md:73` uses Tau Ceti's relabelling action.
- "with only the expected `sorry` warnings (44)" and "(72 → 44 `sorry`)": the head has 39.
- "`autoImplicit false`, rendered TeX, and Mathlib/Tau Ceti design references are kept": the head has no `set_option`.
- "`saturated_iff_actionInvariant`": the head's name is `saturated_iff_isFixedBlock`.
- "consumes four remaining targets listed in the README": `README.md:193–194` lists three.

**Repair:** Update these five sentences to the head (and again after R02 and R03 change the counts).

## Previous findings

The findings of the review at `7cb889e`, checked one by one at this head.

- **R01 ("still to build" lists seven targets the pin proves): partly repaired.** The lists are corrected, for example `README.md:227–228` "Still to build: the finite-cylinder basis, the query code, the equality case of the cardinality bound and closedness of the range of the graph coding". The seven declarations were proved in place instead of deleted (R02 here).
- **R02 (padding): partly repaired.** The two `inferInstance` examples, `modelsOfBounded`, `bfEquivSet` and 13 restatements are gone. Twelve proved lemmas, the two pure-set values and `descTree` remain (R02 here).
- **R03 (`ActionInvariant`): repaired.** `Suggested.lean:509–512` reads "`(MeasurableSet B ∧ MulAction.IsFixedBlock (Equiv.Perm ℕ) B) ↔`", and Convention 6 (`README.md:85–88`) cites Mathlib's predicate.
- **R04 (`pcSeparation` stand-in): not repaired** (R03 here).
- **R05 (`set_option`): repaired.** The gate reports `set_option=0`; the file has none.
- **R06 (`letI` in signatures): repaired.** For example `Suggested.lean:291` "`modelsOf (@scottSentence L _ ℕ c.toStructure _ _)`"; the gate reports `statement-hygiene=0`.
- **R07 (undeclared names): partly repaired.** Four names remain (R04 here).
- **R08 (pull-request numbers and process words): repaired in the README** (gate `prnum=0`, `residue=0`; the sibling links are gone and line 792 says "at revision"). The Lean "#1615" remains and is part of R03 here.
- **R09 (locators): not repaired** (R05 here).
- **R10 (Checks): not repaired** (R06 here).
- **R11 (README shape): not repaired** (R07 here).
- **R12 (CountableModelCounting cites old names): withdrawn.** This roadmap is not on main, so the pull request drops no id from main; the old names are CountableModelCounting's to update, and its open revision already cites the Tau Ceti names (its README, section "From CountableStructureSpaces", items S1–S7).

## Verified sound

**Head and scope.** The head is `31039c31dfb1ee24a056675946299aee112dfb96` and the worktree is clean. `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md` (826 lines), `Suggested.lean` (642) and `metadata.toml`.

**Gate**, run at this head: every check passes (`set_option=0 … imports=0 … statement-hygiene=0 … readme-ids-missing=0 … depcheck=0 … stray-files=0 … outside-folder=0 … OK`), matching the worker's run.

**Dependency check**, exactly as prescribed:

```text
depcheck: 229 roadmaps, 2122 edges, 0 problem(s)
```

The suppliers named in the README are InfinitaryLogic (`Completed/`), InfinitaryModelExistence and BorelEquivalenceRelations, all on main; CountableModelCounting is cited as a consumer only. None of the three suppliers consumes this roadmap.

**Elaboration.** `lake env lean` on `Suggested.lean` exits with 39 warnings, all `declaration uses sorry`, and no other message.

**Signature pass.** I compared the elaborated types of all 68 declarations in the worker's `signatures.md` with the README statements. No binder is lost: `analytic_treeHeight_bounded` keeps `[TopologicalSpace X]` and nothing more, as the README says; `exists_uniform_bfSeparation` carries only `[L.IsRelational]`, matching §4.4 (no countability is needed, since the boundedness theorem holds on any topological space); `invariant_analytic_separation` has no `[L.IsRelational]`, as stated. `treeHeight` uses the sorried `wellFounded_strictExt_iff` only as a proof term, so it is not sorried data.

**Padding probe.** On a scratch copy every `sorry` was replaced by `first | rfl | infer_instance | (simp; done) | exact?`. All 39 failed, so no sorried statement follows from the pinned libraries in one step.

**Headline theorems.** López–Escobar (`lopez_escobar`, `lopezEscobar_iff`, the action form, the σ-algebra form), invariant analytic classes as PC classes, the boundedness theorem, the tree representation, Borel isomorphism under bounded height and its converse through uniform separation, invariant separation by a set and by a sentence, and the well-order class being neither analytic nor Borel nor a model class: all are stated on Tau Ceti's carriers. None is forced through a stand-in. `exists_pcSentence` is an honest existence statement: `⊥` fails its completeness half whenever `T` has a branch and `⊤` fails its soundness half.

**Library declarations opened at the pins (29: 27 Tau Ceti, 2 Mathlib).**
- `Topology/Algebra/Group/Perm.lean`: 58, 110, 129, 143, 149
- `ModelTheory/RelationalConfiguration/Basic.lean`: 182
- `ModelTheory/RelationalConfiguration/Isomorphism.lean`: 86, 141, 187, 244, 268, 323 (187 and 323 assume `[L.IsRelational]`, so the every-language targets here are not duplicates)
- `ModelTheory/RelationalConfiguration/ModelsOf.lean`: 133, 165, 172, 186
- `ModelTheory/RelationalConfiguration/BackAndForth.lean`: 70, 105, 127, 144
- `ModelTheory/RelationalConfiguration/LanguageMap.lean`: 79, 167
- `ModelTheory/Scott/Height.lean`: 78, 117, 133, 186, 209
- `ModelTheory/Scott/Stabilization.lean`: 77, 141; `Scott/Isomorphism.lean`: 62; `Scott/Rank.lean`: 137
- `ModelTheory/BackAndForth/AtomicType.lean`: 82, 94 (`SameAtomicType` includes the equality pattern, which `body_bfTree_nonempty_iff` needs)
- `ModelTheory/Interpolation/PCClass.lean`: 76
- `SetTheory/Descriptive/InvariantSeparation.lean`: 117; `MeasureTheory/Constructions/Polish/GDelta.lean`: 21; `Polish/Analytic.lean`: 96
- `ModelTheory/WellOrdering.lean`: 689, 722 (model-theoretic, over all `Type w`; not the coded statements of §6.2)
- Mathlib `MeasureTheory/MeasurableSpace/Constructions.lean` (product σ-algebra) and `SetTheory/Descriptive/Tree.lean`

Neither library has tree bodies, tree heights, the Kleene–Brouwer order, the boundedness theorem, a query code, López–Escobar or uniform separation (searched by object under `ModelTheory/`, `SetTheory/Descriptive/` and `ModelTheory/Counting/`).

**Cross-roadmap citations resolved (7 of 7).**
- InfinitaryModelExistence Layer 7 `pcSeparation` (main README 685, `Suggested.lean` 723–733; the same statement as the contract at `README.md:163–172`) and its Layer 6 graph translation (main README 597).
- BorelEquivalenceRelations Layers 0.2, 0.3, 2.2 (main README 211–214, 220–223, 401–409).
- InfinitaryLogic Layers 0–3 (`Completed/InfinitaryLogic/README.md`).
- CountableModelCounting: the relative López–Escobar (main README 517), and at its open revision the three targets it consumes from here, all declared at this head.

**Ownership against open work.** Compared by object with the five closest open roadmaps: CountableModelCounting (consumes; owns counting and the relative form), InfinitaryModelExistence (owns `pcSeparation` and `PCMem`), BorelEquivalenceRelations (owns the four Polish-space lemmas), HanfNumbers (lists this roadmap as out of scope) and RandomGraphs (the Rado class is only worked example 4 here). No second owner of trees, heights, boundedness, the query code or López–Escobar. `overlaps.md` lists no dropped id and no conflicting head.

**Seeded sample (12 subsections).**

| Subsection | Source read | Result |
| --- | --- | --- |
| 1.1 permutation group | none readable (Kechris §9 paywalled) | checked against `Perm.lean` 110–149 and computed below |
| 1.2 logic action | Marker notes p. 30, lines 995–998 | the convention agrees (σ⁻¹ on tuples) |
| 4.1 Borel back-and-forth, isomorphism | Marker notes Cor. 3.4, p. 30; Vaught Cor. 2.6, p. 280 | supports Borel orbits |
| 4.2 external Scott height | none; this roadmap's notion | computed on pure sets |
| 4.3 Borel isomorphism and strata | none | route checked: iso ∩ Mod² = BF_β ∩ Mod² |
| 4.4 forced trees, uniform separation | none readable (Kechris §31 paywalled) | Kunen's argument rechecked on an arbitrary space |
| 5.1 easy direction | Marker notes Lemma 3.1, Cor. 3.3, pp. 29–30 | supported |
| 5.2 PC sentence of a tree | Marker notes Lemma 4.24, pp. 50–51 | the source uses function symbols; the relational version checked below |
| 5.3 hard direction | Marker notes Cor. 4.23, Thm 4.26, footnote 8; Vaught Cor. 3.3, p. 285 | supported, and without countability of the language (R01) |
| 5.4 packaging | Marker notes Cor. 3.3 with Thm 4.26, Exercise 3.5 | supported |
| 6.1 invariant separation | Vaught (10), p. 281; Marker notes Cor. 4.25, p. 51 (both sets invariant) | the README's form follows by saturating `A` |
| 6.2 well-order class | Marker notes Cor. 4.28, p. 52 (model-theoretic) | the descriptive route checked below |

**Adversarial pass.** Values computed on both sides. P{S} is the code of a unary predicate P = S on ℕ; r, r′ are the numbers of elements outside the tuples in two pure sets (`BFEquiv k` holds iff min(r,k) = min(r′,k)).

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Convention 3, §1.2 check | σ = (0 1 2), τ = (0 1), c = P{0} | σ•c = P{σ0} = P{1}; inverse convention P{2}; (στ)•c = P{2}; τ•(σ•c) = P{0} | pass | R02 (restated lemma) |
| Basis at 1 (§1.1) | α = ∅; α = Fin 3; α = ℕ, s = {0} | one point, basis {univ}; 6 points, discrete; stabilizer of 0 open | pass | R02 |
| `mem_stabilizer_iff` | c = P{0}; σ = (1 2); σ = (0 1), v = ![1] | (1 2): [σv₀=0] = [v₀=0], T ↔ T; (0 1): P(0)=T vs P(1)=F, F ↔ F | pass | — |
| `measurableSet_iInf_invariants_iff` | B = {P{0}}; B = univ | measurable, moved by (0 1): F = T ∧ F; T = T ∧ T | pass | R02 |
| `analyticSet_iUnion_smul` (all L) | L with a constant and unary P, A = {P{0}} | saturation = "exactly one P", Borel; function symbols do not enter the code | pass | — |
| `isGδ_modelsOf_toInf_alls` | ψ = ∃y R(x,y); n = 0, ψ = ⊥; uncountably many symbols | ⋂ₓ⋃ᵧ of clopen sets; ∅; ψ mentions one symbol, so no countability (as in the Lean) | pass | — |
| `queryCode`, closed embedding | empty language; unary P | constant `false` on a one-point space; eval a = queryCode c (encode a) gives injectivity; compact into Hausdorff | pass | R06 |
| `treeHeight`, `wellFounded_strictExt_iff` | ⊥; {[]}; decreasing sequences; full tree | 0; 1; rank[x] = x, root ω, height ω+1; chain [] ⊂ [0] ⊂ [0,0]… and branch 0̄, F ↔ F | pass | R06 |
| `KBLT`, `wellFounded_kbLT_iff` | [0,1] vs [0]; [0,5] vs [1]; full tree | T; T and the reverse F; [0] > [0,0] > … descends, F ↔ F | pass | R06 |
| `analytic_treeHeight_bounded` | A = ∅; non-Hausdorff X | β = 0, vacuous; the limit step uses only that a closed set contains limits of convergent sequences | pass | — |
| Tree representation | A = ∅; A = {0̄} | T = ⊥; T = nodes with all first entries `false` | pass | — |
| Orbits Borel (§4.1) | c = P{0} | orbit = "exactly one P" = Mod(Scott sentence) | pass | R02 |
| Constant-chain bound | M = ℕ pure (s = 0), N = ℝ pure; N = Fin 3 | BF_ω T (both infinite), all levels T; BF_4 F (min(∞,4) ≠ 3), vacuous | pass | R02 |
| `scottHeight` of pure sets | Fin 0; Fin 1; ℕ | level 0 unstable (N = Fin 1: BF₀ T, BF₁ F), level 1 stable: 1; level 1 unstable (r=1, r′=2), level 2 stable: 2; every finite k unstable (N = Fin(d+k)), ω stable: ω | pass | R02 |
| s ≤ SH ≤ s + ω, SR ≤ SH + 1 | Fin 1; ℕ | 0 ≤ 2 ≤ ω, 1 ≤ 3; 0 ≤ ω = 0 + ω, 1 ≤ ω + 1 (SH = SR + ω attained) | pass | — |
| `selfStabilizationOrdinal_le_scottHeight` | ℕ pure; unary P | 0 ≤ ω; s = 0 ≤ SH; `[Countable M]` is what lets M be copied into `Type` | pass | — |
| `measurableSet_iso_inter_of_scottHeight_le` | unary P, φ = ⊤, β = ω; φ = ⊥ | iso ∩ Mod² = BF_ω ∩ Mod², Borel; ∅ | pass | — |
| `measurableSet_setOf_selfStabilizationOrdinal_le` | unary P, β = 0 | every code has s = 0: univ | pass | — |
| `bfTree`, `lt_treeHeight_bfTree` | P{0} vs P∅; nullary disagreement | tree {[]}, height 1; BF₀ T gives 0 < 1, BF₁ F (1 < 1 not claimed): tight; tree ⊥ and BF₀ F | pass | R06 |
| `body_bfTree_nonempty_iff` | P{0} vs P{1}; P{0} vs P∅ | branch x(2i) = σi, x(2i+1) = σ⁻¹i for σ = (0 1), T ↔ T; F ↔ F | pass | — |
| `exists_uniform_bfSeparation` | A = ∅; A = {(P{0}, P∅)} | β = 0; β = 1 | pass | — |
| `measurableSet_iso_inter_iff_exists_bfLevel` | unary P, φ = ⊤; φ = ⊥ | T ↔ T (β = ω); T ↔ T (β = 0) | pass | — |
| PC sentence, `exists_pcSentence` | T = ⊥; standard witness; ℕ ⊔ ℤ-chain; 2-cycle successor; ψ = ⊥, ψ = ⊤ | n = 0 disjunction empty, no model, body ∅; numerals νₖ = {k}; ∀x ⋁νₖ fails; "range misses zero" fails; ⊥ fails completeness, ⊤ fails soundness | pass | R04, R06 |
| Disjointness (§5.3 step 2) | M in both PC classes | e₀.encodeVia ∈ B, e₁.encodeVia ∈ Bᶜ, both ≅ M: contradiction; every model is countable | pass | — |
| `lopezEscobar_iff` and its three forms | empty language; {P{0}}; "exactly one P"; uncountably many unary P_r | ∅ = Mod ⊥, univ = Mod ⊤; F ↔ F; T ↔ T; {P₀ ≠ ∅} = Mod(∃x P₀x) with no countability, all-empty singleton F ↔ F | pass | R01 |
| `analyticSet_iff_exists_pc` | "exactly one P"; uncountably many P_r, all-empty singleton | T ↔ T; analytic and invariant but not PC, so countability is needed here | pass | R01 |
| `pcSeparation` contract | ℕ with c.toStructure | hypothesis only for countable nonempty M : Type; equals main's statement | pass | R03 |
| Invariant separation, by set and by sentence | A = {P{0}} (not invariant), B = {P = ∅}; A = ∅, B = univ | C = "exactly one P", θ = "exactly one P"; C = ∅, θ = ⊥ | pass | — |
| `exists_mem_wellOrderClass_type_eq` | β = ω; ω + 1; 5 | (ℕ, <); ℕ ≃ (ω+1).ToType; excluded by ω ≤ β | pass | — |
| `analytic_type_bounded`, not analytic, not Borel, not a model class | (ℕ, <); (ℤ, <); WO analytic | descending tree of height ω + 1 ≥ ω; branch 0 > −1 > …; a bound β is beaten by a code of type max(β, ω) | pass | R02 (`descTree`) |

## Not verifiable

- **Kechris (1995), Gao (2009), Keisler (1971), Marker (2016, published).** Paywalled books with no legal open copy; not read. Marker's 2013 author notes were read instead, and their numbering may differ from the book's.
- **López-Escobar (1965), theorem numbers outside §5.** The scan is two-page spreads, and its OCR interleaves the columns; I read pp. 268–269 from a rendered image and nothing else.
- **Vaught (1974).** Read from rendered images of pp. 280–281 and 284–285 only; the definition of "Borel" for uncountable index sets in his §3 was not read, so R01 rests on the argument given there and cites the remark on p. 285 as agreement, not as proof.
- **Mathlib #41946.** Its status was not checked.

## Source issues

- **Misprint** in marker2016 (2013 notes) at Corollary 4.23 proof, p. 50 (`marker2016` line 1669): the source assumes the two expanded vocabularies meet in τ but names them τ1 and τ2; it should name τ0 and τ1, the vocabularies introduced in the preceding line; affects the proof.
- **Misprint** in marker2016 (2013 notes) at Lemma 4.24 proof, p. 51 (`marker2016` line 1719): the source builds the reconstructed structure from a relation R* that is never defined; it should use the relation R̂ defined in the preceding line; affects the proof.
