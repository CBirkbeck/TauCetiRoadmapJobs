# Repair of HardSphereDynamicsAndKineticLimits (design, round 7)

This round settles the three findings of `REV-DESIGN-HardSphereDynamicsAndKineticLimits~6`: F01, F02 and F03, all P3. I checked each one against the README, the plan and BGSS2023. All three are right and all three are applied.

I edited `packages/HardSphereDynamicsAndKineticLimits/design/README.md` and `packages/HardSphereDynamicsAndKineticLimits/design/plan.json`. I did not touch `sources.toml` and fetched no source. This is the design stage, so there is no `Suggested.lean` and I ran no Lean command.

## F01 (P3) — applied

§3.2: pieces are now "for `i ≠ j`, of the configurations of `𝒟̄`", and a sentence states `∂^±(j, i) = ∂^±(i, j)`. API "pairwise disjoint" → the reviewer's wording. A negative-control Check uses the reviewer's witness. Plan 3.2, `boundary_null` and a new test `pair_order` match.

## F02 (P3) — applied

§5.1: "constant off a set of contact times …" → "there is `𝒯 ⊆ J`, finite in every bounded subinterval, with `V` constant on every subinterval of `J` disjoint from `𝒯`". §5.4: forward clause uses contact-free subintervals (contact times shown locally finite); converse uses the same clause as §5.1. Head-on Checks and plan 5.1, 5.4 match.

## F03 (P3) — applied

Dependencies lines now list the directly cited layers; external parts unchanged. Layer 5: "3–4" → "2–4". Layer 6: "4–5" → "1 and 3–5". Layer 8: "7" → "3 and 7". Layer 9: "7–8" → "1–3 and 7–8". Layer 10: "7–9" → "1–2, 7 and 9".

## Evidence and the repaired pattern

### F01

- **Why the claim holds.** `ν_ji = −ν_ij` (§3.2 API; on the torus this is `ℓ(−ξ) = −ℓ(ξ)`, §1.1). Hence `⟨v_j − v_i, ν_ji⟩ = ⟨v_i − v_j, ν_ij⟩`, and the pieces for `(i, j)` and `(j, i)` are the same set. The reviewer's witness gives the value 1 for both orders.
- **The source.** BGSS2023 lines 148–152 also index the pieces by ordered `(i, j)`, but its sign is `±(v_i − v_j)·(x_i − x_j)`, which is symmetric. It also requires every other pair to be at distance `> ε`.
- **The `𝒟̄` wording.** The README's "configurations whose only contact pair is `{i, j}`" admitted other pairs at distance `< ε`. "Of `𝒟̄`" makes the set equal to the source's set. Consumers are unaffected: §3.3 already works inside `𝒟̄`.
- **Other places using the pieces.** §3.3 says "`σ_M` exchanges `∂^+(i, j)` and `∂^−(i, j)`; `ℛ` maps `∂^+(i, j)` to itself", and the plan's 3.3 test says the same. Both are true for the unordered pieces, so neither needed a change. No other ordered-index object in the roadmap is claimed to be disjoint:
  - pair maps are only said to commute for disjoint pairs;
  - near pairs are said to form a matching.

### F02

- **Why the claim holds.** On the head-on witness, `V` takes two values on `ℝ ∖ {1}`, so the literal reading excludes every collision.
- **Other occurrences of the wording.** It appeared in §5.1, in the §5.4 forward clause ("constant off the contact times of `Z`") and in the §5.4 converse, and in the plan's 5.1 and 5.4. All are repaired.
- **The converse in plan 5.4.** It listed neither left-continuity nor the constancy clause. Both are now stated.
- **Places already correct.** "Piecewise constant" in the §5.1 API and in §7.1 already had the intended meaning.

The new statements were checked as follows.

- **§5.1, consequences of the definition.** The jump condition `V(t) = σ_M V(t−)` has `σ_M = id` at a time with no contact. So `V` is continuous at every point of `𝒯` that is not a contact time, and is constant on every contact-free subinterval. The §5.1 API "free motion between contacts" therefore still follows.
- **§5.4, contact times are locally finite.** Let `t` be a contact time other than the least element of `J`, and suppose `t ∉ 𝒯`. Then `V` is constant near `t`. Write `a = ℓ(x_i(t) − x_j(t))` with `|a| = ε` and `⟨a, u⟩ > 0` (the pair is outgoing). Then `|a − h u|² = ε² − 2h⟨a, u⟩ + h²|u|² < ε²` for small `h > 0`. Since `‖π b‖ ≤ |b|`, the pair overlaps at `t − h`, which is a contradiction. So the contact times lie in `𝒯 ∪ {least element}`.
- **§5.4, constancy of `Y`.** The constancy of `Y` uses the contact times of `Z`, not `𝒯`, and this matters. Take the trajectory on `[0, 2]` that starts from the outgoing contact state `x_1 = (1, 0)`, `x_2 = 0`, `v_1 = 0`, `v_2 = (−1, 0)`; it has `𝒯 = ∅`. Yet `Y(0)` has velocities `((−1, 0), 0)`, while `Y(t)` has `(0, (−1, 0))` for `t ∈ (0, 2]`. The new wording covers this case: `[0, 2]` contains the contact time 0.
- **§5.4, the converse.** Contacts of `Y` that are not in `𝒯` can only occur at a greatest element of `J`. The trajectory's set is then `𝒯 ∪ {contact times}`, which is locally finite. The existential form of the clause is what lets the converse hold at a greatest element.

### F03

The five lines now equal the union of the sections cited by their layer's `*Needs:*` lines. I computed this mechanically, and the sets are the reviewer's.

The previous round read the internal lists transitively. The reviewer is right that Layers 3, 4 and 7 list layers directly, so the lines followed two conventions. They now follow one.

The same pattern one level down is a `*Needs:*` line that omits a section its own statement, route or API cites by number. A mechanical scan found four such lines, now repaired:

- §6.4: the route glues "(§5.2, §6.2)". `*Needs:*` §5.3, §5.5, §6.3 → §5.2, §5.3, §5.5, §6.2, §6.3. Plan 6.4 gains `target:6.2`.
- §7.3: the statement cites §5.5 for the invariance of `G`. `§5.5` is added; plan 7.3 gains `target:5.5`.
- §10.4: the API says "At `t = 0` every conclusion holds, by §9.6". `§9.6` is added; plan 10.4 gains `target:9.6`.
- §5.2: the route uses that `σ_M` is an involution (§3.3, from §2.1), and the plan already listed `target:2.1`. `*Needs:*` §5.1 → §2.1, §3.3, §5.1. Plan 5.2 gains `target:3.3`.

None of these changes a layer set. After the edits:

- every plan target's `target:` prerequisites equal its README `*Needs:*` sections, checked mechanically for all 45 targets;
- every prerequisite points to an earlier target;
- the plan has 167 tests, at least 3 per target.

The remaining section citations outside `*Needs:*` lines are all inside Checks, which are examples, not dependencies:

- §5.2 → §4.1;
- §7.1 → §3.4;
- §7.2 → §4.4;
- §7.4 → §1.4;
- §9.2 → §1.4;
- §9.5 → §9.4;
- §10.4 → §9.4;
- §10.5 → §9.4, §9.6.

## Adversarial pass

`E` is Euclidean space. The head-on witness is ε = 1, `x_1 = (2, 0)`, `x_2 = 0`, `v_1 = (−1, 0)`, `v_2 = 0`.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §3.2 symmetry `∂^±(j, i) = ∂^±(i, j)` | Reviewer's witness on `E`; unit torus ε = 0.3, `x_i = π(0.1, 0)`, `x_j = π(0.8, 0)`, `v_i = (−1, 0)`, `v_j = 0` | `⟨v_1 − v_2, ν_12⟩ = 1`, `⟨v_2 − v_1, ν_21⟩ = 1`. Torus: `ℓ(x_i − x_j) = (0.3, 0)`, `ℓ(x_j − x_i) = (−0.3, 0)`, signs `−1` and `⟨(1, 0), (−1, 0)⟩ = −1` | Equal in both orders | Sentence added |
| §3.2 disjointness and nullity | Pairs `{1,2}` against `{1,3}`; signs `+` against `−`; `𝒟`; d = 1 and d = 2 | Only one contact pair, so at most one unordered pair. `1 > 0` and `−1 > 0` exclude each other. A piece has distance exactly ε, so it is not in the open `𝒟`. Piece ⊆ `{‖x_1 − x_2‖ = ε}`: a circle of radius 1 (d = 2) or 2 points (d = 1) per `x_2`, null by Fubini | True for unordered pieces | API bullet rewritten |
| §3.2 "of `𝒟̄`" | `N = 3`, ε = 1, `x_1 = (1, 0)`, `x_2 = 0`, `x_3 = (0.5, 0)` | Distances 1, 0.5, 0.5: only contact pair `{1, 2}`, but 0.5 < ε. Old wording admits the state; BGSS2023 line 150 requires `> ε` and excludes it; new wording excludes it | Matches source | Definition narrowed to `𝒟̄` |
| §3.2 degenerate `N ≤ 1`, matchings | `N = 1`; `N = 4` with contacts `{1,2}`, `{3,4}` | No pairs, no pieces. Two contact pairs, so in no piece; the configuration is in the contact set but not in a piece | Consistent | none |
| §5.1 constancy clause | Head-on on ℝ; `N = 1`; `J = [0, 1]`, `𝒯 = {1/n}`; head-on with `𝒯 = {1, 2}` | `V = ((−1,0),0)` on `(−∞,1)`, `(0,(−1,0))` on `(1,∞)`, `V(1) = (0,(−1,0))`. Jump: `⟨v_1 − v_2, ν⟩ = −1`, `σ` gives `(0, (−1,0))` ✓. `N = 1`: `𝒯 = ∅`. `{1/n}` is infinite in `[0,1]`: excluded. At `t = 2` the distance is `|(1,0) − (−1,0)| = 2 > 1`, so there is no contact and the jump condition forces `V(2) = V(2−)` | Admits collisions, excludes accumulation | Clause rewritten; Check 2 extended |
| §5.1 API, free motion between contacts | Head-on on `(1, 3)` | No contact time; `V` constant `(0, (−1, 0))`; positions `(1, 0)` and `(1 − t, 0)` | Still follows | none |
| §5.4 contact times locally finite | Head-on, assuming `1 ∉ 𝒯` | With `V ≡ (0, (−1,0))` near 1: `x_2(s) = (1 − s, 0)`, distance `s < 1` for `s < 1`, so the pair overlaps | Contact times ⊆ `𝒯 ∪ {min J}` | Reason added |
| §5.4 forward, constancy of `Y` | Head-on on ℝ; `J = [0, 2]` from the outgoing state at 0 | `Y` velocities `((−1,0),0)` on `(−∞,1]` and `(0,(−1,0))` on `(1,∞)`. On `[0, 2]`: `σ_M V(0)`: `⟨(1,0),(1,0)⟩ = 1`, so `v_1' = (−1,0)`, `v_2' = 0`, while `Y = (0,(−1,0))` on `(0, 2]` | Constant off contact times of `Z`; not off `𝒯 = ∅` | Clause rewritten; Check extended |
| §5.4 converse | Head-on `Y` with `𝒯 = {1}`; `J = [0, 1]` ending at an incoming contact | `W(1) = ((−1,0),0)` incoming (`−1 < 0`); right limit `(0,(−1,0)) = σ_M W(1)`; `Z(1) = (0,(−1,0))`. At the endpoint, `Z(1) ≠ W(1)`, so the trajectory's set is `{1}` | Holds with the existential set | Clause rewritten (README and plan) |
| Dependencies lines, Layers 1–10 | Union of each layer's `*Needs:*` sections | 1: ∅; 2: ∅; 3: {1,2}; 4: {1,2,3}; 5: {2,3,4}; 6: {1,3,4,5}; 7: {5,6}; 8: {3,7}; 9: {1,2,3,7,8}; 10: {1,2,7,9}. Each equals its line | Agree | Five lines changed |
| `*Needs:*` lines §5.2, §6.4, §7.3, §10.4 | Explicit section citations in statement, route or API | §5.2 route: `σ_M` involution (§3.3, §2.1). §6.4 route "(§5.2, §6.2)". §7.3 "§5.5". §10.4 API "by §9.6". Layer sets unchanged: 5 → {2,3,4}, 6 → {1,3,4,5}, 7 → {5,6}, 10 → {1,2,7,9} | Agree; plan prerequisites equal README for all 45 targets | Four lines extended |

## Checks

Dependency check (output verbatim):

```text
candidate: HardSphereDynamicsAndKineticLimits is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2229 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line. As in earlier rounds, the roadmap supplier ClassicalErgodicTheory is another author's open pull request that adds a new roadmap folder. It is neither on main nor in `merge-order/ORDER.txt`, so the check does not see that edge. This round added no cross-roadmap citation.

Citations (`roadmaps resolve` on the edited README, against main and 475 open heads): no cross-roadmap citation and no Lean name was found missing.

Lean: this is the design stage and there is no `Suggested.lean`. I ran no Lean command, and the `#check` comparison had nothing to run on. No backticked name of this roadmap's own was added or removed.

Ownership: the repairs state no new construction, so no new ownership search was needed.

## For the maintainer

- No section, target or Lean name was renamed, renumbered or removed, so no citing roadmap is affected.
- The F03 repair supersedes the previous round's transitive reading of the internal layer lists. Every `### Dependencies` line now lists exactly the layers its sections' `*Needs:*` lines cite.
- This roadmap's pull request still has to name ClassicalErgodicTheory in its merge-order paragraph.
