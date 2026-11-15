<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16957#issuecomment-6901788349 -->
Red team round 1 pass a (claude) of d462415

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P2) A statable headline is absent from `Suggested.lean`: the upper bound `I^{(q−1)} ≤ I_m^{(q−1)}` of §4.7

   Location: `packages/GaussianIsoperimetryAndClusters/README.md:15` ("This roadmap proves the case `q = 2` (§7.4) and the inequality `I^{(q−1)} ≤ I_m^{(q−1)}` for `2 ≤ q ≤ n + 1` (§4.7)") and `README.md:422`; `packages/GaussianIsoperimetryAndClusters/Suggested.lean:41` ("Every headline theorem of the roadmap is statable at the pins; none is omitted").

   Claim: the file states every headline theorem. The Scope section names two results of this roadmap on the multi-bubble problem: the case `q = 2` (stated, lines 330 and 340) and the inequality of §4.7 (not stated). §4.7 is the only target of this roadmap that consumes `modelMeasureMap_diffeomorph` and the model profile for `q ≥ 3`; without it Layer 4 is in the file only as two intermediate results.

   Witness: every carrier of §4.7 on the open simplex is already a kept definition: `isoperimetricProfile` (line 183), `gaussianWeight` (line 88), `modelProfile` (line 249). No new definition is needed.

   Repair: add to the Layer 4 section of `Suggested.lean`, after `modelProfile_hessian` (it must come after `isoperimetricProfile`, which it is; the binders for `E` are explicit because the `Model` section has no `E`):

   ```lean
   /-- **The model profile bounds the isoperimetric profile** (§4.7). For `2 ≤ q ≤ n + 1`,
   `n = dim E`, and `v` in the open simplex, `I^{(q−1)}(v) ≤ I_m^{(q−1)}(v)`: a simplicial `q`-cluster
   of `E` with measure vector `v` is a competitor (MilmanNeeman2022, Section 2, after Lemma 2.3). -/
   theorem isoperimetricProfile_le_modelProfile {E : Type*} [NormedAddCommGroup E]
       [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E] {q : ℕ}
       (hq : 2 ≤ q) (hqn : q ≤ Module.finrank ℝ E + 1) {v : Fin q → ℝ} (hv : ∀ i, 0 < v i)
       (hsum : ∑ i, v i = 1) :
       isoperimetricProfile (gaussianWeight E) q v ≤
         ENNReal.ofReal (modelProfile q (WithLp.toLp 2 v)) := by
     sorry
   ```

   In `README.md:422` add "(`isoperimetricProfile_le_modelProfile`, for `v ∈ int Δ^{(q−1)}`, where `modelProfile` is the model profile)" after the statement; add the name to the list of `README.md:5` and a line "the model profile bounds the isoperimetric profile for `2 ≤ q ≤ n + 1` (§4.7)" to the Layer 4 bullet of the module docstring. This pass ran no Lean: elaborate the addition and compare `#check @isoperimetricProfile_le_modelProfile` with §4.7.

   Tested on: `q = 2`, `n = 1`, `v = (1/2, 1/2)`: left `I(1/2) = 0.398942` (§7.4), right `A^m_12(0) = φ(0) = 0.398942`, equality. `q = 3`, `n = 2`, `v = (1/3, 1/3, 1/3)`: right `0.598413`, the tripod is a competitor. Negative control for `hv`: `q = 3`, `v = (1/2, 1/2, 0)`: `modelProfile` is `0` off the range of `Ψ`, the left side is `0.398942`, so the statement without `hv` is false. `hqn` excludes `q = 3`, `n = 1`, which §4.7 does not claim.

2. **F02** (P2) GeometricMeasureTheory G4 is cited for a statement it does not make; the pin gives it in one step

   Location: `README.md:105` ("G4: the pointwise mollification estimate `|∇(u ∗ ρ_ε)| ≤ |Du| ∗ ρ_ε` as measures"), `README.md:13`, `README.md:114` ("No supplier contract is missing: every input above is a stated target of its roadmap"), §6.5 `README.md:529` (route and *Needs:*), `README.md:554`.

   Claim: the pointwise mollification estimate is a stated target of GeometricMeasureTheory G4.

   Witness: `TauCetiRoadmap/GeometricMeasureTheory/README.md:215` says only "Establish convolution estimates"; no pointwise or measure-valued form is stated in G4 (search of that README for "pointwise", "as measures": no hit in G4). The estimate follows from pinned `TauCeti.integral_lineDeriv_mul_eq_neg_integral_mul_inner_polarDensity` (TauCeti/Analysis/BoundedVariation/PolarDecomposition.lean:292).

   Repair (removes the G4 edge instead of declaring a gap):

   - Delete the G4 bullet of `README.md:105`, and in `README.md:13` delete "the pointwise mollification estimate for BV functions (GeometricMeasureTheory G4);".
   - In the Tau Ceti contract (after `TauCeti.ae_eq_polarDensity`, `README.md:85`) add: "`TauCeti.integral_lineDeriv_mul_eq_neg_integral_mul_inner_polarDensity` (same file, line 292): for `u` locally integrable on `Ω` with locally finite variation, a scalar test function `ψ ∈ 𝓓(Ω, ℝ)` and a vector `w`, `∫ ∂_w ψ · u = −∫ ψ ⟨w, σ_u⟩ d|Du|`."
   - In the route of §6.5 replace "pass to the limit with `‖∇(v_U ∗ ρ_ε)‖ ≤ |Dv_U| ∗ ρ_ε`" by: "pass to the limit with the pointwise bound `‖∇(v_U ∗ ρ_ε)(x)‖ ≤ ∫ ρ_ε(x − y) d|Dv_U|(y)`, which holds because `TauCeti.integral_lineDeriv_mul_eq_neg_integral_mul_inner_polarDensity`, applied to the test function `y ↦ ρ_ε(x − y)`, gives `∂_w(v_U ∗ ρ_ε)(x) = ∫ ρ_ε(x − y) ⟨w, σ(y)⟩ d|Dv_U|(y)` with `‖σ‖ = 1` `|Dv_U|`-almost everywhere".
   - In the *Needs:* of §6.5 replace "GeometricMeasureTheory G4 (mollification)" by "Tau Ceti `TauCeti.integral_lineDeriv_mul_eq_neg_integral_mul_inner_polarDensity`, `TauCeti.ae_norm_polarDensity_eq_one`; Mathlib `ContDiffBump.normed`"; in `README.md:554` replace "G2, G4, G5" by "G2, G5".

   Tested on: `u = χ_{(−∞, 0)}` on `ℝ`: `Du = −δ_0`, `σ_u(0) = −1`, `(u ∗ ρ_ε)′(x) = −ρ_ε(x)` and the formula gives `∫ ρ_ε(x − y)(−1) dδ_0(y) = −ρ_ε(x)`; the bound is the equality `ρ_ε(x) = (|Du| ∗ ρ_ε)(x)`. Sign of the test function: `∂_{w,y}[ρ_ε(x − y)] = −(∂_w ρ_ε)(x − y)`, so `∂_w(u ∗ ρ_ε)(x) = −∫ ∂_{w,y}[ρ_ε(x − y)] u(y) dy = +∫ ρ_ε(x − y) ⟨w, σ⟩ d|Du|`.

3. **F03** (P3) The route of §8.1 does not cover `n = 0`, which the statement and the Lean include

   Location: `README.md:609` (route: "the coarea formula of §2.6 gives … `γ^{n−1}({d_A = τ})` … §2.3 and §7.3 give"); `README.md:21` ("a statement with no such hypothesis, such as §7.3 and Layer 8, also holds for `n = 0`"); `Suggested.lean:353` (no `[Nontrivial E]`).

   Claim: the route proves §8.1 at the stated generality.

   Witness: §2.3 and §2.6 (a) are stated with `μHE[n − 1]`, which the Conventions exclude for `n = 0` (natural subtraction gives `μHE[0]`). §7.3's route treats `n = 0` separately; §8.1's does not.

   Repair: insert at the start of the route of §8.1: "For `n = 0`, `Φ(a) ≤ γ(A)` forces `A = E = {0}`, and `Metric.thickening r E = E` has measure `1 ≥ Φ(a + r)`; let `n ≥ 1`." Tested on `E = {0}`, `A = {0}`, `r = 1`: `thickening 1 {0} = {0}`, `γ = δ_0`, `1 ≥ Φ(a + 1)`; `A = ∅`: no real `a` has `Φ(a) ≤ 0`.

4. **F04** (P3) `Ledoux1996` is listed with a chapter locator and supports no target

   Location: `README.md:768` ("Chapter 1, background for Layers 7–8, cited by locator").

   Claim: every listed work is cited for a result with an exact locator.

   Witness: `Ledoux1996` occurs once in the README, in the References; `packages/GaussianIsoperimetryAndClusters/sources.toml` records `cited_for = ["References"]`, `locator = "Chapter 1"`, `status = "uncertified"`. No target, Check or docstring cites it.

   Repair: delete the entry of `README.md:768` and the `Ledoux1996` table of `sources.toml`. Every statement of Layers 7–8 already has a locator into Ledoux1993, Ledoux1999, Borell1975, Bobkov1997 or CianchiFuscoMaggiPratelli2011.

5. **F05** (P3) Maggi2012 theorem and proposition numbers are cited as if read; the cached text has only the contents and the Part IV synopsis

   Location: `README.md:190`, `:212`, `:222` ("Maggi2012 Theorem 15.9", "Maggi2012 Proposition 12.15 and Theorem 12.26"); `Suggested.lean:111`; `sources.toml` (`Maggi2012`: `status = "certified"`, `version_note` "chapter-level locators are cited from the published book without its text").

   Claim: the locators are verified against the text, as the other certified sources' are.

   Witness: Maggi2012 line 1–2 (a 38-page extract) holds the front matter, the contents (line 68–101, 161–169) and the synopsis (line 713–727). The contents confirm Sections 12.1, 12.4, 13.1, 15, 18.1–18.3; the numbers "Theorem 15.9", "Proposition 12.15", "Theorem 12.26", "Exercise 29.7" occur nowhere in it. MilmanNeeman2022 line 756, 939 and 946 cite the same three numbers, which corroborates them.

   Repair: where the README cites these, write "Maggi2012 Theorem 15.9, cited by locator" (`README.md:190`, `:222`) and "Maggi2012 Proposition 12.15 and Theorem 12.26, cited by locator" (`README.md:212`), as `README.md:283` already does for Exercise 29.7, and in the References entry (`README.md:765`) replace the list by "Sections 13.1 and 18.1–18.3 and the Part IV synopsis (contents and synopsis read); Theorem 15.9, Proposition 12.15, Theorem 12.26 and Exercise 29.7, cited by locator". No statement changes.

Two P2 findings (R01, R02) and three P3 findings (R03–R05). No statement of `Suggested.lean` or bold README target was found false on any instance tried; the tables under `## Verified sound` give the values.

## Verified sound

Counts: 36 declarations of `Suggested.lean` read (17 definitions and structures, 19 theorems), every line; 768 README lines read, 45 target sections (§1.1–§9.5) with their bullets; 155 Check bullets, of which the numerical values of 96 were recomputed (error function, bisection for `Φ⁻¹`, midpoint quadrature; all agree to the six printed places, the one exception being a finite-difference Hessian determinant at `(0.5, 0.6)`, `15.645` against the printed `15.648788`, within the error of the difference scheme near the degenerate line `a = b`); 96 pinned-library locators checked mechanically (name on the cited line of the cited file at the pins), all correct, and 14 pinned statements read against their README descriptions; 58 source line locators read against the cached texts (MilmanNeeman2022 22, CianchiFuscoMaggiPratelli2011 17, Ehrhard1983 10, Ledoux1999 5, Ledoux1993 2, Borell1975 1, Maggi2012 1), all pointing at the cited statement; sibling citations checked: GeometricMeasureTheory G2, G4, G5, G6, Isoperimetry I1, I2, I4, RandomMatrices 2.2, BanachSpaceTheory B7, all on main with those section ids (G4 as in R02).

Elaborated signatures: the worker's listing of the 36 elaborated types was compared with the README statements (no Lean was run in this pass). The three flagged definitions lose only instances their bodies do not use (`gaussianWeight`: `FiniteDimensional`, `MeasurableSpace`, `BorelSpace`; `gaussianSymmetral`, `closedGaussianSymmetral`: `BorelSpace`); every theorem that mentions them carries the full instance block. No theorem lost a hypothesis. `weightedVariation_eq_lintegral_variationMeasure` integrates over `↥Ω` against `TauCeti.variationMeasure volume Ω u : Measure ↥Ω`, as §2.2 says.

Dependency check (the command of the brief): `depcheck: 239 roadmaps, 2243 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.

Ownership: `roadmaps grep` for Gaussian isoperimetry, Ehrhard, Bobkov, Sudakov–Tsirelson, Borell, Gaussian or weighted perimeter, isoperimetric profile, double or multi-bubble, and the Lean names `gaussianIsoperimetric`, `isoperimetricProfile`, `weightedPerimeter`, `gaussianPerimeter` found no other owner on main or at the open heads (the only hits are mixed-Tsirelson spaces in BanachSpaceTheory and unrelated text). The 235 open heads listed for this job contain no roadmap on Gaussian measures, concentration or perimeter. The pinned Tau Ceti has no weighted divergence, weighted perimeter, cluster, Gaussian symmetral or Gaussian isoperimetric statement (grep by object; `Gaussian/Maximum.lean` is a lower bound for the expected maximum of independent Gaussians, not §8.5; `BoundedVariation/BlowUp.lean`, `HalfSpace.lean` and `LowerDensityEstimates.lean` are steps toward De Giorgi's theorem, which the pin does not state). This roadmap is the owner of what it states. No fully qualified name of `Suggested.lean` occurs in another roadmap.

Policy: the pull request changes only the package folder; no pull-request number, process narrative, `lemma`, `set_option`, `#eval`, sorry'd data or `True` placeholder; every target has a locator; each definition has at least three discriminating Checks. Padding probe: none of the 19 theorems follows from one tactic or one library lemma, restates a definition or mirrors a Check.

Unused hypotheses (note, not a finding): `convex_closedGaussianSymmetral` holds without `u ∈ F` and `‖u‖ = 1` (the set is `{⟨x, u⟩ ≤ Φ⁻¹(v_C(P_{F^⊥} x))}` with a concave right side); the last repair report records the same and keeps them because they are what makes the set a symmetral.

### The pass: `Suggested.lean`

| Declaration (line) | Instances tried | Values on each side | Result |
|---|---|---|---|
| `gaussianIsoperimetricProfile` (56) | `v = 0, 1`; `1/2`; `1/3`; wrong model `φ(quantile)` at `0` | guard gives `0, 0`; `0.398942`; `0.363600`; unguarded `φ(0) = 0.398942` since the pinned quantile is `sInf ∅ = 0` at level `1` and `0` at level `0` | guard needed, present |
| `weightedVariation`, `weightedPerimeter` (71, 77) | `W = 0`; `U = ℝ` under `γ`; model without `−DW(X)` | reduces to `totalVariationOn volume`; `0`; `∫ |t| dγ = 0.797885 ≠ 0` | determined |
| `weightedMeasure`, `gaussianWeight` (81, 88) | `n = 2` at `0`; `n = 0` | `e^{−W(0)} = (2π)^{−1} = 0.159155`; `W = 0`, `δ_0` | agrees with `stdGaussian_eq_withDensity_norm` |
| `gaussianPerimeter` (93) | `{x_1 < 1}`; disc in `ℝ²`; `(−1, 1)` | `φ(1) = 0.241971`; `e^{−1/2} = 0.606531`; `2φ(1) = 0.483941` | consistent with §2.3 |
| `weightedVariation_eq_lintegral_variationMeasure` (100) | `u = χ_{(−1,1)}`, `γ`; `n = 0`; `hfin` with `U ⊄ Ω` | `2φ(1)` both sides; `0 = 0`; monotonicity of `totalVariationOn` gives the local form | true as typed |
| `weightedPerimeter_eq_lintegral_reducedBoundary` (113) | `n = 1`, `(0,1) ∪ (1,2)`; ball plus dense null set | `∂* = ∂^M = {0, 2}`, `φ(0) + φ(2) = 0.452933`, counting measure `μHE[0]`; `0.606531` on all three sides | true; `hn` needed |
| `integral_weightedDivergence_eq_integral_reducedBoundary` (130) | `n = 1`, `U = (−∞, s)`; inner-normal model; `U` non-measurable off `Ω` | `∫_{−∞}^s (X′ − tX)φ = X(s)φ(s)` both sides; `−X(s)φ(s)`; integrand supported in `Ω`, restriction well defined | outer normal, as at the pin |
| `weightedVariation_eq_lintegral_weightedPerimeter` (145) | `u = χ_U`; `u(t) = t` under `γ`; `u ∉ BV_loc` | `∫_0^1 P = P`; `1 = ∫ φ`; `∞ = ∞` | true |
| `Cluster`, `Cluster.perimeter` (164, 177) | `q = 0`; `q = 1`; three intervals; `n = 0`, `q = 2` | none (`volume univ ≠ 0`); `(E)`, perimeter `0`; `φ(a) + φ(b)`; only `(E, ∅)`, `(∅, E)` | as README §3.1 |
| `isoperimetricProfile` (183) | vertex `(1, 0)`; `n = 0`, `(1/2, 1/2)` | `0`; empty infimum `⊤` | as §3.4 |
| `exists_cluster_perimeter_eq_isoperimetricProfile` (192) | `q = 0` (`Σ v = 0 ≠ 1`, vacuous); `q = 1`; `v_i = 0`; density with an infinite-length line; weight `0` | —; `(E)`; empty cells allowed; profile finite by annuli (`∫(1 + y²)e^{−t²(1+y²)⁴} dy < ∞` for `t ≠ 0`, total mass `π^{3/2}c`); excluded by `hμ` | true; `Nontrivial` and `hμ` needed |
| `simplexTangent`, `modelCell`, `modelMeasureMap` (207–225) | `q = 2`, `x = tu`; `q = 1` | `Ψ_1 = Φ(−t)`; `Ψ(0) = (1)` | as §4.1, §4.3 |
| `modelInterfaceArea` (230) | `q = 2`; `q = 3`, `x = 0`; `i = j` | point mass `φ(t)`; `1/(2√(2π)) = 0.199471`; non-integrable, junk `0`, never read (`i < j`) | as §4.1 |
| `interfaceOperator` (238) | `q = 2`; `q = 3`, `A` constant | `⟨a, L_A a⟩ = A_12(a_1 − a_2)²`; `3A·Id` on `E^{(2)}` | as Conventions |
| `modelProfile` (249) | `q = 2`, `v = (Φ(1), 1 − Φ(1))`; wrong point `v − (1/q)` | `φ(1) = 0.241971`; `0.355065` | determined |
| `modelMeasureMap_diffeomorph` (257) | `q = 2`, `t = 0.7`; `q = 3`, `x = 0`; sign `+` | derivative `−φ(0.7) = −0.312254` both sides; `−0.423142·Id`; `+φ` wrong | true |
| `modelProfile_hessian` (271) | `q = 2`: `g′ = I′(v_1)/√2`, `H(a, b)` for `a = L_A u` | `√2 tτ` both sides; `−2υβ = −⟨u, b⟩`, from `I″ = −1/I` | true |
| `gaussianSymmetral` (298) | `{⟨x, e⟩ < a}`; disc; null line `ℝe_2` | fixed; section at `0` is `(−∞, 0.475233)`; literal image is the line, a.e. `∅` | as §6.1 |
| `gaussianPerimeter_gaussianSymmetral_le` (306) | disc; `n = 1`, `(−1, 1)`; infinite perimeter | `0.517483 ≤ 0.606531`; `0.356343 ≤ 0.483941`; `0.195467 ≤ ∞` | true |
| `gaussian_isoperimetric` (318) | `n = 0`; `U = ∅`; half-space; disc; slab | `0 = 0`, iff true; equality with `γ = 0`; `φ(s) = I(Φ(s))`; `0.606531 > 0.384633`; `0.483941 > 0.356343` | true, both directions |
| `isoperimetricProfile_two_eq` (330) | `v = (1/2, 1/2)`; `(1, 0)`; `n = 0` | `0.398942`; `0`; `⊤ ≠ 0.398942`, excluded by `Nontrivial` | true |
| `Cluster.perimeter_eq_iff_halfSpaces` (340) | half-space pair; `(E, ∅)` | `(φ(s) + φ(s))/2 = I(Φ(s))`; excluded by `h1` | true, both directions |
| `borell_sudakov_tsirelson` (353) | half-space; disc, `r = 1`; `{x_1 < 0} ∪ ℚ²`; `n = 0` | equality; `0.864665 ≥ 0.767217`; `1 ≥ Φ(r)`; `1 ≥ Φ(a + r)` | true for the outer measure (closure has the same thickening) |
| `borell_sudakov_tsirelson_multivariateGaussian` (362) | `S` not PSD; `S = diag(1, 0)`; non-measurable `A` | `δ_m`, `K = 0`, `δ_m(A) = 1`; `(−∞, r) × {0}`, `Φ(r)`; `(T_*γ)^*(A) = γ^*(T⁻¹A)` by the section argument | true for every `S` |
| `gaussian_minkowskiContent_ge` (375) | half-space; `ℚ²`; Bernstein set; `γ(A) ∈ {0, 1}` | `φ(a)`; `∞`; `0.398278`, `0.398936 → 0.398942`; `0` | true in `[0, ∞]` |
| `bobkov_inequality` (384) | `Φ(x)`; `min(x², 1)`; constant; non-integrable gradient | `0.398942` both; `0.398619 ≤ 0.647406`; `I(c)` both; `≤ ∞` | true |
| `gaussian_concentration_median` (394) | `f = x_1`; `L = 0`; `r = 0` | equality `1 − Φ(r)`; empty set; `≤ 1/2` | true |
| `gaussian_max_concentration` (403) | two independent; `S = 0`; `[[1, 2], [2, 1]]` | `0.010899 ≤ 0.022750`; `0`; `δ_0`, `m ≥ 0`, `0` | true for every `S` |
| `closedGaussianSymmetral` (416) | closed disc, `F = ℝ²`; ball in `ℝ³` | `{⟨y, u⟩ ≤ −0.270288}`; `{x_3 ≤ −0.846102}` | as §9.1 |
| `ehrhard_inequality_convex` (423) | `[−1, 1]`, `[−3, 3]`, `θ = 1/2`; `θ = 0`; `A = ∅` | `1.690143 ≥ 1.628704`; `γ(B) ≥ Φ(b)`; vacuous | true |
| `convex_closedGaussianSymmetral` (435) | `{x_1 > 0} ∪ {0} × [0, ∞)`; `F = ⊥` | `{x_1 > 0} ∪ {0} × (−∞, 0]`, convex; vacuous | true |

### The pass: README targets (beyond those stated in Lean)

| Target | Instances tried | Values | Result |
|---|---|---|---|
| §1.1 derivatives of `I` | `v = 0.3`; other normalization | `I′ = 0.524401 = −Φ⁻¹(0.3)`, second difference `−2.876104 = −1/I(0.3)`; `(√(2π)I)″ = −2π/(√(2π)I)` | holds |
| §1.2 tails | `r = 0, 1, 2` | `1/2 = 1/2`; `0.158655 ≤ 0.303265`; `0.022750 ≤ 0.067668` | holds, constant sharp |
| §1.3 coordinate laws | `q = 3` | `1 − Φ(√1.5) = 0.110336`; reciprocal factor `0.207108` | holds |
| §2.3 frontier bound, convex sets | quadrant; closed segment | `2 × 0.199471 = 0.398942 ≥ I(1/4) = 0.317777`; `0 < 0.136177`, openness needed | holds |
| §2.4 lower semicontinuity | `(−1, 1) ∪ (1 + 1/k, 2)` | `0.779903 → 0.295962` | holds, strict |
| §2.5 translation derivative | `{x_1 < s}`, `w = e_1` | `φ(s)` both sides | sign as stated |
| §3.2 interfaces and merging | three intervals; dyadic half-annuli | `0.640913 − 0.398942 = 0.241971`; half-annulus boundary `2^{−2k}(3π/2 + 1)`, Gauss–Green vector `0` | holds; literal set equality fails as stated |
| §3.3 connectivity | `(E, ∅, ∅)` | `L_A = 0` at a boundary point | hypothesis needed, present |
| §4.1 conormals | `(1, 2, 3)` | `(−1, −1, 2) + (2, −1, −1) + (−1, 2, −1) = 0` | holds |
| §4.3 injectivity and properness | tie `y − x = (1, 1, −2)`; bound `Ψ_i ≤ 1 − Φ(√(q/(q−1)) x_i)` | `(z − x)_i − (z − x)_j > 0` for `z ∈ y + Ω_i`; `(z − x)_i > 0` on `x + Ω_i` | holds |
| §4.5 cut pieces | `z_i − z_l` on `{z_i − z_j = c}` | mean `c/2`, variance `6/4 = 3/2` | holds |
| §4.6 trace identity | `q = 3`, centre | `−tr[(∇²I_m)⁻¹] = 1.196827 = 2 × 0.598413` | holds |
| §5.2 shifts | `(0, 1)`; `(−1, 0)` | `0.640913 → 0.366963`; `0.664218`, `0.722510 > 0.640913` | holds, hypothesis `a + b ≥ 0` needed |
| §6.3 gradient formula | `{x_2 < a + bx_1}`; variation bound `a = b = 1` | `bφ(a + bz)` both; `0.219696 ≤ 0.310697` | sign and normalization as stated |
| §6.4 lower bound | tilted half-plane; slab | `√2 × 0.219696 = 0.310697`, equality; `0.483941` both | holds |
| §6.5 upper bound | tilted half-plane; disc | `0.439391 ≥ 0.310697`; `0.386129 + 0.252249 = 0.638378 ≥ 0.517483` | holds |
| §7.2 negative control | strips `{|x_1 − 2^{−k}| < 4^{−k}}` | area fraction `0.032981` at `ρ = 1/16` (bound `(256/27)ρ³`), missing proportion `(5/6)ρ` | as stated |
| §8.1 multivariate route | `(T_*γ)(X) ≥ γ(T⁻¹X)`; `C + rK(B) = (A ∩ L) + rK(B)` | outer measures; `K(B)` open in `range K` | holds |
| §8.3 subgraph | `Φ(2x)`; endpoints | half-plane through `0`, `φ(0)`; `A_0 = ∅`, `A_1 = E × ℝ` | holds |
| §9.1 complement and composition | `S_{F,u}(E ∖ C) = E ∖ S̄_{F,−u}(C)`; two planes in `ℝ³` | `Φ(s) < 1 − v ⟺ ¬(Φ(−s) ≤ v)`; both `{x_3 ≤ −0.846102}` | holds |
| §9.2 concavity of `g` | `(−1, 1)`, `(0, 2)`, `(−3, −0.5)` | `∂²_a = ∂²_b = −0.459912`, determinants `0.163502`, `0.015519`, `0.000142` | negative definite |
| §9.5 comparison Checks | Prékopa–Leindler bound; `θ = 0.9` | `0.954500 ≥ 0.948312 ≥ 0.825134`; `0.561033 + 0.993113 = 1.554146 ≤ 1.690143` | holds |

## Not verifiable

- Bobkov1997, Corollary 1, inequality (10), p.209, and the argument after Corollary 2, p.210: the cached extraction is unusable OCR (five lines with a word of five letters in 225 lines), so neither the numbering nor the hypothesis "locally Lipschitz" could be read. Ledoux1999 line 296–313 states the same inequality for smooth and then Lipschitz functions and corroborates the mathematics, not the locator.
- Ledoux1993 inequality (10), line 257–262: the displayed formulas are missing from the extraction; the surrounding sentences (median, Lipschitz norm at most `1`) match §8.4.
- Maggi2012 Theorem 15.9, Proposition 12.15, Theorem 12.26, Exercise 29.7: see R05.
- SudakovTsirelson1974, CarlenKerce2001, AmbrosioFuscoPallara2000, Bogachev1998: settled as uncertified, cited by locator; not read.
- Isoperimetry I4 states the slicing theorem as "the finite-perimeter slicing theorem and its reduced-boundary/normal comparison on almost every line" (`TauCetiRoadmap/Isoperimetry/README.md:248`). The three conclusions the README's contract lists (`README.md:112`) are the standard content of that sentence; I4 does not spell them out, so the match is a reading and not a quotation.
- The Lean addition of R01 was not elaborated (this pass runs no Lean).

## Source issues

- **Gap** in MilmanNeeman2022 at Lemma 2.1, proof of injectivity, printed page 11: the source says that for `y ≠ x` some index has `y` in the open cell `x + Ω_i`; it should take an index maximising `(y − x)_i`, since ties put `y` in no open cell; affects the proof.
- **Error** in CianchiFuscoMaggiPratelli2011 at equation (2.5), printed page 5 of the cvgmt preprint: the source says the perimeter of (1.2) equals a supremum of integrals against the probability measure; it should carry the factor `√(2π)` on the supremum; affects a stated result.
- **Misprint** in CianchiFuscoMaggiPratelli2011 at Lemma 4.4, equation (4.8), and equation (4.9), printed pages 12–13: the source weights the section sum by the unnormalised exponential; it should carry `(2π)^{−1/2}`, as its own formula for the gradient in the proof of Lemma 4.5 does; affects a stated result.
- **Error** in CianchiFuscoMaggiPratelli2011 at Lemma 4.5, inequality (4.10), printed page 13: the source says the surface-normalised perimeter of the symmetral is at most the unscaled variation term plus the section term; it should have `√(2π)` on the variation term (tilted half-plane: `0.778801 ≤ 0.770391` fails); affects a stated result.
- **Misprint** in CianchiFuscoMaggiPratelli2011 at Lemma 4.6, inequality (4.14), and equation (4.6), printed pages 12–14: the source says equality holds for symmetrals with the gradient of the section measure; it should use the gradient of `√(2π)` times the section measure, otherwise equality fails; affects a stated result.

Source independence: 12 passages compared with 5 sources (MilmanNeeman2022 line 57–61, 892–895, 939–956, 672–695, 515–517; CianchiFuscoMaggiPratelli2011 line 904–912, 633–720; Ehrhard1983 line 458–469, 118–127; Ledoux1999 line 229–238, 252–271; Borell1975 line 88–99), longest shared run six words (a forced statement), none copied or translated; largest share MilmanNeeman2022, 35 of 112 locators; contents compared with MilmanNeeman2022 (its Sections 2, 3, 4 appear here as Layers 4, 2–3, 3, in a different order and with wider scope) and with Maggi2012's table of contents: independent. Layers 5, 6, 7 take their results from CianchiFuscoMaggiPratelli2011 Sections 3, 4.1, 4.2 in that order; the order is forced by the *Needs:* lines of §5.3 → §6.6 → §7.1 → §7.3, and the scopes differ (§6.1 for subspaces, §6.2 and §7.2 by other routes). Bobkov1997's text could not be read (see `## Not verifiable`).

## For the human reviewers

- **Not tested.** Bobkov1997 (author-page PDF, 2 of 112 locators): the cached text is unusable OCR, so wording and locator were not compared with it; `sources.toml` says the statements were read from the PDF itself.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d462415827b6c4cf9edb312c1f1fa18496ca1968", "job": "RT-GaussianIsoperimetryAndClusters~1a", "model": "fable", "worker": "chris-x81"} -->
