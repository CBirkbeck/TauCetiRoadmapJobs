# Review of MarketImpact (pull request #1655 at 1f4eaab)
Folder: `TauCetiRoadmap/FinancialMathematics/MarketImpact/`

**Verdict:** accepted

Independent AI review of the repaired head. The gate passes every check, the dependency check reports no problem, the 17 admitted theorems elaborate with `sorry` as the only warning, none of them closes under a one-tactic probe, and the adversarial pass below found no false or vacuous statement. One P3 note remains (two redundant hypotheses); it is the author's to take or leave.

## Repairs of the previous review's findings

| Previous finding | Status at 1f4eaab | Passage |
| --- | --- | --- |
| R01 (P2) zero feedback breaks uniqueness of the minimizer | Repaired | `README.md:319`: "For ρ>0 the unique minimizer is `d₁=s_σ`; for ρ=0 every positive spot is a minimizer"; `Suggested.lean:207` guards the iff with `0 < ρ`; the ρ=0 constant case is a Check at `README.md:338`. |
| R02 (P2) computational procedures in scope | Repaired | `README.md:10`: "Computational search, grid solvers, random simulation and reproduction outputs are outside scope." No bisection, stencil, scheme or seed text remains in either file (grep). |
| R03 (P2) missing headline statements | Repaired | 17 admitted headlines: clearing, both profile directions, strike smoothing, five threshold theorems, two first variations, scalar existence, noncompact comparison, call correction PDE and expiry layer, local fit and cutoff limit. The docstring (`Suggested.lean:12`–21) names the unstatable headlines and their missing carriers. |
| R04 (P3) forbidden imports | Repaired | `Suggested.lean:1` is the single `import Mathlib`; gate `imports=0 mathlib-subimports=0 no-import-mathlib=0`. |
| R05 (P3) commit-pinned link | Repaired | PDE cited as "Lane F, F27.1–F27.6" by section (`README.md:8`, 48); gate `blob=0`. |
| R06 (P3) TeX outside code spans | Repaired | gate `tex=0`; display formulas are code spans or indented blocks (`README.md:277`–279, 580–581). |
| R07 (P3) residue collisions | Repaired | gate `residue=0`; third derivatives are written `Cₓₓₓ` (`README.md:30`, 587, 593). |
| R08 (P3) README shape | Repaired | Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers 1–5 with `**Checks.**` and `*Needs:*` on every subsection, Examples and Dependencies per layer, Downstream consumers, References. Every definition has at least three Checks (counts below). |
| R09 (P3) Lean padding and namespace | Repaired | Namespace is `TauCetiRoadmap.MarketImpact` (`Suggested.lean:27`); the two padding theorems and the stencil/aggregate definitions are gone; every retained Lean name appears in the README (checked by script, none missing). |
| R10 (P3) source edition and locators | Repaired | `README.md:611` identifies the April 1997 author preprint, 35 pages, and gives theorem/equation/page locators per target; the lecture notes are no longer cited. No `sources.toml` exists in the folder, but no roadmap folder on main carries one (0 of 124), so this is not a repository convention. |

## R01 (P3) — Two headline hypotheses are redundant

**Location:** `TauCetiRoadmap/FinancialMathematics/MarketImpact/Suggested.lean:136` (`hζzero : ∀ K, K ≤ 0 → ζ K = 0`) and `Suggested.lean:56` (`hinfty : Tendsto (clearingMap H) atTop atTop`).

**Claim:** each hypothesis is needed for its theorem.

**Witness:** `strikeSmoothedCallPayoff` integrates over `Set.Ioi 0` (`Suggested.lean:131`), so the values of ζ on `K ≤ 0` never enter the payoff, its derivative `∫₀ˣ ζ` or its second derivative `ζ(x)` at `x > 0`. In `global_clearing`, `hmargin` gives `g′ ≥ δ > 0` for `g = clearingMap H` on `(0,∞)`, so `g(x) ≥ g(1) + δ(x−1) → ∞`; `hinfty` follows from `hmargin` and `hH`. (The limit at zero is not redundant: `H(x) = −1/x` satisfies the margin with δ = 1 and `g = x + 1`, so `y = 1/2` has no root.)

**Repair:** delete `hζzero` from `strikeSmoothedCall_gamma` and `hinfty` from `global_clearing`; the README sentence at `README.md:73` then reads "a uniform strictly positive derivative margin and limit zero at 0", and `README.md:229` drops "vanishing at nonpositive strikes". Both statements remain true as they stand, so this is a note, not a blocker.

## Verified sound

**Scope of the review.** The whole 613-line README and 360-line Lean file were read; every passage was reviewed, changed or not. The diff against `origin/main` touches only the two folder files and one navigation link in the family index `TauCetiRoadmap/FinancialMathematics/README.md:3`, which this brief names as the pull request's own; `changes.md` lists no file outside the folder.

**Gate and build.** The worker's gate at this head: every check 0, `OK`. My own `lake env lean` of `Suggested.lean` exited 0 with exactly 17 `declaration uses sorry` warnings (lines 52, 107, 120, 134, 144, 162, 192, 197, 202, 214, 223, 230, 254, 297, 306, 325, 352) and nothing else. A scratch file with `#check @name` for all 44 declarations elaborated; the elaborated types agree with the worker's `signatures.md` and with the README statements compared below. There is no `variable` block, so no section binder could be lost; the two `Fintype ι` declarations keep their universe and instance. No `set_option`, `lemma`, `#eval`, sorry'd data, admitted `example` or `True` placeholder.

**Dependency check** (run with the supplied order, `--movable`, and the content repository):

```text
depcheck: 205 roadmaps, 1546 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Every `*Needs:*` line cites Mathlib, Tau Ceti, FinancialMathematics M0.1–M0.4, PDE F27.1–F27.6, StandardDistributions Layers 2–3, StochasticCalculus §§3.2–3.4, 5.1, 9.4, or an earlier section of this roadmap. StochasticCalculus is not on main; it is an open pull request adding a new roadmap folder, listed before MarketImpact in the merge order, and the cited sections exist at its head (`TauCetiRoadmap/StochasticCalculus/README.md:1454` "3.2 simple-process completion", 1527 "3.3 integral process", 1542 "3.4 localization", 1818 "5.1 Itô formula", 2865 "9.4 named examples", whose GBM paragraph says "FinancialMathematics M0.1 and MarketImpact consume this generic theorem"). No declared gaps.

**Cross-roadmap citations resolved on main.** FinancialMathematics `README.md:11` (M0.1), 29 (M0.2, including the progressive-coefficient extension with `δ_σ ≤ |σ_t| ≤ C_σ`, `|κ_t| ≤ K_κ`), 45 (M0.3, price/admissibility criterion `|C|+|sC_s| ≤ A(1+s^p)` and the general-coefficient class), 57 (M0.4, calls, puts, gamma, vega); the anchor `#m01-assets-and-trading` matches the heading. PDE `README.md:356` F27.1 (spaces `C_{par,b}^{k+α}`, traces), 406 F27.2 (heat isomorphism, comparison for bounded functions), 433 F27.3 (variable coefficients, backward problems), 461 F27.4 (BUC traces), 493 F27.5 (every order), 513 F27.6 (spatial weights with bounded Hölder derivatives of `log w`). StandardDistributions `README.md:314` (Layer 2: special functions and closed-form cdfs) and 361 (Layer 3, which defines `logNormalMeasure m v` as `(gaussianReal m v).map exp`). Each supplier is used for what it states; the README's own strengthenings (simple root, spatial Hessian, strict margin, two-ended growth, weighted fit) are declared as this roadmap's work.

**Pinned declarations opened** (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`, from `lake-manifest.json`):

| Declaration | File and line at the pin | Note |
| --- | --- | --- |
| `ContDiffAt.implicitFunction`, `ContDiffAt.contDiffAt_implicitFunction` | `Mathlib/Analysis/Calculus/ImplicitContDiff.lean:55`, 90 (inside `namespace ContDiffAt`) | local branch only, as the README says |
| `HasStrictFDerivAt.implicitFunctionOfProdDomain` | `Mathlib/Analysis/Calculus/ImplicitFunction/ProdDomain.lean:89` | derivative formula |
| `ProbabilityTheory.cdf` | `Mathlib/Probability/CDF.lean:56` | Stieltjes-valued, coerced in the statements |
| `gaussianPDFReal`, `gaussianPDFReal_zero_var`, `gaussianReal`, `gaussianReal_zero_var` | `Mathlib/Probability/Distributions/Gaussian/Real.lean:47`, 55, 220, 227 | zero variance is Dirac with zero density; the file uses variance one only |
| `MeasureTheory.UniformIntegrable`, `.unifIntegrable`, `.aestronglyMeasurable`, `tendsto_Lp_finite_of_tendsto_ae` | `Mathlib/MeasureTheory/Function/UniformIntegrable.lean:72`, 90, 99, 507 | finite measure, `1 ≤ p ≠ ∞` |
| `eLpNorm_one_eq_lintegral_enorm`, `integral_norm_eq_lintegral_enorm` | `Mathlib/MeasureTheory/Function/LpSeminorm/Defs.lean:125`, `Mathlib/MeasureTheory/Integral/Bochner/Basic.lean:537` | measurability hypotheses carried |
| `TauCeti.Probability.integral_Iic_gaussianPDFReal`, `cdf_gaussianReal_eq`, `cdf_gaussianReal_zero_one` | `TauCeti/Probability/Distributions/Gaussian/Cdf.lean:95`, 115, 122 | `v ≠ 0` for the general forms |
| `TauCeti.Real.erf_neg`, `hasDerivAt_erf`, `tendsto_erf_atTop`, `tendsto_erf_atBot` | `TauCeti/Analysis/SpecialFunctions/Erf.lean:72`, 92, 156, 163 | |
| `TauCeti.Probability.logNormalMeasure`, `logNormalMeasure_zero_var`, `integral_pow_logNormalMeasure` | `TauCeti/Probability/Distributions/LogNormal.lean:102`, 117, 289 | exp pushforward, not a semigroup |
| `TauCeti.HolderSpace`, `C1HolderSpace` | `TauCeti/Analysis/Holder/Normed.lean:58`, `One.lean` | static Hölder spaces on a metric space; no parabolic `C_b^{2+α,1+α/2}` carrier or trace operator exists at the pin, so the docstring's unstatability claim holds |

Neither pinned library has an Itô integral, an SDE solution carrier, a self-financing strategy or an admissible market (grep of `TauCeti/` and `Mathlib/`), so the docstring's remaining unstatability claims hold.

**Ownership and duplication.** `roadmaps grep` over the open heads and main for feedback volatility/pricing, market impact, Sircar/Papanicolaou, implied-volatility fits, program traders, clearing maps and smoothing thresholds finds no competing owner; StochasticCalculus (`README.md:36`, 2890) and FinancialMathematics (`README.md:3`, 73) explicitly assign feedback models to MarketImpact. No other `Suggested.lean` on main or at an open head declares a `TauCetiRoadmap.MarketImpact.*` name. The parent's `FinancialMathematics.Price`, `timeDeriv`, `priceDeriv`, `gamma`, `blackScholesResidual` and `blackScholesCall` (`TauCetiRoadmap/FinancialMathematics/Suggested.lean:17`–23, 80) are mirrored here under a different namespace; since a roadmap module cannot be imported, these are the simple definitions the headlines need, as `README.md:10` says, and the file uses the native `ProbabilityTheory.cdf (gaussianReal 0 1)` rather than the parent's `standardGaussianCDF`. The noncompact comparison is not F27.2 (bounded functions on ℝⁿ) and not M0.4's one-sided linear-growth uniqueness: it is a two-ended polynomial-growth subsolution principle on `(0,∞)`, owned here as stated. Ownership against open pull requests whose files the brief does not provide was not checked.

**Headline inventory.** README headline → Lean: global clearing → `global_clearing`; profile characterization both ways → `ratio_condition_characterizes_profile`, `profile_implies_ratio_condition`; strike smoothing → `strikeSmoothedCall_gamma`; exact thresholds, sign and asymptotic → `call_critical_threshold`, `put_critical_threshold`, `call_denominator_minimum`, `call_threshold_sign`, `call_threshold_asymptotic`; scalar local existence → `feedback_implicit_function_solution` (the fixed-ε single-call slice of §2.3 is the instance `terminal(z) = C_BS(e^z,T−ε)/e^z`, `k = 0`); first variations → `feedback_first_variation_on_cylinder`, `finite_feedback_first_variation`; noncompact comparison → `noncompact_comparison`; explicit correction and expiry layer → `call_correction_equation`, `call_correction_expiry`; local fit and cutoff limit → `local_call_fit`, `call_fit_cutoff_limit`. Named unstatable in the docstring: the full Hölder-space finite-claim/taper theorem with norm remainder and weighted fitting estimates, the convex-potential representation and its identification, the observable-state equivalence, the asset-process construction, the PDE-to-market theorem. The source's time-integrated n-claim fit (3.17) is a bookkeeping variant of `local_call_fit` and is left as a README target; I do not count it as an absent headline.

**Padding probe.** A scratch copy replaced each `sorry` by `first | (simp; done) | (norm_num; done) | rfl | (positivity; done) | (simp [the file's definitions]; done)`. All 17 theorems (lines 59, 117, 125, 138, 155, 183, 194, 199, 211, 220, 227, 243, 265, 303, 309, 345, 358 of the copy) ended in unsolved goals or "simp made no progress". No declaration restates a definition, mirrors a Check or computes a value; the 27 definitions are each used by a stated headline.

**README shape.** Checks per definition block: §1.1 4, §1.2 5, §1.3 5, §2.1 5, §2.2 3, §2.3 4, §3.1 5, §3.2 7, §3.3 6, §3.4 3, §4.1 5, §5.1 3, §5.2 3, §5.3 3. Every theorem carries hypotheses in the sentence and a locator; every layer ends with Examples and Dependencies; no LaTeX delimiters, process words, pull-request numbers or local paths (the word "removed" at `README.md:224` is the settlement identity, not narrative).

**Source sample.** The legal text is the April 1997 author preprint fetched earlier through the sources service from the coauthor's Stanford page (35 pages; cited below as `sircar-papanicolaou line N`). Its extraction has damaged glyphs but equation numbers, page markers and formula structure are legible.

| Target | Locator opened | Outcome |
| --- | --- | --- |
| 1.1 Clearing | §2.3, (2.6)–(2.11), pp.7–8, lines 536–705 | `G = D + ρΨ`, `G ≡ 1`, inverse from strict monotonicity and continuous first partials, Itô (2.8), `ψ_y = −G_y/G_x`, `G_x ≠ 0` "by strict monotonicity" (line 611). README's simple-root and Hessian hypotheses are its own strengthening, as stated. |
| 1.2 Feedback volatility | (2.22)–(2.24), pp.11–12, lines 1173–1356 | General `V(1−ρΨ)U′(V)/(VU′(V) − ρxΨ_x)` and the linear case independent of `β`; README's `σ_fb` and ρ=0 reduction (line 1297) match. |
| 1.3 Consistency | Proposition 1, p.11, lines 1098–1171 | "if and only if" for GBM income, `D = U(y^γ/x)`, `γ = σ/η`, negative square root chosen, `U′ > 0 ⟺ D_x<0, D_y>0`; README's full-quadrant analytic reading and its caution about one level set are faithful. Time-dependent `Q−L` form, p.12, lines 1357–1377. |
| 2.1 Finite claims | §2.6 and (2.27)–(2.28), p.13, lines 1439–1577; §2.7.2, pp.15–16, lines 1781–2005 | `1 − S₀⁻¹Σμ_jC_{j,x}` normalization (λ = 1/S₀); weights "could be generalized to depend on time, or be random processes" (line 1577); mixture `W_i = ∫C_i(x,t;K)ζ_i(K)dK`, slab recursion with terminal `Σ_{p>i}W_p + ∫ζ_i(K)(x−K)_+dK`, margin display with `−xζ(x)` (line 1979). |
| 2.2 Taper model | §2.6, p.13, line 1577; §5.2.2, pp.32–33, lines 4022–4076 | "soon-to-expire options are assumed not to contribute … within ε of their strike time" (lines 4073–4076); the smooth taper is correctly described as a model choice, not the article's rule. |
| 2.3 Cutoff slice and mixed kernel | §2.7.3, p.16, lines 2006–2061; (3.15)–(3.17), p.23, lines 2908–3158 | Full model with `C = C_BS` on `[T−ε,T]`, zero call boundary and far field; (3.15) with `ρ = μ/S₀`, forcing `xe^{−d_1(K_i)^2/2}Σ_j e^{−d_1(K_j)^2/2}/(2π(T−t))`; (3.16) prefactor carries an `a_ij (k+1)τ` factor (lines 3007–3009). |
| 3.1 Thresholds | §2.7.1, pp.14–15, lines 1703–1778 | ε defined by `min_x F_BS(x,T−ε̂) = 0`, root equation `N(σ√ε)+…=1/ρ`, independence of K, T, r, `ε ∼ const·ρ²`, and the claim that the same ε serves puts "by put–call parity" (lines 1769–1770). |
| 3.2 Perturbation | (3.1)–(3.9), pp.17–18, lines 2076–2456 | `L_BS C̄ = −xe^{−d_1^2}/(2π(T−t))`, transformation `x = Ke^y`, `t = T−2τ/σ²`, `C = Ke^{−(k−1)y/2−(k+1)^2τ/4}u`, `u(y,εσ²/2) = 0`, lower limit `√(ε/4τ)` in (3.9), `1−2v²` factors in the unsimplified exponent, positivity of M. |
| 3.3 Comparison and convexity | Theorem 4.1, Proposition 2, Lemmas 1–2, pp.24–26, lines 3201–3376 | Hypotheses `L_BS u ≤ 0`, `u(x,T) ≥ 0`, `u(0,t) ≥ 0`, `u ∼ U ≥ 0` at infinity; Proposition 2 says non-negative; Lemma 1's gamma equation; Lemma 2's vega equation `L_BS R = −σx²C_xx`. |
| 3.4 Price to market | §§2.3–2.4, pp.7–10, lines 517–721 | Source derives the pricing equation by the Black–Scholes hedging argument from (2.9); README states the converse as its own conditional theorem with M0.2–M0.3 hypotheses. |
| 4.1 Fitting | (3.10)–(3.12), pp.20–21, lines 2625–2789 | Objective, linearization `σ̂ = σ + ργ(t)`, quotient `∫C̄R/∫R²`, denominator `∼(T−t)^{3/2}`, numerator `∼D_1(T−ε−t)`, printed conclusion `γ ∼ D_2(T−ε−t)^{−1/2}` (lines 2763–2766); `r = 0.04` for the examples (line 2513) gives `k_BS = 0.5` as the README says. |
| 5.1 Log coordinates | (2.27), p.13; §5, pp.26–27, lines 3481–3537 | Transform `P = C − (x − Ke^{−r(T−t)})` and (5.2) with `1−ρ−ρP_x`, `1−ρ−ρ(P_x+xP_xx)`. |
| 5.2 Residual cash and weights | (5.1)–(5.4), pp.26–30, lines 3490–3924 | (5.4) baseline `1−ρ̃−ρ̃P_x` with `ρ̃ = ρ/n` and `P = ΣP_i` (lines 3861–3923). |
| 5.3 Positive asset identity | §5.1, pp.27–28, lines 3538–3560 | Simulation from (2.9) with GBM income `μ₁ = 0.15`, `η₁ = 0.3`; the README's exact exponential identity is its own derivation from §2.3, as stated. |

**Adversarial pass.** One row per Lean statement, definition or README convention; values on each side are computed (Python double precision for the numerics, exact algebra otherwise).

| Statement / location | Instances tried | Values on the two sides | Result; change |
| --- | --- | --- | --- |
| Spot-first convention, `README.md:24`, `Price` | `C(x,t) = x + 2t`, `f(s,τ) = C(s,T−τ)` | `C_t = 2`, `f_τ = −2` | agrees with M0's `Price`; none |
| `timeDeriv`, `priceDeriv`, `gamma`, `blackScholesResidual` | `C = x² + t`, `(1,0)`, `r = 0`, `σ = 1` | `C_t = 1`, `C_x = 2`, `Γ = 2`, residual `1 + 1·2/2·… = 2`; `C = x`: `Γ = 0`, residual 0 | matches `README.md:118`; none |
| `clearingMap`, `global_clearing` | `D = y/x, H = 0`, `y = 2`; `H = 1`; `H = −1/x` | root 2, `G_x = −1/2`; map ≡ 0, no root; margin 1 but `g → 1` at 0 so `y = 1/2` has no root | true; `hinfty` redundant (R01) |
| Flat-derivative control, `README.md:83` | `g = 1 + (x−1)³` | `g′(1) = 0`, limits 0, ∞ | correctly excluded by the margin; none |
| `linearFeedbackVolatility`, `linearFeedbackResidual` | `σ = x = 1, ρ = 1/10, C = x²` | `ν = 0.8/0.6 = 4/3`, diffusion term `16/9`; ρ=0 gives `σx` | matches (2.24) and `README.md:119`; none |
| `feedbackParabolicMargins` | same jet, `δ = 1/2`, `δ = 7/10` | margins `0.8, 0.6, 1.0`; `0.7 > 0.6` fails | matches; none |
| Third margin as gamma-derivative sign, `README.md:108`, `546` | `c = 0.8, xρΓ = 0.2`; `c = 1, xρΓ = −2` | `d/dΓ(AΓ) = c²(c+xρΓ)/d³ = 0.64/0.216 = 80/27`; `(1−2)/27 = −1/27` | formula verified by differentiation; none |
| General profile derivative, `README.md:100` | `U = 2z`, `V = h/2`, `U′ = 2` | `J′ = V − x𝓗_x/U′ = (1−𝓗−x𝓗_x)/2`; (2.22) gives `σxVU′/(VU′−x𝓗_x)` = linear formula at `U = d₀z` | agrees; none |
| `classicalConsistentDemand`, `demandRatioCondition` | `γ = 1, U = z, (2,3)` | `D = 3/2`, `D_x = −3/4`, `D_y = 1/2`, ratio `−2/3 = −γx/y` | matches `README.md:182`; none |
| `ratio_condition_characterizes_profile` | flow of `γx∂_x + y∂_y`; `U(z) := D(1, z^{1/γ})` | `y^γ/x` invariant; `U′(z) = D_y(1,z^{1/γ})z^{1/γ−1}/γ > 0` since `D_y = −γxD_x/y > 0` | true with `D_x < 0`, C¹ on the open quadrant; none |
| `profile_implies_ratio_condition` | `D = U(y^γ/x)` | `D_y/D_x = (U′γy^{γ−1}/x)/(−U′y^γ/x²) = −γx/y`, needs only `U′ ≠ 0` | true; none |
| One-level counterexample, `README.md:184` | `D = y/x + (y/x−1)² sin x` at `(1,2)` | on `y = x`: `D = 1`, ratio `−1`; at `(1,2)`: `D_y = 1 + 2 sin 1 ≠ 1` | supports the full-quadrant hypothesis; none |
| Time-dependent `Q−L`, `README.md:185` | `η = λ = 1`, `D = e^{y−x}` | `D_y/D_x = −1`; adding `t` to `Q` adds `D_t = e^{y−x+t}` | none |
| Observed-state hedge, `README.md:186` | `ν_X = (1,0)`, extra `(0,1)`; one risk `C_x = 1`, extra `2ν_X` | no multiple of `(1,0)` equals `(1,1)`; holding `1 + 2 = 3` | none |
| `strikeSmoothedCallPayoff`, `strikeSmoothedCall_gamma` | `ζ = 6(K−1)(2−K)` on `[1,2]`; `−ζ`; `ζ = 0` | mass 1, moment `3/2`, `h(3) = 3 − 3/2 = 3/2`, `h′(3) = 1`, `h″(3/2) = 3/2`; `−3/2`; 0 | signed identity true; `hζzero` unused (R01) |
| Aggregate gamma and varying weights, `README.md:240`–241 | weights `(1,2)`, gammas `(3,5)`; `a₁ = t`, `C₁ = 1` | `3 + 10 = 13`; `∂_t(a₁C₁) = 1 ≠ 0` | none |
| Taper `θ`, `w_i`, `README.md:247`, 257–258 | `s = 0, 1/2, 1`; midpoint derivative | `θ = 0, 1/2, 1`; `θ′(1/2) = (f′g − fg′)/(f+g)² = 8e^{−4}/(4e^{−4}) = 2`, so `w′ = −2/ε_i` | matches; none |
| Cutoff margin and demand switch, `README.md:296`, 299 | `ρ = 1/(2M_ε)`; `C_x = 1/2`, `ρ = 1` | `1 − ρM_ε = 1/2`; spot `2d₀Y^γ` versus `d₀Y^γ` | none |
| Mixed-kernel translation, `README.md:275`–281 | `a = 1.5, b = 0.7, y = 0.2, τ = 0.4, v = 0.4` | `e^{−(d_i²+d_j²)/2} = e^{−b²/(8s)}·single(y+b/2)` since `(y+aτ)²+(y+b+aτ)² = 2(y+b/2+aτ)² + b²/2`; simplified exponent `−1.0875186012` = single part `−0.3465029762` plus `−ab/4 − b²/(16τv²) = −0.7410156250` | formula verified; none |
| Exterior factor `q`, `README.md:298` | `a = b = 1, τ₀ = 1` | `q = e^{−1/2} = 0.6065`, so `qf ≠ f` at `τ₀` | source error confirmed; none |
| `callThresholdFunction` | `s = 1`; `s = 0`; `s = 3` | `g(1) = 1.0833154706`; totalized `1/2 + 0 = 1/2`; `g(3) = 1.0001273848 < 100/99` | matches `README.md:339`, 341; none |
| `g′`, limits, `README.md:330` | `s = 1`; `s = 10⁻⁴` | `g′ = −φ/s² = −0.2419707245` (numeric `−0.2419707246`); `s·g(s) = 0.39899 → 1/√(2π) = 0.39894` | none |
| `call_denominator_minimum` | `h(d) = N(d) + φ(d)/s`, `h′ = φ(d)(1 − d/s)`; `ρ = 0` | unique max at `d = s`; at `ρ = 0` both sides equal for every `d` | iff correctly guarded by `0 < ρ`; none |
| `call_critical_threshold`, `call_threshold_sign` | `ρ = 1/2`: `1 − g(1)/2 = 0.4583`; `ρ = 1`: `1 − g(1) = −0.0833` | `g` decreasing from ∞ to 1, so `1/ρ ∈ (1,∞)` has one root; `1 − ρg(σ√τ) > 0 ⟺ σ√τ > s ⟺ τ > s²/σ²` | true; none |
| Printed-parameter threshold, `README.md:340` | `ρ = 0.05`, `σ = 0.4`, `ε = 0.003` | `s* = 0.0204628616`, `ε_crit = 0.0026170544`, `min F = 0.0643244736` | matches; none |
| `put_critical_threshold`, `README.md:324`, 342 | `F_put = 1 − ρ(N−1) − ρφ/s`; `s = 1` | minimum `1 + ρ − ρg(s)`, zero iff `g(s) − 1 = 1/ρ`; `g(1) − 1 = 0.0833154706` | distinct from the call root; source's shared-ε claim is wrong (Source issues); none |
| `call_threshold_asymptotic` | `ρ = 10⁻², 10⁻³, 10⁻⁴` | `s*/ρ = 0.40095, 0.39914, 0.39896 → 0.39894` | none |
| Zero-spot location, `README.md:323` | `d₁ = s_σ` | `log(x*/K) = σ²τ − (r+σ²/2)τ = (σ²/2 − r)ε_crit` | none |
| `parameterCylinder` | `ρ₀ = 1, T = 2, ε = 1`; `(0,1,1/2)`; `t = 1`, `x = 0` | in; out | none |
| `discountedCash`, `normalizedLogPrice` | `k = r = 1, τ−t = 1`; `r = 0`, `C = k + ax` | `e^{−1}`; `V = a`, `V_z = 0`; without subtraction `V = ke^{−z} + a` unbounded | none |
| Cash conjugation, `README.md:352`, 354 | `C = ℓ + e^zV`, `ℓ′ = rℓ` | `C_x = V + V_z`, `xC_xx = V_z + V_zz`, `L_BS C = e^z[V_t + (σ²/2)V_zz + (r+σ²/2)V_z]` | identity verified; none |
| `feedback_first_variation_on_cylinder` | ratio `(1−ρC_x)/(1−ρC_x−ρxC_xx)`; affine family | `dA/dρ|₀ = 2xC⁰_xx`, so `L_BS C¹ = −σ²x³(C⁰_xx)²`; affine: `0 = 0` | sign and factor correct; C³ supplies the mixed derivatives; none |
| Scalar forcing value, `README.md:407` | `σ = x = 1`, `C = x²` | `−1·1·4 = −4` | none |
| `finiteFeedbackResidual`, `finite_feedback_first_variation` | gammas `(2,3)`, weights `(1,2)`, `x = σ = 1`; empty `ι` | `dA/dρ|₀ = 2xΣw_jΓ_j = 16`, forcings `−2·8 = −16`, `−3·8 = −24`; empty family: baseline residual, vacuous conclusion | matches `README.md:407`; none |
| `feedback_implicit_function_solution` | `terminal ≡ a`, `k`, `r = 0`; `|ρa| ≤ 1/2` | `F = k + ax` solves, margins `1 − ρa ≥ 1/2`; at `ρ = 0` the equation is the drifted heat equation for V with bounded smooth data | non-vacuous, hypotheses carry `0 < σ`, `0 < ε < T`, bounded derivatives; none |
| `callD1`, `callPrice`, `callGamma`, `callVega` | `K = σ = τ = x = 1`, `r = 0`; `x = Ke^{−1/2}` | `d₁ = 1/2`, price `0.3829249225`, `Γ = 𝒱 = 0.3520653268`; `d₁ = 0`, `Γ = e^{1/2}/√(2π) = 0.6577`, `𝒱 = e^{−1/2}/√(2π) = 0.2420` | matches `README.md:408`; none |
| Heat transform of `L_BS`, `README.md:373`–376 | `C = Ke^{αy+βτ}u`, `α = −(k−1)/2`, `β = −(k+1)²/4` | `u_y` coefficient `2α − 1 + k = 0`, `u` coefficient `−β + α² − α + k(α−1) = 0`, so `L_BS C = −(σ²/2)Ke^{…}(u_τ − u_yy)`; with `d₁² = (y+aτ)²/(2τ)` the forcing is `(2πτ)^{−1}e^{−y²/(2τ) − a²τ/4 − ay/2}` | (3.7) verified; none |
| Duhamel evaluation, `README.md:379` | Gaussian inner integral, `A = τ−s`, `B = 2τ−s` | exponent `s(y−aA)²/(4AB) − y²/(4A) − a²s/4 = −(2y² + 2asy + a²sτ)/(4B) = −(y + as/2)²/(2B) − a²s/8`; prefactor `(2πs)^{−1}(4πA)^{−1/2}√(4πsA/B) = 1/(2π√(sB))` | agrees with (3.8) and the README's simplified form; none |
| `callCorrection` substitution, `README.md:381`–383, 410 | `s = 2τv²`, `τ = 1`, `v = 1/2` | `ds = 4τv dv = 2 dv`, `√(s(2τ−s)) = 2τv√(1−v²)`, prefactor `1/(π√(1−v²)) = 2/(π√3)`; limits `√(τ₀/2τ) = √(ε/(2τ_cal))` to `1/√2` | Lean lower limit `√(ε/(2τ))` matches; none |
| `call_correction_equation` | `τ = ε` | equal endpoints, integral 0; PDE by the two previous rows | true; none |
| `call_correction_expiry` | `x = K`; `x ≠ K` | integrand `→ 1/(π√(1−v²))`, `∫₀^{1/√2} = arcsin(1/√2)/π = 0.25`, prefactor `→ K`; Gaussian factor `→ 0` | `K/4` and 0 as stated; none |
| `noncompact_comparison` barrier, `README.md:416`, 447 | `σ = 1`, `β = c = 0`, `p = 1`, `λ = 4`; `λ = 2` | `L B = e^{4(T−t)}(−3x² − x⁻²) < 0`; `λ = 2` gives `+x⁻²` | barrier works; exponential change `w = e^{c(T−t)}v` removes `c`; second-derivative test needs only the stated pointwise differentiability | true; none |
| Comparison controls, `README.md:448` | `u = T − t`; `u = t − T` | operator `−1`, terminal 0, `u ≥ 0`; operator `+1` violates the hypothesis | none |
| Convex gamma equation, `README.md:418`, 449 | differentiate `L_BS C = 0` twice; `h = x²`, `r = 0` | `Γ_t + (σ²x²/2)Γ_xx + (2σ²+r)xΓ_x + (σ²+r)Γ = 0`; `C = x²e^{σ²(T−t)}`, `Γ = 2e^{σ²(T−t)}` | README sign `+(σ²+r)` correct; source Lemma 1 prints `σ² − r` (Source issues); none |
| Vega equation | `∂_σ` of `L_BS C = 0` | `L_BS 𝒱 = −σx²C_xx` | matches Lemma 2; none |
| Lognormal weight bound, `README.md:427`, 450 | `σ = 1, r = 0, M = 1`, `b = −1/2` | `S_u e^{±Mz} = e^{(±Mb + σ²M²/2 − r)u}e^{±Mz}`, exponents `0` and `1` | `c_M` formula verified; none |
| UI endpoint, `README.md:452` | `f_n = n·1_{[0,1/n]}` | a.e. limit 0, integrals 1 | UI required, as stated; none |
| `leastSquaresFirstVariation` | `C¹ = 𝒱 = e^{−x}`; `𝒱 = 0` | `(1/2)/(1/2) = 1`; totalized `0/0 = 0` | excluded by the fit hypotheses; none |
| `callFitObjective`, `local_call_fit` | `J(ρ,s) = ∫(F_ρ − C_BS(s))²` | `∂_sJ(0,σ) = 0`, `∂_ssJ(0,σ) = 2∫𝒱² > 0`, `∂_ρ∂_sJ = −2∫C¹𝒱`, so `fit′(0) = ∫C¹𝒱/∫𝒱²`; decay `min(x⁴,x⁻²)` and Gaussian vega make all integrands L¹ | quantifiers (`a`, `b` before `fit`, `M` after) correct; none |
| Squared dominator, `README.md:526`, 528 | `min(x⁸, x⁻⁴)`; `x/cosh(3 log x)` | `1/9 + 1/3 = 4/9`; `2x⁴/(1+x⁶) ∼ 2x⁴, 2x⁻²` | none |
| `callFitVariation`, `call_fit_cutoff_limit` | `K = σ = ε = 1`, `r = 0` | `C¹ ≈ (τ−ε)σ²x³Γ_ε²` from zero trace and the forcing; numerator `0.0918881492 = 1/(2π√3)`, denominator `0.59719 = e^{3/4}/(2√π)`, slope `0.15387 = e^{−3/4}/√(3π)` | positive finite slope; source's `(T−ε−t)^{−1/2}` fails here; none |
| Log-coordinate identities, `README.md:544`, 554 | `C = x²`, `v = e^{2z}` | `e^{−2z}(v_zz − v_z) = 2 = C_xx`; `e^{−2z}v_zz = 4` wrong | none |
| Rank-one Jacobian, `README.md:546`, 555–556 | `c = x = 1`, `q = (0.1,0.1)`, `Γ = (1,1)`; `Γ = 0`; `c = 1`, `xqΓ = −2` | `J = AI + 2xc²Γqᵀ/d³`, `d = 0.8`, `A = 25/16`, second eigenvalue `c²(c+xq·Γ)/d³ = 1.2/0.512 = 75/32`; `J = AI`; `d = 3`, eigenvalue `−1/27` | none |
| Residual cash coordinates, `README.md:562`, 570–571 | `r = 0, K = 1, C = x`; `n = 2, ρ = 1/10` | `P = 1`, residual 0; baselines `0.9` (`q = ρ/n`), `0.8` (`q = ρ`), printed `0.95` | source (5.4) error confirmed; none |
| Exact positive path, `README.md:581`, 591 | `γ = η₁ = σ = 1`, `μ₁ = 1/2`; `C = ax` | `Y^γ` exponent `σ(μ₁/η₁ − η₁/2)t + σW_t = W_t`; inverse `z/(1−ρa)`, none at `ρa = 1` | none |
| Asset coefficients, `README.md:34`–36 | `ψ(y) = y²`, `μ₁ = η₁ = 1` | `b_X = 2y² + y²`, `ν_X = 2y²` | matches (2.8); none |

## Not verifiable

- **Full analytic proofs.** The nonlinear Hölder-space implicit-function theorem, the weighted decay estimates behind `hdecay`, the system inverse estimates of §5.1 and the full-market theorem of §3.4 are specifications. I checked their routes, their inputs at the pins and their diagnostic instances, not proofs.
- **Raster-only detail of (3.16).** The exterior factor of the source's (3.16) is legible only as an `a_ij (k+1)τ` prefactor in the damaged extraction (`sircar-papanicolaou line 3007`–3009); I did not read the typeset page. The README's own convolution-derived kernel is verified independently above.
- **Published version.** Only the April 1997 author preprint was read; the journal version's numbering was not compared.

## Source issues

- **Error** in sircar-papanicolaou at §2.3, printed page 8: the source says strict monotonicity of G makes its price partial derivative nonzero; it should be a separate simple-root hypothesis; affects the proof.
- **Error** in sircar-papanicolaou at §2.7.1, printed page 14: the source says choosing ε so that the denominator's minimum is zero gives well-posed starting data; it should be a strictly positive margin, since the equation degenerates at the threshold slice; affects a stated result.
- **Error** in sircar-papanicolaou at §2.7.1, printed page 15: the source says the same smoothing parameter serves put options by put–call parity; it should be the distinct put root equation, since the put delta is negative; affects a stated result.
- **Misprint** in sircar-papanicolaou at §2.7.2, printed page 15: the source says the call price at zero spot equals the discounted strike; it should be zero, the discounted strike being the put boundary; affects a stated result.
- **Misprint** in sircar-papanicolaou at §2.7.2, terminal-margin display, printed page 16: the source says the bracket subtracts spot times the density; it should add it, by differentiating the mixture payoff; affects a stated result.
- **Error** in sircar-papanicolaou at §3.2.1 after (3.12), printed page 21: the source says the fitted correction diverges like the inverse square root of the time to the cutoff; it should vanish linearly with a positive finite slope at fixed ε; affects a stated result.
- **Error** in sircar-papanicolaou at (3.16), printed page 23: the source says each mixed convolution carries an extra exponential time factor outside the integral; it should not, since that factor changes the forcing at the cutoff; affects a stated result.
- **Gap** in sircar-papanicolaou at Theorem 4.1, printed pages 24–25: the source says a pointwise nonnegative far-field asymptotic suffices for the noncompact minimum principle; it should be an explicit growth class with a barrier; affects the proof.
- **Misprint** in sircar-papanicolaou at Lemma 1, printed page 25: the source says the twice-differentiated equation has zero-order coefficient σ² minus r; it should be σ² plus r; affects a stated result.
- **Misprint** in sircar-papanicolaou at Lemma 2, printed page 26: the source says the terminal condition is on W; it should be on the vega R being differentiated; affects nothing.
- **Error** in sircar-papanicolaou at (5.4), printed page 30: the source says the transformed baseline is one minus the per-claim weight ρ/n; it should be one minus the total active weight when the residuals are summed; affects a stated result.
- **Gap** in sircar-papanicolaou at §5.2.2, printed page 33: the source says soon-expiring hedges stop contributing within ε of expiry; it should specify the demand, cash and asset transition across that cutoff; affects the proof.
