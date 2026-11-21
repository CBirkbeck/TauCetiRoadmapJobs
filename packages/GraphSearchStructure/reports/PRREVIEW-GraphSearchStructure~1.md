# Review of GraphSearchStructure (pull request #2950 at 950242d)

**Verdict:** needs changes

**Summary.** Changes are needed, for one sentence: 4.2 says that normal spanning trees exist for all connected graphs, which is false for uncountable complete graphs; the repair is a few words. Every stated theorem, Check and route was recomputed and none failed, including an independent enumeration over all relations on at most four vertices and all simple graphs on at most five. There are one small correction and two format notes, none blocking. Neither source could be opened here, so no locator was checked against its text; that, and the placing of the subject, are left to the human reviewers.

## R01 (P2) — The sentence in 4.2 that existence of normal spanning trees is proved "for all connected graphs" is false beyond countable graphs

In 4.2 (line 518) the README sets its own result "for finite connected graphs" against "Diestel, Proposition 1.5.5, p. 16, proves existence for all connected graphs by another route". Read beside "finite", this says that every connected graph, infinite ones included, has a normal spanning tree. A reader would take the finiteness in the roadmap's corollary to be an artefact of the method, and the Conventions (an infinite connected graph carries no forest) make the contrast pointed.

The statement is false. In a normal spanning tree of a complete graph any two vertices are comparable, so the tree is a single chain from the root; every vertex of a rooted tree has finitely many ancestors, so the chain is countable. Hence the complete graph on an uncountable vertex set has no normal spanning tree. The source could not be opened here; if its Chapter 1 works under a standing convention that graphs are finite, the proposition is the finite statement with a prescribed root.

The smallest change: replace "for all connected graphs" by what is true and what the proposition gives, for example "proves existence for finite connected graphs, with any prescribed root, by another route", and, if wanted, add that a countable connected graph also has one while an uncountable complete graph does not.

## C01 — The low-point criteria are attributed to Hopcroft and Tarjan, and the component theorems to Kosaraju, Sharir and Tarjan, but the References name no work of theirs

In 4.4 (line 573) the criteria of 4.4–4.6 are said to be "due to Hopcroft and Tarjan", and 3.4 and 3.5 carry the names of Kosaraju, Sharir and Tarjan; the References list only Erickson and Diestel, and for 4.4–4.6 the only locator is a "nearest opened statement" that is a different result. A reader who wants the original statement of the cut-vertex or bridge criterion has nothing to look up. A bibliographic entry for each attribution would settle it (the original papers, cited by title, journal and year, marked as named for attribution and not consulted if that is the case); alternatively drop the attribution.

## N01 — The Example of Layer 5 and the Remark of 1.2 report verification runs, not examples

The Layer 5 Example (line 691) says that all 160224 pairs on at most six vertices satisfy 5.1, which the theorem already implies, and the Remark of 1.2 gives the totals of an enumeration. The figures are right (26704 connected labelled graphs on six vertices times six base vertices is 160224; 3031 of the graphs are bipartite, leaving 23673 × 6 = 142038; the totals 32632 and 27360 were reproduced). An example a reader can follow would serve better in Layer 5: the 5-cycle from any vertex has distances 0, 1, 1, 2, 2, and the edge joining the two vertices at distance 2 lies inside a layer.

## N02 — Two `*Needs:*` lines omit a Layer 2 input their routes use

The route of 4.2 uses (L3), which rests on 2.1, and the route of 4.4 uses (L3) as well; their `*Needs:*` lines (lines 536 and 593) list no item of Layer 2 other than through 4.1. Adding 2.1 to both would make the lines agree with the layer's Dependencies paragraph.

## Questions for the author

- Diestel, sixth edition: are "Lemma 1.5.4" and "Proposition 1.5.5" (4.1, 4.2, 4.4) and "Exercise 29" the sixth edition's numbers? In the fifth edition the normal-tree lemma and the existence proposition are 1.5.5 and 1.5.6. The Chapter 1 preview linked from the author's site was fetched but asks for a password, so the numbers could not be compared.
- In 3.1 the README says that Erickson states the cyclic side as `u.post < v.post` for some edge, "which misses loops". Is that the wording of §6.2 at p. 231, or does the text there handle `u = v` separately? The chapter could not be obtained through the project's sources service, so this could not be checked; if it is as the README says, it belongs in the errata register.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `IsAncestor` | chain `a → b → c`; a root | `a` anc. of `c`; `c` anc. only of `c`; reflexive at a root | holds | none |
| 1.2 `IsDFSForest`, six axioms | the six "without (Dk)" examples; `ℕ` with arcs `0 → n` | each example satisfies the other five and breaks the named theorem; e.g. without (D2): times 0,2,3,5,4,1, (a,c) nested, not ancestor | Checks true | none |
| 1.2 Remark, counts | all relations n ≤ 4, graphs n ≤ 5 | 688128 labelled pairs, 3044 classes, 32632 class–forest pairs; 27360 graph–forest pairs; each equals a simulated search | reproduced | none |
| 1.3 `RootsByKey` | two isolated vertices, keys 1, 0 | `a` first: holds; `b` first: needs `1 ≤ 0`, fails; equal keys: both hold | holds | none |
| 1.4 existence | n ≤ 4, every relation; `ℕ`, `key = id` | 65536 of 65536 relations on 4 vertices carry a forest; on `ℕ` the first root would need a largest key | holds; finiteness needed | none |
| 2.1 parenthesis theorem | all 688128 pairs, n ≤ 4; `u = v`; (D1) dropped | ancestor ⇔ `pre u ≤ pre v ∧ post v ≤ post u` in every case; two vertices at `[0,1]` refute it without (D1) | holds | none |
| 2.2 white-path theorem | all pairs n ≤ 4; arc `a → b` searched from `b` | both sides agree in every case; `pre b = 0 < 2 = pre a`, `b` not a descendant | holds | none |
| 2.3 arc classes | all arcs, n ≤ 4; a loop; crossing intervals | one of the three alternatives always; `a=[0,2], b=[1,3]` fails all three without (D3) | holds | none |
| 3.1 acyclicity | n ≤ 4; one loop | acyclic ⇔ strict decrease in every case; loop: `post v < post v` false, `≤` true | holds | none |
| 3.2 components are subtrees | n ≤ 4; arcs `a⇄b`, `a → c` | exactly one vertex per component with parent `none` or outside: `a` and `c` | holds | none |
| 3.3 finishing times and the order | n ≤ 4; the example of 3.2 | witness exists whenever `mk u < mk v`; `post a = 5 > 4 = post c`; least time `2 < 4` refutes the "least" variant | holds; direction `C ≤ D` = `C` reaches `D` checked at the pin | none |
| 3.4 Kosaraju–Sharir | 1209600 pairs of forests on n = 4 (2592 on n = 3); no reversal; wrong priority | tree of each root = its component in every pair; unreversed: tree `{a,b}`; increasing priority: `post a = 3 ≤ 2` fails | holds | none |
| 3.5 Tarjan, `lowLink` | n ≤ 4, every vertex; 3-cycle; arc `b → a` | both sides agree; cycle: low-links 0,0,0; `lowLink b = 0 < 2` with `mk b` not a sink | holds | none |
| 4.1 normality | graphs n ≤ 5; directed `a→b, a→c, c→b` | only ancestor–descendant pairs can be edges (27360 = sum over forests of subsets of such pairs); directed: `post b = 2 < 3 = pre c` | holds | none |
| 4.2 spanning tree | connected graphs n ≤ 5; two isolated vertices | connected ⇒ exactly one root, so n − 1 tree edges and connected; two roots, no edge | holds | none |
| 4.2, sentence on all connected graphs | uncountable complete graph | normal tree of a complete graph is a chain, hence countable | false as written | R01 |
| 4.3 `lowPoint` | edge `a – b`; triangle; path | `lowPoint b = 1`, `lowLink b = 0`; triangle 0, 0; path 1, 2 | Checks true; parent-edge exclusion needed | none |
| 4.4 roots | graphs n ≤ 5, every root; path from middle and from end | cut vertex ⇔ two children in every case; middle root: 2 children, cut; end root: 1 child, not | holds | none |
| 4.5 vertices with a parent | graphs n ≤ 5; path; triangle; root | agrees in every case; `lowPoint c = 2 ≥ 1`; triangle `0 < 1`; root `a` of one edge satisfies the inequality, not a cut vertex | holds; root split needed | none |
| 4.6 bridges | graphs n ≤ 5, every tree edge | bridge ⇔ `lowPoint v = pre v` in every case; `IsBridge` at the pin has no adjacency clause, harmless since `parent v = some u` gives an edge | holds | none |
| 5.1 bipartite layers | 4-cycle, triangle, edge plus isolated `s` | distances 0,1,2,1 and 0,1,1; `dist s x = dist s y = 0` across components; truncated `− 1` case of the layer lemma is excluded by the hypothesis | holds; connectivity needed for (⇒) | none |
| Layer 5 Example, counts | n = 6 | 26704 × 6 = 160224; (26704 − 3031) × 6 = 142038 | correct | N01 |

- Source locators checked against the text: 0 of the 15 sampled targets (7 cite Erickson, 4 cite Diestel, 4 cite nothing); see Not verifiable.
- Library declarations opened at the pins: 31 (Mathlib: `SimpleGraph.IsBridge` and `isBridge_iff` at `Connectivity/Connected.lean` 815–819, `Adj.diff_dist_adj` at `Metric.lean` 320, `two_colorable_iff_forall_loop_even` at `Coloring/Constructions.lean` 175, `Nat.sInf_mem` at `Order/Lattice/Nat.lean` 75, among others; Tau Ceti: `mk_le_mk` at `Combinatorics/Quiver/StronglyConnectedComponent.lean` 57, `Quiver.IsAcyclic` at `RepresentationTheory/Quiver/Acyclic/Basic.lean` 40, `isCutVertex_iff_exists_forall_walk_mem_support` at `Combinatorics/SimpleGraph/Connectivity/CutVertex.lean` 53); each exists with the statement and file the README gives. Not opened one by one: `Relation.ReflTransGen`, `Quiver.Path`, `Quiver.Path.comp`, `SimpleGraph.deleteEdges`, `SimpleGraph.Walk.append`, `SimpleGraph.Walk.reverse`.
- Cross-roadmap citations resolved: GraphConnectivityAndFlows 2.1–2.4 and 7.1–7.4 (same subjects on main and at the open revision; the description names the revision); SpanningTreesAndShortestPaths 3.1 and 3.6 at its open head. Neither is consumed.
- Dependency check output: `depcheck: 16 roadmaps, 220 edges, 0 problem(s)`. No change outside the roadmap folder.
- `Suggested.lean`: elaborates, 15 `sorry` warnings and nothing else; single `import Mathlib` plus three Tau Ceti modules, all used; no `set_option`, no sorry'd data.
- One-tactic probe (`simp`, `rfl`, `infer_instance` on each of the 15 theorems, `grind` and `aesop` on 4.1): none closes. `#check`-level comparison of the 20 elaborated signatures with the README: no binder lost, generality equal.
- Duplication by object: no depth-first, low-point, Kosaraju–Sharir, Tarjan or distance-layer bipartiteness statement in the pinned libraries, on main or at any open head.
- The pull request's text agrees with the head (15 theorems, four definitions, one structure, three Tau Ceti imports, new roadmap).

Overlap check: read GraphConnectivityAndFlows (main and its open revision), SpanningTreesAndShortestPaths, GraphColouring; nothing shared (cut vertices, bridges, blocks and ear decompositions stay with GraphConnectivityAndFlows, weighted distances with SpanningTreesAndShortestPaths; the criteria here use only the library predicates).

Source independence: 0 passages compared with 0 sources, because neither text could be read; largest share Erickson, 23 of 31 source mentions; contents not compared with Erickson (text and table of contents unread). No layer is named after a source's chapter, and the order 3.2 → 3.3 → 3.4 and 3.2 → 3.5 is forced by the `*Needs:*` lines.

Research link: the README presents the classical structure theorems behind the component algorithms of Kosaraju–Sharir and Tarjan and the low-point criteria of Hopcroft and Tarjan, after Erickson (2019, Ch. 6), and normal trees after Diestel (2025, §1.5); it rests on the README alone, and names no current research that uses them.

## Not verifiable

- Erickson, *Algorithms*, Chapter 6 (locators of 1.2, 2.1, 2.2, 2.3, 3.1, 3.2, 3.3, 3.4, 3.5): the project's sources service does not accept the cited host and finds no other legal copy; no page was read.
- Diestel, *Graph Theory*, sixth edition, Chapter 1 (locators of 4.1, 4.2, 4.4, 5.1): the preview PDF linked from the author's site was fetched but asks for a password; no page was read.
- The README's claim in 3.1 about how Erickson words the cycle criterion: same reason.
- Sampled targets 1.1, 1.3, 4.3 and 4.6 cite no source; their statements were checked by computation only.

## Source issues

- none

## For the human reviewers

- **Scope.** The two sources are a textbook of algorithms (Erickson 2019, Ch. 6) and Chapter 1 of Diestel; the headline theorems are classical (1970s) and no refereed primary source is listed in the README's References.
- **Licence.** Erickson's chapter is cited from the author's site as CC-BY 4.0 (README, References); the sources service did not classify that host. Diestel's preview PDF is password-protected.
- **Not tested.** Erickson has the largest share of the locators (23 of 31 source mentions); its text and table of contents could not be read, so wording and arrangement were not compared with it, nor with Diestel.
