# Review of CountableStructureSpaces (pull request #1316 at 3e1ae1f)

**Verdict:** needs changes

`README.md` and `Suggested.lean` are in `TauCetiRoadmap/CountableStructureSpaces/`. Tau Ceti and Mathlib paths are at the pins (Mathlib `1b1ccf4b0`, Tau Ceti `2fd255d99`). All findings are P3. R01, R02 and R04 are new; the others are carried from the previous review.

## R01 (P3) — Graph events are not a library result at the pin

**Location:** `README.md:431–435`: "This is Tau Ceti's `measurableSet_modelsOf` … pulled back along the measurable graph coding … whose decoded structure is `G.structure`; it is the library's result, not a separate target here."

**Claim:** The pin proves that graph events are measurable, so no target is needed.

**Witness:** No pinned declaration states the event or the identity `G.toRelationalConfiguration.toStructure = G.structure`. The coding's body (Tau Ceti `Combinatorics/SimpleGraph/RelationalConfiguration.lean:205–206`) is not exposed: in a module copy, `simp` and `rfl` fail on the identity.

**Repair:**
- 431–435: "**graph events**: the decoded structure of `G.toRelationalConfiguration` is `G.structure` (the coding is `ofStructure` of `G.structure`, so this is `toStructure_ofStructure`). Hence satisfaction of every Lω₁ω sentence is a measurable event on `SimpleGraph ℕ`, the preimage of `modelsOf φ` (`measurableSet_modelsOf`) under `measurable_toRelationalConfiguration`."
- 405: "Still to build: locality, the Gδ model classes and the graph events."
- Add `measurable_toRelationalConfiguration` to the Tau Ceti row at 176. Add it, with `SimpleGraph.toRelationalConfiguration` and `toStructure_ofStructure`, to the *Needs:* line at 444–448.

Tested: a non-module scratch file proves the identity with `simp [SimpleGraph.toRelationalConfiguration]`, and the event as that preimage.

## R02 (P3) — Layer 4's new supplier is missing from its dependencies

**Location:** `README.md:648` adds "BorelEquivalenceRelations `AnalyticSet.prod`" to the 4.4 *Needs:* line. Line 667 still reads "Layers 1–3. InfinitaryLogic Layers 1–3, implemented in Tau Ceti."

**Claim:** Layer 4's dependencies are stated.

**Witness:** Scope row 4 (line 48) lists the inputs "1–3; InfinitaryLogic Layers 1–3". Lines 52–53 say that the BorelEquivalenceRelations lemmas are used in "(Layers 1, 2 and 6)".

**Repair:**
- 48: inputs "1–3; InfinitaryLogic Layers 1–3; BorelEquivalenceRelations (products of analytic sets)".
- 53: "(Layers 1, 2, 4 and 6)".
- 667: "Layers 1–3. InfinitaryLogic Layers 1–3, implemented in Tau Ceti; `AnalyticSet.prod` of BorelEquivalenceRelations, implemented in Tau Ceti."

## R03 (P3) — Padding: two one-line corollaries, two computed values, an unused definition

**Location:** `Suggested.lean:222` `internalScottRank_le_succ_scottHeight`; `:230–233` `orbitRank_le_scottHeight` (proved in place); `:496` `scottHeight_fin_pureSet`, `:502` `scottHeight_nat_pureSet`; `:465` `descTree`.

**Claim:** These declarations belong in the acceptance test.

**Witness:** In a scratch copy at this head, `(internalScottRank_le_succ_selfStabilizationOrdinal).trans (Order.succ_le_succ (selfStabilizationOrdinal_le_scottHeight M))` closes the first. Line 233 closes the second the same way. `descTree` occurs only at line 465.

**Repair:** Delete the five declarations and the empty `## Worked examples` section comment. At `Suggested.lean:35–37` write: "One target is proved in place: `isomorphismInvariant_modelsOf`, which CountableModelCounting consumes by name." In the README:
- 561–562: "Still to build: `stabilizesCompletely_iff_univ` and `selfStabilizationOrdinal_le_scottHeight`."
- 585–590: "SR(M) ≤ SH(M) + 1 for countable `M` (from `selfStabilizationOrdinal_le_scottHeight` and Tau Ceti's `internalScottRank_le_succ_selfStabilizationOrdinal`) … every tuple of a countable `M` has orbit rank at most SH(M), by Tau Ceti's `orbitRank_le_selfStabilizationOrdinal` and `selfStabilizationOrdinal_le_scottHeight`."
- 899–901: drop the two backticked names and keep the arguments.
- 851–856 and 878–882: write "the descending-sequence tree of `c`" in place of `descTree lt c` and `descTree`.

## R04 (P3) — The two-class separation is a one-term corollary

**Location:** `Suggested.lean:303–311`, `exists_uniform_bfSeparation_prod`, whose docstring says: "`exists_uniform_bfSeparation` applied to `B ×ˢ C`".

**Claim:** The two-class form belongs in the acceptance test.

**Witness:** In a scratch copy, `let ⟨β, hβ, h⟩ := exists_uniform_bfSeparation (hB.prod hC) fun p hp => hBC _ hp.1 _ hp.2; ⟨β, hβ, fun c hc d hd => h (c, d) ⟨hc, hd⟩⟩` closes it. CountableModelCounting (main README 217) consumes only the pair form.

**Repair:** Delete the declaration. At README 630, write "- The form for two classes: if `B` and `C` are analytic and …", keeping the rest of the bullet without the backticked name.

## R05 (P3) — No locators in §§1.1, 4.2–4.4, 6.2 or Layer 3

**Location:** `README.md:312–332` (1.1), `460–497` (Layer 3), `551–651` (4.2–4.4, including the new bullet at 630–634) and `839–870` (6.2). None of these cites a theorem or page, or marks a statement as this roadmap's own.

**Claim:** Every theorem has a locator or is marked as this roadmap's own.

**Witness:** Vaught 1974, p. 282, states that S∞ is a Polish group acting continuously. `marker2016` lines 4776–4780 (Theorem 11.19, p. 144) give the Borel-isomorphism criterion of 4.3–4.4. Lines 3999–4002 (Corollary 9.42, p. 121) give the bounding used in 6.2.

**Repair:** Attach these at the claims:

| Claim | Locator |
| --- | --- |
| 1.1: S∞ is Polish and acts continuously | Vaught 1974, p. 282 |
| 4.2 | "The external Scott height and its comparisons are this roadmap's own. The internal sr(M) and SR(M) are Marker's notes, Lemma 2.17 and Definition 2.18, pp. 17–18." |
| 4.3–4.4, including the two-class form | Marker's notes, Theorem 11.19 (relativised), p. 144, for a countable vocabulary and the internal rank. Add that its proof bounds an analytic set of well-orders, and that its step "≅ is ∼α" fails for the internal rank (Source issues) |
| Layer 3; 6.2 coanalytic and bounded | Marker's notes, Theorem 9.27(vi), p. 117, the paragraph after it, and Corollary 9.42(ii), p. 121. These are lightface; the boldface forms are their relativisations |
| Kleene–Brouwer order | Kechris 1995, §2, by chapter, recorded as uncertified |

## R06 (P3) — Checks: none for `body`, two for the PC sentence, one in the wrong language

**Location:** `README.md:503–510` has no Check of `body`. `804–809` has two PC-sentence Checks. `659–661`: "in the language of one unary predicate `P`: … a disagreeing nullary relation symbol already separates the empty tuples".

**Claim:** Every definition has three discriminating Checks, each in the stated language.

**Witness:** `body {[]} = ∅`, because `initialSegment x 1 ∉ {[]}`; a body tested only at `n = 0` would be `univ`. The language of one unary predicate has no nullary symbol.

**Repair:**
- After 503, add three `body` Checks, one bullet each:
  - `body ⊥ = ∅`;
  - `body {[]} = ∅`, where a definition testing only `n = 0` gives `univ`;
  - the tree of constant-zero sequences has body `{fun _ => 0}`.
- Split the `treeHeight` bullet (504–506) and the `KBLT` bullet (507–508) into one test per bullet.
- In 5.2, add: "For `T` the full tree on `Bool × ℕ`, every code with `standardWitness (fun _ => 0)` is a model, so the projective class of `pcSentence T` is all of `RelationalConfiguration L ℕ`."
- Move 661 out of the unary list as: "In a language with one nullary relation symbol `Q`, two codes disagreeing on `Q` have `bfTree = ⊥`."

## R07 (P3) — Six declarations of `Suggested.lean` that the README never names

**Location:** `Suggested.lean:253` `prefixTree`, `:260` `bfLeft`, `:265` `bfRight`, `:333` `PCWitnessRel`, `:346` `standardWitnessRel`, `:459` `analyticSet_compl_wellOrderClass`.

**Claim:** Every Lean name appears in the README.

**Witness:** None of the six names occurs in `README.md`. Lines 845–846 state the last only in prose: "and that the complement of `wellOrderClass lt` is analytic".

**Repair:**
- 845: "`isomorphismInvariant_wellOrderClass`, and `analyticSet_compl_wellOrderClass`: the complement of `wellOrderClass lt` is analytic, so …".
- 619: "`bfTree c d : tree ℕ`, the forced back-and-forth tree, the `prefixTree` of the condition that the tuples `bfLeft s` and `bfRight s` have the same atomic type: step `2 i` …".
- 682: "Let `W = pcWitnessLanguage` be the relational vocabulary whose relation symbols `PCWitnessRel` are a unary `zero`, …".
- 702: "`standardWitness g` (relations `standardWitnessRel g`: zero `{0}`, successor `n ↦ n + 1`, branch `g`)".

## R08 (P3) — The description treats merged siblings as open

**Location:** The description says: "Dependencies: #1316 on #1315 and #1317; … Each builds on `main` by itself." It also says: "Suggested review order: #1315 and #1317 first, then #1316".

**Claim:** The suppliers are open pull requests that should be reviewed first.

**Witness:** InfinitaryModelExistence, BorelEquivalenceRelations and CountableModelCounting are on main (`4d169a9`). The open pull requests on them (#1615, #1616, #2012) are revisions. None of #1315, #1317 and #1318 is open.

**Repair:** "Its suppliers InfinitaryModelExistence and BorelEquivalenceRelations, and its consumer CountableModelCounting, are on main; of the series only HanfNumbers is still open." Drop the review-order sentence.

## Previous findings

- R01 — not repaired: `Suggested.lean:222`, `230–233`, `496`, `502` and `465` are unchanged, and README 561–562 still lists the two corollaries as "Still to build" (R03 here).
- R02 — repaired: `Suggested.lean:97`, `469` and `477` carry no countability binder. README 366 says "for every language", and 855 and 857 say "for every relational `L`". The binder stays at 459, 482 and 488.
- R03 — not repaired: §§1.1, 4.2–4.4, 6.2 and Layer 3 still cite no theorem or page, and the new 4.4 bullet (630–634) adds none (R05 here).
- R04 — not repaired: Layer 3 Checks (503–510) still have no `body` bullet. 5.2 still has two PC-sentence Checks, and 661 still puts a nullary symbol in the unary language (R06 here).
- R05 — not repaired: `prefixTree`, `bfLeft`, `bfRight`, `PCWitnessRel`, `standardWitnessRel` and `analyticSet_compl_wellOrderClass` each occur 0 times in `README.md` (R07 here).
- R06 — repaired: README 630–634 gives the conclusion ("some `β < ω₁` makes no `c ∈ B` and `d ∈ C` back-and-forth equivalent at `β`"). The repair added a one-term Lean corollary (R04 here).
- R07 — not repaired: the description is unchanged ("Dependencies: #1316 on #1315 and #1317"; "Suggested review order: #1315 and #1317 first") (R08 here).

## Verified sound

c₀ is the all-empty code for unary `P_r`, `r ∈ ℝ`. P{S} is the code of a unary `P` equal to `S` on `ℕ`.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `analyticSet_iUnion_smul`, no binder (§1.2) | `P_r`, A = {c₀}; a language with a function symbol | saturation {c₀}, a constant image; scratch proof as image of `univ ×ˢ A` under `(σ, c) ↦ c.restrict σ⁻¹` elaborates for every `L` | pass | — |
| §1.2: isomorphism relation needs countability | `P_r` | its first projection is `univ ≅ 2^𝔠`, compact and not metrizable, so not a continuous image of `ℕ → ℕ` | pass | — |
| `exists_uniform_bfSeparation_prod` (§4.4) | B = {P{0}}, C = {P = ∅}; B = ∅; C = {P{1}} | BF₀ T, BF₁ F, so β = 1; vacuous, β = 0; (0 1) is an isomorphism, so the hypothesis fails | pass | R04 |
| `analytic_type_bounded`, no binder (§6.2) | `P_r` and `lt`, A = {(ℕ,<), P_r = ∅} | type ω, `descTree` height ω + 1, β = ω + 1; node sets read finitely many `lt` atoms, so they are clopen for every `L` | pass | — |
| `not_analyticSet_wellOrderClass`, no binder | `P_r` and `lt` | an analytic `WO` would be bounded by some β < ω₁; a code of type max(β, ω) ≥ β contradicts this | pass | — |
| `not_measurableSet_wellOrderClass`, binder kept | countable `L`; `P_r` | Borel ⇒ analytic (`MeasurableSet.analyticSet`) needs Polishness; for `P_r` that route fails | pass | — |
| graph events (§2) | φ = ∃x∃y adj(x, y) | event ⋃_{u≠v} {G.Adj u v}, measurable; in a module, `simp` and `rfl` fail on the decoded structure; a non-module `simp` closes it | true, unowned | R01 |
| `internalScottRank_le_succ_scottHeight` | pure `Fin 2` | SR = 1, SH = 3: 1 ≤ 4; one term from Tau Ceti's `internalScottRank_le_succ_selfStabilizationOrdinal` | pass | R03 |
| pure-set values | `Fin 0`, `Fin 2`, ℕ | SH = 1, 3, ω: small computed values | pass | R03 |
| `body` | {[]} | `initialSegment x 1 ∉ {[]}`, so body ∅; testing only n = 0 gives `univ` | pass | R06 |
| 4.4 nullary Check | unary P | atoms are `P(n)` only; there is no nullary symbol | Check outside its language | R06 |
| `analyticSet_compl_wellOrderClass` | `P_r` and `lt` | fixing `lt` to a non-well-order and varying `P_r` gives a closed `2^𝔠` in the complement, so it is not analytic: binder needed | pass | R07 |

Rows for the untouched statements (the López–Escobar forms, §§1.1, 4.1–4.3, Layer 3, Layer 5 and §6.1) stand as in the previous review, of `65a7a7e`.

- **Gate**, rerun at `3e1ae1f`: every check is 0 and the result is `OK`; the worker's run adds `build=0`. Nothing changes outside the folder. **Dependency check:** `depcheck: 244 roadmaps, 2197 edges, 0 problem(s)`.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0 with 38 warnings, all `declaration uses sorry`, matching the description's 38. `#check @` on the five changed declarations shows no lost binder. They match README 366, 630–633 and 855–858.
- **Scratch probes:** 4 proofs elaborate: saturation for every `L`, the two-class form in one term, `internalScottRank_le_succ_scottHeight` in one term, and graph events in a non-module file. 3 tactics fail on the graph identity inside a module.
- **Library declarations opened at the pins:** Tau Ceti `RelationalConfiguration/Isomorphism.lean:323` (relational, countable symbols and carrier), `Polish/Analytic.lean:96` (no Polish hypothesis), `RelationalConfiguration/Topology.lean:70`, `Basic.lean:304`, `Structure.lean:58`, and `SimpleGraph/RelationalConfiguration.lean:205, 250, 277`; Mathlib `Polish/Basic.lean:193`.
- **Cross-roadmap:** BorelEquivalenceRelations main README 223 and 702 have `AnalyticSet.prod` (Layer 0.3). CountableModelCounting main README 217 cites only the pair form. RandomGraphs (open) §0.3 also treats graph events as Tau Ceti's. No roadmap cites the dropped `measurableSet_setOf_realize_graph`.
- **Overlap check:** read CountableModelCounting, BorelEquivalenceRelations, InfinitaryModelExistence and RandomGraphs. The changed objects are owned here. BorelEquivalenceRelations' saturation needs an analytic relation, and InfinitaryModelExistence's `wellOrder_type_boundedness` is the model-class form, not the coded one. Graph events have no owner (R01).
- **Source independence:** changed passages only. 7 passages (README 341–345, 366–374, 431–435, 630–634, 855–858; `Suggested.lean:94–96`, `303–305`) were compared with 1 source, `marker2016` lines 1034–1041, 1084–1086, 3999–4002 and 4776–4788; no wording is shared. The largest share is `marker2016`, 8 of 14 locators. Arrangement was not compared again, since no layer was added, removed or reordered.
- **Remark** (no change asked): `not_measurableSet_wellOrderClass` also holds with uncountably many relation symbols, since `WO` depends only on the `lt` atoms (step 0 of §5.3); the stated route needs the binder.

## Not verifiable

- Kechris 1995, Gao 2009, Keisler 1971 and Marker 2016 (the book) are paywalled and have no legal open copy, so they were not read; the README cites them by chapter or as whole works.
- López-Escobar 1965 is cited at no claim and was not fetched. Vaught 1974 was not re-read, since its locators are in untouched text.

## Source issues

- **Error** in marker2016 at Theorem 11.19 (proof, ⇐), p. 144: the source says that when every model has Scott rank below α, isomorphism is ∼α, but (ℕ, P) with |P| = 2 and with |P| = 3 (SR = 1 for both) are ∼₂ and not isomorphic; it should use level α + ω; affects the proof.
- **Misprint** in marker2016 at Theorem 11.19 (proof, ⇒), p. 144: the source says the order types are "less that α"; it should be "less than α"; affects nothing.

## For the human reviewers

- README `## Provenance` (lines 1010–1029) names the author's repository `cameronfreer/infinitary-logic` as the origin of the layer files. This review did not compare `Suggested.lean` with that repository or read its licence.
