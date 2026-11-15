# FIX-DESIGN-RiemannianManifoldsWithConvexBoundary~6

Repair of the two findings of the round-5 design review (`REV-DESIGN-RiemannianManifoldsWithConvexBoundary~5`).
Files changed: `packages/RiemannianManifoldsWithConvexBoundary/design/README.md` and
`packages/RiemannianManifoldsWithConvexBoundary/design/plan.json`. `sources.toml` is unchanged (no new
source or locator). There is no `Suggested.lean` at the design stage.

## F01 (P2) — applied

Verified: closed unit disc in `N = ℝ²`, `z = ((0, −1), (1, 0)) ∈ ∂₀SM`, `φ_t z = ((t, −1), (1, 0))`,
`|(t, −1)|² = 1 + t² > 1` for `t ≠ 0`, so `u(φ_t z)` exists only at `t = 0`. The source defines `X` on
`C^∞(SN)` (paternain-salo-uhlmann2023 lines 3070–3079).

Old (5.1): "on `SM` it acts … by `Xu(z) = d/dt u(φ_t z)|_{t=0}`". New: `X` on `SN` with that formula
for `ũ ∈ C^∞(SN)`; new bullet: `X(z) ∈ T_zSN = dj(T_zSM)`, `Xu := du(X)`, equal to
`d/dt ũ(φ_t z)|₀` for every local smooth extension `ũ` and to the one-sided derivative when the flow
stays in `SM` one-sidedly. Added the disc Check (`Xσ(z) = −2`).

Pattern: 5.4's `Xσ = −2` now has a route valid at glancing points (interior via 5.2's flow identities,
then continuity and density of `int SM`). 5.5 (bound, Hessian criterion, `Xu = h`) and the 5.4/5.5
Checks differentiate functions defined on a neighbourhood in `SN` or along curves inside `SM`; they are
consistent with the new definition and unchanged. Plan: 5.1 statement, API
`geodesicVectorField_unitSphereBundle`, new test `disc_glancing_generator`; 5.4.5 statement and
prerequisite `target:5.2`.

## F02 (P2) — applied

Verified: 3.5 assumes `M` Hausdorff and second countable; the Conventions make neither standing. The
half-line `[0, ∞)` with `1` doubled is a manifold over `𝓡∂ 1` with `dx²`, not Hausdorff, so it is no
subspace of a Hausdorff manifold.

Old → new: "every `(M, g)`" → "every Hausdorff second-countable `(M, g)`" in the Summary, "How to read
the build" and Layer 4's opening sentence, and in the plan's `summary`. Added the doubled half-line as a
negative-control Check of 3.5 (plan test `doubled_half_line`).

Pattern: 1.2's first bullet argued for "a Hausdorff `M`" and concluded "every `M` of the Conventions".
The argument works for every `M`: each chart source is homeomorphic to an open subset of the half-space,
hence Hausdorff, second countable and σ-compact, as DifferentialGeometry 12.5 requires (its
variable block at `TauCetiRoadmap/DifferentialGeometry/Suggested.lean:967–975` has `[T2Space M]
[SecondCountableTopology M] [SigmaCompactSpace M]` and a Borel structure). The premise now matches the
conclusion. No other "every `(M, g)`" or "every `M`" claim exceeds its statement's hypotheses (searched
README and plan).

## Checks run

Dependency check, exact output:

```text
candidate: RiemannianManifoldsWithConvexBoundary is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2230 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

Citation resolver (`roadmaps resolve` on the README, main 1a19c9f and 474 open heads): no cross-roadmap
citation and no Lean name found nowhere.

Other: `plan.json` parses; no LaTeX delimiters, machine paths or process words in the README (searched);
new plan test kinds reuse the existing vocabulary (`computation`, `non-example`).

Lean: no `Suggested.lean` exists at the design stage, so there was no `#check` binder audit and no
elaboration. No Lean command was run.

Gate failures listed in the brief: none.

## Adversarial pass on the new and changed statements

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 5.1 `Xu := du(X)` on `SM` | disc, glancing `z = ((0, −1), (1, 0))` | `φ_t z ∉ SM` for `t ≠ 0`; `σ̃ = −2⟨x, v⟩`, `σ̃(φ_t z) = −2t`, `Xσ(z) = −2` | defined, agrees with 5.4 | Check added |
| 5.1 one-sided clause | `[a, b]`, `z = (a, −1)` | `φ_t z = (a − t, −1) ∈ SM` for `t ∈ (−δ, 0]`; `Xu(z) = −u′(a)` one-sided | holds | none |
| 5.1 one-sided clause | annulus `1 ≤ |x| ≤ 2`, inner glancing `z = ((0, −1), e₁)` | `|(t, −1)|² = 1 + t² ≥ 1`, stays in `M` for small `|t|`: two-sided derivative exists | "can leave", not "must leave", is the right wording | none |
| 5.1 extension clause | any `ũ` agreeing with `u` on `SM` near `z` | `du_z = dũ_{jz} ∘ dj_z` (unique differentiability of the half-space), so `du(X) = dũ(X(jz))` | independent of `ũ` | none |
| 5.1 `n = 0`, `M = ∅` | `[a, b]`; `ρ ≡ −1` | `∂₀SM = ∅`, every boundary point one-sided; `SM = ∅` vacuous | holds | none |
| 5.4 `Xσ = −2` route | disc, `z = ((0, 0), (1, 0))` | `τ(z) = 1`, `σ(φ_t z) = −2t` for `0 ≤ t ≤ 1` | `−2` | route added |
| 5.4 `Xσ = −2` route | `[a, b]`, `v = ±1` | `σ(x, 1) = a + b − 2x`, `X = d/dx`: `−2`; `σ(x, −1) = 2x − a − b`, `X = −d/dx`: `−2` | holds | none |
| 5.4 density step | manifold with boundary `SM` | `int SM` dense; `Xσ = dσ(X)` continuous, `= −2` on `int SM` | `−2` on `∂SM`, `∂₀SM` included | none |
| 3.5 prose (F02) | doubled half-line; `[0, 1]`; disc; half-space | not Hausdorff, excluded; `[0, 1] ⊂ D[0, 1]`, disc `⊂ ℝ²`, `{x₀ ≥ 0} ⊂ ℝⁿ⁺¹` with `ρ = x₀` | prose = 3.5's hypotheses | three sentences + Check |
| 3.5 negative Check | doubled half-line | transition maps identity on `[0, ∞) ∖ {1}`, metric `dx²` compatible; second countable (two charts); `1`, `1′` inseparable | only Hausdorff fails | Check added |
| 1.2 any-`M` normal | `[0, 1]` with charts `[0, 1)`, `(0, 1]`; non-Hausdorff doubled half-line | `ν_out(0) = −∂_x`, `ν_out(1) = +∂_x`; on the doubled half-line `∂M = {0}`, chart source `[0, ∞)` gives `−∂_x` | holds without Hausdorff | premise corrected |

## Notes for the maintainer

- The plan lists "M Hausdorff" as the first hypothesis of every Layer 1–2 target, while the README
  Conventions make `[T2Space M]` a hypothesis only of statements that use partitions of unity. The
  Layer 1–2 statements are true in both generalities (they are pointwise or local); this round changed
  neither, because no finding concerns it. 1.2's README text is now argued for every `M`, and its plan
  entry still says Hausdorff `M`, in line with the rest of the plan's Layers 1–2.
- No name that other roadmaps cite changed; no target was added, deleted or renumbered. The new plan
  tests are `disc_glancing_generator` (5.1) and `doubled_half_line` (3.5).
- Ownership: no new construction was introduced. The restriction of `X` to `SM` stays within 5.1,
  which this roadmap already owns. Ownership against open pull requests was not re-searched for the
  reworded clauses, since they add no object.
- The two "For the human reviewers" items of the review (the ownership of the regular-sublevel
  material shared with an open RiemannianGeometry revision, and the licence of the
  paternain-salo-uhlmann2023 copy) are for the human reviewers; nothing was changed for them.
