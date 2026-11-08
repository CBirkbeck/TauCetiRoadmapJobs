# Review of ExplicitCharacterSumsAndSieves (pull request #1948 at 5aa1cf5)

**Verdict:** needs changes

Scope: `TauCetiRoadmap/ExplicitCharacterSumsAndSieves/README.md` (1835 lines) and
`TauCetiRoadmap/ExplicitCharacterSumsAndSieves/Suggested.lean` (520 lines; 22 definitions, 19
theorems). I read both files in full. The pull request changes nothing outside the folder, and the
gate passes every check at this head (I re-ran it). Dependency check, as run:

    depcheck: 244 roadmaps, 2465 edges, 0 problem(s)

The suppliers are at ORDER lines 90, 96, 154, 269, 270 and 271. This roadmap is at line 272.

## The previous review's findings at this head

- **R01 (§0.3 and Patel's tests owned twice): repaired.** README lines 55–64 now say "this
  roadmap consumes §4.2 and restates none of them. Kept here: Arias de Reyna's real-part form of
  the normalised inequality (§0.3) … and Arias de Reyna's iterated inequality (§1.1)".
  - §§1.1–1.2 and the three Patel theorems are gone.
  - §0.3 keeps only Lemma 6, with the clause saying how it differs (lines 442–445).
  - The ProbabilisticAndMetricNumberTheory clause and its Downstream entry are gone.
  - Outside this folder: the supplier's README still uses the old numbering (see Verified sound).
- **R02 (diagonal bound owned twice): repaired.**
  - Lines 86–98 and 344–363 cite ExplicitPrimeCounting §0.1 for the kernel bound, Büthe's
    asymptotic, `MVDiagonalFiniteRange`, the squarefree step and the `L₁`/`L_k` comparison.
  - The old §6.2 target is deleted. Lines 192–199 explain why the Lean file restates the input
    (lines 478–483 there).
  - The `brun_titchmarsh` contract carries both finite-range hypotheses (lines 359–363).
  - §5.5 says in one clause how its sieve differs (lines 1410–1412).
- **R03 (sweep Checks): repaired.**
  - The four sweeps are deleted.
  - The `h = 1` Check replaces the old line-1131 sweep (lines 1034–1036).
  - The 6.2 grid is replaced by the concavity argument (lines 1577–1583), recomputed in row 27.

The renumbering (Layer 1 §1.3 → §1.1; Layer 6 items 6.3–6.8 → 6.2–6.7) leaves the ids that
consumers cite intact. ExplicitNumberFields cites §§3.5, 4.1 and 6.1 (its lines 122, 527–546 and
2920), and ExplicitMultiplicativeFunctions cites §5.1. All resolve.

## R01 (P2) — Pomerance's inequality is stated without the small-modulus computation its proof uses

Location:
- `README.md` lines 831–842: "Prove `polya_vinogradov_pomerance`: for `χ` primitive modulo `q > 1`
  and every interval sum, …". The route that follows covers no small `q`.
- `Suggested.lean` lines 147–157: no hypothesis.
- The module docstring (lines 10–12) says "Every finite verification a theorem rests on is a
  hypothesis".

Claim: the Landau–Bateman argument proves the bound for every primitive `χ` modulo `q > 1`.

Witness: pomerance2011 lines 356–360 derive the even bound only for `q ≥ 21`. Smaller even
conductors rest on Bober–Goldmakher's computations. Lines 431–437 derive the odd bound only for
`q ≥ 45`, and smaller odd moduli rest on the same data.

Why it matters:
- The Conventions (lines 192–193) send every finite verification to a named hypothesis.
- Lapkova's lemma, which rests on the same data for `q ≤ 25`, does carry one
  (`LapkovaSmallModuliVerified`).
- As written, the cases `q < 21` (even) and `q < 45` (odd) are owned by nothing.
- §3.2 cannot fill the gap: at odd `q = 11` the classical bound is `5.587`, above Pomerance's odd
  bound `5.506`.

Repair:
- Add `(hsmall : LapkovaSmallModuliVerified)` to `polya_vinogradov_pomerance` and move the
  theorem after `polya_vinogradov_lapkova` in `Suggested.lean`. In §3.4 write "under
  `LapkovaSmallModuliVerified`".
- Complete the route:
  - even `χ` with `q ≥ 21` and odd `χ` with `q ≥ 45`: the Landau–Bateman argument;
  - even `χ` with `q ≤ 20` and odd `χ` with `q ≤ 10`: §3.2, whose bound is below Pomerance's
    there;
  - odd `χ` with `7 ≤ q ≤ 44`: §3.5, because Lapkova's odd bound is below Pomerance's odd bound
    for every `q ≥ 7`.
- Add §3.2, §3.5 and Layer 6 `LapkovaSmallModuliVerified` to §3.4's *Needs:*. Add §3.4 to the
  consumers listed in Layer 6's Dependencies (line 1736).
- Alternative: a Layer 6 proposition for Bober–Goldmakher's check of the odd primitive characters
  with `q ≤ 44` (pomerance2011 lines 432–437). Even `q ≤ 20` still follows from §3.2.

Tested:
- §3.2's bound is below the even bound for every `3 ≤ q ≤ 20` (at `q = 20`, `9.22 ≤ 11.41`).
- §3.2's bound is below the odd bound exactly for `q ≤ 10`.
- Lapkova's odd bound is below Pomerance's for `q ≥ 7`: `4.018 ≤ 4.026` at `q = 7` and
  `5.015 ≤ 5.506` at `q = 11`.
- For all 189 odd primitive characters with `q ≤ 44` and all 37 even ones with `q ≤ 20`, `M_χ` is
  at most `0.560` times Pomerance's bound. So the repaired statement holds, with no new data.

## R02 (P3) — §5.1: the coprime comparison is cited at the wrong lines of buthe2014

Location: `README.md` lines 1255–1256: "`S_k(z) ≥ (φ(k)/k) S(z)` (vanlintrichert1965, the
inequality used in buthe2014 lines 226–236)".

Claim: buthe2014 uses the comparison at lines 226–236.

Witness: lines 226–236 give the minimising weights and van Lint–Richert's evaluations
`1/S_k(z)` and `Σ|λ_n| = H_k(z)/S_k(z)`. The comparison is used at display (4.3), line 345, where
`Y/(k₁S_{k₁}(z))` becomes `Y/(φ(k)S₁(z))`.

Repair: write "(vanlintrichert1965; used in buthe2014 display (4.3), lines 340–345)". §5.3's
citation of lines 226–236 for `Σ|λ_n| = H_k/S_k` is correct and stays.

## R03 (P3) — §5.5: the negative control says the unweighted sieve fails for every `t > 23`; it does not

Location: `README.md` lines 1470–1472: "With `S(Q) ≥ log Q + 1.07` and `Q² = εt`, the unweighted
form needs `εL − log ε ≤ 2.14` … and the left side is at least `1 + log L`, which exceeds `2.14` for
every `t > 23`."

Claim: the forbidden-residue sieve never reaches `2t/log t` once `t > 23`.

Witness:
- At `t = 24`, `Q = 2`: `(24 + 4)/S(2) + π(2) = 14 + 1 = 15.0 < 48/log 24 = 15.10`.
- Before adding `π(Q)`, at `t = 100`, `Q = 6`: `136/3.25 = 41.85 < 43.43`.
- In all, 486 values of `t` in `[24, 509]` behave this way.

The inference is reversed: `S(Q) ≥ log Q + 1.07` is a lower bound, so the displayed condition is
sufficient for the sieve to fail, not necessary.

Repair: delete the last sentence of the bullet and keep its computed instance: at `t = 1000` the
unweighted sieve gives `301.77` (at `Q = 15`), the weighted sieve `269.53`, and `2t/log t` is
`289.53`. If a remark on the range is wanted, state only what was computed: before adding `π(Q)`,
the unweighted form reaches `2t/log t` at 486 values of `t ≤ 509` and at none in `[510, 3000]`.
Tested: all three values and the scan were recomputed.

## R04 (P3) — slips

- §5.1 *Needs:* (line 1278) omits the inputs of the weight-mass route, which lines 1259–1261
  describe as "explicit Euler products with `ζ(2)` and `ζ(4)`". Add Mathlib `hasSum_zeta_two` and
  `hasSum_zeta_four` (`Mathlib/NumberTheory/ZetaValues.lean`, lines 453 and 458). The constant is
  `15/π² = ζ(2)/ζ(4)`.
- References, line 1793: "**hunter2016** — K. Hunter". The thesis is by Morgan Hunter
  (hunter2016 line 8; an honours thesis, ANU, 2016). Write "M. Hunter".

## Verified sound

**Lean.**
- `lake env lean` on `Suggested.lean`: 19 warnings, all `declaration uses sorry`, nothing else.
- The file has no `variable` block. I compared the 41 elaborated types of the worker's `#check`
  listing with the README statements and found no difference. Two examples:
  - `burgess_moment_bound`: its second term elaborates as `(2 * ↑r − 1)` over ℝ;
  - McGown's (A.2): `2 / d ^ (1 − 1/r)` equals the certificate's `2 · 11^{−(1 − 1/r)}` at `d = 11`.
- One-tactic probe on a scratch copy (`simp`, `rfl`, `norm_num`, `positivity`, `intro; simp`,
  `infer_instance`, `simp_all`, `trivial`): none of the 19 theorems closes.
- Every definition is used by a theorem.
- Single `import Mathlib`, no `set_option`, no sorry'd data, `theorem` only, no fully qualified
  name of another roadmap's declaration.
- Every headline of the README's end-theorem list (lines 25–37) is stated. That is all 19
  theorems: 1 in Layer 1, 2 in Layer 2, 4 in Layer 3, 7 in Layer 4 and 5 in Layer 5.

**Adversarial table.** Every value below was computed by hand or with a scratch script.

| # | Statement | Instances | Values (left / right) | Result |
|---|---|---|---|---|
| 1 | `intervalExpSum` §0.1 | `f≡0` on `[0,2]`, `[0.2,0.8]`; `x/2` on `[0,3]`, `[0,2]` | `3`; `0`; `0`; `1` | sound |
| 2 | `nearIntegerCount` §0.2 | `x/3`, `a=0,N=6,δ=0.1`; `a=N=1`, `δ=1/3`; `N=0` at `a=3`, `2.5` | `3`; `n=1` not counted; `1`, `0` | sound |
| 3 | §0.3 real-part form | `b=(1,1,1)`, `H=2`; `b=(1,−1)`, `Y=H=2`; `Y=1.01`, `H=1`; 20 000 random `(X,Y,H,b)` | `1 ≤ 2.67` (`|C|` form `3.33`); `0 ≤ 1.5` (finite `0.375`); `3.92 ≤ 4`; max ratio `0.788` | sound |
| 4 | §0.4 `M_χ` | quadratic mod 3, mod 5; principal mod 3 | `1`; `2`; `S(0,6)=4 > M_χ=2` | sound; `χ≠1` needed |
| 5 | §0.5 even symmetry | quadratic mod 5; `χ₄`; principal mod 5 | initial `1,0,−1,0`, `M=2=2·1`; `M=1<2`; `4−N = φ(5)−N` | sound |
| 6 | §0.6 reduction | principal mod 6; mod 12 from `χ₄` | `2 = 6−3−2+1`; `2 = 1+1` (`0` without `χ*(d)`) | sound |
| 7 | `iterated_vanDerCorput` | `4/H+4T ≤ max(B²/H,BT)` at `H=1,T=6`; `d=1,H=Y=2,f≡0`; `d=2`, `f=√2x²/7`, `X=0.3,Y=40,H=(4,6)`; `d=3`, `x³/1000`, `Y=60,H=(5,6,7)` | `28 ≤ 28.97` (`B=4.5`: `28>27`); `1 ≤ 3.414` (`T=1/4`); `0.062 ≤ 3.085`; `0.143 ≤ 3.786` | sound; `(B²−4)(B−4)≥16 ⇔ B²−4B−4≥0` |
| 8 | §2.1 Fejér reduction | `(sin(π/4)/(π/4))²`; `f≡0` and `x/2`, `N=4,δ=0.1,H=2` | `0.8106>0.81`; `5 ≤ 28`; `3 ≤ 20` | sound |
| 9 | `first_derivative_test_points` | `x/10,N=20,δ=0.05`; `f=x,N=10,δ=0.01`; product step | `3 ≤ 10`; `11 ≤ 21.42`; `4δ²/λ ≤ 2cNδ`, `2δ ≤ cλN` checked | sound |
| 10 | `second_derivative_test_points` | `x²/100,c=1,N=50,δ=0.01`; reduction `x/2,A=2` | `6 ≤ 227.4`; `3 ≤ 6` | sound |
| 11 | `polya_vinogradov_classical` | `q=3`; `q=5`; `√p log p` at `p=3`, `p=2` | `4/3` (closed `1.579`) vs `1`; `2.462` vs `2`; `0.911 ≤ 1.099`; `0.726 > 0.693` (no nonprincipal χ) | sound |
| 12 | §3.3 Lemmas 2–4 | `C₃(π)`; alternative route `n=2`; Lemma 3 at `n=1,x=π/2` | `−5/6 > −1.36`; endpoints `−0.640`, `−0.667 > −1`; `1 < 2.72` | sound; unimodality of `−log(2s)−1/((n+1)s)` rederived |
| 13 | `polya_vinogradov_pomerance` | `q=3` odd; `q=5` even; `q=11` odd; all primitive χ with `q≤44` (odd), `q≤20` (even) | `2.087≥1`; `4.515≥2`; §3.2 gives `5.587 > 5.506`; max `M_χ`/bound `0.560`, `0.462` | true; route incomplete → R01 |
| 14 | `polya_vinogradov_lapkova`, §6.1 | all primitive χ, `2≤q≤25`; rounded forms; `L` at `q=18,19,23,24` | 123 characters, max `M/b=0.680` (`q=23`: `5 ≤ 7.356`); `31.305 ≤ 31.305` (`q=979` fails), `5.742 ≤ 5.745` (`q=32`: `5.669>5.657`); `19>18`, `19≤19`, `24>23`, `24≤24` | sound; hypothesis true |
| 15 | `A(q₀)` §3.5 | `q₀=10⁶`; printed form; `q₀=1200` | `0.21861`, `A√q log q = 3020.2` = odd bound; `0.16005 → 2211.2`; `0.27905` | sound |
| 16 | `polya_vinogradov_frolenkov_soundararajan` | `q=1000`; mod 2310 from χ₃; mod 4620 from χ₄; crude §0.6 | `123.5 < 200`; `M=5 ≤ 196.75`; `M=8 ≤ 288.86`; `4·(2/π²)/√6 = 0.331 > 0.2251` | sound (primary not verifiable) |
| 17 | `burgess_moment_bound`, degenerate tuples | brute-force 3-degenerate counts; `r=2,H=2`; Jensen factor; `r=6,H=100`; moment bound for `p∈{7,11,13}`, `r≤3`, 7 values of `B` | `r=3`: `1,22,99 = 6H³−8H²+3H`; `r=4`: `1,86` = formula; `d=2:8`, `d=3:6`, `d=4:6`; `1.46216`, `r=5`: `802.1≤945`, `r=4`: `109.7>105`; `1.0672e16 > 1.0395e16 > 9.3976e15`; no violation | sound |
| 18 | §4.1 `r=2` refinements | `p=7` quadratic, cubic, `h=2`; `p=19` quartic; all `h<p` for 10 primes ≤ 43 (order 2) and 8 `(p,d)` (order >2); `h=1` | `34 ≤ 98.33`; `22 ≤ 121.37`; `Σ = −9`, `9 > 8.718`; no violation; `p−1 < p` | sound |
| 19 | §4.2 energy counts | `{2,3,5}, N=100, p=1009`; Lemma 1 at `A=28,N=400,p=10⁷` | `V₂ = 300+2·73 = 446 ≤ 452.67`; `88 447` vs trivial `313 600` | sound |
| 20 | §4.3 amplification | `A=B=1`, `r=1`; Hölder exponents | `√(N(p−1)) + 2E(1)`; `1−1/r+1/(2r)+1/(2r) = 1` | sound |
| 21 | `burgess_mcgown_parametric/table`, §6.5 | `C₀(r)`, `2≤r≤15`; (A.1) | `10.036550<10.0366`, `4.953819<4.9539`, `r=8`: `2.272099<2.2721` (margin `7.5e−7`); `1093.2≥1056` (`r=2`), `166 281≥7920` (`r=15`); all 14 rows hold | true |
| 22 | `TrevinoTable1Certificate`, `burgess_trevino_table1/uniform` | 27 rows, `p ∈ [p₀, p₀·10²⁰⁰]`, step `10^{1/8}` | no failure; max `num/(c·den) = 0.999995` (`e=7,r=10`); `2.738070` (`A=40.27`), `2.019615`, `2.517227`, `1.256098` at `p₀`; `r=2` bracket derivative numerator `−5.03` | true; formulas match (46), (47) |
| 23 | `TrevinoTable3Certificate`, `table3`, `table3_unrestricted` | 27 rows, same grid; `r=10,e=10` growth | no failure; max `0.999995` (`e=20,r=7`); `3.652847`, `1.579302`, `1.521507`; bracket `4.7426 → 4.8535` at `10^{23.3}`, value `1.57930 → 1.51542` | true; formulas match (58), (59) |
| 24 | `selbergDiagonal`, §5.1 | `S(6)`; `[3,5)`; `S₆(7)`; `H₁(1..3)`; `z=65` | `3.25≥2.862`; `2.5 ≥ 2.4974` (margin → `0.00056`); `1.4167 ≥ 1.1389`; `1, 4, 6`; `S=5.4714`, `H₁=99.386` | sound; locator → R02 |
| 25 | `greaves_density_sum` | `κ≡1, z=3, B=0.31546, s=2`; `s=2B` | `2 ≥ 0.749`; factor `0` | sound; Rankin chain rederived with sum over `d∣P(z)` |
| 26 | `butheRho`, `buthe_weighted_brun_titchmarsh` | tent; `f≡1` on `[0,10]`, `[1.9,5.1]`; `f≡0` | `ρ=y/6`; `4<8.686`; `3<5.502`; `ρ=0`, hypothesis false | sound |
| 27 | `buthe_weighted_prime_sum`, §§6.2–6.3 | small range on a `0.25` grid; `z=2` on `(1,e²]`; `Y=20000`; `z=√Y/2` at `Y=10⁵…1.6·10¹³` | no failure, least margin `0.455` (`Y=18`); margin `≥ 0.695`; `z=65`: `4003.29 < 4038.98`, `z=40`: `4154.91`, `z=100`: `4072.95`, witnesses `57…84`; margins `0.54–1.33%` | true |
| 28 | weighted arithmetic large sieve §5.5 | odd integers of `(0,10]`, `Q=2` | `1/L = 7.172 ≥ 5` | sound |
| 29 | sifted form §5.5 | `z=3`, `z=5` ranges; `(1,e²)`; `t≥1000` closed form (steps of `S` below 6, `S ≥ log u+1.07`, `π(Q)≤Q/3+2`, `Q=√(2N/3)`) | `110.33≤110.38` at `t=318`, `110.67>110.66` at `319`; `22.467≤22.474`, `401.93≤401.94`; margin `0.0873` at `3.55`; least margin `1.99` at `t=1000` over all integers to 60 000, `0.69 t/log²t` at `10¹²`; without the steps last failure `12 069` | sound |
| 30 | §5.5 negative control | `t=1000`; `t=24`; `t=100` | `301.77 > 289.53`; `15.0 < 15.10`; `41.85 < 43.43` (before `π(Q)`) | false Check → R03 |
| 31 | `ramare_viswanadham_prime_powers` | `d=1,A=B=10`; `d=3,a=1,A=B=30`; `A=1,B=7`; Lemma 15 at `M=121` | `4.25 ≤ 8.686`; `3.5 ≤ 13.03`; `4.833 ≤ 7.195`; `3.434 ≤ 3.5` | sound |
| 32 | `fan_rough_count`, §6.4 | `x=7, z=4.999`; `x=8` on `[3,5),[5,7),[7,8]`; integer cells to `x=20 000`; `x=9,z=3`; `x=32,z=4` | `Φ=3 > 2.99835` (threshold `log z=(7+√7)/6`); `3.426>3`, `3.055>2`, `2.922>1`; no failure with `x≥8`; `3<4.46`; `11<15.39` | true with `x≥8` |

**Sources: the seeded sample, all 15 targets.**
- 0.4: Pomerance's `S(χ)` (pomerance2011 lines 17–20) and Lapkova's `M_χ` (lapkova2018 line 254)
  are the closed-interval maxima, equal to `M_χ` for `χ ≠ 1`.
- 0.5: pomerance2011 lines 89–95, tmeemt-art15 lines 126–129, frolenkov2011 lines 22–27. The
  README's generalisation from primitive `χ` to nonprincipal `χ` was rederived.
- 0.6: montgomeryvaughan2007 is uncertified; the identity was rederived (row 6).
- 1.1: ariasdereyna2024 Theorem 7 at lines 398–404, `B` at lines 384–391, the `d = 1` step at lines
  405–415. Lemma 6 (§0.3) is at lines 224–227.
- 3.3: pomerance2011 line 180, Lemma 2 at lines 112–134, Lemma 3 at lines 147–161, Lemma 4 at
  lines 172–204.
- 3.4: Theorem 1 at lines 78–86, proof at lines 263–438. The small-modulus data at lines 357–360
  and 432–437 give R01.
- 3.5: lapkova2018 Lemma 3A at lines 245–282. The parameter `L` and the split at `q = 25` come
  from the proof. Also tmeemt-art15 lines 114–118, hunter2016 lines 680–684 and
  kerrmcgowntrudgian2020 lines 121–122.
- 3.6: tmeemt-art15 lines 106–109 and hunter2016 lines 646–664 (see Not verifiable).
- 4.2: trevino2015 Lemma 1 at lines 210–219 (proof to line 622), Lemma 5 at lines 419–423, Lemma 6
  at lines 1088–1093; mcgown2012 Lemmas A.6–A.7 at lines 1119–1142.
- 4.3: trevino2015 displays (26)–(29) at lines 643–700; mcgown2012 Lemma A.5 at lines 1083–1118.
- 5.1: buthe2014 Lemma 4.4 at lines 365–367 (proof to line 461); fan2022 lines 185–187. The
  coprime comparison is at line 345, not lines 226–236 (R02).
- 5.5: platttrudgian2018 Theorem 2 at lines 131–139; ramareviswanadham2021 Lemma 14 at lines
  650–666 (with `≤` and `A ≥ B`) and Lemma 15 at lines 667–679; tmeemt-art14 lines 97–111.
- 6.1: lapkova2018 proof, from line 282: `L = [π²√q/4 + 9.15]` or `[π√q + 9.15]`, `q > 25`
  analytic, the Goldmakher data sheet for `q ≤ 25`.
- 6.4: fan2022 Theorem at lines 157–163, verifications at lines 215–222, 290–292 and 449–462.
- 6.6: trevino2015 Table 5 at lines 1013–1024, (46) at lines 889–903, (47) at lines 905–941,
  Table 4 at lines 996–1007, (33) at lines 731–735.
- Also checked: Tables 1, 2, 3 and 7 (lines 97–107, 120–128, 145–155, 1311–1322) entry by entry
  against `trevinoTable1`, `mcgownConstant`, `trevinoTable3` and `trevinoTable7`. Theorem A.9
  (mcgown2012 lines 1209–1233) matches `burgess_mcgown_parametric` hypothesis by hypothesis.

**Library declarations opened at the pins (56).**

Mathlib at `1b1ccf4` (45):
- `Real.fourierChar` and `fourierChar_apply` (Circle.lean 221, 232); `UnitAddCircle.norm_eq`
  (AddCircle.lean 223).
- `gaussSum` (GaussSum.lean 72); `gaussSum_mulShift_of_isPrimitive` (DirichletCharacter/GaussSum.lean
  59; no primitivity on `e`); `ZMod.stdAddChar` and `isPrimitive_stdAddChar` (83, 95).
- `DirichletCharacter.conductor`, `IsPrimitive`, `eq_one_iff_conductor_eq_one`,
  `primitiveCharacter`, `changeLevel_primitiveCharacter`, `primitiveCharacter_isPrimitive`,
  `IsPrimitive.inv`, `Odd`, `Even`, `even_or_odd`, `Odd.eval_neg` and `Even.eval_neg` (Basic.lean
  233, 291, 267, 306, 309, 313, 413, 537, 540, 542, 567, 572); `norm_le_one` (Bounds.lean 44).
- `BoundingSieve`, `SelbergSieve`, `siftedSum_le_mainSum_errSum_of_upperMoebius` and
  `upperMoebius_lambdaSquared` (SelbergSieve.lean 54, 78, 217, 251).
- `quadraticChar` and `quadraticChar_ne_one` (120, 207).
- `eulerMascheroniSeq` (`harmonic n − log(n+1)`, line 50) and
  `eulerMascheroniSeq_lt_eulerMascheroniConstant` (159); `Real.log_le_sub_one_of_pos` (307);
  `Complex.re_le_norm` (Norm.lean 45).
- `exists_deriv_eq_slope` (155); `AbsolutelyContinuousOnInterval` (155) and
  `.integral_deriv_eq_sub` (227).
- `Finset.sum_mul_sq_le_sq_mul_sq` (171); `Real.inner_le_Lp_mul_Lq_of_nonneg` (954);
  `ConvexOn.map_integral_le` (196).
- `Complex.hasSum_taylorSeries_neg_log` (280); `tendsto_tsum_powerSeries_nhdsWithin_stolzSet`
  (162); `hasSum_fourier_series_of_summable` (493); `strictConcaveOn_sin_Icc` (164).
- `Real.sin_le` (56), `Real.mul_le_sin` (84) and `ZMod.unitOfCoprime` (794).
- For R04: `hasSum_zeta_two` and `hasSum_zeta_four` (ZetaValues.lean 453, 458).

Tau Ceti at `2fd255d` (11):
- `gaussSum_mul_gaussSum_inv_eq_card_of_isPrimitive` and `IsPrimitive.norm_gaussSum`
  (GaussSum.lean 43, 82); the latter needs `e.IsPrimitive`, which `isPrimitive_stdAddChar`
  supplies.
- `IsPrimitive.eq_one_iff` (Conductor.lean 25); `even_of_le_two` (Even.lean 77).
- `sum_range_level_eq_zero`, `sum_range_eq_sum_range_mod` and `norm_sum_Icc_le_level`
  (PartialSum.lean 30, 37, 49).
- `WeierstrassCurve.hasse_bound` and `frobeniusTrace_sq_le_four_mul_card` (HasseBound.lean 57,
  44); `pointCount` and `frobeniusTrace_eq_card_point` (PointCount.lean 73, 115).

**Cross-roadmap citations resolved at their heads (24).**
- ExplicitZetaBounds (ORDER 270):
  - §4.2 (its line 1094): the finite inequality and the normalised form, with exactly the
    hypotheses of the contract (`Y ≥ 1`, `1 ≤ H ≤ Y`, `|b_n| ≤ 1`);
  - §6.5 (its line 1808): `c = 3/2`, at least two points;
  - §§4.1, 4.3, 4.4 and 4.5 as listed in Scope.
- ExplicitPrimeCounting (ORDER 271): §0.1 (its lines 477–614). It states the kernel identity,
  Büthe's asymptotic with `≥ log u + 1.32`, `MVDiagonalFiniteRange`, the `ω(p) = 1` squarefree
  step, the `L₁`/`L_k` comparison and `brun_titchmarsh` under both hypotheses. Its
  `Suggested.lean` lines 112–115 define the same proposition as the restatement here, in its own
  namespace.
- AnalyticNumberTheoryPartI (via `roadmaps show`): §0.5 (`RosserSchoenfeldFiniteRangeInput` on
  `59 ≤ x < exp 10000`), §0.8, §0.19 (`x ≥ 286`), §0.20 (`x ≥ y ≥ 319`), §0.34 and §1.5a.
- SieveMethodsAndPrimePatterns: §1.1 (its line 991), §1.3 (1172: strict cutoff,
  `λ(1)=1`, `|λ|≤1`, main term `1/G`), §1.6 (1462), §2.9 (2316: forbidden residues,
  `(H − 1 + Q²)`) and §5.2 (3333).
- CharacterSumsOverFiniteFields: §4.7, `weil_mulChar_sum_bound` (its `Suggested.lean` line 320:
  roots counted in `AlgebraicClosure F`, hypothesis `¬∃ c h, f = C c * h ^ orderOf χ`), and §7.1.
- EllipticLegendreCharacterInterfaces §5.1 (its line 592).
- ProbabilisticAndMetricNumberTheory §2.7 (its line 3086).
- ExplicitNumberFields' and ExplicitMultiplicativeFunctions' citations of this roadmap: see above.

**Ownership.** I searched main and the open heads by object (`roadmaps grep` for Pólya–Vinogradov,
Burgess, Kusmin, near-integer counts, Brun–Titchmarsh and Selberg diagonal sums). Apart from what
Scope already cites, no second owner exists:
- ExplicitZetaBounds writes `S_f(a, N)` as notation and declares no exponential-sum carrier.
- SieveMethodsAndPrimePatterns §2.9 proves the general one-prime-to-squarefree step only inside a
  proof, so the general-`ω` weighted sieve of §5.5 is a stated variant.

**Notes outside this folder (no change requested here).**
- ExplicitZetaBounds, at its head, lines 83–87 and 2562–2566, still says that this roadmap takes
  Kusmin–Landau and the second to fifth derivative tests "(its §§1.1–1.5)" and owns the iterated
  inequality "(its §1.6)" resting on 4.2 and 4.3. At this head §1.1 is the iterated inequality,
  there is no §§1.2–1.6, and only 4.2 is consumed. That text should be aligned in the
  ExplicitZetaBounds pull request.
- ExplicitMultiplicativeFunctions takes Büthe's asymptotic from §5.1, which now quotes it from
  ExplicitPrimeCounting §0.1. The pointer still resolves (lines 1250–1253).
- The pull-request description is stale. It still lists among what this roadmap builds:
  Kusmin–Landau, Arias de Reyna's second-derivative test, Patel's tests and "21 headline
  theorems", and it names ProbabilisticAndMetricNumberTheory as a consumer.

## Not verifiable

- montgomeryvaughan2007 §9.4 (0.6, 3.1, 3.2) is uncertified. The identities were rederived and
  computed (rows 6, 11).
- frolenkovsoundararajan2013 Theorems 1 and 2 and Corollary 1 (3.5, 3.6) are uncertified. For 3.6
  the two quoting texts differ:
  - tmeemt-art15 lines 106–109: intervals, `q ≥ 1000`;
  - hunter2016 lines 651–664: initial sums, `q > 100`, strict.

  The README follows the former. The interval form cannot be checked against the primary text.
- montgomeryvaughan1973 Corollary 1, Theorem 2, Lemmas 7 and 10 and display (3.3) (5.5) are
  uncertified. The route was rederived and computed (rows 28–29).
- greaves2001 Theorem 1, p. 52 (5.2) is uncertified. Rankin's argument was rederived (row 25).
- Also uncertified, with routes rederived where they are used:
  - filaseta1990 (2.1);
  - bordelles2012 (2.2, 2.3, Part II);
  - trevino2015kth Theorem 1.2 (4.1; the count was brute-forced, row 17);
  - bachmanrachakonda2001, siebert1976 and rieselvaughan1983 (Part II).
- vanlintrichert1965 (5.1, 5.4) is waived.
- The Bober–Goldmakher data that pomerance2011 and lapkova2018 use is not in the manifest. I
  recomputed it instead: 123 characters for `q ≤ 25`, and 226 characters for Pomerance's small
  range.
- The README cites mcgown2012's appendix by its arXiv numbering (v2). trevino2015 lines 113–128
  quote the published Theorem A.1 with the same table, but the published Theorem A.9 numbering was
  not checked.

## Source issues

- **Error** in fan2022 at the Theorem, inequality (5), p. 4: the source says (5) holds whenever `max(3, √x) ≤ z ≤ x`; at `x = 7`, `z = 4.999` the count is `3` against `2.998`, so it should require `x ≥ 7.0043` (`x ≥ 8` suffices); affects a stated result.
- **Gap** in fan2022 at the proof of (5), p. 6: the source says its check of integers `9 ≤ n < 289` gives (5) for all `3 ≤ x < 289`; the range `3 ≤ x < 9` is not checked, and (5) fails at `x = 7`; affects the proof.
- **Error** in kerrmcgowntrudgian2020 at Lemma 3, p. 3: the source says `A(q₀)` has middle term `0.8204/√q₀`; it should be `0.8204/log q₀`, the form that follows from Lapkova's Lemma 3A; affects a stated result.
- **Error** in mcgowntrudgian2020 at the proof of Proposition 1, p. 5: the source says for quadratic `χ` the factor `2r − 1` improves to `2(r − 1)`; it should be `2(r − 1)√p + 1`, since at `p = 19` a four-root sum equals `−9`; affects the proof.
- **Error** in tmeemt-art15 at the Treviño `c₂` table (section 2): the source prints columns `p₀ = 10⁷, 10¹⁰, 10²⁰` starting `3.7451, 3.5700, 3.5341`; it should be trevino2015 Table 3, `p₀ = 10¹⁰, 10¹⁵, 10²⁰`: `3.6529, 3.5851, 3.5751`; affects nothing.
- **Misprint** in tmeemt-art14 at the definition of `π(z; k, ℓ)` (section 1): the source says primes "coprime to ℓ modulo k"; it should be "congruent to ℓ modulo k"; affects nothing.
- **Misprint** in tmeemt-art14 at the quotations of Ramaré–Viswanadham Lemmas 14 and 15 (section 1): the source writes strict inequalities; the lemmas state `≤` (ramareviswanadham2021 lines 656 and 670); affects nothing.
- **Misprint** in tmeemt-art14 at Greaves's density estimate (section 2): the source labels the theorem "(2022)"; it should be 2001, the book's year; affects nothing.
