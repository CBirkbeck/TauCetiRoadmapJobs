# Review of RegularSplittingsAndMMatrices (pull request #3211 at ea62f87)

**Verdict:** needs changes

**Summary.** Changes are needed for one sentence: the route of 2.3 factors the SOR splitting matrix with `K = −D⁻¹ L`, which is false for `ω ≠ 1`; the factor is `K = −ω D⁻¹ L`, and the theorem and the rest of the route are unaffected. All eleven statements were recomputed on small and degenerate cases and none failed; every README Check was recomputed and is correct. There is one small correction and one format note, neither blocking. The humans who approve are asked about the two sets of lecture notes cited, which could not be read through the sources service.

## R01 (P2) — The route of 2.3 factors `M_ω` with `K = −D⁻¹ L`, which is false unless `ω = 1`; the factor is `K = −ω D⁻¹ L`

In the route of 2.3 (README line 199) the text says "`M_ω = (D/ω)(I − K)` with `K = −D⁻¹ L ≥ 0` strictly lower triangular, so `K^n = 0` and `M_ω⁻¹ = (∑_(k<n) K^k)(ω D⁻¹) ≥ 0`". An implementer who follows it proves the nonnegativity of the inverse of the wrong matrix. With `M_ω = (D + ω L)/ω` as defined one line earlier, `(D/ω)(I + D⁻¹ L) = (D + L)/ω`, which is `M_ω` only when `ω = 1` or `L = 0`.

A witness: `D = I` of size two, `L = [[0, 0], [−1, 0]]`, `ω = 1/2`. Then `M_ω = 2I + L = [[2, 0], [−1, 2]]` with inverse `[[1/2, 0], [1/4, 1/2]]`, while the README's formula gives `(I + K)(ω D⁻¹) = [[1/2, 0], [1/2, 1/2]]`, the inverse of `[[2, 0], [−2, 2]]`.

The smallest change: write `K = −ω D⁻¹ L`. It is still nonnegative and strictly lower triangular for `0 < ω`, so `K^n = 0`, the formula for `M_ω⁻¹` and the conclusion stand as written.

## C01 — The dependency lines of Layers 1 and 2 disagree with the `*Needs:*` lines of their targets

The Dependencies paragraph of Layer 1 (README line 133) says "1.1 uses Mathlib", but the route of 1.1 rests on Tau Ceti's Collatz–Wielandt bound `Matrix.ofReal_le_spectralRadius_of_smul_le_mulVec` and on `Matrix.mem_spectrum_iff_exists_mulVec_eq_smul`, both in its `*Needs:*` line. The Dependencies paragraph of Layer 2 (line 293) ends "all use Tau Ceti", while the `*Needs:*` line of 2.3 names 2.1 and Mathlib only. A reader who plans the build from the layer summaries gets a different graph from the one the targets state. "1.1 uses Tau Ceti and Mathlib" and "2.1, 2.2 and 2.4 use Tau Ceti" would agree with the targets.

## N01 — The Stein–Rosenberg theorem is attributed without a bibliographic entry

2.4 says the theorem "is due to Stein and Rosenberg" and the References list has no entry for it. The paper is P. Stein and R. L. Rosenberg, *On the solution of linear simultaneous equations by iteration*, J. London Math. Soc. 23 (1948), 111–118 (Crossref, DOI 10.1112/jlms/s1-23.2.111); an entry would let a reader find it. The statement in 2.4 stays "proved here".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 comparison, complex `A`, real `B` | `A = [[1,1],[−1,1]]`, `B` all ones; `n = 0`; Saad Thm 1.28 | `ρ(A) = √2 ≤ 2 = ρ(B)`; `n = 0`: `0 ≤ 0`; source has real `0 ≤ A ≤ B`, as the README says | holds | none |
| 1.2 strict comparison | `B = I₂`, `A = diag(1,0)`; `B = [[0,1],[1,0]]`, `A = −B`; `n = 1`, `0 ≤ a < b`; `n = 0` | reducible: `1 = 1`; `A` not ≥ 0: `1 = 1`; `n = 1`: `a < b`; `n = 0`: `A ≠ B` impossible | holds; both Checks separate | none |
| 1.3 Neumann criterion | `B = [[0,1/2],[1/2,0]]`; `B = [[−2]]`; `B = [[1]]`; `n = 0` | inverse `[[4/3,2/3],[2/3,4/3]]`, `ρ = 1/2`; `(I−B)⁻¹ = 1/3`, `ρ = 2`; `B = 1`: junk inverse `0 ≥ 0`, excluded by `IsUnit` | holds; `IsUnit` conjunct needed | none |
| 2.1 regular splittings | size one: `(M,N) = (0,1)`, `(−1,0)`, `(1,−2)`; Saad Thm 4.4 | `ρ = 0`, `A⁻¹ = −1`; `ρ = 0`, `A⁻¹ = −1`; `ρ = 2`, `A⁻¹ = 1/3` | holds; each hypothesis needed | none |
| 2.2 rate | `A = [[2,−1],[−1,2]]` Jacobi and Gauss–Seidel; singular `M = [[1,2],[1,2]]`; `n = 0` | `1/2 = 1/(1+1)`; `1/4 = (1/3)/(4/3)`; singular: `0` against `6/7` (`A⁻¹N = [[2,6],[2,3]]`, eigenvalues `6, −1`); `0 = 0/1` | holds in `[0, ∞]` | none |
| 2.3 M-matrices | 3×3 inverse of `[[1,1,0],[0,1,1],[1,0,1]]`; `A = [[1]]`, `ω = 0, 2`; `ω = 1/2` splitting | `A·A⁻¹ = I` checked; `ρ_J = √3`; Gauss–Seidel block `[[−1,2],[2,−3]]`, `ρ = 2+√5`; `sor = 1, −1` | statement holds; route's `K` wrong | R01 |
| 2.4 Stein–Rosenberg | four 2×2 cases; reducible 4×4; zero diagonal; `[[1,2,−2],[1,1,1],[2,2,1]]`; `n = 0` | `(1/2,1/4)`, `(1,1)`, `(2,4)`, `(0,0)`; classes `1/2`, `2` give `(2,4)`; zero diagonal `(1,0)` in no case; `n = 0`: `(0,0)` | holds; steps 1–6 rechecked | none |
| `IsIrreduciblyDiagDominant` | tridiagonal `2, −1`; `n = 1`; `n = 0`; `[[1,1],[1,1]]`; `[[2,1],[4,2]]` | satisfied; `n = 1` iff entry `≠ 0`; `n = 0` false; no strict row; row two `4 > 2` | determines the object | none |
| 3.1 Taussky | tridiagonal size 3; reducible `[[1,1,0],[1,1,0],[0,0,2]]`; `[[2,1],[4,2]]`; general normed field | `det = 4`; `det = 0`; `det = 0`; route scales by a maximal entry, uses only multiplicativity of the norm | holds; Saad Cor 4.8 by columns | none |
| 3.2 Jacobi and Gauss–Seidel | `[[2,3],[1,4]]` (columns only); `[[1,1],[1,1]]`; tridiagonal; `n = 0` | `ρ_J = √6/4`, `sor = [[0,−3/2],[0,3/8]]`; eigenvalues `±1` and `0, 1`; `√2/2`, `1/2`; third disjunct vacuous, `ρ = 0` | holds | none |
| 4.1 Householder–John | `A = [[2,1],[1,2]]`, `[[1,2],[2,1]]` Gauss–Seidel; `M = 0`, `A = −I`; identity `A − GᴴAG = Qᴴ(Mᴴ+N)Q`; `n = 0` | `Mᴴ+N = 2I`, `ρ = 1/4`; `Mᴴ+N = I`, `ρ = 4`; `M = 0`: `ρ = 0`, `A` not definite; identity expanded | holds both ways | none |
| 4.2 Jacobi criterion | `[[2,1],[1,2]]`; size 3 off-diagonal `4/5`; size 3 off-diagonal `−1/2` | `ρ_J = 1/2`; `A`: `13/5, 1/5, 1/5`, `2D−A`: `−3/5`, Jacobi `−8/5`; semidefinite `A`: `2D−A` definite, Jacobi eigenvalue `1` | holds | none |
| Copied definitions | compared with IterativeMethodsForLinearSystems `Suggested.lean` lines 75–107 | four bodies identical; `strictLowerPart`, `strictUpperPart` carry no `Fintype` in either file | agree | none |

- Source locators checked against the text: 8 of 14 (Saad, Theorems 1.28, 1.29, 1.32, Definitions 4.3, 4.5, Theorems 4.4, 4.9, Corollary 4.8; printed pages 29–31, 118, 119, 121 agree; text lines 1737, 1751, 1802, 5622, 5629, 5659, 5775, 5790).
- Library declarations opened at the pins: 24 of Mathlib and 6 of Tau Ceti, each with `#check`; all exist with the hypotheses the supplier contracts give (`spectrum.map_pow` needs a nontrivial algebra, `Matrix.PosDef.conjTranspose_mul_mul_same` an injective `mulVec`, the three Perron–Frobenius existence theorems `[Nonempty n]`). `Matrix.IsIrreducible` is nonnegativity plus `Quiver.IsSStronglyConnected`, `Matrix.PosDef` is Hermitian plus a positive form.
- Cross-roadmap citations resolved: IterativeMethodsForLinearSystems §1.2 (both names, README lines 96–98), §2.1, §2.2, §2.3, §2.4 and its scope sentence (lines 614–616) on main; LinearSystemsAndControl §5.4 on main (line 562).
- Duplication by object: no declaration on regular splittings, M-matrices, irreducible dominance, Stein–Rosenberg, Householder–John or monotonicity of the spectral radius of nonnegative matrices in the pinned Mathlib or Tau Ceti; none in another roadmap. PeriodicNonnegativeMatrices places the comparison for dominated complex matrices and strict monotonicity outside its scope.
- Dependency check: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates with eleven `sorry` warnings and nothing else. One-tactic probe (`simp`, `rfl`, `simp_all`, `exact?`, `infer_instance`, `aesop`): none of the eleven theorems closes. Elaborated types compared with the README statements: same generality in each; nothing changed.
- Headline theorems: the eleven targets 1.1–4.2 are all stated; none is named as not statable. The title and description agree with the head (eleven theorems, five definitions, suppliers as stated).
- The automatic checks all passed on this head.

Overlap check: read IterativeMethodsForLinearSystems, PeriodicNonnegativeMatrices, EigenvalueIterations, ConditioningAndPerturbation, KrylovMethodsAndOrthogonalPolynomials, LinearQuadraticControl, EchoStatesAndRandomFeatures; the only shared objects are the Jacobi and SOR matrices and the triangular parts, owned by IterativeMethodsForLinearSystems §2.1 and cited here as copied.

Source independence: 14 passages compared with 1 source (the 8 Saad locators, the routes of 1.3, 2.1, 2.3, 3.1, 3.2 against Saad's proofs, and the docstring of 2.1), none shared beyond formulas; largest share Saad, 8 of 14 locators; contents compared with Saad §1.10 and §§4.2.2–4.2.4: independent (Layer 2 also holds 2.2–2.4, Layer 4's theorems are not Saad's §4.2.4). The Auzinger–Melenk and Fawzi notes could not be read.

Research link: Layers 1–2 are the nonnegative-matrix and regular-splitting theory that Saad (2003) uses for incomplete LU factorizations of M-matrices (Theorem 1.32 in the proof of Theorem 10.1, p. 302); 2.4 is Stein and Rosenberg (1948). This rests on Saad's text; the README states no research motivation.

## Not verifiable

- Auzinger and Melenk, Theorem 5.2 (p. 32), Definition 5.4 (p. 35), Theorems 5.4 (p. 36) and 5.5 (p. 37): the notes are linked from a TU Wien course page of another lecturer; the sources service has no legal copy, and no page of either author was found.
- Fawzi, Theorem 4.12 and Corollary 4.13 (p. 33): the file is on the author's DAMTP page, but the sources service did not accept that page as the author's (its address carries a user identifier, not a name).
- 4.1 and 4.2 therefore have no locator that was read; their statements were checked by computation only. 3.1 and 3.2 were checked through their Saad locators.
- Reuse against public Lean formalisations other than the pinned libraries was not searched.

## Source issues

- none

## For the human reviewers

- Scope: of the three sources, two are unpublished lecture notes (Auzinger–Melenk, TU Wien 2023; Fawzi, Cambridge 2021); 2.2, 2.4 and the converse of 4.1 cite no refereed source and are "proved here".
- Licence: the Auzinger–Melenk notes are served from a course page of a third lecturer at TU Wien, with no stated licence; the sources service classified neither that page nor Fawzi's DAMTP page.
- Not tested: wording and arrangement were compared with Saad only; the Auzinger–Melenk and Fawzi notes (6 of 14 locators, all of Layer 4) were not read.
