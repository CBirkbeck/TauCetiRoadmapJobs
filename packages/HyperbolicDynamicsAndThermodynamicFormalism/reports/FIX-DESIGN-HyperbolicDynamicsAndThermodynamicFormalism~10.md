# FIX-DESIGN-HyperbolicDynamicsAndThermodynamicFormalism~10

This round repairs the one finding of the round-9 review of the design, a P3. Two files change: `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/README.md` and `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`. `sources.toml` is unchanged: no new work is cited and no source was fetched. The design stage has no `Suggested.lean`, so the `#check` comparison does not apply. Nothing was elaborated.

## F01 (P3) — applied

The finding is correct. At the Tau Ceti pin `2fd255d9…` these declarations exist:

- `TauCeti.globalFlow` (`TauCeti/Geometry/Manifold/IntegralCurve/GlobalFlow.lean`:60), a `Flow ℝ M` for a complete C¹ field.
- `TauCeti.isMIntegralCurve_globalFlow` (:90): its orbits are integral curves.
- `TauCeti.contMDiff_globalFlow_uncurry` (:147): the flow is jointly C^n for `n : ℕ∞` with `1 ≤ n`, given `[IsManifold I n M]` and a C^n field.
- `TauCeti.mfderiv_globalFlow_apply_self` (:167): Dg^t(v(x)) = v(g^t x).
- `TauCeti.IsCompleteVectorField` (`TauCeti/Geometry/Manifold/Flow/Complete.lean`:61).
- `TauCeti.isCompleteVectorField_of_compactSpace` (:154).

The section binders are `[FiniteDimensional ℝ E]`, `[T2Space M]`, `[IsManifold I 1 M]` and `[BoundarylessManifold I M]`; the completeness theorem also needs `[CompleteSpace E]` and `[CompactSpace M]`. `toFlow` is not a declaration. DifferentialGeometry's README, §3.3 (`TauCetiRoadmap/DifferentialGeometry/README.md`:1278–1287 on main), itself identifies the finite-dimensional flow with `TauCeti.globalFlow`.

Changes (old → new):
- Scope "Tau Ceti's maximal flows" → "Tau Ceti's flows of complete vector fields with completeness on compact manifolds".
- The DifferentialGeometry clause is deleted from "Stated by other roadmaps", and the "From TauCetiRoadmap.DifferentialGeometry — Layer 3" subsection is deleted.
- A new "From Tau Ceti" bullet names the six declarations with their hypotheses.
- §9.2(b) "(DifferentialGeometry Layer 3.3 `toFlow`)" → `TauCeti.globalFlow`, with the completeness, regularity and generator theorems named.
- The §9.2 *Needs* line and the Layer 9 Dependencies are updated to match.
- In plan.json, the 9.2 prerequisite `roadmap:DifferentialGeometry Layer 3` → five `tauceti:` names, and the DifferentialGeometry supplier entry is removed.

Same pattern elsewhere: §9.2(c) also takes the flow of a field, h∂_t on the mapping torus. It now cites `TauCeti.globalFlow` too, with completeness coming from compactness of the mapping torus (the image of [0, 1] × N).

I did not copy one clause of the suggested bullet: "the passage from a C^r generator to a C^r flow of the Conventions". The Conventions (README "Conventions", manifold item) define a C^r flow and its generator but do not pass from a generator to a flow. Layer 11 and the geometric-potential convention assume both "C² flow" and "C² vector field", so no target uses that passage. The bullet says instead which flows of §9.2 it supplies.

## Checks

The dependency check, after the edits:

    candidate: HyperbolicDynamicsAndThermodynamicFormalism is not in the merge order yet; checked as if placed after ArithmeticDynamics (the intake inserts it when its design is accepted)
    depcheck: 246 roadmaps, 2245 edges, 0 problem(s)

There is no UPWARD or CYCLE line. The edge count matches the count before the edit, not "one fewer" as the review expected. DifferentialGeometry is on main, so the edge was never an ordering constraint; the check does not appear to count it.

`roadmaps resolve` on the README reports no cross-roadmap citation and no Lean name found nowhere. `plan.json` parses as JSON. `grep` finds no `DifferentialGeometry` or `toFlow` in README.md, plan.json or sources.toml.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| Contract bullet: flow of a complete C¹ field, its generator | v ≡ 0 on any M; v = ∂_θ on S¹ = ℝ/ℤ | v ≡ 0: every integral curve is constant, g^t = id, Dg^t(0) = 0 = v(g^t x). ∂_θ: g^t(θ) = θ + t, generator ∂_θ, Dg^t ∂_θ = ∂_θ | Holds |
| Contract bullet: completeness on compact manifolds | M = ℝ (non-compact), v(x) = x²∂_x; M = S¹, v = sin(2πθ)∂_θ; empty M | On ℝ the integral curve from x₀ > 0 is x₀/(1 − x₀t), which blows up at t = 1/x₀, so the field is not complete and compactness is needed. On S¹ every curve stays in [0, 1) mod 1 and is defined for all t. Empty M: complete vacuously | Holds; the compactness hypothesis is stated |
| Contract bullet: joint regularity range | n = 1; n = ∞; analytic field | `n : ℕ∞` with 1 ≤ n covers C¹ (§9.2 with r = 1), C² (Layer 11) and C^∞. An analytic field gives only a C^∞ flow, and the bullet says so | Holds as stated |
| §9.2(b) with the pinned flow | h ≡ 1; h ≡ 2; g a C^r Anosov flow on compact M | h ≡ 1: the orbits of g are integral curves of X, so by uniqueness of integral curves the flow of hX is g; a_x = 0 and the stable bundle is E^s. h ≡ 2: the flow is t ↦ g^{2t}; a_x = 0, since a constant time change keeps the bundles. hX is C^r on a compact boundaryless Hausdorff M modelled on a finite-dimensional E, so every hypothesis of `globalFlow` and of `isCompleteVectorField_of_compactSpace` holds | Holds |
| §9.2(c) with the pinned flow | N compact, R ≡ 1, c = 1/2; N empty | The mapping torus is the image of [0, 1] × N under the continuous quotient map, so it is compact. It is Hausdorff by Mathlib's instance `t2Space_of_properlyDiscontinuousSMul_of_t2Space` (`Mathlib/Topology/Algebra/ConstMulAction.lean`:623), given Tau Ceti's proper discontinuity. h∂_t is C^r and complete. The return time is ∫₀¹ (1 + ρ)/2 = 1, as in the existing Check. N empty: the flow on the empty manifold is trivial | Holds; the existing Checks are unchanged |

## Ownership

No new construction is stated. The flow of a complete vector field on a finite-dimensional manifold is Tau Ceti's at the pin, and it is consumed by name. DifferentialGeometry §3.3 plans only the Banach-model extension and homogeneity, and nothing here consumes those, so this roadmap no longer depends on DifferentialGeometry.

## Notes for the maintainer

- This roadmap no longer names DifferentialGeometry as a supplier. No name that other roadmaps cite has changed.
- The review's "For the human reviewers" item (ClassicalErgodicTheory is an open pull request that is not in `merge-order/ORDER.txt`) lists no finding, so nothing was changed for it.
