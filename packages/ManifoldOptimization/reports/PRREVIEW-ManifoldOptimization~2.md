# Review of ManifoldOptimization (pull request #1506 at 7b473d9)
**Verdict:** needs changes

**Summary.** Changes are needed, for two reasons, neither of them a false theorem: `Suggested.lean` does not elaborate (one missing decidability instance in the definition of truncated conjugate gradients), and the README still carries 45 unfilled locator placeholders `⟦LOC …⟧`, one of them standing where the hypotheses of the trust-region local theorem should be and one as an empty bibliography entry. Every Check, worked example and stated constant was recomputed and agrees with the text; ten of the twelve findings of the previous review are repaired. There are three small corrections and four format notes, none blocking, and three questions for the human reviewers (whether the truncated-CG recursion is in scope, and two licence points).

## R01 (P1) — `Suggested.lean` does not elaborate: the definition of `tcg` tests `g = 0` with no decidability instance

The acceptance file is refused as a whole until it builds, so none of its statements is checked at the pins. Elaborating `TauCetiRoadmap/ManifoldOptimization/Suggested.lean` at the pinned Mathlib and Tau Ceti gives exactly one error, at line 509: `failed to synthesize Decidable (g = 0)`, from `if g = 0 then 0 else …` with `g : V` in an arbitrary inner-product space.

The smallest change is one line, `open Classical in`, placed before the docstring of `tcg` (line 505). With that line added to a copy, the file elaborates with `sorry` as its only warning, and the statements of `norm_tcg_le`, `tcg_cauchy_decrease`, `rtrSeq` and `trSeq_tcg_local_superlinear` are unchanged.

## R02 (P2) — Forty-five locators are unfilled placeholders, including the hypotheses of O5.3 and one bibliography entry

A reader cannot check a target against its source when the citation reads `[B23, ⟦LOC sphere⟧]`, and an implementer of O5.3 cannot tell which hypotheses the theorem carries. The README has 45 tokens of the form `⟦LOC name⟧`: 27 after `B23`, 10 after `AMS08`, 2 after `DH19`, 1 after `EAS98`, three with no source key (`posdef` at line 273, `polar-nearest` at line 500, `eckart-young` at line 511), the bare `⟦LOC rtr-hypotheses⟧` that ends the statement of O5.3 (line 889), and the whole reference entry `[LWHWXW24] ⟦LOC lwhwxw⟧` (line 1363). They cover, among others, every matrix manifold of O0.3, both Hessian formulas of O1.3, all of Layer 3, the Armijo and Cauchy-point statements, Newton's method in [AMS08], O6.1–O6.3, O6.6 and every worked example.

The repair is to replace each token by the locator, or by "proved here" where no source states the result (as O6.5 already does). Some that I read in [B23] while checking: the compact pullback bound of O2.4 is Lemma 10.57; the capture and rate statements of O5.3 are Theorems 6.29 and 6.30, already cited there; the quotient gradient of O1.2 is Proposition 9.39; the group-action form of the quotient metric in O0.2 is Theorem 9.38. For line 889, state the hypotheses in the sentence: Theorem 6.29 of [B23] assumes a bound on the model Hessians, a lower bound on `f`, and its regularity assumptions A6.6, A6.8 and A6.9, and Theorem 6.30 assumes `Hess f` continuously differentiable and bounded initial acceleration of the retraction curves; if the intended claim is that all of these hold near `x*` for a smooth cost and a smooth global retraction, say so and say that this reduction is proved here. Complete the entry for [LWHWXW24] (authors, title, year, venue).

## C01 — Four locators point beside the statement they are cited for

Each misleads a reader who opens the source, and none changes a stated result.

- O6.4 (line 973) cites [B23, Prop. 11.12] for "a geodesically convex function on a compact connected manifold is constant". That statement is Corollary 11.10; Proposition 11.12 is the generalization to a maximum in the relative interior of a geodesically convex set, whose proof is the argument sketched. Cite both, or Corollary 11.10.
- O2.1 (line 459) cites [B23, Cor. 4.17] for the local inverse of `R_x` "smooth jointly in `(x, y)` near the diagonal". Corollary 4.17 gives only that each `R_x` is a diffeomorphism near the origin; the joint statement needs its own locator or "proved here".
- O2.2 (lines 488 and 492) cites [AM12, Lemma 4] and [AM12, Prop. 5]. In the text of the paper on HAL (hal-00651608) the local smoothness of the projection is Lemma 3.1 and the projective retraction is Proposition 3.2, and there is no Lemma 4 or Proposition 5. Cite the numbering of the version read.
- O0.3 (line 297) says the proof of [DH19, Thm. 1] calls the pseudoinverse of `I − XXᵀ` a left inverse. It is the statement of the theorem that does so, in the sentence after its equation (24).

## C02 — The Frobenius-norm Eckart–Young theorem with uniqueness is used in O2.2 and has no owner

The fixed-rank retraction (lines 507–511) is second order "since there `ΠZ` is the unique nearest rank-`r` matrix", by "the Eckart–Young theorem with its uniqueness case", with a placeholder and [EY36] as its only support. A citation is not a supplier, and the neighbouring bullet on the polar factor says "Prove here" for the analogous nearest-point property. OperatorIdeals OI-A49 on main is the operator-norm identification of approximation numbers with singular values, not the Frobenius statement with uniqueness under the gap `σ_{r−1}(Z) > σ_r(Z)`. Say "Prove here that …" as for the polar factor, or name the roadmap section that proves it.

## C03 — The pull request's description no longer describes the head

"Depends on: #887, #1050" names two pull requests; the head consumes twelve roadmaps, all on main (DifferentialGeometry, HopfRinow, RiemannianGeometry, MorseTheory, OptimalTransport, SmoothBundlesConnections, LieGroups, TopologicalKTheory, RealSemisimpleLieGroups, Majorization, PrincipalAngles, PolarDecomposition), and no open pull request. The description also lists two sources where the README now has thirteen, and does not say that it adds a new roadmap folder of seven layers with a `Suggested.lean` of 66 declarations. A text that would be right: "Adds the roadmap ManifoldOptimization (Layers 0–6). Suppliers, all on main: …", with the list above, in place of the "Depends on" lines.

## N01 — Target headings carry a letter prefix

The 32 target headings read `### O0.1 …` to `### O6.6 …`; the tools that count and sample targets look for `### k.n Title` with digits only, and found none to sample. Writing `### 0.1 …` (the in-text references `O0.1` can stay) makes the targets visible to them.

## N02 — The Summary says the roadmap follows a textbook

Lines 4–5: "following Boumal's textbook [B23] and, for Newton's method and trust regions, Absil, Mahony and Sepulchre [AMS08]". The layers are in fact the roadmap's own (no run of them maps onto the chapters of [B23]), so the sentence undersells them; "its main sources are [B23] and [AMS08]" would say what is true.

## N03 — O6.3 states its rate without its hypotheses in the sentence

Lines 957–959 give the linear rate "for a global retraction with the pullback bound"; completeness, `κ > 0`, `κ`-convexity along geodesics and the minimizer `x*` are in the Lean statement and in the Summary, not in the sentence. One clause would align the three.

## N04 — Three proved lemmas and one coordination sentence are not what their files are for

`contDiffOn_fisherEmbedding`, `fderiv_fisherEmbedding_apply` and `inner_fderiv_fisherEmbedding` are proved API lemmas in an acceptance file of headline statements; they would be Checks or README bullets. In the README, "Coordinate step-size and descent-lemma vocabulary with its authors, and confirm its licence before adapting any of it" (lines 1148–1149) is a task for people, not a statement of the roadmap.

## Questions for the author

- O5.3(a) and `trSeq_tcg_local_superlinear` assert convergence from a neighbourhood of `x*` for every `Δ₀ ∈ (0, Δ̄]`, with no lower bound on `f` and no bound on the model Hessians, which [B23, Thm. 6.29] assumes. I expect these to hold on a compact neighbourhood because the truncated-CG step is bounded by a multiple of `‖grad f‖` where the Hessian is positive definite, but I did not carry the capture argument through with a large initial radius. Is that the intended route, and is the constant `c` meant to be uniform over the neighbourhood as the Lean statement has it?

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `tcg` (O4.4) | elaboration at the pins; `g = H = Δ = 1`; `H = −1`; `H = I`, `Δ > ‖g‖` | error at line 509; with `open Classical in` none. Outputs `−1` (boundary, decrease 1/2), `−Δ`, `−g` with residual 0 | fails to build | R01 |
| `norm_tcg_le` | `g = 0`; `δ = 0`; infinite-dimensional `V` (finrank 0); non-self-adjoint `H` | 0; `boundaryStep = x/0 = 0`, output `η`; output `η₀ = 0`; invariant `‖η‖ < Δ` kept by each update | holds with no hypothesis on `H` | none |
| `exists_iterate_tcgStep_out_eq_some` | `dim V = 0`; `κ > 0`, residual 0 after `n` orthogonal residuals | `g ≠ 0` impossible; test `0 ≤ r₀ min(r₀^θ, κ)` with right side positive | holds | none |
| `tcg_cauchy_decrease` | `g = 0`; `κ ≤ 0` (no return, junk last iterate); `r' = 0` with test failing | `0 ≤ 0`; decrease monotone along iterates, first iterate the Cauchy point; next state has `δ = 0`, returns `η` | holds | none |
| `trSeq_exists_norm_mgradient_le` (O4.5) | proof redone; README numbers | `ρ ≥ 1/2` when `Δ ≤ c₁ε/(L+β)`; `k ≤ 3S/2 + ½log₂(Δ₀/Δ_ε)`, `log₂ y ≤ y`, `ε ≤ 1`; constant `192 + 8 = 200`, `200/ε² = 800`, first index 1 | holds; Check correct | none |
| O4.3 Checks and `β > 0` non-example | `f = x²/2`, `H = 1`; `β = 0`, `H = 0`, steps 0 | `m(−1) = 0`, decrease 1/2 = bound; states `(1,1),(0,2),(0,1/2)`; `‖g‖/0 = 0` gives `0 ≤ 0`, gradient stays 1 | correct | none |
| `rgd_sum_sq_norm_mgradient_le`, `rgd_exists_norm_mgradient_le` (O4.1) | `f = x²/2`, `L = 1`, `x₀ = 2`; non-global `R` | sequence `2, 0, 0`; sums `0, 4, 4 ≤ 4`; non-global: `x₁ = 100`, `f = 5000` | holds; previous R03 repaired | none |
| `armijo_decrease` (O4.2) | `ᾱ = 4`, `τ = r = 1/2`, `x = 1`; `g = 0` | steps 4, 2 fail (decrease −4, 0), step 1 passes (1/2 ≥ 1/2); bound 1/4; exponent set all of ℕ, `sInf = 0` | holds | none |
| `rgd_linear_of_convexAlongGeodesics` (O6.3) | `κ ≤ L`; `κ > L`; one-point `M` | PL gives factor `1 − κ/L`; for `κ > L` both sides forced to 0, `f` constant; 0 ≤ 0 | holds in every case | N03 |
| `convexAlongGeodesics_iff`, `geodesicallyConvex_iff` (O6.1) | `f = x²/2` on ℝ, `x = 0, y = 2, t = 1/2`; incomplete `M` | `κ = 1`: 1/2 = 1/2; `κ = 2`: 1/2 ≤ 0 fails; short geodesics are unique segments, so both directions hold locally | holds | none |
| `const_of_convexAlongGeodesics` (O6.4) | circle, height function; zero-dimensional `M` | midpoint inequality at a maximum forces equality on a neighbourhood; a point | holds; source is Cor. 11.10 | C01 |
| `isGeodesicCurveOn_of_isGeodesicSegment` | `x = y`; junk values of `γ` outside `[0,1]` | constant curve; the pinned predicate uses derivatives within `Icc 0 1` (Geodesic/Basic.lean:102–110) | holds | none |
| `newton_local_quadratic` (O5.2) | `f = x²/2 + x³/3`; `f = −x²`; zero-dimensional `M` | error `x²/(1+2x) ≤ 2x²` for `|x| ≤ 1/4`; one step to 0; `hessianOp` a unit on the zero space | holds; [B23, Thm. 6.7] read | none |
| `trSeq_tcg_local_superlinear` (O5.3) | iterate equal to `x*`; exact quadratic | `0/0 = 0`, step rejected, `0 ≤ c·0^p`; error 0 after one step | not refuted; hypotheses against Thm. 6.29 open | R02, question |
| `armijo_local_linear` (O5.1) | `f = x²/2`, `ᾱ = τ = r = 1/2`; non-global `R` | `x_k = 2^{−k}x₀`, decrease `3x²/8 ≥ x²/4`; tested steps `≤ ᾱ‖g‖` stay in the open domain near `x*` | holds | none |
| `isMinOn_rayleighCost_of_hessian_nonneg` | `A = diag(2,1)`; `n = 0` | `e₁`: value −2, Hessian 2; `e₂`: −1, −2; two-point sphere, cost constant | holds | none |
| `mvfderiv_mgradient_comp`, `mvfderiv_hessianOp_comp`, `deriv_deriv_comp_eq` (Layer 1) | circle at `e₁`, `f̄ = 2x + 3y` and `f̄ = x₁`; `γ = t²`, `f = x²/2` | gradient `(0,3)`; `λ = 1/2`, Hessian `−u`; `6 = 4 + 2` | hold | none |
| `hessianOp` | pinned `hessian` (Riemannian/Laplacian.lean:135–140) | `⟪∇(grad f) x v, w⟫`, same connection | agreement by definition | none |
| `Retraction`, `IsSecondOrder`, O2.2 examples | `x + 2v`; `x + v + v²`; hyperbola; Q-factor on `St(3,2)` and `O(3)`; `Δ°(2)` | velocity `2v`; acceleration `2v²`; `x + v = (−4/3, 4/3)` on the fixed line; accelerations `X[[−1,−2],[0,−1]]` and `−2e₁e₁ᵀ − e₂e₂ᵀ − e₃e₃ᵀ − 2e₂e₃ᵀ`; `|1−2p|/(2(p(1−p))^{3/2})` | all as stated | none |
| `fderiv_sinkhornScaling`, `sinkhornScaling` | `DS(2)` at `J₂/2`, `Z = E₁₁`; kernel of the linearization | `α = (1,0)`, `β = (1/2,−1/2)`, result `[[1,−1],[−1,1]]/4`; kernel `(𝟏,−𝟏)`, image codimension 1 | holds | none |
| `exists_satisfiesPullbackBound` (O2.4) | `x⁴` on ℝ (not compact); [B23, Lemma 10.57] | `v⁴ ≤ Lv²/2` fails; compact case is the lemma | holds | R02 (locator) |
| O0.3 values | `St(2,2)` at `I`; `P(1)`; `Δ°(2)`; `DS(3)` non-example; `GL_n/O(n)` | `[[0,−1/2],[1/2,0]]`; `1`, `4e`, `log(9/4)`, `6`; `(3/4,−3/4)`, `π/3`; row sum `1/3 + 4/(3(1+cos θ)) > 1`; factor 4 | all as stated | none |
| Layer 3 | `x², x³, x⁴, −x²`; circle KKT | Hessians `2, 0, 0, −2`; `λ = 1/2`, tangent Hessian −1 | as stated | none |
| O6.5, O6.6 | `x_t = e^{−t}`, `y = 2`; `κ = −1`; `P(1)` | `1 + 1/2 = 3/2`; flow `e^t` global; `X_t'' = (log(9/4))²X_t` | as stated | none |
| Worked examples | Brockett `A = diag(1,3)`, `N = diag(2,1)`; skew `A`; entropic `n = 2`; simplex step | 5 and 7; cost 0, `span(e₁)` not invariant; `J₂/2`; `1/10` | as stated | none |

- Source locators checked against the text: 21 (B23: 15; BAC19: 4; DH19: 3 statements; EAS98: 2; AM12: 2), of which 4 are corrected in C01.
- Library declarations opened at the pins: 50 cited Tau Ceti names resolved to a file and line; definitions read in full for `ConvexAlong`, `GeodesicallyConvex`, `ConvexAlongGeodesics` (Analysis/GradientFlow/GeodesicConvex.lean:106–141), `IsGeodesicSegment` (Topology/MetricSpace/Length.lean:210), `IsGeodesicCurveOn`, `hessian`.
- Cross-roadmap citations resolved on main: 26 sections or targets in 14 roadmaps, all present (SmoothBundlesConnections B1.0, B3.3, B5.0, B6.0; RiemannianGeometry Conventions, 1.3, R5a, R6; MorseTheory 1.2, 1.3, 2.1, 6.1; OptimalTransport 9.3, 10.3, 13.1, 13.2, 13.8; and the rest).
- Dependency check: `depcheck: 182 roadmaps, 2070 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: one error (R01); with the one-line repair on a copy, `sorry` is the only warning. `#check @name` on the five metric headlines: every README hypothesis is in the elaborated type. The binders reported as dropped are `[I.Boundaryless]`, `[T2Space M]` and finite dimension on definitions whose types do not mention them, and `[IsRiemannianManifold I M]` on `newtonStep` and `newtonSeq`; no theorem loses a hypothesis its statement needs.
- One-tactic probes: no sorried theorem restates a definition; `toMatrix A i j = A (i, j)` closes by `rfl` and is not declared. No sorry'd data, no `set_option`, imports are `Mathlib` and thirteen `TauCeti.*` modules.
- Previous review: R01, R02, R03, R04, R05, R07, R09, R10, R11, R12 repaired; R08 partly (R02 above); R06 not followed (the truncated-CG recursion remains, as a total function with theorems) and is left to the human reviewers.
- Changes outside the folder: none.

Overlap check: read RiemannianManifoldsWithConvexBoundary, MorseTheory, RiemannianGeometry, HopfRinow, Surfaces and the open FirstOrderOptimization; nothing shared. RiemannianGeometry R6 owns the nearest-point retraction of closed-image embeddings and this roadmap the local one; FirstOrderOptimization owns the Hilbert-space rates and excludes manifolds by name. Ownership against the other open pull requests was searched by object (retractions, Riemannian gradient descent, the Fisher manifolds, the affine-invariant metric): no second owner.

Source independence: 10 passages compared with 5 sources (B23, BAC19, DH19, EAS98, AM12), none shared; largest share B23, 42 of 72 locators (27 of them unfilled); contents compared with B23: independent (Layer 0 draws on its Ch. 3, 7, 9 and 11, Layer 1 on Ch. 3, 5, 7 and 9, Layers 3–5 each on both Ch. 4 and Ch. 6; no run of layers maps one to one onto its chapters). AMS08, ABG07 and Ste83 were not read.

Research link: Layers 4 and 5 state the complexity bounds of Boumal, Absil and Cartis (2019) and the local trust-region theory of Absil, Baker and Gallivan (2007); Layer 0's Fisher manifolds are those of Douik and Hassibi (2019); O6.5 connects to EVI gradient flows in OptimalTransport. Rests on the README's references and on BAC19 and DH19 as read.

## Not verifiable

- [AMS08]: not read; all ten of its locators in the README are placeholders, so there was nothing to check against.
- [ABG07, Thms. 4.12, 4.13]: the article resolves only to a paywalled page; the corresponding [B23, Thms. 6.29, 6.30] were read instead.
- [Ste83, Thm. 2.1]: the publisher's page refused access; no legal copy found.
- [Bro91], [EY36], [Sin64], [BMAS14]: not fetched; cited without a theorem locator.
- The published numbering of [AM12]: only the HAL text was read.

## Source issues

- **Misprint** in EAS98 at §2.2, opening paragraph (arXiv p. 5): the source says the Euclidean and canonical Stiefel metrics are the same when `p = n`; it should be that the canonical metric is half the Euclidean one there, by its equation (2.39); affects nothing.
- **Error** in DH19 at Theorem 1, after equation (24): the source says the pseudoinverse of `I − XXᵀ` is a left inverse; it should be any solution of the compatible linear system, since that matrix annihilates the all-ones vector; affects a stated result.

## For the human reviewers

- **Scope.** O4.4 (README lines 782–798) defines truncated conjugate gradients as a recursion run for `dim V` steps, with a termination theorem. The previous review asked for its removal as a computational algorithm; the author kept it as a total function.
- **Licence.** [B23] was read from its author's page; that copy states it is "free for personal use only". No passage of it is reproduced in the roadmap.
- **Licence.** README line 1149 says Optlib's licence is to be confirmed before adapting any of it. I found no declaration in `Suggested.lean` that looks adapted from it, but did not open that repository.
- **Not tested.** [AMS08], the second most cited source, was not read; parts 1 and 2 of the copyright check were made against [B23] only among the books.
