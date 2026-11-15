# FIX-DESIGN-RiemannianManifoldsWithConvexBoundary~12

Findings of REV-DESIGN-RiemannianManifoldsWithConvexBoundary~11 (one review, so ids are unqualified).

## F01 (P3) — applied

Verified: 6.1 states "the signed distance to the sphere is `R − |x − c|`". That is 4.3's `r_Σ`
(plan 4.3.1) on 4.3.2's tube, and neither was reachable from 6.1.1's prerequisites. README 6.1
*Needs:* "1.4, 1.5, 2.1, 3.1, 3.2, 5.2, 5.4, 5.5, 5.6" → "1.4, 1.5, 2.1, 3.1, 3.2, 4.3, 5.2, 5.4,
5.5, 5.6". Plan 6.1.1 `prerequisites` gain `target:4.3.1` and `target:4.3.2`. The Layer 6 Dependencies
paragraph already reads "6.1 uses Layers 1–5", so it is unchanged.

## F02 (P3) — applied

Verified: in 4.3's last bullet, `W` is defined with the tube radius `ε(q)` and the same bullet then says
"for `0 < ε < 1` … `{ρ̂ ≥ −ε}`". 4.6 says "tube radii `ε₁ < ε` … for `0 < ε ≤ ε₀`", and in its ball
Check, "`ε = 1/2` … for `ε < 1/4`" cannot be true of a single `ε`. Change: `ε` stays the tube radius, and the
enlargement parameter becomes `δ` (with `ε₀` → `δ₀`) in 4.3 (last bullet), 4.6 (statement, route,
all four Checks) and 5.5's route (`SM_δ`, `M_δ`, `τ_δ`). The plan changes to match: 4.3.3 statement and
`sandwich` test, and the 4.6 statement and its `ball`, `cap` and `unnormalised_defining_function` tests.
Plan 5.5.2's statement has no `ε`, so it is unchanged.

Recomputed while renaming:
- 4.6's route: the continuity step now gives `δ₀` explicitly as `0 < δ₀ < min(ε₁/2, 1)` on
  `−δ₀ ≤ r ≤ 0`. It used to say "`|r| ≤ ε₀`, some `ε₀ > 0`", which left implicit that the compact set
  used is `E(∂M × [−ε₁/2, 0])`. The new bound is consistent with the statement's `δ₀ < min(ε₁, 1)`.
- "At `ε = 0`" now reads "On the level `r = 0`", so that `δ` is never evaluated outside `δ > 0`.
- The ball Check now also computes `ρ̂` on `5/4 ≤ |x| < 3/2`.

Pattern search:
- Downstream consumers: SUV's hypothesis "`M ∩ {x̃ ≥ −δ}` compact" now reads
  "`M ∩ {x̃ ≥ −c}` compact for some `c > 0`", so `δ` keeps a single meaning in the roadmap's own text.
- The remaining uses of `ε` and `δ` are bound inside their own sentences and never share a statement
  with the tube radius or the enlargement parameter:
  - `ε`: R7.9's collar width in the supplier contract (also a tube width); the small times `[0, ε)` in
    1.1, 4.1 and 4.2; the coefficient of `x̃ = −ρ − ε|z|²` in 4.5.
  - `δ`: the cone width of 4.5(a); the time window of 5.1; the perturbation in 5.2's annulus Check;
    the Kronecker `δ_ij` of 6.4.

## Adversarial pass (changed statements)

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 4.3, `{ρ̂ ≥ −δ} ∖ M ⊆ W ∩ {r ≥ −δ}`, `0 < δ < 1` | unit ball, `ε = 1/2`, `ε₁ = 1/4`, `δ = 1/2`; `δ = 1` | `|x| = 1.4`: `r = −0.4`, `ρ̂ ∈ [−1, −0.4]`, so `ρ̂ ≥ −1/2` forces `r ≥ −1/2` (holds); `|x| = 2`: `ρ̂ = −1 < −1/2`. At `δ = 1`, `{ρ̂ ≥ −1} = N` contains points off `W` | holds; `δ < 1` is needed | rename only |
| 4.6 statement, ball | `ε = 1/2`, `ε₁ = 1/4`, `δ = 0.2` | `M_δ = B(1.2)`, `II = h/1.2 = 0.833 h` = 6.1's `h/R` at `R = 1.2`; `|x| = 1.3`: `ρ̂ ∈ [−1, −0.3]`, below `−0.2` | holds | Check recomputed |
| 4.6 route, `δ₀` | ball as above | route bound `min(ε₁/2, 1) = 1/8`, below the statement's `min(ε₁, 1) = 1/4` | consistent | `δ₀` bound made explicit |
| 4.6 cap | `R = 1.4`, `ε = 1`, `ε₁ = 0.5` | `II = cot(R + δ) h > 0` iff `δ < π/2 − 1.4 = 0.171`, so `δ₀ < min(0.171, 0.25)`; `ε ≤ R` (normals meet at the pole), and `ε₁ < π − R = 1.74` | holds; `δ₀` depends on the domain | rename only |
| 4.6 negative control | `ρ = (1 − r²)e^{−r²}`, `δ = 0.1 < e^{−2} = 0.135` | `ρ(1.6) = −0.121`, `ρ(1.8) = −0.088`, so `r₂ ≈ 1.7 > √2`, `II = −h/r₂ ≈ −0.59 h`; `ρ(1.25) = −0.118 < −0.1` | `{ρ ≥ −δ}` has an unbounded concave piece | rename only |
| 5.5 route, `u = −∫₀^{τ_δ} h ∘ φ_t` | general; unit ball in `M_δ = B(1 + δ)` | `u(φ_s z) = −∫_s^{τ_δ(z)} h(φ_t z) dt`, derivative `+h(z)`; `τ_δ = −⟨x, v⟩ + √(⟨x, v⟩² + (1 + δ)² − |x|²)`, radicand `≥ 2δ + δ² > 0` on `SM` | `Xu = h`; `τ_δ` smooth on `SM` | rename only |
| 6.1 signed distance | `f = R² − |x − c|²` | `ν = −(x − c)/|x − c|`, `E(q, r) = q − r(q − c)/R`, `|E − c| = R − r`, `r_Σ = R − |x − c|` on `0 < |x − c| < 2R`; `R = 1`, `c = 0` gives 4.3's `1 − |x|` | holds | *Needs:* + 4.3; plan + 4.3.1, 4.3.2 |
| Downstream, SUV hypothesis | SUV line 128 | "for some δ > 0, M ∩ {x̃ ≥ −δ} compact" ↔ "compactness of `M ∩ {x̃ ≥ −c}` for some `c > 0`" | same meaning | letter only |

Plan script: every `target:` prerequisite resolves and comes before its user. The closure of 6.1.1 now
contains 4.3.1 and 4.3.2, and `plan.json` parses.

## Checks run

Dependency check (exact output):

```text
candidate: RiemannianManifoldsWithConvexBoundary is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2242 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The citation resolver, re-run on the edited README, reports no
unresolved cross-roadmap citation and no Lean name found nowhere. There is no `Suggested.lean` at the
design stage, so nothing was elaborated and the `#check` binder audit had nothing to inspect. No
LaTeX delimiters were introduced.

## Notes for the maintainer

- `sources.toml` is unchanged: no new work or locator is cited.
- No name that other roadmaps cite changed. Section numbers, target ids and declaration names are
  unchanged. Only the letter of a bound parameter changed, in 4.3, 4.6 and 5.5.
- Ownership: nothing new is stated, so no ownership question arises.
- The review's "For the human reviewers" item (the author-page licence of
  paternain-salo-uhlmann2023) was left to the humans, as instructed.
