# PORT-GaussianIsoperimetryAndClusters

Port of the accepted package `packages/GaussianIsoperimetryAndClusters/` into `TauCetiRoadmap/GaussianIsoperimetryAndClusters/{README.md,Suggested.lean,metadata.toml}`.

- **Branch:** `roadmap/gaussian-isoperimetry-and-clusters`, created from `666d57e`.
- **Head commit:** `1bb9eabc2840eb1b0e191f191bd1beb19833a762`, "GaussianIsoperimetryAndClusters: roadmap (README, Suggested.lean, metadata)". It touches only the three files of the folder.
- **Build** (`lake build TauCetiRoadmap.GaussianIsoperimetryAndClusters.Suggested`): `Build completed successfully (18342 jobs).` There are 20 warnings, every one `declaration uses sorry` (one per theorem), and no error.
- **Gate:** `gate GaussianIsoperimetryAndClusters: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- **Dependency check** (the brief's `gate --depcheck … --movable` command): `depcheck: 234 roadmaps, 2228 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. The roadmap is at line 428 of the merge order.

## Draft pull request body

Build weighted perimeter theory on finite-dimensional real inner product spaces for every positive density `e^{−W}` with `W` of class `C¹`, on top of Tau Ceti's Euclidean variation and perimeter library and GeometricMeasureTheory's De Giorgi theory, and use it to prove the Gaussian isoperimetric theorem, with its equality case, in the language of clusters. The weighted layer covers:

- weighted variation and perimeter, with the variation-measure, reduced-boundary, Gauss–Green and coarea identities;
- clusters, their interface decomposition, isoperimetric profiles, and the existence of minimizing clusters for every probability density;
- for the standard Gaussian measure, the model simplicial clusters, the diffeomorphism property of their measure map, and the matrix differential equation `∇²I_m = −L_A⁻¹` of the model profile;
- Ehrhard symmetrisation of sets of finite Gaussian perimeter.

The end theorems are:

- the single-bubble theorem and its two-cell cluster form;
- the Borell–Sudakov–Tsirelson inequality for every Gaussian law on a Euclidean space;
- Bobkov's functional inequality;
- sharp median concentration of Lipschitz functions and of Gaussian maxima;
- Ehrhard's inequality for convex sets.

The roadmap stops at the two-cell case of the Gaussian multi-bubble theorem. Its clusters, interfaces, existence theorem and model profile are the base for the general case of Milman and Neeman.

AI assistance: Claude (Claude Opus 5.5) performed the port, the library and ownership checks, the mathematical self-review and the Lean signature validation.

## Dependencies still in pull requests

None. Two suppliers are named in `*Needs:*` lines and contracts:

- GeometricMeasureTheory (G2, G5, G6), on main;
- Isoperimetry (I4), on main.

Two roadmaps are named only in "Scope and ownership" and "Downstream consumers", as roadmaps that do not depend on this one:

- RandomMatrices (§2.2), on main;
- BanachSpaceTheory (B7), on main.

An open revision of BanachSpaceTheory (opened together with MorseNovikov, OperatorTheory and SelfAdjointSpectralTheory) renumbers BanachSpaceTheory's sections as layers. It keeps the label `B7` on "Layer 7: local theory and Euclidean sections (B7)" and maps the old anchor `#b7-local-theory-and-euclidean-sections` to Layer 7. The citation therefore stays valid, and that revision is not a dependency. No open pull request revises GeometricMeasureTheory, Isoperimetry or RandomMatrices.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already met the form:

- 19 sorried headline theorems plus §4.7's inequality, 20 in all;
- 16 definitions and one structure, all with real bodies;
- `import Mathlib` followed by six `TauCeti.*` modules, each existing at the pin and each used;
- no `set_option`, no example, no padding.

It is unchanged, byte for byte. Every headline that is statable at the pins is stated, and the module docstring says that none is omitted. I checked the candidates that are not stated:

- §5.3 is the case `n = 1` of `gaussian_isoperimetric`;
- §9.4 is the closed case of `convex_closedGaussianSymmetral`;
- §2.3's explicit perimeters, §2.4, §3.3 and §4.5 are basic theory and not headlines.

All four stay as README targets.

## Supplier replacements and duplication removals

**Supplier citations added.** Tau Ceti already proves one step of the §8.1 route for `multivariateGaussian m S`: that the law lives on the affine subspace `L = m + range K`, `K = CFC.sqrt S`. The README asserted this step without a source. The following are now cited in the contracts ("From Tau Ceti"), in the §8.1 route and its `*Needs:*` line, in the Layer 8 Dependencies and in the "already in the library" list of Scope and ownership:

- `TauCeti.Probability.ae_mem_affineRange_multivariateGaussian` (TauCeti/Probability/Distributions/Gaussian/Density.lean:256), with hypothesis `S.PosSemidef`: almost every point lies in `m + range S`;
- `Matrix.PosSemidef.range_toEuclideanLin_sqrt` (TauCeti/Analysis/Matrix/Sqrt.lean:86): `range √S = range S`.

The non-positive-semidefinite case now also cites Mathlib's `ProbabilityTheory.multivariateGaussian_of_not_posSemidef`. No target was restated by these suppliers, so nothing was deleted.

**Duplication sweep.** I searched by object with `roadmaps grep` over main and the open heads (index of 2026-11-15T23:58, rechecked against main `818115d`). The search terms were:

- Gaussian isoperimetry, Ehrhard, Bobkov, Sudakov/Tsirelson/Borell;
- Gaussian perimeter, weighted perimeter, weighted variation/divergence/Gauss–Green, isoperimetric profile;
- multi-/double-bubble, minimizing cluster, Gaussian symmetrisation, Minkowski content;
- Gaussian concentration, Herbst, Prékopa–Leindler, logarithmic Sobolev;
- Voronoi, Steiner symmetrisation, Gaussian tail/Mills ratio, Ornstein–Uhlenbeck.

No roadmap on main or in an open pull request states any target of this roadmap. The near hits are different objects:

- RandomMatrices 2.2: Herbst's mean-centred bound `2 exp(−t²/(2CL²))`, a different statement from §8.4's median bound `1 − Φ(r)`, as the README says.
- StandardDistributions: the erf form of the Gaussian distribution function and the quantile `m + √v z(u)`. It has no Mills-ratio or `½ e^{−r²/2}` tail bound, so §1.2 is not duplicated.
- StochasticCalculus §6.3: Gaussian tail and reflection estimates for the law of the iterated logarithm, a different statement.
- MathematicalStatisticsHighDimensional (open): replaces Gaussian concentration with an exponential-moment argument and states no concentration target.
- PointProcesses (open): random Voronoi tessellations, not simplicial clusters.
- TensorProductCombinatorics: "weighted perimeter" there is a hexagon count.

At the pins:

- Tau Ceti's `BoundedVariation/` files have no weight, density or Gaussian notion. Tau Ceti's own `TauCeti.perimeter μ` uses the ordinary divergence, as the README states.
- `TauCeti/Probability/Distributions/Gaussian/*` has no upper tail bound (Cdf.lean:325 is a lower bound) and no isoperimetric statement.

**Removals:** none, so "Scope and ownership" gains no deferral.

**Ownership.** This roadmap is the owner of four objects:

- weighted variation and perimeter for `C¹` densities;
- Gaussian clusters and their profiles;
- the Gaussian model profile;
- Gaussian symmetrisation.

No roadmap on main, in the open heads, or among the board packages (AnalyticNumberTheory, LawrenceVenkateshMethod) owns any of them. No declaration of `Suggested.lean` has the fully qualified name of a declaration in a readable roadmap.

## Checks of the README as an upstream reviewer, and the fixes

1. **Scope sentence on Steiner, Brunn–Minkowski and Prékopa–Leindler.** The old text said "Steiner symmetrisation and Brunn–Minkowski stay with Isoperimetry I1–I2, and the Prékopa–Leindler inequality … is Tau Ceti's …; they enter only a Check of §9.5". That says Steiner symmetrisation enters §9.5, which it does not: no section uses it. The sentence now says that Steiner symmetrisation and the Euclidean Brunn–Minkowski inequality are Isoperimetry I1–I2's and are not used, and that Prékopa–Leindler enters only the §9.5 Check comparing Ehrhard's bound with the Gaussian Brunn–Minkowski bound.
2. **§8.1 route without a source.** "The affine subspace `L = m + range K` carries the law" was asserted bare. It is now derived:
   - for `S` not positive semidefinite, `K = 0` and the law is `δ_m`;
   - otherwise it follows from the two Tau Ceti declarations above.
3. **Conventions definitions with fewer than three Checks.** The Conventions define `gaussianWeight`, `weightedMeasure`, `simplexTangent` and `interfaceOperator` but had only one discriminating Check for them (`L_A` at `q = 2`). Four Checks were added, in prose and naming no Lean declaration:
   - The Gaussian weight's values `W(0) = 0.918939`, `e^{−W(0)} = 0.398942` on `ℝ` and `0.159155` on `ℝ²`. Without the constant `(n/2) log 2π` the total mass is `2.506628`.
   - On the zero space the weight is `0` and the measure is `volume = δ_0 = γ`; the constant of `n = 1` would give `0.398942`. A shift `W + c` scales the measure by `e^{−c}`.
   - `L_A = A(3 Id − 𝟙𝟙ᵀ)` for `q = 3`, which acts as `0.598413 Id` on `E^{(2)}` for the tripod areas. An ordered-pairs model doubles it to `4A_12` at `q = 2`, and `A_21` is ignored.
   - `E^{(q−1)}` has dimension `q − 1`, with explicit cases `q = 1, 2, 3`.
4. **Downstream consumers.** The old item listed RandomMatrices 2.2 and BanachSpaceTheory B7 as if they consumed this roadmap. It now says that they obtain their concentration by other routes and do not depend on it, and that §§8.4–8.5 supply the sharp median-centred constants.

No statement, hypothesis, section number or Lean name changed.

## Library and citation checks

- **Pins.** The manifest pins Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`, the same pins the package was checked against.
- **`name (file:line)` citations.** All 52 of the README's citations of this form were read by script at the pinned sources, and all match. The two "mismatches" are of the form "X and Y (file:95 and 106)", whose second name sits at the second line.
- **"(line N)" and "(same file, line N)" citations.** All 42 match. Two were flagged only because the script lost the file for "Cdf.lean:219", and they are at Cdf.lean:205 and 212.
- **Other library names.** The 154 backticked qualified names were all found as declarations at the pins; the remaining tokens are mathematical variables. Namespaces were checked for the `_root_` cases (`Convex.perimeter_lt_top`, Convex.lean:507).
- **`roadmaps resolve`** on the final README reports no cross-roadmap citation and no Lean name found nowhere. The worker's lead `Cluster.perimeter_eq_iff_halfSpaces` is declared in `Suggested.lean`.
- **Cited headings.** These were checked at main and at the newer main `818115d` of the resolver's index: GeometricMeasureTheory G2, G5, G6; Isoperimetry I4 (with its essential-convexity and slicing text); RandomMatrices 2.2; BanachSpaceTheory B7. Every heading exists with the content cited.

## Elaborated signatures

I appended `#check @name` for all 37 declarations to a temporary copy of `Suggested.lean` inside the namespace. I elaborated it once through the brief's `lake build` command and restored the file; the committed file is byte-identical to the package's. I then compared each elaborated type with its README statement.

- **Every theorem carries its standing hypotheses.** Each has the full instance block `NormedAddCommGroup`, `InnerProductSpace ℝ`, `FiniteDimensional ℝ`, `MeasurableSpace`, `BorelSpace`. Where the README says `n ≥ 1`, the theorem also has `[Nontrivial E]` or `0 < finrank`: §2.2 and §2.5 use `0 < finrank`; §3.5 and both §7.4 theorems use `Nontrivial`. §6.6 and §9.5 have a unit vector, which forces `n ≥ 1`.
- **Hypotheses that restate Tau Ceti's predicate.** `hu`/`hfin` of the §2.2 and §2.5 theorems restate Tau Ceti's own predicate in `TauCeti.variationMeasure` (VariationMeasure.lean:136), which is `0` off it.
- **Instance omissions in definitions are harmless.**
  - `gaussianWeight` lacks `FiniteDimensional`, `MeasurableSpace` and `BorelSpace`, which its body does not use.
  - `gaussianSymmetral` and `closedGaussianSymmetral` lack `BorelSpace`, which `stdGaussian F` does not need.
  - Every theorem that mentions these definitions carries the full block.
- **Changes:** none.

## Adversarial mathematics pass

The values were computed in double precision with my own scripts:

- `Φ` via `erf`, and `Φ⁻¹` by bisection, using `erfc` for tails near `1`;
- composite Simpson quadrature, with the substitution `z = sin θ` for the disc integrals and splitting at the kinks for `min(x², 1)`;
- the §9.2 Hessians in closed form.

Two of my first quadratures disagreed with the README: `0.801850` for `P_γ(S_e(disc))` and `0.647083` for Bobkov's right side. Both came from endpoint singularities and kinks. Redone properly they agree with the README (`0.517483`, `0.647406`). A finite-difference Hessian at `(0.5, 0.6)` (det `15.27`) was likewise inaccurate; the closed form gives the README's `15.648788`.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Perimeter normalization (Conventions) | `{⟨x, ν⟩ > 1}` | `γ = 0.158655`, `P_γ = φ(1) = 0.241971`; CFMP `e^{−1/2} = 0.606531`; ratio `2.506628 = √(2π)` | sound | none |
| Outer normal (Conventions, §2.5) | `(−∞, s)` on `ℝ`; `{x_1 < s}`, `w = e_1` | `Dχ = −δ_s`, `ν = +1`, both sides `X(s)φ(s)`; `d/dt Φ(s + t) = φ(s) = ⟨e_1, ν⟩φ(s)`; inner normal `−φ(s)` | sound | none |
| Sublevel symmetral rule | `{⟨x, e⟩ < 1}` | fixed; superlevel rule gives `{⟨x, e⟩ > −1}` (measure `0.841345`, other set); flipped side `0.158655` | sound | none |
| `gaussianWeight`, `weightedMeasure` | `ℝ`, `ℝ²`, zero space, `W + c` | `W(0) = 0.918939`, `e^{−W(0)} = 0.398942`; `0.159155`; no constant: mass `2.506628`; `n = 0`: `W = 0`, `volume = δ_0 = γ`, constant of `n = 1` gives `0.398942` | sound | 2 Checks added |
| `interfaceOperator`, `simplexTangent` | `q = 2`; `q = 3` equal `A`; ordered pairs; `q = 1` | `2A_12`; `3A Id = 0.598413 Id`, kernel `(1,1,1)`; doubled `4A_12`; `E^{(0)} = {0}` | sound | 2 Checks added |
| `gaussianIsoperimetricProfile` (§1.1) | `v = 1/2, 1/3, 2/3, 0, 1, 0.3` | `0.398942`; `0.363600` twice (`Φ⁻¹(1/3) = −0.430727`); `0` at ends vs junk `0.398942`; second difference `−2.876104 = −1/I(0.3)`; `I′(0.3) = 0.524401 = −Φ⁻¹(0.3)` | sound | none |
| §1.2 tails | `r = 0, 1, 2` | `½ = ½`; `0.158655 < 0.241971`, `≤ 0.303265`; `0.022750 ≤ 0.067668`; `h′(0) = −φ(0) < 0` | sound | none |
| §1.3 splitting | `x_1 + x_2 < √2`; `q = 3`, `x_i ≥ 1`; `q = 1` | `Φ(1) = 0.841345`; `1 − Φ(√1.5) = 0.110336` vs wrong `0.207108`; variance `0`, excluded | sound | none |
| `weightedVariation`, `weightedPerimeter`, `gaussianPerimeter` (§2.1) | `U = ℝ` under `γ`; complement; `W = 0` | wrong model (Tau Ceti `perimeter γ`): `E|t| = 0.797885` vs `0`; `∫_E div_μ X dμ = 0` gives complement invariance; reduces to `totalVariationOn volume` | sound | none |
| `weightedVariation_eq_lintegral_variationMeasure` | `χ_{(−1,1)}` under `γ`; `Ω = ∅`; `u ∉ BV_loc` | `2φ(1) = 0.483941` both sides; `0 = 0`; Tau Ceti junk measure `0` vs `V_μ = ∞`, excluded by `hfin` | sound | none |
| `weightedPerimeter_eq_lintegral_reducedBoundary` | unit disc `ℝ²`; `(−1, 1)`, `n = 1`; disc with origin removed / `ℚ²` outside added | `e^{−1/2} = 0.606531` on `∂*` and `∂^M`; counting measure on `{±1}`: `0.483941`; unchanged `0.606531` | sound | none |
| §2.3 explicit perimeters and frontier bound | half-space; ball `n = 1, 2`; quadrant; closed segment | `φ(s)`; `0.483941`, `0.606531 > I(0.393469) = 0.384633`; `2 × 0.199471 = 0.398942 > I(1/4) = 0.317777` (`Φ⁻¹(1/4) = −0.674490`); frontier `0.136177` vs `P = 0` | sound | none |
| §2.4 lsc, compactness | `(−1,1) ∪ (1 + 1/k, 2)`; `(k, k+1)`, `W = 0` | `3φ(1) + φ(2) = 0.779903 > φ(1) + φ(2) = 0.295962`; no `L¹` limit | sound | none |
| `integral_weightedDivergence_eq_integral_reducedBoundary` | `U = E`, `U = ∅`; `(−∞, s)` | `−∫ x_1 dγ = 0`, `∂*E = ∅`; `0 = 0`; `X(s)φ(s)` | sound | none |
| `weightedVariation_eq_lintegral_weightedPerimeter` | `‖x‖` on `ℝ²` (form (a)); `u(t) = t`; `u = c` | `1 = 1.000000`; `1 = 1`; `0 = 0` | sound | none |
| §2.7 cylinders | `F = ℝe_1`; `F = {0}`; translate | `φ(s)` both; `0 = 0`; `0.398942 → 0.241971` | sound | none |
| `Cluster`, `Cluster.perimeter` | three intervals; `q = 1`; `q = 0` | `½(φ(a) + (φ(a) + φ(b)) + φ(b)) = φ(a) + φ(b)`; `(E)` only, `({x_1 < 0})` leaves mass `½`; `volume E = 1 > 0` even on the zero space, so no `0`-cluster | sound | none |
| §3.2 interfaces, merging | `a = 0, b = 1`; half-annuli | `0.640913 − 0.398942 = 0.241971`; boundary length `2^{−2k}(3π/2 + 1)` | sound | none |
| §3.3 quadratic form | three intervals; `(E, ∅, ∅)` | positive definite; `L_A = 0` | sound | none |
| `isoperimetricProfile` (§3.4) | vertex `(1, 0)`; `q = 1`; `n = 0`, `(½, ½)` | `0`; `0`; `∞` | sound | none |
| `exists_cluster_perimeter_eq_isoperimetricProfile` | `q = 0`; `q = 1`; `n = 0`; `W = 0` on `ℝ` | `hsum` reads `0 = 1`; `(E)`; excluded by `Nontrivial`; mass infinite, excluded by `IsProbabilityMeasure` | sound | none |
| `modelCell`, `modelMeasureMap` | `q = 2`, `x = tu`; `q = 3`, `x = 0`; `q = 1` | `Φ(−t)`; `(⅓, ⅓, ⅓)`; `(1)` | sound | none |
| `modelInterfaceArea` | `q = 2`; `q = 3`, `x = 0` | `μHE[0]{x} = 1`, so `φ(t)`; `1/(2√(2π)) = 0.199471`, total `0.598413` | sound | none |
| `modelMeasureMap_diffeomorph` | `q = 2`, `t = 0.7`; `q = 3`, `x = 0`; `t³`; ties `(1, 1, −2)` | `∂_uΨ_1 = −0.312254 = −(L_A u)_1/√2` (sign `+` gives `+0.312254`); `−0.423142 Id`; invertibility not implied by injectivity; `x + Ω_i ⊆ {z_i > x_i}` from `Σ = 0` | sound | none |
| `modelProfile` (§4.4) | `q = 2`, `v = (Φ(1), 1 − Φ(1))`; `q = 3`; boundary | `φ(1) = 0.241971` vs wrong centre model `φ(0.482734) = 0.355065`; `0.598413 > 0.363600`; `0` vs extension `0.398942` | sound | none |
| §4.5 boundary behaviour | conditional law on `{z_i − z_j = c}` | mean `c/2`, variance `2 − ½ = 3/2` | sound | none |
| `modelProfile_hessian` | `q = 2`; `q = 3`, `x = 0` | `Dg(0)u = I′(Φ(−t))/√2 = t/√2`; `H(2φu, u) = 2φ · (−1/(2φ)) = −1`; `∇_u ΣA = −tφ(t) = −½⟨u, L_A tu⟩`; `−1.671086 Id`, `−tr = 1.196827 = 2 × 0.598413` | sound | none |
| `isoperimetricProfile_le_modelProfile` | `q = 2, n = 1, (½, ½)`; `n = 0, q = 2`; `n = 1, q = 3`; `n = 0, q = 1`; `(½, ½, 0)` | `0.398942 ≤ 0.398942`; excluded by `hqn`; three intervals `0.727200 > 0.598413`, excluded by `hqn`; `0 ≤ 0`; excluded by `hv` | sound | none |
| §5.1, §5.2, §5.3 | `(0,1) ∪ (1,2)`; shift of `(0,1)`; `(−1, 0)` shifts; half-lines of mass `⅓` | `0.452933`; `γ = 0.341345`, `(0.408796, ∞)`, `0.366963 = I(0.341345)` below `0.640913`; `(−0.9, 0.063724)`: `0.664218`, `(−0.5, 0.385003)`: `0.722510`; `0.363600` | sound | none |
| `gaussianSymmetral` (§6.1) | half-space; disc, `e_2`; vertical line; idempotence | fixed; section `(−∞, 0.475233)`, mass `0.393469`; `S(U) = U ≠ ∅`, null; `γ_F{Φ(⟨y,u⟩) < v} = v` exactly, so `v_{S(U)} = v_U` everywhere | sound | none |
| §6.2 slicing | `{x_2 < m x_1}`, `m = 1` | `√2 · (1/√2) = 1` both sides; reciprocal Jacobian gives `2` | sound | none |
| §6.3 section measure | `{x_2 < 1 + x_1}`; escaping tails at `z = ±0.1` | `0.219696 ≤ 0.310697`; `P_γ ≤ 2φ(0) + 0.197413 = 0.995297`; `v_U = 0.6, 0.4 = ½ + h` | sound | none |
| §6.4 lower bound | tilted half-plane; CFMP reading | `0.310697` both; `√(4π) · 0.219696 = 0.778801` vs `√(2π + 1) · 0.219696 = 0.592901` | sound | none |
| §6.5 upper bound | disc; tilted half-plane; CFMP (4.10) | `0.386129 + 0.252249 = 0.638378 ∈ [0.517483, 1.213061]`; `0.439391`; `0.778801 ≤ 0.770391` fails, `≤ 1.101391` holds | sound | none |
| `gaussianPerimeter_gaussianSymmetral_le` | disc; `n = 1`, `(−1, 1)`; infinite perimeter | `0.517483 ≤ 0.606531`; `0.356343 ≤ 0.483941`; `γ = 0.116140`, `Φ⁻¹ = −1.194508`, `I = 0.195467 ≤ ∞` | sound | none |
| §7.2 negative control | strips `{|x_1 − 2^{−k}| < 4^{−k}}` | fraction of the disc of radius `1/16`: `0.032981`, below the bound's `0.188628`; missing sections `(5/6)ρ`: `0.208333`, `0.052083` | sound | none |
| `gaussian_isoperimetric` | `n = 0`; `∅`; half-space; disc; slab | only field `0`, `0 = I(0 or 1)`; `0 = I(0)`; `φ(s) = I(Φ(s))`; `0.606531 > 0.384633`; `0.483941 > 0.356343` | sound | none |
| `isoperimetricProfile_two_eq` | `(½, ½)`; `(1, 0)`; `(0, 1)`; `n = 0` | `0.398942`; `0 = I(1)`; `0 = I(0)`; excluded by `Nontrivial` | sound | none |
| `Cluster.perimeter_eq_iff_halfSpaces` | half-space pair; `(E, ∅)` | equality; excluded by `h1` | sound | none |
| `borell_sudakov_tsirelson` | half-space; disc, `r = 1`; `n = 0`; `r = 0` | equality; `a = −0.270288`, `0.864665 ≥ 0.767217`; `A = E`, `1 ≥ Φ(a + r)`; `thickening 0 = ∅`, excluded by `0 < r` | sound | none |
| `borell_sudakov_tsirelson_multivariateGaussian` | `S` not PSD; PSD support | `δ_m`, `m ∈ A`; `L = m + range S = m + range √S` (Tau Ceti) | sound | supplier cited |
| `gaussian_minkowskiContent_ge` | `∅`, `E`; `ℚ²`; Bernstein set | `0 ≥ 0`; `1/r → ∞`; `0.398278`, `0.398936 → 0.398942` | sound | none |
| §8.3 subgraphs, `bobkov_inequality` | `Φ(x)`; `Φ(2x)`; `min(x², 1)`; `n = 0` | `0.398942` both; `√5 φ(2x)` integrates to `0.398942`; `∫f = 0.516059`, `I = 0.398619 ≤ 0.647406`; `I(c) = I(c)` | sound | none |
| `gaussian_concentration_median` | `x_1`, `r = 2`; `|x_1|`; `L = 0`; `r = 0` | `0.022750 ≤ 0.067668`; median `0.674490`, mean `0.797885`; empty set; strict `<` needed | sound | none |
| `gaussian_max_concentration` | two independent normals; `S = 0`; `[[1,2],[2,1]]` | median `0.544952`, `0.010899 ≤ 0.022750`; `σ = 0`; `δ_0`, left side `0` | sound | none |
| `closedGaussianSymmetral` (§9.1) | closed disc; ball in `ℝ³`; complement law | `{⟨y,u⟩ ≤ −0.270288}`; `γ = 0.198748`, `{x_3 ≤ −0.846102}`; `{Φ(⟨y,u⟩) < 1 − v_C}` on both sides | sound | none |
| §9.2 concavity of `g` | `(−1,1)`, `(0,2)`, `(−3,−0.5)`, `(0.5,0.6)` | closed form: `g_aa = g_bb = −0.459912`, `g_ab = −0.219127`, det `0.163502`; dets `0.015519`, `0.000142`, `15.648788`, all `g_aa < 0`; `g(−1,1) = 0.475233` | sound | none |
| §9.3 directions | `u_2`, `u_3`; disc | `135°`, `157.5°`; limit `{⟨x,u_1⟩ ≥ 0.270288}`, mass `0.393469` | sound | none |
| `ehrhard_inequality_convex` | `[−1,1]`, `[−3,3]`, `θ = ½`; `θ = 0.9`; `θ = 0`; empty `B` | `1.690143 ≥ 1.628704`, `Φ(1.628704) = 0.948312 ≥ 0.825134`; `0.561033 + 0.993113 = 1.554146 ≤ 1.690143`, limit `1.475233`; `0 • A = {0}`; `Φ(b) ≤ 0` impossible | sound | none |
| `convex_closedGaussianSymmetral` | `{x_1 > 0} ∪ {0} × [0, ∞)`; `F = E`; `C = ∅` | `{x_1 > 0} ∪ {0} × (−∞, 0]`, midpoint level `Φ(47.5) ≤ 1`; half-space, `∅` or `E`; `∅` | sound | none |

No instance makes a statement false. No hypothesis was found to be removable on the evidence of an instance.

## Unresolved, for the human reviewers

- **Part II does not exist.** Scope and ownership and Downstream consumers assign the multi-bubble theorem for `3 ≤ q ≤ n + 1` to "GaussianIsoperimetryAndClusters, Part II". That roadmap is not on main, in the merge order, in an open pull request or on the board. The accepting review left this to a human, and it is unchanged.
- **Licences of the source copies.** CianchiFuscoMaggiPratelli2011 and Maggi2012 were read from cvgmt copies (`institutional`), and Bobkov1997 from the author's page. The hosts' terms were not read.
- **Sources not read in full.** Bobkov1997's text could not be read from the cached copy; its locators are corroborated by Ledoux1999 line 296–313. Maggi2012 is read only in the author's extract. SudakovTsirelson1974, CarlenKerce2001, AmbrosioFuscoPallara2000 and Bogachev1998 are cited by locator only. None was fetched in this job.
- **Resolver index ahead of this worktree.** The resolver's index has a newer main (`818115d`) than this worktree's base (`666d57e`). I checked the cited headings and the absence of a copy of this roadmap at that main.
- **Untrusted text.** No text read in this job contained instructions; there is nothing suspicious to quote.


Pull request: #2420 (roadmap/gaussian-isoperimetry-and-clusters at 1bb9eab)
