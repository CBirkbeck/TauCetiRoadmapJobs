# FIX-DESIGN-HardSphereDynamicsAndKineticLimits~16

This round repairs the findings of `REV-DESIGN-HardSphereDynamicsAndKineticLimits~15`. The review has one finding (P3). It is right and was applied, and the same omission was repaired in three more targets. Files changed:

- `packages/HardSphereDynamicsAndKineticLimits/design/README.md`:
  - §7.1: the free-identification clause now names §3.4 and §5.1; the `*Needs:*` line is updated;
  - §10.4: the `*Needs:*` line is updated;
  - pattern repairs: §10.5 (`*Needs:*` line, and "of §1.1" in the corollary); §7.2 (`*Needs:*` line and one route clause); §9.5 (`*Needs:*` line and one route sentence).
- `packages/HardSphereDynamicsAndKineticLimits/design/plan.json`:
  - prerequisites added to targets 7.1 (`target:3.4`, `target:5.1`), 7.2 (`target:3.1`), 9.5 (`target:8.3`), 10.4 (`target:1.1`) and 10.5 (`target:1.1`);
  - the statement of target 7.1 now says "on the closed interval" and names `S_t` as the free flow of 3.4, matching the README.

`sources.toml` is unchanged and no source was fetched. No definition, hypothesis, theorem statement, Check or Lean name changed. No section was added, moved or renumbered, and no `### Dependencies` line changed.

## F01 (P3) — applied

§7.1 `*Needs:*` "§5.2, §5.5, §6.4" → "§3.4, §5.1, §5.2, §5.5, §6.4". The clause `T_t Z = S_t Z` now says "with `S_t` the free flow of §3.4" and "(this is free motion between contacts, §5.1; …)". §10.4 `*Needs:*` "§1.3, §9.5, §9.6, §10.3" → "§1.1, §1.3, §9.5, §9.6, §10.3". Plan targets 7.1 and 10.4 gain the matching prerequisites.

**Verification.** The finding is right.

- §7.1 claims `T_t Z = S_t Z` for `Z ∈ G` with no contact on the closed interval between 0 and `t`. `S_t` is defined only in §3.4. The proof is the "free motion between contacts" bullet of §5.1: with no contact on the interval, `σ_M` is the identity at each time of `𝒯` there, so the velocity is constant and the positions move by `π(t v_i)`. None of §5.2, §5.5 and §6.4 states this.
- §10.4 takes "a structure `[FlatPositionSpace d 𝕋^d]` of §1.1" as a binder and names §1.1 by number. Its last Check works with the axioms of that class.

**Pattern.** First, a mechanical pass: for all 45 targets, every `§` reference in the statement and route (the text before `API:` and `**Checks.**`) was compared with the `*Needs:*` line. Then a pass by object: every target was read for objects named in its statement or route whose defining section is not listed.

A section counts as needed when the statement or route:
- cites it by number;
- binds its class or structure on a named carrier;
- uses a fact it proves; or
- states an identity with an object that only it defines and that no listed section has as its subject.

An object counts as reached through a listed section when it enters only through the definition of that section's object (for example `𝒟̄` through `G ⊆ 𝒟̄` in §5.5). Such an object needs no separate entry.

Beyond §7.1 and §10.4, three targets fail this test. Each was repaired the same way: one item on the `*Needs:*` line and one plan prerequisite, plus a route clause or a "§" pointer where the step was implicit.

- **§10.5** binds the same structure `[FlatPositionSpace d 𝕋^d]` as §10.4 for its corollary, and its first theorem is stated "on a flat position space". Added: §1.1. The corollary now says "a structure `[FlatPositionSpace d 𝕋^d]` of §1.1".
- **§7.2**, route: "`G` and `𝒟̄ᶜ` are disjoint invariant Borel sets (§5.5, §6.4, §7.1)". Three of the four properties come from the listed sections. The fourth, that `𝒟̄ᶜ` is Borel, comes from the closedness of `𝒟̄` (§3.1 API). It is needed because ClassicalErgodicTheory §3.5 item 1 (at its head: "a measurable set `X₀` with `μ X₀ᶜ = 0`") asks for a measurable carrier `G ∪ 𝒟̄ᶜ`. The clause now attributes each property: `G ⊆ 𝒟̄` by §5.5, `G` Borel by §6.4, `𝒟̄ᶜ` open because `𝒟̄` is closed (§3.1), invariance by §7.1. Added: §3.1.
- **§9.5** claims that `F_n(t)` is symmetric and vanishes off `𝒟̄_n`. The `p`-th term of its series is `μ^{−n}/p!` times the marginal of order `n` of `W_{n+p}(t)`, and the support and symmetry of such marginals are statements of §8.3. §8.4, which is listed, says explicitly that it does not use the support condition of §8.3. A one-sentence route was added: `W_{n+p}(t)` is symmetric, nonnegative and vanishes off `𝒟̄_{n+p}` (§8.1, with `W⁰_{n+p}` symmetric by §9.3), so each term is symmetric and vanishes off `𝒟̄_n` by §8.3. Added: §8.3.

The other object-level hits were read and need no change:
- Layer 4 uses its own `S_s(a, u) = (a + s u, u)` on relative coordinates and the reversal of §4.2, not §3.3–3.4.
- §4.5's `B_s` is the subject of §4.4, which is listed.
- In §5.4–§6.4, `𝒟̄` enters through §5.1, §5.5, §6.1 or §6.2.
- In §7.3, ℛ is the subject of §5.3 and `P`, `H` of the conservation bullet of §5.1, both listed.
- §7.4's `G` comes through §7.2.
- §8.2's collision times and jump law come through §7.1's trajectory map.
- §9.3's flat torus comes through §1.4.
- In §9.6 and §10.1, `𝒟̄_n`, `T_t` and `F_n` come through §9.3, §7.5 and §9.5.
- §10.4 uses the flow only through §9.5's correlation functions.

The build order does not change: every added section is earlier than the target that cites it, and lies in a layer that its `### Dependencies` line already names.

## Adversarial pass on the changed text

Unless stated otherwise: ε = 1 and d = 2 on `E`. The head-on witness is `x_1 = (2, 0)`, `x_2 = 0`, `v_1 = (−1, 0)`, `v_2 = 0`.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §7.1 `T_t Z = S_t Z` on `G` with no contact on the closed interval | head-on witness, `t = 0.5`; same, `t = 3`; outgoing contact state `x_1 = (1, 0)`, `x_2 = 0`, `v_1 = 0`, `v_2 = (−1, 0)` at `t = −1`; grazing state off `G`; `N = 1` | `t = 0.5`: both give `x_1 = (1.5, 0)`, `x_2 = 0`. `t = 3`: contact at 1, excluded; `T_3` gives `(1, 0), (−2, 0)`, `S_3` gives `(−1, 0), 0`. `t = −1`: contact at time 0, which lies in `[−1, 0]`; `T_{−1}` gives `(2, 0), 0`, `S_{−1}` gives `(1, 0), (1, 0)` (overlapping); on `(−1, 0)` the distance is `1 − s > 1`, so a half-open interval would wrongly admit it. Grazing: `T_1 Z = Z`, while `S_1` gives `x_1 = (1, 1)`. `N = 1`: `T_t = S_t` | True as stated, with "closed" and `Z ∈ G` both needed | `*Needs:*` +§3.4, +§5.1; plan statement says "closed" |
| §7.2 carrier `G ∪ 𝒟̄ᶜ` is Borel | `N = 2` on `E`; `N ≤ 1`; unit torus, ε = 0.4, `N = 8` | `𝒟̄_2 = {‖x_1 − x_2‖ ≥ 1}` is closed and `𝒟̄ᶜ = {‖x_1 − x_2‖ < 1}` is open, of infinite measure. `N ≤ 1`: `𝒟̄ᶜ = ∅`. Torus: `𝒟̄ = ∅`, `𝒟̄ᶜ` is everything. In every case the complement of the carrier is `𝒟̄ ∖ G`, null by §6.4 | True; measurability of the carrier needs §3.1 | `*Needs:*` +§3.1; route clause |
| §9.5 `F_n(t)` symmetric, zero off `𝒟̄_n` | `n = 2` with `x_1 = x_2`; `n = 2` with `x_2 − x_1 = (0.5, 0)`; `n = 1`; `p = 0` term; unit torus, ε = 0.4, `d = 2` | Coinciding positions: every extension has `‖x_1 − x_2‖ = 0 < 1`, so `W_{2+p}(t) = 0` and `F_2(t) = 0`, matching the third Check of §9.6 (`F_2(0) = 0` at `x_1 = x_2`). Distance 0.5 < 1: same, 0. `n = 1`: `𝒟̄_1` is everything, so the claim is vacuous. `p = 0`: the marginal of order `n` of `W_n(t)` is `W_n(t)` (§8.3, `s = N`). Torus: `W_N = 0` for `N ≥ 8`. `W⁰_N = μ^N Π f⁰(z_i) 1_{𝒟̄_N}/Z` is symmetric because `𝒟̄_N` is invariant under relabelling | True | `*Needs:*` +§8.3; route sentence |
| §10.4 binder of §1.1 | quarter turn `B(a_1, a_2) = (−a_2, a_1)` in the last Check | `B(0.3, 0) = (0, 0.3)`, and `‖π(0, 0.3)‖ = 0.3 = |(0.3, 0)|`; at radius 0.6, `B(0, 0.5) = (−0.5, 0)` and `B(0, −0.5) = (0.5, 0)` have the same class, so injectivity fails at norm `0.5 < 0.6`. The Check uses the lift, injectivity and local-measure axioms of §1.1 | Statement unchanged; §1.1 needed | `*Needs:*` +§1.1 |
| §10.5 binder of §1.1 | `d = 1` Check on the unit circle (ρ = 1/2); Poisson Check | `μ_ε = ε⁰ = 1`, `P_ε(N ≠ 1) → 1 − e^{−1} ≈ 0.63212`; `Var(N/2) = 2/4 = 1/2`. Both are instances of the §1.1 class on the circle | Statement unchanged; §1.1 needed | `*Needs:*` +§1.1; "of §1.1" in the corollary |
| README/plan agreement | all 45 targets | Every `*Needs:*` section equals the plan's `target:` prerequisites; the only differences reported are the four "ClassicalErgodicTheory §3.5" citations (§7.2, §7.5, §8.1, §9.4), which are roadmap prerequisites. No prerequisite points forward. 174 Check bullets against 174 plan tests, equal per target. Layers used: L7 {3, 5, 6}, L9 {1, 2, 3, 7, 8}, L10 {1, 2, 7, 9}, matching "Layers 3 and 5–6", "Layers 1–3 and 7–8" and "Layers 1–2, 7 and 9" | Agree | none |

## Checks run

**Dependency check** (gate, `--only HardSphereDynamicsAndKineticLimits`):

```text
candidate: HardSphereDynamicsAndKineticLimits is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2254 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line. No cross-roadmap citation was added or changed. ClassicalErgodicTheory §3.5 was re-read at the head of its open pull request: items 1, 3 and 4 say what the supplier contract says, and item 1 requires a measurable carrier, which is the step §7.2 now attributes to §3.1. That roadmap is another author's open pull request adding a new roadmap folder. It is not in the merge order, so the tool cannot see the edge. By reading, the edge points one way.

**Other checks.**
- `plan.json` parses and keeps its formatting: it round-trips exactly with one-space indentation.
- No LaTeX delimiters, machine paths or process words in the added text.

**Not run.**
- No Lean elaboration and no `#check` comparison. This is the design lane: the package has no `Suggested.lean`, and no Lean name was added, removed or changed.
- No new ownership or overlap check against open pull requests was needed, because no new object or construction was introduced. `scratch/overlaps.md` lists no pull request that changes this roadmap, no dropped id and no second copy.

## For the maintainer

- No name that another roadmap could cite changed, and no section moved or was renumbered.
- The review's "For the human reviewers" section lists no finding, and nothing was changed because of it.
- Untrusted text: the review contains no instruction outside its findings.
