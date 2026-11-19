# Review of GraphConnectivityAndFlows (pull request #2582 at 44f517c)

**Verdict:** accepted

**Summary.** Accepted. The eleven theorems of `Suggested.lean` hold at the generality stated, on every degenerate case I computed against the pinned definitions (empty graph, one vertex, loops, parallel edges, `K₂`, `k = 0`, zero capacities), and the 27 README Checks recompute to the values printed. Every locator of the fifteen sampled sections and of the `Suggested.lean` docstrings is at its theorem number and page in the text. The head is the one the previous review read, so its one small correction (the description overstates what the pinned library proves) and its two format notes still stand; none blocks. Nothing is left for a human to decide.

## C01 — The description says three layers are entirely proved in the pinned library, while the head keeps targets in each

A reader of the description would conclude that Layers 3, 4 and §§8.1–8.7 ask an implementer for nothing. Its list of what the pinned Tau Ceti proves says "all of the flow theory in Layer 3", "all of Layer 4" and "the whole circulation theory of §§8.1–8.7". At the head these sections still state targets:

- Layer 3: terminal exchange, natural capacities over `ℚ` and `ℝ` and the bound of item 6 (§3.1, lines 841–850), the counterexample of §3.2 (line 878), the `SimpleGraph` statement of §3.3 (line 912), the identification of `Nonneg ℤ` with `ℕ` (§3.4, line 935).
- Layer 4: constant functions under a merely reflexive `≤` (§4.1, line 1045) and the restatement for ordinary flows (§4.2, line 1084).
- Layer 8: the composition of shifts (§8.1, line 1814), vertex-bound relaxation (§8.3, line 1881), the two residual reductions (§8.6, line 1939), and the API common to the layer (line 1788).

The description's own later paragraph lists §§3.2, 3.4, 4.1 and 4.2 among the sections with targets. A wording that is true of the head: "most of the flow theory of Layer 3 and of Layer 4, and the circulation theorems of §§8.1–8.7; the targets left there are corollaries, API items and the residual reductions of §8.6".

## N01 — The order on strongly connected components cited in §4.4 is Tau Ceti's, and its module is not in the supplier contracts

§4.4 (line 1136) cites `Quiver.StronglyConnectedComponent.instPartialOrder` directly after "Mathlib's `Quiver.StronglyConnectedComponent`". At the pin the instance is declared in `TauCeti/Combinatorics/Quiver/StronglyConnectedComponent.lean`, line 46, a module that no bullet under "From Tau Ceti" names. The minimum-cut bullet or the supporting-modules bullet would be the place.

## N02 — Four cited works have no theorem or page locator

Picard–Queyranne (§§4.2, 4.4), Frank–Gyárfás (§8.8), Gusfield (§9.1) and Korte–Vygen §8.6 (§§4.3, 9.1) are cited by title or section only, and the reference entries of the first two give neither year nor venue. For Frank–Gyárfás the statement used is their Theorem 3 (lower and upper bounds on the outdegrees, in the Keszthely 1976 colloquium volume, which excludes loops, as the README's reference entry already notes).

## Source issues

- **Gap** in Diestel-GraphTheory-6 at Theorem 3.3.6 (i), p. 76: the source says a graph is k-connected exactly when any two vertices are joined by k independent paths; it should exclude the one-vertex graph, where the path condition is vacuous and the proof's step to more than k vertices fails; affects nothing.
- **Error** in Bertsekas-LNO at Exercise 2.6 of §1.2, pp. 54–55: the source says every flow vector has an integer flow vector with the same divergence and arc values within less than one; it should assume an integer divergence vector (one arc carrying 1/2 has divergence ±1/2); affects nothing.

## For the human reviewers

- none

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| §1.2 cuts and aggregation (Diestel §1.4 p. 11, §1.9 p. 24) | `u, w`, parallel edges of capacity 1, 2, 0, loop of capacity 5 at `u` | boundary of `{u}`: 3 edges, capacity 3; pair capacity 3, diagonal 0; with the loop 8 | holds |
| §2.1 bridges (Diestel p. 11, p. 24) | one edge; two parallel edges | bridge, `{e}` a bond; no bridge, boundary of `{u}` a 2-edge bond; pin lemma needs finitely many components | holds |
| §2.2 cut vertices (Diestel p. 11) | path `a–b–c` | deleting `b`: 1 → 2 components, cut vertex; deleting `a`: 1 → 1, not one; isolated vertex: count drops | holds |
| §3.1 flows (BJG Thm 3.3.1 p. 104, Thm 3.5.5 p. 112; Schrijver Thm 4.3 p. 62) + Check | lexicographic `ℤ × ℤ` network | bottleneck `(0,1) < (1,0)` at every step; after `2m` steps value `(0,2m)`; shortest rule reaches `(2,0)` = cut `{s}` | holds |
| §3.2 capping counterexample | `s→a:2`, `a→t:1`, `s→t:−1`, `B = 1` | cuts `{s}` = 1, `{s,a}` = 0; capped: `{s}` = 0, `{s,a}` = 0, so the set of minimum cuts changes | holds |
| §4.2 canonical cuts | network of the §4.4 Check | reachable from `s` in the residual quiver: `{s}`; reaching `t`: `{t}`; smallest `{s}`, largest `{s,a,b}`; gap identity 2 − 2 = 0 | holds |
| §4.4 poset of minimum cuts + Check | `s,a,b,t`, unit capacities, arrow `a→b` | residual arrows `a→s`, `t→a`, `b→s`, `t→b`, `a→b`; cuts `{s}`, `{s,b}`, `{s,a,b}` = 2; `{s,a}` = 3 | holds |
| §4.3 Check (non-crossing needs symmetry) | the six directed capacities on `0..3` | `{0,3}`: 3 (also `{0,2,3}`: 3); only min `0–3` cut `{0,1}`: 3; only min `3–0` cut `{1,3}`: 2; no side inside `{0,3}` | holds |
| §5.2 reductions (BJG §3.2.4 pp. 102–103, Thm 7.3.1 p. 353) | path `s–v–t`, `c(v) = 2` | `M = 3`; split arrow of `v` is a cut of capacity 2 < 3; packing repeats the path twice; separator weight 2 | holds |
| §6.2 directed connectivity (BJG §1.5 pp. 16–17) | 2-cycle `v ⇄ w`, then a loop at `v` | arc connectivity 1; arrows leaving `v`: 1, with loop 2, non-loop 1; source asks `\|V\| ≥ k+1` as the pin does | holds |
| §6.4 preservation | `K₄`, `k = 3`, delete 1 and 3 vertices | `K₃` is 2-connected (3 ≥ 3 vertices); `K₁` is 0-connected; pin lemma has `s.encard ≤ k` | holds |
| §6.5 fan lemma (Diestel Cor. 3.3.4 p. 75) | `K₄`, `k = 3`, `U` the other three vertices | three one-edge paths meeting only in `x`; pin has `k ≤ #U`, `x ∉ U` | holds |
| §6.8 Hall (Diestel Thm 2.1.2 p. 40, Ex. 9 p. 57; Schrijver Ex. 3.6, 3.12 pp. 43–44) + Check | `L={a}`, `R={r}`, 2 parallel edges, `b=(2,1)`; `S=∅` | `b(S)=2 > b(N(S))=1`, usage at `r` ≤ 1 so `a` unsaturated; `∅` gives 0, so natural subtraction is harmless | holds |
| §8.1 shifts (Bertsekas §1.1.3 p. 14) + Check | `v ⇄ w` bounds `[1,2]`; then `ℓ = (1,0)` | excess of `ℓ`: 0; then `+1` at `w`, `−1` at `v`, so `b − excess ℓ = (−1 at w, 1 at v)` | holds |
| §8.4 residual adjustments | bounds `[0,5]`, `(f,g) = (1,3)` and `(3,1)` | `r⁺ = 2 ≤ 4`, update `1+2 = 3`; `r⁻ = 2 ≤ 3`, update `3−2 = 1`; `min(r⁺,r⁻) = 0` | holds |
| §8.6 extremal values (BJG Thm 3.4.2 p. 106, Thm 3.9.1 p. 128) | one arrow `s→t`, bounds `[−3,−1]`, `f = −2` | `M = U({s}) = −1 = −2 + 1`; `m = L({s}) = −3 = −2 − 1`; both negative | holds |
| `isAcyclic_blockCutGraph`, `isTree_blockCutGraph` (Diestel L. 3.1.4 p. 66, Ex. 7 p. 87) | `K₁`; path `a–b–c`; two triangles at `v`; `V` empty; infinite connected `G` | one block `{v}`, one-vertex tree; `{a,b}–b–{b,c}`; path of 3; `Connected` fails; chain unions keep "connected, no cut vertex", so blocks exist | true |
| `exists_capacitatedMatching_cover_eq` (Schrijver Thm 8.3 p. 139, Cor. 8.1b p. 135, Ex. 8.11 p. 143) | one edge `b=(2,2)`; `b = 0`; empty graph | size 2 = weight 2; 0 = 0; 0 = 0 with `C = ∅`; duality by total unimodularity | true |
| `exists_capacitatedMatching_saturating_left_iff` | parallel pair `b=(2,1)`; `b=(1,1)`; isolated `v ∈ L` with `b v = 1`; `L = ∅` | false/false; true/true; false/false (`N = ∅`); true/true | true |
| `exists_edgeColoring_iff` (Schrijver Thm 7.4 p. 116; Diestel Prop. 5.3.1 p. 132) | `k = 0` edgeless and one edge; `k` parallel edges | true/true and false/false; `k` colours ⇔ incidence count `k`; `incidenceCount` is `ncard`, finite here | true |
| `isVertexConnected_two_iff_exists_isOpen_earDecomposition` (Diestel Prop. 3.1.1 p. 63) | `K₂`; `K₃`; path `a–b–c`; `V` empty | false/false (`3 ≤ 2` fails; no cycle in a loopless simple multigraph); true/true; false/false; false/false | true |
| `exists_isOpen_earDecomposition_initial_eq` | `C₄` with chord `a–c`, cycle `a,b,c` | triangle then open ear `a,d,c`; `EarStart.cycle` indexes by `walkGraph`, so the equation types | true |
| `isEdgeConnected_two_iff_exists_earDecomposition` (BJG Thm 1.6.2 pp. 20–21) | one vertex; one vertex with loop; one edge; parallel pair; empty | true/true; true/true (one-edge closed ear); false/false; true/true (two-edge closed ear); excluded by `hV` (left true, right false) | true |
| `exists_isStronglyConnected_orientation_iff` (BJG Thm 1.6.2 p. 20, §8.6 p. 443) | empty; one vertex with loop; one edge; parallel pair; two isolated vertices | true/true; true/true; false/false; true/true; false/false (`IsEdgeConnected` asks reachability) | true |
| `exists_isStronglyConnected_doubledQuiverOrientation_iff` | `V` empty; `K₂`; `K₃` | true/true; false/false; true/true; Mathlib's predicate is preconnectedness after deleting fewer than 2 edges | true |
| `exists_stNumbering` (Papamanthou–Tollis §1 p. 338) + Check | `C₄` with chord `a–c`, `s=a`, `t=b` | `a,d,c,b ↦ 0,1,2,3`: `d` sees 0 and 2, `c` sees 1 and 3; swapping `c,d` fails at `d` (0 and 1) | true |
| Max-flow/min-cut, Menger, Gomory–Hu (pin) | Summary against the README sections and the pinned names | hypotheses `s ≠ t`, `0 ≤ cap`; nonadjacent terminals, more than `k` vertices; nonempty finite `V`, symmetric submodular | holds |
| §9.1 Check | `f(S) = min(\|S\|, 4−\|S\|)` on `Fin 4` | all `λ = 1`; path: `f({0,1}) = 2`; star: sides `{i}`, `f = 1`; pair capacities would force `c = 0`, cut 0 ≠ 1 | holds |
| §8.2, §8.3 criteria | one arrow `v→w` `[0,1]`; the fresh-vertex network | `1+0 ≤ 1`; `1+0 > 0`; Hoffman on `S` and `S ∪ {r}` gives `−U(S) ≤ b(S)` and `a(Sᶜ) ≤ U(S)` | holds |
| §8.8 Hakimi + Checks | triangle `(1,1,1)`, `(2,1,0)`, `(3,0,0)`; one loop | realized; realized; `\|E(S)\| = 1 > d(S) = 0`; loop indegree 1 | holds |
| §2.4 path correspondence and degree formula | two triangles at `v`; `x` itself a cut vertex | `2 + 1 = 1 + 2`; the criterion does not depend on the block chosen for `x` | holds |
| C01 (description) | lines 841–850, 878, 912, 935, 1045, 1084, 1788, 1814, 1881, 1939 | targets present at the head against "all of Layer 4" | correction |

- Source locators read in the texts: 58, in six sources: Diestel 6th edition (author's preview, OCR; 24), Bang-Jensen–Gutin 1st edition (16), Schrijver's notes (14), Bertsekas (2), Papamanthou–Tollis (1), Frank–Gyárfás (1). The printed pages agree with the README in every case.
- Library declarations opened at the pins: 33. Mathlib: `SimpleGraph.IsEdgeReachable`, `IsEdgeConnected` (EdgeConnectivity.lean:32, 37), `Quiver.IsStronglyConnected` (ConnectedComponent.lean:89), `Graph.Adj` (Graph/Basic.lean:315), `SimpleGraph.lineGraph`. Tau Ceti: `IsBlock` (Block.lean:59), `IsCutVertex`, `Graph.Ear`, `EarStart`, `EarDecomposition`, `IsOpen` (Ear/Basic.lean), `Graph.Walk.IsCycle` (Walk/Basic.lean:471), `Graph.IsEdgeReachable`, `IsEdgeConnected` (EdgeConnectivity.lean:76, 152), `SimpleGraph.IsVertexConnected` (VertexConnectivity.lean:217), `Graph.Orientation` (Orientation/Basic.lean:44), `incidenceCount` (Incidence.lean:45), `DoubledQuiver.Orientation`, `Quiver.StronglyConnectedComponent.instPartialOrder`, and thirteen declarations of §§2.1, 2.2, 3.2, 4.2, 6.2, 6.4, 6.5, 8.6 compared with the prose.
- Cross-roadmap citations resolved: supplier ZigzagPreprojective §0.2 (on main); consumers FreeGroupsAndLimitGroups (the §1.1 anchor is unchanged), TemperleyLiebOperatorAlgebras, NeronModelsAndSemistableAbelianVarieties (the two renamed names are mapped in §8.1), QuiverRepresentationsPartII ("Scope boundaries" is mapped), DimerModelsAndLozengeTilings (§§6.7–6.9 exist).
- Automatic checks: all passed. Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`. No change outside the folder.
- Elaboration of `Suggested.lean`: eleven `sorry` warnings and nothing else. `#check @name` on the declarations: every binder the README statements need is in the elaborated types; nothing changed.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `simp` with the three definitions unfolded): closed none of the eleven theorems.
- Duplication by object: neither pinned library has a block–cut graph, a multigraph bipartition, an edge-colouring theorem, an `st`-numbering, Robbins' theorem or an ear characterization (the ear module has the data and its prefix API only).
- Previous review: no findings; its C01, N01 and N02 are unrepaired because the head is unchanged, and are restated above.

Overlap check: read SpanningTreesAndShortestPaths, GraphColouring, HamiltonianCycles and MatroidOptimization (no roadmap on main is listed as close); each cites this roadmap for what it uses (bridges, bonds, flows, Menger, `st`-numberings and Gomory–Hu; Kőnig's edge-colouring theorem; connectivity, cut vertices and blocks; submodularity and the capacitated Kőnig and Hall theorems), so the owner of every shared object is GraphConnectivityAndFlows.

Source independence: 12 passages compared with 5 sources, none shared beyond forced statements (longest run 4 words, the cut-vertex and `st`-numbering definitions); largest share Diestel-GraphTheory-6, 31 of 67 page locators; contents compared with Diestel-GraphTheory-6: independent (its order is matching, connectivity, colouring, flows; here flows, minimum cuts, Menger, matching, ears, circulations, cut trees, and Layers 4, 8 and 9 have no chapter there).

Research link: Layer 9 is the Gomory–Hu theorem in the contraction-free form of Gusfield (1990), and §7.4 the `st`-numberings of Lempel, Even and Cederbaum as stated by Papamanthou–Tollis (2010); §§1.1, 1.3 and 8.1 are prerequisites of NeronModelsAndSemistableAbelianVarieties and FreeGroupsAndLimitGroups. Rests on the README's references and Downstream consumers section.

## Not verifiable

- Korte–Vygen, *Combinatorial Optimization*, §8.6: a paywalled book, no legal copy found; cited only for constructions the pinned library already proves.
- Gusfield, SIAM J. Comput. 19 (1990): paywalled at its DOI; cited only for the pinned cut-tree construction.
- Picard–Queyranne: only the repository's landing page was read, not the report; the README cites it without a locator, for the pinned §§4.2 and 4.4.
- The Mathlib proposals and discussion threads under "Interface design references": design references, not dependencies; not opened.
