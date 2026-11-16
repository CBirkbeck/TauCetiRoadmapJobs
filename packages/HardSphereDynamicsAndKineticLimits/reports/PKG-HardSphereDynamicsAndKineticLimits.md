# PKG-HardSphereDynamicsAndKineticLimits

The accepted design (`packages/HardSphereDynamicsAndKineticLimits/design/README.md`, accepted at review round 17 after the fix of round 18) is written out as the roadmap package. Files written:

- `packages/HardSphereDynamicsAndKineticLimits/README.md`: the design README with the changes listed below;
- `packages/HardSphereDynamicsAndKineticLimits/Suggested.lean`: new, the acceptance test;
- `packages/HardSphereDynamicsAndKineticLimits/metadata.toml`: new, `topic = "math.AP"` (the primary arXiv class of GST2013 and DengHaniMa2024; the format follows `TauCetiRoadmap/MathematicalBilliards/metadata.toml` on main);
- this report.

Not changed: `sources.toml` (no source was added or dropped and no key moved to a new section; every key's `cited_for` still lists the numbered sections where it occurs) and `design/plan.json` (`gaps` stays empty: no supplier gap is needed). No source was fetched; `scratch/needs-references.toml` was not created.

## Headline theorems

| Headline | Section | Status |
|---|---|---|
| Uniqueness of hard-sphere trajectories | §5.2 | stated: `HardSphere.IsTrajectory.eqOn` |
| Alexander's theorem: `λ_N(𝒟̄ ∖ G) = 0` | §6.4 | stated: `HardSphere.volume_hardCoreSet_diff_goodSet` |
| The hard-sphere flow is a group | §7.1 | stated: `HardSphere.flow_add` |
| Liouville's theorem for hard spheres (measure preservation of `T_t` for `λ_N` and `λ_N|𝒟̄`) | §7.2 | stated: `HardSphere.measurePreserving_flow` |
| Reversibility `T_t ∘ ℛ = ℛ ∘ T_{−t}` | §7.3 | stated: `HardSphere.flow_reversal` |
| Weak Liouville equation with specular reflection | §8.2 | stated: `HardSphere.weak_liouville` |
| Invariance of the Maxwellian grand canonical measure | §9.4 | stated: `HardSphere.grandCanonical_flow_invariant` |
| Correlation functions compute sums over distinct tuples | §9.5 | stated: `HardSphere.lintegral_sum_distinct_eq_correlation` |
| Boltzmann–Grad scaling of the mean particle number | §9.6 | stated: `HardSphere.boltzmannGrad_scaling` |
| Law of large numbers from the first two correlation functions | §10.5 | stated: `HardSphere.tendsto_empirical_of_correlation` |
| Law of large numbers under Lanford's theorem | §10.5 | stated: `HardSphere.LanfordStatement.tendsto_empirical` |

Not statable at the pins: none. Lanford's theorem itself is not a theorem of this roadmap: it is the proposition `HardSphere.LanfordStatement` (a definition with a real body), which the roadmap on the BBGKY hierarchy proves; the module docstring says so.

Definitions in `Suggested.lean`, each with a real body and each needed by a headline: the class `FlatPositionSpace` (nine fields) and `FlatPositionSpace.shortLift`; `FlatTorus` with five instances (quotient norm, compactness with its proof, quotient σ-algebra, measure, Borel), and the abbreviation `UnitFlatTorus`; `HardSphere.scatter` (linearity proved), `hardCoreSet`, `contactScatter`, `reversal`, `freeFlow`, `IsTrajectory`, `goodSet`, `flow`, `partitionFunction`, `grandCanonicalDensity`, `grandCanonical`, `correlation`, `empirical`, `collisionOperator`, `IsMildBoltzmannSolution`, `LanfordStatement`. No `example`, no `set_option`, a single `import Mathlib` and no Tau Ceti import (no headline statement needs a Tau Ceti carrier; the Tau Ceti declarations of the supplier contracts are used by README targets).

What the README could not support in Lean: the structure of §1.1 on `FlatTorus L` (its lift, injectivity and local-measure axioms at the injectivity radius are theorems of §1.3) is a README target and is not declared, since an instance with unproved fields is excluded. So `HardSphere.LanfordStatement` and its corollary take `[FlatPositionSpace d (UnitFlatTorus d)]` as an instance argument; §10.4's Checks show every such structure gives the same proposition.

## Corrections and changes relative to the design

1. **Properness argument removed.** The design gave `HardSphere.LanfordStatement` two instance arguments: the properness of `𝕋^d` and the structure of §1.1. `Suggested.lean` now proves `CompactSpace (FlatTorus L)` (every class contains the fractional part `ZSpan.fract b x`, which lies in the bounded fundamental domain, so the quotient map carries its compact closure onto the torus), so `ProperSpace` is found by Mathlib's instance for compact metric spaces and only the structure remains an argument. README §1.3 states the compactness target with this route; the "How to read the build" paragraph, §10.4 and §10.5 drop the properness argument.
2. **Declarations added to the design's list** because the headline statements need them: `FlatPositionSpace.shortLift` (contact normals), `UnitFlatTorus` (the carrier of §10.4), `HardSphere.contactScatter` (conditions of `IsTrajectory`, the specular condition), `HardSphere.reversal` (`flow_reversal`), `HardSphere.freeFlow` (the material derivative of `weak_liouville`), `HardSphere.partitionFunction` and `HardSphere.grandCanonicalDensity` (shared by `grandCanonical` and `correlation`). Each is named in the README at its section (§1.1, §1.3, §3.3, §3.4, §9.3).
3. **§5.1, the definition of trajectories,** is now written as the seven conditions of `HardSphere.IsTrajectory`: right-continuity of the whole state within `J`, and the left limit within `J` equal to `σ_M Z(t)`. The README says why this is the design's `V(t) = σ_M V(t−)`: positions are continuous and `σ_M` is an involution of velocities at fixed positions, for every ε (§3.3 now says so, including ε ≤ 0 and ε ≥ ρ, where the contact normal is 0).
4. **§5.2, uniqueness, holds for every real ε** and needs `J` order-connected; the route is rewritten as the supremum/infimum argument it is, and a negative-control Check with `J = [0, 1] ∪ [2, 3]` shows the interval hypothesis is needed.
5. **§9.4** is stated for `μ ≥ 0`, `c ≥ 0` (the design had `μ > 0`, `c > 0`; the review of round 17 noted `c > 0` is not needed), with `f⁰ = c exp(−β|v − u|²/2) = c (2π/β)^{d/2} M_{β,u}`.
6. **§9.5's identity** is stated for every `μ ≥ 0` and measurable `f⁰` with no integrability hypothesis, which is what the Lean statement asserts; the README explains the junk cases (`μ = 0 < n`; an infinite partition function, which gives the zero measure and zero correlation functions, Conventions).
7. **Dimension.** The design said `d ≥ 1` throughout. The Lean definitions and the theorems other than `boltzmannGrad_scaling` (`d ≥ 1`) and `LanfordStatement.tendsto_empirical` (`d ≥ 2`) carry no hypothesis on `d`; the Conventions now say so, and why `d = 0` is trivial. `boltzmannGrad_scaling` keeps `1 ≤ d`: the adversarial pass shows it is false at `d = 0`.
8. **§10.2** defines `HardSphere.collisionOperator g v` on velocity profiles `g : E → ℝ`; `Q(g, g)(x, v)` denotes it applied to `g(x, ·)`, so every later formula is unchanged.
9. **§10.3** puts the joint measurability of `f` inside `HardSphere.IsMildBoltzmannSolution` and assumes nothing of `f⁰` (the API already derives its almost-everywhere bound).
10. **§10.4** defines `HardSphere.LanfordStatement d` for every `d`; it is the theorem of its sources for `d ≥ 2`, the corollary assumes `2 ≤ d`.
11. **§7.1** states `HardSphere.flow_add` as the group law for `0 < ε < ρ`; `T_0 = id` holds by definition.
12. **§8.2** states the admissibility of test functions as the Lean hypotheses (`|t| ≥ T` support, joint measurability, the derivative at `r = 0` of `r ↦ φ(t + r, S_r Z)` at every point, the specular condition for all `Z`, which is the design's condition because `σ_M` is the identity off nonempty matchings).
13. **Conventions:** ρ is an element of `ℝ≥0∞` and `ε < ρ` is written `ENNReal.ofReal ε < ρ`; μ is in `ℝ≥0`, `f⁰` is `ℝ≥0∞`-valued, `μ_ε = Real.toNNReal (ε⁻¹ ^ (d − 1))`.
14. **Supplier contracts** gained the Mathlib declarations the Lean file uses: `ZLattice.module_free`, `Module.Basis.ofZLatticeBasis`, `Module.Basis.ofZLatticeBasis_span`, `ZSpan.floor`, `ZSpan.fract`, `ZSpan.fract_mem_fundamentalDomain`, `ZSpan.fundamentalDomain_isBounded`, `QuotientAddGroup.measurableSpace`, `QuotientAddGroup.continuous_mk`, `EuclideanSpace.basisFun`, `BoundedContinuousFunction`, `MeasureTheory.Measure.withDensity`, `essSup`, `Fin.append` (each opened at the pin: `Mathlib/Algebra/Module/ZLattice/Basic.lean` lines 126 (`floor`), 165 (`fract`), 195, 246, 511, 611, 636; `Mathlib/MeasureTheory/MeasurableSpace/Constructions.lean` line 138, additive form; `Mathlib/Analysis/InnerProductSpace/PiL2.lean` line 782; `Mathlib/Topology/ContinuousMap/Bounded/Basic.lean`).
15. **`HardSphere.contactScatter` chooses nothing.** Its body no longer picks the contact partner with `h.choose`: under the matching condition the new velocity of particle `i` is `v_i + Σ_j (σ_{ν_ij}(v_i, v_j)₁ − v_i)`, the sum over the finite set of contact partners `j` of `i`, which the matching condition makes empty or a singleton; off matchings it is the identity as before. The value is unchanged (two scratch `example`s prove it: at a contact pair the new velocity is the first component of `σ_{ν_ij}(v_i, v_j)`, and a particle with no partner is fixed), and so is the elaborated signature. README §3.3 states the sum form, and its clause on the no-contact case now says that it is the empty sum, not a failure of the matching.
16. **Scope names no never-cite roadmap.** The sentence of "Scope and ownership" that handed point processes on unlabelled point measures to a roadmap on the project's never-cite list now says that this roadmap does not use them: the grand canonical measure lives on labelled configurations, where the flow acts, and every statement about it is made there. No target, Check or supplier changes.

The non-blocking finding of the last design review (round 17, F01, the attribution of the weak-convergence clause of §10.4) was applied by the round-18 fix and is kept. Its "for the human reviewers" notes are unchanged and still stand: six of nine manifest entries are `uncertified` (Alexander1976, AlexanderThesis1975, Lanford1975, CIP1994, Spohn1991, Uchiyama1988), and DengHaniMa2024 is cited as the preprint arXiv:2408.07818v3.

Notions moved down from later roadmaps: none.

## Duplication sweep and ownership

Searched by object with `roadmaps grep` over main (51d880d) and the open roadmap pull requests at their heads (index of 2026-11-16T03:17:53Z, 454 pull requests), and the pinned Mathlib and Tau Ceti:

- "Lanford", "Maxwellian", "grand canonical", "BBGKY", "collision operator", "canonical ensemble", "kinetic theory", "elastic collision", `FlatTorus`, `FlatPositionSpace`: no match outside this package.
- "hard sphere": ClassicalErgodicTheory (lines 72, 1160, 2440: the hard-sphere flow named as a consumer of its §3.5) and MathematicalBilliards (line 971, a downstream pointer). Neither owns a hard-sphere object.
- "specular": MathematicalBilliards (polygonal billiards) and SymplecticGeometry/CotangentLagrangian (billiard chords): other objects.
- "Liouville equation": SpecialFunctionsLegendre (Sturm–Liouville): another object.
- "flat torus": RiemannianGeometry (and its MinimalSurfaces), CalibratedGeometry, PositiveMass, RicciFlow, Yamabe, QuasiregularMaps, GeometricTopology, DGFloer: flat tori as Riemannian examples; none defines the normed group `E ⧸ L` with quotient norm and Haar measure. MathematicalBilliards §10.5 gives `ℂ/Λ` its translation-surface structure (cited in Scope, not restated).
- "correlation function": RandomMatrices §8.1 (eigenvalue counts; Scope explains why it is not consumed), a point-process roadmap on the never-cite list and DimerModelsAndLozengeTilings (other objects).
- "empirical measure": Tau Ceti `TauCeti.Probability.empiricalMeasureOfFintype` (a probability measure; §10.1 Checks compare), and other roadmaps' empirical measures of sequences.
- "Gibbs measure": DimerModelsAndLozengeTilings, ClassicalErgodicTheory, PDE: Gibbs measures of lattice models and potentials, other objects.
- Pinned libraries: no hard-sphere dynamics, Maxwellian, Boltzmann operator, specular reflection or flat-torus type; Mathlib's `UnitAddTorus` has the supremum norm (§1.1 Check).

Removals: none; nothing this roadmap defines exists elsewhere. This roadmap owns the hard-sphere objects and `FlatTorus` because no roadmap on main or open states them. No declaration of `Suggested.lean` has the fully qualified name of a declaration of another roadmap (all live under `TauCetiRoadmap.HardSphereDynamicsAndKineticLimits`).

Citations resolved now: ClassicalErgodicTheory §3.5 items 1, 3, 4 and §0.2 at the head of its open pull request (another author's, adding a new roadmap folder; §3.5 at its README lines 1159–1202, §0.2 at lines 371–410); on main MathematicalBilliards §10.3 (line 752), §10.5 (line 788), §12.3 (line 897); ProbabilisticAndMetricNumberTheory §4.9a (line 6319, `scalarLpKoopman_strong` at 6363); RandomMatrices §8.1 (line 1133); StandardDistributions Layer 5; `Completed/OneParameterSemigroups`; ComplexTori. Tau Ceti at the pin: `TauCeti/Probability/Distributions/Gaussian/Density.lean` lines 82, 265; `TauCeti/Analysis/Semigroups/Group/Basic.lean` line 74; `TauCeti/Probability/Process/EmpiricalMeasure.lean` line 224; `TauCeti/Dynamics/Flow/OfLipschitz.lean` line 59. `roadmaps resolve` on the package README: no cross-roadmap citation and no Lean name found nowhere.

`scratch/overlaps.md`: no other pull request changes this roadmap, no dropped or revision-only id, no second copy; the closest roadmaps (ClassicalErgodicTheory, PointProcesses, RelativisticQuantumFieldTheory, HamiltonianSystems, DimerModelsAndLozengeTilings, MathematicalBilliards, OptimalTransport, RandomMatrices) were compared in the sweep above; none owns an object of this roadmap. PointProcesses and HamiltonianSystems are on the never-cite list: neither is a supplier and the README and `Suggested.lean` name neither (the dropped-names scan of the gate finds no hit); Scope says that point processes on unlabelled point measures and smooth Hamiltonian flows are not used.

## Adversarial pass

`E` is Euclidean space; the head-on witness is ε = 1, `x_1 = (2, 0)`, `x_2 = 0`, `v_1 = (−1, 0)`, `v_2 = 0`. Every value below was computed for this package.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `FlatPositionSpace` (fields) | `E` with `π = id`, ρ = ∞; unit torus d = 2, ρ = 1/2; d = 0 | `E`: every field holds with lift `a = ξ`; torus: `ξ = π(0.3, 0.3)`, `‖ξ‖ = 0.4243 < 0.5`, lift `(0.3, 0.3)` of norm 0.4243; `(0.5, 0)` and `(−0.5, 0)` (norm 0.5, not < ρ) have one image, so ρ = 1/2 is maximal; d = 0: `E`, `X` points, any ρ | Holds | fields named in §1.1 |
| `FlatPositionSpace.shortLift` | torus `π(0.9, 0)`; `π(0.5, 0.5)`; ε ≥ ρ | `(−0.1, 0)`, norm 0.1 = `‖ξ‖`; `‖π(0.5, 0.5)‖ = 0.7071 ≥ 0.5`, every lift has norm ≥ 0.7071, value 0; `‖π(0.3, 0.52)‖ = 0.6003 ≥ ρ`, value 0 | Matches §1.1 API | §1.1 bullet on `‖ξ‖ ≥ ρ` |
| `FlatTorus` instances | `ℤ` in d = 1; `2ℤ × ℤ`; d = 0 | closure `[0, 1]` maps onto the circle (compact); fundamental domain `[0, 2) × [0, 1)`, mass 2 = covolume; d = 0: `L = 0`, quotient a point, mass `vol({0}) = 1` | Holds | compactness proved in Lean |
| `UnitFlatTorus` | `span ℤ (range basisFun)` | the instances `DiscreteTopology` and `instIsZLatticeRealSpan` are found by elaboration; covolume 1 | Holds | new abbreviation |
| `HardSphere.scatter` | ν = (1, 0), `v = (0, 0.9)`, `w = (0.9, 0)`; non-unit ν = (2, 0) | `⟨v − w, ν⟩ = −0.9`, image `((0.9, 0.9), 0)`, energy 1.62 both sides; ν = (2, 0), `v = (1, 0)`, `w = 0`: image `((−3, 0), (4, 0))`, momentum `(1, 0)` kept, energy 1 → 25 | Identities need `|ν| = 1`, as §2.1 says | none |
| `HardSphere.contactScatter` | ε = 1, `x_1 = (1, 0)`, `x_2 = 0`, `V = ((1, 0), 0)`; applied twice; three positions `0, (1, 0), (−1, 0)` | particle 1: `ν_12 = (1, 0)`, `⟨(1, 0), ν⟩ = 1`, `v_1' = 0`; particle 2: `ν_21 = (−1, 0)`, `⟨0 − (1, 0), ν_21⟩ = 1`, `v_2' = (1, 0)`; twice: `((1, 0), 0)` again; not a matching: identity | Per-particle form equals the pairwise `σ_ν`; involution | §3.3 text |
| `HardSphere.contactScatter` (sum form, no choice) | the same pair; a third particle `x_3 = (5, 0)` with no contact; N = 0; three positions `0, (1, 0), (−1, 0)` (particle 1 at `0` touches both) | particle 1: partner set `{2}`, sum `= σ(v_1, v_2)₁ − v_1 = 0 − (1, 0)`, new `v_1 = 0`; particle 2: partner set `{1}`, new `v_2 = (1, 0)`; particle 3: partner set `∅`, empty sum, `v_3` unchanged; N = 0: the empty function; three positions: guard fails (`j = 2 ≠ 3 = k`), identity | Equal to the partner form at every input (two scratch `example`s prove the contact and the no-contact case) | body rewritten; §3.3 text |
| `HardSphere.reversal` | outgoing contact state above | `(X, (0, (−1, 0)))`, `⟨v_1 − v_2, ν_12⟩ = 1` (outgoing) | Holds | none |
| `HardSphere.freeFlow` | unit torus `(π 0, e_1)`, t = 1; `E`, `(0, (1, 0))`, t = 2 | `(π e_1, e_1) = (π 0, e_1)`; `((2, 0), (1, 0))` | Holds | none |
| `HardSphere.IsTrajectory` | head-on witness, the seven conditions; left-continuous variant; free motion through the contact | distances `2 − t ≥ 1` (t ≤ 1), `t ≥ 1` (t ≥ 1); `𝒯 = {1}`; at t = 1 `⟨(1, 0), (1, 0)⟩ = 1 > 0`; left limit `((−1, 0), 0)` = `σ_M(0, (−1, 0))` computed as `(−1, 0)` and `0`; variant: `⟨(−1, 0), (1, 0)⟩ = −1`, fails (5); free motion: distance 0.5 at t = 1.5, fails (1) | Holds; non-examples excluded | §5.1 rewritten as the seven conditions |
| `HardSphere.IsTrajectory.eqOn` | J = `[0, 1] ∪ [2, 3]`, N = d = 1; ε ≥ ρ; d = 0 | two trajectories on J agreeing at 0, positions 0 and 5 at time 2 (condition (2) gives `0 + ∫_1^2 5 = 5`; conditions (6), (7) vacuous at 1 and 2 since `1 ∉ closure [2, 3]`); for ε ≥ ρ the normal is 0 and `σ_0 = id`, injective; d = 0 trivial | Needs `J.OrdConnected` (kept), holds for every ε | hypothesis on ε dropped; negative-control Check added |
| `HardSphere.goodSet`, `HardSphere.flow` | head-on: `T_3`; grazing state `x_1 = (2, 1)` | `T_3 Z = ((1, 0), (−2, 0); 0, (−1, 0))`; grazing: `D = 4 − 4 = 0`, not in G, `T_1 Z = Z` | Holds | none |
| `HardSphere.volume_hardCoreSet_diff_goodSet` | N = 2 on `E`; d = 0; N ≤ 1 | exceptional set `{u ≠ 0, D = 0}` ∪ incoming or grazing contact states, null (cylinder and contact set); d = 0: `𝒟̄_2 = ∅` (distances 0 < ε); N ≤ 1: G is everything | Holds | none |
| `HardSphere.flow_add` | head-on, s = 1, t = 2 | `T_2 Z = ((1, 0), (−1, 0); 0, (−1, 0))`, then `T_1` gives `x_2 = (−2, 0)` = `T_3 Z` | Holds | `T_0 = id` moved to the definition |
| `HardSphere.measurePreserving_flow` | N = 2 on `E`; unit torus d = 2, ε = 0.4, N = 8 | reduces to §4.4 in relative coordinates; `𝒟̄_8 = ∅`, T_t the identity | Holds | none |
| `HardSphere.flow_reversal` | head-on, t = −3 | `T_{−3}(ℛ Z)`: from `((2, 0), 0; (1, 0), 0)` backward, contact at −1, `V(−1−) = (0, (1, 0))`, state `((1, 0), (−2, 0); 0, (1, 0))` at −3; `ℛ(T_3 Z) = ((1, 0), (−2, 0); 0, (1, 0))` (no contact at time 3) | Equal | none |
| `HardSphere.weak_liouville` | N = 0; d = 1 non-specular test function; N = 1 | N = 0: `W⁰(φ(∞) − φ(0)) + W⁰ φ(0) = 0`; non-specular: left side `∫ W⁰ (v_1 − v_2) = −1 ≠ 0` (§8.2 Check), excluded by the specular hypothesis; N = 1: weak free transport | Holds; hypothesis needed | §8.2 admissibility stated as the Lean hypotheses |
| `HardSphere.partitionFunction`, `grandCanonicalDensity`, `grandCanonical` | ε = 0, `∫ f⁰ = 1`, μ = 2; μ = 0; infinite `∫ f⁰`, μ > 0 | `Z = Σ 2^N/N! = e² = 7.389`, `P(N = 1) = 2e^{−2} = 0.27067`; μ = 0: `Z = 0^0 · 1 = 1`, the unit mass at the empty configuration; `Z ≥ 1 + μ ∫ f⁰ = ∞`, densities `x/∞ = 0`, zero measure | Holds; junk case recorded in Conventions | §9.3 text |
| `HardSphere.grandCanonical_flow_invariant` | c = 0; unit torus `f⁰ = M_{1,0}` (c = `(2π)^{−d/2}`, 0.15915 for d = 2); position-dependent profile | vacuum law, invariant; density `Π_i M(v_i) 1_{𝒟̄}`, a function of H, P and `𝒟̄`; `r(0) = 1.5` against `r(−1/4) = 1` (§9.4 Check) not covered | Holds | `μ ≥ 0`, `c ≥ 0` |
| `HardSphere.correlation`, `lintegral_sum_distinct_eq_correlation` | μ = 0, n = 1; ε = 0+ Poisson, `h = 1_B ⊗ 1_B`; s > N count | μ = 0: left side 0 (no embedding `Fin 1 ↪ Fin 0`), right side `0 · (∞ · 0) = 0`; Poisson λ = 1: `E[N(B)(N(B) − 1)] = λ² = 1` both sides, all pairs would give 2; `Nat.descFactorial 1 2 = 0` | Holds | generality `μ ≥ 0`, no integrability |
| `HardSphere.boltzmannGrad_scaling` | d = 3, ε = 0.01, unit torus, `f⁰ = M_{1,0}`; d = 0 | `ω_3 ε = 4.18879 · 0.01 = 0.0419`, bounds `[0.9581, 1]`; d = 0: μ = `ε⁰ = 1`, `𝒟̄_N = ∅` for N ≥ 2, `E[N] = P(N = 1) = 1/2`, lower bound `1 − ω_0 ε = 1 − ε` (ω_0 = 1, `ρ⁰ = 1`), false for ε < 1/2 | Needs `d ≥ 1` (kept) | negative control in this table |
| `HardSphere.empirical`, `collisionOperator` | `h = 1`; d = 1; Maxwellian | `π_t(1) = N/μ`; `σ_{±1}(v, w) = (w, v)`, integrand `g(w)g(v) − g(v)g(w) = 0`; `Q(M, M) = 0` by `M(v')M(w') = M(v)M(w)` | Holds | operator on velocity profiles |
| `HardSphere.IsMildBoltzmannSolution` | Maxwellian; wrong transport sign on the circle | `f = M` satisfies it with `Q = 0`; `f⁰(π(1/2), 1) = 0.5 M(1)` against `1.5 M(1)` | Holds; sign fixed | measurability inside the predicate |
| `HardSphere.tendsto_empirical_of_correlation` | variance limit; `F_2 → 2 f ⊗ f`; d = 1 | `0 + m² − 2m² + m² = 0`; `0 + 2m² − 2m² + m² = m²`; d = 1: `μ_ε = 1` does not tend to ∞, hypothesis fails (`P(N ≠ 1) → 1 − e^{−1} = 0.63212`) | Holds; hypotheses needed | `f⁰` measurable with finite integral |
| `HardSphere.LanfordStatement` | equilibrium `f⁰ = M_{1,0}`, C₀ = 1, β₀ = 1; quarter-turn structure | `C₀ = 1 ≥ (2π)^{−1} = 0.15915`; `f(t) = M`, `F^ε_n(t) = F^ε_n(0)` by §9.4–9.5, limits by §9.6; `π(B(0.3, 0)) = π(0, 0.3)`, norm 0.3 | Consistent | defined for every d; no properness argument |
| `HardSphere.LanfordStatement.tendsto_empirical` | d = 2; d = 1 | `μ_ε = ε^{−1} → ∞`; d = 1: `μ_ε = 1`, conclusion fails (0.63212) | Needs `d ≥ 2` (kept) | none |

Context: every declaration's elaborated type was compared with its README statement through a scratch file of `#check @name` for all 31 declarations, before and after the last edit; every instance argument (`[ProperSpace X]`, `[MeasureSpace X]`, `[BorelSpace X]`, `[FlatPositionSpace d X]`, `[IsFiniteMeasure volume]`) and every hypothesis appears in the elaborated types; nothing changed between the two runs. After the rewrite of the body of `HardSphere.contactScatter`, `#check @HardSphere.contactScatter` was run again: its type is unchanged (the four instance arguments of `X`, `[FlatPositionSpace d X]`, `ε : ℝ`, `{N : ℕ}`, the configuration, and the configuration as value).

Duplication by object at the pins: see the sweep above; claims of library content in the README were checked at the pin with their files (supplier contracts list them).

## Elaboration

`lake env lean packages/HardSphereDynamicsAndKineticLimits/Suggested.lean` (run from the content checkout, absolute path): exit status 0; exactly 11 warnings, each `declaration uses 'sorry'` (the 11 headline theorems); no other message, also when re-run after the rewrite of `HardSphere.contactScatter`. The statement-hygiene scan of the gate on the repaired file reports nothing (no `def` body chooses its datum). No Tau Ceti module is imported, so nothing had to be built.

## Dependency check

```text
depcheck: 242 roadmaps, 2261 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The roadmap is in the merge order after MathematicalBilliards. ClassicalErgodicTheory, the only roadmap supplier, is another author's open pull request adding a new roadmap folder and is not in the merge order, so the check does not see that edge; by reading, its §3.5 needs its own §§0.1, 3.1, 3.3 and MathematicalBilliards §§8.2–8.3 and names the hard-sphere flow only as a consumer, so the supply runs one way.

## Untrusted text

Nothing read in issues, pull requests, roadmaps or sources asked for any action; nothing suspicious to quote.
