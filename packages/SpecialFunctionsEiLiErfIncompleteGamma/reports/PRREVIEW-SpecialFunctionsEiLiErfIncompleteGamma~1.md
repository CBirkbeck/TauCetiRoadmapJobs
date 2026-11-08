# Review of SpecialFunctionsEiLiErfIncompleteGamma (pull request #1924 at 3bdb9db)

**Verdict:** needs changes

:robot: AI-assisted review (Claude Opus 5.5). Source ids `DLMF-<n>` below are the sources-service extractions of `https://dlmf.nist.gov/<n>` (DLMF Version 1.2.8, release 2026-09-15); "line N" is the line of that extraction. Library declarations are cited at the pins of `lake-manifest.json`.

## R01 (P1) — `upperIncompleteGamma_eq_mellinBarnes` is false at `z = 0`

- **Location:** `TauCetiRoadmap/SpecialFunctionsEiLiErfIncompleteGamma/Suggested.lean:360`: "`(a : ℂ) {z : ℂ} (hz : |arg z| < π / 2) {c : ℝ} (hc : 0 < c) (hca : -a.re < c)`"; README 3.3 (line 601).
- **Claim:** DLMF 8.6.11 under `|ph z| < π/2` (DLMF-8.6 lines 492–497). DLMF's `ph z` presupposes `z ≠ 0`, but Mathlib has `arg 0 = 0`, so `hz` admits `z = 0`.
- **Witness:** `a = 1`, `z = 0`, `c = 1` satisfy all hypotheses. `0 ^ (−(1 + iy)) = 0`, so the right side is `0`. The left side is `upperIncompleteGamma 1 0 = ∫₀^∞ e^{−t} dt = 1`. A Lean `example` proving all three elaborates against the file.
- **Repair:** replace `hz` by `(hz : 0 < z.re)`. That excludes `z = 0`, and the repaired signature elaborates. In README 3.3, write "`Re z > 0`" for 8.6.10–8.6.11.

## R02 (P1) — 9.7: `R_n(x) = O(n⁻¹)` does not hold uniformly on `[−π, π]`

- **Location:** README.md:1085: "`R_n(x) = O(n⁻¹)` uniformly on `[−π, π]` (6.16.4)".
- **Claim:** this transcribes DLMF 6.16.4 (DLMF-6.16 lines 153–179), which is wrong at the endpoints (see Source issues).
- **Witness:** at `x = π`, every term of `S_n(π) = ∑ sin((2k+1)π)/(2k+1)` is `0`, while `½ Si(2nπ) → π/4`. So `R_n(π) = −½ Si(2nπ) → −π/4`. The kernel `1/sin t − 1/t` of 6.16.3 is unbounded at `t = ±π`.
- **Repair:** state 6.16.4 as "for each `0 < a < π`, `R_n(x) = O(n⁻¹)` uniformly for `|x| ≤ a`". Integrating by parts once, with `g = 1/sin t − 1/t` and `g′` bounded on `[−a, a]`, proves it. Taking `a = π/2` still gives `S_n(π/(2n)) → ½ Si(π)`. Add the negative-control Check `R_n(π) → −π/4`.

## R03 (P2) — The pinned libraries already have results this roadmap lists as owned

- **Location:** README.md:98: "the determinant formula for the continuants | 4.1". README.md:103: "Rouché's theorem, from the argument principle, … | 13.3–13.4". README.md:141: "Mathlib has no error function, exponential integral, incomplete Gamma…".
- **Claim:** the table at lines 95–104 lists results "which neither Mathlib nor Tau Ceti provides".
- **Witness:**
  - Mathlib `GenContFract.determinant` (Mathlib/Algebra/ContinuedFractions/Determinant.lean:64) is the general determinant formula.
  - Tau Ceti `TauCeti.rouche` and `TauCeti.rouche_symm` (TauCeti/Analysis/Complex/Conformal/Rouche.lean:294, 259) are Rouché's theorem.
  - Mathlib `Complex.partialGamma` (Gamma/Basic.lean:146) is `γ(s, X)`.
- **Repair:**
  - Delete both table rows.
  - Under From Mathlib, cite `GenContFract.determinant` and let 4.1 consume it. `nums_mul_dens_sub` (Suggested.lean:386) is its negative: delete it from Suggested.lean.
  - Under From Tau Ceti, cite `TauCeti.rouche` and `rouche_symm`, and let 13.3–13.4 consume them.
  - Replace "no … incomplete Gamma" with `Complex.partialGamma` and `partialGamma_add_one` (Basic.lean:187).
  - In 1.4, add the bridge `lowerIncompleteGamma s x = Complex.partialGamma s x` for `Re s > 0`, `x ≥ 0`. Its needs include `TauCeti.ofReal_lowerIncompleteGamma_eq_partialGamma` (IncompleteGamma.lean:292).

## R04 (P2) — Two owners of the complex error function and of the continued `Γ(a, ·)`

- **Location:** README.md:145: "No other roadmap defines a complex error function, an exponential, sine or cosine integral, or a complex incomplete Gamma function."
- **Claim:** this roadmap is the only owner.
- **Witness:** QSeriesPartitionsAndMockModularForms is an open pull request, earlier in the merge order. Its README.md:846 owns the entire function `E(w) = 2∫₀ʷ e^{−πt²} dt = erf(√π w)`. Its README.md:1235 builds the upper-bank continuation of `Γ(1−k, −2w)` on the slit plane.
- **Repair:** name QSeriesPartitionsAndMockModularForms §5.3 and §8.4 in Scope and ownership, and settle one owner. Either:
  - (a) place this roadmap, with AsymptoticExpansions and SpecialFunctionsParabolicCylinder, before QSeries in the merge order (nothing here uses QSeries), so that QSeries cites `Complex.erf` and `upperIncompleteGammaLog`; or
  - (b) record QSeries's functions as its kept variants and add two identifications as targets here: `E(w) = erf(√π w)`, and `H_k(w) = e^{−w} upperIncompleteGammaLog (1−k) (log(2w) + πi)` for `w > 0`.

  Also correct the sentence for AutomorphicLFunctionsAndLocalFactors, whose adapter `AL0.negativeEi r = −∫_r^∞ e^{−t}/t dt` (its README line 846) is `−E₁(r)`.

## R05 (P2) — Missing hypotheses in 4.3 and 9.5

- **Location:** README.md:709: "the Padé bounds 8.10.5–8.10.6 for `n = 1, 2`;". README.md:710: "8.10.7–8.10.8;". README.md:1070: "Prove the alternating remainder property: the remainder after `n` terms has the sign of…".
- **Claim:** 4.3 states these "for real parameters and `x > 0`", and 9.5 states the remainder property for every `c_k` and `s_k`.
- **Witness:**
  - 8.10.5 at `a = 2`, `x = 2`: `A₁ = x/(x+1−a) = 2`, but `x^{−1}eˣΓ(2, x) = (1+x)/x = 1.5`.
  - The integral `I` of 8.10.7 diverges for `a ≤ 0`.
  - For `c₀`, `α = 0·π = 0`, so `1/α` is undefined.
- **Repair:**
  - Require `a < 1` for 8.10.5–8.10.6 (DLMF-8.10 line 182).
  - Require `a > 0` for 8.10.7 and `a ≥ 0` for 8.10.8, with `a = 0` as a limit (lines 252, 285).
  - State the 9.5 remainder property for `k ≥ 1` for `c_k` and `k ≥ 0` for `s_k`.
  - Add `a = 2`, `x = 2` as a negative-control Check.

## R06 (P2) — Layer 6 (zeros of `γ*`) can be stated at the pins but is missing from Suggested.lean

- **Location:** README.md:787–811 (Layer 6, scope item 6). Suggested.lean has no Layer 6 declaration, and its docstring names no unstatable headline.
- **Claim:** Suggested.lean states the roadmap's headline theorems.
- **Witness:** the zero count of 6.1 uses only `tricomiIncompleteGamma`, which the file already defines. The statement `(∃! x : ℝ, x < 0 ∧ tricomiIncompleteGamma a x = 0) ∧ ∃! x : ℝ, 0 < x ∧ tricomiIncompleteGamma a x = 0`, for `1 ≤ n` and `−2n < a < 1 − 2n`, elaborates against the file.
- **Repair:** add a Layer 6 section with:
  - the 6.1 counts for cases (a) and (b) of DLMF §8.13(i) (DLMF-8.13 lines 71–81);
  - the 6.2 trichotomy at `x*_n`: two simple zeros, one double zero, no zero.

## R07 (P3) — The gate fails on readme-ids-missing (14)

- **Location:** README.md:341–348, 364–368, 424, 441, 546, 925 and 1407, e.g. "`Complex.Gamma_add_one`", "`erf_neg`", "`Real.erf_erfInv`".
- **Claim:** these are library citations.
- **Witness:** all 14 exist at the pins, e.g. `Complex.Gamma_add_one` (Gamma/Basic.lean:312). The gate reads `Complex.`/`Real.` as this roadmap's own namespaces, which Suggested.lean declares. It reads bare names such as `erf_neg` by their stems.
- **Repair:**
  - Write `TauCeti.Real.erf_neg`, `TauCeti.lowerIncompleteGamma_add_one` and `TauCeti.regularizedGamma_natCast` in full.
  - For the eleven `Complex.*`/`Real.*` library names, do one of two things: rename the file's local namespaces so they no longer coincide with Mathlib's `Complex` and `Real`, or pin each name with a `#check @…` line (`#check` is allowed for pinning a library declaration).
  - Rerun the gate.

## R08 (P3) — Targets that restate theorems already in Tau Ceti

- **Location:** Suggested.lean:710 `regularizedIncompleteBeta_eq_incompleteBeta`, :721 `regularizedIncompleteBeta_natCast`, :519 `tendsto_sinIntegral_atTop` and :254 `hasSum_tricomiIncompleteGamma`; README.md:1474, 1478, 1012 and 1090.
- **Claim:** these targets are owned here.
- **Witness:** on a scratch copy, one tactic closes three of them:
  - an `exact` of `TauCeti.regularizedIncompleteBeta_def_of_mem_Icc` closes the first;
  - an `exact` of `TauCeti.Probability.sum_Icc_choose_mul_pow_eq_regularizedIncompleteBeta` closes the second (`0 < m` goes unused);
  - a `simpa` on `Complex.hasSum_regularizedHGFun` closes the fourth.

  6.2.14 is `TauCeti.Contour.tendsto_integral_sin_div_atTop`.
- **Repair:**
  - Delete the four declarations from Suggested.lean.
  - In 15.1, mark 8.17.2 and 8.17.5 as Tau Ceti's and not restated, as is already done for 8.17.4 and 8.17.20. Their homes are IncompleteBeta.lean:110 and Probability/Distributions/Binomial/Tail.lean:134.
  - In 9.1, get `Si(x) → π/2` from `TauCeti.Contour.tendsto_integral_sin_div_atTop` (Contour/WorkedExamples/HalfDisc/SineIntegral.lean:351). This also removes the line-1090 route through 6.5.5, which is a forward reference to 9.3.
  - Cite `Complex.hasSum_regularizedHGFun` (RegularizedHypergeometric.lean:53) in 1.1's needs.

## R09 (P3) — Padding in Suggested.lean

- **Location:** Suggested.lean:244 `differentiable_tricomiIncompleteGamma_right`, :586 `dawson_neg`, :260 `tricomiIncompleteGamma_neg_natCast`, :343 `upperIncompleteGamma_natCast_add_one`, :513 `expIntegralEi_eq_zero_bounds`, :677 `iteratedErfc_zero`.
- **Claim:** these are acceptance-test statements.
- **Witness:**
  - The probe closes the first with one `exact` built on Mathlib's `analyticOnNhd_regularizedHGFun_of_card_le`.
  - It closes `dawson_neg` with `simp [dawson, intervalIntegral.integral_neg]`.
  - The other four are special values or boundary cases: `a = −n`, integer `a`, ten digits of `x₀`, and `n = 0`.
- **Repair:** delete all six from Suggested.lean and keep them in the README as targets and Checks. `F(−z) = −F(z)` is also SpecialFunctionsParabolicCylinder §5.1's Check.

## R10 (P3) — Unused definitions, and a docstring that describes a catalogue

- **Location:**
  - Suggested.lean:13: "The statements here suggest Lean forms for particular subsections, so that contributors and reviewers converge on names and signatures".
  - README.md:217: "The full list of bodies is in `Suggested.lean`."
- **Claim:** Suggested.lean is the acceptance test, and the README is definitive.
- **Witness:** no theorem uses 15 of the 42 definitions: `regularizedGammaQ`, `fresnelTail`, `fresnelAuxF`, `fresnelAuxG`, `goodwinStaton`, `sinIntegralTail`, `cosIntegralCin`, `cosIntegral`, `sinhIntegral`, `coshIntegral`, `sinIntegralAuxF`, `sinIntegralAuxG`, `generalizedCosIntegral`, `generalizedCosIntegralTail`, `voigtH`.
- **Repair:**
  - Write these bodies into the README Conventions.
  - Delete them from Suggested.lean.
  - Rewrite the module docstring to say that it states the headline theorems against the pins, and either that every headline can be stated at the pins or which ones cannot.

## R11 (P3) — Statements narrower than what holds and what DLMF states

- **Location:**
  - README.md:878: "8.19.23 on `slitPlane` for `Re p > 1` along the ray".
  - README.md:1169: "7.2.2 holds for `erfc` as `∫_z^∞` along the horizontal ray for `|ph z| < π/4` and for real `z`".
  - README.md:577: "8.6.3 for `Re a > 0` and `Re z > 0`".
- **Witness:**
  - DLMF 8.19.23 requires only `|ph z| < π` (DLMF-8.19 line 1131).
  - On the horizontal ray, `|e^{−(z+s)²}| = e^{y²−(x+s)²}` is integrable for every `z`.
  - 8.6.3 at `a = 1`, `z = −1 + i`: `z∫₀^∞ e^{−t−ze^{−t}} dt = 1 − e^{−z} = γ(1, z)`.
- **Repair:**
  - Drop the `Re p > 1` restriction on 8.19.23.
  - State 7.2.2 along the horizontal ray for every `z`.
  - State 8.6.3 for every `z`; DLMF-8.6 line 150 requires only `Re a > 0`.

## R12 (P3) — 8.11.6–8.11.7: the cited source covers fixed `λ` only

- **Location:** README.md:757: "uniformly for `λ` in compact subsets of the stated intervals"; also line 129.
- **Witness:** DLMF-8.11 line 292 states the expansions with `λ` fixed and says nothing about uniformity.
- **Repair:** either state 8.11.6–8.11.7 for fixed `λ`, or cite a source and locator for the uniform version and make uniformity a separate target.

## R13 (P3) — Definitions with fewer than three Checks

- **Location:** README.md:1020–1023 (9.1: six functions, three Checks), :1176–1181 (11.1: nine functions, four Checks) and :1450–1453 (14.3).
- **Witness:** `coshIntegral` has no Check. `sinhIntegral`, `fresnelTail` and `goodwinStaton` have one each. `fresnelAuxF` and `fresnelAuxG` share one. `voigtH` and `expIntegralELog` have none.
- **Repair:** add discriminating Checks, for example:
  - `Chi(x) = Ci(ix) − πi/2` for `x > 0` (6.5.4);
  - `ℱ(x) → 0` as `x → +∞`;
  - `f(x) ∼ 1/(πx)` and `g(x) ∼ 1/(π²x³)`;
  - `H(a, 0) = e^{a²} erfc a`, and `∫_ℝ H(a, u) du = √π`;
  - `expIntegralELog 0 w = e^{−w} e^{−e^w}`.

## R14 (P3) — Internal inconsistencies and build order

- **Location:** README.md:198–200 against :1296 and Suggested.lean:42; :1222 against :1201 and :1212; :1548; :1509.
- **Witness:**
  - The Conventions use `cobounded` when `θ < π`, but `erfc_isBigO` uses logarithmic coordinates at `θ = 3π/4 − δ`.
  - 11.6 comes after 11.3–11.4, which need it.
  - AsymptoticExpansions, a supplier, is listed as a consumer.
  - For `b ∈ ℤ_{>0}`, `d_{2b} = 0`, against 4.1's `a_n ≠ 0`.
- **Repair:**
  - Allow logarithmic coordinates for every `θ` in the Conventions.
  - Move 11.6 before 11.3.
  - Move the AsymptoticExpansions sentence to Scope and ownership.
  - In 15.4, handle `b ∈ ℤ_{>0}` with the termination clause of 4.1, as 4.2 does for 8.9.2.

## Verified sound

**Gate.**
- The worker's gate and my rerun at this head both fail only on readme-ids-missing (R07). Build and every other text check pass.
- My rerun (default order) also reports `depcheck: NOT IN ORDER` for this roadmap. That is not a defect at this stage.
- Dependency check with the candidate order: `depcheck: 245 roadmaps, 2467 edges, 0 problem(s)`. No UPWARD or CYCLE line.

**Lean.**
- `lake env lean Suggested.lean`: exit 0 with 77 `declaration uses sorry` warnings (one per theorem) and nothing else. The file has 119 declarations: 42 `def`s and 77 theorems.
- The file has no `variable` or `include` block, so no binder can be dropped. I compared all 119 elaborated types in the worker's signature list with their README statements, and checked seven by hand: `hasSum_erfInv`, `regularizedIncompleteBeta_natCast`, `upperIncompleteGamma_eq_mellinBarnes`, `tendsto_convs_upperIncompleteGamma`, `expIntegralE_large_order_isBigO`, `iteratedErfc_eq_repeatedGaussianIntegral`, `upperIncompleteGamma_natCast_add_one`. The ℕ casts `↑n − ↑m + 1` and `2 ^ (↑n − 1)` are real-valued with `n ≥ m`. Nothing changed.
- Every Lean name appears in the README.
- There is no sorry'd data, `set_option`, `lemma`, or extra import.

**Source sample (15 targets).**
- 1.3 (8.2.2–8.2.5, 8.2.12–8.2.13: DLMF-8.2 lines 122–271, 502–558) ✓.
- 2.1 (8.4.5, 8.4.7–8.4.11) ✓.
- 3.4 (8.14.1–8.14.6, including the `b = 0` limits at line 119) ✓.
- 4.3: R05.
- 5.3: verified, apart from R12.
- 6.1 (§8.13(i), 8.13.1) ✓.
- 7.1 (8.19.1–8.19.4, 8.22.1) ✓.
- 7.2 (8.19.5–8.19.11, 8.4.4, 8.4.13, 8.4.15) ✓.
- 7.3 (8.19.12–8.19.15, 8.19.18, 8.8.14) ✓.
- 7.5: R11 for 8.19.23; the rest ✓.
- 7.6 (8.20.1–8.20.6) ✓.
- 9.4 (6.12.3–6.12.8) ✓.
- 11.1: R11 for 7.2.2; the definitions 7.2.1–7.2.12 match the Lean bodies ✓.
- 11.2 (7.2.4, 7.2.9, 7.4.1–7.4.8) ✓.
- 14.2: see Not verifiable. Its mathematics was checked by computation (table).

I also read §§8.5–8.9, 8.17, 8.21, 7.13, 7.17, 7.19, 6.2, 6.4, 6.5, 6.13, 6.16 and 2.5 (2.5.49) for the adversarial pass.

**Library declarations opened at the pins (60).**

Mathlib:
- `Complex.Gamma_add_one`, `Gamma_eq_integral`: Gamma/Basic.lean:312, 319.
- `partialGamma`, `partialGamma_add_one`: Gamma/Basic.lean:146, 187.
- `Gamma_mul_Gamma_one_sub`, `differentiable_one_div_Gamma`: Gamma/Beta.lean:398, 543.
- `differentiableAt_Gamma`, `tendsto_self_mul_Gamma_nhds_zero`: Gamma/Deriv.lean:75, 100.
- `regularizedHGFun`, `regularizedHGFunCoeff`, `analyticOnNhd_regularizedHGFun_of_card_le`: RegularizedHypergeometric.lean:192, 67, 282.
- `Real.eulerMascheroniConstant_eq_neg_integral_log`: Harmonic/GammaDeriv.lean:97.
- `GenContFract.determinant`: Determinant.lean:64.
- `nums_recurrence`, `dens_recurrence`: ContinuantsRecurrence.lean:48, 60.
- `integral_gaussian`, `integral_gaussian_complex`: GaussianIntegral.lean:210, 236.
- `integral_Ioi_mul_deriv_eq_deriv_mul`: IntegralEqImproper.lean:1403.
- `hasDerivAt_integral_of_dominated_loc_of_deriv_le`: ParametricIntervalIntegral.lean:99.
- `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`: Uniqueness.lean:224.
- `hasSum_fourier_series_of_summable`: AddCircle.lean:493.
- `zeta_eq_tsum_one_div_nat_cpow`: RiemannZeta.lean:207.
- `mellinInv_mellin_eq`: MellinInversion.lean:92.
- `ordinaryHypergeometric`: OrdinaryHypergeometric.lean:81.
- `Complex.besselJ`: Bessel.lean:55.
- `Complex.digamma`: Digamma.lean:48.
- `Real.eulerMascheroniConstant`: EulerMascheroni.lean:131.

Tau Ceti:
- Erf.lean: `TauCeti.Real.erf` (61), `erfc` (64), `erf_def` (67), `erf_neg` (82), `hasDerivAt_erf` (102), `hasDerivAt_erfc` (125), `strictMono_erf` (142), `tendsto_erf_atTop` (166), `erfc_pos` (210); `Real.erfOrderIso` (241), `Real.erfInv` (250), `Real.erf_erfInv` (276), `Real.tendsto_erfInv_nhdsLT_one` (356), `Real.hasDerivAt_erfInv` (376).
- IncompleteGamma.lean: `TauCeti.lowerIncompleteGamma` (115), `regularizedGamma` (120), `lowerIncompleteGamma_eq_integral` (124), `regularizedGamma_eq_div` (150), `ofReal_lowerIncompleteGamma_eq_partialGamma` (292), `lowerIncompleteGamma_add_one` (306), `tendsto_regularizedGamma_atTop` (355), `regularizedGamma_natCast` (389), `Real.erf_eq_regularizedGamma_half_sq` (428).
- IncompleteBeta.lean: `regularizedIncompleteBeta` (89), `_def_of_mem_Icc` (110), `_symm` (390), `_add_one_left` (653), `_add_one_right` (698).
- Beta.lean: `integral_rpow_mul_one_sub_rpow` (200).
- LogIntegral.lean: `TauCeti.Real.logIntegral` (141), `logIntegral_def` (144), `logIntegral_isEquivalent_div_log` (277).
- Gamma/Quantile.lean: `inverseRegularizedGamma` (65).
- Contour/Residue/Basic.lean: `TauCeti.Contour.residue` (80).
- RegularizedHypergeometric.lean: `Complex.hasSum_regularizedHGFun` (53).
- Binomial/Tail.lean: `sum_Icc_choose_mul_pow_eq_regularizedIncompleteBeta` (134).
- SineIntegral.lean: `tendsto_integral_sin_div_atTop` (351).
- Rouche.lean: `TauCeti.rouche` (294), `rouche_symm` (259).

I found no Mathlib or Tau Ceti definition of a complex `erf`, `erfc`, Faddeeva, Dawson, Fresnel, `E_p`, `Ein`, `Si`, `Ci`, Voigt or Goodwin–Staton function, of a continued `Γ(a, z)`, or of Pincherle's theorem.

**Cross-roadmap citations resolved (26).**
- AsymptoticExpansions, at its open head via `roadmaps show`:
  - Layers 1 and 2;
  - §3.1, §3.3, §4.2, §4.3, §5.2, §5.4, §8.1, §8.2, §8.6, §8.7, §12.1;
  - `Asymptotics.HasAsymptoticExpansion` (its README line 121);
  - its Downstream consumers entry naming this roadmap (consistent).
- SpecialFunctionsParabolicCylinder, at its open head:
  - §5.1 and §5.3;
  - `TauCeti.dawson`, `differentiable_dawson`, `hasDerivAt_dawson`, `TauCeti.repeatedGaussianIntegral`;
  - the Check `Hh₀(x) = √(π/2) erfc(x/√2)`;
  - its consumer entry naming this roadmap.

  This file's local copies of `dawson` and `repeatedGaussianIntegral` have the same bodies and distinct fully qualified names.
- On main:
  - ZerosOfLFunctions §1.2 and §1.3;
  - ContourIntegration Layer 2;
  - StandardDistributions Layer 2 and §8.4;
  - ArithmeticDirichletSeries §6.2.

**Ownership.**
- I searched all 478 open pull requests and main with `roadmaps grep` by object (exponential, sine and Fresnel integrals, Faddeeva, incomplete Gamma, Pincherle, erfc, erfInv, Dawson, Voigt). R04 lists the hits.
- `roadmaps overlaps` reports no other pull request changing this roadmap and no dropped ids.

**Adversarial table** (values computed on each side):

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| 8.6.11 `upperIncompleteGamma_eq_mellinBarnes` | `z=0, a=1, c=1` | LHS `1`; RHS `0` (Lean `example`) | false | R01 |
| 6.16.4 (9.7) | `x=π`, `n→∞` | `S_n(π)=0`; `½Si(2nπ)→0.7854`; `R_n(π)→−0.7854` | false | R02 |
| 8.10.5, `n=1` | `a=2, x=2` | `A₁=2` vs `1.5` | needs `a<1` | R05 |
| 6.13.2 remainder | `c₀`: `α=0`; `c₁`: `α=π`; `s₀`: `α=π/2` | `c₀`: undefined. `c₁`: `R₁=0.2426≤0.3183`, `R₂=−0.0757`, `|R₂|≤0.1720`. `s₀`: `R₁=0.356≤0.637`, `R₂=−0.281`, `|R₂|≤1.376` | `k≥1` for `c_k` | R05 |
| 8.9.2 `tendsto_convs_upperIncompleteGamma` | `(a,z)=(0.3+0.5i,−1+0.5i)`, `(−2.7+i,0.4−2i)`, `(1.5,2)` | error of the 640th convergent against `z^{−a}e^zΓ(a,z)` (ray integral): `2.4e−7`, `4e−14`, `1.3e−13` | holds | — |
| 8.11.10 `regularizedGamma_transition_isBigO` | `a=50,200,800`; `y=−1,0,½` | `a·R`: `0.083/0.079/0.077`; `0.0048/0.0024/0.0012`; `−0.020/−0.022/−0.023` | bounded | — |
| 8.11.11 `tricomiIncompleteGamma_transition_isBigO` | `a=50.5, 200.5`; `y=−1,0,½`; `a=n∈ℕ` | `a·R`: `−0.90/−0.83`; `0.0096/0.0048`; `0.069/0.065`. At `a=n`: `x^{1−n}(−x)^{n−1}=−cos πn` exactly | holds | — |
| 4.1 Checks | `a_n=b_n=1`; `a₁=−1, b₁=1, a_n=−2, b_n=3` | `−f(1)/f(0)=0.618=(√5−1)/2`; convergents `−1,−3,−7,−15` | correct | — |
| `nums_mul_dens_sub` | `n=0` | `A₁B₀−A₀B₁=a₁=(−1)⁰a₁`; it equals the negative of Mathlib's `determinant` | true; duplicate | R03 |
| `isMinimalSolution_iff` | Casoratian | `u(m+1)/f(m+1)−u(m)/f(m)=(−1)^m a₁⋯a_m W(0)/(f(m)f(m+1))` | true | — |
| 8.9.1 minimal solution | `n=1,2` | `f(2)=−zM(1,a+2,z)/(a+1)`; `M(1,a+1)−M(1,a+2)=zM(2,a+3)/((a+1)(a+2))` by series | true | — |
| 8.17.23 bracketing (excluded at line 1577) | `a=2.5, b=3.3, x=0.3` | 80-digit convergents: signs `−++−−` and then `+` for every `n≥5` | the README is right to exclude it | — |
| 15.4 | recurrence; roots; `b=3` | `g_{n−1}=g_n+d_n g_{n+1}` matches `f`; roots `2(1∓√(1−x))/x`; `d₆=0` | integer `b` uncovered | R14 |
| 8.18.1 | `b=1,2` | `x^a=x^a`; `(a+1)x^a−ax^{a+1}` on both sides | exact | — |
| 8.20.4–8.20.6 | `λ=0`; `k≤2` | `p/(p−1)−∑p^{−k}=p^{−n}/(1−1/p)`; `A₂=1−2λ`, `A₃=1−8λ+6λ²` | true | — |
| 8.19.18 | limit at `p=n`; Lean at `p=0` | `+2πim(−1)^n z^{n−1}/(n−1)!`, so `−2πi` at `n=m=1`; at `p=0` the RHS is `E₀(e^w)` and the LHS is periodic | true | — |
| 8.19.12 | `p=0,1` | `zE₀=e^{−z}`; `E₂=e^{−z}−zE₁` | true | — |
| 8.11.2 remainder | `a=2, n=1` | `R₁=1/x=u₁/x` | equality case | — |
| 8.2.14 `tricomiIncompleteGamma_ode` | `a=1`; `z=0` | `g''+g'=0` with `g=1−e^{−z}`; `−1/Γ(a+1)+(a+1)/Γ(a+2)=0` | true | — |
| 1.1 Checks | `γ*(−1,z)`; `{a}` instead of `{a+1}` | `z`; the wrong model gives `1`, not `(1−e^{−z})/z` | discriminating | — |
| 8.2.9, 8.2.11 | `a→−n`; `e^{±πi}` | `(1−e^{2πima})Γ(a)→−2πim(−1)^n/n!`; `Γ(a)(1−z^ae^{±πia}γ*(a,−z))` | true | — |
| 7.13.1 `erf_zero_re_isBigO` | `n=5` | `λ=3.9135`, `μ=2.2834`, `x≈3.7690`; table `3.76900` | true | — |
| 7.18.12, 7.18.13 | `n=0`; `k=1,2` | `√(2/π)·√(π/2)=1`; `a₁=½`, `a_k=(n+k−1)/2` follow from 7.18.7 | true | — |
| 7.17.2_5 `hasSum_erfInv` | `m=0,1,2` | `1/3, 7/30, 127/630` | true | — |
| 6.5.5, 7.5.1, 7.5.8, 7.7.2 | signs | `1/(2i)=−i/2`; `F(0)=0`; `ζ²=−πiz²/2`; `1/(πi(t−z))=(i/π)/(z−t)` | true | — |
| Numeric Checks | `E₁(1)`, `Ei(1)`, `li(2)`, `Si(π)`, `x₀` | `0.21938393440`, `1.89511781636`, `1.04516378012`, `1.85193705198`, `0.37250741078`: each inside its interval | true | — |
| 7.8.2 at `x=0`; 7.19.3 at `x=0` | — | `0.7071<0.8862=0.8862`; `U(0,t)=√(π/4t)e^{1/4t}erfc(1/2√t)` | true | — |
| 8.4.6, `Re z>0` needed | `z=−1` | `√π erfc(1)≠√π erfc(−1)` | the hypothesis is needed | — |
| 7.2.2, 8.19.23, 8.6.3 | `z=2i`; `p=0`; `a=1, z=−1+i` | integrable `e^{4−s²}`; `E₋₁` decays; `1−e^{−z}=γ(1,z)` | hold beyond the README's range | R11 |
| 8.17.2, 8.17.5 (Lean) | probe | each closes with one `exact` | duplicates | R08 |

## Not verifiable

- **DLMF §7.18 (7.18.1–7.18.9, 7.18.12–7.18.14), sample target 14.2.** The sources service resolves `https://dlmf.nist.gov/7.18` (and `7.18.ii`, `7.18.E2`) to the image-only figure `7.18.F1.pdf`, and OCR is unavailable. I checked the mathematics of 7.18.3, 7.18.7, 7.18.12 and 7.18.13 by computation (table).
- **DLMF §2.11(ii) (2.11.5–2.11.7), sample targets 7.1 and 7.6.** The service returns `2.11.F1.pdf` in the same way. The README states them as 8.19.4 and 8.20.2–8.20.3, which I read.
- **Not fetched:** Gautschi 1967 Thm 1.1, Jones–Thron Ch. 4, Olver 1974, Temme 1996, Tricomi 1950, Kölbig 1972, MacLeod 2002. None was in the sample, and the README flags no locator as unverified.

## Source issues

- **Error** in DLMF-6.16 at 6.16.4 (§6.16(i), online): the source says `R_n(x) = O(1/n)` uniformly for `x ∈ [−π, π]`; it should say uniformly on `[−a, a]` for each `a < π`, since `R_n(π) = −½Si(2nπ) → −π/4`; affects a stated result.
- **Error** in DLMF-8.17 at the remark after 8.17.23 (§8.17(v), online): the source says the `4m`, `4m+1` convergents of 8.17.22 lie below `I_x(a,b)` and the `4m+2`, `4m+3` above; it should be restricted, since for `a = 2.5`, `b = 3.3`, `x = 0.3` every convergent from the fifth on lies above; affects a stated result.
- **Misprint** in DLMF-8.10 at 8.10.11–8.10.12 (§8.10, online): the source says equality holds only when `a = 1`, for `x ≥ 0`; it should exclude `x = 0`, where all three members vanish for every `a > 0`; affects nothing.
- **Gap** in DLMF-6.13 at 6.13.2 (§6.13, online): the source states the remainder bound with `α = kπ` for `c_k`, `k = 0, 1, …`; at `k = 0`, `α = 0` and the terms are undefined; it should say `k ≥ 1` for `c_k`; affects a stated result.
