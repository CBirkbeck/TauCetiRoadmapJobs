# Review of SpecialFunctionsEiLiErfIncompleteGamma (pull request #1924 at 0ac9944)

**Verdict:** accepted

:robot: AI-assisted review (Claude Fable 5.1). An incremental re-review of the 71 lines changed since the review at 7a75a23 (43 in `README.md`, 28 in `Suggested.lean`, nothing outside the folder). Source ids `DLMF-<n>` are the sources-service extractions of `https://dlmf.nist.gov/<n>` (DLMF-8.21 = cache text `a6ce8436`, DLMF-8.19 = `30de3f49`, DLMF-7.2 = `59ae76eb`); "line N" is a line of that extraction. Library declarations are cited at the pins of `lake-manifest.json`. Numerical values were computed in double precision with my own quadrature (tanh-sinh and exp-sinh) and series code; where two of my integrators disagreed, the table records the one whose endpoint handling I verified.

No finding remains: the six findings of the previous review are repaired, the repairs introduced no new problem, the gate passes and the dependency check reports no problem.

## Previous findings

- R01 — repaired: `README.md:951–955` "8.19.24 for `n ≥ 1`, `Re a > −1` and `a ≠ 0`, with the value `∫₀^∞ E_n(t) dt = 1/n` at `a = 0` stated separately … 8.19.25 for `Re a > −½`, `Re b > 0` and `Re(p + b) > 1`"; `Suggested.lean:405–410` `integral_exp_mul_rpow_mul_expIntegralE` with `(hb : 0 < b.re)`; the three Checks at `:959–963`, including the negative control `p = 3`, `b = −½`, `a = 0`. The Check value `0.37813 95675…` is correct (table).
- R02 — repaired: `Suggested.lean:469–474` `tendsto_sum_sin_odd_div_odd_gibbs`, stated as proposed, under the `/-! ## Layer 9: sine and cosine integrals -/` comment; `README.md:1176–1177` names it where the limit `S_n(π/(2n)) → Si(π)/2` is stated.
- R03 — repaired: `README.md:618–621` "for `a ∉ −ℕ`, `x > 0` and every `λ ∈ slitPlane`, with principal powers. The series converges absolutely for every complex `λ`, since `|γ(a + k, x)| ≤ x^{Re a + k}/(Re a + k)` for large `k`; both sides are holomorphic in `λ` on `slitPlane` and agree near `λ = 1`." The bound and the route are right: for `Re a + k > 0`, `|γ(a + k, x)| ≤ ∫₀ˣ t^{Re a + k − 1} dt`.
- R04 — repaired: `README.md:1221–1224` "8.21.4–8.21.7 for `z ∈ slitPlane` … 8.21.4–8.21.5 as improper integrals along the horizontal ray `z + t`, `t ≥ 0` … 8.21.6–8.21.7 along the segment from `0` to `z` (`generalizedSinIntegral_eq_integral` for 8.21.6)"; `Suggested.lean:482–486` states the segment form with `(hz : z ∈ slitPlane)`; `generalizedSinIntegral_ofReal` is gone from both files.
- R05 — repaired: `dawson_conj` and `fresnelC_ofReal_im` are deleted from `Suggested.lean`; `README.md:1289–1290` and `:1295` keep both statements as prose with no backticked name; no docstring says **11.6** any more.
- R06 — repaired: `README.md:151` "Two other roadmaps define special cases"; `:155` "AutomorphicLFunctionsAndLocalFactors §AL.0.5"; `:1269–1270` states "For every `w`, `2∫₀ʷ e^{−πt²} dt` along the segment equals `erf(√π w)`" in 11.1, so the locator "(11.1)" at `:158` now resolves, and the duplicate under Layer 11's Examples is deleted.

## Verified sound

### The changed passages

- **2.6 (8.15.1).** The widened statement holds at three instances with `Re a ≤ 0` or `λ` off the disc `|1 − λ| < 1` (table), and the absolute-convergence bound is the one I derived above.
- **7.5 (8.19.24–8.19.25).** DLMF-8.19 line 1162 states 8.19.24 for `n = 1, 2, …` and `Re a > −1`; line 1198 states 8.19.25 for `Re a > −1` and `Re(p + b) > 1`. So the negative-control Check's clause "although DLMF's hypotheses hold" is right at `p = 3`, `b = −½`, `a = 0`. Both sides of 8.19.25 agree at the Check's real instance and at a complex instance with `|a/(1 + a)| = 0.57` (table). The limit Check for 8.19.24 holds (table). The hypothesis `Re a > −½`, which predates this change, is the price of Mathlib's `ordinaryHypergeometric` being the power series: for `−1 < Re a ≤ −½` the argument `a/(1 + a)` leaves the unit disc, and the README says so.
- **9.7 (the Gibbs limit).** The Lean statement's elaborated type (below) is the README's statement: a real sum over `range n`, `x = π/(2n)`, limit `(Si(π)).re/2` with `sinIntegral` the file's own definition. Values in the table. Within the Layer 9 block the 9.7 declaration precedes the 9.3 one; the form rules order only the layer comments, so this is a remark, not a request.
- **10.2 (8.21.4–8.21.9).** DLMF-8.21 lines 249–254, 289–294, 329–334, 364–369 give the four integrals with `Re a < 1`, `Re a < 1`, `Re a > −1`, `Re a > 0`, and lines 400–402 say the paths avoid the negative real axis, and the origin for 8.21.4–8.21.5: the README's `slitPlane`, the ray `z + t` and the segment from `0` are within that. The segment form of 8.21.6 agrees with the file's series definition `z^a ∑ (−1)^k z^{2k+1}/((2k + a + 1)(2k + 1)!)` at three complex instances, two with `Re a < 0` (table), and `z ∈ slitPlane` is what makes `arg(sz) = arg z` along the segment. `generalizedSinIntegral_eq_integral` elaborates with `-1 < a.re` and `z ∈ Complex.slitPlane` (below).
- **11.1 (sample target).** DLMF-7.2 lines 84 (7.2.1), 119 (7.2.2), 155 (7.2.3), 279 (7.2.5), 328 (7.2.6), 362 (7.2.7), 398 (7.2.8), 496 (7.2.10), 532 (7.2.11), 582–584 (7.2.12, `|ph z| < π`) are the definitions the section states; lines 200–201 and 431–432 are the entirety claims. The file's `erf`, `fresnelC`, `fresnelS`, `faddeeva` and `dawson` bodies (`Suggested.lean:87–116`) are these integrals as segment integrals over `[0, 1]`. The new target `2∫₀ʷ e^{−πt²} dt = erf(√π w)` holds at two complex `w` (table); it is the substitution `t ↦ √π t` in 7.2.1.
- **11.2.** The two sentences that lost their backticked names say exactly what the deleted one-`simp` declarations said; nothing else changed.
- **Ownership paragraph (`README.md:151–161`).** AutomorphicLFunctionsAndLocalFactors is the new-roadmap pull request #924, earlier in the merge order; its `### AL.0.5 Bessel transforms` is at its README line 569 and `AL0.negativeEi` with the body `−∫_{t>r} e^{−t}/t dt` at line 579 (and `Suggested.lean:55` there). QSeriesPartitionsAndMockModularForms at its open head has `### 5.3 the error-function smoothing kernel` (line 848, `E(w) = 2∫₀ʷ exp(−πt²) dt`) and `### 8.4 the branch-fixed scalar Fourier kernel` (line 1237, `H_k(w) = exp(−w)Γ(1 − k, −2w)` for real `k`, real `w ≠ 0`, upper bank). Both citations resolve as written.

### Gate, dependency check, elaboration

- **The worker's gate at this head:** every check `0`, build OK.
- **Dependency check against the candidate order:** `depcheck: 238 roadmaps, 2344 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- **Changes outside the folder:** `git diff --stat origin/main...HEAD` excluding the folder is empty.
- **Elaboration:** `lake env lean` on a scratch copy of `Suggested.lean` in which the three new theorems' `sorry` is replaced by `simp` and `#check @` lines for them are appended: the only errors are the three `simp made no progress` at lines 410, 474 and 486 (so none of the three is padding), and the remaining 66 declarations give exactly 66 `declaration uses sorry` warnings and nothing else. The three elaborated types:
  - `integral_exp_mul_rpow_mul_expIntegralE : ∀ {a b p : ℂ}, -(1/2) < a.re → 0 < b.re → 1 < (p + b).re → ∫ t in Set.Ioi 0, cexp (-(a*t)) * ↑t ^ (b - 1) * expIntegralE p ↑t = Complex.Gamma b * (1 + a) ^ (-b) / (p + b - 1) * ₂F₁ 1 b (p + b) (a / (1 + a))`;
  - `tendsto_sum_sin_odd_div_odd_gibbs : Tendsto (fun n => ∑ k ∈ range n, Real.sin ((2 * ↑k + 1) * (π / (2 * ↑n))) / (2 * ↑k + 1)) atTop (𝓝 ((sinIntegral ↑π).re / 2))`;
  - `generalizedSinIntegral_eq_integral : ∀ {a : ℂ}, -1 < a.re → ∀ {z : ℂ}, z ∈ Complex.slitPlane → generalizedSinIntegral a z = ∫ s in 0..1, z * (↑s * z) ^ (a - 1) * Complex.sin (↑s * z)`.
  Each equals its README statement; the file has no `variable` block, so no binder can be lost.
- **Form:** still one `import Mathlib` plus five existing `TauCeti.*` modules, no `set_option`, `lemma`, sorry'd data or `example`; the docstring labels **7.5**, **9.7**, **10.2** of the three new declarations match the README subsections; `grep` finds no `generalizedSinIntegral_ofReal`, `fresnelC_ofReal_im`, `dawson_conj`, `**11.6**` or "under review" in either file.
- **Citations and overlaps:** the worker's `roadmaps resolve` leads are the five names the previous review already settled (`HasAsymptoticExpansion`, `dawson`, `repeatedGaussianIntegral` defined in the two supplier pull requests; `expIntegralEi`, `principalLogIntegral` are the file's own `Real.` targets, read as `TauCeti.Real.` per the docstring); `roadmaps overlaps` lists no other pull request changing this roadmap and no dropped id. Ownership against the five closest open roadmaps was checked in the previous review and nothing in this change touches it.

### Adversarial table

Rows for the changed statements, with values computed at this head:

| Statement | Instances | Values (left; right) | Result | Change |
|---|---|---|---|---|
| 8.19.25 (7.5), repaired form | `p=2, b=1, a=½`; `p=0.7+0.3i, b=1.2−0.4i, a=−0.2+0.5i` (`\|a/(1+a)\|=0.571`) | 0.3781395676 both (the Check's `0.37813 95675…`); `0.8436857575−0.0931109359i` both | true | — |
| 8.19.25 negative control | `p=3, b=−½, a=0` | `∫_ε^∞` = 7.84, 105.0, 921.1 at `ε = 10⁻², 10⁻⁴, 10⁻⁶`; DLMF's right side −2.36327; `E₃(10⁻⁹) = 0.5000` | diverges, as the Check says | — |
| 8.19.24 limit (7.5) | `n = 1, 2, 3`, `a = 10⁻³` | right side 0.999500, 0.499667, 0.333083; `∫₀^∞ E_n` = 1.000000, 0.500000, 0.333333 | tends to `1/n` | — |
| Gibbs limit (9.7) | `n = 10, 100, 1000, 10⁴` | `S_n(π/2n)` 0.9266238, 0.9259751, 0.9259686, 0.9259685; `Si(π)/2` 0.9259685; `π/4` 0.7853982 | true | — |
| 8.21.6 segment form (10.2) | `a=0.3, z=1.2+0.7i`; `a=−0.6+0.4i, z=−1.5+0.8i`; `a=−0.9, z=0.4−2i`; `a=2, z=3` | series vs segment: `0.929575736+0.603510925i` both; `0.589406926+0.339268817i` both; `11.0118076−1.3547414i` both; 3.1110975 both | true on `slitPlane`, `Re a > −1` | — |
| 8.15.1 (2.6), repaired form | `(a, λ, x) = (−½+0.3i, 3, 1)`, `(1, 2i, 1)`, `(−1.7, −2+0.5i, 0.8)` | `−2.506328013−0.039100059i` both; `1.416146837+0.909297427i` both; `1.022416545+0.495915674i` both | true for `a ∉ −ℕ`, `λ ∈ slitPlane` | — |
| `2∫₀ʷ e^{−πt²} dt = erf(√π w)` (11.1) | `w = 0.7+0.4i`; `w = −0.6+i` | `1.0675708001+0.1028555028i` both; `−1.0617297962−2.0869016926i` both | true | — |
| One-tactic probe of the three new theorems | `simp` | `simp made no progress` at each | not padding | — |

Rows for the statements the diff leaves untouched, carried from the review at 7a75a23 (its adversarial table, same instances and values):

| Statement | Instances | Values (left; right) | Result |
|---|---|---|---|
| 8.21.8 `generalizedSinIntegral_add_tail` | `(½, 2)`, `(0.3+0.4i, 1.2+0.7i)`, `(1, 0.9−0.4i)` | 1.2533141 both; `1.315021−0.202725i` both; 1.0000 both | true |
| 8.6.10, 8.6.11, 8.6.12 (3.3) | 8.6.11: `a=½, z=1, c=1`; `a=−0.6+0.4i, z=0.8+0.5i, c=0.9`. 8.6.10: `a=1.5, z=1, c=0.7`. 8.6.12: `a=0.4, z=2, c=−0.3`; `a=−1.3, z=1.5i, c=−0.5`, then `c=−1.5` | 0.2788056 both; `0.102803−0.160208i` both; 0.3789447 both; 0.0728728 both; `−0.083654+0.213692i` both; at `c=−1.5` `0.334509+0.036677i` | true; `c > −1` needed |
| 3.2 circle form of 8.6.8 | `a=½, z=1`; `a=−1.3+0.4i, z=0.7−1.1i` | 1.4936483 vs `√π erf 1` 1.4936483; `1.265807+1.105406i` both | true |
| 8.2.3 | `a=½, z=1` | 0.2788056 + 1.4936483 = 1.7724539 = `√π` | true |
| 8.2.9, limiting form, 8.2.11 | `a=0.3+0.2i, w=0.2+0.5i, m=1`; `n=1`; `a=0.3, z=1.5` | `1.793211−2.022085i` both; `0.023737+6.181029i` both; `−0.467447−4.760927i` both | true |
| `upperIncompleteGammaLog_log` | `a=0.7`, `z=−1+0.3i` | `1.922928−2.231146i` both | true |
| 8.2.14 ODE | `a=0.3+0.2i, z=1+i` | residual `−2.0e−8−4.9e−9i` | true |
| 8.8.14 | `z=1+i` | `−0.346855−0.606074i` both | true |
| 6.2.4 `expIntegralE_one` | `z=−1+0.5i` | `−1.883148−1.833648i` both | true |
| 6.5.5 | `z=0.7+0.4i` | `0.699131+0.371187i` both | true |
| 8.19.18 | `p=0.4+0.1i, w=0.3+0.2i, m=1`; `p=0` | `−1.589983+0.191552i` both; `0.176083−0.089040i = E₀(e^w)` | true |
| 8.9.2 | `a=−1.7+0.4i, z=2−3i`; `a=2.5, z=−3+0.2i` | 400th convergent `0.1377297+0.1129310i`; 40000th `−0.1999544−0.0112259i` = targets | true |
| 8.9.1 (4.2) | `a=½, z=2+i`; `a=−2.5+0.3i, z=−4+i` | `2.972781+3.119286i` both; `−0.971493+1.303505i` both | true |
| Pincherle Checks (4.1) | `a_n=b_n=1`; `a₁=−1, b₁=1, a_n=−2, b_n=3` | 0.618034; convergents −1, −3, −7, minimal solution `0, 1, 1, …` | true |
| 8.10.5–8.10.6, 8.10.1 (4.3) | `(½,1)`, `(−1,½)`, `(0.9,3)`, `(2,2)` | 0.6667<0.7368<0.7579<0.7692<0.8000; 0.2000<0.2432<0.2693<0.3231<0.4286; 0.9677<0.9739<0.9744<0.9745<0.9756; at `(2,2)` `A₁=2>1.5` | true for `a < 1` |
| 8.10.8 at `a = 0` | `x = 0.5, 2, 5` | 0.6000<0.6065<0.6667; 0.0000<0.1353<0.3333; −0.4286<0.0067<0.1667 | true |
| 8.11.5 `regularizedGamma_isEquivalent` | `z=1`; `a = 50, 200, 800, 100e^{2.5i}, 400e^{2.5i}` | ratios 1.01829, 1.00458, 1.00115, `0.99265−0.00549i`, `0.99816−0.00137i` | true |
| 8.11.2 (5.1) | `a=2, n=1` | `1/x = u₁/x` | equality case |
| 6.1 zero counts | `a = 0.7, −0.5, −1.5, −2.5, −3.5, −2.2` on `[−15, 15]` | (0,0), (1,0), (1,1), (1,0), (1,1), (1,0) | matches both bands |
| 6.2 `tricomiIncompleteGamma_param_zeros` | `n=1`; `x = 0.2, 0.30, 0.31, 0.4`; `(−1.64425, 0.30809)` | sign changes 2, 2, 0, 0; `γ* = 7e−8`, `∂_aγ* = −8e−6`, `∂_a²γ* = 1.675` | true |
| 8.20.6 (`n = 3`) | `λ = 0, 1, 5`; `p = 20, 40, 80` | `p³R` 1.0526, 1.0256, 1.0127; −0.0132, −0.0144, −0.0150; 0.00233, 0.00235, 0.00237 | bounded, uniform |
| 8.11.10 | `a = 50, 200`; `y = −1, ½` | `aR` 0.0826, 0.0787; −0.0195, −0.0220 | bounded |
| 8.11.11 | `a = 50.5, 200.5, 50.25, 50`; `y = −1, ½` | `aR` −0.902, −0.827, −0.638; 0.0692, 0.0648, 0.0489; 0 at `a=50` | bounded |
| 6.13.2 alternating remainder (9.5) | `c₁`, `c₂`, `s₀`, `s₁` | `c₁ = 3.384180`: R₁…R₄ = 0.2426, −0.0757, 0.0963, −0.2682 vs 0.3183, −0.1720, 0.3645, −1.6011; `s₀ = 1.926448`: 0.3557, −0.2810, 1.0951, −10.568 vs 0.6366, −1.3761, 11.663, −204.94 | true for `n ≤ 4` |
| Numerical Checks | `E₁(1)`, `Ei(1)`, `li(2)`, `x₀`, `Si(π)` | 0.219383934396, 1.895117816356, 1.045163780117, 0.372507410781, 1.851937051982 | true |
| 6.12.2 (`n = 3`), 7.12.1 (`n = 2`) | `x = 10, 20, 30`; `x = 3, 6, 12` | `x³R` 11.47, 7.65, 6.97; `x⁴R` 0.597, 0.702, 0.737 | bounded |
| `erf` zeros, 7.13.1 | `n = 1` | `z₁ = 1.450616+1.880943i`; formula 1.451271, 1.880872 | consistent |
| `erf_eq_mul_tricomiIncompleteGamma`, `erf_eq_lowerIncompleteGamma` | `z = ±(1.3−0.8i)` | `1.093459−0.068575i` all three; sign flips at `Re z < 0` | `Re z > 0` needed and present |
| 7.5.1, 7.5.8, 7.7.2, 7.10.2, `w(iy)` | `0.7+0.3i`; `0.7+0.3i`; `0.5+i`; `0.3−0.6i`; `y=0.7` | `0.576950+0.081418i`; `0.513279+0.335657i`; `0.391234+0.127202i`; `−2.409037+2.789428i`; 0.5259303, each both sides | true |
| 7.8.2 `millsRatio_bounds` | `x = 1`; `x = 0` | 0.366025<0.378936≤0.398768; 0.7071<0.8862=0.8862 | true |
| 7.18.12, 7.18.7, 7.18.3 | `n = 0, 2, 3`, `z=0.3+0.2i`; `z=0.4−0.3i`; `n=3` | `0.658763−0.208529i`, `0.107325−0.061464i`, `0.034083−0.023249i`; `0.067018+0.071285i`; 0.0940316, each both sides | true |
| 7.17.2, 7.17.2_5, 7.17.3 | coefficients; `x=0.9`; `x=10⁻⁸, 10⁻³⁰`, `N=5` | `a_m` = 1, 1/3, 7/30, 127/630; 1.1630871537 = `inverf 0.9`; 0.0029, −0.0011 | true |
| 7.19.3 `voigt_eq_erfc` | `x=½, t=0.3` | `0.675790+0.209278i` both | true |
| 8.17.7–8.17.9 | `a=2.5, b=3.3, x=0.3` | 0.0114358233 on all four sides | true |
| 8.18.1 (`n = 2`) | `b=1.5, x=0.4`; `a = 20, 40, 80, 160` | −0.1203, −0.1226, −0.1239, −0.1246 | bounded |
| 9.2 Checks | `x = 100` | `xf(x)` 0.9998; `x²g(x)` 0.9994 | true |
| 6.16.2, 6.16.4 (9.7, untouched part) | `n = 10 … 10⁴` | `R_n(π)` → `−π/4`; `n·R_n(π/2)` −0.0908; `n·R_n(π−1/n)` 0.14, 1.70, 17.3, 173 | corrected form holds |

### Library declarations opened at the pins

- Mathlib `ordinaryHypergeometric` (the `₂F₁` the elaborated type prints), `Complex.Gamma`, `Complex.slitPlane`, `intervalIntegral`, `MeasureTheory.integral` over `Set.Ioi`: through the elaboration above; the 31 `#check` pins of the file elaborate unchanged.
- Tau Ceti modules imported: `Erf`, `IncompleteGamma`, `IncompleteBeta`, `LogIntegral`, `RegularizedHypergeometric`, all present at the pin (the build and my elaboration load them).

## Not verifiable

- **DLMF §2.11(ii) and §7.18:** as in the previous review, the sources service resolves these to image-only figures and OCR is not installed here; nothing in this change cites them anew.
- **Gautschi 1967, Jones–Thron, Olver 1974, Temme 1996, Tricomi 1950, Kölbig 1972, MacLeod 2002:** not fetched; none is cited by a changed passage.

## Source issues

- **Gap** in DLMF-8.19 at 8.19.25 (§8.19(x), online): the source requires only `Re a > −1` and `Re(p + b) > 1` (line 1198); it should also require `Re b > 0`, since `E_p(0) = 1/(p − 1) ≠ 0` makes the integrand `≍ t^{b−1}` at `0` (the table's divergent instance); affects a stated result.
- **Misprint** in DLMF-8.19 at 8.19.24 (§8.19(x), online): the source states the formula for `Re a > −1` (line 1162), which includes `a = 0`, where the right side is `0/0`; it should exclude `a = 0` or give the limit `1/n` there; affects nothing.
