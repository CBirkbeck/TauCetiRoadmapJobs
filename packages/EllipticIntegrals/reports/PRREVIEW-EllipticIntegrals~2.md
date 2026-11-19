# Review of EllipticIntegrals (pull request #2556 at 1d029f4)

**Verdict:** accepted

**Summary.** Accepted. All three findings, both small corrections and all three format notes of the previous review are repaired, and the repairs hold up. R_F is now stated to be jointly holomorphic, and the duplication route follows from it. `pendulum_solution` now carries uniqueness and the least period. The corrected Check value recomputes. Two small corrections and one format note remain, none blocking. The first correction is a sentence in §3.1 that ignores Hartogs' theorem. The second is a milestone-table entry that points to the wrong group of the supplier contracts. The human reviewers have the same two facts as before.

## C01 — §3.1 says that holomorphy in each variable separately gives no chain rule; by Hartogs' theorem it does, and what is missing is that theorem at the pins

As written, the sentence suggests that the joint statement is needed mathematically. In fact it is a way around a theorem the pinned libraries lack. The sentence is at line 243: "holomorphy in each variable separately gives no chain rule for such a composite". By Hartogs' theorem on separate analyticity, a function on an open subset of ℂⁿ that is holomorphic in each variable separately is holomorphic. The set `slitPlane ×ˢ slitPlane ×ˢ slitPlane` is open, so the separate statements of §3.1 already imply the joint one. The pins do not have that theorem. Mathlib has none, and the files of Tau Ceti that mention Hartogs are about schemes. Tau Ceti's Osgood lemma (`ContinuousOn.analyticAt_of_differentiableAt_update`, `TauCeti/Analysis/Complex/CauchyIntegralPolydisc.lean` line 292) needs joint continuity. The previous review's R01 made the same overstatement.

A possible wording: "the chain rule needs differentiability in the three variables jointly; separate holomorphy gives it only through Hartogs' theorem, which the pinned libraries lack, so it is proved directly by differentiating under the integral sign."

## C02 — The milestone table sends former Milestone 5 to the group *Special values*, but item 5.2, E(1/√2), is listed in another group

A reader who follows former 5.2 to the *Special values* group of the supplier contracts (line 819) will not find it there. E(1/√2) = K(1/√2)/2 + π/(4K(1/√2)) is `legendreEc_one_div_sqrt_two` (`TauCeti/Analysis/SpecialFunctions/EllipticIntegral/Relation.lean` line 124). The README lists it under *At k = 1 and Legendre's relation* (line 798). The row at line 689 could read "5.1, 5.3: Tau Ceti: *Special values*; 5.2: Tau Ceti's `TauCeti.Real.legendreEc_one_div_sqrt_two`". No roadmap cites Milestone 5, so no citation breaks.

## N01 — Line 58 of `TauCetiRoadmap/EllipticIntegrals/Suggested.lean` (the docstring of `pi_eq_four_mul_agm_sq_div_one_sub_tsum`) is 106 characters long; rewrapping it would bring it within the 100-character limit.

## Previous findings

- R01 — repaired: §3.1, line 240: "Prove also that R_F is holomorphic in its three variables jointly on the product of three slit planes". The route bounds the derivative by a constant times (1 + t)^(−5/2), and §3.2's *Needs:* lists the joint statement.
- R02 — repaired: `pendulum_solution` now ends with the uniqueness clause `… → φ 0 = θ₀ → ψ 0 = 0 → φ = θ` and `IsLeast {p : ℝ | 0 < p ∧ Function.Periodic θ p} (4 * legendreK k / ω)`.
- R03 — repaired: §2.1, line 187: "With the weights 2ⁿ in place of 2ⁿ⁻¹, K(0.6)(1 − Σₙ 2ⁿcₙ²) = 1.0854130…."
- C01 — repaired: Scope and ownership, line 679: "**Former milestone numbering.**", followed by a table of Milestones 1–8. The description now names PeriodsAndSpecialValues and EllipticCurvePeriodsAndModularParametrizations; one slip in the table remains (C02 above).
- C02 — repaired: line 665: "The complex Jacobi functions are left by SpecialFunctionsTheta (Downstream consumers) to a roadmap built on its theta quotients (§6.6) … the principal Gauss function of SpecialFunctionsHypergeometric".
- N01 — repaired: §2.2, line 193: "(Salamin 1976, Theorem 1b, p. 567)"; the Lean docstring cites Theorem 1b.
- N02 — repaired: §3.2, line 274: "(Carlson 1995, §2, equations (8)–(11), with square roots of nonnegative real part)"; also in the docstring of `carlsonRF_duplication`.
- N03 — repaired: Borwein–Borwein and Whittaker–Watson are gone from References, and Carlson 1995 is now cited in §3.2.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 2.1 Check, weights 2ⁿ | k = 0.6, cₙ by the AGM | Σ2ⁿcₙ² = 0.3800311; K(1 − Σ) = 1.0854129860; README 1.0854130…; true weights give 1.4180833944 = E(0.6) by quadrature | holds | none |
| 2.2 `pi_eq_four_mul_agm_sq_div_one_sub_tsum` | g₀ = 1/√2 | Salamin Thm 1b, p. 567 is this formula; M = 0.847213084794, quotient 3.141592653589794 | holds | none |
| 3.1 joint holomorphy of R_F | x₀ = 0.3+0.7i, y = e^{3πi/4}, z = 1−0.5i; bound c | linearisation error 0.16 % at ‖dw‖ ≈ 3·10⁻³; c = 0.04994 at w = −1+0.1i, 0.005 at −1+0.01i | holds; elaborates | none |
| 3.1 "no chain rule" sentence | Hartogs on slitPlane³ (open) | separate ⇒ joint holomorphy mathematically; pins lack Hartogs, Osgood needs continuity | imprecise | C01 |
| 3.2 `carlsonRF_duplication` and route | x₀ above; x = 0; x = y = e^{3πi/4}, z = 1; 20000 random triples | 1.0401744−0.5624565i both; 1.5591503−0.7765197i both; 0.8012606−0.8091666i both; all shifted arguments in slit plane | holds | none |
| 3.2 composite in x | same triple, derivative along 1 and i | 0.0049448+0.2444624i vs 0.0049447+0.2444625i (Cauchy–Riemann) | holomorphic | none |
| 4.4 `pendulum_solution` | ω = 1.3, θ₀ = 2: formula vs RK4 at t = 0.7, 2.5, 6.0; periods | 1.614458110, −1.601507181, 1.861234646 both; T = 6.4228869, θ(T/2) = −2; parameter period 5.7084165 gives 1.598 ≠ 2 | holds | none |
| Continuation of K, E (scope) | k² = 0.36; argument k instead | (π/2)F(½,½;1;.36) = 1.7507538 = K; (π/2)F(−½,½;1;.36) = 1.4180834 = E; with 0.6: 1.9495677 | holds | none |
| Milestone table | 8 former milestones checked item by item against main's README | 3.1 split between §1.1 and Tau Ceti, 4.6–4.7 → §§2.1–2.2, 8.2–8.3 → §5.2 right; 5.2 is in another group | one slip | C02 |

The rows for the untouched statements (1.1, 3.3, 4.1–4.3, 5.1–5.3) stand as in the previous review, of `18695ff`.

- Source locators checked against the text: 3: Salamin Theorem 1b, p. 567 (salamin1976 lines 80, 95–98); Carlson 1995 §2, equations (8)–(11), with at most one zero argument, the others of phase less than π, and roots of nonnegative real part (carlson1995 lines 122–146); DLMF §19.26's standing assumption of nonnegative arguments (dlmf-19 lines 71–74).
- Library declarations opened at the pins: 9. `hasFDerivAt_integral_of_dominated_of_fderiv_le` (`Mathlib/Analysis/Calculus/ParametricIntegral.lean` 222); `DifferentiableOn.comp` (`Mathlib/Analysis/Calculus/FDeriv/Comp.lean` 186); `DifferentiableOn.analyticOnNhd` (`Mathlib/Analysis/Complex/CauchyIntegral.lean` 729); `AnalyticOnNhd.eqOn_of_preconnected_of_frequently_eq` (`Mathlib/Analysis/Analytic/IsolatedZeros.lean` 234); `ODE_solution_unique_univ` (`Mathlib/Analysis/ODE/ExistUnique.lean` 341); `hasDerivAt_integral_of_dominated_loc_of_deriv_le` (`ParametricIntegral.lean` 569); Osgood's lemma (`TauCeti/Analysis/Complex/CauchyIntegralPolydisc.lean` 292); `legendreEc_one_div_sqrt_two` (`…/EllipticIntegral/Relation.lean` 124); `legendreK_one_div_sqrt_two` (`…/Lemniscate.lean` 148).
- Cross-roadmap citations resolved: 6. SpecialFunctionsTheta Downstream consumers and §§6.4 and 6.6, on main and at the head of its open revision; SpecialFunctionsHypergeometric's principal branch, on main. The former numbering was checked against the citing heads: PeriodsAndSpecialValues (README lines 198, 208, 400, 404, 1203, 1232, 1311, 2405, 2514; Milestones 1 and 3) and EllipticCurvePeriodsAndModularParametrizations (lines 598, 2178; Milestone 8).
- Dependency check: `depcheck: 200 roadmaps, 2196 edges, 0 problem(s)`. The full gate reports OK on every check. The pull request changes nothing outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives 11 `sorry` warnings and nothing else. `#check @pendulum_solution` and `#check @carlsonRF_duplication` agree with §§4.4 and 3.2, with no binder lost. A one-tactic `simp` probe fails on the new uniqueness clause, on the least-period clause and on duplication. The README's joint-holomorphy statement elaborates as written.

Overlap check: for the changed passages, I read SpecialFunctionsTheta (main and its open revision) and SpecialFunctionsHypergeometric (main) again. SpecialFunctionsAppell (main) and SpecialFunctionsLegendre, SpecialFunctionsGamma and SpecialFunctionsHeun (open) stand as in the previous review. A search of main and all open heads for holomorphy of Carlson's integrals finds only Gamma's unrelated Carlson theorem. Nothing is shared: the joint holomorphy of R_F is stated only here, and the continuation of K and E is left to SpecialFunctionsHypergeometric's principal branch.

Source independence: changed passages only. I compared 11 passages with 3 sources (Salamin 1976, Carlson 1995, DLMF Chapter 19): §§2.1, 2.2, 3.1 (two), 3.2 (two) and 4.4, the scope paragraph, the milestone preamble and two Lean docstrings. Nothing is shared beyond formulas and the phrase "nonnegative real part", which the mathematics forces. The largest share is DLMF, about 25 of 30 locators. No layer was added, removed or reordered, so the arrangement was not compared again.

Research link: Layer 5 evaluates the real period Ω_E of the Birch–Swinnerton-Dyer quotient by a quadratically convergent AGM (Cremona 1997, §3.7; EllipticCurves Layer 7). Carlson's duplication theorem (Layer 3) is the basis of his algorithms for complex elliptic integrals (Carlson 1995, §2). This rests on the README and the sources read.

## Not verifiable

- Carlson 1977, Chapter 9 (the locator of §3.1): a book for which no legal copy was found. Joint and separate holomorphy were checked by the domination argument and numerically instead.
- Byrd and Friedman 236.00 and 239.00, and the permission recorded in Provenance for `lean-codes`: as in the previous review (untouched text).

## Source issues

- none

## For the human reviewers

- Tau Ceti commit d2083f0 (2026-11-08) is later than the pinned 2fd255d, which main also pins. It declares theorems for §§1.1, 2.1, 2.2, 4.2–4.4, 5.2, 5.3 and most of §3.1. The folder's STATUS.md reports them proved; this review treated them as targets.
- `lean-codes` (Apache-2.0, confirmed on the repository page) declares `carlsonRF_duplication` in `Carlson/Elliptic/Addition.lean`, with the same name and binders `{x y z : ℂ} (hx hy hz)`. Its form is 2R_F(x + λ, …) on the slit plane. The README directs implementers to port from it.
