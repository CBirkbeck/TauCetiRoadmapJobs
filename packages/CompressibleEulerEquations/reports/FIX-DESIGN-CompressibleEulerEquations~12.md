# FIX-DESIGN-CompressibleEulerEquations~12

This round settles the one finding of `REV-DESIGN-CompressibleEulerEquations~11`, a P3. It concerns
the route sentence of the §8.4 statement on developments inside a slab, and it is right.

Two files changed: `packages/CompressibleEulerEquations/design/README.md` and
`packages/CompressibleEulerEquations/design/plan.json`. The manifest
`packages/CompressibleEulerEquations/sources.toml` is unchanged because no new work is cited.

The design stage has no `Suggested.lean`. So no Lean statement changed, nothing was elaborated, and
the `#check` comparison had no file to run on. No plan target was added, removed or renumbered.

## F01 (P3) — applied

**Verified.** Hypothesis (b) needs an extension that is Λ-periodic on the translates of `N`. §8.3
allows a non-periodic `U₀`: a §7.3 datum, or a §7.2 datum for another period group. Then `U` is
Λ-periodic on `D` but not off it. The witness holds; I used a ball of radius `0.05` instead of
`0.1`, so that `D ∩ N = {x < 1/2 − t}`. At `(0.21, 0.33) ∈ N` we have `x + t = 0.54`, inside the
bump, while `U` is constant on `N + 1`. The statement itself stays true.

**Changed** (old → new): route "(b) with `Ũ = U` on `⋃(N + λ)`" → "(b) on a ball `N₁ ⊆ N` of
diameter below the least norm of a nonzero period, with `Ũ(t, x + λ) = U(t, x)` on `N₁`" (periodic,
extends `U`, `Ũ(q) = U(q)`). Added: witness Check, plan test `slab_solution_not_periodic`, *Needs:*
§1.2, §1.3.

**Same pattern elsewhere.** The *Regular boundary hypersurfaces* bullet assumed "a classical
extension of `U` to `N` and its Λ-translates" without saying it is periodic, then said "in
particular, if `(D, U)` is maximal". Maximality does not make a given extension periodic. The bullet
now asks for a Λ-periodic extension, as (b) does. A parenthesis notes that an extension to `N` alone
gives one on a smaller ball by the same translation, so no generality is lost.

I made the same change in plan 8.4.1: its "Consequence" sentence and its hypothesis list.

The slab-top Check said (b) "cannot be weakened to '`U` extends classically to `N`'". It now adds
"by dropping the condition on developments", so it does not clash with the parenthesis.

No other construction applies (b) to a solution that is not known to be periodic. The truncation
Check and the slab-top Check use the constant state with `Λ = 0`. §8.2–§8.3 do not use (b).

## Adversarial pass (statements added or changed)

Coordinates are `(t, x)`; the witness has `n = 1`, `Λ = ℤ`, `c₀ = 1`, `v₀ = 0` and
`S = ⋃_k (k, k + 1/2)`.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Slab route, periodisation | witness, `q = (0.2, 0.3)`, `N = B(q, 0.05)` | apex `(1/4, 1/4)` and edge `x = t` at distance `√0.005 = 0.0707 > 0.05`; `(0.21, 0.33)`: distance `0.0316`, `x + t = 0.54 ∈ (0.52, 0.6)`, so `U ≠ (ρ₀, 0)`; `N + 1`: `x > 1.25 > 0.6 + 2·0.25 = 1.1`, so `U = (ρ₀, 0)` | `U` is not Λ-periodic on `N ∪ (N + 1)`: the old route fails | route replaced |
| Slab route, new | same | diameter `0.1 < 1`, translates disjoint; on `D ∩ (N + 1)` (triangle `k = 1`) `Ũ = (ρ₀, 0) = U`; `φ = x − 1/2 + t`: `∂_tφ + v∂_xφ = 1 = 1·1` | null, as claimed | Check, plan test |
| Diameter bound needed | `N = B(q, 1.1)` | contains `(0.21, 0.33)` and `(0.21, 1.33)` (distance `1.03`); `Ũ(0.21, 1.33)` would be both `U(0.21, 1.33) = (ρ₀, 0)` and `U(0.21, 0.33) ≠ (ρ₀, 0)` | ill-defined without the bound | bound kept |
| Slab route, degenerate | `Λ = 0`; `U₀` Λ-periodic; `S = E`; `S = ∅` | `⋃(N₁ + λ) = N₁`, `Ũ = U`; slab uniqueness (6.2.1) gives `τ_λU = U`, so `Ũ = U`; `∂D ∩ {t₀ < t < t₀ + T} = ∅`; `D = ∅` | trivial / agrees with old route / vacuous / vacuous | `Λ = 0` clause added |
| No development reaches `q` | development `D′ ⊆ D ∪ ⋃(N₁ + λ)` | `N₁ ⊆ (t₀, t₀ + T) × E`, so `D′ ⊆ O`; §6.2 gives `U′ = U` on `D′`; the first-exit argument gives `D′ ⊆ D`; `q ∉ D` | hypothesis of (b) holds | none |
| Extends `U` | `p + λ ∈ D ∩ (N₁ + λ)` | `p ∈ D` (Λ-invariant), `U(p + λ) = U(p) = Ũ(p + λ)` | consistent with §8.1 | none |
| `D` in the witness | `w⁻ = v − ∫c/ρ` characteristics from `y₀ ∈ [1/2, 0.52]` | unperturbed lines `x + t = y₀`, so `D` ends at `x + t = 1/2`; `w⁺` is constant, so the left edges `x = k + t` are unchanged | `D = ⋃_k {k + t < x < k + 1/2 − t}` | none |
| Hypersurface bullet, periodic extension | maximal `D`, extension on `N` only | periodise on `N₁`: same `Ũ(q)`; maximality gives the hypothesis for `N₁`; for non-maximal `D`, the hypothesis for `N` implies it for `N₁ ⊆ N` | conclusion unchanged; "in particular maximal" now justified | bullet and plan 8.4.1 |
| Slab-top Check, reworded | `(1, 5)`, `D = {x > t, t < 1}` | `∂_tφ = 1 > 0`; the cone `{t ≥ 1, \|x − 5\| < r − 2(t − 1)}` with `r < 4` gives a development above | hypothesis of (b) fails; the reworded sentence matches | wording |

## Checks

**Dependency check.**

```text
candidate: CompressibleEulerEquations is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2241 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The new *Needs:* entries (§1.2, §1.3) are internal and point
downward. No supplier edge changed, and no notion was moved down.

**Citations.** `roadmaps resolve`, run again on the README, lists no cross-roadmap citation and no
Lean name found nowhere. The worker's earlier lead, `LinearSystem.IsSymmetricHyperbolic`, is
SymmetricHyperbolicSystems' declaration, as recorded in earlier rounds; this round's resolver run
no longer lists it.

**Plan.** `design/plan.json` parses and has 54 targets. It has no dangling `target:` prerequisite
and `gaps: []`. Plan 8.4.1 and 8.4.2 agree with the README.

**Sources.** No locator was added or changed. LuoYu2023b lines 417–419 still locates the half-space
configuration.

**Ownership.** The change concerns this roadmap's own developments (§8.1, §8.3, §8.4). Nothing new is
claimed from another roadmap. I did not check ownership against open pull requests again this round,
because no new object was introduced.

**Style.** I pattern-searched the added lines for LaTeX delimiters, process words and machine paths:
none.

## Gate failures

None were listed for this round.

## Notes for the maintainer

- No declaration name changed. Plan targets keep their names: `CompressibleEuler.boundary_null_of_maximal`
  (8.4.1) and `CompressibleEuler.slabDevelopment_boundary_null` (8.4.2). No other roadmap cites this
  one.
- The review's "For the human reviewers" section raises the merge-order placement of LorentzianGeometry
  and SymmetricHyperbolicSystems, the Majda1984 share, the LukNotes licence, and the scope of
  characteristic data. Per the brief, nothing was changed for these.
- No untrusted text contained instructions.
