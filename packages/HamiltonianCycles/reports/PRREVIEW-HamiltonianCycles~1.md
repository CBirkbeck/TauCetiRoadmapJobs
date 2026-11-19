# Review of HamiltonianCycles (pull request #2526 at bf213f2)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement, Check and proof route was recomputed (by hand, and by enumeration for the tournament counts and the graphs `C(m, n)`), all 37 source locators were read in Bondy–Murty, Diestel and Moon and agree, and `Suggested.lean` elaborates with `sorry` as its only warning and states every headline theorem. There are two small corrections and no format note, none blocking. For the humans: the status of the three copies the sources were read from, and the fact that the primary papers were not consulted.

## C01 — The parity route of 5.2 points to "the first Check" for the cases `n ≤ 1`, but those cases are the third Check

In the route for parity in 5.2 (README line 524) the sentence "the cases `n ≤ 1` are the first Check" sends the reader to the Check on the transitive tournament and the cyclic triangle (line 546); the tournaments on no vertices and on one vertex are treated in the third Check (line 551). Say "the third Check", or "the Check on no vertices and one vertex below". (Only `n = 0` actually needs separate treatment: for `n = 1` the route gives `h = S₁ = 1` directly, the minor of `A₁ = (1)` on the whole set times the empty minor.)

## C02 — In both theorems of 3.5 the hypothesis `3 ≤ n` follows from the edge-count hypothesis, so it is not needed

`isHamiltonian_of_choose_add_two_le_card_edgeFinset` and `not_isHamiltonian_iff_of_card_edgeFinset_eq` (`Suggested.lean` lines 166 and 172) both carry `hn : 3 ≤ Fintype.card V`. With truncated subtraction `(n − 1).choose 2 = 0` for `n ≤ 2`, so the first hypothesis asks for at least `2` edges, which no graph on at most two vertices has (the README's own Check in 3.5, line 418, says this). In the second, exactly `1` edge is impossible for `n ≤ 1`, and for `n = 2` the graph is `K₂`, which is not Hamiltonian and is isomorphic to `chvatalGraph 1 2` (vertices `0`, `1` are adjacent because `2 ≤ 1 + 1`), so the equivalence holds there too. The statements would be slightly stronger without `hn`; if it is kept for uniformity with the other theorems of the layer, a clause in 3.5 saying that it is implied would tell an implementer not to look for a use of it.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 toughness, cycle form | `n = 1`, `S = V`; `K₂`; `K_(m,m+1)`, `S` small side; `S = ∅` | `0 ≤ 1`; `1 ≤ 1`, `0 ≤ 2`, not Hamiltonian; `m + 1 > m`; `S = ∅` gives `1 ≤ 0`, excluded by `hS` | holds; nonemptiness needed | none |
| 1.1 path form | `S = ∅`; `S = V`; star with 3 leaves | `≤ 1` (connected); `0 ≤ n + 1`; `3 > 2` | holds; `Fintype` rightly omitted | none |
| 1.2 two-connectivity, Petersen | `n = 1`; two triangles at a vertex; Petersen | Hamiltonian, not 2-connected (needs 3 vertices); cut vertex, 2 components `> 1`; `κ = 3`, `α = 4`, toughness `4/3` | holds | none |
| 2.1 closure lemma | `n ≤ 3`; `C₄` opposite pair; `P₃` ends; `u = v` | `2(n − 2) < n`, no pair; `2 + 2 = 4`, both Hamiltonian; `2 = n − 1`, lemma silent; `G ⊔ edge u u = G` | holds | none |
| 2.2 closure, `isLeast`, order independence | `C₅`; `C₅` + chord; Petersen; both directions of the iff | sums `4 < 5`; additions `3+2, 3+2, 2+3, 3+3` reach `K₅`; `6 < 10`; reachable ⇒ below every closed supergraph, closed ⇒ above the infimum | holds | none |
| 2.3 Hamiltonicity of closure | `n = 0, 1, 2`; `P₃` | closure of a graph on `≤ 3` vertices is itself; `P₃` own closure, not Hamiltonian | holds | none |
| 3.1 Ore, Dirac | `K₂`; empty type; two `K_(m+1)` at a vertex; `K₄` + vertex of degree 2 | `2δ = 2 = n`, not Hamiltonian; vacuous, not Hamiltonian; `2δ = n − 1`; degrees `2,3,3,4,4`, sums `5 = n` | holds; `3 ≤ n` needed | none |
| 3.2 Ore for paths | `n = 1`; `n = 2` nonadjacent; `2K_m`; join with `z` | trivial path; `0 + 0 + 1 < 2`; sum `n − 2`, disconnected; sums rise to `n + 1` on `n + 1 ≥ 3` vertices | holds | none |
| 3.3 Chvátal, Pósa | `2,2,3,3,4`; `2,2,2,4,4,4`; `2,2,2,3,3`; `m = 0` in the route; odd `n`, `i = (n−1)/2` | `i=2`: 2 low, 3 high, holds; holds, Pósa fails (3 ≥ 2); fails at `i = 2`; `i = 1` gives degree `n − 1`; `i + 1 = n − i` | holds; counting form = sorted form | none |
| 3.4 `C(m, n)` | `C(0,n)`, `C(1,n)`, `C(2,5)`; all `1 ≤ m < n/2`, `n ≤ 13`; Petersen | `K_n`; pendant on `K_(n−1)`; `2,2,2,4,4`, 7 edges; degrees `mᵐ,(n−m−1)ⁿ⁻²ᵐ,(n−1)ᵐ`, violation only at `i = m`; majorised by `C(3,10)`, `C(4,10)` only | holds | none |
| 3.5 edge counts | formula vs count, `n ≤ 13`; `n = 3`; `n = 4`; `n = 5`; `n ≤ 2` | equal; path = `C(1,3)`; paw = `C(1,4)`; `C(1,5)`, `C(2,5)` both 7 edges; hypothesis impossible or `K₂ ≅ C(1,2)` | holds, also without `hn` | C02 |
| 4.1 Chvátal–Erdős, both forms | `K₂`; empty type; `K_n`; `K_(m,m+1)`, `K_(m,m+2)`; `C₅`; join with a vertex | `κ = α = 1`, not Hamiltonian; `0 ≤ 0 + 1`, no walk; `κ = n − 1`, `α = 1`; `α = κ + 1`, `κ + 2`; `2, 2`; `κ + 1`, `α` unchanged | holds | none |
| 5.1 definitions | 2 vertices with both arcs; loop + 2-cycle on 3 vertices; `n = 0, 1` | excluded by asymmetry; excluded by "moves every vertex"; one path (empty or singleton list), no cycle | definitions determine the objects | none |
| 5.2 Rédei | all labelled tournaments, `n ≤ 5`; `ℤ/5`; parity route steps 1–3 | `n=4`: 1, 3, 5 paths for 24, 16, 24; `n=5`: 1,3,5,9,11,13,15 for 120,120,240,240,120,120,64; 15; involution fixes only `(∅, N)` | holds | C01 |
| 5.3 Camion | `n = 0, 1, 2`; all labelled tournaments, `n = 3, 4, 5` | strong, no cycle; neither; strong ⇔ spanning cycle with 0 mismatches (2, 24, 544 strong) | holds; `Nontrivial` needed | none |

- Source locators checked against the text: 37 of 37 (Bondy–Murty 18, Diestel 11, Moon 8), all agreeing in number, page and hypotheses; the README's notes on differing forms (proper subsets, integer sequences, `n ≥ 3`) are accurate.
- Library declarations opened at the pins: 31, among them `SimpleGraph.IsHamiltonian` (`Mathlib/Combinatorics/SimpleGraph/Hamiltonian.lean:318`), `isHamiltonian_top` (`:396`), `IsHamiltonian.of_perm` (`Hamiltonian/Perm.lean:50`), `indepNum` (`Clique.lean:1044`), `IsVertexConnected` (`TauCeti/Combinatorics/SimpleGraph/Connectivity/VertexConnectivity.lean:217`), `vertexConnectivity` (`:331`), `isVertexConnected_two_iff` (`:280`), `Digraph.isStronglyConnected_iff` (`TauCeti/Combinatorics/Digraph/ArrowWalk.lean:139`).
- No Hamiltonicity criterion, tournament, closure or toughness statement exists in the pinned Mathlib or Tau Ceti (searched by object); Tau Ceti's `PrescribedCycle.lean` is Dirac's prescribed-vertex theorem, a different statement.
- Cross-roadmap citations resolved: GraphConnectivityAndFlows 2.2, 2.3, 6.2, 6.6 exist on main under those numbers; none is a supplier citation.
- Dependency check output: `depcheck: 200 roadmaps, 2188 edges, 0 problem(s)`.
- Elaboration: `Suggested.lean` gives 18 `sorry` warnings and nothing else; all 25 elaborated signatures compared with the README (the five flagged binders are `Fintype` or `DecidableEq` instances the declarations do not use); no change.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `trivial`, `simp` with the roadmap's definitions unfolded) on a copy: none of the 18 theorems closes. All headline theorems of the README are stated; none is declared not statable.
- The pull request's title and description agree with the head (18 theorems, 7 definitions, one instance, the two imports, new roadmap, no supplier roadmap).

Overlap check: read GraphConnectivityAndFlows, SpanningTreesAndShortestPaths, ApproximationGuarantees; nothing shared (ApproximationGuarantees uses Mathlib's `SimpleGraph.Walk.IsHamiltonianCycle` for tours and states no existence criterion; RandomGraphs lists Hamiltonicity thresholds as out of its scope).

Source independence: 44 passages compared with 3 sources (the 37 locators and 7 further passages: the routes of 2.1, 3.3, 4.1, 5.2 and 5.3, the definition of 5.1 and the docstring of `degreeClosure`), none shared beyond a six-word run that the mathematics forces (Moon1968 line 366); largest share BondyMurty1976, 18 of 37 locators; contents compared with BondyMurty1976 §4.2, which has no subsections: independent (Dirac's theorem is moved behind the closure, Ore's theorem, the path forms, Pósa's condition and order-independence are added, Layers 4 and 5 come from other sources, and the order 2.1 → 2.2 → 2.3 → 3.1, 3.3 → 3.4 → 3.5 and 1.1 → 3.4 is forced by the Needs lines).

Research link: Dirac's theorem (3.1) is the case `k = 1` of Seymour's conjecture, proved for large `n` by Komlós, Sárközy and Szemerédi (1998); 1-toughness (1.1) is the invariant of Chvátal's open toughness conjecture (1973). Rests on Diestel2025 lines 476–484 and 589–605, not on the README.

## Not verifiable

- none: all three cited books were read at their locators. The papers of Ore (1960), Pósa (1962) and Chvátal–Erdős (1972) carry no locator in the README and were not opened; the three statements attributed to them were verified mathematically.

## Source issues

- **Gap** in BondyMurty1976 at Theorem 4.5, proof, p. 58: the source says the degree `m` of the chosen vertex in the closure gives `d_m ≤ m`, contradicting the hypothesis, without treating `m = 0`, where no `d_0` exists; it should be treated separately: an isolated vertex gives `d_1 ≤ 1`, so the hypothesis at `m = 1` yields a vertex of degree `ν − 1`, a contradiction; affects the proof.
- **Misprint** in Moon1968 (electronic edition of 2013) at §9, proof of Theorem 14, equation (1), p. 29: the source says the sum of the `S_k` runs up to `m`; it should be up to `n`, the number of nodes; affects nothing.
- **Misprint** in Moon1968 (electronic edition of 2013) at §9, proof of Theorem 14, equation (6), p. 30: the source says the inner sum is over `e₁ ⊂ e₁`; it should be over the proper subsets `e₁ ⊂ e`, as in equation (5); affects nothing.

## For the human reviewers

- Licence: Bondy–Murty was read from an Internet Archive capture (26 March 2012) of the chapter file on J. A. Bondy's page; the book is North-Holland's, and the authors' right to post it is not stated in the file.
- Licence: Moon was read from the Project Gutenberg foundation's mirror (the main site was unavailable); the eBook states "Copyright 2013 by John W. Moon", commercial use prohibited (Moon1968 lines 10 and 22). Diestel was read from the author's free preview.
- Scope: the three sources are textbooks; the README (References, last item) says the primary papers of Dirac, Ore, Pósa, Bondy, Chvátal, Erdős, Rédei and Camion were not consulted. The connection to current research above rests on Diestel's notes only.
