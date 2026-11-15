<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13780#issuecomment-6902547660 -->
Review (claude) of 3315bd3

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) the symbol ρ is used for a density in a Check of §9.4

   **Location.** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:727`: "take `f⁰(x, v) = ρ(x) M_{1,0}(v)` with `ρ(x) = 1 + 0.5 cos(2πx)`"; the matching test of plan target 9.4 (`design/plan.json:2034`).

   **Claim.** Every symbol has one meaning: the Conventions fix ρ as the injectivity radius of the position space.

   **Witness.** The Check is on the unit circle, whose radius is ρ = 1/2 (§1.3); in the same bullet `ρ(0) = 1.5` and `ρ = 1 + 1_{x = 0}` are a density. §9.6 writes the position density `ρ⁰`.

   **Exact repair.** In that bullet and in the plan test, write `r(x)` for the profile: `f⁰(x, v) = r(x) M_{1,0}(v)`, `r(x) = 1 + 0.5 cos(2πx)`, `(μ/Z) r(x) M(v)`, `(μ/Z) r(x − t v) M(v)`, `r(0) = 1.5`, `r(−1/4) = 1`, `r = 1 + 1_{x = 0}`. Tested on the instance: with `r`, the bullet's values are unchanged (`1 + 0.5 cos(−π/2) = 1`), and ρ = 1/2 keeps its meaning. No statement changes.

One finding, P3, on notation (R01); none is P1 or P2. It comes with a repair, so the verdict asks for changes: a fix round applies R01, and nothing else in the design needs repair. No supplier gap is declared and none is needed. I changed neither the README, the plan nor the sources manifest, and fetched no source: every sampled locator lies in the three cached texts. No maintainer notes were supplied. This is the design lane: there is no `Suggested.lean`, and Lean elaboration is not available (this lane does not elaborate; say so in the report). No Lean command was run.

## Previous findings, checked first

The preceding review is `REV-DESIGN-HardSphereDynamicsAndKineticLimits~15` (one finding, P3); its repair report is `packages/HardSphereDynamicsAndKineticLimits/reports/FIX-DESIGN-HardSphereDynamicsAndKineticLimits~16.md`. Nothing was marked `not actionable in this package`; nothing is re-raised.

| Round-15 finding | Status | Repaired passage and my check |
|---|---|---|
| F01: the `*Needs:*` lines of §7.1 and §10.4 omit sections their statements name | Repaired | `design/README.md:543`: "*Needs:* §3.4, §5.1, §5.2, §5.5, §6.4."; `:534` now reads "`T_t Z = S_t Z`, with `S_t` the free flow of §3.4 … (this is free motion between contacts, §5.1; …)". `:827`: "*Needs:* §1.1, §1.3, §9.5, §9.6, §10.3." Plan targets 7.1 and 10.4 carry `target:3.4`, `target:5.1` and `target:1.1`. |

The repair also changed three further targets for the same pattern (§7.2 +§3.1 with a route clause, §9.5 +§8.3 with a route sentence, §10.5 +§1.1). Each was read and recomputed (rows marked "repair" in the table). The repaired pattern in the rest of the design, checked mechanically this round: for all 45 targets the sections of the `*Needs:*` line equal the plan's `target:` prerequisites (0 differences), no prerequisite points forward, and each target has as many plan tests as Check bullets (174 against 174, at least 3 each).

## Verified sound

### Coverage and principles

I read all 875 README lines, the plan (10 layers, 45 targets, 174 tests, `gaps` empty, one supplier entry, baseline equal to the pins of `lake-manifest.json`: Mathlib `1b1ccf4b088b`, Tau Ceti `2fd255d997f4`) and the 9 manifest entries.

- No route-specific shortcut: every `d ≥ 1`, every flat position space, every `0 < ε < ρ`; `d ≥ 2` only in §10.4 and the corollary of §10.5, with the d = 1 counterexample as a Check. No re-planned roadmap, no upward or cyclic supply, no algorithm, no layer named after a source's chapter, no sentence saying the roadmap follows a source.
- A scan of the README for LaTeX delimiters, pull-request numbers, machine paths, `set_option`, "optional", "deferred", "for later", "so far", "to be checked", "checkpoint", "handoff", "packet", "removed", HTML anchors, `lemma` and round or job labels finds nothing (0 hits each).
- Remarks that need no change. §6.3 takes a bounded `K` and §6.1 a measurable one; §6.1 is applied only to the closed neighbourhoods `K_j`, and the bound on `F` holds for the outer measure. §10.5's route names Chebyshev's inequality, which bounds the deviation from the mean; the second-moment identity it displays gives the claim directly by Markov's inequality for `(π_t(h) − ∫ f h)²`. §10.4 asks for two bounds with the constant `C₀` each, BGSS2023 (1.1.5) for their sum; the two give (1.1.5) with `2C₀`, still a function of `C₀`.

### Adversarial table

`E` is Euclidean space; the head-on witness is ε = 1, `x_1 = (2, 0)`, `x_2 = 0`, `v_1 = (−1, 0)`, `v_2 = 0`. Every value was computed this round. Rows cover the fifteen sampled targets, the passages the repair changed, the headline theorems and the target of R01. Beyond the rows I recomputed the Checks of §1.3, §1.4, §2.1, §3.1, §3.3–3.5, §4.2, §4.5, §5.4, §5.5, §6.3, §7.3, §7.4, §8.2, §8.4, §9.1–9.3, §9.6, §10.1, §10.3 and found each correct.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1 flat position spaces (sampled) | local isometry; continuity of the short lift; ball image; sup-norm torus; kernel | `π(a − b)` of norm `< ρ` has a lift `c`, `|c| < ρ`, injectivity gives `c = a − b`; kernel vectors have norm `≥ ρ`, so a limit `ℓ(ξ) + k` with `|ℓ(ξ) + k| = |ℓ(ξ)| < ρ` forces `k = 0`; class of `(s, s)`: norm `s` against shortest lift `s√2` (0.1, 0.1414) | Sound | none |
| §1.2 Euclidean instance (sampled) | ρ = ∞; ε = 100; ρ = 2 structure | `ℓ = id`; `4π/3 = 4.18879`; `10⁴π = 31415.93`; with ρ = 2 no ε ≥ 2 is admitted and `ℓ(100, 0)` is unspecified | Sound | none |
| §2.2 pre/post-collisional variables (sampled) | `Θ²`; kernel; d = 1, 2, 3; probability sphere | `σ_{−ω} = σ_ω` gives `Θ² = id`; `(w' − v')·(−ω) = (w − v)·ω`, at the witness `0.9 = 0.9`; `∫_{B} ⟨e, x⟩_+ = ½ ω_{d−1}(1 − (d − 1)/(d + 1)) = ω_{d−1}/(d + 1)`, so `∫ ⟨k, ω⟩_+ = ω_{d−1}|k|`: `|k|`, `2|k|`, `π|k|`; normalised sphere in d = 3: `|k|/4` | Sound | none |
| §3.2 contacts, boundary pieces (sampled) | torus normal; shared particle; pair order | `π(0.1, 0) − π(0.8, 0) = π(0.3, 0)`, `ν = (1, 0)`; pairs `{1, 2}`, `{1, 3}` share 1; `⟨v_1 − v_2, ν_12⟩ = 1 = ⟨v_2 − v_1, ν_21⟩` | Sound; BGSS2023 lines 148–152 | none |
| §4.1 collision time (sampled) | roots; head-on; grazing; miss; contact state | roots have product `(|a|² − ε²)/|u|² ≥ 0` and sum `−2⟨a, u⟩/|u|² > 0`; `⟨q, u⟩ = ⟨a, u⟩ + τ|u|² = −√D`; `D = 1, τ = 1`; `a = (1, 3)`: `D = 9 − 9 = 0`, `τ = 3`; `a = (2, 3)`: `D = 9 − 12 = −3`; `|a| = ε`: `D = ⟨a, u⟩²`, `τ = 0` | Sound | none |
| §4.3 collision map (sampled) | explicit `DC`; route; d = 1; frozen `q` | `dτ = da_1 + du_1`, `dq = (0, da_2 + du_2)`, `dU' = (−du_1, 2da_2 + 3du_2)`, `dY = (−da_1, −da_2 − 2du_2)`, `det = (−1)(−1)(−3 + 4) = 1`; `dY + τ dU' = w − 2⟨q, w⟩q/ε² = R_q w`; d = 1: `(2 − a − s u, −u)`, det 1; `(1 − 0.7u, −u)`, det 0; frozen: −1 | Sound | none |
| §4.4 measure preservation (sampled) | `s = 0`; grazing set; reversal; inelastic rule | `B_0 = id` off `τ = 0`; `D = 0 ⟺ |a − ⟨a, û⟩û| = ε` for `u ≠ 0`; `B_s(b, −u') = (a, −u)`: from `q + (s − τ)R_q u` back to `q − τ u = a`; image of dimension `2d − 1` | Sound | none |
| §5.2 `IsTrajectory.eqOn` (sampled, headline) | forward at the supremum of agreement; backward at the infimum; gluing; grazing variant | positions agree by continuity, `V(t*) = σ_M V(t*−)` for both, then constant on `(t*, t* + η)`; backward: `V(t_*)` by right continuity, `V(t_*−) = σ_M V(t_*)`; glued path at `b`: jump law from the left piece, right continuity from the right piece; outgoing state: `x_2(2) = (−2, 0)` | Sound | none |
| §6.1 near-triple estimate (sampled) | fixed triple; `N = 2`; `μ_X(K) = 0`; pair shell | `μ_X(K) · s² · μ_X(K)^{N−3}` with `s = ω_d((ε + η)^d − ε^d)`, at most `N³` triples; `I = ∅` and `0⁰ = 1`; shell area `π(2η + η²)` | Sound; GST2013 lines 867–874 | none |
| §6.2 short steps (sampled) | far pairs; contact at time δ; torus radii; block Check | distance `> ε + 2Rδ`, relative speed `≤ √2 R ≤ 2R`, so `> ε` on `[0, δ]`; `τ = δ` gives an outgoing state; `0.47 + 0.18 = 0.65 ≥ 1/2`, `0.39 + 0.09 = 0.48 < 1/2`; `|V| = 0.2`, positions `0.1, 2.1, 20.1, 22.1` | Sound | none |
| §6.4 Alexander (headline) | reversal of a trajectory; Borel description | `W(s) = ℛ(Z(−s))`: right limit `−V((−s)−) = −σ_M V(−s)`, outgoing, jump `σ_M(−V(−s)) = W(s)`; second-nearest distance continuous and `> ε` on `[0, t]`, so some `m`, `R` pass | Sound | none |
| §7.1 flow (headline, repair) | `t = 0.5`; `t = 3`; outgoing contact state, `t = −1`; grazing state | `(1.5, 0)` both; `T_3`: `(1, 0), (−2, 0)` against `S_3`: `(−1, 0), 0`; contact at 0 lies in `[−1, 0]`; `T_1 Z = Z` against `S_1`: `x_1 = (1, 1)` | Sound; closed interval and `Z ∈ G` needed | none |
| §7.2 measure preservation (headline, repair) | `N = 2` on `E`; torus `N = 8` | `𝒟̄ᶜ = {|x_1 − x_2| < 1}` open, of infinite measure; complement of the carrier `𝒟̄ ∖ G`, null; `1/0.12566 = 7.96 < 8`, so `𝒟̄ = ∅` and `T_t = id` | Sound | none |
| §7.3 `flow_reversal` (headline) | on `G`; off `G`; boost off `G` | `ℛT_3 Z = ((1, 0), (−2, 0); 0, (1, 0))`; off `G` both sides are `ℛZ`; grazing state boosted: fixed, against `(3, 1), (1, 0)` | Sound | none |
| §8.1 transported densities (sampled) | group law; duality; sign | `W⁰ ∘ T_{−s} ∘ T_{−t}`; substitution `Z = T_t Y`; `W(1)((1, 0), (1, 0)) = W⁰(0, (1, 0))`; ClassicalErgodicTheory §3.5 item 4 has `W ∘ Φ (-t)` | Sound | none |
| §8.2 weak Liouville (headline) | left limit at a collision; box; grazing state | material derivative at the incoming state gives the left limit, specular condition matches it; `τ ∈ (0.9519, 1.0521)`, `H ∈ (0.4802, 0.5204)`, defect `−1`; `−2χ(0) − ∫χ ≤ −5` against `−2` | Sound | none |
| §8.3 marginals (sampled) | `s = N`; torus `N = 2`; inheritance; cut-off density | nothing integrated; `g(z_1)(1 − ω_d ε^d) ∫ g̃`; off the null set of added contacts the matching is that of `Z_s`, and outside `𝒟̄_N` both integrands vanish (same positions); `e^{−1.62} = 0.19790` against 0 (`|(0.9, 0.9)| = 1.2728`) | Sound; GST2013 lines 929–938 | none |
| §9.4 grand canonical invariance (sampled, headline) | density in `H, P`; indicator profile; position profile | `Σ|v_i − u|² = 2H − 2⟨u, P⟩ + N|u|²`; `g(v)g(w) = 1` against `g(0.9, 0.9) g(0) = 0`; `1.5` against `1 + 0.5 cos(−π/2) = 1` | Sound | R01 (symbol) |
| §9.5 correlation functions (headline, repair) | distinct-label identity; inversion; bound; Poisson; volume factor | `Σ_N (1/N!)(N!/(N − n)!) ∫ W^{(n)}_N h = μ^n ∫ F_n h`; `Σ_{p+q=m} (−1)^p/(p! q!) = 0` for `m ≥ 1`; `e^{2μC₀K}/Z`; `λ² = 1` against `λ + λ² = 2`; `0.8 √(2π) = 2.0053 ≤ 2.5066`; `x_1 = x_2`: every `W_{2+p} = 0` | Sound | none |
| §9.6 `boltzmannGrad_scaling` (headline) | factorisation; bound; scaling | `F_n(0) = (f⁰)^{⊗n} 1_{𝒟̄_n} Z⁻¹ Σ_p (μ^p/p!) ∫ Π f⁰ 1[admissible]`; `1 − p_ε ≤ n μ ω_d ε^d ‖ρ⁰‖_∞`; `μ_ε ε^d = ε`; `4.18879 · 0.01 = 0.0419` | Sound | none |
| §10.2 collision operator (sampled) | bound; loss term; weak form; kernels; β = 0 | gain `≤ C² e^{−β(|v|² + |w|²)/2} (|v| + |w|)`; `M(0) π √(8/π)`; `½ ∫ B(g'g'_* − g g_*)(ψ + ψ_*) = ¼ ∫ B(…)(ψ + ψ_* − ψ' − ψ'_*)`; `ω ↦ −ω`; `v' = (r/2)(1, 1)`, `w' = (r/2)(1, −1)`, speeds `r/√2`, kernel `r/√2` | Sound; BGSS2023 (1.2.2)–(1.2.3), DengHaniMa2024 (1.13)–(1.14) | none |
| §10.4 `LanfordStatement` (sampled, repair) | BGSS2023 Theorem 1; `t = 0`; Maxwellian; structures on `𝕋^d` | compact-uniform and almost-everywhere clauses are lines 316–321; weak clause by Scheffé from `∫ F_n(t) = ∫ F_n(0) → 1` and conservation of mass; `0 ≤ f⁰ − F_1(0) ≤ ω_d ε ‖ρ⁰‖_∞ f⁰`; `C₀ ≥ (β₀/2π)^{d/2}`; operator norm `≤ 1` and `|det B| = 1` give `B` orthogonal; `B(0, ±0.5) = (∓0.5, 0)`, equal classes | Supported | none |
| §10.5 law of large numbers (headlines, repair) | second moment; d = 1; wrong `F_2`; Poisson | `0 + m² − 2m² + m² = 0`; `1 − e⁻¹ = 0.63212`; `2m² − 2m² + m² = m²`; `Var(N/2) = 2/4 = 1/2` | Sound | none |

### Seeded source sample

The author flagged no locator as unverified. I opened the three readable texts at every locator of the fifteen sampled targets.

| Target | Text opened and result |
|---|---|
| 1.1 | GST2013 line 833 (`N` particles in `ℝ^d`); BGSS2023 line 119 (the torus, `d ≥ 2`). Confirmed as the two settings; the class is the roadmap's. |
| 1.2 | GST2013 lines 833–841 (positions, free flow, the domain with strict inequalities). Confirmed. |
| 2.2 | GST2013 lines 394–400 (the involution, line 400); 432–437 (unit Jacobians, (2.2.1)); 674 and 1264–1268 (the kernel `(ω·w)_+`). Confirmed; the cross-section value is the roadmap's own, as it says. |
| 3.2 | BGSS2023 lines 148–152 (the boundary pieces and the boundary condition). Confirmed. |
| 4.1 | GST2013 lines 846–847 (precollisional sign) and 1210–1216 (pre-, post-collisional and grazing). Confirmed. |
| 4.3 | GST2013 line 883 (invariance of the measure, used); DengHaniMa2024 lines 186–187. Confirmed as "statement used"; the Jacobian is the roadmap's. |
| 4.4 | GST2013 line 883; DengHaniMa2024 Proposition 1.2(3), lines 186–187. Confirmed. |
| 5.2 | DengHaniMa2024 lines 182–188 (existence and uniqueness off a null set); GST2013 lines 848–854. Confirmed. |
| 6.1 | GST2013 Lemma 4.1.1, lines 867–874, announced at 864. The README states the superset bound of the proof (line 873), with `μ_X(K)^{N−2}` for the source's radius power. Confirmed. |
| 6.2 | GST2013 lines 875–887. Confirmed. |
| 8.1 | BGSS2023 (1.1.3)–(1.1.4), lines 145–157; GST2013 (4.3.5), lines 1138–1140; DengHaniMa2024 (1.9)–(1.10), lines 224–234. Confirmed. |
| 8.3 | GST2013 (4.2.2), lines 929–932; (4.2.3), lines 934–937; line 938 (the boundary condition integrated). Confirmed. |
| 9.4 | BGSS2023 lines 267–268 (transport of the initial density), 479–483 (equilibrium), 3539 (the product identity). Confirmed; the invariance is derived here, as the README says. |
| 10.2 | BGSS2023 (1.2.1)–(1.2.3), lines 292–312; GST2013 (2.1.2), lines 385–393, and (2.2.1), lines 432–437; DengHaniMa2024 (1.13)–(1.14), lines 258–282. Confirmed, with the two kernel signs as the third Check says. |
| 10.4 | BGSS2023 Theorem 1, lines 316–321, with (1.1.5) at line 168 (`C₀ ≥ 1`, `β₀ > 0`); GST2013 Theorem 4 and Remark 3.1.1, lines 668–696; Theorem 8, lines 2069–2080. Confirmed. |

Also read: GST2013 lines 42–118 (contents), 826–912, 1219–1227; BGSS2023 lines 116–190, 264–350; DengHaniMa2024 lines 136–290.

### Pinned declarations

Every library declaration the README names was searched at the pins and found (each name of the two contract lists; paths relative to each library).

- Tau Ceti: `TauCeti/Probability/Distributions/Gaussian/Density.lean:82`, `:265` (`hS : S.PosDef`); `TauCeti/Analysis/Semigroups/Group/Basic.lean:74`; `TauCeti/Probability/Process/EmpiricalMeasure.lean:224` (a `ProbabilityMeasure`); `TauCeti/Dynamics/Flow/OfLipschitz.lean:59` (`LipschitzWith K v`, a `Flow ℝ E`).
- Mathlib: `MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean:308`; `Analysis/Normed/Group/Quotient.lean:168`, `:222` (`instNormedCommGroup` with `[IsClosed (S : Set M)]`, additive name by `to_additive`); `MeasureTheory/Constructions/Polish/Basic.lean:119`, `:148`, `:154`, `:649` (`[N.Normal]`, `[IsClosed (N : Set G)]`); `Topology/Algebra/OpenSubgroup.lean:377` (`[T1Space G]`, `[DiscreteTopology U]`); `LinearAlgebra/Quotient/Defs.lean:44` (`quotientRel` is `QuotientAddGroup.leftRel p.toAddSubgroup`, as §1.3 says); `Algebra/Module/ZLattice/Basic.lean:93`, `:352`, `:434`; `Algebra/Module/ZLattice/Covolume.lean:73`, `:85`; `MeasureTheory/Group/FundamentalDomain.lean:731`, `:754`, `:801`; `MeasureTheory/Measure/Haar/Quotient.lean:75`, `:222`, the additive form used at `MeasureTheory/Integral/IntervalIntegral/Periodic.lean:94`; `Analysis/Fourier/AddCircleMulti.lean:173`; `Topology/Instances/AddCircle/Real.lean:55`; `MeasureTheory/Function/Jacobian.lean:1096`, `:1184`; `Analysis/InnerProductSpace/Projection/Reflection.lean:52`, `FiniteDimensional.lean:59`; `MeasureTheory/Measure/Lebesgue/EqHaar.lean:172`, `:231`, `:527` (`[Nontrivial E]`); `LinearAlgebra/Matrix/Determinant/Basic.lean:734`; `MeasureTheory/Constructions/HaarToSphere.lean:52`, `:88`; `Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:330` (`0 < b`); `Probability/Distributions/Gaussian/Real.lean:47`, `Multivariate.lean:166`; `Probability/Distributions/Poisson/Basic.lean:40`; `MeasureTheory/Constructions/Pi.lean:732`; `MeasureTheory/Function/LpSpace/Basic.lean:595`, `:611`; `MeasureTheory/Function/ContinuousMapDense.lean:142`; `MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean:1140`; `Probability/Moments/Variance.lean:398` (`[IsFiniteMeasure μ]`); `Data/Nat/Factorial/Basic.lean:332`, `:367`, `:424` (`k ≤ n`); `MeasureTheory/MeasurableSpace/Constructions.lean:871`; `MeasureTheory/Measure/Sum.lean:30`; `Dynamics/Flow.lean:85`; `Topology/MetricSpace/ProperSpace.lean:66`.

The 17 names in `scratch/citations.md` are this roadmap's own `HardSphere.*` names, expected at the design stage; README line 85 lists them as the declarations of the future `Suggested.lean`.

### Duplication, ownership and overlap

`scratch/overlaps.md` (main `c639cfa`, index of 2026-11-15T22:25:21Z) lists no other pull request changing this roadmap, no dropped id, no id that only a revision defines and no second copy. Main has no folder `TauCetiRoadmap/HardSphereDynamicsAndKineticLimits`; the two packages of `scratch/board-packages-index.txt` (AnalyticNumberTheory, LawrenceVenkateshMethod) are other subjects. Object searches over main and the 455 open heads (`roadmaps grep`), run this round:

- "Boltzmann–Grad", "BBGKY", "Lanford", "Maxwellian", "grand canonical", `HardSphere.`: no match anywhere. "hard sphere": ClassicalErgodicTheory (its lines 73, 1161, 2441: the hard-sphere flow is outside its scope and a consumer of its §3.5) and one mention in MathematicalBilliards. "collision operator", "specular": a billiard chord in SymplecticGeometry/CotangentLagrangian and a docstring of MathematicalBilliards. "Liouville equation": SpecialFunctionsLegendre (Sturm–Liouville). "flat torus": examples and Checks in CalibratedGeometry, PositiveMass, RiemannianGeometry, RicciFlow, GeometricTopology, QuasiregularMaps and others; none defines `ℝᵈ/L` as a normed quotient with its Haar measure, and IncompressibleFlows works on Mathlib's `UnitAddTorus d`.

Cross-roadmap citations resolved this round:

- ClassicalErgodicTheory, at the head of its open pull request (another author's, adding a new roadmap folder): §3.5 "Flows defined almost everywhere" (a standard Borel space, a σ-finite measure); item 1 ("a measurable set `X₀` with `μ X₀ᶜ = 0` carrying a measurable flow", extension satisfying "the group law everywhere"); item 3 ("a measure on the union is invariant iff each component restriction is"); item 4 (`(Φ t)_* ν = μ.withDensity (W ∘ Φ (-t))`); §0.2 ("`μ` is a finite invariant measure and `1 ≤ p < ∞`", its line 385). Each agrees with the contract and the scope paragraph.
- On main: MathematicalBilliards §10.3 (line 768, "area `4 · 1 = 4`, the covolume of `2ℤ + 2iℤ`"), §10.5 (line 788, `ℂ/Λ` as a translation surface), §12.3 (line 897, an action of `ℝ` on a probability space, `Lp ℂ 2 μ`); ProbabilisticAndMetricNumberTheory §4.9a (line 6319, `scalarLpKoopman_strong`); RandomMatrices §8.1 (line 1133, the factorial-moment definition at 1141–1143); StandardDistributions Layer 5 (its line 38); ComplexTori; `Completed/OneParameterSemigroups`.

This roadmap owns the hard-sphere objects and `FlatTorus` because no roadmap on main or open states them.

Overlap check: read ClassicalErgodicTheory, PointProcesses, RelativisticQuantumFieldTheory, HamiltonianSystems, IncompressibleFlows, MathematicalBilliards, OptimalTransport and RandomMatrices (third list empty); conull flows, their disjoint unions and the transport of densities: owner ClassicalErgodicTheory §3.5, cited here; the translation-surface structure of `ℂ/Λ`: owner MathematicalBilliards §10.5, not restated; Koopman strong continuity for finite measures or continuous actions: owners ClassicalErgodicTheory §0.2, MathematicalBilliards §12.3 and ProbabilisticAndMetricNumberTheory §4.9a, not shared for the infinite measure `λ_N|𝒟̄` and the discontinuous flow; correlation functions of eigenvalue counts: owner RandomMatrices §8.1, a different carrier, named in the scope; unlabelled point processes and their factorial moment measures: owner PointProcesses, not restated and not cited as a supplier; Liouville's theorem on a symplectic vector space (HamiltonianSystems), the Boltzmann entropy (OptimalTransport) and flows on `UnitAddTorus` (IncompressibleFlows) are other objects; nothing else shared.

### Supplier order

```text
candidate: HardSphereDynamicsAndKineticLimits is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 239 roadmaps, 2252 edges, 0 problem(s)
```

No UPWARD or CYCLE line. ClassicalErgodicTheory is not in `merge-order/ORDER.txt`, so the check does not see that edge. By reading, the direction is one way: its §3.5 needs its own §§0.1, 3.1, 3.3 and MathematicalBilliards §§8.2–8.3, and names the hard-sphere flow only as a consumer. No roadmap of the never-cite list is cited as a supplier (PointProcesses is named only as the owner of a neighbouring subject). No target needs a later one.

### Shape and headline theorems

Every numbered section has its hypotheses in the sentence, a locator or the words "derived here", and at least three Checks (3 to 7); every definition has an API list or states its properties in the defining paragraph; every layer ends with `### Examples` and `### Dependencies`. The organisation is the roadmap's own (comparison below).

Headlines named for the package stage: `HardSphere.IsTrajectory.eqOn` (§5.2), `HardSphere.volume_hardCoreSet_diff_goodSet` (§6.4), `HardSphere.flow_add` (§7.1), `HardSphere.measurePreserving_flow` (§7.2), `HardSphere.flow_reversal` (§7.3), `HardSphere.weak_liouville` (§8.2), `HardSphere.grandCanonical_flow_invariant` (§9.4), `HardSphere.lintegral_sum_distinct_eq_correlation` (§9.5), `HardSphere.boltzmannGrad_scaling` (§9.6), `HardSphere.tendsto_empirical_of_correlation` and `HardSphere.LanfordStatement.tendsto_empirical` (§10.5). Each names the roadmap's objects. The padding probe and the `#check` comparison have nothing to run on at this stage.

### Copyright, licences and scope

- **Wording.** Beside the locators of the fifteen sampled targets I compared six further passages with the source text: §5.5's description of pathological data with GST2013 lines 851–854; §6.4's route with GST2013 lines 875–910; §8.3's inheritance with GST2013 lines 933–938; §9.3's exchangeability sentence with BGSS2023 lines 184–187; §10.5's first theorem with BGSS2023 lines 341–349; §5.4 with DengHaniMa2024 lines 157–169. No run of more than four consecutive words is shared (terms of art such as "on compact sets"), and no sentence follows a source clause by clause.
- **Arrangement.** GST2013 has the largest share: 52 of the 129 occurrences of a source key in the README (BGSS2023 44, DengHaniMa2024 24, the six others 9). Its contents (lines 42–118): Chapters 1–3 the low density limit, the Boltzmann equation and the main results; Chapter 4 the `N`-particle flow, the Liouville equation, its weak form and the hierarchies; Chapters 5–7 estimates and convergence; Part III potentials. Layers 1–4 and 9 have no counterpart there; Layers 5–7 expand its §4.1; Layer 8 covers its §§4.2–4.3 without the hierarchies; the collision operator of its Chapter 2 comes last, in Layer 10. No run of layers maps one to one onto a run of its chapters or sections. The order of Layers 7 to 10 is forced: §8.1 needs §7.2, §9.5 needs §8.1 and §8.4, §10.1 needs §9.5.
- **Reuse.** No table, figure, list of examples or numerical data is taken from a source.

Source independence: 21 passages compared with 3 sources, none shared; largest share GST2013, 52 of 129 locators; contents compared with GST2013: independent.

## Not verifiable

- Alexander1976 Proposition 4.3 and AlexanderThesis1975 Chapter 1: settled uncertified; only the attribution in GST2013 (line 855) was read.
- Lanford1975, CIP1994, Spohn1991, Uchiyama1988: settled uncertified; not read, not requested again.
- Lean elaboration, the one-tactic padding probe and the `#check` comparison: not available (this lane does not elaborate), and there is no `Suggested.lean`. Library names were checked by reading the pinned sources, not by elaboration.
- The truth of `HardSphere.LanfordStatement` beyond its agreement with BGSS2023 Theorem 1, its `t = 0` case and its equilibrium case: the proof belongs to a later roadmap.
- The dependency check's verdict on the ClassicalErgodicTheory edge: the tool does not see it; the direction was checked by reading.

## Source issues

- none

## For the human reviewers

- **Licence.** Six of the nine manifest entries are `uncertified` (`sources.toml`: Alexander1976, AlexanderThesis1975, Lanford1975, CIP1994, Spohn1991, Uchiyama1988); the theorems attributed to Alexander and Lanford were checked only against GST2013 and BGSS2023.
- **Licence.** DengHaniMa2024 is cited as the preprint arXiv:2408.07818v3, with no journal reference (README References).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3315bd3188daff6aa9f08886c6a6a89c548e68db", "job": "REV-DESIGN-HardSphereDynamicsAndKineticLimits~16", "model": "fable", "worker": "chris-x52"} -->
