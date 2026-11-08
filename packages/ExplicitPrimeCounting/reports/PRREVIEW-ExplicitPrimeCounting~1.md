# Review of ExplicitPrimeCounting (pull request #1945 at 98329b3)

**Verdict:** needs changes

Seven findings: one P1, one P2 and five P3. The gate passes, the dependency check reports no problem, `Suggested.lean` elaborates with `sorry` as its only warning, and every elaborated signature matches its README statement. The blocking issues are the proof route of the Brun–Titchmarsh headline (R01) and four end theorems that are declared not statable although they can be stated (R02).

## R01 (P1) — The route of §0.1 cannot reach the constant `2`

**Location.** `TauCetiRoadmap/ExplicitPrimeCounting/README.md` lines 425–434 (also 109, 343–347, 388, 443): "apply the forbidden-residue large sieve of SieveMethodsAndPrimePatterns §2.9 with its sharp constant `H − 1 + Q²` … which is what leaves the constant exactly `2`".

**Claim.** §0.1's only named input is the unweighted sieve `J(Q)|∑aₙ|² ≤ (H − 1 + Q²)∑|aₙ|²`. That input proves at best `(H − 1 + Q²)/J(Q)`, which exceeds `2y/(φ(k) log(y/k))` for every large `y/k`. `brun_titchmarsh` is the Layer 0 headline in `Suggested.lean`, so the theorem as planned is unprovable from its *Needs* line. The prerequisite it actually needs, the weighted large sieve, is cited nowhere in the README.

**Witness.** Take `k = 1` and `J(Q) = ∑_{d≤Q} μ²(d)/φ(d)`, computed exactly. At `y = 10⁶`, `min_Q (y + Q²)/J(Q) = 154 578.5` at `Q = 267`, against `2y/log y = 144 764.8`. The ratio is 1.068 at `y = 10⁸` as well, and that is before the primes below `Q` are added back.

**Repair.** Base the route on Montgomery–Vaughan's weighted large sieve, `∑_{q≤Q} ∑*_a (N + (3/2)qQ)⁻¹ |S(a/q)|² ≤ ∑|aₙ|²`. Its input is the `3π/2` inequality of AnalyticNumberTheoryPartI §1.5a. The weighted sieve is ExplicitZetaBounds target 13, so either declare `gap:weighted-large-sieve` at that target or state the weighted sieve as a target of §0.1 from §1.5a. Then rewrite the *Needs* line, the supplier contract and "How to read the build" to match.

Tested on the same instance: the weighted denominator `L(Q) = ∑_{q≤Q} μ²(q)/(φ(q)(N + 1.5qQ))` gives `min_Q 1/L = 136 199.4` at `Q = 809` (`y = 10⁶`), below 144 764.8. This leaves room for the at most 809 primes up to `Q`.

The plan's gap `explicit-brun-titchmarsh`, with supplier `none`, is closed legitimately only once §0.1 is repaired this way.

## R02 (P2) — Statable end theorems are declared not statable

**Location.** `TauCetiRoadmap/ExplicitPrimeCounting/Suggested.lean` lines 38–49 and 57 name four of the README's end theorems as not statable:

- Dusart's `p_k ≥ k(log k + log log k − 1)` (README lines 46–47, §5.3 line 2562);
- Axler's `π(x)` upper bound (lines 43–44, §3.5 lines 1882–1888);
- Trudgian's prime interval and Axler's prime interval (lines 52–54, §7.4).

**Claim.** The stated reason ("every route … passes through a table proposition") applies equally to `schoenfeld_interval` and `vanlalngaia_sum_inv_prime`. The file states both of those from pointwise inputs, following the README's own convention (lines 225–228). Each of the four end theorems above has a nontrivial transfer from pointwise inputs that are already Prop-statable at the pins.

**Witness.** §5.3 (lines 2563–2575) proves Dusart's bound from four inputs, all statable with `Chebyshev.theta`, `Chebyshev.psi` and `Nat.nth`:

- `|θ − x| < 0.0077629x/log x` for `x > e²²`;
- `|ψ − x| ≤ 0.905·10⁻⁷x` for `x ≥ e⁵⁰`;
- `|θ − x| < 1 717 433 x/log⁴ x`;
- Robin's lower bound for `θ(p_k)`, plus the `p_k ≤ 10¹¹` clause.

**Repair.** State Dusart's `p_k` bound from those inputs, as `schoenfeld_interval` is stated. Do the same for:

- Axler's `π(x)` upper bound, from the `θ`-input `0.024334 x/log³ x` for `x ≥ 1 757 126 630 797`, `RiemannHypothesisUpTo 3000175332800` with `ButheVerified`/`Buthe2016Range`, and an `Axler2024Range` proposition;
- the two interval theorems, from the §7.4 lemma's `θ`-inputs plus a `MaximalPrimeGapTable` definition (a finite list of records) and the finite clauses.

Each one kept out must be named in the docstring with a carrier that is really missing.

## R03 (P3) — Fiori–Kadiri–Swidinsky's Theorem 3 is misstated

**Location.** README lines 1809–1816: "`|π(x) − Li x| ≤ (1 + ν)(1 + μ) A_θ (log x/R)^{B−1} exp(−C √(log x/R)) x` … with the explicit `ν = ν(x₀)`, `μ = μ(x₀, x₁)` of their displays (27) and (9)".

**Claim.** The source states `E_π ≤ (1 + μ)A_θ (log x/R)^B exp(…)` with `E_π = |π − Li|/(x/log x)` (`fiori-kadiri-swidinsky-2023` lines 29–30, 135, 171). This gives a factor `1/R` in the README's form. `ν` of (27) belongs to the `ψ → θ` conversion (Proposition 13), not to Theorem 3.

**Witness.** The README's own instance on line 1816, `9.2211 = (1 + μ)·121.0961/R^{3/2}` with `R = 5.5666305`, needs that `1/R`. The README's display would give the coefficient `121.1/√R ≈ 51.3`.

**Repair.** Write the display as `|π(x) − Li x| ≤ (1 + μ) A_θ (log x/R)^B exp(−C √(log x/R)) x/log x` for `x ≥ x₁`, with `μ` from display (9). Cite Proposition 13, (26)–(27), separately for starting from a `ψ`-bound. Tested: `121.103/5.5666305^{3/2} = 9.2207`.

## R04 (P3) — The §4.2 route fails for very large `x`

**Location.** README lines 2171–2172: "beyond `10¹⁹` for the `1/log x` forms, Theorem 1.1 and Dusart's `0.006409 x/log x` (§3.3), since `1/(2√x) + 1.75·10⁻¹² ≤ 0.000291/log x` there".

**Claim.** The inequality fails once `log x > 0.000291/1.75·10⁻¹² = 1.663·10⁸`. So the first form of Theorem 1.1 does not give `0.0067/log x` (or `0.01/log x`, `1/(4 log x)`) on all of `x > 10¹⁹`.

**Witness.** At `log x = 2·10⁸`, `0.000291/log x = 1.455·10⁻¹²`, which is less than `1.75·10⁻¹²`.

**Repair.** Restrict the first form to `10¹⁹ < x ≤ e^{1.6·10⁸}`. Above that, use the second form of Theorem 1.1, under the region with `R = 5.69693`, valid for `log x ≥ 9270`. Its tail `(1 + 2X)e^{−2X}/(2π)` with `X = √(log x/R)` is about `e^{−10⁴}` there.

## R05 (P3) — A wrong value in the §5.4 Cipolla Check

**Location.** README lines 2634–2635: "at `n = 10` it gives `10(2.3026 + 0.8340 − 1 − 0.5063 − 0.1535) = 14.8`".

**Claim.** The third-order term at `n = 10` is `−((log log n)² − 6 log log n + 11)/(2 log² n) = −6.6914/10.6038 = −0.6310`, not `−0.1535`.

**Witness.** Computed: `10(2.302585 + 0.834032 − 1 − 0.506373 − 0.631040) = 9.99`.

**Repair.** Replace with "`10(2.3026 + 0.8340 − 1 − 0.5064 − 0.6310) = 9.99` against `p_10 = 29`". The conclusion of the Check, that the expansion is not a bound, stands.

## R06 (P3) — The §2.5 chain asserts `0 > 0`

**Location.** README lines 1376–1378: "`θ(x) − θ(x − h) ≥ h − 2 √x log² x/(8π) > 0` for `h = √x log² x/(4π)`".

**Claim.** With that `h`, `h − 2√x log² x/(8π) = 0`.

**Witness.** At `x = 600`: `A = 24.49 · 40.92/25.13 = 39.88` and `h = 79.75 = 2A`, so the last expression is `0`.

**Repair.** Write `θ(x) − θ(x − h) > h − A(x) − A(x − h) ≥ h − 2A(x) = 0`, with `A(y) = √y log² y/(8π)`. The first step is strict by Schoenfeld's strict (6.3) and (6.5); the second holds because `A` increases on `y > 1` and `x − h > 1`.

## R07 (P3) — A threshold slip in the §1.7 Check

**Location.** README lines 1097–1099: "`√q log q ≥ 3.33·10⁴`, that is for `q ≥ 4.6·10⁶`".

**Claim.** At `q = 4.6·10⁶`, `√q log q = 2144.8 · 15.342 = 3.29·10⁴ < 3.33·10⁴`. The crossing is at `q ≈ 4.71·10⁶`.

**Witness.** At `q = 4.71·10⁶`: `2170.3 · 15.365 = 3.335·10⁴`.

**Repair.** Read "that is for `q ≥ 4.71·10⁶`".

## Verified sound

**Gate and build.**
- Gate rerun at this head: every check 0, "OK"; no file changes outside the folder.
- `lake env lean` on `Suggested.lean`: `sorry` is the only warning.
- Dependency check output, quoted: `depcheck: 242 roadmaps, 2452 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. In the merge order the roadmap sits at 271, right after ExplicitZetaBounds (270).

**Signatures.** I elaborated a scratch copy with `#check @name` for all 11 theorems and compared each elaborated type with its README statement:
- Exponents are real (`t ^ ((1:ℝ)/3)`).
- `NeZero q` is explicit in `lamzouri_li_soundararajan`.
- No declaration lost a binder.
- Nothing changed.

**Adversarial table** (values I computed; "sieve" means a pure-Python sieve in my scratch directory).

| Statement | Instances | Values (each side) | Result | Change |
|---|---|---|---|---|
| `brun_titchmarsh` | k=1, x=1.5, y=3; k=3, l=2, x=10, y=30; y=k=1, x=1.5 | 2 ≤ 5.46; 4 ≤ 13.03; count 1 > junk 0 | holds; `y>k` needed | none |
| `brun_titchmarsh` (grid) | k≤24, all coprime l ≤ 2k, x ∈ {0.01,…,997}, y ∈ (k, 50k] | 0 violations | holds | none |
| §0.1 route | k=1, y=10⁶, 10⁸ | min_Q (y+Q²)/J(Q) = 154 578.5 > 144 764.8; 1.068× at 10⁸ | fails | R01 |
| `schoenfeld_of_riemannHypothesis` | x=100, 1426.9, x∈(3/2,2); (6.2)–(6.4) to 1427; (6.18) on (2657, 5·10⁷] | 5.96<8.44, θ: 16.27>8.44 (threshold 599 needed); 74.08<79.3; π=0<li(1.5)=0.124; sieve: 0 failures, worst (6.18) ratio 0.980 | holds | none |
| `leeNosal_of_riemannHypothesis` | x=101, x→101⁻; `LeeNosalRange` at every prime-power endpoint | 2.34≤5.695; 6.955>5.695 (sharp); 0 failures | holds | none |
| `leeNosal_theta_of_riemannHypothesis` | x=2657; [2657, 3382] | 89.86≤94.12; 0 failures | holds | none |
| `buthe_of_riemannHypothesisUpTo` | π* at 96.5, 97; x=60; `Buthe2016Range` on (59,5000) | 1.830>1.786 (source x>59 false); 0.94<1.793; 2.47≤5.17; only failure at 97⁻ | holds from 97 | none |
| `johnston_of_riemannHypothesisUpTo` | criteria cross; x<e | log log x = 9.06/4.92 ⇒ x=547.7; hypothesis true for all T≥0 but every conclusion has x>59 | not vacuous | none |
| `carneiro_milinovich_soundararajan` | x=4; [4,11) step 0.001; gaps to 10⁸ | 5∈[4,6.44]; 0 failures; max (p⁺−p)/log²p = 0.739 at 20 831 323 | holds | none |
| `dusart_of_zeroFreeRegion` | R=5.69693, log x=400; R≤0.7551 | X=8.379, ε=1.060·10⁻³; 8R would need log x ≥ 11 833; first zero inside region | holds; source misprint | none |
| `vanlalngaia_sum_inv_prime` | x=10; sieve [2, 89 967 803]; transfer at 89 967 803 | 0.0807<0.3276; worst ratios 0.922 (c=4, 113), 0.977 (c=2.3, 1327), 0.934 (c=1, 24 421); 1/3+5/(4·18.315)=0.402≤1 | holds | none |
| `lamzouri_li_soundararajan` | q=3; q=4…300 all units; χ₀ mod 2 at 2πi/log 2 | 7>4.83 (q>3 needed); worst ratio 0.650 (q=4, p=5); zero with Re 0 excluded by `0<s.re` | holds | none |
| `schoenfeld_interval` | x=2 010 760, 2 010 750; sieve to 10⁸; x=e³⁰ | 2 010 881<2 010 881.15; next prime 2 010 881>2 010 871.15; 0 failures; 4.35·10⁸>1.96·10⁸ | holds | none |
| `ButheVerified` clauses | θ clause near 1423; ψ, 0.05 clauses to 10⁷ | θ(1423)=1352.8227, fails 1426.4716<x<1427; 0 failures | 1427 start right | none |
| `Schoenfeld1976Range` (5.2*), (5.4*) | sieve to 10⁸ | 0 failures | holds | none |
| §0.4 identity | x=2, x=3 | 1=1; 1.994≈2 | holds | none |
| §0.6 agreement | q=4,a=3,x=3; q=0,a=−5,x=5 | 1=1; 0≠1 (q≥1 needed) | holds | none |
| §1.6 enclosures | γ, B, li 2 | 1.5·10⁻¹¹, 4.8·10⁻¹¹ <10⁻⁹; li 2 = 1.0451638 | holds | none |
| §1.7 gap | q=10¹⁰; Banks vs Thorner–Zaman crossing | 8.68·10⁻³ vs 1.30·10⁻⁴; crossing at 4.71·10⁶ | slip | R07 |
| §2.2 | ratio at x=101 | 3.0858/4.6151=0.669 | holds | none |
| §2.5 chain | x=600 | h=79.75=2A | slip | R06 |
| §3.4 Trudgian | θ at 126.99, 149; region at height 24; crossover | 19.92>19.24, 17.35≤22.43; 2.226>2; 3.0014·10¹⁰<3.061·10¹⁰ | holds | none |
| §3.4 Johnston–Yang 1.4 | x=23; last failures | θ: 3.777>3.399, π: 1.884>1.124; 59⁻, 71⁻ | README thresholds right | none |
| §3.4 FKS conversion | instance 9.2211 | 121.103/R^{3/2}=9.2207; README display gives 51.3 | misstated | R03 |
| §4.1 | x=10 | 1.1762<1.5298; 1.3127<2.3026 | holds | none |
| §4.2 route | log x=2·10⁸ | 1.455·10⁻¹² < 1.75·10⁻¹² | fails | R04 |
| §5.2 thresholds | n=5,6,19,20,2 | 11>10.43, 13<14.25, 67>66.96, 71<71.86, −2.35<3 | sharp | none |
| §5.4 Cipolla | n=10⁶; n=10 | 15 480 980 vs 15 485 863; 9.99 (README 14.8) | slip | R05 |
| §5.3 Robin range | k=7022, 8601, 8602 | 70 919>70 918.61; 88 807>88 805.00; 88 811<88 816.44 | 8602 start right | none |
| §6.2 | k=1, x₀=10⁶ | 1516≤2072 | holds | none |
| §6.4 | q=6, a=1, x=1 | quantity =\|C(6,1)\|=0.978… | holds | none |
| §6.5 | disc ℚ(ζ₁₂); q=2, q=1 | 144; 3/(2 log 2)² = 1.561>1.56; bound 0 at q=1 | holds | none |
| §6.7 | q=10¹⁰, 10¹² | 0.99131<0.99332<0.99550; 7.0·10⁴ | holds | none |
| §7.1 | 2 010 733+148 | = 2 010 881 | holds | none |
| §7.3 | ‖f₁‖₁, ‖f₂‖₁ | 2/3, 8/15 | holds | none |
| §7.4 Trudgian | x=2 898 240 | interval ends 2 898 357.93 < 2 898 359 | 2 898 242 start right | none |

**Sampled locators verified against the text.**
- §0.4: `rosser-schoenfeld-1962` line 460 (4.17); `schoenfeld-1976` lines 101–102; `trudgian-2016` lines 124–125.
- §1.6: `ramare-rumely-1996` line 294; `rosser-schoenfeld-1962` line 81.
- §2.2: `schoenfeld-1976` lines 20–28 (Theorem 10, (6.1)–(6.5)) and 98–100 ((6.18), (6.19)), which match the Lean clauses exactly.
- §3.4:
  - `faber-kadiri-2015` line 43; `faber-kadiri-2018-corrigendum` line 98;
  - `trudgian-2016` lines 49–61, 66–73, 132–140;
  - `platt-trudgian-2021-error` lines 58–69, 76–77, 83, 92;
  - `johnston-yang-2023` lines 57–80, 272–279, 554–555;
  - `fiori-kadiri-swidinsky-2023` lines 151–154, 159–176, 712–725.
- §4.1: `rosser-schoenfeld-1962` lines 256–322.
- §5.2: `rosser-schoenfeld-1962` lines 224–241.
- §6.2: `ramare-rumely-1996` lines 58–92.
- §6.4: `ramare-2002` lines 74–86, 134–187, 980–1004, 1228–1235.
- §6.5: `bach-sorenson-1996` lines 802–811, 921–937.
- §7.1: `schoenfeld-1976` lines 646–669; `oliveira-e-silva-herzog-pardi-2014` lines 1807, 1817–1820.
- §7.3: `kadiri-lumley-2014` lines 28–36, 52, 493–508; `cully-hugill-lee-2022` lines 75–86.
- Headline sources:
  - `dusart-2016` lines 74–80, 471, 531, 576–580: the `8R`/`8/R` misprint is confirmed. The README's `T₀ = 9.6769…` differs from the source's `T₀ = 17.8478` at line 534 but satisfies the same lemma under the `|Im s| ≤ 14` hypothesis.
  - `buthe-2018` lines 73–85; `buthe-2016` lines 688–705, 754–755.
  - `carneiro-milinovich-soundararajan-2019` lines 259–273; `vanlalngaia-2017` lines 26–51.
  - `montgomery-vaughan-1973` Theorem 2, through `tmeemt-art14` lines 82–87.
  - `robin-1983` lines 84, 378.

**Library declarations opened at the pins (47).**
- Mathlib `NumberTheory/Chebyshev.lean`: `psi` 70, `theta` 77, `psi_nonneg` 83, `theta_nonneg` 85, `psi_eq_zero_of_lt_two` 108, `theta_eq_zero_of_lt_two` 134, `psi_eq_psi_coe_floor` 161, `theta_eq_theta_coe_floor` 165, `psi_mono` 170, `theta_mono` 177, `theta_le_log4_mul_x` 191, `psi_eq_theta_add_sum_theta` 429, `theta_le_psi` 433, `abs_psi_sub_theta_le_sqrt_mul_log` 442, `psi_le_const_mul_self` 485, `integrableOn_theta_div_id_mul_log_sq` 658, `primeCounting_eq_theta_div_log_add_integral` 668, `theta_eq_primeCounting_mul_log_sub_integral` 705.
- Mathlib `NumberTheory/PrimeCounting.lean`: `primeCounting'_nth_eq` 80, `add_two_le_nth_prime` 84, `prime_nth_prime` 106, `primesLE` 133, `mem_primesLE` 163.
- Mathlib `Data/Nat/Prime/Nth.lean` 23 and 26; `Bertrand.lean` 225.
- Mathlib `LSeries/Nonvanishing.lean`: 404 (`LFunction_ne_zero_of_one_le_re`), 412 (`LFunction_apply_one_ne_zero`), 417 (`riemannZeta_ne_zero_of_one_le_re`).
- Mathlib `RiemannZeta.lean` 185: `RiemannHypothesis` excludes `−2(n+1)` and `1`.
- Mathlib `EulerMascheroni.lean` 170, 174; `Pi/Bounds.lean` 178, 184; `ExponentialBounds.lean` 38, 41, 86, 89; `AbelSummation.lean` 128; `DirichletCharacter/Orthogonality.lean` 82; `Analytic/Order.lean` 63.
- Tau Ceti `Analysis/SpecialFunctions/LogIntegral.lean` 92, 141 (`logIntegral x = ∫ t in 2..x, (log t)⁻¹`, defined for `x < 2` as well), 147, 151, 156, 180, 277, 331.
- Tau Ceti `LFunctions/Mertens.lean` 545 (`mertensConstant` = `limUnder` of `∑ 1/N𝔭 − log log x`), 552, 564.
- Tau Ceti `ArithmeticDirichletSeries/Counting.lean` 625, 630; `Transfer.lean` 76; `PrimeIdealTheorem.lean` 46; `Chebotarev/PrimeCounting/PrimesCongruent.lean` 50; `NumberTheory/PrimeCounting.lean` 70, 90.

**Cross-roadmap citations resolved (36).**
- ZerosOfLFunctions on main: §§4.1, 4.5, 5.6, 6.2–6.4, 7.4, 8.3–8.9, Layers 0 and 9, with `zeroCount`, `chebyshevPsi_explicitFormula`, `riemannZeta_weilExplicitFormula`, `primeIdealCount_effective`, `primeCounting_progression_effective`, `rayClassPsi`, `AllOnCriticalLine`, `zetaEntireCompletion` and *IsExceptionalZero*. All the same sections are also present at the heads of its two open revisions.
- LFunctions Layer 4 `dirichletData`.
- ClassicalArithmeticCompletion §6.34 `dyadicPrimeCount`.
- AnalyticNumberTheoryPartI:
  - §§0.2 (`psiAP`, `primeCountAP`, `theta_ap.level_one`, `theta_ap.sum_classes`), 0.3, 0.5, 0.8, 0.16, 0.19, 0.20, 0.25 and their inputs, with ranges matching the README;
  - §§0.30, 0.32, 0.34, 1.5a;
  - §1.6: the body of `DirichletGRH` equals `hGRH` verbatim;
  - §1.9 names.
- SieveMethodsAndPrimePatterns §2.9 (forbidden-residue sieve, `H − 1 + Q²`) and §3.1: `SieveDistribution.primeCountAP (x : ℝ) (q a : ℕ)` at its `Suggested.lean` line 314, whose argument order matches §0.6.
- ComputationalNumberTheory §§4.17a, 4.22, 4.24.
- EffectiveClassNumbers §4.4.
- SpecialFunctionsEiLiErfIncompleteGamma §§8.2–8.4: `TauCeti.Real.principalLogIntegral`, `logIntegral_eq_principalLogIntegral_sub`, series 6.6.2, expansion 6.12.2.
- ExplicitZetaBounds targets 8, 9, 10, 13, 16, 17, 18, 19, 20 in its target text.
- ProbabilisticAndMetricNumberTheory Layer 5.

The three "found nowhere" leads of the citation tool are these supplier names, so none of them is missing.

**Gaps.**
- The 11 gaps on ExplicitZetaBounds carry the same slugs in the plan and under the README's "Exact supplier contracts".
- Each names one target with explicit hypotheses and constants.
- None asks for something the pins provide: the pins have no explicit zero-free constant, zero count or bounded-height Riemann hypothesis.
- `explicit-brun-titchmarsh` (supplier `none`) is owned by §0.1; see R01.
- ExplicitMultiplicativeFunctions declares five gaps on this roadmap (`psi-initial-range`, `mertens-reciprocal-axler`, `psi-relative-bklnw`, `psi-tilde-difference`, `psi-log-power`). They are that roadmap's contracts and not findings here.

**Ownership and duplication.**
- Brun–Titchmarsh with constant `2`: SieveMethodsAndPrimePatterns has only `prime_interval_upper` (with a secondary term) and `progression_upper` (existential constant), so this roadmap is the owner.
- No open roadmap's Lean declares `RiemannHypothesisUpTo`, `ClassicalZeroFreeRegion`, `ButheVerified`, `riemannPrimeCount`, `primeReciprocalSum`, `liTwo` or `PrimeGapLogSquareVerified`.
- Main has only `dyadicPrimeCount`, which is deferred.
- ExplicitMultiplicativeFunctions and ExplicitNumberFields consume this roadmap by section; neither restates a theorem owned here.

**Headlines and padding.**
- 11 theorems and 14 definitions; every definition is used by a theorem.
- Each theorem's conclusion covers ranges beyond all of its hypotheses: those are bounded by `10⁸`, `10¹⁹` or `q ≤ 20 000`, or they are pointwise inputs on other quantities. So none closes with one tactic from its hypotheses or the library (decided by reading).
- None restates a definition or a Check. No padding.
- The headlines not statable at the pins are named in the docstring, apart from those of R02.

## Not verifiable

Uncertified or waived in the manifest, so cited by locator only and not read:
- `lee-nosal-2026` (Theorems 1.1, 1.2 (2)–(3), display (10), §§3.2–3.3: the Lean headlines' source);
- `johnston-2022` (Theorem 3.2, Corollary 3.3, Table 2);
- `lamzouri-li-soundararajan-2015` (Corollary 1.2, §4.3);
- `fiori-kadiri-swidinsky-2023-psi` (Corollary 1.4, `9.22022` versus `9.22106`);
- `cully-hugill-lee-2024` (the corrected row `log x₀ = 600`);
- `lu-zaman-zhao-2026`, `banks-2026`, `thorner-zaman-2024`, `openai-2026-siegel` (§1.7);
- `rosser-1938`, `rosser-1941` (§5.2); `cipolla-1902` (waived, §5.4);
- `dusart-2018`, `axler-2018`, `axler-2024`, `chirre-helfgott-2025`, `brent-platt-trudgian-2021`, `platt-2016`.

`montgomery-vaughan-1973` Theorem 2 was read only through the quotation at `tmeemt-art14` lines 82–87. The README's remark that `dusart-1999-mc` lines 131–132 should read `e⁵⁰⁰` was not checked; it is outside the sample.

## Source issues

- **Misprint** in dusart-2016 at Theorem 1.1, p. 876: the source says the bound holds for `X ≥ max(8.36, 8R)`; it should be `X ≥ max(8.36, 8/R)`, the condition its proof uses at lines 471 and 531; affects a stated result.
- **Error** in buthe-2018 at Theorem 2, (1.6), p. 2 of the text: the source says `x − θ(x) ≤ 1.95√x` from `1423`; it should start at `1427`, since the bound fails for `1426.4716 < x < 1427`; affects a stated result.
- **Error** in buthe-2016 at Theorem 2, (7.1), p. 13 of the text: the source says `|π*(x) − li x| ≤ √x log x/(8π)` for `x > 59`; it should start at `97`, since the bound fails for `96.29 < x < 97`; affects a stated result.
- **Error** in johnston-yang-2023 at Theorem 1.4, (1.8)–(1.9), p. 2: the source says both hold for `x ≥ 23`; at `x = 23` they fail (`3.777 > 3.399`, `1.884 > 1.124`), so they should start at `59` and `71`; affects a stated result.
- **Misprint** in johnston-yang-2023 at Theorem 1.4, (1.9), p. 2: the source writes `π(x) − x` on the left; it should be `π(x) − li(x)`; affects a stated result.
- **Error** in bach-sorenson-1996 at Theorem 5.3, p. 1731: the source states it for every `q` coprime to `m`; it should assume `q ≥ 2`, since at `q = 1` the bound `2(q log q)²` is `0`; affects a stated result.
- **Error** in bach-sorenson-1996 at the proof of Theorem 5.3, p. 1732: the source says least primes satisfy `p ≤ 1.56(q log q)²` for `q ≤ 1000`; it should read `1.57`, since `q = 2` gives `3/(2 log 2)² = 1.561`; affects nothing.
- **Error** in robin-1983 at Théorème 8, (23), p. 7 of the scan: the source says `p_k ≤ k(log k + log log k − 0.9385)` for `k ≥ 7022`; it should start at `k = 8602`, since `p₇₀₂₂ = 70 919 > 70 918.61`; affects a stated result.
- **Error** in trudgian-2016 at Corollary 2, p. 7 of the text: the source says the interval holds for `x ≥ 2 898 239`; it should start at `2 898 242`, since at `x = 2 898 240` it ends at `2 898 357.93`, before `2 898 359`; affects a stated result.
