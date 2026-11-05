<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2200#issuecomment-6643469414 -->
Red team round 2 pass b (claude) of 1824ee6

Verdict: needs_changes

1. **F01** (P3) The supplier's sections are cited under a label that does not exist there

   - **Location.** `packages/ProbabilisticAndMetricNumberTheoryPartII/README.md:60,120,183,187,189,192,704,715,1172,1208,1227,1244,1255,1313`
     (24 occurrences of `HP.0.1`, `HP.1.1`, `HP.3.1`, `HP.3.2`, and `HP.3` at lines 62–63), e.g. line 183
     "### From TauCetiRoadmap.ArithmeticDirichletSeriesPartII HP.0.1, HP.1.1, HP.3.1 and HP.3.2".
   - **Claim.** ArithmeticDirichletSeriesPartII has sections `HP.0.1`, `HP.1.1`, `HP.3.1`, `HP.3.2`.
   - **Witness.** At its open head (`93f5273`, the checkout the brief names), the supplier's headings are
     `### 0.1 The one-sided Laplace transform` (its README line 269), `### 1.1 The normalised squared-sinc
     kernel` (429), `### 3.1 Removing the smoothing by monotonicity` (742), `### 3.2 Delange's theorem`
     (791); the string `HP` occurs nowhere in its README or `Suggested.lean` (0 hits in each). The
     declarations `HasLaplace` (its `Suggested.lean` 49), `squaredSinc` (77), `squaredSinc_mass` (81),
     `squaredSinc_fourier` (86), `monotoneUnsmoothing` (143), `delangeLaplace` (159) do exist, so only
     the section labels drift.
   - **Repair.** Replace every `HP.0.1` by `§0.1`, `HP.1.1` by `§1.1`, `HP.3.1` by `§3.1`, `HP.3.2` by
     `§3.2`, and at lines 62–63 `HP.3` by `Layer 3`; the heading at line 183 becomes "### From
     TauCetiRoadmap.ArithmeticDirichletSeriesPartII §§0.1, 1.1, 3.1 and 3.2". On the instance that
     refuted the original (line 183), the four relabelled sections resolve to the supplier's headings at
     its lines 269, 429, 742, 791.

2. **F02** (P3) The finite Hilbert metric and Birkhoff contraction exist at the Tau Ceti pin and are not cited

   - **Location.** `packages/ProbabilisticAndMetricNumberTheoryPartII/README.md:72–75` ("Hilbert's
     projective metric and Birkhoff's `tanh(Δ/4)` contraction for strictly positive finite kernels are
     OptimalTransport Layer 13B, item 9"); line 171 ("No declaration of the pinned Tau Ceti is
     consumed"); lines 204–208; §3.3 lines 792–793 and the matrix Check at lines 817–820.
   - **Claim.** The finite-kernel Hilbert metric and Birkhoff contraction are a roadmap target
     (OptimalTransport), and nothing of the pinned Tau Ceti is consumed.
   - **Witness.** Tau Ceti at the pin `358314d` has `TauCeti/Data/Matrix/BirkhoffContraction.lean`
     (added 2026-10-07, absent at the round-1 pin `a91d3aa`): `TauCeti.hilbertProjectiveDist` (line 76,
     `⨆ i j, log (x i * y j / (y i * x j))`, the log max/min ratio on positive vectors),
     `Matrix.projectiveDiameter` (214) and `Matrix.hilbertProjectiveDist_mulVec_le` (362): for a strictly
     positive matrix `K` and strictly positive `x, y`,
     `d (K *ᵥ x) (K *ᵥ y) ≤ tanh (K.projectiveDiameter / 4) * d x y`. The README's matrix Check
     (`[[2,1],[1,2]]`, `f = (1,1)`, `g = (1,2)`: `log(5/4) ≤ (1/3) log 2`) is an instance of that
     theorem (`projectiveDiameter = log 4`).
   - **Repair.** (i) Scope line 72–75: "Hilbert's projective metric on positive vectors and Birkhoff's
     `tanh(Δ/4)` contraction for strictly positive finite matrices are Tau Ceti's
     `TauCeti.hilbertProjectiveDist`, `Matrix.projectiveDiameter` and
     `Matrix.hilbertProjectiveDist_mulVec_le` (`TauCeti/Data/Matrix/BirkhoffContraction.lean`);
     OptimalTransport Layer 13B, item 9 states the same finite case. Layer 3 here proves the statement
     for salient convex cones in arbitrary real vector spaces and for the C¹ derivative cones; on
     positive vectors its distance is the pinned one." (ii) Replace line 171 by "Consume
     `TauCeti.hilbertProjectiveDist`, `Matrix.projectiveDiameter` and
     `Matrix.hilbertProjectiveDist_mulVec_le` (`TauCeti/Data/Matrix/BirkhoffContraction.lean`) as the
     finite positive-matrix case of §3.3, used there as a consistency check." (iii) §3.3 bullet at
     792–793: "On strictly positive vectors of `ℝ^k`, `d(f, g) = log(max_i (g_i/f_i) / min_i (g_i/f_i))
     = TauCeti.hilbertProjectiveDist f g`." and end the matrix Check with "this is
     `Matrix.hilbertProjectiveDist_mulVec_le` for `K = [[2,1],[1,2]]`, whose `projectiveDiameter` is
     `log 4`." (iv) §3.3 *Needs:* add "Tau Ceti `Matrix.hilbertProjectiveDist_mulVec_le`". The general
     theorem `birkhoff_contraction` stays: it has no finite-dimensional or positivity hypothesis.

3. **F03** (P3) A "correction" of the published text concerns the arXiv text

   - **Location.** `packages/ProbabilisticAndMetricNumberTheoryPartII/README.md:1460–1461`, under
     "GMR19, §5.1, p.801: … The index range of (5.1) includes `i = n − 2`."
   - **Claim.** The published (5.1) on p.801 prints an index range that omits `i = n − 2`.
   - **Witness.** The published display prints `1 ≤ i ≤ n − 2` (GMR19 line 2401, p.801). It is the
     arXiv v3 display that prints `1 ≤ i ≤ n − 3` (GMR19 arXiv v3 line 2043, p.46), while Lemma 48,
     Case III, `j = n − 2`, `B ≥ 2`, uses (5.1) for `dγ_i` with `i` up to `n − 2` (GMR19 lines
     2464–2468).
   - **Repair.** Move the sentence into its own bullet: "GMR19 arXiv v3, (5.1), p.46: the index range is
     printed `1 ≤ i ≤ n − 3`; the published display (p.801) and the use in Lemma 48, Case III, need
     `1 ≤ i ≤ n − 2`." On the instance that refuted the original (the published p.801), nothing is now
     claimed to be wrong.

4. **F04** (P3) The compact-operator case of §3.5 exists at the Tau Ceti pin and is not cited

   - **Location.** `packages/ProbabilisticAndMetricNumberTheoryPartII/README.md:874–875` ("A compact `T`
     satisfies the hypotheses with `p = ‖·‖`, `k = 1`, `R = ‖T‖` and `r = 0`, and the conclusion is the
     Riesz–Schauder description of its nonzero spectrum"); line 171.
   - **Claim.** The Riesz–Schauder case is only a Check, with no pinned owner to compare with.
   - **Witness.** Tau Ceti at the pin: `IsCompactOperator.finiteDimensional_genEigenspace_nat`
     (`TauCeti/Analysis/Normed/Operator/Compact/Eigenspace.lean:132`, every finite-order generalised
     eigenspace at a nonzero scalar is finite-dimensional) and `IsCompactOperator.finiteDimensional_ker_one_sub`,
     `isClosed_range_one_sub`, `finiteDimensional_quotient_range_one_sub`
     (`TauCeti/Analysis/Normed/Operator/Compact/RieszTheory.lean:161,173,194`). These are the `r = 0`
     instance of the finite-dimensionality and Fredholm conclusions of `hennion_essential_radius`.
   - **Repair.** End the Check with "(the finite-dimensional generalised eigenspaces and the Fredholm
     property of `1 − T` at `r = 0` are Tau Ceti's `IsCompactOperator.finiteDimensional_genEigenspace_nat`
     and `IsCompactOperator.finiteDimensional_ker_one_sub`, `isClosed_range_one_sub`,
     `finiteDimensional_quotient_range_one_sub`, `TauCeti/Analysis/Normed/Operator/Compact/`)", and
     list these four names under "From Tau Ceti" together with the three names of S02, as consistency
     checks of §3.5 and §3.3. On the instance (a compact `T`, `r = 0`) the cited declarations give the
     Check's conclusion.

Round 2. Every finding of round 1 (r1a F01–F11, r1b F01–F04) was checked at this head, finding by
finding, below; all are repaired and no repair introduced an error. The full pass was then run again
on all 24 declarations of `Suggested.lean` and all 40 targets of the README. The pinned libraries
moved since round 1 (Mathlib `6b7abb3` → `f6090c7`, Tau Ceti `a91d3aa` → `358314d`); every cited
Mathlib name was re-resolved at the new pin, and the Tau Ceti sweep at the new pin produced S02 and
S04.

## Round-1 findings at this head

Each earlier finding, the repaired passage at `1824ee6`, and the status.

| Id | Repaired passage (README/Lean line) | Status, witness |
| --- | --- | --- |
| r1a F01 (pushforward functional) | README 760–762: unnormalised sum evaluates `f` as `∫ L_σ f dμ`, normalisation as `(∫ L_σ f dμ)/(∫ L_σ 1 dμ)`; `n = 3, σ = 2, δ₀, f = 1` gives `ζ(2) − 1 ≈ 0.645` and `1` | repaired; recomputed `Σ_{k≥2} k⁻² = 0.6449`, ratio `1` |
| r1a F02 (empty word) | README 542–544: every nonempty word has a unique fixed point in `K`; the empty word fixes all of `Δ`, `(1/3,1/3,1/3) ∉ K` | repaired; identity fixes `(1/3,1/3,1/3)`, `b = 2/3 > 1/2` |
| r1a F03 (common phase Check) | README 1045–1049: delays `√2, √2+1`, `t = 2π`, `r = −2π√2` versus no `t ≠ 0` with phase `0`; `1/2, 3/2` with `t = 4π`, `r = 0` kept as control | repaired; phases `0, −2π`; `t = 2πk`, `k√2 ∈ ℤ ⇒ k = 0`; `−2π, −6π` |
| r1a F04 (off-simplex total values) | README 305–308: `w_j = 3`, `A = 0`, `q = −1`, `Real.log q = 0`, `(−1)^{−3} = −1`, `exp(0) = 1` | repaired; `Real.log_neg_eq_log` (Mathlib `Log/Basic.lean:120`), `cpow` of `−1` at `−3` is `exp(−3iπ) = −1` |
| r1a F05 (missing headlines) | Lean 67 `wordMap`, 93 `eventual_contraction`, 131 `birkhoff_contraction`, 285 `counting_three`, 295 `conformal_exponent_pseries`; docstring 18–35 lists stated and non-statable headlines | repaired; each name in README §§0.3, 1.3, 3.3, 7.2, 7.4; statements checked in the table below |
| r1a F06 (forward references) | §2.2 (606–629) no longer cites §3.2; §6.6 conformal measures precede §6.7 counting; §6.6 line 1269–1271 rules out `s ≤ 1` first | repaired differently (predicate stays in §3.2, which §2.2 no longer uses); all *Needs:* lines point backwards (checked, list in Verified sound) |
| r1a F07 (Checks) | README 813–816 (`1`, `−1`, `e^{ax}`, `e^{(a+ε)x}`), 395–398 (bounds `1`, `6`), 900–902 (`sin(kx)/k`), 666–670 (`ζ′(2) ≈ −0.938`, `ζ″(2) ≈ 1.989`) | repaired; recomputed `4 + 2 = 6`, `f′_k(0) = 1`, `ζ′(2) = −0.9375`, `ζ″(2) = 1.9893` |
| r1a F08 (positive scale) | README 187–193, 1208, 1224–1225, 1239 | repaired; supplier `squaredSinc_mass` has `(hell : 0 < ell)` (its `Suggested.lean` 81) |
| r1a F09 (Brouwer owner) | README 66–71, 195–202, 725–732, 740, 941: AlgebraicTopology Stage 2, item 7, `brouwerFixedPoint_compactConvex_continuousOn` | repaired; on main `TauCetiRoadmap/AlgebraicTopology/README.md:393–399`, `Suggested.lean:2490` (hypotheses `ContinuousOn f C`, `MapsTo f C C`) |
| r1a F10 (characteristic polynomial) | README 1060–1062, 1076–1078 | repaired; `det(M − 2I) = −8 + 4 + 2 = −2`, monic `8 − 4 − 2 = 2`; GMR19 line 2135 prints `det(γ − T I_n)` |
| r1a F11 (interior fixed ray) | README 1065–1067, 1074–1075 | repaired; `1/(1 + t₀) = (3 − √5)/2 = 0.382 ∈ (0, 1/2)`; GMR19 line 2146 eigenvector |
| r1b F01 (`n = 3` counting headline) | Lean 285–291 `counting_three`; README 1351–1355, Check 1363–1365 | repaired; constants `3/π² = 0.304`, `6/π² = 0.608`; `h₂` would give `0.721`, `1.443` |
| r1b F02 (p-series headline) | Lean 295–300; README 1396–1402; Summary line 21 | repaired; `d = 1, β = 2`: `0.6449 ≤ 1 ≤ 4 · 0.3949 = 1.5797` |
| r1b F03 (MN75 page) | README 723; `sources.toml` MN75 locator "Theorem 2.6, p.167, with its proof on pp.167–168; Lemma 2.3, p.166" | repaired; MN75 line 99 between footers at lines 76 ("166") and 113 ("167") |
| r1b F04 (compact inclusion citation) | README 409–411 split into chain rule (Lemma 46, proof of Lemma 38) and Arzelà–Ascoli (footnote 21, p.794) | repaired; GMR19 lines 2090–2092 |

The two pre-round-1 P3 items the repair report left unacted ((5.1) index range; Tau Ceti Riesz
declarations) are the subject of S03 and S04.

## Verified sound

**Head, scope, policy.** Checkout at `1824ee6d`; `git diff --stat origin/main...HEAD` touches only
the package folder (README, Suggested.lean, design/plan.json, metadata.toml, sources.toml, two
reports); plan.json's only change is `gaps: [G1] → []` (the Brouwer owner is now cited on main).
README: no pull-request number, no process word, no machine path, no `set_option`; the only `lemma`
hit is the Riemann–Lebesgue lemma. Lean: single `import Mathlib`; `theorem` throughout (16 sorried
theorems, 9 definitions with real bodies, no sorried data, no `example`, no `#eval`/`#print`/
`#synth`, no `True`); namespace `TauCetiRoadmap.ProbabilisticAndMetricNumberTheoryPartII`, which no
other roadmap on main or at an open head declares (`roadmaps grep`, 0 hits).

**Gate and resolver.** Dependency check (exact output):

```text
depcheck: 234 roadmaps, 2111 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `roadmaps resolve` on the README: no cross-roadmap citation and
no Lean name found nowhere. Merge order: ProbabilisticAndMetricNumberTheory (281) and
ArithmeticDirichletSeriesPartII (287) precede this roadmap (294); AlgebraicTopology, OptimalTransport,
BanachAlgebras, OperatorTheory, MarkovChainsAndRenewal, ClassicalArithmeticCompletion and
DifferentialGeometry are on main.

**Signatures.** No Lean was run (forbidden here). The supplied elaboration of all 24 declarations
(`signatures.md`, 0 dropped binders; the file has no `variable` block) was compared line by line with
the README statements: `1 ≤ d` where the README has `d ≥ 1` (`eventual_contraction`,
`ruelle_perron_frobenius`, `wielandt_separation`, `pressure_eigenvalue`, `conformal_exponent`,
`uniform_counting`); no hypothesis for `conformal_exponent_pseries`/`_mono` because the hypothesis is
impossible at `d = 0` and at `β ≤ 1` (below). Nothing changed.

**Adversarial table** (24 declarations, 40 targets; values computed on both sides).

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| `orderedSimplex` (0.1) | `d = 0, 1, 2`; interior point `w_i = 2i/(n(n−1))` | `d = 0`: the single empty function; `d = 1`: `0 ≤ x₀ ≤ 1 − x₀ ⇔ x₀ ≤ 1/2`; `d = 2`: `0 ≤ x₀ ≤ x₁ ≤ 1 − x₀ − x₁`, vertices `(0,0),(0,1/2),(1/3,1/3)`; `Σ 2i/(n(n−1)) = 1`, `w_{n−1} = 2/n` | holds; GMR19 (1.5) line 230 |
| `branchDenom`, `branchMap` (0.2) | `n = 4`, `w = (1/6,1/3,1/2)`, `(0,1)`, `(1,2)`; `n = 3`, `w₁ = 0`; `w₁ = 1/2, A = 0`; image ordering | `Fin.snoc x (1 − Σx)` deleted at `castSucc j` via `succAbove`: `q = 11/6`, `F = (2/11, 3/11)`, last `6/11`; `q = 7/3`, `F = (1/14, 3/14)`, last `5/7`; `F_A(0) = 1/(A+2)`; `q = 3/2`; appended `(1 + A(1−w_j))/q ≥ w_{n−1}/q` since `w_{n−1} ≤ 1` | holds; GMR19 (4.5)–(4.6) lines 1953–1957 |
| Homogeneous identity (0.2) | `A = 0, 1` by hand | `γ_j(w,1) = (…, 1, 2 − w_j)`; `γ_{n−1}` of it `= (…, 2 − w_j, 3 − 2w_j)`; matches `1 + A(1−w_j), 1 + (A+1)(1−w_j)` | holds |
| `wordMap`, `wordDelay`, `wordCount` (0.3) | `[]`; `[(0,0),(1,1)]` at `n = 4`; `n = 3, w₁ = 1/2, r = log 2`; `n = 4, (1/4,1/4,1/2)`; `r < 0`; off-simplex | identity, `0`; `log(11/6) + log(27/11) = log(9/2)` (homogeneous last coordinate `9/2`), not `log(77/18)`; `N = 3` (`q₀ = 3/2, q₁ = 2 ≤ 2, q₂ = 5/2`, two letters `≥ log(9/4)`); both `(0,1),(0,2)` give `(1/7,2/7,4/7)`, `q = 7/4`, `N = 3`; `N = 0`; `ncard` of an infinite set is `0`, used only on `Δ` where `τ ≥ log(3/2)` makes it finite | holds |
| Renewal equation (0.3) | first-letter partition | `T_{a::v}(w) = τ_a(w) + T_v(F_a w) ≤ r ⇔ T_v(F_a w) ≤ r − τ_a(w)` | holds; GMR19 (4.1) line 1893 |
| `C1BoundedOn` (0.4), jets | `1`; `2x₀ + 3` on `[0,1/2]`; `x₀`; jet `(0, 1)`; factor two | `1`; `4 + 2 = 6` (`5` fails); `1/2 + 1 = 3/2`; `0 = y − x` fails; `‖f‖_∞ + ‖D‖_∞ ≤ 2 sup(‖f‖ + ‖D‖)` | holds |
| Jets are `ContDiffOn` (0.4 API) | boundary point of `K` | `f(y) − f(x) − D(x)(y−x) = ∫₀¹ (D(x+t(y−x)) − D(x))(y−x) dt = o(‖y−x‖)` | holds |
| Pullback (0.5) | affine `Φ`; `f = g = x` on `[0,1]` | `max(1, ‖DΦ‖)(‖f‖_∞ + ‖Df‖_∞)`; `1 + 2 = 3 ≤ 4` | holds |
| Core/cusp (1.1) | `(0,0,1)`, `(0,1/2,1/2)`, `(0,1/3,2/3)`, `(1/5,1/5,3/5)`, `(1/3,1/3,1/3)`; `γ_i(Δ) ⊂ Δ_core`, `γ_{n−1}(Δ) ⊂ Δ_cusp` | `1 − 2b = 1, 0, 1/3, 1/5, −1/3` vs `w₂ = 0, 1/2, 1/3, 1/5, 1/3`; `b′ = (1 − w_i)/(2 − w_i)`, `1 − 2b′ = w_i/(2 − w_i) ≤ w_{n−1}/(2 − w_i) = w′_{n−2}`; cusp bounds `w_{n−2} ≤ 1/3`, `w_{n−3} ≤ 1/5` from `w_{n−2} ≤ 1 − 2b` | holds; GMR19 lines 2384–2387 (strict inequality printed, see Source issues) |
| Ten bounds (1.2) | `(1/6,1/3)` in (5.2); `(0,0,1)` in (5.5), (5.9); `(0,1/2,1/2)` in (5.1) | `(1 + 1 − 1/3)/(3/2)² = 20/27`; `4/9` (unsquared `4/3`), `7/25` (unsquared `7/5`); `2/(2 − 1/2) = 4/3` | holds; display lines 2393–2438 |
| `eventual_contraction` (1.3) | `u = []`; `n = 3` single letter; `n = 3` pair; Lemma 48 four cases with the chain rule evaluated at images in `Δ₀`, `Δ_cusp` | `‖id‖ = 1 ⇒ D ≥ 1`; `F_A′ = −1/q_A²`, `≤ 4/9`; `≤ 1/4` in the Gauss coordinate; `6/7`, `4/5`, `(6/5)(4/5) = 24/25`, `32/49`, `24/25`; first letter on all of `Δ`: `‖dF_a‖ ≤ 1/q + (A+1)/q² ≤ 2/3 + 4(A+1)/(A+3)²` | holds; GMR19 lines 2443–2468 |
| Attractor (1.4) | `n = 3` fixed points `x_A`; code image; `n = 4` | `x_A = 2/((A+1) + √((A+1)²+4)) → 0`; `⋃_A F_A((0,1]) = (0,1)`, closure `[0,1]`; `K ⊂ Δ₀ ∌ (1/3,1/3,1/3)`; periodic code of a nonempty word gives the unique fixed point since some `F_u^k` is a strict contraction | holds |
| `transferOp` (2.1) | `d = 0`; `n = 3, s = 2, w₁ = 0, 1/2`; `h = 1/w₂` at `w₁ = 1/2`; `Re s ≤ 1, f = 1` | `0`; `ζ(2) − 1 = 0.6449`, `4(ζ(2) − 5/4) = 1.5797`; `Σ 4/((A+2)(A+3)) = 2 = h`; not summable, native `0` | holds; GMR19 (4.7) line 1978 |
| Powers are word sums (2.1) | `m = 2` | `L(L f)(w) = Σ_{a::v} e^{−s(τ_a(w) + T_v(F_a w))} f(F_v F_a w)` | holds |
| C⁰ bounds (2.2) | `n = 3, σ = 2`; printed factor `2` | lower `0.6449` at `w₁ = 0`, upper `1.5797` at `w₁ = 1/2`; `2 · 0.3949 = 0.790 < 1.5797` | holds; GMR19 line 2297 prints `2` |
| Two-norm inequality (2.3) | `m = 0`; `|DT_u|` | `|Df| ≤ C|s||f| + D|Df|` with `D ≥ 1`; `|DT_u| ≤ 2D/(1−ρ)` | holds; GMR19 line 2240 prints complex `L_s` on the right |
| Holomorphy (2.4) | `n = 3, w₁ = 0, f = 1, s = 2` | `−Σ_{k≥2} log k/k² = ζ′(2) = −0.9375`; `Σ (log k)²/k² = 1.9893` | holds |
| Adapters (2.5) | `1_{[c,∞)}`; `e^{−|t|}`; `1_{[1,∞)}`; constant `1` | `e^{−sc}/s`; `1/(1+s) + 1/(1−s)`; `∫₁^∞ u^{−s−1} du = 1/s`; no convergent `s` | holds; Mathlib `mellin f s = ∫ t^{s−1} f` forces `−s` |
| `schauder_tychonoff` (3.1) | `C = ∅`; `[0,∞)` with `x+1`; circle with rotation by `π`; `V = 0` | none; none; none; `{0}` fixed | holds; MN75 line 100 with `F = A = C` |
| `IsEigenprobability` (3.2) | `n = 3, σ = 2, f = w₁²`; `δ₀`; `d = 0`; `σ ≤ 1` | `2 · (1/2)³/3 = 1/12 = 1/12`; `F_A(0) = 1/(A+2) ≠ 0`; alphabet empty, `0 = c`; `L_σ 1 = 0` on `Δ`, so `c = 0` and `f ≥ 0` supported off the origin gives a nonzero finite sum, no measure works | holds; with `c = 1` the `σ ≤ 1` case is impossible (`0 = 1`) |
| Construction (3.2) | fixed point `μ ↦ L^*μ/μ(L1)` | `∫ L f dν = ν(L1) ∫ f dν`, `c = ν(L1) ≥ inf L1 > 0` | holds; GMR19 Cor 36 line 1991 |
| Hilbert distance (3.3) | `(1,2),(3,6)`; `(1,1),(1,4)`; `(1,0),(0,1)`; `d = 0 ⇒` same ray | `0`; `α = 1, β = 4`, `log 4`; `α = 0`; closedness attains `α = β = c`, `g − cf ∈ C ∩ −C = {0}` | holds; LIV95 lines 136–141 |
| `C_a` and diameter (3.3) | `1`, `−1`, `1 + x`, `e^{ax}`, `e^{(a+ε)x}`; `C_{κa}` in `C_a` | `0 ≤ a`; sign fails; `|f′(0)| = 1 > a` for `a < 1`; equality; `(a+ε) > a`; `α ≥ ((1−κ)/(1+κ)) min g/max f`, `β ≤ ((1+κ)/(1−κ)) max g/min f`, `max f/min f ≤ e^{κ a diam Δ}` gives `2 log((1+κ)/(1−κ)) + 2κa diam Δ` | holds |
| `birkhoff_contraction` (3.3) | `g = af`; `g = bf`; `T = 0`; generic: `hΔ` on `(g − af, bf − g)` | `a′ = b′ = a`, `0 ≤ tanh(Δ/4) log(b/a)` needs `b ≥ a` (from `(b−a)f ∈ C₁`, salience) and `Δ ≥ 0`; `a′ = (b + b₀a)/(1+b₀)`, `b′ = (b + a₀a)/(1+a₀)`, `b₀ ≥ a₀ > 0`; `u = 2`, `(a₀,b₀) = (1,4)`: `b′/a′ = 15/12`, `log 1.25 = 0.2231 ≤ (1/3) log 2 = 0.2310`; `(0.7071, 2.8284)`: `0.2290 ≤ 0.2310` | holds (with S02: the matrix case is pinned) |
| `χ` (3.4) | finite set; `B₁` infinite-dimensional; `A + ∅` | `0`; `1`; `χ(∅) = 0 ≠ 1` | holds; HEN95 line 660 lacks "non vide" |
| `hennion_essential_radius` (3.5) | centres anywhere vs in `T(B₁)`; `B = 0`; `r = 0`; `R < 0`; `T = id` | recentre: `p.ball(g,ε) ⊂ p.ball(Tf_i, 2ε)`, so `χ(T^{k+1}) ≤ 2Rε + 2r^k‖T‖ → 2r^k‖T‖`, iterated with `p(Tf) ≤ Mp(f)`: `r_χ ≤ r`; spectrum `∅`; nonzero spectrum isolated finite-rank; stronger hypothesis; `χ = 1`, no `r < 1` | holds; HEN95 Théorème 3.1 line 386 (its `r < ρ(Q)` is only needed for quasi-compactness, not for `ρ_e ≤ r`, Cor 5.2 line 724) |
| Cone convergence (3.6) | `Q`, `a` choice; section bound | `|DL^Q f| ≤ (Cσ + Dρ^Q a)L^Q f < κ a L^Q f` iff `a > Cσ/(κ − Dρ^Q)`; on `ν(f) = ν(g) = 1`: `‖g − f‖_{C¹} ≤ 2(1 + a)(e^{d} − 1)‖f‖_∞`, `‖f‖_∞ ≤ e^{a diam Δ}` | holds; LIV95 Lemma 1.3 line 201 |
| `ruelle_perron_frobenius` (3.7) | `m = 0`; uniqueness with `(μ, c′)`; support | `M ≥ 1 + ‖h‖_{C¹}`; test `h`: `c′ = λ`; `∫ f dμ = λ^{−m}∫ L^m f dμ → ν(f)∫h dμ`, `f = 1` gives `∫ h dμ = 1`, so `μ = ν`; `supp ν ⊂ K` from `L^m f = 0` for `f` off a neighbourhood of `K`, `⊃ K` from `ν(U) ≥ λ^{−m}∫ e^{−σT_v} dν > 0` | holds; GMR19 Thm 39 lines 2035–2042 |
| Eigendata (4.1) | `diag(2,1)`; Jordan block; `ℂ`, `λ = 0` | `P = diag(1,0)`, `T − 2 = −1` on `ℂe₂`; eigenforms `∝ e₂*` kill `e₁`; `ker φ = 0` | holds; KLO19 Def 1.1 line 145 |
| `simple_eigenvalue_analytic` (4.2) | `diag(e^z, 1/2)`; `[[0,1],[z,0]]`; derivative identity | `λ′(0) = 1 = φ₀(T′(0)e₁)`; `±√z`, Jordan at `0`; `φ₀(T₀h′) = λ₀φ₀(h′)` gives `λ′ = φ₀(T′h₀)` | holds; KLO19 lines 441–457 |
| Uniform gap (4.3) | normalisations | one scalar freedom `(ch, c⁻¹ν)`, fixed by `ν(1) = 1`; `ν(h) = 1` is `P² = P` | holds |
| Non-lattice (5.1) | constants; `c + δℤ`; `√2, √2+1`; `1/2, 3/2` | `G = 0, r = −tc`; `t = 2π/δ`; `t = 2π, r = −2π√2`; `t = 4π, r = 0` | holds; GMR19 Def 40 line 2077 with `v = −tτ` |
| Fixed-point test (5.2) | `A = 0, 1, 2`; eigenvector recursion; `n = 3, A = 0` | `t = 1.618, 2.414, 3.303`, gaps `0.400, 0.314`; `(z_{n−1}, z_n) ↦ (z_n, 2z_n − z_{n−1})` gives `(t, t(t−A+j), t(t−A+j+1))`, after `A` steps `t·(1, t, t+1)`, and `t(t−A) = t + 1`; `det(M − 2I) = −2`, monic `2`; chart `0.382` | holds; GMR19 lines 2123–2153 |
| `wielandt_separation` (5.3) | constant delays; `m = 0`; maximum argument | `L_{σ+it} = e^{−itc}L_σ`, radius `λ_σ` (non-lattice needed); `C ≥ 1`; `|g(w₀)| = M ⇒ |g| = M` on all descendants, dense in `K`, equality in the triangle inequality gives `e^{−itτ_a}g∘F_a = ζg` on `K` | holds; GMR19 Thm 41 line 2095 for all `Re s > 1`, `Im s ≠ 0` |
| `pressure_eigenvalue` (5.4) | derivative; limits; `n = 3` | `λ′ = ν(Σ(−τ_a)q_a^{−σ}h∘F_a) ≤ −log(3/2)λ`; `λ_σ ≥ d Σ(A+2)^{−σ} → ∞`, `≤ d Σ(2/(A+3))^σ → 0`; `−π²/(12 log 2) = −1.1866 ≤ −0.4055` | holds; existence of `β` by IVT is the roadmap's own route (GMR19 uses Baragar, lines 2170–2182) |
| Growth (6.1) | recursion; `n = 3, w₁ = 1/2, r = log 2` | `G(w,r) = e^{−βr}/h + Σ p_a G(F_a w, r − τ_a)` with `Σ p_a = 1`, `τ_a ≥ c`; `3/4 > 6/π² = 0.608` | holds; LAL89 Lemma 8.1 line 842 |
| Transform (6.2) | word-by-word | `Σ_u e^{−sT_u}/s = s⁻¹ Σ_m L_s^m 1`, Neumann series since radius `≤ λ_σ < 1` for `σ > β`; Mellin via `u = e^t` | holds; GMR19 (4.2)–(4.4) lines 1919–1944 |
| Pole (6.3) | both identities on `h_s`; residue; `n = 3` | `λ/(1−λ) + 1 = 1/(1−λ)`; printed form gives `(1−λ)⁻¹h + h`; `B = h_β/(β|λ′_β|)`; `h₂ · 6 log 2/π² = 3/(π² w₂)` | holds; GMR19 line 2197, LAL89 line 748 |
| Smoothing (6.4) | one-point `X`, `α = e^{at}`; `squaredSinc 0` | `F = 1/(s−a)`, `B = 1`, `∫ k = 1`; kernel `0`, limit `0 ≠ B` | holds |
| `uniform_renewal_tauberian` (6.5) | one-point `X`; `X = ∅`; `B < 0`; `t ≤ 0` values; patching of germs | Wiener–Ikehara/Delange `k = 0`, `A = B`; vacuous; impossible since `F(σ) ≥ 0` for real `σ > a`; irrelevant (`Ioi 0`, `atTop`); two discs agree on `Re s > a`, intersection convex, identity theorem patches | holds; LAL89 Lemma 8.2 lines 883–896 |
| Squeeze (6.5) | `[r, r+2δ]`, `[r−2δ, r]` | `≥ (1−ε)e^{−2aδ}e^{−ar}α_x(r)`; `≤ e^{2aδ}e^{−ar}α_x(r) + Cε` | holds; LAL89 lines 892–894 |
| Jacobian (6.6) | `n = 3`; `n = 4` at `(1/6,1/3)` by hand | `−1/q²`; `det dγ₁ = 1/(2 − w₁)³ = (6/11)³ = 216/1331` | holds; GMR19 Lemma 44 line 2211 |
| `conformal_exponent` (6.6) | `s ≤ 1`; `s > 1` | `0 = 1`; test `h_s`: `λ_s = 1`, so `s = β`; `∃!` from §3.7 | holds; GMR19 Thm 10 line 366 (exponent `β/(n−1)`) |
| `uniform_counting` (6.7) | `n = 3`, `R = 150` at `w₁ = 0, 1/4, 1/2` | `3R²/(π² w₂) = 6839.2, 9118.9, 13678.4` vs counts `6858, 9124, 13699` (both round-1 passes) | holds; GMR19 Thm 13 line 402 |
| Gauss conjugacy (7.1) | branchwise; `x = 0`; `x = 1, A = 0` | `q_A = (x+A+2)/(x+1)`, `F_A(x) = 1/(x+A+1)`, `q_A^{−s}(1+F_A)^s(1+x)^{−s} = (x+A+1)^{−s}`; `(A+2)^{−s}` vs `(A+1)^{−s}`; `F₀(1) = 1/2`, `q₀(1) = 3/2` | holds; GMR19 lines 1994–2014; supplier `gaussDensityTransfer = Σ_k f(1/(k+1+x))/(k+1+x)²` |
| `eigenprobability_three` (7.2) | mass; change of variables | `2 · 1/2 = 1`; `∫₀^{1/2} q_A^{−2} f(F_A) dw₁ = ∫_{1/(A+3)}^{1/(A+2)} f`, tiling `(0,1/2]` | holds |
| `counting_three`, constants (7.2) | `λ′₂`; `B` | `(1/log 2)∫₀¹ log y/(1+y) dy = −π²/(12 log 2)`; `B = h₂/(2|λ′₂|) = 3/(π² w₂)`; denominator `1 − x 0 ≥ 1/2` | holds |
| Rauzy (7.3) | matrices; `K ⊂ R`; edge | `γ_i` in basis `e_i + e₄` as printed; `A₁, A₂` by row moves; accelerated images of length `m` lie in unaccelerated images of length `m`, so `K ⊂ R ∩ Δ_ord`; the ordered edge `w₁ = 0` is invariant under `(A, 2)` and equals the `n = 3` attractor | consistent; prose target, not statable |
| `conformal_exponent_pseries` (7.4) | `d = 1, β = 2`; `d = 0`; `β ≤ 1`; roots | `0.6449 ≤ 1 ≤ 1.5797`; `0 = 1`; `0 = 1`; `ζ(β) = 2` at `1.7286`; `2^β(ζ(β) − 1 − 2^{−β}) = 1` at `2.425` (`5.37 · 0.1861 = 0.999`); `n = 4`: `2 · 0.5035 = 1.007 > 1`, `2 · 9.85 · 0.0504 = 0.993 < 1` | holds |
| `conformal_exponent_mono` (7.5) | `n = 3 → 4` at `(1/3,2/3)`; wrong shift; `d = 0` | prepend `0`: `q_{(A,1)}(1/3,2/3) = 1 + 2(A+1)/3 = q_{(A,2)}(0,1/3,2/3)`; `j ↦ j` reads the zero and gives `A + 2`; `N_n(ιw,r) ≥ N_{n−1}(w,r)` with the asymptotics forces `s′ ≥ s`; vacuous | holds; GMR19 Remark 14 line 423 |

**Sources** (six manifest works, all read from the cache; 68 locators verified at the text; printed
pages from the page markers). GMR19: (1.3) line 95, (1.4) line 205, `TΓ` and `Γ′` lines 223–227,
freeness and footnote 5 lines 228, 262, (1.5) line 230, basis `e_j` line 255, Example 8 line 265,
Example 9 lines 293–320, Figure 1 caption line 340, Theorem 10 line 366, Remarks 11–12 lines 379–393,
(1.7) lines 396–400, Theorem 13 and (1.8) lines 402–415, Remark 14 line 423, `RP²` count lines
449–459, §4.1 lines 1891–1946, Lemma 33 line 1953, Example 34 line 1959, Lemma 35 and (4.7) lines
1972–1988, Corollary 36 line 1991, Example 37 lines 1994–2025, `C¹` norm line 2026, Lemma 38 line
2030, Theorem 39 line 2035, attractor lines 2062–2069, Definition 40 and footnotes 20–21 lines
2077–2092, Theorem 41 line 2095, Proposition 42 lines 2105–2153, Proposition 43 line 2158, §4.3 lines
2167–2209, Lemma 44 line 2211, Proposition 45 line 2225, Lemma 46 line 2239, proof of Lemma 38 lines
2247–2271, §4.5 lines 2279–2351, §5.1 lines 2355–2387, Remark 47 line 2388, (5.1)–(5.10) lines
2393–2438, Lemma 48 lines 2443–2468; arXiv v3 (5.1) line 2043. LAL89: Theorem 1 line 255, (2.5) line
265, (7.5) line 733, Proposition 7.2 and (7.7) lines 746–749, Lemma 8.1 line 842, Lemma 8.2 lines
883–896, (8.10) line 900. HEN95: Définition 3.1 line 362, Proposition 3.1 line 374, Théorème 3.1 line
386 (précompacité line 394), Proposition 3.3 line 430, Corollaire 3.1 line 450, Définition 5.1 line
650, Proposition 5.1 line 654, Définition 5.2 line 686, Proposition 5.2 line 689, Corollaire 5.2 line
724. LIV95: metric lines 136–141, Theorem 1.1 line 144, footnotes 2–4 lines 152–159, Lemma 1.3 line
201. KLO19: qualitative theorem lines 87–109, Definition 1.1 line 145, Corollary 1.13 line 288,
Propositions 3.1–3.2 lines 441–457. MN75: Lemma 2.3 line 62, Lemma 2.5 line 95, Theorem 2.6 line
99. Every locator resolves to the stated statement and page except the one of S03.

**Pinned Mathlib names** (new pin `f6090c7`, all present): `spectralRadius`,
`spectrum.isOpen_resolventSet`, `spectrum.isCompact`, `spectrum.gelfand_formula` (alias,
`GelfandFormula.lean:127`), `spectrum.nonempty` (146), `spectrum.hasFDerivAt_resolvent`,
`Module.End.maxGenEigenspace` (`Eigenspace/Basic.lean:556`), `Module.End.HasEigenvalue`,
`ContinuousLinearMap.IsFredholm`, `ImplicitFunctionData.differentiableAt_implicitFunction`,
`DifferentiableOn.analyticOnNhd` (`CauchyIntegral.lean:707`), `hasFDerivAt_tsum_of_isPreconnected`,
`hasDerivAt_tsum_of_isPreconnected`, `contDiffOn_succ_iff_fderivWithin`, `uniqueDiffOn_convex`,
`Convex.norm_image_sub_le_of_norm_fderivWithin_le`, `Seminorm`, `Seminorm.ball`,
`LocallyConvexSpace`, `LinearEquiv.toContinuousLinearEquiv` (`FiniteDimension.lean:366`),
`Real.summable_one_div_nat_rpow`, `Complex.summable_one_div_nat_cpow`, `hasSum_zeta_two`,
`BoundedContinuousFunction.arzela_ascoli`,
`ContinuousMap.subalgebra_topologicalClosure_eq_top_of_separatesPoints`,
`ProbabilityMeasure.continuous_integral_continuousMap`,
`isCompact_setOfPred_probabilityMeasure_mass_eq_compl_isCompact_le` (`Prokhorov.lean:505`),
`FiniteMeasure.ext_of_forall_integral_eq`, `Measure.pi`, `integral_tsum`,
`tendsto_integral_filter_of_dominated_convergence`, `integral_comp_exp`, `integrable_comp_exp`,
`mellin`, `MellinConvergent`, `Real.tendsto_integral_exp_smul_cocompact`, `PointedCone`
(`Cone/Pointed.lean:33`), `Real.log_neg_eq_log`. Tau Ceti: `TauCeti.LSeries.wienerIkehara`
(`SharpCutoff.lean:301`) and `TauCeti.C1HolderSpace` (`Holder/One.lean`) exist as the README says.
Mathlib at the new pin still has no Schauder, Brouwer, Laplace transform of functions, essential
spectral radius, Hilbert projective metric or renewal theorem (sweep by object).

**Supplier citations, resolved now** (12 groups, 11 Lean names). ProbabilisticAndMetricNumberTheory
at its open head `e4c4e53` (#1421, a new roadmap, merge order 281): §4.4 (README 4912) with
`gaussMap` (`Int.fract x⁻¹`, `Suggested.lean` 476), `gaussMeasure` (479, density
`1/((1+x) log 2)` on `Ioc 0 1`), `gaussMeasure_probability` (483), inverse branches with absolute
derivative `1/(a+x)²` (README 5041–5050), telescope (5058); §4.8 (5818) with `gaussDensityTransfer`
(560, `Σ_k f(1/(k+1+x))/(k+1+x)²`, so `a = A + 1`) and `gaussDensityTransfer_duality` (5866); §4.9
(5970, contraction `18913/21600 < 9/10`). ArithmeticDirichletSeriesPartII at `93f5273` (#1415):
sections and names as in S01; `HasLaplace` has `[NormedSpace ℝ E] [SMul ℂ E]` and default measure
`volume.restrict (Ioi 0)` (its `Suggested.lean` 42–51); `squaredSinc_fourier` is the inverse
representation `(1/2π)∫_{−2λ}^{2λ}(1 − |y|/2λ)e^{iyv}dy` in angular frequency (86–89), the form §6.4
uses; `delangeLaplace` with `k = 0`, `A > 0` gives `α(t)/e^{at} → A` (159–167), matching §6.5's
one-point case; `PoleBoundary` asks only for agreements on the open half-plane, implied by §6.5's
patched germs. On main: AlgebraicTopology Stage 2, item 7 (README 393–445) with
`brouwerFixedPoint_compactConvex_continuousOn` (`Suggested.lean` 2490) and `_finiteSpan` (2574);
OptimalTransport 13B, item 9 (1528–1535); BanachAlgebras A2 (161, 255–258) and A8 (1116, 1148–1160);
OperatorTheory folders `SelfAdjointSpectralTheory`, `SpectralSubspacePerturbation`;
MarkovChainsAndRenewal Layers 4–6 (287, 311, 356, key renewal 367); ClassicalArithmeticCompletion
§§4.38, 4.57, 4.78, 4.105 (8723, 9217, 9827, 10528); DifferentialGeometry Layer 10 (877) consuming
AlgebraicTopology's Brouwer. No `*Needs:*` line cites a later roadmap; no declared gap; no cycle.

**Ownership by object** (`roadmaps grep` over main and the 452 open heads): Schauder/Tychonoff hits
are BanachAlgebras A8's Banach compact-map theorem (cited) and PDE's consumption of it; Hennion/
Ionescu-Tulcea hits are Mathlib's trajectory kernels; Ruelle/Perron–Frobenius hits are finite-matrix
theorems (PivotalSpherical, Subfactors, TemperleyLieb); Hilbert metric/Birkhoff hit is OptimalTransport
13B (cited; the pinned owner is S02); renewal hits are MarkovChainsAndRenewal and PointProcesses
(i.i.d. renewal, cited as different); Markoff hits are ClassicalArithmeticCompletion (cited) and a
reference in AnalyticNumberTheoryPartI; Rauzy hits are the Christol–Kamae–Mendès France–Rauzy
theorem. No open pull request builds this roadmap's objects. Ownership against open pull requests was
checked only through `roadmaps grep` and the sibling checkouts the brief names.

**Build order.** Every *Needs:* edge points to an earlier section (checked all 40 lines; §2.2 no
longer uses §3.2; §6.6 precedes §6.7; §7.5 uses §§6.6, 6.7, 7.2, 0.2).

**Checks.** 46 Checks recomputed (table), all true and discriminating; definitions with at least
three Checks: 0.1 (4), 0.2 (5), 0.3 (4), 0.4 (7), 0.5 (3), 1.1 (4), 1.4 (4), 2.1 (4), 3.2 (3), 3.3
(7), 3.4 (4), 4.1 (3), 5.1 (3).

**Headlines and padding.** Stated: eventual contraction, Schauder–Tychonoff, Birkhoff, Hennion, RPF,
analytic perturbation, Wielandt, pressure, uniform renewal Tauberian, uniform counting, conformal
exponent, `n = 3` eigenprobability and counting, p-series enclosure, monotonicity. Named as not
statable in the docstring, correctly: operator-norm holomorphy (§2.4), the uniform gap (§4.3), the
renewal transform's pole (§6.3), each valued in `C¹(Δ; ℂ)`, and the Rauzy comparison (§7.3). No
sorried theorem follows in one tactic from the pins or restates a definition; `eigenprobability_three`
needs the branchwise change of variables for every continuous test function and feeds
`counting_three`. README and Lean agree: all 24 names occur in the README; every backticked own name
of the README is declared.

**Counts.** 24 declarations read; 40 targets read; 68 locators verified; 46 Checks tested; 12
supplier citation groups and 11 supplier Lean names resolved; 38 Mathlib and 9 Tau Ceti declarations
checked at the new pins.

## Not verifiable

- No Lean was run (forbidden in this pass); the supplied elaboration was used. The repairs of S01–S04
  touch only prose.
- The published displays of (5.5), (5.9) and Table 1 lose superscripts in the extraction; their
  unsquared printing is inferred as in round 1 (the arXiv proofs square them).
- The three word counts `6858, 9124, 13699` at `R = 150` are taken from the two independent round-1
  computations; the constants `3R²/(π² w₂)` were recomputed here.
- Ownership against open pull requests beyond `roadmaps grep` and the named sibling checkouts was not
  checked.

## Source issues

- **Misprint** in GMR19 arXiv v3 at (5.1), p.46 (arXiv line 2043): the source says the single-branch bound holds for indices `1 ≤ i ≤ n − 3`; it should be `1 ≤ i ≤ n − 2`, as the published display and Lemma 48, Case III, need; affects nothing; corrected in print at Annals (5.1), p.801.
- **Misprint** in GMR19 at §4.5, proof of Proposition 43, p.799 (line 2297): the source says the branch sum is at most `2(n−2)‖f‖_∞ Σ (A+3)^{−s}`; it should carry the factor `2^s`; affects nothing (re-confirmed).
- **Misprint** in GMR19 at Lemma 46, p.798 (line 2240): the source says the two-norm inequality's right side uses the complex operator `L_s`; it should use `L_{Re s}`; affects the proof (re-confirmed).
- **Error** in GMR19 at §4.3 item (1), p.797 (line 2197), and in LAL89 at Proposition 7.2, (7.7), p.25 (line 748): the source says the resolvent is the pole term plus the full remainder resolvent; it should restrict the remainder to the complementary projection, since on the eigenvector it returns `(1−λ)⁻¹h + h`; affects the proof (re-confirmed).
- **Misprint** in GMR19 at §4.3, p.797 (line 2205): the source says the leading counting coefficient is the `ν`-normalised `h_{β₀}`; it should be `h_β/(β|λ′_β|)` with those normalisations; affects a stated result up to the constant Theorem 13 leaves free (re-confirmed).
- **Gap** in GMR19 at §4.2, p.794 (lines 2066–2069): the source says the image of the coding map is a compact attractor; it should take the closure, since for `n = 3` the image omits `w₁ = 0`; affects the support statement (re-confirmed).
- **Misprint** in GMR19 at §5.1, p.801 (line 2386): the source says the cusp inequality is strict; it should be `≥`, attained at `(1/5, 1/5, 3/5)`; affects nothing (re-confirmed).
- **Gap** in HEN95 at Proposition 5.1(v), p.19 (line 660): the source says adding a compact set does not change `γ`; it should require the compact set nonempty; affects a stated result in the degenerate case (re-confirmed).
- **Misprint** in LAL89 at §7, p.25 (lines 738, 754): the source says lower semicontinuity of the spectral radius keeps nearby radii below a bound; it should be upper semicontinuity or a finite-power Gelfand bound; affects the proof only (re-confirmed).
- **Error** in MN75 at Theorem 2.6, p.167 (line 100): the source says every continuous map of a convex set into a compact subset has a fixed point; it should require the convex set nonempty; affects a stated result in the degenerate case (re-confirmed).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1824ee6d9479df1b7a0e7b3e7a2d59847b3dd6e7", "job": "RT-ProbabilisticAndMetricNumberTheoryPartII~2b", "model": "fable", "worker": "chris-x9"} -->
