# Review of EllipticIntegrals (pull request #2556 at 18695ff)

**Verdict:** needs changes

**Summary.** The eleven Lean statements and the README targets are true: each was recomputed independently, and the duplication, addition, pendulum, cubic-integral and real-period formulas hold. Three things block acceptance. The route for the complex duplication theorem (§3.2) needs R_F to be holomorphic jointly in its arguments, which nothing in the roadmap or the pinned libraries provides. `Suggested.lean` states only part of the pendulum headline (no uniqueness, no least period), although its docstring says every statable headline is stated. One negative-control Check in §2.1 gives a wrong number. There are two small corrections and three format notes. The human reviewers have one fact to weigh: Tau Ceti after the pin already proves most of these targets.

## R01 (P2) — The route for the duplication theorem needs R_F to be holomorphic jointly in its three arguments, which no target or pinned declaration provides

As planned, an implementer who follows §3.1 to §3.2 gets stuck at the propagation step. The route in §3.2 (lines 268–271) says that both sides are "holomorphic in each variable separately (§3.1, with the holomorphy of the principal square root on the slit plane)". On the right side, though, the moving variable enters all three arguments at once. As a function of x, with y and z fixed, it is x ↦ R_F((x + λ)/4, (y + λ)/4, (z + λ)/4), where λ depends on x through √x. Separate holomorphy of R_F in each argument (all that §3.1 states, line 229) gives no derivative for such a composite: the chain rule needs R_F to be complex-differentiable as a function of the triple. The pinned Tau Ceti has Osgood's lemma (`ContinuousOn.analyticAt_of_differentiableAt_update`, `TauCeti/Analysis/Complex/CauchyIntegralPolydisc.lean` line 292). It needs joint continuity, but no Carlson file at the pin states joint continuity of `Complex.carlsonRF`, and neither does the README.

The smallest repair is to add to §3.1 that R_F is jointly holomorphic on `slitPlane ×ˢ slitPlane ×ˢ slitPlane`, for example as differentiability of the uncurried function. Two routes get there: differentiate under the integral sign in all three variables at once (the same domination as in §3.1), or prove joint continuity and apply Tau Ceti's Osgood lemma. Then list that target in §3.2's *Needs:* line. The x = 0 case is covered as well, because both λ/4 and the other two shifted arguments lie in the slit plane.

## R02 (P2) — `Suggested.lean` states the pendulum headline without its uniqueness and least-period clauses, both of which are statable at the pins

The acceptance test would pass a finished roadmap that never proves two of the three claims of a headline. The opening overview (lines 22–24) states the headline as "the unique solution of θ″ = −ω² sin θ with θ(0) = θ₀ and θ′(0) = 0 is θ(t) = 2 arcsin(k sn(ωt + K(k), k)) … and its least period is 4K(k)/ω". `pendulum_solution` (lines 95–103) states only that θ is C², solves the equation with those initial values, and is `Function.Periodic θ (4 * legendreK k / ω)`. The module docstring (lines 26–27) still says that every remaining headline "is statable at the pins and is stated below".

Both missing clauses are statable with Mathlib's carriers alone. Uniqueness: for all `φ ψ : ℝ → ℝ` with `∀ t, HasDerivAt φ (ψ t) t`, `∀ t, HasDerivAt ψ (-ω ^ 2 * sin (φ t)) t`, `φ 0 = θ₀` and `ψ 0 = 0`, we have `φ = θ`. Least period: `IsLeast {p | 0 < p ∧ Function.Periodic θ p} (4 * legendreK k / ω)`. Add them to `pendulum_solution`, or state them as a second theorem, and keep the README's §4.4 bullets as they are.

## R03 (P2) — The negative-control Check of §2.1 gives a wrong value for the series with weights 2ⁿ

As written, the Check asserts a false number. At line 186 it says that with the weights 2ⁿ in place of 2ⁿ⁻¹, K(0.6)(1 − Σₙ 2ⁿcₙ²) ≈ 1.08499. With a₀ = 1, g₀ = 0.8 and c₀² = 0.36, the terms are c₁² = 0.01, c₂² = 7.764 · 10⁻⁶ and c₃² ≈ 10⁻¹². So Σₙ 2ⁿcₙ² = 0.380031, and K(0.6) = 1.7507538 gives 1.7507538 × 0.6199689 = 1.0854130. The repair is to replace 1.08499 by 1.0854130. The point of the Check (it differs from E(0.6) = 1.4180834) is unaffected.

## C01 — Another roadmap cites the old milestone numbers that this revision removes, and the description says none does

PeriodsAndSpecialValues, an open pull request that adds that roadmap, cites "EllipticIntegrals Milestone 1" and "EllipticIntegrals Milestones 1 and 3" in its README at lines 198, 404, 1203, 1232, 2405 and 2514. Those citations break when this revision merges. The README gives no former-to-current mapping, and the description says "No other roadmap cites the old milestone numbers."

A single sentence or small table in Scope and ownership, headed by the former numbering, would let that roadmap follow. For example: former Milestones 1, 2 and 5 are now Tau Ceti's (supplier contracts); former Milestone 3 is §1.1 together with Tau Ceti's `legendre_relation`; former 4.6–4.7 are §§2.1–2.2. The description sentence would then read: "PeriodsAndSpecialValues cites former Milestones 1 and 3; the README maps them."

## C02 — The reason given for the exclusions under "Outside this roadmap" is wrong for at least two of them

Line 650 says of the excluded topics: "All of these need the lattice roadmaps." Principal-value integrals of the third kind are a real-variable construction and need no lattice. The continuation of K and E in k² to ℂ ∖ [1, ∞) is the principal Gauss function of SpecialFunctionsHypergeometric, which is what SpecialFunctionsTheta §6.4 uses for the complex K. Either name the owner of each item, or drop the clause and keep the list as a statement of scope.

## N01 — §2.2 and the docstring of `pi_eq_four_mul_agm_sq_div_one_sub_tsum` cite Salamin 1976 without a locator; the formula is Theorem 1b, p. 567.

## N02 — The whole-domain duplication of §3.2 has a published source that the README could cite: Carlson 1995, §2, equations (8)–(11) (p. 5 of arXiv math/9409227), which states the step with roots of nonnegative real part for arguments of phase less than π, at most one of them 0.

## N03 — Three entries of References (Carlson 1995, Borwein–Borwein, Whittaker–Watson) are cited nowhere in the text.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.1 `tendsto_legendreK_sub_log` | k′ = 10⁻¹, 10⁻², 10⁻³; wrong constant log(2/k′) | K − log(4/k′) = 6.758e−3, 1.248e−4, 1.824e−6; with log(2/k′): 0.693149 at 10⁻³ | holds; Checks and Examples true | none |
| 1.1 route | J at k = 0.9; ∫₀^{π/2} tan(φ/2) | J = 1.6357994329 = arsinh(k/k′)/k; integral 0.6931472 = log 2 | holds | none |
| 2.1 `legendreEc_eq_agm_tsum` | k = 0.6, 0, 1/√2; Lean indexing with k²/2 split off | Lean form 1.4180833944 vs quadrature 1.4180833944; k = 0: π/2 both; 1/√2: 1.3506439 | holds | none |
| 2.1 Check, weights 2ⁿ | k = 0.6 | K(1 − Σ2ⁿcₙ²) = 1.0854130; README says 1.08499 | Check value false | R03 |
| 2.2 Gauss–Brent–Salamin | g₀ = 1/√2; truncations n = 1, 2, 3; weights 2ⁿ | quotient 3.14159265359; 3.140579250, 3.141592646, 3.1415926535898; wrong weights 3.0002511 | holds | N01 |
| 3.1 slit-plane Check | R_C(x, 1), x → −2 ± i0 | analytic limits π/(2√3) ∓ i·artanh(√(2/3))/√3 = 0.90690 ∓ 0.66177i | Check true | none |
| 3.2 `carlsonRF_duplication` | x = 0, y = z = 1; x = y = e^{3πi/4}, z = 1; √(xy) variant | π/2 both sides; 0.8012606 − 0.8091666i both sides; wrong variant 1.2195926 − 0.5959131i | holds | N02 |
| 3.2 route | right side as a function of x | x enters all three arguments; separate holomorphy gives no derivative of the composite | gap | R01 |
| 3.3 `legendreEc_eq_carlsonRG` | k = 0.6, 0.8, 0 | 2R_G(0, .64, 1) = 1.4180834 = E(0.6); 2R_G(0, .36, 1) = 1.2763499 = E(0.8); R_G(0, 1, 1) = 0.7853982 | holds | none |
| 4.1 least period of sn | k = 0; 2K | sn K = 1, sn 3K = −1; zeros exactly 2Kℤ, so periods lie in 4Kℤ | holds | none |
| 4.2 `jacobiSn_add` and companions | k² = ½, u = 0.4, v = K; three further (u, v, k) | sn(u+K) = 0.9592196 = cn/dn; wrong sign 0.8270594; all three formulas agree to 10⁻¹⁵ | holds | none |
| 4.3 k → 1⁻ | u = 1, k = 0.999999 and 0.9 | 0.7615943, 0.6480541, 0.6480550 vs tanh 0.7615942, sech 0.6480543; k = 0.9: 0.77764, 0.62871, 0.71426 | holds | none |
| 4.4 `pendulum_solution` | ω = 1.3, θ₀ = 2, t = 0, 0.7, 2.5; θ₀ = π/2, π/3 | θ″ = −1.5367126 vs −ω² sin θ = −1.5367127 (t = 0); ratios 1.180341 and 1.073182 | holds; headline partly unstated | R02 |
| 5.1 exchanged ellipse | a = 1, b = 2; a = 0 | arc-length quadrature 9.6884482 = 8E(√3/2); library formula gives 2π; a = 0 gives 4b | holds | none |
| 5.2 cubic integrals | e = (1, 0, −1); (e₁, a, b) = (2, −1, 3) | both integrals 1.3110288 = ϖ/2; 0.7930927 by quadrature; swapped k gives 1.1652261 | holds | none |
| 5.3 four real-period theorems | y² = x³ − x; y² = x³ + 1; e = (3, 1, −2) | 5.2441151 by quadrature, K and AGM; 4.2065463 all three; 3.4874928 all three; swap 2.4286506 | holds | none |

- Source locators checked against the text: 14 (DLMF 19.8.6, 19.8.12, 19.12.1 with d(0) = ln 4, 19.25.1, 19.26.18 with the §19.26 standing assumption of nonnegative arguments, 19.30.5, Tables 22.4.1, 22.5.3 and 22.5.4, 22.8.1–22.8.3, 22.19.1–22.19.2; Salamin Theorem 1b p. 567; Cremona §3.7 pp. 97–98, roots labelled in reverse order and converted correctly; Carlson 1995 §2).
- Library declarations opened at the pins, among them `WeierstrassCurve.realPeriod` (`TauCeti/AlgebraicGeometry/EllipticCurve/RealPeriod.lean` 128), `NNReal.agmSequences` (`Mathlib/Analysis/SpecialFunctions/ArithmeticGeometricMean.lean` 56, the pair (gₙ₊₁, aₙ₊₁)), `legendreK_eq_pi_div_two_mul_agm` (`…/EllipticIntegral/Gauss.lean` 60), `legendreEc_one_div_sqrt_two` (`…/Relation.lean` 124), `NNReal.agmSequences_snd_sub_fst_le` (`TauCeti/Analysis/SpecialFunctions/ArithmeticGeometricMean.lean` 67), `eVariationOn_ellipse` (`…/EllipticIntegral/Ellipse.lean` 85), `jacobiAm` (`…/JacobiElliptic/Basic.lean` 62), `ofReal_legendreE_eq_carlsonRF_sub_carlsonRD` (`…/Carlson/Legendre.lean` 241), Osgood's lemma (`TauCeti/Analysis/Complex/CauchyIntegralPolydisc.lean` 292).
- All 449 backticked README identifiers were searched at the pins. All resolve except the `lean-codes` file names, namespaces and the 11 targets of `Suggested.lean`, none of which the pin proves.
- Cross-roadmap citations resolved on main: 6 (ModularCurvesPartII §1.1 and §1.4a, EllipticCurves Layer 7, SpecialFunctionsTheta Layer 6 §§6.3–6.4, ConformalMapping Layer 6, DiophantineApproximationAndTranscendence Layer 3, SpecialFunctionsHypergeometric 15.9.24–15.9.25).
- Dependency check output: `depcheck: 200 roadmaps, 2196 edges, 0 problem(s)`; the worker's automatic checks all passed.
- Elaboration: `lake env lean` on `Suggested.lean` gives 11 `sorry` warnings and nothing else. The one-tactic probe (`rfl`, `simp`, `infer_instance`) fails on all 11, so there is no padding. The elaborated types were compared with the README statements: no binder lost, no generality mismatch.
- Outside the folder the pull request changes nothing; no `set_option`, no sorry'd data, a single `import Mathlib` followed by five existing `TauCeti.*` modules.

Overlap check: read SpecialFunctionsTheta, SpecialFunctionsHypergeometric and SpecialFunctionsAppell (main); SpecialFunctionsHypergeometric, SpecialFunctionsLegendre, SpecialFunctionsGamma, SpecialFunctionsHeun, ThetaInvariantsOfEuclideanLattices, EllipticCurvePeriodsAndModularParametrizations and PeriodsAndSpecialValues (open). Nothing shared: Theta owns λ, the nome and K = (π/2)θ₃², Hypergeometric owns DLMF 15.9.24–15.9.25 through Tau Ceti, EllipticCurvePeriodsAndModularParametrizations defers the real period as a Legendre integral and AGM to this roadmap, and the rest consume Tau Ceti's `legendreK` or `jacobiSn` only.

Source independence: 20 passages compared with 4 sources (DLMF, Salamin 1976, Cremona 1997, Carlson 1995), none shared beyond formulas; largest share DLMF, about 25 of 29 locators; contents compared with DLMF Chapters 19 and 22: independent (Layer 1 ↔ §19.12 precedes Layer 2 ↔ §19.8, the reverse of DLMF's order; Layer 3 takes §19.26 before §19.25 and adds Carlson 1977; Layer 5 joins §19.30 with Cremona and Byrd–Friedman).

Research link: Layer 5 evaluates the real period Ω_E of the Birch–Swinnerton-Dyer quotient by a quadratically convergent AGM (Cremona 1997, §3.7; EllipticCurves Layer 7). Carlson's duplication theorem (Layer 3) is the basis of his algorithms for complex elliptic integrals (Carlson 1995, §2). Rests on the README and the sources read.

## Not verifiable

- Carlson 1977, Chapter 9 (the locator of §3.1): a book with no legal copy found; the statement was checked against the integral definitions instead.
- Byrd and Friedman, formulas 236.00 and 239.00 (§5.2): paywalled; all three integrals were checked by quadrature instead.
- The statement in Provenance that the author of `lean-codes` agreed to its use (Lean Zulip): not accessible to this review.

## Source issues

- none

## For the human reviewers

- Tau Ceti commit d2083f0 (2026-11-08, later than the pinned 2fd255d, which main also pins) declares theorems for §§1.1, 2.1, 2.2, 4.2–4.4, 5.2, 5.3 and most of §3.1. The folder's STATUS.md reports them proved; this review treated them as targets.
- `lean-codes` (Apache-2.0, confirmed on the repository page) declares `carlsonRF_duplication` with the same name and binders `{x y z : ℂ} (hx hy hz)` in `Carlson/Elliptic/Addition.lean`, in the form 2R_F(x + λ, …) on the slit plane. The README directs implementers to port from it.
