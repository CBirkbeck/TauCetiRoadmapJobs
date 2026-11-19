# Review of HardSphereDynamicsAndKineticLimits (pull request #2448 at 6ffdf49)

**Verdict:** accepted

**Summary.** Accepted: no finding. The text added since the last reviewed head was recomputed and holds: the structure independence of the Lanford proposition (§10.4), the Borel description of the good set (§6.4), the symmetries stated for every real ε (§5.3, §5.5, §7.3) and the regularity input of §7.4. There are three small corrections (an interval hypothesis in §5.1, the standing hypothesis in the opening overview, one sentence of the description that is out of date) and no format note; none blocks. Three points are left for the human reviewers.

## C01 — The conservation bullet of §5.1 holds on intervals only, and the bullet does not say so

A reader who applies the bullet "Conservation: `P(V(t))` and `H(V(t))` are constant on `J`" (API of §5.1, line 380) to the definition as written, for a set of times `J`, gets a false statement, and §5.2 of the same roadmap shows that the interval hypothesis matters for the neighbouring result.

For `N = d = 1` on `E` and `J = [0, 1] ∪ [2, 3]`, take the path with `x = 0`, `v = 0` on `(−∞, 1]`, `v = 5` on `(1, 2)`, and `x(t) = 5 + (t − 2)`, `v = 1` on `[2, ∞)`. Condition (2) holds (`x(2) = 0 + 5`), condition (3) holds with `𝒯 = ∅` (the velocity is constant on each of the two subintervals of `J`), conditions (4) and (5) are empty, and conditions (6) and (7) are vacuous at the gap. It is a trajectory on `J` with `H = 0` on `[0, 1]` and `H = 1/2` on `[2, 3]`. Writing "for an interval `J`" in the bullet (the hypothesis `HardSphere.IsTrajectory.eqOn` already carries) makes it true.

## C02 — The overview states Alexander's theorem, Liouville's theorem and the invariance of the Maxwellian ensemble without saying that they are among the statements assuming `0 < ε < ρ`

The first paragraph says "Most dynamical statements assume 0 < ε < ρ; a few, such as the group law of the flow, hold for every real ε" (line 3), and the next three paragraphs then state the main theorems with no hypothesis on ε, so a reader cannot tell which side each falls on. It matters: Alexander's theorem fails for ε ≥ ρ. On the unit torus in dimension 2 (ρ = 1/2) with ε = 0.6 and `N = 2`, the set `𝒟̄_2` has positive measure (torus distances reach `√2/2 ≈ 0.707`), every contact has short lift 0, so condition (5) of §5.1 reads `0 < 0` and a trajectory has no contact; it is then a free motion that stays at distance more than 0.6 for all time, which forces relative velocity 0, since every geodesic of the torus through the region around `(1/2, 1/2)`, of diameter about 0.21, leaves it. So `𝒟̄_2 ∖ G` contains every state with `v_1 ≠ v_2` and has infinite measure.

The layers state the hypothesis correctly (§6.4, §7.2, §9.4, §9.6). In the overview, a sentence such as "Throughout this overview 0 < ε < ρ, except for the group law and the reversibility of the flow, which hold for every real ε" would do.

## C03 — The description says that the roadmap proving the Lanford proposition is neither on main nor an open pull request; it is now an open pull request, and the README names it

The description ends its main paragraph with "is left to a roadmap on the BBGKY hierarchy, listed among the downstream consumers, which is neither on main nor an open pull request", and the summary block speaks of "one on the BBGKY hierarchy". At this head the README names that roadmap (§10.4, line 893; Downstream consumers, line 935; Scope and ownership, line 954): BoltzmannGradLimitAndLanford, whose §5.2 proves `HardSphere.LanfordStatement d` for `d ≥ 2`, and that roadmap is an open pull request by another author. I read its §5.2, its scope and its supplier contracts at its head: they agree with what this README says of it, and it restates none of this roadmap's objects.

The sentence that would be right: "The proof of the proposition itself (the BBGKY and Boltzmann hierarchies) is left to BoltzmannGradLimitAndLanford, §5.2, a consumer of this roadmap that is an open pull request by another author; it is not a prerequisite." The description also leaves out that the head adds a target to §10.4, the independence of the proposition from the chosen structure on the unit torus; one clause would cover it.

## Verified sound

| Statement | Instances tried | Values computed (roadmap / check) | Result | Change |
|---|---|---|---|---|
| §1.1 flat position spaces | `E`, ρ = ∞; unit torus d = 2; `UnitAddTorus` sup norm at `(s, s)` | class of `(1/2, 1/2)` has norm 0.7071; lift of `(0.9, 0)` is `(−0.1, 0)`; 0.1 against 0.1414 | holds | none |
| §1.4 shells, packing | torus d = 2, ε = 0.4; circle shell `[0.4, 0.6]` | `1/(0.04π) = 7.96`, 7 points; shell measure 0.2 against formula 0.4 | holds; `r₂ < ρ` needed | none |
| §4.1 collision time | `a = (2,0)`; `(1,3)`; `(2,3)` with `u = (−1,0)` or `(0,−1)`, ε = 1 | `D = 1, 0, −3`; `τ = 1`; `⟨q, u⟩ = −1 = −√D`; larger root 3 | holds | none |
| §4.4 two-body measure | d = 1, rectangle `(2,3) × (−1,−1/2)`, `s = 4` | `B_4 = (2 − a − 4u, −u)`, determinant 1, image in `a > 1`, area 1/2 | holds | none |
| §5.1 `IsTrajectory` | head-on witness; `J = [0,1] ∪ [2,3]`, `N = 1` | `𝒯 = {1}`; disconnected `J`: `H = 0` then `1/2` | definition sound; conservation bullet needs an interval | C01 |
| §5.3 symmetries, every real ε | boost `c`; ε = 0; ε ≥ ρ; ε < 0 | `σ_ν(v+c, w+c) − (c,c) = σ_ν(v,w)` for every ν; normal 0 at ε = 0 and ε ≥ ρ, reversal is `V ↦ −V` | hold for every ε | none |
| §5.4 left-continuous convention | head-on witness at time 1; DengHaniMa2024 lines 150–166 | incoming state `((−1,0), 0)`; source domain closed, velocities left-continuous, `d ≥ 2` | holds | none |
| §5.5 good set | `a = (−2,1)`, `u = (−1,0)`, ε = 1 | `⟨a,u⟩ = 2`, `D = 4 − 4 = 0`, graze at time −2 at `(0,1)` | holds | none |
| `IsTrajectory.eqOn` | ε in the three ranges; `J` disconnected | `σ_M` an involution (unit normals) or the identity (normal 0); paths differ at time 2 | true; `OrdConnected` needed | none |
| §6.3 iteration | `N = 2`, d = 2, ε = R = 1; grazing state `(2,1)` | `8(12π)²(π²/2) = 576π⁴ ≈ 56108`; passes step 0, fails step 1 | holds | none |
| §6.4, `volume_hardCoreSet_diff_goodSet`, Borel route | converse for `N ≥ 3`; near pairs; torus ε = 0.6 | second-nearest distance `> ε + η₀` on `[0,t]`; third particle farther than `ε + 2Rδ`; ε ≥ ρ: complement of infinite measure | true for `0 < ε < ρ`; false beyond | C02 (overview only) |
| §7.1 `flow`, `flow_add` | `Z ∉ G`; head-on `t = 3`; ε = −1 | all three maps fix `Z`; positions `(1,0)`, `(−2,0)`; rods pass, positions `−2, 0` both ways | holds for every ε | none |
| `measurePreserving_flow` | torus d = 2, ε = 0.4, `N = 8`; `E`, `N = 2` | `𝒟̄_8 = ∅`, identity; `λ(𝒟̄ᶜ) = ∞`, carrier `G ∪ 𝒟̄ᶜ` | holds | none |
| §7.3, `flow_reversal` | `Z ∉ G`; ε = −1, `t = 2`; grazing state boosted | both sides `ℛZ`; positions `3, 0`, velocities `1, 0`; boosted state fixed, formula gives `(3,1)` | reversal for every ε; covariance on `G` only | none |
| §7.4 Koopman group | regularity of `λ_N|𝒟̄`; `N = d = 1` circle | pinned lemma needs σ-compact, pseudometrizable, Borel, locally finite: all hold; mass `1 · ∞` | holds for `p < ∞` | none |
| §7.5 grand canonical phase space | circle, ε = 0.2, speeds ≤ 1 | `λ_2 = 0.6 · 4 = 2.4`, `Λ = 1.2` | holds | none |
| `weak_liouville` | Lean file unchanged since the last reviewed head; d = 1 box | defect `∫ W⁰(v_1 − v_2) = −1` without the specular condition | true as stated | none |
| §8.4 symmetric expectations | `(s, N) = (2, 3)`, `(2, 1)` | 6 against 9 for all maps; `descFactorial 1 2 = 0` | holds | none |
| `grandCanonical_flow_invariant` | `μ = 0`; `X = E`, d = 1 | vacuum; `N = 1` term `√(2π) · ∞`, zero measure | true | none |
| §9.5, `lintegral_sum_distinct_eq_correlation` | `μ = 0`, `n = 0` and `n ≥ 1`; Poisson `λ = 1` | both sides 1; `0 = 0` (`∞ · 0 = 0`); `E[N(N−1)] = 1`, all pairs 2 | true | none |
| `boltzmannGrad_scaling` | d = 3, ε = 0.01; `‖ρ⁰‖_∞ = ∞` | `ω_3 ε = 0.0419`; left side truncates to 0; `μ_ε ε^d = ε` | true; `1 ≤ d` used | none |
| §10.1 empirical measure | `N = 0`; `N = 2`, `μ = 1` | zero measure; `2 · (δ_a + δ_b)/2` | holds | none |
| `tendsto_empirical_of_correlation` | limit of the second moment; ε = 0, `μ = 2` | `0 + m² − 2m² + m² = 0`; `Var = 1/2 = μ⁻¹ ∫ f⁰` | true; ε small gives `0 < ε < ρ`, `μ_ε > 0` | none |
| §10.4 `LanfordStatement`, structure independence | d = 0; quarter turn `B` in d = 2; small ball | `F_1 = 1/2` against 1; lattice vector of norm `< 3/4` is 0; `|det B| = 1`, `‖B‖ ≤ 1`; `σ_{(1,0)}((−1,0),0) = B⁻¹σ_{(0,1)}((0,−1),0)` | independent of the structure; false for d = 0 | none |
| `LanfordStatement.tendsto_empirical`, §10.5 | d = 1 circle, `f⁰ = M`, δ = 1/2; d ≥ 2 | `P(N ≠ 1) → 1 − e⁻¹ ≈ 0.632`; `μ_ε → ∞` | `2 ≤ d` needed and present | none |

- Source locators checked against the texts: all 73 distinct line ranges of the README (GST2013 36, BGSS2023 26, DengHaniMa2024 11), which include every locator of the 15 sampled sections, and the 27 rows of the page table of the References; all hold. The README flags no locator as unverified.
- Library declarations opened at the pins: 58 Mathlib names by `#check` in a copy of the file, none unknown, among them `MeasureTheory.Measure.Regular.of_sigmaCompactSpace_of_isLocallyFiniteMeasure` and `MeasureTheory.MemLp.exists_hasCompactSupport_eLpNorm_sub_le` with the hypotheses the README states; 10 Tau Ceti names by file and line (`Algebra/Module/ZLattice/SuccessiveMinima.lean` 111, `Probability/Process/EmpiricalMeasure.lean` 58, 75, 224, `Probability/Distributions/Gaussian/Density.lean` 82, `Analysis/Semigroups/Group/Basic.lean` 74, `Dynamics/Flow/OfLipschitz.lean` 59).
- Cross-roadmap citations resolved: 9. BoltzmannGradLimitAndLanford §5.2 and ClassicalErgodicTheory §3.5 items 1, 3, 4 and §0.2 at their open heads; on main MathematicalBilliards §10.3, §10.5, §12.3, RandomMatrices §8.1, ProbabilisticAndMetricNumberTheory §4.9a.
- Automatic checks: all passed. Dependency check: `depcheck: 199 roadmaps, 2188 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. No change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives 11 `declaration uses sorry` warnings (lines 262–515) and nothing else. The Lean file and the pins are unchanged since the last reviewed head; the elaborated types of the 11 theorems carry the five class binders, and `hardCoreSet` only the norm, as the README says.
- Padding probe: each of the 11 theorems tried with `rfl`, `simp`, `infer_instance` on a copy of the file; none closes. All 11 headlines of the module docstring are stated; none is declared not statable.
- Pull-request text: title and summary block agree with the head; one sentence of the prose is out of date (C03).
- Previous review: an acceptance with no finding, so nothing to repair; the 181 changed lines (README only) were reviewed in full with the rest.

Overlap check: read BoltzmannGradLimitAndLanford, ClassicalErgodicTheory, PointProcesses, RelativisticQuantumFieldTheory, LangevinAndHamiltonianMonteCarlo, MathematicalBilliards, OptimalTransport, ProbabilisticAndMetricNumberTheory; nothing shared. The statement `HardSphere.LanfordStatement` is owned here and its proof by BoltzmannGradLimitAndLanford §5.2, which restates none of this roadmap's objects and whose Lean file declares nothing; conull flows are ClassicalErgodicTheory §3.5's, cited; the hard-core density of PointProcesses lives on unlabelled point measures; Liouville's theorem of LangevinAndHamiltonianMonteCarlo is for smooth Hamiltonian flows.

Source independence: 73 passages compared with 3 sources, none shared (what coincides is formulas, standard names and forced lists of hypotheses); largest share GST2013, 36 of 73 line locators; contents compared with GST2013: independent (its Chapter 4 is spread over Layers 5 to 8; Layers 1 to 4, 9 and 10 have no chapter counterpart). Alexander1976, Lanford1975 and the four background references were not read.

Research link: Layers 5 to 7 are the finite-particle dynamics of Alexander (1976) as used by Gallagher, Saint-Raymond and Texier (2013); Layers 9 and 10 are the grand canonical setting and the statement of Lanford's theorem in Bodineau, Gallagher, Saint-Raymond and Simonella (2023), also the setting of Deng, Hani and Ma (2024). Rests on the three texts read.

## Not verifiable

- Alexander1976 Proposition 4.3 (§6.4): uncertified, not read; the locator rests on GST2013 line 855 and lines 5439–5440.
- Lanford1975 as the fixed-`N` statement (§10.4): uncertified, not read; rests on BGSS2023 lines 313–315.
- The published versions of GST2013 and BGSS2023: numbering checked in the arXiv versions the README cites only.

## Source issues

- **Misprint** in GST2013 at (4.4.1), printed page 33 (line 1222): the source says the starred velocities are the pre-image under (4.1.1), the free-flow equations; it should be (4.1.2), the reflection law; affects nothing.

## For the human reviewers

- `HardSphere.LanfordStatement.tendsto_empirical` assumes `HardSphere.LanfordStatement d`; the roadmap assigned to prove it, BoltzmannGradLimitAndLanford (README lines 893, 935, 954), is an open pull request by another author whose `Suggested.lean` states no theorem.
- BGSS2023 prints Theorem 1 without proof (line 322 refers elsewhere); GST2013 Theorem 8 (lines 2069–2080) prints convergence of velocity averages only. The uniform and almost-everywhere clauses of `LanfordStatement` rest on BGSS2023's wording (README line 893).
- Alexander1976 and Lanford1975 are cited by locator without their text (paywalled); the published numbering of GST2013 and BGSS2023 was not compared with the arXiv versions cited.
