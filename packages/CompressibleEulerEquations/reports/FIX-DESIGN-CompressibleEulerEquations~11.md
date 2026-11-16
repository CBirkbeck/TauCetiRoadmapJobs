# FIX-DESIGN-CompressibleEulerEquations~11

This round settles the two findings of `REV-DESIGN-CompressibleEulerEquations~10`, one P2 and one
P3. Both are about the hypothesis of §8.4 (b), and both are mathematically right.

Two files changed: `packages/CompressibleEulerEquations/design/README.md` and
`packages/CompressibleEulerEquations/design/plan.json`. The manifest
`packages/CompressibleEulerEquations/sources.toml` is unchanged because no new work is cited.

The design stage has no `Suggested.lean`. So no Lean statement changed, nothing was elaborated, and
the `#check` comparison had no file to run on.

One plan target was added: 8.4.2, which holds the slab statement moved out of §8.3. No target was
removed or renumbered.

## F01 (P2) — applied differently

**Verified.** §8.4 (b) assumed that `(D, U)` is maximal. The §8.3 bullet applied it to
`D⁺_O({t₀} × S)`, which is not maximal. The reviewer's witness holds: constant state, `n = 1`,
`c = 1`, `v = 0`, `T = 1`, `S = {x > 0}`, so `D = {x > t, 0 ≤ t < 1}`. At `(t, x) = (1, 5)` with
`φ = t − 1` we get `∂_tφ = 1 > 0`, which is spacelike, yet the solution extends past that point. So
the old bullet is false on the top of the slab.

**Changed** (old → new): in §8.4 (b), "`(D, U)` maximal" → "no development `(D′, U′) ≥ (D, U)` inside `D ∪ ⋃_λ (N + λ)` contains `q`", which maximality implies; the route is adjusted. The §8.3 half-space bullet → a §8.4 statement on developments inside a slab, for `t₀ < t(q) < t₀ + T`, with the witness as a Check and a *Needs:* entry. Plan: 8.4.1 updated; new target 8.4.2.

**Why "differently".** The reviewer asked to add §8.3 to the prerequisites of 8.4.1. That would put
(b), and the maximal-development headline, behind §8.3 and therefore behind Layer 7. Only the slab
statement needs §8.3, so it is its own target 8.4.2, with prerequisites `target:8.4.1` and
`target:8.3`.

## F02 (P3) — applied

**Verified.** The bullet opening "Consequently, a `C¹` hypersurface …" had no hypothesis from (b).
The truncation `{|x| < 1 − t, 0 ≤ t < 1/2}` refutes it: its top has `∂_tφ = 1 > 0`.

**Changed** (old → new): the "Consequently" bullet → "*Regular boundary hypersurfaces*", which requires the hypothesis of (b) at each point of `H` (in particular, maximality); "`D` on one side" is made precise. The truncation Check now shows the hypothesis failing on the top and computes `1 = 1` on the lateral boundary of `{|x| < 1 − t}`. Plan test and 8.4.1 updated.

**Same pattern elsewhere.** Two other places drew a conclusion from non-maximality ("(b) excludes by
non-maximality"): the comparison with LorentzianGeometry §12.7 and the truncation Check. Both now say
that the hypothesis of (b) fails there.

I also checked the other places that call a boundary null. Each is either maximal or a direct
computation, so none needed a change:
- the §8.1 Checks;
- the §3.3 half-space Check (a computation);
- Layer 8 Examples;
- Worked examples (the expanding flow and the constant states are unique maximal developments by
  the §8.2 criterion);
- Downstream consumers.

## Adversarial pass (statements added or changed)

Coordinates are `(t, x)`; `c` is the sound speed, `v` the velocity.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §8.4 (b), weakened hypothesis | maximal `{\|x\| < 1 − t}`, lateral point | hypothesis holds trivially; `∂_tφ = 1 = 1·\|±1\|` | equality, as claimed | none |
| §8.4 (b) | truncation top `(1/2, x_q)`, `φ = t − 1/2` | union with cone `{t ≥ 1/2, \|x − x_q\| < r − 2(t − 1/2)}`: backward curve has `\|x(t)\| < \|x_q\| + r + 1/2 − t < 1 − t` when `r < 1/2 − \|x_q\|`, so it is a development above containing `q`; `1 > 0` | hypothesis fails, nothing claimed; consistent | Check added |
| §8.4 (b) | slab top `(1, 5)`, `D = {x > t, t < 1}` | cone `{t ≥ 1, \|x − 5\| < r − 2(t − 1)}`; backward curve has `x(t) > 5 − r − 1 + t > t` when `r < 4`; `1 > 0` | hypothesis fails; extension alone is not enough | Check and plan test added |
| §8.4 (b), `b = ∇φ(q) = 0` | `φ = t − T` | `a = 1 > 0 = c\|b\|`; the lens route gives a development containing `q` | so `b ≠ 0` under the hypothesis; consistent with conclusion `∇φ(q) ≠ 0` | none |
| §8.4 (b) route | `D′ = D ∪ ⋃(L + λ)`, `L ⊆ N₀ ⊆ N` | `D′ ⊆ D ∪ ⋃(N + λ)`; `φ(q) = 0` (q ∈ ∂D ∩ N, q ∉ D open in `H_{t₀}`); `ψ(q) = ε > 0`, so `q ∈ L`; `D ∪ L = D ∪ ({ψ > 0} ∩ N₀)` is open | contradiction with the new hypothesis, not only with maximality | route sentence updated |
| hypersurface consequence | expanding flow at `(1, 2√2 − 2)` | `0.2929 + 0.4142 = 0.7071 = 1/√2` | null; the development is maximal | none |
| slab statement | `n = 1`, `c₀ = 1`, `v₀ = 0`, `T = 1`, at `(1/2, 1/2)`, `φ = t − x` | `∂_tφ + v∂_xφ = 1`, `c\|∂_xφ\| = 1` | null | Check and test added |
| slab statement | constant `(ρ₀, v₀)` on `{x¹ > 0}`, `φ = (v₀¹ + c₀)(t − t₀) − x¹` | `v₀¹ + c₀ − v₀¹ = c₀ = c₀·1` | null | plan test |
| slab statement | expanding flow with `T = 2` at `(1, 2√2 − 2)` | `1/√2 = 1/√2` | null | none |
| slab statement, degenerate | `S = E` / `S = ∅` / `T = ∞` | `∂D ∩ {t₀ < t < t₀ + T} = ∅` / `D = ∅` / `O = H_{t₀}` gives the unique maximal development of §8.2 | vacuous / vacuous / agrees with the maximal case | none |
| slab route | a development `D′ ⊆ D ∪ ⋃(N + λ) ⊆ O` above `D` | §8.3 (largest in `O`) gives `D′ ⊆ D`, so `D′ = D ∌ q` | the hypothesis of (b) holds | none |

## Checks

**Dependency check.**

```text
candidate: CompressibleEulerEquations is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2241 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. No supplier edge changed: the new prerequisites are internal
(§8.3 to 8.4.2).

**Citations.** `roadmaps resolve` on the README lists no cross-roadmap citation and no Lean name
found nowhere. The worker's earlier lead, `LinearSystem.IsSymmetricHyperbolic`, is declared in
SymmetricHyperbolicSystems' `Suggested.lean` (`def IsSymmetricHyperbolic`, line 92 at its head).

**Sources.** I re-read the one locator used by the moved statement, LuoYu2023b lines 417–419. It is
the future domain of dependence of right-hand data, whose boundary is null. No source was added.

**Ownership.** The slab statement concerns this roadmap's own developments (§8.1, §8.3). The closest
other owner is LorentzianGeometry §12.7, on horizons in a fixed spacetime; the existing comparison
paragraph, updated, says how (b) differs. Nothing is newly claimed from another roadmap.

**Plan.** `design/plan.json` parses and has 54 targets (53 before, plus 8.4.2). It has no dangling
`target:` prerequisite and `gaps: []`.

## Gate failures

None were listed for this round.

## Notes for the maintainer

- Plan target 8.4.1 keeps its name `CompressibleEuler.boundary_null_of_maximal`, although its
  hypothesis is now weaker than maximality. Maximality is still the headline case. No roadmap cites
  this one (checked on main and at the open heads), so renaming later costs nothing.
- The §8.4 heading, the Summary and "How to read the build" still describe the headline as the
  nullity of the regular boundary of a maximal development. That stays true; the slab statement is
  an addition inside §8.4.
- No untrusted text contained instructions.
