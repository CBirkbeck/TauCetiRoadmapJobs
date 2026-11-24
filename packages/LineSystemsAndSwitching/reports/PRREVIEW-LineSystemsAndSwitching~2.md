# Review of LineSystemsAndSwitching (pull request #3070 at e8c1cbb)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review (the overview's two equivalences on regular two-graphs, false for `K₅`) is repaired, and so are its five small corrections and its format note; the repairs introduce no new defect, and the file elaborates with `sorry` as the only warning. There is one format note, not blocking. Brouwer–Haemers could be read this round in a draft from its first author's page, and the locators of the changed passages agree with it; the humans are left the full wording and arrangement comparison, which an incremental re-review does not redo.

## N01 — The `*Needs:*` line of 5.1 does not list what the repaired routes now cite

The routes of 5.1 now take `Σ θ_i² = 2m` from SpectralGraphBounds 1.1 (lines 598 and 603) and the walk count from Tau Ceti's `Matrix.IsHermitian.trace_pow_eq_sum_eigenvalues_pow` (line 611), but the `*Needs:*` line (line 630) still reads "GraphSpectra 1.2, 1.3; SpectralGraphBounds 1.2; …", and the supplier contract for SpectralGraphBounds 1.1 (line 1011) lists only the copied definitions. Adding "SpectralGraphBounds 1.1" and the Tau Ceti lemma to the line, and "the trace identity `Σ θ_i² = 2|E|`, used in 5.1" to the contract, would make them agree.

## Previous findings

- R01 — repaired: "for a graph switching equivalent neither to the complete nor to the empty graph, the two-graph is regular of degree `k` exactly when … and such a graph, if regular, has a regular two-graph exactly when …" (lines 28–31).
- C01 — repaired: "ZigzagPreprojective 0.1 states its recognition theorem as a target, consumed in 2.2" (line 904); "The affine recognition theorem is not among them" (line 920); "a target there; used in 2.2" (line 986); the description says the same.
- C02 — repaired: "for `n ≥ 2` that of `rootsD n` is `TauCeti.IntegralLattice.checkerboardLattice` (at `n = 1` the set is empty and spans `0`, while the checkerboard lattice is `2ℤ`)" (lines 342–343).
- C03 — repaired: "`cocktailPartyGraph m` on `Fin m × Fin 2`: an abbreviation for Mathlib's `SimpleGraph.completeEquipartiteGraph m 2` … No second carrier is introduced"; the spectrum is no longer a target and is cited to GraphSpectra 2.6.
- C04 — repaired: "`Σ θ_i² = tr A² = 2m` (SpectralGraphBounds 1.1)" (line 598, and line 603); see N01 for the `*Needs:*` line.
- C05 — repaired: the four docstrings open "Worked example, a sanity check of the definitions of … not a headline", and 1.1, 5.4 and the scope paragraph say the same.
- N01 — repaired: `largestEigenvalue_diagramGraph … (hs : t.IsSimplyLaced) [Nonempty (Fin t.rank)]`, with no `haveI` in the statement.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Summary, sixth bullet | `K₅`; Petersen | `K₅` switches to itself, so is excluded; Petersen: two-graph degree `4`, descendant `(9,4,1,2)`, `4 = 2·2`; `k - n/2 = -2`, an eigenvalue | holds with the hypothesis | none |
| 2.4 `largestEigenvalue_diagramGraph` (binder) | `A₁`, `A₂`, `D₄` | `2cos(π/2) = 0 = θ₁(K₁)`; `2cos(π/3) = 1 = θ₁(K₂)`; `2cos(π/6) = √3 = θ₁(K_{1,3})` | holds; `Nonempty` follows from `Valid` (`DynkinType.rank_pos`) | none |
| 3.1 span of `rootsD n` | `n = 0, 1, 2, 3` | `0 = 0`; `0 ≠ 2ℤ`; span of `(1,1),(1,-1)` = even-sum vectors of `ℤ²`; `2e_i = (e_i+e_j)+(e_i-e_j)` generates with `e_i - e_j` | holds for `n ≥ 2` | none |
| 4.1 `cocktailPartyGraph` as `completeEquipartiteGraph m 2` | `m = 0, 1, 2, 3`; `completeEquipartiteGraph 2 3` | empty; `2K₁`, `0,0`; `C₄`, `2,0²,-2`; `4,0³,(-2)²`; `K_{3,3}`: `3,0⁴,-3`; formula `t(r-1), 0^{r(t-1)}, (-t)^{r-1}` at `t = 2` | holds; new Check true | none |
| 4.2 `nonempty_iso_generalizedLineGraph` (new carrier) | `m = 0, 2` | `m = 0`: both vertex types empty; `m = 2`: petal vertices `(i,b)`, adjacent iff `i ≠ j`, `C₄`; `Bool ≃ Fin 2` | holds | none |
| 4.5 regular generalized line graph (new carrier) | `K₁`, `L(K₄)` | `K₁ = L(K₂)`; `L(K₄) = CP(3)` on `Fin 3 × Fin 2`, 6 vertices, 4-regular | holds | none |
| 5.1 edges and walks (new citations) | `K_{1,4}`, `P₃` | `Σθ² = 4 + 4 = 8 = 2·4`; `P₃`: `Σθ⁴ = 4 + 4 = 8`, closed 4-walks `2·2 + 4·1 = 8` | holds | N01 |

The rows for the statements the change does not touch stand as in the previous review, of `fe56537`.

- Source locators checked against the text: 5, in a draft of Brouwer–Haemers from its first author's page (February 2011): Figure 1.1 (the pair `K_{1,4}`, `K₁ + C₄`; p. 7 there too), Lemma 14.4.3 (ii) and (iii), Proposition 14.4.1 (the range `-1 < β < 0` of the last Check of 5.1 is the source's), the remark after Proposition 14.4.5 (`K₅ + 5K₂` and Petersen with five isolated vertices, Laplace spectrum `0⁶, 2⁵, 5⁴`), and the attaining example after Theorem 8.4.1 (the representation of the first Check of 4.4 is as the source prints it). Pages of Chapters 10 and 14 in the README lie in the printed chapter ranges (Crossref: 151–164 and 199–219); the draft's pages for them are 2 and 4 lower.
- Library declarations opened at the pin: 4 (`Matrix.IsHermitian.trace_pow_eq_sum_eigenvalues_pow`, `TauCeti/Analysis/Matrix/Spectrum.lean` line 140; Mathlib `completeEquipartiteGraph`, `Mathlib/Combinatorics/SimpleGraph/CompleteMultipartite.lean` line 220; `checkerboardCarrier`, `TauCeti/LinearAlgebra/IntegralLattice/RootLattice/TypeD/Basic.lean` line 135; `DynkinType.rank_pos`, `TauCeti/LinearAlgebra/RootSystem/DynkinType.lean` line 179).
- Cross-roadmap citations resolved for the changed passages: 4 (SpectralGraphBounds 1.1 states that the squares sum to `2|E|`; GraphSpectra 1.3 states the Laplacian traces and hands `Σθ² = 2m` to SpectralGraphBounds 1.1; GraphSpectra 2.6 states the complete equipartite spectrum for `r, t ≥ 1`; ZigzagPreprojective 0.1 on main).
- Dependency check: `depcheck: 129 roadmaps, 1437 edges, 0 problem(s)`; no UPWARD or CYCLE line. The roadmap is not yet in the merge order and is placed after its last supplier.
- Elaboration of `Suggested.lean`: exit 0, 39 `sorry` warnings and the `#check` output, nothing else; the new `#check` lines for `completeEquipartiteGraph` and the trace lemma elaborate. 39 theorems: 35 headline statements and the four marked worked examples, as the description says; thirteen `TauCeti.*` imports, as it says.
- Padding: the change adds no theorem and removes one (the cocktail party spectrum, now cited); the one-tactic probe was not repeated for untouched theorems.
- Automatic checks: one form check failed and is set aside below. Changes outside the folder: none.
- The pull request's title and description agree with this head (ZigzagPreprojective 0.1 as a target, the cocktail party graph as Mathlib's, SpectralGraphBounds 1.1 for `Σθᵢ² = 2m`, four worked examples, 39 `sorry`).

Overlap check: read EquiangularLinesAndTwoGraphs, GraphSpectra, StronglyRegularGraphsAndDesigns, CharacteristicPolynomialsAndStarComplements, GraphSymmetryAndCayleyGraphs, ZigzagPreprojective, RootSystems (the last five as in the previous review; GraphSpectra and SpectralGraphBounds again at their heads for the changed citations); Seidel matrices, switching, two-graphs and equiangular families: EquiangularLinesAndTwoGraphs; spectra of the standard families, now including the cocktail party graph: GraphSpectra 2.6; affine recognition by a null vector: ZigzagPreprojective 0.1; descendants, cospectral graphs, Godsil–McKay switching, generalized line graphs: this roadmap. The change moves the cocktail party graph and its spectrum to Mathlib and GraphSpectra, so no shared object remains there.

Source independence: changed passages only; 4 passages compared with 1 source (the Brouwer–Haemers draft: 1.1, the two targets of 5.1, 5.4), none shared (the route of 5.1 through `nθ₁ = 2m` is not the source's); largest share BH, 45 of 90 locators; the change adds, removes and reorders no layer, so the contents were not compared again.

Research link: the headline targets are Smith 1970, Cameron–Goethals–Seidel–Shult 1976 (graphs with least eigenvalue `-2` and root systems), Godsil–McKay 1982 (switching) and the determined-by-spectrum programme of van Dam–Haemers 2003; this rests on the README's References, not on a text I read.

## Not verifiable

- [CRS] p. 6 and §6.4, p. 171 (4.1, a changed passage): no legal copy; the statement was verified as mathematics and against GraphSpectra 2.6.
- [BH] printed page numbers: only a draft with other pagination after Chapter 9 could be read; theorem and section numbers of the passages checked agree.
- [GR], [Bi], [vDH], [CGSS] and the other sources: as in the previous review; no changed passage rests on them.

Automatic checks set aside as false positives: the section comment "Library declarations consumed" at the end of `Suggested.lean` was reported as a heading with no declaration under it; it heads the `#check` lines that pin library declarations, which is what such lines are for.

## Source issues

- **Misprint** in Brouwer–Haemers, *Spectra of Graphs* (draft of February 2011 on the first author's page) at the remark after Theorem 8.4.1, p. 110 of the draft: the source says the bounds of part (ii) are best possible; it should be part (iii), which has the bounds 36 and 28; affects nothing.

## For the human reviewers

- Not tested: BH carries 45 of the README's 90 locators. A draft is now readable from its first author's page; this incremental round compared only the changed passages (1.1, 5.1, 5.4) with it, not the whole wording or the arrangement.
- Licence: the copy of BH read is a February 2011 draft on its first author's page (aeb.win.tue.nl); its pagination differs from the Springer edition cited, by 2 pages in Chapter 10 and 4 in Chapter 14.
- Reuse: `Suggested.lean` lines 55–237 copy definitions character for character from five roadmaps that are still open pull requests (GraphSpectra, SpectralGraphBounds, LaplacianEigenvaluesOfGraphs, TopologicalCombinatorics, EquiangularLinesAndTwoGraphs), each labelled with its owner.
