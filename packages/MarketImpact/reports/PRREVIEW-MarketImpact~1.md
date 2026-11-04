# Review of MarketImpact (pull request #1655 at ce99715)
Folder: `TauCetiRoadmap/FinancialMathematics/MarketImpact/`

**Verdict:** needs changes

Independent AI review. The roadmap is repairable: its principal mathematical scope extends the financial foundation rather than replacing it. There are 10 findings, including 3 blocking P2 findings. The build passes, but the supplied gate fails.

## R01 (P2) — Exclude zero feedback from uniqueness of the minimizer

**Location:** `TauCetiRoadmap/FinancialMathematics/MarketImpact/README.md:192`: “The unique minimizer is `d₁=s_σ`”. The standing convention at line 15 allows `ρ≥0`; `0<ρ<1` appears only in the subsequent root theorem.

**Claim:** The minimum of the displayed call denominator has a unique location under the preceding hypotheses.

**Witness:** Set `ρ=0`, `σ=K=τ=1`, `r=0`. At both `x=1` and `x=exp(1/2)`, the denominator is 1. Indeed it is 1 at every positive spot.

**Repair:** Require `ρ>0` for the unique-minimizer assertion. Keep the minimum-value formula at `ρ=0`, and add the constant-denominator case as a negative-control Check. For positive ρ, differentiation gives `F′(d)=ρφ(d)(d/s_σ−1)`, with exactly the claimed sign change; for zero ρ this derivative is identically zero. This repair handles the counterexample without narrowing the root theorem's valid range.

## R02 (P2) — Remove computational procedures from the roadmap's scope

**Location:** `TauCetiRoadmap/FinancialMathematics/MarketImpact/README.md:205`: “The following algorithm must terminate even when a midpoint is exactly the root.” Also M5.1–M5.3, lines 315–380, and `Suggested.lean:191`–208.

**Claim:** Completion includes a dyadic search and certified bisection, a nonlinear grid solver, seeded path simulations, and reproduction outputs.

**Witness:** Line 205 prescribes midpoint evaluation and bracket replacement; line 366 requires a pseudorandom generator, seed, solver tolerance and reported computed outputs. These are executable procedures, beyond mathematical background or small Checks.

**Repair:** Remove these procedural completion requirements and their Lean stencil declarations. Retain the analytic threshold theorem, log-coordinate identities, ellipticity, and relevant mathematical estimates. Treat small values as Checks. The threshold remains characterized uniquely by `g(s)=1/ρ` without the mesh or bisection; the six-month example still has `εcrit≈0.0026170544`. This is blocking under the brief's explicit mathematics-only scope principle, not a criticism of numerical mathematics itself.

## R03 (P2) — State the missing headline results and identify genuinely missing carriers

**Location:** `TauCetiRoadmap/FinancialMathematics/MarketImpact/Suggested.lean:10`–13 and 80–173; README M3.1, M3.3 and M4, especially lines 185–199 and 299–312.

**Claim:** The Lean file serves as the acceptance test for the roadmap's end theorems.

**Witness:** There is no threshold-root theorem, noncompact comparison theorem, fitting/minimizer theorem, or fixed-ε cutoff-limit theorem. The docstring names no unstatable headline. A scratch threshold statement using native Gaussian CDF/density elaborates with only `sorry`.

**Repair:** Add the statable headlines on their actual objects, including M3.1's positive critical root and M4's local fit/cutoff result; audit the remaining headlines listed below. Use a few genuine native-carrier definitions, not a free predicate. Name each genuinely unstatable theorem and its missing carrier in the module docstring. Distinguish the existing smooth-data scalar existence specialization from the full Hölder-space, finite-claim/taper theorem. For the cutoff witness `K=σ=ε=1,r=0`, the required limiting quotient is `exp(−3/4)/sqrt(3π)≈0.1538663228`, whereas quotient nonnegativity alone says nothing about this limit.

## R04 (P3) — Replace the forbidden import block

**Location:** `TauCetiRoadmap/FinancialMathematics/MarketImpact/Suggested.lean:1`–8.

**Claim:** The acceptance file depends on another roadmap module and seven Mathlib submodules.

**Witness:** The gate reports `imports=1`, `mathlib-subimports=7`, and `no-import-mathlib=1`. The first import is `TauCetiRoadmap.FinancialMathematics.Suggested`.

**Repair:** Use the single `import Mathlib` and only individual implemented `TauCeti.*` modules actually consumed. Remove the roadmap import; express the necessary simple price/derivative definitions on native real-function carriers, or consume an implemented library adapter if available. Do not copy the parent's theorem catalogue. A scratch copy using exactly `import Mathlib`, the required namespace and five simple native price/derivative definitions elaborated with only the five expected `sorry` warnings. Apply that import repair to the actual file and re-run the gate; successful elaboration of the existing forbidden imports does not discharge it.

## R05 (P3) — Replace the commit-pinned roadmap supplier link

**Location:** `TauCetiRoadmap/FinancialMathematics/MarketImpact/README.md:403`: “fixed public contract”.

**Claim:** PDE F27 is supplied through a commit-pinned repository link as well as a relative path.

**Witness:** The gate's `blob=1` is this link. PDE F27.1–F27.6 exist on main at `TauCetiRoadmap/PDE/README.md:356`–524.

**Repair:** Delete the fixed-commit link and cite PDE, Lane F, F27.1–F27.6 by section and relative path. The heat inverse at main line 430 and spatial-weight contract at line 513 still provide the required inputs; no historical snapshot is necessary.

## R06 (P3) — Repair the TeX outside code spans

**Location:** `TauCetiRoadmap/FinancialMathematics/MarketImpact/README.md:21`, 134–136, 177, 215, 240–246 and 256.

**Claim:** These passages use unescaped TeX-like subscripts/superscripts and multiline single-backtick formulas.

**Witness:** The gate reports `tex=22`. In particular, the aggregate PDE at lines 134–135 and convolution integrals at 240–246 span lines inside single backticks.

**Repair:** Use Unicode prose and single-line code spans or indented formula blocks. Preserve the signs and constants: in the convolution substitution, `s=2τv²` gives `ds=4τv dv` and prefactor `1/(πsqrt(1−v²))`. Re-run the scanner after formatting.

## R07 (P3) — Clear the third-derivative scanner collisions

**Location:** `TauCetiRoadmap/FinancialMathematics/MarketImpact/README.md:21`, 215 and 358.

**Claim:** The gate reports three `residue` failures.

**Witness:** All three reported passages contain `C_{xxx}`. Here `xxx` denotes a third spatial derivative, not an unfinished `XXX` marker; these are false positives for process residue.

**Repair:** Render the derivative as `Cₓₓₓ`, consistently with the Unicode rule, and similarly clean the adjacent derivative notation. Retain the third-derivative obligation: the example `C=x³` gives `Cₓₓₓ=6`, whereas a second-order norm alone does not supply that derivative. No mathematical obligation should be deleted to satisfy this scanner.

## R08 (P3) — Supply the required definition APIs, Checks and local dependencies

**Location:** `TauCetiRoadmap/FinancialMathematics/MarketImpact/README.md:1`–408, beginning with the clearing definitions at lines 33–44.

**Claim:** The prose is a complete roadmap specification in the required form.

**Witness:** There are no `**Checks.**` lists or `*Needs:*` lines; the file lacks the required Scope and ownership, Exact supplier contracts, How to read the build, layer Examples/Dependencies, and Downstream consumers structure.

**Repair:** Reshape the existing content into the specified layers without deleting its general mathematics. Give each kept definition its API and at least three discriminating Checks, and put dependencies at the target that uses them. For clearing, use `D=y/x,H=0` (root x=y), `H=1` (no positive root for y>0), and `x(1−H)=1+(x−1)³` (strictly increasing, endpoints 0 and infinity, but derivative zero at x=1) to separate existence, range and simple-root conditions. Put existing library/roadmap ownership in the supplier contracts, including the implemented Gaussian APIs listed below. No formal dependency gap was detected by the mechanical check.

## R09 (P3) — Remove Lean padding and restore the acceptance-file form

**Location:** `TauCetiRoadmap/FinancialMathematics/MarketImpact/Suggested.lean:18`, 60–87, 151–163 and 175–208.

**Claim:** The file's declarations are headline statements and definitions needed by them.

**Witness:** The zero-feedback theorem is explicitly substitution and its proof is a simplification. The quotient-sign theorem concerns arbitrary functions. The aggregate and stencil definitions feed no headline theorem in this file. The namespace is `FinancialMathematics.MarketImpactSuggested`.

**Repair:** Delete `feedback_zero_parameter_substitution` and `leastSquaresFirstVariation_nonneg` from `Suggested.lean`; keep their mathematical content in README Checks/API. Delete unused definitions, including stencil definitions and the unused aggregate/log-residual block, unless needed by an actual retained headline. Use `TauCetiRoadmap.MarketImpact`, the required module docstring and layer comments, mathematical docstrings on every declaration, and README coverage of every retained Lean name. Do not replace padding with proofs in place. The two deleted facts remain true: at zero feedback volatility is `σx`; for `C1=vega=exp(−x)` the quotient is `(1/2)/(1/2)=1`. None of the five admitted theorems closed under its one-`simp` probe; they are not reported as one-tactic padding.

## R10 (P3) — Make the source edition and target locators independently recoverable

**Location:** `TauCetiRoadmap/FinancialMathematics/MarketImpact/README.md:405`–408 and the page-only references throughout, for example line 389's “p33”.

**Claim:** Readers can recover the cited statements from the two reference entries.

**Witness:** The notes have no author, date, edition or retrievable identifier. The legal author preprint has 35 pages: Proposition 1 is on printed page 11, not 32. Many new targets, including M3.2's IFT, have no claim-level source locator.

**Repair:** Identify the notes and paper version precisely, record the two works in `sources.toml`, and provide theorem/equation/section plus printed-page locators for each target. Cite the April 1997 author preprint explicitly where that is the version used, with a notes-page concordance if useful. Describe new adapters/strengthenings as such and cite their actual inputs instead of implying that the paper proves the nonlinear existence and weighted estimates. The 15 source checks below locate matching content, but do not certify the unavailable notes' physical pagination.

## Verified sound

The entire 408-line README and 210-line Lean file were read. The review covered the seven theorem declarations (five admitted, two proved), 24 definitions/abbreviations, the main construction and analytic targets, and the stated source corrections. Numerical rows below are diagnostic instances, not proofs of the full analytic theorems. Inapplicable ring/prime/group tests were replaced by the relevant zero feedback, zero gamma, empty finite family, zero denominator, maturity endpoint, and unbounded-domain tests.

The read-only diff contains only the two new MarketImpact files and the authorized parent README navigation change. MarketImpact is a new folder, not a replacement roadmap. No `set_option`, admitted data, admitted example or copied narrative passage was found. Mathematical formula transcriptions are identified as source assertions; their lengthy repetition is unnecessary for acceptance, but is not evidence of copied prose.

The worker gate reports:

`blob=1 tex=22 residue=3 imports=1 mathlib-subimports=7 no-import-mathlib=1; build=0, depcheck=0; FAIL`.

Here `build=0` means no build failure. All reported failing rule classes are addressed in R04–R07; the three residue hits are explained in R07. The independent `lake env lean` run of the actual file exited 0 with exactly five `sorry` warnings. A scratch copy with `#check @name` for all **31** declarations also elaborated. No section binder was silently dropped: there is no standing `variable` block, and finite-family declarations retain their universe and `Fintype` parameter. The first-variation signature does not assume global parabolic margins, but its denominator is 1 at ρ=0, so a pointwise derivative there does not need them. Its “positive-parabolicity cylinder” docstring overstates the signature; the theorem itself has no detected counterexample.

All five sorried declarations were tried with one `simp` each on a scratch copy. Each remained unsolved. Separately, the missing critical-root signature elaborated with `import Mathlib` and native `ProbabilityTheory.cdf`, `gaussianReal` and `gaussianPDFReal`; this establishes statability, not truth by elaboration.

The dependency check, run with the supplied order, movable placement and content repository, returned exactly:

```text
depcheck: 205 roadmaps, 1501 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. There are no declared supplier gaps. There are also no `*Needs:*` lines to resolve, which is the local-specification defect in R08, not evidence of a cycle.

The four supplier families were resolved as follows:

| Supplier | Text actually inspected | Resolution |
| --- | --- | --- |
| FinancialMathematics on main | `TauCetiRoadmap/FinancialMathematics/README.md:11`, 29, 45, 57; price notation in `Suggested.lean:17`–25 | M0.1–M0.4 supply trading, variable-coefficient density/representation, admissibility and Black–Scholes. Spot-first convention agrees. M3.4 retains the necessary full-horizon conditions. |
| PDE on main | `TauCetiRoadmap/PDE/README.md:356`, 406, 433, 461, 493, 513 | All six F27 contracts exist. The stated higher norms, BUC traces and logarithmic-weight derivatives are supplied. The open PDE revision is not used to substitute for main. |
| StochasticCalculus at the supplied open head | `TauCetiRoadmap/StochasticCalculus/README.md`, Layers 3 and 5; §9.6 at line 3043 | Itô/integration and Euler's precise half-Hölder-in-time, Lipschitz, growth and L² hypotheses are present. Exponentiating an Euler approximation still needs the consumer's moment estimates; the generic log-state rate alone is not an X-rate proof. |
| StandardDistributions on main | `TauCetiRoadmap/StandardDistributions/README.md:349`–357 | Layer 2 includes error-function derivatives, symmetry/limits and Gaussian CDF/tails. Several of these have already landed at the Tau Ceti pin; use those declarations below. |

Ownership searches used `roadmaps grep` across main/open heads for feedback, gamma-square forcing, noncompact comparison, F27, geometric Brownian motion, and the distinctive Lean names, plus direct object searches in the pinned libraries and board packages. No competing owner or fully qualified name collision was found for the feedback construction, mixed forcing, or fixed-cutoff fit. FinancialMathematics explicitly leaves endogenous feedback here (`README.md:3`, 73); PDE owns the generic heat inverses; StochasticCalculus §9.6 explicitly leaves model-specific schemes/calibration to its consumer. That existing allocation does not override this review's mathematics-only restriction. The discounted lognormal potential is a model adapter to Gaussian semigroup theory, not ownership of a new generic probability law. Main FinancialMathematics, StandardDistributions and PDE were also used to compare roadmap organization.

Pinned declarations opened (Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`):

| Declaration(s) | Repository-relative file and line | Relevant contract |
| --- | --- | --- |
| `ContDiffAt.implicitFunction`, `contDiffAt_implicitFunction` | `Mathlib/Analysis/Calculus/ImplicitContDiff.lean:55`, 90 | Nonzero differentiability order and invertible partial derivative; local, not global root existence. |
| `HasStrictFDerivAt.implicitFunctionOfProdDomain`, derivative theorem | `Mathlib/Analysis/Calculus/ImplicitFunction/ProdDomain.lean:89`, 107 | Derivative is negative inverse partial composed with parameter partial; no nonvanishing follows from strict monotonicity alone. |
| `MeasureTheory.UniformIntegrable`, `.unifIntegrable` | `Mathlib/MeasureTheory/Function/UniformIntegrable.lean:72`, 90 | Uniform small-set control plus a uniform finite Lp bound; its API also supplies a.e. strong measurability. |
| `MeasureTheory.tendsto_Lp_finite_of_tendsto_ae` | same file, line 507 | Finite measure, `1≤p≠∞`, measurable sequence, `MemLp` limit, uniform integrability and a.e. convergence. Zero limit and p=1 meet the endpoint argument's requirements. |
| `eLpNorm_one_eq_lintegral_enorm` | `Mathlib/MeasureTheory/Function/LpSeminorm/Defs.lean:125` | Requires a.e. strong measurability. |
| `integral_norm_eq_lintegral_enorm`, `integral_nonneg_of_ae` | `Mathlib/MeasureTheory/Integral/Bochner/Basic.lean:537`, 639 | Native norm integral and positivity; real integrals are totalized, so a positive quotient alone does not establish an integrable fitting model. |
| `ProbabilityTheory.cdf`, `cdf_eq_real` | `Mathlib/Probability/CDF.lean:56`, 81 | Stieltjes-valued CDF; equality with half-line measure requires a probability measure. |
| `gaussianPDFReal`, `gaussianReal` | `Mathlib/Probability/Distributions/Gaussian/Real.lean:47`, 220 | Variance is NNReal; zero variance is a Dirac measure while the density is zero. All normal tests here use variance one. |
| `Real.exp_bound`, `pi_gt_d20`, `pi_lt_d20` | `Mathlib/Analysis/Complex/Exponential.lean:516`; `Mathlib/Analysis/Real/Pi/Bounds.lean:190`, 206 | The exponential bound requires `abs x≤1` and positive Taylor order. The two π bounds are exact rational inequalities. |
| `TauCeti.Probability.integral_Iic_gaussianPDFReal`, `cdf_gaussianReal_eq`, `cdf_gaussianReal_zero_one`, `measureReal_Ioi_gaussianReal` | `TauCeti/Probability/Distributions/Gaussian/Cdf.lean:95`, 115, 122, 135 | Existing integral normalization, CDF and tail bridge. General formulas require nonzero variance. |
| `TauCeti.Real.erf_neg`, `hasDerivAt_erf`, `deriv_erf`, `tendsto_erf_atTop`, `tendsto_erf_atBot` | `TauCeti/Analysis/SpecialFunctions/Erf.lean:72`, 92, 97, 156, 163 | Existing symmetry, derivative and endpoint limits; no need to rebuild error-function theory here. |
| `TauCeti.Probability.logNormalMeasure`, `logNormalMeasure_zero_var`, moment theorems | `TauCeti/Probability/Distributions/LogNormal.lean:102`, 117, 280, 289 | Existing exp pushforward and finite natural moments, including the degenerate variance boundary. The time-indexed discounted potential/weighted adapter remains additional work. |

Headline inventory and acceptance coverage:

| README headline | Present in Lean? |
| --- | --- |
| Local/global clearing and actual asset coefficients; conditional observable-state equilibrium equivalence | No; neither stated nor identified as unstatable. |
| Global ratio/profile characterization | Both directions present with explicit smoothness/nonzero derivative hypotheses. |
| Finite-claim smoothing, aggregation and expiry compatibility | Only the strike-payoff second derivative is present; aggregate definitions have no theorem. |
| Exact critical smoothing threshold, signs and asymptotics | Absent; positive-root statement demonstrably statable. |
| Local nonlinear solution, uniqueness, smooth dependence and quadratic remainder | A smooth-terminal scalar existence specialization is present; uniqueness, full finite-claim/taper result and norm remainder are absent. |
| Scalar/finite-claim first variations and corrected convolution | Scalar pointwise differentiation is present; finite-claim and convolution headlines absent. |
| Noncompact comparison, convex potential representation, nonlinear-derivative identification and vanilla endpoint | Absent. Classical scalar comparison is expressible with native functions/derivatives; stochastic/weighted carriers require a named docstring audit. |
| PDE-to-admissible-market theorem | Absent; docstring should identify unavailable market/strategy carriers rather than silently omitting it. |
| Local least-squares minimizer, quotient variation, fixed-ε positive cutoff limit | Only sign of an arbitrary quotient is present. This is not the fitting theorem. |
| Numerical convergence and reproduction | Not present as theorems; remove procedural scope under R02. |

Source sample: the worker supplied no target identifiers (“none found by heading”). To avoid treating that as an empty audit, a reproducible fallback used Python's `Random(3466162521)` (hex `ce997159`) to sample 15 of 20 explicit source-linked target groups: clearing, Itô, profile, feedback, general profile, random weights, strike basket, aggregate, threshold, first variation, heat, kernel, fitting, mixed forcing, mixed kernel, convexity, cutoff, normalization, statistics, experiments. The 15 selected groups and inspected locators follow. The legal text is the April 1997 author preprint, fetched through the sources service from the coauthor's [Stanford author archive](https://math.stanford.edu/~papanico/pubftp/feedback.pdf). The originally cited Princeton URL returned HTTP 403. All line references below are `sircar-papanicolaou` extraction lines, not notes pages.

| Selected target | Source locator opened | Outcome |
| --- | --- | --- |
| Clearing | §2.3, p.8, lines 544–611 | The paper's monotonicity/C¹ shortcut really occurs. Roadmap adds simple-root and spatial-Hessian hypotheses. |
| Random weights | §2.6, p.13, lines 1567–1577 | Only an extension remark, not the roadmap's observable-state hedge theorem. |
| Threshold | §2.7.1, pp.14–15, lines 1703–1778 | Root equation and zero-denominator prescription match. Strict positive margin is an additional correction. |
| Strike basket | §2.7.2, p.15, lines 1781–1836 | Call payoff is paired with the nonzero put boundary in the source. |
| Profile | Proposition 1, p.11, lines 1091–1130, 1230–1256 | Source assumes demand derivative signs and compares the limiting PDE; the roadmap makes the full-quadrant ratio condition explicit. |
| Feedback | (2.23)–(2.24), p.12, lines 1259–1355 | Linear-demand fraction, square and drift cancellation match. |
| Itô | (2.8), p.8, lines 567–603 | Drift, half-Hessian term and diffusion signs match once regularity is supplied. |
| Mixed kernel | (3.16), p.23, lines 2963–3088 | Exterior factor is printed; its initial-forcing mismatch is reproduced below. |
| Convexity | Theorem 4.1/Proposition 2, pp.24–25, lines 3194–3290 | Proposition 2 says nonnegative, not universally positive. The roadmap's explicit growth/UI conditions are additional hypotheses. |
| Mixed forcing | (3.15), p.23, lines 2908–2962 | Factor ρ/n and sum over all gammas match. |
| Aggregate | §2.7.2, p.16, lines 1839–2005 | Scalar equation and settlement recursion match; terminal-margin sign needs the stated correction. |
| Normalization | §3.3 p.22 lines 2873–2902; §5.2 pp.29–30 lines 3815–3924 | The conflicting weight conventions and baseline factor are present. |
| Fitting | (3.10)–(3.12), pp.20–21, lines 2625–2778 | Quotient matches; printed fixed-cutoff negative-half-power asymptotic does not. |
| First variation | (3.1)–(3.3), p.17, lines 2080–2156 | Negative gamma-square forcing and zero cutoff trace match. |
| Experiments | Figs.3.3/5.1–5.5, pp.21,28–32, lines 2785–2789, 3708–3718, 3782–3787, 3839–3842, 3930–4021 | Percentages and grids are recorded observations, not universal bounds. Unavailable notes pagination remains uncertified. |

Additional source reading covered the single heat convolution (3.7)–(3.9), pp.17–18, lines 2157–2455; the cutoff remark, p.33, lines 4068–4076; the sample-statistic window, p.27, lines 3630–3683; and the printed price-discrepancy sum, p.28, lines 3740–3761. The extraction's window inequalities and missing normalization differ from the README's “source-form” wording; without the actual notes version I do not certify its literal transcription. Proposition 1 is supported by its surrounding global limiting-PDE interpretation; the counterexample to a single-level interpretation is not by itself an erratum in that reading. The paper explicitly distinguishes its price-coordinate transform from put–call parity in footnote 8, p.27, lines 3680–3683; that is not a newly discovered error in the paper.

**83 adversarial rows** follow. “Retain” means the displayed diagnostic agrees; it is not a claim that a full unformalized existence proof has been completed. Every Lean definition and theorem is represented, and additional rows cover the sampled groups, headline results, conventions and findings.

| Statement / location | Instances tried | Values on the two sides / diagnostic | Result; change |
| --- | --- | --- | --- |
| Spot-first/calendar convention, README 15 | C(x,t)=x+2t; f(x,τ)=C(x,T−τ) | Cₓ=1, Cₜ=2; fₓ=1, fτ=−2 | Retain; reversal sign matters. |
| Income/asset distinction, 9,25 | ψ(y)=y²; μ₁=η₁=1 | Itô drift=2y²+y²=3y²; diffusion=2y²; log drift=1 | Retain; asset drift is not μ₁. |
| Local clearing / implicit derivative, 36 | D=y/x,H=0 at x=y=2 | Gₓ=−1/2,Gᵧ=1/2; −Gᵧ/Gₓ=1=ψᵧ | Retain; inverse-sign model gives −1. |
| Simple-root negative control, 36–38 | G=1+(x−1)³−(y−1), at (1,1) | Gₓ=0; inverse branch 1+cuberoot(y−1) not differentiable | Corrected hypothesis excludes it. |
| Global crossing/multiplier, 38 | D=y/x,H=0,m=x; y=2 | G endpoints ∞,0; Φ=y−x endpoints 2,−∞; root2; Φₓ=−1=xGₓ | Retain; H=1 gives no positive root. |
| Fixed supply extension, 38 | y=2,D=y/x,s=2 | root x=1; D(1,2)=2 | Retain; unit-supply root2 would be wrong. |
| Linear clearing, 40–44 | d₀=γ=1,C=x,ρ=1/4,y=3 | x(1−ρ)=3 gives x=4; D+ρCₓ=3/4+1/4=1 | Retain. |
| `Demand`, `Profile`, consistent demand | γ=2,U(z)=3z,x=2,y=4 | y^γ/x=8; D=24; U≡0 gives D=0 | Native function carriers; derivative signs must be hypotheses. |
| `demandRatioCondition`, both profile theorems | preceding positive example | Dᵧ=12,Dₓ=−12; ratio=−1=−γx/y; U′=3>0 | Both directions agree; U≡0 yields 0/0=0≠−1. |
| Coverage of market-level iff, M1.3 | D=y/x+ε(x−1)B(x,y), B a smooth compact bump equal1 near (1,2), zero near y=x; ε sufficiently small | On y=x, D=1; at (1,2), Dᵧ/Dₓ=1/(−2+ε), whereas −x/y=−1/2 | Retain full-quadrant ratio hypothesis; a single clearing level is insufficient. Small ε preserves the derivative signs. |
| General profile inverse/derivative, 56–62 | U(z)=2z,H=1/4 constant | V(3/4)=3/8; J′=3/8; (VU′−xHₓ)/U′=(3/4)/2=3/8 | Retain; value outside J must be excluded. |
| Time/state primitive compatibility, M1.3 | η(y)=y,λ(x)=2x,Ũ=e^(2u) | Q−L=log y−(log x)/2; D=y²/x; Dᵧ/Dₓ=−2x/y=−λ/η | Retain; integration constants/time derivatives cannot be dropped. |
| Implicit Hessian, M1.3 | G=x−y² at root x=y², y=2 | ψᵧ=4; ψᵧᵧ=2=−(−2)/1 | Retain; the zero Hessian model fails. |
| Observed-state hedge, M1.3 | νX=2,νΞ=3,C=x+ξ | exposure=5; holding=1+3/2=5/2; aνX=5 | Retain; delta alone produces2. |
| Multi-risk span, M1.3 | νX=(1,0), extra exposure=(0,1) | target exposure=(1,1); aνX=(a,0) never equal | Retain rank/parallelism condition. |
| Risk-adjusted observed generator, M1.3 | r=0,bX=4,νX=2,bΞ=5,νΞ=3 | κ=2; bΞ−κνΞ=−1; raw drift5 differs | Retain; observability alone does not remove income drift. |
| `linearFeedbackVolatility`, 24 | σ=x=1,C=x²,ρ=.1 | c=.8,d=.6; ν=4/3; at ρ=0,ν=1 | Retain; totalized d=0 gives0 and is excluded from market assertions. |
| `linearFeedbackResidual`, 28 | r=0,σ=1,C=x, then C=x² at x=1,ρ=.1 | affine residual0; quadratic residual16/9 | Retain; not every smooth function solves the PDE. |
| Gamma-direction parabolicity, README 66–70 | c=.8,xρΓ=.2 | derivative of AΓ=80/27>0; if c=1,xρΓ=−2, derivative=−1/27 | Three margins exclude the wrong-sign domain. |
| `feedbackParabolicMargins`, 44 | x=1,ρ=.1,C=x²,δ=.5 | c=.8,d=.6,e=1 all ≥.5; δ=.7 fails d | Retain; denominator nonzero alone is not sufficient. |
| `parameterCylinder`, 50 | ρ₀=1,T=2,ε=1 | (ρ,x,t)=(0,1,.5) in; t=1 or x=0 out | Retain; empty T≤ε excluded in existence theorem. |
| `discountedCash`, 53 | k=2,r=0, then r=1,τ−t=log2 | values2 and1; derivative in t equals r times cash | Retain. |
| `normalizedLogPrice`, 57 | C=cash+3x at x=e^z | V=3,Vz=Vzz=0; omitting cash gives cash/e^z+3 | Retain; boundedness fails at −∞ without subtraction. |
| Normalized derivatives, README 213 | V=sin z, cash=0,z=0 | Cₓ=V+Vz=1; xΓ=Vz+Vzz=1 | Retain; Cₓ is not merely Vz for general z. |
| `weightedAggregateDelta`, 60 | claims x,2x²; q=(1,2),x=1 | H=1+2·4=9; empty family0 | Retain; weights are not silently normalized. |
| `weightedAggregateGamma`, 64 | same | Hₓ=0+2·4=8; empty family0 | Retain. |
| `multiClaimFeedbackVolatility`, 68 | empty family; or one x² with q=.1,x=σ=1 | ν=1; ν=4/3 respectively | Scalar/empty reductions agree. |
| `multiClaimFeedbackResidual`, 74 | empty family and affine C=x, r=0 | residual0; empty family with C=x²,x=σ=1 gives1 | Retain; no vanished diffusion for empty market. |
| `feedback_zero_parameter_substitution`, 81 | any jet; σ=x=1,Γ=2,Ct=−1,r=0 | feedback residual −1+1=0; BS residual0 | True boundary substitution; delete padding, R09. |
| `strikeSmoothedCallPayoff`, 166 | triangular continuous ζ=max(1−abs(K−2),0), x=2 | payoff1/6; derivative1/2; at x=.5 payoff0 | Retain; signed ζ is allowed by Lean. |
| `strikeSmoothedCall_gamma`, 169 | same compact ζ, vanishing K≤0 | h″(2)=1=ζ(2); h″(.5)=0=ζ(.5); negate ζ gives −1=−1 | Lean generality is signed-density identity, not a positivity claim. |
| Aggregate PDE with fixed/time-varying weights, README 132–140 | Ci=x, a(t)=t, r=0 | aggregate tx has Ct=x; sum a·LiCi=0; missing term a′Ci=x | Retain explicit inhomogeneous term for varying weights. |
| Maturity recursion/settlement, 139–147 | two payoffs (x−1)+ and (x−2)+, r=σ=0,x=3 | immediately before first maturity aggregate3; afterward1; removed payoff2 | Piecewise identity valid; continuity is not implied. |
| Smooth taper, 151 | θ at0,1/2,1 | 0,1/2,1; w at T−ε,T−ε/2,T is1,1/2,0 | Retain; hard removal instead jumps from1 to0. |
| Hard-cutoff clearing, 182 | d₀y^γ=1, C=x,ρ=1/2 | active root2; no-demand root1 | Confirms need for a separate transition model. |
| Call minimizer, 188–196 | ρ=0,σ=τ=K=1,r=0 | F(1)=F(e^.5)=1, all spots minimize | Fails uniqueness; R01. |
| Positive call minimum/root, 192–196 | ρ=.05,σ=.4 | s*=.02046286163; εcrit=.002617054413; at ε=.003 Fmin=.06432447356 | Retain positive-ρ formula and printed-parameter qualification. |
| Call threshold boundary, 196 | at root, and ρ=1 | Fmin(root)=0; at ρ=1 any finite s gives1−g(s)<0 | Retain; zero denominator is not a parabolic starting slice. |
| Put threshold, 198 | same call-critical s*,ρ=.05 | Fput,min=Fcall,min+ρ=.05; not0 | Retain distinct root equation. |
| Threshold asymptotic/derivative, 196,203 | s→0; s=1 | s·g(s)→1/sqrt(2π); g′(1)=−φ(1)=−.2419707245 | Retain; leads to σ²εcrit~ρ²/(2π). |
| Root enclosure mathematics, 205 | upper endpoint3,ρ=99/100 | g(3)=1.00012738477<100/99=1.01010101010; width6·2^-40≈5.457e−12 | Bounds agree; delete procedure, R02. |
| `feedback_implicit_function_solution`, 128 | terminal≡a,k arbitrary,r=0 | F=k+ax solves; normalized V=a; all margins1−ρa; δ=1/2 if abs(ρa)≤1/2 | Nonvacuous example; oscillatory bounded terminal sin z also meets datum hypotheses. |
| Zero-feedback normalized heat conjugation, README 215 | V=e^(λz−At), A=.5σ²λ²+(r+.5σ²)λ | normalized residual0; translation W=V(y+b₀t,t) gives Wt+.5σ²Wyy=0 | Retain drift sign; constants give0 on both sides. |
| Finite-product IFT derivative, 159,215 | n=2,ρ=0 | diagonal operators (LBS,LBS); off-diagonal derivatives0 | Correct base operator; full inverse estimates remain proof targets. |
| Quadratic remainder, 221 | affine exact family independent ofρ | V¹=0, remainder0≤Cremρ² | Retain; no inference of an ε-uniform radius. |
| `feedback_first_variation_on_cylinder`, 110 | baseline jet C=x² at x=1,σ=1; affine jet | ∂ρ[(ν²/2)Γ] at0=4, so LBS C¹=−4; affine gives0 | Sign/factor correct; hSmooth carries third derivatives. |
| Multi-claim first variation, README 227 | x=σ=1, Γ=(2,3), w=(1,2) | aggregate gamma8; forcings −16 and−24 | Retain cross terms; self-squares alone give−4,−18. |
| Single taper factor, 229 | w=0 then w=1, same Γ=2 | forcing0 then−4 | Retain; untapered equation is not universal. |
| Heat transformation/forcing, 233–239 | aBS=0,y=0,τ=1 | transformed forcing1/(2π); zero initial correction0 | Signs and scaling agree with source (3.7). |
| Gaussian convolution / Jacobian, 240–248 | aBS=y=0,τ=1,s=.5,v=.5 | ds/dv=2; integrand after substitution1/(πsqrt(.75)); same as transformed original | Retain finite endpoint interpretation. |
| Mixed kernel exponent, 175–177 | aBS=1.5,b=.7,y=.2,τ=.4,v=.4 | raw exponent−1.08751860119; simplified exponent−1.08751860119 | Retain corrected algebra. |
| Exterior mixed-kernel factor, 177 | preceding aBS,b,τ₀=.1; U(τ₀)=0 | q=.9488543211; required forcing f versus qf; residual−.0511456789 f | Confirms source error; omit exterior factor. |
| Convex gamma PDE, 258 | r=0,σ=1,h=x² | Γ=2e^(T−t); Γt=−Γ; reaction+Γ cancels; original BS operator would give−Γ | Retain differentiated operator. |
| Vega equation, 258 | same h at general σ | C=x²e^(σ²(T−t)); vega=2σ(T−t)C; LBS vega=−2σC=−σx²Γ | Retain; affine h=x gives vega0. |
| Bounded/noncompact comparison barrier, 256 | β=c=0,σ=1,p_g=1,λ=4 | Lback B=e^(4(T−t))(−3x²−x^-2)<0 | Retain; u=x growth dominated by η(x²+x^-2) at both ends. |
| Extended potential/non-affine growth, 265–277 | h=x, then h=x²,r=0,σ=1,d=T−t | P_x=0; P_(x²)=4x³e^(2d)(e^d−1)>0 | Finite polynomial example; no nonlinear bounded-delta family inferred for x². |
| Gaussian semigroup weight estimate, 267 | r=0,σ=1,M=1 | S_u(e^z+e^-z)=e^z+e^u e^-z≤e^u(e^z+e^-z) | Retain cM=1; u=0 equality. |
| Duhamel/composition convention, 267 | r=0,f(x)=x, constant forcing | S_u f=x; S_uS_v f=x=S_(u+v)f; potential=(T−t)x | Retain discount/time direction. |
| UI endpoint passage, 269,273 | f_n=n·1_(0,1/n), uniform probability | f_n→0 a.e., integrals1≠0; UI fails | Correctly requires UI, not just a.e. convergence. |
| Unsmoothed vanilla endpoint, 275 | K=5,y=0; fixed y≠0 | 5·arcsin(1/sqrt2)/π=1.25; off-strike Gaussian limit0 | Retain K/4 boundary layer; continuous zero terminal trace would fail. |
| Full-market bridge, 281 | H=0,d₀=γ=1,Y GBM | χ(z)=z,X=Y,νX=η₁X; delta/bond for C=x are1,0 | Correct baseline; extra independent filtration risk is excluded by M0.2. |
| Decaying residual weight, 289 | weighted residual W=1 | R=x/cosh(3log x)=2x⁴/(1+x⁶); asymptotics2x⁴ and2x^-2 | Retain up-to-constant bounds; unweighted V=1 instead gives R=x∉L²(0,∞). |
| Fit Hessian/quotient, 291–295 | C1=2v, v=e^-x on x>0 | denominator1/2; numerator1; γ*=2; Hessian2·(1/2)=1 | Correct projection normalization; v=0 gives no nondegenerate minimizer. |
| `leastSquaresFirstVariation`, 40 | C1=v=e^-x; then v=0 | ratio1; totalized0/0=0 | Definition is not itself an analytic fit. |
| `leastSquaresFirstVariation_nonneg`, 152 | previous nonzero example, then C1=0 | 1≥0; 0≥0 | True but not headline; R09. |
| Fixed-ε cutoff limit, 299–312 | K=σ=ε=1,r=0,T>1 | numerator1/(2πsqrt3)=.09188814924; denominator e^.75/(2sqrtπ)=.59719467887; ratio .15386632281>0 | Correct finite positive slope; source negative-half-power divergence fails this regime. |
| Joint regime caveat, 179,197 | ε=cρ² | ρ²/ε=1/c, not0; near-critical ρxΓ is order1 | Correctly does not infer joint uniformity from fixed-ε IFT. |
| `logFeedbackFactor`, 176 | C=x²,z=0,q=.1 | uz=2,uzz=4; numerator.8²,denominator.6²; A=16/9 | Matches original spot ratio. |
| `logFeedbackResidual`, 181 | same,r=0,σ=1,ut=0 | .5·(16/9)·(4−2)=16/9 | Matches spot residual; empty index set gives unique empty function. |
| `logFeedbackAdvection`, 189 | r=0,σ=1,A=2 | b=−1, not+1 | Correct backward-generator convention; unused definition, R09. |
| Rank-one gamma Jacobian, README 333 | x=1,c=1,q=(.1,0),Γ=(1,0) | A=100/81; J diagonal(1100/729,100/81); distinguished eigenvalue1.1/.9³=1100/729 | Retain for n≥1; do not interpret n−1 multiplicity when n=0. |
| `centeredSecondDifference`, 192 | u(j)=j²,j=0,Δ=1; Δ=0 | (1−0+1)/1=2; totalized denominator0 gives0 | Correct stencil on Δ>0; remove procedural definition. |
| `centeredFirstDifference`, 198 | u(j)=j,j=0,Δ=1 | (1−(−1))/2=1; u(j)=j² gives0 | Correct; remove procedural definition. |
| `upwindFirstDifference`, 195 | u(j)=j²,j=0,Δ=1,b=±1 | forward1 for b=1; backward−1 for b=−1 | Correct backward generator sign; remove procedural definition. |
| `stabilizedLogGenerator`, 202 | Δ=a=B=1,b=−1,r=0,u=j²,j=0 | (1+.5)·2+(−1)·0=3; off-diagonals1 and2≥0 | Mathematics agrees; remove scheme scope. |
| `implicitBackwardResidual`, 207 | Δt=1,next=2,current=3,generator=1 | (2−3)+1=0; wrong time sign gives2 | Correct convention; remove procedural definition. |
| Price-coordinate transform, README 338–350 | n=2,ρ=.2,Pi=0 | equal ρ/n weights: baseline.8; per-claimρ weights:.6; printed1−ρ/n=.9 | Confirms normalization discrepancy and no put–call symmetry. |
| Log Euler positivity, 354–358 | Xn=1,b=0,ν=1,Δt=1,Z=−2 | log scheme e^-2>0; additive Euler1−2=−1 | Positivity test agrees; not a proof of global rate after exponentiation. |
| Exact pathwise inverse, 358–360 | γ=2,η₁=1,μ₁=1,σ=2,ρ=0 | Zt=Z₀exp(t+2Wt); Yt²=Y₀²exp(t+2Wt) | Drift/exponent correct; initial clearing fixes Z₀. |
| Return variance/radicand, 368–372 | N=2,R=(1,3),Δt=1; R=(2,2) | 10−16/2=2 equals centered sum2; constant returns0 | Retain mathematical statistic; N=1 must stay excluded. |
| Return indexing, 372 | Δt=.001 | strict right-endpoint i<199 gives198; left-endpoint i−1<199 gives199 | Arithmetic correct; literal notes window not certified. |
| Finite price-error statistic, 374–380 | prices(2,4), comparisons(1,3) | mean absolute relative error(.5+.25)/2=.375; zero price invalid | Well-defined declared statistic; not a certified literal transcription. |
| Source observations, 366 | grids4:.1:6 and3:.2:7 | 21 points each, mean strike5; source path pairs .446/6.6%, .464/22%, .442/9.6% | Observation scope preserved; no universal stochastic bounds follow. |

## Not verifiable

- **MATH5695 notes, physical pages 27–46.** No author/date/edition or accessible identifier is supplied. The sources service could not resolve the cited title; searches for the course and notes found course descriptions, not the text. `math5695-notes` remains in the consolidated missing-reference file. Its pagination, claimed duplicate pages and literal window inequalities cannot be certified. This review is completed rather than parked.
- **Full analytic proofs.** The nonlinear Hölder IFT, weighted remainder estimates, arbitrary convex-potential subclasses, system/discrete inverse estimates and full-market construction are specifications, not proved results at this head. I checked their stated routes and diagnostic cases, but neither source retrieval nor the five `sorry` elaborations proves them. In particular, higher derivative radii are not automatically uniform in derivative order or ε.
- **Raster-only details.** The author preprint's extracted text has damaged font encodings. Equation identifiers, terms and printed page markers used above were readable, but I have not certified every plotted ordinate or every glyph of the long unsimplified kernels from images. No error is attributed solely to an ambiguous extraction glyph.

## Source issues

These refer to the inspected April 1997 author preprint, not an unverified published-page concordance. The mathematical witnesses are in the adversarial table; references to source lines appear in the source audit above.

- **Error** in sircar-papanicolaou at §2.3, printed page 8: the source says strict monotonicity ensures a nonzero partial derivative; it should be a separate simple-root hypothesis; affects the proof.
- **Gap** in sircar-papanicolaou at §2.3, equations (2.8)–(2.11), printed page 8: the source says first spatial derivatives suffice before using second derivatives and time differentiation; it should be appropriate time and second-spatial regularity; affects the proof.
- **Gap** in sircar-papanicolaou at §2.6, printed page 13: the source says weights may be random processes without a new state or hedge contract; it should be specified dynamics, observability and exposure-spanning conditions; affects a stated result.
- **Error** in sircar-papanicolaou at §2.7.1, printed page 14: the source says the minimum-zero smoothing prescription supplies well-posed starting data; it should be a strictly positive denominator margin with an existence argument; affects a stated result.
- **Misprint** in sircar-papanicolaou at §2.7.2, printed pages 15–16: the source says a call basket has a discounted-strike boundary at zero spot; it should be zero call boundary; affects a stated result.
- **Misprint** in sircar-papanicolaou at §2.7.2, terminal-margin display, printed page 16: the source says the integrated density is reduced by spot times density inside the bracket; it should be their sum; affects a stated result.
- **Error** in sircar-papanicolaou at equation (3.16), printed page 23: the source says multiply each mixed convolution by an additional time-dependent strike factor; it should be the convolution without that exterior factor; affects a stated result.
- **Error** in sircar-papanicolaou at §3.2.1 after equation (3.12), printed page 21: the source says the fitted correction diverges with exponent negative one-half at fixed cutoff; it should be linear vanishing with positive finite slope for fixed positive smoothing; affects a stated result.
- **Gap** in sircar-papanicolaou at Theorem 4.1, printed pages 24–25: the source says a pointwise far-field asymptotic suffices for noncompact comparison; it should be an explicit uniform growth or boundary-at-infinity condition; affects the proof.
- **Error** in sircar-papanicolaou at equation (5.4), printed page 30: the source says the transformed aggregate baseline is one minus the per-claim averaged weight; it should be one minus total active weight under the stated sum convention; affects a stated result.
- **Gap** in sircar-papanicolaou at §5.1 discrepancy display, printed page 28: the source says sum over indices starting at the calibration endpoint without a finite upper limit; it should be an explicitly bounded sample set and specified normalization; affects a stated result.
- **Gap** in sircar-papanicolaou at §5.2.2, printed page 33: the source says soon-expiring hedges cease contributing without specifying the market transition; it should be a demand, cashflow and asset-evolution rule across cutoff; affects the proof.
