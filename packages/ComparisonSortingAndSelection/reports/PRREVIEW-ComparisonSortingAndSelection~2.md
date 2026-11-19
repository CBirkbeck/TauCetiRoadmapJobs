# Review of ComparisonSortingAndSelection (pull request #2522 at 90604dd)

**Verdict:** accepted

**Summary.** Accepted, on an incremental re-review of the 10 lines changed since `c77dad1`. The one earlier finding is repaired: the route of the standard-form theorem (4.4) now gives the correct reason why a standardising step keeps the depth, and that reason was recomputed on 28773 steps without a failure. There are no findings and no small corrections, and one format note on wording, which does not block. The two questions for the human reviewers, on scope and on licences, stand as before.

## N01 — The parenthesis in the route of 4.4 reads as a universal statement

In the route of 4.4 (README line 461): "(A step does not keep the pairs of positions that share a wire.)" A step may keep them: the step of the first Check of 4.4, from `(1,0), (0,1)` to `(0,1), (0,1)`, does, and so did 19669 of 28773 random steps (9104 changed them). "A step need not keep …" would say what is meant.

## Previous findings

- R01 — repaired: "immediately after the comparator the wires `i` and `j` have the same depth, so exchanging them in the later comparators exchanges the final depths of these two wires and changes no other, and the largest value is the same."
- N01 (previous format note) — repaired: the references now name "the files `notes/12-lowerbounds.pdf` and `notes/13-adversary.pdf`", which are the two files the locators were read in.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 4.4 route: a step keeps length and depth, and exchanges the final depths of wires `i`, `j` only | 28773 steps on 20000 random networks, 2–5 wires; `(0,1),(2,1),(1,3)` + four-wire sorter; `(1,0),(0,1)` | after the comparator, depths of `i`, `j` equal in all steps; final depth vector = old one with entries `i`, `j` exchanged, 0 failures; depth `6 → 6`; `2 → 2` | holds | none |
| 4.4 `Network.exists_isStandard_sorts` (statement cited by the changed route) | 10885 random networks sorting `Bool`, 2–5 wires, reduced by the full route; `(0,0)` on one wire | result standard, sorts all 0–1 inputs, same length, same depth, every time; one wire: length `1 > 0`, so only `≤` | holds | none |
| 4.4 parenthesis: shared pairs not kept | same 28773 steps; Check `(1,0),(0,1)` | 9104 steps change the set of sharing pairs, 19669 keep it; Check: `{(1,2)}` before and after | true as "need not" | N01 |

The rows for the untouched statements stand as in the previous review, of `c77dad1`.

- Changed passages: two (the route of 4.4, the first reference); no statement, heading, `*Needs:*` line, supplier or Lean declaration changed; nothing changed outside the folder.
- Source locators checked: the Erickson reference against the source headers (Erickson12 line 2, Erickson13 line 2: the two file names agree). The route of 4.4 is the roadmap's own; its "compare" to Knuth §5.3.4 is unchanged and not readable.
- Library declarations: `Network.wireDepth` and `Network.depth` in `TauCetiRoadmap/ComparisonSortingAndSelection/Suggested.lean` lines 198–203 read against the new sentence: a comparator sets both its wires to one more than the larger depth, as the route uses.
- Dependency check: `depcheck: 200 roadmaps, 2188 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with 22 `sorry` warnings and nothing else (file unchanged since `c77dad1`).
- Automatic checks: all passed at this head.
- The pull request's title and description were read against this head: no sentence is contradicted, and the change (a proof-route sentence and two file names) alters nothing they describe.
- Overlap check: read PseudolineArrangementsAndOrientedMatroids, BooleanFunctionAnalysis, ComputabilityTheory; nothing shared (as in the previous review; the overlap lists are unchanged and no open pull request touches this roadmap).

Source independence: changed passages only; 2 passages compared with 2 source texts (Erickson12, Erickson13), none shared (the route of 4.4 has no counterpart in the open sources); largest share Lang's pages, 8 of 25 locators; no layer added, removed or reordered, so the arrangement was not compared again: independent as in the previous review.

Research link: the headline targets are the classical results of Ford and Johnson (1959), Kislitsyn (1964), Batcher (1968) and de Bruijn (1974), as the README's references name them. The README names no current line of research that uses them; scope flagged to the human reviewers.

## Not verifiable

- Knuth, *The Art of Computer Programming*, Volume 3, §5.3.4 (cited as "compare" beside the changed route of 4.4): no legal open copy; not read.
- The other items of the previous review (Knuth §5.3.2, the papers of Batcher, de Bruijn, Ford and Johnson, and Kislitsyn, the exact value `5` for merging two with four) are untouched by the change and were not looked at again.

## Source issues

- **Misprint** in CMU451L6 at §6.4, printed page 31: the source says the low-order term is `1.433n` one line after writing `1.443n`; it should be `1.443n` (`lg e ≈ 1.4427`); affects nothing.
- **Misprint** in CMU451L6 at §6.4.2, printed page 32: the source says there are `n` possible answers for the location of the minimum element, in the section on the maximum; it should be the maximum element; affects nothing.

## For the human reviewers

- **Scope.** Every locator goes into lecture notes (Erickson; CMU 15-451, which name no author) or web pages (Lang). The refereed papers and Knuth §5.3 are cited without locators and were not consulted. The subject is textbook material; the README names no later theory using it.
- **Licence.** Erickson's notes carry a Creative Commons non-commercial share-alike licence (Erickson12 line 50); Lang's pages and the CMU notes state none. Only locators and restated facts are used; no table, figure, exercise list or program is taken over.
