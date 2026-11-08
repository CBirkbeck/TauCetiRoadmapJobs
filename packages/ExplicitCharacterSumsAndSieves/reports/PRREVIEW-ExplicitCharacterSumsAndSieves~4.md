# Review of ExplicitCharacterSumsAndSieves (pull request #1948 at cb8a520)

**Verdict:** needs changes

This is an incremental re-review of the 140 lines changed since `5aa1cf5`, in
`TauCetiRoadmap/ExplicitCharacterSumsAndSieves/README.md` (now 1890 lines) and
`TauCetiRoadmap/ExplicitCharacterSumsAndSieves/Suggested.lean` (now 523 lines). The pull request
changes nothing outside the folder. All four previous findings are repaired. Two new slips, both
in the rewritten proof sketches, are below. Both are P3, and neither affects a statement or the
Lean file.

## R01 (P3) — §3.4, odd case: the main part has `χ(m)` where the expansion gives `χ⁻¹(m)`

Location: `README.md` lines 850–851: "The main part is `(iτ(χ)/π) Σ_{m ≤ n} χ(m)(cos mα − cos
mβ)/m` with `α = 2πN/q`, `β = 2πM/q`".

Claim: the odd main part `C_n` of the truncated Fourier expansion equals that sum with
coefficients `χ(m)`.

Witness:
- §3.1 of this README (line 720) gives `χ(n) τ(χ⁻¹) = Σ_b χ⁻¹(b) e(bn/q)`. Applied to `χ⁻¹`, this
  is `Σ_a χ(a) e(am/q) = χ⁻¹(m) τ(χ)`.
- Take the quartic character modulo `5` with `χ(2) = i`, and `M = 1`, `N = 3`, `n = 2`. Computed
  from pomerance2011 line 368, `C_2 = 0.4677 + 0.7568i`.
- The README's form gives `0.8861 + 0.0799i`. The same form with `χ⁻¹(m)` gives
  `0.4677 + 0.7568i`.

The text of pomerance2011 that we hold drops overbars, so its line 384 reads `χ(m)` there as well.

Repair: write `Σ_{m ≤ n} χ⁻¹(m)(cos mα − cos mβ)/m`. Nothing else changes, because the next step
bounds `|χ⁻¹(m)| ≤ 1`.

Tested: at `n = 3` the direct value is `0.6072 + 0.5312i`. The repaired form gives the same value.
The `χ(m)` form gives `0.7467 + 0.3055i`.

## R02 (P3) — §5.1, weight mass: the tail bound `Σ_{e > T} e^{−2} ≤ 1/(T + 1/2)` is false for non-integer `T`

Location: `README.md` lines 1292–1293: "From `Q(y) = Σ_{e ≤ √y} μ(e)⌊y/e²⌋`, … and
`Σ_{e > T} e^{−2} ≤ 1/(T + 1/2)`, `|Q(y) − 6y/π²| ≤ 2√y + 5/3`".

Claim: the tail inequality holds for the `T` of the sketch, and the sketch splits at `√y`.

Witness: `T = 1.5` gives `Σ_{e ≥ 2} e^{−2} = π²/6 − 1 = 0.645 > 1/2`. `T = √3`, the split at
`y = 3`, gives `0.645 > 0.448`.

The constant `5/3` comes from the integer split `T = ⌊√y⌋`:
- the first part is at most `T`;
- `y/(T + 1/2) < (T + 1)²/(T + 1/2) ≤ T + 5/3` for `T ≥ 1`.

Repair: write "`Σ_{e > T} e^{−2} ≤ 1/(T + 1/2)` for integers `T ≥ 0`, applied at `T = ⌊√y⌋`".

Tested:
- At `T = 1` the repaired inequality reads `0.645 ≤ 0.667`.
- The conclusion `|Q(y) − 6y/π²| ≤ 2√y + 5/3` holds at both ends of every step for real
  `1 ≤ y ≤ 10⁶`. The largest ratio to the bound is `0.251`, at `y = 7`.

## Previous findings

- R01 — repaired: "Prove `polya_vinogradov_pomerance`: under `LapkovaSmallModuliVerified` (§6.1) … *Even `χ`, `q ≤ 20`, and odd `χ`, `q ≤ 10`*: §3.2 … *Odd `χ`, `11 ≤ q ≤ 44`*: §3.5"; Lean `(hsmall : LapkovaSmallModuliVerified)`, moved after `polya_vinogradov_lapkova`.
- R02 — repaired: "`S_k(z) ≥ (φ(k)/k) S(z)` (vanlintrichert1965; used in buthe2014 display (4.3), lines 340–345, where `k₁ S_{k₁}(z) ≥ φ(k₁) S₁(z) = φ(k) S₁(z)` for `k₁ = lcm(k, 2)`)".
- R03 — repaired: "The control is a statement at `t = 1000`, not on a range: at `t = 24`, `Q = 2` gives `(24 + 4)/S(2) + π(2) = 14 + 1 = 15`, below `2t/log t = 15.10`."
- R04 — repaired: §5.1 *Needs:* now has "`hasSum_zeta_two` and `hasSum_zeta_four` (`Mathlib/NumberTheory/ZetaValues.lean`, lines 453 and 458…)"; References: "**hunter2016** — M. Hunter … honours thesis, Australian National University, 2016". The new weight-mass route carries R02.

## Verified sound

**Gate, build and dependency check.**
- I re-ran the gate on this head. Every check is 0 (`… depcheck=0 metadata=0 stray-files=0 dirty=0
  outside-folder=0 source-material=0 OK`).
- `lake env lean` on `Suggested.lean` gives 19 warnings, all `declaration uses sorry`, and nothing
  else.
- The dependency check, as run:

      depcheck: 244 roadmaps, 2465 edges, 0 problem(s)

- Suppliers are at ORDER lines 90, 96, 154, 269, 270 and 271. This roadmap is at line 272.
- The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.

**The changed Lean declaration.**
- `polya_vinogradov_pomerance` elaborates as `LapkovaSmallModuliVerified → ∀ {q} (χ), χ.IsPrimitive
  → 1 < q → (χ.Even → … ≤ 2/π²·√q·log q + 4/π²·√q·log(log q) + 3/2·√q) ∧ (χ.Odd → … ≤
  1/(2π)·√q·log q + 1/π·√q·log(log q) + √q)`. This is the README statement word for word.
- The file has no `variable` block, so no binder can be lost.
- One-tactic probe on a scratch copy: `simp`, `rfl`, `norm_num`, `positivity`, `simp_all`,
  `trivial`, `infer_instance`, `intro h; simp`, `constructor <;> intro h <;> simp` and
  `exact fun h => h`. None of the 10 closes it.
- The hypothesis gives `LapkovaBound` only for `q ≤ 25`. It does not contain the conclusion.
- The module docstring lists the Layer 3 theorems in the new order. "Every finite verification a
  theorem rests on is a hypothesis" is now true of this theorem.
- §3.4 now needs §3.5, a later subsection of the same layer. The edge is acyclic: §3.5 needs only
  §3.1, §0.5 and Layer 6 (line 928). It is declared on §3.4's *Needs:* line, and `Suggested.lean`
  states Lapkova before Pomerance.

**Sources checked at the changed passages.**
- 3.4 (seeded), against pomerance2011:
  - the even analytic range `q ≥ 21` with `n = ⌊2√q log q⌋` (lines 351–357);
  - the Bober–Goldmakher sentence for even conductors (357–360);
  - the odd case on a general interval `[M, N]`: lines 362–364, the main part at 384, the product
    formula and Cauchy–Schwarz at 393–419, the tails at 422–423, `n = ⌊(4/π)√q log q⌋` at 424,
    and `q ≥ 45` at 431–432;
  - the odd small-case data (432–437).

  The old route "use `M_χ ≤ 2 max_N |Σ_{a ≤ N} χ(a)|`" for odd `χ` is gone. The new Check shows
  that it fails (row 34).
- 6.1 (seeded): "the same data" agrees with pomerance2011 lines 432–437 and lapkova2018's proof
  from line 282.
- 5.1, against buthe2014:
  - Lemma 4.4 with `47` (lines 365–367);
  - the computer-assisted squarefree bound `0.68√z` (lines 419–425; CDEM07 "with a short computer
    calculation");
  - the product over `p < 10000` (lines 450–459);
  - `h`, `h̃` (377–385), display (4.5) (408–418) and (4.7) (440–441);
  - `h(1) = ζ(2)²/ζ(4) = 5/2` (442–447) and the `t ≥ 16` inequality (448).

  The change from `47` to `200` removes a computer-assisted input that had no Layer 6 hypothesis.
  This brings §5.1 in line with Conventions line 192.
- 5.4: `H₁(z) ≤ (15/π² + 47/√10⁹)z ≤ 1.53z` is at buthe2014 lines 617–622.
- 5.1 coprime comparison: `k₁ = [k, 2]` is at buthe2014 line 330, and display (4.3) at lines
  340–345.
- References: hunter2016 lines 8–12 (Morgan Hunter; BSc Honours thesis, Australian National
  University, October 2016).
- Seeded targets outside the changed passages (0.1, 0.6, 1.1, 2.2, 2.3, 3.6, 4.3, 4.5, 5.2, 5.3,
  6.2, 6.5, 6.6) are untouched by the diff. They stand as passed by the previous review.

**Library declarations opened at the pins (6).**
- `hasSum_zeta_two` and `hasSum_zeta_four` (`Mathlib/NumberTheory/ZetaValues.lean` 453, 458; sums of
  `1/n²` and `1/n⁴`).
- `riemannZeta_eulerProduct_tprod` (`Mathlib/NumberTheory/EulerProduct/DirichletLSeries.lean` 98).
  Its hypothesis `1 < s.re` holds at `s = 3/2, 2, 3, 4`.
- Also opened: `riemannZeta_two` and `riemannZeta_four` (`LSeries/HurwitzZetaValues.lean` 226,
  232), and `zeta_eq_tsum_one_div_nat_cpow` (`LSeries/RiemannZeta.lean` 207). These are the
  bridges from the Euler product to the values and to the series bounds for `ζ(3/2)` and `ζ(3)`.

**Cross-roadmap citations resolved at their heads.**
- No roadmap cites §3.4 or `polya_vinogradov_pomerance`, so the new hypothesis breaks no consumer:
  - ExplicitNumberFields cites §§3.5, 4.1 and 6.1 (its lines 527–545 and 2833–2920);
  - `roadmaps grep` finds `polya_vinogradov_pomerance` nowhere else.
- No roadmap cites the `H₁` constant, so the change from `47` to `200` breaks none.
  ExplicitMultiplicativeFunctions takes from §5.1 only `selbergDiagonal`, the coprime comparison
  and the `58/√z` asymptotic (its lines 114–120, 448–454 and 2794–2800).
- ExplicitZetaBounds, at its head `bd1ac3e`, now says "(its §0.3 …)" and "(its §1.1 …)" at lines
  85–87 and 2652–2654. This settles the previous review's note outside the folder.
- `scratch/overlaps.md`: no other pull request changes this roadmap, and no cited id is dropped.

**Adversarial table.** I recomputed the values of rows 13, 24, 30 and 33–36 with scratch
scripts. Rows marked (r3) carry forward from the previous review at `5aa1cf5` for statements the
diff leaves untouched.

| # | Statement | Instances | Values (left / right) | Result |
|---|---|---|---|---|
| 1 | `intervalExpSum` §0.1 (r3) | `f≡0` on `[0,2]`, `[0.2,0.8]`; `x/2` on `[0,3]`, `[0,2]` | `3`; `0`; `0`; `1` | sound |
| 2 | `nearIntegerCount` §0.2 (r3) | `x/3`, `a=0,N=6,δ=0.1`; `a=N=1`, `δ=1/3`; `N=0` | `3`; `n=1` not counted; `1`, `0` | sound |
| 3 | §0.3 real-part form (r3) | `b=(1,1,1)`, `H=2`; `b=(1,−1)`; `Y=1.01,H=1`; 20 000 random | `1 ≤ 2.67`; `0 ≤ 1.5`; `3.92 ≤ 4`; max ratio `0.788` | sound |
| 4 | §0.4 `M_χ` (r3) | quadratic mod 3, mod 5; principal mod 3 | `1`; `2`; `S(0,6)=4 > M_χ=2` | sound |
| 5 | §0.5 even symmetry (r3) | quadratic mod 5; `χ₄`; principal mod 5 | `M=2=2·1`; `M=1<2`; `4−N` | sound |
| 6 | §0.6 reduction (r3) | principal mod 6; mod 12 from `χ₄` | `2 = 6−3−2+1`; `2 = 1+1` | sound |
| 7 | `iterated_vanDerCorput` (r3) | `H=1,T=6`; `d=1,H=Y=2,f≡0`; `d=2,3` instances | `28 ≤ 28.97`; `1 ≤ 3.414`; `0.062 ≤ 3.085`; `0.143 ≤ 3.786` | sound |
| 8 | §2.1 Fejér reduction (r3) | `(sin(π/4)/(π/4))²`; `f≡0`, `x/2` | `0.8106>0.81`; `5 ≤ 28`; `3 ≤ 20` | sound |
| 9 | `first_derivative_test_points` (r3) | `x/10,N=20,δ=0.05`; `f=x,N=10,δ=0.01` | `3 ≤ 10`; `11 ≤ 21.42` | sound |
| 10 | `second_derivative_test_points` (r3) | `x²/100,N=50,δ=0.01`; `x/2,A=2` | `6 ≤ 227.4`; `3 ≤ 6` | sound |
| 11 | `polya_vinogradov_classical` (r3) | `q=3`; `q=5`; `p=3`, `p=2` | `4/3` vs `1`; `2.462` vs `2`; `0.911 ≤ 1.099`; `0.726 > 0.693` | sound |
| 12 | §3.3 Lemmas 2–4 (r3) | `C₃(π)`; `n=2` route; Lemma 3 at `n=1` | `−5/6 > −1.36`; `−0.640`, `−0.667 > −1`; `1 < 2.72` | sound |
| 13 | `polya_vinogradov_pomerance` (changed) | §3.2 vs even bound, `q = 3…49`; §3.2 vs odd bound; §3.5 odd vs odd bound; Checks at `q = 3, 5, 11, 20, 7` | §3.2 below the even bound at every `q` (`q=20`: `9.2226 ≤ 11.4117`); below the odd bound exactly for `q ≤ 10` (`5.1384 ≤ 5.1607`; `q=11`: `5.5874 > 5.5057`); §3.5 below the odd bound exactly from `q = 7` (`4.0185 ≤ 4.0258`; `q=5`: `3.4357 > 3.1476`); difference `0.00733`, `0.4905`, `2.973` at `q = 7, 11, 44`; `q=3` odd `2.087`, `q=5` even `4.515` | sound: every primitive conductor is covered |
| 14 | `polya_vinogradov_lapkova`, §6.1 (r3; one sentence added) | all primitive χ, `2≤q≤25`; rounded forms | 123 characters, max `M/b = 0.680`; `31.305 ≤ 31.305`; `5.742 ≤ 5.745` | sound |
| 15 | `A(q₀)` §3.5 (r3) | `q₀=10⁶`; printed form; `q₀=1200` | `0.21861` (`3020.2`); `0.16005`; `0.27905` | sound |
| 16 | `polya_vinogradov_frolenkov_soundararajan` (r3) | `q=1000`; mod 2310, 4620 | `123.5 < 200`; `5 ≤ 196.75`; `8 ≤ 288.86` | sound |
| 17 | `burgess_moment_bound` (r3) | degenerate counts; `p∈{7,11,13}`, `r≤3` | `1,22,99`; `1,86`; no violation | sound |
| 18 | §4.1 `r=2` refinements (r3) | `p=7`; `p=19` quartic; 18 `(p,d)` | `34 ≤ 98.33`; `22 ≤ 121.37`; `9 > 8.718`; none | sound |
| 19 | §4.2 energy counts (r3) | `{2,3,5}, N=100, p=1009`; `A=28,N=400` | `446 ≤ 452.67`; `88 447` | sound |
| 20 | §4.3 amplification (r3) | `A=B=1`, `r=1`; Hölder exponents | `√(N(p−1)) + 2E(1)`; sum `1` | sound |
| 21 | `burgess_mcgown_parametric/table` (r3) | `C₀(r)`, `2≤r≤15`; (A.1) | `10.036550<10.0366`; `1093.2≥1056`; all 14 rows | true |
| 22 | `burgess_trevino_table1/uniform` (r3) | 27 rows, `p ∈ [p₀, p₀·10²⁰⁰]` | max `0.999995`; `2.738070` | true |
| 23 | `burgess_trevino_table3` (r3) | 27 rows, same grid | max `0.999995`; `3.652847` | true |
| 24 | `selbergDiagonal`, `selbergWeightMass` §5.1 (weight mass changed) | `S(6)`; `[3,5)`; `S₆(7)`; `H₁(1..3)`; `H₁(10⁶)`; `H₁(42)`; all real `1 ≤ z ≤ 10⁶`; `h(1)` | `3.25`; `2.5 ≥ 2.4974`; `1.4167 ≥ 1.139`; `1, 4, 6`; `1 519 817.79` vs `15·10⁶/π² = 1 519 817.75`; `76.479` vs `63.832` (`1.951√42`); max `|H₁−15z/π²|/√z = 1.951` (at `z = 42`); partial product to `10⁷` `2.49999997` | sound |
| 25 | `greaves_density_sum` (r3) | `κ≡1, z=3, s=2` | `2 ≥ 0.749` | sound |
| 26 | `butheRho`, `buthe_weighted_brun_titchmarsh` (r3) | tent; `f≡1` on `[0,10]`, `[1.9,5.1]` | `ρ=y/6`; `4<8.686`; `3<5.502` | sound |
| 27 | `buthe_weighted_prime_sum` (r3; §5.4 wording changed) | small range grid; `Y=20000`; `z=√Y/2` | least margin `0.455`; `4003.29 < 4038.98`; margins `0.54–1.33%`. New: the `200` bound gives `1.52614 ≤ 1.53` at `z = 10⁹` | true |
| 28 | weighted arithmetic large sieve §5.5 (r3) | odd integers of `(0,10]`, `Q=2` | `7.172 ≥ 5` | sound |
| 29 | sifted form §5.5 (r3) | `t=318, 319`; `t ≥ 1000` | `110.33≤110.38`, `110.67>110.66`; margin `1.99` | sound |
| 30 | §5.5 negative control (changed) | `t = 1000`; `t = 24`, `Q = 2` | `301.77 > 289.53`, weighted `269.53`; `(24+4)/2 + 1 = 15.0 < 48/log 24 = 15.104` | sound |
| 31 | `ramare_viswanadham_prime_powers` (r3) | `d=1,A=B=10`; `A=1,B=7` | `4.25 ≤ 8.686`; `4.833 ≤ 7.195` | sound |
| 32 | `fan_rough_count`, §6.4 (r3) | `x=7, z=4.999`; cells to `x=20 000` | `3 > 2.99835`; none with `x≥8` | true with `x≥8` |
| 33 | §3.4 odd main part `C_n` (new) | quartic `χ` mod 5, `χ(2)=i`, `M=1`, `N=3`, `n=2,3` | direct `0.4677+0.7568i`; `χ(m)` form `0.8861+0.0799i`; `χ⁻¹(m)` form `0.4677+0.7568i`; `n=3`: `0.6072+0.5312i` vs `0.7467+0.3055i` | false as written → R01 |
| 34 | §3.4 doubling Check (new) | `q = 10⁶` | `n = 17590`; main part `3515.93`, doubled `7031.86 > 4034.62`; even `n` at `q=21` is `27` | sound |
| 35 | §5.1 squarefree count (new) | `2√y + 5/3` on real `1 ≤ y ≤ 10⁶`; tail at `T = 1, 1.5, √3` | max ratio `0.251` (`y=7`); `|Q−6y/π²|/√y ≤ 0.679` (Büthe's `0.68`); `0.645 ≤ 0.667`; `0.645 > 0.5`; `0.645 > 0.448` | conclusion sound; tail needs integer `T` → R02 |
| 36 | §5.1 `h̃(1/2)` chain (new) | `R`; `ζ` bounds; constant; `t = 16`; §5.4 margin | `R = 3.65995`; `ζ(3/2) ≤ 2.76777`, `ζ(3) ≥ 1.19955`; `R·(2.30733)³ = 44.958 ≤ 45` (true `h̃(1/2) ≈ 35.24`); `4.27459·45 = 192.36 ≤ 200`; `45 ≥ 42.67`; `(1.53 − 15/π²)√10⁹ = 321.99`; `90/π⁴ = 0.9239` | sound |

**Remarks on text outside this round's scope (no change requested).**
- The pull-request description still lists, among what this roadmap builds, Kusmin–Landau, Arias
  de Reyna's second-derivative test and Patel's tests. It still says "21 headline theorems" (the
  file states 19) and names ProbabilisticAndMetricNumberTheory as a consumer. It is not folder
  content.

## Not verifiable

- In the text of pomerance2011 that we hold, overbars are lost (its display (7) at line 236 reads
  `χ(m)τ(χ)`). Whether display (7) and `C_n` carry `χ̄(m)` in print could not be read. R01 rests
  on this README's own §3.1 and on a direct computation, not on the source.
- The Bober–Goldmakher data is not in the manifest. The previous review recomputed it: 123
  characters for `q ≤ 25`, and 226 for Pomerance's small range.
- vanlintrichert1965 (5.1) is waived. CDEM07 Theorem 3 (behind buthe2014's `0.68√z`) is not
  needed, because the route here replaces it.
- The previous review's list for untouched text stands unchanged: montgomeryvaughan2007,
  frolenkovsoundararajan2013, montgomeryvaughan1973, greaves2001, filaseta1990, bordelles2012,
  trevino2015kth, bachmanrachakonda2001, siebert1976 and rieselvaughan1983 are uncertified, and
  mcgown2012's published numbering was not checked.

## Source issues

- **Misprint** in buthe2014 at the proof of Lemma 4.4, p. 6: the source says the squarefree bound comes from a short "computar" calculation; it should be "computer"; affects nothing.
