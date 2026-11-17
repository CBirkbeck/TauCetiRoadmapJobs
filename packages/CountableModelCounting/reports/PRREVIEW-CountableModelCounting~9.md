# Review of CountableModelCounting (pull request #2012 at b79bc76)

**Verdict:** accepted

Incremental re-review of the 13 lines changed since `6f3a7b4`. Paths are under `TauCetiRoadmap/CountableModelCounting/`; Tau Ceti paths, at the pin, are under `TauCeti/ModelTheory/`. No finding: the three findings of the previous review are repaired and the two added passages are correct.

## Previous findings

- R01 — repaired: `README.md:835–842`, a third, positive Check: "Without an isolating rank it can hold on a single isomorphism class … `ρ` take values cofinal in `ω₁` on `K` … needs `ρ` isolating."
- R02 — repaired: `README.md:431–434`, "With unary `P_r` (`r ∈ ℝ`) instead, the codes on `Fin 1` are the points of `ℝ → Bool` … `2^𝔠` … the upper bound `𝔠` needs countably many relation symbols."
- R03 — repaired: the description's **Scope** now reads "The Layer 0 acceptance check (the one-element sentence with countably many unary predicates) is no longer stated in `Suggested.lean`; the README keeps it."

## Verified sound

| # | Statement | Instances | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | Layer 0 acceptance check, added control (`README.md:431–434`) | `P_i`, `i ∈ ℕ`; `P_r`, `r ∈ ℝ`; `φ := ∃ x ∀ y, y = x` | `P_i`: codes on `Fin 1` = `ℕ → Bool`, `Perm (Fin 1)` trivial, count `𝔠`. `P_r`: codes `ℝ → Bool`, count `2^𝔠 > 𝔠`; other tiers empty in both | holds | none |
| 2 | `countableModelCount_le_continuum` against the control (`Counting/Classes.lean:190`) | `P_i`; `P_r` | binder `[∀ n, Countable (L.Relations n)]`: `P_i` satisfies it, `𝔠 ≤ 𝔠`; `P_r` fails it (`Relations 1 = ℝ`), so `2^𝔠` contradicts nothing | prose = pin | none |
| 3 | `MinimallyUnboundedOn`, third Check (`README.md:835–842`; `Suggested.lean:393`) | one unary `P`; `K` = class of "`P` = evens"; `ρ` = `α` on the `α`-th of `ℵ₁` chosen members, `0` elsewhere | `#K = 𝔠 ≥ ℵ₁`. First conjunct: no `β < ω₁` bounds `ρ`, T. Each `θ`: `K ∩ modelsOf θ` or `K \ modelsOf θ` is `∅`, `β = 0`, T | holds | none |
| 4 | Same Check against the other two (`:832–834`) | `∅`; isolating `ρ` on one class | `∅`: `β = 0` bounds, first conjunct F. Isolating: `iso_invariant` (`Counting/Stratification.lean:81`) makes `ρ` constant on `K`, bound `ρ c + 1`, F. The new `ρ` is not invariant: no conflict | consistent; 3 Checks, one positive | none |
| 5 | `minimallyUncountableOn_modelsOf_iff_minimallyUnboundedOn` on the Check's `K` (`Suggested.lean:413–417`) | `K = modelsOf σ`, `σ` the Scott sentence; the `ρ` of row 3 | left: `K` meets 1 class, `MinimallyUncountableOn` F. Right: `BFScattered` (`Counting/Scattered/Basic.lean:79`) 1 class per level, T; `MinimallyUnboundedOn` T. F ↔ T fails, excluded by `hρ : IsIsolatingRank ρ` | hypothesis needed, as the Check says | none |
| 6 | `MinimallyUncountableOn`, Checks (`README.md:819–826`), cited by the new Check | `K` of row 3 | image of `K` in the quotient: 1 element, countable; first conjunct F | agrees with "it is not minimally uncountable" | none |

The rows for untouched statements stand as in the previous review, of `6f3a7b4`.

- **Gate.** The worker's run at `b79bc76`: every check passes, with the targeted build.
- **Elaboration.** `lake env lean` on `Suggested.lean`: 33 `declaration uses sorry` warnings and no other message. The diff changes no Lean file, so the one-tactic probe and the signature comparison stand as at `17f7816`.
- **Dependency check.** `depcheck: 261 roadmaps, 2595 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file changed outside the folder.
- **Library (5 declarations opened at the pin).** `Counting/Classes.lean:133`, `:190`; `Counting/Stratification.lean:79`; `Counting/Scattered/Basic.lean:79`; `RelationalConfiguration/ModelsOf.lean:66`.
- **Citations.** The changed passages add no cross-roadmap citation and no source locator; the one name they add, `minimallyUncountableOn_modelsOf_iff_minimallyUnboundedOn`, is declared at `Suggested.lean:413`. The citation tool's two leads (`ConcentratedAtBFLevels.bfScattered`, `Language.Equiv.internalScottRank_eq`) are this file's own declarations. Seeded sample: the two targets in the changed passages (the Layer 0 "Acceptance check", "Minimally uncountable sentences") are rows 1–6.
- **Description.** Read against the head: the 33 count, the Layer 0 sentence in **Scope**, the heading "Targets of this roadmap in Tau Ceti" and the supplier block agree. The change since `6f3a7b4` adds two Checks and no target, so the description leaves nothing unstated.
- Overlap check: read CountableStructureSpaces, CountableStructureSpacesPartII, HanfNumbers, InfinitaryModelExistence, BorelEquivalenceRelations, InfinitaryLogic, RandomGraphs; the diff adds no object, and the owners named in the previous reviews stand (CountableStructureSpacesPartII consumes this roadmap's Layer 0 and owns Borel completeness); nothing else shared.
- Source independence: changed passages only; 2 changed passages read, which add no source locator and no statement taken from a source (both are instances computed here), so none was set beside a source text; largest share Montalban-CSTpart2, 20 of 40 locators; no layer added, removed or reordered, so the contents were not compared again.
- Research link: the headline targets are Morley's theorem (Morley 1970) through Silver's dichotomy (Silver 1980) and the forms of Vaught's conjecture (Vaught 1961; Steel 1978; Harnik–Makkai 1977; Baldwin–Friedman–Koerwien–Laskowski 2016), an open problem; rests on the README's summary and references.

## Not verifiable

- The description's integration run at `56b1fa57` ("ALL COMPILED") is outside this repository and was not run.
- Whether 4f and 4h, which the changed text does not touch, need countably many relation symbols: no instance found either way.
- Sources: none opened in this re-review; the items of the earlier reviews' lists stand.

## Source issues

- none

## For the human reviewers

- **Scope.** `README.md:245–294` names CountableStructureSpaces as supplier of (S1)–(S7); that roadmap is an open pull request, not on main and not in the merge order. Main's README already cites it; the dependency check reports no problem.
- **Licence.** The README's references (`README.md:1083–1086`) say a Lean formalisation of most of the material exists in `cameronfreer/infinitary-logic` (stated Apache-2.0) and map its files to the layers; the pull request's author owns that repository.
- **Licence.** The source with the largest share of locators, Montalban-CSTpart2, is an unpublished draft on its author's page; the theorem it is cited for is published (Harnik–Makkai 1977).
