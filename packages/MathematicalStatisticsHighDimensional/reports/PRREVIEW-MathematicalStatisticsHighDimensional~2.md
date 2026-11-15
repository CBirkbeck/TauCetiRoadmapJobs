# Review of MathematicalStatisticsHighDimensional (pull request #2396 at 3d248d3)

**Verdict:** needs changes

## R01 (P1) — 8.2: the probability bound of the spiked ensemble is false for large and for small `ν`

**Location:** `TauCetiRoadmap/MathematicalStatisticsHighDimensional/README.md` lines 1714–1717: "with probability at least `1 - c₁ exp(-c₂n min(√ν δ, νδ²))`, every leading unit eigenvector `θ̂` … satisfies `‖θ̂ - θ*‖ ≤ c₀√(((ν + 1)/ν²)(p/n)) + δ`"; `Suggested.lean` lines 1156–1170 (`spiked_leading_eigenvector`).

**Claim:** No universal `c₀, c₁, c₂` exist. The exponent `n min(√ν δ, νδ²)` is unbounded in `ν` at fixed `n` and `δ`, while the failure probability decays only polynomially in `ν`.

**Witness:** `p = 2`, `n = 3`, `δ = 1`, Gaussian `ξᵢ`, `wᵢ`, `ν → ∞`. On `{|ξᵢ| ≤ 1/ν, i < 3}` (probability `≥ 0.1ν⁻³`) `xᵢ = wᵢ + O(ν^{-1/2})`, so `∠(θ̂, θ*) > 70°` with probability bounded below: failure `≳ ν⁻³ ≫ c₁e^{-3c₂√ν}`.

**Repair:** Replace the exponent by `min(1, νδ², ν²δ²)`, in the README and in the Lean (`min 1 (min (ν * δ ^ 2) (ν ^ 2 * δ ^ 2))`): "with probability at least `1 - c₁ exp(-c₂ n min(1, νδ², ν²δ²))`". It equals Wainwright's exponent when `ν ≥ 1` and `√ν δ ≤ 1`. Route, for `δ ≤ √2` and `c₀√(…) < √2` (otherwise the bound is trivial): `|n⁻¹∑ξᵢ² - 1| ≤ 1/32` fails with probability `2e^{-cn}`; `‖v‖ ≤ C√(p/n) + √ν δ/64` with `2exp(-cn min(√ν δ, νδ²))`; `‖n⁻¹∑wᵢwᵢᵀ - I‖ ≤ C√(p/n) + νδ/128` with `2exp(-cn min(1, ν²δ²))` (1.3 at `ε ≤ 1`); then `‖P‖ ≤ ν/4` and 8.1 gives `(2√2/ν)(√ν‖v‖ + ‖W‖) ≤ c₀√(…) + δ`. Each exponent dominates `min(1, νδ², ν²δ²)`. On the witness the bound is the constant `c₁e^{-3c₂}`. Add the witness as a negative-control Check of 8.2, and the small-`ν` control: `p = 2`, `δ = 1`, `ν → 0`, `n → ∞` with `nν² → ∞` has failure `≍ exp(-cnν²) ≫ exp(-c₂nν)`.

## R02 (P3) — five definitions have fewer than three Checks

**Location:** `README.md`: `designCol` (line 121, no Check); Akaike and Schwarz selectors (lines 1055–1063, two each); `supportPattern` (lines 1535–1537, two); `glassoObjective` (lines 1637–1640, two).

**Claim:** Every definition carries at least three discriminating Checks; these carry none or two.

**Witness:** Lines 1055–1058 are the only bullets on `aicSelector`, 1059–1063 on `bicSelector`, 1535–1537 on `supportPattern`, 1637–1640 on `glassoObjective`; no bullet computes a column `X_j`.

**Repair:** Add:
- `designCol`: for `X = [[1, 2], [3, 4]]`, `X_1 = (2, 4)`, not the row `(3, 4)`; `‖X_0‖²/n = 10/2 = 5`; for `X = [[2, 1]]`, `⟪X_0, y⟫/n = 2y`.
- Akaike selector, the factor `1/σ²`: `J = 2`, `n = 1`, `σ = 2`, `S₁ = ⊥`, `S₂ = ℝ`: `AIC₁ = Y²/4`, `AIC₂ = 2`, so the larger model is selected exactly when `Y² > 8`, not `Y² > 2`.
- Schwarz selector, ties: `n = 100`, `σ = 1`, `‖P_{S₂}Y‖² = log 100`: the two criteria agree and the smaller index is returned.
- `supportPattern`: `[[2, -3], [0, 5]]` has pattern `[[1, 1], [0, 1]]`; a sign pattern would have `-1`, and the pattern is not symmetric for a non-symmetric matrix.
- `glassoObjective`: for `Σ̂ = I₂`, `λ = 1`, `F(2I₂) = 4 - log 4 ≈ 2.614 > F(I₂) = 2`.

## R03 (P3) — a reference that the text does not cite

**Location:** `README.md` lines 1905–1908: "Also cited: H. Akaike, Information theory and an extension of the maximum likelihood principle, … 1973, 267–281."

**Claim:** No section cites Akaike's paper; 4.2 proves the optimism identity without a locator into it.

**Witness:** The only occurrences of "Akaike" outside the References are the names "Akaike's criterion" and "Akaike selector" (lines 10, 61–62, 1009–1063); none is a citation.

**Repair:** Delete the entry from the References (lines 1907–1908).

## R04 (P3) — "The layers are formalized" overstates the prior formalization

**Location:** `README.md` line 1846: "The layers are formalized in `CKSD/Nonparametric/` of lean-CKSD".

**Claim:** The same section says that most of Layers 3, 6, 7 and 8 are absent there or admitted.

**Witness:** Lines 1853–1857: "the graphical-model and Tracy–Widom statements are stated with admitted proofs … The completions this roadmap adds are not there: the slow rate …, support recovery, debiasing, the PRDS theory …, trace regression, the Davis–Kahan residual bound and the spiked ensemble."

**Repair:** Line 1846: "Parts of Layers 1–8 are formalized in `CKSD/Nonparametric/` of".

## R05 (P3) — 5.3's `*Needs:*` omits Pinsker's inequality

**Location:** `README.md` lines 1237–1238: "*Needs:* 5.1, 5.2; MathematicalStatisticsNonparametric 1.3, 2.5 and 2.6 …; Mathlib `minimaxRisk`, `Kernel.deterministic`."

**Claim:** The Assouad step of 5.3 uses Pinsker's inequality, which the line does not list.

**Witness:** Line 1228: "neighbours have divergence `1/2`, hence `tvDist ≤ 1` by Pinsker's inequality"; 5.2's line (1199–1200) lists Tau Ceti `etvDist_sq_le_two_mul_klDiv`.

**Repair:** Line 1237–1238: "*Needs:* 5.1, 5.2; MathematicalStatisticsNonparametric 1.3, 2.5 and 2.6 (the Gaussian divergence, Assouad's lemma); Tau Ceti `etvDist_sq_le_two_mul_klDiv`; Mathlib `minimaxRisk`, `Kernel.deterministic`."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `measure_max_abs_gt_le` | union bound; `c = 0`; `N = 2, c = t = 1` | `N · 2exp(-(log N + t)) = 2e^{-t}`; strict event empty at `c = 0`; threshold `1.840` | holds | none |
| 1.2 `chiSquared_tail_upper/lower` | `k = 1, t = 1`; `k = 4, t = 1`; `k = 0` | `P(χ²₁ ≥ 5) = 0.0253 ≤ 0.368`; `4 - 2√4 = 0`, `P(Z < 0) = 0`; `{Z ≥ 2t}` has mass `1 = e⁰` at `t = 0` | holds | none |
| 1.3 products, entrywise, operator norm | `W = 0, s = -1`; cases `u ≤ 1`, `u > 1`; `\|s² - 1\|` | `1 ≤ 1/√3` false, range `s ≥ 0` needed; `cc₀√(n log p) ≥ 2 log p` from `n > log p`; `\|s-1\|(\|s-1\| + 2) ≤ 3 max` | holds | none |
| 1.4 norms and low-rank decomposition (sample) | `Δ'' = P_{U⊥}ΔP_{V⊥}`; `A = diag(1,0), B = -A`; `M = diag(1, 1/4), c = 1` | `⟪Δ', Δ''⟫_F = ‖Δ''‖² - ‖Δ''‖² = 0`, `Θ*ᵀΔ'' = 0`; `0 ≠ 2`; row sum `4 > √2` | holds; Wainwright §10.2.1 not readable | none |
| 1.5 packing, net | `D = 1, p = 6`; ball count; `ε ≤ 1`; `r = 0` | `log 6 ≥ 0.091`; distance `2j ≤ D`; `1 + 6/ε ≤ 9/ε`; empty set, `0 ≤ 1`; CandesPlan2011 line 627–630; pinned net is internal | holds | none |
| 2.1 `hasRestrictedNullspace_iff_basisPursuit` | `[[1,1]]`, `[[2,1]]`, `S = {0}`; converse with `β = δ_S`, `b = -δ_{Sᶜ}` | two solutions `(1,0)`, `(0,1)`; unique `(1/2, 0)`; `‖b‖₁ ≤ ‖β‖₁` forces `δ = 0` | both directions hold | none |
| 2.2 `hasRestrictedNullspace_of_rip` | `n = 0`; `s = 0` | zero matrix: `(1 - δ)‖x‖² ≤ 0` fails for `p, s ≥ 1` (vacuous); `S = ∅` trivial | holds | none |
| 2.3 robust nullspace, `stable_recovery` (sample) | Thm 4.25 form with `‖z‖₁ ≤ ‖x‖₁`, `‖A(z - x)‖ ≤ 2η`; identity; `w = (1,1,1,1)`, `s = 2`; `p ≥ 1` | `C = 2(1+ρ)²/(1-ρ)`, `D = 2(3+ρ)τ/(1-ρ)`; `C = 2`, `D = 6`; `√2 ≤ ρ√2` fails; `v = e₀` gives `1 ≤ τ‖Ae₀‖` | holds; Foucart–Rauhut not readable | none |
| 2.4 `rip_of_subgaussian`, exact recovery | `t = δ√n/(6CK²)`; union over `(ep/s)^s`; order `2s`, `δ = 1/4` | `(1 + δ/3)² ≤ 1 + δ`; `s log(ep/s) ≤ ct²/2`; `2s log(ep/(2s)) ≤ 2s log(ep/s)`, `1/4 < 1/3` | holds | none |
| 3.1 objective, optimality, variational inequality (sample) | `n = p = 1`, `X = 1`, `y = 3/4`, `λ = 1/2`, `b = 0` | values `9/32`, `1/4`, `3/8`; `β̂ = 1/4`; variational: `1/16 = 3/16 - 1/8` | holds, with equality; van de Geer (2.3), (2.4) not readable | none |
| 3.2 slow rate, cone, compatibility, RE | `n = p = 1`, `β = 1`, `ε = -1/4`, `λ = 1/2`, `1/4`; `X = √2I₂` | `9/16 = 9λ²/4`, `\|Δ\| = 3/4 = 3λ/2 ≤ 2λ`; `1/4 > 9/64`, slow `1/4 ≤ 5/16`; ratio `2‖δ‖²/‖δ‖₁² ≥ 1` | holds; attained | none |
| 3.3 `measure_lassoNoiseEvent_ge` (sample) | proxy of `⟪X_j, ε⟫/n`; Wainwright's `λ` | `≤ bσ²/n`; `(λ/2)²n/(2bσ²) = log p + t`; `t = nδ²/2 + √(2n log p)δ` reproduces `2Cσ(√(2 log p/n) + δ)` | holds; Example 7.14 not readable | none |
| 3.4 `hasRestrictedEigenvalue_of_rip` (sample) | blocks of `36\|S\|`, `T₀ = S ∪ T₁` | tail `≤ 3√s‖δ_S‖/(6√s) = ‖δ_S‖/2`; `(2/3)(0.70711 - 0.61237) = 0.06316`, square `0.003989` | holds; Foucart–Rauhut not readable | none |
| 3.5 random designs | `s' = min(37s, p)` | `2.4` needs `1 ≤ s' ≤ p`, `δ = 1/2`; order `p` covers all vectors | holds | none |
| 3.6 orthogonal design, ridge (sample) | `n = p = 1`, `y = 3/4`, `λ = 1/2`; `y = 3`, `λ = 2` | minimizer `η_{1/2}(3/4) = 1/4`; ridge `3/(1 + 2) = 1` | holds; Giraud §5.2.2 not readable | none |
| 3.7 `lasso_support_recovery(_prob)` | `X = [[2,1]]`, `S = {0}`; two union bounds | `α = 1/2`, `B = \|ε\|/2 + λ/4`; `\|ẑⱼ\| ≤ α + (1-α)/2 < 1`; `2N exp(-(√(2 log N) + √nδ)²/2) ≤ 2e^{-nδ²/2}`, total `4e^{-nδ²/2}` | holds | none |
| 3.8 debiasing | `n = p = 1`, `X = 2`, `Θ̂ = 1/4`; `z` | `β̃ = y/2`, `vⱼ = 1/4`; `1 - α/2 > 1/2` gives `z > 0`; `2Φ(z) - 1 = 1 - α` | holds | none |
| 4.1 `penalized_model_selection` | Giraud's penalty; exponential moment | `(√d + √(2L))² ≤ 4(d + L)`; `E exp(χ²_k/4) = 2^{k/2}`; `π_m ≤ 1` so `pen ≥ 0` | holds | none |
| 4.2 `aic_optimism`, `aic_overfit`, `bic_consistent` | `n = k = 1`; `d = 1, 2`; `n = 100` | `(n+k)σ² - (n-k)σ² = 2kσ²`, optimism `k`; `0.1573`, `e^{-2}`; `P(χ²₁ > log 100) = 0.0319` | holds | none |
| 4.3 `sparse_regression_upper` (sample) | `p = 4` weights; oracle term at `m = supp β` | `∑ = 31/32`; `log 16 = 2.773 ≤ 3.773`; `pen·n ≤ κσ²(D + (D+1)log 2 + D log(ep/D))` | holds; Giraud (3.16) not readable | none |
| 5.1 soft-threshold risks | `λ = √(2 log(p/s))`; `p = 100, s = 5` | `p e^{-λ²/2} = s`, total `2σ²s(1 + log(p/s))`; `39.96σ²`, `52.05σ²`; Johnstone2017 lines 11753, 11760, 12372 | holds | none |
| 5.2 `sparse_regression_lower`, matching rate (sample) | Fano regime; Le Cam regime; `p = 25D` | KL `≤ (1/4) log\|C\|`, `1 - 1/4 - 1/4 = 1/2`, risk `c̲²σ²D log(p/(5D))/(32c̄²)`; KL `≤ 1/2`, `s²/4`; `c = 0.01127`; `1 + 2 log 5` both sides | holds; Giraud Thm 3.5 not readable | none |
| 5.3 `sparse_minimax_rate`, universal threshold | `25s ≤ p`; `25s > p`; `2s > p` | `log(p/(5s)) ≥ log(p/s)/2`; Assouad `(σ²/8)s(1/2) = σ²s/16`; `p^{1-a} < 2`; Johnstone2017 line 13122 (`k ≥ 1`, `n ≥ 2`) | holds | R05 |
| 6.1 step-up, WPRD, PRDS (sample) | `p = (0.01, 0.04, 0.5)`, `α = 0.1`; `(-1,-1)`, `α = -3`; `p₁ = 1 - p₀` | counts `2` (BH), `1` (BY, `H₃ = 11/6`); count `0`, set `∅`; ratio `min(u, 1/2)/u` decreasing | holds; agrees with Foundations 9.3; Giraud, Dickhaus not readable | none |
| 6.2 `bh_fdr_le`, `bh_fdr_eq` | `m = m₀ = 2`; `m = 2`, `p₁ = 0`; `p₀ = 0` | `(α - α²/4) + α²/4 = α`; `α/2`; rate `1 > α` | holds | none |
| 6.3 `stepUp_fdr_le`, `by_fdr_le` | `β(k) = k/H_m`, `m = 3`; `β(k) = k` | `(5/6 + 1)(6/11) = 1`; `∑_{j<m} 1/(j+1) + 1 = H_m` | holds | none |
| 7.1 trace regression (sample) | variational inequality; blocks of rank `72r`; `r = 0`; noise event | `(3λ/2)nuc(Δ') - (λ/2)nuc(Δ'')`; `3√(2r)/√(72r) = 1/2`; `Δ' = 0` forces `Δ = 0`; `χ²ₙ ≤ 5n` w.p. `1 - e^{-n}`; CandesPlan2011 line 295 | holds; Wainwright (10.19), Cor 10.10 not readable | none |
| 7.2 thresholding | entry cases; star pattern; `p = 0, 1` | error `≤ λ` kept, `≤ 2λ` removed; `‖A‖ = 1 + √2 ≤ 3`; `0^{-c₂} = 0`, event is everything; `1 - c₁ ≤ 0` | holds | none |
| 7.3 `gaussian_regression_coeff`, `neighbourhood_selection` (sample) | chain `ρ = 1/2`; `Σ = I`; union over nodes | `Θ = (4/3)[[1,-1/2,0],…]`, coefficient `2/5`, residual `3/5`; zero solution route; `p · exp(-cn/m) ≤ exp(-cn/(2m))` from `n ≥ c₁m log p` | holds; Thm 11.12 not readable | none |
| 7.4 graphical lasso (sample) | `p = 1`; `Σ̂ = [[1,2],[2,1]]`; curvature; `Σ̂ = I₂` | `F` minimal at `1/Σ̂`; `F(Θₐ) → -∞`; `(κ/2)‖D‖_F² - (3λ/2)√(mp)‖D‖_F ≤ 0`, `κ = (‖Θ*‖+1)⁻²`; `F = 3.288` | holds; Prop 11.9 not readable | none |
| 8.1 `leading_eigenvector_perturbation` (sample) | `Σ = diag(2,1)`, `P = [[0,1/4],[1/4,0]]`; residual | eigenvector `(0.9733, 0.2298)`, distance `0.2313 ≤ 0.7071`; `AX - XM = (I - θ*θ*ᵀ)Pθ*`, gap `ν - 2‖P‖`; pinned theorem at `SinTheta/Basic.lean:89` | holds; Thm 8.5 not readable | none |
| 8.2 `spiked_leading_eigenvector` (sample) | `p = 2, n = 3, δ = 1`, `ν = 10²…10⁸`; `ν → 0` | claimed exponent `3√ν = 30…30000` against `log` failure `≥ -3 log ν - C = -14…-55`; small `ν`: true rate `≍ nν²`, claimed `nν` | **false** | R01 |
| 8.3 limits (sample) | `y = 1/4`, `ℓ = 2, 3, 6/5, 3/2`; `y = 1` | overlaps `3/5`, `5/6`, `-7/3`, `0`; outliers `5/2`, `27/8`; `2 · 2^{1/3} = 2.520`; RandomMatrices §§4.4, 4.5, 7.3 state the cited limits | holds; Yao–Zheng–Bai not readable | none |
| Checks per definition | every definition of `Suggested.lean` | `designCol` 0; `aicSelector`, `bicSelector`, `supportPattern`, `glassoObjective` 2; all others `≥ 3` | short | R02 |

- Previous review: R01 repaired ("`‖θ̂ - θ*‖ ≤ √2 ‖(I - θ*θ*ᵀ)Pθ*‖/(ν - 2‖P‖)`", SSP-C17 and the pinned theorem in the contracts, `*Needs:*` and `#check` block); R02 repaired (the expected-maximum bullet and `integral_max_le` are gone); R03 repaired (line comment, gate passes); R04 repaired ("`B = maxⱼ∈S (\|…\| + λ ∑ₖ∈S \|(Σ̂_SS⁻¹)ⱼₖ\|)`"); R05 repaired (six declarations deleted, names removed from the bullets); R06 repaired for Candès–Plan and Bickel–Levina, the Akaike citation dropped but its reference left (R03 here); R07 and R08 repaired.
- Source locators checked against the text: 7 (CandesPlan2011 lines 295–300, 627–630; Johnstone2017 lines 11753, 11760–11762, 12372, 13122–13123; BickelLevina2008 line 236).
- Library declarations opened at the pin: `mul_map_starProjection_comp_le_map_sylvester_apply` (`TauCeti/Analysis/InnerProductSpace/UnitarilyInvariantSeminorm/SinTheta/Basic.lean:89`), `sampleSecondMoment` (`TauCeti/Analysis/Matrix/SampleSecondMoment.lean:50`), `multivariateGaussian` (`Mathlib/Probability/Distributions/Gaussian/Multivariate.lean:166`), `tvDist` (`Mathlib/MeasureTheory/Measure/TotalVariation/Defs.lean:62`), `exists_finset_isCover_of_subset_closedBall` (net inside the set, `(1 + 2r/ε)^d`); all 58 `#check` lines elaborate. No pinned declaration states a target (searched: Gaussian sub-Gaussianity, chi-squared tails, Schur test, trace duality, sub-exponential variables).
- Cross-roadmap citations resolved: 16 (Foundations 8.3, 8.4, 9.3 and Nonparametric 1.3, 2.2, 2.4, 2.5, 2.6, 6.4 at their open heads; RandomMatrices §§2.1, 2.4, 4.1, 4.4, 4.5, 7.3 and OperatorTheory/SpectralSubspacePerturbation SSP-C17 on main); each states what is cited. `softThreshold` and `softThresholdRisk` agree with the owner's definitions.
- Dependency check: `depcheck: 246 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder. Gate: every check passes.
- Elaboration of `Suggested.lean` at the pins: exit 0, 76 `declaration uses sorry` warnings and no other. `#check @name` on a scratch copy for 121 of the 123 declarations (the other two read in the source): every type keeps its binders; nothing changed. One-tactic probes: 10 run, none closed.
- Overlap check: read MathematicalStatisticsNonparametric, MathematicalStatisticsFoundations, MathematicalStatisticsAsymptotic, MathematicalStatisticsSemiparametric, ExactPenalties, RandomMatrices, OperatorTheory/MatrixSpectralStatistics (OptimalTransport searched for this roadmap's objects only); shared: soft-threshold map and risk (owner Nonparametric 6.4, cited), sparsity vocabulary and Benjamini–Hochberg count (owner Foundations 9.3, cited), sub-exponential variables and Bernstein (owner RandomMatrices §2.1, cited), residual `sin Θ` (owner SpectralSubspacePerturbation, cited), sparse Varshamov–Gilbert packing (this roadmap; Nonparametric hands it over). MatrixSpectralStatistics MSS-C18–C22 are second-moment (Chebyshev) bounds, not the sub-Gaussian ones of 1.3.
- Source independence: 7 passages compared with 3 sources (CandesPlan2011, Johnstone2017, BickelLevina2008), none shared; largest share Wainwright2019, 20 of about 74 locators, text and table of contents not readable; contents compared with Wainwright2019 through the chapter numbers of the locators only (Layers 2 and 3 ↔ Ch. 7, Layer 7 ↔ Ch. 10, 6, 11, Layer 8 ↔ Ch. 8, Layers 1, 4, 5, 6 ↔ none): not one to one, independent.

## Not verifiable

- Wainwright2019 (publisher page only): every locator into it, among the sampled targets §10.2.1, (10.14), (7.18), Example 7.14, Prop 10.6, (10.19), Cor 10.10, Thm 11.12, Prop 11.9, (11.10), Thm 8.5, Cor 8.7, (8.21).
- Wainwright2019, Cor 8.7: whether the printed probability is `1 - c₁exp(-c₂n min(√ν δ, νδ²))` without a restriction on `δ` and `ν` (R01 concerns the README's statement), and whether the printed condition is `((ν + 1)/ν²)(p/n) ≤ 1/128` or its square root.
- Wainwright2019, (10.19) (README line 1445): whether the printed bound is `9λ²r/(2κ²)`; the README's own derivation of that bound was recomputed.
- Giraud2022 (paywalled): Thm 2.2, Lemma 3.7, Thm 3.5, (3.10), (3.16), §5.2.2, (5.7), (10.9), (10.14), Thm 10.2, Cor 10.3, Lemma 10.4, Thm 10.5.
- FoucartRauhut2013 (paywalled): Def 4.21, Thm 4.22, Thm 4.25, Thm 4.4, Thm 4.5, Lemma 6.10, Thm 6.9, Thm 6.12, Thm 6.13, Lemma 6.14, Thm 9.2.
- vandeGeer2016 (paywalled): (2.3), (2.4), §2.4, Def 2.1, Thm 2.1, Thm 2.2, Def 5.1, Thm 5.1, Thm 5.2.
- Dickhaus2014 (paywalled): Def 5.1, Def 5.6, Thm 5.3, Thm 5.5. Massart2007, BLM2013 (no legal copy found): Thm 4.2; §2.4, Example 2.7.
- YaoZhengBai2015 (publisher page only): Thm 2.9, Thm 11.1, (11.3), Thm 11.3, Thm 11.5, Cor 11.6, and the README's statement that (11.3) omits a factor `1/n`.
- Vershynin2018 (author-page fetch timed out twice): Lemma 2.7.7, Prop 2.7.1, Exercise 2.7.10 and their printed pages.

## Source issues

- none

## For the human reviewers

- **Not tested.** Wainwright2019 has the largest share of the locators (20 of about 74) and could not be read: the wording was not compared with it, and its table of contents was compared only through the chapter numbers of the locators.
- **Licence.** Johnstone2017 is an unpublished book manuscript (draft of August 9, 2017), read from the author's page; `README.md` lines 1124, 1134, 1219 and 1839 cite it by equation and page.
- **Licence.** `README.md` lines 1844–1870 map the layers to files of the author's lean-CKSD repository (Apache 2.0); `Suggested.lean` was not compared with that repository.
