# Review of GraphSpectra (pull request #3014 at c5eacf0)

**Verdict:** needs changes

**Summary.** Changes are needed for one finding: the route of the grafting theorem in 3.4, on which the lower bound for trees and for connected graphs now rests, uses two facts about characteristic polynomials that are neither targets nor supplied, and that the scope section hands to roadmaps that do not exist yet. The two unowned theorems of the previous review (the path as the tree of least index, and Motzkin–Straus) are now targets with routes, and those routes check out. Every statement was recomputed on small and degenerate instances and none was found false; `Suggested.lean` elaborates with `sorry` as its only warning. There are three small corrections and two format notes, none blocking. None of the five cited books could be read legally, so no locator was checked against its text; that is left to the human reviewers.

## R01 (P2) — The grafting route of 3.4 rests on two characteristic-polynomial lemmas that nothing owns

An implementer of "Grafting pendant paths" is stuck at both steps of its route, and through it so are the lower bounds for trees (`IsTree.le_largestEigenvalue`) and for connected graphs (`Connected.largestEigenvalue_bounds`). The suggested proof (README lines 678–683) uses (a) the recursion of the characteristic polynomial at a pendant vertex, `χ_{G(k,l)} = Xχ_{G(k,l-1)} - χ_{G(k,l-2)}`, and (b) that `χ_H - χ_{G'}` is positive beyond `θ₁(G')` when `H` is a proper spanning subgraph of a connected `G'`, cited to a lemma of CRS. Neither is a target of this roadmap, a section of a supplier, or a declaration of the pinned Mathlib or Tau Ceti (I searched the pinned libraries and every roadmap on main and in an open pull request for a pendant-vertex or vertex-deletion formula for `charpoly` of an adjacency matrix and found none). The scope section says the opposite of what the route needs: "Not owned here, and owned by later roadmaps: the coefficients of the characteristic polynomial and vertex deletion" (line 927). A later roadmap cannot supply 3.4.

The route itself is sound, which I checked: writing `a_{k,l} = χ_{G(k,l)}`, the recursion applied in both arguments gives `a_{k+1,l-1} - a_{k,l} = a_{k,l-2} - a_{k-1,l-1}`, and after `l - 1` steps `a_{k-l+2,0} - a_{k-l+1,1} = χ_H - χ_{G(k-l,0)}` with `H = (G - v) ⊕ P_{k-l+1}`, which is `G(k-l,0)` without the edges of `G` at the attachment vertex `v`. For `G = K₂`, `k = l = 1`: `χ_{P₄} - χ_{K_{1,3}} = (X⁴ - 3X² + 1) - (X⁴ - 3X²) = 1 = X·X - (X² - 1)`. And (b) holds on `P₃ ⊃ K₂ ⊕ K₁` (difference `X`) and `K₃ ⊃ P₃` (difference `X + 2`).

The smallest change: state the two lemmas in 3.4 as targets, with their hypotheses and locators, and name them in the scope sentence as the part of vertex deletion that is stated here. For instance: "(pendant vertex) if `u` has the single neighbour `v`, then `χ_G = X·χ_{G-u} - χ_{G-u-v}` over any commutative ring" and "(spanning subgraphs) if `H` is a proper spanning subgraph of a connected graph `G`, then `χ_H(x) > χ_G(x)` for every real `x ≥ θ₁(G)`", the second with its own route.

## C01 — `signlessLapEigenvalues_nonneg` closes with one `exact` from Tau Ceti and the positive semidefiniteness stated just above it

On a copy of the file, `exact (posSemidef_signlessLapMatrix G).eigenvalues₀_nonneg i` proves it, as the route of 1.2 itself says ("so Tau Ceti's `Matrix.PosSemidef.eigenvalues₀_nonneg` applies"). As a target it asks an implementer for nothing beyond `posSemidef_signlessLapMatrix`. Would you mark it as a sanity check, like the four entries of `Q`, or keep it as a sentence of 1.2?

## C02 — Another open roadmap cites two declarations of 2.6 that this head no longer has

ExpanderWalksAndCodes cites "GraphSpectra 2.6 `adjSpectrum_petersenGraph`" and "`adjSpectrum_hypercube`" (its README, lines 170, 180 and 714). This head states those two spectra in prose after the targets of 2.6 ("these are not separate targets", line 528), so the section number still resolves and the names do not. Either keep the two names as marked special cases of `adjSpectrum_kneserGraph` and `adjSpectrum_hammingGraph`, or tell the consumer to cite those two; its other citations (3.2 and 3.7, by name) resolve at this head.

## C03 — The Laplacian half of 1.4 is a consequence of a sharper bound that a supplier already owns

`lapEigenvalues_le_two_mul_maxDegree` states `νᵢ ≤ 2k_max`. LaplacianEigenvaluesOfGraphs 4.1 (the Anderson–Morley bound, at its open head) proves that a graph with an edge has an edge `xy` with `ν₁ ≤ d(x) + d(y)`, which gives `νᵢ ≤ ν₁ ≤ 2k_max` in one line (and `ν = 0` without edges). 1.4 cites that roadmap for nothing. Would you cite 4.1 there for the Laplacian and keep the Gershgorin route for `qᵢ ≤ 2k_max`, which is this roadmap's own?

## N01 — Three leftovers of form

The closing header "Library declarations consumed" of `Suggested.lean` has only `#check` lines under it. The reference entry for [BH] lists "Theorem 2.4.1, p. 26", which no section cites. The heading "Beyond this roadmap (a roadmap for a roadmap; do not implement)" still reads as an instruction to a worker rather than as mathematics.

## N02 — Two `*Needs:*` lines disagree with the routes and the supplier contracts

3.1 lists 1.6, which its route does not use (it uses walk counts from Mathlib). The contract for LaplacianEigenvaluesOfGraphs 1.2 says "Used in 1.5 and 3.1", but neither section's `*Needs:*` line names it, and 1.5 cites it only for statements it does not use.

## Questions for the author

- Which printing do the Brouwer–Haemers page numbers refer to? The suppliers cite the same items with other pages (§12.4.2 at p. 175 in AssociationSchemes 5.1 against p. 179 here; Proposition 3.4.1 at p. 46 in PeriodicNonnegativeMatrices 3.2 against p. 38 here; §1.3.2 at p. 14 in LaplacianEigenvaluesOfGraphs 2.1 against p. 4 here). I could not read the book, so I cannot say which is right.

## Verified sound

Previous review, finding by finding. R01 (unowned theorems in 3.4 and 3.5): repaired for both ("**Trees: the lower bound** (`IsTree.le_largestEigenvalue`)", "**Motzkin–Straus** (`dotProduct_mulVec_adjMatrix_le_cliqueNum`)", each with locators and a route); the new route raises this round's R01. C01 (one-tactic declarations): repaired, five kept and marked "Sanity check of the definition", the others removed. C02 (oblique idempotents): repaired, the Check now uses `E₁ - N`, `E₂`, `E₃ + N`, recomputed below. C03: the section is gone. C04: the description now reads as asked. N01: repaired but for the closing header. N02: repaired ("Hong's bound (3.5, which does not use this section)"). N03: repaired but for the heading.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 forms, `UUᵀ = Q`, kernel and nullity of `Q`, sign conjugation | `P₃`, `K₃`, `K₂`, `K₂ ⊕ K₃`, edgeless, empty type | `Q(P₃) = [[1,1,0],[1,2,1],[0,1,1]]`, `u=(1,-1,1)` gives `0`; nullities `1, 0, 1, 1, n, 0`; `SLS(K₂) = [[1,1],[1,1]]` | holds | none |
| 1.2 spectra, regular graphs at reversed index, `q ≥ 0` | `K₄`, `K_{1,3}`, `P₃`, `K₁`, empty | `ν = 4,4,4,0 = 3 - θ` reversed; `q = 6,2,2,2`; `q(K_{1,3}) = 4,1,1,0`; `{0}`; empty multiset | holds | C01 |
| 1.3 trace identities | `K₃`, `K₄`, `C₄`, `K₂` | `8-1-1 = 6`; `27-3 = 24 = 6·4`; `8+0+0-8 = 0`; `2+0 = 2m` | holds | none |
| 1.4 `ν, q ≤ 2k_max` | `K₂`, `K_{1,3}`; Anderson–Morley on `K_{1,3}` | `2 = 2·1`; `4 ≤ 6`; `d(x)+d(y) = 4 ≤ 6` | holds | C03 |
| 1.5 variational formula | `P₃`, `K₂`, `Kₙ`, `K₁` | `u=(1,0,-1)`: `2/2 = 1`; `4/2 = 2`; `uᵀLu = n uᵀu` on `𝟙^⊥`; `n = 1`: set empty | holds; `2 ≤ n` needed | none |
| 1.6 irreducibility | `K₂`, `K₁`, `2K₁` | `A² = I`; `[0]` not irreducible though connected; `0` reducible | holds; `Nontrivial` needed | none |
| 1.7 unions, isomorphisms, components | `K₂ ⊕ K₁`, `K₃ ⊕ K₃`, `K_{1,4}` vs `C₄ ⊕ K₁` | `{1,-1,0}`, `χ = (X²-1)X`; `{0,0,3,3,3,3}`; both `2, 0³, -2` | holds | none |
| 1.8 spectrum from idempotents | `K₂`; `E₁-N, E₂, E₃+N` on `Fin 6`; a zero `Eᵢ`; incomplete system | `(E₁-N)² = E₁-N`, `(E₁-N)(E₃+N) = N-N = 0`, sum `I`, same `M`, traces `2,1,3`; count `5 ≠ 2`; `{0} ≠ {0,0}` | holds | none |
| 2.1 degrees | `K_{1,3}`, `K_{2,2,2}`, `K_{1,2,3}` | `4-1 = 3`, `4-3 = 1`; `6-2 = 4`; `5, 4, 3` | holds | none |
| 2.2 Laplacian of the path | `n = 0, 1, 3, 4` | `∅`; `{0}`; `0, 1, 3` (sum `4 = 2m`); `0, 2-√2, 2, 2+√2` | holds | none |
| 2.3 Hamming API | `H(0,q)`, empty `Q`, `H(2,3)`, `q = 1` | one vertex, degree `0`; empty type; `2·2 = 4` on 9 vertices; degree `d·0 = 0` | holds | none |
| 2.4 Johnson, Kneser, Petersen | `J(4,2)`, `K(4,2)`, `J(α,1)`, `J(n,0)`, `K(5,2)` | degree `2·2 = 4`; `3K₂`; distinct singletons disjoint; `0 - 0 = 0`; `10 - 1 - 6 = 3`, `15` edges | holds | none |
| 2.5 line graphs | `K₃`, `K₄`, `K₅`, `k = 0, 1` | `2,-1,-1`; `4, 0³, (-2)²`; `6, 1⁴, (-2)⁵` (`10-5` copies of `-2`); `2k-2` truncates to `0` | holds | none |
| 2.6 multiset spectra | `K_{r×t}`, `H(d,q)` count, `J(5,2)`, `K(6,3)`, `J(4,3)`, `C₂`, `K(n,0)` | `1+r(t-1)+(r-1) = rt`; `6,1⁴,(-2)⁵`; `1,(-1)⁵,1⁹,(-1)⁵`; six values on four vertices; `±2 ≠ ±1`; `{1} ≠ {0}` | holds; hypotheses needed | C02 |
| Eberlein value in the contract | `i = 1`, `i = k` | `(k-j)(n-k-j) - j`; only `h = j`: `(-1)^j C(n-k-j, k-j)` | agrees with 2.6 and AssociationSchemes 5.1 | none |
| 3.1 distinct eigenvalues | `Kₙ`, `C₅`, `Pₙ`, `K₁`, `2K₂` | diam+1 vs distinct: `2,2`; `3,3`; `n,n`; `1,1`; `2K₂`: `diam = 0`, two values, not complete | holds | N02 |
| 3.2 Perron–Frobenius | `K₁`, `K_{1,3}`, `2K₂` | `θ₁ = 0` simple, `v = (1)`; `A(√3,1,1,1) = √3(√3,1,1,1)`; multiplicity `2` | holds | none |
| 3.3 degree bounds | `P₄`, `K_{1,3}`, `K₃ ⊕ K₂` | `1 < 1.5 < 1.618 < 2`; `1 < 1.5 < 1.732 < 3`; `θ₁ = 2 = k_max`, not regular | holds | none |
| 3.4 monotonicity, extremes, trees | `n = 1, 2`; trees on 5 vertices; `K₃ ⊕ K₁` | `0 ≤ 0 ≤ 0`; `1 ≤ 1 ≤ 1`; `√3`, `√(2+√2)` (roots of `X⁴-4X²+2`), `2`; same index `2` | holds | none |
| 3.4 grafting and its route | `G = K₂`, `k = l = 1`; `G = K₁` | `√3 > 1.618`; `χ_{P₄} - χ_{K_{1,3}} = 1 = X² - (X²-1)`; both `P₃` | statement holds; route inputs unowned | R01 |
| Spanning-subgraph lemma used in 3.4 | `K₂ ⊕ K₁ ⊂ P₃`, `P₃ ⊂ K₃`, `2K₁ ⊂ K₂` | `χ_H - χ_G = X`, `X + 2`, `1`, positive beyond `θ₁(G)` | true, unowned | R01 |
| 3.5 Motzkin–Straus | `C₅`, `K₃`, edgeless, `v = (1,1,-2)` on `K₂ ⊕ K₁` | `10/25 ≤ 1/2`, edge gives `1/2`; `2/3 = 1 - 1/3`; `0 ≤ 0`; `2 > 0` | holds; `v ≥ 0` needed | none |
| 3.5 Stanley, Hong, Wilf, Nikiforov, Nosal, Hofmeister | `K₄`, `K_{1,3}`, `C₅`, `K₃`, `C₄ ⊕ K₁`, `K_s` plus isolated | `3 = 3`, `3 = 3`; `√3`, `√(12/4)`; `2 ≤ 2.5`, `2 ≤ √5`; `4 ≤ 4`; `√(8-5+1) = 2`; `(2s-1-1)/2 = s-1` | holds | none |
| 3.6 Hoffman | `K₃`, `C₄`, `K₁`, `2K₂` | `J = A + I`; `A(A+2I)/2` has row sums `4`; empty product gives `J = I`; no polynomial | holds | none |
| 3.7 bipartite regular | `C₄`, `C₅`, `K₁`, `C₄ ⊕ K₃` | `-2 = -k`; `-1.618 ≠ -2`; `0 = -0`; `θₙ = -2` with a triangle | holds | none |
| 3.8 complement | `P₃`, `Kₙ`, `2K₂`, `J(5,2)` | `(n-1-d)I - (J-I-A) = nI - J - L`; `0ⁿ`; `2, -2, 0, 0 = C₄`; `3, (-2)⁴, 1⁵` | holds | none |
| 3.9 main eigenvalues | `K_{1,3}`, `C₄`, `K₁`, `P₃` | main `±√3`, two orbits; `N_h = 4·2ʰ`; `1·1·0⁰ = 1`; main `±√2`, `(1,0,-1) ⊥ 𝟙` | holds | none |

- Source locators checked against the text: 0 of 99 (no cited book could be read legally).
- Library declarations opened at the pin: `SimpleGraph.lapMatrix_toLinearMap₂'` and `SimpleGraph.posSemidef_lapMatrix` (`Mathlib/Combinatorics/SimpleGraph/LapMatrix.lean:176, 191`), `SimpleGraph.incMatrix_mul_transpose` (`IncMatrix.lean:165`), `SimpleGraph.lineGraph` (`LineGraph.lean:34`), `Matrix.IsIrreducible` (`LinearAlgebra/Matrix/Irreducible/Defs.lean:83`), `Matrix.IsHermitian.charpoly_eq`, `roots_charpoly_eq_eigenvalues₀`, `spectrum_real_eq_range_eigenvalues` (`Analysis/Matrix/Spectrum.lean:157, 168, 213`), `Matrix.PosSemidef.eigenvalues₀_nonneg` (`TauCeti/Analysis/Matrix/Eigenvalues/Basic.lean:166`); the 48 Mathlib and 7 Tau Ceti names pinned by `#check` all resolve. Neither library has a Johnson, Hamming, Kneser or Petersen graph, a signless Laplacian or a spectral statement about a line graph.
- Cross-roadmap citations resolved: RandomMatrices 1.2 on main; at open heads SpectralGraphBounds 1.1–1.4, LaplacianEigenvaluesOfGraphs 1.1, 1.2, 2.1 (and 4.1, Layer 3), PeriodicNonnegativeMatrices 3.1–3.3, AssociationSchemes 5.1, TopologicalCombinatorics 3.1, QuasirandomGraphs 4.1, DelsarteTheoryOfCodesAndDesigns 2.1, MatchingPolynomial 2.1. The seven copied definitions agree with the suppliers' `Suggested.lean` character for character.
- Dependency check: `depcheck: 132 roadmaps, 1464 edges, 0 problem(s)`; no UPWARD or CYCLE line. Every supplier not on main is an open pull request that adds a new roadmap.
- Elaboration: `lake env lean` on `TauCetiRoadmap/GraphSpectra/Suggested.lean` exits 0 with 87 `sorry` warnings and no other message; no `set_option`, no sorried definition. The elaborated types of all 113 declarations were compared with the README; the four definitions without `[Fintype V]` (`unsignedIncMatrix`, the two edge matrices, `onesVec`) do not need it.
- One-tactic probe on a copy: 18 declarations tried, 1 closed (C01); the five marked sanity checks were not tried again.
- No change outside `TauCetiRoadmap/GraphSpectra/`.
- Overlap check: read SpectralGraphBounds, LaplacianEigenvaluesOfGraphs, AssociationSchemes, ExpanderWalksAndCodes, StronglyRegularAndMooreGraphs (and the suppliers PeriodicNonnegativeMatrices, TopologicalCombinatorics, QuasirandomGraphs); sorted adjacency eigenvalues, `2m ≤ nθ₁`, `θ₁ ≤ k_max`, `|θᵢ| ≤ θ₁`: SpectralGraphBounds, copied or cited; sorted Laplacian eigenvalues, component count, complement spectrum, Anderson–Morley: LaplacianEigenvaluesOfGraphs (C03); variational formula and `L(Ḡ) = nI - J - L`: here (route steps there); irreducibility of a connected graph's adjacency matrix: here (a route step in PeriodicNonnegativeMatrices 3.1); Kneser graph: TopologicalCombinatorics, copied; Johnson scheme: AssociationSchemes, the multiset spectra here; Perron–Frobenius for graphs and the regular bipartiteness criterion: here, consumed by ExpanderWalksAndCodes (C02); spectra of strongly regular graphs: StronglyRegularAndMooreGraphs, not stated here. Nothing has two owners.

Source independence: 0 passages compared with 0 sources, because none of the five cited books could be read; largest share BH, 56 of 99 locators; contents not compared with BH (its contents page sits behind the publisher's sign-in). By the README's own locators the layers do not track one chapter each (Layer 1 mixes BH §§1.1–1.3, 1.7 and 3.1; Layer 2 mixes §1.4 and §12.4; Layer 3 mixes §§1.3, 2.2, 3.1, 3.3, 3.4 with CRS and St).

Research link: the headline targets are the classical index bounds (Stanley, Hong, Wilf, Nikiforov, Nosal, Hofmeister), Hoffman's polynomial, main eigenvalues and the spectra of Hamming, Johnson and Kneser graphs, as in Brouwer–Haemers 2012, Cvetković–Rowlinson–Simić 2010 and Stanić 2015; the open roadmaps ExpanderWalksAndCodes and RamanujanGraphs build on them. Rests on the README and those roadmaps.

## Not verifiable

- BH (Brouwer–Haemers, *Spectra of Graphs*): all 56 locators, including those of the sampled sections 1.1–1.7, 2.2, 2.4, 2.6, 3.2, 3.6, 3.8. Recorded as paywalled; the sources service refused the copy on a university page because its address names no author.
- CRS (Cvetković–Rowlinson–Simić): all 22 locators (sampled: 1.1, 1.6, 2.6, 3.2, 3.5, 3.9). The publisher's page is not an open host; no local copy.
- St (Stanić): all 10 locators (sampled: 3.5). Same.
- B (Biggs): all 8 locators (sampled: 1.3, 3.6, 3.8). Same.
- Ba (Bapat): all 3 locators (sampled: 1.1). Recorded as paywalled.
- The README flags no locator as unverified. Sections 1.4 (its target) and 1.8 carry no locator for their statements and were checked by computation only.
- Ownership against open pull requests was checked through the search over all open heads; the suppliers' folders were read at their heads.

Automatic checks set aside as false positives: two Mathlib lemma names ending in a prime (`Matrix.charpoly_mul_comm'`, `SimpleGraph.lapMatrix_toLinearMap₂'`) were taken for names this roadmap claims to declare; both are Mathlib's and both resolve at the pin.

## Source issues

- none

## For the human reviewers

- **Not tested.** BH has the largest share of the locators (56 of 99); neither its text nor its contents page could be read legally, and the same holds for CRS, St, B and Ba. Wording and arrangement were not compared with any source.
- **Licence.** Brouwer's own institutional page hosts a draft of BH; the sources service refused it because the address does not spell an author's name. A human can decide whether it counts as an author's page (its pagination differs from the printed book).
