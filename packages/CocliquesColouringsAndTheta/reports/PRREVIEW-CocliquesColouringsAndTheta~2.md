# Review of CocliquesColouringsAndTheta (pull request #3068 at 24091c9)

**Verdict:** accepted

**Summary.** Accepted: both findings of the previous review are repaired and the repairs introduce no new problem. A biclique partition in 2.2 is now an edge decomposition into complete bipartite subgraphs, for which the Graham–Pollak inequality holds, and attainment and linear-programming duality for the fractional chromatic number are consumed from AsymptoticSpectra 2.3 through the complement, with only the rationality of an optimal weighting kept here. One small correction is carried over (two Brouwer–Haemers locators, unchanged), not blocking. The locators into Godsil–Royle, Biggs and Knauer–Knauer remain unchecked against the texts, which is left to the human reviewers.

## C01 — Two Brouwer–Haemers locators still do not match the edition the References name

This is C01 of the previous review, and the passages are unchanged at this head: "[BH, Theorem 3.5.5a, p. 40]" in 1.1 (README line 124, and the docstring of `IsWeightedAdjMatrix.indepNum_le_of_posSemidef`, `Suggested.lean` line 233), and "[BH, Proposition 3.7.5, p. 45]" in 6.1 (README line 524). As the previous review read them, the 2012 Springer text has no Theorem 3.5.5a (Theorem 3.5.5 on p. 40 is followed directly by §3.6; the statement is in the authors' later online version, on its p. 48), and Proposition 3.7.5 is stated on p. 44 and proved on p. 45. The References say the locators are to the 2012 edition by printed page, so a reader looks for 3.5.5a there in vain. Cite the online version for that one item, and write "pp. 44–45" for the other. The text was not read again in this round; the remark rests on the previous reading.

## Previous findings

- R01 — repaired: 2.2 now asks that "every `u ∈ X k` is adjacent to every `v ∈ Y k`" and that every edge has exactly one `k`; `IsBicliquePartition` in Lean has the same three clauses, and the `C₆` family is a negative-control Check.
- R02 — repaired: 5.1 identifies `fractionalChromaticNumber G` with the fractional clique cover number of `Gᶜ` of AsymptoticSpectra 2.3; 5.2 consumes attainment and duality from there; `fractionalChromaticNumber_eq_sSup` is gone; scope and supplier contracts name the owner.
- C01 — not repaired: "[BH, Theorem 3.5.5a, p. 40]" and "[BH, Proposition 3.7.5, p. 45]" stand as before; carried as C01 above.
- C02 — repaired: `contract_adj_iff` is removed from `Suggested.lean`, and 3.1 states the neighbourhood description as basic API in prose, saying that it holds by unfolding `contract`.
- N01 — repaired: the closing comment is now a plain note, "Pinned library declarations named in the supplier contracts of `README.md`", not a section heading.
- N02 — repaired: the cycle formula is stated for `n ≥ 2` in 3.2 and in Lean (`2 ≤ n`), with the Check `cycleGraph 2 = K₂` and the negative control at `n = 1`.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 2.2 `IsBicliquePartition` (new definition) | `C₆` with `{0,2}\|{1,5}`, `{2,4}\|{5,3}`; `K₃` stars `{0}\|{1,2}`, `{1}\|{0,2}`; `C₅` with three bicliques; `m = 0` | rejected (`2 ≁ 5`), in Lean; rejected (edge `01` twice), in Lean; accepted, in Lean; forces no edges | determines edge decompositions | none |
| 2.2 Graham–Pollak inequality | `C₅` (m = 3); `C₄` (m = 1); `K₄` (m = 3); edgeless, `m = 0`; an empty side | `n₊ = 3 ≤ 3`; `n₊ = n₋ = 1 ≤ 1`; `n₋ = 3 ≤ 3`; `0 ≤ 0`; only raises `m` | holds: `A = Σ(a_k b_kᵀ + b_k a_kᵀ)` entrywise (edges 1, non-edges 0, diagonal 0 by disjointness) | none |
| 3.2 cycle formula for `n ≥ 2` | `n = 2`, `3`, `4`, `1`; induction step | `t(t−1)` both sides (`cycleGraph 2` has `Adj u v ↔ u ≠ v`, by `decide`); `t(t−1)(t−2)`; `t⁴−4t³+6t²−3t`; `t` vs `0`; `t(t−1)^{n−1} − C_{C_{n−1}}` gives the formula, `C₃/e = K₂` | holds | none |
| 5.1 identity with AsymptoticSpectra 2.3 | the two feasible sets for `Gᶜ` and `G`; `V` empty | covering every element of every finite set = covering every vertex (singletons); cliques of `Gᶜ` = cocliques of `G`; `0 = 0` | the sets of totals coincide | none |
| 5.2 duality through the complement | `C₅`; Petersen | `5/2` cover and `5/2` packing (weight `1/2` on vertices, cocliques of size ≤ 2); `5/2` by five stars | agrees with `fracCliqueCover_spec` at `Gᶜ` | none |
| 5.2 rational attainment | `C₅`; `K₂`; `V` empty | optimum `1/2` on five cocliques; `1` on each singleton; zero weighting, total `0` | holds; least-support argument keeps support inside cocliques | none |

The rows for the statements the change does not touch stand as in the previous review, of `d272d0b`.

- Source locators checked against the text in this round: 0 (no text could be read in this round; the changed passages add no new locator apart from the qualifier "for `n ≥ 3`" on [B, pp. 65–66]).
- Library and probe: `SimpleGraph.cycleGraph 2` is complete on `Fin 2` (by `decide` at the pin); the new `IsBicliquePartition` rejects the `C₆` and `K₃` families and accepts the `C₅` one, proved on a copy against the built module.
- Cross-roadmap citations resolved: AsymptoticSpectra 2.3 at its open head (`fracCliqueCover`, `fracCliqueCover_spec`, `IsFractionalCover`; README 2.3 and `Suggested.lean` lines 220, 295–308), read and compared clause by clause with 5.1; no citation of ConvexAnalysisAndDuality remains.
- Dependency check: `depcheck: 129 roadmaps, 1436 edges, 0 problem(s)`; no upward or cyclic edge. No file changed outside the folder.
- Automatic checks: all passed at this head. Elaboration: `Suggested.lean` elaborates with 32 `sorry` warnings and nothing else; 32 theorems, 11 own definitions, no `set_option`; the elaborated types of the three touched declarations were compared with the README (`2 ≤ n`; the three clauses of the definition; rational attainment with `Fintype` and `DecidableEq` kept).
- Padding: none of the three touched theorems is a restated definition or closes in one tactic; the one that did was removed.
- Pull request text: the description agrees with this head (32 headlines, 11 definitions, AsymptoticSpectra 2.3 as supplier, no ConvexAnalysisAndDuality).
- Overlap check: read AsymptoticSpectra, LovaszThetaFunction, GraphSymmetryAndCayleyGraphs, SpectralGraphBounds, GraphSpectra, AssociationSchemes, LinearAlgebraMethodInCombinatorics, GraphConnectivityAndFlows, SpanningTreesAndShortestPaths (the last eight as in the previous review); the fractional cover number with attainment and duality is owned by AsymptoticSpectra 2.3 and cited from here; nothing else shared.

Source independence: changed passages only; 5 passages compared (the definition and the new Check of 2.2, the cycle item of 3.2, the identity of 5.1, the opening of 5.2) with AsymptoticSpectra 2.3, the one text they draw on that could be read, none shared beyond formulas; no source text could be read in this round; largest share Godsil–Royle, 28 of 60 locators, text and contents not readable; no layer added, removed or reordered, so the arrangement was not compared again.

Research link: the theta function and Haemers' bound are the two standard upper bounds on the Shannon capacity (Lovász 1979, Haemers 1979, as Brouwer–Haemers §3.7 give them); cores, fractional colourings and Kneser graphs are Godsil–Royle Chapters 6–7 (2001). Rests on the README's sources and the Brouwer–Haemers text.

## Not verifiable

- Godsil–Royle, *Algebraic Graph Theory* (28 locators: 1.2, Layers 4, 5 and 7, including Theorem 7.3.2 for the rational attainment kept in 5.2): a Springer book with no open copy; the statements were checked as mathematics, the theorem numbers and pages were not.
- Biggs, *Algebraic Graph Theory*, 2nd ed. (14 locators, Layer 3, including pp. 65–66 for the cycle formula): no open copy.
- Knauer–Knauer, *Algebraic Graph Theory*, 2nd ed. (2 locators, 4.3): no open copy.
- Brouwer–Haemers, *Spectra of Graphs*: not read again in this round (the sources service found no legal copy at the address tried); Proposition 1.5.1, p. 12, cited in 2.2, was read by the previous review, and C01 rests on that reading.

## Source issues

- none

## For the human reviewers

- **Not tested.** Godsil–Royle carries the largest share of the locators (28 of 60) and its text and table of contents could not be read: the wording and arrangement checks were not made against it, nor against Biggs or Knauer–Knauer.
- **Scope.** `Suggested.lean` carries verbatim local copies of 16 definitions and instances of seven suppliers that are still open pull requests (lines 44–209), as the sibling spectral-graph roadmaps do; whether that practice is accepted is yours to decide.
