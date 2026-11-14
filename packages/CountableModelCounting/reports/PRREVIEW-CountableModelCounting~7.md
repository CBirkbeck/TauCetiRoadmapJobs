# Review of CountableModelCounting (pull request #2012 at 17f7816)

**Verdict:** needs changes

Full review. Paths are under `TauCetiRoadmap/CountableModelCounting/`; Tau Ceti paths, at the pin `2fd255d99`, are under `TauCeti/`. The five findings of the previous review are repaired, except that one definition is left with two Checks (R02). R01 and R03–R05 are new.

## R01 (P2) — The prose drops "countably many relation symbols" where the statements need it

**Location.** `README.md:754`, "Prove, with exactly the hypotheses shown:", then `:758` `not_hasVaughtCount_iff`. Same omission at `:382` (`countableModelCount_le_continuum`), `:393` (`… countableModelCount_eq : countableModelCount φ = 𝔠`), `:518–525`, `:552–556`, `:609`, `:653`.

**Claim.** These hold for every relational `L`.

**Witness.** Unary `P_r`, `r ∈ ℝ`, `φ := ∃ x ∀ y, y = x`: the codes on `Fin 1` are `ℝ → Bool`, a perfect antichain, so the count is `2^𝔠`: not `≤ 𝔠`, not `= 𝔠`, `¬ HasVaughtCount φ` with count `≠ ℵ₁`. `Suggested.lean:92`, `:131`, `:316` carry the binder.

**Repair.**
- `:90`, end of convention 1, add: "Layers 2, 3 and 5, and 4c, 4e, 4f and 4h, assume countably many relation symbols throughout, except where a statement says it needs none; Layers 0, 1, 4a, 4b, 4d and 4g name the hypothesis at each statement that uses it."
- `:382`: "**Upper bound.** With countably many relation symbols, `countableModelCount_le_continuum`, …".
- `:392`: replace "With (E0), a perfect set gives `𝔠 ≤ #(Quotient (isoSetoidOn α φ))`, hence" by "With (E0), a perfect set gives `𝔠 ≤ #(Quotient (isoSetoidOn α φ))`, hence, with countably many relation symbols,".
- `:754`: replace the sentence by "Prove, for `L` with countably many relation symbols and with exactly the further hypotheses shown (the infinite-model reduction needs no countability):".
- `:431`, Layer 0 acceptance check, add the negative control: "With unary `P_r`, `r ∈ ℝ`, instead, the same sentence has `2^𝔠` one-element models: the upper bound `𝔠` needs countably many relation symbols."

Tested: with `P_r`, `r ∈ ℝ`, no repaired statement applies; with `P_i`, `i ∈ ℕ`, the count is `𝔠` and each holds.

## R02 (P3) — `MinimallyUnboundedOn` has two Checks

**Location.** `README.md:823–826`: "**Checks.** For `MinimallyUnboundedOn`: `∅` fails … a nonempty set inside the isomorphism class of `c` fails".

**Claim.** Two Checks pin the definition.

**Witness.** Every definition carries at least three; both Checks here are failures, so neither separates the definition from the predicate that is always false.

**Repair.** Add a third bullet, a positive instance: "It can hold when `ρ` is not isomorphism invariant. With one unary `P`, let `K` be the isomorphism class of the code in which `P` is the even numbers (`𝔠` codes, one class), and let `ρ` take values cofinal in `ω₁` on `K`. Then `ρ` is unbounded on `K`, and for every `θ` one of `K ∩ modelsOf θ`, `K \ modelsOf θ` is empty, bounded by `β = 0`. So the equivalence with `MinimallyUncountableOn` needs an isolating rank." Tested against the second Check: an isolating rank is constant on `K`, bounded by `ρ c + 1`.

## R03 (P3) — Four Lean names do not appear in the README

**Location.** `Suggested.lean:118` (`countableModelCount_le_aleph0_or_hasPerfectlyMany_of_internalScottRank_le`), `:195` (`ConcentratedAtBFLevels.bfScattered`), `:475` (`Label`), `:479` (`Sym`); `README.md:935` writes "`lang ℕ`".

**Claim.** README and Lean agree name by name.

**Witness.** Each of the four names occurs 0 times in `README.md`. `lang` takes two arguments (`Suggested.lean:487`): the witness is over `lang ℕ Language.empty`, and `Sym` has constructors `lift` and `lift0` that the README does not mention.

**Repair.**
- `:528`: "The internal form, `countableModelCount_le_aleph0_or_hasPerfectlyMany_of_internalScottRank_le`: if …".
- `:615`: "concentrated implies `BFScattered` (`ConcentratedAtBFLevels.bfScattered`; hence thin, …".
- `:935–936`: replace "The relational language `lang ℕ` has `row` (unary), `own` (binary), and `lab τ` (unary) for each nonempty word `τ` over `ℕ`" by "The labels `Label ℕ` are the nonempty words over `ℕ`. The relational language `lang ℕ Language.empty`, with symbols `Sym ℕ Language.empty`, has `row` (unary), `own` (binary) and `lab τ` (unary) for each label `τ`; the constructors `lift` and `lift0`, which lift the relations of a component language, are empty here".

## R04 (P3) — An instance without a docstring

**Location.** `Suggested.lean:490`: "instance (U : Type) (Lc : FirstOrder.Language.{0, 0}) : (lang U Lc).IsRelational".

**Claim.** Every declaration states its mathematics in a docstring.

**Witness.** Line 489 is blank; the 51 other declarations have one.

**Repair.** Insert before `:490`: `/-- The assembled language is relational: it has no function symbols. -/`.

## R05 (P3) — The description counts 36 `sorry`s and does not say the Layer 0 block left the file

**Location.** Description, "**Scope.**": "`Suggested.lean` states target signatures with 36 `sorry`s"; "**Validation.**": "gives 36 `declaration uses sorry` warnings".

**Claim.** The head has 36 sorried statements.

**Witness.** `lake env lean` on `Suggested.lean` at `17f7816`: 33 warnings. The `UnaryPredicates` block (`Rel`, `lang`, `oneElement` and three statements) is gone since `c49f63f`.

**Repair.** Write "33" in both places, and add to **Scope**: "The Layer 0 acceptance check (the one-element sentence with countably many unary predicates) is no longer stated in `Suggested.lean`; the README keeps it."

## Previous findings

- R01 (the `UnaryPredicates` block) — repaired: `Suggested.lean:73–79` goes from the transport comment to Layer 1; `README.md:999` reads "(the Layer 0 acceptance check)".
- R02 (pull-request numbers) — repaired: `README.md:27`, `:75`, `:158`, `:166`, `:245` carry no link; the sentence on free-variable support is gone.
- R03 (Harnik–Makkai locator) — repaired: `README.md:896–899`, "(Montalbán, Theorem XII.7, pp. 219–220, … Montalbán, p. 218, attributes to Harnik and Makkai …)"; both checked below.
- R04 (undeclared backticked names) — repaired: `README.md:212`, `:464`, `:531` name `exists_rank_bound_of_countable_isoClasses`; `:669–672`, `:712–715`, `:808`, `:818` are prose.
- R05 (Checks) — partly: lists at `README.md:395`, `:563`, `:623`, `:638`, `:693`, `:735`, `:793`, `:811`; `:823` has two (R02).

## Verified sound

| # | Statement | Instances | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | Out of scope (`README.md:61–75`) | graph translation; small models | InfinitaryModelExistence "Layer 6: the graph translation" (its `README.md:597`); HanfNumbers owns small models, complete sentences (same file `:145`) | resolves | none |
| 2 | From CountableStructureSpaces (S1–S7) | its open head | Layer 2 `isomorphismInvariant_modelsOf` (`:432`); 4.4 `exists_uniform_bfSeparation` (`:666`); 6.1 `exists_sentence_separating` (`:883`); `Scott/Height.lean:78, 133, 169, 186, 241` | resolves | none |
| 3 | From BorelEquivalenceRelations (E0–E2) | pin | `Antichain.lean:107, 112` (nonempty required), `:116`, `:260`, `:304` (both spaces Polish); `Silver.lean:153`, `:163` (Borel `A`, Borel `F` on `A`, `R` refines `F`) | agrees | none |
| 4 | From InfinitaryModelExistence (M0–M4) | main; pin | 0.1 (`:171`), 0.3 (`:219`), 4.1 (`:492`); `Morleyization.lean:80` (`Relations n ⊕ {φ // ⟨n, φ⟩ ∈ Φ}`), `:94`, `:99`, `:462` | agrees | none |
| 5 | Layer 0 acceptance check | `P_i`, `i ∈ ℕ`; `P_r`, `r ∈ ℝ` | codes on `Fin 1` = `ℕ → Bool`, `Perm (Fin 1)` trivial, tiers `ℕ`, `Fin 0`, `Fin (n ≥ 2)` empty: `𝔠`. Uncountable: `2^𝔠` | holds as stated | R01 adds the control |
| 6 | Layer 1 acceptance check | `K` in one class | one class at every level; bound gives `≤ ℵ₁`, actual `1` | holds | none |
| 7 | Layer 2 acceptance check | all classes infinite | models: empty and `k ∈ {1, …, ℵ₀}` classes: `ℵ₀`; rank `1` is pinned `internalScottRank_fromRel_eq_one` (`Scott/EquivalenceRelation.lean:245`); empty structure: `0 + 1` | holds | none |
| 8 | Layer 3 acceptance check | `z`, `z′` differing at `k` | class sizes `≥ 2` of `f z` = `{k + 2 : z k}`: `k + 2` present / absent; each code bit reads one bit of `z` | holds | none |
| 9 | Layer 5 acceptance check | `ℵ₁ = 𝔠`; `ℵ₁ < 𝔠` | `ℵ₀ < count ≤ ℵ₁ = 𝔠` gives `= 𝔠`; `count = 𝔠 > ℵ₁` excludes `≤ ℵ₁`, so perfectly many | holds | none |
| 10 | Per-sentence predicates and Checks (`README.md:730–741`) | one element; pure sets; Ehrenfeucht | counts `𝔠`, `ℵ₀`, `3`: both predicates true each time; dichotomy at `𝔠` only through `Fin 1` | holds | none |
| 11 | `not_hasVaughtCount_iff`, `morley_countableModelCount`, cardinal bounded-rank form | `P_r`, `r ∈ ℝ`, one element | count `2^𝔠`: `¬(≤ ℵ₀ ∨ = 𝔠)` true / `= ℵ₁` false; Lean binder excludes it, prose does not | prose overclaims | R01 |
| 12 | `hasVaughtDichotomy_and_infiniteSentence_iff` (no countability) | any `L`; `Fin 0` | models of `φ ⊓ infiniteSentence`: `ℕ` tier unchanged, every `Fin n` empty; perfect antichain needs `P.Nonempty`, so no finite-tier disjunct | holds | none |
| 13 | Minimally uncountable sentences, Checks | `∅`; equivalence relations; well-orders | `∅`: 0 classes; "a class of exactly 2": `𝔠` / `𝔠` (`z 0` true / false); "last element": `ℵ₁` / `ℵ₁` | all fail, as stated | none |
| 14 | `minimallyUncountableOn_modelsOf_iff` | `modelsOf φ = ∅`; equivalence relations | `∅`: F ↔ (T ∧ F); equivalence relations: F ↔ (F ∧ T), level `ω` separates all `f z` | holds | none |
| 15 | `MinimallyUnboundedOn`, Checks | `∅`; one class; non-invariant `ρ` | `∅`: `β = 0` bounds; one class: `ρ c + 1` bounds; one class, `ρ` cofinal: unbounded and every cut has an empty side: holds | 2 Checks, both negative | R02 |
| 16 | `minimallyUncountableOn_modelsOf_iff_minimallyUnboundedOn` | `∅`; scattered `K`, subsets | `∅`: F ↔ (T ∧ F); on scattered `K` "countably many classes" = "`ρ < β`" for each subset (`Scattered/Basic.lean:155`, strict bound) | holds | none |
| 17 | Minimal counterexamples, steps 3–5 | `X`, `Y` first differing at `i` | chain link at `α_{i+1} ≥ α_i + ω` (`BackAndForth.lean:153` needs `α i + ω`); `A_X ~ A_{X↾(i+2)} ~ A_{X↾(i+1)}` at `α_{i+1}`; `A_{σ0} ≁ A_{σ1}` at `α_{i+1}`; `sup α_i < ω₁` | holds | none |
| 18 | `exists_minimallyUncountableOn_and_of_bfScattered`, locator | Montalban-CSTpart2 | Theorem XII.7 at line 9426, printed p. 219, proof to p. 220; attribution to Harnik–Makkai at line 9362, p. 218; Lemma XII.6 hypothesis `α_i + 3` at line 9378 | locator right | none |
| 19 | `vaughtConjecture_iff_forall_isIsolatingRank_bounded` | thin `φ`; no perfect set at `ℕ` | forward: `φ ⊓ infiniteSentence` has no finite tier, so countable, bound `sup + 1` strict; backward uses `isIsolatingRank_scottHeight` (`Stratification.lean:238`), so not vacuous | holds | none |
| 20 | `VaughtConjecture.firstOrder` | complete `T` with a one-element model only | `modelsOfTheory T = ∅`: first disjunct, 0 classes | holds | none |
| 21 | `HasPerfectSetOfNonisoModelsOn`, Checks | `Fin 1`; empty language at `ℕ`; `Fin 0` | `ℕ → Bool` perfect; one point, not preperfect; `Fin 0`: nullary symbols give `ℕ → Bool`, none gives one point | hold | none |
| 22 | `ConcentratedAtBFLevels`, Checks and `.bfScattered` | `∅`; countably many classes; equivalence relations | image of `∅` countable; "exactly `k + 2`" has depth `k + 3`; centre at `ω` meets `≤ 1` `f z`; scattered: `1 +` countably many level classes | hold | name in README (R03) |
| 23 | `morleyCode`, `morleyBase`, `range_morleyCode`, transport | `Φ = ∅`; `Φ = {⟨1, ⊤⟩}` | `∅`: `Relations n ⊕ Empty`; new bit `true` everywhere; reduct forgets it; transport needs both spaces Polish (`Antichain.lean:304`), binders present at `Suggested.lean:260` | hold | none |
| 24 | The witness (`README.md:933–941`) | `π_z`; rows `[0..k]`, `[0..k, k]` | `π_z(2n) = n ≤ 2n`, `π_z(2n+1) = n + z n ≤ 2n + 1`, nondecreasing, injective in `z`; both rows allowed | holds | names (R03) |
| 25 | Targets and conventions (`README.md:943–968`) | `Fin (k+1)` against `ℕ` | `≡_j` iff `j ≤ k + 1`; orbit rank of `[0..k]` `> k`, all finite: `sup (orbitRank + 1) = ω` (`Scott/Rank.lean:159`) | holds | none |
| 26 | Consequences for the counting interfaces | `ρ (code of M) ≤ ω` | `isolates_of_le` at `ω` would give `M ≅ N_z`; `N_z ≇ M`; so `ω < ρ`, and the `ω`-class meets `𝔠` classes | holds | none |
| 27 | Layer 4c and its locator | BFKL preprint | Theorem 3.3 at line 468, p. 12; Lemma 3.4 at line 491, p. 13; "scattered" there = no perfect set (line 48) | agrees | none |

- **Gate.** The worker's run at `17f7816`: every check passes, with the targeted build.
- **Elaboration.** `lake env lean` on `Suggested.lean`: 33 `declaration uses sorry` warnings and no other message. One-tactic probe (`rfl`, `simp`, `infer_instance`) on a scratch copy: 0 of 33 close.
- **Signatures.** The 51 elaborated types compared with the README. The two flagged binders are unused by the bodies: `IsThinOnNatModels` (no countability) and `morleyBase` (no `IsRelational`). No change.
- **Dependency check.** `depcheck: 244 roadmaps, 2197 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.
- **Sources (11 locators against the text).** Montalban-CSTpart2: Definitions XII.1 (line 9312) and XII.4 (9359), Lemmas XII.5 (9367), XII.6 (9376), XII.8 (9472, proof 9480–9485), Theorem XII.7 (9426), p. 218 (9362), compiled 22 April 2025 (line 8). BFKL: Theorem 3.3, Lemma 3.4. Andrews et al.: Fact 2.2 (line 117), the three forms (lines 27–35, 121–127).
- **Library (27 declarations opened at the pin)**: those cited in the table, and `Counting/Classes.lean:133, 190, 340, 367`, `Counting/Stratification.lean:79, 211`, `Counting/Scattered/Basic.lean:79`, `RelationalConfiguration/LevelSentence.lean:102`, `RelationalConfiguration/LanguageMap.lean:79, 186`. The citation tool's one lead, `Language.Equiv.internalScottRank_eq`, is declared at `Suggested.lean:467`.
- **Cross-roadmap citations resolved (7).** CountableStructureSpaces Layer 2, 4.4, 6.1 at its head; InfinitaryModelExistence 0.1, 0.3, 4.1, Layer 6 on main. Remark: `README.md:82` and `:1055–1056` link Mathlib pull requests, as on main.
- Overlap check: read CountableStructureSpaces, HanfNumbers, InfinitaryModelExistence, BorelEquivalenceRelations, InfinitaryLogic, RandomGraphs; Borel isomorphism under a Scott-height bound is owned by CountableStructureSpaces 4.3 (Layer 2 here uses the isolating-rank form as a proof step, not a target), the relative López–Escobar form by this roadmap (CountableStructureSpaces says so), fragment types and Morleyization by InfinitaryModelExistence, Silver by BorelEquivalenceRelations; nothing else shared.
- Source independence: 13 passages compared with 4 sources (Montalban-CSTpart2, BFKL, Andrews et al., HarnikMakkai1977), none shared beyond forced statements of at most 7 words; largest share Montalban-CSTpart2, 20 of 40 locators; contents compared with Montalban-CSTpart2 (Ch. XII, §XII.1–§XII.3): independent, only Layer 3 and one subsection of Layer 5 have a counterpart.

## Not verifiable

- Morley 1970, Silver 1980, Vaught 1961, Steel 1978, López-Escobar 1965: not read in this review; cited as whole works, with no theorem locator in the README.
- Marker 2016, Becker–Kechris 1996, Gao 2009, Kechris 1995: books, not read; cited for chapter and page ranges only.
- The description's integration run at `d52f7ee5` ("ALL COMPILED") is outside this repository and was not run.

## Source issues

- **Gap** in Montalban-CSTpart2 at Lemma XII.8, pp. 220–221: the statement assumes only minimal unboundedness, but the proof picks an unbounded class among countably many ≡β-classes; it should assume Θ scattered; affects the proof.
- **Gap** in Montalban-CSTpart2 at Theorem XII.7, proof, p. 220: the source applies Lemma XII.6 at levels α_i − 3, undefined when α_i is a limit ordinal; it should first replace each α_{i+1} by α_{i+1} + 3; affects the proof.
- **Error** in Andrews et al. (scattered sentences preprint) at footnote 2, p. 3: the source says Lemma 3.4 of Baldwin et al. derives "no perfect set" from Morley's definition; it should say the lemma derives Morley's definition from "no perfect set"; affects nothing.

## For the human reviewers

- **Scope.** `README.md:245–294` names CountableStructureSpaces as supplier of (S1)–(S7); that roadmap is an open pull request, not on main and not in the merge order. Main's README already cites it; the dependency check reports no problem.
- **Licence.** `README.md:1063–1068` says a Lean formalisation of most of the material exists in `cameronfreer/infinitary-logic` at commit `518a366` (stated Apache-2.0), and maps its files to the layers; the pull request's author owns that repository.
- **Licence.** The source with the largest share of locators, Montalban-CSTpart2, is an unpublished draft on its author's page (`README.md:1128–1136`); the theorem it is cited for is published (Harnik–Makkai 1977).
