# Review of ExplicitCharacterSumsAndSieves (pull request #1948 at d6d076d)

**Verdict:** needs changes

This is a full review of the head `d6d076d`, which changes the folder by 471 lines since `0c4bb76`. The pull request changes nothing outside `TauCetiRoadmap/ExplicitCharacterSumsAndSieves/`. The gate passes. The mathematics holds everywhere I tested it: the seeded sample, every headline and every Layer 6 proposition (table below). One prose slip remains (R01, P3). It is the only reason the verdict is not `accepted`.

## Previous findings (review of `0c4bb76`)

- **R01 (P2), §0.6a re-planned EllipticLegendreCharacterInterfaces §5.1: repaired.**
  - §0.6a is gone, and so are the two point-count theorems, the `TauCeti` import and the `silverman2009` reference. `Suggested.lean` line 3 is now the only import line, `import Mathlib`.
  - §4.1 now takes the quadratic `r = 2` case through CharacterSumsOverFiniteFields §4.7 with `m = 3`. README lines 1017–1023: "the substitution `x = −a + 1/u` … `g` is a cubic with the three distinct roots `−1/(j − a)` … §4.7 with `m = 3` gives `|Σ_u χ(g(u))| ≤ 2√p`".
  - The supplier contract (lines 289–294) and Scope (lines 78–80) say the same.
- **R02, R03 (P3), `[Fintype F]` hygiene hits: repaired.** Both theorems were deleted. The gate rerun shows `statement-hygiene=0`.
- **R04 (P3), Layer 6 had no shape and no Checks: repaired.**
  - Lines 1608–1813 restore `### 6.1`–`### 6.10`. The items have 5, 3, 3, 4, 3, 3, 3, 3, 3 and 3 Checks.
  - `### Examples` is at line 1801 and `### Dependencies` at line 1807. The latter names the consumers §§3.4, 3.5, 4.4, 4.5, 5.1, 5.4, 5.5 and 5.6.
  - The wrong-encoding control of 6.6 is back (line 1722: "a prefactor `(1/2)^{1/4}` in its place gives `num/den = 1.237`").
- **R05 (P3), `mcgownConstant` had no Checks: repaired.** Lines 1175–1186 check `C₀(2) = 10.036550`, `C₀(3) = 4.953819` and the tightest row `r = 8` (`2.2720993` against `2.2721`). They also check `mcgownConstant 1 = mcgownConstant 16 = 0`.

## R01 (P3) — Part II paragraph says Layer 1 contains derivative tests

**Location.** `TauCetiRoadmap/ExplicitCharacterSumsAndSieves/README.md` line 112: "This roadmap stops at the derivative tests of Layer 1, the first and second derivative counts of Layer 2, …".

**Claim.** Layer 1 contains no derivative test. Its only target is `iterated_vanDerCorput` (§1.1, lines 548–588). Scope says that this target "assumes no derivative bound at all" (lines 62–63). It also gives every derivative test for exponential sums to ExplicitZetaBounds §§4.3–4.4 (lines 57–58). So line 112 contradicts the README's own Scope.

**Witness.** README lines 62–63 against line 112. The module docstring of `Suggested.lean` agrees with the Scope (lines 16–19): the derivative tests "belong to the roadmap ExplicitZetaBounds and are not stated here".

**Repair.** Replace "the derivative tests of Layer 1" with "the iterated van der Corput inequality of Layer 1". This agrees with the first Part II item, Arias de Reyna's `d`-th derivative estimate "built on §1.1" (lines 116–117).

## Verified sound

### Gate, build, dependency check, signatures and padding

- **Gate rerun at this head.** Every counter is `0` and the result is `OK`. The counters are `set_option`, `sorry-data`, `imports`, `statement-hygiene`, `readme-ids-missing`, `depcheck`, `stray-files`, `outside-folder` and the rest.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Dependency check output:** `depcheck: 238 roadmaps, 2429 edges, 0 problem(s)`. There is no `UPWARD`, `CYCLE` or `moved:` line. This roadmap is at merge-order line 272. Its suppliers come earlier:
  - AnalyticNumberTheoryPartI, line 90;
  - CharacterSumsOverFiniteFields, line 154;
  - SieveMethodsAndPrimePatterns, line 269;
  - ExplicitZetaBounds, line 270;
  - ExplicitPrimeCounting, line 271.
- **Elaboration.** `lake env lean …/Suggested.lean` exits `0` with 19 warnings, all `declaration uses sorry`. They are at lines 96, 115, 126, 141, 165, 176, 188, 198, 229, 267, 332, 344, 410, 424, 440, 456, 483, 502 and 525.
- **Contents of `Suggested.lean`.**
  - It has 23 `def`s, every one with a real body, and 19 theorems.
  - It has no `set_option`, no `lemma`, no `variable` block and no sorry'd data.
- **Signatures.** I elaborated `#check @…` for all 42 declarations in a scratch copy, with no error. I also printed the bodies of the six certificates there.
  - Each type matches its README statement.
  - Every exponent and quotient that mixes `r : ℕ` with reals is computed in `ℝ`, for example `(1 - 1 / ↑r)`, `(2 * ↑r - 1)` and `((↑r + 1) / (4 * ↑r ^ 2))`.
  - The only natural-number subtractions are `(2 * r - 1).doubleFactorial`, `(2 * r - 3).doubleFactorial * (r - 1)` and `H r - 1`. Each sits under a hypothesis that rules out truncation (`r ≥ 1`, `r ≥ 2`, `H r ≥ 1`).
- **Padding probe.** I replaced every `sorry` with `first | (rfl; done) | (simp; done) | (norm_num; done) | (positivity; done) | (infer_instance; done) | (decide; done) | (linarith; done) | (intros; simp_all; done)`. All 19 theorems still fail, so none is padding.
- **Headlines.** The end-theorem list (README lines 24–36) has 19 headlines, and all 19 are stated. The docstring's "every headline … is stated here" is true.

### Seeded sample (15 targets)

I read each locator in the cached text and checked the theorem number, the hypotheses and that the source supports the statement as written.

| Target | Locator and what I checked |
|---|---|
| 0.1 | No source locator. Library inputs checked: `Real.fourierChar` and `Real.fourierChar_apply` (`Circle.lean` lines 221 and 232) |
| 0.2 | No source locator. `UnitAddCircle.norm_eq` (`AddCircle.lean` line 223) |
| 0.4 | No source locator. Tau Ceti `sum_range_level_eq_zero`, `sum_range_eq_sum_range_mod` and `norm_sum_Icc_le_level` (`PartialSum.lean` lines 30, 37 and 49; read in full); `norm_le_one` (`Bounds.lean` line 44) |
| 3.1 | pomerance2011 lines 229–262, displays (7)–(10): the shift identity for primitive `χ` and the even and odd forms. The README's `χ(n)τ(χ⁻¹) = Σ_b χ⁻¹(b)e(bn/q)` is (7) applied to `χ⁻¹` |
| 3.3 | pomerance2011: Lemma 2 at lines 112–134 (`C_n > −log 2 − 2/n`); Lemma 3 at lines 147–161; Lemma 4 at lines 172–204; tail bound `\|R_n(x)\| ≤ 1/((n + 1) sin(x/2))` at line 180 |
| 3.4 | pomerance2011 Theorem 1 at lines 78–86. Even case at lines 263–361: `n = ⌊2√q log q⌋` at line 351, `q ≥ 21` at line 357, Bober–Goldmakher at lines 357–360. Odd case at lines 362–438: `n` at line 424, `q ≥ 45` at line 432, small cases at lines 432–437 |
| 3.6 | tmeemt-art15 lines 106–109: `q ≥ 1000`, sums over `[M + 1, M + N]`. hunter2016 lines 651–664: `q > 100`, initial sums, `c√q log q` with `c = 1/(π√2) + 6/(π√2 log q) + 1/log q`, which is the same bound |
| 4.5 | trevino2015: Theorem 1 at lines 83–88, Corollary 1 at 91–94, Table 1 at 97–107, Theorem 2 at 134–141, Table 3 at 145–155, Corollary 2 at 156–161. Proof: (28)–(29) at lines 643–700, (33) at 731–735, (36)–(38) at 767–785, (43) at 817–841, Corollary 1 at 1026–1080, Corollary 2 at 1324–1340. tmeemt-art15 lines 154–157 |
| 5.3 | buthe2014: Lemma 3.1 at lines 69–73 with proof at 74–138; Proposition 3.2 at 139–158; the minimizing weights and `Σ\|λ_n\| = H_k/S_k` at 226–236; Proposition 3.3 at 237–284 |
| 5.5 | platttrudgian2018 Theorem 2, lines 131–139 (`Z ≤ L⁻¹`, `(N + (3/2)qz)⁻¹`). ramareviswanadham2021 Lemma 14 at lines 650–666 (`A ≥ B > d ≥ 1`) and Lemma 15 at 667–679. tmeemt-art14 lines 97–111 |
| 6.5 | mcgown2012 Theorem A.1 at lines 1030–1050 and Theorem A.9 at 1209–1233; "`d = 11`, `p₀ = 2·10⁴`" at line 1433 |
| 6.6 | trevino2015 (46)–(47) at lines 889–941 and Table 5 at 1013–1024. I re-derived the Lean encoding against the displays: the prefactor, the bracket (including `p^{(r−2)/(2(r−1))} = p^{1/2 − 1/(2r) − 1/(2r(r−1))}`), `den`, `s` from (36), and `A` as the lower bound from (37)–(38) with `c′ < c` |
| 6.8 | mcgown2012 Lemma A.8 at lines 1192–1204; `π(A) ≥ A/(1 + log A)` for integers `A ≥ 3` at lines 1376–1377 |
| 6.9 | AnalyticNumberTheoryPartI §0.5 (its README line 228) and its `RosserSchoenfeldFiniteRangeInput` (its `Suggested.lean` line 130): same content, different namespace |
| 6.10 | ExplicitPrimeCounting §0.1 (its README line 518) and its `MVDiagonalFiniteRange` (its `Suggested.lean` line 189): same content, different namespace |

I compared the tables entry by entry:
- All 108 entries of Treviño's Tables 1, 3, 5 and 7 in `Suggested.lean` equal the source (lines 97–107, 145–155, 1013–1024 and 1311–1322) and the README listings at lines 1196–1205, 1704–1711 and 1734–1741.
- The 14 values of `mcgownConstant` equal mcgown2012 Table A.1.

### Adversarial table

All values were computed this round with scratch scripts.

| # | Statement | Instances | Values (left / right) | Result |
|---|---|---|---|---|
| 1 | `polya_vinogradov_classical`, §3.1 cosecant bound | all 1815 primitive `χ` with `2 ≤ q ≤ 100`; `q = 3, 5` | max `M_χ`/bound `0.7458` (`q = 5`: `2 / 2.682`); `q^{−1/2}Σcsc = 1.3333`, `2.4621` | true |
| 2 | `polya_vinogradov_lapkova`, 6.1 | the same 1815; the 123 with `q ≤ 25` | max ratio `0.7459` (`q = 95`, odd: `12 / 16.089`); for `q ≤ 25`, max `0.680` at `q = 23` (`5 / 7.356`) | true |
| 3 | `polya_vinogradov_pomerance` and its case split | the same 1815; `3 ≤ q ≤ 44` | max ratio `0.5715` (`q = 47`: `8 / 13.998`); §3.2 is below the even bound on `3 ≤ q ≤ 20` and below the odd bound on `3 ≤ q ≤ 10`; Lapkova's odd bound is below Pomerance's on `7 ≤ q ≤ 44`, gap `0.00733` at `q = 7` | true |
| 4 | `polya_vinogradov_frolenkov_soundararajan` | every `χ ≠ 1`, primitive or not, for `q ∈ {1000…1012, 1020, 1050, 1155, 1260, 1680, 2310}`; induced characters | max `0.4387` (`q = 1003`: `54.27 / 123.70`); mod `2310` from mod `3`: `5 / 196.75`; mod `4620` from `χ₄`: `8 / 288.86` | true |
| 5 | §3.5 rounded forms and `A(q₀)` | `q = 979, 980, 32, 33`; `q₀ = 10⁶, 1200` | `31.3044 ≤ 31.3050`; `31.2893 > 31.2890`; `5.7413 ≤ 5.7446`; `5.6694 > 5.6569`; `A(10⁶) = 0.218612` gives `3020.24`, which is Lapkova's odd bound; printed form `0.16005`; `A(1200) = 0.27905` | as README |
| 6 | `burgess_moment_bound` | every `χ ≠ 1` mod `p ≤ 31`; `r ≤ 3`; 12 values of `B`, including `B < 1` and `B > p` | max ratio `0.8204` (`p = 31`, `r = 1`, `B = 1`: `30 / 36.57`) | true |
| 7 | §4.1 `r = 2` refinements | every `χ ≠ 1` mod `p ≤ 61`, every `h ≤ p` | max `0.9836` (`p = 61`, order 60, `h = 1`: `60 / 61`); `p = 7`, quadratic `34 / 98.33`; cubic `22 / 121.37` | true |
| 8 | §4.1, the per-tuple bound and the `m = 3` route | `p = 19`, tuple `(1, 2, 4, 9)`; `p = 53`, tuple `(1, 3, 4, 7)` | quartic `−9` against `2√19 = 8.718`; cubic `−8 ≤ 8.718`; `−15` and `−14 ≤ 14.56` | route correct |
| 9 | §4.1 degenerate-tuple counts | `d = 3`, `r = 3`, `H = 1…5`; `d = 3`, `r = 4`, `H = 1…4`; `r = 6`, `H = 100` | counts `1, 22, 99, 268, 565` equal `6H³ − 8H² + 3H`; `1, 86, 783, 3196` equal the quartic; `1.4622^r r!` against `(2r − 1)!!`: `109.7 > 105` at `r = 4`, `802.0 ≤ 945` at `r = 5`; `1.0672·10¹⁶ > 1.0395·10¹⁶`, even-multiplicity tuples `9.398·10¹⁵` | true |
| 10 | `burgess_mcgown_table`, 6.5, `mcgownConstant` | `r = 2…15` | `C₀(r) < C(r)` in every row; min margin `7.5·10⁻⁷` at `r = 8` (`2.2720992`); (A.1) min ratio `1.0352` at `r = 2` (`1093.18 / 1056`) | true |
| 11 | `McGownSmallRange` (6.8) and its extension in §4.4 | `2 ≤ X ≤ 100`, `3 ≤ A ≤ 58`; up to `2·10⁶` | min margin `0.020655` at `X = 23`; `0.3238` at `A = 4`; Lemma A.8 holds up to `2·10⁶`; `π(n) − 1 ≤ n/3` on `[100, 2·10⁶]` | true |
| 12 | `TrevinoTable1Certificate` (6.6) | 27 rows, `p = 10^{e + 0.05j}` with `j ≤ 4000` | all four conjuncts hold; max `(num/den)/c = 0.9999953` at `(7, 10, p₀)`; `(7, 2)`: `2.738070`, `A = 40.27`; `(7, 3)`: `2.019615`, `s = 6.221`; `(10, 10)`: `1.349428`; `(20, 10)`: `1.256098`; `(1/2)^{1/4}` control `1.2371` | true |
| 13 | `TrevinoTable3Certificate` (6.7) | the same grid | all five conjuncts hold; max `0.9999955` at `(20, 7, p₀)`; `(10, 2)`: `3.652847`, `A = 140.97`; `(10, 10)`: `1.579302`, bracket `4.7426 → 4.8535` at `10^{23.33}`, ratio `→ 1.5154`; `8k = 0.992 < D = 1` | true |
| 14 | `iterated_vanDerCorput` | 1500 random phases with `d ≤ 2`; `d = 1`, `H = Y = 2`, `f ≡ 0` | max ratio `0.340`; `1 / 3.414` | true |
| 15 | `first_derivative_test_points` | 3000 random cases; `x/10` | max ratio `0.462`; `3 / 10` | true |
| 16 | `second_derivative_test_points` | random quadratics; `x²/100`, `N = 50` | max ratio `0.057`; `6 / 227.4` | true |
| 17 | `greaves_density_sum` (Lean form `p < ⌈z⌉`) | 2000 random `κ`, `z < 30`; `κ ≡ 1`, `z = 3`, `s = 2` | max rhs/lhs `0.9978`; `0.749 ≤ 2` | true |
| 18 | `buthe_weighted_prime_sum` at `f ≡ 1` | 20000 random `[x, x + y]` | max ratio `0.627` | true |
| 19 | `ButheSmallRangeVerified` (6.2) | grid on `1 < Y < 20000` (steps `0.001` and `0.01`) | no failure; max of best-LHS/RHS `0.9635` at `Y ≈ 18`; `Y = 100`, `z = 7`: `42.857 < 43.43` | true |
| 20 | `ButheMediumRangeVerified` (6.3) | `Y` from `2·10⁴` to `1.6·10¹³` (factor `1.001`), `z` near `√Y/2`; `Y = 20000` | max ratio `0.9946`; `z = 65`: `4003.29 < 4038.98`; integer witnesses `57…84` | true |
| 21 | `ramare_viswanadham_prime_powers` | 3000 random cases with `d ≤ 6`; the Checks | max ratio `0.485`; `4.25 / 8.686`; `3.5 / 13.03` | true |
| 22 | §5.5 sifted form, both routes | Eratosthenes on `t ≤ 1465`; weighted route on `t ∈ [1000, 10¹⁰]` | `z = 3`: min margin `0.0440` on `(1, 318]`, `0.0874` at `t = 3.554`; `z = 5` range `[41.94, 1465.29]`; partial-summation bound at `t = 1000`, `Q = 23`: `287.015` (exact `270.25`); max bound/(`2t/log t`) `0.9913` at `t = 1000` | true |
| 23 | §5.5 negative control | `t = 1000` | forbidden-residue sieve `301.77` at `Q = 15`, above `289.53`; weighted `269.53` at `Q = 22` | as README |
| 24 | `fan_rough_count`, 6.4 | integer `x < 1500`, `z` at cell ends; `x = 7` | max ratios `0.732` for (4), `0.898` for (5) with `x ≥ 8`, `0.916` for (6); at `x = 7` the right side of (5) is `3` at `z = 4.99094` and `2.99814` as `z → 5⁻`, against `Φ = 3` | true with `x ≥ 8` |
| 25 | `MVDiagonalFiniteRange` (6.10) and §5.1's constant `0.89` | integers up to `2·10⁶` | min margin `0.0441` as `z → 10⁻`; for `0.89`, min margin `0.00056` as `z → 5⁻` | true |
| 26 | `RosserSchoenfeldFiniteRangeInput` (6.9) | every integer `59…2·10⁶`, at cell ends | both bounds hold; `x = 59`: `16.244 < 17 < 19.792`; `x = 58.99`: `16.2418 > 16` | true |
| 27 | §5.1 weight mass | `H₁` up to `2·10⁶` | max `\|H₁ − 15z/π²\|/√z = 2.04`; `H₁(42) = 76.479`, which is `1.95√42` from the main term; `H₁(10⁶)/10⁶ = 1.519818` | true |

I also checked these proofs by hand:
- §4.1's lower bound for `RHS − W₂`. Per tuple pattern the allowances are `1`, `2`, `2√p + 1`, `≥ 2√p` and `≥ −1`, so the README's weaker sum is valid. Its cubic part is `h(h − 1)(h − 2)(12√p − 9 − h)`. The large-`h` branch needs `h ≥ 8`, which `h > 12√p − 9` gives.
- §4.1's Jensen step with `|E e^{iθ}| = d sin(π/d)/π`.
- §4.4's replacement of Rosser–Schoenfeld's upper bound (3.6) by `π(A) ≤ (A + 1)/2`, which gives `(π(A) − 1)/H ≤ 1/(2dB) < 1/3`.
- §4.4's moment step `W ≤ (2r − 1/2)B^{2r}√p`.
- §5.1's constant `(11/3 + 6/π²)·h̃(1/2)`.
- §5.2's Rankin argument.
- §5.5's squarefree induction.
- §2.1's Fejér factor `0.8106`.
- §2.3's gap argument.
- §0.3's sum-of-squares step.

### Library declarations opened at the pins

- **Mathlib `1b1ccf4`**, 45 declarations, each at its file and line, among them:
  - `Real.fourierChar` (221), `UnitAddCircle.norm_eq` (223);
  - `DirichletCharacter.conductor`, `IsPrimitive`, `primitiveCharacter`, `changeLevel_primitiveCharacter`, `primitiveCharacter_isPrimitive`, `eq_one_iff_conductor_eq_one`, `IsPrimitive.inv`, `Odd`, `Even`, `even_or_odd` and `Even.eval_neg` (lines 245, 291, 306, 309, 313, 267, 413, 537, 540, 542 and 572);
  - `gaussSum_mulShift_of_isPrimitive` (59), `ZMod.stdAddChar` (83), `isPrimitive_stdAddChar` (95);
  - `BoundingSieve` (54), `SelbergSieve` (78), `siftedSum_le_mainSum_errSum_of_upperMoebius` (217), `upperMoebius_lambdaSquared` (251);
  - `quadraticChar` (120), `quadraticChar_ne_one` (207);
  - `eulerMascheroniSeq_lt_eulerMascheroniConstant` (159);
  - `AbsolutelyContinuousOnInterval` (155), `integral_deriv_eq_sub` (227);
  - `hasSum_fourier_series_of_summable` (493), `tendsto_tsum_powerSeries_nhdsWithin_stolzSet` (162);
  - `hasSum_zeta_two` (453), `hasSum_zeta_four` (458), `riemannZeta_eulerProduct_tprod` (98).
- **Pin claims.** A grep confirms that the pin has no Pólya–Vinogradov, Burgess, Brun–Titchmarsh, large-sieve or van der Corput declaration. `Nat.roughNumbersUpTo` (`SmoothNumbers.lean` line 399) counts non-smooth numbers, not `Φ(x, z)`, so `roughCount` duplicates nothing.
- **Tau Ceti `2fd255d`**, 7 declarations: `gaussSum_mul_gaussSum_inv_eq_card_of_isPrimitive` (43), `IsPrimitive.norm_gaussSum` (82), `IsPrimitive.eq_one_iff` (25), `even_of_le_two` (77) and the three partial-sum lemmas (30, 37 and 49).

### Cross-roadmap citations, at the open heads

| Supplier | Cited sections | What I checked |
|---|---|---|
| SieveMethodsAndPrimePatterns | §1.1 (line 1070), §1.3 (line 1251), §1.6 (line 1541), §2.9 (line 2395), §5.2 (line 3330) | §1.3 has `λ_z(1) = 1`, `\|λ_z\| ≤ 1`, the strict cutoff `d < z`, main term `1/G` and `z > 1`. §2.9 contains "Large sieve for forbidden residues" with `J(Q)` as contracted |
| CharacterSumsOverFiniteFields | §4.7 (line 1437) and `weil_mulChar_sum_bound` (its `Suggested.lean` line 321) | `m` is the number of distinct roots over `AlgebraicClosure F`; the hypothesis is not `C c * h ^ orderOf χ`. Contracted as stated. §7.1 at line 1922 |
| AnalyticNumberTheoryPartI | §0.5 (line 228), §0.8 (`x ≥ 319`), §0.19 (`x ≥ 286`), §0.20 (`x ≥ y ≥ 319`), §0.34 (line 778), §1.5a (line 951, constant `3π/2`) | as contracted |
| ExplicitZetaBounds | §4.2 (line 1210), §§4.1–4.5, §6.5 (line 1953, `c = 3/2`) | §4.2's finite inequality and normalized form are as contracted |
| ExplicitPrimeCounting | §0.1 (line 518) | `S(u) > log u`, the kernel identity, Büthe's asymptotic, `MVDiagonalFiniteRange`, the `ω(p) = 1` step, the comparison `L₁ ≤ (k/φ(k))L_k`, `brun_titchmarsh` |
| ProbabilisticAndMetricNumberTheory | §2.7 (line 3089), under "Not owned here" only | it is not a supplier |

- **ExplicitPrimeCounting's ownership note.** Its "Owned here" (lines 70–80) says that it owns the diagonal *bound* and asymptotic, and that this roadmap cites them. This roadmap owns the carrier `selbergDiagonal` and the coprime comparison. There is no conflict.
- **`scratch/overlaps.md`.** It reports no other pull request changing this roadmap, no dropped id and no revision-only id.
- **Downstream consumers.**
  - ExplicitNumberFields cites §§3.5, 4.1 and 6.1. `### 6.1` now exists, and §4.1's statements are unchanged.
  - ExplicitMultiplicativeFunctions cites §5.1's `selbergDiagonal` and the coprime comparison, and does not redeclare them.
- **Ownership by object.** I grepped every open head and main for these objects: the explicit Pólya–Vinogradov, Burgess and Brun–Titchmarsh inequalities and all 23 definition names.
  - No second owner.
  - CharacterSumsOverFiniteFields (line 260) and ExplicitZetaBounds (lines 133 and 146) defer the explicit inequalities to the analytic roadmaps.
  - ExplicitMultiplicativeFunctions takes a Pólya–Vinogradov bound as a parameter.
  - No `Suggested.lean` I can read declares a fully qualified name of this one.

## Not verifiable

- **Uncertified citations, cited by locator without a text:**
  - greaves2001 Theorem 1, p. 52;
  - montgomeryvaughan2007 §9.4;
  - montgomeryvaughan1973 (Corollary 1, Theorem 2, Lemmas 7 and 10);
  - frolenkovsoundararajan2013;
  - bordelles2012;
  - filaseta1990;
  - trevino2015kth;
  - bachmanrachakonda2001;
  - siebert1976;
  - rieselvaughan1983.
- **Waived:** vanlintrichert1965. buthe2014 delegates the choice of `z` in Theorem 4.2 to it (lines 346–348). I could not check that step.
- **Bober–Goldmakher's values** (pomerance2011 lines 357–360 and 432–437). They are not in the manifest. Here §§3.2 and 3.5 replace them; rows 1–3 check those replacements.
- **Overbars in pomerance2011.** They are lost in the extraction of (7) (line 236) and of `C_n` (line 384). The `χ⁻¹` placement in §§3.1 and 3.4 rests on Mathlib `gaussSum_mulShift_of_isPrimitive` and on the README's quartic check.

## Source issues

- **Error** in pomerance2011 at p. 6 (line 228): the source says the Fourier series of the step function `Φ` converges to it uniformly on `[0, 2π)`; it should say pointwise (with value `1/2` at the jumps), since `Φ` is discontinuous; affects nothing.
- **Misprint** in mcgown2012 at Lemma A.8, p. 23 (line 1192): the source states the bound for every `X ∈ ℤ⁺`, but at `X = 1` the normalising `π(1)` is `0`; it should require `X ≥ 2`; affects nothing.
- **Error** in mcgowntrudgian2020 at the proof of Proposition 1, p. 5 (line 180): the source says the per-tuple Weil constant improves to `2(r − 1)√p` for quadratic `χ`; at `p = 19` the tuple `(1, 2, 4, 9)` gives `9 > 2√19`; it should be `2(r − 1)√p + 1`; affects the proof.
- **Error** in fan2022 at the Theorem, inequality (5), p. 4 (lines 157–161): the source states (5) for every `1 < z ≤ x` with `z ≥ max(3, √x)`; at `x = 7`, `4.991 < z < 5` the count `3` exceeds the right side; it should require `x ≥ 8`; affects a stated result.
- **Error** in kerrmcgowntrudgian2020 at Lemma 3, p. 3 (line 122): the source prints the middle term of `A(q₀)` as `0.8204/√q₀`; derived from Lapkova's Lemma 3A it should be `0.8204/log q₀`; affects a stated result.
