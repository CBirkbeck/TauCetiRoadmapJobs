# FIX-DESIGN-RiemannianManifoldsWithConvexBoundary~13

Findings of REV-DESIGN-RiemannianManifoldsWithConvexBoundary~12. There is one review, so finding ids are unqualified.

## F01 (P3) — applied

I verified each line against its section's statement and route. In every case the plan's edges were the right ones, so `plan.json` is unchanged:

- 4.3: "1.3, 3.1, 4.1" → "1.3, 3.1".
- 5.4: "2.1, 2.3, 4.2, 4.3, 5.1–5.3" → "1.4, 2.1, 4.2, 5.1–5.3".
- 5.5: 4.2 added.
- 6.1: 3.2 removed.

The Layer 4, 5 and 6 Dependencies sentences were changed to match.

Evidence for each edge (values in the table below):

- **4.3 does not use 4.1.** The equality `r_{∂M} = d_M(·, ∂M)` on `W' ∩ M` needs two facts:
  - Lower bound: any curve in `M` has the same length as its image in `N` (3.1, Lengths), and that length is at least `d_N(y, ∂M) = |r|`.
  - Upper bound: the normal segment lies in `M`, because `sign ρ(E(q, t)) = sign t`, and has length `r`.

  Neither fact mentions geodesics of `M`. Listing 4.1 would also put 4.3 behind 3.5.
- **5.4 uses neither 2.3 nor 4.3.**
  - The fold form needs `∂_t²h < 0` only at `(0, z₀)`. Concavity for nearby `y` comes from the continuity of the smooth `h`, not from openness of strict convexity, so 2.3 is not used.
  - In the glancing value `μ/τ̃ → II/2`, the factor `|dρ|` cancels from `h′(0) = |dρ|μ` and `h″(0) → −|dρ| II`. So the normalised `ρ̂` of 4.3 is not used.
  - 5.4's statement mentions `II`, so 1.4 is listed (plan 5.4.3 has it).
- **5.5 uses 4.2.** With `f(x, v) = du_x(v)`, `Xf = (u ∘ γ)″(0) = Hess u(v, v)`, which is 4.2's identity (plan 5.5.1).
- **6.1 does not use 3.2.** Both `II = h/R` and `II_q = D²w(0)` follow from 3.1's formula `II = −Hess ρ/|dρ|` (1.4).

**Same pattern elsewhere.** I applied the same check (every listed item lies in the closure of what the route uses) to all the dependency lines:

- 3.1's *Needs:* and its Dependencies clause said "Layer 1". That includes 1.5 and 1.6, which 3.1 does not use and which are outside plan 3.1's closure. Both now say "1.1–1.4".
- Dependencies sentences now agree with their *Needs:* lines:
  - "3.6 uses Layer 1" → "1.4–1.5".
  - "6.1 uses Layers 1–5" → the explicit list.
  - "6.2 uses Layers 1, 2, 4" → "1.4–1.5, 2.1, 4.2".
  - 1.6 gains 1.2.
  - 3.5 gains 3.1.

## Adversarial pass (changed dependency lines; no statement changed)

| Statement / edge | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 4.3, `r_{∂M} = d_M(·, ∂M)` on `W' ∩ M`, without 4.1 | unit ball, `y = 0.5e₁`; strip `[0, 1] × ℝ`, `y = (0.8, 0)`; exterior, `y = 1.5e₁` | ball: `r = 1 − 0.5 = 0.5`; the radial segment `E(e₁, t) = (1 − t)e₁`, `t ∈ [0, 0.5]`, has `ρ = 1 − (1 − t)² ≥ 0`, so it lies in `M`, and its length is `0.5 = d_N`. Strip: `r = 0.2`, segment to `(1, 0)`. Exterior: `r = |x| − 1 = 0.5` | holds by 3.1 (Lengths) and the tube sign alone | 4.1 removed from *Needs:* and Dependencies |
| 5.4, `μ/τ̃ → II/2`, without the normalised `ρ̂` (4.3) | unit ball with `ρ = 1 − |x|²` (`|dρ| = 2`); the same ball with `ρ = 2(1 − |x|²)` | Nonzero root `≈ −2h′(0)/h″(0) = −2|dρ|μ/(−|dρ| II) = 2μ/II`. Ball: `μ = −b`, `τ̃ = −2b`, ratio `1/2 = II/2`. Doubling `ρ` doubles `h′` and `h″`, and the ratio is unchanged | holds for any defining function | 4.3 removed |
| 5.4 fold form, without 2.3 | `h(t, y) = y − t²` (`K = 1`); ball fold `a = 4(b² + 1 − |x|²)` | `∂_t²h = −2` at `(0, 0)`, and it stays near `−2` for nearby `y` by continuity; ball: `∂_t²h = −2` at a glancing point, roots `−b ± √(b² + c)` | no openness or uniform bound used | 2.3 removed; 1.4 added (statement names `II`) |
| 5.5 Hessian criterion uses 4.2 | `u = |x|²/2` on the unit ball | `f = ⟨x, v⟩`, `Xf = (u ∘ γ)″ = |v|² = 1 = Hess u(v, v)`; bound `(1 − (−1))/1 = 2` | holds; the identity is 4.2's | 4.2 added |
| 6.1 `II` formulas, without 3.2 | `B̄(c, R)`; graph form `ρ = x₀ − w`; ellipse at `(a, 0)` | `−(−2g)/(2R) = h/R`; `Hess ρ = −D²w`, `|dρ| = 1`, so `II = D²w(0)`; `(2/b²)/(2/a) = a/b²` | holds from 1.4 and 3.1 alone | 3.2 removed |
| 3.1 uses 1.1–1.4 only | ball written with `ρ` and with `e^{x₁}ρ` | outward iff `⟨x, v⟩ > 0` (1.1); `dj(ν_in) = −x` (1.2); `ρ ∘ j` is a defining function (1.3); `II = h` (1.4). The metric is unchanged, so no conformal law (1.6) and no `H` (1.5) are needed | holds | "Layer 1" → "1.1–1.4" |

Script check (section level, comparing each README line with the plan's target-level prerequisites):

- *Needs:* lines: for every section 1.1–6.5, no README item lies outside the closure of the plan's prerequisites, and every direct plan prerequisite appears in the README line. Before this round, 3.1, 4.3, 5.4, 5.5 and 6.1 failed.
- Dependencies paragraphs: every clause agrees with its *Needs:* line. My parser still flags 1.2's clause, but that is a parsing artifact: it drops "and 1.1" after a roadmap name, and the text does list 1.1.

## Checks run

Dependency check (exact output):

```text
candidate: RiemannianManifoldsWithConvexBoundary is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 244 roadmaps, 2236 edges, 0 problem(s)
```

- There is no UPWARD, CYCLE or `moved:` line.
- I re-ran the citation resolver on the edited README. It reports no unresolved cross-roadmap citation and no Lean name found nowhere.
- `plan.json` is unchanged and parses.
- There is no `Suggested.lean` at the design stage. Nothing was elaborated, and the `#check` binder audit had nothing to inspect.

## Notes for the maintainer

- Only internal dependency lines changed. No statement, section number, target id, declaration name, supplier citation or source changed, and `sources.toml` is unchanged.
- No other roadmap is affected.
- Nothing new is stated, so no ownership question arises.
- The review's "For the human reviewers" item (the author-page licence of paternain-salo-uhlmann2023) is left to the humans.
