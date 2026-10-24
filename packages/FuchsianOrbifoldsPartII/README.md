# Roadmap: fuchsian orbifolds, part II — Nielsen cores and quadratic classes

**Summary.** Build the finite-area Nielsen cores of arbitrary finitely generated nonelementary Fuchsian groups, including their genuine geodesic boundaries, finite signatures and Gauss–Bonnet formula. Apply that theory to all admissible minus-digit cycles and compare the resulting cores with the real quadratic surfaces supplied by AutomorphicSpectralTheory. Reflected doubles and cusp-normalized conformal lifts recover the narrow ideal class. Multiplicity-preserving area measures give exact complementary and genus coverings; a cusp-flux version of Stokes includes height-truncated integrals and the completed Eisenstein endpoint.

## Scope and ownership

FuchsianOrbifolds stops at the effective projective action, ordinary quotient and cone charts, polygons, cusp charts and the compactification of cofinite quotients (Layers 0–6). This Part II owns limit sets, general second-kind convex cores and half-disc boundary charts, geometric finiteness, bordered signatures, the connected reflected double and conformal recovery. Its Ford-polygon theorem treats every admissible finite digit list, including repeated lists; this differs from the arithmetic construction indexed by primitive ideal-class periods.

The following objects are supplied elsewhere and are not constructed again here.

- Mathlib owns the curvature −1 metric and invariant measure, generated subgroups, coproduct groups and measurable pushforwards. The height-one distance expression below specializes that metric; it does not define another metric.
- Tau Ceti owns the projective actions on the upper half-plane and ideal circle, proper discontinuity, cyclic elliptic stabilizers, geodesics, polygon area, modular fundamental-domain measure, ordinary covering lifts and deck conjugation. Completed/UniversalCovers Stage 2 owns the general covering interpretation.
- AutomorphicSpectralTheory §4.17a owns the primitive reduced arithmetic cycle, Γ_A, the Nielsen surface F_A, its projection with multiplicities, area πℓ_A, primitive length 2log ε_D, and compact-part/finite-width-cusp decomposition. The arithmetic specialization in Layer 2 is a comparison of this supplied surface with the general construction here. Its signature and full oriented boundary-period comparison are stated by AnalyticNumberTheoryPartI §2.1. Those two results are consumed, rather than separate targets of this roadmap.
- AnalyticNumberTheoryPartI §2.1 owns Stokes under absolute integrability and vanishing cusp flux. Layer 5 adds existence of an improper height-truncated integral from flux alone, including λ=0. AutomorphicSpectralTheory §§4.18 and 4.20 own cusp decay and integrability for uncompleted Eisenstein series; the completed critical-line cancellation estimate is the precise extension consumed below.
- IntegralLattices Layer B, B2–B3 owns the oriented form/ideal-class dictionary and composition. GlobalNumberFields Layer 11 owns orders, Picard groups and narrow Picard groups. MultiquadraticPartII §§2.3–2.4 owns the two-square and distinguished-class square criteria; its §§3.1–3.2 own genus-character compatibility. No new narrow quotient, genus or genus-character construction is made here.
- ComplexCurveModuli D0.1 and D0.4 own compact smooth surface normal forms and bordered uniformization by a conformal double; D6.2 owns the smooth geodesic-cut metric comparison. Layer 3 extends the reflection construction to finite-area cores with cusps and marked cone orders.
- ConformalMapping L2 and L4 own disc automorphisms, Schwarz–Pick and reflection; AlgebraicTopology Stages 1 and 7 own van Kampen and finite-CW Euler characteristic; DifferentialGeometry §§5.3, 5.5 and 5.6.3 own ordinary/corners Stokes and its planar integration comparison.

The limits of distribution theorems and spectral arithmetic remain with AutomorphicSpectralTheory Layer 4 and AnalyticNumberTheoryPartI Layer 2. Hyperbolic volume and gonality constructions for higher-dimensional arithmetic quotients belong to HyperbolicCurveVolumesAndGonality. This roadmap supplies exact geometric identities and measures, without adding those asymptotic results.

## Conventions

Work in the upper half-plane ℍ with ds=|dz|/y, dμ=y⁻²dxdy and orientation dx∧dy. Groups are subgroups of effective PSL₂(ℝ), with inherited topology; “discrete” means the subgroup topology is discrete. The integral modular group is embedded by the canonical injective homomorphism PSL₂(ℤ)→PSL₂(ℝ). S(z)=−1/z and T(z)=z+1 act on the left; products act from right to left. S has projective order two, while its SL₂(ℤ) representative squares to −I. The ideal boundary is the entire `OnePoint ℝ`, including ∞, identified with the boundary of the Cayley disc. No finite-generation hypothesis is imposed when defining a limit set.

The closed convex hull CΓ, its interior NΓ and its quotient Core(Γ)=Γ\CΓ are distinct. The genuine boundary is the quotient of supporting geodesics. Paired polygon sides and horizontal cusp cuts do not contribute to its boundary count. Cusp points are not adjoined to the bordered core. Cone points retain their stabilizer orders. Conformal equivalence means an orientation-preserving orbifold equivalence, holomorphic in cone charts, preserving orders, and extending homeomorphically to the genuine boundary.

Fix a positive fundamental discriminant D>1, its real quadratic field K with its chosen positive real square root, C=Cl⁺(K), and J the narrow class of the different. J is represented by √D, has J²=1, and exchanges norm signs. A principal ideal with a positive-norm generator has a totally positive generator after changing its sign if necessary. Thus the source's norm-sign convention agrees with the native narrow class group. ε_D>1 denotes the least norm +1 unit, generating the positive norm-one units; the full norm-one unit group also contains −1. Square a negative-norm fundamental unit to obtain ε_D.

A primitive reduced minus period n₁,…,nℓ has nₖ≥2 and some nₖ>2. Set N₀=0, Nₖ=Σⱼ≤ₖnⱼ and m=Nℓ. Arithmetic periods are primitive; the raw-list theorems also allow repeated admissible lists. Cyclic rotation is transported by integral translation; reversal retains its distinct oriented-class law. All finite sums use native finite sets or lists, keeping cone multiplicity by orbit. Measures are Borel measures with nonnegative extended-real scalars; complex integrals require the stated integrability or specified truncation limit. All analytic carriers are ordinary small types, with no cardinality restriction beyond the second-countable surface charts and finite-type conclusions stated below.

**Checks.**

- S(i)=i, S(2i)=i/2 and S²(2i)=2i, while its integral matrix square is −I. For [3,6], T⁻³ changes centres {0,3} modulo 9 to {0,6}; the opposite conjugation gives the wrong rotation.
- With signature (0;2,3;1;0), 2π(−2+1+1/2+2/3)=π/3. Signature (0;2;1;1) instead gives π. A paired side contributes zero to t in both computations.
- For F=log y on 0≤x≤1, 1≤y≤2, α_F=i∂zF dz=dz/(2y). Its positively oriented boundary integral is 1/2−1/4=1/4, equal to (1/2)∫ΔF dμ; Δ=−y²(F_xx+F_yy). On F=y² the corrected operator gives −2y², while the inverse-square factor would give −2y⁻².
- In D=12, Norm(2+√3)=1 and Norm(1+√3)=−2; the principal narrow class and J differ. In D=8 the norm −1 unit 1+√2 gives ε_D=(1+√2)²=3+2√2, so the primitive length is 2log(3+2√2).

## Exact supplier contracts

### From Mathlib

Use Mathlib at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. `UpperHalfPlane.volume_def` in `Mathlib/Analysis/Complex/UpperHalfPlane/Measure.lean` gives density y⁻²; `UpperHalfPlane.dist_eq` and `UpperHalfPlane.cosh_dist` in `Mathlib/Analysis/Complex/UpperHalfPlane/Metric.lean` give the curvature −1 metric. These definitions include positivity of height through the upper-half-plane subtype; they do not impose a finite-area quotient. `ModularGroup.S` and `ModularGroup.T` in `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean` are determinant-one integral matrices, not projective order assertions. `ModularGroup.im_smul_eq_div_normSq` in `Mathlib/Analysis/Complex/UpperHalfPlane/MoebiusAction.lean` retains the nonzero denominator. `ModularGroup.fdo` in `Mathlib/NumberTheory/Modular.lean` uses both strict boundary inequalities.

Use `Subgroup.closure` and `Subgroup.closure_le` in `Mathlib/Algebra/Group/Subgroup/Lattice.lean`; `Monoid.Coprod` and `Monoid.CoprodI` in `Mathlib/GroupTheory/Coprod/Basic.lean` and `Mathlib/GroupTheory/CoprodI.lean`; and `Subgroup.index_eq_zero_iff_infinite` in `Mathlib/GroupTheory/Index.lean`. Natural-valued index zero means an infinite coset space. Use `ProperlyDiscontinuousSMul.finite_stabilizer` in `Mathlib/Topology/Algebra/ConstMulAction.lean` under proper discontinuity. For `MeasureTheory.Measure.map_apply`, require a measurable target set and a measurable, or appropriately almost-everywhere measurable, map; for `MeasureTheory.integral_map`, require the almost-everywhere measurability and strong measurability hypotheses of the Bochner identity (`Mathlib/MeasureTheory/Measure/Map.lean` and `Mathlib/MeasureTheory/Integral/Bochner/Basic.lean`).

`IsCoveringMap.existsUnique_continuousMap_lifts_of_range_le` in `Mathlib/Topology/Homotopy/Lifting.lean` requires path-connected and locally path-connected source, compatible lifted basepoint and the inclusion of the induced fundamental-group ranges. Layer 3 proves that inclusion using cone meridian powers; it is not an extra conclusion assumed from the equivalence.

### From Tau Ceti

Use Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

- `UpperHalfPlane.pslMk_smul` and `UpperHalfPlane.psl2zToPSL2R_smul`, in `TauCeti/Analysis/Complex/UpperHalfPlane/PSL/Action.lean`, identify the effective actions and their measure-invariance instances. `psl2zToPSL2R_injective`, in `TauCeti/LinearAlgebra/Matrix/ProjectiveSpecialLinearGroup.lean`, identifies integral projective elements faithfully.
- `OnePoint.instMulActionPSL` and `OnePoint.pslMk_smul`, in `TauCeti/Topology/Compactification/OnePoint/ProjectiveLine.lean`, give the ideal-boundary action. The Cayley compactification compatibility is proved in Layer 0.
- `TauCeti.UpperHalfPlane.isProperMap_psl_smul_I`, in `TauCeti/Analysis/Complex/UpperHalfPlane/ProperAction.lean`, and the discrete-subgroup action instance in `TauCeti/Analysis/Complex/Fuchsian/ProperAction.lean` give proper discontinuity. `Subgroup.instIsCyclicStabilizer` in `TauCeti/Analysis/Complex/Fuchsian/Stabilizer.lean` gives cyclicity of point stabilizers for discrete subgroups.
- `TauCeti.UpperHalfPlane.geodesicLine` and `TauCeti.UpperHalfPlane.dist_geodesicLine`, in `TauCeti/Analysis/Complex/UpperHalfPlane/Geodesic.lean`, supply actual complete unit-speed lines. Compact polygon convexity uses `TauCeti/Analysis/Complex/UpperHalfPlane/Polygon/Basic.lean`. The ideal-vertex area theorem is `TauCeti.UpperHalfPlane.ConvexPolygon.volume_carrier` in `TauCeti/Analysis/Complex/UpperHalfPlane/Polygon/Convex/GaussBonnet.lean`; free sides and quotient bookkeeping use the FuchsianOrbifolds contract below.
- `ModularGroup.isFundamentalDomain_fdo`, in `TauCeti/NumberTheory/Modular.lean`, is for PSL₂(ℤ) and is almost everywhere. `UpperHalfPlane.volume_preimage_coe_null`, in `TauCeti/Analysis/Complex/UpperHalfPlane/Measure.lean`, transfers planar-null boundaries. `UpperHalfPlane.volume_setOf_re_mem_Ico_and_lt_im` in the same module gives the finite-width cusp-tail mass. `Subgroup.exists_isFundamentalDomain` and `Subgroup.IsCofinite`, in `TauCeti/Analysis/Complex/Fuchsian/Covolume.lean`, give measurable quotient area and discrete finite-covolume groups, without finite generation in their definitions. The finite-index area input is `MeasureTheory.covolume_eq_card_mul_covolume` in `TauCeti/MeasureTheory/Group/FundamentalDomain.lean`, applied with the invariant measure and fundamental-domain hypotheses; equivalently use `Subgroup.isCofinite_iff_isCofinite_and_finiteIndex` in the Fuchsian covolume module for nested discrete subgroups.
- `NumberField.NarrowClassGroup`, `NumberField.NarrowClassGroup.mkPrincipal_sq` and `NumberField.NarrowClassGroup.instFinite`, in `TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.lean` and `Finite.lean`, give the native finite narrow group and J²=1. Its square-subgroup quotient and cosets supply genera; no new quotient is implicit.
- `TauCeti.Deck.conjMulEquiv`, in `TauCeti/AlgebraicTopology/UniversalCover/Deck/Conjugation.lean`, conjugates deck groups of an over-base homeomorphism h with q∘h=p. Rebase the target covering along the doubled equivalence before applying it.

### From TauCetiRoadmap.FuchsianOrbifolds

Consume Layer 0 (effective actions and proper discontinuity), Layer 1 (free quotient and finite cyclic cone charts), Layer 2, items 1–3 and 5 (geodesic polygons, local side/cycle theorem, angle defect, quotient signature bookkeeping and fundamental-domain area comparison), Layer 3 (full cusp stabilizers, scaling data and precisely invariant horodiscs), Layer 4 (cofinite compactification and genus convention), and Layer 6 (the effective level-one quotient M, its measure μ_mod of mass π/3, regular connected locus and cone charts). Restriction to CΓ uses those interior charts; this roadmap constructs its genuine half-disc boundary charts. The local polygon theorem is applied after the free-side tiling and local finiteness are proved in §1.3; the cofinite converse in Layer 2, item 4 is not an input for an infinite-area Ford polygon.

### From TauCetiRoadmap.AutomorphicSpectralTheory

Consume §§1.14–1.15 for E and E*=Λ(2s)E with Λ(s)=π^(−s/2)Γ(s/2)ζ(s), primitive-pair factor 1/2, continuation, Fourier constant term and residues −1/2,+1/2 at 0,1. Consume §4.17a for the arithmetic period, surface F_A, subgroup, projection, area, length and finite-width cusp. Consume §§4.18 and 4.20 for smooth cusp decay and uncompleted Eisenstein integrability. These section numbers specify the contracts instead of the older AS layer labels.

What AutomorphicSpectralTheory must provide (gap:primitive-minus-cycle-interface): §4.17a must export the primitive reduced minus cycle as a complete narrow-class invariant up to cyclic rotation, its attracting Pell word ∏T^nS with least norm-one unit, and its compatibility with the IntegralLattices B2–B3 oriented dictionary specialized through GlobalNumberFields Layer 11 to the native narrow class group.

What AutomorphicSpectralTheory must provide (gap:oriented-quadratic-cycle-reversal): §4.17a must identify the full primitive parametrized modular cycles C_(JA⁻¹) and C_A with opposite orientations, using the DIT coefficient actions [a,−b,c]↦A⁻¹, [−a,b,−c]↦JA and −Q↦JA⁻¹ and retaining the negative-leading-coefficient sign clause.

What AutomorphicSpectralTheory must provide (gap:completed-critical-line-c1-bounds): §§1.15 and 4.18 must export C¹ termwise Fourier differentiation on high strips, exponential bounds for nonconstant modes and first derivatives, and fixed-t bounds O(√Y log Y) and O(Y⁻¹/² log Y) for the constant term and its derivative of E*(z,1/2+it), including t=0 by holomorphic cancellation, together with the corresponding zero-mean smooth Maass cusp estimates.

The first gap refines the period construction without adding another arithmetic reduction theory here. The second fixes the signed primitive boundary required for cancellation. The third concerns the completed endpoint, rather than division by Λ(1) as a total value.

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

Consume §2.1, “Stokes on supplied Nielsen surfaces and the CM-point adapter”: the arithmetic signature (0;2 repeated ℓ_A;1;1), the boundary-period comparison with the entire oriented parametrized C_A, and the Stokes formula under absolute integrability and vanishing top flux. Only its real quadratic branch is used. Its λ=s(1−s) convention is used as written; the flux-only extension in §5.2 treats arbitrary complex eigenvalue and proves existence separately at λ=0.

### From TauCetiRoadmap.IntegralLattices and TauCetiRoadmap.GlobalNumberFields

Consume IntegralLattices Layer B, B2–B3: proper classes of primitive forms of nonsquare positive discriminant map to the narrow Picard group of the appropriate order; a negative leading coefficient requires the √D sign correction, and composition agrees with multiplication. Consume GlobalNumberFields Layer 11 for the order, invertible proper ideals, narrow Picard group and maximal-order comparison. The arithmetic specialization and DIT sign actions are exported through the §4.17a contract above; no dictionary or order carrier is rebuilt here.

### From TauCetiRoadmap.MultiquadraticPartII

Consume §§2.3–2.4, especially `J_square_iff_sumTwoSquares`: for a positive fundamental discriminant with its quadratic presentation and prime-discriminant factorization, J is square exactly when no prime congruent to 3 modulo 4 divides D, equivalently D=x²+y² for integers x,y. Retain the fundamental-discriminant and narrow-class hypotheses. This is weaker than J=1 and weaker than existence of an integral norm −1 unit. Its §§3.1–3.2 transport the genus characters through the supplied oriented form dictionary when comparing class labels.

### From TauCetiRoadmap.ConformalMapping

Consume L2, “Schwarz lemma extensions”, for disc automorphisms and Schwarz–Pick equality, transported to the statement that biholomorphisms ℍ→ℍ are PSL₂(ℝ) transformations. Consume L4, “Analytic continuation and the reflection principle”, for analytic-arc reflection and removable extension in local discs. Reflection glues genuine boundary charts; it does not forget cone orders.

### From TauCetiRoadmap.ComplexCurveModuli

Consume D0.1 for compact oriented smooth surface normal forms with finite labelled boundary and collared capping, D0.4 for its compact smooth bordered conformal double and hyperbolic uniqueness, and D6.2, “Geodesic-cut metric”, for reflection of dr²+ℓ²cosh²(r)dθ² across a genuine geodesic boundary. Layer 3 proves the extension to cusped orbifolds, retaining cone orders and complete cusp ends; no general compact smooth surface classification is repeated. The finite-type exhaustion for arbitrary finitely generated Fuchsian groups remains a target of §0.3.

### From TauCetiRoadmap.AlgebraicTopology

Consume Stage 1, “van Kampen through the fundamental groupoid”, for finite-cover presentations, and Stage 7, “Euler characteristic and finite decompositions”, for Hausdorff finite-CW models, finite excisive/cofibration gluing and invariance. The finite-type orbifold exhaustion and incompressible-boundary argument in §0.3 is local work here; it is not an unstated surface-classification input from generic van Kampen. Capping and doubling use collared boundary circles and finite CW models.

### From TauCetiRoadmap.DifferentialGeometry

Consume §5.3 Stokes for compactly supported C¹ forms, §5.5 its manifold-with-corners version, and §5.6.3 the planar top-form/curve-integral comparison, with outward-first boundary orientation. Apply to real and imaginary parts after inserting a smooth cutoff equal to one near the compact polygon. The cutoff verifies the support hypothesis without changing the integrals. The log-height rectangle in Conventions gives the value 1/4 in these conventions too.

## How to read the build

Layer 0 constructs the general convex core and bordered invariants. Layer 1 constructs raw admissible-cycle groups and proves their Ford geometry before using arithmetic periods. Layer 2 partitions a primitive boundary arc and compares the general core with the supplied arithmetic surface. Layer 3 doubles, lifts and normalizes conformal equivalences to recover cyclic gaps. Layer 4 pushes area with multiplicity and proves exact complementary and family coverings. Layer 5 uses compact height truncations to prove the improper Stokes extension and its completed spectral endpoint. Each *Needs:* line lists the statement's carriers and the inputs of the described route; another proof may use fewer inputs.

## Layer 0: Nielsen regions and bordered signatures

### 0.1 Limit set

For a discrete Γ≤PSL₂(ℝ), ΛΓ is the set of ideal-boundary accumulation points of Γz₀, in the closed-disc compactification of ℍ. Identify its ideal circle with OnePoint ℝ, including ∞. Nonelementary means |ΛΓ|>2. First kind means ΛΓ is the entire circle; second kind means it is a proper subset.

Γ is a discrete subgroup; z₀∈ℍ is arbitrary.

(DIT16, §2 p.952, limit-set paragraph, DIT16 line 149; LU23, §3.1 pp.194–195, LU23 line 275.)

A route uses the Cayley embedding z↦(z−i)/(z+i), takes the closure of the orbit in the closed unit disc and intersects the unit circle. Use the canonical boundary action in the supplier contract. Prove compatibility with the Cayley boundary identification and continuity at infinity. Bounded hyperbolic distance gives the same boundary limit, proving basepoint independence; continuity of the extended action gives conjugacy equivariance. No new ideal-boundary action is constructed here. For a nonelementary group, use attracting/repelling limits of hyperbolic words to obtain perfection and the first/second-kind dichotomy.

For the trivial or a finite elliptic subgroup the limit set is empty. Perfection is asserted only for a nonelementary subgroup; a nonempty perfect limit set is nowhere dense only in the second-kind case (LU23 §3.1, p.195, LU23 line 262).

The construction has the following API.

- The orbit-closure boundary is independent of z₀.
- ΛΓ is closed in the ideal circle.
- Λ(gΓg⁻¹)=gΛΓ.
- The fixed points of every hyperbolic element lie in ΛΓ.

**Checks.**

- For ⟨T^m⟩ with m>0, Λ={∞}, hence the group is elementary. This detects omission of the ideal point ∞.
- For a cyclic hyperbolic group, Λ is exactly its two fixed points, so nonelementarity fails. This rules out defining nonelementarity by infinitude of the group.
- For PSL₂(ℤ), Λ=OnePoint ℝ, agreeing with the parent’s cofinite group. This rules out classifying every discrete subgroup as second kind.

Changing orbit basepoint changes no ideal limit. No finite-covolume or finite-generation hypothesis is used in the definition.

*Needs:* Tau Ceti `UpperHalfPlane.pslMk_smul`; Mathlib `UpperHalfPlane.dist_eq`; Tau Ceti `TauCeti.UpperHalfPlane.isProperMap_psl_smul_I`; FuchsianOrbifolds Layer 0.

### 0.2 Nielsen core

For nonelementary discrete Γ, let CΓ be the intersection of the closed hyperbolic half-planes whose ideal closures contain ΛΓ; equivalently keep the side away from each component interval of the ideal-circle complement. Set NΓ=intℍ(CΓ). The bordered orbifold Core(Γ) is the quotient Γ\CΓ, with quotient topology and the parent’s orbifold charts restricted to the interior. Its genuine boundary is Γ\∂ℍCΓ, not the paired edges of a chosen polygon.

Γ is discrete and nonelementary.

(DIT16, §2 pp.952–953, Nielsen region and boundary convention, DIT16 line 149; SERIES05, The convex core pp.32–33, SERIES05 line 1126.)

One route is to proceed as follows. Intersect the supporting closed half-planes; noncollinearity of three limit points gives nonempty interior. Local finiteness of complementary supporting geodesics in ℍ shows that its interior is the open Nielsen region. Convexity and invariance permit restriction of the orbit relation to CΓ. Away from supporting geodesics use the existing quotient charts; on a supporting line use a half-disc chart. A nontrivial elliptic stabilizer cannot preserve a supporting half-plane at its boundary point. Boundary charts are therefore ordinary half-discs.

The construction has the following API.

- gCΓ=CΓ for g∈Γ.
- CΓ is the closed hyperbolic convex hull of ΛΓ.
- Conjugation induces an orientation-preserving orbifold isometry of cores.
- The quotient of supporting geodesics is exactly the manifold boundary.
- CΓ=ℍ exactly when ΛΓ is the whole ideal circle.

**Checks.**

- For PSL₂(ℤ), the core is the entire quotient and has no geodesic boundary. This rules out imposing an artificial boundary on a cofinite core.
- If Λ lies in a bounded real interval and ∞∉Λ, the half-plane for the complementary interval containing ∞ is inside its endpoint semicircle. This distinguishes the away-side hull from an unconditional exterior-semicircle convention.
- The two vertical sides of a modular polygon are identified and contribute no actual boundary component. This detects counting polygon representatives instead of genuine boundary circles.

Core interior and parent quotient charts agree by restriction. Every actual boundary point has trivial local stabilizer.

*Needs:* §0.1; FuchsianOrbifolds Layer 1; FuchsianOrbifolds Layer 2; Mathlib `ProperlyDiscontinuousSMul.finite_stabilizer`; Tau Ceti `Subgroup.instIsCyclicStabilizer`.

### 0.3 Finite-area Nielsen core

If Γ≤PSL₂(ℝ) is discrete, nonelementary and finitely generated, it admits a locally finite finite-sided convex fundamental polygon. Its intersection with CΓ has finite area and becomes compact after removing finitely many disjoint cusp horodiscs. There are finitely many Γ-orbits of complementary ideal intervals. Each interval stabilizer is generated by a primitive hyperbolic element, and its supporting geodesic gives one embedded boundary circle. Thus second kind is equivalent to having at least one funnel; for first kind this recovers the parent’s cofinite case.

Γ is discrete, nonelementary and finitely generated; torsion is permitted.

(LU23, §3.1 pp.194–195, Proposition 3.5; §3.3 p.198, LU23 line 275; SERIES05, Theorem 3.33 p.21; p.33, Fuchsian paragraph following Proposition 4.60, SERIES05 line 733.)

One route is to proceed as follows. Take a compact regular neighborhood of finitely many generator loops in the quotient, using local orbifold charts; its compactness meets only finitely many cone orbits. Exhaust the remaining quotient by compact subsurfaces and use the inherited van Kampen presentation. After filling inessential boundary discs, a new handle, nonannular end or unaccounted cone introduces a generator not in the original surjective subgroup. The finite generator set therefore forces finite topological type; finite cone data is a conclusion of this argument, not an initial assumption. This is the two-dimensional geometric-finiteness argument summarized by LU23 §3.1. Cut the resulting finite-type quotient along finitely many arcs to a finite-sided convex polygon; parabolic peripheral loops give cusp vertices, hyperbolic peripheral loops give free ideal intervals. Equivalently use the finite-generation/geometric-finiteness result in LU23 §3.1. Replace each free interval by its supporting axis. Polygon Gauss–Bonnet gives finite core area. The inherited cusp horodiscs leave a compact polygon. Local separation and discreteness make a boundary-axis stabilizer cyclic with a primitive generator.

The finite-generation hypothesis is retained; an arbitrary infinite-index subgroup is not asserted to be of second kind. The output polygon and end decomposition are constructed, not fields assumed in a core record.

*Needs:* §0.2; FuchsianOrbifolds Layer 2; FuchsianOrbifolds Layer 3; AlgebraicTopology Stage 1.

### 0.4 Signature with geodesic boundary

For Core(Γ) under geometric-finiteness hypotheses, its signature is (g;m₁,…,mᵣ;s;t): g is the topological genus after adjoining cusp points and capping each boundary circle by a disc, mⱼ≥2 are the cone stabilizer orders with multiplicity by orbit, s is the number of parabolic cusp orbits and t is the number of actual geodesic boundary circles. Define the scalar area expression B(g,m,s,t)=2π(2g−2+s+t+Σⱼ(1−1/mⱼ)); m is a list of natural orders, each at least two.

Γ is discrete, nonelementary and finitely generated. A finite CW model for the capped underlying surface is imported.

(DIT16, §2 pp.952–953, signature and (2.8), DIT16 line 157.)

One route is to proceed as follows. Use the finite end decomposition to cap funnels and cusps topologically; retain the cone orders in the orbifold data. Compute genus from the parent’s topological surface convention, using finite-CW Euler characteristic. The value is independent of chosen truncations and caps. Define B by finite summation; list permutation changes no value.

The construction has the following API.

- Conjugate groups have equal g,s,t and equal multisets of cone orders.
- For t=0 the data agrees with the parent’s signature.
- Permutation of cone orders preserves B.
- Doubling gives genus 2g+t−1, twice the cone list and 2s cusps, and doubles B when t≥1.

**Checks.**

- B(0,[2,3],1,0)=π/3. This detects a factor-two or curvature normalization error.
- B(0,[2 repeated ℓ],1,1)=πℓ, including ℓ=1. This detects a missing genuine-boundary contribution.
- B(0,[],0,3)=2π, while B(0,[],1,0)=−2π and cannot be a nonelementary finite-area core signature. This rejects a positive-area core assigned the punctured-sphere signature.

Boundary components contribute +t to −χorb. A cusp counts once in s and zero times in t.

*Needs:* §0.3; FuchsianOrbifolds Layer 4; ComplexCurveModuli D0.1; AlgebraicTopology Stage 7.

### 0.5 Gauss–Bonnet with geodesic boundary

For the signature (g;m₁,…,mᵣ;s;t) of a finitely generated nonelementary discrete Γ, area(Core(Γ))=B(g,m,s,t). The area is defined on an a.e. fundamental core polygon using the invariant volume instance on ℍ. It is finite, positive, independent of the polygon, and agrees with the quotient hyperbolic measure.

The signature and area use §0.4 and the inherited effective quotient charts.

(DIT16, §2 p.953, (2.8), DIT16 line 174.)

One route is to proceed as follows. Triangulate the finite core polygon, allowing ideal vertices at cusps, and sum the inherited polygon angle-defect formulas. Cancel paired edge and ordinary vertex contributions. Cone angle 2π/m contributes its stabilizer defect, a cusp is an ideal puncture, and genuine boundary is geodesic so has zero geodesic-curvature contribution. Finite-CW Euler characteristic of the capped surface gives 2−2g; removing s cusp points and t capping discs gives the stated signs. Area independence follows from the inherited fundamental-domain measure theorem.

Specializing t=0 agrees with the parent rather than introducing another cofinite-area theorem. A positive core cannot have B≤0.

*Needs:* §0.4; FuchsianOrbifolds Layer 2; AlgebraicTopology Stage 7; Mathlib `UpperHalfPlane.volume_def`.

### 0.6 Primitive funnel boundary

Each funnel peripheral free homotopy class of the regular part of Core(Γ) has one oriented closed geodesic representative, obtained from the supporting axis of the primitive interval stabilizer. It is simple on Core(Γ), avoids cone points, and is traversed once. Parabolic cusp classes have no such representative. For general hyperbolic conjugacy classes uniqueness is asserted in the orbifold sense; no claim is made that a representative must avoid all cone points.

Γ is discrete, nonelementary and finitely generated. The peripheral class belongs to a funnel, not to a cusp or cone meridian.

(DIT16, §2 pp.952–953, paragraph across the page break, DIT16 line 164.)

One route is to proceed as follows. Lift the peripheral loop to a path joining z to hz, where h is the primitive hyperbolic stabilizer of its complementary interval. The two fixed endpoints determine the unique invariant axis. A second geodesic in that class lifts to the same axis by uniqueness of a hyperbolic element’s axis. Supporting lines are disjoint and boundary stabilizers are cyclic without elliptics; hence the quotient boundary circle is simple. A parabolic element has only one ideal fixed point and no axis.

The theorem does not apply the surface geodesic theorem blindly to a punctured cone orbifold. Parametrized primitive boundary length is preserved even if its modular projection retraces.

*Needs:* §0.3; FuchsianOrbifolds Layer 2; FuchsianOrbifolds Layer 1.

### Examples

The modular group has full ideal circle, core equal to its quotient, signature (0;2,3;1;0) and area π/3. A geodesic pair of pants has (0; ;0;3) and area 2π. An elementary parabolic cyclic group has one ideal limit point and is excluded from the positive-area core theorem; a finite cyclic group has empty limit set. These distinguish limit-set definitions from finite-type conclusions.

### Dependencies

FuchsianOrbifolds Layers 0–4; ComplexCurveModuli D0.1 for compact smooth surface normal forms; ConformalMapping boundary charts through the parent; AlgebraicTopology Stages 1 and 7; the pinned metric, area, projective actions and finite stabilizers. The construction does not use arithmetic cycles or spectral functions.

## Layer 1: Quadratic cycles and their Ford polygons

### 1.1 Quadratic cycle group

Define `AdmissibleCycle` to mean that n=(n₁,…,nℓ) is nonempty, every nₖ≥2 and some nₖ>2. For any list set N₀=0, Nₖ=Σⱼ≤ₖnⱼ, m=Nℓ, Sₖ=T^Nₖ S T^−Nₖ in PSL₂(ℤ), and Γ(n)=⟨S₁,…,Sℓ,T^m⟩. Here S₀=S and Γ(n)=⟨S₀,…,Sℓ₋₁,T^m⟩. For a narrow class A use its imported primitive reduced minus period and write Γ_A=Γ(n). The raw list construction is defined without admissibility, but every geometric theorem retains the displayed digit hypotheses. The subgroup `cycleGroup` uses the alternative centres N₀,…,Nℓ₋₁; Subgroup.closure supplies its raw definition. The admissibility predicate and subgroup are the real-bodied definitions used by the headline signatures.

All group expressions use effective PSL₂(ℤ), embedded in PSL₂(ℝ). Arithmetic specializations use a positive fundamental discriminant D>1 and a primitive reduced period of A∈Cl⁺(K).

(DIT16, §3 pp.954 and 957, (3.1)–(3.2), DIT16 line 250.)

One route is to proceed as follows. Use Subgroup.closure on the finite set of conjugated S matrices and T^m; no new group carrier is introduced. Sℓ=T^m S₀ T^−m proves equality of the two generating sets. Each Sₖ acts by z↦Nₖ−1/(z−Nₖ), fixes Nₖ+i, and has exact projective order two; its SL lift squares to −I.

The predicate and, under admissibility, its group have the following API.

- An admissible list is nonempty and its digit sum is at least three.
- Cyclic rotation preserves admissibility in both directions.
- Admissibility allows repeated digit cycles; arithmetic primitivity is a separate hypothesis.
- Sₖz=Nₖ−1/(z−Nₖ); Sₖ(Nₖ+i)=Nₖ+i.
- Sₖ²=1 and Sₖ≠1 in PSL₂(ℤ).
- Membership of each Sₖ and T^m, and the universal property of the generated subgroup.
- Replacing Sℓ by S₀ gives the same subgroup.
- The integral subgroup action agrees with the canonical real projective action.

**Checks.**

- For n=[4], Γ(n)=⟨S,T⁴⟩, with m=4 and one elliptic factor. This fixes the translation width and the number of elliptic factors.
- For n=[3,6], m=9 and Γ(n)=⟨S,T³ST⁻³,T⁹⟩. This detects confusing digit count two with width nine.
- [2] and every all-2 list fail admissibility; [2] gives the parabolic boundary word T²S rather than an arithmetic hyperbolic unit. This rejects an all-2 parabolic word as a primitive hyperbolic arithmetic input.
- The empty list fails admissibility and gives the trivial raw group. The repeated list [4,4] is admissible with m=8 and two elliptic factors, while its arithmetic word is the square of the [4] word. This distinguishes a total raw construction from its admissibility and primitivity conditions.

The order-two assertion is in PSL, never in SL. An all-2 word is excluded from the arithmetic/geometric input.

*Needs:* Mathlib `ModularGroup.S`; Mathlib `ModularGroup.T`; Mathlib `Subgroup.closure`; Mathlib `Subgroup.closure_le`; Tau Ceti `UpperHalfPlane.pslMk_smul`; Tau Ceti `psl2zToPSL2R_injective`; AutomorphicSpectralTheory §4.17a (primitive cycles, Pell word and orientation contracts).

### 1.2 Ford polygon of a cycle

For admissible n as in §1.1, let P(n)={z∈ℍ:0≤Re z≤m and |z−Nₖ|≥1 for k=0,…,ℓ}. It is a closed polygon in ℍ with ideal free intervals Iₖ=(Nₖ₋₁+1,Nₖ−1); Iₖ is empty when nₖ=2. Pair the vertical sides by T^m, the two quarter-circles at 0,m by T^mS₀, and the two halves of each intermediate semicircle at Nₖ+i by Sₖ. The ideal intervals are end data, not geodesic edges or part of the surface boundary. This subset is `cyclePolygon` in the acceptance test.

n is nonempty, every nₖ≥2, some nₖ>2.

(DIT16, §3 Figures 1, 4 and 7, pp.955–958; proof of Theorem 1 p.957, DIT16 line 333.)

One route is to proceed as follows. The exterior of each unit semicircle is a closed hyperbolic half-plane; intersect them with the strip. Centers differ by at least two, so distinct open unit discs are disjoint; equality gives only a tangency on the real boundary. Check each side pairing using the explicit Möbius formulas. A semicircle must be split at its elliptic fixed point before pairing.

The construction has the following API.

- Membership is precisely the strip and the ℓ+1 exterior-disc inequalities.
- P(n) is closed, measurable and hyperbolically convex.
- The listed maps identify the actual geodesic half-sides, with order-two vertex cycle.
- Iₖ has Euclidean length nₖ−2 and is nonempty exactly for nₖ>2.
- For Y>1 the polygon above height Y is the full strip 0≤x≤m.

**Checks.**

- For [4], the sole free interval is (1,3), of length 2. This detects using n rather than n−2 for a free-interval length.
- For [3,2], I₂ is empty but its two adjacent open discs remain disjoint in ℍ. This rules out inserting an upper-half-plane overlap at an ideal tangency.
- For [3,6], the three points i,3+i,9+i lie on P and retain their order-two fixed points; the last point is identified with i by T⁹. This rejects erasing elliptic vertices or counting both vertical representatives as different orbits.

At least one Iₖ is a nonempty interval. The semicircle endpoints are ideal, so tangencies create no interior overlap.

*Needs:* §1.1; FuchsianOrbifolds Layer 2.

### 1.3 Cycle polygon presentation

For an admissible digit list, the Γ(n)-translates of P(n) tile ℍ with disjoint interiors, locally finitely away from ideal endpoints. Boundary identifications are exactly the specified side pairings. The resulting group is ℤ*(C₂)^*ℓ, where T^m generates ℤ and S₀,…,Sℓ₋₁ generate the order-two factors. The quotient has one cusp class and its full stabilizer at ∞ is ⟨T^m⟩; the elliptic orbits are represented once by Nₖ+i, k=0,…,ℓ−1, all of order two. Its underlying topological type is genus zero with one funnel end. The acceptance statements are `cyclePolygon_fundamentalDomain` for the almost-everywhere fundamental domain, `cycleGroup_presentation` for existence of the free-product isomorphism, and `cycleGroup_cuspStabilizer` for Γ(n)∩⟨T⟩=⟨T^m⟩. They all quantify over every admissible finite list.

The list is admissible; no assertion of minimality as an arithmetic period is needed for this theorem.

(DIT16, Theorem 1 and first proof paragraphs, p.957, DIT16 line 333.)

One route is to proceed as follows. Discreteness comes from the modular embedding. For any orbit, the integral bottom-row height formula gives a maximum among heights at least the starting height: only finitely many integer bottom rows occur there. Translate a maximizing point into the strip. If it lies inside a unit disc, that half-turn would increase its height, a contradiction. For uniqueness, a reduced alternating word in the translation and involution factors carries an interior point into an excluded disc or an exterior strip. This is the disjoint-disc ping-pong argument; it also proves there are no extra relations. Apply the inherited polygon cycle/orientation bookkeeping to the split half-sides. The only ideal parabolic vertex cycle is ∞, with primitive pairing T^m; traversing the remaining free ideal intervals through their endpoint identifications gives one end circle. The resulting planar polygon gluing gives genus zero. The reduction normal form shows that an element fixing ∞ has no involution syllable, hence is `T^(j*m)`. It also identifies the ℓ elliptic conjugacy classes.

The full cusp stabilizer is proved, not inferred from the presence of T^m. The finite-area cofinite converse of the parent is not used for this infinite-area domain.

*Needs:* §1.2; FuchsianOrbifolds Layer 6; FuchsianOrbifolds Layer 2; FuchsianOrbifolds Layer 3.

### 1.4 Cyclic presentation invariance

If n′ is the cyclic rotation obtained by moving the first r digits of n to the end, then Γ(n′)=T^−Nᵣ Γ(n) T^Nᵣ. The induced oriented orbifold core isometry commutes with the projection to PSL₂(ℤ)\ℍ. Thus a primitive cycle up to rotation determines the core and its projected measure, independent of the selected reduced representative.

Assume n is admissible and 0≤r<ℓ; n′ has the same cyclic order, not its reverse.

(DIT16, §3 p.954, paragraph after (3.2), DIT16 line 251.)

One route is to proceed as follows. Subtract Nᵣ from all old centers and reduce them modulo m, using the alternative generating set with S₀. Conjugation sends every involution to the involution at the translated center and fixes T^m. Apply the generated-subgroup universal property in both directions. Use hull equivariance and the fact that T^Nᵣ lies in the full modular group for the projection compatibility.

For [3,6]→[6,3], the conjugating translation is T⁻³. Reversal is not silently identified with rotation or with the same narrow class.

*Needs:* §1.1; §0.2; AutomorphicSpectralTheory §4.17a (primitive cycles, Pell word and orientation contracts).

### 1.5 Boundary word and endpoint ordering

For a primitive reduced period of A and reduced w>wσ, γ_w=S₁⋯SℓT^m=∏ₖ(T^nₖS) in PSL₂(ℤ). This is the primitive hyperbolic Pell automorph with attracting fixed point w. Set w₁=w and wₖ=Sₖ₋₁⋯S₁w for k≥2, and similarly for the conjugate. Then Nₖ₋₁<wₖσ<Nₖ₋₁+1≤Nₖ−1<wₖ<Nₖ for 1≤k≤ℓ. The weak central inequality permits nₖ=2; all other inequalities are strict.

D>1 is positive fundamental; A∈Cl⁺(K); n is its primitive reduced minus period; ε_D is the least unit >1 of norm +1.

(DIT16, §3 pp.957–958, (3.4)–(3.6), DIT16 line 349.)

One route is to proceed as follows. Telescope the conjugation powers in S₁⋯SℓT^m to obtain ∏T^nₖS. Write each transformed wₖ as Nₖ₋₁ plus its reduced remainder. Reducedness 0<remainderσ<1 and nₖ−1<remainder<nₖ gives the inequalities. The imported continued-fraction product and Pell dictionary identify the word with multiplication by ε_D, including the attracting direction. A nonprimitive repeated period would give a positive power and is excluded.

For [3,6] the SL word is [[17,−3],[6,−1]], fixing (3±√7)/2. The all-2 parabolic word fails the strict hyperbolic hypothesis.

*Needs:* §1.1; AutomorphicSpectralTheory §4.17a (primitive cycles, Pell word and orientation contracts).

### 1.6 Infinite-index cycle subgroup

For an admissible digit list, Γ(n) is nonelementary, finitely generated, of the second kind and of infinite index in PSL₂(ℤ). Its full upper-half-plane quotient has infinite area although its Nielsen core has finite area. Every nonempty Iₖ from the Ford polygon lies in the domain of discontinuity, so it supplies a concrete ideal point outside the limit set. The infinite-index headline is `cycleGroup_infiniteIndex`; its natural-valued index equals zero, the native convention for an infinite coset space.

All digit assumptions of the Ford polygon hold.

(DIT16, §3 p.954 and Theorem 1 p.957, DIT16 line 323.)

One route is to proceed as follows. The group contains a nontrivial translation and an involution moving ∞, so its limit set has more than two points. Ping-pong and the free-side tiling give a neighborhood of each interior point of Iₖ with properly discontinuous action; hence Iₖ misses ΛΓ. Some Iₖ is nonempty. A positive-length subinterval of Iₖ has a shallow strip in P with area integral ∫y⁻²dy=∞. Thus the quotient has infinite area. A finite-index subgroup of the modular group has finite area by the imported fundamental-domain index formula, proving infinite index.

Both infinite index and second kind receive proofs in the correct direction. Core area is not confused with the infinite area of Γ(n)\ℍ.

*Needs:* §1.3; §0.1; §0.3; FuchsianOrbifolds Layer 2; FuchsianOrbifolds Layer 6; Mathlib `UpperHalfPlane.volume_def`.

### Examples

For [4], m=4, the free interval is (1,3), and the group is ⟨S,T⁴⟩≅C₂*ℤ. For [3,6], m=9 and the primitive word is [[17,−3],[6,−1]], of determinant 1 and trace 16, fixing (3±√7)/2. Rotation [6,3] uses T⁻³. The raw empty list gives m=0 and the trivial generated subgroup; [2] has trace-two boundary word and fails admissibility. These boundary cases do not satisfy the Ford theorem's input.

### Dependencies

Layer 0 for limit sets and finite core area; FuchsianOrbifolds Layers 0, 2, 3 and 6; AutomorphicSpectralTheory §4.17a for the arithmetic specializations only. The raw Ford statements use no arithmetic class hypothesis.

## Layer 2: The arithmetic core and its boundary

### 2.1 Finite partition of the primitive boundary arc

For the data in the boundary word and endpoint inequalities, let z be the unique intersection of the axis (wσ,w) with |ζ|=1. Cut the oriented finite arc [z,γ_wz] at the next circle |ζ−N₁|=1, retain its initial piece in P and apply S₁ to the remaining piece. Continue the finite partition at centers N₂,…,Nℓ. After Sℓ and translation T^−m the endpoint returns to z. The retained arcs form one oriented closed curve in Γ_A\P, lying on supporting geodesics and with the core on its left. For arithmetic data use the supplied primitive cycle and boundary-period theorem; the new assertion is the explicit finite-subarc partition realizing that comparison, rather than another construction of C_A or its primitive length.

The period is primitive and reduced. Arc order is from wσ towards w; disc tangencies occur only on the real boundary.

(DIT16, Proof of Theorem 1 pp.958–959, (3.6) and Figure 7, DIT16 line 354.)

One route is to proceed as follows. The endpoint inequalities give unique crossings of the complete transformed axes with the relevant circles. To justify crossings of the finite subarcs, put qₖ=Sₖ⋯SℓT^m z. Since SℓT^m z=T^mSz and |z|=1, qℓ lies on the final circle. The identity |Sₖζ−Nₖ|=1/|ζ−Nₖ| and disjoint open discs show by descending induction that qₖ lies strictly inside the circle centered at Nₖ for k<ℓ. The starting point of that cutting step lies outside it. Thus each finite subarc reaches its next circle exactly once; for ℓ=1 the last crossing is the endpoint itself. Side pairings identify the retained endpoints and tangent directions. Their cyclic order follows the free-end circle of the polygon; their supporting half-planes are the ones containing the limit set. No nontrivial subcycle closes, by the primitive boundary word and normal form.

The construction has the following API.

- Every cutting subarc meets its next circle uniquely; the last endpoint case is allowed.
- T^−mSℓ⋯S₁γ_wz=z, with matching tangent orientation.
- The cutting maps preserve hyperbolic lengths and invariant one-form integrals.
- The retained curve goes once around the funnel boundary.
- Rotating the arithmetic period transports the curve by cyclic-rotation conjugacy.

**Checks.**

- For [4], the first crossing is γ_wz itself, so the partition construction does not require a strict interior endpoint. This rules out requiring every cut to be strictly interior to its finite arc.
- For [3,6], z=1/2+(√3/2)i, the first crossing is 5/2+(√3/2)i, and S₁γ_wz=17/2+(√3/2)i. These points test finite-subarc crossings rather than only crossings of complete axes.
- For a period containing 2, equality Nₖ₋₁+1=Nₖ−1 creates only an ideal tangency; each retained arc in ℍ still has its required ordered endpoints. This rules out replacing a retained arc by an empty ideal interval.

Crossings are proved for [z,γ_wz], not only for its infinite axis. There is one parametrized primitive boundary traversal.

*Needs:* §1.5; §1.2; §1.3; §0.6; AutomorphicSpectralTheory §4.17a; AnalyticNumberTheoryPartI §2.1.

### 2.2 Comparison with the supplied quadratic-class surface

For the primitive period of A∈Cl⁺(K), identify the supplied F_A and p_A from AutomorphicSpectralTheory §4.17a with Core(Γ(n)) and its subgroup-inclusion map to M. The comparison is an oriented orbifold isometry over M, including cone points and the genuine boundary. Set Q_A=P(n)∩CΓ_A. Prove that it represents the upstairs core measure and admits the following explicit cusp cutoff and properness refinements. Interior charts give local orbifold isometries; genuine boundary charts give isometric half-discs into full target charts. The projection may have overlapping sheets.

Use a primitive minus period supplied by AutomorphicSpectralTheory §4.17a; all arithmetic actions and the modular quotient use the effective projective group.

(DIT16, §3 p.954, definition of N_A and F_A; Theorem 1 p.957; Figure 6 p.957, DIT16 line 381.)

One route is to proceed as follows. Restrict the orbit relation and quotient charts to the same closed hull and subgroup used in the supplied Nielsen surface; the identity upstairs descends to the required comparison over M. Identify Q_A by the supporting retained arcs from the finite boundary partition. Choose Y₀>1 above all those finitely many compact arcs. Above Y₀ the core polygon is the full width-m cusp strip. The cutoff 1 works for P(n), but need not work for Q_A. Inclusion of orbit relations gives p_A. Above a sufficiently high standard modular horodisc it is the width-m cusp cover; the complement of that cusp tail in F_A is compact. This proves properness, hence finiteness of preimages away from the projected boundary and cone set. Use cyclic-rotation conjugacy for independence; do not replace the surface by a record of signature, area and length.

The construction has the following API.

- Under this comparison Q_A is an almost-everywhere fundamental core set.
- The genuine boundary agrees with the finite partition of §2.1 and with the supplied full primitive boundary period.
- The compared projection sends the orbit of z to its modular orbit.
- Rotating the period commutes with the comparison and the oriented isometry over M.
- The compared projection is proper: inverse images of compact subsets of M are compact.
- There exists Y₀>1 above all retained arcs such that Q_A above Y₀ is exactly 0≤x≤m, y>Y₀; truncation below such a height has compact closure.

**Checks.**

- The principal period [4] has one cone point; [3,2] has two. The resulting cores cannot be identified merely because their boundary lengths agree. This rejects forgetting the cone marks.
- For D=28, the principal core area is 2π, larger than area(M)=π/3; p_A therefore cannot be an isometric embedding. This detects replacing an immersed projection by an embedding.
- The width-m cusp contributes one end and no geodesic boundary component; Q_A’s vertical sides are paired. This rejects counting paired sides or a puncture as genuine geodesic boundary.
- For [3,6], the first retained boundary arc lies on (x−3/2)²+y²=7/4, from x=1/2 to x=5/2. Its maximum height is √7/2>1. The point 3/2+(6/5)i belongs to P but is below that arc and outside Q_A; height>1 alone does not identify the core cusp strip. The second retained arc lies on (x−6)²+y²=7 between x=7/2 and x=17/2, reaches height √7, and makes Y₀=3 a valid full-strip cutoff. Both arcs must enter the height bound; the Ford height-one cutoff is insufficient.

Interior maps are local orbifold isometries; boundary maps are isometric half-disc maps into full target charts. No global embedding or open local homeomorphism at the genuine boundary is asserted. The cusp is retained as a noncompact end.

*Needs:* §0.2; §1.6; §1.4; §2.1; FuchsianOrbifolds Layer 1; FuchsianOrbifolds Layer 3; FuchsianOrbifolds Layer 6; AutomorphicSpectralTheory §4.17a; AnalyticNumberTheoryPartI §2.1.

### 2.3 Elliptic lift spacing

Define V(x)=2arsinh(x/2) for real x. For x≥0 this equals arcosh(1+x²/2) and log(1+(x/2)(√(x²+4)+x)). For positive digit n, V(n)=distℍ(a+i,a+n+i), independent of a. It is strictly increasing. These are distances of specified lifts in ℍ; they are not asserted to be distances of the corresponding cone points in F_A.

Use x≥0 for the arcosh and logarithmic comparisons; the real-bodied arsinh definition is total.

(DIT16, Last paragraph of Theorem 1 proof, p.959, display V(x), DIT16 line 394.)

One route is to proceed as follows. Substitute the two height-one points into the existing UpperHalfPlane.dist_eq. The elementary hyperbolic-function identities give the two alternate expressions on the nonnegative half-line. Strict monotonicity follows from arsinh, with positive scaling.

The construction has the following API.

- For n≥0, dist(a+i,a+n+i)=V(n).
- V is strictly increasing on ℝ.
- For x≥0, cosh(V(x))=1+x²/2.
- V(0)=0.

**Checks.**

- V(0)=0. This fixes the coincident-lift boundary case.
- cosh(V(2))=3 and V(2)>0. This detects a factor-two error in hyperbolic distance.
- For [4], i and 4+i represent the same cone point of F_A; their intrinsic distance is 0 although their lift spacing V(4)>0. This separates lift spacing from intrinsic quotient distance.

The scalar normalization agrees with the pinned curvature −1 metric. This definition is not used as an unjustified intrinsic rigidity argument.

*Needs:* Mathlib `UpperHalfPlane.dist_eq`; §1.1.

### Examples

The supplied signature of F_A is (0;2 repeated ℓ_A;1;1), so bordered Gauss–Bonnet gives 2π(−2+1+1+ℓ_A/2)=πℓ_A. The supplied primitive boundary projects as the full parametrized C_A, with length 2log ε_D even for reciprocal classes. D=12 gives areas π and 2π; D=28 gives 2π and 5π. For [3,6], Q_A has a retained circle (x−3/2)²+y²=7/4, whose maximum height √7/2 exceeds one. The second retained arc has centre 6 and radius √7, so Y₀=3 is above both arcs. Its compact boundary, not the Ford semicircles alone, determines the cutoff.

### Dependencies

Layers 0–1; AutomorphicSpectralTheory §4.17a for the arithmetic surface and period; AnalyticNumberTheoryPartI §2.1 for signature and full boundary period; the pinned distance formula for the spacing specialization.

## Layer 3: Conformal recovery of the narrow class

### 3.1 Double of a bordered core

For a finite-area Nielsen core with t≥1 geodesic boundary circles, glue it to a second copy with conjugate complex structure along the identical boundary points. The double is an oriented complete boundaryless hyperbolic orbifold with genus 2g+t−1, twice the cone-order multiset, 2s cusps and area twice the core area. Reflection interchanges the two copies. It has orbifold universal cover ℍ, obtained by reflecting its cut polygon across the genuine geodesic boundary sides.

The core is connected, nonelementary and geometrically finite; each genuine boundary component is a smooth closed geodesic without cone points.

(DIT16, Theorem 1 p.957 and final proof paragraph p.959, corrected conformal-lift route, DIT16 line 387.)

One route is to proceed as follows. Use half-disc charts along the boundary and the conjugate chart on the second copy. Geodesic reflection glues them analytically and isometrically; existing interior cone charts remain unchanged. Double a finite cut polygon. The inherited polygon theorem and reflected side identifications give the boundaryless orbifold quotient of ℍ; cusp ends stay complete. Compute Euler characteristic by gluing along t circles, each of Euler characteristic zero. Count the two copies of each cusp and cone orbit and compare area by integration.

The universal covering assertion is an orbifold assertion at cone points. On the regular locus use ordinary coverings after puncturing the lifted cone set; an unramified covering of the coarse surface is not asserted.

The construction has the following API.

- Both copies embed isometrically and cover the double, meeting exactly on the common boundary.
- The exchanging map is an antiholomorphic involutive isometry.
- Signature is (2g+t−1; m concatenated with m;2s;0).
- The area is twice area(Core Γ).
- A conformal boundary-preserving orbifold equivalence doubles uniquely.

**Checks.**

- For signature (0;2 repeated ℓ;1;1), the double has signature (0;2 repeated 2ℓ;2;0). This detects identifying the two copies of every cone orbit.
- A hyperbolic pair of pants doubles to a closed genus-two surface, of area 4π. This detects applying the closed-surface genus formula before gluing.
- The formula 2g+t−1 is not applied at t=0; doubling a boundaryless connected surface gives two components. This rules out asserting a connected double without boundary.

The double carries the cone orders; it is not the double of the unmarked coarse surface. The complete hyperbolic structure is constructed from reflected charts and polygons.

*Needs:* §0.6; §0.4; ComplexCurveModuli D0.4 and D6.2; FuchsianOrbifolds Layer 1; FuchsianOrbifolds Layer 2; ConformalMapping L4; AlgebraicTopology Stage 7.

### 3.2 Conformal orbifold conjugacy

An orientation-preserving conformal orbifold equivalence f:Core(Γ_A)→Core(Γ_B), continuous and bijective on their genuine boundaries, is a hyperbolic isometry. It lifts to φ∈PSL₂(ℝ) with φΓ_Aφ⁻¹=Γ_B and φCΓ_A=CΓ_B. The hypothesis preserves each cone order, not just the coarse conformal structure. After composing φ with an element of Γ_B, the unique cusp condition gives φ(∞)=∞, hence φ(z)=az+b for a>0 and b∈ℝ.

A and B belong to the same fixed real quadratic field. The equivalence is holomorphic on the interior in orbifold charts and preserves its orientation and cone orders.

(DIT16, Final proof paragraph p.959, the lift-selection gap correction, DIT16 line 387.)

One route is to proceed as follows. Double f by reflection using the analytic boundary charts. Remove the cone points and apply the pinned ordinary covering lifting criterion to the covers obtained from the reflected polygon groups, after rebasing the target cover by the doubled f. These punctured surfaces and covering spaces are path connected and locally path connected; choose matching lifted basepoints. The subgroup defining the orbifold universal cover is the normal closure of the mⱼth powers of small cone meridians. Cone-order preservation carries this subgroup to the matching subgroup, so the lift exists in both directions. Local maps extend across removed lifts by the removable-singularity theorem in disc coordinates. Choose matching lifted basepoints in the first halves of the doubles. Uniqueness of based lifts makes the two chosen lifts inverse and supplies deck equivariance; the pinned deck conjugation API packages the resulting cover isomorphism. The inverse lifts extend to a biholomorphism ℍ→ℍ; by the imported disc automorphism/Schwarz–Pick equality classification it is a PSL₂(ℝ) isometry. The corresponding connected preimage halves are the convex, hence simply connected, cores CΓ_A and CΓ_B; their stabilizers in the doubled polygon groups are exactly the original Γ_A and Γ_B. Thus the lift maps these halves onto each other and conjugates their stabilizers. This proves the required core-group conjugacy, not only conjugacy of the larger doubled groups. Conjugacy sends parabolics and their fixed points to parabolics. Since Γ_B has one cusp orbit, compose by its deck element to fix ∞. The real projective normal form is az+b with positive a.

The lift is derived from covering theory and cone meridians, not assumed as a field. Forgetting cone marks is expressly insufficient.

*Needs:* §3.1; §1.3; ConformalMapping L2; ConformalMapping L4; FuchsianOrbifolds Layer 1; Mathlib `IsCoveringMap.existsUnique_continuousMap_lifts_of_range_le`; Tau Ceti `TauCeti.Deck.conjMulEquiv`.

### 3.3 Highest elliptic lifts

The headline `cycleGroup_highestElliptics` states the height bound and equality of the maximal-height fixed-point set with the prefix centres modulo m. A fixed-point witness is a nonidentity element of the actual subgroup, so identity fixed points are excluded.

For Γ(n), the union of all elliptic fixed points has maximal imaginary part 1, and the points attaining it are exactly {Nₖ+jm+i:0≤k<ℓ,j∈ℤ}. More precisely for γ represented by [[a,b],[c,d]] and Pₖ=Nₖ+i, Im(γPₖ)=1/((cNₖ+d)²+c²)≤1; equality holds exactly when γ∈⟨T^m⟩ or γ∈⟨T^m⟩Sₖ. The full stabilizer and the complete list of elliptic orbits are necessary inputs.

n is admissible; matrix entries are integral and determinant one; Sₖ and γ are interpreted projectively. γ belongs to Γ(n), and 0≤k<ℓ. The equality classification is not asserted for arbitrary ambient modular matrices.

(DIT16, Theorem 1 final proof paragraph p.959, corrected conformal-lift route, DIT16 line 387.)

One route is to proceed as follows. Apply the pinned imaginary-part formula at Pₖ. The denominator is a positive integer, so it is at least one. Equality of the sum of two integer squares to one leaves (c,d)=±(0,1) or c=±1,d=−cNₖ. In the first case γ is a translation; in the second γSₖ is a translation. Use the full cusp stabilizer ⟨T^m⟩, not the ambient modular translation group, to identify the exact maximal-height points. Apply the orbit classification from the Ford-polygon theorem to include all elliptics.

The integer denominator is never zero: c=0 and cNₖ+d=0 would make c=d=0, contradicting determinant one. Equality is classified inside Γ(n), not among all modular matrices.

For ℓ=1 the highest lift set has period m despite representing only one cone point. Equality classes use multiples of m, not arbitrary integral translations.

**Checks.**

- For [3,6], the elliptic points i and 3+i attain height one. The point S(3+i)=−3/10+i/10 has height 1/10 and is fixed by the conjugate of S₃; it is excluded from the maximal-height set.
- If the identity were allowed as the fixed-point witness, 2i would satisfy the premise and incorrectly require 2≤1. The witness is expressly nonidentity.
- For [4,4], the maximal-height set is ({0,4}+8ℤ)+i=4ℤ+i, while the full cusp period is 8. Recovering arithmetic periods uses primitivity and the full cusp subgroup, rather than the least period of this point set alone.

*Needs:* §1.3; Mathlib `ModularGroup.im_smul_eq_div_normSq`; Tau Ceti `UpperHalfPlane.pslMk_smul`.

### 3.4 Conformal class determines the ideal class

For A,B∈Cl⁺(K) in a fixed real quadratic field, there is an orientation-preserving conformal equivalence of bordered orbifolds F_A≅F_B if and only if A=B. It is sufficient to retain the cone points and their orders, the cusp and the oriented bordered conformal structure; the projection to M is not part of the required invariant.

The reduced periods used to construct F_A,F_B are primitive. Conformal equivalence has the precise meaning in the conformal lifting theorem.

(DIT16, Theorem 1 p.957 and last proof paragraph p.959, DIT16 line 387.)

One route is to proceed as follows. Normalize its lift as φ(z)=az+b. Since φ bijects the entire elliptic fixed-point sets and scales their heights, the maximum-height theorem gives a=1. The full positive cusp translation period therefore agrees: m_A=m_B. Translation by b carries the cyclic ordered sets of height-one lifts modulo m onto one another. Their positive successive gaps are the digit cycles, up to cyclic rotation. Apply the imported complete-invariant theorem of AutomorphicSpectralTheory §4.17a to conclude A=B. Conversely equal classes have rotated reduced periods and cyclic-rotation conjugacy supplies the equivalence.

No claim is made for antiholomorphic equivalences, which reverse cyclic order. For [3,6], V(3) and V(6) need not be the same intrinsic distance between the two cone points.

*Needs:* §3.2; §3.3; §1.4; AutomorphicSpectralTheory §4.17a (primitive cycles, Pell word and orientation contracts).

### Examples

A one-cone arithmetic core doubles to signature (0;2,2;2;0). A pair of pants doubles to genus two and area 4π. For [4], the selected successive lifts i and 4+i have spacing V(4)=2arsinh 2>0 but represent the same cone point, whose quotient distance to itself is zero. For [3,6], the distinct cyclic gaps 3 and 6 are recovered from the normalized height-one orbit set, rather than two competing values for one quotient distance.

### Dependencies

Layers 0–2; ComplexCurveModuli D0.4 and D6.2; ConformalMapping L2 and L4; AlgebraicTopology Stage 7; FuchsianOrbifolds cone and polygon charts; the pinned ordinary covering lift and over-base deck conjugation. Highest-height arithmetic uses integrality and the full cusp stabilizer.

## Layer 4: Core measures and complementary coverings

### 4.1 Modular boundary convention

Let F_DIT be the subset of ℍ given by (−1/2≤Re z≤0 and |z|²≥1) or (0<Re z<1/2 and |z|²>1). It is the half-open representative convention of DIT. Its interior is the pinned open modular domain fdo, and its symmetric difference with fdo has hyperbolic area zero. Use the parent’s modular quotient and its measure μ_mod of total mass π/3; this adapter introduces no new modular fundamental-domain theorem.

The group is effective PSL₂(ℤ); area uses the invariant volume instance on ℍ.

(DIT16, §2 p.953, definition of F, DIT16 line 195.)

One route is to proceed as follows. Write the displayed inequalities as a measurable set. Its difference from fdo is contained in two vertical rays and the unit semicircle, which are planar-null and hence invariant-area-null by the pinned boundary-null theorem. Use the existing a.e. fundamental domain and parent’s modular quotient measure to identify integrals. Tie choices matter only for representatives, not for area.

The construction has the following API.

- Membership is the displayed pair of inequalities.
- F_DIT is measurable.
- F_DIT=fdo almost everywhere for hyperbolic area.
- For any integrable invariant function, its integral on F_DIT agrees with the modular quotient integral.

**Checks.**

- i∈F_DIT although i∉fdo. This rejects using the strict open domain as the half-open representative set.
- −1/2+2i belongs and 1/2+2i does not. This fixes which vertical tie is retained.
- −1/2+(√3/2)i belongs, while 1/2+(√3/2)i and the positive-real-part open semicircle do not. This fixes which circular tie is retained.

The point i is included, and positive-real-part points on the unit semicircle are excluded. All subsequent measure equalities are independent of this null boundary choice.

*Needs:* Mathlib `ModularGroup.fdo`; Tau Ceti `ModularGroup.isFundamentalDomain_fdo`; Tau Ceti `UpperHalfPlane.volume_preimage_coe_null`; FuchsianOrbifolds Layer 6.

### 4.2 Projected core measure

Equip F_A with the hyperbolic orbifold area measure μ_A, and define ν_A=(p_A)₊μ_A on M. Thus ν_A(E)=area_A(p_A⁻¹E) for Borel E⊆M. Its total mass is πℓ_A. Equivalently, for a Borel Ω in the interior of F_DIT, ν_A(π_mod Ω)=area(Q_A∩(PSL₂(ℤ)·Ω)); this counts the distinct sheets in Q_A. The image set p_A(F_A) with restricted modular area is generally a different measure.

D>1 is positive fundamental and A is a narrow class; use the actual core and canonical map compared in §2.2.

(DIT16, §4 pp.959–960, (4.3) and complementary-cover paragraph, DIT16 line 416.)

One route is to proceed as follows. Use the inherited quotient area construction on Q_A; its null side boundaries give polygon independence. Apply the pinned measurable pushforward. Properness of p_A and local orbifold charts imply locally finite sheet multiplicity off its projected boundary; it is integer-valued almost everywhere. Compute total mass by the supplied arithmetic signature and area. Pull Borel sets and integrable functions back through p_A; the DIT polygon identity follows by the orbit relation and a.e. fundamental representatives.

The construction has the following API.

- ν_A(E)=μ_A(p_A⁻¹E) for Borel E.
- ν_A(M)=πℓ_A.
- For f integrable with respect to ν_A, ∫_M f dν_A=∫_F_A f∘p_A dμ_A.
- Rotating the period leaves ν_A unchanged.
- Away from projected boundary and cone points, the density is the finite local sheet count.

**Checks.**

- The principal D=28 core has projected mass 2π, whatever its overlapping image looks like. This detects replacing pushforward mass by image area.
- ν_A(∅)=0 and ν_A(M)=πℓ_A>0. This fixes zero mass on the empty set and positive full mass.
- When A²=J, the exact family-cover theorem gives ν_A=3ℓ_A μ_mod; replacing it by area on its image would lose the factor 3ℓ_A. This detects losing reciprocal sheet multiplicity.

ν_A(M)=πℓ_A, not π/3 merely because the image covers M. Equality is an equality of Borel measures, not only an identity on one test disc.

*Needs:* §2.2; AnalyticNumberTheoryPartI §2.1 and AutomorphicSpectralTheory §4.17a; §4.1; Mathlib `MeasureTheory.Measure.map_apply`; Mathlib `MeasureTheory.integral_map`.

### 4.3 Genus surface probability

For a nonempty finite family S⊆Cl⁺(K), let `L_S = sum_(A in S) ell_A` and `rho_S = (pi*L_S)^(-1) * sum_(A in S) nu_A`, where the scalar on measures is the corresponding nonnegative extended real. Then L_S>0 and ρ_S is a probability measure. A genus family means a coset of Cl⁺(K)² in the native narrow class group. The modular probability is μ_prob=(3/π)μ_mod.

D>1 is positive fundamental; S is finite and nonempty, and each primitive period has positive length.

(DIT16, §4 p.959, (4.1)–(4.3), DIT16 line 407.)

One route is to proceed as follows. Take a finite sum of the finite positive measures from the projected area measure. Use positivity of the period lengths to justify division, and the total-mass formula to obtain mass one. For a genus, import the existing square subgroup/coset, rather than defining another genus carrier.

The construction has the following API.

- ρ_S(M)=1.
- ρ_S(E)=Σν_A(E)/(πL_S) for Borel E.
- `rho_({A}) = nu_A / (pi*ell_A)`.
- For disjoint nonempty families, `rho_(S union R)` is the L-weighted mixture of ρ_S and ρ_R.
- Changing the representative of the same coset changes neither S nor ρ_S.

**Checks.**

- For D=28 and S={I,J}, the normalized sum has total denominator 7π, not 2π. This detects averaging individual class probabilities with equal weights.
- The empty family is excluded; its zero sum cannot define a probability measure. This prevents normalization by a totalized reciprocal of zero.
- For every exactly covered family, a modular test set of area a has probability 3a/π. This detects the wrong modular probability normalization.

Normalization uses Σℓ_A, not the number of classes. No division by zero is hidden in an empty genus or family.

*Needs:* §4.2; AutomorphicSpectralTheory §4.17a (primitive cycles, Pell word and orientation contracts); MultiquadraticPartII §§2.3–2.4; FuchsianOrbifolds Layer 6; Tau Ceti `NumberField.NarrowClassGroup.instFinite`.

### 4.4 Complementary class surfaces

Let J be the narrow class of the different, J²=1, and let ι(A)=JA⁻¹. Then `nu_A + nu_(iota(A)) = 3*(ell_A + ell_(iota(A)))*mu_mod`. Equivalently the combined local sheet count is the indicated integer almost everywhere. The projected oriented boundaries agree with opposite parametrizations. This statement includes A=ι(A), reciprocal projected geodesics and repeated or crossing arcs.

D>1 is positive fundamental; ν_A is the multiplicity-preserving pushforward and μ_mod has mass π/3.

(DIT16, §4 p.960, paragraph after (4.4), DIT16 line 439.)

One route is to proceed as follows. Import the oriented geodesic-reversal identity from the AutomorphicSpectralTheory §4.17a orientation contract and the full once-traversed boundary identification from AnalyticNumberTheoryPartI §2.1. Thus the pushed-forward oriented boundary arcs cancel with signed multiplicity, even when their images retrace. By properness and the local isometry charts, each ν has a finite integer local density on the regular modular surface away from the locally finite projected boundary. It is constant on each chamber; crossing an oriented smooth boundary arc changes it by its signed number of preimages. Opposite parametrized boundary arcs make all jumps of the sum zero. Join generic regular points by paths transverse to smooth arcs and avoiding the finitely many exceptional crossings in a compact segment; approximation handles coincident arcs. The regular modular surface is connected, so the sum density is one constant almost everywhere. Projected boundary and cone sets are area-null. Compare total masses π(ℓ_A+ℓ_ιA) and π/3 to determine the constant. The cusp width computation gives the independent check m_A+m_ιA=3(ℓ_A+ℓ_ιA), since high in the cusp both cores are full strips.

The target comparison uses oriented parametrized arcs with their preimage multiplicities. It is not obtained by cancelling unweighted image sets. At a fixed point of ι the equation still has 2ν_A on the left.

For D=12 the pair has density 9; for D=28 it has density 21. If A=ι(A), the factor of two on the left is retained.

*Needs:* §4.2; AnalyticNumberTheoryPartI §2.1 and AutomorphicSpectralTheory §4.17a; AutomorphicSpectralTheory §4.17a (primitive cycles, Pell word and orientation contracts); FuchsianOrbifolds Layer 6; Tau Ceti `NumberField.NarrowClassGroup.mkPrincipal_sq`.

### 4.5 Exact genus covering

If a nonempty finite family S is stable under ι(A)=JA⁻¹, then `sum_(A in S) nu_A = 3*(sum_(A in S) ell_A)*mu_mod` and ρ_S=μ_prob. In particular this holds for the entire narrow class group; for every genus if J∈Cl⁺(K)²; and for {A} when A²=J. The imported arithmetic criterion says J is a square exactly when no prime p≡3 mod 4 divides D, equivalently D is a sum of two integer squares. The latter criterion is not the stronger assertion J=1 or existence of a negative-norm unit.

Use the same fundamental discriminant and narrow group as the supplier. A genus is a coset of the square subgroup.

(DIT16, §4 p.960, complementary covering and principal-genus paragraph, DIT16 line 439.)

One route is to proceed as follows. Sum the complementary-measure theorem over S. The involution permutes S, so the left sum is twice Σν_A and the length sum is twice Σℓ_A; divide the finite real measure identity by two. In the exponent-two genus quotient inversion is the identity, and multiplication by J preserves each coset exactly when J is a square. Apply the imported RQ.2 criterion without reproving genus theory. For A²=J, ι fixes A and the complementary-measure theorem directly gives ν_A=3ℓ_Aμ_mod. Divide by the positive total mass for probability normalization.

D=12 and D=28 have J nonsquare; exact covering of {I,J} does not imply exact covering of either singleton. For the arithmetic criterion the RQ.2 hypotheses are used verbatim with D=fundamentalDiscriminant(d).

*Needs:* §4.4; §4.3; MultiquadraticPartII §§2.3–2.4; Tau Ceti `NumberField.NarrowClassGroup.instFinite`.

### 4.6 Discriminants twelve and twenty-eight

For D=12 the principal class has period [4], m=4, area π and boundary length 2log(2+√3); J has period [3,2], m=5 and area 2π with the same boundary length. For D=28 the principal class has period [3,6], m=9 and area 2π; J has period [3,3,2,2,2], m=12 and area 5π, with common length 2log(8+3√7). Their complementary-cover multiplicities are respectively 9 and 21. All signatures have g=0,s=t=1 and the indicated number of order-two cone points.

Use the imported form/ideal class dictionary and minimal norm-one units; these examples do not claim a general class-number-one theorem.

(DIT16, §3 example pp.955–957, Figures 1–6, DIT16 line 260.)

One route is to proceed as follows. Check reduced roots: D=12 uses 2+√3 and (3+√3)/2; their digit recurrence gives [4] and [3,2]. The norm-two ideal (2,3+√3)=(1+√3) has negative norm generator and represents J. For D=28 use (3+√7)/2 and (5+√7)/3 as in the source. Their integral ideals (2,3+√7) and (3,5+√7) are generated by 3+√7 of positive norm and 2+√7 of negative norm, respectively. Verify minimal norm-one units directly by the least positive Pell solution; apply the supplied arithmetic signature and area and the supplied primitive boundary-period and length comparison. Complementarity gives 3(1+2)=9 and 3(2+5)=21.

The D=12 example is checked arithmetically rather than attributed as a printed example. Areas count sheets, so their sums can exceed π/3.

*Needs:* AnalyticNumberTheoryPartI §2.1 and AutomorphicSpectralTheory §4.17a; §4.4; AutomorphicSpectralTheory §4.17a (primitive cycles, Pell word and orientation contracts).

### Examples

For D=12 the complementary masses π and 2π add to 3π=9(π/3). For D=28 they add to 7π=21(π/3). The genus criterion has opposite witnesses D=12, divisible by 3, and D=136=6²+10²; the latter has J square but does not assert J=1. A nonempty family uses Σℓ_A, so {I,J} in D=28 has denominator 7π, whereas the empty family cannot give a probability.

### Dependencies

Layer 2 and the supplied boundary-period comparison; native narrow-class finiteness and squares; MultiquadraticPartII §§2.3–2.4; AutomorphicSpectralTheory §4.17a orientation adapter; pinned measure pushforwards and the level-one quotient measure.

## Layer 5: Cusp-truncated Stokes and spectral inputs

### 5.1 Cusp-truncated core

Choose Y>1 above every finite boundary arc of Q_A and put Q_A(Y)=Q_A∩{Im z≤Y}. It is a compact piecewise smooth region with top segment 0≤x≤m at height Y. With the orientation dx∧dy, this segment is traversed from m+iY to iY. Its remaining edges consist of the true positively oriented core boundary and oppositely paired polygon sides. For C² F invariant under Γ_A, set α_F=i∂zF dz, with ∂zF=(F_x−iF_y)/2. It is an invariant one-form; it is not the real exterior derivative of F.

F is complex-valued and C² in real coordinates; side pairings are holomorphic, and genuine boundary orientation has the core on its left.

(DIT16, Lemma 2 proof p.972, F_A(Y) and boundary terms, DIT16 line 1038.)

One route is to proceed as follows. The explicit core polygon has a full width-m strip above its finite boundary arcs. Intersect with the height half-plane to get a compact finite-corner region. Orient each edge as a boundary of the planar region. Paired sides cancel after pullback by their holomorphic isometries; the horizontal top has the stated right-to-left direction. For cone vertices use their order-two local covers, or excise small discs and let their radii tend to zero. C¹ boundedness near lifts makes the extra integrals vanish.

The construction has the following API.

- Q_A(Y) is a compact finite-corner region for sufficiently large Y.
- The increasing height truncations exhaust Q_A.
- Above the finite arcs, the added top side has width m and right-to-left orientation.
- The α_F integrals on a paired pair of polygon sides sum to zero.
- Translation conjugacy transports truncations and preserves their height parameter.

**Checks.**

- For F=1, α_F=0, so every boundary and top contribution vanishes. This rejects using F dz in place of its differential one-form.
- For the local coordinate function F=y, α_F=dz/2, so its right-to-left top integral is −m/2; this is a sign test, not an assertion that y is Γ_A-invariant. This detects the opposite top-edge orientation.
- For F=1 and Y sufficiently large, the area of the omitted cusp tail is exactly m/Y, so the truncation is not compactification by a point. This detects forgetting the width factor in the finite cusp tail.

Paired vertical and circular sides are absent from the true boundary integral. The top contribution is −i∫₀ᵐ∂zF(x+iY)dx.

*Needs:* §2.2; §2.1; §1.2; FuchsianOrbifolds Layer 1; DifferentialGeometry §§5.3, 5.5 and 5.6.3.

### 5.2 Nielsen-core Stokes formula

Let F:ℍ→ℂ be C², Γ_A-invariant and satisfy ΔF=−y²(F_xx+F_yy)=λF with λ∈ℂ. Assume ∫₀ᵐ∂zF(x+iY)dx→0 as Y→∞. Then `I_A(F) = lim_(Y -> infinity) integral_(Q_A(Y)) F dmu` exists as a finite complex number and `(lambda/2)*I_A(F) = integral_(boundary F_A) i*(partial_z F) dz`. When F is μ_A-integrable this limit is its ordinary integral. No absolute integrability is claimed solely from the flux hypothesis. If F is invariant under the full modular group, the right side is the integral along the complete parametrized C_A. This extends the absolutely integrable identity of AnalyticNumberTheoryPartI §2.1 by proving the flux-only improper limit.

The differential operator is curvature −1 with the minus sign and factor y². The complex-valued integral uses the boundary orientation of §2.1.

(DIT16, Lemma 2, (7.10)–(7.11), p.972, DIT16 line 1025.)

One route is to proceed as follows. In real coordinates d(i∂zF dz)=−(F_xx+F_yy)dx∧dy/2=(λ/2)F dμ. Apply imported ordinary/corners Stokes to the real and imaginary parts on Q_A(Y), multiplying by a smooth cutoff equal to one on a neighborhood of this compact polygon to meet the supplier’s compact-support hypothesis; the one-form is C¹ and all side/cone cancellations are given by the compact cusp truncation. The exact finite identity is `(lambda/2)*integral_(Q_A(Y)) F dmu = integral_(boundary F_A) alpha_F - i*integral_(0 to m) (partial_z F)(x+i*Y) dx`. For λ≠0 the assumed flux convergence gives existence and the limit formula. For λ=0, write a(Y)=∫₀ᵐF(x+iY)dx. Translation periodicity and the harmonic equation give a″=0; integrating F_x over a period gives zero, so the flux is −ia′/2. Its limit zero forces a′=0, and the tail integral ∫a(Y)Y⁻²dY converges. Thus the height-truncated integral exists in this case as well. For L¹ functions use exhaustion/dominated convergence to compare with the measure integral. Γ_A-invariance already permits all the cutting maps Sₖ and T^m, so the length and one-form preservation of the finite partition identifies the boundary integral with the integral on the selected axis segment in ℍ. Full modular invariance is needed to descend the form to M and interpret this intrinsically as an integral along the complete parametrized modular cycle C_A.

For λ=0, the width-m mean a(Y)=∫₀ᵐF(x+iY)dx satisfies a″(Y)=0 and the flux is −ia′(Y)/2. A vanishing limit forces a′=0. Thus the scalar tail is a(Y₀)/Y₀, without dividing by λ. The statement does not claim absolute convergence for all harmonic Fourier modes.

The coefficient is λ/2, not λ or λ/(2i). For F=1 and λ=0 both sides vanish while I_A(1)=πℓ_A. No division by λ occurs in the harmonic branch.

*Needs:* §5.1; §2.1; Mathlib `UpperHalfPlane.volume_def`; DifferentialGeometry §§5.3, 5.5 and 5.6.3; AnalyticNumberTheoryPartI §2.1.

### 5.3 Completed critical-line specialization

For the completed weight-zero Eisenstein function E*(z,1/2+it), t∈ℝ, prove both L¹ core integrability and the horizontal flux condition using the completed C¹ estimates in the supplier contract. Then `((1/4+t^2)/2)*integral_(F_A) E*(z,1/2+i*t) dmu = integral_(C_A) i*(partial_z E*(z,1/2+i*t)) dz`. At t=0 use its regular holomorphic value, obtained by cancellation between the two constant terms, rather than evaluating their poles separately. The same formula for smooth level-one weight-zero Maass cusp eigenfunctions follows by applying the supplied cusp estimates and the integrable Stokes identity, with their given eigenvalue and no Hecke or Fourier-coefficient normalization.

Use the the supplied completion E*=Λ(2s)E, including its half-sum normalization, continuation and poles only at s=0,1. Cusp forms have zero horizontal Fourier constant term.

(DIT16, §5 pp.961–962, (5.2)–(5.7); Lemmas 1–2 p.972, (7.9)–(7.11), DIT16 line 514.)

One route is to proceed as follows. Use the supplied Fourier expansions and the differentiated cusp estimates in the supplier contract. Nonzero Fourier modes and their first derivatives decay exponentially on high strips, and integrating over the integer width m kills them exactly. For cusp forms the horizontal mean is zero. For E* on Re s=1/2 its constant term is O(√Y log Y), including the removable t=0 cancellation, and its derivative is O(Y⁻¹/² log Y). Therefore the horizontal flux tends to zero. The same growth makes |F|Y⁻² integrable over the width-m cusp strip; compact remainder integrability follows from smoothness and finite orbifold charts. Apply the improper Stokes identity and full modular invariance. No Hecke normalization, parity, subconvexity or asymptotic equidistribution proof is added here.

The cusp eigenfunction is not rescaled by the Fourier coefficient convention. At s=1/2, a √Y log Y bound suffices; no false uniform O(√Y) estimate is required.

*Needs:* §5.2; §4.2; AutomorphicSpectralTheory §§1.14–1.15, 4.18 and 4.20 (completed Fourier and cusp contracts).

### Examples

For F=1, λ=0, the integral is πℓ_A and both one-form boundary integrals vanish. For the local sign witness F=y, α_F=dz/2 and the right-to-left top side contributes −m/2; this test does not assume y is Γ_A-invariant. The omitted constant cusp tail has area m/Y. For F=log y the rectangle computation gives 1/4, fixing both the coefficient 1/2 and the orientation. For a completed critical-line constant term O(√Y log Y), the tail bound is O((log Y+2)/√Y), hence tends to zero.

### Dependencies

Layer 2 for Q_A, its compact boundary and finite-width cusp; Layer 4 for projected measures; DifferentialGeometry §§5.3, 5.5 and 5.6.3; AnalyticNumberTheoryPartI §2.1; AutomorphicSpectralTheory §§1.14–1.15, 4.18 and 4.20 with the completed C¹ contract.

## Downstream consumers

The exports for arithmetic surface-distribution applications are the finite measures ν_A and ρ_S, their exact complementary-cover identities and their positive mass normalizations. Spectral period applications receive the completed surface-to-cycle identity, with its endpoint interpretation and full parametrized boundary. The general bordered-core and doubling theory applies to finitely generated second-kind groups without quadratic arithmetic. The earlier suppliers retain their own arithmetic surfaces and integrable Stokes applications; these exports introduce no reverse dependency on this roadmap.

## References

- **DIT16.** W. Duke, Ö. Imamoḡlu and Á. Tóth, [Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), *Annals of Mathematics* 184 (2016), 949–990, DOI 10.4007/annals.2016.184.3.8. Version-of-record numbering: §2, pp.951–954; Theorem 1 and its proof, pp.957–959; §4, pp.959–960; §5, pp.961–962; Lemmas 1–2, p.972. The half-plane convention, finite-subarc justification, conformal-lift argument and Laplacian normalization used here are explicit in §§0.2, 2.1, 3.2–3.4 and 5.2; the source's conclusions are interpreted with these hypotheses.
- **LU23.** Zhipeng Lu, [Geodesic cover of Fuchsian groups](https://www.numdam.org/item/10.5802/ambp.421.pdf), *Annales mathématiques Blaise Pascal* 30 (2023), 189–199, DOI 10.5802/ambp.421. Use §§3.1–3.3, pp.194–198, particularly Proposition 3.5. Its torsion-free surgery passages are used only with the separate finite cone-chart argument stated here.
- **SERIES05.** Caroline Series, [A Crash Course on Kleinian Groups](https://rendiconti.dmi.units.it/volumi/37/01.pdf), *Rendiconti dell’Istituto di Matematica dell’Università di Trieste* 37 (2005), 1–38. Use Theorem 3.33, p.21, and the two-dimensional Fuchsian paragraph following Proposition 4.60, pp.32–33; the latter supplies two-dimensional area and funnel axes, not three-dimensional volume.
