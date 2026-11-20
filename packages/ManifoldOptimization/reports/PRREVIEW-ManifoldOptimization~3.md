# Review of ManifoldOptimization (pull request #1506 at 1ea9f2c)
**Verdict:** needs changes

**Summary.** Changes are needed for one reason, and it is not a false theorem: the Frobenius nearest-point property of the polar factor is claimed here ("Prove here", O2.2) and is also claimed, with this roadmap named as its consumer, by the open roadmap SpectralSteepestDescent, so the statement has two owners. Both findings of the previous review are repaired: `Suggested.lean` elaborates with `sorry` as its only warning, and every locator placeholder is filled; the filled locators I opened agree with the sources, and every Check and constant I recomputed agrees with the text. There are three small corrections and five format notes, none blocking, and four points for the human reviewers.

## R01 (P2) — The nearest-point property of the polar factor has two owners: O2.2 proves it here, and SpectralSteepestDescent 2.3 states it and names O2.2 as its consumer

An implementer cannot tell which roadmap the theorem is formalised under, and the two texts contradict each other, although this README promises "One owner per shared construction, stated identically on both sides". In O2.2 (lines 498–502) the text reads "Prove here that the polar factor `Z(ZᵀZ)^{−1/2}` of a matrix `Z` of full column rank (PolarDecomposition) is its unique nearest point in `St(n, p)`", and the Relation to other roadmaps says the property "is proved here (O2.2)" (line 1166). The open roadmap SpectralSteepestDescent (pull request #2423, which adds that roadmap) states the same theorem in `TauCetiRoadmap/SpectralSteepestDescent/README.md`, section 2.3 (lines 217–225): for injective `A` and every linear isometry `V`, `‖A − U_A‖_F ≤ ‖A − V‖_F` with equality only at `V = U_A`, by the same identity `‖A − V‖_F² = ‖A‖_F² + finrank E − 2⟪V, A⟫`. Its Downstream consumers (lines 496–497) say that ManifoldOptimization O2.2 uses this property and O2.4 its descent lemma 5.1, and that it "owns both". The statement there is the more general one (over `ℝ` or `ℂ`, for linear maps between inner-product spaces); the one here is its real matrix case, with `σ_{p−1}(Z) > 0` being injectivity.

The smallest change that leaves one owner: in O2.2 replace "Prove here that …" by a citation of SpectralSteepestDescent 2.3 and keep only the transport to `St(n, p)` through `toMatrix`; change the Majorization–PrincipalAngles–PolarDecomposition bullet of Relation to other roadmaps and the *Needs:* line of O2.2 to match; add a `### From SpectralSteepestDescent` contract; and name that roadmap as a supplier in the pull request's description, since it is not yet on main. The remark in O2.4 that for `M = V` and `R_x(v) = x + v` the bound follows from an `L`-Lipschitz gradient can cite its 5.1 at the same time. If you would rather keep the proof here, say so in Relation to other roadmaps and agree it with that roadmap's author, because its text must then change; as the two stand, neither can be accepted against the other.

## C01 — Six locators point beside the statement they are cited for, or cannot be told apart

Each misleads a reader who opens the source; none changes a stated result.

- O2.1 (line 459) cites [B23, Cor. 4.17] for the local inverse "smooth jointly in `(x, y)` near the diagonal". Corollary 4.17 treats one `R_x` at a time; the joint statement is Corollary 10.27, used in that form in Proposition 10.64.
- O3.3 (line 661) cites [B23, Prop. 6.5] for strict minimality "with quadratic growth `f(y) − f(x) ≥ c d(x, y)²`". Proposition 6.5 gives only the strict local minimizer; say that the growth bound is proved here.
- O0.3 (line 294) cites [DH19, Prop. 1] for the dimension `(n − 1)²`. In the arXiv text the dimension is stated in the paragraph before the tangent-space statement of §III-A, which is printed as "Preposition 1"; the statement printed as "Proposition 1" is the Levi-Civita connection of the Fisher metric. Cite "§III-A".
- O0.3 (lines 297–298) says the proof of [DH19, Thm. 1] calls the pseudoinverse of `I − XXᵀ` a left inverse. It is the statement of the theorem that does, in the sentence after its equation (24).
- O2.2 cites [AM12, (4), Prop. 3], [AM12, Lemma 4], [AM12, Prop. 5], [AM12, Prop. 6], [AM12, Prop. 7] (lines 479–513). The text on HAL (hal-00651608) numbers these (2.3), Proposition 2.3, Lemma 3.1 and Propositions 3.2, 3.3, 3.4. The README's numbers fit a consecutive numbering of the same statements; say in the References which version they are.
- "Ex." stands for both exercises and examples of [B23]: 3.26, 3.65, 3.66, 3.67, 5.18, 6.26, 7.10 and 9.51 are exercises, which the book states without proof (the smoothness of `x ↦ Proj_x` in O1.1 and the Rayleigh landscape among them), while 9.34 and 11.34 are examples. Write "Exercise" where it is one.

## C02 — The Frobenius-norm Eckart–Young theorem with uniqueness is still used in O2.2 without an owner

The fixed-rank retraction (lines 509–513) is second order "since there `ΠZ` is the unique nearest rank-`r` matrix in the Frobenius norm (the Eckart–Young theorem with its uniqueness case)", now with [B23, §7.5, (7.49)–(7.50); AM12, Prop. 6; EY36] as support. Citations are not suppliers. OperatorIdeals OI-A49, on main and in its open revision, is the operator-norm identification of approximation numbers with singular values, not the Frobenius statement with uniqueness under `σ_{r−1}(Z) > σ_r(Z)`, and no other roadmap I searched states it. Write "Prove here that …", as the neighbouring bullet does for the polar factor, or name the section that proves it.

## C03 — The pull request's description does not describe the head

"Depends on: #887, #1050" names two pull requests; the head consumes twelve roadmaps, all on main (DifferentialGeometry, HopfRinow, RiemannianGeometry, MorseTheory, OptimalTransport, SmoothBundlesConnections, LieGroups, TopologicalKTheory, RealSemisimpleLieGroups, Majorization, PrincipalAngles, PolarDecomposition), and no open pull request. It lists two sources where the README has thirteen, and does not say that it adds a new roadmap folder with seven layers and a `Suggested.lean` of 66 declarations. A text that would be right: "Adds the roadmap ManifoldOptimization (Layers 0–6). Suppliers, all on main: …" with the list above, in place of the "Depends on" lines, and with SpectralSteepestDescent added if R01 is settled by citing it.

## N01 — Target headings carry a letter prefix

The 32 target headings read `### O0.1 …` to `### O6.6 …`. The tools that count and sample targets look for `### k.n Title` with digits only and found none to sample; `### 0.1 …` makes the targets visible to them, and the in-text references `O0.1` can stay.

## N02 — The Summary says the roadmap follows a textbook

Lines 4–5: "following Boumal's textbook [B23] and, for Newton's method and trust regions, Absil, Mahony and Sepulchre [AMS08]". A roadmap does not say that it follows a source, and here the layers are its own. "Its main sources are [B23] and [AMS08]" says what is true.

## N03 — O6.3 states its rate without its hypotheses in the sentence

Lines 986–987 give the rate "for a global retraction with the pullback bound with constant `L`". Completeness, `κ > 0`, convexity along geodesics and the minimizer `x*` are in the Lean statement and in the Summary, not in the sentence; one clause would align the three.

## N04 — Three proved lemmas and one coordination sentence are not what their files are for

`contDiffOn_fisherEmbedding`, `fderiv_fisherEmbedding_apply` and `inner_fderiv_fisherEmbedding` are proved API lemmas in a file of headline statements; they would be Checks or README bullets. In the README, "Coordinate step-size and descent-lemma vocabulary with its authors, and confirm its licence before adapting any of it" (lines 1179–1180) is a task for people, not a statement of the roadmap.

## N05 — Relation to other roadmaps omits an open roadmap that hands O0.3 its input

The open roadmap OperatorMonotoneFunctionsAndMatrixMeans leaves the Riemannian manifold of real positive-definite matrices to O0.3 by name and offers its 7.2 (every `C¹` path from `A` to `B` has length at least `‖log(A^{−1/2}BA^{−1/2})‖_F`, attained by the weighted geometric mean) as the input for O0.3's distance formula and midpoint. The two scopes are compatible; a line under Relation to other roadmaps would record it.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Polar factor nearest point (O2.2) | `Z = (2,0)ᵀ`, `X = (cos θ, sin θ)ᵀ`; SpectralSteepestDescent 2.3 read | `‖Z − X‖² = 5 − 4cos θ ≥ 1`, equality only at `θ = 0`; same identity in both texts | true; two owners | R01 |
| Fixed-rank truncation (O2.2) | `Z = diag(2,1)`, `r = 1`; `Z = I₂` | unique nearest `diag(2,0)`; no gap, both rank-one diagonal projectors at distance 1 | true; unowned | C02 |
| `rgd_sum_sq_norm_mgradient_le`, `rgd_exists_norm_mgradient_le` (O4.1) | proof redone; `f = x²/2`, `L = 1`, `x₀ = 2`; non-global `R` | decrease `‖g‖²/(2L)`; sequence `2,0,0`; sums `0,4,4 ≤ 4`; non-global: `x₁ = 100`, `f = 5000` | holds | none |
| `trSeq_exists_norm_mgradient_le` (O4.5) | proof redone; README numbers | `|ρ − 1| ≤ (L+β)Δ/(2c₁ε) ≤ 1/2`; `k ≤ 3S/2 + ½log₂(Δ₀/Δ_ε)`; `1.5/(1/128) = 192`, `16/2 = 8`; `200/ε² = 800` | holds | none |
| `armijo_decrease` (O4.2) | `ᾱ = 4`, `τ = r = 1/2`, `x = 1`; `g = 0` | steps 4, 2 fail (decrease −4, 0 < 1), step 1 passes (1/2 ≥ 1/2); bound 1/4; exponent 0, `0 ≤ 0` | holds | none |
| `tcg`, `norm_tcg_le`, `tcg_cauchy_decrease` (O4.4) | `g = H = Δ = 1`; `H = −1`; `g = 0`; `κ < 0`; `finrank V = 0` | output −1, decrease 1/2 = bound; `−Δ`; 0; residual 0 fails test, next `δ = 0`, returns `η`; output 0 | hold | none |
| `newton_local_quadratic` (O5.2) | `f = x²/2 + x³/3`; `f = −x²` | error `x²/(1+2x) ≤ 2x²` on `|x| ≤ 1/4`; one step to 0 | holds | none |
| `trSeq_tcg_local_superlinear` (O5.3) | route of lines 906–918 checked step by step; iterate `= x*`; rejected step with `p > 1` | `‖η‖ ≤ ‖H⁻¹‖‖g‖`; model decrease `≥ ½⟪Hη, η⟫`; `0/0 = 0` rejected, `0 ≤ c·0^p`; rejection excluded eventually by `ρ → 1` | route sound | none |
| `armijo_local_linear` (O5.1) | `f = x²/2`, `ᾱ = τ = r = 1/2`; `x₀ = x*` | `x_k = 2^{−k}x₀`, decrease `3x²/8 ≥ x²/4`; `0 ≤ 0`; distance rate `√(C/c) q^{k/2}` | holds | none |
| `rgd_linear_of_convexAlongGeodesics` (O6.3) | `κ ≤ L`; `κ > L`; one point | factor `1 − κ/L` from PL; negative factor forces gap 0, so `M` a point; `0 ≤ 0` | holds | N03 |
| `convexAlongGeodesics_iff`, `geodesicallyConvex_iff` (O6.1) | `f = x²/2`, `x = 0`, `y = 2`, `t = 1/2`; both directions | `κ = 1`: `1/2 ≤ 1 − 1/2`; `κ = 2`: `1/2 ≤ 0` fails; short geodesics are the unique segments | hold | none |
| `const_of_convexAlongGeodesics` (O6.4) | circle, height function; [B23, Cor. 11.10, Prop. 11.12] read | interior maximum of a convex function on a segment forces constancy on it | holds; locators now right | none |
| `isMinOn_rayleighCost_of_hessian_nonneg` | `A = diag(2,1)`; `n = 0`; [B23, Exercise 5.18] | `e₁`: −2, Hessian 2; `e₂`: −1, Hessian −2; two points, equal cost | holds | C01 |
| `mvfderiv_mgradient_comp`, `mvfderiv_hessianOp_comp`, `deriv_deriv_comp_eq` | circle at `e₁`, `f̄ = 2x + 3y`, `f̄ = x₁`; `γ = t²`, `f = x²/2`; [B23, (5.25), (7.79)] | `(0,3)`; `λ = 1/2`, `∇²(λ∘h) = I`, Hessian `−u`; `6 = 4 + 2` | hold | none |
| `exists_satisfiesPullbackBound` (O2.4) | new long-step argument; `x⁴` on ℝ | `L ≥ 4max|f|/r² + 2max‖grad f‖/r` suffices for `‖s‖ ≥ r`; `v⁴ ≤ Lv²/2` fails | holds; Lemma 10.57 read | none |
| `fderiv_sinkhornScaling`, DS(2) Check | `X = J₂/2`, `Z = E₁₁` | `α = (1,0)`, `β = (1/2,−1/2)`; correction `[[3,1],[1,−1]]/4`; result `[[1,−1],[−1,1]]/4` | holds | none |
| O0.3 Checks | `St(2,2)` at `I`; `P(1)`; `Δ°(2)`; `DS(3)` midpoint; `GL_n/O(n)` | `[[0,−1/2],[1/2,0]]`; `1`, `4e`, `log(9/4)`, `6`; `(3/4,−3/4)`, `π/3`; `1/3 + 4/(3(1+cos θ)) > 1`; factor 4 | as stated | none |
| O0.3 dimension of `DS(n)` | `n = 2`; [DH19] §III-A | `(n−1)² = 1`, `2n − 1 = 3` independent constraints of 4 entries | true; locator ambiguous | C01 |
| O2.2 Examples | Q-factor on `St(3,2)`; `Δ°(2)` at `(p, 1−p)`; `DS(2) → Δ°(2)` | accelerations `[−e₁, −2e₁−e₂] = −2X[[1/2,1],[0,1/2]]`; `(1−2p)/(2(p(1−p))^{3/2})`; `s²(1/p + 1/(1−p))`, half | as stated | none |
| O2.1 non-example and local inverse | hyperbola at `(2,1/2)`, `v = (−10/3, 5/6)`; [B23, Cor. 4.17, 10.27] | `⟪v,(1/2,2)⟫ = 0`; `x + v = (−4/3, 4/3)` on `b = −a`; 4.17 is fibrewise | true; locator | C01 |
| O3.3 quadratic growth | `x²` at 0; [B23, Prop. 6.5] | `f(y) − f(0) = d²`; the proposition has no growth bound | true; locator | C01 |
| O6.5, O6.6, worked examples | `x_t = e^{−t}`, `y = 2`; Brockett `diag(1,3)`, `diag(2,1)`; simplex step | `1 + 1/2 = 3/2`; 5 and 7; `(1/12)/(10/12) = 1/10` | as stated | none |

- Earlier findings: R01 repaired (`open scoped Classical in` before `tcg`, line 505; the file elaborates); R02 repaired (no placeholder remains; O5.3 now states its hypotheses, "The sources state (a) under global hypotheses …"; the [LWHWXW24] entry is complete). Earlier small corrections: the O6.4 locator is repaired; the others return as C01–C03; format notes N01–N04 are unchanged.
- Source locators checked against the text: 51 statements and 30 equation numbers of B23 located at their numbers, 27 of the statements read in full; AM12 6, DH19 4, BAC19 6, EAS98 4; six are corrected in C01.
- Library declarations opened at the pins: 47 cited Tau Ceti names resolved to a file and line; `Matrix.tendsto_sinkhornPlan_iterate` (Data/Matrix/Sinkhorn/Basic.lean:457) read in full against `sinkhornScaling`.
- Cross-roadmap citations resolved on main: 24 sections or targets in 13 roadmaps, all present, each opened at its heading (SmoothBundlesConnections B1.0, B3.3, B5.0, B6.0; MorseTheory 1.2, 1.3, 2.1, 6.1; OptimalTransport 9.3, 10.3, 13.1, 13.8; and the rest).
- Dependency check: `depcheck: 182 roadmaps, 2070 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `sorry` is the only warning. Elaborated types compared with the README for all 66 declarations: the 24 with a dropped section binder are definitions and one structure (`[I.Boundaryless]`, `[T2Space M]`, finite dimension, and `[IsRiemannianManifold I M]` on `newtonStep` and `newtonSeq`); no theorem loses a hypothesis.
- One-tactic probes (`rfl`, `simp`, `infer_instance`, `trivial`, `aesop`) on a copy: none of the 30 admitted theorems closes. No sorry'd data, no `set_option`; imports are `Mathlib` and thirteen `TauCeti.*` modules. All five headline families of the Summary are stated.
- Changes outside the folder: none. The one automatic check that failed (target headings) is N01.

Overlap check: read RiemannianManifoldsWithConvexBoundary, MorseTheory, RiemannianGeometry, HopfRinow, Surfaces and the open FirstOrderOptimization; nothing shared with them (RiemannianGeometry R6 owns the nearest-point retraction of closed-image embeddings and this roadmap the local one; FirstOrderOptimization excludes manifolds by name). By object, among all open roadmaps: SpectralSteepestDescent shares the polar-factor nearest-point theorem, with no single owner (R01); OperatorMonotoneFunctionsAndMatrixMeans owns the closed-form distance on the positive-definite cone and leaves the real Riemannian manifold to this roadmap (N05); NonlinearProgrammingOptimality and NewtonAndQuasiNewtonMethods name this roadmap and restate nothing of it.

Source independence: 12 passages compared with 5 sources (B23, AM12, DH19, BAC19, EAS98), none shared; largest share B23, 56 of 102 locators; contents compared with B23: independent (Layer 0 draws on its Ch. 3, 7, 9 and 11, Layer 1 on Ch. 3, 5, 7 and 9, Layer 2 on Ch. 3, 5, 7, 9 and 10, Layers 3–5 each on Ch. 4 and 6; only Layer 6 meets a single chapter, Ch. 11, and adds O6.5 and the metric-segment statements that the chapter lacks). AMS08, with 18 locators, could not be read.

Research link: Layers 4 and 5 state the complexity bounds of Boumal, Absil and Cartis (2019) and the local trust-region theory of Absil, Baker and Gallivan (2007); the Fisher manifolds of Layer 0 are those of Douik and Hassibi (2019); O6.5 feeds the EVI gradient flows of OptimalTransport. Rests on the README's references and on BAC19, DH19 and B23 as read.

## Not verifiable

- [AMS08], 18 locators: no legal copy was found (the publisher's page is closed); where the README pairs one with a [B23] locator, the [B23] one was read.
- [ABG07, Thms. 4.12, 4.13]: recorded as cited by locator only; [B23, Thms. 6.29, 6.30] were read instead.
- [Ste83, Thm. 2.1], [Bro91], [EY36], [Sin64], [BMAS14], [LWHWXW24]: not read.
- The published numbering of [AM12]: only the HAL text was read.

## Source issues

- **Misprint** in DH19 at §III-A (arXiv text, the statement before Theorem 1): the source says "Preposition 1" for the tangent space and later numbers the Levi-Civita statement Proposition 1 as well; it should be two distinct numbers; affects nothing.
- **Error** in DH19 at Theorem 1, the sentence after equation (24): the source says the pseudoinverse of `I − XXᵀ` is a left inverse; it should be any solution of the compatible linear system, since that matrix annihilates the all-ones vector; affects a stated result.
- **Error** in EAS98 at §2.2, opening paragraphs (arXiv text): the source says the Euclidean and canonical Stiefel metrics are the same when `p = n`; it should be that the canonical metric is half the Euclidean one there, by its equation (2.39); affects nothing.

## For the human reviewers

- **Scope.** O4.4 (README lines 789–803) defines truncated conjugate gradients as a recursion run for `dim V` steps, with a termination theorem. An earlier review asked for its removal as a computational algorithm; the author kept it as a total function with theorems.
- **Licence.** [B23] was read from its author's page; that copy states it is "free for personal use only". No passage of it is reproduced in the roadmap.
- **Licence.** README lines 1179–1180 say Optlib's licence is to be confirmed before adapting any of it. No declaration of `Suggested.lean` looks adapted from it; that repository was not opened.
- **Not tested.** [AMS08], the second most cited source (18 of 102 locators), could not be read; the wording and arrangement checks were made against [B23] only among the books.
