# Review of RiemannianGeometry (pull request #2225 at 1e8b5e0)

**Verdict:** needs changes

## R01 (P3) — After the scope repair, "P7a consumes these" also covers GeometricTopology's and AlgebraicTopology's objects

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md` lines 42–45: "AlgebraicTopology §4.6 owns the homeomorphism … with its affine-chart comparison; PseudodifferentialOperators P7a consumes these; R4.7 uses no PseudodifferentialOperators target".

**Claim:** The previous review's repair put the two deferrals in front of "consumes these". As written, the sentence says P7a consumes the curvature −1 classification of GeometricTopology §7.1 and the RPⁿ homeomorphism of AlgebraicTopology §4.6. P7a consumes neither of them. It consumes R4.7's quotient construction.

**Witness:** PseudodifferentialOperators `README.md` on main, line 1982, gives P7a's needs as "RiemannianGeometry R4.7 quotient geometry; P5 density and chart estimates; P6 weak regularity; P7 spectral realization". It names neither GeometricTopology nor AlgebraicTopology.

**Repair:** Replace lines 41–46, from "and the space-form quotients in curvature 0 and 1;" to "form no cycle.", with: "and the space-form quotients in curvature 0 and 1; PseudodifferentialOperators P7a consumes R4.7's quotient construction, and R4.7 uses no PseudodifferentialOperators target, so P1.0 → R7 and R4.7 → P7a form no cycle. GeometricTopology §7.1 owns the curvature −1 case in dimensions n ≥ 1, and AlgebraicTopology §4.6 owns the homeomorphism from `TauCeti.RealProjectiveSpace` n to `Projectivization` ℝ (Fin (n+1) → ℝ) with its affine-chart comparison."

## R02 (P3) — The description says the parent edits are one commit, but there are now two

**Location:** Pull request description, "Edits to the parent roadmap from its review": "These answer the review of the parent folder and are independent of Layer 6; they are a separate commit."

**Claim:** At this head the parent-roadmap edits from review are in two commits. The sentence names one.

**Witness:** `git log origin/main..HEAD` lists `3a609d5` ("single owners for R4.7's projective and hyperbolic comparisons") and `1e8b5e0` ("follow-up on R4.7's single owners"). Each touches only the parent `README.md` and `Suggested.lean`.

**Repair:** Replace "they are a separate commit." with "they are in two separate commits."

## Previous findings

- R01 — repaired: lines 41–44: "the space-form quotients in curvature 0 and 1; GeometricTopology §7.1 owns the curvature −1 case in dimensions n ≥ 1, and AlgebraicTopology §4.6 owns the homeomorphism …". The repair introduced this report's R01.
- R02 — repaired: lines 2390–2394: "For n ≥ 1 the curvature −1 case (a complete hyperbolic n-manifold is ℍⁿ/Γ, with universal cover the upper half-space model in ℝⁿ⁻¹×ℝ) … for n = 0 the point satisfies the curvature hypothesis vacuously".
- R03 — repaired: lines 745–751: "Layer 1: the actual normal bundle and tubular neighbourhood theorem. General immersions use the corresponding orthogonal subbundle of f*TN". The stale sentence is gone.
- R04 — repaired: lines 566–569: "a smooth Riemannian metric, complete for its Riemannian distance, whose curvature is the constant-curvature tensor with parameter −1, on a preconnected T3 smooth manifold modelled on a finite-dimensional space."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Scope lines 41–45 (ownership) | ℍ²/Γ, Γ a genus-2 group; S³/(ℤ/5); RP² | genus 2: owned by GeometricTopology main l. 6700–6704; lens space has curvature 1, so R4.7's; RP² ≃ₜ ℙ(ℝ³) is AlgebraicTopology §4.6's | owners correct | none |
| Scope lines 44–45 (P7a consumption) | PseudodifferentialOperators main l. 1938–1941, 1982 | P7a consumes R4.7's quotient atlas, descended metric and covering; it needs 0 GeometricTopology or AlgebraicTopology items | "these" overreaches | R01 |
| `TauCeti.HyperbolicMetric` entry (566–569) | compact genus-2 surface; two disjoint copies of ℍ²; a point with `Fin 0` model | `Hyperbolic.lean` l. 42–45: `FiniteDimensional`, `T3Space`, `PreconnectedSpace`, `IsManifold I ∞`; l. 53 ∞-metric; l. 60 `CompleteSpace`; l. 63 tensor (−1). Genus 2 via `ofCompactSpace`; the disjoint union is excluded; the point is admitted | matches the pin | none |
| Curvature −1 sentence (2390–2394) | n = 0; n = 1; n = 2 genus 2 | n=0: model `Fin (0−1)` = `Fin 0` gives (0,∞), 1-dimensional, so the guard is needed; n=1: dt²/t² with s = log t is ℝ, circle = (0,∞)/⟨t↦eᴸt⟩; n=2: area 2π·2 = 4π | holds for n ≥ 1, matching GeometricTopology §7.1 l. 6691 | none |
| GeometricTopology contract (745–751) | Layer 1, main l. 783–1305; §7.1, l. 6685–6720 | Layer 1: tubular neighbourhood, 0 curvature claims now attributed; §7.1: ℍⁿ/Γ and the `ModelGeometry` identification | consistent | none |
| Description, parent-edits paragraph | `git log origin/main..HEAD` | parent review edits are in 2 commits (3a609d5, 1e8b5e0); Layer 6 is in 2 (0ba7c9c, a2913c5) | "a separate commit" is false | R02 |

The rows for untouched statements stand as in the previous review, of `3a609d5`.

- **Gate.** Re-run at 1e8b5e0: every check is 0 and the result is `OK`. The outside-folder diffstat is empty.
- **Dependency check.** `depcheck: 206 roadmaps, 1912 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean` gives 22 `declaration uses sorry` warnings (lines 112–590) and nothing else. `Suggested.lean` is unchanged since 3a609d5.
- **Library declarations opened at the pins: 2.** `TauCeti.HyperbolicMetric` (`Riemannian/Hyperbolic.lean:51`, with its binders at lines 42–45 and its fields at 53, 55 and 63) and `HyperbolicMetric.ofCompactSpace` (`:81`).
- **Cross-roadmap citations resolved: 4.**
  - GeometricTopology §7.1, main lines 6685–6720, with the model `Fin (n−1)` at line 6691.
  - GeometricTopology Layer 1, main lines 783–1305.
  - PseudodifferentialOperators P7a, main lines 1932–1982.
  - AlgebraicTopology §4.6, as in the previous review.
- **Sources.** The changed lines carry no locator. The seeded sample §1.1–§2.3 lies in untouched text and stands as checked before.
- **Overlap check.** Scope read for GeometricTopology, AlgebraicTopology, PseudodifferentialOperators, LorentzianGeometry, MinimalSurfaces, RicciFlow, Surfaces, PositiveMass, ManifoldOptimization, DGFloerPartII and SmoothBundlesConnections.
  - Curvature −1 Killing–Hopf is owned by GeometricTopology §7.1, and RPⁿ ≃ₜ `Projectivization` by AlgebraicTopology §4.6. R4.7 owns curvature 0 and 1 and the quotient completeness.
  - Nothing else is shared with the changed text.
- **Remark.** Two roadmaps cite "Killing–Hopf" against RiemannianGeometry R4 item 7: TeichmullerGeometry at its open head (lines 37 and 94) and ConformalMappingPartII on main. For curvature −1 those citations now resolve through line 2392's pointer to GeometricTopology §7.1.

## Not verifiable

- None in the changed text.

## Source issues

- none
