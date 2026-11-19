# Review of KernelsAndSpectralMethods (pull request #2516 at ec81a1a)

**Verdict:** needs changes

**Summary.** Changes are needed, both of them one clause long: the five findings of the previous review are repaired, and every statement of `Suggested.lean` that I recomputed is true, but two targets stated in prose lack a hypothesis and are false without it (the operator form of the conditional mean embedding in 11.3, and the unbiasedness of `mmdU` in 10.1 at `n = 1`). There are two findings, three small corrections and four format notes. The human reviewers have four points (the dependence on the open TopologicalDataAnalysis roadmap, the relation to lean-CKSD, the books that could not be read, and the papers cited without locators).

## R01 (P2) — The operator form of the conditional mean embedding in 11.3 is false without the hypothesis that the conditional expectations lie in the Kolmogorov space of `k`

The "Consequence (prose target)" of 11.3 (line 1275) reads: "if `C_{XX}` is injective and `Φ x` lies in its range, then `U_{Y|x} = C_{YX} C_{XX}⁻¹ Φ x` satisfies `E[g(Y) | X = x] = ⟪g, U_{Y|x}⟫` for every `g`". An implementer who takes these two hypotheses as the statement cannot prove it. Take `X = Y` uniform on a two-point set, `k ≡ 1` and `l` the identity kernel. The Kolmogorov space of `k` is the line spanned by `e = Φ(1) = Φ(2)`, `C_{XX}` is the identity on it (injective, with `Φ x` in its range), and `C_{YX} e = E Ψ(Y) = (1/2, 1/2)`. So `⟪g, U_{Y|x}⟫ = (g(1) + g(2))/2 = E g(Y)`, while `E[g(Y) | X = x] = g(x)`: for `g = 𝟙_{1}` and `x = 1` the two sides are `1/2` and `1`.

What is missing is the hypothesis of `covariance_condExp_eq` itself, for every `g`: then `C_{XY} g = C_{XX} f_g` and `⟪g, U_{Y|x}⟫ = ⟪C_{XX} f_g, C_{XX}⁻¹ Φ x⟫ = f_g(x)`. The smallest change: "if moreover, for every `g`, some `f_g` in the Kolmogorov space of `k` represents `x ↦ E[g(Y) | X = x]` as above, then `⟪g, U_{Y|x}⟫ = f_g(x)` for every `g`". The module docstring's entry for 11.3 needs no change.

## R02 (P2) — The identity `E mmdU = MMD(P, Q)²` of 10.1 fails for `n ≤ 1`, by the roadmap's own Check

Section 10.1 (line 1055) states "`E mmdU = MMD(P, Q)²` under `P ⊗ Q`" with no condition on `n` or on the kernel, and the module docstring lists it as a target. The Checks of the same layer record that for `n = 1` there are no injective pairs and `mmdU = 0`; with `P = δ₀`, `Q = δ₁` and the Gaussian kernel with `σ = 1` the right-hand side is `2 − 2e^{−1/2} ≈ 0.787`. The second identity of the sentence, `n · mmdV = (n − 1) · mmdU + n⁻¹ ∑ᵢ h(zᵢ, zᵢ)`, does hold for every `n` (at `n = 1` it reads `h(z₀, z₀) = 0 + h(z₀, z₀)`).

The smallest change: "for `n ≥ 2` and integrable feature maps under `P` and `Q`, `E mmdU = MMD(P, Q)²` under `(P ⊗ Q)ⁿ`".

## C01 — The remark that Chung states both lower bounds of 3.2 as strict does not fit the author's revised chapter

Line 472 says "Chung states both lower bounds as strict inequalities for connected graphs", and then shows on `P₃` that the strict form of Theorem 2.3 is false. In the revised chapter 2 on the author's page, whose page numbers agree with the README's, Theorem 2.2 (p. 26) is `λ₁ > h²/2` and Theorem 2.3 (p. 27) is `λ_G ≥ 1 − √(1 − h²)`, not strict. If the 1997 printing has `>` in Theorem 2.3, say "the 1997 printing" in the remark, so that a reader with the revised text is not sent looking for a misprint that is no longer there. I could not read the 1997 printing.

## C02 — Genovese et al. (2012) is cited in 5.4 for a rate it does not state

The citation after `isBoundedInProbability_hausdorffDist` (lines 626–628) attaches Genovese–Perone-Pacifico–Verdinelli–Wasserman to the rate `(log n / n)^{1/d}` of the sample itself. That paper states minimax rates for estimating a manifold without boundary: the lower bound `C n^{−2/d}` (Theorem 2) and the upper bound `C (log n / n)^{2/d}` (Theorem 3), with exponent `2/d` and for an estimator other than the sample. The statement of 5.4 is supported by its own route through TopologicalDataAnalysis 8.4, which I checked. Keep the paper under "Manifold reach" in Beyond, where minimax rates are what it is cited for, and drop it from 5.4, or add "who obtain the faster rate `(log n / n)^{2/d}` for manifolds without boundary".

## C03 — For a single vertex the index set of `fiedlerValue` is empty only when the vertex carries a loop

The Conventions (line 129), the Check of Layer 2 (line 432) and the docstring of `fiedlerValue` say that for `card V = 1` the index set is empty. With `W = (0)`, the only loop-free graph on one vertex, the constraint `∑ dᵢ gᵢ = 0` holds for every `g`, the index set is all nonzero `g`, and the value is `0` because the quotient is `0/0`. With a loop of weight `w > 0` the set is empty. The value `0` is right in both cases; only the reason needs "or the quotient is `0/0`". The statement about `cheegerConstant` is correct as it stands.

## N01 — The formula defining `fiedlerValue` is Chung's (1.2), p. 4

Section 2.1 cites "(1.4), p. 5", which in the revised chapter is the equivalent form with `f − f̄` in the denominator and no constraint; the constrained infimum over `f ⊥ D𝟙` is (1.2) on p. 4.

## N02 — Three layer-level dependency lines disagree with the `*Needs:*` lines

"How to read the build" says the spectral strand runs `2 → 4`, while 4.1 needs only 1.4 and the Dependencies of Layer 4 say "Layer 1". The Dependencies of Layer 6 name "Layer 5 for the eigenvalue tools", which no `*Needs:*` line of 6.1 to 6.4 uses. The supplier contract for OptimalTransport says 12.1 is "cited in 6.4 and under Beyond", and neither place cites it.

## N03 — Two remarks are true but do not say what they are meant to

In the Examples of Layer 9, the total-variation bound of 9.1 with `C = 1` gives `MMD(μₙ, δ₀) ≤ 2/n`, not `√2 · 2/n`. In the Conventions, the statistic of Gretton et al. that keeps the terms `k(xᵢ, yᵢ)` differs from `mmdU` by `o_P(n⁻¹)` (both pieces of `n` times the difference tend to `2 E k(X, Y)`), which is what "the same null limit" needs; `O_P(n⁻¹)` alone would not give it.

## N04 — Two phrases describe how the text was produced

"Books and papers without a local copy" in the References, and the Check of `steinKernel` that reports Gauss–Hermite quadrature "to `10⁻¹⁶`". The first can read "cited by author, title and year"; the second restates the Stein identity of 11.1 at three points and can be dropped, or replaced by a value computed by hand.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.2 `laplacian_quadForm` | `P₃`, loop graph `[[1,1],[1,0]]`, zero degrees | `½∑W(fᵢ−fⱼ)²` needs `W = Wᵀ` for column sums; loop graph `𝓛` trace `3/2`, det `0` | true |
| 1.3–1.4 kernels, spectrum | `K₂`, `P₃`, `K₃`, `C₄`, `2K₂`, loop graph, empty `V` | `{0,2}`, `{0,1,2}`, `{0,3/2,3/2}`, `{0,1,1,2}`, `{0,0,2,2}`, `{0,3/2}`; Chung Lemma 1.7 (iv), (v) read | true; loop-free hypothesis needed |
| 2.1 `fiedlerValue_spec` | `K₃`, `P₃`, `K₂`, one vertex with and without loop | `3/2`, `1`, `2`; trace bound `(n−1)λ₁ ≤ n`; `Ncut` test function ratio `= Ncut`; `P₃` cuts `4/3, 2, 4/3, 2` | true; C03, N01 |
| 2.3 eigenmaps | `P₃`, `k = 0, 2, n` | `0 + 1 = 1`, eigenvector `(1,0,−1)`; index `Fin.rev` picks smallest | true |
| 2.3 locally linear embedding | `p = 0`, `p = n − 1`, `M𝟙 = 0` | `𝟙^⊥` invariant; minimum is eigenvalues of `M` with one `0` removed; indices `rev(1..p)` | true |
| 3.2 `cheeger_inequality` | `C₄`, `K₂`, `P₃`, `2K₂` | `(h, λ₁) = (1/2,1), (1,2), (1,1), (0,0)`; `1−√(1−h²) = 0.134, 1, 1, 0` | true; C01 |
| 4.1–4.2 `diffusionDistSq_eq` | `P₃`, `t = 0, 1`; non-reversible reading | `8` at `t=0`; `(−1/2,1,−1/2)²/π = 4`; `ψ₂=(1,−1,1)` norm `1`; `0⁰ = 1` consistent | true |
| 5.1 classical scaling | 2 points, collinear, simplex, star, `(1,1,3)`, `p = 0`, empty | `a²/2`; rank 1; `{0,½,½,½}`; star `{2,2,−1/4,0}`; `{9/2,−5/6,0}`; `Bᵢᵢ+Bⱼⱼ−2Bᵢⱼ = Δᵢⱼ²` | true |
| 5.2 best PSD rank `k` | `k = 0, n`, negative eigenvalues | `(λⱼ−γⱼ)² ≥ min(λⱼ,0)²` for `γⱼ ≥ 0`; attained by positive parts | true |
| 5.3 `sampleGraphEDist_bounds` | `δ = 0`, `d_M ≤ ε`, circle | excess `2δ(m−1) < 2δ d_M/(ε−2δ)`; `< 4δ/ε` iff `4δ < ε`; `η = 4.17·10⁻⁴`; antipodal needs `η ≥ π/2−1` | true |
| 5.4 Hausdorff rate | three radius ranges; `n = 0`; `K` vs support | `a = c(r₀/2R)ᵈ ≤ c`; `c(r₀/2)ᵈ ≥ a rᵈ` for `r ≤ R`; tail `n/log(n+1)·(n+1)⁻²→0` | true; C02 |
| 6.1–6.2 Procrustes | `m = 1`, mirror triangles | `A = [[½,−¼],[¼,−½]]`, `det = −3/16`, `σ = ¾, ¼`, cosine `½` vs `1`; `d_F = √3/2`, `d_P = 1` | true |
| 6.2 generalized Procrustes | `n = 1`, `Z₂ = −Z₁`, `β = 0` | `G = n − n‖μ̄‖²`; chain of equalities forces `β ∝ cos ρ`; `‖μ̄‖ ≥ n^{−1/2}` | true |
| 6.3 planar mean | `w = iz`, `z ⊥ w`, `n = 0`, `k = 0` | `0`, `1`; `∑d² = n − μ*Sμ`; `S = 0` gives every unit `μ` | true |
| 6.4 extrinsic mean and its limit | antipodal points; any `S` | `E‖X−q‖² = E‖X−m‖² + ‖m−q‖²`; delta method needs only measurability and differentiability | true |
| 7.1 integrability | `C = 0`, infinite `μ` excluded | `‖Φx‖ = √k(x,x) ≤ √C`; separable range from second countability | true |
| 7.2 `mmd_eq_iSup` | Diracs, constant kernel | `2 − 2e^{−1/2} = 0.7869`; `0`; Gretton et al. Lemma 4 and §2.3 read | true |
| 7.3 empirical embedding | atoms `0,1,3`; `C = 0` | `‖mP‖² = 0.580422`, MSE `0.209789`; McDiarmid `cᵢ = 2√C/n` gives `exp(−nt²/2C)` | true |
| 8.1 Fourier criterion | `d = 0`, `Λ = 0`, sinc | modulus unchanged under `q ↦ −q`; `d=0` always characteristic; sinc uniform on `[−1/2π, 1/2π]` | true with `d ≥ 1` |
| 8.2–8.3 mixtures, polynomial kernel | Laplace, IMQ, `δ₀` vs `δ_{e₁}` | density after `u = t/σ²` as stated; `∫t^{β−1}e^{−c²t}/Γ(β) = c^{−2β}`; `1−2+4 = 3 = 2+1` | true |
| 9.1–9.3 comparisons | Diracs, non-separable case, `L = 0` | feature difference integrable for every coupling via marginals; `β(δ₀,δ_d) = 2d/(2+d)`; `tvDist ∈ [0,2]` | true; N03 |
| 10.1 statistics | `n = 0, 1, 2` | `mmdU = −0.787`, `mmdV = 0`; `n=1`: `mmdU = 0`, `MMD² = 0.787` | identity false at `n=1`: R02 |
| 10.2 limit laws | Gretton Theorem 12 at `ρ = ½` | `2n·MMD² → ∑λ(4Z²−4)`; `E h(Z,Z) = 2E k̃(X,X)`; projection variance `Var_PΔ + Var_QΔ` | true without positivity of `k` |
| 10.3–10.4 energy, dCov, HSIC | `δ₀,δ₁`; two-atom law; `Y = X²` | `2 = 2·1`; `¼ = 4·1/16`; `36/81+32/81−60/81 = 8/81`; `tr(KHLH)/4 = (1−a)²/4` | true |
| 10.5 permutation tests | `N = 0, 2`, ties, Bernoulli | `p = 1`; `u/2`, `(1+u)/2`, `u`; `¼ + ½·½ = ½` | true |
| 11.1–11.2 Stein | `d = 0`, constant kernel, `N(a,1)` | `‖ξₓ‖ ≤ √C(1+‖b‖)`; `KSD² = a²(1+2/σ²)^{−1/2}`: `0.1692`, `0.6768` | true |
| 11.3 covariance identity, ridge form | constant kernel, two points, `Y = X` | `⟪g,U⟫ = ½` vs `E[g(Y)|X=1] = 1`; gradient `2K((K+nλ)α−v)/n` | identity and ridge form true; consequence: R01 |
| 11.4 random features | `D=1`; `ε = 0.3`; `diam M = 0` | range `4/D` gives `2e^{−Dε²/8}`; `0.9957` at `D=62`, `0.0499` at `328`; Sutherland–Schneider Prop. 2 read | true |

- Source locators checked against the text: 21 (Chung chapters 1–2, revised: eleven; Gretton et al. Lemma 4, Lemma 6, §2.3, Theorem 12; Sutherland–Schneider Proposition 2; Sriperumbudur et al. 2010 Theorem 9 and Corollary 10; Gorham–Mackey Proposition 9; Genovese et al. Theorems 2–3).
- Library declarations opened at the pin: `Matrix.PosSemidef` (`Mathlib/LinearAlgebra/Matrix/PosDef.lean` 62), `MeasureTheory.tvDist` (`…/TotalVariation/Defs.lean` 53–62, variation of `μ − ν` on the whole space), `TauCeti.wassersteinEDist` (`…/Wasserstein/Basic.lean` 189), `TauCeti.IsCoupling` (`…/Coupling.lean` 120), `TauCeti.Probability.empiricalFiniteMeasure` (line 58, zero measure for an empty family), `TauCeti.fourierAtom` (line 46), `TauCeti.bochner` (line 242), `Matrix.PosSemidef.continuous_kolmogorovFeature`, `inner_kolmogorovFeature_kernelMeanEmbedding` (line 165), `posSemidef_cexp_neg_mul_sq_norm` (line 150), the bounded-Lipschitz metrization (line 131).
- Cross-roadmap citations resolved: Foundations 2.4, 8.2, 8.4, 8.5 (both local copies agree with its `Suggested.lean`), Asymptotic 1.2, 6.2, 6.3, Nonparametric 5.8, OptimalTransport Layer 3, 12.1, 12.2, 12.8, 13.4, MSS-A05 to A09 on main; TopologicalDataAnalysis 5.3 and 8.4 and MarkovChainMixing 2.1 and 3.2 at their open heads.
- Dependency check: `depcheck: 200 roadmaps, 2190 edges, 0 problem(s)`; no change outside the folder. TopologicalDataAnalysis, the one supplier not on main, is an open pull request that adds a new roadmap.
- Elaboration: 49 `sorry` warnings, no error, no other warning; all 64 pinned supplier names resolve. The elaborated types were compared with the README statements; the 16 section binders absent from elaborated types are finiteness, decidability or measurability on definitions that do not use them.
- One-tactic probe on a copy: `laplacian_adjMatrix`, `posSemidef_gaussianKernel`, `posSemidef_kronecker`, `integrable_kolmogorovFeature_of_le`, `extrinsicMean_iff`, `posSemidef_distanceKernel` do not close.
- Previous findings: R01 repaired (`dudleyDist_le` carries `[SecondCountableTopology X]`, "on a separable space"); R02 repaired (5.4 now derives the tail from TopologicalDataAnalysis 8.4; the three radius ranges recomputed); R03 repaired (net on `M × M`, constants attributed to Sutherland–Schneider); R04 repaired (8.4 consumed, the difference stated); R05 repaired (weighted-matrix forms owned here, dictionary `W x y = π(x) P(x, y)`, `h = Φ⋆`, `λ₁ = γ` checked, no supply either way). C02 to C06 and N01 to N03 repaired; C01 partly (C01 above).
- Pull request text: title and description read against the head; the layer list, the supplier list, the count of 50 theorems with one proved and the ownership paragraph agree with it.

Overlap check: read StatisticalLearningTheory, MarkovChainMixing, MathematicalStatisticsHigherOrderAndResampling, TopologicalDataAnalysis, MathematicalStatisticsNonparametric, MathematicalStatisticsAsymptotic, MathematicalStatisticsFoundations; the Hausdorff sampling bound is owned by TopologicalDataAnalysis 8.4 and consumed here; Cheeger's inequality and the reversible spectral decomposition are owned by MarkovChainMixing for Markov kernels and here for weighted matrices, with the dictionary stated and no supply either way; nothing else shared.

Source independence: 12 passages compared with 7 sources, none shared; largest share Chung, 14 of 64 page locators; contents compared with Chung chapters 1–2 (revised): independent (cuts and eigenmaps have no counterpart there, random walks follow the Cheeger inequality here and precede it there). The sixteen books other than Chung could not be read.

Research link: The kernel layers state results of Gretton et al. 2012 (two-sample tests), Sriperumbudur et al. 2010 (characteristic kernels), Sejdinovic et al. 2013 (energy distance and distance covariance), Gorham–Mackey 2017 (Stein discrepancies) and Sutherland–Schneider 2015 (random features); the spectral layers those of Chung 1997. Rests on the README's citations and the papers read.

## Not verifiable

- Fiedler 2011, Grigor'yan 2018, Keller–Lenz–Wojciechowski 2021, Wang 2012: paywalled, no open copy found (sample targets 1.2, 2.1, 2.3, 3.2, 4.2, 5.1, 5.3 checked against Chung or recomputed only).
- Mardia–Kent–Bibby 1979, Dryden–Mardia 1998, Marron–Dryden 2022, Bhattacharya–Bhattacharya 2012: no open copy found (sample targets 5.1, 5.2, 6.4: mathematics recomputed, locators not read).
- Berlinet–Thomas-Agnan 2004, Saitoh–Sawano 2016, Schölkopf–Smola 2002, Wendland 2004: no open copy found (sample targets 7.1, 7.2, 7.3, 10.2: locators not read; 7.2 and 10.2 checked against Gretton et al. 2012).
- Belkin–Niyogi 2003, Bernstein–de Silva–Langford–Tenenbaum 2000, Coifman–Lafon 2006, Cuevas–Rodríguez-Casal 2004, Smola et al. 2007: no open copy found.
- Chung 1997 was read in the author's revised chapters 1 and 2; the 1997 printing was not read (C01).
- Ownership was checked against main and the open roadmap pull requests; packages on the board were not searched.

Automatic checks set aside as false positives: the section comment that heads the block of `#check` lines pinning supplier declarations was reported as a header with no declaration under it; the `#check` lines are what it heads.

## Source issues

- none

## For the human reviewers

- Scope: 5.4 consumes TopologicalDataAnalysis 8.4, a roadmap that is not on main (same author's open pull request #2525); the description says this pull request merges after it.
- Licence: the README (Prior formalization) and the description say most of the subject is formalized in the author's lean-CKSD (Apache 2.0) and that no code is copied; I did not open that repository to compare with `Suggested.lean`.
- Not tested: of the sixteen books cited, only Chung (chapters 1–2, in the author's revised version) could be read; wording and arrangement were compared with it and with six papers.
- Scope: 27 papers are cited by author, title and year only (README, References, last bullet); the statements resting on them carry the roadmap's own proof routes.
