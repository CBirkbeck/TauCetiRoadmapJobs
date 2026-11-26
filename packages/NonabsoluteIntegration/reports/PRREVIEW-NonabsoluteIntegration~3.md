# Review of NonabsoluteIntegration (pull request #2977 at 57c12da)

**Verdict:** accepted

**Summary.** Accepted: the one format note of the previous review is repaired, and the 13 changed lines of §3.1 are true as written (the restricted variation is nondecreasing in `E`; each of the four classes passes to subsets). There are no findings, no small corrections and no format notes. As before, no cited source could be read legally, so the locators are left to the human reviewers.

## Previous findings

- N01 — repaired: §3.1 now reads "the restricted variation is nondecreasing in `E`, and each of the four classes passes from `E` to its subsets", and the route says "Passage to subsets is immediate, since a subset of `E` admits fewer families".

The previous review had no finding (R) and no small correction (C) to carry.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 3.1 restricted variation nondecreasing in `E` | `F x = |x − 1/2|`, `E = {0, 1} ⊆ E' = {0, 1/2, 1}`; a Lean proof on a scratch copy | On `E`: family `[0,1]`, oscillation `1/2`. On `E'`: `[0,1/2]`, `[1/2,1]`, sum `1`. `1/2 ≤ 1`. The inequality for `E ⊆ E'` elaborates with no error | true | none |
| 3.1 VB* and AC* pass to subsets | Same `F`; the spikes `|sin(π/x)|` on `{0} ⊆ {0} ∪ {1/(n+1)}` | A family in the subset is a family in `E`, same `δ`. Converse fails: on `{0}` only `[0,0]`, sum `0`; on the larger set oscillations `1` each | true; direction right | none |
| 3.1 VBG* and ACG* pass to subsets | `E' ⊆ E = ⋃ Sₙ` | `E' = ⋃ (Sₙ ∩ E')`; each piece is a subset of `Sₙ`, so VB* (AC*) by the row above; `ContinuousOn F E` restricts to `E'` | true | none |
| Convention "monotone means nondecreasing" against §3.1 | The word in the changed lines | "nondecreasing" for the `ℝ≥0∞`-valued variation, "passes to subsets" for the classes; no remaining "monotone in `E`" | consistent | none |

The rows for the untouched statements stand as in the previous review, of `c1711a2`.

- Source locators checked against the text: 0; the changed lines carry no locator and none of the README's locators is flagged as unverified; no cited text is readable legally, so the seeded sample (which falls outside the changed lines except for §3.1, whose locators did not change) was not checked.
- Library and file declarations opened: `TauCetiRoadmap/NonabsoluteIntegration/Suggested.lean` lines 236–265 (`IsIntervalFamilyIn`, `eVariationStarOn`, `IsVBGStarOn`, `AbsContStarOn`, `IsACGStarOn`), which the changed prose describes; the change touches no Lean statement.
- Cross-roadmap citations resolved: the changed lines cite none; none of the README's is found nowhere. The seven Lean names reported as occurring nowhere in the pinned libraries are this roadmap's own declarations in `Suggested.lean`.
- Dependency check: `depcheck: 106 roadmaps, 1216 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean` at this head: 34 warnings, all `declaration uses sorry`; no error and no other warning. The file is unchanged since `c1711a2`, so the signatures and the one-tactic probes stand as before.
- Automatic checks: all pass except the one set aside below. Changes outside the roadmap folder: none.
- Pull request text read against the head: the change alters nothing the title or description states (suppliers, counts, imports, ownership); no sentence contradicted.
- Overlap check: read RealFunctionsDerivativesAndVariation, GeometricMeasureTheory, DifferentialGeometry; nothing shared (RealFunctionsDerivativesAndVariation names ACG* and VBG* only as lying beyond it; the Dini derivatives, property (N) and the image estimate are owned there and cited here).

Source independence: changed passages only; 2 changed passages of prose (the prose target of §3.1 and the sentence of its route on subsets) compared with 0 sources, because none of the cited texts could be read; largest share Bogachev2007, 15 of 38 locators; contents not compared again (the change adds, removes or reorders no layer).

Research link: The headline is the classical identification of the Henstock–Kurzweil, Perron and restricted Denjoy integrals (Saks 1937, Chapters VI–VIII; Dudley–Norvaiša 2011, §§2.6–2.7), with the Alexiewicz norm and multiplier theory as used in the Stieltjes and several-variable gauge integrals named under the README's "Beyond this roadmap"; this rests on the README.

## Not verifiable

- Bogachev, *Measure Theory* Vol. 1, §5.7 (all locators of Layers 1–2): paywalled; not in the sources cache.
- Dudley–Norvaiša, *Concrete Functional Calculus*, Proposition 2.58, Lemmas 2.59 and 2.62, Theorem 2.65 and definition (2.57): paywalled.
- Bruckner, *Differentiation of Real Functions*, Chapter V: paywalled.
- Thomson, *Real Functions*, Theorems (44.1) and (45.3), §§37–45: paywalled.
- Saks, *Theory of the Integral*, Chapters VI–VIII: no legal copy found.
- The sentence that Isabelle/HOL and HOL Light treat neither ACG* functions nor the Perron integral: not checked.

Automatic checks set aside as false positives: the section comment "Library declarations used in the README" was reported as having no declaration under it; it heads the block of `#check` lines that pin library declarations, which the form rules allow.

## Source issues

- none

## For the human reviewers

- **Not tested.** No cited source could be read legally (Bogachev, Dudley–Norvaiša, Bruckner, Thomson: paywalled; Saks: no legal copy found), so the wording and arrangement comparisons were not made and no locator was checked. Bogachev has the largest share, 15 of 38 locators.
- **Licence.** `Suggested.lean` carries verbatim copies of five definitions (four Dini derivatives, `HasLusinN`) from another open roadmap of the same author, as its docstring says. Project material.
