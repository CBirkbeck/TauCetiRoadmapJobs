# FIX-PKG-MathematicalBilliards~6

This round settles the single finding of `REV-PKG-MathematicalBilliards~5` (package, round 6). Only `packages/MathematicalBilliards/README.md` changed, in §10.3 (one API bullet, one Check rewritten, one Check added). `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged:
- Layer 10 has no Lean counterpart, so no Lean statement is affected;
- no source is added (the §10.3 locator, ChaikaForni2026 lines 83–88, is unchanged, and the cone-area formula is labelled as this roadmap's own computation);
- no supplier gap is needed.

## F01 (P2) — applied

The finding is correct. For `r < 0` the set `{|φ| < r}` is empty, so its area is `0`. But `π r^{2k}/k > 0`, because `2k` is even and `k ≥ 1`. The reviewer's witness is the unit-square torus with one marked point, `k = 1`, chart radius `1/2` and `r = −1/4`: the area is `0`, while `π r²` is `π/16`.

Change (§10.3, API): "for `r` at most the radius of the disc onto which `φ` maps, the set `{|φ| < r}`" → "whose target is the disc of radius `R` centred at `0`, for every real `r` with `0 ≤ r ≤ R` the set `{x ∈ source φ : |φ(x)| < r}`".

New Check: the reviewer's marked torus, with values at `r = 0, 1/4, 1/2`. It includes two negative controls:
- `r = −1/4` shows that `0 ≤ r` is needed;
- `r = 1 > R` gives area `π/4`, not `π`, so `r ≤ R` is needed.

**Pattern repaired.** The octagon Check in §10.3 substitutes `r = (3ρ)^{1/3}`. This depends on the same range of the radius, which the Check did not state. It now reads "for `0 ≤ ρ ≤ R³/3`". The reason is in the text: a path that leaves the chart has flat length at least `R³/3`. So `r` lies in `[0, R]`, and the flat ball of radius `ρ` is `{|φ|³/3 < ρ}`.

I searched the README for other real parameters that have only an upper bound:
- §7.3, "finite reflections on `[0, t]` with `t < t₊`" (line 592): the claim holds vacuously for `t < 0`, since `[0, t]` is then empty;
- §1.3 (line 130) and §10.5 already state `r > 0`;
- §5.1 (line 385) states `a < a′ ≤ b′ < b`.

None of these needs a change.

## Checks run

- **Elaboration.** I ran `lake env lean` on `packages/MathematicalBilliards/Suggested.lean` (absolute path) from the content checkout. It exits 0. The only output is seven `declaration uses sorry` warnings, at lines 154, 193, 209, 235, 257, 268 and 287. The one `TauCeti.*` import, `TauCeti.Analysis.Semigroups.Group.Unitary`, already had its object file, so nothing was built.
- **Binders.** I made a scratch copy of `Suggested.lean` with `#check @name` for all 16 declarations and the six `ConvexTable` fields. I elaborated it once (exit 0) and compared each type with its README statement. Every binder is present:
  - `[Fact (0 < ℓ)]` on every table declaration and on `phaseMeasure`;
  - `2 ≤ k` on `ConvexTable.measurePreserving_billiardMap` and `ConvexTable.exists_lipschitzWith_of_isRotationalInvariantCurve`, and absent from `ConvexTable.exists_two_periodic_orbits` (whose README statement assumes only `k ≥ 1`);
  - `0 < ℓ`, `a < b`, the lift relation, the twist disjunction, the non-wandering hypothesis and the open-annulus hypothesis on `isGraph_of_isRotationalInvariantCurve`;
  - `0 < p`, `p < q` and `p.Coprime q` on `ConvexTable.exists_two_periodic_orbits`;
  - `[CompleteSpace H]` and `U.IsUnitary` on `exists_tendsto_twistedAverage`;
  - `[IsFiniteMeasure σ]` on `tendsto_average_norm_charFun_sq`;
  - `[MeasurableVAdd₂ ℝ X]`, `[IsProbabilityMeasure μ]` and `[VAddInvariantMeasure ℝ X μ]` on `isWeaklyMixing_iff`.

  Nothing changed, since `Suggested.lean` was not edited. I deleted the scratch file afterwards.
- **Dependency check** (`tauceti-roadmap … gate --depcheck … --name MathematicalBilliards --movable`):

```text
depcheck: 232 roadmaps, 2071 edges, 0 problem(s)
```

There are no UPWARD, CYCLE or `moved:` lines.

- **Gate failures listed in the brief:** none.

## Ownership

The repair adds no new object. It narrows the parameter range of a formula about this roadmap's own `area_X` (§10.3). The citation resolver's six leads are the six `ConvexTable.*` names that `Suggested.lean` declares. They are not missing suppliers. The overlap report lists:
- no pull request that changes this roadmap;
- no dropped id;
- no id that only an open revision defines.

I checked ownership against open pull requests only through the indexed heads that the tools list.

## Adversarial pass

"Torus" means `ℂ/(ℤ + iℤ)` with one marked point (`k = 1`), with the cone chart given by the translation coordinate onto the disc of radius `R = 1/2`.

| Statement | Instances tried | Values computed (set area vs formula) | Result |
|---|---|---|---|
| Cone-chart area, `0 ≤ r ≤ R` | torus, `r = −1/4, 0, 1/4, 1/2, 1` | `r = −1/4`: `0` vs `π/16`, now excluded by `0 ≤ r`. `r = 0`: `0` vs `0` (`0^{2k} = 0` because `2k ≥ 2`). `r = 1/4`: `π/16` vs `π/16`. `r = 1/2`: `π/4` vs `π/4`. `r = 1`: the set is the whole source, `π/4` vs `π`, excluded by `r ≤ R` | sound with the new hypothesis |
| The same, `k = 2` and `k = 3` | the density `|w|^{2(k−1)}` integrated | `k = 2`: `∫₀^r 2πρ³ dρ = πr⁴/2 = πr^{2k}/k`. `k = 3`: `∫₀^r 2πρ⁵ dρ = πr⁶/3`. `k = 0` is excluded by `k_p ≥ 1` in §10.2, so there is no division by zero | sound |
| Radius `R` of the torus chart is admissible | the unit-square torus | Two points of an open disc of radius `1/2` are less than `1` apart, and every nonzero vector of `ℤ + iℤ` has length `≥ 1`, so the chart is injective. Its area is `π/4 ≈ 0.785 < 1 = area_X(X)` | consistent with the finiteness API |
| Octagon Check, `0 ≤ ρ ≤ R³/3` | `ρ = 0`, `ρ = 0.1` (needs `R ≥ 0.3^{1/3} ≈ 0.669`), `ρ = R³/3` | `ρ = 0`: `r = 0`, both sides `0`. `ρ = 0.1`: `r⁶ = 0.09`, `πr⁶/3 = 0.03π ≈ 0.0942478`; eight sectors give `8 · (3π/4) · 0.01/2 = 0.03π`. `ρ = R³/3`: `r = R`, `πR⁶/3 = 3π(R³/3)²` | sound |
| Flat ball `= {|φ|^k/k < ρ}` inside the chart | `f = |w|^k/k`, `k = 3` | Locally `f = |ζ|` in the translation coordinate `ζ = w^k/k`, so `f` has flat gradient norm `1`. A path from the cone point to `x` inside the chart has length `≥ f(x)`, and the radial segment attains it. A path that leaves the chart has length `≥ R^k/k ≥ ρ` | sound |
| Wrong formulas in the octagon Check | `πr²`, `π r^{2k}` at `k = 3` | `π(3ρ)^{2/3}` and `9πρ²`; at `ρ = 0.1`, `≈ 1.4096` and `≈ 0.2827`, against `≈ 0.0942` | still discriminating |

Generality: the README statement is now exactly the range on which the formula holds (`0 ≤ r ≤ R`, with both endpoints included). Layer 10 has no Lean counterpart. The module docstring of `Suggested.lean` already explains why the translation-surface statements are not stated: they lack a carrier at the pins.

## For the maintainer

- No Lean name changed, was added or was removed.
- No cross-roadmap citation changed, and no section, layer or target id changed, so no other roadmap is affected.
- No source was fetched or added. `needs-references.toml` was not written.
- The review text contains no suspicious instructions.
