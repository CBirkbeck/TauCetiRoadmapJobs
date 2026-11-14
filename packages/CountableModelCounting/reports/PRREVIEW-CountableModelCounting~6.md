# Review of CountableModelCounting (pull request #2012 at c49f63f)

**Verdict:** needs changes

Incremental re-review of the 81 lines changed since `1c8987f` (README only). Paths are under `TauCetiRoadmap/CountableModelCounting/`; Tau Ceti paths, at the pin `2fd255d99`, are under `TauCeti/ModelTheory/`. This head repairs the previous R01 and R06 and introduces no new defect. R01–R05 below carry the previous R02, R03, R04, R05 and R07, whose passages this head does not change.

## R01 (P3) — The Layer 0 acceptance check is still in `Suggested.lean`

**Location.** `Suggested.lean:79–117`, the `UnaryPredicates` block: `hasPerfectSetOfNonisoModelsOn_fin_one_unaryPredicates` (`:104`), `modelsOf_oneElement_nat` (`:109`) and `countableModelCount_oneElement` (`:113`, no docstring).

**Claim.** These three statements are headline theorems of the roadmap.

**Witness.** They restate the Layer 0 acceptance check (`README.md:428` onward): a perfect set on `Fin 1`, an empty model class on `ℕ` (a boundary case) and the computed value `𝔠`. A worked example is not a headline.

**Repair.** Delete `Suggested.lean:79–117`. In `README.md:932`, replace "(`hasPerfectSetOfNonisoModelsOn_fin_one_unaryPredicates`)" by "(the Layer 0 acceptance check)". Tested at this head: the trimmed copy elaborates with 33 `sorry` warnings and no other message.

## R02 (P3) — Pull-request numbers in the README

**Location.** `README.md:28` and `:253`, "([#1316](…/TauCetiRoadmap/pull/1316))"; `:77`, "([#1319](…/pull/1319))". Tau Ceti pull-request links at `:160–161` (#18977), `:171` (#18035), `:185–188` (#17547, #18726) and `:975–976` (#18977).

**Claim.** Roadmaps and library work may be cited by pull request.

**Witness.** House style: a cross-roadmap citation names the roadmap and its section, never a pull request, and the README is timeless. All seven links are unchanged since `1c8987f`.

**Repair.**
- Delete the parenthesised links at `:28`, `:77` and `:253`.
- `:160–161`: replace "(Scott's theorem in [Tau Ceti #18977](…); the modules" by "(the modules".
- `:170–171`: replace "`StrongHomClass.realize_sentenceInf`, [Tau Ceti #18035](…));" by "`StrongHomClass.realize_sentenceInf`);".
- `:185–188`: delete the sentence "Free-variable support (…) and the random-graph worked example (…) are not needed here."
- `:975–976`: delete "(Scott's theorem: [Tau Ceti #18977](…))".

## R03 (P3) — The Harnik–Makkai reduction still has no exact locator

**Location.** `README.md:831–832`: "(the minimal counterexamples of Harnik and Makkai; Montalbán's Theorem XII.7 is the minimally unbounded form)".

**Claim.** The parenthesis locates the target `exists_minimallyUncountableOn_and_of_bfScattered`.

**Witness.** No theorem number for Harnik–Makkai, no page for Montalbán. HarnikMakkai1977 line 19 (p. 309): Theorem 1, for more than ℵ₀ and fewer than 2^ℵ₀ models (lines 15–16). Montalban-CSTpart2 line 9426 (p. 219): Theorem XII.7.

**Repair.** Replace the parenthesis by: "(Montalbán, Theorem XII.7, pp. 219–220, for scattered unbounded sentences, which is this statement by 4b and `minimallyUncountableOn_modelsOf_iff_minimallyUnboundedOn`; Harnik–Makkai, Theorem 1, p. 309, for sentences with more than ℵ₀ and fewer than 2^ℵ₀ countable models)".

## R04 (P3) — Backticked names of this roadmap that `Suggested.lean` does not declare

**Location.** `README.md:220`, `:463` and `:530` (`exists_bound_of_countable`); `:639` and `:641` (`F.pointedType`, `F.typeSpectrum`); `:674` and `:676–677` (`ThinRankAnalysis`, `no_cantorAntichain`, `isThinOn`); `:756` (`Sentenceω.MinimallyUncountable`); `:758` (`BoundedRankOn`, `UnboundedRankOn`).

**Claim.** These are Lean declarations of this roadmap.

**Witness.** Each name occurs 0 times in `Suggested.lean` and in 0 files of the pinned Mathlib and Tau Ceti. `:220` itself identifies the first with `TauCeti.exists_rank_bound_of_countable_isoClasses` (`Counting/Stratification.lean:211`).

**Repair.**
- `:220`: replace "(the target `exists_bound_of_countable`, for any invariant map below `ω₁`)" by "(for any invariant map below `ω₁`)".
- `:463` and `:530`: write `TauCeti.exists_rank_bound_of_countable_isoClasses`.
- `:639` and `:641`: write "the coded type of `a` at `c`" and "the type spectrum of `C` at arity `n`".
- `:674–677`: write "a rank analysis of thinness for `r` on `A`" and "with the absence of a Cantor antichain and thinness derived from it".
- `:756`: write "the sentence form for `K = modelsOf φ`".
- `:758`: write "Boundedness and unboundedness of `ρ` below `ω₁` on `K`".

## R05 (P3) — The roadmap's own definitions have no Checks

**Location.**
- `README.md:397`: `HasPerfectSetOfNonisoModelsOn`.
- `:558`: `IsThinOnNatModels`.
- `:604`: `ConcentratedAtBFLevels`.
- `:614`: `sentenceTheory`.
- `:656–661`: `morleyCode` and `morleyBase`.
- `:694–695`: `HasVaughtDichotomy` and `HasVaughtCount`.
- `:735`: `modelsOfTheory`.
- `:754–761`: `MinimallyUncountableOn` and `MinimallyUnboundedOn`.

**Claim.** The layer acceptance checks and the worked examples are enough to pin down these definitions.

**Witness.** `grep -c 'Checks\.' README.md` gives 0. The acceptance checks compute only counts and perfect sets; nothing evaluates `ConcentratedAtBFLevels`, `MinimallyUnboundedOn`, `sentenceTheory`, `morleyBase` or `modelsOfTheory`.

**Repair.** Add a `**Checks.**` list after each definition. These values were computed in the previous review (its rows 5, 8, 13, 21, 29) and stand:
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
  - the models of "`E` is an equivalence relation" fail: "a class of exactly 2" leaves `𝔠` classes on each side;
  - the codes of countable well-orders fail: "there is a last element" leaves `ℵ₁` classes on each side.
- `MinimallyUnboundedOn`:
  - `∅` fails (`β = 0` bounds it);
  - a single isomorphism class fails (`ρ c + 1` bounds it);
  - for the Scott height on codes of well-orders, both sides of "there is a last element" are unbounded, so it fails.

## Previous findings

- R01 — repaired: `README.md:177–178`, `:449` and `:766` now read "with countably many relation symbols"; `:453–455` gives the `P_r`, `r ∈ ℝ` counterexample; `:770`, `:784` and `:814` carry the hypothesis too.
- R02 — not repaired: `Suggested.lean:79–117` still holds the `UnaryPredicates` block with its three sorried statements. Carried as R01.
- R03 — not repaired: the links at `README.md:28`, `:77`, `:253`, `:161`, `:171`, `:186–187` and `:976` are unchanged. Carried as R02.
- R04 — not repaired: `README.md:831–832` still reads "the minimal counterexamples of Harnik and Makkai; Montalbán's Theorem XII.7 is the minimally unbounded form". Carried as R03.
- R05 — not repaired: `exists_bound_of_countable`, `F.pointedType`, `F.typeSpectrum`, `ThinRankAnalysis`, `no_cantorAntichain`, `isThinOn`, `Sentenceω.MinimallyUncountable`, `BoundedRankOn` and `UnboundedRankOn` are still backticked. Carried as R04.
- R06 — repaired: `README.md:264` "(its Layer 2)", `:293` "(its Layer 6.1)", `:299` "(its Layer 4.4)", `:337` "(its Layer 4.1)"; `:346–347` "the instance `isRelational_morleyize` and the theorem `countable_relations_morleyize` (for countable `Φ`)"; `:650–652` reworded.
- R07 — not repaired: the README still has no `**Checks.**` list. Carried as R05.

## Verified sound

| # | Statement | Instances | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | `README.md:449–455`, Scott sentences cut out levels | unary `P_r`, `r ∈ ℝ`, all-empty code `c`; unary `P_i`, `i ∈ ℕ` | uncountable: level-1 class `{c}`; `d` = `c` with unmentioned `P_s` true at `0` satisfies the same sentence, is not level-1 equivalent. Countable: `{c} = modelsOf (∀ x, ⋀ᵢ ¬ P_i x)` | holds as now stated | none |
| 2 | `README.md:177–179`, `scottFormula` class | same | Tau Ceti's `scottSentenceAtLevel` needs Σ countability; the prose now has it | holds | none |
| 3 | `README.md:766`, level-class cuts have a small side | previous row 50 family, uncountable `L` | excluded by the new hypothesis; with countable `L` the level class is `modelsOf` of a sentence, so the cut is a sentence cut | holds | none |
| 4 | `minimallyUncountableOn_modelsOf_iff` (`README.md:770`, `Suggested.lean:440`) | "`E` equivalence relation"; uncountable `L`, nonempty `modelsOf φ` | F ↔ F (`𝔠` classes each side of "a class of exactly 2"; not concentrated at `ω`). Lean binder `[Countable (Σ l, L.Relations l)]` present: prose = signature | holds | none |
| 5 | Minimal counterexamples, steps 1 and 4 (`README.md:784`, `:814`) | step 4 at word `σ` | `C_σ = modelsOf (Θ ⊓ A_σ.scottSentenceAtLevel α_n)` uses row 1, hence countable `L`; `Suggested.lean:483–484` carries the binder | holds | none |
| 6 | `exists_minimallyUncountableOn_and_of_bfScattered` (`README.md:830–832`) | HarnikMakkai1977 Thm 1; Montalban-CSTpart2 Thm XII.7 | Thm 1 at line 19, p. 309, counterexample = `ℵ₀ < count < 2^ℵ₀` (lines 15–16); Thm XII.7 at line 9426, p. 219 | holds | locator (R03) |
| 7 | (S2), (S6), (S7) sections | CountableStructureSpaces at its head | `isomorphismInvariant_modelsOf` under "Layer 2" (`:404`, `:423`); `exists_uniform_bfSeparation` under "4.4" (`:629`); `exists_sentence_separating` under "6.1" (`:830`) | resolve | none |
| 8 | (M2) section | InfinitaryModelExistence on main | `fragmentType`, `Fragment.slice`, realized truth assignment under "4.1 Types" (`README.md:487–495`) | resolves | none |
| 9 | (M3) and 4g (`README.md:346–347`, `:650–652`) | `ModelExistence/Morleyization.lean` | `:94` `instance isRelational_morleyize [L.IsRelational]`; `:99` `theorem countable_relations_morleyize [Countable (Σ n, L.Relations n)] (hΦ : Φ.Countable)` | agree | none |
| 10 | `UnaryPredicates` block (`Suggested.lean:79–117`) | delete it | full file 36 `sorry` warnings; trimmed copy 33, no other message | padding | delete (R01) |
| 11 | Backticked names of R04 | grep at this head and the pins | 9 names: 0 occurrences in `Suggested.lean`, 0 files at the pins; `exists_rank_bound_of_countable_isoClasses` at `Counting/Stratification.lean:211` | undeclared | R04 |

Rows for the untouched statements stand as in the previous review, of `1c8987f`.

- **Gate.** Re-run at `c49f63f`: every check passes (`… depcheck=0 … outside-folder=0 … OK`). The worker's run, with the targeted build, also passed.
- **Elaboration.** `lake env lean` on `Suggested.lean`: 36 `declaration uses sorry` warnings and nothing else. `Suggested.lean` is unchanged since `1c8987f`, so the 57 signatures and the padding probe stand as in the previous review.
- **Dependency check.** Output: `depcheck: 244 roadmaps, 2197 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- **Sources (3 locators against the text).** Montalban-CSTpart2 Lemma XII.5 (line 9367, p. 218) and Theorem XII.7 (line 9426, p. 219); HarnikMakkai1977 Theorem 1 (line 19, p. 309). The diff adds no locator.
- **Library (3 declarations opened at the pin).** `ModelExistence/Morleyization.lean:94, 99`; `Counting/Stratification.lean:211`.
- **Cross-roadmap citations resolved (4).** CountableStructureSpaces Layer 2, 4.4 and 6.1 at its open head; InfinitaryModelExistence 4.1 on main. `overlaps.md` lists no other pull request changing this roadmap and no dropped id; no file changes outside the folder.
- **Pull request's text.** Title and description agree with this head: the pin `2fd255d99`, 36 `sorry`s, CountableStructureSpaces as the open supplier. The change since `1c8987f` adds hypotheses to prose only and removes nothing the description names.
- Remark: `README.md:84` and `:989–990` link Mathlib pull requests #42189 and #42758, text the previous review passed.
- Overlap check: read CountableStructureSpaces, HanfNumbers, InfinitaryModelExistence, BorelEquivalenceRelations, InfinitaryLogic and RandomGraphs as in the previous review, and CountableStructureSpaces and InfinitaryModelExistence again for the sections now cited; López–Escobar and uniform separation are owned by CountableStructureSpaces, fragment types and Morleyization by InfinitaryModelExistence, the Silver forms by BorelEquivalenceRelations, small models by HanfNumbers; nothing else shared.
- Source independence: changed passages only; 7 passages compared with 2 sources (Montalban-CSTpart2 lines 9362–9369 and 9426–9430, HarnikMakkai1977 lines 15–21), none shared; the arrangement was not compared again, since the diff adds, removes and reorders no layer.

## Not verifiable

- Steel 1978, Morley 1970, Vaught 1961 and Silver 1980 are behind publisher paywalls; none is cited by a passage this head changes.
- Marker 2016, Becker–Kechris 1996, Gao 2009 and Kechris 1995 are publisher books with no legal open copy; cited for background page ranges only, outside the changed passages.

## Source issues

- **Gap** in Montalban-CSTpart2 at Lemma XII.8, pp. 220–221: the statement assumes only minimal unboundedness, but the proof picks an unbounded class among countably many ≡β-classes; it should assume Θ scattered; affects the proof.
- **Gap** in Montalban-CSTpart2 at Theorem XII.7, proof, p. 220: the source applies Lemma XII.6 at levels α_i − 3, undefined when α_i is a limit ordinal; it should first replace each α_{i+1} by α_{i+1} + 3; affects the proof.

## For the human reviewers

- **Licence.** `README.md:995–1001` says a Lean formalisation of most of the material exists in `cameronfreer/infinitary-logic` at commit `518a366` (stated Apache-2.0), and maps its files to the layers; the pull request's author owns that repository.
- **Licence.** The source followed for the minimal-counterexample route, Montalban-CSTpart2, is an unpublished draft on its author's page (`README.md:1062–1063`); the theorem itself is published (HarnikMakkai1977, Theorem 1).
