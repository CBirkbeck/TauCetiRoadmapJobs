# Review of StronglyRegularGraphsAndDesigns (pull request #3061 at 39cd770)

**Verdict:** accepted

**Summary.** Accepted: the previous review had no finding, and the 66 changed lines introduce none. The change turns the names of seven supplier roadmaps into links, writes `SimpleGraph` for `_root_.SimpleGraph` in the two copied Kneser-graph definitions (whose elaborated types are unchanged), and makes the header over the closing `#check` list a plain comment, which settles the one format note of the previous review. There are no small corrections and no format notes. The Brouwer–Haemers and Brouwer–Van Maldeghem locators remain unread, which is left to the human reviewers as before.

## Previous findings

- N01 — repaired: the line over the closing `#check` list of `Suggested.lean` (line 662) is now the plain comment "Library declarations consumed", no longer a section heading with no declaration under it.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Local copy `kneserGraphOf` (now typed `SimpleGraph 𝓕`) | ascription to `_root_.SimpleGraph 𝓕`; all subsets of `Fin 3`: `{0}` vs `{0,1}`, `{0}` vs `{1,2}` | ascription elaborates; `{0} ∩ {0,1} = {0}`, not adjacent; `{0} ∩ {1,2} = ∅`, adjacent | the name resolves to Mathlib's `SimpleGraph`; adjacency is distinct and disjoint | none |
| Local copy `kneserGraph` | `kneserGraph (Fin 5) 2` against `kneserGraphOf` on the 2-subsets | equal by `rfl`; `C(5,2) = 10` vertices, degree `C(3,2) = 3`; adjacent pairs `0`, nonadjacent `1` common neighbours | the Petersen parameters `(10, 3, 0, 1)` of 3.2 | none |
| Both copies against their owner | TopologicalCombinatorics `Suggested.lean` on main, lines 117–127 | docstrings, signatures and bodies identical character for character, now including the spelling `SimpleGraph` | "copied verbatim" holds | none |
| Supplier contract, PeriodicNonnegativeMatrices 3.3 (relinked) | its README on main, lines 421–425 | bipartite iff `μ`, `−μ` have equal root multiplicity in the characteristic polynomial of `G.adjMatrix ℝ` | agrees with the contract as stated | none |
| Supplier contract, StronglyRegularAndMooreGraphs 1.2 (relinked) | its `Suggested.lean` on main, lines 33–41 | `srgDiscriminant`, `srgEigenvalueR`, `srgEigenvalueS` defined there, section 1.2 "The spectrum" | agrees | none |

The rows for the untouched statements stand as in the previous review, of `7dac2a2`.

- Source locators checked against the text: 0 new; the diff changes no locator and no sampled section (the seeded sample falls wholly in untouched text).
- Library and supplier declarations opened: `kneserGraphOf`, `kneserGraph` (TopologicalCombinatorics `Suggested.lean`, lines 119, 126), `adjEigenvalues` (SpectralGraphBounds `Suggested.lean`, line 34), the three definitions of StronglyRegularAndMooreGraphs 1.2, all on main.
- Cross-roadmap citations resolved: the eight link targets of the README (GraphSpectra, StronglyRegularAndMooreGraphs, AssociationSchemes, SpectralGraphBounds, TopologicalCombinatorics, PeriodicNonnegativeMatrices, LinearAlgebraMethodInCombinatorics, GlobalQuadraticForms) each have a `README.md` on main; the sections named in the changed passages (GraphSpectra 1.2, SpectralGraphBounds 1.1, TopologicalCombinatorics 3.1, StronglyRegularAndMooreGraphs 1.2, AssociationSchemes 1.1 and 3.1, PeriodicNonnegativeMatrices 3.3, LinearAlgebraMethodInCombinatorics 1.3) exist there under those numbers.
- Elaboration: `Suggested.lean` elaborates at the pins with 40 `sorry` warnings and no error; a copy with four probes on the Kneser definitions (the type ascription, the `rfl`, the two adjacency computations) elaborates as well. No `set_option`, no sorried data, imports unchanged.
- Dependency check: `depcheck: 101 roadmaps, 1129 edges, 0 problem(s)`; no UPWARD or CYCLE line. The worker's automatic checks all passed on this head. No file outside the folder is changed.
- Pull request text: the title and description agree with this head; the suppliers it lists as on main are on main, the count of 40 `sorry` and the four Tau Ceti imports are unchanged.
- Overlap check: read StronglyRegularAndMooreGraphs, DistanceRegularGraphsCodesAndPolygons, GraphSpectra, AssociationSchemes, LineSystemsAndSwitching; nothing shared (ownership as in the previous review; the diff moves no object).

Source independence: changed passages only: the diff adds links and respells one type name, no prose and no locator, so 0 passages were compared with 0 sources; largest share BH, about 33 of 62 locators; contents of BH not read; no layer added, removed or reordered, so the arrangement was not compared again.

Research link: Layers 1–4 state the theory of strongly regular graphs treated in Brouwer–Van Maldeghem 2022 and Brouwer–Haemers 2012; Layer 6 is the Bruck–Ryser–Chowla theorem as in Brouwer–Van Maldeghem, Theorem 8.3.1; the uniqueness of the Hoffman–Singleton graph (Hoffman–Singleton 1960) is named as the extension. Rests on the README's references.

## Not verifiable

- BH (Brouwer–Haemers) and BVM (Brouwer–Van Maldeghem): not readable legally, as in the previous reviews; untouched by this change.
- N, §1.1, p. 3 of the EMS edition: read only in the arXiv version, as before.
- GR, CRS, BCN, Biggs, Hoffman–Singleton: unchanged passages, not read, as before.

## Source issues

- none

## For the human reviewers

- Not tested: BH has the largest share of the locators (about 33 of 62) and could not be read, nor its table of contents; wording and arrangement were compared with N only, in the earlier reviews.
- Licence: BH and BVM are on the first author's own page at an address that does not carry his name, so the sources service refused them; a human can confirm the page and supply the texts.
- Locators: the References state that BH pages are those of the printed edition (ISBN 978-1-4614-1938-9); the first review found them 2 to 4 pages off StronglyRegularAndMooreGraphs 1.2, 3.5 and AssociationSchemes 3.1 for the same theorems.
- Practice: `Suggested.lean` copies twelve definitions from six other roadmaps (lines 44–181), under its own namespace; all six are now on main. Whether copying is the wanted way to state targets on another roadmap's definitions is a project decision.
