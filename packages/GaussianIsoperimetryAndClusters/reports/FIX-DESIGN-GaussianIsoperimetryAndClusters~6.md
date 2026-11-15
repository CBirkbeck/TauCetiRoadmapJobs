# FIX-DESIGN-GaussianIsoperimetryAndClusters~6

Repair of the design, settling the two findings of `REV-DESIGN-GaussianIsoperimetryAndClusters~5`. Files changed: `packages/GaussianIsoperimetryAndClusters/design/README.md` and `packages/GaussianIsoperimetryAndClusters/design/plan.json`. `sources.toml` is unchanged: no new work is cited, so no source was fetched and nothing was added to `needs-references.toml`.

## F01 (P3) — applied

Correct. I recomputed every value in double precision (`Φ` from `erfc`, `Φ⁻¹` by bisection plus Newton steps, the Hessian of `g` in closed form and by finite differences at steps `10⁻³` and `10⁻⁴`). The changes, old → new: `g(−1, 1)` `0.475231 → 0.475233` (§6.1, §9.2, §9.5); `Φ⁻¹(1 − e^{−1/2})` `−0.270289 → −0.270288` (§8.1, §9.1, §9.3); `Φ(0.729711) → Φ(0.729712)`; `1.628703 → 1.628704` (two §9.5 Checks); `1.475231 → 1.475233`; `−0.459910 → −0.459912`; the determinant `15.273135 → 15.648788`. I made the same changes in the eight plan tests. Two related fixes: the §8.1 and §9.2 Checks now evaluate `Φ⁻¹` at the exact argument instead of the rounded one, which was the source of the error, and "Second differences" now reads "Second derivatives", with the first derivatives they come from.

## F02 (P3) — applied

Correct. On main, `TauCetiRoadmap/Isoperimetry/README.md` lines 237–248 state the slicing target for sets with `0 < |E| < ∞` and `P(E) < ∞`. The I4 contract now uses that hypothesis. The §6.2 route now cuts with `U ∩ ball(0, R_k)`, using `TauCeti.ae_perimeter_inter_ball_le`. The reduced boundary is local under a change of the reference open set (`TauCeti.variationMeasure_eq_comap_inclusion`, `TauCeti.ae_eq_polarDensity`, `TauCeti.reducedBoundary_congr_ae`, `TauCeti.outerNormal_congr_ae`). I updated the *Needs:* line, the plan prerequisites, the plan's supplier note and the Tau Ceti contract to match, and added a half-plane Check.

Why the suggested repair needed more: the review says "`TauCeti.reducedBoundary` is local". At the pin, locality (`reducedBoundary_congr_ae`, line 404; `reducedBoundary_inter_opens`, line 411) is only proved for a fixed reference open set `Ω`. The route needs the reduced boundary in `E` intersected with `ball(0, R)` to equal the reduced boundary in `ball(0, R)`. No pinned lemma states this. It follows from `TauCeti.variationMeasure_eq_comap_inclusion` (VariationMeasure.lean:230: on an open subset, the variation measure is the pullback), from the uniqueness of the polar density `TauCeti.ae_eq_polarDensity` (PolarDecomposition.lean:319), and from the fact that small closed balls stay inside the open set. All of these are named in the route and listed in the Tau Ceti contract. The null case `|U| = 0`, which I4's hypothesis `0 < |V|` excludes, is handled separately: then `∂*U = ∅` and almost every section is null.

## Checks run

- **Dependency gate** (command of the brief), run after the last edit:

  ```text
  candidate: GaussianIsoperimetryAndClusters is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
  depcheck: 245 roadmaps, 2229 edges, 0 problem(s)
  ```

  No UPWARD and no CYCLE line. The new edges all point to Tau Ceti declarations at the pin.
- **Citation resolver** (`roadmaps resolve` on the README): no unresolved cross-roadmap citations and no unresolved Lean names. The tool did not check names outside the roadmap repository, so I checked by hand that the five Tau Ceti names added are in namespace `TauCeti` at pin `2fd255d997f47c0b5d834ee416c7015d55444ce5`: `ae_perimeter_inter_ball_le` (TauCeti/Analysis/BoundedVariation/CutByBall.lean:228, assuming `[μ.IsAddHaarMeasure]` and a null-measurable set), `variationMeasure_eq_comap_inclusion` (VariationMeasure.lean:230), `ae_eq_polarDensity` (PolarDecomposition.lean:319), `reducedBoundary_congr_ae` (ReducedBoundary.lean:404), `outerNormal_congr_ae` (ReducedBoundary.lean:418).
- `plan.json` parses. Re-serialising it changed only the edited entries (19 insertions, 9 deletions).
- **`Suggested.lean`**: the design stage has none, so there was no elaboration and no `#check` binder audit. No Lean name was added, removed or renamed.
- **Gate failures listed in the brief**: none.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §6.1 disc section endpoint | `U = ball(0, 1)`, `e = e_2`, `z = 0` | `Φ⁻¹(2Φ(1) − 1) = 0.4752328`; `Φ⁻¹(0.682689) = 0.4752315` (rounded input) | `0.475233` | value fixed |
| §8.1 disc, `r = 1` | `a = Φ⁻¹(1 − e^{−1/2})` | `a = −0.2702880`, `a + 1 = 0.7297120`, `Φ(a + 1) = 0.7672169`; `1 − e^{−2} = 0.8646647` | inequality holds | argument fixed, value unchanged |
| §9.1 / §9.3 disc half-planes | same `a` | thresholds `−0.270288`, `+0.270288`; measure `1 − e^{−1/2} = 0.393469` | sound | value fixed |
| §9.2 Hessian of `g` (closed form vs. differences) | `(−1, 1)`, `(0, 2)`, `(−3, −0.5)`, `(0.5, 0.6)` | `(−1,1)`: `g_aa = g_bb = −0.4599120`, `g_ab = −0.2191269`, det `0.1635024`; `(0,2)`: det `0.0155193`; `(−3,−0.5)`: det `0.0001422`; `(0.5,0.6)`: `g_aa = −36.796666`, `g_bb = −37.671227`, `g_ab = 37.020626`, det `15.648788` (step `10⁻³`: `15.273135`, step `10⁻⁴`: `15.645025`) | negative definite at all four | values fixed; "derivatives" |
| §9.2 closed form | derivative of `Φ(g) = Φ(b) − Φ(a)` | `g_a = −φ(a)/φ(g)`, so `g_aa = aφ(a)/φ(g) + gφ(a)²/φ(g)²`; agrees with the `10⁻⁴` difference to 7 digits at `(−1, 1)` | sound | — |
| §9.5 Ehrhard example | `[−1,1]`, `[−3,3]`, `λ = ½` | `g(−3,3) = 2.7821750`, half-sum `1.6287039`, `Φ⁻¹(γ([−2,2])) = 1.6901434`; `Φ(1.628704) = 0.948312`, `γ([−2,2]) = 0.954500`, `(0.682689 · 0.997300)^{1/2} = 0.825134` | `1.690143 ≥ 1.628704`; `0.954500 ≥ 0.948312 ≥ 0.825134` | values fixed |
| §9.5 Borell limit | `λ = 0.9`, `λ → 1` | `0.9 Φ⁻¹(0.7334795) = 0.5610335`, `0.1 Φ⁻¹(1 − 1.523971·10⁻²³) = 0.9931126`, sum `1.5541461`; limit `0.4752328 + 1 = 1.4752328` | `1.554146 < 1.690143`; limit `1.475233` | limit fixed |
| Rounding pattern elsewhere in the README | `Φ⁻¹(1/3)`, `2φ(Φ⁻¹(1/3))`, `Φ⁻¹(3/4)`, `Φ⁻¹(√½)` and its tail, `γ₃(closedBall)` and its quantile, the centred-point value of §4.4, the disc integrals of §6.5–6.6 | `−0.4307273`, `0.7271995`, `0.6744898`, `0.5449521` and `0.0108994`, `0.1987480` and `−0.8461016`, `φ(0.4827344) = 0.3550649`, `∫ I(v_U) dγ = 0.2522490`, `P_γ(S_e U) = 0.5174833` (quadrature after `z = sin θ`) | all printed values correct | none |
| I4 contract (new hypothesis) | half-plane `{x_1 < 0}`; a bounded disc | half-plane: volume `∞`, perimeter `∞`, outside the contract; unit disc: volume `π`, perimeter `2π`, inside it | contract matches the Isoperimetry I4 text on main | restated |
| §6.2 cutting step, finiteness | `U` of locally finite perimeter, a.e. `R` | `P(U_R) ≤ P(U; ball(0,R)) + m′(R)`, both terms finite (compact `closedBall(0,R)`, real derivative); `|U_R| ≤ |ball(0,R)| < ∞` | I4's hypotheses hold for a.e. `R` once `|U_R| > 0` | added |
| §6.2 null case | `U = ∅`; `U` a line in `ℝ²` | `∂*U = ∂*∅ = ∅` (zero variation measure, so no unit limit); a.e. section is null with empty reduced boundary; the right-hand set `{t : z + te ∈ ∂*U}` is empty | conclusions hold | added |
| §6.2 locality, half-plane Check | `U = {x_1 < 0}`, `e = e_1`, `z = s e_2`, `|s| < R` | `U_R`: volume `πR²/2`, perimeter `πR + 2R`; section `(−√(R² − s²), 0)` with `∂* = {−√(R² − s²), 0}`; inside `|t| < √(R² − s²)` only `0`, which is `∂*` of `U_z = (−∞, 0)`, and `⟨ν_U, e_1⟩ = 1` | agrees; the whole-line reading adds a spurious sphere point | Check added |
| §6.2 locality, slicing along the boundary | same `U`, `e = e_2`, `z = s e_1`, `s < 0` | `U_z = ℝ`, `∂* = ∅`; `(U_R)_z = (−√(R² − s²), √(R² − s²))` with both endpoints on the circle, none inside the ball | agrees | — |
| §6.2 orthogonality | `z ⊥ e`, `‖e‖ = 1` | `‖z + te‖² = ‖z‖² + t²`, so `z + te ∈ ball(0, R_k)` for `|t| < ρ` exactly when `R_k² > ‖z‖² + ρ²` | sound | — |
| Contract hypotheses of other suppliers (pattern) | GeometricMeasureTheory G2, G4, G5, G6 on main | G2: tangent planes for countably rectifiable sets of locally finite `Hᵏ` measure (∂*U qualifies by G5); G5: essential vs. reduced boundary "for locally finite-perimeter sets"; G6: Gauss–Green for locally finite perimeter; G4: convolution estimates | no contract wider than its supplier | none |

## For the maintainer

- No name that another roadmap cites changed. No Lean declaration was added, removed or renamed, and no section, layer or target id moved.
- Ownership: no new object is introduced, and §6.2 stays this roadmap's target. The localization uses only pinned Tau Ceti declarations and Isoperimetry I4 as on main.
- No suspicious instructions were found in the review text.
