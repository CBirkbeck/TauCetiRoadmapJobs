# Review of ExplicitCharacterSumsAndSieves (pull request #1948 at 7dbb08f)

**Verdict:** accepted

This is an incremental re-review of the 21 lines changed since `cb8a520`. All of them are in
`TauCetiRoadmap/ExplicitCharacterSumsAndSieves/README.md`, now 1903 lines: §3.4's odd-case sketch,
one new §3.4 Check, §5.1's squarefree-count step and one new §5.1 Check.
`TauCetiRoadmap/ExplicitCharacterSumsAndSieves/Suggested.lean` and `metadata.toml` are
byte-identical to `cb8a520`. The pull request changes nothing outside the folder.

Both previous findings are repaired. The repairs introduce no new problem. This report has no
findings.

## Previous findings

- R01 — repaired: "The main part is `(iτ(χ)/π) Σ_{m ≤ n} χ⁻¹(m)(cos mα − cos mβ)/m` with `α = 2πN/q`, `β = 2πM/q` (by §3.1 applied to `χ⁻¹`, `Σ_a χ(a) e(am/q) = χ⁻¹(m) τ(χ)`)" (README line 850). There is also a new Check at lines 875–880.
- R02 — repaired: "Let `y ≥ 1` and `T = ⌊√y⌋ ≥ 1`. … `Σ_{e > T} e^{−2} ≤ 1/(T + 1/2)` for integers `T ≥ 0` (compare `e^{−2}` with `(e − 1/2)^{−1} − (e + 1/2)^{−1}`)" (README lines 1298–1302). There is also a new Check at lines 1334–1337.

## Verified sound

**The R01 repair (§3.4, odd main part).** I recomputed it with a scratch script.
- §3.1 applied to `χ⁻¹`:
  - `Σ_a χ(a) e(am/5) = χ⁻¹(m) τ(χ)` holds for every `m mod 5`. Take the quartic character with
    `χ(2) = i`. At `m = 2` both sides are `1.9021 + 1.1756i`.
  - The form `χ(m) τ(χ)` gives `−1.9021 − 1.1756i` there.
- The parenthetical cites the identity in §3.1's own convention, `χ(n) τ(χ⁻¹) = Σ_b χ⁻¹(b) e(bn/q)`,
  at line 720. It applies because `χ⁻¹` is primitive (`DirichletCharacter.IsPrimitive.inv`, already
  on §3.1's *Needs:*).
- The new Check, at `[M, N] = [1, 3]`:
  - `τ(χ) = −1.17557 + 1.90211i`. This is §3.1's Check value, and `τ(χ)τ(χ⁻¹) = −5`.
  - At `n = 2`: direct expansion `0.46774 + 0.75683i`, the `χ⁻¹(m)` formula
    `0.46774 + 0.75683i`, the `χ(m)` formula `0.88611 + 0.07990i`. All three match the README to
    four places.
  - At `n = 3, 4, 10` the direct value and the `χ⁻¹` form also agree: `0.6072 + 0.5312i`,
    `0.4380 + 0.4266i`, `0.4681 + 0.4619i`. The `χ` form does not: `0.7467 + 0.3055i`,
    `0.5774 + 0.2010i`, `0.6225 + 0.2121i`.
- The direct expansion is the right one:
  - Its `n → ∞` limit, at `n = 20000`, is `0.49998 + 0.49998i`. This is
    `χ(1)/2 + χ(2) + χ(3)/2 = 0.5 + 0.5i`, the half-endpoint convention of pomerance2011 line 368.
  - Its coefficients `a_m`, `b_m` are those of pomerance2011 display (6), lines 225–227, with the
    sign of `b_m` as printed.
- The sign and the factor are right: the odd part gives `Σ_a χ(a) sin(2πam/q) = −i χ⁻¹(m) τ(χ)`,
  and with `b_m` this gives `+iτ(χ)/π`. The next step bounds `|χ⁻¹(m)| ≤ 1`, so nothing downstream
  changes.
- The cos-difference identity `cos A − cos B = −2 sin((A+B)/2) sin((A−B)/2)` is unchanged and
  correct.

**The R02 repair (§5.1, squarefree count).** Each step of the new sketch was checked.
- The tail bound: `(e − 1/2)^{−1} − (e + 1/2)^{−1} = 1/(e² − 1/4) > e^{−2}`. This telescopes to
  `1/(T + 1/2)` from `e = T + 1`.
  - Over integers `0 ≤ T ≤ 2·10⁵`, the largest value of `(T + 1/2) Σ_{e>T} e^{−2}` is
    `0.99999999997 < 1`.
- The fractional parts: `|Σ_{e ≤ T} μ(e){y/e²}| < T`.
- The cut: `(T + 5/3) − (T + 1)²/(T + 1/2) = (T − 1)/(6(T + 1/2)) ≥ 0`, with equality at `T = 1`.
  So `≤` is right and needs `T ≥ 1`, which the sketch now assumes.
- The final step: `2T + 5/3 ≤ 2√y + 5/3 ≤ (11/3)√y` for `y ≥ 1`. The application inside
  `H₁(z) = Σ_{d ≤ z} c_d Q(z/d)` has `z/d ≥ 1`.
- The conclusion: on every integer `y ≤ 10⁶` and just below each integer, the largest value of
  `|Q(y) − 6y/π²| / (2√y + 5/3)` is `0.2507`, at `y = 7`.
- The new Check:
  - `π²/6 − 1 = 0.64493 ≤ 2/3`;
  - `1/(√3 + 1/2) = 0.44802 < 0.64493`;
  - `Q(7) = 6` (the squarefree numbers 1, 2, 3, 5, 6, 7);
  - `|6 − 42/π²| = 1.74451 ≤ 2√7 + 5/3 = 6.95817`.

  All match the README.

**Sources at the changed passages.** The seeded target 3.4 falls in the change.
- pomerance2011 (3.4):
  - the odd case is lines 362–438, as cited;
  - `C_n` is at line 384, and display (7) is at lines 236–240;
  - Cauchy–Schwarz and Lemma 2 are at lines 393–420;
  - `D_n` is at line 423, `n = ⌊(4/π)√q log q⌋` at line 424, and `q ≥ 45` at line 432.
- buthe2014 (5.1):
  - Lemma 4.4 is at lines 365–367, and the convolution proof at lines 368–447;
  - display (4.5) is at lines 408–418, and (4.6) with `0.68√z` at lines 419–425;
  - display (4.7) is at lines 429–441, and `h(1) = 5/2` at lines 442–447.

  The README's locators are exact.
- The other seeded targets (0.2, 0.3, 2.2, 3.1, 3.2, 3.3, 3.5, 4.1, 4.4, 5.2, 5.5, 6.1, 6.2, 6.3)
  are untouched by the diff. They stand as verified by the previous reviews.

**Gate, build and dependency check.**
- I re-ran the gate on this head:

      gate ExplicitCharacterSumsAndSieves: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

- The dependency check, as run:

      depcheck: 244 roadmaps, 2465 edges, 0 problem(s)

- Suppliers in ORDER.txt: AnalyticNumberTheoryPartI (line 90), EllipticLegendreCharacterInterfaces
  (96), CharacterSumsOverFiniteFields (154), ExplicitZetaBounds (270) and ExplicitPrimeCounting
  (271). This roadmap is at line 272.
- `lake env lean` on `Suggested.lean` gives 19 warnings, all `declaration uses sorry`, and nothing
  else. The only import is `import Mathlib`.
- `#check @…` of all 41 declarations, appended to a scratch copy, elaborates with no error.
  - `polya_vinogradov_pomerance` still elaborates as the README's §3.4 statement. It takes the
    hypothesis `LapkovaSmallModuliVerified`, and the even and odd bounds each come under
    `χ.Even →` and `χ.Odd →`.
  - `selbergWeightMass : ℝ → ℝ` is unchanged.
  - No Lean statement is touched by the diff, and the file has no `variable` block.
- The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.

**Cross-roadmap citations.**
- No roadmap cites §3.4 or `polya_vinogradov_pomerance`, by `roadmaps grep` over main and all open
  heads.
- ExplicitMultiplicativeFunctions takes `selbergDiagonal` and the coprime comparison from §5.1 (its
  lines 117, 120, 386, 2776, 2935, 2949 and 3359). The diff changes neither.
- `scratch/overlaps.md` reports that no other pull request changes this roadmap and that no cited
  id is dropped.
- `roadmaps resolve` finds no unresolved citation.

**Adversarial table.** Rows 33, 35, 37 and 38 were recomputed this round. The rows marked (r4) are
carried forward from the previous report at `cb8a520` for statements the diff leaves untouched;
their values are that report's.

| # | Statement | Instances | Values (left / right) | Result |
|---|---|---|---|---|
| 1 | `intervalExpSum` §0.1 (r4) | `f≡0` on `[0,2]`, `[0.2,0.8]`; `x/2` on `[0,3]`, `[0,2]` | `3`; `0`; `0`; `1` | sound |
| 2 | `nearIntegerCount` §0.2 (r4) | `x/3`, `a=0,N=6,δ=0.1`; `a=N=1`, `δ=1/3`; `N=0` | `3`; `n=1` not counted; `1`, `0` | sound |
| 3 | §0.3 real-part form (r4) | `b=(1,1,1)`, `H=2`; `b=(1,−1)`; `Y=1.01,H=1`; 20 000 random | `1 ≤ 2.67`; `0 ≤ 1.5`; `3.92 ≤ 4`; max ratio `0.788` | sound |
| 4 | §0.4 `M_χ` (r4) | quadratic mod 3, mod 5; principal mod 3 | `1`; `2`; `S(0,6)=4 > M_χ=2` | sound |
| 5 | §0.5 even symmetry (r4) | quadratic mod 5; `χ₄`; principal mod 5 | `M=2=2·1`; `M=1<2`; `4−N` | sound |
| 6 | §0.6 reduction (r4) | principal mod 6; mod 12 from `χ₄` | `2 = 6−3−2+1`; `2 = 1+1` | sound |
| 7 | `iterated_vanDerCorput` (r4) | `H=1,T=6`; `d=1,H=Y=2,f≡0`; `d=2,3` instances | `28 ≤ 28.97`; `1 ≤ 3.414`; `0.062 ≤ 3.085`; `0.143 ≤ 3.786` | sound |
| 8 | §2.1 Fejér reduction (r4) | `(sin(π/4)/(π/4))²`; `f≡0`, `x/2` | `0.8106>0.81`; `5 ≤ 28`; `3 ≤ 20` | sound |
| 9 | `first_derivative_test_points` (r4) | `x/10,N=20,δ=0.05`; `f=x,N=10,δ=0.01` | `3 ≤ 10`; `11 ≤ 21.42` | sound |
| 10 | `second_derivative_test_points` (r4) | `x²/100,N=50,δ=0.01`; `x/2,A=2` | `6 ≤ 227.4`; `3 ≤ 6` | sound |
| 11 | `polya_vinogradov_classical` (r4) | `q=3`; `q=5`; `p=3`, `p=2` | `4/3` vs `1`; `2.462` vs `2`; `0.911 ≤ 1.099`; `0.726 > 0.693` | sound |
| 12 | §3.3 Lemmas 2–4 (r4) | `C₃(π)`; `n=2` route; Lemma 3 at `n=1` | `−5/6 > −1.36`; `−0.640`, `−0.667 > −1`; `1 < 2.72` | sound |
| 13 | `polya_vinogradov_pomerance` (r4; statement untouched) | §3.2 vs even bound, `q = 3…49`; §3.2 vs odd bound; §3.5 odd vs odd bound | `q=20`: `9.2226 ≤ 11.4117`; `q=10`: `5.1384 ≤ 5.1607`, `q=11`: `5.5874 > 5.5057`; `q=7`: `4.0185 ≤ 4.0258`, `q=5`: `3.4357 > 3.1476` | sound: every primitive conductor covered |
| 14 | `polya_vinogradov_lapkova`, §6.1 (r4) | all primitive χ, `2≤q≤25`; rounded forms | 123 characters, max `M/b = 0.680`; `31.305 ≤ 31.305`; `5.742 ≤ 5.745` | sound |
| 15 | `A(q₀)` §3.5 (r4) | `q₀=10⁶`; printed form; `q₀=1200` | `0.21861` (`3020.2`); `0.16005`; `0.27905` | sound |
| 16 | `polya_vinogradov_frolenkov_soundararajan` (r4) | `q=1000`; mod 2310, 4620 | `123.5 < 200`; `5 ≤ 196.75`; `8 ≤ 288.86` | sound |
| 17 | `burgess_moment_bound` (r4) | degenerate counts; `p∈{7,11,13}`, `r≤3` | `1,22,99`; `1,86`; no violation | sound |
| 18 | §4.1 `r=2` refinements (r4) | `p=7`; `p=19` quartic; 18 `(p,d)` | `34 ≤ 98.33`; `22 ≤ 121.37`; `9 > 8.718`; none | sound |
| 19 | §4.2 energy counts (r4) | `{2,3,5}, N=100, p=1009`; `A=28,N=400` | `446 ≤ 452.67`; `88 447` | sound |
| 20 | §4.3 amplification (r4) | `A=B=1`, `r=1`; Hölder exponents | `√(N(p−1)) + 2E(1)`; sum `1` | sound |
| 21 | `burgess_mcgown_parametric/table` (r4) | `C₀(r)`, `2≤r≤15`; (A.1) | `10.036550<10.0366`; `1093.2≥1056`; all 14 rows | true |
| 22 | `burgess_trevino_table1/uniform` (r4) | 27 rows, `p ∈ [p₀, p₀·10²⁰⁰]` | max `0.999995`; `2.738070` | true |
| 23 | `burgess_trevino_table3` (r4) | 27 rows, same grid | max `0.999995`; `3.652847` | true |
| 24 | `selbergDiagonal`, `selbergWeightMass` §5.1 (r4) | `S(6)`; `[3,5)`; `S₆(7)`; `H₁(1..3)`; `H₁(10⁶)`; `H₁(42)` | `3.25`; `2.5 ≥ 2.4974`; `1.4167 ≥ 1.139`; `1, 4, 6`; `1 519 817.79` vs `1 519 817.75`; `76.479` vs `63.832` (`1.951√42`) | sound |
| 25 | `greaves_density_sum` (r4) | `κ≡1, z=3, s=2` | `2 ≥ 0.749` | sound |
| 26 | `butheRho`, `buthe_weighted_brun_titchmarsh` (r4) | tent; `f≡1` on `[0,10]`, `[1.9,5.1]` | `ρ=y/6`; `4<8.686`; `3<5.502` | sound |
| 27 | `buthe_weighted_prime_sum` (r4) | small range grid; `Y=20000`; `z=10⁹` with `200` | least margin `0.455`; `4003.29 < 4038.98`; `1.52614 ≤ 1.53` | true |
| 28 | weighted arithmetic large sieve §5.5 (r4) | odd integers of `(0,10]`, `Q=2` | `7.172 ≥ 5` | sound |
| 29 | sifted form §5.5 (r4) | `t=318, 319`; `t ≥ 1000` | `110.33≤110.38`, `110.67>110.66`; margin `1.99` | sound |
| 30 | §5.5 negative control (r4) | `t = 1000`; `t = 24`, `Q = 2` | `301.77 > 289.53`, weighted `269.53`; `15.0 < 15.104` | sound |
| 31 | `ramare_viswanadham_prime_powers` (r4) | `d=1,A=B=10`; `A=1,B=7` | `4.25 ≤ 8.686`; `4.833 ≤ 7.195` | sound |
| 32 | `fan_rough_count`, §6.4 (r4) | `x=7, z=4.999`; cells to `x=20 000` | `3 > 2.99835`; none with `x≥8` | true with `x≥8` |
| 33 | §3.4 odd main part `C_n` (changed) | quartic `χ` mod 5, `χ(2)=i`, `[1,3]`, `n = 2, 3, 4, 10, 20000` | direct / `χ⁻¹` form: `0.4677+0.7568i` / `0.4677+0.7568i`; `0.6072+0.5312i` / same; `0.4380+0.4266i` / same; `0.4681+0.4619i` / same; limit `0.49998+0.49998i` vs `χ(1)/2+χ(2)+χ(3)/2 = 0.5+0.5i`; `χ` form at `n=2`: `0.8861+0.0799i` | sound (R01 repaired) |
| 34 | §3.4 doubling Check (r4) | `q = 10⁶` | `n = 17590`; `3515.93`, doubled `7031.86 > 4034.62` | sound |
| 35 | §5.1 squarefree count (changed) | tail at integer `T ≤ 2·10⁵`; cut `(T+1)²/(T+1/2)` vs `T+5/3`; conclusion on `1 ≤ y ≤ 10⁶` | max `(T+1/2)·tail = 0.99999999997 ≤ 1`; difference `(T−1)/(6(T+1/2)) ≥ 0`, `0` at `T=1`; max ratio `0.2507` at `y = 7` | sound (R02 repaired) |
| 36 | §5.1 `h̃(1/2)` chain (r4) | `R`; `ζ` bounds; constant; §5.4 margin | `R = 3.65995`; `ζ(3/2) ≤ 2.76777`, `ζ(3) ≥ 1.19955`; `44.958 ≤ 45`; `192.36 ≤ 200`; `321.99` | sound |
| 37 | §3.4 new Check (new) | `τ(χ)`, `τ(χ⁻¹)`; identity at `m = 2` | `−1.17557+1.90211i`, `1.17557+1.90211i`, product `−5`; `Σ_a χ(a)e(2a/5) = 1.9021+1.1756i = χ⁻¹(2)τ(χ)`, while `χ(2)τ(χ) = −1.9021−1.1756i` | true |
| 38 | §5.1 new Check (new) | `T = 1`; `T = √3`; `y = 7` | `0.64493 ≤ 0.66667`; `0.64493 > 0.44802`; `Q(7) = 6`, `1.74451 ≤ 6.95817` | true |

**Remark on changed text (no change requested).** README line 851 runs to 159 characters.
Other lines wrap near 100. It renders the same in Markdown, and no house rule governs it.

## Not verifiable

- In the text of pomerance2011 that we hold, overbars are lost: display (7) at line 236 and `C_n`
  at line 384 both read `χ(m)`. Whether print carries `χ̄(m)` could not be read. The repaired
  formula rests on this README's own §3.1 and on the direct computation in row 33, not on the
  extraction.
- The previous reports' list for untouched text stands unchanged:
  - Bober–Goldmakher's data is not in the manifest;
  - vanlintrichert1965 is waived;
  - montgomeryvaughan2007, frolenkovsoundararajan2013, montgomeryvaughan1973, greaves2001,
    filaseta1990, bordelles2012, trevino2015kth, bachmanrachakonda2001, siebert1976 and
    rieselvaughan1983 are uncertified;
  - mcgown2012's published numbering was not checked.

## Source issues

- **Misprint** in buthe2014 at the proof of Lemma 4.4, p. 6 (line 419): the source attributes the squarefree bound to a short "computar" calculation; it should be "computer"; affects nothing.
