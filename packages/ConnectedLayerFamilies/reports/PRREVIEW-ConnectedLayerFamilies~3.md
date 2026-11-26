# Review of ConnectedLayerFamilies (pull request #3158 at d39fa0c)

**Verdict:** accepted

**Summary.** Accepted: this is an incremental re-review of the 27 lines changed since `cbd39e1`, and all four remarks of the previous review are repaired without a new defect. The rewritten last example of 4.2 now claims only what Santos' Thm 2.8 and Cor 2.12 give (rank 3 and ranks divisible by three) and its new rank-2 sentence was recomputed and holds. There are no small corrections and no format notes; three facts remain for the human reviewers.

## Previous findings

- R01 — repaired: "in rank 3 the largest diameter … is at least `(2/9)(n − 3)²` … In rank 2 it does: the facets through one point are pairwise adjacent, so a rank-2 complex with connected facet graph is normal" (README lines 369–374).
- C01 — repaired: "From Tau Ceti" now names `TauCeti.HypergraphComplex` "(a finite downward-closed complex graded by face cardinality, with conversions to and from Mathlib's `PreAbstractSimplicialComplex`)"; the description names it too.
- C02 — repaired: the docstring of `ediam_facetGraph_le_of_isNormalComplex` reads "in particular it is connected when the complex is nonempty".
- N01 — repaired: "whose facet graph is the polytope graph (Santos Prop 2.4, p. 6) and which is normal (Santos, first remark after Def 3.1, p. 10)".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 4.2, last example, rank-3 clause (changed) | `d = 3`; `n = 22, 23, 24`; source at Thm 2.8 | 4.2 bound `(n−1)·2^(d−1) = 4(n−1)`; `(2/9)(n−3)²` against it: `80.2 < 84`, `88.9 > 88`, `98 > 92`; exceeds from `n = 23` (`n² − 24n + 27 > 0`) | true; source states `(2/9)(n−3)² ≤ H_s(n,3) ≤ n²/4` | none |
| 4.2, last example, rank-2 clause (changed) | every family of pairs on 4, 5, 6 points | connected or empty: 61, 969, 31 738; normal among them: 61, 969, 31 738; largest diameter 2, 3, 4 `= n − 2` | true | none |
| 4.1 as cited by that clause | `d = 2` | `1·δ + 2 ≤ C(n,1) = n`, so `δ ≤ n − 2`; attained (path complex) | true | none |
| 4.2 statement, docstring (changed) | `C = ∅`; `C` nonempty normal | `C = ∅`: vertex type empty, `ediam = 0`, not `Connected`; nonempty: `ediam < ⊤` on a nonempty type, so connected | docstring now agrees with README line 313 | none |
| "From Tau Ceti" (changed) | `HypergraphComplex` at the pin | fields `faces`, `face_card`, `down_closed`, `empty_mem`; `toPreAbstractSimplicialComplex` and `ofPreAbstractSimplicialComplex`; no facet graph, star, purity or normality | sentence true | none |

The rows for the untouched statements stand as in the previous review, of `cbd39e1`.

- Source locators checked against the text: 5, all in the changed passages (santos2013 line 300–302, Thm 2.8, p. 7; lines 360–386, Cor 2.12, p. 9; lines 396–398, Def 3.1, p. 9; lines 405–408, first remark after it, p. 10; line 237, Prop 2.4, p. 6); all agree.
- Library declarations opened at the pin: `TauCeti.HypergraphComplex` (`TauCeti/Combinatorics/Hypergraph/Complex/Basic.lean` line 38) and `HypergraphComplex.toPreAbstractSimplicialComplex` (line 78, same file).
- Cross-roadmap citations: none in the README.
- Dependency check: `depcheck: 122 roadmaps, 1385 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/ConnectedLayerFamilies/Suggested.lean`: six `sorry` warnings and nothing else; the change touches a docstring only, so the 11 elaborated types are those compared with the README in the previous review.
- The automatic checks all passed on this head; the pull request changes nothing outside the roadmap folder.
- The pull request's title and description were read against this head: no sentence is contradicted, and the description's sentence on Tau Ceti now names `TauCeti.HypergraphComplex`.

Overlap check: read StronglyRegularAndMooreGraphs, Regularity (Layer 5), CoboundaryExpansion, TopologicalCombinatorics; nothing shared (`HypergraphComplex` is Regularity's and is not used or restated here).

Source independence: changed passages only; 3 passages compared with 1 source (the rewritten example of 4.2, the dual-complex clause of the scope, the docstring of the 4.2 theorem), none shared; largest share santos2013, about 18 of 24 locators; the diff adds, removes and reorders no layer, so the contents were not compared again (independent in the previous review).

Research link: The targets are the Larman (1970) / Barnette (1974) and Kalai–Kleitman (1992) diameter bounds in the abstract setting of Eisenbrand–Hähnle–Razborov–Rothvoß (2010), as surveyed by Santos (2013, §3) and Kim–Santos (2010, Thm 2.7), around the polynomial Hirsch conjecture; rests on the README's sources, read here.

## Not verifiable

- Eisenbrand–Hähnle–Razborov–Rothvoß, Math. Oper. Res. 35 (2010): paywalled, no open copy; cited only through Santos §3.4 and Kim–Santos Thm 2.7, and not touched by the change.
- Larman 1970, Barnette 1974, Adiprasito–Benedetti 2014, Allamigeon–Canu–Strub 2023: cited for attribution only; not rechecked.
- The published (TOP) pagination of Santos' survey: the README cites the arXiv version's pages, which is what was read.

## Source issues

- **Error** in santos2013 at Corollary 2.12, p. 9 (the "in particular" clause): the source says that in every fixed rank `d` the largest diameter of strongly connected complexes is at least of order `n^(2d/3)`; it should be claimed only for ranks divisible by three, as in the display (for `d = 1, 2` its Corollary 2.7 gives at most `1` and `n − 2`); affects a stated result.
- **Misprint** in santos2013 at Theorem 2.8, proof, p. 7: the source writes the rank as `d` in the bound for `3k + 1` points; it should be rank 3; affects nothing.

## For the human reviewers

- Scope: about 18 of 24 locators are to one refereed survey (Santos, TOP 2013); the primary source for the notion (Eisenbrand et al. 2010) was read neither by the author nor here (paywalled).
- Scope: the description gives as background an unrefereed November 2026 preprint on superpolynomial polytope diameters; the README neither cites nor uses it.
- Licence: the public repository `michaellady/applied-formalization-targets`, file `Applied/Optimization/ConnectedLayerFamily.lean` (no licence header), declares a structure also named `IsConnectedLayerFamily`; its argument order, field names, definition form and theorems differ from `Suggested.lean`.
