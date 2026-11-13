# Review of HanfNumbers (pull request #1319 at c61d644)
**Verdict:** needs changes

## R01 (P2) — 5.2's `PotentialIso` transfer is stated for every language, but its only supplier is relational

**Location:** `TauCetiRoadmap/HanfNumbers/README.md:956`–`957` (5.2, where `L` is arbitrary): “potentially isomorphic structures realize the same complete types, so smallness transfers along `PotentialIso`”.

**Claim:** Every target has an owned route at the generality it is stated at.

**Witness:** The only supplier, `TauCeti.PotentialIso.infEquivAt` (Tau Ceti `BackAndForth/Karp.lean:287`), carries `[L.IsRelational]`. InfinitaryLogic's Karp theory is relational (`Completed/InfinitaryLogic/README.md:113`), and README `:1131`–`1135` puts Karp theory for function symbols out of scope.

**Repair:** Replace the bullet's clause by “for relational `L`, potentially isomorphic structures realize the same complete types (through a tuple back-and-forth system, `TauCeti.potentialIso_iff_exists_isTupleBFSystem`), so smallness transfers along `PotentialIso`”. Its one use, 5.4 at `:1029`–`1030`, is relational. 5.6 does not use it.

## R02 (P3) — Five declarations in `Suggested.lean` are not headlines (previous R03, partly repaired)

**Location:** `TauCetiRoadmap/HanfNumbers/Suggested.lean:66` `partitionRel_iff_finset`, `:76` `PartitionRel.mono`, `:305` `hanfNumber_isHanfBound`, `:461` `isLω₁ωSmall_iff_exists_isCompleteSentence`, `:470` `exists_isCompleteSentence_isCategorical`.

**Claim:** `Suggested.lean` states the roadmap's headline theorems only.

**Witness:** I checked these in a scratch copy. `:461` and `:470` each close with one `exact` of their `_of_countable` forms (`:486`, `:496`). `:305` closes in five lines with `csInf_mem`. `:66` restates the definition, and `:76` is monotonicity API.

**Repair:** Delete the five declarations from `Suggested.lean`; the README keeps each statement.
- In the README, write `:293`–`295` and `:663` without backticks: “monotonicity (larger source, smaller target, fewer colours)”, “the order-free form, with colourings of `n`-element subsets”, “the Hanf number is a Hanf bound”.
- In `Suggested.lean:57`, replace “(`partitionRel_iff_finset`)” with “(README 0.1, the order-free form)”.
- Drop “(headline)” at README `:1025` and `:1038`; the headlines are 5.6's. The two relational names stay mentioned in the docstrings at `:485` and `:493`.

## R03 (P3) — Five sampled subsections have no locator

**Location:** `README.md` 0.3 (`:321`–`323`), 2.1 (`:471`–`500`), 2.2 (`:506`–`550`), 2.3 (`:569`–`596`) and 4.1 (`:838`–`844`). The same holds for 1.1–1.3 and 5.6.

**Claim:** Every theorem carries a locator at the claim.

**Witness:** None of these subsections cites a theorem, section or page. The tree argument of 0.3 is in the proof of Theorem 39 (i) of Erdős and Rado 1956 (pp. 469–470). The Skolem expansion of 2.1 is in Marker's notes, pp. 55 and 57.

**Repair:** Add these locators in parentheses at the claim:
- 0.3, after `exists_isEndHomogeneousOn`: “(the ramification argument in the proof of Theorem 39 (i) of Erdős and Rado 1956, pp. 469–470)”.
- 2.1: “(built-in Skolem functions for a countable fragment, as in Marker's notes, p. 55 and the start of the proof of Theorem 5.2, p. 57)”.
- 2.2 and 2.3: “The source interface and the term model are this roadmap's own; the classical stretching is Marker's notes, Exercise 5.7, p. 57, and the hull of indiscernibles in the proof of Theorem 5.11, p. 59.”
- 4.1: “(Marker's notes, p. 54, the definition of the Hanf number and Exercise 5.1)”.
- 1.1–1.3 and 5.6: say that each is the roadmap's own interface, with the same background locators.

## R04 (P3) — Most definitions have fewer than three Checks (previous R05, partly repaired)

**Location:** `README.md`. These definitions have no Checks: `IsHomogeneousOn`, `IsEndHomogeneousOn` (`:269`–`272`), `iteratedTwoPow` (`:93`), 1.1–1.3, 2.2, 3.3, 4.1, and `IsCategorical` (`:114`). These have only two: `hanfNumber` (`:673`–`675`), `IsLω₁ωSmall` (`:962`–`965`) and `IsCompleteSentence` (`:1000`–`1001`).

**Claim:** Every definition has at least three discriminating Checks, and no Check names a Lean declaration.

**Witness:** The README has five `**Checks.**` blocks. The Check at `:1001` names `isCompleteSentence_scottSentence`.

**Repair:** Add Checks such as the following (values computed below), and drop “(`isCompleteSentence_scottSentence`)” from `:1001`.
- `IsEndHomogeneousOn`, on pairs from ℕ: `c(x<y) = x mod 2` makes ℕ end-homogeneous but not homogeneous (`c(0,1) = 0`, `c(1,2) = 1`). `c(x<y) = y mod 2` does not make ℕ end-homogeneous (`c(0,1) = 1`, `c(0,2) = 0`).
- `IsHomogeneousOn`: for `c(x<y) = (x+y) mod 2`, the even numbers are homogeneous and `{0, 1, 2}` is not. For `n = 0`, every set is homogeneous.
- `iteratedTwoPow`: `iteratedTwoPow ℵ₀ 1 = 2^ℵ₀ = ℶ₁`, and `iteratedTwoPow 2 2 = 16`.
- `IsIndiscernibleOn`: `id : ℕ → (ℕ, <)` is indiscernible for `x₀ < x₁`. `n ↦ (−1)ⁿ n` into `(ℤ, <)` is not: the formula is true at `(0, 2)` and false at `(0, 1)`.
- `templateOf`: over a one-point index order, every arity-2 formula, `⊥` included, lies in the template.
- `hanfNumber`: “exactly two elements” has Hanf number `3`.
- `IsLω₁ωSmall`: `(ω₁, <)` is not small. Every countable ordinal is Lω₁ω-definable, so it has `ℵ₁` complete 1-types.
- `IsCompleteSentence`: “exactly one element” is complete. “At least one element” is not, since it does not decide `∃x ∃y x ≠ y`.
- `IsCategorical`: “infinitely many elements” is `κ`-categorical for every infinite `κ`. The Scott sentence of `(ℚ, <)` is `ℵ₀`-categorical but not `ℵ₁`-categorical.
- `IsApproximatedAt`: `({⟨0, σ⟩}, ∅)` is approximated at `κ` exactly when `σ` has a model of size at least `κ`. `({disEq}, {disEq})` is approximated at no `κ ≥ 2`.

## R05 (P3) — Twelve backticked names of this roadmap's own are declared nowhere

**Location:** `README.md:475` `skolemSymbols`, `:661` `IsHanfBound.mono`, `:784` `morley_hanf_theory`, `:840` `beth_omega_one_isLω₁ωHanfBound`, `:843` `lt_lomega1omegaHanfNumber_of_maximal_model`, `:866`–`868` (three ladder names), `:886`–`887` (two), `:1003`, `:1031`.

**Claim:** Every backticked name of this roadmap's own is declared in `Suggested.lean`.

**Witness:** None of the twelve occurs in `Suggested.lean`, and its module docstring does not list them among the README-only targets, as it does for `realize_em_iff`.

**Repair:** Write these as prose labels without backticks, for example “**The global bound.** `ℶ_ω₁` is a Hanf bound for every sentence of every language (from `morley_hanf`)”. Do not declare them, since none is a headline. Leave the Provenance mention at `:1242`, which names the external file, as it is.

## R06 (P3) — The module docstring still frames the file as suggestions, and two docstrings state no mathematics (previous R06, partly repaired)

**Location:** `Suggested.lean:12`–`15`: “The statements here suggest Lean forms for the milestones, so that contributors and reviewers converge on names and signatures; discharging all of them finishes neither a layer nor the roadmap.” Also `:263` and `:271`.

**Claim:** The docstring says the file states the roadmap's headline theorems, and every declaration's docstring states its mathematics.

**Witness:** The file is the roadmap's acceptance test. `:263` reads only “**Layer 3 milestone, disjunction witnesses.**”, and `:271` only “**Layer 3 milestone, conjunction witnesses.**”.

**Repair:**
- Replace `:12`–`15` by “**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, with the definitions they need.”
- `:263`: “**Layer 3.3, disjunction witnesses.** If a cofinally approximated condition declares a countable disjunction true, then adding one of its disjuncts as true keeps it cofinally approximated.”
- `:271`: the same with “conjunction” and “false”.

## R07 (P3) — Time-bound wording and pull-request numbers in the README

**Location:** `README.md:234`–`250` and `:1173`–`1175`.

**Claim:** The README is timeless and cites no pull requests.

**Witness:** `:235` reads “They are built in Tau Ceti now … replaced by Mathlib's declarations when equivalents land”. `:245`–`248` read “The closed proposal [Mathlib #43488] … the open [Mathlib #40782]”. None of these is a supplier (`:1174`–`1175`).

**Repair:** Replace `:234`–`250` by “Neither pinned library has an infinite Ramsey theorem, an Erdős–Rado theorem or partition-relation vocabulary; Layer 0 colours increasing tuples of a linear order of every arity and cardinality.” Delete the sentence “The Mathlib proposals listed under … are not dependencies.” at `:1173`–`1175`.

## R08 (P3) — The description's Series paragraph predates the merge of three sibling roadmaps

**Location:** Pull-request description, **Series**: “Dependencies: … #1319 on #1315 …. Each builds on `main` by itself.” and “Suggested review order: #1315 and #1317 first, then #1316, …”.

**Claim:** The description states the head's dependencies.

**Witness:** InfinitaryModelExistence, BorelEquivalenceRelations and CountableModelCounting are on main (`7342e8f`). README `:29` and `:151` cite InfinitaryModelExistence there.

**Repair:** Replace these two sentences by “InfinitaryModelExistence, BorelEquivalenceRelations and CountableModelCounting are on main; CountableStructureSpaces is open. This roadmap consumes InfinitaryModelExistence as it is on main and waits for no open pull request. Review focus: the template extraction (Layers 2.2–3.4).”

## Previous findings

- R01 (display TeX): repaired. Gate `tex=0`, and `README.md:9` reads “`Hanf(Lω₁ω) = ℶ_ω₁`”.
- R02 (eight undeclared names): repaired. Gate `readme-ids-missing=0`, and `isCompleteSentence_scottSentence` is declared at `Suggested.lean:454`. Twelve other names remain undeclared: R05.
- R03 (padding): partly repaired. Six declarations are deleted (`iteratedTwoPow_beth`, `IsIndiscernibleOn.comp`, `isIndiscernibleOn_iff_realizesOn_templateOf`, `isIndiscernibleOn_morleySeed`, `hanfNumber_le_beth_omega_one`, `isLω₁ωSmall_of_countable`); five remain: R02.
- R04 (locators): partly repaired. 0.1, 0.2, 0.4, 2.4, 3.1–3.4, 4.2, 4.3 and 5.1–5.5 now cite locators, all verified below. 0.3, 2.1–2.3 and 4.1 still have none: R03.
- R05 (Checks, Needs lines, layer endings, headings): partly repaired. Every subsection now has a `*Needs:*` line, every layer ends with `### Examples` and `### Dependencies`, and the house headings are present. Only five definitions have Checks: R04.
- R06 (pull-request number, docstring form): partly repaired. `#1316` is gone, and the title is fixed. “Names are provisional” is deleted, but the framing sentence remains: R06.
- R07 (description): repaired. The description now gives the Ramsey sentence and names IME Layer 6 and the two 5.6 headlines. The Series paragraph has since gone stale: R08.

## Verified sound

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 0.1 `PartitionRel` | `(0,0,1,0)`; `(3,2,1,2)`; `(2,2,1,2)` | `∅` homogeneous, `0 ≤ 0`, but Marker needs a colour `< 0`; a fibre of size 2; fibres of sizes 1, 1 | Holds, holds, fails, as `:286`–`289` say |
| 0.1 vs Marker §5.1, p. 55 | `#X ≥ κ` vs `#J = κ` | Restricting to a subset of size `κ` gives the same homogeneous sets | Agree for `μ ≥ 1` |
| 0.2 `partitionRel_succ_one` | `κ = ℵ₀` | `ℵ₁ → (ℵ₁)¹_ℵ₀` by regularity of `ℵ₁`; Marker p. 56, case `n = 0` | True |
| 0.2 `exists_unbounded_fiber` | `D = Bool`; `D = ω₁`, `f` injective | Some value is unbounded; every fibre is a singleton | `[Countable D]` needed, present |
| 0.3 `exists_isEndHomogeneousOn` | `λ = ℵ₀`, `n = 0`; `c = y mod 2` on ℕ | Nodes below level `ℵ₁` number at most `ℵ₁·2^ℵ₀ = ℶ₁ < ℶ₁⁺`, giving an `ℵ₁`-branch; `c(0,1) ≠ c(0,2)` | True; no locator (R03) |
| 0.4 `erdos_rado` | `κ = ℵ₀`, `n = 0, 1, 2` | `ℵ₁ → (ℵ₁)¹`, `ℶ₁⁺ → (ℵ₁)²`, `ℶ₂⁺ → (ℵ₁)³`; source `ℶ₁` fails at `n = 1` (Marker Prop 5.4) | Matches Thm 5.5, p. 55 |
| 0.4 `erdos_rado_beth` | `α = 0`, `n = 1`; `α = ω` | `iteratedTwoPow ℶ₀ 1 = ℶ₁`; `ℶ_(ω+1)⁺ → (ℶ_ω⁺)²_{ℶ_ω}` | Matches Cor 5.6, p. 56 |
| 2.1 Skolem tower | finite `L₀`, `Γ₀ = {x₀ = x₁}`; all formulas | Each `Γ_k` is countable (countably many terms); Skolemizing all formulas gives `2^ℵ₀` symbols | Countable as claimed; no locator (R03) |
| 2.2 `IsEMSource` | `(ℚ, <)`, two atoms, `a` the inclusion; `a n = (−1)ⁿ n` in ℤ | Increasing tuples have a constant order type; `x₀ < x₁` is true at `(0,2)` and false at `(0,1)` | A source; not a source |
| 2.2 `skolem` field | `L'` with no constants, `⟨0, ∀y ψ⟩ ∈ Γ` | `L'.Term (Empty ⊕ Fin 0)` is empty, so no source exists | Consistent with empty `J` |
| 2.3 truth lemma, `∀` step | `m = 0`, `¬Φ (∀y χ)` | The witness term `w` is closed; the element `(w, ∅)` refutes `χ` | True |
| 2.3 cardinality | `#J = ℵ₁`, `L'` countable; `J = Fin 3` | `#E ≤ max(ℵ₀, ℵ₁, ℵ₀) = ℵ₁`; `#E` can be `ℵ₀ ≠ 3` | Bound true; `[Infinite J]` needed for equality, present |
| 2.4 `exists_emModel` | ℚ check over any `J`; `J = ∅` | `E ≅ J`; `E` is the closed terms, with `#E ≤ ℵ₀` | True |
| 2.4 `exists_emModel_card_eq` | `#J = ℵ₁`, `a` injective | `#E ≤ ℵ₁`, and injective `c` gives `ℵ₁ ≤ #E` | `#E = #J` |
| 3.2 reduction | `M ⊨ φ` with `ℶ₀ ≤ #M`; empty `M` | A fixed element exists for the arity-0 dummies; the empty model has none | Nonemptiness comes from the size bound |
| 3.3 `decide` | `n = 2`, `α = 0` | Approximate at level 2: `#H ≥ ℶ₂ ≥ ℶ₁⁺ → (ℵ₁)²_ℵ₀`, giving `H'` of size `ℵ₁ ≥ ℶ₀` | True |
| 3.3 `exists_iSup_witness` | `n = 1`; `n = 0` | Colour by the least true disjunct, with `ℵ₀ ≤ ℶ_α` colours; for `n = 0`, read the colour in the structure | True |
| 3.3 `isCofinallyApproximated_start` | `H = N` | `σ` holds at the empty tuple; `disEq` holds at increasing pairs | True |
| 3.4 `morley_omitting_types` | `ℶ_ω₁` constants with type `{x ≠ cᵢ}`; `p.2 = ∅` | Omitting models exist in sizes `1 … ℶ_ω₁` only; for `p.2 = ∅` the hypothesis fails, so the statement is vacuous | `hSc` needed, present |
| 3.4 `exists_model_card_eq_of_forall_beth` | `ℶ_ω₂` unused constants, `κ = ℵ₀` | A model of size `ℵ₀`, through the reduct along `g` | No term for the language's size, as stated |
| 3.4 `morley_hanf` | nonempty model `≥ ℶ_ω₁`; finite `κ` | It gives the cofinal hypothesis; finite `κ` is covered by the model of size `ℵ₀` | True |
| 3.4 `exists_emSource_of_forall_beth` | composed with 2.4 and the reduct | Yields `exists_model_card_eq_of_forall_beth` | Not vacuous |
| 3.1 Checks (R04) | `∀x ⊥`; ladder at `α = 0`; “exactly two elements” | Hanf numbers `0`, `(2^ℵ₀)⁺`, `3` | As claimed; third Check added |
| 4.1 global bound | Example 6 (constants, one model of size `ℵ₀`) | `ℵ₀` is not a bound for it, `ℶ_ω₁` is: `ℵ₀ < lomega1omegaHanfNumber` | True |
| 4.2 ladder upper bound | `α = 0`; level `ω` | `#U₁ ≤ 2^ℵ₀`; `#U_ω ≤ ℵ₀·ℶ_ω = ℶ_ω` | True |
| 4.2 maximal model | `α = 0`; `α = ω` | `Set ℕ`, of size `2^ℵ₀`; `#V_(ω+ω+1) = preBeth(ω+ω+1) = ℶ_(ω+1)` | Matches Ex 5.3, p. 54 |
| 4.3 `lomega1omegaHanfNumber_eq_beth_omega_one` | `α < ω₁` | `ℶ_(α+1)` lies below the number; `⨆ ℶ_(α+1) = ℶ_ω₁` (`beth_limit`); `ℶ_ω₁` is a bound | Equal to `ℶ_ω₁`; KK Thm 1.6.2, p. 10 |
| Convention 5 | `κ = ℶ_ω₁` | `μ < ℶ_ω₁` gives some `α < ω₁` with `μ ≤ ℶ_α`, and conversely | Cofinal and single-model forms agree |
| Convention 6 | `∀x ⊥`, empty language vs one constant | Counting empty models: `1` vs `0`; nonempty models only: `0` and `0` | Invariant, as claimed |
| 5.1 `HighlyOrderTransitive` | ℚ; ℤ; `Fin 2`; `κ = 2` | Yes; `(0,1) ↦ (0,2)` impossible; no; no HOT order of size 2 | Discriminates; `ℵ₀ ≤ κ` needed, present |
| 5.2 `IsLω₁ωSmall` | `(ℝ, <)`; the field ℝ; `(ω₁, <)` | Finitely many types per arity; `2^ℵ₀` 1-types; `ℵ₁` 1-types | Small; not small; not small |
| 5.2 `PotentialIso` bullet (R01) | relational `L`; one unary function symbol | A tuple back-and-forth system gives equal types; the only supplier needs `[L.IsRelational]` | General case unowned |
| 5.3 `exists_small_model_card_eq` | `κ = ℵ₁`, `J` HOT of size `ℵ₁` | At most `ℵ₀` codes per arity; automorphisms identify tuples with the same code, so at most `ℵ₀` types | True; infinite `κ` needed, present |
| 5.4 Scott completeness | `(ℚ, <)`; a dense order of size `ℵ₁` | It satisfies Scott(ℚ), is potentially isomorphic to ℚ, and agrees on every sentence | Complete |
| 5.4 relational iff | empty `M`, no constants | Small; its Scott sentence has only empty models, so it is complete | Empty models must count, as Convention 7 says |
| `:461`, `:470` (R02) | `exact …_of_countable …` | Both elaborate with no error | One-tactic special cases |
| `:305` (R02) | case split and `csInf_mem` | Elaborates in five lines | API, not a headline |
| 5.6 forward | `σ = backTranslate θ` | `N ⊨ σ ↔ N^G ⊨ θ` (no nonemptiness at `BackTranslate.lean:205`); `θ` decides `relationalize ψ` | `σ` complete |
| 5.6 backward | nonempty `M`; `P ⊨ θ` | The reconstructed `N` has the same relations and `N ⊨ σ`; `χ` is decided as `backTranslate χ` is | `θ` complete |
| Example 10 | `f = id`, infinitely many elements | Graph form: infinite sets with `G_f` as equality; complete and `κ`-categorical | True |
| `exists_isCompleteSentence_isCategorical_of_countable` | pure set at `ℵ₁`; DLO Scott sentence at `ℵ₁` | `σ` is “infinitely many elements”; `hcat` is false, so the statement is vacuous | True |
| Convention 9 | `ℶ_ω₁ → (ω)^{<ω}_2` | The least such cardinal, `κ(ω)`, is inaccessible and above `ℶ_ω₁` | False, as stated |

- **Gate**, rerun at `c61d644`: every counter is `0` (`OK`), and the worker's run has `build=0`. The diff outside the folder is empty.
- **Dependency check:** `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. HanfNumbers is at line 408 of the merge order. Its suppliers, InfinitaryLogic (`Completed/`) and InfinitaryModelExistence, are on main.
- **Elaboration:** `lake env lean` exits 0 with 29 `sorry` warnings and nothing else. All 52 elaborated signatures (`signatures.md`) agree with the README, and no section binder is lost.
- **Probes:** two declarations close with one `exact` and `:305` in five lines (R02). `PartitionRel.mono` and `isCofinallyApproximated_start` do not close with `simp_all`. `morley_omitting_types_of_countable` does not close with one `exact`, because the pin has no `Countable (L.BoundedFormula Empty n)` instance.
- **Source locators:** 21 checked against the text. From Marker's 2013 notes (printed page = PDF page): §5.1 p55, Thm 5.2 p54, Ex 5.3 p54, Thm 5.5 p55, its proof p56, Cor 5.6 p56, Ex 5.7 p57, the proof of 5.2 pp57–58, Cor 5.8 p58, Thm 5.11 p59, Ex 5.12 p59, Cor 5.13 p59, Def 6.11 and the remark p77, Ex 2.34 p22. From the Keisler–Knight preprint: §1.6, Thm 1.6.1 p9, Thm 1.6.2 p10. From Erdős–Rado 1956: Thm 39 (i), pp. 467–470.
- **Library declarations:** 77 pinned names `#check`ed, and all resolve. Files opened at the pins: Tau Ceti `Infinitary/Fragment.lean:69`, `Syntax.lean:75`–`94`, `Scott/Sentence.lean:44`–`121`, `BackAndForth/AllLevels.lean:91`, `Karp.lean:287`, `PotentialIso.lean:44`, `ModelExistence/Types.lean:72`/`95`/`152`, `LowenheimSkolem.lean:251`, `GraphTranslation/{BackTranslate:205, Relationalize:284, Reconstruct:161, 224, 248, 282}`; Mathlib `ModelTheory/Satisfiability.lean:386`, `:505`, and `ModelTheory/Basic.lean:70`.
- **Cross-roadmap citations**, resolved on main at `7342e8f`: InfinitaryModelExistence 0.1 `:171`, 0.2 `:183`, 0.3 `:200`, 0.4 `:226`, 1.1 `:253`, 1.2 `:275`, 2.2 `:330`, 2.3 `:341`, 4.1 `:487`, Layer 6 `:597`, and its consumer contract `:131`–`146`; InfinitaryLogic `:688`; BanachSpaceTheory §B4.1 `:512`/`:627`; CountableModelCounting `:72`. `overlaps.md` lists no dropped id. Ownership was searched by object in every open pull request: Erdős–Rado, partition relations, Hanf numbers, indiscernibles, Ehrenfeucht–Mostowski, high order-transitivity, smallness, complete sentences, Skolem towers and end-homogeneity.
- **Overlap check:** I read InfinitaryModelExistence (main, and the head of #1615), InfinitaryLogic, CountableModelCounting (main, and the head of #2012), CountableStructureSpaces, RandomGraphs and GrothendieckUniverses. Nothing is shared. InfinitaryModelExistence (#1615 `:158`) and CountableModelCounting (main `:72`) leave indiscernibles, Ehrenfeucht–Mostowski models, Hanf numbers, smallness and complete sentences to HanfNumbers, which owns them. GrothendieckUniverses consumes the same Mathlib von Neumann names and owns none of these objects.

## Not verifiable

- **Marker, 2016 Cambridge edition:** paywalled. The README cites the 2013 author notes (“Marker's notes”), which I read.
- **Keisler–Knight, BSL 2004:** I read the authors' preprint. §1.6 and the theorem numbers were not compared with the journal pages.
- **Kanamori, *The Higher Infinite*:** paywalled. The inaccessibility of `κ(ω)` in Convention 9 is cited without a locator.
- **Morley 1965, Hanf 1964, López-Escobar 1966, Ehrenfeucht–Mostowski 1956, Keisler 1971:** not fetched. No sampled statement rests on them alone.
- **`cameronfreer/infinitary-logic`:** the claims of the Provenance section were not checked.
- **Proofs:** no headline was proved. The probes and the table rule out specific errors only.

## Source issues

- **Misprint** in marker at Exercise 5.3, printed p. 54: the limit clause reuses the fixed `α` as its bound index; it should use a fresh index below `β`; affects nothing.
- **Misprint** in marker at the proof of Theorem 5.2, second claim, printed p. 58: the displayed biconditional ends with index `j_n`; it should be `j_m`; affects nothing.
- **Misprint** in marker at the proof of Theorem 5.11, printed p. 59: the words about extending to an automorphism are printed twice; they should appear once; affects nothing.
- **Error** in marker at Theorem 5.11, printed p. 59: the source promises a small model of every cardinality `κ`; it should restrict to infinite `κ`; affects a stated result.
- **Error** in marker at Exercise 5.12, printed p. 59: the source asks for an order of every cardinality that is `n`-transitive for all `n`, and no finite order with two points is; it should restrict to infinite `κ`; affects a stated result.
- **Error** in marker at Corollary 5.13, printed p. 59: the source places no restriction on `κ`; it should require `κ` infinite; affects a stated result.
- **Gap** in marker at the proof of Corollary 5.13, printed p. 59: it cites Exercise 2.34, which assumes the structure countable, for a model of cardinality `κ`; it should use the form for small structures of any cardinality in a countable vocabulary; affects the proof.
- **Misprint** in marker at Theorem 6.12, printed p. 78: the hypothesis names the sentence `φ` and the conclusion `ψ`; both should be `φ`; affects nothing.
- **Misprint** in keisler-knight at §1.6, preprint p. 10: the definition of a computable ordinal repeats the word “on”; it should appear once; affects nothing.
