# FIX-DESIGN-CompressibleEulerEquations~14

This round settles the one finding of `REV-DESIGN-CompressibleEulerEquations~13`. The finding is
P3 and it is right. The repair it proposes needed one correction, given below.

Two files changed: `packages/CompressibleEulerEquations/design/README.md` and
`packages/CompressibleEulerEquations/design/plan.json`. The manifest
`packages/CompressibleEulerEquations/sources.toml` is unchanged because no new work is cited.
`CompactExhaustion` is a pinned Mathlib declaration, not a source.

The design stage has no `Suggested.lean`. So no Lean statement changed, nothing was elaborated, and
the `#check` comparison had no file to run on. No plan target was added, removed or renamed.

## F01 (P3) — applied differently

**Verified.** In this roadmap a *domain* is a subset of `H_{t₀}` that is relatively open in
`H_{t₀}` (Conventions). So `D = H₀ \ {(1, 0)}` is a domain. The curves `x_m ≡ 1/m` on `[1, 2]` are
causal for the field `(1, 0)`, and their graphs avoid `(1, 0)`. Their limit `x ≡ 0` lives on
`J = (1, 2]`, so `inf J = 1 = a`. The old clause "if `a′ > a` then past-inextendible" therefore
says nothing. Yet the starting points `(1, 1/m)` converge to `(1, 0) ∉ D`. This is exactly the
case the §3.3 *Compact pasts* route needs, so the finding is right.

**Why the proposed wording was not used as it stands.** The review proposes "`J` is the largest
such interval in `[a, t_p]`". That wording takes convergence on `J` to require each `x_m` to be
defined there, and the domains `[a_m, t_{p_m}]` move. Take `x_m ≡ 0` on `[1 + 1/m, 2]` in `H₀`:
no `x_m` is defined at `1`, so under that reading `J = (1, 2]`. The clause "`a ∉ J` ⇒
past-inextendible" would then call `x ≡ 0` past-inextendible, but it extends to `[0, 2]`. The same
problem was already present at `t_p` in the old text whenever `t_{p_m} < t_p`. There is also a
second gap: "largest" is relative to a subsequence, while Arzelà–Ascoli only extends the
convergence along a further subsequence. The repair below states the convergence along moving
parameters instead, and proves the alternative directly.

**Changed** (old → new). §3.2 *Limit curves*: "a subsequence converges uniformly on compact
subsets of `J ∋ t_p` with `inf J = a′ ≥ a` …, and if `a′ > a` then `x` is past-inextendible" →
"there are a subsequence, an interval `J ⊆ [a, t_p]` containing `t_p` and a causal `x : J → E` in
`D` ending at `p` with `x_m(s_m) → x(s)` whenever `s_m ∈ [a_m, t_{p_m}]`, `s_m → s ∈ J`. If
`a ∈ J` then `x_m(a_m) → x(a)`. If `a ∉ J` (for instance `inf J > a`) then `x` is
past-inextendible." A route was added, using a compact exhaustion and the least times from which
`x_m` stays in each `K_j`.

Further changes:

- Three new Checks in §3.2, mirrored as plan tests on 3.2.3: the reviewer's witness and its
  `D = H₀` counterpart; the moving endpoints; and the unbounded starting points of the field
  `(1, x²)`.
- Mathlib contract and §3.2 *Needs:* gained `CompactExhaustion`
  (`Mathlib/Topology/Compactness/SigmaCompact.lean:323`, with `CompactExhaustion.choice` at line
  418), checked at the pin.
- Plan 3.2.3: the statement, the hypotheses, the prerequisite `mathlib:CompactExhaustion` and the
  three tests were updated to match.

**Same pattern elsewhere.** The limit-curve statement is used only by the §3.3 routes. A search
for "limit curve", "inf J" and "a′" turned up nothing else. The §3.3 theorems themselves are
unchanged, but both routes now invoke the alternative explicitly:

- *Compact pasts.* The old route said that points "unbounded or converging outside `D`" give a
  past-inextendible curve missing `S`. It now runs as follows. If `a = t_p`, then `q_m → p`. If
  `a ∈ J`, then `q_m → (a, x(a)) ∈ J⁻_D(p)`. If `a ∉ J`, then `x` is past-inextendible and misses
  `Σ_{t₀}`, because `t₀ ≤ a ≤ inf J`; that contradicts `p ∈ D⁺_D(S)`.
- *Openness.* The old route said "the limit curve extends to a past-inextendible curve … which
  meets `S`". That is not enough, because the meeting point can lie on the extension, where the
  `x_m` are not known to converge. The new route has three steps:
  - If the starting points converge in `D`, the curves are trapped near the limit and must reach
    `t₀`.
  - If `a ∉ J`, the limit misses `Σ_{t₀}`.
  - Otherwise `a = t₀`, the limit point `z` lies in `S`, and because `S` is open the `y_m` meet
    `S`.

  Plan 3.3.1 and 3.3.2 already cite "the limit-curve route of 3.2.3" and need no change.

## Adversarial pass (statements added or changed)

Coordinates are `(t, x)` and `n = 1` throughout.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §3.2 limit curves (new) | field `(1, 0)`, `D = H₀ \ {(1, 0)}`, `x_m ≡ 1/m` on `[1, 2]`, `p_m = (2, 1/m)` | `x_m(s_m) = 1/m → 0`; `(1, 0) ∉ D` gives `J = (1, 2]`, `inf J = 1 = a ∉ J`; an extension would have value `0` at `1`, a point not in `D`: past-inextendible | holds; old clause silent | Check, plan test `endpoint_outside_domain` |
| same | same curves, `D = H₀` | `J = [1, 2]`; `x_m(1) = 1/m → 0 = x(1)`; `x ≡ 0` extends to `[0, 2]`, so it is not past-inextendible, and `a ∈ J` | holds | same Check |
| same, moving endpoints | `D = H₀`, `x_m ≡ 0` on `[1 + 1/m, 2]` | `s_m = a_m = 1 + 1/m → 1`, `x_m(a_m) = 0 → 0 = x(1)`, `J = [1, 2]`; requiring domains to contain `J` gives `J = (1, 2]` and a false inextendibility | holds in the stated mode of convergence; the reviewer's literal wording fails | Check, plan test `moving_endpoints` |
| same, escape to infinity | field `(1, x²)`, `D = [0, 1) × ℝ`, `x(s) = 1/(1/4 − s)` on `[1/4 + 1/m, 1/2]` | `ẋ = (1/4 − s)⁻² = x²`; `x(1/2) = −4`; `x(a_m) = −m`; `J = (1/4, 1/2]`, `a = 1/4 ∉ J`; `x → −∞` at `1/4`: past-inextendible | holds | Check, plan test `unbounded_start` |
| same, vacuity | `J = {t_p}` | `x_m(s_m) → x_p` holds; but `a < t_p` gives `a ∉ J`, and the one-point curve at `t_p > t₀` extends by local existence with `u = v(p)` | `J = {t_p}` is not admissible: the conclusion pins `J` down | none |
| same, `a = t₀` | `D = H₀`, `x_m ≡ 0` on `[0, 2]` | `J = [0, 2]`, `x_m(0) = 0 → 0`; `x` is also past-inextendible (no time below `0`) | both clauses hold, and the `if` form allows this | none |
| §3.2 route (exhaustion) | witness with `K_j = {t ≤ j, |x| ≤ j, |(t − 1, x)| ≥ 1/j} ∩ H₀` | `K_j ⊆ int K_{j+1}`, union `D`; for `m > j`, `σ_m^j = 1 + √(1/j² − 1/m²) → 1 + 1/j`; boundary points `(1 + 1/j, 0) → (1, 0) ∉ D` | second alternative, consistent | none |
| same | `D = H₀`, `K_j = [0, j] × [−j, j]` | `K_2 ⊇` every graph `[1, 2] × {1/m}` | first alternative, `a ∈ J` | none |
| §3.3 compact pasts (route) | field `(1, 0)`, `D = H₀`, `S = {0} × (−1, 1)`, `p = (1/2, 0)` | `J⁻_D(p) = {0 ≤ t ≤ 1/2, |x| ≤ 1/2 − t}`, compact; slice `[−1/2, 1/2] ⊆ (−1, 1)` | holds | route rewritten |
| same, hypothesis fails | `D = H₀ \ {(0.2, 0.1)}`, curve `x(t) = −(t − 0.5)/3` | `x(0.2) = 0.1`, `|ẋ| = 1/3 ≤ 1`; `q_m = (0.2 + 1/m, 0.1 − 1/(3m)) → (0.2, 0.1) ∉ D`; `a = 0.2 ∉ J = (0.2, 0.5]`; the limit misses `Σ₀`, so `p ∉ D⁺_D(S)` | consistent: compactness fails exactly when `p ∉ D⁺_D(S)` | none |
| same, `a = t_p` step | field `(1, 0)`, `p = (1, 0)`, `q_m = (1 − 1/m, 1/(2m))` | `|q_m − p| ≤ √2/m → 0` | `q_m → p` | none |
| §3.3 openness (route) | `D = H₀`, `S = {0} × (−1, 1)`, `p = (0, 0.9) ∈ S`, `q_m = (1/m, 0.9)` | `0.9 < 1 − 1/m` for `m > 10`, so `q_m ∈ D⁺`; every curve from `q_m` reaches `t = 0` within `1/m` of `0.9`, inside `S` | holds (`a = t_p = t₀` branch) | route rewritten |
| same, `S` closed | `S = {0} × [−1, 1]`, `p = (0, 1)`, `q_m = (1/m, 1)`, `y_m = 1 + 1/m − t` | `D⁺ = {|x| ≤ 1 − t}`; `q_m ∉ D⁺` since `1 > 1 − 1/m`; `y_m(0) = 1 + 1/m ∉ S` while `z = p ∈ S` | openness fails exactly at the step that uses `S` open | none (the hypothesis is stated) |
| Mathlib `CompactExhaustion` | read at the pin | structure fields `isCompact'`, `subset_interior_succ'`, `iUnion_eq'` (line 323); `choice` needs `WeaklyLocallyCompactSpace` and `SigmaCompactSpace` (line 418), which a domain satisfies by `IsLocallyClosed.locallyCompactSpace` (`LocallyCompact.lean:220`) and `sigmaCompactSpace_of_locallyCompact_secondCountable` (`SigmaCompact.lean:187`) | as stated | contract added |

## Checks

- Dependency check:

  ```text
  candidate: CompressibleEulerEquations is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
  depcheck: 243 roadmaps, 2246 edges, 0 problem(s)
  ```

  There is no UPWARD or CYCLE line. No supplier was added. The only new *Needs:* item is a pinned
  Mathlib declaration.
- `roadmaps resolve` on the README, run after the edits: no cross-roadmap citation and no Lean name
  found nowhere. The worker's lead, `LinearSystem.IsSymmetricHyperbolic` at README line 103, is
  SymmetricHyperbolicSystems' declaration in its `Suggested.lean`, cited under its supplier
  contract, and is not a pinned name. `CompactExhaustion` was checked by hand at the Mathlib pin.
- `design/plan.json` parses, and the JSON dump changed only target 3.2.3. README §3.2 and plan
  3.2.3 agree on the statement, hypotheses, prerequisites and tests.
- Style: no LaTeX delimiters or process words were added, and no machine path appears in the
  changed text.
- `Suggested.lean`: none at this stage, so no elaboration or `#check` comparison was run.

## Gate failures

None were listed for this round.

## Notes for the maintainer

- No name changed. Plan target 3.2.3 keeps `AcousticalGeometry.limit_curve`. No roadmap cites
  CompressibleEulerEquations, so nothing downstream moves.
- Ownership: no new object was introduced. The limit-curve statement is still this roadmap's own
  form, for time-parametrised curves of a cone field continuous only on a relatively open subset
  of a half-space. It remains distinguished from LorentzianGeometry §11.4 and §12.7, both re-read
  at that roadmap's head this round.
- No text read in this round contained instructions.
