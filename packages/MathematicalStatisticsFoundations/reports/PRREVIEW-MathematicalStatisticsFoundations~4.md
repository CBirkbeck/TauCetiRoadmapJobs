# Review of MathematicalStatisticsFoundations (pull request #2111 at 8bc9758)

**Verdict:** needs changes

Seven findings: two P2 and five P3. The push gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with 52 `sorry` warnings and nothing else. All nine findings of the previous review are repaired. None of the 52 Lean statements was found false or vacuous; the P2 findings are a README statement that lost a hypothesis its Lean form has, and an object that an earlier open roadmap already owns.

## R01 (P2) — 7.1: the README statement of the uniqueness theorem omits that `δ` is Bayes

- **Location.** `TauCetiRoadmap/MathematicalStatisticsFoundations/README.md:1162-1164`: "if every rule of `D` has `π`-integrable risk and every Bayes rule for `π` has the same risk function as `δ`, then `δ` is admissible".
- **Claim.** As written the statement is false when no Bayes rule exists: the hypothesis is then vacuous and `δ` is arbitrary. The Lean form (`Suggested.lean:650-653`) has `hδ : IsBayesRule R π δ`; the README does not.
- **Witness.** `D = ℕ`, `Θ` one point, `π` its Dirac mass, `R n = 1/(n+1)`. Every risk is integrable, no rule attains the infimum `0`, so no rule is Bayes. Rule `0` (risk `1`) is dominated by rule `1` (risk `1/2`).
- **Repair.** Write "if every rule of `D` has `π`-integrable risk, `δ` is Bayes for `π`, and every Bayes rule for `π` has the same risk function as `δ`".
- **Tested.** In the witness no `δ` is Bayes, so the repaired statement is vacuous there. With the vectors `(1, 2)`, `(1.1, 1.1)` and the prior `δ₀`, `(1, 2)` is the unique Bayes rule and is admissible.

## R02 (P2) — 9.2: the Kolmogorov distance has a second owner, an earlier open roadmap

- **Location.** `TauCetiRoadmap/MathematicalStatisticsFoundations/README.md:1499-1501`: "The Kolmogorov distance `sup_t |cdf P t - cdf Q t|`. It is a metric on probability measures on `ℝ`: symmetric, satisfies the triangle inequality, and is `0` iff `P = Q`".
- **Claim.** ArithmeticStatisticsPartVIII, §5.14 *Kolmogorov distance*, defines the same object on the same carrier and proves the same properties. It is an open new-roadmap pull request (#1179), and it is earlier in the merge order (line 145; this roadmap is line 402). Two open roadmaps own one object.
- **Witness.** `TauCetiRoadmap/ArithmeticStatisticsPartVIII/README.md:546-552` at the head of #1179: `d_K(μ, ν) = sup_x |F_μ(x) − F_ν(x)|` on Mathlib's `cdf`, with symmetry, the triangle inequality and vanishing exactly when `μ = ν`; its line 26 says the distance "built on them here is new".
- **Repair.**
  - In 9.2, cite ArithmeticStatisticsPartVIII §5.14 for the definition and the metric properties, and keep as targets only what is new: the bound by `tvDist P Q / 2` and the Kolmogorov–Smirnov identity.
  - Add a `### From ArithmeticStatisticsPartVIII` subsection to the supplier contracts and name it in the Layer 9 Dependencies.
  - The description's sentence "The roadmap has no dependency on an open PR" then names this one.
- **Tested.** The citation is downward (145 < 402). The reverse repair, ArithmeticStatisticsPartVIII citing this roadmap, would be upward.

## R03 (P3) — 7.1: the "least favorable" conclusion is not least favorability

- **Location.** `README.md:1171-1172`: "`π` is least favorable: `∫ R δ dπ' ≤ ∫ R δ dπ` for every probability prior `π'` under which `R δ` is integrable"; `Suggested.lean:645-646`.
- **Claim.** The inequality compares the risk of the fixed rule `δ` under two priors. It is the hypothesis `R δ θ ≤ ∫ R δ dπ` integrated against `π'`, and says nothing about the Bayes risk of `π'`. A prior is least favorable when its Bayes risk is at least that of every other prior (Ferguson, Def 1.6.4).
- **Witness.** Risk vectors `(1, 2)`, `(1.1, 1.1)`, `π = (1/2, 1/2)`, `δ = (1.1, 1.1)`, `π' = δ₀`. The stated inequality reads `1.1 ≤ 1.1`. The Bayes risk of `π'` is `1`, and the statement that matters is `1 ≤ 1.1`.
- **Repair.** State the conjunct as: for every probability prior `π'` and every rule `δ'` Bayes for `π'`, `∫ R δ' dπ' ≤ ∫ R δ dπ`. Change the Lean conjunct to match.
- **Tested.** On the witness, `δ' = (1, 2)` is Bayes for `π'` and `1 ≤ 1.1`. In general `∫ R δ' dπ' ≤ ∫ R δ dπ' ≤ ∫ R δ dπ`, using the integrability hypothesis already present.

## R04 (P3) — Two Lean statements differ from their README statements

- **Location and claim.**
  - **4.2.** `README.md:782-785`: "then `r ∘ T` is UMVU, and it is the Rao–Blackwellization of every square-integrable unbiased estimator of `g`". `Suggested.lean:340-344` concludes only `IsMinimumVarianceUnbiasedEstimator P (r ∘ T) g`. The second conclusion is not stated.
  - **3.4.** `README.md:563` makes `exponentialFamilyMeasure` the family law. `Suggested.lean:258-265` states completeness for a hand-written `ν.withDensity (ofReal (exp ⟪η, T⟫ / Z η))` with a free function `Z` and a hypothesis forcing `Z η = ∫ exp ⟪η, T⟫ dν`. It also fixes `EuclideanSpace ℝ (Fin d)`, although its input 3.2 is stated for any finite-dimensional `E` and no coordinates are used.
- **Witness.** `Measure.tilted` (`Mathlib/MeasureTheory/Measure/Tilted.lean:42-43`) is `μ.withDensity (ofReal (exp (f x) / ∫ exp f dμ))`: the family of 3.4 is `exponentialFamilyMeasure ν T η` verbatim, as 6.5 writes it (`Suggested.lean:558`).
- **Repair.**
  - **4.2.** Add the conjunct: for every square-integrable unbiased `δ` and every kernel `K` disintegrating the family along `T`, `r (T x) = ∫ δ dK (T x)` `P θ`-a.e. Or move the clause to its own README bullet, outside the headline.
  - **3.4.** State `IsCompleteStatistic (fun η : U ↦ exponentialFamilyMeasure ν T η.val) T` for `T : X → E`, with `hUN : U ⊆ naturalParameterSpace ν T`; drop `Z` and `hZ`; rename the theorem accordingly.
- **Tested.** For `ν = δ₀ + δ₁ + δ₂`, `U = (−1, 1)`: both forms give the laws with masses `e^{ηk}/(1 + e^η + e^{2η})`, and `g₀ + g₁e^η + g₂e^{2η} = 0` on `U` forces `g = 0`. For `Bern(p)²`, `δ = x₁`: `∫ δ dK(s) = s/2 = r(s)`.

## R05 (P3) — 4.4: Gaussian integration by parts is a target of RandomMatrices on main, uncited

- **Location.** `README.md:838-841`: "**Stein's identity** (`gaussian_integration_by_parts`): for `X ~ N(θ, v I)` …".
- **Claim.** RandomMatrices, on main, already plans this theorem. The README neither cites it nor says how 4.4 differs.
- **Witness.** `TauCetiRoadmap/RandomMatrices/README.md:441-443`, §2.5 *Gaussian integration by parts and replacement*: "Prove Gaussian integration by parts, real and complex Wick/Isserlis formulas".
- **Repair.** In Scope ("Not owned here") and in 4.4, cite RandomMatrices §2.5 and say in one clause what 4.4 keeps: the coordinate form for `N(θ, v I)` on `EuclideanSpace ℝ (Fin p)` with a `C¹` field, as James–Stein needs it. Or consume §2.5 and drop the target.
- **Tested.** RandomMatrices is on main, so the citation is downward. The identity at `p = 1`, `g = id`, `v = 2`: `E[(X − θ)X] = 2 = 2 · 1`.

## R06 (P3) — 9.6: "weak stationarity" omits the constant mean

- **Location.** `README.md:1645-1646`: "Weak stationarity of `X : ℤ → H` in an inner product space over `𝕜`: `⟪X s, X t⟫ = ⟪X 0, X (t - s)⟫`. The autocovariance `γ h = ⟪X 0, X h⟫`".
- **Claim.** In `H = L²(μ)` this is stationarity of the second moments only. The standard notion (Brockwell–Davis, Def 1.3.2) also requires a constant mean, and `γ` is a covariance only for centred variables. No Check separates the two.
- **Witness.** `X t = (−1)^t · 1` in `L²(μ)`: `⟪X s, X t⟫ = (−1)^{t−s} = ⟪X 0, X (t − s)⟫`, so the definition holds, while `E X t = (−1)^t` is not constant.
- **Repair.** Say that the definition is for centred sequences (in `L²`, variables of mean `0`), or name it stationarity of second moments in a Hilbert space, and call `γ` the autocovariance only in the centred case. Add the witness as a Check.
- **Tested.** The i.i.d. noise of the same subsection has mean `0`, so its statement `γ h = σ² 1_{h = 0}` is unaffected.

## R07 (P3) — 1.4: a backticked Lean name that `Suggested.lean` does not declare

- **Location.** `README.md:378` ("`HasConfidenceCoverage P C α`: for every `θ` …") and `README.md:390`.
- **Claim.** A backticked name of the roadmap's own is a claim that `Suggested.lean` declares it. The declaration was removed (correctly: no headline uses it), and the README still writes the Lean name. The previous review's wording "README 1.4 keeps it" meant the statement.
- **Witness.** Of the 258 backticked identifiers of the README, this is the only one found neither in `Suggested.lean` nor at the pins.
- **Repair.** State 1.4 in prose: "a confidence set `C` has coverage `1 − α` if for every `θ` …", and write the Checks the same way.

## Verified sound

### Repair of the previous review's findings (at ddd39dd)

| Previous finding | Status | Evidence at 8bc9758 |
|---|---|---|
| R01 parallel tilt definition | repaired | `README.md:563` and `Suggested.lean:199-200` use `ν.tilted`; the three 3.1 targets are cited as Mathlib lemmas (`:570-574`); Scope `:45-50`; Checks `:582`, `:587`; StandardDistributions 7.8 cited `:225` |
| R02 8.2 equivalence | repaired | `README.md:1341-1347` is the adapter for a proper normed group, citing the Mathlib lemma; the Lean theorem is gone |
| R03 unused definition, two names | repaired | `HasConfidenceCoverage` is not in the Lean file (but see R07); `measureReal_scheffe_event_eq_one_sub`, `sq_deriv_le_variance_mul_fisherInformation` |
| R04 false Checks | repaired | 4.1 `:765-768` (`W ≡ 0` is UMVU for `g ≡ 0`); 7.5 `:1306-1308`; 4.3 `:831-832` |
| R05 Checks per definition | repaired | every definition listed there now has three tested instances; the five Layer 9 objects have Checks |
| R06 locators | repaired | Summary `:22`; 1.1 `:274-277`; Blackwell–Girshick at `:1262`; Sion at `:1207` |
| R07 Karlin–Rubin, file order | repaired | `Suggested.lean:511-512` has the monotonicity conjunct; 3.4, 3.7, 3.8 in order; `##` layer comments |
| R08 dependency lines | repaired | Layer 4 `:886-887`, Layer 7 `:1319`, 3.5 *Needs:* `:655-656` |
| R09 description count | repaired | "its 52 targets are admitted"; the file has 52 theorems |

### Gate, dependencies, build

- **Gate, rerun:** every counter `0`, `OK`. The worker's gate reported `build=0`.
- **Dependency check:** `depcheck: 234 roadmaps, 2263 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- **Other files:** no change outside the folder. `metadata.toml` is `topic = "math.ST"`.
- **Elaboration:** `lake env lean` on `Suggested.lean`: 52 `declaration uses 'sorry'` warnings, the eight `#check` outputs, nothing else. 52 theorems, 40 definitions.
- **Signatures:** the elaborated types of all 92 declarations were compared with the README statements. The two flagged binders (`[MeasurableSpace X]` on `thresholdTest` and `likelihoodScore`) are not needed by those definitions. The Layer 3 theorems keep `[BorelSpace E] [FiniteDimensional ℝ E]`; 3.5 and 3.6 keep `[SigmaFinite ν]`. Differences found: R03, R04.
- **One-tactic probe:** on a scratch copy, `first | simp_all | (intros; simp_all) | exact?` replaced `sorry` in ten theorems (Halmos–Savage, Lehmann–Scheffé uniqueness, the generalized Neyman–Pearson lemma, Karlin–Rubin, `most_powerful_of_mixture_null`, Neyman structure, the two 7.1 theorems, `O_P(1)·o_P(1)`, contiguity). All ten failed. No padding found.
- **Headlines:** the 40 bold targets and the 12 further named targets of Layers 1–8 are each declared; Layer 9 has none, as the docstring says.

### Library declarations checked at the pins (this round)

- `Measure.tilted` (`Mathlib/MeasureTheory/Measure/Tilted.lean:42`; `tilted_of_not_integrable` at `:46` gives `0`, as the 3.1 Check says).
- `IsBayesEstimator` (`Mathlib/Probability/Decision/BayesEstimator.lean:103`): `avgRisk ℓ P κ π = bayesRisk ℓ P π` for a kernel `κ`, which is the form 7.1 compares with.
- `TendstoInDistribution` (`Mathlib/MeasureTheory/Function/ConvergenceInDistribution.lean:64`) needs only `[OpensMeasurableSpace E]`; `tendstoInDistribution_of_tendstoInMeasure_sub` (`:192`) sits under `[SecondCountableTopology E]` (`:186`), so 8.4 is new.
- `isTightMeasureSet_range_iff_tendsto_limsup_measure_norm_gt` (`Mathlib/MeasureTheory/Measure/TightNormed.lean:121`).
- `Measure.support` (`Mathlib/MeasureTheory/Measure/Support.lean:59`): the topological support.
- `tvDist`, `etvDist` (`Mathlib/MeasureTheory/Measure/TotalVariation/Defs.lean:62`, `:53`).
- All 258 backticked identifiers of the README resolve in `Suggested.lean` or at the pins, except the one of R07. The three leads of the citation resolver are the two dotted 7.1 names (declared) and the implementation namespace `TauCeti.NeymanPearson`.
- The 54 declarations listed in the previous review were not reopened; the pins have not changed.

### Cross-roadmap citations resolved (5, on main)

- StandardDistributions 4.6 (`README.md:527`), 7.2 (`:995`), 7.8 (`:1117`); its line 15 puts statistical inference outside its scope.
- MarkovChainsAndRenewal Layer 3 (`README.md:234`; `Kernel.IsReversible` at `:97`).
- Completed/Exchangeability Layer 8 (`README.md:931`).

### Ownership and overlap

- No open pull request changes this roadmap and none drops an id it cites.
- `roadmaps grep` over main and the 447 open heads, 53 object patterns. Two overlaps: R02 and R05. Checked and not owners: StochasticCalculus and ProbabilisticAndMetricNumberTheory (Slutsky steps used, not planned); FiniteSamplingDiscrepancy on main (a likelihood ratio of two specific laws); RandomMatrices (sample covariances `XX*/n`, not the scatter matrix of 9.5); the empirical measures of other roadmaps are Tau Ceti's, as here.

### Adversarial table

| Statement | Instances | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| 1.2 Halmos–Savage | `P n = δₙ`, `θs = id`; `θs n = 1/(n+1)` on `ℝ` | mass of `{3}` is `1/16`; `{1}` has `1/2`, `(0, 1/2]` has `1/2`, `{0}` has `0` | holds | none |
| 1.4 confidence sets (sample) | `C x = [x ± 1.96]`, `N(θ,1)`; `C = ∅`; `C = univ` | coverage `0.95`: holds at `α = 0.05`, fails at `0.01`; `0 ≥ 1 − α` iff `α ≥ 1`; `1` | as stated | R07 |
| 2.2 factorization (sample) | `Bern(p)²`, counting `μ`, `T = x₁ + x₂` | `f_p = p^s (1−p)^{2−s} · 1` at all four points | holds; ⇐ uses `condKernel` on standard Borel `X` | none |
| 2.2 minimal sufficiency (sample) | `N(0,1)`, `N(1,1)`, `θ₀ = 0` | statistic `(1, e^{x − 1/2})`; any sufficient `U` has `f₁/f₀ = g₁(U)/g₀(U)` a.e. | holds for countable `Θ` | none |
| 2.3 Basu (sample) | `N(θ,1)²`, `T = x₁+x₂`, `A = x₁−x₂` | `cov = 1 − 1 = 0`, jointly Gaussian; `K(s, A⁻¹B)` has mean `c` for all `θ` | independent | none |
| 2.4 symmetric completeness | laws on `{0,1}`, `n = 2`; `C = {N(θ,1)}` | `g₀₀(1−p)² + 2g₀₁p(1−p) + g₁₁p² ≡ 0 ⇒ g = 0`; `(x₁−x₂)² − 2` has mean `0`, not `0` | holds; mixture closure needed | none |
| 2.4 `uStatistic` | `m=2, n=3`, `h=(a−b)²/2`, `x=(0,1,2)` | six injections, sum `6`, value `1`; divisor `n` gives `2/3` | as stated | none |
| 3.1 family law | `δ₀+δ₁`; Lebesgue, `η = 0`; `ν = 0` | `Bern(e^η/(1+e^η))`; `0`; `0` | as the Checks say | none |
| 3.2 Laplace determinacy | `μ₁ = 0`; `μ₂` not integrable | `u = 0` gives `μ₂(E) = 0`; junk `0` ≠ positive left side | holds with integrability for `μ₁` only | none |
| 3.3 log partition | `δ₀+δ₁` | `A′(0) = 1/2` = mean; `A″(0) = 1/4` = variance | holds | none |
| 3.4 completeness | `δ₀+δ₁+δ₂`, `U = (−1,1)` | polynomial in `e^η` vanishing on `U` ⇒ `g = 0` | holds | R04 |
| 3.5 mean parametrization (sample) | Bernoulli; Lebesgue; `ν = cδ₀`, `dim E = 0` | logistic map onto `(0,1)`, inverse `log(m/(1−m))`; `N = ∅` excluded; `N = {0}` = interior | holds | none |
| 3.6 maximum likelihood | Bernoulli `t = 0`, `1/2`; `x⁻³ 1_{x ≥ 1}`, `t = 3`, `t = 1` | no maximum, `0 ∉ (0,1)`; maximum at `η = 0`; `N = (−∞, 0]`, slope `3 − 2 > 0`, maximum at `0`; no maximum, `1 ∉ (1, ∞)` | iff holds without steepness | none |
| 3.7 conditional families (sample) | `κ s = δ₀+δ₁`; `η = 0`; `κ s = 0` | `Bern(e^η/(1+e^η))`; tilt `exp(0 − log 1) = 1`; `0` | holds; `κ = e^{−⟪η₀,t⟫} K` from one disintegration | none |
| 3.8 Pitman–Koopman–Darmois (sample) | `N(θ,1)`, `θ ≥ 0`; `log p₁ = (0,1,2)`, `log p₂ = (0,1,3)` on three points | density `e^{θΣx − nθ²/2}`, `T = x`, `a = θ`; at `n = 5` the counts `(0,5,0)` and `(3,0,2)` give log densities `(5, 5)` and `(4, 6)`: one falls, the other rises | first satisfies both; second fails the hypothesis and the conclusion together | none |
| 4.1 covariance criterion | `Bern(p)`, `W = x` | unbiased `U` of `0` is `0`, covariance `0` | holds | none |
| 4.2 Rao–Blackwell, Lehmann–Scheffé (sample) | `Bern(p)²`, `δ = x₁` | `r(s) = s/2`; variances `p(1−p)/2 ≤ p(1−p)` | holds | R04 |
| 4.2 U-statistics | laws on `{0,1}`, `h = (a−b)²/2`, `n = 3` | unbiased for `p(1−p)`; symmetrized competitor equals it | holds | none |
| 4.3 information inequality | `Exp(θ)`, `W = x`; `∂f` not integrable | `θ⁻⁴ = θ⁻² · θ⁻²`; then `I` is the junk `0` and `hI` fails | `hI` supplies the integrability | none |
| 4.4 Stein, James–Stein | `p=1`, `g=id`, `v=2`; `p=3`, `θ=0`; `p=2` | `2 = 2·1`; risk `3 − 1 = 2 < 3`; `E‖X‖⁻² = ∞` | holds; `p ≥ 3` needed | R05 |
| 4.5 Pitman estimator (sample) | `U[−½,½]`, `x = (0, 0.9, 0.1)`; `n = 1`; `n = 0` | `u ∈ [0.4, 0.5]`, value `0.45`, mean `1/3`; `x₁ − ∫ u f`; no equivariant `δ` | holds: `pitman = δ − E₀[δ ∣ differences]` | none |
| 5.1 ranks | `n = 2` uniform; `P = δ₀` | `P(x₁ < x₂, B) = ½ P(B)`; sort is the identity with probability `1 ≠ ½` | atomless needed (present) | none |
| 5.2 Gaussian sample | `n=2, m=0, v=1` | `SS = (x₁−x₂)²/2 ~ χ²₁`; statistic `(x₁+x₂)/|x₁−x₂| ~ t₁` | holds | none |
| 6.2 constrained, necessity | `N(0,1)` vs `N(1,1)`, `α = 0.05`; `δ₀` vs `δ₁` | `k = e^{1.145}`, power `0.2595`; `k = 0`, power `1` | holds; `k(α − size ψ) = 0` gives the size clause | none |
| 6.2 sum of errors | `(δ₀+δ₁)/2`, `(δ₀+3δ₁)/4`, `t = 2` | ratios `(1/2, 3/2)`; test `(η, 1)`; error `2 − T(1)`, minimum `1`; threshold `t` gives `2` | holds | none |
| 6.3 Karlin–Rubin, essential completeness | `N(θ,1)`, `c = 1.645`; `ψ = 1{|x| > 1.96}` | powers `0.0041, 0.05, 0.2595`; at `θ = 1`: `0.2595 ≥ 0.1700`; at `−1`: `0.0041 ≤ 0.1700` | holds; weakly monotone ratio suffices | none |
| 6.4 least favorable | `Λ = δ₀`; `Λ = δ₁` with `H₀ = {0}` | reduces to Neyman–Pearson; `Λ H₀ᶜ = 1`, excluded | holds | none |
| 6.5 UMP interval tests (sample) | `ν = δ₀+δ₁`; `μ = δ₀`, `(¼, ¾)`; `μ = (δ₀+δ₁)/2` | power `a(1−p) + bp` linear, `≤ α` at both ends, so maximum `α`: the constant `α`; weight `½`; weights `½, ½` | holds | none |
| 6.6 UMPU, Neyman structure | `N(θ,1)`, `c = ±1.96`; `c₁ = c₂` | size `0.05`, `E[Tφ] = 0 = α · 0`; tangent line gives region `{t ≠ c}` | holds | none |
| 6.7 conditional tests | two Poisson counts, `S = X + Y` | `X ∣ S = s ~ Bin(s, λ₁/(λ₁+λ₂))`, a function of `η` only | holds | none |
| 7.1 criteria (sample) | vectors `(1,2)`, `(1.1,1.1)`, `(2,2)`; prior `2δ₀`; `ℕ`, risks `0`, `−2^{n+1}` | Bayes risks `1.5, 1.1, 2`; maxima `2, 1.1, 2`; `2 < 2.2` but maximum `2 > 1.1`; sums `0`, `−∞` | Lean statements hold | R01, R03 |
| 7.1 uniqueness, README form | `D = ℕ`, `R n = 1/(n+1)` | no Bayes rule; rule `0` dominated (`1 > 1/2`) | README statement false | R01 |
| 7.2 finite game, complete class | matching pennies; `C = {x + y ≥ 1, x, y ≥ 0}`, `x = (2,2)` | value `½` at uniform `δ`, `π`; `y = w = (½,½)`, `w·y = ½ ≤ w·z` | holds | none |
| 7.3 averaging, Blyth | `Θ = X = A = {±1}`, `κ ≡ δ₁`; `N(θ,1)`, `πₙ = √n·N(0,n)` | risks `(0,1) → (½,½)`; excess `√n/(n+1) → 0` | holds | none |
| 7.4 Scheffé (sample) | `n = 2`, `L = S = span(1,1)` | `⟪u, μ̂−μ⟫ = 2(ȳ−m)`, `s‖u‖ = |y₁−y₂|`; ratio `~ t₁`, `t₁² ~ F₁,₁` | coverage exactly `1 − α` | none |
| 7.5 comparison (sample) | `σ = δ_{½}`, `τ = (δ₀+δ₁)/2`; `Θ = ∅`; `Q θ = δ_θ` vs `N(θ,1)` | `D(½) = τ`, barycentre `½`; no Markov kernel into `Fin 0` when `Y ≠ ∅`; risk `0` unattainable | holds; `Nonempty Y` needed (present) | none |
| 8.3 `O_P(1)·o_P(1)` | `U = n·1_{[0,1/n]}`, `V = 1/n` | `μ{UV ≥ ε} ≤ 1/n → 0` | holds without measurability | none |
| 8.4 Slutsky, delta method (sample) | `Yₙ = Xₙ + 1/n`; `g = x²` at `μ` | `|E f(Yₙ) − E f(Xₙ)| ≤ Lε + 2‖f‖ μ*{‖Yₙ−Xₙ‖ ≥ ε}`; limit `N(0, 4μ²σ²)` | holds; `‖√n(Tₙ−θ)‖` is bounded in probability by continuous mapping | none |
| 8.5 weak law | `s ≡ 1`; Cauchy, `s = id` | limit `1`; not integrable, excluded | holds | none |
| 8.6 contiguity | `Qᵢ` density `i·1_{[0,1/i]}` vs `U[0,1]`; `N(0,1)` vs `N(i,1)` | `Qᵢ{L > C} = 1` for `i > C`; `Aᵢ = {x > i/2}`: `→ 0` vs `→ 1` | `Q(A) ≤ C P(A) + Q{L > C}` | none |
| 9.2 Kolmogorov distance | `δ₀`, `δ₁`; `δ₀`, `δ_ε` | `1`; `1`, total variation `2` | as stated | R02 |
| 9.3 Benjamini–Hochberg | `p = (0.01, 0.04, 0.5)`, `α = 0.1`; `p = (−1,−1)`, `α = −3` | thresholds `0.033, 0.067, 0.1`: count `2`; thresholds `−1.5, −3`: count `0`, set of size `2` | as stated | none |
| 9.4 objects | leapfrog `g = id`, `h = 1`, `(1, 0)`; `π = (1,2)` flip; prior `N(0,1)`, `m = 2` | `(0.5, −0.75)`; flows `1 = 2·½`; `N(1, ½)` | as stated | none |
| 9.5 objects (sample) | `N=2, n=1, y=(0,2)`; sample `(0,2)`, `C = 1`, `C = 2`; `ZMod 4`, `a = 2` | variance `1 = ½·2`; `1` and `log 2 + ½ = 1.193`; `i + 2j` not injective in `j` | as stated | none |
| 9.6 objects (sample) | `T = (1,2)`; second censored at `1.5`; `(1,−1)`; `X t = (−1)^t` | `(1−½)(1−1) = 0`, Nelson–Aalen `1.5`; `½`; `γ̂(0) = 1`, `γ̂(1) = −½`; definition holds, mean not constant | Checks hold; definition admits the last | R06 |

## Not verifiable

One sampled locator was read: Sion (1958), Thm 3.4, is on printed p. 174 (Sion1958 line 127), as 7.2 cites. The other sampled locators could not be read legally, so their theorem numbers, pages and hypotheses are unchecked: 1.4, 2.2, 2.3, 3.5, 3.7, 3.8, 4.2, 4.5, 6.5, 7.1, 7.4, 7.5, 8.4, 9.5, 9.6. The package manifest was not edited; the operator's local directory holds none of these texts and the sources cache holds none.

- **Brown 1986.** The Project Euclid pages for the book and for two chapters have no PDF link; a third chapter DOI does not resolve.
- **Schervish, Pfanzagl, Ferguson, Berger, van der Vaart, Casella–Berger, Seber–Lee, Anderson, Brockwell–Davis, Aalen–Borgan–Gjessing, Bickel–Doksum, Cox–Reid, Blackwell–Girshick, Strasser, Shaked–Shanthikumar.** Commercial books behind paywalls; not fetched.
- **Casella–Berger page numbers.** They refer to the 2024 CRC reissue and could not be compared.
- **Ferguson, Def 1.6.4** (R03) is cited from memory of the text's numbering; the definition itself is standard.

## Source issues

- none
