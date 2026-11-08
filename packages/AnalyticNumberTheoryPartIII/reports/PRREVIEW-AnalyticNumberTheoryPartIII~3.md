# Review of AnalyticNumberTheoryPartIII (pull request #2008 at c919ce6)

**Verdict:** needs changes

This is an incremental re-review of the 142 changed lines since `0121ecc`. Both previous findings are repaired. The repair of R01 introduced one problem (P3, below). The gate passes at this head.

## R01 (P3) — Layer 11's Dependencies paragraph omits the Tau Ceti input that 11.2 now uses

**Location.** `TauCetiRoadmap/AnalyticNumberTheoryPartIII/README.md`, lines 1360–1364, Layer 11, `### Dependencies`:

> "Mathlib arithmetic functions, `LSeries`, Euler products, `Ring.multichoose`; ProbabilisticAndMetricNumberTheory §0.1a; AnalyticNumberTheoryPartI §§3.3 and 3.24a and ArithmeticDirichletSeriesPartII §5.1 for Checks."

**Claim.** The repaired route of `LSeries_generalizedDivisor` (lines 1225–1228) and 11.2's *Needs:* line (lines 1278–1279) now consume the Tau Ceti declaration `TauCeti.hasSum_multichoose_mul_geometric_complex_of_norm_lt_one`. Layer 11's dependency summary still names only Mathlib and three roadmaps. The repair has made that paragraph incomplete.

Every other layer that uses Tau Ceti names it in its Dependencies paragraph:

- Layer 7 (line 635): "Tau Ceti one-dimensional bounded variation and the Dirichlet integral";
- Layer 8 (line 840): "Tau Ceti residue theorem";
- Layer 10 (line 1132): "Tau Ceti Hecke `L`-functions".

**Witness.** README line 1279 ends 11.2's *Needs:* with "Tau Ceti `TauCeti.hasSum_multichoose_mul_geometric_complex_of_norm_lt_one`". The declaration is at `TauCeti/Analysis/Analytic/Binomial.lean:46`. `grep -n 'Tau Ceti' README.md` finds no line between 1355 and 1365.

**Repair.** In line 1362, after "`Ring.multichoose`", insert "; Tau Ceti's binomial series `TauCeti.hasSum_multichoose_mul_geometric_complex_of_norm_lt_one` (for 11.2)".

I tested the repaired paragraph against both *Needs:* lines of the layer:

- 11.2 names Mathlib, Tau Ceti, AnalyticNumberTheoryPartI §3.3 and ArithmeticDirichletSeriesPartII §5.1.
- 11.4 names Mathlib, 11.1, 11.2 and ProbabilisticAndMetricNumberTheory §0.1a.

After the edit, the paragraph names every one of these suppliers. The inserted name begins with `TauCeti.`, so the gate's README-identifier check does not require it in `Suggested.lean`.

## Previous findings

- R01 — repaired: lines 1225–1231: "the local factor is `(1 − p^{−s})^{−z} = exp(−z log(1 − p^{−s}))` by `TauCeti.hasSum_multichoose_mul_geometric_complex_of_norm_lt_one` and `Complex.cpow_def_of_ne_zero`… by `HasSum.cexp`… `DirichletCharacter.eulerProduct_log_eq_LSeries`"; convolution law via `Ring.add_choose_eq` and `Ring.choose_neg'` (lines 1211–1215). The repair introduced the new R01.
- R02 — repaired: line 1219 "(kontorovichtao-pntplus lines 3173–3184, Theorems 9.1.11–9.1.12, for `z ∈ ℕ`; tenenbaum2015, Chapter II.5…)". Lines 1186–1188 and 1233–1236 add the two abscissa locators. Lines 537–539 name the windowed error's inputs and say the combination is stated here.

## Verified sound

### The repairs, checked in detail

**R01 (previous): the inputs of the 11.2 route.** Every step of the new route is now a named pinned declaration, and I checked each step's hypotheses:

- `EulerProduct.eulerProduct_tprod` needs `f 1 = 1`, multiplicativity on coprime arguments, `f 0 = 0` and `Summable ‖f‖`. The function `n ↦ d_z(n) n^{−s}` meets all four.
- The Tau Ceti series needs `‖p^{−s}‖ < 1`, which holds for `Re s > 1`.
- `Complex.cpow_def_of_ne_zero` needs `1 − p^{−s} ≠ 0`.
- `Summable.clog_one_sub` needs `Σ_p p^{−s}` summable.
- `HasSum.cexp` gives a `HasProd`, which equals the `tprod` in `ℂ`.
- `DirichletCharacter.eulerProduct_log_eq_LSeries` at `(1 : DirichletCharacter ℂ 1)` is the identity `Σ_p −log(1 − p^{−s}) = LSeries (Λ/log) s`. The README's gloss says Mathlib proves `riemannZeta_eq_exp_LSeries` through it. That is correct: `DirichletLSeries.lean:264–268` goes through `LSeries_eq_exp_LSeries (1 : DirichletCharacter ℂ 1)`, which rewrites with `eulerProduct_log_eq_LSeries`.

The previous repair proposed `Complex.hasSum_taylorSeries_neg_log`. The author used a different route through `log(1 − X)` and Mathlib's Euler-product logarithm, which is equally complete.

The convolution law uses `Ring.add_choose_eq` at `r = −z`, `s = −w` (`Commute` is automatic in `ℂ`) and `Ring.choose_neg'`. This gives `(−1)^a mc(z + w, a) = Σ (−1)^i mc(z, i)(−1)^j mc(w, j)`; multiplying by `(−1)^a` gives the law. It is computed in the table below.

**R02 (previous): the locators of the three headlines.**

- `kontorovichtao-pntplus` line 3173 is Theorem 9.1.11, summability of `L(d_k, s)` for `Re s > 1`.
- Lines 3179–3184 are Theorem 9.1.12, `L(d_k, s) = ζ(s)^k`.
- Line 3309 is Theorem 9.1.31, the abscissa of `pow_R(ν)` is at most `Re ν + 1`.
- Lines 3316–3323 are Theorem 9.1.32, `σ_ν = 1 ⋆ pow`, on `Re s > 1`, `Re(s − ν) > 1`.
- The windowed error cites 7.2's DLMF locators and 7.1's bound `‖f(x)‖ ≤ V` (line 444, which 7.1 states with the `kontorovichtao-pntplus` line 189 locator). These are exactly the inputs its route uses at lines 543 and 547.
- The docstrings of `abscissaOfAbsConv_sigmaC`, `LSeries_generalizedDivisor`, `abscissaOfAbsConv_generalizedDivisor`, `abscissaOfAbsConv_two_pow_omega_moebius_sq_liouville_totient` and `norm_dirichletKernel_integral_sub_mean_le` carry the same sources as the README.

### Gate, build, dependency check, elaboration

- **Gate.** I reran it at this head. Every counter is 0 (`set_option`, `tex`, `latex`, `sorry-data`, `imports`, `readme-ids-missing`, `statement-hygiene`, `depcheck`, `stray-files`, `outside-folder` and the rest), and the result is `OK`. The worker's gate at this head reports `build=0`.
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AnalyticNumberTheoryPartIII'` is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` only.
- **Dependency check.** Output: `depcheck: 238 roadmaps, 2349 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. In `ORDER.txt` this roadmap is at line 271, after its suppliers:
  - LFunctions (27)
  - ZerosOfLFunctions (48)
  - AnalyticNumberTheoryPartI (49)
  - ProbabilisticAndMetricNumberTheory (60)
  - ArithmeticDirichletSeriesPartII (90)
  - ExplicitZetaBounds (265)
  - ExplicitPrimeCounting (267)
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0. Its only output is 27 "declaration uses `sorry`" warnings.
- **Signatures.** The `Suggested.lean` diff touches docstrings only; no signature changed. I compared the elaborated types of the four Layer 11 declarations whose docstrings changed with the README:
  - `max 1 (1 + ν.re)`;
  - `LSeriesSummable ∧ = cexp (z * LSeries (Λ/log) s)` under `1 < s.re`;
  - `z ≠ 0 → … = 1`;
  - `1 ∧ 1 ∧ 1 ∧ 2`.

  They agree, and no binder is lost.
- **Padding.** No statement changed and no declaration was added. The previous probe, in which none of the 27 theorems closed with one tactic, stands.

### Headline theorems

The change leaves the headline list unchanged:

- Layer 7: Fourier decay; principal-value inversion and its window; Brown.
- Layer 8: the rectangle residue theorem, two forms; the L-shaped shift; derivative Borel–Carathéodory; Landau.
- Layer 9: the smoothed cutoff.
- Layer 10: the smoothed sum; the Ingham transfer; the Hecke `L′/L` bound.
- Layer 11: `σ_ν` and `d_z` with their abscissas; Ramanujan; `2^ω`, `μ²`, `λ`, `φ`.
- Layer 12: Hardy–Landau, both forms.
- Layer 13: Erdős 392 for `B = n²` and `n`; the interval transfer.

All are stated, none through a stand-in.

### Library declarations opened at the pins (23)

**Mathlib.** Each was checked with `#check @` in a scratch file and read at:

- `DirichletCharacter.eulerProduct_log_eq_LSeries` (`NumberTheory/EulerProduct/DirichletLSeries.lean:221`): `Σ' p, −log(1 − χ p · p^{−s}) = LSeries (χ n Λ n / log n) s` for `1 < Re s`, as the gloss says.
- `riemannZeta_eq_exp_LSeries` (`:264`).
- `differentiableAt_riemannZeta` (`NumberTheory/LSeries/RiemannZeta.lean:139`, `s ≠ 1`).
- `riemannZeta_ne_zero_of_one_le_re`.
- `ArithmeticFunction.LSeriesSummable_zeta_iff` (`NumberTheory/LSeries/Dirichlet.lean:274`).
- `ArithmeticFunction.LSeriesSummable_mul` (`LSeries/Convolution.lean:204`).
- `LSeriesSummable.of_re_le_re` (`LSeries/Basic.lean:240`).
- `LSeriesSummable_of_le_const_mul_rpow` (`LSeries/Basic.lean:346`: `x < Re s` and `‖f n‖ ≤ C n^{x−1}`, as glossed).
- `LSeries.abscissaOfAbsConv_le_of_forall_lt_LSeriesSummable` (`LSeries/Convergence.lean:64`).
- `LSeries.abscissaOfAbsConv_le_of_le_const_mul_rpow` (`:89`: `‖f n‖ ≤ C n^x` gives `≤ x + 1`, so `φ(n) ≤ n` gives `2`).
- `LSeries.abscissaOfAbsConv_le_of_le_const` (`:110`, `≤ 1`).
- `Nat.Primes.not_summable_one_div` (`NumberTheory/SumPrimeReciprocals.lean:124`).
- `EulerProduct.eulerProduct_tprod` (`NumberTheory/EulerProduct/Basic.lean:225`, hypotheses as glossed).
- `Summable.clog_one_sub` (`NumberTheory/EulerProduct/ExpLog.lean:28`).
- `HasSum.cexp` (`Analysis/SpecialFunctions/Exp.lean:530`).
- `Complex.cpow_def_of_ne_zero` (`Analysis/SpecialFunctions/Pow/Complex.lean:40`).
- `Ring.add_choose_eq` (`RingTheory/Binomial.lean:525`, with `Commute r s`).
- `Ring.choose_neg'` (`:448`, `choose (−r) n = n.negOnePow • multichoose r n`).
- `ArithmeticFunction.IsMultiplicative.mul` (`NumberTheory/ArithmeticFunction/Defs.lean:501`).
- `LSeries_convolution'`, `ArithmeticFunction.LSeries_zeta_eq_riemannZeta` and `Ring.multichoose`, with `BinomialRing ℂ` found by instance search.

**Tau Ceti.** `TauCeti.hasSum_multichoose_mul_geometric_complex_of_norm_lt_one` (`TauCeti/Analysis/Analytic/Binomial.lean:46`): for complex `r`, `z` with `‖z‖ < 1`, `HasSum (multichoose r n · zⁿ) (1/(1 − z)^r)`. I read this at the pin; it is not elaborated, since its object file is not built on this host.

**File attributions.** The README attaches a file to the name or names just before it. Under that convention, these names correctly carry no file:

- `LSeriesSummable.of_re_le_re` and `LSeriesSummable_of_le_const_mul_rpow` (line 278, both in `LSeries/Basic.lean`);
- `differentiableAt_riemannZeta` (line 270, in `LSeries/RiemannZeta.lean`).

Layer 11's *Needs:* lines cite `ArithmeticFunction.IsMultiplicative.mul`. The From Mathlib section lists `ArithmeticFunction.IsMultiplicative`, and untouched *Needs:* lines elsewhere do the same (`MeasureTheory.integral_prod`, lines 873 and 960), so this is consistent with the README's practice.

### Sources: the seeded targets in the changed passages

- **7.2 and the 7.3 windowed error (DLMF).** The cached `dlmf-ch6` text holds only the chapter's table of contents. I read the open NIST pages instead:
  - 6.2.19 is `Si(z) = π/2 − f(z) cos z − g(z) sin z`.
  - 6.12.5–6.12.6 expand `f` and `g` with remainders.
  - 6.12.7–6.12.8 are the integral forms `R_n = (−1)^n ∫_0^∞ e^{−zt} t^{2n}/(t² + 1) dt` (with `t^{2n+1}` for `g`). The text after them says that for real positive `z` the remainder is bounded by the first neglected term and has its sign. At `n = 0` this gives `0 < f(x) ≤ 1/x` and `0 < g(x) ≤ 1/x²`, as 7.2 says.
  - §6.16(i) puts the first maximum of `Si` at `x = π`.
- **11.2.** Read at lines 3173–3184 and 3309–3323 (above). Tenenbaum Chapter II.5 is settled as uncertified; see Not verifiable.
- **11.4, a changed passage outside the sample.**
  - Lines 3379–3390: Theorem 9.1.38, `2^{ω(n)} ≤ σ₀(n)` for `n ≠ 0`.
  - Lines 3391–3393: Theorem 9.1.39, the comparison test, labelled as the summability of the `2^ω` series (see Source issues).
  - Lines 3498–3500: Theorem 9.1.51, the `μ²` series converges on `Re s > 1`.
  - Lines 3626–3631: Theorem 9.1.70, `Re s > 2`, `φ(n) ≤ n`.
  - Printed pages are PDF − 1: pp. 80, 83, 84, 87 and 90.
- The other seeded targets (7.1, 7.3 Laplace and Mellin forms, 7.4, 8.1, 8.1b, 8.2, 8.3, 9.1–9.3, 10.3, 13.1, 13.2) are untouched by the diff. They were verified at their lines in the previous report.

### Cross-roadmap citations, overlaps, ownership

- The diff adds no cross-roadmap citation. `roadmaps resolve` on the README at this head reports no cross-roadmap citation and no Lean name found nowhere.
- The overlaps tool reports no open pull request that changes this roadmap, no dropped id, and no id that only an open revision defines.
- The change adds no definition or carrier, so no new ownership question arises. The 55 citations resolved in the previous report are in untouched text.

### The adversarial pass

The new rows are computed in pure-Python scratch code: a sieve to `10⁷`, factorizations to `2·10⁵`, and Borwein's algorithm for `ζ(σ + it)`, which reproduces `ζ(2) = 1.6449340668`. Rows marked "r2" are carried unchanged from the previous report; their statements are untouched by the diff.

| Statement | Instances tried | Values computed (left vs right) | Result | Change |
|---|---|---|---|---|
| 7.3 windowed error: new locator, same statement | the inputs at `h = 1_[0,1]` and `h = e^{−σu}1_{u≥0}`; 7.2 at `x = π`; DLMF 6.12.7 at `n = 0` | `sup|h| = 1 ≤ V = 2` for both (in fact `= V/2`); `|π/2 − I(π)| = 0.2811 ≤ 2/π = 0.6366`; `f(x) = ∫e^{−xt}/(1 + t²) dt ∈ (0, 1/x]` | the cited inputs hold | none |
| 11.2 `d_z ⋆ d_w = d_{z+w}` (new reason) | `z = ½`, `w = i`, `a = 0..4`; the sign at `a = 3` | `a = 3`: `Σ mc(½, i) mc(i, 3 − i) = −0.4375 + 0.7916667i = mc(½ + i, 3)`; `a = 4`: `−0.5807292 + 0.5833333i` on both sides; `Ring.choose(−½, 3) = −0.3125 = (−1)³ mc(½, 3)` | holds | none |
| 11.2 `abscissaOfAbsConv_sigmaC` (new route and locator) | prime-term bounds at `ν = 1 + 2i, −½ + i, 0, 2i`, `p = 2, 3, 5, 7`; `ν = i` as `σ → 1⁺` | `|1 + p^ν|` vs the bound: `2.39454 ≥ 1` and `6.30544 ≥ 6` (`ν = 1 + 2i`); `0.93054 ≥ 0.29289` (`ν = −½ + i`, `p = 7`); `2 = 2` (`ν = 0`); `0.07726 ≥ 0.00298` (`ν = 2i`, `p = 5`). `Σ_{p≤10⁷} cos(log p) p^{−σ} = 0.19713, 0.17958, 0.16505, 0.15918` at `σ = 1.1, 1.05, 1.02, 1.01`; with the `k ≥ 2` terms `0.13453, 0.10725, 0.08624, 0.07809` vs `log|ζ(σ + i)| = 0.13756, 0.11536, 0.10067, 0.09555 → log|ζ(1 + i)| = 0.09031` (the gap is the truncation at `10⁷`) | holds; the cosine sum stays bounded | none |
| 11.2 `LSeries_generalizedDivisor` (new route and locator) | local factor at `z = 0.3 + i`, `X = ¼`; the series at `s = 2`, `z = ½, 0.3 + i, −1`, partial sums to `2·10⁵`; the logarithm identity at `s = 2` | local factor: `Σ mc(z, a) Xᵃ = (1 − X)^{−z} = exp(−z log(1 − X)) = 1.0453382 + 0.3093053i`. Series vs `exp(z Σ_p −log(1 − p^{−2}))`: `1.2825491` vs `1.2825496`; `1.0201808 + 0.5542852i` vs `1.0201798 + 0.5542838i`; `0.6079271` vs `0.6079273 = 1/ζ(2)` | holds (the gaps are tails) | none |
| From Mathlib: gloss of `eulerProduct_log_eq_LSeries` (new) | trivial character of level 1, `s = 2` | `Σ_p −log(1 − p^{−2}) = 0.497700297`; `L(Λ/log, 2)` over prime powers `≤ 10⁴` is `0.497690`; `log ζ(2) = 0.497700302` | holds | none |
| 11.2 `abscissaOfAbsConv_generalizedDivisor` (new route) | `d_z(p) = mc(z, 1)` at `z = 0.3 + i` and `−1`; `Σ_{p≤N} 1/p` | `0.3 + i` and `−1`; `2.1981, 2.7053, 3.0414` at `N = 10³, 10⁵, 10⁷` (growth `log log N`); at `z = 0` the abscissa is `⊥`, so `z ≠ 0` is needed (r2) | holds | none |
| 11.4 abscissas (new route and locators) | `2^{ω(n)} ≤ τ(n)` for `n ≤ 2·10⁵`; `(p − 1)/p² ≥ 1/(2p)` for `p ≤ 2·10⁵`; partial sums; the wrong abscissa `1` for `φ` | `2^{ω(n)} ≤ τ(n)`: no violations (`n = 12`: `4 ≤ 6`). `(p − 1)/p² ≥ 1/(2p)`: no violations (`p = 2`: `¼ = ¼`; `p = 3`: `0.2222 ≥ 0.1667`). `Σ_{n≤N} φ(n)/n² = 4.897, 6.297, 7.696` at `N = 10³, 10⁴, 10⁵`, step `1.3996 ≈ (6/π²) log 10 = 1.3998`. Wrong abscissa: `Σ φ(n)/n^{1.5} = 37.9, 121.0, 383.9` | holds: `2`, not `1` | none |
| r2: Conventions | `𝓕1_[0,1](½)`; `4^{½}`; `log ζ(2)`; Cesàro at `N = 2`; `LSeries 1 1` | `−2i/π`; `2`, so `σ_{½}(4) = 3 + √2`; `0.497700`; `½`; junk `0` | hold | none |
| r2: 7.1 decay | `1_[0,1]` at `ξ = ½`; `ξ = 0`; `1_[0,∞)` | `2/π` vs `2/π`; `1` vs junk `0`; `V = 1`, limit `1` | holds; `ξ ≠ 0` needed | none |
| r2: 7.1 derivative and `C²` forms | tent at `ξ = ½`; `1/(1 + t²)` | `4/π²` vs `4/π²`; `π ≤ 6.442` | hold | none |
| r2: 7.2 | `x = 5`, `π`, `−1` | `|π/2 − I(5)| = 0.020865 ≤ 0.4`; `I(π) = 1.85194 > π/2`; at `−1`, `2.517` vs `−2` | holds; `x > 0` needed | none |
| r2: 7.3 `tendsto_truncated_mellinInv` | `1_(0,1]`, `σ = 1`, `T = 10`; `σ = 0` | `0.46827 → ½`; `0` vs `½` | holds; convergence needed | none |
| r2: 7.3 windowed error, values | `e^{−σu}1_{u≥0}` at `(σ, T) = (1, 10), (10, 1), (1000, 1)`; `1_[0,1]`, `u₀ = ½` | `0.0317, 0.4683, 0.4997` vs `0.894, 8.94, 89.4`; `0.013283` vs `0.8C` | holds | none |
| r2: 7.4 Brown | `W = 1`, `G = e^{−πiξ/2}` on `(1, 3)`, `t = ¼` | error `4` vs `2∫|G| = 4` | holds with equality | none |
| r2: 8.1 | `1/s` on `[−1, 1]²`; `1/s²`; `exp(1/s)` | `2πi = 2πi·1`; `0`; `2πi` vs junk residue `0` | holds; meromorphy needed | none |
| r2: 8.1 U-shaped form | `1/s`, `σ = ±1`, `T = 1` | `π/2 = −π/2 − π + 2π` | holds | none |
| r2: 8.1a | `exp(1/s)`, `r = ½`; overlapping circles | `2πi` on both sides; `4πi` vs `2πi` | holds; disjointness needed | none |
| r2: 8.1b | `eˢ/s`, `w = 0.5 + 0.5i`, `T = 2` | `−0.852950 + 3.701501i` on both sides | holds | none |
| r2: 8.2 | `−2z/(1 − z)`, `k = 1, 2, 3`; `k = 0` | `8, 32, 192` vs `8, 32, 192`; `1 ≤ 0` | holds with equality; `k ≥ 1` needed | none |
| r2: 8.3 | `(z − 0.3)e^{2z}`; `z − ε` | `M = 2.847`, left side `2`; `1/ε` unbounded without the zero sum | holds | none |
| r2: 9.1 | `e^{−t}`, `1_(0,1]`, `x = z = ½` | `0.8646647` both; `3.5449077` both | holds | none |
| r2: 9.2 | `(x − 1)²(2 − x)²` | `∫ν = 1/30`; the derivative identity | holds | none |
| r2: 9.3 `deltaSpike` | `ε = ½` | support `[0.7071, 1.4142]` vs wrong `[¼, 4]` | holds | none |
| r2: 9.4 `mellin_smoothCutoff` | `ν = (2/3)x` on `[½, 2]`, `ε = ½`, `s = 1.3 + 2i` | `0.329708 − 0.303958i` both; the opposite convention gives `0.371777 + 0.504363i` | holds | none |
| r2: 9.4 decay | `k = 1`, `s = 1 + iT` | `≍ 1/(T(1 + εT))` | holds | none |
| r2: 10.1 | `a ≡ 1`, `X = 2` | difference `½` vs `C(2ε + 1)`; without `+1`, `→ 0` | holds; `+1` needed | none |
| r2: 10.2 `inghamExponent` | `η = 1/log t`, `log x = 100`; `η ≡ ¼` | `20`; `26.0986` | holds | none |
| r2: 10.2 transfer | `η = c/log t` | `η(3) ≤ ½` iff `c ≤ 0.5493`; `x^{−η(T+3)} = 1/T` | holds | none |
| r2: 10.3 | `K = ℚ`, `χ = 1`; trivial character mod `2` | residue `+1 = δ_χ`; zeros on `Re s = 0` lie outside `R_c` | holds | none |
| r2: 11.1 | `λ`, `μ`, `μλ` | `λ(4) = 1`; `μ(4) = 0 ≠ 1`; `0` | holds | none |
| r2: 11.2 `sigmaC` values and `LSeries_sigmaC` | `(1, 6)`, `(−1, 6)`, `(½, 4)` | `12`, `2`, `4.41421` | holds | none |
| r2: 11.3 Ramanujan | `α = 1`, `β = 0`, `s = 3` | `3.770344` vs `3.770497` (tail) | holds | none |
| r2: 11.4 series | `s = 3, 4` | `1.4203083`, `1.1815649`, `0.8463352`, `1.1106265` equal the zeta quotients | holds | none |
| r2: 12.1 | `(−1)ⁿ`; `aₙ = 1`; shift `a₀` | means `0.5`; divergence; both limits move by `d` | holds | none |
| r2: 13.1 `factorialFactorCount` | `(16, 4)`, `(4, 4)`, `B = n = 10`, `B = 100` | `2`, `3`, `7`, `4` | holds | none |
| r2: 13.1 asymptotics | lower bound | `t ≥ n/2 − n/(2 log n) + O(1)` | holds | none |
| r2: 13.2 predicates and transfer | `H = 30, 33`; `Δ = 2`, `x₀ = 2`; `Δ ≤ 0`; `0 < Δ < 1` | `30 = 7 + 23`, `33 = 3 + 7 + 23`; `OddGoldbachUpTo 56`; empty windows | holds | none |
| r2: 13.2 Examples | Ramaré–Saouter; Kadiri–Lumley | `113 255 999 999 999 999 886 744 004`; `e⁵⁹ < 1.1325·10²⁶ < e⁶⁰` | true | none |

## Not verifiable

- `tenenbaum2015`, Chapter II.5, now cited for the complex-`z` forms of `LSeries_generalizedDivisor` and `abscissaOfAbsConv_generalizedDivisor`. It is a settled uncertified text, cited by locator only. The new route proves both statements from pinned declarations, and the table checks them numerically.
- The other settled uncertified texts (`montgomeryvaughan2007`, `titchmarsh1986`, `iwanieckowalski2004`, `apostol1976`, `hardy1949`, `katznelson2004`, `brown1967`) are cited only in untouched text.
- `dlmf-ch6`: the cached extraction holds only the chapter's contents. The cited equations were read on the open NIST pages for §§6.2, 6.12 and 6.16 instead.

## Source issues

- **Misprint** in kontorovichtao-pntplus at Theorem 9.1.39, printed p. 84 (line 3391): the source states a generic comparison test for L-series, while its label names the summability of the `2^ω` series; it should state that `Σ 2^{ω(n)} n^{−s}` converges absolutely for `Re s > 1`, by Theorem 9.1.38; affects nothing.
