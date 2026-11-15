<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13780#issuecomment-6898088786 -->
Review (claude) of d19786b

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) the corollary of §10.5 leaves `T₀`, the datum and the solution unbound

   **Location.** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:828`: "the empirical measure of the hard-sphere gas on `𝕋^d` started from the grand canonical measure concentrates on the Boltzmann solution for every `t ∈ [0, T₀]`". The plan's API entry of target 10.5 has the same wording.

   **Claim.** `HardSphere.LanfordStatement.tendsto_empirical` is a headline theorem with exact quantifiers.

   **Witness.** `T₀`, `f⁰` and `f` are bound only inside the existentials of `HardSphere.LanfordStatement d` (§10.4): in §10.5 "`[0, T₀]`" and "the Boltzmann solution" have no referent, and "concentrates" is not a statement.

   **Exact repair.** Replace the sentence (and the plan's API statement) by: "Prove the corollary `HardSphere.LanfordStatement.tendsto_empirical`: for `d ≥ 2`, under `HardSphere.LanfordStatement d`, for all `C₀ ≥ 1` and `β₀ > 0` there is `T₀ > 0` such that for every continuous probability density `f⁰` on `𝕋^d × E` satisfying the two bounds of §10.4 there is a mild solution `f` on `[0, T₀]` with datum `f⁰` such that, with `μ_ε = ε^{−(d−1)}`, for every `t ∈ [0, T₀]`, every bounded continuous `h` and every δ > 0, `P_ε(|π^ε_t(h) − ∫ f(t) h| ≥ δ) → 0` as ε → 0⁺." Tested: the weak clause of §10.4 at `n = 1, 2` gives the two hypotheses of `HardSphere.tendsto_empirical_of_correlation` with `f = f(t)` (integrable by its Gaussian bound on the torus of mass 1), and `μ_ε → ∞` for `d ≥ 2`; at `d = 2`, `β₀ = 1`, `C₀ = 1 ≥ 1/(2π) = 0.15915`, `f⁰ = M_{1,0}` it is Check 1 of §10.5; `d = 1` stays excluded (`μ_ε = 1`, limit `1 − e⁻¹ = 0.63212`).

2. **F02** (P3) the scope paragraph on Koopman strong continuity omits the statement on main that allows infinite measures

   **Location.** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:13`: "The strong continuity of the Koopman group (§7.4) is a target here and not a citation: ClassicalErgodicTheory §0.2 assumes a finite invariant measure and MathematicalBilliards §12.3 a probability space".

   **Claim.** The scope section names every neighbouring statement of a kept target and says how the target differs.

   **Witness.** `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md:6363` (main, §4.9a) proves `scalarLpKoopman_strong` for a continuous action, a locally finite measure inner regular on finite-measure sets, `p ≠ ∞`: no finiteness. It covers free transport (`N = 1`); it fails for `N ≥ 2` only because the flow is discontinuous.

   **Exact repair.** After "a probability space" insert: ", and ProbabilisticAndMetricNumberTheory §4.9a (`scalarLpKoopman_strong`) allows infinite measures but assumes a continuous action, which the hard-sphere flow is not for `N ≥ 2` (the velocities jump at collisions; for `N ≤ 1` the flow is free transport and §7.4 is a case of that statement, on real instead of complex `Lp`)". No target changes. Tested on the witness: the head-on state collides at τ = 1, so `T_1 Z` has `v_1 = 0`, while the nearby states `x_1 = (2 + η, 0)`, η > 0, collide at `τ = 1 + η > 1` and still have `v_1 = (−1, 0)` at time 1, so `Z ↦ T_1 Z` is discontinuous at the witness and the cited hypothesis fails; for `N = 1`, `T_t = S_t` is continuous and `μ_X ⊗ vol` is locally finite and regular.

Two findings, both P3; none is P1 or P2. Each carries a repair to apply, so the verdict asks for changes. The three findings of round 8 are repaired. No supplier gap is declared and none is needed.

I edited neither the README, the plan nor the sources manifest, and fetched no source. No maintainer notes were supplied. This is the design lane: there is no `Suggested.lean`, and elaboration is not available (this lane does not elaborate; say so in the report). No Lean command was run.

## Previous findings, checked first

The preceding review is `REV-DESIGN-HardSphereDynamicsAndKineticLimits~8` (F01, F02, F03, all P3); its repair report is `packages/HardSphereDynamicsAndKineticLimits/reports/FIX-DESIGN-HardSphereDynamicsAndKineticLimits~9.md`. Nothing was marked `not actionable in this package`; nothing is re-raised.

| Round-8 finding | Status | Repaired passage and my check |
|---|---|---|
| F01, flat torus against MathematicalBilliards §10.5 | Repaired | Line 11: "MathematicalBilliards §10.5 gives `ℂ/Λ` its translation-surface atlas and directional flows, while §1.3 here gives `E ⧸ L`, in every dimension `d`, its Euclidean quotient norm and its Haar measure of total mass `ZLattice.covolume L` …". At MathematicalBilliards' open head: `### 10.3 Flat area` (Check "Torus `ℂ/Λ`: area = covolume Λ"), `### 10.5 Flat tori` (Check "`Λ = 2ℤ + 2iℤ`: area `4`"); covolume of `2ℤ × 2ℤ` is `2 · 2 = 4`. |
| F02, §1.2 target wording and the ρ = ∞ Check | Repaired | Line 112: "for this instance the short lift `ℓ` of §1.1 is the identity on all of `E`, so that the contact normal `ℓ(x_i − x_j)/ε` … is `(x_i − x_j)/ε` for every ε > 0, and free transport `x + π(t v)` is `x + t v`." Check at line 119 and plan test `infinite_radius`: `π · 100² = 31415.93`; with ρ = 2, `100 < 2` is false and the ball axiom stops at radius 2. The Check uses §1.1 only, so §1.2 has no forward reference. |
| F03, unused η in §4.5 | Repaired | Line 370: "For `i ≠ j`, `R ≥ 0` and `s ≥ 0`, define the pair map `P^{ij}_s` on configurations with `ε ≤ ‖x_i − x_j‖`, `‖x_i − x_j‖ + 2 R s < ρ` and `|v_i|, |v_j| ≤ R`". Line 485: "(a near pair has `ε ≤ ‖x_i − x_j‖`, `‖x_i − x_j‖ + 2Rδ ≤ ε + 4Rδ < ρ` and speeds at most `R`, so it lies in the domain of `P^{ij}_δ`)". Plan 4.5 hypotheses: `0 < ε < ρ`, `i ≠ j`, `R ≥ 0`, `s ≥ 0`; test `others_fixed` has no η. |

Adversarial pass on what the repair changed or added:

- **§4.5 at `R = 0`.** The domain forces `v_i = v_j = 0`, a `λ_N`-null set; `u = 0`, `D = 0 − 0 = 0`, no collision, `B_s(a, 0) = (a, 0)`: the identity. The statement holds.
- **§4.5 lift along the path.** `|u| ≤ |v_i| + |v_j| ≤ 2R` and `|R_q u| = |u|`, so `|a(t)| ≤ |a| + 2Rs < ρ` on `[0, s]`; there `‖π a(t)‖ = |a(t)|`, so contact on the torus is contact of the lift. Torus Check: `π(0.1, 0) − π(0.8, 0) = π(−0.7, 0) = π(0.3, 0)`, `a = (0.3, 0)`, `⟨a, u⟩ = −0.3 < 0`, `D = 0.09`, τ = 0.
- **§6.2 clause.** Near pair: `ε ≤ ‖x_i − x_j‖ ≤ ε + 2Rδ`, so `+ 2Rδ` gives `≤ ε + 4Rδ < ρ`; `|v_i| ≤ |V| ≤ R`. Torus: `0.39 + 0.09 = 0.48 < 0.5`; `0.47 + 0.18 = 0.65 ≥ 0.5`.
- **The repaired patterns elsewhere.** A parameter that neither domain nor conclusion uses: none found on rereading all 45 targets (η of §6.1 sets the shell width; `R` of §6.2–6.3 bounds the speeds and the shell). A target stated over "every statement": none. A neighbouring statement missing from the scope paragraph: one more, R02.

## Verified sound

### Coverage and principles

I read all 872 README lines, the 45 plan targets (170 tests, at least 3 per target, every target with a locator; counted mechanically), every `*Needs:*` line and the 9 manifest entries. `gaps` is empty and no prerequisite is a `gap:`.

- No route-specific shortcut: every `d ≥ 1`, every flat position space, `0 < ε < ρ`; `d ≥ 2` only where `μ_ε → ∞` is used (§10.4, §10.5), with the `d = 1` counterexample as a Check.
- No re-planned roadmap, no upward or cyclic supply, no algorithm, no copied passage, no layer named after a source's chapter, no sentence saying the roadmap follows a source.
- A scan for LaTeX delimiters, pull-request numbers, dates, machine paths, `lemma`, `set_option`, "optional", "deferred", "removed", "so far", "checkpoint", "handoff", round labels and HTML anchors found none (the two hits of the pattern are the inequality `0 < ε` and a book title).
- Shape: the headings are in the house order; ten layers, each with `### Examples` and `### Dependencies`; all 45 numbered sections have at least three Checks and one `*Needs:*` line. Mechanical comparison of the 45 `*Needs:*` lines with the plan's `target:` prerequisites: 0 differences; every prerequisite is an earlier target.
- Manifest: each of the 9 cited works has one entry; I compared the `cited_for` lists of GST2013, BGSS2023 and DengHaniMa2024 with the sections that cite them and found no difference.

### Adversarial table

`E` is Euclidean space. The head-on witness is ε = 1, `x_1 = (2, 0)`, `x_2 = 0`, `v_1 = (−1, 0)`, `v_2 = 0`. Rows cover the fifteen sampled targets, the headline theorems and the targets the findings and repairs touch; every value was recomputed this round.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1 class | `r ≤ ρ` balls; ρ = ∞ | `π(B(a, r)) ⊆ B(πa, r)` by `‖πa‖ ≤ |a|`, `⊇` by the lift axiom; `volume(B(x, r)) = vol(B(0, r))` from injectivity and the measure axiom | Sound | none |
| §1.2 (repaired) | ε = 1, 100; wrong ρ = 2; wrong cover `−id` | `(1, 0)`; `10⁴π = 31415.93`; ρ = 2 fails `100 < 2`; `−id` gives `(−1, 0)` and `(−2, 0)` | Sound | none |
| §1.3 flat tori (sampled) | unit torus; `2ℤ × ℤ`; `B(0, 1/2)`; injectivity | `|(1/2, 1/2)| = 0.70711`; covolume 2, shortest vector `e_2`, ρ = 1/2; `π/16 = 0.19635` against `π/32 = 0.09817`; density `π/4 = 0.7854 < 1`; `a, b ∈ B(0, ρ)`, `a − b ∈ L`, `|a − b| < 2ρ` forces `a = b` | Sound | none |
| §1.4 | shell; circle beyond ρ; packing | `π(1.21 − 1) = 0.65973`; arcs of total length 0.2 against `2 · 0.2 = 0.4`; `1/(0.04π) = 7.9577`, so `N ≤ 7` | Sound | none |
| §2.1 | oblique; head-on; reflection | `c = ⟨(−0.9, 0.9), (1, 0)⟩ = −0.9`, image `((0.9, 0.9), 0)`, energies `0.81 + 0.81 = 1.62`; `c = 2`, image `((−1, 0), (1, 0))`; `σ = id − c·(ν, −ν)` with `|(ν, −ν)|² = 2`: the reflection, det −1 | Sound | none |
| §2.2 | d = 1, 2, 3; Θ | `∫_B ⟨e, x⟩_+ = ½ ω_{d−1}(1 − (d − 1)/(d + 1)) = ω_{d−1}/(d + 1)`; values 1, 2, π; kernel under Θ: `(w' − v')·(−ω) = (−0.9)(−1) = 0.9 = (w − v)·ω` | Sound | none |
| §3.3 contact scattering and reversal (sampled) | outgoing contact; involutions | `c = 1`, `σ_M V = (0, (1, 0))`, `ℛ = (X, (0, (−1, 0)))`, `⟨0 − (−1, 0), (1, 0)⟩ = 1 > 0`; `ℛ² = (X, σ_M σ_M V) = id` by linearity | Sound | none |
| §4.1 | head-on; grazing; miss | `D = 4 − 3 = 1`, τ = 1, `⟨q, u⟩ = −1`; `a = (1, 3)`: `D = 9 − 9 = 0`, τ = 3; `a = (2, 3)`: `D = 9 − 12 = −3` | Sound | none |
| §4.2 | oblique; reversal | `D = 9 − 8.36 = 0.64`, τ = 2.2, `q = (0.8, 0.6)`, `R_q u = (−1 + 1.28, 0.96) = (0.28, 0.96)`; reversed: `⟨q, −R_q u⟩ = −√D < 0`, `R_q(−R_q u) = −u`, `q − τu = a` | Sound | none |
| §4.3 | explicit `DC` at the head-on point; d = 1 | `dτ = da_1 + du_1`, `dq = (0, da_2 + du_2)`, `dU' = (−du_1, 2da_2 + 3du_2)`, `dY = (−da_1, −da_2 − 2du_2)`; det `(−1)(−1)(−3 + 4) = 1`; d = 1: `(2 − a, −u)`, det 1; variable time `(1 − 0.7u, −u)`, det 0 | Sound | none |
| §4.4 measure preservation (sampled) | injectivity across the pieces; inelastic rule | `a = (4, 0)`, `s = 4`: `B_4 = ((2, 0), (1, 0))`; the free candidate `(−2, 0), (1, 0)` has `D = 4 − 3 = 1`, τ = 1 ≤ 4, so it collides and is not in the free piece: images disjoint; inelastic image of dimension `(d − 1) + (d − 1) + 1 = 2d − 1` | Sound | none |
| §4.5 (repaired) | head-on `s = 3`; `N = 3`, d = 1; `R = 0` | `u' = (1, 0)`, `v_2' = (w − u')/2 = (−1, 0)`, `x_2 = (−2, 0)`, `x_1 = x_2 + (3, 0) = (1, 0)`; `a = −2`, `u = 0`: `0, 2, 20 ↦ 0.1, 2.1, 20`; `R = 0`: identity on a null domain | Sound | none |
| §5.2 uniqueness (headline) | forward at the supremum `s*` of agreement; backward at the infimum | positions continuous, left limits agree, `V(s*) = σ_M V(s*−)` agree, then right-continuity and local constancy; backward: `V(s*)` is the right limit, `V(s*−) = σ_M V(s*)` | Sound | none |
| §5.3 | reversed head-on | at −3: `(1, 0)`, `(−2, 0)`, velocities `0`, `(1, 0)`; contact when `x_2 = 0`, time −1; at 0: `(2, 0)`, `0` with `(1, 0)`, `0` | Sound | none |
| §5.5 good configurations (sampled) | `N = 2` on `E`, every case of `(|a|, ⟨a, u⟩, D)` | `|a| = ε`, `⟨a, u⟩ > 0`: backward `|a − sR_a u|² = ε² + 2s⟨a, u⟩ + s²|u|²`, increasing: good; `⟨a, u⟩ ≤ 0`: bad (includes `u = 0` at contact, grazing); `|a| > ε`: bad exactly when `u ≠ 0`, `D = 0` (tangency at time `−⟨a, u⟩/|u|² ≠ 0`); `u = 0` static: good | Sound | none |
| §6.1 | `N = 2`; `N = 3` | `I = ∅`; triples `≤ N³`, two shells of measure `ω_d((ε + η)^d − ε^d)`, `N − 2` free positions | Sound | none |
| §6.2 short time steps (sampled) | third particle; torus; blocks | `i` near `j`: `k` is farther than `ε + 2Rδ` from both, relative speed `≤ √2|V| ≤ 2R`, so distance stays `> ε` on `[0, δ]`; `0.47 + 0.18 = 0.65`; `0.39 + 0.09 = 0.48`; `|V| = √(4 · 0.01) = 0.2`, images `0.1, 2.1, 20.1, 22.1` | Sound | none |
| §6.3 | step count; `N = 2` constant | `⌈t/δ⌉ ≤ (t + 1)/δ` for `δ ≤ 1`; `8 · (12π)² · π²/2 = 576π⁴ = 56107.6`; grazing state `D = 4 − 4 = 0` | Sound | none |
| §6.4 Alexander's theorem (headline) | "exactly the union over `m`, `R`"; gluing at 0 | on a trajectory on `[0, t]` the second-smallest distance from each particle is continuous and `> ε` (contacts form a matching), so its minimum is `ε + γ`, γ > 0, and `m` with `2Rt/m < γ` passes; `ℛℛZ = Z` glues the backward half | Sound | none |
| §7.1 the flow (sampled, headline) | head-on `T_3`; grazing state; no-contact case | `((1, 0), (−2, 0); 0, (−1, 0))`; `a = (2, 1)`: `D = 4 − (5 − 1) = 0`, tangent at `(0, 1)` at time 2, so `T_1 Z = Z` while `S_1 Z` has `x_1 = (1, 1)`; with no contact `σ_∅ = id`, so `V` is continuous and constant | Sound | none |
| §7.2 measure preservation (sampled, headline) | countable cover by step-pieces; carriers | `T_t` injective on `G` and measure preserving on each piece, hence on `G`; `𝒟̄ᶜ = {|x_1 − x_2| < 1}` has measure ∞ on `E`; `N = 8`, ε = 0.4: `8 · 0.12566 = 1.0053 > 1`, `𝒟̄ = ∅` | Sound | none |
| §7.3 (headline) | `ℛ T_3` against `T_{−3} ℛ`; boost of the grazing state | both `((1, 0), (−2, 0); 0, (1, 0))`; boosted relative data unchanged, formula would give `(3, 1)`, `(1, 0)` | Sound | none |
| §7.4 | `p ≠ 2` comparison; circle `N = 3` | support of `U_t f − f` has measure `≤ 2μ(supp f)`; `‖g‖_p^p ≤ ‖g‖_∞^{p−2}‖g‖_2²` for `p > 2`; gaps sum to 1, each `≥ 1/3`, so all `1/3`: `q_3 = 0` | Sound | R02 for the scope clause |
| §7.5 grand canonical phase space (sampled) | `N = 0, 1`; `N ≥ 8` | mass `1/0! = 1`; weight `1/1! = 1`; null by the packing bound | Sound | none |
| §8.2 weak Liouville (headline) | `χ(t)ψ(H)`; the d = 1 box | `(∫_0^∞ χ' + χ(0))∫W⁰ψ(H) = 0`; τ ∈ `(0.99/1.04, 1.01/0.96) = (0.95192, 1.05208)`; `H ∈ (0.4802, 0.5204)`; defect `χ(τ)(v_1 − v_1')`, integral `−1 − 0 = −1` | Sound | none |
| §8.4 symmetric expectations (sampled) | `s = 2`, `N = 3`; `s > N`; unnormalised | `3 · 2 = 6` injective maps of 9; `Nat.descFactorial 1 2 = 0` against `1!/0! = 1`; mass `2e⁻² = 0.27067` on both sides | Sound | none |
| §9.1 Maxwellians (sampled) | d = 1; d = 3; covariance `β⁻¹ • 1` | `1/√(2π) = 0.39894`; `(2π)^{3/2} = 15.7496`; `(2π)^{−d/2}(β^{−d})^{−1/2} = (β/2π)^{d/2}` in the pinned density | Sound | none |
| §9.2 canonical ensembles (sampled) | exponent; `N = 1`; `E` | `Σ|v_i − u|² = 2H − 2⟨u, P⟩ + N|u|²`; `Z^{can} = 1`; mass `∞ · 1` | Sound | none |
| §9.3 grand canonical measures (sampled) | ε = 0, μ = 2; `f⁰ = 0`; bounds | `Z = e²`, `P(N = 1) = 2e⁻² = 0.27067`; `Z = 1`; `1 + μ∫f⁰ ≤ Z ≤ Σ(μ∫f⁰)^N/N!` | Sound | none |
| §9.4 invariance (sampled, headline) | `c M_{β,u}`; indicator profile; `ρ(x) = 1 + 0.5cos(2πx)` | component density `(μc)^N/(N!Z) · Π M`, a function of `H`, `P`; `|(0.9, 0.9)| = 1.2728 > 1`; `ρ(0) = 1.5`, `ρ(−1/4) = 1` | Sound | none |
| §9.5 correlation identity (headline) | resummation; inversion; circle bound | `(1/N!) · N!/(N − n)! = 1/p!`; `Σ_{p+q=m} (−1)^p/(p!q!) = (1 − 1)^m/m!`, only `m = 0` survives; `0.8√(2π) = 2.00530 ≤ 2.50663` | Sound | none |
| §9.6 chaos and scaling (sampled, headline) | factorisation; union bound; d = 3 | `F_n(0) = (f⁰)^{⊗n}1_{𝒟̄_n} · Z⁻¹Σ_p(μ^p/p!)∫Πf⁰ 1[admissible, none within ε of X_n]`; `1 − p_ε ≤ μ∫_{∪B(x_i, ε)} f⁰ ≤ nμω_dε^d‖ρ⁰‖_∞`; `μ_εω_dε^d = ω_dε`, `(4π/3)(0.01) = 0.0418879` | Sound | none |
| §10.1 | second moment | `μ⁻²(μ∫F_1h² + μ²∫F_2 h⊗h)` | Sound | none |
| §10.2 | loss term; β = 0 | `ω_2 = π`, `√(8/π) = 1.59577`; `c = −r/√2`, `v' = (r/2)(1, 1)`, `w' = (r/2)(1, −1)`, speeds `r/√2` | Sound | none |
| §10.4 Lanford's statement | hypotheses against BGSS2023 (1.1.5); weak clause | Lipschitz bound gives `|f⁰| + |∇_x f⁰| ≤ 2C₀e^{−β₀|v|²/2}` a.e.; masses `∫F_n(t) = ∫F_n(0) → 1 = (∫f(t))^n`, so a.e. convergence gives `L¹` convergence | Consistent with BGSS2023 lines 316–321 | none |
| §10.5 law of large numbers (sampled, headlines) | second moment; d = 1; corollary | `0 + m² − 2m² + m² = 0`; `1 − e⁻¹ = 0.63212`; `F_2 → 2f⊗f` gives `m²`; corollary: `T₀`, `f` unbound | First theorem sound; corollary wording | R01 |

### Seeded source sample

I opened the three readable texts at every locator of the fifteen sampled targets. The author flagged no locator as unverified.

| Target | Text opened and result |
|---|---|
| 1.3 | BGSS2023 lines 119–142: the torus setting and the phase space. Confirmed; the construction of `E ⧸ L` is the roadmap's. |
| 3.3 | GST2013 lines 1219–1227: the pre-image of a post-collisional pair, (4.4.1). Confirmed. |
| 4.4 | GST2013 line 883 (invariance of the measure under the flow, used); DengHaniMa2024 Proposition 1.2(3), lines 186–187. Confirmed as "statement used". |
| 5.5 | GST2013 lines 851–854: pathological trajectories. Confirmed. |
| 6.2 | GST2013 lines 875–887: one encounter per particle in a step, non-grazing. Confirmed. |
| 7.1 | GST2013 line 862 (Proposition 4.1.1); BGSS2023 lines 132–139; DengHaniMa2024 lines 173–178 ((1.4)–(1.5)). Confirmed. |
| 7.2 | GST2013 line 883; DengHaniMa2024 line 186. Confirmed. |
| 7.5 | BGSS2023 lines 158–166; DengHaniMa2024 lines 199–204. Confirmed. |
| 8.4 | BGSS2023 (1.1.9), lines 241–266, the indicator at line 249, printed p. 3 (the page begins at line 195). Confirmed. |
| 9.1 | GST2013 (2.2.5), lines 489–492, with `θ = 1/β` and density 1. Confirmed. |
| 9.2 | BGSS2023 lines 158–160, printed p. 2 (the page begins at line 143). Confirmed. |
| 9.3 | BGSS2023 (1.1.5)–(1.1.6), lines 167–181 (`C₀ ≥ 1` at line 168); DengHaniMa2024 Definition 1.3, lines 199–223. Confirmed. |
| 9.4 | BGSS2023 lines 267–268, 479–483 and 3539. Confirmed. |
| 9.6 | BGSS2023 (1.1.8), lines 211–217; DengHaniMa2024 (1.12), lines 246–252. Confirmed; the two-sided bound is the roadmap's. |
| 10.5 | BGSS2023 Corollary 1.2.1, lines 344–349, proof lines 352–371. Confirmed; the source takes smooth `h` and a strict inequality, the roadmap proves its own form from its own hypotheses. |

Also read: GST2013 lines 45–110 (contents), 826–912, 1206–1230; BGSS2023 lines 112–290, 312–372; DengHaniMa2024 lines 134–256.

### Pinned declarations

Pins: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5` (the manifest of the content repository and the plan's baseline agree). Opened this round, paths relative to each library:

- `Mathlib/MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean:308` (`EuclideanSpace.volume_ball`, with `[Nonempty ι]`, hence `d ≥ 1`); `Mathlib/Analysis/Normed/Group/Quotient.lean:222` (`instNormedCommGroup`, `[IsClosed]`, additive by `to_additive`); `Mathlib/Topology/Algebra/OpenSubgroup.lean:377` (`[T1Space]`); `Mathlib/MeasureTheory/Constructions/Polish/Basic.lean:119`, `:154`, `:649` (`QuotientGroup.borelSpace`, `[N.Normal] [IsClosed]`); `Mathlib/Topology/MetricSpace/ProperSpace.lean:66`.
- `Mathlib/Algebra/Module/ZLattice/Basic.lean:645` (`ZLattice.isAddFundamentalDomain`, `[DiscreteTopology L] [IsZLattice ℝ L]`); `Mathlib/Algebra/Module/ZLattice/Covolume.lean:85`; `Mathlib/MeasureTheory/Group/FundamentalDomain.lean:754` (`to_additive addProjection_respects_measure`), `:801`; `Mathlib/MeasureTheory/Measure/Haar/Quotient.lean:75` (fundamental domain of `Γ.op`), `:222` (`[LocallyCompactSpace G]`, `HasFundamentalDomain Γ.op G ν`, `[IsFiniteMeasure μ]`); `Mathlib/Topology/Instances/AddCircle/Real.lean:55`; `Mathlib/Analysis/Fourier/AddCircleMulti.lean:173`.
- `Mathlib/MeasureTheory/Function/Jacobian.lean:1184` (`HasFDerivWithinAt`, `InjOn`); `Mathlib/Analysis/InnerProductSpace/Projection/FiniteDimensional.lean:59`; `Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean:172`, `:231` (`det f ≠ 0`), `:527` (`[Nontrivial E]`); `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:734`; `Mathlib/MeasureTheory/Constructions/HaarToSphere.lean:88`.
- `Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:330` (`0 < b`); `Mathlib/Probability/Distributions/Gaussian/Multivariate.lean:166`; `Mathlib/Probability/Distributions/Poisson/Basic.lean:40` (`r : ℝ≥0`); `Mathlib/MeasureTheory/Function/ContinuousMapDense.lean:142` (`[R1Space] [WeaklyLocallyCompactSpace] [μ.Regular]`, `p ≠ ∞`, in a `NormalSpace`); `Mathlib/MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean:1140` (`ContinuousOn f (Icc a b)`, derivative on `Ioo`); `Mathlib/Probability/Moments/Variance.lean:398` (`[IsFiniteMeasure μ]`, `MemLp X 2 μ`); `Mathlib/Data/Nat/Factorial/Basic.lean:367`; `Mathlib/MeasureTheory/MeasurableSpace/Constructions.lean:871`; `Mathlib/Dynamics/Flow.lean:85`.
- `TauCeti/Probability/Distributions/Gaussian/Density.lean:82`, `:265` (`S.PosDef`); `TauCeti/Analysis/Semigroups/Group/Basic.lean:74` (`map_zero'`, `map_add'` for all real `s, t`, `continuousAt_zero'`); `TauCeti/Probability/Process/EmpiricalMeasure.lean:224` (a `ProbabilityMeasure`); `TauCeti/Dynamics/Flow/OfLipschitz.lean:59` (a `Flow ℝ E`, `[CompleteSpace E]`).

The remaining names of the supplier contracts (`lintegral_abs_det_fderiv_eq_addHaar_image`, `measurePreserving_piCongrLeft`, `Lp.norm_compMeasurePreserving`, `descFactorial_eq_div`, `standardBorel_of_polish`, `gaussianPDFReal`, `Measure.sum`) were located by name at the pin. Every name exists with the hypotheses the contract states.

### Duplication, ownership and overlap

`scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id, no id that only a revision defines and no second copy; the folder is not on main and is not one of the two board packages on other branches (AnalyticNumberTheory, LawrenceVenkateshMethod). Object searches over main and the open heads (`roadmaps grep`, index of 2026-11-15):

- "hard sphere": ClassicalErgodicTheory (3 lines: outside its scope, a consumer of its §3.5) and MathematicalBilliards (1 downstream remark). Nothing else.
- Lanford, BBGKY, Maxwellian, grand canonical, Boltzmann–Grad, "Boltzmann equation", "collision operator", `FlatPositionSpace`, `FlatTorus`, `HardSphere.`: no match on main or in any open pull request.
- Flat tori: MathematicalBilliards §10.5 (named in the scope paragraph since round 8); on main only examples in the Riemannian-geometry roadmaps. No roadmap owns `E ⧸ L` with its quotient norm and Haar measure.
- Koopman strong continuity: ClassicalErgodicTheory §0.2 (finite invariant measure, read at its head), MathematicalBilliards §12.3 (probability space, `p = 2`, read at its head), and ProbabilisticAndMetricNumberTheory §4.9a on main (continuous actions; R02).
- Correlation functions and empirical measures: PointProcesses, the statistics roadmaps and Equidistribution state them for unlabelled point measures or samples; the objects here are formulas on labelled configurations with the `μ^{−n}` and `μ^{−1}` rescalings, and the empirical probability measure is cited from Tau Ceti.

The one cross-roadmap supplier, ClassicalErgodicTheory §3.5, read at the head of its open pull request: heading "Flows defined almost everywhere"; a standard Borel space and a σ-finite measure; item 1 conull flows with the identity extension; item 3 disjoint unions with "invariant iff each component restriction is"; item 4 `(Φ t)_* ν = μ.withDensity (W ∘ Φ (-t))`. The contract at README lines 73–79 says the same. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name unresolved. No roadmap of the never-cite list is cited as a supplier (PointProcesses is named only as the owner of a deferred subject).

Overlap check: read ClassicalErgodicTheory, MathematicalBilliards and ProbabilisticAndMetricNumberTheory (the cited sections and scope), and searched PointProcesses, RelativisticQuantumFieldTheory, HamiltonianSystems, OptimalTransport, RandomMatrices and StochasticCalculus for the objects above (third list empty); conull flows, their disjoint unions and the transport of densities: owner ClassicalErgodicTheory §3.5, cited here; the translation-surface structure of `ℂ/Λ`: owner MathematicalBilliards §10.5, not restated; Koopman strong continuity for finite measures or continuous actions: owners ClassicalErgodicTheory §0.2, MathematicalBilliards §12.3 and ProbabilisticAndMetricNumberTheory §4.9a, not shared for `N ≥ 2` (infinite measure and a discontinuous flow here; R02 adds the clause); nothing else shared.

### Supplier order

```text
candidate: HardSphereDynamicsAndKineticLimits is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2241 edges, 0 problem(s)
```

No UPWARD or CYCLE line. ClassicalErgodicTheory is another author's open pull request that adds a new roadmap folder, which this roadmap may consume; it is not in `merge-order/ORDER.txt`, so the check does not see the edge. By reading: ClassicalErgodicTheory cites nothing of this roadmap and names the hard-sphere flow only as a consumer; its own supplier MathematicalBilliards is the last line of the order. The order is MathematicalBilliards, ClassicalErgodicTheory, HardSphereDynamicsAndKineticLimits.

### Headline theorems

Named for the package stage: `HardSphere.IsTrajectory.eqOn` (§5.2), `HardSphere.volume_hardCoreSet_diff_goodSet` (§6.4), `HardSphere.flow_add` (§7.1), `HardSphere.measurePreserving_flow` (§7.2), `HardSphere.flow_reversal` (§7.3), `HardSphere.weak_liouville` (§8.2), `HardSphere.grandCanonical_flow_invariant` (§9.4), `HardSphere.lintegral_sum_distinct_eq_correlation` (§9.5), `HardSphere.boltzmannGrad_scaling` (§9.6), `HardSphere.tendsto_empirical_of_correlation` and `HardSphere.LanfordStatement.tendsto_empirical` (§10.5). Each names the roadmap's objects. The padding probe and the `#check` comparison have nothing to run on at this stage.

Remarks that need no change:

- §10.5's route ends with `ProbabilityTheory.meas_ge_le_variance_div_sq`, which is centred at the mean; the second moment about `∫ f h` gives the conclusion directly by Markov's inequality. A route, not a statement.
- §4.2's semigroup law also holds at incoming contact states (`B_0 = (a, R_a u)`, then free motion); stating it off them is weaker, not wrong.
- §9.5's Check "`ε = 0`, `∫ f⁰ = 1`: `F_n(0) = (f⁰)^{⊗n}`" holds for every finite `∫ f⁰`, since `e^{μ∫f⁰}/Z = 1`.

### Copyright, licences and scope

- **Wording.** Beside the fifteen sampled locators I compared seven further passages with the source text: §5.5's sentence on pathological trajectories with GST2013 lines 851–863; the Summary's and §10.5's sentence on the law of large numbers with BGSS2023 lines 341–343; §10.4 with BGSS2023 lines 316–321; §9.3's exchangeability and conditional i.i.d. statement with BGSS2023 lines 184–187; §6.4's route with GST2013 lines 898–910; §5.4 with DengHaniMa2024 lines 164–166; §9.6 with DengHaniMa2024 lines 246–252. The longest shared run is four words ("leading to a pathological", GST2013 line 862, a term of art). No sentence follows a source clause by clause.
- **Arrangement.** GST2013 has the largest share, 45 of the 106 source citations in the layers (BGSS2023 39, DengHaniMa2024 20, others 2). Its contents (lines 45–110): Chapter 1 the low density limit, Chapter 2 the Boltzmann equation, Chapter 3 main results, Chapter 4 the `N`-particle flow, the Liouville equation and the hierarchies, Chapters 5–7 estimates and convergence. Layers 1–4 have no counterpart there; Layers 5–7 expand its §4.1; the collision operator, in the source's Chapter 2, is in Layer 10. No run of layers maps one to one onto a run of its chapters or sections. The order of Layers 7 to 10 is forced: §8.1 needs §7.2, §9.5 needs §8.1 and §8.4, §10.1 needs §9.5.
- **Reuse.** No table, figure, list of examples or numerical data is taken from a source; the worked examples and non-examples are the roadmap's own.

Source independence: 22 passages compared with 3 sources, none shared; largest share GST2013, 45 of 106 locators; contents compared with GST2013: independent.

## Not verifiable

- Alexander1976 Proposition 4.3 and AlexanderThesis1975 Chapter 1: settled uncertified; only the attribution in GST2013 (line 855) was read.
- Lanford1975, CIP1994, Spohn1991, Uchiyama1988: settled uncertified; not read, not requested again.
- Lean elaboration, the one-tactic padding probe and the `#check` comparison: not available (this lane does not elaborate), and there is no `Suggested.lean`.
- The truth of `HardSphere.LanfordStatement` beyond its agreement with BGSS2023 Theorem 1, its `t = 0` case and its equilibrium case: the proof belongs to a later roadmap and was not reconstructed.
- The dependency check's verdict on the ClassicalErgodicTheory edge: the tool does not see it; the direction was checked by reading.
- Ownership against open pull requests was checked through the indexed heads (index of 2026-11-15). The two board packages on other branches (AnalyticNumberTheory, LawrenceVenkateshMethod) were not opened; neither is in this subject.

## Source issues

- **Misprint** in GST2013 at (4.4.1), printed p. 33: the source says the starred velocities are the pre-image of the pair under (4.1.1), the free flow; it should be under the reflection law (4.1.2); affects nothing.
- **Gap** in GST2013 at Proposition 4.1.1, proof, printed p. 28: the source invokes invariance of Lebesgue measure under the partially constructed flow without proving it for the collision step; it should establish the unit Jacobian of the two-body step first; affects the proof.
- **Error** in DengHaniMa2024 at Proposition 1.2(3), printed p. 4: the source says the flow maps are diffeomorphisms off one closed null set; it should say measure-preserving bijections, smooth where the collision sequence up to that time is locally constant; affects a stated result.

## For the human reviewers

- Supplier: ClassicalErgodicTheory is another author's open pull request and is not in the merge order. The item numbers of its §3.5 are fixed only when it merges.
- Scope: `HardSphere.LanfordStatement` (README §10.4) is a proposition whose proof is left to a roadmap on the BBGKY hierarchy; searches for "BBGKY" and "Lanford" found no such roadmap on main or open.
- Licence: the three texts read are arXiv copies. Six cited works are recorded `uncertified` in `sources.toml` and were not read.
- Scope: BGSS2023 is Ann. of Math. 198 and GST2013 an EMS monograph. DengHaniMa2024 is cited in its arXiv version (v3); I did not check whether it has appeared.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d19786bb9e1f18d701b55d5400a8da19e07df9f9", "job": "REV-DESIGN-HardSphereDynamicsAndKineticLimits~9", "model": "fable", "worker": "chris-x30"} -->
