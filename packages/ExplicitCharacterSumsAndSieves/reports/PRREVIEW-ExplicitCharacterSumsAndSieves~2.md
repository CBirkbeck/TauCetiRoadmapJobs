# Review of ExplicitCharacterSumsAndSieves (pull request #1948 at 3fa29b0)

**Verdict:** needs changes

Scope: `TauCetiRoadmap/ExplicitCharacterSumsAndSieves/README.md` (1956 lines) and
`TauCetiRoadmap/ExplicitCharacterSumsAndSieves/Suggested.lean` (591 lines; 22 definitions, 22
theorems). I read every line. The pull request changes nothing outside the folder. The gate passes
every check at this head. Dependency check, as run:

    depcheck: 244 roadmaps, 2465 edges, 0 problem(s)

Merge order: the suppliers are at ORDER lines 90 (AnalyticNumberTheoryPartI), 96, 154, 269, 270
(ExplicitZetaBounds) and 271 (ExplicitPrimeCounting). This roadmap is at line 272 and its consumers
are at lines 273–275.

## The previous review's findings at this head

- **R01 (toolkit ownership): partly repaired.** Kusmin–Landau, the A-process and Arias de Reyna's
  second derivative tests are now consumed from ExplicitZetaBounds §§4.2–4.3 (README lines 56–61).
  The B-process and Yang's recursive tests have left the Part II list. Two objects still have two
  owners; see R01 below.
- **R02 (the §5.5 route): repaired.** The route now uses the weighted large sieve of
  ExplicitZetaBounds §6.5 (lines 1494–1512 and 1534–1543). I recomputed it; the values are in row 31
  of the table.
- **R03 (Treviño): repaired.** `burgess_trevino_table1`, `burgess_trevino_uniform`,
  `burgess_trevino_table3` and `burgess_trevino_table3_unrestricted` are stated, with both
  certificates. All 54 certificate rows hold (row 24).
- **R04 (Lemma 6 as a corollary): repaired.** Lines 436–440 now derive it from the nonnegativity
  of the second factor. The Check at lines 456–462 gives `0`, `0.375`, `1.5` and `3`, all
  recomputed.
- **R05 (`V < W` at `λ = 1`): repaired.** §1.1 now applies ExplicitZetaBounds §4.3, which allows
  `λ = Λ`. Lines 580–582 say why Patel's `V < W` is not needed, and lines 599–603 give the `W = 8`
  witness (`24.99` against `27.24`, recomputed).
- **R06 (the harmonic bound): repaired.** Lines 899–901 cite
  `Real.eulerMascheroniSeq_lt_eulerMascheroniConstant` (EulerMascheroni.lean line 159) and
  `Real.log_le_sub_one_of_pos` (Log/Basic.lean line 307). The Mathlib contract (lines 229–233) no
  longer cites `harmonic_le_one_add_log`.
- **R07 (random-sample Checks): partly repaired.** The random samples are gone, but exhaustive and
  grid sweeps remain; see R03 below.
- **R08 (slips): repaired.** Line 1618 gives `4.99094…`. Line 1316 reads `3.7451, …, 1.6260`.
  §6.5 (lines 1715–1722) now credits Fan's analytic proof and his three verifications. The Büthe
  locators read `602–655` (line 1472) and `650–655` (line 1699).

## R01 (P2) — van der Corput's inequality (§0.3) and Patel's tests (§§1.1–1.2) are also stated by ExplicitZetaBounds §§4.2 and 4.4

Location: `README.md` lines 61–67, "Kept here: van der Corput's inequality for arbitrary complex
coefficients (§0.3), of which ExplicitZetaBounds §4.2 is the case `b_n = e(f(n))` … Patel's third,
fourth and fifth derivative tests (§§1.1–1.2), which differ from ExplicitZetaBounds §4.4".
Affected: §0.3 (lines 414–465), §§1.1–1.2 (lines 559–652), the Downstream entry at lines 1855–1856,
and `third_derivative_test`, `fourth_derivative_test`, `fifth_derivative_test` (`Suggested.lean`
lines 89–161).

Claim: these are variants that ExplicitZetaBounds does not state, and ProbabilisticAndMetricNumberTheory
§2.5 consumes §0.3.

Witness: ExplicitZetaBounds README (the #1954 head, ORDER line 270) claims ownership at lines 52–53.
Its line 1096 states the inequality for complex `b_n`. Lines 1180–1209 state Patel's three tests
with the same hypotheses (`1/W ≤ |f^{(k)}| ≤ λ/W`, no monotonicity), the free `η_k` and the same
constants. Its §4.8 builds on them (line 1378).

The second witness is the Check values: ExplicitZetaBounds line 1216 gives `α₃ = 6.70215` and
`β₃ = 16.03604` at `W = λ = η = 1`, the values of the §1.1 Check here (`6.702…`, `16.036…`). Its
`18/20` versus `9/5` Check is also the §1.2 Check here. ProbabilisticAndMetricNumberTheory line 11
says its finite van der Corput estimate is its own; it cites neither roadmap.

Why the previous repair (keep them as variants) no longer stands: at the current head
ExplicitZetaBounds states these tests in full, and its own §4.8 route needs them. It is therefore
their owner, and this roadmap, later in the merge order, can only cite them.

Repair:

- Delete §§1.1–1.2 and the three Lean theorems.
- In Scope, the Summary and the end-theorem list, say that Patel's tests are ExplicitZetaBounds §4.4.
- Delete §0.3's main inequality and its `|C(h)|` normalised form, citing ExplicitZetaBounds §4.2.
  Keep Arias de Reyna's Lemma 6 (the real-part form) only as a variant, with one clause saying it
  keeps the real part.
- Point §1.3's *Needs:* at ExplicitZetaBounds §4.2's normalised form, which is exactly the
  `4/H₁ + 4T₁` step at lines 666–667.
- Drop the ProbabilisticAndMetricNumberTheory clause from lines 62–64 and its Downstream entry.

Tested on the refuting instance: after the repair, §1.3's base case at `b = (1, 1, 1)` on `(0, 3]`,
`H = 2` reads `1 ≤ 3.33` from ExplicitZetaBounds' `|C(h)|` form, as the Check at line 455 already
computes.

ExplicitZetaBounds lines 84–87 and 2562–2566 still cite this roadmap's earlier numbering (its §1.6
and §§1.1–1.5). Align them to §1.3 in the same pass.

## R02 (P2) — the diagonal bound, `MVDiagonalFiniteRange` and the squarefree large-sieve step are also stated by ExplicitPrimeCounting §0.1

Location: §5.1 lines 1348–1366 (the kernel identity `S(z) > log z`, Büthe's Lemma 4.5 asymptotic,
and `S(z) ≥ log z + 1.07` under `MVDiagonalFiniteRange`); §6.2 lines 1668–1680; `Suggested.lean`
lines 551–554. Also §5.5: lines 1505–1512 ("the step from one prime to a squarefree modulus …
which that section does not state alone") and lines 1535–1538 (`L₁(Q) ≤ (k/φ(k)) L_k(Q)`). Scope
(lines 90–93) names ExplicitPrimeCounting only for `brun_titchmarsh`.

Claim: this roadmap owns these objects.

Witness: ExplicitPrimeCounting README (the #1945 head, ORDER line 271) lists as owned (lines 71–75)
the bound `log u + 1.07` for `u ≥ 6`, Büthe's asymptotic and `MVDiagonalFiniteRange`. Its lines
469–490 prove them. Lines 512–524 prove the squarefree step ("stated here because that section does
not state it alone") and the comparison `L₁ ≤ (k/φ(k))L_k`. Its `Suggested.lean` line 112 defines
`MVDiagonalFiniteRange` with the same content. Its line 3659 lists this roadmap as consumer.

Also: ExplicitPrimeCounting states `brun_titchmarsh` under `MVDiagonalFiniteRange` and
`BrunTitchmarshFiniteRange` (its `Suggested.lean` line 135). The contract here (lines 340–342)
leaves both hypotheses out.

Repair:

- Cite ExplicitPrimeCounting §0.1 for the kernel identity, Büthe's Lemma 4.5 asymptotic, the bound
  `S(u) ≥ log u + 1.07` and `MVDiagonalFiniteRange`.
- Delete §6.2 as a target. Keep the Lean definition with the note used for
  `RosserSchoenfeldFiniteRangeInput`: restated with the same content so the consuming theorems are
  statable at the pins.
- Keep in §5.1 the carriers `selbergDiagonal` and `selbergWeightMass`, the coprime comparison and
  Büthe's Lemma 4.4. ExplicitPrimeCounting states none of these.
- In §5.5, cite ExplicitPrimeCounting §0.1 for the squarefree step and the `L₁`/`L_k` comparison.
  Add one clause saying how the weighted arithmetic large sieve here differs: general `ω(p)` and an
  arbitrary set `𝒩`.
- Add both hypotheses to the `brun_titchmarsh` contract.
- ExplicitMultiplicativeFunctions (#1946, lines 115–118 and 448–455) cites §5.1 for the asymptotic.
  Keep a pointer there or repoint it.

Tested: the two propositions are the same. Each says that for every real `u` with `6 ≤ u < 10⁹`,
`log u + 1.07 ≤ Σ_{q ≤ ⌊u⌋} μ²(q)/φ(q)` (ExplicitPrimeCounting `Suggested.lean` lines 112–115;
here lines 553–554 with `selbergDiagonal`, lines 65–66). At `u = 6` both read `2.862 ≤ 3.25`.

## R03 (P3) — sweep and grid Checks report large computations, not unit tests

Location: lines 869–870, 945–946, 1124–1125, 1131–1133, 1622–1624, 1693–1694 (for example "On the
grid of step `0.001` on `(1, 101)` and step `1` on `[101, 20000)`, a witness … exists at every
point").

Claim: these bullets are Checks.

Witness: none of them separates a plausible wrong statement from the right one. The grid at line
1693 covers about 1.2·10⁵ points and does not prove `ButheSmallRangeVerified` between them. The
argument that does is the concavity argument of the 6.4 Check (lines 1703–1705).

Repair:

- Delete the sweeps at lines 869–870, 945–946, 1124–1125 and 1622–1624. Each section already has an
  explicit two-sided instance: `q = 3, 5` in §§3.2 and 3.4, `p = 7` in §4.1, `x = 7` in §5.6.
- Replace line 1131's sweep by the single value it reports. At `h = 1`, `W₂ = p − 1` against
  `p + 0·√p`.
- Replace line 1693's grid by the concavity argument of 6.4, applied to the affine left side
  `Y∏(1 − 1/p) + 2^{π(z)} + π(z)`.

## Verified sound

**Adversarial table.** All values were computed, by hand or with a scratch script.

| # | Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|---|
| 1 | `intervalExpSum` §0.1 | `f ≡ 0` on `[0,2]`, `[0.2,0.8]`; `x/2` on `[0,3]`, `[0,2]` | `3`; `0`; `0`; `1` | sound |
| 2 | `nearIntegerCount` §0.2 | `x/3`, `a=0`, `N=6`, `δ=0.1`; `a=N=1`, `δ=1/3`; length `0` at `a=3`, `a=2.5` | `3` (`0,3,6`); `n=1` not counted (`‖1/3‖ = δ`); `1`, `0` | sound |
| 3 | §0.3 van der Corput (R01) | `b=(1,1)`, `H=2`; `b=(1,−1)`, `H=2`; normalised at `b=(1,−1)`, `Y=H=2` | `16 ≤ 18` (factor `N`: `12 < 16`); `0 ≤ 6`; `0 ≤ 0.375 ≤ 1.5 ≤ 3` | sound; also ExplicitZetaBounds §4.2 |
| 4 | §§0.4–0.5 | quadratic mod 5; `χ₄`; principal mod 3 | `M_χ = 2 = 2·1`; `M_χ = 1 < 2`; `S(0,6) = 4 > M_χ = 2` | sound; `χ ≠ 1` needed |
| 5 | §0.6 reduction | principal mod 6; mod 12 from `χ₄` | `6−3−2+1 = 2 = S(0,6)`; `1 + 1 = 2 = S(0,5)` (`0` without `χ*(d)`) | sound |
| 6 | `third_derivative_test` (R01) | `W=λ=η=1`; route's lag bound at `W=8`, `m=1`, `L=10`, `λ=1` | `α₃ = 6.70215`, `β₃ = 16.03604`; `7.979+1.25+12.766+3 = 24.995 ≤ 27.245` | sound; also ExplicitZetaBounds §4.4 |
| 7 | `fourth/fifth_derivative_test` (R01) | lag coefficients `2/((s+1)(s+2))`; `β₄` | `72/91, 72/55, 9/5, 392/435, 392/351, 98/78, 392/275`; patel2022 line 196 prints `18/20`, lines 241 and 263 give `18/10` | sound; duplicate |
| 8 | `iterated_vanDerCorput` | `d=1`, `H₁=Y=2`, `X=0`, `f≡0`; `B` property at `H=1`, `T=6`; `H₁ = 1` | LHS `1`, `T₁ = 1/4`, RHS `4.828·max(0.7071, 0.2276) = 3.414`; `28 ≤ 28.97` (`B = 4.5`: `28 > 27`); `piFinset` empty, `T = 0`, bound `B` | sound |
| 9 | §2.1 Fejér reduction | `(sin(π/4)/(π/4))²`; `H ≥ 2` ⇒ `Hδ ≤ H/(8(H−1))`; `f≡0` and `x/2`, `N=4`, `δ=0.1`, `H=2` | `0.8106 > 0.81`; `≤ 1/4`; `5 ≤ 28`, `3 ≤ 20` | sound |
| 10 | `first_derivative_test_points` | `x/10`, `N=20`, `δ=0.05`; product step with two `m` | `3 ≤ 4+4+1+1 = 10`; `4δ²/λ < 8cNδ² ≤ 2cNδ` and `2δ < 1/2 < cλN` | sound; `N = 0` makes `derivWithin` on a point `0`, hypothesis false |
| 11 | `second_derivative_test_points` | `x²/100`, `c=1`, `N=50`, `a=0`, `δ=0.01` | count `6` (multiples of 10) `≤ 6(19.57+17.32+1) = 227` | sound |
| 12 | §3.1 Gauss expansion | quartic `χ` mod 5, `χ(2)=i`; quadratic mod 3 | `τ(χ) = −1.1756+1.9021i`, `τ(χ̄) = 1.1756+1.9021i`, product `−5`, ratio `(1+2i)/√5`; `τ = i√3` | sound; Mathlib `gaussSum_mulShift_of_isPrimitive` applied to `χ⁻¹` gives `χ(n)τ(χ⁻¹)` |
| 13 | `polya_vinogradov_classical` | `q=3`; `q=5`; `√p log p` at `p=3` | `4/3` (closed form `1.579`); `2.462`; `0.911 ≤ 1.0986` | sound; strict from pomerance2011 (5) |
| 14 | §3.3 Lemmas 2–4 | `C₃(π)`; alternative route `n=2`; Lemma 3 at `n=1`, `x=π/2` | `−5/6 > −1.36`; endpoint values `−0.640`, `−0.667 > −1`; `1 < 2.7186` | sound; `h′(s) = 0` at `s = 1/(n+1)` checked |
| 15 | `polya_vinogradov_pomerance` | `q=3` odd; `q=5` even | `2.087 ≥ 1`; `4.514 ≥ 2` | sound |
| 16 | `polya_vinogradov_lapkova`, §6.1 | primitive counts `q ≤ 25`; quadratic mod 23; rounded forms; `L` at `q = 18, 19, 23, 24` | `123` characters; `M_χ = 5 ≤ 7.356`; `31.305 ≤ 31.305`, `5.742 ≤ 5.745`; `19 > 18`, `19 ≤ 19`, `24 > 23`, `24 ≤ 24` | sound |
| 17 | `A(q₀)` §3.5 | `q₀ = 10⁶`; `1200` | `A = 0.21861`, `A√q log q = 3020.2` = Lapkova's odd bound `3020.2`; `0.27905` | sound |
| 18 | `polya_vinogradov_frolenkov_soundararajan` | `q = 1000` | `0.2251·31.62·12.908 + 31.62 = 123.5 < 200` | sound (second hand) |
| 19 | `burgess_moment_bound` | `r=2`, `H=2` counts; Jensen factor at `d=3`; `r = 4, 5` | `8` (`d=2`), `6` (`d≥3`); `(π/(3 sin(π/3)))² = 1.4622`; `109.7 > 105` (exact count used), `800.9 ≤ 945` | sound |
| 20 | §4.1 `r = 2` refinement | `p=7` quadratic and cubic, `h=2`; `p=19` quartic; threshold | `W₂ = 34 ≤ 98.33`, `22 ≤ 121.4`; `Σ = −9`, `9 > 8.718`; per `h(h−1)(h−2)`: `12√p − 12 − (h−3) > 0` iff `h < 12√p − 9` | sound |
| 21 | §4.2 prime multipliers | `{2,3,5}`, `N=100`, `p=1009` | `V₂ = 300 + 2·73 = 446 ≤ 452.67` | sound |
| 22 | §4.3 amplification | shift identity; Hölder exponents; `A=B=1`, `r=1` | trevino2015 lines 643–653; `1 − 1/r + 1/(2r) + 1/(2r) = 1`; `√(N(p−1)) + 2E(1)` | sound |
| 23 | `burgess_mcgown_parametric/table`, §6.6 | `C₀(2)`, `C₀(3)`; (A.1) at `r=2`; `C₀(15) ≥ 1` | `10.03656 < 10.0366`, `4.95381 < 4.9539`; `100.73·3.4485·3.1470 = 1093.2 ≥ 1056`; `1.769` | sound |
| 24 | `TrevinoTable1Certificate` | 27 rows, `p ∈ [p₀, p₀·10²⁰⁰]`, step `10^{1/8}` | `2.738070` (`r=2`, `10⁷`), `2.019615` (`r=3`), `1.256098` (`r=10`, `10²⁰`); `A(10⁷, r=2) = 40.27`; worst point `p₀`; largest `num/(c·den) = 0.99999`; no failure | true, so not vacuous |
| 25 | `TrevinoTable3Certificate` | 27 rows, same grid; `r=10`, `p₀=10¹⁰` | `3.652847`, `1.579302`, `1.521507`; bracket `4.7426 → 4.8535` at `10^{23.3}`, `g` `1.0485 → 1.0098` | true; formulas match displays (46), (47), (58), (59) |
| 26 | `burgess_trevino_*` | log exponents at `r=2`, `p=10¹⁰`; `p = 10⁷` trivial threshold; `s` at `r=3` | `8.00` vs `12.08` (`17.53` with `1/r`); `225.8√N`, `N > 5.1·10⁴`; `(2.7381/2.019)⁶ = 6.221` | sound |
| 27 | §5.1 diagonal sums (R02) | `S(6)`; `S(5.99)`; `S₆(7)`; `H₁(1..3)` | `3.25 ≥ 2.862`; `2.75 < 2.860`; `1.4167 ≥ 1.139`; `1, 4, 6` | sound; also ExplicitPrimeCounting §0.1 |
| 28 | `greaves_density_sum` | `κ≡1`, `z=3`, `s=2`; Rankin step | `0.749 ≤ 2`; `g/(1+g) = κ/p`, `z^σ = s/(2B)` | sound; prime range `range ⌈z⌉₊` = primes `< z` |
| 29 | `buthe_weighted_*`, `butheRho` | `f≡1` on `[0,10]`, `[1.9,5.1]`; tent; `y = 0` | `4 < 8.69`; `3 < 5.502`; `ρ = y/6`; `ρ = 0`, hypothesis false | sound |
| 30 | §§6.3–6.4 | `Y=100`, `z=7`; `Y=20`, `z=2`; `Y=20000`, `z = 65, 40, 100` | `42.857 < 43.43`; `13 < 13.35`; `4003.29 < 4038.98`, `4154.91`, `4072.95`; witnesses `z = 57…84` | sound |
| 31 | §5.5 sifted form (previous R02) | Eratosthenes ranges; minimum margin on `(1, e²)`; `t ≥ 1000` with the lower bound from `S ≥ log u + 1.07`, steps below 6, `π(Q) ≤ Q/3 + 2` | `z=3` holds to `t = 318.946`, `z=5` on `[42, 1465.29]`; `0.0874` at `t = 3.554`; `t=1000`, `Q=23`: `287.02 < 289.53`; no failure at any integer `1000 ≤ t ≤ 20000` or at samples to `1.9·10⁶` | sound |
| 32 | weighted arithmetic large sieve | odd integers of `(0,10]`, `Q=2`; `k=6`, `N=50`, `Q=10` | `1/L = 7.17 ≥ 5`; `L₁ = 0.04104 ≤ 3L₆ = 0.05538` | sound |
| 33 | `ramare_viswanadham_prime_powers` | `d=1`, `A=B=10`; `d=3`, `a=1`, `A=B=30`; Lemma 15 at `M=121` | `4.25 ≤ 8.69`; `3.5 ≤ 13.03`; `3.434 ≤ 3.5` | sound |
| 34 | `fan_rough_count` | `x=7`, `z ∈ (4.99094, 5)`; `x=8` on `[3,5)`, `[5,7)`, `[7,8]`; `x=9`, `z=3`; `x=32`, `z=4` | `Φ = 3 > 2.9982`; `3.4265 > 3`, `3.0548 > 2`, `2.9222 > 1`; `3 < 4.46`; `11 < 15.39` | sound with `8 ≤ x` |

**Sources: the seeded sample, all 15 targets.**

- 0.6: the identity and `M_χ ≤ 2^{ω(r)} M_{χ*}` rederived (row 5). montgomeryvaughan2007 is
  uncertified; see Not verifiable.
- 2.1: `tmeemt-art11` lines 183–186 (`δ ∈ (0, 1/4)`, `K = ⌊(8δ)⁻¹⌋ + 1`, `4N/H + (4/H)Σ`).
- 3.1: `pomerance2011` lines 229–262, displays (7)–(10).
- 3.2: lines 183–203, displays (4)–(5).
- 3.3: line 180 (the tail bound), Lemma 2 at lines 112–134, Lemma 3 at lines 147–161 with (3) at
  line 161, Lemma 4 at lines 172–204.
- 4.3: `trevino2015` lines 643–700, displays (26)–(29); `mcgown2012` Lemma A.5 at lines 1083–1118
  and Lemma A.7 at lines 1130–1142 (the bound matches the third bullet of §4.2).
- 5.2: `tmeemt-art14` lines 159–170. The route was rederived (row 28).
- 5.4: `buthe2014` Definition 4.1 at lines 291–295, Theorem 4.2 at lines 298–314, (4.3) and vLR65
  at lines 315–348, the corollary at lines 349–353, Theorem 4.3 at lines 354–362, the proof at lines
  602–655.
- 5.5: `platttrudgian2018` Theorem 2 at lines 131–139; `ramareviswanadham2021` Lemma 14 at lines
  650–666 (with `≤` and `A ≥ B`) and Lemma 15 at lines 667–679; `tmeemt-art14` lines 97–111.
- 5.6: `fan2022` Theorem at lines 157–163; verifications at lines 215–222, 290–292 and 449–462;
  `tmeemt-art14` lines 181–191.
- 6.1: `lapkova2018` Lemma 3A at lines 245–282. The proof at lines 291–408 gives the parameter `L`
  and the `q ≤ 25` data.
- 6.2: `fan2022` lines 185–187; `buthe2014` lines 609–616.
- 6.3: `buthe2014` lines 633–649.
- 6.4: lines 650–655 (Büthe verified `z ∈ [50, 2·10⁹)`, which covers `[10⁴, 1.6·10¹⁹]`).
- 6.6: `mcgown2012` Theorem A.1 and Table A.1 at lines 1030–1050, Theorem A.9 at lines 1209–1233,
  Lemma A.8 at lines 1192–1204, `d = 11` at line 1433; `trevino2015` Theorem C at lines 113–128.
- Also checked: `trevino2015` Tables 1, 3, 5 and 7 (lines 97–107, 145–155, 1013–1024, 1311–1322)
  against `trevinoTable1/3/5/7` entry by entry, and the theorem statements at lines 83–94 and
  134–161.

**Library declarations opened at the pins (44).**

Mathlib (35):

- `Real.fourierChar`, `fourierChar_apply` (Circle.lean 221, 232); `UnitAddCircle.norm_eq`
  (AddCircle.lean 223).
- `gaussSum` (GaussSum.lean 72); `gaussSum_mulShift_of_isPrimitive` (DirichletCharacter/GaussSum.lean
  59, which includes non-units); `ZMod.stdAddChar`, `isPrimitive_stdAddChar` (83, 95).
- `BoundingSieve`, `SelbergSieve`, `siftedSum_le_mainSum_errSum_of_upperMoebius`,
  `upperMoebius_lambdaSquared` (54, 78, 217, 251).
- `quadraticChar`, `quadraticChar_ne_one` (120, 207).
- `Real.eulerMascheroniSeq`, `eulerMascheroniSeq_lt_eulerMascheroniConstant` (50, 159);
  `log_add_one_le_harmonic` (25); `Real.log_le_sub_one_of_pos` (307).
- `exists_deriv_eq_slope` (155); `AbsolutelyContinuousOnInterval` (155) and `.integral_deriv_eq_sub`
  (227).
- `sum_mul_sq_le_sq_mul_sq` (171); `inner_le_Lp_mul_Lq_of_nonneg` (954); `ConvexOn.map_integral_le`
  (196).
- `hasSum_taylorSeries_neg_log` (280); `tendsto_tsum_powerSeries_nhdsWithin_stolzSet` (162);
  `hasSum_fourier_series_of_summable` (493); `strictConcaveOn_sin_Icc` (164).
- `Real.sin_le`, `Real.mul_le_sin` (56, 84); `ZMod.unitOfCoprime` (794);
  `DirichletCharacter.norm_le_one` (44).

Tau Ceti (9):

- `gaussSum_mul_gaussSum_inv_eq_card_of_isPrimitive`, `IsPrimitive.norm_gaussSum` (GaussSum.lean
  43, 82); `IsPrimitive.eq_one_iff` (Conductor.lean 25); `even_of_le_two` (Even.lean 77).
- `sum_range_level_eq_zero`, `sum_range_eq_sum_range_mod`, `norm_sum_Icc_le_level`
  (PartialSum.lean 30, 37, 49).
- `hasse_bound`, `frobeniusTrace_sq_le_four_mul_card` (HasseBound.lean 57, 44); `pointCount`,
  `frobeniusTrace_eq_card_point` (PointCount.lean 73, 115).

A grep of both trees finds no Kusmin–Landau, Pólya–Vinogradov, Burgess, Brun–Titchmarsh or large
sieve.

**Cross-roadmap citations resolved at their heads (25).**

- SieveMethodsAndPrimePatterns (#1495): §§1.1 (line 991), 1.3 (1172), 1.6 (1462), 2.9 with the
  forbidden-residue sieve (2316), 5.2 (3333).
- CharacterSumsOverFiniteFields (#1712): §4.7 (1436; `weil_mulChar_sum_bound` at `Suggested.lean`
  line 320, hypothesis `¬ ∃ c h, f = C c * h ^ orderOf χ`), §7.1 (1921).
- EllipticLegendreCharacterInterfaces (#1545): §5.1 (592).
- AnalyticNumberTheoryPartI (#1126): §§0.5 (253), 0.8 (292), 0.19 (564), 0.20 (574), 0.34 (805),
  1.5a (979).
- ExplicitZetaBounds (#1954): §§4.1–4.5 (1072–1229), 6.5 (1808).
- ExplicitPrimeCounting (#1945): §0.1 (453).
- ProbabilisticAndMetricNumberTheory (#1421): §2.5 (2693), §2.7 with `erdos_turan` (3132).
- Consumers: ExplicitNumberFields' citations of §§3.5, 4.1 and 6.1 resolve (its lines 527–545,
  2920), and so does ExplicitMultiplicativeFunctions' citation of §5.1 (its lines 448–455).

No `Suggested.lean` declaration reuses another roadmap's fully qualified name.

Ownership was checked by object against main and the open heads named in the brief. Apart from R01
and R02, nothing overlaps. ExplicitZetaBounds lines 83–88 confirm that the iterated inequality and
the `d`-th derivative estimate (§1.3 and Part II) belong here.

**Lean form.**

- `lake env lean` on `Suggested.lean`: 22 warnings, all `declaration uses sorry`, no other message.
- The file has no `variable` block, so no binder can drop. I compared the 44 elaborated types of the
  worker's signature listing with the README; no change was needed.
- One-tactic probe on a scratch copy: `simp`, `rfl`, `norm_num`, `positivity`, `infer_instance` and
  `intro; simp`, each forced to close the goal. All 22 theorems fail it, and every definition is
  used by a theorem. No padding.
- Single `import Mathlib`, no `set_option`, no sorry'd data, `theorem` only.
- Every headline in the README's end-theorem list is stated.

## Not verifiable

- `montgomeryvaughan2007` §9.4 (target 0.6), `filaseta1990` (2.1), `greaves2001` Theorem 1 p. 52
  (5.2), `montgomeryvaughan1973` Corollary 1, Theorem 2 and Lemmas 7 and 10 (5.5, 6.2),
  `frolenkovsoundararajan2013` (3.6), `trevino2015kth` Theorem 1.2 and `bordelles2012`: uncertified
  (paywalled) in the manifest. Checked through the quoting texts above, and the routes for 0.6, 2.1,
  5.2 and 5.5 rederived.
- For 3.6 the quoting texts differ: `tmeemt-art15` lines 106–109 give intervals with `q ≥ 1000`,
  while `hunter2016` lines 651–664 give initial sums with `q > 100`, strict. The README follows the
  former.
- `vanlintrichert1965`: waived.
- Pomerance's display (7) (`pomerance2011` line 236): the extraction may have dropped a conjugation
  bar. The identity of §3.1 was checked numerically (row 12).

## Source issues

- **Error** in fan2022 at the Theorem, inequality (5), p. 4: the source says (5) holds whenever `max(3, √x) ≤ z ≤ x`; it fails for `7 ≤ x < 7.0043` with `z` just below `5` (`Φ = 3`), so it should require `x ≥ 8`; affects a stated result.
- **Misprint** in patel2022 at Lemma 3.1, p. 5: the source says `β₄` carries the factor `18/20`; it should be `18/10 = 9/5`, as proof displays (33) and (35) give; affects a stated result.
- **Error** in kerrmcgowntrudgian2020 at Lemma 3, p. 3: the source says `A(q₀)` has middle term `0.8204/√q₀`; to follow from Lapkova's Lemma 3A it should be `0.8204/log q₀`; affects a stated result.
- **Error** in mcgowntrudgian2020 at the proof of Proposition 1, p. 5: the source says for quadratic `χ` the Weil factor improves to `2(r − 1)`; it should be `2(r − 1)√p + 1` (at `p = 19` a quartic gives `−9`); affects the proof.
- **Error** in tmeemt-art15 at the Treviño `c₂` table (lines 236–284): the source prints columns `p₀ = 10⁷, 10¹⁰, 10²⁰` starting `3.7451, 3.5700, 3.5341`; it should match trevino2015 Table 3 (`10¹⁰, 10¹⁵, 10²⁰`: `3.6529, 3.5851, 3.5751`); affects nothing here.
- **Misprint** in tmeemt-art14 at the Ramaré–Viswanadham quotation (line 104): the source says the sum is strictly below `2y/(φ(k) log(y/k))`; it should be `≤`, as Lemma 14 states; affects nothing.
- **Misprint** in tmeemt-art14 at the definition of `π(z; k, ℓ)` (line 92): the source says primes "coprime to ℓ modulo k"; it should be "congruent to ℓ modulo k"; affects nothing.
- **Misprint** in tmeemt-art14 at the density estimate (line 163): the source labels Greaves's theorem "(2022)"; it should be 2001, the book's year; affects nothing.
