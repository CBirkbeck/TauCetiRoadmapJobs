# Review of MathematicalStatisticsSemiparametric (pull request #2378 at b1cb157)

**Verdict:** needs changes

## R01 (P2) — `variance_bind` is already proved at the pinned Tau Ceti

**Location:** `TauCetiRoadmap/MathematicalStatisticsSemiparametric/README.md` line 1353 and `Suggested.lean` line 899: "`variance_bind`: for a Markov kernel `κ : Kernel M ℝ`, a probability `ν` and `x²` integrable under `κ ∘ₘ ν`, `Var(κ ∘ₘ ν) = …`".

**Claim:** The mixture law of total variance is a target of 8.1 and a `sorry` of `Suggested.lean`, but the pinned Tau Ceti proves it, and the supplier contract does not list it.

**Witness:** `ProbabilityTheory.Kernel.variance_comp`, `TauCeti/Probability/Moments/Mixture.lean:137`. On a scratch copy the `sorry` closes with `Kernel.variance_comp κ ((memLp_two_iff_integrable_sq measurable_id.aestronglyMeasurable).2 h2)`.

**Repair:** Delete `variance_bind` from `Suggested.lean`. Replace the 8.1 bullet by "The law of total variance of a mixture `κ ∘ₘ ν` is Tau Ceti's `ProbabilityTheory.Kernel.variance_comp`, and the covariance form is `Kernel.covariance_comp`." Add under "From Tau Ceti": "**Mixture moments:** `ProbabilityTheory.Kernel.variance_comp` and `Kernel.covariance_comp` (`TauCeti/Probability/Moments/Mixture.lean`), for 8.1 and 8.3." Cite `Kernel.covariance_comp` in the vector-estimand bullet and the `*Needs:*` line of 8.3, and drop "for mixtures and" from Scope item 8.

## R02 (P2) — 2.3 re-plans the local asymptotic normality theorem of MathematicalStatisticsAsymptotic 7.3

**Location:** `README.md` lines 499–501 and 221: "the expansion is that of van der Vaart, Theorem 7.2, p. 94, run along `t = 1/√n`"; "supplies exactly the following, and nothing else is used".

**Claim:** `tendstoInProbabilityZero_logLikelihoodRatio_path` is planned with its own proof of the quadratic-mean expansion. Asymptotic 7.3 states that expansion within a set of parameters, and neither the 7.3 contract bullet nor the `*Needs:*` line of 2.3 consumes it.

**Witness:** Asymptotic 7.3 `tendstoInProbability_likelihoodRatio_of_hasQMDWithinAt` with `k = 1`, `s = Ici 0`, `θ = 0`, `hₙ = 1`, `p t = d(Q t)/dν` gives `ratio · exp(-Δₙ + ‖g‖²/2) → 1`; its README says `s` serves "the one-sided paths of semiparametric models".

**Repair:** Keep the statement and replace the route by: "Route: for measurable `g`, `HasPathScore ν Q g` gives `HasQMDWithinAt ν p (Ici 0) 0 g` with `k = 1` and `p t = d(Q t)/dν` (2.1 gives `g ∈ L²(P)`, and the remainder is square integrable for small `t`, so its Bochner integral is the squared `eLpNorm`). MathematicalStatisticsAsymptotic 7.3 (`tendstoInProbability_likelihoodRatio_of_hasQMDWithinAt`, `hₙ = 1`) gives the multiplicative expansion; taking logarithms on the event of a positive ratio, whose probability tends to one, gives the additive form." Add "7.3 (local asymptotic normality within a set)" to the `*Needs:*` line of 2.3 and to the 7.3 bullet of the supplier contract.

## R03 (P2) — statable headlines are absent from `Suggested.lean`, and its docstring names none

**Location:** `Suggested.lean` lines 10–14 and `README.md` lines 33–34: "It is not an exhaustive acceptance test: the other headlines (bold or not) are targets of the same standing, stated in prose".

**Claim:** Two headlines of the Summary and of Scope item 6 are statable at the pins and are not stated: ignorability for Bayesian inference (6.2) and the efficient influence function of the missing mean (6.4). The module docstring lists no headline as not statable.

**Witness:** README line 1060 says of 6.2: "Stated with Mathlib's posterior `condDistrib`". For 6.4, `hasDerivAt_marMean_marPath` and `eq_zero_of_forall_integral_mul_marScore_eq_zero` mention neither `PathFamily` nor `efficientInfluence`.

**Repair:** State (a) ignorability for Bayesian inference, with its exact hypotheses (the joint law built from a product prior on `Θ × Φ` and the observed-data density of 6.2, with positive propensity factors), as an a.e. equality of two `condDistrib` kernels; (b) the missing-mean theorem on the roadmap's carriers: a `PathFamily` of the observed laws `(marPath Q₀ π₀ a e t).map observe`, indexed by bounded `(a, e)`, with `HasPathwiseDerivative` for `marMean` and `efficientInfluence F ψ' 0` equal to the class of `aipwScore m₀ π₀ - μ`. Replace the two "not exhaustive" sentences by the list of headlines that are not statable at the pins, each with the carrier it lacks (for example the parametric paths of 2.1, which need `HasQMDWithinAt` of MathematicalStatisticsAsymptotic).

## R04 (P3) — two 7.4 declarations are statements about free operators

**Location:** `Suggested.lean` lines 876–887, `spectrum_subset_Ico_of_comp_eq` and `tendsto_iterate_emMap`: "(icom imis DM : E →L[ℝ] E) (hcom : IsSelfAdjoint icom) (hmis : imis.IsPositive)".

**Claim:** Neither statement mentions an object of the roadmap: both are linear algebra on arbitrary `icom`, `imis`, `DM` and an arbitrary map `M`, so they do not test the EM theory.

**Witness:** Elaborated type: `∀ (icom imis DM : E →L[ℝ] E), IsSelfAdjoint icom → imis.IsPositive → (∃ c > 0, …) → icom ∘SL DM = imis → spectrum ℝ DM ⊆ Ico 0 1`; no `emQ`, `missingLaw` or `EMRegular`.

**Repair:** State both for the EM map: take `hf : EMRegular ρ f U`, `hθs : θs ∈ U`, `hfix`, `hstep` and `hM` exactly as in `comp_fderiv_emMap_eq`, and `hobs : ∃ c > 0, ∀ v, c * ‖v‖ ^ 2 ≤ inner ℝ ((-fderiv ℝ (gradient (obsLogLikelihood ρ f)) θs) v) v`, with the conclusions unchanged. They then follow from `louis_formula`, `comp_fderiv_emMap_eq` and the operator step, which stays in 7.4 as prose without a backticked name.

## R05 (P3) — padding in `Suggested.lean`

**Location:** `Suggested.lean` line 68 `mem_meanZeroL2_iff` and line 621 `measurable_observe`.

**Claim:** Both are API lemmas about a definition, not headlines.

**Witness:** `mem_meanZeroL2_iff` closes on a scratch copy with `simp [meanZeroL2, Submodule.mem_orthogonal_singleton_iff_inner_right, MeasureTheory.L2.inner_def]`; `measurable_observe` with one `exact` term (`Measurable.prodMk`, `Measurable.ite`, `measurableSet_eq_fun`).

**Repair:** Delete both from `Suggested.lean`. The README keeps the two facts in 1.1 and 6.1, written without the backticked names.

## R06 (P3) — `tendstoInProbabilityZero_locationScoreSum`: no hypotheses in the README, symmetry in the Lean

**Location:** `README.md` line 920: "`tendstoInProbabilityZero_locationScoreSum`: for bounded `hₙ`, under `locationLaw η θ`, …"; `Suggested.lean` line 577: `(hη : IsSymmetricFiniteInformationDensity η η')`.

**Claim:** The README bullet states no hypothesis on `η`; the Lean requires symmetry, which the cited result for regular location models does not use.

**Witness:** The Gumbel density `e^{-x - e^{-x}}` is absolutely continuous with score `1 - e^{-x}` and `I_η = Var(e^{-X}) = 1`, and is not symmetric: the cited route covers it, `hη` excludes it.

**Repair:** In the README: "for `η`, `η'` satisfying the hypotheses of `hasPathScore_location` (nonnegative, of integral `1`, `η x = η 0 + ∫₀ˣ η'` with `η'` locally integrable, `η'²/η` integrable) and bounded `hₙ`, …". In the Lean, replace `hη` by those hypotheses, as in `hasPathScore_location`. Add the Gumbel density as a Check.

## R07 (P3) — `informationMatrix` is the matrix information of MathematicalStatisticsAsymptotic 7.3 on another carrier, with no citation

**Location:** `README.md` lines 322–323: "`informationMatrix P ℓ` and `efficientInformationMatrix P N ℓ`, the Gram matrices of `ℓ` and of the efficient scores".

**Claim:** Asymptotic 7.3 owns `fisherInformation P ℓ̇ = E ℓ̇ ℓ̇ᵀ` for a score function. 1.3 defines the same matrix for `Lp` classes without saying how the two relate, and 4.3 identifies them tacitly ("information the identity").

**Witness:** MathematicalStatisticsAsymptotic `Suggested.lean` line 1033: `fisherInformation P score = Matrix.of fun i j ↦ ∫ x, score x i * score x j ∂P`.

**Repair:** Add to 1.3: "`informationMatrix P ℓ` is `fisherInformation P (fun x ↦ (ℓ j x)ⱼ)` of MathematicalStatisticsAsymptotic 7.3, read on `Lp` classes; it is kept as a definition because Layer 1 uses Mathlib only." Add the same clause to Scope and ownership, and name the identity in the route of 4.3.

## R08 (P3) — definitions with fewer than three Checks

**Location:** `README.md`, Checks of 1.3, 3.1, 5.3, 6.1, 6.2, 7.1 and 8.3; for example line 576: "`efficientCovariance`: `p(1 - p)` in the two-point family, and `1` for `N(t, 1)`".

**Claim:** Counting bullets by the definition they name: `efficientCovariance` and `obsLikelihood` have 1, `obsLogLikelihood` 0, and `IsInfluenceFunction`, `efficientInfluence`, `informationMatrix`, `efficientInformationMatrix`, `locationLaw`, `locationFisherInformation`, `observe`, `observedDensity`, `observedReference`, `missingLaw`, `emQ`, `IsEMStep`, `miMean`, `miWithin`, `rubinTotalVariance` have 2.

**Witness:** Line 576 is the only `efficientCovariance` bullet; no bullet opens with `obsLogLikelihood`.

**Repair:** Add one or two Checks each. Computed candidates:
- `IsInfluenceFunction`, `efficientInfluence`, `efficientCovariance`: for an empty family every `φ` is an influence function, `φ̃ = 0` and the covariance is `0`; in the two-point family with `ψ = (p, 2p)` the covariance is `p(1 - p) [[1, 2], [2, 4]]`, singular.
- `informationMatrix`: `(ℓ₁, ℓ₁)` gives `[[2/3, 2/3], [2/3, 2/3]]`, determinant `0`.
- `efficientInformationMatrix`: `N = {(1, -2, 1)}`, `ℓ₂ = (1, -1, 0)`: `⟪ℓ₂, n⟫ = 1`, `‖n‖² = 2`, `ℓ̃₂ = (1/2, 0, -1/2)`, entry `1/6`.
- `locationLaw`: the uniform density on `[0, 1]` and `θ = 2` give the uniform law on `[2, 3]`.
- `locationFisherInformation`: `1/σ²` for `N(0, σ²)`.
- `observe`: `observe ∘ observe = observe`.
- `observedDensity`: `π ≡ 0` gives `0` at observed points and `∫ f(x, ·) dρ` at missing ones.
- `observedReference`: `ν = δ_x`, `ρ = δ_y` gives `δ_(true, x, y) + δ_(false, x, 0)`, of mass `2`.
- `obsLikelihood`, `obsLogLikelihood`, `missingLaw`, `emQ`, `IsEMStep` in the normal example of 7.3: `1`, `0`, `N(θ, 1)`, `Q(θ | θ') = -(1 + (θ - θ')²)/2 - log(2π)/2`, and the step from `θ'` is `θ'`.
- `miMean`, `miWithin`, `rubinTotalVariance`: `D = 3`, `κ z = N(z, 1)`, `z = (0, 1, 2)`: `θ̄ = 1`, `V̄ = 1`, `B = 1`, `T = 7/3`.

## R09 (P3) — README shape: no `### Examples`, and 7.1 has no `*Needs:*` line

**Location:** `README.md`, every `## Layer k`; for example lines 392–394: "### Dependencies / Mathlib only." directly after the Checks of 1.4.

**Claim:** No layer has the `### Examples` subsection that precedes `### Dependencies`, and 7.1 (lines 1201–1238) lists no needs.

**Witness:** The README has eight `### Dependencies` headings and no `### Examples` heading; the first `*Needs:*` line of Layer 7 is line 1258, in 7.2.

**Repair:** Add `### Examples` to each layer, carrying the running examples the Checks already use (uniform law on three points; `N(t, 1)` and the two-point tilts; Hodges' estimator; the split `(0, 0, 0, 1, 1)`; the two-point propensity example of 6.1; the multinomial example of 7.1; `κ z = N(z, 1)`). Add to 7.1: "*Needs:* Mathlib `Measure.withDensity`."

## R10 (P3) — process residue and a pull-request reference in the README

**Location:** `README.md` lines 485, 574, 686, 958, 963, 972, 1076, 1264, 1295, 1299, 1337, 1402 and 1409, each naming python; lines 1484–1486: "The Mathlib pull request [#44536]…".

**Claim:** The README records how values were computed and points at an open Mathlib pull request; neither is timeless.

**Witness:** Line 1402: "(python Monte Carlo with `4 · 10⁵` replications agrees to within `0.01`)"; line 1485 links `mathlib4/pull/44536`.

**Repair:** Delete the eleven python tags (nine "(python)", and the word at lines 686 and 1337) and both Monte Carlo remarks at lines 1402–1403 and 1409 (the values stand; all were recomputed, see the table), and delete the bullet on the Mathlib pull request.

## R11 (P3) — the supplier contract lists Mathlib declarations no layer uses

**Location:** `README.md` lines 193–194: "`spectralRadius` and Gelfand's formula `spectrum.pow_nnnorm_pow_one_div_tendsto_nhds_spectralRadius`"; the description: "Gelfand's formula for the rate of EM".

**Claim:** The route of 7.4 uses the norm of `DM` in the `i_{com}` inner product, not Gelfand's formula; no `*Needs:*` line cites `spectralRadius` or the formula. `lpMeas` (line 176) is likewise unused.

**Witness:** Line 1333: "*Needs:* 7.3; Mathlib `spectrum`, `ContinuousLinearMap.IsPositive`."

**Repair:** Delete `spectralRadius`, the Gelfand formula and `lpMeas` from "From Mathlib" and their three `#check` lines, and delete "and Gelfand's formula for the rate of EM" from the description.

## R12 (P3) — labels of `Suggested.lean` disagree with the README

**Location:** `Suggested.lean` lines 56, 134, 200, 268 and 501–528: "## Layer 1: Hilbert-space geometry of scores"; "## Layer 2: differentiable paths and tangent sets"; "**2.2** A family of differentiable paths".

**Claim:** The README titles are "Hilbert geometry of scores" and "differentiable paths"; `PathFamily` is 2.3 there; the docstring at line 268 carries catalogue wording; the 5.3 definitions precede the 5.2 theorem.

**Witness:** `README.md` lines 267, 396 and 494; `Suggested.lean` line 268: "(item: canonical gradient and efficiency)".

**Repair:** Use the README's two titles; label `PathFamily` "**2.3**"; delete "(item: canonical gradient and efficiency)"; move `exists_oneStep_estimator` above `locationLaw`.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.3 efficient scores, information loss | uniform on 3 points, `ℓ₁ = (1,0,-1)`, `n = (1,-1,0)`; `n = (1,-2,1)` | `⟪ℓ₁,n⟫ = 1/3`, `Π ℓ₁ = (1/2,-1/2,0)`, `Ĩ = 1/2`, `I = 2/3`, gap `1/6`; second `n`: inner product `0` | holds; "iff" both ways via the Gram matrix of projections | R07 |
| 1.4 `condExpOperator`, projection formula | `Y` uniform on 3 points, `m = 1{y ≥ 1}`, `b = (0,1,3)`; `H = ℝ` | image `(0, 2)`; norms `10/3 ≥ 8/3`; rank one `⟪s,f⟫ s/‖s‖²` | holds; range of pullback is `L²(σ(m))` by Doob–Dynkin | none |
| 2.1 path scores, location paths | `N(t,1)`; `Uniform[0,1+t]`; `N(abs t,1)`; Laplace; zeros of `η` | score `x`; remainder of order `√t`; right score `x`; `η' = 0` a.e. on `{η = 0}` | holds; mean zero from `∫ (√q_t - √q_0)(√q_t + √q_0) = 0` | none |
| 2.2 tilts, logistic path, images | `g = 2x - 1`, `C = 1`, `t = 1`, `t = -3`; `C = 0`; `k(x) = 2/(1+e^{-2x})` | cut-off returns `P` at `t = 1`; clipped mass `4/3`; `k(0) = k'(0) = 1`, `k'/k ∈ (0,2)` | holds | none |
| 2.3 local asymptotic normality along a path | `N(t,1)`; `g = 0`; `n = 0` | exact `n^{-1/2} Σ xᵢ - 1/2`; ratio `→ 1`; `n = 0` irrelevant at `atTop` | holds; instance of Asymptotic 7.3 | R02 |
| 3.1 influence functions, canonical gradient | two-point law; `N(t,1)` with `ψ' = ⟪x + x², ·⟫`; empty family; `φ̃ = 0` with a nonzero score | `p = p(1-p) + p²`; `E(X+X²)² = 4`, projection `x`; vacuous; LUB set `{0}` | holds | R08 |
| 3.2 chain rule, score operators | `χ = A†A b₀`; `A†A` invertible | `ψ̃ = A b₀`; `ψ̃ = A(A†A)⁻¹χ`; uniqueness from `closure(range A) ∩ ker A† = 0` | holds | none |
| 3.3 mean, quantile, median model | `f = x²` under `N(0,1)`; median of `N(0,1)` | `Var(X²) = 2`; `dq/dt = -∫_{-∞}^q g dP/f(q)`; bound `π/2`, information `2/π < 1` | holds; sign agrees with `∫ (p - 1{x ≤ q}) g dP` since `∫ g dP = 0` | none |
| 3.4 `efficientInfluence_semiparametric` | `N = ∅`; `ψ' h = Ĩ⁻¹⟪ℓ̃, h⟫` on a score `aᵀℓ̇ + g` | `Ĩ⁻¹(Ĩ a + 0) = a`; representer lies in the tangent space by `hdense` | holds | none |
| 4.1 regularity, asymptotic linearity | sample mean; Hodges at `0`; `Tₙ = 0` on `N(t,1)`; `x̄ + n^{-1/2}` | `N(0,1)` exactly; limit `-h`; alternatives give `δ_{-1}`, null `δ_0`; remainder `1` | definitions separate the cases | none |
| 4.2 regular and asymptotically linear | empty family; shift `a = ⟪φ,g⟫ - ψ'(g)` | vacuous; `N(a, Σ) = N(0, Σ)` forces `a = 0` | holds | none |
| 4.3 convolution, local asymptotic minimax | median under `N(θ,1)`; `Tₙ = n`; tangent set `{0}`; singular `Pφ̃φ̃ᵀ` | `N(0, π/2) = N(0,1) * N(0, π/2 - 1)`; risk `∞`; `L = δ_0 * L`; Gaussian defined for positive semidefinite covariance | holds; hypotheses of Asymptotic 7.5 and 7.6 met with information the identity | none |
| 4.4, 4.5 efficiency | all scores `0`; `Ĩ⁻¹ Ĩ Ĩ⁻¹` | both sides say `√n (Tₙ - θ) → 0` in probability; `= Ĩ⁻¹` | holds; `φ̃ ∈ L²₀` since scores have mean zero | none |
| 5.1 cross-fitting lemma | `n = 5`, folds `(0,0,0,1,1)`; `n = 2`; `K = 1`; `K = 0`; an empty fold | training sizes `2`, `3`; averages `0` and `4` against `1`; `K = 0` makes `s` uninhabited for `n ≥ 1` | holds; conditional variance at most `‖φ̂ - φ₀‖²` | none |
| 5.2 one-step theorem | `Θ = ∅`; `θₙ ∉ Θ` for small `n`; non-integrable `ψ̂` | vacuous; asymptotic only; excluded with probability tending to one by the `ℝ≥0∞` condition | hypotheses suffice for the split estimator | none |
| 5.3 centre of symmetry | Laplace, `cos²(πx/2)`, `(3/4)(1 - x²)`, Cauchy, logistic; normal score sum | `I = 1`, `π²`, `∞`, `1/2`, `1/3`; sum `-hₙ + hₙ = 0`; `Eψ²/(Eψ')² = 1.01609` under `N(0,1)` | holds; `I_η > 0` for every density | R06 |
| 5.4 identification | `D = X + U`, `g = X²` and `g = X` | `E[U(βU + ε)] = β`; naive regression `β` and `β + 1/2` | holds | none |
| 6.1–6.3 missingness, densities, mixed bias | two-point `X`, `π = (0.5, 0.8)`, `m₀ = (1, 3)`; `m = 0`, `π = 1` | complete-case mean `1.45/0.65 = 2.2308`; `Eφ = 1.45`, bias `-0.55 = 1.45 - 2`; masses `1/2 + 1/2` | holds | R03 |
| 6.4 missing mean | path with `(a, e)`; `u ⊥` all scores; `π₀ = 1` on a set | mass `1`, propensity `π₀ + t π₀(1 - π₀) e`; derivative `E[Y a]` on both sides; `u₁ = u₀ = 0`; variances `2.625 < 4.25` | holds | R03 |
| 6.5 cross-fitted estimator | `π̂ ≥ δ` unbounded above | `D ≤ δ⁻²` and `D ≤ δ⁻⁴ (π - π₀)²` | holds | none |
| 7.1 EM setting | multinomial `(38, 34, 125)`; `ρ = 0`; `1/(z log² z)` | binomial `(125, θ/(2+θ))`, mean `25` at `1/2`; step `59/97 = 0.608247`; `emQ ≡ 0` | definitions as stated | R08, R09 |
| 7.2 EM inequality, monotonicity | `ρ = 0`; identity `L - L' = ΔQ + KL` | all terms `0`; `Q(θ ∣ θ') = L(θ) + E_{θ'} log k_θ`; iterates `0.608247, 0.624321, 0.626489, 0.626777, 0.626816` | holds | none |
| 7.3 Fisher, Louis | normal example; `ρ = 0`; the non-integrable example | `0 = 1 - 1`; `0 = 0`; `2 ≠ 0 - 0` without `integrable_log` | holds; `‖D log f θ‖ ‖D f θ'‖ ≤ G` by the arithmetic–geometric mean | none |
| 7.4 derivative of the EM map, rate | multinomial at `θ̂ = 0.626821`; `E = 0`; `r ≥ 1` | `435.318 - 377.517 = 57.801`, fraction `0.132779`; empty spectrum; trivial | holds | R04, R11 |
| 8.1 total variance | `κ z = δ_z`; `κ` constant | `0 + Var ν`; `Var κ + 0` | mixture form is Tau Ceti's; nested form is not at the pins | R01 |
| 8.2 posterior as a mixture | kernel types | `Kernel O (O × M)` then `Kernel (O × M) ℝ`; Mathlib `condDistrib_comp` is the image under a map, a different statement | holds | none |
| 8.3 Rubin's rules | `κ z = N(z,1)`, `ν = N(0,1)`, `D = 5`; divisor `D`; `D = 1`; `z = (0, 2)` | `E T = 2.2`; `1.96`; short by `2 B_∞`; `θ̄ = 1`, `B = 2`, `T = 4` | holds for `D ≥ 2` | R08 |

- Source locators checked against the text: 0 of 55; none of the four books is readable through the sources service.
- Library declarations opened at the pins: `TauCeti/Probability/Moments/Mixture.lean:108,137`; `TauCeti/Probability/Quantile.lean:164`; `Mathlib/Probability/CondVar.lean:109,136`; `Mathlib/Probability/Kernel/CondDistrib.lean:182`; `Mathlib/Probability/Distributions/Gaussian/Multivariate.lean:166–171`. All 74 `#check` pins elaborate.
- Cross-roadmap citations resolved at the open heads: MathematicalStatisticsFoundations 8.2–8.6 (5) and MathematicalStatisticsAsymptotic 1.1, 1.2, 7.1–7.6 (8); each states what the contract says. The two local copies equal the owners' definitions (Foundations `Suggested.lean` line 784, Asymptotic line 100).
- Gate: every check passed. Dependency check: `depcheck: 245 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives 52 `sorry` warnings and nothing else. `#check @name` on 30 declarations: `tangentSpace`, `efficientScore`, `informationMatrix` and `efficientInformationMatrix` drop `[IsProbabilityMeasure P]`, which their bodies do not need; every Layer 7 statement keeps `[FiniteDimensional ℝ E]`.
- One-tactic probe on a scratch copy: `mem_meanZeroL2_iff`, `measurable_observe` and `variance_bind` close (R05, R01); no other declaration was closed.
- Numeric Checks recomputed: `1.01609`, the five EM iterates, `θ̂ = 0.626821`, `435.318`, `377.517`, `57.801`, `0.132779`, `2.2308`, `2.625`, `4.25`, `1.96`.
- Overlap check: read MathematicalStatisticsAsymptotic, MathematicalStatisticsFoundations, MathematicalStatisticsNonparametric, StandardDistributions, OptimalTransport, StochasticCalculus; shared: local asymptotic normality from one-sided quadratic-mean differentiability and the information matrix, owner MathematicalStatisticsAsymptotic 7.3 (R02, R07). Tangent sets, efficient influence functions and the split one-step estimator are handed here by Asymptotic's scope. A search of all open roadmaps for missing data, EM, imputation and cross-fitting found no other owner.
- Source independence: 0 passages compared with 0 sources (no text readable); largest share van der Vaart 1998, 35 of 55 locators; contents compared only through the README's own locators (§25.2 → 1.1, 1.2, 1.4; §25.3 → 2.1, 3.1, 3.5, 4.1; §25.4 → 1.3; §25.5 → 1.4, 2.2, 3.5; §25.8 → 5.3; §25.11 → 3.4): not one to one, independent.

## Not verifiable

- 1.4: van der Vaart, §25.5, p. 375 and §25.2, pp. 361–362: text not readable (no legal copy found by the sources service).
- 2.1: van der Vaart, (25.13), p. 362, Lemma 25.14, p. 363, Example 25.15, pp. 363–364; Bickel–Klaassen–Ritov–Wellner, Corollary A.5.1, p. 460, and §2.1, Example 2, p. 15: not readable.
- 3.1: van der Vaart, §25.3, p. 363, and Lemma 25.19, p. 365: not readable.
- 3.2: Bickel–Klaassen–Ritov–Wellner, §3.3, Corollary 2, p. 63; van der Vaart, Theorem 25.31, p. 373: not readable.
- 3.3: van der Vaart, Example 25.24, p. 368: not readable.
- 4.1: van der Vaart, §25.3, p. 365; Bickel–Klaassen–Ritov–Wellner, §2.2, Definition 7, p. 21: not readable.
- 4.2: Bickel–Klaassen–Ritov–Wellner, §3.3, Proposition 1, part A, p. 65: not readable.
- 4.3: van der Vaart, Theorems 25.20 and 25.21, p. 366; Bickel–Klaassen–Ritov–Wellner, §3.3, Theorem 2, p. 63; Kosorok, Theorem 18.3, p. 338 (paywalled, uncertified): not readable.
- 5.1: no source locator; the lemma is derived in the route, which was checked.
- 5.4: no source locator; the identity was checked by computation.
- 6.4: van der Vaart, Theorem 25.40, p. 380, Lemma 25.41, p. 381, Example 25.43, p. 383: not readable.
- 7.1: Little–Rubin, (8.13)–(8.15), pp. 193–194, Example 8.2, p. 190, Table 8.1, p. 191: not readable; the table's iterates were recomputed, not compared with print.
- 7.2: Little–Rubin, (8.17)–(8.18) and Theorem 8.1, p. 194, Theorem 8.2, p. 195: not readable.
- 8.1: Little–Rubin, (10.9)–(10.10), p. 233: not readable.
- 8.3: Little–Rubin, (10.12)–(10.14), p. 234, and (10.15): not readable.
- All other locators (including Bickel–Klaassen–Ritov–Wellner, §2.1, Proposition 2 and display (15), on which 5.3 rests, and §7.8, Theorem 1, p. 395): not readable.
- README line 1340–1341, the claim that Little–Rubin print `435.8` where the computation gives `435.3`: the computed value `435.318` is confirmed, the printed one could not be read.
- Ownership against the board's packages was checked only through the index given (two packages, neither statistical).

## Source issues

- none

## For the human reviewers

- **Not tested.** van der Vaart, *Asymptotic Statistics* (35 of 55 locators), and the three other books could not be read: wording and arrangement were not compared with any source text or table of contents.
- **Licence.** `README.md` lines 1450–1478 say Layers 3–6 are formalized in the author's `lean-CKSD` (Apache 2.0), `CKSD/Asymptotics/`; the names and statements of `Suggested.lean` were not compared with that repository.
