<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18031#issuecomment-6909288988 -->
Red team round 2 pass b (claude) of 3bffb46

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) GST2013 Theorem 8 is cited as the proposition, but it is a theorem on ℝᵈ for fixed N

   **Location.** `packages/HardSphereDynamicsAndKineticLimits/Suggested.lean:474–475`: "For `d ≥ 2` it
   is the theorem of BGSS2023 Theorem 1 (lines 316–321) and GST2013 Theorem 8 (lines 2069–2080)";
   `README.md:824`, the sentence "GST2013 prints convergence of averages …".

   **Claim.** `HardSphere.LanfordStatement d` (unit torus, grand canonical datum, almost-everywhere and
   locally uniform convergence) is GST2013 Theorem 8.

   **Witness.** GST2013 line 833: the particles are in ℝᵈ. GST2013 line 672: the limit is `N → ∞` with
   `N ε^{d−1} = 1`, a fixed particle number. GST2013 lines 2041–2055: convergence of velocity averages
   only. The README sentence gives the mode, not the space or the ensemble.

   **Repair.** Docstring, replace the sentence by: "For `d ≥ 2` it is BGSS2023 Theorem 1
   (lines 316–321), attributed there to Lanford1975, whose proof is outside this roadmap; GST2013
   Theorem 8 (lines 2069–2080) is the corresponding theorem on ℝᵈ for a fixed number `N` of particles
   with `N ε^{d−1} = 1`, in the sense of observables, and is not this proposition; for `d = 0` it is
   false (README §10.4)." README §10.4, replace "GST2013 prints convergence of averages against …
   off the diagonals." by: "GST2013 Theorem 8 is the corresponding theorem on ℝᵈ for a fixed number
   `N` of particles with `N ε^{d−1} = 1` (GST2013 lines 672 and 833), not on the torus with a grand
   canonical datum, and prints convergence of averages against compactly supported continuous
   functions of the velocities, locally uniformly in the positions off the diagonals; the proposition
   defined here is BGSS2023 Theorem 1." Tested on the witness: the repaired text states ℝᵈ and fixed
   `N` for GST2013 and attributes the torus statement to BGSS2023 only.

2. **F02** (P3) a Check of §9.5 claims `1/Z > 0` for every datum of positive mass

   **Location.** `README.md:750`: "For `f⁰` of positive mass the truncated quotient overstates `E[N]`
   by the vacuum probability `1/Z > 0`."

   **Claim.** For every `f⁰` with `∫ f⁰ > 0`, the vacuum probability is `1/Z > 0`.

   **Witness.** The README's own instance of §9.6 (`README.md:763`): `X = E`, `d = 1`, ε = μ = 1,
   `f⁰(x, v) = 0.1 · 1_{[0,1]}(v)`. Mass `∞`, `Z = ∞`, `1/Z = 0`, the measure is zero: the overstatement
   is `0`, not positive.

   **Repair.** "For `μ > 0` and `f⁰` of positive finite mass (so `1 < Z < ∞`, §9.3) the truncated
   quotient overstates `E[N]` by the vacuum probability `1/Z > 0`; for infinite mass `Z = ∞`, the
   measure is zero and both counts give 0." Tested: the instance above now falls under the second
   clause (`0 = 0`); at ε = 0, μ = 2, `∫ f⁰ = 1` the first clause gives `1/Z = e^{−2} ≈ 0.13534 > 0`.

3. **F03** (P3) the docstring of `grandCanonical_flow_invariant` cites a locator that states no invariance

   **Location.** `Suggested.lean:363–366`: "… the partition function is infinite and the measure is
   zero (BGSS2023 lines 479–483)."

   **Claim.** The invariance of the Maxwellian grand canonical measure under the flow is at BGSS2023
   lines 479–483.

   **Witness.** BGSS2023 lines 479–483 name the equilibrium `f⁰ = M` and use "the invariant measure"
   heuristically for a noise covariance; no invariance statement, no flat position space, no
   infinite-mass case. `README.md:728` already says "the invariance is derived here".

   **Repair.** End the docstring with: "The equilibrium `f⁰ = M` and its invariant measure are named in
   BGSS2023 lines 479–483; the invariance, on every flat position space and for every value of the
   partition function, is proved in the roadmap from the conservation of energy and momentum (README
   §9.2, §9.4) and is stated as a theorem in none of the sources." Tested: the repaired text claims of
   the locator only what lines 479–483 contain.

Second pass. Part 1 checks the eleven findings of the first round against this head; part 2 is the
full pass again, with three new findings, all P3 (S01–S03).

## Earlier findings at this head

| Finding | State | Witness at this head |
|---|---|---|
| ~1a/F01 (P2) hand-off of `LanfordStatement` for every `d` | repaired | `packages/HardSphereDynamicsAndKineticLimits/README.md:11` "for every `d ≥ 2`; the proposition is defined for every `d` and is false for `d = 0`"; `README.md:834` (Check); `README.md:864`; `Suggested.lean:33`, `:474–476` |
| ~1a/F02 (P3) locators of the uniqueness theorem | repaired | `README.md:417` "are proved here from the definition of §5.1 and are stated in none of the sources"; `Suggested.lean:256–260` |
| ~1a/F03, ~1b/F03 (P3) locators of the two-sided scaling bound | repaired | `README.md:758` "the two-sided bound with the constant `ω_d ‖ρ⁰‖_∞` is proved here and is stated in neither source"; `Suggested.lean:400–402` |
| ~1a/F04 (P3) `hardCoreSet` docstring cites the open-set sources | repaired | `Suggested.lean:191–194` cites DengHaniMa2024 (1.1) for the closed set; `README.md:216` separates the two |
| ~1a/F05, ~1b/F05 (P3) `*Needs:*` of §9.6 | repaired | `README.md:767` "*Needs:* §1.1, §3.1, §9.3, §9.5, Mathlib `EuclideanSpace.volume_ball`"; each route item has an entry |
| ~1a/F06 (P3) first Check of §4.4 a restatement | repaired | `README.md:367`: `d = 1`, ε = 1, `s = 4`; recomputed: `τ = (a−1)/(−u) < 4`, `B_4 = (2 − a − 4u, −u)`, determinant 1, image in `{a > 1}`, area `1/2` |
| ~1b/F01 (P2) §9.6 lacks `μ > 0`, `∫ f⁰ < ∞` | repaired | `README.md:758` "for `0 < ε < ρ`, `μ > 0` and a measurable `f⁰` with `∫ f⁰ < ∞`"; Check `README.md:763` recomputed: `μ = 0` gives `0` against `0.39894`; infinite mass gives `0.1` against `0.02` |
| ~1b/F02 (P3) a roadmap that does not exist "proves" the proposition | repaired | `README.md:11` "is the subject of a later roadmap"; `README.md:864` "would prove"; `Suggested.lean:34`, `:475` "outside this roadmap" |
| ~1b/F04 (P3) `μ_ε` at `d = 0` | repaired | `README.md:30` "for `d = 0` the Lean expression is `ε⁻¹ ^ 0 = 1`" |

No repair introduced an error. Recomputed on the repaired text: `LanfordStatement 0` is false
(`Z = 2`, `F_1 = 1/2`, `Q = 0`, every mild solution is `1`, so `1/2 ↛ 1`); the `d ≥ 1` clause of the
§10.4 API holds at `t = 0` (`|f⁰ − F_1(0)| ≤ ω_d ε ‖ρ⁰‖_∞ f⁰`, `2ε‖ρ⁰‖` at `d = 1`); the §9.6
identity at `d = 0`, `μ = 2`, `∫f⁰ = 1` gives `F_1 = f⁰/3 = f⁰ · p_ε`.

## Verified sound

Counts: 33 declarations of `Suggested.lean` read (11 theorems, 22 definitions and instances); 45
README targets read (§1.1–§10.5) with all 180 Check bullets; 60 distinct locator ranges verified in
the three cached texts; every Check bullet that carries a numerical value recomputed (the others
are qualitative and were tested against their section's statements); 12 sibling citations
resolved; 75 library names resolved at the pins.

### Declarations of `Suggested.lean` (context: `namespace HardSphere`, `{d : ℕ} {X} [NormedAddCommGroup X]`, then `[ProperSpace X] [MeasureSpace X] [BorelSpace X] [FlatPositionSpace d X]` from `contactScatter` on)

| Declaration | Instances tried | Values on each side | Result |
|---|---|---|---|
| `FlatPositionSpace` (class) | `E`, ρ = ∞; `𝕋²`, ρ = 1/2; `E` with the group norm `φ(|x|)`, `φ(r) = r` on `[0,1]`, `(r+1)/2` beyond, ρ = 1 (most plausible wrong model: a norm that is not the quotient norm); sup-norm torus | axioms hold; hold; hold, and for ε < ρ the sets `{‖ξ‖ ≥ ε}`, `{‖ξ‖ = ε}` equal the Euclidean ones (0.5 ↦ 0.5, 3 ↦ 2 ≥ ρ); lift axiom fails (0.1 against 0.1414) | determines the dynamics for ε < ρ |
| `shortLift` | class of `(0.9, 0)` on `𝕋²`; ‖ξ‖ ≥ ρ | `(−0.1, 0)`; `0` (no lift in `B(0, ρ)` since `‖π a‖ ≤ |a|`) | as README §1.1 |
| `FlatTorus` and its five instances, `UnitFlatTorus` | `ℤ²`; `2ℤ × ℤ`; `d = 0` | mass 1, ρ = 1/2; mass 2, ρ = 1/2; a point of mass 1, ρ = ∞ | bodies as README §1.3 |
| `scatter` | ν = (1,0), `v = (0, 0.9)`, `w = (0.9, 0)`; ν = 0 | `((0.9, 0.9), 0)`, momentum `(0.9, 0.9)` and `|v|²+|w|² = 1.62` both sides; identity | correct |
| `hardCoreSet` | `E`, ε = 1, positions `0, (1,0)`; `0, (0.5, 0)`; ε ≤ 0 | in; out; everything | closed set, as README §3.1 |
| `contactScatter`, `reversal` | outgoing state `x = ((1,0), 0)`, `V = ((1,0), 0)`; three collinear touching spheres; ε ≥ ρ | `σ_M V = (0, (1,0))`, `ℛ = (X, (0, (−1,0)))` outgoing again (inner product 1); identity (no matching); normal 0, identity | involution for every ε |
| `freeFlow` | `S_2(0, (1,0))`; torus `S_1(π 0, e_1)` | `((2,0), (1,0))`; `(π 0, e_1)` | correct |
| `IsTrajectory` | head-on witness on ℝ; left-continuous variant; free pass through the ball | all seven conditions hold with `𝒯 = {1}`; condition 5 fails at `t = 1` (inner product −1); condition 1 fails at `t = 1.5` (distance 0.5) | excludes the wrong models |
| `goodSet` | `a = (−2, 1)`, `u = (−1, 0)`, ε = 1 | `D = 4 − 4 = 0`, tangency at time −2 at `(0, 1)`: not in `G` | both time directions count |
| `IsTrajectory.eqOn` | `J = [0,1] ∪ [2,3]` without `hJ`; ε ≥ ρ; ε = 0; a spontaneous jump at a time without contact | two trajectories differ at time 2 (0 against 5); free motion, unique; no coincidence allowed, unique; excluded: conditions 6 and 7 with `σ_M = id` force continuity | true with `hJ`, for every ε; condition 5 not used |
| `volume_hardCoreSet_diff_goodSet` | `N ≤ 1`; `N = 2` on `E`; `d = 0`; `d = 1` | `G` everything; exceptional set `{u ≠ 0, D = 0}` ∪ incoming and grazing contacts, null; `𝒟̄_N = ∅` for `N ≥ 2`; incoming contacts and triple contacts, null | true |
| `flow`, `flow_add` | head-on `T_3`, `T_{−3}`; ε = −1; circle with ε = 1/2 = ρ | `((1,0), (−2,0); 0, (−1,0))` and back; `T = S`, positions `−2, 0` both ways; `G = ∅`, identity | group law for every ε |
| `measurePreserving_flow` | off `𝒟̄`; `𝒟̄ ∖ G`; measurability | identity (`G ⊆ 𝒟̄`); null; `G` Borel by the step decomposition (a trajectory on `[0, t]` keeps a margin η > 0 by compactness, so it passes all steps for large `m`) | true, including the `Measurable` field |
| `flow_reversal` | head-on, `t = −3`; ε = −1, `t = 2`; `Z ∉ G` | `((1,0), (−2,0); 0, (1,0))` both sides; positions `3, 0`, velocities `1, 0` both sides; `ℛ Z` both sides (`ℛ` an involution preserving `G`) | true for every ε |
| `weak_liouville` | `φ = χ(t) ψ(H)`; `d = 1`, `N = 2` box with `φ = χ θ(H) ⟨v_1, e_1⟩` (no `hspec`); `W₀` supported off `𝒟̄` (no `hW₀D`); `d = 0`, `N = 1` | `−χ(0) ∫W⁰ψ + χ(0) ∫W⁰ψ = 0`; left side `−1 ≠ 0` (`τ ∈ (0.9519, 1.0521)`, `H ∈ (0.4802, 0.5204)`); flow is the identity there, `∫_0^∞ Lφ ≠ −φ(0)`; `c ∫_0^∞ φ' + c φ(0) = 0` | true; both hypotheses needed; `Lφ = 0` for `t ≥ T` follows from `hφT` |
| `partitionFunction`, `grandCanonicalDensity`, `grandCanonical` | ε = 0, μ = 2, `∫f⁰ = 1`; `f⁰ = 0`; `μ = 0`; infinite mass | `Z = e²`, `P(N = 1) = 0.27067`; `Z = 1`, vacuum; `Z = 1` (`0⁰ = 1`), vacuum; `Z = ∞`, zero measure | as README §9.3 |
| `grandCanonical_flow_invariant` | `u ≠ 0`; `X = E`, `μ c > 0`; `c = 0` | density a function of `H`, `P` (`2H − 2⟨u,P⟩ + N|u|²`); zero measure, preserved; vacuum | true for all `μ, c` |
| `correlation`, `lintegral_sum_distinct_eq_correlation` | `μ = 0`, `n ≥ 1`; `n = 0`; `Z = ∞`; `h = 1_B ⊗ 1_B`, ε = 0, λ = 1 | `0 = 0` (`F_n = ∞ · 0 = 0`); `h(∅) = F_0 h(∅)` with `F_0 = 1`; `0 = 0`; `1 = 1` (all pairs would give 2) | true for every `μ ≥ 0` |
| `boltzmannGrad_scaling` | circle, ε = 0.4, `f⁰ = M`; `d = 3`, ε = 0.01; `d = 0` (excluded) | `Z = 2.1`, `E[N] = 0.571 ∈ [0.2, 1]`; `[0.9581, 1]`; `1 − ε ≤ 1/2` false | true; `hd` needed |
| `empirical` | `h = 1` | `N/μ` | correct |
| `collisionOperator` | Maxwellian; `d = 1`; `g = 1_{|v| ≥ 1}`, `d = 2` | 0; 0 (`σ_{±1}` swaps); gain integrand `r/√2` on a cone, divergent | as README §10.2 |
| `IsMildBoltzmannSolution` | `f = M`; wrong transport sign on the circle | holds; `0.5 M(1)` against `1.5 M(1)` | sign pinned |
| `tendsto_empirical_of_correlation` | Poisson, ε = 0; `F_2 → 2 f ⊗ f`; `d = 0`; `f⁰ = 0` | variance `μ⁻¹ ∫f⁰h² → 0`; variance `→ m²`; `F_1 = m₀/(1 + μ m₀) → 0`, `f = 0`, `π ≤ μ⁻¹ → 0`; `0 = 0` | true; both orders needed |
| `LanfordStatement` | `d = 0`, `f⁰ = 1`; Maxwellian, `d ≥ 2`; cover `π ∘ B`, `B` a quarter turn; radius 0.6 | false (`1/2 ↛ 1`); all three clauses hold by §9.4–9.6; equivalent proposition with datum `f⁰(x, B⁻¹v)`; injectivity fails (`π(−0.5, 0) = π(0.5, 0)`) | as README §10.4; S01 on its attribution |
| `LanfordStatement.tendsto_empirical` | `d = 1` (excluded); `d ≥ 2` | `μ_ε = 1`, `P(N ≠ 1) → 0.63212`; `μ_ε → ∞`, `f(t)` integrable (`C (2π/β)^{d/2}`, torus mass 1) | true; `hd` needed |

The 23 "lost binder" leads of the signature transcript were compared with the README statements:
every theorem carries `[FlatPositionSpace d X]` and `[MeasureSpace X]` where it uses them; `scatter`,
`hardCoreSet`, `partitionFunction`, `grandCanonicalDensity`, `grandCanonical` carry fewer instances,
as their README statements do. No lead is a defect.

### README targets (values recomputed)

| Target | Instances | Values | Result |
|---|---|---|---|
| §1.1–1.4 | packing on `𝕋²`, ε = 0.4; shell `[0.4, 0.6]` on the circle; `2ℤ × ℤ`; ε = 1.5 on the circle | `1/0.12566 = 7.96`, at most 7; 0.2 against 0.4; covolume 2, ρ = 1/2, normalised mass gives `π/32` against `π/16`; threshold 2/3 fails for `N = 1` | hypotheses `r₂ < ρ`, `ε ≤ 2ρ` needed and present |
| §2.1–2.2 | Θ at the §2.1 witness; cross-section `d = 1, 2, 3` | `0.9 → 0.9`; `|k|`, `2|k|`, `π|k|`; `∫_B ⟨e,x⟩_+ = ω_{d−1}/(d+1)` | correct |
| §3.1–3.5 | boost identity, `d = 1`; reversal of `P`, `H` | `(1,1)` both sides after correction; `P: (1,0) → (−1,0)`, `H = 1/2` | correct |
| §4.1–4.5 | oblique `a = (3, 0.6)`; `DC` at head-on; variable time `d = 1`; `P^{12}_1` | `D = 0.64`, `τ = 2.2`, `R_q u = (0.28, 0.96)`; rows recomputed from `dτ = da_1 + du_1`, `dq = (0, da_2 + du_2)`, determinant 1; determinant 0; `0.1, 2.1, 20` | correct |
| §5.1–5.5 | `N = 2` exceptional set; uniqueness route forward and backward | as above | correct |
| §6.1–6.4 | `C₁` at `d = 2`, `N = 2`, ε = R = 1; grazing state `a = (2,1)`; torus step sizes | `8 (12π)² (π²/2) = 576π⁴ ≈ 56108`; passes step 0, fails step 1; `0.47 + 0.18 = 0.65 ≥ ρ`, `0.39 + 0.09 = 0.48 < ρ` | correct |
| §7.1–7.5 | circle, ε = 1/3, `N = 3`; `p = ∞` | `q_3 = 0`; `‖U_t f − f‖_∞ = 1` | correct |
| §8.1–8.4 | marginal on the torus; `s = 2`, `N = 3`; `s > N` | factor `1 − ω_d ε^d`; `6` against `9`; `descFactorial 1 2 = 0` against `1` | correct |
| §9.1–9.6 | `(2π)^{3/2}`; inversion formula coefficient; integrated bound on the circle | `15.7496`; `Σ_{p+q=m} (−1)^p/(p! q!) = δ_{m0}`; `2.0053/Z` between `1/Z` and `2.5066/Z`; S02 on one Check | correct but S02 |
| §10.1–10.5 | loss term `d = 3`; Scheffé step; `d = 1` non-example | `M(0) π √(8/π)`; `∫|F − f^{⊗n}| = ∫F − 1 + 2∫(f^{⊗n} − F)^+`; `0.63212` | correct |

### Citations, suppliers, policy

- ClassicalErgodicTheory §3.5 items 1, 3, 4 and §0.2 exist at the head of its open pull request with
  the statements cited (a new roadmap of another author). On main: MathematicalBilliards §10.3,
  §10.5, §12.3; ProbabilisticAndMetricNumberTheory §4.9a (`scalarLpKoopman_strong`, continuous
  action, locally finite measure); RandomMatrices §8.1; StandardDistributions Layer 5; ComplexTori;
  Completed/OneParameterSemigroups. All as cited.
- No second owner: `roadmaps grep -i` for Boltzmann equation, collision operator, Maxwellian, grand
  canonical, BBGKY, `FlatPositionSpace`, `HardSphere.` finds no match outside this roadmap; "flat
  torus" on main is `ℂ/Λ` (MathematicalBilliards) and Riemannian examples, none with the Euclidean
  quotient norm and Haar measure of `E ⧸ L`. PointProcesses and HamiltonianSystems are not cited.
- Library: all 75 names resolve at the pins, including `ZLattice.isAddFundamentalDomain`
  (`Mathlib/Algebra/Module/ZLattice/Basic.lean:645`), `MemLp.exists_hasCompactSupport_eLpNorm_sub_le`
  (normal, R₁, weakly locally compact, regular measure, `p ≠ ∞`), `StronglyContinuousGroup` (real
  scalars, strong continuity at 0), `card_smul_empiricalFiniteMeasure` (empty family included).
  No target is already proved at the pins.
- Policy: the pull request changes only the package folder; no pull-request number, process word,
  `lemma`, `set_option`, `#eval`, sorry'd data or `True` placeholder; one `import Mathlib`; every
  definition has at least three Checks; every target has a locator; no declared gap
  (`design/plan.json` has `"gaps": []`).
- Headlines: the eleven theorems of the module docstring are the roadmap's end results; none is
  forced through a stand-in; no declaration follows by one tactic or one library lemma.
- Dependency check:

      depcheck: 250 roadmaps, 2380 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line.

### Copyright, licences and scope

Wording: the 60 verified ranges and 6 further passages (docstrings of `IsTrajectory`, `flow` and
`LanfordStatement`; the routes of §6.3, §8.2 and §10.4) were set beside GST2013 lines 208–216,
378–493, 664–698, 826–958, 1134–1268, 2038–2082, BGSS2023 lines 112–375, 476–485, 3535–3541 and
DengHaniMa2024 lines 134–300. No sentence, list or proof plan is shared; common runs are standard
names and formulas. Arrangement: GST2013 has the largest share, 53 of the 132 source citations of
the README. Its contents run Ch. 2 (Boltzmann equation), Ch. 3 (results), §4.1 (flow), §4.2
(Liouville, hierarchy), §4.3 (weak form), §4.4 (Boltzmann hierarchy); the layers run position
spaces, scattering, phase space, two-body problem, trajectories, Alexander's theorem, flow,
densities, ensembles, limit. Only `Layer 6 ↔ §4.1` and part of `Layer 8 ↔ §4.2–4.3` correspond, in
the order that the `*Needs:*` lines of §7.1 (§6.4) and §8.1 (§7.1–7.4) force; Layers 1, 4, 5, 9 have
no counterpart there. Reuse: no table, figure, list of examples or data is taken over.

Source independence: 66 passages compared with 3 sources, none shared; largest share GST2013, 53 of 132 locators; contents compared with GST2013: independent.

## Not verifiable

- Alexander1976, AlexanderThesis1975, Lanford1975, CIP1994, Spohn1991, Uchiyama1988 are recorded as
  uncertified and were not read; Alexander's theorem was checked against GST2013 Proposition 4.1.1
  and DengHaniMa2024 Proposition 1.2.
- No Lean was run. Elaboration and the existence of the `DiscreteTopology` and `IsZLattice`
  instances that `UnitFlatTorus` needs rest on the worker's signature transcript, which has an
  elaborated type for each of the 33 declarations.
- The clauses of `HardSphere.LanfordStatement` rest on the statement of BGSS2023 Theorem 1
  (lines 316–321), which has no proof there. Its hypothesis (1.1.5) bounds `|f⁰| + |∇_x f⁰|` by
  `C₀ exp(−β₀|v|²/2)`; the proposition bounds `f⁰` and its Lipschitz constant in `x` separately, so
  it is that theorem with the constant `2C₀`, for a datum whose gradient exists almost everywhere.
- ClassicalErgodicTheory is not in `merge-order/ORDER.txt`; the direction of that edge rests on the
  rule for open pull requests that add a roadmap folder and on the dependency check's result.
- The truth of `HardSphere.LanfordStatement 1` is claimed nowhere and was not decided.

## Source issues

- **Gap** in BGSS2023 at the proof of Corollary 1.2.1, printed p. 5 (lines 370–371): the source says the variance tends to 0 because the correlation functions converge almost everywhere; it should be a limit of the integrals, obtained from Scheffé's lemma and the conserved total mass; affects the proof.
- **Gap** in GST2013 at the proof of Proposition 4.1.1, printed p. 28 (lines 879–880): the source says grazing collisions are removed up to a null set of data, with no argument; it should be justified, for instance by the null set of tangent relative data; affects the proof.
- **Error** in DengHaniMa2024 at Proposition 1.2(3), printed p. 4 (lines 186–187): the source says the flow maps are diffeomorphisms of the domain minus one null set; it should be measure-preserving bijections, discontinuous at data colliding exactly at the given time; affects nothing.

## For the human reviewers

- **Licence.** Six of the nine entries of `sources.toml` are uncertified, among them the primary sources of both named theorems (Alexander1976 Proposition 4.3; Lanford1975); statements were checked against GST2013, BGSS2023 and DengHaniMa2024 only.
- **Scope.** `HardSphere.LanfordStatement` (`Suggested.lean:477`) is a defined proposition that this roadmap does not prove; `HardSphere.LanfordStatement.tendsto_empirical` assumes it, and no roadmap on main or in an open pull request plans its proof.
- **Scope.** The supplier ClassicalErgodicTheory §3.5 exists only in an open pull request of another author; §7.2, §7.5, §8.1 and §9.4 depend on it.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3bffb468c0a271d1e045de6fa6e6e3df88484201", "job": "RT-HardSphereDynamicsAndKineticLimits~2b", "model": "fable", "worker": "chris-x26"} -->
