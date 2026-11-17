# Review of FirstOrderOptimization (pull request #2474 at a209c5a)

**Verdict:** needs changes

Previous review (at e65132c), finding by finding: R01 repaired (README lines 24–26, 95–98, 370–373, 392: "The nearest-point map onto `C` is `metricProj C` of MathematicalStatisticsNonparametric 6.5"; the wording of line 371 is R01 below); R02 repaired (`Suggested.lean` lines 11–14: "Every headline theorem is statable at the pins"); R03 repaired (both declarations deleted; README lines 147–148 carry no name); R04 repaired (lines 581–585: "dividing by the `ℱ n`-measurable product"); R05 repaired (lines 208–211 and the Check of lines 230–231); R06 repaired (description: "The soft-threshold map is MathematicalStatisticsNonparametric 6.4 (on main), and the nearest-point map is its 6.5").

## R01 (P3) — 3.1 describes `convexProjection` as a different map from the one `Suggested.lean` defines

**Location:** `TauCetiRoadmap/FirstOrderOptimization/README.md` lines 371–372: "`convexProjection C` is that map with junk value `x` in place of `0`"; `Suggested.lean` lines 167–169.
**Claim:** The Lean definition returns `x` whenever the nearest point is not unique; `metricProj` then returns one of the nearest points, so the README sentence defines another function on sets with several nearest points.
**Witness:** `C = {−1, 1} ⊆ ℝ`, `x = 0`: `Suggested.lean` line 169 gives `convexProjection C 0 = 0` (no unique `p`); `metricProj C 0 ∈ {−1, 1}` (`TauCetiRoadmap/MathematicalStatisticsNonparametric/Suggested.lean` line 2339, `h.choose`).
**Repair:** Replace the sentence by: "`convexProjection C x` is the nearest point of `C` to `x` when exactly one exists, and `x` otherwise; for nonempty closed convex `C` it equals `metricProj C x`, since the nearest point exists by `exists_norm_eq_iInf_of_complete_convex` and is unique." On the witness this gives `0`, as the Lean does. In the Check of lines 389–390 replace "differ only outside" by "can differ only outside".

## R02 (P3) — three `TauCeti.*` imports that no statement of the file uses

**Location:** `TauCetiRoadmap/FirstOrderOptimization/Suggested.lean` lines 2–4: `import TauCeti.Analysis.Convex.Differentiability`, `import TauCeti.Analysis.Convex.FenchelMoreau`, `import TauCeti.Analysis.Convex.Strong`.
**Claim:** The file imports only the `TauCeti.*` modules it uses; these three supply declarations named in the docstring and in the README's proof routes, and none that a statement mentions.
**Witness:** A copy without lines 2–4 elaborates with the same 35 `sorry` warnings and nothing else; the statements use only `subdifferential` (line 5's module) and `moreauYosidaResolvent` (line 6's).
**Repair:** Delete lines 2–4. The docstring's list of suppliers "used by the README and not restated here" stays.

## R03 (P3) — two supplier-contract entries that no target consumes

**Location:** README lines 111–112 ("and `gradient_toReal_mem_subdifferential` (`TauCeti/Analysis/Convex/Differentiability.lean`)") and line 115 ("`Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le`"); `Suggested.lean` lines 19 and 21.
**Claim:** The contract list names the declarations consumed; neither of these occurs in a *Needs:* line, a proof route or a `### Dependencies` paragraph.
**Witness:** In the README each name occurs once, at lines 111 and 115; the 23 *Needs:* lines name neither (1.1's route to the quadratic bounds is SpectralSteepestDescent 5.1, line 150).
**Repair:** Delete both entries from the contract list and from the docstring of `Suggested.lean`; or, if a route uses one, name it in that target's *Needs:* line (for `gradient_toReal_mem_subdifferential`, that of 3.4).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `of_lipschitzWith_gradient`, `norm_gradient_sq_le`, sufficient decrease | `K/2‖x‖²`; affine, `K = 0`; `sin` | Both bounds equalities; `‖∇f‖² = 2K·f`; `K = 0` with a lower bound forces `∇f = 0`; `sin` remainder nonzero. | holds | none |
| 1.2 `add_inner_gradient_add_le`, cocoercivity | `K/2‖x‖²`; `−‖x‖²/2`; logistic | `K‖e‖² = K‖e‖²`; `‖e‖² ≤ −‖e‖²` fails; `f'' ≤ 1/4`. | holds | none |
| 1.2 `lipschitzWith_gradient` without convexity | `h = f + K/2‖·‖²`; `K = 0`; `−‖x‖²/2` | Remainder of `h` in `[0, K‖e‖²]`; `‖d + Ke‖² ≤ 2K⟪d + Ke, e⟫` gives `‖d‖² ≤ K²‖e‖²`; `K = 0`: affine. | holds | none |
| 1.3 `inner_gradient_sub_ge` | `μ/2‖x‖²`, `K = μ`; `(x₁² + 4x₂²)/2`; `K = μ` general; trivial `E` | `μ/2 + μ/2 = μ`; `4/5 + 1/5 = 1`, `4/5 + 16/5 = 4`; `K = μ` forces `d = μe`; `0 ≤ 0`. | holds | none |
| 1.3 `existsUnique_isMinOn` | `\|x\| + x²/2`; `f = 0`, `exp` at `μ = 0`; discontinuous linear `ℓ + ‖x‖²/2` | Minimizer `0`; uniqueness, existence fail; `inf = −∞`, so continuity is needed; `f y ≥ −2M‖y‖/r − μr‖y‖/2 + μ/2‖y‖²`. | holds | none |
| 1.4 `PolyakLojasiewicz`, `polyakLojasiewicz_leastSquares` | `A = diag(1, 0)`, `b = (0, 1)`; `A = 0`; `x²/2`, `μ > 1`; `exp` | `x₁² ≤ x₁²`, infimum `1/2`; `0 ≤ 0`; `μx² ≤ x²` fails; `2μeˣ ≤ e²ˣ` fails at `−∞`; `‖Aᵀr‖² ≥ σ²‖r‖²` on `range A`. | holds | none |
| 2.1 sum bound, `tendsto_gradient_gradientDescent` | `x²/2`, `η = 1`; `η = 2/K`; `cos`; `K = 0` | `x₀² ≤ x₀²`; `x_k = (−1)^k x₀`; `Σ sin² ≤ 2(cos x₀ + 1)`; `K = 0`: `∇f = 0`. | holds | none |
| 2.2 `gradientDescent_convex_rate`, `tendsto_gradientDescent_of_convex` | `K/2‖x‖²`, `η = 1/(2K)`; `f = 0` | `K/2·4^{−k}‖x₀‖² ≤ K‖x₀‖²/k`; `0 ≤ ‖x₀ − x⋆‖²/(2ηk)`. | holds | none |
| 2.3 `gradientDescent_polyakLojasiewicz_rate` | one step; `μ ≤ 0`; `μ > K`; `x² + 3 sin² x` | `f x₁ − f⋆ ≤ (1 − μ/K)(f x₀ − f⋆)` for every real `μ`; `μ > K` forces `f ≡ f⋆`; `inf f'²/(2f) = 0.1755 ≥ 1/32`, `f'' ∈ [−4, 8]`. | holds | none |
| 2.4 `gradientDescent_strongConvex_rate` | `(x₁² + 4x₂²)/2`, `η = 2/5`, `1/4` | Factors `3/5`, `−3/5`, `1 − 16/25 = 9/25`; `3/4`, `0`; `4μK ≤ (μ + K)²` keeps the base `≥ 0`. | holds | none |
| 3.1 `convexProjection_firmlyNonexpansive`, definition | unit ball, `‖x‖ = 2`; `C = ∅`; `C = {−1, 1}`, `x = 0` | `x/2` both maps; `x` against `0`; `0` against `±1`. | theorem holds; README sentence differs from the Lean | R01 |
| 3.2 `existsUnique_prox`, `moreauYosidaResolvent_eq_prox`, `eq_prox_iff` | `g = 0`; `‖x‖²/2`; `\|·\|` at `3, 1/2, −3`; `g p = ⊤` | `x`; `x/(1 + η)`; `2, 0, −2`; resolvent penalty `edist² / (2τ)` equals `‖x − y‖²/(2η)` at `τ = η.toNNReal`; pinned subdifferential empty at `⊤`. | holds | none |
| 3.3 `subgradientMethod_rate` | `\|·\|`, `x₀ = 1`, `η = 1`, `k = 0`; `x₀ = 1/2`, `η = 2`; constant schedule | `1 ≤ (1 + 1)/2`; `x₁ = −3/2`; `2R²/(2R√(k+1)/G) = RG/√(k+1)`; `‖s x‖ ≤ G` forces `G ≥ 0`. | holds | none |
| 3.4 `proxGradient_rate`, contraction | ball, `‖c‖ = 2`, `η = 1`; `K = 0` | `x₁ = c/2`; `(1 − 2ημK/(μ+K))‖e‖² + η(η − 2/(μ+K))‖d‖²`, second term `≤ 0`; `K = 0`: proximal point on `g` plus linear. | holds | none |
| 4.1 `heavyBall_quadratic_rate` | `κ = 1`; `diag(1, 4)`; `diag(1, 100)`, five eigenvalues, 400 steps; trivial `E` | `α = 1/μ`, `x₁ = x⋆`; `αμ = (1 − q)²`, `αK = (1 + q)²`, double roots `±1/3`; `sup ‖e_k‖/((k+1)q^k) = 1.816`; `c = 0`. | holds | none |
| 4.2 `fista_rate` | `t₂`, `t₃`; `x²/2`, `η = 1`; four 1-D lasso instances, 200 steps; state indexing | `(1+√5)/2`, `(1+√(7+2√5))/2`; `x₁ = y₂ = 0`; largest gap/bound ratio `0.126`; `k − 1` steps from `(x₁, x₀, 1)` give `x_k`. | holds | none |
| 4.3 `fistaConstantMomentum_rate` | `κ = 1`; `diag(1, 100)`, 300 steps; `k = 0`; `g x₀ = ⊤` | `q = 0`, factor `0`; largest gap/bound ratio `0.981`; `F x₀ ≤ F x₀ + μ/2‖x₀ − x⋆‖²`; excluded by `hx₀`. | holds | none |
| 5.1 three Robbins–Siegmund declarations | `a = β = ζ = 0`; `V n = 2^n`, `a n = 1`; `a n = ξ/(n+1)²`; route | Normalised `V'` satisfies the recursion with `a = 0`; stopped `Σβ' ≤ K`; `E\|U_n\| ≤ E U₀ + 2ΣEβ`; `ζ ≤ (1 + a)V + β` a.s. | holds | none |
| 5.2 `IsSGD`, one-step bounds | `x²/2`, `±1` noise; `σ = 0` | `(1 − η)²x² + η²`; `E[‖g‖² \| ℱ n] ≤ ‖∇f‖² + σ²`; first bound becomes 1.1's decrease. | holds | none |
| 5.3 `sgd_nonconvex_rate` | sum of one-step bounds; source | `(η/2)ΣE‖∇f‖² ≤ f x₀ − m + NKη²σ²/2`; GL13 (2.4) at constant `γ ≤ 1/L` gives the same `2(f − f⋆)/(γN) + Lγσ²`. | holds | none |
| 5.3 `sgd_strongConvex_constant_rate`, `sgd_strongConvex_rate` | `μx²/2`, `η = 1/μ`; `n = 0`; `n₀ = 0` | `(1 − ημ)D − η(1/K − η)‖∇f‖² + η²σ²`; `E x_n² = σ²/μ²`; `(m − 1)(m + 1) ≤ m²`; `n₀ = 0` only in trivial `E`, `0 ≤ 0`. | holds | none |
| 5.4 `sgd_convex_ae_tendsto`, nonconvex and strongly convex items | 5.1 with `V = ‖x_n − x⋆‖²`, `V = f − m` | `η²‖∇f‖² ≤ K²η²V`; `Kη²/2·‖∇f‖² ≤ K²η²(f − m)`; `Σ 1/(n+1)² = π²/6`; cluster point is a minimizer by continuity. | holds | none |
| 6.1 `preconditioned_sum_le` | `P = 1`; `diag(1, 100)`; non-symmetric `P` | `⟪∇f, d⟫ = ⟪P d, d⟫ ≥ p‖d‖²` needs no symmetry; `−η + Kη²/(2p) ≤ −η/2` iff `ηK ≤ p`; `d = x`. | holds | none |
| 6.2 `adaGradNorm_summable` | `f = 0`; `b₀ ≥ ηK`; `K = 0` | `b_k = b₀`; `(b_{k+1}² − b_k²)/b_{k+1} ≥ b_{k+1} − b_k`; `b_k ≤ b_{k₀} + 2(f x_{k₀} − m)/η`; `K = 0`: `k₀ = 0`. | holds | none |
| 6.3 `adam_step_le` | `t = 1`; `β₁ = 0`; 20,000 random `(β₁, β₂, t ≤ 40, g)` with extremal `g` | Constant `1`; `\|g_t\| ≤ √(v_t/(1 − β₂))`; largest ratio `1.0000`, no violation. | holds | none |
| 6.4 `reddi_iterate`, `reddi_regret` | `C = 3`; 54 pairs, `C ∈ [2.000001, 10⁴]`, `α/√(1−β₂) ∈ [10⁻⁶, 0.999999]`, 3000 steps | `v₁ = 81/10`; no violation of `x_t ∈ (0, 1]`, `x_{3s+1} = 1`; least regret slack `1.5·10⁻⁶`; first-block sum `≥ 1.0221` on `(0, 1/5]`. | holds | none |

- Source locators checked against the text: 15, in 7 sources (KNS16 lines 81, 87–91, 148–149, 161–171, 638–665; BCN18 lines 991–993, 1041–1044, 1109–1117, 1200–1213; GL13 lines 265–272; CP15 lines 108–112, 113–133; RKK18 lines 198–210, 474–574; KB15 lines 62, 110–119; WWB19 lines 291–296, 382–399).
- Library declarations opened at the pins: 14. `moreauYosidaResolvent` (`TauCeti/Analysis/GradientFlow/MoreauYosida/Basic.lean:124`), `subdifferential` (`TauCeti/Analysis/Convex/Subdifferential.lean:89`, requires `f x ≠ ⊥`, `f x ≠ ⊤`), `exists_affine_le_of_lt` (`FenchelMoreau.lean:147`), `gradient_toReal_mem_subdifferential` (`Differentiability.lean:199`), `StrongConvexOn.add_add_le_of_hasFDerivWithinAt` (`Strong.lean:45`), `existsUnique_isMinOn_sub_of_superlinear` (`Superlinear.lean:70`, a different hypothesis); Mathlib `singularValues` (`SingularValues.lean:95`, `ℕ →₀ ℝ`, positive for `i < rank`), both projection lemmas (`Projection/Minimal.lean:40, 145`), `eigenvectorBasis` (`InnerProductSpace/Spectrum.lean:297`), both martingale theorems (`Martingale/Convergence.lean:195, 213`), `StronglyAdapted` (`Process/Adapted.lean:104`).
- No pinned declaration states an object owned here (searched Lipschitz-smooth, cocoercive, nonexpansive, proximal, Polyak–Łojasiewicz, Robbins–Siegmund, heavy ball, soft threshold in both libraries).
- Cross-roadmap citations resolved: 4. SpectralSteepestDescent 5.1 at its open head (`le_add_fderiv_add_of_lipschitz`, same hypotheses and conclusion); MathematicalStatisticsNonparametric 6.4 (`softThreshold`) and 6.5 (`metricProj`) on main; OptimalTransport and MathematicalStatisticsHighDimensional links on main.
- Dependency check: `depcheck: 240 roadmaps, 2528 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate: every check passes (worker's run at a209c5a); nothing outside the folder changes.
- Elaboration of `Suggested.lean`: 35 `sorry` warnings, nothing else. One-tactic probe (`rfl`, `simp`, `simp_all`, `infer_instance`, `linarith`, `positivity`, `exact?`, after `intros`) on a scratch copy: 0 of 35 close. Elaborated types compared with the README: the 3 dropped-binder leads are `ClosedProperConvex`, `convexProjection`, `prox`, which do not need the instances; every theorem keeps `[CompleteSpace E]`.
- Pull request text read against the head: no sentence contradicted, no change left out. Headlines of 1.1–6.4 all stated; none is named as not statable and none is.

Overlap check: read ManifoldOptimization, DenoisingDiffusion, SpectralSteepestDescent, OptimalTransport, MathematicalStatisticsHighDimensional, MathematicalStatisticsNonparametric; descent lemma: SpectralSteepestDescent 5.1 (cited); soft-threshold map and nearest-point map: MathematicalStatisticsNonparametric 6.4 and 6.5 (cited); Moreau–Yosida resolvent: Tau Ceti (cited); lasso estimators: MathematicalStatisticsHighDimensional (named as a consumer); manifold descent and the manifold Polyak–Łojasiewicz inequality: ManifoldOptimization, on a different carrier.

Source independence: 13 passages compared with 7 sources, none shared; largest share Nesterov 2018, 11 of 47 locators; contents not compared with Nesterov 2018, whose text and contents page could not be read (by the README's own locators, Layers 1–4 draw on its Sections 1.2, 2.1, 2.2 and 3.2 out of order, and Layers 5–6 not at all).

Research link: The rates are those of Nesterov 2018 and Beck–Teboulle 2009; 5.1 is the Robbins–Siegmund 1971 theorem as Combettes–Pesquet 2015 use it for stochastic quasi-Fejér iterations; 2.3 is Karimi–Nutini–Schmidt 2016; 6.2 is Ward–Wu–Bottou 2019; 6.4 is Reddi–Kale–Kumar 2018. Rests on the README's references and on CP15, KNS16, WWB19 and RKK18 as read.

## Not verifiable

- Nesterov 2018 (Lemma 1.2.3, (1.2.19)–(1.2.22), Theorems 2.1.5, 2.1.10, 2.1.12, 2.1.14, 2.1.15, 2.2.3, scheme (2.2.22), Section 3.2.3; sampled targets 1.1, 2.1, 2.2, 3.3): the sources service resolves it only to the publisher's paywalled page.
- Bauschke–Combettes 2017 (Theorem 3.16, Propositions 4.16, 12.28, 16.44, Definition 12.23; sampled target 3.1): paywalled publisher page only.
- Beck 2017 (Theorems 10.21, 10.29, 10.34, 10.42; sampled target 4.3) and Beck–Teboulle 2009 (Theorem 3.1, Lemma 4.3, Theorem 4.4): the sources service found no legal copy.
- Polyak 1964 (paywalled), Polyak 1987 (Section 3.2.1, Theorem 1; sampled target 4.1) and Bertsekas 1999 (Section 1.2; sampled target 6.1): no legal copy found.
- Robbins–Siegmund 1971 (Theorem 1, Section 3): paywalled; its Theorem 1 was read only as quoted in CP15 Lemma 2.2. Robbins–Monro 1951: the sources service found no legal copy.
- The five Mathlib pull requests of the Coordination section were not opened; only the README's description of them was read.
- BCN18, GL13 and CP15 were read as arXiv versions; agreement of their numbering with the published versions was not checked.

## Source issues

- **Gap** in RKK18 at Appendix A, inequality (6), printed page 11: the source bounds `1/√(3t+2) + 1/√(3t+3)` below by `2/√(2(3t+1))`, which fails at `t = 0` (`1.284 < 1.414`); it should treat `t = 0` with the exact values of `v₁`, `v₂`, `v₃`; affects the proof.
- **Misprint** in RKK18 at Appendix A, the regret display after (6), printed page 11: the source writes the loss at step `3t+2` twice; it should be the losses at steps `3t+2` and `3t+3`; affects nothing.
- **Misprint** in RKK18 at Appendix A, first display, printed page 10: the source takes `C ≥ 2` where Section 3 takes `C > 2`; it should be `C > 2`, since the regret bound `2C − 4` vanishes at `C = 2`; affects nothing.
- **Error** in KB15 at Section 2.1, printed pages 2–3: the source says the step is at most `α` whenever `1 − β₁ ≤ √(1 − β₂)`; it should carry the Cauchy–Schwarz constant (`β₁ = 0.9`, `β₂ = 0.5`, `t = 2` gives `1.043 α`); affects a stated result.
- **Misprint** in KNS16 at Appendix B, printed page 14: the source calls the constant `θ(A)` in `‖A v‖² ≥ θ(A)‖v‖²` the smallest nonzero singular value; it should be its square; affects nothing.

## For the human reviewers

- **Scope.** Sections 6.2–6.4 rest on conference papers (KB15 ICLR 2015, RKK18 ICLR 2018, WWB19 ICML 2019); Layers 1–5 cite textbooks and journal articles (README lines 823–850).
- **Licence.** README lines 811–819 name three public Lean repositories (lean4-mlir BSD-3, Optlib Apache-2.0, nesterov-lean MIT) as reference material; `Suggested.lean` was not compared with them.
- **Licence.** `LipschitzSmoothWith` (`Suggested.lean` lines 39–45) is stated to take the name and field names of the open Mathlib pull request 39574; that pull request was not opened.
- **Not tested.** Nesterov 2018 has the largest share of the locators (11 of 47); neither its text nor its table of contents could be read, so wording and arrangement were not checked against it.
