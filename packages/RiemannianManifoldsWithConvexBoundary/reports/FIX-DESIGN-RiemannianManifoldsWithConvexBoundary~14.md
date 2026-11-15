# FIX-DESIGN-RiemannianManifoldsWithConvexBoundary~14

One review (`REV-DESIGN-RiemannianManifoldsWithConvexBoundary~13`), one finding. The review's
"For the human reviewers" section (licence of the author-page copy of paternain-salo-uhlmann2023)
lists no finding and changed nothing.

## F01 (P3) — applied

The finding is right. With a variable tube radius `ε : ∂M → (0, ∞)` (allowed by 4.3 for non-compact
or disconnected `∂M`), the form `h_r` exists at `q` only for `|r| < ε(q)`, so for fixed `r` it is a
metric on the open set `{q : ε(q) > |r|}`, not on all of `∂M`. The review's own strip witness
confirms it: `ε = 0.9` on `{x = 0}`, `ε = 0.01` on `{x = 1}`, and at `r = 0.5` the tube has no
point over `{1} × ℝ`.

Change, README 4.4, third bullet: "with `(h_r)` a smooth family of Riemannian metrics on `∂M` and
`h_0 = h`" → `h_r(u, u') := g(dE_{(q, r)}(u, 0), dE_{(q, r)}(u', 0))`, defined for `|r| < ε(q)`, an
inner product on `T_q∂M` smooth in `(q, r)`. For each `r` it is a metric on the open set
`{ε(q) > |r|}`, which is all of `∂M` when `ε` is constant. `h_0 = h`. The fourth bullet now says
that the derivative is taken at each `q` on `(−ε(q), ε(q))`. The strip Check gains the
`r = 0.5` instance. Plan target 4.4 and its `unequal_strips` test were changed in the same way.

I made one change beyond the review's wording: `h_r` now has an explicit formula. The review's
text only says "an inner product … depending smoothly". The formula pins down the object and
explains positive definiteness, because `dE_{(q, r)}` is injective on the tube.

Pattern search: I grepped the README and plan for every other `h_r`, "family of", "metrics on",
and for level sets indexed by `r`.
- Summary (line 15–16) and Scope (line 100) name `dr² + h_r` and `II = −½ ∂_r h_r|₀` without
  claiming a metric on all of `∂M`, so they are unchanged.
- 4.6 uses constant radii (compact `∂M`), so it is unaffected.
- 2.3's `(g_s)` is a family of metrics on `M` indexed by a parameter manifold, which is a
  different object.

No other occurrence.

## Adversarial pass on the changed statement

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| `E*g = dr² + h_r`, `h_r(u, u') = g(dE(u, 0), dE(u', 0))` | ball radius `R`, `ε < R`; exterior of unit ball, `ε < 1`; cap `{φ ≤ φ₀}` | ball: `dE_{(q, r)}(u, 0) = (1 − r/R)u`, `h_r = (1 − r/R)² h_0 > 0` for `ǀrǀ < R`, `0` only at `r = R` (outside the tube); exterior: `(1 + r)² h_0 > 0` for `ǀrǀ < 1`; cap: `a² ds²`, `a = sin(φ₀ − r)/sin φ₀`, zero at `r = φ₀` and `r = φ₀ − π`, so positive exactly on `ǀrǀ < min(φ₀, π − φ₀)`, which is the injectivity range | holds; positive definiteness is the injectivity of `dE` | applied |
| domain of `h_r` for fixed `r` | strip `M = [0, 1] × ℝ`, `ε = 0.9` / `0.01`, `r = 0.5`, `r = 0.005`, `r = 0` | `r = 0.5`: `{ε > 0.5} = {0} × ℝ`, `h_{0.5} = dy²` there; `r = 0.005`: both lines, `h = dy²`; `r = 0`: both lines, `h_0 = dy² = h` | metric on `{ε(q) > ǀrǀ}`, all of `∂M` only for `ǀrǀ < 0.01` | applied (Check extended) |
| `h_0 = h` | general | `E(q, 0) = q`, so `dE_{(q, 0)}(u, 0) = dι(u)` and `h_0(u, u') = g(dι u, dι u') = h(u, u')` on all of `∂M` (every `ε(q) > 0`) | holds | none |
| `II = −½ ∂_r h_r` at `r = 0`, pointwise | ball; exterior; strip; cap | `−½(−2/R)h_0 = h_0/R`; `−½(2)h_0 = −h_0`; `−½·0 = 0`; `−a·a_r(0) = cos φ₀/sin φ₀ = cot φ₀` (6.3's `cot R` at `R = φ₀`) | all agree with 1.4's `II` (positive on the ball for `ν_out`) | wording only |
| degenerate `n = 0` | `∂M` discrete | `T_q∂M = 0`, `h_r` the zero form on the zero space (an inner product), `E*g = dr²` | holds; the existing Check stands | none |
| plausible wrong model: a metric on all of `∂M` for `ǀrǀ < inf ε` | non-compact `∂M` with `ε → 0` at infinity | `inf ε = 0`, so no `r ≠ 0` would be admissible and the statement would say nothing off `r = 0` | the pointwise domain avoids this | applied |

Smoothness: `E` is smooth on the open tube `{(q, r) : ǀrǀ < ε(q)}` and `g` is smooth, so `h_r(q)` is
a smooth section, over the tube, of the pullback of the bundle of symmetric bilinear forms on `T∂M`
along `(q, r) ↦ q`. `{q : ε(q) > ǀrǀ}` is open because `ε` is continuous.

## Checks run

Dependency check, exact output:

```text
candidate: RiemannianManifoldsWithConvexBoundary is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 243 roadmaps, 2247 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

- `design/plan.json` was re-parsed as JSON after the edit.
- I searched the README for LaTeX delimiters (`\(`, `\[`, `$`): none.

## Notes for the maintainer

- There is no `Suggested.lean` at the design stage, so no `#check` binder audit applies and no Lean
  command was run.
- No supplier, citation, target id or Lean name changed. No `*Needs:*` line or prerequisite
  changed. No gap was declared.
- Ownership is unchanged: no new construction was introduced.
- No source was fetched and `sources.toml` is unchanged.
- No other roadmap cites the changed clause.
