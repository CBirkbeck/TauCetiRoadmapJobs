# FIX-DESIGN-RiemannianManifoldsWithConvexBoundary~15

One review (`REV-DESIGN-RiemannianManifoldsWithConvexBoundary~14`), two findings, both P3. The
review's "For the human reviewers" section (licence of the author-page copy of
paternain-salo-uhlmann2023) lists no finding and changed nothing.

## F01 (P3) — applied

The finding is right. 3.2 required `dx ≠ 0` on all of `U` for both notions and for the sublevel
statement. 6.4 applies 3.2 with `x = d(p, ·)²` on `U = B(p, r_p)`, where `dx_p = 0`. 6.3 applies it
to the hyperbolic `u`, where `du = 0` at `(0, 1)` (`u_x = x/y = 0`, `u_y = ½ − 1/2 = 0`). Shrinking `U`
to the set where `dx ≠ 0` would turn `{x ≤ c}` into a punctured ball, which is not compact.

Old → new, README 3.2:
- The notion at `y` now needs only `dx_y ≠ 0`.
- The notion on `U` now says "`dx ≠ 0` on `U` and this holds at every `y`".
- The first bullet now assumes `c` is a regular value (`dx ≠ 0` on `{x = c}`), and states that
  `{x ≤ c}` is a regular domain of `U` with defining function `c − x` (3.1).
- The first Check now works on all of `ℝⁿ⁺¹` and covers the critical value `c = 0` and the
  punctured ball on `ℝⁿ⁺¹ ∖ {0}`.
- The dimension-one Check is now pointwise.

Plan target 3.2 changed in the same way: statement, hypothesis, the two `secondFundamentalForm_*` API
entries, and the tests `norm_squared` and `dimension_one`.

Pattern search covered every use of 3.2 and every "`dx ≠ 0`" in the README and the plan.
- **Conventions, "Level-set concavity".** The same `dx ≠ 0` standing hypothesis and the same
  `ℝⁿ⁺¹ ∖ {0}` witness appeared here. Both are now pointwise, with the witness on `ℝⁿ⁺¹`.
- **6.3 hyperbolic balls.** The route now states `|du|² = u² − 1`. This makes `cosh R` a regular
  value with `|du| = sinh R`, so `II = cosh R/sinh R`. The hyperbolic-plane Check gains the values
  at `(0, 2)` and `(0, 1)`. Plan 6.3.2's statement and its `hessian_plane` test agree.
- **6.4.** The route now says that 3.2's sublevel statement is applied with the regular value `R²`,
  and that `dx` vanishes at `p`.
- **4.5 and 4.6 need no change.** 4.5 asserts `dx̃ ≠ 0` on `U` and uses the notion on `U`. 4.6's
  "3.2 for `x = −ρ̂`" uses `c = δ`, a regular value because 4.6 already states that `−δ` is a regular
  value of `ρ̂`. Under the old text, 4.6 would have needed `dρ̂ ≠ 0` on all of `N`; it now needs
  nothing more.

No statement of 6.3 or 6.4 changed its conclusion.

## F02 (P3) — applied

The finding is right. The half-space and the exterior are Riemannian manifolds with boundary only
through 3.1's construction. Their `II` (`0` and `−h/R`) is 3.1's ambient formula
`II_{D_ρ} = −Hess^N ρ/|dρ|` with `Hess ρ = 0, |dρ| = 1` and `Hess ρ = 2g, |dρ| = 2R`.

Old → new:
- README 6.2: "*Needs:* 1.4, 1.5, 2.1, 4.2, 5.2." → "*Needs:* 1.4, 1.5, 2.1, 3.1, 4.2, 5.2."
- Layer 6 Dependencies: "6.2 uses 1.4–1.5, 2.1, 3.1, 4.2 and 5.2".
- Plan 6.2: adds `target:3.1`.

Pattern search covered every `*Needs:*` line and every plan target that evaluates `II` through an
ambient `Hess ρ/|dρ|`.
- **4.2.** `(ρ ∘ γ)''(0) = −|dρ_q| II_q(u, u)` and `(ρ ∘ γ)' = |dρ|⟨ν_in, γ'⟩` are 3.1's third bullet,
  but 4.2 listed 3.1 only through 4.1. Added 3.1 to the README *Needs:* line, the Layer 4
  Dependencies and plan 4.2.1.
- **Plan 6.3.2.** It lacked `target:3.1`, which README 6.3 already lists. Added.
- **No other omission.** 4.5, 6.1, 6.3, 6.4 and 6.5 list 3.1.

3.1 precedes all three users, and none of 3.1's prerequisites depends on them, so no order changes.
The plan script found 49 targets, every `target:` prerequisite earlier than its user, and `gaps: []`.

## Adversarial pass on the changed statements

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 3.2 notion at `y` (`dx_y ≠ 0`) | `x = ǀzǀ²` on `ℝ²` at `y = (1, 0)` and `y = 0`; SUV `x = ǀz − z₀ǀ`; wrong model "Hess positive on all of `T_y`" | `ker dx_y = ⟨e₂⟩`, `Hess x(e₂, e₂) = 2 > 0`; at `0`: `dx_0 = 0`, excluded; SUV: `Hess x = (g − dx⊗dx)/r`, `0` on the radial vector, `1/r` on `ker dx` | holds; the wrong model would reject SUV's example | applied |
| notion on `U` | `ǀzǀ²` on `ℝⁿ⁺¹` and on `ℝⁿ⁺¹ ∖ {0}`; 4.5's `x̃` | fails on `ℝⁿ⁺¹` (`dx_0 = 0`), holds on `ℝⁿ⁺¹ ∖ {0}`; 4.5 asserts `dx̃ ≠ 0` on `U` | holds | applied |
| sublevel `II = Hess x/ǀdxǀ` for a regular value `c` | `ǀzǀ²`, `c = 1/16` on `ℝ²`; `c = 0`; `c = −1`; `n = 0`, `x(t) = t` | `ǀdxǀ = 1/2`, `II = 2h/(1/2) = 4h = h/R` (`R = 1/4`); `c = 0`: `dx_0 = 0` on `{x = 0} = {0}`, critical, `{0}` no regular domain; `c = −1`: empty fibre, regular by `TauCeti.IsRegularValue` (every point of the fibre regular), `{x ≤ −1} = ∅`, statement vacuous; `(−∞, c]`, `II` the zero form | holds | applied |
| superlevel `II = −Hess x/ǀdxǀ` | `ǀzǀ²`, `c = 1` | `{ǀzǀ ≥ 1}`, `−2h/2 = −h`, equal to 6.2's `−h/R`, `R = 1` | holds | none |
| invariance under `a x + b`, `a > 0` | `a = 2, b = 3`; `a = −1` | `d(2x + 3) = 2dx`, same kernel, `Hess` doubled, sign kept; `a = −1` reverses the sign of `Hess`, excluded | holds | none |
| model bullet, `x = −ρ` on `N` | unit ball `ρ = 1 − ǀzǀ²` | `dx_q = 2q ≠ 0`, `M = {x ≤ 0}`, `0` regular; `Hess x = 2g`, `II = 2h/2 = h` | holds; old text needed `dρ ≠ 0` on all of `U` | none |
| 6.3 `ǀduǀ² = u² − 1` | `a = ǀxǀ²`, `b = y²`; `(0, 2)`; `(0, 1)` | `4ab + (b − a − 1)² = a² + b² + 1 + 2ab + 2a − 2b = (a + b + 1)² − 4b`; `9/16 = 25/16 − 1`; `0 = 1 − 1` | identity holds; `du = 0` only at `u = 1` | applied |
| 6.3 balls `II = coth R · h` | `R = log 2`; `R = 1` | `(5/4)/(3/4) = 5/3 = (2 + 1/2)/(2 − 1/2)`; `cosh 1/sinh 1 = 1.5431/1.1752 = 1.313` (the Check's value) | holds; each ball contains `(0, 1)` (`u = 1 ≤ cosh R`) | applied |
| 6.4 route via 3.2 | torus `R = 1/4`; `S²` cap radius `R` | `ǀdxǀ = 1/2`, `II = 4h = h/R`; `x = θ²`, `ǀdxǀ = 2R`, `Hess x(v, v) = 2R cot R` on unit tangential `v`, `II = cot R · h`, 6.3's cap value | holds | applied (wording) |
| 4.6's use of 3.2 | unit ball `ε₁ = 1/4`, `δ = 1/8` | `x = −ρ̂ = ǀzǀ − 1` near the level, `c = 1/8` regular (`ǀdxǀ = 1`), `{x ≤ 1/8}` = ball of radius `9/8`, `II = (1/(9/8))h = 8h/9` | holds; now needs `dρ̂ ≠ 0` only on the level | none |
| 6.2 `II` via 3.1 | half-space `ρ = x⁰`; exterior `ρ = ǀx − cǀ² − R²` | `−0/1 = 0`; `−2h/(2R) = −h/R` | needs 3.1 | applied |
| 4.2 via 3.1 | unit ball, unit `v ⊥ q` | `(ρ∘γ)'' = Hess ρ(v, v) = −2 = −ǀdρǀ II(v, v) = −2·1` | needs 3.1's third bullet | applied |

## Checks run

Dependency check, exact output:

```text
candidate: RiemannianManifoldsWithConvexBoundary is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2256 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

- `design/plan.json` parses as JSON and keeps its original formatting (indent 1, non-ASCII kept).
- The README has no LaTeX delimiter (`\(`, `\[`, `$`) and no machine path.

## Notes for the maintainer

- There is no `Suggested.lean` at the design stage. No `#check` binder audit applied and no Lean
  command was run.
- Target ids, names, suppliers and gaps are unchanged, and no new target was added. The only new
  prerequisite edges are `target:3.1` into 4.2.1, 6.2 and 6.3.2.
- Ownership is unchanged because no new construction was introduced.
- `sources.toml` is unchanged and no source was fetched. The 3.2 locators were re-read:
  stefanov-uhlmann-vasy2021 lines 128–129 and 198–200, uhlmann-vasy2016 lines 137–140 and 507–509.
  The sources state the on-`U` notion with a non-vanishing differential and the single-level notion
  at a level set, which matches the repaired split.
- No other roadmap cites the changed passages.
