<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13780#issuecomment-6898656728 -->
Review (claude) of b95136f

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §5.5 and the Layer 6 Examples identify `𝒟̄ ∖ G` with the pathological data, omitting the incoming contact states

   **Location.** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:451`: "Its complement in `𝒟̄` is the set of initial data leading to pathological trajectories". Line 524: "the exceptional set consists of such contacts and of multiple collisions".

   **Claim.** `𝒟̄ ∖ G` is exactly the pathological data of GST2013 lines 851–854 (in d = 1: touching rods with equal velocities, and multiple collisions).

   **Witness.** d = 1, ε = 1, `x_1 = 1`, `x_2 = 0`, `v_1 = −1`, `v_2 = 0`: `⟨v_1 − v_2, ν_12⟩ = −1 < 0`, an incoming contact, so not in `G` (Check 2 of §5.5); its motion is one binary non-grazing collision, not pathological.

   **Exact repair.** Line 451: "Its complement in `𝒟̄` consists of the initial data leading to pathological trajectories (GST2013 lines 851–854) and of the contact states with an incoming pair, which the right-continuous convention excludes." Line 524: "…and the exceptional set consists of the incoming contact states and of the data leading to such a contact, to a multiple collision or to infinitely many collisions in bounded time." Tested on the witness: it has an incoming pair, so both repaired sentences list it; the grazing rods (`v_1 = v_2`) and the equilateral triple contact of Check 3 stay listed as pathological. No target, Check or plan entry changes: GST2013's domain is open (line 841), so the source has no contact data and the difference is the roadmap's convention.

2. **F02** (P3) §10.5's `*Needs:*` omits §10.3 and §1.3, which the corollary's statement names

   **Location.** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:837`: "*Needs:* §9.3, §9.5, §10.1, §10.4, Mathlib `ProbabilityTheory.meas_ge_le_variance_div_sq`." The plan's `prerequisites` of target 10.5 agree with it.

   **Claim.** The line lists what the statement and its route need, item by item.

   **Witness.** Line 828 states the corollary with "a mild solution `f` on `[0, T₀]` with datum `f⁰` (§10.3)" on `𝕋^d` (§1.3), and its route uses the bound of §10.3 and `μ_X(𝕋^d) = 1`. Round 10 added §9.3 on the same ground (the statement names `HardSphere.grandCanonical`).

   **Exact repair.** Line 837: "*Needs:* §1.3, §9.3, §9.5, §10.1, §10.3, §10.4, Mathlib `ProbabilityTheory.meas_ge_le_variance_div_sq`."; add `target:1.3` and `target:10.3` to the plan's prerequisites of 10.5. Tested: both are earlier targets (1.3 < 10.5, 10.3 < 10.5), both are already prerequisites of 10.4, so no cycle and no new layer edge (Layer 10's Dependencies already list Layer 1).

Two findings, both P3; none is P1 or P2. Each carries a repair, and a repair, whatever its priority, asks for changes: the verdict is needs changes, with R01 and R02 as the whole of what remains. No supplier gap is declared and none is needed.

I edited neither the README, the plan nor the sources manifest, and fetched no source. No maintainer notes were supplied. This is the design lane: there is no `Suggested.lean`, and elaboration is not available (this lane does not elaborate; say so in the report). No Lean command was run.

## Previous findings, checked first

The preceding review is `REV-DESIGN-HardSphereDynamicsAndKineticLimits~9` (F01, F02, both P3); its repair report is `packages/HardSphereDynamicsAndKineticLimits/reports/FIX-DESIGN-HardSphereDynamicsAndKineticLimits~10.md`. Nothing was marked `not actionable in this package`; nothing is re-raised. The repair changed README lines 3, 13, 828, 832, 837 and 841 and the plan's target 10.5 (diff of the two heads read in full).

| Round-9 finding | Status | Repaired passage and my check |
|---|---|---|
| F01, corollary of §10.5 left `T₀`, `f⁰`, `f` unbound | Repaired | Line 828: "for all `C₀ ≥ 1` and `β₀ > 0` there is `T₀ > 0` such that for every continuous probability density `f⁰` … there is a mild solution `f` on `[0, T₀]` … for every `t ∈ [0, T₀]`, every bounded continuous `h` … and every δ > 0, `P_ε(…) → 0`". Quantifier order equals §10.4's (∀`C₀`∀`β₀`∃`T₀`∀`f⁰`∃`f`∀`t`). The plan's API entry has the same statement. Summary (line 3) and Layer 10 Examples (line 841) no longer leave `T₀` or "concentrate" unbound. |
| F02, scope paragraph omitted ProbabilisticAndMetricNumberTheory §4.9a | Repaired | Line 13: "ProbabilisticAndMetricNumberTheory §4.9a (`scalarLpKoopman_strong`, on complex `Lp`) allows an infinite, locally finite measure but assumes a jointly continuous action, which the hard-sphere flow on `E` is not for any `d ≥ 1` and `N ≥ 2`". On main, `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md:6361` (`Lp ℂ p μ`) and `:6363` (continuous action, locally finite, `p ≠ ∞`) say this. The restriction to `E` is right: on the unit torus with d = 2, ε = 0.4, `N = 8`, `8 · π · 0.04 = 1.0053 > 1`, so `𝒟̄ = ∅` and the action is trivially continuous. |

Adversarial pass on what the repair changed or added:

- **Discontinuity witness (line 13).** ε = 1, `a = (2, 0)`, `u = (−1, 0)`: contact when `2 − s = 1`, `s = 1`, so `v_1 = 0` at time 1; from `x_1 = (2 + η, 0)` contact at `1 + η > 1`, so `v_1 = (−1, 0)` at time 1. `|Δv_1| = 1` while `|ΔZ| = η`. Both states are in `G`, so this is not a junk-value effect.
- **Corollary route (line 828).** Weak clause of §10.4 at `n = 1, 2` gives the two hypotheses of the first theorem at `f = f(t)`; `μ_ε = ε^{−(d−1)}`: 100 at d = 2, 10⁴ at d = 3, 1 at d = 1 (ε = 0.01), so `d ≥ 2` is needed; `∫ C e^{−β|v|²/2} = (2π/β)^{d/2} C` on mass 1, finite.
- **Check 1 of §10.5 (line 832).** `C₀ = 1 ≥ (2π)^{−d/2}`: `0.15915` at d = 2. `F^ε_1(t) = F^ε_1(0)` by §9.4–9.5, `→ M` in `L¹` by §9.6 with `ρ⁰ = 1`.
- **The repaired patterns elsewhere.** A symbol used outside the scope that binds it: every other `T₀`, `C₀`, `β₀` is inside §10.4 or re-bound in §10.5. A named object missing from `*Needs:*`: R02. A neighbouring statement missing from the scope paragraph: none further (searches below).

## Verified sound

### Coverage and principles

I read all 872 README lines, the plan (45 targets, 170 tests, at least 3 per target, every target with a locator; counted mechanically), every `*Needs:*` line and the 9 manifest entries. `gaps` is empty and no prerequisite is a `gap:`.

- Mechanical comparison of the 45 `*Needs:*` lines with the plan's `target:` prerequisites: 0 differences; no prerequisite is a later or equal target. Every numbered section has at least three Checks.
- No route-specific shortcut (every `d ≥ 1`, every flat position space, `0 < ε < ρ`; `d ≥ 2` only in §10.4 and the corollary of §10.5, with the d = 1 counterexample as a Check). No re-planned roadmap, no upward or cyclic supply, no algorithm, no copied passage, no layer named after a source's chapter, no sentence saying the roadmap follows a source.
- A scan for LaTeX delimiters, pull-request numbers, machine paths, `lemma`, `set_option`, "optional", "deferred", "removed", "so far", "checkpoint", "handoff" and round labels found none.
- Layer `### Dependencies` against the `*Needs:*` lines of each layer: all ten agree (Layer 6: Layers 1, 3–5; Layer 8: 1, 3, 7; Layer 9: 1–3, 7–8; Layer 10: 1–2, 7, 9).

### Adversarial table

`E` is Euclidean space. The head-on witness is ε = 1, `x_1 = (2, 0)`, `x_2 = 0`, `v_1 = (−1, 0)`, `v_2 = 0`. Rows cover the fifteen sampled targets, the headline theorems and the targets the findings touch; every value was computed this round (the determinant rows also numerically, by central differences).

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1 class | lift uniqueness; kernel; ball image | `|c| < ρ` gives `‖πc‖ = |c|` (lift `c'` with `|c'| = ‖πc‖`, injectivity); nonzero `k ∈ ker π` has `|k| ≥ ρ`; `π(B(a, r)) = B(πa, r)` for `r ≤ ρ` in both inclusions | Sound | none |
| §1.3 | `2ℤ × ℤ`; maximality of ρ | covolume 2, ρ = 1/2; `π/16 = 0.19635` against `π/32`; for `ρ' > ρ`, `a = sk`, `b = (s − 1)k`, `s` just above 1/2, both in `B(0, ρ')`, same image | Sound | none |
| §2.2 | d = 1, 2, 3; Θ | `ω_{d−1}/(d + 1)`: 1/2, 2/3, π/4 times `(d + 1)` gives 1, 2, π; `(w' − v')·(−ω) = (w − v)·ω` | Sound | none |
| §3.3 (sampled) | outgoing contact `V = ((1, 0), 0)`, ν = (1, 0) | `c = 1`, `σ_M V = (0, (1, 0))`; `ℛ = (X, (0, (−1, 0)))`, `⟨0 − (−1, 0), ν⟩ = 1 > 0`; `(X, −V)`: `⟨(−1, 0), ν⟩ = −1`; `ℛ² = (X, σ_M σ_M V) = id` | Sound | none |
| §3.4 (sampled) | boost identity; torus; exit from `𝒟̄` | `S_1 B_1(0, 0) = (1, 1)`, `B_1 S_1(0, 0) = (0, 1)`, `A_1 B_1 S_1 = (1, 1)`; `π(e_1) = π(0)`; at `t = 1.5`, `x_1 = (0.5, 0)`, distance 0.5 < 1; field `(X, V) ↦ (V, 0)` is 1-Lipschitz | Sound | none |
| §3.5 (sampled) | witness of §2.1; reversal | `P = (0.9, 0.9)`, `H = ½(0.81 + 0.81) = 0.81` before, `½ · 1.62 = 0.81` after; reversed `(0, (−1, 0))`: `P = (−1, 0)`, `H = ½`; unsigned: `P = (1, 0)` | Sound | none |
| §4.1 | head-on; grazing; miss | `D = 4 − 3 = 1`, τ = 1; `a = (1, 3)`: `D = 9 − 9 = 0`, τ = 3; `a = (2, 3)`: `D = 9 − 12 = −3` | Sound | none |
| §4.2 (sampled) | oblique; incoming contact; reversal; semigroup at τ = s | `D = 9 − 8.36 = 0.64`, τ = 2.2, `q = (0.8, 0.6)`, `R_q u = (0.28, 0.96)`, norm 1; `|a| = ε`, `⟨a, u⟩ < 0`: `D = ⟨a, u⟩²`, τ = 0, `B_0 = (a, R_a u) ≠ id`; `⟨q, −R_q u⟩ = −√D`, `R_q(−R_q u) = −u`, `q − τu = a`; at τ = s the state `(q, R_q u)` is outgoing, then free | Sound | none |
| §4.3 | `DC` at three points | at `(2, 0, −1, 0)`: rows `(−1, 0, 0, 0)`, `(0, −1, 0, −2)`, `(0, 0, −1, 0)`, `(0, 2, 0, 3)`, det 1.000000; at `(3, 0.6, −1, 0)` and `(2.5, 0.3, −1.2, 0.1)`: det 1.000000; d = 1: `(2 − a, −u)`, det 1; variable time `(1 − 0.7u, −u)`, det 0 | Sound | none |
| §4.4 | non-injectivity locus | incoming contact `(a, u)` and outgoing `(a, R_a u)` both map to `(a + sR_a u, R_a u)`; nowhere else | Sound | none |
| §5.1 (sampled) | head-on; static touching pair; contact off `𝒯` | `V` takes two values on `ℝ ∖ {1}`; `v_i = v_j` at contact: `⟨·, ν⟩ = 0`, not outgoing, excluded; `M = ∅` gives `V(t) = V(t−)`, so no jump without contact | Sound | none |
| §5.2 (headline) | backward step | `V(t−) = σ_M V(t)` by involution; a contact off `𝒯` with `V` constant overlaps before `t`: `ε² − 2s⟨a, u⟩ + s²|u|² < ε²` | Sound | none |
| §5.4 (sampled) | forward map; converse; DengHaniMa2024 rule at an outgoing datum | `σ_M V(t) = V(t−)`; right limit of `Y` is `V(t) = σ_M(σ_M V(t))`; converse: `V_Z(t−) = V_Y(t)`, `σ_M V_Z(t−) = V_Z(t)`; outgoing datum `(0, (−1, 0))` scattered at `0+` to `((−1, 0), 0)`, distance `1 − t < 1` | Sound | none |
| §5.5 | `N = 2` on `E`, all cases; d = 1 | `|a| = ε`: `D = ⟨a, u⟩²`, good iff `⟨a, u⟩ > 0`; `|a| > ε`: bad iff `u ≠ 0`, `D = 0`; d = 1: `D = u²ε² > 0` for `u ≠ 0`; incoming contact `(1, 0; −1, 0)` bad and not pathological | Check 2 sound; prose sentence inexact | R01 |
| §6.1 (sampled) | `N ≤ 2`; `N = 3`; `μ_X(K) = ∞` | `I = ∅`; ordered triples `≤ N³`, two shells `ω_d((ε + η)^d − ε^d)` (needs `ε + η < ρ`, §1.4), `x_i` and `N − 3` others in `K`: `μ_X(K)^{N−2}`; `N = 2`: `∞⁰ = 1`, bound positive | Sound | none |
| §6.2 (sampled) | non-near pair; torus lift; block Check | relative speed `≤ √2 |V| ≤ 2R`, displacement `< 2Rδ`, distance stays `> ε`; other lifts `|a + k| ≥ 2ρ − ρ = ρ > ε + 4Rδ`; `|V| = √(4 · 0.01) = 0.2`, images `0.1, 2.1, 20.1, 22.1`; `0.47 + 0.18 = 0.65 ≥ 0.5`, `0.39 + 0.09 = 0.48 < 0.5` | Sound | none |
| §6.3 (sampled) | constant; step count; δ > 1 | `(ε + 2Rδ)^d − ε^d ≤ d(ε + 2R)^{d−1} 2Rδ` for `δ ≤ 1`; `8 · (12π)² · π²/2 = 576π⁴ = 56107.6`; `⌈t/δ⌉ ≤ (t + 1)/δ`; `F ⊆ K^N × B_R` gives the trivial bound times `δ > 1` | Sound | none |
| §6.4 (headline) | "exactly the union over `m`, `R`" | on `[0, t]` the second-nearest distance of each particle is continuous and `> ε`, minimum `ε + γ`; `m` with `2Rt/m < γ` and `ε + 4Rt/m < ρ` passes | Sound | none |
| §7.1 (sampled, headline) | head-on `T_3`; grazing state; group law off `G` | `((1, 0), (−2, 0); 0, (−1, 0))`; `a = (2, 1)`: `D = 4 − (5 − 1) = 0`, so `T_1 Z = Z`, `S_1 Z` has `x_1 = (1, 1)`; off `G` both sides are `Z` | Sound | none |
| §7.2 (headline) | carriers | `𝒟̄ᶜ = {|x_1 − x_2| < 1}` has measure ∞ on `E`; `8 · 0.12566 = 1.0053 > 1` | Sound | none |
| §7.3 (headline) | `T_t ℛ = ℛ T_{−t}` off `G`; boost off `G` | `ℛ` is an involution of the whole space preserving `G`, so both sides are `ℛZ`; boost formula would give `(3, 1)`, `(1, 0)` against the fixed `(2, 1)`, `0` | Sound | none |
| §7.4 (sampled) | group law; `p ≠ 2`; circle `N = 3`; `p = ∞` | `U_s U_t f = f ∘ T_{−t} ∘ T_{−s}`; support of `U_t f − f` has measure `≤ 2μ(supp f)`, `‖g‖_p^p ≤ ‖g‖_∞^{p−2}‖g‖_2²`; gaps `≥ 1/3` summing to 1 are all 1/3, `q_3 = 0`; `‖U_t f − f‖_∞ = 1` on `E` | Sound | none |
| §8.2 (headline) | continuity at a collision; the d = 1 box | `r ↦ φ(t_k + r, S_r Y)` is differentiable at 0 at the incoming state `Y`, so the left limit is `φ(t_k, Y) = φ(t_k, Z(t_k))` by the specular condition; τ ∈ `(0.95192, 1.05208)`, `H ∈ (0.4802, 0.5204)`, defect `−1 − 0 = −1` | Sound | none |
| §8.3 | specular inheritance; Check 4 | completions with a further contact are null, so the matching is that of `Z_s` almost everywhere; `e^{−1.62} = 0.19790`, `|(0.9, 0.9)| = 1.2728 > 1` | Sound | none |
| §8.4 (sampled) | `s = 2`, `N = 3`; `s > N`; unnormalised | 6 injective maps of 9; `Nat.descFactorial 1 2 = 0` against `1!/0! = 1`; `2e⁻² = 0.27067` on both sides | Sound | none |
| §9.4 (headline) | `c M_{β,u}` | component density `(μc)^N/(N! Z) · Π M`, with `Σ|v_i − u|² = 2H − 2⟨u, P⟩ + N|u|²` | Sound | none |
| §9.5 (sampled, headline) | resummation; inversion; bound; circle Check | `(1/N!) · N!/(N − n)! = 1/p!`; `Σ_{p+q=m} (−1)^p/(p! q!) = 0` for `m ≥ 1`; `μ^n · μ^p · μ^{−(n+p)} · μ^{n+p+q} = μ^{n+p+q}`, sum `exp(2μC₀K)`; `0.8√(2π) = 2.00530 ≤ 2.50663` | Sound | none |
| §9.6 (headline) | factorisation; scaling | `F_n(0) = (f⁰)^{⊗n} 1_{𝒟̄_n} Z⁻¹ Σ_p (μ^p/p!) ∫ Π f⁰ 1[…]`; `1 − p_ε ≤ nμω_dε^d‖ρ⁰‖_∞`; `μ_ε ω_d ε^d = ω_d ε`, `(4π/3)(0.01) = 0.04189` | Sound | none |
| §10.1 (sampled) | first and second moments; `N = 0` | `μ⁻¹ · μ∫F_1 h`; `μ⁻²(μ∫F_1 h² + μ²∫F_2 h⊗h)`; empty configuration gives 0 | Sound | none |
| §10.2 (sampled) | loss term; weak form; β = 0; d = 1 | `ω_2 = π`, `E|w| = √(8/π) = 1.59577`; swap sends ψ to `ψ_*`, Θ sends ψ to `ψ'` and flips the sign of the bracket: factor ¼; `c = −r/√2`, `v' = (r/2)(1, 1)`, `w' = (r/2)(1, −1)`, speeds `r/√2`; d = 1: `σ_ω(v, w) = (w, v)`, `Q = 0` | Sound | none |
| §10.4 | hypotheses against BGSS2023 (1.1.5); weak clause | Lipschitz bound follows from (1.1.5) along a segment of length `‖x − y‖`; almost-everywhere convergence with `∫F_n(t) = ∫F_n(0) → 1` gives `L¹` convergence | Consistent with BGSS2023 lines 316–321 | none |
| §10.5 (headlines) | second moment; d = 1; wrong `F_2` | `0 + m² − 2m² + m² = 0`; `1 − e⁻¹ = 0.63212`; `F_2 → 2f⊗f` gives `m²` | Sound | R02 for the `*Needs:*` line |

### Seeded source sample

I opened the three readable texts at every locator of the fifteen sampled targets. The author flagged no locator as unverified.

| Target | Text opened and result |
|---|---|
| 3.3 | GST2013 lines 1219–1227: the pre-image of a post-collisional pair, (4.4.1). Confirmed. |
| 3.4 | GST2013 lines 836–837 ((4.1.1)); BGSS2023 lines 122–123 ((1.1.1)). Confirmed. |
| 3.5 | GST2013 (2.1.3), lines 396–399. Confirmed. |
| 4.2 | GST2013 lines 842–847 ((4.1.2)); BGSS2023 lines 133–136. Confirmed. |
| 5.1 | GST2013 lines 836–847; BGSS2023 lines 122–131; DengHaniMa2024 lines 140–172 (Definition 1.1). Confirmed. |
| 5.4 | DengHaniMa2024 Definition 1.1, lines 140–172; domain at lines 150–153 (closed, `≥ ε`); left continuity at lines 164–166; `d ≥ 2` at line 141. Confirmed. |
| 6.1 | GST2013 Lemma 4.1.1, lines 864–874. Confirmed; the explicit constant is the roadmap's. |
| 6.2 | GST2013 lines 875–887. Confirmed. |
| 6.3 | GST2013 lines 875–898; `t/δ` an integer at line 876; the factor at line 896. Confirmed. |
| 7.1 | GST2013 line 862 (Proposition 4.1.1); BGSS2023 lines 132–139; DengHaniMa2024 lines 173–178. Confirmed. |
| 7.4 | GST2013 lines 1138–1140 ((4.3.5)); DengHaniMa2024 lines 175–178 ((1.5)). Confirmed; strong continuity is the roadmap's. |
| 8.4 | BGSS2023 (1.1.9), lines 241–266, indicator at line 249, printed p. 3. Confirmed. |
| 9.5 | BGSS2023 (1.1.10), lines 267–277; (1.1.11), lines 279–288; inversion formula, lines 229–237; DengHaniMa2024 (1.11), lines 235–244. Confirmed. |
| 10.1 | BGSS2023 (1.2.4)–(1.2.5), lines 324–334; (1.2.6), lines 335–340; variance, lines 352–369. Confirmed. |
| 10.2 | BGSS2023 (1.2.1)–(1.2.3), lines 292–312; GST2013 (2.1.2), lines 385–393; (2.2.1), lines 432–437; DengHaniMa2024 (1.13)–(1.14), lines 258–282. Confirmed. |

Also read: GST2013 lines 45–112 (contents), 205–217, 664–698, 826–960, 2066–2082; BGSS2023 lines 116–372; DengHaniMa2024 lines 134–292.

### Pinned declarations

Pins: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5` (the plan's baseline). Opened this round, paths relative to each library:

- `TauCeti/Dynamics/Flow/OfLipschitz.lean:59` (`flowOfLipschitz`, a `Flow ℝ E`, `[CompleteSpace E]`, `LipschitzWith K v`); `TauCeti/Analysis/Semigroups/Group/Basic.lean:74` (`map_zero'`, `map_add'` for all real `s, t`, `continuousAt_zero'`); `TauCeti/Probability/Process/EmpiricalMeasure.lean:224` (a `ProbabilityMeasure`); `TauCeti/Probability/Distributions/Gaussian/Density.lean:82`, `:265` (`S.PosDef`).
- `Mathlib/Analysis/Normed/Group/Quotient.lean:168` (`norm_mk`, `infDist`), `:222` (`instNormedCommGroup`, `[IsClosed]`, additive form); `Mathlib/Topology/Algebra/OpenSubgroup.lean:377` (`[T1Space]`); `Mathlib/MeasureTheory/Constructions/Polish/Basic.lean:148`, `:154`, `:649` (`[N.Normal] [IsClosed]`); `Mathlib/Topology/MetricSpace/ProperSpace.lean:66`.
- `Mathlib/Algebra/Module/ZLattice/Covolume.lean:85`; `Mathlib/MeasureTheory/Group/FundamentalDomain.lean:733`, `:754`; `Mathlib/MeasureTheory/Measure/Haar/Quotient.lean:75`, `:222` (`[LocallyCompactSpace G]`); `Mathlib/Analysis/Fourier/AddCircleMulti.lean:173`.
- `Mathlib/MeasureTheory/Function/Jacobian.lean:1096`, `:1184`; `Mathlib/Analysis/InnerProductSpace/Projection/FiniteDimensional.lean:59`; `Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean:172`, `:231` (`det f ≠ 0`), `:527` (`[Nontrivial E]`); `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:734`; `Mathlib/MeasureTheory/Constructions/HaarToSphere.lean:52`, `:88`.
- `Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:330` (`0 < b`); `Mathlib/Probability/Distributions/Poisson/Basic.lean:40` (`r : ℝ≥0`); `Mathlib/MeasureTheory/Function/ContinuousMapDense.lean:142`; `Mathlib/MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean:1140` (`ContinuousOn f (Icc a b)`); `Mathlib/Probability/Moments/Variance.lean:398` (`[IsFiniteMeasure μ]`, `MemLp X 2 μ`); `Mathlib/Data/Nat/Factorial/Basic.lean:367`; `Mathlib/MeasureTheory/Constructions/Pi.lean:732`; `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:595`, `:611`.

The files named in the contracts for `UnitAddTorus`, `gaussianPDFReal`, `multivariateGaussian`, `Submodule.reflection` and `Flow` exist at the pin. Every name opened exists with the hypotheses the contract states.

### Duplication, ownership and overlap

`scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id, no id that only a revision defines and no second copy; the folder is not on main and is not one of the two board packages on other branches (AnalyticNumberTheory, LawrenceVenkateshMethod). Object searches over main and the open heads (`roadmaps grep`, index of 2026-11-15):

- "hard sphere", Lanford, BBGKY, Boltzmann–Grad, "collision operator", Maxwellian: only ClassicalErgodicTheory (three lines: outside its scope, a consumer of its §3.5) and MathematicalBilliards (one downstream remark). "grand canonical", `FlatPositionSpace`, `FlatTorus`, `HardSphere.`: no match.
- "specular", "Liouville equation", "elastic collision", "two-body": no roadmap states the hard-sphere objects (the hits are a symplectic remark, a special-function equation and relativistic scattering).
- Flat tori: MathematicalBilliards §10.5 (`ℂ/Λ` as a translation surface; Check "`Λ = 2ℤ + 2iℤ`: area `4`", read at its head); elsewhere only examples. No roadmap owns `E ⧸ L` with its quotient norm and Haar measure.
- Correlation functions: PointProcesses (unlabelled point processes, including a hard-core density with Papangelou intensity) and RandomMatrices (configuration spaces); the objects here are formulas on labelled configurations with the `μ^{−n}` rescaling, as the scope paragraph says.
- Koopman strong continuity: ClassicalErgodicTheory §0.2 (finite invariant measure), MathematicalBilliards §12.3 (probability space, `Lp ℂ 2`), ProbabilisticAndMetricNumberTheory §4.9a (continuous action); all three are named at line 13.

The one cross-roadmap supplier, ClassicalErgodicTheory §3.5, read at the head of its open pull request: heading "Flows defined almost everywhere"; a standard Borel space and a σ-finite measure; item 1 conull flows (its conventions define a measurable flow as a jointly measurable `AddAction ℝ X`) with the identity extension; item 3 disjoint unions, "invariant iff each component restriction is"; item 4 `(Φ t)_* ν = μ.withDensity (W ∘ Φ (-t))`. The contract at README lines 73–79 says the same. StandardDistributions (Layer 5, on main), OneParameterSemigroups and ComplexTori (on main) are named only as owners. `scratch/citations.md`: no cross-roadmap citation unresolved; the 17 Lean names it lists are this roadmap's own `HardSphere.*` names, expected at the design stage. No roadmap of the never-cite list is cited as a supplier (PointProcesses is named only as the owner of a deferred subject).

Overlap check: read ClassicalErgodicTheory, MathematicalBilliards, ProbabilisticAndMetricNumberTheory (cited sections and scope) and searched PointProcesses, RelativisticQuantumFieldTheory, HamiltonianSystems, OptimalTransport and RandomMatrices for the objects above (third list empty); conull flows, their disjoint unions and the transport of densities: owner ClassicalErgodicTheory §3.5, cited here; the translation-surface structure of `ℂ/Λ`: owner MathematicalBilliards §10.5, not restated; Koopman strong continuity for finite measures or continuous actions: owners ClassicalErgodicTheory §0.2, MathematicalBilliards §12.3 and ProbabilisticAndMetricNumberTheory §4.9a, not shared for `N ≥ 2`; correlation functions of unlabelled point processes: owner PointProcesses, not restated; nothing else shared.

### Supplier order

```text
candidate: HardSphereDynamicsAndKineticLimits is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2241 edges, 0 problem(s)
```

No UPWARD or CYCLE line. ClassicalErgodicTheory is another author's open pull request that adds a new roadmap folder, which this roadmap may consume; it is not in `merge-order/ORDER.txt`, so the check does not see the edge. By reading: ClassicalErgodicTheory names the hard-sphere flow only as a consumer and cites nothing of this roadmap.

### Headline theorems

Named for the package stage: `HardSphere.IsTrajectory.eqOn` (§5.2), `HardSphere.volume_hardCoreSet_diff_goodSet` (§6.4), `HardSphere.flow_add` (§7.1), `HardSphere.measurePreserving_flow` (§7.2), `HardSphere.flow_reversal` (§7.3), `HardSphere.weak_liouville` (§8.2), `HardSphere.grandCanonical_flow_invariant` (§9.4), `HardSphere.lintegral_sum_distinct_eq_correlation` (§9.5), `HardSphere.boltzmannGrad_scaling` (§9.6), `HardSphere.tendsto_empirical_of_correlation` and `HardSphere.LanfordStatement.tendsto_empirical` (§10.5). Each names the roadmap's objects. The padding probe and the `#check` comparison have nothing to run on at this stage.

Remarks that need no change:

- The README gives source locators as line numbers of the cached extractions beside equation and theorem numbers; four roadmaps on main do the same.
- §9.5's Check on `ε = 0` evaluates the correlation function at `t = 0` only, where no flow is needed; the flow is used for `0 < ε < ρ`.

### Copyright, licences and scope

- **Wording.** Beside the locators of the fifteen sampled targets I compared seven further passages with the source text: §5.5's sentence on pathological trajectories with GST2013 lines 851–854; the Summary's sentence on the law of large numbers with BGSS2023 lines 341–343; §10.4 with BGSS2023 lines 316–321; §9.3's exchangeability statement with BGSS2023 lines 184–187; §9.2's sentence on the canonical formalism with BGSS2023 lines 158–160; §8.3's inheritance of the boundary condition with GST2013 lines 933–938; §9.6 with DengHaniMa2024 lines 246–252. No run of more than four words is shared (terms of art), and no sentence follows a source clause by clause.
- **Arrangement.** GST2013 has the largest share: 51 of the 118 occurrences of a source key in the README (BGSS2023 44, DengHaniMa2024 23). Its contents (lines 45–112): Chapter 1 the low density limit, Chapter 2 the Boltzmann equation, Chapter 3 main results, Chapter 4 the `N`-particle flow, the Liouville equation, its weak form and the hierarchies, Chapters 5–7 estimates and convergence. Layers 1–4 have no counterpart; Layers 5–7 expand its §4.1; the collision operator, in its Chapter 2, is in Layer 10; Layer 9 has no counterpart. No run of layers maps one to one onto a run of its chapters or sections. The order of Layers 7 to 10 is forced: §8.1 needs §7.2, §9.5 needs §8.1 and §8.4, §10.1 needs §9.5.
- **Reuse.** No table, figure, list of examples or numerical data is taken from a source.

Source independence: 22 passages compared with 3 sources, none shared; largest share GST2013, 51 of 118 locators; contents compared with GST2013: independent.

## Not verifiable

- Alexander1976 Proposition 4.3 and AlexanderThesis1975 Chapter 1: settled uncertified; only the attribution in GST2013 (line 855) was read.
- Lanford1975, CIP1994, Spohn1991, Uchiyama1988: settled uncertified; not read, not requested again.
- Lean elaboration, the one-tactic padding probe and the `#check` comparison: not available (this lane does not elaborate), and there is no `Suggested.lean`.
- The truth of `HardSphere.LanfordStatement` beyond its agreement with BGSS2023 Theorem 1, its `t = 0` case and its equilibrium case: the proof belongs to a later roadmap.
- The dependency check's verdict on the ClassicalErgodicTheory edge: the tool does not see it; the direction was checked by reading.
- The two board packages on other branches (AnalyticNumberTheory, LawrenceVenkateshMethod) were not opened; neither is in this subject.

## Source issues

- **Misprint** in GST2013 at (4.4.1), printed p. 33: the source says the starred velocities are the pre-image of the pair under (4.1.1), the free flow; it should be under the reflection law (4.1.2); affects nothing.
- **Gap** in GST2013 at Proposition 4.1.1, proof, printed p. 28: the source uses invariance of Lebesgue measure under the partially built flow without proving it for a collision step; it should first establish the unit Jacobian of the two-body step; affects the proof.
- **Error** in DengHaniMa2024 at Proposition 1.2(3), printed p. 4: the source says the flow maps are diffeomorphisms off one closed null set; it should say measure-preserving bijections, smooth where the collision sequence is locally constant; affects a stated result.

## For the human reviewers

- Supplier: ClassicalErgodicTheory is another author's open draft pull request and is not in the merge order; the item numbers of its §3.5 are fixed only when it merges.
- Scope: `HardSphere.LanfordStatement` (README §10.4) is a proposition whose proof is left to a roadmap on the BBGKY hierarchy; searches for "BBGKY" and "Lanford" found no such roadmap on main or open.
- Licence: the three texts read are arXiv copies. Six cited works are recorded `uncertified` in `sources.toml` and were not read.
- Scope: BGSS2023 is Ann. of Math. 198 and GST2013 an EMS monograph; DengHaniMa2024 is cited in its arXiv version (v3), and I did not check whether it has appeared.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b95136f560c772c52f39efdfb8e1912c25e859b8", "job": "REV-DESIGN-HardSphereDynamicsAndKineticLimits~10", "model": "fable", "worker": "chris-x29"} -->
