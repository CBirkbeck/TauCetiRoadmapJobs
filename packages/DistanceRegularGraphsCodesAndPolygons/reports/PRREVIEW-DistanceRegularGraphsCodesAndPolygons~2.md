# Review of DistanceRegularGraphsCodesAndPolygons (pull request #3067 at d9e0952)

**Verdict:** needs changes

**Summary.** Changes are needed, and the change is one phrase: the new sentence of the opening summary states the count of zeros of the Lloyd polynomial without the hypothesis `t ≤ n` that 6.3 carries, and the README's own negative control refutes it as written. Both findings of the previous review are repaired, and the new target of 6.3 (at least `t` nonzero transforms, hence `t` zeros of the Lloyd polynomial) is true on every perfect code of the seven small Hamming spaces searched and its proof route is sound. There are one small correction and one format note, none blocking. The locators into the cited books remain unread, except that the page numbers for Brouwer–Haemers now agree with the publisher's chapter page ranges; that is left to the human reviewers.

## R01 (P2) — The summary says the Lloyd polynomial of a perfect code of radius `t` "has `t` zeros among `1, …, n`" with no bound on `t`; for `t > n` this is false, as the negative control of 6.3 shows.

The overview is read first and alone, and its statements are meant to be those of the layers with the same hypotheses; a reader takes this one as a theorem of the roadmap about every perfect code in its sense, and the roadmap's notion (every word within distance `t` of exactly one codeword) admits `t > n`.

In the third bullet of the summary (README line 22) no hypothesis on `t` appears. A single word of `H(1, 2)` is a perfect code of radius `2`; its Lloyd polynomial is `1 + (1 − 2x) + 2x(x − 1) = 2(x − 1)²`, with the one zero `1` among `1, …, n = 1`, not two. The fifth Check of 6.3 (line 691) gives this same instance and says "this is why `t ≤ n` is assumed"; the statement of 6.3 (line 661) and `card_lloyd_zeros_of_isPerfect` both carry `t ≤ n`.

Write "of a perfect code of radius `t ≤ n`" in the summary.

## C01 — The Conventions say `c_0 = 0` for every graph, but with the junk distance the same paragraph now describes, `c_0` of a disconnected graph is not `0`.

The sentence (README line 74) justifies `c_0 = 0` by "no neighbour of `y` is at distance `0` from `y`", which takes the pairs of class `0` to be the pairs `x = y`. The parenthesis added just before it says that on a disconnected graph pairs in different components are also in class `0`; for such a pair every neighbour of `y` is at junk distance `0` from `x`. On two disjoint edges `intersectionCount 0 0 = 1`, so `c_0 = 1`. No stated result is touched, since every theorem that uses `c_i` assumes the graph distance-regular, hence connected. "so `c_0 = 0` on a connected graph" would make the sentence true.

## N01 — The *Depends on* line of Layer 6 (line 594) still lists only Layer 2 of this roadmap, while 6.3 now needs 4.1 (its *Needs* line and "How to read the build" both say so); adding 4.1 there would make the three agree.

## Previous findings

- R01 — repaired: "`a = (1, 0, 0, 1)`, `(aQ)_2 = 3 + 3 = 6 ≠ 0`" (line 643); recomputed `aQ = (2, 0, 6, 0)`.
- R02 — repaired: "the vertices at distance at most `t − 1` from `x` or from `y` along paths avoiding the edge form two disjoint trees" (line 743); levels `0, …, t − 1` give `∑_(i<t) (k − 1)^i`.
- The earlier small corrections and format notes were all taken up: the count of zeros is a target of 6.3 (the summary's wording of it is R01 above); `IsCycles` is described as degree `0` or `2`; `intersectionCount` is a maximum over pairs, without choice (its new Conventions paragraph is C01 above); Layer 7 says 7.3 is built after 8.3; the module docstring says where the dotted names will live; the [BH] entry names the printed edition.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `intersectionCount` as a maximum (Conventions, 2.1) | prism `C_5 □ K_2`; Petersen; two disjoint edges | prism: counts at `(2,1)` are `{1, 2}`, at `(2,2)` `{0, 1}`, maxima `2`, `1`, minima `1`, `0`; Petersen `(2,1) = 1`, `(2,2) = 2`, `(0,0) = 0`; `2K_2`: `(0,0) = 1` | Check true; `c_0 = 0` fails on `2K_2` | C01 |
| `IsDistanceRegular.card_adj_dist` with the new definition | `i = 0`; no pair at distance `i` | on a connected graph class `0` is the diagonal, count `0 = c_0`; maximum of equal counts is the count; empty class gives `0` | holds | none |
| 6.2 Check, repetition code in the cube | `a = (1,0,0,1)`, `Q` column `2` `(3,−1,−1,3)` | `aQ = (2, 0, 6, 0)`, sum `8 = \|X\| a_0` | Check true | none |
| 6.3 zeros of the Lloyd polynomial (`card_lloyd_zeros_of_isPerfect`) | every perfect `(C, t)`, `t ≤ n`, in `H(n,2)`, `n ≤ 4`, `H(1,3)`, `H(2,3)`, `H(1,4)`; `t = 0`; `n = 0`; `t > n` | `3, 5, 13, 17, 4, 10, 5` pairs, none with fewer than `t` nonzero transforms or zeros, and the two index sets equal for `t ≥ 1`; `t = 0`, `n = 0`: `0 ≤ 0`; `H(1,2)`, `t = 2`: one index | holds; fails without `t ≤ n` | R01 (summary only) |
| 6.3 Checks | repetition code `n = 5`; tetracode; one word in `H(3,2)`; Hamming `[7,4]` | transforms `{2,4}`, `{3}`, `{1,2,3}`, `{4}`; Lloyd zeros `{2,4}` (`2(x−2)(x−4)`), `{3}` (`9 − 3x`), `{1,2,3}`, `{4}` | Checks true | none |
| 6.3 proof route for the count | word at distance `s` and at `s + 1 ≤ t` from its codeword | entries of `g(A) χ_C`: `c_s` and `0`; `c_s ≠ 0` needs `s ≤ n`, given by `s < t ≤ n`; Lloyd polynomial has degree `t` since `q ≥ 2` | sound | none |
| 7.2 proof sketch | Heawood (`k = 3`, `t = 3`); `t = 1` | radius `≤ 2`: `1 + 2 + 4 = 7` per side, `14` in all; `t = 1`: one vertex per side, bound `2`; cycle length `≤ 2t − 1 < 2t` | sound | none |
| 3.4 remark on `IsCycles` | path `P_3`; `C_5 ⊔ K_1` | `P_3` has a vertex of degree `1`, not `IsCycles`; `C_5 ⊔ K_1` degrees `2`, `0`, is | wording true | none |

The rows for the statements the change does not touch stand as in the previous review, of `b93bcea`.

- Source locators checked against the text: 0 in the changed passages ([BCN, Proposition 2.5.5] could not be read). The page numbers of [BH] were compared with the publisher's chapter page ranges from Crossref (Chapter 9 pp. 115–149, Chapter 11 pp. 165–175, Chapter 12 pp. 177–185): all README pages for [BH] fall in the right chapter. The section numbers (§12.4 examples, §12.6, §12.9 Moore graphs and polygons, §12.11 extremality, Theorems 12.9.1–12.9.3) agree with the authors' online version, read in the cache; there §12.6 mentions the two generalized hexagons of order `(2, 2)`, which settles the second question of the previous report.
- Library declarations opened at the pins: 1 (`TauCeti.krawtchouk`, `InformationTheory/Coding/Krawtchouk.lean` line 38, arguments `q n w j` for `K_w(j)`, matching both conjuncts of the new theorem); `BoundsOnCodes.IsPerfect` and `distanceDistribution` read in the local copies of `Suggested.lean`, lines 241 and 246.
- Duplication by object for the new target: no statement of Lloyd's theorem or of the zeros of the Lloyd polynomial in the pinned Mathlib or Tau Ceti, nor in another roadmap, open or on main.
- Elaboration: `Suggested.lean` elaborates with 43 `sorry` warnings and nothing else. One-tactic probe of the new theorem (`simp`, `decide`, `rfl`, `omega`, `aesop`, a pair of `simp`): none closes it. Its elaborated type keeps `Fintype ι`, `Fintype α`, `DecidableEq α`, `Nontrivial α` and `t ≤ Fintype.card ι`.
- Dependency check: `depcheck: 129 roadmaps, 1436 edges, 0 problem(s)`; no upward or cyclic line.
- Pull-request text: 43 `sorry` and 43 theorem names agree with the description; it mentions the count of zeros; no file outside the folder is changed.

Overlap check: read AssociationSchemes, StronglyRegularGraphsAndDesigns, StronglyRegularAndMooreGraphs, DelsarteTheoryOfCodesAndDesigns, GraphSymmetryAndCayleyGraphs (as in the previous review; the change adds one target, the zeros of the Lloyd polynomial, which none of them nor BoundsOnCodes states); nothing shared.

Source independence: changed passages only; 0 passages compared with 0 sources, since the one source the change cites, BCN §2.5, could not be read legally (the new proof route is by its own account not that of BCN); largest share BH, 36 of 75 locators in the layers; arrangement not compared again, the change adds, removes and reorders no layer.

Research link: Layers 2–3 and 7–8 are the classical theory behind the Damerell–Bannai–Ito theorem and the Bannai–Ito conjecture (proved by Bang, Dubickas, Koolen and Moulton), and Layer 9 is the entry to `Q`-polynomial schemes and the Terwilliger algebra; rests on the README ("Beyond this roadmap", "Downstream consumers"), no source read.

## Not verifiable

- [BCN, Proposition 2.5.5 (ii) and Remark (i), p. 56], cited for the new bullet of 6.3: the publisher is paywalled and no legal copy was found.
- The printed pages of [BH] within a chapter: only the authors' online versions are readable, and their pagination differs from the printed edition; the chapter page ranges are the publisher's.
- The other locators into [BH], [BCN], [BVM], [GR], [Biggs] and [Godsil], and the two claims of 1.3 and 9.1 about what [BH] and [BCN] prove: unchanged text, as in the previous review.

Automatic checks set aside as false positives: the section heading "Library declarations consumed" at the end of `Suggested.lean` was reported as having no declaration under it; it heads the `#check` lines that pin library declarations, which is their permitted use.

## Source issues

- none

## For the human reviewers

- **Not tested.** BH has the largest share of the locators (36 of 75 in the layers); its printed text and table of contents could not be read, so the wording and arrangement checks were not run against it or any other source.
- **Licence.** The six references are published books (Springer 2012, 1989, 2001; Cambridge 2022, 1993; Chapman and Hall 1993), cited by locator only; no copy of the printed texts was opened.
- **Locators.** This README's [BH] pages fit the publisher's chapter ranges (Crossref: Chapter 11 pp. 165–175, Chapter 12 pp. 177–185). The open roadmaps AssociationSchemes and StronglyRegularAndMooreGraphs give other pages for the same theorems, those of the authors' online versions.
