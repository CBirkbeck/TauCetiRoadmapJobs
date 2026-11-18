# Review of SpanningTreesAndShortestPaths (pull request #2512 at 2857d0c)

**Verdict:** needs changes

**Summary.** Changes are needed, for one reason: the duality between fundamental cycles and cuts in 1.2 is listed as a target to prove, but the pinned Tau Ceti already proves exactly that statement, so it has to be cited and not planned again. No statement, Check or worked value was found false: every theorem was recomputed on degenerate and small instances, and all 17 source locators were read at the text. There are one small correction (a theorem number in Keller–Trotter) and two format notes, none blocking; three facts about the sources and the scope are left for the human reviewers.

## R01 (P2) — The duality bullet of 1.2 restates a theorem the pinned Tau Ceti already proves

An implementer who follows 1.2 would prove again a lemma that is in the library, and 1.3, 2.2 and 2.3, whose routes all go through "duality", would be built on the second copy. The bullet reads: "For an acyclic graph `F`, a path `p` of `F` from `u` to `v` and any `f : Sym2 V`: `f ∈ p.edges` if and only if `u` and `v` are not joined in `F.deleteEdges {f}`", and the section closes with "(Proved here, except as cited.)" with no citation for it. At the pin, `TauCeti/Combinatorics/SimpleGraph/Connectivity/EdgeSide.lean`, line 45, has

    theorem SimpleGraph.Walk.IsPath.mem_edges_iff_not_reachable_deleteEdges (hG : G.IsAcyclic)
        {p : G.Walk s t} (hp : p.IsPath) {e : Sym2 V} :
        e ∈ p.edges ↔ ¬(G.deleteEdges {e}).Reachable s t

which is the same statement with the same hypotheses (acyclic, a path, an arbitrary element of `Sym2 V`, no finiteness). The supplier contracts under "From Tau Ceti" name only the network and quiver files.

The smallest change: in 1.2 state the duality as a cited fact (the sentence about fundamental cycles and cuts and the Diestel locator can stay), add the declaration to the *Needs:* lines of 1.2 and of the sections that use it and to the Layer 1 dependencies, and add the file with this declaration to "From Tau Ceti" in the supplier contracts. The exchange criterion and everything after it are unaffected.

## C01 — Cayley's formula is Theorem 5.39 of Keller and Trotter, not Theorem 5.40

In 5.2 (line 767) the count `n ^ (n − 2)` is cited as "Keller and Trotter, Theorem 5.40". In the 2017 edition, both in the PDF (KellerTrotter2017 line 4142) and in the online text of §5.6, Cayley's formula is Theorem 5.39; item 5.40 is the worked example that computes the Prüfer code of a tree on nine vertices (KellerTrotter2017 line 4174). Write "Theorem 5.39".

## N01 — The partial order on strongly connected components is Tau Ceti's, and the list does not say so

Under "Already in the libraries" (line 824) `Quiver.StronglyConnectedComponent.instPartialOrder` stands without a library or file; a reader who looks for it in Mathlib's `Combinatorics/Quiver/ConnectedComponent.lean` finds the type and no order. It is in `TauCeti/Combinatorics/Quiver/StronglyConnectedComponent.lean`, line 46. Naming the file would do.

## N02 — The comparison with the hop distance in 3.1 has a library input that could be named

The last bullet of 3.1 (weight constantly `1` gives `TauCeti.positiveEDist`) rests on "a constant weight counts arrows", which is `Quiver.Path.addWeight_const` in `TauCeti/Combinatorics/Quiver/PathWeight.lean`, line 38 (`p.addWeight (fun _ => c) = p.length • c`). It would fit in the *Needs:* line of 3.1.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 spanning forest, edge count | triangle; C4; K4; two disjoint edges + isolated vertex | 3, 4, 16 forests; 5 vertices, 3 components, 2 edges: 2 + 3 = 5 | holds | none |
| 1.2 duality | acyclic F, f on / off path, f a diagonal | on path: ends separated; off path: path survives; diagonal: not in edges, nothing deleted | holds; already in Tau Ceti | R01 |
| 1.2 exchange criterion | C4 path abcd + da; star c,x,y,z + xy with f = cz; uv ∈ F | all three f give trees; cz: triangle xcy and z isolated; uv ∈ F forces f = uv | holds, both directions | none |
| 1.3 symmetric exchange | C4; graph 01,02,03,12,13 with e = 13 | f = 01: F' − 13 + 01 has triangle 012, 3 isolated; f = 03: both trees | holds; Check true | none |
| 2.1 weight, minimum forests | triangle 1,2,3; C4 1,2,2,2; edges 5 and −7; no edges | weight 3; three forests of weight 5; −2; 0 | holds | none |
| 2.2 cut and cycle properties | triangle all 1; `WithTop ℕ` triangle 1,2,3 + pendant ⊤ | each lightest edge in some, not all; all three trees weigh ⊤, tree {2,3,⊤} omits strict minimum 1 | weak needs monotone only; strict needs cancellation | none |
| 2.3 optimality criteria (headline) | C4 1,2,2,2; `WithTop ℕ` example | path omitting 1 fails (1 < 2); others pass; {2,3,⊤} minimum yet 1 < 2, 3 | 1⇒2 needs cancellation, 2⇒1 does not | none |
| 2.4 uniqueness, weight counts, minimax | C4 1,2,2,2; triangle 1,2,2; u = v | counts (one 1, two 2) in all three; tree {2,2}: max 2, weight 4 > 3; empty path: vacuous | holds | none |
| 2.5 greedy theorem (headline) | triangle all 1 after ab, ac blue; triangle 1,2,3 | every S that bc leaves is left by ab or ac; red rule only at 3 (max non-blue) | induction step recomputed for blue and red | none |
| 2.6 Kruskal's forest, ties | triangle all 1, order ab<bc<ca; triangle 1,2,3 with 3 first | vertices choose ab, ab, bc = forest; forest weight 4 or 5 > 3 | holds; asymmetry suffices for the cut statement | none |
| 3.1 walk weight, distance | arrows 5 and 2+2; loop −1; loop 0 or 1 | 4, ⊤, 0; weights 0,−1,−2,… no least element; 0 | holds; unique x | none |
| 3.2 existence of shortest walks | arrows eₙ of weight −n; `ℤ × ℤ` lexicographic; far negative loop | no least; (−5,0) < (0,−k) for all k; unaffected | holds; hypothesis sufficient, not necessary | none |
| 3.3 potentials and duality (headline) | triangle 1,1,−3 and 1,1,−2; Check of 3.1; ℕ-vertex example; s = t | 0 ≤ −1 impossible; 0,1,2 works; rise 4 = distance, 5 > arrow bound; y 1 ≤ y 0 − n; rise 0 = weight 0 | holds; M = max of finitely many differences exists | none |
| 3.4 Bellman equations | zero cycle with s→a of 5; isolated s with 2-cycle of 1; infinite chain | y a = y b = c for c ≤ 5; y a = y a + 2 forces ⊤; constant 7 solves | uniqueness needs positive closed walks and finite V | none |
| 3.5 invariant behind Dijkstra | s→a 2, s→b 3, b→a −2; S = {u} without s | minimum 2 but distance 1; 10 against 1 | holds with nonnegative weights and s ∈ S; ⊤ case checked | none |
| 3.6 shortest-path trees | s→a, a→b, b→a of 0; two parallel arrows | T = {s→a, a→b}: one walk each; one of the two | holds; hop count of shortest walks drops along T | none |
| 3.7 min-plus powers | s→a→t of 1,1 and s→t of 5; one vertex with loop −1 | (s,t): ⊤, 5, 2; A² gives 2, A³ gives ⊤; powers 0, 1: 0, −1 | holds for k = 0 and n = 1 | none |
| 4.1 Euler (headline) | empty V; triangle + isolated vertex; two triangles; K4; path on 3; no edges | no walk; circuit on triangle; none; four odd vertices; trail only; nil walk Eulerian | holds; `Nonempty V` needed | none |
| 4.2 Veblen | two triangles sharing a vertex; no edges; two-way infinite path | degrees 2,2,4,2,2, two cycles; empty family; all degrees 2, no cycle | holds for finite V | none |
| 5.1 Prüfer correspondence | n = 2, 3; star; n = 1 | 1 tree, 1 function, 0 + 1 = 1; 3 = 3; centre n − 2 times; degree 0 ≠ 0 + 1 | holds for n ≥ 2 | none |
| 5.2 Cayley, prescribed degrees | n = 0…5; d = (2,2,1,1), (3,1,1,1), (2,2,0), (1,1,1); n = 1 | no tree vs 0⁰ = 1; 1,1,3,16,125; 2; 1; 0 trees vs coefficient 2 and 1; hypotheses contradict | holds; locator off by one | C01 |

- Source locators read at the text: 17 of 17 (Schrijver 7, Erickson 5, Diestel 3, Keller–Trotter 2); 16 agree, one wrong number (C01). Diestel was read from an OCR of the author's free preview.
- Library declarations opened at the pins: 40 Mathlib and 13 Tau Ceti names of the supplier contracts and scope section, by file and line or by `#check`; all exist with the statements quoted. One more, not cited, proves a target (R01).
- Cross-roadmap citations resolved on main: GraphConnectivityAndFlows 2.1, 3, 4, 5, 6.2, 7.4, 9 and its scope boundaries; GeometricTopology 4.4.5; MarkovDecisionProcesses 1.2. All resolve.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning (30). `#check @name` types compared with the README for all 42 declarations: the two definitions that keep fewer instance binders than their section (`GreedyColouring`, `arcMatrix`: `LinearOrder` only) need no more.
- One-tactic probe (`rfl`, `simp`, `simp` with the definitions unfolded, `infer_instance`) on a copy: none of the 30 theorems closes.
- Dependency check: `depcheck: 206 roadmaps, 2227 edges, 0 problem(s)`; no UPWARD or CYCLE line. The automatic checks all passed.
- The four headline theorems of the summary are stated in `Suggested.lean` (2.3 twice, 2.5, 3.3 twice, 4.1); none is declared not statable.
- Pull-request text against the head: 30 theorems, 12 definitions, the two imports, the suppliers and the scope as described; nothing contradicted.

Overlap check: read GraphConnectivityAndFlows (main), MatroidOptimization (open) and TopologicalDataAnalysis (open); the first two disclaim spanning forests of graphs and nothing is shared; TopologicalDataAnalysis 4.5 defines a minimum spanning tree of a finite metric space, a special case of 2.1 here, whose owner is this roadmap.

Source independence: 17 passages compared with 4 sources, none shared; largest share Schrijver2017, 7 of 17 locators; contents compared with Schrijver2017 (Chapter 1: nonnegative lengths, heaps, arbitrary lengths, spanning trees): independent.

Research link: none stated in the README. Found in other roadmaps' READMEs: the cut property is the input of single-linkage and degree-zero persistence (Carlsson–Vejdemo-Johansson; Dey–Wang, as cited by TopologicalDataAnalysis 4.5), and MatroidOptimization names minimum spanning forests as the forest-matroid case of its greedy theorem.

## Not verifiable

- Tarjan, *Data Structures and Network Algorithms* (1983), credited in 2.5 for the two colouring rules: no locator is given and no legal copy was found; the attribution was not checked.

## Source issues

- none

## For the human reviewers

- Scope: all four cited sources are textbooks or lecture notes (Diestel2025, Erickson2019, KellerTrotter2017, Schrijver2017); the README cites no research article, and its statements are standard course material in graph theory and combinatorial optimization.
- Licence: Schrijver2017 is unpublished lecture notes on the author's page with a copyright line and no stated licence; Diestel2025 was read from the author's free preview, whose PDF is protected against text extraction.
- Not tested: the attribution to Tarjan (1983) in 2.5 is in prose only; the pull request says the book was not consulted.
