# Review of LineSystemsAndSwitching (pull request #3070 at fe56537)

**Verdict:** needs changes

**Summary.** Needs changes, for one finding: the opening overview states the two equivalences between regular two-graphs and strongly regular graphs without the hypothesis that the graph is switching equivalent neither to the complete nor to the empty graph, and `K₅` refutes both as written (the README's own Checks in 6.2 and 6.3 say so). The layer statements, the Lean statements and every worked example I recomputed are correct. There are five small corrections and one format note, none blocking. No cited source could be read from a legal place, so every source locator is unverified and the wording and arrangement comparison is left to the human reviewers.

## R01 (P2) — The Summary's two statements on regular two-graphs are false for `K₅`: they drop the hypothesis that 6.2 and 6.3 carry

A reader who stops at the overview takes away two equivalences that fail for the complete graph. The sixth headline bullet (README lines 28–30) says the two-graph of a graph is regular of degree `k` exactly when a descendant is strongly regular with `k = 2μ`, and that a regular graph has a regular two-graph exactly when it is strongly regular with `k - n/2` as an eigenvalue, with no further hypothesis.

For `K₅`: every triple is odd, so the two-graph is regular of degree `3`; the descendant at any vertex is `K₄`, which is `IsSRGWith 4 3 2 μ` for every `μ`, and `3 = 2μ` has no solution, so the first equivalence fails. `K₅` is `4`-regular and strongly regular in Mathlib's sense with a regular two-graph, but `k - n/2 = 3/2` is not among its eigenvalues `4, (-1)⁴`, so the second fails. The last Checks of 6.2 and of 6.3 record exactly these two computations, and both layer statements (and both Lean statements, through `hK` and `hE`) assume that `G` is switching equivalent neither to `⊤` nor to `⊥`.

The smallest change: open the bullet with the hypothesis, for example "for a graph that is switching equivalent neither to the complete nor to the empty graph, the two-graph is regular of degree `k` exactly when …, and such a graph, if regular, has a regular two-graph exactly when …".

## C01 — The affine recognition theorem of ZigzagPreprojective 0.1 is not in the pinned Tau Ceti

Three places say it is: "each formalized in Tau Ceti and consumed through Tau Ceti" (Scope and ownership, line 893), "The affine recognition theorem of ZigzagPreprojective 0.1 is formalized in Tau Ceti" (line 909), and "formalized in Tau Ceti; used in 2.2" (supplier contracts, line 971); the pull request description repeats it ("affine recognition, formalized in Tau Ceti"). An implementer of 2.2 would look for a declaration and find none.

ZigzagPreprojective 0.1 on main states the theorem as a target, `affine_graph_recognition` ("Prove existence and uniqueness of the type …"). At the pin, no Tau Ceti declaration concludes `G ≃g t.graph` from a natural null vector: the only matches for an isomorphism onto `t.graph` are the star comparison in `TauCeti/LinearAlgebra/RootSystem/AffineDynkinType/Star.lean` (line 294) and `TauCeti/RepresentationTheory/Quiver/AffineE8/Zigzag.lean` (line 126), and `TauCeti/Combinatorics/SimpleGraph/AdditiveFunction.lean` has only the kernel and energy lemmas. The supplier citation itself is sound (a roadmap on main, by section). Say in the three places, and in the description, that it is a target of ZigzagPreprojective 0.1 (`affine_graph_recognition`), and drop it from "Already in the libraries".

## C02 — The `ℤ`-span of `rootsD n` is not the checkerboard lattice at `n = 1`

In the coordinate-models bullet of 3.1 (line 340), "that of `rootsD n` is `TauCeti.IntegralLattice.checkerboardLattice`" reads as holding for every `n`, the restriction `n ≥ 4` qualifying only the isometry with the root lattice. At `n = 1` the set `rootsD 1` is empty (the README's own Check), so its span is `0`, while the checkerboard lattice in `ℚ¹` is the even integers (`checkerboardCarrier`: integer vectors with even coordinate sum, `TauCeti/LinearAlgebra/IntegralLattice/RootLattice/TypeD/Basic.lean`, line 235). Write "for `n ≥ 2`" after the span equality; for `n = 0` both sides are `0`.

## C03 — `cocktailPartyGraph m` is Mathlib's `completeEquipartiteGraph m 2` with `Bool` for `Fin 2`, and 4.1 does not say so as a statement

Mathlib's `completeEquipartiteGraph r t` on `Fin r × Fin t` has adjacency `v.1 ≠ w.1` (`Mathlib/Combinatorics/SimpleGraph/CompleteMultipartite.lean`, lines 220–224), which is the definition of 4.1 (README line 451; `Suggested.lean` line 540) up to `Bool ≃ Fin 2`; and the spectrum target of 4.1 is then the case `r = m`, `t = 2` of GraphSpectra 2.6 (`2(m - 1)`, `0^m`, `(-2)^{m-1}`), as its own suggested proof says. A reader cannot tell whether a second carrier is intended. Either define it through the Mathlib graph, or keep it and say in one clause why (`Bool` matches the petal index of 4.2), listing the isomorphism with `completeEquipartiteGraph m 2` in the basic API and the spectrum as that instance of GraphSpectra 2.6.

## C04 — `Σ θ_i² = 2m` is cited to GraphSpectra 1.3, which itself hands it to SpectralGraphBounds 1.1

In 5.1 (lines 593 and 598) the number of edges is read from "`Σ θ_i² = tr A² = 2m` (GraphSpectra 1.3)". GraphSpectra 1.3 at its head states only the triangle count and the Laplacian traces as targets and says that "`∑ θᵢ = 0` and `∑ θᵢ² = 2m` are SpectralGraphBounds 1.1". Cite SpectralGraphBounds 1.1 for this identity (it is already a supplier, for 1.1 and 1.2).

## C05 — Four declarations of `Suggested.lean` are small worked examples, not headlines

`adjSpectrum_star_eq_adjSpectrum_sum_cycle` (line 250), `cospectralSix` (line 271), `not_isDeterminedByAdjSpectrum_star` (line 716) and `lapSpectrum_complete_sum_matching` (line 722) each compute the spectrum of one or two fixed graphs on at most 15 vertices; the third follows from the first in a few lines. As acceptance tests they ask an implementer for a finite computation. None closes with one tactic (I tried `rfl`, `simp` and `infer_instance` on a copy), so they are not empty; if they are kept as sanity checks of the definitions of 1.1 and 5.1, say so in their docstrings, or leave them in the README as the Checks they already are.

## N01 — `largestEigenvalue_diagramGraph` has `haveI` inside its statement

`Suggested.lean` line 441 puts `haveI : Nonempty (Fin t.rank) := …` in the theorem's type, so the instance is a `let` inside the statement and the theorem is awkward to rewrite with. Stating it for `adjEigenvalues (diagramGraph t.cartanMatrix) ⟨0, _⟩`, or with a `[Nonempty (Fin t.rank)]` binder, avoids it.

## Questions for the author

- The page numbers for Brouwer–Haemers here (§1.8.2 at p. 15, Theorem 10.3.1 at p. 154, Proposition 10.6.4 at p. 163) differ from those EquiangularLinesAndTwoGraphs gives for the same items (pp. 23, 150, 158), and not by a constant shift. Are yours all from the Springer 2012 edition named in the References? I could not read either printing.
- In the last Check of 5.1, is `-1 < β < 0` the range of Proposition 14.4.1 in the parametrisation `A + βJ` used there? I could not open the text.
- In the first Check of 4.4, the statement that the representation printed at [BH, p. 112] uses half vectors with one minus sign rests on the source's sign convention for `E₈`; the repair by negating one coordinate is correct either way (I recomputed the dot products), but I could not confirm what the source prints.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 six-vertex pair | both edge lists | charpoly `[1,0,-7,-4,7,4,-1]` for both; degrees `5,2,2,2,2,1` and `3,3,3,3,1,1` | holds | none |
| 1.2 Seidel-cospectral regular | Petersen; `4K₁` vs `C₄` | Seidel `3⁵,(-3)⁵`; `0⁴` vs `2,0²,-2` at unequal degree | holds; degree needed | none |
| 1.3 Godsil–McKay | `T(2,2,2)` on `Fin 7`; `Fin 4` control | switched edges `15,16,24,26,34,35` = `C₆ ⊔ K₁`; `(½J-I)²=I`; `(⅔J-I)²=I+(4/9)J` | holds | none |
| 2.1 index and `2I - A` | `K₃`, `P₃`, `K₄` | null vector `(1,1,1)`; minors `2,3,4`; form value `8-12=-4` | holds | none |
| 2.2 Smith | `K₁`, `K₂`, `K_{1,4}`, `T(1,2,5)`, `C₃ ⊔ C₄` | `K₁`: `0=2a` forces `a=0`; `θ₁(T(1,2,5))=2.000`; marks `6;3;4,2;5,4,3,2,1` | holds | C01 |
| 2.3 sub/supergraphs | `T(1,2,6)`, `K₄`, `P₃` | `θ₁=2.00659`; `K₄ ⊒ C₃` (one vertex fewer), `C₄` (two edges fewer) | holds | none |
| 2.4 index `2cos(π/h)` | `E₈=T(1,2,4)`; `D_n`; root counts | `θ₁=1.98904=2cos(π/30)`; `rank·h`: `8·30`, `n(2n-2)`, `n·2n`, `4·12`, `2·6` | holds | N01 |
| 3.1 coordinate models | `n=0,1`; parity | `rootsD 1=∅`, span `0` vs checkerboard `2ℤ`; `112+256=368`; dot `3/2` | span claim fails at `n=1` | C02 |
| 3.3 Gram classification | `K₃`, `C₄`, `K_{1,4}`, Petersen, `[[2,±2],[±2,2]]` | det `4`; radical `(1,-1,1,-1)`; lattice det `4` rank `4`; Petersen rank `6` det `3`; `±2` gives `A₁` | holds | none |
| 3.4 CGSS | `K_{1,4}` in `D₄`; `K_{1,5}` | centre·leaf `1`, leaf·leaf `0`; least eigenvalue `-√5` | holds | none |
| 4.1 cocktail party | `m=1,2,3` | `0,0`; `2,0²,-2`; `4,0³,(-2)²`; equals `K_{m×2}` formula | holds; Mathlib carrier | C03 |
| 4.3 `A_n`/`D_n` | sign patterns | `(e_i-e_j)·(e_k-e_i)=-1`; triangle `e₁+e₂,e₂-e₃,e₁-e₃` normalises by flipping coordinate 3 | holds | none |
| 4.4 exceptional bounds | `K₈ + L(K₈)` graph | `36` vertices, degree `7+21=28`; dots `1`, `1/0`; after sign flip minus counts `0` or `2` | holds | none |
| 4.5 regular GLG | degree comparison; `K₇ ⊔ CP(4)` | forces `deg y + 2a_y = 0`; both `6`-regular, `CP(4) ⊒ K₅ - e` induced | holds | none |
| 5.1 recognition | `K_{1,4}`, `P₄`, `K_{1,3}`, empty type | `Σθ²=8`, `nθ₁=10`; walks `14`, `18`; `tr L²=Σd²+Σd` | holds | C04 |
| 5.2 regular graphs | `C₄`, `2K₂` | `0,2²,4`; `4,2²,0`; complement `1,1,-1,-1` | holds | none |
| 5.3 DS graphs | `C₆` vs `2C₃`; `m=0`, `n=0` | `2,1²,(-1)²,-2` vs `2²,(-1)⁴` | holds | none |
| 5.4 counterexamples | `K₅ ⊔ 5K₂`, Petersen `⊔ 5K₁` | both `0⁶,2⁵,5⁴`; 15 vertices, 15 edges | holds | C05 |
| 5.5 index below two | ranks 4, 6, 7, 8; `D₆ ⊔ P₄` | `h`: `5≠6`; `7,10,12`; `8,12,18`; `9,14,30`; both `{0²,±c₁..±c₄}` | holds | none |
| 6.1 descendant | Petersen, `C₄`, `n=1` | Petersen: `x` isolated, descendant `4`-regular on 9; `C₄`: empty | holds | none |
| 6.2 two-graph vs descendant | Petersen, `C₅ ⊔ K₁`, `L(K₈)ᶜ`, `K₅` | `2(k-μ)=k`, `n-2k+2λ=k`; `(9,4,1,2)`, `(5,2,0,1)`, `(27,10,1,5)`; `K₅`: `3≠2μ` | holds with `hK`, `hE` | R01 (Summary) |
| 6.3 regular graphs | Petersen, grid, `K₅`, `K_{3,3}`, `3K₂`, `L(K₈)ᶜ` | `-2` yes; `-1/2` no, Seidel `-3,0,3`; `3/2` no; `K_{3,3}` excluded (switches to empty) | holds with `hK`, `hE` | R01 (Summary) |
| 6.4 relative bound converse | icosahedron, 28 lines, simplex, `d=1`, three controls | `12/5=12/5`; `56/9=56/9`; `0=0`; controls `6/5≠16/5`, `1≠3/2`, `2≠12/5` | holds | none |
| Summary, sixth bullet | `K₅` | two-graph regular of degree 3; descendant `K₄`; `3/2 ∉ {4,-1}` | false as written | R01 |

- Source locators checked against the text: 0 of the 15 sampled targets' locators; no cited text could be read from a legal place (see Not verifiable).
- Library declarations opened at the pin: 14 (among them `graphCartanMatrix`, `AdditiveFunction.lean` line 92; `DynkinType.Valid`, `DynkinType.lean` line 153; `AffineDynkinType.Valid` and `IsGraphical`, `AffineDynkinType/Basic.lean` lines 156 and 179; `diagramGraph`, `FiniteType/Diagram.lean` line 81; `posDef_graphCartanMatrix_iff`, `FiniteType/SimpleGraph.lean` line 156; the affine containment theorem, `Quiver/FiniteRepType/AffineSubgraph.lean` line 173; `numRoots`, `NumberOfRoots.lean` line 45; `checkerboardLattice`, `TypeD/Basic.lean` line 235; `starHasCartanType_D`, `Star/Classification.lean` line 348; Mathlib `completeEquipartiteGraph` and `IsSRGWith`). All 28 `#check` pins elaborate.
- Cross-roadmap citations resolved: 24 sections (GraphSpectra 1.2, 1.3, 1.7, 2.4, 2.5, 2.6, 3.2, 3.4, 3.8; SpectralGraphBounds 1.1, 1.2; LaplacianEigenvaluesOfGraphs 1.1; TopologicalCombinatorics 3.1; EquiangularLinesAndTwoGraphs 1.1, 1.2, 2.1–2.4, 3.1, 5.1; StronglyRegularGraphsAndDesigns 1.3; LaplacianSpectraAndSpanningTrees 2.3; ZigzagPreprojective 0.1; RootSystems §3.1; IntegralLattices rows 0G, 1K), each at its open head or on main; one mispointed (C04). The copied definitions agree character for character with the suppliers' files (Seidel matrix, switch, odd triples, regular two-graph, equiangular family, sign graph, sorted eigenvalues, spectra, Petersen graph).
- Dependency check: `depcheck: 35 roadmaps, 409 edges, 0 problem(s)`; no UPWARD or CYCLE line. The seven open suppliers each add a new roadmap folder.
- Elaboration of `Suggested.lean`: exit 0, 40 `sorry` warnings and the `#check` output, nothing else. Elaborated types compared with the README statements; the six declarations that drop a section instance (`IsRegularTwoGraph`, `RootRepresentation`, `GeneralizedLineGraphRel`, `generalizedLineGraph`, `glgIncidence`, `descendant`) lose only `Fintype`/`DecidableEq` instances their types do not use, no hypothesis.
- One-tactic probe on a copy (`rfl`, `simp`, `infer_instance`): none of the 40 theorems closes.
- Automatic checks: two failed. The `haveI` in a signature is N01; the other is set aside below. Twelve dotted names reported as found nowhere (`Connected.…`, `IsRegularOfDegree.…`, `RootRepresentation.…`) are declared in `Suggested.lean` under the roadmap's `SimpleGraph` namespace.
- Changes outside the folder: none.

Overlap check: read EquiangularLinesAndTwoGraphs, GraphSpectra, StronglyRegularGraphsAndDesigns, CharacteristicPolynomialsAndStarComplements, GraphSymmetryAndCayleyGraphs, ZigzagPreprojective, RootSystems; Seidel matrices, switching, two-graphs and equiangular families: EquiangularLinesAndTwoGraphs (definitions copied here); spectra, the Petersen graph and line-graph incidence: GraphSpectra; affine recognition by a null vector: ZigzagPreprojective 0.1; descendants and their strong regularity: this roadmap (EquiangularLinesAndTwoGraphs and StronglyRegularGraphsAndDesigns both place them outside their scope); cospectral graphs and Godsil–McKay switching: this roadmap (CharacteristicPolynomialsAndStarComplements excludes them); generalized line graphs and root systems of graphs: this roadmap (GraphSpectra lists them as beyond it). McKaySkewGroup was not read.

Source independence: 0 passages compared with 0 sources, because no cited text could be read from a legal place; largest share BH, 45 of 90 locators; contents not compared with BH. From the locators alone, Layers 1 to 6 draw on BH §1.8, §3.1, §§8.2–8.4, (CRS §3.4 with BH §8.4), §14.4 and §§10.3, 10.6: not a consecutive run of sections, and Layers 5 and 6 reverse the chapter order.

Research link: the headline targets are Smith 1970, Cameron–Goethals–Seidel–Shult 1976 (graphs with least eigenvalue `-2` and root systems), Godsil–McKay 1982 (switching) and the determined-by-spectrum programme of van Dam–Haemers 2003; this rests on the README's References, not on a text I read.

## Not verifiable

- [BH] every locator (Figure 1.1; §1.8.2, §1.8.3; Theorem 3.1.3, §3.1.1; §8.2, §8.3.2, §8.3.3, Theorem 8.4.1; Theorem 10.3.1, Proposition 10.6.4; Proposition 14.4.1 to 14.4.7, Lemma 14.4.3): the DOI resolves only to a paywalled publisher, and the copy on the first author's page was refused because its address does not name an author in full; no local copy.
- [CRS] p. 6, Definition 1.2.3, Definition 3.4.1, Theorems 3.4.2 to 3.4.6, Theorem 3.11.1, §6.4: the publisher's page is on an unclassified host; no legal copy found.
- [GR] §11.6, Theorem 11.6.1, Theorem 11.7.1, §12.1: paywalled publisher.
- [Bi] 2f, p. 12: unclassified publisher host; no legal copy found.
- [vDH], [CGSS]: paywalled publisher. [GM], [Sm], [Wi], [Go], [Sch]: not fetched; none is the sole support of a sampled target.
- Consequently the sampled targets 1.2, 2.1, 2.2, 2.3, 3.3, 3.4, 4.4, 5.1 to 5.5, 6.1, 6.3 and 6.4 were verified as mathematics (table above) but not against their sources.

Automatic checks set aside as false positives: the section comment "Library declarations consumed" at the end of `Suggested.lean` was reported as a heading with no declaration under it; it heads the `#check` lines that pin library declarations, which is what such lines are for.

## Source issues

- none

## For the human reviewers

- Not tested: BH (Brouwer–Haemers, *Spectra of Graphs*) carries 45 of the README's 90 locators; neither its text nor its contents page could be read, so wording and arrangement were not compared with it or with any other source.
- Licence: a draft of BH is on its first author's own page (win.tue.nl, under the author's initials); the sources service could not classify that address as an author's page. Its pagination may differ from the Springer edition cited.
- Reuse: `Suggested.lean` lines 54–236 copy definitions character for character from five roadmaps that are still open pull requests (GraphSpectra, SpectralGraphBounds, LaplacianEigenvaluesOfGraphs, TopologicalCombinatorics, EquiangularLinesAndTwoGraphs), each labelled with its owner.
