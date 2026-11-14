# FIX-DESIGN-FinitenessAndDualityOfGroups~8

The review `REV-DESIGN-FinitenessAndDualityOfGroups~7` lists one finding, F01 (P2). Its text calls the repair R01; that is the same item and is settled here. The `## For the human reviewers` section lists no finding (it concerns the uncertified sources BrownGTM87, Farrell1977, EilenbergGanea1957, Wall1961 and Serre1971Prospects), so nothing was changed because of it.

## F01 (P2) — applied

Verified: the sentence "a path-connected CW complex without `1`-cells is a point" is false. `S²` with one `0`-cell and one `2`-cell is path-connected, has no `1`-cells and has `H₂(S², ℤ) = ℤ`, while a point has `H₂ = 0`. The theorem `gd G = 0 ↔ G = 1` was correct; only its justification was wrong.

Old → new (README 5.1 API bullet): "a path-connected CW complex without `1`-cells is a point" → "a `K(G, 1)` is nonempty and path-connected (both are part of `TauCeti.IsAspherical`), a CW complex with no cells of positive dimension is discrete, so a nonempty path-connected one has exactly one `0`-cell and is a point with trivial fundamental group; conversely the point is a `K(1, 1)`."

New README 5.1 Check, also added to plan.json as test `5.1/no_one_cells_not_point` (non-example): `S²` with cells in degrees `0, 2` has no `1`-cells but `H₂ = ℤ ≠ 0`, and it is not a `K(1, 1)` since `π₂(S²) ≅ ℤ`. The two-point discrete space is zero-dimensional but not path-connected.

The plan's `eq_zero_iff` API statement ("gd G = 0 iff G is trivial.") is unchanged, as the reviewer asked. Because the new bullet relies on `TauCeti.IsAspherical`, I added it to the 5.1 *Needs:* line and to plan prerequisites. It was already in the Tau Ceti supplier contract (README line 300).

How I checked the new justification at the pins:
- `TauCeti.IsAspherical X x := PathConnectedSpace X ∧ ∀ n, Subsingleton (π_(n+2) X x)` (`TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean` line 59). `TauCeti.IsEilenbergMacLaneSpaceOne` is `IsAspherical X x ∧ Nonempty (FundamentalGroup X x ≃* G)` (same file, line 123).
- Mathlib's `PathConnectedSpace` has a `nonempty` field (`Mathlib/Topology/Connected/PathConnected.lean` line 579).
- Discreteness uses Mathlib's classical CW axiom `closed'`: a set is closed when it meets every closed cell in a closed set (`Mathlib/Topology/CWComplex/Classical/Basic.lean` line 126). It also uses `RelCWComplex.closedCell_zero_eq_singleton` (same file, line 392).
- With only `0`-cells, every closed cell is a singleton. A singleton is closed in a Hausdorff space, so every subset is closed and the space is discrete. A nonempty path-connected discrete space is one point, and its `π₁` is trivial.

Same pattern elsewhere: I searched the README for every other claim of the form "a path-connected / simply connected complex is …", for "is a point", for skeleton claims and for `1`-cell counts (lines 245, 294, 299, 335, 427, 582, 1126, 1142–1146, 1152, 1167, 1217–1219, 1242). None draws a conclusion from absent `1`-cells:
- 5.3 says the `(n − 1)`-skeleton carries `π₁` for `n − 1 ≥ 2`. That is correct: the `2`-skeleton determines `π₁`.
- The 5.2 Check that a nontrivial finite group has no finite-dimensional `K(G, 1)` is correct.
- 5.4's point `W` with `Γ = 1` is a genuine `0`-dimensional complex.

The plan contains no other occurrence.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 5.1 `gd G = 0 ↔ G = 1`, new justification | `G = 1` with `X` a point | one `0`-cell, `π₁ = 1`, `πₙ = 0` for `n ≥ 2`, so it is a `K(1, 1)` and `gd 1 = 0` | holds |
| same | `G = ℤ/2`, `ℤ` | a `0`-dimensional path-connected `X` is a point with `π₁ = 1 ≠ G`, so `gd ≥ 1` | holds; `gd ℤ = 1` (circle), `gd ℤ/2 = ⊤` (5.1 Check) |
| same, premise "no positive-dimensional cells" against "no `1`-cells" | `S²` = `e⁰ ∪ e²` | `1`-cells: 0; `H₂ = ℤ` against `H₂(pt) = 0`; `π₂ = ℤ`, so not aspherical | old premise false; new premise excludes `S²` |
| same, path-connectedness | two-point discrete space | dimension 0; `π₀` has 2 elements; `PathConnectedSpace` fails, so no `K(G, 1)` | excluded by `TauCeti.IsAspherical` |
| same, empty space | `X = ∅` | no base point `x`; `PathConnectedSpace.nonempty` fails | excluded twice |
| same, contractible complex without `1`-cells | `D³ = e⁰ ∪ e² ∪ e³` | `1`-cells: 0; contractible, so a `K(1, 1)` of dimension 3, not a point | consistent: `gd` is a least dimension, and the point attains 0 |
| New Check: `π₂(S²) ≅ H₂(S², ℤ)` | Hurewicz for the simply connected `S²` | `π₁ = 1` (no `1`-cells, one `0`-cell); `H₂ = ℤ`, so `π₂ = ℤ` | holds |

## Checks run

Dependency check (command from the brief), output:

```text
candidate: FinitenessAndDualityOfGroups is not in the merge order yet; checked as if placed after CohomologyOfGroups (the intake inserts it when its design is accepted)
depcheck: 244 roadmaps, 2201 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. `plan.json` still parses as JSON, and its indentation and key order are unchanged; the diff contains only the new prerequisite and the new test.

This is the design stage, so there is no `Suggested.lean` and nothing was elaborated or `#check`ed. No Lean name was added, renamed or deleted.

## For the maintainer

- No new targets, gaps, sources or supplier edges. `sources.toml` is unchanged, and no source was fetched or requested.
- No name that another roadmap cites has changed. The only text changes are one API bullet and one new Check in 5.1, plus one `*Needs:*` item.
- Ownership against open pull requests was not re-examined, because this change adds no construction. The review's ownership table stands.
