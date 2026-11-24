# Review of HardyHilbertAndCarlemanInequalities (pull request #3056 at b63a396)

**Verdict:** needs changes

**Summary.** Changes are needed: three findings. The prose target for Theorem 338 in §2.1 claims a best constant that is false as written (for `p < 1/2` the constant `1` already works); the README places the non-strict weighted Hardy inequalities, and three other results, in Tau Ceti files that the pinned Tau Ceti does not contain, so the inequality §2.3 consumes has no owner at the pin; and the Schur-test sentence of the §1.2 proof route names a kernel whose row and column integrals are not `k`. There are three small corrections and no format note. Every Lean statement survived the degenerate-case pass and every numerical Check was recomputed and agrees, but none of the six cited books could be read legally, so no locator was checked against its text; that is left to the human reviewers.

## R01 (P1) — The reversed series inequality of §2.1 (Theorem 338) is stated without the division by `n`, and for that statement "the constant is best possible" is false

An implementer who takes the last prose target of §2.1 (lines 227–229) as written will be asked to prove a sharpness statement that fails. The target reads `∑' (aₙ + aₙ₊₁ + ⋯)^p > (p/(1 − p))^p ∑ aₙ^p` for `0 < p < 1`, with the first term weighted by `1 + 1/(1 − p)`, and adds that the constant is best possible.

Each tail dominates its first term, so the left side is at least `∑ aₙ^p + (1 − p)⁻¹ (∑ aₙ)^p > ∑ aₙ^p`: the inequality holds with the constant `1`. For `p < 1/2` the stated constant is smaller than `1` (at `p = 1/4` it is `(1/3)^(1/4) ≈ 0.7598`), so it is not best possible. The roadmap's own integral analogue, `hardy_reverse_lt` (Theorem 337), divides the tail by `x`: for `f = x^(-1/p − ε)` on `(1, ∞)` one gets `((∫ₓ^∞ f)/x)^p ≈ (p/(1 − p))^p x⁻¹` against `f^p ≈ x⁻¹`, which is where that constant comes from. The series statement needs the matching factor, `((aₙ + aₙ₊₁ + ⋯)/n)^p`, with `n + 1` in the roadmap's indexing from `0`.

The smallest change: restore the division by the index in the summand, and re-read the constant and the sharpness sentence against the source at Theorem 338 before keeping them (see the question below; I could not open the book).

## R02 (P2) — The Tau Ceti files that the README says hold the non-strict weighted Hardy inequalities are not in the pinned Tau Ceti, so the inequality that §2.2 disowns and §2.3 consumes has no owner at the pin

The introduction (lines 38–39), §2.2 (lines 245–249), the route of §2.3 (line 303, "in its non-strict Tau Ceti form") and *Scope and ownership* (lines 663–673) all say that Tau Ceti has formalized the non-strict prefix and tail inequalities with power weights, and the roadmap therefore does not state them. An implementer of §2.3 at the pin finds nothing to apply.

At the pinned commit (`2fd255d`) there is no `TauCeti/MeasureTheory/Integral/Hardy.lean`, no `TauCeti/Analysis/Normed/Interpolation/Lorentz.lean` and no `TauCeti/Analysis/ODE/Gronwall/Integrable.lean`; a search of the library for theorems named after Hardy finds only Hardy spaces (`Analysis/Fourier/Hardy/`) and `Analysis/Sobolev/Circle/HardyGraph.lean`, no Hardy inequality. `TauCeti/MeasureTheory/Integral/SchurTest.lean` contains exactly two theorems (lines 74 and 132), not the "bilinear form of Schur's test and its counting-measure case for convolution kernels on countable groups" of line 669. What the pin does have of the Grönwall claim is `TauCeti.le_mul_exp_of_le_add_mul_integral` (`TauCeti/Analysis/ODE/Gronwall.lean`, line 59), with a constant kernel `K`, not an integrable one.

The smallest change: make the non-strict prefix and tail inequalities with power weights a target of §2.2 (they follow from `hardy_rpow_weight_lt` and `hardy_tail_rpow_weight_lt` by treating a right-hand side equal to `0` or `⊤` separately, which the route can say in one sentence), point the route of §2.3 at that target, and reduce lines 663–673 to what the pin contains, each with its declaration name and file. If a later Tau Ceti has these files, the statements about them belong in the README once the pin has them.

## R03 (P2) — In the proof route of §1.2 the kernel given for Tau Ceti's Schur test does not have row and column integrals `k`

The route (lines 143–145) says the operator form follows "directly from Tau Ceti's Schur test … for the kernel `K(x, y) (x/y)^(1/p)` against the measure with density `x⁻¹`, whose row and column integrals are both `k`". An implementer who sets this up gets integrals that depend on the free variable, and the test does not apply.

With `dμ = dx/x` in both variables, `∫ K(x, y) (x/y)^(1/p) dx/x = y⁻¹ ∫₀^∞ K(t, 1) t^(1/p − 1) dt`. For the Hardy kernel at `p = 2` this is `2/y`, and the other integral is `(2/3)/x`; `k = 2`. The kernel that works is `L(x, y) = K(x, y) x^(1/q) y^(1/p)`: substituting `f(x) = x^(-1/p) φ(x)` turns the operator form into the bound for `L` on `L^p(dx/x)`, and `∫ L dx/x = ∫ K(t, 1) t^(-1/p) dt = k`, `∫ L dy/y = ∫ K(1, t) t^(-1/q) dt = k` by §1.1 (Hardy kernel, `p = 2`: both are `2`).

The smallest change: replace `K(x, y) (x/y)^(1/p)` by `K(x, y) x^(1/q) y^(1/p)` in that sentence.

## C01 — The Check labelled `tsum_hardy_sharp` in Layer 2 reports the ratios of the finite-section inequality

The Check (lines 313–314) gives `2.683` at `N = 10³` and `3.157` at `N = 10⁵` for `aₙ = (n + 1)^(-1/2)`, `n < N`. Those are the ratios with both sums stopped at `N`, the two sides of `sum_range_hardy_le` (I get `2.6831` and `3.1575`). The two sides of `tsum_hardy_sharp` for the truncated sequence include the averages beyond `N` and give `3.1931` and `3.4868`. Either relabel the Check as one of `sum_range_hardy_le`, or quote the series values.

## C02 — The supplier contract for UnboundedOperators points at a "comparison Check of §2.3" that the README does not contain

Line 746 says UnboundedOperators §4.8 "is the reference for the comparison Check of §2.3". The Checks of Layer 2 (lines 307–324) contain no comparison of `hardy_deriv_le` at `p = 2` with `∫|u′|² ≥ ¼ ∫|u/r|²`. Add that Check (at `p = 2` the constant `(p/(p − 1))^p` is `4`, the reciprocal of `¼`), or drop the clause.

## C03 — The pull request description repeats the claim about Tau Ceti's Hardy file

The description says "Tau Ceti already proves the non-strict weighted Hardy inequalities on `(0, ∞)` (`TauCeti/MeasureTheory/Integral/Hardy.lean`) and the integral Grönwall inequality; Scope names them and the roadmap restates neither". At the pin the file is absent (R02). After the repair the sentence should say that the non-strict forms are targets of §2.2 and name the Grönwall declaration the pin has.

## Questions for the author

- Theorem 338 of Hardy–Littlewood–Pólya: is the constant there `(p/(1 − p))^p`, and does the book say it is best possible? My recollection of the literature is that the book's constant for the series is `p^p` and that the constant `(p/(1 − p))^p` is a later result for a restricted range of `p`, but I could not read the book, so this is a question and not a claim.
- §3.3, route for `hilbert_two_exponents`: the step from Hardy's inequality for the exponent `q` to the bound on `∑ (m^(-λ) Bₘ)^(p')` seems to need the pointwise bound `Bₘ ≤ m^(1/q') ‖b‖_q` (it absorbs the factor `m^(1 − λ)`), not only the inclusion `ℓ^q ⊂ ℓ^(p')`. Is that what equation (9.14.2) of the source uses? I could not open the source to compare.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `kernelConstant`, second form | Hardy kernel `p = 3`; Hilbert kernel `p = 3`; substitution `x = 1/y` | `1.5`; both forms `2π/√3 = 3.6276`; integrand becomes `K(1, y) y^(-1/q)` | sound | none |
| 1.2 bilinear, operator, strict forms | Hardy kernel; `k = 0`, `k = ⊤`, zero norm; Hölder factors | `k = p/(p − 1)`; `0 · ⊤ = 0` cases hold; both factor integrals equal `k` | statements sound; Schur sentence wrong | R03 |
| 1.3 `tsum_tsum_kernel_le` | Riemann-sum comparison; kernel `⊤` near `0` | `∑ₘ K(m, n)(n/m)^(1/p) ≤ k`; `k = ⊤` gives trivial bound | sound | none |
| 1.4 reversed theorem | tail Hardy kernel `y⁻¹ 1_{x > y}`; reverse Minkowski | `k = p/(1 − p)`, agrees with `hardy_reverse_lt`; `‖Tf‖_p ≥ k‖f‖_p` | sound | none |
| Layer 1 Checks | `1/max(x, y)` at `p = 3`; log kernel at `p = 3` | `4.5 = p + p' = p p'`; quadrature `13.15947` against `4π²/3 = 13.15947` | sound | none |
| 2.1 finite sections, strict, sharp, weighted, Copson | Elliott's identity; `a = e₀`; `p = 2` truncations | identity gives `−(n + 1)/(p − 1)` coefficient; `π²/6 < 4`; ratios `2.6831`, `3.1575` (sections), `3.1931`, `3.4868` (series); Copson `1 < p^p` | sound; Check mislabelled | C01 |
| 2.1 Theorem 338 target | lower bound by first terms; `p = 1/4` | left side `≥ ∑ aₙ^p`; stated constant `0.7598 < 1` | sharpness false as written | R01 |
| 2.2 weighted, tail, sharp, Riemann–Liouville, reversed | kernel constant; extremal family `p = 2`, `ε = −1/2`; `r = 1`, `r = 2`; `f = e^(-x)`, `p = 1/2` | `(1 − 1/p − ε)⁻¹`; ratios `0.6667`, `0.9091`, `0.9901`; `p/(p − 1)`, `4/3`; `2 < √(2π) = 2.5066` | sound | none |
| 2.3 `hardy_deriv_le` | `F(x) = ∫₀ˣ F'` when `∫|F'|^p < ∞`; `p = 2` | constant `4`, reciprocal of `¼` in UnboundedOperators §4.8 | sound; supplier absent at pin | R02, C02 |
| 3.1 constant, inequality, strict, sharp | `p = 2`, `p = 4`; Beta parameters `a = 1 − 1/p`, `b = 1/p`; Garling's family | `π`, `π√2 = 4.44288`; integrand `x^(-1/p)(1 + x)⁻¹`; `‖f_λ‖_p = 1` | sound | none |
| 3.2 series, strict, sharp, operator form | Jensen on unit squares; `a = b = e₀`; truncations `p = 2`; weighted step functions | cell average `> 1/(m + n + 1)`; `1 < π`; `2.2212`, `2.4470`; weights `λₘ^(1/q) μₙ^(1/p)` | sound | none |
| 3.3 `hilbert_two_exponents` | exponent count in the diagonal split | `λ = 1/p' + 1/q'`; total power of `m` is `0`; needs `p' ≥ q` | sound | none |
| 4.1 Pólya, Carleman, sharp | `c₀ = 2`, `c₀c₁ = 9`; `a = e₀`; `aₙ = 1/(n + 1)` | product `(n + 2)^(n + 1)`; `1 ≤ 2 < e`; ratios `2.1655`, `2.3750` | sound | none |
| 4.2 Knopp, sharp | `f = e^(-x)`; family with `ε = 0.5, 0.1, 0.01, 0.001`; junk value of `∫ log f` | `2 < e`; `2.3153`, `2.6114`, `2.7067`, `2.7171`; without `hlog` left side would be `⊤` | sound | none |
| 5.1 sufficiency, necessity | `u` not locally in `L^(p')`; `A = 0`; `q < 1` in necessity; `p = q = ∞` | `v = 0` beyond the bad point; `Tf = 0` a.e.; test functions give `‖v 1_{>X}‖_q ∫ u f ≤ C‖f‖_p` | sound | none |
| 5.2 sharp `p = q`, exponent `1` | integration by parts; power weights `p = 3`, `ε = 0.2`; exchanged exponents | constant `p (p')^(p − 1) A^p`; `A = 1.13386`, bound `2.142857 = (1/p' − ε)⁻¹`, `4A = 4.5354`; `2^(2/3) > 1.5` | sound | none |
| 6.1 Opial and equality cases | tent on `[0, 2]`; `sin(πx/h)`; `f = x` on `[0, 2]` | `1 = 1`; `1 ≤ π²/8`; `2 > 1` without `f(h) = 0`, `2 = 2` for one endpoint | sound | none |
| 6.2 Bihari, Osgood | `w = s²`, `k = 1/2`, `t = 1`; `w = s`; `w = √s`, `u = t²/4` | `1/k − 1/u = 1 = t`; Grönwall; `∫₀ᵗ √u = t²/4` | sound | none |

- Source locators checked against the text: 0 of 109 (no cited book could be read legally).
- Library declarations opened at the pin: 14 (among them `TauCeti/MeasureTheory/Integral/SchurTest.lean` lines 74 and 132, `MinkowskiIntegral.lean` line 199, `Analysis/SpecialFunctions/Beta.lean` line 456, `Analysis/ODE/Gronwall.lean` line 59; Mathlib `Gamma/Beta.lean` line 512, `Convex/Integral.lean` line 196, `Complex/Exponential.lean` lines 620 and 650, `ODE/Gronwall.lean` line 112).
- Library files cited by the README and absent at the pin: 3 (R02).
- Cross-roadmap citations resolved on main: 5 (UnboundedOperators §4.8 with UO-D07, SieveMethodsAndPrimePatterns §2.9, AnalyticNumberTheoryPartI §1.5a, PDE §2.3, Isoperimetry Layer 2), all present.
- Duplication by object: no Carleman, Knopp, Opial, Bihari, Osgood, Muckenhoupt or Hilbert `1/(x + y)` statement in the pinned Mathlib or Tau Ceti, and none in another roadmap on main or at an open head; no `Suggested.lean` name collision.
- Dependency check: `depcheck: 14 roadmaps, 196 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: the worker's targeted build passed; the one-tactic probe (`rfl`, `simp`) on a copy left all 43 theorems open, with no error. The file has no `variable` block, so no declaration can lose a section binder; the 46 elaborated signatures were compared with the README statements, no difference.
- Automatic checks: all passed; none set aside.

Overlap check: read MeansMajorizationAndDiscreteInequalities, DiracScatteringAndNonlinearFourierTransform, Isoperimetry; nothing shared (the first names Hardy, Hilbert and Carleman inequalities as outside its scope, in its scope section and its "Beyond" section; the second has only Hardy spaces of the half-plane; the third only rearrangements of functions).

Source independence: 0 passages compared with 0 sources, because none of the six cited books could be read; largest share Hardy–Littlewood–Pólya, 51 of 103 source mentions in the layers; its contents page was not read, so the comparison of contents was not made. Layers 5 and 6 cite other books only, and Layer 1 precedes Hardy's and Hilbert's inequalities because both are derived from it.

Research link: Layer 5 is the Muckenhoupt criterion for weighted Hardy operators as cited from Edmunds–Evans (2004) and Balinsky–Evans–Lewis (2015); §2.3 supplies the Hardy inequality that UnboundedOperators §4.8 uses for Sturm–Liouville operators. This rests on the README's references and its section on downstream consumers, not on a source text.

## Not verifiable

- Hardy–Littlewood–Pólya, *Inequalities* (targets 1.1–1.4, 2.1, 2.2, 3.1–3.3, 4.1, 4.2): no legal copy found; theorem numbers, pages and hypotheses not checked.
- Garling, *Inequalities: A Journey into Linear Analysis* (3.1, 3.2, 4.1, 2.1): publisher page only, not open.
- Balinsky–Evans–Lewis (2.2, 2.3, 5.1, 5.2) and Edmunds–Evans (5.1, 5.2): paywalled publisher; cited by locator alone.
- Mitrinović, *Analytic Inequalities* (6.1): paywalled publisher; cited by locator alone.
- Pachpatte, *Inequalities for Differential and Integral Equations* (6.2): no legal copy found.
- The wording and arrangement comparison with the sources, for the same reason.
- Whether a Tau Ceti later than the pin contains the files named in R02.

## Source issues

- none

## For the human reviewers

- **Not tested.** Hardy–Littlewood–Pólya has the largest share of the locators (51 of 103 mentions); neither its text nor its contents page could be read, so wording, arrangement and every locator are unchecked against it and the other five books.
- **Licence.** The README's section "Prior formalization" names the author's repository lean-CKMA (Apache 2.0, commit f4bd822) as the starting point for §§2.1, 3.1, 3.2 and 4.1; `Suggested.lean` was not compared with that repository.
- **Scope.** The headline results are classical (the main source is from 1934); the README connects them to current work only through the two monographs on Hardy operators (2004, 2015) and the consumer UnboundedOperators §4.8.
