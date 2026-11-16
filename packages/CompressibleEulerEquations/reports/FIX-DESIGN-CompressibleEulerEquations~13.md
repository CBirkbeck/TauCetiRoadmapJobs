# FIX-DESIGN-CompressibleEulerEquations~13

This round settles the two findings of `REV-DESIGN-CompressibleEulerEquations~12`. Both are P3
and both are right.

Two files changed: `packages/CompressibleEulerEquations/design/README.md` and
`packages/CompressibleEulerEquations/design/plan.json`. The manifest
`packages/CompressibleEulerEquations/sources.toml` is unchanged because no new work is cited.

The design stage has no `Suggested.lean`. So no Lean statement changed, nothing was elaborated, and
the `#check` comparison had no file to run on. No plan target was added, removed or renamed.

## F01 (P3) — applied

**Verified.** The continuity bullet of §7.1 sits under "for every `U₀` with
`‖U₀ − Ū‖_{Hᵏ_Λ} ≤ M` and `U₀(E) ⊆ K`". It did not put the approximating data `U₀^m` in that
class. On the reviewer's witness (`G = ℝ`, `Ū = 0`, `K = [−1, 1]`, `U₀^m = (1 + 1/m)U₀`, norm
`M(1 + 1/m) > M`), the existence clause gives these data only `T(M(1 + 1/m), K)`, so their
solutions are not known to exist on `[0, T]`.

**Changed** (old → new): §7.1 "if `U₀^m → U₀` in `Ū + Hᵏ_Λ` with values in `K`, the solutions
converge" → "…where each `U₀^m` takes values in `K` and satisfies `‖U₀^m − Ū‖_{Hᵏ_Λ} ≤ M`, the
solutions of the `U₀^m`, which exist on `[0, T]` by the existence clause, converge to `U`". Plan
7.1 changed to match.

New Check and plan test `existence_time_depends_on_norm`: Burgers with `u₀^λ = −e^{−λ²x²}`
shows that `T` depends on `M` and not on `K` alone.

**Same pattern elsewhere.** §7.2 (a headline) said "depending continuously on the data", but its
`T` depended on each datum, so no common interval or class was fixed. It now says that `T`
depends only on `(I, p)`, `Λ`, `k`, `(ρ₀, v₀)`, `[ρ_*, ρ^*]` and a bound
`M ≥ ‖(ρ̄ − ρ₀, v̄ − v₀)‖_{Hᵏ_Λ}`. It states continuity for data converging inside that class.

The route now names how §7.1 is applied: `Ū = (ρ₀, v₀)` and `K = [ρ_*, ρ^*] × B̄(v₀, CM)`, with
`C` the constant of the §4.2 embedding. It also explains why the shrinking of `T` for
`ρ ≥ ρ_*/2` is uniform: `‖∂_tρ‖_∞ = ‖v·∇ρ + ρ div v‖_∞ ≤ C′`, with `C′ > 0` depending on
`R(M, K)`, `ρ₀` and `v₀`.

The full-system sentence ("the same holds") now says what replaces what: `L` replaces
`[ρ_*, ρ^*]`, `ρ_*` is the least density on `L`, and the range of `(ρ, s)` in `𝒪` replaces the
range of `ρ` in `I` in the continuation criterion. *Needs:* of §7.2 gains §4.2. Plan 7.2 changed
to match: statement, a hypothesis line and the prerequisite `target:4.2`.

Places searched and left unchanged:
- §7.3 states no continuity clause.
- The §7.1 route ("continuous dependence by the Bona–Smith regularisation") works inside the
  ball.
- §8.3 uses only the existence part of §7.2. Every datum has a bound `M`, namely its own norm.
- The Summary only names the topic.

## F02 (P3) — applied

**Verified** at the open head of SymmetricHyperbolicSystems. Its Conventions paragraph
*Propagation speed* defines a speed: `|ξ ⬝ᵥ ((Σⱼ ωⱼ Aʲ(t,x)) *ᵥ ξ)| ≤ c (ξ ⬝ᵥ (A⁰(t,x) *ᵥ ξ))` for
all `(t, x)`, all `‖ω‖ ≤ 1` and all `ξ`. Its §1.2 has only the bullet "A speed exists when the
`Aʲ` are bounded", which gives the speed `√n M / λ`. That bound checks out:
`|Σ ωⱼ ξ·Aʲξ| ≤ ‖ω‖₁ M|ξ|² ≤ √n M|ξ|² ≤ (√n M/λ) ξ·A⁰ξ`.

**Changed** (old → new): the supplier bullet "§1.2: … ; its notion of a speed `c ≥ 0`, …" became
two bullets. One is "§1.2: … the predicate …". The other is "Conventions, *Propagation speed*: its
notion of a speed `c ≥ 0`, … for all `(t, x)` and `|ω| ≤ 1` (§1.2 gives the existence of one when
the `Aʲ` are bounded)".

In the plan, the supplier entry now reads "its notion of speed (Conventions, Propagation speed;
§1.2 gives one for bounded Aʲ)", and `sections` gains "Conventions".

**Same pattern elsewhere.**
- The §5.2 comparison sentence now says "in the sense of SymmetricHyperbolicSystems' Conventions".
- §5.2 *Needs:* and plan 5.2 `prerequisites` gain the supplier's Conventions, because the
  comparison uses the definition.
- The Scope bullet gives §1.2 only the carrier and the predicate, which is correct.
- The §5.2 transport Check names no section.
- The compared formula is unchanged.

## Adversarial pass (statements added or changed)

Coordinates are `(t, x)`.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §7.1 continuity clause (repaired) | `G = ℝ`, `Ū = 0`, `K = [−1, 1]`, `‖U₀‖ = M`, `sup\|U₀\| < 1` | `(1 + 1/m)U₀`: norm `M(1 + 1/m) > M`, excluded; `(1 − 1/m)U₀`: norm `M(1 − 1/m) ≤ M`, values in `(−1, 1) ⊆ K`, solutions on `[0, T(M, K)]` | the clause is well posed | clause |
| same, degenerate | `K = {Ū}`; constant sequence; the limit | only datum `Ū`, constant solution; `U₀^m = U₀` trivial; the limit has norm `≤ M` (closed ball) and values in `K` (`Hᵏ_Λ → C_b` by §4.2, `K` closed) | consistent | none |
| Burgers scaling Check (new) | `u₀^λ = −e^{−λ²x²}`, `λ = 1, 10`, by numerical quadrature | `min u₀′ = −√2λe^{−1/2}`: `−0.8578`, `−8.5776`; `T* = 1.1658`, `0.11658`; `‖u′‖² = λ√(π/2)`: `1.2533`, `12.533`; `‖u″‖² = 3√(π/2)λ³`: `3.7599`, `3759.9` (closed forms and quadrature agree); values in `[−1, 0]` | the wrong model "`T` depends on `K` alone" fails for `λ > e^{1/2}/(√2 T)` | Check, plan test |
| §7.2 compact `K` | `[ρ_*, ρ^*] ⊆ I`, `v̄ − v₀ ∈ Hᵏ_Λ` | `\|v̄ − v₀\| ≤ C‖v̄ − v₀‖_{Hᵏ_Λ} ≤ CM` (componentwise, ℓ²-combined, same `C`); `ρ̄ ∈ [ρ_*, ρ^*]`; `K ⊆ I × E = G` compact; `F(Ū) = 0` since `F = 0` | §7.1 applies with `T(M, K)` | route |
| §7.2 density bound | `ρ_* = 1`, `C′ = 2`; `M = 0` | shrink to `1/4`: `ρ ≥ 1 − 2·(1/4) = 1/2`; at `M = 0` the bound on `‖∂_tρ‖_∞` is `0` and `ρ_*/(2·0)` is undefined, so `C′ > 0` is required | uniform | `C′ > 0` |
| §7.2 `C′` estimate | continuity equation (§1.2, §1.3) | `\|v·∇ρ + ρ div v\| ≤ (\|v₀\| + CR)C₁R + (ρ₀ + CR)√n C₁R`, `C₁` the `C¹_b` constant (`2k > n + 2`); no compact range of `ρ` in `I` is needed | uniform in `M`, `K` | route |
| §7.2 simple-wave Check | `p = ρ³/3`, `ρ̄ = 1 + e^{−x²}/2`, `v̄ = ρ̄ − 1`, `(ρ₀, v₀) = (1, 0)`, `[1, 3/2]` | `T(M, K) ≤ T* = 1.1658` for `M` at least the data norm | consistent | none |
| §7.2 full system | `L ⊆ 𝒪 ⊆ (0, ∞) × ℝ` compact | `ρ_* = min_L ρ > 0`; `Bρ = −ρ div v` as in §1.2, same `C′`; with `∫‖∇U‖_∞ < ∞` and `(ρ, s)` in a compact `L′ ⊆ 𝒪`: `\|∂_tv\| ≤ \|v\|\|∇v\| + C_{L′}(\|∇ρ\| + \|∇s\|)`, so by Grönwall `v` stays bounded, and the §7.1 criterion is the `(ρ, s)` criterion | consistent | wording |
| §8.3 consumer | data of §7.2 | `M` := the data norm; existence unchanged; Check `T < 1.1658` unchanged | consistent | none |
| Supplier speed (F02) | transport `a = 1`; wave system; bounded `Aʲ` | least speed `\|a\| = 1` in both roadmaps; wave speed `1`, `Σ ωⱼAʲ` eigenvalues `±‖ω‖`; `√n M/λ` as computed above | the quoted formula equals the supplier's | locator |

## Checks

**Dependency check.**

```text
candidate: CompressibleEulerEquations is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2241 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The new *Needs:* entries are §4.2 (internal, earlier) and
SymmetricHyperbolicSystems' Conventions (an existing supplier). No notion was moved down.

**Citations.** `roadmaps resolve` on the README lists no cross-roadmap citation and no Lean name
that is found nowhere. The worker's earlier lead, `LinearSystem.IsSymmetricHyperbolic`, is
SymmetricHyperbolicSystems' declaration (its §1.2), and the resolver no longer lists it.

**Plan.** `design/plan.json` parses: 8 layers and 54 targets (37 theorems, 12 definitions, 4
constructions, 1 example). It has no dangling `target:` prerequisite, every definition and
construction has at least three tests, and `gaps: []`. Plan 5.2, 7.1 and 7.2 and the supplier
entry agree with the README.

**Sources.** No locator was added or changed. The settled entries Kato1975, Majda1984 and
Dafermos2016 (uncertified) are still cited by locator for §7.1–§7.2. `needs-references.toml` was
not written.

**Ownership.** No new object was introduced. The only new citation is SymmetricHyperbolicSystems'
Conventions, read at that roadmap's open head. I did not run a fresh ownership search against the
open pull requests, because there was nothing new to own.

**Style.** I pattern-searched the added lines for LaTeX delimiters, process words and machine
paths: none.

## Gate failures

None were listed for this round.

## Notes for the maintainer

- The headline §7.2 is now stated with a uniform time on the class
  `‖(ρ̄ − ρ₀, v̄ − v₀)‖_{Hᵏ_Λ} ≤ M`, `ρ_* ≤ ρ̄ ≤ ρ^*`, and with continuity on that class. When
  `Suggested.lean` is written, its §7.2 statement should carry `M` and this quantifier order.
- No declaration name changed. No other roadmap cites this one.
- The review's "For the human reviewers" section raises four questions: the merge-order placement
  of LorentzianGeometry and SymmetricHyperbolicSystems, the Majda1984 share, the LukNotes licence,
  and the scope of characteristic data. As the brief requires, nothing was changed for them.
- No untrusted text contained instructions.
