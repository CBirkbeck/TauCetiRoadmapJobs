# Review of ImaginaryQuadraticClassNumber (pull request #2593 at be58763)

**Verdict:** accepted

**Summary.** Accepted: no finding. The two lines added since the previous review put an inline anchor with the former id of the §3.1 heading before that heading, which repairs the one remark of the previous review; no statement, Check or Lean declaration changed. One small correction, not blocking: the description still says that links to the old §3.1 anchor land at the top of the README, which this head makes untrue. Three facts are left for the human reviewers, as before.

## C01 — The description says links to the old §3.1 anchor land at the top of the README; at this head they resolve

The description's paragraph "What changes in form" reads: "the heading anchors change, so a link to an old anchor, such as the one of §H3.1 that two open roadmaps use, lands at the top of the README". The head now has, at README line 634 directly before `### 3.1`, an anchor with the id `h31-modular-functions-and-the-imaginary-quadratic-cm-dictionary`, which is the id the heading `### H3.1. Modular functions and the imaginary-quadratic CM dictionary` has on main (main README line 104), so the links from ArithmeticStatisticsPartVII (README line 2518) and ComplexMultiplicationAndExplicitReciprocity (README lines 131 to 673) reach §3.1. A reader of the description would expect those links to be broken.

Text that would be right: "the heading anchors change; the old anchor of §H3.1, the only one other roadmaps link to, is kept as an inline anchor before §3.1, and a link to any other old anchor lands at the top of the README."

## Previous findings

The previous review, of `1eb5b47`, had no finding (no R-numbered point) and no small correction. Its one other remark:

- N01 — repaired: README line 634, `<a id="h31-modular-functions-and-the-imaginary-quadratic-cm-dictionary"></a>`, stands before `### 3.1`; the id equals the old heading's, occurs once, and is the only old anchor other roadmaps link to. The repair introduced C01.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §3.1, Check on `τ_(−3)` (the section the new anchor heads; the diff changes no statement) | `τ = (3 + i√3)/2`; `i√3/2` | trace 3, norm (9 + 3)/4 = 3, so `X² − 3X + 3`; `(−1 + i√3)/2 + 2 = (3 + i√3)/2`; `4X² + 3`: discriminant 0 − 48 = −48 | true | none |
| §3.1, Check on `[K_(2) : H_K]` for 2 inert | `D ≠ −3`; `D = −3` | `#𝔽₄ˣ = 3`, image of `±1` trivial, degree 3/1 = 3; six units onto `𝔽₄ˣ` of order 3, degree 3/3 = 1 | true | none |
| The new anchor id against the old heading on main | old heading `### H3.1. Modular functions and the imaginary-quadratic CM dictionary` | lower-cased, punctuation dropped, spaces to hyphens: `h31-modular-functions-and-the-imaginary-quadratic-cm-dictionary`; the README's id is the same string, one occurrence | equal | none |

The rows for the untouched statements stand as in the previous review, of `1eb5b47`.

- Changed passages: 2 inserted lines (README lines 634–635: one inline anchor and a blank line); no path outside the folder changed (the diff against the base outside the folder is empty).
- Cross-roadmap links to this README with a fragment, searched at every open head and on main: one fragment only, the old §3.1 anchor, used by ArithmeticStatisticsPartVII (1 link) and ComplexMultiplicationAndExplicitReciprocity (10 links); all now resolve.
- Lean: `Suggested.lean` elaborates with six `sorry` warnings and nothing else; the file is unchanged since `1eb5b47`.
- Dependency check: `depcheck: 182 roadmaps, 2081 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. The automatic checks on this head all passed.
- Description against the head: read again; one sentence contradicted (C01), nothing else changed by the two lines.
- Source locators: none in the changed passage; the seeded sample (§§1.1–3.6) falls in untouched text, verified in the earlier reviews. Library declarations opened this round: none (the change names none).

Overlap check: read QuadraticCharactersAndReduction and AnalyticNumberTheoryPartI on main, EffectiveClassNumbers and ComplexMultiplicationAndExplicitReciprocity at their open heads (scopes as in the previous review; the change touches no ownership). `χ_D`: owned by the pinned Tau Ceti library, consumed here and by QuadraticCharactersAndReduction. Siegel's ineffective bound, the class-number-one theorem, the CM dictionary of §3.1: owned here, cited by EffectiveClassNumbers and ComplexMultiplicationAndExplicitReciprocity. Effective bounds of Goldfeld's type: EffectiveClassNumbers. Complex uniformization: ModularForms §10D and ModularCurvesPartII §1.1, consumed here.

Source independence: changed passages only; 0 passages compared (the change is an HTML anchor, no prose); largest share shin2010, 14 of 22 locators; contents not compared again (no layer added, removed or reordered; independent in the earlier review).

Research link: Siegel's theorem (1935, via Davenport Chapter 21) and the Heegner–Stark class-number-one theorem (Heegner 1952, Stark 1967 and 1969) proved by Shin's Siegel-function route (2010); consumed by EffectiveClassNumbers and ComplexMultiplicationAndExplicitReciprocity. Rests on the README's References and Downstream consumers and on shin2010 lines 61–66.

## Not verifiable

- davenport1980, Chapters 6 and 21 (§§2.1–2.4): settled as uncertified; not opened.
- stark1969 (§3.3) and Stark 1967: settled as uncertified or no legal open copy; not opened.
- Cox, *Primes of the Form x² + ny²*, Theorems 7.7 and 7.24 (§§1.3–1.4): no legal open copy; not opened.

Automatic checks set aside as false positives: none failed; the listing of Lean declarations added against main reports one, `of`, that does not exist: it is the word after "theorem" in the module docstring of the Lean file.

## Source issues

- none

## For the human reviewers

- AnalyticNumberTheoryPartI on main says the effective forms of this roadmap's §§2.3–2.4 follow from its own exclusion of Landau–Siegel zeros, an open problem; this README states no effective form and relies on none (Scope).
- The group isomorphism `ℂ/Λ ≅ E_Λ(ℂ)` is stated by two roadmaps on main, ModularForms §10D and ModularCurvesPartII §1.1; this README consumes both (§3.1).
- Davenport, Stark 1967/1969 and Cox could not be read, so the wording of §§1.3–1.4 and Layer 2 was not compared with them; shin2010, the source with the largest share, was read in full in an earlier review.
