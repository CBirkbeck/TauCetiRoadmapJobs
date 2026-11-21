# Review of IntegerPolyhedraAndTotalUnimodularity (pull request #2956 at 653449f)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement, route and Check was recomputed (degenerate shapes, both directions of each equivalence, and the enumeration counts of 1.2, 2.1, 2.2 and 2.3), and nothing false was found; `Suggested.lean` states all ten headline theorems and elaborates. There are two small corrections (2.3 has no locator; 2.1 is stated only for rows indexed by `Fin r`) and three format notes, none blocking. The one source, Schrijver's lecture notes, could not be read through the legal-sources service, so no locator, wording or arrangement was compared with the text: that is left to the human reviewers.

## C01 — Ghouila-Houri's characterisation (2.3) is the only target without a locator

A reader who wants to compare the statement of 2.3 with the literature has nothing to open: the text gives the name and then says "no source with a proof was opened, and the route below is complete. (Proved here.)" (2.3, lines 247–248; repeated in References, lines 614–615). The statement and the route are correct: I checked both directions of the route line by line and the equivalence on all 19683 matrices of size 3 × 3 with entries in `{−1, 0, 1}`. So this touches no result, only its attribution.

The smallest change is a locator in place of the sentence about what was opened. Two candidates, neither of which I opened, so they are offered and not required: A. Ghouila-Houri, *Caractérisation des matrices totalement unimodulaires*, C. R. Acad. Sci. Paris 254 (1962), 1192–1194, and the list of characterisations in Schrijver, *Theory of Linear and Integer Programming* (1986), §19.3.

## C02 — The equality form 2.1 is stated only for rows indexed by `Fin r`, unlike every other polyhedral statement

1.1, 1.2, 1.3 and 2.2 take the rows in an arbitrary finite type `m`; 2.1 takes `A : Matrix (Fin r) ι ℤ`, because it reuses `realFibre` from TensorProductCombinatorics §1.5 (`Suggested.lean`, lines 66 and 74). The roadmap's own equality-form polyhedron, the perfect matching set of 4.2 (`{x ≥ 0 | A x = 1}` with rows the vertex type `V`), is therefore not an instance of 2.1 without reindexing the rows, and the same holds for any consumer whose rows are vertices or edges.

Nothing is false. Two ways to remove the mismatch, as the author prefers: state 2.1 for a finite row type `m` with rank `Fintype.card m` and the polyhedron written out as in 2.2, remarking that for `m = Fin r` it is `realFibre A b`; or keep 2.1 as it is and say in one sentence that general finite row types are reached through `Matrix.reindex`.

## N01 — Several Checks report machine enumerations

The Checks "on all 8612 matrices …", "11350 matrices", "the 75921 matrices … whose position in the lexicographic order … is a multiple of 7", "1099 labelled simple graphs", "427 bipartite graphs", "35523 matrices", "511 nonempty sets" cannot be recomputed by a reader by hand and the last clause of 2.3's Check describes a sampling procedure. I recomputed those of 1.2, 2.1 and 2.2 and the 3 × 3 case of 2.3 and they are right. They would sit better in the pull request description (where they already are); the small hand-checkable Checks next to them do the testing.

## N02 — Sentences about how the text was written

"no source with a proof was opened" (2.3), "(Proved here.)" (2.3), "The original papers were not consulted" (References) and "is proved here; Schrijver uses … without proof" (3.2) describe the drafting, not the mathematics. A locator or a plain "the route is self-contained" says the same timelessly.

## N03 — The arrow family is called `Hom` in the file the contracts name

The supplier contracts cite "the arrow families `Q : V → V → Type*` of `TauCeti/Combinatorics/Network/Basic.lean`"; in that file the family is `Hom : V → V → Type v` (line 29), and `Q` with `TauCeti.excessAt`, whose sign the directed-multigraph Example compares with, is in `TauCeti/Combinatorics/Network/Excess.lean` (line 323). Name that file as well.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 vertex criterion | no rows; no columns with `b = −1`; triangle `x ≥ 0, x₁+x₂ ≤ 1` at `(0,0)` and `(1/2,1/2)` | no rows: vertex iff `n` empty, both sides; empty polyhedron: RHS true, LHS false, excluded by `hz`; `(1/2,1/2)`: `c=(1,−1)` annihilated | true; `hz` in scope | none |
| 1.2 integrality of vertices | `(1 1;1 −1)` with `x ≥ 0`, `b=(1,0,0,0)`; `A=(1)`, `b=1/2`; all TU 0/±1 matrices up to 3×3 | vertices `(0,0),(0,1),(1/2,1/2)`; `(1,0)` infeasible; TU counts 73+561+561+10155 = 11350 | true; count agrees | none |
| 1.3 integral optima | `A=(2)`,`b=1`; `A=(1 −1)`; rows `x ≤ −1`, `−x ≤ 0`; unit square | max `1/2` only at `1/2`; unbounded; `P=∅` so `hx₀` needed; `(1,1/2)` maximiser | true; route's box `Q` gives value ≥ `c·x₀` | none |
| 2.1 equality form | `r=0`; `(2 0;2 0)`, `b=(1,1)`; `(1 2)`, `b=1`; 4452 matrices | `r=0`: empty minor 1, vertex 0; rank 1, minors 0, vertex `(1/2,0)`; vertex `(0,1/2)`; 4123 of full row rank, 0 mismatches | true; rank hypothesis needed and present | C02 |
| 2.2 Hoffman–Kruskal | `(1 2;0 1)`; `(2 0)`; no rows; no columns; 8612 and 19683 matrices | without `x ≥ 0`: vertex `(b₁−2b₂,b₂)` integral; with it `(0,1/2)`; `(1/2,0)`; every non-TU matrix has a fractional vertex for some listed `b` | true both directions | none |
| 2.3 Ghouila-Houri | `R=∅`; `R={i}`; triangle rows; all 3×3 matrices over `{−1,0,1}` | empty sum 0; entry 2 fails; signs need `ε₁=−ε₂=ε₃=−ε₁`; 0 mismatches of 19683; route: `ε=1−2y` gives `d−2yᵀM ∈ {0,±1}`, converse gives `z=±ρ/det B` | true; route complete | C01 |
| 3.1 one `1`, one `−1` per column | triangle 0/1 rows; negated; column count | det `2`, `−2`; `1+2k+k(k−1)=k²+k+1`: 3, 49, 2197, 194481; 49+2197+28561+9261+194481 = 234549 | true | none |
| 3.2 bipartite iff incidence TU | triangle, 5-cycle, edgeless graph, empty `V`, `ZMod 3` | det `1+(−1)^(k+1)=2` for odd `k`; zero matrix TU and 2-colourable; over `ZMod 3` every element is a sign | true, infinite `V` included | none |
| 4.1 matching polytope | triangle; empty graph; empty `V`; path of 3 edges | triangle set has 5 vertices incl. `(1/2,1/2,1/2)`, hull has coordinate sum ≤ 1 < 3/2; both sides one point; 5 matching vectors | true; bipartite hypothesis needed | none |
| 4.2 perfect matching polytope | isolated vertex; triangle; empty `V`; `K_{n,n}` | both sides empty; set `{(1/2,1/2,1/2)}` vs empty hull; `⊥` is spanning matching, both sides one point; doubly stochastic | true | none |
| `realFibre` (definition) | compared with TensorProductCombinatorics `Suggested.lean` line 135 | body identical character for character; different namespace, so no shared qualified name | owner is TensorProductCombinatorics | none |
| Layer 3 Examples (directed, interval) | sign against `TauCeti.excessAt`; rows `(1,0,1),(1,1,0),(0,1,1)`; counts | `excessAt` is incoming − outgoing, incidence is outgoing − incoming; det 2; 343+2401+1331+14641+16807 = 35523; `2⁹−1 = 511` | true | N03 |

- Source locators checked against the text: 0 of 17 (the notes could not be read; see below).
- Library declarations opened at the pins: 33 (Mathlib `TotallyUnimodular.lean` 39–204, `Extreme.lean` 170 and 259, `KreinMilman.lean` 64 and 96, `Birkhoff.lean` 146–177, `IncMatrix.lean` 55–68, `Matching.lean` 67 and 236, `Bipartite.lean` 288, `Coloring/Constructions.lean` 175, `NonsingularInverse.lean` 170, determinant lemmas; Tau Ceti `Polyhedron/Basic.lean` 56, `Network/Excess.lean` 323); all present with the stated hypotheses.
- Cross-roadmap citations resolved: 13 (TensorProductCombinatorics §1.5, §2.6 and GraphConnectivityAndFlows §3.1, §6.7, §8.2, §8.7 on main; MatchingTheory 1.3, MinimumCostFlowsAndWeightedBipartiteMatching 1.4, 2.1, 2.2, ApproximationGuarantees 2.2, ConvexAnalysisAndDuality §1.3, §1.4, §5.3 at their open heads); all exist with the cited subject. All but TensorProductCombinatorics are cited as scope boundaries, not suppliers.
- Duplication by object: no vertex criterion, integrality theorem, Ghouila-Houri or matching polytope in the pinned Mathlib or Tau Ceti, on main or at any open head searched; the column criterion of 3.1 appears in TensorProductCombinatorics §2.6 only as a step of a route.
- Overlap check: read MinimumCostFlowsAndWeightedBipartiteMatching, MatchingTheory, ApproximationGuarantees, GraphConnectivityAndFlows, TensorProductCombinatorics (and ConvexAnalysisAndDuality); searched MatchingPolynomial, PeriodicNonnegativeMatrices and DimerModelsAndLozengeTilings for the objects; shared: `realFibre` and the type-A interval matrix, both owned by TensorProductCombinatorics and cited as such; nothing else shared.
- Dependency check: `depcheck: 170 roadmaps, 1984 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning (10 theorems, 1 definition with a real body, single `import Mathlib`, no `set_option`). One-tactic probe (`rfl`, `simp`, `simp_all`, `infer_instance`): none of the 10 closes. Elaborated types compared with the README statements: all agree, no binder lost. Headlines: all ten README results are stated; none is unstatable.
- Pull request text: title and description agree with the head (new roadmap, 10 theorems and 1 definition, suppliers as stated); no change outside the folder.

Source independence: 0 passages compared with 1 source, because its text could not be read; largest share Schrijver's lecture notes, 17 of 17 locators; contents not compared (table of contents not read).

Research link: 2.1 states the integrality of basic feasible solutions that TensorProductCombinatorics §1.5 uses for vector partition functions; the results are those of Hoffman–Kruskal (1956), Veinott–Dantzig (1968) and Ghouila-Houri as the README's References attribute them. Rests on the README only.

## Not verifiable

- All sampled locators (1.1 Theorem 2.2 p. 26; 1.2 Theorem 8.1; 1.3 Corollary 8.1a; 2.1 Theorem 8.2; 2.2 Corollary 8.2a; 3.1 Theorem 8.4 and its proof; 3.2 Theorem 8.3; 4.1 and 4.2 Corollaries 8.3d–e), and the further ones (formula (44), Corollary 8.4c, Corollaries 8.1b, 8.3a–c, 8.4a–b): the sources service did not accept the address the README gives as an author's page and found no other legal copy, so the notes were not opened. The mathematics of each statement was checked independently.
- 2.3: no source is cited, so there was nothing to check a locator against.
- The README's remarks on how its statements differ from the source's (vertex form against integer polyhedra in 2.2, "the proof treats exactly this class" in 3.1, finite against infinite graphs in 3.2): same reason.

## Source issues

- none

## For the human reviewers

- **Not tested.** All 17 locators point to Schrijver, *A Course in Combinatorial Optimization* (README References). Its text and table of contents could not be read, so wording and arrangement were not compared with it.
- **Licence.** The README gives the notes at `homepages.cwi.nl/~lex/files/dict.pdf`, described as the author's page; the sources service could not classify that host as an author's page.
- **Scope.** The only source is a set of unpublished lecture notes; the theorems are classical (1956–1968) and textbook-level. The README names one consumer, TensorProductCombinatorics §1.5, and no later research use.
