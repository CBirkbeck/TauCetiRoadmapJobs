# Review of ExplicitPrimeCounting (pull request #1945 at 9c3144e)

**Verdict:** needs changes

One finding, P2: §6.6 states Kadiri's quantitative intervals from the row `q₀ = 5·10⁴` on, and states her existence theorem through her bound from `q ≥ 5·10⁴`. Both routes use *LiuWangFourZeros* at `x = q`, but that statement requires `x ≥ 8·10⁹`.

The mechanical checks pass. The gate gives every check `0` ("OK"), the dependency check reports 0 problems, `Suggested.lean` elaborates with exactly 15 `sorry` warnings, and no theorem closes in one tactic. All five findings of review 12 are repaired.

## Status of review 12's findings

- **R01 (*RecordGapBound* `(1.1817, 3, 58 837)` false): repaired.**
  - Line 1482 now gives the instance as "`(1.1817, 3, 58 890)`". Lines 1484–1487 add the negative control at the prime `58 831`.
  - Lines 4297–4302 give the route: "for `58 837 ≤ x < 58 889` the prime `58 889` lies in the interval … equals `58 889.49` at `x = 58 837`".
  - Checked:
    - `58 831` and `58 889` are consecutive primes, with gap `58 > 52.483`.
    - `58 837 (1 + 1.1817/log³ 58 837) = 58 889.487`.
    - With `P = 58 890`, no consecutive pair up to `2·10⁶` violates the instance.
- **R02 (Cully-Hugill–Johnston's `140`-th powers omitted): repaired.**
  - Line 241 now reads "with `k` below the `140` of §7.5".
  - The item is at lines 4408–4429, and its Checks are at lines 4495–4509.
  - The Needs line (4453), Examples (4516) and `Suggested.lean` lines 83–85 name it.
  - The threshold `4242` stands:
    - (6.2) is "`1 − F(x) − MG(x,h)/(x^µ h) + E(x)/h > 0`" (`cully-hugill-johnston-2021` line 916).
    - At `log x = 4242` the `M`-term is `2·0.6651·4242·e^{−4242(0.0080155 − 1/140)}/140 = 0.99474`. So the left side is about `0.0048`.
    - Replacing `E(x)/h ≤ 0` by `−2√(x+h) log(x+h)/h = e^{−2086.6}` lowers it by less than that.
  - Coverage: `140 log(140(Δ − 1))` is `3139.2` at `Δ = 3.90970·10⁷` and `4367.2` at `Δ = 2.51949·10¹¹`.
- **R03 (`c_{9.7} = 33.217`): repaired.**
  - Line 4362 now reads "`c_{9.7} = log(8.0127·10¹⁴/3) = 33.2186… < 33.219`". Line 4369 has `exp(exp(33.219))` and line 4485 has `3 e^{33.219}`.
  - `log(2.67090·10¹⁴) = 0.98242 + 32.23619 = 33.2186`.
- **R04 (Schoenfeld's Corollary 2* unstated): repaired.**
  - §3.2, lines 2411–2416, states (9.8) at the six pairs.
  - §1.3, lines 1374–1380, adds *SchoenfeldTheorem7Range*.
  - §4.5, lines 3362–3370, cites both and handles the endpoint `x = a` by right-continuity.
  - The source agrees: "For d < x … x − x/(c log x) < θ(x)", with the pairs `(41, 758 231)` … `(29, 315 437)` (`schoenfeld-1976` lines 1229–1233).
- **R05 (two ExplicitZetaBounds predicates restated without citation): repaired.**
  - Lines 174–180 and 516–525 cite §§5.2a and 7.3a, and line 2319 now reads "Write *ZeroCountBound* … for ExplicitZetaBounds §5.2a's *ZetaZeroCountBound* `(7/8) …`".
  - `Suggested.lean` lines 17–20 and 163–166 name the copy.
  - At ExplicitZetaBounds `11dd87b` (still its head), §5.2a (README line 1991; `Suggested.lean` line 503) and §7.3a (README line 2614) define exactly these bodies.

## R01 (P2) — §6.6: the row `q₀ = 5·10⁴` and the existence route use Liu–Wang at `x = q < 8·10⁹`

**Location.** `TauCetiRoadmap/ExplicitPrimeCounting/README.md`:

- Lines 3987–3991: "*LiuWangFourZeros* as: for every real `x ≥ 8·10⁹` and every integer `1 ≤ q ≤ x` … applied there at `x = q` and `x = qH`".
- Lines 4017–4021: "for every entry `(q₀, ε)` … every `q ≥ q₀` … (`x = q` and `x = qH` in its statement)".
- Lines 3998–4005: "for `q ≥ 5·10⁴`, Kadiri's smoothed lower bound … the four-zero region … For the finitely many moduli `3 ≤ q < 5·10⁴`".
- Lines 4024–4025 extend the instances "for every `q` with `q₀ ≤ q ≤ 10¹⁰`".

**Claim.**

- The four zeros near `σ = 1` with `|γ| ≤ 1` are controlled by the four-zero bound at `x = q`.
- *LiuWangFourZeros* asserts that bound only for `x ≥ 8·10⁹`.
- Table 1's first row is `q₀ = 5·10⁴`. So for every `5·10⁴ ≤ q < 8·10⁹`, the stated instances (all six `ε`) and the existence route rest on an input that the stated hypothesis does not give.
- The `qH` application often fails as well: `qH < 8·10⁹` there whenever `H < 1.6·10⁵`.
- The rows `q₀ ≥ 10¹⁰` are unaffected.

**Witness.**

- `kadiri-2008` lines 337–342 state Theorem 2.2 for "`1 ≤ q ≤ x`, … `x ≥ 8·10⁹`", applied "for the case `x = q` and `x = qH`".
- Lines 633–639 use the zeros `|γ_k| ≤ 1` with `β_k ≥ 1 − 1/(R₁ log q)`.
- Table 1 (lines 140–148) starts at `q₀ = 5·10⁴`.

**Repair.**

1. In the quantitative instances (line 4017) and in *Kadiri2008Table* (line 4030), replace "every `q ≥ q₀`" by "every `q ≥ max(q₀, 8·10⁹)`". Add: "the row `q₀ = 5·10⁴` is asserted only from `8·10⁹`, where *LiuWangFourZeros* applies at `x = q`".
2. In the existence route (lines 3998–4009), use Kadiri's bound for `q ≥ 8·10⁹` and the modulus-by-modulus prime number theorem in progressions for the finitely many `3 ≤ q < 8·10⁹`.
3. At line 4025, write "`max(q₀, 8·10⁹) ≤ q ≤ 10¹⁰`".
4. At line 3991, add "which its hypothesis allows only for `q ≥ 8·10⁹`".
5. Add the negative-control Check: at `q = 5·10⁴`, `x = q < 8·10⁹`, so *LiuWangFourZeros* says nothing about the zeros with `|γ| ≤ 1`.

**Tested.**

- At `q = 8·10⁹`: `x = q` satisfies `1 ≤ q ≤ x` and `x ≥ 8·10⁹`, and `x = qH ≥ q` does too.
- At `q = 5·10⁴`: both fail for every `H < 1.6·10⁵`.
- No consumer cites §6.6, so the change breaks no citation (`roadmaps grep`).

## Verified sound

### Gate, dependency check, build, signatures and probe

- **Gate**, rerun at `9c3144e`: every check `0`, "OK", exit 0. The diff outside the folder is empty.
- **Dependency check:** `depcheck: 238 roadmaps, 2347 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- **Merge order:**
  - Positions: LFunctions 27, ZerosOfLFunctions 48, AnalyticNumberTheoryPartI 49, SieveMethodsAndPrimePatterns 56, ExplicitZetaBounds 267, EffectiveClassNumbers 268, **ExplicitPrimeCounting 269**.
  - EffectiveClassNumbers cites §0.3b of this roadmap. Its own dependency check prints `moved: … from #268 to #269, right after its last supplier ExplicitPrimeCounting`. So the line "EffectiveClassNumbers, later in the order of supply" (line 4531) holds after that move.
- **Elaboration:** `lake env lean` gives exactly 15 "declaration uses `sorry`" warnings, exit 0.
- **Signatures:**
  - A scratch copy with `#check @name` for all 41 declarations (26 definitions, 15 theorems) elaborates without error.
  - There is no `variable`, `include`, `lemma`, `set_option` or `#eval`.
  - I compared each elaborated type with its README statement and changed nothing.
- **One-tactic probe:** `first | rfl | simp | norm_num | positivity | infer_instance | (intros; linarith)` fails on all 15 theorems. Every definition occurs in a theorem statement.
- **Headlines:**
  - Every end theorem of README lines 32–60 is either stated (15 theorems) or named in the docstring with what it lacks. The table-proposition routes are listed at `Suggested.lean` lines 54–88, now including Cully-Hugill–Johnston.
  - No stated headline is forced through a stand-in.

### Adversarial table

The computed values come from:

- double precision;
- a sieve to `2·10⁶`, testing step functions at both one-sided limits;
- the series of `li`;
- the prime windows of every class modulo `k ≤ 40` below `6000`.

| Statement | Instance | Values (each side) | Result | Change |
|---|---|---|---|---|
| `brun_titchmarsh` | every window, `k ≤ 40`, primes `< 6000` | least margin `2.213`: count `4` (`2, 3, 5, 7`) vs `2·5/log 5 = 6.213` | holds | none |
| `brun_titchmarsh`, `y = k` | `k = 1`, `(1.5, 2.5]` | Lean right side `2/(1·0) = 0` vs count `1` | `y > k` needed | none |
| §0.2 `C(q, a)` | `ramare-2002` line 81 | `C(1,0) = −γ`; `C(2,1) = −γ − log 2`; `C(4,3) − C(4,1) = −½(−1 − 1) L′/L = L′/L(1, χ₄)` | as stated | none |
| §0.3b adapter | `x = 2` | `primeCount ℚ univ 2 = 1 = π(2)`; strict cutoff `0` | holds | none |
| §0.3a `li` | `li 2`, `li 1.5`, zero of `Li − x/log x` | `1.045164 ∈ [1.0451, 1.0452]`; `0.12506 > 0.04`; `−7.97·10⁻⁶` at `6.5797`, `+2.02·10⁻⁵` at `6.5798` | holds | none |
| §0.3 prime powers | `max L² e^{−L/2}` | `16/e² = 2.165`, `/log 2 = 3.124 < 3.13` | holds | none |
| §0.3 BKLNW `f` | `n = 8, 9` | `f(2⁸) = 3.167 < f(2⁹) = 3.212` | holds | none |
| §0.8 | `x = 11 723` | `5 log x − 5 = 41.85 ≤ 0.0037 x = 43.37`; `1 − log 900 = −5.80` | holds | none |
| §1.2 heights | `q ≤ 13`, `q ≤ 40 000` | `10⁸/13 = 7.7·10⁶ ≥ 10⁴`; `10⁸/40 000 = 2500`; Rumely's moduli `≤ 486` | holds | none |
| `ButheVerified` | `buthe-2018` lines 74–85 | six clauses identical; (1.6) printed from `1423`, stated from `1427` | holds | none |
| `Buthe2016Range`, `π*` | `x → 97⁻`; `x = 97` | `|π* − li| = 1.939 > 1.793`; `0.939 ≤ 1.793` | source's `59` fails, `97` right | none |
| *SchoenfeldTheorem7Range* | sieve to `2·10⁶` | least margins `133.6` (5.5a upper), `59.6` (5.5a lower), `49.3` (5.5b), `4.02` ((5.6*) lower) | holds | none |
| Corollary 2* `(c, d)` | six pairs, to `2·10⁶` | least margins `4.41`, `3.43`, `0.773`, `8.62`, `1.50`, `0.0523` (`c = 29`, `x → 315 449⁻`) | holds | none |
| §3.2 switch to Büthe | `x = 2·10⁶` | `√x/log x = 97.47` vs `0.94/0.0220646 = 42.6`, `1.95/0.0239922 = 81.3`; `1/41 = 0.024390 > 0.0239922` | holds | none |
| §3.2 `ψ − θ` | `x = 10⁸`; `1 155 901²` | `∑ x^{1/k}/x^{1/3} = 1.5338`; `1.534 · 1.001093 = 1.53568 ≤ 1.536`; lower ratio `1.00886` | holds | none |
| `schoenfeld_of_riemannHypothesis` | `3/2 < x < 2`; `x = 3834` | `π = 0 < li 1.5 = 0.125`; `2.7090 < 2.7093` | holds | none |
| `leeNosal_of_riemannHypothesis` | switch `337.09` | `L(L − log L)/(8π) = 23.624/25.133 = 0.940` | holds | none |
| `johnston_of_riemannHypothesisUpTo` | crossover | `exp(exp(9.06/4.92)) = 547.7` | as stated | none |
| `carneiro_milinovich_soundararajan` | `x = 4`; Lemma 9 from Rosser | `[4, 6.44] ∋ 5`; `max(0.443 log L − 0.013 L) = 1.120 ≤ 1.412` | holds | none |
| `dusart_of_zeroFreeRegion` | `R = 5.69693`; `T₀` | `X ≥ 8.36 ⇔ log x ≥ 398.16`; `8R` gives `11 833`; `M(9.6769) = −2·10⁻⁵`, `N = 0` | holds | none |
| §3.3 `ψ − θ` | `x = 10²⁴`; `x = 10¹⁶` | `76·10⁶ = 0.76 x^{1/3}`; `10⁻⁴√x + x^{1/3} = 225 443 > 20 405` | holds | none |
| §3.4 Trudgian's region | crossings | `17 e^{2/6.455} = 23.17`; `exp(18.288/0.75807) = 3.0014·10¹⁰ < 3.061·10¹⁰` | holds | none |
| §3.5 Panaitopol | recurrence | `k = 1, 3, 13, 71, 461, 3447` | holds | none |
| §3.5 Dusart 1.10 | `x = 10⁸` | `π = 5 761 455 > 5 752 190`; `li − 1204.7 = 5 761 005` | holds | none |
| `axler_primeCounting_upper` | perturbed `k_m` | `3 + η`, `13 − η`, `71 + 2η` at `η = 0.024334` | as stated | none |
| `vanlalngaia_sum_inv_prime` | `x = 89 967 803` | `1/3 + 5/(4·18.315) = 0.4016 ≤ 0.41` | holds | none |
| Vanlalngaia Cor. 2 | `R = 5.5666305` | `814R = 4531.24 ≤ 4635`; `1.6R^{−1/4} = 1.0416`; `1/R = 0.17964 ≥ 0.175` | holds | none |
| `RobinNthPrimeRange`, `dusart_nth_prime_lower` | `2 ≤ k ≤ 39 017` | no `p_k ≤ k(log k + log log k − 1)`; middle-range ratio `1.66·10⁻⁶ ≥ 9.05·10⁻⁸` at `e¹⁸⁰⁰` | holds | none |
| *Robin1983Range* | `7022 ≤ k < 39 017` | `−0.9385` fails at `7022` and `8581–8601` (18 values), none from `8602` | `8602` right | none |
| §6.1 Checks | `q = 6`, `|γ| = 10⁴` | `0.014264`, `0.013022`, `0.010829` | holds | none |
| §6.3 | `q = 10⁵ + 1`; `q = 939 839` | `exp(14 477)`; both `2.1813·10⁻⁴` | holds | none |
| §6.5 Bach–Sorenson | `q = 2, 3` | `3 < 2(2 log 2)² = 3.84`; `7 < 21.73` | holds | none |
| §6.6 nesting | `q = 10⁵` | `0.013363` vs `0.013497` | holds | none |
| §6.6 row `q₀ = 5·10⁴` | `q = 5·10⁴` | Liu–Wang needs `x ≥ 8·10⁹`, applied at `x = q = 5·10⁴` | unsupported | R01 |
| `schoenfeld_interval` | `x = e³⁰`; gap range | `4.348·10⁸ > 1.961·10⁸`; `10⁸/16597 = 6025 > 1834.6` | holds | none |
| `trudgian_interval`, `TrudgianGapBound` | `p = 4 652 353` (prime) | next prime `4 652 507`, gap `154 ≤ 177.82`; `x = 2 898 242 → 2 898 359.93 ≥ 2 898 359` | holds | none |
| `axler_interval` | row reach; switch | `log x ≤ 104.2`, `≤ 277.9`; margin `6.4·10⁻¹²` at `e²⁵⁰` | holds | none |
| Axler 2016 (R01 of review 12) | `58 831` | see above | repaired | none |
| CHJ `140` (R02 of review 12) | `log x = 4242` | `0.99474`; `e^{−2086.6}`; `x^{−ν} = e^{−22.41} = 1.85·10⁻¹⁰` | holds | none |
| `ZetaZeroCubeSum` | first ten zeros + tail | `6.52·10⁻⁴ + 8.2·10⁻⁵ ≈ 7.3·10⁻⁴ ≤ 8.35·10⁻⁴` | consistent | none |
| `ZetaZeroCountLowRange` | `T = 2π`; `T → 14.13⁺` | `0.125 ≤ 0.515`; `0.551 ≤ 0.742` | consistent | none |

### Library declarations at the pins

Opened at the pins (Mathlib file and line):

- `Mathlib/NumberTheory/Chebyshev.lean`:
  - `theta_le_log4_mul_x` (:191), `psi_eq_theta_add_sum_theta` (:429), `abs_psi_sub_theta_le_sqrt_mul_log` (:442, `2 √x log x`);
  - `psi_le_const_mul_self` (:485, `log 4 + 4`);
  - `psi_sub_theta_le_psi_add_psi_add_psi` (:617, exponents `2, 3, 5`) and `psi_sub_theta_ge_psi_add_psi_add_psi` (:623, `2, 3, 7`, `0 ≤ x`);
  - `primeCounting_eq_theta_div_log_add_integral` (:668), `theta_eq_primeCounting_mul_log_sub_integral` (:705), `pi_le_log4_mul_div` (:891).
- `Nat.primesLE` (`PrimeCounting.lean:133`), `Rat.HeightOneSpectrum.primesEquiv` (`Padics/HeightOneSpectrum.lean:109`), `IsCyclotomicExtension.Rat.natAbs_discr` (`Cyclotomic/Basic.lean:728`).

Opened at the pins (Tau Ceti):

- `TauCeti.primeCount` (`Counting.lean:630`, `K` explicit), `primeCount_eq_card` (:648), `primeCount_univ_isEquivalent_div_log` (`PrimeIdealTheorem.lean:46`), `primeCount_sub_mul_logIntegral_eq` (`Transfer.lean:76`);
- `Nat.primeCounting_nth_prime` (`PrimeCounting.lean:90`), `Nat.primesLE_eq_image_nth` (:70);
- `Real.logIntegral` (`LogIntegral.lean:141`), `logIntegral_eq_div_log_sub_add` (:180), `mertensConstant` (`Mertens.lean:545`), `primeCount_primesCongruent_isEquivalent_logIntegral` (`PrimesCongruent.lean:50`).

### Cross-roadmap citations resolved

- **Heads:** ExplicitZetaBounds `11dd87b`, AnalyticNumberTheoryPartI `979e68c` and SieveMethodsAndPrimePatterns `06aae1f` are the heads review 12 resolved, and they are unchanged.
- **New this round:** ExplicitZetaBounds §5.2a (line 1991, the shift and Rosser's instance `(7/8) 0.137 0.443 1.588 0 2`) and §7.3a (line 2614, the monotonicity for `0 < R ≤ R′`, `1 < t₀ ≤ t₀′`). They match contract lines 516–525.
- **ExplicitZetaBounds §7.2:** the `log 0.618` form holds given `RH(545 439 823)` alone from `5.45·10⁸` (lines 2470–2484).
- **ExplicitZetaBounds §6.5:** `c = 3/2` (line 2347).
- **Consumers:** ExplicitNumberFields (lines 371–385) and ExplicitCharacterSumsAndSieves (lines 84–93, 336–348) import §§0.1, 1.1, 1.3 by name and restate nothing. No consumer cites §6.6.

### Ownership and gaps

- **Ownership:** `roadmaps grep` for `def li`, `ButheVerified`, `brun_titchmarsh`, `MVDiagonal`, `RecordGapBound`, the zero-sum propositions and `lamzouri_li_soundararajan` finds only citations of this roadmap. There is no second owner, and no fully qualified name repeats another roadmap's (the copies live in `TauCetiRoadmap.ExplicitPrimeCounting`).
- **Gaps:**
  - The nine slugs the README uses match `plan.json`.
  - `explicit-brun-titchmarsh` (supplier `none`), `lehman-weighted-zero-sum` and `dirichlet-four-zero-region` remain unused in the plan, as review 12 recorded. No statement depends on them.

### Sampled locators read against the text

- **§0.2:** `ramare-2002` lines 74–86, 152–187.
- **§0.3b:** the Tau Ceti and Mathlib declarations above.
- **§1.2:** `rumely-1993` lines 29–36; `ramare-2002` lines 152–159.
- **§1.3:**
  - `buthe-2018` lines 73–85; `buthe-2016` lines 688–705, 754–755;
  - `schoenfeld-1976` lines 20–28, 79–123, 729–733, 767–796, 1212–1233;
  - `dusart-1998-thesis` lines 863–864, 924–925, 1279;
  - `robin-1983` lines 81–84, 378.
- **§3.1:** `dusart-2016` lines 74–90, 186–194, 451–472, 528–534, 576–580.
- **§3.2:** `rosser-schoenfeld-1962` lines 195–212, 244–255, 306–308, 328–359; `schoenfeld-1976` lines 201–206, 729–733, 767–772, 1229–1233, 1280–1294.
- **§3.5:** `rosser-schoenfeld-1962` lines 195–212; `dusart-1998-thesis` lines 845–874, 1418–1445.
- **§4.1:** `rosser-schoenfeld-1962` lines 256–293. The extraction is garbled. The squares in (3.17) at line 257 support the README's reading of (3.20).
- **§5.2:** `rosser-schoenfeld-1962` lines 224–241.
- **§5.5:** `axler-2019` lines 46–53, 145–166, 337; `de-koninck-letendre-2020` lines 489–499.
- **§6.1:** `ramare-rumely-1996` lines 58–92, 822–848; `dusart-2002` lines 100–112, 698–707, 989–1022.
- **§6.3:** `bennett-martin-obryant-rechnitzer-2018` lines 165–195, 377–379, 1163–1169.
- **§6.6:** `kadiri-2008` lines 98–200, 327–345, 610–639 (R01).
- **§7.1:** `schoenfeld-1976` lines 646–716.
- **§7.5:** `cully-hugill-johnston-2021` lines 884–926.
- **Flags:** the README flags no locator as unverified.

## Not verifiable

These are recorded as uncertified or waived, and are cited by locator only:

- **§5.6:** `axler-2019-nth-prime` (uncertified). I checked only the bracketing `10.667 < 11 < 11.508`.
- **§5.2:** `rosser-1938`, `rosser-1941` (uncertified). Their implications from Rosser–Schoenfeld were checked.
- **§§1.2, 5.5:** `platt-2016`, `zhang-xiong-2025`.
- **Elsewhere:** `lee-nosal-2026`, `johnston-2022`, `axler-2018`, `axler-2024`, `dusart-2018`, `chirre-helfgott-2025`, `lamzouri-li-soundararajan-2015`, `montgomery-vaughan-1973`, `cipolla-1902` (waived).
- **§4.1:** `mertens-1874` is image-only and already in the worker's needs file. §4.1 rests on AnalyticNumberTheoryPartI §0.11d, not on it.
- **Liu–Wang:** the paper itself is not in the manifest, so it was read through `kadiri-2008` lines 337–341 only.

## Source issues

- **Gap** in kadiri-2008 at §2, Theorem 2.2, and its use for Table 1, pp. 1735–1740 (lines 140–148, 337–342, 633–639): the source says it applies Liu–Wang's four-zero theorem at `x = q` for every `q ≥ 5·10⁴`; it should restrict to `q ≥ 8·10⁹`, the theorem's hypothesis `x ≥ 8·10⁹`; affects a stated result.
- **Error** in robin-1983 at Théorème 8, (23), scan page 7 (line 378; also line 84): the source says `p_k ≤ k(log k + log log k − 0.9385)` for `k ≥ 7022`; it should start at `k = 8602`, since it fails at `k = 7022` and `8581 ≤ k ≤ 8601`; affects a stated result.
- **Error** in buthe-2016 at Theorem 2, (7.1), p. 13 (lines 699–701): the source says `|π*(x) − li x| ≤ √x log x/(8π)` for `x > 59`; it should read `x ≥ 97`, since just below `97` the left side is `1.939 > 1.793`; affects a stated result.
- **Misprint** in dusart-2016 at Theorem 1.1, p. 876 (line 79): the source says the condition is `X ≥ max(8.36, 8R)`; it should read `max(8.36, 8/R)`, as the proof (lines 471, 531) uses; affects nothing.
- **Error** in trudgian-2016 at Corollary 2, p. 7 (line 229): the source says the interval holds from `x ≥ 2 898 239`; at `x = 2 898 240` it ends at `2 898 357.93`, before the next prime `2 898 359`; it should start at `2 898 242`; affects a stated result.
