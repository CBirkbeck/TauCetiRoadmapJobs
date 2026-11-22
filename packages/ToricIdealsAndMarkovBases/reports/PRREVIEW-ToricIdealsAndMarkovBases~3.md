# Review of ToricIdealsAndMarkovBases (pull request #2985 at ebb3a7d)

**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 117 lines changed since `0cc63a0` finds that the one earlier finding is repaired and the repair introduces no new problem. Theorem 3.4 is now stated for `d` the rank of `A`, a choice of `d` rows and a common minor value `δ`; the reduction placed in front of the route (same kernel, Cramer's rule, `A' = Q⁻¹ A_ρ`) was recomputed, and every number in the rewritten Checks holds. There are no small corrections and no format notes. One question stays with the human reviewers: the copy of Drton–Sturmfels–Sullivant could not be read.

## Previous findings

- R01 — repaired: 3.4 now reads "let `d` be the real rank of `A` … `ρ : Fin d → Fin r` a choice of `d` rows and `δ` an integer", with minors in `{0, δ, −δ}` and one nonzero; `Suggested.lean` and the summary agree.
- N01 — repaired: the module docstring is rewrapped; no line of `Suggested.lean` exceeds 100 characters.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 3.4 `graverBasis_eq_circuits` (new hypotheses) | `5×6` margin matrix; `(2 2)`; `(1 1 0; 1 −1 2)`; `(1 2)`; `A = 0`, `r = 1`, three columns | margin: rank `4`, all 120 injective `ρ` give minors in `{0,±1}`, one nonzero, Graver = circuits, 6 vectors; `(2 2)`: `±(1,−1)` both; `δ=2` example: `±(1,−1,−1)` both; zero: `d=0`, `±e_j` both | hypotheses hold, conclusion holds | none |
| 3.4, each hypothesis needed | twisted cubic (both row orders); twisted cubic with second row repeated, `ρ` the equal rows; first row only with `d = 1` | minors `1,2,3,1,2,1` (signs reversed for the other order), Graver 10 vectors, circuits 8; repeated row: rank `2`, all six chosen minors `0`, Graver 10 ≠ circuits 8; `1×1` minors all `1`, rank `2 ≠ 1` | `hdet` fails, `hne` fails, `hrank` fails respectively; conclusion false in each | none |
| 3.4, converse | `A = (1 2)` | minors `1, 2`; Graver = circuits = `±(2, −1)` | converse fails, as the Check says | none |
| 3.4 route, reduction | margin matrix with `ρ` = two row sums, first two column sums, `e₀ = 11,12,13,21`; `(1 1 0; 1 −1 2)`, `e₀` first two columns | `det Q = 1`, `A' = (1 0 0 0 −1 −1; 0 1 0 0 1 0; 0 0 1 0 0 1; 0 0 0 1 1 1)`; second: minors `−2, 2, 2`, `A' = (1 0 1; 0 1 −1)` | `A'` integral, same kernel, minors in `{0,±1}`; Cramer entry is `det(A.submatrix ρ (update e₀ i j))/det Q` | none |
| 3.4 route, matrix `B` built from `A'` | all 64 sign vectors for the `4×6` matrix `A'` above | each `B` is `10×12` of rank `10`; its 66 maximal minors take values in `{−1, 0, 1}` only | as the Check says; supplier hypothesis (rank equal to number of rows, minors in `{0,±1}`) met | none |
| 3.4 Lean signature | `e` not injective; `δ = 0`; `ρ` not injective | repeated column: determinant `0 ∈ {0,δ,−δ}`; `δ = 0` or repeated row: all minors `0`, contradicts `hne` | quantifying over all `e` is harmless; README sentence "forces `ρ` injective and `δ ≠ 0`" true | none |
| Layer 3 Examples, `m × n` tables | `2×3` | rank `4 = m+n−1`; totally unimodular (all square minors of all sizes in `{0,±1}`); any four of five rows independent | as stated | none |

The rows for the statements the change does not touch stand as in the previous review, of `0cc63a0`.

- Source locators checked against the text this round: 2, both in the changed passage (Conca2024 lines 241–250, (8) on p. 6 and the complete bipartite graph; AlmendraDeLoeraPetrovic2023 lines 593–595, p. 13, totally unimodular). The seeded sample falls in the change only at 3.4; the other targets are untouched and stand as in the previous review.
- Library declarations opened at the pin: 5 new names of the route (Mathlib `LinearAlgebra/Matrix/Rank.lean` 577 `Matrix.rank_eq_finrank_span_row`; `Determinant/Basic.lean` 141 `Matrix.det_mul`; `Adjugate.lean` 96 `Matrix.cramer_apply`, 187 `Matrix.adjugate`, 244 `Matrix.cramer_eq_adjugate_mulVec`).
- Cross-roadmap citations resolved: 1 (IntegerPolyhedraAndTotalUnimodularity 2.1 at its open head: `forall_det_mem_iff_forall_extremePoints_realFibre`, hypotheses real rank `r` and `r × r` minors in `{0,±1}`, which the reduced matrix `A'` and the matrix `B` satisfy).
- Dependency check: `depcheck: 133 roadmaps, 1474 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: nine `sorry` warnings and nothing else. `#check @graverBasis_eq_circuits` gives `∀ {r} {ι} [Fintype ι] (A) {d}, (A.map Int.cast).rank = d → ∀ ρ δ, (∀ e, … ∈ {0, δ, -δ}) → (∃ e, … ≠ 0) → graverBasis A = circuits A`, equal to the README statement; no binder lost.
- One-tactic probe of the changed theorem (`rfl`, `simp` with the two definitions unfolded, `simp_all`, `aesop`, `exact?`): none closes it; no padding.
- Pull request text against this head: the description already states 3.4 in the new form (rank `d`, `d` rows, one absolute value, totally unimodular of any rank); 13 definitions, one instance, 9 theorems, two open suppliers; nothing contradicted. No file changed outside the folder.

Overlap check: read GroebnerGeometry (main and its open revision), ZeroDimensionalIdeals, LangevinAndHamiltonianMonteCarlo, IntegerPolyhedraAndTotalUnimodularity, MCMCAsymptoticVariance; nothing shared (as in the previous review; the change adds no object, and the unimodular-vertices theorem stays with IntegerPolyhedraAndTotalUnimodularity, cited).

Source independence: changed passages only: 3 passages (the statement of 3.4, its reduction, the `m × n` example) compared with 2 sources (Conca2024, AlmendraDeLoeraPetrovic2023), none shared; largest share Sturmfels2003Recipes, 10 of 24 locators; the change adds, removes and reorders no layer, so the contents comparison stands as before: independent. The text of Drton–Sturmfels–Sullivant (7 locators) could not be read.

Research link: The fundamental theorem is Diaconis–Sturmfels (1998), the normal-form theorem Conti–Traverso (1991), the Graver and circuit inclusions Sturmfels (1996); Almendra-Hernández–De Loera–Petrović (2023) survey their current use in algebraic statistics. Rests on the README's references and on the texts of AlmendraDeLoeraPetrovic2023, Sturmfels2003Recipes and Conca2024.

## Not verifiable

- Drton–Sturmfels–Sullivant, Algorithm 1.1.13, Theorem 1.1.14 (pp. 16–17), pp. 26, 30, 31 and Theorem 1.3.6: not readable through the sources service, as in the previous review; untouched by this change.
- Sturmfels, *Gröbner Bases and Convex Polytopes*, Proposition 8.11 (the theorem behind 3.4): not consulted, as the README says; 3.4 is proved in the README and its statement was checked through Conca2024 and AlmendraDeLoeraPetrovic2023 and by computation.

## Source issues

- **Error** in Sturmfels2003Recipes at Theorem 3.4, p. 7: the source says a feasible point is non-optimal exactly when some Graver element fits the box around it; it should be: fits the box and has positive cost; affects a stated result.
- **Misprint** in Sturmfels2003Recipes at the proof of Theorem 3.4, p. 7 (second paragraph): the source says to suppose the cost of the Graver element negative before moving from its positive to its negative part; it should be positive; affects nothing.

## For the human reviewers

- **Not tested.** Seven of the 24 locators cite Drton–Sturmfels–Sullivant in the 2008 version at `math.berkeley.edu/~bernd/owl.pdf`, a coauthor's page; the sources service did not accept the address, so those locators and the wording against that text were not checked.
