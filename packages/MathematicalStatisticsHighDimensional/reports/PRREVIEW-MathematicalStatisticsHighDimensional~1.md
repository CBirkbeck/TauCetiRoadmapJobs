# Review of MathematicalStatisticsHighDimensional (pull request #2396 at 5eade19)

**Verdict:** needs changes

## R01 (P2) — 8.1 overlooks the pinned residual `sin Θ` theorem, which gives the bound with `√2`

**Location:** `TauCetiRoadmap/MathematicalStatisticsHighDimensional/README.md` lines 1686–1693: "The subspace bounds of Tau Ceti's … `SinTheta.lean` … bound the angle by `‖P‖/(ν - ‖P‖)` … both are bounds in `‖P‖`."

**Claim:** The pin already has the residual form, owned on main by OperatorTheory/SpectralSubspacePerturbation (SSP-C17). It yields 8.1's inequality with constant `√2`, so the target restates an owned result with a worse constant and without citing it.

**Witness:** `TauCeti.UnitarilyInvariantSeminorm.mul_map_starProjection_comp_le_map_sylvester_apply`, `TauCeti/Analysis/InnerProductSpace/UnitarilyInvariantSeminorm/SinTheta/Basic.lean:89`: `δ N(P_{Uᗮ} X) ≤ N(AX − XM)`. With `A = Σ + P`, `U = span θ̂`, `X = θ*`, `M = ⟪θ*, (Σ+P)θ*⟫`, `δ = ν − 2‖P‖`: `sin∠ ≤ ‖(I − θ*θ*ᵀ)Pθ*‖/(ν − 2‖P‖)`.

**Repair:** State the bound as `‖θ̂ − θ*‖ ≤ √2 ‖(I − θ*θ*ᵀ)Pθ*‖/(ν − 2‖P‖)` (from `‖θ̂ − θ*‖² = 2(1 − ρ) ≤ 2(1 − ρ²)` for `ρ ≥ 0`; Wainwright's `2` follows), in README and in `leading_eigenvector_perturbation`. Replace the quoted sentences by a citation of the declaration above and of OperatorTheory/SpectralSubspacePerturbation SSP-C17; add both to the supplier contracts, to 8.1's `*Needs:*` and to the `#check` block (import `TauCeti.Analysis.InnerProductSpace.UnitarilyInvariantSeminorm.SinTheta.Basic`). On the README's example (`Σ = diag(2, 1)`, `P = [[0, 1/4], [1/4, 0]]`): `0.2313 ≤ √2 · (1/4)/(1/2) = 0.7071`.

## R02 (P2) — the expected maximum of 1.1 has a second owner

**Location:** `README.md` lines 332–337 and `Suggested.lean` lines 112–119 (`integral_max_le`): "under the same hypotheses `E maxⱼ Zⱼ ≤ √(2c log N)`".

**Claim:** MathematicalStatisticsAsymptotic (open, a new roadmap) states the same theorem under the same hypotheses; this roadmap neither cites it nor says how its statement differs.

**Witness:** MathematicalStatisticsAsymptotic 3.3, "Finite sub-Gaussian maximum (`integral_sup'_le_of_hasSubgaussianMGF`) … `E max_j Y_j ≤ √(2 c log N)`. No independence is assumed", README line 886 and `Suggested.lean` line 421 at its head.

**Repair:** In 1.1 cite MathematicalStatisticsAsymptotic 3.3 for `E maxⱼ Zⱼ ≤ √(2c log N)` (add a `### From MathematicalStatisticsAsymptotic` contract and the dependency in the description), and keep as this roadmap's target only `E maxⱼ |Zⱼ| ≤ √(2c log(2N))`, obtained by applying 3.3 to the `2N` variables `±Zⱼ`; restate `integral_max_le` as that single inequality. No later section of this roadmap uses either bound, so deleting the bullet and the declaration is the alternative.

## R03 (P3) — gate failure: empty section header in `Suggested.lean`

**Location:** `Suggested.lean` line 1284: `/-! ## Library declarations cited in the README -/`.

**Claim:** The push gate fails on `empty-sections` (rule: no `/-! ## ... -/` section header in `Suggested.lean` without a declaration under it); only `#check` commands follow the header.

**Witness:** Gate at 5eade19: `empty-sections=1 … FAIL`, "line 1284: Library declarations cited in the README".

**Repair:** Delete line 1284 (the module docstring, lines 45–46, already announces the `#check` block), or replace it by the line comment `-- Library declarations cited in the README`.

## R04 (P3) — 3.7: the README's `B` is not the Lean's `B`

**Location:** `README.md` lines 879–880: "`B = maxⱼ∈S |(Σ̂_SS⁻¹ X_Sᵀε/n)ⱼ| + λ maxⱼ∈S ∑ₖ∈S |(Σ̂_SS⁻¹)ⱼₖ|`"; `Suggested.lean` lines 518–520 and 544–547.

**Claim:** The Lean takes one maximum of the sum, `maxⱼ (|aⱼ| + λ rⱼ)`; the README takes the sum of two maxima. The Lean statement is the stronger one, so README and Lean differ in generality.

**Witness:** `Σ̂_SS = diag(1, 1/2)`, `a = Σ̂_SS⁻¹X_Sᵀε/n = (1, 0)`, `λ = 1`: row sums of `Σ̂_SS⁻¹` are `(1, 2)`; README `B = 1 + 2 = 3`, Lean `B = max(1 + 1, 0 + 2) = 2`.

**Repair:** In the README write `B = maxⱼ∈S (|(Σ̂_SS⁻¹ X_Sᵀε/n)ⱼ| + λ ∑ₖ∈S |(Σ̂_SS⁻¹)ⱼₖ|)`, and add "at most Wainwright's `B`, the sum of the two maxima". The coordinatewise proof (`β̂_S − β_S = Σ̂_SS⁻¹X_Sᵀε/n − λΣ̂_SS⁻¹ẑ_S`, `|ẑₖ| ≤ 1`) gives this form; on the witness it yields `2`.

## R05 (P3) — declarations in `Suggested.lean` that are not headlines

**Location:** `Suggested.lean`: `choose_le_exp_mul_div_pow` (241), `benjaminiHochbergCount` (894), `stepUpCount_id_eq_bhCount` (901), `tendsto_tracyWidom_centering` (1226), `spikeOverlap_mem_Ioo` (1260), `tendsto_spikeOverlap` (1265).

**Claim:** These are scalar inequalities and limits on free variables, facts about one closed-form definition (which the module docstring, lines 29–31, itself calls "API lemmas, not headlines"), and a bridge that restates a definition; `benjaminiHochbergCount` is used by no headline.

**Witness:** On a scratch copy, `stepUpCount (fun k ↦ (k : ℝ)) α x = benjaminiHochbergCount α x` closes by `simp [stepUpCount, benjaminiHochbergCount, mul_comm]`. `tendsto_tracyWidom_centering` and `choose_le_exp_mul_div_pow` mention no object the roadmap defines.

**Repair:** Delete the six declarations from `Suggested.lean`; the README keeps the statements as prose targets and Checks, with the backticks and Lean names removed from the corresponding bullets (lines 521, 1287, 1749, 1769) and from the copies paragraph (line 238).

## R06 (P3) — three citations without a locator

**Location:** `README.md` line 531 "(Candès–Plan 2011)", line 1458 "(Candès–Plan 2011)", line 1512 "Bickel–Levina 2008", line 1021 "(Akaike 1973)".

**Claim:** A cited result carries an exact locator; these carry none.

**Witness:** CandesPlan2011 line 627 (Lemma 3.1, covering number, `(9/ε)^{(n₁+n₂+1)r}`) and line 295 (Theorem 2.3, restricted isometry of the ensemble); BickelLevina2008 line 236 (Theorem 1).

**Repair:** Write "(Candès–Plan 2011, Lemma 3.1)" at line 531, "(Candès–Plan 2011, Theorem 2.3, by the same argument)" at line 1458, "Bickel–Levina 2008, Theorem 1" at line 1512, and give the page of Akaike's paper where the bias correction `k` is derived, or drop that citation: the identity is proved in the bullet.

## R07 (P3) — 8.2's `*Needs:*` omits the supplier its route uses

**Location:** `README.md` line 1726: "*Needs:* 8.1; 1.1, 1.3; Tau Ceti `exists_finset_isCover_sphere`." and lines 1805–1806 (Layer 8 Dependencies).

**Claim:** The route of 8.2 applies Bernstein's inequality for sub-exponential sums, which 1.3 consumes and does not state; the supplier contract assigns it to 8.2, the `*Needs:*` line and the layer's dependencies do not.

**Witness:** `README.md` lines 271–272: "Bernstein's inequality for independent sums of such variables (V Theorem 2.8.1), for 1.3 and 8.2"; line 1722: "the first term by Bernstein's inequality for the sub-exponential `ξᵢ² - 1`".

**Repair:** Line 1726: "*Needs:* 8.1; 1.1, 1.3; RandomMatrices §2.1 (Bernstein's inequality for sub-exponential sums); Tau Ceti `exists_finset_isCover_sphere`." Lines 1805–1806: "RandomMatrices §§2.1, 2.4 (through 1.3), 4.1, 4.4, 4.5, 7.3."

## R08 (P3) — 7.3: the route does not cover nodes without neighbours

**Location:** `README.md` lines 1575–1578: "The proof applies 3.7 to each node regression" and line 1580 (`*Needs:*`).

**Claim:** 3.7 assumes `|S| = s ≥ 1` (`lasso_support_recovery` takes `S.Nonempty`), while the hypotheses of `neighbourhood_selection` (`1 ≤ m`, `|N(j)| ≤ m`) allow `N(j) = ∅`.

**Witness:** `Σ = I_p`, `p ≥ 2`: every `N(j)` is empty, all hypotheses hold (`0 ≤ 1 − α`, `0 ≤ b`), and "no false edge" asks that every node lasso vanish, which 3.7 does not give.

**Repair:** Add to the route: "For `N(j) = ∅` the regression has `β = 0`; on `λ ≥ maxₖ |⟪X_k, y⟫|/n` the zero vector is a solution (3.1), and every solution has `ℓ¹` norm `0` by `IsLassoSolution.fit_eq`, so it is the only one." Add 3.1 to the `*Needs:*` line. For `Σ = I_p` this gives all node lassos equal to `0`.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `measure_max_abs_gt_le` | `N` variables, proxy `c > 0`; `c = 0` | union: `N · 2exp(−(log N + t)) = 2e^{−t}`; `c = 0`: strict event empty | holds | none |
| 1.1 `integral_max_le` | `N = 1`; `N(0,1)` | `E Z₁ = 0 ≤ 0`; `E|Z₁| = 0.798 ≤ √(2 log 2) = 1.177` | holds; first half owned elsewhere | R02 |
| 1.2 `chiSquared_tail_upper/lower` | `k = 1, t = 1`; `k = 0`; `k = 4, t = 1` | `P(χ²₁ ≥ 5) = 0.0253 ≤ 0.368`; pin: `chiSquaredMeasure 0 = dirac 0`, upper `1 ≤ e⁰`; lower `P(Z < 0) = 0` | holds | none |
| 1.3 entrywise covariance | `u = c₀√(log p/n) + δ`, cases `u ≤ 1`, `u > 1`; `p = 0, 1` | `u ≤ 1`: `p²e^{−cnu²} ≤ p^{2−cc₀²}e^{−cnδ²}`; `u > 1`: `cc₀√(n log p) ≥ 2 log p` from `n > log p` | holds | none |
| 1.4 trace duality, additivity, decomposition | `A = B = diag(1,0)`; `B = −A`; `Δ'' = P_{U⊥}ΔP_{V⊥}` | `1 = 1·1`; `0 ≠ 2` (hypothesis fails); `rank Δ' ≤ r + r`, `Θ*ᵀΔ'' = 0` | holds | none |
| 1.5 `exists_sparse_packing` | all `6 ≤ p < 400`, `5D < p`, greedy count `C(p,D)/∑_{j≤D/2}C(D,j)C(p−D,j)` | `log⌈count⌉ − (D/2)log(p/(5D)) ≥ 0.918` on the grid | holds | none |
| 1.5 `exists_net_lowRank` | `r > min(d₁,d₂)`; `r = 0`; `ε ≤ 1` | `1 + 6/ε ≤ 9/ε` iff `ε ≤ 3`; `r = 0`: set empty, `0 ≤ 1`; CandesPlan2011 line 627–644 | holds | R06 |
| 2.1 `hasRestrictedNullspace_iff_basisPursuit` | `X = [[1,1]]`, `[[2,1]]`, `S = {0}`; `S = ∅` | `(1,0)`, `(0,1)` both solve, RN fails; unique `(1/2, 0)`, RN holds; converse via `β = δ_S`, `b = −δ_{Sᶜ}` | both directions hold | none |
| 2.2 `hasRestrictedNullspace_of_rip` | `n = 0`; `s = 0`; `δ < 0` | `n = 0`, `s, p ≥ 1`: `(1 − δ) ≤ 0` false, vacuous; `s = 0`: `S = ∅`, RN trivially true | holds | none |
| 2.3 `stable_recovery` | constants from the `ℓ^q`-robust bound with `‖z‖₁ ≤ ‖x‖₁`, `‖A(z − x)‖ ≤ 2η`; `ρ = 0`, identity | `p = 1`: `2(1+ρ)²/(1−ρ)`, `2(3+ρ)τ√s/(1−ρ)`; identity: `C = 2`, `D = 6` | holds | none |
| 2.4 `rip_of_subgaussian` | `|σ/√n − 1| ≤ δ/3`; union over `C(p,s) ≤ (ep/s)^s` | `(1 + δ/3)² ≤ 1 + δ` for `δ ≤ 3`; `K = 0` contradicts variance `1` (vacuous) | holds | none |
| 3.2 slow rate, cone, compatibility, RE | `n = p = 1`, `β = 1`, `ε = −1/4`, `λ = 1/2` and `1/4` | `λ = 1/2`: `‖XΔ‖² = 9/16 = 9λ²/4`, `|Δ| = 3/4 ≤ 2λ`; `λ = 1/4`: `1/4 > 9/64`, slow rate `1/4 ≤ 5/16` | holds; attained | none |
| 3.3 `measure_lassoNoiseEvent_ge` | proxy of `⟪X_j, ε⟫/n`; `b = 0`; `σ = 0` | proxy `≤ bσ²/n`; `(λ/2)²n/(2bσ²) = log p + t`; per column `2e^{−t}/p` | holds | none |
| 3.4 `hasRestrictedEigenvalue_of_rip` | block size `36s`, `T₀ = S ∪ T₁` | tail `≤ ‖δ_S‖/2`; `κ₀ = ((2/3)(0.70711 − 0.61237))² = 0.0039887` | holds | none |
| 3.7 `lasso_support_recovery(_prob)` | `X = [[2,1]]`, `S = {0}`; dual bound; two union bounds | `α = 1/2`, `B = |ε|/2 + λ/4`; `|ẑⱼ| ≤ α + (1−α)/2 < 1`; `(√(2 log N) + √n δ)²/2 ≥ log N + nδ²/2`, total `4e^{−nδ²/2}` | holds; `B` differs from README | R04 |
| 3.8 `debiased_decomposition`, coverage | `n = p = 1`, `X = 2`, `Θ̂ = 1/4`; `n = 0` | `β̃ = y/2`, `vⱼ = 1/4`; `n = 0`: both sides `0`; `2Φ(z) − 1 = 1 − α` | holds | none |
| 4.1 `penalized_model_selection` | Giraud's penalty against `κ(d + L)`; `M` empty | `(√d + √(2L))² ≤ 4(d + L)`, so `κ₀ = 4K`, `K > 1`; `M` empty: no selector, vacuous | holds | none |
| 4.2 `aic_overfit`, `bic_consistent` | `d = 1, 2`; `n = 100` | `P(χ²₁ > 2) = 0.1573`, `P(χ²₂ > 4) = e^{−2}`; `P(χ²₁ > log 100) = 0.0319` | holds | none |
| 5.1 soft-threshold risks | `λ = 1, μ = 0`; `λ = 2, μ = 5`; `p = 100, s = 5` | `0.15068 ≤ 0.6065`; `4.99598 ≤ 5`; threshold `2.4477σ`, bounds `39.957σ²`, `52.052σ²` | holds | none |
| 5.2 `sparse_regression_lower` | Fano regime `|C| ≥ 16`; Le Cam regime; `p = 5D` | `1 − 1/4 − log 2/log 16 = 1/2`, risk `c̲²σ²D log(p/(5D))/(32c̄²)`; KL `≤ 1/2`, `tvDist ≤ 1` (pin: range `[0, 2]`), `s²/4`; `c = 0.011271` | holds | none |
| 5.3 `sparse_minimax_rate` | `25s ≤ p`; `25s > p`; source form | `log(p/(5s)) ≥ log(p/s)/2` iff `p/s ≥ 25`; Assouad `σ²s/16`; Johnstone2017 line 13122: `k ≥ 1`, `n ≥ 2`, `1 + log[n/k]` | holds; locator confirmed (printed p. 243) | none |
| 6.2 `bh_fdr_le`, `bh_fdr_eq` | `m = m₀ = 2` uniforms; `m = 2`, `p₁ = 0`; invalid `p₀ = 0` | `(α − α²/4) + α²/4 = α`; `α/2 = αm₀/m`; rate `1 > α` | holds | none |
| 6.3 `stepUp_fdr_le`, `by_fdr_le` | `β(k) = k/H_m`, `m = 3`; `β(k) = k` | `(1/2 + 1/3 + 1)(6/11) = 1`; `∑_{j<m} 1/(j+1) + 1 = H_m` | holds | none |
| 7.1 `nuclear_trace_regression_det`, `rsc_of_rankRIP` | `r = 0`; blocks of rank `72r`; `Θ* = diag(1,0)`, `Δ = diag(1,3)`, `diag(1,4)` | cone `{0}`; `3√(2r)/√(72r) = 1/2`, `T₀` of rank `≤ 74r`; `3 ≤ 3` in, `4 > 3` out | holds | R06 |
| 7.2 `norm_hardThreshold_sub_le`, `_prob` | entry cases; `p = 1`; `p = 0`; `δ = √(log p/n)` | kept: error `≤ λ`; removed: `≤ 2λ`; `p = 1`: `1 − c₁ ≤ 0`; `n min(δ, δ²) = log p` | holds | R06 |
| 7.4 `graphicalLasso_frobenius_det` | `p = 1`; non-PSD `Σ̂ = [[1,2],[2,1]]`; curvature | `F` minimized at `1/Σ̂`; `F(Θₐ) = 3/2 − a − log(a − 1/4) → −∞`; `(κ/2)‖D‖_F² − (3λ/2)√(mp)‖D‖_F ≤ 0` | holds | none |
| 8.1 `leading_eigenvector_perturbation` | `Σ = diag(2,1)`, `P = [[0,1/4],[1/4,0]]`; `P = diag(−1/2, 1/2)` | eigenvector `(0.9732, 0.2298)`, distance `0.2313`; README bound `1`, residual `sin Θ` bound `0.7071`; `‖P‖ = ν/2`: no unique vector | holds; constant not the library's | R01 |
| 8.2 `spiked_leading_eigenvector` | regime where 8.1 does not apply | `‖θ̂ − θ*‖ ≤ √2` always, absorbed by `c₀`; split of `Σ̂ − Σ` recomputed | holds | R07 |
| 8.3 spiked limits, `spikeOverlap`, centring | `y = 1/4`, `ℓ = 2, 3, 6/5, 3/2`; `y = 1` | overlaps `3/5`, `5/6`, `−7/3`, `0`; outliers `5/2`, `27/8`; `n^{2/3}σ_{n,n} → 2.520`; exponent `2/3 + 1/2 − 1/6 − 1 = 0` | holds | R05 |

- Source locators checked against the text: 6 (Johnstone2017 lines 11753, 11760, 11812, 12372, 13122, 13130: (8.7), Lemma 8.3, (8.12), (8.44), Prop 8.20, Thm 8.21, printed pages 220, 221, 231, 243 confirmed) and 3 supplied (CandesPlan2011 lines 295, 627; BickelLevina2008 line 236).
- Library declarations opened at the pin: `chiSquaredMeasure` (`TauCeti/Probability/Distributions/ChiSquared/Basic.lean:209`), `tvDist`/`etvDist` (`Mathlib/MeasureTheory/Measure/TotalVariation/Defs.lean:53,62`), `multivariateGaussian` (`Mathlib/Probability/Distributions/Gaussian/Multivariate.lean:166`), `sampleSecondMoment` (`TauCeti/Analysis/Matrix/SampleSecondMoment.lean:50`), `marchenkoPastur` (`TauCeti/Probability/Distributions/MarchenkoPastur/Basic.lean:62`), `sqrt_log_card_div_le_integral_sup'_abs` (`.../Gaussian/Maximum.lean:83`), `exists_finset_isCover_sphere` (`.../CoveringNumber.lean:168`), the residual `sin Θ` theorem (R01). No pinned lemma gives `HasSubgaussianMGF` for `gaussianReal`, a Schur test, trace duality for `nuclear`, or `(ep/k)^k`.
- Cross-roadmap citations resolved: 13 (Foundations 8.3, 8.4, 9.3 at its open head; Nonparametric 1.3, 2.2, 2.4, 2.5, 2.6, 6.4 at its open head; RandomMatrices §§2.1, 2.4, 4.1, 4.4, 4.5, 7.3 on main); all state what is cited. Local copies agree with the owners (`softThreshold`, `softThresholdRisk` identical to Nonparametric's `Suggested.lean` lines 2323–2327).
- Dependency check: `depcheck: 246 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Gate: FAIL, `empty-sections=1` (R03); every other check `0`.
- Elaboration of `Suggested.lean` at the pins: exit 0, 82 `declaration uses sorry` warnings and no other. `#check @name` for all 130 declarations on a scratch copy: every elaborated type keeps its binders; nothing changed. One-tactic probes: 7 run, 1 closed (R05).
- Overlap check: read MathematicalStatisticsNonparametric, MathematicalStatisticsFoundations, MathematicalStatisticsAsymptotic, MathematicalStatisticsSemiparametric, ExactPenalties, RandomMatrices, OperatorTheory/MatrixSpectralStatistics, OptimalTransport; shared: finite sub-Gaussian expected maximum (owner MathematicalStatisticsAsymptotic 3.3, R02), residual `sin Θ` (owner OperatorTheory/SpectralSubspacePerturbation, R01), soft-threshold map and risk (Nonparametric 6.4, cited), sparsity vocabulary and Benjamini–Hochberg count (Foundations 9.3, cited), sub-exponential variables (RandomMatrices §2.1, cited), sparse Varshamov–Gilbert packing (this roadmap; Nonparametric hands it over).
- Source independence: 6 passages compared with 2 sources (Johnstone2017, CandesPlan2011), none shared; largest share Wainwright2019, 20 of 71 locators, text not readable; contents compared with Wainwright2019 by the chapter numbers of the locators only (Layers 2 and 3 ↔ Ch. 7; Layer 7 ↔ Ch. 10, 6, 11; Layer 8 ↔ Ch. 8): not one to one, independent.

## Not verifiable

- Wainwright2019 (paywalled; publisher page only): every locator into it, including Prop 7.11, Thm 7.13, Example 7.14, Thm 7.20, Thm 7.21, Cor 7.22, Thm 6.23, Cor 6.24, Thm 8.5, Cor 8.7, §10.2.1, Prop 10.6, (10.19), Cor 10.10, Prop 11.9, Thm 11.12.
- Wainwright2019, Cor 8.7 (README line 1717): whether the printed condition is `((ν + 1)/ν²)(p/n) ≤ 1/128` or its square root; the statement is true in either form, since `c₀` absorbs the difference.
- Giraud2022 (paywalled): Thm 2.2, Lemma 3.7, Thm 3.5, (3.10), (3.16), §5.2.2, (10.9), (10.14), Thm 10.2, Cor 10.3, Lemma 10.4, Thm 10.5.
- FoucartRauhut2013 (paywalled): Def 4.21, Thm 4.22, Thm 4.25, Thm 4.4, Thm 4.5, Lemma 6.10, Thm 6.9, Thm 6.12, Thm 6.13, Lemma 6.14, Thm 9.2.
- vandeGeer2016 (paywalled): (2.3), (2.4), Def 2.1, Thm 2.1, Thm 2.2, Def 5.1, Thm 5.1, Thm 5.2.
- Dickhaus2014 (paywalled): Def 5.1, Def 5.6, Thm 5.3, Thm 5.5. BLM2013 (publisher page refused): Thm 2.5, §2.4, Example 2.7. Massart2007 (paywalled; author-page copy not found): Thm 4.2.
- YaoZhengBai2015 (paywalled): Thm 2.9, Thm 11.1, (11.3), Thm 11.3, Thm 11.5, Cor 11.6; the README's statement that (11.3) omits a factor `1/n` was not checked.
- Vershynin2018 (author-page fetch did not complete): Lemma 2.7.7, Prop 2.7.1, Exercise 2.7.10 and the V locators of the RandomMatrices contract.
- Akaike 1973: no legal copy found.

## Source issues

- none

## For the human reviewers

- **Not tested.** Wainwright2019 has the largest share of the locators (20 of 71) and could not be read: the wording was not compared with it, and its table of contents was compared only through the chapter numbers of the locators.
- **Licence.** Johnstone2017 is an unpublished book manuscript (draft of August 9, 2017), read from the author's page; `README.md` lines 1128, 1138, 1223 and 1838 cite it by equation and page.
- **Licence.** `README.md` lines 1845–1869 say the layers are formalized in the author's lean-CKSD repository (Apache 2.0) and map layers to its files; `Suggested.lean` was not compared with that repository.
