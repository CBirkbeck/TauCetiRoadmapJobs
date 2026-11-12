# Review of CountableModelCounting (pull request #2012 at a25a711)

**Verdict:** needs changes

Incremental re-review of the 5 lines changed since `8584c5d`. Paths are under `TauCetiRoadmap/CountableModelCounting/`. Tau Ceti paths are at the pin `2fd255d99`. All four findings are P3. They are the previous review's R02–R05, which this head leaves unrepaired.

## R01 (P3) — Padding left in `Suggested.lean`

**Location.** `Suggested.lean:69`, `:76`, `:102–139`, `:169`, `:278`, `:287`, `:351–384`, `:394`, `:449`, `:602`. For example, `:602–606` reads "theorem countable_quotient_isoSetoidOn_iff … := Setoid.countable_quotient_comap_val_iff".

**Claim.** These declarations add nothing to the acceptance test, which states only headline theorems. They restate pinned theorems, follow in one step from the library, mirror the Layer 0 acceptance check, or unfold `morleyCode`. This is R02 of the review of `8584c5d`, unchanged.

**Witness.** `:602` is `Setoid.countable_quotient_comap_val_iff` (`TauCeti/Data/Setoid/Countable.lean:34`). `:169`, `:278` and `:287` are Tau Ceti's theorems of the same names (`Counting/Stratification.lean:258`, `Counting/Scattered/Basic.lean:155`, `:146`) composed with `Setoid.comapQuotientEquiv`.

**Repair.**
- **In `Suggested.lean`**, delete these lines:
  - 5: the import `TauCeti.ModelTheory.Counting.LanguageEquiv`, unused once the rest is gone;
  - 49–54: `countable_relations`;
  - 67–81;
  - 102–178: the `UnaryPredicates` block, and the Layer 1 section with `quotientComapEquivImage`;
  - 275–298, 351–385, 392–399, 448–451 and 599–607.
- **In the README**, turn each backticked name that the file no longer declares into prose or a Tau Ceti citation:
  - `encodeVia_mem_modelsOf` (lines 212, 387);
  - `measurableSet_isoSetoid_fin` (210, 392, 400);
  - `hasPerfectSetOfNonisoModelsOn_fin_one_unaryPredicates` (921);
  - `morleyCode_inl`, `morleyCode_inr_eq_true_iff`, `morleyBase_morleyCode`, `morleyCode_injective`, `toStructure_morleyCode` and `isoSetoid_morleyCode_iff` (650–658);
  - `VaughtConjecture.cardinal` (365, 706, 840);
  - `countable_quotient_isoSetoidOn_iff` (836).
- **Also in the README**, rewrite "The targets, all stated in `Suggested.lean`" (line 646) and "restating a few of them in the form used here" (line 194).
- **Remaining docstrings** in `Suggested.lean` that cite deleted names cite them in prose.

Tested: a copy of this head with exactly these line deletions elaborates with 33 `sorry` warnings and no other message.

## R02 (P3) — The module docstring is not in the "target signatures" form

**Location.** `Suggested.lean:17–30`. The title ends "suggested signatures". The text says the file "is **not exhaustive**: it records suggested Lean `sorry`-forms … for *particular* milestones" and "Names and namespaces are provisional".

**Claim.** The file is the roadmap's acceptance test. Its docstring should say that it states the headline theorems against the pinned APIs, and which of them are not statable. This is R03 of the review of `8584c5d`, unchanged.

**Witness.** Lines 17–30 are byte-identical to the head `8584c5d` (`git diff 8584c5d a25a711` touches only lines 481–482 of the file).

**Repair.**
- Change the title to "Counting countable models: Morley's theorem and the Vaught toolkit: target signatures".
- Replace lines 19–30 by: "`README.md` is the roadmap; this file is not. It states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`. Layer 1's headlines and most of Layer 0's are implemented in Tau Ceti and cited in the README."
- Keep lines 32–33.

## R03 (P3) — Pull-request numbers as roadmap citations, and a LaTeX display block

**Location.** `README.md:29` and `:253` (`[#1316](…/pull/1316)`), and `:78` (`[#1319](…/pull/1319)`). Also `README.md:14–18`, a `math` fence containing `\#\{\text{…}\}`, `\le`, `\aleph_1` and `\quad`.

**Claim.** Cross-roadmap citations name the roadmap only, and mathematics is written in Unicode without LaTeX. This is R04 of the review of `8584c5d`, unchanged.

**Witness.** The three links and the fence are unchanged at this head. The description already names #1316 in its `depends-on` block, which is where the number belongs.

**Repair.**
- Cite CountableStructureSpaces and HanfNumbers by name only.
- Replace the fence by the indented line `#{countable models of φ}/≅ ≤ ℵ₁   or   φ has a perfect set of pairwise non-isomorphic countable models`.

## R04 (P3) — The Harnik–Makkai reduction has no locator into Harnik–Makkai

**Location.** `README.md:819–821` reads "some `Θ ⊓ θ` has minimally uncountable models (the minimal counterexamples of Harnik and Makkai; Montalbán's Theorem XII.7 is the minimally unbounded form)".

**Claim.** The target is the minimally *uncountable* form. Its only locator points into Montalbán, who proves the minimally *unbounded* form. This is R05 of the review of `8584c5d`, unchanged.

**Witness.** HarnikMakkai1977 lines 14–21 (p. 309) define "large" as more than ℵ₀ countable models and "minimal" as large with a non-large side at every cut. Theorem 1 strengthens a counterexample (ℵ₀ < count < 2^ℵ₀) to a minimal one.

**Repair.** Replace the parenthesis by: "(Harnik–Makkai, Theorem 1, p. 309, there for sentences with more than ℵ₀ and fewer than 2^ℵ₀ countable models; Montalbán's Theorem XII.7 is the minimally unbounded form)".

## Previous findings

- R01 — repaired: `README.md:269` now reads "which follows from Tau Ceti's `FirstOrder.Language.Equiv.mem_modelsOf_iff` (invariance across carriers)". That is the declaration at `TauCeti/ModelTheory/RelationalConfiguration/ModelsOf.lean:186`, in `namespace FirstOrder.Language.Equiv`.
- R02 — not repaired: `Suggested.lean:602` still reads "theorem countable_quotient_isoSetoidOn_iff … := Setoid.countable_quotient_comap_val_iff". All the other listed declarations are present and unchanged. Carried as R01.
- R03 — not repaired: `Suggested.lean:17` still reads "…: suggested signatures", and lines 21–22 still say "**not exhaustive**: it records suggested Lean `sorry`-forms". Carried as R02.
- R04 — not repaired: `README.md:29`, `:78` and `:253` still link pull requests 1316 and 1319, and the `math` fence at lines 14–18 remains. Carried as R03.
- R05 — not repaired: `README.md:820–821` still reads "(the minimal counterexamples of Harnik and Makkai; Montalbán's Theorem XII.7 is the minimally unbounded form)". Carried as R04.
- R06 — repaired: `Suggested.lean:481` reads "theorem hasVaughtDichotomy_and_infiniteSentence_iff [L.IsRelational] (φ : L.Sentenceω)". It has no countability binder, and the statement holds for every relational `L` (row 1).

## Verified sound

| # | Statement | Instances | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | `hasVaughtDichotomy_and_infiniteSentence_iff` (hypothesis dropped) | `Language.empty`, `⊤` | count(⊤ ⊓ inf) = 1 + Σ 0 = 1 ≤ ℵ₀: T / one class on `ℕ`, countable: T | holds | none |
| 1b | same | `UnaryPredicates.oneElement` | no models on `ℕ`, none of `⊓ inf` on `Fin n`; count 0: T / empty quotient: T | holds | none |
| 1c | same | L with unary `P_r`, `r ∈ ℝ` (uncountable), `⊤` | 2^𝔠 codes, at most 𝔠 per class, so 2^𝔠 classes; codes free only at `P_{r_k}(0)` form a perfect antichain: T / T | holds without countability | none |
| 2 | `isomorphismInvariant_modelsOf` from `FirstOrder.Language.Equiv.mem_modelsOf_iff` (README:269) | one unary `P`, `Fin 2`; c: `P` at 0, d: `P` at 1, `e` = swap; φ = `∃x P x ∧ ∃x ¬P x` | c ∈ T, d ∈ T. Control: c′ = `P` everywhere is not isomorphic to c; c′ ∉, c ∈ | holds with V = W = α | none |
| 3 | `countable_quotient_isoSetoidOn_iff` (R01) | `⊥`; `⊤` in `UnaryPredicates.lang` on `ℕ` | ∅ / ∅: T↔T; 𝔠 classes / 𝔠 classes: F↔F | holds; one term | delete (R01) |
| 4 | `mk_isoClasses_le_aleph_one_of_countable_levels`, `IsIsolatingRank.*` (R01) | K = one isomorphism class | image has 1 point; the comap quotient has 1 class; the bijection is `quotientComapEquivImage`; 1 ≤ ℵ₁ | holds; Tau Ceti's same-name theorems | delete (R01) |
| 5 | `VaughtConjecture.cardinal` (R01) | count ℵ₀; perfectly many | left disjunct holds on both sides; perfect ⇒ count = 𝔠 by `HasPerfectlyManyCountableModels.countableModelCount_eq` | holds; `imp_right` | delete (R01) |
| 6 | Layer 0 acceptance block (R01) | `Fin 1`, `ℕ` | codes on `Fin 1` = `ℕ → Bool`, `#Perm (Fin 1) = 1`, so 𝔠 classes; `ℕ`: 0 models; count 𝔠 | holds | delete (R01) |
| 7 | `morleyCode` unfolding lemmas (R01) | Φ = ∅; Φ = {⊤ at arity 1} | base bits copied, `morleyBase ∘ morleyCode = id`, injective; the new bit is true at every `v` | holds | delete (R01) |
| 8 | Morley display (R03) | `oneElement`; pure sets | count 𝔠 with a perfect set at `Fin 1`: second alternative; count ℵ₀ ≤ ℵ₁: first | holds | Unicode line (R03) |
| 9 | `exists_minimallyUncountableOn_and_of_bfScattered` (R04) | Harnik–Makkai Theorem 1 | there ℵ₀ < count < 2^ℵ₀; here scattered and uncountable. "Minimal" (one cut side ≤ ℵ₀) is `MinimallyUncountableOn`'s second conjunct | holds; the source's hypothesis differs | locator (R04) |

The rows for statements this diff does not touch stand as in the previous review, of `8584c5d`.

- **Gate:** re-run on `a25a711`, every check passes, `readme-ids-missing=0` included; the worker's targeted build passed.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 36 warnings, all `declaration uses sorry`, and no other message.
- **Dependency check:** output `depcheck: 207 roadmaps, 1914 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- **Signature:** the elaborated `@hasVaughtDichotomy_and_infiniteSentence_iff` is `∀ {L} [L.IsRelational] (φ : L.Sentenceω), …`. That matches README:710–714 and Convention 1 (README:82–83). The other 71 signatures are unchanged.
- **Library declarations opened at the pin (11):**
  - `mem_modelsOf_iff` (`RelationalConfiguration/ModelsOf.lean:186`);
  - in `Counting/Classes.lean`: `CountableModelClasses`, `countableModelCount`, `countableModelCount_eq_add_sum` and `HasPerfectlyManyCountableModels` (lines 129, 133, 143, 340);
  - `infiniteSentence` and `realize_infiniteSentence_iff` (`Infinitary/Infinite.lean:33, 44`);
  - `HasPerfectAntichainOn`, which requires `P.Nonempty` (`Antichain.lean:112`);
  - `countable_quotient_comap_val_iff`, and the two Scattered theorems.
- **Cross-roadmap citation resolved (1):** CountableStructureSpaces at its head, `isomorphismInvariant_modelsOf` (`Suggested.lean:183`), is proved from `mem_modelsOf_iff`, as its README:351 says.
- **Overlaps and ownership:** `overlaps.md` lists no overlap. The infinite-model reduction occurs only in this roadmap, on main and at the open heads. Tau Ceti has only two `modelsOf L.infiniteSentence` examples (`Examples/ModelTheory/RelationalConfiguration.lean:52, 57`), not the equivalence.
- **Probes, sources and the pull request's text:**
  - No one-tactic probe closes the changed theorem: `rfl`, `simp`, `simp_all` (with `countableModelCount_eq_add_sum`) and `aesop` were tried.
  - HarnikMakkai1977 lines 14–21 were re-read.
  - The title and description agree with the head: pin `2fd255d99`, "36 `sorry`s", the two renames, `morleyCode` and `morleyBase`, and Convention 1's Σ form.

## Not verifiable

- None in the changed passages. The previous review's list (Steel 1978, Morley 1970, Vaught 1961: all paywalled) stands.

## Source issues

- none
