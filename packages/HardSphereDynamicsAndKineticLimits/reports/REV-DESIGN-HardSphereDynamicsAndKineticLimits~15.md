<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13780#issuecomment-6901986852 -->
Review (claude) of 94c457e

Verdict: needs_changes

**For the human reviewers:** this review raises 5 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) the `*Needs:*` lines of §7.1 and §10.4 omit sections their statements name

   **Location.** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:543`: "*Needs:* §5.2, §5.5, §6.4." and `:827`: "*Needs:* §1.3, §9.5, §9.6, §10.3."; `design/plan.json`, targets `7.1` and `10.4`, `prerequisites`.

   **Claim.** A `*Needs:*` line lists what the statement and its route need, item by item.

   **Witness.** §7.1 states `T_t Z = S_t Z` for `Z ∈ G` without contact: `S_t` is defined in §3.4 and the fact is the free-motion bullet of §5.1; neither is listed. §10.4 takes `[FlatPositionSpace d 𝕋^d]`, the class of §1.1, not listed.

   **Exact repair.** §7.1: "*Needs:* §3.4, §5.1, §5.2, §5.5, §6.4." and `target:3.4`, `target:5.1` added to the prerequisites of plan target 7.1. §10.4: "*Needs:* §1.1, §1.3, §9.5, §9.6, §10.3." and `target:1.1` added to plan target 10.4. Tested on the instance: the fourth Check of §7.1 compares `T_1 Z` with `S_1 Z` (`x_1 = (1, 1)`), which only §3.4 defines; the last Check of §10.4 varies the cover and radius, data of the class of §1.1. The `### Dependencies` lines of Layers 7 ("Layers 3 and 5–6") and 10 ("Layers 1–2, 7 and 9") already name these layers, and the build order is unchanged, since §5.5 and §1.3 already need the added sections. I compared the sections named in every statement and route with its `*Needs:*` line for all 45 targets; no other target has this omission.

One finding, P3; none is P1 or P2. R01 carries a repair, so the verdict asks for changes: a fix round applies it, and nothing else in the design needs repair. No supplier gap is declared and none is needed. I changed neither the README, the plan nor the sources manifest, and fetched no source: every sampled locator lies in the three cached texts. No maintainer notes were supplied. This is the design lane: there is no `Suggested.lean`, and Lean elaboration is not available (this lane does not elaborate; say so in the report). No Lean command was run.

## Previous findings, checked first

The preceding review is `REV-DESIGN-HardSphereDynamicsAndKineticLimits~14` (two findings, both P3); its repair report is `packages/HardSphereDynamicsAndKineticLimits/reports/FIX-DESIGN-HardSphereDynamicsAndKineticLimits~15.md`. Nothing was marked `not actionable in this package`; nothing is re-raised.

| Round-14 finding | Status | Repaired passage and my check |
|---|---|---|
| §8.2's `*Needs:*` omitted the nullness of `𝒟̄ ∖ G` | Repaired | Line 636: "*Needs:* §1.2, §3.3–3.5, §6.4, §7.1, §8.1, …"; plan target 8.2 has `target:6.4`. The route (line 621) now ends "the pointwise identity holds at `λ_N`-almost every point where `W⁰ ≠ 0`, since `W⁰` vanishes off `𝒟̄` and `𝒟̄ ∖ G` is null (§6.4)". New fifth Check recomputed: `a = (2, 1)`, `u = (−1, 0)`, `D = 4 − 4 = 0`, `H = 1/2`, `Lφ = 2χ' − χ`, `∫_0^∞ Lφ = −2χ(0) − ∫χ ≤ −2 − 3 = −5`, against `−φ(0, Z) = −2`. Plan test `identity_off_goodSet` present. |
| Two sentences of the contracts narrated the author's reading | Repaired | Lines 37 and 66: "The declarations below are cited as they stand at the pinned Mathlib." and the same for Tau Ceti. A scan for "was read", "checked", "verified", "confirmed" finds nothing else. |

The repair also changed five further `*Needs:*` lines (§3.3, §6.2, §6.4, §7.4, §8.3) with a route clause each, and two `### Dependencies` lines. Each was read and recomputed (rows marked "repair" in the table). The repaired pattern in the rest of the design: a route that uses a null set not stated by a listed section (none left); a section named in a statement or route and absent from its `*Needs:*` line (two, R01); a Check without a plan test (none: 174 Checks, 174 tests, equal per target for all 45).

## Verified sound

### Coverage and principles

I read all 875 README lines, the plan (10 layers, 45 targets, 174 tests, at least 3 per target, `gaps` empty, one supplier entry) and the 9 manifest entries.

- No route-specific shortcut: every `d ≥ 1`, every flat position space, every `0 < ε < ρ`; `d ≥ 2` only in §10.4 and the corollary of §10.5, with the d = 1 counterexample as a Check. No re-planned roadmap, no upward or cyclic supply, no algorithm, no layer named after a source's chapter, no sentence saying the roadmap follows a source.
- A scan for LaTeX delimiters, pull-request numbers, machine paths, `set_option`, "optional", "deferred", "for later", "so far", "current", "removed", "checkpoint", "handoff", HTML anchors and round labels finds nothing; `lemma` occurs only as the source's "Lemma 4.1.1".
- README against plan, mechanically: the sections of every `*Needs:*` line equal the `target:` prerequisites for all 45 targets (the four reported differences are the supplier citation "ClassicalErgodicTheory §3.5", read by hand); no prerequisite points forward; every `mathlib:` and `tauceti:` prerequisite is named on its `*Needs:*` line.
- Remarks that need no change. §8.4's second Check says "for symmetric `h`", which the identity does not need (relabelling invariance of `W_N` and `λ_N` already gives `N! ∫ W_N h`); the Check is true as written. §10.5's route ends with Chebyshev's inequality for the deviation from `∫ f h`, while `ProbabilityTheory.meas_ge_le_variance_div_sq` bounds the deviation from the mean; the step between them (`E[π(h)] → ∫ f h`, so `{|π − m| ≥ δ} ⊆ {|π − Eπ| ≥ δ/2}` eventually) is immediate from the first hypothesis. §6.3 takes a bounded `K`, §6.1 a measurable one; §6.1 is applied only to the closed neighbourhoods `K_j`.

### Adversarial table

`E` is Euclidean space; the head-on witness is ε = 1, `x_1 = (2, 0)`, `x_2 = 0`, `v_1 = (−1, 0)`, `v_2 = 0`. Every value below was computed this round. Rows cover the fifteen sampled targets, the passages the repair changed, the headline theorems and the targets of R01. I also recomputed the Checks of §1.2–1.4, §2.2, §3.3–3.5, §4.1, §4.2, §4.5, §5.3, §5.5, §6.1, §7.5, §8.3, §9.3–9.6, §10.1, §10.2 and §10.5 and found each correct.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1 flat position spaces (sampled) | short lift; local isometry; `E`; sup-norm torus; ρ = ∞ | `π(a − b)`, `|a − b| < ρ`: lift `c` with `|c| = ‖π(a − b)‖ < ρ`, injectivity gives `c = a − b`; ball of radius `r ≤ ρ` is `π(B(a, r))`, measure `vol(B(0, r))`; sup-norm class of `(s, s)`: norm `s`, shortest lift `s√2` (0.1 against 0.1414) | Sound | none |
| §2.1 scattering (sampled) | involution; reflection; witness; head-on; separate reflection | `⟨v' − w', ν⟩ = −⟨v − w, ν⟩`; `(v, w) − ⟨v − w, ν⟩(ν, −ν)` is the reflection, `|(ν, −ν)|² = 2`; `((0.9, 0.9), 0)`, energy `1.62` both sides; `(−1, 0), (1, 0)`; momentum `(1, 0) → (−1, 0)` | Sound; same sign as GST2013 (4.1.2), BGSS2023 (1.1.2), DengHaniMa2024 (1.2) | none |
| §3.1 hard-core sets (sampled) | `N ≤ 1`; torus distance; packing at ε > 2ρ and ε = 2ρ | no pairs; `π(0.05, 0)`, `π(0.95, 0)`: distance 0.1 against 0.9; `1/(2 · 0.75) = 2/3 < 1` with `𝒟̄_1` everything; at ε = 1 threshold 1, largest circle distance 1/2 | Sound | none |
| §3.2 contacts, boundary pieces (sampled) | torus normal; shared particle; pair order | `π(0.1, 0) − π(0.8, 0) = π(0.3, 0)`, `ν = (1, 0)`; pairs `{1, 2}`, `{1, 3}` share 1; `⟨v_1 − v_2, ν_12⟩ = 1 = ⟨v_2 − v_1, ν_21⟩` | Sound; BGSS2023 lines 148–152 | none |
| §3.3 "ℛ = (X, −V) off a null set" (repair) | `ℛ²`; `N = 1`; outgoing state | `−σ_M(−σ_M V) = V`; no pairs; `σ_M((1, 0), 0) = (0, (1, 0))`, `ℛ` gives `(0, (−1, 0))`, `⟨v_1 − v_2, ν⟩ = 1` | Sound; uses the null spheres of §1.1, now listed | none |
| §4.3 collision map (sampled) | explicit `DC`; d = 1; variable time | `dτ = da_1 + du_1`, `dq = (0, da_2 + du_2)`, `dU' = (−du_1, 2da_2 + 3du_2)`, `dY = (−da_1, −da_2 − 2du_2)`, `det = (−1)(−1)(−3 + 4) = 1`; d = 1: `(2 − a − s u, −u)`, det 1; `(1 − 0.7u, −u)`, det 0 | Sound | none |
| §5.2 `IsTrajectory.eqOn` (sampled, headline) | forward at the supremum of agreement; backward at the infimum; gluing | positions agree by continuity, `V(t*) = σ_M V(t*−)` on both, then constant on `(t*, t* + η)`; backward: `V(t*)` by right continuity, `V(t*−) = σ_M V(t*)`; glued path at `b`: `V(b) = σ_M V(b−)` from the left piece; outgoing state: `x_2(2) = (−2, 0)` | Sound | none |
| §6.2 short steps (sampled, repair) | far pairs; contact at time δ; torus radii; block Check | distance `> ε + 2Rδ`, speed `≤ √2 R ≤ 2R`, so `> ε` on `[0, δ]`; `τ = δ` gives an outgoing contact state, admitted by `S_{δ,R}` at the next step; `0.47 + 0.18 = 0.65 ≥ 1/2`, `0.39 + 0.09 = 0.48 < 1/2`; `|V| = 0.2`, positions `0.1, 2.1, 20.1, 22.1` | Sound; null part in `𝒟̄ ∖ 𝒟` (§3.1) and grazing data (§4.4) | none |
| §6.3 iteration (sampled) | constants; step count; `N = 2`; `N = 3` | `(ε + 2Rδ)^d − ε^d ≤ 2Rd(ε + 2R)^{d−1} δ` for `δ ≤ 1`; `⌈t/δ⌉ ≤ (t + 1)/δ`; `a = (2, 1)`: `D = 0`, `√5 ≤ 3`, grazes at 2 > δ then at 1 ≤ δ; `8 (12π)² (π²/2) = 576π⁴ ≈ 56108`; `K_1 = [−2, 2]` | Sound | none |
| §6.4 Alexander (headline, repair) | reversal bijection; Borel description | `ℛZ = ((2, 1), 0; (1, 0), 0)`: `⟨a, u⟩ = 2 > 0`, grazes at `−2`; second-nearest distance continuous and `> ε` on `[0, t]`, so some `m`, `R` pass | Sound | none |
| §7.1 flow (headline) | `T_3`; grazing state | `((1, 0), (−2, 0); 0, (−1, 0))`; `T_1 Z = Z` against `S_1 Z` with `x_1 = (1, 1)` | Statement sound; `*Needs:*` | R01 |
| §7.3 symmetries (sampled, headline) | reversal on `G` and off `G`; rotation; boost off `G` | `T_t ℛZ = ℛ(Z(−t))`; `ℛT_3 Z = ((1, 0), (−2, 0); 0, (1, 0))`, and backward from `((2, 0), 0; (1, 0), 0)`: contact at `−1`, `x_2(−3) = (−2, 0)`; quarter turn `(−1, 0) ↦ (0, −1)`, distance `≥ 2`; `(3, 1), (1, 0)` against `(2, 1), 0` | Sound | none |
| §7.4 Koopman group (sampled, repair) | `p = 2`; `p ≠ 2`; contact state; mass | `‖U_t f − f‖² = 2‖f‖² − 2⟨U_t f, f⟩`; support of measure `≤ 2λ(supp f)`, `‖g‖_p^p ≤ ‖g‖_∞^{p−2} ‖g‖_2²` and Hölder; outgoing contact state: `T_{−t} Z → ((1, 0), 0; (−1, 0), 0) ≠ Z`; `1 · vol([−1, 1]) = 2` | Sound | none |
| §8.1 transported densities (sampled) | group law; duality; sign | `W⁰ ∘ T_{−s} ∘ T_{−t}`; `∫ (W⁰ ∘ T_{−t}) φ = ∫ W⁰ (φ ∘ T_t)`; `W(1)((1, 0), (1, 0)) = W⁰(0, (1, 0))`; ClassicalErgodicTheory §3.5 item 4 has `W ∘ Φ(−t)` | Sound | none |
| §8.2 weak Liouville (headline, repair) | left limit; box; grazing state | `φ(t_k, X, σ_M V) = φ(t_k, X, V)` and the derivative at the incoming state gives continuity; `τ ∈ (0.9519, 1.0521)`, `H ∈ (0.4802, 0.5204)`, defect `−1`; `−5` against `−2` | Sound | none |
| §8.3 inheritance (repair) | `s = N`; torus `N = 2` | nothing integrated; `g(z_1)(1 − ω_d ε^d) ∫ g̃`; same positions on both sides, so both in or both out of `𝒟̄_N` | Sound | none |
| §8.4 symmetric expectations (sampled) | `s = 1`; `s = N`; `s = 2, N = 3`; `s > N`; unnormalised | `N ∫ W_N`; `N! ∫ W_N h`; `6` against `9`; `descFactorial 1 2 = 0` against `1!/0! = 1`; `2e^{−2} = 0.27067` both sides | Sound | none |
| §9.1 Maxwellians (sampled) | Tau Ceti density; product; integral | `S = β⁻¹ · 1`: `(2π)^{−d/2} (β^{−d})^{−1/2} = (β/2π)^{d/2}`, exponent `−β|x − u|²/2`; `|v' − u|² + |w' − u|²` conserved; `(2π)^{3/2} = 15.7496`; `0.39894` | Sound; GST2013 (2.2.5) at ρ = 1, θ = 1/β | none |
| §9.2 invariant and canonical measures (sampled) | density in `H, P`; mass; `Z^{can} = 0`; `E` | `Σ|v_i − u|² = 2H − 2⟨u, P⟩ + N|u|²`; `Z^{can}/Z^{can} · 1 = 1`; torus, ε = 0.4, `N = 8`: `1/0.12566 = 7.96 < 8`; `q_N · 1 = ∞` | Sound | none |
| §9.4, §9.5 (headlines) | distinct-label identity; inversion; bound; Poisson | `Σ_N (1/N!)(N!/(N − n)!) ∫ W^{(n)}_N h = μ^n ∫ F_n h`; `Σ_{p+q=m} (−1)^p/(p! q!) = 0` for `m ≥ 1`; `e^{2μC₀K}`; `4 · ¼ = 1` against `λ + λ² = 2`; `0.8 √(2π) = 2.0053 ≤ 2.5066` | Sound | none |
| §9.6 `boltzmannGrad_scaling` (headline) | factorisation; bound; scaling | `F_n(0) = (f⁰)^{⊗n} 1_{𝒟̄_n} Z⁻¹ Σ_p (μ^p/p!) ∫ Π f⁰ 1[admissible]`; `1 − p_ε ≤ n μ ω_d ε^d ‖ρ⁰‖_∞`; `μ_ε ε^d = ε`; `4.18879 · 0.01 = 0.0419` | Sound | none |
| §10.3 mild solutions (sampled) | `t = 0`; d = 1; wrong sign; Maxwellian | `π(0) = 0`, empty integral; `σ_{±1}(v, w) = (w, v)`, `Q ≡ 0`; `f⁰(π(1/2), 1) = 0.5 M(1)` against `1.5 M(1)`; `Q(M, M) = 0` and `M_{β,u} ≤ C e^{−β'|v|²/2}` for `β' < β` | Sound; BGSS2023 (1.2.1), GST2013 (2.1.1) | none |
| §10.4 `LanfordStatement` | BGSS2023 Theorem 1; hypotheses; structures | compact-uniform and almost-everywhere clauses are lines 316–321; the two bounds give (1.1.5) with `2C₀`; weak clause by Scheffé from `∫ F_n(t) = ∫ F_n(0) → 1`; `|det B| = 1`, `‖B‖ ≤ 1`, so `B` orthogonal; `B(0, ±0.5) = (∓0.5, 0)`, equal classes | Supported; `*Needs:*` | R01 |
| §10.5 (headlines) | second moment; d = 1; wrong `F_2`; Poisson | `0 + m² − 2m² + m² = 0`; `1 − e⁻¹ = 0.63212`; `2m² − 2m² + m² = m²`; `Var(N/2) = 2/4 = 1/2` | Sound | none |

### Seeded source sample

The author flagged no locator as unverified. I opened the three readable texts at every locator of the fifteen sampled targets.

| Target | Text opened and result |
|---|---|
| 1.1 | GST2013 line 833 (`N` particles in `ℝ^d`); BGSS2023 line 119 (the torus, `d ≥ 2`). Confirmed as the two settings; the class is the roadmap's. |
| 2.1 | GST2013 lines 843–847 ((4.1.2)) and 1222–1227 ((4.4.1)); BGSS2023 lines 125–131 ((1.1.2)); DengHaniMa2024 lines 157–163 ((1.2)). Same sign in all. Confirmed. |
| 3.1 | GST2013 lines 839–841 (open domain); BGSS2023 lines 137–142; DengHaniMa2024 lines 150–153 (closed domain); BGSS2023 line 165 (empty for large `N`). Confirmed. |
| 3.2 | BGSS2023 lines 148–152 (the boundary pieces, written for a pair `(i, j)`). Confirmed. |
| 4.3 | GST2013 line 883 (invariance of the measure, used); DengHaniMa2024 lines 186–187. Confirmed as "statement used"; the Jacobian computation is the roadmap's. |
| 5.2 | DengHaniMa2024 lines 182–188 (existence and uniqueness off a null set); GST2013 lines 848–854. Confirmed. |
| 6.2 | GST2013 lines 875–887. Confirmed. |
| 6.3 | GST2013 lines 875–898; `t/δ` an integer at line 876; `(1 + jδ)^{d(N−2)}` at line 896. Confirmed. |
| 7.3 | GST2013 (1.1.1), lines 211–215; BGSS2023 lines 184–187; GST2013 (4.1.1)–(4.1.2), lines 835–847, before the marker of the page printed 28, so printed p. 27; (2.1.3), lines 396–399. Confirmed. |
| 7.4 | GST2013 (4.3.5), lines 1138–1140; DengHaniMa2024 (1.5), lines 175–178. Confirmed (the operators only, as the README says). |
| 8.1 | BGSS2023 (1.1.3)–(1.1.4), lines 145–157; GST2013 (4.3.5); DengHaniMa2024 (1.9)–(1.10), lines 224–234. Confirmed. |
| 8.4 | BGSS2023 (1.1.9), lines 241–266, after the marker of the page printed 3 (line 195); the indicator at line 249. Confirmed. |
| 9.1 | GST2013 (2.2.5), lines 489–492. Confirmed. |
| 9.2 | BGSS2023 lines 158–160, on the page printed 2. Confirmed. |
| 10.3 | BGSS2023 (1.2.1), lines 292–304, with (1.2.2)–(1.2.3), lines 306–312; GST2013 (2.1.1), lines 380–384. Confirmed. |

Also read for the headlines: GST2013 lines 42–118 (contents), 664–700 (Theorem 4, Remark 3.1.1), 855–910, 1204–1230, 2064–2082 (Theorem 8); BGSS2023 lines 112–190, 238–372; DengHaniMa2024 lines 136–236.

### Pinned declarations

Pins of `lake-manifest.json`, equal to the plan's baseline: Mathlib `1b1ccf4b088b`, Tau Ceti `2fd255d997f4`. Every backticked library name of the README was searched at the pins and found; opened this round, paths relative to each library:

- Tau Ceti: `TauCeti/Probability/Distributions/Gaussian/Density.lean:82` (`(2π)^{−n/2} · det S^{−1/2} · exp(−⟨x − m, S⁻¹(x − m)⟩/2)`, `S : Matrix ι ι ℝ`), `:265` (`hS : S.PosDef`; the density is the `ℝ≥0∞` companion); `TauCeti/Analysis/Semigroups/Group/Basic.lean:74` (real normed space; `map_zero'`, `map_add'` for all real `s, t`, `continuousAt_zero'`); `TauCeti/Probability/Process/EmpiricalMeasure.lean:224` (`[Nonempty κ]`, a `ProbabilityMeasure`); `TauCeti/Dynamics/Flow/OfLipschitz.lean:59` (`LipschitzWith K v`, `[CompleteSpace E]`, a `Flow ℝ E`).
- Mathlib: `MeasureTheory/Function/ContinuousMapDense.lean:142` (`[NormalSpace α]` from line 67, `[R1Space α]`, `[WeaklyLocallyCompactSpace α]`, `[μ.Regular]`, `p ≠ ∞`); `Analysis/InnerProductSpace/Projection/FiniteDimensional.lean:59`; `Topology/Algebra/OpenSubgroup.lean:377` (`[T1Space G]`, `[DiscreteTopology U]`, additive by `to_additive`); `Analysis/Normed/Group/Quotient.lean:168`, `:222` (`[IsClosed (S : Set M)]`; the additive name is generated); `MeasureTheory/Constructions/Polish/Basic.lean:119`, `:148`, `:154`, `:649` (`[N.Normal]`, `[IsClosed]`); `Topology/MetricSpace/ProperSpace.lean:66`; `Algebra/Module/ZLattice/Basic.lean:93`, `:352`, `:434`; `Algebra/Module/ZLattice/Covolume.lean:73`, `:85`; `MeasureTheory/Group/FundamentalDomain.lean:59`, `:731`, `:754` (`to_additive addProjection_respects_measure`), `:801`; `MeasureTheory/Measure/Haar/Quotient.lean:75`, `:222`, the additive form used at `MeasureTheory/Integral/IntervalIntegral/Periodic.lean:94`; `MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean:308`; `MeasureTheory/Measure/Lebesgue/EqHaar.lean:172`, `:231`, `:527` (`[Nontrivial E]`); `LinearAlgebra/Matrix/Determinant/Basic.lean:734`; `MeasureTheory/Constructions/HaarToSphere.lean:52`, `:88`; `MeasureTheory/Function/Jacobian.lean:1096`, `:1184`; `Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:330`; `Probability/Distributions/Gaussian/Real.lean:47`, `Multivariate.lean:166`; `Probability/Distributions/Poisson/Basic.lean:40`; `MeasureTheory/Constructions/Pi.lean:732`; `MeasureTheory/Function/LpSpace/Basic.lean:595`, `:611`; `MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean:1140`; `Probability/Moments/Variance.lean:398` (`[IsFiniteMeasure μ]`, deviation from the mean); `Data/Nat/Factorial/Basic.lean:332`, `:367`, `:424` (`k ≤ n`); `MeasureTheory/MeasurableSpace/Constructions.lean:871`; `MeasureTheory/Measure/Sum.lean:30`; `Dynamics/Flow.lean:85`; `Dynamics/Ergodic/MeasurePreserving.lean:44`; `Topology/Instances/AddCircle/Real.lean:55`; `Analysis/Fourier/AddCircleMulti.lean:173`.

The 17 names in `scratch/citations.md` are this roadmap's own `HardSphere.*` names, expected at the design stage; line 85 of the README lists them as the declarations of the future `Suggested.lean`.

### Duplication, ownership and overlap

`scratch/overlaps.md` (main `19ff3de`, index of 2026-11-15T21:39:35Z) lists no other pull request changing this roadmap, no dropped id, no id that only a revision defines and no second copy. Main has no folder `TauCetiRoadmap/HardSphereDynamicsAndKineticLimits`; the two packages of `scratch/board-packages-index.txt` (AnalyticNumberTheory, LawrenceVenkateshMethod) are other subjects. Object searches over main and the open heads (`roadmaps grep`):

- "Boltzmann–Grad", "BBGKY", "Lanford", "Maxwellian", "grand canonical", `FlatTorus`, `FlatPositionSpace`, `AddQuotientMeasureEqMeasurePreimage`: no match anywhere. "hard sphere": ClassicalErgodicTheory only (its lines 73, 1161, 2441: the hard-sphere flow is outside its scope and a consumer of its §3.5). "Boltzmann": OptimalTransport (entropy), StandardDistributions, TemperleyLiebOperatorAlgebras, different objects. "specular": SymplecticGeometry/CotangentLagrangian line 536, a billiard chord. "correlation function": PointProcesses (densities of factorial moment measures of point processes) and main (RandomMatrices §8.1, eigenvalue counts).

Cross-roadmap citations resolved this round:

- ClassicalErgodicTheory, at the head of its open pull request: §3.5 "Flows defined almost everywhere" (a standard Borel space, a σ-finite measure); item 1 ("a jointly measurable family of measure-preserving maps of `(X, μ)` satisfying the group law everywhere"), item 3 ("a measure on the union is invariant iff each component restriction is"), item 4 (`(Φ t)_* ν = μ.withDensity (W ∘ Φ (-t))`); its conventions (line 101: a measurable flow is "a jointly measurable `AddAction ℝ X`"); its §0.2 ("`μ` is a finite invariant measure and `1 ≤ p < ∞`"). Each agrees with the contract and with the scope paragraph.
- On main: MathematicalBilliards §10.3 (line 768, "area `4 · 1 = 4`, the covolume of `2ℤ + 2iℤ`"), §10.5 (line 788, `ℂ/Λ` as a translation surface), §12.3 (line 899, an action of `ℝ` on a probability space, `Lp ℂ 2 μ`); ProbabilisticAndMetricNumberTheory §4.9a (line 6319; `scalarLpKoopman_strong` at line 6363: a group "acting continuously on an R₁ space"); RandomMatrices §8.1 (line 1133); StandardDistributions Layer 5 (multivariate distributions, its line 38); ComplexTori; `Completed/OneParameterSemigroups`.

This roadmap owns the hard-sphere objects and `FlatTorus` because no roadmap on main or open states them.

Overlap check: read ClassicalErgodicTheory, PointProcesses, MathematicalBilliards and RandomMatrices (scope and the cited sections) and searched RelativisticQuantumFieldTheory, HamiltonianSystems, IncompressibleFlows and OptimalTransport for the objects above (third list empty); conull flows, their disjoint unions and the transport of densities: owner ClassicalErgodicTheory §3.5, cited here; the translation-surface structure of `ℂ/Λ`: owner MathematicalBilliards §10.5, not restated; Koopman strong continuity for finite measures or continuous actions: owners ClassicalErgodicTheory §0.2, MathematicalBilliards §12.3 and ProbabilisticAndMetricNumberTheory §4.9a, not shared for the infinite measure `λ_N|𝒟̄` and the discontinuous flow; correlation functions of eigenvalue counts: owner RandomMatrices §8.1, a different carrier, named in the scope; unlabelled point processes and their factorial moment measures: owner PointProcesses, not restated and not cited as a supplier; nothing else shared.

### Supplier order

```text
candidate: HardSphereDynamicsAndKineticLimits is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2255 edges, 0 problem(s)
```

No UPWARD or CYCLE line. ClassicalErgodicTheory is another author's open pull request that adds a new roadmap folder, which this roadmap may consume; it is not in `merge-order/ORDER.txt`, so the check does not see the edge. By reading, the direction is one way: its §3.5 needs its own §§0.1, 3.1, 3.3 and MathematicalBilliards §§8.2–8.3, nothing of this roadmap. No roadmap of the never-cite list is cited as a supplier (PointProcesses is named only as the owner of a neighbouring subject). No target needs a later one (checked mechanically on the plan).

### Shape and headline theorems

Every numbered section has its hypotheses in the sentence, a locator or the words "derived here", and at least three Checks (3 to 7); every definition has an API list or states its properties in the defining paragraph; every layer ends with `### Examples` and `### Dependencies`. The organisation is the roadmap's own (comparison below).

Headlines named for the package stage: `HardSphere.IsTrajectory.eqOn` (§5.2), `HardSphere.volume_hardCoreSet_diff_goodSet` (§6.4), `HardSphere.flow_add` (§7.1), `HardSphere.measurePreserving_flow` (§7.2), `HardSphere.flow_reversal` (§7.3), `HardSphere.weak_liouville` (§8.2), `HardSphere.grandCanonical_flow_invariant` (§9.4), `HardSphere.lintegral_sum_distinct_eq_correlation` (§9.5), `HardSphere.boltzmannGrad_scaling` (§9.6), `HardSphere.tendsto_empirical_of_correlation` and `HardSphere.LanfordStatement.tendsto_empirical` (§10.5). Each names the roadmap's objects. The padding probe and the `#check` comparison have nothing to run on at this stage.

### Copyright, licences and scope

- **Wording.** Beside the locators of the fifteen sampled targets I compared eight further passages with the source text: §5.5's description of pathological data with GST2013 lines 851–854; §6.1 with GST2013 lines 867–874; §6.4's route with GST2013 lines 875–910; §2.2's involution with GST2013 lines 394–400; §9.3's exchangeability sentence with BGSS2023 lines 184–187; §10.4 with BGSS2023 lines 316–321; §10.5's route with BGSS2023 lines 352–371; the right-continuity convention and §5.4 with DengHaniMa2024 lines 164–166. No run of more than four consecutive words is shared (terms of art such as "on compact sets"), and no sentence follows a source clause by clause.
- **Arrangement.** GST2013 has the largest share: 52 of the 129 occurrences of a source key in the README (BGSS2023 44, DengHaniMa2024 24, the six others 9). Its contents (lines 42–118): Chapters 1–3 the low density limit, the Boltzmann equation and the main results; Chapter 4 the `N`-particle flow, the Liouville equation, its weak form and the hierarchies; Chapters 5–7 estimates and convergence; Part III potentials; Part IV term-by-term convergence. Layers 1–4 and 9 have no counterpart; Layers 5–7 expand its §4.1; Layer 8 covers its §§4.2–4.3 without the hierarchies; the collision operator of its Chapter 2 is in Layer 10. No run of layers maps one to one onto a run of its chapters or sections. The order of Layers 7 to 10 is forced: §8.1 needs §7.2, §9.5 needs §8.1 and §8.4, §10.1 needs §9.5.
- **Reuse.** No table, figure, list of examples or numerical data is taken from a source.

Source independence: 23 passages compared with 3 sources, none shared; largest share GST2013, 52 of 129 locators; contents compared with GST2013: independent.

## Not verifiable

- Alexander1976 Proposition 4.3 and AlexanderThesis1975 Chapter 1: settled uncertified; only the attribution in GST2013 (line 855) was read.
- Lanford1975, CIP1994, Spohn1991, Uchiyama1988: settled uncertified; not read, not requested again.
- Lean elaboration, the one-tactic padding probe and the `#check` comparison: not available (this lane does not elaborate), and there is no `Suggested.lean`. Library names were checked by reading the pinned sources, not by elaboration.
- The truth of `HardSphere.LanfordStatement` beyond its agreement with BGSS2023 Theorem 1, its `t = 0` case and its equilibrium case: the proof belongs to a later roadmap. BGSS2023 (1.1.5) does not say whether the datum is continuous in the velocity; the README asks for a continuous datum, as GST2013 Theorem 4 does.
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

<!-- tauceti-roadmap-review {"agent": "claude", "head": "94c457e0b962e5e4244dd8e0d903ff1fd0d754e9", "job": "REV-DESIGN-HardSphereDynamicsAndKineticLimits~15", "model": "fable", "worker": "chris-x52"} -->
