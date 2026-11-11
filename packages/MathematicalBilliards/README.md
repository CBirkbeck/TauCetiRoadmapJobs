# Roadmap: mathematical billiards

**Summary.** This roadmap builds the two classical planar billiard systems as dynamical systems. For a strictly convex table of class `C^k` (`k ≥ 1`, curvature allowed to vanish) it constructs the billiard ball map on the phase cylinder `A = (ℝ/ℓℤ) × (0, π)`, proves that it is a homeomorphism (a `C^{k−1}` diffeomorphism for `k ≥ 2`) extending to the closed cylinder, an exact area-preserving monotone twist map with the chord length as generating function and `sin δ dδ ds` as invariant measure, and identifies it, for smooth tables, with the map of SymplecticGeometry/CotangentLagrangian C3.1. On top of a general theory of twist maps of the annulus it proves Birkhoff's theorem that every rotational invariant curve is the graph of a function, Lipschitz for the billiard map (by Fathi's topological argument from non-wandering), defines rotation numbers through Mathlib's `CircleDeg1Lift.translationNumber`, and proves Birkhoff's theorem that every table has two geometrically distinct periodic orbits of each rotation type `(p, q)`. For a polygonal table, possibly with polygonal holes, it constructs the phase space, the singular set, the almost-everywhere billiard flow as an honest measure-preserving action of `ℝ`, the finite reflection group of a rational table and the resulting non-ergodicity, translation surfaces with their directional flows, the Katok–Zemlyakov surface with its cone angles and genus, and the conjugacy of the billiard flow in a fixed direction class with a straight-line flow. It closes with weak mixing of measure-preserving flows: Wiener's lemma on `ℝ`, the continuous-time mean ergodic projection with its spectral atomic mass, and the eigenfunction criterion. The end theorems are invariance of `sin δ dδ ds` under the billiard map, Birkhoff's graph theorem for rotational invariant curves, the existence of two Birkhoff orbits of every type `(p, q)`, measure preservation and reversibility of the polygonal billiard flow, the unfolding theorem for rational polygons and the eigenfunction criterion for weak mixing.

## Scope and ownership

This roadmap owns: convex billiard tables of class `C^k` (`1 ≤ k ≤ ∞`) in the plane `ℂ`, the curvature criterion for them, exit points, chords and oriented lines; the billiard ball map in the coordinates `(s, δ)`, its regularity, boundary extension, time reversal and comparison with C3.1's map; its generating function, Jacobian and invariant measure at finite regularity; positive and negative twist lifts of annulus homeomorphisms, monotone and exact twist maps, and the non-wandering set; rotational invariant curves, the Birkhoff–Fathi theorem on invariant regions, Birkhoff's graph theorem with its Lipschitz bound, rotation numbers of invariant curves, their monotonicity, the rational case; periodic configurations of type `(p, q)`, the billiard chain dictionary at regularity `C^k`, the maximal and minimax Birkhoff orbits; polygonal tables with holes, their phase space, trajectories, corner bound, singular set, flow and Liouville measure; reflection groups and rational tables; translation surfaces (the translation groupoid, cone points, flat area, directional flows); the Katok–Zemlyakov surface and the unfolding conjugacy; weak mixing of measure-preserving `ℝ`-actions, Wiener's lemma for finite measures on `ℝ`, strong continuity of Koopman groups of jointly measurable actions, the continuous-time mean ergodic projection, and the eigenfunction criterion.

Already in the library and consumed by name in the supplier contracts: circle lifts and translation numbers, ergodic and measure-preserving actions, Poincaré recurrence, the implicit function theorem, change of variables, structure groupoids and charted spaces, `Lp` pullbacks along measure-preserving maps and characteristic functions of measures (Mathlib); simple polygons and their boundary parametrisation, the Jordan curve, Schoenflies and crosscut theorems in `ℂ`, Bochner's theorem on `ℝ`, strongly continuous unitary groups and the Euler characteristic of spaces of finite CW type (Tau Ceti). Mathlib's `ContinuousLinearMap.tendsto_birkhoffAverage_orthogonalProjection` and Tau Ceti's `TauCeti.Probability.metProjection` (`TauCeti/Probability/Ergodic/MeanErgodic.lean`) are the mean ergodic theorem for the iterates of one operator or one measure-preserving map; §12.4.1 is the continuous-time theorem for a whole unitary group, with an exponential twist, which these do not give (time-one averages of the circle rotation keep the unit mode that the continuous averages kill).

Stated by other roadmaps and imported. SymplecticGeometry/CotangentLagrangian C3.1 plans the next-collision map of a smooth table in the coordinates `(s, v)`, its exact symplectic property, critical inscribed polygons with `exists_billiard_periodic_reflection`, the explicit circular formula and rational-periodicity criterion, and finite-volume recurrence; the circular results are transported through §2.5, including when the circle is regarded as a table of finite regularity. This roadmap builds the map at regularity `C^k` and proves the conjugacy with C3.1's map for `k = ∞` (§2.5), and does not restate C3.1's smooth statements, which are the case `k = ∞` of §§3.2–3.3. SymplecticGeometry/IntegrableSystems I5.4 supplies the compact-pair Čech continuity and the cup-length bound for flows with a Lyapunov function, used for the second Birkhoff orbit (§6.4). RiemannianGeometry/Surfaces §3.1 supplies the turning theorem for piecewise `C²` Jordan curves, used for the curvature criterion (§1.2). GeometricTopology §2.3 supplies the annulus theorem in dimension two and GeometricTopology §1.7 the genus of a compact orientable surface.

Kept variants of objects other roadmaps own. FactorRigidity §8.2 defines mixing and weak mixing of trace-preserving actions of discrete groups on tracial von Neumann algebras through matrix coefficients; §12.1 here is weak mixing of measure-preserving actions of `ℝ` on probability spaces through time averages, the notion the billiard flows need. ProbabilisticAndMetricNumberTheory §4.9a proves strong continuity of scalar `Lᵖ` Koopman representations for continuous actions of topological groups on R₁ Borel spaces with regular measures, and §4.6 strong mixing of single maps; §12.3 here proves strong continuity for jointly measurable actions of `ℝ` on probability spaces, with no topology on the space, which is the case of the discontinuous polygonal billiard flow.

Not part of this roadmap: caustics, the string construction, the elliptic table and the Birkhoff–Poritsky theorem (a consumer states them on §§2–5); Aubry–Mather sets and KAM curves; dispersing and semi-dispersing billiards and their hyperbolicity; billiards in dimension three and higher and on curved surfaces; outer and symplectic billiards; moduli spaces of translation surfaces, strata, the `SL₂(ℝ)` action, Veech groups and the theorems that need them (ergodicity in almost every direction, the weak-mixing theorems of Chaika–Forni); these are listed under Downstream consumers. The Poincaré–Birkhoff theorem of IntegrableSystems I5 needs a smooth diffeomorphism of the closed annulus and is not used: the billiard map is only a homeomorphism at the boundary of the closed cylinder, and the two Birkhoff orbits are obtained variationally.

## Conventions

- **The plane.** The plane is `ℂ` with `⟨a, b⟩ = Re(conj a · b)` and the cross product `a × b = Im(conj a · b)`, positive when `b` points to the left of `a`. Rotation by `δ` is multiplication by `exp(iδ)`. The Euclidean comparison uses Mathlib's `Complex.orthonormalBasisOneI`, whose `repr` is the linear isometry `z ↦ (Re z, Im z)` onto `EuclideanSpace ℝ (Fin 2)`. Witness: `1 × i = 1`, so `i` is to the left of `1`.
- **Tables.** A table is parametrised by arclength, `ℓ`-periodic, with unit tangent `τ = γ′` and signed curvature `κ = τ × τ′` (so `τ′ = iκτ` when `γ` is `C²`). Positive orientation: the table lies to the left of `τ`. Witness: `γ(s) = R exp(is/R)` has `τ(s) = i exp(is/R)`, `κ = 1/R`, and `τ(s) × (γ(t) − γ(s)) = R(1 − cos((t − s)/R))`, equal to `2R` at `t − s = πR`; the clockwise circle gives `−2R` and is excluded.
- **Phase coordinates.** A state `(s, δ)`, `δ ∈ (0, π)`, is the unit vector `exp(iδ)τ(s)` based at `γ(s)`; `δ` is the angle from the tangent. Witness: on the unit circle, `(0, π/2)` is the vector `−1` at the point `1`, pointing at the centre.
- **Exit point and normalised lift.** The lift of the billiard map to the strip `ℝ × (0, π)` is normalised by `s < s₁ < s + ℓ`; it sends `(s, δ)` to `(s₁, δ₁)` with `γ(s₁) − γ(s) = L · exp(iδ)τ(s)`, `L > 0`, and `τ(s₁) = exp(iδ₁) exp(iδ) τ(s)`, equivalently `cos δ₁ = ⟨exp(iδ)τ(s), τ(s₁)⟩`. Witness: on the circle of radius `R`, `(s, δ) ↦ (s + 2Rδ, δ)` with `L = 2R sin δ`; on the unit circle `(0, π/2) ↦ (π, π/2)`, `L = 2`.
- **Total maps.** The billiard map is a self-map of `AddCircle ℓ × ℝ` whose restriction to the phase cylinder `A = AddCircle ℓ × (0, π)` is the billiard ball map `T`; its values off `A` carry no meaning. The invariant measure is a measure on `AddCircle ℓ × ℝ` concentrated on `A`. Witness: the exit-parameter formula at `δ = π` takes an infimum over the empty set, Lean's junk value `0`, while the closed-cylinder extension of §2.3 sends `(s, π)` to `(s + ℓ, π)`.
- **Coordinates of the cylinder.** `A = AddCircle ℓ × Ioo 0 π`, `Ā = AddCircle ℓ × Icc 0 π`. The twist is positive in `(s, δ)` and in `(s, y)` with `y = −cos δ`, negative in C3.1's `(s, v)` with `v = cos δ`. Witness: on the circle of radius `R`, `∂s₁/∂δ = 2R > 0`, while `∂s₁/∂v = −2R/sin δ < 0`.
- **Invariant measure.** `μ_A` is the product of the Haar measure `volume` of `AddCircle ℓ` (total mass `ℓ`, `AddCircle.measure_univ`) with `sin δ dδ` on `(0, π)`, as a measure on `AddCircle ℓ × ℝ` concentrated on `A`; total mass `2ℓ`. Its image under `(s, δ) ↦ (s, cos δ)` is `volume ⊗ Lebesgue` on `AddCircle ℓ × (−1, 1)`. Witness: `μ_A(AddCircle ℓ × (0, π/2)) = ℓ`.
- **Forms and generating functions.** Following SymplecticGeometry, `ω = −dλ`. In `(s, y)`, `λ = y ds`, `ω = ds ∧ dy`; the billiard map satisfies `F*λ − λ = −dL` with `L(s, s₁) = |γ(s₁) − γ(s)|`, so its generator in the convention of IntegrableSystems I5.0 (`y = −∂₁S`, `Y = ∂₂S`) is `S = −L`. Witness: `∂_s L = −cos δ = y` and `∂_{s₁} L = cos δ₁ = −Y`.
- **Rotation numbers** are normalised by the period: for a lift `g` of a circle homeomorphism of `AddCircle ℓ`, the rotation number is `translationNumber` of `x ↦ g(ℓx)/ℓ`. Witness: on the circle table the curve `δ = π/3` has rotation number `1/3`.
- **Type `(p, q)`.** A state `x` of the strip is periodic of type `(p, q)`, `q ≥ 1`, when `F^q(x) = x + (pℓ, 0)` for the normalised lift `F`. Witness: the equilateral triangle in the unit circle is of type `(1, 3)` (`δ = π/3`, three steps of `2π/3`).
- **Polygonal tables.** Directions are unit complex numbers (`Circle`) with the arclength measure `dθ`, the image of `volume` on `AddCircle (2 * π)` under `AddCircle.homeomorphCircle'`. The linear reflection in the direction of a side with unit direction `d` is `σ(v) = d² · conj v`. Witness: a horizontal side has `σ(v) = conj v`, sending `exp(iπ/4)` to `exp(−iπ/4)`. The Liouville probability measure is `μ_P = (2π · area P)⁻¹` times the image of `Leb_P ⊗ dθ`. Time reversal is `J(x, v) = (x, −v)`.
- **Almost-everywhere flows.** A flow defined off an invariant null set is extended by the identity on that set, so that it is an action of `ℝ` (`AddAction ℝ X`), with joint measurability `MeasurableVAdd₂ ℝ X`, invariance `VAddInvariantMeasure ℝ X μ` and ergodicity `ErgodicVAdd ℝ X μ`. Witness: the billiard flow of the unit square fixes every state of the singular set and moves `((1/2, 1/2), 1)` to `((1/2, 1/2), −1)` at time `1`.
- **Cone angles.** A cone point of a translation surface has cone angle `2πk` with an integer `k ≥ 1`; `k = 1` is a regular marked point. Witness: the vertex class of the `3π/2` corner of the L-shaped table has `k = 3`, cone angle `6π`.
- **Complex Hilbert spaces.** Use Mathlib’s convention, conjugate-linear in the first input; on complex `L²(μ)` this is `⟨f, g⟩ = ∫ conj(f) g`. Put `U_t f = f ∘ F^t`; the correlation is `⟨g, U_t f⟩ − (∫f) conj(∫g)`, and the spectral transform is `⟨f, U_t f⟩ = ∫ exp(itξ) dσ_f(ξ)`. Witness: on one point `f = i`, `g = 1` give `i − i = 0`; on `AddCircle 1` the unit mode `e₁(x) = exp(2πix)` gives `⟨e₁, U_{1/4}e₁⟩ = i`, so its atom is at `2π`, and twisting by `exp(−2πit)` fixes that mode.
- **Weak mixing** averages `|μ((t +ᵥ ·)⁻¹' A ∩ B) − μ(A)μ(B)|`, with measures read as real numbers (`MeasureTheory.Measure.real`), over `t ∈ [0, T]`. Witness: for the horizontal unit-speed flow on `ℂ/(ℤ + iℤ)` and `A = B = {Re z mod 1 ∈ [0, 1/2)}`, `μ((t +ᵥ ·)⁻¹' A ∩ A) = |1/2 − t|` for `t ∈ [0, 1]`, and the average of `||1/2 − t| − 1/4|` over a period is `1/8 ≠ 0`.

## Exact supplier contracts

### From Mathlib

- `CircleDeg1Lift`, `CircleDeg1Lift.translationNumber`, `CircleDeg1Lift.tendsto_translationNumber`, `CircleDeg1Lift.translationNumber_eq_rat_iff`, `CircleDeg1Lift.translationNumber_units_inv`, `CircleDeg1Lift.translationNumber_mono`, `CircleDeg1Lift.translationNumber_le_of_le_add`, `CircleDeg1Lift.le_translationNumber_of_add_le` (`Mathlib/Dynamics/Circle/RotationNumber/TranslationNumber.lean`): a lift is a monotone map `ℝ → ℝ` with `f(x + 1) = f x + 1` (no continuity is assumed); `((f^n) x − x)/n` tends to the translation number for every `x`; for a continuous lift, the translation number is `m/n` (`n > 0`) exactly when some `x` has `(f^n) x = x + m`; inversion negates it; it is monotone in `f` and bounded by uniform bounds on `f x − x`.
- `AddCircle`, `AddCircle.measure_univ`, `AddCircle.measurePreserving_mk`, `AddCircle.homeomorphCircle'`, `AddCircle.equivIco` (`Mathlib/MeasureTheory/Integral/IntervalIntegral/Periodic.lean`, `Mathlib/Analysis/SpecialFunctions/Complex/Circle.lean`, `Mathlib/Topology/Instances/AddCircle/Defs.lean`): the Haar measure of `AddCircle T` has total mass `T` (for `Fact (0 < T)`), the quotient map restricted to a fundamental interval `(t, t + T]` is measure preserving, `AddCircle (2π)` is homeomorphic to `Circle`, and `equivIco p a` picks the representative in `[a, a + p)`, used to compute the billiard map on the quotient.
- `MeasureTheory.MeasurePreserving`, `MeasureTheory.Measure.prod`, `MeasureTheory.Measure.withDensity`, `MeasureTheory.Measure.real`, `MeasureTheory.lintegral_image_eq_lintegral_abs_det_fderiv_mul` (`Mathlib/MeasureTheory/Function/Jacobian.lean`): measure preservation includes measurability of the map; product measures (zero as junk value when the second factor is not s-finite, which never occurs here); densities; real-valued measures of sets; change of variables for a map injective on a measurable set with derivatives within it.
- `MeasureTheory.MeasurePreserving.conservative`, `MeasureTheory.Conservative.ae_frequently_mem_of_mem_nhds` (`Mathlib/Dynamics/Ergodic/Conservative.lean`): a measure-preserving self-map of a finite measure space is conservative, and on a second-countable space almost every point returns infinitely often to each of its neighbourhoods.
- `ErgodicVAdd`, `VAddInvariantMeasure`, `MeasurableVAdd₂`, `MeasureTheory.measurePreserving_vadd` (`Mathlib/Dynamics/Ergodic/Action/Basic.lean`, `Mathlib/MeasureTheory/Group/Arithmetic.lean`, `Mathlib/MeasureTheory/Group/Action.lean`): ergodicity of an additive action (every almost-invariant measurable set is null or conull), invariance of a measure under every translate, joint measurability of `(t, x) ↦ t +ᵥ x`, and measure preservation of each translate `(t +ᵥ ·)` under an invariant measure.
- `Flow` (`Mathlib/Dynamics/Flow.lean`): a jointly continuous action; the polygonal billiard flow is not continuous and is not an instance.
- `ContDiffAt.contDiffAt_implicitFunction` and `ContDiffAt.hasStrictFDerivAt_implicitFunction` (`Mathlib/Analysis/Calculus/ImplicitContDiff.lean`): the implicit function of a `C^n` equation with invertible partial derivative is `C^n`, with the expected derivative.
- `StrictConvex`, `convexHull` (`Mathlib/Analysis/Convex/Strict.lean`, `Mathlib/Analysis/Convex/Hull.lean`): a set is strictly convex when the open segment between two distinct points lies in its interior.
- `Pregroupoid`, `Pregroupoid.groupoid`, `StructureGroupoid`, `ChartedSpace`, `HasGroupoid`, `StructureGroupoid.maximalAtlas`, `contDiffGroupoid` (`Mathlib/Geometry/Manifold/StructureGroupoid.lean`, `HasGroupoid.lean`, `IsManifold/Basic.lean`).
- `ContinuousMap.Nullhomotopic` (`Mathlib/Topology/Homotopy/Contractible.lean`).
- `Polygon` (`Mathlib/Geometry/Polygon/Basic.lean`): a cyclic list of `n` vertices, with `Polygon.edgeSet` and `Polygon.boundary`.
- `DihedralGroup` (`Mathlib/GroupTheory/SpecificGroups/Dihedral.lean`).
- `MeasureTheory.Lp.compMeasurePreserving`, `MeasureTheory.Lp.coeFn_compMeasurePreserving`, `MeasureTheory.Lp.norm_compMeasurePreserving`, `MeasureTheory.Lp.isometry_compMeasurePreserving`, `MeasureTheory.Lp.compMeasurePreserving_comp` (`Mathlib/MeasureTheory/Function/LpSpace/Basic.lean`): pullback of `Lp` classes, agreement with function composition almost everywhere, preservation of norms, isometry for `1 ≤ p` and the composition law. Consumed by §12.3.
- `Submodule.orthogonalProjectionOnto` (`Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean`): the continuous linear projection to a subspace admitting an orthogonal projection; a closed subspace of a complete Hilbert space does. Consumed by §12.4.1.
- `inner_smul_left` (`Mathlib/Analysis/InnerProductSpace/Basic.lean`): the complex inner product conjugates the first scalar, fixing the convention of Layer 12.
- `MeasureTheory.charFun`, `MeasureTheory.charFun_apply_real` (`Mathlib/MeasureTheory/Measure/CharacteristicFunction/Basic.lean`): for a measure `σ` on `ℝ`, `charFun σ t = ∫ exp(itξ) dσ(ξ)`, the transform of §§12.4–12.5 and of the atomic-mass identity of §12.4.1.
- `intervalIntegral` with values in a complete normed space (`Mathlib/MeasureTheory/Integral/IntervalIntegral/Basic.lean`): the averages `T⁻¹ ∫₀ᵀ` of Layer 12.
- `Homeomorph` and `AddCircle` (`Mathlib/Topology/Homeomorph/Defs.lean`, `Mathlib/Topology/Instances/AddCircle/Defs.lean`): homeomorphisms and the topological quotient `ℝ/ℓℤ`; §4.1 uses equivariance to descend to the quotient and interval order to control the ends.

### From Tau Ceti

- `Polygon.IsSimple`, `TauCeti.SimplePolygon`, `Polygon.boundaryParamCircle`, `Polygon.IsSimple.isJordanCurve_boundary` (`TauCeti/Geometry/Polygon/Simple.lean`): edges nondegenerate and distinct edges meeting only at the common vertex of consecutive edges; consecutive collinear edges are allowed, so a vertex may have angle `π`; the boundary of a simple real polygon is a Jordan curve.
- `TauCeti.IsJordanCurve`, `TauCeti.isJordanCurve_frontier_of_convex` (`TauCeti/Topology/JordanCurve/Basic.lean`): a set homeomorphic to `Circle`; the frontier of a bounded convex subset of `ℂ` with nonempty interior is one.
- `TauCeti.IsJordanCurve.natCard_connectedComponents_compl_eq_two`, `TauCeti.IsJordanCurve.frontier_connectedComponentIn` (`TauCeti/Analysis/Complex/PlaneSeparation/Inside.lean`, `JordanCurve.lean`): the Jordan curve theorem in `ℂ`, every complementary component having frontier the curve.
- `TauCeti.IsJordanCurve.exists_homeomorph_image_sphere` (`TauCeti/Analysis/Complex/Conformal/Jordan/Schoenflies.lean`): the Schoenflies theorem in `ℂ`.
- `Path.IsCrosscut.natCard_connectedComponents_sdiff_range_eq_two` (`TauCeti/Analysis/Complex/Conformal/PrimeEnd/Crosscut/TwoSides.lean`): a crosscut of a simply connected open subset of `ℂ` cuts it into exactly two components.
- `TauCeti.bochner_charFun_real` (`TauCeti/Analysis/Bochner/CharFun/Bochner.lean`): a function `ℝ → ℂ` is continuous and positive definite exactly when it is `x ↦ ∫ exp(ixξ) dμ(ξ)` for a unique finite Borel measure `μ`.
- `TauCeti.Semigroups.StronglyContinuousGroup` (`TauCeti/Analysis/Semigroups/Group/Basic.lean`) and `TauCeti.Semigroups.StronglyContinuousGroup.IsUnitary`, `TauCeti.Semigroups.StronglyContinuousGroup.IsUnitary.map_smul` (`TauCeti/Analysis/Semigroups/Group/Unitary.lean`): real-linear strongly continuous groups (`U 0 = 1`, `U (s + t) = U s ∘ U t`, continuity of each orbit at `0`), with preservation of the complex inner product in the unitary case, which forces complex linearity. Completeness is an explicit hypothesis of §12.4.1.
- `TauCeti.eulerChar`, `TauCeti.eulerChar_union_add_eulerChar_inter` (`TauCeti/AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean`, `MayerVietoris.lean`): the Euler characteristic of a space of finite CW type and its Mayer–Vietoris additivity for two open sets.

### From TauCetiRoadmap.SymplecticGeometry/CotangentLagrangian

- C3.1, paragraph "Convex planar billiards": the next-collision map `β` of a smooth positively oriented table on `AddCircle L × (−1, 1)` in the coordinates `(s, v)`, `v` the tangential component of the outgoing velocity, and the hypotheses of `exists_billiard_periodic_reflection` (a smooth `L`-periodic unit-speed map to `EuclideanSpace ℝ (Fin 2)`, injective on `[0, L)`, meeting each tangent line only at its point of tangency). The same paragraph supplies the circle formula `β(s, v) = (s + 2R arccos v, v)` for `R > 0`, and periodicity exactly when `arccos(v)/π` is rational. Consumed by §1.5, §2.5 and §5.6.
- C3.1, paragraph "Finite-volume recurrence": for a measurable self-map of a topological space with its Borel σ-algebra preserving a finite measure of full support, every nonempty open set contains a point returning to it after a positive number of iterates. Consumed by §4.4.

### From TauCetiRoadmap.SymplecticGeometry/IntegrableSystems

- I5.4: the compact-pair Čech cohomology with real coefficients and its continuity property (a class vanishing on a compact subset vanishes on a closed neighbourhood of it), and the cup-length bound (a flow on a compact metric space with a continuous Lyapunov function strictly decreasing along every nonconstant orbit has at least `cl(Ȟ*(S; ℝ)) + 1` rest points). Consumed by §6.4.
- I5.0: the sign convention for generating functions, used in §3.2 only to state which sign the billiard generator has.

### From TauCetiRoadmap.RiemannianGeometry/Surfaces

- §3.1, `integral_signedCurvature_add_sum_exteriorAngle_eq_two_pi`: for a positively oriented piecewise `C²` unit-speed planar Jordan curve, `∫ κ ds + Σ αᵢ = 2π`, and the reversed curve has total turning `−2π`. Consumed by §1.2 with no corners.

### From TauCetiRoadmap.GeometricTopology

- §2.3: the annulus theorem for `n + 1 = 2`: two locally flat circles in `ℝ²`, one strictly inside the region bounded by the other, cobound an embedded closed annulus. Consumed by §5.2.
- §1.7: the classification of compact connected smooth surfaces and the genus `(2 − χ − b)/2` of an orientable one. Consumed by §11.3.

## How to read the build

Layer 1 fixes convex tables and their elementary geometry; Layer 2 constructs the billiard ball map and Layer 3 its generating function and invariant measure. Layer 4 is the general theory of twist maps of the annulus, which the billiard map instantiates. Layer 5 proves Birkhoff's graph theorem and builds rotation numbers; Layer 6 proves the existence of two Birkhoff orbits of each type. Layers 7–8 construct polygonal tables, the singular set and the billiard flow; Layer 9 treats rational tables. Layer 10 is a self-contained theory of translation surfaces and Layer 11 the Katok–Zemlyakov surface with the unfolding conjugacy. Layer 12 is weak mixing of flows. Layers 1–6 and 7–11 are independent of each other; Layer 12 depends only on the measure-theoretic conventions and is applied to Layers 9–11 in §12.6. The acceptance test `Suggested.lean` states the headline theorems of Layers 3, 5, 6 and 12 on native carriers; the polygonal billiard flow, the translation surfaces with their directional flows and the Katok–Zemlyakov surface are constructions of Layers 7–11, specified below with their intended signatures, so the polygonal headline theorems are targets of this README alone.

The Lean names in backticks below that are not Mathlib, Tau Ceti or supplier declarations are the declarations of `Suggested.lean`, in the namespace `TauCetiRoadmap.MathematicalBilliards`: the definitions `ConvexTable`, `ConvexTable.billiardLift`, `ConvexTable.billiardMap`, `phaseMeasure`, `IsTwistLift`, `nonwanderingSet`, `IsRotationalInvariantCurve`, `ConvexTable.IsPeriodicConfiguration` and `IsWeaklyMixing`, and the theorems `ConvexTable.measurePreserving_billiardMap` (§3.3), `isGraph_of_isRotationalInvariantCurve` and `ConvexTable.exists_lipschitzWith_of_isRotationalInvariantCurve` (§5.3), `ConvexTable.exists_two_periodic_orbits` (§6.4), `exists_tendsto_twistedAverage` (§12.4.1) and `isWeaklyMixing_iff` (§12.5).

## Layer 1: Convex billiard tables

### 1.1 The carrier

Define `ConvexTable k ℓ` for `k : ℕ∞` and a period `ℓ` with `0 < ℓ` (an instance `Fact (0 < ℓ)`, the convention of `AddCircle`): a map `γ : ℝ → ℂ` together with `1 ≤ k`, of class `C^k`, `ℓ`-periodic, of unit speed (`‖γ′ s‖ = 1`), and strictly convex and positively oriented in the sense that `τ(s) × (γ(t) − γ(s)) > 0` whenever `t − s ∉ ℓℤ`: every other point of the curve lies strictly to the left of the tangent line at `γ(s)`. Injectivity on `[0, ℓ)` is a consequence, not an axiom: if `γ(t) = γ(s)` with `t − s ∉ ℓℤ` the cross product would be `0`. Write `Ω` for the closed convex hull of the image (Tabachnikov2005, Chapter 3; KatokHasselblatt1995, Section 9.2).

API:

- `γ(s) = γ(t)` exactly when `t − s ∈ ℓℤ`; the image of `γ` is a Jordan curve and `γ` descends to a homeomorphism of `AddCircle ℓ` onto it.
- `Ω` is compact, has nonempty interior and is `StrictConvex ℝ Ω`; its frontier is the image of `γ`; the open half-plane to the left of each tangent line contains `Ω` minus the point of tangency. Route: every direction is an outer normal of `Ω` at exactly one curve point, since the tangent angle covers the circle; a supporting line therefore meets `Ω` in one point of the curve.
- Reparametrisation: `s ↦ γ(s + c)` is a table for every `c`; a rigid motion `z ↦ az + b` with `|a| = 1` maps a table to a table; reversing the orientation `s ↦ γ(−s)` never gives a table.
- For `k ≥ 2` the curvature is nonnegative, `κ ≥ 0` everywhere (from the second-order expansion of `τ(s) × (γ(t) − γ(s))` at `t = s`).
- A table of class `C^k` is a table of class `C^j` for `1 ≤ j ≤ k`.

**Checks.**

- The circle `R exp(is/R)`, `ℓ = 2πR`, is a table of class `C^∞`; at `t − s = πR` the defining quantity is `2R`.
- The clockwise circle `R exp(−is/R)` fails the defining inequality (value `−2R` at `t − s = πR`): the orientation is part of the carrier.
- The superellipse `x⁴ + y⁴ = 1` parametrised by arclength is a table of class `C^∞` whose curvature vanishes at the four points `(±1, 0)`, `(0, ±1)`: strict convexity does not imply positive curvature.
- The stadium (two half-circles joined by segments) is `C¹` and convex but not a table: the tangent line along a segment contains the whole segment, so the strict inequality fails.
- The curve made of the upper half of the unit circle and the lower half of the ellipse `x² + 4y² = 1` is a table of class `C¹` and not `C²` (the curvature jumps from `1` to `4` at `(±1, 0)`).

*Needs:* Mathlib `StrictConvex`, `convexHull`; Tau Ceti `TauCeti.IsJordanCurve`, `TauCeti.isJordanCurve_frontier_of_convex`.

### 1.2 The curvature criterion

Prove the curvature criterion: if `γ : ℝ → ℂ` is `C²`, `ℓ`-periodic with `ℓ > 0`, of unit speed, injective on `[0, ℓ)` and has signed curvature `κ > 0` everywhere, then `γ` is a table of class `C²` (BialyMironov2022 lines 96–98 and 149–153 for this setting; Tabachnikov2005, Chapter 3). Route: the image is a `C²` Jordan curve; by the turning theorem its total curvature is `2π` if it is positively oriented and `−2π` otherwise, and `κ > 0` forces `+2π`; so the tangent angle `θ` is strictly increasing with `θ(s + ℓ) = θ(s) + 2π`. For fixed `s` the height `h(t) = τ(s) × (γ(t) − γ(s))` has critical points exactly where `τ(t) = ±τ(s)`, which are `t ≡ s` and the unique `t ≡ s′` with `θ(s′) = θ(s) + π`; `h(s) = 0` and `h″(s) = κ(s) > 0`, so `s` is the minimum and `s′` the maximum, and `h > 0` off `s + ℓℤ`. *Needs:* RiemannianGeometry/Surfaces §3.1; §1.1.

**Checks.**

- The ellipse `(a cos u, b sin u)`, `a > b > 0`, reparametrised by arclength, has `κ > 0` and is a table; at the vertex `(a, 0)` its curvature is `a/b²`.
- The curve `exp(2iu) + exp(iu)`, reparametrised by arclength, is regular (`γ′ = i exp(iu)(2 exp(iu) + 1) ≠ 0`) with `Im(conj γ′ · γ″) = 9 + 6 cos u ≥ 3 > 0` and total turning `4π`; by the turning theorem it is not injective, and the criterion fails exactly at the injectivity hypothesis.
- The superellipse of §1.1 shows that the converse is false.

### 1.3 Chords and exit points

Prove: for a table, a parameter `s` and `δ ∈ (0, π)`, the ray `{γ(s) + r exp(iδ)τ(s) : r > 0}` meets the image of `γ` in exactly one point `γ(s₁)` with `s < s₁ < s + ℓ`, and the open chord between `γ(s)` and `γ(s₁)` lies in the interior of `Ω` (Tabachnikov2005, Chapter 3). The exit parameter `s₁` is a continuous function of `(s, δ)` on the strip, strictly increasing in `δ`, with `s₁ → s` as `δ → 0` and `s₁ → s + ℓ` as `δ → π`, locally uniformly in `s`. Route: the direction `exp(iδ)τ(s)` points to the left of `τ(s)`, hence into the interior of `Ω`; since `Ω` is compact and strictly convex, the ray leaves `Ω` at exactly one frontier point, a curve point `γ(s₁)` with a unique `s₁ ∈ (s, s + ℓ)`; continuity and the two limits follow from uniqueness and compactness (closed graph), and monotonicity from the counterclockwise rotation of the ray with `δ`. *Needs:* §1.1.

**Checks.**

- On the unit circle, `(s, δ) = (0, π/2)` exits at `s₁ = π`, the antipodal point, and `(0, π/3)` at `s₁ = 2π/3`.
- On the stadium, from the midpoint of a flat side the exit point does not tend to the starting point as `δ → 0`: for small `δ > 0` the ray crosses the table and exits on a half-circle. Strict convexity is what gives `s₁ → s`.
- At `δ = π/2` on the ellipse `(2 cos u, sin u)` from `(2, 0)` the exit point is `(−2, 0)`, the other end of the major axis.

### 1.4 Oriented lines

Represent an oriented line by `(e, c) ∈ Circle × ℝ`, the line `{z : e × z = c}` oriented by `e`. Prove that `(s, δ) ↦ (exp(iδ)τ(s), exp(iδ)τ(s) × γ(s))` is a homeomorphism from `A` onto the set of oriented lines meeting the interior of `Ω`; its inverse sends a line to its entry point into `Ω` and the angle there (BialyMironov2022 lines 154–157). *Needs:* §1.3.

**Checks.**

- On the unit circle the state `(0, π/2)` is the horizontal line through the origin oriented towards `−1`: `e = −1`, `c = (−1) × 1 = 0`.
- The tangent lines (`δ = 0` or `π`) meet `Ω` only on its frontier and are not in the image, which is why `A` is open.
- The lines `(e, c)` and `(−e, −c)` are the same set with opposite orientations; if `(e, c)` is the state `(s, δ)`, the reversed line is the state `I(T(s, δ))`, entering at the exit point with angle `π − δ₁` (time reversal of §2.4).

### 1.5 Smooth tables and C3.1

Prove that for a table of class `C^∞`, the map `Complex.orthonormalBasisOneI.repr ∘ γ` satisfies the hypotheses of SymplecticGeometry/CotangentLagrangian C3.1's convex billiards paragraph and of `exists_billiard_periodic_reflection`: it is smooth, `ℓ`-periodic, of unit speed, injective on `[0, ℓ)`, positively oriented and meets each tangent line only at its point of tangency (BialyMironov2022, Section 2, p. 4, lines 159–164, for the coordinates; the comparison is constructed here). Route: the linear isometry preserves norms and the cross product up to the fixed orientation of `(Re, Im)`. *Needs:* §1.1; Mathlib `Complex.orthonormalBasisOneI`; SymplecticGeometry/CotangentLagrangian C3.1.

**Checks.**

- The unit circle goes to `s ↦ (cos s, sin s)`, which meets the tangent line `x = 1` only at `s ≡ 0`.
- For the stadium the tangent-line hypothesis of C3.1 fails along the segments, as the carrier of §1.1 does.
- For the superellipse both hypotheses hold although the curvature vanishes at four points.

### Examples

The circle, the ellipse, the superellipse `x⁴ + y⁴ = 1` and the `C¹` circle–ellipse table are the running examples; the stadium is the running non-example.

### Dependencies

Mathlib; Tau Ceti plane topology; RiemannianGeometry/Surfaces §3.1 (only for §1.2); SymplecticGeometry/CotangentLagrangian C3.1 (only for §1.5).

## Layer 2: The billiard ball map

### 2.1 The lift and the map

Define `ConvexTable.billiardLift`, a self-map of `ℝ × ℝ`: for `(s, δ)` put `e = exp(iδ)τ(s)`, let `s₁` be the infimum of the parameters `t ∈ (s, s + ℓ)` with `e × (γ(t) − γ(s)) ≥ 0` (the points of the curve on or to the left of the oriented line through `γ(s)` in direction `e`), and let `δ₁ = arccos⟨e, τ(s₁)⟩`; the lift sends `(s, δ)` to `(s₁, δ₁)`. On the strip `ℝ × (0, π)` that set of parameters is `[s₁, s + ℓ)` with `s₁` the exit parameter of §1.3, `δ₁ ∈ (0, π)`, and the outgoing direction at `γ(s₁)` is the reflection `τ(s₁)² · conj(exp(iδ)τ(s))` of the incoming direction in the tangent line, equal to `exp(iδ₁)τ(s₁)`. Define `ConvexTable.billiardMap`, the self-map of `AddCircle ℓ × ℝ` that applies the lift to the representative of the first coordinate in `[0, ℓ)` (`AddCircle.equivIco`) and reduces modulo `ℓ`. Its restriction to the phase cylinder `A` is the billiard ball map `T`; its values off `A` carry no meaning (BialyMironov2022, Section 2, p. 4, lines 154–161, gives the reflection coordinates for positive-curvature tables; the `C^k` construction is made here; ChernovMarkarian2006, Chapter 2; KatokHasselblatt1995, Section 9.2).

*Needs:* §1.3.

API:

- Equivariance: on the strip `F(s + ℓ, δ) = F(s, δ) + (ℓ, 0)`, so the billiard map on `A` is the quotient of the lift and does not depend on the choice of representative; `s < s₁ < s + ℓ`.
- Reflection law on the strip: `γ(s₁) − γ(s) = L · exp(iδ)τ(s)` with `L = |γ(s₁) − γ(s)| > 0`, and `τ(s₁) = exp(iδ₁) exp(iδ) τ(s)`.
- The lift maps the open strip homeomorphically onto itself and the billiard map restricts to a homeomorphism `T` of `A` (for every `k ≥ 1`); the inverse is given in §2.4.
- Naturality: for a rigid motion `z ↦ az + b`, `|a| = 1`, the two tables have the same lift; for the shifted table `γ(· + c)` the lift is conjugated by `(s, δ) ↦ (s − c, δ)`.

**Checks.**

- Circle of radius `R`: `F(s, δ) = (s + 2Rδ, δ)`, with `cos δ₁ = cos δ`.
- On the ellipse `(2 cos u, sin u)` the state at `(2, 0)` with `δ = π/2` goes to the state at `(−2, 0)` with `δ₁ = π/2` (the major axis is a 2-periodic orbit).
- The plausible wrong convention measuring `δ₁` as the angle between the incoming direction and `−τ(s₁)` gives the map `I ∘ T`, on the circle `(s, δ) ↦ (s + 2Rδ, π − δ)`, whose square is `(s + 2Rδ + 2R(π − δ), δ) = (s + ℓ, δ)`, the identity on `A`: an involution, not the billiard map.
- Off the strip the formula is junk, and the closed cylinder needs §2.3: at `δ = 0` the parameter set is all of `(s, s + ℓ)`, so `s₁ = s` and `δ₁ = arccos 1 = 0`, the identity; at `δ = π` the set is empty, so `s₁` is the junk value `0` rather than `s + ℓ`.

### 2.2 Regularity

Prove that for `k ≥ 2` the restriction of the lift to the open strip is `C^{k−1}` with `C^{k−1}` inverse, so `T` is a `C^{k−1}` diffeomorphism of `A` (KatokHasselblatt1995, Section 9.2; ChernovMarkarian2006, Chapter 2). Route: `s₁` solves `Φ(s, δ, s₁) = 0` with `Φ = exp(iδ)τ(s) × (γ(s₁) − γ(s))`, which is `C^{k−1}`, and `∂Φ/∂s₁ = sin δ₁ > 0` at the exit point; then `δ₁ = arccos⟨exp(iδ)τ(s), τ(s₁)⟩` with argument in `(−1, 1)`. The partial derivatives are
`∂s₁/∂δ = L / sin δ₁`, `∂s₁/∂s = (κ(s) L − sin δ) / sin δ₁`. *Needs:* §2.1; Mathlib `ContDiffAt.contDiffAt_implicitFunction`, `ContDiffAt.hasStrictFDerivAt_implicitFunction`.

**Checks.**

- Circle: `∂s₁/∂δ = 2R sin δ / sin δ = 2R` and `∂s₁/∂s = (2 sin δ − sin δ)/sin δ = 1`, matching `F(s, δ) = (s + 2Rδ, δ)`.
- The nondegeneracy `∂Φ/∂s₁ = sin δ₁` vanishes only for tangent chords, which are excluded from the open strip; at `δ₁ → 0` the bound `∂s₁/∂δ = L/sin δ₁` stays finite because `L → 0` at the same rate on the circle (`L/sin δ₁ = 2R`).
- For the `C¹` circle–ellipse table the lift is a homeomorphism, but by the formula `∂s₁/∂s = (κ(s)L − sin δ)/sin δ₁` its derivative jumps at the parameters `s` of the points `(±1, 0)`, where `κ(s)` jumps between `1` and `4`: `k ≥ 2` is needed for `C¹`.

### 2.3 The closed cylinder

Prove that the restriction of the lift to the open strip extends to a homeomorphism of `ℝ × [0, π]` equal to the identity on `δ = 0` and to `(s, π) ↦ (s + ℓ, π)` on `δ = π`; hence `T` extends to a homeomorphism `T̄` of `Ā = AddCircle ℓ × [0, π]` fixing both boundary circles pointwise, and `s₁(s, ·)` is strictly increasing on `[0, π]` (KatokHasselblatt1995, Section 9.2; the finite-regularity extension follows here from §1.3). The extension agrees with `ConvexTable.billiardLift` on the open strip and on `δ = 0`, not on `δ = π`. *Needs:* §1.3, §2.1.

**Checks.**

- Circle: the extension is `(s, δ) ↦ (s + 2Rδ, δ)` on `[0, π]`, the identity at `δ = 0` and the translation by `2πR = ℓ` at `δ = π`.
- The extension is not differentiable at the boundary in general: for the superellipse at a flat point the exit parameter behaves like a fractional power of `δ`, which is why the closed-cylinder statement is topological.
- In C3.1's coordinate `v = cos δ` the two boundary circles are `v = 1` (identity) and `v = −1` (translation by `ℓ`).

### 2.4 Time reversal

Prove `T⁻¹ = I ∘ T ∘ I` on `A` for `I(s, δ) = (s, π − δ)`; on the strip, `I ∘ F ∘ I = τ_ℓ ∘ F⁻¹` with `τ_ℓ(s, δ) = (s + ℓ, δ)`, both sides being normalised lifts (KatokHasselblatt1995, Section 9.2). *Needs:* §2.1.

**Checks.**

- Circle: `I(T(I(s, δ))) = (s + ℓ − 2Rδ, δ)`, which is `T⁻¹(s, δ)` modulo `ℓ`.
- Without the deck translation the lift identity is false: `I ∘ F ∘ I` satisfies `s < s₁ < s + ℓ` while `F⁻¹` satisfies `s − ℓ < s₁ < s`.
- `I` is an involution preserving `μ_A` (since `sin(π − δ) = sin δ`).

### 2.5 Comparison with C3.1

Prove that for a table of class `C^∞`, `Ψ(s, δ) = (s, cos δ)` is a homeomorphism `A → AddCircle ℓ × (−1, 1)` with `Ψ ∘ T = β ∘ Ψ`, where `β` is the next-collision map of SymplecticGeometry/CotangentLagrangian C3.1 for the table `Complex.orthonormalBasisOneI.repr ∘ γ`; C3.1's coordinate `v` is the tangential component `cos δ` of the outgoing velocity (BialyMironov2022, Section 2, p. 4, lines 159–164, for the coordinate meaning). Transport C3.1's circular formula and rational-periodicity criterion through `Ψ`; the circle is smooth whatever finite regularity label is used. *Needs:* §1.5, §2.1; SymplecticGeometry/CotangentLagrangian C3.1.

**Checks.**

- Circle: `Ψ(T(s, δ)) = (s + 2Rδ, cos δ)` and C3.1's formula `β(s, v) = (s + 2R arccos v, v)` agree at `v = cos δ`.
- The comparison reverses the order of the fibre: `δ ↦ cos δ` is decreasing, and C3.1's mixed derivative `∂_s∂_t S < 0` corresponds to the positive mixed derivative of `L` in §3.1.
- The image measure of `μ_A` under `Ψ` is `volume ⊗ Lebesgue`, the measure C3.1 shows `β` preserves.
- `δ = π/2` gives the diameters, of type `(1, 2)`; `δ = 2π/3` gives the triangle traversed backwards, type `(2, 3)`.
- `δ = π√2/2` gives no periodic orbit.
- At `δ = π/3`, `v = 1/2` gives increment `2Rπ/3` and type `(1, 3)`. The perimeter of the orbit is `3 · 2R sin(π/3) = 3√3 R`.

### Examples

The circle (explicit map), the ellipse (2-periodic orbits along the axes) and the `C¹` circle–ellipse table (a homeomorphism that is not `C¹`).

### Dependencies

Layer 1; SymplecticGeometry/CotangentLagrangian C3.1 (comparison and circular examples in §2.5).

## Layer 3: Generating function and invariant measure

### 3.1 The chord length

Define `L(s, s₁) = |γ(s₁) − γ(s)|` on `{(s, s₁) : s < s₁ < s + ℓ}`. Prove that it is `C^k` there, invariant under `(s, s₁) ↦ (s + ℓ, s₁ + ℓ)`, and that at `s₁ = F₁(s, δ)`: `∂L/∂s = −cos δ` and `∂L/∂s₁ = cos δ₁`; for `k ≥ 2`, `∂²L/∂s∂s₁ = sin δ sin δ₁ / L > 0` (BialyMironov2022 lines 159–161 and 182–185; Tabachnikov2005, Chapter 3). *Needs:* §2.1.

**Checks.**

- Circle: `L(s, s₁) = 2R sin((s₁ − s)/(2R))`, `∂L/∂s₁ = cos δ`, and `∂²L/∂s∂s₁ = sin δ/(2R) = sin²δ/L`.
- The sign: C3.1's generating function `−L` has negative mixed derivative, `−sin δ sin δ₁/L`.
- `L` is not differentiable on the diagonal `s₁ = s`, where it behaves like `|s₁ − s|`; its one-sided derivative in `s₁` there is `+1`, which is the derivative used in §6.3.

### 3.2 Exactness and the Jacobian

Prove, for `k ≥ 2`, that along the graph of the lift `cos δ₁ ds₁ − cos δ ds = d(L ∘ (s, F₁))`, that is `∂_s(L(s, F₁)) = cos δ₁ ∂_s F₁ − cos δ` and `∂_δ(L(s, F₁)) = cos δ₁ ∂_δ F₁`, and that `det DF(s, δ) = sin δ / sin δ₁` (BialyMironov2022 lines 182–185). In the coordinates `(s, y)`, `y = −cos δ`, this is `F*(y ds) − y ds = −d(L ∘ (s, F₁))`, so the generator in IntegrableSystems I5.0's convention is `−L`. *Needs:* §3.1, §2.2; SymplecticGeometry/IntegrableSystems I5.0 (sign convention only).

**Checks.**

- Circle: `det DF = det [[1, 2R], [0, 1]] = 1 = sin δ / sin δ`.
- Ellipse `(2 cos u, sin u)` at the 2-periodic state `(2, 0)`, `δ = π/2`: `δ₁ = π/2` and `det DF = 1`.
- A wrong Jacobian `sin δ₁ / sin δ` would make `T` preserve `dδ ds / sin δ`, of infinite total mass. The circle does not distinguish the two; the ellipse does: at the state of `(2 cos u, sin u)` at `(2, 0)` with `δ = π/4` the exit point is `(6/5, 4/5)` (chord length `4√2/5`), `cos δ₁ = 11/√146`, `sin δ₁ = 5/√146`, so `det DF = sin δ / sin δ₁ = √73/5 ≈ 1.709`, while the wrong formula gives `5/√73 ≈ 0.585`.

### 3.3 The invariant measure

Define `phaseMeasure ℓ`, the measure `μ_A` on `AddCircle ℓ × ℝ`: the product of the Haar measure `volume` of `AddCircle ℓ` with the restriction of Lebesgue measure to `(0, π)` with density `sin δ`. Prove `ConvexTable.measurePreserving_billiardMap`: for a table `γ` of class `C^k` with `k ≥ 2`, `MeasureTheory.MeasurePreserving (ConvexTable.billiardMap γ) μ_A μ_A`. This includes measurability of the total map, which is continuous on `A` and, off `A`, continuous on each of the Borel pieces `δ ∈ (π, 2π) ∪ {0}` modulo `2π` (exit parameter `s`) and `δ ≡ π` (exit parameter `0`) (BialyMironov2022, Section 2, p. 4, lines 159–164 and 182–185, gives the smooth invariant form; the finite-regularity measure transport is constructed here). Route: the Jacobian identity of §3.2 and change of variables on the fundamental domain `[0, ℓ) × (0, π)`, with `AddCircle.measurePreserving_mk`; `μ_A` does not see the values off `A`. *Needs:* §3.2; Mathlib `MeasureTheory.lintegral_image_eq_lintegral_abs_det_fderiv_mul`, `AddCircle.measurePreserving_mk`, `AddCircle.measure_univ`, `MeasureTheory.Measure.withDensity`.

API:

- `μ_A` has total mass `2ℓ`, is finite, is concentrated on `A` (the complement of `A` is null) and has full support on `A`.
- Its image under `Ψ(s, δ) = (s, cos δ)` is `volume ⊗ Lebesgue` on `AddCircle ℓ × (−1, 1)`.
- It is invariant under the time reversal `I` and under the rotations `(s, δ) ↦ (s + c, δ)`.

**Checks.**

- `μ_A(A) = ℓ · ∫₀^π sin δ dδ = 2ℓ`.
- Lebesgue measure `dδ ds` is not invariant for the ellipse `(2 cos u, sin u)`: at the state at `(2, 0)` with `δ = π/4` the Jacobian is `√73/5 ≈ 1.709 ≠ 1` (§3.2), while `sin δ dδ ds` is preserved because `sin δ₁ · √73/5 = (5/√146)(√73/5) = 1/√2 = sin δ`.
- For `k = ∞` this is C3.1's measure statement read through §2.5.

### Examples

The circle, where every computation is explicit; the ellipse at its axes.

### Dependencies

Layers 1–2.

## Layer 4: Twist maps of the annulus

### 4.1 Twist lifts

Fix `ℓ > 0` and real numbers `a < b`. Define `IsTwistLift ℓ F` for a homeomorphism `F` of the closed strip `ℝ × [a, b]` (a homeomorphism of `ℝ × Set.Icc a b`): `F(x + ℓ, y) = F(x, y) + (ℓ, 0)`; `F` maps each boundary line `y = a`, `y = b` into itself; and `y ↦ F₁(x, y)` is strictly increasing for every `x` (positive topological twist). A negative twist lift is the same with strictly decreasing; for an open interval `J` with endpoints `−∞ ≤ a < b ≤ ∞`, the twist condition on the open strip `ℝ × J` replaces the boundary lines by the ends: `F₂(x, y) → a` as `y → a` and `→ b` as `y → b`, uniformly in `x`. A monotone twist map is a `C¹` diffeomorphism of an open strip with these properties and `∂F₁/∂y > 0` everywhere (KatokHasselblatt1995, Section 9.2; Herman1983, Chapitre I, 1.2, lines 149–155, for the derivative form, a diffeomorphism turning the vertical).

*Needs:* Mathlib `Homeomorph`, `AddCircle` and the quotient topology; elementary order properties of intervals.

API:

- A twist lift descends to a homeomorphism of the annulus `AddCircle ℓ × [a, b]` isotopic to the identity, hence orientation preserving; it maps each boundary line onto itself (its restriction there is an equivariant injective continuous map of `ℝ`).
- The inverse of a positive twist lift is a negative twist lift, and conversely; so a homeomorphism is a negative twist lift exactly when its inverse satisfies `IsTwistLift`. For an explicitly chosen decreasing homeomorphism `r : J ≃ₜ J`, conjugating by `I_r(x, y) = (x, r(y))` exchanges positive and negative topological twists. For finite endpoints one may take `r(y) = a + b − y`; preservation of the differentiable twist condition additionally requires `r` to be a `C¹` diffeomorphism.
- Composition with a deck translation `τ_ℓ^m` keeps the twist property; the composite of two positive twist lifts is not in general a twist lift.
- A positive topological twist lift deviates the verticals in the sense of Herman1983, Appendice, line 1130: the image of every vertical crosses every vertical it meets in its interior transversally, from left to right.

**Checks.**

- The shear `(x, y) ↦ (x + y, y)` on `ℝ × Icc 0 1` (with `ℓ = 1`) is a positive twist lift; its inverse `(x − y, y)` is a negative one.
- The rigid rotation `(x + 1/4, y)` is not a twist lift: `F₁` is constant in `y`.
- The standard map `(x, y) ↦ (x + y + ε sin 2πx, y + ε sin 2πx)` on the open strip `ℝ × ℝ` (`ℓ = 1`) is a monotone twist map for every `ε` (`∂F₁/∂y = 1`), with Jacobian determinant `1`.
- On `J = (0, ∞)`, `F(x, y) = (x + log y, y)` preserves both ends and has `∂_yF₁ = 1/y > 0`. With `r(y) = 1/y`, the conjugate is `(x − log y, y)`, with derivative `−1/y < 0`; `a + b − y` is not real-valued here.

### 4.2 Area and exactness

For a continuous `ℓ`-periodic density `ρ > 0`, say that `F` preserves `ρ dx dy` when it preserves the measure `ρ dx dy` on the strip. Say that a monotone twist map is exact for the primitive `λ = g dx` (`g` of class `C¹`, `ℓ`-periodic, `∂_y g = ρ`) when `F*λ − λ = dS` for an `ℓ`-periodic `C¹` function `S`; then `ω = −dλ = ρ dx ∧ dy` and `F` preserves `ρ dx dy`. Put `Q : ℝ × J → D`, `Q(x, y) = (x, F₁(x, y))`, where `D = {(x, X) : X ∈ F₁(x, J)}` is its image. The strict differential twist makes `D` open and `Q` a `C¹` diffeomorphism onto `D`. Equivalently, `h = S ∘ Q⁻¹ : D → ℝ` is a generating function, so `S = h ∘ Q`, `g(x, y) = −∂₁h(x, F₁(x, y))` and `g(F(x, y)) = ∂₂h(x, F₁(x, y))`; `h` is invariant under diagonal deck translation. This is the endpoint-coordinate construction here from the primitive (Herman1983, Chapitre I, §4.3, Remarque, printed p. 27, lines 762–769, supplies the globally canonical setting).

*Needs:* §4.1; differential pullback, the exterior derivative and change of variables on the real strip.

API:

- Exactness implies area preservation (`d(F*λ − λ) = 0`); for `ρ ≡ 1` and `g = y` this is IntegrableSystems I5.0's convention.
- Exactness is invariant under fibre-preserving changes of coordinates `(x, y) ↦ (x, φ(x, y))` that transport `λ`.
- Area preservation alone does not imply exactness on the open strip: the shifted shear `(x, y) ↦ (x + y, y + c)`, `c ≠ 0`, of `ℝ × ℝ` is a monotone twist map preserving `dx dy` and is not exact (its flux `c` is nonzero).

**Checks.**

- The shear `(x + y, y)` on `ℝ²` is exact with `S = y²/2`: `F*(y dx) − y dx = y dy`. Here `D = ℝ²`, `Q⁻¹(x, X) = (x, X − x)` and `h(x, X) = (X − x)²/2`; at `(x, X) = (1, 2)`, `−∂₁h = ∂₂h = 1` and `S(1, 1) = h(1, 2) = 1/2`. Composing with `Q` instead would give derivatives `−3, 3`.
- For the standard map, with `Y = y + ε sin 2πx`, `F*(y dx) − y dx = ε sin(2πx) dx + d(Y²/2)`, exact with the periodic primitive `S = −ε cos(2πx)/(2π) + Y²/2` because `∫₀¹ ε sin 2πx dx = 0`.
- `(x + y, y + c)` with `c ≠ 0` gives `F*(y dx) − y dx = (y + c)(dx + dy) − y dx`, whose integral over the closed curve `y = 0`, `x ∈ [0, 1]` is `c ≠ 0`: not exact.

### 4.3 The billiard map is a twist map

Prove that for every table the extension of §2.3 of the billiard lift is a positive twist lift on `ℝ × [0, π]` (`IsTwistLift ℓ` with `a = 0`, `b = π`), and for `k ≥ 2` that the lift is an exact area-preserving monotone twist map in the coordinates `(s, δ)` on the open strip, with `ρ = sin δ`, `g = −cos δ`, `S = −L ∘ (s, F₁)`, and in the coordinates `(s, y)`, `y = −cos δ`, with `ρ = 1`; in C3.1's `(s, v)` it is a negative twist (KatokHasselblatt1995, Section 9.2). *Needs:* §2.2, §2.3, §3.2.

**Checks.**

- Circle: `∂s₁/∂δ = 2R` and `∂s₁/∂y = 2R/sin δ`, both positive; `∂s₁/∂v = −2R/sin δ`.
- Exactness on the circle: `S = −2R sin δ`, and `∂_δ S = −2R cos δ = g(F) ∂_δ F₁ = −cos δ · 2R`.
- The normalisation `s < s₁ < s + ℓ` is the one for which the boundary maps are the identity and `τ_ℓ`; the lift `τ_ℓ^{−1} ∘ F` is also a twist lift, with boundary maps `τ_ℓ^{−1}` and the identity.

### 4.4 The non-wandering set

Define `nonwanderingSet f` for a self-map `f` of a topological space: the points `x` such that every neighbourhood `U` of `x` meets its image `f^n(U)` under some iterate with `n ≥ 1` (Herman1983, Chapitre I, 3.4.3, lines 425–432).

API:

- It is closed and, for a homeomorphism `f`, `f`-invariant; it contains every periodic point.
- If `f` preserves a finite Borel measure of full support on a second-countable space, every point is non-wandering (SymplecticGeometry/CotangentLagrangian C3.1, finite-volume recurrence; Herman1983, Chapitre I, 3.4.4, line 434).
- If every point of a dense invariant open subset is non-wandering, so is every point of its closure.
- For a homeomorphism `f`, the non-wandering set of `f⁻¹` equals that of `f`.

**Checks.**

- For a table of class `C^k`, `k ≥ 2`, every point of `Ā` is non-wandering for the closed-cylinder extension `T̄` of §2.3 (interior points by §3.3 and recurrence, boundary points as fixed points).
- For the map `(x, y) ↦ (x, y²)` of `AddCircle 1 × [0, 1]` only the two boundary circles are non-wandering.
- For the translation `x ↦ x + 1` of `ℝ` the non-wandering set is empty.

*Needs:* Mathlib `MeasureTheory.MeasurePreserving.conservative`, `MeasureTheory.Conservative.ae_frequently_mem_of_mem_nhds`; SymplecticGeometry/CotangentLagrangian C3.1.

### Examples

The shear, the standard map, the billiard map of the circle and of the ellipse.

### Dependencies

Mathlib; Layers 2–3 for §4.3; SymplecticGeometry/CotangentLagrangian C3.1 for §4.4.

## Layer 5: Rotational invariant curves

### 5.1 Definition

Define `IsRotationalInvariantCurve f C` for a self-map `f` of an annulus `AddCircle ℓ × Y`, `Y` a topological space (in the applications an interval, `[a, b]` or `ℝ`): `f(C) = C` and `C` is the image of a continuous injective map `c : Circle → AddCircle ℓ × Y` that is not `ContinuousMap.Nullhomotopic` (BialyMironov2022 lines 103–104). The curves of interest lie in an open annulus `AddCircle ℓ × (a, b)` inside `AddCircle ℓ × Y`; null-homotopy in `AddCircle ℓ × Y` and in that open annulus agree, since both deformation retract onto a circle `AddCircle ℓ × {y₀}`.

API:

- Let `Y` be an interval containing `(a, b)` and `C ⊆ AddCircle ℓ × (a, b)`. Then `C` is compact, contained in `AddCircle ℓ × [a′, b′]` for some `a < a′ ≤ b′ < b`, and its first coordinate has degree `±1`.
- In the same setting, the complement of `C` in the open annulus has exactly two components, the lower one containing `AddCircle ℓ × Ioo a a′` and the upper one, both with frontier `C`; when `f` preserves each end (as the maps of §4.1 do) both components are `f`-invariant. Route: embed the annulus in `ℂ ∖ {0}` by `(x, y) ↦ (1 + y − a) exp(2πix/ℓ)` and use the Jordan curve theorem.
- If `C` is invariant under `f`, then `I(C)` is invariant under `I ∘ f ∘ I`, for every fibre reflection `I`.

**Checks.**

- Every circle `δ = c` is a rotational invariant curve of the circular billiard.
- A small circle around a point of the annulus is null-homotopic and is not rotational.
- The union of two circles `δ = c₁` and `δ = c₂` is invariant but is not the image of an injective map of `Circle`.

*Needs:* Mathlib `ContinuousMap.Nullhomotopic`; Tau Ceti `TauCeti.IsJordanCurve.natCard_connectedComponents_compl_eq_two`, `TauCeti.IsJordanCurve.frontier_connectedComponentIn`.

### 5.2 The Birkhoff–Fathi theorem on invariant regions

Let `H` be an orientation-preserving homeomorphism of `AddCircle ℓ × Ico a b` preserving the boundary circle, whose lift deviates the verticals (in particular, any restriction of a positive or negative twist lift of §4.1). Let `U` be an open subset, relatively compact, homeomorphic to `AddCircle ℓ × Ico 0 1`, with `H(U) = U` and `U ⊆ nonwanderingSet H`. Prove that the frontier of `U` is the graph of a continuous function `AddCircle ℓ → Ioo a b` (Herman1983, Appendice au Chapitre I, Théorème de Birkhoff, printed p. 41, lines 1150–1154; proof printed pp. 42–46, lines 1159–1287). Route (Fathi): let `V` be the points of `U` reached from the boundary circle by vertical segments in `U`. The frontier of `V` in `U` is a disjoint union of open vertical segments, each cutting off a component of `U ∖ closure V` homeomorphic to a disc, which lies to the right or to the left of its segment; a path from the boundary enters a right component only by crossing from left to right. Images of verticals under `H` cross verticals in one direction only, so one of `H(V)`, `H⁻¹(V)` meets no left component and the other no right one; hence one of `H`, `H⁻¹` maps the closure in `U` of the union of right components into that union, and the other does the same for left components, properly if the union is nonempty, which produces wandering points. So `U = V`, and two frontier points on one vertical would force a vertical frontier segment whose neighbours `H` and `H⁻¹` move to opposite sides. *Needs:* §4.1, §4.4; Tau Ceti `TauCeti.IsJordanCurve.exists_homeomorph_image_sphere`, `Path.IsCrosscut.natCard_connectedComponents_sdiff_range_eq_two`.

**Checks.**

- For the shear on `AddCircle 1 × [0, 2)` and `U = AddCircle 1 × [0, 1)` the frontier is the graph of the constant `1`.
- The twist hypothesis is needed: the curve `t ↦ (t + 0.1 sin 8πt, 1 + 0.1 sin 8πt)` in `AddCircle 1 × (0, 2)` is simple and essential (two points at the same height have equal `sin 8πt`, hence equal `x − t`), invariant under `x ↦ x + 1/4`, and not a graph (`dx/dt = 1 + 0.8π cos 8πt < 0` near `cos 8πt = −1`); the region below it is invariant under the rotation `(x + 1/4, y)`, which preserves area and has every point non-wandering but is not a twist.
- The relative compactness is needed: `U = AddCircle 1 × [0, 2)` itself is invariant under the shear and has empty frontier in `AddCircle 1 × [0, 2)`.

### 5.3 Birkhoff's graph theorem

Prove `isGraph_of_isRotationalInvariantCurve`: let `ℓ > 0`, `a < b`, and let `H` be a homeomorphism of the closed annulus `AddCircle ℓ × [a, b]` with a lift `F`, a homeomorphism of `ℝ × [a, b]` with `H(x mod ℓ, y) = (F₁(x, y) mod ℓ, F₂(x, y))`, such that `F` is a positive twist lift or a negative one (that is, `IsTwistLift ℓ F` or `IsTwistLift ℓ F⁻¹`), and such that every point of the open annulus is non-wandering for `H`. Then every rotational invariant curve `C` of `H` contained in the open annulus `AddCircle ℓ × (a, b)` is the graph `{y = ψ(x)}` of a continuous `ψ : AddCircle ℓ → (a, b)` (Herman1983, Appendice au Chapitre I, Théorème de Birkhoff, printed p. 41, lines 1150–1154; KatokHasselblatt1995, Chapter 13). Route: for a negative twist apply the positive case to `H⁻¹`, which has the same invariant curves and the same non-wandering set; the boundary circles are non-wandering too, since the non-wandering set is closed. Apply §5.2 to `H` on `AddCircle ℓ × [a, b)` and the lower component `U` of §5.1, which is `H`-invariant because `H` preserves `C` and the lower boundary circle; `U` is homeomorphic to `AddCircle ℓ × [0, 1)` by the annulus theorem in dimension two (the embedded circle `C` is locally flat by Schoenflies), and its frontier is `C`. *Needs:* §4.1, §4.4, §5.1, §5.2; GeometricTopology §2.3.

Prove the Lipschitz refinement: if moreover `F` restricts to a monotone twist map on the open strip, `ψ` is Lipschitz, with Lipschitz constant at most the maximum over the points `q` of `C` of `|∂_yF₂(q)/∂_yF₁(q)|` and `|∂_y(F⁻¹)₂(q)/∂_y(F⁻¹)₁(q)|` (Herman1983, Chapitre I, 2.2 and 5.2, lines 188–251 and 803–807; used in BialyMironov2022 lines 261–263). Route: at `p ∈ C` the curve `F(vertical through F⁻¹(p))` crosses `C` only at `p` and is tangent there to a line of slope `∂_yF₂/∂_yF₁`; `C` lies below it to the right of `p`, which bounds the upper right Dini derivative of `ψ`; the same with `F⁻¹` bounds the lower one, and a continuous function with bounded Dini derivatives is Lipschitz. *Needs:* the graph theorem above; §4.1.

Prove `ConvexTable.exists_lipschitzWith_of_isRotationalInvariantCurve`: for a table `γ` of class `C^k`, `k ≥ 2`, every rotational invariant curve `C ⊆ A` of `ConvexTable.billiardMap γ` is the graph `{δ = ψ(s)}` of a Lipschitz function `ψ : AddCircle ℓ → ℝ` (BialyMironov2022, Section 3, p. 6, lines 261–263, which also uses the graph property in the coordinate `cos δ`). Route: by §4.4 every point of `Ā` is non-wandering for `T̄`; apply the graph theorem and its Lipschitz refinement to `T̄` with the twist lift of §4.3. Since `cos` is bi-Lipschitz on each compact subinterval of `(0, π)` and `ψ` takes values in one, `C` is also the graph of a Lipschitz function in the coordinates `(s, cos δ)`. *Needs:* §2.3, §4.3, §4.4, and the two theorems above.

**Checks.**

- The circles `δ = c` of the circular table are graphs of constants, Lipschitz constant `0`.
- Bound for the circular table: `∂_δF₂/∂_δF₁ = 1/(2R)` and `∂_δ(F⁻¹)₂/∂_δ(F⁻¹)₁ = −1/(2R)`, since both second components are `δ`. The absolute maximum is `1/(2R)`, a nonsharp bound for the constant graphs: `0 ≤ 1/(2R)`, or `0 ≤ 1/2` for `R = 1`.
- The non-graph essential curve of the second Check of §5.2 is invariant under the rotation by `1/4`, which is not a twist: the twist hypothesis is what excludes it.

### 5.4 Rotation numbers

For a rotational invariant curve `C` that is the graph of `ψ`, and the twist lift `F`, define `g(x) = F₁(x, ψ(x))`. Prove that `x ↦ g(ℓx)/ℓ` is a continuous strictly increasing `CircleDeg1Lift`, and define the rotation number `ρ(C)` as its `translationNumber`. Prove: `(F₁ⁿ(x, ψ(x)) − x)/(nℓ) → ρ(C)` for every `x`; for the normalised billiard lift `ρ(C) ∈ (0, 1)` (strictly); `ρ(I(C)) = 1 − ρ(C)` for the time reversal of §2.4; and, for a positive twist, if `ψ₁ < ψ₂` are two invariant graphs then `ρ(C₁) ≤ ρ(C₂)`, strictly when `F` preserves a measure with continuous positive density (Herman1983, Chapitre I, 2.4.2 and 2.4.4, lines 277–319, for Lebesgue measure). Route: `ρ ∈ (0, 1)` because `g(x) − x` is continuous, `ℓ`-periodic and valued in `(0, ℓ)`, hence in `[εℓ, (1 − ε)ℓ]`; time reversal from `I ∘ F ∘ I = τ_ℓ ∘ F⁻¹` and `CircleDeg1Lift.translationNumber_units_inv`; monotonicity from `∂_yF₁ > 0` and `CircleDeg1Lift.translationNumber_mono`. *Needs:* §5.3, §2.4; Mathlib `CircleDeg1Lift.tendsto_translationNumber`, `CircleDeg1Lift.translationNumber_units_inv`, `CircleDeg1Lift.translationNumber_mono`, `CircleDeg1Lift.translationNumber_le_of_le_add`, `CircleDeg1Lift.le_translationNumber_of_add_le`.

API:

- The rotation number depends only on `C` and the chosen twist lift; changing the lift by `τ_ℓ^m` adds `m`.
- It is invariant under conjugating `F` by a fibre-preserving homeomorphism commuting with `τ_ℓ`, which maps invariant graphs to invariant graphs.
- For `ρ(C) ∉ ℚ` the restriction of `T` to `C` has no periodic orbit; for `ρ(C) = p/q` it has one of type `(p, q)` (§5.5).

**Checks.**

- Circular table: `ρ(δ = c) = 2Rc/ℓ = c/π`; `δ = π/3` gives `1/3`.
- Time reversal: `δ = π/3` goes to `δ = 2π/3`, with rotation number `2/3 = 1 − 1/3`.
- With the lift `τ_ℓ^{−1} ∘ F` instead of the normalised one, the rotation numbers shift by `−1` into `(−1, 0)`; the statement `ρ ∈ (0, 1)` pins the normalisation.

### 5.5 Rational invariant curves

Prove: if `ρ(C) = p/q` in lowest terms (`q ≥ 1`), then `C` contains a periodic orbit of type `(p, q)`; and if the restriction of `T` to `C` preserves a Borel probability measure on `C` of full support, every orbit on `C` is periodic of type `(p, q)` (BialyMironov2022 lines 116–119). Route: `CircleDeg1Lift.translationNumber_eq_rat_iff` for the first statement; for the second, every invariant probability measure of a circle homeomorphism with rotation number `p/q` is supported on the closed set of solutions of `g^q(x) = x + pℓ`, since on each complementary interval the map `g^q − pℓ` moves points monotonically and the fundamental intervals of that motion are disjoint of equal measure. *Needs:* §5.4; Mathlib `CircleDeg1Lift.translationNumber_eq_rat_iff`.

**Checks.**

- Circular table, `δ = π/2`: every point of the curve is of type `(1, 2)`.
- Circular table, `δ = π√2/2`: rotation number `√2/2`, no periodic orbit.
- For a circle homeomorphism with rotation number `0` having exactly two fixed points, the measure `(δ_{x₁} + δ_{x₂})/2` is invariant but not of full support, and the non-fixed points are not periodic: the full-support hypothesis is needed.

### 5.6 The circular table, totally integrable

Prove that the phase cylinder of the circular table is foliated by the rotational invariant curves `δ = c`, `c ∈ (0, π)`, with rotation numbers `c/π`, and that these are all its rotational invariant curves. (Tabachnikov2005, Chapter 3). *Needs:* §2.5, §5.3, §5.4; SymplecticGeometry/CotangentLagrangian C3.1 (circular formula).

**Checks.**

- The rotation number is a homeomorphism `(0, π) → (0, 1)`, `c ↦ c/π`.
- The curve `δ = c + ε sin(2πs/ℓ)`, `0 < |ε| < min(c, π − c)`, is not invariant: its point `(ℓ/4, c + ε)` is sent to `(ℓ/4 + 2R(c + ε), c + ε)`, where the curve has height `c + ε sin(π/2 + 2(c + ε)) = c + ε cos(2(c + ε)) ≠ c + ε` because `0 < c + ε < π`.
- The total measure of the curves with rotation number in `(0, 1/2)` is `μ_A(δ < π/2) = ℓ`.

### Examples

The circular table (all curves explicit); for the ellipse the curves are the confocal caustics, which this roadmap does not construct.

### Dependencies

Layers 2–4; GeometricTopology §2.3; Tau Ceti plane topology.

## Layer 6: Birkhoff periodic orbits

### 6.1 Configurations of type `(p, q)`

For coprime integers `0 < p < q`, let `D_{p,q}` be the open set of sequences `(s_j)_{j ∈ ℤ}` with `s_{j+q} = s_j + pℓ` and `0 < s_{j+1} − s_j < ℓ`, identified with an open subset of `ℝ^q`, and `D̄_{p,q}` its closure (gaps in `[0, ℓ]`). The shift `σ(s)_j = s_{j+1}` and the diagonal translation `d(s)_j = s_j + ℓ` generate a group `Γ ≅ ℤ` (because `σ^q = d^p` and `gcd(p, q) = 1`) acting freely and properly on `D_{p,q}`, and `D_{p,q}/Γ` is homotopy equivalent to a circle. Define the perimeter `W(s) = Σ_{j=0}^{q−1} L(s_j, s_{j+1})`, which is `Γ`-invariant, continuous on `D̄_{p,q}` and `C^k` on `D_{p,q}` (KatokHasselblatt1995, Section 9.3).

*Needs:* §3.1; finite-dimensional topology and the cyclic shift action.

API:

- `σ^q = d^p`, and `Γ = ⟨σ, d⟩` is infinite cyclic and acts freely and properly on `D_{p,q}`; `D_{p,q}/Γ` is homotopy equivalent to a circle.
- `W` is `Γ`-invariant, continuous on `D̄_{p,q}` and `C^k` on `D_{p,q}`, with `∂W/∂s_j` given in §6.2.
- `D̄_{p,q}/⟨d⟩` is compact, so `W` attains its maximum.

**Checks.**

- `p/q = 1/2`: `D_{1,2}` is `{(s₀, s₁) : s₀ < s₁ < s₀ + ℓ}` up to the periodicity, and `W = 2L(s₀, s₁)`.
- `p/q = 2/3` on the unit circle: the backwards triangle `s_j = 4πj/3` has gaps `4π/3 ∈ (0, 2π)` and `W = 3√3`.
- `p = q` is excluded: the gaps would all equal `ℓ`, a degenerate configuration.

### 6.2 The billiard chain dictionary at regularity `C^k`

Define `ConvexTable.IsPeriodicConfiguration γ p q s`, for a table `γ`, natural numbers `p`, `q` and `s : ℤ → ℝ`: `s_{j+q} = s_j + pℓ` and `s_j < s_{j+1} < s_j + ℓ` for every `j`, and the reflection law holds at every vertex: writing `u_j = (γ(s_{j+1}) − γ(s_j))/|γ(s_{j+1}) − γ(s_j)|` for the unit chord, `⟨u_{j−1}, τ(s_j)⟩ = ⟨u_j, τ(s_j)⟩`. For coprime `0 < p < q` the first two conditions say `s ∈ D_{p,q}`. Since `u_{j−1}` points out of `Ω` at `γ(s_j)` and `u_j` into it (strict convexity), equal tangential components make `u_j` the mirror image of `u_{j−1}` in the tangent line (KatokHasselblatt1995, Section 9.3; this finite-regularity dictionary uses §3.1).

*Needs:* §3.1, §6.1.

API:

- Invariance under `Γ`: if `s` is a periodic configuration of type `(p, q)`, so are `j ↦ s_{j+m} + nℓ` for all integers `m`, `n`.
- The dictionary, for `k ≥ 1`: a point `s ∈ D_{p,q}` is a critical point of `W` exactly when it is a periodic configuration of type `(p, q)`. Route: `∂W/∂s_j = ∂₂L(s_{j−1}, s_j) + ∂₁L(s_j, s_{j+1}) = ⟨u_{j−1}, τ(s_j)⟩ − ⟨u_j, τ(s_j)⟩ = cos δ′_j − cos δ_j` by §3.1, where `δ′_j` is the angle of the incoming chord. This is the billiard case of SymplecticGeometry/CotangentLagrangian C3.1's chain dictionary, proved here at regularity `C^k` because C3.1's generating functions are smooth.
- For a periodic configuration, the states `x_j = (s_j, δ_j)`, with `δ_j` the angle of the chord from `γ(s_j)` to `γ(s_{j+1})`, satisfy `F(x_j) = x_{j+1}`; for coprime `0 < p < q`, `x₀` is periodic of type `(p, q)` and of least period `q` on `A`.
- Two periodic configurations give the same orbit on `A` exactly when they differ by an element of `Γ`, that is, when `s′_j = s_{j+m} + nℓ` for some `m`, `n` and all `j`.

**Checks.**

- Unit circle, `(1, 3)`: the equilateral configuration `s_j = 2πj/3` has, at the vertex `1`, tangential components `⟨u_{−1}, i⟩ = ⟨u_0, i⟩ = 1/2`, so it is a periodic configuration; the configuration `(0, π/2, π)` has gaps `π/2, π/2, π` and at `s = 0` components `0` (incoming chord from `−1`, a diameter) and `1/√2`, with angles `π/2` and `π/4`: not a periodic configuration and not critical.
- The diameter configuration `s_j = jπ` of type `(1, 2)` on the unit circle has both components `0` at every vertex: the chord is orthogonal to the tangent at both ends.
- The strict gap conditions are what exclude collapsed configurations: for `(1, 3)` the sequence with `s₀ = s₁ = s₂ = 0`, `s₃ = ℓ` has all three chords `0` (`γ(ℓ) = γ(0)`), the totalised normalisation reads each `u_j` as the zero vector, and the reflection law alone would hold as `0 = 0` at every vertex.
- Least period: if `F^m(x₀) = x₀ + (jℓ, 0)` with `m < q`, then `m | q` and `(q/m) j = p`, contradicting coprimality.
- Without the identification by `Γ`, the configuration and its shift `σ(s)` would be counted as two orbits.

### 6.3 The maximal orbit

Prove that `W` attains its maximum on `D̄_{p,q}` only at points of `D_{p,q}`, so that every maximiser gives a periodic orbit of type `(p, q)` (KatokHasselblatt1995, Section 9.3; Birkhoff's construction). Route: the maximum exists since `D̄_{p,q}/⟨d⟩` is compact; first exclude wholly collapsed configurations, where `W = 0`, because every interior configuration has positive perimeter. At any remaining boundary configuration, take an endpoint of a maximal cyclic run of geometrically coincident vertices adjacent to a nondegenerate chord. If the collapsed gap before that endpoint is `0`, increase its parameter slightly; if it is `ℓ`, decrease it slightly. The collapsed chord gains length at rate `1`, while the change of the adjacent nondegenerate chord has absolute rate strictly less than `1` by §3.1. Thus `W` increases at rate `1 ± cos δ > 0`, with the sign determined by the allowed variation, and both affected gaps stay in `[0, ℓ]`. If the collapsed gap follows the endpoint, use the reversed parameter variation. This refines C3.1's `exists_billiard_periodic_reflection` by the winding number `p` and lowers the regularity to `C¹`. *Needs:* §6.1, §6.2.

**Checks.**

- Unit circle: the maximum of `W` on `D_{1,3}` is `3√3`, attained at the equilateral triangles; on `D_{1,2}` it is `4`, at the diameters.
- Ellipse `(2 cos u, sin u)`, `(1, 2)`: the maximum `W = 8` is attained at the major axis.
- The maximum over all inscribed `4`-gons without the winding constraint is attained at a doubled diameter (`W = 8` on the unit circle, C3.1), which is of type `(2, 4)`, not `(1, 4)`; on `D_{1,4}` the maximum is the square, `W = 4√2`.
- For `(p, q) = (1, 3)`, `(s₀, s₁, s₂, s₃) = (0, 0, 0, ℓ)` has gaps `0, 0, ℓ` and `W = 0`, below `3√3` for the interior equilateral configuration on the unit circle. With equal-gap interpolation, `W′(0+) = 4ℓ/3 > 0`.

### 6.4 The second orbit

Prove `ConvexTable.exists_two_periodic_orbits`: for every table of class `C^k`, `k ≥ 1`, and coprime `0 < p < q`, there are two periodic configurations `s`, `s′` of type `(p, q)` (`ConvexTable.IsPeriodicConfiguration γ p q s` and the same for `s′`) not related by `Γ`: for all integers `m`, `n` there is a `j` with `s′_j ≠ s_{j+m} + nℓ`. By §6.2 these are two disjoint periodic orbits of type `(p, q)` on `A`; the route produces one as a maximiser of `W` (§6.3) and the other as a minimax critical point (KatokHasselblatt1995, Section 9.3). Route: (i) critical configurations have all gaps in `[ε₁, ℓ − ε₁]` for some `ε₁ > 0`: along an orbit a small angle stays small for `q` steps by §2.3, and `q` small gaps cannot add up to `pℓ`; (ii) for `0 < ε < ε₁` small, on the compact set `P_ε = {s : ε ≤ s_{j+1} − s_j ≤ ℓ − ε}/Γ`, which is homotopy equivalent to a circle, there is a locally Lipschitz vector field `V` with `dW(V) > 0` off the critical set and pointing into `P_ε` on its boundary: near boundary limits of positive perimeter, use the run-end variations of §6.3, including both gaps near `0` and gaps near `ℓ`. At a wholly collapsed boundary limit all gaps `d_j` are `0` or `ℓ`, exactly `p` of them equal `ℓ`. The gap deformation `d_j(t) = (1 − t)d_j + t pℓ/q` points strictly inward and has right derivative `dW/dt = 2p(q − p)ℓ/q > 0` at `t = 0`, by unit speed. In the run-end case add a sufficiently small multiple of the equal-gap inward direction to enter all active gap faces. These two cases give local increasing inward fields on the nearby truncated boundaries; compactness and a partition of unity combine them, with a pseudo-gradient away from the boundary; (iii) the forward flow of `V` maps `P_ε` into itself; its maximal invariant subset `S` is compact, the restriction `Ȟ¹(P_ε; ℝ) → Ȟ¹(S; ℝ)` is injective by continuity and homotopy invariance, so `cl(Ȟ*(S; ℝ)) ≥ 1`; (iv) by the cup-length bound with Lyapunov function `−W`, `V` has two rest points in `S`, which are two critical points of `W` on `D_{p,q}/Γ`, hence two orbits by §6.2. *Needs:* §2.3, §6.1, §6.2, §6.3; SymplecticGeometry/IntegrableSystems I5.4.

**Checks.**

- Unit circle: every configuration with equal gaps `pℓ/q` is critical; the critical set on `D_{p,q}/Γ` is a whole circle, consistent with the bound of two.
- Ellipse `(2 cos u, sin u)`, `(1, 2)`: the two orbits are the major axis (`W = 8`, maximal) and the minor axis (`W = 4`, the minimax).
- Without the quotient by the shift `σ` the cup-length argument would give two critical points that may be one orbit marked at two vertices, as for the two endpoints of the major axis.
- At the wholly collapsed `(1, 3)` limit, the deformation of gaps `(0, 0, ℓ)` towards `(ℓ/3, ℓ/3, ℓ/3)` has `W′(0+) = 4ℓ/3`; the derivatives of nearby inward truncated-boundary variations tend to this positive value; the positive-perimeter run-end case instead has rate `1 ± cos δ > 0`. Neither case assumes a nondegenerate chord at a zero-perimeter limit.

### Examples

The circle (circles of critical configurations), the ellipse (axes), and the `C¹` circle–ellipse table, to which §§6.3–6.4 apply although its billiard map is not `C¹`.

### Dependencies

Layers 1–3; SymplecticGeometry/IntegrableSystems I5.4.

## Layer 7: Polygonal tables

### 7.1 The carrier

Define the polygonal table carrier, a structure over `ℂ` bundling: finitely many simple polygons `P₀, …, P_h` in `ℂ` (Tau Ceti `TauCeti.SimplePolygon ℝ ℂ`) with pairwise disjoint boundaries, and a compact set `P ⊆ ℂ` with connected nonempty interior, `P = closure (interior P)` and frontier `⋃ boundary Pᵢ`. The vertex set `V` is the union of the vertex sets; the sides are the edges `Polygon.edgeSet`. The interior angle `α_v ∈ (0, 2π)` at a vertex is measured inside `P` (ChernovMarkarian2006, Chapter 2; BoldrighiniKeaneMarchetti1978, Section 2).

API:

- Exactly one boundary component (the outer one) bounds a region containing `P`; the others bound the holes, and `P` is the outer filled region minus the open holes.
- The angle sum is `Σ_v α_v = (n − 2 + 2h)π` for `n` vertices and `h` holes.
- The relative interiors of distinct sides are disjoint; every point of the frontier off `V` lies in the relative interior of exactly one side, near which `P` is a half-disc.
- A simple polygon gives a table with `h = 0`, `P` the filled region of its boundary.

**Checks.**

- The unit square: `n = 4`, `h = 0`, angle sum `4 · π/2 = 2π`.
- The square `[0, 3]²` with the open hole `(1, 2)²`: `n = 8`, `h = 1`, angles `π/2` (four) and `3π/2` (four), sum `8π = (8 − 2 + 2)π`.
- Two closed squares meeting at a corner have a connected union whose frontier components are not disjoint: not a table.
- A simple polygon with a flat vertex (angle `π`) is a table; the flat vertex is a vertex.

*Needs:* Tau Ceti `Polygon.IsSimple`, `TauCeti.SimplePolygon`, `Polygon.IsSimple.isJordanCurve_boundary`; Mathlib `Polygon`.

### 7.2 Reflections and the phase space

For a side with unit direction `d` let `σ_S(v) = d² · conj v`. Define the phase space `Z_P` of the table as the type `(P × Circle)/∼`, where `(x, v) ∼ (x, σ_S v)` for `x` in the relative interior of `S`, with the quotient topology and σ-algebra, and the Liouville probability measure `μ_P`, the image of `(2π area P)⁻¹ Leb_P ⊗ dθ` (ChernovMarkarian2006, Chapter 2; BoldrighiniKeaneMarchetti1978, Section 2).

*Needs:* §7.1; Mathlib `AddCircle.homeomorphCircle'` and quotient measurable spaces.

API:

- The relation is an equivalence relation identifying at most two points; `J(x, v) = (x, −v)` descends because `σ_S(−v) = −σ_S(v)`.
- `μ_P` is a probability measure; the frontier states form a null set.
- `σ_S` depends only on the direction of `S` up to sign, is an involution of `Circle` and preserves `dθ`.

**Checks.**

- Horizontal side: `σ(v) = conj v`; vertical side (`d = i`): `σ(v) = −conj v`, sending `exp(iπ/4)` to `exp(i3π/4)`.
- Side at angle `π/4` (`d = exp(iπ/4)`): `σ(1) = i`.
- Unit square: `μ_P` of the states with position in `[0, 1/2]²` is `1/4`.

### 7.3 Trajectories and the corner bound

Define the trajectory of a state as the curve moving at unit speed along its direction, replacing `v` by `σ_S v` at relative interior points of sides, and stopping at a vertex or when it runs along a side. Prove: a trajectory makes finitely many reflections in every bounded time interval on which it meets no vertex; and a trajectory segment entering a corner of angle `α ∈ (0, 2π)`, within a disc around the vertex meeting only the two sides at it, leaves that disc after at most `⌈π/α⌉` reflections provided it avoids the vertex and does not run along a side (Tabachnikov2005, Chapter 7). Route: unfold the corner into a fan of copies of angle `α`; the unfolded straight line avoids the vertex and sees it under a total angle `π`, so it crosses at most the number of fan rays in an open interval of length `π`; away from corners consecutive reflections are on sides at distance bounded below. *Needs:* §7.1, §7.2.

**Checks.**

- `α = π/2`: an avoiding line in the unfolded fan crosses at most `2` rays; the corner segment has at most `2` reflections.
- `α = 2π/3`: rays at spacing `2π/3`, at most `2 = ⌈3/2⌉` in an open interval of length `π`.
- Reflex corner `α = 3π/2`: at most `1` reflection near the vertex.
- In the square corner, from `(ε, ε)` with velocity `−(1+i)/√2`, the trajectory reaches the vertex at time `√2 ε` with `0` reflections and stops. It does not escape; it is excluded by the avoiding hypothesis and remains singular in §8.1.

### Examples

The unit square, the equilateral triangle, the right triangle with angles `π/2, π/8, 3π/8`, the L-shaped hexagon, and the square with a square hole.

### Dependencies

Mathlib; Tau Ceti polygons.

## Layer 8: The singular set and the billiard flow

### 8.1 The singular set

Let `Σ ⊆ Z_P` be the states whose forward or backward trajectory reaches a vertex or runs along a side. Prove that `Σ` is Borel and `μ_P`-null and that its complement `X_P` is invariant under trajectories (ChernovMarkarian2006, Chapter 2; BoldrighiniKeaneMarchetti1978, Section 2). Route: for each finite itinerary of sides and each vertex, the states that reach the vertex along that itinerary form, for each fixed direction, a segment of positions (the preimage of the vertex under the unfolding affine isometry), so by Fubini a null Borel set; the itineraries are countable; states running along a side have position on the frontier. *Needs:* §7.3.

**Checks.**

- Unit square: the state `((1/2, 1/2), exp(iπ/4))` reaches the vertex `(1, 1)` and is singular; `((1/2, 1/4), exp(iπ/4))` is not.
- In the square every state with direction `1` (horizontal) and position on the bottom side runs along it and is singular.
- In the square, `Σ` is not closed: fix `x = (1/2, 1/4)` and let `v_n` be the unit vector towards `(n, n)` in the unfolding, `n ≥ 1`. Each line hits a lattice vertex and is singular, but `v_n → (1+i)/√2`; the limiting line has `y − x = −1/4`, meets no lattice vertex in either direction and is regular.

### 8.2 The flow

Define the billiard flow of the table as the action of `ℝ` on `Z_P` that moves a state of `X_P` along its trajectory for time `t` and fixes the states of `Σ`. Prove `F^{s+t} = F^s ∘ F^t`, `F⁰ = id`, joint measurability (`MeasurableVAdd₂`), and continuity of `(t, x) ↦ F^t x` on `ℝ × X_P` for the quotient topology. The trajectory action and its identity extension across `Σ` are the construction here in the polygonal billiard setting of ChernovMarkarian2006, Chapter 2, and BoldrighiniKeaneMarchetti1978, Section 2. *Needs:* §8.1; Mathlib `MeasurableVAdd₂`.

API:

- An action `AddAction ℝ Z_P` with `MeasurableVAdd₂ ℝ Z_P`.
- `X_P` and `Σ` are invariant; on `Σ` every `F^t` is the identity.
- `(t, x) ↦ F^t x` is continuous on `ℝ × X_P`, and the position of `F^t x` is `1`-Lipschitz in `t`.

**Checks.**

- Unit square, `((1/2, 1/2), 1)`: at time `1/2` the state is at `(1, 1/2)`, identified with direction `−1`; at time `1` it is `((1/2, 1/2), −1)`; at time `2` it is back.
- The flow is not a Mathlib `Flow`: `F^t` is discontinuous at singular states.
- On `Σ` the identity convention keeps the group law: a state reaching a vertex at time `1` is fixed at every time.

### 8.3 Liouville measure and reversibility

Prove measure preservation and reversibility of the polygonal billiard flow: `μ_P` is invariant under every `F^t` (`VAddInvariantMeasure ℝ Z_P μ_P`), and `F^{−t} = J ∘ F^t ∘ J` (ChernovMarkarian2006, Chapter 2; BoldrighiniKeaneMarchetti1978, Section 2). Route: on the countably many measurable pieces of `X_P` where the itinerary up to time `t` is fixed, `F^t` is `(x, v) ↦ (g(x + tv) + c, gv)` for a product `g` of reflections, an affine isometry in `x` and an isometry of `Circle` in `v`, which preserves `Leb ⊗ dθ`. *Needs:* §8.2.

**Checks.**

- Free motion `(x, v) ↦ (x + tv, v)` preserves `Leb ⊗ dθ` because it is a translation in `x` for each `v`.
- `J` preserves `μ_P` and reverses the square example: `J(F¹(J((1/2, 1/2), 1)))` is `((1/2, 1/2), −1) = F^{−1}((1/2, 1/2), 1)`.
- The measure `Leb_P ⊗ δ_{v₀}` is not invariant: reflections change `v₀`.

### Examples

The unit square, where the flow is explicit by unfolding to the torus of Layer 11.

### Dependencies

Layer 7; Mathlib measure theory.

## Layer 9: Rational tables

### 9.1 The reflection group

Define the reflection group of the table as the subgroup of `ℂ ≃ₗᵢ[ℝ] ℂ` generated by the `σ_S`; the table is rational when it is finite. Prove: a finite reflection group is dihedral of order `2N` for some `N ≥ 2`, with rotation subgroup generated by the rotations through `2θ` for the angles `θ` between side directions (MasurTabachnikov2002, Section 1).

*Needs:* §7.2; Mathlib `DihedralGroup` and real linear isometries of `ℂ`.

API:

- A finite reflection group of a polygonal table is isomorphic to `DihedralGroup N` with `N ≥ 2`.
- Its rotation subgroup is generated by the rotations through twice the angles between side directions; its reflections are the `σ` in `N` lines at angles `π/N` apart, containing every side direction.
- A similarity `z ↦ az + b` of the table conjugates the reflection group by the rotation part of `a`.

**Checks.**

- Unit square: `{±1, ±conj}`, of order `4`, `N = 2`.
- Equilateral triangle: order `6`, `N = 3`.
- A triangle with an angle `π/√2` has an infinite reflection group.

### 9.2 The angle criterion

Prove: for a simple polygon (`h = 0`) the reflection group is finite exactly when every interior angle is a rational multiple of `π`, and then, writing `α_v = π m_v/n_v` in lowest terms, it is dihedral of order `2N` with `N = lcm_v n_v` (MasurTabachnikov2002, Section 1; ZemlyakovKatok1975). For a table with holes it is finite exactly when all differences of side directions are rational multiples of `π`. *Needs:* §9.1, §7.1.

**Checks.**

- Right triangle `π/2, π/8, 3π/8`: denominators `2, 8, 8`, `N = 8`, order `16`.
- L-shaped hexagon (`π/2` five times, `3π/2` once): `N = 2`, order `4`.
- The square `[0, 3]²` with a square hole rotated by an angle `θ ∉ πℚ`: every angle is `π/2` or `3π/2`, yet the group is infinite; the angle criterion is for simple polygons only.

### 9.3 Invariant directions and non-ergodicity

Prove non-ergodicity of rational tables: if the reflection group `G` is finite of order `2N` and `d` is the unit direction of a side, then `f(x, v) = Re((conj d · v)^N)` is a measurable `F`-invariant function on `Z_P`, not almost everywhere constant, so `¬ ErgodicVAdd ℝ Z_P μ_P`; and for every `θ ∈ Circle` the set `M_θ` of states with direction in `G · θ` is `F`-invariant (MasurTabachnikov2002, Section 1; ZemlyakovKatok1975). Route: `f` is invariant under every element of `G` and the flow changes `v` only by elements of `G`; its image measure is that of `cos(Nφ)` under the uniform `φ`, not a Dirac mass. *Needs:* §9.1, §8.3; Mathlib `ErgodicVAdd`.

**Checks.**

- Square (`N = 2`, `d = 1`): `f = Re(v²) = cos 2φ`, invariant under `v ↦ conj v` and `v ↦ −conj v`; its distribution is the arcsine law on `[−1, 1]`.
- A wrong exponent `N = 1` gives `Re v`, which changes sign under `v ↦ −conj v` and is not invariant.
- For a triangle with an angle `π/√2`, `G` is infinite and the finite-group statement does not apply. Constants remain invariant, and the indicator of the countable orbit `G·θ` is Borel and invariant, equal to `1` on that orbit and `0` elsewhere (hence `0` almost everywhere for angular measure).

### Examples

The square, the equilateral triangle, the `π/8` right triangle, the L-shaped hexagon, the square with a square hole.

### Dependencies

Layers 7–8.

## Layer 10: Translation surfaces

### 10.1 The translation groupoid

Define the translation groupoid, a `StructureGroupoid ℂ` built through `Pregroupoid.groupoid`, as the partial homeomorphisms of `ℂ` with open source that have complex derivative `1` at every point of the source, equivalently that are translations on each connected component of the source. This groupoid construction and the equivalence are made here from the derivative-one condition; ChaikaForni2026, Section 2, p. 5, lines 168–176, supplies the charts obtained by integrating an Abelian differential, rather than a groupoid theorem.

API:

- It is closed under restriction, composition and inversion, and is local; it is contained in `contDiffGroupoid ⊤` for the model `ℂ`, so a space with a translation atlas is a smooth manifold.
- On a connected open set its members are translations `z ↦ z + c`.

**Checks.**

- `z ↦ z + 3i` on `ℂ` is a member; `z ↦ 2z` and `z ↦ conj z` are not.
- `z ↦ z` on `{Re z < 0}` together with `z ↦ z + 1` on `{Re z > 0}` is a member (a translation on each component).
- `z ↦ −z` has derivative `−1` and is not a member: half-translation surfaces are excluded.

*Needs:* Mathlib `Pregroupoid`, `Pregroupoid.groupoid`, `StructureGroupoid`, `contDiffGroupoid`.

### 10.2 Translation surfaces

Define a translation surface structure on a compact connected Hausdorff space `X`: a finite set `Σ_X ⊆ X` of cone points, a charted space structure on the complement of `Σ_X` modelled on `ℂ` with `HasGroupoid` for the translation groupoid, and at each `p ∈ Σ_X` an integer `k_p ≥ 1` and a homeomorphism `φ` from a neighbourhood of `p` onto a disc centred at `0`, `φ(p) = 0`, such that near every other point of that neighbourhood `z ↦ φ(z)^{k_p}/k_p`, restricted where it is injective, belongs to the maximal translation atlas (MasurTabachnikov2002, Section 1, for flat structures; ChaikaForni2026, Section 2, p. 5, lines 168–176, for integrated charts; the cone-atlas formulation is constructed here).

*Needs:* §10.1; Mathlib `ChartedSpace`, `HasGroupoid`, `StructureGroupoid.maximalAtlas`.

API:

- The translation charts and the cone charts `φ` form a smooth, indeed complex-analytic, atlas on `X`; `X` is an orientable compact surface.
- The cone angle at `p` is `2πk_p`; removing or adding marked points with `k = 1` does not change the underlying surface.
- Directions are globally defined: the unit vector field `θ` in charts is invariant under translations.

**Checks.**

- The flat torus `ℂ/(ℤ + iℤ)` with `Σ = ∅`, and the same torus with one marked point (`k = 1`).
- The regular octagon with opposite sides glued has one cone point, where the eight corners of angle `3π/4` meet: cone angle `6π`, `k = 3`.
- A cone point with `k_p = 1/2` (angle `π`, the corner of a pillowcase) is excluded by integrality; such points require half-translation structures.

### 10.3 Flat area

Prove that there is a unique finite Borel measure `area_X` on `X` with `area_X(Σ_X) = 0` whose pullback by every translation chart is Lebesgue measure on its target. Construct the measure here by compatibility of chart measures and zero mass on `Σ_X`; ChaikaForni2026, Section 1, p. 3, lines 83–88, supplies the area-preserving directional-flow setting, not this uniqueness construction. *Needs:* §10.2.

**Checks.**

- Torus `ℂ/Λ`: `area = covolume Λ`.
- Octagon surface of side `1`: area `2(1 + √2)`.
- The pullback condition alone, without `area(Σ) = 0`, allows adding atoms at the cone points.

### 10.4 Directional flows

For `θ ∈ Circle`, prove that the local flows `z ↦ z + tθ` in translation charts glue to a flow on the complement of the leaves through `Σ_X`, defined for all time there, and define the directional flow `φ_θ` as this flow extended by the identity on the union of the leaves through `Σ_X` (a countable union of segments, `area`-null). Prove the group law, joint measurability and invariance of `area_X` (ChaikaForni2026, Section 1, p. 3, lines 83–88, supplies the directional flows and invariant area; the all-time measurable representative with fixed singular leaves is constructed here). Route: a trajectory approaching a cone point within the cone chart either reaches it or passes at positive distance; away from the cone discs the chart radius is bounded below by compactness. *Needs:* §10.2, §10.3.

API:

- Leaves avoiding `Σ_X` are defined for all time; the leaves through `Σ_X` form a countable union of segments and are null.
- `φ_θ` is an action of `ℝ` with `MeasurableVAdd₂` preserving `area_X`.
- Replacing the atlas by its rotation by `exp(iα)` turns `φ_θ` into `φ_{exp(iα)θ}`.

**Checks.**

- On `ℂ/(ℤ + iℤ)`, direction `θ = exp(iπ/4)`: `φ_θ^{√2}(0) = 1 + i ≡ 0`, a closed leaf; direction `exp(i arctan √2)` has dense leaves.
- On the octagon surface the leaves through the cone point in the direction of a side are saddle connections.
- Without the identity convention on singular leaves the flow would not be defined at time `t` on the leaf through a cone point.

### 10.5 Flat tori

Prove that `ℂ/Λ` for a lattice `Λ` is a translation surface with `Σ = ∅`, that its directional flows are the linear flows `z ↦ z + tθ`, and that every translation surface all of whose cone points have `k = 1` is isomorphic to some `ℂ/Λ` with marked points (MasurTabachnikov2002, Section 1; the chart-completeness route below is the construction here). Route: after forgetting the marked points the translation atlas is complete, so the developing map of the universal cover is an isometry onto `ℂ` and the deck group is a lattice of translations. *Needs:* §10.2, §10.4.

**Checks.**

- `Λ = 2ℤ + 2iℤ`: area `4`.
- `θ = 1` on `ℂ/(ℤ + iℤ)`: every leaf is closed of length `1`.
- A torus with one marked point (`k = 1`) is a translation surface with `Σ ≠ ∅`, isomorphic to `ℂ/Λ` with that point marked.

### Examples

Flat tori and the regular octagon surface.

### Dependencies

Mathlib manifolds; GeometricTopology §1.7 (genus).

## Layer 11: The Katok–Zemlyakov surface

### 11.1 Construction

For a rational table with reflection group `G`, define `S_P = (G × P)/∼` with `(g, x) ∼ (g σ_S, x)` for `x` in the side `S` (the equivalence relation generated). Prove: `S_P` is compact and connected (the gluing graph is the Cayley graph of `G` for the generators `σ_S`); the class of a vertex `v` consists of `(g, v)` for `g` in a coset of the dihedral subgroup of order `2n_v` generated by the two side reflections at `v`, so `v` gives `|G|/(2n_v)` points of `S_P` (MasurTabachnikov2002, Section 1; ZemlyakovKatok1975).

*Needs:* §9.1, §7.1; finite quotient gluing.

API:

- `S_P` is compact and connected; each copy `{g} × P` maps injectively off its frontier.
- The class of a vertex `(g, v)` is the coset of the dihedral subgroup of order `2n_v` generated by the two side reflections at `v`.
- Relabelling by `G` acting on the left permutes the copies and is a homeomorphism of `S_P` multiplying the charts of §11.2 by elements of `G`.

**Checks.**

- Square: `4` copies, one vertex class per vertex (`|G|/(2 · 2) = 1`), four vertex classes.
- Equilateral triangle: `6` copies, `6/(2 · 3) = 1` class per vertex.
- `π/8` triangle: `16` copies; vertex classes `4` (at `π/2`), `1` (at `π/8`), `1` (at `3π/8`).

### 11.2 Translation structure and cone angles

Prove that `S_P` is a translation surface: on copy `g` the chart is `x ↦ gx`, and near a point of the relative interior of a side `S` the chart is `gx` on copy `g` and `gσ_S x + g(x₀ − σ_S x₀)` on copy `gσ_S` (for any `x₀ ∈ S`), whose two half-discs form a disc because the second map is the affine reflection of the first in the line `g(S)`; the cone points are the vertex classes, with `k = m_v` for `α_v = πm_v/n_v` (MasurTabachnikov2002, Section 1). *Needs:* §11.1, §10.2.

**Checks.**

- The translation `g(x₀ − σ_S x₀)` does not depend on `x₀ ∈ S`: for `x₀ = a + rd`, `σ_S x₀ − x₀ = σ_S a − a`.
- L-shaped hexagon: the `3π/2` vertex (`m = 3`, `n = 2`) gives one class of cone angle `6π`; the `π/2` vertices give regular points.
- The square with a square hole: four classes of angle `6π` (the reflex corners) and four regular points.

### 11.3 Euler characteristic and genus

Prove `χ(S_P) = |G|(1 − h) + Σ_v |G|/(2n_v) − |G| n/2` and `2g − 2 = Σ_v (|G|/(2n_v))(m_v − 1)`; for a simple polygon `g = 1 + (N/2) Σ_v (m_v − 1)/n_v` (MasurTabachnikov2002, Section 1; ZemlyakovKatok1975, pp. 291–300). Route: Mayer–Vietoris for the open cover by the union of the open copies (each homotopy equivalent to `P`, Euler characteristic `1 − h`) and a regular neighbourhood of the image of the boundary graph (Euler characteristic `Σ_v |G|/(2n_v) − |G|n/2`), whose intersection is a union of annuli; the genus formula from the angle sum of §7.1 (`Σ_v (|G|/(2n_v)) m_v = (|G|/2)(n − 2 + 2h)`). *Needs:* §11.2, §7.1; Tau Ceti `TauCeti.eulerChar`, `TauCeti.eulerChar_union_add_eulerChar_inter`; GeometricTopology §1.7.

**Checks.**

- Square: `χ = 4 + 4 − 8 = 0`, genus `1`; `S_P` is `ℂ/(2ℤ + 2iℤ)`, the flat torus of side `2`.
- Equilateral triangle: `χ = 6 + 3 − 9 = 0`, genus `1`; `π/8` triangle: `χ = 16 + 6 − 24 = −2`, genus `2` (the regular octagon surface).
- L-shaped hexagon: `χ = 4 + 6 − 12 = −2`, genus `2`; square with a square hole: `χ = 0 + 8 − 16 = −8`, genus `5`, and `Σ(k − 1) = 4 · 2 = 8 = 2 · 5 − 2`.

### 11.4 The unfolding conjugacy

Prove: for `θ ∈ Circle` with trivial stabiliser in `G`, the map `Φ_θ : M_θ → S_P`, `(x, gθ) ↦ [g⁻¹, x]`, is well defined on `Z_P`, restricts to a bijection from `M_θ ∖ Σ` onto the complement in `S_P` of the leaves of `φ_θ` through cone points, carries the measure `Σ_{g ∈ G} (Leb_P ⊗ δ_{gθ})` to `area_{S_P}`, and satisfies `Φ_θ ∘ F^t = φ_θ^t ∘ Φ_θ`. The normalized measures are `ν_θ = (|G| area P)⁻¹ Σ_{g ∈ G} Leb_P ⊗ δ_{gθ}` (pushed to the phase quotient) and `area_{S_P}/area(S_P)`; they are probability measures and are carried to one another, since `area(S_P) = |G| area P > 0` (MasurTabachnikov2002, Section 1; KerckhoffMasurSmillie1986, Theorem 1, is the ergodicity theorem built on this conjugacy). Route: in the chart of copy `g⁻¹` the velocity `gθ` becomes `θ`; a reflection in `S` replaces `gθ` by `σ_S gθ`, which moves the point to copy `g⁻¹σ_S`, glued to copy `g⁻¹` along `S`. *Needs:* §11.2, §10.4, §9.3, §8.2.

**Checks.**

- Square, `θ = exp(iπ/6)` (trivial stabiliser): the billiard trajectory unfolds to the line of slope `1/√3` on the torus of side `2`.
- `θ = 1` is fixed by `conj ∈ G` for the square: `M_θ` has only two directions `±1`; the formula for `Φ_θ` is not well defined, because `(x, 1)` with interior `x` can give either `[id, x]` or `[conj, x]`, two distinct copy points. The natural reverse projection `[h, x] ↦ (x, h⁻¹θ)` is two-to-one over interior states. For `θ = exp(iπ/6)` the label `g` is unique, restoring the bijection.
- Areas: `|G| · area P = area S_P`; for the `π/8` triangle with legs `1` and `tan(π/8)`, `16 · tan(π/8)/2 = 8 tan(π/8) = 8(√2 − 1)`.
- For the unit square the raw directional measure and unfolded area both have mass `4`; division by `|G| area P = 4` gives probabilities of mass `1`. The whole-space weak-mixing residual is then `|1 − 1²| = 0`, whereas with the raw mass it would be `|4 − 4²| = 12`.

### Examples

The square (flat torus), the `π/8` triangle (octagon surface), the L-shaped hexagon (genus `2`, one cone point of angle `6π`), the square with a square hole (genus `5`).

### Dependencies

Layers 7–10; GeometricTopology §1.7; Tau Ceti Euler characteristic.

## Layer 12: Weak mixing of flows

### 12.1 Definition

For an action of `ℝ` on a measurable space `X` (`AddAction ℝ X`) and a measure `μ`, define `IsWeaklyMixing μ`: for all measurable `A`, `B`, `T⁻¹ ∫₀ᵀ |μ((t +ᵥ ·)⁻¹' A ∩ B) − μ(A)μ(B)| dt → 0` as `T → ∞`, with the measures read as real numbers. It is used for probability measures and actions with `MeasurableVAdd₂ ℝ X` and `VAddInvariantMeasure ℝ X μ`, where the integrand is measurable in `t` (Fubini) and bounded by `1`. An eigenfunction with eigenvalue `a ∈ ℝ` is a measurable `f : X → ℂ`, not almost everywhere zero, with `f(t +ᵥ x) = exp(2πiat) f(x)` for almost every `x`, for every `t` (ChaikaForni2026 lines 9–17 and 99–100; Hochman2012, Theorem 6.1.7, lines 2483–2487, for the equivalent forms in the case of `ℤ`-actions).

*Needs:* Mathlib `MeasurableVAdd₂`, `VAddInvariantMeasure` on an `AddAction ℝ X`, `IsProbabilityMeasure μ`, complex `L²` and integration.

API:

- Invariance under measure-preserving isomorphism of actions and under time rescaling `t ↦ ct`, `c ≠ 0`.
- Equivalent forms: the same limit for `L²` functions `⟨g, U_t f⟩ − (∫f) conj(∫g)`, and with the square of the absolute value (the flow form of Hochman2012, Theorem 6.1.7 and Lemma 6.1.6, lines 2474–2487).
- The product of a weakly mixing action with an ergodic one is ergodic (ChaikaForni2026 lines 95–98; Hochman2012, Proposition 6.2.1, line 2627, for `ℤ`-actions).

**Checks.**

- The trivial action on a two-point space with uniform measure is not weakly mixing: `A = B` a point gives `|1/2 − 1/4| = 1/4`.
- For the horizontal flow on `ℂ/(ℤ + iℤ)` and the half-torus `A = B`, the signed average of `μ((t +ᵥ ·)⁻¹' A ∩ A) − 1/4 = |1/2 − t| − 1/4` over a period is `0`, while the average of its absolute value is `1/8`; this pair alone does not test the universally quantified signed condition. The invariant half-torus `{Im z mod 1 ∈ [0, 1/2)}` instead has constant residual `1/4`. For an ergodic action satisfying the signed condition for all pairs but failing weak mixing, use the full real translation action on `AddCircle 1`: its half-circle has absolute average `1/8` and its nonconstant character `e₁` has eigenvalue `1`.
- The one-point space is weakly mixing: every set residual is `0`, and the complex test `f = i`, `g = 1` has centered correlation `i − i = 0`. Reversing the native inner-product order would instead give `−i − i = −2i`.

### 12.2 Weak mixing implies ergodicity

Prove that a weakly mixing jointly measurable action of `ℝ` with an invariant probability measure is ergodic, `ErgodicVAdd ℝ X μ` (Hochman2012, Section 6.1, printed p. 56, line 2439, for the discrete implication; the invariant-set proof below gives the real-action form). Route: an almost invariant measurable set `A` gives the constant integrand `μ(A) − μ(A)²`, which must vanish. *Needs:* §12.1; Mathlib `ErgodicVAdd`.

**Checks.**

- An irrational linear flow on a torus is ergodic but not weakly mixing (§12.6), so the converse fails.
- An invariant set of measure `1/2` gives the constant integrand `1/4`.
- With `B = Aᶜ` for invariant `A` the integrand is `μ(A)μ(Aᶜ)`.

### 12.3 The Koopman group

Prove that for a jointly measurable measure-preserving action of `ℝ` on a probability space, `U_t f = f ∘ F^t` is a strongly continuous unitary group on `L²(μ)`: for every `f` in `Lp ℂ 2 μ` the map `t ↦ U_t f`, with `U_t` the pullback `MeasureTheory.Lp.compMeasurePreserving` along the measure-preserving translate `(t +ᵥ ·)` (`MeasureTheory.measurePreserving_vadd`), is continuous, so these operators form a `TauCeti.Semigroups.StronglyContinuousGroup` that is unitary; for `ℤ`-actions no continuity is needed (Hochman2012, Section 6.6), and the continuity for `ℝ` is proved here. Use the native `Lp` pullbacks and their composition and isometry laws for `U_t`; the new assertion is strong continuity under joint measurability. Route: averages `∫₀^h f ∘ F^s ds` are continuous vectors, and a vector orthogonal to all of them is zero by Fubini and Lebesgue differentiation along almost every orbit; continuous vectors form a closed subspace. No separability is assumed. *Needs:* §12.1; Mathlib `MeasureTheory.Lp.compMeasurePreserving`, `MeasureTheory.Lp.coeFn_compMeasurePreserving`, `MeasureTheory.Lp.isometry_compMeasurePreserving`, `MeasureTheory.Lp.compMeasurePreserving_comp`; Tau Ceti `TauCeti.Semigroups.StronglyContinuousGroup` and `TauCeti.Semigroups.StronglyContinuousGroup.IsUnitary`.

**Checks.**

- Translation flow on `AddCircle 1`: `U_t e_n = exp(2πint) e_n` for `e_n(x) = exp(2πinx)`, continuous in `t`.
- The identity action gives `U_t = 1`.
- For `ℝ` acting on itself by translation with an infinite measure the statement is not claimed (probability spaces only).

### 12.4 Wiener's lemma

Prove Wiener's lemma on the line: for a finite Borel measure `σ` on `ℝ` with characteristic function `MeasureTheory.charFun σ t = ∫ exp(itξ) dσ(ξ)`, `T⁻¹ ∫₀ᵀ |charFun σ t|² dt → Σ_ξ σ({ξ})²` as `T → ∞`, the sum over the (countably many) atoms; Hochman2012, Proposition 6.6.3, printed p. 70, lines 3099–3140, supplies the atomless discrete circle computation; the real-line formula including atoms is proved here. Route: Fubini turns the average into `∫∫ K_T(ξ − η) dσ dσ` with `K_T(u) = T⁻¹∫₀ᵀ exp(itu) dt`, which tends to the indicator of `u = 0` boundedly. *Needs:* Mathlib `MeasureTheory.charFun`, `MeasureTheory.charFun_apply_real`, Fubini and dominated convergence.

**Checks.**

- `σ = δ₀`: `|σ̂|² = 1`, limit `1`.
- `σ = (δ₀ + δ₁)/2`: `|σ̂(t)|² = (1 + cos t)/2`, average `→ 1/2 = 1/4 + 1/4`.
- `σ` Lebesgue on `[0, 1]`: for `t ≠ 0`, `|σ̂(t)|² = (2 − 2cos t)/t²`; at `t = 0` its value is `1`. At `t = π` both sides are `4/π²`. The average tends to `0`; the value at a single point does not affect the integral, whereas total division would incorrectly give `0` at `t = 0`.

### 12.4.1 Continuous-time mean ergodic projection

Prove `exists_tendsto_twistedAverage`, the continuous-time mean ergodic projection theorem: let `H` be any complete complex Hilbert space, `U` a strongly continuous unitary group on `H` (`TauCeti.Semigroups.StronglyContinuousGroup H` with `IsUnitary`), `a ∈ ℝ` and `v ∈ H`. The common eigenspace `E_a = {u : ∀ t ∈ ℝ, U_t u = exp(2πiat) u}` is a closed complex subspace (complex because each `U_t` is complex linear, `TauCeti.Semigroups.StronglyContinuousGroup.IsUnitary.map_smul`). The averages `A_T^a v = T⁻¹∫₀ᵀ exp(−2πiat) U_t v dt` converge in norm, as `T → ∞`, to the vector `w` with `w ∈ E_a` and `v − w ⊥ E_a`, which is the orthogonal projection `P_a v` (`Submodule.orthogonalProjectionOnto`, viewed in `H`). In particular `a = 0` projects onto vectors fixed by every real time. No separability of `H` is assumed. This is the real-time construction here; Hochman2012, Section 6.6, Lemma 6.6.2, printed p. 69, lines 3076–3096, uses twisted discrete averages instead.

The same theorem states the spectral atomic-mass identity: for every finite Borel measure `σ_v` on `ℝ` with `charFun σ_v t = ⟨v, U_t v⟩` for all `t` (Bochner's theorem, `TauCeti.bochner_charFun_real`, applied to the continuous positive-definite function `t ↦ ⟨v, U_t v⟩`, gives exactly one), `‖P_a v‖² = σ_v({2πa})`. Route: for the twisted group `V_t = exp(−2πiat) U_t`, the closed linear span of the vectors `V_s w − w` is the orthogonal complement of its common fixed space. Its averages satisfy `‖A_T(V_s w − w)‖ ≤ 2|s|‖w‖/T` for every `T > 0`; averaging is a contraction and fixes the common fixed space, giving convergence by density and orthogonal decomposition. Finally `‖A_T^a v‖² = ∫ |K_T(ξ − 2πa)|² dσ_v(ξ)`, where `K_T(u) = (1/T)∫₀ᵀ exp(itu) dt`; bounded convergence gives the atomic mass. Strong continuity makes each vector orbit on a compact time interval Bochner integrable, without separability of the ambient space. *Needs:* Tau Ceti `TauCeti.Semigroups.StronglyContinuousGroup`, `TauCeti.Semigroups.StronglyContinuousGroup.IsUnitary`, `TauCeti.bochner_charFun_real`; Mathlib `MeasureTheory.charFun`, `intervalIntegral`; Mathlib `Submodule.orthogonalProjectionOnto`, Bochner integration and closed-subspace orthogonal decomposition.

**Checks.**

- On `AddCircle 1`, the unit mode `e₁` has `U₁e₁ = e₁`: discrete time-one averages are `e₁`, but `A_N^0 e₁ = 0` at every positive integer `N`, and `P₀e₁ = 0`. Its spectral mass at `0` is `0`.
- For the same mode, `A_T^1 e₁ = e₁` for every `T > 0`; `‖P₁e₁‖² = 1 = δ_{2π}({2π})`, and `⟨e₁, U_{1/4}e₁⟩ = i`. The opposite exponential twist would have limit `0`.
- For the identity group, `P₀v = v` and `σ_v = ‖v‖²δ₀`. At `a ≠ 0`, `E_a = {0}` and `A_T^a v = ((1 − exp(−2πiaT))/(2πiaT))v → 0`; at `v = 0` both sides of the mass identity are `0` for every `a`.

### 12.5 The eigenfunction criterion

Prove `isWeaklyMixing_iff`: for an action of `ℝ` on `X` with `MeasurableVAdd₂ ℝ X` and a probability measure `μ` with `VAddInvariantMeasure ℝ X μ`, `IsWeaklyMixing μ` holds exactly when every measurable `f : X → ℂ` satisfying, for some `a ∈ ℝ` and every `t`, `f(t +ᵥ x) = exp(2πiat) f(x)` for almost every `x`, is almost everywhere constant. Equivalently every eigenfunction is almost everywhere constant, in which case its eigenvalue is `0` (an almost everywhere zero `f` is constant and is not an eigenfunction) (the form in which ChaikaForni2026 works, lines 95–100; Hochman2012, Theorem 6.4.7, Lemma 6.6.2 and Corollary 6.6.4, printed pp. 64, 69–70, lines 2854–2855, 3076–3096 and 3141–3143, for `ℤ`-actions; the real-action criterion is proved here). Route: by §12.3 and Bochner's theorem each `f ⊥ 1` has a spectral measure `σ_f` with `⟨f, U_t f⟩ = ∫ exp(itξ) dσ_f(ξ)`, an eigenfunction of eigenvalue `a` giving an atom at `ξ = 2πa`; weak mixing is equivalent to `(1/T)∫₀ᵀ |⟨f, U_t f⟩|² dt → 0` for all `f ⊥ 1`, which by §12.4 means that no `σ_f` has an atom; an atom at `2πa` gives the eigenfunction `lim (1/T)∫₀ᵀ exp(−2πiat) U_t f dt ≠ 0` (§12.4.1, with squared projection norm `σ_f({2πa})`), and an eigenfunction gives an atom of its own spectral measure. Polarization gives the mixed correlations from the diagonal ones. To pass between this `L²` argument and measurable eigenfunctions, first obtain ergodicity by excluding nonconstant invariant indicator functions; then `|f|` is almost everywhere a finite constant, so every measurable eigenfunction belongs to `L²`. *Needs:* §12.1, §12.2, §12.3, §12.4, §12.4.1; Tau Ceti `TauCeti.bochner_charFun_real`.

**Checks.**

- Torus flow `z ↦ z + tθ` on `ℂ/Λ`: `f(z) = exp(2πi⟨λ*, z⟩)` for a dual lattice vector `λ*` with `⟨λ*, θ⟩ ≠ 0` is an eigenfunction with eigenvalue `⟨λ*, θ⟩`.
- A constant function is an eigenfunction with eigenvalue `0` and is excluded by "almost everywhere constant".
- An eigenvalue `a ≠ 0` forces a non-constant eigenfunction: `|f|` is invariant and `f` cannot be constant unless it vanishes.
- On `AddCircle 1`, the unit eigenfunction `e₁` has spectral measure `δ_{2π}` and correlation `i` at `t = 1/4`; §12.4.1 gives untwisted projection `0` and eigenvalue-`1` projection `e₁`, of squared norm `1`.

### 12.6 Tori and rational tables

Prove that no linear flow of a flat torus is weakly mixing, that the billiard flow of a rational table is not weakly mixing (it is not ergodic by §9.3), and that when every vertex angle of `P` has the form `π/n` (all `m_v = 1`) the restriction of the billiard flow to `M_θ`, for `θ` with trivial stabiliser and the probability measure `ν_θ` of §11.4, is not weakly mixing. Its conjugacy with the ordinary linear flow of the flat torus `S_P`, equipped with normalized area, is on invariant conull subsets: the leaves through the marked regular vertices remain fixed under §10.4, and are discarded in this comparison (MasurTabachnikov2002, Section 1, for unfolding; the probability and conull-set transport use §§11.4 and 12.1). *Needs:* §12.2, §12.5, §9.3, §10.5, §11.3, §11.4.

**Checks.**

- Square billiard: `f = Re(v²)` is invariant and non-constant, eigenvalue `0`.
- Equilateral triangle (all angles `π/3`, `m_v = 1`) in a direction with trivial stabiliser: conjugate on invariant conull subsets, with the normalized measures, to a linear flow on the torus `S_P`, with eigenfunctions.
- The criterion does not say that a genus-`2` surface has a weakly mixing directional flow; that is a consumer theorem.
- For the square direction class the normalized whole-space residual is `0`. On the conull torus model a nonconstant character has the same nonzero eigenvalue as on the whole torus; its failure of weak mixing persists after deleting the marked singular leaves.

### Examples

Linear flows of tori, the billiard flows of the square and of the equilateral triangle.

### Dependencies

Mathlib; Tau Ceti Bochner theorem and strongly continuous groups; Layers 9–11 for §12.6.

## Downstream consumers

- A roadmap on the Birkhoff–Poritsky theorem for centrally symmetric tables (BialyMironov2022 lines 96–109, Theorem 1.1) consumes Layers 1–5: the carrier of `C²` tables of positive curvature (§1.2), the billiard map and its generating function (§§2–3), Birkhoff's graph theorem and rotation numbers (§§5.3–5.5).
- A roadmap on weakly mixing polygonal billiards (ChaikaForni2026 line 28, Theorem 1.1, and lines 89–100, Theorems 1.2 and 1.3) consumes Layers 7–12: the billiard flow, rational tables, translation surfaces with their directional flows, the Katok–Zemlyakov unfolding and the eigenfunction criterion.
- A roadmap on translation surfaces and Teichmüller dynamics (strata, the `SL₂(ℝ)` action, KerckhoffMasurSmillie1986, Theorem 1) consumes Layers 10–11.
- A roadmap on dispersing billiards would consume the almost-everywhere flow shape of Layer 8 (a trajectory map off an invariant null set, the identity on it), the shape also used for hard-sphere flows.

## References

- `Herman1983`: M. R. Herman, *Sur les courbes invariantes par les difféomorphismes de l'anneau, volume 1*, Astérisque 103–104 (1983), Chapitre I (1.2, 2.2, 2.4, 3.1, 3.4, 5.2) and the Appendice by A. Fathi (Théorème de Birkhoff). Open on Numdam.
- `Hochman2012`: M. Hochman, *Notes on ergodic theory* (2012), Chapter 6 (weak mixing, eigenfunctions, spectral measures) for `ℤ`-actions. Author's page.
- `BialyMironov2022`: M. Bialy, A. E. Mironov, *The Birkhoff–Poritsky conjecture for centrally-symmetric billiard tables*, Ann. of Math. 196 (2022); read as arXiv 2008.03566v4.
- `ChaikaForni2026`: J. Chaika, G. Forni, *Weakly mixing polygonal billiards*; read as arXiv 2003.00890v2.
- `KatokHasselblatt1995`: A. Katok, B. Hasselblatt, *Introduction to the Modern Theory of Dynamical Systems*, Sections 9.2–9.3 and Chapter 13.
- `Tabachnikov2005`: S. Tabachnikov, *Geometry and Billiards*, Chapters 3 and 7.
- `ChernovMarkarian2006`: N. Chernov, R. Markarian, *Chaotic Billiards*, Chapter 2.
- `BoldrighiniKeaneMarchetti1978`: C. Boldrighini, M. Keane, F. Marchetti, *Billiards in polygons*, Ann. Probab. 6 (1978), §2.
- `ZemlyakovKatok1975`: A. N. Zemlyakov, A. B. Katok, *Topological transitivity of billiards in polygons*, Mat. Zametki 18 (1975), pp. 291–300.
- `MasurTabachnikov2002`: H. Masur, S. Tabachnikov, *Rational billiards and flat structures*, Handbook of Dynamical Systems 1A, Chapter 13, §1.
- `KerckhoffMasurSmillie1986`: S. Kerckhoff, H. Masur, J. Smillie, *Ergodicity of billiard flows and quadratic differentials*, Ann. of Math. 124 (1986), Theorem 1.
- `Birkhoff1927`: G. D. Birkhoff, *On the periodic motions of dynamical systems*, Acta Math. 50 (1927), background for the periodic orbits of Layer 6.
