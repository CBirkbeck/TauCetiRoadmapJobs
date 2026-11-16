# Repair report: RiemannianManifoldsWithConvexBoundary design, round 9

This round settles the three findings (all P3) of `REV-DESIGN-RiemannianManifoldsWithConvexBoundary~8`.
It changes `packages/RiemannianManifoldsWithConvexBoundary/design/README.md` and
`packages/RiemannianManifoldsWithConvexBoundary/design/plan.json`. `sources.toml` is unchanged
because no new source is cited and no locator changed. Nothing was added to `needs-references.toml`.

## F01 (P3) — applied

Verified. 3.1 asks for `ρ` smooth on the whole ambient `N`. On the flat torus, `d(p, ·)²` is not
differentiable at the cut point `p + (1/2, 0)`, so `R² − d(p, ·)²` is not smooth on `N`.
Old (6.4): "is a compact regular domain with strictly convex boundary which is non-trapping". New:
"is a compact regular domain of the open submanifold `B(p, r_p)` (Hausdorff, second countable and
boundaryless, with the restricted metric), with defining function `R² − d(p, ·)²`; its boundary is
strictly convex and it is non-trapping". Two sentences follow: `B(p, r_p)` is the ambient manifold,
not `N`, and second countability passes to it.

The route now names the inputs: 3.2 on `U = B(p, r_p)` with `x = d(p, ·)²`, `c = R²`, and 5.5's
Hessian criterion with `u = d(p, ·)²`. The flat-torus Check now carries the repair test:
- the one-sided derivatives `±1` of `min(s², (1 − s)²)` at the cut point;
- `ρ = 1/16 − |z|²` and `II = 4h = h/R`;
- `τ ≤ 1/2`.

In the plan, the 6.4 statement and its `flat_torus` test are changed to match.

Pattern search: all 31 occurrences of "regular domain" were read. 6.4 is the only one whose
defining function is smooth only on an open subset. 3.2 already says "regular domain of the open
submanifold `U`". The defining functions in the other places are smooth on the whole ambient
manifold:
- 6.1: `R² − |x − c|²` on `ℝⁿ⁺¹`;
- 6.3: `⟨x, p⟩ − cos R` on the sphere, and `cosh R − u` on hyperbolic space;
- 4.6: `ρ̂ + ε` on `N`;
- 5.1: `ρ ∘ π` on `SN`;
- 6.5: the ball of `ℝⁿ⁺¹`.

## F02 (P3) — applied

Verified against paternain-salo-uhlmann2023. At lines 2449–2451 the source calls a circle
`{r = r̄}` strictly convex when `r̈(0) > 0`. At lines 2456–2458 it says this is the circle as seen
from `{r = r₁}`, the larger radii. At line 2463 this happens iff `b′(r̄) > 0`. For `b(r) = r` that
is the circle 6.2 calls the strictly concave boundary of the exterior. The locator supports the
computation but uses the name from the other side.

Old: the locator alone. New: the locator followed by "in dimension two; the source names a circle
`{r = r̄}` as seen from the side of the larger radii, so for the Euclidean `b(r) = r` … its strictly
convex circle `{r = R}` is the strictly convex boundary of the ball `{r ≤ R}` and the strictly
concave boundary of the exterior `{r ≥ R}`". A new convention Check uses the unit circle at
`(1, 0)`: `r̈(0) = 1`, the exterior has `ρ = t²` and `II = −h`, the ball has `ρ = −t²` and `II = h`.

Pattern: 2.1 cites the same Definition 2.5.1 "for concavity". In the source's naming, its strictly
concave circle is a strictly concave boundary of `{r ≤ r̄}` and a strictly convex boundary of
`{r ≥ r̄}`. The same side clause was added there. The plan's locators for 2.1 and 6.2 are changed
to match, and 6.2 has the new test `side_of_the_name`.

Lemma 2.5.2 is also cited at 1.6 and twice at 6.5. Those passages concern the ball `{r ≤ r̄}`,
which is the side the source names, so the names agree and those passages are unchanged.

## F03 (P3) — applied

Verified on main (`TauCetiRoadmap/GeometricTopology/README.md`, lines 809–810). 1.1 says the
interior is a smooth boundaryless manifold whose inclusion is a homotopy equivalence; it does not
name the structure. 1.3 (line 855) builds the glued manifold "in which the two interiors embed
openly".

Old (contract): "…, with the structure for which its inclusion into `M` is a smooth open
embedding". New: 1.1 states only that the interior is boundaryless, and a separate assumption
follows. It says the structure is the open-submanifold one: the charts of `M` restricted to the
interior, with values in `{x⁰ > 0}`. For this structure the inclusion is a smooth open embedding,
and 1.3's open embeddings of the interiors use it.

3.3 keeps its wording and now says the contracts assume this structure. The plan's
GeometricTopology supplier entry now records the assumption. The other mentions need no change:
- Scope line 94 says only what 1.1 states.
- 3.3's empty-boundary Check and the 3.5 route refer back to 3.3.

## Checks run

Dependency check, exact output:

```text
candidate: RiemannianManifoldsWithConvexBoundary is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2234 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

Citation resolver (`roadmaps resolve` on the README): "Cross-roadmap citations found nowhere:
None. Lean names found nowhere: None." `plan.json` parses, and the test kind `convention` is
already used in the plan.

Style: no LaTeX delimiters were added and no machine paths. The new lines are at most 102
characters. The eight longer lines that were there before are untouched.

Lean: the design stage has no `Suggested.lean`, so there was no `#check` scratch file to
elaborate. No Lean command was run.

## Adversarial pass on the changed statements

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 6.4, regular domain of `B(p, r_p)` | flat torus, `r_p = 1/2`, `R = 1/4` | `ρ = 1/16 − |z|²`, `|dρ| = 2·(1/4) = 1/2 ≠ 0` on the circle; `II = −Hess ρ/|dρ| = 2h/(1/2) = 4h = h/R`; `τ ≤ (1/4 + 1/4)/1 = 1/2` = diameter | holds | restated (F01) |
| 6.4 on the whole torus | `d(p, ·)²` along `z = (s, 0)` | `min(s², (1 − s)²)`, derivatives `1` and `−1` at `s = 1/2` | not smooth on `N`: the old wording fails | negative Check added |
| 6.4, round sphere `S²` | `R = π/4`, `B(p, π/2)` the open hemisphere | `Hess d² = 2d·Hess d + 2 dd ⊗ dd`; on `ker d(d²)` this is `2R cot R`, and `|d(d²)| = 2R`, so `II = cot R · h = h`, as for 6.3's cap | holds | none |
| 6.4, `S¹` | `r_p = π`, `R = π/2` | `d² = θ²` on `B(p, π)`, `d(d²) = 2θ dθ ≠ 0` at `θ = ±π/2`; `τ(θ, ±1) = π/2 ∓ θ` | holds; `ker` is `0`, so convexity is vacuous | none |
| 6.4, `ℝ²` | any `R > 0` | `B(p, r_p) = ℝ²` can be taken; `ρ = R² − |x|²` is global | holds; the open-submanifold reading includes the global case | none |
| 6.4, hypotheses passed to `B(p, r_p)` | Layer 5 standing hypotheses | an open subset of a Hausdorff second-countable boundaryless `N` is all three; `τ` is intrinsic (5.2), so the ambient manifold does not change it | holds | none |
| 6.2, side clause | unit circle, `q = (1, 0)`, `v = (0, 1)` | `|q + tv|² = 1 + t²`, `r̈(0) = 1`; source (2.5.1) `r̈(0) = b b′ θ̇²/a² = 1·1·1 = 1 > 0`; exterior `Hess(|x|² − 1) = 2g`, `|dρ| = 2`, `II = −h`; ball `II = h` | names agree after the clause | clause and Check added (F02) |
| 2.1, side clause | `b(r) = r e^{φ(r²)}`, `φ(s) = −s`, `r̄ = 1` | `b′(1) = e^{−1}(1 − 2) = −e^{−1} < 0`, so the source calls the circle strictly concave; 6.5 gives the ball `II = −e^{−1} h < 0`, strictly concave here, and the exterior `+e^{−1} h` | names agree | clause added |
| GeometricTopology 1.1 assumption | `M = [0, 1]` | charts `x` and `1 − x` restricted to `(0, 1)` take values in `x⁰ > 0`; in these charts the inclusion is the identity | holds | contract restated (F03) |
| 1.1 assumption, a wrong model | `(0, 1)` with the chart `φ(x) = x` for `x ≤ 1/2` and `2x − 1/2` for `x ≥ 1/2` | the result is a smooth boundaryless manifold, but in charts the inclusion is `φ⁻¹`, with slopes `1` and `1/2` at `1/2` | not smooth, so "boundaryless manifold" alone does not fix the structure; the assumption excludes it | none further |
| 1.1 assumption, empty boundary | `M = S¹` over `𝓡∂ 1` | every point is interior, the chart values lie in `{x⁰ > 0}`, and the restricted atlas is `M`'s own | holds; 3.3's Check `M̃ = int M` is unchanged | none |
| 1.1 assumption, half-space | `{x⁰ ≥ 0}` | interior `{x⁰ > 0}` with the identity chart; 3.3's `M̃ ≅ {x⁰ > −1}` contains it openly | holds | none |

## Ownership and overlap

No new object, target or supplier was introduced. F01 restates the ambient manifold of an example,
F02 adds a side clause to a citation, and F03 moves a clause of a supplier contract into its
assumptions. The ownership settled in earlier rounds is unchanged and nothing needed checking
against open pull requests. `gaps` stays empty.

## For the maintainer

- No name that other roadmaps cite changed. The ids 2.1, 3.3, 6.2 and 6.4 are kept.
- The GeometricTopology contract now says that the open-submanifold structure on the interior is
  assumed rather than stated. A revision of GeometricTopology 1.1 could state it, and the
  assumption would then become a citation. This roadmap needs no edit there.
- No suspicious instructions were found in the review text.
