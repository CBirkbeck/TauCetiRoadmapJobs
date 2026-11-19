# Review of IterativeMethodsForLinearSystems (pull request #2561 at ad5c14a)

**Verdict:** needs changes

**Summary.** Changes are needed for one reason only: the real case of the spectral radius criterion of 1.2 is the same theorem as the Schur stability criterion of the open roadmap LinearSystemsAndControl §5.1, so the criterion has two owners and neither text names the other. No stated result, Check or locator was found wrong: every statement was recomputed on small instances, every locator into Saad was read at its place, and `Suggested.lean` elaborates with `sorry` as its only warning. There is one small correction and no format note; the scope question for a human is at the end.

## R01 (P2) — The real-matrix criterion of 1.2 and `isSchurStable_iff_tendsto_pow` of LinearSystemsAndControl §5.1 are one theorem, planned twice

An implementer would prove the same equivalence twice under two names, and a later consumer cannot tell which statement to cite. In 1.2 (README line 98, `Suggested.lean` line 47), `tendsto_pow_atTop_nhds_zero_iff_spectralRadius_map_lt_one` says that for `G : Matrix ι ι ℝ` the powers tend to zero if and only if `spectralRadius ℂ (G.map (↑)) < 1`. The open pull request that adds LinearSystemsAndControl defines, in its §5.1 (README lines 472–477; `Suggested.lean` lines 201–212 at its head d0677ec), `IsSchurStable A` as `∀ μ ∈ spectrum ℂ (A.map (algebraMap ℝ ℂ)), ‖μ‖ < 1` and states `isSchurStable_iff_tendsto_pow : IsSchurStable A ↔ Tendsto (fun k : ℕ => A ^ k) atTop (𝓝 0)`. The spectrum of a matrix is finite, so the supremum of the moduli is below one exactly when each modulus is: the two right-hand sides are the same condition and the two theorems are one. Both routes even use the same input (Gelfand's formula for the upper bound, an eigenvector for the converse). The scope section here says only "No roadmap on main owns an object of this roadmap", which is true and does not cover open roadmaps; the pull request description is silent in the same way.

This roadmap is the one already placed in the merge order, and the criterion is its first headline, so it is the natural owner. The smallest change here: one sentence in "Scope and ownership" saying that 1.2 owns the equivalence between `G^k → 0` and the complex spectral radius being below one, for complex and for real matrices, and that the Schur stability criterion of LinearSystemsAndControl §5.1 is this statement read through its predicate. The matching change belongs to the other pull request: its §5.1 keeps the definition `IsSchurStable` and cites 1.2 for the equivalence with `A ^ k → 0` instead of stating it as a target of its own. A sentence in this pull request's description naming the shared statement would let a reader of either see the order.

## C01 — "applies verbatim" in 2.4 has nothing to apply to

In 2.4 (line 245) the text reads "stated there, without proof, for real symmetric matrices; the route below applies verbatim to Hermitian ones". Saad's Theorem 4.10 (p. 122) indeed carries no proof, so there is no real-symmetric argument that could be applied verbatim: the route that follows is this roadmap's own, written for Hermitian matrices from the start. A reader looks for a source proof that is not there. "the route below proves the Hermitian case directly" says what is meant. It would also help to say that Saad's statement is an equivalence with positive definiteness for a fixed `ω ∈ (0, 2)` and symmetric `A` with positive diagonal, of which the roadmap uses the direction from positive definiteness to convergence.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 stationary iterates | `n = 1`, `G = 1/2`, `c = 1`, `x₀ = 0` | iterates `0, 1, 3/2, 7/4`; limit `2 = (1 − 1/2)⁻¹` | agrees | none |
| 1.2 powers and spectral radius (complex, real) | `[[0,−2],[2,0]]`; `[[1/2,1],[0,1/2]]`; `n = 0` | `G² = −4I`, eigenvalues `±2i`, `ρ = 2`; entries `k·2^(1−k)` = `1, 1, 3/4`, `ρ = 1/2`; zero ring: quasispectrum `{0}`, `ρ = 0` | both directions hold | R01 (ownership) |
| 1.3 convergence of stationary iterations | `G = I` with `c = 0` and `c = e₁`; `n = 0` | `c = 0`: constant; `c = e₁`: `x₀ + k e₁` diverges, `G^k = I ↛ 0`; `n = 0`: both sides true | iff holds with the quantifier over `c` | none |
| 2.1 splittings, SOR matrix | `A = [[2,1],[1,2]]`; `A = [[0,1],[1,0]]`; `ω = 0` | Jacobi `[[0,−1/2],[−1/2,0]]`; `(D+L)⁻¹(−U) = [[0,−1/2],[0,1/4]]`; singular `D + ωL`, matrix `0`; `det = (1−ω)^n` | agrees with Lean bodies | none |
| 2.2 strict diagonal dominance | `[[1,1],[1,1]]`; `[[1,2,−2],[1,1,1],[2,2,1]]`; `1` and `4/5`, size 3 | Jacobi eigenvalues `±1`; `J³ = 0`, Gauss–Seidel `[[0,−2,2],[0,2,−3],[0,0,2]]`; eigenvalues `13/5, 1/5, 1/5`, Jacobi `−8/5`, Gauss–Seidel modulus `√0.512 ≈ 0.7155` | all Checks true | none |
| 2.3 Kahan's bound | `[[2,1],[1,2]]` at `ω = 3/2`, `8 − 4√3`; zero diagonal; `n = 0` | `det = 1/4`, complex pair of modulus `1/2`; `ω_opt = 2/(1+√(3/4))`, `ρ = 7−4√3`; `ρ = 0 < 1`; `ρ = 0` | bound holds, hypotheses needed | none |
| 2.4 Ostrowski–Reich | `[[2,1],[1,2]]` at `ω = 1/2, 2`; `[[1,2],[2,1]]`; `ω = 0`; `n = 0` | root of `λ² − (17/16)λ + 1/4`: `0.7108`; `det = 1`; Gauss–Seidel `[[0,−2],[0,4]]`, `ρ = 4`; `1 + √(3/4) = 1.866`; `ω = 0`: constant `x₀ ≠ A⁻¹b` | iff holds both ways | C01 (wording) |
| 3.1 Chebyshev residual polynomial | `[1,3]`, `k = 1, 2`; `k = 0`; `α = β` | `μ = 2`: `1 − t/2`; `T₂(2) = 7`, values `1/7, −1/7, 1/7` at `1, 2, 3`, `1` at `0`; `1 ≤ 1`; `μ = 0`, odd `k` gives `0` | spec true for `0 < α < β` | none |
| 3.2 min–max | `[1,3]`, `k = 1`; `k = 0` | `max(|1+c|, |1+3c|) ≥ 1/2`, equality at `c = −1/2`; `1 ≤ 1`; `P(μ) = p(0)/c ≤ T_k(μ)` by the pinned lemma | holds; route matches the pinned lemma | none |
| 3.3 closed form | `[1,3]`, `k = 1, 2`; `[1,2]`, `k = 1` | `2(2−√3) = 0.5359 ≥ 1/2`; `14 − 8√3 = 0.14359 ≥ 1/7 = 0.14286`; `2(3−2√2) = 0.3431 ≥ 1/3` | holds | none |
| 3.4 energy norm, Chebyshev iterate | `A = diag(1,3)`, `b = (1,1)`, `x₀ = 0`, `k = 1`; `W = diag(1,2)` | `e₀ = (−1,−1/3)`, `e₁ = (−1/2, 1/6)`; squares `4/3 → 1/3` and `10/9 → 10/36`: factor `1/2 = 1/T₁(2)`; `√3`, `√2` | bound attained | none |
| 4.1 Krylov spaces | `k = 0`; `r = 0`; `A = I`; invertible `A` | `K₀ = 0`; grade `0`; `K_k = span{r}`, grade `1`; `A` injective on invariant `K_g`, so `A⁻¹r ∈ K_g` | agrees | none |
| 4.2 CG iterates, Galerkin form | `A = diag(1,2)`, `b = (1,1)`, `x₀ = 0`; `k = 0` | residual `(1−t, 1−2t) ⟂ (1,1)` at `t = 2/3`; Euclidean minimiser `t = 3/4`; `K₀ = 0` forces `x = x₀` | agrees | none |
| 4.3 orthogonality and conjugacy | same example; `i > j` | `r₀·r₁ = 1/3 − 1/3 = 0`; steps: `(2/3)(1/3) + 2(2/3)(−1/6) = 0`; `i > j` by Hermitian symmetry | holds for all `i ≠ j` | none |
| 4.4 optimality and termination | `A = I`; `r₀ = 0`; example of 4.2 | grade `1`, `x₁ = b`; grade `0`, iterate `x₀`; grade `2`, `x₂ = (1, 1/2)`; `p = 1 − Xq` gives every `p` with `p(0) = 1` | holds | none |
| 4.5 convergence bound | example of 4.2, `κ = 2`; `α = β`; `n = 0` | `‖e₀‖² = 3/2`, `‖e₁‖² = 1/6`, ratio `1/3 ≤ 0.3431`; factor `2·0^k`: `2` at `k = 0`, `0` with exact iterate for `k ≥ 1`; `0 ≤ 0` | holds including `α = β` | none |
| 5.1 minimal residual iterates | swap matrix, `b = (1,0)`; `A = 0`, `b ≠ 0`; `k = 0` | residual `(1, −t)`, minimum `1` at `t = 0`; second iterate `(0,1)`; every point has residual `b`; `p = 1` | existence and optimality hold | none |
| 5.2 bound for normal matrices | swap matrix; `[[1,10],[0,1]]`, `b = (0,1)`; `n = 0` | `max(|1+c|, |1−c|) ≥ 1`; `100t² + (1−t)²` minimal at `t = 1/101`, value `100/101`, norm `0.995` against `0`; `0 ≤ M·0` | holds; normality needed | none |
| 5.3 finite termination | `diag(1,0)`, `b = (0,1)`; `[[0,1],[0,0]]`, `b = (1,0)` | `A b = 0`, residual `b` for every `k`; grade `1`, `K_k = span{b}`, residual `b` | invertibility needed | none |

- Source locators checked against the text: 22 in Saad2003 (Theorems 1.10, 1.11, 4.1, 4.9, 4.10; Definition 4.5; equations (4.5), (4.8), (4.12), (6.128); Propositions 5.2, 5.3 with the remark on p. 138, 6.1, 6.2, 6.10, 6.20, 6.32; Theorems 6.25, 6.29; Lemmas 6.28, 6.31; §12.3.2), printed page equal to the file's page less 20 throughout; 3 in Shewchuk1994 by page and equation number.
- Library declarations opened at the pin: 53 of Mathlib (all of the supplier contracts, each in the file named; `spectrum.gelfand_formula` is an alias at `Mathlib/Analysis/Normed/Algebra/GelfandFormula.lean` line 126) and 1 of Tau Ceti (`TauCeti/Analysis/Matrix/Normal.lean` line 88). None missing.
- Cross-roadmap citations resolved: 1 (ClassicalArithmeticCompletion §6.40, on main). No supplier roadmap.
- Dependency check output: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`.
- Automatic checks: all passed at this head. Elaboration of `Suggested.lean`: 22 `sorry` warnings and nothing else.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `simp_all`) on a copy: none of the 22 theorems closes. `#check` signatures: the four flagged binders (`DecidableEq ι` on `stationaryIterate` and `energyNorm`, `Fintype ι` on the two triangular parts) are unused instance arguments, not hypotheses; nothing changed.
- Duplication by object: no Krylov space, Jacobi or SOR iteration, energy norm or powers criterion at either pin; none in a roadmap on main; one in an open roadmap (R01). No fully qualified name of `Suggested.lean` occurs in another roadmap.
- Headline theorems (spectral radius criterion and stationary convergence; Ostrowski–Reich; Kahan; conjugate gradient bound and termination; minimal residual bound for normal matrices): all stated in `Suggested.lean`; the module docstring names the README targets left out.

Overlap check: read NewtonAndQuasiNewtonMethods, LinearSystemsAndControl, PolynomialInterpolationAndBestApproximation (open) and SpecialFunctionsOrthogonalPolynomialsGeneral (main); shared: the criterion "powers tend to zero iff complex spectral radius below one", stated by this roadmap (1.2) and by LinearSystemsAndControl §5.1, owner to be this roadmap (R01); nothing else shared.

Source independence: 12 passages compared with 2 sources, none shared beyond formulas and statements of a dozen words; largest share Saad2003, about 30 of 34 locators; contents compared with Saad2003: independent (Layer 1 draws on its Chapters 1 and 4, Layer 3 on Chapters 6 and 12, Layers 4 and 5 each on Chapters 5 and 6; the routes of 1.2, 2.2 and 3.2 differ from the source's proofs).

Research link: the headline targets are the classical convergence theorems of numerical linear algebra that the README attributes to Ostrowski (1954), Kahan (1958), Hestenes and Stiefel (1952) and Saad and Schultz (1986), as presented in Saad's SIAM monograph (2003); this rests on the README's references and Saad2003. The README names no current line of research.

## Not verifiable

- Shewchuk1994, equations (44) and (52) and the sentence of §9.1 on the number of distinct eigenvalues: the extraction of the formulas is garbled by the file's font encoding. The equation numbers, the sections and the printed pages 30, 34 and 36 were confirmed (Shewchuk1994 lines 5273, 6331–6335, 6736); the displayed formulas were read only in part.
- Ownership against the board's packages other than open roadmap pull requests was not checked beyond the index of packages under review, which lists no related subject.

## Source issues

- **Gap** in Saad2003 at Definition 4.5, p. 119, and the proof of Theorem 4.9, pp. 121–122: the source says diagonal dominance compares each diagonal entry with the off-diagonal sum of its column, while the proof bounds a row sum; it should be the definition by rows, or a transposition step in the proof; affects the proof.
- **Misprint** in Saad2003 at the proof of Theorem 4.9, p. 122: the source says the eigenvector entries are bounded by one for indices different from 1; it should be for indices different from `m`, the index of the largest entry; affects nothing.
- **Misprint** in Saad2003 before Theorem 6.25, p. 209: the source says the set written `P_k` consists of the polynomials of degree `k`; it should be degree not exceeding `k`, as on p. 397; affects nothing.

## For the human reviewers

- Scope: the subject is textbook numerical linear algebra; 30 of about 34 locators are to one SIAM textbook (Saad2003) and the rest to a technical report (Shewchuk1994); the README's references name original papers without locators and no current research.
- Licence: Saad2003 was read from the PDF of the second edition on the author's university page and Shewchuk1994 from the author's page; neither file states a licence, and the roadmap reuses no text, table or figure from them.
