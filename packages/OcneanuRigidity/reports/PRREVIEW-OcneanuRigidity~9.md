# Review of OcneanuRigidity (pull request #2316 at 8b14477)

**Verdict:** accepted

## Previous findings

- none: the previous review, of `8b14477`, had no finding; its one earlier finding (the §6.8 conjugation quotient) was already recorded as repaired at TauCetiRoadmap/OcneanuRigidity/README.md:887–906.

## Verified sound

| Statement | Instances tried | Computed on one side | Computed on the other | Result / change |
| --- | --- | --- | --- | --- |
| Description: "the comparison of complexes includes the factor (−1)ⁿ⁽ⁿ⁺¹⁾ᐟ² in degree n" against §2.3 (README.md:447–451) and §3.4 (README.md:560–561) | n = 0, 1, 2, 3 | q₀…q₃ = 1, −1, −1, 1; ratios q₁/q₀, q₂/q₁, q₃/q₂ = −1, +1, −1 | Reversal sign (−1)^{n+1} at n = 0, 1, 2: −1, +1, −1 | Agree; description matches the head |
| Description: averaging identity gives a section "without choosing a pivotal structure", normalized by the inverse comparison (§§1.6–1.8, README.md:341–392) | `FDRep ℂ S₃`; `Vec(C₂)` in characteristic 2; `Vec(Q₈)` in characteristic 3 | Summands 1+1+4 = 6; 1+1 = 2 = 0; 8 = 2 | Section factor 1/6; none exists (0 not invertible); 2, with 2·2 = 4 = 1 | Agree with §1.8 Checks; the nonvanishing hypothesis of the description is the one used |
| Description: "five characteristic-zero finiteness headlines on native category carriers … no auxiliary half-braiding stand-in" against `Suggested.lean` | Declarations counted; `CharZero` binders counted; non-theorem declarations counted | 5 theorems, each with `[CharZero k]`; 0 `def`, `structure`, `instance` or `abbrev` | Description lists five: fusion families, braidings, braided fusion families, fixed-rank and indecomposable module families | Agree |
| Description: supplier list against README.md:151–160 and main | PivotalSpherical 3.3, 6.1, 6.2, 6.9, 11.1, 11.2; PresentationsOfMonoidalCategories Layers 0–6; SchemeAndStackFoundations §4.2; CategoricalOperatorAlgebras CA6 | Headings on main: PivotalSpherical lines 215, 272, 282, 359, 543, 562; Presentations Layers 0–6 at lines 153–457; CA6 at line 1208 | README contract names the same six sections, Layers 0 to 5 and 6, §4.2 and CA6; Radford and pivotalization at PivotalSpherical 6.7, 6.8 (lines 331, 349) | All resolve on main; nothing dropped or added |

Rows for the untouched statements, the seeded sample and the headline theorems stand as in the previous review, of `8b14477`.

- Change since `8b14477`: 0 lines in the folder, 0 files outside it; 0 statements, layers or supplier contracts changed, so 0 seeded sample targets fall in a changed passage.
- Pull request text: title and 7 prose paragraphs read against the head; 14 claims compared (generality of the vanishing theorem, the three consequence bullets, the characteristic-zero form, face convention and sign, the averaging section, `[Nontrivial R]` for 6.3–6.4, the rigidity criterion for 6.5–6.8, four supplier citations, five headlines, the docstring's four not-statable items); 0 contradicted, 0 changes left unstated (10 layers, each with Examples and Dependencies; 5 declarations added, 0 removed).
- Remark, no change asked: the description's "supplied by the revision in #2311, which must merge first" and "(#2308)" name prerequisites that are both on main now (main's last two commits); the ordering condition is met, and the generated `depends-on` and `merge-order` blocks are outside this check.
- Cross-roadmap citations resolved on main: 9 section ids across 4 roadmaps, 0 missing; 0 ids cited that only an open revision defines.
- Lean: `Suggested.lean` elaborated at the pins with exactly 5 `sorry` warnings and no other message; signatures as in the previous review, 0 lost binders.
- Gate: the worker's gate at this head passes every check (build included). Rerun with the candidate merge order: `depcheck: 245 roadmaps, 2207 edges, 0 problem(s)`, 0 UPWARD or CYCLE lines. Without that order the only line is `depcheck: NOT IN ORDER: OcneanuRigidity (insert it after its last supplier)`, the permitted insertion case.

Overlap check: read PresentationsOfMonoidalCategories, PivotalSpherical and CategoricalOperatorAlgebras on main; F/R presentations, models, gauge and classification belong to PresentationsOfMonoidalCategories, fusion foundations, squared norms and absolute induction to PivotalSpherical, the unitary relative centre to CategoricalOperatorAlgebras CA6; nothing has two owners.

Source independence: changed passages only; 0 passages of the folder changed, so 0 compared with 0 sources; the description's prose reuses no source text. Largest share GHS, 18 of 49 body citation occurrences, as in the previous review; no layer added, removed or reordered, so the contents comparison stands as there.

## Not verifiable

- BarrBeck §§1, 4: settled as uncertified, cited by locator only; untouched by this round.

## Source issues

- none

## For the human reviewers

- none
