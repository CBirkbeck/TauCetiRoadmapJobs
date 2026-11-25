# Review of DistanceRegularGraphsCodesAndPolygons (pull request #3067 at b77dc6b)

**Verdict:** accepted

**Summary.** Accepted: this folder is ready for a human's final approval. The one finding of the previous review is repaired (the summary now states the count of zeros of the Lloyd polynomial for radius `t ≤ n`, as 6.3 does), and so are its small correction (`c_0 = 0` is now claimed on a connected graph only, with the disconnected value given) and its format note; the three changed passages were recomputed and are true. There is one small correction, to the pull request's description, and no format note. The locators into the cited books remain unread, which is left to the human reviewers.

## C01 — The description says "On main: none" and lists BoundsOnCodes and SpectralGraphBounds under "Open PRs", but both roadmaps are on main.

A reader of the description takes seven suppliers to be unmerged, while two of them are settled; the description's own dependency list already ticks both. On main, BoundsOnCodes has "1.2 The sphere-packing bound and perfect codes" and "5.1 Distance distributions and Delsarte's inequalities", and SpectralGraphBounds has "1.1 Sorted adjacency eigenvalues", the sections this roadmap cites. The text that would be right: "On main: BoundsOnCodes 1.2 and 5.1 (definitions; 6.3); SpectralGraphBounds 1.1 (the sorted eigenvalues, copied as GraphSpectra copies them)", with those two entries taken out of the "Open PRs" bullet.

## Previous findings

- R01 — repaired: "for perfect codes in Hamming spaces, where the Lloyd polynomial of a perfect code of radius `t ≤ n` has `t` zeros among `1, …, n`" (README lines 21–22), the hypothesis of 6.3 and of `card_lloyd_zeros_of_isPerfect`.
- The small correction C01 of the previous report is taken up: "so `c_0 = 0` on a connected graph, because `0 − 1 = 0` in `ℕ` … (on two disjoint edges the junk distance gives `c_0 = 1`)" (lines 74–76); both values recomputed from the definition. Its format note N01 is taken up: the *Depends on* line of Layer 6 (line 595) now lists 4.1.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Summary: Lloyd polynomial of a perfect code of radius `t ≤ n` has `t` zeros among `1, …, n` | repetition code `n = 3`, `t = 1`; one word of `H(n, q)`, `t = n`; `H(1, 2)`, `t = 1`; `t = 0`; `H(1, 2)`, `t = 2` | `4 − 2j`: zero `{2}`; `∑_(i≤n) K_i(j) = q^n δ_(j0)`: zeros `{1, …, n}`; `2 − 2j`: `{1}`; constant `1`: none; `2(j − 1)²`: one zero, excluded by `t ≤ n` | holds; agrees with 6.3 | none |
| Conventions: `c_0 = 0` on a connected graph, `c_0 = 1` on two disjoint edges (`intersectionC 0 = intersectionCount 0 0`, a supremum over pairs) | connected graph; one vertex; empty vertex set; `2K_2` | connected: class `0` is the diagonal, no neighbour of `y` at distance `0` from `y`, supremum `0`; empty: empty supremum `0`; `2K_2`: pair across components, the one neighbour of `y` at junk distance `0`, supremum `1` | both sentences true | none |
| Layer 6 *Depends on* now lists 4.1 | *Needs* line of 6.3; "How to read the build" | 6.3 needs "2.3, 4.1, 6.2"; the guide says "2.3 and 4.1 for the count of zeros" | the three agree | none |

The rows for the statements the change does not touch stand as in the previous review, of `d9e0952`.

- Source locators checked against the text: 0; the change adds and alters no locator, and none of the cited books is readable legally (as in the previous review).
- Library and Lean declarations opened: `intersectionCount`, `intersectionB`, `intersectionC`, `intersectionA` in `TauCetiRoadmap/DistanceRegularGraphsCodesAndPolygons/Suggested.lean` lines 348–359, against the changed Conventions sentence; `Suggested.lean` itself is unchanged since `d9e0952`.
- Cross-roadmap citations resolved: BoundsOnCodes 1.2 and 5.1 and SpectralGraphBounds 1.1 on main (for C01); the change adds no citation of another roadmap.
- Elaboration: `Suggested.lean` elaborates with 43 `sorry` warnings and the output of its `#check` lines, nothing else; no `set_option`; imports unchanged.
- Dependency check: `depcheck: 124 roadmaps, 1403 edges, 0 problem(s)`; no upward or cyclic line.
- Pull-request text: 43 `sorry` and the count of zeros agree with the head; no file outside the folder is changed; the supplier paragraph is C01.
- Overlap facts: no other open pull request changes this roadmap, and none drops an id it cites.

Overlap check: read AssociationSchemes, StronglyRegularGraphsAndDesigns, StronglyRegularAndMooreGraphs, DelsarteTheoryOfCodesAndDesigns, GraphSymmetryAndCayleyGraphs, SpectralGraphBounds, BoundsOnCodes (as in the previous reviews; the change adds no object and no target); nothing shared.

Source independence: changed passages only; 3 passages compared with 0 sources, since the change cites no source and the books cited nearby ([BCN] §2.5) could not be read legally; the three passages are the roadmap's own hypotheses and a computation on its own definition; largest share BH, 36 of 75 locators in the layers; arrangement not compared again, the change adds, removes and reorders no layer.

Research link: Layers 2–3 and 7–8 are the classical theory behind the Damerell–Bannai–Ito theorem and the Bannai–Ito conjecture (proved by Bang, Dubickas, Koolen and Moulton), and Layer 9 is the entry to `Q`-polynomial schemes and the Terwilliger algebra; rests on the README ("Beyond this roadmap", "Downstream consumers"), no source read.

## Not verifiable

- [BCN, Proposition 2.5.5 (ii) and Remark (i), p. 56], cited in 6.3 for the count of zeros that the summary now restates: the publisher is paywalled and no legal copy was found.
- The printed pages of [BH] within a chapter, and the other locators into [BH], [BCN], [BVM], [GR], [Biggs] and [Godsil]: unchanged text, as in the previous reviews.

Automatic checks set aside as false positives: the section heading "Library declarations consumed" at the end of `Suggested.lean` was reported as having no declaration under it; it heads the `#check` lines that pin library declarations, which is their permitted use.

## Source issues

- none

## For the human reviewers

- **Not tested.** BH has the largest share of the locators (36 of 75 in the layers); its printed text and table of contents could not be read, so the wording and arrangement checks were not run against it or any other source.
- **Licence.** The six references are published books (Springer 2012, 1989, 2001; Cambridge 2022, 1993; Chapman and Hall 1993), cited by locator only; no copy of the printed texts was opened.
- **Locators.** This README's [BH] pages fit the publisher's chapter ranges (Crossref: Chapter 11 pp. 165–175, Chapter 12 pp. 177–185). The open roadmaps AssociationSchemes and StronglyRegularAndMooreGraphs give other pages for the same theorems, those of the authors' online versions.
