# Review of ExplicitCharacterSumsAndSieves (pull request #1948 at 0655dd7)

**Verdict:** needs changes

Scope: `TauCetiRoadmap/ExplicitCharacterSumsAndSieves/README.md` (1886 lines) and
`TauCetiRoadmap/ExplicitCharacterSumsAndSieves/Suggested.lean` (475 lines, 16 definitions, 21
theorems), every line read. The pull request changes nothing outside the folder. Gate at this head:
every check passes. Dependency check, as run:

    depcheck: 244 roadmaps, 2461 edges, 0 problem(s)

## R01 (P2) — the van der Corput toolkit has two owners: ExplicitZetaBounds §§4.1–4.5 and Layers 0–1 here

Location: `README.md` lines 45–47, "Owned here. The van der Corput finite inequality … the derivative
tests for exponential sums with explicit constants (Layer 1)"; §§1.1–1.3 (lines 520–603); the Part II
list, lines 101–107 (B-process, recursive `k`-th tests) and 132–133 (Montgomery–Vaughan weighted large
sieve). The README never mentions ExplicitZetaBounds.

Claim: this roadmap owns Kusmin–Landau (both forms), the A-process and Arias de Reyna's
second-derivative tests. It also plans the B-process, the recursive `k`-th tests and the weighted large
sieve for its Part II. ExplicitZetaBounds §§4.1 and 4.3 cite the same locators as §§1.1–1.3 here
(`ariasdereyna2024` lines 90–104, 109–114, 183–189; `hiarypatelyang2024` lines 86–92). Its README line 1242
counts Patel's fourth and fifth tests as cases of its §4.4.

Witness: `TauCetiRoadmap/ExplicitZetaBounds/README.md` (#1954, ORDER line 270; this roadmap is 272),
lines 2310–2312: "ExplicitCharacterSumsAndSieves takes the van der Corput toolkit 4.1–4.5 … and the
weighted and maximal large sieves of 6.5; this roadmap, earlier in the merge order, owns them."

Repair: ExplicitZetaBounds is earlier and itself consumes these tools (its 4.6–4.8), so it is the owner.
Add `### From TauCetiRoadmap.ExplicitZetaBounds` citing §4.1 (Kusmin–Landau, symmetric and
asymmetric), §4.2 (A-process), §4.3 (Arias de Reyna's Lemmas 4–5) and §6.5 (weighted large sieve);
delete §§1.1–1.3 and the `q`-shift corollary of §0.3, and remove `kusmin_landau`,
`second_derivative_test`, `second_derivative_test_sqrt` from `Suggested.lean` (Scope then lists them as
consumed). Keep §0.3 for complex coefficients, §§1.4–1.5 (Patel's fixed-`k` constants) and §1.6
(Arias de Reyna's Theorem 7) as kept variants, each with one clause saying how it differs from
ExplicitZetaBounds 4.4. Drop the B-process and the Yang/Patel–Yang recursive tests from the Part II
list, and let Part II consume ExplicitZetaBounds §6.5. Check: the new edges point to line 270 of
ORDER.txt from line 272, so the dependency check stays clean.

## R02 (P2) — §5.5's route through the unweighted large sieve cannot reach the constant `2`

Location: `README.md` lines 1524–1529, "for large `y/k`, SieveMethodsAndPrimePatterns §2.9 with one forbidden
class … so that `J(Q) = S_k(Q) ≥ (φ(k)/k)(log Q + 1.07)` … with `z = Q` chosen as in
montgomeryvaughan1973 §3"; *Needs:* at line 1562.

Claim: §2.9's bound `(H − 1 + Q²)/J(Q)` plus `π(Q)` gives the sifted count `≤ 2y/(φ(k) log(y/k))`.
In general, `Q² = εt` and `S(Q) ≥ log Q + 1.07` need `εL − log ε ≤ 2.14` with `L = log t`. The left side
is at least `1 + log L`, so the route fails for every `t > 23`.

Witness: at `k = 1` the route needs `(t + Q²)/S(Q) + π(Q) ≤ 2t/log t` for some `Q`. With exact `S(Q)`
the minimum is `301.77` at `t = 1000` (target `289.53`), and `18 497` at `t = 10⁵` (target `17 372`).

Repair: replace the large-`y/k` step by Montgomery–Vaughan's weighted large sieve, as
ExplicitPrimeCounting §0.1's route does (`TauCetiRoadmap/ExplicitPrimeCounting/README.md` at #1945, the bullets after
"Route, after Montgomery–Vaughan"): sifted count `≤ (k/φ(k))(1/L₁(Q) + π(Q))` with
`L₁(Q) = Σ_{q ≤ Q} μ²(q)/(φ(q)(N + (3/2)qQ))`, `N = ⌊y/k⌋ + 1`. Cite ExplicitZetaBounds §6.5 in the
§5.5 *Needs:* and in the supplier contracts. Tested: `min_Q (1/L₁(Q) + π(Q))` is `269.53` at `t = 1000`
(`Q = 22`) and `16 209` at `t = 10⁵`, both below `2t/log t`. §2.9 stays for §5.6, where the target constant
is `1` and Fan's `z² log z < 0.89x` closes it.

## R03 (P2) — Treviño's Burgess theorems are statable at the pins but absent from `Suggested.lean`

Location: `Suggested.lean` lines 36–42 ("they are not simple definitions, and stating the theorems
without the propositions would assert more than the roadmap proves"); `README.md` lines 1723–1725.

Claim: Treviño's Theorems 1–2 and Corollaries 1–2 are not statable at the pins.

Witness: the docstring names no missing carrier. (46)/(47) (`trevino2015` lines 889–941) is one closed
form in `A, B, k, s, log p` over `Real.rpow`, `Real.log` and `Nat.doubleFactorial`, with
`s = (c₁(r−1)/c′₁)^{r(r−1)}`. Tables 1 and 5 have 27 rows each.

Repair: define `trevinoClosing r k A B s p` (the right side of (46) for `r = 2`, of (47) otherwise),
`trevinoTable1 : ℕ → ℝ` and `trevinoTable5 : ℕ → ℝ × ℝ` for the column `p₀ = 10⁷` (nine rows), and
`TrevinoTable1Certificate : Prop` as README §6.7 states it for that column; state
`burgess_trevino_corollary1` (`p ≥ 10⁷`, every `r ≥ 1`, constant `2.74`, exponent `1/r`) under it.
Checked on the row that would refute a wrong transcription: at `r = 2`, `p = 10⁷`, `k = 2/45`,
`c′₁ = 2.738`, `A = 40.27`, the closing value is `2.738070 ≤ 2.7381`. Keep Theorem 2 in the docstring only
if a second column is judged too long, and say so there.

## R04 (P3) — §0.3 says Arias de Reyna's Lemma 6 is not a corollary; it is

Location: `README.md` lines 405–409 ("so that form is not a corollary of the inequality above and is
not used here") and the Check at lines 423–427.

Claim: the real-part form of the normalised inequality does not follow from the main inequality.

Witness: with `Q = HΣ|b|² + 2R ≥ 0` (`R` the real part), `H²|Σb|² ≤ (N + H − 1)Q ≤ 2YQ ≤ 4HY² + 4YR`,
since `Σ|b|² ≤ N ≤ Y + 1 ≤ 2Y`; dividing by `H²Y²` is Lemma 6. 200 000 random cases: largest ratio `0.837`.

Repair: replace the sentence by this two-line derivation (or delete it) and the Check by the
whole-bound comparison at `b = (1, −1)`, `Y = H = 2`: left `0`, main inequality `0.375`, Lemma 6 `1.5`.

## R05 (P3) — the §1.3 corollary assumes `V < W`, which excludes `λ = 1` used by §1.4

Location: `README.md` line 577 ("reals `V < W` with `W > 1`") and line 620 ("`W/m` in place of `W`
and `V = W/(mλ)`"), with `λ ≥ 1` allowed at line 608.

Claim: §1.4's route applies the corollary to `g_m`.

Witness: at `λ = 1` the route takes `V = W/(mλ) = W/m`, equal to the new `W`, outside `V < W`; §1.5
inherits the case through §1.4.

Repair: state the corollary for `0 < V ≤ W`; it is the first bound with `λ = 1/W ≤ Λ = 1/V`, which allows
equality. Tested at `V = W = 3`, `L = 10`: first bound `((L − 1)/3 + 2)(1 + 4√(3/π)) + 1 = 25.54`
against the corollary's `2(10/3 + 2)(2√(3/π) + 1) = 31.51`.

## R06 (P3) — §3.3's harmonic-number bound cites a Mathlib lemma that does not give it

Location: `README.md` line 937 ("`H_n < log n + γ + 1/n`"), *Needs:* line 956 and the Mathlib contract
line 220 (`harmonic_le_one_add_log`).

Claim: `harmonic_le_one_add_log` supplies Lemma 3's harmonic bound.

Witness: at the pin, `Mathlib/NumberTheory/Harmonic/Bounds.lean` line 34 states `harmonic n ≤ 1 + log n`.
For `n ≥ 3` this exceeds `log n + γ + 1/n` (`1 > 0.5772 + 1/3`).

Repair: cite `Real.eulerMascheroniSeq_lt_eulerMascheroniConstant`
(`Mathlib/NumberTheory/Harmonic/EulerMascheroni.lean` line 159; `eulerMascheroniSeq n = harmonic n − log(n + 1)`,
line 50) with `log(1 + 1/n) ≤ 1/n`. At `n = 3`: `H₃ = 1.8333 < log 3 + γ + 1/3 = 2.0091`.

## R07 (P3) — random-sample Checks report large computations, not unit tests

Location: `README.md` lines 541–542, 600–601, 716–717, 824–825, 1428–1429, 1508–1509 and 1555–1556
(for example "Over `20 000` random quadratic `f` … the largest ratio … is `0.99999`: the constant is sharp").

Claim: these bullets are Checks.

Witness: no distribution or instance is given, so a reader cannot recompute them. None discriminates
a plausible wrong statement. A sample maximum does not prove sharpness: the `f(x) = x/2` Check already
attains `cot(π/4)`.

Repair: replace each by one explicit instance with both sides computed, or delete it. For §1.6,
`d = 1`, `H₁ = Y = 2`, `f ≡ 0` (`1 ≤ 3.414`) is already there.

## R08 (P3) — numeric and source-description slips

- Line 1591: "`z = 4.99103…` (where `log z = (7 + √7)/6`)". `exp((7 + √7)/6) = 4.990945`, and at
  `z = 4.99103` the right side is `2.99998 < 3`. Repair: `4.99094…`. The interval `4.9910 < z < 5` stays.
- Line 1339: "a column `p₀ = 10⁷` with values `3.7451, …, 1.5210`". At `tmeemt-art15` lines 241–284 the
  `10⁷` column runs `3.7451 … 1.6260`; `1.5210` is the `r = 10` entry of the `10²⁰` column. Repair:
  "`3.7451, …, 1.6260`".
- Line 1688: "(fan2022 lines 215–222 and 290–292, its direct verifications)". Those lines verify
  `9 ≤ n < 289` and `9 ≤ x < 1024` only; Fan proves the rest of `x < 2·10⁶` analytically. Repair: say
  the proposition extends Fan's verifications to `x < 2·10⁶` and cite the Theorem for its truth there.
- Lines 1496 and 1671: "`buthe2014` lines 602–700" and "lines 650–700". The argument ends at line 655;
  lines 656–705 are §5 and the references. Repair: "602–655" and "650–655".

## Verified sound

**Adversarial table** (values computed; `M_χ` = maximal interval sum).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `intervalExpSum` §0.1 | `f ≡ 0` on `[0,2]`, `[0.2,0.8]`; `x/2` on `[0,3]`, `[0,2]`; `f = x` | `3`, `0`; `0`, `1`; `3` | sound |
| `nearIntegerCount` §0.2 | `‖2.5‖` (Mathlib `round 2.5 = 3`); `R(x/3,0,6,0.1)`; `R(x/3,1,1,1/3)`; `N = 0` | `0.5`; `3`; `0` (strict); `1` and `0` | sound |
| `charIntervalSum`, `M_χ` §0.4 | χ₃; quadratic mod 5; principal mod 3 | `M = 1`; `S(1,2) = −2`, `M = 2`; `M = 2`, `S(0,6) = 4 > M` | sound; `χ ≠ 1` needed |
| §0.5 symmetry, §0.6 reduction | χ₄ (odd); principal mod 6; χ₄ lifted to 12 | `M = 1 < 2·1`; `6−3−2+1 = 2`; `1 + 1 = 2`, without `χ*(d)`: `0` | sound |
| §0.3 vdC | `b=(1,1),H=2`; factor `N`; `b=(1,−1)`; `b=(1),H=3` | `16 ≤ 18`; `12 < 16`; `0 ≤ 6`; `9 ≤ 9` | sound; R04 |
| `kusmin_landau` | `x/2` on `[0,2]`; `x/3` on `[0,1]`; 5000 quadratics | `1 = cot(π/4)`; `1 ≤ √3`; max ratio `0.998` | sound (R01) |
| `second_derivative_test(_sqrt)` | `x²/200` on `[0,10]`; `A`; Patel excess `L=10,V=2,W=3`; 3000 cubics | `50.49`; `2.79369`; `8.454`; max `0.232`, `0.231` | sound (R01) |
| `third_derivative_test` | each term rederived from (26) and lag sum (32); `W=η=λ=1` | `α₃ = 6.702`, `β₃ = 16.036`; exponents `W^{−1/3}, W^{−2/3}` (Hiary line 93) | sound; R05 at `λ = 1` |
| `fourth/fifth_derivative_test` | lag constants; exponents; `W/m ≤ 1` case | `72/91, 72/55, 9/5, 392/435, 392/351, 98/78, 392/275`; `−1/6+1/42 = −1/7`, `−1/14+1/210+1/15 = 0`, `3/14−1/70+1/15 = 4/15`; `α̃₃ ≥ 4.83`, `α̃₄ ≥ 1.738` | sound; `β₄ = 9/5` matches proof (33),(35) |
| `iterated_vanDerCorput` | `(B²−4)(B−4)` at `B=2+2√2`; `H=1,T=6`; `B=4.5`; `d=1,H=Y=2,f≡0`; 1500 random plus `f ≡ 0` grid | `16.000`; `28 ≤ 28.97`; `28 > 27`; `1 ≤ 3.414`; max `0.490` | sound |
| §2.1 Fejér reduction | `(sin(π/4)/(π/4))²`; Jordan's constant | `0.8106 > 0.81`; `4.93N/H > 4N/H` | sound |
| `first_derivative_test_points` | `x/10, N=20, δ=0.05`; product algebra at `δ < 1/4`; 20 000 random | `3 ≤ 10`; `4δ²/λ₁ ≤ 2c₁Nδ`; max `0.529` | sound |
| `second_derivative_test_points` | reduction `x/2, δ=0.1, N=4, A=2`; trivial ranges; 20 000 random | `3 ≤ 6`; RHS `≥ 6N + 6`; max `0.061` | sound |
| §3.1 Gauss expansion | quartic χ mod 5, all `n` incl. `0` | `τ(χ) = −1.17557+1.90211i`, `τ(χ⁻¹) = 1.17557+1.90211i`, product `−5`, ratio `(1+2i)/√5`; identity exact | sound |
| `polya_vinogradov_classical` | `q=3`, `q=5`; all primitive `3 ≤ q ≤ 47` | `4/3 ≤ 1.579`; `2.462`; max ratio `0.7458` | sound |
| `polya_vinogradov_pomerance` | `q=3` odd, `q=5` even; all primitive `q ≤ 47` | `2.087 ≥ 1`; `4.515 ≥ 2`; max `0.478` even, `0.571` odd | sound |
| `polya_vinogradov_lapkova`, §6.1 | all primitive `2 ≤ q ≤ 25`; `L` at `q = 18,19,23,24`; rounded forms; `A(10⁶)` | `123` characters, worst `5 ≤ 7.356` (mod 23); `19>18`, `19≤19`, `24>23`, `24≤24`; `31.3045 ≤ 31.3050`, `5.742 ≤ 5.745`; `3020.2` (with `√q₀`: `2211.2`) | sound |
| `polya_vinogradov_frolenkov_soundararajan` | `q = 1000`; lifts to 2310 and 4620 | `123.5`; `M = 5 ≤ 196.8`, `M = 8 ≤ 288.9` | sound |
| `burgess_moment_bound` | degenerate counts by enumeration; `1.4622^r r!` vs `(2r−1)!!`; all χ, `p ≤ 37`, `r ≤ 5`, `H ≤ p+2`, `B ∈ {H, H+½}` | `d=3,r=3`: `1,22,99,268 = 6H³−8H²+3H`; `d=3,r=4`: `1,86,783`; `r=2,H=2`: `8` (`d=2`), `6` (`d=3,4`); `r=4`: `109.7>105`, `r=5`: `802<945`; max `0.836` | sound; `r ≤ 9B` unused |
| §4.1 `r = 2` refinement | `p = 19`, `(x+1)(x+2)(x+4)(x+9)`; `p = 7`, `h = 2`; all χ, `p ≤ 113`; tail case | `−9`, `|−9| > 2√19 = 8.718`; `W₂ = 34 ≤ 98.3`; max `0.991`; `h³ − 6h + 4 ≥ 0` for `h ≥ 2` | sound |
| §4.2 energy, §4.3 amplification | `{2,3,5}`, `N=100`, `p=1009`; Lemma 1 at `A=28,N=400`; Hölder exponents | `V₂ = 446 ≤ 452.67`; `88 446.6`; `1 − 1/r + 1/(2r) + 1/(2r) = 1` | sound |
| `burgess_mcgown_parametric/table`, §6.6 | `C₀(r)`, `r = 2..15`; (A.1); `d = 4` | all `C₀ < C(r)`, tightest `r=8` margin `7.5·10⁻⁷`; `1093.2 ≥ 1056` … `166 280.6 ≥ 7920`; denominator `0` | sound |
| §4.5, §6.7 Treviño | (46) at `r=2, p=10⁷, k=2/45, c′=2.738`; bracket derivative | `A = 40.27`, `c₁ = 2.738070 ≤ 2.7381`; numerator `−5.03` | sound; R03 |
| `greaves_density_sum` | `κ≡1, z=3, s=2`; `s = 2B`; Rankin chain; 300 random | `0.749 ≤ 2`; `0`; `g/(1+g) = κ/p`; max `0.996` | sound |
| §5.1 diagonal sums | `S(6)`; `S(5.99)`; `S₆(7)`; `H₁(3)`; `S(65)`, `H₁(65)` | `3.25 ≥ 2.862`; `2.75 < 2.860`; `1.4167 ≥ 1.139`; `6`; `5.47144`, `99.3856` | sound |
| `buthe_weighted_*`, `butheRho` | tent; `f ≡ 1` on `[0,10]`, `[1.9,5.1]`; `f = 0`; `y = 0` | `ρ = y/6`; `4 < 8.69`, `3 < 5.502`; `0/0 = 0`; `ρ = 0`, vacuous | sound |
| §6.3, §6.4 Büthe ranges | `Y=100,z=7`; `Y=20,z=2`; grid (step `0.0005` to `101`, `0.25` to `20 000`); `Y=20 000` | `42.857 < 43.429`; `13 < 13.35`; no failure; `z = 65, 40, 100`: `4003.29 < 4038.98`, `4154.91`, `4072.95` | sound |
| `ramare_viswanadham_prime_powers` | `(10,20]`, `d=1`; `d=3,a=1,(30,60]`; `A=1,B=7`; 3000 random; Lemma 15 | `4.25 ≤ 8.69`; `3.5 ≤ 13.03`; `4.833 ≤ 7.19`; max `0.463`; `3.434 ≤ 3.5` | statement sound; R02 |
| `fan_rough_count`, §6.5 | `x=7, z=4.995`; all real `x < 600`; `x ∈ [8,9)` | `Φ = 3 > 2.9992`; max ratios `0.732`, `1.0006` (at `x = 7` only), `0.916`; (5) for `x ≥ 8`: `0.898` | sound with `8 ≤ x` |

**Sources (seeded sample, all 15 targets).** 0.2: Mathlib `UnitAddCircle.norm_eq` (line 223). 0.4: Tau
Ceti `PartialSum.lean` lines 30, 37, 49. 1.1: `ariasdereyna2024` lines 90–104, `patel2022` lines
78–81 and 93–124, `granville-ramare-1996` lines 903–908, `tmeemt-art05` lines 84–89. 1.5: `patel2022` lines 185, 191–196,
197–264, 266–270, 271–308, 241, 263, constants rederived. 2.2: `tmeemt-art11` lines 114–119,
`zhao2024` lines 211–216. 2.3: `zhao2024` lines 284–319, 324–330, 337–371; `tmeemt-art11` lines 130–137. 3.1:
`pomerance2011` lines 229–262. 4.1: `trevino2015` lines 57–63, `booker2006` lines 494–510,
`mcgowntrudgian2020` lines 120–126 and 180. 4.2: `trevino2015` lines 210–219, 419–423, 1088–1093; `mcgown2012` lines
1083–1142. 5.2: `tmeemt-art14` lines 159–170. 5.5: `ramareviswanadham2021` lines 650–679, `tmeemt-art14` lines
97–111. 6.1: `lapkova2018` lines 245–408. 6.3: `buthe2014` lines 633–649. 6.5: `fan2022` lines 157–163,
185–187, 215–222, 290–292 (R08). 6.7: `trevino2015` lines 97–107, 889–941, 996–1024. The
second-hand statements (2.2, 2.3, 3.6, 5.2, 5.5) match their TME-EMT pages and quoting papers
(`hunter2016` lines 651–664 for 3.6).

**Library declarations opened at the pins (47).** Mathlib (35): `Real.fourierChar`/`_apply`
(`Analysis/Complex/Circle.lean` 221, 232); `UnitAddCircle.norm_eq`; `DirichletCharacter.conductor`,
`eq_one_iff_conductor_eq_one`, `IsPrimitive`, `primitiveCharacter`, `changeLevel_primitiveCharacter`,
`primitiveCharacter_isPrimitive`, `IsPrimitive.inv`, `Odd`, `Even`, `even_or_odd`, `Odd.eval_neg`,
`Even.eval_neg` (`DirichletCharacter/Basic.lean` 245–572); `norm_le_one` (`Bounds.lean` 44); `gaussSum`
(72); `gaussSum_mulShift_of_isPrimitive` (59); `ZMod.stdAddChar`, `isPrimitive_stdAddChar` (83, 95);
`BoundingSieve`, `SelbergSieve`, `siftedSum_le_mainSum_errSum_of_upperMoebius`, `upperMoebius_lambdaSquared`
(54, 78, 217, 251); `quadraticChar`, `quadraticChar_ne_one` (120, 207); `log_add_one_le_harmonic`,
`harmonic_le_one_add_log` (25, 34; R06); `Real.cot`, `cot_eq_cos_div_sin` (89, 644); `exists_deriv_eq_slope`
(155); `AbsolutelyContinuousOnInterval` (155), `.integral_deriv_eq_sub` (227); `sum_mul_sq_le_sq_mul_sq`
(171); `inner_le_Lp_mul_Lq_of_nonneg` (954); `ConvexOn.map_integral_le` (196);
`hasSum_taylorSeries_neg_log` (280); `tendsto_tsum_powerSeries_nhdsWithin_stolzSet` (162);
`hasSum_fourier_series_of_summable` (493); `strictConcaveOn_sin_Icc` (164); `Real.sin_le`, `mul_le_sin` (56,
84); `ZMod.unitOfCoprime` (794); `Nat.roughNumbersUpTo` (`SmoothNumbers.lean` 399: non-smooth numbers,
not `Φ(x, z)`, so `roughCount` is no duplicate). Tau Ceti (12): `PartialSum.lean` 30, 37, 49;
`GaussSum.lean` 43, 82; `Conductor.lean` 25; `Even.lean` 77; `HasseBound.lean` 44, 57; `PointCount.lean` 73,
115. Neither pin has Kusmin–Landau, a derivative test, Pólya–Vinogradov, Burgess, Brun–Titchmarsh or a
large sieve (grep of both trees).

**Cross-roadmap citations resolved at their heads (16).** SieveMethodsAndPrimePatterns §§1.1, 1.3,
1.6, 2.9 (forbidden residues), 5.2 (#1495); CharacterSumsOverFiniteFields §4.7 (`weil_mulChar_sum_bound`,
its `Suggested.lean` line 320), §7.1 (#1712); EllipticLegendreCharacterInterfaces §5.1 (#1545);
AnalyticNumberTheoryPartI §§0.5, 0.8, 0.19, 0.20, 0.34, 1.5a (#1126); ExplicitPrimeCounting §0.1
`brun_titchmarsh` (#1945); ProbabilisticAndMetricNumberTheory §§2.5, 2.7 (#1421). Each states what the
contract quotes. Merge order: suppliers at ORDER lines 90, 96, 154, 269, 271; this roadmap 272; consumers
273–275. No `Suggested.lean` declaration reuses another roadmap's qualified name. Ownership was checked
by object against main and the open heads (`roadmaps grep` for each owned object). Apart from R01, the
overlaps are on the later roadmaps' side:
ProbabilisticAndMetricNumberTheory §2.5 (its README line 2757) proves its own finite lag inequality
(settled F03, not re-raised), and ExplicitNumberFields' declared gap (its README lines 509–511) asks for
`A(q₀)` with `0.8204/√q₀`, which §3.5 shows does not follow from Lemma 3A.

**Lean form.** Elaborated with `lake env lean`: 21 warnings, all `declaration uses sorry`, no other
message. The file has no `variable` block, so no binder can drop; the 37 elaborated types were compared
with the README, no change. One-tactic probe on a scratch copy (each `sorry` replaced by
`simp`/`rfl`/`infer_instance`/`positivity`/`norm_num`): all 21 theorems fail it, and every definition is
used by a theorem; no padding. Single `import Mathlib`, no `set_option`, no sorry'd data, `theorem` only.

## Not verifiable

- `greaves2001` Theorem 1 p. 52; `bordelles2012` Theorems 5.6, 5.8, Lemma 5.7; `montgomeryvaughan1973`
  Theorem 2, Lemmas 7, 10; `frolenkovsoundararajan2013` Theorems 1–2, Corollary 1;
  `montgomeryvaughan2007` §9.4; `trevino2015kth` Theorem 1.2; `filaseta1990`. Uncertified (paywalled)
  in the manifest. I checked them only through the cached quoting texts named above.
- `vanlintrichert1965`: waived.
- Whether the published version of `trevino2015` (IJNT) has the arXiv v2 Table 3. The TME-EMT page
  prints different headings and values, and the published text is paywalled.
- Pomerance's display (7) (`pomerance2011` line 236). The extraction may have dropped a conjugation bar
  on `χ`, so the printed form could not be checked; §3.1 here states the correct identity, verified
  numerically.

## Source issues

- **Misprint** in patel2022 at Lemma 3.1, p. 5: the source says `β₄` carries the factor `18/20`; it should be `18/10 = 9/5`, as proof displays (33) and (35) give; affects a stated result.
- **Gap** in patel2022 at the proof of Lemma 2.5, pp. 4–5: the source applies Lemma 2.3 with `V = W₃/(mλ₃)`, which needs `V < W` (`λ₃ > 1`), while `λ₃ = 1` is allowed; it should note Lemma 2.3 holds for `V ≤ W`; affects the proof.
- **Error** in mcgowntrudgian2020 at the proof of Proposition 1, p. 5: the source says for quadratic `χ` the Weil factor `2r − 1` improves to `2(r − 1)`; it should be `2(r − 1)√p + 1` (at `p = 19` a quartic gives `−9`); affects the proof.
- **Error** in booker2006 at displays (28)–(30), p. 7: the source says the inner sum is at most `2(r − 1)√d` when the polynomial is not a square; it should be `2(r − 1)√d + 1`, from the two points at infinity; affects the proof.
- **Error** in fan2022 at the Theorem, inequality (5), p. 4: the source says (5) holds whenever `max(3, √x) ≤ z ≤ x`; it fails at `x = 7`, `4.9910 < z < 5` (`Φ = 3`), so it should require `x ≥ 8`; affects a stated result.
- **Error** in kerrmcgowntrudgian2020 at Lemma 3, p. 3: the source says `A(q₀)` has middle term `0.8204/√q₀`; to follow from Lapkova's Lemma 3A it should be `0.8204/log q₀`; affects a stated result.
- **Error** in hiary2016zeta at Lemma 1.2, p. 2: the source says `β = (64/15)η^{−1/2} + 3W^{−1/3}` with matching `α`, resting on Cheng–Graham's flawed lemma; it should be Patel's `64/(3√π√η) + 4W^{−1/3}`; affects a stated result; corrected in print at patel2022 Lemma 2.5.
- **Misprint** in tmeemt-art05 at the third-derivative-test statement (line 123): the source says `65/15` in `β`; it should be Hiary's `64/15`; affects nothing (superseded by patel2022 Lemma 2.5).
- **Error** in tmeemt-art15 at the Treviño `c₂` table (lines 236–284): the source says the columns are `p₀ = 10⁷, 10¹⁰, 10²⁰` with `3.7451, …`; it should match trevino2015 Table 3 (arXiv v2: `10¹⁰, 10¹⁵, 10²⁰`, `3.6529, …`) or name its version; affects nothing here.
