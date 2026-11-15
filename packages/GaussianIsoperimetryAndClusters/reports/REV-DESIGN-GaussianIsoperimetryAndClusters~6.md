<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13761#issuecomment-6895099143 -->
Review (claude) of 4901f5c

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §9.1 describes Ehrhard's convention as sublevel; it is superlevel

   **Location.** `packages/GaussianIsoperimetryAndClusters/design/README.md` line 646: "(Ehrhard1983 Définition 1.1, line 117–129, in the mirrored sublevel convention)".

   **Claim.** The parenthesis qualifies the source, as the parallel one in §6.1 does ("CianchiFuscoMaggiPratelli2011 line 543–552, in the mirrored superlevel convention"): Ehrhard's definition is the sublevel mirror of this roadmap's.

   **Witness.** Ehrhard1983 line 64–66 defines `H(u, λ)` as the open half-space `{⟨x, u⟩ > λ}`, a superlevel set, and Définition 1.1 (line 125–127) puts `H(u, a)` on each section. The roadmap's rule `Φ(⟨y, u⟩) ≤ v` is the sublevel one. README line 674 says so itself: "superlevel half-lines as in Ehrhard's paper".

   **Exact repair.** In line 646 replace "in the mirrored sublevel convention" by "in the mirrored superlevel convention: Ehrhard's half-space is `H(u, a) = {⟨x, u⟩ > a}` (line 64–66), so his `S(T, u)` is `S̄_{F,−u}` here". Tested on the instance: for `C = {⟨x, u⟩ ≤ a}`, Ehrhard's `S(T, u)` gives `{⟨x, u⟩ ≥ −a}`, which is `S̄_{F,−u}(C)` by the third Check of §9.1, both of measure `Φ(a)` (`0.841345` at `a = 1`). Also spell "Définition 1.1" the same way in §6.1 (line 455 has "Definition 1.1"). No statement, Check or plan entry changes.

One finding, P3, no P1 or P2. Both round-5 findings are repaired. It carries an exact repair in the README, so the verdict asks for changes: a fix round applies R01, and nothing else needs repair. The reviewed README, plan and manifest were left unchanged; no source was fetched and no manifest entry was added. There are no maintainer notes and no declared supplier gaps, so nothing here is conditional on a supplier.

## Repairs of the previous round

| Round-5 finding | Disposition | Repaired passage and my check |
|---|---|---|
| F01 (P3), nine Check values off in the last digits | **Repaired** | §6.1: "the section of `S_e(U)` over `z = 0` is `(−∞, 0.475233)`"; §8.1: "`a = Φ⁻¹(1 − e^{−1/2}) = −0.270288` … `Φ(0.729712) = 0.767217`"; §9.2: "`∂²_a g = ∂²_b g = −0.459912` … (determinants `0.015519`, `0.000142`, `15.648788`)"; §9.5: "`½(0.475233) + ½(2.782175) = 1.628704`", "`1.475233`". Recomputed in double precision (bisection on `erfc`, closed-form Hessian): `0.4752328`, `−0.2702880`, `0.7297120 → 0.7672169`, `−0.4599120`, `0.1635024`, `0.0155193`, `0.0001422`, `15.6487875`, `1.6287039`, `1.4752328`. A search of README and plan for the seven old values and for "Second difference" finds none. |
| F02 (P3), I4 contract stated for locally finite perimeter | **Repaired** | Contract: "For Lebesgue-measurable `V ⊆ E` with `0 < |V| < ∞` and `P(V) < ∞` … nothing is assumed about sets of infinite volume or only locally finite perimeter: §6.2 reaches those by cutting with balls." §6.2: "it is applied to the cut sets `U_R = U ∩ ball(0, R)` … For almost every `R`, `P(U_R) ≤ P(U; ball(0, R)) + m′(R) < ∞`". Checked against main, `TauCetiRoadmap/Isoperimetry/README.md:237–248` (standing set `0 < |E| < ∞`, `P(E) < ∞`), and against the pin: all five added Tau Ceti names exist with the hypotheses the README states (below). The plan's 6.2 prerequisites and the supplier note carry the same edges. |

Neither finding was marked not actionable. **Adversarial pass on the changed text.** The fix worker's extra step (reduced boundary in `E` cut by an open `B` equals the reduced boundary in `B`) is needed and is right: at the pin `TauCeti.reducedBoundary μ Ω s` is defined with averages against `variationMeasure μ Ω` over `closedBall x r` pulled back to `Ω` (`ReducedBoundary.lean:95`), and `reducedBoundary_congr_ae` (line 404) only compares two sets in one `Ω`. For small `r` the closed ball lies in `B`, the two variation measures agree there by `variationMeasure_eq_comap_inclusion`, and the densities agree by `ae_eq_polarDensity`, so the averages coincide. The null case is right: for `|U| = 0` the variation measure is `0`, every average is `0`, and no unit limit exists, so `∂*U = ∅`. Computed rows are in the table (§6.2). **Pattern search.** No other supplier contract is wider than its supplier (G2, G4, G5, G6 read on main, lines below); every other printed six-decimal value in the README was recomputed and agrees (table).

## Verified sound

**Coverage.** Whole README (nine layers, 733 lines), plan (46 targets: 10 definitions, 36 theorems, 135 tests; every `target:` prerequisite resolves and points backwards; `gaps` is empty; no definition has fewer than three tests), manifest (13 works, one key each; every work cited in the README has an entry). Principles: weighted theory for every positive `C¹` density on intrinsic finite-dimensional inner product spaces; no route-specific restriction, no re-planned roadmap, no upward or cyclic supply, no copied passage, no algorithm. No `Suggested.lean` exists at the design stage, so there is no Lean form, padding probe or binder audit. **Elaboration: not available (this lane does not elaborate; say so in the report).**

**Dependency gate** (command of the brief):

```text
candidate: GaussianIsoperimetryAndClusters is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2229 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

**Source sample** (the 15 seeded targets; no locator was flagged unverified by the author). Read at the cited lines of the cached texts:

| Target | Lines read | Result |
|---|---|---|
| 2.2 | MilmanNeeman2022 line 753–757; CianchiFuscoMaggiPratelli2011 line 174–208 | `P_μ = μ^{n−1}(∂*U)` for finite weighted perimeter; (2.3)–(2.5) as cited. Maggi2012 Theorem 15.9 not readable (below) |
| 2.3 | MilmanNeeman2022 line 30–33; CianchiFuscoMaggiPratelli2011 line 48–56, 182–184 | half-space perimeter in the other normalization; converse boundary criterion |
| 3.5 | MilmanNeeman2022 line 918–922, 939–956 | Theorem 4.1 (i) for `C^∞` weights; the roadmap's `C¹` statement is covered by its own route (§2.4), which uses no smoothness beyond `C¹` |
| 4.1 | MilmanNeeman2022 line 499–505 | cells, translated cluster, `Σ^m_ij = ∂Ω^m_i ∩ ∂Ω^m_j`, `A^m_ij` |
| 4.4 | MilmanNeeman2022 line 548–556 | Definition 2.2 with `I_m^{(0)}(1) = 0`; agreement with arbitrary simplicial clusters |
| 4.6 | MilmanNeeman2022 line 669–695, 200–207 | Proposition 2.4, (1.3)–(1.4); `n_ij = (e_j − e_i)/√2`, `−½ vᵀ L_A x`, `D(Ψ⁻¹) = −√2 L⁻¹` |
| 5.2 | CianchiFuscoMaggiPratelli2011 line 226–232 | Definition 3.2 (`a < a′ < b′ ≤ ∞`), Lemma 3.3 (`a + b ≥ 0`, strict) |
| 5.3 | CianchiFuscoMaggiPratelli2011 line 220–250 | Proposition 3.1 with the three equality cases |
| 6.5 | CianchiFuscoMaggiPratelli2011 line 624–632, 760–779 | Lemma 4.5, (4.10), for every Borel `B`; the `2P` consequence is the roadmap's own |
| 6.6 | CianchiFuscoMaggiPratelli2011 line 583–588, 833–846 | Theorem 4.3, (4.3), `n ≥ 2`, finite Gaussian perimeter, every Borel `B` |
| 7.2 | CianchiFuscoMaggiPratelli2011 line 913–966 | Steps III–IV: density-one set convex, hence open; complement likewise |
| 8.3 | Bobkov1997 pp.209–210 (pages 4–5 of the cached PDF; page markers line 72 and 98); Ledoux1999 line 296–313; CianchiFuscoMaggiPratelli2011 line 597–601 | Corollary 1 for locally Lipschitz `f`, (10); Corollary 2 and the cutoff `max(1 − dist/h, 0)` on p.210; (1.11) and its equivalence |
| 9.2 | Ehrhard1983 line 367–369, 377–380, 408–439 | Théorème 3.1 (open or closed convex), Lemme 3.3, one-dimensional case |
| 9.4 | Ehrhard1983 line 367–369, 350–355, 454–457 | Théorème 3.1; Corollaire 2.3 (`k − 1` two-dimensional symmetrisations) |
| 9.5 | Ehrhard1983 line 374–376, 458–469 | Théorème 3.2 for nonempty convex Borel sets; proof by the hull of two parallel slices |

Outside the sample I also read MilmanNeeman2022 line 47–102, 169–207, 481–543, 660–666, 697–708, 758–784; CianchiFuscoMaggiPratelli2011 line 505–556, 605–618, 781–828, 886–912; Ehrhard1983 line 62–66, 112–140, 329–359; Ledoux1993 line 236–262; Borell1975 line 83–99; Maggi2012 line 712–727.

**Adversarial table** (my own recomputation, double precision; sampled targets, headline theorems, the changed passages and the target of R01).

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| 1.1 profile | `v = 1/2, 1 − Φ(1), 1/3, 0.3`; endpoints | `0.3989423`, `0.2419707`, `0.3635998`, `Φ⁻¹(1/3) = −0.4307273`; `I′(0.3) = 0.5244005`; `I″(0.3) = −2.8761037 = −1/I(0.3)`; pinned `quantile` is `sInf {x | t ≤ cdf μ x}`, `0` at both endpoints for the normal law | sound |
| 2.2 | `(−1, 1)`; ball plus dense null set | `2φ(1) = 0.4839414`, `γ = 0.6826895`, `I = 0.3563430`; frontier `ℝ² ∖ ball`, perimeter still `0.6065307` | sound |
| 2.3 | `n = 1, 2` ball formula; half-space; `C = ∅, E` | `n = 1`: `(2π)^{−1/2} e^{−1/2} · 1 · 2 = 0.4839414`; `n = 2`: `e^{−1/2} = 0.6065307`, `γ = 0.3934693`, `I = 0.3846327`; `φ(0) = I(1/2)`; both sides `0` | sound |
| 2.5 sign | `{x_1 < s}`, `w = e_1` | `γ(U + te_1) = Φ(s + t)`, derivative `φ(s) = ⟨e_1, ν⟩ φ(s)`; `∫_U e^{−W(x + tw)} dx` differentiates to `∫_U div_γ w dγ` | sound |
| 3.2 negative control | half-annuli at radius `r = 4^{−k}` | boundary length `r(3π/2 + 1)` per piece; in the open ball `Dχ_{Ω_2}` has norm `2r` against `|Dχ_{Ω_2}| = (π + 4/3) r`, ratio `0.4469`; for `Ω_3` the vector is `0` | not a unit limit: sound |
| 3.5 | `q = 2`, `v = (1/2, 1/2)`; weight `0` on `ℝ` | minimizer value `0.3989423`; `(k, k + 1)`: measure `1`, perimeter `2`, pairwise `L¹` distance `2` | sound; finite mass needed |
| 4.1 | `q = 2`; `q = 3`, `x = 0`; conormals | `n_12 = −u`, `A_12(tu) = φ(t)`, cell measure `Φ(−t)`; `A = 1/(2√(2π)) = 0.1994711`, total `0.5984134`; `(−1,−1,2) + (2,−1,−1) + (−1,2,−1) = 0`; sector normals at `60°`, mean norm `0.8660` | sound |
| 4.3 | `q = 2`, `t = 0.7`; `q = 3` | `Σ_j (w_j − w_i) A_ij/√2 = −(L_A w)_i/√2`; `−φ(0.7) = −0.3122539`; `3A/√2 = 0.4231422`; mean-zero `y ∈ Ω^m_i` has `y_i > 0`, so `Ψ_i(x) ≤ 1 − Φ(√(q/(q−1)) x_i)` | sound |
| 4.4 | `v = (Φ(1), 1 − Φ(1))` | `Ψ⁻¹(v) = −u`, value `φ(1) = 0.2419707`; centred point `t = 0.4827344`, `φ(t) = 0.3550649` | wrong model excluded |
| 4.6 | `q = 2`; `q = 3` symmetric point | `−½⟨−√2 L⁻¹v, Lx⟩ = ⟨v, x⟩/√2`; along `u`: `I′(v_1)/√2`, `I″/2 = −1/(2A_12)`; `Σ_{i<j}(a_i − a_j)² = 3‖a‖²`, `−1/(3A) = −1.6710855`, `6A = 1.1968268 = 2 × 0.5984134` | sound |
| 4.7 | three intervals in `ℝ` | `2φ(Φ⁻¹(1/3)) = 0.7271995 > 0.5984134` | restriction `n ≥ q − 1` needed |
| 5.2 | `(0, 1)`; `(−1, 0)` shifted right | derivative `−φ(a′)(a′ + b′)`; `γ¹ = 0.3413447`, `0.6409130 → φ(0.4087958) = 0.3669625 = I(0.3413447)`; `(−0.9, 0.0637237)`: `0.6642184`; `(−0.5, 0.3850027)`: `0.7225097` | sign hypothesis discriminates |
| 5.3 | half-line `1/3`; `(−1, 1)`; `∅`; `(0,1) ∪ (1,2)` | `0.3635998 = I(1/3)`; `0.4839414 > 0.3563430`; `0 = I(0)`; `φ(0) + φ(2) = 0.4529332` | sound; disjunct needed |
| 6.2 (changed) | half-plane cut by `ball(0, R)`; `U = ∅`; a line | volume `πR²/2`, perimeter `πR + 2R`; section `(−√(R² − s²), 0)`, only `t = 0` inside; zero variation measure gives averages `0`, no unit limit | sound |
| 6.3 | tilted half-plane; escaping tails | `φ(1/√2)/√2 = 0.2196956 ≤ 0.3106966` (quadrature `0.2196956`); `2φ(0) + γ¹((−¼, ¼)) = 0.9952972`; tail graph `t = Q(1 − z)` gives `g_U = −φ · (−1/φ) = 1 = v′` | sound |
| 6.5 | tilted half-plane; unit disc; `{x_2 < a}` | `0.2196956 + 0.2196956 = 0.4393913 ≤ 0.6213932`; disc: `2e^{−1/2}/π = 0.3861294`, `∫ I(v_U) dγ = 0.2522490`, sum `0.6383784 ≤ 1.2130613`; `0 + φ(a)` | sound |
| 6.6 | unit disc | `∫ √(I(v_U)² + v_U′²) φ dz = 0.5174833` (substitution `z = sin θ`), between `0.3846327` and `0.6065307`; null set of bad points handled by §6.5 with `∫_N I(v_U) dγ = 0` and §6.3 | sound |
| 7.2 | half-space; `{x_1 < 0} ∪ ℚ²` | `H^{(1)} = H`; `H^{(1)} = {x_1 < 0}`; a boundary point of a convex set with interior has density `≤ 1/2`, so it is not of density one | sound |
| 7.3 / 7.4 | disc, slab, `∅`, `(E, ∅)`; `n = 1` | `0.6065307 > 0.3846327`; `0.4839414 > 0.3563430`; `0 = I(0)`; vertex value `0`; `n = 1` half-lines are `{±x < s}` | sound |
| 8.1 | half-space; disc `r = 1`; `S = 0`; singular `S` | both `Φ(a + r)`; `1 − e^{−2} = 0.8646647 ≥ Φ(0.7297120) = 0.7672169`; `Φ(a) ≤ δ_m(A)` forces `δ_m(A) = 1`; `T⁻¹(A + rK(ball)) ⊇ T⁻¹A + r·ball`; coarea step `f(s) − f(s′) ≥ ∫ γ^{n−1}({d_A = τ}) dτ ≥ ∫ I(f)` | sound |
| 8.3 | `Φ(x)`, `Φ(2x)`, `min(x², 1)`, constants; `f(x) ∈ {0, 1}` | `∫ √2 φ² = 0.3989423`; `∫ √5 φ(2x) φ(x) = 0.3989423`; `∫ f = 0.5160586`, `I = 0.3986190 ≤ 0.6474055`; frontier of `A_f` over `{f = 0}` and `{f = 1}` is empty (points escape to `y → −∞`, or the whole fibre lies in `A_f`) | sound |
| 8.3 converse | closed `A`, `f_r = max(0, 1 − d_A/r)` | `∫ ‖∇f_r‖ ≤ γ({0 < d_A < r})/r`; `√(a² + b²) ≤ a + b`; `∫ I(f_r) → 0` | sound |
| 8.4 / 8.5 | `x_1`; `|x_1|`; two independent normals; `L = 0` | `Φ⁻¹(3/4) = 0.6744898`, mean `0.7978846`; median of max `0.5449521`, tail `0.0108994 ≤ 0.0227501`; row norm of `√S` is `√(S_ii)` | sound |
| 9.1 (R01) | closed ball in `ℝ²`, `ℝ³`; complement law; composition | `Φ⁻¹(0.3934693) = −0.2702880`; `γ₃ = 0.1987480`, threshold `−0.8461016`; `{Φ(−s) > v} = {Φ(s) < 1 − v}`; second-step section measure `∫ γ_{F_1}(C_{x″ + g_2}) dγ(g_2) = γ_F(C_{x″})` | sound; locator wording R01 |
| 9.2 | Hessian of `g` at four points; one-point section; limits | `(−1,1)`: `−0.4599120`, `−0.4599120`, `g_ab = −0.2191269`, det `0.1635024`; `(0,2)`: det `0.0155193`; `(−3,−0.5)`: det `0.0001422`; `(0.5,0.6)`: `−36.7966664`, `−37.6712266`, det `15.6487875`; `v = 0` gives the empty section, and `{v > 0}` is convex; `g(a, ∞) = −a` | concave; sound |
| 9.3 cone step | `u_2 = (u_1 − u_0)/√2`, `w = (u_0 + u_1)/√2` | cone invariance gives `D_{s + ρ} ⊇ D_s + [−ρ, ρ]`; §8.1 on the line gives `G(s + ρ) ≥ G(s) + ρ`, which is invariance of `{t ≥ −G(s)}` under `u_0 = (w − u_2)/√2` | sound; uses §8.1 only for `n = 1` |
| 9.4 | `k = 3` in `ℝ³`; two discs | `F_i = span(u, w_i)`, `(F_1 + F_2) ∩ F_3 = ℝu`; `{x_3 ≤ −0.8461016}` both ways; union of two discs has a half-plane symmetral | sound |
| 9.5 | `[−1,1]`, `[−3,3]`, `λ = ½`; `λ = 0, 1`; `γ(A) ∈ {0, 1}`; `λ = 0.9` | `1.6901434 ≥ ½(0.4752328) + ½(2.7821750) = 1.6287039`; `0.9544997 ≥ 0.9483121 ≥ 0.8251342`; `λ = 0` gives `γ(B) ≥ Φ(b)`; `γ(A) = 0` vacuous, `γ(A) = 1` forces `A = E`; `0.5610335 + 0.9931126 = 1.5541461`, tail `1.524 · 10^{−23}`, limit `1.4752328` | sound |

**Pinned libraries.** `lake-manifest.json` pins Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`, equal to the plan baseline. Opened this round: Tau Ceti `Analysis/BoundedVariation/CutByBall.lean:228` (`ae_perimeter_inter_ball_le`: null-measurable set, any centre, almost every radius, `deriv` of the real measure; no finiteness hypothesis), `VariationMeasure.lean:230`, `PolarDecomposition.lean:319`, `ReducedBoundary.lean:95, 106, 404, 418`, `Perimeter.lean:64, 83, 109`, `MeasureTheory/Covering/EssentialBoundary.lean:132, 143`, `Probability/Quantile.lean:164, 209, 216, 340, 359`, `Geometry/Euclidean/Volume/Sphere.lean:367`, `Analysis/BoundedVariation/Slicing.lean` (`lintegral_perimeter_lineSection_le`), `Approximation.lean` (`ContDiffBump.totalVariationOn_normed_convolution_le`); Mathlib `Probability/Distributions/Gaussian/Multivariate.lean:166` (image of `stdGaussian` under `x ↦ μ + toEuclideanCLM (CFC.sqrt S) x`; Dirac for `S` not positive semidefinite, line 170), `MeasureTheory/Covering/Besicovitch.lean:1104`, `Analysis/Convex/Measure.lean:89`, `MeasureTheory/Integral/IntervalIntegral/DerivIntegrable.lean:101`, `Analysis/LocallyConvex/Separation.lean:135`. All as the README describes them. For the remaining names I rely on round 5's file-and-line list at the same pins. Duplication by object: no weighted divergence, Gaussian perimeter, Gaussian isoperimetric profile, Ehrhard symmetral or median concentration exists at either pin.

**Cross-roadmap citations**, resolved on main (1a19c9f): GeometricMeasureTheory G2 (`TauCetiRoadmap/GeometricMeasureTheory/README.md:148`; weighted area formula 160–166 with "Derive the tangential area formula for maps on countably rectifiable sets", weighted coarea 170–175, graph and sphere measure 177–181), G4 (line 210, "convolution estimates"), G5 (line 248; De Giorgi 255–261, essential versus reduced boundary and the converse criterion 263–269), G6 (line 275; normals and surface area on Lipschitz and `C¹` domains 284–289); Isoperimetry I4 (`TauCetiRoadmap/Isoperimetry/README.md:223`, slicing 237–248), I1 (104), I2 (144); RandomMatrices 2.2 (`TauCetiRoadmap/RandomMatrices/README.md:503`, mean-centred Herbst bound); BanachSpaceTheory B7 (`TauCetiRoadmap/BanachSpaceTheory/README.md:1264`, sphere concentration 1324–1330). All suppliers are on main; none is on the never-cite list. `scratch/citations.md` and `scratch/overlaps.md` list nothing unresolved, no shared edit, no dropped id, no revision-only id and no second copy.

**Ownership and duplication.** `roadmaps grep` over main and the open heads (index of 2026-11-15) for Ehrhard, Gaussian isoperimetr, Bobkov, Sudakov, Gaussian perimeter, isoperimetric profile, multi-bubble / double-bubble, Minkowski content: no match. "weighted perimeter" matches only a hexagon weight in TensorProductCombinatorics; "Borell" only NoncompactQuantumSymmetry (unrelated); "median" matches the sphere concentration of BanachSpaceTheory (main and its open revision §7.3: spherical measure, constants `1/(1024π²)`, not Gaussian) and statistics roadmaps (sample medians). MathematicalStatisticsAsymptotic 7.5 owns Anderson's lemma through Prékopa–Leindler; this roadmap states neither. The board-package index lists AnalyticNumberTheory and LawrenceVenkateshMethod only. This roadmap is the owner of weighted perimeter for `C¹` densities, Gaussian clusters, Gaussian symmetrisation and the Gaussian isoperimetric theorem.

Overlap check: read Isoperimetry, GeometricMeasureTheory, GeometricCurrents (main) and MathematicalStatisticsAsymptotic, MathematicalStatisticsNonparametric, MathematicalStatisticsFoundations, MathematicalStatisticsSemiparametric, MathematicalBilliards (open); nothing shared.

**Shape.** Summary, Scope and ownership, Conventions (with four Checks), Exact supplier contracts, How to read the build, nine layers each ending with Examples and Dependencies, Downstream consumers, References. Checks per definition: 1.1 three, 2.1 three, 3.1 three, 3.2 four, 3.4 three, 4.1 five, 4.2 four, 4.4 four, 6.1 four, 8.3 four, 9.1 three. Every theorem section has its hypotheses in the sentence, a locator and a *Needs:* line; README *Needs:* and plan prerequisites agree for the changed §6.2. No LaTeX delimiters, target tables, pull-request numbers, dates, machine paths or job ids in the README (pattern search, two false hits on "sublevel half-" and "Lectures"). No backticked name is presented as this roadmap's own declaration. The layer order (line, weighted perimeter, clusters, model, one-dimensional case, symmetrisation, theorem, integrated forms, closed symmetrals) is the roadmap's own; see the arrangement check.

**Headline theorems** (for the package stage): weighted representation, Gauss–Green and coarea (§§2.2, 2.5, 2.6); existence of minimizing clusters (§3.5); the measure-map diffeomorphism (§4.3); `∇²I_m = −L_A⁻¹` (§4.6); Ehrhard symmetrisation decreases Gaussian perimeter (§6.6); the Gaussian isoperimetric theorem with equality (§7.3) and its two-cell form (§7.4); Borell–Sudakov–Tsirelson for every Euclidean Gaussian (§8.1); Minkowski content (§8.2); Bobkov (§8.3); median concentration (§§8.4–8.5); Ehrhard for convex sets (§9.5). §§8.1, 8.2, 8.4, 8.5 and 9.5 use only pinned carriers; the others need a few real-bodied definitions (profile, weighted variation, cluster, symmetral).

**Copyright and arrangement.** Wording: beside the 15 sampled locators I set eight further passages against their sources: the §3.5 route (MilmanNeeman2022 line 939–956), the §4.3 route (line 513–543), the §4.6 route (line 672–695), the §6.1 definition (CianchiFuscoMaggiPratelli2011 line 543–552), the §7.2 route (line 913–962), the §8.3 converse (Ledoux1999 line 305–313), the §9.1 definition (Ehrhard1983 line 118–127) and the §9.5 route (Ehrhard1983 line 458–469). None shares a run of words beyond standard names and formulas; the routes are condensed and in three places differ from the source (injectivity and surjectivity in §4.3, mollification in §6.5, BV Poincaré in §3.3). Arrangement: MilmanNeeman2022 has the largest share, 26 of 82 locators. Its contents are 1 Introduction, 2 Model simplicial clusters, 3 Definitions and notation, 4 Minimizing clusters (existence, regularity), 5–10 regularity and second variation, 11. The roadmap puts weighted perimeter and clusters (source §§3, 4.1) before the model clusters (source §2), drops §§4.2–10, and interleaves five layers from other sources: no one-to-one run. Layers 5–7 follow the order one-dimensional case, symmetrisation, theorem, which CianchiFuscoMaggiPratelli2011 §§3, 4.1, 4.2 share; that order is forced (§6.5 and §6.6 need §5.1 and §5.3; §7.1 needs §6.6), and the scopes differ (§5.1, §6.1 for general `F, u`, §6.2 and §7.4 are not in those sections). Reuse: no table, figure, exercise list or data is taken over.

Source independence: 23 passages compared with 5 sources, none shared; largest share MilmanNeeman2022, 26 of 82 locators; contents compared with MilmanNeeman2022: independent.

## Not verifiable

- Maggi2012 Proposition 12.15, Theorem 12.26, Theorem 15.9, Sections 13.1 and 18.1–18.3, Exercise 29.7: the cached extract holds front matter, contents and the Part IV synopsis only. The statements citing them are also supported by MilmanNeeman2022 and CianchiFuscoMaggiPratelli2011 lines read above, or by the roadmap's own routes.
- SudakovTsirelson1974, Ledoux1996, CarlenKerce2001, AmbrosioFuscoPallara2000, Bogachev1998: settled as uncertified; cited by locator, not reopened.
- Ehrhard1983 Lemme 3.3 (line 411–438): the OCR of the displayed formulas is damaged. The statement (concavity of `g`) is legible and agrees with my closed-form Hessian at four points; the proof lines are not certified.
- Bobkov1997: the OCR text is unusable; pages 4–5 were read from the text layer of the cached PDF, whose symbols are partly garbled. The words "COROLLARY 1 … for any locally Lipschitz function", the running heads 209 and 210, "COROLLARY 2" and the distance cutoff are legible; the displayed inequality (10) itself is not.
- Lean elaboration, the one-tactic probe and the `#check` binder audit: no `Suggested.lean` at the design stage, and this lane does not elaborate.
- Ownership against open pull requests was checked through the `roadmaps` tool at the index of 2026-11-15; board packages on other pull requests' branches were checked by the index list only.

## Source issues

- **Misprint** in MilmanNeeman2022 at equation (1.1), printed page 5 (arXiv v3): the source says the reciprocal-profile equation holds on the closed unit interval; it should be on the open interval, where the profile is nonzero; affects nothing.
- **Gap** in MilmanNeeman2022 at Lemma 2.1, printed page 11 (arXiv v3): the source says a displaced point lies in some open translated model cell; it should take a maximal coordinate, which also covers tied maxima on cell boundaries; affects the proof.
- **Misprint** in CianchiFuscoMaggiPratelli2011 at equation (2.5), printed page 5 (cvgmt preprint): the source says its surface-normalized perimeter equals the supremum taken against the probability measure; it should carry the factor √(2π); affects nothing.
- **Misprint** in CianchiFuscoMaggiPratelli2011 at Theorem 4.1, printed page 10 (cvgmt preprint): the source says equality holds exactly for sets equivalent to a half-space; it should also allow Gaussian measure zero or one, as its Proposition 3.1 does; affects a stated result.
- **Misprint** in Ehrhard1983 at the proof of Théorème 3.1, printed page 292: the source says the reduction to two-dimensional symmetrisations is by Corollaire 2.2; it should be Corollaire 2.3, as the end of the proof cites it; affects nothing.

## For the human reviewers

- **Scope.** The roadmap proves Ehrhard's inequality for convex sets only and lists the Borel-set case (Borell 2003) as outside (`design/README.md` line 13). Whether a general library should carry the Borel case is a scope decision.
- **Scope.** The Gaussian multi-bubble theorem for `q ≥ 3` (MilmanNeeman2022 Theorems 1.1–1.2) is stated as motivation, not as a target; its regularity inputs have no roadmap on main or open that I found.
- **Licence.** Bobkov1997 was read from an author-page PDF of the published article and Maggi2012 from an author's extract on an institutional server; both are recorded as certified in the manifest with those classes.
- **Not tested.** Maggi2012 is cited at seven places by chapter locators whose text is not in the extract; the wording check could not be run against those chapters.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4901f5cc118b51fbc1dfd644c58252a6c2b8be28", "job": "REV-DESIGN-GaussianIsoperimetryAndClusters~6", "model": "fable", "worker": "chris-x83"} -->
