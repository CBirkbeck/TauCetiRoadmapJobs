# FIX-PKG-MathematicalBilliards~5

This round repairs the single finding of `REV-PKG-MathematicalBilliards~4` (package, round 5). Only `packages/MathematicalBilliards/README.md` changed, in one paragraph (§10.5). `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged:
- no Lean statement is touched;
- no source is added (the MasurTabachnikov2002 locator still covers the statement);
- no supplier gap is needed.

## F01 (P3) — applied

The finding is correct. The §10.5 route used a universal cover, its deck group and the criterion "a complete local isometry is a covering". None of these appears in the *Needs:* line (§10.2, §10.4), in the supplier contracts or in the Layer 10 dependencies.

Change (§10.5): the developing-map route ("after forgetting … lattice of translations") is replaced by a route that builds an action of `ℂ` out of the directional flows of §10.4. The parenthetical "the chart-completeness route below" becomes "the route below through an action of `ℂ`". The *Needs:* line and the three Checks are unchanged.

I checked every step of the reviewer's route and kept it, with three small changes:
- **`k = 1` cone charts.** The new route gives a one-line reason why such a chart is a translation chart. Its transitions with translation charts are translations off one point (`φ(p) = 0`), so by continuity they are translations everywhere. Two cone charts are handled the same way.
- **Negative times.** The new route says why `ψ_{tθ} = φ_θ^t` also holds for `t < 0`: `φ_{−θ}^s` and `φ_θ^{−s}` are both translation by `−sθ` in charts. The reviewer's text claimed "carries `z ↦ z + tθ` to `φ_θ^t`" for all `t` without this.
- **"`Λ` is a lattice".** The new route proves it. The quotient `ℂ/Λ` is compact, so `Λ` spans `ℂ` over `ℝ`: a nonzero real linear form vanishing on `Λ` would descend to a continuous surjection of `ℂ/Λ` onto `ℝ`. A discrete subgroup that spans is a lattice, in the standard sense, which is also Mathlib's `IsZLattice`.

The route still uses only:
- §10.2: `X` compact, connected and Hausdorff; the translation atlas; the cone charts;
- §10.4: the glued flow is `u ↦ u + tθ` in every translation chart while the segment stays in the chart's target; the group law of one directional flow;
- general topology: finite subcovers, open orbits in a connected space, the quotient topology of `ℂ/Λ`.

**Pattern searched.** I searched the whole README for any other proof route whose inputs have no owner: universal cover, developing map, covering criterion, fundamental group, lifting, monodromy, invariance of domain, Brouwer, Baire, Lebesgue number, discrete subgroups, classification. Lines 222, 312 and 324 use "deck translation" for the period translation `τ_ℓ` of the strip, which is defined in §2.4 and §4.1. Line 86 is the GeometricTopology §1.7 contract. No other route uses an input that has no owner.

## Checks run

- **Elaboration.** `lake env lean packages/MathematicalBilliards/Suggested.lean`, run from the content checkout. It exits 0. The only output is seven `declaration uses sorry` warnings, at lines 154, 193, 209, 235, 257, 268 and 287. The one `TauCeti.*` import (`TauCeti.Analysis.Semigroups.Group.Unitary`) already had its object file, so nothing was built.
- **Binders.** I made a scratch copy of `Suggested.lean` with `#check @name` for all 16 declarations, elaborated it once (exit 0), and compared each type with its README statement. Every binder is present:
  - `[Fact (0 < ℓ)]` on every table declaration and on `phaseMeasure`;
  - `2 ≤ k` on `ConvexTable.measurePreserving_billiardMap` and `ConvexTable.exists_lipschitzWith_of_isRotationalInvariantCurve`, and absent from `ConvexTable.exists_two_periodic_orbits` (README: `k ≥ 1`);
  - on `isGraph_of_isRotationalInvariantCurve`: `0 < ℓ`, `a < b`, the lift relation, the twist disjunction, the non-wandering hypothesis and `C` in the open annulus;
  - `0 < p`, `p < q` and `p.Coprime q`;
  - `[CompleteSpace H]` and `U.IsUnitary`;
  - `[IsFiniteMeasure σ]`;
  - `[MeasurableVAdd₂ ℝ X]`, `[IsProbabilityMeasure μ]` and `[VAddInvariantMeasure ℝ X μ]`.

  Nothing changed, since `Suggested.lean` was not edited. The scratch file was deleted afterwards.
- **Dependency check** (`tauceti-roadmap … gate --depcheck … --name MathematicalBilliards --movable`):

```text
depcheck: 237 roadmaps, 2139 edges, 0 problem(s)
```

There are no UPWARD, CYCLE or `moved:` lines.

- **Gate failures listed in the brief:** none.

## Ownership

The new route introduces no new object. The action `ψ` of `ℂ` is built inside §10.5 from this roadmap's own §10.4 flows, and the developing map is no longer used.

I searched the open heads and main by object with `roadmaps grep -i --readme-only 'translation surface|developing map|directional flow'`. No hit owns translation surfaces or their directional flows:
- UnboundedOperators has one worked example of a translation surface (Nelson's counterexample).
- TeichmullerGeometry's hit concerns marked Riemann surfaces.
- The developing maps in GeometricTopology, Yamabe, ScatteringDiagrams and IntegrableSystems belong to other geometries. This roadmap no longer needs them.

I checked ownership against open pull requests through the indexed heads listed by the tool. The overlap report lists no pull request that changes this roadmap, no dropped id and no id defined only by an open revision.

## Adversarial pass

The table has one row per changed statement or step of §10.5, plus the three unchanged Checks recomputed. "Torus" means `ℂ/(ℤ + iℤ)`.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| A cone chart with `k = 1` is a translation chart | torus marked at `[0]`, chart `z ↦ z` on the disc of radius `1/2`; negative control `k = 2` | `k = 1`: the transition with each translation chart is the identity off `0`, so it extends across `0` with derivative `1`. `k = 2`: the transition is `w ↦ w²/2`, with derivative `w` (`0.1` at `w = 0.1`, not `1`), so it is not a translation chart, as §10.2 intends | sound |
| A uniform chart radius `r` exists by compactness | torus with `r = 1/2`; `r = 0.6`; hexagonal torus `ℂ/(ℤ + exp(iπ/3)ℤ)` | Two points of an open disc of radius `1/2` are less than `1` apart, and every nonzero lattice vector has length `≥ 1`, so the projection is injective. At `r = 0.6`, `0.55` and `−0.45` lie in `D(0, 0.6)` and differ by `1 ∈ Λ`, so injectivity fails. Hexagonal: the shortest nonzero vector has length `1`, so `r = 1/2` works | sound |
| `ψ_z ∘ ψ_w = ψ_{z+w} = ψ_w ∘ ψ_z` for `|z| + |w| < r` | torus, `z = 0.2`, `w = 0.2i` | `|z| + |w| = 0.4 < 0.5`. Both composites are `[x + 0.2 + 0.2i]`, because the segment from `x` stays in `D(x, 0.4)` | sound |
| Extension to all `z`, `w` through `n` | torus, `z = 3 + 2i`, `w = −1 + i`, `n = 12` | `|z| = 3.606` and `|w| = 1.414`, sum `5.020 < 6 = 12 · 1/2`. `|z/12| + |w/12| = 0.300 + 0.118 = 0.418 < 0.5`. `(ψ_{z/12} ∘ ψ_{w/12})^{12} = [x + 2 + 3i] = ψ_{z+w}` | sound |
| `ψ_{tθ} = φ_θ^t` for `t < 0` | `θ = 1`, `t = −0.3` | `ψ_{−0.3} = φ_{−1}^{0.3}` is translation by `−0.3`, and `φ_1^{−0.3}` is translation by `−0.3` | sound |
| The orbit map is a local homeomorphism, so there is one orbit | torus; negative control: two disjoint tori | Near `z₀`, `ψ_z x = φ_y⁻¹(φ_y(y) + z − z₀)` with `y = ψ_{z₀}x`, a homeomorphism of `D(z₀, 1/2)` onto a chart domain. The disjoint union has two open orbits; connectedness in §10.2 excludes it | sound |
| The stabiliser is constant and discrete | torus; hexagonal torus | The torus stabiliser is `ℤ + iℤ` at every point, and meets `|z| < 1/2` only in `0`. Hexagonal: the stabiliser is `ℤ + exp(iπ/3)ℤ`, with smallest nonzero norm `1 > 1/2`. A non-trivial stabiliser element `z` with `|z| < r` would give `φ_x⁻¹(φ_x(x) + z) = x`, contradicting injectivity of `φ_x` | sound |
| Compactness forces `Λ` to span, so `Λ` is a lattice | negative controls `Λ = ℤ` and `Λ = 0` | `Λ = ℤ`: the form `Im` vanishes on `ℤ` and descends to a surjection `ℂ/ℤ → ℝ`, so `ℂ/ℤ` (a cylinder) is not compact. `Λ = 0`: `ℂ` is not compact. Both are excluded by compactness of `X` | sound |
| `ℂ/Λ → X` is a translation in charts and carries `z ↦ z + tθ` to `φ_θ^t` | torus marked at `[0]` | The map is the identity of the torus. `ψ_{z + tθ}x = ψ_{tθ}(ψ_z x) = φ_θ^t(ψ_z x)`. The marked point `[0]` corresponds to `0 + Λ` | sound |
| Check: `Λ = 2ℤ + 2iℤ` has area `4` | recomputed | covolume `|det [[2, 0], [0, 2]]| = 4`; four unit squares give `4 · 1 = 4` (§10.3 Check) | unchanged |
| Check: `θ = 1` on the torus | recomputed | `[x + t] = [x]` exactly when `t ∈ ℤ`, so each leaf closes first at `t = 1`, with length `1` | unchanged |
| Check: torus with one marked point | recomputed through the new route | Forgetting the point gives `Σ = ∅`, `ψ_z[x] = [x + z]`, a single orbit and `Λ = ℤ + iℤ`. The isomorphism is the identity, with the marked point `[0]` | unchanged |

Generality: the README statement of §10.5 is unchanged. Layer 10 has no Lean counterpart. The module docstring of `Suggested.lean` already gives the missing carrier for the translation surfaces as the reason they are not statable at the pins.

## For the maintainer

- No Lean name changed, was added or was removed. No cross-roadmap citation changed, and no section, layer or target id changed.
- The replaced route no longer uses `TauCeti.UniversalCover` or a covering criterion, so no supplier contract or gap is needed for them.
- No suspicious instructions were found in the review text.
