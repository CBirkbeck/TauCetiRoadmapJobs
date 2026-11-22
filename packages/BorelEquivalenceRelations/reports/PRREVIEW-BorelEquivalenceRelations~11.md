# Review of BorelEquivalenceRelations (pull request #1616 at 6577aa7)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 15 README lines changed since `ab52752`: the four reversed "above"/"below" pointers now point the right way, the description states the reordering of the README, and 0.1 again carries the consequence that a nonempty perfect Polish space contains a Cantor copy and has cardinality 𝔠, which holds at the pins from the two declarations it names. There are no small corrections and no format notes. Two licence questions remain for the human reviewers, as before.

## Previous findings

The previous report (of `ab52752`) had no finding; its two small corrections and its format note are accounted for here.

- C01 — repaired: "the Tau Ceti table under [Exact supplier contracts](#exact-supplier-contracts)" (line 64), "Every layer above is required" (822), "build order above" (867–868), "kind 3 under [How to read the build](#how-to-read-the-build)" (916). Both anchors exist.
- C02 — repaired: the description now says "The README is brought into the repository layout: the scope table and the supplier contracts move after the layers … No layer or item is removed or renumbered."
- N01 — repaired: 0.1 (lines 150–152) reads "a nonempty perfect Polish space contains a Cantor copy and has cardinality 𝔠 (0.4, `Perfect.mk_eq_continuum` applied to the whole space, with Mathlib's `Perfect.exists_nat_bool_injection`)", as on main, with the pointer.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| 0.1 restored clause: nonempty perfect Polish `X` has `#X = 𝔠` (README 150–152) | scratch proof at the pins; `X = ∅`; one point; ℚ; ℕ → Bool | `Perfect univ` from `isClosed_univ` and `PerfectSpace.univ_preperfect`; `Perfect.mk_eq_continuum` then `simpa` closes `#X = 𝔠`. ∅ excluded by nonempty; point not perfect; ℚ not Polish; Cantor: 𝔠 | true as stated |
| 0.1 restored clause: `X` contains a Cantor copy | scratch proof with `upgradeIsCompletelyMetrizable X` | Mathlib's `Perfect.exists_nat_bool_injection` (`[MetricSpace α] [CompleteSpace α]`, `Perfect C`, `C.Nonempty`) gives continuous injective `(ℕ → Bool) → X` | true; attribution to Mathlib correct |
| 0.4 perfect sets and cardinality (sampled; cited by the change) | pin signature of `Perfect.mk_eq_continuum` | `[TopologicalSpace X] [PolishSpace X] {C}`, `Perfect C → C.Nonempty → #↥C = 𝔠`, in `TauCeti/Topology/MetricSpace/Perfect.lean` | matches 0.4 (line 207) and the 0.1 pointer |
| 0.1 clause against the merge base | README at `35884a8`, 0.1 | main: "a nonempty perfect Polish space contains a Cantor copy and has cardinality 𝔠"; head: the same words plus the parenthesis | record of 0.1 restored |
| Four pointers (lines 64, 822, 867–868, 916) | position of each target | Tau Ceti table at 870–896, below 64, reached by link; layers at 140–668, above 822 and 867; kinds at 58–89, reached by link from 916 | all four correct |

The rows of the previous review for the statements this change does not touch stand as in the previous review, of `ab52752`.

- Source locators checked against the text: 0 this round (no changed passage carries a source locator; the two locators of the README stand as verified at `ab52752`).
- Library declarations opened at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`): 3 (`Perfect.mk_eq_continuum`, `Perfect.exists_nat_bool_injection`, `PerfectSpace.univ_preperfect`), all used in a compiling scratch proof of the restored clause.
- Cross-roadmap citations resolved: none added or changed; none reported missing at this head.
- Sampled targets: of the 15, only 0.4 is cited by a changed passage; it has a row above. The other 14 are untouched.
- Automatic checks: every check passed at this head. Dependency check output: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives two `declaration uses sorry` warnings and nothing else; the file is unchanged since `ab52752`, and both elaborated types still match README 4.2 and 5.2.
- No file outside the folder changes; no layer is added, removed or reordered.
- The description was read against this head: no sentence is contradicted, and the restored clause of 0.1 returns main's text, so needs no mention.

Overlap check: read CountableStructureSpacesPartII, CountableStructureSpaces, CountableModelCounting, InfiniteGamesAndDeterminacy, HanfNumbers, RandomGraphs (as at `ab52752`; the change touches no owned object); nothing shared.

Source independence: changed passages only; 5 passages compared (the four pointers and the restored clause of 0.1) with 2 sources, none shared, and none carries a source locator; largest share Miller's lecture notes and Harrington–Kechris–Louveau, 1 of 2 locators each; contents not compared again, since no layer is added, removed or reordered (independent at `ab52752`).

Research link: The summits are Silver 1980 and Kechris–Solecki–Todorcevic 1999, by the classical route of Miller 2012; 5.2 and 5.4 are the smooth side and the easy half of the Glimm–Effros dichotomy of Harrington–Kechris–Louveau 1990. CountableModelCounting uses Layer 4 for Morley's theorem. Rests on the README's references and the two texts read.

## Not verifiable

- Kechris 1995, Gao 2009, Kechris–Solecki–Todorcevic 1999, Miller 2012, Silver 1980, Burgess 1978, Kuratowski–Ulam 1932 and Mycielski 1964 are listed as references with no locator in the README; they were not opened.
- The Provenance table's statements about `cameronfreer/infinitary-logic` at `518a366` were not checked against that repository.
- The description's integration build at `c0cb575e` cannot be reproduced from the pull request's files.

## Source issues

- none

## For the human reviewers

- **Licence.** The only locator for 4.2 (README line 536) is Miller's lecture notes, marked "DRAFT" and hosted under `/unpublished/` on the author's own page; the statement itself is Souslin's classical theorem.
- **Licence.** The README's Provenance section names `cameronfreer/infinitary-logic` (Apache-2.0, `518a366`) as proof-script reference and asks ported files to credit it; neither statement of `Suggested.lean` is listed as coming from it.
