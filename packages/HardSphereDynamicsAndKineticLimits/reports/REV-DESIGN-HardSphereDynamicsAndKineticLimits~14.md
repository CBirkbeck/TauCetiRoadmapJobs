<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13780#issuecomment-6901414475 -->
Review (claude) of 9cebb8e

Verdict: needs_changes

**For the human reviewers:** this review raises 5 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §8.2's `*Needs:*` line omits the nullness of `𝒟̄ ∖ G` that its route uses

   **Location.** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:635`: "*Needs:* §1.2, §3.3–3.5, §7.1, §8.1, Mathlib `intervalIntegral.integral_eq_sub_of_hasDerivAt_of_le`." and `design/plan.json`, target `8.2`, `prerequisites`.

   **Claim.** The line lists what the statement and its route need, item by item.

   **Witness.** The route (line 621) proves `∫_0^∞ Lφ(t, T_t Z) dt = −φ(0, Z)` "for `Z ∈ G`" and then integrates against `W⁰`, which vanishes only off `𝒟̄`. On `𝒟̄ ∖ G` the flow is the identity and the pointwise identity fails, so the step needs `λ_N(𝒟̄ ∖ G) = 0`, which is §6.4. None of the listed sections states it (§7.1 defines the flow, §8.1 the transported density).

   **Exact repair.** Add "§6.4" to the `*Needs:*` line of §8.2 (after §3.3–3.5) and `target:6.4` to the prerequisites of target 8.2 in `design/plan.json`. Tested on the instance: at the grazing state of §7.1 (`x_1 = (2, 1)`, `x_2 = 0`, `v_1 = (−1, 0)`, `v_2 = 0`, not in `G`), with `φ = χ(t) θ(H(V)) ψ(⟨x_1 − x_2, e_1⟩)` of the third Check, `T_t Z = Z` gives `∫_0^∞ Lφ(t, Z) dt = θ(H) (2 (χ(∞) − χ(0)) − ∫_0^∞ χ) = −2χ(0) − ∫_0^∞ χ`, which is not `−φ(0, Z) = −2χ(0)` unless `∫_0^∞ χ = 0`; only the nullness of such states removes them. The build order is unchanged (§7.1 already needs §6.4). §7.4, whose route uses the same nullness, lists §7.2, whose statement contains it; §7.3 lists §6.4 itself. No other target has this omission.

2. **F02** (P3) two sentences of the supplier contracts narrate the author's reading

   **Location.** `design/README.md:37` and `:66`: "Every declaration below was read at the pinned Mathlib." and "Every declaration below was read at the pinned Tau Ceti."

   **Claim.** The README is timeless: it states what is consumed, not what was done while writing it.

   **Witness.** Both sentences report an act of the author ("was read"). No roadmap on main carries such a sentence in its contracts (a search of the README files under `TauCetiRoadmap/` for "was read at the pinned" finds none).

   **Exact repair.** Replace them by "The declarations below are cited as they stand at the pinned Mathlib." and "The declarations below are cited as they stand at the pinned Tau Ceti." The statement of fact is kept: I opened every declaration of both contracts at the pins (list below) and each exists as described.

Two findings, both P3; none is P1 or P2. Each has an exact repair, and a repair, whatever its priority, asks for changes, so the verdict is needs changes: a fix round applies R01 and R02. No supplier gap is declared and none is needed. I edited neither the README, the plan nor the sources manifest, and fetched no source (every sampled locator lies in the three cached texts). No maintainer notes were supplied. This is the design lane: there is no `Suggested.lean`, and Lean elaboration is not available (this lane does not elaborate; say so in the report). No Lean command was run.

## Previous findings, checked first

The preceding review is `REV-DESIGN-HardSphereDynamicsAndKineticLimits~13` (F01–F03, all P3); its repair report is `packages/HardSphereDynamicsAndKineticLimits/reports/FIX-DESIGN-HardSphereDynamicsAndKineticLimits~14.md`. Nothing was marked `not actionable in this package`; nothing is re-raised.

| Round-13 finding | Status | Repaired passage and my check |
|---|---|---|
| F01, §4.3's route named the wrong differential | Repaired | Line 345: "the combination `dY + τ dU'` of the two differentials, with τ held at its value at the point, is `R_q w`: since `Y + τ U' = q` and differentiating `|q|² = ε²` gives `dτ = −⟨q, w⟩/⟨q, u⟩`…". Recomputed: `dq = w + u dτ`; `dY + τ dU' = dq − U' dτ = w + (u − R_q u) dτ`; `u − R_q u = 2⟨u, q⟩q/ε²`; so `w − 2⟨q, w⟩q/ε² = R_q w`. At the witness (ε = 1, `q = (1, 0)`, `⟨q, u⟩ = −1`): `dτ = w_1`, result `(−w_1, w_2)`. |
| F02, no plan test for the fourth Check of §5.2 | Repaired | `design/plan.json`, target 5.2, test `grazing_admitted`. The mechanical comparison now gives equal Check and test counts for all 45 targets (173 tests). Witness recomputed: `a = (1, 3)`, `u = (0, −1)`, `D = 9 − (10 − 1) = 0`, `|a + s u|² = 1 + (3 − s)² ≥ 1`. |
| F03, §7.2's `*Needs:*` omitted `MeasureTheory.MeasurePreserving` | Repaired | Line 556 ends "…ClassicalErgodicTheory §3.5 (item 1), Mathlib `MeasureTheory.MeasurePreserving`." and the Layer 7 `### Dependencies` line (602) names it. Pin: `Mathlib/Dynamics/Ergodic/MeasurePreserving.lean:44`. |

The repaired patterns in the rest of the design: a route that differentiates a composite (only §4.3); a Check without a plan test (none: counts agree everywhere); a `*Needs:*` line against the plan (all 45 agree, compared mechanically in both directions) and against the route of its section (one omission, R01).

## Verified sound

### Coverage and principles

I read all 874 README lines, the plan (10 layers, 45 targets, 173 tests, at least 3 per target; `gaps` empty) and the 9 manifest entries.

- No route-specific shortcut: `d ≥ 1`, every flat position space, `0 < ε < ρ`; `d ≥ 2` appears only in §10.4 and the corollary of §10.5, with the d = 1 counterexample as a Check. No re-planned roadmap, no upward or cyclic supply, no algorithm, no layer named after a source's chapter, no sentence saying the roadmap follows a source.
- A scan for LaTeX delimiters, pull-request numbers, machine paths, `set_option`, "optional", "deferred", "for later", "so far", "checkpoint", "handoff", HTML anchors and round labels found nothing; `lemma` occurs only as the source's "Lemma 4.1.1".
- The ten `### Dependencies` lines agree with the `*Needs:*` lines of their layers (checked layer by layer: Layer 4 "Layers 1–3" against §4.5's §1.1 and §3.4; Layer 6 "Layers 1 and 3–5"; Layer 8 "Layers 1, 3 and 7"; Layer 9 "Layers 1–3 and 7–8"; Layer 10 "Layers 1–2, 7 and 9").
- The manifest's `cited_for` lists equal the sections that cite each key (compared mechanically for all 9 keys: no difference in either direction).
- Remarks that need no change. §4.2's semigroup law and reversal identity hold also on the excluded incoming contact states (`B_r B_0 = B_r` there), so the exclusions are harmless. §6.3 takes a bounded `K` while §6.1 takes a measurable one; §6.1 is applied only to the closed neighbourhoods `K_j`. §10.4 asks for a continuous datum with a Lipschitz bound, the intersection of the hypotheses of GST2013 Theorem 4 and BGSS2023 (1.1.5), which it gives with `2C₀`; its weak clause is not in BGSS2023 Theorem 1 verbatim and follows from the almost-everywhere clause by Scheffé's lemma, since `F_n ≥ 0` and `∫ F^ε_n(t) = ∫ F^ε_n(0) → 1 = ∫ f(t)^{⊗n}`.

### Adversarial table

`E` is Euclidean space; the head-on witness is ε = 1, `x_1 = (2, 0)`, `x_2 = 0`, `v_1 = (−1, 0)`, `v_2 = 0`. Every value was computed this round. Rows cover the fifteen sampled targets, the headline theorems and the targets the findings touch; I also recomputed the Checks of §1.1, §1.2, §2.2, §3.1, §3.2, §4.1–4.5, §5.1, §5.4, §5.5, §6.2, §7.4, §7.5, §8.4, §9.2, §9.3 and §10.3 and found them correct.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.3 flat tori (sampled) | injectivity radius; `2ℤ × ℤ`; non-example ball; normalised measure | `a, b ∈ B(0, ρ)`, `a − b ∈ L` gives `|a − b| < 2ρ` = shortest vector, so `a = b`; with `ρ' > λ₁/2` the points `(½ + η)v`, `(−½ + η)v` collide; covolume 2, ρ = ½; `ω_d/2^d`: 1 (d = 1), `π/4`, `0.5236`; `π/16` against `π/32` | Sound | none |
| §1.4 shells and packings (sampled) | d = 1, `r₁ = 0`; `N = 0, 1`; ε > 2ρ; unit torus | `2r₂`; `r₂^d − r₁^d ≤ d r₂^{d−1}(r₂ − r₁)`; `0 ≤ μ`, one ball inside `X`; circle, ε = 1.5: bound `1/(2 · 0.75) = ⅔ < 1` fails for `N = 1`, excluded by `ε ≤ 2ρ`; `0.04π = 0.12566`, `1/0.12566 = 7.96`; shell 0.2 against 0.4 | Sound | none |
| §2.1 scattering (sampled) | involution; reflection; swap; witness; head-on | `⟨v' − w', ν⟩ = −⟨v − w, ν⟩`; `(v, w) − 2⟨(v, w), (ν, −ν)⟩/2 · (ν, −ν)` equals `σ_ν`; `σ_ν(w, v)` is the swap; `((0.9, 0.9), 0)`, energy 1.62 both sides; `(−1, 0), (1, 0)`; separate reflection: momentum `(1, 0) → (−1, 0)` | Sound; GST2013 (4.1.2) has the same sign | none |
| §3.3 contact scattering, reversal (sampled) | `ℛ²`; outgoing state; non-matching contacts | `−σ_M(−σ_M V) = V`; `σ_M((1, 0), 0) = (0, (1, 0))`, `ℛ` gives `(0, (−1, 0))` with `⟨v_1 − v_2, ν⟩ = 1 > 0`; identity there, `ℛ = −V`, still an involution | Sound | none |
| §3.4 free transport (sampled) | torus; boost; Lipschitz field | `π(e_1) = π(0)`; `S_t B_c = (X + π(tV) + π(tc), V + c) = A_{π(tc)} B_c S_t`; d = 1: `(1, 1)` against `(0, 1)`; `(V, 0)` is 1-Lipschitz; distance 0.5 at `t = 1.5` | Sound | none |
| §4.3 (repair) | witness; d = 1 | `dY + τ dU' = (−w_1, w_2) = R_q w`; d = 1: `C = (2ε − a, −u)`, `−da − τ du = −w`; `det = (−1)(−1)(−3 + 4) = 1` | Sound | none |
| §5.2 `IsTrajectory.eqOn` (headline) | forward at the supremum of agreement; backward at the infimum | positions agree by continuity, `V(t*) = σ_M V(t*−)` agree, then constant on `(t*, t* + η)` by right continuity and finiteness of `𝒯`; backward `V(t*−) = σ_M V(t*)` | Sound | none |
| §5.3 symmetries (sampled) | reversal against each clause of §5.1; ends of `J`; boost | `Ṽ(t) = −V((−t)−)`, right-continuous; at the greatest element `−t₀` of `−J`: `σ_M Ṽ((−t₀)−) = σ_M(−V(t₀)) = Ṽ(−t₀)`; outgoing → incoming → outgoing; witness: `(1, 0), (−2, 0); 0, (1, 0)` at time −3, back to `(2, 0), 0; (1, 0), 0`; boost: velocities `0`, `(1, 0)`, contact still at time 1 | Sound | none |
| §6.1 near triples (sampled) | count; `N = 2`; `μ_X(K) = 0, ∞` | `μ(K)` for `x_i`, two shells `ω_d((ε + η)^d − ε^d)` (needs `ε + η < ρ`), `μ(K)^{N−3}`, at most `N³` triples; `I = ∅`; `0`, `∞` consistent; `π(2η + η²)` | Sound; own form of GST2013 Lemma 4.1.1 (no `δ < ε/2`) | none |
| §6.3 iteration (sampled) | constants; `N = 2`; `N = 3` | `(ε + 2Rδ)^d − ε^d ≤ 2Rd(ε + 2R)^{d−1}δ` for `δ ≤ 1`; `⌈t/δ⌉ ≤ (t + 1)/δ`; `(2, 1)`: `D = 4 − 4 = 0`, `√5 ≤ 3` near, grazes at 2 > δ, then at 1 ≤ δ; `8 (12π)² (π²/2) = 576π⁴ = 56108`; `K_1 = [−2, 2]`, gaps 1.1 ≤ 5 | Sound | none |
| §6.4 Alexander (sampled, headline) | passing all steps; Borel description; negative times | steps `j < t/δ` cover `[0, ⌈t/δ⌉δ] ⊇ [0, t]`; measure `≤ Cδ` for all small δ; on a trajectory the second-nearest distance is continuous and `> ε` on `[0, t]`, so some `m, R` pass; `ℛℛZ = Z` glues at 0 | Sound | none |
| §7.1–7.3 (headlines) | `T_3`; grazing state; reversal off `G`; rotation | `((1, 0), (−2, 0); 0, (−1, 0))`; `T_1 Z = Z` against `(1, 1)`; `ℛ` preserves `G` and its complement, both sides `ℛZ` there; `ℛT_3 Z = ((1, 0), (−2, 0); 0, (1, 0))`; `a = (2, 0)`, `u = (0, −1)`: `⟨a, u⟩ = 0`, no contact | Sound | none |
| §8.1 transported densities (sampled) | group law; duality; sign | `W⁰ ∘ T_{−s} ∘ T_{−t}`; `∫ (W⁰ ∘ T_{−t}) φ = ∫ W⁰ (φ ∘ T_t)` by measure preservation; `T_{−1}((1, 0), (1, 0)) = (0, (1, 0))`; ClassicalErgodicTheory §3.5 item 4 has the same sign `W ∘ Φ(−t)` | Sound | none |
| §8.2 weak Liouville (sampled, headline) | sign; left limit; box; a state off `G` | `∫∫ W(t) Lφ = ∫ W⁰ ∫_0^∞ Lφ(t, T_t Z) dt = −∫ W⁰ φ(0)`; left limit `φ(t_k, X, σ_M V) = φ(t_k, X, V)`; τ ∈ `(0.99/1.04, 1.01/0.96) = (0.9519, 1.0521)`, `H ∈ (0.4802, 0.5204)`, jump term `θχ(τ)(v_1 − v_1')`, defect `−1`; grazing state: `−2χ(0) − ∫χ ≠ −2χ(0)` | Statement sound; `*Needs:*` | R01 |
| §8.3 marginals (sampled) | torus `N = 2`; specular inheritance; cut-off density | `g(z_1)(1 − ω_d ε^d) ∫ g̃`; extra contacts of the integrated particles are null (spheres, `ε < ρ`), so the matching of `Z_N` is that of `Z_s` almost everywhere; `e^{−1.62} = 0.19790` against 0, `|(0.9, 0.9)| = 1.2728` | Sound | none |
| §9.1 Maxwellians (sampled) | Tau Ceti density; product identity; integral | `S = β⁻¹·1`: `(det S)^{−1/2} = β^{d/2}`, equal to `(β/2π)^{d/2}`; `|v' − u|² + |w' − u|²` conserved; `(π/(β/2))^{d/2}`, `(2π)^{3/2} = 15.7496`; `1/√(2π) = 0.39894` | Sound; source's `M_{ρ,u,θ}` at ρ = 1, θ = 1/β | none |
| §9.4, §9.5 (headlines) | density as a function of `H, P`; distinct-label identity; inversion; Poisson | `Σ|v_i − u|² = 2H − 2⟨u, P⟩ + N|u|²`; `Σ_N (1/N!)(N!/(N − n)!) ∫ W^{(n)}_N h = μ^n ∫ F_n h`; `Σ_{p+q=m} (−1)^p/(p! q!) = 0` for `m ≥ 1`; `Σ (μC₀K)^{p+q}/(p! q!) = e^{2μC₀K}`; `4 · ¼ = 1` against `λ + λ² = 2`; `0.8 √(2π) = 2.0053 ≤ 2.5066` | Sound | none |
| §9.6 `boltzmannGrad_scaling` (headline) | factorisation; bound; scaling | `F_n(0) = (f⁰)^{⊗n} 1_{𝒟̄_n} Z⁻¹ Σ_p (μ^p/p!) ∫ Π f⁰ 1[admissible]`; `1 − p_ε ≤ nμω_d ε^d ‖ρ⁰‖_∞`; `μ_ε ε^d = ε`; `4.18879 · 0.01 = 0.0419` | Sound | none |
| §10.1 empirical measure (sampled) | mean; second moment; `N = 0` | `μ⁻¹ · μ ∫ F_1 h`; `μ⁻² (μ ∫ F_1 h² + μ² ∫ F_2 h ⊗ h)`; zero measure | Sound | none |
| §10.2 collision operator (sampled) | kernel under Θ and swap; weak form; loss; β = 0 | `(w' − v')·(−ω) = (w − v)·ω`; swap gives ½, Θ changes the sign of the bracket, giving ¼ with `ψ + ψ_* − ψ' − ψ'_*`, as GST2013 (2.2.1); `π √(8/π)`; `v' = (r/2)(1, 1)`, `w' = (r/2)(1, −1)`, speed and kernel `r/√2` | Sound | none |
| §10.4 `LanfordStatement` | clauses against BGSS2023 Theorem 1; `t = 0`; structures | compact-uniform clause and almost-everywhere clause are lines 318–321; weak clause by Scheffé; `|F_1(0) − f⁰| ≤ ω_d ε ‖ρ⁰‖_∞ f⁰`; a structure is `π ∘ B`, `|Ba| ≤ |a|` near 0, `|det B| = 1`, so `B` orthogonal, `ρ' ≤ ½`; conjugation by `(X, V) ↦ (X, BV)` maps the datum to `f⁰(x, B⁻¹v)`, same bounds | Supported | none |
| §10.5 (headlines) | second moment; d = 1; wrong `F_2` | `0 + m² − 2m² + m² = 0`; `Z_ε → e`, `1 − e⁻¹ = 0.63212`; `2m² − 2m² + m² = m²` | Sound | none |

### Seeded source sample

The author flagged no locator as unverified. I opened the three readable texts at every locator of the fifteen sampled targets.

| Target | Text opened and result |
|---|---|
| 1.3 | BGSS2023 lines 119–142: the torus `𝕋^d`, `d ≥ 2`, the phase space. Confirmed as the setting; the construction is the roadmap's. |
| 1.4 | GST2013 line 873 (the two shells `[ε, ε + 2Rδ]`); BGSS2023 line 165 (the hard-core set is empty for large `N`). Confirmed. |
| 2.1 | GST2013 lines 843–847 ((4.1.2)) and 1222–1227 ((4.4.1)); BGSS2023 lines 125–131 ((1.1.2)); DengHaniMa2024 lines 157–163 ((1.2)). Same sign in all three. Confirmed. |
| 3.3 | GST2013 lines 1219–1227. Confirmed. |
| 3.4 | GST2013 lines 836–837; BGSS2023 lines 122–123. Confirmed. |
| 5.3 | GST2013 (1.1.1), lines 211–215; BGSS2023 lines 184–187; GST2013 (4.1.1)–(4.1.2), lines 835–847, before the marker of the page printed 28, so printed p. 27. Confirmed. |
| 6.1 | GST2013 Lemma 4.1.1, lines 864–874. Confirmed; the explicit constant and the absence of `δ < ε/2` are the roadmap's. |
| 6.3 | GST2013 lines 875–898; `t/δ` an integer at line 876; the factor `(1 + jδ)^{d(N−2)}` at line 896. Confirmed. |
| 6.4 | GST2013 Proposition 4.1.1, lines 862–863, proof 875–910; line 855 cites reference [2], Proposition 4.3; bibliography lines 5439–5440; BGSS2023 lines 132–139; DengHaniMa2024 lines 182–188. Confirmed. |
| 8.1 | BGSS2023 (1.1.3)–(1.1.4), lines 145–157; GST2013 (4.3.5), lines 1138–1140; DengHaniMa2024 (1.9)–(1.10), lines 224–234. Confirmed. |
| 8.2 | GST2013 (4.2.1), lines 911–918, and (4.3.1), lines 941–958; BGSS2023 lines 145–157. Confirmed. |
| 8.3 | GST2013 (4.2.2), lines 929–932; (4.2.3), lines 934–937; line 938. Confirmed. |
| 9.1 | GST2013 (2.2.5), lines 489–492. Confirmed. |
| 10.1 | BGSS2023 (1.2.4)–(1.2.5), lines 324–334; (1.2.6), lines 335–340; (1.2.7), lines 352–369. Confirmed. |
| 10.2 | BGSS2023 (1.2.1)–(1.2.3), lines 292–312; GST2013 (2.1.2), lines 385–393, and (2.2.1), lines 432–437; DengHaniMa2024 (1.13)–(1.14), lines 258–282. Confirmed. |

Also read for the headlines: GST2013 lines 42–118 (contents), 376–440, 660–700, 1204–1230, 1260–1269, 2064–2084; BGSS2023 lines 114–372, 476–484, 3536–3540; DengHaniMa2024 lines 134–296.

### Pinned declarations

Pins of `lake-manifest.json`, equal to the plan's baseline: Mathlib `1b1ccf4b088b`, Tau Ceti `2fd255d997f4`. Opened at the pin, paths relative to each library:

- Tau Ceti: `TauCeti/Probability/Distributions/Gaussian/Density.lean:82` (`(2π)^{−n/2} · det S^{−1/2} · exp(−⟨x − m, S⁻¹(x − m)⟩/2)`), `:265` (`hS : S.PosDef`); `TauCeti/Analysis/Semigroups/Group/Basic.lean:74` (fields `map_zero'`, `map_add'` for all real `s, t`, `continuousAt_zero'`); `TauCeti/Probability/Process/EmpiricalMeasure.lean:224` (a `ProbabilityMeasure`); `TauCeti/Dynamics/Flow/OfLipschitz.lean:59` (`LipschitzWith K v`, a `Flow ℝ E`).
- Mathlib: `MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean:308`; `Analysis/Normed/Group/Quotient.lean:168`, `:222` (`[IsClosed (S : Set M)]`, additive by `to_additive`); `Topology/Algebra/OpenSubgroup.lean:377` (`[T1Space G]`, `[DiscreteTopology U]`); `MeasureTheory/Constructions/Polish/Basic.lean:119`, `:148`, `:154`, `:649` (`[N.Normal]`, `[IsClosed]`); `Topology/MetricSpace/ProperSpace.lean:66`; `Algebra/Module/ZLattice/Basic.lean:93`, `:434`, `:645`; `Algebra/Module/ZLattice/Covolume.lean:73`, `:85`; `MeasureTheory/Group/FundamentalDomain.lean:731`, `:754` (`to_additive addProjection_respects_measure`), `:801`; `MeasureTheory/Measure/Haar/Quotient.lean:75` (stated for `Γ.op`), `:222` (`[LocallyCompactSpace G]`, `[IsFiniteMeasure μ]`); the additive name `measurePreserving_quotientAddGroup_mk_of_AddQuotientMeasureEqMeasurePreimage` is used at `MeasureTheory/Integral/IntervalIntegral/Periodic.lean:94`; `Topology/Instances/AddCircle/Real.lean:55`; `Analysis/Fourier/AddCircleMulti.lean:173`; `MeasureTheory/Function/Jacobian.lean:1096`, `:1184`; `Analysis/InnerProductSpace/Projection/Reflection.lean:52`, `Projection/FiniteDimensional.lean:59`; `MeasureTheory/Measure/Lebesgue/EqHaar.lean:172`, `:231` (`LinearMap.det f ≠ 0`), `:527` (`[Nontrivial E]`); `LinearAlgebra/Matrix/Determinant/Basic.lean:734`; `MeasureTheory/Constructions/HaarToSphere.lean:52`, `:88`; `Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:330` (`0 < b`, value `(π/b)^{finrank/2}`); `Probability/Distributions/Gaussian/Real.lean:47`; `Probability/Distributions/Gaussian/Multivariate.lean:166`; `Probability/Distributions/Poisson/Basic.lean:40`; `MeasureTheory/Constructions/Pi.lean:732`; `MeasureTheory/Function/LpSpace/Basic.lean:595`, `:611`; `MeasureTheory/Function/ContinuousMapDense.lean:142` (`[R1Space α]`, `[WeaklyLocallyCompactSpace α]`, `[μ.Regular]`, `p ≠ ∞`); `MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean:1140`; `Probability/Moments/Variance.lean:398` (`[IsFiniteMeasure μ]`); `Data/Nat/Factorial/Basic.lean:332`, `:367`, `:424` (`k ≤ n`); `MeasureTheory/MeasurableSpace/Constructions.lean:871`; `MeasureTheory/Measure/Sum.lean:30`; `Dynamics/Flow.lean:85`; `Dynamics/Ergodic/MeasurePreserving.lean:44`.

The 17 names in `scratch/citations.md` are this roadmap's own `HardSphere.*` names, expected at the design stage; the 24 backticked own names of the README are exactly the class, the 12 definitions and the 11 theorems that line 85 lists for `Suggested.lean`.

### Duplication, ownership and overlap

`scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id, no id that only a revision defines and no second copy. Main (`985be45`) has no folder `TauCetiRoadmap/HardSphereDynamicsAndKineticLimits`, and the two board packages on other branches (AnalyticNumberTheory, LawrenceVenkateshMethod) are other subjects. Object searches over main and the open heads (`roadmaps grep`, index of 2026-11-15T20:52:29Z):

- "hard sphere", "Boltzmann", "BBGKY", "Lanford", "Maxwellian", "grand canonical", `FlatTorus`, `FlatPositionSpace`: the only hits on the subject are ClassicalErgodicTheory (lines 72, 1160, 2440: the hard-sphere flow is outside its scope and a consumer of its §3.5) and MathematicalBilliards (line 971, a downstream remark). "Boltzmann" otherwise matches the Boltzmann entropy of OptimalTransport, the Maxwell–Boltzmann law of StandardDistributions and a Potts sum: different objects.
- "flat tor", `AddQuotientMeasureEqMeasurePreimage`, "quotient norm": IncompressibleFlows and Equidistribution work on Mathlib's `UnitAddTorus d` (supremum norm, normalised Haar measure), the carrier §1.3 distinguishes itself from; no roadmap states the lattice quotient with its Euclidean quotient norm and its Haar measure of mass the covolume. LatticePackingsAndPerfectForms treats lattice packing density and covering radius, not the packing bound of §1.4 on a position space.

Cross-roadmap citations resolved this round:

- ClassicalErgodicTheory, at the head of its open pull request: §3.5 "Flows defined almost everywhere" (a standard Borel space with a σ-finite measure); item 1 ("measure-preserving maps of `(X, μ)` satisfying the group law everywhere"), item 3 ("invariant iff each component restriction is"), item 4 (`(Φ t)_* ν = μ.withDensity (W ∘ Φ (-t))`); its conventions define a measurable flow as "a jointly measurable `AddAction ℝ X`", as the contract says; its §0.2 assumes "`μ` is a finite invariant measure and `1 ≤ p < ∞`".
- MathematicalBilliards, at its open head: §10.3 ("area `4 · 1 = 4`, the covolume of `2ℤ + 2iℤ`"), §10.5 (`ℂ/Λ` as a translation surface), §12.3 (a jointly measurable action of `ℝ` on a probability space, `Lp ℂ 2 μ`).
- On main: ProbabilisticAndMetricNumberTheory §4.9a (`TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md:6319`, `scalarLpKoopman_strong` at `:6363`: "acting continuously on an R₁ space", locally finite, `p ≠ ∞`); RandomMatrices §8.1 (`:1133`–`1146`, the factorial-moment identity for pairwise disjoint sets); StandardDistributions Layer 5 (`:547`); ComplexTori; `Completed/OneParameterSemigroups`.

This roadmap is the owner of the hard-sphere objects and of `FlatTorus` because no roadmap on main or open states them.

Overlap check: read ClassicalErgodicTheory, MathematicalBilliards, PointProcesses, RandomMatrices and ProbabilisticAndMetricNumberTheory (scope and the cited sections) and searched RelativisticQuantumFieldTheory, HamiltonianSystems and OptimalTransport for the objects above (third list empty); conull flows, their disjoint unions and the transport of densities: owner ClassicalErgodicTheory §3.5, cited here; the translation-surface structure of `ℂ/Λ`: owner MathematicalBilliards §10.5, not restated; Koopman strong continuity for finite measures or continuous actions: owners ClassicalErgodicTheory §0.2, MathematicalBilliards §12.3 and ProbabilisticAndMetricNumberTheory §4.9a, not shared for the infinite measure `λ_N|𝒟̄` and the discontinuous flow; correlation functions of eigenvalue counts: owner RandomMatrices §8.1, a different carrier, named in the scope; unlabelled point processes, their factorial moment and Janossy measures: owner PointProcesses, not restated and not cited as a supplier; nothing else shared.

### Supplier order

```text
candidate: HardSphereDynamicsAndKineticLimits is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 241 roadmaps, 2243 edges, 0 problem(s)
```

No UPWARD or CYCLE line. ClassicalErgodicTheory is another author's open pull request that adds a new roadmap folder, which this roadmap may consume; it is not in `merge-order/ORDER.txt`, so the check does not see the edge. By reading, the direction is one way: its §3.5 needs its own §§0.1, 3.1, 3.3 and MathematicalBilliards §§8.2–8.3, and nothing of this roadmap. No roadmap of the never-cite list is cited as a supplier (PointProcesses is named only as the owner of a neighbouring subject). Every `*Needs:*` line was read: no target needs a later one.

### Shape and headline theorems

Every numbered section has its hypotheses in the sentence, a locator or the words "derived here", and at least three Checks (3 to 7); every definition has an API list or states its properties in the defining paragraph; every layer ends with `### Examples` and `### Dependencies`. The organisation is the roadmap's own (comparison below).

Headlines named for the package stage: `HardSphere.IsTrajectory.eqOn` (§5.2), `HardSphere.volume_hardCoreSet_diff_goodSet` (§6.4), `HardSphere.flow_add` (§7.1), `HardSphere.measurePreserving_flow` (§7.2), `HardSphere.flow_reversal` (§7.3), `HardSphere.weak_liouville` (§8.2), `HardSphere.grandCanonical_flow_invariant` (§9.4), `HardSphere.lintegral_sum_distinct_eq_correlation` (§9.5), `HardSphere.boltzmannGrad_scaling` (§9.6), `HardSphere.tendsto_empirical_of_correlation` and `HardSphere.LanfordStatement.tendsto_empirical` (§10.5). Each names the roadmap's objects. The padding probe and the `#check` comparison have nothing to run on at this stage.

### Copyright, licences and scope

- **Wording.** Beside the locators of the sampled targets I compared ten further passages with the source text: §5.5's description of pathological data with GST2013 lines 851–854; §6.1 with GST2013 lines 867–874; §8.3's inheritance of the specular condition with GST2013 lines 933–938; §2.2's involution and Jacobians with GST2013 lines 394–400 and 432–433; §10.2's gain and loss split with GST2013 lines 401–405; §10.4 with BGSS2023 lines 316–321; §10.5's route with BGSS2023 lines 352–371; §9.3's sentence on exchangeability with BGSS2023 lines 184–187; §7.5 with BGSS2023 lines 158–166; the right-continuity convention with DengHaniMa2024 lines 164–166. No run of more than four consecutive words is shared (terms of art: "gain and loss terms", "on compact sets"), and no sentence follows a source clause by clause.
- **Arrangement.** GST2013 has the largest share: 52 of the 129 occurrences of a source key in the README (BGSS2023 44, DengHaniMa2024 24, the six others 9). Its contents (lines 42–118): Chapters 1–3 the low density limit, the Boltzmann equation and the main results; Chapter 4 the `N`-particle flow, the Liouville equation, its weak form and the hierarchies; Chapters 5–7 estimates and convergence; Part III potentials; Part IV term-by-term convergence. Layers 1–4 and 9 have no counterpart; Layers 5–7 expand its §4.1; Layer 8 covers its §§4.2–4.3 without the hierarchies; the collision operator, in its Chapter 2, is in Layer 10. No run of layers maps one to one onto a run of its chapters or sections. The order of Layers 7 to 10 is forced: §8.1 needs §7.2, §9.5 needs §8.1 and §8.4, §10.1 needs §9.5.
- **Reuse.** No table, figure, list of examples or numerical data is taken from a source.

Source independence: 25 passages compared with 3 sources, none shared; largest share GST2013, 52 of 129 locators; contents compared with GST2013: independent.

## Not verifiable

- Alexander1976 Proposition 4.3 and AlexanderThesis1975 Chapter 1: settled uncertified; only the attribution in GST2013 (line 855, bibliography lines 5437–5440) was read.
- Lanford1975, CIP1994, Spohn1991, Uchiyama1988: settled uncertified; not read, not requested again.
- Lean elaboration, the one-tactic padding probe and the `#check` comparison: not available (this lane does not elaborate), and there is no `Suggested.lean`. Library names were checked by reading the pinned sources, not by elaboration.
- The truth of `HardSphere.LanfordStatement` beyond its agreement with BGSS2023 Theorem 1, its `t = 0` case and its equilibrium case: the proof belongs to a later roadmap.
- The dependency check's verdict on the ClassicalErgodicTheory edge: the tool does not see it; the direction was checked by reading.
- Ownership against the open pull requests was checked through `roadmaps grep` and `roadmaps show` at the indexed heads; the two board packages on other branches were not opened.

## Source issues

- **Misprint** in GST2013 at (4.4.1), printed p. 33: the source says the starred velocities are the pre-image of the pair under (4.1.1), the free flow; it should be under the reflection law (4.1.2); affects nothing.
- **Gap** in GST2013 at Proposition 4.1.1, proof, printed p. 28: the source uses invariance of Lebesgue measure under the partially built flow without proving it for a collision step; it should first establish the unit Jacobian of the two-body step; affects the proof.
- **Error** in DengHaniMa2024 at Proposition 1.2(3), printed p. 4: the source says the flow maps are diffeomorphisms off one closed null set; it should say measure-preserving bijections, since each time-`t` map jumps across the data colliding exactly at `t`; affects a stated result.
- **Gap** in BGSS2023 at Corollary 1.2.1, proof, printed p. 5: the source passes from almost-everywhere convergence of the first two correlation functions to convergence of their integrals with no domination; it should invoke the uniform Gaussian bounds or conservation of mass; affects the proof.

## For the human reviewers

- Supplier: ClassicalErgodicTheory is another author's open pull request and is not in the merge order; the item numbers of its §3.5, cited in README §7.2, §7.5, §8.1 and §9.4, are fixed only when it merges.
- Scope: `HardSphere.LanfordStatement` (README §10.4) is a proposition whose proof is left to a roadmap on the BBGKY hierarchy; searches for "BBGKY" and "Lanford" found no such roadmap on main or open.
- Scope: PointProcesses (open, on the never-cite list) defines correlation functions as densities of factorial moment measures; README §9.5 keeps its own definition on labelled configurations (scope paragraph, line 11).
- Licence: the three texts read are arXiv copies. Six cited works are recorded `uncertified` in `sources.toml` and were not read.
- Scope: BGSS2023 is Ann. of Math. 198 and GST2013 an EMS monograph; DengHaniMa2024 is cited in its arXiv version (v3), and I did not check whether it has appeared.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "9cebb8e7ed2ac65441a4df9712103b703bcd4acb", "job": "REV-DESIGN-HardSphereDynamicsAndKineticLimits~14", "model": "fable", "worker": "chris-x88"} -->
