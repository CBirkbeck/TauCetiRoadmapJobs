# Port of ProbabilisticAndMetricNumberTheoryPartII to the roadmap repository

- **Branch:** `roadmap/probabilistic-and-metric-number-theory-part-ii`, created from main at `3b51055`.
- **Head commit:** `08e41f3` — `ProbabilisticAndMetricNumberTheoryPartII: roadmap (README, Suggested.lean, metadata)`.
- **Files:** `TauCetiRoadmap/ProbabilisticAndMetricNumberTheoryPartII/{README.md,Suggested.lean,metadata.toml}`
  (1599, 336 and 1 lines); nothing outside the folder is touched.

## Build

`lake build TauCetiRoadmap.ProbabilisticAndMetricNumberTheoryPartII.Suggested` (run twice, before and
after the commit): exit 0, last line

```text
Build completed successfully (8954 jobs).
```

16 warnings, all `declaration uses `sorry`` (the 16 sorried theorems); no other warning, no error.
The Lean file is byte-identical to the package's `Suggested.lean`.

## Gate

```text
gate ProbabilisticAndMetricNumberTheoryPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency direction (`gate --depcheck … --movable`):

```text
depcheck: 234 roadmaps, 2226 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `roadmaps resolve` on the README (worker's run): no cross-roadmap
citation and no Lean name found nowhere.

## Draft pull request body

This roadmap continues ProbabilisticAndMetricNumberTheory past its Gauss-map chapter into the spectral
theory of countable-branch transfer operators and the uniform renewal counting it supports. The
objects are the accelerated branches `γ_{n−1}^A γ_j` of Gamburd–Magee–Ronan acting on the ordered
projective simplex `Δ_n` for every `n ≥ 3`, the family `L_s f = Σ_a q_a^{−s} f∘F_a` for `Re s > 1`,
and the renewal count `N(w, r)` of semigroup words by the growth of the last coordinate. It builds
C¹ jet spaces on compact convex bodies, the explicit uniform contraction of branch compositions and
the closed coding attractor, the two-norm inequality and holomorphy of `L_s`, and then the general
functional analysis the spectral argument needs and that nothing on main provides: the
Schauder–Tychonoff fixed point theorem for Hausdorff locally convex spaces, Birkhoff's cone
contraction for salient cones in arbitrary real vector spaces, the ball-cover measure of
noncompactness with Hennion's essential-radius bound, analytic perturbation of simple isolated
eigenvalues without an inner product, and a renewal Tauberian theorem uniform in a compact parameter.
From these it proves a Ruelle–Perron–Frobenius theorem with a C¹ spectral gap (uniform on compact
parameter intervals), Wielandt separation on vertical lines from the non-lattice property of the
delays, and the pressure `σ ↦ λ_σ`, whose unique crossing `λ_β = 1` gives the conformal exponent
`β(n) > 1` without any arithmetic counting. The end theorems are `conformal_exponent` (a unique
`β`-conformal probability on `Δ_n`) and `uniform_counting` (`N(w, r) ~ B(w) e^{βr}` uniformly in
`w`, with `B = h_β/(β|λ′_β|)` positive and C¹); for `n = 3` it identifies `β(3) = 2` through the
Gauss conjugacy and proves `N(w, r) ~ 3e^{2r}/(π² w₂)`, and it proves the p-series enclosure of
`β(n)` and `β(n) ≥ β(n − 1)`. The passage to integer points on Markoff–Hurwitz varieties is left
to a consumer; the varieties themselves are ClassicalArithmeticCompletion's.

Models used: Claude Fable 5.1 (port, checks and this report); the package was reviewed on the board
by Claude.

## Suppliers that are still pull requests

Both are earlier than this roadmap in the merge order (positions 188 and 260 against 261):

- **ProbabilisticAndMetricNumberTheory** (§§4.4, 4.8, 4.9; `gaussMap`, `gaussMeasure`,
  `gaussDensityTransfer`, the inverse branches, the density telescope and its duality), read at its
  open head: headings `### 4.4`, `### 4.8`, `### 4.9` and the three declarations are present.
- **ArithmeticDirichletSeriesPartII** (§§0.1, 1.1, 3.1, 3.2; `HasLaplace` with its measure parameter,
  `squaredSinc`, `squaredSinc_mass`, `squaredSinc_fourier`, `monotoneUnsmoothing`, `delangeLaplace`),
  read at its open head: headings `### 0.1`, `### 1.1`, `### 3.1`, `### 3.2` and all six declarations
  are present; `squaredSinc ell v = ell/π · sinc(ell v)²`, so the README's `squaredSinc 0 = 0` and
  `squaredSinc (−1) 0 = −1/π` are right.

Suppliers on main, each re-read at main: AlgebraicTopology Stage 2, item 7
(`brouwerFixedPoint_compactConvex_continuousOn`, README line 399, Suggested.lean line 2490);
BanachAlgebras A2 (Layer 2.1, Riesz idempotents of a finite spectral partition and the closed
invariant decomposition) and A8 (§8.2 `schauder_fixedPoint`); its README says "The symbols A1–A8
denote these same layers", so the A-labels are valid citations; OptimalTransport Layer 13B, item 9
(Hilbert metric and `tanh(Δ(K)/4)` for strictly positive finite kernels); OperatorTheory's
sub-roadmaps SelfAdjointSpectralTheory and SpectralSubspacePerturbation; MarkovChainsAndRenewal
Layers 4–6; ClassicalArithmeticCompletion §§4.38, 4.57, 4.78, 4.105 (headings at lines 8723, 9217,
9827, 10528 on main; the open PR 1409 revises that roadmap and is not cited).

Pinned declarations, each found at the pins (Mathlib `f6090c7`, Tau Ceti `358314d`): every Mathlib
name of the supplier table (`spectrum.gelfand_formula` is an alias of
`pow_nnnorm_pow_one_div_tendsto_nhds_spectralRadius`; `spectrum.isCompact` carries `[ProperSpace 𝕜]`,
satisfied by `ℂ`; `DifferentiableOn.analyticOnNhd` is in `Analysis/Complex/CauchyIntegral.lean`);
`TauCeti.hilbertProjectiveDist`, `Matrix.projectiveDiameter`, `Matrix.hilbertProjectiveDist_mulVec_le`;
the four `IsCompactOperator.*` Riesz theorems; `TauCeti.LSeries.wienerIkehara`; `TauCeti.C1HolderSpace`
(bounded C¹ maps on a whole normed space with bounded globally Hölder derivative, as the README says).

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already satisfies the acceptance-test rule: 9 definitions with
real bodies on native carriers (`orderedSimplex`, `branchDenom`, `branchMap`, `wordMap`, `wordDelay`,
`wordCount`, `C1BoundedOn`, `transferOp`, `IsEigenprobability`) and 16 sorried headline theorems; no
API lemma, boundary case, Check mirror, value-computing example, sorry'd data or `set_option`;
imports are the single `public import Mathlib` under a `module` header (the form of
`CoboundaryExpansion/Suggested.lean` on main). No headline statable at the pins is missing: the
README's §§2.4, 4.3 (spectral separation and continuation off the real axis), 6.2–6.3 and 7.3 need the
Banach space `C¹(Δ; ℂ)` as an operator space or the two attractors, and the module docstring says so.

## Supplier replacements and duplication removals

None needed. Duplication sweep by object with `roadmaps grep` over main and all 449 open heads:
Schauder–Tychonoff (no match anywhere); Hilbert projective metric / Birkhoff contraction (only
OptimalTransport 13B.9, the finite positive-kernel case, already cited as a supplier and
consistency check); essential spectral radius / measure of noncompactness / Hennion (only the base
roadmap's remark that it does not use the Hennion route); Ruelle–Perron–Frobenius / transfer operator
(only the base roadmap's `gaussDensityTransfer`, consumed in §7.1); conformal measure / conformal
exponent (no match); Wielandt (permutation-group and Hoffman–Wielandt hits only); simple isolated
eigenvalue perturbation (only a Kato reference in SelfAdjointSpectralTheory, which is self-adjoint and
is named in Scope); Lalley / renewal Tauberian (only StochasticCalculus citing Lalley's Brownian
motion notes); Markoff–Hurwitz (ClassicalArithmeticCompletion only, the cited supplier); Rauzy (only
Christol–Kamae–Mendès France–Rauzy references); Gauss map (base roadmap only). Ownership against the
open pull requests was checked through `roadmaps grep`, which indexes all 449 heads.

## README edits in the port

1. Supplier table, Mathlib analysis bullet: `Seminorm` and `Seminorm.ball` now carry their own file
   (`Mathlib/Analysis/Normed/Module/Seminorm/Basic.lean`, `def ball` at line 603); the package had
   attached them to the `LocallyConvex.lean` locator.
2. The package's top-level `## Notes on the sources` (the errata list) is kept word for word but now
   sits at the end of `## References` as `### Notes on the sources`, so the H2 skeleton is the
   upstream one (no roadmap on main or in any open pull request has that H2).

Nothing else changed: the review's two P3 notes (delete the errata sentence on the published (5.1)
range; cite Tau Ceti's Riesz theory) were already applied in the package, and I re-verified both:
published (5.1) prints `1 ≤ i ≤ n − 2` (GMR19 extraction line 2401) while arXiv v3 prints
`1 ≤ i ≤ n − 3` on its p.44 (line 2043, between the page markers at lines 2023 and 2077), which is
what the README's arXiv bullet now says; the four Riesz declarations are cited in "From Tau Ceti",
§3.5 and Layer 3 Dependencies. Style scans: no LaTeX delimiters, no process words, no pull-request
numbers, no machine paths, no "line N" locators.

## Elaborated signatures

The worker's `signatures.md` (25 declarations, `#check @name` on the file as it stands, which is the
committed file) was compared declaration by declaration with the README statements: `schauder_tychonoff`
carries Hausdorff, locally convex, topological-group and continuous-scalar instances (§3.1);
`birkhoff_contraction` carries both salience hypotheses, the order bound on pairs of images and
`0 ≤ Δ` (§3.3); `hennion_essential_radius` carries `[CompleteSpace B]`, the `p`-precompactness,
`p`-boundedness, `1 ≤ k`, `0 ≤ r` and the two-norm inequality (§3.5); `ruelle_perron_frobenius` and
`uniform_ruelle_perron_frobenius` have `M, θ` after resp. before `σ` (§§3.7, 4.3); `wielandt_separation`
has `t ≠ 0` and the eigenprobability (§5.3); `pressure_eigenvalue` has analyticity on `Ioi 1`, the
derivative bound and both limits (§5.4); `uniform_renewal_tauberian` has compactness, `0 < a`,
monotonicity, nonnegativity, the uniform bound, the transform identity on `Re s > a`, holomorphy
there and the boundary germs (§6.5); `conformal_exponent`, `uniform_counting`, `eigenprobability_three`,
`counting_three`, `conformal_exponent_pseries`, `conformal_exponent_mono` as in §§6.6, 6.7, 7.2, 7.4,
7.5. No section `variable` exists in the file, so no binder can have been dropped. Nothing changed.

## Adversarial pass (recomputed, not copied)

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| §0.1 `orderedSimplex` | `d = 0, 1`; `n = 4` vertices; chart `(1/2, 1/2)`; interior point | `d = 0`: the one point (all conditions vacuous); `d = 1`: `0 ≤ x₀ ≤ 1/2`; vertices `(0,0), (0,1/2), (1/3,1/3)`; `(1/2,1/2)`: `w₃ = 0 < w₂`, excluded; `w_i = 2i/(n(n−1))` sums to `1`, strictly increasing | holds |
| §0.2 `branchDenom`, `branchMap` | `n = 4`, `w = (1/6,1/3,1/2)`, `(0,1)`, `(1,2)`; opposite order; `n = 3`, `w = (0,1)`, `(1/2,1/2)`; `w_j = 3` | `q = 11/6`, `F = (2/11,3/11,6/11)`; `q = 7/3`, `F = (1/14,3/14,5/7)`; `γ₂γ₃`: `(1/16,3/8,9/16)`, last `8/3`; `q = A+2`; `q = (A+3)/2`, min `3/2`; `q = −1`, `Real.log 1 = 0` | holds; bounds `(A+3)/2 ≤ q ≤ A+2` attained |
| §0.3 delays, count, freeness | `[(0,1),(1,2)]` at `n = 4`; `r < 0`, `r = 0`; `n = 3`, `w₁ = 1/2`, `R = 2` and `R = 9/4`; `n = 4`, `(1/4,1/4,1/2)`; exact integer recursion at `R = 150` | `log(11/6)+log(27/11) = log(9/2)`, homogeneous last coordinate `9/2` (pointwise evaluation gives `77/18`); `0`, `1`; `N = 3` at both radii; `N = 3` with two letters sharing `(1/7,2/7,4/7)`; `N(0,150) = 6858`, `N(1/4,150) = 9124`, `N(1/2,150) = 13699` | holds; `y_i = 2z_{n−1} − z_n` recovers the deleted coordinate |
| §0.4–0.5 jets, `C1BoundedOn` | `1`, `2x+3` on `[0,1]`; `(0,1)` pair; `x₀` on `[0,1/2]`; `2x₀+3`; `f = g = x` | norms `1`, `7`; segment identity demands `0 = y−x`; pointwise max `3/2`; `6`; `‖fg‖ = 3 ≤ 4` | holds |
| §1.1 core/cusp | `n = 4`: `(0,0,1)`, `(0,1/2,1/2)`, `(0,1/3,2/3)`, `(1/5,1/5,3/5)`, `(1/3,1/3,1/3)`; images of `γ_i`, `γ_{n−1}` | cusp only; core only; both; both with `w₃ = (1+w₂)/2`; `b = 2/3 > 1/2`; `γ_{n−1}`: `1 − 2b′ = (1−b)/(1+b) ≥ w_{n−2}/(1+b)` (cusp); `γ_i`: `1 − 2b′ = w_i/(2−w_i) ≥ 0`, `w′_{n−2} = w_{n−1}/(2−w_i)` (core); bounds `w_{n−2} ≤ 1/2`, `1/3`; `w_{n−3} ≤ 1/4`, `1/5` | holds |
| §1.2 (5.1), (5.2), (5.5), (5.9) | `n = 4`: `dγ₂` at `(0,1/2)`; `dγ₃` at `(1/6,1/3)`; `d(γ₂∘γ₁)(0,0)`; `d(γ₂∘γ₃∘γ₂)(0,0)` | `[[2/3,0],[−2/3,−4/9]]`, norm `4/3 = 2/(2−w₂)`; column sums `(1+2b−2w₁)/(1+b)² = 20/27` and `(1+2w₁)/(1+b)²`; `[[0,1/3],[1/9,−1/9]]`, norm `4/9` = squared bound (`4/3` unsquared); `[[1/5,0],[−2/25,1/25]]`, norm `7/25` = squared bound (`7/5` unsquared) | holds |
| §1.3 block bounds | `A,B ≥ 1`; `B = 0`; `A = 0, B ≥ 1, j ≤ n−3`; `j = n−2`, `B = 1`, `B ≥ 2`; `m = 0` | `6/7` (cusp point, (5.2),(5.6),(5.7)); `4/5`; `(6/5)(4/5) = 24/25`; `32/49`, `(6/5)(4/5)`; identity, norm `1` forces `D ≥ 1` | holds |
| §1.4 attractor, periodic codes | `n = 3`, `u = [(0,1),(1,1)]`; constant code; `n = 4` | `F₁∘F₀(w) = 1/(4−w)`, fixed `2−√3 = 0.268`; `F₀∘F₁(w) = (2−w)/(5−3w)`, fixed `1−1/√3 = 0.423`; `(1/3,1/3,1/3) ∉ Δ₀ ⊇ K` | holds |
| §2.1–2.2 `transferOp`, C⁰ bounds | `n = 3`, `s = 2`, `w = (0,1)`, `(1/2,1/2)`, `h = 1/w₂`; `s ≤ 1` | `ζ(2)−1 = 0.6449`; `4(ζ(2)−5/4) = 1.5797`; `Σ 4/((A+2)(A+3)) = 2 = h`; printed factor `2` gives `0.7899 < 1.5797`; not summable, native `0` | holds; printed factor fails |
| §2.4 derivatives in `s` | `n = 3`, `w = (0,1)`, `s = 2` | `ζ′(2) = −0.93755`, `ζ″(2) = 1.98928` (200000 terms + Euler–Maclaurin tail) | holds |
| §2.5 adapters | `1_{[c,∞)}`; `e^{−|t|}`; `1_{[1,∞)}` Mellin | `e^{−sc}/s`; `1/(1+s) + 1/(1−s) = 2/(1−s²)`; `∫₁^∞ u^{−s−1} du = 1/s` for `Re s > 0` | holds; sign `−s` forced |
| §3.1 `schauder_tychonoff` | `∅`; `x ↦ x+1` on `[0,∞)`; rotation of the circle; `V = 0` | no fixed point; none; none; `{0}` fixed | all hypotheses needed |
| §3.3 cones, `birkhoff_contraction` | `K = [[2,1],[1,2]]`, `f = (1,1)`, `g = (1,2)`; `T = 0`; `C_{κa}` diameter | `Δ = log 4`, `tanh(log 4/4) = 1/3`; `d((3,3),(4,5)) = log(5/4) = 0.2231 ≤ 0.2310`; `T = 0`: hypotheses and conclusion hold with `a′ = b′ = 1`, `d(0,0)` undefined; `α = (1−κ)/(1+κ)·min(g/f)`, `β = (1+κ)/(1−κ)·max(g/f)`, `log(β/α) ≤ 2log((1+κ)/(1−κ)) + 2κa·diam` | holds |
| §3.5 `hennion_essential_radius` | compact `T` (`p = ‖·‖`, `k = 1`, `r = 0`); `T = id`; `(1/2)id`; the `χ` step | Riesz–Schauder case (four Tau Ceti theorems); `r_χ = 1`, no `r < 1` works; radius `1/2`; `χ(T^{ks+1}) ≤ R_s ε + 2‖T‖ r^{ks}`, `ε → 0` | holds |
| §3.6–3.7 cone convergence, RPF | `n = 3`, `σ = 2`; choice of `Q`, `a` | `λ₂ = 1`, `ν₂ = 2dw₁`, `h₂ = 1/(2 log 2 · w₂)`, `∫ h₂ dν₂ = 1`; `Cσ + Dρ^Q a ≤ κa ⟺ a ≥ Cσ/(κ − Dρ^Q)` | holds |
| §4.1–4.2 eigendata, perturbation | `diag(2,1)`; Jordan block; `diag(e^z,1/2)`; `[[0,1],[z,0]]` | `P = diag(1,0)`; dual eigenfunctionals are multiples of `e₂*`, kill `e₁`; `λ(z) = e^z`, `λ′(0) = 1 = φ₀(T′(0)e₁)`; `±√z`, hypothesis fails at `0` | holds |
| §5.1–5.2 non-lattice | delays `√2`, `√2+1`; `1/2`, `3/2`; `A = 0,1,2`; `n = 3`, `A = 0` matrix | with `r`: `t = 2π`, `r = −2π√2` works; without `r`: `k√2 ∈ ℤ` forces `k = 0`; `t = 4π`, `r = 0`; `t_A = 1.6180, 2.4142, 3.3028`, gaps `0.4002`, `0.3134`; chart point `1/(1+t₀) = 0.382`; `det(M − TI) = −T³+T²+T`, monic `T³−T²−T`, values `−2`, `2` at `T = 2` | holds |
| §5.3–5.4 Wielandt, pressure | constant delays; `n = 3` derivative | `L_{σ+it} = e^{−itc}L_σ`, radius `λ_σ` (non-lattice needed); `λ′₂ = (1/log 2)∫₀¹ log y/(1+y) dy = −0.822467/0.693147 = −1.18657 = −π²/(12 log 2)`; `−log(3/2) = −0.4055` | holds |
| §6.1–6.3 growth, transform, residue | `n = 3`, `w₁ = 1/2`, `r = log 2`; empty word; both decompositions on `h_s`; `n = 3` residue | `N e^{−2r} = 3/4 > 6/π² = 0.6079`; `∫₀^∞ e^{−sr}dr = 1/s`; corrected form gives `(1−λ)^{−1}h`, printed form `(1−λ)^{−1}h + h`; `B = h₂/(2·π²/(12 log 2)) = 3/(π² w₂)`, `B/h₂ = 6 log 2/π² = 0.4214` | holds |
| §6.4–6.5 `uniform_renewal_tauberian` | one-point `X`, `α = e^{at}`; `X = ∅`; `squaredSinc 0` | `F = 1/(s−a)`, `B = 1`, limit `1` = `delangeLaplace` with `k = 0`; vacuous; kernel `0`, mass `0`, excluded | holds |
| §6.6 `conformal_exponent`, Jacobian | `s ≤ 1`; `s > 1`, `c = 1`; `n = 3`; `n = 4` at `(1/6,1/3)`; `d = 0` | native sum `0 ≠ 1`; `λ_s = 1 ⟹ s = β`; `|dF_A/dw₁| = q^{−2}`; `det dγ₁ = 1/(2−w₁)³ = 216/1331 = (11/6)^{−3}`; `d = 0`: `transferOp = 0`, so no eigenprobability with `c = 1` | holds; GMR19 Theorem 10 sums over `TΓ`, the accelerated generators (extraction lines 366–378) |
| §6.7, §7.2 counting | `n = 3`, `w₁ = 0, 1/4, 1/2`, `R = 150` | predictions `6839.2`, `9118.9`, `13678.4`; ratios `1.0028`, `1.0006`, `1.0015`; `h₂` instead of `B` would give `0.7213`, `1.4427` | consistent |
| §7.1 Gauss conjugacy | `x = 0`; `x = 1`, `A = 0`, `s = 2`; `M₂1` | weights `(A+2)^{−s}` vs `(A+1)^{−s}`; `q₀(1) = 3/2`, `F₀(1) = 1/2`, `(3/2)^{−2}(3/2)²/4 = 1/4 = 2^{−2}`, inverse direction `64/81`; values `1, 4`, derivative `2, 4`, C¹ norm `8`; branch identity `q^{−s}(1+F)^s(1+x)^{−s} = (x+A+1)^{−s}` | holds |
| §7.2 `eigenprobability_three` | branch substitution; `f = w₁²` | `v = t/(1+(A+1)t)`, `dv/dt = q^{−2}`, images `[1/(A+3), 1/(A+2)]` tile `(0,1/2]`; `∫ f dν₂ = 1/12` | holds |
| §7.3 Rauzy matrices | row moves | `γ₁ ↦ [[1,1,1],[0,1,0],[0,0,1]]`, `γ₂ ↦ [[1,0,0],[1,1,1],[0,0,1]]`, `γ₃ = A₃` | holds |
| §7.4 `conformal_exponent_pseries` | `β = 1.728, 1.7286, 1.882, 2.42, 2.425, 2.18, 3.3` | `ζ(1.728)−1 = 1.0012 > 1`, `ζ(1.7286)−1 = 1.0001`; `2^{2.425}(ζ−1−2^{−β}) = 0.99916 < 1`, at `2.42`: `1.0039`; `2(ζ(2.18)−1) = 1.0069 > 1`; `2·2^{3.3}(…) = 0.9931 < 1`; printed factor: `2(ζ(1.882)−1−2^{−1.882}) = 0.99994` | `1.728 < β(3) < 2.425`, `2.18 < β(4) < 3.3`; printed factor would exclude `2` |
| §7.5 `conformal_exponent_mono` | `(1/3,2/3) ↦ (0,1/3,2/3)`; `j ↦ j` | `q_{(A,1)} = 1 + 2(A+1)/3 = q_{(A,2)}(ιw)`; wrong shift reads the zero coordinate, `q = A+2` | holds |

No statement changed as a result of the pass.

## Unresolved

Nothing is unresolved. Two remarks for the maintainer:

- The errata list is kept in full under References; if upstream prefers it elsewhere, it is a block
  move.
- The gate run on the uncommitted folder reported only `dirty=1`; after the commit every counter is
  `0` and the gate prints `OK`.

No fetched or package text asked for any action outside this brief; nothing suspicious to report.


Pull request: #1838 (roadmap/probabilistic-and-metric-number-theory-part-ii at 08e41f3)
