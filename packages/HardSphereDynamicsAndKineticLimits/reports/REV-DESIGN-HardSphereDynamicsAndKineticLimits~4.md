<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13780#issuecomment-6849212501 -->
Review (claude) of 090e0fd

Verdict: needs_changes

1. **F01** (P2) The conull-flow constructions are owned by ClassicalErgodicTheory §3.5 and are built again here

   **Location:** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:72`, "No roadmap section is consumed. Every input is a pinned declaration or a target of this roadmap."; the constructions are at lines 522 (§7.1), 573 (§7.5) and 595 (§8.1). `Scope and ownership` (lines 7–13) does not mention ClassicalErgodicTheory or MathematicalBilliards.

   **Claim:** This roadmap is the owner of the identity extension of the flow off its good set with the exact group law, of the componentwise flow on `Σ_N (Fin N → X × E)` preserving the sum measure, and of the transport of a density as `W⁰ ∘ T_{−t}`.

   **Witness:** Open pull request #2231, `TauCetiRoadmap/ClassicalErgodicTheory/README.md:1164–1188` (§3.5): conull flows extended by the identity with the group law everywhere, countable disjoint unions with the sum measure, and `(Φ t)_* (μ.withDensity W) = μ.withDensity (W ∘ Φ (−t))`. Line 2440 names the hard-sphere flow as consumer.

   **Exact repair:** ClassicalErgodicTheory is another author's open pull request that adds a new roadmap folder, so it may be a supplier; it consumes nothing of this roadmap, so no cycle arises.

   1. In `Scope and ownership`, under "Left to other roadmaps", say: flows defined off a null set in general (the identity extension of a measurable flow on a conull set, countable disjoint unions with the sum measure, transport of densities, point realisation) are ClassicalErgodicTheory §3.5; this roadmap constructs the conull carrier `G` and the trajectory map on it and proves that it preserves `λ_N` (Layers 5–7), which is what §3.5 takes as input. Ergodic properties of the flow are not part of this roadmap.
   2. Add `### From TauCetiRoadmap.ClassicalErgodicTheory` to the supplier contracts: §3.5 item 1 (conull flow, identity extension), item 3 (disjoint unions), item 4 (transport of densities), with what is assumed (a standard Borel space, a σ-finite measure, a measurable conull carrier).
   3. §7.1: keep the definition of `HardSphere.flow` and the theorem `HardSphere.flow_add` (headline), and state that the pair (`G ∪ 𝒟̄ᶜ`, the trajectory map) is a conull flow in the sense of §3.5 item 1. §7.5: replace "Prove that the componentwise flow is a group action preserving `Λ`" by the instance of §3.5 item 3 at `X_N = Fin N → X × E`, `μ_N = (1/N!) λ_N|𝒟̄_N`. §8.1: cite §3.5 item 4 for `∫ W(t) φ dλ = ∫ W⁰ (φ ∘ T_t) dλ`. Add the section to those three `*Needs:*` lines and to `suppliers` and the prerequisites of 7.1, 7.5, 8.1 in the plan.
   4. In the same scope paragraph, say why the Koopman theorem of §7.4 is not a citation: MathematicalBilliards §12.3 (`packages/MathematicalBilliards/design/README.md:830`, "on a probability space", `L²`) and ClassicalErgodicTheory §0.2 (its README line 383, "`μ` is a finite invariant measure") assume a finite measure, and `λ_N|𝒟̄` has mass `q_N · ∞`.
   5. Run the dependency check again. Should it print an UPWARD line for ClassicalErgodicTheory, do not cite it as a supplier: keep items 1 and 4 as scope text, state there that §3.5 is the general theory and the three statements here are its hard-sphere instances proved directly, and report the line.

   Tested on the instance: for `N = 1` on `E`, §3.5 item 4 with `Φ t (x, v) = (x + t v, v)` gives the density `W⁰(x − t v, v)`, which is the Check of §8.1 (`W(1)((1, 0), (1, 0)) = W⁰(0, (1, 0))`); item 3 gives the empty configuration mass 1 and the `N = 8` component of the unit torus (ε = 0.4, d = 2) mass 0, as §7.5 states. For item 4 the measure is infinite already at `N = d = 1` (mass 1 · ∞), so the finite-measure Koopman theorems do not apply and §7.4 stays a target here.

2. **F02** (P3) §8.4 is stated for a probability density and consumed for one that is not

   **Location:** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:639`, "a symmetric probability density `W_N` on `(Fin N → X × E)`"; plan 8.4 has the same wording in `statement` while its `hypotheses` list only "s ≤ N" and "W_N symmetric".

   **Claim:** The identity needs `∫ W_N = 1`.

   **Witness:** §9.5 (line 718, *Needs:* §8.4) applies it to `W_N(t)`, whose integral is `N! · P(𝒩 = N)`: for ε = 0, μ = 2, `∫ f⁰ = 1`, N = 1 it is `2e^{−2} = 0.27067`, and it is 0 for N = 8 on the unit torus with ε = 0.4.

   **Exact repair:** State §8.4 for a symmetric measurable `W_N ≥ 0` (the marginal of §8.3 then needs no support hypothesis: say that §8.4 uses the integral formula of §8.3 without the support condition, or add "vanishing off `𝒟̄_N`" to both). Make plan 8.4's `statement` and `hypotheses` agree ("W_N symmetric", "W_N ≥ 0 measurable", "s ≤ N", "h ≥ 0 measurable"). On the witness: `W_1` of mass 0.27067, `s = 1`, `h = 1` gives 0.27067 on both sides; `W_8 = 0` gives 0 = 0. The proof (relabelling and Fubini) uses no normalisation.

3. **F03** (P3) A locator of §4.3 does not contain the statement it is cited for

   **Location:** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:333`, "(statement used in GST2013 line 883; DengHaniMa2024 lines 186–187; BGSS2023 lines 133–137)"; plan 4.3 `locator`.

   **Claim:** BGSS2023 lines 133–137 use the invariance of Lebesgue measure under the two-body or N-body flow.

   **Witness:** BGSS2023 lines 133–137 say only that the flow is well defined on a full-measure subset of the phase space; the passage does not mention invariance of the measure or a Jacobian. GST2013 line 883 and DengHaniMa2024 line 186 do.

   **Exact repair:** Delete "; BGSS2023 lines 133–137" from the locator of §4.3 in the README and in plan 4.3, and remove "4.3" from the `cited_for` list of BGSS2023 in `packages/HardSphereDynamicsAndKineticLimits/sources.toml`. The citation of the same lines in §4.2 (the reflection at contact) and §6.4 (existence off a null set) is correct and stays.

4. **F04** (P3) Two sentences of §9.4 run together

   **Location:** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:705`, "For general `f⁰` the measure is transported by §8.1 componentwise The equilibrium `f⁰ = M` and its invariant measure are named in BGSS2023 lines 479–483".

   **Claim:** The paragraph is a sequence of complete sentences with the locator attached to the claim.

   **Witness:** There is no full stop between "componentwise" and "The equilibrium", and the locator block is not in parentheses as elsewhere.

   **Exact repair:** Write "For general `f⁰` the measure is transported by §8.1 componentwise (BGSS2023 lines 267–268). The equilibrium `f⁰ = M` and its invariant measure are named in BGSS2023 lines 479–483 and the product identity `M(z₁')M(z₂') = M(z₁)M(z₂)` at BGSS2023 line 3539; the invariance is derived here from §9.2 applied in each component."

Four findings: one P2 and three P3; one blocking. All seven round-3 findings are repaired, and the mathematics of the repaired passages survived the adversarial pass. The blocking finding is new this round and concerns ownership, not a false statement: the open roadmap ClassicalErgodicTheory now states, in general form, three constructions this design builds for itself and names the hard-sphere flow as their consumer.

The README, the plan and the sources manifest were not edited. No maintainer notes were supplied. This is the design lane: there is no `Suggested.lean`, and elaboration is not available (this lane does not elaborate; say so in the report). No Lean command was run.

## Previous findings, checked first

The preceding review is `packages/HardSphereDynamicsAndKineticLimits/reports/REV-DESIGN-HardSphereDynamicsAndKineticLimits~3.md`; its repair report is `packages/HardSphereDynamicsAndKineticLimits/reports/FIX-DESIGN-HardSphereDynamicsAndKineticLimits~4.md`. Line numbers are those of `packages/HardSphereDynamicsAndKineticLimits/design/README.md`.

| Round-3 finding | Status | Repaired passage and my check |
|---|---|---|
| R01 (P1), infinite phase volume | Repaired | Line 585: "its total mass is `q_N · ∞` … it is 0 when `q_N = 0` … and ∞ when `q_N > 0`"; line 566 adds the null sectors. Recomputed: 8π(0.2)² = 1.00531 > 1, so q₈ = 0 and the mass is 0; unit circle, ε = 1/3, N = 3: three gaps ≥ 1/3 summing to 1 force equal spacing, a set of dimension 1 in a 3-dimensional space, so q₃ = 0; N = d = 1: q₁ = 1, mass ∞; r = 0 on E: {V = 0} is null, mass 0. Plan 7.4 tests `energy_cutoff`, `empty_sector` agree. |
| R02 (P2), endpoint left limit | Repaired | Line 425: "at every `t ∈ J` other than a least element of `J`, `σ_{M(t)} V(t) = V(t−)`, the left limit within `J`; at a least element `t₀` of `J` the incoming state is by definition `Y(t₀) = …`". Line 381 makes the continuity relative to `J`. The witness (N = 1, J = [0, 1], V = e₁ for t < 0) now gives 0 = 0 at every t ∈ (0, 1] and is not compared at 0. I checked the converse: with Z = (X, σ_M W), the right limit of Z's velocity is W(t+) = σ_M W(t) = V_Z(t), and σ_M V_Z(t−) = σ_M W(t) = V_Z(t). The comparison with DengHaniMa2024 Definition 1.1 is limited to `X = E`, `d ≥ 2`, as the source is (DengHaniMa2024 lines 140–141, 150–153). Plan 5.1 and 5.4 agree. |
| R03 (P2), plan 8.3 specular hypothesis | Repaired | Plan 8.3 statement: "when W_N satisfies the specular condition … at every configuration of 𝒟̄_N whose contacts form a nonempty matching M, W^{(s)}_N satisfies it"; hypotheses and `marginal_specular` carry it; test `specular_needs_parent` added. Recomputed: e^{−1.62} = 0.197899 before scattering, 0 after, since ‖(0.9, 0.9)‖ = 1.27279 > 1. |
| R04 (P2), iteration equality | Repaired | Line 487: "`λ_N(F_j) = λ_N(A_j ∖ S_{δ,R})` … this is an upper bound only, since `A_j` can be much smaller than that set". Constants rechecked: (ε + 2Rδ)^d − ε^d ≤ 2Rδ·d(ε + 2R)^{d−1} for δ ≤ 1; the number of j with 0 ≤ j < t/δ is ⌈t/δ⌉ ≤ (t + 1)/δ for δ ≤ 1; for δ > 1 the trivial bound μ_X(K)^N vol(B_R) ≤ μ_X(K)^N vol(B_R) δ. Witness: F₁ = ∅, measure 0 ≤ positive. |
| R05 (P3), non-specular Check | Repaired | Line 620: the box `x_2 ∈ (0, 0.01)`, `x_1 − x_2 ∈ (1.99, 2.01)`, `v_1 ∈ (−1.02, −0.98)`, `v_2 ∈ (−0.02, 0.02)`. Recomputed: τ ∈ (0.99/1.04, 1.01/0.96) = (0.95192, 1.05208); H ∈ (0.4802, 0.5204); the pointwise residual is χ(τ)θ(H)(v₁ − v₁′) with v₁′ = v₂, so the left side is E[v₁] − E[v₂] = −1 − 0 = −1. |
| R06 (P3), Checks without their instance | Repaired | §6.3 "with `K = X`" and the `K = {0}` control (line 491); §7.4 "On `X = E`" with the circle control (line 567); §9.2 "with `N ≥ 1`" (line 680); §9.4 ρ = 1 + 0.5cos(2πx), ρ(0) = 1.5, ρ(−1/4) = 1, with the a.e. control (line 712); §9.6 "For the Maxwellian datum" (line 739). Plan tests mirror each. |
| R07 (P3), locators | Repaired | Lines 413 and 547: exchangeability locators "for relabelling" only, the rest "derived here", with input "GST2013 (4.1.1)–(4.1.2), lines 835–847, printed p. 27" (read: the free flow and reflection law are there; printed page confirmed from the page marker at GST2013 line 857). Line 639: "BGSS2023 (1.1.9), lines 241–266, printed p. 3" (read; the indicator is at line 249). Line 674: "formalism is that of BGSS2023 lines 158–160, printed p. 2; the invariant densities … are derived here". §9.2 Needs now lists §7.1 and §7.3. |

No finding of the repair report was marked `not actionable in this package`; nothing is re-raised. Seven of seven are repaired.

## Verified sound

### Coverage and principles

Read all 859 README lines, the 45 plan targets (163 planned Checks, every target with at least three), all `*Needs:*` lines and the 9 manifest entries. No route-specific shortcut (dimension `d ≥ 1`, any flat position space with `0 < ε < ρ`, `d ≥ 2` only where `μ_ε = ε^{−(d−1)} → ∞` is used), no copied passage, no algorithm, no layer named after a source's chapter, no sentence saying the roadmap follows a source. The layer order (position space, scattering, phase space, two-body problem, trajectories, Alexander's theorem, flow, densities, ensembles, limit) is forced by the `*Needs:*` lines. No process words, pull-request numbers, dates, machine paths or LaTeX delimiters in the README. No supplier gap is declared (`gaps` is empty) and none is needed apart from R01.

Remarks that need no change: the parameter η of §4.5 does not enter the domain of the pair map (the domain uses `‖x_i − x_j‖ + 2Rs < ρ` directly); the route of §10.5 bounds the second moment about `∫ f h`, for which Markov's inequality on the square does the same as the cited Chebyshev inequality; the layer `### Dependencies` lines name the adjacent layers and rely on transitivity, the per-target `*Needs:*` lines being exact.

### Adversarial table

`E` is Euclidean space; the head-on witness is ε = 1, `x_1 = (2, 0)`, `x_2 = 0`, `v_1 = (−1, 0)`, `v_2 = 0`. Rows cover the 15 sampled targets, the headline theorems and the targets the findings and repairs touch.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §1.2 Euclidean instance | π = id, ρ = ∞; d = 3 ball; class axioms | Lift of ξ is ξ, norm equal; `vol(B(0,1)) = 4π/3 = 4.18879`; `ν_ij = ((1,0) − 0)/1 = (1,0)`; transport of 0 by (1,0) for time 2 is (2,0) | Sound |
| §1.1 API (used by §1.2) | Unit 2-torus, ρ = 1/2 | Two points of `B(0, 1/2)` differing by a lattice vector have difference of norm < 1, so equal; image of `B(a, r)`, r ≤ ρ, is `B(πa, r)` by the lift axiom; class of (0.9, 0) lifts to (−0.1, 0) | Sound |
| §3.3 contact scattering, reversal | Outgoing contact `V = ((1,0), 0)`, ν = (1,0); no contact | `σ_M V = (0, (1,0))`; `ℛ = (0, (−1,0))`, relative normal speed +1, outgoing again; `ℛ² V = σ_M σ_M V = V`; no contact: `ℛ = −V` | Sound; `ℛ` maps `∂⁺` to itself, `σ_M` exchanges `∂^±` |
| §4.1–4.2 collision time and map | Head-on; oblique `a = (3, 0.6)`; grazing `a = (1, 3)`, `u = (0, −1)` | D = 1, τ = 1; D = 0.64, τ = 2.2, q = (0.8, 0.6), `R_q u = (0.28, 0.96)`, norm 1; D = 9 − 9 = 0 | Sound |
| §4.3 collision map and Jacobian | Head-on point; d = 1 | `dD = −2 du_1`, `dτ = da_1 + du_1`, `dq = (0, da_2 + du_2)`; rows of `DC`: (−1,0,0,0), (0,−1,0,−2), (0,0,−1,0), (0,2,0,3); det = 1 · (−3 + 4) = 1; `C(a, u) = (0, (1,0))`, `S_3 C = ((3,0),(1,0)) = B_3`. d = 1: fixed-time map `(2 − a − su, −u)` has det 1; variable-time `(1 − 0.7u, −u)` has det 0; frozen-normal map has det −1 | Sound; locator R03 |
| §4.4 two-body measure preservation | No-collision piece; inelastic rule; semigroup at contact | Shear has det 1; the two image pieces are separated by whether the backward path meets the sphere within time s; inelastic image has dimension (d−1) + (d−1) + 1 = 2d − 1 < 2d; `B_r B_s = B_{s+r}` also when τ = s (state `(q, R_q u)` outgoing, then free) | Sound |
| §4.5 pair maps | Head-on, s = 3, R = 1; N = 3, d = 1; torus pair | `P^{12}_3`: positions (1,0), (−2,0), velocities 0, (−1,0); positions 0, 2, 20 with speeds 0.1 go to 0.1, 2.1, 20; `(v_i, v_j) ↦ (u, w)` has det 2 per coordinate, 2^d; torus lift (−0.7, 0) ↦ (0.3, 0), `⟨a, u⟩ = −0.3 < 0`; separation stays below ρ since `|a| + 2Rs < ρ` and `|u| ≤ 2R` | Sound |
| §5.1–5.2 trajectories, uniqueness (headline) | Head-on glued at 1; N = 1 | Time-1 state has velocities 0, (−1,0); both pieces give `x_2(3) = (−2, 0)`; at the gluing time the jump condition is the left piece's own condition at its greatest element | Sound |
| §5.4 conventions | See R02 row above; outgoing datum in DengHaniMa2024 | Outgoing (0, (−1,0)) ↦ incoming ((−1,0), 0), normal speed −1; started from the outgoing state the source's rule gives distance 1 − t | Repaired, sound |
| §5.5 good configurations | N = 2 on `E`: tangent, crossing, static, contact | D = 0, u ≠ 0: tangency at time `−⟨a,u⟩/|u|²`, grazing, not in `G`; D > 0: one non-grazing collision forward or backward, in `G`; u = 0, `|a| > ε`: static, in `G`; contact with `⟨a,u⟩ ≤ 0`: not outgoing, not in `G`; d = 1: D = u²ε² > 0 for u ≠ 0 | Sound |
| §6.1–6.3 near triples, steps, iteration | N = 2; unit circle ε = 0.3, R = 1; R04 witness | I = ∅; δ = 0.045: near radius 0.39, 0.39 + 0.09 = 0.48 < 0.5; δ = 0.09: 0.47 + 0.18 = 0.65 ≥ 0.5; relative speed ≤ √2·R ≤ 2R, so non-near pairs stay above ε; `λ(F_1) = 0 ≤` positive | Sound |
| §6.4 Alexander's theorem (headline) | N = 1; N = 2; converse inclusion in the Borel description | Complement empty; exceptional set = cylinder D = 0 and contact set, both null; a trajectory on `[0, t]` has finitely many contact times with matchings, so for m large every step start has near pairs forming a matching and it passes all m steps (compactness of `[0, t]`); bound Cδ for every admissible δ gives 0 | Sound |
| §7.1 flow, group law (headline) | Head-on `T_3`, `T_{−3}`; grazing state off `G` | (2,0),0 ↦ (1,0),(−2,0) ↦ back; `T_1 Z = Z` while `S_1` moves `x_1` to (1, 1), D = 4 − 4 = 0 | Sound |
| §7.2 measure preservation (headline) | t < 0; off `G`; inelastic control | `T_{−t} = T_t^{−1}` and a measurable bijection preserving measure has a measure-preserving inverse; identity piece preserves measure; inelastic rule sends positive mass to a null set | Sound |
| §7.3 symmetries (headline) | Head-on reversal; rotation of velocities; boost off `G` | `ℛ T_3 Z = ((1,0),(−2,0); 0,(1,0)) = T_{−3} ℛ Z`; rotated `v_1 = (0, −1)` never meets particle 2; boosted grazing state stays ((2,1), 0) against (3,1), (1,0) | Sound |
| §7.4 Koopman group | N = d = 1 circle; `p = ∞` on `E` and on the circle | Mass 1 · ∞; `∫ 1_{H ≤ 1/2} = 1 · 2 = 2`; `‖U_t f − f‖_∞ = 1` on `E`, 0 on the circle; for p > 2, `‖g‖_p^p ≤ ‖g‖_∞^{p−2} ‖g‖_2²` closes the route | Sound; scope R01 |
| §7.5 grand canonical phase space | N = 0, 1, 8 | Masses 1, 1 · ∞, 0 | Sound; ownership R01 |
| §8.1 transported densities | N = 1, t = 1 on `E`; duality | `W(1)((1,0),(1,0)) = W⁰(0,(1,0))`; `∫ W⁰(T_{−t}Z) φ(Z) = ∫ W⁰(Y) φ(T_t Y)` by §7.2; wrong sign evaluates `W⁰((2,0),(1,0))` | Sound; ownership R01 |
| §8.2 weak Liouville (headline) | `χ(t)ψ(H)`; head-on with cutoff; box of R05 | `∫_0^∞ χ' = −χ(0)`; one-sided derivatives `χ'(1) ∓ χ(1)`, value continuous by the specular condition (the material derivative at the pre- and post-collision states gives the two one-sided continuities); residual −1 for the non-specular test | Sound |
| §8.3–8.4 marginals, symmetric expectations | Unit circle N = 2, ε = 0.1; (N, s) = (3, 2), (1, 2); mass ≠ 1 | Marginal factor 1 − 0.2 = 0.8; counts 6 and 0, truncated quotient 1; `W_1` of mass 0.27067 gives 0.27067 on both sides | Sound; hypothesis R02 |
| §9.1 Maxwellians | d = 1, β = 1; d = 3; Tau Ceti density at `S = β⁻¹ • 1` | `M(0) = 0.39894`; `(2π)^{3/2} = 15.7496` from `b = β/2`; `det S = β^{−d}`, `(det S)^{−1/2} = β^{d/2}`, exponent `−β|x − m|²/2`: the formula of §9.1; `Σ|v_i − u|²` is unchanged by `σ_ω` (Galilean invariance and energy) | Sound |
| §9.2 invariant and canonical measures | N = 1 torus; N = 8 packing; N = 0 and N ≥ 1 on `E` | `Z^{can}` = 1, 0, —; `Σ_i |v_i − u|² = 2H − 2⟨u, P⟩ + N|u|²`; total mass `Z^{can}/Z^{can} = 1`; on `E`: 1 for N = 0, ∞ for N ≥ 1 | Sound |
| §9.3 grand canonical measure | ε = 0, μ = 2; `f⁰ = 0` | `Z = e²`, `P(N = 1) = 2e^{−2} = 0.27067`; `Z = 1`, vacuum | Sound |
| §9.4 invariance (headline) | Shifted Maxwellian; indicator profile; cosine profile | Density a function of (H, P, N); 1 ↦ 0 since 1.2728 > 1; 1.5 ↦ 1 at t = 1/4 | Sound; sentence R04 |
| §9.5 correlation identity (headline) | n = 1; inversion; Gaussian circle | `Σ_{p+q=m} (−1)^p/(p! q!) = (1 − 1)^m/m!`, so the inversion returns `W_n`; `0.8·√(2π) = 2.00530 ≤ 2.50663`; series bound `exp(2μC₀K)/Z` | Sound |
| §9.6 initial chaos, scaling (headline) | d = 3, ε = 0.01; d = 1 | `1 − p_ε ≤ μ n ω_d ε^d ‖ρ⁰‖_∞`; `ω_3 · 0.01 = 0.04189`, so `ε²E[N] ∈ [0.95811, 1]`; d = 1: `1 − 2ε‖ρ⁰‖_∞ ≤ E[N] ≤ 1` | Sound |
| §10.1 empirical measure | N = 0; N = 3, μ = 2, h = 1 | Zero measure; 9/4 = 3/4 + 6/4; the Tau Ceti probability wrapper needs a nonempty index type | Sound |
| §10.2–10.3 collision operator, mild solutions | d = 1; Maxwellian; β = 0 | `σ_{±1}(v, w) = (w, v)`, so `Q ≡ 0`; `Q(M, M) = 0`; cross-section `ω_{d−1}|k|` = 1, 2, π for d = 1, 2, 3 from `ω_{d−1}/(d+1)` and the factor d + 1; gain diverges at β = 0 | Sound |
| §10.4 Lanford's statement | Maxwellian datum; t = 0; hypothesis class against BGSS2023 (1.1.5) | `M ≤ (β₀/2π)^{d/2} e^{−β₀|v|²/2}`, admissible when `C₀ ≥ (β₀/2π)^{d/2}`; `|F_1 − M| ≤ ω_d ε M → 0`; a datum with `|f⁰| + |∇_x f⁰| ≤ C₀ e^{−β₀|v|²/2}` satisfies both README bounds with the same `C₀`, so the README's class contains the source's | Sound; not narrower than the source |
| §10.5 law of large numbers (headlines) | μ → ∞; d = 1; wrong `F_2` limit | Second moment `0 + m² − 2m² + m² = 0`; d = 1: `1 − e^{−1} = 0.63212`; limit `2 f ⊗ f` gives m² | Sound |

### Seeded source sample

All three readable texts were opened at the locators. Nothing the author flagged as unverified remains. No source was fetched; the manifest was not changed.

| Target | Text opened and result |
|---|---|
| 1.2 | GST2013 lines 833–841 (§4.1, printed p. 27): N particles in `ℝᵈ`, free flow, the domain with `|x_i − x_j| > ε`. Supports the Euclidean setting; the instance is this roadmap's. |
| 3.3 | GST2013 lines 1219–1227 (printed p. 33): (4.4.1) is the pre-image of a post-collisional pair, with the same formula as `σ_ν`. Supports the contact scattering; the reversal `ℛ` is this roadmap's definition. |
| 4.3 | GST2013 line 883: invariance of the measure is used in the proof. DengHaniMa2024 lines 186–187, Proposition 1.2(3): measure-preserving flow maps. BGSS2023 lines 133–137 does not contain it (R03). The Jacobian computation is this roadmap's, recomputed above. |
| 4.4 | GST2013 line 883; DengHaniMa2024 Proposition 1.2(3), lines 186–187. Both support the statement as "used"; the proof is here. |
| 4.5 | GST2013 lines 875–887: the step in which each particle meets at most one other on `[0, δ]`. Supports the pair step; the skew-product form is this roadmap's. |
| 5.5 | GST2013 lines 851–854: pathological trajectories (multiple or grazing collisions, infinitely many collisions in finite time). Matches the complement of `G`. |
| 6.4 | GST2013 Proposition 4.1.1, lines 862–863, proof lines 875–910 (printed pp. 28–29); BGSS2023 lines 132–139; DengHaniMa2024 Proposition 1.2, lines 182–188; GST2013 line 855 cites "[2, Proposition 4.3]" and lines 5439–5440 identify [2] as Alexander's 1976 paper, pp. 217–232. All confirmed. |
| 7.2 | GST2013 line 883; DengHaniMa2024 line 186. Confirmed. |
| 7.3 | GST2013 (1.1.1), lines 211–215 and BGSS2023 lines 184–187: exchangeability, cited for relabelling only. GST2013 (4.1.1)–(4.1.2), lines 835–847, printed p. 27, and (2.1.3), lines 396–399, printed p. 11: the reflection law and its conservation laws. Confirmed. |
| 8.1 | BGSS2023 (1.1.3)–(1.1.4), lines 145–157; GST2013 (4.3.5), lines 1138–1140; DengHaniMa2024 (1.10), lines 233–234. All three are the pullback by the inverse-time flow. |
| 9.1 | GST2013 (2.2.5), lines 489–492: `M_{ρ,u,θ}` with `ρ = 1`, `θ = 1/β` is the README's formula. |
| 9.2 | BGSS2023 lines 158–160, printed p. 2: the canonical formalism with fixed N, cited for that only. |
| 9.4 | BGSS2023 lines 479–483 (equilibrium `f⁰ = M`, invariant measure named), line 3539 (product identity), lines 267–268 (transport). Confirmed. |
| 10.1 | BGSS2023 (1.2.4)–(1.2.6), lines 324–340, and (1.2.7), lines 352–369: definition, first moment and the diagonal/off-diagonal split. Confirmed. |
| 10.4 | BGSS2023 Theorem 1, lines 316–321, with (1.1.5) at line 168; GST2013 Theorem 4 and Remark 3.1.1, lines 668–696; Theorem 8, lines 2069–2080. The torus grand canonical statement is BGSS2023's; `T₀` depending on `C₀`, `β₀` only is line 319. Lanford1975 is uncertified. |

### Pinned declarations

Pins: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5` (the checkouts' heads, equal to the plan's baseline). Every declaration of the supplier contracts was found at the pin; paths are relative to each library's source tree.

- `Mathlib/Analysis/InnerProductSpace/PiL2.lean:114` (`EuclideanSpace`); `Mathlib/MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean:308` (`EuclideanSpace.volume_ball`).
- `Mathlib/Analysis/Normed/Group/Quotient.lean:168` (`norm_mk`, `infDist`), `:222` (`instNormedCommGroup`, needs `IsClosed`; its additive form `QuotientAddGroup.instNormedAddCommGroup` is used by name at `Mathlib/Analysis/Normed/Group/AddCircle.lean:43`).
- `Mathlib/MeasureTheory/Constructions/Polish/Basic.lean:649` (`QuotientGroup.borelSpace`, additive form; needs a normal closed subgroup); `Mathlib/Topology/Algebra/OpenSubgroup.lean:377` (`isClosed_of_discreteTopology`, additive form; needs `T1Space`).
- `Mathlib/Algebra/Module/ZLattice/Basic.lean:93`, `:434`, `:645` (`ZSpan.fundamentalDomain`, `IsZLattice`, `ZLattice.isAddFundamentalDomain`); `Mathlib/Algebra/Module/ZLattice/Covolume.lean:73`, `:85`.
- `Mathlib/MeasureTheory/Group/FundamentalDomain.lean:731` (the class: the quotient measure equals the image of the restriction to every fundamental domain; it gives no `MeasureSpace` instance), `:755` (`addProjection_respects_measure`), `:801` (`quotientMeasureEqMeasurePreimage_quotientMeasure`).
- `Mathlib/MeasureTheory/Measure/Haar/Quotient.lean:75` (stated for a fundamental domain of `Γ.op`; the additive name `measurePreserving_quotientAddGroup_mk_of_AddQuotientMeasureEqMeasurePreimage` is used at `Mathlib/MeasureTheory/Integral/IntervalIntegral/Periodic.lean:94`), `:222` (`haarMeasure_quotient`; needs `HasFundamentalDomain Γ.op G ν` and a finite quotient measure).
- `Mathlib/Topology/Instances/AddCircle/Real.lean:55`; `Mathlib/Analysis/Fourier/AddCircleMulti.lean:173`.
- `Mathlib/MeasureTheory/Function/Jacobian.lean:1096`, `:1184`; `Mathlib/Analysis/InnerProductSpace/Projection/Reflection.lean:47`; `Mathlib/Analysis/InnerProductSpace/Projection/FiniteDimensional.lean:59`; `Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean:172`, `:231`, `:527` (`addHaar_sphere` needs `Nontrivial E`, true for `d ≥ 1`); `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:734`.
- `Mathlib/MeasureTheory/Constructions/HaarToSphere.lean:52`, `:88` (total mass `dim E · μ(ball 0 1)`); `Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:330` (needs `0 < b`).
- `Mathlib/Probability/Distributions/Gaussian/Real.lean:47` (variance parameter in `ℝ≥0`); `Mathlib/Probability/Distributions/Gaussian/Multivariate.lean:166`; `Mathlib/Probability/Distributions/Poisson/Basic.lean:40` (rate in `ℝ≥0`).
- `Mathlib/MeasureTheory/Constructions/Pi.lean:732`; `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:595`, `:611`; `Mathlib/MeasureTheory/Function/ContinuousMapDense.lean:142`; `Mathlib/MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean:1140`; `Mathlib/Probability/Moments/Variance.lean:398`; `Mathlib/Data/Nat/Factorial/Basic.lean:332`, `:367`; `Mathlib/MeasureTheory/MeasurableSpace/Constructions.lean:871`; `Mathlib/Dynamics/Flow.lean:85`.
- `TauCeti/Probability/Distributions/Gaussian/Density.lean:82` (the density formula quoted in the README), `:265` (`multivariateGaussian_eq_withDensity`, for `S.PosDef`, stated with the `ℝ≥0∞`-valued companion); `TauCeti/Analysis/Semigroups/Group/Basic.lean:74` (fields `map_zero'`, `map_add'` for all real `s, t`, `continuousAt_zero'`; no completeness assumed); `TauCeti/Probability/Process/EmpiricalMeasure.lean:224` (a `ProbabilityMeasure`, `[Nonempty κ]`; the underlying `empiricalFiniteMeasure` at `:58` is the zero measure for an empty family); `TauCeti/Dynamics/Flow/OfLipschitz.lean:59` (a `Flow ℝ E` on a complete space).

Object search at both pins for hard spheres, specular reflection, billiards and the Boltzmann equation: only Boltzmann entropy (optimal transport) and Gaussian material; no hard-sphere trajectory, collision operator or grand canonical dynamics. Nothing of this roadmap restates a pinned declaration.

### Duplication, ownership and overlap

`scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id and no id that only a revision defines; the README cites no section of another roadmap, so there is no supplier drift to resolve. The resolver's 17 names are this roadmap's own declarations for the package stage (line 78), not library names.

Read at their heads or on main: PointProcesses (#417: unlabelled point measures, Janossy measures and the hard-core Papangelou example at its README lines 936–964 and 1200; the README's scope sentence on labelled configurations is accurate), ClassicalErgodicTheory (#2231: R01), RelativisticQuantumFieldTheory (#1772: field-theoretic correlation distributions, nothing shared), HamiltonianSystems (#480: Liouville's theorem on a symplectic vector space at its line 421, for smooth flows; the README's scope sentence is accurate), MathematicalStatisticsFoundations (#2111: consumes Tau Ceti's empirical measures, nothing shared), OptimalTransport, RandomMatrices and StochasticCalculus (main: Boltzmann entropy and empirical spectral measures, nothing shared). Also read: MathematicalBilliards (the board package `packages/MathematicalBilliards/design/README.md`, last in the merge order: polygonal billiard flow with identity extension at §8.2, flat tori `ℂ/Λ` as translation surfaces at §10.5, Koopman group on a probability space at §12.3; its line 895 names hard-sphere flows only as sharing a shape) and IncompressibleFlows (#237: Koopman groups of continuous flows; not citable and not cited). The board-package index lists AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory, none related. The flat torus `E ⧸ L` with Euclidean quotient norm in every dimension has no other owner (MathematicalBilliards §10.5 is the two-dimensional translation surface, ComplexTori the complex Lie group). No second copy of a roadmap on main.

Overlap check: read PointProcesses, ClassicalErgodicTheory, RelativisticQuantumFieldTheory, HamiltonianSystems, MathematicalStatisticsFoundations, OptimalTransport, RandomMatrices, StochasticCalculus (third list empty), and MathematicalBilliards; conull flows, their disjoint unions and the transport of densities: owner ClassicalErgodicTheory §3.5 (R01); Koopman strong continuity on a finite measure space: owner MathematicalBilliards §12.3 and ClassicalErgodicTheory §0.2, not shared (infinite measure here); hard-core point-process densities: owner PointProcesses, not restated here.

### Supplier order

```text
candidate: HardSphereDynamicsAndKineticLimits is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 206 roadmaps, 1896 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every plan prerequisite points to an earlier target or a pinned declaration. No roadmap on the never-cite list is cited.

### Shape, headline theorems, acceptance file

Headings, ten layers each ending with `### Examples` and `### Dependencies`, API lists and Checks are in the house form. Headline theorems named for the package stage: `HardSphere.IsTrajectory.eqOn` (§5.2), `HardSphere.volume_hardCoreSet_diff_goodSet` (§6.4), `HardSphere.flow_add` (§7.1), `HardSphere.measurePreserving_flow` (§7.2), `HardSphere.flow_reversal` (§7.3), `HardSphere.weak_liouville` (§8.2), `HardSphere.grandCanonical_flow_invariant` (§9.4), `HardSphere.lintegral_sum_distinct_eq_correlation` (§9.5), `HardSphere.boltzmannGrad_scaling` (§9.6), `HardSphere.tendsto_empirical_of_correlation` and `HardSphere.LanfordStatement.tendsto_empirical` (§10.5). Each names the roadmap's objects. The padding probe and the `#check` comparison have nothing to run on: there is no `Suggested.lean` at this stage. By reading, the scattering identities of §2.1 and the small-value Checks are correctly kept out of the list of line 78.

## Not verifiable

- Alexander1976 Proposition 4.3 and AlexanderThesis1975 Chapter 1: settled uncertified; only the attribution in GST2013 (line 855, lines 5437–5440) was read.
- Lanford1975, CIP1994, Spohn1991, Uchiyama1988: settled uncertified; not read, not requested again.
- Lean elaboration, the one-tactic padding probe and the `#check` comparison: not available (this lane does not elaborate), and there is no `Suggested.lean`.
- The truth of `HardSphere.LanfordStatement` beyond its statement, its equilibrium case and its `t = 0` case: the proof is the BBGKY roadmap's and was not reconstructed. The weak convergence against bounded continuous functions for every `n` is not in the wording of BGSS2023 Theorem 1; it follows from the almost-everywhere convergence with the uniform Gaussian bounds of the hierarchy proof, which I did not check.
- Ownership against open pull requests was checked through the indexed heads (440 pull requests, index of 2026-11-13) and the board packages in this checkout; the board packages of other pull requests' branches (the three in the index) were judged by name only.
- Whether the dependency check accepts ClassicalErgodicTheory as a supplier (R01, step 5): it is not in the merge order file, and I did not edit the README to try.

## Source issues

- **Misprint** in GST2013 at (4.4.1), printed p. 33: the source says the starred velocities are the pre-image of the pair under (4.1.1), the free flow; it should be under the reflection law (4.1.2); affects nothing.
- **Gap** in GST2013 at Proposition 4.1.1, proof, printed p. 28: the source invokes invariance of Lebesgue measure under the partially constructed flow without proving it for the collision step; it should establish the unit Jacobian of the two-body step first; affects the proof.
- **Error** in GST2013 at (4.3.5), printed p. 32: the source says the pullback by the hard-sphere flow maps continuous functions on the phase space to continuous functions; it should require the specular boundary condition or work with measurable functions; affects a stated result.
- **Gap** in BGSS2023 at Corollary 1.2.1, proof after (1.2.7), printed p. 5: the source passes from almost-everywhere convergence of the correlation functions to convergence of their integrals; it should invoke a uniform integrable bound; affects the proof.
- **Error** in DengHaniMa2024 at Proposition 1.2(3), printed p. 4: the source says the flow maps are diffeomorphisms off one closed null set; it should say measure-preserving maps, smooth on the pieces with a fixed collision sequence; affects a stated result.
- **Error** in BGSS2023 at Remark 6.1.2, printed p. 59: the source says the semigroup generated by transport plus the linearised collision operator consists of self-adjoint contractions; it should say contractions, the transport part being skew-adjoint; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "090e0fdd7ba8daf4b0d11d18ed6366ed87badcc3", "job": "REV-DESIGN-HardSphereDynamicsAndKineticLimits~4", "model": "fable", "worker": "chris-x30"} -->
