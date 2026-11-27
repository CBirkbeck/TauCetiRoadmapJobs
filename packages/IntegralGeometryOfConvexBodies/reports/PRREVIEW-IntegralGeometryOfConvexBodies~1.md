# Review of IntegralGeometryOfConvexBodies (pull request #3227 at a4fedbe)

**Verdict:** needs changes

**Summary.** Changes are needed: Cauchy's surface area formula in 5.3 is stated with twice the correct constant and is refuted by the Check beside it; two Checks (the Crofton constant for lines in 1.1, the eight-square count in 2.2) assert false values; and the mean width is defined here and in the open roadmap MeanWidthAndCauchyFormulas §3.1, so it has two owners. The 44 Lean statements were recomputed on degenerate cases and no false one was found; `Suggested.lean` elaborates with `sorry` as its only warning and the dependency check is clean. There are four small corrections and two format notes, none blocking. None of the four cited books could be read legally, so every locator is unverified and the wording and arrangement were not compared with the sources: this is left to the human reviewers.

## R01 (P1) — Cauchy's surface area formula in 5.3 has twice the correct constant

The last bullet of 5.3 (README line 500), which the text calls a target, states `V_{d-1}(K) = (1/κ_{d-1}) ∫ λ_{d-1}(K | u^⊥) σ(du)` with `σ` the unnormalized sphere measure. An implementer who states it as written states a false theorem.

For the unit ball of `ℝ³`: `V_2(B³) = 2π` (the Check of 1.3), every shadow has area `π`, `σ` has mass `4π`, so the right side is `(1/π) · 4π · π = 4π`. The Check three lines below refutes it too: the cube's mean shadow `3/2` gives `(1/π) · 4π · 3/2 = 6`, not `V_2 = 3`. Kubota's formula of the same section with `m = d - 1` gives the constant `c^0_{d-1} c^d_1 = d κ_d / (2 κ_{d-1})` against the probability `ν_{d-1}`, that is `1/(2 κ_{d-1})` against `σ` of mass `d κ_d`. The printed right side is the surface area `2 V_{d-1}(K)`.

Smallest change: write `V_{d-1}(K) = (1/(2 κ_{d-1})) ∫ λ_{d-1}(K | u^⊥) σ(du)`, or keep the constant and put `2 V_{d-1}(K)` on the left.

## R02 (P2) — The Check of 1.1 on the Crofton constant for lines in the plane is false: `c^1_1 c^1_2 = 1/π`, not `2/π`

In the third Check of 1.1 (line 106) the text has "`c^1_1 c^1_2 = 2/π` and `c^2_1 c^2_3 = π/4`, the constants of Crofton's formula for lines in the plane and for planes in space". With `c^r_s = r! κ_r / (s! κ_s)`: `c^1_1 = 1` and `c^1_2 = 2/(2π) = 1/π`, so the product is `1/π`. It is also not a constant of 5.1: for `d = 2`, `k = 1` the Crofton constants `c^k_j c^{d-k+j}_d` are `c^1_0 c^1_2 = 2/π` (`j = 0`) and `c^1_1 c^2_2 = 1` (`j = 1`). The second value is right (`d = 3`, `k = 2`, `j = 1`: `π · 1/4`).

Smallest change: replace `c^1_1 c^1_2` by `c^1_0 c^1_2`; the Check of 5.1 already uses that constant.

## R03 (P2) — The Check of 2.2 counts the inclusion–exclusion terms of the eight unit squares wrongly: the sum is `8 − 12 + 4`, not `8 − 8 + 0`

In the first Check of 2.2 (lines 235–237) the frame "as the union of eight unit squares around the hole" is given the Euler characteristic "`8 - 8 + 0 = 0`". The two edge squares flanking a corner square meet in a point (for instance `[1, 2] × [0, 1]` and `[0, 1] × [1, 2]` meet in `(1, 1)`), so there are `8 + 4 = 12` nonempty pairwise intersections, and each corner square with its two neighbours has the common point, giving `4` nonempty triple intersections; no four squares meet. The sum is `8 − 12 + 4 = 0`. The total is right and the terms are not, and the terms are what a reader recomputes to test the definition of the inclusion–exclusion sum (a definition that dropped point intersections would give the printed `8 − 8 + 0`).

Smallest change: write `8 - 12 + 4 = 0`, with the clause on the four point contacts and the four triples.

## R04 (P2) — The mean width is defined here (5.3) and in MeanWidthAndCauchyFormulas §3.1, so it has two owners

5.3 defines the mean width as the mean of `h_K(u) + h_K(-u)` over the uniform law on the sphere and declares it in `Suggested.lean` (line 510). The open roadmap MeanWidthAndCauchyFormulas (pull request #3189, another author's new folder, so it may be consumed) defines the same object in its §3.1, on every finite-dimensional real inner product space, with additivity, homogeneity, monotonicity and motion invariance, and lists "mean width with its spherical constant" under what it owns (its Scope and ownership). Its definition integrates the width against Tau Ceti's uniform law on the sphere. Neither text cites the other, and two definitions of one notion will have to be reconciled by whoever implements the second.

The two roadmaps do not otherwise collide: that one states Crofton's formula for curves and Cauchy's perimeter formula in the plane (its §4.1, §4.3) and lists Kubota's formulas, the Steiner polynomial and Cauchy's formula for `d ≥ 3` as not treated; the identity `V_1 = (d κ_d / (2 κ_{d-1})) w(K)` is this roadmap's.

Smallest change: in 5.3 take the mean width from MeanWidthAndCauchyFormulas §3.1 (a supplier contract, and a local copy in the Lean file as is done for the support function) and keep the identity with `V_1` as the target; name that roadmap among the open suppliers in the description. If the author prefers this roadmap to own the notion, say so in the Scope section with the reason, and the other roadmap's citation follows.

## C01 — The volume clause `intrinsicVolume_top` holds for every set, by evaluating the interpolation polynomial at its node `0`

With the definition by interpolation, the coefficient of `ε^0` of the Steiner polynomial is its value at the node `0`, which is `volume.real (K + closedBall 0 0) = volume.real K`, and `κ_0 = 1`. On a copy of the file the statement was proved in five lines without `IsCompact` or `Convex ℝ` (from `Lagrange.eval_interpolate_at_node` and `unitBallVolume 0 = 1`). So the two hypotheses are not needed, and as a target it asks an implementer for little. Would the author mark it as a sanity check of the definition, or state it for all sets as 1.3 does for invariance?

## C02 — `uniformSphere` rebuilds the uniform law on the sphere that the pinned Tau Ceti already has

4.1 defines the normalized surface measure from Mathlib's `Measure.toSphere` and does not mention `TauCeti.Probability.uniformSphereMeasure` (`TauCeti/Probability/Distributions/Uniform/Sphere/Basic.lean`, line 77), which is the same normalized measure on the sphere, with its invariance under linear isometries (`LinearIsometryEquiv.map_uniformSphereMeasure`, line 138 there). The only difference is the transport to `Eucl d`. Defining `uniformSphere d` as the image of the Tau Ceti measure under the inclusion, and listing it in the contracts from Tau Ceti, would say in one clause how the variant differs. SpecialFunctionsHigherSpheres §1.2 defines a third copy (`sphereMeasure n`), with the image of the Haar probability of `SO(n)` for `n ≥ 2`; the statement here for the full orthogonal group and every unit vector is not a duplicate of it.

## C03 — The three roadmaps named as consumers and as owners of the boundary material do not exist

"Downstream consumers" and "Scope and ownership" name GaussianFieldsSupremaAndExcursions, RandomClosedSetsAndBooleanModels and RandomTessellations as sibling roadmaps, and the Scope section says that the measurability of additive functionals on the convex ring, the specific intrinsic volumes, flat processes and tessellations "are owned there". None of the three is on main or among the open roadmap pull requests, so a reader who follows the pointer finds nothing, and the material is at present owned nowhere. The description has the same sentence ("the Boolean-model and tessellation roadmaps take its formulas in expectation, and the roadmap on Gaussian suprema and excursion sets takes the intrinsic volumes of boxes"). Would the author say "planned" in both places, or name the material as outside this roadmap without naming an owner?

## C04 — The evenness hypothesis of `intrinsicVolume_zonoid` is not needed

The support function `∫ |⟪u, v⟫| ρ(dv)` and the integrand `∇_j(v_1, …, v_j)` are both unchanged when any `v_i` is replaced by `-v_i`, so replacing `ρ` by its symmetrization changes neither side: the formula of 5.4 holds for every finite measure on the sphere. For atoms `ρ_i δ_{v_i}` both sides are `2^j ∑_{i_1 < ⋯ < i_j} ρ_{i_1} ⋯ ρ_{i_j} ∇_j`. If evenness is kept because it makes the generating measure unique, a clause saying so would help.

## N01 — Several Checks give numbers that cannot be recomputed

The Checks of 5.4 ("four random vectors": `6.40460`, `18.34500`, `5.28200`, `7.62833`, `6.53100`) do not give the vectors, and those of 5.3 and 6.1 quote Monte Carlo values. Giving the vectors, or an exact instance (for `a_1 = e_1`, `a_2 = e_2`, `a_3 = e_1 + e_2` the area is `3`), would make them tests.

## N02 — Three docstrings use the four-index constant that the Conventions say is always spelled out

The docstrings of `crofton`, `kubota` and `principal_kinematic` write `c^{k, d-k+j}_{j, d}` and `c^{0,d}_{m,d-m}`, while the Conventions say the constant "is spelled out as a product in every statement".

## Questions for the author

- 1.1 says that Schneider and Weil print the Gamma form of `c^r_s` on p. 172 "without the factor `(2√π)^{r - s}`", and the second Check is built on that. Is the form printed there for a single `c^r_s`, or for the Crofton product `c^k_j c^{d-k+j}_d`? For the product the exponents cancel (`(k - j) + (j - k) = 0`), and the Gamma quotient alone is exact: `c^1_0 c^1_2 = Γ(1) Γ(1) / (Γ(1/2) Γ(3/2)) = 2/π`. If it is the product, the source has no misprint and the sentence and the negative control should go. The book could not be read.
- The numbering of Kiderlen's theorems is not consistent across the README: Theorem 2.2 is the monotone form of Hadwiger's theorem in 3.3 (pp. 24–25) and the principal kinematic formula in 6.2 (p. 25); Theorem 2.3 is Kubota's formula in 5.3 and the iterated kinematic formula in 6.3 (both p. 26). Which are right? The chapter could not be read.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 constants and closed forms | `j = 0…4`; `(r, s) = (1,0), (3,1), (2,5)` | `κ = 1, 2, π, 4π/3, π²/2`; `c^1_0 = 2 = 2√π·Γ(1)/Γ(1/2)`; `c^3_1 = 4π` both sides; `c^1_1 c^1_2 = 1/π` | closed forms true; third Check false | R02 |
| 1.2 Steiner formula, `intrinsicVolume_top` | `K = ∅`; `d = 0`; unit square; box | `∅`: `0 = 0`; `d = 0`: `1 = κ_0 V_0`; square `1 + 4ε + πε²`; L-shape `ε²` coefficient `5π/4 − 1` | true; volume clause holds for all sets | C01 |
| 1.3 invariance, homogeneity, ball, `V_0`, dimension independence | `t = 0`, `j = 0`; `K = ∅`; `d = 0`; `j > d` | `0 • K = {0}`: `V_0 = 1 = 0^0 · 1`; `V_1(B²) = π`, `V_1(B³) = 4`, `V_2(B³) = 2π`; `9 + 1 ≠ 8` | true | none |
| 1.4 generalized Steiner, lower-dimensional, surface area | unit cube `d = 3`, `k = 2`; `A = ⊥`; `d = 1` | `3 + 3πr + 2πr²` term by term; `K = ∅`: `0 = 0`; interval: `2 V_0 = 2 =` two boundary points | true | none |
| 2.1 valuation, continuity, definitions | `K = ∅`; two squares sharing an edge; rotated square plus segment | `∅`: identity; `1+1 = 2+0`, `2+2 = 3+1`; `1 + |cos θ| + |sin θ| = 2, 2.36603, 2.41421` | true | none |
| 2.2 Groemer, inclusion–exclusion | `m = 0`; frame as 4 rectangles; frame as 8 squares; L-shape | `0`; `4 − 4 + 0`; `8 − 12 + 4` (README: `8 − 8 + 0`); `3 + 2 − 1 = 4` | theorem true; Check false | R03 |
| 2.3 Euler characteristic, convex ring index | `m = 0`; disjoint union; `∅`; L-shape | `0`; only singletons survive, `m`; index `0`; index `2` | true | none |
| 3.1 zonoids, smooth symmetric bodies | `d = 0, 1`; disc; `l = 0, 2, 4` in `d = 2` | `d = 0`: `K = {0}`; `∫|cos| / 4 = 1`; multipliers `4, 4/3, −4/15` | true | none |
| 3.2 simple valuations | `d = 0`; `d = 1` | `d = 0`: `φ(univ) = φ(cube) = 0`; `d = 1`: `f` additive, continuous, `f(1) = 0`, so `0` | true | none |
| 3.3 Hadwiger, monotone form, segments, continuity | `d = 0, 1`; `φ = −1` on nonempty, `−2` on `∅`; stadium | `d = 1`: `c_0 + c_1 · length`; control is increasing valuation with `c_0 = −1`; `π + 2t`, `π + t`; step bound `(R + 2) C ⊆ (R + d) C` | true | none |
| 4.1 rotations and sphere | `d = 0`; `d = 1` | `d = 0`: no unit vector, `uniformSphere 0 = 0`; `d = 1`: masses `1/2, 1/2` | true | C02 |
| 4.2–4.3 Grassmannian and flat measures | `k = 0, d`; unit ball | Dirac masses; flats meeting ball `κ_{d-k}`: `2, 2, π`; `T(ϑ, y) = (Aϑ, y + π((Aϑ)⁻¹ b))` checked | true | none |
| 4.4 rigid motions | `d = 1`; composition and inverse laws | `2 = κ_1`; `(hϑ, ht + s)`, `(ϑh, ϑs + t)`, `(ϑ⁻¹, −ϑ⁻¹ t)` | true | none |
| 5.1 Crofton | unit ball, all `j ≤ k ≤ d ≤ 6`; `k = d`; `k = 0` | both sides equal in all 84 cases (direct beta integrals); square `4/π`; disc `2` | true | none |
| 5.2 nonnegativity, monotonicity | `j > d`; `K = ∅`; square in disc | `0 ≤ 0 ≤ 0`; `2 ≤ π/√2 = 2.22144` | true | none |
| 5.3 Kubota, mean width, Cauchy | ball; `d = 1, 2, 3`; `B³`; cube | Kubota constant `= (d choose m) κ_d/(κ_m κ_{d-m})`; `π/2`, `2`; Cauchy as printed `4π` vs `V_2 = 2π`; cube `6` vs `3` | Kubota and mean width true; Cauchy false | R01, R04 |
| 5.4 zonotopes and zonoids | `j = 0`; `j > d`; `j > m`; atomic `ρ`; `ρ = 0`; non-even `ρ` | `1 = 1`; Gram determinant `0`; empty sum `0`; both sides `2^j ∑ ρ_{i_1}⋯ρ_{i_j} ∇_j`; holds without evenness | true | C04, N01 |
| 6.1 general kinematic theorem | `φ = V_d`; `φ = V_0`, segment against square | only `k = d` survives; `0 + (2/π)·2·1 + 1 = 1 + 4/π` | true | none |
| 6.2 principal kinematic formula | discs `0.7`, `1.3`, `j = 0, 1` | `π(r + s)² = 12.56637`; `π² r s (r + s) = 17.96268` | true | none |
| 6.3 iterated formula | `n = 1`, `d ≤ 5`, all `j`, `m_0` | `c^d_j c^{m_0}_d = c^{m_0}_j` in every case | true | none |
| 6.4 translative formulas | two unit squares; `d = 1`; `K = ∅` | `2·1 + 1·2 = 4`; length of `K − M` is the sum of lengths; `0 = 0` | true | none |
| 7.1 extension to the convex ring | frame against disc `ρ < 1/2` | `0 + 16ρ + 8`; parallel area `8 + 16ρ + (π − 4)ρ²`; four corner regions `ρ² − πρ²/4` each | true | none |
| 7.2 bound | `m = 0, 1`; `W = ∅`; frame | `0 ≤ 0`; monotonicity; `0 ≤ 15` | true | none |

- Source locators checked against the text: 0 of the sample; none of the four cited books is legally readable (see Not verifiable).
- Library declarations opened at the pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d): `TauCeti.orthogonalGroupMeasure` (`Geometry/Euclidean/Volume/OrthogonalGroup.lean:344`), `map_orthogonalGroupLastColumn_orthogonalGroupMeasure` (:394), `orthogonalGroupVolume_pos` (:458), `orthogonalGroupToLinearIsometryEquiv` (`LinearAlgebra/OrthogonalGroup.lean:44`), `tendsto_volume_real_add_smul_closedBall_div` (`Geometry/Euclidean/Volume/Parallel.lean:154`), `Convex.hasDerivWithinAt_measureReal_add_smul_closedBall` (`Analysis/BoundedVariation/ParallelVolume.lean:355`), `TauCeti.perimeter` (`Analysis/BoundedVariation/Perimeter.lean:64`), `uniformSphereMeasure` (`Probability/Distributions/Uniform/Sphere/Basic.lean:77`), Mathlib `euclideanHausdorffMeasure` (`Geometry/Euclidean/Volume/Measure.lean:68`, with `μHE[0] = μH[0]` at :82), `EuclideanSpace.volume_closedBall` (`MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean:325`), `Lagrange.eval_interpolate_at_node` (`LinearAlgebra/Lagrange.lean:318`). All are as the README describes them.
- Cross-roadmap citations resolved: 5 of 5 (Isoperimetry §2.3; GeometricMeasureTheory Conventions; ConvexAnalysisAndDuality §2.1, whose definition of the support function the local copy matches; SpecialFunctionsHigherSpheres §4.3 and §2.2 at its open head).
- Duplication by object: no intrinsic volumes, Steiner polynomial, Hadwiger theorem, zonoids, convex ring or kinematic formulas in the pinned Mathlib or Tau Ceti, on main, or in another open roadmap; the mean width (R04) and the uniform law on the sphere (C02) are the two exceptions.
- Overlap check: read MeanWidthAndCauchyFormulas, IlluminationAndCoveringByHomothets, Isoperimetry; mean width is shared with MeanWidthAndCauchyFormulas §3.1 and has no single owner (R04); the boundary area of a convex body is owned by Isoperimetry §2.3 and cited; nothing shared with IlluminationAndCoveringByHomothets.
- Dependency check: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; no upward or cyclic line. No change outside the roadmap folder.
- Elaboration of `TauCetiRoadmap/IntegralGeometryOfConvexBodies/Suggested.lean` at the pins: 44 `sorry` warnings, no other message; no `set_option`, no sorried definition; the elaborated signatures were compared with the README statements and none has lost a binder. Padding probe: `intrinsicVolume_top` closes without its hypotheses (C01); the closed form of `κ_j` did not close in one tactic.
- The description's counts (44 statements, the pins, the four Tau Ceti imports, the suppliers) agree with the head.

Source independence: 0 passages compared with 0 sources, because none of the four texts could be read; largest share Schneider–Weil, about 40 of 78 source mentions in the layers; contents compared with Schneider–Weil only through the page locators the README gives (Layers 1–3 ↔ Ch. 14, Layer 4 ↔ §13.2, Layers 5–7 ↔ Ch. 5, the reverse of the book's order): independent as far as that shows.

Research link: The headline targets are the integral-geometric tools of stochastic geometry: Schneider and Weil (2008) use the kinematic and Crofton formulas for mean values of Boolean models and tessellations, and Adler and Taylor (2007) use the intrinsic volumes and the kinematic formula for excursion sets of random fields; this rests on the README's summary and references.

## Not verifiable

- Schneider–Weil, *Stochastic and Integral Geometry* (2008): paywalled; every locator of the sample (1.1–1.3, 2.1, 2.3, 3.1, 4.1, 4.4, 5.2–5.4, 6.1, 6.4, 7.1) and the claim about p. 172 are unverified.
- Kiderlen, Lecture Notes in Mathematics 2068, Chapter 2 (2013): paywalled; its locators in 1.2, 1.3, 2.1, 5.3, 6.1, 6.4, 7.1 are unverified.
- Adler–Taylor, *Random Fields and Geometry* (2007): paywalled; its locators in 1.2, 2.1, 4.1, 7.1 are unverified.
- Chiu–Stoyan–Kendall–Mecke, *Stochastic Geometry and its Applications*, 3rd ed. (2013): the publisher's page refused access and no legal copy was found; its locators in 1.1–1.3, 5.3 are unverified.
- 7.2 has no source locator; its statement follows from 2.2 and 5.2 and was checked directly.
- The numerical values of the Checks of 3.1 (log-slopes), 5.3 and 6.1 (Monte Carlo) and 5.4 were not recomputed.
- The lean-MSSS repository named under "Prior formalization" was not opened.

Automatic checks set aside as false positives: the section comment that closes the Lean file was reported as a header with no declaration under it, but it introduces the `#check` lines that pin the library declarations named in the README, which is what such lines are for.

## Source issues

- none

## For the human reviewers

- **Not tested.** Schneider–Weil (2008) has the largest share of the locators and could not be read, nor could the other three books; wording, arrangement and all locators are unchecked against the sources.
- **Licence.** README "Prior formalization" (lines 724–736) says the definitions and five statements coincide with the author's public repository lean-MSSS (commit 6826ba2); the repository and its licence were not opened.
- **Scope.** The three sibling roadmaps this one says it feeds (Boolean models, tessellations, Gaussian excursion sets) exist neither on main nor as open pull requests; README lines 642–655.
