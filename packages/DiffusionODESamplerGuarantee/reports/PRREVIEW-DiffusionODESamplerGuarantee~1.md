# Review of DiffusionODESamplerGuarantee (pull request #2773 at caeda0d)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement of Layers 1 to 4 was recomputed (the Lipschitz constant of 1.3, the constants `M x` and `M̄` of 3.1 and 4.1, the Heun constant of 4.2, and every number printed in a Check), each supplier citation was resolved at the supplier's head or on main, and the four locators into Benton, Deligiannidis and Doucet were read against the text. There are one small correction and three format notes, none blocking. Two points are left for the human reviewers: the explicit constants are derived here and stated in no refereed source, and the three main suppliers are still open pull requests.

## C01 — The contract for ScoreBasedDiffusion 1.3 drops that section's integrability hypothesis

In the supplier contracts ("From TauCetiRoadmap.ScoreBasedDiffusion", `TauCetiRoadmap/DiffusionODESamplerGuarantee/README.md` line 606) the distance bound is quoted "for a probability measure `μ₀` with `∫ ‖x‖² ∂μ₀ ≤ M`". ScoreBasedDiffusion 1.3 at its head assumes in addition that `‖x‖²` is integrable. With a Bochner integral the extra clause matters: for a law without second moment the integral is `0`, `M = 0` is allowed, and with `c = 0`, `s = 0` the left side is `W₂(μ₀, δ₀) = ∞` against a right side `0`. Nothing stated here is affected, since 2.1 applies the bound to data in a ball, where the integrand is bounded by `R²`. Adding "with `‖x‖²` integrable and" to the bullet makes the contract say what the supplier proves.

## N01 — The contract for `MeasureTheory.eLpNorm_add_le` names a hypothesis the pinned lemma does not have

README line 556 describes it as Minkowski's inequality "for a.e. strongly measurable functions and `1 ≤ p`"; at the pinned Mathlib (`Mathlib/MeasureTheory/Function/LpSeminorm/TriangleInequality.lean` line 57) its only hypothesis is `1 ≤ p`. Harmless; the clause can go.

## N02 — One section prefix in the docstrings of the copied definitions is off

In `TauCetiRoadmap/DiffusionODESamplerGuarantee/Suggested.lean` line 86 the docstring of `IsFlowOn` begins "2.1:", while the other copied definitions carry the section of this roadmap that first uses them and `IsFlowOn` is first used in 1.5.

## N03 — "wasserstein" in the title is a proper name

README line 1 would read `# Roadmap: Wasserstein guarantee for the discretized flow sampler`, as the module docstring of `Suggested.lean` already has it.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `map_interpolant_eq_bind` | `β t < 0`; `β t = 0`; `t = 0`; two-point data | Kernel variance `β²` is sign-free; `β = 0` gives `dirac (α x₁)` both sides; `t = 0`: both `γ` | holds | none |
| 1.2 `exactVelocity`, `isInterpolantVelocity_exactVelocity` | conditional mean of `α′x₁ + β′x₀` with `x₀ = (y − αx₁)/β`; two-point, `t = 1/2`, `r = x = 1`; `b ≤ 0`; `β t = 0` outside `(0, b)` | `(β′/β) y + (α′ − αβ′/β) D` both sides; `−2 + 2 tanh 2 = −0.07194`; wrong sign gives `−2`; junk density `0` stays measurable | holds | none |
| 1.3 `lipschitzWith_exactVelocity` | linear schedule `R = 1, 2`, `t = 1/2`; `α = t(6/5 − t)`, `β = 1`, `t = 17/20`; `R = 0`; `α t = 0`; `R < 0` | `κ = t/(1−t)³ = 4`: `max(2, 2) = 2`, `max(2, 14) = 14`, attained at `y = 0`; `κ = −0.14875`; `R < 0` vacuous | holds | none |
| 1.4 `continuousOn_exactVelocity` | two-point field as `t → 1`; `b < 0`; `α 0 = 0` | `(r tanh(trx/(1−t)²) − x)/(1−t) → ±∞` unless `x ∈ {0, ±r}`; empty set; mean of `μ₁` needs first moment | holds | none |
| 1.5 `map_flow_exactVelocity` | point mass `δ_m`; two-point, `b = 9/10`, six Gaussian quantiles integrated by RK4 | Flow `βx + αm` has derivative `β′x + α′m` = field; distribution functions agree to `3·10⁻¹²` | holds | none |
| 2.1 `wassersteinEDist_data_flow_le` | `w = u`, `r = 1/2, 1, 2`; `w = −x`, two-point `±1`; `b = 0`; `b < 0`; `d = 0` | `0.1118028 ≤ 0.1118034`, `0.1414214`, `0.2236068`; exact `0.71868` against `0.14142 + 0.98604 = 1.12746`; `b = 0` product coupling | holds | none |
| 3.1 `norm_flow_sub_euler_le` | `w = x`, one step `b = 10⁻¹, 10⁻², 10⁻³`; `w = t x`, ten steps; `w = √t`; `N = 0` | `M x = (Λ+K²)P + Λ + KB₀` rederived; ratios `0.8898, 0.9884, 0.9988`; error `0.10161` against `0.55299`; both sides `0` | holds | none |
| 4.1 `wassersteinEDist_data_euler_le` | `w = −x`, ten steps of `9/100`; Minkowski on `A‖x‖ + C`; `N = 0` | Exact `0.72817`; discretization `0.16155`; bound `1.28901`; flow against Euler `0.01715`; `‖·‖_(L²(γ)) = √d` | holds | none |
| 4.2 `wassersteinEDist_flow_heun_le` | `a = −1`, `c = 1/2`, four steps; `a = 3/2`, `c = 7/10`, one step; `N = 0` | `m₂ = m₃ = 1.11803`, exact `0.005198` against `0.043070`; exact `0.94538`, sign-flipped expression `−13.5701` | holds | none |
| Contract for ScoreBasedDiffusion 1.3 (C01) | `μ₀` without second moment, `c = 0`, `s = 0`, `M = 0` | Left `∞`, right `0` without the supplier's integrability clause; with data in a ball the clause holds | contract understated | C01 |
| Contract for `eLpNorm_add_le` (N01) | pinned signature | Only hypothesis `1 ≤ p` | harmless | N01 |

- Source locators checked against the text: 4 of 4 (BentonDeligiannidisDoucet2024 Theorem 1 at line 204, Theorem 2 at line 357, Theorem 3 at line 445, Theorem 4 at line 478, proof at line 486); each supports what the README says of it.
- Library declarations opened at the pins: 25 (16 Mathlib, 9 Tau Ceti), all present under the names and files the contracts give; `gronwallBound` at `Mathlib/Analysis/ODE/Gronwall.lean` line 43 and `TauCeti.wassersteinEDist_triangle` at `TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Basic.lean` line 608 read in full.
- Cross-roadmap citations resolved: FlowMatching 1.1, 2.1, 3.1, 3.2, 5.1, 5.2; ScoreBasedDiffusion 1.3, 2.1, 2.2; OneStepMethodsForODEs 1.1, 1.2, 1.4, 2.1, 2.2, 3.1, 3.2 (at their open heads); DenoisingDiffusion 1.2, 3.1, Layer 4 and DiracScatteringAndNonlinearFourierTransform 1.7 (on main). The 17 copied definitions have bodies identical to the owners'.
- Elaboration of `Suggested.lean`: nine `sorry` warnings and nothing else. Elaborated signatures compared with the README statements: the binders reported as dropped are on copied definitions only (as in the owners' files) and on no theorem; nothing changed.
- One-tactic probe (`simp`, `rfl`, `simp` with the definitions unfolded) on a copy: none of the nine theorems closes.
- Automatic checks: all passed. Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`.
- Changes outside the roadmap folder: none.

Overlap check: read FlowMatching, ScoreBasedDiffusion, OneStepMethodsForODEs, DifferentialEntropyAndEntropyPower, LangevinAndHamiltonianMonteCarlo, DenoisingDiffusion, MathematicalStatisticsSemiparametric, OptimalTransport; nothing shared. The Gaussian-source velocity in score form is FlowMatching 3.1; 1.2 here is the denoiser form, defined at `α t = 0`, and cites it. Discretization error is left out of scope by FlowMatching and ScoreBasedDiffusion; ownership here.

Source independence: 10 passages compared with 1 source, none shared; largest share BentonDeligiannidisDoucet2024, 4 of 4 locators; contents compared with BentonDeligiannidisDoucet2024: independent (Layer 1 ↔ §3.2 and Layer 2 ↔ §3.3 in scope only partly, forced by the *Needs* of 2.1 on 1.3 to 1.5; Layers 3 and 4 have no counterpart).

Research link: Layer 2 is the early-stopping form of Benton, Deligiannidis and Doucet 2024, Theorem 4 (smoothing distance plus their Theorems 3 and 1); 1.3 stands where their Theorem 2 does. Layers 3 and 4 add the solver error, which that paper does not treat. Rests on README 1.3 and 2.1 and on the source text.

## Not verifiable

- The accuracy `10⁻¹³` in the first Check of 1.5: my integration reproduces the agreement of the distribution functions to `3·10⁻¹²`, the limit of the integrator used, not to the figure printed.

## Source issues

- **Misprint** in BentonDeligiannidisDoucet2024 at the proof of Theorem 4, printed page 9: the source says the squared distance from the smoothed to the true endpoint law is at most `(1 − β₁) R² + d γ₀²`; it should be `(1 − β₁)² R² + d γ₁²`, as the display before Definition 1 (page 6) has it for the other endpoint; affects nothing.

## For the human reviewers

- Scope: the one cited source is a 2024 journal article (BentonDeligiannidisDoucet2024); the constants of 1.3, 3.1, 4.1 and 4.2 are marked "Proved here" and are stated in no refereed source the README names.
- Scope: the three main suppliers (FlowMatching, ScoreBasedDiffusion, OneStepMethodsForODEs) are open pull requests by the same author; every Layer here rests on at least one of them.
- Licence: the description names the author's repository `brettkoonce/lean4-mlir` as containing Euler and Heun samplers as code and no proofs; that repository was not opened in this review.
