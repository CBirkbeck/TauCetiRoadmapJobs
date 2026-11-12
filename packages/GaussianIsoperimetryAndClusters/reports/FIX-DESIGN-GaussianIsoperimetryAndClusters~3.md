# FIX-DESIGN-GaussianIsoperimetryAndClusters~3

Repair round for the design of `GaussianIsoperimetryAndClusters`. It settles the eight findings R01–R08 of
`REV-DESIGN-GaussianIsoperimetryAndClusters~2`. Files edited:
`packages/GaussianIsoperimetryAndClusters/design/README.md` and
`packages/GaussianIsoperimetryAndClusters/design/plan.json`. `sources.toml` is unchanged: no new
source was cited, and every locator added points into texts the manifest already records.

Every finding was checked against the pinned libraries (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, the
pins of `lake-manifest.json`), the cited sources and the roadmap's own definitions. All eight hold
and all are applied.

## REV-DESIGN-GaussianIsoperimetryAndClusters~2/R01 (P1) — applied

Witness holds (`ℝe_2` has `v_U(0) = 1`, `S(U) = U`). §6.1 API: "null sets go to `∅`, conull to `E`"
→ `∅`/`E` up to null sets; literal only for `∅`, `E` and all-null or all-full sections. Added the
vertical-line Check. Plan 6.1 API restated; test `vertical_line` added.

## REV-DESIGN-GaussianIsoperimetryAndClusters~2/R02 (P1) — applied

§8.3: constant-subgraph formula restricted to `0 < c < 1`, endpoints from `A_0 = ∅`,
`A_1 = E × ℝ`; endpoint Check added. Quantile contract: junk for `t ≤ 0` and `t > 1`; at `t = 1` the
least full-mass point (`2` for Dirac at `2`, `0` for the Gaussian). Plan synced; pattern below.

## REV-DESIGN-GaussianIsoperimetryAndClusters~2/R03 (P1) — applied

Layer 4 now has `q ≥ 2`. The §4.1 one-cell model is deleted. §4.4 positivity holds for `q ≥ 2`,
with `I_m^{(0)}(1) = 0` labelled a convention. §3.4 states `I_μ^{(0)}(1) = 0` for every weight, and
the §1.3 Check is restricted to `q ≥ 2`. `q = 1` negative controls added. Plan 1.3, 3.4, 4.1 and 4.4
synced.

## REV-DESIGN-GaussianIsoperimetryAndClusters~2/R04 (P2) — applied

§1.3: the density and projection assertions are deleted and cited from Tau Ceti; the addition-map
product and the half-space law are kept. §1.1 imports `cdf_quantile` and `quantile_cdf`, and
StandardDistributions is dropped. The Tau Ceti contract lists the pinned BV declarations and the
`TauCeti.perimeter γ` caveat. GeometricMeasureTheory is narrowed to G2, G4, G5 and G6. Lines and the
baseline are reconciled.

## REV-DESIGN-GaussianIsoperimetryAndClusters~2/R05 (P3) — applied

§6.1 Check: "`{⟨x, e⟩ > −a}`, of measure `1 − Φ(a)`" → the reflected set, of the same measure
`Φ(a) = 0.841345`, which is not fixed. Flipping the side but keeping the threshold gives
`{⟨x, e⟩ > a}`, of measure `0.158655`. Both are recorded. Plan test `halfspace_fixed` matches, and the
definition is unchanged.

## REV-DESIGN-GaussianIsoperimetryAndClusters~2/R06 (P2) — applied

§3.1's merging bullet now proves only weak non-increase, by subadditivity of `V_μ` (§2.1). The exact
decrement `P_μ(Ω) − A_ij` moved to §3.2 with its route and a Check
(`0.640913 − 0.398942 = 0.241971`). The "same interfaces (§3.2)" clause moved there as well. The
`3.1 → 3.2` Needs edge is deleted. Plan: `Cluster.merge` and `Cluster.congr` restated, 3.2 extended,
test `merge_decrement` added.

## REV-DESIGN-GaussianIsoperimetryAndClusters~2/R07 (P2) — applied

§4.2: "unchanged by scaling the centres" → by `p_i ↦ c + λ(p_i − c)` for real `λ > 0`, via
`⟨y − c, p_j − p_i⟩ < 0`. Added a Check: centres `±1` with `λ = 2, −1, 0` give `(−∞, 0)`, `(0, ∞)`
and `∅`. Plan 4.2: API restated, test `scaling_factor` added.

## REV-DESIGN-GaussianIsoperimetryAndClusters~2/R08 (P2) — applied

Plan 4.1 `modelCluster_isCluster`: "interfaces `x + Σ^m_ij`" → reduced-boundary interfaces equal to the
closed faces up to `μHE[q−2]`-null sets. The README bullet says the same. Added the tripod-origin
negative control: density `1/3`, averaged normal `√3/2 < 1`, null difference `{0}`, areas `0.199471`.
It is a README §4.1 Check and plan test `tripod_origin`.

## Pattern search and the other places repaired

- **R01.** No other statement claimed literal null or conull images. §9.1 states
  `γ(S̄(C)) = γ(C)` and a null difference `S(C) ⊆ S̄(C)`, which are already a.e. statements. The `ℚe`
  Check is literal and correct (every section is null or full); it now says so.
- **R02.** Every place that evaluates `Φ⁻¹` at `0` or `1` was searched.
  - The Conventions' symmetral sentence and the superlevel Check now say `0 < v < 1`.
  - §6.5 defined `H(z, s) = ∫_{−∞}^{Φ⁻¹(s)}`. With the pinned quantile this gave
    `H(z, 0) = H(z, 1) = ∫_{−∞}^{0}` (`0.5` against the true `0` and `1` for a unit field). It is now
    `∫_{Φ(t) < s}`, with `∂_s H` stated on `(0, 1)`.
  - The §6.5 `e`-component integrand is `0` where `v_U ∈ {0, 1}`.
  - The §1.1 endpoint Check and plan test `profile_endpoints` now name both levels.
  - §§4.6, 8.1, 8.2, 8.3 (graph over `{0 < f < 1}`), 9.2 and 9.5 already restrict `Φ⁻¹` to `(0, 1)`.
- **R03.** The §3.4 padding bound at `|J| = 1` needs `I_μ^{(0)}(1)` for every weight, so the
  convention is now stated there. §4.5's face identity and §4.7's vertex case use the convention
  consistently. The Conventions' simplex `Δ^{(q−1)}` is kept for `q ≥ 1`, since it carries the
  convention.
- **R04.** These `Needs` lines and layer `Dependencies` now cite Tau Ceti declarations instead of
  GeometricMeasureTheory G3/G4 or StandardDistributions: §1.1, §1.3, §§2.1–2.6, §3.3, §3.4, §4.3, §5.1,
  §6.3, §6.4, §7.2, Layers 1–7 and How to read the build.
  - The §5.1 route now runs through `TauCeti.Real.ofReal_sum_abs_sub_le_totalVariationOn`
    (alternations of Lebesgue values).
  - The §2.5 route applies Tau Ceti's Gauss–Green formula to `e^{−W} X` and identifies the perimeter
    measure by G5.
  - The §2.6 route uses `TauCeti.lintegral_variationMeasure_eq_lintegral_lintegral`.
  - Plan suppliers and prerequisites are synced.
  - Kept with GeometricMeasureTheory, because the pin lacks them:
    - De Giorgi in Hausdorff form, density `1/2`, essential versus reduced boundary, and the boundary
      criterion (G5);
    - Lipschitz domains (G6);
    - the weighted Lipschitz coarea formula: Tau Ceti's coarea needs a surjective derivative everywhere
      and has no weight (G2);
    - the tangential area formula and locally Lipschitz graphs (G2);
    - the pointwise mollification estimate: Tau Ceti's is its integrated form (G4).
- **R05.** The §9.1 direction Check (`S̄_{F,−u}` sends `{⟨x,u⟩ ≤ a}` to `{⟨x,u⟩ ≥ −a}`, of the same
  measure) and the §6.6 reflected half-plane Check were already correct and are consistent with the new
  text.
- **R06.** The forward pointer "(§3.2)" on interfaces in §3.1 was the same pattern and is repaired. No
  other `Needs` line points forward (checked by script).
- **R07.** No other scaling claim exists. The `q = 3` case of `λ = −1` maps cell `i` to the sector
  around `−r_i`, which is not a cell, so it is a change of cluster, not a relabelling.
- **R08.** The other uses of `Σ^m_ij` (the §4.1 face-incidence bullet and the §4.6 boundary terms)
  concern the closed model faces as sets or measures and are correct as stated.

## Adversarial pass on every added or changed statement

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §6.1 null/conull images (R01) | `U = ℝe_2 ⊂ ℝ²`, `F = ℝe_2`; its complement; `U = ℚe`; `∅`, `E` | line: `v_U(0) = 1`, else `0`, so `S(U) = U`, `γ = 0 = γ(U)`; complement fixed, `γ = 1`; `ℚe`: all sections null, so `S = ∅` literally; complement of `ℚe`: all sections full, so `S = E`; `S(∅) = ∅`, `S(E) = E` | a.e. form true, literal form false for the line | API restated, Check added |
| §6.1 idempotence/measure (unchanged, recomputed) | any `U`, `v ∈ {0, 1/2, 1}` | `γ_F({Φ(⟨y,u⟩) < v}) = 0, 0.5, 1`, so `v_{S(U)} = v_U` everywhere | holds | none |
| §6.1 reflection Check (R05) | `a = 1` | reflected `{x > −1}`: `Φ(1) = 0.841345`; unreflected `{x > 1}`: `0.158655`; printed `1 − Φ(a)` for the reflected set: wrong | Check was false | rewritten with both wrong models |
| Conventions superlevel Check (R02 pattern) | `v = Φ(1)`; `v = 0` | `(Φ⁻¹(v), ∞)`: `1 − v = 0.158655`; at `v = 0` the quantile form gives `(0, ∞)`, of measure `0.5`, not `1` | needs `0 < v < 1` | restricted |
| §8.3 constant subgraph (R02) | `c = 0, 0.2, 1/2, 0.9, 1` | true measures `0, 0.2, 0.5, 0.9, 1`; formula `Φ(Φ⁻¹(c))` gives `0.2, 0.5, 0.9` inside; at `c = 0, 1` the pinned quantile is `0`, so `Φ(0) = 0.5` | valid only for `0 < c < 1` | restricted, endpoint Check |
| Quantile contract at `t = 1` (R02) | Dirac at `2`; `gaussianReal 0 1`; `t = 0`; `t = 1.5` | level-one set `[2, ∞)` gives `2`; Gaussian distribution function `< 1`, so `sInf ∅ = 0`; `t = 0`: `sInf ℝ = 0`; `t = 1.5`: `0` | old text wrong for the Dirac law at `t = 1` | rewritten |
| §6.5 `H(z, s)` (R02 pattern) | `X^⊥ = 1` on `|t| ≤ 10`; `s = 0, 1` | Φ-form: `H(z, 0) = 0`, `H(z, 1) = 1.000000`; quantile form: both `Φ(0) − Φ(−10) = 0.500000` | quantile form wrong at the ends | Φ-form; `∂_s H` stated on `(0, 1)` |
| §1.3 standardized coordinates (R03) | `q = 1, 2, 3, 4` | `‖P e_i‖² = (q−1)/q = 0, 0.5, 0.666667, 0.75`; `q = 3`: `1 − Φ(√1.5) = 0.110336` against `0.207108`; `q = 1`: variance `0`, factor `1/0` | needs `q ≥ 2` | restricted |
| §4.4 positivity (R03) | `q = 1`; `q = 2` at `(1/2,1/2)`; `q = 3` centre | `0` (convention), not `> 0`; `0.398942 > 0`; `0.598413 > 0` | holds for `q ≥ 2` | restricted, Check added |
| §3.4 convention `I_μ^{(0)}(1) = 0` (R03) | vertex `(1, 0)`, `J = {1}` | `I_μ^{(1)}(1, 0) = 0 ≤ I_μ^{(0)}(1) = 0`; with `∞` as the empty infimum the bound is `0 ≤ ∞`, vacuous | convention needed for every weight | added |
| §4.1 `q = 1` exclusion (R03) | `E^{(0)} = {0}` | tuple length `1 < 2`; no pairs `i < j`, so the empty sum is `0`; `μHE[1 − 2] = μHE[0]`, the counting measure | excluded | Check added |
| §4.1 closed faces against interfaces (R08) | `q = 3`, `x = 0` | origin on all three closed faces; cell density `1/3`; edge normals at `60.000°`; averaged normal norm `0.866025 < 1`; difference `{0}`, `μHE[1]`-null; areas `0.199471`, total `0.598413` | a.e. equality, not literal | plan API, Check, test |
| §4.2 scaling (R07) | centres `−1, 1`, `λ = 2, −1, 0`; `q = 3` equilateral, `λ = −1` | test points `y = −1, −0.1, 0.1, 1`: cell 1 is `{−1, −0.1}`, `{0.1, 1}`, `∅`; at `q = 3`, `λ = −1` gives sectors around `−r_i`, which are not cells | `λ > 0` needed | restated, Check |
| §3.1 weak merging (R06) | intervals at `a = 0`, `b = 1`; merge cells 1, 2 and cells 2, 3 | `0.241971 ≤ 0.640913`; `0.398942 ≤ 0.640913` | holds by subadditivity alone | restated |
| §3.2 exact decrement (R06) | same | merge 1, 2: `0.640913 − A_12 (0.398942) = 0.241971`; merge 2, 3: `0.640913 − A_23 (0.241971) = 0.398942`; merged interface `A_13 + A_23 = 0.241971` | holds | moved here, Check added |
| §1.3 addition-map law, half-space (R04) | `F = {0}`, `F = E`; `ν = (e_1+e_2)/√2` | `δ_0 ⊗ γ_E`, `γ_E ⊗ δ_0`; `γ({x_1 + x_2 < √2}) = Φ(1) = 0.841345` | holds | scope narrowed |
| §1.1 imported inverse laws (R04) | `v = 1/3`; `s = 1` | `Φ⁻¹(1/3) = −0.430727`, `Φ(−0.430727) = 0.333333`; `Φ⁻¹(Φ(1)) = 1.000000`; hypotheses: `Φ` continuous, strictly increasing, values in `(0, 1)` (`cdf_gaussianReal_pos`, `_lt_one`) | holds | API bullet trimmed, Needs |
| §2.1 wrong model is `TauCeti.perimeter γ` (R04) | `U = ℝ` under `γ` | `sup ∫ t X(t) dγ = 2φ(0) = 0.797885`, against `P_γ(ℝ) = 0` | distinct objects | Check names it |
| §2.1 weight `0` equals Tau Ceti (R04) | `(0, 1) ⊂ ℝ` | `V_volume = 2`; `TauCeti.Real.perimeter_Ioo` gives `2` | agrees | bullet names it |
| §2.3 density factorization (R04) | `n = 2`, `s = 1`, `y = 0` | `(2π)^{−1} e^{−1/2} = 0.096532`; `φ(1)·φ(0) = 0.096532` | agrees | citation moved to Tau Ceti |
| §5.1 route (R04) | `U = (0, 1) ∪ (1, 2)` | Lebesgue values along `−1, 0.5, 1.5, 3`: `0, 1, 1, 0`, so 2 alternations `≤ |Dχ_U|(ℝ) = 2`; `T = {0, 2}`, `P_γ = 0.452933` | consistent | route rewritten |

## Checks

**Dependency check** (command of the brief), after all edits:

```
candidate: GaussianIsoperimetryAndClusters is not in the merge order yet; checked as if placed after QuasiregularMaps (the intake inserts it when its design is accepted)
depcheck: 236 roadmaps, 2132 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line. The suppliers are only GeometricMeasureTheory (G2, G4, G5,
G6) and Isoperimetry (I4), both on main. StandardDistributions is no longer cited.

**Local order.** All plan target prerequisites point backwards. No README `*Needs:*` line cites a later
§, checked by script. The `3.1 → 3.2` edge is gone. plan.json parses: 9 layers, 46 targets, 132 tests
(127 before: added `merge_decrement`, `tripod_origin`, `scaling_factor`, `one_cell_positivity` and
`vertical_line`; renamed `one_cell` and `zero_function`).

**Citations.** `roadmaps resolve` on the README found no cross-roadmap citation and no Lean name
missing. On this host it does not check names outside TauCetiRoadmap. So every backticked library name
in the README (66 names) was looked up in the pinned Mathlib and Tau Ceti sources by declaration
keyword, namespace and line. All resolve. Every line number now cited matches the pin. Corrected:
`isOpenMap_of_hasStrictFDerivAt_equiv` 204→205, `LipschitzWith.ae_differentiableAt` 385→386,
`norm_fderiv_le_of_lipschitz` 947→949, `Monotone.ae_differentiableAt` 209→213,
`MonotoneOn.intervalIntegral_deriv_mem_uIcc` 100→101, `Convex.nullMeasurableSet` 85→89,
`Besicovitch.ae_tendsto_measure_inter_div` 1105→1104 (path also completed),
`cdf_gaussianReal_zero_one` 122→148, `continuous_erf` 105→115, `quantile` 101→164.

**Suggested.lean.** This is the design stage, so the package has no `Suggested.lean`. No Lean name of
this roadmap was added or removed, and no `#check @…` scratch file was elaborated. There was nothing
to elaborate.

**Gate failures.** The brief listed none.

## For the maintainer

- **The supplier floor moved to Tau Ceti.** The pinned Tau Ceti now supplies what this roadmap used to
  take from GeometricMeasureTheory G3 and much of G4–G6:
  - total variation and perimeter by duality;
  - the variation measure and polar decomposition;
  - the reduced boundary, outer normal, and Gauss–Green against the perimeter measure;
  - the essential boundary;
  - compactness, BV Poincaré, and scalar coarea;
  - the one-dimensional variation bound and the sphere measure.

  These are cited by declaration. GeometricMeasureTheory stays a supplier only for:
  - De Giorgi's theorem in Hausdorff form, density `1/2`, essential versus reduced boundary, and the
    boundary criterion (G5);
  - Lipschitz domains (G6);
  - weighted Lipschitz coarea, the tangential area formula, and locally Lipschitz graphs (G2);
  - the pointwise mollification estimate (G4).

  Isoperimetry I4 stays for the reduced-boundary slicing comparison. Tau Ceti has only the integrated
  slicing inequality.
- StandardDistributions Layer 7.2 is no longer cited: its content is
  `MeasureTheory.Measure.cdf_quantile` and `MeasureTheory.Measure.quantile_cdf` at the pin.
- Tau Ceti's `TauCeti.perimeter γ` uses the ordinary divergence. It is not the Gaussian perimeter, and
  the README now says so in Scope, in the Tau Ceti contract and in a §2.1 Check. A later
  implementation must not identify the two.
- **Ownership.** This round introduced no new object. Ownership moved only toward the pinned library.
  No ownership check against open pull requests was needed for new constructions. The overlap data
  (no dropped cited ids, no shared edits) is unaffected, since the cited ids are a subset of the earlier
  ones.
- No name or section cited by another roadmap changed. The §1.3 heading is now "Orthogonal splitting";
  this design package is not cited elsewhere.
- No text from the review or any fetched page was treated as an instruction. No suspicious passage was
  found.
