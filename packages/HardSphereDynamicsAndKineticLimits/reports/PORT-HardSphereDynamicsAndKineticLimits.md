# PORT-HardSphereDynamicsAndKineticLimits

## Result

- Branch: `roadmap/hard-sphere-dynamics-and-kinetic-limits`, created from `2b655a8` (main) with a clean tree.
- Head commit: `55781a9b981d0be184263ffa30a0be02e2b8115b`, "HardSphereDynamicsAndKineticLimits: roadmap (README, Suggested.lean, metadata)". It touches only `TauCetiRoadmap/HardSphereDynamicsAndKineticLimits/{README.md,Suggested.lean,metadata.toml}` (1541 insertions) and nothing outside the folder.
- Build (`lake build TauCetiRoadmap.HardSphereDynamicsAndKineticLimits.Suggested`): `Build completed successfully (18239 jobs).` There are 11 warnings, all `declaration uses 'sorry'`, at lines 262, 274, 294, 301, 313, 325, 371, 393, 407, 459 and 512. There is no other warning.
- Gate: `gate HardSphereDynamicsAndKineticLimits: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (`gate --depcheck … --movable`), output in full:

      depcheck: 254 roadmaps, 2400 edges, 0 problem(s)

  It prints no UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve TauCetiRoadmap/HardSphereDynamicsAndKineticLimits/README.md` (main 76aab68, 458 open heads) finds no cross-roadmap citation and no Lean name missing anywhere. The tool cannot check library names on this host, so I checked them myself (below).

## Draft pull request body

This roadmap builds the microscopic model of classical kinetic theory and proves its foundational theorems. The model is finitely many hard spheres of diameter ε moving in a flat position space (Euclidean space or a flat torus `ℝᵈ/L`, both instances of one class carrying a local isometry and a local measure isomorphism), with the specular scattering law. The roadmap develops the two-body problem with its Jacobian, hard-sphere trajectories and their uniqueness at every initial state, and Alexander's theorem: outside a Lebesgue-null set every configuration has a global trajectory with only binary, non-grazing collisions. It packages the result as a measure-preserving, reversible flow defined almost everywhere. On that flow it builds:

- the transport of densities and the weak Liouville equation with specular reflection;
- marginals and the canonical and grand canonical ensembles, with their invariance;
- correlation functions with the Boltzmann–Grad scaling;
- the hard-sphere Boltzmann collision operator and mild solutions of the Boltzmann equation.

It states Lanford's theorem (the grand canonical form on the torus, BGSS2023 Theorem 1) as a proposition and proves its law-of-large-numbers consequence: convergence of the first two correlation functions makes the rescaled empirical measure converge in probability to the Boltzmann solution. The roadmap is general and source-independent. It covers every flat torus in every dimension, exact junk-value conventions (an everywhere-defined flow, `ℝ≥0∞`-valued partition functions that remain meaningful when infinite), and every degenerate case pinned by computed Checks. This gives later roadmaps on the BBGKY hierarchy, on fluctuations and on the Boltzmann equation a library to build on.

AI assistance: Claude (Opus 5.5) performed the port, the source, supplier and ownership checks, the mathematical self-review and the Lean signature validation.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Roadmaps this one depends on that are still pull requests

- **ClassicalErgodicTheory**, §3.5 items 1, 3 and 4: conull flows, disjoint unions with the sum measure, and transport of densities. This is another author's open pull request (draft) that adds a new roadmap folder. I read its head (`e3c5108`): §3.5 is at README line 1158 and says what the supplier contract states, on a standard Borel space with a σ-finite measure. Its `*Needs:*` do not name this roadmap, so there is no cycle. It is not in `ORDER.txt`; the dependency check reports no problem for the edge.

Every other cross-roadmap citation is to a roadmap on main. Those citations are comparisons in "Scope and ownership", not suppliers: MathematicalBilliards §10.3, §10.5, §12.3; ProbabilisticAndMetricNumberTheory §4.9a (`scalarLpKoopman_strong`); RandomMatrices §8.1; StandardDistributions Layer 5; OneParameterSemigroups (Completed); ComplexTori. I re-read each on main in this worktree and each says what the README attributes to it:

- MathematicalBilliards §10.3 and §10.5 Checks give area `4` for `2ℤ + 2iℤ`.
- MathematicalBilliards §12.3 assumes a probability space.
- ProbabilisticAndMetricNumberTheory §4.9a assumes a continuous action with a locally finite measure and `p ≠ ∞`.
- RandomMatrices §8.1 defines the `k`-point function by factorial moments on pairwise disjoint sets.
- ClassicalErgodicTheory §0.2 assumes a finite invariant measure.

No `*Needs:*` line, supplier contract or Lean import names a roadmap later in the merge order. Nothing had to be moved down.

## What moved from the Lean to the README

Nothing moved, and `Suggested.lean` is byte-identical to the package file. It already met the acceptance-test rule:

- It declares 11 headline theorems with `sorry`: uniqueness of trajectories, Alexander's theorem, the group law, measure preservation and reversibility of the flow, the weak Liouville equation, invariance of the Maxwellian grand canonical measure, the correlation identity, the Boltzmann–Grad scaling of `E[N]`, and the two laws of large numbers.
- Its definitions all have real bodies on native carriers. The five `FlatTorus` instances are proved; compactness is needed for `ProperSpace (UnitFlatTorus d)`.
- It has no padding, no sorry'd data, no `set_option` and no `lemma`.
- Its header is `module` / `import Mathlib`, as in MathematicalBilliards on main. It needs no `TauCeti.*` import.

Lanford's theorem is the `Prop` `HardSphere.LanfordStatement` (its proof is owned downstream), as the accepted review decided. I looked for a headline that is statable at the pins but missing, and kept the accepted set:

- Strong continuity of the Koopman group (§7.4) and initial chaos (§9.6) are statable. Both are intermediate results that feed §8.1 and §10.4, not end theorems, so they stay README targets.

Signature check, done mechanically: I appended `#check @name` for all 40 roadmap names to the module (31 declarations plus the 9 class fields) and elaborated it once with the build command above, then restored the file. I compared each elaborated type with its README statement:

- Every theorem carries `[NormedAddCommGroup X] [ProperSpace X] [MeasureSpace X] [BorelSpace X] [FlatPositionSpace d X]`. `boltzmannGrad_scaling` carries `1 ≤ d`, and `LanfordStatement.tendsto_empirical` carries `2 ≤ d` and the instance argument.
- `hardCoreSet` keeps only `[NormedAddCommGroup X]`. `partitionFunction`, `grandCanonicalDensity` and `grandCanonical` keep `[NormedAddCommGroup X] [MeasureSpace X]`. These are more general than a flat position space, so I changed the README (§3.1, §9.3) to state that generality. I changed nothing in the Lean.
- The signature leads in `signatures.md` ("23 look to have lost a binder") are false positives: the binders appear in the elaborated types.

## Supplier replacements and duplication removals

- **Supplier replacement (README §1.3, contracts, Summary, Scope, Layer 1 Dependencies).** The radius of a flat torus, half the least norm of a nonzero lattice vector, was argued directly ("positive because `L` is discrete"). It is now cited as half Tau Ceti's first successive minimum for the closed unit ball: `ρ = ZLattice.successiveMin L B̄ ⟨0, _⟩ / 2` for `d ≥ 1`. The characterisation comes from `ZLattice.successiveMin_zero_le_iff` and positivity from `ZLattice.successiveMin_pos`, all in `TauCeti/Algebra/Module/ZLattice/SuccessiveMinima.lean` at the pin (lines 111, 492, 424; hypotheses `[DiscreteTopology L] [IsZLattice ℝ L]`, `0 ∈ interior K`, and `0 < finrank` for index 0). The `d = 0` value `ρ = ∞` stays a clause of §1.3. The pin has no closed-ball `ConvexBody` declaration, so the README says "the closed unit ball read as a convex body".
- **Library names, checked at the pins.**
  - All 71 Mathlib names in the README elaborate under `#check @…` at Mathlib `1b1ccf4` (no error), including the auto-named instances `QuotientAddGroup.instNormedAddCommGroup`, `QuotientAddGroup.borelSpace`, `QuotientAddGroup.measurableSpace` and `Sigma.instMeasurableSpace`.
  - I read the hypotheses of `MeasureTheory.QuotientMeasureEqMeasurePreimage.haarMeasure_quotient` at `Mathlib/MeasureTheory/Measure/Haar/Quotient.lean` lines 116–118 and 210–224: Polish, Borel, normal, `T2Space` and second-countable quotient, countable `Γ`, Haar plus right-invariant `ν`, `HasFundamentalDomain Γ.op`, `IsFiniteMeasure`. They match §1.3.
  - The Tau Ceti names are present at `2fd255d` with the namespaces the README uses: `TauCeti.Probability.multivariateGaussianPDFReal` (Density.lean line 82), `…multivariateGaussian_eq_withDensity` (line 265, `S.PosDef`), `TauCeti.Semigroups.StronglyContinuousGroup` (Group/Basic.lean line 74), `TauCeti.Probability.empiricalFiniteMeasure` / `card_smul_empiricalFiniteMeasure` / `empiricalMeasureOfFintype` (EmpiricalMeasure.lean lines 58, 75, 224) and `TauCeti.flowOfLipschitz` (OfLipschitz.lean line 59).
- **Library near-matches** (`library-matches.md`). I opened every candidate. None proves a target here: the strong law `ProbabilityTheory.strong_law_ae` is the i.i.d. law of large numbers; `Flow`/`IsInvariant` are continuous flows; `isIntegralCurveOn_Ioo_eqOn_of_contMDiff` is uniqueness for smooth vector fields, which the discontinuous hard-sphere flow is not. No target dropped.
- **Duplication sweep by object.** I ran `roadmaps grep` over main and all open heads for: hard sphere, Boltzmann (equation, collision, operator), Maxwellian, grand canonical, BBGKY/Lanford, Liouville equation, kinetic, specular, flat torus/tori, quotient norm, covolume, fundamental domain, `UnitAddTorus`, and billiards outside a ball or with scatterers.
  - Hard spheres occur only in ClassicalErgodicTheory, which says the `N`-particle hard-sphere flow is outside its scope and consumes its §3.5. MathematicalBilliards (main) mentions them only in a downstream remark.
  - Boltzmann, Maxwellian, grand canonical, Lanford and BBGKY: no other owner.
  - Flat tori elsewhere are examples (GeometricTopology, QuasiregularMaps, DGFloer) or `UnitAddTorus` with its product metric (IncompressibleFlows, RelativisticQuantumFieldTheory §7.4 `T_Lⁿ`). Neither is the normed measured group `E ⧸ L` with Euclidean quotient norm in every dimension, which this roadmap owns (§1.3). MathematicalBilliards §10.5's `ℂ/Λ` is already distinguished in Scope.
  - GeometryOfNumbersAndQuadraticArithmetic (open) §4.4.1 defines a lattice packing radius with value 0 in rank 0. That is the same quantity as ρ for `d ≥ 1` but with the opposite junk value. Tau Ceti's `ZLattice.successiveMin` is at the pin and is earlier than every roadmap, so I cite the pin, not the open roadmap.
  - Nothing was removed. No declaration name of `Suggested.lean` occurs in another roadmap.
- Ownership against open pull requests was checked through the tool's index, which covers all 458 open roadmap heads. The brief's 222 sibling checkouts were not all needed.

## README fixes made as an upstream reviewer

1. **Timeless and definite scope.** Scope said Lanford's proof "is the subject of a later roadmap … whose end theorem would be", and that other topics "are subjects of later roadmaps". These now read "belongs to a roadmap on the BBGKY hierarchy … whose end theorem is" and "belong to the roadmaps listed under Downstream consumers". In the §10.4 Checks, "the hand-off of its proof" became "the roadmap on the BBGKY hierarchy that proves it".
2. **API bullets for definitions.** 18 definition sections had their API, wholly or partly, as one run-on "Prove that …; …; …" sentence (16 had no API list; §2.1 and §9.3 had one that omitted these facts). Each is now a Define sentence plus an `API:` bullet list, one fact per bullet with hypotheses and conclusion: §2.1 `scatter`, §3.5 `P`/`H`, §4.1 `τ`, §4.3 `C`, §4.5 pair map, §5.4 incoming path `Y`, §5.5 `goodSet`, §6.2 step map `Φ_δ`, §7.1 `flow`, §7.5 grand canonical phase space, §8.1 `W(t)`, §8.3 marginals, §9.1 Maxwellian, §9.2 canonical measure, §9.3 grand canonical measure, §9.5 `correlation`, §10.1 `empirical` and §10.2 `collisionOperator`. Every locator stayed with its claim. A mechanical comparison with the package README finds no backticked span and no `GST2013`/`BGSS2023`/`DengHaniMa2024`/`Alexander1976` locator lost; the 45 Checks are unchanged, and API lists went from 13 to 29.
3. **Hypotheses made explicit.**
   - §7.2 now states `measurePreserving_flow` "for `0 < ε < ρ`, every `N` and every real `t`", as the Lean does.
   - §10.1's moment identities now state their hypotheses: `0 < ε < ρ`, `μ ≥ 0`, measurable `f⁰`, bounded measurable `h`, under `grandCanonical ε μ f⁰`.
   - §9.5's API states its standing hypotheses.
4. **Scope of claims that hold for every ε.** §7.1 claimed bijectivity, preservation of `G` and `𝒟̄`, and path regularity only for `0 < ε < ρ`. They hold for every real ε: by `flow_add` and `T_0 = id`, `T_t` has inverse `T_{−t}`; `T_t` maps `G` into `G` by §5.3's time translation, valid for every ε; and it fixes `𝒟̄ ∖ G` and `𝒟̄ᶜ` pointwise. The API now says so, and measurability is kept for `0 < ε < ρ`. The Conventions list of every-ε statements now includes these and the invariance of `G` (§5.5).
5. **Generality equals the Lean.** §3.1 and §9.3 now say that `hardCoreSet`, `partitionFunction`, `grandCanonicalDensity` and `grandCanonical` use only the norm (and the measure) of `X`, as their Lean signatures do.
6. **Small completions.**
   - §9.3 vacuum bullet: also for `μ = 0` and every `f⁰` (all terms `N ≥ 1` vanish).
   - §9.1: the identification with the Gaussian law cites `multivariateGaussian_eq_withDensity` with its positive-definiteness hypothesis.
   - §10.2: each API fact names its route (cross-section formula and changes of variables of §2.2).

Nothing a reviewer would call false or vacuous was found in the statements. The adversarial pass below records the values.

## Adversarial mathematics pass

The numeric values were recomputed in a scratch script (`calc/adv.py`); Jacobians were computed by central finite differences.

| # | Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | §1.1 class axioms, `shortLift` | `E` (`π = id`, ρ = ∞); unit torus d = 2; `UnitAddTorus (Fin 2)` sup norm; ρ = 0 | torus: ‖π(1/2,1/2)‖ = 0.707107, ℓ(π(0.9,0)) = (−0.1,0) (norm 0.1 < 1/2); sup-norm torus at s = 0.1: norm 0.1 vs least lift 0.141421, lift axiom fails; ‖ξ‖ ≥ ρ forces ℓ = 0 since ‖πa‖ ≤ \|a\| | sound | none |
| 2 | §1.3 `FlatTorus`, ρ, Haar facts | `2ℤ×ℤ`; ℤ²; d = 0; ball B(0,1/2) | covolume 2, ρ = 1/2 = λ₁/2; π/16 = 0.196350 vs normalised π/32; B(0,1/2) translate density π/4 = 0.785398 < 1; d = 0: L = 0, ρ = ∞, mass 1; `haarMeasure_quotient` hypotheses read at the pin and matched | sound | ρ cited via `ZLattice.successiveMin` |
| 3 | §1.4 shell and packing | unit torus d = 2 ε = 0.4; d = 1 shell 0.4–0.6; E shell 1–1.1 | 1/(0.04π) = 7.958 ⇒ at most 7 points; shell 0.2 vs formula 0.4 (r₂ ≥ ρ); π·0.21 = 0.659734 | sound | none |
| 4 | §2.1 `scatter` | ν = (1,0), v = (0,0.9), w = (0.9,0); head-on; grazing; separate reflection | σ = ((0.9,0.9),(0,0)), energy 1.62 = 1.62; head-on exchanges; grazing fixed; separate reflection momentum (1,0) ↦ (−1,0) | sound | API bullets |
| 5 | §2.2 Θ and total cross-section `ω_{d−1}\|k\|` | d = 1, 2, 3; probability-normalised sphere | quadrature d = 2, k = (0.7,−1.3): 2.952965 = 2\|k\|; d = 3: 3.141593 = π; d = 1: \|k\|; ∫_B⟨e,x⟩₊ = ω_{d−1}/(d+1) via ½ω_{d−1}(1 − (d−1)/(d+1)); normalised value \|k\|/4; kernel 0.9 ↦ 0.9 under Θ | sound | none |
| 6 | §3.1 `hardCoreSet` | torus ε = 0.4, π(0.05,0), π(0.95,0); N = 1; circle ε = 1.5 | torus distance 0.1 (representatives 0.9); N = 1 everything; threshold 2/3 < 1 yet 𝒟̄₁ = all ⇒ `ε ≤ 2ρ` needed; ε = 1: 𝒟̄₂ = ∅ | sound | generality clause |
| 7 | §3.2 contacts, boundary pieces | torus ε = 0.3; ordered vs unordered pair | π(0.1,0) − π(0.8,0) = π(0.3,0), ν = (1,0); ⟨v₁−v₂,ν₁₂⟩ = ⟨v₂−v₁,ν₂₁⟩ = 1 | sound | none |
| 8 | §3.3 `contactScatter`, `reversal` | partner pair; ε ≤ 0; ε ≥ ρ; outgoing state | partner j gets v_j + ⟨v_i−v_j,ν⟩ν = σ_ν(v_i,v_j)₂ (ℓ(−ξ) = −ℓ(ξ)); normal 0⁻¹•ℓ = 0 resp. ε⁻¹•0 = 0, `scatter 0 = id`; σ_M((1,0),0) = (0,(1,0)), ℛ = (0,(−1,0)) outgoing (⟨·,ν⟩ = 1) | sound | none |
| 9 | §3.4 `freeFlow`, boost | torus e₁; E; boost d = 1, t = c = 1 | S₁(π0,e₁) = (π0,e₁); distance 0.5 at t = 1.5; S₁B₁(0,0) = (1,1) ≠ B₁S₁(0,0) = (0,1), A₁B₁S₁ = (1,1) | sound | none |
| 10 | §3.5 P, H | §2.1 witness; outgoing state | P = (0.9,0.9), H = 0.81 before and after; ℛ: P (1,0) ↦ (−1,0), H = ½ | sound | API bullets |
| 11 | §4.1 τ | a = (2,0); grazing (1,3); miss (2,3) | D = 1, τ = 1, q = (1,0), ⟨q,u⟩ = −1; D = 0, τ = 3; D = −3; larger root 3 | sound | API bullets |
| 12 | §4.2 B_s | oblique a = (3,0.6), u = (−1,0) | D = 0.64, τ = 2.2, q = (0.8,0.6), R_q u = (0.28,0.96); B₃ = ((3,0),(1,0)) vs naive (5,0) | sound | none |
| 13 | §4.3 det DC = 1 | 4 points of U: (2,0,−1,0), (3,0.6,−1,0), (2.5,−0.3,−0.9,0.2), (1.7,0.5,−0.4,−0.3) | det DC = 1.000000 at all four; DC rows at the first: (−1,0,0,0), (0,−1,0,−2), (0,0,−1,0), (0,2,0,3), as in the README; det DB₃ = 1.000000, det DB₅(oblique) = 1.000000; d = 1 variable time det 0 | sound | API bullets |
| 14 | §4.4 B_s measure preserving | d = 1 rectangle a ∈ (2,3), u ∈ (−1,−½), s = 4 | B₄ = (2 − a − 4u, −u), det = 1, image in a > 1 (2 − 3 + 2 = 1), area ½ | sound | none |
| 15 | §4.5 pair map | head-on P¹²₃; N = 3 rods; Jacobian of (v_i,v_j) ↦ (u,w) | ((1,0),(−2,0); 0,(−1,0)); positions 0.1, 2.1, 20; det = 2^d cancels | sound | API bullets |
| 16 | §5.1 `IsTrajectory` | head-on on ℝ; left-continuous variant; J = ∅ | 𝒯 = {1}; V(1) = ((−1,0),0) gives ⟨v₁−v₂,ν⟩ = −1 < 0, violates (5); J = ∅ vacuous | sound | none |
| 17 | `IsTrajectory.eqOn` (every ε) | J = [0,1] ∪ [2,3]; outgoing contact state; t* step | two paths agree at 0, differ at 2 (0 vs 5), (6)/(7) vacuous at 1 and 2 since the filters are ⊥ ⇒ `OrdConnected` needed; (7) gives σ_M V(t*) = σ_M V'(t*), injective | sound | none |
| 18 | §5.3 symmetries | reversed head-on; boost c = (1,0); ε ≤ 0 | time −3: ((1,0),(−2,0); 0,(1,0)), contact at −1, back to ((2,0),0;(1,0),0); boosted collision still at t = 1 (x₁ = (2,0), x₂ = (t,0)); ε ≤ 0: (5) excludes contacts | sound | none |
| 19 | §5.4 incoming path Y | head-on; J = [0,1] with outside values | Y velocities ((−1,0),0) on (−∞,1]; σ_M V(0) = 0 vs outside limit e₁; DHM datum (−1,0),0 at the outgoing contact state | sound | API bullets |
| 20 | §5.5 `goodSet` | N = 2 on E; a = (−2,1), u = (−1,0); triple contact | ⟨a,u⟩ = 2, D = 4 − 4 = 0, tangency at a − 2u = (0,1), so not in G; equilateral triangle violates (4) | sound | API bullets |
| 21 | `volume_hardCoreSet_diff_goodSet` | N = 0, 1, 2; §6.3 grazing witness | N ≤ 1: G = all; N = 2: union of the cylinder D = 0 and the contact set, null | sound | none |
| 22 | §6.1 near-triple | N = 2; shell 1 ≤ \|x\| ≤ 1+η | I = ∅; area π(2η + η²); exponent N − 2 counts x_i and the N − 3 free positions | sound | none |
| 23 | §6.2 step map | torus ε = 0.3, R = 1, δ = 0.09 vs 0.045; rods 0, 2, 20, 22 | 0.47 + 0.18 = 0.65 ≥ ½ (fails); 0.39 + 0.09 = 0.48 < ½; Φ₁ positions 0.1, 2.1, 20.1, 22.1 | sound | API bullets |
| 24 | §6.3 iteration | N = 2 grazing witness; K = {0} rods; constant | passes step 0 (graze at 2 > δ), fails step 1; C₁ = 8(12π)²(π²/2) = 576π⁴ = 56107.64; F₁ = ∅ vs I with positive measure near (−1.1, 0, 1.1) | sound | none |
| 25 | `flow`, `flow_add` (every ε) | ε = −1 rods; unit circle ε = ½; Z ∉ G | T₃Z positions (−2, 0) = T₁T₂Z; antipodal pairs have ℓ = 0 so (5) reads 0 < 0, G = ∅, T_t = id; all three maps fix Z ∉ G | sound | every-ε API bullets |
| 26 | `measurePreserving_flow` | N = 2 on E; E, d = 2, N = 2 carrier; torus N = 8 | reduces to §4.4 and centre-of-mass translation; 𝒟̄ᶜ = {\|x₁−x₂\| < 1} has infinite measure, so the carrier must contain it; 𝒟̄ = G = ∅, T_t = id | sound | hypotheses explicit in §7.2 |
| 27 | `flow_reversal` (every ε) | head-on; ε = −1, t = 2; Z ∉ G | ℛT₃Z = ((1,0),(−2,0); 0,(1,0)); both sides positions 3, 0, velocities 1, 0; ℛℛ = id so ℛZ ∉ G | sound | none |
| 28 | §7.4 Koopman group | N = d = 1 circle; torus N = 8; circle ε = ⅓, N = 3; p = ∞ | mass 1·∞; cutoff ∫ = 1·2 = 2; q₈ = 0; equally spaced triples (gaps all ⅓) give q₃ = 0; ‖U_t f − f‖_∞ = 1 on E, 0 on the circle | sound | none |
| 29 | §7.5 Λ | unit circle ε = 0.2, N = 2 | λ₂ = (1 − 0.4)·2² = 2.4, Λ = 1.2 | sound | API bullets |
| 30 | §8.1 W(t) | N = 1 on E; wrong sign | W(1)((1,0),(1,0)) = W⁰(0,(1,0)); W(s+t) = W⁰∘T_{−s}∘T_{−t} | sound | API bullets |
| 31 | `weak_liouville` | N = 0; φ = χψ(H); non-specular box; grazing Z ∉ G | w∫φ' + wφ(0) = 0; τ ∈ (0.951923, 1.052083), H ∈ (0.4802, 0.5204), left side ∫W⁰(v₁−v₂) = −1 ≠ 0 so `hspec` is needed; Lφ = 2χ' − χ, ∫ ≤ −5 vs −2 off G (null) | sound | none |
| 32 | §8.3 marginals | torus N = 2; cut-off Gaussian | first marginal g(z₁)(1 − ω_dε^d)∫g̃; e^{−1.62} = 0.197899 vs 0 at \|(0.9,0.9)\| = 1.272792 | sound | API bullets |
| 33 | §8.4 symmetric expectations | s = 2, N = 3; s > N | 6 vs 9 (all maps); descFactorial 1 2 = 0 vs truncated 1!/0! = 1 | sound | none |
| 34 | §9.1 Maxwellian | d = 1, β = 1; d = 3 integral | M(0) = 0.398942; (2π)^{3/2} = 15.749610; `multivariateGaussianPDFReal u (β⁻¹•1)` = (2π)^{−d/2}β^{d/2}exp(−β\|v−u\|²/2) | sound | API bullets |
| 35 | §9.2 canonical | Φ(H,P) formula; torus N = 8; E | Σ\|v_i−u\|² = 2H − 2⟨u,P⟩ + N\|u\|²; Z^can = 0; mass q_N = ∞ on E | sound | API bullets |
| 36 | §9.3 partition function | ε = 0, μ = 2; f⁰ = 0; μ = 0; weights without 1/N! | Z = e², P(N=1) = 2e^{−2} = 0.270671; Z = 1 vacuum (also μ = 0 since 0^N·∞ = 0); divergence for μ∫f⁰ ≥ 1 | sound | API bullets, μ = 0 vacuum |
| 37 | `grandCanonical_flow_invariant` | X = E, d = 1, μ = c = β = 1; μ = 0 or c = 0; u ≠ 0 | N = 1 term √(2π)·∞, Z = ∞, zero measure; vacuum δ_∅ fixed; density a function of H, P; r(0) = 1.5 vs r(−¼) = 1 non-example | sound | none |
| 38 | `lintegral_sum_distinct_eq_correlation` | μ = 0, n ≥ 1; n = 0; Z = ∞; Poisson ε = 0 | both 0 (no embedding into Fin 0; 0^n·x = 0); both h(∅)·mass, F₀ = Z/Z; all 0; E[N(B)(N(B)−1)] = λ² = 1 vs E[N(B)²] = 2 | sound | none |
| 39 | `correlation` inversion | Σ_{p,q}(−1)^p/(p!q!)∫W_{n+p+q}; bound | only m = 0 survives ⇒ W_n; series ≤ (μC₀)^n e^{−β₀\|V_n\|²/2} e^{2μC₀K}/Z; circle check 0.8√(2π) = 2.005303 between 1 and √(2π) = 2.506628 | sound | API bullets |
| 40 | `boltzmannGrad_scaling` | d = 3, ε = 0.01; d = 1; d = 0; Z = ∞ | ω₃ε = 0.041888; d = 1: μ = 1, E[N] = ∫f⁰p_ε ∈ [1 − 2ε‖ρ⁰‖, 1]; d = 0: E[N] = ½ < 1 − ε so `hd` is needed; ∫f⁰ = 1 forces Z ≤ e^μ < ∞ | sound | none |
| 41 | `empirical` | N = 0; N = 2, μ = 1; μ = 0 | zero measure; mass 2; π = 0 and F_n = 0, identities 0 = 0 | sound | API bullets, hypotheses explicit |
| 42 | `collisionOperator` | Q(M,M); loss term d = 3; β = 0; weak form | Q(M,M) = 0 by §9.1; loss M(0)π√(8/π) = M(0)·π·1.595769; v' = (r/2)(1,1), w' = (r/2)(1,−1), speeds r/√2, gain infinite; ¼-formula from swap and Θ (Θ preserves the kernel) | sound | API bullets |
| 43 | `IsMildBoltzmannSolution` | f = M; d = 1; wrong sign | Q ≡ 0 in d = 1 (σ_{±1}(v,w) = (w,v)); 0.5M(1) vs 1.5M(1) | sound | none |
| 44 | `LanfordStatement` | d = 0; Maxwellian datum; other structures on 𝕋^d | d = 0: Z = 2, F₁ = ½ vs f = 1 (false, as stated); M stationary; B(0.3,0) = (0,0.3), B⁻¹(±e₁/2) collide at radius 0.6 | sound | wording of a Check |
| 45 | `tendsto_empirical_of_correlation` | f⁰ = 0; d = 1 circle; F₂ → 2f⊗f | vacuum, f = 0 a.e., event empty; P(N ≠ 1) → 1 − e^{−1} = 0.632121; variance → m² | sound | none |
| 46 | `LanfordStatement.tendsto_empirical` | d = 2; M datum, C₀ = 1 ≥ 1/(2π) = 0.159155 | μ_ε = 1/ε → ∞; f(t) integrable on the mass-1 torus; hypotheses of the first theorem from n = 1, 2 | sound | none |
| 47 | Conventions witnesses | contact, normal, scattering, transport, Maxwellian, sphere mass, μ_ε | (1,0)/1; v' = 0, w' = (−1,0); W⁰(0,(1,0)); 0.398942; 4π, 2π; μ = 100 at d = 3, ε = 0.1; Lean `ε⁻¹^0 = 1` vs ε at d = 0 | sound | every-ε list extended |

Context check (point 2 of the pass): every theorem that needs `0 < ε < ρ` has `hε` and `hερ` in its own signature. `flow_add`, `flow_reversal` and `IsTrajectory.eqOn` have none, and the README says they hold for every ε (rows 17, 25, 27). The binders were confirmed by the `#check @` run above.

## Unresolved

- ClassicalErgodicTheory §3.5 is a supplier still in an open (draft) pull request by another author and is not in `ORDER.txt`. The merge-order paragraph should name it.
- `roadmaps resolve` reports main at 76aab68 while this worktree's `origin/main` is `2b655a8`. All on-main citations were read at `2b655a8`, and the tool found none missing at 76aab68.
- No suspicious instructions were found in any data I read.


Pull request: #2448 (roadmap/hard-sphere-dynamics-and-kinetic-limits at 55781a9)
