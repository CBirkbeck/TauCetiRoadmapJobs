<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13780#issuecomment-6849784967 -->
Review (claude) of 99ba6d4

Verdict: needs_changes

1. **F01** (P3) Layer dependency lines omit the new roadmap supplier

   **Location:** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:597`, `:665`, `:758`: "Layers 5–6.", "Layer 7.", "Layers 7–8." under `### Dependencies` of Layers 7, 8 and 9.

   **Claim:** Each layer's `### Dependencies` gives what the layer depends on outside itself.

   **Witness:** The `*Needs:*` lines of §7.2 (line 551), §7.5 (line 589), §8.1 (line 612) and §9.4 (line 723) each list ClassicalErgodicTheory §3.5. Layers 1 and 2 say "Mathlib only", so external suppliers are in scope of these lines.

   **Exact repair:** Write

   - Layer 7: "Layers 5–6; ClassicalErgodicTheory §3.5 (items 1 and 3)."
   - Layer 8: "Layer 7; ClassicalErgodicTheory §3.5 (item 4)."
   - Layer 9: "Layers 7–8; ClassicalErgodicTheory §3.5 (item 3)."

   Tested against the witness: the three lines then agree with the four `*Needs:*` lines item by item (item 1 in §7.2, item 3 in §7.5 and §9.4, item 4 in §8.1). The plan has no layer-level dependency field and needs no change.

One finding, P3: it carries a repair, so the verdict asks for changes and a fix round applies R01; nothing else needs repair. All four round-4 findings are repaired, and the repaired passages survived the adversarial pass. No supplier gap is declared and none is needed.

The README, the plan and the sources manifest were not edited. No maintainer notes were supplied. This is the design lane: there is no `Suggested.lean`, and elaboration is not available (this lane does not elaborate; say so in the report). No Lean command was run.

## Previous findings, checked first

The preceding review is `packages/HardSphereDynamicsAndKineticLimits/reports/REV-DESIGN-HardSphereDynamicsAndKineticLimits~4.md` (ids F01–F04); its repair report is `packages/HardSphereDynamicsAndKineticLimits/reports/FIX-DESIGN-HardSphereDynamicsAndKineticLimits~5.md`. Line numbers are those of the design README.

| Round-4 finding | Status | Repaired passage and my check |
|---|---|---|
| F01 (P2), conull flows owned by ClassicalErgodicTheory §3.5 | Repaired | Line 13: "Flows defined off a null set in general … are ClassicalErgodicTheory §3.5. This roadmap constructs the conull carrier `G`, the trajectory action on it and its measure preservation". Lines 73–79 are the supplier contract (items 1, 3, 4). §7.2 (line 542) states the two conull flows, §7.5 (line 581) and §9.4 (line 714) cite item 3, §8.1 (line 603) cites item 4. Plan 7.2, 7.5, 8.1, 9.4 carry `roadmap:ClassicalErgodicTheory §3.5`, and `suppliers` has the entry. I read §3.5 at the head of the supplier (its README lines 1159–1198): the heading and the three items say what the contract says. The placement in §7.2 instead of §7.1 is right: a conull flow must preserve the measure on its carrier, which is §7.2, and §7.2 needs §7.1. The Koopman sentence is correct: the supplier's §0.2 reads "`μ` is a finite invariant measure" and MathematicalBilliards §12.3 "on a probability space". |
| F02 (P3), §8.4 normalisation | Repaired | Line 647: "a symmetric measurable `W_N ≥ 0` … No normalisation of `W_N` is assumed". Plan 8.4 hypotheses: "s ≤ N", "W_N symmetric", "W_N ≥ 0 measurable", "h ≥ 0 measurable". Recomputed on the witness: mass `2e^{−2} = 0.270671`, `N = s = 1`, `h = 1` gives 0.270671 on both sides; `s = 0` gives `c ∫ W_N` on both sides. |
| F03 (P3), §4.3 locator | Repaired | Line 340: "(statement used in GST2013 line 883; DengHaniMa2024 lines 186–187)". The manifest's `cited_for` of BGSS2023 no longer has "4.3". Both remaining locators re-read (below). |
| F04 (P3), run-on sentence in §9.4 | Repaired | Line 714: "…componentwise (BGSS2023 lines 267–268). The equilibrium `f⁰ = M` and its invariant measure are named in BGSS2023 lines 479–483…". Lines 267–268 and 479–483 re-read; they say that. |

No finding of the repair report was marked `not actionable in this package`; nothing is re-raised. Four of four are repaired.

The repaired patterns elsewhere in the design: (F01) no other construction restates a section of another roadmap (object searches below); the one residue of the new supplier is R01. (F02) I compared every statement with its consumers' use: §8.3 is applied in §9.5 to `W_N(t)`, which is nonnegative, symmetric and vanishes off `𝒟̄`; §8.1 is applied to the real-valued `W⁰_N`; §9.2's unnormalised statement is what §9.4 uses. No further mismatch. (F03) all locators of the fifteen sampled targets re-read. (F04) no other run-on locator.

## Verified sound

### Coverage and principles

Read all 868 README lines, the 45 plan targets (166 planned Checks, at least three per target), every `*Needs:*` line and the 9 manifest entries. No route-specific shortcut (every `d ≥ 1`, every flat position space with `0 < ε < ρ`; `d ≥ 2` only where `μ_ε → ∞` is used), no copied passage, no algorithm, no layer named after a source's chapter, no sentence saying the roadmap follows a source. The layer order is forced by the `*Needs:*` lines. Every plan prerequisite of the form `target:` points to an earlier target (checked mechanically). No process words, pull-request numbers, dates, machine paths or LaTeX delimiters in the README. `gaps` is empty.

### Adversarial table

`E` is Euclidean space; the head-on witness is ε = 1, `x_1 = (2, 0)`, `x_2 = 0`, `v_1 = (−1, 0)`, `v_2 = 0`. Rows cover the fifteen sampled targets, the headline theorems and every passage the repairs changed.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §3.1 hard-core sets | ε = 1 on `E`; unit torus ε = 0.4; `N = 1` | distance 1: in `𝒟̄`, not `𝒟`; 0.5: in neither; torus distance of `π(0.05, 0)`, `π(0.95, 0)` is 0.1 < 0.4, representatives give 0.9; `N = 1`: no pairs, whole space | Sound |
| §4.1 collision time | head-on; grazing `a = (1, 3)`, `u = (0, −1)`; miss `a = (2, 3)`; contact datum `|a| = ε` | `⟨a,u⟩ = −2`, `D = 4 − 3 = 1`, roots 1 and 3; `D = 9 − 9 = 0`, τ = 3, `q = (1, 0)`; `D = 9 − 12 = −3`; at `|a| = ε`, `D = ⟨a,u⟩²`, τ = 0; `⟨q, u⟩ = ⟨a,u⟩ + τ|u|² = −√D`; `|a + su|² = |a|² + 2s⟨a,u⟩ + s²|u|²` nondecreasing when `⟨a,u⟩ ≥ 0` | Sound |
| §4.3 collision map, Jacobian | head-on; oblique `a = (3, 0.6)`; a generic point in d = 3; d = 1 | finite-difference `DC` at the head-on point has rows (−1,0,0,0), (0,−1,0,−2), (0,0,−1,0), (0,2,0,3), det 1.000000; oblique: `C = ((0.184, −1.512), (0.28, 0.96))`, det 1.000000; d = 3 at `a = (2.5, 0.3, −0.2)`, `u = (−1.1, 0.1, 0.05)`: det 1.000000; `S_s C = (q + (s − τ)R_q u, R_q u) = B_s`; d = 1 fixed time `(2 − a − su, −u)`, det 1; variable time `(1 − 0.7u, −u)`, det 0 | Sound |
| §4.5 pair maps | head-on, `s = 3`, `R = 1`; `N = 3`, d = 1; image of the velocity bound | `u' = (1, 0)`, `w = (−1, 0)`: `v_2 = (w − u')/2 = (−1, 0)` after τ = 1, so `x_2 = (−2, 0)`, `x_1 = x_2 + (3, 0) = (1, 0)`, `v_1 = 0`; positions 0, 2, 20 go to 0.1, 2.1, 20; `|a'| ≤ |a| + 2Rs < ρ`; `|v_i| ≤ R` is not preserved separately ((0, 0.9), (0.9, 0) ↦ (0.9, 0.9), 0 of norm 1.2728), which the statement allows for by mapping onto the image | Sound |
| §5.2 uniqueness, gluing (headline) | forward step; backward step; gluing at `b`; `a = b` | forward: `V(t₁) = σ_M V(t₁−)` with equal positions and left limits; backward: right-continuity gives equal `V(t₁)`, then `V(t₁−) = σ_M V(t₁)`; glued path at `b` satisfies the first piece's own jump condition and the second piece's right-continuity; both pieces give `x_2 = (−2, 0)` at the end of the witness | Sound |
| §6.1 near triples | `N = 2`; `N = 3`; exponent | no triple, `I = ∅`; ordered triples `N(N−1)(N−2) = 6 ≤ 27`; shell `ω_d((ε + η)^d − ε^d)` needs `ε + η < ρ` (§1.4), which is assumed; remaining `N − 2` positions in `K` | Sound |
| §6.4 Alexander's theorem (headline) | `N = 1`; `N = 2`; the Borel description; negative times | complement empty; cylinder `D = 0` and contact set null; on `[0, t]` the second-nearest distance of each particle is continuous and above ε (contacts are matchings), so its minimum exceeds `ε + 2Rδ` for small δ and the configuration passes every step; reversal: forward trajectory of `ℛZ`, reversed, glues at 0 with the forward one since `ℛℛZ = Z` | Sound |
| §7.1 flow, group law (headline) | head-on `T_3`, `T_{−3}`; grazing state | ((2,0), 0; (−1,0), 0) ↦ ((1,0), (−2,0); 0, (−1,0)) ↦ back; `a = (2, 1)`, `u = (−1, 0)`: `D = 4 − 4 = 0`, not in `G`, `T_1 Z = Z` while `S_1` gives `x_1 = (1, 1)`; off `G`: `T_s T_t Z = Z = T_{s+t} Z` | Sound |
| §7.2 measure preservation and the two conull flows (headline, changed) | `N = 0, 1`; `N = 2` on `E`; torus `N = 8`; measurable `A` in the carrier | `N ≤ 1`: `G = 𝒟̄` = all, shear of det 1; `N = 2`: carrier complement `𝒟̄ ∖ G` null, while `G` alone misses `𝒟̄ᶜ` of measure ∞; `8π(0.2)² = 1.005310 > 1`, so `𝒟̄ = ∅`, trivial action; `λ(T_t⁻¹A) = λ(A ∩ G) + λ(A ∩ 𝒟̄ᶜ) = λ(A)`; for `λ|𝒟̄`: `λ|𝒟̄(Gᶜ) = λ(𝒟̄ ∖ G) = 0` | Sound |
| §7.3 reversal (headline) | head-on | `ℛ T_3 Z = ((1,0), (−2,0); 0, (1,0))`, which collides at time −1 backwards and equals `T_{−3} ℛ Z` | Sound |
| §7.4 Koopman group | `N = d = 1` on the circle; `p = 2`, `p < 2`, `p > 2`; `p = ∞` | mass `1 · ∞`; `‖U_t f − f‖² = 2‖f‖² − 2⟨U_t f, f⟩ → 0` by domination with `‖f‖_∞ |f|`; support of `U_t f − f` has measure at most `2λ(supp f)`, so `‖g‖_p ≤ ‖g‖_2 m^{1/p − 1/2}` for `p < 2` and `‖g‖_p^p ≤ ‖g‖_∞^{p−2}‖g‖_2²` for `p > 2`; energy cutoff integrates to `1 · 2 = 2`; `‖U_t f − f‖_∞ = 1` on `E` | Sound |
| §7.5 grand canonical phase space (changed) | `N = 0, 1, 8` | `μ_0 = δ`, mass 1; `μ_1 = μ_X ⊗ vol`, weight `1/1! = 1`; `μ_8 = 0` with carrier `∅` conull for the zero measure; componentwise maps preserve each `μ_N`, hence the sum | Sound |
| §8.1 duality (changed) | `N = 1`, `t = 1` on `E`; signed data | `(S_1)_*(W⁰λ)` has density `W⁰(x − v, v)`, value `W⁰(0, (1,0))` at `((1,0), (1,0))`; `∫ φ d(T_t)_*(W⁰λ) = ∫ (φ ∘ T_t) W⁰ dλ` on one side and `∫ φ (W⁰ ∘ T_{−t}) dλ` on the other; wrong sign gives `W⁰((2,0), (1,0))` | Sound |
| §8.2 weak Liouville (headline) | `χ(t)ψ(H)`; box of the non-example | `∫_0^∞ χ' = −χ(0)`; τ ∈ (0.99/1.04, 1.01/0.96) = (0.9519, 1.0521), residual `E[v_1] − E[v_2] = −1` | Sound |
| §8.3 marginals | torus `N = 2`; `s = N`; `s = 0`; specular control | `g(z_1)(1 − ω_d ε^d)∫g̃` (ball of radius ε < ρ removed); `W_N`; `∫ W_N`; `e^{−1.62} = 0.197899` before scattering, 0 after since `|(0.9, 0.9)| = 1.2728 > 1`; inheritance: for almost every completion the contacts of the full configuration are those of `Z_s` | Sound |
| §8.4 symmetric expectations (changed) | `s = 0`; `N = s = 1`; `(N, s) = (3, 2)`; `(1, 2)`; `W = 0` | `c∫W_N` both sides; 0.270671 both sides; `3 · 2 = 6` injections against 9 maps; `descFactorial 1 2 = 0` against truncated quotient 1; 0 = 0 | Sound |
| §9.1 Maxwellians | d = 1; d = 3; Tau Ceti density at `S = β⁻¹ • 1` | `M(0) = 0.398942`; `(2π)^{3/2} = 15.7496` with `b = β/2`; `det S = β^{−d}`, `(det S)^{−1/2} = β^{d/2}`, exponent `−β|x − m|²/2`, the README's formula (the pinned definition takes `S : Matrix ι ι ℝ`); product identity from conservation of `Σ|v_i − u|²` | Sound |
| §9.4 invariance (headline, changed) | Maxwellian; indicator profile; cosine profile | each component density is a function of `(H, P)` times `1_𝒟̄`; `g(v)g(w) = 1 ↦ 0`; `ρ(0) = 1.5 ↦ ρ(−1/4) = 1`, so the `N = 1` component moves and the measure is not invariant | Sound |
| §9.5 correlation identity (headline) | `n = 1`; ε = 0; series bound; circle | `Σ_N (1/N!) · N!/(N − n)! ∫∫ W_N h = Σ_p (1/p!) ∫∫ W_{n+p} h = μ^n ∫ F_n h`; `F_n(0) = (f⁰)^{⊗n} e^μ/e^μ`; `Σ_{p,q} (μC₀K)^{p+q}/(p! q!) = exp(2μC₀K)`; `0.8 · √(2π) = 2.005303 ≤ 2.506628` | Sound |
| §9.6 chaos, scaling (headline) | `n = 1`; d = 3, ε = 0.01; d = 1 | `F_n(0) = (f⁰)^{⊗n} 1_𝒟̄ p_ε`; `1 − p_ε ≤ μ n ω_d ε^d ‖ρ⁰‖_∞`; `μ_ε ε^d = ε`; `ω_3 · 0.01 = 0.041888`, so `ε² E[N] ∈ [0.958112, 1]`; d = 1: `[1 − 2ε‖ρ⁰‖_∞, 1]` | Sound |
| §10.1 empirical measure | `N = 0`; first and second moments | zero measure; `μ^{−1} · μ∫F_1 h`; `μ^{−2}(μ∫F_1 h² + μ²∫F_2 h⊗h)` | Sound |
| §10.2 collision operator | d = 3 loss term; d = 1 | `∫|w| M_{1,0}(w) dw = √(8/π) = 1.595769`, cross-section π; `σ_{±1}(v, w) = (w, v)`, `Q ≡ 0` | Sound |
| §10.4 Lanford's statement | weak-convergence clause against the source; Maxwellian datum | the source states almost-everywhere convergence of `F_n`; `∫F^ε_n(t) = μ^{−n}E[descFactorial 𝒩 n]` is constant in `t` and tends to `(∫f⁰)^n = 1` by §9.6, and `∫f(t)^{⊗n} = 1` since `∫Q = 0` (§10.2); so Scheffé's lemma gives `L¹` convergence, hence the clause follows from the cited statement; Maxwellian: `F_n` constant in `t` | Sound |
| §10.5 law of large numbers (headlines) | limit of the second moment; d = 1; wrong `F_2` limit | `0 + m² − 2m² + m² = 0`; `1 − e^{−1} = 0.632121`; `2m² − 2m² + m² = m²` | Sound |
| Scope: Koopman sentence (changed) | `N = d = 1`, unit circle | mass `1 · ∞`; both other roadmaps assume a finite measure | Sound |

### Seeded source sample

The three readable texts were opened at every locator of the fifteen sampled targets. Nothing the author flagged as unverified remains. No source was fetched and the manifest was not changed.

| Target | Text opened and result |
|---|---|
| 3.1 | GST2013 lines 839–841 (the domain, strict inequality); BGSS2023 lines 137–142; DengHaniMa2024 lines 150–153 (closed domain, (1.1)). Confirmed. |
| 4.1 | GST2013 lines 846–847 (pre-collisional condition) and 1210–1216 (pre- and post-collisional, grazing neglected). Supports the incoming/outgoing notions; the time formula is this roadmap's, recomputed above. |
| 4.3 | GST2013 line 883 (invariance of the measure, used); DengHaniMa2024 lines 186–187, Proposition 1.2(3). Confirmed. |
| 4.5 | GST2013 lines 875–887: each particle meets at most one other on `[0, δ]`. Confirmed. |
| 5.2 | DengHaniMa2024 lines 182–188 (existence and uniqueness off a null set); GST2013 lines 848–854. Confirmed. |
| 6.1 | GST2013 Lemma 4.1.1, lines 867–874 (notation from line 864). The README's explicit constant is its own; the order `δ²` and the factor `ρ^{d(N−2)}` agree. |
| 6.4 | GST2013 Proposition 4.1.1, lines 862–863, proof 875–910; line 855 cites "[2, Proposition 4.3]" and lines 5439–5440 identify [2]; BGSS2023 lines 132–139; DengHaniMa2024 lines 182–188. Confirmed. |
| 7.1 | GST2013 line 862; BGSS2023 lines 132–139; DengHaniMa2024 lines 173–178 (flow map and flow operator). Confirmed. |
| 7.4 | GST2013 lines 1138–1140, (4.3.5); DengHaniMa2024 lines 175–178, (1.5). Both are the pullback by the inverse-time flow. Confirmed. |
| 7.5 | BGSS2023 lines 158–166; DengHaniMa2024 lines 199–204. Confirmed. |
| 8.3 | GST2013 (4.2.2) lines 929–932, (4.2.3) lines 934–937, boundary condition line 938. Confirmed. |
| 9.1 | GST2013 (2.2.5), lines 489–492. Confirmed. |
| 9.5 | BGSS2023 (1.1.10) lines 267–277, (1.1.9) lines 241–266 with the indicator at line 249, (1.1.11) lines 279–288, inversion lines 229–237; DengHaniMa2024 (1.11) lines 235–244. Confirmed. |
| 9.6 | BGSS2023 (1.1.8), lines 211–217; DengHaniMa2024 (1.12), lines 246–252 (error `O(ε)`). Confirmed. |
| 10.1 | BGSS2023 (1.2.4)–(1.2.5) lines 324–334, (1.2.6) lines 335–340, (1.2.7) lines 352–369. Confirmed. |

Also read for the repairs and §10.4: BGSS2023 lines 267–268, 479–483 and Theorem 1 at lines 316–321; GST2013 Theorem 4 and Remark 3.1.1 at lines 668–696.

### Pinned declarations

Pins: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5` (the checkouts' heads, equal to the plan's baseline). Opened this round, paths relative to each library:

- The four names the repair added: `Mathlib/Topology/MetricSpace/ProperSpace.lean:66` (`secondCountable_of_proper`); `Mathlib/MeasureTheory/Constructions/Polish/Basic.lean:119` (`standardBorel_of_polish`), `:148` (`StandardBorelSpace.prod`), `:154` (`StandardBorelSpace.pi_countable`).
- `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:595`, `:611`; `Mathlib/MeasureTheory/Function/ContinuousMapDense.lean:142` (needs `R1Space`, `WeaklyLocallyCompactSpace`, `μ.Regular`, `p ≠ ∞`); `Mathlib/Probability/Moments/Variance.lean:398` (`IsFiniteMeasure`, `MemLp X 2`); `Mathlib/Data/Nat/Factorial/Basic.lean:367`, `:424`; `Mathlib/MeasureTheory/Constructions/HaarToSphere.lean:88`; `Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:330` (`0 < b`).
- `Mathlib/Probability/Distributions/Gaussian/Multivariate.lean:166`, `Gaussian/Real.lean:47`, `Poisson/Basic.lean:40`; `Mathlib/MeasureTheory/MeasurableSpace/Constructions.lean:871`; `Mathlib/MeasureTheory/Constructions/Pi.lean:732`; `Mathlib/MeasureTheory/Function/Jacobian.lean` (both change-of-variables names); `Mathlib/Analysis/InnerProductSpace/Projection/FiniteDimensional.lean:59`; `Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean:172`, `:231`, `:527`; `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:734`; `Mathlib/MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean:308`.
- `Mathlib/Algebra/Module/ZLattice/Basic.lean:645` (`ZLattice.isAddFundamentalDomain`); `Mathlib/Algebra/Module/ZLattice/Covolume.lean:85`; `Mathlib/MeasureTheory/Group/FundamentalDomain.lean:755` (additive name `addProjection_respects_measure`), `:801`; `Mathlib/MeasureTheory/Measure/Haar/Quotient.lean:75` (fundamental domain of `Γ.op`; additive name used at `Mathlib/MeasureTheory/Integral/IntervalIntegral/Periodic.lean:94`), `:222`; `Mathlib/Analysis/Normed/Group/Quotient.lean:168`, `:222` (needs `IsClosed`); `Mathlib/MeasureTheory/Constructions/Polish/Basic.lean:649`; `Mathlib/Analysis/Fourier/AddCircleMulti.lean:173`.
- `TauCeti/Probability/Distributions/Gaussian/Density.lean:82` (the density formula the README quotes); `TauCeti/Analysis/Semigroups/Group/Basic.lean:74` (fields `map_zero'`, `map_add'` for all real `s, t`, `continuousAt_zero'`; no completeness); `TauCeti/Probability/Process/EmpiricalMeasure.lean:224` (a `ProbabilityMeasure`; the finite measure at `:58` is zero for an empty family); `TauCeti/Dynamics/Flow/OfLipschitz.lean` (`TauCeti.flowOfLipschitz`).

Every name was found. The pinned Mathlib has no `StandardBorelSpace` instance for sigma types; the disjoint union is the supplier's construction (§3.5 item 3) and this roadmap asserts nothing about it at the pin.

### Duplication, ownership and overlap

`scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id and no id that only a revision defines. Object searches over main and the open heads: `FlatPositionSpace` and `HardSphere.` occur nowhere else; hard spheres, Lanford, Boltzmann–Grad and the Boltzmann equation occur only in ClassicalErgodicTheory (as a named consumer of its §3.5 and as out of its scope); "specular" occurs once on main, for chords in a cotangent bundle; flat tori occur as examples elsewhere and IncompressibleFlows works on `UnitAddTorus d`, so the quotient `E ⧸ L` with its Euclidean quotient norm has no other owner. Correlation functions of PointProcesses and RandomMatrices are those of unlabelled point processes, as the scope paragraph says. The 17 names of `scratch/citations.md` are this roadmap's own declarations for the package stage (line 85); its one cross-roadmap lead, MathematicalBilliards §12.3, resolves in the board package `packages/MathematicalBilliards/design/README.md:828` and is named in the scope paragraph only, not as a supplier. StandardDistributions (Layer 5, multivariate distributions) is on main and OneParameterSemigroups is completed; both are cited through pinned Tau Ceti declarations. No second copy of a roadmap on main.

Overlap check: read ClassicalErgodicTheory, PointProcesses, RelativisticQuantumFieldTheory, HamiltonianSystems, ProbabilisticAndMetricNumberTheory, OptimalTransport, RandomMatrices, StochasticCalculus (third list empty), and MathematicalBilliards; conull flows, their disjoint unions and the transport of densities: owner ClassicalErgodicTheory §3.5, cited here; Koopman strong continuity for a finite invariant measure: owner ClassicalErgodicTheory §0.2 and MathematicalBilliards §12.3, not shared (infinite measure here); hard-core point-process densities and correlation measures: owner PointProcesses, not restated; nothing else shared.

### Supplier order

```text
candidate: HardSphereDynamicsAndKineticLimits is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 206 roadmaps, 1896 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The one roadmap supplier is ClassicalErgodicTheory, an open pull request of another author that adds a new roadmap folder, which this roadmap may consume. It is neither on main nor in `merge-order/ORDER.txt`, so the check does not see the edge (the edge count is the same as before the citation was added). I checked the direction by reading: ClassicalErgodicTheory cites nothing of this roadmap and names the hard-sphere flow only as a consumer of its §3.5; its own latest supplier is MathematicalBilliards, the last line of the order. The order is therefore MathematicalBilliards, ClassicalErgodicTheory, HardSphereDynamicsAndKineticLimits, and the merge-order paragraph of the pull request should name ClassicalErgodicTheory. No roadmap of the never-cite list is cited as a supplier (PointProcesses is named only as the owner of a deferred subject).

### Shape and headline theorems

Headings, ten layers each with `### Examples` and `### Dependencies`, API lists and Checks are in the house form; every definition has at least three Checks and every theorem its hypotheses and a locator. Headline theorems named for the package stage: `HardSphere.IsTrajectory.eqOn` (§5.2), `HardSphere.volume_hardCoreSet_diff_goodSet` (§6.4), `HardSphere.flow_add` (§7.1), `HardSphere.measurePreserving_flow` (§7.2), `HardSphere.flow_reversal` (§7.3), `HardSphere.weak_liouville` (§8.2), `HardSphere.grandCanonical_flow_invariant` (§9.4), `HardSphere.lintegral_sum_distinct_eq_correlation` (§9.5), `HardSphere.boltzmannGrad_scaling` (§9.6), `HardSphere.tendsto_empirical_of_correlation` and `HardSphere.LanfordStatement.tendsto_empirical` (§10.5). Each names the roadmap's objects. The padding probe and the `#check` comparison have nothing to run on at this stage.

Remarks that need no change: the parameter η of §4.5 does not enter the domain of the pair map; §7.5 attributes the preservation of `Λ` to item 3, whose "invariance" clause covers it; the Lipschitz hypothesis of §10.4 is the form of BGSS2023 (1.1.5) that needs no derivative.

## Not verifiable

- Alexander1976 Proposition 4.3 and AlexanderThesis1975 Chapter 1: settled uncertified; only the attribution in GST2013 (line 855, lines 5437–5440) was read.
- Lanford1975, CIP1994, Spohn1991, Uchiyama1988: settled uncertified; not read, not requested again.
- Lean elaboration, the one-tactic padding probe and the `#check` comparison: not available (this lane does not elaborate), and there is no `Suggested.lean`.
- The truth of `HardSphere.LanfordStatement` beyond its agreement with BGSS2023 Theorem 1, its equilibrium case and its `t = 0` case: the proof belongs to the BBGKY roadmap and was not reconstructed.
- The dependency check's verdict on the ClassicalErgodicTheory edge: the tool does not see it (above); the direction was checked by reading.
- Ownership against open pull requests was checked through the indexed heads (438 pull requests, index of 2026-11-13) and the board package of MathematicalBilliards; the three board packages listed in the index on other branches were judged by name only.

## Source issues

- **Misprint** in GST2013 at (4.4.1), printed p. 33: the source says the starred velocities are the pre-image of the pair under (4.1.1), the free flow; it should be under the reflection law (4.1.2); affects nothing.
- **Gap** in GST2013 at Proposition 4.1.1, proof, printed p. 28: the source invokes invariance of Lebesgue measure under the partially constructed flow without proving it for the collision step; it should establish the unit Jacobian of the two-body step first; affects the proof.
- **Error** in GST2013 at (4.3.5), printed p. 32: the source says the pullback by the hard-sphere flow maps continuous functions on the phase space to continuous functions; it should require the specular boundary condition or use measurable functions; affects a stated result.
- **Gap** in BGSS2023 at Corollary 1.2.1, proof after (1.2.7), printed p. 5: the source passes from almost-everywhere convergence of the correlation functions to convergence of their integrals; it should invoke conservation of their total mass or a uniform integrable bound; affects the proof.
- **Error** in DengHaniMa2024 at Proposition 1.2(3), printed p. 4: the source says the flow maps are diffeomorphisms off one closed null set; it should say measure-preserving bijections, smooth on the pieces with a fixed collision sequence; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "99ba6d469f0b619a00042bb217eecf088d9ec860", "job": "REV-DESIGN-HardSphereDynamicsAndKineticLimits~5", "model": "fable", "worker": "chris-x26"} -->
