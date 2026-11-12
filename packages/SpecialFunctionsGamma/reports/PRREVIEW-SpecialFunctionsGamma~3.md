# Review of SpecialFunctionsGamma (pull request #2191 at b0ab817)

**Verdict:** needs changes

## R01 (P2) — DLMF 5.8.2 already has an owner on main: GlobalHolomorphicFunctions 6.1

**Location:** `TauCetiRoadmap/SpecialFunctionsGamma/README.md:78` "| 5.8.2, 5.8.4–5.8.5 | The Weierstrass product and the balanced products (2.4). |"; `README.md:518–520`, the 5.8.2 bullet; `Suggested.lean:202–206` `hasProd_inv_Gamma`.

**Claim:** GlobalHolomorphicFunctions is on main and earlier in the merge order. It states 5.8.2 for every `z` as its own target. This roadmap states the same identity again, so 5.8.2 has two owners.

**Witness:** `TauCetiRoadmap/GlobalHolomorphicFunctions/README.md:1874–1878` (§6.1) asks to prove the identity `(Complex.Gamma z)⁻¹ = z exp(γz)∏_{n≥1}(1+z/n)e^{-z/n}` for every `z`, citing DLMF 5.8.2. Line 1964 calls it a separate target.

**Repair:**
- Delete the 5.8.2 bullet of 2.4, the first sentence of its route, the Check "5.8.2 at `z = 1`" and `hasProd_inv_Gamma`.
- Change the table row to "| 5.8.4–5.8.5 | The balanced products (2.4). |".
- Change the Summary item to "… on the line `1 + iy`, and the balanced products".
- Add to "What it does not own": "- The Weierstrass product 5.8.2 (GlobalHolomorphicFunctions 6.1)."

## R02 (P2) — `temmePhi` is 1 at `t = 0`, but the README says `Φ(0) = 0` and calls `Φ` real-analytic

**Location:** `Suggested.lean:56–57` "`1 - t * Real.cot t + Real.log (t / Real.sin t)`"; `README.md:711–712` "with `Φ` the helper `temmePhi`); `Φ(0) = 0` and `Φ` is real-analytic and nonnegative on `(−π, π)`".

**Claim:** The README identifies `Φ` with the helper. At `t = 0` the helper takes Lean's junk values `Real.cot 0 = 0` and `Real.log (0/0) = 0`. So `temmePhi 0 = 1`, and the helper is discontinuous at `0`.

**Witness:** At the pins, `example : temmePhi 0 = 1 := by simp [temmePhi]` elaborates, and so does `temmePhi π = 1`, although `Φ(t) → ∞` as `t → π`.

**Repair:** Change the definition to `if t = 0 then 0 else 1 - t * Real.cot t + Real.log (t / Real.sin t)`. At the pins `temmePhi' 0 = 0` closes by `simp`. The integral in `inv_Gamma_eq_temme` does not change, because the change is on a null set. In the README write "(… with `Φ` the helper `temmePhi`, whose value at the removable point is `Φ(0) = 0`); `Φ` is real-analytic and nonnegative on `(−π, π)`".

## R03 (P3) — Three cases that the pinned Mathlib proves are stated as targets

**Location:** `README.md:342–345` (5.4.2, odd case, `doubleFactorial_odd_eq_Gamma`); `README.md:740–745` (the first equality of 5.9.18); `README.md:735–736` (5.9.19); `Suggested.lean:89–92` and the first conjunct at `Suggested.lean:343`.

**Claim:** `README.md:87–88` says that cases the pins already prove are inputs. All three of these cases are proved at the Mathlib pin.

**Witness:**
- `Real.Gamma_nat_add_one_add_half` (`Mathlib/Analysis/SpecialFunctions/Gaussian/GaussianIntegral.lean:328`) states `Γ(k+1+½) = (2k+1)‼√π/2^{k+1}`.
- `Real.eulerMascheroniConstant_eq_neg_integral_log` (`Mathlib/NumberTheory/Harmonic/GammaDeriv.lean:97`) states `γ = −∫ log t · e^{−t}`.
- `Complex.hasDerivAt_Gamma_of_re_pos` (`Mathlib/Analysis/SpecialFunctions/Gamma/Deriv.lean:65`) is 5.9.19 at `n = 1`.

**Repair:**
- Add to the inputs: "5.4.2 (`Nat.doubleFactorial_two_mul` with `Complex.Gamma_nat_eq_factorial`, and `Real.Gamma_nat_add_one_add_half`); the first equality of 5.9.18 (`Real.eulerMascheroniConstant_eq_neg_integral_log`); 5.9.19 for `n ≤ 1` (`Complex.Gamma_eq_integral`, `Complex.hasDerivAt_Gamma_of_re_pos`)". List the new names under "From Mathlib".
- Drop 5.4.2 from the table row and from 1.2.
- Delete `doubleFactorial_odd_eq_Gamma`.
- State the remaining three equalities of 5.9.18 in `eulerMascheroni_eq_integrals`.

## R04 (P3) — A Check of 7.3 prints the wrong term

**Location:** `README.md:1052–1053` "`1/10 + 1/200 + 1/6000 − 1/300000 = 0.1051663333333`".

**Claim:** The `k = 2` term of 5.15.8 at `z = 10` is `B₄/10⁵ = −1/3000000`. With `−1/300000`, as printed, the left side is `0.1051633333`.

**Witness:** `0.1051666667 − 0.0000033333 = 0.1051633333`. The value `ψ′(10) = 0.1051663357` agrees to `2.35·10⁻⁹` only with `−1/3000000`.

**Repair:** "`1/10 + 1/200 + 1/6000 − 1/3000000 = 0.1051663333333`".

## R05 (P3) — The proof note for Landau's theorem claims a constant sign that fails when `g` crosses 1

**Location:** `README.md:1095–1097` "the coefficients are integrals of `w g^s (log g)^k` with constant sign, which allows monotone convergence".

**Claim:** For odd `k`, `(log g)^k` is negative where `g < 1` and positive where `g > 1`. When `g` takes values on both sides of 1, the integrand has no constant sign. This happens in 8.4 and 8.5, which use the theorem.

**Witness:** In 8.5 at `n = 2`, `g = |e^{iθ₁} − e^{iθ₂}|²` ranges over `[0, 4]`. So `log g < 0` near the diagonal and `log g = log 4 > 0` at `θ₁ − θ₂ = π`.

**Repair:** "(The proof splits the integral at `g = 1`. On `{g > 1}`, `g^s ≤ g^{s*}` for `s < s*`, so that part converges. On `{g ≤ 1}`, the Taylor coefficients at `s*` are `∫ w g^{s*} (log g)^k`, of sign `(−1)^k`, so every term of the series at `s < s*` is nonnegative and monotone convergence applies.)"

## R06 (P3) — 7.1 has no locator

**Location:** `README.md:991–997`, the definition of `Complex.polygamma` and its four API facts.

**Claim:** Every target needs a locator. 7.1 cites no source for the definition or for its API facts.

**Witness:** The opening paragraph of DLMF §5.15 (Release 1.2.8) calls `ψ⁽ⁿ⁾`, for `n ≥ 1`, the polygamma functions, and says that their properties follow by differentiating those of `ψ`. 7.1 cites nothing.

**Repair:** After the first sentence of 7.1, add "(DLMF §5.15, opening paragraph: `ψ⁽ⁿ⁾` is the `n`-th derivative of `ψ`, `n ≥ 1`)".

## R07 (P3) — The use-sites in the supplier contracts do not match the *Needs:* lines

**Location:** `README.md:217` "(6.3)"; `README.md:219` "(Layer 6, 8.3, 8.4)"; `README.md:225–226` "1.1 and 1.3: … (7.3)"; `README.md:228` "(4.1, 4.4, 5.2, 7.3)".

**Claim:**
- 8.4 also needs ZerosOfLFunctions 1.2.
- Only 8.3 needs ZerosOfLFunctions 1.3.
- 7.3 does not list AsymptoticExpansions 1.1 or 1.3.
- 3.4 needs AsymptoticExpansions 4.1, but the contract does not name it.

**Witness:** `README.md:1182` "*Needs:* 8.1, 8.3; ZerosOfLFunctions 1.2"; `README.md:1049` "*Needs:* 7.2; AsymptoticExpansions 4.1–4.3; Mathlib `bernoulli`"; `README.md:621` "AsymptoticExpansions 4.1 and 4.3". No *Needs:* line in 6.1–6.4 cites ZerosOfLFunctions 1.3.

**Repair:**
- Line 217: "(6.3, 8.4)".
- Line 219: "(8.3)".
- Line 228: "(3.4, 4.1, 4.4, 5.2, 7.3)".
- Line 1049: "*Needs:* 7.2; AsymptoticExpansions 1.1, 1.3, 4.1–4.3; Mathlib `bernoulli`."

## R08 (P3) — The one-sentence boundary claims the decimal values 5.4.7–5.4.10

**Location:** `README.md:156–159` "owns every formula of DLMF §§5.2–5.9 and §§5.12–5.16 that is not in Mathlib or Tau Ceti, not one of the consumed results above, and not part of the explicit Stirling theory … or the continued fraction of §5.10."

**Claim:** 5.4.7–5.4.10 meet every clause of the sentence, so it claims them. They are not owned.

**Witness:** `README.md:1230` lists "**Decimal values and extrema** (DLMF 5.4.7–5.4.10, 5.4.20)" under Beyond, and "What it does not own" (line 148) names only 5.4.20.

**Repair:** End the sentence "… or the continued fraction of §5.10, the decimal values 5.4.7–5.4.10 and the extrema 5.4.20." In the last bullet of "What it does not own", write "the decimal values 5.4.7–5.4.10, the extrema 5.4.20".

## R09 (P3) — The pull request description disagrees with the head

**Location:**
- Description, Overlaps: "(its 1.1–1.3, 2.4–2.5); the README names these sections."
- Dependencies: "AsymptoticExpansions: 4.1–4.3 …; 8.6".
- Layer 2 item: "the Weierstrass product 5.8.2".
- What exists: the Mathlib list.

**Claim:**
- The README names ExplicitZetaBounds 1.1–1.2, 2.4 and 2.5, not 1.3.
- The README also consumes AsymptoticExpansions 1.1 and 1.3.
- After R01, 5.8.2 is GlobalHolomorphicFunctions 6.1's, and the On main overlaps do not mention it.
- After R03, the Mathlib list lacks three inputs.

**Witness:** `README.md:145` "(ExplicitZetaBounds 1.1–1.2, 2.4 and 2.5)"; `README.md:225` "- 1.1 and 1.3: `HasAsymptoticExpansion` and the asymptotic scale".

**Repair:**
- Overlaps: "(its 1.1–1.2, 2.4–2.5, which the README names; its 1.3, polygamma brackets on the positive axis, is a different statement from 7.3)".
- Dependencies: "AsymptoticExpansions 1.1 and 1.3 (the expansion API), 4.1–4.3 …".
- On main: add "GlobalHolomorphicFunctions 6.1 owns the Weierstrass product 5.8.2; it is cited, not restated".
- Layer 2: drop 5.8.2.
- Mathlib list: add "5.4.2, the first integral of 5.9.18 and 5.9.19 for `n ≤ 1`".

## Verified sound

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| 1.1 `ascPochhammer_two_mul_eval` 5.2.8 | `a = 0.7 − 1.3i`, `n = 0, 1, 2, 5` | `n = 2` even: `−30.1084 − 21.736i` both; `n = 5` odd: `−42301670.4 + 30852759.98i` both | holds |
| 1.1 `…_eq_sum_lah` 5.2.9 | `x = 0.4 + 0.9i`, `n = 0, 1, 2, 5` | `n = 5`: `−54.83496 + 37.38429i` both; `12.08304 − 15.89571i` both | holds |
| 1.1 `lah` | `L(1,0)`, `L(2,1)`, `L(2,2)`; wrong model | `0, 2, 1`; truncated-subtraction model gives `L(1,0) = 1`, `(x)₁ = x + 1` | holds |
| 1.2 `doubleFactorial_odd_eq_Gamma` | `n = 0, 1, 4` | `1, 3, 945` both | holds; R03 (in Mathlib) |
| 1.2 `Gamma_half_add_mul_I`, `Gamma_quarter_add_mul_I` | `y = 0.3, −1.1` | `2.125574782`, `0.1981223292` (three sides); `1.949144034 − 1.435268971i`, `0.1403727811 + 0.1400933644i` both | holds |
| 1.2 `digamma_nat_add_half`, `im_digamma_*` | `n = 0, 3`; `y = 0.3, −1.1` | `−1.963510026`, `1.103156641`; `3.799861455`, `1.156669383`, `0.4665281216`; `−2.028474741`, `−1.567669604`, `−1.119383832` both | holds |
| 1.3 `digamma_rat` | `2/5`, `1/4`, `3/7`, `1/2` | `−2.561384545`, `−4.227453533`, `−2.365818757`, `−1.963510026` both | holds |
| 1.4 `prod_Gamma_add_div` (sample) | `n = 1, 3, 4`; `z = 0.2 + 0.3i`, `−1.7 + 0.4i`, `−⅓` | `n = 3`: `−0.7099665838 − 3.294764847i`; `n = 4`, `z = −1.7 + 0.4i`: `−5.677531724 − 0.1926058433i`; `z = −⅓`: `0 = 0` | holds |
| 1.4 `digamma_mul_nat` (sample) | `n = 3, 4`, `z = 0.2 + 0.3i` | `−0.1558473196 + 1.435654666i`; `0.187643459 + 1.309289555i` both | holds |
| 2.1 5.7.3–5.7.5 | `z = 1.5`, `−1.6 + 0.5i`, `1.9i`; `0.6 − 0.5i`; `0.3 + 1.2i`, `−1.4 + 0.5i` | `1.329340388`, `−1.532361141 + 0.330721419i`, `0.1743862936 + 0.0105830181i`; `0.207902891 − 0.4078889752i`; `0.3599394546 + 0.9634145553i`, `0.1999060897 + 2.447073301i` | holds |
| 2.2 `invGammaCoeff`, `…_recurrence` (sample) | `k = 3…8` | `(k−1)c_k`: `−1.311756143`, `−0.1260079051`, `0.6661544455`, `−0.2109886728`, `−0.0577318292`, `0.0505326027` both; `c₀…c₄ = 0, 1, γ, −0.6558780715, −0.0420026350` | holds |
| 2.3 `digamma_eq_gaussSeries`, `hasSum_deriv_digamma` | `z = −1.5 + 0.2i`, `0.3 + 0.8i`, `−½` | `0.7078599211 + 1.651757378i`; `−0.2837751363 + 1.849934403i`; `ψ′`: `6.32282456 − 0.0468259556i`; `8.934802201 = π²/2 + 4` | holds |
| 2.3 `tendsto_digamma_half_sub`, 5.7.8 | `z = −1.5 + 0.2i`, `0.3 + 0.8i`; `y = 1.7` | `4.747588907 − 0.042994747i` against the partial-sum average `4.747588876 − 0.042994747i` at `N = 4000`; `1.276750837` both | holds |
| 2.4 `hasProd_inv_Gamma` (sample) | `z = 0.4 − 1.2i`, `1` | `1.195648523 − 2.384710747i` both; `1` | holds; R01 (owner on main) |
| 2.4 `hasProd_balanced` (sample) | `m = 3` complex, equal sums; Wallis | `0.3866274208 + 0.4446248927i` both; `1.570796327` | holds |
| 3.1 5.6.2, 5.6.3 | `x = 0.025, …, 9.975` | both maxima `2.0`, at `x = 1` | holds |
| 3.2 `gautschi`, `kershaw` (sample) | 35 points, `x ∈ [0.001, 30]`, `s ∈ [0.001, 0.999]` | least slacks `1.66·10⁻⁵`, `1.63·10⁻⁵`; `4.1·10⁻¹²`, `4.5·10⁻¹⁴`; `x = 1`, `s = ½`: `1.11303 ≤ 1.12838 ≤ 1.13172` | holds |
| 3.3 `norm_Gamma_add_mul_I_le` | 24 points, `x ∈ {−2.5, −0.5, −0.01, 0.01, 0.5, 3}` | least slack `0.035`; `x = −½`, `y = 1`: `0.4656307 ≤ 3.5449077` | holds |
| 3.3 `norm_Gamma_add_mul_I_ge` | `x ∈ {0.5, 0.8, 3}`; control `x = 0.3`, `y = 1` | least slack `0` (equality at `x = ½`); control `0.5254 < 0.8787`, fails, so `x ≥ ½` is needed | holds |
| 3.4 `norm_Gamma_add_div_Gamma_add_le` (sample) | 25 points; control `b − a = ½`, `z = 0.001` | least slack `0` (`a = 0`, `b = 1`, real `z`); control `564.97 > 31.62` | holds |
| 4.1 5.9.1, 5.9.3, 5.9.4 (sample) | `μ = 1.7`, `ν = 0.8 + 0.5i`, `z = 1.2 − 0.7i`; `c = 0.7`, `z = 0.3 + 0.4i`; `z = −1.3 + 0.6i` | `0.608504447 − 0.2577168663i`; `1.220553974 − 1.361890799i`; `0.5002235566 + 0.7404562307i`, each both | holds |
| 4.1 5.9.5 (sample) | `n = 1`, `z = −1.5 + 0.3i`; `n = 0`, `z = −0.4 + 0.3i` | `1.597927278 + 0.3439346381i`; `−2.501708559 − 0.561488651i` both | holds |
| 4.1 5.9.6, 5.9.7, 5.9.8–5.9.9 (sample) | `z = 0.3 + 0.4i`, `½`; `−0.3 + 0.4i`, `−½`, `0`; `n = 3` | `0.5617103 − 1.7441258i`, `1.253314137`; `1.620931054 − 0.5587107951i`, `2.506628275`, `π/2`; `0.7733429421`, `0.4464897558`, each both | holds |
| 4.2 `inv_Gamma_eq_hankel` | `z = 0.3 + 0.7i`, `−2.4 + 0.5i`, `3`, `0`; `ε = 0.5, 2` | `0.3731200937 + 1.032285805i`; `−1.533705756 + 1.666245621i`; `0.5`; at most `3·10⁻²³` (true value `0`), same for both `ε` | holds |
| 4.3 `inv_Gamma_eq_temme`, `temmePhi` | `z = 1`, `2.5 + i`, `0.4 − 0.9i`; `t = 0`, `π` | `1`; `0.7036905931 − 0.6427178343i`; `0.723390786 − 1.444044497i` both; Lean `temmePhi 0 = 1`, `temmePhi π = 1` | theorem holds; R02 |
| 4.4 5.9.13–5.9.16 | `z = 1.3 + 0.4i` | `−0.0800917889 + 0.4301057781i` four times; `ψ + γ = 0.4971238761 + 0.4301057781i` three times | holds |
| 4.4 5.9.18–5.9.20 | four integrals; `n = 2`, `z = 0.8 + 0.3i`; `c = 1`, `z = 2 + i` | `0.5772156649` four times; `1.418380944 − 2.629920519i` both; `0.7315113713 + 0.8761731423i` both | holds; R03 |
| 5.1 5.12.2, 5.12.4, 5.12.7 | `a = 0.7 + 0.3i`, `b = 1.2 − 0.4i`, `z = −0.5 + 0.2i`; `(1 + 0.3i, 0.4 − 0.2i)` | `0.4897312133 − 0.1009528285i`; `−0.9184401433 + 0.7787092137i`; `0.9059688934 − 0.4664212931i`, each both | holds |
| 5.1 5.12.5, 5.12.6 | `(1.4, 4.1 + 0.3i)`, `(1, 3)`, `(0.5 + i, −7 + 2i)` | `−0.0568072733 + 0.0603433633i`, `−⅓`, `3.534977 + 7.295221i`; `−0.0818334303 + 0.0633140181i`, `⅔i`, `−0.6305101477 + 0.3055204443i` | holds |
| 5.2 `integral_vertical_beta`, `…_one_sub` | `(1 + 0.5i, 0.7 − 0.3i, 0.9 + 0.4i, 0.8 − 0.1i)`, `a = −1`; `c = 0.3`, `(0.6 + 0.2i, 0.1 − 0.3i)`, `a = −1` | `0.7061496453 − 0.3049743306i`; `10⁻²²` against `0`; `0.9864303534 + 0.3024395776i`; `10⁻²²` against `0` | holds |
| 5.3 `beta_loop_one` | `(0.7 + 0.2i, −1.3 + 0.5i)`, `(1, ½)`, `(1.5, −2)`; `ε = 0.3, 0.6` | `−1.155938271 − 0.2974244276i`; `0.6366197724 = 2/π`; `−0.125`, the same for both `ε` and on the right | holds |
| 5.3 `beta_loop_zero` | `(−0.6 + 0.3i, 0.8 − 0.2i)`, `(2, 1.5)`, `(−2.5, 3.2)`; `ε = 0.3, 0.7` | `0.7133360113 + 0.3069579553i`; `0` (to `10⁻¹⁹`); `3.530505439`, the same for both `ε` and on the right | holds |
| 5.3 `beta_pochhammer` | `(−0.4 + 0.3i, 1.6 − 0.5i)`, `(½, ½)`, `(−1, −2)`; `ε = 0.2, 0.4` | `−44.60394718 − 43.33414751i`; `12.56637061 = 4π`; `2·10⁻¹⁷` against `0` | holds |
| 6.1 `integral_Gamma_mul_Gamma_mul_cpow` | `(0.7 + 0.2i, 0.9 − 0.3i, 0.1, −1 + 0.5i)`; `(½, ½, 0, 1)` | `1.117191922 − 0.9380124197i` both; `0.5` both | holds |
| 6.2 `integral_norm_Gamma_sq_mul_exp` | `(0.8, 1.1)`; `(1, π/2)` | `0.3543953388` both; `0.25` both | holds |
| 6.3 `integral_inv_Gamma_four` | `(1.7, 1.2, 1.4, 1.9)` | `1.732749151` on `|t| ≤ 60` against `1.732749152` | holds |
| 6.4 `integral_deBrangesWilson` | `(0.3, 0.7, 1.1, 0.5)` | `0.5521062177` both | holds |
| 7.1 `polygamma` | `ψ″(1)`; wrong model | `−2.404113806 = −2ζ(3)`; the unsigned model gives `+2.404` | holds; R06 (locator) |
| 7.2 `polygamma_one_and_half`, `polygamma_one_nat_sub_half` | `n = 1, 2, 3`; `n = 1, 2, 4` | `1.644934067`, `−2.404113806`, `6.493939402`; `4.934802201`, `−16.82879664`, `97.40909103`; `4.934802201`, `0.9348022005`, `0.3303577561`, each both | holds |
| 7.2 `polygamma_add_one`, `polygamma_one_sub`, `polygamma_mul_nat` | `z = 0.7 + 0.4i`, `n = 0, 1, 3`; `(n, m) = (1,3), (2,2), (3,4)` | `n = 3`: `0.5317748292 − 0.5950696488i`, `−86.41824494 − 62.83593198i`; `0.185688876 − 0.6380134153i`, `1.173027159 + 0.4953164407i`, each both | holds |
| 7.3 `isBigO_polygamma_sub_partialSum` | `n = 1, 2`; `N = 1, 2, 3`; `z = 10e^{2i}`, `40e^{2.8i}` | `|r|·|z|^{2N+n+2}`: `0.0335`, `0.0240`, `0.168`, `0.305`; next coefficients `0.0333`, `0.0238`, `0.167`, `0.3` | holds; R04 (Check) |
| 7.4 5.16.1, 5.16.2 | partial sums `N = 2000, 2001`; full sum | average `−1.233700488` against `−π²/8 = −1.23370055`; `1.202056903 = ζ(3) = −ψ″(1)/2` | holds |
| 8.1 `eq_zero_of_carlson`; Landau | `f = sin πz`; 8.5 at `n = 2` | vanishes on `ℕ`, `|f(iy)| = sinh π|y|`, excluded by `c < π`; `g ∈ [0, 4]` gives `log g` both signs | Carlson holds; R05 |
| 8.2 `integral_simplex_dirichlet` | `n = 2`, `z = (0.5 + 0.2i, 1.3, 0.8)` | `1.03261888 − 0.59481988i` both | holds |
| 8.3 `integral_selberg_aomoto` | `n = 2`: `(1, 1, −0.3, m = 0)`, `(1.3, 0.7, 0.4 + 0.6i, 0)`, `(1.3, 0.7, 0.5, 1)`, `(1, 1, 1, 1)` | `3.57142857`; `0.19351689 − 0.32577805i`; `0.253690829`; `1/12`, each both | holds |
| 8.3 route: dimension recursion | `a = 1.3`, `c = 0.7`, `n = 1…4` | `(a + nc)S_{n+1}(a,1,c)` and `S_n(a,1+2c,c)`: `0.267298888599`, `0.0118297108448`, `8.531047897·10⁻⁵`, `9.858285205·10⁻⁸`, each both | holds |
| 8.4 `integral_selberg_laguerre`, `integral_selberg_hermite` | `n = 2`: `(1.3, 0.4, m = 1)`, `(1, −0.3, 0)`; `c = −0.3`, `0.4 + 0.6i`, `1` | `1.45524575`; `2.21815954`; `1.70883281`; `0.688951315 + 0.352825998i`; `2`, each both | holds |
| 8.5 `integral_dyson` | `n = 2`: `b = −0.4`, `0.3 + 0.2i`, `1`; `n = 3`: `b = 1`, `½` | `2.070098325`; `1.07658306 + 0.13225169i`; `2`; `6`; `1.90985932`, each both | holds |

- Previous review at 9b7c4ed: all 11 findings are repaired. R01: README:133–134 "2.3 extends both to every `z ∉ {0, −1, −2, …}`". R02: `tex=0`. R03: all 81 Lean names appear in the README. R04: 8 `### Examples`. R05: README:480–483, 1001–1002. R06: README:241 "(5.1, 6.1, 6.4)". R07: README:665–669. R08: README:1093. R09: README:103–105. R10: README:145–146. R11: the description sentence is replaced. R07 above is new and was already present at 9b7c4ed.
- Sources: 13 of the 15 seeded targets were read against DLMF Release 1.2.8: §§5.2, 5.5, 5.6, 5.7, 5.8, 5.9, 5.12, 5.13, 5.15 and 5.16. Their formulas and constraints agree. 7.1 has no locator (R06), and 8.1 is not verifiable. Also read: 5.4.19 and 5.14.1–5.14.7.
- Libraries at the pins: `#check` resolves 32 Mathlib names of the README. Declarations opened: Mathlib `Gamma/Digamma.lean:56–124`, `Gamma/Deriv.lean:65–72`, `Harmonic/GammaDeriv.lean:97`, `GaussianIntegral.lean:328–345`, `Gamma/Basic.lean:372`. Tau Ceti: `Beta.lean:200, 456`, `MeasureTheory/Integral/Gamma.lean:56`, `HalfDisc/SineIntegral.lean:351`, `Gamma.lean:121–142`.
- Cross-roadmap citations resolved on main: ZerosOfLFunctions 1.1–1.4, AsymptoticExpansions 1.1, 1.3, 4.1–4.3 and 8.6, SpecialFunctionsHypergeometric 4.2 and 6.3, SpecialFunctionsParabolicCylinder 6.6(a), AnalyticNumberTheoryPartI §1.8a, SpecialFunctionsAiry 7.1, ConformalMappingPartII 5.6, RandomMatrices 5.2–5.3. At open heads: ExplicitNumberFields 1.1a, ExplicitZetaBounds 1.1–1.2, 2.4 and 2.5, AnalyticNumberTheoryPartII §4.3.
- Gate: the worker's run reports every check 0. My run reports the same except `depcheck: NOT IN ORDER`, because the configured order lacks this roadmap; the candidate order lists it after ExplicitNumberFields. The dependency check with the candidate order gives "depcheck: 206 roadmaps, 1899 edges, 0 problem(s)". There is no change outside the folder.
- Elaboration: `lake env lean` of `Suggested.lean` gives 75 `sorry` warnings and nothing else.
- One-tactic probe: `simp`, `simp` with the 6 definitions unfolded, `rfl`, `infer_instance` and `norm_num` close none of the 75 theorems.
- Signatures: `#check` with `pp.numericTypes` on four statements shows the casts the README describes. The 81 elaborated signatures match the README; no binder is lost.
- Overlap check: read SpecialFunctionsGeneralizedHypergeometric, SpecialFunctionsStruve, SpecialFunctionsBessel, SpecialFunctionsConfluent, SpecialFunctionsAppell, SpecialFunctionsHypergeometric, SpecialFunctionsAiry, SpecialFunctionsParabolicCylinder and SpecialFunctionsEiLiErfIncompleteGamma. Shared objects and their owners:
  - Complex 5.12.3, 5.13.3 and the periodic Carlson lemma: SpecialFunctionsHypergeometric 6.3 and 4.2, cited.
  - 5.5.6 at `n = 3`: SpecialFunctionsAiry 7.1, with general `n` kept here and said so.
  - 5.8.3 and 5.4.3: SpecialFunctionsParabolicCylinder 6.6(a), cited.
  - Hankel's integral on a vertical line: SpecialFunctionsGeneralizedHypergeometric 5.1, a different contour from 4.2's loop.
  - Outside these lists, 5.8.2: GlobalHolomorphicFunctions 6.1 (R01).
  - Outside these lists, 5.6.6 on `Re s > 0`: also 1.3a of ZerosOfLFunctions' open revision, which cannot be cited as a supplier; 3.3 covers every real `x`.

## Not verifiable

- Widder, *The Laplace Transform* (1941), Chapter II, §5, Theorem 5b, p. 58 (Landau's theorem, 8.1): the sources service found no legal copy.
- Titchmarsh, *The Theory of Functions* (1939), §5.81 (Carlson's theorem, 8.1): the sources service found no legal copy.
- Andrews–Askey–Roy, *Special Functions* (1999), Chapters 3 and 8 (routes of 6.4, 8.3 and 8.5): available from the publisher only.
- Temme, *Special Functions* (1996), Chapter 3 (5.9.2_5): available from the publisher only.
- The contours of DLMF 5.9.2 and 5.12.10–5.12.12, which DLMF fixes by figures: the pinned forms were checked only through the values above.

## Source issues

- none
