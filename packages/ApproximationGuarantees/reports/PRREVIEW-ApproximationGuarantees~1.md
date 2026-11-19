# Review of ApproximationGuarantees (pull request #2523 at 63e5c30)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement, Check and proof route was recomputed on degenerate and adversarial instances (empty systems, `d = 0`, `f = 0`, `m = 1`, one-point and two-point spaces, negative costs and weights, infinite graphs where no finiteness is assumed) and none failed; the 20 source locators were read at the cited pages and all support the statements as written; `Suggested.lean` elaborates with `sorry` as its only warning and no theorem closes under a one-tactic probe. There are one small correction (the scope section does not say how the cut weight of 2.4 differs from the cut functions of two neighbouring roadmaps) and one format note, neither blocking. Two facts about scope and sources are left for the human reviewers.

## C01 — The scope section does not say how the cut weight of 2.4 differs from the cut functions that GraphConnectivityAndFlows and QuantumOptimization define

A reader who knows the neighbouring roadmaps finds three definitions of "the weight of a cut" and no sentence relating this one to the other two. GraphConnectivityAndFlows §1.2 (on main, `TauCetiRoadmap/GraphConnectivityAndFlows/README.md` lines 118 and 268–276) owns the cut function of a nonnegative pair capacity `c : Sym2 V → K` together with its multigraph form; the open roadmap QuantumOptimization §1.3 defines `cutWeight w x` for a real matrix `w` on ordered pairs and a bit vector `x`, and its own scope says in one clause how that extends the function of GraphConnectivityAndFlows. Section 2.4 here defines `cutWeight G c S` for a simple graph, signed real weights on `Sym2 V` and a set `S` (`Suggested.lean` line 127); the scope section, under "Left to other roadmaps", names only §§6.7–6.8 of GraphConnectivityAndFlows. The three carriers differ and no theorem is stated twice, so nothing needs to move.

The smallest change is one bullet under "Left to other roadmaps": GraphConnectivityAndFlows §1.2 owns cuts of multigraphs and of nonnegative pair capacities, with minimum cuts in its §§3–4; the cut weight of 2.4 restricts a signed `c : Sym2 V → ℝ` to the edges of a simple graph, agrees with the pair-capacity cut function when `c ≥ 0` vanishes off the edges, and is used only for the local bound. A clause naming QuantumOptimization §1.3 (matrix weights on ordered pairs; the two agree for a symmetric matrix supported on the edges) would complete it.

## N01 — The prefix bound of 4.4 is stated in `Suggested.lean` on bare functions and names no object of the roadmap

`sum_value_le_sum_prefix` (`Suggested.lean` line 258) quantifies over `v w : Fin n → ℝ` only. It is a true exchange inequality and does not close in one tactic, so it is not padding; its docstring could say that it is the comparison behind the knapsack corollary of 4.4, so that a reader of the file alone sees why it stands among the acceptance statements.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 weak duality | sets `{1,2},{2,3},{1,3}`, `x = 1/2`, `y = 1/2`; all sets empty | `∑y = 3/2 ≤ ∑c·x = 3/2`; empty: `0 ≤ ∑c·x` for `c ≥ 0` via `y = 0` | holds | none |
| 1.2 `IsGreedy` definition | `A={1}` cost −1, `B={2}` cost 1; set with gain 0 and `c<0` | `[A]`: `−1·1 ≤ 1·1` true; `[A,B]` at `j=A`: `1·0 ≤ −1·1` false | as README says | none |
| 1.2 harmonic bound | `d=0`; README's `S₀,S₁,S₂`; tightness `n=3`; one set cost −1, `x=100` | `d=0`: `l=[]`, `0 ≤ 0`; `3 ≤ H₄·2 = 25/6`; `11/6 = H₃·1`; `−1 ≤ −100` false | holds; sign needed | none |
| 1.2 route | fixed `S j`, `i`-th element from the end | price `= c j₀/gain j₀ ≤ c j/gain j ≤ c j/i`; sum `≤ H_{\|S j\|}·c j` | sound | none |
| 1.3 rounding | triangle system `f=2`, `x=1/2`; all empty `f=0`; one set cost −1, `f=1`, `x=2` | `3 = 2·(3/2)`; `0 ≤ 0`, none selected; `−1 ≤ −2` false | holds; sign needed | none |
| 1.4 pricing | `e₁∈A∩B`, `e₂∈B∩C`, `y=(1,0)`; overpaid `B`; price −1 | tight cost `2 ≤ 2·1`; `10 ≤ 2·1` false; `−1 ≤ −5` false | holds without sign on `c` (`c j ≥ ∑y ≥ 0`) | none |
| 2.1 `maximal_isMatching_iff` | `⊥` on edgeless and on one-edge graph; path `abcd` `{bc}`; both directions by proof | `⊥` maximal ⇔ no edge ⇔ `∅` cover; `{b,c}` covers; larger `M'` forces an edge with both ends unmatched | iff holds, no finiteness | none |
| 2.1 `encard_edgeSet_le_vertexCoverNum` | triangle; star; `K_{n,n}`; infinite matching | `1 ≤ 2`; `1 ≤ 1`; `n ≤ n`; `⊤ ≤ ⊤` by injection edge ↦ covered end | holds | none |
| 2.2 half-integrality | triangle, single edge, edgeless graph; infinite graph with slacks tending to 0 | vertices `(½,½,½)`, perms of `(1,1,0)`; `(1,0),(0,1)`; `0`; `\|d u + d v\| ≤ L·slack` with `L` Lipschitz constant of `t(1−t)(2t−1)`, and `≤ x v < slack` if `x u > 1` | holds for all graphs | none |
| 2.2 attainment | one vertex, `w = −1`; triangle unit weights; `V` empty | unbounded below; minimum `3/2` at `(½,½,½)`; empty function | holds for `w ≥ 0`, finite | none |
| 2.3 persistency | star `K_{1,3}`; edge with `x=(7/10,3/10)`; `x=(0,1)`, `w=(1,2)`; `w v = 0` with `x v = 5` | LP value `3−2c`, minimum 1 at centre; `C={u}`; `{u}` least cover, `v ∉ {u}`; `C=(D∖R)∪P` still has `w(C) ≤ w(D)` | holds for any real `w`; minimality needed | none |
| 2.4 local cut bound | 4-cycle `S={a,b}`; triangle `S=∅`, `S={a}`; edge of weight −1 | `4 ≤ 2·2`; flip gains 2 so not local; `3 ≤ 2·2`; `−1 ≤ 0` | holds, either sign | none |
| 3.1 `tourLength` | `[]`, `[a]`, `[a,b]`, `[a,b,c]` unit triangle; walk support `[a,b,a]` | `0`, `0`, `2·dist a b`, `3`; `2·dist a b + dist a a` | matches bullets | none |
| 3.2 shortcutting | `[0,2,1,3] ⊇ [0,2,3]`; `[a,b] ⊇ [a]`; drop first entry of `[a,b,c]` | `6 ≤ 8`; `0 ≤ 2d`; `2·d(b,c) ≤ d(a,b)+d(b,c)+d(c,a)` | holds | none |
| 3.3 tree below tour | one point; points `0..3`; empty type | tree with no edge `0 ≤ 0`; path `3 ≤ 6`; no tree exists | holds; `Nonempty` needed | none |
| 3.3 matching below tour | `U=∅`; `U={0,3}`; `U` all four points; `\|U\|=2` degenerate alternation | `0 ≤ t`; `2·3 ≤ 6`; `2·2 ≤ 6`; both colour classes equal `{ab}`, `2d ≤ 2d` | holds | none |
| 3.4 doubling | one point; star with centre at distance 1, leaves at 2 | `0 ≤ 0`; tour `6 = 2·3` | holds | none |
| 3.4 tree plus matching | one point; two points; path `0..3` with `M={03}` | `0 ≤ 0+0`; `2 ≤ 1+1`; `6 ≤ 3+3` | holds | none |
| 3.5 farthest-first | `l=[]`; `[0]` in `{0,1,2}`, `C={1}`; `[0,1]`; repeated entries, `r=0`; `r<0` | hypothesis forces `V` empty; `2 ≤ 2·1`; `x=2`: `2 ≤ 1` false so not farthest-first; pigeonhole on indices still applies; vacuous | holds, no finiteness | none |
| 4.1 definitions | `p=(1,1,2)`, `m=2`; `n=0` | list schedules give 3, `{1,1},{2}` gives 2 and is not one; makespan 0 | as README says | none |
| 4.2 `makespan_le` | `m=1`; tightness `m=1..5` over every tie-break; `p=(−2,−2)` | factor 1; makespan `{2m−1}` against `m`; `0 ≤ −3` false | holds; sign needed | none |
| 4.2 `makespan_le_of_antitone` | tightness `m=1..5` over every tie-break; 20000 random sorted instances with every job above a third of the optimum | makespans `{3},{7},{11},{15},{19}` against `3,6,9,12,15`; every list schedule optimal, 0 exceptions | holds; route sound | none |
| 4.3 `succ_le_two_mul_of_adjacent_load` | `k=1`; `k=0`; six items of size 1/3; sizes `−1, 5/2, −1`; `ι` empty | `2 ≤ 2k'` from `k' ≥ 1`; no `f` exists; `4 ≤ 4`; `4 ≤ 2` false with an overfull bin; `2 ≤ 0` false | holds; `Nonempty` and `hf` needed | none |
| 4.4 prefix dominance | `(3,1),(4,2),(5,3)`, `W=4`; `(1,0),(5,0)`; `(1,2),(0,0),(5,1)`; `(−2,1)`; `(1,−2)`, `k=0` | `8 ≤ 12`; equal weights `5 ≤ 1` false; consecutive-only order `5 ≤ 1` false; `0 ≤ −2` false; `1 ≤ 0` false | holds as stated; each hypothesis needed | none |
| Headlines in `Suggested.lean` | harmonic bound; half-integrality; persistency; tree and matching bounds, doubling, tree plus matching; both list-schedule bounds | each README headline has its declaration with the same hypotheses; none is named as not statable and none needs to be | complete | none |
| C01 cut weights | GraphConnectivityAndFlows §1.2, QuantumOptimization §1.3, this 2.4 | nonnegative `Sym2 V → K` and multigraphs; matrix on ordered pairs with bit vector; graph, signed `Sym2 V → ℝ`, set | three carriers, relation unstated here | C01 |

- Source locators checked against the text: 20 of 20 (13 in Williamson–Shmoys at pp. 19–26, 32, 39, 41–42, 44–47, 73–74, 77, 162; 6 in Erickson §J.5, §J.6, Theorems J.5–J.7; 1 in Schrijver §3.1 (3), p. 39).
- Library declarations opened at the pin: 38, all present in the files the supplier contracts name (for example `SimpleGraph.IsVertexCover` at `Mathlib/Combinatorics/SimpleGraph/VertexCover.lean:35`, `vertexCoverNum` at line 92, `IsMatching.strictMonoOn_edgeSet` at `Matching.lean:229`, `IsCompact.extremePoints_nonempty` at `Analysis/Convex/KreinMilman.lean:64`, `harmonic` at `NumberTheory/Harmonic/Defs.lean:25`, `List.rotate` in Batteries).
- No pinned Mathlib or Tau Ceti declaration states any of the 19 theorems; the only library file on vertex covers is `VertexCover.lean`, which has no comparison with matchings.
- Cross-roadmap citations resolved: GraphConnectivityAndFlows §6.7 and §6.8 (main, README lines 753 and 782) and MarkovDecisionProcesses Layer 5 (main, README line 529); both say what the README attributes to them.
- Dependency check: `depcheck: 200 roadmaps, 2183 edges, 0 problem(s)`; the roadmap names no roadmap as supplier.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ApproximationGuarantees/Suggested.lean` gives 19 `sorry` warnings and nothing else; every declaration carries its binders in its own signature, and the elaborated types agree with the README statements.
- One-tactic probe (`rfl`, `simp`, `simp` with the roadmap's definitions unfolded, `exact?`) on a separate copy of the file: 0 of 19 theorems close.
- Pull request text read against the head: 19 theorems, 12 definitions, the single import, the suppliers and the boundaries all agree; nothing to correct.

Overlap check: read SpanningTreesAndShortestPaths, MatroidOptimization, QuantumOptimization, HamiltonianCycles, GraphConnectivityAndFlows, DimerModelsAndLozengeTilings; nothing shared except the notion of cut weight, on three different carriers (GraphConnectivityAndFlows §1.2 owns pair-capacity and multigraph cuts, QuantumOptimization §1.3 the matrix form, this roadmap the graph form of 2.4; see C01). Euler tours of multigraphs are outside SpanningTreesAndShortestPaths by its own scope, so the closed walk of 3.4 is owned here; weighted tours are outside HamiltonianCycles by its own scope.

Source independence: 11 passages compared with 3 sources, none shared; largest share Williamson–Shmoys, 13 of 20 locators; contents compared with Williamson–Shmoys: independent (its Chapter 2 is split between Layers 3 and 4, its §§1.3–1.6 appear in another order inside Layer 1, and Layer 2 rests on other sources and on proofs given here).

Research link: The headline targets are the classical guarantees of Johnson 1974, Lovász 1975 and Chvátal 1979, Nemhauser and Trotter 1975, Christofides 1976, and Graham 1966 and 1969, as presented in Williamson and Shmoys 2011, Chapters 1–3; this rests on the README's references and on the Williamson–Shmoys text read.

## Not verifiable

- The original papers (Johnson, Lovász, Chvátal, Hochbaum, Bar-Yehuda and Even, Nemhauser and Trotter, Christofides, Serdyukov, Gonzalez, Graham) were not read; the README cites none of them by locator. The four statements without a locator for their exact form (the constant `4/3 − 1/(3m)`, persistency, `k + 1 ≤ 2k'`, prefix dominance) were checked by following the README's proof routes and by the instances in the table.
- Ownership against open pull requests was checked with the search over open heads; SpanningTreesAndShortestPaths, MatroidOptimization, QuantumOptimization and HamiltonianCycles were read through that tool.

## Source issues

- **Misprint** in Erickson2018J at §J.6, p. 8: the source says the sentence defining the optimal fractional value repeats the two words "denote the"; it should be a single occurrence; affects nothing.

## For the human reviewers

- **Scope.** The cited texts are one textbook (Williamson and Shmoys, CUP 2011) and two sets of lecture notes; the refereed papers of 1966–1985 behind the headlines are named in the README's references and were not consulted by the author.
- **Scope.** The subject is the worst-case analysis of classical heuristics, material of graduate courses on approximation algorithms; the README names no roadmap that consumes it.
