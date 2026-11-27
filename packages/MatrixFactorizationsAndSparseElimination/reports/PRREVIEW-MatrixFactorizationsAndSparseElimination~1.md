# Review of MatrixFactorizationsAndSparseElimination (pull request #3235 at 2d712c5)

**Verdict:** accepted

**Summary.** Accepted: no statement was found false, vacuous or unowned. Every headline was recomputed on degenerate and random instances (orders 0 to 8, singular matrices, zero pivots, ties, `A = 0`), every worked Check was recomputed by hand or by machine, and `Suggested.lean` elaborates with `sorry` as its only warning. There are three small corrections and four format notes, none blocking. None of the seven cited texts could be read from a legal copy, so no locator, wording or arrangement was checked against a source; that, and the relation to the author's earlier formalization, is left to the human reviewers.

## C01 — The Hermitian case of §1.2 is Mathlib's root lemma after a reindexing, so as a target it asks an implementer for almost nothing

`isEigenvalueEnumeration_eigenvalues₀` (README §1.2, line 156; `Suggested.lean` line 160) is listed among the sorried targets, with the route "the spectral theorem gives a unitary diagonalization, so the characteristic polynomial is `∏ (X − λᵢ)`". The pinned Mathlib already has both steps: `Matrix.IsHermitian.charpoly_eq` and `Matrix.IsHermitian.roots_charpoly_eq_eigenvalues₀` (`Mathlib/Analysis/Matrix/Spectrum.lean`, lines 157 and 168), the second being `A.charpoly.roots = Multiset.map (RCLike.ofReal ∘ hA.eigenvalues₀) Finset.univ.val`. In a separate test file the target closes with `rw [hA.roots_charpoly_eq_eigenvalues₀, Fin.univ_val_map]; congr 1; simp [Fintype.card_fin]` after unfolding the definition.

The smallest change: treat it as the other convention Checks are treated (prove it in place and call it a proved Check in the README and the module docstring), and replace the route by the name of the Mathlib lemma in the supplier contracts.

## C02 — The reason given for `IsUnit A` in the condition-number headline is not the reason: with Lean's junk values the identity also holds for singular matrices

The second Check of §1.1 (line 132) says that for `diag(1, 0)` Tau Ceti's `κ` is `0`, "which is why the headline assumes `IsUnit A`". For a singular matrix of order `n + 1` the right-hand side of `conditionNumber_eq_singularValues_div` is `σ₀ / σₙ` with `σₙ = 0` (the singular values vanish beyond the rank, as the Conventions say), and real division by zero is `0`; so for `diag(1, 0)` both sides are `0 = 1 / 0 = 0`, and the same holds for every singular `A`. The hypothesis is therefore harmless but not needed for the stated equality, and the Check does not show what it says it shows.

Either keep the hypothesis and reword the Check ("both sides are the junk value `0` at a singular matrix; the hypothesis is kept so that the statement reads as the mathematical one"), or drop the hypothesis and say that the identity holds with junk values on both sides.

## C03 — The scope section does not place Layer 6 against the open roadmap RegularizationOfLinearIllPosedProblems, which states the same equivalence for operators

RegularizationOfLinearIllPosedProblems §2.1 (an open new roadmap) defines a predicate of the same name, `IsLeastSquaresSolution`, for a bounded operator between Hilbert spaces over `ℝ` or `ℂ`, and states that least-squares solutions are the solutions of the normal equation `K* K x = K* y`. The first equivalence of `isLeastSquaresSolution_tfae` (§6.1) is its finite-dimensional matrix case (and, as the README's route says, a translation of Mathlib's `ContinuousLinearMap.forall_norm_sub_apply_le_iff_adjoint_apply_sub_eq_zero`). Neither README names the other, so a reader cannot tell which owns the complex case.

One sentence under "Left to other roadmaps" would settle it, for example: least squares for bounded operators on Hilbert spaces and the generalized inverse as a partial map belong to RegularizationOfLinearIllPosedProblems §2.1; this roadmap owns the matrix form with the projector, rank and QR statements. No statement here needs to change.

## N01 — The first Check of §1.1 does not tell the spectral norm from the Frobenius norm

On `[[3, 0], [4, 0]]` both are `5`, and on `[[1, 1], [1, 1]]` both are `2` (rank one). The identity matrix of order `2` would separate them: spectral norm `1`, Frobenius norm `√2`.

## N02 — "The two conventions agree" in §1.2 (line 147) covers the notation for the multiset only

EigenvalueAndSingularValueInequalities enumerates the roots of `LinearMap.charpoly`; the proved Check compares two ways of writing the multiset for `Matrix.charpoly`. The remaining step is Mathlib's `charpoly_toLin'` (`Mathlib/LinearAlgebra/Charpoly/ToMatrix.lean`, line 91); naming it would make the sentence complete.

## N03 — The docstring of `growthFactor` says that every statement excludes `A = 0`

`IsPartialPivotRun.growthFactor_le_two_pow` and `growthFactor_le_two_of_diagDominant` do not exclude it, and need not: with the junk value `0` both hold at `A = 0`. "Which the equalities exclude and the bounds tolerate" would be accurate.

## N04 — The supplier contracts have no subsection for EigenvalueAndSingularValueInequalities

It is listed among the inputs in the scope section (Conventions, the enumeration of eigenvalues) but has no `### From …` entry beside the other three roadmaps.

## Questions for the author

- §4.4, third Check (line 367), says that [H, Theorem 9.8] omits the nonsingularity of `A`. The 1996 edition could not be read. Is the omission in that edition's statement, and is it worth one clause saying which edition, since a reader with a later edition may find the hypothesis present?
- §7.3 attributes "an edge of the filled graph makes the larger endpoint an ancestor" to Liu, citing [DRS, §4.1, p. 397]. The survey could not be read; does it give this attribution at that place?

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 spectral norm, condition number, radius bounds | `[[3,0],[4,0]]`; `diag(1,1/2)`; `diag(1,0)`; `[[0,−2],[2,0]]` | norms 5, 4, 5, entry 4; κ = 2 = 1/(1/2); singular: 0 = 1/0 = 0; eigenvalues ±2i, norm 2 | true; C02, N01 |
| 1.2 enumerations | `[[2,i],[−i,2]]`; nilpotent 2×2; `n = 0` | eigenvalues 3, 1, det 3, trace 4; only (0,0), ρ = 0; empty range = empty spectrum (zero ring) | true; C01 |
| 2.1 `existsUnique_isLU_iff`, leading minors | `n = 0, 1`; `[[2,1],[4,5]]`; `[[1,1],[1,1]]`; zero 2×2; `[[0,1],[1,0]]` | minors 2, 6 = 2·3; singular case unique; zero matrix: `L` free; antidiagonal: `u₀₀ = 0`, `l·u₀₀ = 1` impossible | true |
| 2.2 pivots, minors, `A = L U`, Schur complement | 6,000 random rational matrices, orders 0–5, many singular; `[[1,2],[3,4]]`; 3×3 Check | pivots 0..n−2 nonzero ⇔ minors nonzero in all; minors = pivot products; 4,122 cases `L U = A`; pivot −2; `l₂₁ = 0` | true |
| 2.3 `PosDef.isLU_ldl` | `[[4,2],[2,3]]`; `[[1,2],[2,1]]` | `L = [[1,0],[1/2,1]]`, `D = diag(4,2)`, `G = [[2,0],[1,√2]]`; indefinite: `U` diagonal 1, −3 | true |
| 3.1 runs, `P A`, factorization, nonsingularity | 6,000 random matrices × two tie rules, incl. singular and `n = 0`; `p = (1,2,2)` | reduced `P A` = permuted `B k` at every `k`; `P A = L U`, multipliers ≤ 1; `det U ≠ 0 ⇔ det A ≠ 0`; rows 1,2,0 vs 2,0,1 | true |
| 4.2 stage and row bounds | same 12,000 runs; `n = 0, 1`; `A = 0`; `[[1/100,1],[1,1]]` | `entryMax (B k) ≤ 2^min(k,n−1)·entryMax A` always; row bound always; `0 ≤ 1`; entry −99 | true |
| 4.3 Wilkinson | `n = 1..7` smallest index; `n = 2..8` largest index | no interchange, last column `2^i`, growth `2^(n−1)`; largest index: growth 2 for all `n ≥ 3`, `p₀ = n−1` | true |
| 4.4 diagonal dominance | all matrices of orders 2, 3 with entries in {−2..2}, dominant by rows or columns | 80,294 matrices, 17,894 singular (the README's counts); trailing dominance, growth ≤ 2, minors, multipliers ≤ 1, no interchange: no failure | true |
| 4.5 positive definite growth | `[[4,2],[2,3]]`; `[[1,2],[2,1]]`; `n = 0`; `k = n` | reduced `[[4,2],[0,2]]`, growth 1; indefinite −3, growth 3/2; `0/0 = 0`; empty block positive definite | true |
| 5.1 reflectors | `v = 0`; `x = (3,4)`; `x = 0`; `x = c·e`; `x = (i,1)` with real `γ` | `τ = 2/0 = 0`, `H = I`; `v = (8,4)`, `Hx = (−5,0)`; `vᴴx` real with phase; real choice: second entry `−i/√2 ≠ 0` | true |
| 5.2 QR | `[[3],[4]]`; `A = 0`; `n > m`; `n = 0`; phases `e^{iθ}` | `Q = (3/5,4/5)`, `R = 5`; rank-deficient: `Q` free; `Qᴴ Q = Iₙ` impossible for `n > m`; phase pair is a second factorization | true |
| 6.1 least squares | `[[1],[1]]`, `b = (1,3)`; `[[1],[i]]`, `b = (1,0)`; `A = 0`; `n = 0` | `x = 2`, residual (−1,1); `Aᴴ A = 2`, `x = 1/2`, `Aᵀ A = 0`; all `x` solve, rank 0 = n only for n = 0 | true; C03 |
| 6.2 QR solution | `[[3],[4]]`, `b = (1,0)`; `A = 0`, `R = 0` | `x = 3/25`; without `det R ≠ 0` the formula gives 0 while every `x` solves | true |
| 7.1 fill-path, Parter, chordal | 3,000 random graphs, 0–8 vertices; star, path | fill-path description = direct elimination on all pairs; larger neighbours pairwise adjacent in all; star complete, path `b,a,c` fills `{a,c}` | true |
| 7.2 fill of factorizations | 3,830 random sparse rational matrices with nonzero proper minors; `n I − Adj`; `A = 0`; 3×3 cancellation | nonzeros of `L`, `U` inside filled graph in all; M-matrix pattern = filled graph in all 3,830; `l₂₁ = 0` with complete fill | true |
| 7.3 tree, row subtrees, reorderings | same 3,000 graphs; 9,000 random topological reorderings; path with 0, 1 exchanged | ancestor property and row-subtree equivalence on all pairs; filled graph and parents preserved in all 9,000; exchange creates `{1,2}` | true |

- Source locators checked against the text: 0 of 64 (no cited text could be read from a legal copy).
- Library declarations opened at the pin: `TauCeti.conditionNumber` (`TauCeti/Analysis/Normed/Ring/StableSequence.lean:55`), `TauCeti.cholesky` and its `LDL` closed form (`TauCeti/LinearAlgebra/Matrix/Cholesky/Basic.lean:59, 95`), `LDL.isLowerTriangular_lower` (`Mathlib/Analysis/Matrix/LDL.lean:111`), `Matrix.IsHermitian.roots_charpoly_eq_eigenvalues₀` (`Mathlib/Analysis/Matrix/Spectrum.lean:168`), `ContinuousLinearMap.forall_norm_sub_apply_le_iff_adjoint_apply_sub_eq_zero` (`Mathlib/Analysis/InnerProductSpace/Adjoint.lean:212`), `det_ne_zero_of_sum_row_lt_diag` (`Mathlib/LinearAlgebra/Matrix/Gershgorin.lean:63`), `charpoly_toLin'` (`Mathlib/LinearAlgebra/Charpoly/ToMatrix.lean:91`); the sixteen names pinned by `#check` elaborate.
- Duplication by object: no LU, QR, Householder, least-squares, growth-factor or elimination-graph declaration in the pinned Mathlib or Tau Ceti; none in another roadmap except the least-squares predicates of GaussianLinearModels §1.1 (cited) and of the open RegularizationOfLinearIllPosedProblems §2.1 (C03).
- Cross-roadmap citations resolved on main: GaussianLinearModels §1.1 (`IsLeastSquares`, same body), PerfectAndChordalGraphs §1.1 and §1.4 (`IsChordal`, `IsPerfectEliminationOrder`, same bodies; Fulkerson–Gross), IterativeMethodsForLinearSystems Conventions (complex spectral radius), EigenvalueAndSingularValueInequalities Conventions and Layer 7. ConditioningAndPerturbation Layers 1–3 and RegularSplittingsAndMMatrices Layers 2–3, named as boundaries, match the headings at their open heads.
- Dependency check: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; no upward or cyclic edge.
- Elaboration: `lake env lean` on `TauCetiRoadmap/MatrixFactorizationsAndSparseElimination/Suggested.lean` gives 44 `sorry` warnings and no error; the 76 elaborated signatures were compared with the README (the only binder not carried, `[Field K]` on `leadingBlock`, is not needed by it). No `set_option`, no sorried data.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `simp` with the definitions unfolded) on all 44 sorried theorems: none closes; one closes in three steps from a Mathlib lemma (C01).
- Pull-request text: the counts (44 `sorry`, seven proved Checks), the pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d), the three Tau Ceti imports and the supplier list agree with the head; the change is confined to the roadmap folder.

Overlap check: read RegularSplittingsAndMMatrices, ConditioningAndPerturbation, RegularizationOfLinearIllPosedProblems, FloatingPointArithmetic (open), EigenvalueAndSingularValueInequalities, IterativeMethodsForLinearSystems, PerfectAndChordalGraphs (main); least squares: GaussianLinearModels owns real designs, this roadmap the matrix form over `ℝ` or `ℂ`, RegularizationOfLinearIllPosedProblems the operator form (C03); chordal graphs and perfect elimination orderings: PerfectAndChordalGraphs; complex spectral radius: IterativeMethodsForLinearSystems; eigenvalue enumeration: EigenvalueAndSingularValueInequalities; condition number: Tau Ceti; nothing else shared.

Source independence: 0 passages compared with 0 sources, because no text and no table of contents could be read; largest share TB, 16 of 64 locators; contents not compared with TB.

Research link: Layer 7 states the fill-path lemma of Rose, Tarjan and Lueker and the elimination-tree results that the survey of Davis, Rajamanickam and Sid-Lakhdar (2016) is cited for; Layers 2–5 are the exact statements that the README's downstream consumers (backward error analysis after Higham, 1996) add rounding to. Rests on the README alone.

## Not verifiable

- [H] Higham 1996, [GVL] Golub–Van Loan 1996, [TB] Trefethen–Bau 1997, [SB] Stoer–Bulirsch 2002, [B] Björck 2024, [HJ] Horn–Johnson 1985: books; the publishers' pages are closed and no legal copy was found, so none of the sampled locators (§§1.1, 2.1, 2.2, 3.1, 4.2–4.5, 5.1, 5.2, 6.1, 6.2) was checked.
- [DRS] Davis, Rajamanickam, Sid-Lakhdar 2016: the journal page and the first author's page could not be read through the sources service, so the locators of §§7.1–7.3 were not checked.
- The claim of §4.4 that [H, Theorem 9.8] omits nonsingularity, and the attributions of §7 (Parter, Rose–Tarjan–Lueker, Liu): not checked for the same reason.

Automatic checks set aside as false positives: the report that two theorems have one statement (the two spectral-radius bounds are textually equal but stand under different scoped norms, the spectral norm and the `ℓ∞` operator norm); the report of a section header with no declaration under it (the closing header introduces the `#check` lines that pin library names).

## Source issues

- none

## For the human reviewers

- **Not tested.** None of the seven cited texts was readable; wording, arrangement and all 64 locators are unchecked. TB has the largest share (16 of 64); its lecture order (QR and least squares before LU) differs from the layers' order by its public contents list only.
- **Licence.** README "Prior formalization" (lines 686–700) says parts are proved in the author's own lean-NASC (Apache-2.0, commit 8efdbf7, `NASC/DirectMethods.lean`); that repository was not opened, so adaptation of `Suggested.lean` from it was not compared.
- **Scope.** The sources are five textbooks or monographs and one survey (`README.md` References); no research article is cited. The subject is classical numerical linear algebra and sparse direct methods.
- **Scope.** Several Checks report machine searches (20,000 random runs, 80,294 matrices, 30,000 reorderings; lines 281, 368, 580). The 80,294 and 17,894 counts were reproduced; whether such Checks belong in a README is yours to decide.
