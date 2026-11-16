# Review of GaussianIsoperimetryAndClusters (pull request #2420 at c490eeb)

**Verdict:** accepted

## Previous findings

- R01 — repaired: `TauCetiRoadmap/GaussianIsoperimetryAndClusters/README.md:532`, the third §6.4 Check: "`p_U` reads the essential boundary of each section. … The null modification `U′ = U ∪ ℚ²` has the section `(−1, 1) ∪ ℚ` over `0`, whose essential boundary is still `{−1, 1}` … the topological frontier … would give `∞`."
- R02 — repaired: description, "Dependencies: GeometricMeasureTheory G2 (…), G5 (…) and G6 (perimeter of bounded Lipschitz domains), and Isoperimetry I4 (…). Both roadmaps are on main … RandomMatrices 2.2 and BanachSpaceTheory B7 are named only to set their concentration results apart …; neither is a supplier or a consumer."
- R03 — repaired: description, "The weighted layer (Layer 2) covers weighted variation and perimeter defined by duality (§2.1), … weighted coarea formulas (§2.6), and Gaussian invariance and cylinders (§2.7)."

## Verified sound

| Statement | Instances tried | Left side computed | Right side computed | Result |
|---|---|---|---|---|
| §6.4 `p_U` (new Check, README:532) | `U = ball(0,1) ⊂ ℝ²`, `e = e_2`; `z = 0`, `0 < \|z\| < 1`, `\|z\| ≥ 1` | `∂^M(U_0) = {±1}`: `2φ(1) = 0.483941`; `2φ(√(1−z²))`; `∂^M(∅) = ∅`: `0` | Check: `0.483941`; `2φ(√(1−z²))`; `0` | holds |
| §6.4 `p_U`, null modification | `U′ = U ∪ ℚ²`, section over `0` is `(−1,1) ∪ ℚ` | essential boundary `{±1}`: `p_{U′}(0) = 0.483941` | frontier `ℝ ∖ (−1,1)`, uncountable: `Σφ = ∞` | discriminates essential boundary from frontier |
| §6.4 against §5.3 and §6.1 | disc section over `0` vs `S_e(U)` section | `v_U(0) = 2Φ(1)−1 = 0.682689`, `Φ⁻¹ = 0.475233` | `I(0.682689) = φ(0.475233) = 0.356343 < 0.483941` | agrees with §6.1 Check 2, §6.5 Check 3, §6.6 Check 3 |
| §6.4 inequality (4.14), `B = e^⊥` (CianchiFuscoMaggiPratelli2011 Lemma 4.6, line 781–828) | disc; tilted half-plane `{x_2 < 1 + x_1}` | disc: `∫ 2φ(s)/s · φ(z) dz = e^{−1/2} = 0.606531` (`s = √(1−z²)`); `√2∫φ(1+z)φ(z)dz = 0.310697` | `P_γ(disc) = 0.606531`; `φ(1/√2) = 0.310697` | holds; disc is a second non-symmetral equality case, consistent with Check 2 |

Rows for untouched statements stand as in the previous review, of `1bb9eab`.

- Source locators: CianchiFuscoMaggiPratelli2011 line 553–557 (p_E is the Gaussian `H^0` measure of the essential boundary of the section, p.11) and line 781–828 (Lemma 4.6, (4.14), p.14: `n ≥ 2`, finite Gaussian perimeter, Borel `B ⊆ B_E`, equality when `E` agrees with its symmetral on `B × ℝ`) match §6.4.
- The new Check: all five numbers were recomputed (`2φ(1)`, `2Φ(1) − 1`, `Φ⁻¹`, `I`), and they agree to six places. The section formula and the `|z| ≥ 1` case were checked by hand.
- Description: the Dependencies paragraph matches README lines 109–116 and 758–759. G2, G5 and G6 (GeometricMeasureTheory README lines 148, 248, 275), I4 (Isoperimetry line 223), RandomMatrices 2.2 (line 503) and BanachSpaceTheory B7 (line 1264) resolve on main. The Layer 2 sentence matches headings §2.1–§2.7 (README lines 174–244). No sentence of the title or description is contradicted by this head.
- Gate: every check passes. The dependency check prints `depcheck: 239 roadmaps, 2251 edges, 0 problem(s)`, and the merge order lists the roadmap at line 432. The outside-folder diff is empty.
- Elaboration: `lake env lean` on `Suggested.lean` gives 20 warnings, all `sorry`, and no errors. `Suggested.lean` has not changed since `1bb9eab`, so the comparison of the 37 elaborated signatures stands.
- Citation lead `Cluster.perimeter_eq_iff_halfSpaces`: this is the roadmap's own declaration (`Suggested.lean:358`), not a missing library name.

Overlap check: read MathematicalStatisticsAsymptotic, MathematicalStatisticsNonparametric, MathematicalStatisticsSemiparametric, SchattenClassesAndSchurMultipliers, Isoperimetry, GeometricMeasureTheory and OptimalTransport; nothing shared. Sections, Ehrhard symmetrisation and Gaussian perimeter/isoperimetry occur in no other roadmap, open or on main (`roadmaps grep`: this roadmap only).

Source independence: changed passages only; 1 passage (README:532) compared with 1 source (CianchiFuscoMaggiPratelli2011 line 553–557, 781–828), none shared; largest share MilmanNeeman2022, 28 of 97 locators (the change adds none); contents not compared again, since no layer was added, removed or reordered.

## Not verifiable

- No text the changed passage cites was unreadable.
- Unchanged from the previous review, outside the changed passage: Bobkov1997 Corollary 1 (unreadable OCR); SudakovTsirelson1974, CarlenKerce2001, AmbrosioFuscoPallara2000 and Bogachev1998 (settled as uncertified); Maggi2012 (only the author's extract is cached).

## Source issues

- none

## For the human reviewers

- none
