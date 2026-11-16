# Repair of HardSphereDynamicsAndKineticLimits (design, round 8)

This round settles the three findings of `REV-DESIGN-HardSphereDynamicsAndKineticLimits~7`: F01, F02 and F03, all P3. I checked each one against the README, the plan and the sources. All three are right and all three are applied. F03 is a pattern, so I searched the whole roadmap for it. The search found seven more places with the same defect, and I repaired them too (listed under F03 below).

I edited `packages/HardSphereDynamicsAndKineticLimits/design/README.md` and `packages/HardSphereDynamicsAndKineticLimits/design/plan.json`. I did not touch `sources.toml` and fetched no source. I read only GST2013 lines 868–876 and BGSS2023 lines 158–170 from the cache, to check the packing locator. This is the design stage, so there is no `Suggested.lean` and I ran no Lean command.

## F01 (P3) — applied

§6.3 Check: "the bound is 0 apart from the grazing null set" → "`F` is null but not empty; the bound is not sharp". The new Check shows `I = ∅`, gives a grazing state failing step 1, and computes `C ≥ (t + 1)C₁`, `C₁ = 576π⁴ ≈ 56108`. Plan test `two_body` matches.

## F02 (P3) — applied

§5.5 Check: "the incoming contact state of §5.2" → the incoming state `(1, 0)`, `0`; `(−1, 0)`, `0` (the Conventions' Scattering witness, sign −1, not in `G`) and its image, §5.2's outgoing state (sign +1, in `G` as the head-on witness at time 1). Plan test `incoming_excluded` matches.

## F03 (P3) — applied

`*Needs:*` lines and plan prerequisites: §5.1 `§3.1–3.4` → `§3.1–3.5`; §8.2 + §3.5; §8.3 + §3.3, with the condition `W(X, V) = W(X, σ_M V)` written out; §9.5 + §7.3. Same pattern also repaired: §3.2, §3.4, §5.4, §8.1, §8.2 (+ §1.2, §3.1 or §7.3); forward references in §1.4, §3.3, §10.4.

## Evidence and the repaired pattern

### F01

- **The constant.** With `N = 2` the factor `μ_X(K_t)^{N−2}` is `μ_X(K_t)^0 = 1`, also in `ℝ≥0∞`. So `C₁ = 8 (2R d ω_d (ε + 2R)^{d−1})² vol(B^{2d}_R)`. At d = 2, ε = R = 1 this is `8 · (12π)² · π²/2 = 576π⁴ = 56107.636`. The constant `C` is the larger of `(t + 1)C₁` and `μ_X(K)^N vol(B^{dN}_R)`, so `C ≥ (t + 1)C₁ > 0`.
- **`F` is null.** There is no triple of distinct indices, so `I = ∅`. By §6.2 the complement of `S_{δ,R}` in `𝒟̄ ∩ {|V| ≤ R}` is then null. So `λ_N(F_j) = λ_N(A_j ∖ S_{δ,R}) = 0` for every `j`.
- **`F` is not empty.** This is my own witness, added so that the Check rules out the reading "F is empty". Take `E`, d = 2, ε = R = δ = 1, `t = 3`, `K = B(0, 3)`, and the state `x_1 = (2, 1)`, `x_2 = 0`, `v_1 = (−1, 0)`, `v_2 = 0`.
  - `|x_1| = √5 ≈ 2.236 < 3`, `|V| = 1 ≤ R`, and `ε + 4Rδ = 5 < ρ = ∞`.
  - Step 0: the pair is near (`√5 ≤ ε + 2Rδ = 3`). `D = (−2)² − 1·(5 − 1) = 0`, a grazing contact at time 2 > δ. There is no contact at time 0, so the state is in `S_{1,1}`, and `Φ_1` moves it freely to relative position `(1, 1)`.
  - Step 1 (`1 < t/δ = 3`): the pair is near (`√2 ≤ 3`). `D = 1 − (2 − 1) = 0` with `τ = 1 ≤ δ`, so the step fails.
- **Same pattern elsewhere.** The §6.1 Check ("`I = ∅` and the bound holds trivially") and the §6.4 Check (`N = 2`) were already stated correctly, so they are unchanged.

### F02

- **Not in `G`.** For the incoming state, `⟨v_1 − v_2, ν_12⟩ = ⟨(−1, 0), (1, 0)⟩ = −1`. §5.1 requires every contact pair to be outgoing at every time of `J`, so no trajectory passes through it.
- **The scattered state.** `σ_{(1,0)}((−1, 0), 0)` has `c = −1`, which gives `(0, (−1, 0))`. Its sign is `⟨(1, 0), (1, 0)⟩ = 1`.
- **In `G`.** The scattered state is the head-on witness at time 1: `x_1 = (2, 0) − (1, 0)`, `x_2 = 0`, velocities after the collision. Time translation (§5.3) gives a trajectory on ℝ through it at time 0.
- **The pattern.** I checked every "… of §k.n" reference in the README by grep: 17 of them. Every other one names an object that exists in the cited section: the witness of §2.1, the separate reflection of §2.1, the set `𝒯` of §5.1, the pair map of §4.5, the inelastic rule of §4.4, the grazing state of §7.1, `Z^{can}` of §9.2, the one-particle density of §9.3, and so on. The forward reference in §1.4 ("the closed hard-core set of §3.1") is treated under F03.

### F03

I recomputed, from `plan.json`, the transitive closure of each target's prerequisites. Then I read the statement, API bullets and proof route of every one of the 45 sections and listed the objects each one uses. Checks are tests and were not counted. I found these defects and repaired them:

| Section | Object used | Defining section | Repair |
|---|---|---|---|
| §5.1 (API "Conservation") | `P`, `H` | §3.5 | `*Needs:*` `§3.1–3.5`; plan 5.1 + `target:3.5` (the reviewer's repair) |
| §8.2 (API multiplier `a(t, P(V), H(V))`) | `P`, `H` | §3.5 | + §3.5; plan 8.2 + `target:3.5` (the reviewer's repair) |
| §8.3 (specular inheritance) | `σ_M` | §3.3 | + §3.3, and the condition is written out in the statement; plan 8.3 + `target:3.3`, statement names `σ_M` of 3.3 (the reviewer's repair) |
| §9.5 (route, "conservation of `H`") | `H ∘ T_t = H` | §7.3 | + §7.3; plan 9.5 + `target:7.3` (the reviewer's repair) |
| §3.2 (API "on `E`, `ν_ij = (x_i − x_j)/ε`") | the instance of `E` as a position space | §1.2 | + §1.2; plan 3.2 + `target:1.2` |
| §3.4 (API "On `E^N × E^N`, `S` is `TauCeti.flowOfLipschitz`"; "`S_t` does not preserve `𝒟̄`") | the `E` instance; `𝒟̄` | §1.2; §3.1 | + §1.2, §3.1; plan 3.4 + both |
| §5.4 (statement "On `X = E` with `d ≥ 2` …") | the `E` instance | §1.2 | + §1.2; plan 5.4 + `target:1.2` |
| §8.1 (statement "`W(t)` is symmetric when `W⁰` is") | relabelling equivariance of `T_t` | §7.3 | `§7.1, §7.2, §7.4` → `§7.1–7.4`; plan 8.1 + `target:7.3` |
| §8.2 (API "On `E`, a `C¹` function … has `Lφ = …`") | the `E` instance | §1.2 | + §1.2; plan 8.2 + `target:1.2` |
| §1.4 (statement "the closed hard-core set of §3.1 is empty") | `𝒟̄` | §3.1, which comes later | rewritten as "no `N` points have pairwise distances at least ε"; the emptiness of `𝒟̄^ε_N` is now a §3.1 API bullet citing §1.4 and BGSS2023 line 165. §3.1 `*Needs:*` + §1.4; plan 3.1 + `target:1.4`, an API item and a locator clause. The §1.4 Check is reworded to points |
| §3.3 (API "preserve total momentum and kinetic energy (`ℛ` reverses the momentum)") | `P`, `H` | §3.5, which comes later and depends on §3.3 | the clause is deleted from §3.3. §3.5 already proved the `σ_M` part; it now also states "`ℛ` preserves `H` and reverses `P`". Plan: 3.3 API item `reversal_conserves` deleted; 3.5 statement and API extended, and a new test `reversal_momentum` |
| §10.4 (API "The proposition implies the law of large numbers of §10.5") | `HardSphere.LanfordStatement.tendsto_empirical` | §10.5, which comes later | the bullet is deleted: §10.5 states and proves it. Plan 10.4 API item `lanfordStatement_lln` deleted |

There was no other gap. For example:

- `S_t` in §7.1 is reached through §5.1 → §3.4;
- the contact normals in §6.2 are reached through §5.1 → §3.2;
- `ℛ` in §5.5 and §6.4 is reached through §3.3;
- the velocity bound in the §6.3 route is reached through §5.1 → §3.5, now that §5.1 lists §3.5;
- §7.3's `P` and `H` are reached through §5.1 → §3.5.

**Layer lines.** Layer 5 now cites §1.2 (in §5.4), so its `### Dependencies` line changes from "Layers 2–4" to "Layers 1–4". Layer 8 now cites §1.2 (in §8.2), so its line changes from "Layers 3 and 7" to "Layers 1, 3 and 7". I recomputed every layer's union of directly cited sections mechanically:

| Layer | Sections cited |
|---|---|
| 1 | none |
| 2 | none |
| 3 | {1, 2} |
| 4 | {1, 2, 3} |
| 5 | {1, 2, 3, 4} |
| 6 | {1, 3, 4, 5} |
| 7 | {5, 6} |
| 8 | {1, 3, 7} |
| 9 | {1, 2, 3, 7, 8} |
| 10 | {1, 2, 7, 9} |

Each set equals its `### Dependencies` line.

**Other citations of the changed sections.**

- The §7.4 Check now cites "§3.1, by the packing bound of §1.4" for the empty hard-core set.
- The §9.2 Check ("`Z^{can} = 0` by §1.4") and the §9.3 statement ("`Z` is a finite sum … (§1.4)") are about admissible positions. They stay valid against the reworded §1.4 and need no change.
- The emptiness at `N ≥ 8` is quoted in other places. Those are Checks with values, and they are unchanged.

## Adversarial pass

The rows cover every statement this round added or changed, and the claims around them.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §6.3 Check `N = 2` (F01) | d = 2, ε = R = 1, the constant; the grazing witness with δ = 1, `t = 3`, `K = B(0, 3)` | `C₁ = 8 · 1421.223 · 4.934802 = 56107.636 = 576π⁴`; `C ≥ 4C₁`; `λ(F) = 0`. Witness: `D = 4 − 4 = 0` at step 0 with τ = 2 > δ, then `D = 1 − 1 = 0` with τ = 1 ≤ δ at step 1; `|x_1| = 2.236 < 3` | The old Check was false and the new one holds | Check and plan test rewritten |
| §5.5 Check on the incoming and outgoing states (F02) | the Scattering witness and its image | incoming sign −1, so not in `G`; image `(0, (−1, 0))` with sign +1; head-on witness at time 1 gives `x_1 = (1, 0)`, `x_2 = 0`, `V = (0, (−1, 0))` | Holds | Check and plan test rewritten |
| §3.1 API, packing (moved from §1.4) | unit torus d = 2, ε = 0.4; unit circle ε = 1 = 2ρ; ε = 1.5 > 2ρ; `N = 1` | threshold `1/(0.04π) = 7.958`, so `N ≥ 8` is empty; ε = 1: threshold `1/(2·0.5) = 1`, `𝒟̄_2 = ∅` since the largest distance is 1/2; ε = 1.5: threshold `2/3`, yet `𝒟̄_1 ≠ ∅`; for ε ≤ 2ρ, `ω_d(ε/2)^d ≤ μ_X(X)` (a ball of radius ≤ ρ), so the threshold is at least 1 and `N = 1` never qualifies | Holds under `ε ≤ 2ρ`, and fails without it | New Check (and plan test `packing_radius_needed`) on the `ε ≤ 2ρ` hypothesis |
| §1.4 reworded consequence | the same unit torus | `8 · 0.12566 = 1.0053 > 1`, so no 8 points fit; `7 · 0.12566 = 0.8796 ≤ 1` | Holds | Check reworded to points |
| §3.5, `ℛ` preserves `H` and reverses `P` | the outgoing state of §3.3; the unsigned map | `P(V) = (1, 0)`, `H = ½`; `σ_M V = (0, (1, 0))`; `−σ_M V = (0, (−1, 0))` with `P = (−1, 0)`, `H = ½`; the unsigned map keeps `P = (1, 0)` | Holds; the Check tells the sign apart | New Check (and plan test `reversal_momentum`) |
| §3.3 API without the conservation clause | the same state | involution: `σ_M σ_M V = σ((0, (1, 0))) = ((1, 0), 0)`, since `c = −1` | Unchanged content | none |
| §8.3, specular inheritance written out | the existing Check, `s = N = 2` | `W` at velocities `(0, 0.9)`, `(0.9, 0)` is `e^{−1.62} = 0.19790`; at the scattered velocities `(0.9, 0.9)`, `0` it is 0 for the truncated density and `0.19790` for the Gaussian | Consistent with the written-out condition | none |
| §8.1, symmetry of `W(t)` needs §7.3 | the head-on witness with the labels swapped | `T_3` of the swapped state is the swap of `((1, 0), (−2, 0); 0, (−1, 0))`, by §7.3 Check 2 | The dependency is real | `*Needs:*` + §7.3 |
| §9.5 route, conservation of `H` | `W_N(t)(Z) = W⁰_N(T_{−t}Z) ≤ μ^N C₀^N e^{−β₀ H(T_{−t}Z)}/Z` | `H ∘ T_{−t} = H` (§7.3) gives `e^{−β₀ H(Z)}`; with the circle check values `2.0053 ≤ 2.5066` | The dependency is real | `*Needs:*` + §7.3 |
| §5.4 / §8.2 / §3.2 / §3.4 on `E` | the `E` instance `π = id`, `ρ = ∞` | `ν_12 = (1, 0)` at `x_1 = (1, 0)`, `x_2 = 0`; `S_2(0, (1, 0)) = ((2, 0), (1, 0))` | The dependency on §1.2 is real | `*Needs:*` + §1.2 |
| §10.4 API without the law-of-large-numbers bullet | README line 85 lists §10.5's theorems | `HardSphere.LanfordStatement.tendsto_empirical` is stated in §10.5 under `HardSphere.LanfordStatement d`, `d ≥ 2` | Nothing is lost | none |
| `*Needs:*` against the plan | all 45 targets, mechanically | 0 differences; every `target:` prerequisite points to an earlier target; at least 3 tests per target (169 in all); at least 3 Checks per section | Consistent | none |

## Checks

**Dependency check** (`tauceti-roadmap … gate --candidate packages/HardSphereDynamicsAndKineticLimits/design/README.md --only HardSphereDynamicsAndKineticLimits …`):

```text
candidate: HardSphereDynamicsAndKineticLimits is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2233 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. No cross-roadmap citation was added or changed.

**`Suggested.lean`.** None exists at the design stage. I ran no Lean command and no `#check` comparison.

**Ownership.** No new object was introduced. The packing emptiness moved from §1.4 to §3.1, and the conservation under `ℛ` moved from §3.3 to §3.5. Both stay inside this roadmap.

**Sources.** No new source was needed. The §3.1 bullet uses BGSS2023 line 165 (the emptiness of the `N`-particle domain for large `N`), which I read in the cache; plan 3.1's locator now also names it. `needs-references.toml` was not written.

**Gate failures.** None were listed for this round.

## For the maintainer

- No Lean name changed. In plan.json, the API items `reversal_conserves` (3.3) and `lanfordStatement_lln` (10.4) are deleted. The new API item is `hardCoreSet_eq_empty_of_packing` (3.1). The new tests are `packing_radius_needed` (3.1) and `reversal_momentum` (3.5).
- No other roadmap cites this one; ClassicalErgodicTheory names the hard-sphere flow only as a consumer. Section numbers are unchanged.
- No suspicious instructions appeared in the review text.
