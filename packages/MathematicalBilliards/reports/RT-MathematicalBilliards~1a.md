<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13476#issuecomment-6796364288 -->
Red team round 1 pass a (codex) of e5e370d

Verdict: needs_changes

1. **F01** (P2) The measurable-action strong-continuity theorem is missing from the acceptance test

   **Location:** packages/MathematicalBilliards/README.md:886, “the new assertion is strong continuity under joint measurability”; packages/MathematicalBilliards/Suggested.lean:24–43.

   **Claim:** §12.3 owns the strong continuity theorem on arbitrary probability spaces, a substantive result needed to apply the spectral headline to billiard flows. Suggested.lean neither states it nor identifies it as unavailable.

   **Witness:** Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:595 already defines the required pullback on native `Lp`; Mathlib/MeasureTheory/Group/Action.lean:178 supplies measure preservation (`to_additive`). All statement carriers exist, with no topology on `X` needed.

   **Exact repair text:** Add the following headline under Layer 12, add its name to README:92 and §12.3, and list it in the module docstring:

   ```lean
   /-- For a jointly measurable measure-preserving real action on a probability
   space, each orbit of the pullback action on complex L² is continuous. -/
   theorem continuous_compMeasurePreserving_vadd
       {X : Type*} [MeasurableSpace X] [AddAction ℝ X]
       [MeasurableVAdd₂ ℝ X] (μ : Measure X)
       [IsProbabilityMeasure μ] [VAddInvariantMeasure ℝ X μ]
       (f : Lp ℂ 2 μ) :
       Continuous (fun t : ℝ =>
         Lp.compMeasurePreserving (fun x : X => t +ᵥ x)
           (MeasureTheory.measurePreserving_vadd t μ) f) := by
     sorry
   ```

   **Repair test:** For the circle character `e₁`, the orbit is `exp(2πit)e₁`, and its distance from `e₁` is `2|sin(πt)| → 0`. For the identity action this distance is `0`. The counting-measure counterexample of README:892 has distance `√2` for every nonzero time and is excluded by `IsProbabilityMeasure`. This is a source-checked signature proposal, not a newly elaborated file.

2. **F02** (P2) Rebuilding the translation groupoid duplicates the pinned action groupoid

   **Location:** packages/MathematicalBilliards/README.md:708–712, “This groupoid construction and the equivalence are made here from the derivative-one condition”.

   **Claim:** The roadmap owns a new pregroupoid/groupoid construction and its restriction, composition, inverse, locality and smoothness theory.

   **Witness:** TauCeti/Geometry/Manifold/SMulGroupoid.lean:99–124, 154–158, 198–201 and 216–227 already construct the locally acting groupoid, its restriction instance and smoothness comparison. Specialize to translations by `Multiplicative ℂ`, using Mathlib/Algebra/Group/Action/TypeTags.lean:36–53.

   **Exact repair text:** Replace §10.1's construction paragraph and the repeated structural-law target with: “Use `TauCeti.smulGroupoid (Multiplicative ℂ) ℂ` for the action `g • z = g.toAdd + z`. Consume its groupoid laws, restriction instance, membership criterion `TauCeti.mem_smulGroupoid_iff`, and smoothness comparison `TauCeti.smulGroupoid_le_contMDiffGroupoid`. Prove the translation-specific characterization: an open partial homeomorphism belongs exactly when its complex derivative is one at every source point, equivalently when it is a translation on each connected component.” Add these declarations and their file to the Tau Ceti supplier contract; change the ownership sentence to own this characterization and the cone-surface theory, not the already constructed groupoid.

   **Repair test:** Translation by `3i` is the action of `Multiplicative.ofAdd (3i)`, hence is a member. The disconnected example in README:718 chooses local acting elements `0` and `1`. The maps `2z`, `−z` and `conj z` fail local equality to a translation (their differences from `z` are nonconstant). The existing groupoid has exactly the intended objects, including the disconnected-source example; only the derivative characterization is new.

3. **F03** (P2) The unfolding target omits direction classes with a stabilizer

   **Location:** packages/MathematicalBilliards/README.md:837–842, “for `θ ∈ Circle` with trivial stabiliser in `G`”.

   **Claim:** The summary promises the unfolding theory for a fixed direction class, but the only unfolding theorem discards all exceptional directions. The square's horizontal direction is left as a failed Check, although its correct quotient construction is available. This is a generality gap, not a counterexample to the explicitly restricted theorem.

   **Witness:** For the square, `G={±id,±conj}` and `θ=1`, the stabilizer has order two. Interior direction `+1` has two preimages `[id,x]`, `[conj,x]`; the present target supplies no conjugacy for this direction class.

   **Exact repair text:** Add to §11.4: “For every `θ`, put `Kθ = {g ∈ G : gθ = θ}`. On the complement `Sθᵣ` of the marked singular leaves, left relabelling by `Kθ` commutes with the directional flow. The map `[h,x] ↦ [(x,h⁻¹θ)]` induces a measurable flow conjugacy `Sθᵣ/Kθ ≃ Mθ ∖ Σ`. Push normalized area through this quotient; its image is the probability measure `(card(G·θ) area(P))⁻¹ Σ_{v ∈ G·θ} Leb_P ⊗ δ_v` on the phase quotient. When `Kθ` is trivial this is the stated bijection with the unfolded surface.” Retain the trivial-stabilizer formula as the special case, add the quotient target to the summary and module-docstring list of unavailable polygonal headlines, and extend §12.6's torus direction-class statement using this quotient.

   **Repair test:** For the horizontal square flow, `card(G·1)=2`, normalized unfolded area has mass one, and the two sheets per interior state each contribute one quarter of Lebesgue area, giving one half per direction. Quotienting identifies precisely the two labels above. The position returns after time two, as in §8.2. For `θ=exp(iπ/6)`, `Kθ={1}` and the four-direction measure and existing conjugacy are recovered. The map is deliberately stated off the singular leaves: at vertices the phase quotient retains direction labels that the surface gluing identifies.

4. **F04** (P3) The least-period Check permits the zero iterate

   **Location:** packages/MathematicalBilliards/README.md:511, “if `F^m(x₀) = x₀ + (jℓ, 0)` with `m < q`, then `m | q`”.

   **Claim:** The displayed return equation and `m<q` imply the divisibility used in the least-period argument.

   **Witness:** On a unit-circle diameter orbit take `p=1`, `q=2`, `m=0`, `j=0`. Then `F⁰(x₀)=x₀`, `0<2`, but `0` does not divide `2`; totalized `(q/m)j` is zero, not `p=1`.

   **Exact repair text:** Replace the Check with: “Let `m` be the least positive period of `x₀` on `A`, and write `F^m(x₀)=x₀+(jℓ,0)`. Then `m>0`, `m` divides `q`, and `(q/m)j=p`. Since `p` and `q` are coprime, `m=q`. For the diameter orbit, `m=q=2`; the zero iterate is not a positive return.”

   **Repair test:** The diameter gives `2|2` and `(2/2)·1=1`; the previously admitted pair `m=j=0` is excluded. Choosing the least positive return also supplies the actual reason for divisibility.

## Verified sound

Coverage: all 966 README lines and 295 Suggested.lean lines were read. The declaration audit covers 16 named declarations (nine definitions/structures and seven theorems), plus the proved circle example. The mathematical audit covered 135 target/API assertions and all 15 bold conventions, including the assertions collected by the bold Summary. All 182 individual Checks in 52 Check blocks were evaluated; the defective zero-iterate Check is R04. Every definition has at least three associated Checks. Source verification covers 29 locator groups across four accessible works; repeated citations of one passage count once. Nine distinct cross-roadmap section IDs were resolved: six supplying seven contracts, and three ownership comparisons. No loss of a section binder was found in the 16 supplied elaborated types.

These are computed tests and proof-route checks, not formal proofs of the admitted theorems. “Pass” in the tables means that the stated instance agrees with the assertion; it does not upgrade an unread source locator to certified status. The four findings above are the exceptions to the otherwise sound tested statements.

The seven acceptance theorems present are measure preservation, the general graph theorem, the billiard Lipschitz graph theorem, two periodic orbits, Wiener’s formula, continuous-time twisted projection with atomic mass, and the eigenfunction criterion. All are substantive; none follows by a one-tactic probe from the cited definitions or pinned declarations. The circle example tests a nontrivial defining inequality and has an actual proof. The polygonal flow, its reversibility and rational non-ergodicity, unfolding, and unfolded genus are explicitly listed in the module docstring as unavailable constructions. The additional statable strong-continuity headline is R01. The trivial-stabilizer restriction is R03.

All names in this audit are in namespace `TauCetiRoadmap.MathematicalBilliards`. There are no enclosing `variable` or `include` blocks silently strengthening these signatures. In the following table, T-context means `{k : ℕ∞} {ℓ : ℝ} [Fact (0 < ℓ)] (T : ConvexTable k ℓ)`; the structure itself supplies `1 ≤ k`. The arbitrary types below have an arbitrary universe, not just `Type 0`.

| Suggested.lean declaration and layer | Full relevant variable/instance context | Computed instances and values | Result/change |
|---|---|---|---|
| :59 `ConvexTable`, 1 | `k : ℕ∞`, `ℓ : ℝ`, `[Fact (0 < ℓ)]`; fields real-body curve, `1≤k`, `ContDiff`, period, unit derivative, strict left inequality | Unit circle: norm derivative 1, cross product at antipodes 2; clockwise −2; flat segment 0; `k=0` contradicts `1≤k`; `ℓ=0` excluded | Pass; retain |
| :127 `ConvexTable.billiardLift`, 2 | T-context; `p : ℝ × ℝ`; no `k≥2` required | Circle `(s,π/3)` gives `(s+2π/3,π/3)`; at `δ=π`, infimum is 0, so it is not the closed extension `s+2π` | Pass; off-strip junk intentionally irrelevant |
| :137 `ConvexTable.billiardMap`, 2 | T-context; `x : AddCircle ℓ × ℝ`; native `equivIco` representative | On unit circle representatives `s` and `s+2π` give quotient first coordinate `[s+2π/3]`; at `s=0,δ=π/2` output `([π],π/2)` | Pass; retain |
| :147 `phaseMeasure`, 3 | `(ℓ : ℝ) [Fact (0 < ℓ)]`; product Haar/density measure on `AddCircle ℓ × ℝ` | Whole space `2ℓ`; upper half-angle interval `ℓ`; off `0<δ<π` mass 0; for `ℓ=2π` total `4π`, not 1 | Pass; retain |
| :154 `ConvexTable.measurePreserving_billiardMap`, 3 | T-context plus `hk : 2 ≤ k`; full measurability and equality of measures, not merely AE mapping | Circle determinant 1 and unchanged angle; ellipse test density `(5/√146)(√73/5)=1/√2`; off-strip domain mass 0 | Pass; retain |
| :165 `IsTwistLift`, 4 | `ℓ : ℝ`, `{a b : ℝ}`, strip homeomorphism F; definition does not require positivity/nondegeneracy | Shear `F(x,y)=(x+y,y)` gives strict difference `y₂−y₁>0`; constant rotation gives 0; empty strip makes universal laws vacuous | Pass; theorem :193 explicitly excludes empty/reversed strip and zero period |
| :174 `nonwanderingSet`, 4 | `{X : Type u} [TopologicalSpace X] (f : X → X)`; no continuity assumed in definition | Identity: n=1 return; translation by 1 on ℝ: `U=(−1/4,1/4)` has zero intersections with every positive iterate; empty X gives ∅ | Pass; retain |
| :182 `IsRotationalInvariantCurve`, 5 | `{ℓ : ℝ} {Y : Type u} [TopologicalSpace Y]`; f and C on `AddCircle ℓ × Y`; invariant continuous injective Circle image, not nullhomotopic | Horizontal circle degree 1, empty set cannot be the image, small contractible circle degree 0; disjoint two circles are not one injective Circle image | Pass; arbitrary Y is restricted to the intended real interval in applications |
| :193 `isGraph_of_isRotationalInvariantCurve`, 5 | `hℓ:0<ℓ`, `hab:a<b`, closed-annulus H and strip F homeomorphisms, quotient-lift equation, twist F or inverse, all interior points nonwandering, C interior and rotational invariant | Shear on `[0,1]`, C at 1/2: ψ=1/2, graph equality; folded quarter-rotation curve has `dx/dt=1−0.8π<0` but lacks twist; boundary C excluded | Pass; retain |
| :209 `ConvexTable.exists_lipschitzWith_of_isRotationalInvariantCurve`, 5 | T-context, `2≤k`, `C⊆univ×Ioo 0 π`, invariant essential curve; conclusion NNReal K and real ψ | Circular invariant curve ψ=π/3 has K=0; `0≤1/(2R)` in slope bound; circle at angle 0 fails containment | Pass; retain |
| :223 `ConvexTable.IsPeriodicConfiguration`, 6 | T-context; `p q : ℕ`, `s : ℤ → ℝ`; positive q, typed period equation, strict gaps, unit-chord reflection law | Equilateral tangential equality `1/2=1/2`; non-equilateral `0≠1/√2`; collapsed unit chords all 0 satisfy reflection but fail gaps; q=0 rejected | Pass; retain |
| :235 `ConvexTable.exists_two_periodic_orbits`, 6 | T-context; `p q : ℕ`, `0<p`, `p<q`, `p.Coprime q`; existential sequences, all integer index/deck shifts excluded | Ellipse major/minor diameter perimeters 8 and 4, both `(1,2)` and not Γ-related; circle offsets 0 and π/2 give distinct diameters; p=0,q=1 or p=q excluded | Pass; retain; README least-period Check needs R04 |
| :247 `IsWeaklyMixing`, 12 | `{X : Type u} [MeasurableSpace X] [AddAction ℝ X] μ`; raw predicate, no probability/invariance built in | One-point probability residual 0; fair two-point identity residual 1/4; circle half-set absolute average 1/8; zero measure predicate true | Pass; theorem :287 carries the probability/action hypotheses |
| :257 `tendsto_average_norm_charFun_sq`, 12 | `(σ : Measure ℝ) [IsFiniteMeasure σ]`; native Borel ℝ, real singleton masses and uncountable tsum | σ=0 gives 0=0; δ₀ gives 1=1; `(δ₀+δ₁)/2` gives `1/2=1/4+1/4`; atomless interval gives 0=0; T=0 junk does not affect atTop | Pass; retain |
| :268 `exists_tendsto_twistedAverage`, 12 | `{H : Type u} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]`, native U, `hU:U.IsUnitary`, a,v; spectral measure universally quantified with finite/characteristic-function hypotheses | Circle unit mode: a=0 projection 0, a=1 projection e₁; masses of δ₂π at 0 and 2π are 0 and 1; identity group mass `‖v‖²` at 0; zero H gives w=0 | Pass; negative twist and `2πa` both correct; no separability assumption needed |
| :287 `isWeaklyMixing_iff`, 12 | `{X : Type u} [MeasurableSpace X] [AddAction ℝ X] [MeasurableVAdd₂ ℝ X] μ [IsProbabilityMeasure μ] [VAddInvariantMeasure ℝ X μ]`; measurable f, a, AE equation separately for every t | One point: all functions constant, f=0 allowed at any a; two-point identity has nonconstant eigenfunction a=0 and residual1/4; circle e₁ has a=1 and average1/8 | Pass in both directions; finite-valued measurable eigenfunctions need not initially be L² because modulus/truncation handles that |
| :77 proved circle example, 1 | `[Fact (0 < 2 * π)]`; constructs `ConvexTable ⊤ (2π)` | Strict quantity `1−cos(t−s)>0` exactly off integer periods; clockwise value `cos(t−s)−1<0` | Nontrivial definition test; retain |

The semigroup carrier is real-linear, but `IsUnitary.map_smul` makes each operator complex-linear; the completeness binder is explicitly present in :268. The source’s discrete mean-ergodic theorem is insufficient: time-one circle rotation fixes e₁, whereas the continuous untwisted average over `[0,N]` is zero for positive integer N. No finite-characteristic or zero-ring instantiation exists for these fixed ℝ/ℂ carriers. The relevant degeneracies are empty domains, zero periods, collapsed chords, zero measures/vectors, trivial actions, marked regular points, and nontrivial finite stabilizers; their values appear in the tables. A compact connected space is read using native `ConnectedSpace`, which includes nonemptiness (`Mathlib/Topology/Connected/Basic.lean:705`), so the empty-space “torus” is excluded.

Supplier and ownership checks:

| Citation/owner | Current file and locator | Hypothesis/convention comparison |
|---|---|---|
| SymplecticGeometry/CotangentLagrangian C3.1 | `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/README.md:527`; `Suggested.lean:246` | Smooth strictly convex unit-speed periodic curve, positive period; no positive-curvature requirement. At δ=π/3, `v=1/2`, both maps advance `2πR/3`. Recurrence paragraph uses finite measure/full support. |
| SymplecticGeometry/IntegrableSystems I5.0 | `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/README.md:426` | `y=−∂₁S`, `Y=∂₂S`; circle derivatives of L are `−1/2,+1/2`, so S=−L in the roadmap’s y=−cosδ coordinate. |
| SymplecticGeometry/IntegrableSystems I5.4 | Same README:644 | Compact-pair Čech continuity and compact-metric Lyapunov cup-length bound are present. Circle retract has cup-length1, hence two rest points; no smooth closed-annulus Poincaré–Birkhoff theorem is invoked. |
| RiemannianGeometry/Surfaces §3.1 | `TauCetiRoadmap/RiemannianGeometry/Surfaces/README.md:471`; `Suggested.lean:130` | Piecewise C² Jordan turning theorem includes the smooth no-corner case. Unit circle integral2π, reversed−2π. |
| GeometricTopology §1.7 | `TauCetiRoadmap/GeometricTopology/README.md:1049` | Compact orientable surface genus from Euler characteristic. Unfolded square χ0→g1, hole example χ−8→g5. |
| GeometricTopology §2.3 | Same README:1386 | Dimension-two annulus theorem is included. Nested circles of radii1,2 bound an annulus; neither boundary meets the other. |
| FactorRigidity §8.2 (ownership comparison) | `TauCetiRoadmap/FactorRigidity/README.md:746` | Discrete trace-preserving actions, not the continuous-time averaged probability-flow predicate here. No duplicate ownership claim. |
| ProbabilisticAndMetricNumberTheory §4.6 (open head) | `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md:5507` | Single-map strong mixing, not the real-action weak-mixing criterion. Fair two-point identity residual1/4 fails both, but the definitions’ time domains differ. |
| ProbabilisticAndMetricNumberTheory §4.9a (open head) | Same README:6355 | Native Lp representation packaging and continuous-action strong continuity are present. Its inverse-action convention sends `[0,1]` to `[1,2]` at t=1; this roadmap’s positive pullback sends it to `[−1,0]`. This is a declared convention, consistent for an abelian ℝ action. Joint-measurable continuity without topology on X remains new. |

C3.1 supplies two contracts (billiards and recurrence) under one section ID. The supplier table therefore resolves nine distinct section IDs, seven consumed contracts, and three ownership comparisons.

Object searches used the roadmap tool against main/open heads, the active and completed main roadmaps, the board packages, and all existing directories in the supplied 152-entry head list. Four listed directories were absent (see limitations). No duplicate fully qualified Lean name was found. Relevant nearby ownership was inspected: `TauCetiRoadmap/TeichmullerGeometry/README.md:1` concerns Teichmüller/moduli theory; `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md:13` and :415 own only Nelson’s particular completed translation surface. `packages/HardSphereDynamicsAndKineticLimits/design/README.md:7`, §1.3 and §7.4 own Euclidean quotient metric/measure data and the specific hard-sphere Koopman group, not classification of all regular compact translation surfaces or arbitrary jointly measurable probability actions. The main discrete mean-ergodic/Koopman uses do not supply the real-time projection theorem. No forbidden roadmap is proposed as a supplier. The generic action-groupoid overlap at the pins is R02; the derivative-one characterization, cone surfaces, billiard unfolding and continuous-time measurable-action theory remain this roadmap’s work.

Pinned objects were checked at Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. In particular:

| Pinned contract | Declaration/file evidence and discriminating condition |
|---|---|
| Circle lifts | `Mathlib/Dynamics/Circle/RotationNumber/TranslationNumber.lean:129`, :638, :643, :685, :695, :704–718, :820. The carrier includes monotonicity/period one, not continuity; rational periodic-point equivalence separately requires continuity and positive denominator. |
| Haar/quotient conventions | `Mathlib/MeasureTheory/Integral/IntervalIntegral/Periodic.lean:69`, :91. Total mass is `ENNReal.ofReal ℓ`; fundamental domain is Ioc for measure preservation, whereas `equivIco` is the chosen representative. Endpoints have zero mass. |
| Measure preservation | `Mathlib/Dynamics/Ergodic/MeasurePreserving.lean:44` includes actual measurability; full total-map measurability is stronger than equality modulo μ. The exterior billiard formula is built from periodic Borel data, not unspecified arbitrary values. |
| Implicit function | `Mathlib/Analysis/Calculus/ImplicitContDiff.lean:83`, :92, in namespace `ContDiffAt`: both named declarations exist with differentiability and invertible-partial data. No positive curvature is needed for the interior exit equation: its normal derivative has sine factor nonzero on the open phase strip. |
| Jordan/polygon objects | `TauCeti/Geometry/Polygon/Simple.lean:109`, :614, :767; `TauCeti/Topology/JordanCurve/Basic.lean:107`, :282. Bare polygon simplicity is not a nonzero-vertex assumption; `SimplePolygon` bundles `NeZero`. Collinear consecutive edges are allowed, giving angleπ. |
| Separation inputs | `TauCeti/Analysis/Complex/PlaneSeparation/Inside.lean:190`, `JordanCurve.lean:175`; `TauCeti/Analysis/Complex/Conformal/Jordan/Schoenflies.lean:122`; `TauCeti/Analysis/Complex/Conformal/PrimeEnd/Crosscut/TwoSides.lean:137`. These supply the plane separation/crosscut inputs, not the twist graph theorem itself. |
| Lp pullback | `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:595`, :606, :611, :615, :631. Norm, AE representative and composition laws are already supplied. Strong continuity under the new measurability hypotheses is not one of these laws. |
| Unitary groups | `TauCeti/Analysis/Semigroups/Group/Basic.lean:74`; `Unitary.lean:107`, :154. The real-linear group and complex-unitary condition are correctly combined. |
| Spectral transform | `Mathlib/MeasureTheory/Measure/CharacteristicFunction/Basic.lean:130`, :134; `TauCeti/Analysis/Bochner/CharFun/Bochner.lean:101`. Transform sign is positive; the circle atom is at +2π. |
| Euler characteristic | `TauCeti/AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean:123`; `MayerVietoris.lean:93`. Additivity requires finite-CW-type hypotheses and open gluing sets; §11 constructs the finite polygonal cell model and thickens along edges. |
| Groupoid | `TauCeti/Geometry/Manifold/SMulGroupoid.lean:99`, :123, :154, :198, :216. The locally-acting groupoid supplies the structural-law block claimed new in §10.1: R02. |

The dependency command completed with this output:

```text
depcheck: 229 roadmaps, 2056 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The layer order follows the inputs of the targets: the finite-regularity branch, polygonal/cone branch, and real-action spectral branch meet only at their stated applications. No declared supplier gap exists. The diff against origin/main contains ten changed paths, all under `packages/MathematicalBilliards/`. The Lean file has one `import Mathlib`, one existing used Tau Ceti module, no `set_option`, no admitted data, no admitted examples, no theorem spelled `lemma`, no free empty predicate standing for an unavailable construction, and no computational algorithm. The six unresolved-name tool leads are own names resolved by the declared namespace, not missing suppliers. The supplied overlap check reports no shared edits or dropped IDs. The last repair report has no finding marked not actionable that this report re-raises.

Accessible source locator groups (all source text was read from the legal cached extraction; source images were inspected where OCR/extraction was ambiguous):

| Source | Locator groups verified | Scope of verification |
|---|---|---|
| BialyMironov2022 | line96–98; line103–109; line116–119; line149–164; line172–185; line261–263 (6) | Graph theorem context, circular foliation/rotation, canonical coordinates, positive-curvature map/Jacobian, generating functions, Lipschitz passage. The roadmap identifies its finite-regularity/zero-curvature extensions as new. |
| ChaikaForni2026 | line9–28; line83–88; line89–98; line99–100; line168–176 (5) | Weak-mixing headlines, flow eigenvalues, product-flow criterion, rational-direction contrast, integrated translation charts. Deep almost-everywhere weak-mixing results remain downstream. |
| Herman1983 | line149–155; line188–251; line277–284; line285–286; line287–319; line425–432; line434–438; line762–769; line803–807; line1128–1154; line1159–1287 (11) | Twist conventions, graph/Lipschitz assertions, invariant regions, rotation comparisons, nonwandering and Fathi argument. The two inverse images in Appendix Lemma11 are the source misprint listed below. |
| Hochman2012 | line2439; line2474–2487; line2627–2628; line2854–2855; line3076–3096; line3099–3140; line3141–3143 (7) | Discrete ergodicity/weak mixing, spectral criterion and discrete twisted averages/Wiener analogue; real-time formulas are explicitly developed by this roadmap, not attributed verbatim to the discrete source. |

Also read Hochman2012 line3023–3074 for the preceding spectral representation proof. On Haar measure on the circle, the Laurent character z⁻¹ is orthogonal to every zⁿ, n≥0, and has norm1, so nonnegative powers alone are not dense. For Herman’s regions, Lemma10 gives H(cl D)⊂D and H⁻¹(cl G)⊂G; hence D\H⁻¹(cl D) and G\H(cl G) are empty, whereas the intended wandering strips use the opposite inverses. These source defects are not counted as package defects because the package does not reproduce the erroneous steps.

Selected adversarial computations follow; locations are in `packages/MathematicalBilliards/README.md`. The exhaustive per-target and per-Check ledgers are omitted from this comment. Coverage counts above describe the completed audit, not just these retained samples.

| README line / section / statement | Instances and computed values | Result / change |
|---|---|---|
| :19 / §Conventions / Plane orientation | conj(1)i=i, imaginary part 1; reversing arguments gives −1. | Pass on these instances; retain |
| :23 / §Conventions / Totalization | δ=π gives empty infimum=0, whereas the extended lift has first coordinate s+ℓ; at s=1 these differ. | Pass on these instances; retain |
| :24 / §Conventions / Twist coordinate signs | Circle: ds₁/dδ=2R; ds₁/dy=2R/sinδ; ds₁/dv=−2R/sinδ. | Pass on these instances; retain |
| :25 / §Conventions / Measure normalization | ∫₀^π sinδ=2; ∫₀^(π/2) sinδ=1; masses 2ℓ and ℓ. | Pass on these instances; retain |
| :26 / §Conventions / Generating signs | δ=π/3: ∂₁L=−1/2=y; ∂₂L=1/2=−Y; generator −L gives y=−∂₁(−L). | Pass on these instances; retain |
| :32 / §Conventions / Hilbert/spectral conventions | One point: inner(1,i)−i=0; circle unit mode at t=1/4 has correlation i and frequency 2π. | Pass on these instances; retain |
| :33 / §Conventions / Absolute weak-mixing residual | Half-circle overlap \|1/2−t\| has mean 1/4; absolute centered mean=1/8, signed mean=0. | Pass on these instances; retain |
| :98 / §1.1 / ConvexTable carrier | Circle cross product 1−cos(t−s)>0 off 2πℤ; clockwise negative; stadium segment gives 0; k=0 impossible since 1≤k. | Pass on these instances; retain |
| :217 / §2.4 / Time reversal | Circle IFI(s,δ)=(s+2π−2δ,δ)=τ₂πF⁻¹(s,δ); deleting τ changes first coordinate by 2π. | Pass on these instances; retain |
| :267 / §3.2 / Exactness and Jacobian | Circle determinant=1; ellipse at δ=π/4 has exit (6/5,4/5), sinδ₁=5/√146, determinant √73/5, giving sinδ₁·det=1/√2. | Pass on these instances; retain |
| :312 / §4.1 / Deck translations and composition | A standard-map derivative for its square is ∂y(F²)₁=2+2πεcos(2πX); ε=1,X=1/2 gives 2−2π<0. A deck shift adds an integer, changing no fibre derivative. | Pass on these instances; retain |
| :332 / §4.2 / Area does not imply exactness | Shift c=1: determinant 1, integral of F*λ−λ around y=0,x∈[0,1] equals 1≠0. | Pass on these instances; retain |
| :401 / §5.2 / Birkhoff–Fathi region theorem | Shear on [0,2), U=[0,1): frontier height 1; full U=[0,2) has empty frontier but is not relatively compact; oscillating curve has dx/dt=1−0.8π<0 and fails twist. | Pass on these instances; retain |
| :430 / §5.4 / Irrational strict comparison | α=√2/2, ε=.1,q=7,p=5: 0<p−qα≈.0503<.1 and ρ(g₂)≥5/7>α; rational fixed-point lifts both have ρ=0 despite pointwise strict order. | Pass on these instances; retain |
| :494 / §6.2 / Periodic-configuration predicate | Circle equilateral law 1/2=1/2; (0,π/2,π) gives 0≠1/√2; collapsed normalization gives 0=0 but strict gaps fail; q=0 excluded explicitly. | Pass on these instances; retain |
| :527 / §6.4 / Second orbit and inward field | Ellipse (2cosu,sinu): major/minor axes give W=8,4 and different Γ-orbits. Collapsed (1,3) equal-gap deformation derivative=4ℓ/3>0; q=2,p=1 gives derivative ℓ>0. | Pass on these instances; retain |
| :548 / §7.1 / Polygonal-table carrier | Square has one Jordan boundary and connected interior; square-with-hole has two boundaries and area 8; corner-touching squares have disconnected interior and fail. | Pass on these instances; retain |
| :779 / §10.5 / Flat torus classification | Λ=ℤ+iℤ gives quotient area1 and stabilizer Λ; Λ={0} gives ℂ noncompact; rank-one Λ gives noncompact cylinder, excluding both alternatives. | Pass on these instances; retain |
| :827 / §11.3 / Euler/genus formulas | Square χ=4+4−8=0,g=1; π/8 triangle16+6−24=−2,g=2; L-table4+6−12=−2; square hole0+8−16=−8,g=5. | Pass on these instances; retain |
| :837 / §11.4 / Unfolding conjugacy | Generic square θ=exp(iπ/6): g⁻¹(gθ)=θ, four sheets/directions, area4. θ=1 gives two directions/four sheets and is excluded; R03 supplies the quotient by its order-two stabilizer. | R03: add stabilizer quotient |
| :886 / §12.3 / Koopman continuity | Circle e₁ orbit distance2\|sinπt\|→0; identity orbit distance0; counting-measure ℝ distance√2 at every t≠0, excluded. R01: missing Lean headline. | R01: add headline signature |
| :896 / §12.4 / Wiener formula | σ=0:0=0; δ₀:1=1; (δ₀+δ₁)/2:limit1/2=1/4+1/4; uniform[0,1]:limit0=sum atoms0. | Pass on these instances; retain |
| :906 / §12.4.1 / Twisted continuous mean ergodic theorem | Circle e₁: a=0 gives A_N=0 for N≥1, projection0; a=1 gives A_T=e₁ for T>0, projection norm1. Zero Hilbert space: w=0 and all conditions0. | Pass on these instances; retain |
| :908 / §12.4.1 / Spectral atomic mass | Circle e₁ has σ=δ₂π: projected squared norms0,1 at a=0,1 equal masses0,1. Identity group v gives σ=norm(v)²δ₀ and mass norm(v)² at a=0. | Pass on these instances; retain |
| :918 / §12.5 / Eigenfunction criterion | One-point: f=0 meets equation for every a but is constant; nonzero constants only a=0. Trivial two-point action has nonconstant a=0 eigenfunction and residual1/4. Circle e₁ has a=1 and fails weak mixing. | Pass on these instances; retain |

Selected Check computations:

| README Check / section | Computed values | Result / change |
|---|---|---|
| :112 / §1.1 | Near (1,0), x=(1−y⁴)^(1/4)=1−y⁴/4+O(y⁸), so curvature=0 there; no boundary segment. | Pass on stated instance |
| :125 / §1.2 | Speed=\|2e^(iu)+1\|≥1; signed numerator9+6cosu∈[3,15]; tangent winding2 gives4π. | Pass on stated instance |
| :212 / §2.3 | Flat superellipse: normal displacement order t⁴, chord angle order t³; t has order δ^(1/3), not differentiable at0. | Pass on stated instance |
| :273 / §3.2 | Exit tangent(−8,3)/√73 and incoming(−1,1)/√2 give cosδ₁=11/√146, sinδ₁=5/√146; determinant√73/5 versus reciprocal5/√73. | Pass on stated instance |
| :336 / §4.2 | At(x,X)=(1,2): h=1/2, −h_x=h_X=1; wrongly using S∘Q gives−3,3. | Pass on stated instance |
| :441 / §5.4 | Derivatives≥1−π/10>0; first lift fixed where sin2πx=.4, second at0; both translation numbers0. | Pass on stated instance |
| :509 / §6.2 | Collapsed chords0 and total inverse norm0 give u=0; law0=0, but gaps0,0,ℓ violate strict bounds. | Pass on stated instance |
| :510 / §6.2 | q=p=0 makes s_(j+q)=s_j tautological; irrational gapπ√2 gives angleπ/√2 and rotation1/√2; q>0 excludes it. | Pass on stated instance |
| :511 / §6.2 | Counterexample m=j=0 on p=1,q=2 orbit: return equation true, 0<2 true, 0 divides2 false. R04. | False: R04 |
| :562 / §7.1 | Insert a collinear vertex in a square side: n=5, new angleπ; angle sum3π=(5−2)π. | Pass on stated instance |
| :600 / §7.3 | Travel distance from(ε,ε) to0 is√2ε; no side hit before vertex, reflection count0; avoiding-vertex hypothesis false. | Pass on stated instance |
| :620 / §8.1 | Slope(n−1/4)/(n−1/2)→1; each ray points at lattice(n,n), limit line difference−1/4 avoids all lattice points. | Pass on stated instance |
| :646 / §8.3 | Square with initial direction1: at t=1/2, positive-area positions with x>1/2 have velocity−1, initially assigned mass0 by δ₁. | Pass on stated instance |
| :684 / §9.2 | Horizontal outer and θ-rotated inner sides give rotation2θ; θ/π irrational implies infinite order despite all local angles rational. | Pass on stated instance |
| :694 / §9.3 | Countable G-orbit angular measure0; orbit indicator takes value1 there and0 almost everywhere, so supplies no nonconstant L² class. | Pass on stated instance |
| :842 / §11.4 | conj1=1, stabilizer size2; orbit directions count4/2=2; interior labels id,conj distinct. Correct negative Check, missing general theorem R03. | True negative control; extend theorem via R03 |
| :844 / §11.4 | Raw total4 gives residual\|4−16\|=12; normalized total1 gives\|1−1\|=0. | Pass on stated instance |
| :892 / §12.3 | Counting measure: supports{0},{−t} disjoint for t≠0, squared L² distance1+1=2, norm√2; at0 norm0. | Pass on stated instance |
| :913 / §12.4.1 | Correct twist cancels e^(2πit): averagee₁, mass1 at2π; opposite twist frequency4π averages to0; t=1/4 correlation i. | Pass on stated instance |
| :935 / §12.6 | Genus2 alone gives no spectral atom/no-atom verdict; a branched torus cover may retain nonconstant torus characters, so no universal weak-mixing conclusion follows. | Pass on stated instance |

## Not verifiable

- No new Lean elaboration or build was run, as prohibited for this read-only pass. The supplied elaborated types were compared declaration by declaration with the README; no binder discrepancy was found. R01’s proposed new signature was checked against the native declaration signatures by reading, not elaborated.
- Birkhoff1927 is settled as uncertified; its cached response is a blocked-request page, not readable mathematical text. Its §§1–3 attribution was not certified.
- BoldrighiniKeaneMarchetti1978, KerckhoffMasurSmillie1986, ChernovMarkarian2006, KatokHasselblatt1995, Tabachnikov2005 and ZemlyakovKatok1975 are settled as waived. MasurTabachnikov2002 is settled as uncertified. Their locators were retained as the brief requires and were not requested again. In particular, source-level verification of the variational second-orbit proof, polygonal corner bound and full generality of the unfolding references remains limited by those unavailable texts; the mathematical instance computations are recorded above.
- Four of the 152 listed open-head directories were absent: GlobalNumberFields, MarketImpact, ModularCharactersAndBlocks and SpinRepresentations. The other 148 were searchable. The broader roadmap tool searches supplied additional ownership leads, but do not replace inspection of those four missing exact checkouts. No ownership-clearance claim is made for them.
- The checks are adversarial instances and dependency/source inspection, not a machine proof or a claim to have formalized the proposed targets. No new missing-reference request was opened: all cited works are already accessible or explicitly settled by the brief.

## Source issues


- **Error** in Hochman2012 at Theorem 6.6.1 proof, printed page 69 (lines 3065–3074): the source says nonnegative-power complex polynomials are dense in the spectral L² space; it should be Laurent polynomials, allowing both positive and negative powers; affects the proof.
- **Misprint** in Herman1983 at Appendice, Lemma 11 proof, printed page 46 (lines 1271–1274): the source says the right-region difference uses H inverse and the left-region difference uses H; it should be H for the right region and H inverse for the left region, as in Lemma 10; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "e5e370d0cfccf9605f5eb0ca83a614264ecca59f", "job": "RT-MathematicalBilliards~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
