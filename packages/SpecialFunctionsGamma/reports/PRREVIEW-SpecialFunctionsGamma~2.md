# Review of SpecialFunctionsGamma (pull request #2191 at 9b7c4ed)

**Verdict:** needs changes

## R01 (P1) — Tau Ceti `Gamma/` declarations are still cited though absent at the pin; 5.7.6 off `Re z > 0` has no owner

**Location:** `TauCetiRoadmap/SpecialFunctionsGamma/README.md:484–485`: "*Needs:* ExplicitNumberFields 1.1a; Tau Ceti `Complex.digamma_eq_gaussSeries` (5.7.6 off `Re z > 0`, for 5.7.7)". Also lines 7–9, 49–50, 100–102, 131–132, 175–176, 269–276, 516, and `Suggested.lean:10–12`.

**Claim:** The pinned Tau Ceti (2fd255d9) has none of the ten `Gamma/` declarations. 5.7.7 for `Re z ≤ 0` therefore rests on an input that no pin, target or roadmap supplies. This is the previous review's R01, partly repaired.

**Witness:** At the pins, `#check @Complex.digamma_eq_gaussSeries`, `@Real.digamma`, `@Complex.digamma_ofReal` and `@Complex.norm_Gamma_le_Gamma_re` each give "Unknown constant". `TauCeti/Analysis/SpecialFunctions/` has `Gamma.lean` and no `Gamma/` directory.

**Repair:**
- 2.3: add the target "5.7.6 for every `z ∉ {0, −1, −2, …}`: pick `n` with `Re z + n > 0`; `Complex.digamma_apply_add_nat` gives `ψ(z) = ψ(z + n) − Σ_{k<n} 1/(z + k)`, and ExplicitNumberFields 1.1a at `z + n`, reindexed, is the series at `z`." Change the *Needs:* line to "ExplicitNumberFields 1.1a; Mathlib `Complex.digamma_apply_add_nat`". Tested at `z = −1.5 + 0.2i`, `n = 3`: both sides are `0.7078599 + 1.6517574i`.
- Lines 7–9: "Tau Ceti has the real Beta integrals 5.12.1 and 5.12.3."
- Lines 49–50: "beside `TauCeti/Analysis/SpecialFunctions/Gamma.lean`".
- Lines 100–102: delete the 5.6.6 clause (3.3 proves 5.6.6 for every `x` from SpecialFunctionsParabolicCylinder 6.6(a)) and the clause "Tau Ceti's `Complex.digamma_eq_gaussSeries` for every `z` off the poles".
- Lines 131–132: "2.3 extends both to every `z ∉ {0, −1, −2, …}` by the recurrence."
- Lines 175–176: replace the parenthesis with "(ZerosOfLFunctions 1.4)".
- Lines 269–276: delete the bullet. Line 516: delete "Tau Ceti `GaussSeries`".
- `Suggested.lean:10–12`: delete "the Tau Ceti files … pin" and "which is Tau Ceti's `Real.digamma x`".

## R02 (P3) — The push gate still fails: `tex=40`

**Location:** `README.md:780–805`: the displays of 5.12.10, 5.12.11 and 5.12.12, each a fenced block indented under a list item, for example line 781 "(2πi)⁻¹ [(e^{−iπ(b−1)} − e^{iπ(b−1)}) ∫₀^{1−ε} …".

**Claim:** The scanner does not read an indented fence as a code block, so `^{` and `_{` inside it count as TeX in prose. This is the previous R03, repaired only for the displays that start in column 0.

**Witness:** Gate at 9b7c4ed: "tex=40 … FAIL", lines 781, 782, 791, 792, 801. On a copy with every indented fence moved to column 0, the gate reports `tex=0`.

**Repair:** Write 5.12.10–5.12.12 as paragraphs, not list items, each followed by its `text` block in column 0, as 4.2 and 6.3 do. Do the same for the Laguerre display of 8.4 (lines 1081–1084).

## R03 (P3) — README and `Suggested.lean` disagree on names

**Location:** `README.md:954`: "(`Complex.hasAsymptoticExpansion_polygamma`); 5.15.8 is the case `n = 1`". Conversely `Suggested.lean`: `Gamma_half_add_mul_I`, `gautschi`, `kershaw`, `beta_pochhammer`, `temmePhi` and 45 more.

**Claim:** A backticked name of the roadmap's own is a claim that `Suggested.lean` declares it; this one is not declared. And 50 of the 79 Lean declarations are named nowhere in the README.

**Witness:** `grep hasAsymptoticExpansion Suggested.lean` is empty. For each of the 50 names, `grep <name> README.md` is empty (first five: `sectorFilter`, `temmePhi`, `absVandermonde`, `Gamma_half_add_mul_I`, `Gamma_quarter_add_mul_I`).

**Repair:**
- Line 954: delete the name and keep `isBigO_polygamma_sub_partialSum`. Add to the module docstring: "5.15.8–5.15.9 in AsymptoticExpansions' `HasAsymptoticExpansion` form is not statable at the pins, which lack that carrier; the truncated `O`-form is stated."
- Put each Lean name in parentheses at its README statement, as 1.1 and 1.4 already do, including the three helper definitions in Conventions.

## R04 (P3) — No layer has `### Examples`

**Location:** `README.md:419` (`### Dependencies` of Layer 1), and likewise Layers 2–8.

**Claim:** Every layer ends with `### Examples` and `### Dependencies`. The README has eight `### Dependencies` headings and no `### Examples`.

**Witness:** `grep -c '^### Examples' README.md` gives 0. SpecialFunctionsAiry and SpecialFunctionsHypergeometric on main each have 9, one per layer.

**Repair:** Add `### Examples` before each `### Dependencies`, with one worked value that crosses the layer's targets. For Layer 1: "5.4.19 at `p/q = ¼`: the `k = 1, 3` terms vanish and `k = 2` gives `−log 2`, so `ψ(¼) = −γ − π/2 − 3 log 2 = −4.2274535`" (computed on both sides).

## R05 (P3) — Two definitions have fewer than three Checks

**Location:** `README.md:466–468` (two Checks for `Complex.invGammaCoeff`) and `README.md:920–922` (two Checks for `Complex.polygamma`).

**Claim:** A definition needs at least three discriminating Checks. Neither set excludes the nearest wrong model (a missing `1/k!`; a missing sign alternation).

**Witness:** 2.2 lists `c₃` and `Σ c_k = 1`; 7.1 lists `polygamma 0 1 = −γ` and the junk value at a pole.

**Repair:**
- 2.2: add "`(1/Γ)″(0) = 2γ = 1.1544313`, so `c₂ = γ`; without the factor `1/k!` the definition would give `c₂ = 2γ`." and "`3c₄ = γc₃ − ζ(2)c₂ + ζ(3)c₁ = −0.1260079`, so `c₄ = −0.0420026`."
- 7.1: add "`polygamma 2 1 = −2ζ(3) = −2.4041138`, negative; a definition without the alternating sign of 5.15.2 would give `+2ζ(3)`."

## R06 (P3) — Use-sites in the supplier contracts and the layer dependencies do not match the *Needs:* lines

**Location:** `README.md:240–241`: "(`integral_Gamma_mul_Gamma_mul_Gamma_mul_Gamma`) (5.4, 6.1, 6.4)"; line 233 "(`integral_Gamma_mul_cpow_neg`) (Layer 6)"; line 231 "(Layer 6, 7.4)"; lines 301–303; lines 717 and 992.

**Claim:** There is no subsection 5.4. No *Needs:* line in Layer 6 uses AsymptoticExpansions 8.7, and 7.4 does not use 8.6. No target of Layer 4 needs Layer 1 or 2, none of Layer 7 needs Layer 4, and 7.2 needs 1.4.

**Witness:** Layer 5 has 5.1–5.3. The *Needs:* lines of 6.1–6.4 name SpecialFunctionsHypergeometric 6.3, AsymptoticExpansions 8.6, 5.1 and ZerosOfLFunctions 1.2. Those of 4.1–4.4 name only suppliers, Mathlib and 4.2. Line 941–942: "*Needs:* 7.1; 2.3; … 1.4".

**Repair:**
- Line 241: "(5.1, 6.1, 6.4)". Line 231: "(Layer 6)". Delete the 8.7 bullet, and "the exponential Mellin inversion" from the Summary (lines 40–41).
- Line 717: "AsymptoticExpansions 4.1; AnalyticNumberTheoryPartI §1.8a." Line 992: "Layers 1 and 2; AsymptoticExpansions 4.1–4.3."
- Lines 301–303: "Layer 4 needs the consumed Gamma integral and Gauss's integral. … Layer 7 needs 1.4, 2.3 and Watson's lemma." Redraw the diagram with Layer 4 unattached and the edges 1 → 7 and 2 → 7.

## R07 (P3) — The route of 5.9.7 uses the complex Gamma integral outside its range

**Location:** `README.md:624–625`: "5.9.6–5.9.7 by rotating `∫₀^∞ t^{z−1} e^{−st} dt = Γ(z) s^{−z}` to `s → ∓i` (Abel's limit on the imaginary axis)."

**Claim:** 5.9.7 is stated for `−1 < Re z < 1`, but AsymptoticExpansions 4.1 needs `Re z > 0`. For `−1 < Re z ≤ 0` the integral in the route diverges at `0`.

**Witness:** AsymptoticExpansions 4.1 on main: "For `Re s > 0` and `Re z > 0`". At `z = 0` the integrand is `e^{−st}/t`.

**Repair:** Add: "For 5.9.7, `∫₀^∞ t^{z−1} sin t · e^{−st} dt = Γ(z)((s − i)^{−z} − (s + i)^{−z})/(2i)` for `0 < Re z < 1`. Both sides are holomorphic in `−1 < Re z < 1`, the right side with the value `arctan(1/s)` at `z = 0`, so the identity theorem extends it; then Abel's limit." Tested at `z = 0`, `s = 0.01`: integral `1.56082`, `arctan(100) = 1.56080`; at `z = −0.3 + 0.4i` the limit is `1.6209311 − 0.5587108i`, the stated value.

## R08 (P3) — Landau's theorem is false for an empty interval

**Location:** `README.md:1003–1006`: "let `F(s) = ∫ w g^s` converge for real `s` in an interval `(s₀, s₁)`, and suppose `F` continues holomorphically from `(s₀, s₁)` to a neighbourhood of `[s₀′, s₁)` with `s₀′ < s₀`."

**Claim:** Nothing requires `s₀ < s₁`. With an empty interval both hypotheses are vacuous and the conclusion fails.

**Witness:** `w = g = 1` on `ℝ`, `s₀ = 1`, `s₁ = 0`, `s₀′ = −1`, `F = 0`: the hypotheses hold, and `∫ w g^s = ∞` for every `s ∈ (−1, 0)`.

**Repair:** "… converge for real `s` in a nonempty interval `(s₀, s₁)`, `s₀ < s₁`, …". The same instance then fails the convergence hypothesis.

## R09 (P3) — Two cases the pinned Tau Ceti proves are not listed as inputs

**Location:** `README.md:86–87`: "Cases of these formulas that Mathlib or Tau Ceti already proves are inputs, not targets; the targets are the remaining cases. The inputs are:".

**Claim:** The list omits the real case of 5.9.3 at `c = 1` and the case `z = 0` of 5.9.7, both proved at the pin.

**Witness:** `TauCeti/MeasureTheory/Integral/Gamma.lean:56` `TauCeti.integral_abs_rpow_mul_exp_neg_abs_rpow` (`∫ |x|^q e^{−|x|^p} = (2/p) Γ((q + 1)/p)`); `TauCeti/Analysis/Contour/WorkedExamples/HalfDisc/SineIntegral.lean:351` `TauCeti.Contour.tendsto_integral_sin_div_atTop`.

**Repair:** Add to the inputs: "5.9.3 for real `z > 0` and `c = 1` (Tau Ceti's `TauCeti.integral_abs_rpow_mul_exp_neg_abs_rpow` at `p = 2`, `q = 2z − 1`), and 5.9.7 at `z = 0` (Tau Ceti's `TauCeti.Contour.tendsto_integral_sin_div_atTop`)." Name both under "From Tau Ceti", and the second in the Check of 4.1.

## R10 (P3) — The deferred material is left to roadmaps that are not named

**Location:** `README.md:10–11`: "apart from the explicit Stirling theory and the Barnes `G`-function, which other roadmaps own." Also the last bullet of "What it does not own" (lines 141–147).

**Claim:** Scope and ownership must name the roadmap and section that owns each deferral. Neither passage names one.

**Witness:** ExplicitZetaBounds at its open head: "### 1.1 Stirling's series with the periodic Bernoulli remainder", "### 2.4 Binet's formulas and the sign of `Re ξ`", "### 2.5 The modulus of `Γ` on vertical lines". It is earlier in the merge order.

**Repair:** In the bullet at 141–147, write "(ExplicitZetaBounds Layers 1–2: Stirling's series 1.1–1.2, Binet's formulas 2.4, the modulus bound 2.5)" after the Stirling items, and name the AnalyticNumberTheoryPartII section that defines `barnesG` after "§5.17". In the Summary, replace "which other roadmaps own" with "which ExplicitZetaBounds and AnalyticNumberTheoryPartII own".

## R11 (P3) — The pull request description contradicts the head

**Location:** Description: "The README cites the roadmap items these implement (ExplicitNumberFields 1.1a, ZerosOfLFunctions 1.4, AsymptoticExpansions 8.6–8.7), so no layer depends on the pin moving."

**Claim:** At this head Layer 2 depends on a declaration that is not at the pin.

**Witness:** `README.md:484`: "Tau Ceti `Complex.digamma_eq_gaussSeries` (5.7.6 off `Re z > 0`, for 5.7.7)"; line 516: "Tau Ceti `GaussSeries`".

**Repair:** After R01, replace the sentence with "The README does not cite them: every layer rests on the pinned libraries and on roadmap items, and 2.3 proves 5.7.6 off `Re z > 0` from ExplicitNumberFields 1.1a."

## Verified sound

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| 1.1 `ascPochhammer_two_mul_eval` 5.2.8 | `a = 0.7 − 1.3i`, `n = 0, 1, 2, 5` | `n = 2`: `−30.1084 − 21.736i` both; odd: `−169.76628 − 63.01828i` both | holds |
| 1.1 `…_eq_sum_lah` 5.2.9 | `n = 0, 1, 2, 5` | `n = 5`: `−169.76628 − 63.01828i` both; `−12.31828 + 31.62172i` both; `L(1,0) = 0` gives `(x)₁ = x` | holds |
| 1.2 `doubleFactorial_odd_eq_Gamma` 5.4.2 | `n = 0, 1, 4` | `1`, `3`, `945` both | holds |
| 1.2 `Gamma_half_add_mul_I` 5.4.4 | `y = 0.3, −1.1` | `2.125574782`; `0.1981223292` both | holds |
| 1.2 `Gamma_quarter_add_mul_I` 5.4.5 | `y = 0.3, −1.1` | `1.949144034 − 1.435268971i`; `0.1403727811 + 0.1400933644i` both | holds |
| 1.2 `digamma_nat_add_half` 5.4.15 | `n = 0, 3` | `−1.963510026`; `1.103156641` both | holds |
| 1.2 `im_digamma_*` 5.4.16–5.4.18 | `y = 0.3, −1.1` | `3.799861455`, `1.156669383`, `0.4665281216`; `−2.028474741`, `−1.567669604`, `−1.119383832` both | holds |
| `digamma_rat` 5.4.19 | `2/5`, `3/7`, `6/7`, `1/4` | `−2.561384545`, `−2.365818757`, `−0.8403958777`, `−4.227453533` both | holds |
| `prod_Gamma_add_div` 5.5.6 | `n = 3, 4`; `z = 0.2 + 0.3i`, `−1.7 + 0.4i`, `−1/3` | `−0.7099665838 − 3.294764847i`; `−2.365182241 − 3.411073331i`; `−1.468236328 + 3.077975077i`; `0` both | holds |
| `digamma_mul_nat` 5.5.9 | `n = 3, 4` | `−0.1558473196 + 1.435654666i`; `0.187643459 + 1.309289555i` both | holds |
| `Gamma_one_add_eq_exp` 5.7.3 | `z = 1.5`, `−1.6 + 0.5i`, `1.9i` | `1.329340388`; `−1.532361141 + 0.330721419i`; `0.1743862936 + 0.0105830181i` both | holds |
| `digamma_one_add_eq_tsum` 5.7.4 | `z = 0.6 − 0.5i` | `0.207902891 − 0.4078889752i` both | holds |
| `digamma_one_add_eq_tsum_odd` 5.7.5 | same three `z` | `0.7031566406`; `0.058996653 + 2.517804251i`; `0.6657039172 + 1.307658968i` both | holds |
| 2.2 `invGammaCoeff_recurrence` 5.7.2 | `k = 3…7` | `(k − 1)c_k`: `−1.311756143`, `−0.1260079051`, `0.6661544455`, `−0.2109886728`, `−0.0577318292` both | holds (R05: Checks) |
| `tendsto_digamma_half_sub` 5.7.7 | `z = 0.3 + 0.8i`, `−1.5 + 0.2i` | `0.1580244022 − 1.686944249i`; `4.747588907 − 0.042994747i` both | holds; route input unowned (R01) |
| `im_digamma_one_add_mul_I_eq_tsum` 5.7.8 | `y = 1.7` | `1.276750837` both | holds |
| `hasSum_deriv_digamma` 5.15.1 | `z = 0.3 + 0.8i`, `−1.5 + 0.2i`, `−½` | `−0.3784933425 − 1.480480798i`; `6.32282456 − 0.0468259556i`; `8.934802201 = π²/2 + 4` | holds |
| 2.4 `hasProd_inv_Gamma` 5.8.2 | `z = 0.4 − 1.2i`; `z = −1` | `1.195648523 − 2.384710747i` both; factor `k = 1` is `0`, both sides `0` | holds |
| 2.4 `hasProd_balanced` 5.8.4–5.8.5 | `m = 3` complex; Wallis; `m = 0` | `0.2866500001 − 0.0121921908i` both; `1.570796327 = π/2`; `1 = 1` | holds |
| 3.1 5.6.2, 5.6.3 | `x = 0.025, 0.05, …, 9.975` | maxima `2.0`, `2.0`, both at `x = 1` | holds |
| 3.2 `gautschi` 5.6.4 | 72 points, `x ∈ [0.001, 30]`, `s ∈ [0.001, 0.999]` | least slack `1.66·10⁻⁵` (lower), `1.63·10⁻⁵` (upper), both positive | holds |
| 3.2 `kershaw` 5.6.5 | same 72 points | least slack `4.1·10⁻¹²` (lower), `4.5·10⁻¹⁴` (upper), both positive | holds |
| `norm_Gamma_add_mul_I_le` 5.6.6 | `x ∈ {−2.5, −0.5, −0.01, 0.01, 0.5, 0.8, 3}`, four `y` | least slack `3.9·10⁻⁷ > 0`; `x = −½`, `y = 1`: `0.4656307 ≤ 3.5449077` | holds |
| `norm_Gamma_add_mul_I_ge` 5.6.7 | `x ∈ {0.5, 0.8, 3}`, four `y` | least slack `0`, at `x = ½` (equality) | holds |
| `norm_Gamma_add_div_Gamma_add_le` 5.6.8 | 25 points; control `b − a = ½` | least slack `0` (`a = 0`, `b = 1`, real `z`); control `564.97 > 31.62` | holds |
| `integral_exp_neg_mul_rpow` 5.9.1 | `μ = 1.7`, `ν = 0.8 + 0.5i`, `z = 1.2 − 0.7i` | `0.608504447 − 0.2577168663i` both | holds |
| `inv_Gamma_eq_hankel` 5.9.2 | `z = 0.3 + 0.7i`, `−2.4 + 0.5i`, `3`, `0`, `−2`; `ε = 0.5, 2` | `0.3731200937 + 1.032285805i`; `−1.533705756 + 1.666245621i`; `0.5`; `0`; `0`, same for both `ε` | holds |
| `inv_Gamma_eq_temme` 5.9.2_5 | `z = 1`, `2.5 + i`, `0.4 − 0.9i` | `1`; `0.7036905931 − 0.6427178343i`; `0.723390786 − 1.444044497i` both; `Φ(0.1) = 0.0050028` | holds |
| 5.9.3, 5.9.4 | `c = 0.7`, `z = 0.3 + 0.4i`; `z = −1.3 + 0.6i` | `1.220553974 − 1.361890799i` both; `0.5002235566 + 0.7404562307i` both | holds |
| 5.9.5 | `n = 0`, `z = −0.4 + 0.3i`; `n = 1`, `z = −1.5 + 0.3i` | `−2.50170856 − 0.56148865i` both; `1.59792727808 + 0.343934638111i` both | holds |
| 5.9.6, 5.9.7 | Abel limit `s = 10⁻⁹`; `z = ½`, `0.3 + 0.4i`; `−½`, `−0.3 + 0.4i`, `0` | `1.253314137`; `0.5617102947 − 1.744125836i`; `2.506628275`; `1.620931054 − 0.5587107951i`; `1.570796327` | holds (R07: route) |
| 5.9.8–5.9.9 | `n = 2, 3` | sin: `0.6266571` / `0.6266571`; `0.4464899` / `0.4464898`; cos is 5.9.6 at `z = 1/n`: `0.6266570687`, `0.7733429421` | holds |
| 5.9.13–5.9.16 | `z = 1.3 + 0.4i` | `−0.08009178885 + 0.4301057781i` three times; `0.4971238761 + 0.4301057781i` twice | holds |
| 5.9.18, 5.9.19, 5.9.20 | four integrals; `n = 2`, `z = 0.8 + 0.3i`; `c = 1`, `z = 2 + i` | `0.5772156649` four times; `1.418380944 − 2.629920519i` both; `0.7315113713 + 0.8761731423i` both | holds |
| 5.12.2, 5.12.4 | `a = 0.7 + 0.3i`, `b = 1.2 − 0.4i`; `z = −0.5 + 0.2i`, `−2 + 0.1i` | `0.4897312133 − 0.1009528285i`; `−6.14387268 + 4.733331983i`; `1.013638615 + 0.2011767936i` both | holds |
| 5.12.5, 5.12.6 | `(1.4, 4.1 + 0.3i)`, `(1, 3)`, `(0.5 + i, −7 + 2i)` | `−0.0568072733 + 0.0603433633i`; `−⅓`; `3.534977 + 7.295221i`; `−0.0818334303 + 0.0633140181i`; `0.6666666667i` both | holds |
| 5.12.7 | `a = 1 + 0.3i`, `b = 0.4 − 0.2i` | `0.9059688934 − 0.4664212931i` both | holds |
| 5.2 `integral_vertical_beta` 5.12.8 | `(w, z, a, b) = (1 + 0.5i, 0.7 − 0.3i, 0.9 + 0.4i, 0.8 − 0.1i)`; `a = −1`, `b = 3.5`; `(0.2 + 3i, 0.1 − 2i, −0.5 + i, 2.5 + 0.5i)` | `0.7061496453 − 0.3049743306i` both; `0` both; `1.4025008 + 2.9432986i` both | holds |
| 5.2 `integral_vertical_beta_one_sub` 5.12.9 | `c = 0.3`: `(0.6 + 0.2i, 0.1 − 0.3i)`, `(2, 1)`; `a = −1`; `b = −1` | `0.9864303534 + 0.3024395776i` both; `2`; `0`; `0` | holds |
| 5.3 `beta_loop_one` 5.12.10 | `(0.7 + 0.2i, −1.3 + 0.5i)`, `(1, ½)`, `(1.5, −2)`; `ε = 0.3, 0.6` | `−1.155938271 − 0.2974244276i`; `0.6366197724 = 2/π`; `−0.125`, same for both `ε` | holds |
| 5.3 `beta_loop_zero` 5.12.11 | `(−0.6 + 0.3i, 0.8 − 0.2i)`, `a = 2`, `a = −2.5`; `ε = 0.3, 0.7` | `0.7133360113 + 0.3069579553i`; `0`; `6.485592373 − 1.419508734i`, same for both `ε` | holds |
| 5.3 `beta_pochhammer` 5.12.12 | `(−0.4 + 0.3i, 1.6 − 0.5i)`, `(½, ½)`, `(2, −1.5 + 0.2i)`, `(−1, −2)`; `ε = 0.2, 0.4` | `−44.60394718 − 43.33414751i`; `12.56637061 = 4π`; `0`; `0`, same for both `ε` | holds (R02: display) |
| 6.1 `integral_Gamma_mul_Gamma_mul_cpow` 5.13.1 | `(0.7 + 0.2i, 0.9 − 0.3i, 0.1, −1 + 0.5i)`; `(½, ½, 0, 1)`; `(−0.5, 1.5 + 0.3i, 0.9, 0.2 − 2i)` | `1.1171919 − 0.9380124i` both; `0.5`; `0.0454358503 + 0.2015335963i` both | holds |
| 6.2 `integral_norm_Gamma_sq_mul_exp` 5.13.2 | `a = 0.8`, `b = 1.1`; `a = ½`, `b = π/2` | `0.3543953388` both; `½ = Γ(1)/2` | holds |
| 6.3 `integral_inv_Gamma_four` 5.13.4 | `(1.7, 1.2, 1.4, 1.9)`; complex; `(1, 1, 1, 1)` | `1.732749152` both; `2.1953761 − 0.0621689i` both; `0.99831` on `|t| < 60` plus tail `0.00169` | holds |
| 6.4 `integral_deBrangesWilson` 5.13.5 | `(½, ½, ½, ½)`; `(0.3, 0.7, 1.1, 0.5)`; complex | `1`; `0.5521062177`; `0.2623265978 − 0.1332563576i` both | holds |
| 7.1 `polygamma` | `ψ″(1)`; wrong model | `−2.404113806 = −2ζ(3)`; unsigned model gives `+2.404` | holds (R05: Checks) |
| `polygamma_one_and_half` 5.15.2–5.15.3 | `n = 1, 2, 3` | `1.644934067`, `−2.404113806`, `6.493939402`; `4.934802201`, `−16.82879664`, `97.40909103` both | holds |
| `polygamma_one_nat_sub_half` 5.15.4 | `n = 1, 2, 4` | `4.934802201`, `0.9348022005`, `0.3303577561` both | holds |
| `polygamma_add_one`, `polygamma_one_sub` 5.15.5–5.15.6 | `n = 0…3`, `z = 0.7 + 0.4i` | differences `≤ 5·10⁻¹⁹`; `n = 3`: `−86.41824494 − 62.83593198i` both; `n = 0`: `−0.458104684 − 2.953728109i` both | holds |
| `polygamma_mul_nat` 5.15.7 | `(n, m) = (1, 3), (2, 2), (3, 4)` | `0.4028276563 − 0.2903189364i`; `−0.1701073209 + 0.6327205754i`; `−0.017305458 − 0.086966908i` both | holds |
| 7.3 `isBigO_polygamma_sub_partialSum` 5.15.8–5.15.9 | `n = 2`, `z = 10e^{2i}`, `N = 1, 2, 3` | remainder times `|z|^{2N+4}`: `0.1678`, `0.1686`, `0.3055`; next coefficients `0.1667`, `0.1667`, `0.3` | holds (R03: name) |
| 7.4 5.16.1, 5.16.2 | full sums | `−1.23370055 = −π²/8`; `1.202056903 = ζ(3)` | holds |
| 8.1 `eq_zero_of_carlson` | `f = sin πz` | vanishes on `ℕ`; `|f(iy)| = sinh π|y|`, type `π`, excluded by `c < π` | holds |
| 8.1 Landau's theorem | `w = g = 1`, `(s₀, s₁) = (1, 0)`, `s₀′ = −1` | hypotheses vacuous, `F = 0`; `∫ w g^s = ∞` on `(−1, 0)` | fails; R08 |
| 8.2 `integral_simplex_dirichlet` 5.14.2 | `n = 2`, `z = (0.5 + 0.2i, 1.3, 0.8)`; `n = 0` | `1.03261888 − 0.59481989i` both; `1 = Γ(z₀)/Γ(z₀)` | holds |
| 8.3 `integral_selberg_aomoto` 5.14.4 | `n = 2`, `a = b = 1`: `c = −0.3`, `0.4 + 0.6i`; `m = 1`; `m = 2`, `c = 1` | `3.571428571`; `0.1657824934 − 0.2541998232i` both; ratio `½` both; `1/36` both | holds |
| 8.4 `integral_selberg_laguerre` 5.14.5 | `n = 2`, `a = 1`, `c = 1`, `m = 0, 1` | `2 = Γ(2)²Γ(1)Γ(3)`; `6 − 4 + 2 = 4 = 2 · 2` | holds |
| 8.4 `integral_selberg_hermite` 5.14.6 | `n = 2`, `c = ½`, `−0.3`, `0.4 + 0.6i` | `1.128379167`; `1.708832812`; `0.6889513148 + 0.3528259978i` both | holds |
| 8.5 `integral_dyson` 5.14.7 | `n = 2`: `b = 0.3 + 0.2i`, `−0.4`, `1`; `n = 1` | `1.076583057 + 0.1322516924i`; `2.070098325`; `2`; `1` both | holds |

- Previous review: R02 and R04–R13 are repaired at this head. R01 is partly repaired (R01 above), R03 is not (R02 above), R14 partly (R11 above).
- Source locators: all 15 seeded targets were read against DLMF Release 1.2.8 (§§5.2, 5.4, 5.6, 5.7, 5.8, 5.12, 5.13, 5.14, 5.15, 5.16); formulas and constraints agree. DLMF excludes every integer `a` in 5.12.11; the multiplied-out form holds at positive integers (`a = 2`: `0` both sides).
- Library at the pins: 50 Mathlib names of the README resolve by `#check`; Mathlib `Gamma/Digamma.lean:48–124`; Tau Ceti `Analysis/SpecialFunctions/Beta.lean:200, 456`, `Gamma.lean:142`, `MeasureTheory/Integral/Gamma.lean:56`, `Analysis/Contour/WorkedExamples/HalfDisc/SineIntegral.lean:351`.
- Cross-roadmap citations resolved on main: ZerosOfLFunctions 1.2–1.4; AsymptoticExpansions 4.1–4.3, 8.6, 8.7; SpecialFunctionsHypergeometric 4.2, 6.3; SpecialFunctionsParabolicCylinder 6.6(a); AnalyticNumberTheoryPartI §1.8a; SpecialFunctionsAiry 7.1; ConformalMappingPartII 5.6; RandomMatrices 5.2–5.3. At its open head: ExplicitNumberFields 1.1a.
- Ownership by object: no second owner for the polygamma definition (ExplicitZetaBounds 1.3 uses `iteratedDeriv` and defines nothing), the general Carlson theorem, the loop contours, or the Selberg, Aomoto, Mehta and Dyson integrals. ArithmeticDirichletSeries 8.1 (Landau for Dirichlet series) is a different carrier.
- Overlap check: read SpecialFunctionsGeneralizedHypergeometric, SpecialFunctionsStruve, SpecialFunctionsBessel, SpecialFunctionsConfluent, SpecialFunctionsAppell, SpecialFunctionsHypergeometric, SpecialFunctionsAiry, SpecialFunctionsParabolicCylinder, SpecialFunctionsEiLiErfIncompleteGamma, EllipticIntegrals; shared objects and owners: 5.5.6 at `n = 3` (SpecialFunctionsAiry 7.1), 5.8.3 and 5.4.3 (SpecialFunctionsParabolicCylinder 6.6(a)), 5.12.3 complex, 5.13.3 and the periodic Carlson lemma (SpecialFunctionsHypergeometric 6.3, 4.2), all cited.
- Gate: `tex=40` FAIL (R02); every other check is 0. Dependency check: "depcheck: 206 roadmaps, 1899 edges, 0 problem(s)". No change outside the folder. Elaboration: `lake env lean` of `Suggested.lean` gives 73 `sorry` warnings and nothing else. The one-tactic probe (`simp` with the six definitions unfolded, then `rfl`) closes none of the 73 theorems. The 79 elaborated signatures were compared with the README statements; no binder is lost.

## Not verifiable

- Widder, *The Laplace Transform* (1941), Chapter II, §5, Theorem 5b, p. 58 (Landau's theorem, 8.1): no open copy found; archive.org holds only lending and library scans, which were not opened.
- Titchmarsh, *The Theory of Functions* (1939), §5.81 (Carlson's theorem, 8.1): in copyright, no open copy.
- Andrews–Askey–Roy, *Special Functions* (1999), Chapters 3 and 8 (routes of 6.4 and 8.5): publisher-only.
- Temme, *Special Functions* (1996), Chapter 3 (5.9.2_5): publisher-only.
- The contours of DLMF 5.12.10–5.12.12: DLMF gives them by figures; the pinned forms were checked through the printed values only.
- The description's claim that Tau Ceti main has the `Gamma/` files: only the pin was checked.

## Source issues

- none
