# Review of SpecialFunctionsAppell (pull request #2166 at 9238be3)

**Verdict:** needs changes

Eight findings: one P2 (a false bound in the proof route of 5.3; the target it serves is true) and
seven P3. Every Lean statement and every sampled README statement was recomputed and holds; the
values are in the table under `## Verified sound`.

## R01 (P2) — 5.3: the bound on the fibres for large `y` is false, and the inference from it would prove too much

**Location.** `TauCetiRoadmap/SpecialFunctionsAppell/README.md` lines 729–730 and 739–740:
"`|F(α + m, β + m; γ′; y)| ≤ C (1 + m)^K |y|^{−m} (|y|^{−Re α} + |y|^{−Re β})`" and
"`√‖x‖ + 1 < √‖y‖`, so `‖x‖ < ‖y‖`, the fibre sum converges absolutely".

**Claim.** For `|y| ≥ R > 1`, `−y ∈ slitPlane`, the fibre is `O((1 + m)^K |y|^{−m})` with `C`, `K`
independent of `m` and `y`; convergence on `U` then follows from `‖x‖ < ‖y‖`.

**Witness.** `α = 0.3`, `β = 0.85`, `γ′ = 1.25`, `y = 5 + 0.1i`:
`|F(α+m, β+m; γ′; y)| · |y|^m = 3.6e3, 3.0e8, 3.5e18, 8.1e38` at `m = 10, 20, 40, 80`. At
`x = 3` (so `‖x‖ < ‖y‖`, outside `U`) the terms of the fibre sum are `37, 5.8e6, 6.6e17` at
`m = 20, 40, 80`. The series `F(α+m, α+m−γ′+1; α−β+1; 1/y)` that 15.8.2 produces is not bounded
polynomially in `m`: its coefficients grow like `C(m+n, n)²`.

**Repair.** Replace `|y|^{−m}` by `(√|y| − 1)^{−2m}` in both displayed bounds (lines 730 and 737),
with the reason: `|(A+m)ₙ (B+m)ₙ/((C)ₙ n!)| ≤ C (1 + m + n)^K ((m+n)!/(m! n!))²` and
`∑ₙ ((m+n)!/(m! n!))² tⁿ ≤ (1 − √t)^{−2m−2}` at `t = 1/|y|`, and
`|y|^{−m} (1 − |y|^{−1/2})^{−2m} = (√|y| − 1)^{−2m}`. Replace "so `‖x‖ < ‖y‖`" by
"so `‖x‖ < (√‖y‖ − 1)²`". This is exactly `U`, which also explains its shape. The maximum-modulus
step is unaffected (the new factor does not depend on `β`). Tested on the witness:
`|F| · (√|y| − 1)^{2m} = 0.025, 0.015, 0.0089, 0.0053` at `m = 10, 20, 40, 80`. The Lean statement
`analyticOnNhd_appellF4Fibre` needs no change.

## R02 (P3) — the gate fails: six supplier names read as this roadmap's own (`readme-ids-missing`)

**Location.** README lines 186–196 and 728: `regularizedGaussHypergeometric_eq_eulerIntegral`,
`…_shift_c`, `…_eq_regularizedGaussHGFun`, `…_comm`, `…_pfaff`, `…_connection_infty`.

**Claim.** These are SpecialFunctionsHypergeometric's declarations.

**Witness.** They exist there (`TauCetiRoadmap/SpecialFunctionsHypergeometric/Suggested.lean` lines
93, 101, 105, 124, 267, 271 on main), but `Suggested.lean` here declares a local
`regularizedGaussHypergeometric`, so the gate reads each prefixed name as a claim that this file
declares it. No acceptance while the gate fails.

**Repair.** State each fact in prose with its section and DLMF number and without the backticked
name, for example "Its 5.1: Pfaff's transformation 15.8.1 and the connection formula 15.8.2 at
infinity, in the form with the factor `sin(π(b − a))/π` that holds for all parameters". Do not add
declarations.

## R03 (P3) — 3.2: the systems of `G₂` and `G₃` have no locator, and the ownership table attributes them to DLMF

**Location.** README line 68, "`16.14.1–16.14.6 | The systems of F₁–F₄, and Horn's G₂, G₃ with
their systems`", and lines 499–512.

**Witness.** DLMF §16.14(ii) gives only the two series 16.14.5 and 16.14.6 and the sentence that
such series satisfy pairs of second-order equations (DLMF §16.14, source text lines 178–234); the
four displayed equations are not there.

**Repair.** In the table, write "16.14.5–16.14.6: the series of `G₂`, `G₃`", and list their systems
with the auxiliary results. In 3.2 give the locator of the systems (DLMF points to Erdélyi et al.
1953, §5.9 for the systems and §§5.7.1–5.7.2 for the series; give the equation numbers), or say
that they are derived here from the coefficient recurrences, which is what 3.2 does. The four
equations themselves are correct (table below).

## R04 (P3) — 3.2: `hornG2` and `hornG3` have one Check each

**Location.** README lines 514–516.

**Claim.** Every definition has at least three discriminating Checks. Each of the two has one
decimal value, which the conventions call an illustration and not a target.

**Repair.** Add exact Checks that pin the direction of the integer indices, for example:
- `G₂(α, 0; β, β′; x, y) = F(α, β′; 1 − β; −x)` for `|x| < 1` (both sides `0.90520 28618…` at
  `α = 0.3`, `β = 0.45`, `β′ = 0.7`, `x = 0.3`); exchanging `n − m` and `m − n` gives
  `F(α, β; 1 − β′; −x)` instead;
- the coefficient of `x` in `G₂` is `α β′/(β − 1)` and the coefficient of `y` in `G₃` is
  `α(α + 1)/(α′ − 1)`;
- `G₃(α, α′; 0, y) = ∑ₙ (α)_{2n} (−1)ⁿ yⁿ/((1 − α′)ₙ n!)` (both sides `0.93072 62972…` at
  `α = 0.3`, `α′ = 0.55`, `y = 0.1`);
- a negative control: at `β = 1` the term `m = 1, n = 0` of `hornG2` is `0` (Mathlib's
  `Γ(0) = 0`), where the series has a pole, so the hypothesis `β ∉ ℤ` is needed.

## R05 (P3) — `*Needs:*` lines: missing in 2.4 and 4.1, one line for the five reductions of 4.2, an unused item in 2.2

**Location.** README 2.4 (lines 429–445) and 4.1 (lines 536–562) have no `*Needs:*` line; line
601–602 is one line for 16.16.1–16.16.5 and, by position, for 4.1; line 383 "*Needs:* Layer 1, 2.1".

**Witness.** The routes differ: 16.16.1 uses 4.1 and 1.2 only; 16.16.2 uses the series and the Tau
Ceti binomial series; 16.16.3 uses 1.4, 2.3, the supplier's Euler integral and the binomial series;
16.16.4 uses the supplier's 4.2 (Chu–Vandermonde); 16.16.5 uses 16.16.4 and 16.16.1. The shift
relations of 2.2 are coefficient identities and use nothing of 2.1.

**Repair.** Add "*Needs:* 2.1–2.3; SpecialFunctionsHypergeometric 1.4" to 2.4 and "*Needs:* 2.3–2.4"
to 4.1; give each bullet of 4.2 its own needs as above; make 2.2 "*Needs:* 1.1".

## R06 (P3) — 5.1 and 5.2: the coefficient identities are owned but never stated, and their proof is given as a certificate that does not exist yet

**Location.** README line 80 ("Finite identities of Pochhammer symbols … with recurrence
certificates"), lines 630–633 ("the target includes their equality, proved by a recurrence in `m`
and `n` with an explicit rational certificate checked by `ring` or `field_simp`") and lines 669–672.

**Claim.** The identity that carries 16.16.7 (and the one that carries 16.15.4) is a target.

**Witness.** Neither identity is written down, and README line 792 says the prior formalization's
16.15.4, 16.16.5_5 and 16.16.7 are open, so no such certificate is known. Certificates and tactic
names are not roadmap content.

**Repair.** State the identities. For 16.16.7, with `δ = α + β − γ − γ′ + 1` and all `M, N ≥ 0`:

```text
∑_{m ≤ M, n ≤ N} (−1)^{M−m+N−n} C(n, M−m) C(m, N−n) (α)_{m+n} (β)_{m+n} / ((γ)ₘ (γ′)ₙ m! n!)
  = ∑_{k ≤ min(M,N)} (α)ₖ (β)ₖ (δ)ₖ / ((γ)ₖ (γ′)ₖ k!)
      · (α+k)_{M−k} (β+k)_{M−k} / ((γ+k)_{M−k} (M−k)!) · (α+k)_{N−k} (β+k)_{N−k} / ((γ′+k)_{N−k} (N−k)!)
```

(tested for `M, N < 6` at `α = 0.3`, `β = 0.85`, `γ = 1.6`, `γ′ = 1.25`: the two sides agree to
17 digits). Do the same for 16.15.4. Name the route by its inputs ("a recurrence in `M` and `N`
satisfied by both sides, with the values at `M = 0` or `N = 0`") or cite Burchnall and Chaundy
(1940) with the equation number (DLMF gives (68) for 16.15.4), and drop "certificate checked by
`ring` or `field_simp`" and "with recurrence certificates". Drop "are still `sorry`" on line 792
or state it without the time reference.

## R07 (P3) — padding: `isOpen_appellDomain1`

**Location.** `TauCetiRoadmap/SpecialFunctionsAppell/Suggested.lean` line 280.

**Witness.** On a scratch copy it closes with
`unfold appellDomain1; exact (isOpen_slitPlane.preimage (by fun_prop)).inter (isOpen_slitPlane.preimage (by fun_prop))`.
The other 56 theorems do not close under `rfl`, `simp`, `simp` with the domain definitions,
`infer_instance`, `fun_prop`, or `field_simp` after unfolding.

**Repair.** Delete it from `Suggested.lean`; README 2.1 keeps the statement in prose, without the
backticked name (the gate checks that name).

## R08 (P3) — two theorems have no docstring

**Location.** `Suggested.lean` lines 282 (`isConnected_appellDomain1`) and 287
(`starConvex_appellDomain2`); the docstring above each pair attaches to the first theorem only.

**Repair.** Give each its own docstring, for example "**2.1** `appellDomain1` is connected." and
"**2.1** `appellDomain2` is star-shaped about the origin."

## Verified sound

**Gate and build.** The worker's gate at this head fails on `readme-ids-missing` only (R02); every
other scanner is at 0. `lake env lean` on `Suggested.lean`: 57 `sorry` warnings and nothing else.
Dependency check output: `depcheck: 237 roadmaps, 2139 edges, 0 problem(s)`. No file outside the
folder is changed. There are no `variable` or `include` lines, so no declaration can lose a
binder; the 95 elaborated signatures were compared with the README statements, and all 95 declared
names occur in the README.

**Sources (step 2).** All 15 sampled subsections, read against DLMF §§16.13–16.16 (Release 1.2.8):
16.13.1–16.13.4 with their domains (the `F₄` domain is `√|x| + √|y| < 1` in the page's markup),
both equations of each of 16.14.1–16.14.4, 16.14.5–16.14.6 with their domains, 16.15.1–16.15.4
with their parameter regions and the triangle, 16.16.1–16.16.10 including 16.16.5_5. Every formula
in the README and in `Suggested.lean` agrees with the source, including the three exponents of
16.15.4 and the Gamma factors of 16.16.10. The README flags no locator as unverified.

**Adversarial table.** Standard parameters `P`: `α = 0.3`, `β = 0.45`, `β′ = 0.7`, `γ = 1.6`,
`γ′ = 1.25`, `α′ = 0.55`, point `p₀ = (0.2 + 0.1i, −0.25 + 0.15i)`. "Pole set": the seven
parameter choices `γ = −1`; `α = −2`; `(β, β′) = (−1, 1)`; `β′ = 0`; `(β′, γ) = (−1, −2)`;
`α = 0`; `(α, γ) = (−1, −3)`, at `(0.1 + 0.05i, −0.12 + 0.07i)`, regularized forms.

| Statement | Instances | Values (left; right) | Result |
|---|---|---|---|
| 1.1 Check `F₁` | `P`, `p₀` | `0.98534 81954 4253 + 0.02596 17300 5527i` | agrees |
| 1.1 convergence of `𝐅₄` | `r + s = 1` bound | `((m+n)!/(m!n!))² ‖x‖ᵐ‖y‖ⁿ ≤ ρ^{2m+2n}` | holds |
| 1.2 axes, `β′ = 0` | six identities, `P` | defects `≤ 4e−31` | hold |
| Layer 1 Example | `𝐅₁(1; 1, β′; −1; x, 0)`, `x = 0.3 + 0.2i` | `−0.28708 26253 + 0.60963 07690i`; `2x²/(1−x)³` same | holds; `appellF1` gives `0` |
| 1.3 `∂ₓ` of `𝐅₁`–`𝐅₄` | `P` | defects `≤ 8e−23` | hold |
| 1.4 four fibre expansions | `P` | defects `≤ 7e−30` | hold |
| 2.2 six shift relations | `P`; first also at `γ = −2` | defects `≤ 4e−30`; `3e−32` | hold, by hand too: `(c−a) + (a+k) = c+k`, `(a+1)ₖ − k(a+1)_{k−1} = (a)ₖ` |
| 2.3 existence route | shifts needed to reach the Euler region | `γ − α` is raised by combining the two relations of `𝐅₁` | route closes for `𝐅₁`, `𝐅₂`, `𝐅₃` |
| 16.15.1–16.15.3 | `P`, `p₀`, integral minus series | `2e−6` (quadrature), `3e−9`, `5e−9` | hold |
| 2.3 Check | `(2 + i, −3)` and conjugate | `0.84255 51403 357 + 0.12591 00090 748i`; conjugate | agrees |
| Layer 2 Examples | `F₂`, `F₃` | `0.92623 81376 + 0.03619 85091i`; `0.69879 34625 + 0.17627 92407i` | agree |
| 2.4 Example | `𝐅₁(1; 0, 1; 1; 0, −2)` | `𝐅(1, 1; 1; −2) = 1/3`; fibre terms `(−2)ⁿ` | holds |
| 16.14.1–16.14.4 (8 Lean equations) | `P`, finite differences of the series | defects `≤ 5e−24` | hold |
| 16.14.5, 16.14.6 Checks | README points | `1.28956 88302 38 − 0.34417 52507 33i`; `0.86214 41053 566 − 0.03245 47033 320i` | agree |
| Systems of `G₂`, `G₃` (4 Lean equations) | `(0.1 + 0.02i, 0.05 + 0.05i)` | defects `≤ 8e−20`; recurrences rederived by hand | hold |
| `G₃` bound | `m > 2n` | `(2m−n)!/(m−2n)! ≤ 2^{2m−n}(m+n)!` | holds |
| 16.16.1–16.16.5, 16.16.8 (both), 16.16.9, DLMF form | `P`, `p₀` | the seven README values, each to 12 digits on both sides | agree |
| same, regularized | pole set | defects `≤ 3e−30` in all 56 cases | hold at every pole |
| same, principal branches far from the origin | `(2 + i, −3)` for 16.16.1, 16.16.4, 16.16.8; `(0.5 + 0.5i, −0.8)` for 16.16.3, 16.16.9; Euler integrals | both sides agree to 15 digits, e.g. 16.16.8: `0.06283 28467 + 0.08193 72484i` three times | hold |
| 4.1 intermediate identity | `P`, `p₀` | `0.98534 81954 4253 + 0.02596 17300 5527i` | holds |
| Domains `S` of Layer 4 | each argument and power | `1 − Y = (1−y)/(1−x)`, `1 − x/(1−y) = (1−x−y)/(1−y)`, `1 − (x+y−xy) = (1−x)(1−y)` | each `S` is the set where both sides are defined |
| `appellF4Polydisc` | worst case | `2√(0.2·1.2) = 0.9798 < 1` | holds |
| 16.16.7, 16.16.6, 16.16.5_5 | README point | `0.99900 88426 0847 + 0.00959 66916 4714i`; `0.92311 26866 0964 + 0.04292 54853 6748i`; `0.98044 70812 4809 + 0.01783 68312 0938i` | agree |
| same, regularized | pole set | defects `≤ 2e−29` | hold |
| 16.15.4 | README point | `1.00621 43714 8566 + 0.03076 28754 9502i` both sides | agrees |
| 16.16.10 | three README points | `0.63974 60136 565 + 0.02306 13488 454i`; `0.64821 87377 054 + 0.42058 10020 681i`; `0.58084 02439 711 − 0.02930 82269 601i` | agree |
| 16.16.10 derivation | fibre by fibre | `1/Γ(γ′−α−m) = (−1)ᵐ(1−γ′+α)ₘ/Γ(γ′−α)` gives the `F₄` coefficients | holds |
| 5.3 Example | `(0.1 + 0.05i, 0.2 − 0.1i)` | fibre sum `1.07351 32898 70 − 0.01857 98829 35i` = series | agrees |
| 5.3 bound for large `y` | `y = 5 + 0.1i` | see R01 | **false as written** |
| 5.3 maximum-modulus step | `d < ¼`, circle of radius `½` | distances `≥ ½ − d` from `n`, `≥ (1 − d) − ½` from other integers | holds |
| Layer 4 Example | `α = γ` | both sides `Γ(γ)⁻¹(1−x)^{−β}` | holds |

**Library declarations opened at the pins.** Mathlib: `Summable.of_norm_bounded`
(`Analysis/Normed/Group/InfiniteSum.lean:111`), `HasSum.prod_fiberwise`,
`Complex.regularizedGaussHGFun` (`Analysis/SpecialFunctions/RegularizedHypergeometric.lean:428`),
`ordinaryHypergeometric` (`OrdinaryHypergeometric.lean:81`), `Complex.Gamma_add_one`
(`Gamma/Basic.lean:312`, with `s ≠ 0`; the README's reciprocal form holds for all `s`),
`Complex.differentiable_one_div_Gamma` (`Gamma/Beta.lean:543`), `Complex.Gamma_mul_Gamma_one_sub`
(`:398`), `Complex.Gamma_add_nat_div_Gamma_eq` (`:481`), `Complex.betaIntegral` (`:60`),
`Complex.Gamma_mul_Gamma_eq_betaIntegral` (`:124`), `Complex.starConvex_one_slitPlane`
(`Analysis/Complex/Convex.lean:45`), `IsPreconnected.prod` (`Topology/Connected/Basic.lean:446`),
`MeasureTheory.integral_prod` (`MeasureTheory/Integral/Prod.lean:443`),
`AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`,
`hasDerivAt_integral_of_dominated_loc_of_deriv_le`. Tau Ceti:
`hasSum_multichoose_mul_geometric_complex_of_norm_lt_one` (`Analysis/Analytic/Binomial.lean:46`).
Neither library has an Appell or Horn function.

**Cross-roadmap citations resolved (on main).** SpecialFunctionsHypergeometric 1.2 (definition,
shifts, Euler's integral), 1.3 (the series), 1.4 (joint holomorphy, symmetry), 4.2 (15.4.24), 5.1
(15.8.1, 15.8.2 in the `sin` form for all parameters): each cited declaration exists there and
states what is used. The four local copies of its definitions have the same bodies and a different
namespace. No other roadmap on main or open pull request owns the Appell functions;
SpecialFunctionsGeneralizedHypergeometric (open) leaves §§16.13–16.16 to this roadmap. No overlap
item is listed for this roadmap.

**Headlines.** Every numbered formula of §§16.13–16.16 and the existence and uniqueness of the
three principal branches are stated; the module docstring names what is stated only in part. The
pull request's text agrees with the head (57 theorems, one supplier on main, the layer list).

## Not verifiable

- Erdélyi et al. 1953, §§5.7–5.10 (the systems of `G₂`, `G₃`; R03): no legal copy was reachable
  through the sources service. The four equations were checked by direct computation instead.
- Burchnall and Chaundy 1940, 1941 and Appell and Kampé de Fériet 1926: paywalled or not found;
  they are cited in the References only, and every target has a DLMF locator that was read.

## Source issues

- none
