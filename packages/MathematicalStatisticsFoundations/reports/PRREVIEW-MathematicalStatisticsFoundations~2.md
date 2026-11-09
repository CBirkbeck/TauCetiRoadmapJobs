# Review of MathematicalStatisticsFoundations (pull request #2111 at 949d9fd)

**Verdict:** needs changes

Fifteen findings: six P2 and nine P3. The push gate fails (`readme-ids-missing=50`, R07), so the roadmap cannot be accepted until that is fixed. The Lean file elaborates cleanly, with 54 `sorry` warnings and nothing else. The dependency check is clean.

## R01 (P2) — 6.4 least favorable mixtures: the prior is not restricted to the null set

- **Location:** `TauCetiRoadmap/MathematicalStatisticsFoundations/README.md:671-678`. The text reads: "for a Markov kernel `P : Kernel Θ X` and a prior `Λ`, let `φ` have level `α` at every null parameter and be most powerful … for the simple null `P ∘ₘ Λ` … Then `φ` is most powerful … for the composite null."
- **Claim:** As written, this is false. The argument needs `∫ testPower ψ dΛ ≤ α` for every composite-level-`α` test `ψ`, and that holds only when `Λ` lives on `H₀`. The same applies to the competing priors `Λ'` in the concentration bullet.
- **Witness:** Take `Θ = {0,1}`, `H₀ = {0}`, `P θ = N(θ,1)`, `Q = P 1` and `Λ = δ₁`. The test `φ ≡ 0.05` has level 0.05 at θ = 0 and is most powerful for `P₁` against `P₁`. It is not most powerful for `P₀` against `P₁`: its power is 0.05, while the Neyman–Pearson test has power 0.259.
- **Repair:** Assume a measurable `H₀` and `Λ (H₀ᶜ) = 0`. Require the same of every `Λ'` in the least-favorable clause. Tested on the witness: `δ₁` is now excluded. With `Λ = δ₀`, the constant test is no longer most powerful for `P₀` against `P₁`, so the hypothesis fails and the conclusion is never reached.

## R02 (P2) — 3.5 mean parametrization: false when the natural parameter space is empty

- **Location:** `README.md:416-425`. The hypotheses are "a nonzero σ-finite `ν` …, a minimal family, and an open natural parameter space `N`". The conclusion is "`M` is a bijection of `N` onto `interior (convexHull ℝ ν.support)`".
- **Claim:** The README omits `N ≠ ∅`. `Suggested.lean:254` carries it (`hNne`), so the README is wider than the Lean statement, and false.
- **Witness:** Take `ν` = Lebesgue measure on ℝ. Then `exp(η x)` is never integrable, so `N = ∅`, which is open. `ν` is σ-finite, nonzero and minimal, and `interior (convexHull ν.support) = ℝ`. There is no bijection from `∅` onto `ℝ`.
- **Repair:** Add "nonempty" to the standing hypotheses of 3.5, as in the Lean statement. Tested: Lebesgue measure is now excluded, and Bernoulli (`N = ℝ`, mean map the logistic function onto `(0,1)`) still satisfies the theorem.

## R03 (P2) — `Suggested.lean` leaves out headline theorems it can state, and uses two stand-ins

- **Location:** `Suggested.lean:12-24`, the module docstring: "states a selection of the targets … at least one per layer". Also `Suggested.lean:346-350` and `:526-529`.
- **Claim:** The file is written as a per-layer selection, not as the roadmap's acceptance test, and its docstring names no headline as unstatable. These bold README headlines are statable at the pins but absent:
  - Neyman–Pearson necessity (6.2) and essential completeness (6.3);
  - least favorable sufficiency and concentration (6.4);
  - the two-sided UMPU test (6.6) and the conditional UMPU tests (6.7);
  - conditional exponential families (3.7);
  - the regular-model information inequality (4.3), Stein's identity (4.4) and Pitman optimality (4.5);
  - the law of the ranks (5.1);
  - averaging over a finite group and Blyth's method (7.3);
  - Scheffé's simultaneous intervals (7.4) and Strassen's theorem (7.5);
  - the weak law (8.5).

  Two declarations stand in for headlines but are Cauchy–Schwarz on free variables:
  - `sq_div_information_le_variance` mentions neither `likelihoodScore` nor `fisherInformation`;
  - `scheffe_contrast_supremum` mentions no Gaussian model.
- **Witness:** `IsUniformlyMostPowerfulUnbiasedTest` (`:84`), `fisherInformation` (`:342`), `pitmanEstimator` (`:364`) and `IsContiguous` (`:610`) are defined, but no statement uses them. `fisherSnedecorMeasure` is in Tau Ceti (`TauCeti/Probability/Distributions/FisherSnedecor/Basic.lean:98`).
- **Repair:**
  - State each headline listed above.
  - Replace the two stand-ins with the headlines they stand for: the regular-model inequality on `fisherInformation`, and `hasConfidenceCoverage_scheffe` in the form of R04.
  - Rewrite the docstring in the house form: it states the headline theorems, and it names each headline that cannot be stated together with the carrier it lacks.

## R04 (P2) — 7.4 Scheffé's simultaneous intervals: the statement is underdetermined

- **Location:** `README.md:825-830`. The text reads: "the intervals for all contrasts `⟪u, μ⟫`, `u ∈ S ⊆ L`, built from the F quantile hold simultaneously with probability `1 - α`."
- **Claim:** The statement does not give the F degrees of freedom or the multiplier, and it omits the needed hypotheses `n > q`, `S` a subspace of dimension `r ≥ 1`, `σ > 0` and `α ∈ (0,1)`. A reader cannot tell which theorem is meant.
- **Witness:** With `n = q`, the residual space is `{0}` and `s² = 0/0`, so the stated coverage is meaningless. With `dim S = 0` there is no F law `F_{0, n−q}`.
- **Repair:** State it as follows. For `n > q`, a subspace `S ⊆ L` of dimension `r ≥ 1`, `σ > 0` and `α ∈ (0,1)`, put
  - `μ̂ = P_L Y`;
  - `s² = ‖P_{L⊥} Y‖² / (n − q)`;
  - `f` = the `(1 − α)`-quantile of `F_{r, n−q}`.

  Then `P(∀ u ∈ S, |⟪u, μ̂ − μ⟫| ≤ √(r f) · s · ‖u‖) = 1 − α`. Tested on `n = 2`, `L = S = span (1,1)`: the event is `|2(ȳ − m)/|y₁ − y₂|| ≤ √f`, which is the Student `t₁` test of 5.2. Its coverage is exactly `1 − α`.

## R05 (P2) — 4.3: positive semidefiniteness of `fisherInformationMatrix` needs square-integrable scores

- **Location:** `README.md:527-530`. The text reads: "`fisherInformationMatrix P s = (∫ sᵢ sⱼ dP)ᵢⱼ` for a vector score `s`, with `fisherInformationMatrix_posSemidef`".
- **Claim:** No hypothesis is stated. When a product `sᵢ sⱼ` is not integrable, its Bochner integral is the junk value 0, and the matrix need not be positive semidefinite.
- **Witness:** Take the README's own law, with density `2(1+x)⁻³` on `x ≥ 0` (mean 1, infinite second moment), and `s = (1, x)`. Then `M = [[1,1],[1,0]]`, and `u = (1,−1)` gives `uᵀMu = −1`.
- **Repair:** Assume `MemLp (s i) 2 P` for every `i`. Then `uᵀMu = ∫ (uᵀs)² dP ≥ 0`. Tested: the witness is excluded because `x ∉ L²`.

## R06 (P2) — 5.2 Gaussian samples: false at variance 0

- **Location:** `README.md:600-607`. The text reads: "the standardized coordinates of an i.i.d. `N(m, v)` sample form a standard Gaussian vector … `SS / v` has law `χ²_{n-1}`".
- **Claim:** The README omits `v > 0`, which `Suggested.lean:379` carries (`hv : 0 < v`).
- **Witness:** Mathlib's `gaussianReal m 0` is `dirac m`, which is a legal `N(m,0)`. Then `SS = 0` and `SS / v = 0/0 = 0`, whose law is `δ₀`, not `χ²_{n−1}` (a Gamma law for `n ≥ 2`).
- **Repair:** Add `v > 0` to 5.2 and to `hasLaw_standardize_pi_gaussianReal`. Tested: the Dirac case is excluded. At `n = 2`, `SS = (x₁−x₂)²/2` has law `χ²₁`.

## R07 (P3) — the push gate fails: 50 backticked README names are not in `Suggested.lean`

- **Location:** README API bullets. Examples: `:212` `HasDensity.integrable_iff`, `:224` `countableMixture_apply_eq_zero`, `:297` `isSufficientStatistic_iff_condExp` and `:1117` `IsWeaklyStationary.inner_eq_inner_sub_zero`.
- **Claim:** Rule `readme-ids-missing`: 50 hits. Forty-nine are this roadmap's own names. The fiftieth, `TauCeti.pi_withDensity`, is a genuine Tau Ceti declaration (`TauCeti/MeasureTheory/Measure/PiWithDensity.lean:81`) that the gate misreads because of R12.
- **Witness:** The rerun gate reports `readme-ids-missing=50 … FAIL`, with every other count 0.
- **Repair:** State each of the 49 facts in prose without the backticked name; do not add declarations. Changing the namespace (R12) clears `TauCeti.pi_withDensity`.

## R08 (P3) — the README has one locator in 1252 lines; none of the sampled targets has one

- **Location:** The whole README. The only locator is `:476`: "in the form of Lehmann–Casella, §1.6".
- **Claim:** No theorem carries a theorem number and page. The 15 sampled sections (1.2, 1.3, 2.1, 3.1, 3.6, 4.3, 5.2, 6.4, 6.5, 6.6, 7.2, 7.5, 8.4, 9.3, 9.4) cannot be checked against a source. The one existing locator is section-level, and the monotone, infinitely-many-sizes form stated in 3.8 is not the usual continuity form of Koopman–Pitman.
- **Witness:** Searching the README for `Thm`, `Theorem`, `p. N`, `§`, `Chapter` and `Prop.` finds only line 476.
- **Repair:**
  - Add `(Source, Thm/Prop number, page)` at each claim, in the edition listed under References: Lehmann–Romano 4th ed., Lehmann–Casella 2nd ed., Brown, Ferguson, Blackwell 1953, van der Vaart.
  - For 3.8, cite the theorem that states the monotone form.
  - Record the works in a sources manifest.

## R09 (P3) — no definition has a Checks list

- **Location:** The whole README; there are 0 occurrences of `**Checks.**`. Example: 1.3 at `:232-245`.
- **Claim:** About 75 definitions have no unit tests. The layer-level `### Examples` do not discriminate against wrong models.
- **Witness:** `tvDist` is used on the convention that it takes values in [0, 2], but no Check pins that. With the supremum normalization, the bound `|P A − Q A| ≤ tvDist/2` of 9.2 would be false: `P = δ₀`, `Q = δ₁`, `A = {0}` gives `1 ≤ 1/2`.
- **Repair:** Give every definition at least three discriminating Checks. Values from the table below can seed them:
  - `tvDist δ₀ δ₁ = 2`;
  - `thresholdTest id 0 (1/2)` takes the values `0, 1/2, 1` at `−1, 0, 1`;
  - `x₁` is not sufficient for `Bern(p)²`;
  - `x₁ − x₂` shows that the identity statistic is not complete;
  - `δ₀` is not a minimal family.

## R10 (P3) — dependencies: no `*Needs:*` lines, inaccurate layer dependencies, and Layer 4 needs Layer 9

- **Location:**
  - `README.md:1159`: "Layer 8 for the sequence forms; otherwise Mathlib only".
  - `:621`: the Layer 5 dependencies read "Layer 1".
  - `:580` and `:202-203`: the U-statistic target in Layer 4 uses 9.1.
- **Claim:**
  - There are 0 `*Needs:*` lines.
  - 9.1 and 9.2 consume Tau Ceti's `empiricalFiniteMeasure`, `Measure.quantile` and `etvDist_*`.
  - 5.x consumes Tau Ceti's `orderStatistic`, `map_orderStatistics_pi`, `chiSquaredMeasure` and `studentTMeasure`.
  - Layers are not in build order.
  - The supplier contracts have no `From TauCetiRoadmap.StandardDistributions` or `From TauCetiRoadmap.MarkovChainsAndRenewal` subsection, although the Scope section consumes both.
- **Witness:** `isMinimumVarianceUnbiasedEstimator_uStatistic` (4.2) takes `uStatistic` (9.1) as input. Layer 9 cites Tau Ceti at `README.md:976-982` and `:1004-1005`.
- **Repair:**
  - Add a `*Needs:*` line to each target.
  - Correct the Dependencies lines of Layers 3, 4, 5, 6 and 9.
  - Move `uStatistic` and its unbiasedness into 2.4, or renumber so that it precedes Layer 4.
  - Add the two supplier subsections.

## R11 (P3) — 8.2: the README states a wider class than the Lean signature

- **Location:** `README.md:899-901` reads: "for a finite-dimensional real normed space `E` with its Borel σ-algebra". `Suggested.lean:562-564` has `X : ℕ → Ω → ℝ`.
- **Claim:** The README's generality and the Lean signature's differ.
- **Witness:** The Lean statement cannot be applied to `E = ℝ²`, which the README covers.
- **Repair:** State the Lean over `[NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]`. Tested: the deterministic sequence `Xₙ = n·e₁` is still neither bounded in probability nor tight.

## R12 (P3) — `Suggested.lean` uses namespace `TauCeti`

- **Location:** `Suggested.lean:33`, `namespace TauCeti`.
- **Claim:** The form requires `namespace TauCetiRoadmap.MathematicalStatisticsFoundations`. Prototype names in `TauCeti` collide with the library's namespace, as the gate's misreading of `TauCeti.pi_withDensity` (R07) already shows.
- **Witness:** The gate lists `TauCeti.pi_withDensity` as a missing roadmap declaration, but it is declared at `TauCeti/MeasureTheory/Measure/PiWithDensity.lean:81`.
- **Repair:** Rename the namespace. The README's Conventions may keep `TauCeti` as the implementation namespace.

## R13 (P3) — padding in `Suggested.lean`

- **Location:**
  - `Suggested.lean:553-555`, the proved one-term instance `isProbabilityMeasure_chiSquaredMeasure_natCast`;
  - unused definitions at `:635`, `675`, `678`, `682`, `698`, `747`, `752`, `757`, `761`, `783`, `787`, `791`, `796` and `810`;
  - the theorems at `:48`, `106`, `121`, `222`, `372`, `467`, `602`, `644`, `650`, `656`, `669`, `693`, `720`, `737`, `742`, `777`, `838` and `844`.
- **Claim:**
  - The instance and 14 definitions (`sampleQuantile`, `huberScore`, `finiteKernelDensityEstimator`, `HasRestrictedIsometry`, `poissonMass`, `normalPosterior`, `matrixQuadraticForm`, `scatterMatrix`, `gaussianNegLogLikelihood`, `IsLatinSquare`, `OrthogonalLatinSquares`, `IsWeaklyStationary`, `IsIIDNoise` and `sampleAutocovariance`) feed no statement.
  - The listed theorems are elementary vocabulary identities or library adapters, not headlines. Examples: the Kaplan–Meier inequality, the Benjamini–Hochberg count, leapfrog reversibility, the CLT composed with `s`, and `map_orderStatistics_pi` rewritten with `pi_withDensity`.
- **Witness:** The instance is proved by the single term `isProbabilityMeasure_chiSquaredMeasure (Nat.cast_nonneg _)`. A grep of the file shows no statement uses the 14 definitions.
- **Repair:** Delete these declarations from `Suggested.lean`. The README keeps them as targets, naming them in prose (see R07). The definitions that R03's headlines need stay.

## R14 (P3) — objects that Mathlib or Tau Ceti already state

- **Location:** `README.md:1097-1102` and `Suggested.lean:766-767` (`simpleRandomSampleDesign`); `README.md:1126` (`memLp_id_two_of_variance_pos`); `README.md:937-939` (the CLT target).
- **Claim:**
  - `simpleRandomSampleDesign N n` is Mathlib's `uniformOn {s | s.card = n}` (`Mathlib/Probability/UniformOn.lean:60`, defined as `count[|s]`). Its probability instance is `isProbabilityMeasure_uniformOn` (`:113`).
  - Tau Ceti already owns sampling without replacement as `sampleWithoutReplacement` (`TauCeti/Probability/PopulationSampling/Finite.lean:76`; the Exchangeability roadmap, Layer 8, which FiniteSamplingDiscrepancy cites as owner at its `README.md:21-25`).
  - `memLp_id_two_of_variance_pos` is Mathlib's `memLp_two_of_variance_ne_zero` (`Mathlib/Probability/Moments/Variance.lean:138`).
  - The CLT target is Mathlib's `tendstoInDistribution_inv_sqrt_mul_sum_sub` (`CentralLimitTheorem.lean:122`) applied to `s ∘ Xᵢ`.
- **Witness:** `(Nat.choose N n)⁻¹ • count.restrict {s | s.card = n}` equals `count[|{s | s.card = n}]`, because the count of that set is `choose N n`.
- **Repair:**
  - Define the design as `uniformOn`, and cite `sampleWithoutReplacement` and the Exchangeability roadmap in Scope and the supplier contracts.
  - Delete `memLp_id_two_of_variance_pos` and cite Mathlib's lemma.
  - Keep the CLT only as a README adapter.

## R15 (P3) — vocabulary: a duplicate predicate, an undefined term, and two helper names that exist nowhere

- **Location:** `README.md:714` (`IsMinimalSplitStatistic`), against `:133` ("No separate split exponential family is defined"); `:684-686` ("an interval weight between `Q a ≤ Q b`"); `:437` and `:509`.
- **Claim:**
  - `IsMinimalSplitStatistic ν T S` is `IsMinimalExponentialFamily ν (fun x ↦ WithLp.toLp 2 (T x, S x))`.
  - "Interval weight" is never defined.
  - `exists_ne_zero_forall_inner_le_of_notMem_interior` and `exists_sub_mul_abs_le_of_convexOn` occur in neither the pinned Mathlib nor Tau Ceti, and are not targets.
- **Witness:** For `u = (a, b)`, `⟪u, (T, S)⟫ = aT + ⟪b, S⟫`, which is exactly the condition in `:714`. A grep of both pinned trees finds 0 hits for either helper name.
- **Repair:**
  - Use `IsMinimalExponentialFamily` of the pair statistic.
  - Define the interval weight: the `[0,1]`-valued function equal to 1 on `(Q a, Q b)`, with endpoint values fixed by the stated integral identity.
  - Make the two helpers targets of 3.6 and 4.2, or cite the pinned lemmas the routes use.

## Verified sound

**Gate and dependency check.**
- Gate rerun: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=50 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL`. The worker's gate on this head had `build=0`.
- Nothing outside the roadmap folder changes (`git diff --stat` empty).
- Dependency check: `depcheck: 236 roadmaps, 2262 edges, 0 problem(s)`. There is no UPWARD or CYCLE line. Both suppliers, StandardDistributions and MarkovChainsAndRenewal, are on main.

**Lean.**
- `lake env lean Suggested.lean` gives 54 `sorry` warnings and nothing else.
- All 136 `#check @name` lines elaborate.
- The three binders the signature scan flagged as dropped (`[MeasurableSpace X]` on `thresholdTest`, `confidenceSetOfTests` and `likelihoodScore`) are not needed by those definitions.
- One-tactic probe (`exact?` or `simp`) on a copy with the targets removed, over 10 declarations (`:48`, `106`, `222`, `467`, `502`, `526`, `644`, `650`, `737`, `844`): none closes.

**Library declarations opened at the pins (36).**
- Mathlib:
  - `tvDist`/`etvDist` (`MeasureTheory/Measure/TotalVariation/Defs.lean:53,62`), which is the variation of `μ − ν` and so takes values in [0, 2]; `tvDist_of_mutuallySingular` (`…/Basic.lean:42`);
  - `TendstoInDistribution` (`MeasureTheory/Function/ConvergenceInDistribution.lean:64`); `tendstoInDistribution_of_tendstoInMeasure_sub` (`:192`), which requires `SecondCountableTopology` at `:184`, as the README says;
  - `tendstoInDistribution_inv_sqrt_mul_sum_sub` (`Probability/CentralLimitTheorem.lean:122`);
  - `multivariateGaussian` (`Probability/Distributions/Gaussian/Multivariate.lean:166`; with `S = 1` it is `N(θ, I)`);
  - `IsBayesEstimator` (`Probability/Decision/BayesEstimator.lean:103`); `avgRisk`, `bayesRisk` and `minimaxRisk` (`Risk/Defs.lean:47,54,60`); `riskIncrease` (`Risk/RiskIncrease.lean:54`); `bayesRisk_le_bayesRisk_comp` (`Risk/Basic.lean:239`);
  - `Kernel.IsReversible` (`Probability/Kernel/Invariance.lean:58`); `Measure.support` (`MeasureTheory/Measure/Support.lean:59`); `Finset.instMeasurableSpace` (`MeasurableSpace/Constructions.lean:1050`, discrete on `Finset (Fin N)`);
  - `Matrix.inv_smul` (`LinearAlgebra/Matrix/NonsingularInverse.lean:518`, which needs `IsUnit A.det`, so the singular-case target of 9.5 is new);
  - `hasSum_one_poissonMeasure` (`Probability/Distributions/Poisson/Basic.lean:62`, for `r : ℝ≥0` only, so the real-θ `poissonMass` differs as the README says);
  - `uniformOn` and `memLp_two_of_variance_ne_zero` (R14).
- Tau Ceti:
  - `chiSquaredMeasure` (`Probability/Distributions/ChiSquared/Basic.lean:209`, Gamma(k/2, rate 1/2)) and its instance at `:229`, which needs `0 ≤ k`;
  - `studentTMeasure` (`StudentT/Basic.lean:182`) and `fisherSnedecorMeasure` (`FisherSnedecor/Basic.lean:98`);
  - `orderStatistic` (`Data/Fin/Tuple/OrderStatistic.lean:53`, zero-indexed) and `map_orderStatistics_pi` (`OrderStatistic/Joint.lean:46`);
  - `cdf_map_orderStatistic_pi_eq_regularizedIncompleteBeta` (`OrderStatistic/Basic.lean:76`) and `cdf_betaMeasure_eq` (`Beta/Cdf.lean:136`);
  - `Measure.quantile` (`Probability/Quantile.lean:164`, the left quantile, the same infimum as `sampleQuantile`); the lemmas at `:317,880,934`;
  - `empiricalFiniteMeasure` (`Process/EmpiricalMeasure.lean:58`, the zero measure for an empty family) and `empiricalMeasure` (`:354`, first `n+1` terms); lemmas at `:100,130,159,169`;
  - `etvDist_eq_two_mul_iSup_sub`, `etvDist_eq_iSup_sub_add_iSup_sub` and `etvDist_le_two_mul_iff` (`MeasureTheory/Measure/TotalVariation.lean:74,65,94`);
  - `pi_withDensity` (`PiWithDensity.lean:81`) and `Measure.ext_of_mgf` (`Probability/Moments/Determinacy.lean:153`, one-dimensional, so the multivariate 3.2 is new);
  - Gaussian projection laws (`Gaussian/Projection.lean:132,147`); `hasLaw_studentT_of_gaussian_chiSquared` (`StudentT/ChiSquared.lean:174`);
  - `multivariateGaussianPDFReal` and `multivariateGaussian_eq_withDensity` (`Gaussian/Density.lean:82,265`); `integrableOn_norm_rpow_ball` (`MeasureTheory/Integral/NormRpow.lean:69`).
- All 30 Tau Ceti names and all Mathlib names in the supplier contracts resolve. The only unresolved names are the two helpers of R15.

**Cross-roadmap citations resolved (3).**
- StandardDistributions §4.6 on main (`README.md:527`; line 543 excludes general joint order-statistic densities, as claimed) and its scope line 15 ("Outside scope: statistical inference"). Both are unchanged at its open revision.
- MarkovChainsAndRenewal Layer 3 on main (`README.md:234-238`: `Kernel.IsReversible`, invariance).

**Ownership against open pull requests.**
- No other open pull request changes this roadmap, and none drops an id it cites.
- `roadmaps grep` over main and all 458 open heads, for every declaration name of `Suggested.lean`, finds no other declarer.
- Searching by object (Strassen, convex order, garbling, Halmos–Savage, Neyman–Pearson, Rao–Blackwell, Kaplan–Meier, Metropolis, leapfrog, Benjamini, contiguity, delta method, Slutsky, U-statistic, James–Stein, Basu) finds no second owner. Specifically:
  - StochasticCalculus uses finite-dimensional Slutsky inside Donsker;
  - ProbabilisticAndMetricNumberTheory plans no Slutsky;
  - OperatorAlgebraDynamics builds the convex order only for Choquet simplices;
  - PointProcesses excludes statistical estimation.

### Adversarial table

| Statement | Instances | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| `HasDensity.integral_eq` (1.1) | P = Unif[0,1], f = 1, g = x and g = 1/x | 1/2 / 1/2; junk 0 / junk 0 | holds without integrability | none |
| `mixtureWeight` sum (1.2) | ∑ 2^{-(n+1)} | 1 / 1 | holds | none |
| Halmos–Savage (Lean, 1.2) | N(θ,1), θs ≡ 0; P n = δₙ on ℕ, θs = id | N(θ,1) ≪ N(0,1); every δₙ charged by ∑2^{-(n+1)}δₙ | true; infinite P θ allowed (essential-union argument) | none |
| `HasTestLevel` (1.3) | H₀ = ∅ | every test has every level | matches README example | none |
| `thresholdTest`/`intervalTest` (1.3) | T = id, c = 0, γ = 1/2 at −1, 0, 1; interval (0,1), γᵢ = α at 0, 1/2, 1, 2 | 0, 1/2, 1; α, 1, α, 0 | as defined | Check (R09) |
| `hasConfidenceCoverage_confidenceSetOfTests` (1.4) | reject θ = {\|x−θ\| > 1.96}, N(θ,1) | coverage 0.95 / 1 − 0.05 | holds | none |
| `ofReal_risk_eq_lintegral` (1.5) | L bounded / L = 1/a on (0,1] unbounded | equal / junk 0 vs ∞ | bound hypothesis needed and present | none |
| `IsSufficientStatistic` (2.1) | Bern(p)², T = sum vs T = x₁ | kernel uniform on fibre, free of p / law of x₂ given x₁ is Bern(p) | discriminates | Check (R09) |
| `IsCompleteStatistic` (2.1) | Bern(p)², T = sum vs identity | g ≡ 0 forced / g = x₁ − x₂ has mean 0 for all p | discriminates | Check (R09) |
| Factorization (Lean, 2.2) | Bern(p)², counting μ | f = p^s(1−p)^{2−s} = g_p(s)·1 | holds; ⇐ needs standard Borel X (present) | none |
| Minimal sufficiency of the likelihood ratio (Lean, 2.2) | Θ = {0,1}, N(0,1), N(1,1) | ratio e^{x−1/2} is a bijection of x | holds | none |
| Basu (Lean, 2.3) | N(θ,1)², T = x₁+x₂, A = x₁−x₂ | Cov = 1 − 1 = 0, jointly Gaussian | independent | none |
| Symmetric completeness (Lean, 2.4) | n = 0; non-symmetric g = x₁ − x₂ | g constant c = 0; mean 0, g ≠ 0 | n = 0 holds; symmetry needed (present) | none |
| `convex_naturalParameterSpace` (3.1, sample) | ν = e^{−\|x\|}dx; Lebesgue; Cauchy | N = (−1,1); ∅; {0} | convex in all three | none |
| Probability of the family law (3.1) | ν = 0 | total mass 0 | needs ν ≠ 0 (stated) | none |
| `IsMinimalExponentialFamily` (3.1) | δ₀ + δ₁; δ₀ | minimal; not minimal | discriminates | Check (R09) |
| Laplace determinacy (Lean, 3.2) | δ₀+δ₁ vs 2δ_{1/2} at u = 0, 1 | 2/2; 3.718 / 3.297 | distinguishes; dim 0 gives equal masses | none |
| Derivatives of the log partition function (3.3) | Bernoulli | A′ = e^η/(1+e^η) = mean; A″ = p(1−p) = Var | holds | none |
| Mean parametrization (3.5) | Bernoulli; Lebesgue on ℝ | logistic map onto (0,1); N = ∅ but target ℝ | README false without N ≠ ∅ | R02 |
| MLE iff interior (Lean, 3.6, sample) | Bernoulli t = 0; t = 1/2 | sup not attained & 0 ∉ (0,1); max at η = 0 & 1/2 ∈ (0,1) | ↔ holds both ways; non-steep N allowed | none |
| Completeness (Lean, 3.4) | ν = δ₀+δ₁+δ₂, U = (−1,1) | g₀ + g₁e^η + g₂e^{2η} = 0 on U ⇒ g = 0 | holds; d = 0 holds | none |
| Pitman–Koopman–Darmois (Lean, 3.8) | Gaussian location with P₀ = N(0,1), θ ≥ 0; three-point log ratios {0,1,3} ↦ {0,p,q} | e^{θΣx−nθ²/2} increasing in Σx; sizes 3m±1 force q = 3p, size 2 alone allows q = 2.5p | consistent; infinitely many n needed | none (locator R08) |
| Covariance criterion for UMVU (4.1) | Bern(p), W = x | only unbiased estimator of 0 is U = 0, so cov = 0 | W UMVU | none |
| Rao–Blackwell (Lean, 4.2) | Bern(p)², δ = x₁, T = sum | Var p(1−p) / p(1−p)/2 for r = T/2 | inequality holds | none |
| U-statistics are UMVU (Lean, 4.2) | m = 2, h = (a−b)²/2, n = 3; m = 0 | sample variance with divisor n−1, unbiased; constant | holds | build order R10 |
| `sq_div_information_le_variance` (4.3, sample) | N(0,1), W = score = x | g′²/I = 1 / Var = 1 | equality; stand-in | R03 |
| `fisherInformationMatrix_posSemidef` (4.3) | law 2(1+x)⁻³, s = (1,x), u = (1,−1) | uᵀMu = −1 / ≥ 0 required | false without L² | R05 |
| James–Stein (Lean, 4.4) | p = 3, θ = 0; p = 2 | risk 3 − 1·1 = 2 < 3; E‖X‖⁻² = ∞ | holds; p ≥ 3 needed (present) | none |
| Joint density of order statistics (Lean, 5.1) | n = 2, f = 1 on [0,1]; n = 0 | density 2 on {x₁<x₂}, mass 1; δ = δ | holds | padding R13 |
| j-th order statistic density (5.1) | n = 2, j = 0, uniform | 2(1−x) = density of the minimum | holds; median formula at j = k checks | none |
| Gaussian sample laws (Lean, 5.2, sample) | n = 2, m = 0, v = 1; v = 0 | SS = (x₁−x₂)²/2 ~ χ²₁, t-statistic Cauchy = t₁; SS/v = 0/0 = 0 | Lean correct; README needs v > 0 | R06 |
| Threshold-test size (6.1) | (1−β)-quantile c | P(T>c) ≤ β ≤ P(T≥c) | γ ∈ [0,1] exists | none |
| Neyman–Pearson, constrained (Lean, 6.2) | N(0,1) vs N(1,1), α = 0.05 | k = e^{1.145} ≈ 3.14, power 0.259 | holds | none |
| Neyman–Pearson, necessity (6.2) | compared with L–R's "unless a test of size < α has power 1" | equivalent for most powerful tests | holds | headline R03 |
| Neyman–Pearson, sum of errors (Lean, 6.2) | P = δ₀, Q = δ₁, t = 1 | npTest = 0 at 0, 1 at 1; sum of errors 0 = minimum | holds | none |
| Generalized Neyman–Pearson (Lean, 6.2) | m = 0 | φ = 1{f₀>0} maximizes ∫ψf₀ | holds | none |
| Karlin–Rubin (Lean, 6.3) | N(θ,1), c = 1.645, θ₀ = 0; θ = ±1 | power 0.259; size 0.004 ≤ 0.05 | holds; α ∈ {0,1} also holds | none |
| Least favorable sufficiency (6.4, sample) | Λ = δ₁ (off the null), Q = P₁, φ ≡ 0.05 | power 0.05 / Neyman–Pearson 0.259 | false as written | R01 |
| UMP interval test (Lean, 6.5, sample) | T two-valued {0,1} | equal sizes at η₁, η₂ force φ ≡ α; competitors ≤ α between | holds | vocabulary R15 |
| Neyman structure (Lean, 6.6, sample) | Bern(p)², similar φ with ±ε on {(0,1),(1,0)} | E[φ\|T=1] = α | holds | none |
| Maximal invariant (Lean, 6.8) | scaling, M = x/s; f = x/s + 1 and f = x | q(r) = r + 1; not invariant | ↔ holds | padding R13 |
| Bayes ⇒ minimax (Lean, 7.1) | risks (1,2), (1.1,1.1), π = 2δ₀; π = δ₀ | Bayes but sup 2 > 1.1; bound fails at θ = 1 | probability hypothesis needed (present) | none |
| Unique Bayes ⇒ admissible (Lean, 7.1) | README's ℕ example with risks 0 and −2^{n+1} | second risk not integrable | integrability hypothesis needed (present) | none |
| Finite-game saddle point (Lean, 7.2, sample) | matching pennies, X a point | q = 1/2, value 1/2, π uniform, R ≤ 1/2 | holds | none |
| Complete class (Lean, 7.2, sample) | C = {x+y ≥ 1, x,y ≥ 0}, point (2,2) | y = (1/2,1/2), w = (1/2,1/2), w·y = 1/2 ≤ w·z | holds; d = 0 excluded | none |
| Scheffé contrast supremum (Lean, 7.4) | S = ⊥; S = ℝ², v = (3,4), s = 1 | sSup ∅ = 0 = 0; 25 = 25 | holds; stand-in | R03, R04 |
| Blackwell (Lean, 7.5, sample) | Θ = ∅; N(θ,1) vs 1{x>0}; n = 0 | both sides true; deterministic garbling; vacuous | holds; risk quantifier order correct (δ′ before θ) | none |
| Slutsky without separability (Lean, 8.4, sample) | Yₙ = Z + 1/n | convergence in law to Z | true via bounded-Lipschitz portmanteau and measurable hull | none |
| Delta method (Lean, 8.4, sample) | g = x², θ = μ, Z ~ N(0,σ²) | DZ ~ N(0, 4μ²σ²) | matches README example | none |
| CLT for an i.i.d. statistic (Lean, 8.5) | s ≡ 0; n = 0 | N(0,0) = δ₀; (√0)⁻¹ = 0 term | holds | duplication R14 |
| Boundedness in probability iff tight (Lean, 8.2) | Xₙ = n deterministic; unit vectors of ℓ² | both sides false; bounded but not tight | Lean ℝ only | R11 |
| O_P(1)·o_P(1) (Lean, 8.3) | U = n·1_{[0,1/n]}, V = 1/n | U·V = 1_{[0,1/n]} → 0 | holds | none |
| `abs_measureReal_sub_le_tvDist_div_two` (9.2) | δ₀, δ₁, A = {0} | 1 / 2/2 = 1 | holds with [0,2] | Check (R09) |
| Kolmogorov–Smirnov statistic as a distance (Lean, 9.2) | n = 1, X₀ = 0, P = δ₀; n = 0 | 0 = 0; 1 ≠ 0 | n > 0 needed (present) | none |
| `empiricalCDF_eq_measureReal` (9.1) | (0.3, 0.1) at 0.2 | 1/2 / 1/2 | holds | none |
| Benjamini–Hochberg rejection count (Lean, 9.3, sample) | p = (0.01, 0.04, 0.5), α = 0.1; p = (−1,−1), α = −3 | count 2, set size 2; count 0, set size 2 | α ≥ 0 needed (present) | none |
| Metropolis–Hastings detailed balance (Lean, 9.4, sample) | π = (1,2), q flips | flows 1·1 = 2·(1/2) | holds | none |
| Leapfrog reversibility (Lean, 9.4) | d = 1, g = id, h = 1, z = (1,0) | (0.5, −0.75) → flip → (1,0) | identity | none |
| Leapfrog preserves Lebesgue measure (Lean, 9.4) | composite of shears | Jacobian 1 | holds for measurable g | none |
| Variance of the SRS mean (Lean, 9.5) | N = 2, n = 1, y = (0,2); n = N | 1 / (1/2)·2 = 1; 0 / 0 | holds | duplication R14 |
| Kaplan–Meier ≤ exp(−Nelson–Aalen) (Lean, 9.6) | two tied failures; T = (1,2) uncensored | 0 ≤ e^{−1}; 0 ≤ e^{−1.5} | holds | padding R13 |
| Kaplan–Meier per subject (Lean, 9.6) | T = (1,2) uncensored, t = 2 | (1−1/2)(1−1) both sides | holds | none |

## Not verifiable

- **Every source locator.** The README gives only one locator, `Lehmann–Casella, §1.6` (R08), so no sampled target could be checked against a text. Lehmann–Casella (2nd ed.), Lehmann–Romano (4th ed.), Ferguson (1967) and van der Vaart (1998) are paywalled books and were not read.
- **Brown 1986.** The sources service found no legal copy.
- **Blackwell 1953** (doi 10.1214/aoms/1177729032). The Project Euclid landing page has no PDF link.
- **Sion 1958** (doi 10.2140/pjm.1958.8.171). The service puts its host in no licence class. These fetches went to a scratch manifest; the package manifest was not edited.
- **The names of Mathlib pull request #39791** (`npLikelihoodRatio`, `npTest`, `npSumError`, `neyman_pearson`). They are not in the pinned Mathlib, and the pull request was not read, so whether 6.2 follows that pull request's API is unchecked.
- **The lean-CKSD repository** (the provenance table). It was not read.

## Source issues

- none
