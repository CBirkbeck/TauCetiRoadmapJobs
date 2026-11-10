# Review of HanfNumbers (pull request #1319 at 2dc7d39)
**Verdict:** needs changes

Full review of `TauCetiRoadmap/HanfNumbers/README.md` and `TauCetiRoadmap/HanfNumbers/Suggested.lean`; the folder changed by 281 lines since `c716a69`. No mathematical defect was found: every statement survived the adversarial pass below, including the new Layer 5.6. The gate still fails on two style counters (`tex=2`, `readme-ids-missing=8`), and the seven findings are all P3. Five of them are carried from the previous review.

## R01 (P3) — Gate: display TeX

**Location:** `TauCetiRoadmap/HanfNumbers/README.md:531`–`533` and `:559`–`561` (gate `tex=2`); the same `math` fences at `:11`–`13` and `:318`–`320`.

**Claim:** Mathematics is written in Unicode.

**Witness:** Line 532: `|\mathrm{EM}(J,\Phi)|\le\max\bigl(\aleph_0,\ |J|,\ |\textstyle\sum_n L'_{\mathrm{fun},n}|\bigr),`.

**Repair:** Replace the four fenced `math` blocks by code spans:
- `:11`–`13`: `Hanf(Lω₁ω) = ℶ_ω₁`;
- `:318`–`320`: `ℶₙ(κ)⁺ → (κ⁺)ⁿ⁺¹_κ`;
- `:531`–`533`: `#EM(J, Φ) ≤ max(ℵ₀, #J, #(Σ n, L'.Functions n))`;
- `:559`–`561`: `#E ≤ max(ℵ₀, #J, #(Σ n, L'.Functions n))`.

Also write `(ω)^{<ω}_2` at `:123` and `:346`, `2^{ℶₙ(κ)}` at `:323`, `x_{l-1}` at `:418` and `:457`, and the like inside code spans (most already are).

## R02 (P3) — Gate: eight README names that `Suggested.lean` does not declare

**Location:** `README.md:596`, `:597`, `:694`, `:740`, `:862` (this roadmap's names); `:1065`, `:1081`, `:1090` (names in the external formalization).

**Claim:** Each backticked own name is declared or mentioned in `Suggested.lean`.

**Witness:** Gate `readme-ids-missing=8`: `hanfNumber_le_of_isHanfBound`, `hanfNumber_le_iff_isHanfBound`, `hasArbLargeModels_of_forall_beth`, `lomega1omegaHanfNumber_le_iff`, `isCompleteSentence_scottSentence`, `morleySeed_indiscernibleOn`, `hasArbLargeModels_of_seed_realizability`, `Lomega1omegaHanfNumber_eq_beth_omega1`.

**Repair:** State the facts in prose, with no backticked name, and add no declaration:
- `:596`–`597`: “the Hanf number is a Hanf bound, lies below every Hanf bound, and `κ` is a Hanf bound exactly when the Hanf number is at most `κ`”;
- `:694`: “**Arbitrarily large models** and **`morley_hanf`**: …”;
- `:740`: “the universal property (the global Hanf number is at most `κ` exactly when `κ` is a global Hanf bound)”;
- `:862`: “**Completeness of Scott sentences**: the Scott sentence of a countable structure `M₀` is complete.”;
- `:1065`, `:1081`, `:1090`: name the external file only, e.g. “`Methods/EM/FragmentAdapter.lean` (the seed and its indiscernibility)”, “`Conditional/MorleyHanfTransfer.lean` (arbitrarily large models from seed realizability)”, “`ModelTheory/MorleyHanf.lean` (the bounded-spectrum criterion and the value of the Hanf number)”.

## R03 (P3) — Padding in `Suggested.lean`: proved in place, not deleted

**Location:** `TauCetiRoadmap/HanfNumbers/Suggested.lean`:
- proved in one step: `:89` `iteratedTwoPow_beth`, `:142` `IsIndiscernibleOn.comp`, `:166` `isIndiscernibleOn_iff_realizesOn_templateOf`, `:182` `isIndiscernibleOn_morleySeed`, `:374` `hanfNumber_le_beth_omega_one`, `:446` `isLω₁ωSmall_of_countable`;
- definitional API: `:68` `partitionRel_iff_finset`, `:78` `PartitionRel.mono`, `:334` `hanfNumber_isHanfBound`;
- special cases of a headline in the same file: `:492` `isLω₁ωSmall_iff_exists_isCompleteSentence`, `:501` `exists_isCompleteSentence_isCategorical`.

**Claim:** Each declaration is an acceptance-test headline.

**Witness:** The first six carry one-line proofs in the file, which is the padding test. In a scratch copy both relational theorems close by `exact …_of_countable …` (the instance `Countable (Σ l, L.Functions l)` is found from `[L.IsRelational]`).

**Repair:** Delete these eleven theorems from `Suggested.lean`; the README keeps each as a target, Check or route step. The previous review asked for deletion, and proving them in place does not answer it. The two relational names stay mentioned in the docstrings of the `_of_countable` headlines. For the other nine, keep the README statement in prose and drop the backticks (`:275`–`276`, `:334`, `:364`, `:384`, `:395`, `:400`, `:596`, `:696`, `:821`, `:914`, `:932`), so that the name check of R02 stays clean. `iteratedTwoPow` stays: `erdos_rado` needs it.

## R04 (P3) — No locator at any target

**Location:** `README.md`, every layer subsection (`:256`–`:924`); the references are at `:1102`–`1135`.

**Claim:** Every theorem has a locator at the claim.

**Witness:** No subsection of Layers 0–5 gives a theorem, section or page; only Convention 5 (`:91`) cites Keisler–Knight §1.6. Marker is cited by chapter of the 2016 edition only.

**Repair:** Put the locator in parentheses at the claim. I checked these against the texts (numbering of Marker's 2013 notes on the author's page; check them against the 2016 edition or cite the notes):
- **0.1:** Erdős–Rado 1956, relation (1), p. 429; Marker §5.1, p. 55.
- **0.2:** Marker, proof of Thm 5.5 (case `n = 0`), p. 56; the cofinal pigeonhole, p. 58.
- **0.3:** Erdős–Rado Thm 39(i), pp. 469–470.
- **0.4:** Marker Thm 5.5, p. 55, and Cor 5.6, p. 56; Erdős–Rado Thm 4(i), p. 429, for `n = 1`.
- **3.1:** Keisler–Knight §1.6 and Thm 1.6.1, preprint p. 9; Marker p. 54 and Ex. 5.1.
- **3.2–3.3:** Marker, proof of Thm 5.2, pp. 57–58.
- **3.4:** Marker Thm 5.2, p. 54, and Cor 5.8, p. 58.
- **4.1–4.3:** Marker Ex. 5.3, p. 54; Keisler–Knight Thm 1.6.2, preprint p. 10.
- **5.1–5.3:** Marker Thm 5.11 and Ex. 5.12, p. 59.
- **5.2, 5.4, 5.5:** Marker Ex. 2.34, p. 22, and Cor 5.13, p. 59.
- **1.1–1.3, 2.1–2.4, 5.6:** say that these interfaces are the roadmap's own, with Marker Ex. 5.7, p. 57, as background.

## R05 (P3) — Checks, `*Needs:*` lines, layer endings and house headings

**Location:** `README.md` throughout. For example `:256`–`279` defines `PartitionRel` with no Checks; `:46` is “Scope and dependency order”; `:130` is “Existing library and ownership”.

**Claim:** Every definition has three discriminating Checks, every target its dependencies, and the README has the house shape.

**Witness:** The README has 0 `**Checks.**` blocks, 0 `*Needs:*` lines, and no `### Examples` or `### Dependencies` subsection. It has no `**Summary.**`, `## Scope and ownership`, `## Exact supplier contracts`, `## How to read the build` or `## Downstream consumers`. Defining `IsEMSource` before its first use (2.2) is done.

**Repair:** As in the previous review:
- Add a `**Checks.**` list of at least three items to each definition. Values verified below: `PartitionRel` (`0 → (0)¹_0` holds; `3 → (2)¹_2` holds; `2 → (2)¹_2` fails); `HighlyOrderTransitive` (`ℚ` yes; `ℤ` 1- but not 2-transitive; `Fin 2` no); `hanfNumber` (`∀x ⊥` has Hanf number `0`; the ladder at `α = 0` has `(2^ℵ₀)⁺`); `IsLω₁ωSmall` (`(ℝ, <)` small; the ordered field `ℝ` not); `IsCompleteSentence` (`⊥` is not complete; the Scott sentence of `(ℚ, <)` is).
- Give each target a `*Needs:*` line.
- End each layer with `### Examples` (the worked examples, distributed) and `### Dependencies`.
- Open with `**Summary.**`; rename `:46` and `:130` to `## Scope and ownership` and `## Exact supplier contracts` (updating the three internal links `](#existing-library-and-ownership)`); add `## How to read the build` (the table at `:50`–`57`) and `## Downstream consumers` (CountableModelCounting cites this roadmap).

## R06 (P3) — A pull-request number in the README, and the module docstring's form

**Location:** `README.md:973`: “**[CountableStructureSpaces](../CountableStructureSpaces/README.md) ([#1316](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1316))**”. `Suggested.lean:9`: “…: suggested signatures”; `:13`–`16`; `:28` “Names are provisional.”

**Claim:** Roadmaps are cited by name and section, and the docstring has the acceptance-test form.

**Witness:** `:973` is the one roadmap pull-request number left. The docstring calls the file “not exhaustive … for *particular* milestones” with provisional names, where the file is the list of headline theorems the roadmap is tested against.

**Repair:** Delete “([#1316](…))” at `:973`. Title the docstring “Ehrenfeucht–Mostowski models and Hanf numbers for Lω₁ω: target signatures”; replace `:13`–`16` by “it states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`”; delete “Names are provisional.” The sentence naming the README-only term-model targets (`:23`–`27`) is right and stays.

## R07 (P3) — The description is behind the head on Ramsey and on Layer 5.6

**Location:** pull-request description, “Partition calculus” paragraph: “infinite Ramsey and the rest of the partition calculus are named as a separate combinatorics roadmap.” Also the “Ownership and coordination” list of consumed InfinitaryModelExistence milestones.

**Claim:** The description states what the head does.

**Witness:** `README.md:252`–`254` and `:962`–`968`: infinite Ramsey is cited to BanachSpaceTheory §B4.1 and the rest is outside the roadmap. `README.md:200`–`214` and `:887`–`910` consume InfinitaryModelExistence Layer 6, and the countable-language headlines are new; the description mentions neither.

**Repair:** Replace the sentence by “the infinite Ramsey theorem is BanachSpaceTheory §B4.1's and is not used; the rest of the partition calculus is outside the roadmap.” Add Layer 6 (the graph translation) to the consumed milestones, and name the two countable-language headlines of Layer 5.6 among the main theorems.

## Previous findings

- **R01** (subsequence keeps the template) — repaired. `README.md:385`–`389`: “if `a` is indiscernible on `Δ`, a subsequence along `K ↪o J` with `K` infinite has the same template on `Δ`”, with the `P(a n) ↔ n ≥ 1` instance recorded as the failure without the hypothesis.
- **R02** (`set_option`, docstring form) — partly. The override is gone (gate `set_option=0`), the README-only targets are named and every declaration has a docstring. The title and framing remain: R06.
- **R03** (display TeX) — not repaired: R01.
- **R04** (process words, pull-request numbers, pin hashes) — repaired but for `:973` (R06). “checkpoint” is gone (gate `residue=0`); Tau Ceti and merged-roadmap pull-request numbers are gone. The pin sentences at `:141`–`146` stay; I do not hold them: they agree with `lake-manifest.json` (Tau Ceti `2fd255d9`) and say where each declaration is.
- **R05** (own names) — partly: 9 names down to 8: R02.
- **R06** (padding) — not repaired; six of the nine are now proved in place: R03.
- **R07** (locators) — not repaired: R04. The request for a sources manifest is dropped: it is not a file of this folder.
- **R08** (Checks, Needs, endings, headings) — partly; only the placement of `IsEMSource` is done: R05.
- **R09** (relational restriction) — repaired. `README.md:887`–`912` adds Layer 5.6 on InfinitaryModelExistence Layer 6, `Suggested.lean:517` and `:527` state both headlines for countable languages, and worked example 10 is the function-symbol test case.
- **R10** (Mathlib vocabulary) — repaired. `README.md:105`–`117` relates the notions to `Theory.IsComplete` and `Cardinal.Categorical`; `IsCompleteSentence` (`Suggested.lean:478`) requires a model; `Cardinal.beth_add_one` is cited at `:85` and `:136`.
- **R11** (infinite Ramsey) — repaired. `README.md:252`–`254`, `:962`–`968`; no “future”.
- **R12** (`Φ disEq` over a general `Γ`) — repaired. `README.md:535`–`539` and `:551` say “declares the instance `x₀ = x₁` false”.

## Verified sound

**Gate.** The worker's gate at this head: every counter `0` except `tex=2` and `readme-ids-missing=8`; `build=0`, `depcheck=0`, `outside-folder=0`, `set_option=0`, `residue=0`. I did not rerun the whole gate. The diff outside the folder is empty.

**Dependency check** (rerun):

```text
depcheck: 229 roadmaps, 2122 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. HanfNumbers is at line 402 of the merge order. Its suppliers InfinitaryLogic (`Completed/`), InfinitaryModelExistence and BanachSpaceTheory are on main.

**Elaboration.** `lake env lean` on `Suggested.lean` exits with 28 `sorry` warnings and nothing else. In a scratch copy each `sorry` was tried with `rfl`, `simp`, `intros; simp_all` and `infer_instance`: none closes. I read all 56 declarations against their README statements, and checked `#check @` output for five (`IsApproximatedAt`, `exists_emModel`, `exists_sentence_maximal_model`, `lomega1omegaHanfNumber_eq_beth_omega_one`, `isLω₁ωSmall_iff_exists_isCompleteSentence_of_countable`): no binder is lost, the source universe of `exists_emModel` is independent of the model's, and the README's generality equals the Lean's.

**Headline theorems.** Erdős–Rado (`erdos_rado`, `erdos_rado_beth`), stretching (`exists_emModel`, `exists_emModel_card_eq`), extraction (`exists_emSource_of_forall_beth`), Morley–Hanf (`exists_model_card_eq_of_forall_beth`, `morley_hanf`), omitting types, sharpness (`lomega1omegaHanfNumber_eq_beth_omega_one`), small models, and the complete-sentence and categorical-completion theorems for countable languages are all stated. The truth lemma `realize_em_iff` and the four template targets need the term model `EM(J, Φ)` and the Skolem tower, which are not at the pins; the module docstring says so and nothing stands in for them.

**Library declarations opened at the pins** (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`):
- Tau Ceti `ModelTheory/Infinitary/GraphTranslation/`: `Language.lean:86` (`isRelational_graphLanguage`), `:140` (`countable_relations_graphLanguage`), `:230` (`graphExpansion`); `Relationalize.lean:172`, `:284` (`realize_relationalize`, for bounded formulas over the graph expansion); `BackTranslate.lean:205` (`realize_backTranslate`), `:224`; `Reconstruct.lean:161` (`graphAxioms`), `:191`, `:224`, `:248` (`reconstructStructure`, with `[Nonempty M]`, as README `:210` says), `:282`, `:294` (needs `φ.functionsIn ⊆ F`, met by `F = Set.univ`).
- Mathlib `SetTheory/Cardinal/Aleph.lean:531`, `:687`, `:712`, `:722`, `:728` (`beth_succ` at `:716` is no longer cited); `Regular.lean:76`, `:88`; `Pigeonhole.lean:47`, `:100`; `Order.lean:106`, `:261`, `:483`, `:535`; `Arithmetic.lean:106`; `Basic.lean:716`, `:745`; `Defs.lean:379`; `SetTheory/ZFC/VonNeumann.lean:50`, `:58`, `:76`, `:120`, `:141`.
- The other Tau Ceti names (the Scott, back-and-forth, fragment, type, language-map, substitution, sublanguage and Löwenheim–Skolem files) were opened by the previous review at the same pin and are unchanged; the file imports three of them and elaborates.
- Neither pinned library has partition relations, Erdős–Rado, Hanf numbers, indiscernibles, highly order-transitive orders, Lω₁ω smallness or complete Lω₁ω sentences (searched by object; the only Ramsey-type files are Mathlib's `Combinatorics/Hindman.lean` and `HalesJewett.lean`).

**Cross-roadmap citations resolved** (main at `8101f2c`):
- `Completed/InfinitaryLogic/README.md:688`: out of scope lists Ehrenfeucht–Mostowski stretching, partition calculus and Morley–Hanf.
- `TauCetiRoadmap/InfinitaryModelExistence/README.md`: headings 0.1–0.4 (`:171`–`226`), 1.1, 1.2 (`:253`, `:275`), 2.2, 2.3 (`:330`, `:341`), 4.1 (`:487`), Layer 6 (`:597`); the consumer contract at `:131`–`146`; ownership at `:885`–`886`. The same headings exist at the head of its open revision.
- `TauCetiRoadmap/BanachSpaceTheory/README.md:627`, inside §B4.1 (`:512`): infinite Ramsey for finite colourings of `[ℕ]^k`.
- `TauCetiRoadmap/CountableModelCounting/README.md:72` defers these objects here.

`overlaps.md`: no other pull request changes this roadmap and no cited id is dropped. Ownership against open pull requests was checked with `roadmaps grep` by object (Erdős–Rado, Hanf number, indiscernibles, highly order-transitive, partition relation): only InfinitaryModelExistence and CountableModelCounting mention them, and both defer them here. The three leads of `citations.md` are not defects: two are this file's own `IsCofinallyApproximated.exists_iSup_witness` and `exists_iInf_witness` (`Suggested.lean:293`, `:301`), the third a name in the external formalization.

**Sampled targets** (texts read from the sources cache; the README gives no locator, R04):

| Target | Source at its locator | Agreement |
| --- | --- | --- |
| 0.1 Vocabulary | Erdős–Rado, relation (1), p. 429; Marker §5.1, p. 55 | Agrees for `μ ≥ 1`; Marker takes `|X| ≥ κ`, equivalent by monotonicity |
| 0.2 Pigeonhole | Marker, proof of Thm 5.5, p. 56; p. 58 | `κ⁺ → (κ⁺)¹_κ` and the cofinal pigeonhole agree |
| 0.4 Erdős–Rado | Marker Thm 5.5, p. 55; Cor 5.6, p. 56; Erdős–Rado Thm 4(i), p. 429 | Same exponents and colour bound |
| 1.1, 1.3 | the roadmap's own | Rows below |
| 2.1, 2.3, 2.4 | Marker Ex. 5.7, p. 57, as background | Laws checked on the truth-lemma route below |
| 3.1 Hanf bounds | Keisler–Knight §1.6, Thm 1.6.1, preprint p. 9; Marker p. 54 | Cofinal definition as in Convention 5 |
| 3.2, 3.3 | Marker, proof of Thm 5.2, pp. 57–58 | Erdős–Rado at `ℶ_(α+n) ≥ ℶ⁺_(α+n−1)`, then pigeonhole: the same counts |
| 3.4 Theorem | Marker Thm 5.2, p. 54; Cor 5.8, p. 58 | Same hypothesis and conclusion; the omitting-types form here is derived from the headline |
| 4.1 Global bounds | Keisler–Knight Thm 1.6.2, preprint p. 10; Marker Ex. 5.3 | Value `ℶ_ω₁`; ladder clauses agree |
| 5.2 Small structures | Marker Thm 5.11, p. 59; Ex. 2.34, p. 22 | Same notion (complete Lω₁ω-types) |
| 5.5 Completions | Marker Cor 5.13, p. 59 | Agrees, with `κ` infinite here |

**Adversarial pass:**

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| `PartitionRel`, zero colours | `(0,0,1,0)` | `H = ∅` homogeneous, `0 ≤ #∅` (elaborated); Erdős–Rado: no colour `ν < 0`, false | As README `:266`–`270` says |
| `PartitionRel`, `μ ≥ 1` | `(3,2,1,2)`; `(2,2,1,2)` | A fibre of size ≥ 2: true; identity colouring, fibres 1 and 1: false | Discriminates |
| `partitionRel_iff_finset` | `n = 0`; `D` empty with `κ < n` | Both sides reduce to `lam ≤ κ`; both sides ask `lam ≤ κ` for the empty colouring | Agree |
| `erdos_rado` | `κ = ℵ₀`, `n = 0, 1, 2` | `ℵ₁ → (ℵ₁)¹`; `ℶ₁⁺ → (ℵ₁)²`; `ℶ₂⁺ → (ℵ₁)³`, colours `ℵ₀` | Matches Marker Thm 5.5 |
| `erdos_rado_beth` | `α = 0`, `n = 1` | `iteratedTwoPow ℶ₀ 1 = 2^ℵ₀ = ℶ₁`; `ℶ₁⁺ → (ℵ₁)²_{ℵ₀}` | Matches Cor 5.6 |
| `exists_isEndHomogeneousOn` | `lam = ℵ₀`, `n = 0` | Source `≥ ℶ₁⁺`; levels `≤ ℵ₀^ℵ₀ = ℶ₁`; branch of length `ℵ₁` | True |
| `exists_unbounded_fiber` | `D = Bool`; `D = ω₁`, `f` injective; `D` empty | A value unbounded; none unbounded, so countability is needed; no `f` exists | Hypothesis needed |
| Subsequence template (`:385`) | `P(a n) ↔ n ≥ 1`, `succ` | `P(x₀)` not in `templateOf a`, in `templateOf (a ∘ succ)`; `a` not indiscernible | Excluded by the new hypothesis |
| `isIndiscernibleOn_morleySeed` | `a` injective; `a 0 = a 1 ≠ a 2` | `disEq` true at all increasing pairs; false at `(0,1)`, true at `(0,2)` | Injectivity needed |
| `IsEMSource` skolem clause | `L'` without constants, `⟨0, ∀y ψ⟩ ∈ Γ` | `L'.Term (Empty ⊕ Fin 0)` is empty: no source exists | Consistent with `J = ∅` |
| `exists_emModel` | `ℚ`, `Γ = {x₀=x₁, x₀<x₁}`, any `J`; `J = ∅` | `E ≅ J`, `#E = #J ≤` bound; `E` = closed terms, bound `ℵ₀` | True |
| `exists_emModel_card_eq` | `#J = ℵ₁`; `J` finite | `max(ℵ₀, ℵ₁, ≤ ℵ₀) = ℵ₁` and `c` injective; `#E` may be `ℵ₀ ≠ #J` | `[Infinite J]` needed, present |
| Truth lemma, `∀` step | `m = 0`, member `∀y χ` | Witness term `w` closed; element `(w, ∅)` refutes | True |
| `isSkolemTemplate_of_approximated` | coherence along `r : Fin m ↪o Fin k` | Value `d` at `m`-tuples of `H` gives `d` at `u ∘ r` for `k`-tuples `u`; needs `#H ≥ k` | `H` infinite, as stated |
| `isCofinallyApproximated_start` | `H = N` | `σ` true at the empty tuple; `disEq` true at increasing pairs | True |
| `IsCofinallyApproximated.decide` | `n = 2`, `α = 0`; infinite `pos` | `#H ≥ ℶ₂ ≥ ℶ₁⁺ → (ℵ₁)²`, 2 colours; the argument never uses finiteness | True at the Lean generality |
| `exists_iSup_witness` | `n = 0`; `n = 1` | Least true disjunct in `N_α`, then pigeonhole; `ℵ₀ ≤ ℶ_α` colours | True |
| Convention 6, `hanfNumber` | `∀x ⊥`, empty language and one constant | `0` and `0` here; `1` and `0` with empty models counted | Invariance as claimed |
| `morley_hanf` | ladder at `α`; pure infinite set | No model `≥ ℶ_ω₁`: vacuous; all infinite sizes | Consistent |
| `exists_model_card_eq_of_forall_beth` | `L` with `ℶ_ω₂` unused constants, `κ = ℵ₀` | Model of size `ℵ₀` through the reduct along `g` | No language term, as stated |
| `morley_omitting_types` | `ℶ_ω₁` constants, type `{x ≠ cᵢ}`; `p.2 = ∅` | Omitting models in sizes `1..ℶ_ω₁` only, so `hSc` is needed; hypothesis fails, vacuous | Hypothesis justified |
| `exists_sentence_maximal_model` | `α = 0`, `Set ℕ` | `#U_⊥ = ℵ₀`, `#M ≤ 2^ℵ₀ = ℶ₁`, attained | True |
| Ladder upper bound | limit level `ω` | `#U_ω ≤ ℵ₀ · ℶ_ω = ℶ_ω` | True |
| `lomega1omegaHanfNumber_eq_beth_omega_one` | `α < ω₁` | `ℶ_(α+1) <` the number; `sup ℶ_(α+1) = ℶ_ω₁`; `ℶ_ω₁` is a bound | True |
| `HighlyOrderTransitive` | `ℚ`; `ℤ`; `Fin 2`; `n = 0` | Yes; `(0,1) ↦ (0,2)` impossible; no; `e = id` | Discriminates |
| `exists_highlyOrderTransitive` | `κ = 2` | No such order | `ℵ₀ ≤ κ` needed, present |
| `IsLω₁ωSmall` | `(ℝ, <)`; ordered field `ℝ`; empty `M` | Finitely many types per arity; `2^ℵ₀` 1-types; one 0-type | Small; not; small |
| `IsCompleteSentence` | `⊥`; Scott sentence of `(ℚ, <)` | No model: not complete; complete | Agrees with Convention 7 |
| Small iff complete, relational | empty `M`, no constants | Small; its Scott sentence has only empty models and is complete | True; empty models must count |
| 5.6 forward | `σ = backTranslate θ` | `N ⊨ σ ↔ N^G ⊨ θ`; `θ` decides `relationalize ψ`, and `N^G ⊨ relationalize ψ ↔ N ⊨ ψ` | `σ` complete |
| 5.6 backward | `M` nonempty; `P ⊨ θ` | `σ` decides `∃x (x = x)`; `P` and `(reconstructed N)^G` have the same relations, `N ⊨ σ`; `χ` decided as `backTranslate χ` | `θ` complete |
| Worked example 10 | `f` = identity, infinitely many elements | Graph form: infinite sets with `G_f` equality; complete and `κ`-categorical | True |
| `exists_isCompleteSentence_isCategorical_of_countable` | pure set at `ℵ₁`; DLO at `ℵ₁` | `σ` = “infinitely many elements”; `hcat` false, vacuous | True |
| Convention 5 | `κ = ℶ_ω₁` | `μ < ℶ_ω₁` gives `α < ω₁` with `μ ≤ ℶ_α`, and conversely | The two forms agree |
| Convention 9 | `ℶ_ω₁ → (ω)^{<ω}_2` | Least such cardinal is `κ(ω)`, inaccessible, above `ℶ_ω₁` | False, as stated |

## Not verifiable

- **Marker 2016 edition:** only the publisher's excerpt of Chapter 1 is readable. The locators of R04 are from the 2013 author notes.
- **Kanamori, *The Higher Infinite*:** paywalled; the inaccessibility of `κ(ω)` in Convention 9 is cited by its locator only.
- **Ehrenfeucht–Mostowski 1956, Hanf 1964, Morley 1965, Keisler 1971, López-Escobar 1966:** not read; no sampled statement rests on them alone.
- **External formalization:** the claims of the Provenance section about `cameronfreer/infinitary-logic` were not checked.
- **Proofs:** no headline was proved; the probes rule out specific errors only.

## Source issues

- **Misprint** in marker at Exercise 5.3, 2013 notes, printed p. 54: the source reuses the fixed parameter `α` as the bound index of the limit clause; it should use a fresh index below `β`; affects nothing.
- **Misprint** in marker at the proof of Theorem 5.2, 2013 notes, printed p. 58: the source ends the second displayed tuple of the last claim with index `j_n`; it should be `j_m`; affects nothing.
- **Misprint** in marker at the proof of Theorem 5.11, 2013 notes, printed p. 59: the source prints the words about extending to an automorphism twice; it should print them once; affects nothing.
- **Error** in marker at Theorem 5.11, 2013 notes, printed p. 59: the source promises a small model of every cardinality; it should restrict to infinite cardinals; affects a stated result.
- **Error** in marker at Exercise 5.12, 2013 notes, printed p. 59: the source asks for such an order of every cardinality, and none exists of finite size at least 2; it should restrict to infinite cardinals; affects a stated result.
- **Error** in marker at Corollary 5.13, 2013 notes, printed p. 59: the source places no restriction on `κ`; it should require `κ` infinite; affects a stated result.
- **Gap** in marker at Exercise 2.34, 2013 notes, printed p. 22: the source assumes the structure countable, while Corollary 5.13 applies it to an uncountable small model; it should allow any structure in a countable vocabulary; affects the proof.
