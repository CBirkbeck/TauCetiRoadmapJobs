# Review of ArithmeticRamseyTheory (pull request #3218 at d950df0)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired. The clause in 3.4 now says the bound on `a + k d` constrains `d` for every `k ≥ 1`, which is true (`a ≥ 1` gives `d ≤ (mpcNumber 2 k 1 κ − 1) / k`), and nothing else in the folder changed. Two format notes are carried over, neither blocking; the four points for the human reviewers stand.

## N01 — Names in code font that `Suggested.lean` does not declare

`hjNumber_congr`, `vdWNumber_congr`, `mpcSet_smul`, `mpcRowMonoNumber_one` and `columnsCondition_iff_exists_le_card` are in code font in the README and declared nowhere; the Conventions say such a name is a proposed name of a README target. Writing them as prose ("a lemma we call …") would let a reader tell a proposal from a declaration without the convention.

## N02 — Auxiliary lemmas remain in `Suggested.lean`

`vdWNumber_two`, `mpcSet_comp_orderEmbedding`, `lt_of_mpcSet_pos`, `finsetSum_mem_mpcRow`, `IsFinUnionsBound.mono` and `orderedProd_biUnion` are API rather than headlines and would sit as well in the README alone.

## Previous findings

- R01 — repaired: "the bound on `a + k d` constrains `d` for every `k ≥ 1`" (3.4, README lines 300–301). The repair introduces no new problem; the Lean statement is unchanged.
- N01 — not repaired: the five names remain in code font and undeclared (N01 above; form only).
- N02 — not repaired: the six auxiliary lemmas remain in `Suggested.lean` (N02 above; form only).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 3.4 Brauer, `a + k d ≤ mpcNumber 2 k 1 κ`, with the clause "constrains `d` for every `k ≥ 1`" | `k = 0`; `k = 1`; general `k ≥ 1`; `κ` empty; route | `k = 0`: bound is `a ≤ 1`, `d` free, and the clause no longer claims otherwise; `k = 1`: `d ≤ N − 1`; `k ≥ 1`: `a ≥ 1` gives `d ≤ (N − 1)/k`; no `χ`; set contains `x₂`, `x₁ + j x₂` for `|j| ≤ k`, all in `[1, N]` | statement and clause true | none |

The rows of the previous review, of `7903478`, stand for the statements this change does not touch (the change touches no statement, only the clause above).

- Source locators: the change adds and alters none. The locator of 3.4 (Chua, §3, p. 27) sits in the changed paragraph but is itself unchanged; it could not be read again at this round (see Not verifiable).
- Library declarations: none newly cited by the change.
- Cross-roadmap citations in the changed passage: none.
- Elaboration: `Suggested.lean` elaborates with 34 `sorry` warnings and nothing else; `exists_mono_ap_and_diff` (line 175) agrees with the README: `1 ≤ a`, `1 ≤ d`, `a + k * d ≤ mpcNumber 2 k 1 κ`, `∀ j < k, χ (a + j * d) = χ d`, with `[Finite κ]`.
- Dependency check: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: one failed, on five names in code font that are not declared (N01); it is real and is form.
- Pull request text: the title and description do not describe the clause changed and agree with this head; no file changed outside the folder.
- Padding probe: no statement changed since `7903478`; the probe of the previous review stands.

Overlap check: read RamseyNumbers, SidonSetsAndLinearEquations, LovaszLocalLemma; nothing shared (as in the previous review; the change adds no object, and the overlap listing shows no other pull request changing this roadmap and no dropped id).

Source independence: changed passages only; 1 passage (the clause of 3.4) compared with 0 sources, since chua2017 could not be read at this round; the clause is the roadmap's own remark on its own bound and has no counterpart to copy; largest share chua2017, 19 of 22 locators; no layer added, removed or reordered, so the comparison of contents of the earlier review stands: independent.

Research link: Layers 1 and 4 (simultaneous Ramsey, Folkman) are the inputs of Alweiss (2023), monochromatic sums and products over ℚ, toward Hindman's 1979 question; Layers 3 and 5 are Deuber's (1973) `(m, p, c)`-sets and Rado's (1933) theorem. Rests on the README and on alweiss2023 lines 617–651.

## Not verifiable

- chua2017, p. 27 (the locator of 3.4): the sources service refused the note-taker's page at this round (the address names no author of the work), and no other legal copy was found; the locator is unchanged since the reviews that read it.
- Graham–Rothschild–Spencer, Rado 1933 and 1970, Deuber 1973, Brauer 1928, van der Waerden 1927, Hindman 1979: named for attribution, with no locator; not fetched.
- The openai/math file named under Provenance (`OAI/Analysis/MarkovType/FiniteRamsey.lean` at `adc7f124`): not compared with 1.2 and 1.3, as in the previous review.

## Source issues

- none

## For the human reviewers

- **Scope.** 19 of the 22 locators point into chua2017, unpublished notes of a 2017 Cambridge lecture course whose first page says the lecturer has not endorsed them; the refereed sources (Graham–Rothschild–Spencer, Rado, Deuber) are named without locators.
- **Licence.** chua2017 is the note-taker's copy of B. P. Narayanan's lectures, on the note-taker's page; the sources service did not accept that page at this round. Whether it is a legal source is yours to decide.
- **Licence.** README Provenance says 1.2 and 1.3 were formalised in openai/math (Apache-2.0, `adc7f124`); that repository was not read, so agreement of names and statements with it was not tested.
- **Status.** The pull request is still a draft; its description says the author's own read-through is pending.
