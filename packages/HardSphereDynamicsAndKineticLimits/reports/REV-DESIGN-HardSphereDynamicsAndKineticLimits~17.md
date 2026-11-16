<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13780#issuecomment-6903502225 -->
Review (claude) of 4aa8c07

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) the weak-convergence clause of §10.4 is attributed to a theorem that does not state it

   **Location.** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:814`: "for every `n ≥ 1` and every bounded continuous `g` on `(𝕋^d × E)^n`, `∫ F^ε_n(t) g → ∫ f(t)^{⊗n} g` … (BGSS2023 Theorem 1, lines 316–321; …)"; plan target 10.4, same locator.

   **Claim.** The three conclusions of `HardSphere.LanfordStatement` are those of the cited theorems.

   **Witness.** BGSS2023 lines 318–321 state two conclusions only: `F^ε_1(t)` converges uniformly on compact sets, and `F^ε_n(t)` converges almost everywhere. GST2013 lines 687–694 test against functions of `v` alone, for the first marginal.

   **Exact repair.** The clause is true as a consequence, so the statement stays; add after the locator of §10.4 (and in the plan's locator for 10.4): "The first conclusion is not printed in these theorems; it follows from the second. `∫ F^ε_n(t) = μ_ε^{−n} E[Nat.descFactorial N n]` does not depend on `t` (§9.5) and tends to `(∫ f⁰)^n = 1` (§9.6, `ρ⁰` being bounded by `C₀ (2π/β₀)^{d/2}`); `f(t) ≥ 0` almost everywhere as a limit of the `F^{ε_k}_1(t)`, and `∫ f(t) = 1` by integrating the mild identity (§10.3) with the case `ψ = 1` of §10.2; so Scheffé's lemma gives `F^{ε_k}_n(t) → f(t)^{⊗n}` in `L¹` along every sequence." Tested on the instance of the second Check of §10.4 (`f⁰ = M_{β₀,0}`): `F^ε_n(t) = F^ε_n(0) → M^{⊗n}` off the diagonal, `(1 − n ω_d ε) ∫ M^{⊗n} 1_{𝒟̄_n} ≤ ∫ F^ε_n(0) ≤ 1` with the left side tending to `1 = ∫ M^{⊗n}`, so the `L¹` convergence, hence the weak clause, holds.

One finding, P3, on a locator (R01); nothing is P1 or P2. R01 carries a repair, so the verdict asks for changes: a fix round applies R01. No supplier gap is declared and none is needed. I changed neither the README, the plan nor the sources manifest, and fetched no source: every sampled locator lies in the three cached texts. No maintainer notes were supplied. This is the design lane: there is no `Suggested.lean`, and Lean elaboration is not available (this lane does not elaborate; say so in the report). No Lean command was run.

## Previous findings, checked first

The preceding review is `REV-DESIGN-HardSphereDynamicsAndKineticLimits~16` (one finding, P3); its repair report is `packages/HardSphereDynamicsAndKineticLimits/reports/FIX-DESIGN-HardSphereDynamicsAndKineticLimits~17.md`. Nothing was marked `not actionable in this package`; nothing is re-raised.

| Round-16 finding | Status | Repaired passage and my check |
|---|---|---|
| F01: ρ used for a density in a Check of §9.4 | Repaired | `design/README.md:727`: "take `f⁰(x, v) = r(x) M_{1,0}(v)` with `r(x) = 1 + 0.5 cos(2πx)`"; the plan test `position_dependent` of target 9.4 reads the same. Recomputed: `r(0) = 1.5`, `r(−1/4) = 1 + 0.5 cos(−π/2) = 1`, `∫_0^1 r = 1`. |

The repair touched one README line and one plan test (the diff of the two heads shows nothing else). The repaired pattern in the rest of the design: every bare `ρ` followed by an argument is gone (0 occurrences); `ρ⁰` of §9.6 is defined where it appears. The Lipschitz-free profile `(1 + 0.5 cos(2πx)) M_{1,0}(v)` of §10.3 (third Check) is written without a letter, so it does not clash either.

## Verified sound

### Coverage and principles

I read all 875 README lines, the plan (10 layers, 45 targets, 174 tests, `gaps` empty, one supplier entry, baseline equal to the pins of `lake-manifest.json`: Mathlib `1b1ccf4b088b`, Tau Ceti `2fd255d997f4`, confirmed against the two checkouts) and the 9 manifest entries.

- Mechanical: for all 45 targets the sections of the `*Needs:*` line equal the plan's `target:` prerequisites (0 differences), no prerequisite points forward, and each target has as many plan tests as Check bullets (174 against 174, at least 3 each). The manifest's `cited_for` lists equal the sections in which each key occurs (0 differences for 9 keys), and no cited work lacks a manifest entry.
- No route-specific shortcut: every `d ≥ 1`, every flat position space, every `0 < ε < ρ`; `d ≥ 2` only in §10.4 and the corollary of §10.5, with the d = 1 counterexample as a Check. No re-planned roadmap, no upward or cyclic supply, no algorithm, no layer named after a source's chapter, no sentence saying the roadmap follows a source.
- A scan of the README for LaTeX delimiters, pull-request numbers, machine paths, `set_option`, "optional", "deferred", "for later", "so far", "to be checked", "checkpoint", "handoff", "packet", "removed", HTML anchors, `lemma` and round labels finds nothing (0 hits each).
- Layer `### Dependencies` lines against the `*Needs:*` lines of their sections: Layer 4 (needs §2.1, §1.1, §3.4), Layer 5 (§§3.1–3.5, §4.1, §2.1, §1.2), Layer 6 (§1.4, §3.1, §3.3, §4.4–4.5, §5.x), Layer 7 (§3.1, §3.4, §5.x, §6.x), Layer 8 (§1.1–1.2, §3.x, §6.4, §7.x), Layer 9 (§1.4, §2.1, §3.1, §3.5, §7.x, §8.x), Layer 10 (§1.1, §1.3, §2.x, §7.5, §9.x): each agrees with the stated layer list.
- Remarks that need no change. `c > 0` in §9.4 is not needed for the truth (`c = 0` gives the vacuum law, also invariant). §5.2's fourth Check says the outgoing condition "only excludes grazing contacts"; at a least element of `J` it also excludes incoming contact states, from which no path stays in `𝒟̄`, so the Check's conclusion stands. §7.5 uses `𝒟̄_N` and `G_N` through §7.2.

### Adversarial table

`E` is Euclidean space; the head-on witness is ε = 1, `x_1 = (2, 0)`, `x_2 = 0`, `v_1 = (−1, 0)`, `v_2 = 0`. Every value was computed this round. Rows cover the fifteen sampled targets, the passage the repair changed, the headline theorems, the sections the earlier round summarised without values, and the target of R01.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1 flat position spaces (sampled) | local isometry; continuity of `ℓ`; ball image; sup-norm torus; Haar | lift `c` of `π(a − b)`, `|c| ≤ |a − b| < ρ`, injectivity gives `c = a − b`; `ξ_n → ξ`: `ℓ(ξ) + ℓ(ξ_n − ξ)` is a lift of `ξ_n` of norm `< ρ` eventually, so it is `ℓ(ξ_n)`; `π(B(0, r)) = B(0, r)` for `r ≤ ρ` by lift and 1-Lipschitz; class of `(s, s)`: 0.1 against `0.1414`; small balls have mass `ω_d r^d > 0`, bounded sets finitely many of them | Sound | none |
| §1.3 flat tori | ρ maximal; `2ℤ × ℤ`; unit mass; ball not a domain | `±k/2` for a shortest `k` have norm ρ and one image; covolume 2, shortest vector `e_2`, ρ = 1/2; `π/16` against `π/32`; `π/4 < 1` | Sound | none |
| §1.4 shells and packings | torus count; shell; `r₂ ≥ ρ` | `0.04π = 0.12566`, `1/0.12566 = 7.96`; `π · 0.21 = 0.65973`; measure 0.2 against `2 · 0.2 = 0.4` | Sound | none |
| §2.1 scattering map (sampled) | involution; reflection; witness; head-on; separate reflection | `⟨v' − w', ν⟩ = −⟨v − w, ν⟩`, second application restores `v`; `(v, w) − 2⟨(v, w), n⟩n` with `n = (ν, −ν)/√2` equals `σ_ν`; `⟨v − w, ν⟩ = −0.9`, image `((0.9, 0.9), 0)`, energies `1.62 = 1.62`; `(1, 0), (−1, 0) ↦ (−1, 0), (1, 0)`; momentum `(1, 0) ↦ (−1, 0)` | Sound; agrees with GST2013 (4.1.2), BGSS2023 (1.1.2), DengHaniMa2024 (1.2) | none |
| §2.2 pre/post-collisional variables (sampled) | `Θ²`; kernel; d = 1, 2, 3; probability sphere | `σ_{−ω} σ_ω = id`; `(w' − v')·(−ω) = (w − v)·ω`, at the witness `0.9 = 0.9`; `½ ω_{d−1}(1 − (d − 1)/(d + 1)) = ω_{d−1}/(d + 1)`, so `|k|`, `2|k|`, `π|k|`; `|k|/4` | Sound | none |
| §3.1, §3.3, §3.4 | packing Check; reversal; boost | threshold `1/(2 · 0.75) = 2/3`, and `1/(2 · 0.5) = 1`; `σ_M((1, 0), 0) = (0, (1, 0))`, `ℛ` gives `(0, (−1, 0))`, `⟨v_1 − v_2, ν⟩ = 1`; `S_1 B_1(0, 0) = (1, 1)`, `B_1 S_1(0, 0) = (0, 1)`, corrected `(1, 1)` | Sound | none |
| §3.5 collision invariants (sampled) | witness; reversal; unsigned map | `P = (0.9, 0.9)`, `H = ½ · 1.62 = 0.81` before and after; `P = (1, 0) ↦ (−1, 0)`, `H = ½` both; `σ_M V = (0, (1, 0))` keeps `P = (1, 0)` | Sound; GST2013 (2.1.3) | none |
| §4.2 two-body map (sampled) | head-on; oblique; wrong base point; semigroup at `τ = s`; incoming contact | `τ = 1`, `R_q u = (1, 0)`, `B_3 = ((3, 0), (1, 0))`; `D = 9 − 8.36 = 0.64`, `τ = 2.2`, `q = (0.8, 0.6)`, `R_q u = (0.28, 0.96)`, norm 1; `(5, 0) ≠ (3, 0)`; `B_r(q, R_q u) = (q + r R_q u, R_q u) = B_{s+r}(a, u)`; `B_0(a, u) = (a, R_a u) ≠ (a, u)` | Sound | none |
| §4.3 Jacobian (recomputed) | explicit `DC` at the witness; d = 1 | `dτ = da_1 + du_1`, `dq = (0, da_2 + du_2)`, `dU' = (−du_1, 2da_2 + 3du_2)`, `dY = (−da_1, −da_2 − 2du_2)`, determinant `(−1)(3 − 4) = 1`; `(2 − a − s u, −u)`: determinant 1 | Sound | none |
| §4.4 measure preservation (sampled) | injectivity; reversal; inelastic rule | `B_s(a, u) = B_s(a, R_a u)` exactly at incoming contact states; from `q + (s − τ) R_q u` with `−R_q u` back to `q − τ u = a`, velocity `−u`; image dimension `(d − 1) + (d − 1) + 1 = 2d − 1` | Sound | none |
| §4.5 pair maps (sampled) | domain; head-on; third particle; linear change | new separation `≤ ‖x_i − x_j‖ + 2Rs < ρ`; `(1, 0), (−2, 0); 0, (−1, 0)` at `s = 3`; `0.1, 2.1, 20`; `det [[1, −1], [1, 1]] = 2` per coordinate, `2^d` | Sound | none |
| §5.1, §5.3 | reversal of the witness; boost | time-3 state `((1, 0), (−2, 0); 0, (−1, 0))` reversed has velocities `0, (1, 0)`, collision at `−1`, state `((2, 0), 0; (1, 0), 0)` at 0; boosted velocities `0, (1, 0)`, relative data unchanged, `τ = 1` | Sound | none |
| §5.2 `IsTrajectory.eqOn` (headline) | supremum and infimum of the agreement set | positions by continuity, `V(t*) = σ_M V(t*−)` on both; backward `V(t_*−) = σ_M V(t_*)` | Sound | none |
| §5.4, §5.5 | incoming datum; past tangency; `N = 2` exceptional set | `σ_M(0, (−1, 0)) = ((−1, 0), 0)`, rescattered to `(0, (−1, 0))`; `⟨a, u⟩ = 2`, `D = 4 − 4 = 0`, tangency at `(0, 1)` at time −2; contact with `⟨a, u⟩ > 0` has `D = ⟨a, u⟩² > 0`; `u = 0` off contact is in `G` | Sound | none |
| §6.1 near-triple estimate | fixed triple; `N ≤ 2` | `μ_X(K) · s² · μ_X(K)^{N−3}`, `s = ω_d((ε + η)^d − ε^d)`, `N³` triples; `I = ∅` | Sound; GST2013 lines 867–874 | none |
| §6.2 short steps (sampled) | relative speed; return on a torus; torus radii; block Check | `|v_i − v_j| ≤ √2 R ≤ 2R`; separation after a collision `≤ ε + 4Rδ < ρ`, so the motion is Euclidean; `0.47 + 0.18 = 0.65 ≥ 1/2`, `0.39 + 0.09 = 0.48`; `|V| = √0.04 = 0.2`, positions `0.1, 2.1, 20.1, 22.1` | Sound | none |
| §6.3 iteration | constant | `2 · 2 · π · 3 = 12π`, `vol(B⁴_1) = π²/2`, `8 · 144π² · π²/2 = 576π⁴ = 56108` | Sound | none |
| §6.4 Alexander (headline) | Borel description; gluing at 0 | second-nearest distance continuous and `> ε` on `[0, t]`, so `> ε + 2Rt/m` for large `m`; backward piece gives `V(0) = σ_M V(0−)`, forward piece right continuity | Sound | none |
| §7.1 flow (sampled, headline) | `t = 3`; outgoing contact, `t < 0`; contact at time `t`; grazing state | `T_3`: `(1, 0), (−2, 0)` against `S_3`: `(−1, 0), 0`; closed interval needed at both ends; `D = 4 − 4 = 0`, `T_1 Z = Z` against `S_1`: `(1, 1)` | Sound | none |
| §7.2 measure preservation (sampled, headline) | carrier; exhaustion | `𝒟̄ᶜ = {|x_1 − x_2| < 1}` open of infinite measure; complement of `G ∪ 𝒟̄ᶜ` is `𝒟̄ ∖ G`; every `Z ∈ G` passes all steps for small δ (row §6.4) | Sound; ClassicalErgodicTheory §3.5 item 1 as cited | none |
| §7.3 `flow_reversal` (headline) | off `G`; quarter turn | `ℛ` is an involution preserving `G`, so `T_t ℛ Z = ℛ Z = ℛ T_{−t} Z`; `v_1 = (0, −1)` from `(2, 0)` never reaches distance 1 of the origin | Sound | none |
| §7.4 Koopman group | group law; masses; `p = ∞` | `(f ∘ T_{−t}) ∘ T_{−s} = f ∘ T_{−s−t}`; `1 · vol([−1, 1]) = 2`; equally spaced triples at ε = 1/3, dimension 1, `q_3 = 0`; difference of indicators has norm 1 | Sound; `StronglyContinuousGroup` has exactly the three axioms used (pin, line 74) | none |
| §7.5 grand canonical phase space (sampled) | `N = 0`; `N = 1`; packing | `λ_0` is the unit mass, `1/0! = 1`; weight `1/1! = 1`; `7.96 < 8` | Sound; BGSS2023 lines 161–166 | none |
| §8.2 `weak_liouville` (headline) | continuity at a collision | left value `φ(t, X, V(t−)) = φ(t, X, σ_M V(t−))` by the specular condition, right value from the two-sided material derivative at `T_{t_k} Z` | Sound | none |
| §8.4 symmetric expectations (sampled) | `s = 2, N = 3`; `s = 0`; unnormalised; `s > N` | `3 · 2 = 6` against `3² = 9`; one empty injection, both sides `∫ W_N h()`; `2e^{−2} = 0.27067` both sides; `descFactorial 1 2 = 0` against `1!/0! = 1` | Sound; BGSS2023 (1.1.9), line 249 | none |
| §9.1–9.3 | Tau Ceti density; canonical Φ; partition function | `(2π)^{−d/2} β^{d/2} e^{−β|v − u|²/2}` for `S = β⁻¹ · 1`; `Σ|v_i − u|² = 2H − 2⟨u, P⟩ + N|u|²`; `(2π)^{3/2} = 15.7496`; `Z = e²`, `2e^{−2} = 0.27067` | Sound | none |
| §9.4 grand canonical invariance (sampled, headline, repair) | indicator profile; renamed position profile | `g(v)g(w) = 1` against `g(0.9, 0.9) g(0) = 0`, `|(0.9, 0.9)| = 1.2728`; `r(0) = 1.5`, `r(−1/4) = 1` | Sound | none |
| §9.5 correlation functions (headline) | mass; Poisson; volume factor | `Σ_N (1/N!)(N!/(N − n)!) ∫ W^{(n)}_N h = μ^n ∫ F_n h`; `λ² = 1` against `λ + λ² = 2`; `0.8 · 2.5066 = 2.0053` | Sound | none |
| §9.6 `boltzmannGrad_scaling` (headline) | factorisation; bound | extra particles admissible and at distance `≥ ε` from `x_1..x_n` on both sides; `μ_ε ω_d ε^d = ω_d ε`, `4.18879 · 0.01 = 0.0419` | Sound | none |
| §10.1, §10.2 | second moment; loss term; β = 0 | `μ^{−2}(μ ∫ F_1 h² + μ² ∫ F_2 h ⊗ h)`; `ω_2 = π`, mean speed `√(8/π)`; `v' = (r/2)(1, 1)`, `w' = (r/2)(1, −1)`, speeds `r/√2` | Sound | none |
| §10.3 mild solutions (sampled) | Maxwellian; d = 1; wrong sign | `Q(M, M) = 0`; `σ_{±1}(v, w) = (w, v)`, integrand 0; `f⁰(π(1/2), 1) = 0.5 M(1)` against `1.5 M(1)` | Sound | none |
| §10.4 `LanfordStatement` (sampled) | BGSS2023 Theorem 1; hypotheses; structures | two printed conclusions, the third derived (R01); sum bound `≤ C₀` implies each `≤ C₀`, each `≤ C₀` implies sum `≤ 2C₀`; `|det B| = 1` and norm `≤ 1` give `B` orthogonal; conjugation by `(X, V) ↦ (X, BV)` | Supported | R01 (locator) |
| §10.5 law of large numbers (headlines) | variance limit; d = 1; wrong `F_2` | `0 + m² − 2m² + m² = 0`; `1 − e⁻¹ = 0.63212`; `2m² − 2m² + m² = m²` | Sound | none |

### Seeded source sample

The author flagged no locator as unverified. I opened the three readable texts at every locator of the fifteen sampled targets.

| Target | Text opened and result |
|---|---|
| 1.1 | GST2013 line 833 (`N` particles in `ℝ^d`); BGSS2023 line 119 (the torus, `d ≥ 2`). Confirmed as the two settings. |
| 2.1 | GST2013 lines 843–847 (reflection law, precollisional sign) and 1222–1227 (pre-image formula); BGSS2023 lines 125–131; DengHaniMa2024 lines 157–163. Confirmed; the three sign conventions agree with `σ_ν`. |
| 2.2 | GST2013 lines 394–400 (involution, line 400), 432–437 (unit Jacobians, (2.2.1)), 674 and 1264–1268 (the kernel). Confirmed; the cross-section value is the roadmap's own, as it says. |
| 3.5 | GST2013 (2.1.3), lines 396–399. Confirmed. |
| 4.2 | GST2013 lines 842–847; BGSS2023 lines 133–136. Confirmed. |
| 4.4 | GST2013 line 883; DengHaniMa2024 Proposition 1.2(3), lines 186–187. Confirmed as "statement used". |
| 4.5 | GST2013 lines 875–887. Confirmed as the step it serves. |
| 6.2 | GST2013 lines 875–887. Confirmed. |
| 7.1 | GST2013 line 862; BGSS2023 lines 132–139; DengHaniMa2024 lines 173–178. Confirmed. |
| 7.2 | GST2013 line 883; DengHaniMa2024 line 186. Confirmed. |
| 7.5 | BGSS2023 lines 158–166; DengHaniMa2024 lines 199–204. Confirmed. |
| 8.4 | BGSS2023 (1.1.9), lines 241–266, on the page after the marker at line 195 (printed p. 3); the indicator at line 249. Confirmed. |
| 9.4 | BGSS2023 lines 267–268, 479–483, 3539. Confirmed; the invariance is derived here, as the README says. |
| 10.3 | BGSS2023 (1.2.1), lines 292–304; GST2013 (2.1.1), lines 380–384. Confirmed as the equation; the mild form is the roadmap's definition. |
| 10.4 | BGSS2023 Theorem 1, lines 316–321, with (1.1.5) at line 168; GST2013 Theorem 4 and Remark 3.1.1, lines 668–696; Theorem 8, lines 2069–2080. Two of the three conclusions are printed there (R01). |

Also read: GST2013 lines 42–118 (contents), 209–216, 487–493, 826–939, 1136–1141, 1210–1227; BGSS2023 lines 116–237, 238–372; DengHaniMa2024 lines 138–290.

### Pinned declarations

Every library declaration the README names was opened at the pins (paths relative to each library).

- Tau Ceti: `TauCeti/Probability/Distributions/Gaussian/Density.lean:82`, `:265` (`hS : S.PosDef`); `TauCeti/Analysis/Semigroups/Group/Basic.lean:74` (fields `map_zero'`, `map_add'`, `continuousAt_zero'`); `TauCeti/Probability/Process/EmpiricalMeasure.lean:224` (a `ProbabilityMeasure`); `TauCeti/Dynamics/Flow/OfLipschitz.lean:59`.
- Mathlib: `Analysis/InnerProductSpace/PiL2.lean:114`; `MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean:308`; `Analysis/Normed/Group/Quotient.lean:168`, `:222` (`[IsClosed (S : Set M)]`, additive by `to_additive`); `MeasureTheory/Constructions/Polish/Basic.lean:119`, `:148`, `:154`, `:649` (`[N.Normal]`, `[IsClosed (N : Set G)]`); `Topology/Algebra/OpenSubgroup.lean:377` (`[T1Space G]`); `Algebra/Module/ZLattice/Basic.lean:93`, `:352`, `:434`; `Algebra/Module/ZLattice/Covolume.lean:73`, `:85`; `MeasureTheory/Group/FundamentalDomain.lean:59`, `:731`, `:754`, `:801`; `MeasureTheory/Measure/Haar/Quotient.lean:75`, `:222` (`[IsFiniteMeasure μ]`, a fundamental domain for `Γ.op`), the additive name used at `MeasureTheory/Integral/IntervalIntegral/Periodic.lean:94`; `Topology/Instances/AddCircle/Real.lean:55`; `Analysis/Fourier/AddCircleMulti.lean:173`; `MeasureTheory/Function/Jacobian.lean:1096`, `:1184`; `Analysis/InnerProductSpace/Projection/Reflection.lean:52`, `FiniteDimensional.lean:59`; `MeasureTheory/Measure/Lebesgue/EqHaar.lean:172`, `:231`, `:527` (`[Nontrivial E]`); `LinearAlgebra/Matrix/Determinant/Basic.lean:734`; `MeasureTheory/Constructions/HaarToSphere.lean:52`, `:88`; `Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:330` (`0 < b`); `Probability/Distributions/Gaussian/Real.lean:47`, `Multivariate.lean:166`; `Probability/Distributions/Poisson/Basic.lean:40`; `MeasureTheory/Constructions/Pi.lean:732`; `MeasureTheory/Function/LpSpace/Basic.lean:595`, `:611`; `MeasureTheory/Function/ContinuousMapDense.lean:142`; `MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean:1140`; `Probability/Moments/Variance.lean:398`; `Data/Nat/Factorial/Basic.lean:332`, `:367`, `:424` (`k ≤ n`); `MeasureTheory/MeasurableSpace/Constructions.lean:871`; `MeasureTheory/Measure/Sum.lean:30`; `Dynamics/Flow.lean:85`; `Topology/MetricSpace/ProperSpace.lean:66`.

Duplication by object at the pins: a search of both libraries for hard spheres, Maxwellians, the Boltzmann operator, specular reflection and a flat-torus type finds only the Maxwell–Boltzmann law of the speed (`TauCeti/Probability/Distributions/Chi/Gaussian.lean`, another object) and the Boltzmann entropy of optimal transport. The 17 names in `scratch/citations.md` are this roadmap's own `HardSphere.*` names, expected at the design stage; README line 85 lists them as the declarations of the future `Suggested.lean`.

### Duplication, ownership and overlap

`scratch/overlaps.md` (main `0a79ce7`, 450 open heads) lists no other pull request changing this roadmap, no dropped id, no id that only a revision defines and no second copy. Main has no folder `TauCetiRoadmap/HardSphereDynamicsAndKineticLimits`; the two packages of `scratch/board-packages-index.txt` (AnalyticNumberTheory, LawrenceVenkateshMethod) are other subjects. Object searches over main and the open heads (`roadmaps grep`), run this round: "Boltzmann–Grad", "BBGKY", "Lanford", "Maxwellian", "grand canonical", `HardSphere.`, `FlatTorus`, `FlatPositionSpace`, "collision operator": no match anywhere. "hard sphere": ClassicalErgodicTheory (consumer mentions only) and one line on main. "Liouville equation": SpecialFunctionsLegendre (Sturm–Liouville). "specular": two lines on main about billiard chords.

Cross-roadmap citations resolved this round:

- ClassicalErgodicTheory, at the head of its open pull request (another author's, adding a new roadmap folder; head `e3c5108`): §3.5 "Flows defined almost everywhere" works with "a standard Borel space `X` and a σ-finite measure"; item 1 (a measurable set with null complement carrying a measurable flow, extension "satisfying the group law everywhere"); item 3 ("a measure on the union is invariant iff each component restriction is"); item 4 (`(Φ t)_* ν = μ.withDensity (W ∘ Φ (-t))`); its conventions define a measurable flow as a jointly measurable `AddAction ℝ X`; §0.2 assumes "`μ` is a finite invariant measure and `1 ≤ p < ∞`". Each agrees with the contract and the scope paragraph.
- On main: MathematicalBilliards §10.3 (line 768, area `4 · 1 = 4`), §10.5 (line 788, `ℂ/Λ` as a translation surface), §12.3 (line 897, a probability space, `Lp ℂ 2 μ`); ProbabilisticAndMetricNumberTheory §4.9a (heading at line 6319, `scalarLpKoopman_strong` at 6363: a continuous action, a locally finite measure, `p ≠ ∞`); RandomMatrices §8.1 (line 1133, the factorial-moment definition); StandardDistributions Layer 5; ComplexTori; `Completed/OneParameterSemigroups`.

This roadmap owns the hard-sphere objects and `FlatTorus` because no roadmap on main or open states them.

Overlap check: read ClassicalErgodicTheory, PointProcesses, RelativisticQuantumFieldTheory, HamiltonianSystems, IncompressibleFlows, MathematicalBilliards, OptimalTransport and RandomMatrices (third list empty); conull flows, their disjoint unions and the transport of densities: owner ClassicalErgodicTheory §3.5, cited here; the translation-surface structure of `ℂ/Λ`: owner MathematicalBilliards §10.5, not restated; Koopman strong continuity for finite measures or continuous actions: owners ClassicalErgodicTheory §0.2, MathematicalBilliards §12.3 and ProbabilisticAndMetricNumberTheory §4.9a, not shared for the infinite measure and the discontinuous flow; correlation functions of eigenvalue counts: owner RandomMatrices §8.1, a different carrier; unlabelled point processes, factorial and Janossy measures: owner PointProcesses, not restated and not cited as a supplier; the periodic box of RelativisticQuantumFieldTheory §7.4 is Mathlib's `UnitAddTorus` with rescaled coordinates, not a quotient-norm torus; Liouville's theorem on a symplectic vector space (HamiltonianSystems), the Boltzmann entropy (OptimalTransport) and flows on `UnitAddTorus` (IncompressibleFlows) are other objects; nothing else shared.

### Supplier order

```text
candidate: HardSphereDynamicsAndKineticLimits is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 237 roadmaps, 2239 edges, 0 problem(s)
```

No UPWARD or CYCLE line. ClassicalErgodicTheory is not in `merge-order/ORDER.txt`, so the check does not see that edge. By reading, the direction is one way: its §3.5 needs its own §§0.1, 3.1, 3.3 and MathematicalBilliards §§8.2–8.3, and it names the hard-sphere flow only as a consumer of §3.5. No roadmap of the never-cite list is cited as a supplier (PointProcesses is named only as the owner of a neighbouring subject). No target needs a later one.

### Shape and headline theorems

Every numbered section has its hypotheses in the sentence, a locator or the words "derived here", and at least three Checks (3 to 7); every definition has an API list or states its properties in the defining paragraph; every layer ends with `### Examples` and `### Dependencies`.

Headlines named for the package stage: `HardSphere.IsTrajectory.eqOn` (§5.2), `HardSphere.volume_hardCoreSet_diff_goodSet` (§6.4), `HardSphere.flow_add` (§7.1), `HardSphere.measurePreserving_flow` (§7.2), `HardSphere.flow_reversal` (§7.3), `HardSphere.weak_liouville` (§8.2), `HardSphere.grandCanonical_flow_invariant` (§9.4), `HardSphere.lintegral_sum_distinct_eq_correlation` (§9.5), `HardSphere.boltzmannGrad_scaling` (§9.6), `HardSphere.tendsto_empirical_of_correlation` and `HardSphere.LanfordStatement.tendsto_empirical` (§10.5). Each names the roadmap's objects. The padding probe and the `#check` comparison have nothing to run on at this stage.

### Copyright, licences and scope

- **Wording.** Beside the locators of the fifteen sampled targets I compared nine further passages with the source text: §5.5's description of the excluded data with GST2013 lines 851–854; the routes of §6.3–6.4 with GST2013 lines 875–910; §8.3's inheritance with GST2013 lines 933–938; the Summary with GST2013 lines 848–856; §9.3's exchangeability sentence with BGSS2023 lines 184–187; §10.5's first theorem with BGSS2023 lines 341–349 and its route with lines 352–371; §5.4 with DengHaniMa2024 lines 157–169; §9.6 with DengHaniMa2024 lines 246–252. No run of more than four consecutive words is shared (terms of art only), and no sentence follows a source clause by clause.
- **Arrangement.** GST2013 has the largest share: 52 of the 129 occurrences of a source key in the README (BGSS2023 44, DengHaniMa2024 24, the six others 9). Its contents (lines 42–116): Chapters 1–3 the low density limit, the Boltzmann equation and the main results; Chapter 4 the `N`-particle flow, the Liouville equation, its weak form and the hierarchies; Chapters 5–7 estimates and convergence; Part III potentials; Part IV term-by-term convergence. Layers 1, 3, 4 and 9 have no counterpart there; Layers 5–7 expand its §4.1; Layer 8 covers its §§4.2–4.3 without the hierarchies; the collision operator of its Chapter 2 comes last, in Layer 10. No run of layers maps one to one onto a run of its chapters or sections. The order is forced where it coincides: §6.2 needs §4.4–4.5 and §5.1–5.2, §7.1 needs §6.4, §8.1 needs §7.2, §9.5 needs §8.1 and §8.4, §10.1 needs §9.5.
- **Reuse.** No table, figure, list of examples or numerical data is taken from a source.

Source independence: 24 passages compared with 3 sources, none shared; largest share GST2013, 52 of 129 locators; contents compared with GST2013: independent.

## Not verifiable

- Alexander1976 Proposition 4.3 and AlexanderThesis1975 Chapter 1: settled uncertified; only the attribution in GST2013 (line 855) was read.
- Lanford1975, CIP1994, Spohn1991, Uchiyama1988: settled uncertified; not read, not requested again.
- The agreement of the arXiv numbering of BGSS2023 (v2) with the journal version named in the References: the journal text was not read; every locator is into the arXiv text the manifest records.
- Lean elaboration, the one-tactic padding probe and the `#check` comparison: not available (this lane does not elaborate), and there is no `Suggested.lean`. Library names were checked by reading the pinned sources, not by elaboration.
- The truth of `HardSphere.LanfordStatement` beyond its agreement with BGSS2023 Theorem 1, its `t = 0` case and its equilibrium case: the proof belongs to a later roadmap.
- The dependency check's verdict on the ClassicalErgodicTheory edge: the tool does not see it; the direction was checked by reading.

## Source issues

- none

## For the human reviewers

- **Licence.** Six of the nine manifest entries are `uncertified` (`sources.toml`: Alexander1976, AlexanderThesis1975, Lanford1975, CIP1994, Spohn1991, Uchiyama1988); the theorems attributed to Alexander and Lanford were checked only against GST2013 and BGSS2023.
- **Licence.** DengHaniMa2024 is cited as the preprint arXiv:2408.07818v3, with no journal reference (README References).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4aa8c07c793291b04f0b6bfa6b0675e14a89d639", "job": "REV-DESIGN-HardSphereDynamicsAndKineticLimits~17", "model": "fable", "worker": "chris-x55"} -->
