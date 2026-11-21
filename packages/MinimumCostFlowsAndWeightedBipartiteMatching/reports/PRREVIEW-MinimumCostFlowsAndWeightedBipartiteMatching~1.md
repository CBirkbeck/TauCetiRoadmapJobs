# Review of MinimumCostFlowsAndWeightedBipartiteMatching (pull request #2869 at fc2d102)

**Verdict:** accepted

**Summary.** Accepted: no statement, Check or route sentence was found false, and the seven headline theorems survive recomputation of every Check by hand and an independent exact-rational brute force on small networks, matrices and transportation instances. There are no small corrections and two format notes, neither blocking. The one source the README cites, Schrijver's lecture notes, could not be read from a legal place by the tools of this review, so none of its seven locators was checked against the text; that, and the fact that the only source is a set of lecture notes, is left to the human reviewers.

## N01 — Four of the seven headline theorems carry no locator into the literature

Reduced-cost optimality (1.3), existence and integrality (1.4), duality in potential form (1.6) and the transportation theorem (2.1) are marked "(Proved here.)", with at most a pointer to a neighbouring passage of the lecture notes, so a reader cannot set these statements beside a published one. They are textbook results; a locator into a refereed text for each (for instance the chapters on minimum-cost flows and on transportation in Schrijver's *Combinatorial Optimization: Polyhedra and Efficiency*, or in Ahuja, Magnanti and Orlin's *Network Flows*; neither was opened for this review, so no theorem number is proposed) would also give the roadmap a second source.

## N02 — A wrapped line in the first Check of 1.5 lost its indentation

In the first Check of 1.5 (README line 257) the words "the arrow `s → t`;" start at the left margin inside an indented bullet. It renders, but reads as a break in the source; re-wrap the sentence.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 dual function, residual costs | one arrow, `lo 0`, `hi 2`, cost 3, `b = (−1, 1)` | dual `t + min 0 (2(3−t))`: 3 at `t=3`, 2 at `t=2,4`; `max` variant gives 6 at `t=0`; capacities 1, 1; costs 3, −3 | agrees with Check | none |
| 1.1 identity behind the dual | general `g`, `p` | `Σ(p x − p y) g e = −Σ p v·excess(v)`, so cost `= Σ p b + Σ r g`; each `r g ≥ min(r lo, r hi)` | holds | none |
| 1.2 negative-cycle criterion | parallel arrows costs 1, 3; loop cost −1 bounds 0, 2; 7535 sampled assignments (integer and half-integer) on 400 random networks | `(0,1)`: cycle cost −2, caps 1,1; `(1,0)`: cycle cost 2; loop: 0 has cycle −1, 2 has +1; brute force: optimal ⇔ no negative positive-capacity cycle, 1354 optimal, 6181 not | iff holds both ways | none |
| 1.3 reduced-cost optimality | optimal `(1,0)` and non-optimal `(0,1)` of the parallel pair; the 7535 assignments | potentials `1 ≤ p y ≤ 3`; with zero-capacity arrows `p y ≤ 1` and `≥ 3`: none; non-optimal: `p y ≤ p x+1`, `p x ≤ p y−3`: none; brute force agrees 7535/7535 | iff holds; Lean inequality `p y ≤ p x + cost` matches prose | none |
| 1.4 existence and integrality | parallel cost-1 pair; `lo = hi = 1/2`; `b = (0,1)`; integer-data transport and matching instances | `(1/2,1/2)` and `(1,0)` both cost 1; data outside `H` forces `1/2`; excess sum 1 ≠ 0: empty; integer optimum equals exact optimum on all sampled instances | holds; forest route uses no division, so valid in an ordered ring | none |
| 1.5 shortest-path augmentation | 3-vertex Check; `ε = 0`; `s = t`; 15705 augmentations by bottleneck, half and third of it | zero flow → cost 2 after `s→a→t`, then 5; along `s→t` first: 3 > 2; `ε=2` breaks `hi`, `ε=−1` breaks `lo`; brute force: new flow optimal for shifted excess every time | holds; excess `+ε` at `t`, `−ε` at `s` matches Tau Ceti's sign | none |
| 1.6 duality in potential form | parallel pair; infeasible one-arrow problem; 1354 optimal assignments against integer potentials | dual `t + min 0 (1−t) + min 0 (3−t)` = 1 on `[1,3]`, `< 1` outside; infeasible: `p x = p y = t` gives `t`, unbounded; integer potential attains least cost 1354/1354 | holds; nonemptiness needed | none |
| 2.1 transportation | `a=d=(1,1)`, `c=[[1,3],[2,1]]`; `a=(3)`, `d=(1,2)`, `c=[[5,−1]]`; `c=[[−1]]`; empty `ι`; 600 random integer instances | cost `5−3x`, least 2; dual `(1,1),(0,0)` value 2; second: 3 and `3u+(5−u)+2(−1−u)=3`; empty `ι`: both sides 0; integer plan minimum = integer dual maximum 600/600 | holds; route's lowering of `u i` loses nothing since `a i ≥ 0` | none |
| 2.2 Egerváry | `[[2,3],[3,1]]`; `[[−1]]`; `[[4,3]]`; triangle; `K_{3,3}` all ones; empty sides; 4000 random integer matrices up to 3×3, entries −2…4 | 6 = 6; 0 = 0 (perfect-only −1, unsigned cover −1); 4 = 4; triangle 1 vs 3/2 vs 2; 3 = 3; greatest matching weight = least integer cover 4000/4000 | holds; cover from the route has total minus the dual value | none |
| Lean signatures | all 17 declarations | theorems keep `Fintype`, `CommRing`, `LinearOrder`, `IsStrictOrderedRing`; binders are absent only from definitions whose bodies do not use them | README generality equals Lean's | none |

- Source locators checked against the text: 0 of 7 (see Not verifiable).
- Library declarations opened at the pin: 27 in Tau Ceti (`TauCeti/Combinatorics/Network/Basic.lean:29`, `Shift.lean:43`, `Excess.lean:323` and `:491`, `Residual.lean:104`, `:182`, `:255`, `:304`, `:340`, `:353`, `:397`, `Walk.lean:103`, `:129`, `:262`, `:267`, `:279`, `:644`, `Augmentation.lean:91`, `:239`, `:411`, `Decomposition.lean:181`, `:264`, `:310`, `:483`, `Hoffman.lean:384`, `TauCeti/MeasureTheory/OptimalTransport/Finite/Duality.lean:563` and `:621`) and 8 Mathlib files (`Mathlib/Basic/PEquiv.lean:54`, `Mathlib/Combinatorics/Quiver/Path/Weight.lean:48`, `Mathlib/Algebra/Order/Ring/Defs.lean:74`, `Mathlib/Data/Finset/Option.lean:41`, `Mathlib/Order/Bounds/Defs.lean:48`, `Mathlib/Analysis/Convex/Birkhoff.lean:164`, `Mathlib/LinearAlgebra/Matrix/Determinant/TotallyUnimodular.lean:38`, `Mathlib/Algebra/Group/Subgroup/ZPowers/Basic.lean`); all exist with the hypotheses the README states.
- Cross-roadmap citations resolved: GraphConnectivityAndFlows 1.3, 3.1, 6.7, 8.2, 8.4 and its scope exclusion of minimum-cost flows (main, and the same section numbers at its open revision); SpanningTreesAndShortestPaths 3.1 and 3.3 at its open head (`walkWeight` and `IsPotential` agree character for character with the copies; `exists_isPotential_iff`, `isGreatest_isPotential_sub`, `IsConservative`, `IsShortest` are there as described); OptimalTransport 2.3; ConvexAnalysisAndDuality 5.3; ApproximationGuarantees 2.2; the scope sentences of MatchingTheory and MatroidOptimization.
- Duplication by object: no statement about costs of flows, reduced costs, transportation over ordered rings or Egerváry's theorem in the pinned Mathlib or Tau Ceti, on main, or in the open roadmap pull requests searched.
- Automatic checks: all passed at this head. Elaboration of `Suggested.lean`: seven `sorry` warnings and nothing else. One-tactic probe (`simp`, `rfl`, `infer_instance`, `simp_all`) on a copy: none of the seven theorems closes. No `example`, no `set_option`, no sorry'd data.
- Dependency check output: `depcheck: 170 roadmaps, 1975 edges, 0 problem(s)`; no UPWARD or CYCLE line. The one roadmap supplier not on main, SpanningTreesAndShortestPaths, is a new roadmap in an open pull request and is named as such in the description.
- Pull request text: title and description agree with the head (7 theorems, 10 definitions, the three imports, the supplier, the scope).
- Changes outside the roadmap folder: none.

Overlap check: read GraphConnectivityAndFlows (main and open revision), SpanningTreesAndShortestPaths, MatchingTheory, ApproximationGuarantees, PotentialGamesAndPriceOfAnarchy, FiniteAffineBoundTightening, OptimalTransport; walk weights and potentials are owned by SpanningTreesAndShortestPaths and cited (copied only to make statements statable); flows, residual networks, Hoffman and Kőnig by GraphConnectivityAndFlows and cited; real finite transport duality by OptimalTransport 2.3 and cited as the real case; nothing else shared.

Source independence: 0 passages compared with 1 source, because the text of Schrijver2017 could not be read; largest share Schrijver2017, 7 of 7 locators; contents not compared with its table of contents (by the README's own locators the order is not the source's: the results cited to its Chapter 3 come last here and its Proposition 5 comes after the existence theorem).

Research link: Egerváry's theorem (Egerváry, 1931) and the Hungarian method attributed to Kuhn, as the README's References give them; the README names no later research that uses the targets. Rests on the README alone.

## Not verifiable

- The seven locators into Schrijver's lecture notes (§4.6 Propositions 4 and 5 and Application 4.3, the remark on p. 73, Corollaries 3.7a and 3.7b, Theorem 3.8): the legal-source tool declined the author's page at CWI because its address does not spell the author's surname; no other copy was sought.
- The wording and arrangement comparison with that text, for the same reason.

## Source issues

- none

## For the human reviewers

- **Not tested.** The only cited source, Schrijver's lecture notes (author's page at CWI, `~lex`), could not be fetched; its seven locators, the wording and the table-of-contents comparison are unchecked. A human can confirm the page is the author's.
- **Scope.** The sole source is unpublished lecture notes; 1.3, 1.4, 1.6 and 2.1 cite no published statement. The subject is classical combinatorial optimization (Egerváry 1931); the README names no later research or consumer roadmap.
