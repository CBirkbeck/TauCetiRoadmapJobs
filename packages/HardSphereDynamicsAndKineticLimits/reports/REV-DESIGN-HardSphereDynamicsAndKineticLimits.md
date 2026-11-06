<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/6907#issuecomment-6674007743 -->
Review (claude) of 9b8c182

Verdict: needs_changes

1. **F01** (P2) Step set of §6.2 applies the pair map of §4.5 outside its domain

   Location: `design/README.md` line 463, "For `R > 0` and `0 < δ` with `ε + 2Rδ < ρ`, let `S_{δ,R}` be the set … no particle within `ε + 2Rδ` of two others … the step map `Φ_δ`, the product of the pair maps of §4.5 on the near pairs"; `design/plan.json` target 6.2, hypotheses `ε + 2Rδ < ρ`.

   Claim: `Φ_δ` is defined on `S_{δ,R}` as the product of the pair maps `P^{ij}_δ` of §4.5 on the near pairs (pairs at distance at most `ε + 2Rδ`).

   Witness: §4.5 (line 351) defines `P^{ij}_s` only on configurations with `‖x_i − x_j‖ + 2Rs < ρ`. Unit torus (`ρ = 1/2`), `ε = 0.3`, `R = 1`, `δ = 0.09`: the §6.2 hypothesis holds (`ε + 2Rδ = 0.48 < 0.5`), the pair at torus distance `0.47 ≤ 0.48` is near, but `0.47 + 2Rδ = 0.65 ≥ ρ`, so `P^{ij}_δ` is not defined on it and `Φ_δ` is not defined on all of `S_{δ,R}`. (The dynamics itself is fine there: a wrap-around contact needs a nonzero kernel vector of norm at most `2ε + 4Rδ = 0.96 < 2ρ = 1`; only the §4.5 chart domain is missed.)

   Repair: in §6.2 replace the hypothesis `ε + 2Rδ < ρ` by `ε + 4Rδ < ρ` (near pairs then satisfy `‖x_i − x_j‖ + 2Rδ ≤ ε + 4Rδ < ρ`, the domain of §4.5 with `η = 4Rδ`); in §6.3 say "for every `δ` with `ε + 4Rδ < ρ`" (the bound `C δ` is only needed as `δ → 0`); in §6.4 and §7.2 nothing changes, since they take `δ → 0`; update `plan.json` 6.2 hypotheses to `ε + 4Rδ < ρ`. Tested on the witness: with `δ = 0.045`, `ε + 4Rδ = 0.48 < 0.5`, near pairs are at distance at most `0.39`, and `0.39 + 0.09 = 0.48 < ρ`.

2. **F02** (P3) §1.3 re-plans the quotient Haar measure that Mathlib already has

   Location: `design/README.md` line 114, "define `FlatTorus L` … with the measure equal to the image of Lebesgue measure restricted to any measurable fundamental domain … Prove that this measure does not depend on the fundamental domain, that it satisfies `MeasureTheory.AddQuotientMeasureEqMeasurePreimage`"; line 41, "It does not by itself provide a `MeasureSpace` instance on `E ⧸ L`".

   Claim: the pushforward of the restricted Haar measure, its typeclass property and its Haar-ness are targets of this roadmap.

   Witness: at the pin, `Mathlib/MeasureTheory/Measure/Haar/Quotient.lean` line 262 `IsFundamentalDomain.QuotientMeasureEqMeasurePreimage_HaarMeasure` (with `@[to_additive]`) gives the typeclass for a measure agreeing with `ν(π⁻¹V ∩ 𝓕)` on one set with nonempty interior; line 222 `MeasureTheory.QuotientMeasureEqMeasurePreimage.haarMeasure_quotient` (additive form) proves such a finite measure is Haar; line 75 `measurePreserving_quotientAddGroup_mk_of_AddQuotientMeasureEqMeasurePreimage` (used at `Mathlib/MeasureTheory/Integral/IntervalIntegral/Periodic.lean` line 94) makes the quotient map measure preserving from `ν.restrict 𝓕`. Also, for `L : Submodule ℤ E` the carrier `E ⧸ L` is the submodule quotient: its normed-group instance is `Submodule.Quotient.normedAddCommGroup` (`Mathlib/Analysis/Normed/Group/Quotient.lean` line 433, `IsClosed` hypothesis), while `QuotientAddGroup.instNormedAddCommGroup` and `QuotientAddGroup.norm_mk` (line 168, `@[to_additive]`) are for `E ⧸ L.toAddSubgroup`; `QuotientAddGroup.borelSpace` (`Mathlib/MeasureTheory/Constructions/Polish/Basic.lean` line 648, `@[to_additive]`) likewise takes an `AddSubgroup`.

   Repair: in §1.3 keep only the `MeasureSpace` instance (the choice of a fundamental domain from `ZLattice.isAddFundamentalDomain`, `Mathlib/Algebra/Module/ZLattice/Basic.lean` line 645) and the total-mass and independence statements, and cite the three Haar/Quotient declarations above for the typeclass, the Haar property and the measure preservation of the quotient map; add them to "From Mathlib". State which quotient is used: either `E ⧸ L.toAddSubgroup` (then the `QuotientAddGroup.*` names apply as cited) or `E ⧸ L` with `Submodule.Quotient.normedAddCommGroup`, transporting `QuotientAddGroup.norm_mk` along the definitional equality.

3. **F03** (P3) §8.2 cites the fundamental theorem of calculus in a form whose hypothesis fails at collision times

   Location: `design/README.md` line 592, "differentiable off the finitely many collision times in each bounded interval with derivative `Lφ(t, T_t Z)`, so `intervalIntegral.integral_eq_sub_of_hasDerivAt` on each collision-free piece"; line 53.

   Claim: the cited lemma applies on each piece `[t_k, t_{k+1}]` between collision times.

   Witness: `Mathlib/MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean` line 1148 `integral_eq_sub_of_hasDerivAt (hderiv : ∀ x ∈ uIcc a b, HasDerivAt f (f' x) x)` requires the derivative at the endpoints; at a collision time `g(t) = φ(t, T_t Z)` is only continuous (the specular condition matches the two one-sided values, the one-sided derivatives differ when `Lφ` jumps). The head-on witness with `φ(t, Z) = χ(t) ψ(⟨x_1 − x_2, e_1⟩)`, `ψ` bounded smooth and equal to the identity on `[−10, 10]` (admissible: bounded, positions are unchanged by `σ_M`), has `g(t) = χ(t)(2 − t)` for `t < 1` and `g(t) = χ(t)(1 + (t − 1)) = χ(t) t` for `t ≥ 1`, with left derivative `χ'(1) − χ(1)` and right derivative `χ'(1) + χ(1)` at `t = 1`.

   Repair: cite `intervalIntegral.integral_eq_sub_of_hasDerivAt_of_le` (same file, line 1140: `a ≤ b`, `ContinuousOn f (Icc a b)`, `HasDerivAt` on `Ioo a b`, interval integrability of `f'`), in §8.2 and in "From Mathlib".

4. **F04** (P3) §2.2 locator for the total cross-section formula

   Location: `design/README.md` line 176, "Prove the total cross-section formula `∫_{S^{d−1}} ⟨k, ω⟩_+ dσ_S(ω) = ω_{d−1} |k|` for `d ≥ 2` … (GST2013 lines 394–400 and 432–437)"; `plan.json` 2.2 locator.

   Claim: GST2013 states the formula at those lines.

   Witness: GST2013 lines 394–400 state that `(v, v_1, ω) ↦ (v', v'_1, −ω)` is an involution and the conservation laws (2.1.3); lines 432–437 state (2.2.1) with the unit Jacobians. Neither gives the integral of `⟨k, ω⟩_+`; the hard-sphere kernel `b(w, ω) = (ω·w)_+` appears at lines 674 and 1264–1268. BGSS2023 and DengHaniMa2024 do not state it either. The formula is true: the integral equals `|k|` times the area of the projection of the hemisphere `{⟨e, ω⟩ > 0}` onto `e^⊥`, the unit ball of `ℝ^{d−1}`, so `d = 3` gives `π|k|` and `d = 2` gives `2|k|`, as the Checks say.

   Repair: keep lines 394–400 and 432–437 for the involution and the unit-Jacobian claims, cite GST2013 lines 1264–1268 for the hard-sphere kernel, and present the cross-section value as an elementary computation of this roadmap (polar coordinates in `e^⊥ × ℝ` from `MeasureTheory.Measure.toSphere`), without a source locator; mirror in `plan.json` 2.2.

5. **F05** (P3) Stale pin hashes

   Location: `design/README.md` line 35, "The baseline is Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`"; line 60, "The baseline is Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`"; `plan.json` `baseline`.

   Claim: the cited declarations were read at those pins.

   Witness: `lake-manifest.json` of the content checkout pins Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5` (the Tau Ceti pin moved on 2026-11-05, commit a891cd19). Every declaration of "From Mathlib" and "From Tau Ceti" was opened at the current pins (list under Verified sound) and exists there.

   Repair: write "at the pinned Mathlib and Tau Ceti" in both places without a hash, and set `plan.json` `baseline` to the manifest's hashes at submission (they go stale between rounds).

6. **F06** (P3) Elementary scattering lemmas planned as `Suggested.lean` headlines

   Location: `design/README.md` line 156, "The headline statement is `HardSphere.measurePreserving_scatter`, with `HardSphere.scatter_involutive` and `HardSphere.scatter_conserves`"; line 75.

   Claim: the three §2.1 names are headline theorems of the roadmap.

   Witness: `σ_ν ∘ σ_ν = id`, `v' + w' = v + w` and `|v'|² + |w'|² = |v|² + |w|²` are polynomial identities in `⟨v − w, ν⟩` and `|ν| = 1` (`σ_ν(σ_ν(v, w)) = (v' + ⟨v − w, ν⟩ν, w' − ⟨v − w, ν⟩ν)` since `⟨v' − w', ν⟩ = −⟨v − w, ν⟩`); `measurePreserving_scatter` is `Submodule.reflection` preserving Lebesgue measure (`Submodule.det_reflection`, `Mathlib/Analysis/InnerProductSpace/Projection/FiniteDimensional.lean` line 59). At the package stage these are API lemmas that mirror the §2.1 API bullets and Checks, the pattern pull-request reviews reject as padding.

   Repair: remove the three names from the `Suggested.lean` list at line 75 and the sentence at line 156 (the README keeps the statements as the API and Checks of §2.1); the headline list then reads `IsTrajectory.eqOn`, `volume_hardCoreSet_diff_goodSet`, `flow_add`, `measurePreserving_flow`, `flow_reversal`, `weak_liouville`, `grandCanonical_flow_invariant`, `lintegral_sum_distinct_eq_correlation`, `boltzmannGrad_scaling`, `tendsto_empirical_of_correlation`, `LanfordStatement.tendsto_empirical`, each needing the definitions already listed.

Files reviewed (read-only): `packages/HardSphereDynamicsAndKineticLimits/design/README.md`, `packages/HardSphereDynamicsAndKineticLimits/design/plan.json`, `packages/HardSphereDynamicsAndKineticLimits/sources.toml`. No previous review. No `Suggested.lean` exists at the design stage, so the one-tactic probe and the elaboration are not applicable (the lane does not elaborate; the headline list is checked against the README's own list at line 75 instead).

Dependency gate, run on the design README against the merge order:

```
candidate: HardSphereDynamicsAndKineticLimits is not in the merge order yet; checked as if placed after GlaubermanZStar (the intake inserts it when its design is accepted)
depcheck: 242 roadmaps, 2362 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The design declares no gaps and consumes no roadmap section (`plan.json` `suppliers: []`, `gaps: []`), so there are no conditional gaps.

## Verified sound

**Principles.** No route-specific shortcut (every dynamical statement is for `d ≥ 1`, every flat position space, every `0 < ε < ρ`); no roadmap re-planned (no hard-sphere, Boltzmann, Lanford or kinetic-limit roadmap exists on main, in the board's packages index, or in the 459 open pull requests: `roadmaps grep` for `hard sphere|Lanford|Boltzmann|BBGKY|Maxwellian|specular|grand canonical|flat torus|Koopman` hits only generic Koopman material, see Ownership); no supplier roadmap, hence no direction problem; statements in the author's words with line locators; no algorithm; no process residue (no pull-request number, date, path or LaTeX delimiter in the README; the only process-like text is the pin hashes of R05).

**Sources: the seeded sample** (15 targets), checked at the cited lines of the cached texts.

| Target | Locator checked | Result |
|---|---|---|
| 1.1 | GST2013 line 833 (N particles in `ℝ^d`), BGSS2023 line 119 (torus `𝕋^d`, `d ≥ 2`) | supports the two settings; the class is the roadmap's own abstraction |
| 1.2 | GST2013 lines 833–841 (`D_N`, free flow) | supports |
| 2.2 | GST2013 394–400, 432–437 | involution and unit Jacobians supported; cross-section value not there (R04) |
| 3.2 | BGSS2023 148–152 (`∂D^{ε±}_N(i,j)`: single contact `{i,j}`, `±(v_i − v_j)·(x_i − x_j) > 0`) | supports, with the normal `ν_ij = (x_i − x_j)/ε` |
| 3.3 | GST2013 1219–1227 ((4.4.1): pre-image `v*_i = v_i − ω·(v_i − v_{s+1})ω`, `σ(z*_i, z*_{s+1}) = (z_i, z_{s+1})`) | supports contact scattering as the pre-image map |
| 3.4 | GST2013 836–837 ((4.1.1)), BGSS2023 122–123 ((1.1.1)) | supports |
| 6.1 | GST2013 864–874 (Lemma 4.1.1: `I ⊆ {∃ {i,j,k} distinct, |x_i − x_j|, |x_i − x_k| ∈ [ε, ε + 2Rδ]}`, bound `C ρ^{d(N−2)} δ²`) | supports; the README's explicit constant is the Fubini count (table below) |
| 7.2 | GST2013 line 883 ("Since the measure is invariant by the flow", used without proof); DengHaniMa2024 186–187 (Prop. 1.2(3), proof deferred to Alexander) | supports the statement; the proof is this roadmap's (Layer 4), as the README says |
| 8.2 | GST2013 911–918 ((4.2.1) with `f_N(Z^in) = f_N(Z^out)`), 941–958 ((4.3.1), test functions with the boundary condition `φ(t, Z^in) = φ(t, Z^out)`); BGSS2023 145–157 ((1.1.3)–(1.1.4)) | supports the specular test-function class and the weak form |
| 9.1 | GST2013 489–492 ((2.2.5) `M_{ρ,u,θ} = ρ (2πθ)^{−d/2} e^{−|v−u|²/2θ}`) | supports with `ρ = 1`, `θ = 1/β` |
| 9.4 | BGSS2023 479–483 (equilibrium `f⁰ = M`, invariant measure), 3539 (`M(z'_1)M(z'_2) = M(z_1)M(z_2)`), 267–268 (transport by Liouville) | supports |
| 9.5 | BGSS2023 241–266 ((1.1.9)), 267–277 ((1.1.10)), 279–288 ((1.1.11), `F_n(t) = 0` off `D^ε_n`); DengHaniMa2024 235–244 ((1.11)) | supports, including the inversion formula at 229–237 |
| 9.6 | BGSS2023 211–217 ((1.1.8) `lim E(N) ε^{d−1} = 1`, `μ_ε = ε^{−(d−1)}`); DengHaniMa2024 246–252 ((1.12) "up to `O(ε)`") | supports; the README's two-sided bound sharpens the `O(ε)` |
| 10.3 | BGSS2023 292–304 ((1.2.1)), GST2013 380–384 ((2.1.1)) | supports; the mild (Duhamel) form is the roadmap's own definition |
| 10.5 | BGSS2023 344–349 (Cor. 1.2.1, smooth `h`), 352–371 (proof via (1.2.7)) | supports; the README's hypotheses (weak convergence of `F_1`, `F_2`) are exactly what the proof uses |

Also checked: 2.1 (GST2013 843–847 (4.1.2), BGSS2023 125–131 (1.1.2), DengHaniMa2024 157–163 (1.2)); 4.1 (GST2013 846–847, 1210–1216); 5.1 (DengHaniMa2024 Definition 1.1, 140–172, left-continuous convention at 164–166); 5.2 (DengHaniMa2024 Prop. 1.2, 182–188); 6.4 (GST2013 Prop. 4.1.1 at 862–863, proof 875–910); 7.4 (GST2013 (4.3.5) at 1138–1140: `T_s(t) f = f ∘ Ψ_s(−t)`; DengHaniMa2024 (1.5) at 175–178); 7.5 and 9.3 (BGSS2023 158–181 (1.1.5)–(1.1.6); DengHaniMa2024 Definition 1.3, 199–223); 8.3 and 8.4 (GST2013 929–938, 216–220); 10.1 (BGSS2023 324–340); 10.2 (BGSS2023 292–312, GST2013 385–393, DengHaniMa2024 258–282); 10.4 (BGSS2023 Theorem 1 at 316–321: `f⁰` with (1.1.5), `T₀` depending on `C₀, β₀`, `F^ε_1 → f` uniformly on compacts, `F^ε_n → f^{⊗n}` a.e.; GST2013 Theorem 4 at 668–674, Remark 3.1.1 at 687–696, Theorem 8 at 2069–2080). The README's §10.4 hypotheses (continuity, Gaussian bound, Lipschitz bound in `x`) are implied by (1.1.5) (`|∇_x f⁰| ≤ C₀ e^{−β₀|v|²/2}` gives the Lipschitz bound along lifted segments) and contain GST2013 Theorem 4's (continuity and the Gaussian bound), so the proposition is not weaker than the sources; its weak-convergence conclusion for every `n` is not in Theorem 1's wording but follows from the almost-everywhere convergence together with the uniform Gaussian bounds on `F^ε_n` that the cited proofs produce (BGSS2023 uses it tacitly at 369–371, see Source issues).

**Adversarial pass** (sampled targets, headline theorems, finding-touched targets; values computed on both sides).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 lift/injectivity axioms on the torus | `ℝ/ℤ` (`d = 1`); `ℤ²` (`d = 2`) | injectivity on `B(0, ρ)` forces nonzero kernel vectors to have norm `≥ 2ρ` (`k/2, −k/2 ∈ B(0,ρ)` and `π(k/2) = π(−k/2)`), so `ρ ≤ 1/2` for `ℤ^d`; class of `(1/2,1/2)`: `infDist = √2/2 = 0.7071`; lift of `(0.9, 0)` is `(−0.1, 0)` | sound | none |
| 1.1 non-instance `UnitAddTorus (Fin 2)` | class of `(0.1, 0.1)` | sup norm `0.1`; Euclidean norm of every lift `≥ 0.1√2 = 0.1414` | sound (Check discriminates) | none |
| 1.3 total mass, `ρ` | `2ℤ × ℤ` | covolume `2`; shortest vector `e_2`, `ρ = 1/2`; probability normalisation gives ball of radius `1/4` mass `π/32 ≠ π/16` | sound | R02 (cite Mathlib) |
| 1.4 shell and packing | `d = 2`, unit torus, `ε = 0.4`; `d = 1` torus shell `[0.4, 0.6]` | `ω_2 (0.2)² = 0.12566`, `7 × 0.12566 = 0.880 ≤ 1 < 8 × 0.12566 = 1.005`; `d = 1`: true measure `2 × 0.1 = 0.2`, formula `0.4` (so `r₂ < ρ` needed) | sound | none |
| 2.1 `σ_ν` is the reflection in `(ν, −ν)^⊥` | `n = (ν,−ν)/√2` | `(v,w) − 2⟨(v,w), n⟩ n = (v − ⟨v−w,ν⟩ν, w + ⟨v−w,ν⟩ν)`; `det = (−1)^{dim span(ν,−ν)} = −1` | sound | none |
| 2.1 witness and non-example | `ν = (1,0)`, `v = (0, 0.9)`, `w = (0.9, 0)`; head-on | `⟨v−w,ν⟩ = −0.9`, `σ = ((0.9,0.9),(0,0))`, energy `0.81 + 0.81 = 1.62 + 0`; head-on exchanges `(1,0) ↔ (−1,0)`; separate reflection flips momentum `(1,0) ↦ (−1,0)` | sound | R06 (not headlines) |
| 2.2 `Θ` preserves `⟨w − v, ω⟩_+` | §2.1 witness | `(w−v)·ω = 0.9`; `(w'−v')·(−ω) = ((0,0) − (0.9,0.9))·(−1,0) = 0.9` | sound | none |
| 2.2 cross-section | `d = 3`, `d = 2`, `d = 1` | `ω_2 = π`, `ω_1 = 2`; probability normalisation would give `π|k|/(4π) = |k|/4`; `d = 1`: `S⁰` has mass `2`, integral `|k| = ω_0 |k|`, so the formula also holds at `d = 1` (README claims only `d ≥ 2`, weaker and true) | sound | R04 (locator) |
| 3.2 contact normal through the torus | unit torus, `ε = 0.3`, `x_i = π(0.1,0)`, `x_j = π(0.8,0)` | `x_i − x_j = π(0.3, 0)`, short lift `(0.3,0)`, norm `0.3 = ε`, `ν_ij = (1,0)`; raw difference `(−0.7,0)` has norm `0.7` | sound | none |
| 3.2 matching | `0, (1,0), (−1,0)`, `ε = 1` | pairs `{1,2}, {1,3}` share `1` | sound | none |
| 3.3 `ℛ` on an outgoing contact | `x_1 = (1,0)`, `x_2 = 0`, `V = ((1,0), 0)` | `⟨v_1 − v_2, ν_12⟩ = 1 > 0`; `σ_M V = (0, (1,0))`; `ℛ = (X, (0, (−1,0)))`, again `⟨(1,0), ν⟩ = 1 > 0` outgoing; `(X, −V)` would be incoming | sound | none |
| 3.4 free flow | unit torus `S_1(π0, e_1)`; `E`: `S_2(0,(1,0))` | `π(e_1) = 0`; `(2,0)`; leaves `𝒟̄_2` at `t = 1.5` (distance `0.5`) | sound | none |
| 4.1 collision time | `a = (2,0)`, `u = (−1,0)`; `(1,3), (0,−1)`; `(2,3), (0,−1)` | `D = 4 − 3 = 1`, `τ = 1`, `q = (1,0)`, `⟨q,u⟩ = −1 = −√D`; `D = 9 − 9 = 0`, `τ = 3`; `D = 9 − 12 = −3`; larger root `3` lands at `(−1,0)` | sound | none |
| 4.2 two-body map | head-on `s = 3`; oblique `a = (3, 0.6)` | `R_q u = (1,0)`, `B_3 = ((3,0),(1,0))`; `D = 9 − 8.36 = 0.64`, `τ = 2.2`, `q = (0.8,0.6)`, `R_q u = (0.28, 0.96)`, norm² `0.0784 + 0.9216 = 1`; wrong continuation `(2,0) + 3(1,0) = (5,0)` | sound | none |
| 4.3 `det DC = 1` | general point of `U` | `d(Y + τU')` with `τ` frozen: `w + dτ(u − U') = w + 2 dτ⟨u,q̂⟩q̂ = w − 2⟨w,q̂⟩q̂ = R_q w` using `⟨q̂, w⟩ + dτ⟨q̂, u⟩ = 0` from `|q| = ε`; `dU' = R_q du + (terms in dq̂, a function of w)`; blocks `R_q, R_q`, `det = 1`; velocity-only reflection `det = −1` | sound | none |
| 4.4 null remainder | fixed `u ≠ 0` | `D = 0 ⟺ |a − ⟨a,û⟩û| = ε` (cylinder); inelastic image `{(q + r u_t, u_t)}` has dimension `(d−1)+(d−1)+1 = 2d−1` | sound | none |
| 4.5 pair map | head-on witness; `(v_i, v_j) ↦ (u, w)` | `P^{12}_3` gives `x_1 = (1,0)`, `x_2 = (−2,0)`, `v_1 = 0`, `v_2 = (−1,0)`; `det [[I, −I],[I, I]] = det(2I) = 2^d` | sound | R01 (domain used by §6.2) |
| 5.3/7.3 reversal | head-on witness | `T_3 Z = ((1,0),(−2,0); 0,(−1,0))`, no contact, `ℛ T_3 Z = ((1,0),(−2,0); 0,(1,0))`; trajectory through `ℛZ = ((2,0),0;(1,0),0)` backward: contact at `t = −1`, state `((1,0),0;(1,0),0)` outgoing, `V(−1−) = (0,(1,0))`, at `t = −3` positions `(1,0), (−2,0)`, velocities `0, (1,0)` = `ℛ T_3 Z` | sound | none |
| 5.5 exceptional set for `N = 2` | `u = 0, |a| > ε`; `D > 0, ⟨a,u⟩ > 0`; `D = 0, u ≠ 0, ⟨a,u⟩ > 0` | constant path, in `G`; past non-grazing collision, in `G`; past grazing contact violates "outgoing", not in `G` | sound | none |
| 6.1 constant | `N` particles, `K`, `R`, `η` | ordered triples `N(N−1)(N−2) ≤ N³`; `x_i ∈ K`: `μ_X(K)`; `x_j, x_k` in the shell `[ε, ε+η]` about `x_i` (needs `ε + η < ρ`): `(ω_d((ε+η)^d − ε^d))²`; remaining `N − 3` positions: `μ_X(K)^{N−3}`; velocities `vol(B^{dN}_R)`; `N = 2`: `I = ∅`; shell area in `d = 2`: `π(2η + η²)` | sound | none |
| 6.2 step set | unit torus, `ε = 0.3`, `R = 1`, `δ = 0.09`, pair at distance `0.47` | `ε + 2Rδ = 0.48 < 0.5` (hypothesis holds), `0.47 + 0.18 = 0.65 ≥ ρ` (pair-map domain fails); wrap-around contact needs a kernel vector of norm `≤ 2ε + 4Rδ = 0.96 < 1` (dynamics correct) | defect | R01 |
| 6.3 bound | GST sum | `δ² Σ_{j<t/δ} (1 + jRδ)^{d(N−2)} ≤ δ t (1 + Rt)^{d(N−2)}` | sound | R01 (δ range) |
| 6.4 Alexander | `N = 1`; `N = 2` on `E` | `G = 𝒟̄_1`; exceptional set = cylinder `D = 0` ∪ contact states, both null | sound | none |
| 7.1 flow law | head-on witness | `T_3` then `T_{−3}` returns `((2,0),0;(−1,0),0)` | sound | none |
| 7.2 measure preservation | inelastic non-example | positive-measure set mapped into a null set (table row 4.4) | sound | none |
| 7.4 Koopman group | `N = 1`, `p = ∞` non-example | `U_t f(x,v) = f(x − tv, v)`; indicator of `B(0,1) × {|v − e_1| < 1/2}` has `‖U_t f − f‖_∞ = 1` for small `t ≠ 0`; for `p < ∞` and continuous compactly supported `f`, `|f ∘ T_{−t}| ≤ ‖f‖_∞ 1_{T_t(supp f)}` with `T_t(supp f)` of finite measure, so dominated convergence applies directly | sound | none |
| 7.5 `Λ` | `N = 0`; unit torus `ε = 0.4`, `d = 2` | empty configuration has mass `1`; components `N ≥ 8` null (row 1.4) | sound | none |
| 8.1 transport sign | `N = 1` | `W(1)((1,0),(1,0)) = W⁰((1,0) − (1,0), (1,0)) = W⁰(0,(1,0))` | sound | none |
| 8.2 weak Liouville | `φ = χ(t)ψ(H)`; `φ = χ(t)⟨v_1, e_1⟩` | `∫ W(t)ψ(H) = ∫ W⁰ ψ(H)` constant, `∫_0^∞ χ' = −χ(0)`, sum `0`; jump of `g` at `τ` is `χ(τ)(⟨v_1', e_1⟩ − ⟨v_1, e_1⟩)`, left side `χ(τ)(⟨v_1,e_1⟩ − ⟨v_1',e_1⟩)∫W⁰` | sound; FTC form wrong | R03 |
| 8.3 marginal | unit torus `N = 2`, `g = g̃(v)` | `W^{(1)} = g(z_1) ∫g̃ · (1 − ω_d ε^d)` (ball of radius `ε < 1/2` has mass `ω_d ε^d`) | sound | none |
| 8.4 symmetric expectation | `s = 2, N = 3, h = 1` | injective maps `3·2 = 6`; all maps `9` | sound | none (the hypothesis "probability" is unused: the identity holds for every symmetric `W_N ≥ 0`; P3 note, no change required) |
| 9.1 Maxwellian | `d = 1`; `d = 3`; Tau Ceti density | `(2π)^{−1/2} = 0.39894`; `(2π)^{3/2} = 15.7496`; `multivariateGaussianPDFReal u (β⁻¹ • 1)`: `(2π)^{−d/2} (β^{−d})^{−1/2} e^{−β|v−u|²/2} = (β/2π)^{d/2} e^{−β|v−u|²/2}`; `e^{−β|v|²}` has variance `1/(2β)` | sound | none |
| 9.2 canonical measure | unit torus `N = 1`; `N = 8`, `ε = 0.4`, `d = 2` | `Z^{can} = 1`; `Z^{can} = 0` (row 1.4) | sound | none |
| 9.3 grand canonical | `ε = 0`, `∫f⁰ = 1`, `μ = 2` | `Z = e²`, `P(N=1) = 2e^{−2} = 0.27067`; bounds `1 + μ∫f⁰ ≤ Z ≤ e^{μ∫f⁰}` (terms `N ≤ 1` have no exclusion; indicator `≤ 1`); without `1/N!` the series `Σ (μ∫f⁰)^N` diverges at `μ∫f⁰ = 1` | sound | none |
| 9.4 invariance | `u ≠ 0`; `g = 1_{|v| ≤ 1}` | `Σ|v_i − u|² = 2H − 2⟨u,P⟩ + N|u|²`; `g(v)g(w) = 1`, `|(0.9,0.9)| = 1.2728`, `g(v')g(w') = 0` | sound | none |
| 9.5 correlation identity, inversion | `n = 1, h = 1`; Gaussian bound | `E[N] = μ∫F_1`; `W_{n+m}(t) ≤ μ^{n+m}C₀^{n+m} e^{−β₀|V|²/2}/Z` by conservation of `H`; `∫F_{n+p} dz_{n+1..n+p} ≤ C₀^{n+p} e^{−β₀|V_n|²/2} (C₀ μ_X(X)(2π/β₀)^{d/2})^p e^{μC₀μ_X(X)(2π/β₀)^{d/2}}/Z`, so `Σ_p μ^p(…)^p/p!` converges | sound | none |
| 9.6 initial chaos | general `n`; `d = 3`, `ε = 0.01` | `F_n(0) = (f⁰)^{⊗n} 1_{𝒟̄_n} · (1/Z)Σ_p (μ^p/p!)∫Π f⁰ 1_{𝒟̄_p} 1[no z_j within ε of X_n] = (f⁰)^{⊗n} 1_{𝒟̄_n} p_ε(X_n)`; `1 − p_ε ≤ E[#particles within ε of some x_k] ≤ n μ ω_d ε^d ‖ρ⁰‖_∞`; `ε^{d−1}E[N] = ∫ f⁰ p_ε ∈ [1 − ω_d ε‖ρ⁰‖_∞, 1]`; `ω_3 × 0.01 = 0.0419` | sound | none |
| 10.1 moments | `h = 1` | `π_t(1) = N/μ`; `E[π_t(h)²] = μ^{−2}(μ∫F_1 h² + μ²∫F_2 h⊗h)` by (1.1.11) at `n = 1, 2` | sound | none |
| 10.2 loss term | `d = 3`, `g = M_{1,0}`, `v = 0` | `M(0) · π · E|W|` with `E|W| = 2√(2/π) = √(8/π)` for the standard 3D Gaussian; Gaussian bound: `g(v')g(w') ≤ C² e^{−β(|v|²+|w|²)/2}` by energy conservation, gain `≤ C'(1+|v|)e^{−β|v|²/2}` | sound | none |
| 10.3 mild solution | `Q = 0`; wrong direction | `f(t, x + π(tv), v) = f⁰(x, v)` gives `f(t, y, v) = f⁰(y − π(tv), v)`; `f⁰(x + π(tv), v)` evaluated along the characteristic gives `f⁰(x + 2π(tv), v) ≠ f⁰(x,v)` | sound | none |
| 10.4 Maxwellian consistency | `f⁰ = M_{β₀,0}`, `C₀ ≥ max(1, (β₀/2π)^{d/2})` | `|F_1(0) − f⁰| ≤ ω_d ε f⁰` uniformly, a.e. convergence off the diagonal, `L¹` convergence by row 9.6; correlation functions constant in `t` by row 9.4 | sound | none |
| 10.5 law of large numbers | general; `F_2 → 2f⊗f` | `E[(π(h) − m)²] = μ^{−1}∫F_1h² + ∫F_2 h⊗h − 2m∫F_1 h + m² → 0 + m² − 2m² + m² = 0`; with `F_2 → 2f⊗f` the limit is `m²`; Chebyshev about the mean `E π(h) = ∫F_1 h → m`: `P(|π(h) − m| ≥ δ) ≤ P(|π(h) − Eπ(h)| ≥ δ/2) ≤ 4 Var/δ²` for `μ` large, so `meas_ge_le_variance_div_sq` applies (its `IsFiniteMeasure` and `MemLp 2` hypotheses hold: probability measure, bounded `h`, finite moments of `N`) | sound | none |

**Library declarations opened at the pins** (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`): `EuclideanSpace.volume_ball` (`Mathlib/MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean` 308); `QuotientGroup.instNormedCommGroup`/`norm_mk` with `@[to_additive]` (`Mathlib/Analysis/Normed/Group/Quotient.lean` 222, 168) and `Submodule.Quotient.normedAddCommGroup` (433); `QuotientGroup.borelSpace` `@[to_additive]` (`Mathlib/MeasureTheory/Constructions/Polish/Basic.lean` 648: `PolishSpace`, `IsTopologicalGroup`, `Normal`, `IsClosed`); `AddSubgroup.isClosed_of_discreteTopology` (`Mathlib/Topology/Algebra/OpenSubgroup.lean` 376, `@[to_additive]`); `IsZLattice` (`Mathlib/Algebra/Module/ZLattice/Basic.lean` 434), `ZSpan.fundamentalDomain` (93), `ZSpan.fundamentalDomain_measurableSet` (338), `ZLattice.isAddFundamentalDomain` (645); `ZLattice.covolume` (`Covolume.lean` 73, real-valued); `MeasureTheory.IsAddFundamentalDomain` (`Mathlib/MeasureTheory/Group/FundamentalDomain.lean` 59), `AddQuotientMeasureEqMeasurePreimage` (731); `UnitAddTorus` (`Mathlib/Topology/Instances/AddCircle/Real.lean` 55, `d → UnitAddCircle`, so the Pi sup norm), `UnitAddTorus.measurePreserving_equivPiIoc` (`Mathlib/Analysis/Fourier/AddCircleMulti.lean` 173); `MeasureTheory.lintegral_abs_det_fderiv_eq_addHaar_image` and `lintegral_image_eq_lintegral_abs_det_fderiv_mul` (`Mathlib/MeasureTheory/Function/Jacobian.lean` 1096, 1184); `Submodule.reflection` (`…/Projection/Reflection.lean` 52), `Submodule.det_reflection` (`…/Projection/FiniteDimensional.lean` 59, `(−1)^{finrank Kᗮ}`); `Matrix.det_fromBlocks_zero₁₂` (`Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean` 734); `MeasureTheory.Measure.addHaar_sphere` (`…/Lebesgue/EqHaar.lean` 527, `[Nontrivial E]`), `addHaar_submodule` (172, `s ≠ ⊤`); `MeasureTheory.Measure.toSphere` (`…/HaarToSphere.lean` 52, `dim E • …` on `Ioo 0 1 • s`), `toSphere_apply_univ` (88); `GaussianFourier.integral_rexp_neg_mul_sq_norm` (`…/Gaussian/FourierTransform.lean` 330, `(π/b)^{finrank/2}`); `ProbabilityTheory.gaussianPDFReal` (`…/Gaussian/Real.lean` 47), `multivariateGaussian` (`Multivariate.lean` 166, Dirac when not `PosSemidef`, 175), `poissonMeasure` (`…/Poisson/Basic.lean` 40, `r : ℝ≥0`); `MeasureTheory.measurePreserving_piCongrLeft` (`…/Constructions/Pi.lean` 732); `MeasureTheory.Lp.compMeasurePreserving` and `norm_compMeasurePreserving` (`…/LpSpace/Basic.lean` 595, 611); `MeasureTheory.MemLp.exists_hasCompactSupport_eLpNorm_sub_le` (`…/ContinuousMapDense.lean` 142: `R1Space`, `WeaklyLocallyCompactSpace`, `μ.Regular`, `p ≠ ∞`); `intervalIntegral.integral_eq_sub_of_hasDerivAt` (`…/FundThmCalculus.lean` 1148) and `_of_le` (1140); `ProbabilityTheory.meas_ge_le_variance_div_sq` (`Mathlib/Probability/Moments/Variance.lean` 398, `[IsFiniteMeasure μ]`, `MemLp X 2 μ`); `Sigma.instMeasurableSpace` (`…/MeasurableSpace/Constructions.lean` 871); `MeasureTheory.Measure.sum` (`Mathlib/MeasureTheory/Measure/Sum.lean` 30); `Flow` (`Mathlib/Dynamics/Flow.lean` 85, joint continuity required); `MeasureTheory.Measure.IsAddHaarMeasure` (`Mathlib/MeasureTheory/Group/Measure.lean` 773). Tau Ceti: `TauCeti.Probability.multivariateGaussianPDFReal` (`TauCeti/Probability/Distributions/Gaussian/Density.lean` 82, body `(2π)^{−d/2} (det S)^{−1/2} exp(−⟨x−m, S⁻¹(x−m)⟩/2)`), `multivariateGaussian_eq_withDensity` (265, `S.PosDef`); `TauCeti.Semigroups.StronglyContinuousGroup` (`TauCeti/Analysis/Semigroups/Group/Basic.lean` 74: `toFun : ℝ → X →L[ℝ] X`, `map_zero'`, `map_add'` for all real `s, t`, `continuousAt_zero'`, on a real normed space); `TauCeti.Probability.empiricalMeasureOfFintype` (`TauCeti/Probability/Process/EmpiricalMeasure.lean` 224, `[Fintype κ] [Nonempty κ]`, a `ProbabilityMeasure`, as the §10.1 Check says); `TauCeti.flowOfLipschitz` (`TauCeti/Dynamics/Flow/OfLipschitz.lean` 59, `LipschitzWith K v`, returns `Flow ℝ E`). All 20 "Lean names found nowhere" of the worker's citation list are the roadmap's own intended `Suggested.lean` names (README line 75), none a library name.

**Cross-roadmap citations resolved.** StandardDistributions on main: Layer 5 "multivariate distributions" (`TauCetiRoadmap/StandardDistributions/README.md` line 547, `rnDeriv_multivariateGaussian` at 2642) owns the multivariate Gaussian density, consumed here through the Tau Ceti declarations only. OneParameterSemigroups is `Completed/OneParameterSemigroups` on main; the strongly continuous group is consumed through `TauCeti.Semigroups.StronglyContinuousGroup`. ComplexTori on main has no flat-torus, Haar or Riemannian content (grep), so the real flat torus is this roadmap's. PointProcesses is a new-roadmap pull request (#417, @mccorvie, head `234a33d`): its README (2644 lines) builds Janossy measures, Papangelou intensities and Poisson densities on unlabelled point measures and excludes infinite-volume Gibbs processes; the README's scope paragraph names it only as the owner of those objects and cites nothing from it, consistent with the gate (no supplier). The labelled grand canonical measure of §9.3 (on `Σ_N (Fin N → X × E)`, where the flow acts) is a different carrier, and this roadmap is its owner.

**Ownership against open pull requests.** Checked by object with `roadmaps grep` over the 459 open pull requests and main. IncompressibleFlows (#237, @emberian; not in this brief's list of checkouts and not in the merge order) plans "pullback Koopman operators" and "the `Lp` Koopman C0 group" for continuous measure-preserving flows (its README lines 266, 615); the hard-sphere flow is not continuous (README line 56), the Koopman group of §7.4 is specific to it, and the per-time operator is Mathlib's `Lp.compMeasurePreserving` as cited. Tau Ceti's `koopmanMarkov` (`TauCeti/Probability/Ergodic/KoopmanMarkov.lean` 46) is a single map on `Ω →ₘ[μ] ℝ`, not a group on `Lp`. No change. Ownership against the open pull requests the brief lists without files was not otherwise checked beyond that grep.

**Shape and completeness.** `plan.json`: 10 layers, 45 targets, 142 tests, every target with a locator and prerequisites, matching the README section by section (the plan's `kind` and hypotheses agree with the prose; the 6.2 hypothesis is R01). Every definition has an API list (constructions 1.2 and 4.5 have Checks) and at least three Checks (counts 3–4 per target); every theorem states its hypotheses in the sentence and carries a locator; every layer ends with `### Examples` and `### Dependencies`; the README has the upstream headings, Unicode mathematics, no LaTeX delimiters, no target tables, no process words. Standard vocabulary throughout ("flat position space", "good set", "boundary pieces", "near pairs" are defined where introduced). `Needs:` lines are per target. Headline theorems of the README (line 75): all have carriers definable with real bodies on native types (a class, sets, a trajectory predicate, a choice-defined flow, measures given by densities, a `Prop` with a full body), so each is statable at the pins once those definitions are written; R06 concerns three elementary §2.1 lemmas that are not headlines.

**Conventions pinned by a witness and consistent across layers.** Contact normal direction (`ν_ij` from `j` to `i`; §Conventions, §3.2, §4.2 `q = x_i − x_j`, §4.5 `a = ℓ(x_i − x_j)`), right-continuous velocities (§Conventions, §5.1, §5.4, §7.1), transport sign `W⁰ ∘ T_{−t}` (§Conventions, §7.4, §8.1), the sphere measure `toSphere` of total mass `d ω_d` (§Conventions, §2.2, §10.2), the Maxwellian normalisation (§Conventions, §9.1, §9.4, §10.4), `μ_ε = ε^{−(d−1)}` (§Conventions, §9.6, §10.4) all agree, each recomputed above.

## Not verifiable

- Alexander1976 (pp. 217–232), Lanford1975 (Proposition 4.3), CIP1994, Spohn1991, Uchiyama1988, AlexanderThesis1975: settled as uncertified in `sources.toml`; cited by locator only, for attribution and background. The finite-N statements they are cited for are verified in GST2013 Proposition 4.1.1 and DengHaniMa2024 Proposition 1.2 instead.
- Elaboration and the one-tactic probe: no `Suggested.lean` exists at the design stage; the lane does not elaborate.
- GST2013 Theorem 8's functional setting (the uniform Gaussian bounds on `F^ε_n` behind the weak-convergence clause of §10.4) was checked only at the statement (lines 2069–2080) and the definition of the convergence (lines 2050–2067), not through Chapters 5–6.

## Source issues

- **Gap** in GST2013 at Proposition 4.1.1, proof, printed page 28: the invariance of Lebesgue measure under the hard-sphere flow is used before the flow is constructed and without proof; it should be proved for the one-collision step maps from the two-body Jacobian (as this roadmap's Layer 4 does); affects the proof.
- **Gap** in BGSS2023 at Corollary 1.2.1, proof (1.2.7), printed page 5: the limits of the two integrals are taken from almost-everywhere convergence of `F^ε_1`, `F^ε_2` alone; they need the uniform Gaussian bounds on the correlation functions that Lanford's theorem provides; affects the proof.
- **Misprint** in DengHaniMa2024 at Proposition 1.2(3), printed page 4: the flow maps are called measure-preserving diffeomorphisms of `D_N ∖ Z`; they are measure-preserving bijections, discontinuous at collision times; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "9b8c182bc775cf0978e65908119ad606e7f12242", "job": "REV-DESIGN-HardSphereDynamicsAndKineticLimits", "model": "fable", "worker": "chris-x19"} -->
