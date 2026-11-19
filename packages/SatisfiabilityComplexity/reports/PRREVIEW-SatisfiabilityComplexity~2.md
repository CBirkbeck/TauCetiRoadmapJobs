# Review of SatisfiabilityComplexity (pull request #2521 at 4ddeaa7)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review, the unstated second owner of the composition of polynomial-time machines, is repaired by the new paragraph of "Scope and ownership", which was checked against section 1.2 of CertifiedPermutationComputation at its head. The new subsumption bullet of 3.1 is true (proved by hand and tested on 4963 small instances) and the two repaired Checks are correct. There are two small corrections and one format note, none blocking; the three points for the human reviewers stand.

## C01 — The subsumption bullet of 3.1 covers width and tree size, but the induction of 3.3 restricts a refutation in sequence form and counts its fat clauses

The *Needs:* line of 3.3 (line 385) now reads "3.1 (with its subsumption bullet)" and no longer cites the supplier's lemma. The argument of 3.3 restricts a list `L` with `IsDerivation F L` by a literal and needs that the result has no more clauses of width above `d` than `L`. The bullet (lines 295–301) gives this for `WidthDerivable` and for `TreeDerivable` only: a width bound does not count fat clauses, and passing through trees costs up to `2^m − 1` nodes. The statement needed is true by the same induction, position by position: if every clause of `S` has a subset in `T` and `IsDerivation S L`, there is `L'` of the same length with `IsDerivation T L'` whose `i`-th clause is a subset of the `i`-th clause of `L` (each entry is a clause of `T`, a copy of an earlier entry, or a resolvent of two earlier ones). Adding this as a third clause of the bullet would make the reference of 3.3 exact.

## C02 — In the first Check of 5.2 only the reduction of the empty language uses the injectivity of `encodeCNF`

Line 638 says "both use the injectivity of `encodeCNF` (5.1)". The constant `encodeCNF [[]]` needs it (its code must be the code of no satisfiable presentation). The constant `encodeCNF []` does not: `encodeCNF []` is in `satLang` by definition, since `cnfOfLists []` is the empty formula. The sentence would be right as "the first uses the injectivity of `encodeCNF` (5.1), the code of `[[]]` being the code of no other presentation; the second that the empty formula is satisfiable".

## N01 — "(an open roadmap, not on main)" will be out of date

In "Scope and ownership" (line 822) the parenthesis describes the state of another roadmap on one day. The sentence reads the same without it; the pull request description is the place for that state, and already has it.

## Previous findings

- R01 — repaired: "CertifiedPermutationComputation […], in its section 1.2, plans the same two facts as data […]. The first bullet of 4.1 is their propositional form: it […] does not ask for a second one." Agrees with that section at its head.
- C01 (small correction) — partly repaired: 3.1 has the bullet "subsumption with width and size", and 3.2 and 3.3 point at it; 3.2 is covered, the sequence form used by 3.3 is not (C01 above).
- C02 (small correction) — repaired, with a residual imprecision: "both use the injectivity of `encodeCNF` (5.1): the code of `[[]]` is the code of no other presentation, and the empty formula is satisfiable" (C02 above).
- N01 (format note) — repaired: the References name Aspvall–Plass–Tarjan, Cook, Haken, Levin, Lewis and Schaefer "for attribution and not consulted".
- N02 (format note) — repaired: "(the assignment that is true exactly on the variables of the clause is in the set, and it falsifies a clause with no positive literal)".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 3.1 subsumption with width | hand induction on `resolve C D l = C.erase l ∪ D.erase ¬l`; 300 random pairs `S`, `T` on 3 variables, `w = 0,1,2,3,6` | `l ∉ C'` gives `C' ⊆ C.erase l`; else `resolve C' D' l ⊆ resolve C D l`, card ≤ `w`; 4963 derivable clauses, 0 failures | true | none |
| 3.1 subsumption with tree size | same instances, least node counts; base and step | base `1 ≤ 1`; kept premise `s₁' ≤ s₁ < s₁+t₁+1`; resolved `s₁'+t₁'+1 ≤ s₁+t₁+1`; 0 failures of `s' ≤ s` | true | none |
| 3.2 `widthDerivable_of_treeDerivable` (route) | restriction of a tree refutation by `x` | node count not increased by the tree clause of the bullet; statement unchanged | route supported by 3.1 | none |
| 3.3 `widthDerivable_of_isDerivation` (route) | restriction of a list `L`, fat clauses | needs a list `L'` of equal length with entrywise subsets; bullet gives width and tree size only; trees cost `2^m − 1` | statement unchanged and true; reference inexact | C01 |
| 1.3 last Check (`V = ℕ`) | clause `{¬x, ¬y}`, clause `∅`, a clause with a positive literal | assignment true on `{x, y}` falsifies it; all-false falsifies `∅`; constant `true` satisfies the third kind; majority of finite supports is finite | true | none |
| 5.2 first Check | `L = ∅`, `L` = all strings | `encodeCNF [[]] ∉ satLang` needs injectivity (`cnfOfLists [[]] = {∅}`); `encodeCNF [] ∈ satLang` by definition | reductions correct; wording | C02 |
| 4.1 first bullet against CertifiedPermutationComputation 1.2 | that section at its head | it plans the bound `m + maxPushes · t`, monotone evaluation, the composite machine with an explicit polynomial; here only `Nonempty` | the stated relation is accurate | none |

The rows of the previous review, of `044d483`, stand for every statement not listed here: the change touches no Lean statement and no other target.

- Changed passages read in full: 7 (1.3 Check, 3.1 bullet, 3.2 route and *Needs:*, 3.3 *Needs:*, 5.2 Check, the scope paragraph, the References entry); `Suggested.lean` is unchanged since `044d483`.
- Cross-roadmap citations resolved: PropositionalSatisfiability 3.1 (the subsumption lemma is stated for `Derivable` only, as the new bullet says) and 1.2 at the head of its pull request; CertifiedPermutationComputation 1.2 at the head of its pull request.
- Declarations opened: `resolve`, `Derivable`, `IsDerivation`, `WidthDerivable`, `TreeDerivable` in `TauCetiRoadmap/SatisfiabilityComplexity/Suggested.lean` (lines 78–93, 170–180); the README bullet agrees with these definitions.
- Elaboration of `TauCetiRoadmap/SatisfiabilityComplexity/Suggested.lean`: 17 warnings, all `sorry`, for 17 theorems; no error; single `import Mathlib`; no `set_option`.
- Automatic checks: all passed. Dependency check: `depcheck: 200 roadmaps, 2188 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Seeded sample: of its targets the change touches 1.3, 3.1, 3.2, 3.3 and 5.2 (rows above); no source locator was added or changed.
- Changes outside the folder: none. The title and description agree with this head; the description already states the relation to CertifiedPermutationComputation.

Overlap check: read PropositionalSatisfiability (open, #2506), CertifiedPermutationComputation (open, #717), ComputabilityTheory (main); clause sets, resolution and the subsumption lemma for `Derivable`: owner PropositionalSatisfiability, cited; the composite machine and the output-length bound as data: CertifiedPermutationComputation 1.2, and this roadmap keeps only the propositional form in 4.1, stated as such; nothing shared with ComputabilityTheory.

Source independence: changed passages only; 3 passages compared with 1 source (the proof plan of 3.2 and the *Needs:* lines of 3.2 and 3.3 against BSW99, as read in the previous review), none shared; largest share AroraBarak07, 13 of 22 locators; no layer added, removed or reordered, so the comparison of contents stands: independent.

Research link: Layer 3 states the width–size relations of Ben-Sasson and Wigderson (1999) and the pigeonhole bound of Haken (1985) in the form of Beame, Karp, Pitassi and Saks (2002), the basic tools of resolution lower bounds; Layer 5 is the Cook–Levin theorem. Rests on the README's sources BSW99 and BKPS02 and its "Downstream consumers".

## Not verifiable

- The six works now listed "for attribution and not consulted": their bibliographic data were not opened; the README itself says they were not read.
- The two open Mathlib pull requests the description names for the composition as data were not opened.
- The items of the previous review (Haken's original bound, the OCR of BSW99, the numbering of the published Arora–Barak book) are unchanged.

## Source issues

- none

## For the human reviewers

- **Licence.** The source with most locators, AroraBarak07, is the authors' January 2007 web draft; its title page (AroraBarak07 line 14) says it is not to be reproduced or distributed without permission. The README cites its numbering, not the published book's.
- **Scope.** The README now says the composite machine is built once, as data, by whichever of CertifiedPermutationComputation (#717) and this roadmap is implemented first; neither is in the merge order. Whether to fix one owner is a human decision.
- **Scope.** `TauCetiRoadmap/SatisfiabilityComplexity/metadata.toml` records the topic `math.LO`; the sources are complexity theory and proof complexity.
