# Review of CountableModelCounting (pull request #2012 at 1c8987f)

**Verdict:** needs changes

Paths are under `TauCetiRoadmap/CountableModelCounting/`. Tau Ceti paths, at the pin `2fd255d99`, are under `TauCeti/ModelTheory/`, except `SetTheory/…`, which is under `TauCeti/`. R01 and R05–R07 are new. R02–R04 carry the previous review's R01, R03 and R04, which this head repairs only in part or not at all.

## R01 (P2) — Level classes are sentence cuts only with countably many relation symbols

**Location.** `README.md:448–451`: "For `α < ω₁`, `modelsOf (c.scottSentenceAtLevel α) = {d | bfEquivSetoid α c d}` … Every level class is therefore a sentence cut." The same omission is at `:177–179` (`scottFormula`) and at `:761`, which reads "Every cut by a level class has a small side (level classes are sentence cuts, Layer 1)".

**Claim.** Every back-and-forth level class is the model class of a single sentence, and every cut of a minimally uncountable set by a level class has a small side, for every relational `L`.

**Witness.** `scottSentenceAtLevel` and `scottFormula` assume `[Countable (Σ k, L.Relations k)]`. Unary `P_r`, `r ∈ ℝ`: the level-1 class of the all-empty code is that code alone, but a sentence mentions countably many symbols (`Infinitary/Symbols.lean:289`). Row 50 refutes `:761`.

**Repair.**
- `:177`: replace "so that for `α < ω₁`" by "so that, with countably many relation symbols and `α < ω₁`,".
- `:448`: replace "For `α < ω₁`," by "With countably many relation symbols and `α < ω₁`,". End the bullet with: "With uncountably many it fails: for unary `P_r`, `r ∈ ℝ`, the level-1 class of the code with every `P_r` empty is that code alone, and a sentence mentions only countably many symbols."
- `:761`: replace the bullet by "With countably many relation symbols, every cut by a level class has a small side (level classes are sentence cuts, Layer 1)."

Tested: with unary `P_i` for `i ∈ ℕ`, that class is `modelsOf (∀ x, ⋀ᵢ ¬ P_i x)` (row 52).

## R02 (P3) — The Layer 0 acceptance check is still in `Suggested.lean`

**Location.** `Suggested.lean:79–117`, the `UnaryPredicates` block. It holds `hasPerfectSetOfNonisoModelsOn_fin_one_unaryPredicates` (`:104`), `modelsOf_oneElement_nat` (`:109`) and `countableModelCount_oneElement` (`:113`, which has no docstring).

**Claim.** The commit that restores the block says these are "unproved acceptance targets, not boundary checks".

**Witness.** They restate the Layer 0 acceptance check (`README.md:423–432`): a perfect set on `Fin 1`, an empty class on `ℕ` (a boundary case) and the value `𝔠`. Being unproved does not make a worked example a headline.

**Repair.** Delete `Suggested.lean:79–117`. In `README.md:925`, replace "(`hasPerfectSetOfNonisoModelsOn_fin_one_unaryPredicates`)" by "(the Layer 0 acceptance check)". Tested: the trimmed copy elaborates with 33 `sorry` warnings and no other message.

## R03 (P3) — Pull-request numbers in the README

**Location.** `README.md:28` and `:253`, "([#1316](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1316))"; `:77`, "([#1319](…/pull/1319))". Tau Ceti pull-request links at `:160–161` (#18977), `:171` (#18035), `:185–188` (#17547, #18726) and `:968–969` (#18977).

**Claim.** Roadmaps and library work may be cited by pull request.

**Witness.** House style: a cross-roadmap citation names the roadmap only, and the README is timeless. The three roadmap links are unchanged since the previous review. The LaTeX display it also raised is repaired (`:14–17` is now a Unicode `text` block).

**Repair.**
- Delete the parenthesised links at `:28`, `:77` and `:253`.
- `:160–161`: replace "(Scott's theorem in [Tau Ceti #18977](…); the modules" by "(the modules".
- `:170–171`: replace "`StrongHomClass.realize_sentenceInf`, [Tau Ceti #18035](…));" by "`StrongHomClass.realize_sentenceInf`);".
- `:185–188`: delete the sentence "Free-variable support (…) and the random-graph worked example (…) are not needed here."
- `:968–969`: delete "(Scott's theorem: [Tau Ceti #18977](…))".

## R04 (P3) — The Harnik–Makkai reduction still has no exact locator

**Location.** `README.md:824–825`: "(the minimal counterexamples of Harnik and Makkai; Montalbán's Theorem XII.7 is the minimally unbounded form)".

**Claim.** The parenthesis locates the target `exists_minimallyUncountableOn_and_of_bfScattered`.

**Witness.** No theorem number for Harnik–Makkai, no page for Montalbán. HarnikMakkai1977 line 19 (p. 309): Theorem 1, for ℵ₀ < count < 2^ℵ₀. Montalban-CSTpart2 line 9426 (p. 219): Theorem XII.7, for scattered unbounded sentences (line 9318).

**Repair.** Replace the parenthesis by: "(Montalbán, Theorem XII.7, pp. 219–220, for scattered unbounded sentences, which is this statement by 4b and `minimallyUncountableOn_modelsOf_iff_minimallyUnboundedOn`; Harnik–Makkai, Theorem 1, p. 309, for sentences with more than ℵ₀ and fewer than 2^ℵ₀ countable models)".

## R05 (P3) — Backticked names of this roadmap that `Suggested.lean` does not declare

**Location.** `README.md:220`, `:459` and `:526` (`exists_bound_of_countable`); `:635` and `:637` (`F.pointedType`, `F.typeSpectrum`); `:669` and `:671–672` (`ThinRankAnalysis`, `no_cantorAntichain`, `isThinOn`); `:751` (`Sentenceω.MinimallyUncountable`); `:753` (`BoundedRankOn`, `UnboundedRankOn`).

**Claim.** These are Lean declarations of this roadmap.

**Witness.** None of them is declared in `Suggested.lean` or at the pins. A backticked name of the roadmap's own claims that `Suggested.lean` declares it. `:220` itself identifies the first with Tau Ceti's `TauCeti.exists_rank_bound_of_countable_isoClasses` (`Counting/Stratification.lean:211`).

**Repair.**
- `:220`: replace "(the target `exists_bound_of_countable`, for any invariant map below `ω₁`)" by "(for any invariant map below `ω₁`)".
- `:459` and `:526`: write `TauCeti.exists_rank_bound_of_countable_isoClasses`.
- `:635` and `:637`: write "the coded type of `a` at `c`" and "the type spectrum of `C` at arity `n`".
- `:669–672`: write "a rank analysis of thinness for `r` on `A`" and "with the absence of a Cantor antichain and thinness derived from it".
- `:751`: write "the sentence form for `K = modelsOf φ`".
- `:753`: write "Boundedness and unboundedness of `ρ` below `ω₁` on `K`".

## R06 (P3) — Supplier contracts: targets without their section, and a theorem called an instance

**Location.** `README.md:267–268` ((S2) `isomorphismInvariant_modelsOf`), `:292` ((S6)), `:298` ((S7)) and `:336–340` ((M2) `fragmentType`, `Fragment.slice`). `:345–346` says "the instances `isRelational_morleyize` and `countable_relations_morleyize`", and `:646–647` repeats "by (M3)'s instances".

**Claim.** These items are imported by name and section, and `countable_relations_morleyize` is an instance.

**Witness.** The section homes are at the CountableStructureSpaces head (`README.md:395`, Layer 2; `:611`, §4.4; `:809`, §6.1) and in InfinitaryModelExistence on main (`README.md:487`, §4.1). `countable_relations_morleyize` is a theorem with hypothesis `Φ.Countable` (`ModelExistence/Morleyization.lean:99`).

**Repair.**
- Add "(its Layer 2)" after `isomorphismInvariant_modelsOf` at `:267`, "(its §6.1)" after `exists_sentence_separating` at `:292`, and "(its §4.4)" after `exists_uniform_bfSeparation` at `:298`.
- Add "(its §4.1)" after "InfinitaryModelExistence targets" at `:338`.
- `:345–346`: replace with "the instance `isRelational_morleyize` and the theorem `countable_relations_morleyize` (for countable `Φ`)".
- `:646–647`: replace with "by (M3), `L.morleyize Φ` is relational, and it has countably many relation symbols when `L` does, since `Φ` is countable".

## R07 (P3) — The roadmap's own definitions have no Checks

**Location.**
- `README.md:396–397`: `HasPerfectSetOfNonisoModelsOn`.
- `:554`: `IsThinOnNatModels`.
- `:600`: `ConcentratedAtBFLevels`.
- `:610`: `sentenceTheory`.
- `:651–656`: `morleyCode` and `morleyBase`.
- `:689–690`: `HasVaughtDichotomy` and `HasVaughtCount`.
- `:730`: `modelsOfTheory`.
- `:749–756`: `MinimallyUncountableOn` and `MinimallyUnboundedOn`.

**Claim.** The layer acceptance checks and the worked examples are enough to pin down these definitions.

**Witness.** The README has no `**Checks.**` list. Its checks compute only counts and perfect sets. Nothing evaluates `ConcentratedAtBFLevels`, `MinimallyUnboundedOn`, `sentenceTheory`, `morleyBase` or `modelsOfTheory`, or separates thin from "not perfectly many".

**Repair.** Add a `**Checks.**` list after each definition. These values are computed (rows 5, 8, 13, 21, 29):
- `HasPerfectSetOfNonisoModelsOn`:
  - true for `oneElement` at `Fin 1`;
  - false for `⊤` in the empty language at `ℕ`: there is one code, and a single point is not perfect;
  - at `Fin 0`, true with countably many nullary symbols and false with none.
- `IsThinOnNatModels`:
  - `oneElement` is thin, since it has no models on `ℕ`, yet it has perfectly many countable models;
  - "`E` is an equivalence relation" is not thin (the Layer 3 family);
  - "`E` is an equivalence relation with all classes infinite" is thin (`ℵ₀` classes).
- `ConcentratedAtBFLevels`:
  - `∅` is concentrated, with any centre;
  - a set meeting countably many classes is concentrated at every level, with any member as centre;
  - the models of "`E` is an equivalence relation" are not: level `k + 3` separates `f z` from `f z′` when `z k ≠ z′ k`, so any centre misses `𝔠` classes at level `ω`.
- `sentenceTheory`:
  - `θ n = ⊤` gives the constant sequence `true`;
  - with unary `P_n` and `θ n = ∃ x, P_n x`, the code in which `P_0` holds only at `0` gives `true` exactly at `n = 0`;
  - isomorphic codes give equal sequences.
- `morleyCode` and `morleyBase`:
  - for `Φ = ∅` the two maps are mutually inverse relabellings;
  - for `Φ = {⟨1, ⊤⟩}` the new bit is `true` everywhere;
  - two codes that differ only in that bit have the same `morleyBase`.
- `HasVaughtDichotomy` and `HasVaughtCount`:
  - `oneElement` satisfies both through `Fin 1` (count `𝔠`);
  - pure sets satisfy both (count `ℵ₀`), and so does Ehrenfeucht's example (count 3);
  - the first implies the second, by `countableModelCount_eq`.
- `modelsOfTheory`:
  - `T = ∅` gives every code;
  - `T = {∃ x ∀ y, y = x}` gives `∅`;
  - with one unary `P`, `T = {∀ x, P x}` gives exactly one code.
- `MinimallyUncountableOn`:
  - `∅` fails;
  - the models of "`E` is an equivalence relation" fail (row 13);
  - the codes of countable well-orders fail: "there is a last element" leaves `ℵ₁` classes on each side.
- `MinimallyUnboundedOn`:
  - `∅` fails (`β = 0` bounds it);
  - a single isomorphism class fails (`ρ c + 1` bounds it);
  - for the Scott height on codes of well-orders, both sides of "there is a last element" are unbounded, so it fails.

## Previous findings

- R01 (padding): partly repaired. The listed deletions were made and the README names they backticked are rewritten (`:190–211`, `:385–404`, `:650–662`, `:709`, `:836–840`). The `UnaryPredicates` block is back at `Suggested.lean:79–117`. Carried as R02.
- R02 (module docstring): repaired. `Suggested.lean:16` reads "…: target signatures", and `:18–21` say that `README.md` is the specification and this file is not.
- R03 (pull-request numbers, LaTeX): partly repaired. The LaTeX display is now Unicode at `README.md:14–17`, but the links at `:28`, `:77` and `:253` remain. Carried as R03.
- R04 (Harnik–Makkai locator): not repaired. `README.md:824–825` is unchanged. Carried as R04.

## Verified sound

| # | Statement | Instances | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | "Out of scope here" | InfinitaryModelExistence Layer 6; HanfNumbers | main InfinitaryModelExistence `README.md:597` is the graph translation; HanfNumbers' downstream-consumers section takes small models from this roadmap | holds | links (R03) |
| 2 | From CountableStructureSpaces | its head | `isomorphismInvariant_modelsOf` Layer 2, `exists_uniform_bfSeparation` §4.4, `exists_sentence_separating` §6.1; (S1)–(S5) names resolve at the pin | holds | sections (R06) |
| 3 | From BorelEquivalenceRelations | main | (E0) Layer 0.5; (E1), (E2) §4.2; (E1) hypothesis `R x y → F x y` is "F coarser than R" | holds | none |
| 4 | From InfinitaryModelExistence | main | (M0) 0.1, (M4) 0.3, (M2) §4.1, (M3) Layer 5; `countable_relations_morleyize` takes `hΦ` | holds | R06 |
| 5 | Acceptance check, Layer 0 | `oneElement` | codes on `Fin 1` = `ℕ → Bool`; `#Perm (Fin 1) = 1`; tiers `ℕ`, `Fin n` (n ≠ 1): 0; count `0 + 𝔠 = 𝔠` | holds | delete Lean copy (R02) |
| 6 | Acceptance check, Layer 1 | `K` meeting one class | isomorphism refines every level: one level class each; bound `1 ≤ ℵ₁` | holds | none |
| 7 | Acceptance check, Layer 2 | `E`, all classes infinite | empty model plus `k ∈ {1, …, ℵ₀}` classes: count `1 + ℵ₀ = ℵ₀`; equal atomic types are automorphic: orbit rank 0, rank 1 | holds | none |
| 8 | Acceptance check, Layer 3 | `f z`, `z k ≠ z′ k` | a class of exactly `k + 2` in one only; each bit reads one `z k`; continuous injective, so perfect range | holds | none |
| 9 | Acceptance check, Layer 4 | concentrated `C` | `ConcentratedAtBFLevels.bfScattered` binds only `[L.IsRelational]`; thin by 4a with Σ countability; no analyticity | holds | none |
| 10 | Acceptance check, Layer 5 | CH; `ℵ₁ < 𝔠` | `ℵ₀ < c ≤ ℵ₁ = 𝔠` gives `c = 𝔠`; `c = 𝔠 > ℵ₁` gives perfectly many by witnessed Morley | holds | none |
| 11 | Per-sentence predicates | `oneElement`; pure sets `⊤` | count `𝔠`, perfect set on `Fin 1`: both hold; count `ℵ₀`: both hold | holds | Checks (R07) |
| 12 | The conjectures | AGHKM-scattered Cor. 2.3; BFKL Thm 3.3 | absolute ⟺ strong, per sentence (AGHKM-scattered line 141); (a) ⟺ (b) at BFKL-red-herrings line 468, p. 12 | holds | none |
| 13 | Minimally uncountable sentences | models of "`E` equivalence relation" | "a class of exactly 2" splits the Layer 3 family by `z 0`: `𝔠` classes each side | not minimal | Checks (R07) |
| 14 | The witness | `π_z` | `π_z(2n) = n ≤ 2n`; `π_z(2n+1) = n + z_n ≤ 2n + 1`; `n ≤ n + z_n ≤ n + 1`; `z_n` recovered | holds | none |
| 15 | Targets and conventions | rows `[0..k]`, `[0..k, k]` | differ only at label `[0..k, k]`: `ℕ` versus `Fin (k+1)`; `ℕ ≡_k Fin (k+1)` since `k ≤ k + 1`; no automorphism | holds | none |
| 16 | Consequences for the counting interfaces | codes of `M`, `N_z` | internal rank `ω`; `bfEquivSetoid ω` holds, isomorphism fails, so isolation fails; any isolating rank exceeds `ω` there | holds | none |
| 17 | `countable_or_hasPerfectSetOfNonisoModelsOn_fin` | `n = 0`, nullary `Q_i` | codes = `ℕ → Bool`, isomorphism = equality: `𝔠` classes / perfect set: F ∨ T | holds | none |
| 18 | `…_or_hasPerfectlyMany_of_bounded` | `oneElement` | no models on `ℕ`, bound vacuous; count `𝔠` / perfect set on `Fin 1`: F ∨ T | holds | none |
| 19 | `…_or_eq_continuum_of_bounded` | pure sets; `oneElement` | `ℵ₀ ≤ ℵ₀`; `𝔠 = 𝔠` | holds | none |
| 20 | `…_of_internalScottRank_le` | `E`, infinite classes, `β = 1` | internal rank `1 ≤ 1`; count `ℵ₀` | holds | none |
| 21 | `countable_bfClasses_or_hasPerfectSet` | `E` equivalence, `β = ω` | level `k + 3` separates `f z`, `f z′`: `𝔠` level-`ω` classes / perfect set: F ∨ T | holds | none |
| 22 | `morley_…_or_hasPerfectlyMany` | `oneElement`; Ehrenfeucht | perfect set on `Fin 1`: T; `3 ≤ ℵ₁`: T | holds | none |
| 23 | `morley_countableModelCount` | `E` equivalence; pure sets | `𝔠 = 𝔠`; `ℵ₀ ≤ ℵ₁` | holds | none |
| 24 | `not_hasCantorAntichainOn_of_bfScattered` | one class; Layer 3 range | scattered, no antichain; the range is not scattered (`𝔠` level-`ω` classes) and carries one | holds | none |
| 25 | `bfScattered_modelsOf_iff_isThinOnNatModels` | `E` equivalence; pure sets | F ↔ F (row 21); T ↔ T (one code on `ℕ`) | holds | none |
| 26 | `ConcentratedAtBFLevels.bfScattered` | `∅`; one class | any centre; one level class per level | holds | none |
| 27 | `isThin_iff_countable_sentenceSpectra` | `E` equivalence, `θ n` = "a class of exactly `n + 2`"; `∅` | not thin / `f z ↦ z`, `𝔠` sequences: F ↔ F; T ↔ T | holds | none |
| 28 | `measurableEmbedding_morleyCode` | `Φ = ∅` | relabelling with inverse `morleyBase`; target Polish by `countable_relations_morleyize hΦ` | holds | none |
| 29 | `range_morleyCode` | `Φ = {⟨1, ⊤⟩}` | range = codes whose new bit is true everywhere; one false new bit excluded on both sides | holds | none |
| 30 | `hasCantorAntichainOn_image_morleyCode_iff` | `hasCantorAntichainOn_image_iff` | measurable embedding (row 28); `F (g x) (g y) ↔ E x y` from `nonempty_morleyEquiv_iff` | holds | none |
| 31 | `cardinalVaughtConjecture_of_aleph_one_eq_continuum` | count `c` | `c ≤ ℵ₀`, or `ℵ₀ < c ≤ ℵ₁ = 𝔠` so `c = 𝔠` | holds | none |
| 32 | `cardinalVaughtConjecture_iff_vaughtConjecture` | `ℵ₁ < 𝔠`, `c = 𝔠` | `c > ℵ₁` gives perfectly many; converse by `countableModelCount_eq` | holds | none |
| 33 | `not_hasVaughtDichotomy_iff` | `oneElement` | F / `¬` perfectly many is false: F | holds | none |
| 34 | `not_hasVaughtCount_iff` | pure sets; CH | F / `ℵ₀ ≠ ℵ₁`: F; under CH both F (row 31) | holds | none |
| 35 | `hasVaughtDichotomy_and_infiniteSentence_iff` | `oneElement` | `φ ⊓ inf` has no models, count 0: T / empty quotient countable: T | holds | none |
| 36 | `vaughtConjecture_iff_bfScattered` | both directions | ⇒ through `φ ⊓ inf`, thin on `ℕ`; ⇐ finite tiers by row 17, `ℕ` thin ⇒ scattered ⇒ countable | holds | none |
| 37 | `cardinalVaughtConjecture_iff_bfScattered` | `ℵ₁ < 𝔠` | rows 32 and 36 compose | holds | none |
| 38 | `vaughtConjecture_iff_forall_isIsolatingRank_bounded` | both directions | ⇒ `exists_rank_bound_of_countable_isoClasses`; ⇐ `exists_isIsolatingRank` and `countable_isoClasses_iff_bounded` | holds | none |
| 39 | `vaughtConjecture_iff_forall_universe` | `ULift` copy of `L₀ : Language.{0, 0}` | `Cardinal.lift` keeps `≤ ℵ₀`; perfectly many by the `…_onBoundedFormulaInf_iff` transport; ⇒ by `exists_language_zero_countableModelCount` | holds | none |
| 40 | `VaughtConjecture.firstOrder` | theory of infinite sets | complete; one code on `ℕ`: countable | holds | none |
| 41 | `minimallyUncountableOn_modelsOf_iff` | `E` equivalence | F (row 13) / not concentrated at level `ω` (row 21): F | holds | none |
| 42 | `…_iff_minimallyUnboundedOn` | pure sets, Scott height | F (countable) / constant rank, bounded: F | holds | none |
| 43 | `not_vaughtConjecture_of_minimallyUncountableOn` | minimally uncountable `φ` | thin with `ℵ₁` classes on `ℕ`; `φ ⊓ inf`: count `> ℵ₀`, no perfect set | holds | none |
| 44 | `exists_bfLevel_saturated_modelsOf` | `⊤`; "a class of exactly 2" | `β₀ = 0`; `β₀ = 3` (quantifier rank 3) | holds | none |
| 45 | `exists_minimallyUncountableOn_and_of_bfScattered` | Harnik–Makkai Thm 1; Montalbán Thm XII.7 | there `ℵ₀ < count < 2^ℵ₀`; Montalbán's scattered and unbounded is this hypothesis by 4b | holds | locator (R04) |
| 46 | `vaughtConjecture_iff_forall_not_minimallyUncountableOn` | both directions | ⇒ row 43; ⇐ row 45 with row 36 | holds | none |
| 47 | `Language.Equiv.internalScottRank_eq` | any `e` | `Equiv.bfEquiv` gives `BFEquiv α n a (e ∘ a)`, so orbit ranks agree; no such theorem at the pin | holds | none |
| 48 | `exists_internalScottRank_omega_with_large_bfClass` | README witness | internal rank `ω`; `ω < scottHeight M ≤ ω + ω` | holds | none |
| 49 | `not_isIsolatingRank_internalScottRank` | the three fields | invariance (row 47) and `internalScottRank_lt_omega_one` hold; isolation fails (row 16) | holds | none |
| 50 | `README.md:761`, uncountable `L` | `N_{S,t}`: `0` has unary type `S`, `E_t(1,2)`; `K = {N_{S₀,t}} ∪ {N_{S₀Δ{r},r}}`, `\|S₀\| ≥ 2` | a sentence's countably many symbols miss generic `t`, `r`: one side countable / level-1 class of `N_{S₀,0}`: `𝔠` inside and outside | false | hypothesis (R01) |
| 51 | `README.md:448–451`, uncountable `L` | unary `P_r`, all-empty code `c` | level-1 class `{c}` / any sentence keeps its truth when an unmentioned `P_s` flips | false | hypothesis (R01) |
| 52 | same, countable `L` | unary `P_i` | `{c} = modelsOf (∀ x, ⋀ᵢ ¬ P_i x)` | holds | none |
| 53 | `exists_bound_of_countable` | `TauCeti.exists_rank_bound_of_countable_isoClasses` | invariant `ρ < ω₁` with countably many classes on `K` gives a bound `β < ω₁` | holds | rename (R05) |

- **Gate.** Re-run at `1c8987f`: every check passes. The worker's targeted build passed.
- **Elaboration and signatures.** `lake env lean` on `Suggested.lean` gives 36 `declaration uses sorry` warnings and nothing else; the R02 trimmed copy gives 33. All 57 elaborated signatures were compared with the README. The two flagged binders are unused by their bodies: `IsThinOnNatModels` has no Σ countability and `morleyBase` no `IsRelational`.
- **Padding probe.** `rfl`, `infer_instance`, `trivial`, `decide`, `simp`, `simp_all` and `aesop` were tried on all 36 `sorry`s. None closes.
- **Library.** 158 cited Mathlib and Tau Ceti names `#check` at the pins. Definitions opened: `Counting/Stratification.lean:79, 211`, `Counting/Classes.lean:133, 340`, `Counting/Scattered/Basic.lean:79`, `SetTheory/Descriptive/Antichain.lean:107–117` and `ModelExistence/Morleyization.lean:80, 99`.
- **Sources (13 locators).**
  - Montalban-CSTpart2, compiled 22 April 2025: Def. XII.1 p. 216; Def. XII.4 and Lemmas XII.5–XII.6 p. 218; Thm XII.7 pp. 219–220; Lemma XII.8 pp. 220–221.
  - BFKL-red-herrings, 17 September 2014: "scattered" p. 2; Thm 3.3 p. 12; Lemma 3.4 p. 13.
  - AGHKM-scattered: §§1–2, Fact 2.2, Cor. 2.3.
  - HarnikMakkai1977: Thm 1, p. 309.
- **Dependency check.** Output: `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`, with no UPWARD or CYCLE line. As on main (main `README.md:27, 187`), the open CountableStructureSpaces still supplies (S6), (S7) and `isomorphismInvariant_modelsOf`; it consumes nothing from this roadmap (its `README.md:994–997`). This head narrows that edge: (S1)–(S5) are now pinned declarations.
- **Cross-roadmap citations resolved.**
  - CountableStructureSpaces at its head: Layer 2, §4.4, §6.1 and its downstream consumers.
  - BorelEquivalenceRelations on main: 0.5, 4.2 and 4.3.
  - InfinitaryModelExistence on main: 0.1, 0.3, 4.1, Layer 5 and Layer 6.
  - HanfNumbers at its head, and InfinitaryLogic in `Completed/`.
  - The title and description agree with the head: the pin, 36 `sorry`s, the Σ/per-arity convention, `Setoid.comapQuotientEquiv` and `Setoid.countable_quotient_comap_val_iff`.
- Overlap check: read CountableStructureSpaces, HanfNumbers, InfinitaryModelExistence, BorelEquivalenceRelations, InfinitaryLogic and RandomGraphs; López–Escobar and uniform separation are owned by CountableStructureSpaces (consumed as (S6), (S7)), the Silver forms by BorelEquivalenceRelations, Morleyization by InfinitaryModelExistence (in Tau Ceti), small models by HanfNumbers; counting and Vaught's conjecture have no second owner, and `overlaps.md` lists no dropped id and no other pull request changing this roadmap.

## Not verifiable

- Steel 1978, Morley 1970, Vaught 1961 and Silver 1980 are behind publisher paywalls (Springer, Cambridge/ASL, PWN, Elsevier). The forms of the conjecture were checked against AGHKM-scattered §§1–2 and BFKL-red-herrings p. 2 instead.
- Marker 2016, Becker–Kechris 1996, Gao 2009 and Kechris 1995 are publisher books (Cambridge, CRC, Springer) with no legal open copy. They are cited for background page ranges only, outside the sample.

## Source issues

- **Gap** in Montalban-CSTpart2 at Lemma XII.8, pp. 220–221: the statement assumes only minimal unboundedness, but the proof picks an unbounded class among countably many ≡β-classes; it should assume Θ scattered; affects the proof.
- **Gap** in Montalban-CSTpart2 at Theorem XII.7, proof, p. 220: the source applies Lemma XII.6 at levels α_i − 3, undefined when α_i is a limit ordinal; it should first replace each α_{i+1} by α_{i+1} + 3; affects the proof.
