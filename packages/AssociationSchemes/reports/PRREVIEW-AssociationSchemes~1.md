# Review of AssociationSchemes (pull request #2997 at d4cc304)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement, Check and route was recomputed (degenerate cases `d = 0`, `k = 0, 1`, `n = 2k`, the empty set, disconnected graphs) and none failed; `Suggested.lean` elaborates with `sorry` as the only warning and no theorem closes in one tactic. There are three small corrections and one format note, none blocking. One thing is left for the human reviewers: Brouwer–Haemers, the source with the largest share of the locators, could not be read from a legal place, so its locators, wording and table of contents were not compared.

## C01 — The *Needs* line of 6.2 cites a remark that 6.2 does not contain

In 6.2 (README line 603) the *Needs* line lists "6.1 for the remark that a distance-regular graph gives a metric scheme", but no such remark stands in 6.2, and the layer's Dependencies (line 614) say "6.2 uses 1.1". An implementer cannot tell whether 6.2 waits for 6.1. Either add the remark as a sentence of 6.2 (for a distance-regular graph of diameter at least 1, class 1 of `distRel G` is adjacency, so the scheme satisfies the first condition of 6.1), or drop the 6.1 item from the *Needs* line.

## C02 — The scope paragraph speaks of definitions of cometric schemes that no layer gives

"`Q`-polynomial (cometric) schemes beyond the definitions" (README line 660) suggests that the definition is a target; no layer defines a cometric or `Q`-polynomial scheme (6.1 treats only the metric / `P`-polynomial side). Dropping "beyond the definitions" makes the sentence agree with the layers.

## C03 — The step cited for uniqueness of the idempotents is on p. 9 of Godsil, not p. 8

In the API of 1.2 (README line 147) the uniqueness argument ("each member of either family is the sum of the members of the other that it dominates") is located at "Godsil, §1.4, p. 8, proof of Theorem 1.4.1". The theorem is stated on p. 8, but the step used, that every idempotent is the sum of the minimal idempotents below it, is in the part of the proof on printed p. 9 (GODSIL lines 453–459). "pp. 8–9" would be right.

## N01 — Several Checks and the References narrate how the text was produced

"All of the above was recomputed in exact arithmetic…" (5.1), "Exhaustive search … confirms" (5.2), "Both properties were compared for every ordering…" (6.1), "Every graph on at most six labelled vertices was tested" (6.2), "(Proved here.)", "no proof was opened", "their papers were not opened". A Check would state the fact (for example "for `(n, k) = (5, 2), (6, 2), (7, 3)` the maximum intersecting families are exactly the `n` stars"), and the References would list what is cited.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 `IsAssocScheme` | path `a−b−c`; `ℤ/3` with `y−x`; `d = 0`; empty type | path: 1 vs 2 points `z` for `i=j=1` on class 0; `ℤ/3` fails only symmetry; `d=0` forces one point | sound; wrong models excluded |
| 1.2 `exists_isPrimitiveIdempotents` | 4-cycle; non-algebra projection; `E_0 = I/n` | `m = (1,2,1)`; rogue projection has diagonal `(1/2,0,1/2,0)`; `(I/n)² ≠ I/n` for `n ≥ 2` | sound; GODSIL Thm 1.4.1 (line 406), 1.5.1 (line 473), `E_0` (line 516) |
| 2.1 two expansions, `P`, `Q` | `H(2,2)`, `J(5,2)` | `J(5,2)`: `P` rows `(1,6,3),(1,1,−2),(1,−2,1)`; `Q_ji = m_i P_ij / v_j` gives `(1,4,5),(1,2/3,−5/3),(1,−8/3,5/3)` | agrees; GODSIL (2.1.1)–(2.1.2) lines 568–573, (3.1.1) line 931 |
| 2.2 `PQ = QP = nI`, orthogonality | `J(5,2)`, `J(7,3)` | `18−8−10 = 0`; unweighted `14`; `9+16+5 = 30 = 10·3`; `J(7,3)` `Q` rows recomputed from `m=(1,6,14,14)`, `v=(1,12,18,4)` | agrees; GODSIL `PQ = vI` line 603, `vD_v = P*D_mP` line 942 |
| 2.3 charpoly of `L_j` | Petersen class of `J(5,2)`; cube | `L_2` rows `(0,0,3),(0,2,1),(1,2,0)` from `λ=0, μ=1`; trace `2 = 3−2+1`; cube spectrum `3,1,−1,−3` | agrees; index convention `(PL_j)_ik = P_ij P_ik` checked |
| 3.1 Krein expansion and sign | `J(5,2)`; `H(3,2)`; `(28,9,0,4)`; `(16,5,0,2)` | `q^k_11 = (4, 2/9, 20/9)`; `q^k_22 = (5, 20/9, 20/9)`; `(216 − 1000/3 + 128/3)/168 = −4/9`; Clebsch `0` | agrees; normalisation matches GODSIL line 728, Thm 2.4.2 line 759 |
| 4.1 Delsarte's inequalities | Fano in `J(7,3)`; star; `{00,01}`; `Y = ∅` | `(1,0,6,0)Q = (7,0,0,28)`; `(1,8,6,0)Q = (15,20,0,0)`; `(2,2,0)`; empty: `0 = 0` and `E_j·0 = 0` | sound, both directions of the equality clause at `∅` |
| 4.2 clique–coclique | `H(3,2)`, `R={3}`; rook `3×3`; `J(5,2)`; `0 ∈ R`; empty sets | `2·4 = 8`; `3·3 = 9`; `2·4 = 8 < 10`; route: `xᵀNx = |C||D|/n ≥ |C|²|D|²/n²` | sound; GODSIL Thm 3.3.1 line 1018, (3.3.1) line 1073 |
| 4.3 clique bound | Petersen; `T(5)`; cube with `−1` and `−3`; `C = ∅`; `|C| = 1`; `i = 0` | `≤ 2.5`; `≤ 4` attained; `≤ 4` and `≤ 2`; `P_ji ≤ v_i`; `0 ≤ v_i`; `P_j0 = 1` not negative | sound; GODSIL Lemma 3.4.1 line 1120 |
| 5.1 Johnson eigenmatrix | `J(7,3)`, `J(5,2)`, `J(6,3)`, `J(2,1)`, `k=0`, `(3,2)` | `i=1`: `(k−j)(n−k−j)−j` = `12,5,0,−3`; `i=k`: `4,−3,2,−1`; `J(2,1)`: `−1`; `k=0`: value 1, trace 1; `(3,2)`: class 2 empty | sound; counting in step 5 rederived; `WWᵀ = (n−2s)I + W′ᵀW′` checked |
| 5.2 EKR uniqueness | `k=0`; `k=1`; `(4,2)`, `(6,3)`; `(5,2)`; step 5 case split | `C(n−1,0) = 1 ≠ 0`; one singleton; `3 = C(3,1)`, `10 = C(5,2)` non-stars; `10·2/5 = 4`; `|B∩T|` range `≥ 2` in all four cases | sound; ELLIS Thm 1.3 line 97, Thm 1.5 line 367, Kneser eigenvalues line 437 |
| 6.1 metric iff `P`-polynomial | `d=0`; `d=1` (`K_n`); `H(3,2)` orders; `J(7,3)` order `3,1,2` | `d=0`: empty graph, `f_0 = 1`, both hold; `O_4` distances `1,2,3` ↔ `|A∩B| = 0,2,1` | sound; GODSIL `J(2k+1,k)` line 704 |
| 6.2 distance-regular iff scheme | one vertex; empty type; `2K_1`; `2K_3`; prism; count ≤ 6 vertices | `2K_1`: counts all 0, not connected; `2K_3`: `b_0 = 2` vs `0`; prism `b_1 = 1` vs `2`; `1+1+2+8+64+1024+32768 = 33868`; `1+1+1+1+3+1+12+1+60+10+15 = 106` | sound; right-hand `Connected` redundant only through `diam = 0`, as the README says |
| C01–C03 | 6.2 text, scope paragraph, GODSIL pp. 8–9 | no "metric" remark in 6.2; no cometric definition in any layer; step at GODSIL line 453 (printed p. 9) | corrections above |

- Source locators checked against the text: 21 in GODSIL (all agree, one page off: C03), 4 in ELLIS (read at arXiv v8; numbering and pages agree with the README's v3 locators).
- Library declarations opened at the pin: 30 Mathlib declarations of the supplier contracts, each present in the file named (for example `Matrix.PosSemidef.hadamard`, `Mathlib/Analysis/Matrix/Order.lean` line 214; `Finset.erdos_ko_rado`, `Mathlib/Combinatorics/SetFamily/KruskalKatona.lean` line 346, hypothesis `r ≤ n / 2`; `SimpleGraph.ediam_eq_top_of_not_connected`, `Mathlib/Combinatorics/SimpleGraph/Diam.lean` line 179, with `[Nonempty α]`); `TauCeti.krawtchouk q n w j` (`TauCeti/InformationTheory/Coding/Krawtchouk.lean` line 39) is `K_w(j)`, so `P_ij = krawtchouk 2 n j i` is the right argument order. Neither library has association schemes, Johnson schemes, Kneser graphs or distance-regular graphs.
- Cross-roadmap citations resolved at the open heads: SpectralGraphBounds 1.1 (`adjEigenvalues`, `smallestEigenvalue`) and 3.2 (`indepNum_mul_le`, `card_neighbor_inter_eq_of_eq`, signatures as the contract describes); TopologicalCombinatorics 3.1 (`kneserGraph`); StronglyRegularAndMooreGraphs Layer 1 and its scope (Krein conditions and schemes left out); BoundsOnCodes 5.1, 5.2; PaleyGraphsAndCharacterSums 3.1; LovaszThetaFunction 2.1, 4.3.
- Dependency check output: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates, 12 `sorry` warnings and nothing else; `#check @name` compared for the six declarations with their own binders (6.1, 5.1, 6.2, 4.2, `IsDistanceRegular`, `distRel`); the binders reported as dropped are instances the definitions do not use. One-tactic probe (`rfl`, `simp`, `infer_instance`): none of the 12 theorems closes.
- Headline theorems: all 12 stated; none forced through a stand-in; no padding.
- Automatic checks: all passed. No change outside the roadmap folder.
- Overlap check: read StronglyRegularAndMooreGraphs, SpectralGraphBounds, PaleyGraphsAndCharacterSums, LovaszThetaFunction, EquiangularLinesAndTwoGraphs (and BoundsOnCodes, TopologicalCombinatorics); nothing shared. Delsarte's inequalities for Hamming codes stay with BoundsOnCodes 5.1; the scheme-level inequality of 4.1 is owned here and the README says how the two relate.

Source independence: 25 passages compared with 2 sources (GODSIL, ELLIS), none shared; largest share Brouwer–Haemers, 22 of 41 locators in the layers, whose text and table of contents could not be read; contents compared with GODSIL (Chapters 1–3 against Layers 1–4): independent, the order is forced by the dependency lines (2.1 needs 1.2, 3.1 and 4.1 need 2.1) and Layers 5 and 6 have no counterpart there.

Research link: Layers 1–4 are the Bose–Mesner and linear-programming theory of Delsarte as presented in Godsil (2010) and Brouwer–Haemers (2012); Layer 5 is the equality case of Erdős–Ko–Rado by Lovász's spectral method (Ellis 2021, §1); rests on the README and on GODSIL and ELLIS as read.

## Not verifiable

- Brouwer–Haemers, *Spectra of Graphs*: no legal copy could be fetched (the authors' copy is on a page whose address does not name an author; the publisher's page is paywalled). Unchecked locators: §11.1 and Theorem 11.1.1, p. 161 (1.1); §11.2, pp. 162–163 (1.2, 2.1); Theorem 11.2.1 (2.1, 2.2, 2.3) and 11.2.2 (2.3); the `J(7, 3)` example, p. 164 (2.2, 4.1); Theorems 11.3.1–11.3.3 (4.1, 4.2); §11.4, Theorems 11.4.1 (vi), 11.4.2 (3.1); Theorem 11.6.1 and the `H(4, 2)` example (6.1, Layer 2 Examples); §11.7 Exercise 3 (4.3); §12.1 and §12.4.2 (6.2, 5.1). The mathematics of each of these targets was verified independently (table above).
- The attributions to Bose–Shimamoto, Delsarte, Scott and Seidel in the Conventions and in 3.1 rest on Brouwer–Haemers and were not checked.

## Source issues

- **Misprint** in GODSIL at Theorem 1.5.1, proof, printed p. 10: the source says items (c) and (d) are proved where it has shown the eigenvector property and the sum to the identity; it should be items (b) and (c); affects nothing.
- **Misprint** in GODSIL at §2.3, printed p. 16, against §2.5, printed p. 20: the source says the intersection matrix has entries `p_{i,j}(k)` at position `(j, k)` and later `p_{r,j}(i)` at position `(i, j)`, which are transposes; it should be one convention; affects nothing.
- **Misprint** in ELLIS at §1, the paragraph on Kneser graphs, printed p. 8 (arXiv v8): the source says `V_i` is the orthogonal complement of `V_{i−1}` in `U_i`; it should be the orthogonal complement of `U_{i−1}` in `U_i`; affects nothing.

## For the human reviewers

- **Not tested.** Brouwer–Haemers has the largest share of the locators (22 of 41 in the layers) and could not be read legally here; its locators, wording and table of contents were not compared with the README.
- **Licence.** GODSIL is a set of unpublished lecture notes (©2010) read on the author's own page; it carries 16 of the 41 locators.
- **Scope.** The two suppliers, SpectralGraphBounds and TopologicalCombinatorics, are open roadmaps of the same author, not on main; this roadmap merges after both (stated in the description).
