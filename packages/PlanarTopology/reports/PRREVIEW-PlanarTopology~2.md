# Review of PlanarTopology (pull request #271 at 9bd6e07)

**Verdict:** needs changes

## R01 (P1) — Do not identify the pinched-disc model with a disc

**Location:** TauCetiRoadmap/PlanarTopology/README.md:1302, “what makes Douady's pinched-disc model of the Mandelbrot set a disc”.

**Claim:** Moore's theorem makes the pinched-disc model homeomorphic to a disc.

**Witness:** The minor chord with angles 1/3 and 2/3 is collapsed to a cut point: deleting it leaves two sides. A disc minus any point is connected. See blokh_laminations lines217–258, arXiv:1401.5123v3, §1.2, pp.4–5.

**Repair:** Delete the identification, or say that Moore's theorem preserves the ambient plane under the decomposition, not the disc subset. In the single-chord test, the plane quotient is still a plane while the disc image is two discs meeting at one point. The corrected distinction survives that test. The [primary reference](https://arxiv.org/pdf/1401.5123v3), lines813–815, states the ambient-plane conclusion.

## R02 (P1) — Clear the build gate's non-sorry warning

**Location:** TauCetiRoadmap/PlanarTopology/Suggested.lean:1, “import Mathlib”.

**Claim:** The acceptance module passes the required build with only sorry warnings.

**Witness:** The worker reports build=1: Mathlib is designed for the module system and requests a leading module header. Replaying the targeted build reproduces this warning. Direct Lean elaboration succeeds; this is not a type error.

**Repair:** Add the module-system header and rerun the targeted build/gate. A scratch copy with the header elaborates. The ordinary file elaborates too, but the gate explicitly disallows its extra warning. P1 is the brief's required severity for a failed build gate.

## R03 (P2) — Supply the arbitrary-crosscut extension of the cited theorem

**Location:** TauCetiRoadmap/PlanarTopology/README.md:472 and Suggested.lean:288, “(hP : IsCrosscut J P)”; references at README:1344.

**Claim:** The elementary Layer 2 route supplies the decomposition for every embedded closed crosscut using the cited Thomassen/blueprint result.

**Witness:** thomassen1992 lines 308–311, Lemma 2.13, printed pp.122–123, requires a polygonal crosscut. thomassen_blueprint lines 786–795 has the same restriction and uses its polygonal at-most-two-components lemma.

**Repair:** Keep the general target, but supply its extra proof input explicitly. One concrete ordering is polygonal crosscuts and polygonal accessibility in Layer 2, Schoenflies/arc tameness in Layer 7, then arbitrary crosscuts there. Alternatively give an independent arbitrary-arc argument before the Layer 2 theorem. Distinguish polygonal accessibility from Accessible, which asks for an arbitrary embedded approach arc; the source's dense polygonally accessible points and joining lemma must remain available to the matched-cellulation proof.

**Instance:** Inside the unit disc use the crosscut y=(1−x²)/2, −1≤x≤1. It meets the circle only at −1 and 1 and is not a finite polygonal arc. The roadmap admits it; the cited lemma does not. Its regions are the portions of the disc above and below that graph. The proposed ordering recovers both after straightening, without narrowing the final theorem.

## R04 (P2) — Import existing owners instead of commissioning second proofs

**Location:** TauCetiRoadmap/PlanarTopology/README.md:66–74, “layer 2 retains the elementary winding-number proofs”; also README:1183–1187 and Suggested.lean:273,302,308,314.

**Claim:** Changing the proof route makes already-owned separation, no-retraction, Brouwer, and the combinatorial-to-chart bridge new targets here.

**Witness:** On main, Completed/ConformalMapping/README.md:135–150 owns general Jordan separation/frontiers. TauCetiRoadmap/AlgebraicTopology/README.md:393–417 owns no-retraction and Brouwer including ball specializations. TauCetiRoadmap/GeometricTopology/README.md:893–898 owns the chart bridge.

**Repair:** Delete the duplicate targets and cite those exact sections as supplier contracts. Retain genuinely new polygonal parity, crosscut, approximation, and surface comparison results, specifying their additional conclusions. An elementary-proof preference cannot justify redeveloping an existing roadmap. If the bridge is consumed from GeometricTopology, cite its main specification; it cannot simultaneously be a new target here.

**Instance:** Disc half-turn: fixed set {0}; unit circle: two complementary components. Both supplier results give these values. This continues previous R07; its realization-map portion was repaired.

## R05 (P2) — Reuse the pinned simplicial and collar APIs

**Location:** TauCetiRoadmap/PlanarTopology/README.md:113–114,659,678,881, “Purity, facets, and skeleta” and “supply the chart vocabulary and smooth collars only”.

**Claim:** Purity, finite-realization compactness, stellar realization homeomorphisms and topological collar assembly need fresh constructions, or are unavailable.

**Witness:** Pinned TauCeti/AlgebraicTopology/SimplicialComplex/Pure.lean:37, Realization/Finite.lean:61, Subdivision/Stellar/Homeomorph.lean:51, and TauCeti/Geometry/Manifold/Boundary/Collar/Brown.lean:458 respectively supply these objects/results.

**Repair:** Cite PreAbstractSimplicialComplex.IsPure, AbstractSimplicialComplex.compactSpace_realization_of_finite_faces, PreAbstractSimplicialComplex.exists_homeomorph_stellarSubdivision, and TauCeti.IsLocallyCollared.isCollared in the supplier contracts. Keep the support-reindexing/placement adapter and the surface boundary local-collar construction as new work. Correct the smooth-only assertion. Update the moved combinatorial-manifold locator to CombinatorialManifold/Basic.lean.

**Instance:** A filled triangle is already pure and compact; its stellar edge subdivision is a homeomorphic disc. Brown applies to an injective locally collared circle without a smoothness instance. Retain the support/placement adapter.

## R06 (P2) — State boundary-relative Epstein in the acceptance file

**Location:** TauCetiRoadmap/PlanarTopology/Suggested.lean:46–53, “Epstein, smoothing and category comparison need relative/supported isotopies”; README:1171–1173.

**Claim:** The boundary-relative Epstein headline cannot be stated against the pins.

**Witness:** A scratch signature elaborates using ContinuousMap.HomotopicRel, TauCeti.Isotopy, and the law ∀ t x, x ∈ boundary M → F (t,x) = f x. No new carrier is required.

**Repair:** Add the named relative theorem with explicit compact Hausdorff surface instances and fixed-boundary homotopy. Existentially quantify a native isotopy and the fixed-boundary law. Remove this case from the unavailable-carrier explanation; keep accurate explanations for genuinely unavailable PL/smoothing carriers.

**Instance:** Disc id/id has constant relative isotopy; id/conjugation fails the relative premise at I since I≠−I. The repaired signature compiled.

## R07 (P2) — Correct the boundary-vertex link dimension

**Location:** TauCetiRoadmap/PlanarTopology/README.md:680, “stellar equivalent to the boundary of a triangle or to a triangle”.

**Claim:** A boundary vertex link of a combinatorial surface is stellar equivalent to a filled triangle.

**Witness:** In one filled triangle, each vertex link is one edge, of dimension 1. A filled triangle has dimension 2. Pinned CombinatorialManifold/Basic.lean:214–217 requires a 1-ball or 1-sphere at dimension 2.

**Repair:** Replace the boundary model by an edge, the standard 1-simplex; retain the triangle boundary as the interior model. Align README:166 with the precise (n−1)-dimensional condition. The single-triangle disc then has interval links at all vertices and satisfies both sides of README:666; the empty complex satisfies both vacuously. The compatibility statement is plausible, but its proof explanation has the wrong dimension.

## R08 (P2) — Define the remaining interface predicates before using them

**Location:** TauCetiRoadmap/PlanarTopology/README.md:1054–1064,1174–1176,1224–1226, “IsTwoSided”, “HasAnnularNeighborhood”, “HasMobiusNeighborhood”, “PLIsotopic”, “SmoothIsotopic”.

**Claim:** These names specify exact hypotheses and conclusions for the collar, neighbourhood, and category-comparison targets.

**Witness:** No definition or exact supplier is supplied for these predicates. The file does not specify joint PL/smooth regularity of the time-dependent isotopy, or the marked core data in a regular neighbourhood.

**Repair:** Define the predicates with ambient space, parametrized core, and boundary conditions. Define PL and smooth isotopies using the chosen structures, joint time/space regularity, endpoints and relative laws, citing native carriers where available. Give two-sidedness independently of the collar conclusion, or explicitly state and prove the intended equivalent formulation before consuming it.

**Instance:** Annular/Möbius cores differ in normal monodromy (+1/−1). Smooth rotations with nonsmooth time change distinguish smooth slices from joint smoothness. A marked collar must specify its zero section.

## R09 (P3) — Remove acceptance-file API and Check padding

**Location:** TauCetiRoadmap/PlanarTopology/Suggested.lean:181–184,240–269,277–280, “The total parity function has the fixed value zero”; also unused supporting definitions at 75–82,122–136,188–198,222–227.

**Claim:** These declaration/API checks belong among the headline acceptance statements.

**Witness:** crossingParity_eq_zero_of_mem is proved by simp [crossingParity, hq]; Accessible.mem is hp.1; the simple-connectivity example directly applies the imported theorem. The chain, winding and transport definitions support no retained headline.

**Repair:** Delete the API/Check declarations from Suggested.lean, including IsCrosscut.exists_boundary_endpoints, and definitions not needed by the remaining headlines. Keep their mathematics and Checks in the README; do not prove padding in place. Separately, all 28 admissions were tried with simp, rfl and infer_instance; none closed. This finding concerns inspectable proved API padding and unused definitions.

**Instance:** Carrier parity=0 by definition; membership is a conjunct; simple connectivity is an imported consequence. All remain README facts after deletion.

## R10 (P3) — Attach locators and remove the retained quotation

**Location:** TauCetiRoadmap/PlanarTopology/README.md:807,1344–1379, including “is in a way misleading”.

**Claim:** Each target has an exact source locator and is written in the author's own words.

**Witness:** The Moise quotation remains. Smoothing and Pachner lack target-specific theorem/page locators. Thomassen Lemma 2.5 is stated on printed p.119, not p.120; the article ends on p.130, not p.131.

**Repair:** Paraphrase Moise. Put a theorem/section and printed page beside each target and proof input, separating original extensions from sourced statements. Correct Thomassen: Lemmas 2.3–2.4 and the statement of 2.5 are on p.119, its proof on p.120; the article is pp.116–130. Keep inaccessible references uncertified rather than inventing locators. thomassen1992 lines 143–182 and 183–188 verify the polygonal locators.

## R11 (P3) — Use per-target roadmap structure and align names

**Location:** TauCetiRoadmap/PlanarTopology/README.md:1,54,181,209 and all nine layers; Suggested.lean:14–18.

**Claim:** The representative-signature catalogue supplies the required roadmap structure and acceptance-test explanation.

**Witness:** There is no opening Summary, Scope and ownership, Exact supplier contracts, numbered topic subsection, or Needs line. Layers lack closing Examples/Dependencies sections. Numerous compiled names differ from the README.

**Repair:** Reshape the material into the required prose sections, with target-specific dependencies and closing Examples/Dependencies per layer. Describe Suggested.lean as headline acceptance statements. Synchronize names, including exists_nonrectifiable_jordanCurve versus README:279's exists_jordanCurve_not_rectifiable, and schoenflies_closed_inside versus README:1024's schoenflies_closure. Remove process wording such as README:792's “repaired hypothesis”.

**Instance:** Graph tameness needs Radó; planar Schoenflies does not. Per-target dependencies preserve that distinction.

## R12 (P3) — Supply three discriminating Checks and an API per definition

**Location:** TauCetiRoadmap/PlanarTopology/README.md:295,386,783,1152–1156, “is exhibited on a worked example”.

**Claim:** The example paragraphs fulfill the definition-by-definition API/Check requirement.

**Witness:** IsArc/endpoints, relative isotopy, Subdivision, SimplicialRealizes, IsPLMap, PLStructure, compatibility and the two-sided predicates lack individual API lists and three computed Checks. Several paragraphs promise examples without specifying a map or value.

**Repair:** Give each definition a prose API and at least three concrete discriminating Checks. Retain the repaired parity, stellar-support, error-function and orientation-cover examples. Add evaluations of the subdivision commuting square at placements 1/3 versus 2/3; a non-PL comparison map between two triangulation coordinates; and opposite boundary orientations. Keep these Checks in the README.

**Instance:** For the identity edge map and different middle-vertex placements, the sides of the simplicial-realization square are 1/3 and 2/3, so it fails. For equal placements they are both 1/3. This distinguishes marked placement from mere subdivision existence.

## R13 (P3) — Delete the stray source manifest

**Location:** TauCetiRoadmap/PlanarTopology/sources.toml:1, “Bibliographic keys”.

**Claim:** This file is allowed in the reviewed folder.

**Witness:** Both gates report stray-files=1 for this file.

**Repair:** Delete it; sources are the README's references. Preserve the citation metadata/locators there. This is the explicit folder-file rule in this brief, despite its general source-manifest workflow elsewhere. No review edit was made to the manifest.

## R14 (P3) — Revert the unowned completed-roadmap edit

**Location:** Completed/ConformalMapping/README.md, the seven-line addition in this pull request.

**Claim:** This edit falls within the permitted folders for this job.

**Witness:** The prescribed diff excluding the four authorized folders still reports Completed/ConformalMapping/README.md, seven added lines.

**Repair:** Revert those seven lines from this pull request and cite the completed roadmap from PlanarTopology. The fresh gate also names six files in the three sibling folders; those are expressly authorized by this brief and are not findings.

## Verified sound

### Previous findings, checked individually

The quotations below are from the repaired head. No supplied repair report marks a finding “not actionable in this package”.

|Previous|Passage checked|Disposition|
|---|---|---|
|R01 cycle|README:80, “that roadmap consumes the new dimension-two theorems”|Repaired mechanically; no upward/cycle output. Duplicate bridge remains R04.|
|R02 stellar singleton|README:596–600, “on the actual vertex support”|Repaired; singleton leaves one vertex.|
|R03 admitted data|Suggested:93–103, “asserts extension of every sphere homeomorphism”|Repaired; all 17 definitions/structures have real bodies.|
|R04 crosscut/cover order|README:411, “definitions belong here”; :990, “Construct the orientation cover first”|Repaired as ordering/ownership; source-strength defect is R03.|
|R05 Epstein hypotheses|README:1111, “two-sided and does not bound a disc”|Repaired; source checked.|
|R06 disc charts|README:154, “uses Tau Ceti's existing”|Repaired; native atlas/boundary imported.|
|R07 duplicate owners|README:72–73, “retains the elementary winding-number proofs”; :607, “Use the native continuous map”|Partly: realization-map repair holds; R04 remains.|
|R08 simple connectivity|README:516, “Apply ... isSimplyConnected”|Repaired; precise native hypothesis matches.|
|R09 missing headlines|Suggested:418,424,457|Requested spherical/prescribed-boundary/closed Epstein added; relative Epstein still missing, R06.|
|R10 approximation|README:717, “locally positive lower bound”|Repaired: exact filter bound and explicit relative binders.|
|R11 parity|README:381, “lower endpoint is included, the upper excluded”|Repaired; three numerical checks recomputed.|
|R12 graphs|README:1069, “finite planar star”|Repaired; Y is tame, not a line slice.|
|R13 locators|README:1344–1383|Partly repaired; R03/R10 remain.|
|R14 Checks/API|README:688, “Stellar subdivision checks”; :998, “Orientation-cover checks”|Partly repaired; R12 remains.|
|R15 admitted examples|Suggested:278–280, proved connectivity example|No admitted examples; this proved example is padding.|
|R16 boundary/radius padding|Suggested:86, “exists_boundaryless_transport”|Original disc/radius checks deleted; transport now an existential construction. Other padding is R09.|
|R17 empty sections|Suggested:342,394,402,453|Repaired; every Lean layer has declarations.|
|R18 LaTeX|README:152, “C⁰”|Repaired; latex/tex counters zero.|
|R19 heading|README:181, “Dependencies”|Repaired; layer-ids counter zero.|
|R20 shape|README:209, “Representative formal statements”|Not repaired, R11.|

### Gate, signatures and review scope

Confirmed head and clean worktree; read root README/CONTRIBUTING, main AlgebraicTopology and completed ConformalMapping for shape, and both target files in full.

Worker gate: stray-files=1, outside-folder=1, build=1; all other counters0. Fresh gate reproduces file violations, including six authorized sibling-file hits, and stops before building. Separate targeted build exits0 with the module warning. Direct elaboration exits0 with28 sorry warnings; the warning-sensitive gate remains failed.

The complete dependency-check output is:

    depcheck: 205 roadmaps, 1503 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. Read all supplier citations and layer “From” lists. There are zero Needs lines; that is a specification defect, not evidence that targets have no dependencies. No declared gaps were supplied.

Elaborated #check @name for **48 declarations**:17 definitions/structures,28 admissions,3 proved APIs. The worker’s49th entry is docstring prose parsed as a theorem named comma. Dropped T2Space on boundaryComponentCount is harmless: total Nat.card needs none; invariance retains Hausdorffness. Closed Epstein transports target compactness through its homeomorphism. Compact charted surfaces inherit countability. No harmful binder loss found.

All **28** admissions resisted simp/rfl/infer_instance. Native-lemma inspection found no additional one-lemma padding. R09 covers proved API padding/unused definitions. Relative Epstein compiled separately.

Pins: Mathlib f6090c7095e1e56b3464c1daba5f24631f1290d2; Tau Ceti 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a. ConformalMapping’s later implementation audit does not establish availability at this pin.


### Pinned declarations opened and ownership resolved

The following **22 native interfaces** were inspected at the manifest pins, including their surrounding hypotheses. Paths in this table are library-relative.

|Interface|File and line|
|---|---|
|AbstractSimplicialComplex.singleton_mem|Mathlib/AlgebraicTopology/SimplicialComplex/Basic.lean:156|
|ChartedSpace.secondCountable_of_sigmaCompact|Mathlib/Geometry/Manifold/ChartedSpace.lean:236|
|IsCoveringMap.liftHomotopy|Mathlib/Topology/Homotopy/Lifting.lean:308|
|IsJordanCurve|TauCeti/Topology/JordanCurve/Basic.lean:108|
|IsJordanDomain|TauCeti/Analysis/Complex/Conformal/Jordan/Domain.lean:118|
|IsJordanDomain.isSimplyConnected|TauCeti/Analysis/Complex/Conformal/Jordan/Domain.lean:226|
|exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier|TauCeti/Analysis/Complex/Conformal/Jordan/Approach.lean:213|
|instChartedSpaceClosedBall|TauCeti/Geometry/Manifold/Instances/ClosedBall.lean:230|
|boundary_closedBall|TauCeti/Geometry/Manifold/Instances/ClosedBall.lean:313|
|IsPiecewiseAffineOn / IsPLOn|TauCeti/Topology/PL/Map.lean:87,177|
|Isotopy / Isotopic|TauCeti/Topology/Homotopy/Isotopy/Basic.lean:85,111|
|IsSliceChart|TauCeti/Geometry/Manifold/LocallyFlat/Basic.lean:169|
|IsSliceEmbedding / IsLocallyFlat|TauCeti/Geometry/Manifold/LocallyFlat/Basic.lean:361,376|
|IsTriangulable|TauCeti/Topology/Triangulable.lean:40|
|realizationMap|TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Map.lean:105|
|compactSpace_realization_of_finite_faces|TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Finite.lean:61|
|isClosedEmbedding_realization_coe|TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Finite.lean:85|
|IsPure|TauCeti/AlgebraicTopology/SimplicialComplex/Pure.lean:37|
|exists_homeomorph_stellarSubdivision|TauCeti/AlgebraicTopology/SimplicialComplex/Subdivision/Stellar/Homeomorph.lean:51|
|IsCombinatorialBall / IsCombinatorialSphere / IsCombinatorialManifold|TauCeti/AlgebraicTopology/SimplicialComplex/CombinatorialManifold/Basic.lean:81,87,214|
|IsLocallyCollared.isCollared|TauCeti/Geometry/Manifold/Boundary/Collar/Brown.lean:458|
|TauCeti.Contour.windingNumber_eq_of_pathHomotopy|TauCeti/Analysis/Contour/Winding/Number/Homotopy.lean:127|

Native-definition checks: IsJordanCurve is Nonempty (C ≃ₜ Circle), without ambient Hausdorffness; IsJordanDomain requires open, connected, bounded and Jordan frontier. Isotopy has embedding slices, not surjectivity. IsTriangulable bundles no finiteness, purity or link condition. IsPLOn is locally piecewise affine on finite convex-polyhedral pieces. IsSliceChart need not center the distinguished point. Stellar subdivision requires finite faces, a fresh vertex and common ambient complex; singleton faces require actual-support reindexing. Brown needs compact source, Hausdorff target, injectivity and local collaring, not smoothness. Winding homotopy invariance needs piecewise-C¹ endpoints; intermediate paths need only continuity and avoidance. Correct README:519’s missing Contour namespace with R10.

Further opened plane-separation declarations include TauCeti/Analysis/Complex/PlaneSeparation/JordanCurve.lean:80 and :130: nonseparation of a proper subcontinuum and boundary information for components. Neither was treated as the full Jordan separation theorem.

Object searches used roadmaps grep/show, main, supplied open heads and board packages. No competing owner for controlled planar approximation or the surface orientation-cover construction was found. The exact namespace search returned only this folder. Ideal-theoretic IsTwoSided does not supply R08’s surface predicate.

Resolved contracts and consumer checks:

|Roadmap/version|Exact passage inspected|Resolution|
|---|---|---|
|Completed/ConformalMapping on main|README:135–150; completion audit:33|Owner of Jordan separation/frontiers; retain as a supplier, R04. Later implementation claims were not substituted for the pin.|
|AlgebraicTopology on main|README:393–451|No-retraction/Brouwer/general invariance route; import owned results. Its general theorem includes the disc case.|
|GeometricTopology on main|README:847–900, especially :893–898|PL chart groupoid and general combinatorial/chart reconciliation. The open revision is not an independent supplier contract.|
|GeometricTopology in this pull request|Its surface-supply passages|Consumes dimension-two input; this does not license a reciprocal prerequisite for the same bridge.|
|SurfaceTopology in this pull request|README:47–57,353,473,614,1256|Consumes PlanarTopology, supplies no prerequisites back. Boundary orientation has the surface on the left, matching README:977. Its cover comparison is downstream of constructing the cover here.|
|BelyiMaps in this pull request|Surface-topology dependency passages|Consumer context, not an input to PlanarTopology.|

The resolver leads Surface.IsOrientable and Surface.Orientation.map_of_isotopic are own Layer 6 targets, not claimed pinned suppliers. Their absence is not supplier drift.

### Adversarial calculations

The following 160 rows cover the statements and conventions; an additional source-error row appears below.

The table gives instance tests, not general proofs. README/Lean refer to the two reviewed files. S is the unit circle, D the open disc, T the counterclockwise triangle 0,1,I. Empty surfaces are permitted; connected sets are nonempty. Source certification follows separately.

|Statement / location|Instances tried and values on each side|Result / change|
|---|---|---|
|Pinched-disc claim; README:1302|Collapse chord joining angles1/3,2/3: quotient disc minus pinch has2 components; genuine disc minus point has1.|False; R01.|
|Plane carrier/isometry; README:120, Lean:75|z=3+4I maps to (3,4); both norms 5. z=0 gives both 0.|Pass; unused acceptance definition R09.|
|perp; Lean:79|perp(1)=I, perp(I)=−1, perp(0)=0; perp²(1)=−1.|Pass|
|det and inner-product law; README:219, Lean:82|det(1,I)=1=⟪I,I⟫; det(I,1)=−1; det(1,1)=0.|Pass|
|sup/Euclidean norm bounds; README:219|(1,1): 1≤√2≤√2; (0,0): 0≤0≤0; (1,0): 1≤1≤√2.|Pass|
|Surface convention; README:148–166|Plane boundary ∅; half-plane boundary x₀=0; empty model boundary ∅. Circle has local dimension 1, so fails the surface-chart hypothesis.|Pass|
|Compact/countability convention|Compact disc has a finite subcover of chart domains and a countable basis; empty surface has empty basis. Uncountable disjoint planes are noncompact and not second countable.|Pass|
|Euclidean-to-half-space transport; README:225, Lean:86|Plane and empty surface both yield boundary ∅; half-plane itself is not obtained as a boundaryless transport of its boundary atlas.|Pass|
|Relative isotopy; README:239|Constant identity on disc: F(t,z)=z and boundary restriction z. Conjugation at I gives −I≠I.|Intended law passes; R06/R08 specify native relative form.|
|IsArc; README:245|Segment [0,1] is homeomorphic to unitInterval; singleton has cardinal 1 and cannot be; S minus no points remains a circle, not an arc.|Pass; needs its own Checks/API, R12.|
|Arc endpoints definition; README:246|[0,1] minus 0 or 1 is preconnected; minus 1/2 has 2 components. Endpoints={0,1}.|Pass|
|Arc endpoint cardinality; README:247|For [0,1], card=2. For singleton, endpoint set has card=1, but IsArc=false.|Pass|
|Endpoint parametrization; README:248|e(t)=1−t sends endpoint preimages to {0,1}; ordered images are {1,0}, same unordered set.|Pass|
|Radial cone extension; README:254, Lean:95|n=0: sphere=∅, ball={0}, extension=id. n=1: swap {−1,1} extends x↦−x; n=2 reflection extends conjugation.|Pass|
|Cone norm law; README:259|r=0 gives 0=0 without dividing by 0; x=(3/5,4/5)/2 gives norm 1/2 before and after reflection.|Pass|
|Cone boundary law; README:260|x=I, reflection: F(I)=−I=h(I); radius=1, so no radial rescaling.|Pass|
|Alexander relative isotopy; README:263|For boundary-fixed identity, every time slice=id; t=0 limit fixes 0 and boundary, t=1 returns f. Non-boundary-fixed reflection cannot satisfy the premise.|Pass|
|PL cone; README:271|Piecewise affine map of square boundary gives finitely many triangular cones; identity has one affine expression on each cone. A nonlinear angular homeomorphism fails the PL premise.|Pass; general source uncertified.|
|Space filling; README:275, Lean:106|A surjective interval curve has image D̄ and area π; no injectivity is claimed. A constant map has image cardinal 1 and is not surjective.|Signature consistent; existence source not certified.|
|Nonrectifiable Jordan; README:279, Lean:110|Koch-snowflake stage lengths 3(4/3)^n diverge; its limiting Jordan trace has infinite variation for every surjective traversal. S has a finite-variation traversal of length 2π.|Pass; name mismatch R11.|
|Osgood curve; README:283, Lean:115|Required area >0 excludes S, area=0; Jordan compactness bounds any example's area by πR² for a containing radius R.|No contradictory generality; exact existence source not certified.|
|PolygonalChain/carrier; README:310, Lean:122–136|[0,1,I] carrier has segments 0→1 and 1→I; I→0 absent. Singleton [0] has no adjacent segment but the included vertex range gives carrier {0}.|Consistent with real body; document convention and delete unused definition, R09.|
|PolygonalLoop side/carrier; Lean:139–153|T has 3 sides including I→0. A singleton loop has degenerate segment {0}; empty list is excluded.|Pass|
|IsSimple; Lean:153|T: n=3, distinct vertices, adjacent intersections singleton. Twice-traversed T: n=6 but Nodup=false; bow tie has a nonadjacent intersection.|Pass|
|Simple polygon is Jordan; README:337, Lean:159|T has circle trace; bow tie has 4 local branches at its crossing and fails IsSimple.|Pass|
|Simple presentation; README:339, Lean:163|Insert (1/2,0) along T's bottom side: same carrier, new 4-vertex simple presentation. Backtracking on [0,1] gives segment, not Jordan.|Pass|
|Half-open crossing count; README:342,381|For T and q=(1/4,1/4), right ray hits x=3/4 once: parity 1. Reverse T still has one hit and parity 1.|Pass|
|Total carrier parity; Lean:181|q=0 on T: defining carrier branch yields 0; ray arithmetic is not used.|Pass; padding R09.|
|Horizontal-run Check; README:388|For stated 6-vertex polygon, q=(0,−1/10),(0,0),(0,1/10): right crossings at 9/10,2,21/10, respectively; counts 1,1,1; parities 1,1,1.|Pass|
|Winding sign/parity; README:345|T at (1/4,1/4): +1; reversed T: −1; twice T: +2. Mod 2 values are 1,1,0.|Pass|
|Winding local constancy; README:347|For small moves of (1/4,1/4) inside T, value +1; exterior point (2,2), value 0; crossing a side separates these regions.|Pass|
|Polygonal Jordan; README:351, Lean:205|T complement has bounded triangular interior and unbounded exterior, component count 2. Singleton loop has complement connected, but is not simple.|Pass|
|Polygonal crosscut parity; README:355|Square with diagonal: upper and lower off-diagonal interior points have parity pairs (1,0),(0,1); mod-2 sum=1=outer parity. Outside both: 0+0=0.|Pass|
|Ear existence; README:360|Square n=4 has corner triangles; clipping one leaves a 3-gon. n=3 is excluded by n>3; non-simple bow tie fails premise.|Pass|
|Polygonal Schoenflies / IsPLHomeomorph; README:364, Lean:198,211|T admits h=id with both PL laws; reflected T uses conjugation. Whole-plane x↦x³ in the first real coordinate is a homeomorphism but is not locally finitely affine.|Pass|
|PolygonalDrawing; README:370|A triangle has 3 distinct vertex images and intersections exactly endpoints. Crossing two nonadjacent segments produces one forbidden intersection.|Intended condition discriminates; schematic carrier needs API.|
|Polygonal nonplanarity of K₃,₃; README:373|V=6,E=9; simple bipartite planar bound E≤2V−4 gives 9≤8, false. C₄ has E=4=2V−4 and embeds.|Pass; locator R10.|
|inside/outside; README:402, Lean:222|S: filled hull=D̄, inside=D, outside={norm>1}; 0 is inside, 2 outside, 1 in neither.|Pass|
|Jordan degenerates|∅ and singleton are not homeomorphic to Circle; two disjoint circles have two components and fail IsJordanCurve.|No vacuous nonempty Jordan theorem.|
|IsCrosscut; README:411, Lean:230|Diameter [−1,1]: endpoints on S, open interval in D, injective. Boundary semicircle has interior parameters on S; segment 0→1 has first endpoint off S; singleton fails injectivity.|Pass|
|Accessible; README:440, Lean:237|For p=1 use t↦t, t<1 in D; p=2 fails p∈S. Constant approach at 1 fails injectivity/interior.|Pass; first conjunct padding R09.|
|Jordan inside connected; README:451|S: inside D, any two points joined by line segment; component count 1.|Pass; owner R04.|
|Jordan outside connected; README:452|S: norm>1, radial-then-angular paths; component count 1.|Pass|
|Boundedness/unboundedness; README:453–454|D is bounded by radius 1; exterior contains real n for all n≥2, norms unbounded.|Pass|
|Common frontiers; README:455–456|frontier D=S=frontier {norm>1}; at norm 1 every ball meets both.|Pass|
|Curve in closure inside; README:459|For p∈S, (1−1/n)p∈D for n≥2 and tends to p.|Pass|
|Jordan domain; README:462, Lean:273|D is open/connected/bounded with frontier S; punctured D has frontier S∪{0}, which is not Jordan.|Pass; imported owner/corollary R04.|
|Simply connected; README:465, Lean:278|D contracts by (t,z)↦(1−t)z; punctured D's loop has winding 1≠0 and fails Jordan-domain frontier.|Pass|
|Accessible closure; README:469, Lean:283|For S every p has radial access, so accessible set=S and closure=S. Polygonally accessible density implies the weaker arbitrary-arc density.|Pass, but keep stronger source input for R03's route.|
|Arbitrary crosscut split; README:472, Lean:288|Diameter gives upper/lower semicircle-with-diameter curves: intersection P, union S∪P. Their interiors are upper/lower half-discs and exhaust D∖P.|Statement survives; source overclaim R03.|
|Nonpolygonal crosscut|Parabola y=(1−x²)/2: x²+y²=(x²+1)²/4<1 for −1<x<1; at ±1 value=1. Region count=2, finite affine pieces impossible.|Separates arbitrary from polygonal source, R03.|
|Jordan component count; README:480, Lean:302|S complement: D and exterior, Nat.card=2. Segment complement: Nat.card=1, but IsJordanCurve=false.|Pass|
|Arc nonseparation; README:485|Plane minus [−1,1] is path connected; plane minus S has 2 components but S is not an arc.|Pass|
|No retraction; README:489, Lean:308|Hypothetical disc retraction forces winding 1 of boundary loop equal winding 0 of its constant contraction. Constant map to1 fails r(I)=I.|Pass; owner R04.|
|Brouwer; README:494, Lean:314|f(z)=−z on D̄: fixed set={0}; f(z)=z: fixed set=D̄; constant f=1: fixed set={1}.|Pass, compactness matters; owner R04.|
|Invariance of domain; README:497, Lean:319|U=∅: image∅ open, injection vacuous. U=ℂ, z↦2z: imageℂ open. Inclusion [0,1]↪ℂ has nonopen image but U is not open.|Pass|
|Boundary preservation; README:504, Lean:329|Disc conjugation maps S onto S; annulus inversion swaps its two boundary circles, union preserved.|Pass|
|Boundary component count; README:507–510, Lean:337|Sphere0,disc1,annulus2,empty0; conjugation gives1=1 and annulus inversion2=2.|Pass|
|Winding homotopy input; README:519|Boundary identity loop has winding1, constant loop0; any connecting homotopy avoiding0 would assert1=0. Piecewise-C¹ endpoints suffice.|Pass; exact namespace correction R10.|
|Kulpa zero avoidance; README:521|X={0}, f(0)=1, Y=unit circle: F≡1 gives error0<ε. For filling D̄, Y has nonempty interior, so the theorem does not promise to remove a degree-one zero.|Pass|
|Kulpa affine-grid proof input|Affine map rank1 in ℝ² has line image, empty interior; rank2 maps open triangle to open triangle and is invertible there.|Pass|
|Subdivision data; README:569|Edge subdivided at 1/3: new vertex maps1/3; endpoints0,1; point1/2 in first subedge maps1/6. Moving subdivision vertex to2/3 changes that map to1/3.|Pass|
|Subdivides proposition; README:581|Identity edge has a witness; two different middle placements give two data witnesses but the same existence truth value.|Pass|
|Subdivision reflexivity; README:584|Every vertex v maps to v and every realized point to itself; on 1/3 both sides1/3.|Pass|
|Subdivision transitivity; README:585|Subdivide first edge segment twice: normalized local coordinate1/2 then outer scale1/2 gives1/4.|Pass|
|Composite realization map; README:586|Same nested edge: composite map and recorded composite homeomorphism both give1/4.|Pass|
|Common refinement; README:590|Partitions {0,1/3,1} and {0,2/3,1} have common partition {0,1/3,2/3,1}; marked maps to original send shared positions identically.|Pass|
|Stellar support; README:594–600|Single vertex starred: 1 old vertex replaced by1 new vertex, not2. Edge starred: (V,E)=(2,1)→(3,2). Triangle starred: (3,3,1)→(4,6,3).|Prior defect repaired.|
|Stellar homeomorphism|Edge midpoint goes1/2; endpoints remain0,1; inverse is continuous on two subintervals.|Native adapter only, R05.|
|Barycentric subdivision; README:603|Triangle has 7 vertices,12 edges,6 triangles; χ=7−12+6=1. Old vertices remain fixed.|Pass|
|SimplicialRealizes; README:610|Equal middle placement: both sides1/3. Mismatched placement1/3 versus2/3: values unequal.|Pass; requires commutative-square Check, R12.|
|Finite realization metric; README:616|Coordinate vertices e₁,e₂ distance√2; midpoint distances1/√2. Empty realization has no point pairs.|Consistent with Euclidean coordinate metric.|
|IsPLMap; README:621|Identity edge is simplicial; tent map is affine on [0,1/2],[1/2,1]; x³ has nonconstant derivative on every open interval and cannot be finite-piece affine.|Pass|
|PL map composition; README:628|Tent composed with tent is affine on4 subintervals; values at0,1/4,1/2,3/4,1 are0,1,0,1,0.|Pass|
|Subdivision map is PL; README:631|Split edge at1/3: linear pieces slopes1/3 and2/3 in local coordinates; both affine.|Pass|
|PL realization composition; README:632|Vertex collapse to a point: summed barycentric weights1/4+3/4=1; direct and composed maps equal same vertex.|Pass|
|PL-homeomorphic subdivisions; README:636|Edge kink at1/3 versus2/3: insert both breakpoints; maps become simplicial on matching subdivisions. x³ is excluded by PL premise.|Pass|
|IsCombinatorialSurface; README:646|T: triangle count1; each edge has1 incident triangle; vertex link an interval. Tetrahedron boundary: each edge2 triangles; links3-cycles.|Pass|
|Closed combinatorial surface; README:652|Tetrahedron boundary has0 boundary edges; T has3; empty complex0.|Pass|
|Surface nonexamples; README:686|Two triangles joined at vertex: its link2 disjoint intervals. Three triangles at edge: incidence3. Cone on theta: apex link has degree3. All fail.|Pass|
|Circle/arc graph definitions; README:684|3-cycle degrees(2,2,2); path3vertices degrees(1,2,1); single point degree0, excluded; empty graph not connected.|Pass|
|Surface realization charts; README:657|T vertex has half-disc link model; tetrahedron vertex full disc; pinch vertex lacks either.|Pass|
|Realization compactness; README:659|T closed bounded coordinate simplex, compact; infinite discrete vertex complex noncompact, excluded by finiteness.|Duplicate native result R05.|
|Boundary subcomplex; README:661|T boundary3-cycle; tetrahedron boundary subcomplex empty; Mobius triangulation has1 boundary cycle.|Pass|
|Combinatorial-manifold equivalence; README:665|T: finite=true and vertex link1-ball=true on both intended predicates. Empty complex: finite=true and link conditions vacuous on both.|Pass|
|Link-model explanation; README:680|T vertex link edge dimension1; filled triangle dimension2; no dimension-preserving stellar equivalence.|Fails explanation, R07.|
|IsPLMap iff IsPLOn; README:670|Identity triangle: both true; x³ coordinate homeomorphism on square interior: both false locally. Finite support is needed for the stated global refinement proof.|Pass|
|Open-map approximation; README:732, Lean:368|f=id, φ≡ε>0: g=f gives distance0<ε and identical source/target. Empty source makes all bounds vacuous and allows empty g.|Pass|
|Strong positivity; README:717|φ≡ε has lower boundε/2; φ=1/(1+norm x) has positive local infimum; φ∈{1,2} has lower bound1/2 despite discontinuity.|Pass|
|Failed merely-positive control; README:792|At irrationals φ=1, at rational p/q take1/q: arbitrarily small nearby bounds force a continuous approximant to equal f. For f(x)=x³ this would force non-PL g.|Repaired hypothesis excludes this example.|
|Half-plane approximation; README:741, Lean:378|f=id on half-plane: g=id, error0, H mapsH and boundary line mapsitself; reflection along boundary also preservesH.|Pass|
|Compact-surface PL approximation; README:755|Identity triangulated disc: g=id, uniform error0<ε; ε=0 would demand0<0, excluded.|Pass; source extensions uncertified.|
|Relative PL approximation; README:763|Disc identity on boundary subcomplex: g=id agrees there, error0. Arbitrary nonlinear boundary map fails PL boundary premise.|Pass|
|Radó finite/combinatorial; README:819|Disc admits single triangle (3,3,1); sphere tetrahedron boundary(4,6,4); empty surface empty complex.|Pass instance; deeper source uncertified.|
|Radó IsTriangulable; README:824, Lean:398|Same3 examples give native triangulability=true. Infinite plane is triangulable but not compact; theorem does not assert compactness converse.|Valid weak consequence; strong form is separately named unavailable.|
|Boundary components Jordan; README:827|Disc boundary1 circle; annulus2 circles; sphere0; empty0. No singleton boundary component fits surface charts.|Pass|
|Boundary collar; README:831|Disc c(z,t)=(1−t/2)z: c(z,0)=z and injective for0≤t<1; empty boundary has unique empty map.|Local construction survives; Brown assembly imported, R05.|
|Hauptvermutung; README:834|Two marked triangulations of disc can use comparison x↦x³ in a coordinate: comparison not PL, while an abstract PL homeomorphism exists.|Correct existential scope; no assertion own comparison map is PL.|
|PL homeomorphism existence; README:843|T versus its barycentric subdivision: common subdivision has6 triangles; induced realization equivalence is PL both ways.|Pass|
|Isotopy to PL; README:852|Nonlinear increasing interval map x³ is isotopic to identity via (1−t)x³+tx; derivative/order gives strict increase; product model on a disc illustrates replacement.|Pass|
|Relative isotopy to PL; README:855|Boundary-fixed identity has constant isotopy; boundary-conjugating disc map fails fixed-boundary premise.|Pass|
|BistellarMove; README:867|1→3 has Δ(V,E,F)=(1,3,2);2→2=(0,0,0);boundary1→2=(1,2,1). Every Δχ=0.|Pass|
|Pachner connectivity; README:872|Tetrahedron boundary: two1→3 moves give(6,12,8); flip original shared edge gives octahedron triangulation with all6 degrees4.|Pass explicit sequence; source locator uncertified.|
|General Euler sum; README:911|Point1; edge2−1=1; full tetrahedron4−6+4−1=1; empty sum0. Native faces exclude∅.|Pass|
|Surface V−E+F; README:915|Sphere tetrahedron2;disc1;empty0;full3-simplex truncation would give2≠1 and is outside surface/dim≤2 premise.|Pass|
|Euler subdivision invariance; README:919|T:1→7−12+6=1;tetrahedron boundary2→14−36+24=2. Full tetrahedron complete alternating sum15−50+60−24=1.|Pass|
|Euler isomorphism invariance; README:920|Permuting T vertices keeps counts(3,3,1), χ1.|Pass|
|Triangle orientation; README:924|(0,1,2),(1,2,0),(2,0,1) same cyclic class; swapping0,1 reverses it. Adjacent triangles induce opposite shared-edge directions.|Pass|
|Combinatorial orientability; README:925|T admits2 coherent choices; tetrahedron boundary2; Mobius seam reverses sign so no coherent choice; empty complex has1 empty assignment.|Pass|
|Orientation under subdivision; README:928|Oriented T splits into3 coherently oriented triangles; outer edges keep directions; internal edges cancel in pairs.|Pass|
|Orientation isomorphism; README:929|Vertex swap reverses T's chosen orientation but sends the set of coherent orientations bijectively to itself:2→2.|Pass|
|Orientation-cover construction; README:934|Each triangle has ± sheets; crossing a shared edge chooses the unique sheet giving opposite induced edge directions. Trivial gluing around Mobius core fails after1 circuit.|Construction determines nontrivial cover.|
|Covering property; README:944|Small triangle-interior disc lifts to2 disjoint discs; a boundary half-disc lifts to2 half-discs.|Pass|
|Cover fibre cardinality; README:947|Every base point of disc/annulus/Mobius has fibre2; empty base gives no points, statement vacuous without false nonempty assertion.|Pass|
|Surface Euler via triangulation; README:956–958|Disc choices T/barycentric T give1=1; sphere tetra/octa give2=2; empty0.|Pass|
|Surface orientability/invariance; README:961–963|Disc=true;Mobius=false; reflection changes choice but not existence=true.|Pass|
|Surface orientations as comparisons; README:969|Disc has2 classes distinguished by reversal; arbitrary comparison x³ is replaced by PL map isotopic to it, same orientation sign+1.|Consistent intended quotient, exact API required.|
|Orientation map; README:971|Disc identity acts+1, reflection acts−1, reflection² acts+1.|Pass|
|Isotopic maps act equally; README:972|Rotation0 and rotationπ preserve orientation: signs+1,+1. Reflection sign−1 cannot be isotopic to identity.|Pass|
|Number of orientations; README:974|Connected orientable disc/sphere:2; two disjoint discs:4;empty:1. The latter two fail connected-nonempty hypothesis.|Pass|
|Boundary orientation; README:977|At (1,0), CCW tangent(0,1) has left normal(−1,0), toward disc. On annulus inner boundary clockwise tangent has annular region on left.|Pass|
|Sphere/disc basic invariants; README:980|χsphere2,χdisc1;both orientable;boundary counts0,1.|Pass|
|Orientation deck involution; README:990|(triangle,+)↔(triangle,−), no fixed sheet; two applications=id; orientation sign−1.|Pass|
|Orientation-cover examples; README:998|Disc cover2discs χ2; sphere cover2spheres χ4;Mobius cover connected annulus χ0.|Pass|
|Boundary lifts of orientation cover; README:990|Disc boundary1→2 circles;Mobius boundary1→2 circles even though total cover connected.|Pass|
|Plane Schoenflies; README:1011, Lean:405|S: h=id, h(S)=S. Radius2 circle: h(z)=z/2 maps toS. Reflection can reverse parametrization.|Pass|
|Closed-inside Schoenflies; README:1024, Lean:411|S: closure inside=D̄; identity gives D̄≃ₜD̄. Radius2: scale1/2.|Pass; name mismatch R11.|
|Spherical Schoenflies; Lean:418|Equator complement consists of2 open hemispheres; identity realizes equator case.|Pass|
|Prescribed extension; README:1034, Lean:424|Circle map z↦conj z extends same plane conjugation; rotationI extends z↦Iz. Identity boundary extendsid.|Pass|
|Interior circle local flatness; README:1045, Lean:440|S in plane: near1, circle is a topological line; small neighbourhood minusS has2 components.|Pass|
|Arc slice theorem; README:1048, Lean:446|Segment endpoint0 model half-line has1 local branch; interior1/2 has2. Translation of half-line chart places interior point away from its endpoint.|Pass|
|Two-sided collar; README:1054|Annular core normal direction returns unchanged after1 circuit; Mobius core normal direction returns negated.|Expected distinction; predicate not defined, R08.|
|Annulus/Mobius dichotomy; README:1062|Annular neighbourhood has2 boundary components;Mobius neighbourhood1. Both core circles locally flat.|Values right; marked neighbourhood predicates need definitions, R08.|
|Finite-graph tameness; README:1074|Y-star has3 branches, cannot be a line with2, but is already a finite graph subcomplex. Theta graph hasdegree3 at two vertices and is tame.|Repaired non-line model; use prior triangulation.|
|Matched-cellulation extension; README:1085|Cell diameters≤2⁻ⁿ imply two compatible nested choices differ by≤2·2⁻ⁿ→0; inverse nested construction gives unique limit.|Pass size argument; must preserve stronger accessibility inputs, R03.|
|Epstein two-sided curves; README:1110|Parallel essential circles in annulus have class+1 and cobound annulus. Opposite parametrizations of a disc-bounding circle are homotopic in disc but not ambient-isotopic as parametrized maps.|Essential/no-disc hypothesis repairs previous issue.|
|Epstein one-sided; README:1115|Mobius core has reversing normal monodromy−1; annulus core+1 fails premise.|Pass|
|Epstein proper arcs; README:1120|Disc diameter with fixed endpoints: identity isotopy fixesendpoints; swapped parametrization sends−1 to1 and fails rel-endpoint homotopy.|Pass|
|Oriented disc-bounding curves; README:1124|Two concentric circles traversed CCW have sign+1,+1; reversing one gives+1,−1 and is excluded.|Pass|
|Based Epstein; README:1134|Disc trivial π₁ permits both orientations of null loop; excluded disc avoids that counterexample. Mobius is separately excluded.|Hypotheses consistent with source; no classification substitute.|
|PLStructure; README:1152|T realization→disc is data; composing it with nonlinear disc homeomorphism changes marked structure, even though underlying disc same.|Consistent; API/Checks R12.|
|PL representative; README:1160|Identity between differently marked disc triangulations can be non-PL in coordinates; an isotopic PL representative has same orientation+1.|Pass|
|Closed Epstein; README:1169, Lean:457|S² identity/rotationπ homotopic and isotopic via rotations; reflection has degree−1 versus+1 and fails homotopy premise. Empty case has unique map/isotopy.|Pass|
|Relative Epstein; README:1171|Disc id/conjugation: unrestricted homotopy exists, boundary values atI differ, so HomotopicRel=false; id/id has constant relative isotopy.|Headline statable, R06.|
|PL isotopy injection; README:1174|PL rotation on a polygonal annulus admits jointly PL isotopy after triangulating time-space; arbitrary nonsmooth time change need not be jointlyPL.|Exact predicate missing, R08.|
|Topological iff PL homeomorphism; README:1179|T and barycentric T: both Nonempty=true; sphere vsdisc: bothfalse since boundary counts0≠1.|Both directions tested.|
|Chart bridge; README:1186|T induces half-plane charts; tetrahedron sphere full-plane local models.|Existing dimension-general owner, R04.|
|Smooth compatibility; README:1200|One triangle at boundary corner has2 independent edge tangents mapped into1 boundary tangent line, rank≤1; subdivision separates boundary edges among small triangles.|Repair to subdivision-based condition passes the obstruction.|
|Smoothing atlas; README:1203|Disc standard smooth half-plane atlas gives dimension2; empty surface admits empty atlas. Sphere cannot have a smooth PL (locally affine) atlas developing into open compact subsetℝ².|Intended compatibility avoids affine-atlas mistake; source unverified.|
|Smoothing manifold law; README:1205|Standard disc transitions smooth, chart differential rank2 on tangent model; constant chart rank0 is not a chart/homeomorphism.|Signature intent consistent.|
|Smoothing compatibility law; README:1206|Subdivided triangle compatible pieces have rank2; original corner piece rank≤1 would fail.|Pass|
|Smoothing uniqueness; README:1207|Equal σ=τ:φ=id,degree+1; orientation-reversing diffeo hasdegree−1 and cannot witness isotopy-to-id.|Pass on equality and wrong witness; source uncertified.|
|Diffeomorphism representative; README:1216|Smooth disc rotation already a diffeomorphism, constant isotopy; nonlinear topological map must be replaced, not asserted smooth.|Intended scope coherent; source uncertified.|
|Relative diffeomorphism representative; README:1219|Boundary-fixed id givesφ=id, restrictionsid; conjugation differs atI and fails EqOn premise.|Pass instance; relative source not certified.|
|Smooth isotopy comparison; README:1225|Rotations with smooth angle t give joint smoothness; angle abs(t−1/2) has smooth slices but not joint smoothness at1/2.|R08 must specify which predicate.|
|Relative simplicial approximation; README:1233|Identity triangulated interval/disc fixes prescribed boundary; non-PL boundary data would preclude exact relative simplicial matching.|Intended PL-boundary hypothesis discriminates.|
|Nullhomotopic simple PL loop bounds disc; README:1233|Triangle in plane bounds filled T; essential annulus core has winding1 and is not nullhomotopic.|Pass|
|Homotopic essential loops cobound annulus; README:1233|Disjoint concentric circles, same orientation, give S¹×[0,1]; opposite parametrizations have winding+1/−1 and fail essential homotopy premise.|Pass|
|Bigon reduction; README:1233|A removable bigon has2 transverse intersection corners; pushing across removes2, reducing finite count N toN−2 with N≥2.|Pass|
|Cutting-system route; README:1234|Disc remainder boundary-fixed map has Alexander isotopy; annulus twist needs relative winding class0 before such an isotopy.|Base cases must retain relative homotopy; not replaced by unrestricted contractibility.|

Arithmetic-characteristic/DVR/scalar-tower tests are inapplicable. Tests instead include empty objects, dimensions 0–2, boundary, disconnected covers and marked maps. All compiled quantifiers were compared with the README; these tests found no false compiled headline.


### Headline coverage and source sample

README:11–52's end theorems are Jordan/crosscut/frontier accessibility and invariance of domain; compact Radó; Hauptvermutung/Pachner; Euler/orientation/boundary invariants; polygonal, planar, closed-inside, spherical and prescribed-boundary Schoenflies; automatic tameness; PL/smooth comparison and Epstein. The acceptance file includes the planar separation group, local approximation, native weak triangulability, the four Schoenflies forms, circle/arc tameness and closed Epstein. Its docstring names the absent combinatorial subdivision/orientation/PL/smoothing infrastructure. Boundary-relative Epstein is already statable and missing (R06). General finite-graph tameness should be named explicitly among the omitted triangulation-dependent headlines. Existing-owner headlines must be removed under R04, not expanded.

All occurrences of the **15 seeded heading labels**, repeated across nine layers, were inspected, including every “From” list and unverified locator. Five mathematical texts were read through the source service; limitations follow.

|Sample heading occurrences|Text/locator actually inspected|Result|
|---|---|---|
|Layer 0 Natural intermediate results, representative statements, route notes (:209–297)|Moise §5, pp.42–45; Cannon/Newman references|Coning/pathology locators could not be certified. Native coordinates verified at Mathlib/Analysis/InnerProductSpace/PiL2.lean:873–886.|
|From layer 0; From Tau Ceti; Layer 1 representative/natural/consequences (:307–398)|thomassen1992 lines143–188, Lemmas2.3–2.5, pp.119–120; thomassen_blueprint lines178,251–278,293,361–377|Polygonal separation/parity/crosscuts/nonplanarity supported. Printed-page corrections R10. Native winding input has the endpoint regularity stated above.|
|Layer 2 From Tau Ceti, representative statements, route/natural/consequences (:409–548)|thomassen1992 lines263,282–311, Proposition2.11, Theorem2.12, Lemma2.13, pp.121–123; blueprint lines729,786–806|Arc nonseparation and Jordan/frontiers/accessibility supported; arbitrary crosscut exceeds stated source, R03.|
|Layer 2 zero-avoidance route (:521)|kulpa1998 lines44–47,68–94,210–236; pp.127–129,132–133|Compact sets, positive tolerance and empty-interior added set retained. The finite affine proof step was read, not inferred from the title.|
|Layer 3 From Tau Ceti, representative/route/natural/consequences (:556–696)|Native simplicial files in table above; Rourke–Sanderson chs.1–3|Native duplication and link dimension found, R05/R07. Book-only statements uncertified.|
|Layers 4–5 representative/route/natural/consequences (:723–891)|Moise Theorems6.2–6.4,8.2–8.5, pp.46–50,58–64; Pachner1990|Books/article unavailable as full legal text; half-plane/relative forms are identified as extensions, not certified direct quotations.|
|Layer 6 representative/route/natural/consequences (:905–1007)|epstein1966 lines61–63, Proposition1.5, p.84; native lifting :308–330|Two lifts per simplex give χ(cover)=2χ(base). Numerical orientation/cover rows test the concrete construction, not an unmarked degree-two cover.|
|From layers 0 and 2; From layers 3 and 5; Layer 7 representative/route/natural/consequences (:1015–1094)|thomassen1992 lines338–430, Theorem3.1, pp.123–125; blueprint lines812–844, Theorem7.1, pp.18–19|Prescribed boundary extension supported. Matched-cellulation route uses polygonal accessibility/crosscuts. Graph tameness additionally needs the earlier triangulation.|
|Layer 8 From Tau Ceti; representative/route/natural/consequences (:1103–1252)|epstein1966 lines109–115,145–153,214–234,533–610,725–790; Theorems2.1,3.1,3.3,4.1,6.3–6.4 and Appendix, pp.86–91,99–107|Essential/two-sided, endpoint and based restrictions checked. Compactness supplies properness; disconnected compact surfaces reduce to finitely many components. Smoothing references not certified.|

A source error was also tested directly against the printed p.101 image, not just OCR:

|Source statement|Instance and computed values|Result / change|
|---|---|---|
|Epstein Theorem6.4(a), absolute homotopy on surfaces with compact boundary components|Disc reflection z↦conj z is homotopic to id by H(t,z)=(1−t)z+t·conj z. Orientation signs are +1 and−1, so no embedding isotopy joins them.|Printed exception list omits the disc. Add the disc to its orientation-preserving exceptions; roadmap's closed/relative restrictions avoid this error.|

## Not verifiable

- **moise** (1977), §5 pp.42–45, §6 Theorems6.2–6.4 pp.46–50, §8 Theorems8.2–8.5 pp.58–64: the service reached the Springer paywall and recorded uncertified. Local approximation, Radó/Hauptvermutung and their relative extensions are not source-certified here.
- **rourke_sanderson**, chapters1–3: Springer access is paywalled; uncertified. **pachner1990**, pp.37–47, DOI10.1016/0012-365X(90)90178-K: Elsevier paywall; uncertified. No invented theorem numbers.
- **newman**: service bibliographic lookup produced no readable legal text. **munkres_differential**: lookup reached JSTOR2315380, a review rather than the book, so it does not certify the book's contents.
- **whitehead1940**, DOI10.2307/1968861; **munkres1960**, DOI10.2307/1970228: JSTOR landing pages, no open full texts obtained. **kuiper1965**, DOI10.1515/9781400874842-002: publisher landing page, no readable open chapter. Compatible smoothing, uniqueness and relative/smooth-isotopy claims remain uncertified.
- **cannon**, Topology as Fluid Geometry, volume2: AMS landing page DOI10.1090/mbk/109 yielded no readable text; no exact locator supports the pathology/prospectus claims here.
- **jordan-pick** provenance: the service followed a linked Hales PDF rather than retrieving the repository documentation; its advertised proof content was not certified. The fetched classification and Schoenflies repository pages advertise Apache licensing, and the latter a CC-BY blueprint; these are not evidence that their code ports to the pinned libraries. No external code was run.
- Missing-source requests were consolidated in needs-references.toml with the existing keys. Paywalled works recorded uncertified were not re-requested. These limitations do not suspend this review or erase its witnessed findings.

## Source issues

- **Error** in epstein1966 at Theorem 6.4(a), printed p.101: the source says absolute homotopy implies isotopy without an orientation exception for the disc; it should be an orientation-preserving assumption also on the disc; affects a stated result.
- **Misprint** in blokh_laminations at arXiv:1401.5123v3, §1.2, printed p.5: the source says the filled combinatorial Mandelbrot model equals the circle quotient; it should be the closed-disc quotient, with the circle quotient its boundary; affects a stated result.
