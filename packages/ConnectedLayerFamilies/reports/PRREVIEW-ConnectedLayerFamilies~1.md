# Review of ConnectedLayerFamilies (pull request #3158 at cbd39e1)

**Verdict:** needs changes

**Summary.** Changes are needed for one sentence: the last example of 4.2 says that in every rank `d ≥ 2` strongly connected complexes have diameters beyond the linear bound of 4.2, and this is false in rank 2, where the roadmap's own corridor bound 4.1 gives diameter at most `n − 2` (the source's asymptotic clause is wrong there and was carried over). Every stated theorem, definition, Check and worked value was recomputed and holds, and the sampled locators agree with the texts. There are two small corrections and one format note, none blocking; three facts are left for the human reviewers.

## R01 (P2) — The last example of 4.2 is false in rank 2: there a connected complex has diameter at most `n − 2`, and it is normal

The example (README lines 369–372) reads: "for fixed rank `d` the largest diameter of strongly connected pure complexes on `n` points is at least of order `n^(2d/3)`; for `d ≥ 2` this exceeds the linear bound of 4.2 for large `n`, so connectivity alone does not give 4.2". A reader takes from it that 4.2 needs normality in every rank from 2 on, and that rank-2 diameters grow like `n^(4/3)`.

For `d = 2` both parts fail. Theorem 4.1 of this roadmap gives `1·δ + 2 ≤ C(n, 1) = n`, so every distance in the facet graph of a rank-2 complex is at most `n − 2` (its own Check has the path complex attaining exactly `n − 2`); this is below `n^(4/3)` and below the bound `2(n − 1)` of 4.2. Moreover a rank-2 complex with connected facet graph is normal: the facets through one point pairwise share that point, so they are pairwise adjacent. An enumeration confirms it: of the 64 families of pairs on four points 61 have connected or empty facet graph and the same 61 are normal; on five points 969 and 969. The source's display in Cor 2.12 (santos2013 lines 360–374) bounds only `H_s(3n, 3d)`, ranks divisible by three; its "in particular" clause for every `d` (lines 375–382) is not what the proof gives and contradicts its own Cor 2.7 at `d = 1, 2` (see Source issues).

Smallest change: restrict the sentence to what the source proves, for instance: "Santos proves that in rank 3 the largest diameter of strongly connected pure complexes on `n` points is at least `(2/9)(n − 3)²` (Thm 2.8, p. 7), and in rank `3k`, `k` fixed, at least of order `n^(2k)` (Cor 2.12, p. 9); this exceeds the linear bound of 4.2 for large `n`, so there connectivity alone does not give 4.2. In rank 2 it does: a connected rank-2 complex is normal, and 4.1 already gives diameter at most `n − 2`."

## C01 — Tau Ceti does have abstract complexes of finite sets outside triangulations: `TauCeti.HypergraphComplex`

"From Tau Ceti" (README lines 442–444) says the pinned Tau Ceti "has abstract simplicial complexes only as triangulations of manifolds and geometric simplicial complexes with their subdivisions", and the pull request's description repeats it. At the pin, `TauCeti/Combinatorics/Hypergraph/Complex/Basic.lean` line 38 declares `TauCeti.HypergraphComplex r V`: a finite, downward-closed complex graded by face cardinality `k ≤ r`, with conversions to and from Mathlib's `PreAbstractSimplicialComplex` (it is Layer 5 of the Regularity roadmap, and CoboundaryExpansion uses it). It has no purity, facet graph, star or normality, so the conclusion "nothing is used" and the sentence "Tau Ceti has no object of this roadmap" stand; only the survey sentence is wrong. Name `TauCeti.HypergraphComplex` there (and in Conventions beside `PreAbstractSimplicialComplex`) as a related carrier without facet graphs, and correct the description's sentence likewise.

## C02 — The docstring of the 4.2 theorem says "in particular it is connected", the README "connected or empty"

In `Suggested.lean` (lines 102–104) the docstring of `ediam_facetGraph_le_of_isNormalComplex` says the facet graph "is connected". For `C = ∅`, which is normal and satisfies the hypotheses, the graph lives on the empty type: its `ediam` is `0` and the bound holds, but it is not `SimpleGraph.Connected` (which requires a nonempty vertex type). The README (line 313) has it right. Write "in particular it is connected when `C` is nonempty", or "preconnected".

## N01 — The locator for the dual complex of a simple polytope covers only half of the clause

In "Scope and ownership" (lines 391–393) the dual complex is said to be "normal and whose facet graph is the polytope graph (Santos Prop 2.4, p. 6)". Prop 2.4 gives the equality of graphs; normality is the first remark after Def 3.1 (p. 10: simplicial spheres and balls are normal), with p. 3 for the dual complex being a sphere or a ball. Add that locator.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 definition, interval form against intersection form | `{12}\|{24,13}\|{14,23}\|{34}`; `{123}\|{135,124}\|{125,134}\|{145}`; `{12}\|{34}\|{13}` | first two pass both forms; third fails (`{1}` at layers 0, 2, not 1) | agrees with README | none |
| 1.1 Checks (dropping one condition) | `V={1}` constant sequence; `L 0={{1}}, L 1=∅`; ten pairs of five points | each satisfies the other three; `N` unbounded, `N=1`, `N=9` against 3.1's `0`, `0`, `2·9=18>16` | true | none |
| 1.1 link theorem | link at `1` of the rank-3 example | `{23}\|{35,24}\|{25,34}\|{45}`, a family of rank 2, length 3 on `{2,3,4,5}` | true | none |
| 2.1 windows | `n=4,d=2`; `d=0,n=1`; `d=1` | lengths `2 = n−d`; two layers `{∅}` not disjoint; `n−1` | true; `1 ≤ d` needed | none |
| Largest lengths `H(n,d)` (Layer 2 examples) | memoised exact search, all `0 ≤ d ≤ n ≤ 5`, and `(6,1)` | `H(4,2)=3`, `H(5,2)=4`, `H(5,3)=3`, `H(n,1)=n−1`, `H(n,n)=0`, `H(n,n−1)=1`, `H(6,1)=5` | all README values confirmed | none |
| 3.1 `2N ≤ (n−1)·2^d` | every `(n,d)` with `n ≤ 5`, incl. `d=0`, `n=0` | `2H ≤ bound` in all 21 cases; `(0,0)`: `0 ≤ 0` with truncated `0−1`; `(4,2)`: `6 ≤ 12`; `(5,3)`: `6 ≤ 32` | true | none |
| 3.1 route, step (d) | algebra for `k ≥ 1`, `d ≥ 2` | difference `(2k−1)·2^(d−1) − 2k + 2 ≥ 2(2k−1) − 2k + 2 = 2k` | true | none |
| 3.2 `N+1 ≤ n^(log₂ d + 1)` | all `1 ≤ d ≤ n ≤ 5`; `d=0, V=∅`; `n=2,d=1` | holds in all cases; `d=0`: `1 ≤ 0^1 = 0` fails (`Real.logb_zero`); `2 = 2` | true; `d ≥ 1` needed | none |
| 3.2 route: recursion Check and analytic step | `g(n,d)` for `2 ≤ d ≤ n ≤ 5`; `2^x = 2d`, `2^(−y) = (d−1)/d` | equality at nine pairs, `(5,2)`: `5 < 6`; `n^x/d + n^x(d−1)/d = n^x` | true | none |
| 4.1 corridor bound | all 2 250 families of `d`-subsets, `n ≤ 5`, every pair, junk distance `0` included | `0` violations; path complex: `(n−2)+2 = n`; `{12},{34}`: `2 ≤ 4`; `d=0`: `0 ≤ 1` | true | none |
| 4.2 both parts | every normal family, `n ≤ 5`; `C=∅`; `C={∅}, d=0` | `0` violations; all normal families connected or empty; `C=∅,V=∅,d=1`: `1 ≤ 0` fails; `d=0`: `1 ≤ 0` fails | true; both hypotheses needed | none |
| 4.2 distance layering (route) | every normal family, every facet, every `δ` up to its eccentricity | `0` layerings that fail to be connected layer families | true | none |
| 4.2 Check, 1024 families of triples on five points | enumeration | 969 connected or empty, 834 normal, largest diameters 3 and 2; `{123,124,135,245}` is the path of length 3, star of `{5}` disconnected | confirmed | none |
| 4.2 last example (R01) | rank 2, `n = 4, 5` | diameter `≤ n−2` by 4.1; connected = normal: 61 = 61, 969 = 969 | sentence false at `d = 2` | restrict to ranks `3k` |
| `ediam` statement in `ℕ∞` | `#check` of the elaborated type | right side is `↑((V.card − 1) * 2 ^ d)`, a cast of a natural number; `2·⊤ ≤ 12` fails for `{12},{34}` | as README | none |
| Octahedron, triangle examples | `n=6,d=3`; `n=3,d=2` | 3-cube, diameter `3 = n−d`, bound `5·4 = 20`; diameter 1 | true | none |

- Source locators checked against the text: 19 (santos2013: Def 3.1, Def 3.3, §2.2, Prop 2.4, Cor 2.7 and its proof, Cor 2.12, Prop 3.6, Prop 3.7, Lemma 3.11 and proof, Thm 3.12, Lemma 3.13, Thm 3.14, §3.4, §2.3; kimsantos2010: Thms 2.5, 2.6, 2.7; kalaikleitman1992: Theorem 1 and the recursion), pages included; all agree with the README except the clause of R01 and the half locator of N01.
- Library declarations opened at the pin: 28 Mathlib names (all cited in "Exact supplier contracts", each resolved by `#check` and found in the file named), `PreAbstractSimplicialComplex` (`Mathlib/AlgebraicTopology/SimplicialComplex/Basic.lean` line 52), `Geometry.SimplicialComplex.facets`, and `TauCeti.HypergraphComplex` (`TauCeti/Combinatorics/Hypergraph/Complex/Basic.lean` line 38).
- Cross-roadmap citations: none in the README; none to resolve.
- Dependency check: `depcheck: 122 roadmaps, 1385 edges, 0 problem(s)`; no UPWARD or CYCLE line. The roadmap has no supplier roadmap.
- Elaboration of `TauCetiRoadmap/ConnectedLayerFamilies/Suggested.lean`: six `sorry` warnings and nothing else. `#check @name` on all 11 declarations: each type agrees with its README statement; the three declarations whose type does not mention `DecidableEq α` (`IsConnectedLayerFamily`, `facetStar`, `IsNormalComplex`) do not need it.
- One-tactic probe (`simp`, `rfl`, `infer_instance`, `omega`, `aesop`, `grind`) on the six theorems: none closes. Headline theorems (Larman–Barnette form, Kalai–Kleitman form, normal complexes, corridor bound): all four stated.
- Duplication by object: no facet graph, purity, star, normality, layer family or Johnson graph in the pinned Mathlib or Tau Ceti; no roadmap on main or at an open head states them (searched by object).
- The pull request changes nothing outside the roadmap folder. The automatic checks all passed on this head.

Overlap check: read StronglyRegularAndMooreGraphs, Regularity (Layer 5), CoboundaryExpansion, TopologicalCombinatorics; nothing shared (`HypergraphComplex` is Regularity's and is not used or restated here).

Source independence: 9 passages compared with 3 sources (the definition, the link statement, the routes of 3.1, 3.2, 4.1 and 4.2, the definition of normality, two docstrings), none shared; largest share santos2013, about 16 of 22 locators; contents compared with santos2013: independent (Layer 1 ↔ §3.1, Layer 2 has no counterpart, Layer 3 ↔ §3.3, Layer 4 ↔ §2.2 with §3.1; the order differs and is forced by 4.2 needing 3.1 and 3.2).

Research link: The targets are the Larman (1970) / Barnette (1974) and Kalai–Kleitman (1992) diameter bounds in the abstract setting of Eisenbrand–Hähnle–Razborov–Rothvoß (2010), as surveyed by Santos (2013, §3) and Kim–Santos (2010, Thm 2.7), around the polynomial Hirsch conjecture; rests on the README's sources, read here.

## Not verifiable

- Eisenbrand–Hähnle–Razborov–Rothvoß, Math. Oper. Res. 35 (2010): the publisher's page refuses access and no open copy was found; the README cites it only through Santos §3.4 and Kim–Santos Thm 2.7, which were read.
- Larman 1970, Barnette 1974, Adiprasito–Benedetti 2014, Allamigeon–Canu–Strub 2023: cited for attribution only; neither the texts nor their bibliographic data were rechecked here.
- The published (TOP) pagination of Santos' survey: the README cites the arXiv version's pages, which is what was read.

## Source issues

- **Error** in santos2013 at Corollary 2.12, p. 9 (the "in particular" clause): the source says that in every fixed rank `d` the largest diameter of strongly connected complexes is at least of order `n^(2d/3)`; it should be claimed only for ranks divisible by three, as in the display (for `d = 1, 2` its Corollary 2.7 gives at most `1` and `n − 2`); affects a stated result.
- **Misprint** in santos2013 at Lemma 3.11, proof, p. 13: the source says the first and last runs are bounded by the function at `⌊n/2⌋` and `⌈n/2⌉`; it should be `⌊(n − 1)/2⌋` and `⌈(n − 1)/2⌉`, as in the statement; affects nothing.
- **Misprint** in santos2013 at Theorem 2.8, proof, p. 7: the source writes the rank as `d` in the bound for `3k + 1` points; it should be rank 3; affects nothing.
- **Misprint** in santos2013 at Example 3.9, p. 12: the source lists the multiset `233` twice among ten; it should be `223` then `233`; affects nothing.

## For the human reviewers

- Scope: 16 of about 22 locators are to one refereed survey (Santos, TOP 2013); the primary source for the notion (Eisenbrand et al. 2010) was read neither by the author nor here (paywalled).
- Scope: the description gives as background an unrefereed November 2026 preprint on superpolynomial polytope diameters; the README neither cites nor uses it.
- Licence: the public repository `michaellady/applied-formalization-targets`, file `Applied/Optimization/ConnectedLayerFamily.lean` (no licence header), declares a structure also named `IsConnectedLayerFamily`; its argument order, field names, definition form and theorems differ from `Suggested.lean`.
