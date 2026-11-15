<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13780#issuecomment-6897437629 -->
Review (claude) of 1b7bc36

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) the scope paragraph does not say how the flat torus differs from MathematicalBilliards §10.5

   **Location.** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:11`: "Complex tori as complex Lie groups are owned by ComplexTori; the real flat torus here carries a metric and a measure, not a complex structure."

   **Claim.** The scope section names every roadmap that states a neighbouring form of an object kept here, with the difference in one clause.

   **Witness.** MathematicalBilliards (open, last line of the merge order) has `### 10.5 Flat tori`: `ℂ/Λ` is a translation surface with `Σ = ∅`, Check "`Λ = 2ℤ + 2iℤ`: area `4`". The scope paragraph here does not name it.

   **Exact repair.** After the ComplexTori sentence add: "MathematicalBilliards §10.5 gives `ℂ/Λ` its translation-surface atlas and directional flows; §1.3 here gives `E ⧸ L`, in every dimension `d`, its quotient norm and Haar measure, and neither structure is restated in the other roadmap." No target changes. Tested on the witness: for `Λ = 2ℤ + 2iℤ` the area 4 of MathematicalBilliards and the total mass `ZLattice.covolume = 4` of §1.3 agree, and the two sections state different structures (an atlas there, a norm and a `MeasureSpace` instance here), so neither is deleted.

2. **F02** (P3) §1.2 states its target as "every statement of this roadmap specialises", and no Check pins ρ = ∞

   **Location.** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:112`: "Prove that every statement of this roadmap specialises on `E` to the formula with `ℓ = id`, so that `ν_ij = (x_i − x_j)/ε`."

   **Claim.** §1.2 is a target with exact quantifiers, and its Checks tell the instance from a wrong one.

   **Witness.** The plan's statement of 1.2 is the precise one ("on E the short lift is the identity and contact normals are (x_i − x_j)/ε"). The instance `π = id`, `ρ = 2` passes all three Checks: normal `(1, 0)` at ε = 1 < 2, `4π/3`, `(2, 0)`.

   **Exact repair.** Replace the sentence by: "Prove that for this instance the short lift is the identity on all of `E`, so that `ν_ij = (x_i − x_j)/ε` for every ε > 0 and `x + π(t v) = x + t v`." Add a Check, and the same plan test: "The radius is infinite: at ε = 100 the positions `(100, 0)` and `0` are in contact with `ν = (1, 0)`, and the shell `99 ≤ |y| ≤ 100` in d = 2 has area `π(100² − 99²) = 199π ≈ 625.18` by §1.4; an instance with a finite radius, such as ρ = 2, would allow neither." Tested on the witness: with ρ = 2 the condition `ε < ρ` fails at ε = 100 and §1.4's hypothesis `r₂ < ρ` fails at `r₂ = 100`, so the new Check separates the two instances.

3. **F03** (P3) the parameter η of §4.5 is not used

   **Location.** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:369`: "For `i ≠ j`, `η > 0` with `ε + η < ρ`, and `s ≥ 0` with `2 R s ≤ η`, define the pair map `P^{ij}_s` on configurations with `ε ≤ ‖x_i − x_j‖`, `‖x_i − x_j‖ + 2 R s < ρ`".

   **Claim.** The pair map and its measure preservation need η.

   **Witness.** The domain already gives `ε + 2Rs ≤ ‖x_i − x_j‖ + 2Rs < ρ`; take `η = 2Rs`. On `E` (ρ = ∞), Check 4 holds for every η > 0: positions `0, 2, 20` go to `0.1, 2.1, 20` with η = 4 or η = 2.

   **Exact repair.** In §4.5 write "For `i ≠ j`, `R > 0` and `s ≥ 0`, define the pair map `P^{ij}_s` on configurations with …" (the domain unchanged); delete "`η = 4`" from Check 4; in §6.2 replace "(taken with `η = 4Rδ`: a near pair has … so it lies in the domain of `P^{ij}_δ`)" by "(a near pair has `‖x_i − x_j‖ + 2Rδ ≤ ε + 4Rδ < ρ`, so it lies in the domain of `P^{ij}_δ`)"; in plan 4.5 drop the hypotheses "ε + η < ρ" and "2Rs ≤ η" and "η = 4" from the test `others_fixed`. Tested on §6.2's torus Check: ε = 0.3, `R = 1`, δ = 0.045, near pairs at distance at most 0.39, `0.39 + 0.09 = 0.48 < ρ = 0.5`, in the domain with no η; at δ = 0.09, `0.47 + 0.18 = 0.65 ≥ 0.5`, outside it, as the Check says.

Three findings, all P3; none is P1 or P2. Each carries a repair, so the verdict asks for changes. The three findings of the previous round are repaired. No supplier gap is declared and none is needed.

I edited neither the README, the plan nor the sources manifest, and fetched no source. No maintainer notes were supplied. This is the design lane: there is no `Suggested.lean`, and elaboration is not available (this lane does not elaborate; say so in the report). No Lean command was run.

## Previous findings, checked first

The preceding review is `REV-DESIGN-HardSphereDynamicsAndKineticLimits~7` (F01, F02, F03, all P3); its repair report is `packages/HardSphereDynamicsAndKineticLimits/reports/FIX-DESIGN-HardSphereDynamicsAndKineticLimits~8.md`. Nothing was marked `not actionable in this package`; nothing is re-raised.

| Round-7 finding | Status | Repaired passage and my check |
|---|---|---|
| F01, §6.3 Check "the bound is 0" for `N = 2` | Repaired | Line 505: "For `N = 2` the set `F` is null but not empty, and the bound is not sharp." Recomputed: `C₁ = 8 · (12π)² · π²/2 = 576π⁴ = 56107.636`; the state `x_1 = (2, 1)`, `v_1 = (−1, 0)` has `D = 4 − 1·(5 − 1) = 0`, τ = 2 > δ = 1 (passes step 0); after the free step `a = (1, 1)`, `D = 1 − (2 − 1) = 0`, τ = 1 ≤ δ (fails step 1, and `1 < t/δ = 3`); `|x_1| = 2.236 < 3`. Plan test `two_body` says the same. |
| F02, §5.5 Check on an incoming state "of §5.2" | Repaired | Line 455: "the incoming contact state `x_1 = (1, 0)`, `x_2 = 0`, `v_1 = (−1, 0)`, `v_2 = 0` (the Scattering witness of the Conventions …) is not in `G`". Recomputed: `c = ⟨(−1, 0), (1, 0)⟩ = −1`, image `(0, (−1, 0))`, sign `⟨(1, 0), (1, 0)⟩ = +1`; it is the head-on witness at time 1, `x_1 = (2, 0) − (1, 0)`. |
| F03, `*Needs:*` lines omitting a defining section | Repaired | §5.1 "§3.1–3.5" (line 407); §8.2 "§1.2, §3.3–3.5, §7.1, §8.1" (line 634); §8.3 "§3.1–3.3" (line 647); §9.5 "§7.3, §7.5, §8.1, §8.4, §9.3" (line 742). The seven further places of the repair report are as it says (lines 153, 227, 246, 283, 296, 446, 616). Mechanical comparison of all 45 `*Needs:*` lines with the plan's `target:` prerequisites: 0 differences; every prerequisite is an earlier target. |

Adversarial pass on what the repair changed or added:

- **§1.4 reworded, §3.1 packing bullet.** Balls of radius `ε/2 ≤ ρ` about points at pairwise distance `≥ ε` are disjoint, each of volume `ω_d (ε/2)^d` (§1.1), so `N ω_d (ε/2)^d ≤ μ_X(X)`. Unit torus, d = 2, ε = 0.4: `1/(0.04π) = 7.9577`, so `N ≥ 8` is impossible. Unit circle: ε = 1.5 gives threshold `1/(2 · 0.75) = 2/3 < 1` with `𝒟̄_1` everything, so `ε ≤ 2ρ` is needed; ε = 1 gives threshold 1 and `𝒟̄_2 = ∅` (largest distance 1/2).
- **§3.3 without the conservation clause, §3.5 with `ℛ`.** `σ_M((1, 0), 0) = (0, (1, 0))` (`c = 1`); `ℛ` gives `(0, (−1, 0))`, `P = (−1, 0)`, `H = ½`; `⟨0 − (−1, 0), (1, 0)⟩ = 1`, outgoing again. §3.5 follows §3.3 and §3.4, so no forward reference remains.
- **§8.3, specular inheritance written out.** For `Z_s` with contact matching `M`, the configurations `(Z_s, z_{s+1}, …, z_N)` of `𝒟̄_N` with a further contact are null in the integration variables; elsewhere the matching is `M` and `σ_M` moves only the first `s` velocities, so the integrands agree almost everywhere. Check: `e^{−1.62} = 0.19790` against 0 at `|(0.9, 0.9)| = 1.2728 > 1`.
- **§10.4 without the law-of-large-numbers bullet.** §10.5 states `HardSphere.LanfordStatement.tendsto_empirical` and lists §10.4 in its `*Needs:*`; nothing in §10.4 now points forward.
- **Dependencies lines.** Union of the layers of each layer's `target:` prerequisites, recomputed from the plan: {}, {}, {1,2}, {1,2,3}, {1,2,3,4}, {1,3,4,5}, {5,6}, {1,3,7}, {1,2,3,7,8}, {1,2,7,9}. Each equals its `### Dependencies` line (lines 161, 204, 304, 386, 466, 527, 601, 669, 762, 844).
- **The repaired patterns elsewhere.** "… of §k.n" references: each names an object present in the cited section (spot-checked: the grazing state of §7.1 at line 566, the inelastic rule of §4.4 at line 552, the one-particle density of §9.3 at line 658). A Check claiming a zero bound: §6.1 Check 1 says "`I = ∅` and the bound holds trivially", which is correct. R03 is a different pattern (a parameter, not a section).

## Verified sound

### Coverage and principles

I read all 871 README lines, the 45 plan targets (169 tests, at least 3 per target, every target with a locator; counted mechanically), every `*Needs:*` line and the 9 manifest entries. `gaps` is empty and no prerequisite is a `gap:`.

- No route-specific shortcut: every `d ≥ 1`, every flat position space, `0 < ε < ρ`; `d ≥ 2` only where `μ_ε → ∞` is used (§10.4, §10.5), with the `d = 1` counterexample as a Check.
- No re-planned roadmap, no upward or cyclic supply, no algorithm, no copied passage, no layer named after a source's chapter, no sentence saying the roadmap follows a source.
- A scan for LaTeX delimiters, pull-request numbers, dates, machine paths, `lemma`, `set_option`, "optional", "deferred", "removed", "so far", "checkpoint", "handoff", round labels and HTML anchors found none.
- Shape: the headings are in the house order; ten layers, each with `### Examples` and `### Dependencies`; all 45 numbered sections have at least three Checks and exactly one `*Needs:*` line.

### Adversarial table

`E` is Euclidean space. The head-on witness is ε = 1, `x_1 = (2, 0)`, `x_2 = 0`, `v_1 = (−1, 0)`, `v_2 = 0`. Rows cover the fifteen sampled targets, the sections the previous round's table did not carry, the headline theorems and the targets the findings touch. For §4.3, §5.2, §6.4, §7.1–7.3, §9.4 and §9.6 the previous round's rows carry computed values (finite-difference determinants 1.0000000, the reversed head-on state, the resummation coefficients); I reread those sections and recomputed the values quoted below.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1 class | `E`; unit torus d = 2; sup-norm torus; a distorted norm `f(|a|)` with `f(s) = s` on `[0, 1]`, ρ = 1 | short lift of class `(0.9, 0)` is `(−0.1, 0)`; class `(0.1, 0.1)`: sup norm 0.1, every lift `≥ 0.1414`; `‖π a − π b‖ = |a − b|` for `|a − b| < ρ` from the lift axiom and injectivity; distorted norm: `‖ξ‖ ≥ ε ⇔` shortest lift `≥ ε` for ε < ρ, so the hard-core sets are unchanged | Sound | none |
| §1.2 `E` as a position space (sampled) | the three Checks; the wrong instance ρ = 2 | `(1, 0)`; `4π/3 = 4.18879`; `(2, 0)`; all three also hold with ρ = 2 | Statement sound; target wording and Checks | R02 |
| §1.3 flat tori | unit torus; `2ℤ × ℤ`; ball `B(0, 1/2)` | `√2/2 = 0.70711`; covolume 2, shortest vector `e_2`, ρ = 1/2; `π/16 = 0.19635` against `π/32` for the normalised measure; density `π/4 = 0.7854 < 1` | Sound | R01 for the scope clause |
| §1.4 shells and packings (sampled) | d = 2 shell on `E`; unit circle shell beyond ρ; packing | `π(1.21 − 1) = 0.65973`; arcs `0.4 ≤ ‖y‖ ≤ 0.5` of total length 0.2 against `2 · 0.2 = 0.4`; `r₂^d − r₁^d ≤ d r₂^{d−1}(r₂ − r₁)`; `8 · 0.12566 = 1.0053 > 1` | Sound | none |
| §2.1 scattering map (sampled) | ν = (1, 0), `v = (0, 0.9)`, `w = (0.9, 0)`; head-on; reflection form | `c = −0.9`, image `((0.9, 0.9), 0)`, `0.81 + 0.81 = 1.62`; `c = 2`, image `((−1, 0), (1, 0))`; `(v, w) − c(ν, −ν)` with `c = ⟨(v, w), (ν, −ν)⟩`, `|(ν, −ν)|² = 2`: the reflection; `⟨v' − w', ν⟩ = c − 2c = −c` | Sound | none |
| §2.2 cross-section | derivation; d = 1, 2, 3 | `∫_B ⟨e, x⟩_+ = ½ ω_{d−1}(1 − (d − 1)/(d + 1)) = ω_{d−1}/(d + 1)`; values `1`, `2`, `π`; Θ: `⟨w' − v', −ω⟩ = −(−c + 2c) = −c = ⟨w − v, ω⟩` | Sound | none |
| §3.2–3.4 | torus contact; three collinear points; boost | `π(−0.7, 0) = π(0.3, 0)`, `ν = (1, 0)`; pairs `{1, 2}`, `{1, 3}` share 1; `S_1 B_1(0, 0) = (1, 1)`, `B_1 S_1(0, 0) = (0, 1)`, `A_1 B_1 S_1(0, 0) = (1, 1)` | Sound | none |
| §4.1 collision time (sampled) | head-on; grazing; miss; larger root | `D = 1`, τ = 1, `⟨q, u⟩ = −1`; `a = (1, 3)`: `D = 9 − 9 = 0`, τ = 3; `a = (2, 3)`: `D = 9 − 12 = −3`; `τ ≥ 0 ⇔ |u|²(|a|² − ε²) ≥ 0`; larger root 3 at `(−1, 0)` | Sound | none |
| §4.2 two-body map | oblique; reversal with contact at time `s` | `D = 9 − 8.36 = 0.64`, τ = 2.2, `q = (0.8, 0.6)`, `R_q u = (−1, 0) + 1.6(0.8, 0.6) = (0.28, 0.96)`; reversed path meets `q` first since `⟨q, u'⟩ = √D > 0` | Sound | none |
| §4.3 Jacobian | d = 1 | `B_s = (2 − a − su, −u)`, det `(−1)(−1) = 1`; variable time `(1 − 0.7u, −u)`, det 0 | Sound | none |
| §4.5 pair maps (sampled) | head-on `s = 3`; torus contact; `N = 3`, d = 1; η varied | `u' = (1, 0)`, `v_2 = (w − u')/2 = (−1, 0)` for 2 time units, `x_2 = (−2, 0)`, `x_1 = x_2 + (3, 0) = (1, 0)`; `a = (0.3, 0)`, `⟨a, u⟩ < 0`, τ = 0; `0, 2, 20 ↦ 0.1, 2.1, 20`; per-coordinate determinant of `(u, w)` is 2, so `2^d`; the domain gives `ε + 2Rs < ρ` without η | Statement sound; η unused | R03 |
| §5.2 uniqueness (sampled, headline) | supremum of agreement `s*`; backward at a jump | positions continuous, left limits agree, so `V_i(s*) = σ_M V_i(s*−)` agree, then right-continuity and local constancy; backward `V(s−) = σ_M V(s)` | Sound | none |
| §5.3 symmetries | reversal and boost of the head-on witness | at time −3: `(1, 0)`, `(−2, 0)`, velocities `0`, `(1, 0)`; contact when `−2 + 2 = 0`, at time −1; boost `c = (1, 0)`: `x_2(t) = (t, 0)`, distance `2 − t = 1` at `t = 1` | Sound | none |
| §5.4 left-continuous convention (sampled) | head-on; `J = [0, 1]` with outside values; DengHaniMa2024 datum | `Y = ((−1, 0), 0)` on `(−∞, 1]`, `(0, (−1, 0))` after; incoming datum `(−1, 0), 0` scattered at `0+` to `0, (−1, 0)`; from the outgoing state the source's rule gives distance `1 − t < 1` | Sound; agrees with DengHaniMa2024 lines 157–166 | none |
| §5.5 good set | `N = 2`, all cases of `(|a|, ⟨a, u⟩, D)` | `|a| = ε`, `⟨a, u⟩ > 0`: backward `|a − s R_a u|² = ε² + 2s⟨a, u⟩ + s²|u|²`, increasing, good; `⟨a, u⟩ ≤ 0` bad; `|a| > ε`: bad exactly when `u ≠ 0`, `D = 0` | Sound | none |
| §6.1 near-triple estimate | `N = 2`; `μ_X(K) = ∞` | `I = ∅`, `∞⁰ = 1`; triples `≤ N³`, two shells of measure `ω_d((ε + η)^d − ε^d)` each | Sound | none |
| §6.2 short time steps (sampled) | relative speed; torus; block composition | `|v_i − v_j| ≤ √2 |V| ≤ 2R`; δ = 0.09: `0.47 + 0.18 = 0.65 ≥ 0.5`; δ = 0.045: `0.39 + 0.09 = 0.48 < 0.5`; `|V| = √(4 · 0.01) = 0.2`, near pairs at distance `2 ≤ 3`, others `≥ 18`, images `0.1, 2.1, 20.1, 22.1` | Sound | R03 for the η clause |
| §6.3 iteration (changed) | step count; shell; `N = 2` | `⌈t/δ⌉ ≤ t/δ + 1 ≤ (t + 1)/δ` for `δ ≤ 1`; `ω_d((ε + 2Rδ)^d − ε^d) ≤ 2R d ω_d (ε + 2R)^{d−1} δ`; `576π⁴ = 56107.636`; `F(K) ⊆ F(K̄)`, so a non-measurable bounded `K` costs nothing | Sound | none |
| §6.4 Alexander's theorem (headline) | gluing at 0; passing all steps | a configuration passing the steps `j < t/δ` has a trajectory on `[0, ⌈t/δ⌉δ] ⊇ [0, t]`; `ℛℛZ = Z` gives the backward half with `V(0) = σ_M V(0−)` | Sound | none |
| §7.1–7.3 (headlines) | head-on `T_3`, `T_{−3} ℛ` | `((1, 0), (−2, 0); 0, (−1, 0))`; `T_{−3}ℛZ`: contact one time unit back, earlier velocities `(0, (1, 0))`, positions `(1, 0)`, `(−2, 0)`, equal to `ℛT_3Z` | Sound | none |
| §7.4 Koopman group (sampled) | `N = d = 1` circle; `N = 3`, ε = 1/3 circle; `p ≠ 2`; `p = ∞` | `∫ 1_{H ≤ ½} = 1 · 2 = 2`; gaps `g_1 + g_2 + g_3 = 1`, each in `[1/3, 2/3]`, so all `1/3`: dimension 1, `q_3 = 0`; `‖g‖_p ≤ μ(A)^{1/p − 1/2}‖g‖_2` for `p < 2`, `‖g‖_p^p ≤ ‖g‖_∞^{p−2}‖g‖_2²` for `p > 2`, with `A` bounded; `‖U_t f − f‖_∞ = 1` | Sound | none |
| §7.5, §8.1 | vacuum; transport sign | `Λ`-mass `1/0! = 1`; `W(1)((1, 0), (1, 0)) = W⁰(0, (1, 0))` | Sound | none |
| §8.2 weak Liouville (sampled, headline) | `χ(t)ψ(H)`; head-on; the d = 1 box | `(∫_0^∞ χ' + χ(0)) ∫ W⁰ψ(H) = 0`; `χ(t)(2 − t)` then `χ(t) t`, one-sided derivatives `χ'(1) ∓ χ(1)`; τ in `(0.99/1.04, 1.01/0.96) = (0.95192, 1.05208)`, `H` in `(0.4802, 0.5204)`, defect `∫ W⁰(v_1 − v_2) = −1` | Sound | none |
| §8.3 marginals (sampled) | unit torus `N = 2`; `s = N` | `g(z_1)(1 − ω_d ε^d)∫g̃`; `W^{(N)}_N = W_N`; inheritance as argued above | Sound | none |
| §8.4 symmetric expectations | `s = 2`, `N = 3`; `s > N` | `3 · 2 = 6` injective maps of 9; `Nat.descFactorial 1 2 = 0` against `1!/0! = 1` | Sound | none |
| §9.1 Maxwellians (sampled) | d = 1; d = 3; covariance `β⁻¹ • 1` | `M(0) = 0.39894`; `(2π)^{3/2} = 15.7496`; `(2π)^{−d/2}(β^{−d})^{−1/2} = (β/2π)^{d/2}` | Sound | none |
| §9.2 canonical ensembles (sampled) | exponent; `N = 1` torus; `E` | `Σ|v_i − u|² = 2H − 2⟨u, P⟩ + N|u|²`; `Z^{can} = 1`; mass `∞ · 1` on `E` | Sound | none |
| §9.3 grand canonical measures (sampled) | ε = 0, μ = 2; `f⁰ = 0`; bounds | `Z = e²`, `P(N = 1) = 2e^{−2} = 0.27067`; `Z = 1`; `1 + μ∫f⁰ ≤ Z ≤ Σ (μ∫f⁰)^N/N!` | Sound | none |
| §9.5 correlation identity (headline) | resummation; circle bound | `Σ_N (1/N!) · N!/(N − n)! = Σ_p 1/p!` term by term; `0.8√(2π) = 2.00530 ≤ 2.50663` | Sound | none |
| §9.6 chaos and scaling (headline) | factorisation; d = 3, ε = 0.01 | `F_n(0) = (f⁰)^{⊗n} 1_{𝒟̄_n} · Z⁻¹ Σ_p (μ^p/p!) ∫ Π f⁰ 1[admissible, none within ε of X_n]`; `ε^{−(d−1)} ω_d ε^d = ω_d ε`, `0.0418879` | Sound | none |
| §10.1 empirical measure (sampled) | second moment; `h = 1` | `μ^{−2}(μ∫F_1 h² + μ²∫F_2 h⊗h)`; `N/μ` | Sound | none |
| §10.2 collision operator | loss term d = 3; β = 0 | `ω_2 = π`, `∫|w| M = √(8/π) = 1.59577`; `v' = (r/2)(1, 1)`, `w' = (r/2)(1, −1)`, speeds `r/√2 > 1` for `r > √2`, kernel `r/√2` | Sound | none |
| §10.3 mild solutions | d = 1 | `σ_ω(v, w) = (w, v)` for `ω = ±1`, so `Q ≡ 0` | Sound | none |
| §10.4 Lanford's statement | hypotheses against BGSS2023 (1.1.5); `t = 0` | `|f⁰| + |∇_x f⁰| ≤ 2C₀ e^{−β₀|v|²/2}` almost everywhere; at `t = 0`: `|F_1 − f⁰| ≤ ω_d ε ‖ρ⁰‖_∞ f⁰`, uniform on compacts | Consistent with BGSS2023 lines 316–321 | none |
| §10.5 law of large numbers (headlines) | second moment; d = 1 | `0 + m² − 2m² + m² = 0`; `1 − e⁻¹ = 0.63212` | Sound | none |

### Seeded source sample

I opened the three readable texts at every locator of the fifteen sampled targets. The author flagged no locator as unverified.

| Target | Text opened and result |
|---|---|
| 1.2 | GST2013 lines 833–841: the particles in `ℝᵈ` and the domain. Confirmed. |
| 1.4 | GST2013 line 873 (the set with two distances in `[ε, ε + 2Rδ]`, the shells); BGSS2023 line 165 (the `N`-particle domain is empty for large `N`). Confirmed; the explicit bound is the roadmap's. |
| 2.1 | GST2013 lines 843–847 ((4.1.2)) and 1222–1227 ((4.4.1)); BGSS2023 lines 125–131 ((1.1.2)); DengHaniMa2024 lines 157–163 ((1.2)). Confirmed. |
| 4.1 | GST2013 lines 846–847 (the normal and the precollisional sign) and 1210–1216 (distance decreasing up to the collision; grazing neglected). Confirmed for the notions; the formula for τ is the roadmap's. |
| 4.5 | GST2013 lines 875–887 (one encounter per particle in a step). Confirmed. |
| 5.2 | DengHaniMa2024 lines 182–188 (Proposition 1.2: existence and uniqueness off a null set); GST2013 lines 848–854. Confirmed. |
| 5.4 | DengHaniMa2024 lines 140–172 (Definition 1.1, `d ≥ 2` at line 141, left-continuity at line 166), domain at lines 150–153. Confirmed. |
| 6.2 | GST2013 lines 875–887. Confirmed. |
| 7.4 | GST2013 lines 1138–1140 ((4.3.5), the solution operator `f ↦ f(Ψ_s(−t, ·))`); DengHaniMa2024 lines 175–178 ((1.5)). Confirmed. |
| 8.2 | GST2013 (4.2.1), lines 911–918, and (4.3.1), lines 941–958; BGSS2023 (1.1.3)–(1.1.4), lines 145–157. Confirmed. |
| 8.3 | GST2013 (4.2.2), lines 929–932; (4.2.3), lines 934–937; line 938 (the boundary condition integrated). Confirmed. |
| 9.1 | GST2013 (2.2.5), lines 489–492, with `θ = 1/β` and density 1. Confirmed. |
| 9.2 | BGSS2023 lines 158–160, printed p. 2 (the page begins at line 143). Confirmed. |
| 9.3 | BGSS2023 (1.1.5)–(1.1.6), lines 167–181; DengHaniMa2024 Definition 1.3, lines 199–223. Confirmed. |
| 10.1 | BGSS2023 (1.2.4)–(1.2.5), lines 324–334; (1.2.6), lines 335–340; the second moment, lines 352–369. Confirmed. |

Also read: GST2013 lines 205–215 ((1.1.1)), 375–400, 428–437, 664–698, 826–960, 1206–1230, 2066–2082, 5436–5440 and the contents at lines 45–110; BGSS2023 lines 112–190, 205–218, 225–372, 476–484, 3537–3540; DengHaniMa2024 lines 134–295. Every locator of §2.2, §3.1–3.5, §4.2, §5.1, §5.5, §6.1, §6.3, §6.4, §7.1, §7.3, §9.4–9.6, §10.2–10.5 falls in these ranges and was confirmed there. GST2013 lines 835–847 are on printed p. 27 (printed p. 28 begins at line 857); BGSS2023 (1.1.9) is on printed p. 3 (lines 195–288).

### Pinned declarations

Pins: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5` (the heads of the two checkouts and the plan's baseline agree). Every Mathlib and Tau Ceti name of the supplier contracts was resolved this round. Paths are relative to each library.

- `Mathlib/Analysis/InnerProductSpace/PiL2.lean:114`; `Mathlib/MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean:308`; `Mathlib/Analysis/Normed/Group/Quotient.lean:168` (`norm_mk`, `infDist`), `:222` (`instNormedCommGroup`, with `IsClosed`; additive by `to_additive`); `Mathlib/Topology/Algebra/OpenSubgroup.lean:377` (with `T1Space`); `Mathlib/MeasureTheory/Constructions/Polish/Basic.lean:119`, `:148`, `:154`, `:649`; `Mathlib/Topology/MetricSpace/ProperSpace.lean:66`.
- `Mathlib/Algebra/Module/ZLattice/Basic.lean:93`, `:434`, `:645` (`ZLattice.isAddFundamentalDomain`, with `[DiscreteTopology L] [IsZLattice ℝ L]`); `Mathlib/Algebra/Module/ZLattice/Covolume.lean:73`, `:85`; `Mathlib/MeasureTheory/Group/FundamentalDomain.lean:731`, `:754` (`to_additive addProjection_respects_measure`), `:801`; `Mathlib/MeasureTheory/Measure/Haar/Quotient.lean:75` (fundamental domain of `Γ.op`), `:222` (`HasFundamentalDomain Γ.op G ν`); `Mathlib/Topology/Instances/AddCircle/Real.lean:55`; `Mathlib/Analysis/Fourier/AddCircleMulti.lean:173`.
- `Mathlib/MeasureTheory/Function/Jacobian.lean:1096`, `:1184`; `Mathlib/Analysis/InnerProductSpace/Projection/Reflection.lean:52`; `Mathlib/Analysis/InnerProductSpace/Projection/FiniteDimensional.lean:59`; `Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean:172`, `:231` (`det f ≠ 0`), `:527` (`Nontrivial E`); `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:734`; `Mathlib/MeasureTheory/Constructions/HaarToSphere.lean:52`, `:88`.
- `Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:330` (`0 < b`); `Mathlib/Probability/Distributions/Gaussian/Real.lean:47`; `Gaussian/Multivariate.lean:166`; `Poisson/Basic.lean:40` (parameter in `ℝ≥0`); `Mathlib/MeasureTheory/Constructions/Pi.lean:732`; `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:595`, `:611`; `Mathlib/MeasureTheory/Function/ContinuousMapDense.lean:142`; `Mathlib/MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean:1140` (`ContinuousOn f (Icc a b)`); `Mathlib/Probability/Moments/Variance.lean:398` (`IsFiniteMeasure`, `MemLp X 2`); `Mathlib/Data/Nat/Factorial/Basic.lean:332`, `:367`, `:424`; `Mathlib/MeasureTheory/MeasurableSpace/Constructions.lean:871`; `Mathlib/MeasureTheory/Measure/Sum.lean:30`; `Mathlib/Dynamics/Flow.lean:85`.
- `TauCeti/Probability/Distributions/Gaussian/Density.lean:82`; `TauCeti/Analysis/Semigroups/Group/Basic.lean:74`; `TauCeti/Probability/Process/EmpiricalMeasure.lean:224` (a `ProbabilityMeasure`); `TauCeti/Dynamics/Flow/OfLipschitz.lean` (`TauCeti.flowOfLipschitz`).

Every name exists with the hypotheses the contract states. Neither library contains "hard sphere" in any file.

### Duplication, ownership and overlap

`scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id, no id that only a revision defines and no second copy; the folder is not on main and is in neither board package list entry. Object searches over main and the open heads (index of 2026-11-15):

- "hard sphere": ClassicalErgodicTheory (lines 72, 1160, 2440: outside its scope, a consumer of its §3.5) and MathematicalBilliards (line 971, a downstream remark). Nothing else.
- Lanford, Maxwellian, grand canonical, collision operator, BBGKY, `FlatPositionSpace`, `HardSphere.`: no match on main or in any open pull request. "Boltzmann": the Boltzmann entropy of OptimalTransport, the Maxwell–Boltzmann law of StandardDistributions (line 1592, a distribution of `|v|`, not the density `M_{β,u}`) and a Potts sum in TemperleyLiebOperatorAlgebras.
- Flat tori: MathematicalBilliards §10.5 (`ℂ/Λ` as a translation surface; R01), examples in QuasiregularMaps, GeometricTopology, DGFloer and RealSemisimpleLieGroups. No roadmap owns `E ⧸ L` in dimension `d` with its quotient norm and Haar measure.
- Correlation functions and empirical measures: PointProcesses and RandomMatrices (unlabelled point measures, eigenvalue counts), Equidistribution and the statistics roadmaps (empirical measures of samples). The objects here are formulas on labelled configurations with the `μ^{−n}` and `μ^{−1}` rescalings; the empirical probability measure is cited from Tau Ceti.

The one cross-roadmap supplier, ClassicalErgodicTheory §3.5, was read at the head of its open pull request (`e3c5108`). Heading "Flows defined almost everywhere"; standing hypotheses a standard Borel space and a σ-finite measure; item 1 conull flows with the identity extension, item 3 disjoint unions with "invariant iff each component restriction is", item 4 `(Φ t)_* ν = μ.withDensity (W ∘ Φ (-t))`; its conventions define a measurable flow as a jointly measurable `AddAction ℝ X`. The contract at README lines 73–79 says the same. Its §0.2 assumes a finite invariant measure, as the scope paragraph says. No roadmap of the never-cite list is cited as a supplier: PointProcesses is named only as the owner of a deferred subject. The 17 names of `scratch/citations.md` are this roadmap's own declarations for the package stage (README line 85).

Overlap check: read ClassicalErgodicTheory and MathematicalBilliards (scope and the sections cited above), and the scope sections of PointProcesses, RelativisticQuantumFieldTheory, HamiltonianSystems, OptimalTransport, RandomMatrices and StochasticCalculus, searched for tori, hard spheres, Liouville, Koopman, correlation functions, empirical measures, Maxwellians and Gibbs measures (third list empty); conull flows, their disjoint unions and the transport of densities: owner ClassicalErgodicTheory §3.5, cited here; the translation-surface structure of `ℂ/Λ`: owner MathematicalBilliards §10.5, not restated here (R01 adds the clause); Koopman strong continuity for a finite or probability invariant measure: owners ClassicalErgodicTheory §0.2 and MathematicalBilliards §12.3, not shared (infinite measure here); correlation functions and Gibbs processes of unlabelled point processes relative to a reference measure: owners PointProcesses and RandomMatrices, not restated; nothing else shared.

### Supplier order

```text
candidate: HardSphereDynamicsAndKineticLimits is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2233 edges, 0 problem(s)
```

No UPWARD or CYCLE line. ClassicalErgodicTheory is another author's open pull request that adds a new roadmap folder, which this roadmap may consume; it is not in `merge-order/ORDER.txt`, so the check does not see the edge. By reading: ClassicalErgodicTheory cites nothing of this roadmap and names the hard-sphere flow only as a consumer; its supplier MathematicalBilliards is the last line of the order. The order is MathematicalBilliards, ClassicalErgodicTheory, HardSphereDynamicsAndKineticLimits.

### Headline theorems

Named for the package stage: `HardSphere.IsTrajectory.eqOn` (§5.2), `HardSphere.volume_hardCoreSet_diff_goodSet` (§6.4), `HardSphere.flow_add` (§7.1), `HardSphere.measurePreserving_flow` (§7.2), `HardSphere.flow_reversal` (§7.3), `HardSphere.weak_liouville` (§8.2), `HardSphere.grandCanonical_flow_invariant` (§9.4), `HardSphere.lintegral_sum_distinct_eq_correlation` (§9.5), `HardSphere.boltzmannGrad_scaling` (§9.6), `HardSphere.tendsto_empirical_of_correlation` and `HardSphere.LanfordStatement.tendsto_empirical` (§10.5). Each names the roadmap's objects. The padding probe and the `#check` comparison have nothing to run on at this stage.

Remarks that need no change:

- §10.5's route ends with `ProbabilityTheory.meas_ge_le_variance_div_sq`, which is centred at the mean; the second moment about `∫ f h` controls it because `E[π_t(h)] → ∫ f h`. A route, not a statement.
- §5.2 has four Checks and the plan three tests; the fourth Check (uniqueness without the outgoing condition) is prose only.
- §10.4's weak clause follows from its almost-everywhere clause and the convergence of masses (`∫F_n(t) = ∫F_n(0) → 1`); stating both is harmless.
- §10.4 is stated on the unit torus, the setting of BGSS2023 Theorem 1; GST2013 Theorem 8 is the canonical ensemble on `ℝᵈ`, a different statement, cited for the theorem's history.

### Copyright, licences and scope

- **Wording.** Beside the fifteen sampled locators I compared seven further passages with the source text: the Summary's sentence on the law of large numbers with BGSS2023 lines 341–343; §5.5 with GST2013 lines 851–863; §8.3's specular inheritance with GST2013 line 938; §9.3's conditional i.i.d. statement with BGSS2023 lines 184–187; §6.4's route with GST2013 lines 898–910; §10.4 with BGSS2023 lines 316–321; §4.1's separation statement with GST2013 lines 1210–1216. The longest shared run is four words ("leading to a pathological", GST2013 line 862, a term of art). No sentence follows a source clause by clause.
- **Arrangement.** GST2013 has the largest share, 45 of the 106 source citations in the layers (BGSS2023 39, DengHaniMa2024 20, others 2). Its contents (lines 45–110): Chapter 1 the low density limit, Chapter 2 the Boltzmann equation, Chapter 3 main results, Chapter 4 the `N`-particle flow, the Liouville equation and hierarchies, Chapters 5–7 estimates and convergence. Layers 1–4 have no counterpart; Layers 5–7 expand its §4.1; the collision operator, in the source's Chapter 2, is in Layer 10. No run of layers maps one to one onto a run of its chapters or sections. The order of Layers 7 to 10 is forced: §8.1 needs §7.2, §9.5 needs §8.1 and §8.4, §10.1 needs §9.5.
- **Reuse.** No table, figure, list of examples or numerical data is taken from a source; the worked examples and non-examples are the roadmap's own.

Source independence: 22 passages compared with 3 sources, none shared; largest share GST2013, 45 of 106 locators; contents compared with GST2013: independent.

## Not verifiable

- Alexander1976 Proposition 4.3 and AlexanderThesis1975 Chapter 1: settled uncertified; only the attribution in GST2013 (line 855, lines 5437–5440) was read.
- Lanford1975, CIP1994, Spohn1991, Uchiyama1988: settled uncertified; not read, not requested again.
- Lean elaboration, the one-tactic padding probe and the `#check` comparison: not available (this lane does not elaborate), and there is no `Suggested.lean`.
- The truth of `HardSphere.LanfordStatement` beyond its agreement with BGSS2023 Theorem 1, its `t = 0` case and its equilibrium case: the proof belongs to a later roadmap and was not reconstructed.
- The dependency check's verdict on the ClassicalErgodicTheory edge: the tool does not see it; the direction was checked by reading.
- Ownership against open pull requests was checked through the indexed heads (476 pull requests, index of 2026-11-15). The two board packages on other branches (AnalyticNumberTheory, LawrenceVenkateshMethod) were not opened; neither is in this subject.

## Source issues

- **Misprint** in GST2013 at (4.4.1), printed p. 33: the source says the starred velocities are the pre-image of the pair under (4.1.1), the free flow; it should be under the reflection law (4.1.2); affects nothing.
- **Gap** in GST2013 at Proposition 4.1.1, proof, printed p. 28: the source invokes invariance of Lebesgue measure under the partially constructed flow without proving it for the collision step; it should establish the unit Jacobian of the two-body step first; affects the proof.
- **Error** in DengHaniMa2024 at Proposition 1.2(3), printed p. 4: the source says the flow maps are diffeomorphisms off one closed null set; it should say measure-preserving bijections, smooth where the collision sequence up to that time is locally constant; affects a stated result.

## For the human reviewers

- Supplier: ClassicalErgodicTheory is another author's open draft pull request and is not in the merge order. The item numbers of its §3.5 are fixed only when it merges.
- Scope: `HardSphere.LanfordStatement` (README §10.4) is a proposition whose proof is left to a roadmap on the BBGKY hierarchy; searches for "BBGKY" and "Lanford" found no such roadmap on main or open.
- Licence: the three texts read are arXiv copies. Six cited works are recorded `uncertified` in `sources.toml` and were not read.
- Scope: BGSS2023 is Ann. of Math. 198 and GST2013 an EMS monograph. DengHaniMa2024 is cited in its arXiv version (v3); I did not check whether it has appeared.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1b7bc361dae779734d0a55a671b6c189c84bac5e", "job": "REV-DESIGN-HardSphereDynamicsAndKineticLimits~8", "model": "fable", "worker": "chris-x79"} -->
