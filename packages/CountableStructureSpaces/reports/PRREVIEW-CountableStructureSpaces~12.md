# Review of CountableStructureSpaces (pull request #1316 at 60f81ce)

**Verdict:** accepted

Incremental re-review of the 9 lines changed since `f17c947` (`TauCetiRoadmap/CountableStructureSpaces/README.md` only). No finding.

## Previous findings

- R01 — repaired: `README.md:931–935` reads "for a Polish group acting on a Polish space … for a countable vocabulary … The form for every language follows from these by the countable-sublanguage reduction above."
- R02 — repaired: `README.md:169` adds the row "Mathlib second-countable spaces | `TopologicalSpace.isOpen_iUnion_countable` … applied to the square of Baire space in 6.1".
- R03 — repaired: the description reads "with only the expected `sorry` warnings (36)"; this head elaborates with 36.

## Verified sound

`g` is `symbSublangIncl ∅ R`; `c₀` is the all-empty code; `P{S}` the code of one unary `P` equal to `S`.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 6.1 source sentence (`README.md:931–935`) | `vaught1974` statement (10); `marker2013notes` Cor. 4.25 | line 350 (page 281), both sets invariant, under the Polish-action assumption of line 328; line 1721 (page 51), both invariant, `X_τ` for countable `τ` (line 922) | pass | — |
| "The form for every language follows from these by the … reduction" | unary `P_r`, `r ∈ ℝ`, `A = {c₀}`, `B` = orbit of "`P_s = {0}`"; `A = ∅` | `R = {P_s}`: reducts `{P{∅}}` and orbit of `P{0}`, disjoint, analytic, second invariant; countable-language separator `C₀` = "`P_s` empty"; `g⁻¹C₀ ∋ c₀`, misses `B`. `R = ∅`, `C = ∅` | pass | — |
| supplier row `isOpen_iUnion_countable` against `exists_countable_sublanguage_separating` (`Suggested.lean:424`) | Mathlib statement at the pin; index set = atoms, space = Baire square | `[SecondCountableTopology α] (s : ι → Set α) (H : ∀ i, IsOpen (s i)) : ∃ T, T.Countable ∧ ⋃ i ∈ T, s i = ⋃ i, s i`; no hypothesis on `ι`, so uncountably many atoms allowed; `A = {P{0}}`, `B = {P{∅}}`: `T` = one atom, `R = {P}` | pass | — |

The rows of the previous review, of `f17c947`, stand for the untouched statements.

- **Source locators:** 2 rechecked in the changed passage with their standing hypotheses (`vaught1974` lines 328, 350; `marker2013notes` lines 922, 1721–1722). The diff adds no locator.
- **Library declarations opened at the pin:** 1, Mathlib `Topology/Bases.lean:929` (`TopologicalSpace.isOpen_iUnion_countable`); the README names it at lines 169, 905 and 942, consistently.
- **Lean:** the diff changes no statement; `Suggested.lean:424–450` (the three Layer 6 statements the changed text cites) agree with `README.md:897–925`: no countability binder, `[L.IsRelational]` only on `exists_sentence_separating`.
- **Pull-request text:** the title and description were read against this head; the count of warnings is 36 in both, the last line names the two repairs of this change, and the roadmap is stated as an addition.
- **Gate:** every check 0, `OK`; nothing changes outside the folder. **Dependency check:** `depcheck: 261 roadmaps, 2596 edges, 0 problem(s)`.
- **Elaboration:** exit 0, 36 warnings, all `declaration uses sorry`.
- **Overlap check:** read CountableStructureSpacesPartII, CountableModelCounting, InfinitaryModelExistence; nothing shared. The overlap list has no dropped id, no second copy and no other pull request changing this folder; the change adds no object.

Source independence: changed passages only; 3 passages compared with 2 sources, none shared; largest share `marker2013notes`, 19 of 27 locators; no layer added, removed or reordered, so the contents were not compared again.

Research link: Layer 5 is the theorem of López-Escobar (1965); Layer 6.1 is the invariant separation of Vaught (1974, statement (10)); CountableModelCounting, on main, consumes `exists_sentence_separating` and `exists_uniform_bfSeparation` for the Vaught-conjecture toolkit. Rests on the README's summary, references and downstream consumers, and on `vaught1974`.

## Not verifiable

- Kechris 1995, Gao 2009, Keisler 1971 and Marker 2016 (the book) are paywalled with no legal open copy; the changed passages cite none of them.
- `vaught1974` is an OCR of a two-column scan: the section sign in the sentence at line 328 is not legible, so which section the Polish assumption opens was read from its position before Theorem 2.7 and statement (10).

## Source issues

- none

## For the human reviewers

- **Licence.** README `## Provenance` names `cameronfreer/infinitary-logic` at `518a366` (stated Apache-2.0) as the origin of the layer files. `Suggested.lean` was not compared with that repository and its licence was not read.
- **Licence.** `vaught1974` was read from `matwbn.icm.edu.pl` (file `fm82118.pdf`), the ICM digital library's copy of Fundamenta Mathematicae 82; this review classed the host as institutional.
