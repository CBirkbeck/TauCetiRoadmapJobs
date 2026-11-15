# FIX-DESIGN-HardSphereDynamicsAndKineticLimits~14

This round repairs the findings of `REV-DESIGN-HardSphereDynamicsAndKineticLimits~13`: three findings, all P3, all verified right and applied. Files changed:

- `packages/HardSphereDynamicsAndKineticLimits/design/README.md`: the route of §4.3, the `*Needs:*` line of §7.2, and the `### Dependencies` line of Layer 7.
- `packages/HardSphereDynamicsAndKineticLimits/design/plan.json`: a new test `grazing_admitted` of target 5.2.

`sources.toml` is unchanged and no source was fetched. No statement, definition, hypothesis or Lean name changed.

## F01 (P3) — applied

§4.3 route: "with `w = da + τ du` the differential of `Y + τ U'` (where `(Y, U') = C(a, u)`) is `R_q w`" → "with `w = da + τ du` and `(Y, U') = C(a, u)`, the combination `dY + τ dU'` of the two differentials, with τ held at its value at the point, is `R_q w`: since `Y + τ U' = q` and differentiating `|q|² = ε²` gives `dτ = −⟨q, w⟩/⟨q, u⟩`, one has `dY + τ dU' = w + (u − R_q u) dτ = w − 2⟨q, w⟩q/ε²`".

**Verification.** The finding is right. `Y + τ U' = a + τ(u − R_q u) + τ R_q u = a + τ u = q`, so `d(Y + τ U') = dq = w + u dτ`, which is not `R_q w`. The intended quantity is `dY + τ dU' = dq − U' dτ = w + (u − R_q u) dτ`. With `u − R_q u = 2⟨q, u⟩q/ε²` and `dτ = −⟨q, w⟩/⟨q, u⟩` (from `⟨q, w + u dτ⟩ = 0`; `⟨q, u⟩ = −√D ≠ 0` on `U`), this is `w − 2⟨q, w⟩q/ε² = R_q w`.

**Recomputed on the section's Checks.**
- Witness ε = 1, `a = (2, 0)`, `u = (−1, 0)`, τ = 1, `q = (1, 0)`: `dτ = −(da_1 + du_1)/(−1) = da_1 + du_1`, as in the second Check. From the rows of `DC`: `dY = (−da_1, −da_2 − 2du_2)`, `dU' = (−du_1, 2da_2 + 3du_2)`, so `dY + dU' = (−da_1 − du_1, da_2 + du_2) = R_q w`; while `d(Y + τU') = dq = (0, da_2 + du_2)`.
- `dU' − R_q du = (0, 2da_2 + 2du_2) = (0, 2w_2)`: depends only on `w`, as the next clause says. Block matrix `[[R_q, 0], [∗, R_q]]`, determinant `(−1)² = 1` by `Matrix.det_fromBlocks_zero₁₂` (pinned: `(fromBlocks A 0 C D).det = A.det * D.det`).
- d = 1, `a > ε`, `u < 0`: `q = ε`, `R_q = −1`, `dτ = −w/u`; `w + 2u(−w/u) = −w = R_q w`; directly `C = (2ε − a, −u)`, `dY + τ dU' = −da − τ du = −w`.

**Pattern.** No other passage of the README or the plan speaks of a differential of a composite (searched "differential", "Y + τ"); the plan's 4.3 statement gives no route. The statement `det DC = 1` and all four Checks of §4.3 are unchanged.

## F02 (P3) — applied

Target 5.2 of `plan.json`: three tests → four, with new test `grazing_admitted` (characterisation): the uniqueness argument does not use the outgoing condition, which only excludes grazing contacts, so it gives uniqueness for the weaker notion that admits grazing contacts; at ε = 1, `a = (1, 3)`, `u = (0, −1)` of §4.1, `D = 0`, tangency at `q = (1, 0)` at time 3, `R_q u = u`.

**Verification.** The finding is right: §5.2 has four Check bullets and the plan had three tests. I also checked that the Check itself is true:
- At a time `t` that is not the least element of `J`, positions stay in `𝒟̄` before `t`, so `⟨v_i − v_j, ν_ij⟩(t−) ≤ 0` on each contact pair, and `V(t) = σ_M V(t−)` makes it `≥ 0`.
- At a least element of `J`, staying in `𝒟̄` after `t` gives `≥ 0`.
- So the outgoing condition (`> 0`) removes only the grazing value 0.
- The uniqueness route uses only `V(t) = σ_M V(t−)` forward and `V(t−) = σ_M V(t)` backward. `σ_ν` fixes pairs with `⟨v − w, ν⟩ = 0`.

The witness was recomputed: `D = (−3)² − 1·(10 − 1) = 0`, τ = 3, `q = (1, 0)`, `⟨q, u⟩ = 0`, `R_q u = u`, and `|a + su|² = 1 + (3 − s)² ≥ 1`. The free path therefore stays in `𝒟̄_2` and is the only candidate.

**Pattern.** I compared mechanically the Check bullets of all 45 numbered sections with the plan's test counts. After the repair they agree everywhere. Before it, 5.2 was the only difference.

## F03 (P3) — applied

§7.2: "*Needs:* §5.5, §6.2, §6.4, §7.1, ClassicalErgodicTheory §3.5 (item 1)." → "…, ClassicalErgodicTheory §3.5 (item 1), Mathlib `MeasureTheory.MeasurePreserving`."

**Verification.** The finding is right. Plan target 7.2 lists `mathlib:MeasureTheory.MeasurePreserving`, and the statement "`T_t` is measure preserving" is stated with that structure (pinned: `Mathlib/Dynamics/Ergodic/MeasurePreserving.lean:44`). It is in the `From Mathlib` contract (README line 54).

**Pattern.** The Layer 7 `### Dependencies` line now names `MeasureTheory.MeasurePreserving` beside the other Mathlib inputs of the layer, so it still agrees with the layer's `*Needs:*` lines, as Layer 3's line does. I compared every `*Needs:*` line with the plan's prerequisites mechanically, over all 45 targets and in both directions. No other difference remains. The script's only other reports were range notations (`§4.1–4.3`) and the mid-line `*Needs:*` of §1.1–1.3, and I read each of those by hand: they agree.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §4.3 route, `dY + τ dU' = R_q w` | d = 2 head-on witness; d = 1 general | witness: `(−da_1 − du_1, da_2 + du_2)` both sides; `d(Y + τU') = (0, da_2 + du_2)` ≠ (the old wording); d = 1: `−da − τ du` both sides | True as restated | F01 |
| §4.3 route, `dτ = −⟨q, w⟩/⟨q, u⟩` | witness; denominator | `da_1 + du_1`, equal to the second Check; `⟨q, u⟩ = −√D`, nonzero on `U` since `D > 0` | True | none |
| §4.3 route, `dU' − R_q du` depends only on `w` | witness | `(0, 2w_2)` | True | none |
| §4.3 `det DC = 1` | witness; d = 1 | `(−1)(−1)(−3 + 4) = 1`; `C = (2ε − a, −u)`, determinant `(−1)(−1) = 1` | Unchanged | none |
| 5.2 test `grazing_admitted` | grazing witness; outgoing condition at non-least and least times | `D = 0`, τ = 3, `q = (1, 0)`, `⟨q, u⟩ = 0`, `R_q u = u`, `min_s |a + su|² = 1`; sign `≤ 0` before, `≥ 0` after | True | F02 |
| §7.2 `*Needs:*` and Layer 7 Dependencies | plan prerequisites of 7.1–7.5 | 7.2 now lists the six prerequisites of the plan; the Layer 7 Mathlib list covers 7.2, 7.4, 7.5 | Agree | F03 |

## Checks run

**Dependency check** (gate, `--only HardSphereDynamicsAndKineticLimits`):

```text
candidate: HardSphereDynamicsAndKineticLimits is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 242 roadmaps, 2234 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line. The ClassicalErgodicTheory edge is unchanged: §7.2 still cites §3.5 item 1. That roadmap is another author's open pull request that adds a new roadmap folder, and it is not in the merge order, so the tool cannot see the edge. By reading, the direction is one-way, as the review notes.

**Other checks.**
- `plan.json` parses as JSON.
- The mechanical README/plan comparison shows no difference after the edits.
- The edited text has no LaTeX delimiters, machine paths or process words.

**Not run.**
- No Lean elaboration and no `#check` comparison. This is the design lane: the package has no `Suggested.lean`, and no Lean name was added, removed or changed.

## For the maintainer

- No name that another roadmap could cite changed, and no section moved.
- No ownership question arises: no new object was introduced.
- Untrusted text: the review contains no instruction outside its findings.
