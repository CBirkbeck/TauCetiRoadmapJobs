<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13761#issuecomment-6849324135 -->
Review (claude) of cd437fb

Verdict: needs_changes

1. **F01** (P3) Nine Check values are off in the last digits

   **Location.** `packages/GaussianIsoperimetryAndClusters/design/README.md` lines 466, 582, 656, 666, 667, 678, 695, 697, 698, for example line 667: "`g(−1, 1) = Φ⁻¹(0.682689) = 0.475231`"; the matching tests in `packages/GaussianIsoperimetryAndClusters/design/plan.json` (lines 1184, 1575, 1839, 1872, 1877, 1914, 1972, 1987).

   **Claim.** The six-decimal values of these Checks are the values of the stated quantities.

   **Witness.** Recomputed in double precision (bisection on `erfc`; analytic second derivatives of `g`). `Φ⁻¹(2Φ(1) − 1) = 0.4752328492`; the printed `0.475231` is `Φ⁻¹` of the rounded input `0.682689` (`= 0.4752314682`). The determinant at `(0.5, 0.6)` is a finite-difference artefact: step `10⁻³` gives `15.273135`, step `10⁻⁴` gives `15.645024`, the closed form gives `15.648788`.

   **Exact repair.** Replace, in the README and in the plan tests:

   | Quantity | Printed | Correct |
   |---|---|---|
   | `g(−1, 1) = Φ⁻¹(2Φ(1) − 1)` (§6.1 section endpoint, §9.2) | `0.475231` | `0.475233` |
   | `Φ⁻¹(1 − e^{−1/2})` (§8.1, §9.1, §9.3; with sign in §9.3) | `−0.270289` | `−0.270288` |
   | `Φ(a + 1)` argument in §8.1 | `Φ(0.729711)` | `Φ(0.729712)` (value `0.767217` unchanged) |
   | `½ g(−1, 1) + ½ g(−3, 3)` (§9.5, two Checks) | `1.628703` | `1.628704` (and `½(0.475233)`) |
   | `g(−1, 1) + 1` (§9.5, limit `λ → 1`) | `1.475231` | `1.475233` |
   | `∂²_a g = ∂²_b g` at `(−1, 1)` (§9.2) | `−0.459910` | `−0.459912` |
   | Hessian determinant of `g` at `(0.5, 0.6)` (§9.2) | `15.273135` | `15.648788` |

   Closed forms used for §9.2, with `G = g(a, b)`: `g_aa = aφ(a)/φ(G) + Gφ(a)²/φ(G)²`, `g_bb = −bφ(b)/φ(G) + Gφ(b)²/φ(G)²`, `g_ab = −Gφ(a)φ(b)/φ(G)²`. At `(−1, 1)` they give `−0.4599120`, `−0.4599120`, determinant `0.1635024`; at `(0, 2)` and `(−3, −0.5)` the printed determinants `0.015519` and `0.000142` are confirmed. Every inequality and every sign in the affected Checks is unchanged (`1.690143 ≥ 1.628704`, `0.954500 ≥ 0.948312`, negative definiteness). This is the pattern of the round-4 rounding repair (`0.219695 → 0.219696`) found in the rest of the design.

2. **F02** (P3) The Isoperimetry I4 contract is stated for locally finite perimeter; I4 states finite perimeter and finite volume

   **Location.** `packages/GaussianIsoperimetryAndClusters/design/README.md` line 89: "I4: the finite-perimeter slicing theorem along lines. For `U` of locally finite perimeter in `E`, `n ≥ 2`, and a unit vector `e` …"; used in §6.2 (line 472).

   **Claim.** Isoperimetry I4 supplies the line-slicing theorem, with reduced-boundary and normal comparison, for sets of locally finite perimeter.

   **Witness.** Main, `TauCetiRoadmap/Isoperimetry/README.md:237–248`: the slicing target sits in the bullet whose standing set has `0 < |E| < ∞` and `P(E) < ∞`. The half-plane `{x_1 < 0} ⊂ ℝ²`, with `P_γ = 0.398942`, has infinite volume and infinite Euclidean perimeter.

   **Exact repair.** In the I4 contract and in the §6.2 route add one clause: I4 is applied to `U ∩ ball(0, R)`, which has finite volume and, for almost every `R`, finite perimeter (Tau Ceti `TauCeti.ae_perimeter_inter_ball_le`, `TauCeti/Analysis/BoundedVariation/CutByBall.lean:228`); sections, reduced boundary and normal of `U` and of `U ∩ ball(0, R)` agree inside the open ball (`TauCeti.reducedBoundary` is local), and a countable union over `R → ∞` gives the statement for locally finite perimeter. Add that declaration to the §6.2 *Needs:* line and to the plan prerequisites of 6.2. Tested on the witness: `{x_1 < 0} ∩ ball(0, R)` has volume `πR²/2` and perimeter `πR + 2R`, both finite, and its sections along `e_2` over `|z| < R` agree with those of the half-plane on `|t| < √(R² − z²)`. No owner changes; the edge points to a pinned declaration.

Two findings, both P3, no P1 or P2. Both round-4 findings are repaired. A fix round applies the two repairs below; nothing else needs to change. The reviewed README, plan and manifest were left unchanged; no source was fetched and no manifest entry was added. There are no maintainer notes and no declared supplier gaps.

## Repairs of the previous round

| Round-4 finding | Disposition | Repaired passage and my check |
|---|---|---|
| Round-4 first finding, Bobkov locator | **Repaired** | README §8.3: "Bobkov1997 Corollary 1, inequality (10), p.209 (page marker line 72), stated there for locally Lipschitz `f` on `ℝ^n`, and for the converse the approximation by `max(0, 1 − d_A/h)` after Corollary 2, p.210"; References, plan 8.3.1 locator and the manifest `locator` agree. I extracted pages 4–5 of the cached PDF: running head "209", "COROLLARY 1 … for any locally Lipschitz function f : Rⁿ → [0, 1]", inequality (10), then (11) for Borel sets; "210", "COROLLARY 2", (12), and the cutoff `max{1 − (1/h) dist(A, x), 0}`. No "Theorem 1.1" exists. Key, hash and provenance of the manifest entry are unchanged; no second key. |
| Round-4 second finding, §6.5 inputs and build guide | **Repaired** | §6.5 now ends: "For the bound by `2 P_γ(U)` take `B = e^⊥`: the first term is at most `P_γ(U)` by the variation bound of §6.3. For the second, at every good `z` … `∫ I(v_U) dγ_{e^⊥} ≤ ∫_{∂*U} |⟨ν_U, e⟩| dγ^{n−1} ≤ P_γ(U)`", with *Needs:* §5.1, §5.3, §6.2 and the Tau Ceti density added; plan 6.5 prerequisites agree. The build guide now reads "every later layer, Layer 5 included, reaches G5 through §2.2, while Layer 1, §2.1, §2.4, §5.2, §6.1, §9.1 and §9.2 use neither". I recomputed the prerequisite closure of all 46 plan targets: free of G5 and G6 are exactly 1.1, 1.2, 1.3, 2.1, 2.4, 5.2, 6.1, 9.1, 9.2 and the plan's definition half of 8.3 (the README section §8.3 as a whole needs §2.3, so the sentence is right about sections); every target reaching G5 has 2.2 in its closure. |

Neither finding was marked not actionable. Adversarial pass on the changed text: the derivation of `2P` holds because `P_γ(U) < ∞` gives locally finite perimeter (§2.1), so §6.2 applies; `∫ Σ_t φ(t) dγ_{e^⊥}(z) = ∫_{e^⊥} Σ_t e^{−W}(z + te) dz = ∫_{∂*U} |⟨ν_U, e⟩| dγ^{n−1}` by the density factorization. Computed rows are in the table (§6.5). Pattern search: other "in particular"/"hence" consequences (§3.3, §4.3, §7.2, §8.1, §9.5) use only listed inputs; README *Needs:* lines and plan prerequisites agree section by section (script comparison over all sections, no mismatch, including external names). The rounding pattern recurs: R01.

## Verified sound

**Coverage.** Read the whole README (nine layers), the plan (46 targets: 10 definitions, 36 theorems, 134 tests) and the manifest (13 works, one key each). Principles: the weighted theory is for every positive `C¹` density on intrinsic finite-dimensional inner product spaces; no route-specific restriction, no re-planned roadmap, no upward or cyclic supply, no copied passage, no algorithm. No `Suggested.lean` exists at the design stage, so there is no Lean form, no padding probe and no binder audit to run. **Elaboration: not available (this lane does not elaborate; say so in the report).**

**Dependency gate** (command of the brief):

```text
candidate: GaussianIsoperimetryAndClusters is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 206 roadmaps, 1896 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Local graph: 46 ids, every `target:` edge resolves and points backwards.

**Source sample.** Read at the cited lines of the cached texts:

| Seeded target | Source lines read | Result |
|---|---|---|
| 1.1 | MilmanNeeman2022 line 182–187; CianchiFuscoMaggiPratelli2011 line 55–57; Ledoux1999 line 214–217 | `I = φ ∘ Φ⁻¹`, ODE (1.1), endpoint values `0`; other normalization as the Conventions say |
| 2.2 | MilmanNeeman2022 line 755–757; CianchiFuscoMaggiPratelli2011 line 174–208 | `P_μ = μ^{n−1}(∂*U)` for finite weighted perimeter; (2.3)–(2.5) as cited |
| 2.4 | CianchiFuscoMaggiPratelli2011 line 209–213; MilmanNeeman2022 line 939–947 | `L¹_loc` lower semicontinuity; compactness uses finite mass, as stated |
| 2.5 | MilmanNeeman2022 line 705–708, 758–761 | (3.1) weighted divergence, (3.3) Gauss–Green for `C¹_c` fields and locally finite perimeter |
| 2.7 | MilmanNeeman2022 line 481–483, 554–556 | product structure and orthogonal invariance |
| 3.1 | MilmanNeeman2022 line 57–70, 697–702 | cells, half-sum, `q = 2` remark; Borel cells there, Lebesgue-measurable here (wider, null-invariant) |
| 4.1 | MilmanNeeman2022 line 499–505 | model cells, `Σ^m_ij = ∂Ω^m_i ∩ ∂Ω^m_j`, `A^m_ij` |
| 4.6 | MilmanNeeman2022 line 669–695, 200–207 | Proposition 2.4 and (1.3)–(1.4); normal `(e_j − e_i)/√2`, `−½ vᵀ L_A x` |
| 5.3 | CianchiFuscoMaggiPratelli2011 line 220–250 | Proposition 3.1 with the three equality cases; Definition 3.2, Lemma 3.3 |
| 6.2 | CianchiFuscoMaggiPratelli2011 line 527–542 | Vol'pert (i)–(iii) for locally finite perimeter, coarea instance (4.1) |
| 6.4 | CianchiFuscoMaggiPratelli2011 line 781–828 | Lemma 4.6, (4.14), sufficient equality condition |
| 8.1 | Borell1975 line 85–99; Ledoux1993 line 238–256; Ledoux1999 line 220–247; Ehrhard1983 line 356–359 | inner measure in Borell, `(or only ≥)` form in both Ledoux texts, covariance ellipsoid (1.7) |
| 8.2 | Ledoux1999 line 207–219 | open neighbourhoods and `lim inf` in (1.3); (1.4) |
| 8.3 | Bobkov1997 pp.209–210 (PDF text, see above); Ledoux1999 line 296–313; CianchiFuscoMaggiPratelli2011 line 597–601, 656–664 | (10) for locally Lipschitz `f`; converse by distance cutoffs; (4.6) |
| 9.2 | Ehrhard1983 line 367–378, 408–439 | Théorème 3.1 (open or closed convex), Lemme 3.3 concavity of `g`, one-dimensional case |

**Adversarial table** (my own recomputation; six decimals, double precision).

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| 1.1 profile | `v = 1/2, 1 − Φ(1), 1/3, 0.3`; endpoints | `0.398942`, `0.241971`, `0.363600`, `Φ⁻¹(1/3) = −0.430727`; `I′(0.3) = 0.524401 = −Φ⁻¹(0.3)`; `I″(0.3) = −2.876104 = −1/I(0.3)`; `quantile` at `0` and `1` is `0` (pinned definition `sInf {x | t ≤ cdf μ x}`), so `φ(0) = 0.398942 ≠ 0` | sound; separate endpoint definition needed |
| 1.2 tails | `r = 0, 1, 2` | `0.5 = 0.5`; `0.158655 < 0.241971`, `≤ 0.303265`; `0.022750 ≤ 0.067668` | sound |
| 1.3 splitting | `q = 3` coordinate; density at `0 ∈ ℝ²` | `1 − Φ(√1.5) = 0.110336`, reciprocal factor `0.207108`; `(2π)^{−1} = 0.159155` | sound |
| 2.1 wrong model | `U = ℝ` under `γ` | native `perimeter γ` gives `E|t| = 0.797885`, weighted gives `0` | sound; pinned `TauCeti.perimeter` body has no weight term |
| 2.2 / 2.3 | `(−1, 1)`; unit disc | `2φ(1) = 0.483941`, `γ = 0.682689`, `I = 0.356343`; `e^{−1/2} = 0.606531`, `γ = 0.393469`, `I = 0.384633` | sound |
| 2.4 | gap closing; `(k, k+1)` under volume | `3φ(1) + φ(2) = 0.779903 ≥ 0.295962`; pairwise `L¹` distance `2` | sound; finite mass needed |
| 2.5 | `{x_1 < s}`, `w = e_1`; `U = E` | `d/dt Φ(s + t) = φ(s) = ⟨e_1, ν⟩φ(s)`; `−∫x_1 dγ = 0` and empty boundary; bounded-field form: cutoff error `≤ ‖X‖_∞ μ(E)/R → 0` | sign sound |
| 2.7 | half-line cylinder; `F = {0}`; translation | `φ(s) = φ(s)`; `0 = 0`; `0.398942 ≠ 0.241971` | sound, no translation invariance |
| 3.1 / 3.2 | intervals cut at `0, 1`; merge | half-sum `φ(0) + φ(1) = 0.640913`; merged `0.640913 − 0.398942 = 0.241971 = φ(1)` | sound |
| 3.4 | density `c(1 + y²)exp(−x²(1 + y²)⁴)` | `∫dx = c√π/(1 + y²)`, so `c = π^{−3/2}`; line `x = 0` has length `∫c(1 + y²)dy = ∞`, `x = t ≠ 0` finite | annuli needed, sound |
| 4.1 | `q = 2`; tripod at `0`; conormals | `A_12(tu) = φ(t)·δ_0({0})`; `∫_0^∞ e^{−s²/2}/(2π) ds = 0.199471`, total `0.598413`; `(−1,−1,2) + (2,−1,−1) + (−1,2,−1) = 0` | sound |
| 4.3 | `q = 2`, `t = 0.7`; tripod | `∂Ψ_1 = Σ_j (w_j − w_i)A_ij/√2 = −(L_A w)_i/√2`; `−φ(0.7) = −0.312254`; `3A/√2 = 0.423142` | sign sound |
| 4.4 wrong model | `v = (Φ(1), 1 − Φ(1))` | `Ψ⁻¹` gives `φ(1) = 0.241971`; centred point gives `φ(0.482734) = 0.355065` | sound |
| 4.6 | `q = 2`; tripod | `∇_v I_m = −½⟨−√2 L⁻¹v, Lx⟩ = ⟨v, x⟩/√2`; `−1/(3A) = −1.671086`; `tr L_A = 6A = 1.196827 = 2 × 0.598413` | sound |
| 4.7 | three intervals in `ℝ`, `q = 3` | `2φ(Φ⁻¹(1/3)) = 0.727200 > 0.598413` | dimension restriction needed |
| 5.2 | `(0, 1)`; `(−1, 0)` shifted right | `γ¹ = 0.341345`, `0.640913 → 0.366963 = I(0.341345)`; `(−0.9, 0.063724)`: `0.664218`; `(−0.5, 0.385003)`: `0.722510` | sign hypothesis discriminates |
| 5.3 | half-line `1/3`; `(−1, 1)`; `∅` | `0.363600 = I(1/3)`; `0.483941 > 0.356343`; `0 = I(0)` | sound, disjunct needed |
| 6.2 | slope `m = 1` | `√2 · (1/√2) = 1 = ` base length; reciprocal Jacobian `2` | sound |
| 6.3 / 6.4 | `{x_2 < 1 + x_1}`; escaping-tail bound | `φ(1/√2)/√2 = 0.219696 ≤ 0.310697`; `√2∫φ(1 + z)φ(z)dz = 0.310697`; `2φ(0) + γ¹((−¼, ¼)) = 0.995297` | sound |
| 6.5 (changed) | tilted half-plane; unit disc; flat half-plane; vertical half-plane; `∅` | tilted: `0.219696 + 0.219696 = 0.439391 ≤ 0.621393`; disc: first term `2e^{−1/2}/π = 0.386129` (quadrature `0.386129`), `∫I(v_U)dγ = 0.252249 ≤ 0.386129 ≤ 0.606531`, sum `0.638378 ≤ 1.213061`; flat: `0 + φ(a) = P`; vertical: `φ(0) + 0 = P`; `∅`: `0 + 0` | sound |
| 6.6 | unit disc | `∫√(I(v_U)² + v_U′²)φ = 0.517483`, between `0.384633` and `0.606531` | sound |
| 7.3 / 7.4 | disc, slab, `∅`, `(E, ∅)` | `0.606531 > 0.384633`; `0.483941 > 0.356343`; `0 = I(0)`; vertex value `0`, not simplicial | sound |
| 8.1 | half-space; disc, `r = 1`; `S = 0` | `Φ(a + r)` both sides; `1 − e^{−2} = 0.864665 ≥ Φ(0.729712) = 0.767217`; `Φ(a) ≤ δ_m(A)` forces `δ_m(A) = 1` | sound; argument digit in R01 |
| 8.1 route | `G = Φ⁻¹ ∘ f` | `f(s) − f(s′) ≥ ∫ I(f)`, so `G′ ≥ 1` a.e. where `0 < f < 1`; increment of monotone `G` dominates `∫G′`; `f(s′) ≥ γ(A) ≥ Φ(a)` | sound; no absolute continuity assumed |
| 8.2 | half-space; disc; `ℚ²` | `φ(a)`; `e^{−1/2} = 0.606531 ≥ 0.384633`; `1/r → ∞` | sound |
| 8.3 | `Φ(x)`, `Φ(2x)`, `min(x², 1)`, constants `0, 1` | `∫√2 φ² = 0.398942 = I(1/2)`; `Φ(2x)`: `0.398942`; `∫f = 0.516059`, `I = 0.398619 ≤ 0.647406`; `A_0 = ∅`, `A_1 = E × ℝ` | sound |
| 8.3 converse | closed `A`, `f_r = max(0, 1 − d_A/r)` | `f_r → χ_A` everywhere, `I(f_r)` supported in `{0 < d_A < r} ↓ ∅`, `∫‖∇f_r‖ ≤ γ({0 < d_A < r})/r` | sound for closed `A` |
| 8.4 / 8.5 | `x_1`; `|x_1|`; two independent normals | `Φ⁻¹(3/4) = 0.674490`, mean `0.797885`; median of max `0.544952`, tail `0.010899 ≤ 0.022750` | sound |
| 9.1 | closed unit ball in `ℝ²`, `ℝ³`; complement law | `Φ⁻¹(0.393469…) = −0.270288`; `γ₃ = 0.198748`, threshold `−0.846102`; `{Φ(−s) > v} = {Φ(s) < 1 − v}` | sound; R01 digit |
| 9.2 | Hessian of `g` at four points; degenerate section | `(−1, 1)`: `−0.459912`, `−0.459912`, det `0.163502`; `(0, 2)`: det `0.015519`; `(−3, −0.5)`: det `0.000142`; `(0.5, 0.6)`: `−36.796666`, `−37.671227`, det `15.648788`; a one-point section has `v = 0` and symmetral `∅` | concave; values in R01 |
| 9.5 | `[−1, 1]`, `[−3, 3]`, `λ = ½`; `λ = 0.9` Borell form; `λ = 0`; `γ(A) = 1` | `1.690143 ≥ 1.628704`; `0.954500 ≥ 0.948312 ≥ 0.825134`; `0.561033 + 0.993113 = 1.554146`; `λ = 0` gives `B`; convex of full measure is `E` | sound; R01 digits |

**Pinned libraries.** `lake-manifest.json` pins Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`, equal to the plan baseline and to the checked-out package heads. All 65 library names backticked in the README resolve at the cited file and line (script over the README, then read): Mathlib `Probability/Distributions/Gaussian/Multivariate.lean:65,126,144,166` (definition read: the law is the image of `stdGaussian` under `x ↦ μ + toEuclideanCLM (CFC.sqrt S) x`, Dirac when `S` is not positive semidefinite), `Gaussian/Real.lean:47,220,358`, `Probability/CDF.lean:56`, `Geometry/Euclidean/Volume/Measure.lean:68,212,226,287`, `Analysis/InnerProductSpace/NormDet.lean:69`, `Analysis/LocallyConvex/Separation.lean:135`, `Topology/MetricSpace/Thickening.lean:53,181,226`, `Analysis/Calculus/InverseFunctionTheorem/FDeriv.lean:205`, `Analysis/Calculus/Rademacher.lean:386`, `Analysis/Calculus/FDeriv/Basic.lean:949`, `Analysis/Calculus/Monotone.lean:213`, `MeasureTheory/Integral/IntervalIntegral/DerivIntegrable.lean:101`, `Analysis/Convex/Measure.lean:89`, `MeasureTheory/Covering/Besicovitch.lean:1104`; Tau Ceti `Probability/Distributions/Gaussian/Density.lean:178` (all finite-dimensional inner product spaces, Borel), `Projection.lean:47,94`, `Cdf.lean:148,205,212,219`, `Analysis/SpecialFunctions/Erf.lean:115`, `Probability/Quantile.lean:164,209,216,340,359` (hypotheses read: continuity and `0 < t < 1`; strict monotonicity on the preimage of `(0, 1)`), `Analysis/BoundedVariation/TotalVariation.lean:100,375`, `Perimeter.lean:64,83,109` (complement law under `[μ.IsAddHaarMeasure]`), `VariationMeasure.lean:136,150`, `PolarDecomposition.lean:260,284,303`, `ReducedBoundary.lean:95,106,271,404`, `MeasureTheory/Covering/EssentialBoundary.lean:132,143,345`, `Compactness.lean:223`, `Poincare.lean:251`, `Coarea.lean:335,392,546,558`, `Real.lean:185`, `Convolution.lean:110`, `Slicing.lean:190` (finite volume, integrated inequality only), `MeasureTheory/Function/Coarea/Basic.lean:445`, `Geometry/Euclidean/Volume/Sphere.lean:367`. Duplication by object: no Gaussian perimeter, weighted divergence, Gaussian isoperimetric profile, Ehrhard symmetral or median-concentration statement exists in either pinned library (the files matching "isoperimetric" are Euclidean relative-isoperimetric and BV files).

**Cross-roadmap citations**, resolved on main (7342e8f): GeometricMeasureTheory G2 (`TauCetiRoadmap/GeometricMeasureTheory/README.md:148`: weighted area and coarea, tangential area formula, graph and sphere measure), G4 (line 210: convolution estimates, BV Poincaré), G5 (line 248: De Giorgi, blow-up, essential versus reduced boundary, converse criterion), G6 (line 275: Lipschitz and `C¹` domain comparison); Isoperimetry I4 (`TauCetiRoadmap/Isoperimetry/README.md:223`, slicing at 237–248; R02), I1 (104), I2 (144); RandomMatrices 2.2 (`TauCetiRoadmap/RandomMatrices/README.md:503`: log-Sobolev, Herbst about the mean); BanachSpaceTheory B7 (`TauCetiRoadmap/BanachSpaceTheory/README.md:1264`). All suppliers are on main; none is on the never-cite list. `scratch/citations.md` lists nothing unresolved, and `scratch/overlaps.md` lists no shared edit, no dropped id and no revision-only id.

**Ownership.** `roadmaps grep` over main and the 440 open heads for Ehrhard, Gaussian isoperimetr, Bobkov, Sudakov, Gaussian perimeter, multi-bubble / double-bubble, isoperimetric profile, Minkowski content: no match. "Borell" matches only an unrelated passage of NoncompactQuantumSymmetry; "weighted perimeter" only a hexagon weight in TensorProductCombinatorics. The board-package index lists AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory, none geometric. This roadmap is the owner of weighted perimeter for `C¹` densities, Gaussian clusters, Gaussian symmetrisation and the Gaussian isoperimetric theorem.

Overlap check: read Isoperimetry, GeometricMeasureTheory, OptimalTransport (main), and MathematicalStatisticsFoundations, Surfaces, SobolevMapsBetweenManifolds, ProbabilisticAndMetricNumberTheory, BanachSpaceTheory (open) by object search and scope; nothing shared — Euclidean perimeter, De Giorgi theory, slicing and Steiner symmetrisation stay with GeometricMeasureTheory and Isoperimetry and are imported by section.

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, nine layers each ending with Examples and Dependencies, Downstream consumers, References. Layer titles are mathematical; the order (line, weighted perimeter, clusters, model, one-dimensional case, symmetrisation, theorem, integrated forms, closed symmetrals) is forced by the *Needs:* lines except Layer 4, which the guide correctly says is independent of Layers 5–7. Checks per definition: 1.1 three, 2.1 three, 3.1 three, 3.4 three, 4.1 five, 4.2 four, 4.4 four, 6.1 four, 8.3 four, 9.1 three. No LaTeX delimiters, target tables, pull-request numbers, machine paths or job ids in the README. No backticked name is presented as this roadmap's own declaration.

**Headline theorems** (for the package stage): weighted representation, Gauss–Green and coarea (§§2.2–2.6); existence of minimizing clusters (§3.5); the measure-map diffeomorphism (§4.3); `∇²I_m = −L_A⁻¹` (§4.6); Ehrhard symmetrisation decreases Gaussian perimeter (§6.6); the Gaussian isoperimetric theorem with equality (§7.3) and its two-cell form (§7.4); Borell–Sudakov–Tsirelson for every Euclidean Gaussian (§8.1); Minkowski content (§8.2); Bobkov (§8.3); median concentration (§§8.4–8.5); Ehrhard for convex sets (§9.5). §§8.1, 8.4, 8.5 and 9.5 use only pinned carriers and are statable as they stand; the others need the few real-bodied definitions (profile, weighted variation, cluster).

## Not verifiable

- Maggi2012 Proposition 12.15, Theorem 12.26, Theorem 15.9, Sections 13.1 and 18.1–18.3, Exercise 29.7: the cached extract holds front matter, contents and the Part IV synopsis only. The statements citing them are also supported by MilmanNeeman2022 and CianchiFuscoMaggiPratelli2011 lines read above, or by the roadmap's own routes.
- SudakovTsirelson1974, Ledoux1996, CarlenKerce2001, AmbrosioFuscoPallara2000, Bogachev1998: settled as uncertified; cited by locator, not reopened.
- Ehrhard1983 Lemme 3.3: the OCR of the displayed formulas is damaged; the statement (concavity of `g`) and the second-derivative shapes are legible and agree with my closed forms, the remaining proof lines are not certified.
- Ledoux1999: the extraction prints the label "(1.6)" twice (line 224 and line 226); line 229 shows the first is (1.5), as the README cites it. The scan was not re-rendered.
- Lean elaboration, the one-tactic probe and the `#check` binder audit: no `Suggested.lean` at the design stage, and this lane does not elaborate.

## Source issues

- **Misprint** in MilmanNeeman2022 at equation (1.1), printed page 5 (arXiv v3): the source says the reciprocal-profile equation holds on the closed unit interval; it should be on the open interval, where the profile is nonzero; affects nothing.
- **Gap** in MilmanNeeman2022 at Lemma 2.1, printed page 11 (arXiv v3): the source says a displaced point lies in some open translated model cell; it should take a maximal coordinate, which also covers tied maxima on cell boundaries; affects the proof.
- **Misprint** in MilmanNeeman2022 at proof of Lemma 2.3, printed page 14 (arXiv v3): the source says the translated cell is cut out by a minimum over the other coordinates, ending with threshold minus a constant; it should be a maximum, with threshold plus the constant; affects the proof.
- **Misprint** in MilmanNeeman2022 at proof of Lemma 3.4, printed page 21 (arXiv v3): the source says the quadratic form is the sum over ordered distinct pairs; it should be the sum over unordered pairs, half of that; affects nothing.
- **Misprint** in CianchiFuscoMaggiPratelli2011 at equation (2.5), printed page 5 (cvgmt preprint): the source says its surface-normalized perimeter equals the supremum taken against the probability measure; it should carry the factor √(2π); affects nothing.
- **Misprint** in CianchiFuscoMaggiPratelli2011 at Lemma 4.4, equation (4.8), printed page 12 (cvgmt preprint): the source says the derivative of the probability-normalized section mass uses unnormalized point weights; it should include the factor (2π)^(−1/2); affects the proof.
- **Misprint** in CianchiFuscoMaggiPratelli2011 at Theorem 4.1, printed page 10 (cvgmt preprint): the source says equality holds exactly for sets equivalent to a half-space; it should also allow Gaussian measure zero or one, as its Proposition 3.1 does; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "cd437fb69f4e495ecaf1b38a2dec266184cc85db", "job": "REV-DESIGN-GaussianIsoperimetryAndClusters~5", "model": "fable", "worker": "chris-x52"} -->
