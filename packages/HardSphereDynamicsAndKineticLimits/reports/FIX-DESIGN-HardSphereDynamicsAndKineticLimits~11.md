# Repair of HardSphereDynamicsAndKineticLimits (design, round 11)

This round settles the two findings of `REV-DESIGN-HardSphereDynamicsAndKineticLimits~10`, F01 and F02. Both are P3 and both are right.

- **F01** is applied. The repaired sentence also says "forward or backward in time": `G` asks for a trajectory on all of ℝ, and a new witness in Check 1 of §5.5 shows that the past counts.
- **F02** is applied. The same pattern (a route input missing from `*Needs:*`) is also repaired for the Gaussian integral that the corollary's route uses.

Files edited: `packages/HardSphereDynamicsAndKineticLimits/design/README.md` and `packages/HardSphereDynamicsAndKineticLimits/design/plan.json`. `sources.toml` is unchanged: no source was fetched and no locator changed. This is the design stage, so there is no `Suggested.lean`. No Lean command was run and no `#check` comparison was made, because this lane does not elaborate.

## F01 (P3) — applied

§5.5: complement "is the set of initial data leading to pathological trajectories" → "the contact states with an incoming pair (excluded by §5.1), and the data whose motion, forward or backward, reaches a grazing or one-with-two contact or has infinitely many contact times in a bounded interval". Check 1 gains a past-tangency witness; Layer 6 Examples (d = 1) likewise.

## F02 (P3) — applied

§10.5 `*Needs:*` gains §1.3, §10.3 and Mathlib `GaussianFourier.integral_rexp_neg_mul_sq_norm` (now: §1.3, §9.3, §9.5, §10.1, §10.3, §10.4, `ProbabilityTheory.meas_ge_le_variance_div_sq`, the Gaussian lemma). The plan's prerequisites of 10.5 gain the same three. The corollary's route names the Gaussian integral and §1.3 where it uses them.

## Evidence and the repaired pattern

### F01

- **The defect.** GST2013 lines 851–854 define a pathological trajectory: a collision of more than two particles, a grazing collision, or infinitely many collisions in finite time. GST2013 line 841 defines the domain with a strict inequality, so the source has no contact states. In this roadmap, §5.1 requires every contact pair of a trajectory to be outgoing. So an incoming contact state is never the value of a trajectory, even when its motion is harmless.
  - **Reviewer's witness**, d = 1, ε = 1, `x_1 = 1`, `x_2 = 0`, `v_1 = −1`, `v_2 = 0`. Here `ν_12 = 1` and `⟨v_1 − v_2, ν_12⟩ = −1 < 0`, so the state is not in `G`. The scattering gives `σ(−1, 0) = (−1 + 1, 0 − 1) = (0, −1)`, which is outgoing (`⟨1, 1⟩ = 1 > 0`).
  - **The trajectory through the scattered state.** For `t < 0` it has `x_1 = 1 − t`, `x_2 = 0` (distance `1 − t > 1`); for `t > 0` it has `x_1 = 1`, `x_2 = −t` (distance `1 + t > 1`). That is one binary collision, and the incoming state is its left limit at 0.
  - The old sentence omitted this case, and so did the old d = 1 sentence of the Layer 6 Examples.
- **Exactness of the repaired sentence.** Let `Z ∈ 𝒟̄` have no incoming contact pair.
  - **Time 0.** If the contacts at time 0 contain a grazing pair, or a particle touching two others, the motion is pathological at time 0 ("time 0 included").
  - **Otherwise.** The contacts form a matching of outgoing pairs, and the forward motion (free flight and binary scattering) is a trajectory on `[0, ∞)` unless it becomes pathological. The same holds for `ℛZ = (X, −σ_M V)`, whose contact pairs are again outgoing (§3.3). Its trajectory on `[0, ∞)`, reversed by §5.3, is a trajectory on `(−∞, 0]` that takes the value `Z` at 0. Gluing at 0 (§5.2) gives a trajectory on ℝ.
  - **Converse.** Each listed pathology contradicts a clause of §5.1: a grazing pair is not outgoing (σ fixes it); a particle touching two others breaks the matching condition; infinitely many velocity jumps in a bounded interval contradict the finiteness of `𝒯`.
  - **Conclusion.** `𝒟̄ ∖ G` is exactly the union of the two kinds of data.
- **Why "forward or backward" is needed.** The reviewer's text says "data leading to such a contact", which reads as forward only. A forward-only reading is false for `G`, which asks for a trajectory on ℝ. Witness (added to Check 1 of §5.5 and to the plan test `two_body_complement`): at ε = 1, `a = (−2, 1)`, `u = (−1, 0)`.
  - Forward: `⟨a, u⟩ = 2 > 0` and `|a + su|² = (2 + s)² + 1 ≥ 5` for `s ≥ 0`, so there is no contact at positive times.
  - Backward: `D = 4 − 1·(5 − 1) = 0`, and the tangency is at `s = −⟨a, u⟩/|u|² = −2`, at `a − 2u = (0, 1)` with `|(0, 1)| = 1`. There `⟨(0, 1), (−1, 0)⟩ = 0`, a grazing contact.
  - So the state is not in `G` (it lies in `{u ≠ 0, D = 0}` of Check 1), although its forward motion is free.
- **Same pattern elsewhere.**
  - "pathological" occurs only at §5.5. "exceptional set" occurs at the Check of §6.4 (line 517: "the union of §5.5", which already includes the contact states with `⟨a, u⟩ ≤ 0`; no change) and at the Layer 6 Examples (repaired).
  - The Summary ("outside a Lebesgue-null set every configuration has a global trajectory with only binary, non-grazing collisions") is correct as it stands.
  - The plan's §5.5 entry has no complement sentence; only its test `two_body_complement` gained the witness.
  - The d = 1 sentence now lists the incoming contact states with the reviewer's witness, and keeps the clause on infinitely many collisions. That clause is harmless in d = 1 (in the pass-through picture collisions are crossings of free particles, finitely many in bounded time), and stating it avoids an unproved claim.

### F02

- **The defect.** The corollary in §10.5 names "a mild solution `f` on `[0, T₀]` with datum `f⁰` (§10.3)" on `𝕋^d` (§1.3). Its route uses `μ_X(𝕋^d) = 1` (§1.3) and the Gaussian bound of the mild solution (§10.3). The old `*Needs:*` line listed neither.
- **Same pattern: the Gaussian integral.** The route derives integrability of `f(t)` from the bound `C exp(−β|v|²/2)`. At the pin, `GaussianFourier.integral_rexp_neg_mul_sq_norm` (`Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:330`, `0 < b`) gives `∫ exp(−b‖v‖²) = (π/b)^{finrank/2}`. With `b = β/2` this is `(2π/β)^{d/2} ≠ 0`, so the function is integrable (`MeasureTheory.Integrable.of_integral_ne_zero`, `Mathlib/MeasureTheory/Integral/Bochner/Basic.lean:208`).
  - The lemma is already in the Mathlib supplier contract (README line 52) and in the `*Needs:*` of §9.1, §9.5 and §10.2. The route sentence now names it.
- **No cycle.** 1.3 < 10.5 and 10.3 < 10.5, and both are already prerequisites of 10.4. Layer 10's Dependencies already list Layer 1 and "Gaussian integrals".
- **Mechanical comparison.** For target 10.5, the README `*Needs:*` line and the plan's `target:` prerequisites agree (`1.3, 9.3, 9.5, 10.1, 10.3, 10.4`). My quick script reported other differences, but those are script artefacts: "ClassicalErgodicTheory §3.5" parsed as §3.5, and §1.1–1.3 state their needs in prose. They are unchanged from the head.
- **No other unlisted inputs.** I also checked §10.5's first theorem: it names the flat position space, a standing convention whose `*Needs:*` usage matches §9.3 and §9.5, and §9.3, §9.5 and §10.1 (listed). No other section's `*Needs:*` was touched.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §5.5 complement sentence, incoming clause | d = 1, ε = 1, `(1, 0; −1, 0)` | `⟨v_1 − v_2, ν⟩ = −1`; scattered `(0, −1)`, `⟨1, 1⟩ = 1`; trajectory distances `1 − t` (t < 0), `1 + t` (t > 0) | in complement, not pathological | sentence rewritten |
| §5.5 complement sentence, backward clause | ε = 1, `a = (−2, 1)`, `u = (−1, 0)` | `⟨a, u⟩ = 2`; `|a + su|² ≥ 5` for `s ≥ 0`; `D = 4 − 4 = 0`; tangency at `s = −2`, point `(0, 1)`, `⟨(0, 1), u⟩ = 0` | not in `G`, forward motion free | "forward or backward" added; witness added to Check 1 |
| §5.5 against Check 1 (`N = 2`, `E`) | contact `⟨a, u⟩ < 0`; contact `⟨a, u⟩ = 0`; `|a| > ε`, `D = 0`, `u ≠ 0`; `|a| > ε`, `D > 0`; `u = 0`, `|a| > ε` | incoming (clause 1); grazing at 0; tangent at `s = −⟨a, u⟩/|u|²`; one non-grazing collision (past or future, in `G`); never in contact (in `G`) | both descriptions give the same set | none further |
| §5.5 against Check 3 | equilateral triple contact, side ε, d = 2 | each particle touches two others at time 0 | in complement via "contact of one particle with two others, time 0 included" | none |
| §5.5 against `G = 𝒟̄_N`, `N ≤ 1` | `N = 0, 1` | no pairs, so both clauses are empty | consistent | none |
| §5.5, simultaneous disjoint pairs | `N = 4`, pairs {1,2} and {3,4} outgoing at time 0 | contacts form a matching | in `G` (not listed) | none |
| Layer 6 Examples, d = 1 | the witness; touching rods `v_1 = v_2 = 0.5`; `x_1 = 3`, `x_2 = 0`, `v_1 = −1`, `v_2 = 0` | incoming; grazing (`u = 0` at contact); `D = 9 − 8 = 1 > 0`, collision at `τ = 2`, non-grazing | listed; listed; not listed (in `G`) | sentence rewritten |
| §10.5 corollary route, Gaussian integral | `b = β/2`; d = 2, β = 1 | `(π/(β/2))^{d/2} = (2π/β)^{d/2}`; `2π ≈ 6.2832 ≠ 0` | integrable | route names the lemma; `*Needs:*` lists it |
| §10.5 `*Needs:*` against plan | target 10.5 | README `{1.3, 9.3, 9.5, 10.1, 10.3, 10.4}` = plan `{1.3, 9.3, 9.5, 10.1, 10.3, 10.4}` | agree, no later target | edited |

## Checks run

Dependency check:

```text
candidate: HardSphereDynamicsAndKineticLimits is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2241 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `plan.json` parses as JSON after the edit.

## For the maintainer

- No Lean name changed, was added or was deleted. No cross-roadmap citation changed, and no supplier was added. No other roadmap is affected.
- Ownership against open pull requests: no new object or construction was introduced, so there was nothing new to check.
- No passage in the review asked for anything outside this job.
