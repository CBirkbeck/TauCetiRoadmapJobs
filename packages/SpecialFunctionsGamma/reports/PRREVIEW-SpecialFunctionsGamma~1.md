# Review of SpecialFunctionsGamma (pull request #2191 at dcf51f1)

**Verdict:** needs changes

## R01 (P1) — Tau Ceti supplier contract cites declarations that are not at the pin; 5.6.6 and 5.7.6 have no owner

**Location:** `TauCetiRoadmap/SpecialFunctionsGamma/README.md:238–246`: "At Tau Ceti `main`: `TauCeti/Analysis/SpecialFunctions/Gamma/GaussSeries.lean`: `Complex.digamma_eq_gaussSeries` (DLMF 5.7.6)…". The same claims appear at lines 7–9, 47, 97–98 and 161, and in `Suggested.lean:10–12`.

**Claim:** The pinned Tau Ceti (2fd255d9, also main's pin) has none of the ten cited `Gamma/` declarations. So 5.6.6 and 5.7.6, which Scope excludes as "inputs", have no owner, and 1.3, 2.2, 3.2, 3.3 and 7.2 rest on a supplier that does not exist.

**Witness:** At the pin, `grep -rn digamma` over `TauCeti/` finds nothing. `TauCeti/Analysis/SpecialFunctions/` has `Gamma.lean` and `Beta.lean` but no `Gamma/` directory. Only `TauCeti.integral_rpow_mul_one_sub_rpow` (Beta.lean:200) and `TauCeti.integral_rpow_mul_one_add_rpow` (Beta.lean:456) exist.

**Repair:**
- Keep only the `Beta.lean` bullet under "From Tau Ceti".
- Repoint the other inputs:
  - 5.7.6 on `Re z > 0` → ExplicitNumberFields 1.1a (R02). Extend it to `z ∉ {0, −1, …}` by `Complex.digamma_apply_add_nat`, as a target in 3.3.
  - Reality of `ψ(x)` and `ψ(s) = log s + O(1/|s|)` → ZerosOfLFunctions 1.4.
  - Vertical integrability of `Γ` → AsymptoticExpansions 8.6.
  - Mellin inversion of `Γ` → AsymptoticExpansions 8.7 (`integral_Gamma_mul_cpow_neg`).
  - `|1/Γ|` on strips → ZerosOfLFunctions 1.3.
  - 5.6.6 → a new target in 2.3: every factor of SpecialFunctionsParabolicCylinder 6.6(a) `hasProd_Gamma_norm_quotient` is `≥ 1`.
- Summary line 7: replace the Tau Ceti clause with "Tau Ceti has the real Beta integrals 5.12.1 and 5.12.3".
- Delete the Tau Ceti-main sentence of the `Suggested.lean` docstring.

## R02 (P2) — 5.15.1 (and 5.7.6) has a second owner, ExplicitNumberFields 1.1a, which is not cited

**Location:** `README.md:858`: "5.15.1: for `z ∉ {0, −1, −2, …}`, `ψ′(z) = Σ_{k≥0} 1/(k + z)²`." Scope table line 81 claims 5.15.1–5.15.9, and ExplicitNumberFields appears nowhere in the README.

**Claim:** One object, two owners. ExplicitNumberFields (#1944, new, at position 276 in the merge order, before this roadmap) proves both series on `Re z > 0`.

**Witness:** `TauCetiRoadmap/ExplicitNumberFields/README.md:1323–1326` at #1944's head: "Prove the series identities (`dlmf` 5.7.6 and 5.15.1 …): for `Re z > 0`, `ψ(z) = −γ + Σ_{n ≥ 0} (1/(n + 1) − 1/(n + z))` and `ψ'(z) = Σ_{n ≥ 0} 1/(n + z)²`".

**Repair:**
- Add a supplier subsection `### From ExplicitNumberFields`: "1.1a: DLMF 5.7.6 and 5.15.1 for `Re z > 0`, absolutely and locally uniformly convergent (3.2, 3.3, 7.2)."
- Add to "What it does not own": "the series 5.7.6 and 5.15.1 on `Re z > 0` (ExplicitNumberFields 1.1a); 3.3 and 7.2 extend them to every `z ∉ {0, −1, −2, …}` by the recurrences 5.5.2 and 5.15.5."
- Add ExplicitNumberFields 1.1a to the *Needs:* lines of 7.2 and 3.3.

## R03 (P3) — Push gate fails: `tex=40`

**Location:** `README.md:643–644`: "`γ = −∫₀^∞ e^{−t} log t dt = ∫₀^∞ (1/(1 + t) − e^{−t}) dt/t". The same break occurs at 730–731, 736–737 and 744–745.

**Claim:** Each of these inline code spans is split across two lines, so `e^{`, `∫_{` and `^{` fall outside a span on the line the scanner reads.

**Witness:** Gate at dcf51f1: "tex=40 … FAIL", listing "tex: line 643 … line 644 … line 730 … line 731 … line 736".

**Repair:** Turn each of the four displays (5.9.18, 5.12.10, 5.12.11, 5.12.12) into an indented `text` code block, as at lines 593–595. Keep the lead-in sentence ("and the four integrals of 5.9.18 for `γ`:") as prose above the block.

## R04 (P3) — Layers are not in build order

**Location:** `README.md:271`: "Layer 2 needs 1.2, the consumed product formula, and 7.2 for the series of `ψ′`." Also 3.1's *Needs:* at line 483: "3.2 (5.7.4)".

**Claim:** Layer 2 depends on Layer 7 (2.1 at line 407, 2.2 at line 428), and 3.1 depends on 3.2, which comes after it.

**Witness:** The diagram at lines 278–286 draws Layer 7 → Layer 2. Layer 2's Dependencies (line 469) lists "7.2 for 5.15.1".

**Repair:**
- State 5.15.1 in the series layer next to 5.7.6. It needs only the Gauss series and can be written with `deriv Complex.digamma`; 7.2 then cites it.
- Swap Layers 2 and 3, so series and products come before inequalities.
- Put 3.2 before 3.1.
- Update the `k.n` references, the build paragraph and the diagram.

## R05 (P3) — False Check in 4.3

**Location:** `README.md:628`: "Laplace's method at `t = 0`, where `Φ(t) = t²/6 + O(t⁴)`, gives `1/Γ(x) ∼ e^x x^{½−x}/√(2π)`".

**Claim:** The quadratic coefficient is wrong. With `t²/6`, Laplace's method gives √3 times Stirling's value.

**Witness:** `1 − t cot t = t²/3 + t⁴/45 + …` and `log(t/sin t) = t²/6 + t⁴/180 + …`, so `Φ(t) = t²/2 + t⁴/36 + …`. Computed `Φ(0.1) = 0.0050028`.

**Repair:** Replace with "where `Φ(t) = t²/2 + O(t⁴)`".

## R06 (P3) — Padding in `Suggested.lean`

**Location:** `Suggested.lean:197` `hasSum_invGammaCoeff`; `:202` `invGammaCoeff_zero_one_two`; `:147` `prod_Gamma_div`; `:525` the conjunct `riemannZeta 3 = -(1 / 2) * polygamma 2 1`.

**Claim:**
- The first restates the definition: it closes in one tactic.
- The second computes small values.
- The third is `prod_Gamma_add_div` at `z = 1/n`.
- The conjunct is `polygamma_one_and_half` at `n = 2`, which is also README Check line 919.

**Witness:** `simpa [invGammaCoeff, smul_eq_mul, div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using Complex.hasSum_taylorSeries_of_entire Complex.differentiable_one_div_Gamma 0 z` elaborates with no error; `invGammaCoeff 0 = 0` closes by `simp`.

**Repair:** Delete the three theorems and the conjunct from `Suggested.lean`. Drop the backticked `Complex.prod_Gamma_div` (README 369) and `Complex.hasSum_invGammaCoeff` (README 476); the README keeps the statements in prose.

## R07 (P3) — 5.4.3 restates SpecialFunctionsParabolicCylinder 6.6(a)

**Location:** `README.md:320`: "5.4.3: `|Γ(iy)| = (π/(y sinh πy))^{1/2}` for real `y ≠ 0`." Also `Suggested.lean:95` `norm_Gamma_mul_I`.

**Claim:** A roadmap on main already owns this identity in an equivalent form. It is restated here, not cited.

**Witness:** `TauCetiRoadmap/SpecialFunctionsParabolicCylinder/README.md:817` (main): "`|Γ(1 + iy)|² = πy / sinh(πy)` for `y ≠ 0` (`norm_Gamma_one_add_mul_I_sq`)". Since `Γ(1 + iy) = iyΓ(iy)`, this is 5.4.3, as the README's own Check at line 340 says.

**Repair:**
- 1.2: "5.4.3 is SpecialFunctionsParabolicCylinder 6.6(a) `norm_Gamma_one_add_mul_I_sq` divided by `|iy|² = y²`."
- Add 6.6(a) to 1.2's *Needs:* and to "What it does not own".
- Change the Scope row to "5.4.2, 5.4.4–5.4.5, 5.4.15–5.4.18".
- Delete `norm_Gamma_mul_I` from `Suggested.lean`.

## R08 (P3) — The periodic Carlson lemma on main is not cited

**Location:** `README.md:112`: "| Carlson's theorem | 8.1 |", listed among results that "neither Mathlib nor Tau Ceti nor the consumed roadmaps provide". 8.3's route (lines 983–986) uses only a 1-periodic ratio.

**Claim:** A consumed roadmap already owns the periodic case, and that case is all 8.3 needs.

**Witness:** `TauCetiRoadmap/SpecialFunctionsHypergeometric/README.md:664` (main): "the periodic Carlson lemma: a `1`-periodic function holomorphic on a neighbourhood of `Re w ≥ 0`, bounded by `C (1 + |Im w|)^K e^{σ|Im w|}` with `σ < π` … vanishing at `0`, vanishes".

**Repair:**
- 8.1: add "SpecialFunctionsHypergeometric 4.2 owns the periodic case; the general theorem is needed for Dyson's integral (8.5), whose normalised integral is not periodic in `b`."
- 8.3: cite SpecialFunctionsHypergeometric 4.2 for the periodic step, in its *Needs:* line and in the supplier contract.

## R09 (P3) — Downstream consumers names earlier roadmaps that cannot consume this one

**Location:** `README.md:1044–1052`: "SpecialFunctionsAiry 7.1 (`Complex.Gamma_mul_Gamma_add_third`) is the case `n = 3` of 1.4. … The roadmaps for DLMF Chapters 10–16 use 1.4 …".

**Claim:** Every roadmap named is on main and earlier in the order. Two of them (Chapter 12, Chapter 15) supply this roadmap. None of them, and no open roadmap, cites it.

**Witness:** `roadmaps grep SpecialFunctionsGamma` finds no citing roadmap, on main or at any open head. RandomMatrices 5.3 normalises its beta ensembles itself.

**Repair:**
- Replace the section body with: "Later roadmaps that need Gauss's multiplication formula for every `n` (1.4), the Beta integrals and loop contours (Layer 5) or polygamma values (Layer 7) cite those sections."
- Move the RandomMatrices 5.2–5.3 overlap sentence into Scope and ownership.

## R10 (P3) — 5.2's route input is misattributed to Hankel's loop

**Location:** `README.md:715–720`: "Hankel's formula 4.2 deformed to a vertical line gives `(w + it)^{−a} = Γ(a)⁻¹ ∫₀^∞ u^{a−1} e^{−(w+it)u} du` … *Needs:* 4.2, 5.1".

**Claim:** This identity is the complex Gamma integral, not a Hankel deformation. The real supplier is missing from *Needs:*.

**Witness:** AsymptoticExpansions 4.1 (`integral_cpow_mul_exp_neg_mul_Ioi_of_re_pos`) at `s = a`, `z = w + it`, with `Re z = Re w > 0`, is exactly this formula.

**Repair:**
- Replace the phrase with "the complex Gamma integral (AsymptoticExpansions 4.1) at `z = w + it` gives …".
- Change *Needs:* to "AsymptoticExpansions 4.1; 5.1; Mathlib `mellinInv_mellin_eq`".
- Drop "Layer 4 (4.2)" from Layer 5's Dependencies and from the build paragraph.

## R11 (P3) — Landau's theorem has no locator

**Location:** `README.md:935–940`: "**Landau's theorem.** Let `w ≥ 0` and `g > 0` be measurable … equals the continuation there."

**Claim:** A theorem that two layers depend on (8.3, 8.4 and 8.5) cites no source.

**Witness:** No source appears at the claim or in References.

**Repair:** Add the theorem number and page of Landau's theorem, the singularity at the real point of the abscissa of convergence for a nonnegative determining function (for example in Widder, *The Laplace Transform*, Chapter II). Add the work to References.

## R12 (P3) — Wrong Mathlib declaration; the real case of 5.9.1 is not listed as an input

**Location:** `README.md:264`: "`Complex.integral_rpow_mul_exp_neg_mul_rpow`, `integral_gaussian`, …".

**Claim:** The cited declaration is a different integral, and Mathlib's real form of 5.9.1 goes unlisted.

**Witness:** At the pin, `Complex.integral_rpow_mul_exp_neg_mul_rpow : ∫ (x : ℂ), ‖x‖ ^ q * rexp (-b * ‖x‖ ^ p) = 2 * π / p * …` is an integral over the plane. The half-line form is `integral_rpow_mul_exp_neg_mul_rpow` (`MeasureTheory/Integral/Gamma.lean:44`).

**Repair:**
- Replace the name with `integral_rpow_mul_exp_neg_mul_rpow`.
- Add to the inputs at line 91: "5.9.1 for real `ν > 0`, `z > 0` (`integral_rpow_mul_exp_neg_mul_rpow`)".

## R13 (P3) — DLMF 5.9.11 is filed under the wrong formulas

**Location:** `README.md:1063`: "Hermite's formulas for `Γ*` (5.9.11–5.9.11_2)". The same range appears at line 133.

**Claim:** 5.9.11 is not a `Γ*` formula.

**Witness:** DLMF 5.9.11 is the Mellin–Barnes integral of `Ln Γ(z + 1)` with `ζ(−s)`, which the README itself lists at line 1066. Only 5.9.11_1–5.9.11_2 involve `Γ*`.

**Repair:** Write "formulas for `Γ*` (5.9.11_1–5.9.11_2)" at lines 133 and 1063.

## R14 (P3) — The pull request description contradicts the pins and the ownership rule

**Location:** Description: "Tau Ceti has: the Gauss series of `ψ` (5.7.6); `|Γ(x + iy)| ≤ Γ(x)` (5.6.6); reciprocal-Gamma bounds; a holomorphic `log Γ` on sectors; … the Mellin inversion of `Γ`." Also: "#1944 … whichever lands first, the other can cite it."

**Claim:** At the pin, Tau Ceti has only the real Beta integrals (R01). ExplicitNumberFields is earlier in the merge order, so it is the single owner (R02).

**Witness:** R01 (`grep digamma` over the pinned `TauCeti/` is empty). Merge-order candidate: ExplicitNumberFields at line 276, SpecialFunctionsGamma at line 408.

**Repair:** Replace with:
- "Tau Ceti at the pin has the real Beta integrals 5.12.1 and 5.12.3 (`TauCeti.integral_rpow_mul_one_sub_rpow`, `TauCeti.integral_rpow_mul_one_add_rpow`)."
- "ExplicitNumberFields 1.1a owns 5.7.6 and 5.15.1 on `Re z > 0`; this roadmap cites it and extends both off the half-plane."
- Under Dependencies add "ExplicitNumberFields 1.1a (an open roadmap, earlier in the merge order)", and write "5.9.11_1–5.9.11_2" in the Outside bullet.

## Verified sound

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| `ascPochhammer_two_mul_eval` 5.2.8 | n = 0, 1; a = 1 | `(a)₃ = a(a+1)(a+2) = 8(a/2)(a/2+1)((a+1)/2)`; `(1)₂ = 2 = 4·½·1` | holds |
| `ascPochhammer_eval_eq_sum_lah` 5.2.9 | n = 1, 2 | `x(x+1) = 2x + x(x−1)`; `L(1,0) = 0` gives `(x)₁ = x` (truncated model gives `x+1`) | holds |
| `descPochhammer_eval_eq_sum_lah` 5.2.9 | n = 2 | `x(x−1) = −2x + x(x+1)` | holds |
| `doubleFactorial_odd_eq_Gamma` 5.4.2 | n = 0, 1 | `1 = π^{−½}·2·Γ(3/2)`; `3 = π^{−½}·4·Γ(5/2)` | holds |
| `norm_Gamma_mul_I` 5.4.3 (R07) | y = 0.3 | 3.101936375 / 3.101936375 | holds; restated |
| `Gamma_half_add_mul_I` 5.4.4 | y = 0.3, 0 | 2.125574782 / 2.125574782; `π / π` | holds |
| `Gamma_quarter_add_mul_I` 5.4.5 | y = 0.3 | 1.949144034−1.435268971i both | holds |
| `digamma_nat_add_half` 5.4.15 | n = 3 | 1.103156641 both | holds |
| `im_digamma_mul_I` 5.4.16 | y = 0.3 | 3.799861455 both | holds |
| `im_digamma_half_add_mul_I` 5.4.17 | y = 0.3 | 1.156669383 both | holds |
| `im_digamma_one_add_mul_I` 5.4.18 | y = 0.3 | 0.4665281216 both | holds |
| `digamma_rat` 5.4.19 | 2/5, 3/7 | −2.561384545 both; −2.365818757 both | holds |
| `prod_Gamma_add_div` 5.5.6 | n = 3, 4; z = 0.2+0.3i | −0.70997−3.29476i; −2.36518−3.41107i (diff ≤ 6e−15); zero sets both `nz ∈ −ℕ` | holds |
| `prod_Gamma_div` 5.5.7 (R06) | n = 5, 1 | 17.65528508 both; empty product 1 | holds; padding |
| `digamma_mul_nat` 5.5.9 | n = 3, z = 0.2+0.3i | −0.1558473+1.4356547i both | holds |
| `inv_Gamma_add_inv_Gamma_inv_le_two` 5.6.2 | x = 0.3, 1.05, 1.7, 5 | 0.694, 1.998, 1.760, 0.259 ≤ 2; equality at 1 | holds |
| `inv_Gamma_sq_add_inv_Gamma_inv_sq_le_two` 5.6.3 | same x | 0.241, 1.998, 1.646, 0.049 ≤ 2 | holds |
| `gautschi` 5.6.4 | (1, ½), (0.2, 0.9), (3, 0.1) | 1 < 1.128379 < 1.414214; 0.85134 < 0.96512 < 1.01840; 2.68788 < 2.73023 < 3.48220 | holds |
| `kershaw` 5.6.5 | (1, ½), (0.2, 0.9) | 1.113029 ≤ 1.128379 ≤ 1.131717; 0.965017 ≤ 0.965121 ≤ 0.965188 | holds |
| `norm_Gamma_add_mul_I_ge` 5.6.7 | (0.8, 1.3), (½, 2), (3, 0.7) | 0.2136 ≤ 0.3501; 0.108321 = 0.108321; 0.936 ≤ 1.818 | holds |
| `norm_Gamma_add_div_Gamma_add_le` 5.6.8 | (½, 3/2, 0.1+3i), (0, 2, 0.01+0.5i) | 0.32686 ≤ 0.33315; 1.774 ≤ 3.998; `b−a = ½` fails near 0 (Check) | holds |
| `hasSum_invGammaCoeff` 5.7.1 (R06) | z = 0.7+0.4i | one-tactic closure; 9-term partial sum within 1.8e−4 | padding |
| `invGammaCoeff_zero_one_two` (R06) | k = 0 | `c₀ = 0` by `simp` | padding |
| `invGammaCoeff_recurrence` 5.7.2 | k = 3…6 | −0.6558780715, −0.0420026350, 0.1665386114, −0.0421977346 = tabulated | holds |
| `Gamma_one_add_eq_exp` 5.7.3 | z = 1.5, −1.6+0.5i, 1.9i; z = −1 | diffs 3e−13, 2e−11, 5e−11; at −1 both sides 0 | holds |
| `digamma_one_add_eq_tsum` 5.7.4 | z = 0.6−0.5i | 0.207902891−0.407888975i both | holds |
| `digamma_one_add_eq_tsum_odd` 5.7.5 | z = 1.5, 1.2+0.9i, −1.7+0.3i | diffs 7e−12, 9e−12, 4e−10 | holds |
| `tendsto_digamma_half_sub` 5.7.7 | z = 0.3+0.8i | 0.1580244022−1.686944249i both | holds |
| `im_digamma_one_add_mul_I_eq_tsum` 5.7.8 | y = 1.7, 1 | 1.2767508 / 1.2767500 (tail); 1.076674 / 1.076674 | holds |
| `hasProd_inv_Gamma` 5.8.2 | z = 0.4−1.2i | 1.19565−2.38471i both (truncation 1e−5) | holds |
| `hasProd_balanced` 5.8.4–5.8.5 | m = 3 complex; Wallis | 0.837545+0.148689i both; `π/2` | holds |
| `integral_exp_neg_mul_rpow` 5.9.1 | μ = 1.7, ν = 0.8+0.5i, z = 1.2−0.7i | 0.608504447−0.257716866i both | holds |
| `inv_Gamma_eq_hankel` 5.9.2 | z = 0.3+0.7i, −2.4+0.5i, 3; ε = 0.5, 2 | diffs ≤ 1e−14; same value for both ε | holds |
| `inv_Gamma_eq_temme` 5.9.2_5 (R05) | z = 1, 2.5+i, 0.4−0.9i | diffs ≤ 3e−15; `Φ(0.1) = 0.0050028 ≈ t²/2`, not `t²/6` | holds; Check false |
| `integral_abs_cpow_mul_exp_neg_sq` 5.9.3 | c = 0.7, z = 0.3+0.4i | 1.220553974−1.361890799i both | holds |
| `Gamma_eq_integral_Ioi_one_add_tsum` 5.9.4 | z = −1.3+0.6i | 0.500223557+0.740456231i both | holds |
| `Gamma_eq_integral_exp_sub_taylor` 5.9.5 | n = 1, z = −1.5+0.3i | 1.597927278+0.343934638i both | holds |
| `tendsto_integral_cpow_mul_cos` 5.9.6 | z = ½ | `√(π/2) = 1.25331 = Γ(½)cos(π/4)` | holds |
| `tendsto_integral_cpow_mul_sin` 5.9.7 | z = ½, −½, 0 | 1.25331 both; `√(2π) = 2.50663` both; `π/2` both | holds |
| `tendsto_integral_cos_pow_sin_pow` 5.9.8–5.9.9 | n = 2, 3 | `√(π/8) = 0.62666` both; `Γ(4/3)cos(π/6) = 0.77334` | holds |
| `digamma_eq_log_add_integral` 5.9.13 | z = 1.3+0.4i | −0.080091789+0.430105778i both | holds |
| `digamma_eq_integral_one_add` 5.9.14 | z = 1.3+0.4i | same value, diff 3e−16 | holds |
| `digamma_eq_log_sub_integral` 5.9.15 | z = 1.3+0.4i, 1 | diff 1e−16; integral at 1 = 0.038608 | holds |
| `digamma_add_eulerMascheroni` 5.9.16 | z = 1.3+0.4i | 0.4971238761+0.4301057781i, both integrals | holds |
| `eulerMascheroni_eq_integrals` 5.9.18 | four integrals | 0.5772156649 each (diffs ≤ 9e−16) | holds |
| `iteratedDeriv_Gamma_eq_integral` 5.9.19 | n = 2, z = 0.8+0.3i | 1.4183809−2.6299205i / five-point FD 1.4183811−2.6299204i | holds |
| `integral_segment_Gamma` 5.9.20 | c = 1, z = 2+i | 0.7315113713+0.8761731423i both | holds |
| `integral_sin_cpow_mul_cos_cpow` 5.12.2 | a = 0.7+0.3i, b = 1.2−0.4i | 0.4897312133−0.1009528285i both | holds |
| `integral_beta_div_add_cpow` 5.12.4 | a = 0.6, b = 1.3+0.2i, z = −0.5+0.2i | −6.14387268+4.73333198i both | holds |
| `integral_cos_cpow_mul_cos` 5.12.5 | (1.4, 4.1+0.3i), (1, 3) | −0.0568073+0.0603434i both; −⅓ both | holds |
| `integral_sin_cpow_mul_exp` 5.12.6 | (1.5, 0.7+0.2i) | 0.8097158+1.2946121i both | holds |
| `integral_cosh_div_cosh_cpow` 5.12.7 | a = 1+0.3i, b = 0.4−0.2i | 0.9059688934−0.4664212931i both | holds |
| `integral_vertical_beta` 5.12.8 | w = 1+0.5i, z = 0.7−0.3i, a = 0.9+0.4i, b = 0.8−0.1i; b = −1 | 0.7061496−0.3049743i both; 0 both | holds |
| `integral_vertical_beta_one_sub` 5.12.9 | c = 0.3; (0.6+0.2i, 0.1−0.3i), (2, 1) | 0.98643035+0.30243958i both; 2 both | holds |
| `beta_loop_one` 5.12.10 | a = 0.7+0.2i, b = −1.3+0.5i; ε = 0.3, 0.6 | −1.155938271−0.297424428i both radii | holds |
| `beta_loop_zero` 5.12.11 | a = −0.6+0.3i, b = 0.8−0.2i; ε = 0.3, 0.7; a = 2 | 0.71333601+0.30695796i both; 0 both | holds |
| `beta_pochhammer` 5.12.12 | a = −0.4+0.3i, b = 1.6−0.5i; ε = 0.2, 0.4; a = b = ½ | −44.60394718−43.33414751i both; `4π` | holds |
| `integral_Gamma_mul_Gamma_mul_cpow` 5.13.1 | (0.7+0.2i, 0.9−0.3i, 0.1, −1+0.5i); c > Re b | 1.117191922−0.93801242i both; c outside range: −0.268−0.118i ≠ 0.093−0.655i | holds |
| `integral_norm_Gamma_sq_mul_exp` 5.13.2 | a = 0.8, b = 1.1 | 0.3543953388 both | holds |
| `integral_inv_Gamma_four` 5.13.4 | (1.7, 1.2, 1.4, 1.9); complex | 1.732749152 both; 2.0311265−0.1054212i both | holds |
| `integral_deBrangesWilson` 5.13.5 | (0.3, 0.7, 1.1, 0.5); complex | 0.5521062177 both; 0.29449398−0.05555637i both | holds |
| `hasSum_polygamma_one` 5.15.1 (R02) | z = 0.7+0.4i | 1.50844003−1.54815865i / partial sum (tail 5e−7) | holds; second owner |
| `polygamma_one_and_half` 5.15.2–5.15.3 | n = 1, 2, 3 | 1.644934, −2.404114, 6.493939; 4.934802, −16.828797, 97.409091 both | holds |
| `polygamma_one_nat_sub_half` 5.15.4 | n = 1, 2, 4 | 4.934802, 0.934802, 0.330358 both | holds |
| `polygamma_add_one` 5.15.5 | n = 1, 2, 3 at 0.7+0.4i | diffs ≤ 1.3e−15 | holds |
| `polygamma_one_sub` 5.15.6 | n = 1, 2 at 0.7+0.4i; n = 0 | 1.35495+2.70623i; 14.74553−10.48381i both; sign `−1` at n = 0 | holds |
| `polygamma_mul_nat` 5.15.7 | (n, m) = (1, 3), (2, 2), (3, 4) | diffs ≤ 6e−17 | holds |
| `isBigO_polygamma_sub_partialSum` 5.15.8–5.15.9 | n = 2, z = 10e^{2i}, N = 1, 2, 3 | remainder 1.68e−7, 1.69e−9, 3.06e−11 ≈ next term | holds |
| `tendsto_sum_neg_one_pow_polygamma_one` 5.16.1 | partial sums | −1.23370055 = −π²/8 | holds |
| `hasSum_polygamma_one_div` 5.16.2 (R06) | sum, `ψ″(1)` | 1.2020564 (tail) / 1.2020569; −½ψ″(1) = 1.2020569 | holds; conjunct padding |
| `eq_zero_of_carlson` (R08) | `f = sin πz` | vanishes on ℕ, `|f(iy)| = sinh π|y|` has type π, excluded by `c < π` | holds |
| `integral_simplex_dirichlet` 5.14.1–5.14.2 | n = 2, z = (0.5+0.2i, 1.3, 0.8) | 1.03261888−0.59481989i both; volume `1/n!` | holds |
| `integral_selberg_aomoto` 5.14.4 | n = 2: (m, a, b, c) = (1, 1.5, 2, 0.7), (1, 0.6+0.2i, 1.1, 0.25), (1, 1, 1, −0.3) | 0.0057748813 both; 0.40274677−0.22487826i both; 1.7857135 / 1.7857143 | holds |
| `integral_selberg_laguerre` 5.14.5 | n = 2: (1, 1.5, 0.5), (0, 0.8, −0.2), (2, 1.3, 0.9) | 2 both; 2.217693554 both; 4.929715853 both | holds |
| `integral_selberg_hermite` 5.14.6 | n = 2, c = 0.5, −0.3 | `2/√π = 1.128379` both; `4^cΓ(c+½)/√π = 1.708833 = Γ(1+2c)/Γ(1+c)` | holds |
| `integral_dyson` 5.14.7 | n = 3, b = 1; n = 2, b = 0.3+0.2i, −0.4 | 6 both; 1.07658306+0.13225169i both; 2.0700983 both | holds |

- **Sources:** all 15 seeded targets checked against DLMF Release 1.2.8 (2026-09-15, as the README states): 5.2.8–5.2.9, 5.4.2–5.4.19, 5.6.1–5.6.9, 5.7.1–5.7.8, 5.8.1–5.8.5, 5.9.1–5.9.20 (5.9.2_5 is sourced by DLMF to Temme 1996b (3.38) p. 71), 5.12.1–5.12.12 (the 5.12.9 TeX reads `1/(b B(a,b))`), 5.13.1–5.13.5, 5.14.1–5.14.7, 5.15.1–5.15.9, 5.16.1–5.16.2 and §5.1 notation (`n ≥ 0`, so 5.9.8 is `n = 2, 3, …`). Hypotheses agree.
- **Library at the pins:**
  - Mathlib `Gamma/Digamma.lean:50–124`, `Gamma/Beta.lean:543`, `Complex/TaylorSeries.lean:120`, `Gaussian/GaussianIntegral.lean:341`, `MeasureTheory/Integral/Gamma.lean:44`, `MellinTransform.lean:86`, `Probability/Distributions/Beta.lean:33`.
  - Tau Ceti `Analysis/SpecialFunctions/Beta.lean:200, 456` and `Gamma.lean` (no `digamma`).
  - The other cited Mathlib names were resolved.
- **Cross-roadmap citations resolved:**
  - On main: ZerosOfLFunctions 1.1–1.4; AsymptoticExpansions 1.1, 1.3, 4.1–4.3, 8.6, 8.7; SpecialFunctionsHypergeometric 4.2, 6.3; SpecialFunctionsParabolicCylinder 6.6(a); AnalyticNumberTheoryPartI §1.8a, §0.23a; ConformalMappingPartII 5.6; SpecialFunctionsAiry 7.1; RandomMatrices 5.2–5.3.
  - At open heads: ExplicitNumberFields 1.1a, and ExplicitZetaBounds 1.3 (positive-axis polygamma brackets, a different statement from 7.3).
- **Ownership:** no other owner found, by object, for the polygamma definition, the general Carlson theorem, the Hankel and Beta loop contours, or the Selberg/Aomoto/Dyson integrals. Sibling heads #1987, #1995, #2121, #2129, #2136 and #2166 were grepped: none cites this roadmap, and #2136's vertical-line Hankel integral is its own auxiliary.
- **Gate:** `tex=40` FAIL (R03); every other check is 0. The depcheck with the candidate order reports "208 roadmaps, 1918 edges, 0 problem(s)". No change outside the folder.
- **Elaboration:** `lake env lean` of `Suggested.lean` gives exactly 76 `sorry` warnings and nothing else. Every elaborated `#check @name` type was compared with its README statement; no section binder was lost. The one-tactic probe closed `hasSum_invGammaCoeff` and `invGammaCoeff 0 = 0`.
- **Overlaps:** the overlap report lists no dropped or revision-only ids; its five closest roadmaps were read for ownership.

## Not verifiable

- Titchmarsh, *The Theory of Functions* (1939), §5.81 (Carlson's theorem, 8.1): no legal open copy found; still in copyright.
- Andrews–Askey–Roy, *Special Functions* (1999), Chapters 3 and 8 (route pointers in 6.4, 8.5): publisher-only, not read.
- Temme, *Special Functions* (1996), Chapter 3: not read; the locator is confirmed only through DLMF's source note for 5.9.2_5.

## Source issues

- none
