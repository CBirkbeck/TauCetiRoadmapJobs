# Review of SpecialFunctionsEiLiErfIncompleteGamma (pull request #1924 at 7a75a23)

**Verdict:** needs changes

:robot: AI-assisted review (Claude Opus 5.5). Source ids `DLMF-<n>` are the sources-service extractions of `https://dlmf.nist.gov/<n>` (DLMF Version 1.2.8, release 2026-09-15). "line N" is a line of that extraction. Library declarations are cited at the pins of `lake-manifest.json`. Numerical values were computed in double precision with my own quadrature and series code.

## R01 (P2) — 7.5: 8.19.25 needs `Re b > 0`, and 8.19.24 is a 0/0 at `a = 0`

- **Location:** `TauCetiRoadmap/SpecialFunctionsEiLiErfIncompleteGamma/README.md:949–950`: "8.19.24 for `n ≥ 1` and `Re a > −1`. 8.19.25 for `Re a > −½` and `Re(p + b) > 1`, where `a/(1 + a)` lies in the unit disc."
- **Claim:** these are the hypotheses under which the two formulas hold. They copy DLMF-8.19 lines 1162 and 1198.
- **Witness:** `p = 3`, `b = −½`, `a = 0` meet the hypotheses. `E₃(0+) = ½`, so `∫_ε^∞ t^{−3/2}E₃(t) dt` is 7.83, 97.66, 997.64 at `ε = 10⁻², 10⁻⁴, 10⁻⁶`; the right side is −2.3633. At `a = 0`, 8.19.24's right side is `0/0`, while `∫₀^∞ E_n = 1/n`.
- **Repair:**
  - Write "8.19.24 for `n ≥ 1`, `Re a > −1` and `a ≠ 0`, with the value `∫₀^∞ E_n(t) dt = 1/n` at `a = 0` stated separately". 8.5 already does this for 6.14.1.
  - Write "8.19.25 for `Re a > −½`, `Re b > 0` and `Re(p + b) > 1`".
  - Add the negative-control Check `p = 3`, `b = −½`: the integral diverges at `0`.
- **Tested:** at `p = 2`, `b = 1`, `a = ½` both sides of 8.19.25 are 0.3781396. This signature elaborates against the file:

  ```lean
  theorem integral_exp_mul_rpow_mul_expIntegralE {a b p : ℂ} (ha : -(1 / 2 : ℝ) < a.re)
      (hb : 0 < b.re) (hpb : 1 < (p + b).re) :
      ∫ t in Ioi (0 : ℝ), cexp (-(a * t)) * (t : ℂ) ^ (b - 1) * expIntegralE p t =
        Complex.Gamma b * (1 + a) ^ (-b) / (p + b - 1) *
          ordinaryHypergeometric (1 : ℂ) b (p + b) (a / (1 + a)) := sorry
  ```

## R02 (P2) — The Gibbs phenomenon is statable at the pins but absent from `Suggested.lean`

- **Location:**
  - `README.md:27`: "the Gibbs phenomenon", one of the nine topics the Summary says the roadmap covers.
  - 9.7 (`README.md:1159–1165`): "`S_n(π/(2n)) → Si(π)/2`".
  - `Suggested.lean:15`: "Every target of `README.md` can be stated at these pins". The file has no 9.7 statement.
- **Claim:** `Suggested.lean` states the roadmap's headline theorems.
- **Witness:** the statement below uses only `sinIntegral`, which the file defines, and elaborates against the file. `S_n(π/(2n))` is 0.926624, 0.925975, 0.925969 at `n = 10, 100, 1000`; `Si(π)/2 = 0.925969`.
- **Repair:** add this statement under a `/-! ## Layer 9: sine and cosine integrals -/` comment, and name it in 9.7 where the limit is stated:

  ```lean
  /-- **9.7** The Gibbs phenomenon (DLMF §6.16(i)): at `x = π/(2n)` the partial sums of
  `∑ sin((2k + 1)x)/(2k + 1)` tend to `Si(π)/2`, not to `π/4`. -/
  theorem tendsto_sum_sin_odd_div_odd_gibbs :
      Tendsto (fun n : ℕ => ∑ k ∈ range n,
          Real.sin ((2 * k + 1) * (π / (2 * n))) / (2 * k + 1))
        atTop (𝓝 ((sinIntegral π).re / 2)) := sorry
  ```

## R03 (P3) — 2.6: 8.15.1 is restricted to `|1 − λ| < 1` and `Re a > 0`, and the convergence claim is false

- **Location:** `README.md:618–619`: "`γ(a, λx) = λ^a ∑ γ(a + k, x)(1 − λ)^k/k!` for `Re a > 0`, `x > 0` and `|1 − λ| < 1`, which is the region of convergence used."
- **Claim:** `|1 − λ| < 1` is where the series converges.
- **Witness:** `|γ(a + k, x)| ≤ x^{Re a + k}/(Re a + k)`, so `k!` dominates and the series converges for every complex `λ`; DLMF-8.15 line 50 states no restriction. At `a = 1`, `λ = 3`, `x = 1` both sides are 0.9502129.
- **Repair:** write "8.15.1 for `a ∉ −ℕ`, `x > 0` and every `λ ∈ slitPlane`, with principal powers; the series converges absolutely for every complex `λ`."
- **Tested:** the repaired statement holds at `(a, λ, x) = (−0.5 + 0.3i, 3, 1)` (both sides `−2.506328 − 0.039100i`), `(1, 2i, 1)`, `(0.5 + 0.3i, −1 + 2i, 0.7)` and `(−1.7, 2i, 0.8)`; both sides agree to 1e−14.

## R04 (P3) — 10.2: 8.21.4–8.21.7 are restricted to real `x > 0`

- **Location:**
  - `README.md:1209–1210`: "8.21.4–8.21.7 for real `x > 0`, with the stated ranges of `Re a`, as improper integrals in 8.21.4–8.21.5 (`generalizedSinIntegral_ofReal` for 8.21.6)".
  - `Suggested.lean:469`: `(hx : 0 < x)`.
- **Claim:** this is the generality of the source.
- **Witness:** DLMF-8.21 lines 400–402 allow any path off the negative axis. At `a = 0.3`, `z = 1.2 + 0.7i`, the segment integral 8.21.6 gives `0.929576 + 0.603511i = Si(a, z)`, and the ray integral 8.21.4 gives `0.428568 − 0.603511i = si(a, z)`.
- **Repair:**
  - State 8.21.4–8.21.5 for `z ∈ slitPlane`, as improper integrals along the horizontal ray `z + t`, `t ≥ 0`, as 10.4 already does for 8.21.22–8.21.23.
  - State 8.21.6–8.21.7 for `z ∈ slitPlane`, along the segment from `0`.
  - In `Suggested.lean`, replace `generalizedSinIntegral_ofReal` by the following, which elaborates against the file, and rename it in the README:

  ```lean
  /-- **10.2** DLMF 8.21.6 along the segment from `0` to `z`. -/
  theorem generalizedSinIntegral_eq_integral {a : ℂ} (ha : -1 < a.re) {z : ℂ}
      (hz : z ∈ slitPlane) :
      generalizedSinIntegral a z =
        ∫ s in (0 : ℝ)..1, z * ((s : ℂ) * z) ^ (a - 1) * Complex.sin ((s : ℂ) * z) := sorry
  ```

## R05 (P3) — Padding: `dawson_conj` and `fresnelC_ofReal_im` close with one `simp`

- **Location:** `Suggested.lean:519` `fresnelC_ofReal_im` and `Suggested.lean:526` `dawson_conj`. The docstring of `dawson_conj` says "**11.6**", but the README has no 11.6; the statement is in 11.2.
- **Claim:** these are acceptance-test statements.
- **Witness:** on a scratch copy of the file, each closes with one `simp` (under Tested), and `#print axioms` lists only `propext`, `Classical.choice` and `Quot.sound`.
- **Repair:**
  - Delete both declarations from `Suggested.lean`.
  - In README 11.2 (`README.md:1274–1275, 1280`), keep the two statements as prose. Drop the backticked names `fresnelC_ofReal_im` and `dawson_conj`: a backticked name claims a declaration.
- **Tested:** the two one-tactic proofs:
  - `simp [dawson, intervalIntegral.integral_of_le zero_le_one, ← integral_conj, ← Complex.exp_conj, map_mul]` closes `dawson_conj`;
  - `simp [fresnelC, ← Complex.ofReal_ofNat, ← Complex.ofReal_mul, ← Complex.ofReal_pow, ← Complex.ofReal_div, ← Complex.ofReal_cos, intervalIntegral.integral_ofReal]` closes `fresnelC_ofReal_im`.

## R06 (P3) — The ownership paragraph: process wording, a citation without its section, and a wrong locator

- **Location:**
  - `README.md:151`: "Two roadmaps under review define special cases".
  - `README.md:155`: "AutomorphicLFunctionsAndLocalFactors defines `AL0.negativeEi r = −∫_r^∞ e^{−t}/t dt`."
  - `README.md:158`: "`2∫₀ʷ e^{−πt²} dt = erf(√π w)` (11.1)".
- **Claim:** the ownership settlement cites its counterparts and its own targets.
- **Witness:** "under review" becomes false once either roadmap merges. `AL0.negativeEi` is in AutomorphicLFunctionsAndLocalFactors §AL.0.5 (its README line 555, at its open head). The `erf` identity appears only among Layer 11's Examples (`README.md:1318`).
- **Repair:**
  - Write "Two other roadmaps define special cases…".
  - Cite "AutomorphicLFunctionsAndLocalFactors §AL.0.5".
  - State the identity in 11.1 as a target: "for every `w`, `2∫₀ʷ e^{−πt²} dt` along the segment equals `erf(√π w)`". Alternatively, change the locator to "(Layer 11, Examples)".

## Verified sound

### The previous review (at 3bdb9db), finding by finding

| Id | Status | Passage at this head |
|---|---|---|
| R01 | repaired | `Suggested.lean:276` "`(hz : 0 < z.re)`"; `README.md:661–662` "8.6.11 for `Re z > 0`" |
| R02 | repaired | `README.md:1162–1163` "For each `0 < b < π`, `R_n(x) = O(n⁻¹)` uniformly for `\|x\| ≤ b` (6.16.4, corrected)"; negative-control Check at `:1168` |
| R03 | repaired | both table rows deleted (`:95–103`); `GenContFract.determinant` (`:431`, `:708`); `TauCeti.rouche`, `rouche_symm` (`:411`, `:1414`); `Complex.partialGamma` (`:143`) and the 1.4 bridge (`:529–531`); `nums_mul_dens_sub` deleted |
| R04 | repaired, with a residue (R06 here) | `:151–161` names QSeries §5.3 and §8.4 and records the identifications |
| R05 | repaired | `:771` "for `n = 1, 2` and `a < 1`"; `:772–773` (8.10.7–8.10.8 with the `a = 0` limit); `:1146` "for `k ≥ 1` for `c_k`"; Check at `:779` |
| R06 | repaired | `Suggested.lean:362–393` (6.1, both bands; 6.2) |
| R07 | repaired | gate `readme-ids-missing=0`; library names pinned by `#check` (`Suggested.lean:664–694`) |
| R08 | repaired | the four declarations deleted; `:1556–1561`, `:1084`, `:480` cite the Tau Ceti and Mathlib homes |
| R09 | repaired | all six declarations deleted |
| R10 | repaired | the 15 unused definitions deleted, their bodies in the Conventions (`:234–265`); docstring `Suggested.lean:13–17` |
| R11 | repaired | `:949` "on `slitPlane` for every `p`"; `:1250–1251` "for every `z`"; `:638` "for `Re a > 0` and every `z`" |
| R12 | repaired | `:825` "for fixed `λ`"; `:131` |
| R13 | repaired | `:1096–1099` (`Shi`, `Chi`), `:1262–1265` (`ℱ`, `f`, `g`, `G`), `:1535` (`H`), `:908–909` (`expIntegralELog`) |
| R14 | repaired, with a residue (R05 here) | `:212–216` (logarithmic coordinates for every `θ`); the Dawson symmetries moved into 11.2 (`:1277–1281`), but `dawson_conj` keeps "**11.6**"; the AsymptoticExpansions sentence moved (`:105–106`, `:344–345`); 15.4 termination (`:1595–1596`) |

### Gate and dependency check

- **My gate rerun at this head:** every text check is `0`. The only failure is `depcheck: NOT IN ORDER: SpecialFunctionsEiLiErfIncompleteGamma (insert it after its last supplier)` under the default order, which is not a defect at this stage. The worker's gate at this head passes every check, including the build.
- **Dependency check against the candidate order:** `depcheck: 237 roadmaps, 2420 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- **Merge order:** AsymptoticExpansions and SpecialFunctionsParabolicCylinder are new-roadmap pull requests. The description's merge-order paragraph names both.

### Lean

- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0 with 69 `declaration uses sorry` warnings, one per theorem, and nothing else.
- **Contents:** 27 definitions, all with real bodies and all used by a theorem; 69 theorems; 31 `#check` pins of library names.
- **Form:** there is no `variable`, `include`, `set_option`, `lemma`, `example`, `#eval` or sorry'd data. The imports are `Mathlib` plus five existing `TauCeti.*` modules.
- **Signatures:** without section binders nothing can be dropped. I compared the 96 elaborated types in the worker's signature list with the README; the adversarial table records the values.
- **Docstring labels:** I matched every **k.n** label in the docstrings against the README's subsections. The only mismatch is `dawson_conj` (R05).
- **Padding probe:** besides R05, `erf_ofReal` and `upperIncompleteGamma_ofReal` did not close with one `simp`.
- **Proposed repairs:** the three new signatures of R01, R02 and R04 elaborate.

### Source sample (15 targets, all against the DLMF extraction)

| Target | DLMF | Lines read | Result |
|---|---|---|---|
| 1.3 | 8.2.2–8.2.5, 8.2.12–8.2.13 | DLMF-8.2 lines 122–271, 502–544 | ✓ |
| 2.6 | 8.15.1 | DLMF-8.15 lines 48–50 | R03 |
| 5.1 | 8.11.1–8.11.3 and the remainder sign | DLMF-8.11 lines 73–168 | ✓ |
| 5.3 | 8.11.6–8.11.9 | DLMF-8.11 lines 292–424 | ✓ (fixed `λ`; sectors `π/2 − δ` and `3π/2 − δ`) |
| 7.3 | 8.19.12–8.19.15, 8.19.18, 8.8.14 | DLMF-8.19 lines 709–804, 952–956; DLMF-8.8 line 392 | ✓ |
| 7.5 | 8.19.23–8.19.27 | DLMF-8.19 lines 1127–1259 | R01 |
| 8.1 | 6.2.1–6.2.4, 6.4.1–6.4.3, 6.11.1 = 8.4.4, 2.5.49 | DLMF-6.2 lines 76–191; DLMF-6.4 lines 56–118; DLMF-6.11 line 58; DLMF-8.4 line 133; DLMF-2.5 lines 1775, 1886–1888 | ✓ |
| 8.2 | 6.2.5–6.2.8, 6.5.1–6.5.2 | DLMF-6.2 lines 219–311; DLMF-6.5 lines 55–86 | ✓ |
| 8.4 | 6.8.1–6.8.3, 6.9.1, 6.12.1–6.12.2 and the remainder bounds | DLMF-6.8 lines 46–102; DLMF-6.9 lines 45–49; DLMF-6.12 lines 67–147 | ✓ |
| 9.1 | 6.2.9–6.2.16, 6.4.4–6.4.5 | DLMF-6.2 lines 370–625; DLMF-6.4 lines 148–178 | ✓ |
| 9.2 | 6.2.17–6.2.21, 6.4.6–6.4.7, 6.7.12–6.7.14 | DLMF-6.2 lines 671–814; DLMF-6.4 lines 202–235; DLMF-6.7 lines 480–586 | ✓ |
| 9.4 | 6.12.3–6.12.8 and the remainder bounds | DLMF-6.12 lines 173–367 | ✓ |
| 10.2 | 8.21.4–8.21.9 | DLMF-8.21 lines 251–464 | R04 (the 8.21.8–8.21.9 exclusions and limiting forms ✓) |
| 10.4 | 8.21.18–8.21.27 | DLMF-8.21 lines 827–1134 | ✓ |
| 15.2 | 8.17.7–8.17.10 | DLMF-8.17 lines 298–434 | ✓ |

For the adversarial pass I also read DLMF 8.6, 8.7, 8.9, 8.10, 8.13, 8.17(iv)–(v), 8.20, 6.13, 6.16 and 7.17.

### Library declarations opened at the pins (25)

- **Tau Ceti:**
  - `Complex.hasSum_regularizedHGFun` (`Analysis/SpecialFunctions/RegularizedHypergeometric.lean:53`, needs `a.card ≤ b.card`);
  - `TauCeti.rouche` and `rouche_symm` (`Analysis/Complex/Conformal/Rouche.lean:294, 259`, zeros counted with `analyticOrderNatAt` in a ball);
  - `TauCeti.Contour.tendsto_integral_sin_div_atTop` (`Analysis/Contour/WorkedExamples/HalfDisc/SineIntegral.lean:351`);
  - `TauCeti.Real.logIntegral` (`LogIntegral.lean:141`, `∫₂ˣ (log t)⁻¹`), so `logIntegral_eq_principalLogIntegral_sub` is true for `1 < x < 2` as well;
  - `TauCeti.lowerIncompleteGamma`, `regularizedGamma` (`IncompleteGamma.lean:115, 120`, with the clamping lemmas at 130–159);
  - `lowerIncompleteGamma_add_one` (`:306`, with the stated sign), `ofReal_lowerIncompleteGamma_eq_partialGamma` (`:292`), `Real.erf_eq_regularizedGamma_half_sq` (`:428`);
  - `TauCeti.Real.erf_def`, `hasDerivAt_erfc`, `strictMono_erf`, `tendsto_erf_atTop` (`Erf.lean:67, 125, 142, 166`).
- **Mathlib:**
  - the 31 `#check` pins elaborate;
  - `integral_conj` (`MeasureTheory/Integral/Bochner/ContinuousLinearMap.lean:174`), `intervalIntegral.integral_ofReal` (`IntervalIntegral/Basic.lean:848`);
  - `Complex.exp_conj`, `Complex.cos_conj` (`Analysis/Complex/Exponential.lean:177`, `Trigonometric.lean:394`);
  - the `RegularizedHypergeometric.lean` API (no lemma on analyticity in the parameters, so `differentiable_tricomiIncompleteGamma_left` is not a one-liner).
- **Objects searched at the pins:** I found no complex `erf`, Faddeeva, Dawson, Fresnel, `E_p`, `Ein`, `Si` or `Ci` function, Voigt function or Pincherle theorem in Mathlib or Tau Ceti. The only exponential-integral-like objects at the pins are the real incomplete Gamma and Beta functions and the offset `logIntegral`, all cited.

### Cross-roadmap citations resolved

- **AsymptoticExpansions, at its open head:**
  - Layers 1 and 2; §3.1, §3.3, §4.2, §4.3 (gluing in logarithmic coordinates across `Im ζ = ±π`), §5.2, §5.4, §8.1, §8.2, §8.6, §8.7 (`c > 0`, `Re w > 0`), and §12.1 (`f₀² ≠ 4g₀`, `g₀ ≠ 0`, recessive solution unique up to a factor);
  - its definition of `Asymptotics.HasAsymptoticExpansion` (its README line 126);
  - its consumer entry (lines 1538–1540) and its exclusion of 2.5.49 and 2.11.5–2.11.7 to this roadmap (lines 1551–1553), which agree with `README.md:105–106`.
- **SpecialFunctionsParabolicCylinder, at its open head:**
  - §5.1, with `dawson`, `differentiable_dawson`, `hasDerivAt_dawson` and the same body;
  - §5.3, with `repeatedGaussianIntegral`, the same body, and the Check `Hh₀(x) = √(π/2) erfc(x/√2)`;
  - its scope, which leaves complex `erf`, `erfc` and `w` to this roadmap (lines 113–116), and its consumer entry (line 1273).
- **QSeriesPartitionsAndMockModularForms, at its open head:** §5.3 (line 847, the entire `E(w)`, declared there as a kept variant) and §8.4 (line 1236, upper-bank `H_k`).
- **AutomorphicLFunctionsAndLocalFactors:** §AL.0.5 (line 555).
- **On main:**
  - ZerosOfLFunctions §1.2 and §1.3;
  - StandardDistributions Layer 2 and §8.4;
  - ArithmeticDirichletSeries §6.2 (`Completed/`);
  - ContourIntegration Layer 2 (`Completed/`).
- **SpecialFunctionsAiry**, a consumer under review, cites this roadmap's Conventions and §1.5 for `upperIncompleteGammaLog`, and both exist.

### Ownership

- `roadmaps grep` over main and the open heads, by object (Pincherle, minimal solution, Faddeeva, Fresnel, sine and exponential integral, Voigt, Goodwin–Staton, erf, incomplete Gamma): no other owner beyond the QSeries and AutomorphicLFunctions adapters already settled in `README.md:151–161`.
- LaguerreJacobi and AnalyticNumberTheoryPartI share vocabulary only: the latter's `E₁` is the Weierstrass elementary factor.
- `roadmaps overlaps`: no other pull request changes this roadmap, and no cited id is dropped.

### Adversarial table

| Statement | Instances | Values (left; right) | Result | Change |
|---|---|---|---|---|
| 8.19.25 (7.5) | `p=3, b=−½, a=0`; `p=2, b=1, a=½` | `∫_ε^∞` = 7.83, 97.66, 997.64 at `ε = 10⁻², 10⁻⁴, 10⁻⁶`; RHS −2.3633. Control: 0.3781396 on both sides | false without `Re b > 0` | R01 |
| 8.19.24 (7.5) | `n = 1, 2, 3`, `a = 0` | `∫E_n` = 1.0000, 0.5000, 0.3333; RHS `0/0`; RHS at `a = 10⁻⁴` 0.99995, 0.49997, 0.33330 | 0/0 at `a = 0` | R01 |
| Gibbs 6.16.2, 6.16.4 (9.7) | `n = 10, 100, 1000, 10⁴` | `S_n(π/2n)` 0.926624, 0.925975, 0.925969 vs `Si(π)/2` 0.925969. `R_n(π)` −0.7774, −0.7846, −0.78532, −0.78539 → `−π/4`. `n·R_n(π/2)` −0.0905, −0.0908, −0.0908. `n·R_n(π−1/n)` 0.14, 1.70, 17.3, 173 | README's corrected form holds; DLMF's uniformity on `[−π, π]` fails | R02 (headline) |
| 8.15.1 (2.6) | `(a, λ, x) = (1, 3, 1)`, `(½, 3, 1)`, `(1, 2i, 1)`, `(½+0.3i, −1+2i, 0.7)`, `(−½+0.3i, 3, 1)`, `(−1.7, 2i, 0.8)` | 0.9502129 both; 1.7470973 both; `1.416147+0.909297i` both; `1.651209+0.179237i` both; `−2.506328−0.039100i` both; `2.468893−0.148063i` both | holds for every `λ` | R03 |
| 8.21.4, 8.21.6 at complex `z` (10.2) | `a = 0.3`, `z = 1.2+0.7i` | ray `0.428568−0.603511i` vs `si(a,z)` `0.428568−0.603511i`; segment `0.929576+0.603511i` vs series `0.929576+0.603511i` | holds off the positive axis | R04 |
| `dawson_conj`, `fresnelC_ofReal_im` | one-tactic probe | each closes with one `simp`; axioms `propext`, `Classical.choice`, `Quot.sound` | padding | R05 |
| 8.21.8 `generalizedSinIntegral_add_tail` | `(½, 2)`, `(0.3+0.4i, 1.2+0.7i)`, `(1, 0.9−0.4i)` | 1.2533141 both (`√(π/2)`); `1.315021−0.202725i` both; 1.0000 both | true | — |
| 8.6.10, 8.6.11, 8.6.12 (3.3) | 8.6.11: `a=½, z=1, c=1` and `a=−0.6+0.4i, z=0.8+0.5i, c=0.9`. 8.6.10: `a=1.5, z=1, c=0.7`. 8.6.12: `a=0.4, z=2, c=−0.3` and `a=−1.3, z=1.5i, c=−0.5`, then `c=−1.5` | 0.2788056 both; `0.102803−0.160208i` both; 0.3789447 both; 0.0728728 both; `−0.083654+0.213692i` both; at `c = −1.5`, `0.334509+0.036677i` | true; README's `c > −1` is needed | — (source issue) |
| 3.2 circle form of 8.6.8 | `a=½, z=1`; `a=−1.3+0.4i, z=0.7−1.1i` | 1.4936483 vs `√π erf 1` 1.4936483; `1.265807+1.105406i` both | true | — |
| 8.2.3 | `a=½, z=1` | `Γ(½,1)+γ(½,1)` = 0.2788056 + 1.4936483 = 1.7724539 = `√π` | true | — |
| 8.2.9, limiting form, 8.2.11 | `a=0.3+0.2i, w=0.2+0.5i, m=1`; `n=1`; `a=0.3, z=1.5` | `1.793211−2.022085i` both; `0.023737+6.181029i` both; `−0.467447−4.760927i` both | true | — |
| `upperIncompleteGammaLog_log` | `a=0.7`, `z=−1+0.3i` | `1.922928−2.231146i` both | true | — |
| 8.2.14 ODE | `a=0.3+0.2i, z=1+i` | residual `−2.0e−8−4.9e−9i` (difference step `10⁻³`) | true | — |
| 8.8.14 | `z=1+i` | `−0.346855−0.606074i` both | true | — |
| 6.2.4 `expIntegralE_one` | `z=−1+0.5i` | ray `−1.883148−1.833648i`; `Ein−log−γ` the same | true | — |
| 6.5.5 | `z=0.7+0.4i` | `Si` `0.699131+0.371187i`; `(i/2)(E₁(−iz)−E₁(iz))+π/2` the same | true; the Lean sign matches DLMF's `½i` | — |
| 8.19.18 | `p=0.4+0.1i, w=0.3+0.2i, m=1`; `p=0` | `−1.589983+0.191552i` both; at `p=0` the LHS `0.176083−0.089040i` equals `E₀(e^w)`, as the Lean junk values give | true | — |
| 8.9.2 | `a=−1.7+0.4i, z=2−3i`; `a=2.5, z=−3+0.2i` | 400th convergent `0.1377297+0.1129310i` = target; near the cut, 400th `−0.200014−0.011560i`, 40000th `−0.1999544−0.0112259i` = target | true | — |
| 8.9.1 (4.2) | `a=½, z=2+i`; `a=−2.5+0.3i, z=−4+i` | `2.972781+3.119286i` both; `−0.971493+1.303505i` both | true | — |
| Pincherle Checks (4.1) | `a_n=b_n=1`; `a₁=−1, b₁=1, a_n=−2, b_n=3` | `−f(1)/f(0)` = 0.618034; convergents −1, −3, −7 (`−(2ⁿ−1)`), minimal solution `0, 1, 1, …` | true | — |
| 8.10.5–8.10.6, 8.10.1 (4.3) | `(a,x) = (½,1)`, `(−1,½)`, `(0.9,3)`, `(2,2)` | `A₁<A₂<mid<B₂<B₁`: 0.6667<0.7368<0.7579<0.7692<0.8000; 0.2000<0.2432<0.2693<0.3231<0.4286; 0.9677<0.9739<0.9744<0.9745<0.9756. At `(2,2)`, `A₁ = 2 > mid = 1.5` | true for `a < 1` | — |
| 8.10.8 at `a = 0` | `x = 0.5, 2, 5` | 0.6000 < 0.6065 < 0.6667; 0.0000 < 0.1353 < 0.3333; −0.4286 < 0.0067 < 0.1667 | true | — |
| 8.11.5 `regularizedGamma_isEquivalent` | `z=1`; `a = 50, 200, 800, 100e^{2.5i}, 400e^{2.5i}` | ratios 1.01829, 1.00458, 1.00115, `0.99265−0.00549i`, `0.99816−0.00137i` | true | — |
| 8.11.2 (5.1) | `a=2, n=1` | `x^{−1}eˣΓ(2,x) − 1 = 1/x = u₁/x` | equality case | — |
| 6.1 zero counts | `a = 0.7, −0.5, −1.5, −2.5, −3.5, −2.2` on `[−15, 15]` | (negative, positive) = (0,0), (1,0), (1,1), (1,0), (1,1), (1,0) | matches both bands | — |
| 6.2 `tricomiIncompleteGamma_param_zeros` | `n=1`; `x = 0.2, 0.30, 0.31, 0.4`; table point `(−1.64425, 0.30809)` | sign changes in `a ∈ (−2,−1)`: 2, 2, 0, 0. At the table point `γ* = 7e−8`, `∂_aγ* = −8e−6`, `∂_a²γ* = 1.675` | true | — |
| 8.20.6 (`n = 3`) | `λ = 0, 1, 5`; `p = 20, 40, 80` | `p³·R` = 1.0526, 1.0256, 1.0127; −0.0132, −0.0144, −0.0150; 0.00233, 0.00235, 0.00237. `A_k(2)` = 1, 1, −3, 9 | bounded, uniform | — |
| 8.11.10 | `a = 50, 200`; `y = −1, ½` | `a·R` = 0.0826, 0.0787; −0.0195, −0.0220 | bounded | — |
| 8.11.11 | `a = 50.5, 200.5, 50.25, 50`; `y = −1, ½` | `a·R` = −0.902, −0.827, −0.638; 0.0692, 0.0648, 0.0489; at `a = 50` exactly 0 (1e−13) | bounded | — |
| 6.13.2 alternating remainder (9.5) | `c₁` (α=π), `c₂`, `s₀` (α=π/2), `s₁` | `c₁ = 3.384180`: R₁…R₄ = 0.2426, −0.0757, 0.0963, −0.2682 vs next terms 0.3183, −0.1720, 0.3645, −1.6011. `s₀ = 1.926448`: 0.3557, −0.2810, 1.0951, −10.568 vs 0.6366, −1.3761, 11.663, −204.94. `c₂`, `s₁` likewise | true for `n ≤ 4` (`k ≥ 1` for `c_k`) | — |
| Numerical Checks | `E₁(1)`, `Ei(1)`, `li(2)`, `x₀`, `Si(π)` | 0.219383934396, 1.895117816356, 1.045163780117, 0.372507410781, 1.851937051982, each inside its interval | true | — |
| 6.12.2 (`n = 3`), 7.12.1 (`n = 2`) | `x = 10, 20, 30`; `x = 3, 6, 12` | `x³·R` 11.47, 7.65, 6.97 (→ 3! = 6); `x⁴·R` 0.597, 0.702, 0.737 (→ ¾) | bounded | — |
| `erf` zeros, 7.13.1 | DLMF `n = 1` | Newton gives `z₁ = 1.450616+1.880943i`; the three-term formula gives 1.451271, 1.880872 | consistent with `O(λ^{−5}(1+μ)³)` | — |
| `erf_eq_mul_tricomiIncompleteGamma`, `erf_eq_lowerIncompleteGamma` | `z = 1.3−0.8i`; `z = −1.3+0.8i` | `1.093459−0.068575i` for all three forms; at `Re z < 0`, `erf = −1.093459+0.068575i` but `γ(½,z²)/√π = +1.093459−0.068575i` | `Re z > 0` needed and present | — |
| 7.5.1, 7.5.8, 7.7.2, 7.10.2, `w(iy)` | `z = 0.7+0.3i`; `0.7+0.3i`; `0.5+i`; `0.3−0.6i`; `y = 0.7` | `0.576950+0.081418i` both; `0.513279+0.335657i` both; `0.391234+0.127202i` both; `−2.409037+2.789428i` both; 0.5259303 both | true | — |
| 7.8.2 `millsRatio_bounds` | `x = 1`; `x = 0` | 0.366025 < 0.378936 ≤ 0.398768; 0.7071 < 0.8862 = 0.8862 | true | — |
| 7.18.12, 7.18.7, 7.18.3 | `n = 0, 2, 3`, `z = 0.3+0.2i`; `z = 0.4−0.3i`; `n = 3` | `0.658763−0.208529i`, `0.107325−0.061464i`, `0.034083−0.023249i` on both sides; `0.067018+0.071285i` both; 0.0940316 both | true | — |
| 7.17.2, 7.17.2_5, 7.17.3 | coefficients; `x = 0.9`; `x = 10⁻⁸, 10⁻³⁰`, `N = 5` | `a_m` = 1, 1/3, 7/30, 0.2015873 (=127/630); series 1.1630871537 = `inverf 0.9`; remainder/`u^{4.5}(1+\|v\|)^5` = 0.0029, −0.0011 | true | — |
| 7.19.3 `voigt_eq_erfc` | `x = ½, t = 0.3` | `0.675790+0.209278i` both | true | — |
| 8.17.7–8.17.9 | `a=2.5, b=3.3, x=0.3` | 0.0114358233 on all four sides | true | — |
| 8.18.1 (`n = 2`) | `b = 1.5, x = 0.4`; `a = 20, 40, 80, 160` | normalized remainder −0.1203, −0.1226, −0.1239, −0.1246 | bounded | — |
| 9.2 Checks | `x = 100` | `x·f(x)` 0.9998; `x²·g(x)` 0.9994 | true | — |

## Not verifiable

- **DLMF §2.11(ii), 2.11.5–2.11.7 (cited in 7.1 and 7.6):** the sources service resolves `https://dlmf.nist.gov/2.11` to the image-only figure `2.11.F1.pdf`, and OCR is not installed on this worker. The README states these as the same statements as 8.19.4 and 8.20.2–8.20.3, which I read and checked.
- **DLMF §7.18 (14.2, not in the sample):** this also resolves to the image-only `7.18.F1.pdf`. I checked 7.18.3, 7.18.7 and 7.18.12 numerically (table) and the recurrence of 7.18.13 algebraically.
- **Not fetched:** Gautschi 1967 Thm 1.1, Jones–Thron Ch. 4, Olver 1974, Temme 1996, Tricomi 1950, Kölbig 1972 and MacLeod 2002. None is in the sample, and the README flags no locator as unverified. I checked the Pincherle statements of 4.1 by derivation: the Casoratian `W(n) = −a_n W(n−1)` and the telescoping sum for `u/f`.

## Source issues

- **Gap** in DLMF-8.19 at 8.19.25 (§8.19(x), online): the source requires only `Re a > −1` and `Re(p + b) > 1`; it should also require `Re b > 0`, since `E_p(0) = 1/(p − 1) ≠ 0` makes the integrand `≍ t^{b−1}` at `0`; affects a stated result.
- **Misprint** in DLMF-8.19 at 8.19.24 (§8.19(x), online): the source states the formula for `Re a > −1`, which includes `a = 0`, where the right side is `0/0`; it should exclude `a = 0` or give the limit `1/n` there; affects nothing.
- **Gap** in DLMF-8.6 at 8.6.12 (§8.6(ii), online): the source says the path separates the Gamma poles from the poles at `s = 0, 1, 2, …`; it should also put the poles of `π/sin πs` at `s = −1, −2, …` to the left, since `c = −1.5` gives the wrong value at `a = −1.3`, `z = 1.5i`; affects a stated result.
- **Error** in DLMF-6.16 at 6.16.4 (§6.16(i), online): the source says `R_n(x) = O(1/n)` uniformly on `[−π, π]`; it should say uniformly on `[−b, b]` for each `b < π`, since `R_n(π) → −π/4` and `n·R_n(π − 1/n)` grows; affects a stated result.
- **Gap** in DLMF-6.13 at 6.13.2 (§6.13, online): the source indexes `c_k` from `k = 0` with `α = kπ`, so `α = 0` at `k = 0`, and the expansion terms and remainder statement are undefined there; it should say `k ≥ 1` for `c_k`; affects a stated result.
- **Misprint** in DLMF-8.10 at 8.10.11 (§8.10, online): the source says equality holds only at `a = 1`, for `x ≥ 0`; it should exclude `x = 0`, where all three members vanish for every `a > 0`; affects nothing.
