# Review of CountableStructureSpaces (pull request #1316 at f17c947)

**Verdict:** needs changes

Incremental re-review of the 145 lines changed since `27e4b31`. `README.md` and `Suggested.lean` are in `TauCetiRoadmap/CountableStructureSpaces/`; library paths are at the pins (Mathlib `1b1ccf4b0`, Tau Ceti `2fd255d99`). The three findings are P3; the mathematics of the changed passages checks out (table below).

## R01 (P3) — 6.1 cites its sources without their countability hypothesis, now that the target is for every language

**Location:** `README.md:930–931`: "Vaught 1974, statement (10), p. 281, and Marker's notes, Corollary 4.25, p. 51, separate two disjoint invariant analytic sets by an invariant Borel set. Here only `B` need be invariant".

**Claim:** The only difference between the sources and `invariant_analytic_separation` ("for every language", `README.md:906`) is that `A` need not be invariant.

**Witness:** `vaught1974` line 328: group and space are both assumed Polish from there on, statement (10) at line 350 included. `marker2013notes` line 922: the space `X_τ` is defined for a countable vocabulary; Corollary 4.25 is at line 1721.

**Repair:** "Vaught 1974, statement (10), p. 281, for a Polish group acting on a Polish space, and Marker's notes, Corollary 4.25, p. 51, for a countable vocabulary, separate two disjoint invariant analytic sets by an invariant Borel set. Here only `B` need be invariant: the saturation of `A` is analytic (Layer 1.2) and, `B` being invariant, still disjoint from `B`; and the language is arbitrary, by the reduction to `L₀` above, which neither source has."

## R02 (P3) — The supplier contracts do not list the Mathlib lemma the new 6.1 route consumes

**Location:** `README.md:937–939`: "M `AnalyticSet`, `AnalyticSet.image_of_continuous`, `TopologicalSpace.isOpen_iUnion_countable`", against the Mathlib rows of `## Exact supplier contracts` (`README.md:166–171`).

**Claim:** Every library declaration a `*Needs:*` line consumes is named in the supplier contracts (the same change added `continuous_reductConfiguration` to the Tau Ceti row for this route).

**Witness:** `TopologicalSpace.isOpen_iUnion_countable` (Mathlib `Topology/Bases.lean:929`) occurs in the README at lines 904 and 939 only; no row of the table names it.

**Repair:** Add a row: "| Mathlib second-countable spaces | `TopologicalSpace.isOpen_iUnion_countable` (in a second-countable space a union of open sets is the union of countably many of them), applied to the square of Baire space in 6.1 |".

## R03 (P3) — The description's count of `sorry` warnings is again one head behind

**Location:** Pull-request description, Validation: "with only the expected `sorry` warnings (35)".

**Claim:** `Suggested.lean` at this head elaborates with 35 `sorry` warnings.

**Witness:** `lake env lean` on `Suggested.lean` at `f17c947` exits 0 with 36 warnings, all `declaration uses sorry`; the new one is `exists_countable_sublanguage_separating` (`Suggested.lean:424`).

**Repair:** "with only the expected `sorry` warnings (36)".

## Previous findings

- R01 — repaired: `README.md:644–651`, `674–678` now read "for relational `L` with countably many relation symbols"; 6.1 instead drops the binder in both files, with a route through `exists_countable_sublanguage_separating` (`README.md:897–923`); two negative-control Checks added (718–735).
- R02 — repaired: `README.md:49–50` read "0–4; InfinitaryModelExistence PC-separation" and "0–5; BorelEquivalenceRelations (invariant Lusin separation)".
- R03 — not repaired: the description reads "`sorry` warnings (35)"; this head has 36 (R03 above).

## Verified sound

`c₀` is the all-empty code. `P{S}` is the code of one unary `P` equal to `S`. `g` is `symbSublangIncl ∅ R`.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `exists_countable_sublanguage_separating` | `A = ∅`; `A = {P{0}}`, `B = {P{∅}}`; `L` with no relation symbol; unary `P_r`, `A = {c₀}`, `B` = orbit of "`P_s = {0}`" | `R = ∅` works; `R = ∅` fails (both reducts one point), `R = {P}` works; code space a point, no disjoint nonempty pair; `R = {P_s}` | pass | — |
| its route | atoms as index set, Baire square | `{(p,q) | (f p).eval a ≠ (f' q).eval a}` open (`isClopen_setOf_eval`); cover since codes are determined by atoms; `isOpen_iUnion_countable` gives countable `T`, `R` its symbols | pass | — |
| `invariant_analytic_separation`, no countability | `P_r`, `A = {c₀}`, `B` as above; `A = ∅` | `C₀` = "`P_s` empty" in `L₀`, `C = g⁻¹C₀` product-measurable, invariant, `c₀ ∈ C`, `B ∩ C = ∅`; `C = ∅` | pass | — |
| its route, each step | `B₀ = g '' B`; `C = g⁻¹ C₀` | `σ • g c = g (σ • c)` (`LanguageMap.lean:112`) gives invariance of both; `c ∈ B ∩ C` gives `g c ∈ B₀ ∩ C₀ = ∅`; `L₀`-codes on `ℕ` Polish, so the supplier applies | pass | — |
| `exists_sentence_separating`, every relational `L` | `P_r` example; `A = ∅` | `θ` = "no element satisfies `P_s`", one symbol; `θ = ⊥`; `C` measurable and a fixed block, so `lopezEscobar_action_iff` (no countability binder, `Suggested.lean:393`) applies | pass | — |
| 6.1 remark, "neither class need depend on countably many symbols" | `P_r`, `{c₀}` | invariant, analytic (a constant image), not product-measurable, no defining sentence; consistent with the negative control of 5.4 | pass | — |
| 4.3–4.4 Check, unary `P_r` | `(c₀, c₀)`, `(c₀, d)`, `d`: `P_s = ℕ`, `s` off the support | isomorphic, not isomorphic, equal on the support; level `ω`: counts of each exact type capped at every `k` agree ⇒ equal counts ⇒ isomorphic; right side of the iff true, left false | pass | — |
| 4.3 Check, binary `R_r`, strata at `β = 0` | `c₀`; `c₁ = c₀` + edge `R_r(0,1)`; tuples `(0)`, `(2)` | `c₀`: every permutation an automorphism, `BFEquiv 0 ↔ BFEquiv 1`, `s = 0`; `c₁`: `BFEquiv 0` holds, `BFEquiv 1` fails (`R_r(0,1)` true, `R_r(2,x)` false), `s > 0` | pass | — |
| same Check, "every code of a unary language has `s = 0`" | tuples `a`, `b` of equal atomic type (`AtomicIdx.eq` included, `AtomicType.lean:74`) | `aᵢ ↦ bᵢ` is a finite partial injection inside each exact-type class; it extends to a permutation of each class, an automorphism | pass | — |
| `measurableSet_iso_inter_of_scottHeight_le`, `measurableSet_setOf_selfStabilizationOrdinal_le`, `measurableSet_iso_inter_iff_exists_bfLevel` | README 644–651, 674–678 against `Suggested.lean:245, 255, 314` | both sides now carry `[L.IsRelational]` and countably many relation symbols; the two Checks are the failing instances without it | pass | — |
| Layer 2, graph events at fixed assignments on every countable `V` | `V = Fin 0`, `Fin 2`, `ℕ` | `measurableSet_setOf_realize` asks `[Countable ι] [Countable V]` (`ModelsOf.lean:133`); `measurable_toRelationalConfiguration` has no hypothesis on `V` (`SimpleGraph/RelationalConfiguration.lean:250`); the target is `{V : Type*}` | pass | — |
| scope table rows 5, 6 | *Needs:* of 5.2, 5.4, 6.1, 6.2 | L0 and L1.2 lie in "0–4" and "0–5" | pass | — |

The rows of the previous review, of `27e4b31`, stand for the untouched statements.

- **Source locators:** 2 rechecked in the changed section (`vaught1974` line 350; `marker2013notes` lines 1721–1722), with their standing hypotheses (`vaught1974` line 328; `marker2013notes` line 922): R01. The diff adds no locator.
- **Library declarations opened at the pins:** 19. Tau Ceti `ModelTheory/Sublanguage.lean:63, 72, 105`, `RelationalConfiguration/LanguageMap.lean:79, 101, 107, 112, 167`, `RelationalConfiguration/ModelsOf.lean:133`, `RelationalConfiguration/Isomorphism.lean:268`, `Combinatorics/SimpleGraph/RelationalConfiguration.lean:205, 250`, `SetTheory/Descriptive/InvariantSeparation.lean:117`, `Scott/Stabilization.lean:62`; Mathlib `Topology/Bases.lean:929`, `MeasureTheory/Constructions/Polish/Basic.lean:239`, `MeasureTheory/Constructions/Cylinders.lean:476`, `MeasureTheory/MeasurableSpace/Embedding.lean:586`, `Data/Set/Countable.lean:56`.
- **Cross-roadmap citations:** CountableModelCounting on main (README 214–216) cites `exists_sentence_separating` with the hypotheses of this head, and no countability; no other roadmap, on main or open, names `invariant_analytic_separation` or the new target.
- **Gate:** every check 0, `OK`; nothing changes outside the folder. **Dependency check:** `depcheck: 241 roadmaps, 2253 edges, 0 problem(s)`.
- **Elaboration:** exit 0, 36 warnings, all `declaration uses sorry`. The elaborated types of the three Layer 6 statements and of the two graph declarations were compared with the README: same generality, no binder lost.
- **Padding probe:** on a scratch copy the three Layer 6 `sorry`s were replaced by `first | rfl | simp | infer_instance | exact? | (simp_all; done) | sorry`; none closed. Nothing at the pin states the countable separating sublanguage.
- **Overlap check:** read CountableStructureSpacesPartII, CountableModelCounting, InfinitaryModelExistence; nothing shared. PartII (open) consumes targets of Layers 0, 1.2, 4.4 and 6.2 here, none of which the change restates, and owns no separation theorem; every roadmap on main and at the open heads was searched for the objects the change adds.
- **Remark** (no change asked): `countable_relations_symbSublang` gives countability of `Σ n, Relations n`; the arity-wise form the library's instances ask follows by the equivalence Convention 1 states.

Source independence: changed passages only; 7 passages compared with 2 sources, none shared; largest share `marker2013notes`, 19 of 27 locators; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- Kechris 1995, Gao 2009, Keisler 1971 and Marker 2016 (the book) are paywalled with no legal open copy; the changed passages cite none of them.
- `vaught1974` is an OCR of a two-column scan: the section sign in the sentence at line 328 is not legible, so which section the Polish assumption opens was read from its position before Theorem 2.7 and statement (10).

## Source issues

- none

## For the human reviewers

- **Licence.** README `## Provenance` names `cameronfreer/infinitary-logic` at `518a366` (stated Apache-2.0) as the origin of the layer files. `Suggested.lean` was not compared with that repository and its licence was not read.
- **Licence.** `vaught1974` was read from `matwbn.icm.edu.pl` (file `fm82118.pdf`), the ICM digital library's copy of Fundamenta Mathematicae 82; this review classed the host as institutional.
