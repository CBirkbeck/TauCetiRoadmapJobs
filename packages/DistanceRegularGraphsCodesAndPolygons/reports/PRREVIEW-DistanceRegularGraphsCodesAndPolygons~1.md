# Review of DistanceRegularGraphsCodesAndPolygons (pull request #3067 at b93bcea)

**Verdict:** needs changes

**Summary.** Changes are needed, and they are two one-line repairs: a Check of Lloyd's theorem (6.2) gives `(aQ)_2 = 4` where the value is `6`, and the proof sketch of the bipartite Moore bound (7.2) takes the trees one level too shallow, so its count is false as written. Every stated theorem survived the adversarial pass, `Suggested.lean` elaborates with `sorry` as its only warning, no statement closes in one tactic, and the supplier citations and the 27 copied definitions agree with their owners. There are three small corrections and three format notes, none blocking. None of the six cited books could be read from a legal copy, so no locator was checked against its text: that, and which printing of Brouwer–Haemers the page numbers refer to, is left to the author and the human reviewers.

## R01 (P2) — The Check of 6.2 on the repetition code in the cube gives `(aQ)_2 = 1 + 3 = 4`; the value is `3 + 3 = 6`.

A reader who recomputes the Check gets another number and cannot tell whether `Q`, the inner distribution or the theorem is at fault; the Check is there to pin the normalisation of `a` and `Q`, and as written it pins a wrong one.

In the first Check of 6.2 (README line 635), `a = (1, 0, 0, 1)` and column `2` of `Q` for `H(3, 2)` is `(K_2(0), K_2(1), K_2(2), K_2(3)) = (3, −1, −1, 3)`, so `(aQ)_2 = 1·3 + 1·3 = 6`. The whole vector is `aQ = (2, 0, 6, 0)`, whose sum is `8 = |X| a_0` as it must be; with `4` the sum would be `6`. The README agrees with `6` elsewhere: the Check of 6.3 gives the unnormalised transform of the same code as `(4, 0, 12, 0)`, and `12/|C| = 6`. The rest of the line (`P_(20) + P_(21) = 1 + (−1) = 0`) is right.

Replace "`(aQ)_2 = 1 + 3 = 4 ≠ 0`" by "`(aQ)_2 = 3 + 3 = 6 ≠ 0`".

## R02 (P2) — The proof sketch of 7.2 takes the vertices "at distance less than `t − 1`" from the ends of the edge; that set has only `∑_(i<t−1) (k − 1)^i` vertices on each side, not the `∑_(i<t) (k − 1)^i` the sentence claims.

An implementer who follows the sketch proves a bound one term short. For the Heawood graph (`k = 3`, `t = 3`) the vertices at distance less than `2` from an end of the edge, along paths avoiding it, number `1 + 2 = 3`, while the sentence claims at least `1 + 2 + 4 = 7`; for `t = 1` the set is empty and the sentence claims one vertex on each side.

The radius that works is `t − 1` inclusive (README line 718). A vertex at distance `i` from `x` and `j` from `y`, both at most `t − 1`, would close a cycle of length at most `i + j + 1 ≤ 2t − 1`, and two paths of length at most `t − 1` from `x` to one vertex a cycle of length at most `2t − 2`; so the two balls of radius `t − 1` are disjoint trees, with levels `0, …, t − 1` and at least `(k − 1)^i` vertices on level `i`.

Replace "at distance less than `t − 1`" by "at distance at most `t − 1`". The statement of 7.2 and its Lean form are correct.

## C01 — 6.3 is the conditional form of Lloyd's theorem; the form coding theory states, that the Lloyd polynomial of a perfect `t`-code has `t` distinct zeros among `1, …, n`, is not a target and does not follow from 6.2 alone.

6.3 says the Lloyd polynomial vanishes at each `j ≥ 1` where the transform of the distance distribution is nonzero; it does not say how many such `j` there are. The third Check of 6.3 lists all the zeros for the Golay and Hamming parameters, which is the stronger statement. The missing step is short and uses only what the roadmap has: if only `s < t` indices `j ≥ 1` had nonzero transform, a polynomial `g` of degree `s` vanishing at their eigenvalues would make `g(A) χ_C` a constant vector; `g(A) = ∑_(i≤s) c_i A_i` with `c_s ≠ 0` (2.3), and evaluating at a word at distance `s` and at one at distance `s + 1 ≤ t` from its nearest codeword gives `c_s` and `0`.

Would you either add that as a second bullet of 6.3 (for a perfect code of radius `t` with `t ≤ n`, at least `t` indices `1 ≤ j ≤ n` have nonzero transform, hence the Lloyd polynomial has `t` distinct zeros among `1, …, n`), or say in 6.3 that the count of zeros is not claimed.

## C02 — 3.4 describes Mathlib's `SimpleGraph.IsCycles` as about graphs "of maximum degree two"; it is the condition that every vertex with a neighbour has exactly two.

At the pin (`Mathlib/Combinatorics/SimpleGraph/Matching.lean`, line 375) the definition is `∀ ⦃v⦄, (G.neighborSet v).Nonempty → (G.neighborSet v).ncard = 2`. A path has maximum degree two and is not `IsCycles`, so a reader could expect the cited lemma to apply to it. In the paragraph after the two bullets of 3.4 (README line 423), "a graph of maximum degree two" would read "a graph in which every vertex has degree `0` or `2`". A `2`-regular graph satisfies it, so the route is unaffected.

## C03 — `intersectionCount` reads its value at a pair of vertices picked by `Exists.choose`, so on a graph that is not distance-regular it has no determined value and no small example can be evaluated.

Every theorem that uses `b_i`, `a_i`, `c_i` is about a distance-regular graph, where the count does not depend on the pair, so no stated result is affected. The cost is in the library: the Checks of Layer 2 ("`intersectionCount` on the Petersen graph", the arrays of the cube and of `C_6`) cannot be confirmed by `decide`, and nothing can be proved about the value on, say, the prism. A choice-free definition that agrees on distance-regular graphs would be the maximum of the count over all pairs at distance `i` (`Finset.sup` over `V × V`, which is `0` when there is no such pair); `IsDistanceRegular.card_adj_dist` then reads the same.

## N01 — 7.3 needs 8.3, a section of a later layer; since Layer 8 needs nothing of Layer 7, moving 7.3 after 8.3 (or saying in the heading of Layer 7 that 7.3 is built after Layer 8) would put the layers in build order.

## N02 — The theorems named `IsDistanceRegular.…` and `IsSRGWith.…` are declared in this roadmap's `SimpleGraph` namespace, while the predicates are `AssociationSchemes.IsDistanceRegular` and Mathlib's `SimpleGraph.IsSRGWith`; so `hG.card_adj_dist` will not resolve by dot notation. A sentence in the module docstring saying where the names will live in the library would be enough.

## N03 — The reference for [BH] says "Universitext, Springer, 2012", and the page numbers may be those of another printing (see the first question); if so, name the printing in the References entry.

## Questions for the author

- Which printing of Brouwer–Haemers do the locators refer to? This README has Theorem 11.2.1 on p. 167, Theorem 11.6.1 on p. 173, §12.1 on p. 177 and the Damerell–Bannai–Ito theorem as Theorem 12.9.1 on p. 182; the open roadmap AssociationSchemes gives Theorem 11.2.1 as p. 163, Theorem 11.6.1 as pp. 168–169 and §12.1 as p. 173, and StronglyRegularAndMooreGraphs gives the Damerell–Bannai–Ito theorem as Theorem 12.7.1, p. 178. I could open neither printing, so I do not know which numbers are those of the cited Springer edition.
- In the third Check of 8.3, the existence of the generalized hexagon of order `(2, 2)` is cited to [BH, §12.6, p. 181], while the generalized polygons are cited everywhere else to §9.6 and §12.9. Is §12.6 the intended section? I could not open the text.
- 1.3 says that [BH] states the first inequality of Theorem 11.4.3 only for `i ≠ j` and that its proof needs no such hypothesis; 9.1 says that [BCN] and [BH] prove only the metric half. Both are claims about the sources that I could not check; the mathematics of both statements here is right (the adversarial rows below).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 Ranks of entrywise products | `E = uuᵀ + wwᵀ`; the `3 × 4` matrix; characteristic `2` | `rk E = 2`, `det(E⊙E) = 8`, rank `3`; `3 × 4`: ranks `2`, `3`; char `2` only drops cross terms | holds | none |
| 1.2 Eigenmatrix bounds | `K_n`, Petersen, `H(4,2)` | `K_n`: `P` rows `(1, n−1)`, `(1, −1)`; `H(4,2)` last row `(1,−4,6,−4,1)` meets `v = (1,4,6,4,1)` | holds | none |
| 1.3 Absolute bound | `K_2`, `K_3`, `K_4`, `i = 0` | `K_3`: `3 ≤ 4`, `6 ≤ 6`; `K_2`: `q^1_11 = 0`, `1 ≤ 1`, `2 ≤ 2`; `i = 0`: `m_j ≤ m_j` | holds | none |
| 2.1 Bridge to the distance scheme | Petersen, `K_1`, index order | `T_(hj)` = count = `p^h_(j1)`; `K_1`: `p^0_00 = 1` vs count `0`, excluded by `1 ≤ diam` | holds | none |
| 2.2 Identities, sphere sizes | `i = 0`, `i ≥ d`, `K_1` | `c_0 = a_0 = 0`; `i ≥ d`: both sides `0`; Petersen `3·1 = 1·3`, `6·1 = 3·2` | holds | none |
| 2.3 Distance recurrence | `i + 1 > d`, `i = d − 1`, Petersen `i = 0` | both sides `0` for `i ≥ d` (`b_d = 0`, `A_(d+1) = 0`); `A² = 3I + A_2` | holds | none |
| 2.5 Strongly regular graphs | `K_3`, one vertex, `μ = 0`, `P_3`, `T(5)` | `μ = 0` and connected forces complete; `K_1 = ⊤` excluded; `T(5)`: `b_1 = 6 − 3 − 1 = 2`, `c_2 = 4` | holds both directions | none |
| 3.1 `d + 1` eigenvalues | Petersen, `K_1`, prism | `T` roots `3, 1, −2`; `K_1`: `T = (0)`; prism: diameter `3`, `6` distinct eigenvalues, not distance-regular | holds | none |
| 3.2 Biggs's formula | Petersen `θ = 1`, `K_1` | `u = (1, 1/3, −1/3)`, `∑ k_i u_i² = 2`, `10/2 = 5`; `K_1`: `1/1 = 1` | holds | none |
| 3.3 Smith's theorem | `K_n` (`d = 1`), `C_9`, `K_(3,3)`, Heawood, `J(6,3)` | `K_n` antipodal with connected distance graph, excluded by `d ≥ 2`; `C_9`: distance-`3` graph `3K_3`, excluded by `k ≥ 3` | holds | none |
| 3.4 Degree two | `cycleGraph 0, 1, 2`; `n ≥ 3` | `cycleGraph 2 = K_2`, `1 = K_1`, both distance-regular; `0` not connected; a connected `2`-regular graph has `n ≥ 3` | holds | C02 (wording) |
| 4.1 Hamming graphs | `d = 0`, `q = 1`, `H(3,3)`, `H(2,4)` | `q = 1`: one vertex, diameter `0 ≠ d`; `H(3,3)`: `b = (6,4,2)`, `c = (1,2,3)`; `H(2,4)`: `{6,3;1,2}` | holds | none |
| 4.2 Johnson graphs | `k = 0`, `k = v`, `J(7,3)`, `J(5,4)` | `J(7,3)`: `12, 6, 2; 1, 4, 9`; `J(5,4) = K_5`: formula `c_2 = 4`, true `0`, excluded by `2k ≤ v` | holds | none |
| 5.1 Predistance polynomials | `K_5`, Petersen, cube, prism, Möbius–Kantor (exact arithmetic) | cube `p_2 = (X² − 3)/2`, `r_2(3) = 6`; `∑ p_i(3) = n` in all five; prism `p_5(3) = 2/329` | holds | none |
| 5.2 Spectral excess | same five graphs, `K_1` | Petersen `6 = 6`; cube `1 = 1`; prism `0 < 2/329`; Möbius–Kantor `0 < 1/5`; `K_1`: `1 = 1` | holds | none |
| 5.3 `p_i(A) = A_i` | Petersen, cube | Petersen `p_2 = X² − 3`; cube `p_2(3) = 3 = k_2` | holds | none |
| 6.1 Sphere packing; graph form | cube, `C_7`, `e > d`, edgeless graph | `2·4 = 8`; `1·7 = 7`; `e > d`: `∑ k_i = n`, so one vertex; `edist = ⊤` blocks the junk `0` | holds | none |
| 6.2 Lloyd's theorem | all perfect pairs in cube, `C_7`, Petersen, `H(2,3)`; `j = 0` | counts `66, 8, 11, 10` (21 with `0 ∉ I`); repetition code `aQ = (2, 0, 6, 0)`, README says `4` | theorem holds; Check false | R01 |
| 6.3 Lloyd for Hamming codes | Hamming `[7,4]`, repetition, Golay parameters, `t ≥ n`, `w > n` | transform `(256,0,0,0,1792,0,0,0)`; zeros `{4}`, `{8,12,16}`, `{6,9}`, `{9}`; `K_w = 0` for `w > n` | holds; weaker than classical form | C01 |
| 7.1 Moore graphs | `K_1`, `K_2`, `C_5`, `C_7`, Petersen | `mooreBound`: `(k,0) = 1`, `(1,1) = 2`, `(2,2) = 5`, `(2,3) = 7`, `(3,2) = 10` | holds | none |
| 7.2 Bipartite Moore bound | `t = 0, 1`; `k = 1` acyclic; Heawood; cube | bounds `0`, `2`; Heawood `2(1+2+4) = 14`; sketch at radius `< t − 1` gives `3` per side, not `7` | theorem holds; sketch false | R02 |
| 7.3 Even equality case | `K_(3,3)`, Heawood, Tutte's `8`-cage, cube; `m = 8` | `6, 14, 30` vertices; cube `8 > 6`; `2s²` never a square; `egirth ≥ 3` forces `m ≥ 2` | holds | N01 (order) |
| 8.1–8.2 Orders, point graphs | `K_(3,4)`, Heawood, `GQ(2,2)`, `C_(2m)` | Heawood point graph `K_7`, diameter `1 = ⌊3/2⌋`; `GQ(2,2)`: `{6,4;1,3}` | holds | none |
| 8.3 Feit–Higman | `C_(2m)` (`s = t = 1`), eigenvalue formula at `m = 3, 4, 6, 8` | `m = 3`: `−1`; `m = 4`: `s−1`; `m = 6`: `s−1 ± √(st)`; `m = 8`: `s−1 ± √(2st)`, `s−1` | holds | none |
| 8.4 Generalized quadrangles | `(1,1)`, `(1,2)`, `(s,1)`, `(2,2)`, `(2,3)` | `C_4 = (4,2,0,2)`, multiplicities `2, 1`; `K_(3,3)`: `4, 1`; `GQ(2,2)`: `9, 5`; `(2,3)`: `5 ∤ 72` | holds | none |
| 8.5 Higman's inequality | Krein difference symbolically; `(2,4)`, `(2,5)` | `(k+s′)(r+1)² − (s′+1)(k+s′+2rs′) = (s−1)(t+1)(s²−t)`; `(2,5)`: `−6` | holds | none |
| 8.6 Symmetric designs | Fano, `2-(3,2,1)`, `2-(4,3,2)`, `K_(3,3)`, repeated blocks | arrays `{3,2,2;1,1,3}`, `{2,1,1;1,1,2}`, `{3,2,1;1,2,3}`; repeated blocks force `k = v`, excluded | holds both directions | none |
| 9.1 Cometric is `Q`-polynomial | every idempotent order of `H(3,2)`, `H(2,3)`, `H(4,2)`, `J(5,2)`, `J(6,3)`, `J(7,3)`, `ℤ/7`, `ℤ/8`, `K_(3,3)`, `C_4 × K_3`; `d = 0` | orders with either property: `1, 2, 2, 2, 2, 1, 3, 2, 1, 0`; the two agree on every order; `d = 0` both true | holds | none |
| Copied definitions | 27 declarations against the seven owners' files | all identical up to whitespace | agree | none |

- Source locators checked against the text: 0 of 74 in the layers (no cited text could be read legally).
- Library declarations opened at the pins: 7 (`TauCeti.krawtchouk`, `InformationTheory/Coding/Krawtchouk.lean` line 39; `SimpleGraph.IsSRGWith` and `IsSRGWith.ediam_eq_two`, `Combinatorics/SimpleGraph/StronglyRegular.lean` lines 51 and 70; `SimpleGraph.cycleGraph`, `CycleGraph.lean` line 30; `SimpleGraph.IsCycles` and its cycle lemma, `Matching.lean` lines 375 and 526; `niven`, `NumberTheory/Niven.lean` line 107).
- Cross-roadmap citations resolved at the open heads: 33 sections of 8 roadmaps (GraphSpectra 1.2, 2.3, 2.4, 2.6, 3.1; SpectralGraphBounds 1.1; AssociationSchemes 1.1–4.1, 5.1, 6.1, 6.2 and its scope; DelsarteTheoryOfCodesAndDesigns 2.1, 4.1, 4.2; StronglyRegularAndMooreGraphs 1.2, 1.3, 3.1–3.3; BoundsOnCodes 1.2, 5.1; StronglyRegularGraphsAndDesigns 2.4, 5.1–5.3; GraphSymmetryAndCayleyGraphs, "Beyond this roadmap"); all exist and say what is cited.
- Duplication by object: no rank bound for entrywise products, association scheme, distance-regular graph, generalized polygon or Lloyd theorem in the pinned Mathlib or Tau Ceti; no other roadmap, open or on main, states distance transitivity, Feit–Higman, generalized polygons, the spectral excess theorem, Biggs's formula, Neumaier's bound or the even-girth Moore bound.
- Elaboration: `Suggested.lean` elaborates with 42 `sorry` warnings and nothing else. One-tactic probe (`rfl`, `simp`, `infer_instance`, `decide`): none of the 42 closes. Elaborated signatures compared with the README: binders dropped only from definitions that do not use them; every theorem keeps `Fintype`, `DecidableEq` and `DecidableRel`.
- Dependency check: `depcheck: 132 roadmaps, 1464 edges, 0 problem(s)`; no upward or cyclic line.
- Pull-request text: 41 named bullets and 42 Lean names counted in the README, 42 `sorry` in the Lean file, seven open suppliers; the description agrees with the head.
- Headline theorems: all 41 named bullets are stated in `Suggested.lean`; none is declared not statable.

Overlap check: read AssociationSchemes, StronglyRegularGraphsAndDesigns, StronglyRegularAndMooreGraphs, DelsarteTheoryOfCodesAndDesigns, GraphSymmetryAndCayleyGraphs; nothing shared (Neumaier's bound, Biggs's formula and `Q`-polynomial schemes are outside AssociationSchemes and DelsarteTheoryOfCodesAndDesigns by their own scope sections, the even-girth bound outside StronglyRegularAndMooreGraphs, generalized polygons and distance transitivity named by the other two as belonging here).

Source independence: 0 passages compared with 0 sources, since no cited text could be read legally; largest share BH, 36 of 74 locators in the layers; contents not compared with BH (its table of contents could not be read); by the README's own locators the layers do not run through BH in order (Layer 1 §11.2 and §11.4, Layer 2 §12.1, Layer 3 §12.2–12.3, Layer 4 §12.4, Layer 5 §12.11, Layer 6 none, Layers 7–8 §12.9 and §9.6, Layer 9 §11.6), and the order of Layers 2, 3, 4 is forced by the *Needs* lines of 3.1 and 4.1.

Research link: Layers 2–3 and 7–8 are the classical theory behind the Damerell–Bannai–Ito theorem and the Bannai–Ito conjecture (proved by Bang, Dubickas, Koolen and Moulton), and Layer 9 is the entry to `Q`-polynomial schemes and the Terwilliger algebra; rests on the README ("Beyond this roadmap", "Downstream consumers"), no source read.

## Not verifiable

- [BH] Brouwer–Haemers, all locators, including the sampled 1.2, 2.2–2.3, 3.1–3.4, 4.1, 4.2, 5.1–5.3, 7.1, 7.3, 8.3, 8.5, 9.1: the publisher is paywalled, and the sources service did not accept the one other copy tried as an author's page.
- [BCN] Brouwer–Cohen–Neumaier (1.1, 1.3, 6.2, 6.3, 8.3, 8.5, 9.1): paywalled publisher.
- [BVM] Brouwer–Van Maldeghem (2.5, 3.2, 3.3 and the other §1.2 locators): the publisher's page is in no licence class of the sources service.
- [GR] Godsil–Royle (2.4, 7.1, 8.3, 8.5, 8.6): paywalled publisher.
- [Biggs] (7.1, 7.3): the publisher's page is in no licence class of the sources service.
- [Godsil] (6.3, 9.1): no legal source found.
- The wording and arrangement comparisons of the copyright check, for the same reason.

Automatic checks set aside as false positives: the section heading "Library declarations consumed" at the end of `Suggested.lean` was reported as having no declaration under it; it heads the `#check` lines that pin library declarations, which is their permitted use. The report of a definition that chooses its datum was listed twice for one line; it is one point, raised as C03.

## Source issues

- none

## For the human reviewers

- **Not tested.** BH has the largest share of the locators (36 of 74 in the layers) and its text and table of contents could not be read; the wording and arrangement checks were not run against it or any other source.
- **Licence.** No source text was opened, so no copy's status was assessed. The six references are published books (Springer 2012, 1989, 2001; Cambridge 2022, 1993; Chapman and Hall 1993), cited by locator only.
- **Locators.** The page and section numbers for BH differ from those the open roadmaps AssociationSchemes and StronglyRegularAndMooreGraphs give for the same theorems (README lines 149, 348, 1155); which printing each uses is unsettled.
