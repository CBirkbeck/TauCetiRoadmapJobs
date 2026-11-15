# PKG-GaussianIsoperimetryAndClusters

Package of the accepted design `GaussianIsoperimetryAndClusters` into `packages/GaussianIsoperimetryAndClusters/README.md`, `Suggested.lean`, `metadata.toml` (`topic = "math.MG"`, as its suppliers Isoperimetry and GeometricMeasureTheory) and `sources.toml`. `design/plan.json` is unchanged: the package needs nothing from another roadmap that the roadmap does not already state, so `gaps` stays empty. Every target, Check and worked example of the design is kept; the corrections below are listed one by one.

## Headline theorems

All are statable at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`) and all are stated in `Suggested.lean`, each with `sorry`:

| § | Headline | Lean name | Status |
|---|---|---|---|
| 2.2 | weighted variation is `∫ e^{−W} d|Du|` | `weightedVariation_eq_lintegral_variationMeasure` | stated |
| 2.2 | weighted perimeter is `μ^{n−1}(∂*U) = μ^{n−1}(∂^M U ∩ Ω)` | `weightedPerimeter_eq_lintegral_reducedBoundary` | stated |
| 2.5 | weighted Gauss–Green formula | `integral_weightedDivergence_eq_integral_reducedBoundary` | stated |
| 2.6 | weighted coarea formula, BV form | `weightedVariation_eq_lintegral_weightedPerimeter` | stated |
| 3.5 | existence of minimizing clusters for every `C¹` probability density, `n ≥ 1` | `exists_cluster_perimeter_eq_isoperimetricProfile` | stated |
| 4.3 | the model measure map is a smooth bijection onto the open simplex with `DΨ = −L_A/√2` | `modelMeasureMap_diffeomorph` | stated |
| 4.6 | `∇I_m = Ψ⁻¹/√2`, `∇²I_m = −L_A⁻¹` | `modelProfile_hessian` | stated |
| 6.6 | Ehrhard symmetrisation does not increase Gaussian perimeter | `gaussianPerimeter_gaussianSymmetral_le` | stated (global form; the README also has the cylinder-localized form) |
| 7.3 | Gaussian isoperimetric theorem with equality | `gaussian_isoperimetric` | stated |
| 7.4 | two-cell profile `I^{(1)}(v) = I(v_1)` | `isoperimetricProfile_two_eq` | stated |
| 7.4 | minimizing `2`-clusters are pairs of complementary half-spaces | `Cluster.perimeter_eq_iff_halfSpaces` | stated |
| 8.1 | Borell–Sudakov–Tsirelson, standard Gaussian | `borell_sudakov_tsirelson` | stated |
| 8.1 | Borell–Sudakov–Tsirelson, every `multivariateGaussian m S` | `borell_sudakov_tsirelson_multivariateGaussian` | stated |
| 8.2 | Minkowski-content form | `gaussian_minkowskiContent_ge` | stated |
| 8.3 | Bobkov's inequality | `bobkov_inequality` | stated |
| 8.4 | median concentration of Lipschitz functions | `gaussian_concentration_median` | stated |
| 8.5 | concentration of maxima of Gaussian vectors | `gaussian_max_concentration` | stated |
| 9.4 | closed Gaussian symmetrals of closed convex sets are convex (Ehrhard) | `convex_closedGaussianSymmetral` | stated |
| 9.5 | Ehrhard's inequality for convex sets | `ehrhard_inequality_convex` | stated |

Not statable at the pins: none. The definitions the statements need, all with real bodies on native carriers: `gaussianIsoperimetricProfile` (Tau Ceti quantile), `weightedVariation` (over Mathlib's `𝓓(Ω, E)` with Tau Ceti's `TestFunction.divergenceCLM`), `weightedPerimeter`, `weightedMeasure`, `gaussianWeight`, `gaussianPerimeter`, the structure `Cluster` with `Cluster.perimeter`, `isoperimetricProfile` (an infimum), `simplexTangent`, `modelCell`, `modelMeasureMap`, `modelInterfaceArea`, `interfaceOperator`, `modelProfile`, `gaussianSymmetral`, `closedGaussianSymmetral`. Not headlines and kept as README targets only: the converse of Bobkov's inequality (an implication between two stated inequalities), the one-dimensional theorem §5.3 (the case `n = 1` of §7.3), the easy inequality §4.7, the explicit perimeters §2.3, the interface decomposition §3.2 and positivity §3.3, the slicing machinery §§6.2–6.5, §§9.1–9.3.

## Elaboration

`lake env lean packages/GaussianIsoperimetryAndClusters/Suggested.lean`, run from the content checkout: exit 0, **19 warnings, all `declaration uses 'sorry'`** (one per theorem), no other message. Three imported Tau Ceti modules had no object files and were built first with `lake build TauCeti.Analysis.BoundedVariation.ReducedBoundary TauCeti.MeasureTheory.Covering.EssentialBoundary TauCeti.Analysis.BoundedVariation.VariationMeasure` (completed). Imports: `import Mathlib` and the six Tau Ceti modules used (`ReducedBoundary`, `TotalVariation`, `VariationMeasure`, `TestFunction.Divergence`, `Covering.EssentialBoundary`, `Probability.Quantile`). No `set_option`, no sorry'd data, `theorem` only.

**Binder audit.** All 36 declarations were put through `#check @name` in one scratch file and their elaborated types compared with the README statements. Findings and changes: every theorem carries its hypotheses in its own signature (`ContDiff ℝ 1 W`, the Tau Ceti local-finiteness hypothesis, `0 < finrank`, `[Nontrivial E]`); the definitions `gaussianSymmetral` and `closedGaussianSymmetral` elaborate without `[BorelSpace E]`, which they do not use; `gaussianWeight` elaborates without `[FiniteDimensional ℝ E]`, harmless as it is only applied to finite-dimensional spaces. The audit led to two changes: (1) the `Cluster` structure first carried a field `2 ≤ q`, which made `isoperimetricProfile W 1 v` the empty infimum `⊤` while the design sets `I^{(0)}(1) = 0` by convention; the field was dropped, so the trivial cluster `(E)` makes the value `0` a consequence (README §3.1, §3.4, §4.1, §4.4 adjusted); (2) the existence theorem lost its `2 ≤ q` hypothesis, as it holds for every `q` (for `q = 0` the simplex is empty).

All 100 library names backticked in the README were checked at the pins: 80 by `#check` in a scratch file importing the built modules; 3 are prose short forms (`Measure.pi`, `Measure.prod`, `NullMeasurableSet`) whose full names were checked; the 17 in modules without object files (Coarea, Slicing, Hyperplane, LebesgueDecomposition, LowerDensityEstimates, CutByBall, Compactness, Poincare, Real, Convolution, Coarea/Basic) by their declaration line at the pinned source (`ContDiffBump.totalVariationOn_normed_convolution_le` is declared as `_root_.ContDiffBump.…` at TauCeti/Analysis/BoundedVariation/Convolution.lean:110). `TestFunction.divergenceCLM_apply` is at line 63, not 64 as first written; fixed.

## Dependency check

```text
depcheck: 246 roadmaps, 2241 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Suppliers: GeometricMeasureTheory (G2, G4, G5, G6) and Isoperimetry (I4), both on main; RandomMatrices 2.2 and BanachSpaceTheory B7 are named only for scope and downstream.

## Duplication sweep and removals

Searched by object (`roadmaps grep`, main `1a19c9f` and the open heads, index 2026-11-15T17:09; `roadmaps resolve` at 17:30 found no unresolved citation) for Ehrhard, Gaussian isoperimetry, Bobkov, Sudakov, Borell, Gaussian/weighted perimeter, isoperimetric profile, multi-/double-bubble, minimizing clusters, Minkowski content, Gaussian concentration, Gaussian symmetrisation, median concentration, Herbst, Prékopa–Leindler, Voronoi, reduced boundary, Gauss–Green, coarea: no roadmap on main or open states any target of this roadmap. PointProcesses' Voronoi cells (random tessellations) and the Prékopa–Leindler uses in the open MathematicalStatistics roadmaps are different objects. Board packages under review: AnalyticNumberTheory and LawrenceVenkateshMethod only. This roadmap is the owner of weighted perimeter for `C¹` densities, Gaussian clusters, the Gaussian model profile, Gaussian symmetrisation and the Gaussian isoperimetric theorem.

At the pinned libraries, by object:

- **Prékopa–Leindler is in Tau Ceti** (`MeasureTheory.Measure.HasPrekopaLeindler`, PrekopaLeindler.lean:108; `TauCeti.hasPrekopaLeindler_volume`, line 372; `MeasureTheory.Measure.HasPrekopaLeindler.withDensity`, line 218). The design attributed it to Isoperimetry I1; the §9.5 Check and the scope paragraph now cite Tau Ceti (no target here to remove).
- **Euclidean half-space perimeter** `TauCeti.perimeter_setOf_inner_lt` (Hyperplane.lean:61): cited in the supplier contract; §2.3's half-space computation now uses it instead of De Giorgi's theorem.
- **Absolutely continuous part of `Du`** `TauCeti.acDerivativeDensity` (LebesgueDecomposition.lean:55) with `TauCeti.withDensity_enorm_acDerivativeDensity_add_singularPart` (line 93) and `TauCeti.ae_eq_acDerivativeDensity` (line 165): §6.3's `∇v_U` is now this declaration, and the identification `∇v_U = g_U` uses its uniqueness; no target removed.
- `TauCeti.reducedBoundary_subset_essentialBoundary` (LowerDensityEstimates.lean:281, `n ≥ 2`): one half of the G5 comparison, cited; G5 stays the supplier of the null difference.
- `TauCeti.ae_perimeter_lineSection_lt_top` (Slicing.lean:199): cited next to `TauCeti.lintegral_perimeter_lineSection_le`; it lacks the reduced-boundary comparison, so Isoperimetry I4 stays the supplier of §6.2's slicing theorem.
- Not at the pins (checked): De Giorgi's identification `|Dχ| = μHE[n−1]⌊∂*U` (Tau Ceti's BlowUp, DensityEstimates, LowerDensityEstimates, HalfSpace files supply steps, and their docstrings say the identification is not made), Gaussian tail bounds of §1.2, the orthogonal splitting of §1.3 as a binary product, one-dimensional structure of sets of locally finite perimeter (§5.1; Tau Ceti's `TauCeti.Real` results are for finite measure), any Gaussian isoperimetric, Ehrhard, Borell or Bobkov statement.
- **Isoperimetry I4's essential-convexity theorem** (TauCetiRoadmap/Isoperimetry/README.md, I4, second structural target) is the core of §7.2. §7.2 is kept, as its statement (infinite-volume Gaussian minimizers) is not I4's, and its route now applies I4 to the cut sets `H ∩ ball(0, R)`; the design's direct tube argument stays as the alternative route, and its negative-control Check stays.

**Removals:** no target, Check or worked example of the design exists elsewhere, so none was deleted. The design's closing section "Motivation for a future roadmap" was removed as a section and its content (the exact multi-bubble statement and what its proof needs) moved into Scope and ownership, as the boundary of this roadmap and the scope of its Part II (accepting review's human note 2). `sources.toml`: MilmanNeeman2022 `cited_for` now names "Scope and ownership" instead of that section.

## Notions moved down

None. Every supplier is on main.

## Corrections to the design

1. Clusters admitted for `q ≥ 1` (§3.1); `I_μ^{(0)}(1) = 0` and `I_m^{(0)}(1) = 0` become values instead of conventions (§3.4, §4.4); §4.1's `q = 1` control and §3.4's first Check reworded. Reason: the Lean profile must agree with the README at `q = 1`.
2. Dimension: the Conventions now say where `n ≥ 1` is needed. §3.5 and §7.4 require `n ≥ 1` (counterexample on the zero space: no `2`-cluster with measure vector `(1/2, 1/2)`; new Checks), and so does the finiteness bullet of §3.4. §7.3 and Layer 8 hold for `n = 0` and say so.
3. §6.6 widened from `n ≥ 2` to `n ≥ 1` (the case `n = 1` is §5.3; new Check `U = (−1, 1)`).
4. §8.1 widened from Borel `A` to every set `A` (outer measure), for `γ` and for every `multivariateGaussian m S`; the route reduces to closures (`Metric.thickening_closure`) and, for degenerate `S`, to the support `L = m + range K`, on which `K(ball)` is relatively open. New Check with `S = diag(1, 0)`.
5. §8.5 widened from positive semidefinite `S` to every `S` (for other `S` Mathlib's law is `δ_0` and the bound is trivial); new Check `S = [[1, 2], [2, 1]]`.
6. §9.5: "nonempty" dropped (forced by `Φ(a) ≤ γ(A)`); `λ` renamed `θ` to match the Lean.
7. §8.2 and §8.3: the quotient, its lower limit and Bobkov's right side are in `[0, ∞]`; new Checks show the junk values of a real `liminf` and of a real Bochner integral would make the statements false.
8. §4.4: simplicial perimeter statement scoped to `2 ≤ q ≤ n + 1`; `modelProfile` declared as the interior function extended by `0`, distinct from the §4.5 extension on the boundary.
9. Scope: Part II wording replaces "future"/"proposed"; the unsupported reason clause on Ehrhard's inequality for Borel sets was removed.

## Adversarial pass

Values by double-precision computation (bisection for `Φ⁻¹`, Simpson quadrature, finite differences with step `10⁻⁴`/`10⁻³`).

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `gaussianIsoperimetricProfile` | `v = 1/2, 1/3, 0, 1` | `0.398942`, `0.363600` (`Φ⁻¹(1/3) = −0.430727`); `0` at `0, 1`, against `φ(0) = 0.398942` from the junk quantile | sound | none |
| `I″ = −1/I` (§1.1) | `v = 0.3` | second difference `−2.876104 = −1/I(0.3)`; `I′(0.3) = 0.524401 = −Φ⁻¹(0.3)` | sound | none |
| `weightedVariation` | `W = 0`; `U = ℝ` under `γ`; `(−∞, s)` | Tau Ceti's `totalVariationOn volume`; ours `0` against the unweighted-divergence model `0.797885`; `X(s)φ(s)` both sides | sound | none |
| `gaussianWeight`, `weightedMeasure` | `n = 2`, `x = 0`; `n = 0` | `e^{−W(0)} = 1/(2π) = 0.159155` = Tau Ceti density; `n = 0`: `W = 0`, `volume = δ_0 = stdGaussian` | sound | none |
| §2.2 first identity | `χ_{(−1,1)}`, Gaussian `W`; indicator of `⋃ (1/(2k+1), 1/(2k))` on `(−1, 1)` | `2φ(1) = 0.483941` both sides; without local finiteness Tau Ceti's variation measure is `0` while `V_μ = ∞` | sound; hypothesis needed | none |
| §2.2 boundary identity | unit disc in `ℝ²`; same non-locally-finite set | `(2π)^{−1} e^{−1/2} · 2π = 0.606531` on reduced and essential boundary; reduced boundary `∅` (Tau Ceti) against `∞` | sound; hypothesis needed | none |
| §2.5 | `n = 1`, `(−∞, s)`, `w = e_1` | `X(s)φ(s)` both; derivative `φ(s)`, inner normal `−φ(s)` | sound | Ω general, `n ≥ 1` stated |
| §2.6 (b) | `u(t) = t` with `γ`; non-`BV_loc` indicator | `1 = 1`; `∞ = ∞` via local comparison | sound | none |
| `Cluster` | `q = 1`: `(E)`, `({x_1 < 0})`; `q = 0`; `n = 0`, `q = 2` | perimeter `0`; uncovered half-space of measure `1/2`; `volume(E) > 0` so none; only vertices | sound after change | `q ≥ 1` |
| `isoperimetricProfile` | `q = 1`; `(1, 0)`; `n = 0`, `(1/2, 1/2)` | `0`; `0`; `∞` | sound | finiteness `n ≥ 1` |
| §3.5 | `n = 0`; weight `0` on `ℝ` | no cluster at `(1/2, 1/2)`; mass infinite, excluded by `μ(E) = 1` | `n ≥ 1` needed | `[Nontrivial E]` |
| `modelMeasureMap` | `q = 2`, `x = tu`; `q = 3`, `x = 0`; `q = 1` | `(Φ(−t), Φ(t))`; `(1/3, 1/3, 1/3)`; `(1)` | sound | none |
| `modelInterfaceArea` | `q = 2`; `q = 3`, `x = 0` | `μHE[0]` of a point is `1`, so `φ(t)`; `0.199471` | sound | none |
| `interfaceOperator` | `q = 2`; `q = 3`, constant `A` | `L_A u = 2A_12 u`; `3A Id` on `E^{(2)}` | sound | none |
| §4.3 | `q = 2`, `t = 0.7`; `q = 3`, `x = 0` | `∂_u Ψ_1 = −0.312254 = −φ(0.7)`, sign `+L_A/√2` gives `+0.312254`; `−0.423142 Id` | sound | none |
| `modelProfile` | `q = 2`, `v = (Φ(1), 1 − Φ(1))`; centre `v − (1/2, 1/2)`; `(1/2, 1/2, 0)` | `φ(1) = 0.241971`; wrong model `φ(0.482734) = 0.355065`; extension `0.398942`, `modelProfile` `0` (not used by any headline) | sound | README states the difference |
| §4.6 | `q = 2`, `t = 0.7`; `q = 3`, `x = 0` | `g′(0) = 0.494975 = t/√2`; `g″(0) = −1.601262 = −1/(2φ(t))`; `H(L_A u, u) = −1.000001 ≈ −⟨u, u⟩`; `−1.671086 Id`, trace `1.196827 = 2 × 0.598413` | sound | none |
| `gaussianSymmetral` | `{⟨x, e⟩ < a}`; unit disc, `e_2`; `F = ℝ ∙ e` | fixed, superlevel gives `{⟨x, e⟩ > −a}`; section over `0` is `(−∞, 0.475233)`; `stdGaussian (ℝ ∙ e)` is `N(0,1)` along `e` | sound | none |
| §6.6 | `n = 1`, `(−1, 1)`; unit disc in `ℝ²` | `0.356343 ≤ 0.483941`; `0.517483 ≤ 0.606531` | sound for `n ≥ 1` | widened |
| §7.3 | half-space; disc; `∅`; `n = 0`; `{x_1 < 0} ∪ ℚ²` | `φ(s) = I(Φ(s))`; `0.606531 > 0.384633`; `0 = I(0)`; `0 = I(0 or 1)`; equality, a.e. half-space | sound | `n ≥ 0` |
| §7.4 profile | `(1/2, 1/2)`; `(1, 0)`; `n = 0` | `0.398942`; `0`; `∞ ≠ 0.398942` | `n ≥ 1` needed | `[Nontrivial E]` |
| §7.4 uniqueness | half-space pair; `({x_1 < 0} ∪ ℚ², {x_1 > 0} ∖ ℚ²)`; `(E, ∅)` | equality; a.e. pair; excluded by positivity | sound | none |
| §7.2 route via I4 | `H = {x_1 < s}`, `R` large | sections of `H ∩ ball` are intervals; `H_R^{(1)} ∩ ball = H ∩ ball` convex; union is `H` | sound | route added |
| §8.1, `γ` | half-space; disc `r = 1`; `{x_1 < 0} ∪ ℚ²`; `r = 0` | `Φ(a + r)` both; `0.864665 ≥ 0.767217` (`a = −0.270288`); thickening `ℝ²`, `1 ≥ Φ(r)`; `thickening 0 = ∅` | sound for every `A` | widened |
| §8.1, `γ_{m,S}` | `S` not PSD; `S = diag(1, 0)`, `A` off `L`, `A = (−∞, 0] × {0}` | `δ_m`; `0` and `0`; `Φ(r) = Φ(r)` | sound for every `A` | widened |
| §8.2 | half-space; disc; `ℚ²`; `{x_1 < 0} ∪ ℚ²` | `φ(a)`; `0.606531 ≥ 0.384633`; `1/r`; quotients `5, 50, 500 → ∞ ≥ 0.398942` | sound in `[0, ∞]`; real `liminf` junk `0` would fail | `[0, ∞]` stated |
| §8.3 | `Φ(x)`, `Φ(2x)`; `min(x², 1)`; constant `c`; `(1 + sin e^{x²})/2` | `0.398942` both; `I(0.516059) = 0.398619 ≤ 0.647406`; `I(c) = I(c)`; right side `∞`, Bochner junk `0 < I(∫ f)` | sound with `∫⁻` | `[0, ∞]` stated |
| §8.4 | `f = x_1`, `r = 2`; `L = 0`; `r = 0` | `0.022750 = 0.022750 ≤ 0.067668`; empty set; strict `<` needed | sound | none |
| §8.5 | two independent normals; `S = 0`; `S = [[1, 2], [2, 1]]` | median `0.544952`, `0.010899 ≤ 0.022750`; `0`; `δ_0`, `m ≥ 0`, left side `0` | sound for every `S` | widened |
| `closedGaussianSymmetral`, §9.4 | closed unit disc; `C = ∅`; hyperplane, `F = E`; line `⟂ u`, `F = ℝu`; two discs | `{⟨y, u⟩ ≤ −0.270288}`; `∅`; `∅`; `∅`; a half-plane (so the converse fails) | sound | none |
| §9.5 | `[−1, 1]`, `[−3, 3]`, `θ = 1/2`; `θ = 1`; `A = ∅` | `1.690143 ≥ 1.628704`, Brunn–Minkowski `0.825134`; reduces to `Φ(a) ≤ γ(A)`; excluded by `Φ(a) > 0` | sound | nonempty dropped |
| Conventions `n = 0` clause | §7.3, §8.1–§8.4, §9.5 on the zero space | `γ = δ_0`, every perimeter `0`, `I(0) = I(1) = 0`; Bobkov `I(c) ≤ I(c)` | sound | stated |

## What the README could not support from the texts

- Bobkov1997: the cached recognition of the author-page scan is illegible (as the accepting review found); Corollary 1 (10), p.209, and the approximation after Corollary 2, p.210, are corroborated by Ledoux1999 line 296–313. Not requested again, as the manifest records it as read from the PDF.
- Maggi2012: the cached extract holds front matter, contents and the Part IV synopsis only; its chapter locators are cited from the book, and MilmanNeeman2022 line 756 and 939–946 cite the same results.
- SudakovTsirelson1974, Ledoux1996, CarlenKerce2001, AmbrosioFuscoPallara2000, Bogachev1998: settled as uncertified; cited by locator.

No source was fetched and no `needs-references.toml` was written.

## Ownership against open pull requests

Checked through the `roadmaps` tool against the 477 open roadmap pull requests at their heads (indexes of 2026-11-15T17:09 and 17:30), and `scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is dropped, no id is defined only by a revision, no second copy. No `Suggested.lean` declaration shares a fully qualified name with a roadmap declaration.

## Accepting review's notes

- Scope (Ehrhard for Borel sets): kept outside, stated definitively without the speculative reason.
- Scope ("future roadmap" section, "proposed Part II"): applied, see Removals.
- Licence and untested locators (Bobkov1997, Maggi2012): unchanged; listed above for the human reviewers.

No text read during this job contained instructions; nothing suspicious to quote.
