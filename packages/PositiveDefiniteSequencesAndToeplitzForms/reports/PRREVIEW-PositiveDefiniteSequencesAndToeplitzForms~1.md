# Review of PositiveDefiniteSequencesAndToeplitzForms (pull request #2784 at 7c5fbea)

**Verdict:** accepted

**Summary.** Accepted: no finding. All eleven stated theorems were recomputed on degenerate and small instances (sizes 0 to 4, the zero and infinite measures, `p = 0`, the trivial group, `ℤ/3`, `ℤ/4`) and hold as stated; every Check was recomputed and is true; the three source locators agree with the texts; `Suggested.lean` elaborates with `sorry` as its only warning and no statement closes with one tactic. There are two small corrections and two format notes, none blocking. Two facts about the sources are left for the human reviewers.

## C01 — The route of 5.1 uses two inputs that its `*Needs:*` line does not name

An implementer who follows the route of 5.1 (README lines 393–403) meets two steps that are neither targets nor cited declarations. The first is the lemma in parentheses at line 397, that two matrices of the same size with `A Aᴴ = B Bᴴ` differ by a unitary factor; the cited paper takes it from a textbook (yang-xie-vandermonde line 167), and the roadmap gives it no owner. The second is "diagonalising `U`" for a unitary `U` (line 398): the only spectral theorem the `*Needs:*` line names is `Matrix.IsHermitian.spectral_theorem`, which at the pin (`Mathlib/Analysis/Matrix/Spectrum.lean`, line 143) diagonalises a Hermitian matrix, not a unitary one.

The smallest change: say in 5.1 that both steps are proved there (one clause each, for instance "proved here" after the parenthesis, and "a unitary matrix is unitarily diagonalisable with eigenvalues on the circle, proved here"), or name the pinned declarations that give them if there are any, and add them to the `*Needs:*` line and to the Layer 5 Dependencies.

## C02 — The description says Sylvester's criterion is proved "by the same route" as the source; the README's route is a different one

The description's sentence "the roadmap states the Hermitian case and proves it by the same route" does not match the head. The source proves the converse by row elimination to a triangular factorisation (lu-matrix-decomposition lines 4974–4978) and the forward direction by an induction on the Schur complement of the corner entry; README 1.1 (lines 99–107) proves the forward direction from `Matrix.PosDef.submatrix` and `Matrix.PosDef.det_pos` and the converse by induction on the Schur complement of the leading block followed by a congruence. The README itself says only "by the route below", which is right. Text that would be right in the description: "the roadmap states the Hermitian case and proves it by its own route (induction on the Schur complement of the leading block)".

## N01 — Eight of the eleven targets carry no source locator

1.2, 2.1, 3.1–3.4, 5.2 and 5.3 are marked "Proved here" (5.3 with a pointer to the atomic uniqueness of Yang–Xie, Theorem 1). Their routes are complete and were checked, so nothing is unsupported; a reader who wants the literature's statement of the principal-minor criterion or of the Toeplitz-determinant criterion finds no pointer. A textbook locator for each classical statement would help, where the author has one at hand.

## N02 — `toeplitzSection` is also the name of a different definition in OperatorTheory/ToeplitzOperators

`TauCetiRoadmap/OperatorTheory/ToeplitzOperators/Suggested.lean`, line 242, declares `toeplitzSection (a : Symbol) (n : ℕ) : FiniteOperator n`, the compression of a Toeplitz operator of a bounded symbol; here `toeplitzSection φ n` is the matrix of an arbitrary sequence. The namespaces differ, so nothing clashes, and the scope section already states the boundary. One clause there saying that the two definitions share a short name and how they are related (the matrix of the compression is the section of the symbol's Fourier coefficients) would spare a reader the comparison.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 1.1 Sylvester (`posDef_iff_forall_det_leadingMinor_pos`) | `n = 0`; `[[2,1],[1,1]]`; `[[1,2],[2,1]]`; `[[2,i],[−i,1]]`; `diag(0,1)`; non-Hermitian `[[1,2],[0,1]]` | empty: PD, minor `1`. Minors `1,2,1` / PD; `1,1,−3` / eigenvalue `−1`; `1,2,1` / eigenvalues `(3±√5)/2`; `1,0,0` / not PD; `1,1,1` / excluded by `hA` | holds; Hermitian hypothesis in the Lean binder |
| 1.2 principal minors (`posSemidef_iff_forall_principalMinor_nonneg`) | empty index; `diag(0,−1)`; `diag(0,1)`; corner matrix of size 3; `[[0,1],[0,0]]` | `∅`-minor `1`; minors `1,0,−1,0` / not PSD; `1,0,1,0` / PSD; minor on `{1,3}` is `−1`, eigenvalues `−1,0,1`; non-Hermitian, minors `1,0,0,0` | holds; route's expansion `det(B+t) = ∑ t^(m−k) E_k` checked |
| 2.1 group matrices (`posDef_circulant_iff_forall_sum_conj_mul_pos`) | trivial group; `ℤ/3` with `(1,i,−i)` and `(1,−½,−½)`; `ℤ/4` with `(2,1,0,1)`; `δ₀` | `f(0)`; `1, 1+√3, 1−√3`; `0, 3/2, 3/2`; `4,2,0,2` (kernel `(−1)ˣ`); all `1`. Eigenvalue of `ψ` is `∑ conj(ψ)f` | holds; no Hermitian hypothesis needed (normal matrix, real spectrum) |
| 2.1 remark on Bochner (mass `f̂(ψ)/|G|` at `ψ`) | transform convention at the pin | transform is `∫ χ(g) dμ(χ)`, so `f̂(ψ) = |G|·μ{ψ}` | consistent |
| `toeplitzSection`, `circleMoment` | size 0; `φ = δ₀`; `μ = δ₁`, `(δ₁+δ₋₁)/2`, `0`, `∞·δ₁` | empty matrix; identity; all-ones; moments `1,0,1,…`; zero; all moments `0` by the integral's junk value | definitions are the intended objects; transpose convention noted |
| 3.1 (`isPositiveDefiniteSub_iff_forall_posSemidef_toeplitzSection`) | `δ₀`; `φ(0)=1, φ(±1)=φ(±2)=0.9` | sizes 1–3 smallest eigenvalues `1, 0.1, 0.1`; size 4: block `[[1,1.8],[1.8,1.9]]` gives `(2.9−√13.77)/2 = −0.405` | holds; `xᴴTx` equals the defining form at `c = conj x` |
| 3.2 (`posDef_toeplitzSection_circleMoment_iff`) | `n = 0`; zero measure; `δ₁`; `(δ₁+δ₋₁)/2`, `n = 2, 3`; `∞·δ₁` | both sides true; PD iff `n = 0` and `∅` carries; PD iff `n ≤ 1`; identity / singular `[[1,0,1],[0,1,0],[1,0,1]]`; fails without finiteness (`[0]` vs every carrier contains `1`) | holds; finiteness in the binder |
| 3.3 (`forall_posDef_toeplitzSection_iff`) | triangular `φ(0)=1, φ(−1)=½`; `(δ₁+δ₋₁)/2`; `φ(±2)=1` | all determinants `1`, not Hermitian; determinants `1,1,1,0,0`; size 3 minors `1,0,0,0`, eigenvalue `−1` | holds; leading block of size `k` is the section of size `k` |
| 3.4 (`exists_finset_of_not_posDef_toeplitzSection`) | `n = 0`; `φ ≡ 1`; `(δ₁+δ₋₁)/2`; `−δ₀` | `φ(0)=0` forces `φ = 0`, `s = ∅`, ranks `0 = min m 0`; ranks `0,1,1`; ranks `0,1,2,2,2`; excluded by `hφ` | holds |
| 4.1 Fejér–Riesz (`existsUnique_polynomial_fejerRiesz`) | `n = 0`; `2+z+z⁻¹`; `5+2z+2z⁻¹`; `p = 0`; `n = 1, a = δ₀`; `z+z⁻¹` | `q = √a(0)`; `q = 1+z`; `|2+z|² = |1+2z|² = 5+2z+2z⁻¹`, only `2+z` zero-free in the disc; no `q`; `q = 1`; negative at `z = −1` | holds; uniqueness: roots of `zⁿp` outside the disc and half those on the circle fix `q` |
| 5.1 Carathéodory–Fejér (`posSemidef_toeplitzSection_iff_exists_finset`) | `N = 0`; `N = 1` with `φ(0) = 0, >0, <0`; `N = 2, δ₀`; `N = 3`, `(1+(−1)ᵏ)/2` | rank `0`, `s = ∅`; rank `0` / `1` / no weights; `{1,−1}`, weights `½`; rank `2`, `{1,−1}` | holds in both directions; route's `φ(k) = w₁Uᵏw₁ᴴ` rechecked for the entry convention `φ(j−k)` |
| 5.2 Carathéodory–Toeplitz (`posSemidef_toeplitzSection_iff_exists_measure`) | `N = 0`; `N = 1, φ(0)=1`; `N = 2, φ(±1)=2` | zero measure works; `δ_ζ` and arc length; eigenvalue `−1`, and `|∫z dμ| ≤ 1` | holds |
| 5.3 uniqueness (`measure_eq_of_not_posDef_toeplitzSection`) | `N = 0`; `N = 1, φ(0)=0`; `N = 1, φ(0)=1`; `N = 3` | hypothesis false (empty matrix is PD); only the zero measure; hypothesis false, measures differ; Vandermonde on `{1,−1}` gives masses `½,½` | holds; moments `0 ≤ k < |Z| ≤ N−1` are in range |
| C01 (route of 5.1) | the `*Needs:*` line against the route | Gram-matrix lemma and unitary diagonalisation used; `Matrix.IsHermitian.spectral_theorem` is the Hermitian statement | small correction |

- Source locators checked against the text: 3 sources, 6 locators (Lu Theorem 3.17, printed p. 77; Dritschel–Rovnyak §1 p. 2, Theorem 2.1 p. 4, uniqueness remark p. 7; Yang–Xie Theorem 1 p. 4, proof pp. 4–5); all agree.
- Library declarations opened at the pins: 30 (all names of the supplier contracts resolve; statements read for `Matrix.PosSemidef`, `Matrix.PosDef`, `PosDef.submatrix`, `PosDef.det_pos`, `IsUnit.posDef_star_left_conjugate_iff`, `PosDef.fromBlocks₁₁/₂₂`, `det_fromBlocks₁₁`, `coeff_det_one_add_X_smul_eq_sum_minors`, `IsHermitian.spectral_theorem`, `wInner_cWeight_eq_boole`, `complexBasis`, `rank_conjTranspose_mul_self`, `TauCeti.IsPositiveDefiniteSub`, the two Herglotz statements, discrete Bochner, `Matrix.principalMinor`, `pontryaginMeasureTransform`).
- Duplication by object at the pins: no Sylvester criterion, Fejér–Riesz factorisation, Toeplitz section or Carathéodory–Fejér statement in Mathlib or Tau Ceti; only Sylvester's law of inertia and unrelated Toeplitz matrices of symmetric polynomials.
- Cross-roadmap citations resolved: 7 (ToeplitzOperators Layers 2–5; Completed/OneParameterSemigroups Part C; FactorRigidity 4.1; SamplingAndDiscreteFourierAnalysis 2.1–2.2; SchattenClassesAndSchurMultipliers Layer 9; KernelsAndSpectralMethods Layers 7–8); all exist as cited, none is a supplier.
- Dependency check output: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: 11 `sorry` warnings, nothing else. The elaborated types of all 13 declarations were compared with the README statements: no binder lost, same generality.
- One-tactic probe (`rfl`, `simp`, `infer_instance`) on a copy: none of the 11 theorems closes.
- Automatic checks: all passed; no other file changed outside the folder.

Overlap check: read OneParameterSemigroups, OperatorMonotoneFunctionsAndMatrixMeans, BooleanFunctionAnalysis, KalmanFiltering, MatrixSpectralStatistics, ToeplitzOperators, ArithmeticInterpolationDeterminants, DiracScatteringAndNonlinearFourierTransform; one shared object, the finite Toeplitz section: ToeplitzOperators owns the compression of a Toeplitz operator of a bounded symbol, this roadmap the matrix of an arbitrary sequence and its positivity (N02); nothing else shared.

Source independence: 7 passages compared with 3 sources, none shared (the route of 5.1 follows the mathematical steps of the cited proof in its own, much shorter wording); largest share yang-xie-vandermonde, 3 of 6 locators; contents compared with yang-xie-vandermonde (its sections 1–7): independent.

Research link: Layers 4 and 5 state the classical Fejér–Riesz and Carathéodory–Fejér theorems that Dritschel and Rovnyak (2010) extend to operator coefficients and Yang and Xie (2017) to frequency-selective Vandermonde decompositions for moment problems and spectral estimation; rests on those two sources as read, and on the README's link to Toeplitz operators.

## Not verifiable

- none

## Source issues

- **Error** in dritschel-rovnyak-fejer-riesz at §1, the classical Fejér–Riesz theorem, p. 2: the source says every Laurent polynomial nonnegative on the circle is `|p|²` with `p` zero-free in the disc; it should be restricted to polynomials not identically zero, since for zero only `p = 0` works; affects a stated result.
- **Gap** in yang-xie-vandermonde at Theorem 1, proof, p. 4: the source says the weights obtained from the eigenvectors of the unitary matrix are positive, without argument; it should be derived from the rank count used just after for distinctness; affects the proof.

## For the human reviewers

- **Licence / scope.** The only source for Sylvester's criterion (1.1) is an arXiv-only book, Lu, *Numerical Matrix Decomposition* (arXiv:2107.02579v7, math.HO), not a refereed publication; the statement itself is standard.
- **Scope.** Eight of eleven targets have no source locator and are marked "Proved here" (README 1.2, 2.1, 3.1–3.4, 5.2, 5.3); they were checked by computation, not against a refereed statement.
