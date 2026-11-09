# Review of HanfNumbers (pull request #1319 at c716a69)
**Verdict:** needs changes

Full review of `TauCetiRoadmap/HanfNumbers/README.md` and `TauCetiRoadmap/HanfNumbers/Suggested.lean`. The folder changed by 293 lines since `d590c4e`. The gate still fails on four style counters. One API claim lacks a hypothesis (R01, P2), and the remaining findings are P3. The native-import migration repairs the previous build, import and supplier-name findings: every Tau Ceti declaration the README cites exists at the pin.

## R01 (P2) — A subsequence keeps the template only when the sequence is indiscernible

**Location:** `TauCetiRoadmap/HanfNumbers/README.md:357`–`358`: “a subsequence along `K ↪o J` with `K` infinite has the same template on `Δ`”.

**Claim:** For every sequence `a : J → M` and order embedding `e : K ↪o J` with `K` infinite, `templateOf (a ∘ e)` and `templateOf a` agree on `Δ`.

**Witness:** `J = K = ℕ`, `e = succ`, unary `P` with `M ⊨ P(a n)` iff `n ≥ 1`, `Δ = {⟨1, P(x₀)⟩}`. `P(x₀) ∉ templateOf a` (false at index 0), but `P(x₀) ∈ templateOf (a ∘ succ)`.

**Repair:** Add the hypothesis: “if `a` is indiscernible on `Δ`, a subsequence along `K ↪o J` with `K` infinite has the same template on `Δ`”. In the witness, `a` is not indiscernible on `Δ` (`P` holds at 1 and fails at 0), so the corrected clause no longer applies. For an indiscernible `a`, each `ψ ∈ Δ` has one truth value on all increasing tuples of `J`. Since `K` is infinite, it has increasing tuples of every arity, so membership agrees.

## R02 (P3) — Gate: delete the option override, and give the docstring the required form

**Location:** `TauCetiRoadmap/HanfNumbers/Suggested.lean:31` `set_option autoImplicit false`; `:9` “…: suggested signatures”; `:23` “There are no stand-ins.”; `:371` and `:441` (no docstring).

**Claim:** The file follows the Lean form.

**Witness:** Gate `set_option=1`. A scratch copy without line 31 elaborates with exit 0 and only the expected `sorry` warnings. The docstring does not name the headline theorems that are not statable, or what each lacks.

**Repair:** Delete line 31. Title the docstring “Ehrenfeucht–Mostowski models and Hanf numbers for Lω₁ω: target signatures”. Say that it states the roadmap's headline theorems against the pinned APIs. Name what is not statable and why: the Skolem tower and the term model `EM(J, Φ)` are heavy constructions, so `realize_em_iff`, `isSkolemTemplate_templateOf`, `isEMSource_em`, `exists_total_of_cofinallyApproximated` and `isSkolemTemplate_of_approximated` are README targets only. Delete the stand-in sentence and give every retained declaration a docstring.

## R03 (P3) — Gate: display TeX

**Location:** `TauCetiRoadmap/HanfNumbers/README.md:485`–`487` and `:526`–`528` (gate `tex=2`); the same `math` fences at `:11`–`13` and `:290`–`292`.

**Claim:** Mathematics is written in Unicode.

**Witness:** Line 486: `|\mathrm{EM}(J,\Phi)|\le\max\bigl(\aleph_0,\ |J|,\ |\textstyle\sum_n L'_{\mathrm{fun},n}|\bigr)`.

**Repair:** Use code spans:
- `#EM(J, Φ) ≤ max(ℵ₀, #J, #(Σ n, L'.Functions n))`;
- the same bound with `E` in place of `EM(J, Φ)`;
- `Hanf(Lω₁ω) = ℶ_ω₁`;
- `ℶₙ(κ)⁺ → (κ⁺)ⁿ⁺¹_κ`.

## R04 (P3) — Gate: process words, pull-request numbers and pin hashes

**Location:** `README.md:961`, `:983`, `:1064` (“checkpoint”). `:33`, `:133`, `:900`, `:904`, `:946` (`#1315`–`#1318`). `:130`, `:131`, `:943` (Tau Ceti `#17407`, `#17576`, `#17885`, `#18194`, `#17547`). `:130`, `:131`, `:135` (“this repository's pin (2fd255d99)”). `:189` (“has no stand-ins”).

**Claim:** The README is timeless, and it cites roadmaps by name and section.

**Witness:** Gate `residue=3`. InfinitaryModelExistence, BorelEquivalenceRelations and CountableModelCounting are now on main, so their pull-request numbers are stale.

**Repair:**
- Replace “checkpoint” with “commit”.
- Drop every roadmap and Tau Ceti pull-request number. Cite roadmaps by name and section, and Tau Ceti by declaration and file under `TauCeti/ModelTheory/`.
- Replace “at this repository's pin (2fd255d99)” with “in Tau Ceti”.
- Delete the sentence at line 189.
- Mathlib pull-request citations (`#42758`, `#42189`, `#43488`, `#40782`) may stay.

## R05 (P3) — Gate: README names that `Suggested.lean` does not declare

**Location:** `README.md:517`, `:563`, `:564`, `:661`, `:707`, `:828` (this roadmap's names); `:995`, `:1011`, `:1020` (names in the external formalization).

**Claim:** Each backticked own name is declared in `Suggested.lean`.

**Witness:** Gate `readme-ids-missing=9`:
- `isEMSource_em`
- `hanfNumber_le_of_isHanfBound`
- `hanfNumber_le_iff_isHanfBound`
- `hasArbLargeModels_of_forall_beth`
- `lomega1omegaHanfNumber_le_iff`
- `isCompleteSentence_scottSentence`
- `morleySeed_indiscernibleOn`
- `hasArbLargeModels_of_seed_realizability`
- `Lomega1omegaHanfNumber_eq_beth_omega1`

**Repair:** State the six facts at `:517`–`:828` in prose, without a name. Do not add declarations. For the three provenance names, point to the external file in prose, for example “`Methods/EM/FragmentAdapter.lean` (the seed and its indiscernibility)”, with no backticked declaration name.

## R06 (P3) — Padding in `Suggested.lean`

**Location:** `TauCetiRoadmap/HanfNumbers/Suggested.lean`:
- `:441` `isLω₁ωSmall_of_countable`
- `:371` `hanfNumber_le_beth_omega_one`
- `:142` `IsIndiscernibleOn.comp`
- `:167` `isIndiscernibleOn_iff_realizesOn_templateOf`
- `:89` `iteratedTwoPow_beth`
- `:182` `isIndiscernibleOn_morleySeed`
- `:68` `partitionRel_iff_finset`
- `:78` `PartitionRel.mono`
- `:332` `hanfNumber_isHanfBound`

**Claim:** These are acceptance-test headlines.

**Witness:** In a scratch copy, the first five close in one step each (proofs under Verified sound); the iff needs no `[Infinite J]`. `isIndiscernibleOn_morleySeed` is the Layer 1 acceptance check and worked example 2. The last three are definitional API.

**Repair:** Delete these nine theorems. The README keeps each one as a target or Check. This is the previous review's request, carried unchanged.

## R07 (P3) — No locator at any sampled target, and no sources manifest

**Location:** `README.md` subsections:
- `:228` (0.1), `:253` (0.2), `:266` (0.3), `:286` (0.4)
- `:345` (1.2), `:361` (1.3)
- `:417` (2.2), `:450` (2.3), `:498` (2.4)
- `:559` (3.1), `:588` (3.3), `:621` (3.4)
- `:744` (4.3), `:767` (5.1), `:845` (5.5)

The references are at `:1034`–`1065`.

**Claim:** Every theorem has a locator.

**Witness:** No layer subsection gives a theorem, page or section; only Convention 5 cites Keisler–Knight §1.6. Marker is cited by chapter of the 2016 edition. The board package has no `sources.toml`.

**Repair:** Put locators at the claims, naming the version read. The numbers below are from the 2013 Marker notes on the author's page; check them against the 2016 edition or cite the notes.
- **0.1:** Erdős–Rado 1956, relation (1), p. 429 (`erdos-rado` line 110–118); Marker 2013 §5.1, p. 55 (`marker` line 1831–1836).
- **0.2:** Marker 2013, proof of Thm 5.5, p. 56 (`marker` line 1850–1851); pigeonhole over cofinally many `α`, p. 58 (line 1927).
- **0.3:** Erdős–Rado Thm 39(i), proof on pp. 469–470 (`erdos-rado` line 1533–1582).
- **0.4:** Marker 2013 Thm 5.5, p. 55, and Cor 5.6, p. 56 (`marker` line 1847, 1882); Erdős–Rado Thm 4(i), p. 429 (line 179), for `n = 1`.
- **3.1:** Keisler–Knight §1.6 and Thm 1.6.1, preprint p. 9 (`keisler-knight` line 416–427); Marker 2013 p. 54 and Ex. 5.1 (`marker` line 1786–1793).
- **3.3:** Marker 2013, proof of Thm 5.2, pp. 57–58 (`marker` line 1906–1941).
- **3.4:** Marker 2013 Thm 5.2, p. 54 (line 1803), and Cor 5.8, p. 58 (line 1945).
- **4.3:** Marker 2013 Ex. 5.3, p. 54 (line 1806–1815); Keisler–Knight Thm 1.6.2, preprint p. 10 (line 436).
- **5.1:** Marker 2013, proof of Thm 5.11 and Ex. 5.12, p. 59 (line 1965–1976).
- **5.5:** Marker 2013 Cor 5.13, p. 59 (line 1977), and Ex. 2.34, p. 22 (line 718).
- **1.2, 1.3, 2.2–2.4:** say that these interfaces are the roadmap's own, with Marker 2013 Ex. 5.7, p. 57 (line 1889) as background.

Record every cited work in `sources.toml`.

## R08 (P3) — Checks, `*Needs:*` lines, layer endings and house headings

**Location:** `README.md` throughout. For example, 0.1 at `:228`–`251` defines `PartitionRel` with no Checks. `:46` is “Scope and dependency order” and `:119` is “Existing library and ownership”. 2.2 at `:440` uses `IsEMSource`, which is defined in 2.4.

**Claim:** Every definition has three discriminating Checks, and every target its dependencies.

**Witness:** The README has 0 `**Checks.**` blocks, 0 `*Needs:*` lines and no `### Examples` or `### Dependencies` subsections. It also has no `**Summary.**`, `## Scope and ownership`, `## Exact supplier contracts`, `## How to read the build` or `## Downstream consumers`.

**Repair:** Add three Checks per definition, using values verified below. For example:
- `PartitionRel`: `0 → (0)¹_0` holds here; `(3,2,1,2)` holds; `(2,2,1,2)` fails.
- `HighlyOrderTransitive`: true for `ℚ`; `ℤ` is 1-transitive but not 2-transitive; false for `Fin 2`.
- `hanfNumber`: `∀x ⊥` over the empty language has Hanf number `0`.
- `IsLω₁ωSmall`: `(ℝ, <)` is small; `(ℝ, <, +, ·, 0, 1)` is not.

Also:
- Give each target a `*Needs:*` line.
- End each layer with `### Examples` and `### Dependencies`.
- Rename the sections to the house shape.
- Define `IsEMSource` before 2.2.

## R09 (P3) — Layers 5.4–5.5 are narrower than their source

**Location:** `README.md:813`–`814`: “For the rest of this layer `L` is relational with countably many relation symbols, as the parent's Scott sentences require.” Also `:847`, `:912`–`915`, and `Suggested.lean:483` and `:492`.

**Claim:** The relational restriction is forced.

**Witness:** Marker 2013 Cor 5.13, p. 59 (`marker` line 1977), and Ex. 2.34, p. 22 (line 718), are stated for countable vocabularies. InfinitaryModelExistence Layer 6 on main owns `relationalize`, `realize_relationalize`, `backTranslate`, `graphAxioms` and reconstruction.

**Repair:** Add the countable-language forms of `isLω₁ωSmall_iff_exists_isCompleteSentence` and `exists_isCompleteSentence_isCategorical` as a 5.6 target that consumes IME Layer 6. Over the graph expansion:
- `relationalize` and `backTranslate` identify complete Lω₁ω-types, so smallness transfers;
- models of `graphAxioms F ∧ relationalize σ` are the graph expansions of models of `σ`, so completeness and categoricity transfer.

No Karp-theory transfer is needed. Test case: `φ` = “`f` is the identity and there are infinitely many elements”, over `{f}`. It is excluded now, and its graph form is the pure-set example.

## R10 (P3) — Use Mathlib's vocabulary for completeness and categoricity, and a current name for `ℶ` at successors

**Location:** `README.md:104`–`106` (Convention 7); `Suggested.lean:471`–`479`; `README.md:125` (`Cardinal.beth_succ`).

**Claim:** The notions follow Mathlib's.

**Witness:** Mathlib's `Theory.IsComplete` (`Mathlib/ModelTheory/Satisfiability.lean:386`) requires satisfiability. Under `IsCompleteSentence`, the unsatisfiable `⊥` is complete. `Cardinal.Categorical` is at `:505`. `Cardinal.beth_succ` is deprecated at the pin in favour of `Cardinal.beth_add_one`.

**Repair:** In Convention 7, name `Theory.IsComplete` and `Cardinal.Categorical` and say how the sentence-level Lω₁ω notions differ. Either add `∃ M : Type w, M ⊨ σ` to `IsCompleteSentence`, or add the Check “`⊥` is complete here”. Adding it changes no headline: both theorems already supply a model of `σ`. Cite `Cardinal.beth_add_one`.

## R11 (P3) — Infinite Ramsey already has an owner on main; “future” is a deferral

**Location:** `README.md:895`–`899`: “**The rest of the partition calculus**, as a future combinatorics roadmap: Ramsey's theorem and the infinite Ramsey theorem `ω → (ω)ⁿ_k`, …”. Also `:225`–`226`.

**Claim:** Infinite Ramsey has no owner.

**Witness:** BanachSpaceTheory §B4.1 on main (`TauCetiRoadmap/BanachSpaceTheory/README.md:627`) constructs infinite Ramsey for finite colourings of `[ℕ]^k`.

**Repair:** Cite BanachSpaceTheory §B4.1 for the infinite Ramsey theorem. List the other partition-calculus items as outside this roadmap and unused by it, without “future”.

## R12 (P3) — `Φ disEq` is undefined for a Skolem template over a general `Γ`

**Location:** `README.md:489`–`492`: “If `Φ disEq`, the skeleton is injective”; `:518`: “the skeleton is injective when `Φ disEq`”.

**Claim:** A Skolem template evaluates `disEq`.

**Witness:** In 2.2, `Φ` is a predicate on instances of members of `Γ`, and `Γ` need only contain `x₀ = x₁`. The Layer 2 acceptance `Γ = {x₀ = x₁, x₀ < x₁}` does not contain `disEq`.

**Repair:** Write “if `Φ` declares the instance `x₀ = x₁` false”, as `:532`–`533` already does. In the acceptance example `a` is injective, so `Φ(x₀ = x₁)` is false and the skeleton is injective. Lines `:632` and `:809` concern `Γ*`, which is closed under negation, and can stay.

## Previous findings

- **R01** (build gate) — repaired. The worker's gate reports `build=0`. Elaborating the file exits 0 with exactly 32 `sorry` warnings and nothing else.
- **R02** (prototype import and three stand-ins) — repaired. The gate reports `imports=0`. The module imports `TauCeti.ModelTheory.Infinitary.Fragment`, `…Infinitary.LanguageMap` and `…ModelExistence.Types`. `LHom.onBoundedFormulaInf`, `infinitaryType`, `realizedTypes` and `Fragment` are Tau Ceti's, with signatures checked below.
- **R03** (Scott-sentence suppliers) — repaired. The five cited names exist at Tau Ceti 2fd255d (`Scott/Sentence.lean:99`, `:108`, `:115`; `BackAndForth/AllLevels.lean:91`; `BackAndForth/Karp.lean:287`), with the parent contracts at `Sentence.lean:49`, `:81`, `:89`, `Presentation.lean:207` and `Karp.lean:328`. README `:828`–`835` follows them.
- **R04** (`set_option`) — not repaired; now R02.
- **R05** (padding) — not repaired; now R06.
- **R06** (locators, `sources.toml`) — not repaired; now R07.
- **R07** (Checks, Needs, layer endings) — not repaired; now R08.
- **R08** (TeX, process words, pin sentence) — partly repaired. The docstring pin sentence is gone. TeX, “checkpoint” and pull-request numbers remain, and pin hashes now appear in the README. Now R03 and R04.
- **R09** (own names) — partly repaired: 10 names down to 9. `onBoundedFormulaInf_substBounds` is now Tau Ceti's `LHom.onBoundedFormulaInf_substBounds`. Now R05.

## Verified sound

**Gate (rerun at this head):**

```text
gate HanfNumbers: set_option=1 blob=0 latex=0 tex=2 prnum=0 sorry-data=0 sorry-examples=0 residue=3 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=9 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
```

The worker's run at this head adds `build=0`. The diff outside the folder is empty.

**Dependency check:**

```text
depcheck: 239 roadmaps, 2323 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. HanfNumbers is at merge-order line 399. Its suppliers, InfinitaryLogic (`Completed/`) and InfinitaryModelExistence, are on main.

**Elaboration and signatures.** Running `lake env lean` on `Suggested.lean` exits 0 with 32 `sorry` warnings and nothing else. A scratch file printed `#check @` for all 54 declarations, and I compared each with its README statement. No binder is lost, and the universes match the README:
- `exists_emModel` and `exists_emModel_card_eq` have `N : Type u_2` independent of `J, E : Type u_1`.
- `exists_emSource_of_forall_beth` produces `N : Type`.
- `L'` is `Language.{0,0}`.
- The approximation language has independent universes.

**Probes** (scratch copy without line 31, all elaborated):
- `isLω₁ωSmall_of_countable`: `exact fun n => (Set.countable_range (infinitaryType M)).mono fun p hp => mem_realizedTypes.1 hp`. `realizedTypes` is not exposed, so the `.mono` step is needed.
- `hanfNumber_le_beth_omega_one`: `exact csInf_le' (morley_hanf φ)`.
- `IsIndiscernibleOn.comp`: `exact fun p hp s t => h p hp (s.trans e) (t.trans e)`.
- The indiscernibility/template iff closes by one anonymous-constructor term, with `[Infinite J]` removed.
- `iteratedTwoPow_beth`: `induction n <;> simp_all [iteratedTwoPow, ← add_assoc, Cardinal.beth_add_one]`.
- `hanfNumber_isHanfBound`: six lines, by cases on `HasArbLargeModels`.
- `PartitionRel.{0} 0 0 1 0` holds, with witness `H = ∅`.
- `hanfNumber (∀x ⊥) = 0` over `Language.empty`.

**Library declarations opened at the pins** (95 names cited in the README, each resolved by `#check`):

Tau Ceti:
- `ModelTheory/Scott/Sentence.lean:49`, `:81`, `:89`, `:99`, `:108`, `:115`. Only `scottSentenceAt` lacks `[L.IsRelational]`, as README `:131` says. All need `[Countable M]` for the source structure and nothing for the model `N`.
- `BackAndForth/AllLevels.lean:91` (ordinals in `max` of the two universes; fed by `bfEquiv_of_realize_scottSentence` at any universe).
- `BackAndForth/Karp.lean:287`, `:328`; `Presentation.lean:207`; `PotentialIso.lean:44`; `Equivalence.lean:49` (`BFEquiv` needs `[L.IsRelational]`).
- `Infinitary/Fragment.lean:69`: exactly the five component-closure fields that `IsEMSource` (1) needs, and no atoms. Also `:287`, `:373`.
- `ModelExistence/Types.lean:72`, `:95`, `:152`: no language hypothesis.
- `Infinitary/LanguageMap.lean:76`, `:134`, `:157`, `:170`, `:217`, `:229`, `:255`.
- `Infinitary/SubstBounds.lean:94`, `:194`, `:271`, `:438`.
- `Infinitary/SmallPresentation.lean:72`, `:127`.
- `Sublanguage.lean:63`, `:72`; `Infinitary/Sublanguage.lean:68`, `:178`.
- `Infinitary/Symbols.lean:40`, `:51`, `:230`, `:289`, `:348`.
- `Infinitary/Theory.lean:75`, `:135`, `:148`.
- `ModelExistence/AElementary.lean:66`, `:143`.
- `ModelExistence/LowenheimSkolem.lean:251`: needs only countable function symbols.

The three items README says are not at the pin are confirmed absent: injectivity of the language-map action, the symbol sublanguage of a sentence, and the isolator seed.

Mathlib:
- `ModelTheory/Satisfiability.lean:386`, `:505`; `ModelTheory/Substructures.lean:294`.
- `RingTheory/HahnSeries/Lex.lean:52`, `:121`, `:381`; `Data/Finsupp/Lex.lean:241`.
- `ZFSet.card_vonNeumann` (`= preBeth o`) and `Cardinal.beth_eq_preBeth` (`ℶ_ o = preBeth (ω + o)`), so `#V_{ω+α+1} = ℶ_(α+1)`.
- `Cardinal.countable_toType_of_lt_omega_one`, `Subfield.cardinalMk_closure_le_max` (`≤ max #s ℵ₀`).

Neither pinned library has partition relations, Erdős–Rado, Hanf numbers, indiscernibles, highly order-transitive orders or Lω₁ω smallness (searched `ModelTheory`, `SetTheory`, `Order`, `Combinatorics`).

**Cross-roadmap citations resolved:**
- `Completed/InfinitaryLogic/README.md:688`: out of scope lists Ehrenfeucht–Mostowski stretching, partition calculus and Morley–Hanf.
- InfinitaryModelExistence on main:
  - `:131`–`146`: consumer contract; it matches README `:139`–`187` item for item;
  - `:180` (injectivity), `:215` (symbol sublanguage), `:502` (isolator seed);
  - `:597`–`651` (Layer 6);
  - `:885` (HanfNumbers owns indiscernibles, Hanf numbers, smallness and complete sentences).
- At the head of IME's open revision (#1615), headings 0.1–0.4, 1.1, 1.2, 2.2, 2.3 and 4.1 and the HanfNumbers contract are unchanged.
- `TauCetiRoadmap/CountableModelCounting/README.md:72` defers the same objects here.
- `TauCetiRoadmap/BanachSpaceTheory/README.md:627` (R11).

`overlaps.md`: no other pull request changes this roadmap and no cited id is dropped. Ownership against open pull requests was checked with `roadmaps grep` by object: only IME and CountableModelCounting mention these objects, and both defer them here. No other roadmap uses the namespace `TauCetiRoadmap.HanfNumbers`.

**Sources read** (legal copies, through the sources service):
- `marker`: Marker, *Lectures on Infinitary Model Theory*, 2013 notes, author page.
- `keisler-knight`: Keisler–Knight preprint, author page.
- `erdos-rado`: Erdős–Rado 1956, AMS open archive, from the cache.

**Sampled targets** (the README gives no locator for any; R07):

| Target | Source at its locator | Agreement |
| --- | --- | --- |
| 0.1 Vocabulary | `erdos-rado` line 110–118, p. 429: partitions into `k` classes, some `ν < k`, `|B| = b_ν`; `marker` line 1832–1836, p. 55 | `μ ≥ 1` agrees; `0 → (0)¹_0` true here, false there (no `ν < 0`), as README `:238`–`241` says |
| 0.2 Pigeonhole | `marker` line 1850–1851, p. 56; line 1927, p. 58 | `κ⁺ → (κ⁺)¹_κ` and the cofinal pigeonhole agree |
| 0.3 End-homogeneous sets | `erdos-rado` line 1533–1582, pp. 469–470 (the `f_κ(x)` tree, set `S₀`) | Route agrees; level count `≤ λ^λ = 2^λ`, so `λ⁺·2^λ < (2^λ)⁺` |
| 0.4 Erdős–Rado | `marker` line 1847 (Thm 5.5), line 1882 (Cor 5.6); `erdos-rado` line 179 (Thm 4(i)) | Same exponents, colour bounds and sources as `erdos_rado` and `erdos_rado_beth` |
| 1.2 Templates | Ehrenfeucht–Mostowski 1956 not readable | Checked by the table rows below |
| 1.3 Morley seed | the roadmap's own | Rows below |
| 2.2 Skolem templates | `marker` line 1889 (Ex 5.7) as background only | Laws checked against the truth-lemma route |
| 2.3 Term model | as above | Quantifier steps checked, including `m = 0` with closed witness terms |
| 2.4 Sources | as above | Acceptance example checked |
| 3.1 Hanf bounds | `keisler-knight` line 416–427, p. 9 (cofinal definition, Thm 1.6.1); `marker` line 1786–1793, p. 54 | Convention 5's equivalence at `ℶ_ω₁` agrees |
| 3.3 Approximation | `marker` line 1906–1941, pp. 57–58: Erdős–Rado at `ℶ_(α+n) ≥ ℶ⁺_(α+n−1)`, then pigeonhole | Decision and witness lemmas follow the same counts |
| 3.4 Theorem | `marker` line 1803 (Thm 5.2), line 1945 (Cor 5.8) | Same hypothesis; this roadmap's omitting-types theorem is the any-language, countable-types form |
| 4.3 Sharpness | `marker` line 1806–1815 (Ex 5.3, clauses i–v); `keisler-knight` line 436 (Thm 1.6.2) | Ladder clauses agree; the limit clause's `←` follows from monotonicity |
| 5.1 HOT orders | `marker` line 1965–1976 (Thm 5.11 proof, Ex 5.12) | Same definition; the infinite-`κ` restriction is needed (source issue) |
| 5.5 Completions | `marker` line 1977 (Cor 5.13), line 718 (Ex 2.34) | Statement agrees; the relational restriction is narrower (R09) |

**Adversarial pass:**

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| `PartitionRel`, zero colours | (0,0,1,0); (0,0,0,0) | Here: `H = ∅` homogeneous (proved); `Fin 0 ↪o J` inhabited, no `D`-colouring, so vacuous. Erdős–Rado: false; vacuous | Matches `:238`–`243` |
| `PartitionRel`, `μ ≥ 1` | (3,2,1,2); (2,2,1,2) | Fibre of size ≥ 2: true in both; identity colouring fibres 1,1: false in both | Agrees |
| `partitionRel_iff_finset` | `n = 0` | Both sides reduce to `λ ≤ κ` when `D` is nonempty | Agrees |
| `erdos_rado` | `κ = ℵ₀`, `n = 0, 1, 2` | `ℵ₁→(ℵ₁)¹_{ℵ₀}`; `iteratedTwoPow ℵ₀ 1 = ℶ₁`, `ℶ₁⁺→(ℵ₁)²`; `ℶ₂⁺→(ℵ₁)³` | Matches worked example 1 |
| `iteratedTwoPow_beth` | `α = 0`, `n = 2`; all | `2^(2^ℵ₀) = ℶ₂ = ℶ_(0+2)`; proved in general | True |
| `exists_isEndHomogeneousOn` | `λ = ℵ₀`, `n = 0, 1` | Source `≥ ℶ₁⁺`; levels `≤ 2^ℵ₀`; `ℵ₁·2^ℵ₀ = 2^ℵ₀ < ℶ₁⁺`, giving a branch of length `ℵ₁` | True |
| `exists_unbounded_fiber` | `D = Bool`, `f` = limit test; `D = ω₁` with `f` injective | Both values unbounded; no value unbounded, so countability of `D` is needed | Hypothesis needed |
| Indiscernibility/template iff | `J = Fin 1` | Both sides are the same condition; proved without `Infinite` | True; `[Infinite J]` unused (R06) |
| Subsequence template | R01 witness | `P(x₀)`: not in `templateOf a`, in `templateOf (a∘succ)` | False as written (R01) |
| Coherence of template | `J = Fin 1`, `r : Fin 1 ↪o Fin 2` | `mapBound r ψ` in the template vacuously, `ψ` false at the only point | Needs `J` infinite, which `:355` supplies |
| `isIndiscernibleOn_morleySeed` | injective `a`; `a 0 = a 1 ≠ a 2` | `disEq` true at every pair; false at (0,1) and true at (0,2) | Injectivity needed; true |
| Height example (`:371`–`377`) | `Pᵢ(a n) ↔ i ≤ n` | `{P₀..P_k, ¬⋀Pᵢ}` realized at height `k`; the whole set is inconsistent | True |
| `IsEMSource` acceptance | `ℚ`, `a` = inclusion, `Γ = {x₀=x₁, x₀<x₁}`, `τ̄ = (xᵢ, xⱼ)` | `<` holds iff `i < j` and `=` iff `i = j`, at both `s` and `t` | True; `EM(J) ≅ J` |
| `IsEMSource` skolem clause | `L'` with no constants, `⟨0, ∀y ψ⟩ ∈ Γ` | `L'.Term (Empty ⊕ Fin 0)` is empty, so no source exists | Consistent: dummies and 0-ary Skolem symbols supply constants |
| `exists_emModel` | `J = ∅`, `L' = {c}`, `N = {*}`, `∀y (y = c) ∈ Γ` | `E = {c}`: the sentence holds in both; bound `#E ≤ ℵ₀` | True |
| `exists_emModel_card_eq` | `J = ℕ`; `#J = ℵ₁` | `max(ℵ₀, #J, ≤ℵ₀) = #J` and `c` injective, so `#E = #J` | True |
| Truth lemma, `∀` step, `m = 0` | `n = 0` member `∀yχ` | `w_{∀yχ}` is closed; the element `(w, ∅)` refutes | True |
| `IsCofinallyApproximated.decide` | `n = 2`, `α = 0` | `#H ≥ ℶ₂ ≥ ℶ₁⁺ → (ℶ₀⁺)²_{ℶ₀}`, 2 colours, `H'` of size `ℵ₁ ≥ ℶ₀` | True; matches `marker` line 1938 |
| `exists_iSup_witness` | `n = 0`; `n = 1` | Least true disjunct of the sentence in `N_α`; `ℕ` colours `≤ ℶ_α`, then pigeonhole | True |
| `isCofinallyApproximated_start` | `H = N` | `⟨0,σ⟩` true; `disEq` true at increasing pairs | True |
| Convention 6 / `hanfNumber` | `∀x ⊥`: empty language versus one constant | `0` and `0` here (proved); `1` and `0` with empty models counted | Invariance as claimed |
| `hanfNumber_isHanfBound` | `⊥`; pure set; ladder at `α = 0` | `0`; `0`; `(2^ℵ₀)⁺` | True |
| `exists_model_card_eq_of_forall_beth` | pure set; ladder `α`; `L` with `ℶ_ω₂` constants and `κ = ℵ₀` | All infinite `κ`; hypothesis fails at `α+2`; model of size `ℵ₀` via the reduct along `g` | True; no language term |
| `morley_hanf` | ladder `α` | No model `≥ ℶ_ω₁`, so the claim is vacuous | Consistent |
| `morley_omitting_types` | `ℶ_ω₁` constants with type `{x ≠ cᵢ}`; `p.2 = ∅` | Omitting models only in sizes `1..ℶ_ω₁`, so `hSc` is needed; the empty type cannot be omitted, so vacuous | Hypothesis justified |
| `…_of_countable` | countable `L` | `#(Σ n, BoundedFormula) ≤ ℵ₀` | True |
| `exists_sentence_maximal_model` | `α = 0`, `Set ℕ` | `cₙ = {n}`; predecessors of `y` are `{{n} : n ∈ y}` (extensional); `#Set ℕ = ℶ₁` | True |
| Ladder at a limit | `j = ω` | `#U_ω ≤ ℵ₀·sup ℶₙ = ℶ_ω`; `V_{ω+ω} = ⋃ V_{ω+n}` | True; "limit" must exclude `0` |
| `lomega1omegaHanfNumber_eq_beth_omega_one` | `α < ω₁` | `ℶ_(α+1) <` the Hanf number for all `α`; `sup ℶ_(α+1) = ℶ_ω₁`; `ℶ_ω₁` is a bound | True; Keisler–Knight Thm 1.6.2 |
| `HighlyOrderTransitive` | `ℚ`; `ℤ`; `Fin 2` | Yes; 1- but not 2-transitive (adjacent pair); no | Discriminates |
| `of_field` | `ℚ`, `(0,1,2) ↦ (0,1,10)` | Identity up to 1, slope 9 above | True |
| `exists_highlyOrderTransitive` | `κ = 2` | No such order | Infinite `κ` needed, as stated |
| `IsLω₁ωSmall` | pure set of size `ℵ₁`; `(ℝ,<)`; `(ℝ,<,+,·,0,1)` | Finitely many equality types; DLO back-and-forth with `ℚ`; `2^ℵ₀` 1-types (cuts) | Small; small; not small |
| `isLω₁ωSmall_iff_…` | empty `M`; `(ℝ,<)` | Empty `M` is small and satisfies its Scott sentence; `(ℝ,<) ⊨ scott(ℚ,<)`, which is complete | True |
| `IsCompleteSentence` | `⊥` | Complete here; not under Mathlib's `IsComplete` | R10 |
| `exists_isCompleteSentence_isCategorical` | pure set at `ℵ₁`; DLO at `ℵ₀` and `ℵ₁` | `scott(ℕ)`; `scott(ℚ)`; at `ℵ₁` `hcat` is false, so vacuous | True; worked example 6 |
| Convention 5 | `ℶ_ω₁` | `μ < ℶ_ω₁` gives `α < ω₁` with `μ ≤ ℶ_α`, and conversely | The two forms agree |

## Not verifiable

- **Marker 2016 edition:** the numbering of the cited edition was not read. Locators above are from the 2013 author notes.
- **Kanamori, *The Higher Infinite*:** paywalled. Convention 9's claim that `κ(ω)` is inaccessible is uncertified.
- **Ehrenfeucht–Mostowski 1956 and Hanf 1964** (*Fundamenta Mathematicae*): the service found only publisher landing pages in no licence class. Keisler 1971, Morley 1965 and López-Escobar 1966 were not obtained.
- **External formalization:** the claims about `cameronfreer/infinitary-logic` (no `sorry`, dependency cone) were not checked.
- **Gate build counter:** my gate rerun printed no `build` counter. The worker's `build=0` and my direct elaboration are the evidence.
- **Proofs:** no headline theorem was proved; the probes rule out specific errors only.

## Source issues

- **Misprint** in marker at Exercise 5.3, 2013 notes, printed p. 54: the source writes the limit clause with the fixed parameter `α` reused as the bound index; it should use a fresh index, e.g. `⋁_{γ<β} U_γ`; affects nothing.
- **Misprint** in marker at the proof of Theorem 5.11, 2013 notes, printed p. 59: the source prints the phrase about extending to an automorphism twice; it should print it once; affects nothing.
- **Error** in marker at Theorem 5.11, 2013 notes, printed p. 59: the source promises a small model of every cardinality; it should restrict to infinite cardinals; affects a stated result.
- **Error** in marker at Exercise 5.12, 2013 notes, printed p. 59: the source asks for `n`-transitive orders of every cardinality; for finite size at least 2 none exists; it should restrict to infinite cardinals; affects a stated result.
- **Error** in marker at Corollary 5.13, 2013 notes, printed p. 59: the source places no restriction on `κ`; for finite `κ` the sentence may have no model of that size; it should require infinite `κ`; affects a stated result.
- **Gap** in marker at Exercise 2.34, 2013 notes, printed p. 22: the source assumes the structure is countable, while Corollary 5.13 applies it to an uncountable small model; it should allow any structure in a countable vocabulary; affects the proof.
