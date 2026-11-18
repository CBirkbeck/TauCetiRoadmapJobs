# Review of KernelsAndSpectralMethods (pull request #2516 at f4ea473)

**Verdict:** needs changes

**Summary.** Changes are needed, all of them local: every stated theorem I recomputed is true on its test cases, but one Lean statement lacks a separability hypothesis (9.2), two proof routes assert something false (the covering step of 5.4 and the net of 11.4), and two results have no single owner against open roadmaps (5.4 against TopologicalDataAnalysis 8.4, and 3.2 with 4.1 against MarkovChainMixing). There are five findings, six small corrections and three format notes. The human reviewers have two points to decide (the relation to the author's lean-CKSD formalization, and the 27 papers cited without locators).

## R01 (P2) — The third conjunct of `dudleyDist_le` (`W₁ ≤ D · tvDist / 2`) is stated on an arbitrary pseudo-metric space and cannot be proved there

An implementer cannot close this conjunct as written. At the pin, `TauCeti.wassersteinEDist p μ ν` is the infimum over couplings of `eLpNorm (fun z ↦ edist z.1 z.2) p π` (`TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Basic.lean`, line 189), and Mathlib's `eLpNorm` is `∞` when its argument is not a.e. strongly measurable (`Mathlib/MeasureTheory/Function/LpSeminorm/Defs.lean`, lines 92–97). An upper bound on `W₁` therefore needs a coupling for which the distance is a.e. measurable on the product σ-algebra, and without separability nothing supplies one, even for `μ = ν`: on a discrete space of two-valued measurable cardinality with `μ = ν` the ultrafilter measure, `tvDist = 0`, the only coupling is `μ ⊗ μ`, every product-measurable function is a.e. constant, and `W₁(μ, μ) = ∞`. The section's variables give only `[PseudoMetricSpace X] [BorelSpace X]`; the README (9.2, line 955) says "on a space of diameter at most `D`".

The two lower bounds `β ≤ W₁` and the bounds of `mmd_le` are unaffected (an infinite right-hand side helps them). The smallest change: add `[SecondCountableTopology X]` to `dudleyDist_le`, as `tendsto_mmd_iff` already has, and "separable" to the sentence of 9.2.

## R02 (P2) — The covering step in the proof route of 5.4 is false: the balls of radius `t/2` about a maximal `t`-separated subset need not cover `K`

The route (lines 609–613) says to "cover `K` by `N(t) ≤ (2/t)ᵈ/c`-many balls of radius `t/2` centred in `K` (a maximal `t`-separated subset of `K` …)", and concludes `d_H ≤ t`. For `K = [0, 1.9]` and `t = 1` the set `{0, 1.9}` is maximal `1`-separated, and the balls of radius `1/2` about it miss `[0.5, 1.4]`. Maximality gives a cover by balls of radius `t`, so the route as written yields `d_H ≤ 3t/2` at best, with the stated count.

The theorem is not affected (only constants move). A correct version: take a maximal `t/2`-separated subset; its balls of radius `t/4` are disjoint, so it has at most `(4/t)ᵈ/c` points, and its balls of radius `t/2` cover `K`; then `P(d_H > t) ≤ (4/t)ᵈ/c · (1 − c(t/2)ᵈ)ⁿ`, and the choice `c(C/2)ᵈ = 2` still sends it to `0`.

## R03 (P2) — The proof route of the uniform bound in 11.4 puts the net on `M − M`, but `rffKernel s x y` is not a function of `x − y`

An implementer following the route (lines 1242–1246: "an `r`-net of `M − M` …, and Markov's inequality for the Lipschitz constant of `rffKernel − k` in `x − y`") is stuck at the first step. With phases, `2 cos(a + b) cos(a' + b) = cos(a − a') + cos(a + a' + 2b)`: for `D = 1`, `d = 1`, `ω = 1`, `b = 0` the value is `2` at `x = y = 0` and `0` at `x = y = π/2`. The README's own Check (line 1272) records the `x + y` term.

The constants `98` and `32(d + 1)` are those of Sutherland–Schneider, *On the error of random Fourier features* (2015), Proposition 2, which treats exactly these phase features under `ε ≤ σ_p ℓ` and places the net on `M × M ⊂ ℝ²ᵈ` (that is where `d + 1` comes from; the phase-free features have a net on `M − M` and `d + 2`). The smallest change: replace the net and the Lipschitz sentence by the `M × M` version, and cite that proposition for the constants in place of "those proved in lean-CKSD".

## R04 (P2) — Hausdorff estimation of a support (5.4) is also owned by TopologicalDataAnalysis 8.4, an open roadmap

Two open roadmaps each build the same result. TopologicalDataAnalysis (pull request #2525), section 8.4, defines `(a, b)`-standard laws (`μ(closedBall x r) ≥ min(1, a rᵇ)`), states the tail bound `P(d_H > ε) ≤ max(1, 4ᵇ/(a εᵇ)) · exp(−n min(1, a εᵇ/2ᵇ))` as `measure_hausdorffDist_gt_le`, and the rate `E d_H ≤ C (log n / n)^{1/b}`. This roadmap's `isBoundedInProbability_hausdorffDist` is the `O_P` form of that rate under the same small-ball condition required only for `r < r₀`. The scope section here says topological data analysis is "listed under Beyond" (line 82) and names no owner.

One owner is needed. The smallest change here: cite TopologicalDataAnalysis 8.4 for the sampling bound and keep in 5.4 only the statement that differs (the local condition `r < r₀` and the `O_P` conclusion), saying in one clause how it differs; or agree the reverse with that roadmap and say so in both.

## R05 (P2) — The Cheeger inequality (3.2) and the spectral expansion (4.1) are handed back and forth with MarkovChainMixing: "whichever is implemented first supplies the other"

That sentence (Downstream consumers, lines 1289–1292) leaves both results without a direction of supply. MarkovChainMixing (pull request #2502) states the spectral decomposition of a reversible kernel with `π > 0` (its 2.1, `exists_orthonormal_eigenbasis`) and `Φ⋆²/2 ≤ γ ≤ 2Φ⋆` (its 3.2, `cheeger`), and leaves "the spectral theory of graph Laplacians" to other roadmaps. Under `W x y = π(x) P(x, y)` the two are the same statements: `h = Φ⋆`, `λ₁ = γ`, and the first half of `diffusionDistSq_eq` is its 2.1 for the walk of `W`. Only the bound `1 − √(1 − h²) ≤ λ₁` is new here.

Fix the direction in the text. Either this roadmap owns the weighted-matrix forms and proves them from Layers 1–2 alone (as its `*Needs:*` lines already say), and the paragraph states the dictionary above with no supply either way; or 3.2 and 4.1 cite MarkovChainMixing 2.1 and 3.2 and keep only the third bound. The scope bullet at line 76 would then name the roadmap and its sections instead of "a roadmap … in an open pull request".

## C01 — The remark on strict inequalities in 3.2 fits Chung's Theorem 2.2 but not Theorem 2.3

Line 456 says "Chung states the lower bounds as strict inequalities for connected graphs", and the Examples add that the strict forms fail only for a disconnected graph. In the author's revised chapter 2 (her web page; pages as printed), Theorem 2.2 (p. 26) is `λ₁ > h²/2` and Theorem 2.3 (p. 27) is `λ_G ≥ 1 − √(1 − h²)`, not strict. The README's own example `P₃` is connected with `h = 1` and `λ₁ = 1 = 1 − √(1 − h²)`, so a strict Theorem 2.3 would be false. Restrict the remark to Theorem 2.2. I could not read the 1997 printing to see whether it prints Theorem 2.3 with `>`.

## C02 — 11.2 cites Gorham–Mackey for a statement with weaker hypotheses than theirs

Gorham–Mackey 2017, Proposition 9, assumes `k ∈ C_b^{(2,2)}`, a Lipschitz score and `E_P ‖∇ log p‖² < ∞`. Section 11.2 assumes a `C²` kernel with bounded first and mixed second derivatives and a finite first moment of `P`. The README's own route does prove that (I checked the growth bound and the uniform integrability of the product), so only the citation needs a clause: "Gorham–Mackey 2017, Proposition 9, under stronger hypotheses; the route below gives the statement as written".

## C03 — The proof route of 5.2 re-derives the Hoffman–Wielandt inequality, which Tau Ceti has at the pin

The route says the inequality "follows from Ky Fan's principle". It is `Matrix.IsHermitian.sum_sq_eigenvalues₀_sub_le_frobenius_norm_sub_sq` (`TauCeti/Analysis/Matrix/HoffmanWielandt.lean`, line 93), with the same decreasing `eigenvalues₀`. Cite it in the route, in the `*Needs:*` line of 5.2 and under "From Tau Ceti".

## C04 — Two pieces of `Suggested.lean` ask an implementer for nothing

`isHermitian_normalizedLaplacian` closes with one `simp` (unfolding the two definitions with `hW.eq` and `Matrix.mul_assoc`; tried on a copy). It is needed to name the eigenvalues in `isLeast_laplacianEigenmap`; mark it as an auxiliary fact or prove it in place of the `sorry`. The third conjunct of `mmd_eq_iSup` (the witness as a difference of kernel sections) is `Matrix.PosSemidef.inner_kolmogorovFeature_kernelMeanEmbedding` (`TauCeti/Analysis/PositiveDefinite/Kernel/MeanEmbedding.lean`, line 165) applied twice; say so in 7.2, as is done for the double-integral form.

## C05 — The prose-only targets are called "headlines of the same standing", and several of them are statable

"How to read the build" (line 249) and the module docstring say the headlines without a Lean name are of the same standing as those stated. Locally linear embedding (2.3), generalized Procrustes analysis (6.2), the HSIC limit law (10.4) and the exact level of the randomized permutation test (10.5) are all statable on the carriers already in the file. Either state them or call them targets, not headlines. In the locally linear embedding target, add `p ≤ n − 1`: for larger `p` there is no admissible `Y` and no `(p + 1)`-st eigenvalue.

## C06 — `extrinsicMean_iff` does not use that `S` is closed

With `p ∈ S` given, `E‖X − q‖² = E‖X − m‖² + ‖m − q‖²` makes both directions hold for every set `S`: `p` minimizes `‖m − q‖` over `S` exactly when `dist m p = infDist m S`. Closedness is what gives existence of an extrinsic mean, which 6.4 does not state. Drop `hS`, or add the existence statement that uses it.

## N01 — Process words and pull-request references in the README

"a roadmap on Markov chain mixing in an open pull request" (line 77), "the open pull request leanprover-community/mathlib4#43953" (line 1338), and the proved/admitted status list of lean-CKSD under "Prior formalization" will be out of date within months. Name roadmaps by name and section, and drop the status list or keep it in the pull request's description.

## N02 — Several Examples report simulations that a reader cannot check

"a numerical test with 2000 random points" (5.3), "to four digits" (6), "20000 runs" (10.5), "to machine precision" and "to fifteen digits" (8, 10), "20000 draws" (11.4). An exact small case would serve better, as the Checks already do (for instance `dCov² = 8/81`, which I recomputed).

## N03 — `cmeWeights` is declared in `Suggested.lean` and no statement uses it

The regularized conditional mean embedding of 11.3 has no stated theorem, so the definition makes nothing statable. Move it to the README as a proposed name, or state the representer-theorem property it is meant to have.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 weighted graph, degree, Laplacians | `P₃`, `K₃`, loop graph `[[1,1],[1,0]]` | degrees `(1,2,1)`, `(2,1)`; `L` of loop graph `[[1,−1],[−1,1]]`; Chung §1.4 p. 12 defines weights with loops | agrees |
| 1.4 spectrum of `𝓛` in `[0,2]`, `2` iff bipartite component | `K₂`, `P₃`, `K₃`, `C₄`, loop graph, empty `V` | `{0,2}`, `{0,1,2}`, `{0,3/2,3/2}`, `{0,1,1,2}`, `{0,3/2}` (trace `3/2`, det `0`); Chung Lemma 1.7(v) pp. 6–7 | agrees; loop-free and positive-degree hypotheses needed |
| 2.2 `λ₁ ≤ Ncut(S)` | `P₃` all `S`; `K₃` `{0}` | `Ncut = 4/3, 2, 4/3, 2`, `λ₁ = 1`; `K₃`: `3/2 = λ₁`; test function ratio `= Ncut` | agrees; von Luxburg §5.3, Chung Lemma 2.1 p. 25 |
| 3.1 conductance, `0 ≤ h ≤ 1` | `P₃`, `C₄`, `K₃`, `2K₂` | `1`; `1/2`; `1`; `0`; wrong variant `vol S` gives `1/3` on `P₃` | agrees; Chung (2.1)–(2.2) p. 24 |
| 3.2 Cheeger | `C₄`, `K₂`, `P₃`, `2K₂` | `(h, λ₁) = (1/2,1), (1,2), (1,1), (0,0)`; `1−√(1−h²) = 0.134, 1, 1, 0` | true; C01, R05 |
| 4.1–4.2 diffusion identity | `P₃`, `t = 0, 1` | `π = (1/4,1/2,1/4)`; `D²(0,2) = 8` at `t=0`, `0` at `t=1`; `D²(0,1) = 4` both sides | agrees; R05 |
| 5.1 classical scaling | 2 points, collinear `0,1,2`, simplex, star metric, `(1,1,3)` | `B` eigenvalues `a²/2`; `{2,0,0}`; `1/2`; star `{2,2,−1/4,0}`; `{9/2,−5/6,0}` | agrees; `p = 0` and empty index set consistent |
| 5.2 best PSD rank-`k` approximation | diagonal `B`, `k = 0, n` | error `∑_{j<k} min(λⱼ,0)² + ∑_{j≥k} λⱼ²` both ways | true; C03 |
| 5.3 graph geodesics | `δ = 0`; `m ≥ 2` pieces; circle | excess `2δ(m−1) ≤ 2δ d_M/(ε−2δ) < 4δ d_M/ε`; `η = 4.17·10⁻⁴` at `ε = 0.1` | true |
| 5.4 Hausdorff rate | `K = [0,1.9]`, `t = 1`; `n = 0` | balls of radius `1/2` about `{0,1.9}` miss `[0.5,1.4]`; tail with `(4/t)ᵈ/c` still `→ 0` | statement true; R02, R04 |
| 6.1 Procrustes cosine | `m = 0, 1`; mirror triangles | `m=1`: `a`; triangles: singular values `3/4, 1/4`, `det < 0`, cosine `1/2`, over `O(2)`: `1` | agrees |
| 6.2 Procrustes distances, GPA | mirror triangles; `m = 1`, `Z₂ = −Z₁` | `d_F = √3/2`, `d_P = 1`; `m=1`: `d_F = 1` vs formula `0`; `G = n − n‖μ̄‖²` | agrees; `m ≥ 2` needed |
| 6.3 planar mean | `w = iz`, `z ⊥ w`, `w = 2z`, `n = 0` | `0`, `1`, `0`; `∑ d_F² = n − μ*Sμ` | true |
| 6.4 extrinsic mean | antipodal points on sphere; non-closed `S` | `m = 0`, every point nearest; equivalence holds for any `S` with `p ∈ S` | true; C06 |
| 7.2 MMD, witness | Dirac pair, constant kernel | `2 − 2e^{−1/2} = 0.7869`; `0` | agrees; C04 |
| 7.3 empirical embedding | atoms `0,1,3`, weights `.5,.3,.2`, `n = 2` | `‖m P‖² = 0.580422`, MSE `0.209789`; McDiarmid `exp(−nt²/(2C))` with `cᵢ = 2√C/n` | agrees |
| 8.1 Fourier criterion | `d = 0`, `ψ = 0`, sinc | `d=0`: always characteristic, `Λ = 0` not open-positive; sinc: `Λ` uniform on `[−1/2π, 1/2π]` | true with `d ≥ 1`; Sriperumbudur et al. 2010 Thm 9, Cor 10 |
| 8.2 scale mixtures | Laplace, IMQ densities | substitution `u = t/σ²` gives stated density; `∫ t^{β−1} e^{−(c²+r²)t} dt/Γ(β)` | agrees |
| 8.3 polynomial kernel | expansion, Rademacher vs `N(0,1)` | `(1+⟪x,y⟫)² = 1 + 2⟪x,y⟫ + ⟪xxᵀ,yyᵀ⟫`; `‖Φx‖ = 1 + ‖x‖²` | true |
| 9.1 `mmd_le` | Diracs with identity kernel | `MMD = √2 ≤ √1 · 2` with Mathlib's `tvDist ∈ [0,2]`; half normalization would fail | true |
| 9.2 Dudley distance | `δ₀, δ_d`; non-separable space | `β = 2d/(2+d)`, `2/3` at `d=1`; `W₁(μ,μ) = ∞` possible without separability | R01 |
| 9.3 metrization | tight subsequence argument | limit `ν` has `MMD(ν,μ) = 0`; Sriperumbudur 2016 Thm 3.2 is the locally compact version | true |
| 10.1 MMD statistics | `n = 1, 2`; `n = 0` | `n·V = (n−1)·U + n⁻¹∑h(zᵢ,zᵢ)`; `U = −0.787`, `V = 0` in the example | agrees |
| 10.2 null and alternative limits | eigenvalues of `h` | `2λⱼ` with `(φⱼ(x)−φⱼ(y))/√2`; `E h(Z,Z) = 2E k̃(X,X)`; Gretton Thm 12 at `ρ = 1/2` gives `∑ 2λ(Z²−1)` | agrees |
| 10.3 energy distance | `δ₀, δ₁`; `δ₀` vs `½δ₋₁+½δ₁` | `2 = 2·1`; `2 − 0 − 1 = 1` | agrees; Sejdinovic et al. Thm 22 |
| 10.4 dCov and HSIC | two-atom law; `X` uniform on `{−1,0,1}`, `Y = X²` | `1/4 = 4·1/16`; Gaussian HSIC `(1−e^{−1/2})²/4 = 0.0387`; `36/81+32/81−60/81 = 8/81` | agrees; Sejdinovic et al. Thm 24 |
| 10.5 permutation level | `N = 0, 2` | `N=0`: `p = 1`; `N=2`: `p = 1/2` | true |
| 11.1 Stein kernel | constant kernel; `N(a,1)` vs `N(0,1)` | `KSD² = a²(1+2/σ²)^{−1/2}`: `0.1692`, `0.6768` at `σ = 1.3` | agrees |
| 11.2 `W₁ → 0 ⇒ KSD → 0` | growth, uniform integrability | `|k_P| ≤ C'(1+‖x‖)(1+‖y‖)`; products of independent UI families are UI | true; C02 |
| 11.3 covariance identity | tower property | `E[g(Y)ΦX] = E[f(X)ΦX]` | true |
| 11.4 random features | `D=1, ω=1, b=0`; Hoeffding | `2cos x cos y`: `2` vs `0` at equal `x−y`; range `4/D` gives `2e^{−Dε²/8}` | statement matches Sutherland–Schneider Prop 2; R03 |

- Source locators checked against the text: 14 (Chung ch. 1–2: nine; von Luxburg §5.3; Gorham–Mackey Prop 9; Sriperumbudur et al. 2010 Thm 9; Sejdinovic et al. Thms 22, 24; Gretton et al. Thm 12).
- Library declarations opened at the pin: `MeasureTheory.tvDist` (`TotalVariation/Defs.lean` 52–62), `eLpNorm` (`LpSeminorm/Defs.lean` 92), `Matrix.PosSemidef` (`PosDef.lean` 62), `Matrix.PosSemidef.kronecker` (`Analysis/Matrix/Order.lean` 188, finite types), `TauCeti.wassersteinEDist`, `TauCeti.fourierAtom`, `TauCeti.Probability.empiricalFiniteMeasure`, `TauCeti.covMatrix`, the mean-embedding lemmas, the bounded-Lipschitz metrization, Hoffman–Wielandt.
- Cross-roadmap citations resolved on main: Foundations 2.4, 8.2, 8.4, 8.5 (both local copies agree with its `Suggested.lean`); Asymptotic 1.2, 6.2, 6.3; Nonparametric 5.8; OptimalTransport Layer 3, 12.1, 12.2, 12.8, 13.4; MSS-A05 to A09.
- Dependency check: `depcheck: 200 roadmaps, 2183 edges, 0 problem(s)`; no change outside the folder.
- Elaboration: the file elaborates with 45 `sorry` warnings, no error and no other warning; every `#check @name` type was compared with its README statement, and the section binders absent from elaborated types (finiteness or measurability on definitions that do not use them) change no statement.
- One-tactic probe on a copy: `isHermitian_normalizedLaplacian` closes; `laplacian_adjMatrix`, `posSemidef_kronecker`, `posSemidef_gaussianKernel`, `extrinsicMean_iff` do not.

Overlap check: read StatisticalLearningTheory, MarkovChainMixing, TopologicalDataAnalysis, MathematicalStatisticsHigherOrderAndResampling, MathematicalStatisticsNonparametric, MathematicalStatisticsAsymptotic, MathematicalStatisticsFoundations; the Cheeger inequality and reversible spectral expansion are shared with MarkovChainMixing (owner unsettled, R05), the Hausdorff sampling rate with TopologicalDataAnalysis (owner unsettled, R04).

Source independence: 14 passages compared with 8 sources, none shared; largest share Chung, 15 of about 60 citations in the layers; contents compared with Chung chapters 1–2: independent (random walks follow Cheeger here, eigenmaps and cuts have no counterpart there).

Research link: The kernel layers state the results of Gretton et al. 2012 (two-sample tests), Sriperumbudur et al. 2010 (characteristic kernels), Sejdinovic et al. 2013 (energy and distance covariance) and Gorham–Mackey 2017 (Stein discrepancies); the spectral layers those of Chung 1997. Rests on the README's citations and the texts read.

## Not verifiable

- Grigor'yan 2018, Fiedler 2011, Keller–Lenz–Wojciechowski 2021, Wang 2012: no legal copy found (sample targets 1.1, 1.4, 3.1, 5.1 checked against Chung only).
- Mardia–Kent–Bibby 1979, Dryden–Mardia 1998, Marron–Dryden 2022, Bhattacharya–Bhattacharya 2012: no legal copy found (sample targets 5.1, 6.2, 6.4: mathematics recomputed, locators not read).
- Berlinet–Thomas-Agnan 2004, Wendland 2004, Schölkopf–Smola 2002, Saitoh–Sawano 2016: no legal copy found (sample targets 7.2, 8.1, 8.3, 9.3: locators not read).
- Peters–Janzing–Schölkopf 2017: the open-access host refused the download (sample target 10.4 checked against Sejdinovic et al. and Székely–Rizzo–Bakirov).
- Chung 1997 was read in the author's revised chapters 1 and 2, whose page numbers agree with the README's; the 1997 printing was not read.
- Ownership was checked against main and the open roadmap pull requests; packages on the board were not searched.

Automatic checks set aside as false positives: the section comment that heads the block of `#check` lines pinning supplier declarations was reported as a header with no declaration under it; the `#check` lines are what it heads.

## Source issues

- none

## For the human reviewers

- Licence: the README and the description say most of the subject is formalized in the author's lean-CKSD (Apache 2.0) and that no code is copied; I did not open that repository to compare declarations with `Suggested.lean`.
- Scope: 27 research papers are cited by author, title and year only, "without a local copy" (README, References, last bullet); statements resting on them carry the roadmap's own proof routes instead of locators.
- Not tested: of the sixteen books cited, only Chung (chapters 1–2) could be read; wording and arrangement were compared with it and with eight papers.
