# Review of MathematicalStatisticsFoundations (pull request #2111 at ddd39dd)

**Verdict:** needs changes

There are nine findings, all P3: no P1 or P2. The push gate passes. The dependency check reports no problem. The Lean file elaborates with 53 `sorry` warnings and nothing else. No theorem among the 53 was found false, vacuous or missing a hypothesis. The findings are about duplication of Mathlib vocabulary, Checks, locators, naming and file order, dependency lines, and one count in the description.

## R01 (P3) — 3.1–3.3 restate Mathlib's tilted measure and cumulant API instead of citing it

- **Location.** `TauCetiRoadmap/MathematicalStatisticsFoundations/README.md:505` defines the family law as "`exponentialFamilyMeasure ν T η = ν.withDensity (exp (⟪η, T⟫ - logPartition ν T η))`". The targets at `README.md:510-512` read: "the family law is a probability measure; two parameters are related by an exponential tilt; … mutually absolutely continuous". The Lean definition is at `Suggested.lean:202-203`.
- **Claim.** This is a parallel definition of Mathlib's `Measure.tilted`.
  - The three 3.1 targets are Mathlib lemmas about `Measure.tilted`.
  - For `E = ℝ`, the objects of 3.1 and the three statements of 3.3 already exist in Mathlib: `naturalParameterSpace` is `integrableExpSet`, its convexity is `convex_integrableExpSet`, and `logPartition` is `cgf`. The 3.3 statements are `analyticOnNhd_cgf`, `integral_tilted_mul_self` and `variance_tilted_mul`.
  - The README cites none of these. It also does not cite StandardDistributions §7.8, which is on main. That section builds exponential tilting on `Measure.tilted` (its `README.md:1117-1119`), and its `README.md:134` asks for "no parallel abstractions".
- **Witness.** `Measure.tilted` is at `Mathlib/MeasureTheory/Measure/Tilted.lean:42`. The targets are its lemmas at `:125`, `:250`, `:279` and `:282`. Off `N` the two differ: for Lebesgue measure, `T = id` and `η = 0`, the roadmap gives Lebesgue measure and `ν.tilted` gives `0`.
- **Repair.**
  - Define `exponentialFamilyMeasure ν T η := ν.tilted (fun x ↦ inner ℝ η (T x))`, in the README and in `Suggested.lean`.
  - Delete the three 3.1 targets and cite the Mathlib lemmas in 3.1 and in the Mathlib supplier contract.
  - In Scope, say that the case `E = ℝ` of 3.1–3.3 is `integrableExpSet`, `convex_integrableExpSet`, `cgf`, `analyticOnNhd_cgf`, `integral_tilted_mul_self` and `variance_tilted_mul` (`Mathlib/Probability/Moments/IntegrableExpMul.lean:112,119`, `MGFAnalytic.lean:177`, `Tilted.lean:132,159`).
  - Add two Checks: `naturalParameterSpace ν T = integrableExpSet T ν` and `logPartition ν T = cgf T ν` for `E = ℝ`.
  - Cite StandardDistributions §7.8 for tilting.
- **Tested.**
  - For `ν = δ₀ + δ₁`, both definitions give `Bern(e^η/(1+e^η))`.
  - Every Lean statement that uses the law takes `η` in `N` or in an open `U ⊆ N`: 3.3, 3.5, 3.7 and 6.5–6.7. So the change alters no statement.

## R02 (P3) — 8.2: the equivalence is a pinned Mathlib lemma, uncited, and stated more narrowly

- **Location.** `TauCetiRoadmap/MathematicalStatisticsFoundations/README.md:1251-1253` reads: "`isBoundedInProbability_iff_isTightMeasureSet`: for a finite-dimensional real normed space `E` with its Borel σ-algebra, a.e.-measurable `X n` and finite `μ`, boundedness in probability is tightness of the laws". The Lean statement is at `Suggested.lean:734-739`.
- **Claim.** Mathlib already proves this content for any proper normed group. The 8.2 statement is its unfolding with `μ n = μ.map (X n)`. The README cites only `IsTightMeasureSet` and narrows the generality to finite-dimensional real spaces.
- **Witness.** `isTightMeasureSet_range_iff_tendsto_limsup_measure_norm_gt` (`Mathlib/MeasureTheory/Measure/TightNormed.lean:121`, for a proper normed group) proves that `IsTightMeasureSet (range μ)` holds iff `limsup_n μ n {r < ‖x‖} → 0` as `r → ∞`. That limit statement is `IsBoundedInProbability` written out.
- **Repair.**
  - Cite the lemma in 8.2's *Needs:* line and in the Mathlib contract.
  - State the README target for a proper normed group, as the adapter from this lemma.
  - Delete `isBoundedInProbability_iff_isTightMeasureSet` from `Suggested.lean`. It is a library adapter, not a bold headline.
- **Tested.**
  - For `X n = n e₁` in `ℝ²`, `limsup_n μ{r < n} = 1` for every `r`, so both sides fail.
  - For the unit vectors of `ℓ²`, the space is not proper, so the lemma does not apply. This matches the README's remark about infinite dimension.

## R03 (P3) — An unused definition and two names that do not match their statements

- **Location.** `TauCetiRoadmap/MathematicalStatisticsFoundations/Suggested.lean:98` declares `def HasConfidenceCoverage`. At `:687-696`, `theorem hasConfidenceCoverage_scheffe` concludes `(multivariateGaussian …).real {y | ∀ u ∈ S, …} = 1 - α`. At `:359-366`, `sq_deriv_div_fisherInformation_le_variance` concludes `deriv (…) θ ^ 2 ≤ Var[W; P θ] * fisherInformation P f θ`.
- **Claim.**
  - `HasConfidenceCoverage` is declared but no statement uses it. `Suggested.lean` may contain only the definitions its statements need.
  - The Scheffé theorem is named after `HasConfidenceCoverage`, but it proves an exact probability.
  - The 4.3 name describes a quotient bound `(ψ')²/I ≤ Var`, but the statement is the product form.
- **Witness.** `HasConfidenceCoverage` occurs exactly once in `Suggested.lean`, at its declaration (checked by grep over the file).
- **Repair.**
  - Delete `HasConfidenceCoverage` from `Suggested.lean`; README 1.4 keeps it.
  - Rename the Scheffé theorem after its conclusion, for example `measureReal_scheffe_event_eq_one_sub`, in both files.
  - Rename the 4.3 theorem `sq_deriv_le_variance_mul_fisherInformation`, or state the quotient form.
- **Tested.** After the deletion nothing refers to `HasConfidenceCoverage`.

## R04 (P3) — Two Checks are false, and one tests a case its theorem excludes

- **Location.** `TauCetiRoadmap/MathematicalStatisticsFoundations/README.md:696-698`, `:1218` and `:757-758`.
- **Claim.**
  - **4.1 (`:696-698`).** The text reads: "no estimator is square-integrable under every law and nothing is UMVU in that model". This is false.
  - **7.5 (`:1218`).** The text reads: "`IsMoreInformative` with `Θ = ∅` holds between any two experiments". This is false.
  - **4.3 (`:757-758`).** The text says that for a θ-free density "the information inequality then says only that `0 ≤ 0`". The target assumes `fisherInformation P f θ > 0`, so it says nothing in that case.
- **Witness.**
  - **4.1.** `W ≡ 0` is square-integrable under every law, and it is UMVU for `g ≡ 0` (variance 0).
  - **7.5.** Take `Θ = ∅`, `Y` empty, `X = ℝ` and `n = 0`. The empty kernel `Y → Fin 0` is Markov, but no Markov kernel `ℝ → Fin 0` exists, because `Fin 0` carries only the zero measure.
- **Repair.**
  - **4.1.** Say instead that no unbiased estimator of the mean is square-integrable under every law: its symmetrization would be the sample mean, which is not in `L²` for this law. So the mean has no UMVU estimator.
  - **7.5.** Change the Check to "holds whenever `Y` is nonempty", as in Blackwell's theorem. Alternatively, quantify `IsMoreInformative` over `Fin (n + 1)`.
  - **4.3.** Replace the Check with one inside the hypotheses. For `Exp(θ)` and `W = x`: `(ψ')² = 1/θ⁴ = Var · I`, with equality.
- **Tested.** With `Y` nonempty, every Markov kernel `Y → Fin 0` would need `Fin 0` to carry a probability measure, so none exists and the `n = 0` case is vacuous. The constant kernel then makes both sides of Blackwell's theorem hold for `Θ = ∅`.

## R05 (P3) — Many definitions have fewer than three discriminating Checks (previous R09, partly repaired)

- **Location.** Throughout the README. One example is `README.md:914-915`, the only Check of `npTest`: "for `P = δ₀`, `Q = δ₁`, `t = 1` it is `0` at `0` and `1` at `1`".
- **Claim.** Counting distinct tested instances, not bullets, 19 of the 41 definitions of `Suggested.lean` have fewer than three:
  - Layer 1: `mixtureWeight`, `countableMixture`, `testPower`, `HasTestLevel`, `IsSimilarTest`, `IsUniformlyMostPowerfulTest`, `IsUniformlyMostPowerfulUnbiasedTest`, `thresholdTest` and `intervalTest`;
  - Layer 2: `IsCompleteStatistic`, `IsBoundedlyCompleteStatistic`, `IsAncillaryStatistic` and `IsMinimalSufficientStatistic`;
  - Layer 3: `logPartition` and `exponentialFamilyMeasure`;
  - Layer 4: `likelihoodScore`;
  - Layer 6: `npLikelihoodRatio` and `npTest`;
  - Layer 7: `IsBayesRule`.

  Five Layer 9 objects have no Check at all: the Kolmogorov–Smirnov statistic, the restricted `ℓ¹` norm, the quadratic form, the Gaussian negative log-likelihood and i.i.d. noise. Counted by the house rule of one bullet per test, 33 of the 41 definitions have fewer than three.
- **Witness.** `npTest`'s single Check uses `t = 1`, where the threshold `t⁻¹` coincides with the wrong threshold `t`. It also uses mutually singular laws, so the randomization `η` is never reached.
- **Repair.** Give each listed definition three tests. For `npTest`, take `P = (δ₀+δ₁)/2`, `Q = (δ₀+3δ₁)/4` and `t = 2`.
  - The likelihood ratios are `1/2` at `0` and `3/2` at `1`, so `npTest = (η, 1)`.
  - The sum of errors of a test `T` is `2 − T(1)`, with minimum `1`.
  - The wrong threshold `t` gives the test `(0, 0)`, with sum of errors `2`.

## R06 (P3) — Locators: the Summary overclaims, 1.1 has none, and two listed references are never cited

- **Location.** `TauCetiRoadmap/MathematicalStatisticsFoundations/README.md:21-22` reads: "The material is the standard graduate content of Pfanzagl, Schervish, Brown and Ferguson … Each headline carries a locator in one of these texts." Also `:249-269` (1.1, a sampled target) and `:1173` ("`IsMoreInformative P Q` (Blackwell)").
- **Claim.**
  - Several headlines cite none of the four texts.
  - 1.1 states the transfer and integrability facts with no locator.
  - Blackwell (1953) and Sion (1958) are listed under References but cited at no claim.
- **Witness.**
  - Scheffé (7.4) cites only Seber–Lee, Strassen only Shaked–Shanthikumar, and the ranks (5.1) only Cox–Hinkley.
  - Slutsky, the delta method and the weak law cite only van der Vaart.
  - A scan of every subsection for a parenthesized locator finds none in 1.1 or in 8.1. The 8.1 items are adapters to named library declarations.
- **Repair.**
  - Change the sentence to "Each headline carries a locator in a text listed under References".
  - Add a theorem-and-page locator to the 1.1 facts.
  - Cite Blackwell (1953) at the definition of `IsMoreInformative`, and Sion (1958) at the Sion step of 7.2, or remove both from References.

## R07 (P3) — `Suggested.lean` drops part of the Karlin–Rubin headline and is not in README order

- **Location.**
  - `TauCetiRoadmap/MathematicalStatisticsFoundations/README.md:925-929` reads: "the threshold test of size `α` at `θ₀` is UMP … and its power function is nondecreasing". The Lean statement is at `Suggested.lean:490-497`.
  - In `Suggested.lean`, 3.8 (`:260`) comes before 3.4 (`:271`) and 3.7 (`:282`).
  - "Layer 4, continued" (`:800`) comes after Layer 8.
  - The section comments read `/-! ### Layer 1: … -/` (`:40`).
- **Claim.** The Lean conclusion is only `IsUniformlyMostPowerfulTest …`; the README's generality is wider. The form requires `/-! ## Layer k: <title> -/` comments in README order.
- **Witness.** `#check @isUniformlyMostPowerfulTest_of_monotone_likelihood_ratio` elaborates to a conclusion with no monotonicity conjunct.
- **Repair.**
  - Add `∧ Monotone (testPower P (thresholdTest T c γ))` to the conclusion, or make the monotonicity its own README target.
  - Reorder the file: 3.4, 3.7 and 3.8 in that order, and the U-statistic theorem inside Layer 4.
  - Use `##` for the layer comments.
- **Tested.** For `N(θ,1)` with `c = 1.645`, the powers at θ = −1, 0 and 1 are 0.0041, 0.05 and 0.2595, which is nondecreasing as the added conjunct says.

## R08 (P3) — Dependency lines disagree with the *Needs:* lines, and 3.5's analytic inverse is uncited

- **Location.** `TauCetiRoadmap/MathematicalStatisticsFoundations/README.md:810-812` (Layer 4: "Layers 1–3."), `:1227-1229` (Layer 7: "Layers 1–6 (1.5, 2.2, 5.2, 6.2)") and `:587` (3.5: "*Needs:* 3.3; Mathlib `HasStrictFDerivAt.toOpenPartialHomeomorph`, `AnalyticOnNhd`").
- **Claim.**
  - No *Needs:* line in 4.1–4.5 names a Layer 3 item, so Layer 4 waits on Layer 3 for nothing.
  - No 7.x *Needs:* line names 6.2.
  - The 3.5 route needs the analytic inverse function theorem, but its *Needs:* line cites only the C¹ local homeomorphism.
- **Witness.**
  - The 4.x *Needs:* lines read: "Layer 1"; "2.1, 2.4, 4.1"; "1.1"; Tau Ceti; "1.1".
  - The analytic step is Mathlib `OpenPartialHomeomorph.analyticAt_symm` (`Mathlib/Analysis/Calculus/FDeriv/Analytic.lean:431`), or Tau Ceti `HasStrictFDerivAt.analyticAt_localInverse` (`TauCeti/Analysis/Analytic/Inverse.lean:91`).
- **Repair.**
  - Layer 4: "Layers 1–2 and Tau Ceti's Gaussian density".
  - Layer 7: drop 6.2, or name the target that uses it.
  - Add one of the two analytic-inverse declarations to 3.5's *Needs:* line and to the supplier contracts.

## R09 (P3) — The pull-request description miscounts the admitted targets

- **Location.** The description reads: "drafted the README and `Suggested.lean`, which compiles against the pinned Mathlib and Tau Ceti and states every headline of Layers 1–8; its 54 targets are admitted."
- **Claim.** The head has 53 admitted theorems.
- **Witness.** `Suggested.lean` has 53 `theorem` declarations. `lake env lean` on it reports 53 `declaration uses 'sorry'` warnings.
- **Repair.** Change "54 targets" to "53 targets".

## Verified sound

### Repair of the previous review's findings (at 949d9fd)

| Previous finding | Status at ddd39dd | Evidence |
|---|---|---|
| R01 6.4: the prior was not restricted to the null set | repaired | `README.md:940-954` ("a prior `Λ` carried by the null set, `Λ H₀ᶜ = 0`"). `Suggested.lean:515-536` has `hH₀`, `hΛ`, and restricts `Λ'`. The old witness `Λ = δ₁` is now excluded. |
| R02 3.5: `N ≠ ∅` was missing | repaired | `README.md:573` reads "a **nonempty** open natural parameter space". |
| R03 missing headlines and stand-ins | repaired | All 38 bold headlines are declared; the table at the end checks them. `sq_deriv_div_…` now uses `fisherInformation` (but see R03 on its name), and Scheffé uses the Gaussian model. |
| R04 Scheffé was underdetermined | repaired | `README.md:1150-1166` and `Suggested.lean:687-696` give `q < n`, `r ≥ 1`, `σ > 0`, `α ∈ (0,1)`, `F_{r,n−q}` and `√(r f) s ‖u‖`. |
| R05 information matrix PSD | repaired | `README.md:731-736` assumes "`MemLp (s i) 2 P` for every `i`". |
| R06 5.2 at `v = 0` | repaired | `README.md:839` reads "For `v > 0`"; the Lean statement has `hv : 0 < v`. |
| R07 gate `readme-ids-missing` | repaired | The gate passes with `readme-ids-missing=0`. |
| R08 no locators | partly repaired | Locators now accompany nearly every target; see R06. |
| R09 no Checks | partly repaired | Most definitions now have Checks, but see R04 and R05. |
| R10 *Needs:* lines and build order | repaired, except two layer lines | Every subsection has a *Needs:* line. `uStatistic` moved to 2.4. The StandardDistributions, MarkovChainsAndRenewal and Exchangeability contracts were added. See R08 for the two layer lines. |
| R11 8.2 generality | repaired | `Suggested.lean:736-739` is over a finite-dimensional normed space (but see R02). |
| R12 namespace | repaired | The file uses `namespace TauCetiRoadmap.MathematicalStatisticsFoundations`. |
| R13 padding | repaired, except one definition | The 14 unused definitions and the vocabulary theorems are gone, and Layer 9 has no Lean. `HasConfidenceCoverage` remains unused (R03). |
| R14 duplication | repaired | The design is `uniformOn` (`README.md:1514-1516`), the README cites `memLp_two_of_variance_ne_zero`, and the CLT is not a target (`README.md:1305-1307`). |
| R15 vocabulary | repaired | `IsMinimalSplitStatistic` is gone (6.7 uses the pair statistic). The interval weight is defined (`README.md:962-967`). The two non-existent helper names are gone. |

### Gate, dependencies and build

- **Gate rerun at ddd39dd:** `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate on this head reported `build=0`.
- **Dependency check:** `depcheck: 234 roadmaps, 2263 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. All three suppliers (StandardDistributions, MarkovChainsAndRenewal, Completed/Exchangeability) are on main.
- **Other files:** `git diff --stat origin/main...HEAD` outside the roadmap folder is empty. `metadata.toml` is `topic = "math.ST"`.
- **Elaboration:** `lake env lean Suggested.lean` gives 53 `sorry` warnings, one per theorem, and nothing else.
- **`#check @name` pass:** I ran one scratch file with a `#check @name` for every declaration.
  - 90 of 94 own declarations printed. The four `NeymanPearson.*` names failed only because the probe used unqualified names; they elaborate in the file itself.
  - Each signature was compared with its README statement.
  - The two binders the signature scan flagged (`[MeasurableSpace X]` on `thresholdTest` and `likelihoodScore`) are not needed by those definitions.
  - The Layer 3 theorems keep `[FiniteDimensional ℝ E] [BorelSpace E]`, and 3.5–3.6 keep `[SigmaFinite ν]`.
- **One-tactic probe:** I replaced `sorry` with `by exact?` on a scratch copy for 12 theorems. These were the 3.2 determinacy theorem, the Lehmann–Scheffé uniqueness theorem, the generalized Neyman–Pearson lemma, `most_powerful_of_mixture_null`, the Neyman structure theorem, the two 7.1 theorems, the 8.2 tightness theorem, `O_P(1)·o_P(1)`, Slutsky, the weak law and the contiguity theorem. Ten reported "could not close the goal", and two (3.2 and the weak law) hit the heartbeat limit. None of the 53 theorems restates a definition or computes a value.

### Library declarations opened at the pins (54)

**Tau Ceti (27).**
- Distributions:
  - `chiSquaredMeasure` (`Probability/Distributions/ChiSquared/Basic.lean:209`; `δ₀` at `k = 0`, `0` for `k < 0`) and `isProbabilityMeasure_chiSquaredMeasure` (`:229`, needs `0 ≤ k`, as 8.1 says);
  - `studentTMeasure` (`StudentT/Basic.lean:182`) and `fisherSnedecorMeasure` (`FisherSnedecor/Basic.lean:98`), both with real parameters;
  - `HasLaw.norm_sq_orthogonalProjectionOnto_stdGaussian` and `HasLaw.iIndepFun_orthogonalProjectionOnto_stdGaussian` (`Gaussian/Projection.lean:132,147`);
  - `hasLaw_studentT_of_gaussian_chiSquared` (`StudentT/ChiSquared.lean:174`);
  - `multivariateGaussianPDFReal` and `multivariateGaussian_eq_withDensity` (`Gaussian/Density.lean:82,265`; the latter needs `S.PosDef`);
  - `cdf_betaMeasure_eq` (`Beta/Cdf.lean:136`).
- Quantiles: `Measure.quantile` (`Probability/Quantile.lean:164`, the left quantile `sInf {x | t ≤ cdf μ x}`), `monotoneOn_quantile` (`:317`), `measurePreserving_quantile` (`:880`) and `cdf_map_eq_volume_restrict` (`:934`).
- Order statistics: `orderStatistic` (`Data/Fin/Tuple/OrderStatistic.lean:53`), `orderStatistic_comp_perm` (`:81`) and `map_orderStatistics_pi` (`OrderStatistic/Joint.lean:46`).
- Empirical measures:
  - `empiricalFiniteMeasure` (`Process/EmpiricalMeasure.lean:58`, a `FiniteMeasure`) and its probability instance (`:100`, which needs a nonempty index);
  - `empiricalFiniteMeasure_comp_equiv` (`:130`), `map_empiricalFiniteMeasure` (`:159`), `integral_empiricalFiniteMeasure` (`:169`) and `empiricalMeasure` (`:354`).
- Finite populations: `sampleWithoutReplacement` (`PopulationSampling/Finite.lean:76`) and its instance (`:89`, which needs an embedding `ι ↪ κ`).
- Total variation: the `etvDist` lemmas (`MeasureTheory/Measure/TotalVariation.lean:65,74,94`).
- Measure theory and analysis:
  - `pi_withDensity` (`PiWithDensity.lean:81`) and `integrableOn_norm_rpow_ball` (`Integral/NormRpow.lean:69`);
  - `Measure.ext_of_mgf` (`Probability/Moments/Determinacy.lean:153`; one-dimensional, so 3.2 is new);
  - `HasStrictFDerivAt.analyticAt_localInverse` (`Analysis/Analytic/Inverse.lean:91`);
  - the Chebyshev weak law in `Probability/Moments/Pi.lean` (finite variance only, so 8.5 is new).

**Mathlib (27).**
- Tilting and cumulants (R01): `Measure.tilted` and its API (`MeasureTheory/Measure/Tilted.lean:42,125,250,279,282`), `integrableExpSet` and `convex_integrableExpSet` (`Probability/Moments/IntegrableExpMul.lean:112,119`), `cgf` (`Basic.lean:126`), `analyticOnNhd_cgf` (`MGFAnalytic.lean:177`), `integral_tilted_mul_self` and `variance_tilted_mul` (`Probability/Moments/Tilted.lean:132,159`), and `covarianceBilin_apply_eq_cov` (`CovarianceBilin.lean:83`).
- Convergence:
  - `isTightMeasureSet_range_iff_tendsto_limsup_measure_norm_gt` (`MeasureTheory/Measure/TightNormed.lean:121`, R02);
  - `tendstoInDistribution_of_tendstoInMeasure_sub` (`ConvergenceInDistribution.lean:192`). It needs `SecondCountableTopology` (`:188`), as `README.md:1286-1287` says, so 8.4 is new;
  - `TendstoInDistribution.prodMk_of_tendstoInMeasure_const` (`:309`).
- Decision theory: `IsBayesEstimator` (`Probability/Decision/BayesEstimator.lean:103`, `avgRisk = bayesRisk` over Markov kernels, which matches the equivalence claimed in 7.1), `avgRisk` and `bayesRisk` (`Risk/Defs.lean:47,54`), and `bayesRisk_le_bayesRisk_comp` (`Risk/Basic.lean:239`).
- Minimax and convexity: `Sion.minimax'` and `Sion.exists_isSaddlePointOn` (`Topology/Sion.lean:451,545`), `WeakDual.isCompact_polar` (`Analysis/Normed/Module/WeakDual.lean:314`), and `geometric_hahn_banach_open_point` and `geometric_hahn_banach_point_closed` (`Analysis/LocallyConvex/Separation.lean:124,223`).
- Markov kernels and sparsity: `Kernel.IsReversible` and `IsReversible.invariant` (`Probability/Kernel/Invariance.lean:58,63`), `Kernel.ofFunOfCountable` (`Kernel/Basic.lean:237`), and `hammingNorm` and `hammingDist_triangle` (`InformationTheory/Hamming.lean:138,59`).
- Analysis:
  - `integral_mul_fderiv_eq_neg_fderiv_mul_of_integrable` (`LineDeriv/IntegrationByParts.lean:226`);
  - `HasStrictFDerivAt.toOpenPartialHomeomorph` (`InverseFunctionTheorem/FDeriv.lean:118`) and `OpenPartialHomeomorph.analyticAt_symm` (`FDeriv/Analytic.lean:431`);
  - `lintegral_liminf_le` (`Lebesgue/Add.lean:237`) and `integral_withDensity_eq_integral_toReal_smul` (`Bochner/ContinuousLinearMap.lean:318`);
  - `ConvexOn.map_integral_le` (`Analysis/Convex/Integral.lean:196`) and `Integrable.bdd_mul` (`L1Space/Integrable.lean:1056`).
- Probability and measures:
  - `strong_law_ae` (`Probability/StrongLaw.lean:787`, pairwise independence) and `Measure.ext_of_charFun` (`CharacteristicFunction/Basic.lean:257`);
  - `memLp_two_of_variance_ne_zero` (`Moments/Variance.lean:138`) and `isProbabilityMeasure_uniformOn` (`UniformOn.lean:113`);
  - `Measure.support` (`MeasureTheory/Measure/Support.lean:59`).
- Matrices: `Matrix.inv_smul` and `Matrix.inv_smul'` (`NonsingularInverse.lean:518,521`). Both need `IsUnit A.det`, so the singular case in 9.5 is new.

Every other Mathlib name in the supplier contracts also resolves. The `roadmaps resolve` lead list contains three names: the two 7.1 names are declared in `Suggested.lean`, and `TauCeti.NeymanPearson` is the implementation namespace.

### Cross-roadmap citations resolved (5, all on main)

- StandardDistributions:
  - §4.6 (`README.md:527`); its line 543 excludes general joint order-statistic densities, as Layer 5 says;
  - §7.2 (`:995`);
  - §7.8 (`:1117`), the tilting overlap of R01.
- MarkovChainsAndRenewal Layer 3 (`README.md:234`), with `Kernel.IsReversible` and `Kernel.Invariant` at `:97` and `:236`.
- Completed/Exchangeability Layer 8 (`README.md:931`), with `sampleWithoutReplacement` and `sampleWithReplacement` at `:946` and `:981`.

### Ownership and overlap

- No open pull request changes this roadmap, and none drops an id it cites (`overlaps.md`, rechecked).
- `roadmaps grep` over main and all 447 open heads, by object, found no second owner. Terms searched: Kaplan–Meier/Nelson–Aalen, Benjamini–Hochberg, Metropolis, leapfrog, Latin squares, restricted isometry, kernel density estimators, sufficient statistics, Neyman–Pearson, exponential families, Fisher information, contiguity, Slutsky, the delta method, boundedness in probability, U-statistics, James–Stein, Strassen and convex order, garbling and Blackwell, Rao–Blackwell, Halmos–Savage, Basu and Huber.
  - The ProbabilisticAndMetricNumberTheory open head says, at its `README.md:1497`, "No new Slutsky theorem is planned".
  - StochasticCalculus uses finite-dimensional Slutsky steps inside Donsker.
  - OperatorAlgebraDynamics and OperatorTheory/Majorization treat the convex order for states and for tuples, not Strassen's theorem for measures.
  - Completed/OrthogonalL2Bases owns one-dimensional moment determinacy only (B1, `README.md:250`).
- Mathlib pull request #39791 was read. It is open, and its maintainer label is dated 2026-05-24, inside the six-month window. It declares `ProbabilityTheory.NeymanPearson.npLikelihoodRatio`, `npTest`, `npSumError` and `neyman_pearson`, which are the names 6.2 adopts.

### Notes that need no change

These hypotheses are unused by the truth of their statements:
- `hK` and `hKi` in Blyth's method (the argument works on any metric parameter set);
- `hd` in 4.3 (`log ∘ f` and `f` are differentiable together when `f > 0`);
- `[Nonempty X]` in 2.2 (it is implied by `[Nonempty Θ]` and the probability instances);
- `[SigmaFinite ν]` in 3.7 (a nonempty `N` already makes `ν` σ-finite).

### Adversarial table

| Statement | Instances | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| 1.1 `HasDensity` transfer (sample) | Unif[0,1], `f = 1_{[0,1]}`; `g = x`; `g = 1/x` | `1/2` / `1/2`; junk `0` / junk `0` | holds without integrability | locator R06 |
| 1.2 Halmos–Savage | `P n = δₙ` on ℕ, `θs = id`; `f ≡ 1` (infinite law) | mass of `{n}` is `2^{-(n+1)} > 0`; null sets match | holds for any densities; `Nonempty Θ` needed (present) | none |
| 1.3 tests (sample) | `thresholdTest id 0 (1/2)` at −1, 0, 1; `1{x>1.645}` under `N(θ,1)` | 0, 1/2, 1; power 0.0500 at 0, 0.2595 at 1 | as stated | Checks R05 |
| 1.3 `HasTestLevel`, `IsUniformlyMostPowerfulTest` | `H₀ = ∅`, `α = −1`; constant 0.05 vs Neyman–Pearson | every test qualifies; 0.05 < 0.2595 | as stated | none |
| 1.4 coverage | `C x = [x ± 1.96]`, `N(θ,1)` | 0.95000 ≥ 0.95, < 0.99 | holds | definition unused, R03 |
| 1.5 risk | squared error; `κ x = δₓ`, `δ₀`, `N(0,1)` | 1; θ²; 1 + θ² | as stated | none |
| 2.2 factorization (sample) | `Bern(p)²`, counting `μ` | `f_p = p^s(1−p)^{2−s} = g_p(s)·1` on all four points | holds; ⇐ uses standard Borel `X` (present) | none |
| 2.2 minimal sufficiency of the likelihood ratio (sample) | Θ = {0,1}, `N(0,1)`, `N(1,1)`, θ₀ = 0 | statistic `(1, e^{x−1/2})`, injective in `x` | holds | none |
| 2.3 Basu | `N(θ,1)²`, `T = x₁+x₂`, `A = x₁−x₂` | Cov = 1 − 1 = 0, jointly Gaussian | independent | none |
| 2.4 symmetric completeness (sample) | all laws on {0,1}, `n = 2`; `C = {N(θ,1)}` | `g₀₀(1−p)² + 2g₀₁p(1−p) + g₁₁p² ≡ 0 ⇒ g = 0`; `(x₁−x₂)² − 2` has mean 0 | holds; closure under mixtures needed (present) | none |
| 2.4 `uStatistic` | `m=2`, `n=3`, `h=(a−b)²/2`, `x=(0,1,2)`; `m=3`, `n=2` | 6 injections, sum 6, value 1 (divisor 2); 0 | as stated | none |
| 3.1 law vs `Measure.tilted` | `δ₀+δ₁`; Lebesgue, `η = 0` | Bern(e^η/(1+e^η)) both; Lebesgue / `0` | parallel definition | R01 |
| 3.2 Laplace determinacy (sample) | `δ₀+δ₁` vs `2δ_{1/2}`; `μ₁ = 0` | u=0: 2 / 2, u=1: 3.718 / 3.297; u=0 forces `μ₂(E)=0` | holds; integrability needed for `μ₁` only | none |
| 3.3 `logPartition` (sample) | `ν = δ₀+δ₁` | `A = log(1+e^η)`, A′(0) = 1/2 = mean, A″(0) = 1/4 = variance | holds | scalar case in Mathlib, R01 |
| 3.4 completeness (sample) | `ν = δ₀+δ₁+δ₂`, U = (−1,1) | `g₀+g₁e^η+g₂e^{2η} = 0` on U ⇒ g = 0 | holds | none |
| 3.5 mean parametrization | Bernoulli; Lebesgue; `ν = cδ₀` in dimension 0 | logistic onto (0,1), inverse logit; `N = ∅` excluded by `hNne`; `N = {0}` = interior | holds | *Needs:* R08 |
| 3.6 MLE iff interior | Bernoulli `t = 0`, `t = 1/2`; `x⁻³1_{x≥1}dx`, `t = 3`, `t = 1` | no max & 0 ∉ (0,1); max at 0; `N = (−∞,0]`, max at 0, `3 ∈ (1,∞)`; no max & `1 ∉ (1,∞)` | iff holds without steepness | none |
| 3.7 conditional families | `κ s = δ₀+δ₁`; `κ s = 0` | Bern(e^η/(1+e^η)); `0` | holds (κ from one disintegration at p₀) | none |
| 3.8 Pitman–Koopman–Darmois | `N(θ,1)`, θ ≥ 0, `P₀ = N(0,1)` | density `e^{θΣx−nθ²/2}` nondecreasing in `Σx`; `T = x`, `C = e^{−θ²/2}`, `a = θ` | consistent | none |
| 4.1 covariance criterion | `Bern(p)`, `W = x` | unbiased `U` of 0 has `U(0)(1−p)+U(1)p ≡ 0`, so `U = 0`, cov 0 | W is UMVU | none |
| 4.1 UMVU Check | density `2(1+x)^{-3}`, `W ≡ 0`, `g ≡ 0` | `W ∈ L²` under every law; variance 0 | Check false | R04 |
| 4.2 Rao–Blackwell, Lehmann–Scheffé | `Bern(p)²`, `δ = x₁`, `r = T/2` | variance p(1−p) / p(1−p)/2 | holds | none |
| 4.2 U-statistics are UMVU | laws on {0,1}, `m=2`, `h=(a−b)²/2`, `n=3` | unbiased for p(1−p); unique symmetric | holds | none |
| 4.3 information inequality (sample) | `N(θ,1)`, `W=x`; `Exp(θ)`, `W=x` | 1 ≤ 1·1; 1/θ⁴ ≤ (1/θ²)(1/θ²) | equality in both | name R03, Check R04 |
| 4.4 Stein, James–Stein | p=1, `g=id`, v=2; p=3, θ=0; p=2 | 2 = 2·1; risk 3 − 1·1 = 2 < 3; `E‖X‖⁻² = ∞` | holds; `p ≥ 3` needed (present) | none |
| 4.5 Pitman (sample) | U[−1/2,1/2], `x=(0,0.9,0.1)`; n=3 risks; n=0 | 0.45 vs mean 1/3; midrange 1/40 ≤ mean 1/36; no equivariant δ | holds; n=0 vacuous | none |
| 5.1 ranks | n=2 uniform; `P = δ₀` | `P(x₁<x₂, OS ∈ B) = ½P(OS ∈ B)`; sort is id with probability 1 ≠ 1/2 | atomless hypothesis needed (present) | none |
| 5.2 Gaussian sample | n=2, m=0, v=1 | `SS = (x₁−x₂)²/2 ~ χ²₁`; t-statistic `(x₁+x₂)/|x₁−x₂| ~ t₁` | holds | none |
| 6.2 constrained and necessity (sample) | `N(0,1)` vs `N(1,1)`, α=0.05; `δ₀` vs `δ₁` | k = e^{1.145} ≈ 3.14, power 0.2595; k=0, power 1, size α via γ=α | holds; "size α unless power 1" holds at k=0 | none |
| 6.2 sum of errors (sample) | `δ₀`,`δ₁`, t=1; `(δ₀+δ₁)/2`, `(δ₀+3δ₁)/4`, t=2 | npTest (0,1), error 0; ratios (1/2, 3/2), npTest (η,1), error 2−T(1), minimum 1 | holds; t vs t⁻¹ unpinned by Checks | R05 |
| 6.2 generalized (sample) | m = 0 | `φ = 1{f₀>0}` maximizes ∫ψf₀ | holds | none |
| 6.3 Karlin–Rubin | `N(θ,1)`, c = 1.645 | power 0.0041, 0.05, 0.2595 at −1, 0, 1 | UMP holds; monotonicity not in Lean | R07 |
| 6.3 essential completeness | ψ = `1{|x|>1.96}`, θ₀ = 0, matched c = 1.645 | θ=1: 0.2595 ≥ 0.1700; θ=−1: 0.0041 ≤ 0.1700 | holds (equal size at θ₀ covers `L θ₀` of either sign) | none |
| 6.4 least favorable | Λ = δ₀, H₀ = {0}; old Λ = δ₁ | reduces to Neyman–Pearson; `Λ H₀ᶜ = 1 ≠ 0` | holds; old counterexample excluded | none |
| 6.5 UMP interval test | T two-valued; μ = (δ₀+δ₁)/2, (1/4,3/4) | constant α; interval weights 1/2, 1/2 | holds | none |
| 6.6 UMPU, Neyman structure | `N(θ,1)`, c = ±1.96; `Bern(p)²` | size 0.05, `E[Tφ] = 0 = α·0`; `E[φ|T=1] = α` | holds | none |
| 6.7 conditional UMPU | `X ~ Poi(λ₁)`, `Y ~ Poi(λ₂)`, `S = X+Y` | X given S=s is Bin(s, λ₁/(λ₁+λ₂)), depends on η = log(λ₁/λ₂) only | holds | none |
| 6.8 invariance (sample) | scale group; (2,1),(4,2),(3,1); `f = x/s + 1`, `f = x` | M = 2 = 2, 2 ≠ 3; `q(r) = r+1`; not invariant | iff holds | none |
| 7.1 criteria (sample) | risk vectors (1,2), (1.1,1.1), (2,2) | admissible: first two; Bayes at (½,½): 1.5, 1.1, 2; maxima 2, 1.1, 2 | as stated | Checks R05 |
| 7.1 Bayes ⇒ minimax; unique Bayes ⇒ admissible (sample) | prior 2δ₀; ℕ with `π{n}=2^{−(n+1)}`, risks 0, −2^{n+1} | Bayes 2 < 2.2 but max 2 > 1.1; Σ −1 = −∞ (not integrable) | probability prior and integrability needed (present) | none |
| 7.2 finite game, complete class | matching pennies; C = {x+y ≥ 1, x,y ≥ 0}, x = (2,2) | value 1/2 at uniform δ, π; y = w = (½,½), w·y = ½ ≤ w·z | holds; d = 0 excluded | none |
| 7.3 averaging, Blyth | Θ=X=A={±1}, κ ≡ δ₁, 0–1 loss; `N(θ,1)`, πₙ = √n·N(0,n) | risks (0,1) → (½,½); excess √n/(n+1) → 0 | holds | none |
| 7.4 Scheffé (sample) | n=2, q=r=1, L=S=span(1,1) | event `2|ȳ−m|/|y₁−y₂| ≤ √f`; ratio ~ t₁, t₁² ~ F₁,₁; coverage 1−α | holds | name R03 |
| 7.5 Strassen, Blackwell | σ=δ_{1/2}, τ=(δ₀+δ₁)/2; `N(θ,1)` vs `1{x>0}`; Θ=∅, Y=∅, X=ℝ, n=0 | D(½)=τ, barycentre ½; garbling by indicator; no Markov kernel ℝ → Fin 0 | theorems hold (`Nonempty Y` present); Check false | R04 |
| 8.2 boundedness iff tight | `n e₁` in ℝ²; `n·1_{[0,1/n]}` | `μ{C<n}=1` eventually, not tight; `μ{C<X n} = 1/n` | holds; Mathlib lemma | R02 |
| 8.3 `O_P(1)·o_P(1)` | U = n·1_{[0,1/n]}, V = 1/n | `UV = 1_{[0,1/n]}`, `μ{ε ≤ UV} = 1/n → 0` | holds | none |
| 8.4 Slutsky, delta method | `Yₙ = Z + 1/n`; g = x², θ = μ | `Yₙ − Xₙ = 1/n → 0`; DZ ~ N(0, 4μ²σ²) | holds without separability (bounded-Lipschitz test functions) | none |
| 8.5 weak law | s ≡ 1; Cauchy, s = id | → 1; not integrable, excluded | holds | none |
| 8.6 contiguity (sample) | `Pᵢ` Unif[0,1], `Qᵢ` density `i·1_{[0,1/i]}`; P = Q | `Qᵢ{L>C} = 1` for i > C, `Aᵢ=[0,1/i]`: 1/i → 0 vs 1; `Q{L>1} = 0` | uniform integrability needed; holds when given | none |
| 9.3 objects (sample) | KDE `1_{[−½,½]}`, h=1, sample (0,2); sparse error of (3,−1,2); Benjamini–Hochberg | ½ at 0, 0 at 1; 3, 6, 0 for s = 1, 0, 3; counts 2 (set 2) and 0 (set 2) | as stated; locators present | none |

## Not verifiable

None of the sampled locators could be read. That covers 1.3, 2.2, 2.4, 3.2, 3.3, 3.4, 4.3, 4.5, 6.2, 6.8, 7.1, 7.4, 8.6 and 9.3; 1.1 has no locator (R06). For each, the theorem number, page, hypotheses and support for the statement remain unchecked. The sources service was used with a scratch manifest; the package manifest was not edited. The operator's local sources directory holds no statistics text.

- **Pfanzagl 1994.** The de Gruyter landing page is on a host in no licence class. I found no sign of open access and fetched nothing past it.
- **Schervish 1995, Tsybakov 2009, Foucart–Rauhut 2013.** Springer paywall; the service recorded each as `uncertified`.
- **Brown 1986.** The Project Euclid landing page (doi 10.1214/lnms/1215466757) has no PDF link.
- **Ferguson 1967.** The DOI landing page returns HTTP 403.
- **Seber–Lee 2003.** Wiley returns HTTP 403.
- **van der Vaart 1998.** Crossref was rate-limited. The book is published by Cambridge University Press and is not open.
- **Casella–Berger, Berger, Cox–Hinkley, Dickhaus.** Commercial books, not fetched. The Casella–Berger page numbers refer to the 2024 CRC reissue and could not be compared.
- **Mathlib pull request #39791.** Its page shows the declaration names but no Lean signatures, so the hypotheses of `neyman_pearson` (finite measures, `t > 0`) could not be compared with 6.2.

## Source issues

- none
