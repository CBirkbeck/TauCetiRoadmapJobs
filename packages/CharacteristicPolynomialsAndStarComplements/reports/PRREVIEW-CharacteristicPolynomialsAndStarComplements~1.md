# Review of CharacteristicPolynomialsAndStarComplements (pull request #3059 at e50d4a0)

**Verdict:** needs changes

**Summary.** Changes are needed for one reason: Huang's theorem on induced subgraphs of the cube, which 4.4 owns, is already owned by the open roadmap DecisionTreeComplexity (5.1), in a stronger form and with the same signed matrix, so the theorem has two owners. Every statement was recomputed on small cases and none was found false; `Suggested.lean` elaborates with `sorry` as the only warning, and no statement closes with one tactic. There are four small corrections and two format notes, none blocking. Of the seven cited works only Huang's paper could be read, so the textbook locators are unverified, and that is left to the human reviewers.

## R01 (P2) — Huang's theorem on induced subgraphs of the cube has two owners: 4.4 here and DecisionTreeComplexity 5.1

Two roadmaps that each plan the same theorem will each have it proved, on two carriers, and neither names the other. The open roadmap DecisionTreeComplexity (pull request #2746) states in its 5.1, README line 438, "Huang's theorem on induced subgraphs of the cube", with the Lean target `exists_sqrt_le_card_flipBlock_mem` (its `Suggested.lean`, line 206): for every `n`, a set `H ⊆ {0,1}ⁿ` with `2ⁿ < 2|H|` contains a point with at least `√n` neighbours in `H`. Its scope paragraph lists the theorem as owned (line 532), and its route uses the matrix with entry `(−1)^#{j < i | x j}` at `(x, xⁱ)` and `A² = n·1` (lines 445–447), which is `hypercubeSigning` here. The scope paragraph of this roadmap owns "Huang's signing of the hypercube and the sensitivity theorem" (line 546), and 4.4 names only Mathlib's Archive as prior work. The statement here follows from the other in one step: for `d ≥ 1`, `2^d < 2(2^{d-1} + 1)`, and the number of neighbours in `s` is the degree in the induced subgraph.

The smallest change: cite DecisionTreeComplexity 5.1 as the owner of the theorem, and keep `sqrt_le_maxDegree_induce_hypercube` as its translation to `hypercube d` and `SimpleGraph.maxDegree`, saying so in one clause; add the supplier contract and move the theorem from "Owned here" to "Consumed". The named signing with its pattern, `B² = dI` and its multiset spectrum are targets only here (the other roadmap uses them inside a route) and can stay owned. If the author prefers to own the theorem here, that needs the other roadmap to cite this one, which this pull request cannot do.

## C01 — The scope section says Tau Ceti has Cauchy interlacing for principal submatrices; no such declaration is at the pin

"Cauchy interlacing for principal submatrices of Hermitian matrices is formalized in Tau Ceti as well" (Scope and ownership, line 556) names no declaration, and a reader who looks for one finds none. At the pinned Tau Ceti (2fd255d), `TauCeti/Analysis/Matrix/Eigenvalues/Basic.lean` has only rank interlacing (`Matrix.IsHermitian.eigenvalues₀_le_of_rank_sub_le`, line 252), and `TauCeti/Analysis/InnerProductSpace/CourantFischer.lean` has the min–max formula and monotonicity, no statement about a principal submatrix. The route of 4.4 cites RandomMatrices 1.2, so no result depends on the sentence. Name the declaration and its file, or delete the sentence.

## C02 — The sensitivity theorem is located only in a textbook exercise, and the block recursion is attributed to that exercise rather than to Huang

4.4 cites [N–P, Exercise 2.4.6] for the theorem and for the recursion `A_d = [[A_{d-1}, I], [I, -A_{d-1}]]`, while [H] stands in the references with no locator. In Huang's paper (arXiv:1907.00847) the statement is Theorem 1.1 (`n ≥ 1`, `2^{n-1} + 1` vertices, `Δ(H) ≥ √n`), and the recursion, `A_n² = nI` and the multiplicities `2^{n-1}` are Lemma 2.2; Lemma 2.3 is the row-sum bound that the route here replaces by Gershgorin. Cite [H, Theorem 1.1] at the theorem and [H, Lemma 2.2] at the recursion and the spectrum, keeping the exercise as a second locator if wanted.

## C03 — `energy_bounds` assumes a nonempty vertex type, and the three bounds hold on the empty type as well

On the empty type `E = 0`, `m = 0`, `n = 0`: the bounds read `0 ≤ 0 ≤ √0`, and `√(0 + 0·(−1)·1^{2/0}) = 0 ≤ 0` (the determinant of the empty matrix is `1`, and `2/0 = 0` in `ℝ`). The Conventions say every statement holds for the empty type unless a hypothesis excludes it, so "On a nonempty vertex type" in 3.3 (line 353) and `[Nonempty V]` in the Lean statement suggest a failure that does not occur. Drop the hypothesis, or say that it is kept for the reading of `2/n`.

## C04 — The description does not mention DecisionTreeComplexity

The description's "Closest roadmaps" and "Suppliers, by section" lists name seven roadmaps and not DecisionTreeComplexity, which states the theorem of 4.4 (R01). Once R01 is settled, the text that would be right adds, under the open suppliers, "DecisionTreeComplexity 5.1 (Huang's theorem; used in 4.4)", and the same roadmap to the list of suppliers that merge first. The supplier list for GraphSpectra also omits 3.8, which the introduction to Layer 3 cites.

## N01 — `Matrix.derivative_charpoly` stands after Layer 4 in `Suggested.lean`

The statement of 1.3 is at line 525, after the star-complement and sensitivity statements; moved before the Layer 2 section it would follow the README's order.

## N02 — GraphSpectra 3.8 is cited in the introduction to Layer 3 but is not in the supplier contracts

The contracts list 1.7 as "cited in the introduction to Layer 3"; 3.8 (the complement of a regular graph), cited in the same sentence at line 271, would stand beside it.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 elementary edge sets, counts | `∅`; matching of `C₄`; `K₃`; `P₃` | `(c,z)`: `(0,0)`; `(2,0)`; `(1,1)`; `P₃` fails the degree-1 clause, formulas give `(1,0)` | agrees with Checks | none |
| 1.2 Harary `det_adjMatrix` | empty type; `K₁`; `K₂`; `K₃`; `K₄` | left `1, 0, −1, 2, −3`; right `1`, empty sum `0`, `(+1)(−1)`, `(−1)(−2)`, `3 − 6` | equal | none |
| 1.2 Sachs `coeff_charpoly_adjMatrix` | `K₃` `j=2,3`; `C₄` `j=4`; `j=0` | `−3`, `−2`; `1+1−2 = 0`; `1` from `F = ∅` | equal to `t³−3t−2`, `t⁴−4t²` | none |
| 1.2 first coefficients | `K₃`; `K₂` (n < 3) | `0, −3, −2`; for `K₂` index `n−3 ↦ 0` gives `−1 ≠ 0` | hypothesis `n ≥ 3` needed | none |
| 1.3 `Matrix.derivative_charpoly` | empty; `[[a]]`; `K₂`; `K₃` | `0 =` empty sum; `1 = 1`; `2t = t+t`; `3t²−3 = 3(t²−1)` | equal | none |
| 1.3 isolated vertex, leaf | `K₂ ⊕ K₁`; `P₃` leaf; `P₃` centre | `t³−t = t(t²−1)`; `t(t²−1)−t = t³−2t`; centre gives `t³−t ≠ t³−2t` | degree 1 needed | none |
| 1.3 sparse expansion | row 0 then column 0 Laplace | `M₀₀ det M[≥1] − M₀₁ M₁₀ det M[≥2]` | equal | none |
| 2.1 `natTrailingDegree_matchingPolynomial` | empty; `P₃`; `C₄` | `0+0=0`; `1+2=3`; `0+4=4` | equal | none |
| 2.2 nullity and determinant of forests | empty; `K₂`; `P₃`; `P₄`; `K_{1,3}`; `C₄` | `det`: `1, −1, 0, 1, 0`; `count 0`: `1` (`P₃`), `2` (`K_{1,3}`); `C₄` has `count 0 = 2 ≠ 0` | forest hypothesis needed | none |
| 3.1 `adjSpectrum_tensorProd` | `K₂×K₂`; `K₃×K₂` | `{1,−1,−1,1}`; `{2,−2,1,−1,1,−1}` = spectrum of `C₆` | equal | none |
| 3.1 `lapSpectrum_join` | `K₁∨K₁`; `K_{1,3}`; `K_{2,3}`; `P₃∨K₂`; `n₂=0` | `{0,2}`; `{0,1,1,4}`; `{0,2,2,3,5}`; `{0,3,5,5,5}`; for `n₂=0` the formula lists `n₁` as an eigenvalue of an arbitrary `G` | equal; nonempty needed | none |
| 3.2 `eval_charpoly_compl` | empty; `C₄`; `P₃` at `t=0.37` | `1=1`; `(t+1)²(t−1)(t+3)·(t−1)/(t+3) = (t²−1)²`; both `−0.3193`; equal weights give `−3.799` | equal | none |
| 3.2 `hasSum_walkCount_mul_pow` | empty; `K₁`; derivation from complement formula at `−(t+1)/t` | `0 = t⁻¹(1−1)`; `1 = t⁻¹((t+1)−1)`; `(−1)ⁿp_Ḡ/p_G − 1 = t·n∑β²/(1−tθ)` | equal | none |
| 3.3 `energy_bounds` | empty; `K₁`; `K₂`; `K₃`; `C₄`; `K_{1,3}` | `0`; `0`; `2 = 2 = 2`, `√4 = 2`; `2√3 ≤ 4 ≤ √18`, `√15.52 ≤ 4`; `4 = 4 ≤ √32`, `√8 ≤ 4`; `2√3 = 2√3 ≤ √24` | hold; hold on empty type too | C03 |
| 3.3 `energy_eq_two_mul_of_rat` | `K₂`, `K₃`, `P₃` | `2`, `4`, `2√2` irrational | consistent | none |
| 4.1 `Interlaces`, `IsTightInterlacing` | `{1,−1}` in `{√2,0,−√2}`; `{2}` in `{2,−1,−1}`; `{4/3}`; `{0,0}` in `{1,−1}` | `√2≥1≥0`, `0≥−1≥−√2`; tight `k=1`; not tight; `1≥0≥1` false | Lean bodies match README | none |
| 4.2 tight interlacing | `K₃`, `S=𝟙/√3`; `C₄` two columns; `P₃`; `ι` empty; `S` orthogonal | `SᵀAS = 2`, `AS = 2S`; `diag(2,−2)`; `4/3`, `AS=(1,2,1)/√3 ≠ (4/3)S`; trivial; `SSᵀ = I` | holds; fails without tightness | none |
| 4.3 `isStarSet_iff`, eigenspace, reconstruction | `K₂` `θ=1`; `K₃` `θ=−1` `X={0,1}` and `X={0}`; `X=∅`; `X=univ` | `1 = 1·1·1`; `−J₂ = B(−1)Bᵀ`; `X={0}`: size `1≠2`, `C` singular; `X=∅` iff `θ` not eigenvalue; `X=univ` forces `A=0`, `θ=0` | both directions agree | none |
| 4.3 `card_le_of_isStarSet` | `K₂`, `2K₂`, `3K₂`, `K₂⊕K₁`, `C₅`, Petersen (`θ=1`), `K₃` (`θ=2`), `P₃` (`θ=√2`), `θ` not an eigenvalue | `(n, t(t+1)/2)`: `(2,1)`, `(4,3)`, `(6,6)`, `(3,3)`, `(5,6)`, `(10,15)`, `(3,3)`, `(3,3)`, `(n, n(n+1)/2)` | only the two stated exceptions fail | none |
| 4.4 `hypercubeSigning`, `B² = dI`, spectrum | `d=0,1,2`; two paths `i<k` | `[0]²=0`; `[[0,1],[1,0]]²=I`; signs `+,+,+,−`; products `s_i·(−s_k)` and `s_k·s_i` cancel | holds; `d ≥ 1` needed for the spectrum | none |
| 4.4 `sqrt_le_maxDegree_induce_hypercube` | `d=1`; `d=2`; even-weight set; against Huang Theorem 1.1 and DecisionTreeComplexity 5.1 | `K₂`: `1≥1`; `P₃`: `2≥√2`; `2^{d−1}` independent vertices; `2^d < 2(2^{d−1}+1)` | true; second owner | R01, C02 |

- Source locators checked against the text: 4 (Huang, Theorem 1.1 at H line 29, Lemma 2.1 at H line 112, Lemma 2.2 at H line 121, Lemma 2.3 at H line 142); the 48 locators into the six textbooks were not read.
- Library declarations opened at the pins: `Matrix.charpoly_coeff_eq_sum_minors` (`Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean` 456), `SimpleGraph.Embedding.submatrix_adjMatrix` (`Mathlib/Combinatorics/SimpleGraph/AdjMatrix.lean` 289), `eigenvalue_mem_ball` (`Mathlib/LinearAlgebra/Matrix/Gershgorin.lean` 30), `LinearMap.IsSymmetric.re_inner_apply_self_eq_sum_eigenvalues_mul_sq` (`TauCeti/Analysis/InnerProductSpace/CourantFischer.lean` 152), and 16 further cited names located by file and line; all 46 `#check` lines elaborate.
- Duplication by object in the pinned libraries: no derivative of `Matrix.charpoly`, no tensor product or join of simple graphs, no graph energy, no star set; Huang's theorem only in Mathlib's Archive, outside the library.
- Cross-roadmap citations resolved at the suppliers' heads or on main: GraphSpectra 1.2, 1.7, 1.8, 2.3, 2.6, 3.2, 3.8, 3.9; MatchingPolynomial 1.1, 2.2; MatchingTheory 1.1; TuttePolynomialAndArrangements 4.1; SpectralGraphBounds 1.1; LaplacianEigenvaluesOfGraphs 1.1; RandomMatrices 1.2 (main). The 17 copied definitions and instances agree with their owners' `Suggested.lean` text.
- Dependency check: `depcheck: 132 roadmaps, 1464 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration: 28 `sorry` warnings, no error, no other warning. Elaborated types compared with the README statements for all 55 declarations; the five definitions that drop `Fintype` or `DecidableEq` binders (`onesVec`, `edgeDegree`, `tensorProd`, `join`, `adjBlock`) do not use them; the casts in `energy_bounds` are real, with real subtraction in `n − 1`.
- One-tactic probe (`rfl`, then `simp`) on a copy: none of the 28 statements closes. Headlines of the Summary: all stated in `Suggested.lean`.
- Overlap check: read GraphSpectra, MatchingPolynomial, LaplacianSpectraAndSpanningTrees, SpectralGraphBounds, GraphSymmetryAndCayleyGraphs, SpanningTreesAndShortestPaths, and also MatchingTheory, TuttePolynomialAndArrangements, LaplacianEigenvaluesOfGraphs, EquitableOperatorReduction, SpectralQuantumWalks, DecisionTreeComplexity; shared: Huang's theorem on induced subgraphs of the cube, owner DecisionTreeComplexity 5.1 (R01); nothing else shared.

Source independence: 6 passages compared with 1 source (H), none shared; largest share CRS, 23 of 48 locators; contents of CRS not read. By the README's own CRS locators (§2.3 in Layer 1, none in Layer 2, §§2.1, 7.1, 9.2 in Layer 3, §§5.1, 5.3 in Layer 4) the layers are not a run of its chapters in order; the table of contents itself was not compared.

Research link: 4.4 is the theorem of Huang (2019) that settled the sensitivity conjecture (H, read); 4.3 is the star-complement technique and the multiplicity bound of Bell and Rowlinson as given in Cvetković, Rowlinson and Simić (2010), and 4.2 the tight interlacing of Brouwer and Haemers (2012) (README citations, not read).

## Not verifiable

- [CRS] (1.1, 1.2, 1.3, 3.1, 3.2, 3.3, 4.3, 23 locators): no legal copy reached; the publisher's page is closed.
- [BH] (1.3, 3.1, 3.3, 4.1, 4.2, 12 locators): the publisher is paywalled, and a copy on what looks like an author's page could not be confirmed as such.
- [B] (1.1, 1.2, 1.3), [Ba] (2.2, 3.3), [N–P] (4.4), [St] (3.3): no legal copy reached.
- The two misprints the README reports, in [CRS, Theorem 7.1.9] (a missing factor for the eigenvalue `0`) and in [St, Theorem 8.14] (`4m` for `2m`): the sources were not read; the README's corrected formulas are the ones computed above (`K₂`: `√6 > 2` for the `4m` form).
- Seeded sample: for 1.1 to 4.3 the mathematics was recomputed and the locators were not checked against the texts; for 4.4 the statement was checked against [H].

Automatic checks set aside as false positives: Mathlib's `Matrix.det_apply'`, which the README cites as a Mathlib lemma and `Suggested.lean` pins, was read as a name of this roadmap's own; the heading over the closing block of `#check` lines was read as a section without declarations, which it is by design.

## Source issues

- none

## For the human reviewers

- **Not tested.** [CRS] carries 23 of the 48 locators and could not be read: wording and arrangement were not compared with it, nor with [B], [Ba], [BH], [N–P], [St]. Only Huang's paper was compared.
- **Licence.** [BH]: a PDF of the book is on a personal page at CWI that appears to be Brouwer's; the sources service could not confirm it as an author's page, so it was not read.
- **Scope.** The sources are six textbooks and one refereed article; the only locator for the sensitivity theorem in 4.4 is an exercise of a 2025 textbook (C02).
