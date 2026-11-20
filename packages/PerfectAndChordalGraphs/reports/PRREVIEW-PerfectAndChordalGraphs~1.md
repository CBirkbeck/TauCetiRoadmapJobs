# Review of PerfectAndChordalGraphs (pull request #2701 at b85bfdd)

**Verdict:** accepted

**Summary.** Accepted: no statement, Check or route sentence was found false, and every statement was recomputed on degenerate and infinite instances (in particular the separator theorem without finiteness, whose constructed separator is minimal on any graph). All thirteen locators into Vandenberghe–Andersen agree with the text; the locators into Diestel's chapter could not be checked against its text, because the preview file cannot be opened for reading here, and only the section's page range was confirmed from the contents page. There is one small correction and two format notes, none blocking. For the humans: the most-cited source was not read, and the subject is classical (1950–1972) textbook material.

## C01 — The overview says GraphColouring "leaves perfect graphs to this one"; at its head GraphColouring only lists perfect graphs as not treated

A reader of the overview (line 32–33) would expect GraphColouring to name this roadmap as the owner of perfect graphs. Its scope paragraph ("Not treated here: …, perfect graphs, …", line 525 of `TauCetiRoadmap/GraphColouring/README.md` at its open head) names no roadmap. The Scope section here already says it accurately ("lists perfect graphs outside its scope"); the overview could say the same.

## N01 — "an open roadmap" and "(an open roadmap, not on main)" date the text

The overview (line 32) and the Scope section (line 484) describe GraphColouring by its state on the day of writing; once it merges the sentences are out of date. Naming the roadmap and what it proves is enough.

## N02 — Several Checks report random samples, which a reader cannot recompute

The Checks of 1.2, 3.2, 3.3 and 4.3 include "a random sample of 800 graphs with seven vertices", "2000 random strict orders", "4000 random families … and 5000 more". The exhaustive parts of the same Checks (all graphs on at most six vertices, all strict orders on at most four points) are statable facts; the sampled parts describe an experiment and would be better left to the pull request description, where they already are.

## Questions for the author

- 4.2 attributes its route to "Diestel, proof of Theorem 5.5.4, p. 143". The route written here is direct: it replicates each vertex once for every maximum independent set containing it and reads the transversal clique off a maximum clique of the result (I checked this argument and it is correct). Does the cited proof proceed this way, or by contradiction with one independent set chosen per clique? If the latter, "after Diestel" or "a variant of" would be the accurate attribution. I could not open the chapter's text to compare.
- The Scope section says Diestel derives the perfection of complements of bipartite graphs from Kőnig's theorem, and 3.1–3.3 and 4.1 cite Exercises 41, 43, 44 and 47 on p. 151. Could you confirm these numbers against the June 2024 chapter file? The same obstacle stopped me.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 definitions | C₄; diamond; path 0 1 2 ordered 1,0,2; 4-cycle with pendants; a = b, a ~ b | C₄ induced in itself; diamond's only nonadjacent pair 0,3 has separator {1,2}; later neighbours of 1 are 0,2, nonadjacent; no separator when a = b or adjacent | all Checks true; "later" vs "earlier" told apart by 1,0,2 | none |
| 1.2 Dirac separator theorem, no finiteness | path on ℤ, a=0, b=2; two isolated vertices; C₄ with pendants; general infinite graph | N(0)={−1,1}, D={2,3,…}, T={1}; ∅ minimal and a clique; {1,3} minimal 0–2 separator, not a clique; T∩C = both cycle-neighbours of a | T is a minimal separator on any graph; both directions hold | none |
| 1.3 two nonadjacent simplicial vertices | triangle; empty type; one vertex; two isolated vertices; path on ℤ; diamond | G=⊤ in first three; both isolated vertices simplicial, G≠⊤; ℤ-path: every vertex has two nonadjacent neighbours; diamond: 0 and 3 | hypotheses `G ≠ ⊤` and `[Finite V]` both needed and present | none |
| 1.4 Fulkerson–Gross | empty type (n=0); C₄; path | empty σ is vacuously an ordering; first vertex of C₄ has two nonadjacent later neighbours; 0,1,2 works | iff holds; ∃ n forces n = card V | none |
| 2.1 `IsPerfect` | s=∅; C₅; C₅ ⊔ K₃; graphs on ≤5 vertices | χ=0=ω in ℕ∞; χ=3, ω=2; χ=ω=3 but induced C₅; 1024 − 4!/2 = 1012 | definition tests induced subgraphs; counts right | none |
| 2.2 chordal ⇒ perfect | C₄; complement of C₆ | C₄ perfect, not chordal; prism: induced 4-cycle 0,2,5,3 (0–5 and 2–3 nonadjacent), perfect | converse fails as stated; greedy bound ω−1 later neighbours correct | none |
| 3.1 `IsComparabilityGraph` | bipartite; C₅; r = G.Adj | X→Y orientation vacuously transitive; odd triangle-free cycle has no alternating orientation; `fromRel G.Adj = G` | transitivity is the restricting clause | none |
| 3.2 comparability graphs and complements perfect | K₂,₃ and complement; Dilworth contract | χ=ω=2; triangle ⊔ edge χ=ω=3; #A = #C chains gives χ(Gᶜ[s]) ≤ ω(Gᶜ[s]) | supplier statement on main gives exactly what the route uses | none |
| 3.3 interval graphs chordal, complement comparability | [0,2],[1,3],[2,4]; open versions; {0,1},{1,2},{2,3},{3,0}; empty sets; route cases p ≤ t, t < p | triangle; path; C₄; empty set adjacent to all in complement; chord v₂vₖ resp. v₂vⱼ with j ≥ 4 since I v₁ ∩ I v₃ = ∅ | route correct; empty sets handled | none |
| 4.1 replication lemma | one vertex; C₅; the six-vertex graph of the Check, replicate 1 | edge; χ=ω=3 containing C₅; before: χ=ω=3 (4=A,3=B,2=C,0=C,1=A,5=B); after: 1,1′∈{A,B} force 5=C=colour of 0, so χ=4, ω=3 | Check true; `fromRel` body gives none ~ some v iff v = x or x ~ v | none |
| 4.2 perfect graph theorem | C₇; C₅; route on α(H)=0 | χ=3, ω=2; complement χ=⌈7/2⌉=4, ω=3; H′ has mα vertices, α(H′) ≤ α, so χ=m=ω; α drops by 1 per clique | route proves χ(Hᶜ) ≤ ω(Hᶜ); empty H trivial | none |
| 4.3 Lovász's characterization | C₅; s=∅; J − I of size 1 | 2·2=4<5; 0 ≤ 0; J−I singular only at size 1, i.e. αω=0, excluded for a minimal imperfect graph | rank bound αω+1 ≤ #s valid | none |

- Source locators checked against the text: 13 of 13 into VandenbergheAndersen2014 confirmed (§3.1 line 573, §3.3 line 731, §3.4 line 870, Theorem 3.1 line 796, Theorem 3.3 line 905, §4.1 lines 1234 and 1304, §4.2 line 1313, Theorem 4.1 line 1320, §5.2 line 2065, §5.3 line 2102); Diestel: only "§5.5, pp. 139–145" from the contents page.
- Library declarations opened at the pin: 22, all present where the contracts say (for example `SimpleGraph.IsIndContained` at `Mathlib/Combinatorics/SimpleGraph/Copy.lean:408`, `.trans` at `:437`, `cliqueNum_compl` at `Clique.lean:1046`, `cliqueNum_le_chromaticNumber` at `Coloring/Vertex.lean:553`, `Minimal` at `Order/Defs/Unbundled.lean:240`, `Matrix.rank_le_width` at `LinearAlgebra/Matrix/Rank.lean:177`).
- Duplication by object: no chordal, perfect, comparability or interval graphs, perfect elimination orderings or simplicial vertices of graphs in the pinned Mathlib or Tau Ceti, nor in any roadmap on main or at an open head.
- Cross-roadmap citations resolved: QuiverRepresentationsPartII §4.3 `finite_dilworth` (on main, README line 647, `Suggested.lean` line 187; no nonemptiness hypothesis, as the contract says); GraphConnectivityAndFlows §1.2, §6.7 and its scope boundaries (on main); GraphColouring §1.2 and scope (open head).
- Dependency check: `depcheck: 182 roadmaps, 2069 edges, 0 problem(s)`; no UPWARD or CYCLE line. The only supplier roadmap is on main.
- Elaboration: `Suggested.lean` elaborates with ten `sorry` warnings and nothing else; no `set_option`, no sorry'd data, single `import Mathlib`. `#check @name` types compared with the README for all 19 declarations: generality agrees, no binder lost.
- One-tactic probe (`simp`, `rfl`, `exact?`) on all ten theorems: none closes (six fall through, four exhaust the heartbeat limit inside the probe tactics). All ten README headlines are stated; none is padding.
- Pull request text: the counts (10 theorems, 9 definitions), the supplier list and the scope statements agree with the head; it adds a new roadmap and changes nothing outside the folder.

Overlap check: read GraphColouring, RamseyNumbers, HamiltonianCycles, GraphicalModelsAndConditionalIndependence (open) and GraphConnectivityAndFlows (main); nothing shared. GraphConnectivityAndFlows owns terminal-excluding vertex separators on multigraphs, and `IsSeparator` here is that notion on simple graphs, kept only to state 1.2; GraphicalModelsAndConditionalIndependence has a separator of two vertex sets that may meet them, a different predicate, and puts decomposable graphs outside its scope.

Source independence: 8 passages compared with 1 source (VandenbergheAndersen2014: definitions of 1.1, the separator and ordering conventions, the routes of 1.2, 1.3, 1.4, 2.2 and 3.3), none shared beyond standard phrases; largest share Diestel, 18 of 28 locators, text not readable; contents compared with Diestel's contents page and with VandenbergheAndersen2014: independent (1.2–1.4 follow §3.3, §3.4, §4.2 only as the dependency lines 1.3 ← 1.2 and 1.4 ← 1.3 force; Layers 2–4 map to no run of either).

Research link: Layer 1 is the graph theory on which Vandenberghe–Andersen (2014) build sparse-matrix and semidefinite methods (source, §§3–4, read); Layer 4 is Lovász's theorem (1972), which the strong perfect graph theorem of Chudnovsky–Robertson–Seymour–Thomas (2006) refines (README, Scope section).

## Not verifiable

- Diestel, *Graph Theory*, sixth edition, Chapter 5 preview: the file on the author's page was fetched but cannot be opened for reading with the tools here (it is encrypted); Propositions 5.5.1–5.5.2, Theorems 5.5.3, 5.5.4, 5.5.6, Lemma 5.5.5 with their pages, and Exercises 41, 43, 44, 47 on p. 151, were not checked. Only the range of §5.5 (pp. 139–145) was confirmed, from the contents page.
- The primary papers (Dirac 1961, Fulkerson–Gross 1965, Dilworth 1950, Mirsky 1971, Lovász 1972, Gasparian 1996, Gilmore–Hoffman 1964): the README gives no locator into them, and none was opened.

Automatic checks set aside as false positives: no check failed; two leads were discarded: the signature listing read the words "theorem of Dirac" in the module docstring as a declaration named `of`, and three of this roadmap's own declared names were listed as found nowhere in the libraries.

## Source issues

- none

## For the human reviewers

- **Not tested.** Diestel's Chapter 5 carries the largest share of locators (18 of 28); its text could not be read, so wording was not compared with it, and arrangement only against its contents page.
- **Scope.** The headline theorems date from 1950–1972 and are standard textbook material; four citations in Layers 3 and 4 are to textbook exercises (Diestel, Chapter 5, Exercises 41, 43, 44, 47), and the strong perfect graph theorem is excluded.
