# Review of LaplacianSpectraAndSpanningTrees (pull request #3063 at 44fe428)

**Verdict:** needs changes

**Summary.** Changes are needed, for one reason: the minors of 11.3 are taken from SurfaceTopology, which may not be cited as a supplier, so the minor monotonicity of the Colin de Verdière invariant rests on an API nobody owns. No stated result was found false: every theorem, Check and worked value was recomputed, including the degenerate cases, and `Suggested.lean` elaborates with `sorry` as its only warning. There are two small corrections and two format notes, none blocking. Nine of the ten cited books could not be read from a legal place, so most printed locators are unverified; that, and the status of one unpublished source, are left to the human reviewers.

## R01 (P2) — The minors of 11.3 are consumed from SurfaceTopology, which may not be a supplier, so the route to minor monotonicity uses an API with no owner

SurfaceTopology is on the project's list of roadmap names that must not be cited as suppliers. The README cites it as one in four places: the Summary ("on SurfaceTopology for minors of simple graphs", line 74), Conventions (lines 164–165), the *Needs:* line of 11.3 (line 1000, "SurfaceTopology, Layer 10 (minors)") and the contract `### From SurfaceTopology` (lines 1332–1336); `Suggested.lean` repeats it in the module docstring (lines 37–39) and in the section "Stand-in: SurfaceTopology, Layer 10" (lines 733–752). An implementer of `IsMinor.colinDeVerdiere_le` is therefore sent to a layer that cannot be waited for. What the route actually needs from it is real: the proof sketch of 11.3 treats deletion of an isolated vertex, deletion of an edge and contraction of an edge separately (lines 986–990), so it needs the fact that a minor in the branch-set sense is reached by such single steps, and 11.3 hands exactly that to SurfaceTopology ("identifying the two is part of consuming that layer", line 970). At its open head that roadmap gives the predicate only as a signature without a body in a README code block, as this README itself records at lines 1335–1336.

The smallest repair keeps everything already written. The definition by branch sets in 11.3 is the standard one and has a real body, and the two minor facts are already targets here. Make `MinorModel` and `IsMinor` this roadmap's own definitions (drop the words "stand-in" in the README at lines 965 and 970 and in the Lean file at lines 733–752), add to 11.3 as targets the facts the route uses (a subgraph is a minor; minors are transitive and invariant under isomorphism; a minor on a finite vertex type is reached from the graph by deleting vertices and edges and contracting edges, one at a time), remove SurfaceTopology from the *Needs:* line of 11.3, from the Summary's supplier sentence, from "Consumed, not restated" and from the supplier contracts, and add minors of simple graphs to "Owned here" for Layer 11. SurfaceTopology can stay as a boundary sentence (planarity and Wagner's theorem are there; neither is used). The pull request's description then loses SurfaceTopology from "Suppliers by section" and from its list of open suppliers, and the sentence "a branch-set stand-in for the minors of SurfaceTopology Layer 10" becomes "minors by branch sets, defined here".

## C01 — Several declarations of `Suggested.lean` are entrywise unfoldings or bridges rather than headline theorems

The file states 46 results. Most are the headlines of the Summary, but a handful ask an implementer for an unfolding of a definition made a few lines earlier: the cut-vector formula `transpose_orientedIncMatrix_mulVec_indicator` (the README calls it an entrywise computation from the definitions, lines 188–189), `incidenceBoundary_eq_neg_mulVec`, `orientedIncMatrix_mul_diagonal_mul_transpose` next to `orientedIncMatrix_mul_transpose`, `laplacian_eq_laplacian_weightMatrix`, `rootedForests_singleton`, `posSemidef_laplacian_weightMatrix`, and `isGeneralizedLaplacian_lapMatrix`, which the README already labels a sanity check. None closes by `simp` or `rfl` alone (I tried each on a copy), so this is a judgement from reading the definitions, not a mechanical result.

Would you either mark these in their docstrings as sanity checks of the definitions, as the last one is, or keep them in the README only, where they already stand as basic API and Checks? The headline statements are unaffected.

## C02 — The recipe for a Colin de Verdière matrix in the basic API of 11.2 does not produce one as worded

The parenthesis at lines 923–925 shifts `-A` by a constant on each component, "below the Perron value of exactly one component and above it on the others, avoiding the spectrum". On `K₃` the adjacency eigenvalues are `2, -1, -1`; the constant `-2` is below the Perron value `2` and avoids the spectrum, and `-A - 2I` has eigenvalues `-4, -1, -1`: three negative eigenvalues, not one. The constant on the chosen component must lie strictly between its second largest adjacency eigenvalue and its Perron value (the Perron value is simple on a connected graph). With "strictly between the second largest eigenvalue and the Perron value of exactly one component" the sentence is right; the claim it supports, that the set is nonempty for `n ≥ 1`, is true.

## N01 — `Suggested.lean` opens with `module`, `public import` lines and `@[expose] public section`

The roadmaps on main open with the plain line `import Mathlib` followed by the Tau Ceti modules. The file elaborates as it is; the plain form would match them.

## N02 — The closing `#check` list pins a declaration the README says is not used

`#check @Matrix.IsTotallyUnimodular` (line 895) pins total unimodularity, while "Scope and ownership" says that 1.2 and 2.2 do not need it (lines 1166–1168). The section comment above the list (line 856) heads only `#check` lines.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `L = BBᵀ`, cut vectors, bridge | `K₂`, `P₃` with `S = {0,1}`, Tau Ceti sign | `BBᵀ = [[1,-1],[-1,1]]`; `Bᵀ𝟙_S = (0,1)`; library boundary is `e_tgt − e_src = −B` | true | none |
| 1.2 rank `n − c`, cut space | `P₃`, `2K₂`, `C₄`, empty `V` | ranks `2, 2`; `ker B = ℝ(1,1,1,1)`, cut vector `(1,0,0,−1)` orthogonal; `0 = 0 − 0` | true | none |
| 2.1 trees, rooted forests (sampled) | `Kₙ`, `n ≤ 5`; `P₃`, `R = {0,2}`, `V`, `∅`; empty `V` | `1,1,3,16,125`; forests `{01},{12}`; only `∅`; none; `N = 0` on empty type | true | none |
| 2.2 rooted-forest theorem | `K₃` `R={2}`; weighted `P₃` `R={0,2}`, `{1}`; `R=∅`, `R=V=∅` | `3 = 3`; `a+b`; `ab`; `0 = 0`; empty determinant `1` = empty forest `1` | true | none |
| 2.3 Temperley, `nN = ∏ν` | `K₁`, `K₂`, `K₃`, `C₄`, `2K₁`; `J/n` variant | `1`; `25/16 − 9/16 = 1`; `3`; `16/4 = 4`; `0`; `J/n` gives `2 ≠ 1` | true | none |
| 3.1 Kirchhoff (sampled) | `K₂` cond. `c`; `K₃`; `C₄` adjacent, opposite; `K₂+K₁`; `a = z` | `1/c`; `2/3`; `3/4`; `4/4 = 1`; `0 = 1/0`; right side `1 ≠ 0` so `a ≠ z` needed | true | none |
| 3.2 edge probabilities | `K₃`, `C₄`, non-edge of `C₄`, `a = z`, disconnected | `2/3`; `3/4`, sum `3 = n−1`; `0 = 0·1`; `0 = c·0`; `0/0 = 0 = c·0` | true | none |
| 3.3 resistance in a tree | `P₃`, `K_{1,3}`, `x = y`, `C₄` | `2, 1`; `2`; `0 = 0`; `1 ≠ 2` on `C₄` | true | none |
| 4.1 critical group (sampled) | `K₁`, `K₂`, `K₃`, `C₄`, `K₄`, `2K₁`, empty `V` | orders `1,1,3,4,16`; Smith form `diag(1,4,4)`; `ℤ` infinite, `Nat.card = 0 = N`; empty: `1 ≠ 0` | true with `Nonempty V` | none |
| 4.2 `K ≅ C*/C ≅ F*/F` | `K₃`, `C₄`, `K₁` | `F = ℤ(1,1,−1)`, norm `3`, `ℤ/3`; norm `4`, `ℤ/4`; all trivial | true | none |
| 5.1 `LΔ = τ𝟙ᵀ − 2I`, `Δτ = (n−1)𝟙` (sampled) | `K₁`, `P₃` rows 0, 1; `K_{1,3}`; `C₄` | `0 = 2 − 2`; `(−1,1,1)`, `(0,−2,0)` both sides; `Δτ = 3·𝟙`; `C₄`: `0 ≠ 3·𝟙` | true | none |
| 5.2 inverse, determinant, inertia (sampled) | `K₁`, `K₂`, `P₃`, `K_{1,3}`, `C₄`; induction step | `0 = 0` (junk `2^0`, factor `0`); `−1`; `4`, eigenvalues `1±√3, −2`; `−12`; `C₄`: `0`; factor `−2(n−1)/(n−2)` | true | none |
| 6.1 Fiedler upper bounds (sampled) | `P₃`, `C₄`, `K_{1,3}`, `K_{2,3}`, `K₃`, `K₄`, disconnected | `1 ≤ 1`; `2 ≤ 2`; `1 ≤ 1`; `2 ≤ 2`; `3 = 3·2/2`; `4 > 3` so `G ≠ ⊤` needed; `0 ≤ 0` | true | none |
| 6.2 Fiedler lower bound (sampled) | `K₂`, `2K₁`, `C₄`, `P₄`, `2π` variant | `2 ≥ 2`; `0 ≥ 0`; `2 ≥ 1.17`; `2−√2` equality; `2π` gives `2 > 2−√2`, false | true | none |
| 6.3 energy minimization | `k = 0`; `P₃` `k=2`; `K₃` `k=1`; no constraint | `0`; `1+3 = 4 = tr L`; `3`; `0` at `𝟙/√n` | true | none |
| 6.4 gap of constant-degree weight (sampled) | `K₃`, `C₄`, Petersen, `P₃` | `3/2`; `2/2 = 1`; `2/3`; `P₃`: `1 ≠ 3/4` | true | none |
| 7.1 multiplicity of `2` (sampled) | weighted `P₃` `(2,5)`; `(2,0)`; loop `[[1,1],[1,0]]`; `K₃`, `2K₂` | spectrum `0,1,2`, count `1`; `0,0,2`, count `1` not `2`; `0, 3/2` vs one bipartite component; `0`; `2` | true | none |
| 7.2 trace and extremes | `K₂`, `K₃`, `P₃`, `C₄`, `K₁+K₂`; test vector | `λ₁ = 2 = n/(n−1)`; `3/2`; `1`, top `2 ≥ 3/2`; `1`; trace `2 ≠ 3`; quotient `1` | true | none |
| 8.1 cut bounds (sampled) | `C₄` adjacent, opposite; `K₃`; `K₂`; `P₃` `S={0}`; `n = 1` | `2 ≤ 2 ≤ 4`; `4 = 4`; `2 = 2 = 2`; `1 ≤ 1`; `1 < 2` with `ν₁`; `0 ≤ 0 ≤ 0` | true | none |
| 9.1 `ν₁ ≤ q₁` | `K₁`, `C₄`, `K₃`, `C₄+K₃` | `0 = 0`; `4 = 4`; `3 < 4`; `4 = 4` and not bipartite, so connected needed | true | none |
| 9.2 equality cases | `K₂`, `P₃`, `P₄`, `K₃`, `K_{1,3}`, `C₄`, `K_{1,3}+K₂`, `P₃+K₂` | `2`; `3 = Δ+1 = 3`; `2+√2 ∈ (3,4)`; `3 = Δ+1 < 4`; `4`; `4 = 2Δ`; `Δ = 3 < 5`; class degrees `2,1` | true | none |
| 10.1 conjugate degrees, threshold (sampled) | `P₄`, `K_{1,3}`, `C₄`, `2K₂`, singleton `S`, empty `V` | `d* = (4,2,0,0)`, sum `6 = 2m`; weights `1,0,0,0`, `t = 1/2`; `>2t` and `≤2t`; trivially both; vacuous | true | none |
| 10.2 threshold spectra | `K_{1,3}`, `K₃`, `K₁ ∨ (K₁+K₂)`, `P₄` | `(4,1,1,0)`; `(3,3,0)`; `(4,3,1,0)` via complement `K₁+P₃`; `2+√2 ≠ 4` | true | none |
| 11.1 nodal domains (sampled) | `K_{1,4}`; `P₃`; `2K₂`; `K₂+K₁` with `(0,0,1)`, `(1,1,−1)`; zero matrix on `K₂`; `f = 0` | `4 ≤ 4`, `2 ≤ 2`; `2, 2`; `4 ≤ 2+2`, `> 3`; `1 ≤ 2`, `2 ≤ 2`; `2 > 1`; `0, 0` | true | none |
| 11.2 `μ` values, unions (sampled) | `K₀`, `K₁`, `K₂`, `2K₁`, `3K₁`, `K_{1,3}`, `K₂+3K₁`, recipe on `K₃` | `0`; `0`; `1`; `1`; `1` (`diag(−1,0,0)` fails); `2` (rank-1 excluded); `max = 1`; `−A−2I`: `−4,−1,−1` | results true; recipe wrong | C02 |
| 11.3 minors, `μ ≤ 1` | `2K₁ ≤ K₂`, `3K₁ ≤ P₃`, `K₃ ≤ C₅`, `K_{1,3}` in max degree `2`, empty `V` | `1 ≤ 1`; `1 ≤ 1`; `2 ≤ μ(C₅)`; at most two edges leave a connected set; `0 ≤ 1` | true; supplier | R01 |
| 12.1 standard eigenfunctions (sampled) | `K₂`, `K₃`, `K₂+K₁`, `λ < 0`, empty `V` | `(πj)²` simple; `(2πj/3)²` double; mult. of `0` is `1 ≠ 2`; energy identity forces `u = 0`; `0 = 0` | true | none |
| 12.2 generic eigenvalues (sampled) | `P₃`, `K₃` at `(2π/3)²`, `π²`, `(2π)²`; Kirchhoff sum | `1 − cos(πj/2) = 1`; `3/2` double; `2` not an eigenvalue; `2 ≠ 1`; `cos k·d(x)ψ(x) = ∑ψ(y)` | true | none |
| 12.3 exceptional eigenvalues | `K₂`, `K₃`, `C₄`, `K₄`, `K₁` | `1, 1`; `2`, `0`; `2`; `6−4 = 2`; `0 ≠ 1` so `n ≥ 2` needed | true | none |
| 12.4 Weyl's law | `K₂`, `K₃`, per period count | `1+⌊x⌋`; `1+2⌊x/2⌋` within `1` of `x`; `2(n−2)+2(β₁+1) = 2(n−1)+2β₁ = 2|E|` | true | none |

- Source locators checked against the text: 3 of 89 (Sp line 1688, printed p. 32; Sp line 5296, p. 124; Sp line 5397, p. 126), all correct with the hypotheses the README reports (connectedness in both theorems on eigenvalues).
- Library declarations opened at the pins: `Matrix.IsHermitian.eigenvalues₀_antitone` (`Mathlib/Analysis/Matrix/Spectrum.lean:63`); `TauCeti.DoubledQuiver.Orientation` (`TauCeti/RepresentationTheory/Quiver/Zigzag/Orientation.lean:73`); `incidenceBoundary`, `cycleLattice` (`TauCeti/Combinatorics/Graph/Serre/Cycle/Basic.lean:45, 55`); `isVertexConnected_iff`, `vertexConnectivity`, `vertexConnectivity_top` (`TauCeti/Combinatorics/SimpleGraph/Connectivity/VertexConnectivity.lean:226, 331, 398`); `edgeConnectivity_eq_top_iff` (`…/EdgeConnectivity.lean:94`); all 62 `#check` lines elaborate.
- Cross-roadmap citations resolved: GraphSpectra 1.1, 1.5, 1.7, 2.2, 2.5, 3.3; LaplacianEigenvaluesOfGraphs 1.1, 1.2, 2.1, 3.2, 4.1, 4.2, 6.2, 6.3, 7.1; KernelsAndSpectralMethods 1.1–1.4, 2.1; ElectricalNetworksAndRandomWalks 1.1, 2.1, 3.3 (open heads); RandomMatrices 1.2, GeometricTopology 4.4.5, SpanningTreesAndShortestPaths 5.1–5.2, LinearAlgebraMethodInCombinatorics 4.2, TropicalAndBerkovichArithmetic 3.4–3.5, FreeGroupsAndLimitGroups 2.2a, GraphConnectivityAndFlows 1.5, 6.1, MarkovChainMixing 2.3–2.4 (main); DirectedMatrixTreeAndBEST 2.1–2.3, IntegerPolyhedraAndTotalUnimodularity 3.1 (open heads). All exist with the stated content.
- The 22 copied declarations agree character for character with their owners' `Suggested.lean` at the open heads, under distinct fully qualified names.
- Duplication by object: no matrix-tree theorem, oriented incidence matrix, critical group, distance matrix, threshold graph, Colin de Verdière invariant or metric-graph Laplacian in the pinned Mathlib or Tau Ceti, nor owned by another roadmap; LaplacianEigenvaluesOfGraphs 9.1 uses the conjugate sequence inline and defines no named object.
- Dependency check: `depcheck: 132 roadmaps, 1464 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `sorry` is the only warning (46). Elaborated types read against the README for every theorem: all hypotheses are explicit binders; casts in 5.2, 8.1 and 12.3 are at the leaves; nothing changed. One-tactic probe (`simp`, `rfl`, `simp` with the definitions) on a copy: none of the 46 closes.
- Pull request text: 12 layers, 30 subsections, 46 `sorry`, the import list and the supplier sections agree with the head.

Overlap check: read LaplacianEigenvaluesOfGraphs, GraphSpectra, CharacteristicPolynomialsAndStarComplements, SpectralGraphBounds, ElectricalNetworksAndRandomWalks, GraphConnectivityAndFlows, SpanningTreesAndShortestPaths; nothing shared (the case `|R| = 1` of 2.2 is GeometricTopology 4.4.5 and is cited as such; the Laplacian case of 11.1 is LaplacianEigenvaluesOfGraphs 6.2–6.3 and is cited as such).

Source independence: 6 passages compared with 1 source (Sp), none shared, and the three proof routes differ from the source's; largest share NP, 21 of 89 locators; the text and contents of NP could not be read; by the README's own locators NP Chapters 2, 3, 4 serve Layers 6, 11, 11 and Ba Chapters 2, 4, 10, 9, 8 serve Layers 1, 2, 3, 5, 6, so no run of chapters maps one to one onto the layers.

Research link: The README's sources place the targets in Fiedler's algebraic connectivity, the discrete nodal domain theorems of Davies, Gladwell, Leydold and Stadler, the minor-monotone Colin de Verdière invariant with its planarity characterisations (BH Theorem 7.3.2), and Kurasov's 2024 spectral geometry of metric graphs; the README names expander graphs as a consumer. Rests on the README.

## Not verifiable

- [Ba] Bapat (3.1, 5.1, 5.2, 6.1 among the sample): Springer, paywalled; no legal copy found.
- [BH] Brouwer–Haemers (10.1, 11.1, 11.2): the publisher's copy is paywalled and the sources service did not accept the address of the online copy as an author's page.
- [Ch] Chung, Lemma 1.7 (7.1): same reason as [BH].
- [CRS] (6.1, 6.2, 7.1, 8.1), [GR] (4.1), [Mo] (8.1), [Bi]: publisher pages only; not read.
- [NP] Naderi–Pankrashkin (6.1, 6.2, 11.1, 11.2): Birkhäuser, paywalled. The README's statement that Remark 2.7.6 prints `2π` for `π` could not be checked; the mathematics of 6.2 with `π` was checked on `P₄`.
- [Ku] Kurasov (12.1, 12.2): recorded by the sources service as cited by locator only; the text was not read.
- 2.1 and 6.4 of the sample carry no source locator; they were checked by computation and against the library names they cite.
- Ownership against the open pull requests was checked through the search over their heads; the named suppliers and neighbours were read in full sections, the others only where the search hit.

Automatic checks set aside as false positives: two Mathlib names ending in a prime (`SimpleGraph.lapMatrix_mulVec_apply'`, `SimpleGraph.lapMatrix_toLinearMap₂'`) were read as names this roadmap claims to declare; they are library declarations and both elaborate.

## Source issues

- none

## For the human reviewers

- **Not tested.** [NP] has the largest share of the locators (21 of 89) and neither its text nor its contents page could be read; wording and arrangement were not compared with it, nor with [Ba], [BH], [CRS], [GR], [Ku].
- **Licence.** [Sp] is an unpublished author manuscript ("Incomplete Draft", Sp line 6). It is the only source for the edge-probability theorem of 3.2; 2.3 and 6.3 also cite published books.
- **Licence.** [Ku] is cited by locator only: the sources service treated the publisher's host as paywalled. Whether the book is open access there was not settled.
- **Scope.** Whether SurfaceTopology may be named at all (as a boundary, not a supplier) after R01 is repaired is the project's decision; it appears in "Boundaries" (README line 1224) and in "Beyond this roadmap" (line 1353).
