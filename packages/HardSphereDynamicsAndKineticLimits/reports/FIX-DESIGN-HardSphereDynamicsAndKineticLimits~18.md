# FIX-DESIGN-HardSphereDynamicsAndKineticLimits~18

This round repairs the findings of `REV-DESIGN-HardSphereDynamicsAndKineticLimits~17`. The review has one finding (P3), on a locator. It is right and was applied. Files changed:

- `packages/HardSphereDynamicsAndKineticLimits/design/README.md`:
  - §10.4: the sentence after the locator, a second API bullet, and the `*Needs:*` line;
  - §10.5: the locator of the first theorem;
  - the Layer 10 `### Dependencies` line;
  - one new bullet under "Exact supplier contracts / From Mathlib".
- `packages/HardSphereDynamicsAndKineticLimits/design/plan.json`:
  - target 10.4: `locator.where`, `prerequisites`, and a new `api` entry `lanfordStatement_weak_of_ae`;
  - target 10.5: `locator.where`.
- `packages/HardSphereDynamicsAndKineticLimits/sources.toml`: the GST2013 `locator` now also lists Def. 6.2.1. `cited_for` is unchanged.

No definition, theorem statement, hypothesis, Check, Lean name or section number changed. No section was added, moved or renumbered.

## F01 (P3) — applied

The §10.4 locator now says what the cited theorems print: BGSS2023 Theorem 1 prints the a.e. conclusion and compact-uniform convergence; GST2013 Theorem 8 with Definition 6.2.1 (lines 2041–2055) prints velocity averages off the diagonals. It adds that the bounded-continuous clause is printed nowhere and follows from the a.e. clause. That derivation is a new API bullet of §10.4: Scheffé's argument, with its inputs. The plan locator and API are changed to match.

**Verification.** The finding is right:

- BGSS2023 lines 316–321 state two conclusions. `F^ε_1(t)` converges uniformly on compact sets (line 318), and `F^ε_n(t)` converges almost everywhere (lines 320–321).
- GST2013 Remark 3.1.1 (lines 687–694) tests against `φ ∈ C⁰_c(ℝ^d_v)`. Definition 6.2.1 (lines 2041–2055), the convergence used in Theorem 8, tests against `φ_s(V_s)`, locally uniformly in positions off the diagonals.
- None of these prints convergence against every bounded continuous `g` on `(𝕋^d × E)^n`.
- BGSS2023 itself passes from the a.e. convergence to the convergence of `∫ F^ε_1 h²`, `∫ F^ε_2 h ⊗ h` without comment (lines 370–371).

**How it differs from the suggested text.**

- **Placement.** The derivation is stated as an API fact of §10.4, with hypotheses and a route naming every input. It is not left as a parenthesis inside the locator. The locator keeps a one-sentence pointer to it.
- **Nonnegativity is not needed.** The suggested route proves `f(t) ≥ 0` a.e. first; this step is unnecessary and is dropped. Since `F^{ε_k}_n(t) ≥ 0`, one has `(f^{⊗n} − F)^+ ≤ |f^{⊗n}|`, and `∫ f(t)^{⊗n} = (∫ f(t))^n = 1` holds whatever the sign. So the API needs only the a.e. clause for the same `n`, not the case `n = 1`. The bullet says that the sign is not used.
- **Conclusion.** The API's conclusion holds for bounded measurable `g`. That is stronger than the bounded continuous `g` of the proposition.

**Statement added (§10.4, API).** Assume:

- `f⁰` is a probability density with `f⁰ ≤ C₀ exp(−β₀|v|²/2)`;
- `f` is a mild solution on `[0, T₀]` with datum `f⁰`;
- `t ∈ [0, T₀]` and `n ≥ 1`;
- `F^{ε_k}_n(t) → f(t)^{⊗n}` a.e. along every sequence `ε_k → 0⁺`.

Then `∫ F^ε_n(t) g → ∫ f(t)^{⊗n} g` as ε → 0⁺, for every bounded measurable `g`.

**Route.**

1. By §9.5, `∫ F^ε_n(t) = μ_ε^{−n} E[Nat.descFactorial N n]`, which is independent of `t`.
2. By the `L¹` statement of §9.6, this tends to 1. §9.6 applies because `ρ⁰ ≤ C₀ (2π/β₀)^{d/2}`, by `GaussianFourier.integral_rexp_neg_mul_sq_norm` with `b = β₀/2`.
3. `∫ f(t) = 1`. Integrate the identity of §10.3, using translation invariance (§1.1), Fubini's theorem under the bound of §10.2, and the case `ψ = 1` of §10.2.
4. Scheffé's lemma, from `MeasureTheory.tendsto_integral_of_dominated_convergence` and the pointwise identity `|a − b| = (a − b) + 2(b − a)^+`.
5. Pass from sequences to the filter with `Filter.tendsto_iff_seq_tendsto`; `𝓝[>] 0` is countably generated (the instance `TopologicalSpace.isCountablyGenerated_nhdsWithin`, `Mathlib/Topology/Bases.lean:782`).

**Pattern.** I searched the README for every attribution of a conclusion to Theorem 1, Theorem 4, Theorem 8, Corollary 1.2.1, (1.1.8) and (1.12).

- **§10.5, first theorem: repaired.** It was attributed to "BGSS2023 Corollary 1.2.1, lines 344–349, proof lines 352–371". Its hypotheses (the convergence of the two integrals) are the step that proof draws from the a.e. clause at lines 370–371. The locator now says so and points to the new API of §10.4. Plan 10.5 `locator.where` is changed to match.
- **§9.6, inequality: no change.** The inequality `1 − ω_d ε ‖ρ⁰‖_∞ ≤ ε^{d−1} E[N] ≤ 1` cites BGSS2023 (1.1.8), a limit, and DengHaniMa2024 (1.12). DengHaniMa2024 line 249 prints the bound "up to error O(ε)", of which the inequality is the explicit form. This is no misattribution.
- **Other occurrences: no change.** DengHaniMa2024 Theorem 1 under Downstream consumers is a pointer, not an attribution of a statement.

**Supplier records.**

- The two new Mathlib names were opened at the pin:
  - `Mathlib/MeasureTheory/Integral/DominatedConvergence.lean:58`, `theorem tendsto_integral_of_dominated_convergence` inside `namespace MeasureTheory` (line 46);
  - `Mathlib/Order/Filter/AtTopBot/CountablyGenerated.lean:84`, `theorem tendsto_iff_seq_tendsto` inside `namespace Filter` (line 28), assuming `[k.IsCountablyGenerated]`.
- Both are added to the From Mathlib contract, to the §10.4 `*Needs:*` line and to the plan prerequisites.
- `GaussianFourier.integral_rexp_neg_mul_sq_norm` was already in the contract; it is now also listed for §10.4.
- §10.2 is added to the §10.4 `*Needs:*` line and the plan prerequisites (`target:10.2`). It is earlier than 10.4, so it is not a forward edge.
- Pinned Mathlib has no Scheffé lemma under that name: a grep for `scheff` finds nothing. The route therefore derives it from dominated convergence.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §10.4 API (weak clause from a.e. clause), mass step | unit torus, d = 2, `f⁰ = M_{1,0}`, `C₀ = 1`, β₀ = 1, ε = 0.01, `n = 2`, `t = 0` | `ρ⁰ ≡ 1 ≤ C₀(2π/β₀) = 6.2832`; §9.6 lower factor `1 − n ω_2 ε ‖ρ⁰‖ = 1 − 2π · 0.01 = 0.93717`; `∫ M^{⊗2} 1_{𝒟̄_2} = 1 − π · 10^{−4} = 0.99969`; so `∫ F_2(0) ∈ [0.93687, 1]`, tending to 1 | Holds | new text |
| same, time independence | `n = 1`, any `t` | `∫ F_1(t) = μ^{−1} E[N]`; the flow keeps `N`, so the value at `t` equals the value at 0 (§9.5 states it with no `t` on the right) | Holds | none |
| same, `∫ f(t) = 1` from the mild identity | Maxwellian: `Q(M, M) = 0`; d = 1: `Q ≡ 0`; datum `(1 + 0.5 cos 2πx) M(v)` | `f(t) = M`, `∫ = 1`; free transport `∫ f⁰(y − π(tv), v) dy dv = ∫ f⁰ = 1`; `∫_0^1 (1 + 0.5 cos 2πx) dx = 1` | Holds | new text |
| same, Scheffé identity | `(a, b) = (3, 1)` and `(1, 3)` | `|3 − 1| = 2 = (3 − 1) + 2 · 0`; `|1 − 3| = 2 = (1 − 3) + 2 · 2` | Identity holds | new text |
| same, dominating function | `F ≥ 0`, `b = f^{⊗n}` of either sign | `(b − F)^+ ≤ b^+ ≤ |b|`; at `b = −1`, `F = 0`: `(−1)^+ = 0 ≤ 1` | Holds without `f ≥ 0` | f ≥ 0 step dropped |
| same, negative control: mass is needed | `G_k(x, v) = M(v) + M(v − k)` on 𝕋 × ℝ (d = 1) | `G_k → M` pointwise since `M(v − k) → 0`; `∫ G_k = 2` for all `k`; with `g = 1`, `2 ≠ 1 = ∫ M` | a.e. convergence alone is not enough; the mass identity of §9.5–9.6 is the needed input | none (the route names that input) |
| same, sequences to filter | `𝓝[>] 0` on ℝ | basis `(0, 1/m)`, `m ≥ 1`, countable; `Filter.tendsto_iff_seq_tendsto` needs `[k.IsCountablyGenerated]`, supplied by the instance `TopologicalSpace.isCountablyGenerated_nhdsWithin` | Holds | new text |
| same, Gaussian constant | d = 2, β₀ = 1; d = 3, β₀ = 2 | `(π/(β₀/2))^{d/2} = 2π = 6.2832`; `π^{3/2} = 5.5683` | Holds | new text |
| §10.4 locator text | BGSS2023 lines 318–321; GST2013 lines 687–694, 2041–2055 | two conclusions printed (compact-uniform for `F_1`, a.e. for `F_n`); GST: test functions of `v`, locally uniform in positions off diagonals | Text agrees with sources | new text |
| §10.5 locator text | BGSS2023 lines 369–371 | the limit of (1.2.7) is drawn from "F_2 → f^{⊗2} and F_1 → f almost everywhere" | Text agrees | new text |
| §10.4 Checks recomputed | Maxwellian Check (`C₀ ≥ (β₀/2π)^{d/2}`) | d = 2, β₀ = 1: `1/(2π) = 0.15915 ≤ 1`; `F^ε_n(t) = F^ε_n(0)` (§9.4–9.5); every conclusion by §9.6, the first also by the new API | Consistent | none |
| §10.5 first Check recomputed | `f⁰ = M_{1,0}`, `C₀ = 1`, d = 2 | `F^ε_1(t) = F^ε_1(0) → M` weakly, as the Check says; agrees with the API (mass 1 at all `t`) | Consistent | none |

## Checks run

**Dependency check** (`gate --only HardSphereDynamicsAndKineticLimits`), output:

```text
candidate: HardSphereDynamicsAndKineticLimits is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 235 roadmaps, 2226 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Not being in the merge order is expected at the design stage.

**Mechanical consistency** (a script over README and plan):

- For all 45 targets, the `§k.n` sections of each `*Needs:*` line equal the plan's `target:` prerequisites. The script printed four flags (7.2, 7.5, 8.1, 9.4), all false positives: it read the supplier citation "ClassicalErgodicTheory §3.5" as an own section, and the plan records it as `roadmap:ClassicalErgodicTheory §3.5`. There are no genuine mismatches.
- No prerequisite points forward.
- Every target has as many Check bullets as plan tests (unchanged).
- Every `mathlib:` prerequisite is named in its `*Needs:*` line.
- `plan.json` parses as JSON.

**Style scan.** The README contains no LaTeX delimiters, "optional", "deferred", "so far", "removed", "checkpoint", "packet" or machine paths.

**Citations.** `roadmaps resolve` on the README finds no cross-roadmap citation and no Lean name found nowhere. Mathlib names outside the roadmaps were checked by opening the pinned files, as listed above.

**Lean.** This is the design lane, and there is no `Suggested.lean`. No Lean command was run and no `#check` comparison was possible. No new backticked name of this roadmap's own was introduced; the plan's new API name `lanfordStatement_weak_of_ae` is not backticked in the README. No gate failures were listed for this round.

## For the maintainer

- No name that another roadmap cites changed. No supplier roadmap, gap or cross-roadmap citation changed.
- The only new supplier edges are to pinned Mathlib.
- This round fetched no source. Every locator added (BGSS2023 lines 370–371; GST2013 lines 2041–2055) is in the cached texts.
- Ownership: the new API fact is about this roadmap's own proposition `HardSphere.LanfordStatement`, so no ownership question arises. The review's object searches (Boltzmann–Grad, BBGKY, Lanford, hard sphere, flat torus) were not repeated this round.
- A consequence for the planned roadmap on the BBGKY hierarchy (Downstream consumers): to prove `HardSphere.LanfordStatement` it needs only the a.e. and essential-supremum clauses. The bounded-continuous clause then follows by the new API of §10.4.
