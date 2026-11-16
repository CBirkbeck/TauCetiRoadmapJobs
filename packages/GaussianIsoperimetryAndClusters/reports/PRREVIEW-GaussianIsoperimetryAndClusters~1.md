# Review of GaussianIsoperimetryAndClusters (pull request #2420 at 1bb9eab)

**Verdict:** needs changes

## R01 (P3) — §6.4 defines `p_U` with only two Checks

**Location:** `TauCetiRoadmap/GaussianIsoperimetryAndClusters/README.md:526`: "For `z ∈ e^⊥` let `p_U(z) = Σ_{t ∈ ∂^M(U_z)} φ(t)`, the Gaussian perimeter of the section."

**Claim:** `p_U` is a definition used in §6.4–§6.6 and §7.1, but it has two Checks where three are required. Neither Check tests the choice of `∂^M(U_z)` over the topological frontier of the section, which a null addition separates.

**Witness:** README lines 530–531 are §6.4's only Checks (a half-plane, a slab); their sections' frontiers equal their essential boundaries. For `ball(0,1) ∪ ℚ²`, the section over `0` is `(−1,1) ∪ ℚ`: frontier gives `∞`, essential boundary `0.483941`.

**Repair:** Add this Check to §6.4: "- For `U = ball(0, 1) ⊂ ℝ²` and `e = e_2`, `p_U(z) = 2φ(√(1 − z²))` for `|z| < 1`, so `p_U(0) = 2φ(1) = 0.483941`, above the value `I(0.682689) = 0.356343` for the section of the symmetral. For `U ∪ ℚ²` the section over `0` is `(−1, 1) ∪ ℚ`, whose frontier `(−∞, −1] ∪ [1, ∞)` would give `∞`; its essential boundary is still `{−1, 1}`, and `p_U(0) = 0.483941`."

## R02 (P3) — The description's Dependencies paragraph names no supplier

**Location:** The pull-request description: "Dependencies (the roadmaps the README cites by name and section, and what they in turn need; the Lean imports none of them). … everything else named in the README is a consumer, not a prerequisite."

**Claim:** The paragraph announces a list of supplier roadmaps but gives none. Its last sentence also calls every other roadmap the README names a consumer, which the README contradicts.

**Witness:** README lines 105–116 consume GeometricMeasureTheory G2, G5 and G6 and Isoperimetry I4, both on main. README line 758 says RandomMatrices 2.2 and BanachSpaceTheory B7 "do not depend on this roadmap".

**Repair:** Replace the paragraph with: "Dependencies: GeometricMeasureTheory G2 (weighted coarea, tangential area formula, graph surface measure), G5 (De Giorgi's structure theorem, essential versus reduced boundary, boundary criterion) and G6 (bounded Lipschitz domains), and Isoperimetry I4 (slicing along lines, essential convexity). Both are on main, and the Lean imports neither. RandomMatrices 2.2 and BanachSpaceTheory B7 are named only to separate their concentration results from §§8.4–8.5. GaussianIsoperimetryAndClusters, Part II is the planned consumer."

## R03 (P3) — The description's prose ends in a dangling list

**Location:** The pull-request description, first prose paragraph: "… prove the Gaussian isoperimetric theorem, with its equality case, in the language of clusters. The weighted layer covers:"

**Claim:** The colon promises a list of what the weighted layer covers, but no list follows; the next paragraph starts on another subject.

**Witness:** In the description, the line after "The weighted layer covers:" begins "Roadmap folder `TauCetiRoadmap/GaussianIsoperimetryAndClusters` (README, `Suggested.lean`, `metadata.toml`)".

**Repair:** Complete the sentence: "The weighted layer covers weighted variation and perimeter by duality (§2.1), their identification with the weighted variation measure and with `e^{−W} μHE[n−1]` on the reduced boundary (§2.2), explicit perimeters (§2.3), lower semicontinuity and compactness (§2.4), the weighted Gauss–Green formula (§2.5), weighted coarea formulas (§2.6) and Gaussian invariance and cylinders (§2.7)." Alternatively, delete the clause "The weighted layer covers:".

## Verified sound

| Statement | Instances tried | Left side computed | Right side computed | Result |
|---|---|---|---|---|
| §1.3 splitting (MilmanNeeman2022 line 481–483, (2.1) line 490–497; Ledoux1993 line 251–252) | `F = ℝ(e₁+e₂)/√2 ⊂ ℝ²`; `q = 3`, `x_i ≥ 1` | `γ({x₁+x₂ < √2}) = 0.841345`; `1 − Φ(√1.5) = 0.110336` | `Φ(1) = 0.841345`; reciprocal factor gives `0.207108` | holds; source supports |
| §2.1 `weightedPerimeter` (MilmanNeeman2022 line 30–31, 753–754; CianchiFuscoMaggiPratelli2011 (2.5) line 200–208) | `U = ℝ` under `γ`; `n = 0` | weighted: `0`; `n = 0`: only `X = 0`, value `0` | `TauCeti.perimeter γ`: `∫|t| dγ = 0.797885` | discriminates; (2.5) normalization slip (Source issues) |
| §2.2 `weightedVariation_eq_lintegral_variationMeasure`, `weightedPerimeter_eq_lintegral_reducedBoundary` (MilmanNeeman2022 line 755–757; CianchiFuscoMaggiPratelli2011 line 174–208) | `U = (−1,1) ⊂ ℝ` (`μHE[0]` counting); `n = 0` | `P_γ = 2φ(1) = 0.483941` | `φ(−1) + φ(1) = 0.483941` on `{±1}`; `n = 0` excluded by `hn` | holds |
| §2.5 `integral_weightedDivergence_eq_integral_reducedBoundary` (MilmanNeeman2022 (3.1) line 705–708, (3.3) line 758–761) | `n = 1`, `U = (−∞, s)`, compactly supported `X` | `∫_{−∞}^s (X′ − tX)φ = X(s)φ(s)` | `⟨X, +1⟩φ(s)`; inner normal gives `−X(s)φ(s)` | holds; sign pinned |
| §2.6 `weightedVariation_eq_lintegral_weightedPerimeter` | `u(t) = t` on `ℝ`; `u = χ_U`; `u ∉ BV_loc` | `∫ φ d|Du| = 1`; `P_μ(U)`; `∞` | `∫ φ(s) ds = 1`; `∫₀¹ P_μ(U) = P_μ(U)`; `∞` | holds |
| §2.7 cylinders (MilmanNeeman2022 line 481–483, 554–556) | `F = ℝe₁ ⊂ ℝ²`, `U = (−∞,s)`; `F = {0}` | `φ(s)`; `0` | `φ(s)`; `0` | holds |
| §3.5 `exists_cluster_perimeter_eq_isoperimetricProfile` | `q = 1`; zero space; weight `0` on `ℝ` | `(E)`, perimeter `0`; `(1/2,1/2)`: no cluster | profile `0`; `∞` (excluded by `Nontrivial E`); no compactness (excluded by `hμ`) | holds |
| §4.1 `modelInterfaceArea` (MilmanNeeman2022 line 499–505) | `q = 2`, `x = tu`; `q = 3`, `x = 0` | `A₁₂(tu) = φ(t)` (`μHE[0]` × density) | `3 · 0.199471 = 0.598413` = tripod perimeter | holds; Lean set = `∂Ω_i ∩ ∂Ω_j` |
| §4.2 simplicial clusters (MilmanNeeman2022 line 76–82) | centres `±1` in `ℝ`, `λ = 2, −1, 0` | cell `(−∞,0)`; same / swapped / empty | interior of closed Voronoi cell = strict inequalities | holds; `λ > 0` needed |
| §4.3 `modelMeasureMap_diffeomorph` | `q = 2`, `t = 0.7`; `q = 3`, `x = 0`; tie `y−x = (1,1,−2)` | `dΨ₁ = −φ(0.7) = −0.312254` | `−(L_A u)₁/√2 = −0.312254`; `DΨ(0) = −0.423142 Id`; `Ψ₁(y) < Ψ₁(x)` | holds |
| §4.5 boundary (MilmanNeeman2022 Lemma 2.3 line 558–564, proof 577–659) | `v → (1/2,1/2,0)`; vertex | `I_m^{(2)} → 0.398942`; `0` | `I_m^{(1)}(1/2,1/2) = φ(0) = 0.398942`; `I_m^{(0)}(1) = 0` | holds |
| §4.6 `modelProfile_hessian` | `q = 2`, `x = tu`; `q = 3`, `x = 0` | `Dg(0)u = t/√2`; `H(L_A u,u) = 2φ(t)·(−1/(2φ(t))) = −1` | `⟨x,u⟩/√2 = t/√2`; `−⟨u,u⟩ = −1`; `∇² = −1.671086 Id`, trace identity `1.196827` | holds |
| §4.7 `isoperimetricProfile_le_modelProfile` (MilmanNeeman2022 line 660–666) | `q = 1`; `q = 0`; `ℝ`, `q = 3` | `(E)`: `0`; `Σv = 1` impossible; three intervals `0.727200` | `modelProfile 1 (1) = 0` (`Ψ(0) = (1)`); excluded by `q ≤ n+1` vs `0.598413` | holds |
| §6.1 `gaussianSymmetral` (CianchiFuscoMaggiPratelli2011 line 543–552; Ehrhard1983 Déf. 1.1 line 117–129) | `{⟨x,e⟩ < 1}`; disc; Ehrhard's `H(u,a) = {⟨x,u⟩ > a}` | sections `Φ(1) = 0.841345`, fixed; section over `0`: `(−∞, 0.475233)` | Ehrhard's rule = `S_{F,−u}` (`a = −Φ⁻¹(v)`) | holds; conventions match |
| §6.3 (CianchiFuscoMaggiPratelli2011 Lemma 4.4 line 605–618) | `{x₂ < 1 + x₁}`, `B = e^⊥` | `∫ e^{−W} d|Dv| = 0.219696` | `P_γ = φ(1/√2) = 0.310697`; (4.8) gives `√(2π)·bφ`, true `v′ = bφ` | holds as stated |
| §6.4 (CianchiFuscoMaggiPratelli2011 Lemma 4.6 line 781–828); R01 | tilted half-plane; disc section `z = 0` | `0.310697` both sides; `p_U(0) = 0.483941` | source normalization with true gradient: `0.592901 < 0.778801` | holds; Check gap R01 |
| §6.6 `gaussianPerimeter_gaussianSymmetral_le` (CianchiFuscoMaggiPratelli2011 Thm 4.3 line 583–588, proof 833–846) | disc `ℝ²`; `n = 1`, `(−1,1)`; oscillating set | `0.517483` (θ-substitution quadrature); `0.356343`; `0.195467` | `0.606531`; `0.483941`; `∞` | holds |
| §7.3 `gaussian_isoperimetric` | disc; `∅`; `n = 0`; half-space `s` | `0.606531`; `0`; `0`; `φ(s)` | `I(0.393469) = 0.384633`; `I(0) = 0` (disjunct needed); `I(0 or 1) = 0`; `I(Φ(s)) = φ(s)` | holds both directions |
| §7.4 `isoperimetricProfile_two_eq`, `Cluster.perimeter_eq_iff_halfSpaces` (MilmanNeeman2022 line 98–102, 83–84) | `v = (1,0)`, `(1/2,1/2)`; zero space | `0`; `0.398942`; `∞` | `I(1) = 0`; `I(1/2) = 0.398942`; excluded by `Nontrivial E` | holds |
| §8.1 `borell_sudakov_tsirelson` | disc, `r = 1`; `n = 0` | `γ(ball(0,2)) = 0.864665`; `A = {0}`: `1` | `Φ(0.729712) = 0.767217`; `≤ 1` | holds |
| §8.1 `borell_sudakov_tsirelson_multivariateGaussian` | `S` not PSD; `S = diag(1,0)`, `A = (−∞,0]×{0}` | `δ_m(A) = 1` (`m ∈ A`); `Φ(r)` | `Φ(a+r) ≤ 1`; `Φ(r)` | holds; equality case |
| §8.2 `gaussian_minkowskiContent_ge` | `{x₁<0} ∪ ℚ²`; Bernstein `A ⊂ (−∞,0)`; `∅` | `0.5/r → ∞`; `(Φ(r)−½)/r = 0.398936` at `0.01` | `0.398942`; `0.398942`; `0` | holds |
| §8.3 `bobkov_inequality` | `f = Φ`; `f = min(x²,1)`; `n = 0` | `I(1/2) = 0.398942`; `I(0.516059) = 0.398619`; `I(c)` | `0.398942`; `0.647406`; `I(c)` | holds |
| §8.4 `gaussian_concentration_median` | `f = x₁`, `r = 2`; `L = 0`; `r = 0` | `0.022750`; `{f > m} = ∅`; `≤ 1/2` | `1 − Φ(2) = 0.022750`; `≥ 0`; `1 − Φ(0) = 1/2` | holds |
| §8.5 `gaussian_max_concentration` (Ledoux1999 line 252–263, (1.8) line 266–271) | `S = I₂`, `r = 2`; `S = [[1,2],[2,1]]` | median `0.544952`, tail `0.010899`; `δ₀`: `0` | `0.022750`; `m ≥ 0` forced | holds; Lipschitz constant `‖K_i‖ = √S_ii` |
| §9.5 `ehrhard_inequality_convex` | `[−1,1]`, `[−3,3]`, `θ = ½`; `θ = 0` | `γ([−2,2]) = 0.954500` | `Φ(1.628704) = 0.948312`; `Φ(b) ≤ γ(B)` | holds |
| §9.5 `convex_closedGaussianSymmetral` | `{x₁>0} ∪ ({0}×[0,∞))`, `F = ℝe₂`; closed ball `ℝ³` | `v_C(0) = ½`, symmetral `{x₁>0} ∪ ({0}×(−∞,0])` | convex; `{x₃ ≤ −0.846102}`, `γ = 0.198748` | holds |

- Source locators: the 15 sampled targets (31 locators) and 12 more (MilmanNeeman2022 line 57–70, 182–187, 697–701, 888–922; CianchiFuscoMaggiPratelli2011 line 220–232, 886–935; Ehrhard1983 line 60–66, 134–140, 212–295, 364–420; Borell1975 line 85–99; Ledoux1999 line 200–247, 294–313) all match their texts.
- Library: 108 backticked Mathlib and Tau Ceti names resolve at the pins; 53 file:line pairs match. 25 statements were opened and match the contracts, among them `TauCeti.totalVariationOn` (TotalVariation.lean:100), `TauCeti.reducedBoundary` (ReducedBoundary.lean:95), `TauCeti.variationMeasure` (VariationMeasure.lean:136), `MeasureTheory.Measure.quantile` (Quantile.lean:164), `TauCeti.perimeter_setOf_inner_lt`, `Convex.perimeter_lt_top`, `TauCeti.ae_perimeter_inter_ball_le`, `TauCeti.Probability.stdGaussian_eq_withDensity_norm`, `TauCeti.Probability.map_orthogonalProjectionOnto_stdGaussian_pi` and `ProbabilityTheory.stdGaussian`/`multivariateGaussian`.
- Cross-roadmap citations: GeometricMeasureTheory G2, G5 and G6, Isoperimetry I4, RandomMatrices 2.2 and BanachSpaceTheory B7 resolve on main and state what is cited. No gaps are declared.
- Gate: every check passes. The dependency check prints `depcheck: 234 roadmaps, 2228 edges, 0 problem(s)`. The outside-folder diff is empty.
- Elaboration: `lake env lean` on `Suggested.lean` gives 20 warnings, all `sorry`. All 37 elaborated signatures were compared with the README statements, and none changed. The 3 dropped-binder leads are harmless: `gaussianWeight` needs only the inner product, and `stdGaussian` needs only `MeasurableSpace`.
- Padding probe: `rfl`, `infer_instance`, `simp` and `norm_num` were tried on all 20 theorems in a scratch copy, and none closes. No declaration restates a definition or mirrors a Check.
- Check values and ownership: more than 40 README numbers were recomputed independently (quadrature, bisection quantiles, exact Hessians of `g`), and all agree to six places. Gaussian isoperimetry, Ehrhard, Bobkov, Borell–Sudakov–Tsirelson, weighted perimeter, clusters and Gaussian tail bounds were searched across 444 open heads, main and both pins, and nothing else states them.

Overlap check: read MathematicalStatisticsAsymptotic, MathematicalStatisticsNonparametric, MathematicalStatisticsSemiparametric, MathematicalStatisticsHighDimensional, Isoperimetry, GeometricMeasureTheory and OptimalTransport. Nothing is shared: De Giorgi theory and coarea belong to GeometricMeasureTheory G2/G5/G6, and slicing and essential convexity to Isoperimetry I4. Both are cited, not restated.

Source independence: 27 passages compared with 6 sources, none shared beyond forced formulas and dozen-word statements; largest share MilmanNeeman2022, 28 of 97 source citations. Contents compared with MilmanNeeman2022 §§1–12: independent (Layer 4 ↔ §2 and Layers 2–3 ↔ §§3–4, in reverse order, Layers 5–9 with no counterpart). Contents compared with CianchiFuscoMaggiPratelli2011: §§2–4.2 ↔ Layers 2, 5, 6 and 7 in the order the *Needs:* lines force, with Layers 3–4 between them and §6.4/§6.5 swapped against Lemmas 4.5/4.6.

## Not verifiable

- Bobkov1997 Corollary 1, (10), p.209 (§8.3, `bobkov_inequality`): the cached author-page copy is unreadable OCR, and the Project Euclid page returned no text. The statement matches Ledoux1999 (1.11), line 296–313.
- SudakovTsirelson1974 Theorem 1, CarlenKerce2001 Theorem 1, AmbrosioFuscoPallara2000 Theorem 3.108 and Bogachev1998 Chapter 4 are settled as uncertified and were not read. CianchiFuscoMaggiPratelli2011 line 526 cites the Ambrosio–Fusco–Pallara theorem as Vol'pert's.
- Maggi2012 Theorem 15.9, Proposition 12.15, Theorem 12.26 and Exercise 29.7: only the author's extract (contents and synopsis) is cached. Its chapter titles (15, 12.1, 12.4, 29) are consistent, and MilmanNeeman2022 line 756 cites the same Theorem 15.9.

## Source issues

- **Misprint** in CianchiFuscoMaggiPratelli2011 at equation (2.5), p.5: the source gives the duality formula against the probability measure `γ_n`, which equals their perimeter (1.2) divided by `√(2π)`; it should integrate against `(2π)^{−(n−1)/2} e^{−|x|²/2} dx`; affects a stated result.
- **Error** in CianchiFuscoMaggiPratelli2011 at equation (4.8), Lemma 4.4, p.12: the source gives the derivative of `v_E = γ_1(E_z)` with section weight `e^{−y²/2}`; it should be `(2π)^{−1/2} e^{−y²/2}`, so (4.9), (4.6) and the equality case of (4.14) carry `√(2π)`; affects a stated result.
- **Error** in CianchiFuscoMaggiPratelli2011 at inequality (4.10), Lemma 4.5, p.13: the source scales the left side and the section term by `√(2π)` but not the variation term, and the half-plane `{x₂ < 1 + x₁}` gives `0.778801 ≤ 0.770391`; the variation term should carry the factor `√(2π)`; affects a stated result.
- **Gap** in MilmanNeeman2022 at the proof of Lemma 2.1, p.11: the source asserts that `y` lies in an open cell `x + Ω^m_i`, which fails when the largest coordinate of `y − x` is attained twice; it should take `i` maximizing `(y − x)_i`, which gives `y + Ω^m_i ⊊ x + Ω^m_i`; affects the proof.

## For the human reviewers

- none
