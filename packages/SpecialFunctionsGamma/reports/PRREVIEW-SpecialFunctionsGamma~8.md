# Review of SpecialFunctionsGamma (pull request #2191 at 96a4044)

**Verdict:** needs changes

## R01 (P1) — 4.6 rests on a pointwise Fourier convergence theorem that nothing provides, and the test it names does not apply to `log Γ`

**Location:** `TauCetiRoadmap/SpecialFunctionsGamma/README.md:866–867`: "*Needs:* 3.3; Mathlib `Complex.Gamma_mul_Gamma_one_sub`, Fourier series on the circle and the pointwise convergence of the Fourier series of a function of bounded variation."

**Claim:** No layer, supplier section or pinned declaration proves pointwise convergence of a Fourier series beyond summable coefficients, and Kummer's coefficients `log k/k` are not summable. The `1`-periodic extension of `log Γ` is also unbounded (`log Γ(x) ∼ −log x` at `0⁺`), so it is not of bounded variation on a period.

**Witness:** pinned Mathlib has only `has_pointwise_sum_fourier_series_of_summable` (`Mathlib/Analysis/Fourier/AddCircle.lean:503`); `TauCeti/Analysis/Fourier/` has no Dirichlet–Jordan or Dini test; no roadmap on main or open states one.

**Repair:** add to 4.6, and to "Auxiliary results owned here", the target: "Local convergence test: let `f` be `1`-periodic and integrable on `[0, 1]`, and differentiable at `x`. Then `Σ_{|k|≤N} f̂(k) e^{2πikx} → f(x)` as `N → ∞`. Route: the Dirichlet kernel and the Riemann–Lebesgue lemma applied to `(f(x + t) − f(x))/sin πt`." Replace the Needs clause by "the local convergence test above; Mathlib `fourierCoeff`, `tendsto_integral_exp_smul_cocompact`". `log Γ` is integrable on `(0, 1)` and smooth at every interior `x`, so the test applies.

## R02 (P2) — the case `x > 0` of the upper bound of 7.3 is ZerosOfLFunctions 1.3a on main, and is not cited

**Location:** `TauCetiRoadmap/SpecialFunctionsGamma/README.md:1077–1079`: "For real `x ∉ {0, −1, −2, …}` and real `y`, `|Γ(x + iy)| ≤ |Γ(x)|` (`Complex.norm_Gamma_add_mul_I_le`; … DLMF 5.6.6)"; and `:739`: "`|Γ(z)| ≤ Γ(Re z)` (7.3)".

**Claim:** For `x > 0` this is a target of ZerosOfLFunctions, which is on main; the scope section and the supplier contracts (`README.md:132–156`, `:223–232`) do not name it, so the case has two owners. The Check of 4.1 also cites a later layer for it.

**Witness:** main, `TauCetiRoadmap/ZerosOfLFunctions/README.md:769–773`: "### 1.3a Bounds on vertical lines … For `0 < Re s`, `‖Γ(s)‖ ≤ Real.Gamma (Re s)` … (DLMF 5.6.6)".

**Repair:** add under "What it does not own": "The bound `|Γ(x + iy)| ≤ Γ(x)` for `x > 0` (DLMF 5.6.6; ZerosOfLFunctions 1.3a); 7.3 extends it to the negative non-integers `x` through the product of SpecialFunctionsParabolicCylinder 6.6(a)." Add the 1.3a line to the ZerosOfLFunctions contract, say in 7.3 that `x > 0` is 1.3a, and in the Check of 4.1 replace "(7.3)" by "(ZerosOfLFunctions 1.3a)".

## R03 (P3) — `Complex.integral_inv_Gamma_four` omits the integrability that 9.3 attaches to it

**Location:** `TauCetiRoadmap/SpecialFunctionsGamma/README.md:1301`: "the integrand being integrable on the real line (`Complex.integral_inv_Gamma_four`"; `README.md:81–82` and `Suggested.lean:11–12`: "each with every conclusion the README attaches to it"; `Suggested.lean:580–584`.

**Claim:** The Lean statement is the equality alone. Where the right side is `0` the equality does not imply integrability, since Lean's integral of a non-integrable function is `0`.

**Witness:** `(a, b, c, d) = (½, 3/2, ½, 3/2)`: `Re(a + b + c + d) = 4 > 3` and `Γ(a + c − 1)⁻¹ = Γ(0)⁻¹ = 0`, so the statement reads `∫ … = 0`.

**Repair:** state `Integrable (fun t : ℝ => (Gamma (a + t))⁻¹ * (Gamma (b + t))⁻¹ * (Gamma (c - t))⁻¹ * (Gamma (d - t))⁻¹) ∧ ∫ t : ℝ, … = …`, as `TauCeti.integral_power_simplex` does. At the witness the integrand is `cos² πt/(π²(¼ − t²))`, integrable, with integral `0`.

## R04 (P3) — the build diagram contradicts the layers' Dependencies

**Location:** `TauCetiRoadmap/SpecialFunctionsGamma/README.md:326–333`: "`Layer 2 ──┼──► Layer 8 ──► Layer 9`" and "`├──► Layer 6`" under Layer 4.

**Claim:** The diagram puts Layer 9 behind Layer 8 and Layer 6 behind Layers 3 and 4, and has no edge from Layer 4 to Layer 9; the Dependencies sections say otherwise, and no `*Needs:*` line of 9.1–9.4 cites 8.x or of 6.1–6.2 cites 3.x or 4.x.

**Witness:** `README.md:1348`: "Layer 2; Layer 4 (4.4); SpecialFunctionsHypergeometric 6.3; …" (no Layer 8); `README.md:1029`: "Layer 1; Mathlib."

**Repair:** redraw with the edges the Dependencies sections state: `1 → 3`, `1 → 6`, `3 → 4`, `4 → 5`, `4 → 7`, `4 → 9`, `2 → 8`, `2 → 9`, `2 → 10`.

## R05 (P3) — `temmePhi` has two Checks

**Location:** `TauCetiRoadmap/SpecialFunctionsGamma/README.md:1171–1174` (the Checks of 8.2); `Suggested.lean:66–67`.

**Claim:** The definition `Φ(t) = 1 − t cot t + log(t/sin t)` has two Checks, both through the integral; neither evaluates `Φ` at a point away from `0`.

**Witness:** `README.md:1172–1174` lists "`z = 1`" and "Laplace's method at `t = 0`" only.

**Repair:** add "- `Φ(±π/2) = 1 + log(π/2) = 1.4515827`: `Φ` is even and the cotangent term vanishes there; with `log(sin t/t)` in place of `log(t/sin t)` the value would be `0.5484173`." (Computed: `Φ(π/2) = Φ(−π/2) = 1.451582705`.)

## R06 (P3) — the description lists ExplicitZetaBounds as an open pull request; it is on main

**Location:** pull request description, **Overlaps with other roadmaps**, under "**Open pull requests.** The scope was chosen to avoid them": "#1954 (ExplicitZetaBounds) owns the explicit Stirling theory and Binet's formulas (its 1.1–1.2, 2.4–2.5, which the README names) and the polygamma brackets on the positive axis (its 1.3)."

**Claim:** ExplicitZetaBounds is on main, so the bullet belongs in the "On main" list.

**Witness:** main has `TauCetiRoadmap/ExplicitZetaBounds/README.md:832` "### 1.1 Stirling's series with the periodic Bernoulli remainder" and `:881` "### 1.3 Polygamma brackets"; the index of open roadmap pull requests has no #1954.

**Repair:** move the bullet under "On main" as "ExplicitZetaBounds owns the explicit Stirling theory and Binet's formulas (its 1.1–1.2, 2.4–2.5, which the README names) and the polygamma brackets on the positive axis (its 1.3). All of this is outside this roadmap. The sector asymptotics of `ψ⁽ⁿ⁾` in 3.5 are a different statement from its 1.3."

## Previous findings

- R01 of the review of `b805908` (the description listed AnalyticNumberTheoryPartII as an open pull request): repaired. The description now has, under "On main": "AnalyticNumberTheoryPartII §4.3 (`barnesG`) owns the Barnes `G`-function, which is outside this roadmap; the README names it."

## Verified sound

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| 1.1 residues | `n = 0, 2, 3`, `z = −n + 10⁻⁸(1 + 0.5i)` | `(z + n)Γ(z)`: `1.0000000`, `0.5000000`, `−0.1666667` / `(−1)ⁿ/n!`; `(z + n)ψ(z)`: `−1.0000000` each | holds |
| 1.2 Gauss series | `z = −1.5 + 0.2i`; `z = −½` | `0.7078599 + 1.6517574i` both; `ψ′(−½) = 8.9348022` / series `8.9348022` / `π²/2 + 4` | holds |
| 1.3 series of `ψ⁽ⁿ⁾` | `n = 2`, `z = −1.5 + 0.2i`; `z = 1` | `−0.2300158 + 23.7802054i` both; `ψ″(1) = −2.4041138 = −2ζ(3)` | holds |
| 1.4 recurrence, reflection, multiplication | `z = 0.3 + 0.4i`; reflection `n = 0..3`; `(m, n) = (3, 2)` | reflection `n = 3`: `−86.4182449 + 62.8359320i` both; multiplication `0.4912508 + 0.4902180i` both; recurrence `n = 3`: `0.8776116 − 1.7918321i` both | holds |
| 1.5 values | `n = 3` | `ψ(3.5) = 1.1031566` both; `ψ′(2.5) = 0.4903578` both; `ψ″(½) = −16.8287966 = −14ζ(3)`; `n = 1`: empty sum, `π²/2` | holds |
| 2.1 five forms | `a = 0.7 + 0.4i`, `b = 1.2 − 0.5i`, `z = −0.5 + 0.8i`; cosine and exponential forms at `b = 2.3 + 1.1i` | `0.4194248 − 0.1195356i`; `−0.4628092 + 0.1987815i`; `−0.8530322 + 0.5526147i`; `0.3592096 − 0.0373497i`; hyperbolic `0.2322847 − 0.3320712i`; both sides each | holds |
| 2.2, 2.3 | `n = 2`, complex exponents; `a = (1.5, 0.7)`, `p = (3, 1.5)`, `α = (0.8 + 0.4i, 1.7)` | `0.5048998 + 0.2858012i` both; `0.3489816 − 0.1540927i` both; Lean at `n = 0`: `1 = Γ(z₀)/Γ(z₀)` | holds |
| 3.1 scaled, two-sided, Prym, Cauchy–Saalschütz | `μ = 1.7`, `ν = 0.8 + 0.6i`, `z = 1.2 − 0.9i`; `c = 0.7`, `z = 0.6 + 1.1i`; `z = −1.5 + 0.2i`; `n = 1`, `z = −1.4 + 0.3i` | `0.4890528 − 0.2512070i`; `0.5083481 − 0.2213387i`; `1.9625551 + 0.2784596i`; `1.626315 + 0.749559i`; both sides each | holds |
| 3.2 oscillatory | `z = −0.3 + 0.4i`; `n = 2, 3` | `π/(2Γ(1 − z)cos(πz/2)) = Γ(z) sin(πz/2) = 1.6209311 − 0.5587108i`; `n = 2`: `0.6266571 = √(π/8)` twice | holds |
| 3.3 integrals of `ψ`, `γ` | `z = ½ + 1.3i`; `a = 1.3` | Dirichlet and 5.9.15: `0.2340176 + 1.5699058i` = `ψ(z)`; 5.9.16: `0.8112333 + 1.5699058i` three ways; `γ`: `0.5772157` twice; sine integral `0.0526999` both | holds |
| 3.4 derivatives, segment | `n = 3`, `z = 0.7 + 0.5i`; `c = 1.2 − 0.4i` | `8.9884739 + 6.2837594i` both; `−0.3960263 + 0.9140201i` both | holds |
| 3.5 expansion of `ψ⁽ⁿ⁾` | `(n, z, N) = (1, 10, 2)`, `(3, 20e^{2.8i}, 2)`, `(2, 40e^{−3i}, 1)` | remainder `2.348·10⁻⁹` / next term `2.381·10⁻⁹`; `2.587·10⁻¹² − 1.83·10⁻¹³i` / `2.598·10⁻¹² − 1.75·10⁻¹³i`; `(2.69 − 3.06i)·10⁻¹¹` both | holds |
| 4.1 controls | `F = Γ(z) sin 2πz`; `f = Γ(x)(1 + sin² πx)` | `|F(1.5 + 3i)| = 5.258·10⁶`; limit `1 + sin²(0.3π) = 1.6545` | controls hold |
| 4.2 multiplication | `n = 3, 5`, `z = −0.7 + 0.6i`; `z = 0`, `n = 2` | `−0.8245104 − 1.7627913i` both (`n = 3`); `ψ`: `1.1528559 + 2.5399608i` both; at the pole `Γ(0)Γ(½) = 0 = … Γ(0)` | holds |
| 4.3 Lah, duplication | `n = 0, 1, 4`, `x = 0.37 + 1.2i` | `(x)₄ = −20.4910564 + 7.2427344i` both; falling `−6.3580924 + 7.6646544i` both; `(x)₉`: `−178153.97 − 132117.68i` both; `L(1, 0) = 0` | holds |
| 4.4 vertical lines | `y = 0.9` | `0.2637779 − 0.2619377i` both; `Im ψ`: `2.1373875`, `1.5598377`, `1.0262764`, each both sides | holds |
| 4.5 Gauss | `p/q = 2/5, 3/7, 1/2` | `−2.5613845`, `−2.3658188`, `−1.9635100`, each both sides | holds |
| 4.6 Kummer | `x = 0.3, ¼, 0.8` | `−0.2059414`, `−0.1929013`, `0.1210322`, each both sides | holds (R01 is its route) |
| 5.1 rational series | `a = (−0.5 + 0.3i, −1.7, 2.5 + i)`, `A = (1 + 2i, −3, 2 − 2i)` | `3.0221564 + 11.882871i` both | holds |
| 5.2 alternating, imaginary axis | `z = −½ + i`; `y = −0.8` | `−1.0710150 − 0.4338242i` both; `−0.9665458` both | holds |
| 5.3 trigamma series | — | `−1.2337006 = −π²/8`; `1.2020569 = ζ(3)` | holds |
| 5.4 balanced products | `m = 3`, complex, `Σa = Σb` | `−0.6929932 − 0.1363751i` both; a pole among `a_k`: a zero factor and `Γ(a_k)⁻¹ = 0` | holds |
| 6.1 Maclaurin series | `z = 1.2 − 1.1i` (`|z| = 1.63`) | `Γ(1 + z) = 0.6256091 − 0.4888133i` both; odd series `0.7098971 − 0.5653647i` both | holds |
| 6.2 reciprocal Gamma | Taylor coefficients of `1/Γ` at `0` | `c₁..c₅ = 1, 0.5772157, −0.6558781, −0.0420026, 0.1665386`; `3c₄ = −0.1260079` both; `4c₅ = 0.6661544` both | holds |
| 7.1 `x` and `1/x` | `x ∈ (0, 10)`, step `1/400`; the route on `t ∈ [0, 1]`, step `10⁻³` | maxima of both sums `2.000000`, at `x = 1`; `(A − B)²/2 − (A + B) ≤ 0`, maximum `0` at `t = 0`; both Taylor bounds hold | holds |
| 7.2 Gautschi, Kershaw | 531 points `(x, s)`; `x = 1`, `s = ½` | no violation; `1.11303 ≤ 1.12838 ≤ 1.13172` | holds |
| 7.3 vertical lines | `x = −½, y = 1`; `x = −2.5, y = 0.1`; lower bound at `y = 2` | `0.4656307 ≤ 3.5449077`; `0.9019924 ≤ 0.9453087`; ratio to the lower bound `1.000` (`x = ½`), `1.566` (`x = 0.7`), `7.927` (`x = 3`) | holds (R02 is its ownership) |
| 7.4 quotients | 3000 random `(a, b, z)` in range | largest `|Γ(z + a)/Γ(z + b)| · |z|^{b−a}` is `0.99965`; no violation | holds |
| 8.1 Hankel | `z = −1.3 + 0.7i`, `ε = 0.5, 1.5`; `z = 2.4 − i`; `z = −2` | `0.7310626 − 1.2820502i` for both `ε` / `1/Γ(z)` the same; `0.7931602 + 0.6592074i` both; `8·10⁻²²` / `0` | holds |
| 8.2 Temme | `z = 1`, `0.4 + 1.5i`, `2.5 − 0.7i` | `1.0000000`; `2.2758744 + 3.7362634i` both; `0.7406776 + 0.4097398i` both; `Φ ≥ 0` on a grid, `Φ(0.1)/0.005 = 1.00056` | holds |
| 8.3 loops, Pochhammer | loop at `1`: `(0.6 − i, −2.5 + 0.8i)`, `ε = 0.7, 0.2`; loop at `0`: `(−0.5 + 0.7i, 1.2 − 0.3i)`, `ε = 0.4, 0.8`, and `a = 2`; Pochhammer: `(−0.6 + 0.5i, −1.3 − 0.4i)`, `ε = 0.3, 0.1`, and `(½, ½)`, `(−1, −2)` | `0.0497659 + 0.0543845i` both; `0.6704173 + 0.4376725i` both, `10⁻²¹` / `0`; `−5.6880267 − 6.0036888i` both, `12.5663706 = 4π`, `7·10⁻²⁰` / `0` | holds |
| 9.1 vertical-line Beta | `(a, b, w, z) = (1.7 + 0.4i, 1.1 − 0.6i, 0.8 + 0.5i, 1.3 − 0.2i)`; `a = −1`, `b = 3.5`; second: `(1.4 + 0.3i, 0.5 − 0.8i, c = 0.3)`, `(2, 1)`, `b = −1` | `0.3242565 − 0.1558614i` both; `4·10⁻²⁶` / `0`; `1.5489613 − 0.1263355i` both; `2.0000000`; `6·10⁻²⁶` / `0` | holds |
| 9.2 Barnes Beta, modulus | `a = 0.7 + 0.3i`, `b = 0.9 − 0.5i`, `c = 0.2`, `z = −0.5 + 1.2i`; `a = 0.8`, `b = 2.3` | `0.2799348 − 0.1185710i` both; `0.4713533` both | holds |
| 9.3 Ramanujan | `(1.3, 0.9, 1.1, 1.4)`; `(½, 3/2, ½, 3/2)` | `1.25579` over `|t| ≤ 60` / `1.25582`; integrand `cos² πt/(π²(¼ − t²))`, integral `0` / `0` | holds (R03 is its Lean form) |
| 9.4 de Branges–Wilson | `a = (0.6 + 0.2i, 0.9, 0.5 − 0.3i, 1.2)` | `0.2395396 + 0.0378888i` both | holds |
| 10.1 Carlson, Landau | `f = sin πz`; Landau at `n = 2`, `a = b = 1` | `sin πz` has `c = π` and is not `0`; `∫∫ |t₁ − t₂|^{2c} = 1/((2c + 1)(c + 1))`, finite exactly for `c > −½` | holds |
| 10.2 Selberg, Aomoto | `n = 2`, `(m, a, b, c)` = `(1, 1.5, 2, 0.7)`, `(2, 1.2, 1.6, −0.3)`, `(1, 1.3 + 0.4i, 1.1 − 0.2i, 0.5 + 0.3i)`, `(0, 1, 1, −0.4)` | `0.0057748813` both; `0.1802571` both; `0.0526305 − 0.0400067i` both; `8.3333333` both | holds |
| 10.3 Laguerre, Mehta | `n = 2`: `(m, a, c)` = `(1, 1.4, 0.6)`, `(2, 0.9, −0.25)`, complex; Mehta `c = 0.7`, `0.3 + 0.5i` | `2.1881873` both; `1.2521587` both; `1.0647337 − 0.1812837i` both; `1.3670662` both; `0.7396696 + 0.2187919i` both | holds |
| 10.4 Dyson | `n = 2`, `b = 0.6`, `0.5 + 0.7i`; `n = 3`, `b = ½` | `1.3800656` both; `0.9113533 + 0.6354890i` both; `1.90985` / `1.90986` | holds |

- Gate: the worker's run reports every check 0, the build included; no file outside the folder changed. Dependency check with the candidate order: `depcheck: 252 roadmaps, 2397 edges, 0 problem(s)`.
- Elaboration: `lake env lean` of `Suggested.lean` gives 81 `sorry` warnings and nothing else. The 87 elaborated signatures were compared with the README statements: no binder lost; the differences are R03.
- One-tactic probe on a scratch copy (`rfl`, `simp`, `norm_num` on each of the 81 theorems): none closes.
- Source locators checked against the text: DLMF 5.2.8–9, 5.4.3–5, 5.4.15–19, 5.5.6–7, 5.5.9, 5.6.2–8, 5.7.1–8, 5.8.4–5, 5.9.1–9, 5.9.12–16, 5.9.18–20, 5.12.2–12, 5.13.1–5, 5.14.1–7, 5.15.1–9, 5.16.1–2 (Release 1.2.8), with their conditions; Whittaker–Watson §§12.13, 12.15, 12.16, 12.21, 12.22, 12.42, 12.43, 12.5 with pages 238–258, read in the 1920 edition.
- Library declarations opened at the pin: `Mathlib/Analysis/SpecialFunctions/Gamma/Digamma.lean:50–124`, `Gamma/Basic.lean:372` (`integral_cpow_mul_exp_neg_mul_Ioi`, real `r` only), `Gamma/Beta.lean:453–466`, `Analysis/Fourier/AddCircle.lean:493–503`, `Analysis/Fourier/Inversion.lean:166`, `Analysis/Complex/AbelLimit.lean:162–264`; `TauCeti/Analysis/SpecialFunctions/Beta.lean:200`, `:456`, `TauCeti/MeasureTheory/Integral/Gamma.lean:56`. No target is proved at the pins.
- Cross-roadmap citations resolved, 25: on main, ZerosOfLFunctions 1.1–1.4 (`README.md:696–796`), AsymptoticExpansions 1.1, 1.3, 4.1–4.3, 8.6 (`:281`, `:320`, `:544–562`, `:1053`), SpecialFunctionsHypergeometric 4.2, 6.3 (`:664`, `:844`), SpecialFunctionsParabolicCylinder 6.6(a) (`:809–818`), AnalyticNumberTheoryPartI §1.8a (`:1122`, `:1139`), ConformalMappingPartII 5.6 (`:740`), SpecialFunctionsAiry 7.1 (`:1126`), ExplicitZetaBounds 1.1–1.2, 2.4–2.5 (`:832–1046`), AnalyticNumberTheoryPartII §4.3 (`:170`), GlobalHolomorphicFunctions 6.1 (`:1843`, `:1875`), RandomMatrices 5.2–5.3 (`:818`, `:839`); at its open head, ExplicitNumberFields 1.1a (`README.md:1315–1325`). Each states what is cited.
- Overlap check: read SpecialFunctionsGeneralizedHypergeometric, SpecialFunctionsLegendre, SpecialFunctionsBessel, SpecialFunctionsStruve, SpecialFunctionsConfluent, SpecialFunctionsHypergeometric, SpecialFunctionsParabolicCylinder, SpecialFunctionsAiry; the open ones consume `Γ`, `ψ` and Stirling and own none of this roadmap's targets. Shared objects and owners: 5.12.3 for complex parameters, 5.13.3 and the periodic Carlson lemma, SpecialFunctionsHypergeometric 6.3 and 4.2; 5.4.3 and 5.8.3, SpecialFunctionsParabolicCylinder 6.6(a); 5.5.6 at `n = 3`, SpecialFunctionsAiry 7.1; 5.6.6 for `x > 0`, ZerosOfLFunctions 1.3a (R02). No open pull request changes this roadmap or drops an id it cites.
- Source independence: 9 passages compared with 2 sources (DLMF §§5.6, 5.9, 5.12, 5.14, 5.15; Whittaker–Watson §§12.42, 12.5), none shared; largest share DLMF, 61 of 140 locators; contents compared with DLMF Chapter 5 (§§5.2–5.18): independent, the ten layers each draw on several of its sections and none follows their order. The other nine books could not be read.

## Not verifiable

- Andrews–Askey–Roy (26 locators, among them Thms. 1.2.5, 1.2.7, 1.5.2, 1.6.1, 1.7.1, 1.8.1, 1.9.4, 2.8.1, 3.6.2, 8.1.1–8.1.2, Cors. 8.2.2–8.2.3, Thm. 8.8.1): the publisher's page is closed; no open copy found.
- Temme (§§3.2.1, 3.2.2, 3.2.7, 3.3.1, 3.4, 3.6.3; (3.6), (3.10)–(3.14), (3.34)), Olver (Ch. 2, §§1.2, 1.7, 2.1, Exs. 1.4, 1.6), Paris–Kaminski ((3.3.41)–(3.3.44)), Beals–Wong (Thm. 2.4.1, §2.7), Lebedev ((1.3.3)–(1.3.12)), Forrester ((4.1)–(4.3), §4.6, Props. 4.7.1–4.7.3): no legal copy found by the sources service.
- Remmert (Ch. 2, §§2.1–2.6, 3.4) and Duverney ((2.34), (2.36), Example 2.8): paywalled, cited by locator alone.
- Of the sampled targets, the book locators of 1.1, 1.2, 1.3, 3.1, 3.3, 5.2, 8.2, 8.3, 10.2 and 10.3 other than Whittaker–Watson's are therefore unchecked; their DLMF locators were checked.
- Whittaker–Watson was read in the third edition (1920), not the cited fourth (1927); the section numbers and pages cited agree with the third.
- The description's paragraph on Tau Ceti main ("merged after that pin"): only the pinned Tau Ceti is available to this review.

## Source issues

- none

## For the human reviewers

- **Licence.** `TauCetiRoadmap/SpecialFunctionsGamma/README.md:1510–1542` names the author's `lean-DLMF` repository (stated there as Apache-2.0) as source material for every layer; `Suggested.lean` was not compared with that repository's declarations.
- **Not tested.** Nine of the eleven cited books could not be read (list under Not verifiable); wording and arrangement were compared with DLMF Chapter 5 and Whittaker–Watson Ch. XII only.
