# Review of RiemannianManifoldsWithConvexBoundary (design, round 2)

**Verdict:** needs changes

Seven findings: two P1, four P2, one P3. The scope remains repairable. The six earlier findings were checked first, individually, against the repaired files and the present suppliers. The mathematical repairs to the enlargement work; the ownership situation has changed. No design or source-manifest file was modified by this review.

## Previous findings and repairs

| Earlier finding | Repaired passage in packages/RiemannianManifoldsWithConvexBoundary/design/README.md | Assessment |
|---|---|---|
| F01: uncontrolled defining function in enlargement | Lines 857–858: “`ρ̂ = 1` on `M ∖ W`, `ρ̂ = −1` on `N ∖ (M ∪ W)`”; lines 930–931: “`M_ε := {ρ̂ ≥ −ε}` equals `M ∪ E_{∂M}(∂M × [−ε, 0))`”. | **Repaired.** The sandwich property forces every added point into the inner tube when ε < min(ε₁,1). The former counterexample is excluded. Rechecked §§4.3, 4.6 and its use in §5.5 below. |
| F02: oversized boundary-gluing gap | Lines 619–622: “compatible open gluing”; lines 624–629: “Hausdorff by the closed-relation criterion” and “second countable as a gluing of two second-countable pieces”. | **Partly repaired.** The gap is deleted and the open-gluing proof is mathematically valid. However, current main now expressly owns these constructions: GeometricTopology §§1.1, 1.3 and AffineMorseLefschetz §4.5. The repaired ownership claim must change, R01. |
| F03: missing gap slugs | Lines 216–219: “What DifferentialGeometry must provide (gap:dg-outward-unit-normal)”. | **Repaired as requested.** Exactly the surviving plan slug occurs. The contract is now supplied on main, a separate R02 finding. |
| F04: two locator slips | Lines 318–319: “Uhlmann–Vasy, lines 134–136 and 25–26”; lines 1261–1262: “the spherical-cap instance is Paternain–Salo–Uhlmann, Example 3.1.4, lines 2677–2678”. | **Repaired.** The first source defines the weaker function; the second names small caps. The normalised-function locator remains in §4.3. |
| F05: nonexistent named consumer | Line 1312: “A future Lorentzian geometry roadmap (domains with boundary)”. | **Repaired.** It makes no claim that a named roadmap exists. The plan agrees. |
| F06: Seeley supplier sentence | Lines 240–243: “K5a (extension of smooth functions across a smooth boundary: the half-space Seeley extension), a step of K5a's construction”. | **Repaired.** The corresponding sentence survives on main at TauCetiRoadmap/ComplexKahlerGeometry/README.md:1792–1799, within §5.4 (K5a). The §3.4 and §5.3 Needs citations resolve to it. |

None of the earlier repairs was marked “not actionable in this package”. The findings below do not reopen such a settled decision. Unchanged material was read throughout; the earlier computed rows were used as evidence, then challenged at the missing zero-speed, zero-dimensional and global-domain instances.

## R01 (P2) — Import the interior, collar extension and double from their existing owners

**Location.** packages/RiemannianManifoldsWithConvexBoundary/design/README.md:41–42, 72–75, 234–238, 614–622 and 649–658; design/plan.json targets 3.3.1–3.3.2. The scope claims “the interior of `M` as a boundaryless manifold, the collar extension and the double of `M` as compatible open gluings”.

**Claim.** This roadmap owns these generic smooth-manifold constructions, and GeometricTopology supplies only collars and a corners-category gluing.

**Witness.** On main: TauCetiRoadmap/GeometricTopology/README.md:809 supplies the boundaryless interior; :853–872 supplies full-boundary gluing and the double. TauCetiRoadmap/AffineMorseLefschetz/README.md:841–842 constructs precisely the boundaryless collar extension M⁺.

**Exact repair.** Delete the duplicate construction ownership and import GeometricTopology §1.1 for the interior, §1.3 for the double, and AffineMorseLefschetz §4.5 for the collar extension. Keep this roadmap's additional smooth defining function, comparison with Tau Ceti's regular-sublevel atlas, and extension of the prescribed Riemannian metric. State that difference explicitly in Scope and ownership, supplier contracts, §3.3 and the corresponding plan targets/prerequisites. The existing open-gluing argument can justify the atlas comparison, but must not be another target constructing the supplied manifold. Do not add a dependency on an open revision of these main roadmaps.

**Repair test.** For M = [0,1], the imported collar extension is an open interval containing [0,1], and GeometricTopology's double is S¹. The remaining new work is a function equal to t near each seam and an extended metric; neither requires a second manifold construction. This is a local ownership repair, not rejection of the boundary-convexity scope.

## R02 (P2) — The outward-normal gap is already supplied on main

**Location.** packages/RiemannianManifoldsWithConvexBoundary/design/README.md:216–220 and design/plan.json:2260–2268. The contract says DifferentialGeometry “does not name it”.

**Claim.** DifferentialGeometry §12.5 has no named normal with unit, orthogonality and outward-pointing laws.

**Witness.** TauCetiRoadmap/DifferentialGeometry/README.md:2949–2951 explicitly constructs `exists_halfSpaceOutwardUnitNormal`; Suggested.lean:1020–1028 states smoothness, norm one, `TauCeti.IsOutwardPointing`, and orthogonality to the boundary differential's image.

**Exact repair.** Remove `dg-outward-unit-normal` from the gap list and replace its prerequisite with DifferentialGeometry §12.5's named existence theorem. Correct the stale supplier description. Import its smoothness and pointwise characterisation instead of planning those same assertions again in §1.2; retain the new chart formula, sign decomposition, inward-normal and naturality consequences. State any genuinely wider variant separately with its hypotheses rather than retaining a gap that asserts the named theorem is absent.

**Repair test.** In the half-plane with g = [[1,1/2],[1/2,1]], the supplied normal laws select ν_in = (2/√3,−1/√3): norm² = 1, inner product with e₁ = 0, constrained coordinate positive. Thus the imported object is exactly the one used by §1.2, not an arbitrary outward field. No conditional acceptance on this obsolete gap is appropriate.

## R03 (P1) — Dimension one refutes the cap and convexity classifications

**Location.** packages/RiemannianManifoldsWithConvexBoundary/design/README.md:1227–1230: “`C_R` is non-trapping iff `R < π/2`”. Related claims occur at 472–479, 603–604, 948–950, 1210–1213, 1269–1270 and 1280–1285; design/plan.json targets 2.1, 3.2, 4.6, 6.2, 6.3.1, 6.4 and 6.5.

**Claim.** The stated cap, half-space and conformal sign classifications hold for every n ≥ 0, as the Conventions require.

**Witness.** For n=0, C_(3π/4) ⊂ S¹ is the arc −3π/4 ≤ θ ≤ 3π/4. Its exit times are 3π/4∓θ, always finite; T∂C=0 makes strict convexity true. The claimed right-hand conditions are false.

**Exact repair.** Preserve dimension one. State the cap cutoff and the non-trapping iff for n ≥ 1; for n=0 give the interval formula τ(θ,±1)=R∓θ and non-trapping for every 0<R<π. All zero-dimensional boundary forms are both positive and negative definite in §2.1's quantified sense. Accordingly qualify “half-space nowhere strictly convex”, the failure of strict level concavity for affine functions, scalar-sign iff tests, the conformal/Herglotz iff, and the cap-radius Checks by n ≥ 1. Keep II formulas in dimension one as identities of zero forms. Restrict every use of H to n ≥ 1 in both files, including plan target 6.1.1 and the exterior examples. Replace the Conventions' unrestricted description of dimension-one manifolds as “finite unions of intervals” by “the one-dimensional case”; compactness and boundary assumptions were not standing hypotheses.

**Repair test.** On [0,∞), II=0 on the zero space, so strict convexity and strict concavity are both true. On the conformal interval with φ(s)=−s, II=−e⁻¹h=0 and strict convexity remains true although (r e^(−r²))′ at 1 is −e⁻¹<0. On S² the equator at R=π/2 is a trapped unit geodesic, so the n≥1 classification remains correct. The source has dimension at least two at paternain-salo-uhlmann2023 line 2642; the generalisation failed specifically in these examples.

## R04 (P1) — The purported second defining function gives a different regular domain

**Location.** packages/RiemannianManifoldsWithConvexBoundary/design/README.md:569–570 and design/plan.json:655–657: “the same set written as `{(2 + x₁)(1 − |x|²) ≥ 0}`”.

**Claim.** Multiplication by 2+x₁ preserves the global superlevel set in Euclidean space.

**Witness.** At x=(−3,0), 1−|x|²=−8 whereas (2+x₁)(1−|x|²)=8. The latter domain is the unit disc union {x₁≤−2}; 0 is regular on both its sphere and its extra boundary line.

**Exact repair.** In the global-domain Check use a globally positive multiplier, for example exp(x₁). Retain 2+x₁ in §§1.3 and 2.2 only as a function on the closed ball or its sufficiently small neighbourhood, where it is positive. Add the extra-half-space example as the negative control distinguishing positivity on M from positivity on all of N. Update the plan's `unit_ball` Check.

**Repair test.** exp(−3)(−8)<0, so the refuting point is excluded. Everywhere exp(x₁)>0, giving exactly the original ball and no additional zero set. On its boundary, both the tangential Hessian and |dρ| acquire the same positive factor, hence II=h.

## R05 (P2) — The tangent-geodesic Check includes zero velocity

**Location.** packages/RiemannianManifoldsWithConvexBoundary/design/README.md:792–793: “with `v ⊥ q` there is none on any `[0, ε)`”; design/plan.json:1032–1034. The analogous exterior calculation at README:1212 and 1218 also omits the speed qualification.

**Claim.** Every tangent initial velocity prevents a ball geodesic, and the displayed norm is 1+t².

**Witness.** Set q=(1,0), v=0. The constant curve γ(t)=q has velocity and acceleration zero and stays in the closed ball. |q+tv|²=1, not 1+t². The native geodesic predicate has no nonzero-speed field.

**Exact repair.** Say “unit tangent v” in the Check using 1+t²; state the general leaving assertion for v≠0 with 1+t²|v|². Explicitly retain the constant geodesic for v=0 as a negative control. Make the same speed distinction for the exterior's second-order-entry assertion and its t² calculation. The actual §4.2 theorem already excludes zero velocity and should remain so.

**Repair test.** v=0 gives ρ∘γ=0 and τ(q,0)=∞, agreeing with §5.2. v=(0,2) gives ρ(q+tv)=−4t² for the ball and +4t² for its exterior. Unit v gives the printed ±t². The relevant pinned definition is TauCeti/Geometry/Manifold/Riemannian/Geodesic/Basic.lean:102–111.

## R06 (P2) — Restore positive-radius and positive-semiaxis hypotheses in both representations

**Location.** packages/RiemannianManifoldsWithConvexBoundary/design/README.md:1184–1188, 1201–1202 and 1211–1213; design/plan.json:2024–2030 and 2081–2087. The ball paragraph starts “For the closed ball `B̄(c, R) = {R² − |x − c|² ≥ 0}`”.

**Claim.** These are regular domains with the stated curvature formulas without requiring a positive radius; the ellipse formula uses unrestricted a,b.

**Witness.** R=0 gives a singleton and zero defining differential, not a full-dimensional regular domain. For a=−1,b=1, the ellipse is the unit disc at (−1,0): II=1, whereas a/b²=−1.

**Exact repair.** Add R>0 to README §§6.1 and 6.2, and to the exterior and hyperbolic-ball targets in the plan. The README's hyperbolic clause and plan's Euclidean-ball clause already have it; make both representations agree. State a>0,b>0 for the ellipse Check. Add the R=0 critical-level negative control. Keep the separate n≥1 restriction on H required by R03.

**Repair test.** For R>0 the Euclidean boundary has |dρ|=2R>0 and II=±h/R. For a,b>0 the ellipse has |dρ|=2/a and II=(2/b²)/(2/a)=a/b². In hyperbolic space, R=0 gives {u≤1}={(0,1)} with du=0, whereas R>0 gives the regular sphere with |du|=sinh R>0.

## R07 (P3) — Distinguish the endpoint test from the full Herglotz condition

**Location.** packages/RiemannianManifoldsWithConvexBoundary/design/README.md:1281–1283 and design/plan.json target 6.5: “`d/dr (r e^{φ(r²)})|_{r=1} > 0`, the Herglotz–Wiechert condition”.

**Claim.** Positivity at the outer boundary is the Herglotz condition cited from the sources.

**Witness.** Put φ(s)=s²−2s and b(r)=r exp(φ(r²)). Then b′(1)=e⁻¹>0 but b′(1/√2)=0. The latter circle is a trapped geodesic by paternain-salo-uhlmann2023 lines 2463–2473.

**Exact repair.** Call the displayed inequality the outer-boundary restriction of the Herglotz–Wiechert condition. State in prose that the full condition requires b′(r)>0 at every positive radius in the domain, and retain this example as the distinction. Do not infer a foliation condition from the endpoint test.

**Repair test.** The example has strictly convex outer boundary in dimension two but fails the full radial condition. stefanov-uhlmann-vasy2021 lines 66–72 and paternain-salo-uhlmann2023 lines 2478–2481 concern all the radial spheres, not just r=1.

## Verified sound

**Coverage and principles.** Read the entire 1,343-line design README, all 49 plan targets with 114 Checks, all six manifest entries, the earlier review and repair report, the supplied package index and overlap report. Ten plan definitions each have an API and at least three Checks. There are six layers, six Examples endings, six Dependencies endings and 32 Needs paragraphs. The plan's 135 internal prerequisite edges are acyclic and every referenced target exists. Scope, conventions, source locators and the end-theorem list are present. No route-specific shortcut, copied source passage, computational algorithm, process handoff, machine path or forbidden supplier was found in the design. The ownership exceptions are R01–R02. The present roadmap is new, rather than a revision of an existing roadmap with this name.

Read current main's GeometricTopology, DifferentialGeometry and ComplexKahlerGeometry for the house shape and the supplier contracts. The prose/API/Checks structure matches it. Mathematical symbols in code spans are notation rather than claims of undeclared Lean identifiers. The plan's proposed API identifiers are not presented as existing Lean declarations in the README. The principal shape defects are the precise-hypothesis discrepancies in R03, R05 and R06.

**Dependency check, exact output:**

```text
candidate: RiemannianManifoldsWithConvexBoundary is not in the merge order yet; checked as if placed after QuasiregularMaps (the intake inserts it when its design is accepted)
depcheck: 234 roadmaps, 2110 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. No merge-order edit was made. This check certifies the current edges; the fix worker must rerun it after importing the existing collar-extension owner.

**Supplier citations resolved afresh.** These are the present texts, not remembered round-one line numbers:

| Supplier | File and locator opened | Resolution |
|---|---|---|
| DifferentialGeometry | TauCetiRoadmap/DifferentialGeometry/README.md:1648 (§5.1), :2801 (§12.1), :2848 (§12.2), :2871 (§12.3), :2936 (§12.5); Suggested.lean:1020 | Pointing, metrics, gradient and Hessian citations resolve. §12.5 now supplies the named normal, R02. |
| HopfRinow | Completed/HopfRinow/README.md:264, :427, :444, :495 | Boundaryless geodesics/flow, normal domains/Gauss lemma, two-direction variation calculus and compact completeness are supplied. Applied to the ambient N, not directly to a boundary model. |
| RiemannianGeometry | TauCetiRoadmap/RiemannianGeometry/README.md:1384, :1436, :2840, :2870, :2884 | R1.4 normal jets and R5a immersion formulas resolve on main. The vanishing first jet is also explicitly imported there from pinned Tau Ceti. The sign B=−h·position and averaged mean curvature agree with this design. |
| GeometricTopology | TauCetiRoadmap/GeometricTopology/README.md:788, :797, :809, :853, :870 | Collar exists. Interior and full-boundary double are also supplied, contrary to the design's limited ownership description, R01. |
| ComplexKahlerGeometry | TauCetiRoadmap/ComplexKahlerGeometry/README.md:1792–1799, §5.4 (K5a) | The named half-space Seeley extension step is present; this roadmap's locally finite manifold patching is the further step. |
| SmoothBundlesConnections | TauCetiRoadmap/SmoothBundlesConnections/README.md:1306–1333 at open PR #2127 | B6.0 provides uniform normal and strong-convexity radii on compact sets for the chosen metric, with IsNormalDomain. The show-tool header adds one line; these are repository line numbers. |
| PositiveMass, consumer | TauCetiRoadmap/PositiveMass/README.md:949–959 at open PR #956 | §§5.1–5.2 use inward-normal averaged H, unit-ball H=1 and exterior H=−1, agreeing with §§1.5 and 3.6. |
| Additional existing owner | TauCetiRoadmap/AffineMorseLefschetz/README.md:819, :841–842 on main | General collared-boundary extension is already a target, R01. |

The six declared supplier roadmaps are admissible: main roadmaps are read on main, and SmoothBundlesConnections is earlier in the order. `roadmaps resolve` reported no unresolved cross-roadmap citation. Its warning that it did not inspect library names was not treated as evidence about the pins: those were inspected separately below.

**Open-work and object audit.** Used `roadmaps grep` on main and the 435 indexed open heads for second fundamental forms, strictly convex boundary, boundary defining functions, non-trapping, scattering relation, collar extension, double and boundary normal coordinates; also searched the pinned libraries by these objects. Read the supplied board-package index before any absence assessment. Read the five closest open heads:

- PR #1506, TauCetiRoadmap/ManifoldOptimization/README.md:12–18, :48–61, :740–758: boundaryless optimization; its immersion geometry is imported from R5a. No second owner of boundary convexity or exit/scattering theory.
- PR #1023, TauCetiRoadmap/RicciFlow/README.md:3–30: closed-manifold flow and curvature evolution; no boundary exit/scattering construction.
- PR #956, TauCetiRoadmap/PositiveMass/README.md:914–959: the collar extension concerns spinor sections and boundary regularity, not construction of a boundaryless ambient manifold; mean-curvature conventions agree.
- PR #1187, TauCetiRoadmap/RiemannianGeometry/README.md, Scope and R5a: general immersion theory; this design's boundary Hessian definition and its comparison with R5a are distinct. Supplier citations here remain to main, as required for a revision.
- PR #2127, TauCetiRoadmap/SmoothBundlesConnections/README.md:1306–1333: normal radii and squared-distance convexity; §6.4 consumes them for boundary II/non-trapping rather than rebuilding their uniform-radius theorem.

The supplied overlaps report lists no conflicting head changing this roadmap, dropped cited id, or id defined only by an open revision. The new duplication is with main, as R01 specifies. The pin searches found boundary charts, metrics, normal tubes, ordinary geodesic flow and sphere bundles, all correctly imported. Morse pseudo-gradient exit-time hits are different objects. No pinned boundary second-fundamental-form or geodesic scattering package was found by these searches. No fully qualified name can collide through this design's nonexistent Lean file.

**Library evidence at the pins.** The manifest pins are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Located and read the relevant declarations for the 83 directly backticked library names extracted from the README, resolving ambiguous short-name hits by their namespaces and files. The following grouped inventory records the operative declarations and hypotheses. Paths beginning Mathlib/ and TauCeti/ are library-relative.

| Objects opened | Pinned file and declaration line(s) | What matters here |
|---|---|---|
| Half-space, boundary and interior | Mathlib/Geometry/Manifold/Instances/Real.lean:60, :200; IsManifold/InteriorBoundary.lean:103, :112, :330 | Coordinate zero is nonnegative. Boundary is a set of boundary points, with no nonemptiness or compactness requirement. n+1 avoids the zero-dimensional half-space carrier. |
| Riemannian carriers and distance | Mathlib/Topology/VectorBundle/Riemannian.lean:420; Mathlib/Geometry/Manifold/VectorBundle/Riemannian.lean:68, :245; Riemannian/Basic.lean:80; Riemannian/PathELength.lean:66, :208 | Positive metric is separate from a chosen distance; riemannianEDist is extended-valued. No connectedness is silently supplied. |
| Levi-Civita | Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean:153, :173, :206, :256, :360, :409 | IsManifold I 2, C¹ metric and finite dimension; no Boundaryless requirement. Uniqueness requires the compared field differentiable at the point, as §3.1 states. |
| Boundary charts and derivative | TauCeti/Geometry/Manifold/Boundary/Charts.lean:107, :321, :374; Boundary/Derivative.lean:64 | Smooth boundary manifold, smooth inclusion and zero-insertion derivative, valid for n=0. |
| Pointing | TauCeti/Geometry/Manifold/Boundary/Orientation.lean:46, :63; Boundary/TransitionNormal.lean:36; Boundary/OutwardExistence.lean:75 | Outward means negative coordinate derivative; transition scales that derivative by a positive scalar. An outward field alone is not a unit normal. |
| Induced/pulled-back/scaled metrics | TauCeti/Geometry/Manifold/Riemannian/Boundary.lean:115, :146; Riemannian/Pullback/Basic.lean:158; VectorBundle/Riemannian/Conformal.lean:87; VectorBundle/Riemannian/Existence.lean:69 | Pullback needs injective differential, scaling needs positive factor; metric existence uses Hausdorff σ-compact base and finite dimension. |
| Gradient and Hessian | TauCeti/Geometry/Manifold/Riemannian/Gradient/Basic.lean:73, :85; Riemannian/Laplacian.lean:135, :158, :197 | Riesz dual of the manifold derivative; Hessian and its symmetry work at boundary points. |
| Conformal laws | TauCeti/Geometry/Manifold/Riemannian/Hessian/Conformal.lean:81; VectorBundle/CovariantDerivative/LeviCivita/Conformal.lean:260 | With f=e^(2φ), (2f)⁻¹df=dφ, yielding precisely the minus dφ(ν_in) convention for II. |
| Metric families | TauCeti/Geometry/Manifold/VectorBundle/NondegenerateMetric/Family.lean:73; VectorBundle/CovariantDerivative/LeviCivita/Nondegenerate/Family.lean:116 | The carrier does not impose positivity; §2.3 explicitly adds it. Joint smoothness includes boundary points. |
| Regular values/domains | TauCeti/Geometry/Manifold/RegularValue.lean:92; RegularValue/Scalar/Sublevel.lean:473, :639, :652, :675; RegularValue/Level.lean:234, :435, :485 | Regularity is surjectivity at every preimage; values outside the range are regular. Ambient model is boundaryless; the sublevel model has dimension n+1. |
| Native geodesics | TauCeti/Geometry/Manifold/Riemannian/Geodesic/Basic.lean:102, :134; Geodesic/Maximal.lean:107; Geodesic/Trajectory.lean:76 | Within-derivative geodesics permit zero speed. The initial-data structure includes 0 in the interval. |
| Exponential, smooth flow, completeness | TauCeti/Geometry/Manifold/Riemannian/Geodesic/Exponential.lean:98, :104; Geodesic/Flow.lean:65, :117; Geodesic/Compact.lean:75 | Flow theorems use boundaryless Hausdorff ambient space. Exp outside its natural domain is a junk value; §4.3 uses the natural domain. Compact completeness needs no connectedness. |
| Normal tubes | TauCeti/Geometry/Manifold/TubularNeighborhood/Riemannian/Basic.lean:113; Coordinates.lean:89; Noncompact.lean:58 | Closed normal-disc selection requires closed embedded core, Hausdorff second-countable ambient space; no complete metric. Partial inverse has a Nonempty binder; empty core is handled separately. |
| Sphere bundle | TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Sphere.lean:143, :161, :181 | Positive radius and boundaryless base; §5.1 first constructs SN over N, then takes its regular domain SM. |
| Open gluing | Mathlib/Topology/Gluing.lean:90, :279; TauCeti/Geometry/Manifold/Gluing/GlueData.lean:84, :103, :128, :155, :179, :207, :215 | Compatible local diffeomorphisms induce the manifold atlas and its maps. partialDiffeomorphι has a Nonempty piece binder; empty pieces can simply be omitted. |
| Separation/countability of gluing | TauCeti/Topology/Category/TopCat/GlueData.lean:82, :105; GlueData/Double.lean:155 | Closed chart relations characterize Hausdorffness; countably many second-countable pieces suffice. The double along a nonclosed open set is not Hausdorff. |
| Calculus and gluing functions | Mathlib/Analysis/Calculus/ImplicitContDiff.lean:55, :91; Mathlib/Geometry/Manifold/PartitionOfUnity.lean:123, :593, :797; TauCeti/Analysis/Calculus/Hadamard.lean:115, :131; ParametricIntegral.lean:211 | Invertible derivative for implicit function; disjoint closed sets for the smooth separator; complete target for Hadamard's integral identity. The parametric integral theorem has domination hypotheses, obtained on local compact parameter boxes in this route. |
| Sphere/hyperbolic examples and immersion formula | TauCeti/Geometry/Manifold/Riemannian/Sphere/Basic.lean:61; Hyperbolic/UpperHalfSpace/Basic.lean:91, Metric.lean:41, Curvature.lean:139; VectorBundle/CovariantDerivative/LeviCivita/Immersion.lean:65 | Native round/hyperbolic metrics and Euclidean ambient Gauss formula. The hyperbolic carrier also permits dimension one, so it does not enforce n≥1 on the roadmap's behalf. |

**Seeded source sample.** All three certified cache texts were opened at the cited lines. All fifteen requested sampled sections are covered below. The manifest already records all six works, with one key per work; no fetch or new key was needed. The three uncertified sources remain settled, not re-requested. The two source misprints listed below were also visually confirmed against the cached PDF on printed pages 47 and 64. Page numbers below are printed pages, not extraction page-marker numbers. The two arXiv references are assessed as the versions actually recorded in the manifest.

| Target(s) | Locator read | Support and limits |
|---|---|---|
| 1.1, 1.2 | paternain-salo-uhlmann2023 lines 2641–2648, 2684–2696, pp. 53–55 | Inward normal and boundary vector strata with inward-positive sign. The full chart/kernel/uniqueness API is derived using the pinned boundary derivative and gradient; it is not a theorem stated in these source lines. |
| 1.4 | paternain-salo-uhlmann2023 lines 2728–2739, 2781–2784, 2838–2844, pp. 56–59 | Π=−⟨∇ν_in,·⟩ and the Hessian formula for the normalised defining function. Division by |dρ| correctly extends it to arbitrary positive-inside defining functions. |
| 1.5 | lee-riemannian2018, Ch. 8; RiemannianGeometry R5a | Lee is settled uncertified. The self-adjoint spectral statement and averaged sign were checked independently on sphere/cylinder/exterior and against R5a; no claim to have read Lee. |
| 1.6 | paternain-salo-uhlmann2023 lines 2447–2473, pp. 46–47; lee-riemannian2018, Chs. 7–8 | PSU supplies the radial special case, not the whole conformal law. The general law is verified from the pinned conformal Hessian theorem; Lee remains unread. |
| 2.1 | paternain-salo-uhlmann2023 lines 2738–2739, p. 56, and 2449–2461, pp. 46–47; stefanov-uhlmann-vasy2021 lines 53, 89–93, p. 2 | Correct strict-definiteness convention. Dimension-one distinctions are R03, not changes to the definition. |
| 2.3 | paternain-salo-uhlmann2023 lines 3093–3096, p. 65; uhlmann-vasy2016 lines 49–51, preprint p. 2 | These passages use openness under small perturbations. The explicit parameter-family and uniform-bound results follow from the design's smooth II and compact unit-sphere argument; the passages do not themselves state that entire API. |
| 3.3, 3.4 | paternain-salo-uhlmann2023 Lemma 3.1.8/Exercise 3.1.9, lines 2749–2762, pp. 56–57; lee-smooth2012, Thm. 9.25 | PSU states compact closed extension, gives a Euclidean special-case proof and leaves the double to an exercise. It does not prove arbitrary noncompact manifold extension. The design provides that route using collars, open gluing, Seeley and partitions; ownership is R01. Lee's collar text is unread, but its supplier contract is present. |
| 4.1 | paternain-salo-uhlmann2023 lines 2645–2658, 2763–2765, pp. 53–54, 57 | Ambient continuation of unit geodesics. The source fixes unit speed; the design's native geodesic API permits zero speed, causing R05. |
| 5.1 | paternain-salo-uhlmann2023 lines 2646–2648, 2682–2696, 2931, 3063–3079, pp. 53–55, 61, 65; stefanov-uhlmann-vasy2021 lines 150–163, p. 3 | Sphere bundle, strata and generator agree. SUV labels outside as plus; the design explicitly interchanges these labels. |
| 5.3 | paternain-salo-uhlmann2023 Lemma 3.2.10 and its proof, lines 2970–3026, pp. 62–64; Exercise 3.2.12, lines 3039–3045, p. 64 | Fold hypotheses and root order agree. The positive derivative of Q follows from the proof at lines 3000, 3020–3021. The exercise is scalar; parameters are used in the proof at 3039–3041 and the design supplies the parameterwise Hadamard/Seeley route. |
| 5.5 | paternain-salo-uhlmann2023 Proposition 3.3.1 and proof, lines 3081–3106, pp. 65–66 | Equivalence and enlargement/integration route agree. Positivity⇒non-trapping uses no convexity in the proof; extending that one direction is justified. The explicit bound follows by integrating Xf≥min Xf along unit geodesics. |
| 5.6 | paternain-salo-uhlmann2023 Definition 3.3.4, Lemma 3.3.5, Exercise 3.3.6, lines 3114–3127, p. 66; stefanov-uhlmann-vasy2021 lines 150–163, p. 3 | α is an involutive diffeomorphism with glancing fixed set. Tangential projection and lens data use the stated sign translation. |
| 6.1 | paternain-salo-uhlmann2023 Example 3.2.1, lines 2849–2864, p. 59; Example 3.1.4, lines 2677–2680, p. 54; lines 307–310, Introduction | Unit-disc exit formula and Euclidean-domain non-trapping are supported. General-radius formulas are direct calculations with R>0, R06. Example 3.1.4 does not state the graph-Hessian formula, which follows from §1.4. |

Also re-read the repaired defining-function/enlargement locators (PSU Lemma 3.1.10, lines 2766–2774, p. 57; lines 3093–3096, p. 65), the other headline locators (Lemmas 3.1.12–3.1.13 and 3.2.3–3.2.11), and the convexity-function proof in uhlmann-vasy2016 lines 499–524, preprint p. 11. The last proof gives x̃=−ρ−ε|z−q|², confinement |z−q|²≤c/ε, and a positive tangential Hessian. It justifies §4.5 without importing the ray-transform theorem or its dimension restriction.

**Adversarial mathematics table.** Rows give computations on the sampled sections, every headline, every changed construction and every finding's targets. Each row checks a specified statement or tightly related API; it is not a “passed” ledger without values. Remaining unchanged rows of the earlier review have computed witnesses and were read, but the false earlier “same set” and unqualified unit-speed rows are expressly superseded here.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| 1.1 trichotomy and curve velocities | Half-plane; c(t)=(t,0) one-sided; c(t)=(t²,0) two-sided; zero vector | Normal derivatives +1 and 0; −e₀ has −1; coordinate change multiplies by a>0, preserving each sign and kernel | Sound | None |
| 1.2 unit normal and decomposition | g=[[1,1/2],[1/2,1]]; interval endpoints | ν_in=(2/√3,−1/√3), g(ν,ν)=1, g(ν,e₁)=0; coordinate e₀ gives g(e₀,e₁)=1/2. Interval outward normals −1,+1 | Mathematics sound; normal already supplied | R02 |
| 1.3 defining functions and comparison | Unit ball; ρ²; empty boundary; interval | ρ=1−|x|² has |dρ|=2, positive inside; d(ρ²)=0 at boundary; ρ=1 has no zeros; x(1−x) has endpoint derivative ±1 | Sound on M | None; global ambient use differs in R04 |
| 1.4 Hessian/normal/II descriptions | Ball radius R>0; exterior; half-space; n=0 | −(−2h)/(2R)=h/R; −2h/2=−h; −0/1=0; only vector u=0 gives II(0,0)=0. B=−h·q pairs with ν_in=−q to give h | Sound | None |
| 1.5 shape and averaged trace | Sphere; cylinder; exterior; n=0 | eigenvalues (1,…,1) give H=1; (1,0) gives H=1/2; (−1,…,−1) gives H=−1; n=0 would divide 0 by 0 and is expressly excluded in §1.5 | Sound core API | R03 propagates restriction to examples |
| 1.6 conformal law | φ=log2; φ=−|x|²; φ=(|x|²−1)² | IÎ=2h and pullback h_(S₂)/2=4h/2; dφ(ν_in)=2 gives −e⁻¹h and Ĥ=−e; vanishing first jet gives IÎ=h. Wrong plus sign gives 3e⁻¹h | Sound | None |
| 2.1 strict predicates | Cylinder; cubic epigraph; half-line | (1,0) spectrum: convex true, strict false, H=1/2; κ=6x/(1+9x⁴)^(3/2) has sign x; half-line T∂M=0: both strict predicates true, conflicting with “nowhere strictly convex” | Definition sound, examples false at n=0 | R03 |
| 2.2 Hessian iff | Unit ball with ρ and uρ, u=2+x₁ on M | Hess(uρ)|T=u(−2h), |d(uρ)|=2u, ratio=h; −ρ reverses signs but violates positive-inside hypothesis | Sound in both directions | None |
| 2.3 openness/uniform/family | Hyperbola epigraph; cubic; conformal disc family | κ=(1+2x²)^(−3/2)→0; weak convex locus x≥0 not open; II_s=e^(−s)(1−2s)h positive exactly s<1/2 | Sound | None |
| 3.1 regular-domain independence | x=(−3,0); replacement exp(x₁)ρ; cubic power of ρ | Original ρ=−8 versus proposed ρ′=8; replacement =−8e⁻³<0. d(ρ³)=3ρ²dρ=0 on sphere | The purported equal-set Check is false; independence theorem still correct | R04 |
| 3.2 level concavity | x=|z|² and −|z|² in dimension≥2; x(t)=t in dimension1 | Hess=±2g gives sublevel II=±h/√c; affine Hess=0 on ker dx={0}, so strict condition is true in dimension1 | Formula sound; affine negative control needs dimension | R03 |
| 3.3 open gluing and separation | M=[0,1]; half-space; double of interior alone | With collar t/2, overlap=(0,1/2)∪(1/2,1); two distinct midpoint copies cannot separate. Bicollar limit has t≥0 and x=c(q,t)∈int M, forcing t>0. Correct double is S¹; half-space extension is ℝⁿ×(−1,∞) | Repaired gluing proof sound, ownership duplicate | R01 |
| 3.3 defining function and atlas comparison | Compact boundary; empty boundary | On seam, φ₀=1, φ₁=0, χ(t)=t, so dρ̃(∂t)=1; on interior both summands positive, outside both negative. Empty boundary permits ρ̃=1 | Sound new compatibility conclusions | Keep after R01 |
| 3.4 function and metric extension | √x; (x+.01)dx²; clopen M | derivative of √x diverges as x→0⁺, violating smoothness hypothesis; coefficient at x=−.02 is −.01, so raw continuation fails positivity; a convex combination of positive coefficients stays positive | Sound | None |
| 3.5 realisation | [0,1] with (1+x)²dx²; disc; closed M | Length ∫₀¹(1+x)dx=3/2 in either ambient realisation; disc II=h in both; ρ̃=1 yields M={ρ̃≥0}, empty zero set and vacuous regularity | Sound headline | Import corrected owners |
| 3.6 immersion comparison/Gauss sign | Unit sphere; cylinder; ball exterior | ⟨−h q,−q⟩=h; K=0+1·1−0=1; cylinder K=0+1·0−0=0; exterior ⟨−h q,+q⟩=−h | Sound | None |
| 4.1 geodesic Check | q=(1,0), v=0, (0,1), (0,2) | |q+tv|²=1, 1+t², 1+4t² respectively; accelerations all 0, so v=0 gives an M-geodesic contrary to the Check | Missing speed hypothesis | R05 |
| 4.2 second-order contact and converse | Unit ball; exterior; y≥x⁴ | ρ∘γ=−t² gives second derivative −2=−|dρ|II=−2·1; exterior +t² stays inside; quartic −t⁴ leaves but second derivative and II are 0 | Sound nonzero-velocity headline | None |
| 4.3 normal exponential, distance, normalisation | Unit sphere; exterior; slanted collar; old F01 function | E(q,r)=(1−r)q, r=1−|x|, |grad r|=1; exterior r=|x|−1; slanted cross term=1 rather than0. New ρ̂=−1 away from tube; old function tends to0⁻ | F01 repaired | None |
| 4.3 cutoff sandwich | ε<min(ε₁,1), outside M | ρ̂≤max(r,−1); ρ̂≥−ε and −1<−ε force r≥−ε>−ε₁; hence ρ̂=r. Closed separator sets have no limit on ∂M because ∂M⊂W₁ | Sound changed route | None |
| 4.4 normal-coordinate sign | Ball R>0; exterior; half-space; n=0 | h_r=(1−r/R)²h₀ gives −h′₀/2=h₀/R; (1+r)²h₀ gives −h₀; constant h gives0; n=0 leaves dr² | Sound local formula | None |
| 4.5 convexity function | Unit disc at q=(0,−1); exterior; interval | Hess x̃=(2−2ε)g>0 for ε<1; dx̃_q=2q=−dρ_q; K_c lies in ε|z−q|²≤c. Exterior gives −(2+2ε)g; interval kernel=0 and x̃=−x−εx² | Sound headline | None |
| 4.6 enlargement | Normalised unit ball, ε=.1; spherical cap; old counterexample | M_ε radius1.1, II=h/1.1≈.90909h; in dimension≥2 cap II=cot(R+ε)h. Old ρ has min−e⁻²≈−.135335 and unbounded near-zero negative tail; normalised ρ̂=−1 excludes it | F01 repaired; dimension-qualified cap Check needed | R03 only |
| 5.1 strata and regularity | Disc; interval; vertical velocity variation at glancing | Disc boundary sphere bundle torus, glancing two circles; interval has4 boundary unit vectors, μ=±1 and glancing empty. μ(cos s·v+sin s·ν_in)=sin s, derivative1 at0 | Sound | None |
| 5.2 exit/reversal/scaling | Ball; annulus; interval; zero velocity | Interval τ(x,+1)=b−x, τ(x,−1)=x−a; τ(x,2)=τ(x,1)/2; τ(x,0)=∞. Annulus witness τ=3/2+√3 versus limit3/2 after perturbation | Sound | R05 must agree with zero case |
| 5.3 fold and even-function statements | h=y−t²; y−t⁴; cos r; r²; no parameters | Q=r,a=y yields roots±√y. Smooth root splitting with a(0)=0 is O(√y), incompatible with separation2y^(1/4). cos r=H(r²), H(s)=Σ(−s)^k/(2k)!; r² gives H=s | Sound | None |
| 5.4 exit regularity and identities | Disc, ball, interval | τ=sinθ+|sinθ| has derivatives0,2 at glancing; τ̃=2sinθ smooth; μ/τ̃=1/2=II/2. σ=−2⟨x,v⟩, T=1−|x|², τ=(σ+√(σ²+4T))/2; Xσ=−2. Interval σ=a+b−2x | Sound headline | None |
| 5.5 non-trapping criteria | Ball u=|x|²/2; closed nonempty M; empty M | f=⟨x,v⟩, Xf=1, bound=(1−(−1))/1=2; on closed SM any smooth f has Xf=0 at a maximum, excluding Xf>0 and Xu=1; empty SM gives vacuous positivity and surjective zero function space | Sound headline; extrema bound read where SM nonempty | None |
| 5.6 scattering and lens data | Ball; disc; interval | a=⟨x,v⟩ maps to −a, so α²=id and fixed iff a=0; disc ℓ=2√(1−|w|²), |L|²=|w|²; α(a,+1)=(b,+1), α(b,+1)=(a,+1), no fixed points | Sound headline | None |
| 6.1 and 6.2 radii/ellipse | R=0; R=1; a=−1,b=1; positive a,b | R=0 gives dρ=0 at singleton; R=1 has II=h. Negative a test: actual II=1 versus a/b²=−1; positive axes yield (2/b²)/(2/a)=a/b² | Missing hypotheses | R06 |
| 6.3 caps and hyperbolic domain | S¹ cap R=3π/4; S² hemisphere; upper half-plane | S¹ τ=R∓θ≤2R=3π/2<∞ despite R≥π/2; S² equator has τ=∞. Hyperbolic Hess u_xx=u/y², Hess u_xy=0, Hess u_yy=u/y², and u−1=(x²+(y−1)²)/(2y)≥0 | Cap classification false at n=0; hyperbolic formula sound | R03, R06 |
| 6.4 small balls | Flat torus; S¹ versus S² | Torus normal radius<1/2, II=h/R; S¹ proper arc R=3π/4 still non-trapping and vacuously strictly convex, so r_p≤π/2 is not necessary there; S² has cutoffπ/2 | General small-ball theorem sound, sphere Check needs dimension | R03 |
| 6.5 conformal radial criterion | φ=−s; φ=s²−2s; n=0 | b′(1)=−e⁻¹ for φ=−s; n=0 strict convexity nevertheless true. Second φ gives b′(1)=e⁻¹≈.367879 and b′(1/√2)=0 | Endpoint sign iff needs n≥1; endpoint is not full Herglotz condition | R03, R07 |

**Headline acceptance-test assessment.** The Summary names seven end-theorem groups: §2.2 Hessian characterisation, §3.5 isometric regular-domain realisation, §4.2 second-order leaving, §4.5 convexity functions, §5.4 exit-time regularity, §5.5 non-trapping equivalences, and §5.6 scattering involution/fixed set. Native carriers exist for their intended statements: half-space manifolds and boundary tangent spaces; Hessian and regular-domain predicates; geodesic initial data, normal exponential and sphere bundles. II and strict convexity can be real-bodied predicates/formulas on these carriers; exit time can be a supremum of native geodesic witnesses, followed by odd exit time and scattering from the native flow. These give a credible package acceptance-test route without sorry'd data or free Prop stand-ins. This is not a claim that those signatures have been elaborated.

There is **no Suggested.lean in this design package**. Consequently no sorried theorem exists to run the one-tactic probe on (zero candidates), no declaration exists for a #check binder audit, and no import, set_option, sorry'd data, padding, namespace or module-docstring defect is inferred from its absence. At package stage the seven groups above must be assessed individually for native signatures or named missing carriers; the many small example computations must remain README Checks. Elaboration: **not available (this lane does not elaborate; say so in the report)**. No Lean command was run and there is no claimed passing build or “sorry-only” warning result.

## Not verifiable

- lee-riemannian2018, Chapters 5–8; lee-smooth2012, Theorem 9.25; sharafutdinov1994, Chapter 4: settled uncertified in sources.toml. Their text was not available for checking chapter contents, theorem numbering or printed pages. They were not requested again. The corresponding computations and current roadmap supplier contracts were inspected; that does not certify the inaccessible books.
- No Lean elaboration, one-tactic execution, or expanded #check types: design stage has no Lean file, and the lane explicitly does not elaborate. Manual inspection of native definitions and signatures is the evidence above.
- Ownership against open work was checked against the supplied 435-head index and its available README texts. Later/unindexed heads and files not made available by this brief were not independently sought.

## Source issues

- **Misprint** in paternain-salo-uhlmann2023 at Corollary 2.5.3(b), printed p. 47 (line 2480): the source says positivity of b′ is tested at 1; it should be tested at the outer endpoint r₁; affects a stated result.
- **Misprint** in paternain-salo-uhlmann2023 at Lemma 3.2.11, printed p. 64 (line 3029): the source says the second exit-time factor has argument x−v; it should be the pair (x,−v); affects a stated result.
