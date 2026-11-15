<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13761#issuecomment-6898064804 -->
Review (claude) of 4877c46

Verdict: accepted

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

No finding. The two round-8 findings are repaired, the repaired passages survive the adversarial pass, and the repaired patterns occur nowhere else. The README, the plan and the manifest were left unchanged; no source was fetched and no manifest entry was added. There are no maintainer notes and no declared supplier gaps, so the acceptance is conditional on none.

## Repairs of the previous round

| Round-8 finding | Disposition | Repaired passage and my check |
|---|---|---|
| F01 (P3), two Mathlib inputs missing from the contract | **Repaired** | `design/README.md` line 54: "`Besicovitch.ae_tendsto_measure_inter_div` (…Besicovitch.lean:1104): for a locally finite measure on a second-countable metric space with the Besicovitch covering property … almost every point of `s` is a density point"; line 55: "`ContDiffBump` (…BumpFunction/Basic.lean:70): smooth bump functions … `ContDiffBump.normed`". The repair also added lines 52–53 (`MeasureTheory.NullMeasurableSet`; `MeasureTheory.Measure.prod`, `.pi`, `MeasureTheory.measurePreserving_piFinTwo`). All opened at the pin (below). A script comparing the library names of the layers with those of the contract now returns no absentee (64 names outside the contract, 78 inside). |
| F02 (P3), §6.5 locator silent on the normalization of (4.10) | **Repaired** | Line 508: "(4.10) is printed with their surface-normalized perimeter on the left and in the section term but with the variation term unscaled, so it lacks the factor `√(2π)` on that term and fails as printed, second Check"; line 513 carries the witness; line 488 (§6.3), line 499 and 503 (§6.4), line 606 (§8.3) and the Conventions (line 23) carry the same remark. Checked against CianchiFuscoMaggiPratelli2011 line 185–196 (their `H^k_γ` and `P_γ`), 605–618 ((4.7), (4.8)), 624–631 ((4.10)), 656–720 ((4.13), where the gradient of `v` does carry `1/√(2π)`), 745–776 (the `e`-component written with `dx` and `H^{n−1}_γ`), 781–828 (Lemma 4.6, which takes the gradient from (4.8)). The plan mirrors it (`plan.json`, targets 6.3, 6.4, 6.5, 8.3; test `source_normalization` of 6.5). |

Neither was marked not actionable.

**Adversarial pass on the changed text** (values recomputed by me, double precision):

| Passage | Instance | Values on each side | Result |
|---|---|---|---|
| Conventions, line 23; §6.5 Check 2 | `{x_2 < 1 + x_1}`, `e = e_2` | variation `e^{−1/4}/(2√π) = 0.219696`; ours `0.219696 + 0.219696 = 0.439391 ≥ φ(1/√2) = 0.310697`; printed (4.10): `0.219696 + 0.550696 = 0.770392 < e^{−1/4} = 0.778801`; with `√(2π)`: `1.101392 ≥ 0.778801` | as the README says |
| §6.4 Check 1 | same half-plane | `√2 · 0.219696 = 0.310697`; `√(4π) · 0.219696 = 0.778801`; `√(2π + 1) · 0.219696 = 0.592902 < 0.778801` | as the README says |
| §6.3 locator | same | ours `0.219696 ≤ 0.310697`; printed (4.7) `0.219696 ≤ 0.778801` | (4.7) weaker by `√(2π)` |
| §8.3 locator | `f = Φ` on `ℝ` | `√2 ∫ φ² = 0.398942 = I(1/2)`; `f = Φ(2x)`: `√5 ∫ φ(2x) φ(x) dx = (2π)^{−1/2}` | sound |
| §1.3 route with `measurePreserving_piFinTwo` | `F = {0}`, `F = E`; family `(F, F^⊥)` | both factors are probability measures, so σ-finite; `Measure.pi` over `Fin 2` goes to `(μ 0).prod (μ 1)`; pairwise orthogonality `F ⟂ F^⊥` is the hypothesis `hK` of the Tau Ceti law | sound |
| Besicovitch bullet in §5.1, §7.2 | `U = (0, 1) ∪ (1, 2)`; `U = ℚ` | density `1` at `1`; `μ.restrict ℚ = 0`, statement empty, density `0` everywhere | matches the Checks of §5.1 |

**Pattern search.** F01's pattern: no layer name is missing from the contract (script). F02's pattern (a formula of a source in another normalization cited without remark): every other citation of CianchiFuscoMaggiPratelli2011 is homogeneous in perimeter ((3.2), Proposition 3.1, Lemma 3.3, (4.3), Theorem 4.1), Euclidean ((2.3)–(2.4), (4.1), Theorem 4.2) or covered by the Conventions ((1.5), (2.5), line 52); Ledoux1999 (1.4) and MilmanNeeman2022 (1.1) are in this roadmap's normalization.

## Verified sound

**Coverage.** Whole README (739 lines, nine layers), read in full this round and every Check recomputed; plan (46 targets: 10 definitions, 36 theorems; every `target:` prerequisite points backwards; `gaps` empty; no definition with fewer than three tests; every *Needs:* line equals the plan's `target:` prerequisites of its section, by script); manifest (13 works, one key each, every cited work recorded, no local path). Principles: the weighted theory is for every positive `C¹` density on an intrinsic finite-dimensional inner product space; no route-specific restriction, no re-planned roadmap, no upward or cyclic supply, no copied passage, no algorithm, no `set_option`, no sorry'd data. There is no `Suggested.lean` at the design stage. **Elaboration: not available (this lane does not elaborate; say so in the report).** The one-tactic probe and the `#check` binder audit therefore do not apply.

**Dependency gate** (command of the brief):

```text
candidate: GaussianIsoperimetryAndClusters is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2241 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

**Source sample** (the 15 seeded targets; the author flagged no locator as unverified). Read at the cited lines of the cached texts:

| Target | Lines read | Result |
|---|---|---|
| 1.2 | CianchiFuscoMaggiPratelli2011 line 295–299; Ledoux1999 line 221–226 | Lemma 3.4, (3.2), for `s > 0`, strict; `γ(A_r) ≥ Φ(r) ≥ 1 − e^{−r²/2}`, without the factor `½` |
| 2.1 | MilmanNeeman2022 line 29–33, 753–754; CianchiFuscoMaggiPratelli2011 line 200–208 | supremum over smooth compactly supported fields of norm `≤ 1` against the weighted divergence; (2.5) against `dγ_n` |
| 2.2 | MilmanNeeman2022 line 755–761; CianchiFuscoMaggiPratelli2011 line 150–157, 174–208 | `P_μ(U) = μ^{n−1}(∂*U)` under finite weighted perimeter; (2.1), (2.3), (2.4), converse criterion at line 182–184. Maggi2012 Theorem 15.9 not readable (below) |
| 3.5 | MilmanNeeman2022 line 918–922, 939–956 | Theorem 4.1 (i) for a probability density (smooth `W` there; the route here needs only `C¹`), proof by lower semicontinuity and `L¹(μ)` compactness |
| 4.1 | MilmanNeeman2022 line 484–505 | model cells as interiors of `{max_j x_j = x_i}`, interfaces, `A^m_ij(x)` |
| 4.2 | MilmanNeeman2022 line 76–82, 499–501 | Voronoi cells of `q` equidistant points, `2 ≤ q ≤ n + 1`; the canonical centres `x + e_i − (1/q) Σ e_j` |
| 4.3 | MilmanNeeman2022 line 506–543 | Lemma 2.1 and (2.2); the injectivity step at line 515–517 does assume `y` in an open cell; surjectivity by invariance of domain at line 539–543 |
| 6.2 | CianchiFuscoMaggiPratelli2011 line 526–542 | Theorem 4.2 (i)–(iii) and (4.1), attributed there to Ambrosio–Fusco–Pallara Theorem 3.108 |
| 7.2 | CianchiFuscoMaggiPratelli2011 line 913–966 | Steps III–IV, with cubes where the README uses cylinders |
| 7.3 | CianchiFuscoMaggiPratelli2011 line 220–223, 508–509; MilmanNeeman2022 line 47–52, 83–84; Ledoux1999 line 212–219; Borell1975 line 88–99 | Theorem 4.1 for `n ≥ 2`, Proposition 3.1 with the cases `γ ∈ {0, 1}`; uniqueness attributed to Carlen–Kerce; (1.4); Theorem 3.1 |
| 7.4 | MilmanNeeman2022 line 68–70, 83–84, 98–102 | two-cell perimeter, half-spaces for `q = 2`, Theorems 1.1–1.2 |
| 8.1 | Borell1975 line 88–99; Ledoux1993 line 241–256; Ledoux1999 line 220–247; Ehrhard1983 line 356–359 | (3.1) for measurable `A` and the closed unit ball; "ou seulement `≥`"; (1.5), (1.7) with `K = M(B_2)`; Théorème 2.4 for Borel sets and `r ≥ 0` |
| 8.2 | Ledoux1999 line 205–219 | (1.3) with open neighbourhoods, (1.4) |
| 8.3 | Ledoux1999 line 294–313; CianchiFuscoMaggiPratelli2011 line 597–601, 656–720 | (1.11) and its equivalence with (1.4) through `(1 − d(x, A)/r)^+`; (4.6), (4.13). Bobkov1997 not legible (below) |
| 8.4 | Ledoux1993 line 257–262; Ledoux1999 line 225–226 | inequality (10) for `1`-Lipschitz functions about a median; (1.6) |

**Adversarial table** (my own computation: bisection on `erfc`, Simpson quadrature after removing endpoint singularities, closed-form Hessian of `g`).

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| 1.1 | `v = 1/3`, `0.3`; levels `0`, `1` | `I(1/3) = 0.363600`, `Φ⁻¹(1/3) = −0.430727`; `−1/I(0.3) = −2.876104`, `−Φ⁻¹(0.3) = 0.524401`; quantile junk `0` would give `φ(0)` | sound |
| 1.2 (sampled) | `r = 0, 1, 2` | `0.5 = 0.5`; `0.158655 < 0.241971`, `≤ 0.303265`; `0.022750 ≤ 0.067668`; derivative of `e^{r²/2}(1 − Φ)` is `e^{r²/2}(r(1 − Φ) − φ) < 0` | sound |
| 1.3 | `q = 3`; `q = 1` | `1 − Φ(√1.5) = 0.110336`, reciprocal factor `0.207108`; `q/(q − 1)` undefined | sound |
| 2.1 (sampled) | weight `0`; `W + c`; `U = ℝ` under the unweighted pairing; `Ω′` relatively compact | `P((0, 1)) = 2`; factor `e^{−c}`; `∫ |t| dγ = 0.797885 ≠ 0`; `min e^{−W} |Du| ≤ V_μ ≤ max e^{−W} |Du|` | sound |
| 2.2 (sampled) | `(−1, 1)`; disc minus origin; disc plus `ℚ² ∖ ball` | `2φ(1) = 0.483941`, `I(0.682689) = 0.356343`; `0.606531` in both, frontier gains `{0}`, resp. `ℝ² ∖ ball(0, 1)` | sound |
| 2.4 | `(−1, 1) ∪ (1 + 1/k, 2)` | `3φ(1) + φ(2) = 0.779903 > φ(1) + φ(2) = 0.295962` | sound |
| 3.2 | three intervals `a = 0`, `b = 1`; half-annuli | `0.640913 − 0.398942 = 0.241971`; boundary length `2^{−2k}(3π/2 + 1)` | sound |
| 3.4 | `ρ = c(1 + y²) exp(−x²(1 + y²)⁴)` | `∫ ρ dx = c√π/(1 + y²)`, integrable; `{x = 0}`: `∫ c(1 + y²) dy = ∞`; `{x = t}`, `t ≠ 0`: finite | sound |
| 3.5 (sampled) | `μ = γ`, `q = 2`; weight `0` on `ℝ`; `q = 3` | `P(Ω_i) ≤ 2P(Ω)` from `P(Ω) = ½ Σ P(Ω_i)`; `(k, k + 1)`: perimeter `2`, no `L¹` limit; a.e. disjoint limits with sum `1` | sound |
| 4.1 (sampled) | `q = 2`; `q = 3`, `x = 0`; `q = 1` | `A_12(tu) = φ(t)`; `1/(2√(2π)) = 0.199471`, total `0.598413`, cell measure `1/3`; conormals sum `0`; density `1/3` and averaged normal of norm `√3/2` at the origin; `μHE[0]` junk at `q = 1` | sound |
| 4.2 (sampled) | centres `±1`, `λ = 2, −1, 0`; collinear `0, 1, 2` | `8y < 0`, `−4y < 0`, `0 < 0`; `‖y − p_i‖ < ‖y − p_j‖ ⟺ ⟨y − c, p_j − p_i⟩ < 0` since `‖p_i − c‖ = ‖p_j − c‖`; distances `1, 1, 2` not equal | sound |
| 4.3 (sampled) | `q = 2`; `q = 3`, `x = 0`; tie `(1, 1, −2)`; properness | `∂_w Ψ_i = Σ_j ⟨w, n_ij⟩ A_ij = −(L_A w)_i/√2`: `−φ(0.7) = −0.312254`; `−3A/√2 = −0.423142`; `y + Ω^m_1 ⊊ x + Ω^m_1`; `x + Ω^m_i ⊆ {z_i > x_i}`, `Ψ_i ≤ 1 − Φ(√(q/(q−1)) x_i)` | sound |
| 4.4, 4.6 | wrong centre; `q = 2`; `q = 3` centre | `φ(0.482734) = 0.355065` against `0.241971`; `∇_w Σ A = −½⟨w, L_A x⟩`, composed with `−√2 L_A⁻¹` gives `x/√2`; `−1/(3A) = −1.671086`, `6A = 1.196827` | sound |
| 4.7 | `ℝ`, `q = 3` | `2I(1/3) = 0.727200 > 0.598413` | sound |
| 5.2, 5.3 | `(0, 1)`; `(−1, 0)` shifted | `0.341345`, `0.640913`, half-line at `0.408796`, `0.366963`; `(−0.9, 0.063724)`: `0.664218`; `(−0.5, 0.385003)`: `0.722510`; derivative `−φ(a′)(a′ + b′)` | sound |
| 6.2 (sampled) | `{x_2 < m x_1}`, `m = 1`; vertical line; cut half-plane; null-section base points | `√2 · (1/√2) = 1 = 1`; `0`; `U_R` of volume `πR²/2`, perimeter `πR + 2R`, section `(−√(R² − s²), 0)`; applying the slicing theorem to `E ∖ U` covers the `z` with null `U_z` | sound |
| 6.3 | fourth Check | `v_U = 1/2 + h`; `P_γ ≤ 2φ(0) + γ¹((−1/4, 1/4)) = 0.797885 + 0.197413 = 0.995297`; `g_U = 1` on `0 < |z| < 1/4` | sound |
| 6.5, 6.6 | unit disc, `e = e_2` | `2e^{−1/2}/π = 0.386129`; `∫ I(v_U) dγ = 0.252248`; `∫ √(I(v_U)² + v_U′²) φ = 0.517483` (substitution `z = sin θ`) | sound |
| 7.2 (sampled) | half-lines; strip set of the Check | half-line of positive length in both windows contains `(t_1 + ρ, t_2 − ρ)`; proportion bound `2ε` from `|B_i| · 2ρ ≤ ε |C_ρ|`; strip proportions `(5/6)ρ` | sound |
| 7.3 (sampled) | disc; slab; `∅`; separation | `0.606531 > 0.384633`; `0.483941 > 0.356343`; `0 = I(0)`; `{f < s} ∖ H^{(1)}` lies in the complement of both open sets, which is null | sound |
| 7.4 (sampled) | `(1/2, 1/2)`; `(1, 0)` | `0.398942`; `0 = I(1)`, attained by `(E, ∅)`, not simplicial | sound |
| 8.1 (sampled) | half-space; disc, `r = 1`; `A = ∅`; `S` not positive semidefinite; route | `Φ(a + r)` both; `a = −0.270288`, `0.864665 ≥ 0.767217`; no real `a`; `K = 0`, `δ_m(A) = 1`; `f > 0` on `(0, ∞)` since `A ⊆ thickening`, `G′ ≥ 1` a.e., `G(s) ≥ a + s − s′` | sound |
| 8.2 (sampled) | half-space; disc; `ℚ²`; open against closed thickening | `φ(a)`; `0.606531 ≥ 0.384633`; `1/r`; `Q_o(r) ≤ Q_c(r) ≤ (1 + ε) Q_o((1 + ε) r)`, so the two lower limits agree: the closed form loses nothing against Ledoux's open (1.3) | sound |
| 8.3 (sampled) | `Φ(x)`, `Φ(2x)`; `min(x², 1)`; constants; `f_r` | `0.398942` twice; `∫ f dγ = 0.516059`, `I = 0.398619`, right side `0.647406`; `I(c)` both sides; `{0 < d_A < r} ⊆ cthickening ∖ A` | sound |
| 8.4 (sampled) | `f = x_1`; `L = 0`; `f = |x_1|` | equality `1 − Φ(r)`; empty sets; median `0.674490`, mean `0.797885` | sound |
| 8.5 | two independent normals | median `0.544952`; `0.010899 ≤ 0.022750`; row `i` of `K` has norm `√((K²)_ii) = √(S_ii)` | sound |
| 9.1 | complement law; composition; ball in `ℝ³` | `{Φ(t) < 1 − v_C}` both sides; second-step section measure `∫ v^{F_1}_C(n + g_2) dγ_{G_2} = γ_{F_1 + F_2}(C_n)`; `0.198748`, `−0.846102` | sound |
| 9.2 | Hessian of `g` at four points | `(−0.459912, −0.459912)`, determinants `0.163502`, `0.015519`, `0.000142`, `15.648788` | sound |
| 9.5 | `[−1, 1]`, `[−3, 3]`; `λ = 0.9` | `1.690143 ≥ 1.628704`; `0.948312 ≥ 0.825134`; `0.561033 + 0.993113` | sound |

**Pinned libraries.** `lake-manifest.json` pins Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`; both package checkouts are at those commits and the plan baseline equals them. All library names backticked in the README were located by a script at the pins, at the file and line the README gives. Opened and read this round: `Besicovitch.ae_tendsto_measure_inter_div` (Besicovitch.lean:1104; section variables at 1072–1073; `∀ᵐ x ∂μ.restrict s`, closed balls), the instance at BesicovitchVectorSpace.lean:500, `ContDiffBump` (BumpFunction/Basic.lean:70), `ContDiffBump.normed` (Normed.lean:35), `hasContDiffBump_of_innerProductSpace` (InnerProduct.lean:60), `MeasureTheory.NullMeasurableSet` (NullMeasurable.lean:91, measure defaulting to `volume`), `MeasureTheory.Measure.prod` (Prod.lean:172), `MeasureTheory.Measure.pi` (Constructions/Pi.lean:211), `MeasureTheory.measurePreserving_piFinTwo` (Pi.lean:850, σ-finite factors), `ProbabilityTheory.multivariateGaussian` (Multivariate.lean:166, with `multivariateGaussian_of_not_posSemidef` after it), `Metric.thickening`, `Metric.cthickening`, `Metric.cthickening_zero` (Thickening.lean:53, 181, 226), `LipschitzWith.ae_differentiableAt` (Rademacher.lean:386), `Monotone.ae_differentiableAt` (Monotone.lean:213), `MonotoneOn.intervalIntegral_deriv_mem_uIcc` (DerivIntegrable.lean:101), `Submodule.map_orthogonalProjectionOnto_stdGaussian` and `TauCeti.Probability.map_orthogonalProjectionOnto_stdGaussian_pi` (Projection.lean:47 and 94; hypothesis `Pairwise fun i j ↦ K i ⟂ K j`), `TauCeti.Probability.stdGaussian_eq_withDensity_norm` (Density.lean:178), `TauCeti.essentialInterior` (EssentialBoundary.lean:132), `TauCeti.ae_perimeter_inter_ball_le` (CutByBall.lean:228; null-measurable `s`, no finiteness), `TauCeti.integral_trace_fderiv_mul_indicator_eq_integral_inner_outerNormal` (ReducedBoundary.lean:271; `C¹` field with compact support in `Ω`, which `e^{−W} X` is), `TauCeti.euclideanHausdorffMeasure_sphere` (Sphere.lean:367, `0 < r`).

**Duplication by object.** `roadmaps grep` over main and the open heads (index of 2026-11-15T16:45:34Z) for Ehrhard, Gaussian isoperimetr, Bobkov, Sudakov, Gaussian perimeter, isoperimetric profile, double-/multi-bubble, minimizing cluster, Minkowski content: no match. "weighted perimeter": a hexagon weight in TensorProductCombinatorics. "Gaussian concentration": one proof remark in the open MathematicalStatisticsHighDimensional. Concentration of Lipschitz functions about a median: BanachSpaceTheory B7 states it for the sphere (`TauCetiRoadmap/BanachSpaceTheory/README.md` line 1325–1330), RandomMatrices 2.2 the mean-centred Herbst bound (`TauCetiRoadmap/RandomMatrices/README.md` line 503–510); neither states the Gaussian median form of §8.4. OptimalTransport's Gaussian content is the Bures formula and barycentres (its lines 450–452, 2232–2239). The board-package index lists AnalyticNumberTheory and LawrenceVenkateshMethod only. This roadmap is the owner of weighted perimeter for `C¹` densities, Gaussian clusters, Gaussian symmetrisation and the Gaussian isoperimetric theorem. `scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is dropped, none is defined only by a revision, no second copy.

Overlap check: read Isoperimetry, GeometricMeasureTheory, OptimalTransport (main) and MathematicalStatisticsAsymptotic, MathematicalStatisticsFoundations, MathematicalStatisticsNonparametric, MathematicalStatisticsSemiparametric, MathematicalBilliards (open); nothing shared.

**Cross-roadmap citations**, resolved on main (`1a19c9f`): GeometricMeasureTheory G2 (`TauCetiRoadmap/GeometricMeasureTheory/README.md:148`; tangential area formula 167–168, weighted coarea 170–175, graph surface measure 177), G4 (210; convolution estimates 215), G5 (248; De Giorgi 256–262, essential against reduced boundary 264–265, converse criterion 265–266), G6 (275; surface comparison on Lipschitz domains 287–289); Isoperimetry I4 (`TauCetiRoadmap/Isoperimetry/README.md:223`; standing set at 237, measure-preserving `e⊥ × ℝ` at 242–244, slicing theorem 247–249), I1–I2; RandomMatrices 2.2; BanachSpaceTheory B7. All on main, none on the never-cite list. `scratch/citations.md` lists nothing unresolved.

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, nine layers each ending with Examples and Dependencies, Downstream consumers, References. Every definition (1.1, 2.1, 3.1, 3.4, 4.1, 4.2, 4.4, 6.1, 8.3, 9.1) has an API list and at least three Checks; every theorem section has its hypotheses in the sentence, a locator and a *Needs:* line. A scan finds no LaTeX delimiter, target table, pull-request number, date, machine path, HTML anchor or process word. No backticked name is presented as this roadmap's own declaration.

**Headline theorems** (for the package stage): weighted representation, Gauss–Green and coarea (§§2.2, 2.5, 2.6); existence of minimizing clusters (§3.5); the measure-map diffeomorphism (§4.3); `∇²I_m = −L_A⁻¹` (§4.6); Ehrhard symmetrisation decreases Gaussian perimeter (§6.6); the Gaussian isoperimetric theorem with equality (§7.3) and its two-cell form (§7.4); Borell–Sudakov–Tsirelson (§8.1); Minkowski content (§8.2); Bobkov (§8.3); median concentration (§§8.4–8.5); Ehrhard for convex sets (§9.5).

**Copyright and arrangement.** Wording: beside the 15 sampled locators, eight further passages were set against their sources: the §3.1 cluster definition (MilmanNeeman2022 line 57–63), the §3.5 route (line 948–956), the §4.3 route (line 513–543), the §5.2 statement (CianchiFuscoMaggiPratelli2011 line 226–232), the §6.1 definition (line 543–552), the §6.5 route (line 633–779), the §7.2 route (line 913–962) and the §8.3 converse (Ledoux1999 line 306–313). None reproduces or translates a run of words beyond formulas, standard names and the forced list of the cluster conditions; the routes of §4.3, §6.5 and §7.2 differ in substance from the sources' proofs. Arrangement: MilmanNeeman2022 has the largest share, 26 of the 82 citations by source id in the body. Its sections are 1 introduction, 2 model simplicial clusters, 3 definitions, 4 minimizing clusters, 5–10 second variation and the proof, 11 uniqueness, 12 remarks; the roadmap places weighted perimeter and clusters (Layers 2–3, source §§3–4) before the model clusters (Layer 4, source §2), omits §§5–10 and interleaves five layers from other sources: no one-to-one run. Layers 5–7 share the order of CianchiFuscoMaggiPratelli2011 §§3, 4.1, 4.2, which the *Needs:* lines force (§6.5 and §6.6 need §5.3; §7.1 needs §6.6). Reuse: no table, figure, exercise list or data is taken over.

Source independence: 23 passages compared with 6 sources, none shared; largest share MilmanNeeman2022, 26 of 82 locators; contents compared with MilmanNeeman2022: independent. Maggi2012's chapters beyond its contents and synopsis, and Bobkov1997's text, could not be read.

## Not verifiable

- Bobkov1997 Corollary 1, inequality (10), p.209 and the argument after Corollary 2, p.210: the cached text is an illegible recognition of the scan (page markers at line 72 and 98 only). Ledoux1999 line 296–313 states the same inequality and the same converse argument.
- Maggi2012 Proposition 12.15, Theorem 12.26, Theorem 15.9, Sections 13.1 and 18.1–18.3, Exercise 29.7: the cached extract holds front matter, contents and the Part IV synopsis only. MilmanNeeman2022 line 756 and 939–946 cite Theorem 15.9, Proposition 12.15 and Theorem 12.26 for the same facts.
- SudakovTsirelson1974, Ledoux1996, CarlenKerce2001, AmbrosioFuscoPallara2000, Bogachev1998: settled as uncertified; cited by locator, not reopened.
- Borell1975 line 94–97: the recognised text prints the same mark on the measures in (3.1) and (3.2), so "stated there with inner measure" was not confirmed from it.
- Lean elaboration, the one-tactic probe and the `#check` binder audit: no `Suggested.lean` at the design stage, and this lane does not elaborate.
- Ownership against open pull requests was checked through the `roadmaps` tool at the index of 2026-11-15; board packages on other pull requests' branches by the index list only.

## Source issues

- **Error** in CianchiFuscoMaggiPratelli2011 at Lemma 4.5, inequality (4.10), printed page 13 (cvgmt preprint): the source says the surface-normalized perimeter of the symmetral is at most the Gaussian-weighted variation plus the integrated section perimeter; it should carry the factor √(2π) on the variation term; affects a stated result.
- **Error** in CianchiFuscoMaggiPratelli2011 at Lemma 4.4, equation (4.8), printed page 12 (cvgmt preprint): the source says the gradient of the section measure is a sum weighted by the unnormalized one-dimensional Gaussian density; it should carry the factor (2π)^(−1/2), which (4.14) and (4.6) then need back; affects a stated result.
- **Gap** in MilmanNeeman2022 at Lemma 2.1, printed page 11 (arXiv v3): the source says a displaced point lies in some open translated model cell; it should take a maximal coordinate of the displacement, which covers ties; affects the proof.
- **Misprint** in CianchiFuscoMaggiPratelli2011 at Theorem 4.1, printed page 10 (cvgmt preprint): the source says equality holds exactly for sets equivalent to a half-space; it should also allow Gaussian measure zero or one, as its Proposition 3.1 does; affects a stated result.
- **Misprint** in CianchiFuscoMaggiPratelli2011 at equation (2.5), printed page 5 (cvgmt preprint): the source says its surface-normalized perimeter equals a supremum taken against the probability measure; it should carry the factor √(2π); affects nothing.

## For the human reviewers

- **Scope.** Ehrhard's inequality is proved for convex sets only; the Borel-set case is listed as outside (`design/README.md` line 13).
- **Scope.** The README closes with a section stating the Gaussian multi-bubble theorem for `q ≥ 3` as motivation for a future roadmap and names a "proposed Part II" under Downstream consumers (`design/README.md` lines 716–723); the house style asks that nothing be "for later".
- **Licence.** Bobkov1997 was read from an author-page PDF of the published article and Maggi2012 from an author's extract on an institutional server; the manifest records both as certified with those classes.
- **Not tested.** Maggi2012 (seven chapter locators) and Bobkov1997 (one locator) could not be read at their locators; the wording check was not run against them.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4877c4657afec41744fa9fc69b117c76e6b5caca", "job": "REV-DESIGN-GaussianIsoperimetryAndClusters~9", "model": "fable", "worker": "chris-x29"} -->
