# Review of GraphConnectivityAndFlows (pull request #2582 at 44f517c)

**Verdict:** accepted

**Summary.** Accepted. The eleven theorems of `Suggested.lean` are true at their stated generality; I checked degenerate cases and both directions of every equivalence. All 27 README Checks recompute to the values the README states, and the fifteen sampled sections, together with the locators in the `Suggested.lean` docstrings, hold at their theorem numbers and pages. No other roadmap owns these objects. There is one small correction (the description says more of the roadmap is proved in the pinned library than the head shows) and two format notes. Nothing needs a human decision.

## C01 — The description says some layers are entirely proved in the pinned library, but the head still lists targets in them

In the description's list of what the pinned Tau Ceti proves, three items say "all of the flow theory in Layer 3", "all of Layer 4" and "the whole circulation theory of §§8.1–8.7". The head still lists targets in each:

- Layer 3: terminal exchange, natural capacities over ℚ and ℝ, and the bound of item 6 (all §3.1), the counterexample of §3.2, the `SimpleGraph` statement of §3.3, and the identification of §3.4.
- Layer 4: constant functions under a reflexive `≤` (§4.1), and the ordinary-flow restatement (§4.2).
- Layer 8: the composition of shifts (§8.1), vertex-bound relaxation (§8.3), the residual max-flow reductions (§8.6), and the API common to the layer.

The description itself later says that §§3.2, 3.4, 4.1 and 4.2 have targets. Something like "most of the flow theory of Layer 3 and of Layer 4, and the circulation theorems of §§8.1–8.7; the remaining targets there are corollaries, API items and the residual reductions of §8.6" would be accurate.

## N01 — The order on strongly connected components used in §4.4 is Tau Ceti's, and its module is missing from the supplier contracts

§4.4 (line 1136) cites `Quiver.StronglyConnectedComponent.instPartialOrder` right after "Mathlib's `Quiver.StronglyConnectedComponent`". At the pin, the instance is Tau Ceti's (`TauCeti/Combinatorics/Quiver/StronglyConnectedComponent.lean`, line 46), and that module appears nowhere under "From Tau Ceti". It could go into the minimum-cut bullet or the supporting-modules bullet.

## N02 — Four cited works carry no theorem or page locator

These are Picard–Queyranne (§§4.2, 4.4), Frank–Gyárfás (§8.8), Gusfield (§9.1) and Korte–Vygen §8.6 (§§4.3, 9.1). The locators I found are:

- Picard–Queyranne: Theorem 1, p. 4, and the reduction on p. 6, of the 1979 report the reference links to (Polytechnique Montréal, EP-R-79-15).
- Frank–Gyárfás: Theorem 3, p. 355.

The Picard–Queyranne reference entry also lacks its year and venue.

## Source issues

- **Gap** in Diestel-GraphTheory-6 at Theorem 3.3.6, p. 76: the source says a graph is k-connected (or k-edge-connected) exactly when any two vertices are joined by k independent (edge-disjoint) paths. The "if" direction fails for the one-vertex graph when k ≥ 1: there the path condition holds vacuously, but the graph is not k-connected. It should require at least two vertices, as the README's §5.1 form does. Affects nothing.
- **Error** in Bertsekas-LNO at Exercise 2.6 of §1.2, p. 54: the source says every flow vector has an integer flow vector with the same divergence within distance less than one on each arc. That is false for one arc carrying 1/2. It should assume an integer divergence vector, as §8.7 of the README does. Affects nothing.

## For the human reviewers

- none

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| §1.5 (Diestel §1.4, p. 12) | K₄; k parallel edges; one vertex | κ(K₄)=3 (needs >k vertices); λ=k, simplification λ=1; one vertex: λ=⊤, κ=0 by the Tau Ceti definitions | holds |
| §2.1 (Diestel p. 11, p. 24) | single edge; two parallel edges | bridge, bond {e}; no bridge, boundary of {u} a 2-edge bond; Diestel p. 11: bridge ⇔ on no cycle | holds |
| §2.2 (Diestel p. 11) | definition | "separates two vertices of the same component" = `Graph.IsCutVertex` (CutVertex.lean:46) | holds |
| §3.2 counterexample | s→a:2, a→t:1, s→t:−1, B=1 | cuts {s}=1, {s,a}=0; capped {s}=0, {s,a}=0: minimum value 0 kept, cut set changes | holds |
| §3.3 (Diestel Thm 6.2.2, p. 159) | source networks | multigraph with capacities on both orientations; Sym2 capacities are the symmetric case | holds |
| §3.4 | Nonneg ℤ ≃ ℕ | 0↦0, 3↦3, toNat∘cast = id | holds |
| §3.5 (BJG §3.2.4, pp. 102–103) | vertex splitting | u* on split arcs; vertex capacity ∑u bounds all traffic | holds |
| §4.4 (Picard–Queyranne Thm 1, p. 4) + Check | s,a,b,t unit capacities | residual arcs a→s,t→a,b→s,t→b,a→b; cuts {s},{s,b},{s,a,b}=2 each; {s,a}=3 | holds |
| §6.2 (BJG §1.5, pp. 16–17) | definitions | k-strong needs \|V\|≥k+1; λ(D)≥k ⇔ d⁺,d⁻(X)≥k | holds |
| §6.3 (Diestel L. 3.1.3 p. 65, Thm 3.3.6 p. 76) | two triangles at v; triangle plus isolated vertex | vertex–edge pair on no common cycle; edge–edge holds without connectivity, so "connected" is needed | holds |
| §6.8 (Diestel Thm 2.1.2 p. 40, Ex. 9 p. 57; Schrijver Ex. 3.6, 3.12 pp. 43–44) | L={a}, R={r}, 2 parallel edges, b=(2,1) | b(S)=2 > b(N(S))=1; usage(a) ≤ usage(r) ≤ 1 | holds |
| §8.1 (Bertsekas §1.1.3, p. 14) + Check | v⇄w with bounds [1,2]; then ℓ=(1,0) | excess ℓ = 0; then −1 at w, +1 at v | holds |
| §8.6 (BJG Thm 3.4.2 p. 106, Thm 3.9.1 p. 128) | residual reductions | m = val f − max t→s residual flow; M = val f + max s→t | holds |
| §8.7 (Bertsekas Ex. 2.4–2.6, pp. 54–55) | one arc carrying 1/2 | divergence ±1/2, so no integer rounding; README requires integer excess | holds (source lacks it) |
| §8.8 (Frank–Gyárfás Thm 3, p. 355) + Check | triangle (3,0,0); loop | S of two vertices: \|E(S)\|=1 > d(S)=0; loop indegree 1 | holds |
| `isAcyclic_blockCutGraph` | K₁; two triangles at v; infinite G | one vertex; path B₁–v–B₂; a cycle's union of blocks contradicts maximality | true |
| `isTree_blockCutGraph` | path a–b–c; infinite connected G | {a,b}–b–{b,c}; Zorn puts each edge in a block, and consecutive blocks share cut vertices | true |
| `exists_capacitatedMatching_cover_eq` | one edge b=(2,2); b=0; empty graph | 2=2; 0=0 with C=all; 0=0 with C=∅; TU dual | true |
| `exists_capacitatedMatching_saturating_left_iff` | b=(2,1) parallel pair; b=(1,1); L=∅ | both sides false; both true; both true | true |
| `exists_edgeColoring_iff` | k=0 edgeless/one edge; k parallel edges | true/true, false/false; k colours ⇔ degree k | true |
| `isVertexConnected_two_iff_exists_isOpen_earDecomposition` | K₂; triangle; path a–b–c | false/false (3 ≤ 2 fails, no cycle); true/true; false/false | true |
| `exists_isOpen_earDecomposition_initial_eq` | C₄ plus chord, triangle a,b,c | triangle, then ear a,d,c | true |
| `isEdgeConnected_two_iff_exists_earDecomposition` | {v} edgeless; one edge; parallel pair; empty | true/true; false/false; true/true; empty excluded by hV | true |
| `exists_isStronglyConnected_orientation_iff` | empty; one edge; parallel pair; loop | true/true; false/false; true/true; true/true | true |
| `exists_isStronglyConnected_doubledQuiverOrientation_iff` | empty; K₂; triangle | Mathlib's IsEdgeConnected is preconnected-based: true/true; false/false; true/true | true |
| `exists_stNumbering` | triangle; C₄ plus chord, s=a, t=b | v↦1 has neighbours 0,2; a,d,c,b ↦ 0,1,2,3 valid, c↔d swap fails | true |
| Max-flow/min-cut (pin) | `Flow.exists_val_eq_arrowSum` (ShortestAugmentation.lean:378) | hypotheses s≠t, 0≤cap, as in the Summary; §3.1 lex ℤ×ℤ Check: value (0,2m) forever, shortest augmentation (2,0) | holds |
| Global Menger (pin) | `isVertexConnected_iff_forall_exists_paths` (VertexConnectivity.lean:439) | [Finite V], k < card: matches "more than k vertices" | holds |
| Gomory–Hu (pin) | `exists_isCutTree` (GomoryHu.lean:389); Fin 4 Check | IsCutTree extends IsFlowEquivalentTree; path fails f({0,1})=2, star passes | holds |
| Hoffman (pin) | `exists_isCirculation_iff` (Hoffman.lean:424) | arrowSum lo Sᶜ S ≤ arrowSum hi S Sᶜ = ℓ(δ⁻S) ≤ u(δ⁺S) | holds |
| Hakimi (pin) | `exists_orientation_indegree_eq_iff` (Hakimi.lean:553) | balance plus internal-edge bound; interval version implies incident-edge bound by complement | holds |
| Bridge forest (pin) | `isForest_bridgeForest` (Forest.lean:360) | no hypotheses; two triangles + bridge + isolated: 3 = 1 + 2 | holds |
| C01 (description) | §§3.1–3.4, 4.1, 4.2, 8.1, 8.3, 8.6 | targets listed at head vs "all of Layer 4" | correction |

- Source locators checked against the texts: 58 locators across 7 sources: Diestel 6th edition (author's preview, OCR, 22), Bang-Jensen–Gutin 1st edition (15), Schrijver's notes (14), Bertsekas (4), Papamanthou–Tollis, Picard–Queyranne and Frank–Gyárfás (1 each).
- Library declarations opened at the pins:
  - Mathlib: `SimpleGraph.IsEdgeConnected` (EdgeConnectivity.lean:37), `Quiver.IsStronglyConnected` (Quiver/ConnectedComponent.lean:89), `SimpleGraph.IsBridge` (Connected.lean:815, no adjacency required, so the README's §2.1 and §7.2 remarks are true), `Graph.IsBridge` and `Graph.IsBond` (EdgeCut.lean:140, 167).
  - Tau Ceti: `Graph.Ear`, `EarStart`, `EarDecomposition`, `IsOpen` (Ear/Basic.lean:50–302), `Graph.IsEdgeConnected` (EdgeConnectivity.lean:152), `SimpleGraph.IsVertexConnected` (VertexConnectivity.lean:217), `IsBlock` (Block.lean:59), `IsCutVertex` (CutVertex.lean:46), `incidenceCount` (Incidence.lean:45), `Graph.Orientation` (Orientation/Basic.lean:44), `DoubledQuiver.Orientation` (Zigzag/Orientation.lean:73).
- Every backticked README name resolves at the pins, except the Mathlib-proposal names `SimpleGraph.EdgeColoring` and `chromaticIndex`, which the README marks as such.
- Cross-roadmap citations resolved:
  - Supplier: ZigzagPreprojective §0.2 (on main).
  - Consumers on main: FreeGroupsAndLimitGroups (§1.1 anchor unchanged), TemperleyLiebOperatorAlgebras, NeronModelsAndSemistableAbelianVarieties (`signedCirculations` mapped in §8.1), and QuiverRepresentationsPartII ("Scope boundaries" mapped).
- Automatic checks: all passed. Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: eleven `sorry` warnings only.
- `#check @name` pass: all 14 declarations keep every binder their README statements need.
- One-tactic probe (`simp`, `rfl`, `infer_instance`, `decide`): closed none of the 11 theorems.
- Duplication: neither pinned library has a multigraph bipartition, a block–cut graph, an st-numbering, Robbins' theorem or an ear characterization.

Overlap check: read SpanningTreesAndShortestPaths, GraphColouring, HamiltonianCycles and MatroidOptimization (the closest-roadmap lists name no roadmap on main). Each cites this roadmap rather than restating anything: Kőnig's edge-colouring (GraphColouring), capacitated Kőnig and Hall and submodularity (MatroidOptimization), connectivity, blocks and Dirac's theorem (HamiltonianCycles), and flows, Menger, st-numberings and Gomory–Hu (SpanningTreesAndShortestPaths). The owner of all of these is GraphConnectivityAndFlows.

Source independence: 16 passages compared with 7 sources. None is shared beyond forced statements; the longest run is 4 words of the st-numbering definition (PapamanthouTollis line 59). The largest share of the locators is Diestel-GraphTheory-6, about 30 of 77. Contents compared with Diestel's table of contents: independent. Diestel orders matching (Ch. 2), connectivity (Ch. 3) and flows (Ch. 6); the roadmap orders flows (Layer 3), minimum cuts (Layer 4), Menger (Layer 5) and matching (Layer 6), and Layers 4, 8 and 9 have no Diestel chapter.

Research link: Layers 1 and 8 supply the component count and the signed circulation lattice of dual graphs that NeronModelsAndSemistableAbelianVarieties §4.2 uses for semistable reduction. Layer 4 formalises Picard–Queyranne (1980) and Layer 9 Gomory–Hu as constructed by Gusfield (1990). This rests on the README's Downstream consumers section and references, and on the citing roadmaps on main.

## Not verifiable

- Korte–Vygen, *Combinatorial Optimization*, §8.6: a paywalled Springer book, with no legal copy found. It is cited only for the pinned Gomory–Hu construction.
- Gusfield, SIAM J. Comput. 19 (1990): paywalled at the DOI. It is cited only for the pinned construction.
- The Mathlib pull requests and Zulip threads under "Interface design references": these are design references, not dependencies, and I did not open them.
