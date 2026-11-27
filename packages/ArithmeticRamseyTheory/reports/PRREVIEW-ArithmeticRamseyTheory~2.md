# Review of ArithmeticRamseyTheory (pull request #3218 at 7903478)

**Verdict:** needs changes

**Summary.** Needs changes, for one clause: the sentence added to 3.4 says the new bound on `a + k d` constrains `d` when `k ≤ 1`, which is false at `k = 0` (the bound is then on `a` alone). Everything else the change touches is sound: the five small corrections of the previous review are repaired, the new bounded form of Rado's theorem and the four restated theorems were instantiated at their degenerate cases and elaborate. There are two format notes, carried over, and the four points for the human reviewers stand.

## R01 (P2) — For `k = 0` the bound `a + k d ≤ mpcNumber 2 k 1 κ` does not constrain `d`

The clause added to 3.4 (README lines 300–301) reads "the bound on `a + k d` constrains `d` also when `k ≤ 1`". At `k = 0` the bound is `a + 0 · d = a ≤ mpcNumber 2 0 1 κ`, and the colour condition `∀ j < 0` is empty, so `d ≥ 1` is arbitrary: with `mpcNumber 2 0 1 κ = 1` for nonempty `κ` (the set is `{x₁, x₂}`, take `x₁ = x₂ = 1`), the pairs `(a, d) = (1, d)` all satisfy the statement. A reader is told the theorem says something about `d` at `k = 0` when it does not. The theorem itself is true for every `k`, and the clause is right at `k = 1` (`a + d ≤ mpcNumber 2 1 1 κ`). The previous review's C03 made the same slip ("bounds `d` for every `k`"); the correct range is `k ≥ 1`.

Smallest change: write "constrains `d` also when `k = 1`" (or "for every `k ≥ 1`"). The Lean statement needs no change.

## N01 — Names in code font that `Suggested.lean` does not declare

The Conventions now say that such a name is the proposed name of a README target, which tells a reader how to read them; `hjNumber_congr`, `vdWNumber_congr`, `mpcSet_smul`, `mpcRowMonoNumber_one` and `columnsCondition_iff_exists_le_card` are still in code font and undeclared. Writing them as prose ("a lemma we call …") would remove the need for the convention.

## N02 — Auxiliary lemmas remain in `Suggested.lean`

The bounded form of Rado's theorem is now stated. `vdWNumber_two`, `mpcSet_comp_orderEmbedding`, `lt_of_mpcSet_pos`, `finsetSum_mem_mpcRow`, `IsFinUnionsBound.mono` and `orderedProd_biUnion` are API rather than headlines and would sit as well in the README alone.

## Previous findings

The previous review, of `131ee1a`, had no finding (R); its small corrections and format notes are accounted for here.

- C01 — repaired: "here all four of `x₁ − x₂, x₂, x₁, x₁ + x₂` must have one colour, not only the three entries of the solution" (5.3, second Check); the Worked examples no longer say "sharper".
- C02 — repaired: `ColumnsCondition.exists_mpc` now concludes `1 ≤ p ∧ 1 ≤ c`, as the README's "`p, c ≥ 1`".
- C03 — repaired in the statement (`a + k d ≤ mpcNumber 2 k 1 κ` in README and Lean); the explanatory clause added with it is false at `k = 0` (R01).
- C04 — repaired: `[Finite κ]` dropped from both block-product theorems and from the README item of 4.4.
- C05 — repaired: Provenance names only openai/math; the unnamed second development is gone.
- N01 — partly repaired: the Conventions explain undeclared names in code font; five remain (N01).
- N02 — partly repaired: `ColumnsCondition.exists_mono_solution_le` is stated; the auxiliary lemmas remain (N02).
- N03 — repaired: "prototype", "not consulted" and "no locator given" are removed.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 3.4 Brauer, `a + k d ≤ mpcNumber 2 k 1 κ` | `k = 0`; `k = 1`, 2 colours; `k ≥ 1` by the route; `κ` empty | `k = 0`: set `{x₁, x₂}`, number `1`, `a = 1`, `d` free; `k = 1`: `a = d = 1`, `2 ≤ 17`; set contains `x₂`, `x₁ + k x₂`, so `x₁ > k x₂ > 0`; no `χ` | statement true; clause false at `k = 0` | R01 |
| 4.4 block products without `[Finite κ]` | infinite `κ`; `m = 0`; `(ℕ, +)`, `aᵢ = 1` | hypothesis applied to `A ↦ χ (orderedProd a A)` uses no finiteness; no nonempty `I`; block sums `#Dⱼ` | true | none |
| 5.3 `exists_mpc` with `1 ≤ p` | no columns; Schur | `t = 0`, `p = c = 1`, `y` empty; `t = 2`, `p = c = 1`, `y = (x₁ − x₂, x₂, x₁)`, `y₁ + y₂ − y₃ = 0` | true (`p = max |c d_{is}| ≥ c ≥ 1`) | none |
| 5.3 `exists_mono_solution_le` (new) | `κ'` empty; no columns; Schur with 2 colours; zero matrix | no `χ`; `x` empty; `t = 2`, `p = c = 1`, entries `≤ 17`, positive since the set lies in `[1, 17]`; `t = 1`, one block summing to `0` | true; `t, p, c` fixed before `κ'`, so the bound is uniform | none |
| 5.3 second Check | `mpcSet 1 1 (x₁, x₂)` | rows `{x₁ − x₂, x₁, x₁ + x₂}`, `{x₂}`: four elements, the solution uses three | true | none |

The rows of the previous review, of `131ee1a`, stand for the statements this change does not touch.

- Source locators: the change adds and alters none; the 22 checked in the previous review stand.
- Library declarations: none newly cited by the change.
- Cross-roadmap citations in changed passages: RamseyNumbers 6.1 and its Check (main), resolved; none found nowhere.
- Elaboration: `Suggested.lean` elaborates with 34 `sorry` warnings and nothing else. `#check` of the new theorem and of the additive forms of the two block theorems: no `Finite κ` binder remains there, `κ'` ranges over `Type`.
- One-tactic probe on a copy: `exists_mono_ap_and_diff`, both block-product theorems, `exists_mpc` and `exists_mono_solution_le` do not close with `rfl`, `simp`, `tauto` or `simp_all`.
- Dependency check: `depcheck: 56 roadmaps, 557 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: one failed, on five names in code font that are not declared (N01); it is real and is form.
- Pull request text: title and description agree with this head; no file changed outside the folder.

Overlap check: read RamseyNumbers, SidonSetsAndLinearEquations, LovaszLocalLemma; nothing shared (as in the previous review; the change adds no object).

Source independence: changed passages only; 6 passages compared with 2 sources (chua2017, sanders1968), none shared; largest share chua2017, 19 of 22 locators; no layer added, removed or reordered, so the comparison of contents with chua2017 stands: independent.

Research link: Layers 1 and 4 (simultaneous Ramsey, Folkman) are the inputs of Alweiss (2023), monochromatic sums and products over ℚ, toward Hindman's 1979 question; Layers 3 and 5 are Deuber's (1973) `(m, p, c)`-sets and Rado's (1933) theorem. Rests on the README and on alweiss2023 lines 617–651.

## Not verifiable

- Graham–Rothschild–Spencer, Rado 1933 and 1970, Deuber 1973, Brauer 1928, van der Waerden 1927, Hindman 1979: named for attribution, with no locator; not fetched.
- The openai/math file named under Provenance (`OAI/Analysis/MarkovType/FiniteRamsey.lean` at `adc7f124`): the repository did not resolve, so 1.2 and 1.3 were not compared with it.

## Source issues

- none (none new; those of the previous review stand)

## For the human reviewers

- **Scope.** 19 of the 22 locators point into chua2017, unpublished notes of a 2017 Cambridge lecture course whose first page says the lecturer has not endorsed them; the refereed sources (Graham–Rothschild–Spencer, Rado, Deuber) are named without locators.
- **Licence.** chua2017 was read from the note-taker's own page; the lectures are B. P. Narayanan's. Whether that page is the right legal source is yours to decide.
- **Licence.** README Provenance says 1.2 and 1.3 were formalised in openai/math (Apache-2.0, `adc7f124`); that repository could not be read, so agreement of names and statements with it was not tested.
- **Status.** The pull request is still a draft; its description says the author's own read-through is pending.
