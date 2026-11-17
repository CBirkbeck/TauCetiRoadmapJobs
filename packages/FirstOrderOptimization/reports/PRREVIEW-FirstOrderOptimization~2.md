# Review of FirstOrderOptimization (pull request #2474 at e65132c)

**Verdict:** needs changes

Previous review (at 0ba9f28), finding by finding: R01 repaired (README lines 100–103, 190: `StrongConvexOn.add_add_le_of_hasFDerivWithinAt` with `strongConvexOn_zero`); R02 repaired (lines 542–550, random `a`, `β`, `ζ`; the route is R04 below); R03 partly (both theorems are stated; the docstring is R02 below); R04 repaired (line 225, "with `μ > 0`"); R05 repaired (gate `readme-ids-missing=0`); R06 repaired (all seven names occur); R07 repaired (`Suggested.lean` lines 160, 167, 254); R08 repaired (`adamFirstMoment`, `adamSecondMoment`, lines 415–431); R09 repaired (lines 56–58, 537–538); R10 repaired (line 662, line 668); R11 repaired (lines 93–94, 384–385); R12 repaired (lines 104–105, 387–388, 399); R13 repaired (lines 746–751); R14 repaired (six `### Dependencies`; Checks at lines 79–81); R15 repaired (lines 232, 690–691).

## R01 (P2) — the nearest-point projection has an owner on main that 3.1 does not cite

**Location:** `TauCetiRoadmap/FirstOrderOptimization/README.md` lines 24, 349–351 and `Suggested.lean` lines 185–188: "Define `convexProjection C x` as the unique point of `C` nearest to `x` (from `exists_norm_eq_iInf_of_complete_convex`; on other sets it returns `x`)".
**Claim:** The scope list owns "the projection onto a closed convex subset", and 3.1 defines it; MathematicalStatisticsNonparametric 6.5, on main, already defines the same map with its Checks, so the object has two owners.
**Witness:** `TauCetiRoadmap/MathematicalStatisticsNonparametric/Suggested.lean` line 2338, `metricProj s x` (nearest point, junk value `0`); its README lines 2187–2189 and Checks 2215–2219. `C = closedBall 0 1`, `‖x‖ = 2`: both give `x/2`.
**Repair:** In 3.1: "The nearest-point map onto `C` is `metricProj C` of MathematicalStatisticsNonparametric 6.5. `convexProjection C` is that map with junk value `x` in place of `0`; the two agree for nonempty closed convex `C`." Add 6.5 to the supplier contracts and to the *Needs:* of 3.1; the scope bullet owns the theory (variational inequality, firm nonexpansiveness), not the map. On `C = ∅` the two differ (`0` against `x`), outside the hypothesis.

## R02 (P3) — the module docstring still says the file is not exhaustive and names no verdict on statability

**Location:** `Suggested.lean` lines 11–14: "**This file is not the roadmap, and it is not exhaustive.** … this file is read as suggested forms, never as a checklist. It states every named target of the README … discharging them finishes neither a milestone nor the roadmap."
**Claim:** The docstring must say that the file states the headline theorems against the pinned APIs and which headlines are not statable; "not exhaustive" contradicts "every named target", and the last clause is process narrative. (Previous R03, second half of its repair.)
**Witness:** All headlines of 1.1–6.4 are declared (39 theorems, list in the table); none is named as not statable, and the docstring does not say that none is.
**Repair:** "This file is not the roadmap: the roadmap is `README.md`. It states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti APIs, each with `sorry`. Every headline theorem is statable at the pins." Keep the sentence on `LipschitzSmoothWith` and the supplier list.

## R03 (P3) — two declarations restate the definition of `LipschitzSmoothWith`

**Location:** `Suggested.lean` lines 49–59 (`LipschitzSmoothWith.le_add_inner_gradient`, `LipschitzSmoothWith.add_inner_gradient_le`); README lines 143–145.
**Claim:** Both are the two halves of the defining inequality `fderiv_norm_le` with `fderiv ℝ f x h` rewritten as `⟪∇f x, h⟫`: padding.
**Witness:** On a scratch copy both close by `have h := hf.fderiv_norm_le x y; rw [Real.norm_eq_abs, abs_le, dist_eq_norm', ← toDual_gradient] at h; simp only [InnerProductSpace.toDual_apply_apply] at h; linarith [h.1, h.2]`.
**Repair:** Delete both from `Suggested.lean`; in README lines 144–145 delete the two backticked names and keep the bullet as it is.

## R04 (P3) — 5.1: the reduction to the integrable form does not apply to a random factor

**Location:** README lines 553–555: "The theorem reduces to it by stopping at the first `n` with `Σ_{k≤n} (a k + β k) > K`, for each `K : ℕ`."
**Claim:** The integrable form requires a deterministic summable `a`; the stopped factor is still random, and no deterministic summable sequence dominates it.
**Witness:** The Check of line 564, `a n = ξ/(n + 1)²` with `ξ` unbounded: stopped at level `K`, `a 0 · 1_{0<τ} = ξ · 1_{ξ + β 0 ≤ K}` is a non-constant random variable, so the stopped factor is not a deterministic sequence.
**Repair:** "The theorem reduces to it: dividing by the `ℱ n`-measurable product `Π_{i≤n} (1 + a i) ≥ 1` gives the recursion with `a = 0` for `V n / Π_{i<n} (1 + a i)`; then stop at the first `n` with `Σ_{k≤n} β k > K`, for each `K : ℕ`. The stopped `β` is bounded by `K` and the stopped `ζ` by `V n + β n`, so both are integrable; on `{Σ a < ∞}` the product converges, and the conclusions transfer." On the witness the normalised recursion has `a = 0`.

## R05 (P3) — 1.3: the README states the unique minimizer under a hypothesis the Lean statement does not have

**Location:** README lines 195–199: "Let `f` be `μ`-strongly convex and differentiable with `μ > 0`. … if `f` is continuous, it has a unique minimizer `x⋆` (`StrongConvexOn.existsUnique_isMinOn`)"; `Suggested.lean` lines 104–108.
**Claim:** The Lean statement assumes continuity only; in the README "if `f` is continuous" is implied by the standing differentiability, and the sketch (line 205) does not say why a minimizing sequence exists.
**Witness:** `f x = |x| + x²/2` on `ℝ`: continuous, `1`-strongly convex, not differentiable at `0`, unique minimizer `0`. The Lean statement covers it; the README sentence does not.
**Repair:** "A continuous `μ`-strongly convex `f` with `μ > 0`, differentiable or not, has a unique minimizer `x⋆` (`StrongConvexOn.existsUnique_isMinOn`); `f` is bounded below, because it is bounded on a ball around `0` and the strong convexity inequality on the segment from `0` to `y` gives `f y ≥ c₀ − c₁ ‖y‖ + μ/4 ‖y‖²` for large `‖y‖`." Add `|x| + x²/2` as a Check.

## R06 (P3) — the description omits a supplier

**Location:** Pull request description, paragraph "**Dependencies and coordination.**" and the `depends-on` block.
**Claim:** The head consumes MathematicalStatisticsNonparametric 6.4 (README lines 93–94, 384–385, 399–400); the description names SpectralSteepestDescent 5.1 as the only roadmap supplier.
**Witness:** `git diff 0ba9f28..e65132c` adds the contract line "MathematicalStatisticsNonparametric 6.4: the soft-threshold map"; the description has no occurrence of that roadmap.
**Repair:** Add to the paragraph: "The soft-threshold map is MathematicalStatisticsNonparametric 6.4 (on main)", and, after R01, "the nearest-point map is its 6.5". The `depends-on` block is unchanged (that roadmap is on main).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 quadratic bounds, sufficient decrease, gradient bound | `K/2‖x‖²`; affine, `K = 0`; `η < 0` | Equalities; decrease is `f x − η‖∇‖² + Kη²/2‖∇‖²` for every real `η`; `K = 0` and a lower bound force `∇f = 0`. | holds | R03 |
| 1.2 cocoercivity, `lipschitzSmoothWith_iff_lipschitzWith_gradient` | `K/2‖x‖²`; `−‖x‖²/2`; `K = 0` both ways | `K‖x−y‖² = K‖x−y‖²`; `‖x−y‖² ≤ −‖x−y‖²` fails; `K = 0`: affine iff constant gradient. | holds | none |
| 1.3 `inner_gradient_sub_ge` | `μ/2‖x‖²`, `K = μ`; `(x₁²+4x₂²)/2`; trivial `E` | `μ/2 + μ/2 = μ`; `4/5 + 1/5 = 1`; `4/5 + 16/5 = 4`; `0 ≤ 0`. | holds | none |
| 1.3 `existsUnique_isMinOn` | `\|x\| + x²/2`; `μ = 0`: `f = 0`, `exp` | Minimizer `0` without differentiability; `μ = 0`: uniqueness, existence fail (`hμ` present). | holds | R05 |
| 1.4 `polyakLojasiewicz_leastSquares` | `A = diag(1,0)`, `b = (0,1)`; `A = 0`; `x²/2`, `μ > 1` | `x₁² ≤ x₁²`, infimum `1/2`; `A = 0`: `0 ≤ 0` for every `σ`; `μx² ≤ x²` fails. | holds | none |
| 2.1 sum bound, `tendsto_gradient_gradientDescent` | `x²/2`, `η = 1`; `η = 2/K`; `K = 0` | `x₀² ≤ 2·x₀²/2`; `x_k = (−1)^k x₀`; `K = 0`: `∇f = 0`. | holds | none |
| 2.2 `gradientDescent_convex_rate`, iterates | `K/2‖x‖²`, `η = 1/(2K)`; `f = 0` | `K/2·4^{−k}‖x₀‖² ≤ K‖x₀‖²/k`; `0 ≤ ‖x₀−x⋆‖²/(2ηk)`. | holds | none |
| 2.3 `gradientDescent_polyakLojasiewicz_rate` | one step; `μ > K` | `f x₁ − f⋆ ≤ (f x₀ − f⋆) − ‖∇‖²/(2K) ≤ (1 − μ/K)(f x₀ − f⋆)`; `μ > K` forces `f = f⋆`, `0 ≤ 0`. | holds | none |
| 2.4 `gradientDescent_strongConvex_rate` | `(x₁²+4x₂²)/2`, `η = 2/5`, `1/4` | Factors `3/5, −3/5`; `1 − 2·(2/5)·4/5 = 9/25`; `3/4, 0`; `2ημK/(μ+K) ≤ 4μK/(μ+K)² ≤ 1`. | holds | none |
| 3.1 `convexProjection_firmlyNonexpansive` | unit ball, `‖x‖ = 2`; `C = ∅` | `x/2` for `convexProjection` and for `metricProj`; `∅`: `x` against `0`. | holds | R01 |
| 3.2 `existsUnique_prox`, `moreauYosidaResolvent_eq_prox`, `eq_prox_iff` | `g = 0`; `‖x‖²/2`; `\|·\|` at `3, 1/2, −3`; `g p = ⊤` | `x`; `x/(1+η)`; `2, 0, −2 = softThreshold 1`; pinned subdifferential is empty where `g p = ⊤`, as is the left side. | holds | none |
| 3.3 `subgradientMethod_rate` | `\|·\|`, `x₀ = 1`, `η = 1`, `k = 0`; `x₀ = 1/2`, `η = 2`; constant schedule | `1 ≤ (1+1)/2`; `x₁ = −3/2`; `2R²/(2R√(k+1)/G) = RG/√(k+1)`. | holds | none |
| 3.4 `proxGradient_rate`, contraction | ball, `‖c‖ = 2`, `η = 1`; `η ≤ 2/(μ+K)` | `x₁ = c/2`; `(1 − 2ημK/(μ+K))‖x−y‖² + η(η − 2/(μ+K))‖∇f x − ∇f y‖²`, second term `≤ 0`. | holds | none |
| 4.1 `heavyBall_quadratic_rate` | `κ = 1`; `diag(1,4)`; `diag(1,100)`, 400 steps; trivial `E` | `β = 0`, `α = 1/μ`; `α[μ, K] = [(1−q)², (1+q)²]`, double roots `±1/3`; `sup ‖e_k‖/((k+1)q^k) = 1.816`; `c = 0`. | holds | none |
| 4.2 `fista_rate` | `t₂`, `t₃`; `x²/2`, `η = 1`; state indexing | `(1+√5)/2`; `(1+√(7+2√5))/2`; `x₁ = y₂ = 0`; `k − 1` steps from `(x₁, x₀, 1)` give `x_k`. | holds | none |
| 4.3 `fistaConstantMomentum_rate` | `κ = 1`; `κ = 100`; `k = 0`; `g x₀ = ⊤` | `q = 0`, factor `0`; `9/10` against `99/100`; `F x₀ ≤ F x₀ + μ/2‖x₀−x⋆‖²`; excluded by `hx₀`. | holds | none |
| 5.1 Robbins–Siegmund, three declarations | `a = β = ζ = 0`; `V n = 2^n`, `a n = 1`; `a n = ξ/(n+1)²`; expectations | Normalised by `Π(1 + a i)`: recursion with `a = 0`. Integrable form: `E V n ≤ Π(1+a)(V₀ + ΣEβ)`, `ΣEζ ≤ EV₀ + sup EV·Σa + ΣEβ`. | holds | R04 |
| 5.2 `IsSGD`, one-step bounds | `x²/2`, `±1` noise; `σ = 0` | `(1−η)²x² + η²`; `E[‖g‖² \| ℱ n] ≤ ‖∇‖² + σ²`; first bound becomes 1.1. | holds | none |
| 5.3 `sgd_nonconvex_rate` | sum of one-step bounds | `(η/2)ΣE‖∇‖² ≤ f x₀ − m + NKη²σ²/2`. | holds | none |
| 5.3 `sgd_strongConvex_constant_rate` | `μx²/2`, `η = 1/μ` | `(1−ημ)D − (η/K − η²)‖∇‖² + η²σ²`; `E x_n² = σ²/μ² = ησ²/μ`, attained. | holds | none |
| 5.3 `sgd_strongConvex_rate` | `n = 0`; `m = n + n₀ ≥ 2`; `n₀ = 0` | `D₀ ≤ n₀D₀/n₀`; `(m−1)(m+1) ≤ m²` for `m = 2..999`; `n₀ = 0` forces trivial `E`. | holds | none |
| 5.4 `sgd_convex_ae_tendsto`, nonconvex item | 5.1 with `V = ‖x_n − x⋆‖²`; `V = f − m` | `a = K²η²` from `‖∇f x‖² ≤ K²‖x−x⋆‖²`; `Kη²/2·‖∇‖² ≤ K²η²(f − m)`; `Σ 1/(n+1)² = π²/6`. | holds | none |
| 6.1 `preconditioned_descent`, `preconditioned_sum_le` | `P = 1`; `diag(1,100)` | `⟪∇f, d⟫ = ⟪P d, d⟫ ≥ p‖d‖²`, so `−η + Kη²/(2p) ≤ −η/2` iff `ηK ≤ p`; `d = x`. | holds | none |
| 6.2 `adaGradNorm_summable` | `f = 0`; `b₀ ≥ ηK`; `K = 0` | `b_k = b₀`; `(b_{k+1}² − b_k²)/b_{k+1} ≥ b_{k+1} − b_k`; bound `b_{k₀} + 2(f x_{k₀} − m)/η`. | holds | none |
| 6.3 `adam_step_le` | `t = 1`; `β₁ = 0`; 20,000 random `(β₁, β₂, t ≤ 30, g)` | Constant `1`; `\|g_t\| ≤ √(v_t/(1−β₂))`; no violation, largest ratio `1.0000`. | holds | none |
| 6.4 `reddi_iterate`, `reddi_regret` | `C = 3`; 40 pairs, `C ∈ [2.0001, 10⁴]`, 3000 steps; first block | `v₁ = 81/10`; no violation of `x_t ∈ (0,1]`, `x_{3s+1} = 1`; least regret slack `1.5·10⁻⁶ > 0`; first-block sum `≥ 1.0221` on `(0, 1/5]`. | holds | none |

- Source locators checked against the text: 15, in 7 sources (KNS16 lines 87–91, 148–149, 162–171, 638–665; BCN18 lines 991–993, 1041–1044, 1109–1117, 1200–1213; GL13 lines 265–272; CP15 lines 108–112, 113–133; RKK18 lines 198–210, 474–574; KB15 lines 62–81, 110–119; WWB19 lines 382–399).
- Library declarations opened at the pins: 17. `StrongConvexOn.add_add_le_of_hasFDerivWithinAt` (`TauCeti/Analysis/Convex/Strong.lean:45`), `exists_affine_le_of_lt` (`FenchelMoreau.lean:147`), `subdifferential` (`Subdifferential.lean:89`, requires `f x ≠ ⊥`, `f x ≠ ⊤`), `gradient_toReal_mem_subdifferential` (`Differentiability.lean:199`), `moreauYosidaResolvent` (`MoreauYosida/Basic.lean:124`), `existsUnique_isMinOn_sub_of_superlinear` (`Superlinear.lean:70`, proper spaces only); Mathlib `toDual_gradient` (`Gradient/Basic.lean:128`), `strongConvexOn_zero`, `strongConvexOn_iff_convex` (`Convex/Strong.lean:135, 167`), `Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le` (`MeanValue.lean:423`), both projection lemmas (`Projection/Minimal.lean:40, 145`), `eigenvectorBasis` (`InnerProductSpace/Spectrum.lean:297`), `singularValues` (`SingularValues.lean:95`, `ℕ →₀ ℝ`), both martingale theorems (`Martingale/Convergence.lean:195, 213`), `StronglyAdapted` (`Process/Adapted.lean:104`).
- No pinned declaration states an object owned here (searched Lipschitz-smooth, cocoercive, firmly nonexpansive, proximal, Polyak–Łojasiewicz, Robbins–Siegmund; the only Łojasiewicz statement, `TauCeti/Geometry/Manifold/Morse/ExponentialConvergence.lean:102`, is local on manifolds).
- Cross-roadmap citations resolved: 3. SpectralSteepestDescent 5.1 at its open head (`le_add_fderiv_add_of_lipschitz`, same hypotheses and conclusion); MathematicalStatisticsNonparametric 6.4 on main (`softThreshold`, README line 2149); OptimalTransport and MathematicalStatisticsHighDimensional links on main.
- Dependency check: `depcheck: 241 roadmaps, 2530 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate: every check passes (worker's run at e65132c); nothing outside the folder changes.
- Elaboration of `Suggested.lean`: 39 `sorry` warnings, nothing else. One-tactic probe (`rfl`, `simp`, `simp_all`, `infer_instance`, `exact?`, `linarith`, `positivity`, after `intros`) on a scratch copy: 0 of 39 close. Elaborated types compared with the README: the 3 dropped-binder leads are `ClosedProperConvex`, `convexProjection`, `prox`, definitions that do not need the instances.
- Pull request text read against the head: one omission (R06), no sentence contradicted.

Overlap check: read ManifoldOptimization, SpectralSteepestDescent, OptimalTransport, MathematicalStatisticsHighDimensional, MathematicalStatisticsNonparametric; descent lemma: SpectralSteepestDescent 5.1 (cited); soft-threshold map: MathematicalStatisticsNonparametric 6.4 (cited); nearest-point projection: MathematicalStatisticsNonparametric 6.5 (R01); Moreau–Yosida resolvent: Tau Ceti (cited); manifold descent and the manifold Polyak–Łojasiewicz inequality: ManifoldOptimization, a different carrier.

Source independence: 14 passages compared with 7 sources, none shared; largest share Nesterov 2018, 11 of 47 locators; contents not compared with Nesterov 2018, whose text and contents page could not be read (by the README's own locators, Layers 1–4 draw on its Sections 1.2, 2.1, 2.2 and 3.2 out of order, and Layers 5–6 not at all).

Research link: The rates are those of Nesterov 2018 and Beck–Teboulle 2009; 5.1 is the Robbins–Siegmund 1971 theorem as Combettes–Pesquet 2015 use it for stochastic quasi-Fejér iterations; 2.3 is Karimi–Nutini–Schmidt 2016; 6.4 is Reddi–Kale–Kumar 2018. Rests on the README's references and on CP15, KNS16 and RKK18 as read.

## Not verifiable

- Nesterov 2018 (Lemma 1.2.3, (1.2.19)–(1.2.22), Theorems 2.1.5, 2.1.10, 2.1.12, 2.1.14, 2.1.15, 2.2.3, scheme (2.2.22), Section 3.2.3): paywalled publisher, no legal copy found.
- Bauschke–Combettes 2017 (Theorem 3.16, Propositions 4.16, 12.28, 16.44, Definition 12.23): paywalled publisher.
- Beck 2017 (Theorems 10.21, 10.29, 10.34, 10.42) and Beck–Teboulle 2009 (Theorem 3.1, Lemma 4.3, Theorem 4.4): the publisher's pages refused the request.
- Polyak 1964, Polyak 1987 (Section 3.2.1, Theorem 1) and Bertsekas 1999 (Section 1.2): paywalled or no legal copy found.
- Robbins–Siegmund 1971 (Theorem 1, Section 3): paywalled; its Theorem 1 was read only as quoted in CP15 Lemma 2.2. Robbins–Monro 1951: the open landing page gave no text.
- The five Mathlib pull requests of the Coordination section were not opened; only the README's description of them was read.
- BCN18, GL13 and CP15 were read as arXiv versions; agreement of their numbering with the published versions was not checked.

## Source issues

- **Gap** in RKK18 at Appendix A, inequality (6), printed page 11: the source bounds `1/√(3t+2) + 1/√(3t+3)` below by `2/√(2(3t+1))`, which fails at `t = 0` (`1.284 < 1.414`); it should treat `t = 0` with the exact values of `v₁`, `v₂`, `v₃`; affects the proof.
- **Misprint** in RKK18 at Appendix A, the regret display after (6), printed page 11: the source writes the loss at step `3t+2` twice; it should be the losses at steps `3t+2` and `3t+3`; affects nothing.
- **Misprint** in RKK18 at Appendix A, first display, printed page 10: the source takes `C ≥ 2` where Section 3 takes `C > 2`; it should be `C > 2`, since the regret bound `2C − 4` vanishes at `C = 2`; affects nothing.
- **Error** in KB15 at Section 2.1, printed page 2: the source says the step is at most `α` whenever `1 − β₁ ≤ √(1 − β₂)`; it should carry the Cauchy–Schwarz constant (`β₁ = 0.9`, `β₂ = 0.5`, `t = 2` gives `1.043 α`); affects a stated result.
- **Misprint** in KNS16 at Appendix B, printed page 14: the source calls the constant `θ(A)` in `‖A v‖² ≥ θ(A)‖v‖²` the smallest nonzero singular value; it should be its square; affects nothing.

## For the human reviewers

- **Scope.** Sections 6.2–6.4 rest on conference papers (KB15 ICLR 2015, RKK18 ICLR 2018, WWB19 ICML 2019); Layers 1–5 cite textbooks and journal articles (README lines 790–817).
- **Licence.** README lines 778–786 name three public Lean repositories (lean4-mlir BSD-3, Optlib Apache-2.0, nesterov-lean MIT) as prior art; `Suggested.lean` was not compared with them.
- **Licence.** `LipschitzSmoothWith` (`Suggested.lean` lines 43–47) is stated to take the name and field names of the open Mathlib pull request 39574; that pull request was not opened in this round.
- **Not tested.** Nesterov 2018 has the largest share of the locators (11 of 47); neither its text nor its table of contents could be read, so wording and arrangement were not checked against it.
