# Review of MathematicalStatisticsSemiparametric (pull request #2378 at b2960a7)

**Verdict:** needs changes

Previous review (at b1cb157): R01–R09, R11 and R12 are repaired at this head; R10 is partly repaired and is R04 below.

## R01 (P3) — arguments on varying sample spaces cite the fixed-space sections of Foundations

**Location:** `TauCetiRoadmap/MathematicalStatisticsSemiparametric/README.md` lines 214–216, 227, 550, 992 and 1042: "8.2: boundedness in probability, for the `√n`-consistent preliminary estimators of 5.2 and 5.3"; "*Needs:* 5.1, 4.4; Foundations 8.2, 8.3, 8.6."

**Claim:** 2.3, 4.2, 4.4, 5.2 and 5.3 work on `Fin n → X` under product laws that change with `n`. Foundations 8.2–8.4 are stated on one probability space; the varying-space forms are MathematicalStatisticsAsymptotic 1.1, which the contract lists for the definition `TendstoInProbability` only.

**Witness:** Foundations 8.2: "`IsBoundedInProbability μ X`, for `X : ℕ → Ω → E`"; 8.3: "For real sequences under a finite measure". Asymptotic 1.1 states `IsBoundedInProbabilityAlong`, "The algebra of Foundations 8.3 on varying spaces" and Slutsky's lemma on varying spaces.

**Repair:** Replace line 227 by "**Convergence on varying spaces** (1.1): `TendstoInProbability` and `IsBoundedInProbabilityAlong`, the algebra of convergence in probability on varying spaces (sums, constant multiples, `O_P(1) · o_P(1) = o_P(1)`, transfer under contiguity) and Slutsky's lemma on varying spaces, used wherever the sample space is `Fin n → X` under a product law (2.3, 4.2, 4.4, 5.2, 5.3)." Keep the sentence on the local copy. In the Foundations contract, change the 8.2 bullet to "8.2: boundedness in probability on one probability space" and add "(5.1, 6.5)" to the 8.3 bullet. Add "MathematicalStatisticsAsymptotic 1.1" to the `*Needs:*` lines of 2.3, 4.2, 4.4, 5.2 and 5.3, and drop "Foundations 8.2" from those of 5.2 and 5.3 and "8.3–8.4" from that of 2.3 (8.5 and 8.6 stay).

## R02 (P3) — padding in `Suggested.lean`: two declarations close from one library lemma

**Location:** `TauCetiRoadmap/MathematicalStatisticsSemiparametric/Suggested.lean` line 143 `posDef_efficientInformationMatrix_iff` and line 1230 `hasGradientAt_obsLogLikelihood_zero_of_isMaxOn`.

**Claim:** The first is Mathlib's Gram-matrix criterion applied to the efficient scores. The second is Fermat's rule on free hypotheses: Fisher's identity is assumed (`hfisher`), not derived from `EMRegular`, and the conclusion is `hfisher` with `gQ` replaced by `0`.

**Witness:** On a scratch copy the first closes with `exact Matrix.posDef_gram_iff_linearIndependent (𝕜 := ℝ) (v := fun i ↦ efficientScore P N (ℓ i))` (`Mathlib/Analysis/InnerProductSpace/GramMatrix.lean:121`); the second with `(hmax.isLocalMax hΘ).hasFDerivAt_eq_zero hQ.hasFDerivAt` and a rewrite of `hfisher`.

**Repair:** Delete both from `Suggested.lean`. The README keeps the two statements, written without the backticked names: in 1.3, "`Ĩ` is positive definite iff the efficient scores are linearly independent in `L²` (Mathlib `Matrix.posDef_gram_iff_linearIndependent`)", with that declaration added under "From Mathlib"; in 7.2, the **Stationarity** bullet without "(`hasGradientAt_obsLogLikelihood_zero_of_isMaxOn`)".

## R03 (P3) — the README still points at an open Mathlib pull request and carries three orphaned punctuation marks

**Location:** `README.md` lines 1676–1678: "The Mathlib pull request [#44536](https://github.com/leanprover-community/mathlib4/pull/44536) adds the conditional variance of a Bernoulli variable"; lines 1054–1055, 1059–1060 and 1462–1463.

**Claim:** The pull-request bullet, which the previous review asked to delete, is unchanged, and it is not timeless. Removing the "(python)" tags left a comma or full stop alone at the start of a line in three Checks.

**Witness:** Line 1055 reads " , against the bound `1`."; line 1060 reads " ."; line 1463 reads " , not `1`.".

**Repair:** Delete the bullet at lines 1676–1678. Join the three sentences: "and `1.016` under `N(0, 1)`, against the bound `1`."; "so `I_η = π²`."; "is `(2π)^{-1/2} e^{-1/2} = 0.24197`, not `1`."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.2 `tangentSpace_union` | uniform on 3 points, `f = (1,0,0)`; `T = {(1,-1,0)}`, `T' = {(1,1,-2)}` (orthogonal) and `T' = {(1,0,-1)}` (not) | projections `(1/2,-1/2,0) + (1/6,1/6,-1/3) = (2/3,-1/3,-1/3) = f - 1/3`; non-orthogonal sum `(1,-1/2,-1/2)` differs | holds; additivity needs orthogonality, as stated | none |
| 1.3 efficient scores and information | `ℓ₁ = (1,0,-1)`, `ℓ₂ = (1,-1,0)`; `N = {(1,-1,0)}`, `{(1,-2,1)}`; `k = 0` | `Ĩ = 1/2`, `I = 2/3`; `ℓ̃₂ = (1/2,0,-1/2)`, `Ĩ₂₂ = 1/6`; Gram `[[2/3,1/3],[1/3,2/3]]`, det `1/3`; empty matrix positive definite, empty family independent | holds; the positive-definiteness criterion is Mathlib's | R02 |
| 2.1 path scores | `N(t,1)`; `Uniform[0,1+t]`; location path of `cos²(πx/2)` | squared Hellinger distance `2(1 - e^{-t²/8}) ≈ t²/4 = ‖(t/2) x √q₀‖²`; remainder of order `√t`; `I_η = π²` | holds | none |
| 2.3 local asymptotic normality along a path | `N(t,1)`; `g = 0`; event of a zero ratio | exact `n^{-1/2} Σ xᵢ - 1/2`; ratio `→ 1`; `n P(q_t = 0) ≤ n (4 ‖r_t‖² + t² E g² 1{abs g > 1/t}) → 0` at `t = 1/√n` | holds; `log 0 = 0` is not used; instance of Asymptotic 7.3 with `k = 1`, `s = [0, ∞)` | R01 |
| 2.3 `tendstoInDistribution_path` | `N(t,1)`, `φ = x`; `g = 0` | covariance `[[1,1],[1,1]]`, positive semidefinite, so `multivariateGaussian` is not the Dirac fallback; shift `⟪φ,g⟫ = 1`, exact `N(1,1)` | holds | none |
| 3.2 chain rule, score operators | two-point family, `h(p) = p²`; `H = ℝ`, `A a = a s`, `s ≠ 0` and `s = 0` | influence function `2p(x - p)`, variance `4p³(1 - p)`; `ψ̃ = c s/‖s‖²`; `s = 0`, `χ ≠ 0`: `range A† = 0`, not differentiable | holds, "iff" both ways | none |
| 3.3 mean, quantile, median model | `N(0,1)`, `p = 1/2`; tilt in the median model | `π/2`; `ofReal((1 + tg) f) = ofReal(1 + tg) · ofReal f` for `abs t ‖g‖ < 1`; `m_t → m` keeps `f(m_t) > 0` | holds | none |
| 3.4 semiparametric, symmetric location, partially linear | `N = ∅`; logistic; `D = X + U` | `Ĩ⁻¹ Ĩ a = a`; odd times even integrates to `0`, `I = 1/3`; `Π_N ℓ = E[D ∣ X] ε/σ²`, `Ĩ = Q/σ² = 1/σ²` against `2/σ²` | holds | none |
| 3.5 least favourable submodels | `ℓ = (1,0,-1)`, `n = (1,-1,0)`; `g = -Π_N ℓ`, `0`, `-n` | `‖ℓ + g‖² = 1/2 = Ĩ`; `2/3`; `2/3` | holds; equality only at `g = -Π_N ℓ` | none |
| 4.2 regular and asymptotically linear | `ι` empty; shift `a = ⟪φ,g⟫ - ψ'(g)` | vacuous; a probability law equal to its translate by `a` has `a = 0` | holds | R01 |
| 4.3 convolution, local asymptotic minimax | all scores `0`; median under `N(θ,1)`; `Tₙ = n` | `m = 0`, empty information matrix positive definite, `L = δ₀ * L`; `N(0,π/2) = N(0,1) * N(0,π/2 - 1)`; risk `∞` | holds; hypotheses of Asymptotic 7.5, 7.6 (information positive definite) are met by the identity | none |
| 4.4, 4.5 efficiency | all scores `0`; `Ĩ⁻¹ Ĩ Ĩ⁻¹` | both sides say `√n (Tₙ - θ) → 0` in probability; `= Ĩ⁻¹` | holds | R01 |
| 5.1 cross-fitting lemma | `n = 5`, folds `(0,0,0,1,1)`, `o = (0,1,2,3,4)`; `K = 0`; `K = 1` | average `-0.5`, plug-in `0`; `SampleSplit n 0` empty for `n ≥ 1`; conditional variance at most `‖φ̂ - φ₀‖²` | holds, no fold-size condition | none |
| 5.2 one-step theorem | blocks 1–4; `θₙ ∉ Θ` for small `n`; block size `⌊n/4⌋` | evaluation on blocks 3, 4 with estimators from 1, 2 and conversely; remainder jointly measurable in `(t, sample)` through `ψ̂` alone; subsequence with increasing block sizes | hypotheses suffice for the stated conclusion | R01 |
| 5.3 centre of symmetry | logistic, `N(0,1)`, Gumbel, `cos²(πx/2)`, `(3/4)(1 - x²)`; score sum for `cos²` | `3`, `1.016088`; `η(±1) = 0.25465, 0.17937`, `I = 1`; `π²`; `∞`; summand has infinite mean, yet `P(one within c/√n of the pole) ≈ n^{-1/2} → 0` | holds in probability, as stated | R03 |
| 6.1–6.3 missingness, densities, mixed bias | two-point `X`, `π₀ = (0.5,0.8)`, `m₀ = (1,3)` | `2.2308`; `Eφ = 1.45`, bias `-0.55`; placeholder branch mass `0.69947` | holds | none |
| 6.2 `condDistrib_fst_ae_eq_ignorable` | total mass of `J`; normalizer `c(o) m(o)` | `∫ observedDensity d(reference) = 1`; posterior `L_ign pθ / m(o)` where `c(o) m(o) > 0`, a set of full `J`-measure; `J.map snd ≪ Jign.map snd` | holds without positivity of the propensity factors | none |
| 6.4 missing mean | path `(a, e)`; `u ⊥` all scores; example | propensity `π₀(1 + t(1 - π₀)e) ∈ [0,1]` for `abs (t e) ≤ 1`; derivative `E[Y a]` on both sides; `u₁ = u₀ = 0`; `2.625 < 4.25` | holds | none |
| 6.5 cross-fitted estimator | decomposition of `φ_{m,π} - φ_{m₀,π₀}`; `π̂` unbounded above | `(m - m₀)(1 - R/π) + R(Y - m₀)(π₀ - π)/(π π₀)`; `D ≤ δ⁻²`, `D ≤ δ⁻⁴ (π - π₀)²` | holds | none |
| 7.1 EM setting | multinomial `(38,34,125)`; normal example; `1/(z log² z)` | mean `25`, step `59/97 = 0.608247`; `Q = -(1 + (θ - θ')²)/2 - log(2π)/2`; `∫ dz/(z log² z) = 1/log 2`, `emQ ≡ 0` | definitions as stated | none |
| 7.2 EM identity, monotonicity, stationarity | `ρ = 0`; iterates from `0.5` | `0 = 0 - 0 + 0`; `0.608247, 0.624321, 0.626489, 0.626777, 0.626816`, limit `0.626821`, `L(θ̂) = -19.259` | identity and monotonicity hold; stationarity is Fermat's rule on its hypotheses | R02 |
| 7.3 Fisher, Louis | normal example; `ρ = 0`; non-integrable example | `0 = 1 - 1`; `0 = 0`; `2 ≠ 0 - 0` without `integrable_log`; cross term `‖S(θ)‖ ‖S(θ')‖ f θ' ≤ G` | holds | none |
| 7.4 EM map | multinomial at `θ̂`; `E = 0`, `r = -1` | `435.318 - 377.517 = 57.801`, `57.801/435.318 = 0.132779 = DM`; empty spectrum, `C = 0` | holds; both operator statements now carry `EMRegular` | none |
| 8.1 total variance | `Θ = Z₁ + Z₂ + Z₃`, `m₁ = σ(Z₁)`, `m₂ = σ(Z₁, Z₂)`; `m₁ = ⊥` | `2 = 1 + 1`; Mathlib `integral_condVar_add_variance_condExp` | holds; not at the pins | none |
| 8.2 posterior as a mixture | `θ = Y_mis` independent of `Y_obs`; kernel types | left side the law of `Y_mis`; right side `δ_y` averaged over it; `Kernel O (O × M)` then `Kernel (O × M) ℝ` | holds | none |
| 8.3 Rubin's rules | `κ z = N(z,1)`, `ν = N(0,1)`, `D = 5`; `z = (0,1,2)`; `D = 1` | `E T = 2.2`; `θ̄ = 1`, `V̄ = 1`, `B = 1`, `T = 7/3`; `B = 0` by `0⁻¹ = 0` | holds for `D ≥ 2` | none |

- Source locators checked against the text: 0 of 72 (van der Vaart 37, Little–Rubin 18, Bickel–Klaassen–Ritov–Wellner 15, Kosorok 2); the sources service found no legal copy of any of the four books.
- Library declarations opened at the pins: `Mathlib/Analysis/InnerProductSpace/GramMatrix.lean:40,121`; `Mathlib/Analysis/Calculus/LocalExtr/Basic.lean:187`; `Mathlib/Probability/Distributions/Gaussian/Multivariate.lean:166–171`; `Mathlib/Probability/Moments/CovarianceBilin.lean:193`; `Mathlib/Probability/CondVar.lean:109,136`; `Mathlib/Probability/Kernel/CondDistrib.lean:182`; `Mathlib/MeasureTheory/Function/ContinuousMapDense.lean:352`; `Mathlib/MeasureTheory/Function/ConvergenceInDistribution.lean:64`; `TauCeti/Probability/Quantile.lean:164`; `TauCeti/Probability/Moments/Mixture.lean:128,137`; `TauCeti/Probability/Moments/SampleMean.lean:94,111`. All 74 `#check` pins elaborate. No tangent space, path score, missing-data or EM object exists at either pin.
- Cross-roadmap citations resolved at the open heads: MathematicalStatisticsFoundations 8.2–8.6 (5) and MathematicalStatisticsAsymptotic 1.1, 1.2, 7.1–7.6 (8); the sections exist and state what the contract says, except for the fixed-space forms of R01. The two local copies equal the owners' definitions (Foundations `Suggested.lean` line 784, Asymptotic line 100), in this roadmap's namespace.
- Gate: every check passed. Dependency check: `depcheck: 245 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 82 `sorry` warnings and nothing else. `#check @name` on all 124 declarations: the Layer 1 definitions other than `meanZeroL2` drop `[IsProbabilityMeasure P]` and the Layer 7 definitions other than `completeScore` drop the structure on `E`, which their bodies do not use; every theorem keeps its section binders.
- One-tactic probe on a scratch copy: the two declarations of R02 close; attempts on `setOf_isMaxOn_observedLikelihood`, `indepFun_restrict_training` and `isClosed_range_of_isUnit_adjoint_comp` do not.
- The pull request's text against the head: 82 admitted theorems, eight layers, the suppliers and their sections all agree; no sentence is contradicted.
- Overlap check: read MathematicalStatisticsAsymptotic, MathematicalStatisticsNonparametric, MathematicalStatisticsFoundations, PointProcesses, StandardDistributions, OptimalTransport, StochasticCalculus; nothing shared. Asymptotic's scope hands tangent sets, efficient influence functions, the semiparametric convolution bound and the split one-step estimator to this roadmap; the Fisher information matrix is cited to Asymptotic 7.3; searches of all open roadmaps for missing data, cross-fitting, EM and imputation found no other owner.
- Source independence: 0 passages compared with 0 sources (no text readable); largest share van der Vaart 1998, 37 of 72 locators; contents compared only through the README's own locators (§25.2 → 1.1, 1.2, 1.4; §25.3 → 2.1, 3.1, 3.5, 4.1, 4.3; §25.4 → 1.3; §25.5 → 1.4, 2.2, 3.2, 3.5, 6.4; §25.8 → 5.2, 5.3; §25.11 → 3.4): not one to one, independent.

## Not verifiable

- 1.2: van der Vaart, §25.2, p. 361: no legal copy found by the sources service.
- 1.3: van der Vaart, §25.4, pp. 369–370: not readable.
- 2.1: van der Vaart, (25.13), p. 362, Lemma 25.14, p. 363, Example 25.15, pp. 363–364; Bickel–Klaassen–Ritov–Wellner, Corollary A.5.1, p. 460, and §2.1, Example 2, p. 15: not readable.
- 2.3: van der Vaart, Lemma 25.14, p. 363: not readable.
- 3.2: Bickel–Klaassen–Ritov–Wellner, §3.3, Corollary 2, p. 63; van der Vaart, Theorem 25.31, p. 373: not readable.
- 3.5: van der Vaart, §25.3, p. 362, and §25.5.1, p. 374: not readable.
- 4.3: van der Vaart, Theorems 25.20 and 25.21, p. 366; Bickel–Klaassen–Ritov–Wellner, §3.3, Theorem 2, p. 63; Kosorok, Theorem 18.3, p. 338 (paywalled): not readable.
- 5.1: no source locator; the lemma is derived in the route, which was checked.
- 5.3: van der Vaart, §25.8.1, p. 397, (25.63) and Lemma 25.64, p. 398; Bickel–Klaassen–Ritov–Wellner, §2.1, Propositions 2 and 3 with display (15), pp. 16–17, and §7.8, Proposition 1 and Example 1, pp. 398–401: not readable.
- 6.5: no source locator; derived from 5.1, 6.3 and 6.4, which was checked.
- 7.1: Little–Rubin, (8.13)–(8.15), pp. 193–194, Example 8.2, p. 190, Table 8.1, p. 191: not readable; the iterates were recomputed, not compared with print.
- 7.2: Little–Rubin, (8.17)–(8.18) and Theorem 8.1, p. 194, Theorem 8.2, p. 195: not readable.
- 7.3: Little–Rubin, (8.26)–(8.27), p. 198, p. 199 and (8.30); Example 8.5, p. 199: not readable.
- 8.1: Little–Rubin, (10.9)–(10.10), p. 233: not readable.
- 8.2: Little–Rubin, (10.8), p. 233: not readable.
- All other locators, including Bickel–Klaassen–Ritov–Wellner, §7.8, Theorem 1, p. 395, on which 5.2 rests: not readable.
- `README.md` lines 1508–1509, the remark that Little–Rubin print `435.8` where the computation gives `435.3`: the value `435.318` is confirmed, the printed one could not be read.
- Ownership against the board's packages was checked only through the index given (two packages, neither statistical).

## Source issues

- none

## For the human reviewers

- **Not tested.** van der Vaart, *Asymptotic Statistics* (37 of 72 locators), and the three other books could not be read: wording and arrangement were not compared with any source text or table of contents.
- **Licence.** `README.md` lines 1644–1670 say the headlines of Layers 3–6 are formalized in the author's `lean-CKSD` (Apache 2.0), `CKSD/Asymptotics/`; the names and statements of `Suggested.lean` were not compared with that repository.
