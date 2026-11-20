# Review of DirectedMatrixTreeAndBEST (pull request #2698 at 209b264)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every stated identity, every Check value and every negative control was recomputed by brute force and agrees (matrix-tree and adjugate forms on random integer weights up to five vertices, Euler's criterion on 5448 multidigraphs, the BEST theorem on 308 balanced ones and on the bidirected 3 × 3 grid, de Bruijn counts from the Lean definition), and the Lyons–Peres locators were read at the text. There are no small corrections and one format note. For the humans: the Stanley locators, which are most of the locators, could not be read through the sources service and are not verified.

## N01 — Three scope bullets describe other roadmaps by their momentary status

In "Scope and ownership" (lines 519, 524, 528) SpanningTreesAndShortestPaths, ContinuousTimeMarkovChains and ElectricalNetworksAndRandomWalks are called "an open roadmap, not on main" or "a roadmap not on main". The phrases become false when those roadmaps merge; the sentence "This roadmap does not depend on that one", which each bullet already has, says what a reader needs.

## Questions for the author

- In 5.1 the determinant form `det L₀ · ∏ (outdeg v − 1)!` is attributed to Stanley, Corollary 10.5, p. 194. I recall that corollary as the eigenvalue form (the product of the nonzero Laplacian eigenvalues divided by the number of vertices), with the determinant form being Theorems 10.2 and 10.4 combined. Is Corollary 10.5 the right locator for the determinant form in the draft of 1 February 2013? I could not open the draft (see "Not verifiable").
- The Check of 5.1 cites Stanley, Example 10.7, p. 195, after the numbers `18432` and `442368` for the bidirected 3 × 3 grid. Does that example treat this grid, or the general formula for a graph with every edge doubled? If the latter, "by the formula of Example 10.7" would say so. Same obstacle.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 out-degree Laplacian | `w = [[a,b],[c,d]]`; stochastic `P`; zero-row-sum `Q` | `L = [[b,−b],[−c,c]]`, loops cancel; wrong variant `[[a+b,−b],[−c,c+d]]` has row sums `a`, `d`; `L(P) = 1 − P`, `L(Q) = −Q` | agrees | none |
| Conventions: in-degree Laplacian, transposed weights | two vertices | `L(w′) = [[c,−c],[−b,b]]`, `L(w)ᵀ = [[b,−c],[−b,c]]`, in-degree Laplacian `[[c,−b],[−c,b]] = L(w′)ᵀ`; equal iff `b = c` | agrees | none |
| 1.2 arborescences, arborescence sum | unit weights, 1–5 vertices; two vertices; swap of `r`, `v` | counts `1, 1, 3, 16, 125`; `τ(0) = c`, `τ(1) = b`; swap excluded by `p r = r`; one vertex gives empty product `1` | agrees | none |
| 2.1 principal minor (`det_submatrix_outLaplacian`) | random integer weights in `[−3,3]` with loops, 1–5 vertices, every root; one vertex; no arcs | minor = `τ_w(r)` in all 18 samples; empty matrix `1 = 1`; `[0] = 0` | agrees | none |
| 2.2 adjugate (`adjugate_outLaplacian`) | same samples, with `adjugate A i j = det (A.updateRow j (Pi.single i 1))` | every entry `(i, j)` equals `τ_w(j)`; two vertices `[[c,b],[c,b]]`; rows `(c,b)` not constant | agrees | none |
| 2.3 balanced weights | all 1242 balanced weights with entries in `{0,1,2}` on 2 and 3 vertices | `τ_w` the same at every root and equal to `τ_(w′)`; route `adj(Lᵀ) = (adj L)ᵀ` gives `τ_w(i) = τ_(w′)(j)` | agrees | none |
| 2.3 symmetric case and Layer 2 examples | complete digraph `n = 2..6`; bidirected 3 × 3 grid | reduced determinant `n^(n−2)`; grid `192` | agrees | none |
| 3.1 Markov chain tree (`stationary_iff_eq_arborescenceSum_div`) | `P = [[2/3,1/3],[1/2,1/2]]`; `P = 1` on two states; random rational `P`, 2–4 states | `τ_P = (1/2,1/3)`, `π = (3/5,2/5)`; identity: `τ = (0,0)`, right side `0/0 = 0` vector; `∑τ ≠ 0` ⇒ kernel of `Pᵀ − 1` is the line through `τ_P`, `∑τ = 0` ⇒ dimension ≥ 2 | agrees | none |
| 3.1 generator remark | `[[−1,1],[2,−2]]`; birth–death 3 × 3 | `τ = (2,1)`; `τ = (4,2,1)`, `πQ = 0` checked | agrees | none |
| 4.1 degrees, Eulerian circuits | three loops; no arrows; triangle plus isolated vertex | `6` circuits; nil walk Eulerian; none at the isolated vertex | agrees | none |
| 4.2 Euler (`exists_isEulerianCircuit_iff`) | all 5448 multidigraphs on ≤ 3 vertices, multiplicity ≤ 2, ≤ 7 arrows, loops allowed; empty `V` | both sides equal in every case; two loops on two vertices: balanced, no circuit, no zigzag; empty `V`: left false, right true | agrees | none |
| 5.1 BEST (`card_isEulerianCircuit_head_eq`) | 308 balanced multidigraphs with positive out-degrees, every first arrow; grid; controls | both sides equal; three loops `2 = 1·2!`; grid `18432 = 192·96` by enumeration; loop plus isolated vertex `1 ≠ 0`; unbalanced `0 ≠ 1` | agrees | none |
| 5.2 `IsDeBruijn`, `card_isDeBruijn` | Lean definition enumerated for `(k,n)` = (2,1..4), (3,1), (3,2), (4,1), (5,1), (1,1), (1,3), (0,1), (0,2), (3,0) | `2, 4, 16, 256`; `6, 216`; `24`; `120`; `1, 1`; `1, 1`; `n = 0`, `k = 3`: `3` words against `3! = 6` | agrees | none |
| 5.2 route: reduced determinants | de Bruijn graphs `(k,n)` = (2,2), (2,3), (2,4), (3,2), (3,3) | `1, 2, 16, 3, 729` = `k^(k^(n−1) − n)`; `kⁿ · k^(k^(n−1)−n) · ((k−1)!)^(k^(n−1)) = (k!)^(k^(n−1))` | agrees | none |

- Source locators checked against the text: 5 of Lyons–Peres (§4.1 p. 97, LyonsPeres lines 5513–5528; §4.4 p. 117, lines 6433–6443; Exercises 4.11 and 4.12 p. 118, lines 6469–6474; the reference to Anantharam and Tsoucas, line 6443; the version date, line 5). None of Stanley (see below).
- Library declarations opened at the pins: `Matrix.adjugate_apply` (Adjugate.lean:193), `adjugate_transpose` (:197), `mul_adjugate` (:263), `adjugate_mul` (:268), `det_updateRow_add` (Determinant/Basic.lean:397), `det_updateRow_smul` (:406), `Matrix.IsIrreducible` (Irreducible/Defs.lean:83) and `.transpose` (:207), `mem_rowStochastic_iff_sum` (Stochastic.lean:57), `SimpleGraph.lapMatrix` (LapMatrix.lean:80), `degree_eq_sum_if_adj` (:68), `reachable_iff_reflTransGen` (Connected.lean:95), `Quiver.Arborescence` (Arborescence.lean:39), `Function.iterate_fixed`; Tau Ceti `ArrowWalk` and `arrows`, `arrows_cons` (Network/Walk.lean:129, 138), `underlyingGraph_adj` (UnderlyingGraph.lean:64), `IsIrreducible.exists_eq_smul_of_mulVec_eq_smul` (PerronFrobenius/Irreducible.lean:137), `exists_mulVec_eq_smul` (:157), `transitionCount`. All as the README describes them.
- Cross-roadmap citations resolved: GeometricTopology 4.4.5 (main, README lines 3008–3010: symmetric zero-diagonal weights, every commutative ring, compared with `SimpleGraph.lapMatrix`); MarkovChainsAndRenewal Layer 3 item 2 (main); GraphConnectivityAndFlows scope (main, line 1117); SpanningTreesAndShortestPaths Layer 4 and scope, ContinuousTimeMarkovChains 4.3 and scope, ElectricalNetworksAndRandomWalks scope (open heads). None is a supplier.
- Duplication by object: no roadmap on main or at an open head, and neither pinned library, states arborescence sums, a directed matrix-tree theorem, Eulerian circuits of arrow families, the BEST theorem, the Markov chain tree theorem or de Bruijn sequences; no `Suggested.lean` shares a declaration name.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line. The roadmap names no roadmap as a supplier.
- Elaboration of `TauCetiRoadmap/DirectedMatrixTreeAndBEST/Suggested.lean`: six `sorry` warnings, nothing else. `#check`-level signatures compared with the README: the binders reported as dropped (`Fintype`, `DecidableEq` on `IsArborescence`, `IsEulerianCircuit`; `DecidableEq` on the degrees) are not used by those definitions; `outDegree` and `inDegree` keep the `Fintype` instances on `Q`. Nothing to change.
- One-tactic probe (`rfl`, `simp`, `simp` with the definitions unfolded, `exact?`) on a separate copy of the file: none of the six theorems closes. No padding; all headline theorems of the Summary are stated; the automatic checks all passed.
- Pull request text read against the head: 6 theorems and 7 definitions, one Tau Ceti import, the suppliers and the scope as described; nothing contradicted or left out.

Overlap check: read SpanningTreesAndShortestPaths, ElectricalNetworksAndRandomWalks, TuttePolynomialAndArrangements, ContinuousTimeMarkovChains, GraphConnectivityAndFlows; the symmetric weighted matrix-tree identity is shared in subject only and is owned by GeometricTopology 4.4.5, which this roadmap cites and does not restate; nothing else shared.

Source independence: 5 passages compared with 1 source (Lyons–Peres: the statement and first bullet of 3.1, the Arborescences convention, the route of 3.1, the References entry), none shared; largest share Stanley-AlgComb, about 16 of 20 locators; its text and table of contents could not be read. From the README's own locators its Chapter 10 runs Euler (10.1), BEST (10.2), matrix-tree (10.4), de Bruijn (10.8–10.11), while the layers run matrix-tree, Markov chains, Euler, BEST: not that order, and Layer 3 comes from a second source.

Research link: The README's sources give Tutte (1948), Good, van Aardenne-Ehrenfest and de Bruijn (1951) for the headline theorems; Lyons and Peres (2016), §4.1 and §4.4 as read, use rooted spanning trees weighted by transition probabilities for generating uniform spanning trees and cite Anantharam and Tsoucas (1989) for the Markov chain tree theorem.

## Not verifiable

- Every Stanley locator (Theorems 9.8, 10.1, 10.2, 10.4, 10.10; Lemmas 9.9, 10.9; Corollaries 10.3, 10.5, 10.11; Examples 10.6–10.8; the notes, pp. 198–199; all page numbers): the sources service did not accept the draft's address on the author's MIT page as an author's page, and the published book resolves only to a paywalled page. The statements themselves were verified by computation, not against the text. This covers the Stanley part of the sampled targets 1.1, 2.1, 2.3, 4.2, 5.1 and 5.2.
- The attributions to Tutte, Good, and van Aardenne-Ehrenfest and de Bruijn, which the README takes from Stanley's notes to Chapter 10: same reason.
- Ownership against open pull requests was checked with the roadmap search over all open heads, not by reading each folder.

## Source issues

- none

## For the human reviewers

- **Not tested.** Stanley, *Topics in Algebraic Combinatorics* (draft of 1 February 2013), has about 16 of the README's 20 locators; its text and contents page could not be read, so wording and arrangement were not compared with it.
- **Licence.** The Stanley draft is cited at `math.mit.edu/~rstan/algcomb/algcomb.pdf`; the sources service could not confirm that address as the author's own page. A human can confirm it or supply the text.
- **Scope.** Classical enumerative graph theory with refereed textbook sources (Stanley, Springer 2013; Lyons and Peres, Cambridge 2016); several targets are stated more generally than the sources and marked "proved here" (README 2.1, 2.2, 2.3, 5.2).
