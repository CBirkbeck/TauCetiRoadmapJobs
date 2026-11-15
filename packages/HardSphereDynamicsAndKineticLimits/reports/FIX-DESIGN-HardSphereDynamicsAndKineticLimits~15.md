# FIX-DESIGN-HardSphereDynamicsAndKineticLimits~15

This round repairs the findings of `REV-DESIGN-HardSphereDynamicsAndKineticLimits~14`. The review has two findings, both P3; both are right and both were applied. Files changed:

- `packages/HardSphereDynamicsAndKineticLimits/design/README.md`:
  - the two opening sentences of the Mathlib and Tau Ceti supplier contracts;
  - the route, a new fifth Check and the `*Needs:*` line of §8.2;
  - the same `*Needs:*` omission repaired in §3.3, §6.2, §6.4, §7.4 and §8.3, each with the clause of its route that uses the added section;
  - the `### Dependencies` lines of Layers 7 and 8.
- `packages/HardSphereDynamicsAndKineticLimits/design/plan.json`:
  - one prerequisite added to each of targets 3.3, 6.2, 6.4, 7.4, 8.2 and 8.3;
  - a new test `identity_off_goodSet` for target 8.2.

`sources.toml` is unchanged and no source was fetched. No theorem statement, definition, hypothesis or Lean name changed.

## F01 (P3) — applied

§8.2 `*Needs:*` gains §6.4, and plan target 8.2 gains `target:6.4`. The route now applies the pointwise identity `λ_N`-almost everywhere on `{W⁰ ≠ 0}`, since `𝒟̄ ∖ G` is null (§6.4). A new Check (plan test `identity_off_goodSet`) records the grazing witness. Layer 8 Dependencies: "Layers 1, 3 and 7" → "Layers 1, 3, 6 and 7".

**Verification.** The finding is right. The route proves `∫_0^∞ Lφ(t, T_t Z) dt = −φ(0, Z)` only for `Z ∈ G`, and then integrates against `W⁰`. `W⁰` vanishes off `𝒟̄`, not off `G`. Take the grazing state of §7.1: ε = 1, `x_1 = (2, 1)`, `x_2 = 0`, `v_1 = (−1, 0)`, `v_2 = 0`.

- Relative data: `a = (2, 1)`, `u = (−1, 0)`, so `D = 4 − 4 = 0`. There is a grazing contact at time 2, at `a + 2u = (0, 1)`.
- The state is in `𝒟̄`, since `|a| = √5 ≥ 1`. It is not in `G`, so `T_t Z = Z`.
- Take φ of the third Check of §8.2, with `θ(1/2) = 1`, `ψ(2) = 2`, `ψ'(2) = 1`. Then `Lφ(t, Z) = 2χ'(t) − χ(t)`.
- With χ ≥ 0 and χ = 1 on `[0, 3]`, the left side is `−2χ(0) − ∫_0^∞ χ ≤ −5`, while `−φ(0, Z) = −2`.

So the integration step needs `λ_N(𝒟̄ ∖ G) = 0`, which is the headline of §6.4. No listed section states it directly.

**Pattern.** I read every route and statement that uses a null set and compared it with its `*Needs:*` line. Five more targets had the same kind of omission, and each was repaired the same way: one item on the `*Needs:*` line, one plan prerequisite, and the route clause that uses it.

- §3.3, "ℛ agrees with `(X, −V)` outside a null set". `σ_M` moves velocities only at configurations with a contact pair. Those lie in the finite union of the sets `{‖x_i − x_j‖ = ε}`, which is null by the sphere nullness of §1.1 and Fubini. Added: §1.1.
- §6.2, "the complement of `S_{δ,R}` is `I` together with a null set". The incoming and grazing contact states lie in `𝒟̄ ∖ 𝒟`, which is null by §3.1. Added: §3.1. The grazing collisions of near pairs were already covered by §4.4 and §4.5.
- §6.4, "apply the reversal ℛ for negative times". The negative-time exceptional set is the image under ℛ of the positive-time one. It is null because ℛ is an involution of `𝒟̄` that preserves `λ_N` (§3.3). Added: §3.3.
- §7.4, "every `Z ∈ G` without contact (all but a null set)". `G` is conull by §7.2 (already listed). The contact states are null by §3.1. Added: §3.1.
- §8.3, specular inheritance; the plan's API already says "extra contacts of the integrated particles lie on null shells". I added a one-sentence route that uses §1.1 spheres and Fubini. Added: §1.1.

**Dependency lines.** Layer 7 Dependencies changed from "Layers 5–6" to "Layers 3 and 5–6". The Dependencies lines of Layers 3 and 6 already named the layers that were added. The build order does not change, because every added section comes earlier than the section that cites it.

**Mechanical comparisons after the edits.**
- The `*Needs:*` lines agree with the plan prerequisites for all 45 targets, in both directions. The only reports were §1.2 and §1.3, whose `*Needs:*` sits mid-line after the locator; I read both by hand and they agree.
- The number of Check bullets equals the number of plan tests for all 45 targets (174 tests).
- The layers named in each Dependencies line equal the layers of the plan prerequisites, for all ten layers.

## F02 (P3) — applied

README `## Exact supplier contracts`:
- "Every declaration below was read at the pinned Mathlib." → "The declarations below are cited as they stand at the pinned Mathlib."
- "Every declaration below was read at the pinned Tau Ceti." → "The declarations below are cited as they stand at the pinned Tau Ceti."

**Verification.** The finding is right. Both sentences reported something the author did, which breaks the timeless style. Upstream shows a comparable plain form: `TauCetiRoadmap/SobolevPolynomialApproximation/README.md` line 64 says "All at the pinned Mathlib."

**Pattern.** I searched the README, `plan.json` and `sources.toml` for "was read", "were read", "read at", "checked", "verified", "confirmed" and "opened". There are no other occurrences.

## Adversarial pass on the changed text

ε = 1 and d = 2 on `E` unless stated otherwise.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §8.2 route: pointwise identity used a.e. on `{W⁰ ≠ 0}` | grazing state of §7.1 (off `G`); head-on witness (in `G`) | grazing: `−2χ(0) − ∫_0^∞χ ≤ −5` against `−2`. Head-on (third Check): `t ↦ φ(t, T_t Z)` continuous at 1, so the piecewise FTC gives `−φ(0, Z) = −2χ(0)`. Fubini: `|W⁰ Lφ| ≤ ‖Lφ‖_∞ |W⁰|`, and `Lφ(t, ·) = 0` outside the bounded time support | Route sound with §6.4 | F01 |
| §8.2 new Check | `χ ≥ 0`, `χ = 1` on `[0, 3]`; `θ(1/2) = 1`; `ψ = id` on `[−10, 10]` | `D = 0`, `|a| = √5 ≈ 2.236 ≥ 1`, `H = 1/2`, `⟨v_1 − v_2, e_1⟩ = −1`, `Lφ = 2χ' − χ`, `∫_0^∞ Lφ = −2 − ∫χ ≤ −5`, `φ(0, Z) = 2` | True; without `χ ≥ 0` the bound `≤ −5` could fail, so the hypothesis is stated | new Check, test `identity_off_goodSet` |
| §3.3 "ℛ = (X, −V) off a null set" | `N = 1`; `N = 2` on `E`; unit circle, ε = 0.3 | `N = 1`: no pairs, empty set, ℛ = `(X, −V)` everywhere. `N = 2`: for fixed `x_2` the set of `x_1` is a unit circle in ℝ², null, so null by Tonelli. Circle: the sphere of radius 0.3 < ρ = 1/2 is two points, null | True | §1.1 added |
| §6.2 null part of the complement | contact state `x_1 = (1, 0)`, `x_2 = 0`, `v_1 = (−1, 0)`, `v_2 = 0`; grazing near pair `a = (1, 3)`, `u = (0, −1)` | the incoming contact state has `‖x_1 − x_2‖ = 1`, so it is in `𝒟̄ ∖ 𝒟`. `D = 9 − 9 = 0`: grazing data; for fixed `u ≠ 0` the cylinder `{|a − ⟨a, û⟩û| = 1}` is null, and so is `{u = 0}`. The pair change `(v_i, v_j) ↦ (u, w)` has determinant `2^d`, so null sets correspond | True | §3.1 added |
| §6.4 reversal step | grazing state `Z` of §7.1; `ℛZ = ((2, 1), 0; (1, 0), 0)` | `Z` grazes at time +2. `ℛZ` has `⟨a, u⟩ = 2 > 0`, so its forward motion is free, and backward `a − 2u = (0, 1)` grazes at time −2. So `Z` has no trajectory on `[0, t]` for `t ≥ 2`, and `ℛZ` has none on `[−t, 0]`, matching the bijection. `ℛℛ = id` on `𝒟̄`, and `λ_N(ℛ⁻¹A) = λ_N(A)` | True | §3.3 added |
| §7.4 "all but a null set" | outgoing contact state `x_1 = (1, 0)`, `x_2 = 0`, `v_1 = 0`, `v_2 = (−1, 0)` (in `G`); a state without contact | contact state: `T_{−t}Z = ((1 + t, 0), 0; (−1, 0), 0) → ((1, 0), 0; (−1, 0), 0) ≠ Z` as `t → 0⁺`, so contact states must be excluded and their nullness is needed. No contact: no collision for `|t| < η`, and `T_t Z = S_t Z → Z` | True with §3.1 and §7.2 | §3.1 added |
| §8.3 inheritance route | `N = 3`, `s = 2` on `E` with `x_1 = (1, 0)`, `x_2 = 0`; unit torus, ε = 0.3; `s = N`; `s = 1` | `x_3` in contact: two unit circles, null in ℝ². Off them the contacts are `{12}` and `σ_M(V_2, v_3) = (σ_{ν_12}(v_1, v_2), v_3)`; where `|x_3 − x_i| < 1`, `W_3 = 0` on both sides. Torus: circles of radius 0.3 < 1/2, null. `s = N`: nothing integrated. `s = 1`: no contacts, vacuous | True | §1.1 added, route sentence |
| Layer 7 and 8 Dependencies | plan prerequisites per layer | Layer 7 uses {3, 5, 6}; Layer 8 uses {1, 3, 6, 7}; Layers 3 and 6 unchanged ({1, 2} and {1, 3, 4, 5}) | Agree | two lines |
| F02 sentences | upstream phrasing | `SobolevPolynomialApproximation/README.md:64` "All at the pinned Mathlib." | Timeless | two lines |

## Checks run

**Dependency check** (gate, `--only HardSphereDynamicsAndKineticLimits`):

```text
candidate: HardSphereDynamicsAndKineticLimits is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 241 roadmaps, 2247 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line. No cross-roadmap citation was added or changed. The ClassicalErgodicTheory §3.5 edge is as before: it is another author's open pull request that adds a new roadmap folder, and it is not in the merge order, so the tool cannot see the edge.

**Other checks.**
- `plan.json` parses as JSON.
- The mechanical README/plan comparisons described under F01 show no difference.
- The added text contains no LaTeX delimiters, machine paths or process words.

**Not run.**
- No Lean elaboration and no `#check` comparison. This is the design lane: the package has no `Suggested.lean`, and no Lean name was added, removed or changed.
- Ownership against open pull requests needed no new check, because no new object or construction was introduced.

## For the maintainer

- No name that another roadmap could cite changed, and no section moved or was renumbered.
- §8.2 now has five Checks, and plan target 8.2 has five tests.
- Untrusted text: the review contains no instruction outside its findings.
