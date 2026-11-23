# Review of KrylovMethodsAndOrthogonalPolynomials (pull request #3019 at 527de8b)

**Verdict:** needs changes

**Summary.** Changes are needed for one reason: the spectral measure of a matrix and a vector (1.1) is the scalar spectral measure of an operator at a vector, which the pinned Tau Ceti and OperatorTheory/SelfAdjointSpectralTheory on main already have, and the roadmap neither cites that owner nor states how its own definition relates to it. No stated result was found false: every theorem was tested at degenerate parameters and every Check recomputed exactly, and all agree. There is one small correction and two format notes, none blocking. Two points are left for the human reviewers (whether the recurrence targets of 3.2 and 4.4 fall under the rule against algorithms, and one source on a host that could not be classified).

## R01 (P2) — The spectral measure of 1.1 is the scalar spectral measure of an operator at a vector, which Tau Ceti and SelfAdjointSpectralTheory already have; the roadmap does not cite it or relate the two

The library ends up with two unrelated definitions of one object. A consumer who holds the library's measure (through OperatorTheory/SelfAdjointSpectralTheory, or SchrodingerOperatorsAndSpectralTypes 1.1, which builds on its diagonal measures) cannot use Layers 1–2 here, and the reverse; and the lines "From Tau Ceti: Nothing is used" and the Tau Ceti bullet of "Scope and ownership" (which names only the Rayleigh–Ritz compression) read as if the library had nothing nearer.

At the pin, `ContinuousLinearMap.diagMeasure a ξ` (`TauCeti/Analysis/InnerProductSpace/BorelCalculus/DiagonalMeasure.lean`, line 66) is, in its own docstring's words, the scalar spectral measure of a normal bounded operator `a` on a complex Hilbert space at `ξ`: a finite measure on `spectrum ℂ a` with `∫ f dμ_ξ = ⟪ξ, f(a) ξ⟫` (`integral_diagMeasure_eq_inner_cfc`, line 81), total mass `‖ξ‖²` (`diagMeasure_real_univ`, line 95), `∫ |f|² dμ_ξ = ‖f(a) ξ‖²` (line 105), and uniqueness (`eq_diagMeasure_iff`, line 89). On main, OperatorTheory/SelfAdjointSpectralTheory owns the general object: SA-B21 (the diagonal scalar measure `μξ(B) = ⟪ξ, P(B) ξ⟫` of a projection-valued measure) and SA-B31 (the real spectral measure of a bounded self-adjoint operator). For `𝕜 = ℂ`, `a = Matrix.toEuclideanCLM A` and polynomial `f`, the moment bullet of 1.1 and `μ(ℝ) = ‖b‖²` are these identities; on `A = diag(1, 2, 4)`, `b = (1, 1, 1)` both give `δ₁ + δ₂ + δ₄`. The library's object does not replace 1.1's: it is for complex Hilbert spaces only, lives on the spectrum inside `ℂ`, and does not cover real matrices, so the definition here stays as the matrix variant.

Smallest change: in "Scope and ownership" and the supplier contracts, name `ContinuousLinearMap.diagMeasure` and SelfAdjointSpectralTheory SA-B21, SA-B31 as the owners of the general object, and say in one clause how 1.1 differs (Hermitian matrices over `ℝ` or `ℂ`, a measure on `ℝ` given by its atoms). Then add to 1.1 the comparison as a bullet: for `𝕜 = ℂ`, `spectralMeasure hA b` is the image of `(Matrix.toEuclideanCLM A).diagMeasure b` under `z ↦ Re z`. That statement elaborates at the pins (checked in a scratch file, with the normality of `Matrix.toEuclideanCLM A` as an instance hypothesis).

## C01 — Two hypotheses `0 < k` are not needed by the statements that carry them

In 2.4 (`sum_christoffelNumber_div_eq_convs`) the first identity also holds at `k = 0`: the sum is empty and the `0`-th convergent of the J-fraction is its head term `0`, so both sides are `0`. In 3.1 (`IsCGIterate.lanczos`) the Gauss-remainder clause also holds at `k = 0`: the sum over `Fin 0` is empty and `∫ λ⁻¹ dμ = ‖e₀‖_A²`, which is the preceding clause with `monic μ 0 = 1`. Either drop the two hypotheses, or keep the README's range `1 ≤ k ≤ g` and say that `k = 0` is the trivial case.

## N01 — 2.2, the Gauss rule of 2.3 and 2.4 are statements about a finitely supported measure alone, reachable only through a matrix

Their Lean forms take `spectralMeasure hA b`, so a consumer with a finite measure with `g` atoms must first present it as the spectral measure of a diagonal matrix. Would a sentence in "Scope and ownership" saying that every finite measure with finite support arises this way (`A = diag(t_l)`, `b_l = √w_l`), so that these are the finite-support counterparts of SpecialFunctionsOrthogonalPolynomialsGeneral 5.1, 5.3 and 9.2, serve?

## N02 — "For outliers below (`t ≤ a`) the factor is `c/t − 1`" (4.3) holds for `0 < t ≤ a`

The statement lets `O` be any finite set of reals; at `t = −1`, `a = 1`, `c = 9` the factor is `max(2, 10) = 10`, not `c/t − 1 = −10`. Writing `0 < t ≤ a` settles it.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 spectral measure and grade | `diag(1,2,4)`,`(1,1,1)`; `diag(1,1,2)`,`(1,1,0)`; `diag(−1,0,4)`; `b = 0`; empty `ι` | moments `3,7,21,73` both sides; grades `3, 1, 3, 0, 0` = atom counts; `dim K_k = 0,1,1,1`; bound `5/4 ≤ 3` | holds | R01 (ownership only) |
| 1.2 termination and strict decrease | `diag(1,2)`,`(1,1)`; `2I`,`(1,0,2)`; `x₀ = A⁻¹b` | `x₁ = (2/3,2/3)`, `‖e‖_A² = 3/2 > 1/6 > 0`; `g = 1`, `x₁ = b/2`; `g = 0`, all iterates `x₀` | holds | none |
| 2.1 Lanczos = Stieltjes | seven pairs incl. repeated eigenvalue, zero component, indefinite, `b = 0`, size 1; `j ≤ n+3` | `gs_j = monic μ j (A) b` exactly; (b) both sides equal, `0 = 0` past `g`; `h_g = α_g = β_g = 0`; `T_k` = Jacobi for `k ≤ g` | holds | none |
| 2.1 Check `k = g+1` | `A = (3)`, `b = (2)` | `T_2 = diag(3,0)`, charpoly `X² − 3X`; `monic μ 2 = X² − 9` | (d) needs `k ≤ g` | none |
| 2.2 Ritz values | `diag(1,2,4)`; `diag(1,2,3,6)`; `k = 0`, `k = g` | roots `7/3`; `(18 ± √79)/7 ∈ (1,4)`; `1,2,4`; `k = 0` empty multiset | holds | none |
| 2.3 Gauss | `diag(1,2,4)`, `k = 1,2,3`, degrees `0..5` | `3(T_k^j)₀₀`: `3,7,49/3`; `3,7,21,73,1893/7`; exact; true moments `3,7,21,73,273` | exact below `2k`, fails at `2k` | none |
| 2.4 J-fraction | `z = 3`, `k = 1,2,3`; `k = 0` | `3F_k(3) = 9/2, −2/5, 1/2`; `∫ dμ/(3−λ) = 1/2`; `k = 0`: `0 = 0` | holds | C01 |
| 3.1 residual and Gauss remainder | five triples `(A,b,x₀)`, every `k ≤ g`, incl. `g = 0` | `r_k` = `monic(A)r₀/monic(0)` exactly; `‖e_k‖_A²` = integral exactly; `3/2 − 4/3 = 1/6` | holds | C01 |
| 3.2 Hestenes–Stiefel | same five, `k ≤ n+3` | iterate = Galerkin minimizer; `γ = 2/3, 3/4, 0, 0`; drops `4/3`, `1/6`; `γ_k > 0` iff `k < g` | holds | none |
| 4.1 general points | `(1,3)`, `(1,2,4)`, `(1/2,1,4,9)`, `(2,3,7,8)`, `(5)` | `V = 1/2, 1/5, 85/341, 1/15, 1`; exact least squares gives `V²` each time | holds | none |
| 4.1 Chebyshev points | `[1,3]` `k=1,2`; `[1,9]` `k=1`; `k=0` | `V = 1/2 = 1/T₁(2)`; `1/7 = 1/T₂(2)`; `4/5 = 1/T₁(5/4)`; `1` | holds | none |
| 4.2 Greenbaum | `diag(1,2,4)` `k=1`; `diag(1,2,4,8)`, `diag(1,3,3,9)` `k=2`; `k ≥ m`; `k=0` | `E = 3/5 = V{1,4}`; `3/7 = V{1,4,8}`; `2/5 = V{1,3,9}`; grid max ratio² `9/34 < 9/25`; `0`; `1` | holds | none |
| 4.3 outliers | `{1,4,9,100}`; `{1/4,1,2,4,9}`; `{2,2,2,30}` `a=c`; `t ≤ 0` in `O` | ratios `0.326, 0.125, 0.061` vs bounds `1.98, 0.99, 0.495`; ratios `≤ 0.45` vs `70·2^(1−k)`; `x₂ = A⁻¹b`, bound `0` | holds | N02 |
| 4.4 Chebyshev recurrence, heavy ball | `[1,9]`; `k = 0,1` | `ω = 2, 25/17, 17/13 → 5/4`; step `→ 1/4`; `k=1` ratio² `377/656 ≥ 1/36` | holds | none |
| 5.1 Kaniel–Paige–Saad | `diag(1,2,3,6)` `k=0,1,2`; `a = c`; `a > c`; both negative controls | bounds `−9, 81/16, 5751/961 ≈ 5.9844` vs `θ = 3, 5.6211, ∈(5.989,5.990)`; controls give `2 ≤ 1`, `3/2 ≤ 1` | holds; hypotheses needed | none |
| 5.2 Ritz residual | `diag(1,2,4)` `k=2`; Householder conjugate; `k = g` | `ε² = 27/98 + 45√79/7742`; enclosure `−0.244 ≤ −0.159 ≤ 0.282`; `β₂ = 2187/61009` for the other `b`; `β_g = 0` | holds | none |
| R01 comparison | `A = diag(1,2,4)`, `b = (1,1,1)`, `𝕜 = ℂ` | atoms `⟨b, P({t}) b⟩ = 1` at `t = 1,2,4` on both sides; total mass `3 = ‖b‖²` | same object | R01 |

- Source locators checked against the text: 14 (Meurant–Strakoš 6, Saad *Iterative Methods* 4, Saad *Eigenvalue Problems* 2, Liesen–Tichý 2); all agree in number, page and content.
- Library declarations opened at the pin: 25 Mathlib names (18 elaborated by `#check`, 7 located by file and line); Tau Ceti `RayleighRitz.lean` (line 83) and `BorelCalculus/DiagonalMeasure.lean` (lines 66–105).
- Cross-roadmap citations resolved: 28 declarations and sections in five suppliers (SpecialFunctionsOrthogonalPolynomialsGeneral and FirstOrderOptimization on main; IterativeMethodsForLinearSystems, HankelFormsAndRealMomentProblems, EigenvalueIterations at their open heads); all exist with the hypotheses the README states; the 18 copied definitions are verbatim.
- Dependency check: `depcheck: 132 roadmaps, 1464 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with `sorry` the only warning; `#check @name` run for all 16 theorems and compared with the README, no statement differs; four definitions do not carry `[DecidableEq ι]`, which their bodies do not use.
- One-tactic probe (`rfl`, `simp`, `infer_instance`) on a scratch copy: none of the 16 theorems closes.
- Overlap check: read IterativeMethodsForLinearSystems, EigenvalueIterations, HankelFormsAndRealMomentProblems, PolynomialInterpolationAndBestApproximation, SpecialFunctionsOrthogonalPolynomialsGeneral, VariationalMethods, and OperatorTheory/SelfAdjointSpectralTheory; shared: the scalar spectral measure of a vector, owner SelfAdjointSpectralTheory (R01); the zeros, Gauss rule and J-fraction of a finitely supported measure are stated only here (SpecialFunctionsOrthogonalPolynomialsGeneral states them for infinite support), owner this roadmap.
- Source independence: 9 passages compared with 4 sources, none shared; largest share Meurant–Strakoš, 6 of 19 locators; contents compared with Meurant–Strakoš: independent (its §§2–3 precede as Layers 2–3 do, an order the *Needs* line of 3.1 forces; Layers 1, 4, 5 have no counterpart and its §§4–5 are excluded). Hestenes–Stiefel could not be read.
- Research link: Layers 2–3 are the Lanczos–Gauss quadrature dictionary on which Meurant–Strakoš (2006) base the analysis of Lanczos and conjugate gradients; 4.2 is Greenbaum's (1979) worst-case theorem as surveyed by Liesen–Tichý (2004); 5.1 is the Kaniel–Paige–Saad bound (Saad 2011). Rests on the README's sources and the texts read.

## Not verifiable

- Hestenes–Stiefel (1952), Theorem 6:1 and (6:1), p. 416; §14, (14:3)–(14:4), pp. 427–429: the NIST archive's host is in no class the sources service reads, by URL or by DOI; no other legal copy was looked for.
- Greenbaum (1979), Kaniel (1966) and Paige's thesis: attributed in prose without locators, not read.

Automatic checks set aside as false positives: none (every check passed).

## Source issues

- none

## For the human reviewers

- **Scope.** 3.2 defines the Hestenes–Stiefel recurrence as an iterated map (`hsStep`, `hsIterate`) and 4.4 the three-term Chebyshev recurrence, and proves what their values are; IterativeMethodsForLinearSystems lists this equality as outside its scope. Whether such targets fall under the rule against algorithms is yours to decide.
- **Licence.** Hestenes–Stiefel (1952) is cited from the NIST archive (`nvlpubs.nist.gov`), a host the sources service could not classify; its five locators were not checked.
