<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13761#issuecomment-6897381008 -->
Review (claude) of 3b70275

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) two Mathlib inputs named in *Needs:* lines are missing from the supplier contract

   **Location.** `packages/GaussianIsoperimetryAndClusters/design/README.md` lines 40–51 (`### From Mathlib`), against line 159 (§2.1: "*Needs:* … Mathlib `ContDiffBump`"), line 417 (§5.1) and line 542 (§7.2: "Mathlib `Besicovitch.ae_tendsto_measure_inter_div`").

   **Claim.** The contract lists, by name, every pinned declaration the layers consume (the pattern of round 7's F02).

   **Witness.** A script comparing the backticked library names of the layers with those of the contract section returns exactly two absentees: `Besicovitch.ae_tendsto_measure_inter_div` (Mathlib/MeasureTheory/Covering/Besicovitch.lean:1104) and `ContDiffBump` (Mathlib/Analysis/Calculus/BumpFunction/Basic.lean:70).

   **Exact repair.** Add two bullets under `### From Mathlib`:

   - "`Besicovitch.ae_tendsto_measure_inter_div` (Mathlib/MeasureTheory/Covering/Besicovitch.lean:1104): for a locally finite measure on a finite-dimensional real normed space and an arbitrary set `s`, almost every point of `s` is a density point, the ratios being taken over closed balls of radius tending to `0`. It gives the Lebesgue points of §5.1 and the density-one points of §7.2."
   - "`ContDiffBump` (Mathlib/Analysis/Calculus/BumpFunction/Basic.lean:70): smooth bump functions with prescribed inner and outer radii, used with their normalized form as mollifiers in §2.1."

   No plan change: both are already prerequisites there (`plan.json` lines 175, 1050, 1463). Re-running the comparison after the two bullets returns no absentee.

2. **F02** (P3) §6.5 cites Lemma 4.5 without saying that its printed inequality (4.10) does not transfer between the two normalizations

   **Location.** `design/README.md` line 504: "`P_γ(S_e(U); B ⊕ ℝ e) ≤ ∫_B e^{−W_{e^⊥}} d|Dv_U| + ∫_B I(v_U(z)) dγ_{e^⊥}(z)` … (CianchiFuscoMaggiPratelli2011 Lemma 4.5, line 624–779)"; Conventions line 23: "every inequality homogeneous in perimeter transfers unchanged".

   **Claim.** The cited lemma supports the statement after the change of normalization described in the Conventions.

   **Witness.** (4.10) is not homogeneous in perimeter (its first term is a variation of `v_E`). With the source's own `P_γ = H^{n−1}_γ(∂^M E)` (line 185–196), the half-plane `{x_2 < 1 + x_1}` gives `e^{−1/4} = 0.778801` on the left and `0.219696 + √(2π) · 0.219696 = 0.770391` on the right.

   **Exact repair.** The README's statement is correct as it stands (same instance: `0.310697 ≤ 0.219696 + 0.219696`; it is the bound `√(a² + b²) ≤ a + b` under §6.4). Only the locator needs the remark that §6.3 already makes for (4.8):

   - Replace the locator by "(CianchiFuscoMaggiPratelli2011 Lemma 4.5, line 624–779, where (4.10) is printed with the surface-normalized perimeter on the left and in the section term but without the matching factor `√(2π)` on the variation term; the form here is the one their proof, run against the probability measure, yields)".
   - Append to the second Check of §6.5: "In the source's normalization the same half-plane has perimeter `e^{−1/4} = 0.778801`, section term `0.550695` and variation term `0.219696`: the inequality as printed, `0.778801 ≤ 0.770391`, fails, and holds once the variation term carries `√(2π)` (`0.778801 ≤ 1.101390`)."
   - In §6.3, after "(4.7)–(4.8), line 605–618", add "(4.7) as printed is weaker than the bound here by the same factor `√(2π)`". Mirror the Check in the plan's tests of 6.5.

   Tested on the witness: with the factor, `0.550695 + 0.550695 = 1.101390 ≥ 0.778801`; dividing by `√(2π)` gives the README's `0.439391 ≥ 0.310697`.

Two findings, both P3 (no P1, no P2). Each asks for a repair of the text, so the verdict asks for changes: a fix round applies R01 and R02. The three round-7 findings are repaired. The README, plan and manifest were left unchanged; no source was fetched and no manifest entry was added. There are no maintainer notes and no declared supplier gaps.

## Repairs of the previous round

| Round-7 finding | Disposition | Repaired passage and my check |
|---|---|---|
| F01 (P3), §7.2 "almost every nearby section" | **Repaired** | Line 542: "the base points … whose section in direction `e` meets `H` in a null set inside `C_ρ(x_1)` or inside `C_ρ(x_2)` fill a proportion at most `2ε` of that ball … Density one at a point does not make almost every nearby section meet `H` (Checks), so the argument uses only this proportion bound." Recomputed: `|B_i| · 2ρ ≤ |C_ρ(x_i) ∖ H| ≤ ε · |base| · 2ρ`; a half-line `(−∞, c)` of positive length in the window about `t_2` has `c > t_2 − ρ`, a half-line `(c, ∞)` of positive length about `t_1` has `c < t_1 + ρ`, so each contains `(t_1 + ρ, t_2 − ρ)`; the window about `t_y` lies inside once `ρ ≤ min(t_y − t_1, t_2 − t_y)/2`. A convex set with a point on its own boundary has density at most `1/2` there, so the closing sentence on openness holds. |
| F02 (P3), §1.1 pinned derivative and quantile not cited | **Repaired** | Lines 61 and 64 name `TauCeti.Probability.hasDerivAt_cdf_gaussianReal`, `TauCeti.Probability.quantile_gaussianReal_zero_one`, `Real.erfInv`, `Real.hasDerivAt_erfInv`; line 110: "the closed form `Φ⁻¹(v) = √2 erfInv(2v − 1)` makes `Φ⁻¹` differentiable on `(0, 1)`, and the chain rule applied to `Φ(Φ⁻¹(v)) = v` with `Φ′ = φ` gives `(Φ⁻¹)′ = 1/φ(Φ⁻¹) = 1/I`". Opened at the pin: Cdf.lean:226 (`HasDerivAt (cdf (gaussianReal m v)) (gaussianPDFReal m v x) x`, `v ≠ 0`), Gaussian/Quantile.lean:72 (`u ∈ Ioo 0 1`), Erf.lean:250 (`erfInv`, junk `0` outside `(−1, 1)`, namespace `Real`), Erf.lean:376 (derivative `√π/2 · exp(erfInv y ^ 2)`). `TauCeti.Real.continuous_erf` (Erf.lean:115) is in `TauCeti.Real`, as written. |
| F03 (P3), *Needs:* lines of §3.3 and §7.1 | **Repaired** | Line 270: "*Needs:* §2.1 (comparison of weighted and Euclidean variation on relatively compact open sets), §3.2; …"; line 533: "*Needs:* §3.5, §5.3, §6.1 (…), §6.2 (good points), §6.4 (…), §6.6." A script comparing every *Needs:* line with the plan's `target:` prerequisites finds them equal for all 46 targets (8.3 is split in the plan into 8.3 and 8.3.1, whose union is the README line). |

None was marked not actionable. **Adversarial pass on the changed text.** New Check of §7.2: the strips `{|x_1 − 2^{−k}| < 4^{−k}}`, `k ≥ 2`, are disjoint (`k = 2`: `(0.1875, 0.3125)`; `k = 3`: `(0.109375, 0.140625)`); a strip meeting `ball(x, ρ)` has `2^{−k} < 4ρ/3`, so the area is at most `4ρ · (64/27)ρ² = (256/27)ρ³`; exact covered fraction `0.166835` at `ρ = 1/4` and `0.032981` at `ρ = 1/16` (chord integration), bound `0.188628`; empty sections over `(−ρ, ρ)`, `ρ = 2^{−m}`: `4^{−m} + (2/3)4^{−m} = (5/3)4^{−m}`, proportion `(5/6)ρ`, `0.208333` and `0.052083`. §1.1 route: `d²I/dv²(0.3) = −2.876104 = −1/I(0.3)`, `I′(0.3) = 0.524401 = −Φ⁻¹(0.3)`. **Pattern search.** F02's pattern (a pinned input used but absent from the contract) recurs twice: R01. F01's pattern ("almost every", "nearby", "density one") and F03's (routes against *Needs:*) were searched in the remaining sections of the sample and found nowhere else.

## Verified sound

**Coverage.** Whole README (735 lines, nine layers), plan (46 targets: 10 definitions, 36 theorems; every `target:` prerequisite points backwards; `gaps` empty; no definition with fewer than three tests), manifest (13 works, one key each, every cited work recorded). Principles: weighted theory for every positive `C¹` density on intrinsic finite-dimensional inner product spaces; no route-specific restriction, no re-planned roadmap, no upward or cyclic supply, no copied passage, no algorithm, no `set_option`, no sorry'd data. There is no `Suggested.lean` at the design stage. **Elaboration: not available (this lane does not elaborate; say so in the report).** The one-tactic probe and the `#check` binder audit therefore do not apply.

**Dependency gate** (command of the brief):

```text
candidate: GaussianIsoperimetryAndClusters is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2232 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

**Source sample** (the 15 seeded targets; the author flagged no locator as unverified). Read at the cited lines of the cached texts:

| Target | Lines read | Result |
|---|---|---|
| 1.1 | MilmanNeeman2022 line 180–187; Ledoux1999 line 212–217; CianchiFuscoMaggiPratelli2011 line 46–57 | `I = φ ∘ Φ⁻¹`, equation (1.1); `γ_s(∂H) = φ(a)`; their `I(r) = e^{−Φ⁻¹(r)²/2}` with `I(0) = I(1) = 0` |
| 2.3 | MilmanNeeman2022 line 30–33; CianchiFuscoMaggiPratelli2011 line 48–56, 174–184 | agreement with `γ^{n−1}(∂U)` for nice sets; half-space perimeter `e^{−s²/2}` there; converse criterion |
| 2.5 | MilmanNeeman2022 line 705–708, 758–761 | (3.1) weighted divergence; (3.3) for `C¹_c` fields and locally finite perimeter. Maggi2012 Theorem 15.9: not readable (below) |
| 2.6 | Maggi2012 line 78–79, 99–101 (contents) | Sections 13.1 and 18.1 are the coarea formula and its refinement; their text is not in the extract |
| 2.7 | MilmanNeeman2022 line 480–483, 554–556 | product with `ℝ^{n−q+1}` and orthogonal invariance |
| 4.4 | MilmanNeeman2022 line 548–557 | Definition 2.2 on `int Δ`, `I_m^{(0)}(1) = 0`, agreement with arbitrary simplicial clusters |
| 4.6 | MilmanNeeman2022 line 669–695, 200–207 | Proposition 2.4 and its proof; (1.3), (1.4) |
| 6.5 | CianchiFuscoMaggiPratelli2011 line 624–779, 185–196 | Lemma 4.5 and its proof; (4.10) as printed (R02) |
| 7.3 | CianchiFuscoMaggiPratelli2011 line 506–509; MilmanNeeman2022 line 47–52, 83–84; Ledoux1999 line 212–219; Borell1975 line 85–99 | Theorem 4.1 for `n ≥ 2`; uniqueness attributed to Carlen–Kerce; (1.4); Theorem 3.1 |
| 8.1 | Borell1975 line 88–99; Ledoux1993 line 238–258; Ledoux1999 line 220–247; Ehrhard1983 line 356–359 | (3.1) for measurable `A`, closed unit ball; "ou seulement `≥`"; (1.5) and (1.7) with `K = M(B_2)`; Théorème 2.4 for Borel sets and `r ≥ 0` |
| 8.2 | Ledoux1999 line 205–219 | (1.3) with open neighbourhoods and (1.4) |
| 9.1 | Ehrhard1983 line 60–66, 117–140, 329–355 | open half-space `{⟨x, u⟩ > λ}`; Définition 1.1; Proposition 1.2; Lemme 2.2; Corollaire 2.3 |
| 9.2 | Ehrhard1983 line 377–439 | one-dimensional case of Théorème 3.1 and Lemme 3.3 (statement legible; the proof's displays are not) |
| 9.3 | Ehrhard1983 line 212–295, 440–457 | Exemple 1.4 (`u_0`, `u_1`, orthogonality to `u_{j−1} + u_0`, `⟨u_j, u_0⟩ < 0`), Proposition 1.5, Théorème 1.6, the two-dimensional case with the added disc |
| 9.5 | Ehrhard1983 line 374–376, 458–469 | Théorème 3.2 for nonempty convex Borel sets; proof by the convex hull in `ℝ^{n+1}` |

**Adversarial table** (my own computation, double precision: bisection on `erfc`, midpoint and Simpson quadrature, closed-form Hessian of `g`).

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| 1.1 (sampled) | `v = 1/2`, `1 − Φ(1)`, `1/3`, `0.3`; levels `0`, `1` | `0.398942`, `0.241971`, `0.363600`, `Φ⁻¹(1/3) = −0.430727`; second difference `−2.876104 = −1/I(0.3)`; `I′ = 0.524401`; quantile junk `0` at both ends would give `φ(0)` | sound |
| 2.3 (sampled) | ball `n = 1, 2`; half-space `n = 1`; `C = ∅`; dense null set added | `2φ(1) = 0.483941`; `e^{−1/2} = 0.606531`, `γ = 0.393469`, `I = 0.384633`; `ν^⊥ = {0}` gives `φ(s)`; `0 = 0`; frontier term `∞` | sound |
| 2.5 (sampled) | `U = {x_1 < s}`, `w = e_1`; `U = E`; cutoff limit | `γ(U + te_1) = Φ(s + t)`, derivative `φ(s) = ⟨e_1, e_1⟩φ(s)`; `−∫x_1 dγ = 0`; `div_μ(χ_R X) = χ_R div_μ X + ⟨∇χ_R, X⟩`, dominated by `|div X| + |⟨∇W, X⟩|` and `‖X‖_∞` | sound |
| 2.6 (sampled) | `f = ‖x‖` on `ℝ²`; `u = χ_U`; `u(t) = t`; `u ∉ BV_loc` | `1 = ∫_0^∞ r e^{−r²/2} dr`; `∫_0^1 P_μ(U) dt`; `∫φ = 1` both sides; both sides `∞` through the lower comparison of §2.1 | sound |
| 2.7 (sampled) | `F = ℝe_1 ⊂ ℝ²`; `F = E`; `F^⊥`-component | `φ(s)` both sides; identity; `∫_{F^⊥} div_{γ_{F^⊥}} X_⊥ dγ = 0`, averaged `F`-component has norm `≤ 1` | sound |
| 4.4 (sampled) | wrong centre at `v = (Φ(1), 1 − Φ(1))`; `q = 3` centre | `t = 0.482734`, `φ(t) = 0.355065` against `φ(1) = 0.241971`; `3A = 0.598413 > I(1/3) = 0.363600` | sound |
| 4.6 (sampled) | `q = 2`; `q = 3` centre | along `u`: `I′(v_1)/√2 = ⟨Ψ⁻¹(v)/√2, u⟩`, `I″/2 = −1/(2A_12)`; `L = 3A·Id` since `Σ_{i<j}(a_i − a_j)² = 3‖a‖²` on `E^{(2)}`; `−1/(3A) = −1.671086`; `6A = 1.196827` | sound |
| 6.5 (sampled) | half-plane `{x_2 < a}`; `{x_2 < 1 + x_1}`; unit disc | `0 + φ(a)`; `0.219696 + 0.219696 = 0.439391 ≥ 0.310697`, `≤ 0.621393`; `0.386129 + 0.252249 = 0.638378`, between `0.517483` and `1.213061`; `e`-component `X_e(c)φ(c)` | statement sound; locator note R02 |
| 6.6 | unit disc | `∫ √(I(v_U)² + v_U′²) φ dz = 0.517483` | sound |
| 7.3 (sampled) | disc, slab, `∅`, `E`; `n = 1`, `ν = ±1` | `0.606531 > 0.384633`; `0.483941 > 0.356343`; `0 = I(0)`; `0 = I(1)`; `(−∞, s)` and `(−s, ∞)` | sound |
| 8.1 (sampled) | half-space; disc `r = 1`; `A = ∅`; `r = 0`; `S = 0`; `ι` empty; pushforward inclusion | `Φ(a + r)` both; `a = −0.270288`, `0.864665 ≥ 0.767217`; no real `a`; `γ(closure A) ≥ Φ(a)`; `δ_m(A) = 1` forced; zero space: `0 ∈ A`, measure `1`; `m + K(T⁻¹A) + rK(ball) ⊆ A + rK(ball)` | sound |
| 8.2 (sampled) | half-space; disc; `ℚ²`; `γ(A) ∈ {0, 1}`; `A = ∅` | `φ(a)`; `0.606531 ≥ 0.384633`; `1/r → ∞`; quotient `≥ 0 = I`; `0 ≥ 0` | sound |
| 9.1 (sampled) | disc; ball in `ℝ³`; composition; hypothesis against Corollaire 2.3 | `−0.270288`; `0.198748`, `−0.846102`; second-step section measure `∫ v_C(n + g_2) dγ(g_2) = γ_{F_1+F_2}(C_n)`, independent of `g_1`; `T_i ⊖ (T_1 ∩ T_2) = G_{3−i}`, so the two orthogonality conditions agree | sound |
| 9.2 (sampled) | Hessian of `g` at `(−1, 1)`, `(0, 2)`, `(−3, −0.5)`, `(0.5, 0.6)`; limits | `−0.459912` twice, determinants `0.163502`, `0.015519`, `0.000142`, `15.648788`; `g(−1, 1) = 0.475233`; `Φ⁻¹(1 − Φ(a)) = −a` | sound |
| 9.3 (sampled) | directions; half-plane; disc; unbounded `C` | `90°`, `135°`, `157.5°`; fixed; `0.270288`; closure of `⋃_R {Φ(t) ≤ v_R(x)}` is `{Φ(t) ≤ v_C(x)}` (points with `Φ(t) = v_C(x) > 0` are limits from below) | sound |
| 9.5 (sampled) | `[−1, 1]`, `[−3, 3]`; `λ = 0, 1`; `γ(A) = 1`; `λ = 0.9` thickening | `1.690143 ≥ 1.628704`; `0.954500 ≥ 0.948312 ≥ 0.825134`; `0·A = {0}`; a convex set of full measure is `E`; `0.561033 + 0.993113 = 1.554146`, limit `1.475233` | sound |
| 7.2 (repaired) | strip set; half-lines | see the repairs section | sound |
| 1.2, 8.5 | `r = 1, 2`; two normals | `0.158655 < 0.241971`, `≤ 0.303265`; `0.022750 ≤ 0.067668`; `0.544952`, `0.010899 ≤ 0.022750` | sound |

For the sections outside the sample that no repair touched I rely on the round-7 table, whose rows carry computed values (Conventions, 2.1, 3.3, 4.1, 4.3, 5.2, 6.2, 7.1, 7.4, 8.3, 8.4, 1.3, 4.7).

**Pinned libraries.** `lake-manifest.json` pins Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`; the package checkouts are at those commits and the plan baseline equals them. All 74 library names backticked in the README were located by a script at the pins, at the file and line the README gives wherever it gives one (25 Mathlib, 49 Tau Ceti, the four names added last round included). Opened and read: `TauCeti.Probability.hasDerivAt_cdf_gaussianReal` (Cdf.lean:226), `TauCeti.Probability.quantile_gaussianReal_zero_one` (Gaussian/Quantile.lean:72), `Real.erfInv` (Erf.lean:250), `Real.hasDerivAt_erfInv` (Erf.lean:376), `MeasureTheory.Measure.cdf_quantile` (Quantile.lean:340: continuity, `0 < t < 1`), `MeasureTheory.Measure.quantile_cdf` (line 359: strict monotonicity on the preimage of `(0, 1)`), `Besicovitch.ae_tendsto_measure_inter_div` (Besicovitch.lean:1104: arbitrary set, locally finite measure, closed balls).

**Duplication by object at the pins.** No file of either library mentions Ehrhard, Bobkov, Sudakov, a weighted or Gaussian perimeter, or a Gaussian isoperimetric statement; the `BoundedVariation` files that match "isoperimetric" are Euclidean. Tau Ceti's Gaussian directory has the projection laws of `Projection.lean` (cited) and `map_inner_multivariateGaussian` (Transforms.lean:178, for `multivariateGaussian` on `EuclideanSpace` with positive semidefinite `S`), but no half-space measure for `stdGaussian` on an abstract `E` and no binary product under addition: §1.3 restates nothing. (Mathlib's `isGaussian_stdGaussian` and `variance_dual_stdGaussian`, Multivariate.lean:107 and 82, offer a second route to the law of `⟨x, ν⟩`; a route is not mandatory, so this is a remark.)

**Cross-roadmap citations**, resolved on main (`1a19c9f`): GeometricMeasureTheory G2 (`TauCetiRoadmap/GeometricMeasureTheory/README.md:148`; tangential area formula 167–168, weighted coarea 170–175, graph surface measure 177), G4 (line 210; convolution estimates 215), G5 (line 248; De Giorgi 256–261, essential versus reduced boundary 264–265, converse criterion 265–266), G6 (line 275); Isoperimetry I4 (`TauCetiRoadmap/Isoperimetry/README.md:223`; standing set `0 < |E| < ∞`, `P(E) < ∞` at 237, measure-preserving `e⊥ × ℝ` at 242–244, slicing theorem 247–249), I1 (104), I2 (144); RandomMatrices 2.2 (`TauCetiRoadmap/RandomMatrices/README.md:503`, mean-centred Herbst bound at 509–510); BanachSpaceTheory B7. All on main, none on the never-cite list. `scratch/citations.md` lists nothing unresolved.

**Ownership and overlaps.** `scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is dropped, no id is defined only by a revision, no second copy. `roadmaps grep` over main and the 475 open heads (index of 2026-11-15) for Ehrhard, Gaussian isoperimetr, Bobkov, Sudakov, Gaussian perimeter, isoperimetric profile, double-/multi-bubble, median concentration: no match. "weighted perimeter": a hexagon weight in TensorProductCombinatorics. "Gaussian concentration": one proof remark in the open MathematicalStatisticsHighDimensional, which owns sub-Gaussian and matrix concentration, not Lipschitz concentration under `γ`. GeometricCurrents owns weighted coarea on rectifiable sets for slicing currents (its line 360), a different object from the `e^{−W}`-weighted perimeter. Isoperimetry's "weighted" inequalities are the `θ`-weighted Brunn–Minkowski forms. The board-package index lists AnalyticNumberTheory and LawrenceVenkateshMethod only. This roadmap is the owner of weighted perimeter for `C¹` densities, Gaussian clusters, Gaussian symmetrisation and the Gaussian isoperimetric theorem.

Overlap check: read Isoperimetry, GeometricMeasureTheory, GeometricCurrents (main) and MathematicalStatisticsAsymptotic, MathematicalStatisticsNonparametric, MathematicalStatisticsFoundations, MathematicalStatisticsSemiparametric, MathematicalBilliards (open); nothing shared.

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, nine layers each ending with Examples and Dependencies, Downstream consumers, References. Every definition (1.1, 2.1, 3.1, 3.4, 4.1, 4.2, 4.4, 6.1, 8.3, 9.1) has an API list and at least three Checks; every theorem section has its hypotheses in the sentence, a locator and a *Needs:* line. No LaTeX delimiters, target tables, pull-request numbers, dates, machine paths or job ids. No backticked name is presented as this roadmap's own declaration. The layer-dependency paragraphs agree with the *Needs:* lines (checked for Layers 4, 7, 8, 9 and the G5/G6 sentence of "How to read the build").

**Headline theorems** (for the package stage): weighted representation, Gauss–Green and coarea (§§2.2, 2.5, 2.6); existence of minimizing clusters (§3.5); the measure-map diffeomorphism (§4.3); `∇²I_m = −L_A⁻¹` (§4.6); Ehrhard symmetrisation decreases Gaussian perimeter (§6.6); the Gaussian isoperimetric theorem with equality (§7.3) and its two-cell form (§7.4); Borell–Sudakov–Tsirelson (§8.1); Minkowski content (§8.2); Bobkov (§8.3); median concentration (§§8.4–8.5); Ehrhard for convex sets (§9.5).

**Copyright and arrangement.** Wording: beside the 15 sampled locators, seven further passages were set against their sources: the §3.1 cluster definition (MilmanNeeman2022 line 57–63), the §3.5 route (line 948–956), the §4.6 route (line 672–695), the §5.2 statement (CianchiFuscoMaggiPratelli2011 line 226–232), the §6.5 route (line 633–779), the §9.3 route (Ehrhard1983 line 440–457) and the §9.5 route (line 458–469). None reproduces or translates a run of words beyond formulas, standard names and the forced list of the cluster conditions; the §6.5 route differs in substance (mollification in place of strict approximation and Reshetnyak continuity). Arrangement: MilmanNeeman2022 has the largest share, 26 of the 82 citations by source id in the body. Its sections are 1 introduction, 2 model simplicial clusters, 3 definitions and notation, 4 minimizing clusters, 5–10 second variation, 11 uniqueness, 12 remarks; the roadmap places weighted perimeter and clusters (Layers 2–3, source §§3–4) before the model clusters (Layer 4, source §2), omits §§5–10 and interleaves five layers from other sources: no one-to-one run. Layers 5–7 share the order of CianchiFuscoMaggiPratelli2011 §§3, 4.1, 4.2, which the dependency lines force (§6.5 and §6.6 need §5.3; §7.1 needs §6.6). Layer 9 takes Ehrhard1983 §§1–3 out of the source's order (9.1 from §§1–2, 9.2 from §3, 9.3 from §1). Reuse: no table, figure, exercise list or data is taken over.

Source independence: 22 passages compared with 6 sources, none shared; largest share MilmanNeeman2022, 26 of 82 locators; contents compared with MilmanNeeman2022: independent. Maggi2012's chapters beyond its contents and synopsis could not be read.

## Not verifiable

- Maggi2012 Proposition 12.15, Theorem 12.26, Theorem 15.9, Sections 13.1 and 18.1–18.3, Exercise 29.7: the cached extract holds front matter, contents and the Part IV synopsis only. The contents confirm the section subjects; MilmanNeeman2022 line 756 and 939–946 cite Theorem 15.9, Proposition 12.15 and Theorem 12.26 for the same facts.
- SudakovTsirelson1974, Ledoux1996, CarlenKerce2001, AmbrosioFuscoPallara2000, Bogachev1998: settled as uncertified; cited by locator, not reopened.
- Borell1975 line 94–97: the OCR prints the same mark on the measures in (3.1) and (3.2), so the README's "stated there with inner measure" was not confirmed from the scan text.
- Ehrhard1983 line 411–437: the displays in the proof of Lemme 3.3 are illegible in the OCR; the statement is legible and concavity was confirmed numerically at four points.
- Bobkov1997 (outside this round's sample): the displayed inequality (10) is garbled in the cached text, as round 7 recorded.
- Lean elaboration, the one-tactic probe and the `#check` binder audit: no `Suggested.lean` at the design stage, and this lane does not elaborate.
- Ownership against open pull requests was checked through the `roadmaps` tool at the index of 2026-11-15; board packages on other pull requests' branches by the index list only.

## Source issues

- **Error** in CianchiFuscoMaggiPratelli2011 at Lemma 4.5, inequality (4.10), printed page 13 (cvgmt preprint): the source says the surface-normalized perimeter of the symmetral is at most the Gaussian-weighted variation plus the integrated section perimeter; it should carry the factor √(2π) on the variation term; affects a stated result.
- **Gap** in MilmanNeeman2022 at Lemma 2.1, printed page 11 (arXiv v3): the source says a displaced point lies in some open translated model cell; it should take a maximal coordinate of the displacement, which covers ties; affects the proof.
- **Misprint** in CianchiFuscoMaggiPratelli2011 at Theorem 4.1, printed page 10 (cvgmt preprint): the source says equality holds exactly for sets equivalent to a half-space; it should also allow Gaussian measure zero or one, as its Proposition 3.1 does; affects a stated result.
- **Misprint** in CianchiFuscoMaggiPratelli2011 at equation (2.5), printed page 5 (cvgmt preprint): the source says its surface-normalized perimeter equals a supremum taken against the probability measure; it should carry the factor √(2π); affects nothing.

## For the human reviewers

- **Scope.** Ehrhard's inequality is proved for convex sets only; the Borel-set case is listed as outside (`design/README.md` line 13).
- **Scope.** The README closes with a section stating the Gaussian multi-bubble theorem for `q ≥ 3` as motivation for a future roadmap and names a "proposed Part II" under Downstream consumers (`design/README.md` lines 714–719); the house style asks that nothing be "for later".
- **Licence.** Bobkov1997 was read from an author-page PDF of the published article and Maggi2012 from an author's extract on an institutional server; the manifest records both as certified with those classes.
- **Not tested.** Maggi2012 is cited at seven places by chapter locators whose text is not in the extract; the wording check could not be run against those chapters.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3b70275a68b49b60e1c71a46cada82a1833d225c", "job": "REV-DESIGN-GaussianIsoperimetryAndClusters~8", "model": "fable", "worker": "chris-x30"} -->
