# Repair of HardSphereDynamicsAndKineticLimits (design, round 10)

This round settles the two findings of `REV-DESIGN-HardSphereDynamicsAndKineticLimits~9`, F01 and F02, both P3. Both are right.

- F01 is applied. The same unbound-referent pattern is also repaired in the first theorem of §10.5, in the Layer 10 Examples and in the Summary.
- F02 is applied with corrected wording. The suggested clause claimed discontinuity for every `N ≥ 2` and called §7.4 "a case of" the cited statement; both claims overreach (see below).

Files edited: `packages/HardSphereDynamicsAndKineticLimits/design/README.md` and `packages/HardSphereDynamicsAndKineticLimits/design/plan.json`. `sources.toml` is unchanged: no source was fetched and no locator changed. This is the design stage, so there is no `Suggested.lean`. No Lean command was run and no `#check` comparison was made; this lane does not elaborate.

## F01 (P3) — applied

§10.5 corollary: "…the empirical measure … concentrates on the Boltzmann solution for every `t ∈ [0, T₀]`" → for `d ≥ 2` under `HardSphere.LanfordStatement d`: ∀ `C₀ ≥ 1`, `β₀ > 0`, ∃ `T₀ > 0`, ∀ admissible `f⁰`, ∃ mild `f` on `[0, T₀]` with ∀ `t`, bounded continuous `h`, δ > 0: `P_ε(|π^ε_t(h) − ∫ f(t) h| ≥ δ) → 0`. A route was added, and the plan api was updated to match.

## F02 (P3) — applied differently

Scope paragraph, after "a probability space": a new clause says that ProbabilisticAndMetricNumberTheory §4.9a (`scalarLpKoopman_strong`, complex `Lp`) allows an infinite, locally finite measure but assumes a jointly continuous action. The clause adds:

- the hard-sphere flow on `E` is not continuous for any `d ≥ 1`, `N ≥ 2`, with the head-on witness;
- for `N = 1` the flow is free transport, and §7.4 is the real-scalar counterpart of that statement.

## Evidence and the repaired pattern

### F01

- **The defect.** In README §10.4, `T₀`, `f⁰` and `f` are bound only inside the existentials of `HardSphere.LanfordStatement d`. In the old §10.5 sentence, `[0, T₀]` and "the Boltzmann solution" had no referent, and "concentrates" was not a statement. The plan's api entry `HardSphere.LanfordStatement.tendsto_empirical` had the same wording.
- **The repair** follows the suggested text, with these additions:
  - **First theorem.** It now names `P_ε = HardSphere.grandCanonical ε μ_ε f⁰` (§9.3), `F^ε_n(t) = HardSphere.correlation ε μ_ε f⁰ n t` (§9.5) and `π^ε_t` (§10.1 with `μ = μ_ε`). The first theorem also used these three implicitly. Its hypotheses are unchanged.
  - **Corollary route.** It now states why `f(t)` is an admissible limit. `f(t)` is a section of the jointly measurable `f`, so it is measurable. It is bounded by `C exp(−β|v|²/2)` on a torus of mass 1, so it is integrable.
  - **Needs.** `*Needs:*` of §10.5 and the plan's `prerequisites` gain §9.3 (target:9.3), because the statement now names `HardSphere.grandCanonical`. The two lists still agree.
  - **Check.** Check 1 of §10.5, and the plan test `equilibrium`, gain the corollary at `f⁰ = M_{1,0}`, `β₀ = 1`, `C₀ = 1`.
- **Same pattern elsewhere.**
  - Layer 10 `### Examples`: "the law of large numbers holds on `[0, T₀]`" had `T₀` unbound. It now reads "on the interval `[0, T₀]` that the proposition provides for the constants `C₀`, β₀ of the datum, with the mild solution it provides as the limit (§10.5)".
  - Summary: "to concentrate on the Boltzmann solution" → "tested against bounded continuous functions, to converge in probability to the Boltzmann solution".
  - Every other `T₀` in the README and the plan is bound inside §10.4.

### F02

- **The witness is right.** On main (1a19c9f), `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md`, under `### 4.9a Lattice quotients, Howe–Moore and Moore ergodicity` (heading at line 6319, §4.9b starts at 6419):
  - Line 6361 defines `scalarLpKoopman p μ` on `Lp ℂ p μ` and says that none of the construction needs finiteness of μ.
  - Line 6363 proves `scalarLpKoopman_strong` under these hypotheses: a topological group acting continuously on an R₁ space with its Borel σ-algebra; μ locally finite and inner regular on sets of finite measure by compact sets; `p ≠ ∞`.
  - The roadmap has no open revision. The only related open pull request is the new roadmap ProbabilisticAndMetricNumberTheoryPartII, so the locator is stable.
- **Why the wording differs from the suggested repair.**
  1. "Not continuous for `N ≥ 2`" fails on degenerate tori. On the unit torus with d = 2, ε = 0.4, `N = 8` (Check of §7.4), `𝒟̄` is empty. The action on the empty space is continuous, and `Lp = 0`. The clause is therefore stated on `E`, where it holds for every `d ≥ 1` and `N ≥ 2`. On `E`, `𝒟̄_N` is nonempty for every `N`, and the extra particles can be put far away.
  2. "§7.4 is a case of that statement" is not literal, because the scalars differ (`Lp ℂ` there, `Lp ℝ` here). The text says "real-scalar counterpart".
- **No other place claims continuity.** The supplier line on `Flow` (README, From Mathlib) already says the hard-sphere flow is not continuous and free transport is. That agrees with the new clause, and nothing else in the README or plan claims a continuous action.

### Adversarial pass on the added and changed statements

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| F02 clause: discontinuity on `E` | d = 2, ε = 1, `x_1 = (2, 0)`, `x_2 = 0`, `v_1 = (−1, 0)`, `v_2 = 0`; perturbed `x_1 = (2 + η, 0)` | Unperturbed: `a = (2, 0)`, `u = (−1, 0)`, contact when `2 − s = 1`, `s = 1`; at time 1 `v_1 = 0`. Perturbed: contact at `s = 1 + η > 1`, so at time 1 `v_1 = (−1, 0)`. `|Δv_1| = 1` while `|ΔZ| = η → 0` | Discontinuous at a state of `G` (binary, `⟨v_1 − v_2, ν⟩ = −1 < 0`), so it is not a junk-value effect | Stated |
| F02 clause, other `d` and `N` | d = 1 (scalars 2, 0, −1); d = 3 along `e_1`; `N = 3` with `x_3 = (0, 100)` at rest | Same contact times 1 and `1 + η`; particle 3 stays at distance ≥ 99 > ε on `[0, 2]` | Holds for every `d ≥ 1`, `N ≥ 2` on `E` | "for any `d ≥ 1` and `N ≥ 2`" |
| F02 clause, degenerate torus | unit torus, d = 2, ε = 0.4, `N = 8`; unit circle, ε = 1/3, `N = 3` | `𝒟̄_8 = ∅` (packing `8 · π · 0.2² = 1.0053 > 1`); `q_3 = 0`, phase measure 0 | Continuity holds vacuously or `Lp = 0`, so "every `N ≥ 2`" is false off `E` | Clause restricted to `E` |
| F02 clause, `N = 1`, `N = 0` | free transport `(t, x, v) ↦ (x + π(t v), v)`; one-point space | Continuous by the §1.1 API (`π` 1-Lipschitz, addition continuous); trivial action | Cited hypothesis "continuous action" holds | "counterpart", not "case" (ℂ vs ℝ) |
| §10.5 first theorem, binding | `μ_ε` with `μ_ε → ∞`; `f⁰ ≥ 0` integrable | `grandCanonical` needs `μ > 0`, `ε ≥ 0`, `∫ f⁰ < ∞`: eventually true along ε → 0⁺ (ε < ρ eventually). Variance `μ^{−1}∫F_1h² + ∫F_2 h⊗h − 2m∫F_1h + m² → 0 + m² − 2m² + m² = 0` with `m = ∫ f h`; `μ^{−1}∫F_1h² ≤ μ^{−1}‖h‖²_∞∫F_1 → 0` since `∫F_1 → ∫ f` (g = 1) | Sound; only the eventual range of ε matters | Named `P_ε`, `F^ε_n`, `π^ε_t` |
| §10.5 corollary, quantifiers | Against §10.4 | Same order ∀`C₀`∀`β₀`∃`T₀`∀`f⁰`∃`f`∀`t`; weak clause `n = 1`: `∫F_1(t)g → ∫ f(t) g`; `n = 2`: `∫F_2(t)g₂ → ∫ f(t)⊗f(t) g₂` | Gives both hypotheses of the first theorem at each `t ∈ [0, T₀]` | Stated |
| §10.5 corollary, integrability of `f(t)` | d = 2, `C = β = 1`; d = 3 | `∫ C e^{−β|v|²/2} dv dx = 1 · 2π = 6.28319`; `(2π)^{3/2} = 15.7496` | Finite; `f(t)` measurable as a section of jointly measurable `f` | Route sentence |
| §10.5 corollary, `μ_ε → ∞` | d = 1, 2, 3 at ε = 0.01 | `μ_ε = 1`, `100`, `10⁴` | Fails exactly at d = 1 (Check value `1 − e^{−1} = 0.632121`), so `d ≥ 2` is needed | Kept `d ≥ 2` |
| §10.5 corollary, `t = 0` | `f(0)` | `f(0) = f⁰` a.e. (§10.3 API); `F^ε_n(0) → (f⁰)^{⊗n}` in `L¹` (§9.6, `ρ⁰` bounded by continuity and the Gaussian bound) | Consistent with §9.6 | none |
| Check 1 of §10.5, corollary at equilibrium | `f⁰ = M_{1,0}`, β₀ = 1, `C₀ = 1`; d = 2, 3 | Admissibility `C₀ ≥ (2π)^{−d/2}`: `0.159155`, `0.0634936`; Lipschitz difference 0; mass 1. `F^ε_1(t) = F^ε_1(0)` (§9.4 on the torus of mass 1, `0 < ε < 1/2`, `c = 1`); `→ M` in `L¹` (§9.6, `ρ⁰ = 1`). So `∫ f(t) g = ∫ M g` for all bounded continuous `g`, and `f(t) = M` a.e. | Sound | Clause added to Check 1 and plan test `equilibrium` |
| Wrong model of the corollary | ∀`f⁰`∃`T₀` order; limit `∫ f⁰ h` | The first order lets `T₀` depend on `f⁰`, weaker than BGSS2023 line 319. The second agrees with the corollary only at `t = 0` or at equilibrium; for the position-dependent datum of §10.3's Check (`ρ(0) = 1.5` vs `ρ(−1/4) = 1` under free transport) it differs | Both excluded by the stated form | none |
| Layer 10 Examples | `T₀` referent | Now "the interval `[0, T₀]` that the proposition provides for `C₀`, β₀" | Bound | Edited |

### Ownership

No new construction is introduced. `scalarLpKoopman_strong` is named only to say how §7.4 differs; it is not consumed. ProbabilisticAndMetricNumberTheory is not a supplier, and no `*Needs:*` line or supplier contract names it.

## Checks

Dependency check:

```text
candidate: HardSphereDynamicsAndKineticLimits is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2241 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line.

`roadmaps resolve` on the README:

- Cross-roadmap citations found nowhere: none. ProbabilisticAndMetricNumberTheory §4.9a and `scalarLpKoopman_strong` resolve.
- Lean names found nowhere: only this roadmap's own `HardSphere.*` names, which are expected at the design stage.

No gate failures were listed for this round.

## For the maintainer

- No name that another roadmap cites was changed, and no id was renumbered.
- §10.5 now depends explicitly on §9.3. This is internal and already implied through §9.5.
- The review's four questions for human reviewers were not acted on, as the brief requires.
- The fetched texts contained no suspicious instructions.
