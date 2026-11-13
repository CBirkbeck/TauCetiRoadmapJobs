# Review of CountableStructureSpaces (pull request #1316 at 65a7a7e)

**Verdict:** needs changes

`README.md` and `Suggested.lean` are in `TauCetiRoadmap/CountableStructureSpaces/`; Tau Ceti and Mathlib paths are at the pins (Mathlib `1b1ccf4b0`, Tau Ceti `2fd255d99`). All findings are P3.

## R01 (P3) — Padding: two one-line corollaries, two computed values, an unused definition

**Location:** `Suggested.lean:227` `internalScottRank_le_succ_scottHeight`; `:235–238` `orbitRank_le_scottHeight` (proved in place); `:491` `scottHeight_fin_pureSet`, `:497` `scottHeight_nat_pureSet`; `:460` `descTree`.

**Claim:** These declarations belong in the acceptance test.

**Witness:** In a scratch copy, `(internalScottRank_le_succ_selfStabilizationOrdinal).trans (Order.succ_le_succ (selfStabilizationOrdinal_le_scottHeight M))` closes the first. Line 238 closes the second the same way. `descTree` occurs only at line 460.

**Repair:** Delete the five declarations, and at `Suggested.lean:35–37` write "One target is proved in place: `isomorphismInvariant_modelsOf`, which CountableModelCounting consumes by name." In the README, turn the names into prose:
- 555–556: "Still to build: `stabilizesCompletely_iff_univ` and `selfStabilizationOrdinal_le_scottHeight`."
- 579–581: "SR(M) ≤ SH(M) + 1 for countable `M` (from `selfStabilizationOrdinal_le_scottHeight` and Tau Ceti's `internalScottRank_le_succ_selfStabilizationOrdinal`), and `scottHeight_le_internalScottRank_add_omega0` (every `M`)".
- 582–584: "every tuple of a countable `M` has orbit rank at most SH(M), by Tau Ceti's `orbitRank_le_selfStabilizationOrdinal` and `selfStabilizationOrdinal_le_scottHeight`".
- 889–891: drop the two backticked names and keep the arguments.
- 841, 846, 868, 870, 872: write "the descending-sequence tree of `c`" in place of `descTree lt c` or `descTree`.

Carried in part from the previous review's R03.

## R02 (P3) — Three statements carry countability that their routes do not use

**Location:** `Suggested.lean:96` `analyticSet_iUnion_smul`, `:464` `analytic_type_bounded`, `:472` `not_analyticSet_wellOrderClass`, each with `[∀ n, Countable (L.Relations n)]`. `README.md:365`: "for countable relation symbols, the saturation `⋃ σ, σ • A` of an analytic set is analytic".

**Claim:** These statements need countably many relation symbols. Convention 1 carries that hypothesis "only where a statement needs them".

**Witness:** Their routes use only Tau Ceti's `AnalyticSet.prod` (`Polish/Analytic.lean:96`, no Polish hypothesis), `AnalyticSet.image_of_continuous`, `analytic_treeHeight_bounded` (any space; descending-tree node sets clopen for every `L`) and `exists_mem_wellOrderClass_type_eq`. All three elaborate without the binder.

**Repair:**
- Delete the binder from the three declarations.
- README 365: "For every language, the saturation `⋃ σ, σ • A` of an analytic set is analytic".
- README 845 and 847: add "for every relational `L`".
- Keep the binder on `analyticSet_compl_wellOrderClass`, `not_measurableSet_wellOrderClass` and `not_exists_modelsOf_eq_wellOrderClass`, whose routes need Polishness. With uncountably many atoms, the complement of `wellOrderClass lt` contains a closed copy of `2^ℵ₁`, so it is not analytic.

## R03 (P3) — No locators in §§1.1, 4.2–4.4, 6.2 or Layer 3

**Location:** `README.md:312–332` (1.1), `454–491` (Layer 3), `545–640` (4.2–4.4) and `829–859` (6.2). None of these cites a theorem or page, or marks a statement as this roadmap's own.

**Claim:** Every theorem has a locator or is marked as this roadmap's own.

**Witness:** Vaught 1974, p. 282, states that ω! with the product topology is a Polish group acting continuously on the coding space. Marker's notes, Theorem 11.19, p. 144 (`marker2016` lines 4779–4780), is the Borel-isomorphism criterion of 4.3–4.4.

**Repair:** Attach these at the claims:

| Claim | Locator |
| --- | --- |
| 1.1: S∞ is Polish and acts continuously | Vaught 1974, p. 282 |
| 4.2 | "The external Scott height and its comparisons are this roadmap's own. The internal sr(M) and SR(M) are Marker's notes, Lemma 2.17 and Definition 2.18, pp. 17–18." |
| 4.3–4.4: isomorphism on `Mod(φ)` is Borel iff ranks are bounded | Marker's notes, Theorem 11.19 (relativised form), p. 144, for a countable vocabulary and the internal rank. Say that its proof bounds an analytic set of well-orders rather than forced trees, and that its step "≅ is ∼α" fails for the internal rank (see Source issues), which is why the external height is used here |
| Layer 3 boundedness and tree representation; 6.2: `wellOrderClass` coanalytic and bounded | Marker's notes, Theorem 9.27(vi), p. 117, the paragraph after it (trees of Σ¹₁ sets), and Corollary 9.42(ii), p. 121. These are lightface; the boldface forms are their relativisations |
| Kleene–Brouwer order | Kechris 1995, §2, by chapter, recorded as uncertified |

Carried in part from the previous review's R06.

## R04 (P3) — Checks: none for `body`, two for the PC sentence, one in the wrong language

**Location:** `README.md:498–504` has no Check of `body`. `794–799` has two PC-sentence Checks. `647–651`: "in the language of one unary predicate `P`: … a disagreeing nullary relation symbol already separates the empty tuples".

**Claim:** Every definition has three discriminating Checks, each in the stated language.

**Witness:** `body {[]} = ∅` because `initialSegment x 1 ∉ {[]}`, whereas a body tested only at `n = 0` would be `univ`. The language of one unary predicate has no nullary symbol.

**Repair:**
- Layer 3, `body`, one bullet per test:
  - `body ⊥ = ∅`;
  - `body {[]} = ∅`, where a definition testing only `n = 0` gives `univ`;
  - the tree of constant-zero sequences has body `{fun _ => 0}`.
- Split the `treeHeight` and `KBLT` bullets the same way, one test per bullet.
- Layer 5, add: "For `T` the full tree on `Bool × ℕ`, every code `c` with `standardWitness (fun _ => 0)` is a model, so the projective class of `pcSentence T` is all of `RelationalConfiguration L ℕ`."
- Layer 4: move the nullary Check under its own language: "In a language with one nullary relation symbol `Q`, two codes disagreeing on `Q` have `bfTree = ⊥`."

Carried in part from the previous review's R07.

## R05 (P3) — Six declarations of `Suggested.lean` that the README never names

**Location:** `Suggested.lean:258` `prefixTree`, `:265` `bfLeft`, `:270` `bfRight`, `:328` `PCWitnessRel`, `:341` `standardWitnessRel`, `:454` `analyticSet_compl_wellOrderClass`.

**Claim:** Every Lean name appears in the README.

**Witness:** None of the six names occurs in `README.md`. Line 835 states the last only in prose: "and that the complement of `wellOrderClass lt` is analytic".

**Repair:**
- 835: "`isomorphismInvariant_wellOrderClass`, and `analyticSet_compl_wellOrderClass`: the complement of `wellOrderClass lt` is analytic, so …".
- 613: "`bfTree c d : tree ℕ`, the `prefixTree` of the condition that the tuples `bfLeft s` and `bfRight s` have the same atomic type: step `2 i` …".
- 672: "the relational vocabulary whose relation symbols `PCWitnessRel` are a unary `zero`, …".
- 692: "`standardWitness g` (relations `standardWitnessRel g`: zero `{0}`, successor `n ↦ n + 1`, branch `g`)".

## R06 (P3) — The two-class form of uniform separation has no conclusion

**Location:** `README.md:623–624`: "Its form for two analytic classes `B`, `C` with no element of `B` isomorphic to an element of `C`."

**Claim:** The sentence states a target.

**Witness:** It names hypotheses but no conclusion, and no declaration or other passage supplies one.

**Repair:** "For analytic classes `B`, `C` with no element of `B` isomorphic to an element of `C`, some `β < ω₁` makes no `b ∈ B` and `c ∈ C` back-and-forth equivalent at `β` (the pair form applied to `B ×ˢ C`, which is analytic by `AnalyticSet.prod`)."

## R07 (P3) — The description treats merged siblings as open

**Location:** The description: "Dependencies: #1316 on #1315 and #1317; … Each builds on `main` by itself." and "Suggested review order: #1315 and #1317 first, then #1316".

**Claim:** The suppliers are open pull requests that should be reviewed first.

**Witness:** InfinitaryModelExistence, BorelEquivalenceRelations and CountableModelCounting are on main (`7342e8f`). None of #1315, #1317 and #1318 is among the open roadmap pull requests.

**Repair:** "Its suppliers InfinitaryModelExistence and BorelEquivalenceRelations, and its consumer CountableModelCounting, are on main; of the series only HanfNumbers is still open." Drop the review-order sentence.

## Previous findings

- R01 — repaired: `README.md:170` `MeasureTheory.MeasurableSet.eq_preimage_restrict_countable`; 172 `symbSublang`, `symbSublangIncl`, `countable_relations_symbSublang`; 176 `LHom.reductConfiguration` with its three lemmas; step 0 at 718–728; §5.4 at 769–770.
- R02 — repaired: `README.md:122–123`, "With uncountably many atoms (for instance uncountably many relation symbols on the carrier `ℕ`)".
- R03 — partly repaired. Ten of the twelve proved lemmas are gone, and `isomorphismInvariant_modelsOf` stays for a stated consumer (`Suggested.lean:35–37`). `orbitRank_le_scottHeight` (238), the pure-set values (491, 497) and `descTree` (460) remain (R01 here).
- R04 — repaired: `Suggested.lean:322–324`, "it is not restated here". There is no stand-in and no revision hash.
- R05 — repaired: none of the four names occurs, and 736–739 states the sum-of-reducts fact in prose.
- R06 — partly repaired: locators at 112–113, 536–539, 664–665, 701–703, 712–716, 774–776 and 822–823. §§1.1, 4.2–4.4, 6.2 and Layer 3 have none (R03 here).
- R07 — partly repaired: Checks at 297–304, 498–504, 647–653, 794–799 and 866–872. `body` has none and the PC sentence has two (R04 here).
- R08 — repaired: every layer has a `**Summary.**`, the four house sections, `*Needs:*` lines, `### Examples` and `### Dependencies`. `Suggested.lean:21` reads "target signatures".
- R09 — repaired: the description says 38 `sorry` warnings (elaboration gives 38) and "when the language has countably many relation symbols". Its series paragraph is now stale (R07 here).

## Verified sound

c₀ is the all-empty code for unary `P_r`, `r ∈ ℝ`. P{S} is the code of a unary `P` equal to `S` on `ℕ`.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conv. 3 / §1.2 action | P{0}; σ = (0 1 2); τ = (0 1) | σ•c = P{1}, inverse convention P{2}; (σ*τ)•c = P{2}, τ•(σ•c) = P{0}; pin: `c.eval (a.map σ.symm)` | pass | — |
| §1.1 permutation topology | `Fin 3`; ℕ with s = {0} | fixing `univ` gives {1}: discrete; (0 1) ∉ fix{0}; σ fixes s ⇒ σ⁻¹ fixes s | pass | R03 (locator) |
| `mem_stabilizer_iff` | σ = (0 1); P{0,1}; P{0} | σ•c = c, both sides T; σ•c = P{1}, at `![0]`: P(1) F vs P(0) T, both sides F | pass | — |
| `analyticSet_iUnion_smul` | `P_r`, A = {c₀} | saturation {c₀}, analytic as a constant image; route: Perm ℕ Polish, `AnalyticSet.prod`, no countability | holds without binder | R02 |
| §4.1 orbits Borel | P = 2ℕ vs P = 3ℕ | both (ℵ₀, ℵ₀): one orbit, the model class of a Scott sentence (Marker Cor 3.4, p. 30) | pass | — |
| §4.2 pure-set criterion | sizes m, m′; d entries | BF_k ⇔ r = r′ or both ≥ k; r = k, r′ = k+1: BF_k T, BF_{k+1} F | pass | — |
| §4.2 comparisons | pure `Fin 0`, `Fin 2`, ℕ | s = 0, SR = 1 (`internalScottRank_empty`), SH = 1, 3, ω; SR ≤ SH + 1; SH ≤ s + ω; 1 + ω = ω | pass | R01 |
| `stabilizesCompletely_iff_univ` | N = `Fin 2` vs `ULift (Fin 2)` | `Language.Equiv.bfEquiv` transports BFEquiv; same truth value | pass | — |
| §4.3 bounded height | unary P, φ = ⊤, β = ω | every code (p, q), p + q = ℵ₀, has SH = ω; ≅ = `bfEquivSetoid ω` on Mod ⊤ | pass | R03 (locator) |
| §4.3 internal strata | unary P, β = 0 | every code has s = 0; the set is `univ` | pass | — |
| §4.4 `bfTree` | P{0} vs ∅; P{0} vs P{1} | nodes {[]}, height 1; branch 1,1,0,0,2,2,… from (0 1) | pass | R04 (header) |
| `lt_treeHeight_bfTree` | P{0} vs ∅ | BF₀ T, BF₁ F; height 1: 0 < 1 and not 1 < 1 | pass | — |
| `exists_uniform_bfSeparation` | A = {(P{0}, ∅)}; two-class form | β = 1 separates; the two-class sentence has no conclusion | pass | R06 |
| Borel ≅ iff one level | unary P, φ = ⊤ | left T; right T with β = ω | pass | — |
| `analytic_treeHeight_bounded` | X = ℕ → ℕ, T x = decreasing sequences below x 0 | clopen node sets; heights x 0 + 1; β = ω + 1 | pass | — |
| `treeHeight` | ⊥, {[]}, decreasing tree | 0, 1, ω + 1; without succ: 0, 0, ω | pass | — |
| `KBLT`, `wellFounded_kbLT_iff` | [0,1]/[0]; [0,5]/[1]; [1]/[0,5]; {[]} ∪ {[n]} | T, T, F; KB type ω + 1, body ∅: T ↔ T | pass | — |
| `queryCode` | `Language.empty`; any atom a | constantly `false`; `decode (encode a) = some a` gives `c.eval a` | pass | — |
| §5.1 easy direction | φ = ∃x P x | Mod φ = ⋃ₙ {P(n)}, open and invariant (Marker Lemma 3.1, Cor 3.3) | pass | — |
| §5.2 `exists_pcSentence` | T = ⊥; T full; ℕ ⊔ ℤ | ⊥: clause 3 empty at n = 0; full: every code a model; ℕ ⊔ ℤ fails only `∀ x, ⋁ νₖ(x)` | pass | R04 |
| §5.3 `lopez_escobar` | empty language; `P_r`, B = {P₀ ≠ ∅}; B = {c₀} | Mod ⊥, Mod ⊤; I = atoms of P₀, φ₀ = ∃x P₀x; {c₀} not product-measurable | pass | — |
| `lopezEscobar_iff`, action form | B = {P ≠ ∅}; B = {P(0)} | fixed, Mod(∃x P x): T ↔ T; (0 1) sends B to {P(1)}: F ↔ F | pass | — |
| invariant σ-algebra form | the same two B | T ↔ T; F ↔ F (`measurableSet_iInf`, `measurableSet_invariants`) | pass | — |
| `analyticSet_iff_exists_pc` | `P_r`, {c₀}; unary P, exactly one P | {c₀} invariant analytic, no PC class (binder needed); "exactly one P": T ↔ T | pass | — |
| §6.1 separation | A = {P{0}}, B = {P = ∅} | saturation of A (one P-element) misses B; it is an invariant Borel C | pass | — |
| §6.2 `wellOrderClass` | (ℕ,<); (ℤ,<); (ℕ,≤) | in, type ω, tree height ω + 1; out, branch; out, branch 0,0,… | pass | R01, R03 |
| `analytic_type_bounded`, not analytic | `P_r` and `lt`, A = {(ℕ,<) with P_r = ∅} | β = ω + 1; node sets clopen for every `L`; no countability used | holds without binder | R02 |
| `analyticSet_compl_wellOrderClass` | `P_r` and `lt` | complement contains a closed `2^ℵ₁`, not analytic: binder needed | pass | — |
| Marker p. 33, used for 4.3–4.4 | (ℕ, P) with one vs two P-elements | sr = 0; ∼₁ holds; not isomorphic | source error | R03 |

- **Gate**, rerun at `65a7a7e`: every check is 0 and the result is `OK`; the worker's run adds `build=0`. Nothing changes outside the folder.
- **Dependency check:** `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0 with 38 warnings, all `declaration uses sorry`. Each elaborated type (from `signatures.md` and `#check`) matches its README statement, and no section binder is dropped.
- **Padding probe:** `first | rfl | (simp; done) | infer_instance | (aesop; done)` closed none of the 38. One-term probes closed `internalScottRank_le_succ_scottHeight` and `not_measurableSet_wellOrderClass`; the second is a headline and stays. The graph example needs more than one `simpa`. `isomorphismInvariant_modelsOf` stays, since CountableModelCounting consumes it by name.
- **Library names:** a scratch copy `#check`s 112 cited names, and all resolve at the pins. Ten are in modules `Suggested.lean` does not import, confirmed at `LanguageMap.lean:79–167`, `Polish/GDelta.lean:21`, `InvariantSeparation.lean:117`, `FreeVarSupport.lean:74`, `IndexCoding.lean:140` and `Scott/PureSet.lean:68`. Mathlib `Cylinders.lean:476` is in namespace `MeasureTheory`. Neither pin has tree bodies or the Kleene–Brouwer order.
- **Sources:** 14 README locators were verified: 8 in `marker2016` (lines 956–1007, 1666–1731) and 6 in `vaught1974` (pp. 280–285, read from rendered page images). Six more passages were read for the repairs: `marker2016` lines 570–596, 1106–1117, 3872–3880, 4001, 4776–4780 and Vaught p. 282.
- **Cross-roadmap:** `pcSeparation` in InfinitaryModelExistence (main `Suggested.lean:723`; open revision, line 142) equals README 207–216. BorelEquivalenceRelations has §§0.2, 0.3 and 2.2 (main README 211, 220, 401). CountableModelCounting's open revision cites this head's names in S1–S7. InfinitaryModelExistence main README 784–786 separates its undefinability theorem from `not_exists_modelsOf_eq_wellOrderClass`.
- Overlap check: read CountableModelCounting, InfinitaryModelExistence, BorelEquivalenceRelations, InfinitaryLogic, HanfNumbers, RandomGraphs. `PCMem` and `pcSeparation` are owned by InfinitaryModelExistence, and the four Polish-space lemmas by BorelEquivalenceRelations. This roadmap owns the coding space, López–Escobar, the external height, and `exists_sentence_separating` and `exists_uniform_bfSeparation`, which CountableModelCounting cites. Well-ordering undefinability for all structures is InfinitaryModelExistence's, distinct from the coded form here. The Rado class is a worked example here and a target of RandomGraphs; there is no conflict.

## Not verifiable

- Kechris 1995, Gao 2009, Keisler 1971 and Marker 2016 (the book) are paywalled and have no legal open copy, so they were not read; the README cites them by chapter or as whole works.
- López-Escobar 1965 is cited at no claim and was not fetched.

## Source issues

- **Error** in marker2016 at §3.2, p. 33, and the proof of Theorem 11.19, p. 144: the source says a model of Scott rank α is isomorphic to every model ∼α-equivalent to it, but (ℕ, P) with one P-element (rank 0) is ∼₁ to (ℕ, P) with two; it should be ∼ at level α + ω; affects the proof.
- **Misprint** in marker2016 at Corollary 4.23 (proof), p. 50: the source says τ1 ∩ τ2 = τ, though the expanded vocabularies were named τ0 and τ1; it should be τ0 ∩ τ1 = τ; affects nothing.
- **Misprint** in vaught1974 at §2, p. 280, before Theorem 2.5': the source says G and X are Polish for the rest of § 3; it should be § 2, since §3 (p. 282) allows non-Polish spaces when I ∪ J is uncountable; affects nothing.
