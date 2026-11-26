# Review of LineSystemsAndSwitching (pull request #3070 at 05574ad)

**Verdict:** accepted

**Summary.** Accepted: the previous review had no finding, and its one format note (the `*Needs:*` line of 5.1) is repaired; the 81 changed lines introduce no defect, the new library citations exist at the pins, and the file elaborates with `sorry` as the only warning. There are no small corrections and no format notes. The note this change adds on a misprint in Brouwer–Haemers could not be checked against the printed edition this round; the humans are left the full wording and arrangement comparison with that book, as before.

## Previous findings

- N01 — repaired: "*Needs:* GraphSpectra 1.2, 1.3; SpectralGraphBounds 1.1, 1.2; … Tau Ceti `Matrix.IsHermitian.trace_pow_eq_sum_eigenvalues_pow`; Mathlib `SimpleGraph.adjMatrix_pow_apply_eq_card_walk` and …" (lines 632–635); the contract adds "the trace identity `Σ θ_i² = 2|E|`, used in 5.1" (line 1020).

The previous report had no finding (R) and no small correction.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 5.1 edges, regularity, walks (new `*Needs:*` entries) | `K_{1,4}`; `P₄`; `K_{1,3}` | `Σθ² = 4+4 = 8 = 2·4`; `P₄`: `Σθ⁴ = 2(φ⁴+φ⁻⁴) = 14 = 6+8`; `K_{1,3}`: `2·9 = 18 = 6+12` | holds; each cited lemma states what the line uses | none |
| 4.4 Check, bounds attained (locator note changed) | the 36-vertex graph on `K₈` and `L(K₈)` | degree at `i`: `7 + C(7,2) = 28`; `(½𝟙-e_i)·(½𝟙-e_j) = 2-1 = 1`, norm `2`; `(½𝟙-e_i)·(e_j+e_k) = 1 - [i∈{j,k}]`; after negating coordinate 1: `0` or `2` minus signs | holds | none |
| 1.3 Check, `T(2,2,2)` (rewrapped only) | the partition `X₁ = {0,1,2,3}`, `Y = {4,5,6}` | switched neighbours: `4↦{2,3}`, `5↦{1,3}`, `6↦{1,2}`: the cycle `1-5-3-4-2-6` and isolated `0`; `Σθ² = 4+2+2+4 = 12 = 2·6` on both | holds | none |
| 3.2 Check, `C₄` in `A₃` (rewrapped only) | the four vectors, and the cyclic choice | consecutive dot products `1,1,1,1`, opposite `0,0`; cyclic choice `-1` | holds | none |
| `lapEigenvalues`, `kneserGraphOf`, `kneserGraph` (`_root_.` dropped) | elaborated types | `(G : SimpleGraph V) → … → Fin (Fintype.card V) → ℝ`; `SimpleGraph ↑𝓕`; `SimpleGraph ↑{s | #s = k}`: Mathlib's `SimpleGraph` in each | unchanged meaning; now character for character the owners' text on main | none |

The rows for the statements the change does not touch stand as in the previous review, of `e8c1cbb`.

- Source locators checked against the text: 0 this round (the one changed locator, the remark after Theorem 8.4.1 of Brouwer–Haemers, is under Not verifiable; the previous review read it in the authors' draft and reported the same misprint).
- Library declarations opened at the pin: 3 (`SimpleGraph.adjMatrix_pow_apply_eq_card_walk`, `Mathlib/Combinatorics/SimpleGraph/AdjMatrix.lean` line 402; `SimpleGraph.card_connectedComponent_eq_finrank_ker_toLin'_lapMatrix`, `Mathlib/Combinatorics/SimpleGraph/LapMatrix.lean` line 283; `Matrix.IsHermitian.trace_pow_eq_sum_eigenvalues_pow`, `TauCeti/Analysis/Matrix/Spectrum.lean` line 140).
- Cross-roadmap citations resolved for the changed passages: 6 (SpectralGraphBounds 1.1 on main states that the squares of the eigenvalues sum to `2|E|`, and 1.2 the regularity criterion `n λ₁ = 2|E|`; the five new relative links, to GraphSpectra, SpectralGraphBounds, LaplacianEigenvaluesOfGraphs, TopologicalCombinatorics and StronglyRegularAndMooreGraphs, each point at a README that exists on main; the copies of `lapEigenvalues`, `kneserGraphOf` and `kneserGraph` agree with `TauCetiRoadmap/LaplacianEigenvaluesOfGraphs/Suggested.lean` line 35 and `TauCetiRoadmap/TopologicalCombinatorics/Suggested.lean` lines 119–127 on main).
- Dependency check: `depcheck: 101 roadmaps, 1130 edges, 0 problem(s)`; no UPWARD or CYCLE line. The roadmap is not yet in the merge order and is placed after its last supplier.
- Elaboration of `Suggested.lean`: exit 0, 39 `sorry` warnings and the `#check` output, nothing else; the two new `#check` lines elaborate. No `set_option`; `import Mathlib` and thirteen `TauCeti.*` modules.
- Padding: the change adds and removes no theorem; the one-tactic probe was not repeated.
- Automatic checks: one form check failed and is set aside below. Changes outside the folder: none.
- The pull request's title and description agree with this head (suppliers on main and open, SpectralGraphBounds 1.1 for `Σθᵢ² = 2m` in 5.1, 39 `sorry`, thirteen Tau Ceti modules, four worked examples).

Overlap check: read EquiangularLinesAndTwoGraphs, GraphSpectra, StronglyRegularGraphsAndDesigns (and SpectralGraphBounds on main for the changed citation; CharacteristicPolynomialsAndStarComplements, GraphSymmetryAndCayleyGraphs, ZigzagPreprojective and RootSystems as in the previous reviews); Seidel matrices, switching, two-graphs and equiangular families: EquiangularLinesAndTwoGraphs; spectra of the standard families and the trace identities: GraphSpectra and SpectralGraphBounds 1.1; descendants, cospectral graphs, Godsil–McKay switching, generalized line graphs: this roadmap. The change moves no object between owners.

Source independence: changed passages only; the change adds one clause of the roadmap's own (the note on the remark after Theorem 8.4.1) and lists of citations, 0 passages compared with source text this round since no source could be read; largest share BH, 44 of the README's bracketed locators as counted this round (45 of 90 in the previous review); the change adds, removes and reorders no layer, so the contents were not compared again.

Research link: the headline targets are Smith 1970, Cameron–Goethals–Seidel–Shult 1976 (graphs with least eigenvalue `-2` and root systems), Godsil–McKay 1982 (switching) and the determined-by-spectrum programme of van Dam–Haemers 2003; this rests on the README's References, not on a text I read.

## Not verifiable

- [BH] p. 112, the remark after Theorem 8.4.1 (4.4, the changed locator note, "assigns them to part (ii), a misprint for (iii)"): no legal copy of the printed edition, and the authors' draft that the previous review read was not obtainable through the sources service this round. The previous review found the same slip in that draft (p. 110 there); whether the 2012 printing keeps it was not checked. The graph of the Check was verified as mathematics.
- [GR], [Bi], [vDH], [CGSS], [CRS] and the other sources: as in the previous reviews; no changed passage rests on them.

Automatic checks set aside as false positives: the section comment "Library declarations consumed" at the end of `Suggested.lean` was reported as a heading with no declaration under it; it heads the `#check` lines that pin library declarations, which is what such lines are for.

## Source issues

- none

## For the human reviewers

- Not tested: BH carries about half of the README's locators. No round has compared the whole wording or the arrangement with it; the previous round compared only 1.1, 5.1 and 5.4 with a draft, and this round could read no copy.
- Licence: the copy of BH the previous review read was a February 2011 draft on its first author's page (aeb.win.tue.nl); its pagination differs from the Springer edition cited, by 2 pages in Chapter 10 and 4 in Chapter 14.
- Reuse: `Suggested.lean` lines 55–238 copy definitions character for character from GraphSpectra, SpectralGraphBounds, LaplacianEigenvaluesOfGraphs, TopologicalCombinatorics (on main) and EquiangularLinesAndTwoGraphs (an open pull request), each labelled with its owner.
