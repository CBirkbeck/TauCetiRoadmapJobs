# Review of SteinsMethodForNormalApproximation (pull request #2790 at b3fd34e)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every identity, constant and printed number of the four layers was re-derived or recomputed and agrees with the text, the nine `sorry` statements say what the README says, and every Ross locator is right; Daly's paper could not be fetched, so its locators (all of 2.2, two in 2.1, one in 1.1) are unverified, although the mathematics they support was checked independently. There is one small correction and two format notes, none blocking. One item is left to the human reviewers (the unread source).

## C01 — The independence lemma cited for 4.1 asks for measurable variables, and the hypotheses give only almost-everywhere measurability

An implementer who follows the route of 4.1 (line 320) and the Needs line (line 342) applies `ProbabilityTheory.iIndepFun.indepFun_finset` and is stopped at its hypothesis `hf_meas : ∀ i, Measurable (f i)` (`Mathlib/Probability/Independence/Basic.lean`, line 803): the statement of 4.1 assumes `MemLp (X i) 3 P`, which gives `AEStronglyMeasurable` only. The variant that applies is `ProbabilityTheory.iIndepFun.indepFun_finset₀` (same file, line 811, hypothesis `AEMeasurable (f i) μ`). Cite that one in the route, the Needs line, the layer's Dependencies and the Mathlib contract.

## N01 — The route of 2.1 uses the fundamental theorem of calculus for Lipschitz functions, which its Needs line does not list

The route writes `h(t) − h(x)` as the integral of the almost-everywhere derivative and, at the end, passes from `|f_h″| ≤ 2K` almost everywhere to a Lipschitz constant. Both steps are at the pin: `LipschitzOnWith.absolutelyContinuousOnInterval` (`Mathlib/MeasureTheory/Function/AbsolutelyContinuous.lean`, line 310) and `AbsolutelyContinuousOnInterval.integral_deriv_eq_sub` (`Mathlib/MeasureTheory/Integral/IntervalIntegral/AbsolutelyContinuousFun.lean`, line 227). Listing them beside `LipschitzWith.ae_differentiableAt` would make the Needs line complete.

## N02 — Two short names are also proposed by PoissonApproximation

`steinSolution` and `abs_steinSolution_le` are declared here and, for the Poisson law, in PoissonApproximation's `Suggested.lean` (2.2 and 2.3 there). The namespaces differ, so nothing clashes in the roadmaps; in the library the two will need distinct names. A sentence in the scope paragraph on PoissonApproximation would settle which roadmap qualifies its name.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 Stein solution and equation | `h = x`, `x²`, `\|x\|` at 0, `h ≡ 1` | `f = −1`: `0 + w = w`; `f = −w`: `−1 + w² = w² − 1`; `f(0) = 1 − √(2/π)·√(2π)/2 = 0`; `f ≡ 0` | holds | none |
| 1.1 Lean `hasDerivAt_steinSolution` | derivative of `e^(w²/2)·I(w)` by the product rule | `w f + (h(w) − γh)`, equal to the stated value | README = Lean | none |
| 1.2 characterization, direct half | `f = x(1 − x²)²`, `N(0, v)` | `(1 − v) E f′`: `−0.021873` (v = 4), `0.201839` (v = 1/4), `0` (v = 1) | matches Check | none |
| 1.2 converse and negative controls | `δ₀`; uniform on `[−√3, √3]`; masses at `±1` | `f′(0) = 1`; `−(16/105)/(2√3) = −0.043988`; `f(±1) = f′(±1) = 0` gives `0` | matches; one `f` does not suffice | none |
| 1.2 route | `ψ − (γψ)ρ`, support of `f_ψ` | `∫ψφ = 0` kills `f_ψ` right of the support; `μ = cγ`, masses give `c = 1` | sound | none |
| 2.1 first bound `\|f_h\| ≤ K` | bracket with weights `wΦ + φ`, `φ − w(1 − Φ)` | `(1 − Φ)(wΦ + φ) + Φ(φ − w(1 − Φ)) = φ`; `h = x`: `\|f\| = 1`; `\|x − 1\|`: `f(−40) = 0.995837`, `f(40) = −0.945868` | holds, attained | none |
| 2.1 second bound `√(2/π) K` | `g(w)` expanded from the two coefficients | `g = 2φ + 2w(2Φ − 1) − 2cw²Φ(1 − Φ)`; `g(0, 1, 3, 10) = 0.79788, 0.74602, 0.51744, 0.19428`; decreasing on a grid of `[0, 15]` | holds, attained by `−\|x\|` | none |
| 2.1 third bound `2K` | weighted sum of the `f″` coefficients; nearest-integer `h` | sum `= (1 + w²) − w² = 1`; `f″(n−) = −1.738292` (n = 4), `−1.998747` (n = 40); `sin`: `0.275222`; `\|x\|`: `1` | holds, constant sharp | none |
| 2.1 Mills-ratio input | DLMF 7.8.2 at `x = w/√2` | `2/(w + √(w² + 4)) ≥ w/(1 + w²)` iff `4 ≥ 0`; `2/(w + √(w² + 8/π)) < 1/w` | supplier statement suffices | none |
| 2.1 reflection | `h(−x)` | `f(w) = −f_h(−w)` by `t ↦ −t` and `∫(h − γh)φ = 0` | holds | none |
| 2.2 Daly's bound | `k = 0` by hand; `k = 1`: `sin x`, `sin 3x`, `log cosh`; `k = 2`: `arctan` | `k = 0`: `f″ − h′ ∈ [−sup h′, 0]`; sups `0.204285` (≤ 2), `6.937557` (≤ 18), `0.250866` (≤ 1), `1.199832` (≤ 5/2) | consistent; `h‴` of `arctan` ranges over `[−2, 1/2]` | none |
| 2.2 Lean hypotheses | `a > b`; `k = 0` | hypothesis empty; `iteratedDeriv 2` is the true `f″ = f + w f′ + h′` when `h` is differentiable | README = Lean | none |
| 3.1 bound through the Stein class | `δ₀`; masses at `±1`; Cauchy | `E\|Z\| = 0.79788 = sup \|f′(0)\|`; `4Φ(1) + 4φ(1) − 2φ(0) − 3 = 0.53538`; both sides `∞` via `min(\|x\|, R)` | holds, equality at `δ₀` | none |
| 3.1 non-integrable integrands | `f = f_{h_R}` | `x f = f′ − h_R + γh_R` bounded, so the Bochner integral is the true one | no junk value used | none |
| 4.1 independent sums | 1 and 9 signs; Bernoulli `p = 1/5`, `n = 4`; `N(0,1)`; no third moment | `W₁ = 0.53538, 0.16819, 0.360389`; bounds `3, 1, 1.65` (and `2.55`); `3.19`; right side `≤ 0.2 < 0.69` | holds; hypothesis needed | none |
| 4.1 route | Taylor remainder, independence | `\|Rᵢ\| ≤ Xᵢ²`, `\|f′(W) − f′(Wᵢ)\| ≤ 2\|Xᵢ\|`, sum `2∑EXᵢ²E\|Xᵢ\| + ∑E\|Xᵢ\|³` | constants right | C01 |
| 4.2 dependency neighbourhoods | signs with `Nᵢ = {i}`; moving sums `n = 5, 11`; `Xᵢ = εᵢεᵢ₊₁ + εᵢ₊₂`, `n = 3, 6, 9` | `W₁ = 0.37603, 0.25708, 0.17864` vs `n^(−1/2)`; `0.123147` vs `1.522641`; `0.078518` vs `1.046688`; `E T = σ²` in all | holds | none |
| 4.2 negative control | `X₁ = X₂ = ε`, `Nᵢ = {i}` and `{1, 2}` | `E T = 2 ≠ 4`, right side `0.25 < 0.53538`; with `{1, 2}` right side `1` | independence needed | none |
| 4.2 Lean | `σ < 0`; `Nᵢ` everything; `i ∉ Nᵢ` | `hσ` excludes the sign; empty complement is trivially independent; `Xᵢ` a.s. `0` | README = Lean | none |

- Source locators checked against the text: 11 (Ross: Lemmas 2.1, 2.2, 2.5, Theorems 3.1, 3.2, 3.5, Lemma 3.4, (3.11), (3.12), remarks on pp. 10 and 15); 8 Daly locators not checked.
- Library declarations opened at the pin: 14 (Mathlib 9, Tau Ceti 5), each in the file the README names.
- Cross-roadmap citations resolved: RandomMatrices 2.5, MathematicalStatisticsFoundations 4.4 (`gaussian_integration_by_parts`), SpecialFunctionsEiLiErfIncompleteGamma 12.2 (`millsRatio_bounds`), OptimalTransport 3.7 and 3.8, all on main; PoissonApproximation 3.1, MathematicalStatisticsHigherOrderAndResampling 1.1, 1.2, Layers 2 and 4, KernelsAndSpectralMethods 11.1 and 11.2 at their open heads (scope only).
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/SteinsMethodForNormalApproximation/Suggested.lean`: nine `sorry` warnings, nothing else. `#check`-level types of all 11 declarations compared with the README: none lost a binder, nothing changed.
- One-tactic probe (`rfl`, `simp` with both definitions unfolded, `infer_instance`): none of the 9 theorems closes. All headline theorems of the README are stated; no padding.
- Automatic checks: all passed. No change outside the roadmap folder.
- Numbers recomputed: 34 printed values, all agree to the digits printed.

Overlap check: read PoissonApproximation, OrnsteinUhlenbeckSemigroup, MathematicalStatisticsHigherOrderAndResampling, LogConcaveFunctionalInequalities, LangevinAndHamiltonianMonteCarlo, KernelsAndSpectralMethods (open) and OptimalTransport, MathematicalStatisticsFoundations, RandomMatrices (main); nothing shared. Gaussian integration by parts stays with RandomMatrices 2.5 and is cited; the Wasserstein distance and its duality stay with Tau Ceti and OptimalTransport; OrnsteinUhlenbeckSemigroup excludes Stein's method in its scope; PoissonApproximation's Stein solution is for the Poisson law.

Source independence: 9 passages compared with 1 source (Ross), none shared; largest share Ross2011, 11 of 19 locators; contents compared with Ross2011: independent (Layers 1 and 2 both draw on its section 2 and on Daly, Layer 3 is one theorem of its section 3, Layer 4 joins its 3.1 and 3.2 with different statements; the order equation, bounds, distance bound, sums is forced by the Needs lines 1.1 → 2.1 → 3.1 → 4.1, 4.2). Daly2008 could not be read: its 8 locators and the wording of 2.2 were not compared.

Research link: The targets are the normal-approximation core of Stein's method (Stein 1972; Chen, Goldstein and Shao 2011), as surveyed in Ross 2011, sections 2 to 3.2, with the sharp derivative bounds of Daly 2008; they are prerequisites of exchangeable-pair, size-bias and zero-bias bounds. Rests on the README's references and on Ross2011.

## Not verifiable

- Daly, *Upper bounds for Stein-type operators* (2008): the journal's landing page offered no file to the sources service and no other legal copy was found. Unchecked: (1.1) p. 567 in 1.1; (1.6) p. 568 and Theorem 1.1 p. 568 in 2.1; Theorem 1.1, Lemmas 2.1 and 2.2, pp. 574–577 and the sharpness on p. 577 in 2.2.
- The sharpness claim of 2.2 for `k ≥ 1`: only `k = 0` was confirmed (through the nearest-integer example of 2.1).
- The attribution of `‖f_h^(j−1)‖ ≤ ‖h^(j)‖/j` to Goldstein and Reinert, Barbour and Götze rests on Daly; the inequality itself was re-derived from the Ornstein–Uhlenbeck representation.

## Source issues

- **Gap** in Ross2011 at Theorem 3.5, proof, display after (3.11), printed page 13: the source says the triple sum of third moments over pairs in each neighbourhood is at most `D²` times the sum over all indices; it should be assumed that each index lies in at most `D` neighbourhoods (true for symmetric ones; fails for independent variables with `Nᵢ = {i, 1}`, `n ≥ 3`); affects the proof.

## For the human reviewers

- Not tested: Daly2008 (8 of 19 locators, all of 2.2) could not be fetched; wording and locators of 2.2 were not compared with it. The largest-share source, Ross2011, was read in full at every locator.
