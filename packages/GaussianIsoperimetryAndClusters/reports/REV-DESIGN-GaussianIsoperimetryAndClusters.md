<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/6596#issuecomment-6659332214 -->
Review (claude) of 9be68dd

Verdict: needs_changes

1. **F01** (P3) Wrong computed value in the 6.6 Check and the Layer 6 Examples

   Location: `packages/GaussianIsoperimetryAndClusters/design/README.md`, §6.6 Checks, first bullet ("`P_γ(S_e(U)) = ∫_{−1}^{1} √(I(v_U)² + v_U′²) φ(z) dz = 0.516961`") and the Layer 6 `### Examples` line ("lowers the Gaussian perimeter from `0.606531` to `0.516961`").

   Claim: the Ehrhard symmetral along `e_2` of the unit disc in `ℝ²` has Gaussian perimeter `0.516961`.

   Witness: with `v_U(z) = 2Φ(√(1 − z²)) − 1` and `v_U′(z) = −2zφ(√(1 − z²))/√(1 − z²)`, the substitution `z = sin θ` makes the integrand `√(I(v)² cos²θ + 4φ(cos θ)² sin²θ) φ(sin θ)`, smooth on `[−π/2, π/2]`; adaptive Simpson to `10⁻¹¹` gives `0.517483`. The weighted length of the boundary curve `θ ↦ (sin θ, Φ⁻¹(v))` computed independently gives `0.517445` on `|θ| ≤ π/2 − 10⁻⁴`, consistent after adding the truncated ends. The printed value is off by `5 · 10⁻⁴`, beyond rounding.

   Repair: replace `0.516961` by `0.517483` in both places; the qualitative claim (between `0.384633` and `0.606531`) stands.

2. **F02** (P3) Wrong computed value in the 8.3 Check

   Location: README §8.3 Checks, second bullet ("`f(x) = min(x², 1)` on `ℝ`: … the right side is `0.647454`").

   Claim: `∫ √(I(f)² + ‖∇f‖²) dγ = 0.647454` for `f = min(x², 1)`.

   Witness: the integrand vanishes for `|x| ≥ 1` (there `I(1) = 0` and `∇f = 0`), so the right side is `2∫_0^1 √(I(x²)² + 4x²) φ(x) dx`; adaptive Simpson to `10⁻¹¹` gives `0.647406`. The other two numbers of the bullet (`∫ f dγ = 0.516059`, `I(0.516059) = 0.398619`) are confirmed.

   Repair: replace `0.647454` by `0.647406`.

3. **F03** (P3) The 3.4 Check draws the wrong moral from its example

   Location: README §3.4 Checks, second bullet, last sentence ("Slabs alone would not prove finiteness of the profile.").

   Claim: for `ρ(x, y) = c(1 + y²) exp(−x²(1 + y²)⁴)`, slabs do not yield a finite-perimeter set of measure `1/2`.

   Witness: for `t ≠ 0` the vertical line `{x = t}` has weighted length `∫ c(1 + y²) e^{−t²(1+y²)⁴} dy < ∞`, so the symmetric slab `{|x| < a}` of measure `1/2` (which exists by continuity and symmetry) has finite perimeter. Only the vertical half-planes `{x < t}` fail, since the unique one of measure `1/2` is `{x < 0}` and `{x = 0}` has infinite weighted length. The example refutes "half-spaces alone", not "slabs alone".

   Repair: replace the last sentence by "Half-planes `{x < t}` alone would not prove finiteness of the profile."

4. **F04** (P3) The merging bullet of 3.1 needs `q ≥ 3`

   Location: README §3.1, third API bullet ("Replacing two cells `Ω_i, Ω_j` by `Ω_i ∪ Ω_j` gives a `(q − 1)`-cluster …").

   Claim: merging two cells of a `q`-cluster yields a `(q − 1)`-cluster.

   Witness: for `q = 2` the merged tuple `(E)` has one cell, and §3.1 defines clusters only for `q ≥ 2`; `(E)` is not a cluster of this roadmap.

   Repair: begin the bullet with "For `q ≥ 3`, replacing …".

5. **F05** (P3) Unused hypothesis `L > 0` in 8.4

   Location: README §8.4 ("Prove that for `L > 0`, an `L`-Lipschitz `f : E → ℝ` …").

   Claim: the statement needs `L > 0`.

   Witness: for `L = 0`, `f` is a constant `c`; `γ({f ≤ m}) ≥ 1/2` forces `c ≤ m`, so `{f > m + 0·r} = ∅` and `{|f − m| > 0} = ∅`, and both bounds hold. The route (closed thickening of `{f ≤ m}` inside `{f ≤ m + Lr}`) also works for `L = 0`. §8.5 applies §8.4 with `σ = 0` when `S = 0` (its third Check), which the stated hypothesis excludes.

   Repair: state 8.4 for `L ≥ 0` (or apply it in 8.5 with every `L > 0` and let `L ↓ 0`; the former is simpler).

6. **F06** (P3) Locator constant: Ledoux1999 (1.6) states the bound without the factor `1/2`

   Location: README §1.2 ("`1 − Φ(r) ≤ ½ e^{−r²/2}` for every `r ≥ 0` … (CianchiFuscoMaggiPratelli2011 Lemma 3.4 …; Ledoux1999 inequality (1.6), line 225–226)") and §8.4 (same citation).

   Claim: Ledoux1999 (1.6) supports `1 − Φ(r) ≤ ½ e^{−r²/2}`.

   Witness: Ledoux1999 line 226 reads, in the OCR, `γ(A_r) ≥ Φ(r) ≥ 1 − e^{−r²/2}` (no `1/2`); CianchiFuscoMaggiPratelli2011 Lemma 3.4, line 295–305, gives `∫_s^∞ e^{−t²/2} dt < e^{−s²/2}/s` and a lower bound, neither of which is the `½ e^{−r²/2}` bound either. The bound itself is true and the README's own route proves it (`r ↦ e^{r²/2}(1 − Φ(r))` is decreasing from `1/2`).

   Repair: cite Ledoux1999 (1.6) for the weaker form `1 − Φ(r) ≤ e^{−r²/2}` only, and let the `½` bound rest on the route given (or on a standard text that states it); same in §8.4.

7. **F07** (P3) Commit hashes in the README

   Location: README `## Exact supplier contracts`, "The baseline is Mathlib commit `f6090c7095e1e56b3464c1daba5f24631f1290d2`." and "The baseline is Tau Ceti commit `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`."

   Claim: house style (timeless README, no process residue).

   Witness: no README on main carries a commit hash (`grep "commit"` over `TauCetiRoadmap/*/README.md` and `Completed/*/README.md` finds none); `design/plan.json` already records both hashes under `baseline`.

   Repair: delete the two sentences; keep the file-and-line citations, which the package stage re-verifies at the pins.

No previous review of this design exists. Every finding below is P3 and none is blocking, but each asks for a change, so the verdict is needs changes and a fix round applies them before the package stage. The design re-plans no roadmap, takes no route-specific shortcut, copies no passage, contains no algorithm, declares no gap, and its supply runs downward only.

## Verified sound

**Principles.** The weighted theory is stated for every positive `C¹` density on every finite-dimensional real inner product space (more general than Milman–Neeman's `C^∞`, with the routes checked at that generality: Gauss–Green applies to the `C¹` field `e^{−W}X`); nothing is route-specific. No existing roadmap is re-planned: GeometricMeasureTheory G2–G6, Isoperimetry I4 and StandardDistributions 7.2 are imported by section and the Scope lists the deferrals (Steiner, Prékopa–Leindler, Brunn–Minkowski to Isoperimetry I1–I2; log-Sobolev and Herbst to RandomMatrices 2.2). No copied passage; no algorithm; no gap declared.

**Gate.**

```
candidate: GaussianIsoperimetryAndClusters is not in the merge order yet; checked as if placed after GlaubermanZStar (the intake inserts it when its design is accepted)
depcheck: 236 roadmaps, 2180 edges, 0 problem(s)
```

**Suppliers resolved on main.** GeometricMeasureTheory README G2 (area, coarea, tangential area formula, graph and sphere measure, `Hⁿ⁻¹(sphere c r) = n ω_n r^(n−1)`), G3 (vector derivative measure, polar decomposition, variational characterization with smooth fields of norm at most one, one-dimensional comparison with classical variation), G4 (lower semicontinuity, `L¹_loc` compactness, convolution estimates, scalar coarea with measurable dependence and layer-cake, BV Poincaré on balls), G5 (reduced and essential boundary, De Giorgi with blow-up, null difference of the boundaries, locality, converse boundary criterion, `P(E) ≤ Hⁿ⁻¹(frontier E)`), G6 (Gauss–Green for locally finite perimeter and compactly supported `C¹` fields, Lipschitz-domain comparison); Isoperimetry I4 (finite-perimeter slicing theorem with reduced-boundary and normal comparison on almost every line, the measure-preserving identification `e⊥ × ℝ ≃ E`); StandardDistributions 7.2 ("Continuous `F` gives `F(Q(u)) = u`; strict increase on its support interval gives uniqueness"). RandomMatrices 2.2 and BanachSpaceTheory's Dvoretzky concentration are consumers' context only, as the README says. The sign convention `Dχ_E = −ν_E Hⁿ⁻¹|∂*E` is GeometricMeasureTheory's (its Conventions), and Cianchi–Fusco–Maggi–Pratelli's inner normal (CianchiFuscoMaggiPratelli2011 line 155) is correctly noted as mirrored.

**Library declarations at the pins** (all opened at the cited file and line): `ProbabilityTheory.stdGaussian` (Multivariate.lean:65, instance :71), `stdGaussian_map` (:126, for `E ≃ₗᵢ[ℝ] F`), `stdGaussian_eq_map_pi_orthonormalBasis` (:144), `multivariateGaussian` (:166, image of `stdGaussian` under `x ↦ μ + toEuclideanCLM (CFC.sqrt S) x`; `multivariateGaussian_of_not_posSemidef` at :171 gives the Dirac mass, as the 8.1 Check says), `gaussianPDFReal` (Real.lean:47), `gaussianReal` (:220), `gaussianReal_map_neg` (:358), `ProbabilityTheory.cdf` (CDF.lean:56), `euclideanHausdorffMeasure` (Volume/Measure.lean:68), `euclideanHausdorffMeasure_coe_image` (:226), `measurePreserving_vaddConst` (:212), `Submodule.measurePreserving_measurableEquivProd` (:287), `LinearMap.normDet` (NormDet.lean:69), `geometric_hahn_banach_open_open` (Separation.lean:135), `Metric.thickening` (Thickening.lean:53, `{x | infEDist x E < ofReal δ}`, empty for `δ ≤ 0`), `Metric.cthickening` (:181), `cthickening_zero` (:226), `isOpenMap_of_hasStrictFDerivAt_equiv` (FDeriv.lean:204), `LipschitzWith.ae_differentiableAt` (Rademacher.lean:385), `norm_fderiv_le_of_lipschitz` (FDeriv/Basic.lean:947), `Monotone.ae_differentiableAt` (Monotone.lean:209), `MonotoneOn.intervalIntegral_deriv_mem_uIcc` (DerivIntegrable.lean:100), `Convex.nullMeasurableSet` (Convex/Measure.lean:85, for an additive Haar measure), `Besicovitch.ae_tendsto_measure_inter_div` (Besicovitch.lean:1105, in `namespace Besicovitch`), `MeasureTheory.measurePreserving_sumPiEquivProdPi` (Constructions/Pi.lean:795), `Measure.le_map_apply` (Map.lean:218, the "`(T_* γ)(X) ≥ γ(T⁻¹(X))` for every set" of 8.1). Tau Ceti: `TauCeti.Probability.stdGaussian_eq_withDensity` (Density.lean:158, density `(2π)^(−card ι/2) exp(−‖x‖²/2)`), `cdf_gaussianReal_zero_one` (Cdf.lean:122), `TauCeti.Real.strictMono_erf` (Erf.lean:132), `continuous_erf` (:105), `MeasureTheory.Measure.quantile` (Quantile.lean:101, junk `0` at levels `≤ 0` by `quantile_of_nonpos` :128). Mathlib has no file mentioning "isoperimetric"; Tau Ceti's only isoperimetric statements are De Giorgi's Sobolev inequality (Sobolev/Poincare/Wirtinger/DeGiorgi.lean), unrelated; neither has BV, perimeter, thickening-based Gaussian bounds, Borell, Bobkov or Ehrhard statements.

**Duplication by object.** `roadmaps grep -i` over main and the 455 open pull requests for "Gaussian isoperimetr", "Ehrhard", "Borell", "Bobkov", "weighted perimeter", "Sudakov", "multi-bubble|double-bubble", "simplicial cluster", "Gaussian symmetr", "isoperimetric profile": no hit outside this roadmap (the only "Borell"/"weighted perimeter"/"Gaussian symmetr" hits are unrelated strings in NoncompactQuantumSymmetry, TensorProductCombinatorics, MaassForms). The board index lists AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory only. This roadmap is the owner of weighted perimeter, clusters, the Gaussian profile, Gaussian symmetrisation and the Gaussian isoperimetric statements.

**Sampled locators** (read at the cited lines; all support the statement as written):

| target | source line(s) | what the text says | verdict |
|---|---|---|---|
| 1.3 | MilmanNeeman2022 481–483, 490–497; Ledoux1993 251–252 | product structure; (2.1): `√(q/(q−1)) Z_i` and `(Z_i − Z_j)/√2` standard normal; half-space measure computed in dimension 1 | supports |
| 2.4 | CianchiFuscoMaggiPratelli2011 209–213; MilmanNeeman2022 939–947 | LSC under `L¹_loc`; `L¹(μ)` compactness of `{P_μ ≤ C}` for finite mass by truncation and diagonalisation | supports |
| 2.6 | Maggi2012 TOC lines 78–79, 98–101 | sections 13.1 (coarea) and 18.1–18.3 exist; text not in the extract | by locator |
| 3.1 | MilmanNeeman2022 57–70, 697–702; Maggi2012 716–725 | cluster definition, `P(Ω) = ½ Σ P(Ω_i)`, `q = 2` case; smooth positive density `e^{−W}` | supports (README's Lebesgue-measurable cells and `C¹` weight are its own, wider, choice) |
| 4.2 | MilmanNeeman2022 76–82 | Voronoi cells of `q` equidistant points, interiors | supports |
| 4.7 | MilmanNeeman2022 660–666 | `I(v) ≤ I_m^{(q−1)}(v)` for `v ∈ Δ^{(q−1)}`, `n ≥ q − 1` | supports |
| 5.3 | CianchiFuscoMaggiPratelli2011 220–223, 233–248 | Prop. 3.1 with the equality case (half-lines up to null sets); countable-union structure | supports |
| 6.1 | CianchiFuscoMaggiPratelli2011 543–552; Ehrhard1983 117–129 | `v_E = γ¹(E_z)`, superlevel epigraph `{y > Φ⁻¹(v_E)}`; Ehrhard's `S(T,u)` with `H(u,a) = {⟨x,u⟩ > a}` (line 66) | supports; mirroring correctly recorded |
| 6.5 | CianchiFuscoMaggiPratelli2011 624–640 | Lemma 4.5, (4.10), with `p_{E^s} = I(v_E)` in their weights | supports (normalisation: see Source issues) |
| 7.2 | CianchiFuscoMaggiPratelli2011 913–966 | Steps III–IV: `H¹` convex and open; complement likewise; half-space | supports |
| 7.3 | CianchiFuscoMaggiPratelli2011 508–509 (`n ≥ 2`); MilmanNeeman2022 47–52, 83–84; Ledoux1999 212–219; Borell1975 88–99 | theorem with equality; `n = 1` from Prop. 3.1 | supports |
| 8.1 | Borell1975 88–99; Ledoux1993 241–256; Ledoux1999 220–247; Ehrhard1983 358–359 | inner measure of `A + εO_X ≥ Φ(α + ε)`, `α ∈ [−∞, ∞]`; `Φ(a) ≤ γ(A)` form; ellipsoid `M(B₂)` for covariance `M^tM` | supports |
| 8.4 | Ledoux1993 257–262; Ledoux1999 225–226 | concentration about a median for 1-Lipschitz `f` | supports (constant: R06) |
| 9.2 | Ehrhard1983 410–439 | Lemme 3.3: `g(a,b) = Φ⁻¹(Φ(b) − Φ(a))` concave; proves Théorème 3.1 for 1-symmetrisations | supports |
| 9.5 | Ehrhard1983 374–376, 458–469 | Théorème 3.2 for nonempty convex Borel `A, B`; proof by the convex hull of `A × {0} ∪ B × {1}` and an `n`-symmetrisation | supports |

Also checked: MilmanNeeman2022 506–543 (Lemma 2.1), 548–564 (Def. 2.2, Lemma 2.3), 669–672 (Prop. 2.4), 750–784 ((3.3)–(3.6)), 892–895 (Lemma 3.4), 909–931 (Thm 4.1); CianchiFuscoMaggiPratelli2011 48–57, 174–208, 295–305, 527–542, 583–588, 597–618, 781–790, 833–846, 889–912; Ehrhard1983 134–140, 212–222, 223–295, 329–359; Ledoux1999 252–271, 296–313. Ehrhard's Lemme 2.2/Corollaire 2.3 condition (the complements of `T₁ ∩ T₂` in `T₁` and `T₂` orthogonal) is equivalent to the README's 9.1 condition on `F_i = T_i^⊥`: with `F_i = ℝu ⊕ G_i`, the complement of `T₁ ∩ T₂` in `T₁` is `G₂` and in `T₂` is `G₁`.

**Adversarial table** (every value recomputed in double precision with adaptive Simpson; `Φ⁻¹` by bisection and Newton):

| statement | instances tried | values computed | result |
|---|---|---|---|
| Conventions, normalisation | half-space `{⟨x,ν⟩ > 1}` | `1 − Φ(1) = 0.158655`, `φ(1) = 0.241971`, `e^{−1/2} = 0.606531`, ratio `2.506628 = √(2π)` | agrees |
| Conventions, Gauss–Green sign | `U = (−∞, s)`, `n = 1` | `∫_{−∞}^s (X′ − tX)φ = [Xφ]_{−∞}^s = X(s)φ(s)`; outward `ν = +1` | agrees |
| Conventions, `L_A` for `q = 2` | `u = (e₁ − e₂)/√2` | `L_A u = A((e₁−e₂)(e₁−e₂)ᵀ)u = 2A u` | agrees |
| 1.1 `I`, derivatives | `v = 1/2, 1/3, 2/3, 0.3`; endpoints | `I(1/2) = 0.398942`, `I(1/3) = I(2/3) = 0.363600`, `Φ⁻¹(1/3) = −0.430727`; second difference at `0.3`: `−2.876107` vs `−1/I = −2.876104`; `I′(0.3) = 0.524401 = −Φ⁻¹(0.3)`; `φ(quantile junk 0) = 0.398942 ≠ 0` | agrees |
| 1.2 tails | `r = 0, 1, 2` | `0.158655 < 0.241971 < 0.303265`; `0.022750 < 0.067668`; at `0` both sides `1/2` | agrees (attribution: R06) |
| 1.3 splitting | `ℝ²`, `F = ℝ(e₁+e₂)/√2`; `q = 3` | `Φ(1) = 0.841345`; `1 − Φ(√1.5) = 0.110336` vs reciprocal `0.207108`; `(2π)^{−1} = 0.159155` | agrees |
| 2.1 wrong model | `U = ℝ`, no `−⟨∇W,X⟩` term | `sup ∫ tX dγ = ∫|t| dγ = 2φ(0) = 0.797885 ≠ 0` | agrees; law `div(e^{−W}X) = e^{−W}div_μ X` excludes it |
| 2.1 local comparison | `Ω′ ⋐ Ω` | `min e^{−W}·|Du| ≤ V_μ ≤ max e^{−W}·|Du|` via `Y = e^{−W}X`, `X̃ = (min e^{−W}) e^{W} X` | holds |
| 2.2 | `(−1,1)`; disc with null modifications | `2φ(1) = 0.483941`, `γ = 0.682689`, `I = 0.356343`; `P_γ = 0.606531` unchanged | agrees |
| 2.3 ball, half-space | `n = 1, 2`, `r = 1` | `2φ(1) = 0.483941`; `e^{−1/2} = 0.606531`, `γ = 0.393469`, `I = 0.384633 < 0.606531` | agrees |
| 2.4 strictness | `U_k = (−1,1) ∪ (1+1/k, 2)` | `3φ(1) + φ(2) = 0.779903 > 0.295962` | agrees |
| 2.5 translation derivative | `U = {x₁ < s}`, `w = e₁` | `d/dt Φ(s+t)|₀ = φ(s)`; boundary integral `⟨e₁,e₁⟩φ(s)` | agrees |
| 2.6 coarea | `f = ‖x‖`, `ℝ²`; `u = t` on `ℝ` | `∫_0^∞ e^{−r²/2} r dr = 1.000000`; `∫ φ = 1 = ∫ P_γ((s,∞)) ds` | agrees |
| 3.1 total perimeter | three intervals; `(E, ∅)` | `½(φ(a) + φ(a) + φ(b) + φ(b)) = φ(a) + φ(b)`; `0`, `(1, 0)` | agrees |
| 3.2 negative control | half-annuli `2^{−2k−1} ≤ ‖x‖ < 2^{−2k}` | each boundary length `2^{−2k}(3π/2 + 1)`, Gauss–Green vector `0`; at `r = 2^{−2k−1}` the ratio `Dχ(B_r)/|Dχ|(B_r)` is `0`, at `r = 2^{−2k}` about `0.447` in norm: no unit limit, origin `∉ ∂*Ω₂`, `∈ ∂*Ω₁` | agrees; closures agree (support of `Hⁿ⁻¹|∂*U` is `closure ∂*U` by the lower density bound) |
| 3.3 | three intervals; `(E, ∅, ∅)` | `⟨a, L_A a⟩ = φ(a)(a₁−a₂)² + φ(b)(a₂−a₃)²`, zero only at `0`; `L_A = 0` at a vertex | agrees |
| 3.4 finiteness | `ρ = c(1+y²)e^{−x²(1+y²)⁴}` | `∫∫ρ = cπ^{3/2}`; `{x = 0}` has length `∫c(1+y²)dy = ∞`; `{x = t ≠ 0}` has length `c√π/(1+t²)·…< ∞` | R03 |
| 4.1 model | `q = 3`, `x = 0` | `A = ∫_0^∞ (2π)^{−1}e^{−s²/2} ds = 0.199471`, `P = 0.598413`; conormals `(−1,−1,2)/√6` etc. sum to `0` | agrees |
| 4.3 derivative sign | `q = 2`, `t = 0.7` | `Ψ₁(tu) = Φ(−t)`, derivative `−φ(0.7) = −0.312254` (difference quotient `−0.312254`); `−(L_A u)₁/√2 = −φ(t)` | agrees |
| 4.3 injectivity | `y − x = (1, 1, −2)` | no open cell contains it; `i = 1` maximal gives `y + Ω₁ ⊊ x + Ω₁` with an open difference near `x` | agrees (Milman–Neeman's step is a gap, see Source issues) |
| 4.4 wrong model | `q = 2`, `v = (Φ(1), 1 − Φ(1))` | `⟨v − (½,½), u⟩ = 0.482734`, `φ = 0.355065 ≠ φ(1) = 0.241971` | agrees |
| 4.6 | `q = 2`; `q = 3` at the centre | `I″(v₁)/2 = −1/(2A₁₂)`; `L_A = 3A·Id`, `∇²I_m = −1.671086 Id`, `−tr(∇²I_m)⁻¹ = 2·0.598413 = 1.196827` | agrees |
| 4.7 | `n = 1`, `q = 3` | three intervals: `2I(1/3) = 0.727200 > 0.598413`; statement correctly not claimed for `n < q − 1` | agrees |
| 5.1 | `(0,1) ∪ (1,2)`; `ℚ` | `T = {0, 2}`, `φ(0) + φ(2) = 0.452933`; `T = ∅` | agrees |
| 5.2 shifts | `(0,1)`; `(−1,0)` | `γ = 0.341345`, `0.640913 → 0.366963 = I(0.341345)`; right shifts of `(−1,0)`: `0.664218`, `0.722510 > 0.640913` | agrees |
| 5.3 | `(−∞, −0.430727)`; `(−1,1)`; `(−∞,0) ∪ ℚ` | `0.363600`; `0.483941 > 0.356343`; equality up to null sets | agrees |
| 6.1 disc | `e = e₂` | `γ(S_e U) = ∫ v_U φ = 0.393469`; section over `0`: `Φ⁻¹(0.682689) = 0.475231` | agrees |
| 6.2 Jacobian | `{x₂ < m x₁}`, `m = 1` | `√(1+m²) · 1/√(1+m²) = 1`; reciprocal would give `2` | agrees |
| 6.3 sign and weight | `{x₂ < a + bx₁}` | `v′ = bφ(a+bz)`; formula with outward `ν = (−b,1)/√(1+b²)`: `−φ·(−b) = bφ`; `e^{−t²/2}` weight gives `√(2π)bφ` | agrees |
| 6.3 bound | `a = b = 1` | `∫φ(1+z)φ(z)dz = e^{−1/4}/(2√π) = 0.219695 ≤ φ(1/√2) = 0.310697` | agrees |
| 6.4 | tilted half-plane; slab | `√2 · 0.219695 = 0.310697`; `2φ(1)` both sides | agrees |
| 6.5 | `{x₂ < a}`; tilted half-plane | `0 + φ(a)`; `0.439391 > 0.310697` | agrees |
| 6.6 disc | `e = e₂` | `0.517483` (two methods) vs printed `0.516961` | R01 |
| 7.1–7.3 | half-space; disc; `∅` | sections half-lines; disc section `(−1,1)` two points, `0.606531 > 0.384633`; `γ(∅) = 0` needs the disjunct | agrees |
| 7.3 separation | `0 < r < 1` | `H⁽¹⁾`, `(E∖H)⁽¹⁾` nonempty open convex disjoint, union conull; strict separation gives a half-space a.e. | holds |
| 7.4 | `(½,½)`; `(1,0)` | `0.398942`; `0`, `(E, ∅)` not simplicial, uniqueness interior only | agrees |
| 8.1 | `{x₁ < a}`; disc, `r = 1`; `r = 0`; `S` not PSD | equality; `a = −0.270289`, `0.864665 ≥ Φ(0.729711) = 0.767217`; `thickening 0 = ∅`; `δ_m(A) = 1 ≥ Φ(a+r)` | agrees |
| 8.1 route | `G = Φ⁻¹∘f` | `f(s) − f(s′) ≥ ∫_{s′}^s I(f)`, `G′ ≥ 1` a.e., `∫G′ ≤ G(s) − G(s′)` by `intervalIntegral_deriv_mem_uIcc` | holds |
| 8.2 | half-space; disc; `ℚ²` | `φ(a)`; `e^{−1/2} = 0.606531 ≥ 0.384633`; `1/r → ∞` | agrees |
| 8.3 | `Φ(x)`, `Φ(2x)`; `min(x²,1)`; constants | `√2∫φ² = 0.398942`; `√5∫φ(2x)φ(x) = 1/√(2π) = 0.398942`; `∫f = 0.516059`, `I = 0.398619`, right side `0.647406` | R02 (one value) |
| 8.3 frontier | continuous `f` | closure points exist only over `{0 < f < 1}`; Jacobian `√(1 + ‖∇f‖²/I²)` times density `e^{−W_E}I(f)` | holds |
| 8.4 | `x₁`, `m = 0`; constant, `r = 0`; `|x₁|` | `1 − Φ(2) = 0.022750 ≤ 0.067668`; `γ{f ≥ m} = 1 > ½`; median `0.674490`, mean `0.797885` | agrees; `L = 0` works (R05) |
| 8.5 | `S = (1)`; `I₂`; `S = 0` | `Φ⁻¹(√½) = 0.544952`, `1 − Φ(2.544952)² = 0.010899 ≤ 0.022750`; `‖Ke_i‖² = S_ii` | agrees |
| 9.1 | closed disc; ball in `ℝ³`; composite | `Φ⁻¹(0.393469) = −0.270289`; `γ(B³) = 0.198748`, `Φ⁻¹ = −0.846102`; `F₁ ∩ F₂ = ℝe₃`, `ℝe₁ ⊥ ℝe₂` | agrees |
| 9.1 laws | `S(E∖C) = E∖S̄_{F,−u}(C)` | `{Φ(⟨y,u⟩) < 1 − v} = {Φ(⟨y,−u⟩) > v}` | holds |
| 9.2 | Hessians of `g` at four points; `g(−1,1)` | `(−0.459912, −0.459912, −0.219127)`, det `0.163502`; dets `0.015519`, `0.000142`, `15.273135`; `0.475231` | agrees |
| 9.3 | directions `u_j` | angles `90°, 135°, 157.5° → 180°`; Ehrhard Thm 1.6 hypotheses `γ₂(F) ∈ [ε, 1−ε]`, uniform | agrees |
| 9.4 | two discs | symmetral a half-plane, convex | agrees |
| 9.5 | `[−1,1]`, `[−3,3]`, `λ = ½`; Borell recovery | `1.690143 ≥ 1.628703`; `0.954500 ≥ 0.948312 ≥ 0.825134`; `0.9·0.623371 + 0.1·9.931 = 1.554146 < 1.690143`, limit `1.475231` | agrees |

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts (Mathlib, Tau Ceti, three roadmaps), How to read the build, nine layers with `### k.n` prose subsections, each layer ending with `### Examples` and `### Dependencies`, Downstream consumers, References. Ten definitions (1.1, 2.1, 3.1, 3.4, 4.1, 4.2, 4.4, 6.1, 8.3, 9.1), each with API bullets and three Checks; 36 theorems with hypotheses in the sentence and a locator at the claim; `*Needs:*` on every target; plan.json: 9 layers, 46 targets, 126 tests, suppliers and consumers as in the README, `gaps: []`. No LaTeX delimiters, no pull-request numbers, no paths; the only process-like residue is R07.

**Headline theorems and `Suggested.lean`** (for the package stage; not applicable at the design): the headlines are 7.3 (isoperimetric theorem with equality), 7.4 (two-cell form), 8.1 (Borell–Sudakov–Tsirelson, general Gaussian law), 8.3 (Bobkov and converse), 8.4 (median concentration), 9.5 (Ehrhard for convex sets), 4.6 (`∇²I_m = −L_A⁻¹`). At the pins, 8.1, 8.4, 8.5 and 9.5 are statable with no new definition (`stdGaussian`, `multivariateGaussian`, `Metric.thickening`/`cthickening`, `cdf (gaussianReal 0 1)`, `Set` Minkowski combinations); 7.3 and 8.3 are statable once `P_γ` is given its real body (supremum over `ContDiff` compactly supported fields of `∫_U (div X − ⟨x, X⟩) dγ`) and `I` its body on `MeasureTheory.Measure.quantile`; 7.4 and 4.6 need clusters and the model profile and belong in the module docstring as not statable. Elaboration: not available (this lane does not elaborate).

## Not verifiable

- Maggi2012 Theorem 15.9, Proposition 12.15, Theorem 12.26, Sections 13.1 and 18.1–18.3, Exercise 29.7: the cvgmt extract holds only front matter, the table of contents and the Part IV synopsis; the table of contents confirms sections 12.1, 12.4, 13.1, 15.2, 18.1–18.3 and 29.7 exist; the theorem texts could not be read.
- AmbrosioFuscoPallara2000 Theorem 3.108, Bogachev1998 Chapter 4, CarlenKerce2001 Theorem 1, SudakovTsirelson1974 Theorem 1, Ledoux1996 Chapter 1: uncertified (paywalled or unreachable); cited by locator as the manifest records.
- Bobkov1997 Theorem 1.1: the author-page PDF's text layer is unusable (glyph names); the inequality is verified from Ledoux1999 (1.11), line 296–313.
- Ehrhard1983 lines 227, 230, 250, 419, 426, 430: OCR garbled (mirrored text); the statements of Proposition 1.5 and Théorème 1.6 were read from the surrounding lines 220–222, 247–253.

## Source issues

- **Gap** in MilmanNeeman2022 at Lemma 2.1, printed page 11 (arXiv v3): the injectivity step asserts that for `y ≠ x` some open cell `x + Ω^m_i` contains `y`, which fails when `y − x` has a tied maximal coordinate; it should take `i` with `(y − x)_i` maximal, for which `y + Ω^m_i ⊊ x + Ω^m_i` still holds; affects the proof.
- **Error** in MilmanNeeman2022 at equation (3.6), printed page 18: claims `∂*Ω_i` equals the union of the interfaces `Σ_ij` as sets, via equality of supports; it should assert equality of closures (a cluster of half-annuli gives a point of `∂*Ω_1` on no interface); affects nothing (used only up to null sets).
- **Misprint** in CianchiFuscoMaggiPratelli2011 at equation (2.5), printed page 5: the supremum formula integrates `div φ − x·φ` against the probability measure `γ_n`, which is `(2π)^{−1/2}` times the perimeter `H^{n−1}_γ(∂^M E)` of (2.4); it should carry the factor `√(2π)`; affects nothing (only lower semicontinuity is drawn from it).
- **Misprint** in CianchiFuscoMaggiPratelli2011 at Lemma 4.4, equation (4.8), printed page 12: the section weights `e^{−y²/2}` of `H⁰_γ` make the right side `√(2π)` times the derivative of `v_E = γ_1(E_z)` (a tilted half-plane gives `√(2π) b φ(a + bz)` against `v_E′ = b φ(a + bz)`); it should carry `(2π)^{−1/2}`, or `v_E` should be weighted by `e^{−y²/2} dy`; affects the proof (the same convention must be read through (4.6), (4.10) and (4.14)).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "9be68dd34fa60e3f38584a9e68e40301612408be", "job": "REV-DESIGN-GaussianIsoperimetryAndClusters", "model": "fable", "worker": "chris-x19"} -->
