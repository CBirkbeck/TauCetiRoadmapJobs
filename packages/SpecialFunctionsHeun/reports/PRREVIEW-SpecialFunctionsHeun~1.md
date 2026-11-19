# Review of SpecialFunctionsHeun (pull request #2540 at 9cde414)

**Verdict:** needs changes

**Summary.** Changes are needed: two stated targets are false as written (the Type I expansion of a `(0, 1)`-Heun function in 5.4, and the exponents of the separated kernel equation in 6.4), four transformation theorems of Layer 2 fail when the open set contains another singular point, three auxiliary results "owned here" already have owners on main, and two sentences outside the targets are false. There are also five small corrections and two format notes, none blocking. One question is left for the author, and two items (the prior formalization's licence, the unread main book source) for the human reviewers.

## R01 (P1) — A `(0, 1)`-Heun function is not a Type I series convergent in the plane cut along `[0, 1]`

In 5.4, second bullet (README line 1022): "every `(0, 1)`-Heun function is such a series converging in the plane cut along `[0, 1]`, with `q` a root of 31.11.13". An implementer cannot prove this. The functions `P_j` of 31.11.2 with `λ = α`, `μ = β − ε` are `z^{−α−j}` times functions single-valued near `∞`, so a locally uniform limit on `ℂ \ [0, 1]` is analytic at `a` and has exponent `α` at `∞`; a solution that is in addition analytic at `0` and `1` is a polynomial (class I of 4.3), so the statement fails for every non-polynomial `(0, 1)`-Heun function. DLMF's example is the other pair: the Heun function analytic at `z = a` with exponent `α` at `∞` is the one whose Type I series converges in the plane cut from `0` to `1`, with `q` a root of 31.11.13 (DLMF31-11 lines 606–615); the cut joins the two points where the function is singular.

Smallest change: state the bullet for the Heun function analytic at `a` with exponent `α` at `∞`. If a statement about `(0, 1)`-Heun functions is wanted, it is the transform of this one under a homography of 2.2 exchanging `{0, 1}` with `{a, ∞}`, with the cut from `a` to `∞` and its own continued-fraction equation.

## R02 (P1) — The first factor of the separated kernels in 6.4 has the wrong exponents at `cos² θ = 1`

In 6.4, second bullet (line 1158), the Riemann equation in `cos² θ` is given exponents `{0, 1 − γ}`, `{0, ½ − δ − σ}`, `{α, β}`. Their sum is `3/2 − γ − δ − σ + α + β`, which equals `1` only for `σ = ε − ½`, so with a free separation constant this is not a Riemann equation and the bullet cannot be proved. Separating the displayed operator directly: near `θ = 0` the `θ`-equation is `Θ″ + (2δ + 2ε − 1)Θ′/θ − cΘ/θ² = 0`, so the exponents in `1 − cos² θ` sum to `1 − δ − ε` and have product `−c/4`; neither is `0` unless `c = 0`. DLMF 31.10.9 has `{½ − δ − σ, ½ − ε + σ}` at `1` (DLMF31-10 line 340), with sum `0 + (1 − γ) + (½ − δ − σ) + (½ − ε + σ) + α + β = 1`. The second factor (`{0, 1 − ε}`, `{0, 1 − δ}`, `{−½ + δ + σ, −½ + ε − σ}`, sum `1`) is right.

Smallest change: replace `{0, ½ − δ − σ}` by `{½ − δ − σ, ½ − ε + σ}`.

## R03 (P2) — The F-homotopic theorems and the `z ↦ z/(z − 1)` theorem are false when `U` contains another singular point

`heun_fHomotopic_zero`, `heun_fHomotopic_one`, `heun_fHomotopic_a` and `heun_moebius_div_sub_one` (README 2.1 and the third bullet of 2.2; `Suggested.lean` lines 190–234) only ask that the base of the power lie in the slit plane on `U`. `IsHeunSolutionOn` at a singular point is the junk equation in which the terms with a zero denominator vanish, and the prefactor does not carry one junk equation to the other. For `heun_fHomotopic_zero` at `z = 1`: with `w = z^{1−γ} v`, the junk equation of `w` at `1` is that of `v` plus `(1 − γ) ε v(1)/(1 − a)`.

Witness: `(a, α, β, γ, δ) = (3, 0.3, 1.1, 0.8, 0.45)` (`ε = 1.15`), `U` the disc of radius `½` about `1`, `q = 0.20625 − 0.76278 i`, and `v(z) = Hl(1 − a, α′β′ − q′; α′, β′, δ, 2 − γ; 1 − z)` the analytic solution at `1` of the transformed equation (`q′ = 0.70625 − 0.76278 i`). This `q` is a root of the quadratic that makes `v″(1) + (2 − γ + ε/(1 − a)) v′(1) = 0`, so the hypothesis holds on all of `U` (residual `≤ 10⁻¹⁶` at `z = 0.9` and exactly `0` at `1`), while the conclusion at `z = 1` has residual `(1 − γ)ε/(1 − a) = −0.115`. The same computation at `z = 0` for `z ↦ z/(z − 1)` leaves `−γ w′ + α(α + 1 − δ − ε/a) w`. The two affine maps (`heun_moebius_div`, `heun_moebius_one_sub`) are unaffected: their junk terms scale together (checked at `z = 0, 1, a`).

Smallest change: add to the four statements, and to the sentences of 2.1 and 2.2, the hypothesis that `U` avoids `0`, `1` and `a` (as `heun_integral_equation` already does for its `U`); the Conventions already say the predicate is meant only for such `U`.

## R04 (P2) — Pincherle's theorem, Darboux's method and the recessive solution of the recurrence already have owners on main

"Auxiliary results owned here" (README lines 112–117) lists Pincherle's theorem with complex coefficients, Darboux's transfer, and Perron's theorem for the three-term recurrence, as provided by no consumed roadmap. On main:

- SpecialFunctionsEiLiErfIncompleteGamma 4.1 states Pincherle's theorem for complex `a n`, `b n` with `a n ≠ 0` (convergence of the fraction if and only if a minimal solution `f` with `f(0) ≠ 0` exists, value `−f(1)/f(0)`), with home `TauCeti/Algebra/ContinuedFractions/Pincherle.lean`;
- AsymptoticExpansions §13.6 states Darboux's method (DLMF 2.10.29–2.10.32), including the form with finitely many algebraic singularities on the circle that 3.4 uses;
- AsymptoticExpansions §12.1 gives, for `w(n + 2) + f(n) w(n + 1) + g(n) w(n) = 0` with `f₀² ≠ 4g₀`, solutions `∼ ρ_jⁿ n^{α_j}` and the recessive one, unique up to a factor. The recurrence of 3.1 is of this kind: `f₀ = −(1 + a)/a`, `g₀ = 1/a`, `f₀² − 4g₀ = (a − 1)²/a² ≠ 0`, roots `1`, `1/a`. Every use of Perron's theorem in 3.1, 5.3 and 5.4 is covered, and §12.1 gives the power `n^{α_j}` as well.

Smallest change: delete these three from the auxiliary results owned here, cite the two roadmaps in 3.1, 3.4, 5.3 and 5.4 and under the supplier contracts (AsymptoticExpansions is already a supplier; SpecialFunctionsEiLiErfIncompleteGamma is a new one, to be added to the description's dependency list). If a use needs Perron's theorem beyond coefficients with expansions in `1/n`, say which.

## R05 (P2) — Kummer's 24 solutions are six classes of four, not four classes of six

In the third Check of 2.3 (line 593): "Kummer's `24` solutions of the hypergeometric equation (SpecialFunctionsHypergeometric 5.3) are `4` classes of `6`". The cited section says each of `w₁, …, w₆` is given by four expressions, and the count that matches the Check's own analogy is `2n` classes of `2^{n−2}(n − 1)!` (Maier192 lines 71–73): `6 × 4` for `n = 3`, `8 × 24` for `n = 4`. Replace by "`6` classes of `4`".

## R06 (P2) — The confluent equation with `δ = 0` is not the confluent hypergeometric equation

Layer 7 Examples (line 1325): "The confluent hypergeometric equation is the confluent equation with `δ = 0`." At `δ = 0`, 31.12.1 still has `(αz − q)/(z(z − 1))` as coefficient of `w`, with a simple pole of residue `α − q` at `z = 1` and exponents `{0, 1}` there. The pole disappears only when also `q = α`; then the equation is `z w″ + (γ + εz) w′ + α w = 0`, which is Kummer's equation `z w″ + (b − z) w′ − a w = 0` for `ε = −1`, `b = γ`, `a = −α` (and a rescaling of `z` for other `ε ≠ 0`). Add `q = α` and the identification of parameters.

## C01 — The `(0, 1)`-Heun functions of Lamé's equation have period `2K`, not `4K`

Layer 5 Examples (line 1049) calls them "the Lamé functions of period `4K` in `ζ`". With the Conventions' definition (`Hl` analytic at `0` and `1`, exponent `0` at both), `W(ζ) = w(sn² ζ)` is even about `0` and about `K`, hence `W(ζ + 2K) = W(−ζ) = W(ζ)`. Period `4K` and not `2K` belongs to the solutions with exponents `(½, 0)` or `(0, ½)` at `(0, 1)`. Write `2K`, or name the four classes with their periods.

## C02 — In 3.5 the solutions `f₁`, `f₂` at `1` are not defined on all of `(0, 1)`

3.5 writes `Hl = A f₁ + B f₂` "on `(0, 1)`" with `f₁`, `f₂` "the two solutions at `1` of 3.2", which 3.2 gives only for `|1 − z| < min(1, |1 − a|)`; for `a = 1.2` that is `(0.8, 1)`. Say that the identity holds on that interval, or that `f₁`, `f₂` are continued along `(0, 1)` (as the module docstring of `Suggested.lean` already puts it).

## C03 — `fuchs_relation` and `heun_accessory_parameter` are algebra on their hypotheses

Both are statements about free complex numbers and functions: the first follows from its two factorization hypotheses evaluated at `X = 0` and `X = 1` and summed, the second from clearing denominators. Neither mentions an equation or a solution, so as acceptance tests they ask an implementer for nothing about Fuchsian equations. If they are kept as sanity checks of the conventions, mark them so; the statement that tests the roadmap is the one with exponents defined from `f`, `g` (the converse bullet of 1.1), which is statable with `fuchsian_partial_fractions`'s data.

## C04 — The module docstring's reason for omitting the Jacobi form contradicts README 2.4

The docstring says the Jacobi form needs "the Jacobian elliptic functions of complex argument"; README 2.4 states it for real `ζ ∈ (0, K(k))` with `TauCeti.Real.jacobiSn`, which the file already pins. Either state that real form, or name what is actually missing at the pins (for instance `cn`, `dn` or the quarter period `K(k)`).

## C05 — DLMF 31.9.2 does not write `(t − 1)^{δ−1}`

The Conventions (line 176) say "DLMF writes `(t − 1)^{δ−1}(t − a)^{ε−1}` (31.9.2, 31.10.2)". That is 31.10.2 (DLMF31-10 line 103); 31.9.2 has `(1 − t)^{δ−1}(t − a)^{ε−1}` (DLMF31-9 line 100). Attribute each form to its equation.

## N01 — Two targets cite Maier without a locator

2.3 and 8.2 cite the two papers as wholes. For 2.3: Maier 2007, §1 (the split into `2n` sets of `2^{n−2}(n − 1)!` expressions) and Theorem 4.3 (the automorphism group). For 8.2: Maier 2005, Theorems 3.7–3.8 (the list of reductions).

## N02 — Two wordings

The Summary cites Whittaker–Watson "§§10.6–10.72" while 1.2 uses §10.8 and the References give §§10.6–10.8. In "Beyond this roadmap", "for which no source is at hand" describes the author's desk, not the mathematics; drop the clause.

## Questions for the author

- 5.2 claims `F ≢ 0` for all complex parameters with `1 < ‖a‖`, `γ, δ ∉ {0, −1, …}` (and `exists_entire_heunEigenvalue01_iff` states it), but the sketch gives a reason only in the real case ("by the oscillation estimate below"). What is the argument for complex `a` and complex exponents? I believe the statement but could not find a proof in a source I can read; DLMF §31.4 only asserts a discrete set.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 Fuchs relation | Heun; hypergeometric; `A = ∅` | sums `2`, `1`, `−1` against `#A − 1 = 2, 1, −1`; `∞` polynomial `X(X+1) − f₀X + g₀` from `w = z^{−ρ}` | holds | none |
| 1.2 rigidity | hypergeometric equation | residues `c`, `a+b+1−c`, `C₁ = ∓ab`; `0·C₁(0) + 1·C₁(1) = ab = σσ′` | holds | none |
| 1.3 accessory parameter | `(3, 0.3, 1.1, C₀ = −0.7/3)` | `q = 0.7`, `C₁ = 0.185`, `C_a = 0.048333`; numerator `αβz + aC₀` | holds | C03 |
| 1.4 normal form | general; `γ=δ=ε=1` | `A, B, C` from residues of `f²/4 + f′/2 − g`; `A+B+C = 0`; `D = −¼` | holds | none |
| 2.1 F-homotopic | all three points; `U ∋ 1` | new `q`: `+(aδ+ε)(1−γ)`, `+aγ(1−δ)`, `+γ(1−ε)`; residual `5·10⁻¹⁶` good, `−0.3487` without `ε`; junk point `−0.115` | false for `U ∋ 1` | R03 |
| 2.2 homographies (sampled) | `z/a`, `1−z`, `z/(z−1)`; `a = 2`, `e^{iπ/3}` | orbit `{2, ½, −1}`, two values; junk terms equal for affine maps, differ by `−γw′ + …` for third | third false for `U ∋ 0` | R03 |
| 2.3 the 192 (sampled) | orbit at `(7/2, 7/10, 3/10, 11/10, 4/5, 9/20)` over `ℚ` | `192` unordered, `384` ordered; `a′ ∈ {7/2, 2/7, −5/2, −2/5, 7/5, 5/7}`; Kummer `6 × 4` | targets hold; Check false | R05 |
| 2.4 trigonometric form | chain rule with `z = sin² θ` | `2sc·f − (cot − tan)` gives `(2γ−1)cot − (2δ−1)tan − ε sin 2θ/(a − s²)`; `4s²c² g = 4(αβs² − q)/(a − s²)` | holds | none |
| 3.1 local solution (sampled) | `(3, 0.7, 0.3, 1.1, 0.8, 0.45)`, `z = 0.3` | `Hl = 1.1030609539`, residual `0`; uniqueness needs `1 − γ ∉ {1, 2, …}` | holds | R04 (Perron) |
| 3.2 other points (sampled) | `∞` at `z = 5` | corrected residuals `−2·10⁻¹⁷`, `−1·10⁻¹⁷`; printed sign `−1.631·10⁻³`, `−1.193·10⁻²`; 31.3.9 from 2.1 at `u = 0` | holds | none |
| 3.3 equivalent expressions (sampled) | `z = 0.3` | both differences `0`; keeping `δ`: `5.352·10⁻³` | holds | none |
| 3.4 boundary circle (sampled) | exponent at `1` | singular part `(1−z)^{1−δ}` gives `j^{Re δ − 2}`, summable iff `Re δ < 1`; `δ = 1`: `1/j` | holds | R04 (Darboux) |
| 3.5 connection (sampled) | `a = 1.2` | `f₁` converges on `(0.8, 1)` only | wording | C02 |
| 4.1 criterion (sampled) | `n = 0, 1`; Kristensson example | `det = q`; `q² + Q₁q + aγβ`; roots `−1.31296, −4.38704`, `h = 1.82793, 0.54707` | holds | none |
| 4.2 reality | `a = −1`; `a = 2`, `δ = ±1` | `R_{j−1}P_j > 0`; roots `±√3`; `−2 ± √2`; `−1 ± i` | holds | none |
| 5.2 eigenvalues | `(3, −1, 2.4, 0.8, 0.45)` | zeros `0` and `1` in `(0,1)` for `q₀ > q₁`; boundary terms `p → 0` | real case holds | question |
| 5.4 series | Type I, Type II; `a = ½ + i` | semi-axis `√5/2`; Type I limit analytic at `a`, exponent `α` at `∞` | second bullet false | R01 |
| 6.1 orthogonality (sampled) | loop factor | `(I₀ + I₁)(1 − e^{2πiγ})(1 − e^{2πiδ})`; `0` at `γ = δ = 1` | holds | C05 |
| 6.2 double orthogonality | eigenvalue pairs | `(L_s − L_t)u/(s − t) = nβ_n u`, `(tL_s − sL_t)u/(t − s) = q u`; `nβ_n` increasing | holds | none |
| 6.3 integral transforms (sampled) | `K ≡ 1` | `(D_z − D_t)1 = αβ(z − t)`; `q∫wρ = [pw′]` | holds | none |
| 6.4 kernels | `G = X²Y + 3Y²`, `XY³ + X³` at three points, `a = 7/2` | corrected ratios equal (`0.52500`, `0.90865`, `0.26630`); printed differ (`−0.653` vs `0.839`); exponent sum `≠ 1` | first bullet holds, second false | R02 |
| 7.1 the four equations (sampled) | ranks | `l = 2, 2, 3, 4`; biconfluent exponents `{0, 1 + γ}` | holds | none |
| 7.2 confluence | `(0.6, 0.35, −0.4, 0.8, 0.45)`, `z = ½` | `1.3428769372`; differences `4.645·10⁻³, 4.547·10⁻⁴, 4.537·10⁻⁵, 4.536·10⁻⁶`; recurrence limits termwise | holds | none |
| 7.3 further confluences (sampled) | three substitutions | limits `γ/t + δ/t² + 1`; `−(γ/t + δ + t)`; `t(γ + t)`, `αt − q` | holds | none |
| 7.4 rank one | confluent; doubly confluent; Kummer | `μ = −α/ε`, `α/ε − γ − δ`; `−α`, `α − γ`; `−a`, `a − b` | holds | R06 (example) |
| 8.1 degenerate cases (sampled) | `(0.3, 1.1, 0.8, 0.3)` | `1.1617152329` three ways; `q = 0.43`: `1.2170049392` | holds | none |
| 8.2 reductions (sampled) | same point | differences `−2·10⁻¹⁶`, `2·10⁻¹⁶`, `5·10⁻¹³`; wrong `δ`: `3.419·10⁻³`; `2r + r² < 1`, `0.926 < 1` | holds | none |

- Source locators checked against the text: 31 DLMF equations (31.2.2–4, 31.3.1–13, 31.4.2, 31.5.1–2, 31.7.1–5, 31.9.1–6, 31.10.7–10, 31.11.10–17, 31.12.1–4, 31.14.1–5) and two Maier statements.
- Library declarations: all 20 pinned names resolve when the file is elaborated; `TauCeti.Real.jacobiSn : ℝ → ℝ → ℝ`, `PeriodPair.weierstrassP : PeriodPair → ℂ → ℂ`.
- Cross-roadmap citations resolved on main: SpecialFunctionsHypergeometric 1.3, 3.1, 3.2, 3.4, 5.3; AsymptoticExpansions §§10.2–10.5; SpecialFunctionsBessel (Sturm comparison, its 10.1); LaguerreJacobi 3.2–3.3 and Layer 4; PainleveEquations Layers 2–3, 7.2, 7.4.
- Dependency check: `depcheck: 200 roadmaps, 2191 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: exit 0, 36 `sorry` warnings and no other; the 36 signatures compared with the README, no binder lost (no `variable` block is used).
- One-tactic probe (`rfl`, `simp`, `simp [heunEps]`) on a copy: none of the 36 closes; two are algebra on hypotheses by reading (C03).
- Overlap check: read SpecialFunctionsMathieu, SpecialFunctionsConfluent, SpecialFunctionsLegendre (open) and SpecialFunctionsHypergeometric, SpecialFunctionsBessel, SpecialFunctionsAppell (main); nothing shared with these. Shared with other roadmaps on main: Pincherle's theorem (owner SpecialFunctionsEiLiErfIncompleteGamma 4.1), Darboux's method (owner AsymptoticExpansions §13.6), recessive solutions of the recurrence (owner AsymptoticExpansions §12.1); see R04.
- Source independence: 9 passages compared with 3 sources (DLMF Chapter 31, Maier 2007, Maier 2005), none shared beyond formulas; largest share DLMF, about 65 of 180 source mentions, then Ronveaux, about 54; contents compared with DLMF Chapter 31: independent (31.14 and 31.2 open the roadmap, 31.5 precedes 31.4, 31.11 is merged into Layer 5, 31.9 and 31.10 into Layer 6, 31.7 closes); Ronveaux's table of contents could not be read.
- Research link: Maier (2007) and Maier (2005) state the automorphism group of 2.3 and the reductions of 8.2; Dereziński–Ishkhanyan–Latosiński (2021), cited by PainleveEquations, pass from Heun-class equations to Painlevé equations. Rests on the two Maier texts read and on the README's consumers section.

## Not verifiable

- Ronveaux (ed.), *Heun's Differential Equations*: no legal copy found; all locators into Parts A, B, D, E unchecked (sampled targets 2.2, 2.3, 3.1–3.3, 3.5, 4.1, 6.1, 6.3, 7.1, 7.3, 8.1 were checked against DLMF instead).
- Kristensson: paywalled; Theorem 3.1, §4.4.1, (8.4)–(8.6), Theorem 8.1 (the only source of 3.4), Example 8.1, Theorem 8.2, §8.5 unchecked.
- Haraoka, Iwasaki–Kimura–Shimomura–Yoshida, Olver: paywalled; the locators of 1.1, 1.2 and 7.1 unchecked.
- Whittaker–Watson: no copy reached through the sources service; §§10.6–10.8 and Ch. XXIII examples 7–10 unchecked.
- The 2010 printed Handbook: the three printed forms said to be false were not read; the online errata for 31.3.10–11 and 31.12.3 were (DLMF31-3 line 414, DLMF31-12 line 170).
- Numerical Checks not recomputed: the slopes of 3.4, the quadratures of 6.1 and 6.2, the three ratios of 6.4 at the README's own points (not given).

Automatic checks set aside as false positives: the section comment at the end of `Suggested.lean` that has no declaration under it introduces the `#check` lines pinning library declarations, which are allowed there.

## Source issues

- **Error** in DLMF Chapter 31 at equation 31.10.8 (online release read 2026-11-19): the source says the coefficient of the `φ`-derivative is `(1 − 2δ) cot φ − (1 − 2ε) tan φ`; it should be `(2δ − 1) cot φ − (2ε − 1) tan φ`, as the exponents `{0, 1 − δ}`, `{0, 1 − ε}` of its own 31.10.9 require; affects a stated result.

## For the human reviewers

- **Licence.** The README's "Prior formalization" says the roadmap reuses the design of the author's `lean-DLMF` (`DLMF/Heun/`, Apache-2.0). The declarations of `Suggested.lean` were not compared with that repository.
- **Not tested.** Ronveaux (ed.), the book with the second-largest share of locators and the main book source, could not be read: wording and arrangement were compared with DLMF and Maier only.
