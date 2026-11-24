# Review of LaplacianSpectraAndSpanningTrees (pull request #3063 at 78f553d)

**Verdict:** accepted

**Summary.** Accepted: no stated result, Check, proof sketch or convention was found false on recomputation, degenerate cases included, and the previous review's finding (minors consumed from a roadmap that may not supply them) and its two corrections are repaired. `Suggested.lean` elaborates with `sorry` as its only warning, and no sorried statement closes with one tactic. There are one small correction and two format notes, none blocking. Eight of the ten cited books could not be read from a legal place, so their printed locators stay unverified; that, the status of two sources, and the two prospective owners of graph minors are left to the human reviewers.

## C01 — The two API statements on minors carry finiteness and decidability assumptions on the ambient graph only, which neither statement uses

`IsMinor.of_injective` and `IsMinor.trans` (`Suggested.lean`, lines 752 and 757) elaborate with `[Fintype V] [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj]`, inherited from the section variables, while `H` and `K` live on arbitrary types. `MinorModel` and `IsMinor` themselves elaborate without these instances, and the arguments of 11.3 (singleton branch sets; unions of branch sets) use none of them. As stated, transitivity applies when the middle graph is infinite but not when the outer one is, and a minor of an infinite graph cannot be composed.

An `omit [Fintype V] [DecidableEq V] [DecidableRel G.Adj] in` line before each, as the file already has before the cut-vector statement (line 237) and before `isHermitian_distMatrix` (line 462), would state both at the generality of the definition.

## N01 — The Conventions paragraph on minors links a Mathlib pull request by number

Lines 165–167 of the README describe an unmerged Mathlib pull request and its argument order. A reader a year from now cannot tell what it then contains; "a contraction-of-a-subgraph definition proposed for Mathlib" without the number would stay true. (The pull request's page shows the names `IsContraction` and `IsMinor` but not their signatures, so the remark on the opposite argument order could not be confirmed.)

## N02 — The last section comment of `Suggested.lean` heads only `#check` lines

"Library declarations consumed" (line 863) introduces no declaration; a plain `--` comment would do.

## Questions for the author

- [BH] page numbers. This README cites Proposition 3.9.1 at p. 50 and Corollary 3.9.2 and Proposition 3.9.3 at p. 51; LaplacianEigenvaluesOfGraphs 4.1 and 4.2, which this roadmap consumes, cites the same two results at p. 58 and §3.9 at p. 57. Do the two roadmaps use different printings, and which does the reference entry "Universitext, Springer, 2012" describe? No legal copy of either could be read.
- 6.2 says that [NP, Remark 2.7.6, p. 92] prints `2π` for `π`. The bound with `π` is right (equality on `P₄`: `2 − √2` on both sides) and with `2π` false; whether the book prints that could not be checked, the text being paywalled.

## Earlier findings

- R01 (minors consumed from SurfaceTopology): repaired. 11.3 now reads "`G.IsMinor H` is `Nonempty (MinorModel G H)`", adds as targets subgraphs, transitivity and "Minors in steps", and its *Needs:* line names only 11.2 and Mathlib. SurfaceTopology remains in two boundary sentences and in "Beyond this roadmap", never as a supplier. The move is recorded: minors of simple graphs are stated here, not imported.
- C01 (unfoldings among the Lean statements): repaired; seven docstrings now end "Sanity check of the definitions", and 1.1, 2.1 and 3.1 say so.
- C02 (recipe for a Colin de Verdière matrix): repaired; the constant now lies "strictly between its second largest adjacency eigenvalue and its Perron value", and a Check computes `c = 0` (`−2, 1, 1`) against `c = −2` (`−4, −1, −1`) on `K₃`.
- N01 (`module`, `public import`): not raised again; 140 of the 528 `Suggested.lean` files on main open the same way.
- N02 (`#check` of total unimodularity): repaired; the line is gone. The section comment above the list is N02 above.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `L = BBᵀ`, cut vectors, bridge (sampled) | `K₂`; `P₃`, `S = {0,1}`; Tau Ceti boundary | `BBᵀ = [[1,−1],[−1,1]]`; `Bᵀ𝟙_S = (0,1)`; library sends a dart to `e_tgt − e_src`, `src = fst`, so `−B` | true | none |
| 1.2 rank, cut space | `P₃`, `2K₂`, `C₄`, empty `V` | ranks `2`, `2`; kernel `ℝ(1,1,1,1)`, cut vector `(1,0,0,−1)`, dot `0`; `0 = 0 − 0` | true | none |
| 2.1 trees and rooted forests (sampled) | `K₁`, `C₄`; `R = V`, `R = ∅`, `V = ∅`; `R = {q}` | `N = 1`, `4`; only `∅`; none for `n ≥ 1`; `∅` rooted at `∅` on empty `V`; reach `q` ⇒ connected | true | none |
| 2.2 rooted-forest theorem | `P₃` weights `a, b`: `R = {0,2}`, `{1}`; `K₃`, `R = {2}`; `R = V = ∅` | `a + b`; `ab`; `3 = 3`; empty determinant `1` = one forest | true | none |
| 2.3 Temperley, `nN = ∏ν` (sampled) | `K₁`, `K₂`, `K₃`, `C₄`, `2K₁`; `J/n` variant | `1`; spectrum `ν, 1/n` gives `(1/n)·nN`; `3`; `16/4 = 4`; `0 = 0`; `J/n` on `K₂`: `2 ≠ 1` | true | none |
| 3.1 Kirchhoff | `K₂` conductance `c`; `C₄` adjacent, opposite; `K₂ + K₁`; loops | `1/c`; `3` of `6` two-edge sets, `3/4`; `4/4 = 1`; `0 = 1/0`; loop cancels on the diagonal | true | none |
| 3.2 edge probabilities | `C₄` edge; non-edge; `a = z`; disconnected | `3/4 = 1·3/4`; `0 = 0·1`; `0 = c(a,a)·0`; `0/0 = 0 = c·0` | true | none |
| 3.3 resistance in a tree (sampled) | `P₃`, `K_{1,3}`, `x = y`, `C₄` | `2`, `1`; `2`; `0 = 0`; `1 ≠ 2` | true | none |
| 4.1 critical group | `K₁`, `K₃`, `C₄`, `K₄`, `2K₁`, empty `V` | orders `1, 3, 4, 16`; `ℤ`, `Nat.card = 0 = N`; empty: `1 ≠ 0`, so `Nonempty V` needed | true | none |
| 4.2 `K ≅ C*/C ≅ F*/F` | `K₁`, `K₂`, `K₃`, `C₄`; map `x ↦ BᵀL⁺x` | all trivial; `F = ℤ(1,1,−1)`, norm `3`; norm `4`; `Bᵀu ∈ C*` iff `Lu ∈ ℤⱽ` | true | none |
| 5.1 `LΔ = τ𝟙ᵀ − 2I`, `Δτ = (n−1)𝟙` | general entry; `K₁`; `P₃` | `dD − (dD + d − 2) = 2 − d`; `0 = 2 − 2`; `Δτ = (2,2,2)` | true | none |
| 5.2 inverse, determinant, inertia (sampled) | `K₁`, `K₂`, `P₃`, `K_{1,3}`; induction factor | `0 = 1·0·1`; `−1`, inverse `[[0,1],[1,0]]`; `4`, eigenvalues `1 ± √3, −2`; `−12`; `−2(n−1)/(n−2)` | true | none |
| 6.1 Fiedler upper bounds (sampled) | `K₃`, `P₃`, `K_{2,3}`, `K₄`, `2K₁`; test vector | `3 = 3·2/2`; `1 ≤ 1`; `2 ≤ 2`; `4 > 3` so `G ≠ ⊤` needed; `0 ≤ 0`; `d(x)·n/(n−1)` | true | none |
| 6.2 Fiedler lower bound | `K₂`, `C₄`, `P₄`, disconnected | `2 = 2·1·1`; `2 ≥ 1.17`; `2 − √2` both sides; `κ' = 0` | true | none |
| 6.3 energy minimization | `k = 0`; `P₃`, `k = 2`; `K₃`, `k = 1` | `0`; `1 + 3 = 4 = tr L`; `3`; indices `n−2−i ≥ 0` for `i < k ≤ n−1` | true | none |
| 6.4 gap of constant-degree weight (sampled) | `K₃`, `C₄`, Petersen, `P₃` | `3/2`; `1`; `2/3`; `P₃`: `1 ≠ 3/4` | true | none |
| 7.1 multiplicity of `2` (sampled) | weights `(2,5)` on `P₃`; `(2,0)`; loop `[[1,1],[1,0]]`; `K₃`, `2K₂` | `0,1,2`, count `1`; `0,0,2`, count `1`; trace `3/2`, det `0`: `0, 3/2`; `0`; `2` | true | none |
| 7.2 trace and extremes | `K₃`, `P₃`, `K₁ + K₂`; test vector `e_s/d_s − e_t/d_t` | `λ₁ = 3/2`; `1`, top `2 ≥ 3/2`; trace `2 ≠ 3`; quotient `1` | true | none |
| 8.1 cut bounds | `C₄` adjacent, opposite; `n = 1`; `‖u‖²` | `2 ≤ 2 ≤ 4`; `4 = 4`; `0 ≤ 0 ≤ 0`; `s(n−s)/n` | true | none |
| 9.1 `ν₁ ≤ q₁` (sampled) | `C₄`, `K₃`, `C₄ + K₃` | `4 = 4`; `3 < 4`; `4 = 4` and not bipartite, so connectivity needed | true | none |
| 9.2 equality cases | `K₂`, `P₃`, `P₄`, `K_{1,3} + K₂`, `P₃ + K₂`; test vector | `2 = Δ+1 = max sum`; `3`; `2+√2 ∈ (3,4)`; `4 = Δ+1`, `Δ = 3 < 5`; `3`, not semiregular; `Δ(Δ+1)² + e` over `Δ(Δ+1)` | true | none |
| 10.1 conjugate degrees, threshold (sampled) | `P₄`, `K_{1,3}`, `C₄`, empty `V`; max and min weight in `S` | `(4,2,0,0)`, sum `6`; `1 > 1/2 ≥ 0`; `> 2t` and `≤ 2t`; vacuous both sides; one of the two is dominating or isolated | true | none |
| 10.2 threshold spectra (sampled) | `K_{1,3}`, `K₁ ∨ (K₁ + K₂)`, `P₄` | `(4,1,1,0)`; complement `K₁ + P₃` has `3,1,0,0`, so `(4,3,1,0) = d*`; `2+√2 ≠ 4` | true | none |
| 11.1 nodal domains | `K_{1,4}`, `θ = 1`; `2K₂`, `θ = 2`; zero matrix on `K₂`; `f = 0`; Duval–Reiner identity | `4 ≤ 4`, `2 ≤ 2`; `4 ≤ 2 + 2`; `2 > 1`; `0, 0`; difference `½∑ M f f (p_x − p_y)²` | true | none |
| 11.2 `μ` values, unions (sampled) | `K₀`, `K₁`, `K₂`, `3K₁`, `K₂ + K₁`, `2K₂`, `K_{1,3}`; shift recipe | `0`; `0`; `1`; `1`; `1`; `1 = max(1,1)`; `2` (rank-one excluded); `c − θᵢ`: one negative | true | none |
| 11.3 minors, monotonicity, `μ ≤ 1` (sampled) | singletons; union of branch sets; `2K₁ ≤ K₂`; `K_{1,3}` in max degree `2`; empty `W` | disjoint by injectivity; connected; `1 ≤ 1`; an arc has two leaving edges, three needed; `0 ≤ μ` | true | C01 |
| 12.1 standard eigenfunctions (sampled) | `K₂`, `K₃`, `K₂ + K₁`, `λ < 0`, empty `V` | `(πj)²` simple; `(2πj/3)²` double; mult. of `0` is `1 ≠ 2`; boundary terms cancel, `u = 0`; `0 = 0` | true | none |
| 12.2 generic eigenvalues | `P₃`; `K₃` at `(2π/3)²`; `K₂` at `(π/2)²`; `λ = 0` | `1 − cos(πj/2) = 1`; `3/2` double; `1` not an eigenvalue, mult. `0`; excluded by `j = 0` | true | none |
| 12.3 exceptional eigenvalues | `K₂`, `K₃`, `C₄`, `C₅`, triangle with pendant edge | `1, 1`; `0, 2`; `2, 2`; `0`; kernel of unsigned incidence: `|E| − n = 0 = β₁ − 1` | true | none |
| 12.4 Weyl's law (sampled) | `K₂`, `K₃`; count per period, bipartite and not | `1 + ⌊x⌋`; `1 + 2⌊x/2⌋`; `2(n−2) + 2(β₁+1)` and `2(n−1) + 2β₁`, both `2|E|` | true | none |

- Source locators checked against the text: 3 of 94 (Sp line 1688, printed p. 32; Sp line 5296, p. 124; Sp line 5397, p. 126); statement and hypotheses (connectedness in the first two) as the README reports.
- Library declarations opened at the pins: `TauCeti.DoubledQuiver.Orientation` (`TauCeti/RepresentationTheory/Quiver/Zigzag/Orientation.lean:73`); `incidenceBoundary`, `cycleLattice` (`TauCeti/Combinatorics/Graph/Serre/Cycle/Basic.lean:45, 55`); `SimpleGraph.toSerreGraph` (`…/Serre/Basic.lean:406`); `isVertexConnected_iff`, `vertexConnectivity`, `vertexConnectivity_top` (`…/Connectivity/VertexConnectivity.lean:226, 331, 398`); `edgeConnectivity`, `edgeConnectivity_eq_top_iff` (`…/EdgeConnectivity.lean:49, 94`); Mathlib `SimpleGraph.IsEdgeConnected` (`Mathlib/Combinatorics/SimpleGraph/Connectivity/EdgeConnectivity.lean:37`); the 61 `#check` lines elaborate, and the types of Cauchy–Binet, the cokernel order, Ky Fan, Perron–Frobenius and the minor expansion of the characteristic polynomial say what the README assumes of them.
- Cross-roadmap citations resolved at the open heads or on main: GraphSpectra 1.1, 1.5, 1.7, 2.2, 2.5, 3.3; LaplacianEigenvaluesOfGraphs 1.1, 1.2, 2.1, 3.2, 4.1, 4.2, 6.2, 6.3, 7.1; KernelsAndSpectralMethods 1.1–1.4, 2.1; ElectricalNetworksAndRandomWalks 1.1, 2.1, 3.3; RandomMatrices 1.2; GeometricTopology 4.4.5; SpanningTreesAndShortestPaths 5.1–5.2; LinearAlgebraMethodInCombinatorics 4.2; TropicalAndBerkovichArithmetic 3.4–3.5; FreeGroupsAndLimitGroups 2.2a; GraphConnectivityAndFlows 1.5, 6.1; MarkovChainMixing 2.3–2.4; DirectedMatrixTreeAndBEST 2.1–2.3; IntegerPolyhedraAndTotalUnimodularity 3.1; SurfaceTopology Layers 7 and 10. The 22 copied declarations agree with their owners' `Suggested.lean`.
- Duplication by object: no graph minor, matrix-tree theorem, oriented incidence matrix, critical group, distance matrix, threshold graph, Colin de Verdière invariant or metric-graph Laplacian in the pinned Mathlib or Tau Ceti; GraphSpectra, ElectricalNetworksAndRandomWalks and LaplacianEigenvaluesOfGraphs each leave the matrix-tree product formula, the spanning-tree formulas and the equality cases outside their scope.
- Dependency check: `depcheck: 129 roadmaps, 1436 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration: `sorry` the only warning (48). Elaborated types compared with the README for every theorem: hypotheses are explicit binders, casts in 5.2, 8.1 and 12.3 are at the leaves; the only difference is C01. One-tactic probe (`rfl`, `simp`, `infer_instance`, `simp` with the local definitions) on a copy: none of the 48 closes.
- Pull request text against the head: 12 layers, 30 subsections, 48 `sorry`, nine Tau Ceti imports, the supplier sections and "minors by branch sets, defined here (11.3)" all agree.
- Headline theorems of the Summary: all fourteen groups are stated in `Suggested.lean`; the corollaries and route steps kept in prose are named as such in the module docstring.

Overlap check: read LaplacianEigenvaluesOfGraphs, GraphSpectra, SpectralGraphBounds, CharacteristicPolynomialsAndStarComplements, ElectricalNetworksAndRandomWalks, GraphConnectivityAndFlows, SpanningTreesAndShortestPaths; nothing shared (the Laplacian case of 11.1 is LaplacianEigenvaluesOfGraphs 6.2–6.3 and the case `|R| = 1` of 2.2 is GeometricTopology 4.4.5, each cited as such). Outside the three lists, SurfaceTopology's open head carries a signature for minors of simple graphs; see the human reviewers' section.

Source independence: 6 passages compared with 1 source (Sp), none shared, and the routes of 2.3, 3.2 and 6.3 differ from the source's; largest share NP, 23 of 94 locators; its text could not be read, and its four chapter titles (from the publisher's and booksellers' listings) serve Layers 6 and 11 only, so contents compared with NP: independent.

Research link: The README's sources place the targets in Fiedler's algebraic connectivity, the nodal domain theorems of Davies, Gladwell, Leydold and Stadler, the minor-monotone Colin de Verdière invariant (BH Theorem 7.3.2) and Kurasov's 2024 spectral geometry of metric graphs; expander graphs are named as a consumer. Rests on the README.

## Not verifiable

- [Ba] Bapat (1.1, 3.3, 5.2, 6.1 of the sample): Springer, paywalled; no legal copy.
- [BH] Brouwer–Haemers (2.3, 9.1, 10.1, 10.2, 11.2, 11.3): the sources service refused the address of the online copy as an author's page.
- [Ch] Chung, Lemma 1.7 (7.1): refused for the same reason.
- [CRS] (2.3, 6.1, 7.1), [GR] (1.1), [Bi] (2.3), [Mo]: publisher pages only; not read.
- [NP] Naderi–Pankrashkin (6.1, 11.2, 11.3): paywalled; only the chapter list was seen.
- [Ku] Kurasov (12.1, 12.4): recorded as cited by locator only; not read.
- 2.1 and 6.4 of the sample carry no source locator; checked by computation and against the library.
- The argument order of the Mathlib pull request named in Conventions (N01).

Automatic checks set aside as false positives: three mentions of SurfaceTopology were read as citations of a roadmap that may not supply, but they are two boundary sentences and one line of "Beyond this roadmap", and nothing is consumed from it; two Mathlib names ending in a prime (`SimpleGraph.lapMatrix_mulVec_apply'`, `SimpleGraph.lapMatrix_toLinearMap₂'`) were read as names this roadmap claims to declare, but they are library declarations and both elaborate.

## Source issues

- none

## For the human reviewers

- **Not tested.** [NP] has the largest share of the locators (23 of 94); its text was not read, and wording was compared with [Sp] only. [Ba], [BH], [CRS], [GR], [Ch], [Bi], [Mo], [Ku] were not read either.
- **Licence.** [Sp] is an unpublished author manuscript ("Incomplete Draft", Sp line 6); it is the only source for the edge-probability theorem of 3.2.
- **Licence.** [Ku] is cited by locator only; whether the publisher's copy is open access was not settled.
- **Scope.** SurfaceTopology's open head gives `SimpleGraph.IsMinor` as a signature in its Layer 10; this roadmap now defines minors in 11.3 (`Suggested.lean` line 747). Which of the two keeps the object is the project's decision.
- **Scope.** SurfaceTopology is still named as a boundary (README lines 1258–1261) and in "Beyond this roadmap" (line 1383); whether that name may appear at all is the project's decision.
