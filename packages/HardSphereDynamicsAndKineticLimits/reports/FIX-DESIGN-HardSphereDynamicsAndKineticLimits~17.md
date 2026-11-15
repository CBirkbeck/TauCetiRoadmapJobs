# FIX-DESIGN-HardSphereDynamicsAndKineticLimits~17

This round repairs the findings of `REV-DESIGN-HardSphereDynamicsAndKineticLimits~16`. The review has one finding (P3), on notation. It is right and was applied. Files changed:

- `packages/HardSphereDynamicsAndKineticLimits/design/README.md`: the fourth Check of §9.4 (the position-dependent non-example).
- `packages/HardSphereDynamicsAndKineticLimits/design/plan.json`: test `position_dependent` of target 9.4.

`sources.toml` is unchanged and no source was fetched. No definition, hypothesis, theorem statement, route, `*Needs:*` line, prerequisite or Lean name changed. No section was added, moved or renumbered.

## F01 (P3) — applied

§9.4, fourth Check, and plan test `position_dependent`: the position profile `ρ(x)` → `r(x)` throughout: `f⁰(x, v) = r(x) M_{1,0}(v)`, `r(x) = 1 + 0.5 cos(2πx)`, `(μ/Z) r(x) M(v)`, `(μ/Z) r(x − t v) M(v)`, `r(0) = 1.5`, `r(−1/4) = 1`, `r = 1 + 1_{x = 0}`. The plan test now also writes `r(0) = 1.5` and `r(−1/4) = 1`, as the README does.

**Verification.** The finding is right. The Conventions (README line 19) and §1.1 fix `ρ ∈ (0, ∞]` as the injectivity radius of a position space. The Check is set on the unit circle, where §1.3 gives ρ = 1/2, and in the same bullet `ρ(x)` was a density with `ρ(0) = 1.5`. The same symbol had two meanings inside one bullet.

**Recomputation with the new name.** The values do not change.
- `r(0) = 1 + 0.5 cos 0 = 1.5` and `r(−1/4) = 1 + 0.5 cos(−π/2) = 1`.
- For `N = 1` the hard-core set is the whole phase space, and the flow is the free flow `(x, v) ↦ (x + π(t v), v)`. So `W(t) = W⁰ ∘ T_{−t}` gives `(μ/Z) r(x − t v) M(v)`.
- At `t = 1/4`, `x = 0`, `v = 1` the density changes from `1.5 (μ/Z) M(1)` to `(μ/Z) M(1)`, with `M(1) = e^{−1/2}/√(2π) > 0`. Both densities are continuous, so they differ on an open set of positive measure.
- `∫ r = 1`, so `f⁰` is integrable on `𝕋 × ℝ`.
- With `r = 1 + 1_{x = 0}`, `f⁰ = r M_{1,0}` equals `M_{1,0}` off the null set `{x = 0}`. The grand canonical measure depends on `f⁰` only through integrals, so it is the invariant measure of the theorem with `c = 1`, `β = 1`, `u = 0`.

The letter `r` is used nowhere else in Layer 9. Elsewhere it appears only as a bound radius or speed in other sections (§1.1, §7.5, §10.2), which is local use and no clash.

**Pattern.** Every occurrence of `ρ` in the README (42 lines) and the plan (62 lines) was listed. Bare `ρ` is now always the injectivity radius. The only other density named with this letter is `ρ⁰(x) = ∫ f⁰(x, v) dv` in §9.6 (README lines 749 and 754, plan target 9.6). It is a distinct symbol, defined where it appears, and it follows the roadmap's superscript-⁰ convention for initial data (`f⁰`, `W⁰_N`). The review cites it as the roadmap's name for the position density and does not ask to change it, so it is kept. Changing it would rewrite a headline statement's README text that no finding asks about.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §9.4 Check 4 (position-dependent profile, renamed) | `t = 1/4`, `x = 0`, `v = 1` on the unit circle (ρ = 1/2, ε < 1/2, `N = 1`) | `r(0) = 1.5` against `r(−1/4) = 1 + 0.5 · 0 = 1`; density factor `1.5 · e^{−1/2}/√(2π) = 0.3630` against `e^{−1/2}/√(2π) = 0.2420` (times `μ/Z`) | Non-invariance holds | symbol only |
| same, a.e. control | `r = 1 + 1_{x = 0}` | differs from 1 on `{0}`, of measure 0; the measure is that of `f⁰ = M_{1,0}`, which is invariant by §9.4 with `c = β = 1`, `u = 0` | Holds | symbol only |
| same, integrability | `∫_𝕋 r = 1 + 0.5 ∫_0^1 cos(2πx) dx` | `= 1 + 0 = 1`, so `∫ f⁰ = 1 < ∞` as §9.1 requires | Holds | none |
| symbol audit | every `ρ` in README and plan | bare `ρ` with a function argument: 4 occurrences in README line 727 and 4 in the plan test before the change, 0 after; `ρ⁰`: 2 README lines and 1 plan statement, each defined in place | One meaning per symbol | as F01 |

## Checks run

Dependency check (`gate --only HardSphereDynamicsAndKineticLimits`), output:

```text
candidate: HardSphereDynamicsAndKineticLimits is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 238 roadmaps, 2248 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The roadmap is not in the merge order yet, which is expected at the design stage. `plan.json` parses as JSON after the edit.

Lean: this is the design lane, and there is no `Suggested.lean`. No Lean command was run and no `#check` comparison was possible. No gate failures were listed for this round.

## For the maintainer

- No name that another roadmap cites changed. No supplier, gap or cross-roadmap citation changed.
- This round fetched no source, and nothing that needs a source was left open.
- Ownership against open pull requests was not re-examined, because nothing this round touched an owned object. The review's object searches (Boltzmann–Grad, BBGKY, Lanford, hard sphere, flat torus) stand as reported.
