# Review of SingularHermitianMetricsAndL2Methods (pull request #2884 at fb5186a)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/SingularHermitianMetricsAndL2Methods/`
**Verdict:** needs changes

**Summary.** Changes are needed, for one reason of ownership and none of mathematics: every statement, Check and sampled locator I recomputed holds. The uniform Bergman asymptotic of 9.2 (a headline) is the theorem that HeightsRationalPointsAndObstructions §5.17c, an earlier roadmap, already plans for the curvature volume, and the README lists that roadmap as a consumer although it does not cite this one. The head is the one the previous review read, so its three small corrections stand; with two new ones there are five small corrections and one format note, none blocking. The provenance and licence questions for the human reviewers stand.

## R01 (P2) — The uniform Bergman asymptotic of 9.2 is already planned by HeightsRationalPointsAndObstructions §5.17c, which the README lists as a consumer although it is earlier in the merge order and does not cite this roadmap

Two roadmaps would each prove the theorem of Tian and Bouche, and an implementer of 9.2 is not told that an earlier roadmap owns its main case. In "Downstream consumers" (lines 2353–2354) the README says of that roadmap: "its uniform Bergman-density asymptotics and its restriction operators to smooth members of `|L^a|` are instances of 9.2 and 4.2".

At the head of pull request #1017, `TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md` §5.17c (lines 2789–2797) defines the Bergman density of a positive hermitian line bundle on a compact projective manifold for the curvature probability volume and states `bergmanDensity_uniform`: `B_n/N_n → 1` uniformly, with `N_n = h⁰(L^n)`. Put `dV = c₁(L,h)^n/∫c₁(L,h)^n` in 9.2: the limit is `∫c₁^n/n! = lim N_k/k^n`, so 9.2 says `B_k/N_k → 1`, the same statement. That README does not mention this roadmap anywhere, and it stands before this one in the merge order, so it cannot consume 9.2 or 4.2; its restriction theorem `positiveBundle_uniformRestriction` is proved there by its own twisted estimate, not from 4.2.

The smallest change: move the sentence from "Downstream consumers" to "Scope and ownership", saying that HeightsRationalPointsAndObstructions §5.17c owns the Bergman density of a positive hermitian line bundle for the curvature volume and its uniform asymptotic `bergmanDensity_uniform`, and say in one clause how 9.2 differs (an arbitrary smooth volume form, which amounts to a twist by a fixed hermitian trivial bundle that §5.17c does not state; 3.6 and 9.3–9.4 for singular metrics and noncompact manifolds). Then 9.2 either names `bergmanDensity_uniform` in its *Needs:* line for the curvature-volume case or says that its peak-section route is kept independently of it.

## C01 — Several targets cite a whole paper or book where a theorem number exists

This carries the first small correction of the previous review (the head is unchanged) and adds the sampled targets that have the same gap. An implementer looking for the statement is sent to a whole work.

- 7.4's route (line 1713) and 7.3 off the compact case (line 1670) cite Demailly 1992 without a theorem or page. I could not read that paper.
- 6.2 has no locator; the statement is [AMAG] Prop. 5.7, p. 37 (DemaillyAMAG line 1743).
- 3.10(a) rests on the References entry for Skoda 1972 alone; the statement, with `m = q` and `αq = m + ε` (so `α/(α − 1) = 1 + m/ε`), is [CADG] chapter VIII, Th. 9.10, p. 392 (DemaillyCADG line 19138).
- 3.8 has no locator; the general form of which it is the case of a trivial line bundle on a domain is [CADG] chapter VIII, Th. 6.1, p. 376 (DemaillyCADG line 18365) and [AMAG] Th. 5.1, p. 33.
- 3.2a(a): [CADG] chapter V, Th. 14.3 and 14.5, pp. 273–274.
- 5.3 and 5.4 name Mumford only in the route and the References; the definition of a good metric, the uniqueness of the extension and the Chern–Weil statement each have a number in §1 of that paper, which I could not open.

## C02 — "No constant `A` serves on a noncompact `X`" (3.3's route, line 852) is stronger than intended

Unchanged since the previous review. For `X = ℂ`, `Z = {0}`, `|g|² = |z|²`, one has `i∂∂̄log|g|² = 0` off `0`, so `A = 0` serves. "A constant `A` need not exist on a noncompact `X`" says what the route uses.

## C03 — Two locators describe their sources more broadly than the sources do

Unchanged since the previous review.

- In 0.4(b) (lines 284–285), "for closed `γ`, Guedj and Zeriahi 2005, Proposition 1.7" omits that the paper works on a compact Kähler manifold (GuedjZeriahi2005 lines 138–141); 0.4(b) is for any compact connected complex manifold. "For closed `γ` on compact Kähler `X`" would be exact.
- In 2.2 (lines 552–553), the locator "[AMAG] Def. 1.10, p. 8" stands inside the parenthesis that introduces *neat*; that definition (DemaillyAMAG lines 329–334) has no such term. Placing the locator after the definition of analytic singularities would stop the attribution.

## C04 — 3.2a(b) does not cover "the top piece of a polarised variation of Hodge structure" beyond weight one

The parenthesis closing 3.2a(b) (lines 794–795) and the consumer line 2351 present (b) as the curvature of the top Hodge piece. (b) assumes that `k` is negative definite on the whole `k`-orthogonal complement of `S`. In weight 2 the polarisation form is positive on `H^{2,0}`, negative on `H^{1,1}` and positive on `H^{0,2}`, so for `S = H^{2,0}` the complement `H^{1,1} ⊕ H^{0,2}` is indefinite and (b) does not apply; only weight one satisfies the hypothesis.

The formula itself needs less: with `τ` the block of `∇` from `S^{⊥k}` to `S`, parallelism gives `k(σs, t) + k(s, τt) = 0`, so `θ_S(ξ ⊗ v) = −k(σ(ξ)v, σ(ξ)v)`, which is `≥ 0` as soon as `k` is negative definite on a sub-bundle of `S^{⊥k}` containing the image of `σ` (for a variation, `H^{n−1,1}`). Either state (b) with that hypothesis, or write "of weight one" in the two places.

## C05 — 8.3 assumes `X` compact, which neither its source nor its route uses

8.3 (line 2150) is stated "in the setting of 8.2 with `X` compact". Its locator, [AMAG] Cor. 5.12, p. 40 (DemaillyAMAG lines 1885–1895), has the hypotheses of the vanishing theorem, a weakly pseudoconvex Kähler manifold, and the route (the exact sequence and `H¹ = 0` from 8.2, the stalks at finitely many isolated points being a direct summand of `H⁰(K ⊗ L ⊗ O/J)`) is the same there. Dropping "with `X` compact" gives the statement at the generality of 8.2; a consumer on a Stein chart would otherwise find 8.3 inapplicable.

## N01 — `c_ρ` denotes two constants

7.4's third Check sets `c_ρ = ∫log|w|·ρ` (value `−11/12`); 7.5's second Check writes `2 log ε + c_ρ` for the mean of `log|z|²`, which with that definition is `2 log ε + 2c_ρ`. Another letter in 7.5, or `2c_ρ`, would keep the two apart.

## Deferred findings

- D01 — stands

## Previous findings

The head is the one the previous review read (no line of the folder changed), so nothing is repaired:

- C01 — not repaired: 7.4's route still reads "The regularisation is Demailly's (J.-P. Demailly, *Regularization of closed positive currents and intersection theory*, 1992)" with no theorem; carried as C01.
- C02 — not repaired: "No constant `A` serves on a noncompact `X`"; carried as C02.
- C03 — not repaired: "(for closed `γ`, Guedj and Zeriahi 2005, Proposition 1.7, p. 6 of arXiv:math/0401302v2)" and "(*neat* when `w` extends smoothly; [AMAG] Def. 1.10, p. 8)"; carried as C03.

## Verified sound

| Statement | Instances tried | README side | Source or computation | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 0.1 (sample) | `|z₁|² − ½|z₂|²`; radial `u`, `Δu = 4[1 + (1 − r)sin(1/r)]` | Laplacian `2`, not psh; `u = r² + O(r³)`, `Δu = 4r_k` on circles | `4(1 − ½) = 2`, line `z₁ = 0` gives `−½|z₂|²`; `∫₀^r s·sin(1/s)ds = O(r³)`; `1 − (1 − r_k) = r_k` | holds | — |
| 0.2 (sample) | `log|z|` on the disc | circle means `log r`, increasing, limit `u(0) = −∞`; integrable | `∫_{|z|<1}log|z| = 2π∫₀¹ r·log r dr = −π/2` | holds | — |
| 0.3 (sample) | `log|z₁| + log|z₂|` | `i∂∂̄T = π([z₁ = 0] + [z₂ = 0])` | `(i/2π)∂∂̄log|z|² = δ₀` gives `i∂∂̄log|z| = πδ₀`; CADG I Th. 5.5, 5.8, 5.11 at lines 1845, 1876, 1926, pp. 39–40 | holds | — |
| 0.5 (sample) | `ℝ ⊂ ℂ`; two discs with `v = −∞, 0` | not pluripolar, capacity `ℓ/4`; connected `W` needed | CADG I Def. 5.22 (p. 44) has a connected `W`; Th. 5.24 (p. 45): closed pluripolar `A`, locally bounded above, unique extension | holds | — |
| 2.2 (sample) | `c·log(|z₁|² + |z₂|²)` at `0` | `ν = 2c·min ord = 2c` | `liminf c·log|z|²/log|z| = 2c`; AMAG Def. 1.10 (p. 8): `(α/2)log Σ|f_j|² + v`, `α` real, `v` locally bounded | holds | C03 |
| 3.6 (sample) | unit disc; `O(k)` on `ℙ¹`; `h → ch` | `B(0) = 1/π`; `B ≡ k + 1`; unchanged | `σ₀ = π^{−1/2}`; `∫B = h⁰ = k + 1` with mass one; value and norm both scale by `c` | holds | — |
| 3.8 (sample) | `ℂ`, `φ = |z|²`, `v = dz̄` | `|v|²_{i∂∂̄φ} = 1`, equality | `∫|z|²e^{−|z|²} = π∫₀^∞ te^{−t}dt = π = ∫e^{−|z|²}` | holds | C01 |
| 3.8a (sample) | (i) `Ψ = |z|²`, `ρ = 2Re(az)`, `x = s√κ = ½`; (ii) disc, `s = ½` | (i) `πe^{x²}(1 + x²)` against `πe^{x²}(1 − x)^{−2}`; (ii) `π/((1−s)(2−s))` against `π/(s(1−√s)²(3−s))` | (i) `1.25 ≤ 4`; (ii) `4.19 ≤ 29.3`; `∫₀¹t(1−t)^{−s}dt = 1/((1−s)(2−s))`; route: `A ≤ V + s√κ·A` | holds | — |
| 3.10 (sample) | `g = (z₁, z₂)`, `f = z₁`, `α = 3/2` | `c(2,1) = 3`; `I = π²`; datum energy `π²(1/ε − 1)` | `(3/2)/(1/2) = 3`; `½·2π²∫₀¹dr = π²`; `|∂̄h⁰|² = |z₁|²/|z|⁴`; CADG VIII Th. 9.10: constant `1 + m/ε = α/(α − 1)` | holds | C01 |
| 5.3 (sample) | `φ = t^{−2}sin t²`; `H = diag(t, 1)`, `g = I + wE₁₂` | `tφ′` bounded, `t²φ″` unbounded; `dw`-coefficient `E₂₁` against `t·E₁₂` | `tφ′ = 2cos t² − 2t^{−2}sin t²`; `t²φ″ = −4t²sin t² − 6cos t² + 6t^{−2}sin t²`; `HE₁₂H^{−1} = tE₁₂` | holds; source unread | — |
| 5.4 (sample) | `O(p)` and `O` on a curve | degree `1` for `O(p)`; `O` violates 5.3(i) | `|1|² = −|z|²log|z| → 0`, so `(det H)^{−1}` grows like `|z|^{−2}`; `∂(θ∧θ) = 0` gives `d(∂̄θ) = d(θ∧θ)` | holds; source unread | — |
| 5.5 (sample) | punctured disc of radius `½` | area `4π/log 2`; infinite distance to `0` | `2·2π∫₀^{1/2}dr/(r·log²r) = 4π/log 2`; `∫dr/(r·log(1/r)) = ∞` | holds; source unread | — |
| 6.2 (sample), 6.1 | `c·log|z₁|²`, `c = ½, 3/2`; weight `2(n + k)log|z − x|` | `J = O`, `(z₁)`; `u` vanishes to order `k + 1` | `ord > c − 1`; radial exponent `2j − 2(n+k) + 2n − 1 ≤ −1` iff `j ≤ k`; AMAG Prop. 5.7, p. 37 | holds | C01 |
| 8.3 (sample) | `ℙⁿ`, `O(n+1)`, `h_FS ⊗ (Σ|ℓ_j|²)^{−n}`; repeated point | `J = m_x`, `K ⊗ L = O`; diagonal not onto | `|z|^{−2n}` not integrable in `ℂⁿ`; `−n−1+n+1 = 0`; AMAG Cor. 5.12 (p. 40) is for weakly pseudoconvex `X` | holds; narrower than source | C05 |
| 9.5 (sample) | `O(1)` and `O` on `ℙ¹` | `O(1)` big with `2πω_FS`; `O` has no such metric | `deg ≥ ε·vol/2π > 0` excludes `O`; AMAG Def. 6.16(d), p. 46, Th. 6.17(b), p. 47 | holds | — |
| 8.1 (headline) | `ℂ`, `ω = i dz∧dz̄`, `φ = a|z|²`, `g = dz∧dz̄` | `(1/(qε))∫|g|²e^{−φ}dV = (1/a)(2π/a)` | minimal `u = z̄dz` up to sign: `∫|z|²e^{−a|z|²}·2dλ = 2π/a²` | holds, sharp | — |
| 6.2, 8.2 (headline) | `ℙ¹`, `O(1)`, `h_FS^{1−a} ⊗ |s|^{−2a}` | `a < 1`: `H¹ = 0`; `a = 1`: `H¹ ≅ ℂ` | `ν = 2a < 2`, `H¹(O(−1)) = 0`; `J = O(−p)`, `H¹(O(−2)) = ℂ` | holds | — |
| 4.1, 4.3 (headline) | unit polydisc, `f = 1`; disc of radius `r` | constant `π`; `c_D(0) = 1/r`, `πr²` | mean value gives `∫|F|² ≥ π·vol`; `G = log(|w|/r)`; Suita at `0`: `1 ≤ π·(1/π)` | holds | — |
| 9.1, 9.2 (headline) | Fock space; `ℙ¹`; `dV = ½dλ` | `B = k/π`; `k^{−1}(k+1) → 1`; `2/π` | `c₁ = (1/π)dλ`; `(1/π)/(½) = 2/π` | holds | — |
| 9.2 against HeightsRationalPointsAndObstructions §5.17c | `dV = c₁ⁿ/∫c₁ⁿ` | `k^{−n}B_k → ∫c₁ⁿ/n!` | `N_k/kⁿ → ∫c₁ⁿ/n!`, so `B_k/N_k → 1`: that roadmap's `bergmanDensity_uniform` | same theorem, two owners | R01 |
| 3.2a(b) | weight 2, `S = H^{2,0}` | `k` negative definite on `S^{⊥k}` | signs `+, −, +` on `H^{2,0}, H^{1,1}, H^{0,2}`; `θ_S = −k(σv, σv)` uses the image of `σ` only | hypothesis too strong for the gloss | C04 |
| 3.2a(c) | `g = (1, z₁, z₂)` at `0`, `u_j = e_{j+1}` | `|tr M|² = 4 = 2·‖M‖²_HS`; factor `1` fails | `M = id` on the plane `S₀`: trace `2`, norm² `2`; `4 ≤ 1·2` false | holds | — |
| 3.3 remark | `X = ℂ`, `Z = {0}` | no constant `A` on noncompact `X` | `i∂∂̄log|z|² = 0` off `0`, `A = 0` | overstatement | C02 |
| 0.4(b) | `u_a` on `ℙ¹` | `sup u_a = log(1 + |a|²)`; Prop. 1.7 for closed `γ` | Cauchy–Schwarz; source: compact Kähler | holds; source narrower | C03 |
| 1.2, 1.3 | `z₁^a z₂^b` on `ℂ²` | `1/(a+b) ≤ 1/max(a,b) ≤ 2/(a+b)` | `ν = 2(a+b)`, exponent `1/max(a,b)` | holds | — |
| 2.6 | blow-ups of `ℙ²` | `(H + E)·E = −1`; `E² + E·F = −1` | `0 + (−1)`; `−2 + 1` | holds | — |
| 3.7 | `A = −1`, `φ = −|z|²`; `R = 1` | `1 − e^{−1} < 1`; `e/π` | `(1/π)e^{−1}·π(e − 1)`; minimum of `e^{R²}/(πR²)` at `R = 1` | holds | — |
| 4.2 | disc, `s = z/e`, `f = c·dz` | `C₁ ≥ 4π` | `2e²|c|²·2π∫₀^∞dt/(1+t)² = 4πe²|c|²` against `e²|c|²` | holds | — |
| 7.1, 7.3 | `φ = 2φ_D`; `φ = 0` on discs of radii `a`, `a³` | loss `2n/m`; `(log(1/a) + ½log π)/m` | doubling of AMAG Th. 14.2; `−(1/2m)(log π + 6log a) + (1/m)(log π + 2log a)` | holds | — |
| 7.4, 7.5 | `ρ = (3/π)(1 − |w|²)²`; `ν = b = 1`, `r₀ = ½` | `c_ρ = −11/12`, `m₂ = ¼`; `λ_r = 0.73, 0.85, 0.94` | `6(−¼ + ⅛ − 1/36)`; `6/24`; `1 − (¼ − r²)/log(1/(2r))` | holds; `c_ρ` reused in 7.5 | N01 |
| 7.7, fourth Check | `φ_t = −log(e + L_t)` | `i∂∂̄log(u+τ) = (uτ/(u+τ)²)iξ∧ξ̄ − (u/(u+τ))γ`; `φ_t = −1/t + o(1)` on `D` | from `∂∂̄u = u(∂∂̄log u + ξ∧ξ̄)`; `−log(e + e^{1/t})` | holds | — |
| 7.8(b) | dyadic shells; `u_b` on `ℙ¹` | constant `16`; mass `½` on `{|z| ≤ b}` | `Σ(j+1)(j+2)2^{−j} = 2/(1 − ½)³ = 16`; `r²/(r² + b²)` at `r = b` | holds | — |

- Source locators checked against the text this round: 11 (CADG 5: I Th. 5.5, 5.8, 5.11, Def. 5.22, Th. 5.24; AMAG 6: Def. 1.10, Prop. 5.7, Th. 5.11, Cor. 5.12, Def. 6.16(d), Th. 6.17(b)), and 4 further statements opened to supply missing locators (CADG VIII Th. 6.1, Th. 9.10; CADG V Th. 14.3, 14.5; AMAG Th. 5.1).
- Library declarations opened at the pins: `TauCeti.leviForm` (`TauCeti/Analysis/Complex/LeviForm.lean:119`), `TauCeti.IsManifoldStrictlyPlurisubharmonicAt` (`TauCeti/Geometry/Manifold/Complex/LeviForm.lean:343`), `TauCeti.IsStrictlyPlurisubharmonicAt` (`TauCeti/Analysis/Complex/Pseudoconvex.lean:82`), `TauCeti.SubharmonicOn` (`TauCeti/Analysis/InnerProductSpace/Harmonic/Subharmonic.lean:74`; continuous real functions, as the docstring says), `IsCompact.le_of_le_setAverage_ball_le_frontier` and its companion (`TauCeti/MeasureTheory/Integral/SubMeanValue.lean:117, 129`), `TauCeti.holomorphicStructureSheaf`, `TauCeti.SmoothAlmostComplexStructure.delBar`, `TauCeti.planarGreenKernelDisk`; Mathlib `Real.circleAverage` (`Mathlib/MeasureTheory/Integral/CircleAverage.lean:55`), `ContMDiffRiemannianMetric`, `ContMDiffSection`, `ContMDiffVectorBundle`, `HilbertBasis`, `TestFunction`, `Distribution`. Mathlib has no file mentioning subharmonic functions.
- Cross-roadmap citations resolved: on main, ComplexComparisonPartII C-1.1, C0, C1.3, C1.4 (`weightedDolbeaultEstimate`), C1.5 (`StronglyOneComplete`), C2.2, C5.4 (`CurrentCalculus`, `closedCurrentExtension`, `AnalyticCycleIntegration`, `lelongPoincareSection`, `integralLineBundleChernClass`); ComplexKahlerGeometry K2, K3, K3.0, K4, K5a, K6.0, K7.2; RealAnalyticGeometry R3.0–R3.1; ComplexHessianEquations §§5.4, 7.1; CharacteristicClasses §§4.1–4.2; AlgebraicModuliForArithmeticGeometry §§1.6, 9.10; ResolutionOfSingularitiesCharacteristicZero §§5.1, 5.2, 7.7; ArakelovGeometryAndAbelianHeights §5.1; BallQuotientsAndComplexHyperbolicLattices §9.1. At open heads: MultiplierIdealsOfPairsAndPointSeparation §§9.10b, 9.10c, 9.12, 9.12b, 9.12c; the consumers' sections named in "Downstream consumers".
- Dependency check: `depcheck: 171 roadmaps, 1992 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` of `Suggested.lean` exits 0 with no output. The file declares nothing, so the `#check` comparison and the one-tactic probe had nothing to test. Its docstring names each of the four headlines with the carriers it lacks; a statement of 4.1 would need three new definitions (plurisubharmonic functions with values in `[−∞, ∞)`, pseudoconvex domains, the Green function of a planar domain), which is more than the simple definitions the file may carry.
- Automatic checks: the worker's run passed every check; my own run flagged the two items set aside below.
- The pull request's text agrees with the head: it adds the folder, says that `Suggested.lean` declares nothing, and names MultiplierIdealsOfPairsAndPointSeparation as the one open supplier.
- No file outside the folder and the family index is changed.

Overlap check: read HeightsForLogSingularMetrics, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties, MultiplierIdealsOfPairsAndPointSeparation and RealAnalyticGeometry (open), ComplexHessianEquations, ComplexComparisonPartII and ComplexKahlerGeometry (main), and, outside the three lists, HeightsRationalPointsAndObstructions and DiscreteSeriesCoefficientsAndAutomorphicMetrics. Shared objects: the uniform Bergman asymptotic for the curvature volume, owner HeightsRationalPointsAndObstructions §5.17c (R01); multiplier ideals of pairs and Nadel vanishing for pairs, owner MultiplierIdealsOfPairsAndPointSeparation, cited; the logarithmic-growth predicate, owner ArakelovGeometryAndAbelianHeights §5.1, cited; log-log singular metrics on arithmetic varieties, owner HeightsForLogSingularMetrics §0.4, which cites 7.7–7.8 for the complex analysis; finite-point jet interpolation on Stein manifolds, owner RealAnalyticGeometry R3.1, a different statement from 3.9 (no `L²` bound, no common zero set). Nothing else is shared.

Source independence: 16 passages compared with 2 sources (the 11 locators, and the routes of 0.5, 6.2, 8.2, 8.3 and 3.10 against DemaillyCADG lines 2100–2121 and 19138–19147 and DemaillyAMAG lines 1743–1790 and 1864–1900); none shares more than forced hypothesis lists and standard names; largest share DemaillyAMAG, 14 of 21 locator citations; contents compared with DemaillyAMAG: independent (the Ohsawa–Takegoshi layer precedes multiplier ideals and Nadel vanishing follows approximation, against its sections 13, 5 and 14; Layers 5 and 9 and the division theorem of Layer 3 have no counterpart there).

Research link: Layers 4, 6 and 8 hold the Ohsawa–Takegoshi theorem with Błocki's constant (2013), Guan–Zhou strong openness (2015) and Nadel vanishing (1990); Layer 9 the Bergman asymptotics of Tian (1990) and Berman (2004); 7.7–7.8 feed arithmetic intersection theory of log-log singular metrics (HeightsForLogSingularMetrics). Rests on the README's References and Downstream consumers.

## Not verifiable

- Mumford 1977 (5.3, 5.4, both sampled): the citation resolves only to a paywalled page; the Checks of Layer 5 were recomputed, the theorem numbers were not read.
- Kobayashi 1984 and Cheng–Yau 1980 (5.5, sampled): not in the sources cache; the Check of 5.5 was recomputed.
- Donnelly–Fefferman 1983 and Berndtsson 1996 (3.8a, sampled): not in the sources cache; 3.8a is derived in its route from 3.8, and I checked that derivation and its three Checks.
- Hörmander 1965 (3.1, 3.8) and Skoda 1972, Ann. Sci. ÉNS (3.10): not in the sources cache; DemaillyCADG chapter VIII was used instead.
- Demailly 1992 (7.3, 7.4, 7.7), Błocki 2013 (4.1, 4.3), Demailly 2000 (4.2), Siu 1974, Ma–Marinescu 2007, Lazarsfeld's *Positivity*: as in the previous review, no legal copy was found; not fetched again.
- [FormalProof] repository: its host is not a recognised legal source; not opened.

Automatic checks set aside as false positives: the check for files outside the roadmap folder listed the family index (`README.md`, `Suggested.lean` and `metadata.toml` of the family folder), which this pull request carries as its own; the dependency check reported that the roadmap is not yet in the merge order, which is expected for a new roadmap placed after its last supplier.

## Source issues

- none

## For the human reviewers

- Provenance: the family index and the References cite a formal proof of the Riemann hypothesis announced on 20 November 2026 (README References, [FormalProof], [Announcement]). Two passages rest on that proof, which could not be opened: 7.8 "in this form" and the second route of 7.7.
- Licence: the host of the cited repository could not be classified, and its licence was not read (README References, [FormalProof]).
