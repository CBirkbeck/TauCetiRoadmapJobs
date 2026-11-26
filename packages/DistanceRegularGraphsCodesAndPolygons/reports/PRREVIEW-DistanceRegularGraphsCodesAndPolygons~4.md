# Review of DistanceRegularGraphsCodesAndPolygons (pull request #3067 at fe2e6e3)

**Verdict:** accepted

**Summary.** Accepted: this folder is ready for a human's final approval. The change since the previous review turns the names of the five suppliers that are on main into links to their READMEs and alters no statement; each link resolves on main, each cited section is there, and the small correction of the previous review (the description's list of suppliers on main) is taken up. There are no findings, no small corrections and no format notes. The locators into the cited books remain unread, which is left to the human reviewers.

## Previous findings

- The previous report had no finding. Its small correction C01 is taken up: the description now reads "On main: GraphSpectra … AssociationSchemes … StronglyRegularAndMooreGraphs … BoundsOnCodes 1.2 and 5.1 … SpectralGraphBounds 1.1", and all five are on main with those sections.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| "the Moore bound is StronglyRegularAndMooreGraphs" (linked); local copy `mooreBound k d = 1 + k ∑_(i<d) (k−1)^i` | `(3,2)`; `(7,2)`; `(0,d)`; `(1,2)`; `(k,0)`; main's definition | `10` (Petersen); `50` (Hoffman–Singleton); `1`; `1 + (0⁰ + 0¹) = 2` (`K_2`); `1`; main's body is the same expression | copy agrees with main, values right | none |
| "perfect codes in Hamming spaces are BoundsOnCodes" (linked); local copy `IsPerfect C t` | repetition code `n = 3`, `t = 1`; one word, `t = n`; empty `C` | each of 8 words within distance 1 of exactly one of `000`, `111`; unique centre; fails (no centre); main's body identical | copy agrees with main | none |
| "Its 3.2 is the odd-girth bound" (StronglyRegularAndMooreGraphs, linked) | main's 3.2 | hypothesis `2t + 1 ≤ egirth`, conclusion `mooreBound d t ≤ card`; main's scope excludes even girth | sentence true | none |
| SpectralGraphBounds 1.1 `adjEigenvalues` (linked), "index `0` the largest" | main's definition | both are `(G.isHermitian_adjMatrix ℝ).eigenvalues₀`, nonincreasing | copy agrees with main | none |

The rows for the statements the change does not touch stand as in the previous review, of `b77dc6b`.

- Source locators checked against the text: 0; the change adds and alters no locator, the seeded sample falls in no changed passage, and none of the cited books is readable legally (as in the previous reviews).
- Links added: 14, to 5 READMEs (AssociationSchemes, StronglyRegularAndMooreGraphs, BoundsOnCodes, GraphSpectra, SpectralGraphBounds); each target file exists on main. The two suppliers still in pull requests (DelsarteTheoryOfCodesAndDesigns, StronglyRegularGraphsAndDesigns) are rightly left unlinked.
- Cross-roadmap citations resolved on main: AssociationSchemes 1.1, 1.2, 2.1, 2.2, 2.3, 3.1, 4.1, 4.2, 4.3, 5.1, 5.2, 6.1, 6.2; GraphSpectra 1.2, 2.3, 2.4, 2.6, 3.1; SpectralGraphBounds 1.1; StronglyRegularAndMooreGraphs 1.2, 1.3, 3.1, 3.2, 3.3; BoundsOnCodes 1.2, 5.1. At the open heads: DelsarteTheoryOfCodesAndDesigns 2.1, 4.1; StronglyRegularGraphsAndDesigns 2.4, 5.1, 5.2, 5.3.
- Declarations opened: `mooreBound` (`TauCetiRoadmap/StronglyRegularAndMooreGraphs/Suggested.lean` line 107), `IsPerfect` and `distanceDistribution` (`TauCetiRoadmap/BoundsOnCodes/Suggested.lean` lines 49, 256), `adjEigenvalues` (`TauCetiRoadmap/SpectralGraphBounds/Suggested.lean` line 34), against the copies in this roadmap's `Suggested.lean` lines 62, 226, 241, 246; the copies sit in this roadmap's own namespace, so no fully qualified name is shared.
- Elaboration: `Suggested.lean` (unchanged since `b77dc6b`) elaborates with 43 `sorry` warnings and the output of its `#check` lines, nothing else; no `set_option`.
- Dependency check: `depcheck: 101 roadmaps, 1129 edges, 0 problem(s)`; no upward or cyclic line.
- Pull-request text: the supplier paragraph, the dependency list (the two open suppliers), 43 `sorry` and the import agree with the head; no file outside the folder is changed.
- Overlap facts: no other open pull request changes this roadmap, none drops an id it cites, and main has no folder of this name.

Overlap check: read AssociationSchemes, StronglyRegularAndMooreGraphs, GraphSpectra (on main), StronglyRegularGraphsAndDesigns, DelsarteTheoryOfCodesAndDesigns (open), with GraphSymmetryAndCayleyGraphs, SpectralGraphBounds and BoundsOnCodes as in the previous reviews; the change adds no object and no target; nothing shared.

Source independence: changed passages only; 14 passages compared with 0 sources, since the change adds only links to other roadmaps and cites no source, and the cited books could not be read legally; largest share BH, 36 of 75 locators in the layers; arrangement not compared again, the change adds, removes and reorders no layer.

Research link: Layers 2–3 and 7–8 are the classical theory behind the Damerell–Bannai–Ito theorem and the Bannai–Ito conjecture (proved by Bang, Dubickas, Koolen and Moulton), and Layer 9 is the entry to `Q`-polynomial schemes and the Terwilliger algebra; rests on the README ("Beyond this roadmap", "Downstream consumers"), no source read.

## Not verifiable

- The locators into [BH], [BCN], [BVM], [GR], [Biggs] and [Godsil], including those of the seeded sample: unchanged text; the publishers are paywalled and no legal copy was found, as in the previous reviews.

Automatic checks set aside as false positives: the section heading "Library declarations consumed" at the end of `Suggested.lean` was reported as having no declaration under it; it heads the `#check` lines that pin library declarations, which is their permitted use.

## Source issues

- none

## For the human reviewers

- **Not tested.** BH has the largest share of the locators (36 of 75 in the layers); its printed text and table of contents could not be read, so the wording and arrangement checks were not run against it or any other source.
- **Licence.** The six references are published books (Springer 2012, 1989, 2001; Cambridge 2022, 1993; Chapman and Hall 1993), cited by locator only; no copy of the printed texts was opened.
- **Locators.** The previous review found this README's [BH] pages to fit the publisher's chapter ranges, and AssociationSchemes and StronglyRegularAndMooreGraphs (now on main) to give other pages for the same theorems; that comparison was not repeated at this head.
