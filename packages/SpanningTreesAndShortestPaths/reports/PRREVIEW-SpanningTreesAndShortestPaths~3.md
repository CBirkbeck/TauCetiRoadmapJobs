# Review of SpanningTreesAndShortestPaths (pull request #2512 at 96181f7)

**Verdict:** accepted

**Summary.** Accepted: the folder is unchanged since the previous review, and the pull request's title and description, read against this head, now agree with it; the one small correction of the previous review (the description listing the duality of 1.2 as a target and omitting the two Tau Ceti lemmas) is repaired. No finding and no small correction; one format note, carried over (the edition numbering of Cayley's formula), which does not block. The three points for the human reviewers stand as before.

## N01 — "Theorem 5.39" is the numbering of the 2017 edition; the site named in the References now shows the theorem as 5.40

In 5.2 (line 771) Cayley's formula is cited as "Keller and Trotter, Theorem 5.39", and the References give the 2017 edition with the site `appliedcombinatorics.org`. The locator is right for the edition cited, as the previous review read it in both versions; a reader who follows the site lands one number off. Would "Theorem 5.39 (2017 edition; Theorem 5.40 in the current online text)" do?

## Previous findings

- C01 (previous) — repaired: the description now reads "the symmetric exchange property, neither assuming finiteness, built on the duality between fundamental cycles and cuts, which is cited from Tau Ceti", and "Tau Ceti also supplies the path/edge-deletion duality for acyclic graphs and the weight of a path under a constant weight".
- N01 (previous) — not repaired: 5.2, line 771, still reads "Keller and Trotter, Theorem 5.39, for `V = {1, …, n}`" with no note on the current online numbering; written again as N01, a format note.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.2 exchange criterion, as the description states it (`F − f + uv` a spanning forest iff `f` on the forest path) | triangle a, b, c, F = path a b c, uv = ac, f = ab; star c with leaves x, y, z plus edge xy, f = cz | ab on path: {bc, ac} is a spanning tree; cz off path x c y: triangle x c y and z isolated, not a forest | both sides agree in both instances | none |
| 4.1 Euler's theorem, "allows isolated vertices" | triangle plus an isolated vertex; two disjoint triangles; one vertex, no edge | degrees 2, 2, 2, 0, one positive component, circuit exists; all even, two positive components, no circuit; empty walk Eulerian, right side vacuous | both sides agree | none |
| 5.1 Prüfer correspondence, "`n − 2` vertices, a vertex occurs `deg − 1` times" | n = 2; n = 3, path with centre b; n = 4 | 1 tree, 1 empty sequence, 0 + 1 = 1; code (b): b once = 2 − 1, leaves 0 = 1 − 1, 3 trees = 3¹; 16 = 4² | counts and occurrence law agree | none |
| Description's counts and imports | `Suggested.lean` at this head | 30 `theorem`, 12 definitions (10 `def`, 1 `abbrev`, 1 `inductive`), 30 `sorry` warnings; imports `Mathlib` and `TauCeti.Combinatorics.Network.Walk` | description agrees | none |

The rows for all other statements stand as in the previous review, of `96181f7`: the folder is byte-identical and no statement changed.

- Pull-request text against the head: title and each paragraph of the description read against the README and `Suggested.lean`; no sentence contradicted. The pull request adds the roadmap (not on main; 1370 lines added, no heading or declaration removed), and the description says so.
- Hypotheses named in the description compared with the Lean sections: weak cut and cycle properties and the greedy theorem under `IsOrderedAddMonoid`, strict forms and criteria under `IsOrderedCancelAddMonoid`, duality of 3.3 under `AddCommGroup`, matrices over `MinTropical (WithTop R)`: all as described.
- Library declarations opened at the pin: `TauCeti/Combinatorics/SimpleGraph/Connectivity/EdgeSide.lean` line 45 (before that file's `[Fintype V]`, line 57); `TauCeti/Combinatorics/Quiver/PathWeight.lean` line 38. Both as the README and the description say.
- Cross-roadmap citations resolved on main: GeometricTopology 4.4.5 (weighted matrix-tree identity, its README line 3008); MarkovDecisionProcesses 1.2 (Bellman operators, line 223); GraphConnectivityAndFlows 2.1, 3, 4, 5, 6.2, 7.4, 9 (headings present). 3 of 3 roadmaps resolve.
- Source locators: none changed; no passage of the seeded sample falls in a changed passage.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning (30). All automatic checks pass at this head.
- Dependency check: `depcheck: 200 roadmaps, 2188 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Changes outside the roadmap folder: none.

Overlap check: read GraphConnectivityAndFlows (main), MatroidOptimization, ApproximationGuarantees, HamiltonianCycles (open); nothing shared. MatroidOptimization leaves minimum spanning forests of graphs outside its scope, ApproximationGuarantees leaves Euler's theorem for simple graphs outside its scope, HamiltonianCycles names Euler tours only as a boundary.

Source independence: changed passages only: 0 passages changed in the folder, so none compared; largest share Schrijver2017, 7 of 17 locators; the change adds, removes and reorders no layer, so the contents were not compared again (previous result: independent).

Research link: none stated in the README. Found in other roadmaps' READMEs: the cut property is the input of single-linkage and degree-zero persistence (Carlsson–Vejdemo-Johansson; Dey–Wang, as cited by TopologicalDataAnalysis 4.5), and MatroidOptimization names minimum spanning forests as the forest-matroid case of its greedy theorem.

## Not verifiable

- Tarjan, *Data Structures and Network Algorithms* (1983), credited in 2.5 for the two colouring rules: no locator is given and no legal copy was found; the attribution was not checked (unchanged).

## Source issues

- none

## For the human reviewers

- Scope: all four cited sources are textbooks or lecture notes (Diestel2025, Erickson2019, KellerTrotter2017, Schrijver2017); the README cites no research article, and its statements are standard course material in graph theory and combinatorial optimization.
- Licence: Schrijver2017 is unpublished lecture notes on the author's page with a copyright line and no stated licence; Diestel2025 was read from the author's free preview, whose PDF is protected against text extraction.
- Not tested: the attribution to Tarjan (1983) in 2.5 is in prose only; the pull request says the book was not consulted.
