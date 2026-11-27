# Review of QuadratureRulesAndPeanoKernels (pull request #3216 at 244ea2d)

**Verdict:** accepted

**Summary.** Accepted: every statement, Check and worked value was recomputed and none is false, the Lean file states all eleven headline theorems at the README's generality, and the cited library declarations and roadmap sections exist where they are cited. There is one small correction (the hypothesis `n ≥ 1` of 2.4 is not needed) and two format notes, none blocking. Abramowitz–Stegun could not be read from a legal copy, so its three locators are unverified against the text (the formulas themselves were recomputed); two points are left for the human reviewers.

## C01 — The halving and Richardson identities of 2.4 hold for `n = 0` as well, so the hypothesis `n ≥ 1` excludes nothing

An implementer who uses 2.4 must supply `0 < n` for an identity that does not need it, and the README's own parenthesis (section 2.4, line 226) says the identities hold at `n = 0`. With `n = 0`, Mathlib's `trapezoidal_integral f 0 a b` is `(b − a)/0 · (…) = 0` (`Mathlib/MeasureTheory/Integral/IntervalIntegral/TrapezoidalRule.lean`, line 40), and `midpointRule f 0 a b` and `simpsonRule f 0 a b` are `0` by their definitions (`Suggested.lean`, lines 65 and 70), so both identities read `0 = 0`. Either drop `hn` from `trapezoidal_two_mul_and_richardson` and "`n ≥ 1`" from the sentence, or keep the hypothesis and say in one clause that it is kept only so that the statement is about genuine rules.

## N01 — The sharpness example of 5.2 is in the proof of Theorem 2.2, and the source lets `N → ∞`

The Check of 5.2 (line 404) cites "Trefethen–Weideman, after Theorem 2.2" for `2 cos Nz` with the limit `a → ∞`. The source gives the example `zᴺ + z⁻ᴺ` inside the proof of Theorem 2.2, p. 393, and takes `N → ∞` for fixed `r`. The README's limit is also correct (the ratio is `(e^{Na} + e^{−Na})/(e^{Na} − 1)`); the locator would read "proof of Theorem 2.2, p. 393".

## N02 — Four targets name no place in the literature

1.1, 1.2, 2.2 and 4.1 are marked "Proved here" with a full route, and 4.1 names Pólya's paper without a theorem or page. A reader who wants the classical statement for comparison has nowhere to look; a locator into a standard text for the Peano kernel theorem and the number of Pólya's theorem would serve.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 Peano kernel theorem | trapezoid, midpoint (`m = 0, 1`), Simpson (`m = 2, 3`) on `[0,1]`, `f = x⁷ − 3x⁵ + x⁴`; `a = b` | errors `0.325`, `−0.1515625`, `0.00729167` on both sides; `a = b`: `∑w = 0`, both sides `0` | holds | none |
| 1.1 kernels (Check) | `t = 0, 1/2` for Simpson; closed forms for the others | trapezoid `−t(1−t)/2`; midpoint `t²/2` on `[0,1/2]`; Simpson `K(1/2) = −1/192` both ways | holds | none |
| 1.1 convention at `m = 0` | `0⁰ = 1` reading against midpoint on `x²` | wrong reading gives kernel `0`, error `0`; true error `1/12` | convention pinned | none |
| 1.2 one-sign form | three kernels on `[0,1]`; `∫K = 0` case; `a = b` | `∫K = −1/12, 1/24, −1/480`; `m!E/(m+1)! = −1/12, 1/24, −1/480`; Simpson `−f⁗(ξ)/2880` | holds | none |
| 2.1 trapezoid mean value | `x²`, `N = 1`; `N = 0`, `f = 1`; `a = 1, b = 0` | `1/2 − 1/3 = 1/6 = (1/12)·2`; `−1` against `0`; `−1/6`, empty `Icc` | holds; hypotheses needed | none |
| 2.1 route | `g = f − c x²/2` in Mathlib's bound | error on `x²/2` is `(b−a)h²/12 = K`; bound `K(ν−μ)/2`; quotient in `[μ, ν]` | route sound | none |
| 2.2 midpoint | `x²`, `n = 1`; `n = 0`, `f = 1`; panel kernel | `1/3 − 1/4 = 1/12 = (1/24)·2`; `1` against `0`; `∫K = h³/24`, `n h³/24 = (b−a)h²/24` | holds | none |
| 2.3 Simpson | `x⁴`, `n = 1`; `x³`; panel kernel; Lean prefactor | `1/5 − 5/24 = −1/120 = −(1/16)(24)/180`; `0`; `−(2h)⁵/2880 = −h⁵/90`; `(b−a)/(6n) = h/3` | holds | none |
| 2.4 halving, Richardson | general `n` by nodes; `n = 0` | `T_{2n} = h[…] = (T_n + M_n)/2`; `(T_n + 2M_n)/3 = S_n`; `n = 0`: `0 = 0` | holds, also at `n = 0` | C01 |
| 3.1 degree of exactness | `n = 1,…,10` exact rational weights; `n = 0` | exact degree `1,3,3,5,5,7,7,9,9,11`; next errors `−1/6`, `−1/120`, `−37/17301504` (`n = 8`); `n = 0`: `0 ≠ 1/2` on `X` | holds | none |
| 3.2 weights | `n = 1,…,10` | positive exactly for `n ≤ 7`, `n = 9`; `n = 8`: `28350·w = (989, 5888, −928, 10496, −4540, …)`; `w_{10,2} = −16175/199584 = −48525/598752` | holds | none |
| 3.2 Checks | sums of absolute values | `6857/4725` (`n = 8`), `152921/49896` (`n = 10`), `1` otherwise; `2·16445 − 4540 = 28350` | holds | none |
| 4.1 convergence criterion | `a > b`; `a = b`; repeated nodes | `a > b`: no nodes, `0 ↛ b − a` on both sides; `a = b`: both sides say `w → 0`; repeated: `∑|w| = 2n + 1`, converges | holds; distinctness needed | none |
| 5.1 matching odd derivatives | `x⁴/12 − x⁵/10 + x⁶/30`; `m = 0`; `cos 2πx`; `x²(1−x)²` | `1/280 > 1/360`; `3/10 > 1/5`; `1 <` `2π/3`, `2π³/45`, `4π⁵/945`; `1/30 ≤ 0.0642` | holds; hypotheses needed | none |
| 5.1 route | remainder of the supplier's formula | constant part `B_{2m}/(2m)!·(g⁽²ᵐ⁻¹⁾(N) − g⁽²ᵐ⁻¹⁾(0)) = 0`; rest `≤ |B_{2m}|/(2m)!·h^{2m−1}∫|f⁽²ᵐ⁾|`, times `h` | route sound | none |
| 5.2 strip bound | `2 cos Nz`; `N = 0`; `e^{iz/2}`, `a = 10`, `N = 1` | rule `4π`, integral `0`, `M = 2cosh Na`; `2π` against `0`; `|2π − 4i| ≈ 7.45`, bound `≈ 0.085` | holds; hypotheses needed | none (N01) |
| Conventions: Lean rules | `n = 0`; Simpson and midpoint nodes | all three rules `0`; nodes `a + (j+1/2)h`, `a + 2jh, a + (2j+1)h, a + (2j+2)h` as in README | agree | none |

- Source locators checked against the text: 4 (Trefethen–Weideman Theorem 3.2 with (3.16)–(3.18), pp. 396–397, and the sharpness example, p. 393; Embree Theorem 3.1, p. 121; DLMF 24.9.1).
- Library declarations opened at the pin: 41 of the supplier contracts, all present in the files named; statements read for `trapezoidal_integral` (line 40), `trapezoidal_error_le_of_c2` (line 252), `taylor_integral_remainder` (`Taylor.lean` line 534), `hasSum_one_div_nat_pow_mul_cos` (`ZetaValues.lean` line 356), `Lagrange.eq_interpolate` (line 361) and nine others.
- Duplication by object: the pinned Mathlib has no Simpson, midpoint, Newton–Cotes or Peano kernel declaration (only `TrapezoidalRule.lean` and `Chebyshev/ChebyshevGauss.lean`, both cited); the pinned Tau Ceti has no quadrature rule or Euler–Maclaurin formula.
- Cross-roadmap citations resolved on main: 6 (AsymptoticExpansions 13.1 with `sum_Icc_eq_eulerMaclaurin`, whose Lean statement matches the contract; ExplicitZetaBounds 0.5a; SpecialFunctionsOrthogonalPolynomialsGeneral 5.3 and 5.5; OneStepMethodsForODEs 3.2; ProbabilisticAndMetricNumberTheory 2.7; PolynomialInterpolationAndBestApproximation scope).
- Dependency check: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; no change outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates with eleven `sorry` warnings and nothing else; the elaborated types of the 15 declarations were compared with the README statements, no binder lost, nothing changed.
- One-tactic probe (`simp` with the definitions unfolded, `rfl`): none of the 11 theorems closes.
- Pull request text read against the head: no sentence contradicted.

Overlap check: read RungePhenomenonAndLebesgueConstants, LinearMultistepMethods, PolynomialInterpolationAndBestApproximation, OneStepMethodsForODEs; nothing shared.

Source independence: 8 passages compared with 3 sources (Trefethen–Weideman, Embree, DLMF), none shared beyond formulas; largest share Abramowitz–Stegun, 3 of 7 locators, whose text and contents could not be read; contents compared with Trefethen–Weideman (2 of 7): independent.

Research link: Layer 5.2 is Theorem 3.2 of Trefethen–Weideman (2014) on the exponentially convergent trapezoidal rule; Layer 4 is the convergence criterion of Pólya (1933). Rests on the README's references and on the text of Trefethen–Weideman.

## Not verifiable

- Abramowitz–Stegun 25.4.1, 25.4.2, 25.4.5, 25.4.6 and 25.4.13–25.4.20, pp. 885–887 (cited in 2.1, 2.3, 3.2): no legal copy found through the sources service; the formulas were recomputed exactly instead.
- Pólya, Mathematische Zeitschrift 37 (1933), 264–286 (named in 4.1 for the attribution): the search timed out; 4.1 is proved in the README and does not depend on it.

## Source issues

- none

## For the human reviewers

- **Scope.** The subject is classical numerical analysis; the headline results are Peano's kernel theorem, the composite-rule error formulas, Pólya's criterion (1933) and Trefethen–Weideman's Theorem 3.2 (SIAM Review, 2014). Whether this is within the project's scope is yours to decide.
- **Licence.** Embree's lecture notes (cited in 3.1 for one theorem) are unpublished course notes read from the author's page.
- **Not tested.** Abramowitz–Stegun has the largest share of the locators (3 of 7); its text and contents were not read, so wording and arrangement were not compared with it.
