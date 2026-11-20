# Review of StochasticApproximationAveraging (pull request #2744 at 687b64b)

**Verdict:** needs changes

**Summary.** Changes are needed for one reason: a computed value in the third Check of 1.2 is wrong by five orders of magnitude (a double-precision artefact), and replacing that one number repairs it. The four headline theorems, their Lean statements, the supplier citations and every other numerical Check were recomputed or read at their locators and stand. There are one small correction and two format notes, none blocking; the human reviewers have one point about the paywalled primary source and one about the unsourced Layer 4.

## R01 (P2) — The largest gain norm at `t = 4000` in the third Check of 1.2 is about `1.24·10²¹`, not `3.0·10²⁶`

The Check (README line 168) reports `max_i ‖B^t_i‖` for `A = [[1, 4], [−4, 1]]`, `γ t = (t + 1)^(−0.3)` as "`4.5·10³⁵, 9.0·10⁴⁰, 9.1·10³⁸, 3.0·10²⁶` at `t = 500, 1000, 2000, 4000`". A reader who reproduces the last value in exact or extended arithmetic gets a number 240 000 times smaller and cannot tell whether the definition of `gainMatrix` or the Check is at fault.

`A` lies in the copy of `ℂ` inside the real `2 × 2` matrices (it is `1 + 4i`), so `‖B^t_i‖ = |γ i · T_i|` with `T_{t−1} = 1`, `T_i = 1 + (1 − γ (i + 1) (1 + 4i)) T_{i+1}`. Running this recursion with 90, 150 and 300 significant decimal digits gives the same values each time: `4.5161·10³⁵`, `9.0393·10⁴⁰`, `9.1283·10³⁸`, `1.2408·10²¹`, the maximum at `i = 0` in all four cases. In double precision the same recursion returns `9.4·10²⁵` at `t = 4000`: the partial products reach about `10⁴¹` near index 1250 and the sum cancels twenty orders of magnitude, below what sixteen digits can resolve. The first three values are confirmed. (At `t = 8000` the maximum is `0.4176`, at `i = 7989`.)

The smallest change: replace `3.0·10²⁶` by `1.2·10²¹`, and say that this value needs more than double precision. The conclusion of the Check, that the bound of the lemma is finite and not small, is unaffected, since the value `9.0·10⁴⁰` at `t = 1000` already shows it.

## C01 — The deterministic start in 3.1 is not used by the route, which proves the theorem for any measurable start

In 3.1 (README line 250, `hx₀` in the Lean statement) the start is a constant `x₀`. The route uses the start only twice: through 2.1, which asks that `x 0` be almost everywhere strongly measurable, and for the measurability of `√t (x̄ t − x⋆)`, which follows from that of `x 0`, `R` and the `ξ t`. No independence of the start from the noise enters, because the term `t^(−1/2) B_t (x 0 − x⋆)` tends to `0` pointwise whatever the joint law. The statement with `Measurable (x 0)` in place of the constant would be the general one at no extra cost; the deterministic start, which is what Cutler, Díaz and Drusvyatskiy assume, would then be its special case. If the constant start is kept on purpose, a clause saying so would do.

## N01 — Two sentences describe the state of other roadmaps at the time of writing

"an open roadmap, not on main" (Scope and ownership, line 391) and "which neither library nor any roadmap on main provides" (Summary, line 36, and line 395) will be out of date once LinearSystemsAndControl merges or a martingale central limit theorem lands (the roadmap MartingaleCentralLimitTheorem, sections 2.3 and 3.1, plans one). Naming the supplier and its section, and saying only that the martingale central limit theorem is not consumed here, would stay true.

## N02 — The gain comparison of 4.1 carries no source locator

4.1 is marked "Proved here", and the limit `(σ²/a²) · 2ca/(2ca − 1)` of the third layer's Checks is likewise derived in the text. Both are classical (the comparison of the averaged covariance with that of a matrix gain `Γ/(t + 1)` goes back to the literature on optimal gains in stochastic approximation), and a locator to a refereed statement would let a reader check the normalisation `Γ A − ½` against print.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 positive stability, constant regime | `A = [[1,4],[−4,1]]`, `η = 0.1, 0.12`; `A = diag(1,10)`, `η = 1`; `d = 0` | threshold `2 Re(1/(1+4i)) = 2/17`; `|1 − 0.12(1+4i)|² = 0.7744 + 0.2304 = 1.0048`; `1 − 10 = −9`; empty spectrum | agrees | none |
| 1.1 decreasing regime, API | `c (t+1)^(−α)`; `c/(t+1)` | ratio `1/(t+2)` over `c/(t+1)` → `1/c ≠ 0`; `1/γ(t+1) − 1/γ t = o(1)` since `γ(t+1)/γ t → 1` | agrees | none |
| 1.1 Check, constant gains | `η = 0.1`, `0.12`, `t = 200, 2000` | max norm `0.4579` (both `t`); `0.629` then `29.02` (growing) | agrees with "below 0.46" and "unbounded" | none |
| 1.2 unrolling identity | derivation from `Δ_{j+1} = (1 − γ_j A) Δ_j − γ_j (ξ_j + r_j)` | inner index `m = j − i − 1 < t − i`, matches `gainMatrix`; first term `Σ_{m<t} stepProduct 0 (m+1)` | agrees | none |
| 1.2 identity `B^t_i − A⁻¹` | telescoping `Σ γ_j A Φ(j,i) = 1 − Φ(t+1,i)` | both sides `Σ (γ_i − γ_j) Φ − A⁻¹ Φ(t+1,i)`; constant step: `A⁻¹(1 − M^(t−i))` | agrees | none |
| 1.2 gain lemma (sampled) | scalar `a = 1`, `α = 0.3, 0.6`, `t = 10³, 10⁴, 10⁵`; `γ = 2/(t+1)` | Cesàro `0.01368, 0.00296, 0.00061`; `0.1088, 0.0469, 0.0194`; `0.5000` | agrees | none |
| 1.2 third Check | rotation `A`, `α = 0.3`, `t = 500, 1000, 2000, 4000`, 90/150/300 digits | `4.5161e35, 9.0393e40, 9.1283e38, 1.2408e21`; README has `3.0e26` for the last | last value false | R01 |
| 2.1 asymptotic linearity (sampled) | unbounded variances `N(0, i+1)`, `η = 1/2`; non-measurable start on `ℕ` with trivial σ-algebra | middle-term variance `0.33322, 0.33332` → `1/3`; `x̄`-term `(1 − 2^(−t)) n/√t`, outer measure 1 | both hypotheses needed; statement consistent | none |
| 2.1 route without measurability of `R`, `x t` | `TendstoInMeasure` at the pin is stated with the measure of sets `{ε ≤ edist}` | third term dominated pointwise, set inclusion + outer-measure monotonicity and subadditivity | route sound | none |
| 3.1 central limit theorem (sampled) | scalar `α = 0.3, 0.6`, constant `1/2`; rotation `A`, `α = 0.6` | `1.00346, 1.00074, 1.00015`; `1.0353, 1.0133, 1.0051`; `0.99983, 0.999983`; `0.05999, 0.05926` vs `1/17 = 0.05882` | agrees | C01 |
| 3.1 Check at `α = 1` | `c = 2, 1, 1/4`, `a = 1` | `1.33335` vs `4/3`; `1.99988` vs `2`; `9.19, 30.86, 99.54`; closed form `∫(1 − u^k)² c²/k² = 2ca/(a²(2ca − 1))`, `k = ca − 1` | agrees | none |
| 3.2 linear case (sampled) | `R θ = A(θ − θ⋆)` | linearization quantity `0`; limit `N(0, σ²)` for `d = 1`, `a = 1` | agrees | none |
| 4.1 gain comparison (sampled) | `d = 1`: `c = 0.75, 1, 2`; `c = 1/4`; `S = −1`; matrix example; `d = 0` | `V = 1.125, 1, 4/3`, `t·Var = 1.12383, 1.00000, 1.33334`; `−1/8`; `−1/3`; `V = (0.091371, 0.025178, 0.265803)`, `tC_t = (0.091372, 0.025178, 0.265804)`; `A⁻¹SA⁻ᵀ = (14, −3.5, 37)/289` | agrees | N02 |
| 4.1 route | `W = V − A⁻¹SA⁻ᵀ` | `BW + WBᵀ = ΓSΓᵀ − ΓSA⁻ᵀ − A⁻¹SΓᵀ + A⁻¹SA⁻ᵀ = (Γ − A⁻¹)S(Γ − A⁻¹)ᵀ`; `lyapunov_eq_iff` at `−Bᵀ` gives `∫ exp(−tB) Q exp(−tBᵀ)` | sound; `V` symmetric by uniqueness | none |
| Conventions: averaged iterate | shift of the average by one index | difference `(x 0 − x t)/√t` | agrees | none |

- Source locators checked against the text: 10 (CutlerDiazDrusvyatskiy lines 1519–1857: iteration (40), Assumptions B.1 and B.2, displays (41)–(43), Theorem B.1, remarks (a), (b), displays (45)–(50); DuchiRuan line 3492, Lemma 20.3, with Assumption F at line 2189; MouEtAl lines 381 and 417–427, Theorem 1).
- Library declarations opened at the pin: 12 (`TendstoInDistribution` ConvergenceInDistribution.lean:64, `continuous_comp` :136, `tendstoInDistribution_of_tendstoInMeasure_sub` :192; `TendstoInMeasure` ConvergenceInMeasure.lean:57, `tendstoInMeasure_of_tendsto_ae` :219, `tendstoInMeasure_of_tendsto_eLpNorm` :445; `multivariateGaussian` Multivariate.lean:166, `charFun_multivariateGaussian` :233; `Measure.ext_of_charFun` CharacteristicFunction/Basic.lean:257; `condExp_bilin_of_stronglyMeasurable_left` PullOut.lean:151; `iIndepFun.condExp_natural_ae_eq_of_lt` BorelCantelli.lean:51; Gelfand formula GelfandFormula.lean:121) and Tau Ceti `covMatrix` Covariance.lean:72, `posSemidef_covMatrix` :119.
- Cross-roadmap citations resolved: MathematicalStatisticsAsymptotic 1.2 on main (README line 465, `Suggested.lean` line 137); LinearSystemsAndControl 5.1 and 5.2 at its open head (`IsHurwitz`, `IsSchurStable`, `isHurwitz_iff_exists_posDef`, `lyapunov_eq_iff` all present with the cited statements); MarkovDecisionProcesses Layer 6 on main.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line. LinearSystemsAndControl is an open pull request that adds a new roadmap folder.
- Elaboration: `Suggested.lean` elaborates with four `sorry` warnings and nothing else; `import Mathlib` plus one Tau Ceti module; no `set_option`, no sorry'd data. Elaborated types compared with the README statements: no binder lost, nothing changed.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `exact?`) on a copy: 0 of 4 theorems closed. Headlines: the gain lemma, asymptotic linearity, the central limit theorem, the gain comparison; all four are stated.
- Ownership: every open head and main searched by object (Polyak–Ruppert, averaged iterate, positively stable, gain matrices, Robbins–Siegmund). `IsPositivelyStable A` is `IsHurwitz (−A)` of LinearSystemsAndControl 5.1, restated only to make the headlines statable and cited as such; no other shared object. No change outside the folder; the pull request's text agrees with the head.
- Overlap check: read SeriesOfIndependentRandomVariables, MartingaleCentralLimitTheorem, KalmanFiltering, FirstOrderOptimization, MathematicalStatisticsAsymptotic, MarkovDecisionProcesses; nothing shared (the martingale central limit theorem is MartingaleCentralLimitTheorem's and is out of scope here; Robbins–Siegmund and SGD are FirstOrderOptimization Layer 5 and are not stated here).

Source independence: 15 passages compared with 3 sources (10 locators and 5 further passages: the definition of the gains, the routes of 2.1 and 3.1, the recursion in the Conventions, the docstring of `gainMatrix`), none shared beyond formulas; largest share CutlerDiazDrusvyatskiy, 8 of 14 locators; contents compared with CutlerDiazDrusvyatskiy Appendix B: independent (the appendix is one unit; Layers 1 and 4 and the i.i.d. route of Layer 3 are not in it).

Research link: The headline is Polyak and Juditsky (1992), Theorem 2, and Ruppert (1988); Cutler, Díaz and Drusvyatskiy (2024) restate and use it for decision-dependent problems, Duchi and Ruan (2021) for asymptotic optimality, Mou, Li, Wainwright, Bartlett and Jordan (2020) extend it to constant steps. Rests on the README's references and the three texts read.

## Not verifiable

- Polyak and Juditsky (1992), Lemma 1 and Theorem 2: paywalled (SIAM); checked only as Cutler, Díaz and Drusvyatskiy and Duchi and Ruan quote them.
- Ruppert (1988) and Robbins and Monro (1951): attribution only, not opened.
- The "288 random instances" of the fourth Check of 4.1: the count and the instances are not reproducible from the text; the claim they support was checked on the instances in the table.

## Source issues

- **Error** in CutlerDiazDrusvyatskiy at Assumption B.2 (i), display (41), printed page 28: the source says a constant step below twice the reciprocal of the smallest real part of an eigenvalue is admissible; it should be that every eigenvalue `μ` satisfies `|1 − η μ| < 1` (for `A = diag(1, 10)`, `η = 1` the iteration diverges); affects a stated result.

## For the human reviewers

- **Licence / primary source.** Polyak and Juditsky (1992) is paywalled; neither the author nor this review read it. Lemma 1 and Theorem 2 are cited through arXiv:2207.04173v3 (lines 1595, 1767) and arXiv:1612.05612v4 (line 3492).
- **Scope.** Layer 4 (the gain comparison) and the `α = 1` limit formula have no refereed locator; the README derives them itself (README lines 282 and 333).
