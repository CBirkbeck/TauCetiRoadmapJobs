# Review of CountableModelCounting (pull request #2012 at e2b3953)

**Verdict:** needs changes

:robot: AI-assisted review (Claude Opus 5.5). Scope: the whole folder `TauCetiRoadmap/CountableModelCounting/` at `e2b3953`, against Mathlib and Tau Ceti at this repository's pins (Tau Ceti `2fd255d99`, the same on the branch and on main). The pull request changes nothing outside the folder.

## R01 (P2) — `not_hasCantorAntichainOn_of_bfScattered` claims more than its only route supplies

**Location.** `TauCetiRoadmap/CountableModelCounting/Suggested.lean:345`: `theorem not_hasCantorAntichainOn_of_bfScattered {K : Set (RelationalConfiguration L ℕ)} (hK : BFScattered K)`. The section supplies only `[L.IsRelational]`. The same claim appears in `README.md:570–573` ("`K` carries no Cantor antichain … With countably many relation symbols, `K` is thin") and in the Layer 4 acceptance check (`README.md:665–666`).

**Claim.** No back-and-forth scattered set carries a Cantor antichain for isomorphism, for every relational `L`, including languages with uncountably many relation symbols.

**Witness.** The proof route is "the range is analytic, then (S7)". CountableStructureSpaces (Conventions, item 1, at the head of its pull request) allows the passage from Borel to analytic sets only with countably many relation symbols and a countable carrier. Its §4.4 states `exists_uniform_bfSeparation` for analytic sets of pairs. No layer here and no supplier treats uncountable `L`.

**Repair.**
- Add `[Countable (Σ l, L.Relations l)]` to the theorem.
- In 4a, write "With countably many relation symbols, `K` carries no Cantor antichain … and so is thin".
- In the Layer 4 acceptance check, add "in a countable relational language".

Tested: a copy with the instance added elaborates with only `sorry` warnings. `bfScattered_modelsOf_iff_isThinOnNatModels` and every Layer 5 consumer already carry the instance.

## R02 (P2) — Two Layer 5 statements the README requires are statable at the pins but absent or truncated

**Location.**
- The rank form ("`VaughtConjecture` iff for every isolating rank … every thin sentence has the rank bounded below `ω₁`", `README.md:711–712`) is not stated anywhere in `Suggested.lean`.
- `minimallyUncountableOn_modelsOf_iff` (`README.md:749–752`) also promises "for every isolating rank `ρ`, iff they are back-and-forth scattered and `φ` is minimally unbounded for `ρ`". `Suggested.lean:617–624` states only the first equivalence.
- The completion criteria (`README.md:932–933`) require both reformulations to be exported.

**Witness.** Every carrier exists at the pins: `TauCeti.IsIsolatingRank` (`TauCeti/ModelTheory/Counting/Stratification.lean:79`), `IsThinOnNatModels` (`Suggested.lean:317`) and `TauCeti.BFScattered` (`Counting/Scattered/Basic.lean:79`). Minimal unboundedness needs one short `Prop` definition with a real body.

**Repair.** Add the following and name the second theorem in the README by splitting the bullet at 749–752. Tested: both elaborate at the pins, `sorry` only. The strict `<` matches Tau Ceti's `IsIsolatingRank.countable_isoClasses_iff_bounded`.

```lean
theorem vaughtConjecture_iff_forall_isIsolatingRank_bounded :
    VaughtConjecture ↔
      ∀ (L : FirstOrder.Language.{0, 0}) [L.IsRelational] [Countable (Σ l, L.Relations l)]
        (ρ : RelationalConfiguration L ℕ → Ordinal.{0}), IsIsolatingRank ρ →
          ∀ φ : L.Sentenceω, IsThinOnNatModels φ → ∃ β < Ordinal.omega 1,
            ∀ c ∈ (modelsOf φ : Set (RelationalConfiguration L ℕ)), ρ c < β

def MinimallyUnboundedOn [L.IsRelational] (ρ : RelationalConfiguration L ℕ → Ordinal.{0})
    (K : Set (RelationalConfiguration L ℕ)) : Prop :=
  (¬ ∃ β < Ordinal.omega 1, ∀ c ∈ K, ρ c < β) ∧
    ∀ θ : L.Sentenceω, (∃ β < Ordinal.omega 1, ∀ c ∈ K ∩ modelsOf θ, ρ c < β) ∨
      ∃ β < Ordinal.omega 1, ∀ c ∈ K \ modelsOf θ, ρ c < β

theorem minimallyUncountableOn_modelsOf_iff_minimallyUnboundedOn [L.IsRelational]
    [Countable (Σ l, L.Relations l)] {ρ : RelationalConfiguration L ℕ → Ordinal.{0}}
    (hρ : IsIsolatingRank ρ) (φ : L.Sentenceω) :
    MinimallyUncountableOn (modelsOf φ) ↔
      BFScattered (modelsOf φ) ∧ MinimallyUnboundedOn ρ (modelsOf φ)
```

Both statements are true; the computations are in the table, rows 21 and 25.

## R03 (P2) — The Layer 6 route needs isomorphism invariance of `internalScottRank`, which nothing owns

**Location.** `README.md:878–879`: "transport `M` and one `N_z` to codes on `ℕ`; … while the internal rank of `M` is `ω`". Also `Suggested.lean:734–737`.

**Claim.** The code of `M` has internal Scott rank `ω`.

**Witness.**
- `exists_internalScottRank_omega_with_large_bfClass` gives `M : Type` with `internalScottRank M = ω`.
- The rank is then evaluated on `c.toStructure` for a code `c` with `c.toStructure ≅ M`, so invariance is needed.
- Tau Ceti at the pin has `Language.Equiv.scottHeight_eq` (`TauCeti/ModelTheory/Scott/Height.lean:241`) but no invariance lemma for `internalScottRank` or `orbitRank`. A search of the pinned environment for `internalScottRank_eq`, `Equiv.internalScottRank_eq` and `orbitRank_congr` finds nothing.
- The parent InfinitaryLogic roadmap does not list such a lemma, and `roadmaps grep` finds none on main or at any open head.

**Repair.** Add a Layer 6 (or Layer 1) target: "for `M ≃[L] N`, `internalScottRank M = internalScottRank N` (orbit ranks are carried along the isomorphism by `FirstOrder.Language.Equiv.bfEquiv`)". Cite it in the consequence bullet.

## R04 (P3) — Gate `set_option`: `set_option autoImplicit false`

**Location.** `Suggested.lean:37`.

**Repair.** Delete the line. Tested: the file elaborates without it, and the declarations' elaborated types are unchanged.

## R05 (P3) — Gate `statement-hygiene`: `letI` in five signatures

**Location.** `Suggested.lean:216, 294, 441, 484, 736`.

**Witness.** Tau Ceti states the same objects without `letI`, by explicit instance application, e.g. `@scottHeight L _ ℕ c.toStructure` at `Counting/Stratification.lean:239`.

**Repair.**
- Line 294: `@internalScottRank L _ ℕ c.toStructure ≤ β`.
- Line 736: `fun c => @internalScottRank (lang ℕ Language.empty) _ ℕ c.toStructure`.
- Line 484: `@BoundedFormulaInf.Realize L ℕ Empty ℕ (morleyBase Φ e).toStructure l φ.1 Empty.elim v`.
- Lines 216 and 441 go away with R08.

Tested: all three elaborate, and the gate's statement-hygiene scanner reports no hit on the repaired copy.

## R06 (P3) — Gate `residue`: "checkpoint"

**Location.** `README.md:967`, `973`, `1034`.

**Repair.** Write "at commit `518a366`". Tested with the gate's process-residue scanner: no hit.

## R07 (P3) — Gate `readme-ids-missing`: Tau Ceti names written without their namespace

**Location.** `README.md:213–228`, in "Targets of this roadmap in Tau Ceti": `IsIsolatingRank.of_le`, `IsIsolatingRank.exists_unbounded_of_not_countable`, `IsIsolatingRank.exists_rank_bound_iff`, `IsIsolatingRank.exists_comap_isoSetoid_eq_bfEquivSetoid`, `bfScattered_of_observation`.

**Witness.**
- All five exist at the pin as `TauCeti.…` (`Counting/Stratification.lean:118, 126, 224`; `Counting/Scattered/Basic.lean:115, 164`).
- `exists_comap_isoSetoid_eq_bfEquivSetoid` is in `Counting/Stratification.lean`, not `Counting/Scattered/Basic.lean` as the bullet at lines 224–228 says.

**Repair.** Write the Tau Ceti names `TauCeti.`-qualified throughout that list (R08 makes this necessary for the other entries too), and move the file locator. Tested: with the five qualified, the gate's `readme_identifiers_missing` returns nothing against the current file.

## R08 (P3) — Padding in `Suggested.lean`

**Location and witness.**
- **(a) Proved restatements of pinned theorems** (each body is a single Tau Ceti term):
  - `encodeVia_mem_modelsOf`, `classOf_eq_classOf_iff`, `classOf_surjective`, `countableModelCount_le_continuum`, `measurableSet_isoSetoid_fin`
  - `HasPerfectlyManyCountableModels.countableModelCount_eq`, `realize_infiniteSentence_iff`, `lift_countableModelCount_onBoundedFormulaInf`, `hasPerfectlyManyCountableModels_onBoundedFormulaInf_iff`
  - `modelsOf_scottSentenceAtLevel`, `isIsolatingRank_scottHeight`, `exists_isIsolatingRank`, `IsIsolatingRank.isolates_of_le`, `mk_isoClasses_le_aleph_one_of_countable_levels`
  - `Setoid.countable_quotient_of_isolatedBy`, which is also declared in `_root_.Setoid`, outside the roadmap namespace
  - `IsIsolatingRank.countable_isoClasses_iff_bounded`, `IsIsolatingRank.mk_isoClasses_eq_aleph_one`, `exists_limit_of_bfEquiv_chain`

  Two of the wrappers also add a countability hypothesis that Tau Ceti does not need, against README line 216.
- **(b) Sorried statements that close in one step from the library** (one-tactic probe):
  - `countable_quotient_isoSetoidOn_iff` (line 650) closes with `exact Setoid.countable_quotient_comap_val_iff` (`TauCeti/Data/Setoid/Countable.lean:34`).
  - `VaughtConjecture.cardinal` (line 526) closes with `fun L _ _ φ => (h L φ).imp_right HasPerfectlyManyCountableModels.countableModelCount_eq`.
- **(c) The Layer 0 acceptance check mirrored:** the `UnaryPredicates` block (lines 153–188).
- **(d) Unfolding lemmas of `morleyCode`:** `morleyCode_inl`, `morleyCode_inr_eq_true_iff`, `morleyBase_morleyCode`, `morleyCode_injective`, `toStructure_morleyCode`, and `isoSetoid_morleyCode_iff`, which is `nonempty_morleyEquiv_iff` read on codes.
- **(e) An unused definition:** `RowAssembly.Carrier` (lines 711–713) occurs in no statement.

**Repair.** Delete all of the above, together with:
- the private helpers `countable_relations` and `quotientComapEquivImage`;
- the Layer 1 section, which becomes empty;
- the imports that become unused: `TauCeti.Data.Setoid.Isolation`, `TauCeti.ModelTheory.Counting.LanguageEquiv` and `TauCeti.ModelTheory.RelationalConfiguration.LevelSentence`.

The README keeps every statement; its "Targets of this roadmap in Tau Ceti" list already names the implementations. In the README:
- qualify the Tau Ceti names (R07);
- state `hasPerfectSetOfNonisoModelsOn_fin_one_unaryPredicates` (line 901) and `morleyBase_morleyCode` (line 644) in prose;
- replace "The targets, all stated in `Suggested.lean`" (line 637).

Tested on a trimmed copy with R01, R02, R04 and R05 applied (50 declarations, 32 of them sorried):
- it elaborates with only `sorry` warnings;
- the gate's set_option, residue, statement-hygiene and empty-section scanners find nothing;
- `readme_identifiers_missing` against it returns exactly those two names plus `bfScattered_of_observation`, and nothing once the README edits above are made.

## R09 (P3) — Two README targets duplicate other targets' statements

**Location.** `README.md:509` (`..._of_bounded'`) and `README.md:540–543` (`morley_countableModelCount'`).

**Witness.** Each has the same statement as the unprimed target and differs only in its proof (through (E2)). A proof route is not a target, and the house rules forbid two theorems with one statement.

**Repair.** Delete the primed targets. Keep the (E2) argument as one sentence in the proof sketch: "an alternative proof applies (E2) to the same relations".

## R10 (P3) — The module docstring does not name the headline that is not statable at the pins

**Location.** `Suggested.lean:18–33`; `ConcentratedAtBFLevels.bfScattered` (line 386).

**Witness.**
- Layer 4f's "thin iff every countable fragment has a countable spectrum at every arity" (`README.md:628–632`) needs InfinitaryModelExistence's `fragmentType` and `Fragment.slice` (its §4.1). Neither exists at the pin (name search: none), and the docstring does not mention this.
- The docstring does not use the "target signatures" form.
- `ConcentratedAtBFLevels.bfScattered` has no docstring.

**Repair.**
- Retitle the docstring "…: target signatures" and say that it states the roadmap's headline theorems against the pinned APIs.
- Add: "Not statable at the pins: the fragment-spectrum characterization of thinness (Layer 4f), which needs InfinitaryModelExistence's `fragmentType` and `Fragment.slice`. Layer 1's headlines and most of Layer 0's are implemented in Tau Ceti and cited in the README."
- Add a docstring to `ConcentratedAtBFLevels.bfScattered`.

## R11 (P3) — The (S4) contract drops a hypothesis

**Location.** `README.md:273`: "`measurableSet_setOf_bfEquivSetoid` (Borel for `β < ω₁` and countable `α`)".

**Witness.** The pinned lemma (`TauCeti/ModelTheory/RelationalConfiguration/BackAndForth.lean:144`) also assumes `[∀ n, Countable (L.Relations n)]`.

**Repair.** Add "and countably many relation symbols of each arity".

## R12 (P3) — Source attributions and locators in the references

**Location.** `README.md:1031–1033`, `1003–1005`, `756–758`, `585–587`.

**Witness.**
- **(a) Montalbán, Lemma XII.8.** Line 1031 says "Checked against that PDF. The source notes that Lemma XII.8 as stated omits the per-level countability hypothesis its proof uses." Montalban-CSTpart2 contains no such note. The lemma (line 9472) assumes only minimal unboundedness, and its proof uses countably many `≡β`-classes (line 9481) without comment. The observation is right (see Source issues); the attribution is not. "Checked against that PDF" is process wording, and the cited draft carries no date (the copy read was compiled on 22 April 2025, line 8).
- **(b) BFKL, Lemma 3.4.** The README says this lemma "identifies" Morley-scattered sentences with those lacking perfectly many models. BFKL-red-herrings line 491–492 proves one direction only: no perfect set gives countably many `F`-types. The identification is their Theorem 3.3, (a)⇔(b) (line 468–476), together with Lemma 3.4. The text is on the third author's page, so "as cited by Andrews et al." can go. Theorem 3.3 is also the locator that Layer 4c (`README.md:585–587`) lacks.
- **(c) Harnik–Makkai.** `exists_minimallyUncountableOn_and_of_bfScattered` has locators only into Montalbán, whose notion is minimal *unboundedness*. The minimally *uncountable* form is HarnikMakkai1977 Theorem 1, p. 309 (lines 16–21: "large" means more than ℵ₀ models).

**Repair.**
- (a) Write "Lemma XII.8 (p. 220) assumes only minimal unboundedness, but its proof (p. 221) uses that Θ has countably many `≡β`-classes; the targets here assume back-and-forth scatteredness". Give the draft's date and drop "Checked against that PDF".
- (b) Cite "their Theorem 3.3 and Lemma 3.4". The numbering of the 28 August 2014 preprint agrees with Andrews et al.'s citation of the published version. Add Theorem 3.3 at 4c.
- (c) Add "(Harnik–Makkai, Theorem 1, p. 309)" at step 5.

## R13 (P3) — House style: pull-request numbers as roadmap citations, and a LaTeX display block

**Location.** `README.md:27, 29, 30, 74, 245, 295, 315` (`[#1316]`, `[#1317]`, `[#1315]`, `[#1319]`); `README.md:14–18`.

**Witness.**
- Roadmaps are cited by name and section, never by pull-request number. #1315 and #1317 are merged, so those links point at closed pull requests.
- Lines 14–18 are a ```` ```math ```` block containing `\#\{\text{…}\}`, `\le`, `\aleph_1` and `\quad`.

**Repair.**
- Cite by roadmap name only. The open supplier CountableStructureSpaces is already named in the pull request description.
- Replace the display with an indented Unicode line: `#{countable models of φ}/≅ ≤ ℵ₁   or   φ has a perfect set of pairwise non-isomorphic countable models`.

## Verified sound

**Gate.** I re-ran the gate on this head and got the worker's result: `set_option=1`, `residue=3`, `statement-hygiene=5`, `readme-ids-missing=5` (R04–R07); every other check, including the build, passed. `lake env lean` on `Suggested.lean` gives 35 warnings, all `declaration uses 'sorry'`, and no errors. The pull request changes no file outside the folder.

**Dependency check.** Output: `depcheck: 239 roadmaps, 2321 edges, 0 problem(s)`. No UPWARD or CYCLE line. This roadmap is on main and not in the merge order. Its only open supplier, CountableStructureSpaces, adds a new folder, and the pull request description names it.

**Signatures.** `#check @` on all 79 public declarations, imported from the module built at this head (the olean is newer than the source), elaborates without error. I compared each against its README statement; the only mismatches are R01 and R02. The three "looks dropped" leads in `signatures.md` are deliberate: `realize_infiniteSentence_iff` uses `omit`, and `IsThinOnNatModels` and `morleyBase` do not need the binder.

**Library names.** All 260 backticked identifiers of the README were resolved in one pass over the pinned environment, with a grep for the three Tau Ceti modules that have no olean (`Silver.lean`, `Data/Set/Countable.lean`, `InvariantSeparation.lean`). Every name the README attributes to Mathlib or Tau Ceti exists there. The unresolved names are this roadmap's own targets, provenance names, or supplier targets that the README marks as having no Tau Ceti declaration (`isomorphismInvariant_modelsOf`, `exists_sentence_separating`, `exists_uniform_bfSeparation`, `fragmentType`, `Fragment.slice`).

**Library declarations opened at the pin.**
- `IsIsolatingRank` and its API: `Counting/Stratification.lean:79–255`.
- `BFScattered` and its API: `Counting/Scattered/Basic.lean:79–167`.
- Counting: `isoSetoidOn`, `CountableModelClasses` and `countableModelCount` (`Counting/Classes.lean:92–133`); `countableModelCount_le_of_subset` (181); `HasPerfectlyManyCountableModels` (340) and its `countableModelCount_eq` (367).
- Descriptive set theory: `Setoid.countable_or_hasCantorAntichainOn_of_measurableSet` and `Setoid.mk_quotient_le_aleph0_or_eq_continuum` (`SetTheory/Descriptive/Silver.lean:153, 163`); `Setoid.hasCantorAntichainOn_image_iff` (`Antichain.lean:304`); `TauCeti.exists_countable_exceptions_of_splits` (`Data/Set/Countable.lean:53`, with `[Countable ι]`); `Setoid.IsolatedBy` (`Data/Setoid/Isolation.lean:65`); `Setoid.countable_quotient_comap_val_iff` (`Data/Setoid/Countable.lean:34`).
- Scott analysis: `scottHeight`, `scottHeight_le_internalScottRank_add_omega0` and `nonempty_equiv_of_bfEquiv_of_scottHeight_le` (`Scott/Height.lean:133, 169, 186`); `internalScottRank` (`Scott/Rank.lean:159`, defined as the supremum of `orbitRank + 1`); `internalScottRank_fromRel_eq_one` (`Scott/EquivalenceRelation.lean:245`).
- Configurations: `measurableSet_setOf_bfEquivSetoid` and `exists_limit_of_bfEquiv_chain` (`RelationalConfiguration/BackAndForth.lean:144, 153`); `measurableSet_setOf_isoSetoid` (`Isomorphism.lean:180`); `modelsOf` and `Language.Equiv.mem_modelsOf_iff` (`ModelsOf.lean:66, 186`).
- Language maps: `isRelational_morleyize` and `countable_relations_morleyize` (`ModelExistence/Morleyization.lean:94, 99`); `smallPresentation` (`Infinitary/SmallPresentation.lean:50–72`, which needs countable function and relation symbols, as (M4) says).
- Mathlib: `Countable (Σ n, L.BoundedFormula α n)` under `[Countable α] [Countable L.Symbols]` (`Mathlib/ModelTheory/Encoding.lean:304, 318`), as the first-order route says.

**Cross-roadmap citations.**
- (S1)–(S7) match CountableStructureSpaces at the head of its pull request (`7cb889e`): Conventions, the ownership table, its list of what this roadmap consumes, §4.2, §4.4 and §6.1. Only R01's hypothesis and R11 disagree.
- (E0)–(E2) match BorelEquivalenceRelations on main (Layer 0.5 and §4.2; README lines 254–284 and 504–536).
- (M0)–(M4) match InfinitaryModelExistence on main (ownership list at lines 132–151; §0.1, §0.3 and §4.1; Layer 5).
- "Out of scope here" points correctly: InfinitaryModelExistence Layer 6 is the graph translation (line 597), and HanfNumbers owns the Ehrenfeucht–Mostowski, small-model and complete-sentence material.
- Overlaps: none (no open pull request changes this roadmap or drops a cited id).
- Ownership by object: `roadmaps grep` for Vaught's conjecture, `countableModelCount`, isolating ranks, `BFScattered`, minimal counterexamples, `morleyCode` and sentence spectra finds no second owner on main or at any open head.

**Sources sample.**
- Montalban-CSTpart2 (author page; draft compiled 22 April 2025): §XII.1 (line 9282) with Definition XII.1 (9312); §XII.2 with Definition XII.4 (9359), Lemma XII.5 (9367), Lemma XII.6 with its `≡_{αi+3}` hypothesis (9376–9379), Theorem XII.7 (9426) and Lemma XII.8 (9472). All support the README's locators except R12(a).
- AGHKM-scattered (author page): lines 20–37 (Vaught's and the absolute form, trivial under CH, equivalent under ¬CH) and lines 110–130 (Fact 2.2, Steel's strong form) support the References entry.
- BFKL-red-herrings (author page, preprint of 28 August 2014): lines 46–56 and 468–496; see R12(b).
- HarnikMakkai1977 (AMS open backfile): Theorem 1, p. 309, supports "minimal counterexamples".

**Adversarial pass.** Values are computed on each side.

| # | Statement | Instance(s) | Values computed | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | Layer 0 acceptance (`P_i`, `∃x∀y y=x`) | codes on `Fin 1`; tiers `ℕ`, `Fin n` | atoms on `Fin 1` ≅ ℕ, so codes = `ℕ → Bool`; `#Perm (Fin 1) = 1`, so iso = equality; count = 0 (ℕ) + 0 (Fin 0) + 𝔠 (Fin 1) + 0 (n ≥ 2) = 𝔠 | holds | delete Lean mirror (R08) |
| 2 | `countable_or_hasPerfectSetOfNonisoModelsOn_fin` | the row-1 sentence, n = 1; φ = ⊥; countably many nullary symbols, n = 0 | Fin 1: quotient has 𝔠 classes, perfect side true; ⊥: empty quotient, countable; Fin 0: codes = `2^ℕ`, iso = equality, perfect side true | holds | none |
| 3 | Layer 1 acceptance | K inside one iso class | 1 class at every level; bound ℵ₁ against actual 1 | holds | none |
| 4 | Layer 2 acceptance (E with infinite classes) | empty model; k ∈ {1,…,ℵ₀} on ℕ | count = 1 + ℵ₀ = ℵ₀; SR = 1, as Tau Ceti's `internalScottRank_fromRel_eq_one` gives; SH ≤ 1 + ω = ω < ω₁ | holds | none |
| 5 | `…_or_hasPerfectlyMany_of_bounded` | the row-1 sentence | models on ℕ = ∅, so the bound holds with β = 0; count = 𝔠 > ℵ₀; PM via Fin 1 | holds (fails without the finite tiers) | none |
| 6 | `…_of_internalScottRank_le` | SR ≤ β < ω₁ | SH ≤ β + ω < ω₁, so `isIsolatingRank_scottHeight` applies | holds | `letI` (R05) |
| 7 | Layer 3 acceptance | z = (1,0,…) vs (0,1,0,…) | class sizes ≥ 2: {2} against {3}, non-isomorphic; bit `E(a,b)` in `B_k` = `z k`, one input bit, so continuous | holds | none |
| 8 | `countable_bfClasses_or_hasPerfectSet` | equivalence relations, β = 0 | no nullary symbols, so 1 level-0 class: left side true; perfect side also true | holds | none |
| 9 | Morley, witnessed and cardinal | equivalence relations; pure sets | count 𝔠 with PM: both forms true; pure sets ℵ₀ ≤ ℵ₁ | holds | none |
| 10 | `not_hasCantorAntichainOn_of_bfScattered` | countable L, K one class; uncountable L | 1 class per level against 𝔠 classes needed by an antichain: holds; uncountable L: S7 needs analytic sets, unavailable | route unowned | R01 |
| 11 | `bfScattered_modelsOf_iff_isThinOnNatModels` | pure sets; equivalence relations | pure: 1 code, both true; E: row-7 family distinct at level ω (class sizes), so 𝔠 level-ω classes, both false | holds | none |
| 12 | `isThin_iff_countable_sentenceSpectra` | C = ∅; E with θ n = "a class of size n+2" | ∅: both true; E: `sentenceTheory θ ∘ f = id` on `2^ℕ`, image 𝔠, both false | holds | none |
| 13 | `ConcentratedAtBFLevels.bfScattered`; Layer 4 acceptance | concentrated C at level β | classes ≤ 1 + ℵ₀; thinness then needs countable L | holds | acceptance text (R01) |
| 14 | Layer 4g `morleyCode`, `range_morleyCode` | Φ = ∅; Φ = {⊤ of arity 1} | ∅: relabelling, injective, range = all codes; {⊤}: range = codes whose new bit is constantly true | holds | API to README (R08) |
| 15 | `HasVaughtDichotomy`, `HasVaughtCount` | ⊥; E; row-1 sentence | count 0 / 𝔠 with PM / 𝔠 with PM via Fin 1: both predicates true in all three | holds | none |
| 16 | `not_hasVaughtDichotomy_iff` | E; hypothetical ℵ₁ with no PM | E: LHS false, RHS false (PM); hypothetical: both true | holds | none |
| 17 | `not_hasVaughtCount_iff` | count 𝔠 under ℵ₁ < 𝔠 and under ℵ₁ = 𝔠 | LHS false; RHS false (ℵ₁ ≠ 𝔠, or ℵ₁ < 𝔠 fails) | holds | none |
| 18 | `cardinalVaughtConjecture_of_aleph_one_eq_continuum` | count ≤ ℵ₁ = 𝔠 | count ≤ ℵ₀, or count ∈ (ℵ₀, ℵ₁] = {ℵ₁} = {𝔠} | holds | none |
| 19 | `cardinalVaughtConjecture_iff_vaughtConjecture` (ℵ₁ < 𝔠) | count = 𝔠 | 𝔠 > ℵ₁, so the witnessed Morley theorem forces PM | holds | none |
| 20 | `hasVaughtDichotomy_and_infiniteSentence_iff` | row-1 sentence; E | row 1: count(φ ⊓ inf) = 0, so LHS true; ℕ-quotient empty, so RHS true; E: both true via ℕ | holds | none |
| 21 | `vaughtConjecture_iff_bfScattered` and rank form | both directions | →: VC on φ ⊓ inf gives countable or perfect on ℕ, and scattered excludes perfect. ←: perfect gives PM; otherwise thin ⇒ scattered ⇒ countable (or bounded, then the Layer 2 dichotomy) | holds | add rank form (R02) |
| 22 | `vaughtConjecture_iff_forall_universe` | L : Language.{u,v}; Language.{0,0} | →: `smallPresentationEquiv` and lift lemmas, ≤ ℵ₀ stable under `lift`; ←: ULift language equivalence | holds | none |
| 23 | `VaughtConjecture.firstOrder` | theory of infinite sets, empty language | models on ℕ: 1 class, countable; Mathlib countability instance confirmed | holds | none |
| 24 | `minimallyUncountableOn_modelsOf_iff` | ⊤ in pure sets; E | ⊤: image countable, both false; E: θ = "a class of size 2" splits row 7's family into two uncountable halves; not concentrated at ω; both false | holds | none |
| 25 | minimally-unbounded half | scattered K | countable ⇔ bounded for K, K ∩ θ and K \ θ (`mono`), so MinUnc ⇔ MinUnb | holds | add (R02) |
| 26 | `exists_bfLevel_saturated_modelsOf` | θ = ∃x∃y x≠y; θ = ⊤ | β₀ = 2; β₀ = 0 | holds | none |
| 27 | `exists_limit_of_bfEquiv_chain` | constant chain, α i = 0 | d = c (proved in Tau Ceti) | holds | delete wrapper (R08) |
| 28 | Harnik–Makkai reduction, steps 4–5 | X, Y first differing at i | `A_X ~ A_{X↾(i+1)}` at α_{i+1}; `A_{X↾(i+1)}` ≁ `A_{Y↾(i+1)}` there; so inequivalent at β = sup α_i < ω₁: 𝔠 classes, contradicting scatteredness | holds | locator (R12c) |
| 29 | Layer 6 path `π_z` | z = (1,0,…), z′ = 0 | π_z = 0,1,1,1,2,2,…, nondecreasing, π(i) ≤ i; π_z′(1) = 0 ≠ 1, so z ↦ π_z is injective | holds | none |
| 30 | `internalScottRank M = ω` | rows [0..k], [0..k,k] | fibres at label [0..k,k]: ℕ against Fin(k+1); ℕ ≡_j Fin(k+1) iff j ≤ k+1; orbitRank([0..k]) ≥ k+1, so SR ≥ sup(k+2) = ω; finite orbit ranks give SR ≤ ω | holds | none |
| 31 | `N_z ≡_m M`, then ω | prefixes of π_z longer than 2m | last entry ≥ m, so Fin(≥ m+1) ≡_m ℕ; `BFEquiv.limit` | holds | none |
| 32 | `ω < scottHeight M ≤ ω + ω` | `Height.lean:169, 186` | SH ≤ SR + ω = ω + ω; SH ≤ ω would make `N_z ≅ M` | holds | none |
| 33 | `not_isIsolatingRank_internalScottRank` | code c of M | needs ρ c = SR(M) = ω: invariance unowned | route gap | R03 |
| 34 | `countable_quotient_isoSetoidOn_iff`, `VaughtConjecture.cardinal` | one-tactic probe | close with `Setoid.countable_quotient_comap_val_iff`; and with `imp_right` of `countableModelCount_eq` | padding | R08 |

## Not verifiable

None of these texts could be read legally here, so their locators were not checked:
- Steel 1978 (Lecture Notes in Mathematics 689, Springer, paywalled; not fetched). Montalban-CSTpart2 line 9364 cites it, as `[Ste78, Theorem 1.5.11]`, for the same reduction.
- Morley 1970 (J. Symbolic Logic) and Vaught 1961: paywalled.
- Marker 2016 (pages 29–38 and 83–96), Becker–Kechris 1996 (pages 82–97), Gao 2009 and Kechris 1995 (§31): paywalled books, not in the seeded sample, not fetched.
- Silver 1980 and López-Escobar 1965: not in the sample, not fetched.

## Source issues

- **Gap** in Montalban-CSTpart2 at Lemma XII.8, printed pp. 220–221: the source says minimal unboundedness suffices, but the proof gets an unbounded ≡β-class from countably many ≡β-classes; it should assume Θ scattered, as Theorem XII.7 provides; affects the proof.
- **Error** in AGHKM-scattered at Fact 2.2, footnote 2, p. 3: the source says BFKL's Lemma 3.4 shows that Morley-scattered sentences lack perfectly many models; it should say the converse (no perfect set gives countably many fragment types); affects nothing.
- **Gap** in BFKL-red-herrings at the introduction, p. 2 (preprint of 28 August 2014): the source infers "no perfect set of models" from "at most ℵ₁ models"; under CH that inference fails, and it needs their Theorem 3.3; affects nothing.
