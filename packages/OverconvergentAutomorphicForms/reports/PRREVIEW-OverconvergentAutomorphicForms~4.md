# Review of OverconvergentAutomorphicForms (pull request #1422 at b6ce911)

**Verdict:** accepted

Incremental re-review of 5 changed lines since beb4bd7 (one docstring bullet of `TauCetiRoadmap/OverconvergentAutomorphicForms/Suggested.lean`), with the pull request's title and description read against this head. No finding.

## Previous findings

- R01 — repaired: the description's summary now reads "a definite unitary eigenvariety, equidimensional and reduced, over which the coherent Jacquet sheaf is Cohen–Macaulay", as README line 425 and `ding line 2960`–`2962` state.
- R02 — repaired: the description now reads "`Suggested.lean` declares nothing: no headline theorem is statable against the pinned Mathlib and Tau Ceti", and "the file contains no `sorry`"; both hold at this head.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §0.7 Cohen–Macaulay theorem for the unitary Jacquet sheaf (README line 425), as cited by the changed docstring bullet (`Suggested.lean` lines 30–33) and the description | `A = k[[s⁴,t⁴]]`, `B = k[[s⁴,s³t,st³,t⁴]]`, `M = k[[s⁴,s³t,s²t²,st³,t⁴]]` | `M` free over `A` on 1, s³t, s²t², st³ (rank 4): Cohen–Macaulay. `B`: s²t² ∉ B but s⁴, t⁴, s³t, st³ each multiply it into B, so depth 1 < 2 | Sheaf-level and space-level properties differ; docstring, README, description and `ding line 2961` now all state the sheaf-level one | none |
| §0.7 dimension theorem (README line 425), same bullet | `n = 2, K = ℚₚ`; `n = 2, [K:ℚₚ] = 2` | `n[K:ℚₚ]` = 2 and 4; README line 447 states 2 and 4; `ding line 2960` gives `n·d_K` | Agree | none |

The rows of the previous reviews for untouched statements stand as in the previous review, of `beb4bd7`.

- Changed passage: the docstring bullet now attributes dimension and reducedness to the eigenvariety and the Cohen–Macaulay property to its coherent coefficient sheaf; this is README line 425 ("its coefficient sheaf is Cohen–Macaulay") and README line 415 ("Cohen–Macaulay coefficients"). No Lean statement changed (0 declarations).
- Description read against the head: 15 sentences of the summary block and prose; all agree with README lines 3, 7, 81, 236, 425 and the three files of the folder. Title agrees (the pull request adds the folder; 0 headings and 0 declarations removed).
- Description's validation sentence checked by running the targeted build: `Build completed successfully`; the only warning is Lake's notice that the file imports `Mathlib` without `module`; no `sorry`.
- Source locators checked against the text this round: 1 (`ding line 2960`–`2962`, Proposition 4.14, p.67).
- Gate rerun at `b6ce911`: every check 0, `OK` (outside-folder 0, stray-files 0, dirty 0).
- Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean` with `lake env lean`: no output (no error, no warning).
- Cross-roadmap citation lead (`AutomorphicBundles` B3.Hilbert.1, README line 1321): untouched, resolved in the previous review through that roadmap's mapping `B3.Hilbert.n = 7.(n+2)`; overlaps file lists no dropped id and no other pull request changing this roadmap.

Overlap check: read HigherHidaAndColemanTheory, PerfectoidShimuraVarieties, PadicFamiliesPartII; nothing shared (as in the review of `beb4bd7`; the change touches no ownership statement).

Source independence: changed passages only; 1 passage (the docstring bullet) compared with 1 source (`ding line 2960`–`2962`), none shared (the three properties are named, in a different order and construction); largest share bhw, 43 of about 146 source citations; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- The description's sentence on AI assistance (review and red-team round counts on the job board) describes history the head does not record.
- The description's `merge-order` and `depends-on` blocks are generated and outside the check of the text.

## Source issues

- none

## For the human reviewers

- none
