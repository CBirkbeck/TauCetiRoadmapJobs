# Review of HypergradientsAndBilevelOptimization (pull request #2991 at 56dfb9e)

**Verdict:** accepted

**Summary.** Accepted: no finding. All eleven theorems were re-derived by hand with their constants, every Check was recomputed and agrees, the source locators match the arXiv texts, and the corrections the roadmap makes to its sources (the Lipschitz constant of Ghadimi–Wang Lemma 2.2(c), the index range of Lorraine et al. Theorem 2) are right. There are two small corrections and two format notes, none blocking. The human reviewers are asked two questions: the standing of the sources (conference proceedings and arXiv preprints), and that 2.3 is a corrected statement no refereed source states.

## C01 — The Conventions say that every statement using strong convexity takes `W` a Hilbert space, but 2.1 is stated on a normed space

A reader who takes the Conventions at their word would read 2.1 as a Hilbert-space statement and miss that it is deliberately wider. The Conventions (line 48) say "A statement that uses gradients or strong convexity takes `W` a real Hilbert space"; 2.1 (line 276) opens "Let `W` be a real normed space" with every `g(λ, ·)` `μ`-strongly convex, and `norm_argmin_sub_le` in `Suggested.lean` has `[NormedSpace ℝ W]` only. The route of 2.1 is valid there: `StrongConvexOn.add_add_le_of_hasFDerivWithinAt` is stated for a real normed space (`TauCeti/Analysis/Convex/Strong.lean`, lines 38 and 45).

The smallest change is in the Conventions: "A statement that uses gradients, Lax–Milgram or second derivatives takes `W` a real Hilbert space; 2.1 needs only a normed space".

## C02 — In 3.2 and 3.3 the bound `‖∂_λ Φ (λ, v)‖ ≤ L_Φ` is assumed on the ball `‖v‖ ≤ 2D`, but both routes use it only at `v = w(λ)`

An implementer is asked to carry a hypothesis on a ball that neither proof touches. In the route of 3.2, `L_Φ` enters only through `‖w′‖ ≤ L_Φ/(1 − q)`, which is `‖(1 − A)⁻¹‖ ‖∂_λ Φ (λ, w(λ))‖`; the recursion for `Δ′_t` uses `ν₁`, `ν₂` and `q`, and the split of `F_t′ − F′` uses `L_E` on the ball (there the ball is needed, for `∂_w E` at `w_t`). The same holds in 3.3, where `u_0 = 0` and `B − B_*` is bounded by `ν₂ ρ D`. The roadmap already states 3.5 with the bound at `(λ, w(λ))` alone.

The statements are true as written, and the ball is how Grazzi et al. Lemma 2.1 introduces `L_Φ`. If the wider form is wanted, `hLΦ` in `norm_fderiv_unrolled_sub_le` and `norm_neumannHypergradient_sub_le` would become `‖parameterFDeriv Φ (fixedPointMap Φ hc l) l‖ ≤ LΦ`, with the sentence in 3.2 changed to match; otherwise a clause saying that the ball is kept to agree with the source would do.

## N01 — Some "Used in" lists of the supplier contracts are shorter than the `*Needs:*` lines

`StrongConvexOn.add_add_le_of_hasFDerivWithinAt` is listed as used in 1.2 and 2.1 (line 697) but the `*Needs:*` lines of 2.2 and 3.1 name it too; `IsCoercive.continuousLinearEquivOfBilin` and `InnerProductSpace.toDual` are listed for 1.2 (line 674) and are also needed by 2.2.

## N02 — The References carry reading notes

"(read)" and "(read; page numbers are those of the arXiv file)" in the References (lines 730–739) describe how the text was prepared. "Page numbers are those of the arXiv file" is the part a reader needs.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 fixed-point derivative, `‖(1−A)⁻¹‖ ≤ 1/(1−q)` | `Φ = rw + λ`, `r = 1/2, −2/3, 0`; policy evaluation `γ = 1/2`, `P = [[1/2,1/2],[1,0]]`; `W = 0` | `w′ = 2, 3/5, 1`; `(1−γP)⁻¹ = [[8/5,2/5],[4/5,6/5]]`, row-sum norm `2 = 1/(1−q)`; zero space: `‖1‖ = 0`, bound holds | holds, bound attained | none |
| 1.1 route | uniqueness step, completeness of target | `G v = 0 ↔ ψ v.1 = v.2` near `u` gives `ψ = w` near `λ`; Mathlib needs `F` complete: `F = W` | sound | none |
| 1.2 strongly convex argmin | `A(λ) = [[2+λ²,1],[1,3]]` example at `λ = 0, 1/2, −3, 7/5` | formula `−2, −74783/48668, 85805/8192, 72580363/125772800`; central differences agree to 1e−9; `+` sign gives `109697/48668`; `∂_λ E` alone `33/92` | holds, sign pinned | none |
| 1.2 necessity of `μ > 0` | `g = w⁴/4 − λw` | quotients of `λ^(1/3)` at `8^(−k)`: `4, 16, 64` | Check true | none |
| 1.3 local branch | `g = (w²−1)² + λw` at `(0,1)`; `λ = 1/10` | `∂²_ww g = 8`, `ψ′(0) = −1/8`; `g = −1/10, 1/10, 1` at `−1, 1, 0`; `4w³−4w+1/10` is `0.1` at `−1`, `−0.824` at `−1.1` | holds | none |
| 1.3 supplier fit | NonlinearProgrammingOptimality 3.3 with `ι = κ = Empty` | `feasibleSet = univ`, KKT reduces to `fderiv f x = 0`, critical cone `= W`, `lagrangianHessian = fderiv (fderiv f) x d d` | supplier statement covers the use | none |
| 2.1 Lipschitz argmin | `g = 3w²/2 − 2λw`; `μ = 0`, `g = 0` | `μ = 3`, `C = 2`, `w = 2λ/3`, constant `2/3 = C/μ`; `μ = 0`: discontinuous selection satisfies all else | holds, attained | none |
| 2.2 approximate hypergradient | `g = 3w²/2 − 2λw`, `E = λw` | left side `v + 2λ/3 − 4λ/3 = v − w(λ)`; `C = 1` | holds, attained | none |
| 2.2 constant | three-term split | `L_fx + L_fy C_gxy/μ + C_fy L_gyy C_gxy/μ² + C_fy L_gxy/μ`, equal to source (2.9) | agrees | none |
| 2.3 corrected Lipschitz constant | `E = λ²/2, g = w²/2`; `E = w/10, g = w²/2 − λ²w/2`; `h(u) = u²/2 + log(1+u²)/4` example | source `L_f = 1020401/10⁸` vs true `1`; `53/1000` vs `1/10`; `ℓ = 4/5`, `L_F = 989/500 + 169√2/750 ≈ 2.2967`, `max F″ = 5/4` | source constant false, roadmap's holds | none |
| 2.3 identity `L_F − L_f` | expansion term by term | `L̄_fx − L_fx + L̄_gxy C_fy (1 − C_fy)/μ` | agrees | none |
| 3.1 gradient-step contraction | `diag(1,4)`, `α = 1/8, 1/4, 2/5, 9/20`; `α = 2/K`; zero space `μ = 3, K = 1` | `7/8, 3/4, 3/5, 4/5` both sides; constant `1` at `α = 1/2`; constant `2` in zero space, so `μ ≤ K` is needed | holds, sharp | none |
| 3.1 route | both sign cases of `1 − αμ` | end values `(1−αμ)²`, `(1−αK)²`; Cauchy–Schwarz case `(αK−1)²` | sound | none |
| 3.2 iterative differentiation | quadratic `(a,α) = (2,1/4), (2,3/4), (1,1/3)`, `t = 0..14`; `Φ = λ + w/(2(1+w²))`, `t = 0..8` | `t = 5`: error `157/4096 ≤ 5/64`; non-quadratic `t = 2`: `56/625 ≤ 5/2`; all `t` satisfy both bounds; `t = 0`: `‖w′‖ ≤ L_Φ/(1−q)`, natural subtraction gives `0·q⁰ = 0` | holds | none |
| 3.3 truncated Neumann | same `Φ` at `v = 1, 3/2, 1/2, 2, 0`, `k = 0..8`; `H = diag(1,4)`, `α = 1/4` | all 45 cases within bound; error `diag((3/4)^K, 0)` for `K ≥ 1`, `diag(1, 1/4)` for `K = 0`, norm `(3/4)^K` | holds, attained at `ρ = 0` | C02 |
| 3.4 unrolling from a fixed point | `g = w⁴/4 + w²/2 − λw`, `α = 1/8`; `Φ = λw + w/2` from non-fixed `w₀ = 1` | `A = 1/2`, `B = 1/8`: `1/8, 3/16, 7/32, 15/64 → 1/4`; non-fixed: true `1`, formula `3/2` | holds; hypothesis needed | none |
| 3.5 DARTS bounds | Figure 2 example, `λ = 3`, `ξ = 1/4, 1/3, 1/2, 3/4` | first-order error `3`, bound `3` (`ξ ≤ 1/2`), `9` (`ξ = 3/4`); one-step `3/2, 1, 0, 3/2`, bounds `3/2, 1, 0, 9/2` | holds, attained | none |
| Layer 3 example, 3.3 vs 3.2 | `ρ = q^t`, `k = t` | `q(1−q^t)/(1−q) = Σ_{i=1..t} q^i < t` | true | none |
| Conventions on `W` | 2.1 | Conventions: Hilbert; 2.1 and Lean: normed space | text inconsistent | C01 |

- Source locators checked against the text: 22 (Grazzi et al. 10, Ghadimi–Wang 5, Lorraine et al. 3, Liu et al. 3, Franceschi et al. 1), all correct.
- Library declarations opened at the pin: 26 (18 Mathlib, 8 Tau Ceti), among them `Mathlib/Analysis/Calculus/ImplicitContDiff.lean:55–87`, `Mathlib/Analysis/Normed/Ring/Units.lean:111`, `TauCeti/Analysis/Normed/Ring/Units.lean:54`, `TauCeti/Analysis/Convex/Strong.lean:45`, `TauCeti/Analysis/Calculus/Morse/CriticalPointContinuation.lean:60`; all exist with the stated content.
- Cross-roadmap citations resolved: 6 at the head of FirstOrderOptimization (`LipschitzSmoothWith`, `gradientStep`, both copied character for character; 1.2 cocoercivity; 1.3 two declarations; its 3.4), 5 at the head of NonlinearProgrammingOptimality (3.3 and four definitions), 1 on main (MathematicalStatisticsAsymptotic 5.3, 9.1).
- Duplication by object: no derivative of a parametrized fixed point, hypergradient or unrolled iterate in the pinned Mathlib or Tau Ceti; Mathlib's `HasFDerivAt.iterate` is the parameter-free case and no match for 3.4.
- Elaboration: `Suggested.lean` elaborates, `sorry` the only warning (11 declarations); the 19 elaborated signatures agree with the README; `unrolled` omits the norm instances on `Λ`, which its body does not use.
- One-tactic probe (`rfl`, `simp`, `intros; simp_all`) on all 11 theorems: none closes. No padding.
- Dependency check: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`.
- Automatic checks: all passed.

Overlap check: read NonlinearProgrammingOptimality, FirstOrderOptimization, OnlineConvexOptimization, NewtonAndQuasiNewtonMethods, InteriorPointMethods, MarkovDecisionProcesses, VariationalMethods; `LipschitzSmoothWith`, `gradientStep`, cocoercivity and the existence of strongly convex minimizers are owned by FirstOrderOptimization and cited (the two definitions copied in this roadmap's own namespace); the second-order sufficient condition is owned by NonlinearProgrammingOptimality and cited; the contraction of the gradient step on `0 < α < 2/K` is owned here (FirstOrderOptimization uses it inside a route of its 3.4 and does not state it); nothing else shared.

Source independence: 27 passages compared with 4 sources (22 locators and 5 further passages: the Conventions on partial derivatives, the routes of 1.3 and 3.1, the docstrings of `implicitHypergradient` and `norm_darts_sub_le`), none shared beyond formulas; largest share Grazzi2020, 10 of 22 locators; contents compared with Grazzi2020: independent (its §2.1, §2.2 and Appendix B appear as 3.2, 3.3 and 3.1, an order the dependency of 3.5 on 3.1 and of 3.3 on 3.2's constants forces; Layer 2 has no counterpart there and Layer 1 draws only on its appendix).

Research link: Layers 1–3 state and extend the implicit-differentiation and iteration-complexity results of Grazzi, Franceschi, Pontil and Salzo (2020), Ghadimi and Wang (2018) and Lorraine, Vicol and Duvenaud (2019), which bilevel and hyperparameter optimization and the architecture search of Liu, Simonyan and Yang (2019) rest on; README references and the four texts read.

## Not verifiable

- none

## Source issues

- **Error** in GhadimiWang2018 at Lemma 2.2(c), display (2.10), p. 8: the source says the hypergradient is Lipschitz with a constant built from `L_fx` and a `C_fy²` term; it should be a constant containing the Lipschitz constant of `∇_x f` in `x` and `C_fy` to the first power (for `f = x²/2`, `g = y²/2` the printed constant can be `0.0102` while the true one is `1`); affects a stated result.
- **Gap** in GhadimiWang2018 at Lemma 2.1, p. 7: the source says the lemma holds under Assumptions 2.a and 2.b only; it should also assume the strong convexity of Assumption 2.c, which its proof on p. 8 invokes; affects a stated result.
- **Misprint** in Lorraine2019 at Theorem 2, display (7), p. 5: the source says the derivative of iterate `i+1` is a sum over `j < i`; it should be `j ≤ i`; affects a stated result; corrected in print at the appendix restatement, p. 16.
- **Misprint** in Lorraine2019 at Theorem 2, p. 5 and p. 16: the source says the limit holds when the identity plus the weight Hessian is contractive; it should be the identity minus the Hessian, as in the summand; affects nothing.
- **Gap** in Grazzi2020 at Lemma A.1(i), p. 12: the source says the bound with `(1−q^k)/(1−q)` holds for every `q` in `[0, ∞)`; it should exclude `q = 1` or keep the finite sum; affects nothing.
- **Error** in DARTS2019 at §2.3, the remark after display (6), p. 4: the source says the one-step gradient reduces to the first-order one at an inner optimum; it should say that only the evaluation point reduces, since the second term of (7) remains; affects nothing.

## For the human reviewers

- **Scope.** The sources are machine-learning conference papers (ICML 2018 and 2020, ICLR 2019) and two arXiv preprints cited as such (GhadimiWang2018, Lorraine2019); no journal article or monograph is cited.
- **Scope.** 2.3 states a Lipschitz constant correcting GhadimiWang2018 Lemma 2.2(c), and 3.1, 3.5 and parts of 1.3 are marked "proved here"; no refereed source states them in this form. Each was re-derived by hand in this review.
