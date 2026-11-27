# Review of MetrizationTheorems (pull request #3217 at 5e4ae71)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review (the scope sentence on `UniformSpace.metrizableSpace` without T₀) is repaired, and so are both small corrections; the nine changed lines assert nothing false. The new remark in 2.2, that the route uses only local finiteness of the stages and so gives collectionwise normality of paracompact regular spaces, was re-derived step by step and holds. There are no findings, no small corrections and no format notes. The three points for the humans who approve stand as before (scope, the origin of the Munkres numbering, four sources and Munkres unread).

## Previous findings

- R01 — repaired: "metrizability of T₀ uniform spaces with countably generated uniformity (`UniformSpace.metrizableSpace`)" (README line 443), which is the declaration's hypothesis list at the pin.
- C01 — repaired: after the route of 2.2, "the argument uses only that each stage `𝓗 n` is locally finite … So the conclusion also holds when every open cover has a σ-locally finite open refinement" (README lines 215–219); checked true.
- C02 — repaired: "any set of diameter at most `2⁻ⁿ`, in particular a ball of radius `2⁻ⁿ⁻¹` about any point" (README line 109); the ball has diameter at most `2⁻ⁿ`.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Scope sentence on `UniformSpace.metrizableSpace` | indiscrete two-point uniform space; the declaration at the pin | not T₀, so excluded by the sentence now; binders `[UniformSpace X] [IsCountablyGenerated (𝓤 X)] [T0Space X]` | sentence true and equal to the declaration | none |
| 1.2, last route step (diameter) | open ball of radius `2⁻ⁿ⁻¹` in `ℝ`; two points in different members of a stage | ball diameter exactly `2⁻ⁿ` ≤ `2⁻ⁿ`; distance > `2⁻ⁿ` (≥ `3·2⁻ⁿ` − `2·2⁻ⁿ`, strict since the balls are open) | a set of diameter ≤ `2⁻ⁿ` meets at most one member | none |
| 2.2 remark: route with stages only locally finite | each step of the route; `i ≠ j`, `n ≤ k`; `ι = ∅`; indiscrete two-point space | closure of `Q n i` = union of closures (locally finite subfamily); `a ∈ F i` in no such closure (it would meet `F i` and `F j`); `P n i ⊆ Q n j` contradicts `x ∉ closure (Q n j)` | no step uses discreteness of a stage beyond local finiteness | none |
| 2.2 remark: "by 2.1, for a paracompact regular space" | forward direction of 2.1; K-topology | locally finite refinement is σ-locally finite with equal stages; K-topology is not regular, outside the claim | equivalence is 2.1 under the standing regularity of 2.2 | none |
| 2.2 statement (`exists_pairwise_disjoint_open_of_isDiscreteFamily`) | Lean signature against README | `[RegularSpace X]`, σ-discrete refinement hypothesis, closed discrete `F`; unchanged by the diff | README and Lean agree | none |

The rows for the untouched statements stand as in the previous review, of `6be41f6`.

- Source locators checked against the text: none fall in the changed passages (they add no locator); Dydak was searched for the three changed topics and has no passage on them.
- Library declarations opened at the pin: `UniformSpace.metrizableSpace` (`Mathlib/Topology/Metrizable/Uniformity.lean`, line 258), `LocallyFinite.closure_iUnion` (`Mathlib/Topology/LocallyFinite.lean`, line 124).
- Cross-roadmap citations: the README makes none; no file changed outside the folder.
- Dependency check output: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed when rerun on this head. Elaboration: `Suggested.lean` (not changed by the diff) elaborates, `sorry` the only warning (8 theorems).
- Pull-request text read against the head: title and description still agree with it; the diff changes no statement, supplier, section or declaration.
- Overlap check: read SorgenfreyLineAndClassicalCounterexamples, PeanoContinuaAndHahnMazurkiewicz, CantorSetAndCompactMetricSpaces; nothing shared.

Source independence: changed passages only; 3 passages compared with 1 source (Dydak), none shared; largest share Munkres and Dydak, 6 of 19 locators each; arrangement not compared again (the diff adds, removes and reorders no layer); Munkres's text and table of contents could not be read.

Research link: The headline targets are the theorems of Stone (1948), Michael (1953), Bing (1951) and Nagata–Smirnov; Dydak (2003) derives them (Corollaries 3.11, 5.5, 5.6) inside a calculus of partitions of unity used for dimension theory. Rests on the README's references and on Dydak §§3, 5, 6.

## Not verifiable

- Stone 1948, Michael 1953, Bing 1951, Rudin 1969 and Munkres: no legal copy could be read in the previous review; their locators remain unverified. The changed passages cite none of them.

## Source issues

- none

## For the human reviewers

- **Scope.** The headline theorems date from 1948–1953 and are textbook general topology (Munkres ch. 6); the only later source is Dydak's 2003 arXiv paper. Whether this is within "mainstream research mathematics" is yours to decide.
- **Licence.** The References section of the README takes Munkres's theorem numbers from R. Gardner's lecture notes on Munkres (a third party's notes on a book in copyright), not from the book.
- **Not tested.** Munkres shares the largest number of locators (6 of 19, with Dydak); its text and table of contents were not read, so wording and arrangement were compared with Dydak only.
