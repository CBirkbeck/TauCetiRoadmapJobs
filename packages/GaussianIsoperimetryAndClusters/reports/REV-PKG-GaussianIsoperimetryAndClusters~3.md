<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16957#issuecomment-6900474703 -->
Review (claude) of 6e104cc

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §8.2 states the Minkowski-content inequality with the closed thickening; the source and §8.1 give the open one, which is stronger

   **Location.** `packages/GaussianIsoperimetryAndClusters/README.md` line 621: "`liminf_{r ↓ 0}
   (γ(Metric.cthickening r A) − γ(A))/r ≥ I(γ(A))` … (`gaussian_minkowskiContent_ge`; Ledoux1999
   equations (1.3)–(1.4), line 207–219)"; `Suggested.lean` line 373–377: "with `A_r` the closed
   `r`-thickening (Ledoux1999, (1.3)–(1.4))", `stdGaussian E (cthickening r A)`.

   **Claim.** This is the form of Ledoux's (1.3)–(1.4), and the form the route gives.

   **Witness.** Ledoux1999 line 211 defines `A_r` as the open `r`-neighbourhood, and his limit at line
   308–313 uses it. Since `Metric.thickening r A ⊆ Metric.cthickening r A`, the open form implies the
   stated one and not conversely without a further fact (level sets `{d_A = r}` are null). §8.1
   proves `γ(Metric.thickening r A) ≥ Φ(a + r)` directly.

   **Repair.** State §8.2 with the open thickening:

   - README line 621: "`liminf_{r ↓ 0} (γ(Metric.thickening r A) − γ(A))/r ≥ I(γ(A))`, … A route:
     when `0 < γ(A) < 1`, §8.1 with `a = Φ⁻¹(γ(A))` gives `γ(Metric.thickening r A) − γ(A) ≥
     Φ(a + r) − Φ(a)` for every `r > 0` …; the same inequality for the closed thickening follows, as
     it contains the open one." For `r > 0` the open thickening contains `closure A ⊇ A`, so the
     difference is a true difference in `[0, ∞]`.
   - Checks of §8.2: line 627 "the open thickenings are `ℝ²`, of measure `1`"; line 629
     "`Metric.thickening r A = (−∞, r)`", same quotient `(Φ(r) − 1/2)/r`.
   - §8.3 line 633 and Check line 645: `∫ ‖∇f_r‖ dγ ≤ (γ(Metric.thickening r A) − γ(A))/r`, because
     for closed nonempty `A`, `{0 < d_A < r} = Metric.thickening r A ∖ A`; the example value
     `Φ(1) − Φ(0) = 0.341345` is unchanged.
   - `Suggested.lean`: `stdGaussian E (thickening r A)` and "with `A_r` the open `r`-thickening" in
     the docstring.

   Tested on the instances: `{x_1 < a}` gives `(Φ(a + r) − Φ(a))/r → φ(a)`; `ℚ²` gives `1/r → ∞`;
   the Bernstein set gives `(Φ(r) − ½)/r → 0.398942 = I(½)`; `∅` gives `0 ≥ I(0) = 0`; `n = 0`,
   `A = {0}` gives `0 ≥ I(1) = 0`. The repaired declaration elaborates
   (`gaussian_minkowskiContent_ge : … (Metric.thickening r A) …`, `sorry` the only warning).

2. **F02** (P3) §9.4 narrows Ehrhard's Théorème 3.1 to closed sets; convexity holds for every convex set, and `hC : IsClosed C` is not needed

   **Location.** README line 720: "for every subspace `F` of dimension `k ≥ 1`, unit vector `u ∈ F`
   and closed convex `C ⊆ E`, `S̄_{F,u}(C)` is convex (`convex_closedGaussianSymmetral`; Ehrhard1983
   Théorème 3.1, line 367–369)"; `Suggested.lean` line 423–425: `{C : Set E} (hC : IsClosed C)
   (hconv : Convex ℝ C)`.

   **Claim.** Closedness is a hypothesis of the convexity theorem, as in the source.

   **Witness.** Ehrhard1983 line 368–369 states the theorem for a set that is open or closed; the
   open case (`S_{F,u}(O)` convex) is stated nowhere in the README. Instance outside both:
   `C = {x_1 > 0} ∪ {0} × [0, ∞) ⊂ ℝ²`, `F = ℝe_2`: `v_C = 1, ½, 0`, and the set
   `{x_1 > 0} ∪ {0} × (−∞, 0]` is convex.

   **Repair.** The general statement follows from §9.5, so place it there and keep §9.4 as the closed
   case that §9.5 needs.

   - §9.4, line 720: drop "(`convex_closedGaussianSymmetral`; …" down to the locator, keeping
     "(Ehrhard1983 Théorème 3.1, line 367–369, which also covers open convex sets; both cases are in
     §9.5)".
   - §9.5, after the route: "Deduce that for every subspace `F` of dimension `k ≥ 1`, unit vector
     `u ∈ F` and convex `C ⊆ E`, with no topological assumption, the sets
     `{x + y : x ∈ F^⊥, y ∈ F, Φ(⟨y, u⟩) ≤ v_C(x)}` (`convex_closedGaussianSymmetral`) and `S_{F,u}(C)`
     are convex. A route: for two points `x + y`, `x′ + y′` of the first set the sections `C_x`,
     `C_{x′}` are convex subsets of `F` with `Φ(⟨y, u⟩) ≤ γ_F(C_x)` and `Φ(⟨y′, u⟩) ≤ γ_F(C_{x′})`;
     the inequality above in `F` gives `γ_F(θC_x + (1 − θ)C_{x′}) ≥ Φ(⟨θy + (1 − θ)y′, u⟩)`, and
     `θC_x + (1 − θ)C_{x′} ⊆ C_{θx + (1 − θ)x′}` because `C` is convex. For the strict rule, first
     raise the two levels to `s > ⟨y, u⟩`, `s′ > ⟨y′, u⟩` with `Φ(s) ≤ v_C(x)`, `Φ(s′) ≤ v_C(x′)`."
     Add the instance above as a Check (neither open nor closed; a rule reading the sections of the
     closure would give `{x_1 ≥ 0}` instead).
   - §9.1, line 682: after the definition, "the same rule is read for an arbitrary set in §9.5".
   - Summary line 5: "`convex_closedGaussianSymmetral` and `ehrhard_inequality_convex` (§9.5)".
   - `Suggested.lean`: delete `(hC : IsClosed C)`; docstring "(§9.5). For a subspace `F`, a unit
     vector `u ∈ F` and a convex `C ⊆ E`, … (Ehrhard1983, Théorème 3.1, for open and for closed
     sets)"; module docstring "Layer 9: Ehrhard's inequality for convex sets and convexity of the
     Gaussian symmetrals of convex sets (§9.5)".

   Tested on the instance: the two points `(0, −5)` and `(1, 100)` of the set have sections of
   measure `½` and `1`; at `θ = ½` the level is `Φ(47.5) ≤ v_C(½) = 1`. With `F = E` the set is
   `{Φ(⟨x, u⟩) ≤ γ(C)}`, a half-space, `∅` or `E`. A convex `C` in a hyperplane has null sections or
   null base, and the set is empty or a half-space over a convex base. The repaired declaration
   elaborates (`… ∀ {C : Set E}, Convex ℝ C → Convex ℝ (closedGaussianSymmetral F u C)`).

3. **F03** (P3) one line number for two declarations

   **Location.** README line 112: "Tau Ceti's `TauCeti.lintegral_perimeter_lineSection_le` and
   `TauCeti.ae_perimeter_lineSection_lt_top` (TauCeti/Analysis/BoundedVariation/Slicing.lean:199)".

   **Claim.** Both declarations are at line 199.

   **Witness.** At the pin, `lintegral_perimeter_lineSection_le` is at
   TauCeti/Analysis/BoundedVariation/Slicing.lean:190 and `ae_perimeter_lineSection_lt_top` at 199.

   **Repair.** "(TauCeti/Analysis/BoundedVariation/Slicing.lean:190 and 199)", the form the README
   uses for `TauCeti.reducedBoundary` and `TauCeti.outerNormal`.

Three findings, all P3, none blocking. The five findings of round 2 are repaired. No statement of
`Suggested.lean` was found false, the file elaborates with `sorry` as the only warning, every pinned
declaration and supplier section the README cites exists where it is cited, and the dependency
check is clean. Two of the findings are statements narrower than the source they cite (and than
what the roadmap's own routes prove); the third is a line locator.

## Round 2 findings, one by one

- **F01 (P3), §2.3 Check digit — repaired.** `packages/GaussianIsoperimetryAndClusters/README.md`
  line 208: "of `γ^1`-measure `φ(0)(Φ(1) − 1/2) = 0.136177`". Recomputed: `0.136176851`.
- **F02 (P3), unneeded finiteness in §6.6 — repaired.** `Suggested.lean` line 306–308 now has only
  `(he : ‖e‖ = 1) {U : Set E} (hU : NullMeasurableSet U volume)`; README line 539: "which holds for
  every Lebesgue-measurable `U`, trivially when `P_γ(U) = ∞`"; new Check at line 546 recomputed
  (`γ(U) = 0.116140`, `Φ⁻¹ = −1.194508`, `I = 0.195467`).
- **F03 (P3), §8.2 for every set — repaired.** README line 621: "for every set `A ⊆ E`, its Gaussian
  measure being the outer measure when `A` is not measurable"; Lean line 375:
  `theorem gaussian_minkowskiContent_ge (A : Set E)`. The new Bernstein-set Check (line 629) was
  recomputed: `(Φ(0.1) − ½)/0.1 = 0.398278`, `(Φ(0.01) − ½)/0.01 = 0.398936`. The repaired passage
  carries R01 below.
- **F04 (P3), smoothness in the §3.5 locator — repaired.** Line 320: "for `q ≥ 2` and `W ∈ C^∞`, …
  the route below uses smoothness of `W` only through the lower semicontinuity and compactness of
  §2.4"; Conventions line 23: "Milman–Neeman assume a `C^∞` density and Borel cells throughout
  their Sections 3–4 (MilmanNeeman2022 line 697–701)". Read at MilmanNeeman2022 line 697–702 and
  920–922: confirmed.
- **F05 (P3), §4.5 "bounded above" — repaired.** Line 402: "some such difference stays bounded
  above; take `l` minimizing `x_{m,l}` over `l ∉ J`, the same `l` for every `m` after passing to a
  further subsequence". The step was re-derived (table).

The repaired patterns were searched in the rest of the package. Hypotheses the statement does not
need: `hU` of `gaussian_isoperimetric` and of `gaussianPerimeter_gaussianSymmetral_le` is needed
(for a non-measurable `U` the Bochner integral in `weightedVariation` is the junk `0`); `hfin` of
the three Layer 2 theorems is the predicate of `TauCeti.variationMeasure`
(TauCeti/Analysis/BoundedVariation/VariationMeasure.lean:136); `hC : IsClosed C` of
`convex_closedGaussianSymmetral` is not needed (R02). Locators that drop a source's hypothesis or
change its form: R01 and R02. Maintainer notes: none were left.

## Verified sound

**Principles.** No `set_option`, no sorry'd data (17 definitions, all with bodies), no algorithm,
no copied passage, no supplier later in the merge order, no cycle. The general multi-bubble
theorem is left to a named Part II with the stopping point stated. `design/plan.json` has
`gaps: []` and none is needed.

**Elaboration.** `lake env lean` on `packages/GaussianIsoperimetryAndClusters/Suggested.lean` from
the content checkout: 19 warnings, all "declaration uses `sorry`" (lines 100, 113, 130, 145, 192,
257, 271, 306, 318, 330, 340, 353, 362, 375, 384, 394, 403, 423, 431), no error. Header: `module`,
`import Mathlib`, six `TauCeti.*` modules, each used (`reducedBoundary`/`outerNormal`,
`totalVariationOn`, `variationMeasure`, `divergenceCLM`, `essentialBoundary`, `quantile`).

**Signatures.** The 36 elaborated types of the worker's listing were compared with the README. The
three flagged definitions lose only instances their bodies do not use: `gaussianWeight` loses
`FiniteDimensional` (its body reads `Module.finrank`, which is `0` in infinite dimension, never
reached), `gaussianSymmetral` and `closedGaussianSymmetral` lose `BorelSpace`. All 19 theorems
carry `FiniteDimensional`, `MeasurableSpace`, `BorelSpace`, and `Nontrivial` where the README says
`n ≥ 1`. After the two repairs above, `#check @name` on the scratch copy gave the types quoted in
R01 and R02.

**One-tactic probe, all 19 sorried theorems.** On a scratch copy each `sorry` was replaced by
`first | rfl | (simp; done) | infer_instance | (simp [the roadmap's definitions]; done) | (aesop; done) | sorry`:
19 "declaration uses `sorry`" warnings remain, so none closes. None restates a definition or
mirrors a Check. No padding.

**Headline theorems.** From the Summary: the single-bubble theorem with equality
(`gaussian_isoperimetric`), its two-cell form (`isoperimetricProfile_two_eq`,
`Cluster.perimeter_eq_iff_halfSpaces`), Borell–Sudakov–Tsirelson for every Gaussian law (two
theorems), the Minkowski-content form, Bobkov's inequality, concentration about a median (two
theorems), convexity of symmetrals and Ehrhard's inequality; and the layer results of §2.2 (two),
§2.5, §2.6, §3.5, §4.3, §4.6, §6.6. All 19 are stated on the roadmap's carriers, none through a
stand-in; the module docstring says none is omitted. All 36 Lean names occur in the README and
every backticked name of the roadmap's own is declared (the resolver's lead
`Cluster.perimeter_eq_iff_halfSpaces` is declared at line 340).

**Pinned declarations.** 93 located citations of the README were opened at the pins: 88 matched by
script at the cited file and line, 5 by hand (the four of
TauCeti/Probability/Distributions/Gaussian/Cdf.lean at 205, 212, 219, 226; `TauCeti.outerNormal` at
ReducedBoundary.lean:106); one slip, R03. Read for content this round:
`TauCeti.variationMeasure` (a `Measure Ω`, junk `0` outside the `hfin` predicate),
`TauCeti.reducedBoundary` (points of `Ω` where ball averages of the polar density tend to a unit
vector; a ball of zero perimeter measure gives average `0`, so such points are excluded),
`TauCeti.essentialBoundary` (complement of density-one and density-zero points),
`TauCeti.perimeter_setOf_inner_lt` (Hyperplane.lean:61, unit `ν`, any `c`, any open `Ω`),
`TauCeti.ae_perimeter_inter_ball_le` (CutByBall.lean:228, null-measurable `s` only),
`TauCeti.Probability.map_orthogonalProjectionOnto_stdGaussian_pi` (Projection.lean:94, pairwise
orthogonal finite family), `TauCeti.Probability.stdGaussian_eq_withDensity_norm` (Density.lean:178,
density `(2π)^{−d/2} exp(−‖x‖²/2)`, equal to `exp(−gaussianWeight)`), `Convex.perimeter_lt_top`
(Convex.lean:507), `TauCeti.Real.ofReal_sum_abs_sub_le_totalVariationOn` (Real.lean:185),
`MeasureTheory.measurePreserving_piFinTwo` (Pi.lean:850), `Besicovitch.ae_tendsto_measure_inter_div`
(Besicovitch.lean:1104, arbitrary `s`, closed balls), the instance at
BesicovitchVectorSpace.lean:500, `MeasureTheory.Measure.quantile` with `quantile_of_nonpos` and
`quantile_of_one_lt` (Quantile.lean:164, 209, 216), `cdf_quantile` (340), `quantile_cdf` (359).

**Supplier sections, resolved on main.** GeometricMeasureTheory G2 (area and coarea with weights,
tangential area formula, graph surface measure), G4 (convolution estimates), G5 (De Giorgi with
blow-up, essential versus reduced boundary, converse criterion with a local version), G6
(Lipschitz domains); Isoperimetry I1–I2 and I4 (slicing with reduced-boundary and normal
comparison, the `e^⊥ × ℝ` equivalence, essential convexity for positive finite volume);
RandomMatrices 2.2 (logarithmic Sobolev, Herbst); BanachSpaceTheory B7. Each heading exists on main
with the content cited. The overlap report lists no dropped or revision-only id.

**Dependency check.** Output: `depcheck: 246 roadmaps, 2241 edges, 0 problem(s)`. No UPWARD, CYCLE
or moved line.

**Shape and residue.** Nine layers named by their mathematics, each ending with Examples and
Dependencies; every definition has API bullets and at least three Checks; no LaTeX delimiters,
pull-request numbers, dates, paths or process words (searched); no `lemma`, `#eval`, `#print`,
`True` placeholder. `sources.toml` records all 13 works of the reference list.

**Small remarks, no change asked.** The route of §9.5 picks a direction in `E` and so presumes
`n ≥ 1`; for `n = 0` the hypotheses force `A = B = {0}` and the statement reads `1 ≥ Φ(·)`.
In §6.1, `v_{S_{F,u}(U)} = v_U` holds at every point with a measurable section, more than the
almost-everywhere statement made.

### Adversarial table

Rows: the repaired passages, the 15 sampled targets, the headline statements, the targets the
findings touch, and the sections round 2 had no computed row for (§1.2, §2.1, §2.5, §2.7, §8.1,
§8.5, §9.1, §9.3, §9.5). All numerical values were recomputed independently (error function,
bisection for `Φ⁻¹`, Simpson quadrature).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §1.1 `gaussianIsoperimetricProfile` (sampled) | `v = ½, ⅓, 1 − Φ(1), 0.3`; `v = 0, 1`; `v = 2` | `0.398942`, `0.363600` with `Φ⁻¹(⅓) = −0.430727`, `0.241971`; second difference `−2.876104 = −1/I(0.3)`, `−Φ⁻¹(0.3) = 0.524401`; endpoints `0` (quantile junk `0` would give `0.398942`); outside `[0,1]` value `0` | sound |
| §1.2 | `r = 1, 2, 0` | `0.158655 < 0.241971`; `0.158655 ≤ 0.303265`, `0.022750 ≤ 0.067668`; both `½` at `0` | sound |
| §1.3 (sampled) | `ℝ²`, `F = ℝ(e_1+e_2)/√2`; `q = 3` on `E^{(2)}`; `F = {0}` | `Φ(1) = 0.841345`; `1 − Φ(√1.5) = 0.110336` (reciprocal factor `0.207108`); covariance of `z_i − z_l`, `z_i − z_j` is `1`, variances `2`; density at `0` `0.159155` | sound |
| §2.1 | wrong definition on `U = ℝ`; weight `W + c`; `X ↦ −X` | `∫ |t| dγ = 0.797885 ≠ 0`; factor `e^{−c}`; `V(cu) = |c| V(u)` | sound |
| §2.3 (sampled) | half-space; disc; quadrant; segment; `n = 1` ball | `φ(1) = 0.241971`; `e^{−1/2} = 0.606531`, `γ = 0.393469`, `I = 0.384633`; `2 × 0.199471 = 0.398942 > I(¼) = 0.317777`, `Φ⁻¹(¼) = −0.674490`; `0.136177`; `2φ(1) = 0.483941` | sound |
| §2.5 (sampled) | `n = 1`, `(−∞, s)`; `{x_1 < s}`, `w = e_1`; `U = E`, field `e_1`; cutoff error | `X(s)φ(s)` both sides; `d/dt Φ(s + t) = φ(s) = ⟨e_1, e_1⟩φ(s)`; `−∫ x_1 dγ = 0`; `∫ |⟨∇χ_R, X⟩| dμ ≤ C‖X‖_∞ μ(E)/R → 0` | sound |
| `integral_weightedDivergence_eq_integral_reducedBoundary` | `Ω = ∅`; `n = 1` | both sides `0`; `μHE[0]` counting measure, value `X(s)e^{−W(s)}` | sound |
| §2.7 (sampled) | `F = ℝe_1`, `(−∞, s)`; `F = {0}`; translation | `φ(s)` both sides; `0 = 0`; `0.398942 → 0.241971`, no invariance claimed | sound |
| §3.2 (sampled) | three intervals `a = 0`, `b = 1`; merge; `n = 0` | `A = (φ(0), 0, φ(1))`, sum `0.640913`; merged `0.640913 − 0.398942 = 0.241971 = φ(1)`; all `A_ij = 0`, perimeters `0` | sound |
| §3.5 / `exists_cluster…` (sampled) | `q = 0`; `q = 1`; `n = 0`, `v = (½, ½)`; density with one bad hyperplane | empty sum `0 ≠ 1`; `(E)`, perimeter `0`; no cluster, excluded by `Nontrivial`; annuli give a finite competitor, so the infimum is never over the empty set for `n ≥ 1` | sound |
| §4.2 (sampled) | centres `±1` in `ℝ`, `λ = 2, −1, 0`; `q = 2` | `8y < 0` same cell, `−4y < 0` swapped, `0 < 0` empty; `⟨c − (p_i+p_j)/2, p_j − p_i⟩ = 0`, so the cell is `⟨y − c, p_j − p_i⟩ < 0` | sound |
| §4.3 / `modelMeasureMap_diffeomorph` | `q = 2`, `x = tu`; `q = 3`, `x = 0`; properness | `Ψ_1 = Φ(−t)`, derivative `−φ(0.7) = −0.312254`, `−(L_A u)_1/√2 = −φ(t)`; `L_A = 3A = 0.598413`, `DΨ = −0.423142`; `z_i > x_i` on `x + Ω^m_i`, so `Ψ_i ≤ 1 − Φ(√(q/(q−1)) x_i) → 0` | sound |
| §4.5 (sampled, repaired) | `x_{m,l} − x_{m,i} = −m`; `q = 3`, `J = {1,2}`; `k = 1` | no bounded subsequence, bounded above; cell contains `{z_l > z_j + C}`; conditional mean `c/2`, variance `2 − ½ = 3/2`; piece `≤ φ(c/√2)(1 − Φ((d − c/2)/√1.5)) → 0`; limit `φ(0) = 0.398942` | sound |
| §4.6 / `modelProfile_hessian` | `q = 2`; `q = 3`, `x = 0` | `Dg(0)u = I′(v_1)/√2 = t/√2 = ⟨x, u⟩/√2`; `H(2Au, u) = 2φ · (−1/(2φ)) = −1`; `∇² = −1.671086`, `−tr = 1.196827 = 2 × 0.598413` | sound |
| §4.7 (sampled) | `v = (⅓,⅓,⅓)`; `n = 1`, `q = 3` | `0.598413`; three intervals `0.727200`, statement not claimed | sound |
| §5.2 (sampled) | `(0, 1)`; `(−1, 0)` shifted right | `γ¹ = 0.341345`, `0.640913 → 0.366963 = I(0.341345)` at `(0.408796, ∞)`; `(−0.9, 0.063724)`: `0.664218`, `(−0.5, 0.385003)`: `0.722510`; derivative `−φ(a′)(a′ + b′)` | sound |
| §6.2 (sampled) | `{x_2 < m x_1}`; vertical boundary; half-disc cut | `√(1+m²) · 1/√(1+m²) = 1`; left side `0`, projection one point; section `(−√(R²−s²), 0)`, only `0` inside `|t| < √(R²−s²)` | sound |
| §6.4 (sampled) | tilted half-plane; slab | `∫ φ(1+z)φ(z) dz = 0.219696`, `√2 ×` it `= 0.310697 = φ(1/√2)`; `√(4π) × 0.219696 = 0.778801 = e^{−1/4}`, `√(2π+1) × 0.219696 = 0.592901`; `0.483941` both sides | sound |
| §6.5 Check | disc | `2e^{−1/2}/π = 0.386129`, `∫ I(v_U) dγ = 0.252249` (after the substitution `z = sin t`), sum `0.638378` | sound |
| §6.6 / `gaussianPerimeter_gaussianSymmetral_le` (repaired) | disc; `n = 1`, `(−1, 1)`; infinite perimeter; null bad set `N` | `0.517483` between `0.384633` and `0.606531`; `0.356343 ≤ 0.483941`; `0.195467 ≤ ∞`; on `N`: `∫_N I(v_U) dγ = 0`, remaining term `≤ P_γ(U; N ⊕ ℝe)` by §6.3 | sound |
| §7.3 / `gaussian_isoperimetric` (sampled) | `n = 0`; `∅`; half-space; non-measurable `U`; disc, slab | `0 ≤ 0`, iff true on both sides; `P = 0 = I(0)`; `φ(s) = I(Φ(s))`; junk `0`, `hU` needed; `0.606531 > 0.384633`, `0.483941 > 0.356343` | sound |
| `isoperimetricProfile_two_eq`, `Cluster.perimeter_eq_iff_halfSpaces` | `v = (1, 0)`; `n = 0`; cell of measure `0` | `(E, ∅)`, `0 = I(1)`; profile `∞ ≠ 0.398942`, excluded; excluded by `h0`, `h1` | sound |
| §8.1 / both `borell_sudakov_tsirelson` | half-space; disc, `r = 1`; `S = 0` or not PSD; `S = diag(1, 0)`; non-measurable `A`, singular `K` | equality; `a = −0.270288`, `0.864665 ≥ 0.767217`; `δ_m(A) = 1`; `(−∞, r) × {0}`, `Φ(r)`; outer measure of a cylinder `A″ × ker K` equals that of its base, so `(T_*γ)^*(A) = γ^*(T⁻¹A)` | sound |
| §8.2 / `gaussian_minkowskiContent_ge` (sampled, repaired) | half-space; Bernstein set; `ℚ²`; open versus closed thickening | `φ(a)`; `0.398278`, `0.398936 → 0.398942`; `1/r`; Ledoux1999 line 211 has the open neighbourhood, `thickening ⊆ cthickening` | true as stated; narrower than the source: R01 |
| §8.3 / `bobkov_inequality` | `Φ(x)`; `min(x², 1)`; constants; `n = 0`; `f_r` for a closed set | `√2 ∫ φ² = 0.398942 = I(½)`; `∫ f = 0.516059`, `I = 0.398619`, right side `0.647406`; `I(c) = I(c)`; `I(c) ≤ I(c)`; `{0 < d_A < r} = thickening r A ∖ A` | sound |
| §8.4 / `gaussian_concentration_median` | `f = x_1`; `L = 0`; `r = 0` | equality, `0.022750 ≤ 0.067668`; `c ≤ m`, empty set; `γ{f > m} ≤ ½` | sound |
| §8.5 / `gaussian_max_concentration` | two independent normals; `S = [[1,2],[2,1]]`; `S = 0` | median `0.544952`, `0.010899 ≤ 0.022750`; `δ_0`, `m ≥ 0`, `σ = 1`, set null; `σ = 0` | sound |
| §9.1 | complement law; composition law; ball in `ℝ³` | `{Φ(t) < 1 − v}` on both sides; after the first step the section measure is `∫ Φ(h(w, g_2)) dγ(g_2) = γ_{F_1+F_2}(C_w)`, independent of `g_1`; `0.198748`, `−0.846102` | sound |
| §9.2 | Hessian of `g` at four points; `g(−1, 1)` | `(−0.459912, −0.459912, det 0.163502)`, dets `0.015519`, `0.000142`, `15.648788`, diagonal entries negative; `0.475233` | sound |
| §9.3 | directions; cone step | `90°, 135°, 157.5°`; `u_0 = αw′ + βu_j` with `β = cos θ_j < 0`, `u_{j−1} = αw′ − βu_j`, so the section over `z + α` contains the closed `|β|`-thickening of the section over `z`, and §8.1 on the line gives `c(z + α) ≤ c(z) − |β|` | sound |
| §9.4 / `convex_closedGaussianSymmetral` | `F = E`; point; `C = {x_1 > 0} ∪ {0} × [0, ∞)` | half-space, `∅` or `E`; empty; `{x_1 > 0} ∪ {0} × (−∞, 0]`, convex | true as stated; narrower than the source: R02 |
| §9.5 / `ehrhard_inequality_convex` | `[−1,1]`, `[−3,3]`, `θ = ½`; `θ = 0, 1`; `γ(A) = 0`; `θ = 0.9` Check | `1.690143 ≥ 1.628704`; `0.954500 ≥ Φ(1.628704) = 0.948312 ≥ 0.825134`; `0 • A = {0}` as `A ≠ ∅`, reads `Φ(b) ≤ γ(B)`; no admissible `a`; `0.9 × 0.623371 + 0.1 × 9.93113 = 1.554146` | sound |
| Conventions Checks | half-space at distance `1`; `q = 2` | `0.241971` against `0.606531`, ratio `2.506628`; `L_A = 2A_12` on `E^{(1)}` | sound |

## Sources: the sample

Read at the locators and confirmed: §1.1 (MilmanNeeman2022 line 180–187; CianchiFuscoMaggiPratelli2011
line 55–57; Ledoux1999 line 214–217); §1.3 (MilmanNeeman2022 line 481–483, 490–497; Ledoux1993 line
251–252); §2.3 (MilmanNeeman2022 line 32–33; CianchiFuscoMaggiPratelli2011 line 48–56, 182–184);
§2.5 (MilmanNeeman2022 line 705–708, 758–761); §2.7 (MilmanNeeman2022 line 481–483, 554–556); §3.2
(line 762–784, with Maggi's exercise cited there at line 769); §3.5 (line 918–922, `W ∈ C^∞`); §4.2
(line 76–82); §4.5 (line 558–564); §4.7 (line 660–666, `n ≥ q − 1`); §5.2
(CianchiFuscoMaggiPratelli2011 line 226–232); §6.2 (line 527–542, with the reference to
AmbrosioFuscoPallara2000 Theorem 3.108 at line 526); §6.4 (line 781–787, `B ⊆ B_E`); §7.3
(CianchiFuscoMaggiPratelli2011 line 508–509 and 220–223; MilmanNeeman2022 line 47–52, 83–84;
Ledoux1999 line 212–219; Borell1975 line 85–99, inner measure and closed unit ball); §8.2
(Ledoux1999 line 207–219: R01). Also read: Ehrhard1983 line 117–129, 367–376, 458–469 (R02);
Ledoux1993 line 241–262; Ledoux1999 line 220–226, 296–313; MilmanNeeman2022 line 697–702. No locator
is flagged by the author as unverified beyond those listed below.

## Duplication and overlap

By object at the pins: no weighted divergence, weighted perimeter, Gaussian isoperimetric function,
Gaussian symmetral or cluster in Mathlib or Tau Ceti (searched for the objects and for the names).
On main and at the 475 open heads there is no match for "Gaussian isoperimetr", "Ehrhard",
"Bobkov", "Sudakov", "isoperimetric profile", "multi-bubble", "double bubble", "Minkowski content"
or any declaration name of `Suggested.lean`; "weighted perimeter" matches only a hexagon count in
TensorProductCombinatorics; "Gaussian concentration" in MathematicalStatisticsHighDimensional names
a step that roadmap replaces; the median bound in BanachSpaceTheory is for the sphere. The Euclidean
frontier bound of Isoperimetry I4 and the weighted one of §2.3 differ by the weight. The overlap
report lists no changed, dropped or revision-only id; the board index has no second package of this
name. Ownership against the open pull requests was checked through the search over their heads.

Overlap check: read Isoperimetry, GeometricMeasureTheory, OptimalTransport (main), RandomMatrices 2.2, BanachSpaceTheory B7 (main), MathematicalStatisticsAsymptotic, MathematicalStatisticsFoundations, MathematicalStatisticsNonparametric, MathematicalStatisticsSemiparametric, MathematicalBilliards (open); nothing shared: Euclidean perimeter, De Giorgi, area and coarea are GeometricMeasureTheory's, slicing, Steiner symmetrisation and essential convexity are Isoperimetry's, mean-centred Gaussian concentration is RandomMatrices 2.2's, and each is cited, not restated.

## Copyright and arrangement

Wording: 16 passages (the 15 sampled statements with their routes, and the Conventions sentence on
clusters) and the docstrings of `gaussian_minkowskiContent_ge`, `convex_closedGaussianSymmetral` and
`ehrhard_inequality_convex` were set beside the sources at their locators. Nothing reproduces a
source's sentence; what is shared is forced (the list of hypotheses of the shifting lemma, the
definition of a face of the simplex, formulas). Ehrhard1983 and Ledoux1993 are in French and no
passage translates them clause by clause; the route of §9.5 uses the convex-hull idea of
Ehrhard1983 line 459–468 in other words and with another order of steps. Arrangement:
MilmanNeeman2022 has the largest share; its Sections 2, 3, 4 correspond to Layers 4, 2–3, 3, in
another order and with other scope. Layers 5, 6, 7 follow CianchiFuscoMaggiPratelli2011 Sections 3,
4.1, 4.2 in order; the *Needs:* lines of §6.2 (§5.1), §6.6 (§5.3) and §7.1 (§6.6) force that order.
Layer 9 takes §9.2 from Ehrhard1983 Section 3 before §9.3 from Section 1. Reuse: no table, figure or
list taken over; no public formalisation with matching names found.

Source independence: 19 passages compared with 7 sources, none shared; largest share MilmanNeeman2022, 27 of 83 locators; contents compared with MilmanNeeman2022, CianchiFuscoMaggiPratelli2011 and Ehrhard1983: independent; Bobkov1997 and the body of Maggi2012 could not be read.

## Not verifiable

- Bobkov1997 (Corollary 1, inequality (10), p.209; the argument after Corollary 2, p.210): the cached
  text is OCR of glyph fragments, and a rendering of PDF pages 4–5 shows no letters (the fonts are
  not embedded). Only the shape is visible: a functional inequality with a square root, then a
  surface-measure inequality, low on PDF page 4. The numbers "Corollary 1" and "(10)" were not read.
- Maggi2012 (Theorem 15.9, Proposition 12.15, Theorem 12.26, Sections 13.1, 18.1–18.3, Exercise
  29.7): the cached extract holds the contents and the Part IV synopsis. The contents confirm the
  section titles at line 69–79 and 98–101; the statements were not read. MilmanNeeman2022 line 756
  and 769 cite Theorem 15.9 and Exercise 29.7 for the same facts.
- Ledoux1993 inequality (10) and Ledoux1999 (1.5)–(1.8), (1.11): the extraction drops the displayed
  formulas; the surrounding sentences confirm the statements.
- SudakovTsirelson1974, CarlenKerce2001, AmbrosioFuscoPallara2000, Bogachev1998, Ledoux1996:
  recorded as uncertified, cited by locator, text not read.
- The source issues round 2 recorded for MilmanNeeman2022 (Lemmas 2.1 and 2.3) and for
  CianchiFuscoMaggiPratelli2011 ((4.8), (4.10), (4.14)) were not read again this round.

## Source issues

- **Misprint** in CianchiFuscoMaggiPratelli2011 at Theorem 4.1, preprint p. 10 (line 508–509): the source says equality holds exactly for sets equivalent to a half-space; it should add the sets of measure `0` or `1`, as its Proposition 3.1 does; affects a stated result.
- **Misprint** in MilmanNeeman2022 at equation (1.1), p. 5 (line 186–187): the source says the single-bubble profile satisfies the differential equation on the closed interval; it should be the open interval, the profile vanishing at both endpoints; affects nothing.

## For the human reviewers

- Scope: the README (line 15 and line 748) assigns the multi-bubble theorem for `3 ≤ q ≤ n + 1` to "GaussianIsoperimetryAndClusters, Part II", which is neither on main, in the merge order, among the open pull requests nor in the board index.
- Licence: CianchiFuscoMaggiPratelli2011 was read from the cvgmt preprint (`sources.toml`, `licence_class = "institutional"`); the README's corrections to (4.7)–(4.14) are against that version, and the published article was not read.
- Licence: Maggi2012 is recorded as certified from the author's cvgmt extract (contents and Part IV synopsis); six of its seven locators point into text nobody read.
- Not tested: Bobkov1997 (`licence_class = "author-page"`) has no readable text in the cache or in its PDF rendering; the wording and the locators of §8.3 were not compared with it.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6e104ccb3fa6044ebbd9d3042ab88c97b96672d3", "job": "REV-PKG-GaussianIsoperimetryAndClusters~3", "model": "fable", "worker": "chris-x55"} -->
