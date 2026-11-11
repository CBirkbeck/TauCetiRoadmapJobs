# Review of BorelEquivalenceRelations (pull request #1616 at 81fe877)

**Verdict:** needs changes

## R01 (P3) — Pull-request numbers in the README

**Location:** `README.md:795` "[CountableStructureSpaces](../CountableStructureSpaces/README.md) ([#1316](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1316))"; `README.md:807` "([#1316](…/pull/1316)) consumes four general results".

**Claim:** Roadmaps are cited by name and section, never by pull-request number. This is unchanged since the previous review's R02.

**Witness:** `grep -n 'pull/1316' README.md` returns lines 795 and 807.

**Repair:** Delete " ([#1316](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1316))" in both places, keeping "[CountableStructureSpaces](../CountableStructureSpaces/README.md)".

## R02 (P3) — Coordination describes CountableModelCounting as its open revision has it, not as main has it

**Location:** `README.md:816–818`: "CountableModelCounting states its targets with Tau Ceti's `Setoid.HasPerfectAntichainOn`, `Setoid.HasCantorAntichainOn` and `Setoid.IsThinOn`, which have the bodies of Convention 6".

**Claim:** This is false of CountableModelCounting on main, which is the version this README must cite. It is true only at the head of that roadmap's open revision (#2012). This is unchanged since the previous review's R04.

**Witness:** On main, `TauCetiRoadmap/CountableModelCounting/Suggested.lean` imports only `Mathlib` and `Completed.InfinitaryLogic.Suggested`, and defines `IsThinOnNatModels` at line 479. Its README line 183 says the vocabulary "is written out inline instead".

**Repair:** Replace the sentence with: "CountableModelCounting consumes the objects listed in 4.3; Tau Ceti's `Setoid.hasCantorAntichainOn_iff` and its companions unfold them to the bodies of Convention 6."

## R03 (P3) — No target carries a locator

**Location:** `README.md:602–606` (the perfect set theorem for analytic sets), `663–667` (`isSmooth_of_isClosed`), `734–741` (the Vitali relation); the References at `864–893` name only works.

**Claim:** Every theorem needs a theorem-and-page locator, and none of these open targets has one. None of the fifteen sampled targets has a locator to check. This is unchanged since the previous review's R05.

**Witness:** `grep -nE 'Theorem [0-9]|Lemma [0-9]|Proposition [0-9]|p\. ?[0-9]|§ ?[0-9]' README.md` matches only Lean code.

**Repair:** For each of the three open targets, add in parentheses at the claim the theorem number and page in a work the References list. Record those works in the package's `sources.toml`.

## R04 (P3) — README headings, `*Needs:*` lines and module docstring

**Location:** `README.md:3` (no `**Summary.**`), `54` "## Scope and dependency order", `129` "## Existing library and ownership", `602–606` and `663–667` (no `*Needs:*`); `Suggested.lean:32` "…: suggested signatures".

**Claim:** The required form has:
- `**Summary.**`, `## Scope and ownership`, `## Exact supplier contracts` and `## How to read the build`;
- a `*Needs:*` line for each target;
- `### Examples` and `### Dependencies` closing each layer;
- a docstring titled "…: target signatures".

The previous review's R06 was only partly repaired: both theorems now have docstrings.

**Witness:** `grep -c` counts 0 for `*Needs:*`, `^### Examples` and `^### Dependencies`. `grep -n '^#' README.md` lists the headings quoted above.

**Repair:**
- Rename line 54 to `## Scope and ownership` and line 129 to `## Exact supplier contracts`.
- Open the README with `**Summary.**`.
- Turn each "**Acceptance check.**" into `### Examples`, and add a `### Dependencies` after it giving that layer's row of the table at 58–65.
- After line 606, add: "*Needs:* Mathlib `MeasureTheory.analyticSet_iff_exists_polishSpace_range`, `isClosed_diagonal`; Tau Ceti `Setoid.silver_dichotomy`, `Setoid.HasCantorAntichainOn.exists_injective`."
- After line 667, add: "*Needs:* Mathlib `IsClosed.analyticSet`, `MeasurableSet.analyticSet`, `TopologicalSpace.exists_countable_basis`; Tau Ceti `Setoid.exists_invariant_measurableSet_separating`, `Setoid.isSmooth_iff_countablySeparated`."
- Retitle `Suggested.lean:32` to "…: target signatures".

All nine names were elaborated at the pins.

## R05 (P3) — Two proved `example`s are padding

**Location:** `Suggested.lean:62–73`: `example : PolishSpace (ℕ → Bool) ∧ PerfectSpace (ℕ → Bool) ∧ PerfectSpace (ℕ → ℕ) := ⟨inferInstance, inferInstance, inferInstance⟩`, and the Alexandrov `example` at 71–73.

**Claim:** A proved `example` stays only when it tests something nontrivial about a definition the file keeps. This file keeps no definition. The first example tests instance search; the second restates one Tau Ceti lemma. This is unchanged since the previous review's R07.

**Witness:** The bodies are three `inferInstance`s and the single name `TauCeti.isGδ_of_isCompletelyMetrizableSpace`.

**Repair:** Delete `Suggested.lean:62–73`. At `README.md:215`, change "`haveI := hs` (the `example` in `Suggested.lean`)" to "`haveI := hs`". The README keeps both facts at 240–243 and 265–270.

## R06 (P3) — Imported Tau Ceti modules that no declaration uses

**Location:** `Suggested.lean:2–29`, which has 28 `import TauCeti.…` lines; `Suggested.lean:49–50`: "This file imports the modules the README's *From Tau Ceti* table names, consumes them and does not restate them".

**Claim:** After `import Mathlib`, the file may import only the Tau Ceti modules it actually uses. The two theorems use only `Setoid.IsSmooth`. Once R05 is applied, 27 of the 28 imports are unused; with the examples kept, 24 are.

**Witness:** I made a scratch copy with only `import Mathlib` and `import TauCeti.SetTheory.Descriptive.BorelReducibility`, with lines 62–73 deleted. It elaborates with the two `declaration uses sorry` warnings and nothing else.

**Repair:** Keep only those two import lines. Replace "This file imports … names each declaration." at 49–50 with "The README names each consumed Tau Ceti declaration and its module."

## R07 (P3) — Adapter rows that bridge to forms no layer states, and a process sentence

**Location:**
- `README.md:206`: "`PiNat.prependWord` | `w ++ₛ x` over any alphabet, not a case split on `n < w.length`".
- Rows 207, 212 and 213: the curried coloring, the curried homomorphism, and "`φ` only measurable".
- Lines 228–229: "whether the roadmap moves to the completed roadmaps is a separate decision for the maintainers".

**Claim:** Each of these rows compares Tau Ceti with a form that no layer states: a case-split `prependWord`, an uncurried coloring, an uncurried homomorphism property, a continuous `φ`. The rows describe the deleted prototype. Lines 228–229 are process narrative.

**Witness:** "n < w.length" occurs only at line 206. Convention 7 (120–121) and Layer 3 (528–530, 546–547) already state the curried, measurable-`φ` forms that Tau Ceti has.

**Repair:** Delete rows 206, 207, 212 and 213, and lines 228–229. The remaining rows (208–211, 214–216) bridge to forms the layers do state.

## R08 (P3) — The title and description describe an earlier head

**Location:**
- Title: "keep T₁ in the uncountability of comeagre sets".
- Description: "`Suggested.lean` already states `Set.Countable.isMeagre` with `[T1Space X]`".
- Description: "Alexandrov's converse is stated as in Mathlib #42912: `TopologicalSpace.IsCompletelyMetrizableSpace.isGδ`".

**Claim:** The head states neither result. The change rewrites the README (554 insertions, 886 deletions) and deletes 78 Lean declarations, keeping two theorems. The title conveys none of this.

**Witness:**
- `Suggested.lean` declares only lines 81 and 94.
- `Set.Countable.isMeagre` is Tau Ceti's, at `TauCeti/Topology/Baire/Perfect.lean:52`.
- Alexandrov's converse appears only as the `example` at 71–73, which applies `TauCeti.isGδ_of_isCompletelyMetrizableSpace`.

**Repair:**
- Title: "BorelEquivalenceRelations: consume Tau Ceti's descriptive set theory; the analytic perfect set theorem and smoothness of closed relations remain".
- First paragraph: "Layer 0.1 keeps `T₁` in the uncountability of comeagre sets (`TauCeti.not_countable_of_mem_residual`)."
- Replace the Alexandrov bullet with the description's own later wording: consumed from `TauCeti.isGδ_of_isCompletelyMetrizableSpace`, with `T6Space` supplying its hypotheses.

## Previous findings (review of 68c5f0b)

- **R01 (P2), restatement of Tau Ceti — repaired.** `Suggested.lean` keeps two theorems (lines 81 and 94) and no definitions. The "Suggested homes" block is gone. README 217–226 lists only the open targets.
- **R02, pull-request numbers — not repaired.** This is R01 above.
- **R03, undeclared names — repaired.** `eq_continuum_of_hasCantorAntichainOn`, `value_mem`, `value_eq_of_mem` and `CantorScheme.exists_antichain_map` no longer occur. README 327 and 329 cite the pinned names.
- **R04, CountableModelCounting sentence — not repaired.** This is R02 above.
- **R05, locators — not repaired.** This is R03 above.
- **R06, shape — partly repaired.** Both theorems now have docstrings. The headings, Summary and `*Needs:*` lines are still missing: R04 above.
- **R07, examples — not repaired.** This is R05 above.
- **R08, description — partly repaired.** The quoted sentence now reads "…are now deleted in favour of Tau Ceti's". The title and first paragraph are still stale: R08 above.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| 0.1 `TauCeti.not_countable_of_mem_residual` (README 244–246) | ℝ with `s = ℝ∖ℚ`; indiscrete `{a, b}`; `∅`; discrete ℕ | uncountable; indiscrete space is perfect and Baire, and `univ` is comeagre and countable; ∅: `univ` countable; ℕ not perfect | T₁, perfectness and nonemptiness are each needed; the README keeps all three |
| 0.1 Mathlib-only instances (README 184–185, 240–243) | `inferInstance` under `import Mathlib` | fails for `PolishSpace (ℕ → Bool)` and `PerfectSpace (ℕ → Bool)`; succeeds for `PolishSpace (ℕ → ℕ)`, `StandardBorelSpace (ℕ → Bool)`, `BorelSpace (ℕ → Bool)` | matches the README |
| 0.2 `TauCeti.isGδ_of_isCompletelyMetrizableSpace` | ℝ∖ℚ ⊆ ℝ; ℚ ⊆ ℝ; `{ω₁} ⊆ ω₁+1` | ℝ∖ℚ is Gδ; ℚ is not completely metrizable and not Gδ; `{ω₁}` is completely metrizable but not Gδ, in a normal space that is not perfectly normal | perfect normality needed; the `T6` form is correct |
| 0.3 `AnalyticSet.preimage_image_quotientMk`; Borel graph theorem | `s = ∅`; `E = ⊤`, `s ≠ ∅`; `E = ⊥`; `f = 1_ℚ` on ℝ | saturations ∅, `univ`, `s`, all analytic; graph `ℚ×{1} ∪ ℚᶜ×{0}` is Borel and `f` is measurable | both directions hold |
| 0.4 `Perfect.mk_eq_continuum`, `TauCeti.mk_le_continuum_of_countablySeparated` | Cantor set in ℝ; `{0}`; a type of size `2^𝔠` with every set measurable | 𝔠 = 𝔠; `{0}` is not perfect; a countable family separates at most 𝔠 points, so not countably separated | hypotheses needed; true |
| 0.5 `Setoid.hasCantorAntichainOn_iff_hasPerfectAntichainOn` | `A = ∅`; `E = ⊤`; uncountable discrete `X` with `⊥` | false ↔ false; false ↔ false (a singleton is not perfect); false ↔ false (finite images, no perfect sets) | agree; rules out the wrong model "any uncountable set" |
| 0.5 `.mono_relation` (`E ≤ F`, `F`-antichain gives `E`-antichain) | `⊥ ≤ E₀` with `x ↦ x ∘ (unpair ·).1`; the reverse direction with `id` | E₀-antichain, hence injective, hence a ⊥-antichain; `id` is not an E₀-antichain (`x` and `x` flipped at 0) | direction as in README 313–315 |
| 1.1 `TauCeti.curry_le_residual`, `BaireMeasurableSet.mem_curry_iff_mem_residual` | `(ℝ∖ℚ)×ℝ`; `ℚ×ℝ` | comeagre, with sections ℝ over ℝ∖ℚ; for `ℚ×ℝ` the comeagre sections lie over ℚ only, not comeagrely many, and `ℚ×ℝ` is not comeagre | both directions consistent |
| 1.2 `TauCeti.mycielski` | `k ≡ 1`, `R n = ℚ ⊆ ℝ`; `k ≡ 0`; `X` a point | Cantor copy among the irrationals; `Fin 0 → X` is a point whose only meagre set is ∅; a point is not perfect, so excluded | hypotheses equal README 379–383 |
| 1.4 Miller's lemma; `TauCeti.canonicalWord` (GSGraph.lean:234) | `S = {[]}` with `A` the cylinder of `[false]`; canonical words with `A = univ`; `n = 0`; `r = [true]`, `k = 1` | no edge inside `A` (edges flip bit 0), so density is needed; an edge exists; `[]`; `pair (encode [true]) 1 ≥ 1`, so `r` is a prefix | true |
| 2.2 KST `SetRel.exists_measurableSet_isIndependent_superset`; invariant separation | `G = ⊤` (loops); `G = ≠` with `A = {0}`; Vitali `E` with `A = [0,1]`, `B = [2,3]` | `B = ∅`; `B = {0}`; both saturations are ℝ, so the hypothesis fails, and no invariant Borel set contains `[0,1]` and misses `[2,3]` | disjoint saturations are the right hypothesis |
| 2.3 `SetRel.IsSmallFamily` (SmallFamily/Basic.lean:90), seed | `ι = ∅`, `Φ = univ`; `ι = Fin 1` with `G` the E₀-inequivalence; `Φ = ∅` | not small (no index), so `[Nonempty ι]` is needed; not small (no countable coloring); small | consistent with README 496–502 |
| 4.1 category route | E₀; `⊥` on ℝ; `⊤` on ℝ | yields a Cantor antichain; yields a continuous injection; countable quotient, route not entered | consistent with `Setoid.silver_dichotomy` |
| 4.2 `Setoid.silver_dichotomy` (headline, Tau Ceti) | `X = ∅`; `⊥` on ℝ; E₀; `⊤` on ℝ | countable / antichain: T/F; F/T; F/T; T/F | true; cited, not restated |
| 4.2 `Setoid.mk_quotient_le_aleph0_or_eq_continuum`; relative form | `⊥` on `Fin 2`; Vitali on ℝ; relative form with `A = ∅`; `R = ⊥`, `F = ⊤` | 2 ≤ ℵ₀; 𝔠 classes (not smooth, so uncountable); empty subtype has a countable quotient; `F` has one class | true; the hypothesis direction `R → F` is the needed one |
| Layer 3 `SimpleGraph.g0_dichotomy` (headline, Tau Ceti) | `G = ⊥`; `G = gZero`; `G = gSGraph {[]}` | coloring / homomorphism: T/F; F/T (identity); T/F | `Xor` holds in each case |
| 4.2 analytic perfect set theorem (`Suggested.lean:81`, open) | `A = ℚ`; `A = ℝ∖ℚ`; worked example 8; the route's relation `g a = g b` | countable, so the hypothesis fails; a Cantor set of irrationals; a Cantor copy; closed because `isClosed_diagonal` needs `T2Space` | true; `exact?` and `simp` fail; Mathlib has only the closed case and Tau Ceti only the Borel case |
| 5.2 `isSmooth_of_isClosed` (`Suggested.lean:94`, open) | `X = ∅`; `x 0 = y 0` on `ℕ → Bool`; `\|x\| = \|y\|` on ℝ; E₀; Vitali | trivial; reduce by `const (x 0)`; reduce by `\|·\|` then a Borel embedding into Cantor space; E₀ and Vitali are dense, not closed, not smooth | true; `exact?` and `simp` fail |
| route of 5.2 | `U ×ˢ V` disjoint from `E` | a point of `[U] ∩ [V]` would give `u E z E v`; Tau Ceti's separator takes `U` and `V` directly (disjoint images) | every input exists at the pins |
| 5.2 `Setoid.isSmooth_iff_countablySeparated` | `⊥` on ℝ; `⊤`; E₀ | smooth / countably separated: T/T; T/T; F/F | true for any measurable space, as at the pin |
| 5.3 `Setoid.borelReducible_bot_iff_not_countable_quotient`, `Setoid.borelReducibility_trichotomy` | `X = ∅`; `⊥` on ℕ; E₀; `⊥` on `Fin 3` | F ↔ F; F ↔ F; T ↔ T; bireducible with `⊥` on `Fin 3` | true |
| 5.4 `TauCeti.eZero`, generic ergodicity | `x = y`; one difference; differences at every even place; `B` = {infinitely many `true`s}; `B` = cylinder of `[false]` | related; related; unrelated; invariant and comeagre; not invariant (hypothesis fails) | true |
| worked example 3 | `f = \|·\|`; `f` constant | 𝔠 classes with uncountable image; one class with a one-point image | "exactly when uncountable" uses the analytic perfect set theorem, as README 224 says |
| README 816–818 (R02) | CountableModelCounting on main | imports Mathlib and `Completed.InfinitaryLogic.Suggested`; no `Setoid.HasCantorAntichainOn`; README 183 says "written out inline" | false on main |
| README 206–213 (R07) | grep for a case split, an uncurried coloring, a continuous `φ` | only lines 206, 207, 212, 213; Convention 7 and Layer 3 state the curried, measurable forms | the rows bridge to nothing |
| `Suggested.lean` imports (R06) | trimmed copy | `Mathlib` plus `…Descriptive.BorelReducibility`, examples deleted: two `sorry` warnings, nothing else | 27 imports unused |

- **Gate and dependency check.** The gate, rerun at 81fe877, reports every counter 0 and `OK`. Depcheck reports `depcheck: 207 roadmaps, 1914 edges, 0 problem(s)`, with no UPWARD or CYCLE line. The roadmap is on main and names no supplier roadmap. The diff outside the folder is empty.
- **Elaboration.** `lake env lean` on `Suggested.lean` gives two `declaration uses sorry` warnings and nothing else. The elaborated types of both theorems equal README 602–606 and 663–664 (no binder lost).
- **Names at the pins.** All 224 backticked README identifiers were run through `#check @` at Mathlib 1b1ccf4b and Tau Ceti 2fd255d9. All resolve; two are written relative to `CantorScheme`. I printed 58 signatures and compared each with the README prose, hypotheses included.
- **Definitions opened.** `Setoid.IsSmooth` and `Setoid.BorelReducible` (`BorelReducibility.lean:229,100`), `TauCeti.eZero` (`EZero.lean:81`), `SetRel.IsSmallFamily` (`SmallFamily/Basic.lean:90`), `TauCeti.orientedGS`, `gSGraph`, `DenseWords`, `SparseWords` (`GSGraph.lean:80,130,198,202`), `Set.Countable.isMeagre` (`Baire/Perfect.lean:52`).
- **The open targets are open.** I searched both pins by object:
  - no theorem concludes `IsSmooth` from a closed graph;
  - the only Cantor-injection theorems are the closed case (`Mathlib/Topology/MetricSpace/Perfect.lean:136`) and the Borel case (`TauCeti/MeasureTheory/Constructions/Polish/Perfect.lean:51`);
  - Tau Ceti has no Vitali relation;
  - Mathlib lacks every item README 184–189 says it lacks.
- **Ownership.** `roadmaps grep` over main and the 419 indexed heads finds no other plan for either open target or their names. Overlaps: none. The pull request removes no heading. CountableStructureSpaces and CountableModelCounting (main and its open revision) cite objects this head keeps.
- **Sources.** The README has no locators. The fifteen sampled targets (0.1–0.5, 1.1, 1.2, 1.4, 2.2, 2.3, 4.1, 4.2, 5.2–5.4) were checked against the pinned declarations and the instances above.

## Not verifiable

- **Source texts.** None was read. Through the sources service, using a scratch manifest:
  - Kechris–Solecki–Todorcevic 1999 resolves only to a paywalled page;
  - Mycielski 1964 and Kuratowski–Ulam 1932 land on IMPAN pages on a host with no licence class;
  - Miller 2012 lands on a Cambridge page on a host with no licence class.

  Kechris 1995, Gao 2009, Silver 1980 and Miller's lecture notes were not requested, since the README gives no locator to check.
- **External formalization.** The revision `518a366` and the claims of the Provenance table about it were not opened.
- **Integration build.** The description's build that imports this file beside the files of other pull requests cannot be reproduced from this worktree.

## Source issues

- none
