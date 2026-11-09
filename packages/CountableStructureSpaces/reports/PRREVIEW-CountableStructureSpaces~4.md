# Review of CountableStructureSpaces (pull request #1316 at 7cb889e)

**Verdict:** needs changes

This is a full review: the folder changed by 1023 lines since `113f171`. The gate fails on four checks (`set_option`, `residue`, `statement-hygiene`, `readme-ids-missing`). I found no false, vacuous or under-hypothesised statement: every headline and every sampled target held on the instances in the table below. All twelve findings are P3. The most consequential one is R01: the README calls seven targets "still to build" although the pinned Tau Ceti proves each in one step, and `Suggested.lean` states them again with `sorry`.

Paths: `README.md` and `Suggested.lean` are in `TauCetiRoadmap/CountableStructureSpaces/`. Tau Ceti paths are under `TauCeti/` and Mathlib paths under `Mathlib/`, all at the pins (Mathlib `1b1ccf4b0`, Tau Ceti `2fd255d99`; the branch and main pin the same revisions).

## R01 (P3) — "Still to build" lists seven targets the pinned Tau Ceti already proves

**Location:** `README.md:220–222` ("Still to build: … the coordinatewise continuity criterion, … and the range of the graph coding"), 332–333 (`isomorphismInvariant_modelsOf`), 417–418 (`setOf_iso_eq_modelsOf_scottSentence`), 445–446 ("the constant-chain bound for arbitrary `N`"), with the proof sketch at 457–465. `Suggested.lean:129, 154, 178, 186, 241, 368, 397` state these targets with `sorry`.

**Claim:** These are open targets that the library lacks.

**Witness:** At the pin, `RelationalConfiguration.continuous_iff` is at `ModelTheory/RelationalConfiguration/Topology.lean:52` and `SimpleGraph.range_toRelationalConfiguration` at `Combinatorics/SimpleGraph/RelationalConfiguration.lean:267`. A scratch file importing the built module closes all seven sorried statements, each by one library term, one `simp`, or two lemmas.

**Repair:** Delete the seven declarations from `Suggested.lean`. In the README, move each one to the Tau Ceti supplier contract under the declaration that proves it:

- Finset-indexed basis: `Equiv.Perm.hasBasis_nhds_one_fixingSubgroup` (`Topology/Algebra/Group/Perm.lean:149`), reindexed by `HasBasis.to_hasBasis`.
- Continuity of the action: `RelationalConfiguration.continuous_uncurry_restrict` (`Topology.lean:70`) composed with `Equiv.Perm.continuous_inv_apply` (`Perm.lean:58`).
- `actionInvariant_iff_isomorphismInvariant`: Tau Ceti's `isomorphismInvariant_iff_isInvariantBlock` (`Isomorphism.lean:244`) together with Mathlib's `MulAction.isInvariantBlock_iff_isFixedBlock` (see R03).
- `measurableSet_iInf_invariants_iff`: a single `simp` with `MeasurableSpace.measurableSet_iInf` and `MeasurableSpace.measurableSet_invariants`.
- `isomorphismInvariant_modelsOf`: `fun _ _ ⟨e⟩ h => (e.mem_modelsOf_iff φ).1 h`, from `Language.Equiv.mem_modelsOf_iff` (`ModelsOf.lean:186`).
- `setOf_iso_eq_modelsOf_scottSentence`: `ext d` followed by `realize_scottSentence_iff` (`ModelTheory/Scott/Isomorphism.lean:62`).
- The constant-chain bound: `SelfStabilizesCompletely.bfEquiv_add_one_of_isSuccLimit` (`Scott/Stabilization.lean:141`) at the limit `β + ω`, then `bfEquiv_of_le_of_forall_add_one` (`Stabilization.lean:77`). Replace the proof sketch at 457–465 with this citation.

Keep as targets only what the pin lacks: the finite-cylinder basis, the query code, equality in the cardinality bound, closedness of the graph-code range, locality, clopenability, the Gδ model classes, graph events, `stabilizesCompletely_iff_univ`, the two internal comparisons and `orbitRank_le_scottHeight`.

Tested on the refuting instances: the scratch file closes all seven statements at the pin.

## R02 (P3) — Padding: library restatements, lemmas proved in place, computed examples and an unused definition

**Location:**
- `Suggested.lean:64–69`: two `inferInstance` examples.
- 72–115, 135–151, 159–163, 230–238, 246–248, 343–364, 376–389, 407–415, 424–427, 436–449: 25 theorems, each proved by one library term (two of them by a one-line rewrite).
- 204–217 and 647–673: proved in place.
- 746–754: computed worked-example values.
- 715: `descTree`.
- 224 and 338: `modelsOfBounded` and `bfEquivSet`, used only by restatements.

`README.md:183–184` says that `Suggested.lean` "states the implemented milestones in the roadmap's form and proves them by the library's theorems".

**Claim:** These declarations belong in the acceptance test.

**Witness:** Each restatement copies a pinned declaration into this namespace. For example, `scottHeight_lt_omega_one … := TauCeti.scottHeight_lt_omega_one M` (413–415) and `isTopologicalGroup_perm … := inferInstance` (135–136). `descTree` occurs only at line 715.

**Repair:** Delete these declarations from `Suggested.lean`. The repository README's Prototyping section asks contributors to prototype against an implementation "instead of restating it". Wherever the README backticks a deleted name that is not a Tau Ceti name, write the Tau Ceti name or prose instead:

| Name in the README | Tau Ceti name |
| --- | --- |
| `eval_smul_atom` | `eval_perm_smul` |
| `orbitRel_iff_nonempty_equiv` | `isoSetoid_eq_orbitRel` with `isoSetoid_apply` |
| `measurableSet_bfEquivSet` | `measurableSet_setOf_bfEquiv` |
| `measurableSet_modelsOfBounded` | `measurableSet_setOf_realize` |
| `measurableSet_bfEquivSetoid` | `measurableSet_setOf_bfEquivSetoid` |
| `scottHeight_congr` | `Language.Equiv.scottHeight_eq` |

State the remaining deleted names (`analyticSet_orbitRel_graph`, `saturated_iff_actionInvariant`, `scottHeight_fin_pureSet`, `scottHeight_nat_pureSet`) in prose; the pure-set heights stay as worked examples in the README. This finding is carried from the previous review's R04, and the list has grown since then.

## R03 (P3) — `ActionInvariant` restates Mathlib's `MulAction.IsFixedBlock`

**Location:** `Suggested.lean:172–175`, "`def ActionInvariant (B …) : Prop := ∀ σ : Equiv.Perm α, (σ • ·) ⁻¹' B = B`". Also `README.md:85`, 304–306 and 188–189.

**Claim:** The roadmap needs a new invariance predicate.

**Witness:** Mathlib defines `MulAction.IsFixedBlock G B := ∀ g, g • B = B` (`GroupTheory/GroupAction/Blocks.lean:97`). A scratch probe proves `ActionInvariant B ↔ MulAction.IsFixedBlock (Equiv.Perm α) B` with `forall_congr'` and `rw [Set.preimage_smul, inv_smul_eq_iff, eq_comm]`.

**Repair:** State `lopezEscobar_action_iff`, `measurableSet_iInf_invariants_iff`, `invariant_analytic_separation`, `exists_sentence_separating` and `saturated_iff_actionInvariant` with `MulAction.IsFixedBlock (Equiv.Perm ℕ) B`. Delete `ActionInvariant` and `actionInvariant_iff_isomorphismInvariant`. Correct the sentence about CountableModelCounting's consumption at `README.md:188–190`. Tested: the probe closes the equivalence at the pin.

## R04 (P3) — The `pcSeparation` stand-in copies a supplier theorem and records its revision history

**Location:** `Suggested.lean:535–558`, "Checked against revision 786457c7 of that roadmap (follow-up TauCetiRoadmap #1615). The copy is prototype scaffolding". Also lines 36–38 and `README.md:759–761`.

**Claim:** The acceptance test needs a copy of this supplier theorem.

**Witness:** No statement in `Suggested.lean` uses `pcSeparation`; line 548 only declares it. InfinitaryModelExistence on main states the same theorem (`Suggested.lean:723–733`, README §7.2, 685–690). It differs only in the parent prototype's carriers.

**Repair:** Delete lines 535–558 and the stand-in sentence at 36–38. In `README.md:759–761`, drop the sentence about carrying a copy. The contract at `README.md:135–174` stays. This also clears the gate's `residue` hit at line 761.

## R05 (P3) — `set_option` in the acceptance file

**Location:** `Suggested.lean:44`, `set_option autoImplicit false`; the gate reports `set_option=1`.

**Claim:** The option is needed for elaboration.

**Witness:** A scratch copy without line 44 elaborates under `lake env lean` with exit code 0, the same 44 `declaration uses sorry` warnings, and nothing else.

**Repair:** Delete line 44. Carried from the previous review's R08.

## R06 (P3) — `letI` in six theorem signatures (seven gate hits)

**Location:** `Suggested.lean:261, 371, 456, 465, 598–599, 637`; gate `statement-hygiene=7`.

**Claim:** The decoded structure must be installed with `letI`.

**Witness:** Each explicit form below elaborates at the pin, and each is closed in a scratch file by the current declaration, so the meaning is unchanged.

**Repair:**
- 261: `@SentenceInf.Realize Language.graph ℕ φ ℕ G.structure`
- 371: `modelsOf (@scottSentence L _ ℕ c.toStructure _ _)`
- 456: `@scottHeight L _ ℕ c.toStructure ≤ β`
- 465: `@selfStabilizationOrdinal L _ ℕ c.toStructure ≤ β`
- 598–600: `@SentenceInf.Realize (L.sum pcWitnessLanguage) ℕ ψ ℕ (@Language.sumStructure L pcWitnessLanguage ℕ c.toStructure (standardWitness g))`
- 637: `@LHom.PCMem L (L.sum pcWitnessLanguage) LHom.sumInl ψ ℕ c.toStructure`

## R07 (P3) — Names of this roadmap's own that `Suggested.lean` does not declare

**Location:** `README.md:377`, "with `body_mono`" (gate `readme-ids-missing`). The same holds for:

- `IsBranch` (197, 377)
- `polishSpace_modelsOf_of_isGδ` (355)
- `stabilizesCompletely_iff_univ` (446, 453)
- `orbitRank_le_scottHeight` (448, 476)
- `lopezEscobar_easy` (532)
- `realize_pcSentence_standardWitness` (556, 586)
- `exists_code_of_realize_pcSentence` (559, 576)
- `sumStructure_reducts` (580)
- `isomorphismInvariant_wellOrderClass` (633)

**Claim:** Each backticked name is declared in `Suggested.lean`.

**Witness:** A search finds none of the ten in `Suggested.lean`, the pinned Tau Ceti or the pinned Mathlib. The gate reports only `body_mono`, but the house rule (a backticked name of this roadmap's own claims a declaration) covers all ten.

**Repair:** State each fact in prose without a Lean name, and add no declarations. Partly carried from the previous review's R10.

## R08 (P3) — Pull-request numbers and process narrative

**Location:** `README.md:53, 54, 180, 758, 764, 769` (`[#1317]`, `[#1315]`, `[#1318]` after roadmaps that are on main); 761 "stand-in"; 779 and 784 "checkpoint" (gate `residue=3`); 21 "At this repository's Tau Ceti pin (2fd255d99)"; 132 "(now in Mathlib)"; 772–773 "has landed"; `Suggested.lean:538` "#1615".

**Claim:** The text is timeless and cites roadmaps by name and section.

**Witness:** BorelEquivalenceRelations, InfinitaryModelExistence and CountableModelCounting are folders on main. The house rule forbids pull-request numbers in cross-roadmap citations and history words such as "now" and "has landed".

**Repair:**
- Drop the three roadmap pull-request links.
- Write "at revision `518a366`" instead of "checkpoint".
- Cite `IsGδ.polishSpace` as Mathlib's, without its history.
- Drop the pin-hash sentence.

Keep Mathlib #41946, which the repository README's "Defer to Mathlib" rule asks for. Partly carried from the previous review's R09.

## R09 (P3) — No claim-level locators in the sampled sections

**Location:** `README.md:271–658` (§§1.1–6.2) has no theorem, page or section locator at any claim. The References at 798–813 cite whole works; Kechris is cited by section only.

**Claim:** Every theorem has an exact locator into a legal source.

**Witness:** Marker's 2013 author notes supply usable locators (all pages are of the notes):

| Claim | Locator in the 2013 notes |
| --- | --- |
| Action convention | `marker2016` lines 995–998, p. 30 |
| `modelsOf` Borel and invariant; isomorphism classes Borel | Corollaries 3.3–3.4, p. 30 |
| PC sentence of a tree | Lemma 4.24, pp. 50–51 |
| Hard direction | Corollary 4.23, Theorem 4.26 and footnote 8, pp. 50–51 |
| Invariant separation | Corollary 4.25, p. 51 |

**Repair:**
- Attach these locators to §§1.2, 4.1, 5.1–5.4 and 6.1, cited as the 2013 notes because the 2016 numbering is unverified.
- Record Kechris §9 and §31 and the Vaught and López-Escobar theorem numbers as uncertified.
- Say that §§4.2–4.4 are this roadmap's own definitions and theorems, citing the reference formalization by revision and declaration.

Carried from the previous review's R05.

## R10 (P3) — No `**Checks.**` lists

**Location:** The README has no `**Checks.**` list. The definitions `queryCode` (247), `treeHeight` (382), `KBLT` (385), `bfTree` (499), `pcSentence`/`standardWitness` (537–551), and `codeRel`/`wellOrderClass`/`descTree` (629–642) have at most one acceptance check per layer.

**Claim:** Every definition has three discriminating Checks.

**Witness:** These are values that a wrong definition gets wrong. `treeHeight` of ⊥, of `{[]}` and of the decreasing-sequence tree is 0, 1 and ω + 1; a "supremum of ranks" definition gives 0, 0 and ω. For `KBLT`, `[0,1] <KB [0]` holds and `[1] <KB [0,5]` fails.

**Repair:** Add at least three Checks per definition:
- `treeHeight`: the three values above.
- `KBLT`: the two comparisons above, plus `[0,5] <KB [1]`.
- `queryCode`: constantly false in the empty language; injective via `encode`.
- `bfTree`: P = {0} against P = ∅ gives the tree `{[]}` of height 1; a disagreeing nullary relation gives ⊥; P = {0} against P = {1} has a branch from (0 1).
- `pcSentence`: the standard witness is a model; ℕ ⊔ ℤ-chain fails the numeral axiom; a 2-cycle successor fails it too.
- `descTree`: (ℕ, <) has height ω + 1; (ℤ, <) has a branch.

Carried from the previous review's R06.

## R11 (P3) — README shape and dependencies

**Location:** Headings at `README.md:37, 114, 214–627, 659–796`.

**Claim:** The README follows the house shape.

**Witness:**
- There are no `**Summary.**`, `*Needs:*`, `### Examples` or `### Dependencies`.
- There is no `## Scope and ownership`, `## Exact supplier contracts`, `## How to read the build` or `## Downstream consumers`.
- "At the pin." library inventories sit inside Layers 0, 1.1, 2 and 4.1 (216, 273, 329, 415).

**Repair:**
- Map the existing material onto the house sections: Scope and ownership from 37–56 and 176–212, supplier contracts from 118–174, consumers from 769.
- Move the "At the pin" inventories into the contracts.
- Give each target a `*Needs:*` line. For example, `lopez_escobar` needs `exists_tree_of_analyticSet`, §5.2, `pcSeparation` (InfinitaryModelExistence §7.2) and Tau Ceti's `isoSetoid`.
- End each layer with Examples and Dependencies.

Carried from the previous review's R07.

## R12 (P3) — CountableModelCounting on main cites names this head does not define

**Location:** Main's `TauCetiRoadmap/CountableModelCounting/README.md:87` ("`StructureSpaceOn L α`") and 189–208 (`structureIsoSetoidOn`, `structureIsoSetoidOn_eq_orbitRel`, `structureIsoSetoid_le_bfEquivSetoid`, `mk_structureSpaceOn_le_continuum`).

**Claim:** The interface names that consumers cite exist here.

**Witness:** This head's README and `Suggested.lean` contain none of these names. This README's own provenance row (788) records the move to Tau Ceti's `RelationalConfiguration`.

**Repair:** Add one old → new line per name under Coordination:
- `StructureSpaceOn` → `TauCeti.RelationalConfiguration`
- `structureIsoSetoidOn` → `RelationalConfiguration.isoSetoid`
- `structureIsoSetoidOn_eq_orbitRel` → `isoSetoid_eq_orbitRel`
- `structureIsoSetoid_le_bfEquivSetoid` → `isoSetoid_le_bfEquivSetoid`
- `mk_structureSpaceOn_le_continuum` → `mk_le_continuum`
- after R02, `measurableSet_bfEquivSetoid` → `measurableSet_setOf_bfEquivSetoid`

## Previous findings

These are the findings of the review at `113f171`, checked one by one at this head.

- **R01 (build gate): repaired.** `Suggested.lean:1–17` is a module that imports `Mathlib` and 14 `TauCeti.*` modules. The gate reports no build failure, and `lake env lean` exits 0 with 44 `sorry` warnings only.
- **R02 (`BFEquiv` reflexivity and transitivity from a non-owner): repaired.** README 127 now cites `TauCeti.BFEquiv` with `refl`, `symm` and `trans` (`BackAndForth/Equivalence.lean:117, 126, 144`). `bfEquivSetoid` is Tau Ceti's (`RelationalConfiguration/BackAndForth.lean:105`), and the `_root_` stand-ins are gone.
- **R03 (parent import and copies): partly repaired.** The import of `Completed.InfinitaryLogic.Suggested` is gone, and so are the `BFEquiv` and `PCMem` copies (`PCMem` is now Tau Ceti's `LHom.PCMem`, `Interpolation/PCClass.lean:76`). The `pcSeparation` stand-in remains (this report's R04).
- **R04 (padding): not repaired.** It has grown: 25 library restatements and 7 one-step sorries (this report's R01 and R02).
- **R05 (locators): not repaired** (R09 here).
- **R06 (Checks): not repaired** (R10 here).
- **R07 (README shape): not repaired** (R11 here).
- **R08 (`set_option`): not repaired** (R05 here).
- **R09 (pull-request numbers and process words): partly repaired.** The gate's `prnum` is now 0. The roadmap pull-request links, "checkpoint", "stand-in" and the Lean "#1615" remain (R08 here).
- **R10 (README names not declared): partly repaired.** `StabilizesCompletely.bfEquiv_of_le` now resolves to Tau Ceti (`Scott/Height.lean:94`). `body_mono`, `stabilizesCompletely_iff_univ` and `isomorphismInvariant_wellOrderClass` are still undeclared (R07 here).

## Verified sound

**Head and scope.** The head is `7cb889e01c7ecd057301deca18edfcf6819d5ae9` and the worktree is clean. `git diff --stat origin/main...HEAD` outside the folder is empty. Inside it the change is README (813 lines), `Suggested.lean` (756) and `metadata.toml` (`topic = "math.LO"`).

**Gate**, run at this head: FAIL on `set_option=1`, `residue=3`, `statement-hygiene=7` and `readme-ids-missing=1`. Every other check passes: `imports`, `sorry-data`, `latex`, `prnum`, `depcheck`, `outside-folder`, `stray-files` and the rest. Each failure is a finding above (R04–R08).

**Dependency check**, exactly as prescribed:

```text
depcheck: 239 roadmaps, 2323 edges, 0 problem(s)
```

CountableStructureSpaces is the last line of the candidate order. Its suppliers are all on main: InfinitaryLogic (`Completed/`), InfinitaryModelExistence and BorelEquivalenceRelations. On reverse supply:

- `roadmaps grep CountableStructureSpaces` over main and the open heads finds only scope statements (BorelEquivalenceRelations 689 and 700; InfinitaryModelExistence 786 and 885; HanfNumbers #1319 line 904) and consumers (CountableModelCounting).
- Nothing this roadmap consumes, consumes it in turn, so there is no cycle.

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 2.5 s with 44 warnings, all `declaration uses sorry`.

**Signature pass.** I ran `#check @` on 30 declarations (all headlines and every finding target) in a scratch file importing the built module, and also read all 91 entries of the worker's `signatures.md`. Every type matches its README statement. Binders are not lost: for example, `polishSpace_perm` keeps `[TopologicalSpace α] [DiscreteTopology α] [Countable α]`, and `exists_uniform_bfSeparation` carries only `[L.IsRelational]`, which matches the README (no countability needed).

**Padding probe.** The scratch file `probe/Probe.lean` closed the seven statements of R01 and the equivalence of R03. `probe/LetI.lean` closed the six repaired signatures of R06.

**Library declarations opened at the pins (63: 56 Tau Ceti, 7 Mathlib):**

Tau Ceti:
- `Topology/Algebra/Group/Perm.lean`: 42, 58, 80, 110, 143, 149, 170, 178
- `ModelTheory/RelationalConfiguration/Topology.lean`: 52, 70, 89, 109
- `ModelTheory/RelationalConfiguration/Basic.lean`: 203, 300–314
- `ModelTheory/RelationalConfiguration/Structure.lean`: 48, 58, 111
- `ModelTheory/RelationalConfiguration/Isomorphism.lean`: 86, 141, 187, 227, 244, 323
- `ModelTheory/RelationalConfiguration/ModelsOf.lean`: 66, 133, 165, 172, 186
- `ModelTheory/RelationalConfiguration/BackAndForth.lean`: 70, 105, 127, 144
- `Scott/Height.lean`: 78, 94, 100, 117, 133, 143, 176, 186, 241
- `Scott/Stabilization.lean`: 62, 77, 141
- `Scott/Isomorphism.lean`: 62
- `Scott/Formula.lean`: 47, 96
- `Scott/PureSet.lean`: 68
- `BackAndForth/PureSet.lean`: 120
- `Interpolation/PCClass.lean`: 76
- `Combinatorics/SimpleGraph/RelationalConfiguration.lean`: 267, 277
- `SetTheory/Descriptive/InvariantSeparation.lean`: 117
- `MeasureTheory/Constructions/Polish/GDelta.lean`: 21
- `MeasureTheory/Constructions/Polish/Analytic.lean`: 96
- `ModelTheory/WellOrdering.lean`: 722

Mathlib:
- `Topology/MetricSpace/Polish.lean`: 309
- `GroupTheory/GroupAction/Blocks.lean`: 97, 294
- `MeasureTheory/Constructions/Polish/Basic.lean`: 239, 512, 524
- `SetTheory/Descriptive/Tree.lean`: 32

Neither library has tree bodies, tree heights, the Kleene–Brouwer order or the boundedness theorem, so Layer 3 is this roadmap's to own. Tau Ceti's `wellOrdering_undefinable` quantifies over all `M : Type w`, so it does not give the coded `not_exists_modelsOf_eq_wellOrderClass`.

**Cross-roadmap citations resolved (6 of 6).**
- InfinitaryModelExistence §7.2 `pcSeparation`: main README 685–690 and `Suggested.lean` 723–733. At the open revision #1615, §7.2 is at 679 and `Suggested.lean` 452; the diff from main is carriers only.
- BorelEquivalenceRelations §0.2 (211), §0.3 (220) and §2.2 (409) on main, and at #1616 (214, 228, 409).
- InfinitaryLogic Layers 0–3 (`Completed/InfinitaryLogic/README.md` 291, 403, 501, 566), and its exclusion of the external height (692).
- CountableModelCounting, main 187–215 and #2012 246–296. #2012 already uses the Tau Ceti names (see R12).

**Ownership against open work.** I compared the closest open roadmaps by object:
- CountableModelCounting (#2012) consumes `isomorphismInvariant_modelsOf`, `exists_sentence_separating` and `exists_uniform_bfSeparation`. It owns counting, and its README defers López–Escobar and uniform separation to this roadmap.
- HanfNumbers (#1319) lists this roadmap as out of scope.
- InfinitaryModelExistence (#1615) owns `pcSeparation`, and this README says so.
- BorelEquivalenceRelations (#1616) owns the four Polish-space lemmas.
- RandomGraphs (#1223) proves measurability of the Rado class (its §9.1). Here the Rado class appears only as worked example 4, not as a target, so neither roadmap hands it to the other.

No other open head owns trees, tree heights or the boundedness theorem (`roadmaps grep`).

**Seeded sample (12 subsections).** "Source" means the 2013 author notes, key `marker2016`.

| Subsection | Source checked | Result |
| --- | --- | --- |
| 1.1 permutation group | No locator. Kechris §9 is paywalled; Tau Ceti `Perm.lean` header cites it | Statement checked against `Perm.lean` and computed below; no certified locator (R09) |
| 1.2 logic action | `marker2016` lines 995–998, p. 30: σ(M) ⊨ φ(a) iff M ⊨ φ(σ⁻¹a) | Convention 3 agrees (σ⁻¹ ∘ v) |
| 4.1 Borel back-and-forth and isomorphism | `marker2016` lines 1005–1007, Cor. 3.4, p. 30 (isomorphism class = Mod of the Scott sentence) | Supports `setOf_iso_eq_modelsOf_scottSentence` |
| 4.2 external Scott height | No published source; the roadmap's own notion | Checked by computation (pure sets) and the library |
| 4.3 Borel isomorphism and strata | No source | Proof route checked: iso ∩ Mod² = BF_β ∩ Mod² |
| 4.4 forced trees and uniform separation | Kechris §31 is paywalled | Kunen's argument checked for arbitrary X; closed sets are sequentially closed |
| 5.1 easy direction | `marker2016` lines 956–989, Lemma 3.1, p. 29; lines 1000–1002, Cor. 3.3, p. 30 | Supported |
| 5.2 PC sentence of a tree | `marker2016` lines 1679–1720, Lemma 4.24, pp. 50–51 | The source uses function symbols s, c, f, g and Sₙ; the relational vocabulary here is an adaptation, checked below |
| 5.3 hard direction | `marker2016` lines 1666–1674 (Cor. 4.23), 1724–1731 (Thm 4.26), 1737 (footnote 8), pp. 50–51 | Supported; footnote 8 allows countable models from the start, as here |
| 5.4 packaging | Cor. 3.3 with Thm 4.26; `analyticSet_iff_exists_pc` against Exercise 3.5 (line 1008) and Lemma 4.24 | Supported |
| 6.1 invariant separation | `marker2016` lines 1721–1722, Cor. 4.25, p. 51 (both sets invariant) | The README's form (A arbitrary) is BorelEquivalenceRelations §2.2, `InvariantSeparation.lean:117`; disjoint saturations follow from B invariant |
| 6.2 well-order class | `marker2016` lines 1741–1743, Cor. 4.28, p. 52 (model-theoretic boundedness); Kechris §31 is paywalled | The descriptive route is checked below; no certified locator |

**Adversarial pass.** The values were computed on both sides. Notation: P{S} is the code of a unary predicate P = S on ℕ; r and r′ are the numbers of elements outside the tuples (Tau Ceti's `bfEquiv_empty_natCast_iff`: BF_k holds iff min(r,k) = min(r′,k)).

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Convention 3 / `eval_smul_atom` | σ = (0 1 2), c = P{0} | σ•c = P{σ0} = P{1}; the inverse convention gives P{2}; Marker line 998 agrees with σ⁻¹ | pass | R02 (restatement) |
| Left action | σ = (0 1 2), τ = (0 1) | (στ)•c = P{2} = σ•(τ•c) = σ•P{1}; τ•(σ•c) = P{0} | pass | — |
| `hasBasis_nhds_one_fixingSubgroup` | α = ∅; α = ℕ, s = {0} | ∅: Finset ∅ = {∅}, fixingSubgroup = univ = 𝓝 1 on a point; ℕ: stabilizer of 0 is open (`isOpen_fixingSubgroup`) | pass | R01 |
| `polishSpace_perm`, `isTopologicalGroup_perm` | α = Fin 3; α = ℕ | Fin 3: 6 points, discrete (`instDiscreteTopology`); ℕ: S∞ Polish | pass | R02 |
| `continuousSMul_relationalConfiguration` | empty language; general L | Single point; (σ,c) ↦ restrict ⇑σ⁻¹ c is continuous (probe) | pass | R01 |
| `orbitRel_iff_nonempty_equiv` | P{0}, P{1}; P{0}, P∅ | (0 1) relates the first pair, iso T ↔ T; no σ for the second, cardinalities 1 vs 0, F ↔ F | pass | R02 |
| `mem_stabilizer_iff` | c = P{0}; σ = (1 2) and σ = (0 1) | (1 2): [σv₀ = 0] = [v₀ = 0], T ↔ T; (0 1) at v = ![1]: P(0) = T vs P(1) = F, F ↔ F | pass | — |
| `ActionInvariant` vs invariance | B = {P{0}}; B = {exactly one P} | F/F; T/T; equals `IsFixedBlock` (probe) | pass | R03 |
| `measurableSet_iInf_invariants_iff` | B = {P{0}}; B = univ | Measurable but σ = (0 1) moves it: F = T ∧ F; T = T ∧ T | pass | R01 |
| `analyticSet_iUnion_smul` (all L) | L with a constant symbol and unary P; A = {P{0}} | The saturation is the codes with one P-element, Borel hence analytic; the space ignores function symbols | pass | — |
| `isomorphismInvariant_modelsOf` | φ = ∃x P x; φ = ⊥ | P{0} ∈ Mod, P{5} ≅ P{0} ∈ Mod; ∅ invariant | pass | R01 |
| `isGδ_modelsOf_toInf_alls` | ψ = ∃y R(x,y); ψ = ⊥; uncountably many symbols | ⋂ₓ⋃ᵧ{R(x,y)} is Gδ; ∅; ψ mentions 1 symbol, so no countability needed (matches the Lean) | pass | — |
| API warning: finitely many P not Gδ | P on ℕ ≅ 2^ℕ | Finite sets: countable dense ⇒ meagre; Gδ dense ⇒ comeagre; contradiction | pass | — |
| Cardinality equality (README 252–255) | unary on ℕ; only a nullary symbol; unary on ℝ | 2^ℵ₀ = 𝔠; 2 ≠ 𝔠, excluded by "positive arity"; 2^𝔠 | pass | — |
| `queryCode`, `isClosedEmbedding_queryCode` | empty language; general | decode = none, so constantly false on one point; c.eval a = queryCode c (encode a) gives injectivity; compact → T2 | pass | — |
| `treeHeight` (Conv. 9) | ⊥; {[]}; decreasing sequences | 0; 1; rank[x] = x, rank[] = ω, so ω + 1 (README 403–404) | pass | R10 |
| `wellFounded_strictExt_iff` | full tree on ℕ; ⊥ | chain [] ⊂ [0] ⊂ [0,0] …, body ∋ 0̄: F ↔ F; T ↔ T | pass | — |
| `KBLT`, `wellFounded_kbLT_iff` | [0,1] vs [0]; [0,5] vs [1]; full tree | T; T, and [1] <KB [0,5] F; [0] >KB [0,0] >KB …: F ↔ F | pass | R10 |
| `analytic_treeHeight_bounded` | A = ∅; arbitrary X | β = 0; Kunen's W uses only continuity and sequential closedness, so no T2 needed | pass | — |
| `exists_tree_of_analyticSet_cantor` | A = ∅; A = {0̄} | T = ⊥; T = nodes with all first coordinates false | pass | — |
| `setOf_iso_eq_modelsOf_scottSentence` | c = P{0} | Orbit = {exactly one P} = Mod(Scott sentence), Marker Cor. 3.4 | pass | R01 |
| `bfEquivSetoid` (Tau Ceti) | P{0} vs P∅; 2ℕ vs 3ℕ | Level 0 T, level 1 F (the forth step for 0 fails); every level T (isomorphic) | pass | — |
| Constant-chain bound | M = ℕ pure (s = 0); N = ℝ pure; N = Fin 3 | ℝ: BF_ω T (encard ⊤ = ⊤), so every level T; Fin 3: BF_4 F (min(⊤,4) ≠ 3), vacuous | pass | R01 |
| `scottHeight_fin_pureSet` | m = 0, 2 | Level k ≤ m: r = k vs r′ = k + 1 gives BF_k T, BF_{k+1} F; level m + 1 stabilizes; SH(Fin 0) = 1, SH(Fin 2) = 3 | pass | R02 |
| `scottHeight_nat_pureSet`, Conv. 8 | ℕ against Fin(d + k); infinite N only | Every finite k fails, ω stabilizes: SH = ω; with infinite N only, SH = 0 | pass | R02 |
| Comparisons s ≤ SH ≤ s + ω, SR ≤ SH + 1 | Fin 2; ℕ | 0 ≤ 3 ≤ ω and 1 ≤ 4; 0 ≤ ω = 1 + ω = SR + ω (attained) | pass | — |
| `selfStabilizationOrdinal_le_scottHeight` | ℕ pure; uncountable M | 0 ≤ ω; uncountable M is excluded by `[Countable M]`, which the copy in `Type` needs | pass | — |
| `internalScottRank_le_succ_scottHeight` | Fin 0; ℕ | 1 ≤ 2; 1 ≤ ω + 1 | pass | — |
| Height comparison | ℕ vs Fin 5; ℕ vs ℤ pure | BF_6 F, so no claim; BF_ω T and iso T | pass | R02 |
| `measurableSet_iso_inter_of_scottHeight_le` | unary P, φ = ⊤; φ = ⊥ | s = 0 for all, SH ≤ ω, β = ω: iso ∩ Mod² = BF_ω ∩ Mod²; ∅ | pass | — |
| `measurableSet_setOf_selfStabilizationOrdinal_le` | unary P, β = 0 | Every code has s = 0, so the set is univ | pass | — |
| `bfTree`, `lt_treeHeight_bfTree` | P{0} vs P∅; nullary disagreement | Tree {[]}, height 1, BF_0 T and BF_1 F: 0 < 1 (tight); tree ⊥, BF_0 F | pass | R10 |
| `body_bfTree_nonempty_iff` | P{0} vs P{1}; P{0} vs P∅ | Branch x(2i) = σi, x(2i+1) = σ⁻¹i with σ = (0 1): T ↔ T; F ↔ F | pass | — |
| `exists_uniform_bfSeparation` | A = {(P{0}, P∅)}; uncountable L | β = 1; node sets closed for every relational L | pass | — |
| `measurableSet_iso_inter_iff_exists_bfLevel` | unary P, φ = ⊤; graphs, φ = ⊤ | T ↔ (β = ω) T; iso not Borel and heights unbounded: F ↔ F | pass | — |
| `exists_pcSentence` / `pcSentence` | T = ⊥; standard witness; ℕ ⊔ ℤ-chain; 2-cycle successor | n = 0 disjunction empty, no models; numerals ν_k = {k} make the standard model a model; ∀x ⋁ν_k fails; "range misses zero" fails | pass | R10 |
| `lopez_escobar` | empty language; singleton {P{0}} | One-point space: ∅ = Mod ⊥, univ = Mod ⊤; singleton: Borel, not invariant, not a model class | pass | — |
| Disjointness (5.3 step 2) | M in both PC classes | e₀.encodeVia ∈ B, e₁.encodeVia ∈ Bᶜ, both ≅ M, contradiction; uncountable M has no models | pass | — |
| `pcSeparation` use | ℕ with c.toStructure | The hypothesis is for countable M : Type only; ℕ is nonempty; main §7.2 equals the stand-in | pass | R04 |
| `lopezEscobar_iff`, action form, σ-algebra form | {P{0}}; {exactly one P} | F ↔ F; T ↔ T (θ = "exactly one P") | pass | R03 |
| `analyticSet_iff_exists_pc` | {exactly one P} | Analytic T; ψ = θ with a trivial witness part: T ↔ T | pass | R06 |
| `invariant_analytic_separation`, `exists_sentence_separating` | A = {P{0}} (not invariant), B = {P = ∅} | C = {exactly one P}: invariant Borel, ⊇ A, disjoint from B; θ = "exactly one P" | pass | R03 |
| `exists_mem_wellOrderClass_type_eq` | β = ω, ω + 1, 5 | (ℕ, <); ℕ ≃ (ω+1).ToType; 5 is excluded by ω ≤ β (ℕ is infinite) | pass | — |
| `descTree`, `analytic_type_bounded`, not analytic | (ℕ, <); (ℤ, <); WO analytic | Height ω + 1 ≥ ω; branch 0 > −1 > …; the bound β gives a code of type max(β, ω), a contradiction | pass | R02 |
| `not_exists_modelsOf_eq_wellOrderClass` | Tau Ceti `wellOrdering_undefinable` | Quantifies over all `Type w`, not codes; not a duplicate | pass | — |
| Layer 6 API warning | (ℕ, <, P) | Aut(ℕ, <) is trivial, so P ≠ P′ gives non-isomorphic codes along a continuous Cantor family | pass | — |

## Not verifiable

- **López-Escobar (1965) and Vaught (1974).** The source service fetched IMPAN's open archive copies (`matwbn.icm.edu.pl`, `fm57119.pdf` and `fm82118.pdf`). Both are image-only scans, and OCR is not installed on this worker. Their theorem numbers and pages were not read in this review.
- **Kechris (1995), Gao (2009), Marker (2016, published), Keisler (1971).** These are paywalled books with no legal open copy. The 2013 author notes (`homepages.math.uic.edu/~marker`) were read instead; their numbering may differ from the 2016 book.
- **Mathlib #41946.** Its activity status was not checked; R08 keeps the citation.

## Source issues

- **Misprint** in marker2016 (2013 notes) at Corollary 4.23 proof, p. 50 (`marker2016` line 1669): the source assumes the two expanded languages meet in τ, naming them τ1 and τ2; it should name τ0 and τ1, the languages introduced in the preceding line; affects the proof.
- **Misprint** in marker2016 (2013 notes) at Lemma 4.24 proof, p. 51 (`marker2016` line 1719): the source defines the reconstructed structure using a relation R* that is never defined; it should use the relation R̂ defined in the preceding line; affects the proof.
