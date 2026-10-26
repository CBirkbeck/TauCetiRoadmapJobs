# Package verification: FuchsianOrbifoldsPartII

The package contains the six-layer roadmap, headline acceptance signatures, metadata and a certified three-work sources manifest. A skeleton was generated from all 30 nodes of `packages/FuchsianOrbifoldsPartII/design/plan.json`, retaining statements, hypotheses, API, Checks, worked examples, locators and prerequisites. Only the plan's top-level `gaps` list was edited.

The supplied separate `design/review.json` is absent and the reports directory contained no acceptance report. The embedded accepted review in `design/plan.json` was read and its seven corrected-node notes applied. No missing review text was invented. The older suggested-file projection is superseded by the acceptance-file contract in the brief.

## Headline theorems selected before writing Lean

All Lean names below are in namespace `TauCetiRoadmap.FuchsianOrbifoldsPartII`.

| Headline | Status |
| --- | --- |
| General finite-area Nielsen core, finite-type ends and bordered Gauss–Bonnet | Not statable: missing ideal-hull, bordered core and signature carriers. |
| Ford fundamental domain for every admissible finite digit list | Stated: `cyclePolygon_fundamentalDomain`. |
| Free-product presentation ℤ*(C₂)^*ℓ | Stated: `cycleGroup_presentation`. |
| Full cusp subgroup Γ(n)∩⟨T⟩=⟨T^m⟩ | Stated: `cycleGroup_cuspStabilizer`. |
| Infinite modular index | Stated: `cycleGroup_infiniteIndex`; native index zero means infinite coset space. |
| Primitive finite-arc partition and comparison with the supplied arithmetic core | Not statable: missing reduced-period/axis-cycle and bordered-core carriers. |
| Highest elliptic lifts | Stated: `cycleGroup_highestElliptics`, on the native subgroup action with a nonidentity fixed-point witness. |
| Reflected double, conformal lift and narrow-class recovery | Not statable: missing bordered conformal orbifolds, doubles and class-indexed cores. |
| Complementary measures and exact finite-family/genus coverings | Not statable: missing class-indexed arithmetic surfaces, projections and area measures. |
| Flux-only improper Stokes, including λ=0, and completed critical-line endpoint | Not statable: missing oriented core boundary integration and arithmetic core domains. |

The three real-bodied definitions are `AdmissibleCycle`, `cycleGroup` and `cyclePolygon`. No API catalogue, scalar substitute, admitted example, arbitrary geometric predicate or sorry'd data was used. Every missing headline and carrier is named in the module docstring. The arithmetic surface construction, signature, primitive length, full boundary comparison and integrable Stokes specialization are supplier results, not additional local headlines.

## Corrections and unsupported portions of the design

- The design's GN.3/GN.4 arithmetic sections do not exist in the supplied head of GeometryOfNumbersAndQuadraticArithmetic. Its actual geometry-of-numbers/hermitian-K-theory README was read. AutomorphicSpectralTheory §4.17a owns the arithmetic periods, subgroup and Nielsen surfaces; AnalyticNumberTheoryPartI §2.1 owns their signature and full boundary-period comparison. The README cites those actual sections, and its surface target is a comparison rather than a second construction. The old AS labels were resolved to §§1.14–1.15, 4.18 and 4.20.
- The pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, from `lake-manifest.json`. The action module is `TauCeti/Analysis/Complex/UpperHalfPlane/PSL/Action.lean`, not the older design's PSLAction path.
- Use the full ideal circle and supporting side away from the complementary interval. If the limit set lies in [−1,1], the supporting side for the interval through infinity is inside the endpoint semicircle. This repairs DIT16 lines 149–156; compare LU23 lines 262–277.
- Complete-axis endpoint ordering is supplemented by the descending endpoint-disc induction for the finite subarc, including the one-digit terminal equality (DIT16 lines 354–379).
- The conformal argument retains cone orders, doubles, rebases the covering, verifies the cone-meridian-power subgroup inclusion, extends inverse lifts and identifies stabilizers of the selected halves. Cusp normalization and maximal elliptic height remove dilation. Selected lift distances are not intrinsic quotient distances (DIT16 lines 387–406). Compact smooth doubling is consumed from ComplexCurveModuli D0.4 and D6.2; its cusped orbifold extension is local.
- The core cusp cutoff is above all retained arcs. For [3,6], the peak is √7/2>1, and the point 3/2+(6/5)i lies in P but outside Q because 36/25<7/4. Height one only describes the Ford strip. The second retained arc has centre 6, radius √7 and peak √7>2; a safe full-strip cutoff is 3, not 2.
- The Laplacian is −y²(∂x²+∂y²), correcting DIT16 line 511 against line 1027. The top side is right-to-left. The Stokes route inserts a smooth compact-support cutoff, treats real and imaginary parts, and proves λ=0 convergence using the periodic mean without dividing by λ. Flux-only convergence is a height-truncated limit, not an absolute-integrability assertion.
- The completed endpoint at t=0 cancels opposite constant-term poles and permits √Y log Y growth. It is not evaluated by separate pole terms or by division by the totalized value Λ(1).
- Raw-list theorems allow repeated admissible lists; arithmetic boundary identification requires the primitive period. Repeating [4] changes trace 4 to 14, cusp width 4 to 8 and the unit to its square. No arithmetic cycle is silently replaced by a repeated one.
- A final carrier audit separated the native highest-elliptic-fixed-point theorem from the genuinely unavailable conformal-orbifold carriers and added it as a fifth acceptance headline.
- The design's suggested scalar/API/example catalogue was excluded from Lean. The README retains those definitions, API statements and Checks in prose.

Three exact supplier gaps are recorded in the plan and verbatim in the README under AutomorphicSpectralTheory: `primitive-minus-cycle-interface`, `oriented-quadratic-cycle-reversal` and `completed-critical-line-c1-bounds`. The first refines the complete cyclic-class invariant and Pell word; the second fixes the full primitive reversed cycle and DIT sign adapter; the third supplies differentiated completed Fourier estimates at every fixed critical-line parameter. No unstated supplier interface is claimed to exist at the pins.

No notion was moved down from a later roadmap. Every consumed roadmap is on main or earlier in the merge order. No GN.4 distribution endpoint is a prerequisite. Earlier AutomorphicSpectralTheory and AnalyticNumberTheoryPartI are not designated consumers of this package; their own existing endpoints remain independent, avoiding a reverse supply arrow. All mathematics, verdicts and edits were performed by the primary agent without helpers. No fetched instruction was executed and no out-of-scope action request was followed.

## Duplication sweep and removals

Object searches covered ideal-boundary actions, limit sets, convex/Nielsen cores, half-disc and cone charts, polygon area, primitive minus periods and Pell words, oriented quadratic cycles, reflected doubles, projection measures, genus square criteria, differentiated cusp bounds, covering lifts and Stokes. They used `roadmaps grep` over main and indexed open heads, `roadmaps show` for the actual arithmetic suppliers, direct searches of the board packages and both pinned source trees. The complete supplied open-head index was searched, including the listed sibling roadmaps. Revisions of existing roadmaps were not consumed: FuchsianOrbifolds, ConformalMapping, IntegralLattices, GlobalNumberFields, DifferentialGeometry, AlgebraicTopology and ComplexCurveModuli were read on main. The relevant new arithmetic heads were AutomorphicSpectralTheory, AnalyticNumberTheoryPartI, MultiquadraticPartII and GeometryOfNumbersAndQuadraticArithmetic. Ownership against open work was checked.

| Object excluded from local ownership | Exact supplier | Retained extension or use |
| --- | --- | --- |
| Effective ℍ and ideal-circle actions | FuchsianOrbifolds Layer 0; Tau Ceti projective action modules | Cayley compatibility and limit-set arguments. |
| Generic geodesics, polygon convexity and ideal-vertex area | FuchsianOrbifolds Layer 2; Tau Ceti geodesic/polygon modules | Core and Ford applications. |
| Quotient, cone, cusp and cofinite compactification | FuchsianOrbifolds Layers 1, 3, 4, 6 | Genuine boundary half-discs and second-kind finite-type cores. |
| Primitive arithmetic cycle and F_A construction | AutomorphicSpectralTheory §4.17a | Compare its core with the general construction; raw-list Ford theory allows all admissible lists. |
| Separate core-invariants theorem | AutomorphicSpectralTheory §4.17a; AnalyticNumberTheoryPartI §2.1 | Its signature and πℓ formula are consumed in Layer 2 Examples. General raw-list presentation remains. |
| Separate arithmetic boundary-length theorem | Same two sections | The finite-arc partition realizes the supplied full primitive boundary period and length. |
| General form/ideal dictionary, composition, orders and narrow quotient | IntegralLattices B2–B3; GlobalNumberFields Layer 11; native narrow class group | Request only the DIT convention export from the arithmetic owner. |
| Genus square/two-square criterion | MultiquadraticPartII §§2.3–2.4 | Apply it to exact family measures. |
| Ordinary covering lifts and deck conjugation | Mathlib lifting theorem; Tau Ceti deck conjugation; Completed/UniversalCovers Stage 2 | Cone-meridian and selected-half adapters. No future lifting request. |
| Compact smooth bordered double and geodesic-cut metric comparison | ComplexCurveModuli D0.4 and D6.2 | Cusped orbifold extension retaining cone orders. |
| Generic Stokes and planar comparison | DifferentialGeometry §§5.3, 5.5, 5.6.3 | Compact truncations and cutoffs. |
| Absolutely integrable core Stokes and Maass specialization | AnalyticNumberTheoryPartI §2.1; AutomorphicSpectralTheory §4.18 | Flux-only improper convergence, harmonic branch and completed endpoint. |
| Uncompleted Eisenstein continuation, decay and integrability | AutomorphicSpectralTheory §§1.14–1.15, 4.18, 4.20 | Completed critical-line C¹ strengthening only. |
| Upper-half-plane metric and modular fundamental-domain measure | Mathlib metric/fdo; Tau Ceti modular fundamental-domain theorem | Scalar height-one specialization and half-open null-boundary adapter. |
| Generic measure pushforward/change of variables | Mathlib measure map and integral map | Actual arithmetic projection specialization. |
| Finite-width high-strip mass | Tau Ceti upper-half-plane measure theorem | m/Y is a Check, not a Lean theorem target. |

No matching owner was found for the general nonelementary limit-set/core theory, bordered Gauss–Bonnet, all-admissible-list Ford statements, cusped orbifold double/lift extension, height-normalized arithmetic rigidity, complementary-measure cancellation or flux-only improper extension. The close ComplexCurveModuli targets concern smooth finite-type surfaces and their metrics; this package adds orbifold cone orders, actual subgroup conjugacy and arithmetic height normalization. No local declaration uses another roadmap's fully qualified namespace.

## Pinned declaration and source audit

These are direct reads at the pins. The resolver's inability to find its own pinned Lake packages does not substitute for this check.

| File and line | Native declarations/content read and retained hypotheses |
| --- | --- |
| `Mathlib/Analysis/Complex/UpperHalfPlane/Measure.lean:38` | MeasureSpace density y⁻² and volume_def at line 44; positive height is built into ℍ, quotient finiteness is not. |
| `Mathlib/Analysis/Complex/UpperHalfPlane/Metric.lean:42` | dist_eq and cosh_dist at line 67, with curvature −1 and denominator 2√(Im z Im w). |
| `Mathlib/Analysis/Complex/UpperHalfPlane/MoebiusAction.lean:471` | ModularGroup.im_smul_eq_div_normSq for determinant-one integral representatives. |
| `Mathlib/NumberTheory/Modular.lean:370` | fdo has both strict inequalities. |
| `Mathlib/Algebra/Group/Subgroup/Lattice.lean:329` | closure is the infimum of containing subgroups; closure_le at line 355 is its universal property. |
| `Mathlib/GroupTheory/Index.lean:55` | index = Nat.card(G ⧸ H); index_eq_zero_iff_infinite at line 561. |
| `Mathlib/Topology/Homotopy/Lifting.lean:499` | Based lifting requires path-connected and locally path-connected source, compatible lift and induced-range inclusion. |
| `Mathlib/MeasureTheory/Measure/Map.lean:170` | map_apply requires measurable map and measurable target set. |
| `Mathlib/MeasureTheory/Integral/Bochner/Basic.lean:1076` | integral_map requires AEMeasurable map and AEStronglyMeasurable target integrand. |
| `TauCeti/Analysis/Complex/UpperHalfPlane/PSL/Action.lean:140` | pslMk_smul; integral/real compatibility at line 184. |
| `TauCeti/LinearAlgebra/Matrix/ProjectiveSpecialLinearGroup.lean:138` | Injective projective embedding and projective S²=1 near line 169. |
| `TauCeti/Topology/Compactification/OnePoint/ProjectiveLine.lean:189` | Canonical ideal action and representative compatibility at line 194; specialize field coefficients to ℝ. |
| `TauCeti/Analysis/Complex/UpperHalfPlane/ProperAction.lean:58` | Proper projective orbit map, then discrete-subgroup restriction. |
| `TauCeti/Analysis/Complex/Fuchsian/Stabilizer.lean:45` | Cyclic stabilizers for discrete subgroups; finiteness from proper discontinuity. |
| `TauCeti/Analysis/Complex/UpperHalfPlane/Geodesic.lean:87` | Actual complete unit-speed line; distance formula at line 106. |
| `TauCeti/Analysis/Complex/UpperHalfPlane/Polygon/Basic.lean:68` | Compact convex polygon data, not an ideal hull or Nielsen core. |
| `TauCeti/Analysis/Complex/UpperHalfPlane/Polygon/Convex/GaussBonnet.lean:216` | Area (n−2)π minus angles, ideal angles zero. |
| `TauCeti/Analysis/Complex/Fuchsian/Covolume.lean:101` | Measurable fundamental-domain existence; IsCofinite at line 114 has discreteness and finite covolume, not finite generation. |
| `TauCeti/Analysis/Complex/UpperHalfPlane/Measure.lean:77` | Null-boundary transfer; strip mass at line 91 is ofReal((b−a)/A), A>0, including zero for b≤a. |
| `TauCeti/NumberTheory/Modular.lean:234` | Effective PSL₂(ℤ), almost-everywhere fundamental-domain theorem. |
| `TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.lean:224` and `Finite.lean:38` | Principal square-one law for a field unit and finite narrow class group for a number field. |
| `TauCeti/AlgebraicTopology/UniversalCover/Deck/Conjugation.lean:129` | Homeomorphism over one base with q∘h=p; target cover must first be rebased. |

The additional defining reads were `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:825` and line 829 (S/T matrices), `Mathlib/GroupTheory/Coprod/Basic.lean:144` and `Mathlib/GroupTheory/CoprodI.lean:98` (native coproduct groups), and `Mathlib/Topology/Algebra/ConstMulAction.lean:599` (properly-discontinuous finite stabilizers). The finite-index area theorem was read at `TauCeti/MeasureTheory/Group/FundamentalDomain.lean:322`, and its discrete Fuchsian corollary at `TauCeti/Analysis/Complex/Fuchsian/Covolume.lean:149`; fundamental-domain and invariant-measure hypotheses are retained. Searches found no Fuchsian limit-set/Nielsen-core or bordered conformal orbifold carrier at these pins. Holomorphic modular-form Eisenstein series are not the completed real-analytic weight-zero family used here.

All three references were fetched through the sources service. DIT16 and SERIES05 are journal-hosted publisher-open copies; LU23 is Numdam open-repository content. DIT16's initial licence-class failure was settled by the successful publisher-open fetch. Every cited work has one lifetime key, full bibliography, exact locators and service provenance in `sources.toml`. No missing-reference request remains. The aggregate UPSTREAM reference was replaced with exact internal supplier sections.

| Work | Numbered extraction passages read | Uses |
| --- | --- | --- |
| DIT16 | lines 85–120, 123–137, 149–217, 220–259, 260–406, 407–448, 500–540, 1009–1054 | Period conventions, sign actions, geometry, matrices, proof gaps, complementary coverage, Fourier completion and Stokes. Version-of-record numbering is used. D=12 is an additional calculation, not a printed example. |
| LU23 | lines 212–280, 286–391 | Geometric finiteness, elementary cases, away-side hull, Proposition 3.5 and torsion-free surgery restriction. |
| SERIES05 | lines 728–740, 1126–1149 | Theorem 3.33 and two-dimensional Nielsen area/funnel statement after Proposition 4.60, rather than the three-dimensional volume claim. |

No source passages or source files were copied into the repository. Replacement proof mechanisms are described as routes, not falsely attributed as printed theorems.

## Adversarial mathematics pass

The following rows contain evaluated values or sets, rather than blanket verdicts. They are mathematical witnesses, not a proof of the admitted theorems. The nonabelian in-scope group is ℤ*C₂; finite subgroups of orientation-preserving hyperbolic isometries are cyclic, so S₃ and Q₈ do not instantiate these discrete stabilizers. Fixed coefficients ℤ, ℝ and ℂ exclude zero rings, characteristic-p fields, inseparable extensions and nonreduced schemes. Empty lists/families, elementary groups, cone orders 2 and 3, repeated periods, cusp/funnel distinctions, identity maps, and zero-for-infinite native index are tested. All actual denominators have the stated positivity/nonzero hypotheses.

| Statement | Instances tried | Values on both sides / negative control | Result | Change |
| --- | --- | --- | --- | --- |
| Limit set | 1, cyclic parabolic, cyclic hyperbolic, modular | Λ=∅, {∞}, {0,∞}, whole circle; cardinalities 0,1,2,∞ | Pass | Full ideal circle retained |
| Limit set API 1: The orbit-closure boundary is independent of z₀. | i or2i for ⟨T⟩ | both boundary closures={∞} | Pass | Hypotheses retained; prose only |
| Limit set API 2: ΛΓ is closed in the ideal circle. | ⟨T⟩ and finite cyclic | closed limit sets {∞} and∅ | Pass | Hypotheses retained; prose only |
| Limit set API 3: Λ(gΓg⁻¹)=gΛΓ. | S conjugation of ⟨T⟩ | S{∞}={0}=limit of conjugate | Pass | Hypotheses retained; prose only |
| Limit set API 4: The fixed points of every hyperbolic element lie in ΛΓ. | diag(2,1/2) | hyperbolic ideal fixed set={0,∞}=cyclic limit set | Pass | Hypotheses retained; prose only |
| Limit set Check 1 | For ⟨T^m⟩ with m>0, Λ={∞}, hence the group is elementary. | Λ⟨T^m⟩={∞}, cardinal1 | Pass | Kept in README, no Lean counterpart |
| Limit set Check 2 | For a cyclic hyperbolic group, Λ is exactly its two fixed points, so nonelementarity fails. | Hyperbolic cyclic Λ={a,b}, cardinal2 | Pass | Kept in README, no Lean counterpart |
| Limit set Check 3 | For PSL₂(ℤ), Λ=OnePoint ℝ, agreeing with the parent’s cofinite group. | Modular Λ=whole circle | Pass | Kept in README, no Lean counterpart |
| Nielsen core | full circle and complementary interval through ∞ | C=ℍ for full circle; at i/2 the inside test is 1/4≤1, the outside test 1/4≥1 is false | Pass | Away-side hull; boundary half-disc |
| Nielsen core API 1: gCΓ=CΓ for g∈Γ. | modular full hull | gℍ=ℍ=C for all g | Pass | Hypotheses retained; prose only |
| Nielsen core API 2: CΓ is the closed hyperbolic convex hull of ΛΓ. | full circle / support through∞ | hull=ℍ / at i/2 inside1/4≤1 true | Pass | Hypotheses retained; prose only |
| Nielsen core API 3: Conjugation induces an orientation-preserving orbifold isometry of cores. | S conjugation twice | S²=1, transported hull twice is original | Pass | Hypotheses retained; prose only |
| Nielsen core API 4: The quotient of supporting geodesics is exactly the manifold boundary. | Γ[4] and modular polygon | genuine boundary counts1,0; paired vertical sides count0 | Pass | Hypotheses retained; prose only |
| Nielsen core API 5: CΓ=ℍ exactly when ΛΓ is the whole ideal circle. | full circle and gap(1,3) | C=ℍ in first case, C proper in second | Pass | Hypotheses retained; prose only |
| Nielsen core Check 1 | For PSL₂(ℤ), the core is the entire quotient and has no geodesic boundary. | Modular C=ℍ,t0 | Pass | Kept in README, no Lean counterpart |
| Nielsen core Check 2 | If Λ lies in a bounded real interval and ∞∉Λ, the half-plane for the complementary interval containing ∞ is inside its endpoint semicircle. | At i/2, inside1/4≤1 true and outside1/4≥1 false | Pass | Kept in README, no Lean counterpart |
| Nielsen core Check 3 | The two vertical sides of a modular polygon are identified and contribute no actual boundary component. | Paired vertical sides add0 genuine boundary circles | Pass | Kept in README, no Lean counterpart |
| Finite-area Nielsen core | modular, Γ[4], elementary ⟨T⟩ | Core areas π/3, π; (s,t)=(1,0),(1,1); ⟨T⟩ has only one ideal limit point | Pass | Nonelementary and finite generation explicit |
| Signature with geodesic boundary | modular, one-cone core, pants, punctured sphere | B=π/3,π,2π,−2π respectively; last is not a positive core area | Pass | Genuine boundary counted by t |
| Signature with geodesic boundary API 1: Conjugate groups have equal g,s,t and equal multisets of cone orders. | [3,6] translated−3 | both(g,s,t,r)=(0,1,1,2), orders{2,2} | Pass | Hypotheses retained; prose only |
| Signature with geodesic boundary API 2: For t=0 the data agrees with the parent’s signature. | modular t0 | signature(0;2,3;1;0), areaπ/3 on both conventions | Pass | Hypotheses retained; prose only |
| Signature with geodesic boundary API 3: Permutation of cone orders preserves B. | [2,3] reordered | 1/2+2/3=2/3+1/2=7/6 | Pass | Hypotheses retained; prose only |
| Signature with geodesic boundary API 4: Doubling gives genus 2g+t−1, twice the cone list and 2s cusps, and doubles B when t≥1. | g0,s1,t1,r1 | double genus0,s2,r2; Bdouble=2π=2B | Pass | Hypotheses retained; prose only |
| Signature with geodesic boundary Check 1 | B(0,[2,3],1,0)=π/3. | Bmod=2π/6=π/3 | Pass | Kept in README, no Lean counterpart |
| Signature with geodesic boundary Check 2 | B(0,[2 repeated ℓ],1,1)=πℓ, including ℓ=1. | Bℓ=πℓ, includingℓ1 givesπ | Pass | Kept in README, no Lean counterpart |
| Signature with geodesic boundary Check 3 | B(0,[],0,3)=2π, while B(0,[],1,0)=−2π and cannot be a nonelementary finite-area core signature. | Bpants=2π; punctured sphere−2π | Pass | Kept in README, no Lean counterpart |
| Gauss–Bonnet with geodesic boundary | modular and one-cone core | 2π(−2+1+1/2+2/3)=π/3; 2π(−2+1+1+1/2)=π | Pass | Curvature and boundary sign fixed |
| Primitive funnel boundary | Γ[4], translation, squared primitive word | Axis endpoints 2±√3; length 2log(2+√3); T has no axis; squared word has twice the length | Pass | Primitive funnel class only |
| Quadratic cycle group | [],[2],[4],[3,6] | (ℓ,m)=(0,0),(1,2),(1,4),(2,9); admissibility false,false,true,true; Γ[]=1 | Pass | Raw definition separated from geometry |
| Quadratic cycle group API 1: Sₖz=Nₖ−1/(z−Nₖ); Sₖ(Nₖ+i)=Nₖ+i. | S₃ on3+i,3+2i | values3+i,3+i/2 | Pass | Hypotheses retained; prose only |
| Quadratic cycle group API 2: Sₖ²=1 and Sₖ≠1 in PSL₂(ℤ). | S on2i | S²(2i)=2i and S(2i)=i/2≠2i; SL square−I | Pass | Hypotheses retained; prose only |
| Quadratic cycle group API 3: Membership of each Sₖ and T^m, and the universal property of the generated subgroup. | [4] and a containing subgroup H | T⁴,S∈H iff Γ[4]≤H | Pass | Hypotheses retained; prose only |
| Quadratic cycle group API 4: Replacing Sℓ by S₀ gives the same subgroup. | [4] endpoint generator | S₁=T⁴ST⁻⁴ so both generated subgroups agree | Pass | Hypotheses retained; prose only |
| Quadratic cycle group API 5: The integral subgroup action agrees with the canonical real projective action. | integral/real S,T at i | both actions give i and1+i | Pass | Hypotheses retained; prose only |
| Quadratic cycle group Check 1 | For n=[4], Γ(n)=⟨S,T⁴⟩, with m=4 and one elliptic factor. | [4]:ℓ1,m4,Γ=⟨S,T⁴⟩ | Pass | Kept in README, no Lean counterpart |
| Quadratic cycle group Check 2 | For n=[3,6], m=9 and Γ(n)=⟨S,T³ST⁻³,T⁹⟩. | [3,6]:ℓ2,m9,centres0,3 | Pass | Kept in README, no Lean counterpart |
| Quadratic cycle group Check 3 | [2] and every all-2 list fail admissibility; [2] gives the parabolic boundary word T²S rather than an arithmetic hyperbolic unit. | [2]:trace2, no digit>2; all-2 lists rejected | Pass | Kept in README, no Lean counterpart |
| Ford polygon of a cycle | [4],[3,2],y=2 | Gap (1,3) length2; tangent gap(4,4)=∅; y²=4>1 makes full high strip | Pass | Tangency is ideal |
| Ford polygon of a cycle API 1: Membership is precisely the strip and the ℓ+1 exterior-disc inequalities. | [4] at2+i and i/2 | first norm squares5,5≥1; second fails1/4≥1 | Pass | Hypotheses retained; prose only |
| Ford polygon of a cycle API 2: P(n) is closed, measurable and hyperbolically convex. | [4] vertical segment from2+i to2+2i | norm squares range5 to8, all exterior | Pass | Hypotheses retained; prose only |
| Ford polygon of a cycle API 3: The listed maps identify the actual geodesic half-sides, with order-two vertex cycle. | S₃ on3+exp(iπ/3) | image3+exp(2iπ/3), fixed midpoint3+i | Pass | Hypotheses retained; prose only |
| Ford polygon of a cycle API 4: Iₖ has Euclidean length nₖ−2 and is nonempty exactly for nₖ>2. | digits4 and2 | free interval lengths2 and0, nonempty exactly digit>2 | Pass | Hypotheses retained; prose only |
| Ford polygon of a cycle API 5: For Y>1 the polygon above height Y is the full strip 0≤x≤m. | [3,6] at y2 | all squared distances≥4>1; full strip width9 | Pass | Hypotheses retained; prose only |
| Ford polygon of a cycle Check 1 | For [4], the sole free interval is (1,3), of length 2. | [4] gap(1,3) length2 | Pass | Kept in README, no Lean counterpart |
| Ford polygon of a cycle Check 2 | For [3,2], I₂ is empty but its two adjacent open discs remain disjoint in ℍ. | [3,2] adjacent centres3,5 give emptygap(4,4) | Pass | Kept in README, no Lean counterpart |
| Ford polygon of a cycle Check 3 | For [3,6], the three points i,3+i,9+i lie on P; the centers 3 and 9 are not removed as cone points upstairs. | i,3+i,9+i each nearest norm-square1 | Pass | Kept in README, no Lean counterpart |
| Cycle polygon presentation | [4],[3,6],excluded[2] | Factors ℤ*C₂ and ℤ*C₂*C₂; full cusp widths4,9; [2] word trace2 | Pass | All admissible lists; no cofinite converse |
| Cyclic presentation invariance | [3,6] rotated once and twice | {0,3}−3 mod9={0,6}; two rotations give shift−9 and original group | Pass | Negative-prefix conjugation |
| Boundary word and endpoint ordering | [4],[3,2],[3,6],[4,4] | Word traces4,4,16,14 and determinant1 in each case; [4,4] is a square | Pass | Arithmetic primitivity retained |
| Infinite-index cycle subgroup | [4] gap and modular quotient | Gap length2; shallow strip integral ∫₀^ε y⁻²dy=∞; modular areaπ/3; native index0 | Pass | Free interval proves second kind |
| Boundary arc cutting | [4] endpoint and [3,6] | [4] final cut=γz; [3,6] z=(1/2,√3/2), cut=(5/2,√3/2), S₁γz=(17/2,√3/2) | Pass | Finite-subarc induction |
| Boundary arc cutting API 1: Every cutting subarc meets its next circle uniquely; the last endpoint case is allowed. | [4] versus[3,6] | terminal crossing allowed / first crossing5/2+√3i/2 | Pass | Hypotheses retained; prose only |
| Boundary arc cutting API 2: T^−mSℓ⋯S₁γ_wz=z, with matching tangent orientation. | [4] word cancellation | T⁻⁴S₁γz=z since S₁²=1 | Pass | Hypotheses retained; prose only |
| Boundary arc cutting API 3: The cutting maps preserve hyperbolic lengths and invariant one-form integrals. | [3,6] partition | retained lengths sum2log(8+3√7), same as original arc | Pass | Hypotheses retained; prose only |
| Boundary arc cutting API 4: The retained curve goes once around the funnel boundary. | primitive[4] versus squared word | lengths2log ε and4log ε, one versus two traversals | Pass | Hypotheses retained; prose only |
| Boundary arc cutting API 5: Rotating the arithmetic period transports the curve by rotation-conjugacy. | [3,6] rotation−3 | unchanged length2log(8+3√7) and modular parametrized cycle | Pass | Hypotheses retained; prose only |
| Boundary arc cutting Check 1 | For [4], the first crossing is γ_wz itself, so the algorithm does not require a strict interior endpoint. | [4] next cut=γz, equality at endpoint | Pass | Kept in README, no Lean counterpart |
| Boundary arc cutting Check 2 | For [3,6], z=1/2+(√3/2)i, the first crossing is 5/2+(√3/2)i, and S₁γ_wz=17/2+(√3/2)i. | [3,6] z=(1/2,√3/2),cut=(5/2,√3/2),S₁γz=(17/2,√3/2) | Pass | Kept in README, no Lean counterpart |
| Boundary arc cutting Check 3 | For a period containing 2, equality Nₖ₋₁+1=Nₖ−1 creates only an ideal tangency; each retained arc in ℍ still has its required ordered endpoints. | Digit2 gives ideal gaplength0, not a zero upper-half-plane retained arc | Pass | Kept in README, no Lean counterpart |
| Quadratic-class surface | [4],[3,2],[3,6], point3/2+6i/5 | Cone counts1,2,2; peak√7/2>1; 36/25<7/4 by31/100 excludes that point from Q | Pass | Comparison with supplier; correct cutoff |
| Quadratic-class surface API 1: Q_A is an a.e. fundamental set for the action on CΓ_A. | [3,6] Q and supplied surface | side-area0, representative area2π=μ_A(F_A) | Pass | Hypotheses retained; prose only |
| Quadratic-class surface API 2: Its genuine boundary is the curve returned by boundaryCut. | [4] finite partition | one curve, length2log(2+√3) on both descriptions | Pass | Hypotheses retained; prose only |
| Quadratic-class surface API 3: p_A([z])=[z], well defined by subgroup inclusion. | z and γz withγ∈Γ | modular images both[z] | Pass | Hypotheses retained; prose only |
| Quadratic-class surface API 4: Changing the reduced representative gives an oriented orbifold isometry over M. | rotation−3 | p_rot([z−3])=[z−3]=[z] | Pass | Hypotheses retained; prose only |
| Quadratic-class surface API 5: Inverse images of compact subsets of M are compact. | Y→∞ in width-m cusp | modular image also tends to cusp, not a compact interior set | Pass | Hypotheses retained; prose only |
| Quadratic-class surface API 6: There is Y₀>1 such that Q_A∩{Im z>Y₀}={z:0≤Re z≤m, Im z>Y₀}; the cutoff is chosen above all retained boundary arcs. | [3,6] cutoff3 | retained peaks √7/2 and √7 are both <3, high full strip width9 | Pass | Hypotheses retained; prose only |
| Quadratic-class surface Check 1 | The principal period [4] has one cone point; [3,2] has two. The resulting cores cannot be identified merely because their boundary lengths agree. | Cone counts1≠2, common boundary length2log(2+√3) | Pass | Kept in README, no Lean counterpart |
| Quadratic-class surface Check 2 | For D=28, the principal core area is 2π, larger than area(M)=π/3; p_A therefore cannot be an isometric embedding. | D28 area2π vsπ/3, ratio6 | Pass | Kept in README, no Lean counterpart |
| Quadratic-class surface Check 3 | The width-m cusp contributes one end and no geodesic boundary component; Q_A’s vertical sides are paired. | s1,t1; paired vertical sides add0 to t | Pass | Kept in README, no Lean counterpart |
| Quadratic-class surface Check 4 | For [3,6], the first retained boundary arc lies on (x−3/2)²+y²=7/4, from x=1/2 to x=5/2. Its maximum height is √7/2>1. The point 3/2+(6/5)i belongs to P but is below that arc and outside Q_A; height>1 alone does not identify the core cusp strip. | 36/25<7/4 by31/100, peak√7/2>1 | Pass | Kept in README, no Lean counterpart |
| Quadratic-core signature and area | supplied ℓ=1,2,5 | 2π(−2+1+1+ℓ/2)=π,2π,5π; g0,s1,t1 | Pass / supplied | Local duplicate deleted; consumed in examples |
| Quadratic-core boundary length | D12,D28,D8 | ε=2+√3,8+3√7,3+2√2; lengths2log ε; −1 contributes no halving | Pass / supplied | Local duplicate deleted; supplied primitive comparison |
| Elliptic lift spacing | x=0,2,3,4,6,−2 | cosh V=1,3,11/2,9,19; V(−2)=−V(2), while distance is positive | Pass | Nonnegative distance/arcosh argument |
| Elliptic lift spacing API 1: For n≥0, dist(a+i,a+n+i)=V(n). | i and2+i | distance=2arsinh1=V2>0 | Pass | Hypotheses retained; prose only |
| Elliptic lift spacing API 2: V is strictly increasing on ℝ. | x0,2,4 | V=0,1.762747174039,2.887270950358, strictly ordered | Pass | Hypotheses retained; prose only |
| Elliptic lift spacing API 3: For x≥0, cosh(V(x))=1+x²/2. | x0,2,4 | cosh V=1,3,9=1+x²/2 | Pass | Hypotheses retained; prose only |
| Elliptic lift spacing API 4: V(0)=0. | x0 | 2arsinh0=0=distance(i,i) | Pass | Hypotheses retained; prose only |
| Elliptic lift spacing Check 1 | V(0)=0. | V0=0 | Pass | Kept in README, no Lean counterpart |
| Elliptic lift spacing Check 2 | cosh(V(2))=3 and V(2)>0. | cosh V2=3,V2≈1.762747174039>0 | Pass | Kept in README, no Lean counterpart |
| Elliptic lift spacing Check 3 | For [4], i and 4+i represent the same cone point of F_A; their intrinsic distance is 0 although their lift spacing V(4)>0. | [4] quotient distance0<V4≈2.887270950358 | Pass | Kept in README, no Lean counterpart |
| Double of a bordered core | one-cone core, pants,t0 | Double signatures (0;2,2;2;0) and genus2 area4π; t0 gives two components | Pass | t≥1 and cone orders retained |
| Double of a bordered core API 1: Both copies embed isometrically and cover the double, meeting exactly on the common boundary. | one-boundary core | copies intersect in exactly1 circle, off-boundary multiplicity1 | Pass | Hypotheses retained; prose only |
| Double of a bordered core API 2: The exchanging map is an antiholomorphic involutive isometry. | half-disc ζ | conjugation²ζ=ζ and ∣dconj ζ∣=∣dζ∣ | Pass | Hypotheses retained; prose only |
| Double of a bordered core API 3: Signature is (2g+t−1; m concatenated with m;2s;0). | g0,s1,t1,rℓ | double g0,s2,t0,r2ℓ | Pass | Hypotheses retained; prose only |
| Double of a bordered core API 4: The area is twice area(Core Γ). | one-cone core and pants | double areas2π=2·π,4π=2·2π | Pass | Hypotheses retained; prose only |
| Double of a bordered core API 5: A conformal boundary-preserving orbifold equivalence doubles uniquely. | identity and translated map | doubles restrict to same map; double(id)=id | Pass | Hypotheses retained; prose only |
| Double of a bordered core Check 1 | For signature (0;2 repeated ℓ;1;1), the double has signature (0;2 repeated 2ℓ;2;0). | (0;2^ℓ;1;1)→(0;2^(2ℓ);2;0) | Pass | Kept in README, no Lean counterpart |
| Double of a bordered core Check 2 | A hyperbolic pair of pants doubles to a closed genus-two surface, of area 4π. | Pants genus0,t3→double genus2,area4π | Pass | Kept in README, no Lean counterpart |
| Double of a bordered core Check 3 | The formula 2g+t−1 is not applied at t=0; doubling a boundaryless connected surface gives two components. | t0 produces2 components, connected formula excluded | Pass | Kept in README, no Lean counterpart |
| Conformal orbifold conjugacy | identity,translation3,dilation2 | Identity deck conjugacy; z↦z+3 preserves heights; z↦2z sends max height1 to2 | Pass | Based lifting and selected halves |
| Highest elliptic lifts | P=3+i; identity,S,S₃ | Integer denominators1,10,1 give heights1,1/10,1; zero bottom row contradicts det1 | Pass | Equality classified inside Γ |
| Conformal class determines the ideal class | [3,6] versus[6,3]; [4] versus[3,2] | Gaps agree up to rotation in first pair; cone counts1≠2 in second despite equal boundary length | Pass | Use highest-lift orbit, not quotient distances |
| Modular boundary convention | i,±1/2+2i,±1/2+√3i/2 | Membership true, left true/right false, left true/right false; open fdo excludes ties | Pass | Null-boundary adapter |
| Modular boundary convention API 1: Membership is the displayed pair of inequalities. | ±1/2+2i | left membership true,right false | Pass | Hypotheses retained; prose only |
| Modular boundary convention API 2: F_DIT is measurable. | i and coordinate rays | finite coordinate inequalities are Borel, boundary mass0 | Pass | Hypotheses retained; prose only |
| Modular boundary convention API 3: F_DIT=fdo almost everywhere for hyperbolic area. | ties i and left vertical | different membership from fdo but area0 on both | Pass | Hypotheses retained; prose only |
| Modular boundary convention API 4: For any integrable invariant function, its integral on F_DIT agrees with the modular quotient integral. | F1 | both modular-domain integralsπ/3 | Pass | Hypotheses retained; prose only |
| Modular boundary convention Check 1 | i∈F_DIT although i∉fdo. | i∈DIT true,i∈fdo false | Pass | Kept in README, no Lean counterpart |
| Modular boundary convention Check 2 | −1/2+2i belongs and 1/2+2i does not. | Left vertical true,right false | Pass | Kept in README, no Lean counterpart |
| Modular boundary convention Check 3 | −1/2+(√3/2)i belongs, while 1/2+(√3/2)i and the positive-real-part open semicircle do not. | Left circular endpoint true,right false; positive-real open circle arc false | Pass | Kept in README, no Lean counterpart |
| Projected core measure | D28 principal,empty,reciprocal | νM=2π versus image area≤π/3; ν∅=0; reciprocal 2ν=6ℓμ | Pass | Keep sheet multiplicity |
| Projected core measure API 1: ν_A(E)=μ_A(p_A⁻¹E) for Borel E. | E∅,M | preimage masses0,πℓ=ν∅,νM | Pass | Hypotheses retained; prose only |
| Projected core measure API 2: ν_A(M)=πℓ_A. | D28 principal | νM=μ_A(F_A)=2π | Pass | Hypotheses retained; prose only |
| Projected core measure API 3: ∫_M f dν_A=∫_F_A f∘p_A dμ_A for integrable f. | f1,f0 | both pushforward integrals2π,0 | Pass | Hypotheses retained; prose only |
| Projected core measure API 4: Rotating the period leaves ν_A unchanged. | rotation−3 | pullback integrals identical under[z−3]=[z] | Pass | Hypotheses retained; prose only |
| Projected core measure API 5: Away from projected boundary and cone points, the density is the finite local sheet count. | two regular sheets over area a | νE=2a, density2 rather than image density1 | Pass | Hypotheses retained; prose only |
| Projected core measure Check 1 | The principal D=28 core has projected mass 2π, whatever its overlapping image looks like. | D28 ν_I(M)=2π | Pass | Kept in README, no Lean counterpart |
| Projected core measure Check 2 | ν_A(∅)=0 and ν_A(M)=πℓ_A>0. | ν∅0;νM=πℓ>0 | Pass | Kept in README, no Lean counterpart |
| Projected core measure Check 3 | When A²=J, exact-cover gives ν_A=3ℓ_A μ_mod; replacing it by area on its image would lose the factor 3ℓ_A. | Reciprocalν=3ℓμ, massπℓ rather thanπ/3 | Pass | Kept in README, no Lean counterpart |
| Genus surface probability | D28 pair,singleton,empty | L=2+5=7; total7π/(7π)=1; singleton1; empty total0 | Pass | Nonempty family required |
| Genus surface probability API 1: ρ_S(M)=1. | D28 pair | (2π+5π)/(7π)=1 | Pass | Hypotheses retained; prose only |
| Genus surface probability API 2: ρ_S(E)=Σν_A(E)/(πL_S) for Borel E. | E∅,M | normalized masses0/(7π)=0,7π/(7π)=1 | Pass | Hypotheses retained; prose only |
| Genus surface probability API 3: ρ_{ {A} }=ν_A/(πℓ_A). | singletonℓ2 | νM/(2π)=1 | Pass | Hypotheses retained; prose only |
| Genus surface probability API 4: For disjoint nonempty families, ρ_{S∪R} is the L-weighted mixture of ρ_S and ρ_R. | disjointℓ2 andℓ5 | weights2/7+5/7=1 | Pass | Hypotheses retained; prose only |
| Genus surface probability API 5: Changing the representative of the same coset changes neither S nor ρ_S. | A C² and AB² C² | identical cosets and identical summands | Pass | Hypotheses retained; prose only |
| Genus surface probability Check 1 | For D=28 and S={I,J}, the normalized sum has total denominator 7π, not 2π. | D28 L7,denominator7π | Pass | Kept in README, no Lean counterpart |
| Genus surface probability Check 2 | The empty family is excluded; its zero sum cannot define a probability measure. | EmptyL0,measure0≠probabilitymass1 | Pass | Kept in README, no Lean counterpart |
| Genus surface probability Check 3 | For every exactly covered family, a modular test set of area a has probability 3a/π. | Area a gives3a/π; aπ/3 gives1 | Pass | Kept in README, no Lean counterpart |
| Complementary class surfaces | D12,D28,fixed point of ι | (π+2π)/(π/3)=9; (2π+5π)/(π/3)=21; fixed class retains2ν | Pass | Signed parametrized cancellation |
| Exact genus covering | stable whole group, genus, reciprocal singleton | Σν=3Lμ and normalized mass1; D12 fails square criterion; 136=6²+10² passes | Pass | J square is weaker than J=1 |
| Discriminants twelve and twenty-eight | D12 I/J,D28 I/J | (ℓ,m)=(1,4),(2,5),(2,9),(5,12); areasπ,2π,2π,5π; densities9,21 | Pass | D12 is an added calculation |
| Cusp-truncated core | F1,Fy,width m | α₁=0; α_y=dz/2 gives top−m/2; omitted area m/Y | Pass | True and artificial boundary separated |
| Cusp-truncated core API 1: Q_A(Y) is a compact finite-corner region for sufficiently large Y. | [3,6] cutoff3 | both peaks≤√7<3; compact truncated set has positive minimum height | Pass | Hypotheses retained; prose only |
| Cusp-truncated core API 2: The increasing height truncations exhaust Q_A. | point height y | membership holds for Y≥max(Y₀,y); union=Q | Pass | Hypotheses retained; prose only |
| Cusp-truncated core API 3: Above the finite arcs, the added top side has width m and right-to-left orientation. | m9,Y2 | top displacement from9+2i to2i is−9 | Pass | Hypotheses retained; prose only |
| Cusp-truncated core API 4: The α_F integrals on a paired pair of polygon sides sum to zero. | F1 and invariant form on paired sides | 0+0=0; general pair I+(−I)=0 | Pass | Hypotheses retained; prose only |
| Cusp-truncated core API 5: Translation conjugacy transports truncations and preserves their height parameter. | translation−3 | Im(z−3)=Im z so same height truncation | Pass | Hypotheses retained; prose only |
| Cusp-truncated core Check 1 | For F=1, α_F=0, so every boundary and top contribution vanishes. | F1 givesα0,top0,boundary0 | Pass | Kept in README, no Lean counterpart |
| Cusp-truncated core Check 2 | For the local coordinate function F=y, α_F=dz/2, so its right-to-left top integral is −m/2; this is a sign test, not an assertion that y is Γ_A-invariant. | Fy givesαdz/2,top−m/2 | Pass | Kept in README, no Lean counterpart |
| Cusp-truncated core Check 3 | For F=1 and Y sufficiently large, the area of the omitted cusp tail is exactly m/Y, so the truncation is not compactification by a point. | m∫_Y^∞y⁻²dy=m/Y | Pass | Kept in README, no Lean counterpart |
| Nielsen-core Stokes formula | F1 λ0; logy rectangle; affine harmonic mean | 0=0 with I=πℓ; rectangle1/4=(1/2)(1/2); a(Y)=a₀+bY has flux−ib/2 so b=0 | Pass | Separate harmonic branch; support cutoff |
| Automorphic surface-to-cycle identity | completed t0,fixed t≠0,zero cusp mean | Opposite1/(2ε) poles cancel to√Y(logY+2c); derivativeY⁻¹/²((logY)/2+c+1); λ(t0)=1/4 | Pass | Completed C¹ supplier gap |
| Effective action | S on2i | S(2i)=i/2≠2i, S²(2i)=2i; SL square−I | Pass | PSL convention |
| Left products | [3,6] and reversed product | T³ST⁶S=[[17,−3],[6,−1]], T⁶ST³S=[[17,−6],[3,−1]] | Pass | Right-to-left action order |
| Empty raw list and indexing | take0,takeℓ,[] | N₀0,Nℓm; closure{T⁰}=closure{1}=1 | Pass | Fin/range bounds in Lean |
| Narrow principal signs | √3,1+√3,3+√7,2+√7 | Norms−3,−2,+2,−3: labelsJ,J,I,J | Pass | Sign clause retained |
| Unit convention | D8,D12,D28 | (1+√2)²=3+2√2; 2²−3=1; 8²−7·3²=1 | Pass | Least norm-one unit |
| J square versus trivial | D12,D136 | 12 divisible3 mod4; 136=6²+10²; J²1 in both, J not forced1 | Pass | No negative-norm-unit inference |
| Genus involution both directions | C/C² | [A⁻¹]=[A], [ιA]=[J][A]; equality iff[J]=1 | Pass | Native square coset |
| Orientation and Stokes coefficient | Flogy on width1,heights1,2 | Bottom1/2+top(−1/4)=1/4=(1/2)∫ΔF dμ | Pass | Same witness in supplier and Layer5 |
| Exterior derivative sign | F=x²+y² | α=i(x−iy)dz, dα=−2dx∧dy=−(4/2)dx∧dy | Pass | Factor−1/2 fixed |
| Laplacian exponent | Fy² | CorrectΔF=−2y²; printed inverse-square gives−2y⁻² | Pass | Use y² |
| Top orientation | Fy,widthm | ∂zF=−i/2; −i∫∂zF=−m/2 equals direct top integral | Pass | Right-to-left top |
| Harmonic mean | a(Y)=a₀+bY | a″0,flux−ib/2; zero limiting flux forcesb0; taila₀/Y | Pass | No division byλ |
| Disc inversion | S₃ on3+2i,3+i/2 | Distances2,1/2 interchange, product1 | Pass | Finite endpoint induction |
| D28 endpoints | z=1/2+√3i/2 | γz=175/62+√3i/62; radius to3=1/√31<1; S₁γz=17/2+√3i/2,radius to9=1 | Pass | Finite crossing including terminal equality |
| Completed pole cancellation | s=1/2+ε | Opposite residues±1/(2ε) cancel; limit√Y(logY+2c) | Pass | No separate pole evaluations |
| Completed tail bound | √y logy | ∫_Y^∞y⁻³/²logy dy=(2logY+4)/√Y→0 | Pass | Endpoint integrable |
| Fourier convention | integer m,n≠0 | ∫₀ᵐexp(2πinx)dx=0; n0 mean=m | Pass | Width and 2π factor |
| Double natural subtraction | g0,t1;t3;t0 | 2g+t−1=0,2; t0 double has2components | Pass | Requiret≥1 |
| Primitive/repeated cycle | [4],[4,4] | Traces4,14; widths4,8; unitsε,ε²; areasπ,2π | Pass | Arithmetic primitive; raw theorem general |
| Nonabelian control | Γ[4] | ST⁴=[[0,−1],[1,4]] and T⁴S=[[4,−1],[1,0]] differ even up to sign | Pass | No commutative shortcut |
| Cusp multiplicity | D12,D28 | 4+5=9=3(1+2); 9+12=21=3(2+5) | Pass | Independent mass check |
| Endpoint weak inequality | D12 J period[3,2] | w=(3+√3)/2∈(2,3),wσ∈(0,1); S₃w=4+√3/3∈(4,5),conjugate4−√3/3∈(3,4) | Pass | Central equality4=4 allowed |
| Identity and universes | identity core map and translation−3 | id∘id=id, Im(z−3)=Im z, modular[z−3]=[z] | Pass | Ordinary small finite-type surfaces |
| Admissibility API: nonempty and sum≥3 | [],[2],[4] | Empty and [2] rejected; [4] accepted with sum4≥3 | Pass | Explicit predicate API in prose |
| Admissibility API: rotation invariance both directions | [3,6] and [6,3] | Same nonempty list length2 and same digits3,6>2; both accepted | Pass | Explicit predicate API in prose |
| Admissibility API: arithmetic primitivity separate | [4] and [4,4] | Both accepted; traces4 and14 distinguish primitive word from square | Pass | No primitivity hidden in raw predicate |
| Empty and repeated cycle Check | [] and [4,4] | Γ[]=1, admissibility false; repeated list true, m8, two elliptic factors | Pass | Added explicit raw-list boundary Check |
| Complete D28 cutoff Check | Both retained arcs for [3,6] | Peaks√7/2 and√7; max√7<3, while√7>2 | Pass | Full-strip cutoff3 rather than2 |
| Highest-set nonidentity Check | z=2i with identity allowed | Premise would hold but 2≤1 is false; nonidentity witness excludes it | Pass | Actual subgroup fixed-point premise |
| Highest-set lower lift Check | S(3+i)=−3/10+i/10 | Height1/10<1, distinct from the highest centres0,3 modulo9 | Pass | Whole elliptic set versus equality set |
| Highest-set repeated-cycle Check | [4,4] | ({0,4}+8ℤ)+i=4ℤ+i, but full cusp period8 | Pass | Point-set period does not replace full cusp subgroup |

The pass has 163 statement/API/Check/convention rows. Integer word products were evaluated independently for [], [2], [4], [3,2], [3,6], [3,3,2,2,2] and [4,4]; determinant is one in every case. The D=28 J word is [[23,−18],[9,−7]], of trace 16, and its eigenvalue at (5+√7)/3 is 8+3√7. Approximate spacing values only cross-check exact cosh identities; no numerical approximation is a theorem hypothesis. No new unused-hypothesis finding is asserted.

## Elaboration and binder audit

The final `packages/FuchsianOrbifoldsPartII/Suggested.lean` was elaborated with `lake env lean` from the pinned content checkout, passing the file's absolute path as required. Exit status: **0**. Exactly **5** warnings occurred, on theorem lines 55, 62, 70, 77 and 87. Each warning's message, verbatim, is:

    warning: declaration uses `sorry`

There were **no other messages**. The used Tau Ceti action object file existed, so no prerequisite build was necessary. No bare build, update, cache fetch, manifest or toolchain modification was performed. The first elaboration attempt from the board directory was corrected to the specified content working directory; the outcomes above are from that required working directory.

A scratch file containing the final source plus `#check @name` for every one of its **eight** declarations was elaborated once. It produced the same five admitted-proof warnings and the eight requested type displays. All five theorems retain explicit n : List ℕ and AdmissibleCycle n. The definitions have exactly the types List ℕ→Prop, List ℕ→Subgroup PSL₂(ℤ) and List ℕ→Set UpperHalfPlane. The free-product factors retain the index Fin n.length. The highest-elliptic theorem has an actual nonidentity subgroup element as its fixed-point witness; the identity cannot make its premise vacuous. The measure is native hyperbolic volume and the cusp equality uses the full ambient translation subgroup. README generality matches these signatures, with arithmetic primitivity required only by the separate arithmetic targets. No standing binder was silently dropped and no definition or theorem changed after this final binder audit. The carrier audit added the statable highest-fixed-point headline; it did not add a weakened geometric stand-in.

## Dependency, citation, source and identifier checks

The final mechanical dependency command was the brief's `gate --depcheck` with name FuchsianOrbifoldsPartII, the supplied order and `--movable`. Its output was:

    depcheck: 34 roadmaps, 311 edges, 0 problem(s)

There is no UPWARD or CYCLE line and no merge-order file was edited. All three supplier gaps point to earlier AutomorphicSpectralTheory sections.

`roadmaps resolve` reported no unresolved cross-roadmap citations and no unresolved Lean names. Its additional message, verbatim, was:

    Lean names outside TauCetiRoadmap were not checked: no pinned Lake packages on this host.

The external declarations were therefore checked directly in the pinned source files, as recorded above. The MultiquadraticPartII head's `Suggested.lean` was also read: its `J_square_iff_sumTwoSquares` is in namespace TauCetiRoadmap.MultiquadraticPartII and retains the quadratic minimal-polynomial/generation, squarefreeness, positive radicand and prime-discriminant-factorization hypotheses.

The sources-service check output was:

    packages/FuchsianOrbifoldsPartII/sources.toml: 0 problem(s)

Static checks found all eight local declarations documented, zero missing own identifiers, one `import Mathlib`, one actually used Tau Ceti action import, five theorem `sorry` bodies, no sorry'd data and no `set_option`. All three plan gaps match their README contracts verbatim; the remainder of the plan is unchanged. The deliverables contain no machine paths or copied source text. `git diff --check` passed. Only the six permitted deliverable paths changed; scratch work stays outside the package. No Lean process remains running.
