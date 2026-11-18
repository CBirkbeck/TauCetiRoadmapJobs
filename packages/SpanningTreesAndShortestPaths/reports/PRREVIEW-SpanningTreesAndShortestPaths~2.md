# Review of SpanningTreesAndShortestPaths (pull request #2512 at 96181f7)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired. The duality of 1.2 is now cited from the pinned Tau Ceti with the same statement and hypotheses and is no longer a target, and the repair introduced no new problem; the theorem number in Keller–Trotter and the two format points were also taken up. One small correction (the pull-request description still lists the duality among the things asked for) and one format note (edition numbering of Cayley's formula) remain, neither blocking. The three points for the human reviewers stand as before.

## C01 — The description still lists the duality among the targets and omits the two Tau Ceti lemmas now cited

A reader of the description expects the duality to be proved by this roadmap. Under "What it asks for" it says: "the duality between fundamental cycles and fundamental cuts, the exchange criterion […] and the symmetric exchange property, none of them assuming finiteness". At this head 1.2 (lines 125–127) says the duality "is Tau Ceti's `SimpleGraph.Walk.IsPath.mem_edges_iff_not_reachable_deleteEdges` and is not a target". The "Suppliers and boundaries" paragraph likewise lists what Tau Ceti supplies (directed walks, finiteness of bounded walks, the hop distance) without the two declarations added to the supplier contracts.

A text that would be right: in the first bullet, "the exchange criterion (…) and the symmetric exchange property, neither assuming finiteness, built on the duality between fundamental cycles and cuts, which is cited from Tau Ceti"; and in the suppliers paragraph, add "Tau Ceti also supplies the path/edge-deletion duality for acyclic graphs and the weight of a path under a constant weight".

## N01 — "Theorem 5.39" is the numbering of the 2017 edition; the site named in the References now shows the theorem as 5.40

In 5.2 (line 771) Cayley's formula is cited as "Keller and Trotter, Theorem 5.39", and the References give the 2017 edition with the site `appliedcombinatorics.org`. In the 2017 edition, archived online, the formula is Theorem 5.39 (KellerTrotter2017 line 413, 2017 text). The text that site serves today numbers the figure before it 5.39 and the formula Theorem 5.40 (current text, lines 576 and 582). The locator is right for the edition cited; a reader who follows the site lands one number off. Would "Theorem 5.39 (2017 edition; Theorem 5.40 in the current online text)" do, or the archive address of the 2017 edition in the References?

## Previous findings

- R01 — repaired: "This is Tau Ceti's `SimpleGraph.Walk.IsPath.mem_edges_iff_not_reachable_deleteEdges` and is not a target"; added to the *Needs:* of 1.2, the Layer 1 dependencies, the scope list and "From Tau Ceti" with its file. 1.3 and 2.3 reach it through 1.2.
- C01 (previous) — repaired: 5.2 now reads "Keller and Trotter, Theorem 5.39", the number in the 2017 edition the References cite (see N01 for the current online numbering).
- N01 (previous) — repaired: the partial order on strongly connected components now carries its file, `TauCeti/Combinatorics/Quiver/StronglyConnectedComponent.lean`.
- N02 (previous) — repaired: `Quiver.Path.addWeight_const` is in the *Needs:* of 3.1 and in "From Tau Ceti".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.2 duality, as cited from Tau Ceti | path a b c with f = ab; f = s(a, c), not an edge; u = v with the empty path; pinned signature | ab ∈ edges, a and c separated; not in edges, nothing deleted, still joined; edges empty, u joined to itself; acyclic, path, `e : Sym2 V`, no `Fintype` | README statement equals the pinned one | none |
| 1.2 exchange criterion (route cites the duality) | four-cycle, F = path a b c d, uv = da, f = bc; star c, x, y, z + xy, f = cz | bc on path: a, d separated in F − bc, adding da gives a tree; cz off path: triangle x c y, z isolated | route's use of the cited lemma is in the right direction | none |
| 3.1 agreement with hop distance (new input `Quiver.Path.addWeight_const`) | c = 1 : ℕ on a walk of 3 arrows; empty walk | `3 • 1 = 3` = length; `0 • 1 = 0` | lemma gives weight = length; hypotheses `AddMonoid M` only | none |
| 5.2 Cayley's formula, locator | 2017 edition text; current online text; n = 3, 4 | Theorem 5.39 in 2017 text; Theorem 5.40 today; 3 = 3¹, 16 = 4² | locator right for the cited edition | N01 |

The rows for all other statements stand as in the previous review, of `2857d0c`: the diff changes no statement and `Suggested.lean` is unchanged.

- Source locators read at the text: 1 of 1 changed (Keller–Trotter, Cayley's formula), in two versions of the text; it agrees with the 2017 edition.
- Library declarations opened at the pin: `TauCeti/Combinatorics/SimpleGraph/Connectivity/EdgeSide.lean` line 45 (stated before that file's `[Fintype V]`); `TauCeti/Combinatorics/Quiver/PathWeight.lean` line 38; `TauCeti/Combinatorics/Quiver/StronglyConnectedComponent.lean` line 46. All three are as the README quotes them; `addWeight_const` is not in Mathlib at the pin, so the Tau Ceti attribution is right.
- Cross-roadmap citations: none added or changed.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning (30); the file is byte-identical to the one read before, so the `#check` comparison and the one-tactic probe stand.
- Dependency check: `depcheck: 200 roadmaps, 2183 edges, 0 problem(s)`; no UPWARD or CYCLE line. All automatic checks pass at this head.
- Changes outside the roadmap folder: none.
- Pull-request text against the head: one paragraph out of date (C01); the rest, including the counts of 30 theorems and 12 definitions and the two imports, agrees.

Overlap check: read GraphConnectivityAndFlows (main), MatroidOptimization (open), ApproximationGuarantees and HamiltonianCycles (open, by the lists only: the change touches no object they could share); nothing shared. The duality lemma's owner is Tau Ceti, cited.

Source independence: changed passages only: 1 passage (the 5.2 locator) compared with 1 source (KellerTrotter2017, two versions), none shared; the other added lines are library citations with no source wording. Largest share Schrijver2017, 7 of 17 locators; the diff adds, removes and reorders no layer, so the contents were not compared again (previous result: independent).

Research link: none stated in the README. Found in other roadmaps' READMEs: the cut property is the input of single-linkage and degree-zero persistence (Carlsson–Vejdemo-Johansson; Dey–Wang, as cited by TopologicalDataAnalysis 4.5), and MatroidOptimization names minimum spanning forests as the forest-matroid case of its greedy theorem.

## Not verifiable

- Tarjan, *Data Structures and Network Algorithms* (1983), credited in 2.5 for the two colouring rules: no locator is given and no legal copy was found; the attribution was not checked (unchanged).

## Source issues

- none

## For the human reviewers

- Scope: all four cited sources are textbooks or lecture notes (Diestel2025, Erickson2019, KellerTrotter2017, Schrijver2017); the README cites no research article, and its statements are standard course material in graph theory and combinatorial optimization.
- Licence: Schrijver2017 is unpublished lecture notes on the author's page with a copyright line and no stated licence; Diestel2025 was read from the author's free preview, whose PDF is protected against text extraction.
- Not tested: the attribution to Tarjan (1983) in 2.5 is in prose only; the pull request says the book was not consulted.
