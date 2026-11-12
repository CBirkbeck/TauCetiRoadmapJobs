# Review of RiemannianGeometry (pull request #2225 at 762bf82)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: lines 44–46: "(Fin (n+1) → ℝ) with its affine-chart comparison. PseudodifferentialOperators P7a consumes R4.7's quotient construction and none of these; R4.7 uses no PseudodifferentialOperators target".
- R02 — repaired: description: "These answer the reviews of the parent folder and are independent of Layer 6; they are in separate commits." `git log origin/main..HEAD` shows four such commits (3a609d5, 1e8b5e0, 5089352, 762bf82), each touching only parent files.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Scope l. 44–46: P7a consumes R4.7's quotient construction | PseudodifferentialOperators on main, l. 1938–1945, 1982, 2051 | 3 citations of RiemannianGeometry, all to R4.7. 0 of GeometricTopology, 0 of AlgebraicTopology. Consumed: quotient atlas, descended metric, covering | holds | none |
| "none of these": the RPⁿ case | X = S², Q = ℤ/2 antipodal, via P7a §8.1 | Y = S²/±1 comes from the generic quotient. AT §4.6's homeomorphism to ℙ(ℝ³) is never used. Area 4π → 2π, degree 2 = \|Q\| | holds | none |
| "none of these": curvature −1 | X a genus-3 hyperbolic surface, free orientation-preserving ℤ/2 | χ goes −4 → −2, so Y has genus 2. Area −2πχ goes 8π → 4π, ratio 2 = \|H\|. GT §7.1's ℍⁿ/Γ classification is never used | holds | none |
| R4.7's quotient specialization (l. 2396–2413), which the changed text cites | circle of length 2π with ℤ/d (the P7a Check); negative control ℝ²∖{0} with ±1 | circle: quotient length 2π/d, compact so complete. ℝ²∖{0}: free and properly discontinuous, but quotient incomplete because the source is incomplete | the completeness hypothesis on the source is needed and stated | none |
| Description: "P7a consumes R4.7's quotient construction only"; "in separate commits" | head l. 44–46; `git log` | the head says "R4.7's quotient construction and none of these"; 4 parent-review commits | holds | none |
| Merge with the sibling RiemannianGeometry PRs (762bf82 "mergeable with the R5b scope line") | `git merge-tree` against the heads of #2222, #2223, #2224, #2226 | rc = 0 for all 4. The merge with #2222 keeps the P7a sentence and #2222's widened R5b sentence intact | holds | none |

The rows for untouched statements stand as in the previous review, of `1e8b5e0`.

- **Gate.** Re-run at 762bf82: every check is 0 and the result is `OK`. The outside-folder diffstat is empty.
- **Dependency check.** `depcheck: 206 roadmaps, 1912 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean` gives 22 `declaration uses sorry` warnings (lines 112–590) and nothing else. `Suggested.lean` is unchanged since 1e8b5e0, so the `#check @name` comparison of the previous review stands.
- **Library declarations opened at the pins: 5.** These are the natives behind "R4.7's quotient construction":
  - Mathlib `MulAction.instChartedSpaceQuotient` (`Geometry/Manifold/Instances/Quotient.lean:50`).
  - Mathlib `isQuotientCoveringMap_quotientMk_of_properlyDiscontinuousSMul` (`Topology/Covering/Quotient.lean:286`).
  - Tau Ceti `TauCeti.instIsManifoldQuotient` and `TauCeti.isLocalDiffeomorph_quotientMk` (`Geometry/Manifold/Instances/Quotient.lean:242`, `:253`).
  - Tau Ceti `Bundle.ContMDiffRiemannianMetric.quotient` and `isLocalRiemannianIsometry_descend` (`Riemannian/Pullback/Descent.lean:258`, `:189`).
- **Cross-roadmap citations resolved: 1.** PseudodifferentialOperators P7a on main (Layer 8, l. 1933–2052).
- **Sources.** The changed lines carry no locator. The seeded sample §1.1–§2.3 lies in untouched text and stands as checked before.
- **Remark (untouched text, also on main).** The overlap tool says #1807 drops the anchor `#g4-generalized-lerayhirsch-thom-and-euler-theory` cited at l. 788 and 1224; that head is not checked out here. Its "only an open revision defines §G4.0b" is a false positive: main GeneralizedCohomology defines G4.0b (l. 936, 1082).

Overlap check: read LorentzianGeometry, MinimalSurfaces, ManifoldOptimization, PositiveMass, DGFloerPartII (open), Surfaces, RicciFlow, HopfRinow (main), plus PseudodifferentialOperators, GeometricTopology, AlgebraicTopology; quotient completeness and the curvature 0 and 1 space forms: owner RiemannianGeometry R4.7 (RicciFlow consumes R4 item 7); curvature −1 space forms ℍⁿ/Γ: owner GeometricTopology §7.1; RPⁿ ≃ₜ `Projectivization`: owner AlgebraicTopology §4.6; the quotient manifold, covering and descended metric: owner Tau Ceti at the pin (ArithmeticFuchsianGroups and QuasiregularMaps cite those natives directly); DGFloerPartII 1.3's frame-quotient comparisons are a different object; nothing else shared.

## Not verifiable

- None in the changed text.

## Source issues

- none
