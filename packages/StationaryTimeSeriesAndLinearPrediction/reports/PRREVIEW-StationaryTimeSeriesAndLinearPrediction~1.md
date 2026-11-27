# Review of StationaryTimeSeriesAndLinearPrediction (pull request #3198 at 4cb00d7)

**Verdict:** accepted

**Summary.** Accepted: every one of the eleven stated theorems, the five definitions and every Check was recomputed by hand (degenerate orders, singular matrices, non-stationary families, the junk values of `Matrix.inv`, of `0/0` and of `tsum`) and none failed; `Suggested.lean` elaborates with `sorry` as its only warning and no theorem closes with one tactic. There are no findings, no small corrections and four format notes, none blocking. Jan Grandell's notes could not be read from a legal place, so its locators (the only ones given for 2.2 and 3.4) are unverified, and the humans who approve should note that both cited sources are lecture notes.

## N01 — 2.2 has a readable locator that the text does not give

For 2.2 the only locator is Grandell, Thm. 5.2, p. 41. Wang states the same identity, the partial autocorrelation at lag `k` equals the last coefficient `φ_kk`, as Corollary 5.1 on printed p. 72 (wang-stat720 lines 3114–3148, under zero mean and `γ(h) → 0`). Adding it would give 2.2 a second, openly readable locator.

## N02 — The scope paragraph describes another roadmap by its present status

"PositiveDefiniteSequencesAndToeplitzForms (an open roadmap, not on main)" in Scope and ownership (README line 479) stops being true when that roadmap merges. Naming the roadmap and what it treats is enough.

## N03 — The *Needs:* lines of 2.1 and 2.2 omit 2.0

Both statements are about the Yule–Walker coefficients of 2.0 (and 2.2 about the partial autocorrelation defined there), but only 2.3 and 2.4 list 2.0 (README lines 227 and 259).

## N04 — The step "equal Gram matrices give equal distances" is already in Tau Ceti

The routes of 1.2, 2.2 and 2.3 each argue that two families with the same Gram matrix have the same distances to the corresponding spans, by going back to the system of 1.1. The pinned Tau Ceti has the isometry of spans directly: `TauCeti.spanEquivOfInnerEq` with `TauCeti.spanEquivOfInnerEq_apply` (`TauCeti/Analysis/InnerProductSpace/Gram/Rigidity.lean`, lines 91 and 103; OrthogonalGeometry records it). The routes are correct as written; citing it would shorten them, and the README would then need a `### From Tau Ceti` contract.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.0 stationarity, `autocov`, `autocovMatrix` | cosine series; `λ = π`; `X t = tA`; symmetry `s = h, t = 0` | `⟪X s, X t⟫ = cos λ(t−s)`; `(−1)ʰ`; `‖X 1‖ = ‖A‖ ≠ 0 = ‖X 0‖`; `γ(−h) = γ(h)`; Gram entry `γ(j−i) = γ(i−j)` | holds | none |
| 1.1 `isLeast_norm_sub_iff_yuleWalker` | `n = 0`; `γ = 2^(−|h|)`; constant series `n = 2`; `X0 = X1 = A, X2 = 0` | error `γ(0)`; `a = (1/2,0,…)`, `1 − 1/4 = 3/4`; `a_0 + a_1 = 1`, error `0`; system gives `a = 1`, optimum `a = 0` | holds; stationarity needed | none |
| 1.2 `det_autocovMatrix_eq_prod` | `n = 0`; `γ = (2,1,0,…)`; cosine `λ = π/3` | `1 =` empty product; `D_n = 2D_{n−1} − D_{n−2} = n+1`, `d_k² = (k+2)/(k+1)`; `det Γ_2 = 3/4`, `det Γ_3 = 0 = d_2` | holds, singular case included | none |
| 1.3 `posDef_autocovMatrix_of_tendsto_zero` | `n = 0, 1`; cosine `λ = π/3`; zero series; route bound | empty matrix PD; `Γ_1 = (γ(0))`; `Γ_3` singular with `γ ↛ 0`; `Γ_1 = (0)`; `γ(0) ≤ (γ(0)/λ)^{1/2}(∑γ(m−j)²)^{1/2} → 0` | holds; both hypotheses needed | none |
| 2.0 `predCoeff`, `pacf` | `n = 0, 1` (`Fin (n−1)` empty); zero series; AR(1) lag 2 | `pacf X 0 = γ(0)/γ(0) = 1`; `pacf X 1 = γ(1)/γ(0)`; `0/0 = 0`; raw correlation `1/4`, `pacf X 2 = 0` | definitions fix the object | none |
| 2.1 `predCoeff_succ` | `n = 0`; AR(2); MA(1) `θ = 1/2`; constant series `n = 1`; block equations by hand | `κ = γ(1)/γ(0)`; `κ = 2/5, −1/4`, `v = 21/25, 63/80`, coefficients `(1/2, −1/4)`; `κ = 2/5, −4/21, 8/85`, `v = 21/20, 85/84, 341/340`; `0 ≠ 1 − 0·1` | holds without stationarity; PD needed | none |
| 2.2 `pacf_eq_predCoeff_last` | `n = 0` with `γ(0) = 0` and `> 0`; cosine lags 2, 3; `X0 = e₁, X1 = e₂, X2 = 2e₁` | `0 = 0`; `γ(1)/γ(0)` both sides; `−1 = (−1/2 − 1/4)/(3/4)`; `0 = 0` (singular `Γ_3`); `pacf = 1`, last coefficient `2` | holds; stationarity needed | none |
| 2.3 `posDef_autocovMatrix_succ_iff` | `n = 0`; `γ(0) = 0`; constant series; cosine; `X0 = e₁, X1 = e₂, X(−1) = e₁/2` | `γ(0)² > γ(1)²` ⇔ `γ(0) > 0 ∧ |ρ(1)| < 1`; both false; `pacf = 1`, `Γ_2` singular; `pacf X 2 = −1`, `Γ_3` singular; rows `(1,1/2),(0,1)` not Hermitian | both directions hold; stationarity needed | none |
| 2.4 `pacf_eq_zero_of_lt` | `p = 0, h = 1`; AR(2) `h = 3`; MA(1) with `p = 0` | indices `h−1−j ∈ [h−p, h−1] ⊆ [1, h−1]`; numerator `⟪W, r_0⟫ = 0`; hypothesis fails, `pacf X 1 = 1/2` | holds without stationarity | none |
| 3.1 `summable_abs_of_convolution_eq` | `φ = 0`; constant `c ≠ 0`; `1 − z/2 + z²/4`; `1 − 2z`; `1 − z` | hypothesis false at `z = 0`; `ψ = (1/c, 0, …)`; roots `1 ± i√3`, `ψ = 1, 1/2, 0, −1/8, −1/16, 0, 1/64`, `∑ψ² = (5/4)(64/63) = 80/63`; `2ʲ`; `1` | holds; root condition needed | none |
| 3.2 `exists_causal_solution_iff` | `φ = 0`; `φ = 1 − z/2`; `Z = 0, φ = 1 − 2z`; finitely supported sequences | both sides false (`0 = Z t`, `‖Z t‖² = σ² > 0`); `γ(h) = (4/3)σ² 2^(−|h|)`; `ψ = 0` solves; `tsum = 0` gives `0 = Z t`, finite `ψ` forced to `2^(−j)` | both directions hold; `σ² > 0`, completeness needed | none |
| 3.3 `hasSum_of_bounded_solution` | `φ = 1 − z/2, Z = 0, X t = 2^(−t)A`; `φ = 1 − z, X = A`; tail bound | unbounded, series `0 ≠ X t`; `ψ ≡ 1`, series `0 ≠ A`; error `≤ C·A·∑_{j > N−d} |ψ_j| → 0` | holds in any inner product space | none |
| 3.4 `wold_decomposition` | white noise; MA(1) `|θ| < 1`; `W t + C`; cosine series | `ψ = (1,0,…)`, `V = 0`; innovation `W t`, `ψ = (1, θ, 0, …)`; `‖avg‖² = σ²/N → 0`, `V t = C ∈ ⋂ M_s`; `X t ∈ M_{t−1}`, `σ² = 0` | holds; steps (a)–(f) rechecked | none |

- Source locators checked against the text: 8 in Wang (Thm. 2.5 p. 31; (5.2) p. 65; Properties 1–2 and Prop. 5.1 p. 66; §5.4 definition and Example 5.4 p. 71; Prop. 5.3 p. 73; §6.5 p. 101), all supporting the statements with the hypotheses the README reports; 0 of 10 in Grandell.
- Library declarations opened at the pin: 20 (`Matrix.gram`, `posSemidef_gram`, `posDef_gram_iff_linearIndependent`, `det_gram_ne_zero_iff_linearIndependent` in `GramMatrix.lean` 40–126; `Matrix.PosDef` with its Hermitian clause, `PosDef.submatrix`, `det_pos`, `isUnit`, `PosSemidef.posDef_iff_isUnit` in `PosDef.lean` 176–605; `det_fromBlocks₁₁` `SchurComplement.lean` 369; `nonsing_inv_apply_not_isUnit` 173; `norm_eq_iInf_iff_real_inner_eq_zero` `Minimal.lean` 250; `starProjection_inner_eq_zero` 164; `starProjection_tendsto_closure_iSup` 138; `Orthonormal.inner_products_summable` 462; `OrthogonalFamily.summable_iff_norm_sq_summable` 212; `Summable.of_norm` 194; `summable_norm_sum_mul_antidiagonal_of_summable_norm` 96; `Polynomial.Splits.eq_prod_roots` 298; `Metric.infDist` 464); all exist as described.
- Duplication by object: the pinned Mathlib and Tau Ceti have no second-order stationarity, autocovariance, Yule–Walker, Durbin–Levinson, partial autocorrelation, causal autoregression or Wold statement (Tau Ceti's `Probability/Exchangeability/Stationary.lean` is strict stationarity of laws); `LinearMap.normDet_sq_eq_det_gram` is not 1.2.
- Cross-roadmap citations resolved: MathematicalStatisticsFoundations §9.6 (main, README lines 1520–1527: the same condition, symmetry and positive semidefiniteness, no Lean declaration); KalmanFiltering Layers 2–4 (main); PositiveDefiniteSequencesAndToeplitzForms (open; its `toeplitzSection` has the same `i − j` convention, over `ℂ`).
- Dependency check: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; no change outside the folder.
- Elaboration: `lake env lean` on `TauCetiRoadmap/StationaryTimeSeriesAndLinearPrediction/Suggested.lean` gives 11 `sorry` warnings and nothing else; the 16 elaborated types were compared with the README (no lost binder; `[CompleteSpace E]` present in 3.2 and 3.4 only, as the README says). One-tactic probe (`rfl`, `simp`, `infer_instance`) on a copy: 0 of 11 close.
- Headline theorems (1.1–1.3, 2.1–2.4, 3.2–3.4, with 3.1 as their analytic input): all 11 stated; none declared not statable.
- Automatic checks: all passed.

Overlap check: read PositiveDefiniteSequencesAndToeplitzForms (open), KalmanFiltering, GaussianLinearModels and OrthogonalGeometry (main), and MathematicalStatisticsFoundations §9.6; second-order stationarity and positive semidefiniteness of `Γ_n`: owner MathematicalStatisticsFoundations, named here only as a Lean predicate over `ℝ`; Toeplitz sections of arbitrary sequences and determinant criteria: owner PositiveDefiniteSequencesAndToeplitzForms, `autocovMatrix` being the real specialisation the statements need; state-space innovations: KalmanFiltering; least-squares normal equations for a design: GaussianLinearModels; nothing else shared.

Source independence: 13 passages compared with 1 source (8 locators and 5 further passages: the routes of 1.1, 2.1, 2.2 and 3.2 and the docstring of `pacf`, against wang-stat720 lines 2882–2907, 3200–3249, 1521–1530, 3091–3097), none shared beyond statements the mathematics forces; largest share Grandell, 11 of 19 locator mentions in the layers, text and contents not readable; contents compared with wang-stat720: independent (Layer 1 ↔ §5.2 and §6.5, Layer 2 ↔ §5.4 and §5.5.1, Layer 3 ↔ §2.3.2 and nothing for 3.4; Grandell's pages by layer are 2–32, 33–45, 14–39, not in order).

Research link: the headline targets are the prediction theory of Brockwell–Davis, *Time Series: Theory and Methods* (1991), which the README names as the main source of both sets of notes and MathematicalStatisticsFoundations §9.6 cites; the scope names the Kolmogorov–Szegő formula and spectral prediction as the continuation. Rests on the README.

## Not verifiable

- Grandell, *Time series analysis* (KTH notes): Def. 1.4 p. 2, p. 9, Def. 2.9 p. 14, Thm. 2.3 p. 15, Thm. 4.2 and the remark p. 32, Thm. 4.3 p. 33, Thm. 5.1 p. 39, Def. 5.5 and Thm. 5.2 p. 41, Example 5.3 p. 45. The only copy is on a KTH course page, which the sources service does not accept as a legal place (no licence class; the address names no author); the text was requested. Every statement citing it carries its own complete route, which was checked.

## Source issues

- **Misprint** in wang-stat720 at Corollary 5.1, printed p. 72: the source says the autocovariance tends to zero as the lag tends to zero; it should be as the lag tends to infinity; affects nothing.
- **Misprint** in wang-stat720 at §6.5, printed p. 101: the source says the quadratic form is the sum of squared innovations divided by `ν_j`; it should be divided by `ν_{j−1}`, as in its own likelihood formula below; affects nothing.
- **Misprint** in wang-stat720 at Remark 5.1, printed p. 66: the source says uniqueness follows from a proposition whose number is left blank; it should be Proposition 5.1; affects nothing.
- **Misprint** in wang-stat720 at §5.2, printed p. 67: the source says the norm of a vector is its inner product with itself; it should be the square root of that; affects nothing.

## For the human reviewers

- **Scope.** Both cited sources are lecture notes (Grandell, KTH, undated; Wang, University of South Carolina, 2015); the README names Brockwell–Davis (Springer, 1991) as their main source but gives no locator into it (README lines 530–543).
- **Licence.** Grandell's PDF is on a KTH course page (`math.kth.se/matstat/gru/5b1545/ts.pdf`); the sources service could not classify the host, and no licence is stated in the README.
- **Not tested.** Grandell has the largest share of the locators (11 of 19 mentions in the layers); its text and table of contents could not be read, so wording and arrangement were compared with Wang only.
