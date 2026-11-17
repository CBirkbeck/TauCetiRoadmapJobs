# Review of FirstOrderOptimization (pull request #2474 at 0ba9f28)

**Verdict:** needs changes

## R01 (P1) — cited Tau Ceti supplier does not exist at the pin

**Location:** `TauCetiRoadmap/FirstOrderOptimization/README.md` lines 95–96 and 183: "`ConvexOn.inner_gradient_sub_le` (`TauCeti/Analysis/Convex/Differentiability.lean`): for convex `u` differentiable at `x`, `⟪∇u x, y − x⟫ ≤ u y − u x`".
**Claim:** 1.2 names as supplied a declaration that the pinned Tau Ceti (2fd255d) does not contain, so the first-order convexity inequality 1.2 rests on is unowned.
**Witness:** `inner_gradient_sub_le` occurs nowhere in the pinned Tau Ceti or Mathlib; `TauCeti/Analysis/Convex/Differentiability.lean` declares nine theorems (lines 89–260), none of that name.
**Repair:** Replace the contract and the *Needs:* of 1.2 by pinned declarations: Mathlib `strongConvexOn_zero` (`Mathlib/Analysis/Convex/Strong.lean:135`) with Tau Ceti `StrongConvexOn.add_add_le_of_hasFDerivWithinAt` (`TauCeti/Analysis/Convex/Strong.lean:45`) at `m = 0`, `s = univ`, which reads `f x + f' (y − x) + 0 ≤ f y`.

## R02 (P2) — the Robbins–Siegmund theorem is stated below its source's generality

**Location:** README lines 512–514 and `Suggested.lean` lines 231–250: "`a : ℕ → ℝ` nonnegative with `Σ a n < ∞` … and `Σ_n ∫ β n ∂P < ∞`".
**Claim:** The roadmap owns "the Robbins–Siegmund theorem" but states only a deterministic factor `a` and expectation-summable `β`; the theorem has adapted random factors and pathwise summability.
**Witness:** CP15 lines 108–112 (Lemma 2.2, quoting Robbins–Siegmund Theorem 1): both sequences are random and summable almost surely. `a n = ξ/(n+1)²` with `ξ ≥ 0` `ℱ 0`-measurable and unbounded is outside the README's statement.
**Repair:** State 5.1 with `a β ζ : ℕ → Ω → ℝ` adapted and nonnegative, `V n` integrable, `P[V (n+1) | ℱ n] ≤ᵐ (1 + a n) V n + β n − ζ n`, and conclusion `∀ᵐ ω, Summable (a · ω) → Summable (β · ω) → (∃ l, Tendsto (V · ω) atTop (𝓝 l)) ∧ Summable (ζ · ω)`. Keep the present form, with its third bullet, as the corollary 5.4 uses; `ξ/(n+1)²` is then covered.

## R03 (P2) — two statable headline theorems are absent from `Suggested.lean`

**Location:** `Suggested.lean` lines 10–14 ("it is not exhaustive"); README line 488 (`fistaConstantMomentum_rate`) and line 703 (`reddi_regret`).
**Claim:** The Summary's "accelerated linear rate" (4.3) and "the counterexample … on which Adam does not converge" (6.4) are statable at the pins and not stated; the docstring names no theorem as not statable.
**Witness:** No declaration for 4.3; for 6.4 only `reddi_iterate`, which bounds the iterates and asserts no regret inequality. The carriers exist in the file: `prox`, `ClosedProperConvex`, `reddiLoss`.
**Repair:** State `fistaConstantMomentum_rate` (iteration of 4.3 on the state `(x_k, x_{k−1})`, bound of README line 487) and `reddi_regret` (`Σ_{t ∈ Icc 1 (3n)} reddiLoss C t (x t) − Σ reddiLoss C t (−1) ≥ (2C − 4) n` under the hypotheses of `reddi_iterate`); replace "not exhaustive" by the sentence saying that every headline is stated.

## R04 (P2) — 1.4: strong convexity implies Polyak–Łojasiewicz only for `μ > 0`

**Location:** README line 217: "a differentiable `μ`-strongly convex function is `PolyakLojasiewicz μ`".
**Claim:** Section 1.4 does not assume `μ > 0`, and Mathlib's `StrongConvexOn` allows `μ ≤ 0`; the bullet is then false.
**Witness:** `μ = 0`, `f x = x` on `ℝ`: `StrongConvexOn univ 0 f` holds (`strongConvexOn_zero`), `f` is differentiable, `Set.range f = ℝ` is not bounded below, so the field `bddBelow` fails.
**Repair:** "a differentiable `μ`-strongly convex function with `μ > 0` is `PolyakLojasiewicz μ`" (1.3 then gives the minimizer and `2μ (f x − f⋆) ≤ ‖∇f x‖²`); `f x = x` is excluded.

## R05 (P3) — gate `readme-ids-missing`: backticked names that `Suggested.lean` does not declare

**Location:** README lines 138, 140, 148, 167 (gate), and lines 251, 272, 358, 566, 624, 626 (same rule, not listed by the gate).
**Claim:** A backticked name of the roadmap's own claims a declaration in `Suggested.lean`; these have none.
**Witness:** Gate at 0ba9f28: `readme-ids-missing=6`. Also undeclared: `tendsto_gradient_gradientDescent`, `tendsto_gradientDescent_of_convex`, `existsUnique_prox`, `sgd_strongConvex_constant_rate`, `preconditioned_descent`, `preconditioned_sum_le`.
**Repair:** Delete these names from the prose and keep each fact as stated (the two names of R03 become declarations instead). The gate's sixth name, `StrongConvexOn.add_add_le_of_hasFDerivWithinAt`, exists at the pin (`TauCeti/Analysis/Convex/Strong.lean:45`); name it in the docstring of `StrongConvexOn.inner_gradient_sub_ge` so the gate reads it as mentioned. The fifth is R01.

## R06 (P3) — Lean names absent from the README

**Location:** `Suggested.lean` lines 128, 140, 154, 160, 208, 319, 322.
**Claim:** Every Lean name appears in the README; seven do not.
**Witness:** `ClosedProperConvex`, `convexProjection_firmlyNonexpansive`, `moreauYosidaResolvent_eq_prox`, `eq_prox_iff`, `fistaStep`, `reddiLoss`, `reddiGrad` have no occurrence in `README.md`.
**Repair:** Add each name in backticks at its statement: Conventions line 72, 3.1 line 337, 3.2 lines 359 and 361, 4.2 line 464, 6.4 line 694.

## R07 (P3) — docstrings disagree with the README and with the statements

**Location:** `Suggested.lean` lines 109, 117 and 196: "2.3: the linear rate for strongly convex smooth functions", "2.4: the linear rate under the Polyak–Łojasiewicz condition", "the accelerated local rate".
**Claim:** The section numbers are exchanged, and `heavyBall_quadratic_rate` is global.
**Witness:** README 2.3 (line 286) is the Polyak–Łojasiewicz rate and 2.4 (line 303) the strongly convex one; the Lean statement at line 204 holds for every `x₀ : E`.
**Repair:** Line 109 "2.4: …", line 117 "2.3: …" (and order the two declarations as the README does); line 196 "4.1: the accelerated rate of the heavy-ball method on quadratics".

## R08 (P3) — `adam_step_le` names no object of the roadmap

**Location:** `Suggested.lean` lines 309–316.
**Claim:** The statement is an inequality between two inlined sums over a bare `g : ℕ → ℝ`; no Adam moment is defined, while the README states it for `m̂_t`, `v̂_t` on `EuclideanSpace ℝ ι`.
**Witness:** The elaborated type mentions only `ℝ`, `Finset.Icc` and `√`; none of the file's definitions occurs in it.
**Repair:** Define the two moment recursions of 6.3 with real bodies on `EuclideanSpace ℝ ι` (`m 0 = v 0 = 0`, the two update rules) and state the bound for coordinate `i` of `m t / (1 − β₁^t)` and `v t / (1 − β₂^t)`, `t ≥ 1`.

## R09 (P3) — Layer 5 carries instance hypotheses its statements do not use

**Location:** README lines 57–58 and 507; `Suggested.lean` line 252: "`[FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]`".
**Claim:** Every measurability hypothesis of Layer 5 is strong measurability, so the σ-algebra on `E` is never used, and finite dimension is needed only for norm convergence in the convex case of 5.4.
**Witness:** The elaborated type of `IsSGD` has none of the three instances; the recursions of 5.2–5.3 (recomputed, table below) use only the inner product. CP15 line 126: weak convergence only, in a general Hilbert space.
**Repair:** Delete `[MeasurableSpace E] [BorelSpace E]` from the Conventions, the Layer 5 preamble and the file; keep `[FiniteDimensional ℝ E]` only in the convex item of 5.4 and on `sgd_convex_ae_tendsto`.

## R10 (P3) — 6.1: the symmetry hypothesis is unused, and the target has no locator

**Location:** README lines 621–628: "`P : E ≃L[ℝ] E` with `⟪P u, v⟫ = ⟪u, P v⟫` … (Proved here.)".
**Claim:** Both inequalities follow from `⟪∇f x, d x⟫ = ⟪P (d x), d x⟫ ≥ p ‖d x‖²` alone.
**Witness:** `P = [[1, −1], [1, 1]]` on `ℝ²`, not symmetric, `⟪P v, v⟫ = ‖v‖²`, `p = 1`; `f = ‖x‖²/2`, `x = (1, 0)`, `η = 1`: `d = (1/2, −1/2)`, `f (x − d) = 1/4 = f x − η/2 · ⟪∇f x, d⟫`.
**Repair:** Delete "`⟪P u, v⟫ = ⟪u, P v⟫`" from 6.1. Add a locator for gradient descent with a positive definite scaling (for instance the section on scaled gradient methods of Bertsekas, *Nonlinear programming*, read off the text) beside "proved here".

## R11 (P3) — the soft-threshold map has an owner on main that 3.2 does not cite

**Location:** README lines 365–366: "`(prox g η x)ᵢ = sign xᵢ · max (|xᵢ| − ηλ) 0` (soft thresholding)".
**Claim:** The map is restated by formula; MathematicalStatisticsNonparametric 6.4 owns it and supplies it to other roadmaps.
**Witness:** `TauCetiRoadmap/MathematicalStatisticsNonparametric/README.md` line 28 ("the soft-threshold section 6.4" is supplied); `TauCetiRoadmap/MathematicalStatisticsHighDimensional/README.md` line 271: `η_λ(y) = sign(y)(|y| − λ)₊`.
**Repair:** "`(prox g η x)ᵢ = η_{ηλ}(xᵢ)`, the soft-threshold map of MathematicalStatisticsNonparametric 6.4"; add that section to the supplier contracts and to the *Needs:* of 3.2. Test: `η = λ = 1`, `x = 3` gives `2`, as the Check at line 377.

## R12 (P3) — 3.2: the existence route uses an input its *Needs:* line omits

**Location:** README lines 368–369 and 379: "a minimizing sequence of the penalized function is Cauchy by the parallelogram law".
**Claim:** The argument needs the infimum of `u ↦ g u + ‖u − x‖²/(2η)` to be finite, which needs a continuous affine minorant of `g`; no layer or supplier line provides it.
**Witness:** Pinned `TauCeti.exists_affine_le_of_lt` (`TauCeti/Analysis/Convex/FenchelMoreau.lean:147`) gives the minorant from exactly the fields of `ClosedProperConvex`; it is not in the contracts or in line 379.
**Repair:** Add "the infimum is finite because `g` has a continuous affine minorant (`exists_affine_le_of_lt`)" to the sketch, and the declaration to the Tau Ceti contracts and to the *Needs:* of 3.2.

## R13 (P3) — 6.4: the cited proof does not cover the first block

**Location:** README line 705: "(Reddi, Kale and Kumar 2018, Theorem 1 and its proof in Appendix A; proved here.)".
**Claim:** The only route named for `x_{3s+1} = 1` is the source's, whose estimate fails at `s = 0`; the statement itself holds (table below).
**Witness:** RKK18 lines 548–556 use `1/√(3t+3) ≥ 1/√(2(3t+1))`; at `t = 0` this is `0.577 ≥ 0.707`, and the resulting bound is `0.908 · α/√(1 − β₂)`, below what is needed.
**Repair:** Add the route for `s = 0`: `v₁ = (1 − β₂)C²`, `v₂ = (1 − β₂)(2 − β₂)`, `v₃ = (1 − β₂)(1 + 2β₂ − β₂²)`, and `1/√(2(2 − β₂)) + 1/√(3(1 + 2β₂ − β₂²)) ≥ 1` on `(0, 1/5)` (minimum `1.022` at `β₂ = 1/5`); the source's estimate serves for `s ≥ 1`.

## R14 (P3) — layer shape: no `### Dependencies`, and a definition without Checks

**Location:** README lines 236–238, 323–326, 431–434, 501–503, 613–615, 716–725; lines 72–74.
**Claim:** Each layer ends with `### Examples` only, the dependencies being one `## Dependencies` section; the closed-proper-convex predicate of the Conventions has no Check.
**Witness:** Headings of the head: six `### Examples`, no `### Dependencies`. The four-field structure at `Suggested.lean` line 128 is tested nowhere in the README.
**Repair:** Move each sentence of lines 722–725 under its layer as `### Dependencies`. Add three Checks at the definition: `ι_C` for nonempty closed convex `C` satisfies it; the constant `⊤` fails `exists_ne_top`; `x ↦ −‖x‖²` fails the convex epigraph.

## R15 (P3) — two locators name a section where the source has a numbered place

**Location:** README line 224 ("Section 2 and Appendix") and lines 650–651 ("Section 2").
**Claim:** The locators are not exact.
**Witness:** KNS16 lines 162–171 (Section 2.3) and 638–665 (Appendix B) carry the three facts of 1.4; WWB19 line 382 is Theorem 2.2, the deterministic statement 6.2 refers to.
**Repair:** "(Karimi, Nutini and Schmidt 2016, Section 2.3 and Appendix B; proved here.)"; "(Ward, Wu and Bottou 2019, Theorem 2.2; the bound stated here is proved here.)".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 quadratic bounds, sufficient decrease, gradient bound | `K/2‖x‖²`; affine with `K = 0`; any real `η` | Decrease: `f x − η‖∇‖² + Kη²/2‖∇‖²`. `K = 0`: `m ≤ f x − η‖∇‖²` for all `η` forces `∇f = 0`. | holds | none |
| 1.2 cocoercivity, Baillon–Haddad iff | `K/2‖x‖²`; `−‖x‖²/2`; `K = 0` both directions | `K‖x−y‖² = K‖x−y‖²`; `‖x−y‖² ≤ −‖x−y‖²` fails; `K = 0`: affine iff constant gradient. | holds | R01 (supplier) |
| 1.3 inequality `StrongConvexOn.inner_gradient_sub_ge` | `μ/2‖x‖²`, `K = μ`; `(x₁²+4x₂²)/2` at `(1,0)`, `(0,1)`; trivial `E` | `μ/2 + μ/2 = μ`; `4/5 + 1/5 = 1 ≤ 1`; `4/5 + 16/5 = 4 ≤ 4`; `0 ≤ 0`. | holds | none |
| 1.3 `existsUnique_isMinOn` | `μ = 0`: `f = 0`, `f = exp` | Uniqueness fails, existence fails; `hμ : 0 < μ` is in the signature. | holds | none |
| 1.4 strong convexity gives PL | `μ = 0`, `f x = x` | Range `ℝ`, not bounded below. | fails | R04 |
| 1.4 `polyakLojasiewicz_leastSquares` | `A = diag(1,0)`, `b = (0,1)`; `A = 0`; `x²/2`, `μ > 1` | `x₁² ≤ x₁²`; `A = 0`: `0 ≤ 0` for every `σ`; `μx² ≤ x²` fails. General: `σ²‖P r‖² ≤ ‖Aᵀr‖²`. | holds | R15 |
| 2.1 sum bound | `x²/2`, `η = 1`; `η = 2/K`; `K = 0` | `x₀² ≤ 2·x₀²/2`; `x_k = (−1)^k x₀`; `η·0 ≤ 1` and `∇f = 0`. | holds | none |
| 2.2 `gradientDescent_convex_rate` | `K/2‖x‖²`, `η = 1/(2K)`; `f = 0` | `K/2·4^{−k}‖x₀‖² ≤ K‖x₀‖²/k`; `0 ≤ ‖x₀−x⋆‖²/(2ηk)`. | holds | none |
| 2.3 PL rate | `μ > K`; `x² + 3 sin² x` | `μ > K` forces `f x₀ = f⋆`, both sides `0`. Grid minimum of `f'²/(2(f − f⋆))` is `0.1755 ≥ 1/32`; `f'' ∈ [−4, 8]`. | holds | R07 |
| 2.4 strongly convex rate | `(x₁²+4x₂²)/2`, `η = 2/5`, `η = 1/4` | Factors `3/5, −3/5`; `1 − 2·(2/5)·4/5 = 9/25 = (3/5)²`; `3/4, 0`. | holds | R07 |
| 3.1 projection, firm nonexpansiveness | `closedBall 0 1`; `Icc (−1) 1`; `C` empty | `x/max 1 ‖x‖`; clamp; empty `C` returns `x` (hypothesis `hne` in the theorem). | holds | R06 |
| 3.2 `prox`, resolvent, `eq_prox_iff` | `g = 0`; `‖x‖²/2`; `\|·\|` at `3, 1/2, −3`; `g p = ⊤` | `x`; `x/(1+η)`; `2, 0, −2`. Pinned `subdifferential` requires `g p ≠ ⊤`; resolvent penalty `edist² /(2τ)` equals `‖·‖²/(2η)`. | holds | R06, R11, R12 |
| 3.3 `subgradientMethod_rate` | `\|·\|`, `x₀ = 1`, `η = 1`, `k = 0`; constant schedule | `1 ≤ (1+1)/2`; `2R²/(2R√(k+1)/G) = RG/√(k+1)`. | holds | none |
| 3.4 `proxGradient_rate`; contraction | ball, `c` with `‖c‖ = 2`, `η = 1`; `η ≤ 2/(μ+K)` | `x₁ = c/2`. Gradient step: `(1 − 2ημK/(μ+K))‖x−y‖² + (η² − 2η/(μ+K))‖∇f x − ∇f y‖²`, second term `≤ 0`. | holds | none |
| 4.1 `heavyBall_quadratic_rate` | `κ = 1`; `diag(1,4)`; `diag(1,100)` simulated 400 steps | `β = 0`, `x₁ = x⋆`; roots `(r ∓ 1/3)²`; `α[μ, K] = [(1−√β)², (1+√β)²]`; `sup ‖e_k‖/((k+1)q^k) = 1.83`. | holds | R07 |
| 4.2 `fista_rate`, `t_k` | `t₂`, `t₃`; `x²/2`, `η = 1`; state indexing | `(1+√5)/2`; `(1+√(7+2√5))/2`; `x₁ = 0`, `y₂ = 0`; `k − 1` steps from `(x₁, x₀, 1)` give `x_k`. | holds | R06 |
| 4.3 constant momentum | `κ = 1`; `k = 0`; `F x₀ = ⊤` | `q = 0`, factor `0`; `F x₀ ≤ F x₀ + μ/2‖x₀−x⋆‖²`; excluded by `F x₀ ≠ ⊤`. | holds | R03 |
| 5.1 Robbins–Siegmund | `a = β = ζ = 0`; `V n = Π(1 + a i)`; `a n = 1`, `V n = 2^n`; random `a` | Supermartingale `W n` recomputed: `E[W (n+1) \| ℱ n] ≤ W n`, `W n ≥ −Σβ`. Random `a` not covered. | holds, narrow | R02 |
| 5.2 `IsSGD`, one-step bounds | `x²/2` with `±1` noise; `σ = 0` | `(1−η)²x² + η²`; first bound becomes 1.1. | holds | R09 |
| 5.3 `sgd_nonconvex_rate` | sum of one-step bounds, `η ≤ 1/K` | `(η/2)Σ E‖∇‖² ≤ f x₀ − m + NKη²σ²/2`, giving `2(f x₀ − m)/(ηN) + Kησ²`. | holds | R09 |
| 5.3 `sgd_strongConvex_rate` | `n = 0`; induction with `m = n + n₀`; `n₀ = 0` | `D₀ ≤ n₀D₀/n₀`; `ν(m−2)/m² + ν/m² ≤ ν/(m+1)`; `n₀ = 0` forces trivial `E`, `0 ≤ 0`. | holds | R09 |
| 5.3 constant step; noise floor | `μx²/2`, `η = 1/μ` | `(1−ημ)‖·‖² − (η/K − η²)‖∇‖² + η²σ²`; `E x_n² = σ²/μ² = ησ²/μ`. | holds | R05 |
| 5.4 `sgd_convex_ae_tendsto` | 5.1 with `V = ‖x_n − x⋆‖²`, `a = K²η²`; `η n = 1/(n+1)` | `‖∇f x‖² ≤ K²‖x − x⋆‖²` absorbs the gradient term; `Σ η² = π²/6`. | holds | R09 |
| 6.1 preconditioned descent | `P = 1`; `diag(1,100)`; non-symmetric `P` | `η ≤ 1/K`; `d = x`; rotation example `1/4 = 1/4`. | holds | R10 |
| 6.2 `adaGradNorm_summable` | `f = 0`; `b₀ ≥ ηK`; `K = 0` | `b_k = b₀`; step `≤ 1/K`; `(b_{k+1}² − b_k²)/b_{k+1} ≥ b_{k+1} − b_k`; bound `b_{k₀} + 2(f x_{k₀} − m)/η`. | holds | R15 |
| 6.3 `adam_step_le` | `t = 1`; `β₁ = 0`; constant `g`; 20,000 random draws | Constant `1`; `\|g_t\| ≤ √(v_t/(1−β₂))`; no violation. | holds | R08 |
| 6.4 `reddi_iterate`, regret | `C = 3`; 48 pairs `(C, α)`, `C ∈ [2.0001, 10⁴]`, 30,000 steps; `C = 2` | `v₁ = 81/10`; no violation of `x_t ∈ (0,1]`, `x_{3s+1} = 1`; block regret `(C−2) + (C−2)`; bound `0`. | holds | R03, R13 |

- Source locators checked against the text: 14, in 7 sources (KNS16 lines 87–94, 148–149, 162–171, 638–665; KB15 lines 62, 110–117; RKK18 lines 200–209, 474–575; WWB19 lines 140, 382–400; BCN18 lines 991, 1041, 1109, 1200; GL13 line 265; CP15 lines 108–126).
- Library declarations opened at the pins: 14. Found: `StrongConvexOn.add_add_le_of_hasFDerivWithinAt` (Strong.lean:45), `subdifferential` (Subdifferential.lean:89), `moreauYosidaResolvent` (MoreauYosida/Basic.lean:124), `gradient_toReal_mem_subdifferential` (Differentiability.lean:199), `toDual_gradient`, `strongConvexOn_iff_convex`, `strongConvexOn_zero`, both projection lemmas (Projection/Minimal.lean:40, 145), both martingale theorems (Martingale/Convergence.lean:195, 213), `LinearMap.singularValues`, `eigenvectorBasis`. Absent: R01.
- No pinned declaration states the objects owned here (searched `LipschitzSmooth`, cocoercive, firmly nonexpansive, proximal, Polyak–Łojasiewicz, Robbins–Siegmund).
- Cross-roadmap citations resolved: SpectralSteepestDescent 5.1 at its open head (`le_add_fderiv_add_of_lipschitz`, same hypotheses and conclusion); OptimalTransport and MathematicalStatisticsHighDimensional on main.
- Dependency check: `depcheck: 243 roadmaps, 2549 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate: FAIL on `readme-ids-missing=6` only (R05, R01); build passes; nothing outside the folder changes.
- Elaboration of `Suggested.lean`: 26 `sorry` warnings, nothing else. One-tactic probe (`rfl`, `simp`, `infer_instance`, with and without `intros`) on a copy: 0 of 26 theorems close. `#check @name` types compared with the README: 4 dropped-binder leads, none changes a statement (they are R09's instances and binders the definitions do not need).
- Pull request text read against the head: no sentence contradicted, no omitted change.

Overlap check: read ManifoldOptimization, SpectralSteepestDescent, OptimalTransport, MathematicalStatisticsHighDimensional, MathematicalStatisticsNonparametric; descent lemma: SpectralSteepestDescent 5.1 (cited); soft-threshold map: MathematicalStatisticsNonparametric 6.4 (R11); Moreau–Yosida resolvent: Tau Ceti (cited); retraction-based descent on manifolds: ManifoldOptimization O4.1 and O6.3, a different carrier.

Source independence: 7 passages compared with 7 sources, none shared; largest share Nesterov 2018, 11 of 44 locators; contents not compared, since neither the text nor the contents page of Nesterov 2018 could be read.

Research link: The headline rates are those of Nesterov 2018 and Beck–Teboulle 2009; 5.1 is the Robbins–Siegmund 1971 theorem that Combettes–Pesquet 2015 use for stochastic quasi-Fejér iterations; 6.4 is the counterexample of Reddi–Kale–Kumar 2018. Rests on the README's references and on CP15 Lemma 2.2 and RKK18 Appendix A as read.

## Not verifiable

- Nesterov 2018 (Lemma 1.2.3, (1.2.19)–(1.2.22), Theorems 2.1.5, 2.1.10, 2.1.12, 2.1.14, 2.1.15, 2.2.3, scheme (2.2.22), Section 3.2.3): paywalled, no legal copy found.
- Bauschke–Combettes 2017 (Theorem 3.16, Propositions 4.16, 12.28, 16.44, Definition 12.23): paywalled.
- Beck 2017 (Theorems 10.21, 10.29, 10.34, 10.42) and Beck–Teboulle 2009 (Theorem 3.1, Lemma 4.3, Theorem 4.4): the publisher's pages refused the request.
- Polyak 1964 and Polyak 1987 (Section 3.2.1, Theorem 1): paywalled or no legal copy found.
- Robbins–Siegmund 1971 (Theorem 1, Section 3): paywalled; its Theorem 1 was read only as quoted in CP15 Lemma 2.2.
- Mathlib pull requests 43429, 41501, 41494 and 45868 of the Coordination section: not opened. Pull request 39574 was opened: it is open and defines `LipschitzSmoothWith` with a field `differentiable` and `fderiv_descent_le`; the second field's name was not visible.
- BCN18, GL13 and CP15 were read as arXiv versions; agreement of their numbering with the published versions was not checked.

## Source issues

- **Gap** in RKK18 at Appendix A, inequality (6), printed page 11: the source bounds the sum of two reciprocal square roots below using an estimate that needs `3t ≥ 1`; it should treat `t = 0` separately with the exact values of `v₁`, `v₂`, `v₃`; affects the proof.
- **Misprint** in RKK18 at Appendix A, the regret display after (6), printed page 11: the source writes the loss at step `3t+2` twice; it should be the losses at steps `3t+2` and `3t+3`; affects nothing.
- **Misprint** in RKK18 at Appendix A, first display, printed page 10: the source takes `C ≥ 2` where Section 3 takes `C > 2`; it should be `C > 2`, since the regret bound `2C − 4` vanishes at `C = 2`; affects nothing.
- **Error** in KB15 at Section 2.1, printed page 2: the source says the step is at most `α` whenever `1 − β₁ ≤ √(1 − β₂)`; it should carry the Cauchy–Schwarz constant (`β₁ = 0.9`, `β₂ = 0.5`, `t = 2` gives `1.043 α`); affects a stated result.
- **Misprint** in KNS16 at Appendix B, printed page 14: the source calls the constant `θ(A)` in `‖A v‖² ≥ θ(A)‖v‖²` the smallest nonzero singular value; it should be its square; affects nothing.

## For the human reviewers

- **Scope.** Sections 6.2–6.4 rest on conference papers (KB15 ICLR 2015, RKK18 ICLR 2018, WWB19 ICML 2019) and 6.1 cites no source; Layers 1–5 cite textbooks and journal articles (README lines 747–773).
- **Licence.** README lines 735–743 name three public Lean repositories (lean4-mlir BSD-3, Optlib Apache-2.0, nesterov-lean MIT) as prior art; `Suggested.lean` was not compared with them.
- **Licence.** `LipschitzSmoothWith` (`Suggested.lean` lines 30–34) is stated to take the name and field names of the open Mathlib pull request 39574; only the field `differentiable` could be confirmed.
- **Not tested.** Nesterov 2018 has the largest share of the locators (11 of 44); neither its text nor its table of contents could be read, so wording and arrangement were not checked against it.
