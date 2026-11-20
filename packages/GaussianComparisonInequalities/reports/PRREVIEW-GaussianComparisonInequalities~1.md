# Review of GaussianComparisonInequalities (pull request #2695 at e75093f)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement was recomputed in its degenerate cases and along its proof route (directions of all four comparisons, the Gordon coupling of 5.2, the Gamma-function argument of 5.3), and every Vershynin locator was read at its place; nothing false or unsupported was found. There are one small correction and two format notes, none blocking. For the humans: the Davidson–Szarek locators could not be read and are unverified.

## C01 — The scope paragraph describes RandomMatrices §2.4 as a statement about independent entries; its singular-value bound is for independent isotropic rows

A reader comparing 5.3 with RandomMatrices would look for the wrong hypothesis. The sentence in "Left to other roadmaps" (README line 421) reads "RandomMatrices §2.4 bounds the extreme singular values of matrices with independent sub-Gaussian entries up to unspecified constants". On main, RandomMatrices §2.4 (README lines 547–556) has two statements: a tail bound for the norm of a matrix with independent centred sub-Gaussian coordinates, and the two-sided bound `√p − CK²(√n + t) ≤ s_min ≤ s_max ≤ √p + CK²(√n + t)` with probability `1 − 2exp(−ct²)` for independent centred isotropic rows with sub-Gaussian linear forms. Both are tail bounds, neither is a bound on an expectation.

Smallest change: "RandomMatrices §2.4 gives tail bounds, with unspecified constants, for the norm of a matrix with independent sub-Gaussian entries and for the extreme singular values of a matrix with independent isotropic sub-Gaussian rows; 5.1 and 5.3 are the sharp bounds in expectation for standard Gaussian entries."

## N01 — Two routes use a library fact their `*Needs:*` line does not list

In 5.1 (line 314) the step "`aₖ ≤ √k` by Jensen" uses the second chi moment `E‖h‖² = k`, which is Tau Ceti's `TauCeti.Probability.integral_sq_chiMeasure` (`TauCeti/Probability/Distributions/Chi/Moments.lean`, line 105 at the pin). In 4.1 (line 272) the passage from `N(0, (ε²/2) I)` to `(ε/√2)` times a standard Gaussian uses `TauCeti.Probability.map_affine_multivariateGaussian` or `multivariateGaussian_zero_eq_map_stdGaussian_sqrt`. Adding them to the two `*Needs:*` lines and to the supplier contracts would complete the lists.

## N02 — The separated-subset reduction cited in 4.1 is on p. 172

The locator in 4.1 (line 268) gives "Theorem 7.4.1, p. 171, for the `ε`-separated subsets used in its proof". The statement is on p. 171; the reduction to a maximal separated subset is in the proof on p. 172 (Vershynin2018 line 6452–6456). "pp. 171–172" would cover both.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 interpolation formula | `f = xᵢxⱼ`, `i ≠ j`; `n = 0`; `f = exp(x²)`, `S = 1`, `T = 0` | `Φ′ = Sᵢⱼ − Tᵢⱼ`, formula `(1/2)·2(Sᵢⱼ − Tᵢⱼ)`; `n = 0`: `0 = 0`; `Φ(s) = (1 − 2s)^(−1/2)` blows up at `1/2` | holds; growth hypothesis needed | none |
| 1.1 route (integration by parts) | field with one component `∂ᵢf(√s S^(1/2)g + c)` | `E⟨∇f(Z), X⟩ = √s ∑ᵢⱼ Sᵢⱼ E∂ᵢ∂ⱼf`; field is `C¹`, in `L²`, bounded derivative: supplier §4.4 applies | supplied | none |
| 1.2 comparison principle | `n = 1`, `f = x²`, `S = 1`, `T = 0`; `f = −x²`; `s = 0, 1` endpoints | sum `2 ≥ 0`, `0 ≤ 1`; sum `−2`, `0 ≤ −1` false; `0•S + 1•T = T` | holds; direction pinned | none |
| 2.1 Slepian | `n = 1`, `S = 1`, `T = 4`, `τ = −1`; ones matrix vs `I₂`, `τ = 0`; `n = 0`; `S` not PSD | `0.8413 > 0.6915` (control fails as claimed); `1/2 ≤ 3/4`; `0 ≤ 0`; Dirac at `0` gives `1 ≤ 3/4` false at `τ = 0` | holds; equal variances and PSD both needed | none |
| 2.2 Sudakov–Fernique | `n = 2` closed form; `n = 1`; identity with `∑p = 1`; reversed hypothesis | `E max = √(inc/(2π))`: `0 ≤ 0.564`; `0 = 0`; `∑σᵢᵢpᵢ − ∑σᵢⱼpᵢpⱼ = (1/2)∑(σᵢᵢ+σⱼⱼ−2σᵢⱼ)pᵢpⱼ`; `0.564 > 0` | holds | none |
| 3.1 Gordon, tails | `m = 1`; `n = 1` by reflection; `n = 0`, `m ≥ 1`; `m = 0`; signs of `∂∂f` | reduces to 2.1; `P(min X ≥ τ) = 1 − P(max(−X) > −τ)`; `∅` vs `∅`; everything; within row `≤ 0`, across rows `≥ 0`, sum `≤ 0` | holds for every real `τ` | none |
| 3.2 Gordon, expectations | `n = 1`, `m = 2`: `(g₁, g₂)` vs `(g, g)`; layer cake both signs | `−1/√π ≤ 0`; `P_S(Z ≥ τ) ≤ P_T(Z ≥ τ)` and `P_S(Z < τ) ≥ P_T(Z < τ)` | holds | none |
| 4.1 Sudakov minoration | `n = 1`; `ε < 0`; `n = 2` exact; iid `n = 2, 3, 10, 100, 1000` | `0 ≤ 0`; left `≤ 0 ≤` right; `c ≤ 0.4792`; `0.564, 0.846, 1.539, 2.508, 3.241`, ratios `0.678 … 1.233` | holds; `E max|g| ≤ 2E max g + 2/√(2π)` rechecked | none |
| 5.1 operator norm | `m = 0` or `n = 0`; `m = n = 1`; `(3, 2)` sampled; norm instance | `0 ≤ √m + √n`; `0.798 ≤ 2`; `2.139 ≤ 2.849 ≤ 3.146`; `‖toMatrix x‖` equals operator norm of `toEuclideanLin` by `Matrix.l2_opNorm_def` | holds | none |
| 5.2 Gordon on a subset | variances; increments; `K = {u}`; `K = {0}`; `m = 0` | both `2`; `inc Y − inc X = 2(1 − ⟨u,u′⟩)(1 − ⟨v,v′⟩) ≥ 0`, `0` in a row; `aₘ = aₘ`; `aₘ > 0` fails; `−w(K) ≤ 0` | holds; `Y` is the first family | none |
| 5.3 smallest singular value | `n = 0` excluded; `m < n`; `(3, 2)` sampled; `aₖ − √k`, `k ≤ 2000`; `θ − L` on `[0, 200]` | `√m > 0 =` junk infimum; left `< 0 ≤` right; `0.888 ≥ 0.342 ≥ 0.318`; `−0.202, −0.161, −0.136`, increasing throughout; minimum `7.8·10⁻⁵ > 0` | holds | none |
| 5.3 route (Gamma recursion) | `aₖaₖ₊₁`; recursion for `θ`; `L` inequality; product bound; final step | `= k`; `θ(x) = 1/(4(x+1)) + r θ(x+1)`; difference `(2y + 17/4)/(64y²(y+1)) > 0`, `y = x + 1`; `r(y) ≤ (y+½)/(y+3/2)`; `4k² ≥ k + 2` for `k ≥ 1` | every step rederived | none |

- Source locators checked against the text: 12 of 12 in Vershynin2018 (Theorem 7.2.1 line 6048, Lemma 7.2.7 line 6124, Lemma 7.2.8 line 6177, Theorem 7.2.9 line 6204, Theorem 7.2.11 line 6245, Exercise 7.2.12 line 6269, Exercise 7.2.14 line 6296 and (7.12) line 6310, Theorem 7.3.1 line 6326, Exercise 7.3.2 line 6366, Exercise 7.3.4 line 6390, Theorem 7.4.1 line 6441), pages as printed; 0 of 5 in Davidson–Szarek.
- Library declarations opened at the pins: 12 in Mathlib (among them `multivariateGaussian`, `Multivariate.lean` line 166, with `multivariateGaussian_of_not_posSemidef` line 170; `Integrable.integral_eq_integral_meas_le`, `Layercake.lean` line 537; `Matrix.l2_opNorm_def`, `CStarAlgebra/Matrix.lean` line 196; `Real.convexOn_log_Gamma`, `BohrMollerup.lean` line 111), 6 in Tau Ceti (`Affine.lean` line 73, `Sum.lean` line 33, `Multivariate.lean` line 91, `Maximum.lean` line 83, `Chi/Gaussian.lean` line 60, `Chi/Moments.lean` line 96); every name, file and described statement agrees.
- Cross-roadmap citations resolved on main: MathematicalStatisticsFoundations §4.4 (`gaussian_integration_by_parts`, `Suggested.lean` line 384, hypotheses as restated in the contract), MathematicalStatisticsAsymptotic §3.3, RandomMatrices §2.4 and §2.5, GaussianIsoperimetryAndClusters §8.1, §8.4, §8.5, MathematicalStatisticsHighDimensional (README line 1863).
- Duplication: no declaration or target on Slepian, Sudakov–Fernique, Gordon, Sudakov minoration, Gaussian interpolation or Gaussian width in the pinned Mathlib or Tau Ceti, on main or in an open roadmap pull request.
- Overlap check: read RandomProjectionsAndSketching, KalmanFiltering, MatrixSpectralStatistics, GaussianIsoperimetryAndClusters, MathematicalStatisticsHighDimensional, MathematicalStatisticsAsymptotic; nothing shared (MathematicalStatisticsHighDimensional lists Gaussian comparison as left to others).
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line. The one roadmap supplier, MathematicalStatisticsFoundations, is on main.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning (10 theorems, 1 definition with a real body, single `import Mathlib`, no `set_option`); the 11 elaborated types were compared with the README statements and agree, no binder lost. One-tactic probe (`rfl`, `simp`, `infer_instance`): none of the 10 theorems closes. All headline theorems of the README are stated.
- The pull request's title and description agree with the head (new roadmap, 10 theorems and `toMatrix`, one roadmap supplier on main, no change outside the folder).

Source independence: 12 passages compared with 1 source (Vershynin2018), none shared; largest share Vershynin2018, 12 of 17 locators; contents compared with Vershynin2018 §7.2–7.4: independent (Layers 2 and 3 split its §7.2.3, Layers 4 and 5 are in the opposite order to §7.4 and §7.3, 5.2 and the monotonicity proof of 5.3 are not in those sections; the order 1 → 2, 3 → 4, 5 is forced by the `*Needs:*` lines on 1.2, 2.2 and 3.2). The Davidson–Szarek text could not be read.

Research link: The comparison inequalities of Slepian (1962), Sudakov (1971), Fernique (1975) and Gordon (1985, 1988), with Gordon's application to random subspaces and the sharp Gaussian singular-value bounds of Davidson–Szarek (2001); used for Gaussian widths and the basis-pursuit phase transitions named in the README scope. Rests on the README and Vershynin2018 §7.2–7.4.

## Not verifiable

- Davidson–Szarek, Lemma II.9, Remark II.10 (strict inequalities), Theorem II.13 and its proof (entries `N(0, 1/n)`, the bound `aₘ − aₙ`, pp. 39–43 of the preprint): the published chapter is behind a paywall and the sources service could not classify the preprint's host; the text was not read. Each statement citing it also has a Vershynin locator, which was read, except the attribution in 5.2, which is proved in the roadmap.
- The Monte Carlo figures of the Checks in 2.1, 2.2, 3.1, 5.2 and those of 5.1 and 5.3 other than `(m, n) = (3, 2)`, and the quadrature Check of 1.1: not rerun (the `(3, 2)` values, all closed-form values and the Gamma-function inequalities were recomputed).

## Source issues

- **Misprint** in Vershynin2018 at Theorem 7.2.9, printed page 165: the source says the tail comparison holds for nonnegative levels, while presenting it as equivalent to Theorem 7.2.1, stated for all real levels; it should be every real level, which the proof gives; affects nothing.

## For the human reviewers

- Licence: the Davidson–Szarek preprint on K. R. Davidson's University of Waterloo page could not be fetched through the sources service (host not classified); its five locators in the README (2.1, 2.2, 5.1, 5.2, 5.3) are unverified.
- Licence: Vershynin's first-edition text was read from the copy on the author's University of California, Irvine page; the roadmap has no sources manifest, and the service did not accept that address for this roadmap.
