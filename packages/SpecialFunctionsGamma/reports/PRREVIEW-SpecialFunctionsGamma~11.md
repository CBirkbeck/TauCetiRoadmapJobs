# Review of SpecialFunctionsGamma (pull request #2191 at 2d59dd5)

**Verdict:** accepted

**Summary.** Accepted: no finding. The two false sentences of the previous review (the Check of 5.1 and the route of 9.1) are repaired, and every stated theorem of the README and of `Suggested.lean` was recomputed at fresh parameters and agrees; the sampled DLMF and Whittaker–Watson locators match the text. There are two small corrections and no format note, none blocking. The human reviewers have three questions: the licence of the prior formalization, the books that could not be read, and three targets that Tau Ceti's main branch already proves after the pin.

## C01 — Prym's decomposition (3.1) is the case `z = 1` of two items of SpecialFunctionsEiLiErfIncompleteGamma on main, which the README does not name

A reader of "What it does not own" takes the third bullet of 3.1 (`TauCetiRoadmap/SpecialFunctionsGamma/README.md`, lines 389–392) for an identity with no relative. On main, `TauCetiRoadmap/SpecialFunctionsEiLiErfIncompleteGamma/README.md` states in 1.1 (line 465) the series `γ*(a, z) = Γ(a)⁻¹ Σ (−z)^k/(k!(a + k))` for `a ∉ −ℕ`, and in 1.3 (lines 505–507) `Γ(a, x) = ∫_x^∞ t^{a−1} e^{−t} dt` for `x > 0` and `γ(a, z) + Γ(a, z) = Γ(a)` for `a ∉ −ℕ`. At `z = 1` these three give `Γ(a) = ∫₁^∞ t^{a−1} e^{−t} dt + Σ_k (−1)^k/((a + k) k!)`, which is DLMF 5.9.4 with the same exclusion.

The statement here is true and its own route (split Euler's integral at `1`) is two lines, so both can stay. Add the clause that says so, in 3.1 or under "What it does not own": the series of the lower incomplete Gamma function and the relation `γ + Γ(a, ·) = Γ(a)` are SpecialFunctionsEiLiErfIncompleteGamma 1.1 and 1.3, and Prym's decomposition is their value at `z = 1`.

## C02 — four series targets are stated in `Suggested.lean` as `tsum` equations without the convergence the README attaches to them

The Conventions (line 125) say "An absolutely convergent series is a `HasSum`", 6.1 attaches "the series converging absolutely" to `Complex.Gamma_one_add_eq_exp` (line 824), and the file's docstring says each statement has "every conclusion the README attaches to it". In the file, `Complex.Gamma_one_add_eq_exp`, `Complex.digamma_one_add_eq_tsum`, `Complex.digamma_one_add_eq_tsum_odd` and the sum in `Complex.Gamma_eq_integral_Ioi_one_add_tsum` are equations in `∑'` with no `Summable` conjunct. The statements are true (all four were recomputed); they say less than the prose, since a `tsum` of a non-summable family is `0` and an equation does not exclude that by itself.

Either add `Summable …` as a conjunct, as `Complex.summable_gaussSeries` does for 1.2, or say in the Conventions that `Suggested.lean` states these four as `tsum` equations and that their absolute convergence is a README target.

## Previous findings

- R01 (the Check of 5.1): repaired. Lines 747–750 now read "`Σ_n (1/(n + ½) − 1/(n + 1)) = Σ_n 1/((2n + 1)(n + 1)) = ψ(1) − ψ(½) = 2 log 2`" and add that the term `1/((n + ½)(n + 1))` sums to `4 log 2`; both values recomputed.
- R02 (the route of 9.1): repaired. Lines 1109–1111 read "The second is the first at `w = c`, `z = 1 − c`, with `b + 1` in place of `b`"; the Möbius sentence and the Mellin inversion are gone, and the Needs no longer list `mellinInv_mellin_eq`.
- C01, C02 (the description): repaired. ExplicitNumberFields is listed with the suppliers on main ("six roadmaps on main", line 50); the description gives 81 theorems and four Tau Ceti modules and says that the residue of `Γ` is consumed.
- C03: repaired. `TauCeti.Probability.lintegral_dirichletChartPDF_eq_one` is in the Inputs (lines 1386–1388) and under "From Tau Ceti" (lines 1528–1531).
- C04: repaired. The Summary (lines 8–9) and "How to read the build" (line 69) now describe the extension from `Re z > 0` by the recurrence.
- C05: repaired. 10.1 (lines 1219–1222) and "What it does not own" (lines 1448–1450) name PositivityOfDirichletSeriesWithKernels §6.3; that README's line 902 names 10.1 here.
- C06: repaired. `Complex.integral_vertical_beta` and `Complex.integral_vertical_beta_one_sub` carry `Integrable …`, the four `ψ` integrals of 3.3 and the two statements of 3.4 carry their integrability, and the Conventions (lines 131–135) say where the conjunct stands. Every statement without the conjunct was checked: its right side does not vanish in the stated range, or its integrand is continuous on a compact interval.
- N01, N02: taken up ("above", line 1359; Grafakos and Katznelson for the test of 4.6, lines 687–689).

## Verified sound

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| 1.2 Gauss series off the poles (headline) | recurrence from `Re z > 0`; pole `z = −m` | route gives the series at `z` from ExplicitNumberFields 1.1a at `z + n`; at a pole the single term is Lean's `0`, still summable | holds; DLMF 5.7.6, 5.15.1 read |
| 1.3 series of `ψ⁽ⁿ⁾` (sampled) | `n = 3`, `z = −0.5 + 0.3i` | `6 Σ (k + z)⁻⁴ = −56.8591548398 − 0.8664766431i` / `ψ‴(z)` by recurrence and expansion, the same; `d/dz ψ″` by difference agrees to `10⁻⁵` | holds; DLMF §5.15 read |
| 1.4 reflection, multiplication | `n = 2`, `z = 0.3 + 0.4i`; `n = 2`, `m = 3`, `z = −0.2 + 0.5i` | `−14.7455330488 − 10.4838111082i` both; `0.0795115665 − 0.2685665629i` both | holds; DLMF 5.15.5–7 read |
| 1.5 values (sampled) | `ψ(7/2)`; `ψ‴(½)`, `ψ‴(1)`; `ψ′(5/2)` | `1.1031566406` both; `97.409091034 = π⁴`, `6.4939394023 = 6ζ(4)`; `0.4903577561 = π²/2 − 4(1 + 1/9)` | holds; DLMF 5.4.15, 5.15.2–4 read |
| 2.1 five forms | complex `a`, `b`; algebraic form at `z = −0.5 + 0.2i` | cosine `−1.47108598 + 2.51772207i`; exponential `24.5084772 − 21.8382355i`; hyperbolic `0.4944395842 − 0.3512972774i`; algebraic `−1.0694319734 − 0.6675305867i`; all both sides | holds; DLMF 5.12.2, 5.12.4–7 read |
| 2.2 Dirichlet (headline) | `n = 0`; `n = 2`, `z = (1.3, 0.6 + 0.2i, 0.9)` | `1 = Γ(z₀)/Γ(z₀)`; `0.7166165626 − 0.3585880139i` both | holds; DLMF 5.14.1–2 read |
| 2.3 Liouville (headline) | `n = 0`; `n = 2`, `a = (2, 0.5)`, `p = (3, 0.7)`, `α = (1.2, 0.8 + 0.3i)` | `1 = 1/Γ(1)`; `0.6984996771 − 0.5382124314i` both | holds |
| 3.1 scaled, split, subtracted (sampled) | `(μ, ν, z) = (3, 1.5+0.5i, 1+i)`; `(z, c) = (0.3+0.8i, 1.7)`; Prym `z = −0.5+i`; `n = 1`, `z = −1.5+0.3i` | `0.3823901129 − 0.3674632586i`; `−0.07326793 − 0.64025828i`; `−0.4602521505 − 0.0705685420i`; `1.59792728 + 0.34393464i`; all both sides | holds; DLMF 5.9.1, 5.9.3–5, Whittaker–Watson §12.21 read |
| 3.2 sine integral | `z = −0.6 + 0.4i` | `Γ(z) sin(πz/2) = 1.7453743190 − 1.1845205784i = π/(2Γ(1 − z) cos(πz/2))` | holds; DLMF 5.9.6–9 and ranges read |
| 3.3 integrals of `ψ` | `z = 0.6 + 0.9i` | 5.9.13, 5.9.15: `−0.1558473196 + 1.4356546659i = ψ(z)`; 5.9.16: `0.4213683453 + 1.4356546659i = ψ(z) + γ` | holds; DLMF 5.9.13–16, 5.9.18 read |
| 3.4 derivatives and integrals of `Γ` (sampled) | `n = 2, 3`, `z = 1.5 + 0.5i`; segment `c = 0.7 + 0.2i`, `z = 2 + i` | `0.48645504 − 0.16969226i`, `0.1310556 + 1.0742242i` against differences of `Γ`; `1.0387173250 + 0.6236870844i` both | holds; DLMF 5.9.19–20 read |
| 3.5 expansion of `ψ⁽ⁿ⁾` | `n = 2`, `z = 8e^{2.5i}`, `N = 1, 2, 3` | remainders `6.33·10⁻⁷`, `9.87·10⁻⁹`, `2.66·10⁻¹⁰` / next terms `6.36·10⁻⁷`, `9.93·10⁻⁹`, `2.79·10⁻¹⁰` | holds; DLMF 5.15.8–9 read |
| 4.1 Wielandt, limit characterization (headline) | `Γ sin 2πz`; `Γ(1 + sin²πx)` | functional equation holds to `10⁻¹²`, `|F(1.5 + 3i)| = 5.258·10⁶`; ratio at `n = 10⁶`, `x = 0.3`: `1.6545083` / `1.6545085` | holds; both controls fail as stated |
| 4.2 multiplication (headline) | `n = 5`, `z = −0.37 + 0.6i`; a pole | `−2.2601502299 − 0.8653782533i` both; `ψ`: `1.3371939050 + 2.2380924572i` both; both sides `0` iff `nz ∈ −ℕ` | holds; DLMF 5.5.6, 5.5.9 read |
| 4.3 Pochhammer duplication, Lah (sampled) | `a = 0.3 + i`, `2n = 6`, `2n + 1 = 7`; `x = 0.7 − 0.2i`, `n = 0, 1, 3, 5` | differences `≤ 5·10⁻¹³`; both expansions `≤ 3·10⁻¹⁴`, exact at `n = 0, 1` | holds; DLMF 5.2.8–9 read |
| 4.4 vertical lines | `y = 0.7` | `Im ψ(iy) = 2.3242019221`, `Im ψ(½ + iy) = 1.5326270326`, quarter product `0.4987059859 − 0.4865877659i`; all both sides | holds; DLMF 5.4.4–5, 5.4.16–18 read |
| 4.5 Gauss's digamma theorem (sampled, headline) | `p/q = 3/7` | `ψ(3/7) = −2.3658187573` / formula `−2.3658187573` | holds; DLMF 5.4.19 read |
| 4.6 Kummer (headline) | `x = 0.37`, mean of partial sums near `N = 2·10⁶`; control `π(½ − x)` | `−0.164282634523` / `−0.164282634524`; control: sums `0` at `x = 0`, `f(0) = π/2` | holds |
| 5.1 rational series | `a = (0.3 + 0.2i, −1.5, 2.5)`, `A = (1, 2 − i, −3 + i)`; the Check | `2.0290484930 + 1.0066279136i` both; Check: `2 log 2`, and `4 log 2` for the doubled term | holds |
| 5.2 | `y = 0.7` | `Im ψ(1 + 0.7i) = 0.8956304935 = Σ y/(k² + y²) = −1/(2y) + (π/2) coth πy` | holds; DLMF 5.7.7–8 read |
| 5.3 trigamma series (sampled) | mean of partial sums to `4001`; `2·10⁴` terms plus tail | `−1.23370053` / `−π²/8 = −1.23370055`; `1.2020569025` / `ζ(3) = 1.2020569032` | holds; DLMF 5.16.1–2 read |
| 5.4 balanced products (sampled) | `a = (0.5 + i, 1.5 − i, −0.3)`, `b = (1, 0.2 + 0.5i, 0.5 − 0.5i)`, `2·10⁵` factors; `m = 0` | `−1.065976 − 0.655722i` / `−1.065973 − 0.655727i`; empty product `1` | holds; DLMF 5.8.4–5, Whittaker–Watson §12.13 read |
| 6.1 | `z = 1.3 − 0.9i` (outside the unit disk) | `Γ(1 + z) = 0.7929814763 − 0.5116063157i` / `0.7929814770 − 0.5116063127i`; odd series `0.7056127525 − 0.4558196631i` both | holds; DLMF 5.7.3–5 read |
| 6.2 reciprocal Gamma series (sampled) | coefficients from the circle `|z| = 1`; `k = 3, 5, 6` | `c₁ = 1`, `c₂ = 0.5772156649`, `c₃ = −0.6558780715`; `(k − 1)c_k`: `−1.3117561430`, `0.6661544455`, `−0.2109886728` both | holds; DLMF 5.7.1–2 read |
| 7.1 | scan `x ∈ [0.01, 10]` | maxima `2.0000000000` and `2.0000000000`, at `x = 1` | holds; DLMF 5.6.2–3 read |
| 7.2 Gautschi, Kershaw (sampled) | `x ∈ [0.01, 10]`, `s ∈ {0.01, …, 0.99}`, 13 993 pairs | no violation of any of the four inequalities | holds; DLMF 5.6.4–5 read |
| 7.3, 7.4 | 8 values of `x` (4 negative), 4 of `y`; 45 triples `(a, b − a, z)`; control `x = 0.3` | no violation; control: lower bound fails at `x = 0.3`, `y = 1` (ratio `0.598`) | holds; DLMF 5.6.6–8 and hypotheses read |
| 8.1 Hankel (headline) | `z = −1.3 + 0.7i`, `ε = 0.5, 2`; `z = 2.4 − 0.3i`; `z = −2` | `0.7310625565 − 1.2820501778i` for both `ε` / `1/Γ(z)` the same; `0.8079120755 + 0.1612786015i`; `1.5·10⁻¹⁶` / `0` | holds, README and Lean |
| 8.2 Temme | `z = 1`, `0.4 + 2i`, `3 − i` | `1.0000000000`; `7.2173713563 + 6.7530245000i`; `0.3539567320 + 0.4922625549i` / `1/Γ(z)` | holds; DLMF 5.9.2_5 read |
| 8.3 loops, Pochhammer (sampled) | loop at `1`: `(a, b, ε) = (0.6+0.4i, −1.3+0.5i, 0.4)`; loop at `0`: `(−0.4+0.3i, 0.7−0.2i, 0.5)`; Pochhammer at four `(a, b, ε)` | `−1.9029197522 − 0.2827037943i`; `0.8065087658 + 0.9644758202i`; `1.5407284037 − 4.7067074538i`, `−1.2765247249 + 1.3793078010i`, `0` at `a = 2` and at `(−1, −2)`; all both sides | holds, README and Lean; DLMF 5.12.10–12, Whittaker–Watson §12.43 read |
| 9.1 vertical Beta (sampled) | `(a, b, w, z) = (2.5+0.3i, 1.8−0.2i, 1+0.5i, 0.7−0.3i)`; `b = 0`; second at `(a, b, c) = (1.9+0.3i, 1.2−0.2i, 0.3)` | `0.3398140086 − 0.1816968321i` both; `4·10⁻¹⁰` / `0`; `2.1490770303 + 0.2081751662i` both | holds; DLMF 5.12.8–9 read |
| 9.2 Barnes Beta, modulus (sampled, headline) | `(a, b, c) = (0.7+0.2i, 1.1−0.3i, 0.2)`, `z = 0.5+0.8i` and `−0.5+0.1i`; modulus `(a, b) = (0.8, 1)` | `0.2631412194 − 0.0426173843i`; `0.1013381650 + 1.0543750596i`; `0.3885003297`; all both sides | holds; DLMF 5.13.1–2 read |
| 9.3 Ramanujan | `(2, 1.5 + 0.3i, 2, 1.5 − 0.2i)` | `1.7555091769 + 0.0214555170i` / `1.7555091771 + 0.0214555174i` | holds; DLMF 5.13.4 read |
| 9.4 de Branges–Wilson (sampled, headline) | `a = (0.5 + 0.2i, 0.7, 1 − 0.3i, 1.2)` | `0.2128955750 − 0.0300296934i` both | holds; DLMF 5.13.5 read |
| 10.1 Carlson, Landau (sampled) | `sin πz`; Landau: split at `g = 1` | `|sin(5πi)| e^{−5π} = 0.5`: type exactly `π`; on `{g > 1}` monotone in `s`, on `{g ≤ 1}` Taylor coefficients at `s*` of sign `(−1)^k` | holds; the relative on main is named |
| 10.2 Selberg, Aomoto (headline) | `n = 2`, `(m, a, b, c)`: `(1, 1.5, 2, 1)` exactly; `(1, 1.5, 2, 0.5)`; `(0, 0.8+0.3i, 1.2−0.2i, −0.3+0.4i)`; `(1, 0.35, 0.9, −0.3)` | `0.0035181749`; `0.0084656085`; `−0.52159733 − 0.98060808i` / `−0.52159697 − 0.98060814i`; `7.260222` / `7.260225` | holds; DLMF 5.14.4 and its range read |
| 10.3 Laguerre, Mehta (headline) | `n = 2`, `m = 1`, `a = 1.5`, `c = 1`; Mehta `n = 2`, general `c` | `Γ(4.5)Γ(1.5) − Γ(3.5)Γ(2.5) = 5Γ(2.5)Γ(1.5)` both; `4^c Γ(c + ½)/√π = Γ(1 + 2c)/Γ(1 + c)` by duplication | holds; DLMF 5.14.5–6 read |
| 10.4 Dyson (headline) | `n = 2`, `b = −0.3 + 0.2i`; `n = 3`, `b = 2` | `0.90793623 − 0.30917934i` / `0.90793608 − 0.30917956i`; constant term `6!/(2!)³ = 90 = Γ(7)/Γ(3)³` | holds; DLMF 5.14.7 read |

- Source locators checked against the text, 63: DLMF 5.2.8–9, 5.4.4–5, 5.4.15–19, 5.5.6–7, 5.5.9, 5.6.2–8, 5.7.1–8, 5.8.4–5, 5.9.1–9, 5.9.13–16, 5.9.18–20, 5.9.2_5, 5.12.2, 5.12.4–12, 5.13.1–2, 5.13.4–5, 5.14.1–7, 5.15.1–9, 5.16.1–2 (Release 1.2.8); Whittaker–Watson §§12.13 (pp. 238–239), 12.15 (p. 240), 12.16 (p. 241), 12.21 (p. 243), 12.22 (p. 244), 12.42 (p. 256), 12.43 (p. 256), 12.5 (p. 258).
- Library declarations opened at the pin: `Mathlib/Analysis/SpecialFunctions/Gamma/Digamma.lean:50–124` (no series, no polygamma, junk value `digamma 0 = 0` at line 53); `TauCeti/Analysis/SpecialFunctions/Gamma.lean`, `Beta.lean`, `Integrals/` and `TauCeti/MeasureTheory/Integral/Gamma.lean` (real Beta and Gamma integrals only). Neither library has a polygamma function, a multiplication formula, Wielandt, Gautschi, a Hankel loop, a Lah number or a Selberg integral at the pin.
- Cross-roadmap citations resolved on main, 22: ZerosOfLFunctions 1.1–1.4, 1.3a; AsymptoticExpansions 1.1, 1.3, 4.1–4.3, 8.6; SpecialFunctionsHypergeometric 4.2, 6.3; SpecialFunctionsParabolicCylinder 6.6(a), (b); AnalyticNumberTheoryPartI §1.8a; ExplicitNumberFields 1.1a; SpecialFunctionsAiry 7.1; ConformalMappingPartII 5.6; GlobalHolomorphicFunctions 6.1; AnalyticNumberTheoryPartII §4.3; ExplicitZetaBounds 1.1–1.3, 2.4–2.5; RandomMatrices 5.2–5.3; PositivityOfDirichletSeriesWithKernels §6.3. No open pull request drops or renumbers a cited id.
- Dependency check: `depcheck: 106 roadmaps, 1219 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file outside the folder changed.
- Automatic checks: the worker's run on this head reports every check passed. Elaboration of `Suggested.lean`: 81 `sorry` warnings and nothing else; 81 theorems, 6 definitions, no `set_option`, no `lemma`, no machine path. Each declaration was read against its README item and the elaborated signatures were read for lost binders, natural-number division and truncated subtraction: none (every `n − 1`, `k − 1`, `n − k` is guarded by a hypothesis or a range).
- One-tactic probe (`rfl`, `simp`, `norm_num`, `infer_instance`, `simp` with the six definitions unfolded) on a probe copy, all 81 theorems: none closes. No padding found.
- Ownership against open pull requests, by object (polygamma, Wielandt, Gauss multiplication, Gautschi, Kershaw, Hankel loop, Pochhammer contour, Carlson, Selberg, Mehta, Dyson, Lah, Kummer's series, pointwise convergence of Fourier series, de Branges–Wilson, Ramanujan): no second owner. LiCoefficientsArithmeticFormula (open) derives `ψ⁽ᵐ⁾(½)` as a step of a route and says so; SpecialFunctionsRankOneSymmetricSpaces (open) consumes 10.1 in the form stated here.
- Overlap check: read SpecialFunctionsHypergeometric, SpecialFunctionsParabolicCylinder, SpecialFunctionsEiLiErfIncompleteGamma, AsymptoticExpansions, SpecialFunctionsCoulomb, SpecialFunctionsGeneralizedHypergeometric, SpecialFunctionsBessel, SpecialFunctionsConfluent; nothing shared beyond the cited sections (periodic Carlson lemma, Mellin–Barnes integral and Barnes's first lemma: SpecialFunctionsHypergeometric 4.2, 6.3; the product 5.8.3 and the residue of `Γ`: SpecialFunctionsParabolicCylinder 6.6; the Gamma bound on strips: AsymptoticExpansions 8.6). One relative is not named: the series of `γ(a, z)` and `γ + Γ(a, ·) = Γ(a)`, owned by SpecialFunctionsEiLiErfIncompleteGamma 1.1, 1.3, of which Prym's decomposition is the case `z = 1` (C01).
- Source independence: 9 passages compared with 2 sources (DLMF: the prose around 5.2.9, 5.6.8, 5.9.2, 5.12.11–12, 5.14.4, 5.15; Whittaker–Watson §§12.13, 12.21, 12.43), none shared; largest share DLMF, 62 of 150 locator citations; contents compared with DLMF Chapter 5 (§§5.2–5.16): independent, only Layer 7 ↔ §5.6 is one to one and no run of layers follows the sections' order. The eleven other books could not be read.
- Research link: the README names no research article; its sources are textbooks and the DLMF. Layer 10 gives the Selberg, Aomoto, Mehta and Dyson integrals for all parameters, the normalisation constants of β-ensembles in Forrester 2010, Ch. 4, which RandomMatrices 5.2–5.3 on main reach only at `β ∈ {1, 2}`; rests on the README.

## Not verifiable

- Andrews–Askey–Roy, Temme, Olver, Lebedev, Beals–Wong, Forrester, Paris–Kaminski, Remmert, Duverney: no legal copy (publisher pages closed; the result of the previous round, not retried). Grafakos: the sources service finds only the paywalled Springer page. Katznelson: no legal source found (Cambridge Core).
- Of the sampled targets, therefore: the book locators of 1.3, 1.5, 3.1, 9.2, 9.4 and 10.1 are unchecked beside their DLMF or Whittaker–Watson locators, which were read; 10.1 (Andrews–Askey–Roy, Thm. 2.8.1) has no readable locator and was checked as mathematics.
- The locators for the convergence test of 4.6 (Grafakos, Thm. 3.4.7, p. 212; Katznelson, Ch. II, §2.5, p. 75) were not read; the statement and the implication from differentiability to Dini's condition were checked directly.
- Whittaker–Watson was read in the third edition (1920), not the cited fourth (1927); the section numbers and pages cited agree with the third.
- DLMF §5.9 was read on dlmf.nist.gov; the sources service returns only the figure of that page.

## Source issues

- **Gap** in DLMF at 5.2.9, §5.2(iii): the source says the Lah number is the binomial `C(n − 1, k − 1)` times `n!/k!`, with both sums starting at `k = 0`; it should give `L(0, 0) = 1` and `L(n, 0) = 0` for `n ≥ 1` separately, since the formula needs a convention for the lower index `−1`; affects nothing.

## For the human reviewers

- **Licence.** The README section "Prior formalization" (`TauCetiRoadmap/SpecialFunctionsGamma/README.md`, lines 1579–1611) names the author's `lean-DLMF` repository (stated there as Apache-2.0) as source material for every layer; `Suggested.lean` was not compared with that repository's declarations.
- **Not tested.** Eleven of the twelve cited books could not be read (list under Not verifiable); wording and arrangement were compared with DLMF Chapter 5, which has the largest share of the locators, and with Whittaker–Watson Ch. XII.
- **Scope.** Tau Ceti's main branch, after the pin, has `GaussSeries.lean`, `Multiplication.lean`, `TaylorSeries.lean` and `Residue.lean` under `TauCeti/Analysis/SpecialFunctions/Gamma/`; the description says they prove targets 1.2, 4.2 and the second bullet of 6.1. At the pin they are absent.
