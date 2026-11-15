<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13780#issuecomment-6899317321 -->
Review (claude) of 5d27186

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §10.5's Poisson Check omits the time at which it holds

   **Location.** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:834`: "`ε = 0` (Poisson process with intensity `μ f⁰`): `Var(π(h)) = μ^{−1} ∫ f⁰ h²` exactly, which tends to 0."

   **Claim.** The variance of the empirical measure at ε = 0 is `μ^{−1} ∫ f⁰ h²`, with no time named; the section's objects are `π^ε_t` for `t ∈ ℝ`.

   **Witness.** `design/plan.json`, target 10.5, test `poisson_variance`: "ε = 0, t = 0". At `t ≠ 0` under free transport the variance is `μ^{−1} ∫ f⁰ (h ∘ S_t)²`, which is 0 when `h` vanishes on `S_t(supp f⁰)`.

   **Exact repair.** Line 834: "`ε = 0` at `t = 0` (Poisson process with intensity `μ f⁰`; the flow is not used): `Var(π_0(h)) = μ^{−1} ∫ f⁰ h²` exactly, which tends to 0 as `μ → ∞`." Tested on the witness: at `t = 0` the particles are a Poisson process of intensity `μ f⁰`, so `Var(μ^{−1} Σ h(z_i)) = μ^{−2} · μ ∫ f⁰ h²`; the repaired sentence no longer speaks of `t ≠ 0`, where ε = 0 is outside the standing hypothesis `0 < ε < ρ`. The plan needs no change.

2. **F02** (P3) §1.1's supremum-norm Check refutes the instance only for ρ > 0.1

   **Location.** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:105`: "the class of `(0.1, 0.1)` has supremum norm 0.1 while every lift has Euclidean norm at least `0.1414`, so the lift axiom fails."

   **Claim.** `UnitAddTorus (Fin 2)` with its supremum norm is not an instance of the class for the coordinate cover, whatever radius is chosen.

   **Witness.** The lift axiom of line 91 binds only `‖ξ‖ < ρ`. With ρ = 0.05 the class of `(0.1, 0.1)` has norm `0.1 ≥ ρ` and the axiom says nothing about it.

   **Exact repair.** Line 105, after "is not an instance for the coordinate cover": "for any radius ρ > 0: for `0 < s < min(ρ, 1/2)` the class of `(s, s)` has supremum norm `s < ρ` while every lift has Euclidean norm at least `s√2` (0.1 against `0.1414` at `s = 0.1`), so the lift axiom fails." The plan's test `sup_norm_torus_fails` gains the same clause. Tested on the witness: ρ = 0.05, `s = 0.01` gives norm `0.01 < 0.05` and lifts of norm at least `0.01414 ≠ 0.01`.

Two findings, both P3; none is P1 or P2. Each carries a repair to the README, so the verdict asks for changes: a fix round applies R01 and R02, and nothing else in the design needs repair. No supplier gap is declared and none is needed.

I edited neither the README, the plan nor the sources manifest, and fetched no source. No maintainer notes were supplied. This is the design lane: there is no `Suggested.lean`, and elaboration is not available (this lane does not elaborate; say so in the report). No Lean command was run.

## Previous findings, checked first

The preceding review is `REV-DESIGN-HardSphereDynamicsAndKineticLimits~10` (F01, F02, both P3); its repair report is `packages/HardSphereDynamicsAndKineticLimits/reports/FIX-DESIGN-HardSphereDynamicsAndKineticLimits~11.md`. Nothing was marked `not actionable in this package`; nothing is re-raised. The repair changed README lines 451, 455, 524, 828 and 837 and the plan's targets 5.5 and 10.5 (diff of the two heads read).

| Round-10 finding | Status | Repaired passage and my check |
|---|---|---|
| F01, §5.5 and Layer 6 Examples identified `𝒟̄ ∖ G` with the pathological data | Repaired | Line 451: "Its complement in `𝒟̄` consists of two kinds of data: the contact states with an incoming pair, which the outgoing condition of §5.1 excludes … and the data whose motion, forward or backward in time, is pathological". Line 524 lists "the incoming contact states (touching rods approaching each other, such as `x_1 = 1`, `x_2 = 0`, `v_1 = −1`, `v_2 = 0` at ε = 1 …)". The round-10 witness is now listed in both. |
| F02, §10.5's `*Needs:*` omitted §1.3 and §10.3 | Repaired | Line 837: "*Needs:* §1.3, §9.3, §9.5, §10.1, §10.3, §10.4, Mathlib `ProbabilityTheory.meas_ge_le_variance_div_sq`, `GaussianFourier.integral_rexp_neg_mul_sq_norm`." The plan's prerequisites of 10.5 are `1.3, 9.3, 9.5, 10.1, 10.3, 10.4` and the same two Mathlib names (mechanical comparison below). |

Adversarial pass on what the repair changed or added:

- **Exactness of line 451.** For `N = 2` on `E` I enumerated all cases against Check 1 (line 455). `|a| > ε`, `u ≠ 0`, `D = 0`: tangent at `s = −⟨a, u⟩/|u|²`, listed as grazing. `D > 0`: one non-grazing collision, past or future, in `G`. `D < 0` or `u = 0`: never in contact, in `G`. `|a| = ε`: `D = ⟨a, u⟩²`, in `G` exactly when `⟨a, u⟩ > 0`; `< 0` is the incoming clause and `= 0` is grazing at time 0. Both descriptions give the same set.
- **Past-tangency witness (line 455).** `a = (−2, 1)`, `u = (−1, 0)`, ε = 1: `⟨a, u⟩ = 2`, `|a|² = 5`, `D = 4 − 1 · (5 − 1) = 0`, tangency at `s = −2`, point `a − 2u = (0, 1)` of norm 1 with `⟨(0, 1), u⟩ = 0`. Forward, `|a + su|² = (2 + s)² + 1 ≥ 5`. Correct.
- **Line 524, d = 1.** The witness `(1, 0; −1, 0)` has `⟨v_1 − v_2, ν_12⟩ = −1`; its scattered state `(0, −1)` has `⟨v_1 − v_2, ν_12⟩ = 1`, distance `1 + t` for `t > 0` and `1 − t` for `t < 0`. Correct.
- **Gaussian integral in the corollary's route (line 828).** `b = β/2` gives `(π/b)^{d/2} = (2π/β)^{d/2}`; the lemma at the pin takes `0 < b` (`Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:330`).
- **The repaired patterns elsewhere.** A complement or exceptional set described too narrowly: line 517 refers to "the union of §5.5" and is right; the Summary speaks only of the null set. A named object missing from `*Needs:*`: the mechanical comparison finds none. A Check that omits the parameter value it needs: R01.

## Verified sound

### Coverage and principles

I read all 872 README lines, the plan (10 layers, 45 targets, 170 tests, at least 3 per target, every target with a locator), every `*Needs:*` line and the 9 manifest entries. `gaps` is empty and no prerequisite is a `gap:`.

- Mechanical comparison of the 45 `*Needs:*` lines with the plan's `target:` prerequisites: 0 differences; no prerequisite is a later or equal target; every numbered section has one `*Needs:*` line and at least three Checks (3 to 6).
- No route-specific shortcut: every `d ≥ 1`, every flat position space, `0 < ε < ρ`; `d ≥ 2` only in §10.4 and the corollary of §10.5, with the d = 1 counterexample as a Check. No re-planned roadmap, no upward or cyclic supply, no algorithm, no copied passage, no layer named after a source's chapter, no sentence saying the roadmap follows a source.
- A scan for LaTeX delimiters, pull-request numbers, machine paths, `lemma`, `set_option`, "optional", "deferred", "removed", "so far", "checkpoint", "handoff", HTML anchors, numbered target blocks and round labels found none.
- Layer `### Dependencies` against the `*Needs:*` lines: all ten agree.

### Adversarial table

`E` is Euclidean space. The head-on witness is ε = 1, `x_1 = (2, 0)`, `x_2 = 0`, `v_1 = (−1, 0)`, `v_2 = 0`. Rows cover the fifteen sampled targets, the headline theorems and the targets the findings touch; I computed every value this round.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1 class | local isometry; sphere; sup-norm torus at ρ = 0.05 | `|a − b| < ρ`: lift `c` of `π(a − b)` with `|c| = ‖π(a − b)‖ < ρ`, injectivity gives `c = a − b`; sphere of radius `r < ρ` is `π` of a null set; `(0.01, 0.01)`: 0.01 against 0.01414 | Sound; Check 3 witness too narrow | R02 |
| §1.2 (sampled) | ρ = ∞; ρ = 2 structure | `ℓ = id`; ball of radius 100: `10⁴π = 31415.93`; with ρ = 2 the ball axiom stops at radius 2 and ε < 2 | Sound | none |
| §1.4 (sampled) | shell d = 2; shell beyond ρ; packing | `π(1.21 − 1) = 0.65973`; circle: `{0.4 ≤ ‖y‖ ≤ 0.5}` has length 0.2 against `2 · 0.2 = 0.4`; `0.04π = 0.12566`, `7 · 0.12566 = 0.8796 ≤ 1 < 1.0053 = 8 · 0.12566`; balls of radius `ε/2 ≤ ρ` are disjoint and have volume `ω_d (ε/2)^d` | Sound | none |
| §2.2 (sampled) | Θ twice; kernel; d = 1, 2, 3 | `σ_{−ω} σ_ω = id`; `(w' − v')·(−ω) = (w − v)·ω`, at the witness `(−0.9, −0.9)·(−1, 0) = 0.9`; `∫_B ⟨e, x⟩_+ = ½ω_{d−1}(1 − (d−1)/(d+1)) = ω_{d−1}/(d+1)`: ½, ⅔, π/4; times `d + 1`: 1, 2, π; probability normalisation `π/(4π) = ¼` | Sound | none |
| §3.2 (sampled) | torus normal; non-matching; pair order | `π(0.1, 0) − π(0.8, 0) = π(0.3, 0)`, norm 0.3, `ν = (1, 0)`; `0, (1, 0), (−1, 0)`: pairs `{1,2}`, `{1,3}`, distance of 2 and 3 is 2; `⟨(1, 0), (1, 0)⟩ = ⟨(−1, 0), (−1, 0)⟩ = 1` | Sound | none |
| §5.2 (headline) | backward step; gluing at `b` | `V(t−) = σ_M V(t)`; a contact with `V(t−)` outgoing overlaps before `t`, with `V(t−)` grazing gives `V(t)` grazing, excluded; at `b` the jump rule comes from `[a, b]`, right continuity from `[b, c]` | Sound | none |
| §5.3 (sampled) | reversal of the jump rule; endpoints; boost | `Ṽ(t) = −σ_M V(−t) = −V((−t)−)`; `Ṽ(t−) = −V(−t)`, `σ_M Ṽ(t−) = Ṽ(t)`; at the least element of `−J`: `−σ_M V(b) = −V(b−)`, right-continuous; witness at `−3`: `(1, 0), (−2, 0); 0, (1, 0)`, collision at `−1`; boost: positions `(2 + t, 0)`, `(t, 0)` until `t = 1` | Sound | none |
| §5.5 (sampled) | `N = 2` on `E`, all cases; triple contact; `N ≤ 1` | as in the list above; `D = 4 − 4 = 0` at `a = (−2, 1)`; equilateral triangle: each particle touches two others at time 0; no pairs for `N ≤ 1` | Sound | none |
| §6.1 (sampled) | count; `N ≤ 2`; `μ_X(K) = ∞` | ordered triples `N(N−1)(N−2) ≤ N³`; `x_i` and `N − 3` others in `K`, two shells: `μ_X(K)^{N−2} (ω_d((ε+η)^d − ε^d))²`; `N = 2`: `I = ∅`; `π((1+η)² − 1) = π(2η + η²)` | Sound | none |
| §6.4 (headline) | `N = 1`, `N = 2` | no pairs; the cylinder `D = 0` and the contact set are null | Sound | none |
| §7.1 (headline) | head-on `T_3`; grazing state | `((1, 0), (−2, 0); 0, (−1, 0))`; `a = (2, 1)`: `D = 4 − (5 − 1) = 0`, `T_1 Z = Z`, `S_1 Z` has `x_1 = (1, 1)` | Sound | none |
| §7.2 (sampled, headline) | carriers | `(λ_N|𝒟̄)(Gᶜ) = λ_N(𝒟̄ ∖ G) = 0`; on `E`, `𝒟̄ᶜ = {|x_1 − x_2| < 1}` has measure ∞; `8 · 0.12566 = 1.0053 > 1` so `𝒟̄ = ∅` | Sound | none |
| §7.3 (sampled, headline) | reversal on and off `G`; rotation; boost off `G` | on `G`: `T_t ℛZ = ℛ(Z(−t))`; off `G`: both sides `ℛZ`; `ℛ T_3 Z = ((1, 0), (−2, 0); 0, (1, 0))` and `T_{−3} ℛ Z` the same (collision at `−1`); `v_1 = (0, −1)`: `x_1 = (2, −t)`, distance ≥ 2; formula `(3, 1)`, `(1, 0)` against fixed `(2, 1)`, `0` | Sound | none |
| §7.4 (sampled) | group law; domination; `q_3`; `p = ∞` | `U_s U_t f = f ∘ T_{−t} ∘ T_{−s}`; for `|t| ≤ 1` the support of `U_t f` stays in positions within `R` of `supp f` and the same speeds, finite measure; `2 · 1 = 2`; gaps `≥ 1/3` summing to 1 are all 1/3; `‖U_t f − f‖_∞ = 1` on `E`, 0 on the circle | Sound | none |
| §8.2 (headline) | the d = 1 box | τ ∈ `(0.99/1.04, 1.01/0.96) = (0.95192, 1.05208)`; `H ∈ (0.4802, 0.5204)`; defect `−1 − 0 = −1` | Sound | none |
| §8.3 (sampled) | first marginal; specular Check | `g(z_1)(1 − ω_d ε^d)∫g̃`; completions with a further contact are null and off `𝒟̄_N` both sides vanish; `e^{−1.62} = 0.19790`, `|(0.9, 0.9)| = 1.2728 > 1` | Sound | none |
| §9.1 (sampled) | density; product identity | `S = β⁻¹·1`: `(2π)^{−d/2} β^{d/2} exp(−β|v − u|²/2)`; `|v' − u|² + |w' − u|²` unchanged; `1/√(2π) = 0.39894`; `(2π)^{3/2} = 15.7496`; variance of `exp(−β|v|²)` is `1/(2β)` | Sound | none |
| §9.4 (headline) | `c M_{β,u}` | `Σ|v_i − u|² = 2H − 2⟨u, P⟩ + N|u|²`; `∫ f⁰ = c μ_X(X) < ∞` | Sound | none |
| §9.5 (headline) | inversion; mass | `Σ_{p+q=m} (−1)^p/(p! q!) = 0` for `m ≥ 1`; `∫F_n = μ^{−n} Σ_p ((n+p)!/p!) P(N = n + p)`; `0.8 √(2π) = 2.0053 ≤ 2.5066` | Sound | none |
| §9.6 (sampled, headline) | factorisation; bound; scaling | `F_n(0) = (f⁰)^{⊗n} 1_{𝒟̄_n} Z⁻¹ Σ_p (μ^p/p!) ∫ Π f⁰ 1[…] = (f⁰)^{⊗n} 1 p_ε`; `1 − p_ε ≤ μ ∫ F_1 1_{∪B} ≤ n μ ω_d ε^d ‖ρ⁰‖_∞`; `μ_ε ε^d = ε`; `(4π/3)(0.01) = 0.04189` | Sound | none |
| §10.1 (sampled) | moments; `N = 0` | `μ⁻¹ · μ∫F_1 h`; `μ⁻²(μ∫F_1 h² + μ²∫F_2 h⊗h)`; empty configuration gives 0 | Sound | none |
| §10.3 (sampled) | `t = 0`; d = 1; wrong sign | `π(0) = 0`, empty integral; `σ_{±1}(v, w) = (w, v)`, `Q = 0`; `f⁰(π(1/2), 1) = 0.5 M(1)` against `1.5 M(1)` | Sound | none |
| §10.4 | hypotheses against BGSS2023 (1.1.5); weak clause | the Lipschitz bound gives `|∇_x f⁰| ≤ C₀ e^{−β₀|v|²/2}` almost everywhere, so (1.1.5) holds with `2C₀`; almost-everywhere convergence with `∫F_n(t) = ∫F_n(0) → 1 = ∫f(t)^{⊗n}` gives `L¹` convergence | Supported by BGSS2023 lines 316–321 | none |
| §10.5 (headlines) | second moment; d = 1; wrong `F_2`; ε = 0 | `0 + m² − 2m² + m² = 0`; `Z_ε → e`, `1 − e⁻¹ = 0.63212`; `F_2 → 2f⊗f` gives `m²`; Poisson: `μ^{−2} · μ∫f⁰h²` at `t = 0` only | Sound; Check 3 omits `t = 0` | R01 |

For the text no repair touched and outside the sample (§2.1, §3.1, §3.3–3.5, Layer 4, §5.1, §5.4, §6.2–6.3, §7.5, §8.1, §8.4, §9.2–9.3, §10.2) I relied on the round-10 rows, which carry computed values, and recomputed these spot values: `σ_ν((0, 0.9), (0.9, 0)) = ((0.9, 0.9), 0)`; `D = 9 − 8.36 = 0.64`, `τ = 2.2`, `R_q u = (0.28, 0.96)`; `C((2, 0), (−1, 0)) = (0, (1, 0))`; packing thresholds `2/3` and 1 on the circle; `E|w| = √(8/π)` in d = 3; `v' = (r/2)(1, 1)`, `w' = (r/2)(1, −1)` in the β = 0 Check. All agree.

Remarks that need no change:

- §10.5's route cites `ProbabilityTheory.meas_ge_le_variance_div_sq`, which is centred at the mean, for a second moment about `∫ f h`. The step closes with `E[π_t(h)] → ∫ f h` (the first hypothesis) and `Var ≤ E[(π_t(h) − ∫ f h)²]`.
- The README gives source locators as line numbers of the cached extractions beside equation and theorem numbers, as round 10 noted that other roadmaps on main do.
- §5.2 has four Checks and the plan three tests; the fourth Check is a remark on the proof.

### Seeded source sample

I opened the three readable texts at every locator of the fifteen sampled targets. The author flagged no locator as unverified.

| Target | Text opened and result |
|---|---|
| 1.2 | GST2013 lines 833–841: particles in `ℝᵈ`, the domain with strict inequality. Confirmed. |
| 1.4 | GST2013 line 873 (the two shells `[ε, ε + 2Rδ]`); BGSS2023 line 165 (the hard-core set is empty for large `N`). Confirmed. |
| 2.2 | GST2013 line 400 (the involution), lines 432–437 (unit Jacobians, (2.2.1)), line 674 and lines 1264–1268 (the kernel `(ω·w)_+`). Confirmed; the cross-section value is the roadmap's, as it says. |
| 3.2 | BGSS2023 lines 148–152: the boundary pieces with the sign of `(v_i − v_j)·(x_i − x_j)` and no other contact. Confirmed. |
| 5.3 | GST2013 (1.1.1), lines 211–215; BGSS2023 lines 184–187; GST2013 (4.1.1)–(4.1.2), lines 835–847, printed p. 27 (the page marker for printed p. 28 is at line 857). Confirmed. |
| 5.5 | GST2013 line 841 (open domain), lines 851–854 (pathological trajectories). Confirmed. |
| 6.1 | GST2013 Lemma 4.1.1, lines 864–874. Confirmed; the explicit constant is the roadmap's. |
| 7.2 | GST2013 line 883; DengHaniMa2024 line 186. Confirmed. |
| 7.3 | GST2013 lines 211–215, 835–847, (2.1.3) at lines 396–399; BGSS2023 lines 184–187. Confirmed. |
| 7.4 | GST2013 (4.3.5), lines 1138–1140; DengHaniMa2024 (1.5), lines 175–178. Confirmed; strong continuity is the roadmap's. |
| 8.3 | GST2013 (4.2.2), lines 929–932; (4.2.3), lines 934–937; line 938. Confirmed. |
| 9.1 | GST2013 (2.2.5), lines 489–492, with density 1 and `θ = 1/β`. Confirmed. |
| 9.6 | BGSS2023 (1.1.8), lines 211–217; DengHaniMa2024 (1.12), lines 246–252. Confirmed; the two-sided bound is the roadmap's. |
| 10.1 | BGSS2023 (1.2.4)–(1.2.5), lines 324–334; (1.2.6), lines 335–340; variance, lines 352–369. Confirmed. |
| 10.3 | BGSS2023 (1.2.1), lines 292–304; GST2013 (2.1.1), lines 380–384. Confirmed. |

Also read: GST2013 lines 45–112 (contents), 664–698, 826–900, 1206–1228; BGSS2023 lines 116–222 and 290–372 (including (1.1.5), Theorem 1 and Corollary 1.2.1); DengHaniMa2024 lines 173–190 and 244–254.

### Pinned declarations

Pins read from `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`, the plan's baseline. Opened this round, paths relative to each library:

- `TauCeti/Probability/Distributions/Gaussian/Density.lean:82` (`multivariateGaussianPDFReal m S x`, body `(2π)^{−card/2} · det S^{−1/2} · exp(−⟪x − m, S⁻¹(x − m)⟫/2)`), `:265` (`multivariateGaussian_eq_withDensity`, `S.PosDef`); `TauCeti/Analysis/Semigroups/Group/Basic.lean:74`; `TauCeti/Probability/Process/EmpiricalMeasure.lean:224` (a `ProbabilityMeasure`); `TauCeti/Dynamics/Flow/OfLipschitz.lean:59` (`LipschitzWith K v`, a `Flow ℝ E`).
- `Mathlib/MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean:308`; `Mathlib/Analysis/Normed/Group/Quotient.lean:168` (`norm_mk`, `infDist`), `:222` (the instance, `[IsClosed]`, additive form by `to_additive`); `Mathlib/Topology/Algebra/OpenSubgroup.lean:377` (`[T1Space]`); `Mathlib/MeasureTheory/Constructions/Polish/Basic.lean:119`, `:154`, `:649`; `Mathlib/Topology/MetricSpace/ProperSpace.lean:66`.
- `Mathlib/Algebra/Module/ZLattice/Basic.lean:352`; `Mathlib/Algebra/Module/ZLattice/Covolume.lean:85`; `Mathlib/MeasureTheory/Group/FundamentalDomain.lean:731`, `:754`, `:801`; `Mathlib/MeasureTheory/Measure/Haar/Quotient.lean:75`, `:222` (`[LocallyCompactSpace G]`); the additive names `measurePreserving_quotientAddGroup_mk_of_AddQuotientMeasureEqMeasurePreimage` and `addProjection_respects_measure` are used at `Mathlib/MeasureTheory/Integral/IntervalIntegral/Periodic.lean:94`, `:99`; `Mathlib/Analysis/Fourier/AddCircleMulti.lean:173`.
- `Mathlib/MeasureTheory/Function/Jacobian.lean:1096`, `:1184`; `Mathlib/Analysis/InnerProductSpace/Projection/FiniteDimensional.lean:59`; `Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean:172`, `:231` (`det f ≠ 0`), `:527` (`[Nontrivial E]`); `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:734`; `Mathlib/MeasureTheory/Constructions/HaarToSphere.lean:52`, `:88`.
- `Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:330`; `Mathlib/Probability/Distributions/Gaussian/Real.lean:47` (`v : ℝ≥0`); `Mathlib/Probability/Distributions/Gaussian/Multivariate.lean:166`; `Mathlib/Probability/Distributions/Poisson/Basic.lean:40` (`r : ℝ≥0`); `Mathlib/MeasureTheory/Constructions/Pi.lean:732`; `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:595`, `:611`; `Mathlib/MeasureTheory/Function/ContinuousMapDense.lean:142`; `Mathlib/MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean:1140`; `Mathlib/Probability/Moments/Variance.lean:398` (`[IsFiniteMeasure μ]`, `MemLp X 2 μ`); `Mathlib/Data/Nat/Factorial/Basic.lean:367`, `:424`; `Mathlib/MeasureTheory/MeasurableSpace/Constructions.lean:871`.

Every name opened exists with the hypotheses the contract states. The 17 names in `scratch/citations.md` are this roadmap's own `HardSphere.*` names, expected at the design stage.

### Duplication, ownership and overlap

`scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id, no id that only a revision defines and no second copy; the folder is not on main and is not one of the two board packages on other branches. Object searches over main and the open heads (`roadmaps grep`, index of 2026-11-15T18:22:21Z):

- "hard sphere", Boltzmann–Grad, BBGKY, Lanford, "collision operator": only ClassicalErgodicTheory (three lines: outside its scope, a consumer of its §3.5) and MathematicalBilliards (one downstream remark).
- "flat torus", "grand canonical", "specular", "elastic collision", Maxwellian: flat tori appear only as examples (GeometricTopology, DGFloer, QuasiregularMaps, SmoothBundlesConnections, RealSemisimpleLieGroups) and in MathematicalBilliards §10.3 and §10.5; no roadmap owns `E ⧸ L` with its quotient norm and Haar measure, a grand canonical measure, or the scattering map.

Cross-roadmap citations resolved this round:

- ClassicalErgodicTheory §3.5, at the head of its open pull request: heading "Flows defined almost everywhere"; a standard Borel space and a σ-finite measure; item 1 conull flows with the identity extension; item 3 disjoint unions, "invariant iff each component restriction is"; item 4 `(Φ t)_* ν = μ.withDensity (W ∘ Φ (-t))`. The contract at README lines 73–79 says the same. Its scope paragraph names the `N`-particle hard-sphere flow as outside it and as a consumer of §3.5; it cites nothing of this roadmap.
- MathematicalBilliards §10.3 (Check "area `4 · 1 = 4`" for `ℂ/(2ℤ + 2iℤ)`), §10.5 ("`Λ = 2ℤ + 2iℤ`: area `4`") and §12.3 (jointly measurable actions of `ℝ` on probability spaces, `Lp ℂ 2`), at its open head. ProbabilisticAndMetricNumberTheory §4.9a, on main (strong continuity for continuous actions). StandardDistributions Layer 5, ComplexTori (on main) and OneParameterSemigroups (completed, on main) are named only as owners. PointProcesses is named only as the owner of a deferred subject, never as a supplier.

This roadmap is the owner of the hard-sphere objects because no roadmap on main or open states them.

Overlap check: read ClassicalErgodicTheory, MathematicalBilliards, ProbabilisticAndMetricNumberTheory (cited sections and scope) and searched PointProcesses, RelativisticQuantumFieldTheory, HamiltonianSystems, OptimalTransport, RandomMatrices and StochasticCalculus for the objects above (third list empty); conull flows, their disjoint unions and the transport of densities: owner ClassicalErgodicTheory §3.5, cited here; the translation-surface structure of `ℂ/Λ`: owner MathematicalBilliards §10.5, not restated; Koopman strong continuity for finite measures or continuous actions: owners ClassicalErgodicTheory §0.2, MathematicalBilliards §12.3 and ProbabilisticAndMetricNumberTheory §4.9a, not shared for `N ≥ 2`; unlabelled point processes: owner PointProcesses, not restated; nothing else shared.

### Supplier order

```text
candidate: HardSphereDynamicsAndKineticLimits is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2241 edges, 0 problem(s)
```

No UPWARD or CYCLE line. ClassicalErgodicTheory is another author's open pull request that adds a new roadmap folder, which this roadmap may consume; it is not in `merge-order/ORDER.txt`, so the check does not see the edge. By reading, the direction is one way.

### Headline theorems

Named for the package stage: `HardSphere.IsTrajectory.eqOn` (§5.2), `HardSphere.volume_hardCoreSet_diff_goodSet` (§6.4), `HardSphere.flow_add` (§7.1), `HardSphere.measurePreserving_flow` (§7.2), `HardSphere.flow_reversal` (§7.3), `HardSphere.weak_liouville` (§8.2), `HardSphere.grandCanonical_flow_invariant` (§9.4), `HardSphere.lintegral_sum_distinct_eq_correlation` (§9.5), `HardSphere.boltzmannGrad_scaling` (§9.6), `HardSphere.tendsto_empirical_of_correlation` and `HardSphere.LanfordStatement.tendsto_empirical` (§10.5). Each names the roadmap's objects. The padding probe and the `#check` comparison have nothing to run on at this stage.

### Copyright, licences and scope

- **Wording.** Beside the locators of the fifteen sampled targets I compared six further passages with the source text: §5.5's sentence on pathological data with GST2013 lines 851–854; §10.4 with BGSS2023 lines 316–321; §10.5's first theorem with BGSS2023 lines 341–349; §6.3's route with GST2013 lines 875–898; §9.3's exchangeability statement with BGSS2023 lines 184–187; §9.2's sentence on the canonical formalism with BGSS2023 lines 158–160. No run of more than four words is shared (terms of art), and no sentence follows a source clause by clause.
- **Arrangement.** GST2013 has the largest share: 52 of the 128 occurrences of a source key in the README (BGSS2023 44, DengHaniMa2024 23). Its contents (lines 45–112): Chapters 1–3 the low density limit, the Boltzmann equation and main results; Chapter 4 the `N`-particle flow, the Liouville equation, its weak form and the hierarchies; Chapters 5–7 estimates and convergence. Layers 1–4 have no counterpart; Layers 5–7 expand its §4.1; the collision operator, in its Chapter 2, is in Layer 10; Layer 9 has no counterpart. No run of layers maps one to one onto a run of its chapters or sections. The order of Layers 7 to 10 is forced: §8.1 needs §7.2, §9.5 needs §8.1 and §8.4, §10.1 needs §9.5.
- **Reuse.** No table, figure, list of examples or numerical data is taken from a source.

Source independence: 21 passages compared with 3 sources, none shared; largest share GST2013, 52 of 128 locators; contents compared with GST2013: independent.

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

- Supplier: ClassicalErgodicTheory is another author's open pull request and is not in the merge order; the item numbers of its §3.5 are fixed only when it merges.
- Scope: `HardSphere.LanfordStatement` (README §10.4) is a proposition whose proof is left to a roadmap on the BBGKY hierarchy; searches for "BBGKY" and "Lanford" found no such roadmap on main or open.
- Licence: the three texts read are arXiv copies. Six cited works are recorded `uncertified` in `sources.toml` and were not read.
- Scope: BGSS2023 is Ann. of Math. 198 and GST2013 an EMS monograph; DengHaniMa2024 is cited in its arXiv version (v3), and I did not check whether it has appeared.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5d27186cbad7badaf7df664aedd95286d03913e9", "job": "REV-DESIGN-HardSphereDynamicsAndKineticLimits~11", "model": "fable", "worker": "chris-x30"} -->
