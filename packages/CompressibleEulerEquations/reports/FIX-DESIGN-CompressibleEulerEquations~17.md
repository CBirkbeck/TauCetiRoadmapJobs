# FIX-DESIGN-CompressibleEulerEquations~17

The review `REV-DESIGN-CompressibleEulerEquations~16` has three findings, all P3. All three are
correct, and all three were applied. F01 also gained a Check. F02 was applied to the whole
pattern, not only to the two lines the review names.

## F01 (P3) — applied

**Old → new.** §7.2, full system:

- Old: "with `s̄ − s₀ ∈ Hᵏ_Λ` and `(ρ̄, s̄)(E)` contained in a compact subset `L`".
- New: "for `(𝒪, P)`, a background `(ρ₀, v₀, s₀)` with `(ρ₀, s₀) ∈ 𝒪`, `v₀ ∈ E`, data with
  `s̄ − s₀ ∈ Hᵏ_Λ` as well …". The triples and `∇(ρ, v, s)` replace the pairs.
- The route now says why `Ū ∈ G`.
- New Check: the witness `s₀ = 5`.
- Plan target 7.2: the statement, two new hypotheses, and the test
  `full_background_outside_states`.

**Verdict.** The finding is correct. Before this round, §7.2 introduced only `(ρ₀, v₀) ∈ I × E`,
and the full-system clause used `s₀` without saying what it is. The route applies §7.1 at
`Ū = (ρ₀, v₀, s₀)`, and §7.1 needs `Ū ∈ G = {(ρ, v, s) : (ρ, s) ∈ 𝒪}` (§2.2).

The reviewer's witness, recomputed:

- `Λ = 2πℤ`, `n = 1`, `𝒪 = (0, ∞) × (0, 1)`, data `(1, 0, 1/2)`, and `s₀ = 5`.
- `‖−9/2‖²_{Hᵏ_Λ} = (81/4)·2π = 81π/2`, since the derivatives vanish.
- `5 ∉ (0, 1)`, so `Ū ∉ G`.

When `Λ` is not of full rank, the hypothesis holds automatically. §4.2 gives decay of `s̄ − s₀`
orthogonally to the span `V ≠ E`, so `(ρ₀, s₀)` lies in the closure of `(ρ̄, s̄)(E)`, which is
inside `L`, because `L` is compact.

**Also fixed in the same sentence.** For the full system, the continuation criterion now reads
`∫‖∇(ρ, v, s)‖_∞ = ∞`. This is exactly what §7.1 gives for `U = (ρ, v, s)`.

The old wording, read literally, gave `∇(ρ, v)`. That version is also true, but it needs a
transport bound that the route does not contain:

- `Bs = 0` gives `|∇s(t)|_∞ ≤ |∇s̄|_∞ exp ∫‖∇v‖_∞`.
- So the stated form is the one the route proves.

**Same pattern elsewhere.** I searched for every use of a background state:

- §7.1 already has `Ū ∈ G`.
- §7.3 has a state `Ū ∈ G`.
- §8.3 cites "the hypotheses of §7.2", and now inherits the background condition.
- The Checks of §5.2, §6.1, §8.1 and §8.3 use constant states `(ρ₀, v₀)` with `ρ₀` the density
  of an equation of state, which is in `I`.

No other statement introduces a full-system background.

## F02 (P3) — applied

**Old → new.**

- §5.3: "§§4.2–4.3, …" → "§2.1 (the system), §§4.1–4.3, …".
- §7.1: "§§4.2–4.4, …" → "§2.1 (the system and the dominating cone map `κ`), §§4.1–4.4, …".
- Plan targets 5.3 and 7.1 gain `target:2.1` and `target:4.1` in their prerequisites.

**Verdict.** The finding is correct:

- §5.3 opens "Fix a quasilinear symmetric hyperbolic system", and none of its listed items
  (§§4.2–4.4, §5.1) reaches §2.1, even transitively.
- §7.1's uniqueness clause uses `κ` of §2.1 directly.

**Same pattern elsewhere.** The pattern is "a section's statement is about an object that its
`*Needs:*` line does not name". I read every `*Needs:*` line against the objects its statement
uses, and repaired the remaining occurrences:

- §7.2: added "§§1.1–1.3" (the statement is about equations of state and Euler solutions) and
  "§4.1". Plan 7.2 gains `target:1.1`, `target:1.2`, `target:1.3` and `target:4.1`.
- §5.4: added "SymmetricHyperbolicSystems §1.2", the linear system its statement opens with, and
  "§§4.1–4.4". Plan 5.4 gains `roadmap:SymmetricHyperbolicSystems §1.2` and `target:4.1`.
- §6.1: added "§3.1", because the Euler reading of the spacelike condition cites the acoustical
  form. Plan 6.1 already listed `target:3.1`, so the README now agrees with the plan.
- §7.3: added "§4.1", for `Hᵏ(E)` and `Hᵏ_Λ`. Plan 7.3 gains `target:4.1`.
- Layer 7 `### Dependencies` and "How to read the build" now name Layer 1, for §7.2.

These lines already name their carriers, so I did not change them: §5.2, §6.2, §8.1–§8.4, and
Layers 1–4.

## F03 (P3) — applied

**Old → new.** §1.3, the constant-entropy reduction: "on each interval `J`" → "on each open
interval `J`".

**Verdict.** The finding is correct. §1.1 defines a barotropic equation of state on an open
interval, and plan 1.3.1 and the §1.1 API bullet already say "open interval".

**Same pattern elsewhere.** I searched for every "interval" without "open". This was the only
one about an equation of state. The rest are parameter intervals of causal curves, which are
deliberately general (one-point intervals are admitted).

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §7.2 full system, background `(ρ₀, s₀) ∈ 𝒪` | `Λ = 2πℤ`, `𝒪 = (0,∞) × (0,1)`, data `(1, 0, 1/2)`, with `s₀ = 5`, `1/2` and `1/4` | `s₀ = 5`: squared norm `81π/2`, `(1, 5) ∉ 𝒪`, excluded. `s₀ = 1/2`: `Ū ∈ G`, constant solution, `T* = ∞`. `s₀ = 1/4`: `s̄ − s₀ = 1/4`, squared norm `2π/16 = π/8`, `(1, 1/4) ∈ 𝒪`; the same constant solution, since uniqueness does not depend on the background | holds; the background is needed |
| Same, `Λ` not of full rank | `Λ = 0`, `n = 1`, `s̄ = 1/2 + e^{−x²}/4` with `𝒪 = (0,∞) × (0,1)` | `s̄(x) → 1/2` as `|x| → ∞`, so `s̄ − s₀ ∈ L²` forces `s₀ = 1/2`, and `(ρ₀, 1/2)` lies in the closure of the range. The range is `(1/2, 3/4]`, and its closure `[1/2, 3/4] ⊆ (0, 1)` | automatic, as the Check says |
| Route, compact `K` for the full system | the data above, `C` the embedding constant | `K = {(ρ, s) ∈ L} × B̄(v₀, CM)` is compact, `⊆ G` since `L ⊆ 𝒪`, and contains every datum since `|v̄ − v₀| ≤ C‖v̄ − v₀‖_{Hᵏ_Λ} ≤ CM` | holds |
| Continuation with `∇(ρ, v, s)` | expanding flow `v = x/(1+t)`, `n = 1`, with entropy `s = s̄(x/(1+t))` | `∂_xv = 1/(1+t)` and `∫₀ᵗ = log(1+t)`. Actual `|∂_xs| = |s̄′|/(1+t)`, against the bound `|s̄′| e^{log(1+t)} = (1+t)|s̄′|`. Hence `∇s` stays bounded while `∫‖∇v‖_∞ < ∞`, so the two criteria are equivalent, and §7.1 gives the stated one | holds |
| §1.3 reduction, open `J` | `𝒪 = (0,∞) × ℝ`, `J = [1, 2]` and `(1/2, 3)`; `𝒪 = ((0,1) ∪ (2,3)) × ℝ` with `ρ(D) = {1/2, 5/2}` (two components of `D`) | `[1, 2]` is excluded. `(1/2, 3)` qualifies. In the split case no open `J` with `J × {s₀} ⊆ 𝒪` contains both `1/2` and `5/2`, so the forward clause is vacuous and stays true. The converse holds on each component | holds |
| New `*Needs:*` items | §2.1, §3.1, §4.1, §§1.1–1.3, SymmetricHyperbolicSystems §1.2 | each section exists, and each is earlier in this roadmap's order or is a supplier already cited in §5.1; the dependency check reports 0 problems | holds |

## Checks run

**Dependency check** (the brief's command, run after the edits):

```text
candidate: CompressibleEulerEquations is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 237 roadmaps, 2243 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

**Other checks.**

- **Citations** (`roadmaps resolve` on the README, after the edits): there are no cross-roadmap
  citations and no Lean names that are found nowhere. The earlier lead
  `LinearSystem.IsSymmetricHyperbolic` is the supplier's declaration in SymmetricHyperbolicSystems
  §1.2, as the review recorded.
- **plan.json** parses. It now has 54 targets, and target 7.2 has 4 tests; `gaps` is still `[]`.
- **Suggested.lean**: the design stage has none. There was nothing to elaborate, and no
  `#check` comparison was possible.
- **sources.toml**: unchanged. No new source is cited, so `needs-references.toml` was not
  written.
- **Ownership**: no new object was introduced, so there is no ownership change.

## For the maintainer

- No id, heading, target name or section number changed, so no other roadmap's citation is
  affected.
- Plan target 7.2 has more hypotheses, and its statement now names the full-system background.
  §8.3 consumes it through "the hypotheses of §7.2" and needs no change.
- No text read during this round contained instructions.
