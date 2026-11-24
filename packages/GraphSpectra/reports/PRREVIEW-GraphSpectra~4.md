# Review of GraphSpectra (pull request #3014 at 4dcfaf8)

**Verdict:** accepted

**Summary.** Accepted: no finding. The one finding of the previous review is repaired: the pendant-vertex recursion, the derivative of the characteristic polynomial and the comparison with spanning subgraphs are now targets with routes, and the grafting route built on them was recomputed and holds. Every statement was recomputed on small and degenerate instances and none was found false; the 57 Brouwer–Haemers locators were read against the text this time; `Suggested.lean` elaborates with `sorry` as its only warning. There are three small corrections and two format notes, none blocking. For the human reviewers: the locators into the four other books could not be read.

## C01 — The Petersen counts of 2.4 are not at the locator given for them

In 2.4 (line 489) "10 vertices, is 3-regular and has 15 edges" is cited to [BH, §1.4.5, p. 10]. That paragraph only introduces the Petersen graph as the complement of `T(5)` and gives its spectrum (BH's text, lines 765–766 of the 2011 proof). The 15 edges and 3 edges at each vertex are stated in §1.5.1, p. 12 (lines 837–838). Cite §1.5.1, p. 12 for the counts, or both.

## C02 — `IsTree.le_largestEigenvalue` is two components of `Connected.largestEigenvalue_bounds`

In a scratch file importing the built module, `⟨(Connected.largestEigenvalue_bounds G hG.1).1, (Connected.largestEigenvalue_bounds G hG.1).2.2.1⟩` proves the tree lower bound with its equality case, because a tree is connected and the two statements have the same conclusion. As a statement of `Suggested.lean` it therefore asks nothing beyond the connected-graph theorem, although on the route of 3.4 it is the step proved first. Would you say so in its docstring (as is done for the hypercube and Petersen spectra: "the tree case of `Connected.largestEigenvalue_bounds`, named because the route proves it first"), or keep it in the README only?

## C03 — Mathlib has one more spectral statement about a `SimpleGraph` than the supplier contract says

"Mathlib has no spectral statement about a `SimpleGraph` beyond the eigenvalue `k` of a `k`-regular graph" (line 1011). The pinned Mathlib also has `SimpleGraph.card_connectedComponent_eq_finrank_ker_toLin'_lapMatrix` (`Mathlib/Combinatorics/SimpleGraph/LapMatrix.lean:283`): the kernel of the Laplacian has dimension the number of components, which is the multiplicity of the Laplacian eigenvalue `0`. An implementer of the kernel of `Q` in 1.1 or of the components in 1.7 would want to know of it. Name it in that sentence.

## N01 — Three "Used in" entries of the supplier contracts are citations, not uses

LaplacianEigenvaluesOfGraphs 2.1 is "Used in 3.8", but the `*Needs:*` line of 3.8 is "1.2, 3.2" and neither target of 3.8 uses it (the section only points to it for the Laplacian spectrum of the complement); the description lists it as a supplier of 3.8 as well. Likewise SpectralGraphBounds 1.2 for 3.6 and 1.1 for 3.1, which those sections cite and do not use. Write "Cited in …; not a dependency", as is done for 1.4 and for LaplacianEigenvaluesOfGraphs 1.2.

## N02 — Two leftovers of form from the previous round

The heading "Beyond this roadmap (a roadmap for a roadmap; do not implement)" still reads as an instruction to a worker, and the closing header "Library declarations consumed" of `Suggested.lean` has only `#check` lines under it.

## Verified sound

Previous review (at c5eacf0), finding by finding. R01 (the grafting route of 3.4 rested on two unowned lemmas): repaired. 1.2 now has "**Pendant vertex** (`charpoly_adjMatrix_of_leaf`). If `v` has degree `1` and neighbour `u`, then over any commutative ring `χ_G = Xχ_{G-v} - χ_{G-u-v}`" and "**Derivative of a characteristic polynomial** (`Matrix.derivative_charpoly`)", each with a route from pinned Mathlib declarations; 3.4 has "**Spanning subgraphs** (`eval_charpoly_adjMatrix_le`, `Connected.eval_charpoly_adjMatrix_lt`)" with a route by induction through the derivative; the scope sentence now reads "the vertex-deletion identities beyond those of 1.2 and 3.4". C01: repaired ("is a sanity check of the definition (`signlessLapEigenvalues_nonneg`)"). C02: repaired ("Two special cases carry names of their own because other roadmaps cite them"). C03: repaired ("the Anderson–Morley bound, is LaplacianEigenvaluesOfGraphs 4.1, which gives `νᵢ ≤ ν₁ ≤ 2k_max` at once"). N01: the unused [BH] Theorem 2.4.1 is gone; the heading and the closing header remain (N02). N02: repaired for 3.1 and for LaplacianEigenvaluesOfGraphs 1.2; three entries of the same kind remain (N01). The previous question on the printing of BH is answered below.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 forms, edge matrices, `UUᵀ = Q`, nullity of `Q`, `SLS = Q` | `P₃`, `K₃`, `K₂`, edgeless, empty type, `K₂ ⊕ K₃` | `Q(P₃) = [[1,1,0],[1,2,1],[0,1,1]]`, `u=(1,-1,1)`: `0`; nullities `1, 0, 1, n, 0, 1`; `(SLS)_{xy} = s_x s_y(-1) = 1` on edges | holds | none |
| 1.2 membership, `χ_A`, multiplicity, regular graphs | `K₂`, `K₁`, empty, `K₄`, `K_{1,3}`, `C₄` | `{1,-1}`, `X²-1`; `{0}`; `∅`; `ν = 4,4,4,0 = 3-θ` reversed, `q = 6,2,2,2`; `q(K_{1,3}) = 4,1,1,0`; `count 0 = 2` | holds | none |
| 1.2 derivative, pendant vertex, sparse expansion | `K₂`, `K₃`, `[[a]]`; `P₃` at leaf and at centre; `k = 0` | `2X = X+X`; `3X²-3 = 3(X²-1)`; `1` = empty charpoly; `X(X²-1)-X = X³-2X`; centre `X³-X ≠ X³-2X`; `M₀₀M₁₁ - M₀₁M₁₀` | holds; degree `1` needed | none |
| 1.3 trace identities | `K₃`, `K₄`, `C₄`, `K₂` | `8-1-1 = 6`; `27-3 = 24 = 6·4`; `8+0+0-8 = 0`; `2+0 = 2m` | holds | none |
| 1.4 `ν, q ≤ 2k_max` | `K₂`, `K_{1,3}`, edgeless | `2 = 2·1`; `4 ≤ 6`; `0 ≤ 0`; `ν₁(K₂) = 2 > k_max = 1` | holds | none |
| 1.5 variational formula | `P₃`, `K₂`, `Kₙ`, `2K₁`, `K₁` | `2/2 = 1`; `4/2 = 2`; `n`; edgeless `n=2`: `0 = ν₁`; `n = 1`: set empty | holds; `2 ≤ n` needed | none |
| 1.6 irreducibility | `K₂`, `K₁`, `2K₁` | `A² = I`; `[0]` has no positive power entry though connected; `0` reducible | holds; `Nontrivial` needed | none |
| 1.7 unions, isomorphisms, components | `K₂ ⊕ K₁`, `K₃ ⊕ K₃`, `K_{1,4}` vs `C₄ ⊕ K₁` | `{1,-1,0}`, `(X²-1)X`; `{0,0,3,3,3,3}`; both `2, 0³, -2` | holds | none |
| 1.8 spectrum from idempotents | `K₂`; a zero `Eᵢ`; incomplete system; repeated `θ` | ranks `1,1`; zero `Eᵢ` adds nothing; `{0} ≠ {0,0}`; count `5 ≠ 2` | holds | none |
| 2.1 degrees | `K_{1,3}`, `K_{2,2,2}`, `K_{1,2,3}` | `3, 1`; `4`; `5, 4, 3` | holds | none |
| 2.2 Laplacian of the path | `n = 0, 1, 3, 4`; shifted formula | `∅`; `{0}`; `0, 1, 3`; `0, 2-√2, 2, 2+√2`; shifted misses `0` | holds | none |
| 2.3 Hamming API | `H(0,q)`, empty `Q`, `q = 1`, `H(2,3)`, `Q₃` | one vertex, degree `0`; empty type; degree `d·0`; `4` on `9` vertices; distance `3` | holds | none |
| 2.4 Johnson, Kneser, Petersen | `J(4,2)`, `K(4,2)`, `J(α,1)`, `J(n,0)`, `K(5,2)`, `k > n` | degree `4`; `3K₂`; singletons disjoint; `0`; `10-1-6 = 3`, `15` edges; no vertices | holds | C01 |
| 2.5 line graphs | `K₃`, `K₄`, `K₅`, `C₄`, `k = 0, 1` | `2,-1,-1`; `4, 0³, (-2)²`; `6, 1⁴, (-2)⁵`; `2,0,0,-2` with `0` copies of `-2`; `2k-2 → 0` | holds | none |
| 2.6 multiset spectra | `K_{r×t}` counts, `r = 1`, `q = 1`, `J(5,2)`, `K(5,2)`, `K(6,3)`, `J(4,3)`, `C₂`, `K_{0,1}`, `K(n,0)` | `1+r(t-1)+(r-1) = rt`; `0ᵗ`; `{0}`; `6,1⁴,(-2)⁵`; `3,(-2)⁴,1⁵`; `1¹⁰,(-1)¹⁰`; six values on four vertices; `±2 ≠ ±1`; two values on one vertex; `{1} ≠ {0}` | holds; hypotheses needed | none |
| 3.1 distinct eigenvalues | `Kₙ`, `C₅`, `Pₙ`, `K₁`, `2K₂`, empty | diam+1 vs distinct: `2,2`; `3,3`; `n,n`; `1,1`; `2K₂` has `diam 0`, two values; empty: `0 ≠ 1` | holds | none |
| 3.2 Perron–Frobenius | `K₁`, `K_{1,3}`, `2K₂` | `θ₁ = 0`, count `1`, `v = (1)`; `A(√3,1,1,1) = √3(√3,1,1,1)`; multiplicity `2`, `(1,1,0,0)` | holds | none |
| 3.3 degree bounds | `P₄`, `K_{1,3}`, `K₁`, `K₃ ⊕ K₂` | `1 < 1.5 < 1.618 < 2`; `1 < 1.5 < 1.732 < 3`; `0 = 0` regular; `θ₁ = 2 = k_max` not regular | holds | none |
| 3.4 monotonicity, spanning subgraphs | `K₂ ⊕ K₁ ⊂ P₃`, `P₃ ⊂ K₃`, `K₂ ⊕ 2K₁ ⊂ 2K₂`, `x = -1` | `χ_H - χ_G = X`, `X+2`; both `0` at `1`; `0 < 1` | holds; connectivity and `x ≥ θ₁` needed | none |
| 3.4 grafting and its route | `G = K₂`, `k = l = 1`; `G = K₁`; general `k ≥ l` | `√3 > 1.618`; both `P₃`; `a_{k+1,l-1} - a_{k,l} = a_{k,l-2} - a_{k-1,l-1} = … = χ_{(G-v)⊕P_{k-l+1}} - χ_{G(k-l,0)}` | holds | none |
| 3.4 extremes, trees | `n = 1, 2`; trees on 5 vertices; `IsTree` from `Connected` | `0 ≤ 0 ≤ 0`; `1`; `√3`, `√(2+√2)`, `2`; one term closes the tree lower bound | holds | C02 |
| 3.5 Motzkin–Straus | `C₅`, `K₃`, edgeless, `v = (1,1,-2)` on `K₂ ⊕ K₁` | `0.4 ≤ 0.5`, edge gives `0.5`; `2/3`; `0 ≤ 0`; `2 > 0` | holds; `v ≥ 0` needed | none |
| 3.5 Stanley, Hong, Wilf, Nikiforov, Nosal, Hofmeister | `K₄`, `K_{1,3}`, `C₅`, `K₃`, `C₄ ⊕ K₁`, `K_s` plus isolated, edgeless | `3 = 3`, `3 = 3`; `√3`, `2 > √3`; `2 ≤ 2.5`, `2 ≤ √5`; `4 ≤ 4`; `√(8-5+1) = 2`; `((2s-1)-1)/2 = s-1`; `0`, `s = ∅` | holds | none |
| 3.6 Hoffman | `K₃`, `C₄`, `K₁`, `2K₂` | `3(A+I)/3`; `A(A+2I)/2·𝟙 = 4·𝟙`; empty product `J = I`; no polynomial | holds | none |
| 3.7 bipartite regular | `C₄`, `C₅`, `K₁`, `C₄ ⊕ K₃` | `-2 = -k`; `-1.618 ≠ -2`; `0 = -0`; `θₙ = -2` with a triangle | holds | none |
| 3.8 complement | `P₃`, `Kₙ`, `J(5,2)`; entries of `nI - J - L` | diagonal `n-1-d`, edge `0`, non-edge `-1`; `0ⁿ`; `3, (-2)⁴, 1⁵` | holds | none |
| 3.9 main eigenvalues | `K_{1,3}`, `C₄`, `K₁`, `P₃`, empty, `h = 0` | main `±√3`, two orbits; `4·2ʰ`; `0⁰ = 1`; main `±√2`; `0 = 0`; `n∑β² = n` | holds | none |
| Supplier contract: Eberlein value | class `i = 1`, `i = k` | `(k-j)(n-k-j) - j`; only `h = j`: `(-1)^j C(n-k-j, k-j)` | agrees with 2.6 and AssociationSchemes 5.1 | none |
| Supplier contract: Mathlib's spectral statements | grep of the pin | `IsRegularOfDegree.mem_spectrum_adjMatrix` (LapMatrix.lean:60) and `card_connectedComponent_eq_finrank_ker_toLin'_lapMatrix` (:283) | one omitted | C03 |

- Source locators checked against the text: 57 of 106. All 57 into BH were read: 47 (Chapters 1–3) for statement and page in the 2011 proof on Brouwer's page, whose printed pages agree with the README's; 10 (§§12.2, 12.4.1, 12.4.2 and Chapter 15) for statement and section in the later online version, their pages being the online ones plus 4, consistent with the printed chapter ranges (Chapter 12 pp. 177–185, Chapter 15 from p. 221). One slip (C01). The 49 locators into CRS, St, B and Ba were not readable.
- Library declarations opened at the pin: `Matrix.IsIrreducible` (`Mathlib/LinearAlgebra/Matrix/Irreducible/Defs.lean:83`), `Matrix.PosSemidef.eigenvalues₀_nonneg` (`TauCeti/Analysis/Matrix/Eigenvalues/Basic.lean:166`), `Matrix.IsHermitian.trace_pow_eq_sum_eigenvalues_pow` (`TauCeti/Analysis/Matrix/Spectrum.lean:140`), `SimpleGraph.lineGraph` and its lemmas (`Mathlib/Combinatorics/SimpleGraph/LineGraph.lean`), `SimpleGraph.LapMatrix.lean:60, 283`; the 55 Mathlib and 7 Tau Ceti names pinned by `#check` resolve. Neither library has a derivative formula for `Matrix.charpoly`, a Johnson, Hamming or Petersen graph, a signless Laplacian or a spectrum of a named graph.
- Cross-roadmap citations resolved: RandomMatrices 1.2 on main; at open heads SpectralGraphBounds 1.1–1.4, LaplacianEigenvaluesOfGraphs 1.1, 1.2, 2.1, 4.1, PeriodicNonnegativeMatrices 3.1–3.3, AssociationSchemes 5.1, TopologicalCombinatorics 3.1, QuasirandomGraphs 4.1, DelsarteTheoryOfCodesAndDesigns 2.1, MatchingPolynomial 2.1, SpectralQuantumWalks Layers 1 and 7. The seven copied definitions agree with the suppliers' `Suggested.lean`. Every declaration name that another open roadmap cites from this one (ten roadmaps) is declared at this head.
- Dependency check: `depcheck: 129 roadmaps, 1436 edges, 0 problem(s)`; no UPWARD or CYCLE line. Every supplier not on main is an open pull request that adds a new roadmap.
- Elaboration: `lake env lean` on `TauCetiRoadmap/GraphSpectra/Suggested.lean` exits 0 with 93 `sorry` warnings and no other message; no `set_option`, no sorried definition. The elaborated types of the 119 declarations were compared with the README; the four definitions without `[Fintype V]` do not need it, and every real-valued bound has its subtraction in `ℝ`.
- One-tactic probe on a copy: all 93 sorried theorems tried with `rfl`, `simp`, `simp` with the definitions unfolded and `infer_instance`: none closes. By `exact`: `signlessLapEigenvalues_nonneg` (marked as a sanity check) and `IsTree.le_largestEigenvalue` (C02).
- No change outside `TauCetiRoadmap/GraphSpectra/`. The description agrees with the head but for the supplier entry of N01 (93 `sorry`, six sanity checks, four Tau Ceti imports all confirmed).
- Overlap check: read CharacteristicPolynomialsAndStarComplements, SpectralGraphBounds, LineSystemsAndSwitching, StronglyRegularGraphsAndDesigns, LaplacianEigenvaluesOfGraphs, GraphSymmetryAndCayleyGraphs, CocliquesColouringsAndTheta, and on main QuantumOptimization and MarkovChainMixing; sorted adjacency eigenvalues, `2m ≤ nθ₁`, `θ₁ ≤ k_max`, `|θᵢ| ≤ θ₁`: SpectralGraphBounds; sorted Laplacian eigenvalues, component count, complement spectrum, Anderson–Morley: LaplacianEigenvaluesOfGraphs; derivative of the characteristic polynomial, pendant-vertex recursion, signless Laplacian, the three multiset spectra, Hamming and Johnson graphs, eigenspace projections and main angles: here, consumed by the open roadmaps that cite 1.2, 2.3–2.6 and 3.9, through citations and local copies; nothing has two owners.

Source independence: 16 passages compared with 1 source (BH, both cached versions), none shared beyond formulas and statements of a dozen words; largest share BH, 57 of 106 locators; contents compared with BH: independent (Layer 1 draws on BH §§1.1–1.3, 1.7, 3.1 and 3.9, Layer 2 on §1.4 and §12.4, Layer 3 on §§1.3, 2.2, 3.1, 3.3, 3.4 and Chapter 15, in an order none of which is BH's, and 3.4–3.5 and 3.9 are not in BH's arrangement at all). CRS, St, B and Ba could not be read.

Research link: the headline targets are the classical index bounds (Stanley, Hong, Wilf, Nikiforov, Nosal, Hofmeister), the grafting of pendant paths, Hoffman's polynomial, main eigenvalues and the spectra of Hamming, Johnson and Kneser graphs, as in Brouwer–Haemers 2012, Cvetković–Rowlinson–Simić 2010 and Stanić 2015; ten open roadmaps on expanders, strongly and distance-regular graphs and star complements cite them. Rests on the README and those roadmaps.

## Not verifiable

- CRS (Cvetković–Rowlinson–Simić): all 26 locators, among them those of the sampled 1.6, 2.6, 3.2 and 3.5 and of the new targets (Theorems 2.2.1, 2.3.1, Lemma 8.1.19, Theorem 8.1.20). The publisher's page is not an open host and there is no cached copy; the statements were checked by computation only.
- St (Stanić): all 10 locators (sampled: 3.5). Same.
- B (Biggs): all 10 locators (sampled: 1.2, 1.3, 2.5, 3.8). Same.
- Ba (Bapat): all 3 locators (sampled: 1.1, 2.5). Recorded as paywalled.
- The printed pages of BH in Chapters 12 and 15 (10 locators): only the two versions on Brouwer's pages were read; the pages fit the printed chapter ranges and were not seen.
- The README flags no locator as unverified. The statements of 1.4 (its target), 1.8 and 2.1 carry no locator and were checked by computation.

Automatic checks set aside as false positives: three Mathlib lemma names ending in a prime (`Matrix.charpoly_mul_comm'`, `Matrix.det_apply'`, `SimpleGraph.lapMatrix_toLinearMap₂'`) were taken for names this roadmap claims to declare; all three are Mathlib's, are pinned by `#check` in the file and resolve.

## Source issues

- none

## For the human reviewers

- **Not tested.** The locators into CRS (26), St (10), B (10) and Ba (3) were not read: no legal copy. The new targets of 1.2 and 3.4 and the bounds of 3.5 rest on CRS and St alone.
- **Licence.** BH was read in the two versions on Brouwer's own pages (the 2011 proof and the later online version), not in the Springer print; the manifest records BH as paywalled and uncertified.
