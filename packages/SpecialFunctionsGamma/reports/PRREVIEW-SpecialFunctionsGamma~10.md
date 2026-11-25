# Review of SpecialFunctionsGamma (pull request #2191 at 2fcfdb5)

**Verdict:** needs changes

**Summary.** Changes are needed, for two false sentences outside the stated results: a Check of 5.1 equates a series with one that is twice as large, and the route of 9.1 derives the second vertical-line integral by a change of variable that does not produce it. Every stated theorem, in the README and in `Suggested.lean`, recomputed correctly, and the sampled DLMF and Whittaker–Watson locators agree with the text. There are six small corrections and two format notes, none blocking; the human reviewers have two questions (the licence of the prior formalization, nine books that could not be read).

## R01 (P2) — the first Check of 5.1 equates `Σ (1/(n + ½) − 1/(n + 1))` with `Σ 1/((n + ½)(n + 1))`, which is twice as large

A reader who tests the rational-series theorem on this example gets `4 log 2` from the middle expression and concludes that the theorem, or its sign convention, is off by a factor of `2`.

In the first Check of 5.1 (`TauCetiRoadmap/SpecialFunctionsGamma/README.md`, lines 736–738) the text reads "`Σ_n (1/(n + ½) − 1/(n + 1)) = Σ_n 1/((n + ½)(n + 1)) = ψ(1) − ψ(½) = 2 log 2 = 1.3862944`". But `1/(n + ½) − 1/(n + 1) = ½/((n + ½)(n + 1))`. Numerically `Σ_{n<2·10⁶} 1/((n + ½)(n + 1)) = 2.7725882`, which is `4 log 2 = 2.7725887`, while the theorem gives `−(ψ(½) − ψ(1)) = 2 log 2 = 1.3862944` for the first expression. The outer equalities are right; only the middle term is wrong.

Smallest change: write the middle term as `Σ_n 1/((2n + 1)(n + 1))` (or `½ Σ_n 1/((n + ½)(n + 1))`). If Duverney's Example 2.8 is the series `Σ 1/((n + ½)(n + 1))`, its value is `4 log 2`.

## R02 (P2) — in 9.1 the second vertical-line integral is not the first "after the Möbius change of variable `t ↦ t/(t − 1)`"; it is the first at `w = c`, `z = 1 − c` with `b + 1` for `b`

An implementer who follows the route of 9.1 (line 1097: "The second is the first after the Möbius change of variable `t ↦ t/(t − 1)` on the line") is sent to a substitution that maps the line `Re t = c` to a circle and turns `t^{−a}(1 − t)^{−1−b} dt` into a multiple of `s^{−a}(s − 1)^{a+b−1} ds` on that circle, which is not the first integral.

No change of variable is needed. Put `w = c`, `z = 1 − c` and replace `b` by `b + 1` in the first formula: the integrand becomes `(c + iy)^{−a}(1 − c − iy)^{−1−b}`, the hypotheses become `0 < c < 1` and `Re(a + b) > 0`, and the right side becomes `Γ(a + b) · 1^{−a−b} · Γ(a)⁻¹ Γ(1 + b)⁻¹`, which is the second formula exactly. The alternative the sentence offers, a Mellin inversion of the half-line Beta integral, has the integration variable in the exponent and gives Gamma factors under the integral, as in 9.2, not powers.

Smallest change: replace the sentence by "The second is the first at `w = c`, `z = 1 − c`, with `b + 1` in place of `b`", and drop `mellinInv_mellin_eq` from the Needs of 9.1 if nothing else there uses it.

## C01 — the description and the Summary treat ExplicitNumberFields as an open roadmap; it is on main

The description says "ExplicitNumberFields 1.1a (#1944, an open roadmap, earlier in the merge order)" and lists it again under "Open pull requests"; the README's Summary (line 50) says the roadmap rests "on five roadmaps on main and on ExplicitNumberFields". `TauCetiRoadmap/ExplicitNumberFields/README.md` is on main, with 1.1a at line 780 stating both series for `Re z > 0` as cited. Text that would be right: list ExplicitNumberFields 1.1a with the other suppliers on main ("six roadmaps on main"), and remove the paragraph on open pull requests.

## C02 — the description's counts are those of an earlier head

"It states 82 theorems" and "imports Mathlib and three Tau Ceti modules": the head has 81 theorems (the residue of `Γ` at `−n` left the file when 1.1 began to consume SpecialFunctionsParabolicCylinder 6.6(b); the Build paragraph already says 81) and four Tau Ceti imports (`TauCeti.Probability.Distributions.Dirichlet.Density` is new). The description should also say that the residue of `Γ` is no longer a target of Layer 1, where its layer list still reads "the residues of `Γ` and `ψ`".

## C03 — the Tau Ceti theorem that 2.2 cites is missing from the Inputs and from the Tau Ceti contract

The route of 2.2 (line 331) says that the real case of the second Dirichlet integral is `TauCeti.Probability.lintegral_dirichletChartPDF_eq_one`, and at the pin that is so (`TauCeti/Probability/Distributions/Dirichlet/Density.lean`: the chart density `Γ(Σ aᵢ)/∏ Γ(aᵢ) · ∏ x_j^{a_j − 1} (1 − Σ x_j)^{a_{i₀} − 1}` has `∫⁻ = 1`). But the list of Inputs in "Scope and ownership" and the subsection "From Tau Ceti" do not name it, so a reader of the scope takes the whole of 2.2 for new. Add one bullet to each: the real case of DLMF 5.14.2, as an `ℝ≥0∞`-valued integral over the chart `{i // i ≠ i₀} → ℝ`.

## C04 — the guide says Layer 1 obtains Gauss's series from the product for `1/Γ`; the route of 1.2 does not

The Summary (line 8: "read off from the product for `1/Γ`") and "How to read the build" (line 68: "Layer 1 differentiates the product for `1/Γ` logarithmically") describe a route through the Weierstrass product. The route of 1.2 is another one: ExplicitNumberFields 1.1a on `Re z > 0`, then the recurrence `Complex.digamma_apply_add_nat`; the product (GlobalHolomorphicFunctions 6.1) is in neither the Needs of 1.2 nor the Dependencies of Layer 1. Say in both places that Layer 1 extends the series of `ψ` and `ψ′` from the half-plane to all `z` off the poles by the recurrence.

## C05 — Landau's theorem (10.1) has a relative on main that the README does not name

`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/PositivityOfDirichletSeriesWithKernels/README.md` §6.3 (line 149), on main, proves Landau's theorem for the Laplace transform of an eventually nonnegative function on `(0, ∞)` with Lebesgue measure, for complex `s`; its line 902 names 10.1 here as the form on a general measure space and says that its own is the case `h(u) = e^{−u}`. The README's own closing sentence of the Landau item (line 1205, "With `g = e^{−t}` this is the theorem that a Laplace–Stieltjes integral …") describes that case without saying who owns it. The two statements differ (a general measure and a positive function `g`, real `s`, against a Lebesgue density and complex `s`), so both can stay; add the clause that says so, in 10.1 or under "Auxiliary results owned here", with the citation of that §6.3.

## C06 — the two theorems of 9.1 in `Suggested.lean` do not carry the integrability that the Conventions attach to a vertical-line integral

The Conventions (line 129) define a vertical-line integral "with `y ↦ f(c + iy)` integrable", and the file's docstring says each statement has "every conclusion the README attaches to it". `Complex.integral_vertical_beta` and `Complex.integral_vertical_beta_one_sub` state only the equation, and the equation does not imply integrability where the right side vanishes: at `b = 0` (allowed when `Re a > 1`) the right side is `Γ(a − 1)(w + z)^{1−a} Γ(a)⁻¹ · Γ(0)⁻¹ = 0`, which is also Lean's value of a non-integrable integral. The same holds for the integrals of `ψ` in 3.3 at the positive zero `x₀ ≈ 1.4616` of `ψ`. The statements are true; they are weaker than the prose. Either add the conjunct `Integrable …`, as `Complex.integral_inv_Gamma_four` has, or say in the Conventions that `Suggested.lean` states integrability only where a layer names it.

## N01 — "the layers below" in "Scope and ownership" should read "above"

Line 1342: "The numbers are those of the layers below". The layers now precede that section.

## N02 — the local convergence test of 4.6 still has no source locator

Line 675: the test (Dini's test at a point of differentiability) has a route and a Lean name but, unlike the other targets, no citation; a locator into a standard text on Fourier series would let a reader match it. This is the format note of the previous review; it is not required.

## Previous findings

- The previous review (of `b8d75ff`) had no finding. Its one format note, the missing locator for the test of 4.6, was not taken up and stands as N02.
- The parenthesization repaired at this head was checked through the whole file: in `Complex.inv_Gamma_eq_hankel`, `Complex.beta_loop_one` and `Complex.beta_loop_zero` the first integral is now closed before the `+`, as the README's formulas require; no other statement has an integral or sum binder that swallows a following term (each of the 81 was read for it).

## Verified sound

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| 1.1 residue of `ψ` at `−n` | `n = 0, 1` | `ψ(z) = ψ(z + n + 1) − Σ_{k≤n} 1/(z + k)`: only `−1/(z + n)` is singular; limit `−1` both | holds |
| 1.2 Gauss series off the poles (headline) | `z = −1.5 + 0.2i`; `z = −½` | `0.7078599 + 1.6517574i` both; `ψ(−½) = ψ(½) + 2 = 0.0364899`; `ψ′(−½) = π²/2 + 4` | holds; DLMF 5.7.6, 5.15.1 read |
| 1.3 series of `ψ⁽ⁿ⁾` | `n = 2`, `z = −1.5 + 0.2i` | `−2 Σ (k + z)⁻³ = −0.2300158 + 23.7802054i` (2·10⁵ terms plus tail) / README value the same | holds |
| 1.4 recurrence, reflection, multiplication | `n = 0`; `n = 1, z = ½`; `m = 2` | reflection differentiated `n` times: sign `(−1)^{n+1}`; `ψ′(3/2) = π²/2 − 4`; `3ψ′(1) = ψ′(½)`: `π²/2` both | holds; DLMF 5.15.5–7 read |
| 1.5 values | `n = 0, 1, 2` | `ψ(3/2) = 0.0364899`; `ψ″(½) = −14ζ(3)`; `ψ′(3/2) = 0.9348022` two ways | holds; DLMF 5.4.15, 5.15.2–4 read |
| 2.1 five forms | `a = b = 1`; `(1, 3)`; `(1, 0)`; `(½, 0)` | `1/z − 1/(1 + z) = 1/(z(1 + z))`; `−⅓` both; hyperbolic `1` and `π/2` both | holds; DLMF 5.12.2, 5.12.4–7 read |
| 2.2 Dirichlet (headline) | `n = 0`; `n = 1`; `z = (1, 1)` | `n = 0`: `1 = Γ(z₀)/Γ(z₀)`; `∫₀¹ dt = 1 = Γ(1)²/Γ(2)`; exponent `z_n` would give `½` | holds; DLMF 5.14.1–2, W–W §12.5 read |
| 2.3 Liouville (headline) | `n = 0, 1`; quarter disk | `n = 1`: `a^α Γ(α/p)/(p Γ(1 + α/p)) = a^α/α`; `(Γ(½)/2)²/Γ(2) = π/4` | holds |
| 3.2 oscillatory integrals | `z = −0.3 + 0.4i`; `z → 0`; `n = 2` | `π/(2Γ(1 − z)cos(πz/2)) = 1.6209311 − 0.5587108i = Γ(z) sin(πz/2)`; `arctan 100 = 1.5607967`; `√(π/8)` | holds; DLMF 5.9.6–9 read |
| 3.3 integrals of `ψ` | `z = 1, ½`; `z = ½ + 1.3i` | third: `(γ − ½)/2 = 0.0386078`, `(log 2 + γ − 1)/2 = 0.1351814`; `ψ = 0.2340176 + 1.5699058i` | holds |
| 3.5 expansion of `ψ⁽ⁿ⁾` | `n = 1`, `z = 10`, `N = 2` | `0.1051663357` / `0.1051663333`; next term `B₆/10⁷ = 2.38·10⁻⁹`; remainder exponent `2N + n + 2` | holds |
| 4.1 Wielandt, limit characterization (headline) | `Γ sin 2πz`; `Γ(1 + sin²πx)` | `|F(1.5 + 3i)| = 5.258·10⁶`; limit `1 + sin²(0.3π) = 1.6545` | holds; both controls fail as stated |
| 4.2 multiplication (headline) | `n = 1, 2`; `z = 1/n`; a pole | `f(x + 1) = x f(x)` for `f = n^x ∏ Γ((x + k)/n)`; both sides `0` iff `nz ∈ −ℕ` | holds |
| 4.3 Pochhammer duplication, Lah | `a = 1, n = 1`; `n = 2`; `k = 0 < n` | `(1)₂ = 2 = 4·½·1`; `x(x + 1) = 2x + x(x − 1)`; `(x + n)[x]_k = [x]_{k+1} + (n + k)[x]_k` | holds; DLMF 5.2.8–9 read |
| 4.5 Gauss's digamma theorem (headline) | `p/q = ½, ¼, ⅖` | `−γ − 2 log 2`; `−4.2274535`; `−2.5613845` / `ψ(0.4) = −2.5613845` | holds |
| 4.6 Kummer (headline) | `x = 0.3, ¼`; sign control | `−0.2059414`, `−0.1929013`; wrong sign `2.8289537` | holds |
| 5.1 rational series | `a = (−½, −1)`, `A = (1, −1)` | theorem: `2 log 2 = 1.3862944`; the Check's middle series: `2.7725882 = 4 log 2` | theorem holds; Check false: R01 |
| 5.2, 5.3 | `z = 1`; `z = −½ + i`; `y = 1` | `2 log 2` both; `−1.0710150 − 0.4338242i`; `−½ + (π/2) coth π = 1.0766740` | holds; DLMF 5.16.1–2 read |
| 6.1, 6.2 | `z = ½`, `z = 1`; `k = 3, 4` | `2 log 2 − 4/3 = 0.0529610`; `c₃ = −0.6558781`, `3c₄ = −0.1260079` | holds; DLMF 5.7.1–2 read |
| 7.1–7.3 | scan `x ∈ (0, 10)`; `x = 1, s = ½`; `x = −½, y = 1` | max of both sums `2` at `x = 1`; `1.1130 ≤ 1.1284 ≤ 1.1317`; `0.4656307 ≤ 3.5449077`, product `57.95974` / `57.95977` | holds |
| 7.4 Gamma quotients | `a = 0, b = 1`; `b = ½` | equality `1/|z|`; `Γ(x)/Γ(x + ½) ∼ 1/(x√π) > x^{−1/2}` | holds; DLMF 5.6.8 and its hypotheses read |
| 8.1 Hankel (headline) | derivation; `z = 1, 0, −1` | rays: `(e^{iπz} − e^{−iπz})/(2πi) = sin πz/π`; circle `ε^{1−z}/2π`; values `1, 0, 0` | holds, README and Lean |
| 8.2 Temme | path `t = x(θ/sin θ)e^{iθ}` | `e^t t^{−x} = e^x x^{−x} e^{−xΦ(θ)}`; `Φ = t²/2 + O(t⁴)`; `Φ(π/2) = 1.4515827` | holds |
| 8.3 loops, Pochhammer | monodromy by hand; `a = b = ½` | segments `(1 − e^{2πia})(1 − e^{2πib})`; circles `(1 − e^{2πia})C₁ − (1 − e^{2πib})C₀`; `4π` | holds, README and Lean |
| 9.1 vertical Beta | `a = b = 1`; `(2, 1)`; `w = c, z = 1 − c, b ↦ b + 1` | `1/(w + z)`; `2`; second formula from the first exactly | statements hold; route sentence false: R02 |
| 9.2 Barnes Beta, modulus (headline) | `a = b = ½, c = 0, z = 1`; `a = 1, b = π/2` | `½` both; `¼` both; `z^a(1 + z)^{−2a} = (2 sin b)^{−2a}` | holds; DLMF 5.13.1–2 read |
| 9.3 Ramanujan | all `1`; `a = 2, c = 1` | `∫ sinc² = 1`; phase `e^{−ix/2} = e^{ix(c−a)/2}` | holds |
| 9.4 de Branges–Wilson (headline) | `a_k = ½` | `π² ∫ t sinh πt/cosh³ πt = π²·(1/π²) = 1` / `Γ(1)⁶/Γ(2) = 1` | holds; DLMF 5.13.5 read |
| 10.1 Carlson, Landau | `sin πz`; split at `g = 1` | type `π` on the axis; part on `{g > 1}` holomorphic for `Re s < s₁`, Taylor coefficients of the rest of sign `(−1)^k` | holds |
| 10.2–10.4 Selberg, Aomoto, Mehta, Dyson (headlines) | `n = 1`; `n = 2, c = 1`; `n = 3, b = 1`; `(a + nc)S_{n+1}(a, 1, c) = S_n(a, 1 + 2c, c)` at `n = 1, 2` | `B(a + 1, b)`; `1/6`, `2`, `2`; `6`; recursion ratio `1/(a + c)`, `1/(a + 2c)` | holds; DLMF 5.14.4–7 and ranges read |

- Source locators checked against the text, 41: DLMF 5.2.8–9, 5.4.15, 5.6.8, 5.7.1–2, 5.7.6, 5.9.6–9, 5.9.20, 5.12.2, 5.12.4–9, 5.13.1–2, 5.13.5, 5.14.1–7, 5.15.1–7, 5.16.1–2 (Release 1.2.8, as the README cites); Whittaker–Watson §12.16 (p. 241), §12.42 (p. 256), §12.5 (p. 258).
- Library declarations opened at the pin: `TauCeti/Probability/Distributions/Dirichlet/Density.lean:201–211` and `lintegral_dirichletChartPDF_eq_one`; `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean:372` (`integral_cpow_mul_exp_neg_mul_Ioi`, real `r` only, so AsymptoticExpansions 4.1 is not in Mathlib). The pinned Tau Ceti has no file on `digamma` or polygamma; Mathlib has no multiplication formula (`BohrMollerup.lean:36` lists it as a TODO), no Wielandt, Gautschi, Hankel-loop or Selberg-integral statement.
- Cross-roadmap citations resolved on main, 21: ZerosOfLFunctions 1.2, 1.3, 1.3a, 1.4; AsymptoticExpansions 1.1, 1.3, 4.1–4.3, 8.6; SpecialFunctionsHypergeometric 4.2, 6.3; SpecialFunctionsParabolicCylinder 6.6(a), (b); AnalyticNumberTheoryPartI §1.8a; ExplicitNumberFields 1.1a; SpecialFunctionsAiry 7.1; ConformalMappingPartII 5.6; GlobalHolomorphicFunctions 6.1; AnalyticNumberTheoryPartII §4.3; ExplicitZetaBounds 1.1–1.3, 2.4–2.5; RandomMatrices 5.2–5.3. The ids of the three suppliers with open revisions (SpecialFunctionsHypergeometric, SpecialFunctionsParabolicCylinder, AsymptoticExpansions) are unchanged at those heads.
- Dependency check: `depcheck: 122 roadmaps, 1389 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file outside the folder changed.
- Automatic checks: the worker's run on this head reports every check passed. Elaboration of `Suggested.lean`: 81 `sorry` warnings and nothing else; 81 theorems, 6 definitions, no `set_option`, no `lemma`, no machine path. Each of the 87 declarations was read against its README item, and the elaborated signatures show no lost binder; the generality agrees except as in C06.
- One-tactic probe (`rfl`, `simp`, `norm_num`, `infer_instance`) on a probe copy of the file, all 81 theorems: none closes. No padding found.
- Ownership against open pull requests, by object (polygamma, Wielandt, Gauss multiplication, Gautschi, Kershaw, Hankel loop, Pochhammer contour, Carlson, Selberg, Mehta, Dyson, Lah, Kummer's series, pointwise Fourier convergence): no second owner. LiCoefficientsArithmeticFormula (open) derives `ψ⁽ᵐ⁾(½)` as a step of a route and says so; SpecialFunctionsRankOneSymmetricSpaces (open) consumes 10.1.
- Overlap check: read SpecialFunctionsHypergeometric, SpecialFunctionsParabolicCylinder, SpecialFunctionsEiLiErfIncompleteGamma, AsymptoticExpansions, SpecialFunctionsCoulomb (open heads) and SpecialFunctionsGeneralizedHypergeometric, SpecialFunctionsBessel, SpecialFunctionsConfluent (main); nothing shared beyond the cited sections (the periodic Carlson lemma: SpecialFunctionsHypergeometric 4.2; the residue of `Γ` and the product 5.8.3: SpecialFunctionsParabolicCylinder 6.6). Outside those lists, Landau's theorem has two forms with two owners, PositivityOfDirichletSeriesWithKernels §6.3 on main (Lebesgue density) and 10.1 here (general measure): C05.
- Source independence: 11 passages compared with 2 sources (DLMF §§5.2, 5.6, 5.12, 5.14 prose around 5.2.9, 5.6.8, 5.12.12, 5.14.4; Whittaker–Watson §§12.16, 12.42, 12.5), none shared; largest share DLMF, 86 of 175 locator citations; contents compared with DLMF Chapter 5 (§§5.1–5.24): independent, only Layer 7 ↔ §5.6 is one to one and no run of layers follows the sections' order. The prose of DLMF §5.9 and the nine books could not be read.
- Research link: the README names no research article; its sources are textbooks and the DLMF. Layer 10 gives the Selberg, Aomoto, Mehta and Dyson integrals for all parameters, the normalisation constants of β-ensembles in Forrester 2010, Ch. 4, and in RandomMatrices 5.2–5.3 on main; rests on the README.

## Not verifiable

- Andrews–Askey–Roy, Temme, Olver, Lebedev, Beals–Wong, Forrester, Paris–Kaminski: the sources service found no legal copy (publisher pages closed). Remmert and Duverney: paywalled, cited by locator alone.
- Of the sampled targets, therefore: 1.1 (Olver, Remmert, Temme, Andrews–Askey–Roy) and 2.3 (Andrews–Askey–Roy, Cors. 1.8.2–1.8.3) have no readable locator and were recomputed instead; the book locators of 1.2, 1.4, 1.5, 2.1, 2.2, 3.2, 9.2 and 9.4 are unchecked beside their DLMF or Whittaker–Watson locators, which were read.
- DLMF 5.9.6–5.9.9 and 5.9.20 were read as equations only; the page of §5.9 with their ranges could not be fetched as text. The ranges of 3.2 were checked by convergence at `0` and `∞`.
- Whittaker–Watson was read in the third edition (1920), not the cited fourth (1927); the section numbers and pages cited agree with the third.
- The description's paragraph on Tau Ceti main ("merged after that pin"): only the pinned Tau Ceti is available to this review.

## Source issues

- **Gap** in DLMF at 5.2.9, §5.2(iii): the source says the Lah number is the binomial `C(n − 1, k − 1)` times `n!/k!`, with the sums starting at `k = 0`; it should give `L(0, 0) = 1` and `L(n, 0) = 0` for `n ≥ 1` separately, since the formula needs a convention for the lower index `−1`; affects nothing.

## For the human reviewers

- **Licence.** The README section "Prior formalization" (`TauCetiRoadmap/SpecialFunctionsGamma/README.md`, lines 1548–1580) names the author's `lean-DLMF` repository (stated there as Apache-2.0) as source material for every layer; `Suggested.lean` was not compared with that repository's declarations.
- **Not tested.** Nine of the eleven cited books could not be read (list under Not verifiable); wording and arrangement were compared with DLMF Chapter 5 and Whittaker–Watson Ch. XII only.
