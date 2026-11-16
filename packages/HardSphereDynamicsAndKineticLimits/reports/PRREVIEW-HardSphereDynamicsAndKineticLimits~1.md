# Review of HardSphereDynamicsAndKineticLimits (pull request #2448 at 55781a9)

**Verdict:** needs changes

## R01 (P3) — §10.4 is not "the statement of BGSS2023 Theorem 1": it adds continuity of the datum

**Location:** `TauCetiRoadmap/HardSphereDynamicsAndKineticLimits/README.md` line 947: "for `d ≥ 2` it is the statement of BGSS2023 Theorem 1: for all `C₀ ≥ 1` and `β₀ > 0` there is `T₀ > 0` such that for every continuous probability density `f⁰`". The same claim appears at README line 19 and at `Suggested.lean` lines 33 and 478; `Continuous f₀` is at `Suggested.lean` lines 488 and 516.

**Claim:** BGSS2023 Theorem 1 assumes only (1.1.5), a bound on `|f⁰| + |∇_x f⁰|`, and never asks for continuity. The proposition adds `Continuous f₀`, so it covers less data than that theorem, and it replaces (1.1.5) with two separate bounds. The README discusses how its conclusions differ from the source but says nothing about these changes to the hypotheses.

**Witness:** BGSS2023 line 168, (1.1.5): `|f0| + |∇x f0| ≤ C0 exp(−β0|v|²/2)`, with no continuity there or at lines 316–317. Continuity is assumed in GST2013 Theorem 4 (line 668).

**Repair:** At README line 947, replace "for `d ≥ 2` it is the statement of BGSS2023 Theorem 1:" with "for `d ≥ 2` it is BGSS2023 Theorem 1 restricted to continuous data (continuity is assumed in GST2013 Theorem 4, line 668, and not in BGSS2023 (1.1.5), line 168). The bound (1.1.5) on `|f⁰| + |∇_x f⁰|` is replaced by the two bounds below: (1.1.5) implies both, and together they give (1.1.5) almost everywhere with `2C₀` in place of `C₀`:". Make the same change at README line 19 and in the two docstrings (`Suggested.lean` lines 33 and 478).

## R02 (P3) — The pull-request description has two unfinished sentences

**Location:** Pull-request description, prose after the summary block: "It packages the result as a measure-preserving, reversible flow defined almost everywhere. On that flow it builds:" and, two paragraphs later, "Dependencies (the roadmaps the README cites by name and section, and what they in turn need; the Lean imports none of them)."

**Claim:** Neither sentence has the list it introduces. The first ends with a colon and nothing after it. The second names no roadmap, although the head cites ClassicalErgodicTheory §3.5 as a supplier.

**Witness:** README lines 79–85 (supplier contract "From TauCetiRoadmap.ClassicalErgodicTheory — §3.5", items 1, 3 and 4); README lines 3 and 89 (what the flow carries).

**Repair:** Replace "On that flow it builds:" with "On that flow it builds the transport of densities and the weak Liouville equation with specular reflection, marginals, the canonical and grand canonical ensembles with their invariance and correlation functions, the hard-sphere Boltzmann collision operator and mild solutions, the proposition `HardSphere.LanfordStatement` and its law of large numbers." Replace the "Dependencies (…)" sentence with "Dependencies: ClassicalErgodicTheory §3.5 items 1, 3 and 4 (conull flows, disjoint unions, transport of densities), consumed in §7.2, §7.5, §8.1 and §9.4; the Lean imports no roadmap."

## Verified sound

| Statement | Instances tried | Values computed (roadmap / check) | Result | Change |
|---|---|---|---|---|
| §1.1 `FlatPositionSpace`, short lift | unit torus `d = 2`; `UnitAddTorus (Fin 2)` with sup norm, `s = 0.1` | `‖π(½,½)‖ = √2/2 ≈ 0.7071`; `ℓ(π(0.9,0)) = (−0.1,0)`; sup norm 0.1 against lift norm `≥ 0.1414` | holds; the sup-norm torus is not an instance | none |
| §1.2 `E` with ρ = ∞ | `ε = 100`, `d = 2`; alternative ρ = 2 | `ν = (1,0)`; `vol B(0,100) = 10⁴π ≈ 31415.93`; ρ = 2 excludes `ε ≥ 2` | holds | none |
| §1.4 shells, packing | unit torus `d = 2`, ε = 0.4; `d = 1` shell `[0.4, 0.6]` | `1/(0.04π) = 7.96`, so at most 7 points; shell 0.2 against formula 0.4 (`r₂ ≥ ρ`) | holds; `r₂ < ρ` needed | none |
| §3.4 free transport and boost | `d = 1`, `x = v = 0`, `t = c = 1` | `S₁B₁ = (1,1)`, `B₁S₁ = (0,1)`, `A₁B₁S₁ = (1,1)` | holds | none |
| §4.3 `det DC = 1` | ε = 1, `a = (2,0)`, `u = (−1,0)` | `dτ = da₁ + du₁`; DC rows as printed; det `= 1·(−3+4) = 1`; variable-time map det 0 | holds | none |
| §4.4 `B_s` preserves measure | `d = 1`, ε = 1, `s = 4`, `a ∈ (2,3)`, `u ∈ (−1,−½)` | `τ < 4`; `B₄ = (2−a−4u, −u)`, det 1; image area ½ = source ½, inside `a > 1` | holds | none |
| §5.1 `IsTrajectory` | head-on example of the Conventions | `V(1) = (0,(−1,0))`, `⟨v₁−v₂,ν⟩ = 1 > 0`; `σ_M V(1) = ((−1,0),0) = V(1−)` | conditions (5), (7) hold | none |
| §5.3 time reversal | reversed head-on path; all seven conditions | `ℛγ(3) = ((1,0),(−2,0); 0,(1,0))`; back to `((2,0),0; (1,0),0)` at time 0; (6)↔(7) exchange checked | holds for every ε | none |
| §5.4 left-continuous convention | outgoing contact `x₁=(1,0)`, `x₂=0`, `v=(0,(−1,0))` | DengHaniMa2024 (3b) gives `(−1,0), 0` at `0+`; distance `1 − t < 1` | Check correct; source gap listed below | none |
| §6.3 iteration | `N = 2`, `d = 2`, ε = R = δ = 1, `t = 3` | `C₁ = 8(12π)²(π²/2) = 576π⁴ ≈ 56108`; state `(2,1), 0` has `D = 0`, grazes at 2, fails step 1 | holds | none |
| §8.4 symmetric expectations | `N = 3, s = 2`; `N = 1, s = 2` | `6∫W₃` against `9∫W₃` for all maps; `descFactorial 1 2 = 0` against truncated `1` | holds | none |
| §9.1 Maxwellians | `d = 1`, β = 1; `d = 3` | `M(0) = 0.39894`; `(2π)^{3/2} ≈ 15.7496`; `S = β⁻¹•1` gives `(β/2π)^{d/2}e^{−β|v−u|²/2}` | holds | none |
| §9.2 canonical ensemble | unit torus `N = 1`; `d = 2`, ε = 0.4, `N = 8` | `Z^can = 1`; `Z^can = 0` by packing (7.96 < 8) | holds | none |
| §10.1 empirical measure | μ = 1, `N = 2`; `N = 0` | `2·(δ_a+δ_b)/2 = δ_a+δ_b`, mass 2; `N = 0` gives the zero measure | holds | none |
| §10.4 `LanfordStatement` | `d = 0`, `f⁰ = 1`; BGSS2023 (1.1.5) against Lean hypotheses | `Z = 2`, `F₁ = ½ ↛ 1`, so false at `d = 0` as stated; split bounds are (1.1.5) up to `2C₀`; continuity added | statement narrower than the source | R01 |
| `IsTrajectory.eqOn` | `J = [0,1] ∪ [2,3]`, `N = d = 1`; σ_M injectivity | two trajectories differ at 2 (5 against 0), so `OrdConnected` is needed; `|ν| ∈ {0,1}` makes σ_M involutive for every ε | holds | none |
| `volume_hardCoreSet_diff_goodSet` | `N = 2` on `E`, `a = (−2,1)`, `u = (−1,0)` | `⟨a,u⟩ = 2`, `D = 4 − 4 = 0`: past grazing, not in `G`; the cylinder `D = 0` is null | holds | none |
| `flow_add` | ε = −1, `d = 1`; unit circle ε = ½ | `T₃Z` and `T₁T₂Z` both have positions `−2, 0`; `G = ∅`, `T_t = id` | holds for every ε | none |
| `measurePreserving_flow` | `E`, `d = 2`, ε = 1, `N = 2`; torus ε = 0.4, `N = 8` | `𝒟̄ᶜ` has infinite measure and is carried by the identity; `𝒟̄ = ∅` | holds | none |
| `flow_reversal` | ε = −1, `d = 1`, `t = 2` | `T₂(ℛZ) = (3,0; 1,0) = ℛ(T₋₂Z)`; `ℛℛ = id` | holds for every ε | none |
| `weak_liouville` | box datum with a non-specular φ; grazing state off `G` | left side −1 ≠ 0 without `hspec`; off `G`, `≤ −5` against `−2`, a null set | hypotheses needed; holds | none |
| `grandCanonical_flow_invariant` | `X = E`, `d = 1`, μ = c = β = 1 | `N = 1` term `√(2π)·∞`, so `Z = ∞` and the measure is zero, hence invariant | holds | none |
| `lintegral_sum_distinct_eq_correlation` | ε = 0, `t = 0`, μ = 2, `∫_B f⁰ = ½`; μ = 0 | `E[N(B)(N(B)−1)] = 1 = 4·¼`; all pairs would give 2; μ = 0: both sides 0 | holds | none |
| `boltzmannGrad_scaling` | unit torus `d = 3`, ε = 0.01, `f⁰ = M`; `d = 0` | bound `[1 − 0.0419, 1]`; at `d = 0`, `1 − ε ≤ ½` fails, so `d ≥ 1` needed | holds | none |
| `tendsto_empirical_of_correlation` | `F₂ → 2f⊗f`; `d = 1` with μ = 1 | variance tends to `m² > 0`; `P(N ≠ 1) → 1 − e⁻¹ ≈ 0.632` without `hμ` | hypotheses needed; holds | none |
| `LanfordStatement.tendsto_empirical` | `f⁰ = M_{1,0}`, `C₀ = 1`, `d = 2` | `(2π)⁻¹ ≈ 0.159 ≤ 1`, so admissible; `f = M` a.e.; `n = 1, 2` clauses feed the previous theorem | holds | none |

- Source locators checked against the cached texts: 82 (GST2013 38, BGSS2023 30, DengHaniMa2024 14). They cover all 15 sampled targets. Theorem numbers, lines and printed pages are all correct; one hypothesis mismatch (R01).
- Library declarations: 66 Mathlib and Tau Ceti names from the supplier contracts elaborate with `#check @` at the pins, with no error. I opened 16 at file and line, among them `TauCeti/Analysis/Semigroups/Group/Basic.lean:74`, `TauCeti/Probability/Process/EmpiricalMeasure.lean:58,75,224`, `TauCeti/Probability/Distributions/Gaussian/Density.lean:82,265`, `TauCeti/Algebra/Module/ZLattice/SuccessiveMinima.lean:111,424,492`, `Mathlib/MeasureTheory/Constructions/HaarToSphere.lean:88` and `Mathlib/MeasureTheory/Measure/Haar/Quotient.lean:222`.
- Cross-roadmap citations resolved: 12. ClassicalErgodicTheory §3.5 items 1, 3 and 4, §0.2 and its convention for measurable flows, at the head of its open pull request. On main: MathematicalBilliards §10.3, §10.5, §12.3; RandomMatrices §8.1; ProbabilisticAndMetricNumberTheory §4.9a `scalarLpKoopman_strong`; StandardDistributions Layer 5; OneParameterSemigroups (Completed); ComplexTori.
- Gate: every check 0, OK. Dependency check: `depcheck: 255 roadmaps, 2429 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. No changes outside the folder.
- Elaboration: `Suggested.lean` gives 11 `declaration uses 'sorry'` warnings and nothing else. I compared the elaborated types of all 31 declarations with the README. The 23 dropped-binder leads are false positives: `[MeasureSpace X]` and `[FlatPositionSpace d X]` appear in each type. `partitionFunction`, `grandCanonicalDensity` and `grandCanonical` keep only `[MeasureSpace X]`, as §9.3 says.
- Padding probe: I tried each of the 11 sorried theorems with `rfl`, `simp`, `infer_instance`, `simp_all` and `trivial`. None closes.
- Shape: all 45 target subsections have at least 3 Checks and a *Needs:* line. Every layer ends with Examples and Dependencies. About 100 numeric Checks and worked examples recomputed; all agree.

Overlap check: read ClassicalErgodicTheory, PointProcesses, RelativisticQuantumFieldTheory, CompressibleEulerEquations, DimerModelsAndLozengeTilings, IncompressibleFlows, MathematicalBilliards, OptimalTransport and RandomMatrices. Shared objects and owners:
- Flows defined almost everywhere: owned by ClassicalErgodicTheory §3.5, cited here.
- `ℂ/Λ` as a translation surface: owned by MathematicalBilliards §10.5. This roadmap owns only the Euclidean quotient norm and Haar measure of `E ⧸ L`.
- Correlation functions: RandomMatrices §8.1 and PointProcesses work on counts or point measures. This roadmap owns the transported labelled `F_n`, as its Scope says.
- IncompressibleFlows uses `UnitAddTorus`; nothing else is shared.

Source independence: 82 locators plus 7 further passages compared (the routes of §5.1, §6.3, §8.2 and §10.5, and the docstrings of `IsTrajectory`, `weak_liouville` and `LanfordStatement`) with 3 sources, using a full scan for shared 6-word runs. Nothing is shared beyond reference titles and stock phrases. Largest share: GST2013, 52 of 136 source citations. Contents compared with GST2013: independent. Layers 1, 4 and 9 have no GST2013 counterpart; Layers 2–8 draw only on Ch. 2 and §§4.1–4.3. Layers 9–10 overlap BGSS2023 §§1.1–1.2 only in the order the dependencies force (§9.5 before §9.6, and §10.1–10.4 before §10.5).

## Not verifiable

- Alexander1976 Proposition 4.3: uncertified in the manifest (Project Euclid served bot protection). It is cited alongside GST2013 Proposition 4.1.1, which I checked (lines 862–910).
- Lanford1975, AlexanderThesis1975, CIP1994, Spohn1991 and Uchiyama1988: uncertified and cited only as background. Not read.
- The published versions (EMS 2013; Ann. of Math. 198) were not read. I checked numbering only in arXiv v2 of GST2013 and BGSS2023.

## Source issues

- **Gap** in BGSS2023 at Corollary 1.2.1, proof, lines 370–371 (arXiv v2 p. 5): the source says the right side of (1.2.7) tends to 0 because `F₁` and `F₂` converge almost everywhere. It should add a mass argument: Scheffé's lemma, with conserved `∫F_n` and `∫f(t) = 1`, since almost-everywhere convergence alone does not pass to integrals. Affects the proof.
- **Gap** in DengHaniMa2024 at Definition 1.1(3b), lines 157–163 (p. 4): the source reflects velocities at every contact, with no condition that the pair is incoming. It should apply the rule only when `(v_i − v_j)·ω < 0`, since otherwise an outgoing contact datum is scattered into overlap. Affects nothing, because such data are null (Proposition 1.2).

## For the human reviewers

- The law of large numbers `HardSphere.LanfordStatement.tendsto_empirical` assumes `HardSphere.LanfordStatement d` as a hypothesis. The proof of that proposition is assigned to a roadmap on the BBGKY hierarchy (README lines 11 and 987), which is neither on main nor among the open roadmap pull requests.
