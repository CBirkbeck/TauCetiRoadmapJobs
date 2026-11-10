# Review of MathematicalStatisticsFoundations (pull request #2111 at d56ef99)

**Verdict:** accepted

Incremental re-review of the 141 lines changed since 8bc9758. No finding. All seven findings of the previous review are repaired and no repair introduced a new problem. The push gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with 52 `sorry` warnings and nothing else. The folder is ready for a human's final approval.

## Previous findings

- R01 — repaired: `README.md:1175-1177` now reads "if every rule of `D` has `π`-integrable risk, `δ` is Bayes for `π`, and every Bayes rule for `π` has the same risk function as `δ`, then `δ` is admissible", matching `hδ` at `Suggested.lean:656`.
- R02 — repaired: `README.md:1513-1515` keeps only the bound `|cdf P t - cdf Q t| ≤ tvDist P Q / 2` and says "The Kolmogorov distance `sup_t |cdf P t - cdf Q t|` is not defined here"; the Kolmogorov–Smirnov statistic (`:1516-1521`) is stated without it. The roadmap no longer defines the object, so no citation of ArithmeticStatisticsPartVIII is needed and the description's "no dependency on an open PR" stays true.
- R03 — repaired: `README.md:1183-1185` and `Suggested.lean:648-649`: for every probability prior `π'` with `R δ` integrable and every `δ'` Bayes for `π'`, `∫ R δ' dπ' ≤ ∫ R δ dπ`.
- R04 — repaired: 4.2 has the Rao–Blackwellization conjunct in both files (`README.md:791-796`, `Suggested.lean:342-346`); 3.4 is `isCompleteStatistic_exponentialFamilyMeasure` for `T : X → E` on `exponentialFamilyMeasure ν T η`, inside the Layer 3 section (`Suggested.lean:232-237`, `README.md:640-644`).
- R05 — repaired: Scope (`README.md:99-101`), a `### From RandomMatrices` contract (`:248-251`), 4.4 (`:852-853`), its *Needs:* (`:861`) and the Layer 4 Dependencies (`:899`) cite RandomMatrices §2.5 and say what 4.4 keeps.
- R06 — repaired: `README.md:1661-1666` names the notion second-order stationarity, reserves weak stationarity and "autocovariance" for centred variables, and the Check `X t = (-1)^t · 1` is at `:1700-1702`.
- R07 — repaired: `README.md:387-388` and `:398-399` state coverage in prose; `HasConfidenceCoverage` occurs nowhere in the folder.

## Verified sound

### The changed passages

- **3.4 (Lean, moved and restated).** The elaborated type keeps `[MeasurableSpace E] [BorelSpace E] [FiniteDimensional ℝ E]` from the section. `exponentialFamilyMeasure ν T η` is `ν.tilted ⟪η, T ·⟫` (`Suggested.lean:199-200`), a probability measure for `η` in the natural parameter space when `ν ≠ 0`. `IsCompleteStatistic` (`:120-122`) carries the integrability of `g ∘ T`, so no junk integral enters. No `σ`-finiteness of `ν` is needed: the two finite measures with densities `g⁺`, `g⁻` against the tilted image law agree by 3.2, and integrable functions with equal set integrals agree a.e.
- **4.2 (new conjunct).** `IsUnbiasedEstimator` (`:303-304`) includes `Measurable δ`, so `s ↦ ∫ δ dK s` is measurable; it is integrable and unbiased by the disintegration identity, and the uniqueness part of Lehmann–Scheffé gives the a.e. equality with `r`. The hypothesis on `K` is the kernel clause of `IsSufficientStatistic` (`:115-117`) verbatim; `Measurable T` comes from `hs`.
- **7.1 (new conjunct).** `∫ R δ' dπ' ≤ ∫ R δ dπ'` is the second clause of `IsBayesRule R π' δ'` applied to `δ` (integrable under `π'` by hypothesis); `∫ R δ dπ' ≤ ∫ R δ dπ` is `hle` integrated against the probability `π'`. The README sentence has the same quantifiers.
- **9.2.** With Mathlib's `tvDist` (`Mathlib/MeasureTheory/Measure/TotalVariation/Defs.lean:62`, the real part of `etvDist`, `:53`), normalised so that `tvDist δ₀ δ₁ = 2` as the first Check says, the bound is the case `A = (-∞, t]` of the first bullet. The three new Check values are recomputed in the table.
- **9.6.** The definition, the i.i.d. noise bullet (`:1667-1671`: centred and second-order stationary, hence weakly stationary) and the two Checks agree with each other.
- **Summary item 9** (`README.md:69-75`) names what 9.2 and 9.6 now contain.
- **Description.** "its 52 targets are admitted": the file has 52 theorems (one removed, one added) and 40 definitions. "Gaussian integration by parts to RandomMatrices §2.5" matches the README.

### Gate, dependencies, build

- **Gate, rerun:** every counter `0`, `OK`. The worker's gate at this head reported `build=0`.
- **Dependency check:** `depcheck: 234 roadmaps, 2263 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- **Other files:** no change outside the folder.
- **Elaboration:** `lake env lean` on `Suggested.lean`: 52 `declaration uses 'sorry'` warnings, the eight `#check` outputs, nothing else.
- **Signatures:** the elaborated types of the three changed theorems were compared with the README statements: no difference. The two binders the tool flags (`[MeasurableSpace X]` on `thresholdTest` and `likelihoodScore`) are the ones the previous review found unneeded; those definitions are untouched.
- **One-tactic probe:** on a scratch copy, `first | simp_all | (intros; simp_all) | exact? | (constructor <;> first | simp_all | exact?)` replaced `sorry` in the three changed theorems. All three failed. No padding.
- **Headlines:** every bold target of Layers 1–8 is still declared; Layer 9 has none, as the module docstring says.

### Library declarations and citations resolved (this round)

- `tvDist`, `etvDist` at the lines above; `Measure.tilted` as in the previous review (pins unchanged).
- RandomMatrices §2.5 *Gaussian integration by parts and replacement* (`TauCetiRoadmap/RandomMatrices/README.md:441-447`, on main): "Prove Gaussian integration by parts". The citation is of a roadmap on main; the dependency check accepts it.
- The three leads of the citation resolver are the two dotted 7.1 names (declared at `Suggested.lean:645`, `:654`) and the implementation namespace `TauCeti.NeymanPearson`.
- Overlaps: no open pull request changes this roadmap and none drops an id it cites. The one double ownership of the previous review (the Kolmogorov distance) is gone. `gaussian_integration_by_parts` lives in this roadmap's namespace and is the kept coordinate variant, stated as such.

### Adversarial table

Rows marked "r4" are carried from the review at 8bc9758 for statements the diff leaves untouched; the others were computed at this head.

| Statement | Instances | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| 3.4 completeness (changed) | `ν = δ₀+δ₁+δ₂`, `T = id`, `U = (−1,1)`; `ν = 0`; Lebesgue on `ℝ`; `dim E = 0`, `ν` finite | masses `e^{ηk}/(1+e^η+e^{2η})`, `g₀+g₁e^η+g₂e^{2η} ≡ 0` on `U` ⇒ `g = 0`; all laws `0`, conclusion trivial; `N = ∅`, no nonempty `U`; one law, `g(0)·1 = 0` | holds | none |
| 4.2 Lehmann–Scheffé with the new conjunct (changed) | `Bern(p)²`, `T = x₁+x₂`, `δ = x₁`, `K(1)` uniform on `{(1,0),(0,1)}`; `δ = x₁ + 1` | `∫ δ dK(s) = 0, ½, 1 = s/2 = r(s)`; `s/2 + 1 ≠ r(s)`, excluded since `δ` is biased | holds | none |
| 7.1 minimax and least favorable (changed) | vectors `(1,2)`, `(1.1,1.1)`, `π = (½,½)`, `δ = (1.1,1.1)`; `π' = δ₀`, `δ₁`, `π` | Bayes risks `1.5`, `1.1`; `π' = δ₀`: `δ' = (1,2)`, `1 ≤ 1.1`; `δ₁`: `1.1 ≤ 1.1`; `π`: `1.1 ≤ 1.1` | holds; now separates `1` from `1.1` | none |
| 7.1 uniqueness, README form (changed) | `D = ℕ`, `R n = 1/(n+1)`; vectors `(1,2)`, `(1.1,1.1)`, `π = δ₀` | no Bayes rule, hypothesis fails; `(1,2)` unique Bayes, `1 < 1.1` so not dominated | holds | none |
| 1.4 coverage, prose form (changed) | `C x = [x ± 1.96]`, `N(θ,1)`; `C = ∅`; `C = univ` | `0.95 ≥ 0.95`, `0.95 < 0.99`; `0 ≥ 1 − α` iff `α ≥ 1`; `1` | as stated | none |
| 4.4 Stein (citation added) | `p = 1`, `g = id`, `v = 2` | `E[(X−θ)X] = 2 = 2·1` | holds | none |
| 9.2 distribution-function bound (changed) | `δ₀`, `δ_ε` at `t = 0`; `δ₀`, `(δ₀+δ₁)/2` at `t = 0`, `t = 1` | `|1 − 0| = 1 ≤ 2/2`; `|1 − ½| = ½ ≤ 1/2`; `|1 − 1| = 0 ≤ ½` | holds, Checks correct | none |
| 9.2 Kolmogorov–Smirnov statistic (reworded) | `n = 1`, `P = U[0,1]`, `X 0 = ½`; `X 0 = 0`; `n = 0` | `½` at `t = ½`; `1` at `t = 0`; `F̂₀ = 0` against a distribution function, excluded | as stated | none |
| 9.6 second-order stationarity (changed) | `X t = (−1)^t`; `X t = v`; `X t = t v`, `s = t = 1`; Rademacher noise | `(−1)^{s+t} = (−1)^{t−s}`, mean `(−1)^t`; `‖v‖² = ‖v‖²`; `‖v‖² ≠ 0`; centred, `γ h = 1_{h=0}` | definition, Checks and noise bullet agree | none |
| 1.2 Halmos–Savage (sample) | `P n = δₙ`; `θs n = 1/(n+1)` | mass of `{3}` is `1/16`; `{1}` has `½`, `{0}` has `0` | holds | r4 |
| 2.2 factorization, minimal sufficiency (sample) | `Bern(p)²`, `T = x₁+x₂`; `N(0,1)`, `N(1,1)` | `f_p = p^s(1−p)^{2−s}`; statistic `(1, e^{x−1/2})` | holds | r4 |
| 2.3 Basu; 2.4 | `N(θ,1)²`; laws on `{0,1}`, `n = 2`; `uStatistic` `m=2,n=3` | `cov = 0`; `g = 0`; value `1`, divisor `n` gives `2/3` | holds | r4 |
| 3.1–3.3 | `δ₀+δ₁`; `ν = 0`; `μ₁ = 0` | `Bern(e^η/(1+e^η))`; `0`; `A′(0) = ½`, `A″(0) = ¼` | holds | r4 |
| 3.5 mean parametrization (sample) | Bernoulli; Lebesgue; `ν = cδ₀` | logistic onto `(0,1)`; `N = ∅` excluded; `N = {0}` | holds | r4 |
| 3.6 maximum likelihood (sample) | Bernoulli `t = 0`, `½`; `x⁻³1_{x≥1}`, `t = 3`, `1` | no maximum; maximum at `η = 0`; maximum at `0`; none | iff holds | r4 |
| 3.7, 3.8 | `κ s = δ₀+δ₁`; `N(θ,1)`; three-point laws at `n = 5` | `Bern`; `T = x`; log densities `(5,5)`, `(4,6)` | holds | r4 |
| 4.1; 4.2 Rao–Blackwell, U-statistics | `Bern(p)`; `Bern(p)²`; `h = (a−b)²/2` | covariance `0`; variances `p(1−p)/2 ≤ p(1−p)`; unbiased for `p(1−p)` | holds | r4 |
| 4.3 information (sample) | `Exp(θ)`, `W = x` | `θ⁻⁴ = θ⁻²·θ⁻²` | holds | r4 |
| 4.4 James–Stein | `p = 3`, `θ = 0`; `p = 2` | risk `2 < 3`; `E‖X‖⁻² = ∞` | holds | r4 |
| 4.5 Pitman (sample) | `U[−½,½]`, `x = (0, 0.9, 0.1)`; `n = 0` | value `0.45`; no equivariant `δ` | holds | r4 |
| 5.1, 5.2 | `n = 2` uniform; `P = δ₀`; `n=2, m=0, v=1` | `½P(B)`; `1 ≠ ½`; `χ²₁`, `t₁` | holds | r4 |
| 6.2 Neyman–Pearson forms | `N(0,1)` vs `N(1,1)`, `α = 0.05`; two-point laws, `t = 2` | power `0.2595`; minimum error `1` | holds | r4 |
| 6.3 Karlin–Rubin (sample) | `N(θ,1)`, `c = 1.645`; two-sided competitor | powers `0.0041, 0.05, 0.2595`; `0.2595 ≥ 0.1700` | holds | r4 |
| 6.4 least favorable | `Λ = δ₀`; `Λ = δ₁`, `H₀ = {0}` | Neyman–Pearson; excluded | holds | r4 |
| 6.5 interval tests (sample) | `ν = δ₀+δ₁`; `μ = δ₀`, `(¼,¾)` | power linear, maximum `α`; weight `½` | holds | r4 |
| 6.6; 6.7 (sample) | `N(θ,1)`, `c = ±1.96`; two Poisson counts | size `0.05`, `E[Tφ] = 0`; `Bin(s, λ₁/(λ₁+λ₂))` | holds | r4 |
| 7.1 criteria, untouched definitions (sample) | vectors `(1,2)`, `(1.1,1.1)`, `(2,2)`; prior `2δ₀`; `ℕ` with risks `0`, `−2^{n+1}` | Bayes risks `1.5, 1.1, 2`; maxima `2, 1.1, 2`; `2 < 2.2`; sums `0`, `−∞` | holds | r4 |
| 7.2; 7.3 (sample); 7.4; 7.5 | matching pennies; `N(θ,1)`, `πₙ = √n·N(0,n)`; `n = 2`; `σ = δ_{½}`, `τ = (δ₀+δ₁)/2` | value `½`; excess `√n/(n+1) → 0`; ratio `~ t₁`; barycentre `½` | holds | r4 |
| 8.2 boundedness (sample); 8.3–8.6 | `U = n·1_{[0,1/n]}`, `V = 1/n`; `g = x²`; `s ≡ 1`; `Qᵢ = i·1_{[0,1/i]}` | `μ{UV ≥ ε} ≤ 1/n`; `N(0, 4μ²σ²)`; `1`; `Qᵢ{L > C} = 1` | holds | r4 |
| 9.3 Benjamini–Hochberg (sample) | `p = (0.01, 0.04, 0.5)`, `α = 0.1` | thresholds `0.033, 0.067, 0.1`: count `2` | as stated | r4 |
| 9.4 objects (sample) | leapfrog `(1,0)`, `h = 1`; `π = (1,2)` flip; prior `N(0,1)`, `m = 2` | `(0.5, −0.75)`; flows `1 = 2·½`; `N(1, ½)` | as stated | r4 |
| 9.5; 9.6 survival and sample autocovariance (sample) | `N=2, n=1, y=(0,2)`; `T = (1,2)`; `(1,−1)` | variance `1`; Kaplan–Meier `0`, Nelson–Aalen `1.5`; `γ̂ = 1, −½` | as stated | r4 |

## Not verifiable

- **Brockwell–Davis, Def 1.3.2, p. 12** (the locator added in 9.6) and **Ferguson, Thm 2.11.1, p. 90; Berger, Thm 17, p. 350** (7.1, changed sentence): commercial books behind paywalls; the sources cache and the operator's local directory hold neither, and they were not fetched. The mathematics of both passages was checked directly (table above).
- The other sampled locators are in untouched text and remain as the previous review recorded them: only Sion (1958), Thm 3.4, p. 174 was read; the textbook locators of 1.2, 2.2, 3.5, 3.6, 4.3, 4.5, 6.3, 6.5, 6.7, 7.3, 8.2, 9.3 and 9.4 are unchecked for the same reason. The package manifest was not edited.

## Source issues

- none
