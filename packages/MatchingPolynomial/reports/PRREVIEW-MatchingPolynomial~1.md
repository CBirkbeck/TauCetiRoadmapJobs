# Review of MatchingPolynomial (pull request #2702 at ff9f411)

**Verdict:** accepted

**Summary.** Accepted: no statement, Check or route in the folder was found false. Every theorem was recomputed on all graphs with at most five vertices and on all 156 graphs with six, every printed value was reproduced, and the locators into Marcus–Spielman–Srivastava and Spielman's notes were read at the text. There are three small corrections (a page range, two neighbouring roadmaps that cannot be found, a hypothesis added to two sources without saying so) and three format notes, none blocking. Godsil's survey, which carries the largest share of the locators, could not be read through the project's sources service, so its locators are unverified; that and the status of the lecture notes are left to the human reviewers.

## C01 — The proof of Spielman's Theorem 26.5.1 is on pp. 26-6 to 26-7, not pp. 26-5 to 26-6

A reader who opens the notes at the pages given in the route of 3.2 (README line 237, "following Spielman's proof of Theorem 26.5.1, pp. 26-5 to 26-6") finds the statement and the proof of Theorem 26.5.2, not the proof that the route follows. In the notes the statement of 26.5.1 is on p. 26-5, its proof starts in the lower half of p. 26-6 and its last displays, including the decomposition of `T − a − ab` that the route needs, are on p. 26-7 (Spielman18L26 lines 241 to 318). Write "pp. 26-6 to 26-7" in the route, and "pp. 26-5 to 26-7" in the References entry for §26.5 (line 470).

## C02 — Two of the three neighbouring roadmaps described in the scope section cannot be found

The scope section (lines 386 to 393) says what SpectralGraphBounds and TuttePolynomialAndArrangements contain ("proves the Alon–Boppana lower bound for `λ₂`", "treats the Tutte, chromatic and flow polynomials"), and the pull request's description repeats it ("are neighbours not on main: the README states how each differs"). Neither name is a folder on main or the roadmap of any open pull request, so a reader cannot check the comparison and cannot tell whether those boundaries bind anyone. MatchingTheory does exist as an open roadmap, and its scope section does list the matching polynomial as outside its scope, as the README says.

The smallest change: keep the MatchingTheory bullet, and for the other two either drop the bullets or state the boundary without naming a roadmap (the sentence already present in the last paragraph of the section does this for general eigenvalue bounds; one clause for deletion–contraction polynomials would do the same). The description's sentence then names MatchingTheory only.

## C03 — 3.2 adds connectedness to two cited statements without saying so

The divisibility target is cited to Marcus–Spielman–Srivastava, Theorem 3.4, p. 5, and Spielman, Theorem 26.5.2, p. 26-5 (README lines 234 to 235). Both state divisibility for every graph and every vertex, with no connectedness hypothesis (MSS13 line 227, Spielman18L26 line 225), and as stated both are false: the README's own Check (an isolated vertex `u` beside an edge, `μ(T) = x`, `μ(G) = x³ − x`) refutes them. A reader comparing the target with these two sources sees a mismatch that the README does not explain, although 4.2 does explain the analogous addition of `d ≥ 2`. Add the same clause here: "stated there without the hypothesis that `G` is connected, which is added here; see the second Check".

The route of 3.2 is already the right repair of Spielman's proof, which applies the inductive hypothesis to `G − a` although that graph may be disconnected (for the path `b a c`, `μ(G − a) = x²` does not divide `μ(T_b(G − a)) = x`); arguing component by component, as the README does, is what makes the induction go through.

## N01 — Time-bound wording

"(on main)", "(a roadmap not on main)", "were verified", "they were not opened" (lines 115, 157, 252, 305, 340, 375 to 391, 453, 476) describe the state of the repository and of the drafting on one day; a reader a year from now cannot tell what still holds. Would read better as timeless statements (the Check says what is true for all graphs with at most seven vertices; the supplier is cited by name and section).

## N02 — Invariance of `μ` under graph isomorphism is used but not listed

The routes of 3.1, 3.2, 4.1 and 4.2 pass `μ` along isomorphisms (a tree and its path tree; `T − u` and a disjoint union of path trees; a graph and the disjoint union of its components), while multiplicativity in 1.1 is stated for `G ⊕g H` on `V ⊕ W` only. One API bullet in 1.1, "isomorphic graphs have the same matching polynomial", would close the gap.

## N03 — A second locator for the vertex recursion

The vertex recursion of 1.2 is cited to Godsil only; Spielman, Lemma 26.4.2, p. 26-5, states it with a proof on p. 26-4 and could be added.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 1.1 definition of `m_k` and `μ` | empty type, `K₁`, `K₂`, `3K₁`, `P₄`, `C₄`, `K₃`, `K_(1,3)`, `K₄`, `C₅`, Petersen | `1`; `x`; `x²−1`; `x³`; `x⁴−3x²+1`; `x⁴−4x²+2`; `x³−3x`; `x⁴−3x²`; `x⁴−6x²+3`; `x⁵−5x³+5x`; Petersen `m = 1,15,75,145,90,6` | agrees with every Check |
| 1.1 wrong-model Checks | `K₂` with arbitrary vertex sets; triangle, all 2-edge subgraphs | `IsMatching` forces verts = support, so `m₀ = 1`; 4 edgeless subgraphs otherwise; 3 two-edge subgraphs, 0 matchings | Checks true and separating |
| 1.1 derivative identity | all labelled graphs, `n ≤ 5`; 156 classes at `n = 6` | `μ′ = Σ_v μ(G − v)` coefficientwise in every case | holds |
| 1.2 vertex recursion (sampled) | every vertex of the same graphs; `n = 1` | both sides equal; `K₁`: `x·1 − 0 = x` | holds |
| 1.2 edge recursion (sampled) | every edge of the same graphs; non-edge | both sides equal; for a non-edge it would read `μ = μ − μ(G−u−v)`, false, so `h` is needed | holds |
| 2.1 signed sum (sampled) | triangle; all graphs above with ≤ 6 edges; empty type | triangle: four signings `x³−3x−2`, four `x³−3x+2`, sum `8x³−24x`; empty: `1 = 2⁰·1` | holds |
| 2.2 forest iff (sampled) | all graphs above; `C₄`, `K₄`, Petersen | equality exactly for acyclic graphs; `C₄`: `x⁴−4x²` vs `+2`; `K₄`: `x⁴−6x²−8x−3`; Petersen charpoly `x¹⁰−15x⁸+75x⁶−24x⁵−165x⁴+120x³+120x²−160x+48` | both directions hold; Check on Petersen true |
| 2.2 converse route | girth `g`, coefficient of `x^(n−g)` | `g`-cycle term: sign `(−1)^(g−1)·(−1)^g = −1`, two directions, so `−2c`; `C₄`: `−2`; Petersen: `−24`, 12 five-cycles | route sound |
| 3.1 `pathTree_isTree`, degree bound (sampled) | every vertex of every graph above; `K₃`, `C₄`, `K₄`, `K₁` | tree in all 6341 cases; path-tree degree ≤ degree of end; sizes 5, 7, 16, 1; max 326 (`K₆`) | holds |
| 3.2 identity (sampled) | same 6341 pairs; isolated vertex + edge | `μ(G−u)μ(T) = μ(G)μ(T−u)` always; disconnected: `(x²−1)x = (x³−x)·1` | holds |
| 3.2 divisibility (sampled) | all connected cases; `K₃`, `C₄`, `K₄`; disconnected control | quotients `x²−1`, `x³−2x`, `x¹²−9x¹⁰+30x⁸−46x⁶+33x⁴−9x²`; control: `x³−x ∤ x` | holds; hypothesis needed |
| 4.1 real roots, interlacing (sampled) | same pairs, multiplicities exact via square-free parts; `P₃`, `3K₂`, `K₂` | `α_(i+1) ≤ βᵢ ≤ αᵢ` in all cases; `3K₂`: `1,1,1,−1,−1,−1` vs `1,1,0,−1,−1`; `K₂`: `−1 ≤ 0 ≤ 1` | holds; indices in range for `i + 1 < n` |
| 4.1 route: removing common roots | count form | interlacing ⇔ `N_α(>t) − N_β(>t) ∈ {0,1}` for all `t`; common factor cancels in the difference | step sound |
| 4.2 root bound (sampled) | all graphs above with `Δ ≥ 2`; all 7-vertex graphs as 6-vertex class plus a vertex; `K₂`, `d = 1` | max ratio `0.9749` at `C₇`; Petersen `2.6314`; `K₄` `2.3344`; `C₅` `1.9021`; `K₂`: roots `±1 > 0` | holds; `d ≥ 2` needed |
| 4.2 row sums | rooted tree, degrees ≤ `d` | non-root: `√(d−1) + (d−1)/√(d−1) = 2√(d−1)`; root: `d/√(d−1) ≤ 2√(d−1)` iff `d ≥ 2` | route sound |
| C03 (Spielman's induction) | path `b a c` | `μ(G−a) = x²`, `μ(T_b(G−a)) = x` | source's step fails; README's route does not use it |

- Source locators checked against the text: 16 (MSS13: §3, Theorems 3.1, 3.2, 3.4, 3.6, Definition 3.3, Appendix A; Spielman18L26: Lemmas 26.2.1, 26.3.1, 26.4.1, Theorems 26.2.2, 26.3.2, 26.5.1, 26.5.2, the two remarks of §26.5); 15 agree, 1 page range corrected (C01).
- Library declarations opened at the pinned Mathlib: 30, each in the file the supplier contracts name (for example `SimpleGraph.Subgraph.IsMatching` at Matching.lean:67, `IsMatching.injOn_edgeSet` :225, `Matrix.IsHermitian.sort_roots_charpoly_eq_eigenvalues₀` Spectrum.lean:174, `splits_charpoly` :189, `eigenvalue_mem_ball` Gershgorin.lean:30, `SimpleGraph.Path.instFintype` Walk/Counting.lean:185, `isAcyclic_iff_subsingleton_path` Acyclic.lean:184). No matching polynomial, matching count, signed adjacency matrix or path tree exists in Mathlib or Tau Ceti at the pins.
- Cross-roadmap citations resolved: 1 supplier (RandomMatrices §1.2 on main, README lines 405 to 420, plans Cauchy interlacing with its principal-minor corollaries); 1 neighbour confirmed (MatchingTheory, open, excludes the matching polynomial at its README line 549); 2 neighbours not found (C02).
- Elaboration of `TauCetiRoadmap/MatchingPolynomial/Suggested.lean`: 10 `sorry` warnings, nothing else; no `set_option`, no sorry'd data, single `import Mathlib`. The 16 elaborated signatures were compared with the README statements: same hypotheses and generality, no binder lost.
- One-tactic probe on a copy (`rfl`, `simp`, `infer_instance`, `simp` with the definitions unfolded, `aesop`): none of the 10 theorems closes. All headline theorems of the README are stated; nothing is padding.
- Dependency check output: `depcheck: 179 roadmaps, 2029 edges, 0 problem(s)`. No change outside the folder.
- Overlap check: read MatchingTheory, SpanningTreesAndShortestPaths, StronglyRegularAndMooreGraphs, GraphConnectivityAndFlows; nothing shared.
- Source independence: 14 passages compared with 2 sources (MSS13, Spielman18L26), none shared; largest share Godsil95, 12 of 28 locators, text not readable, contents not compared; contents compared with Spielman18L26 (bound, definition with signings and trees, properties, path tree): independent.

Research link: the four layers are the inputs (Heilmann–Lieb real-rootedness and root bound, Godsil's path tree, the Godsil–Gutman signed average) that Marcus, Spielman and Srivastava (2015) use to prove the existence of bipartite Ramanujan graphs of all degrees; rests on MSS13 §3, read.

## Not verifiable

- Godsil95 (Godsil, Algebraic matching theory, 1995): the sources service refuses the journal's host (tried the journal URL, the DOI and author–title); its locators (§1 p. 2, Theorem 2.1 (a) to (d), §2 and Theorem 2.2 with the remark after it, p. 3) were not read. The statements cited to it were verified by computation, and all but the edge recursion, the derivative identity, the converse of the forest theorem and the interlacing statement also have a second locator that was read.
- The description's sentence that Godsil's Theorem 2.2 states connectedness: same reason.
- Heilmann–Lieb (1972), Godsil–Gutman (1981, both papers), Godsil (1981): named without locators, not opened.
- The counts of graphs behind the "verified on" Checks (1253, 396, 80, 1167) were not recomputed by enumeration of isomorphism classes with seven vertices; the theorems they report were recomputed as the table says.

## Source issues

- **Error** in MSS13 at Theorem 3.2, p. 5: the source says every graph of maximum degree `d` has all matching roots of absolute value at most `2√(d − 1)`; it should be restricted to `d ≥ 2`, since a single edge has roots `±1`; affects a stated result.
- **Error** in MSS13 at Theorem 3.4, p. 5: the source says the matching polynomial of any graph divides the characteristic polynomial of its path tree at any vertex; it should be for connected graphs (an isolated vertex beside an edge fails); affects a stated result.
- **Error** in Spielman18L26 at Theorem 26.5.2, p. 26-5: the source says divisibility holds for every graph and vertex; it should be for connected graphs, by the same example; affects a stated result.
- **Gap** in Spielman18L26 at the proof of Theorem 26.5.2, p. 26-6: the source applies the inductive hypothesis to the vertex-deleted graph as a whole; it should be applied to each of its components, since that graph may be disconnected; affects the proof.
- **Error** in Spielman18L26 at Theorem 26.2.2, p. 26-2: the source says a tree of maximum degree at most `d` has eigenvalues bounded by `2√(d − 1)`; it should be for `d ≥ 2`, as its own proof uses (one edge has eigenvalues `±1`); affects a stated result.
- **Misprint** in Spielman18L26 at the sentence before Lemma 26.3.1, p. 26-2: the source says the matching polynomial equals the matching polynomial; it should be that the expected characteristic polynomial of a random signing equals it; affects nothing.

## For the human reviewers

- **Not tested.** Godsil95 has the largest share of the locators (12 of 28); the sources service does not classify the journal's host, so the wording and arrangement comparisons were not made against it.
- **Licence.** Spielman18L26 is an unpublished set of lecture notes on its author's Yale page (9 of 28 locators, and the route of 3.2 and 4.2); every result cited to it also has a published attribution in the README.
