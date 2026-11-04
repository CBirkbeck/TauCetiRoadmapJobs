# Review of PlanarTopology (pull request #271 at 421e114)

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

**Repair:** Add the module-system header and rerun the targeted build/gate. A fresh scratch copy with the header elaborates with only sorry warnings. The ordinary file elaborates too, but the gate explicitly disallows its extra warning. P1 is the brief's required severity for a failed build gate.

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

**Instance:** Disc half-turn: fixed set {0}; unit circle: two complementary components. Both supplier results give these values. This carries forward R04 of the previous review; the realization-map repair remains intact.

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

**Instance:** Disc id/id has constant relative isotopy; id/conjugation fails the relative premise at I since I≠−I. The native relative signature was re-elaborated in this review.

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

**Repair:** Delete the API/Check declarations from Suggested.lean, including IsCrosscut.exists_boundary_endpoints, and definitions not needed by the remaining headlines. Keep their mathematics and Checks in the README; do not prove padding in place. The previous review tried all 28 unchanged admissions with simp, rfl and infer_instance; none closed. Those probe results are carried forward. This finding concerns inspectable proved API padding and unused definitions.

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

**Witness:** The worker gate and the fresh gate both report stray-files=1 for this file.

**Repair:** Delete it; sources are the README's references. Preserve the citation metadata/locators there. This is the explicit folder-file rule in this brief, despite its general source-manifest workflow elsewhere. No review edit was made to the manifest.

## Previous findings

The folder and library pins are unchanged since the [previous review][r2]. No supplied repair report marks a finding as not actionable. Each finding above is carried forward under its existing identifier; no new finding is introduced.

- R01 — not repaired: README:1302 still says Moore's theorem makes the pinched-disc model a disc; the cut-point witness still contradicts it.
- R02 — not repaired: Suggested.lean:1 still begins with import Mathlib; the targeted build reproduces the module-system warning.
- R03 — not repaired: README:472 and Suggested.lean:288 still quantify over arbitrary embedded crosscuts; the polygonal source does not supply the missing extension.
- R04 — not repaired: README:66–74 still commissions elementary proofs of owned results; README:1183–1187 retains the chart bridge. The completed and main supplier specifications still own these statements.
- R05 — not repaired: README:114,659,678,881 still duplicates or overlooks native purity, compactness, stellar-homeomorphism and topological-collar results.
- R06 — not repaired: README:1171–1173 promises boundary-relative Epstein, while Suggested.lean:46–53 still treats relative isotopies as missing vocabulary. A native signature elaborates.
- R07 — not repaired: README:680 still uses a filled triangle as the boundary-vertex link model; the link must have dimension one.
- R08 — not repaired: README:1054–1064,1174–1176,1224–1226 still uses undefined two-sidedness, neighbourhood and PL/smooth-isotopy predicates.
- R09 — not repaired: Suggested.lean:181–184,240–269,277–280 retains the proved API/Check padding and unused supporting definitions.
- R10 — not repaired: README:807 retains the quotation; README:1344 retains the erroneous printed-page locators, and smoothing/Pachner lack target-specific locators.
- R11 — not repaired: README:1,54,181,209 and the nine layers retain the catalogue structure; the required per-target Needs lines and name alignment remain absent.
- R12 — not repaired: README:295,386,783,1152–1156 still lacks definition-by-definition APIs and three discriminating computed Checks.
- R13 — not repaired: TauCetiRoadmap/PlanarTopology/sources.toml remains present and fails the folder-file rule.
- R14 — repaired: Completed/ConformalMapping/README.md's seven added lines were reverted. The BelyiMaps and GeometricTopology edits were also reverted; the net diff touches only the two authorized roadmap folders.

## Verified sound

This is an incremental re-review of 0 changed lines since 9bd6e07. Both reviewed files, lake-manifest.json and lean-toolchain are byte-for-byte unchanged. The only intervening changes revert neighbouring README edits. The prescribed diff excluding PlanarTopology and SurfaceTopology is empty. The worktree remains clean. No pull-request file was changed.

The root README and CONTRIBUTING were read. Main AlgebraicTopology, completed ConformalMapping, and main GeometricTopology supplied the format and ownership comparison. The changed neighbouring passages were checked as reversions, not as new supplier promises. In particular, removing their reciprocal links does not alter the ownership in main or repair R04.

### Fresh gate and elaboration

- Worker gate: stray-files=1 and build=1; all other counters zero. Its build failure is the non-sorry module-system warning, not a Lean type error.
- Fresh gate: stray-files=1, outside-folder=4; all other reported counters zero. It stops before the build. Its four outside-folder lines are TauCetiRoadmap/SurfaceTopology/README.md, Suggested.lean, metadata.toml and sources.toml. These are explicitly authorized sibling files and therefore false positives for this review's scope, not four findings. The stray PlanarTopology manifest remains R13.
- Fresh targeted build: exit 0, with 28 sorry warnings and the Mathlib module-system warning; the latter preserves R02 under the warning-sensitive gate.
- Fresh direct elaboration of Suggested.lean: exit 0, 28 sorry warnings only.
- Fresh signature probe: all 48 actual declarations checked with #check @name, exit 0. The worker's apparent 49th declaration is prose at line 151 parsed as a name ending in a comma. The corrected probe omits that artifact. Types agree with the previous signatures; no changed binder was found. boundaryComponentCount legitimately needs no T2Space instance, while its invariance theorem retains both Hausdorff assumptions. Closed Epstein retains compactness and empty boundary; the local approximation signatures retain the precise local positive lower bound.
- A fresh copy with a module header and a native boundary-relative Epstein statement elaborates. The statement uses ContinuousMap.HomotopicRel and an existential TauCeti.Isotopy with ∀ t x, x ∈ boundary M → F (t,x) = f x. Thus R06 is still a missing statable headline. Disc identity gives the constant relative isotopy; conjugation fails the relative premise at I.
- The unchanged 28-admission one-tactic probe results are carried from [the previous review][r2]: simp, rfl and infer_instance closed none. The explicit proved padding was re-read; carrier parity is simp [crossingParity, hq], accessibility membership is hp.1, and simple connectivity applies the imported result.

The complete fresh dependency-check output is:

    depcheck: 205 roadmaps, 1504 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. All layer From lists and cross-roadmap citations were re-resolved; there are no Needs lines, as reported in R11, and no declared supplier gaps. The increase by one edge from the previous report does not create a dependency failure.

Pins confirmed: Mathlib f6090c7095e1e56b3464c1daba5f24631f1290d2; Tau Ceti 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a. No newer library implementation was substituted for either pin.

### Native witnesses reopened at the pins

These eight interfaces (nine declarations counting Isotopy and Isotopic separately) were reopened for the surviving findings and signature checks. File paths are library-relative.

|Interface|File and line|What was verified|
|---|---|---|
|PreAbstractSimplicialComplex.IsPure|TauCeti/AlgebraicTopology/SimplicialComplex/Pure.lean:37|Every face extends to an n+1-vertex face; void complex allowed.|
|AbstractSimplicialComplex.compactSpace_realization_of_finite_faces|TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Finite.lean:61|Finite faces suffice; no surface condition.|
|AbstractSimplicialComplex.isClosedEmbedding_realization_coe|TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Finite.lean:85|Finite realization carries the topology inherited from barycentric coordinates.|
|PreAbstractSimplicialComplex.exists_homeomorph_stellarSubdivision|TauCeti/AlgebraicTopology/SimplicialComplex/Subdivision/Stellar/Homeomorph.lean:51|Finite faces, fresh vertex and a common ambient complex; the barycentric placement is fixed.|
|PreAbstractSimplicialComplex.IsCombinatorialManifold|TauCeti/AlgebraicTopology/SimplicialComplex/CombinatorialManifold/Basic.lean:214|At dimension 2, links are 1-spheres or 1-balls.|
|TauCeti.IsLocallyCollared.isCollared|TauCeti/Geometry/Manifold/Boundary/Collar/Brown.lean:458|Compact source, Hausdorff target, injectivity and local collaring; no smoothness.|
|TauCeti.Isotopy / TauCeti.Isotopic|TauCeti/Topology/Homotopy/Isotopy/Basic.lean:85,111|A homotopy with embedding slices, and its nonempty predicate.|
|ContinuousMap.HomotopicRel|Mathlib/Topology/Homotopy/Basic.lean:629|Existence of a homotopy fixed on a specified subset; endpoint agreement at line 641.|

The previous review's other pinned-library inspections are inherited with the unchanged pins, not claimed as fresh source reads.

### Cross-roadmap citations resolved at this round

Object-based roadmaps grep and roadmaps show were used for the ownership checks. The main specifications control existing-roadmap ownership; the open GeometricTopology revision was read as context, not used to replace main. The broader unchanged-object audit against the supplied open heads and board packages is carried from [the previous review][r2]. No new construction is introduced by this diff.

|Roadmap/version|Passage resolved|Result|
|---|---|---|
|Completed/ConformalMapping, main|README:135–150, layer 5|Owns general Jordan separation, complementary-side properties and Jordan frontiers. The deleted reciprocal paragraph did not establish that ownership and its removal does not remove it.|
|AlgebraicTopology, main|README:393–451, Stage 2 item 7|Owns no-retraction and finite-dimensional Brouwer, including closed balls. R04 remains.|
|GeometricTopology, main; supplied open revision for context|README:178–345, layers 1–2; :847–900, layer 11|Native manifold/PL vocabulary, local flatness, and combinatorial-to-chart reconciliation are the cited subjects. Main :893–898 still owns the bridge.|
|SurfaceTopology, this head|README:47–57,139–147,339–353,473,614,1256–1303,1492–1493|Consumes this roadmap's results; bundled-index convention agrees, boundary orientation puts the surface on the left, its cover comparison consumes the simplicial cover, layer 9 supplies the bundled proper Arc, and layer 10 states both graph nonplanarity results. No reverse supplier edge is introduced.|

The resolver's two absent names, Surface.IsOrientable and Surface.Orientation.map_of_isotopic, are the README's own Layer 6 targets, not claimed pinned inputs. They do not establish supplier drift. The three reverted neighbouring files now match the PR base; BelyiMaps supplies no input to this roadmap.

### Carried adversarial calculations

Every row below is carried from [PRREVIEW-PlanarTopology~2 at 9bd6e07][r2], as required for unchanged statements. The final column attributes each row individually. These are instance computations, not general proofs. There are 160 roadmap rows and one source-error row. There are no changed mathematical statements requiring new rows.

README and Lean locations in this table mean TauCetiRoadmap/PlanarTopology/README.md and TauCetiRoadmap/PlanarTopology/Suggested.lean. S is the unit circle, D the open disc, and T the counterclockwise triangle 0,1,I.

|Statement / location|Instances tried and values on each side|Result / change|Evidence|
|---|---|---|---|
|Pinched-disc claim; README:1302|Collapse chord joining angles1/3,2/3: quotient disc minus pinch has2 components; genuine disc minus point has1.|False; R01.|[r2]|
|Plane carrier/isometry; README:120, Lean:75|z=3+4I maps to (3,4); both norms 5. z=0 gives both 0.|Pass; unused acceptance definition R09.|[r2]|
|perp; Lean:79|perp(1)=I, perp(I)=−1, perp(0)=0; perp²(1)=−1.|Pass|[r2]|
|det and inner-product law; README:219, Lean:82|det(1,I)=1=⟪I,I⟫; det(I,1)=−1; det(1,1)=0.|Pass|[r2]|
|sup/Euclidean norm bounds; README:219|(1,1): 1≤√2≤√2; (0,0): 0≤0≤0; (1,0): 1≤1≤√2.|Pass|[r2]|
|Surface convention; README:148–166|Plane boundary ∅; half-plane boundary x₀=0; empty model boundary ∅. Circle has local dimension 1, so fails the surface-chart hypothesis.|Pass|[r2]|
|Compact/countability convention|Compact disc has a finite subcover of chart domains and a countable basis; empty surface has empty basis. Uncountable disjoint planes are noncompact and not second countable.|Pass|[r2]|
|Euclidean-to-half-space transport; README:225, Lean:86|Plane and empty surface both yield boundary ∅; half-plane itself is not obtained as a boundaryless transport of its boundary atlas.|Pass|[r2]|
|Relative isotopy; README:239|Constant identity on disc: F(t,z)=z and boundary restriction z. Conjugation at I gives −I≠I.|Intended law passes; R06/R08 specify native relative form.|[r2]|
|IsArc; README:245|Segment [0,1] is homeomorphic to unitInterval; singleton has cardinal 1 and cannot be; S minus no points remains a circle, not an arc.|Pass; needs its own Checks/API, R12.|[r2]|
|Arc endpoints definition; README:246|[0,1] minus 0 or 1 is preconnected; minus 1/2 has 2 components. Endpoints={0,1}.|Pass|[r2]|
|Arc endpoint cardinality; README:247|For [0,1], card=2. For singleton, endpoint set has card=1, but IsArc=false.|Pass|[r2]|
|Endpoint parametrization; README:248|e(t)=1−t sends endpoint preimages to {0,1}; ordered images are {1,0}, same unordered set.|Pass|[r2]|
|Radial cone extension; README:254, Lean:95|n=0: sphere=∅, ball={0}, extension=id. n=1: swap {−1,1} extends x↦−x; n=2 reflection extends conjugation.|Pass|[r2]|
|Cone norm law; README:259|r=0 gives 0=0 without dividing by 0; x=(3/5,4/5)/2 gives norm 1/2 before and after reflection.|Pass|[r2]|
|Cone boundary law; README:260|x=I, reflection: F(I)=−I=h(I); radius=1, so no radial rescaling.|Pass|[r2]|
|Alexander relative isotopy; README:263|For boundary-fixed identity, every time slice=id; t=0 limit fixes 0 and boundary, t=1 returns f. Non-boundary-fixed reflection cannot satisfy the premise.|Pass|[r2]|
|PL cone; README:271|Piecewise affine map of square boundary gives finitely many triangular cones; identity has one affine expression on each cone. A nonlinear angular homeomorphism fails the PL premise.|Pass; general source uncertified.|[r2]|
|Space filling; README:275, Lean:106|A surjective interval curve has image D̄ and area π; no injectivity is claimed. A constant map has image cardinal 1 and is not surjective.|Signature consistent; existence source not certified.|[r2]|
|Nonrectifiable Jordan; README:279, Lean:110|Koch-snowflake stage lengths 3(4/3)^n diverge; its limiting Jordan trace has infinite variation for every surjective traversal. S has a finite-variation traversal of length 2π.|Pass; name mismatch R11.|[r2]|
|Osgood curve; README:283, Lean:115|Required area >0 excludes S, area=0; Jordan compactness bounds any example's area by πR² for a containing radius R.|No contradictory generality; exact existence source not certified.|[r2]|
|PolygonalChain/carrier; README:310, Lean:122–136|[0,1,I] carrier has segments 0→1 and 1→I; I→0 absent. Singleton [0] has no adjacent segment but the included vertex range gives carrier {0}.|Consistent with real body; document convention and delete unused definition, R09.|[r2]|
|PolygonalLoop side/carrier; Lean:139–153|T has 3 sides including I→0. A singleton loop has degenerate segment {0}; empty list is excluded.|Pass|[r2]|
|IsSimple; Lean:153|T: n=3, distinct vertices, adjacent intersections singleton. Twice-traversed T: n=6 but Nodup=false; bow tie has a nonadjacent intersection.|Pass|[r2]|
|Simple polygon is Jordan; README:337, Lean:159|T has circle trace; bow tie has 4 local branches at its crossing and fails IsSimple.|Pass|[r2]|
|Simple presentation; README:339, Lean:163|Insert (1/2,0) along T's bottom side: same carrier, new 4-vertex simple presentation. Backtracking on [0,1] gives segment, not Jordan.|Pass|[r2]|
|Half-open crossing count; README:342,381|For T and q=(1/4,1/4), right ray hits x=3/4 once: parity 1. Reverse T still has one hit and parity 1.|Pass|[r2]|
|Total carrier parity; Lean:181|q=0 on T: defining carrier branch yields 0; ray arithmetic is not used.|Pass; padding R09.|[r2]|
|Horizontal-run Check; README:388|For stated 6-vertex polygon, q=(0,−1/10),(0,0),(0,1/10): right crossings at 9/10,2,21/10, respectively; counts 1,1,1; parities 1,1,1.|Pass|[r2]|
|Winding sign/parity; README:345|T at (1/4,1/4): +1; reversed T: −1; twice T: +2. Mod 2 values are 1,1,0.|Pass|[r2]|
|Winding local constancy; README:347|For small moves of (1/4,1/4) inside T, value +1; exterior point (2,2), value 0; crossing a side separates these regions.|Pass|[r2]|
|Polygonal Jordan; README:351, Lean:205|T complement has bounded triangular interior and unbounded exterior, component count 2. Singleton loop has complement connected, but is not simple.|Pass|[r2]|
|Polygonal crosscut parity; README:355|Square with diagonal: upper and lower off-diagonal interior points have parity pairs (1,0),(0,1); mod-2 sum=1=outer parity. Outside both: 0+0=0.|Pass|[r2]|
|Ear existence; README:360|Square n=4 has corner triangles; clipping one leaves a 3-gon. n=3 is excluded by n>3; non-simple bow tie fails premise.|Pass|[r2]|
|Polygonal Schoenflies / IsPLHomeomorph; README:364, Lean:198,211|T admits h=id with both PL laws; reflected T uses conjugation. Whole-plane x↦x³ in the first real coordinate is a homeomorphism but is not locally finitely affine.|Pass|[r2]|
|PolygonalDrawing; README:370|A triangle has 3 distinct vertex images and intersections exactly endpoints. Crossing two nonadjacent segments produces one forbidden intersection.|Intended condition discriminates; schematic carrier needs API.|[r2]|
|Polygonal nonplanarity of K₃,₃; README:373|V=6,E=9; simple bipartite planar bound E≤2V−4 gives 9≤8, false. C₄ has E=4=2V−4 and embeds.|Pass; locator R10.|[r2]|
|inside/outside; README:402, Lean:222|S: filled hull=D̄, inside=D, outside={norm>1}; 0 is inside, 2 outside, 1 in neither.|Pass|[r2]|
|Jordan degenerates|∅ and singleton are not homeomorphic to Circle; two disjoint circles have two components and fail IsJordanCurve.|No vacuous nonempty Jordan theorem.|[r2]|
|IsCrosscut; README:411, Lean:230|Diameter [−1,1]: endpoints on S, open interval in D, injective. Boundary semicircle has interior parameters on S; segment 0→1 has first endpoint off S; singleton fails injectivity.|Pass|[r2]|
|Accessible; README:440, Lean:237|For p=1 use t↦t, t<1 in D; p=2 fails p∈S. Constant approach at 1 fails injectivity/interior.|Pass; first conjunct padding R09.|[r2]|
|Jordan inside connected; README:451|S: inside D, any two points joined by line segment; component count 1.|Pass; owner R04.|[r2]|
|Jordan outside connected; README:452|S: norm>1, radial-then-angular paths; component count 1.|Pass|[r2]|
|Boundedness/unboundedness; README:453–454|D is bounded by radius 1; exterior contains real n for all n≥2, norms unbounded.|Pass|[r2]|
|Common frontiers; README:455–456|frontier D=S=frontier {norm>1}; at norm 1 every ball meets both.|Pass|[r2]|
|Curve in closure inside; README:459|For p∈S, (1−1/n)p∈D for n≥2 and tends to p.|Pass|[r2]|
|Jordan domain; README:462, Lean:273|D is open/connected/bounded with frontier S; punctured D has frontier S∪{0}, which is not Jordan.|Pass; imported owner/corollary R04.|[r2]|
|Simply connected; README:465, Lean:278|D contracts by (t,z)↦(1−t)z; punctured D's loop has winding 1≠0 and fails Jordan-domain frontier.|Pass|[r2]|
|Accessible closure; README:469, Lean:283|For S every p has radial access, so accessible set=S and closure=S. Polygonally accessible density implies the weaker arbitrary-arc density.|Pass, but keep stronger source input for R03's route.|[r2]|
|Arbitrary crosscut split; README:472, Lean:288|Diameter gives upper/lower semicircle-with-diameter curves: intersection P, union S∪P. Their interiors are upper/lower half-discs and exhaust D∖P.|Statement survives; source overclaim R03.|[r2]|
|Nonpolygonal crosscut|Parabola y=(1−x²)/2: x²+y²=(x²+1)²/4<1 for −1<x<1; at ±1 value=1. Region count=2, finite affine pieces impossible.|Separates arbitrary from polygonal source, R03.|[r2]|
|Jordan component count; README:480, Lean:302|S complement: D and exterior, Nat.card=2. Segment complement: Nat.card=1, but IsJordanCurve=false.|Pass|[r2]|
|Arc nonseparation; README:485|Plane minus [−1,1] is path connected; plane minus S has 2 components but S is not an arc.|Pass|[r2]|
|No retraction; README:489, Lean:308|Hypothetical disc retraction forces winding 1 of boundary loop equal winding 0 of its constant contraction. Constant map to1 fails r(I)=I.|Pass; owner R04.|[r2]|
|Brouwer; README:494, Lean:314|f(z)=−z on D̄: fixed set={0}; f(z)=z: fixed set=D̄; constant f=1: fixed set={1}.|Pass, compactness matters; owner R04.|[r2]|
|Invariance of domain; README:497, Lean:319|U=∅: image∅ open, injection vacuous. U=ℂ, z↦2z: imageℂ open. Inclusion [0,1]↪ℂ has nonopen image but U is not open.|Pass|[r2]|
|Boundary preservation; README:504, Lean:329|Disc conjugation maps S onto S; annulus inversion swaps its two boundary circles, union preserved.|Pass|[r2]|
|Boundary component count; README:507–510, Lean:337|Sphere0,disc1,annulus2,empty0; conjugation gives1=1 and annulus inversion2=2.|Pass|[r2]|
|Winding homotopy input; README:519|Boundary identity loop has winding1, constant loop0; any connecting homotopy avoiding0 would assert1=0. Piecewise-C¹ endpoints suffice.|Pass; exact namespace correction R10.|[r2]|
|Kulpa zero avoidance; README:521|X={0}, f(0)=1, Y=unit circle: F≡1 gives error0<ε. For filling D̄, Y has nonempty interior, so the theorem does not promise to remove a degree-one zero.|Pass|[r2]|
|Kulpa affine-grid proof input|Affine map rank1 in ℝ² has line image, empty interior; rank2 maps open triangle to open triangle and is invertible there.|Pass|[r2]|
|Subdivision data; README:569|Edge subdivided at 1/3: new vertex maps1/3; endpoints0,1; point1/2 in first subedge maps1/6. Moving subdivision vertex to2/3 changes that map to1/3.|Pass|[r2]|
|Subdivides proposition; README:581|Identity edge has a witness; two different middle placements give two data witnesses but the same existence truth value.|Pass|[r2]|
|Subdivision reflexivity; README:584|Every vertex v maps to v and every realized point to itself; on 1/3 both sides1/3.|Pass|[r2]|
|Subdivision transitivity; README:585|Subdivide first edge segment twice: normalized local coordinate1/2 then outer scale1/2 gives1/4.|Pass|[r2]|
|Composite realization map; README:586|Same nested edge: composite map and recorded composite homeomorphism both give1/4.|Pass|[r2]|
|Common refinement; README:590|Partitions {0,1/3,1} and {0,2/3,1} have common partition {0,1/3,2/3,1}; marked maps to original send shared positions identically.|Pass|[r2]|
|Stellar support; README:594–600|Single vertex starred: 1 old vertex replaced by1 new vertex, not2. Edge starred: (V,E)=(2,1)→(3,2). Triangle starred: (3,3,1)→(4,6,3).|Prior defect repaired.|[r2]|
|Stellar homeomorphism|Edge midpoint goes1/2; endpoints remain0,1; inverse is continuous on two subintervals.|Native adapter only, R05.|[r2]|
|Barycentric subdivision; README:603|Triangle has 7 vertices,12 edges,6 triangles; χ=7−12+6=1. Old vertices remain fixed.|Pass|[r2]|
|SimplicialRealizes; README:610|Equal middle placement: both sides1/3. Mismatched placement1/3 versus2/3: values unequal.|Pass; requires commutative-square Check, R12.|[r2]|
|Finite realization metric; README:616|Coordinate vertices e₁,e₂ distance√2; midpoint distances1/√2. Empty realization has no point pairs.|Consistent with Euclidean coordinate metric.|[r2]|
|IsPLMap; README:621|Identity edge is simplicial; tent map is affine on [0,1/2],[1/2,1]; x³ has nonconstant derivative on every open interval and cannot be finite-piece affine.|Pass|[r2]|
|PL map composition; README:628|Tent composed with tent is affine on4 subintervals; values at0,1/4,1/2,3/4,1 are0,1,0,1,0.|Pass|[r2]|
|Subdivision map is PL; README:631|Split edge at1/3: linear pieces slopes1/3 and2/3 in local coordinates; both affine.|Pass|[r2]|
|PL realization composition; README:632|Vertex collapse to a point: summed barycentric weights1/4+3/4=1; direct and composed maps equal same vertex.|Pass|[r2]|
|PL-homeomorphic subdivisions; README:636|Edge kink at1/3 versus2/3: insert both breakpoints; maps become simplicial on matching subdivisions. x³ is excluded by PL premise.|Pass|[r2]|
|IsCombinatorialSurface; README:646|T: triangle count1; each edge has1 incident triangle; vertex link an interval. Tetrahedron boundary: each edge2 triangles; links3-cycles.|Pass|[r2]|
|Closed combinatorial surface; README:652|Tetrahedron boundary has0 boundary edges; T has3; empty complex0.|Pass|[r2]|
|Surface nonexamples; README:686|Two triangles joined at vertex: its link2 disjoint intervals. Three triangles at edge: incidence3. Cone on theta: apex link has degree3. All fail.|Pass|[r2]|
|Circle/arc graph definitions; README:684|3-cycle degrees(2,2,2); path3vertices degrees(1,2,1); single point degree0, excluded; empty graph not connected.|Pass|[r2]|
|Surface realization charts; README:657|T vertex has half-disc link model; tetrahedron vertex full disc; pinch vertex lacks either.|Pass|[r2]|
|Realization compactness; README:659|T closed bounded coordinate simplex, compact; infinite discrete vertex complex noncompact, excluded by finiteness.|Duplicate native result R05.|[r2]|
|Boundary subcomplex; README:661|T boundary3-cycle; tetrahedron boundary subcomplex empty; Mobius triangulation has1 boundary cycle.|Pass|[r2]|
|Combinatorial-manifold equivalence; README:665|T: finite=true and vertex link1-ball=true on both intended predicates. Empty complex: finite=true and link conditions vacuous on both.|Pass|[r2]|
|Link-model explanation; README:680|T vertex link edge dimension1; filled triangle dimension2; no dimension-preserving stellar equivalence.|Fails explanation, R07.|[r2]|
|IsPLMap iff IsPLOn; README:670|Identity triangle: both true; x³ coordinate homeomorphism on square interior: both false locally. Finite support is needed for the stated global refinement proof.|Pass|[r2]|
|Open-map approximation; README:732, Lean:368|f=id, φ≡ε>0: g=f gives distance0<ε and identical source/target. Empty source makes all bounds vacuous and allows empty g.|Pass|[r2]|
|Strong positivity; README:717|φ≡ε has lower boundε/2; φ=1/(1+norm x) has positive local infimum; φ∈{1,2} has lower bound1/2 despite discontinuity.|Pass|[r2]|
|Failed merely-positive control; README:792|At irrationals φ=1, at rational p/q take1/q: arbitrarily small nearby bounds force a continuous approximant to equal f. For f(x)=x³ this would force non-PL g.|Repaired hypothesis excludes this example.|[r2]|
|Half-plane approximation; README:741, Lean:378|f=id on half-plane: g=id, error0, H mapsH and boundary line mapsitself; reflection along boundary also preservesH.|Pass|[r2]|
|Compact-surface PL approximation; README:755|Identity triangulated disc: g=id, uniform error0<ε; ε=0 would demand0<0, excluded.|Pass; source extensions uncertified.|[r2]|
|Relative PL approximation; README:763|Disc identity on boundary subcomplex: g=id agrees there, error0. Arbitrary nonlinear boundary map fails PL boundary premise.|Pass|[r2]|
|Radó finite/combinatorial; README:819|Disc admits single triangle (3,3,1); sphere tetrahedron boundary(4,6,4); empty surface empty complex.|Pass instance; deeper source uncertified.|[r2]|
|Radó IsTriangulable; README:824, Lean:398|Same3 examples give native triangulability=true. Infinite plane is triangulable but not compact; theorem does not assert compactness converse.|Valid weak consequence; strong form is separately named unavailable.|[r2]|
|Boundary components Jordan; README:827|Disc boundary1 circle; annulus2 circles; sphere0; empty0. No singleton boundary component fits surface charts.|Pass|[r2]|
|Boundary collar; README:831|Disc c(z,t)=(1−t/2)z: c(z,0)=z and injective for0≤t<1; empty boundary has unique empty map.|Local construction survives; Brown assembly imported, R05.|[r2]|
|Hauptvermutung; README:834|Two marked triangulations of disc can use comparison x↦x³ in a coordinate: comparison not PL, while an abstract PL homeomorphism exists.|Correct existential scope; no assertion own comparison map is PL.|[r2]|
|PL homeomorphism existence; README:843|T versus its barycentric subdivision: common subdivision has6 triangles; induced realization equivalence is PL both ways.|Pass|[r2]|
|Isotopy to PL; README:852|Nonlinear increasing interval map x³ is isotopic to identity via (1−t)x³+tx; derivative/order gives strict increase; product model on a disc illustrates replacement.|Pass|[r2]|
|Relative isotopy to PL; README:855|Boundary-fixed identity has constant isotopy; boundary-conjugating disc map fails fixed-boundary premise.|Pass|[r2]|
|BistellarMove; README:867|1→3 has Δ(V,E,F)=(1,3,2);2→2=(0,0,0);boundary1→2=(1,2,1). Every Δχ=0.|Pass|[r2]|
|Pachner connectivity; README:872|Tetrahedron boundary: two1→3 moves give(6,12,8); flip original shared edge gives octahedron triangulation with all6 degrees4.|Pass explicit sequence; source locator uncertified.|[r2]|
|General Euler sum; README:911|Point1; edge2−1=1; full tetrahedron4−6+4−1=1; empty sum0. Native faces exclude∅.|Pass|[r2]|
|Surface V−E+F; README:915|Sphere tetrahedron2;disc1;empty0;full3-simplex truncation would give2≠1 and is outside surface/dim≤2 premise.|Pass|[r2]|
|Euler subdivision invariance; README:919|T:1→7−12+6=1;tetrahedron boundary2→14−36+24=2. Full tetrahedron complete alternating sum15−50+60−24=1.|Pass|[r2]|
|Euler isomorphism invariance; README:920|Permuting T vertices keeps counts(3,3,1), χ1.|Pass|[r2]|
|Triangle orientation; README:924|(0,1,2),(1,2,0),(2,0,1) same cyclic class; swapping0,1 reverses it. Adjacent triangles induce opposite shared-edge directions.|Pass|[r2]|
|Combinatorial orientability; README:925|T admits2 coherent choices; tetrahedron boundary2; Mobius seam reverses sign so no coherent choice; empty complex has1 empty assignment.|Pass|[r2]|
|Orientation under subdivision; README:928|Oriented T splits into3 coherently oriented triangles; outer edges keep directions; internal edges cancel in pairs.|Pass|[r2]|
|Orientation isomorphism; README:929|Vertex swap reverses T's chosen orientation but sends the set of coherent orientations bijectively to itself:2→2.|Pass|[r2]|
|Orientation-cover construction; README:934|Each triangle has ± sheets; crossing a shared edge chooses the unique sheet giving opposite induced edge directions. Trivial gluing around Mobius core fails after1 circuit.|Construction determines nontrivial cover.|[r2]|
|Covering property; README:944|Small triangle-interior disc lifts to2 disjoint discs; a boundary half-disc lifts to2 half-discs.|Pass|[r2]|
|Cover fibre cardinality; README:947|Every base point of disc/annulus/Mobius has fibre2; empty base gives no points, statement vacuous without false nonempty assertion.|Pass|[r2]|
|Surface Euler via triangulation; README:956–958|Disc choices T/barycentric T give1=1; sphere tetra/octa give2=2; empty0.|Pass|[r2]|
|Surface orientability/invariance; README:961–963|Disc=true;Mobius=false; reflection changes choice but not existence=true.|Pass|[r2]|
|Surface orientations as comparisons; README:969|Disc has2 classes distinguished by reversal; arbitrary comparison x³ is replaced by PL map isotopic to it, same orientation sign+1.|Consistent intended quotient, exact API required.|[r2]|
|Orientation map; README:971|Disc identity acts+1, reflection acts−1, reflection² acts+1.|Pass|[r2]|
|Isotopic maps act equally; README:972|Rotation0 and rotationπ preserve orientation: signs+1,+1. Reflection sign−1 cannot be isotopic to identity.|Pass|[r2]|
|Number of orientations; README:974|Connected orientable disc/sphere:2; two disjoint discs:4;empty:1. The latter two fail connected-nonempty hypothesis.|Pass|[r2]|
|Boundary orientation; README:977|At (1,0), CCW tangent(0,1) has left normal(−1,0), toward disc. On annulus inner boundary clockwise tangent has annular region on left.|Pass|[r2]|
|Sphere/disc basic invariants; README:980|χsphere2,χdisc1;both orientable;boundary counts0,1.|Pass|[r2]|
|Orientation deck involution; README:990|(triangle,+)↔(triangle,−), no fixed sheet; two applications=id; orientation sign−1.|Pass|[r2]|
|Orientation-cover examples; README:998|Disc cover2discs χ2; sphere cover2spheres χ4;Mobius cover connected annulus χ0.|Pass|[r2]|
|Boundary lifts of orientation cover; README:990|Disc boundary1→2 circles;Mobius boundary1→2 circles even though total cover connected.|Pass|[r2]|
|Plane Schoenflies; README:1011, Lean:405|S: h=id, h(S)=S. Radius2 circle: h(z)=z/2 maps toS. Reflection can reverse parametrization.|Pass|[r2]|
|Closed-inside Schoenflies; README:1024, Lean:411|S: closure inside=D̄; identity gives D̄≃ₜD̄. Radius2: scale1/2.|Pass; name mismatch R11.|[r2]|
|Spherical Schoenflies; Lean:418|Equator complement consists of2 open hemispheres; identity realizes equator case.|Pass|[r2]|
|Prescribed extension; README:1034, Lean:424|Circle map z↦conj z extends same plane conjugation; rotationI extends z↦Iz. Identity boundary extendsid.|Pass|[r2]|
|Interior circle local flatness; README:1045, Lean:440|S in plane: near1, circle is a topological line; small neighbourhood minusS has2 components.|Pass|[r2]|
|Arc slice theorem; README:1048, Lean:446|Segment endpoint0 model half-line has1 local branch; interior1/2 has2. Translation of half-line chart places interior point away from its endpoint.|Pass|[r2]|
|Two-sided collar; README:1054|Annular core normal direction returns unchanged after1 circuit; Mobius core normal direction returns negated.|Expected distinction; predicate not defined, R08.|[r2]|
|Annulus/Mobius dichotomy; README:1062|Annular neighbourhood has2 boundary components;Mobius neighbourhood1. Both core circles locally flat.|Values right; marked neighbourhood predicates need definitions, R08.|[r2]|
|Finite-graph tameness; README:1074|Y-star has3 branches, cannot be a line with2, but is already a finite graph subcomplex. Theta graph hasdegree3 at two vertices and is tame.|Repaired non-line model; use prior triangulation.|[r2]|
|Matched-cellulation extension; README:1085|Cell diameters≤2⁻ⁿ imply two compatible nested choices differ by≤2·2⁻ⁿ→0; inverse nested construction gives unique limit.|Pass size argument; must preserve stronger accessibility inputs, R03.|[r2]|
|Epstein two-sided curves; README:1110|Parallel essential circles in annulus have class+1 and cobound annulus. Opposite parametrizations of a disc-bounding circle are homotopic in disc but not ambient-isotopic as parametrized maps.|Essential/no-disc hypothesis repairs previous issue.|[r2]|
|Epstein one-sided; README:1115|Mobius core has reversing normal monodromy−1; annulus core+1 fails premise.|Pass|[r2]|
|Epstein proper arcs; README:1120|Disc diameter with fixed endpoints: identity isotopy fixesendpoints; swapped parametrization sends−1 to1 and fails rel-endpoint homotopy.|Pass|[r2]|
|Oriented disc-bounding curves; README:1124|Two concentric circles traversed CCW have sign+1,+1; reversing one gives+1,−1 and is excluded.|Pass|[r2]|
|Based Epstein; README:1134|Disc trivial π₁ permits both orientations of null loop; excluded disc avoids that counterexample. Mobius is separately excluded.|Hypotheses consistent with source; no classification substitute.|[r2]|
|PLStructure; README:1152|T realization→disc is data; composing it with nonlinear disc homeomorphism changes marked structure, even though underlying disc same.|Consistent; API/Checks R12.|[r2]|
|PL representative; README:1160|Identity between differently marked disc triangulations can be non-PL in coordinates; an isotopic PL representative has same orientation+1.|Pass|[r2]|
|Closed Epstein; README:1169, Lean:457|S² identity/rotationπ homotopic and isotopic via rotations; reflection has degree−1 versus+1 and fails homotopy premise. Empty case has unique map/isotopy.|Pass|[r2]|
|Relative Epstein; README:1171|Disc id/conjugation: unrestricted homotopy exists, boundary values atI differ, so HomotopicRel=false; id/id has constant relative isotopy.|Headline statable, R06.|[r2]|
|PL isotopy injection; README:1174|PL rotation on a polygonal annulus admits jointly PL isotopy after triangulating time-space; arbitrary nonsmooth time change need not be jointlyPL.|Exact predicate missing, R08.|[r2]|
|Topological iff PL homeomorphism; README:1179|T and barycentric T: both Nonempty=true; sphere vsdisc: bothfalse since boundary counts0≠1.|Both directions tested.|[r2]|
|Chart bridge; README:1186|T induces half-plane charts; tetrahedron sphere full-plane local models.|Existing dimension-general owner, R04.|[r2]|
|Smooth compatibility; README:1200|One triangle at boundary corner has2 independent edge tangents mapped into1 boundary tangent line, rank≤1; subdivision separates boundary edges among small triangles.|Repair to subdivision-based condition passes the obstruction.|[r2]|
|Smoothing atlas; README:1203|Disc standard smooth half-plane atlas gives dimension2; empty surface admits empty atlas. Sphere cannot have a smooth PL (locally affine) atlas developing into open compact subsetℝ².|Intended compatibility avoids affine-atlas mistake; source unverified.|[r2]|
|Smoothing manifold law; README:1205|Standard disc transitions smooth, chart differential rank2 on tangent model; constant chart rank0 is not a chart/homeomorphism.|Signature intent consistent.|[r2]|
|Smoothing compatibility law; README:1206|Subdivided triangle compatible pieces have rank2; original corner piece rank≤1 would fail.|Pass|[r2]|
|Smoothing uniqueness; README:1207|Equal σ=τ:φ=id,degree+1; orientation-reversing diffeo hasdegree−1 and cannot witness isotopy-to-id.|Pass on equality and wrong witness; source uncertified.|[r2]|
|Diffeomorphism representative; README:1216|Smooth disc rotation already a diffeomorphism, constant isotopy; nonlinear topological map must be replaced, not asserted smooth.|Intended scope coherent; source uncertified.|[r2]|
|Relative diffeomorphism representative; README:1219|Boundary-fixed id givesφ=id, restrictionsid; conjugation differs atI and fails EqOn premise.|Pass instance; relative source not certified.|[r2]|
|Smooth isotopy comparison; README:1225|Rotations with smooth angle t give joint smoothness; angle abs(t−1/2) has smooth slices but not joint smoothness at1/2.|R08 must specify which predicate.|[r2]|
|Relative simplicial approximation; README:1233|Identity triangulated interval/disc fixes prescribed boundary; non-PL boundary data would preclude exact relative simplicial matching.|Intended PL-boundary hypothesis discriminates.|[r2]|
|Nullhomotopic simple PL loop bounds disc; README:1233|Triangle in plane bounds filled T; essential annulus core has winding1 and is not nullhomotopic.|Pass|[r2]|
|Homotopic essential loops cobound annulus; README:1233|Disjoint concentric circles, same orientation, give S¹×[0,1]; opposite parametrizations have winding+1/−1 and fail essential homotopy premise.|Pass|[r2]|
|Bigon reduction; README:1233|A removable bigon has2 transverse intersection corners; pushing across removes2, reducing finite count N toN−2 with N≥2.|Pass|[r2]|
|Cutting-system route; README:1234|Disc remainder boundary-fixed map has Alexander isotopy; annulus twist needs relative winding class0 before such an isotopy.|Base cases must retain relative homotopy; not replaced by unrestricted contractibility.|[r2]|

### Headline coverage and source sample

README:11–52's end theorems are Jordan/crosscut/frontier accessibility and invariance of domain; compact Radó; Hauptvermutung/Pachner; Euler/orientation/boundary invariants; polygonal, planar, closed-inside, spherical and prescribed-boundary Schoenflies; automatic tameness; PL/smooth comparison and Epstein. The acceptance file includes the planar separation group, local approximation, native weak triangulability, the four Schoenflies forms, circle/arc tameness and closed Epstein. Its docstring names the absent combinatorial subdivision/orientation/PL/smoothing infrastructure. Boundary-relative Epstein is already statable and missing (R06). General finite-graph tameness should be named explicitly among the omitted triangulation-dependent headlines. Existing-owner headlines must be removed under R04, not expanded.

The unchanged seeded sample (all 15 heading labels across nine layers) is inherited from [the previous review][r2]. Its source reads cover Thomassen and the blueprint for polygonal separation, accessibility, crosscuts and Schoenflies; Kulpa for zero avoidance and invariance of domain; Epstein for curve/homeomorphism isotopy; and the native interfaces for each From list. The inherited source table records thomassen1992 lines 143–188,263–311,338–430; thomassen_blueprint lines 178,251–278,293,361–377,729,786–844; kulpa1998 lines 44–47,68–94,210–236; and epstein1966 lines 61–63,109–115,145–153,214–234,533–610,725–790. No sampled passage or locator changed; the unreadable-text limitations below remain. The changed passages are solely reversions of three neighbouring READMEs, and introduce no new source claim.

The previous review also tested this source error against the printed p.101 image, not just OCR; its row is carried forward:

|Source statement|Instance and computed values|Result / change|
|---|---|---|
|Epstein Theorem6.4(a), absolute homotopy on surfaces with compact boundary components|Disc reflection z↦conj z is homotopic to id by H(t,z)=(1−t)z+t·conj z. Orientation signs are +1 and−1, so no embedding isotopy joins them.|Printed exception list omits the disc. Add the disc to its orientation-preserving exceptions; roadmap's closed/relative restrictions avoid this error. [Previous review][r2].|

## Not verifiable

The following limitations are carried from [the previous review][r2]; no inaccessible text is represented as newly verified. No mathematical source locator changed.

- **moise** (1977), §5 pp.42–45, §6 Theorems6.2–6.4 pp.46–50, §8 Theorems8.2–8.5 pp.58–64: the service reached the Springer paywall and recorded uncertified. Local approximation, Radó/Hauptvermutung and their relative extensions are not source-certified here.
- **rourke_sanderson**, chapters1–3: Springer access is paywalled; uncertified. **pachner1990**, pp.37–47, DOI10.1016/0012-365X(90)90178-K: Elsevier paywall; uncertified. No invented theorem numbers.
- **newman**: service bibliographic lookup produced no readable legal text. **munkres_differential**: lookup reached JSTOR2315380, a review rather than the book, so it does not certify the book's contents.
- **whitehead1940**, DOI10.2307/1968861; **munkres1960**, DOI10.2307/1970228: JSTOR landing pages, no open full texts obtained. **kuiper1965**, DOI10.1515/9781400874842-002: publisher landing page, no readable open chapter. Compatible smoothing, uniqueness and relative/smooth-isotopy claims remain uncertified.
- **cannon**, Topology as Fluid Geometry, volume2: AMS landing page DOI10.1090/mbk/109 yielded no readable text; no exact locator supports the pathology/prospectus claims here.
- **jordan-pick** provenance: the service followed a linked Hales PDF rather than retrieving the repository documentation; its advertised proof content was not certified. The fetched classification and Schoenflies repository pages advertise Apache licensing, and the latter a CC-BY blueprint; these are not evidence that their code ports to the pinned libraries. No external code was run.
- The previous review consolidated missing-source requests under the existing keys. This incremental review makes no new request and does not re-request paywalled works previously recorded as uncertified. These limitations do not suspend the review or erase the witnessed findings.

## Source issues

Carried forward from the previous review; no additional source issue was found in the unchanged passages.

- **Error** in epstein1966 at Theorem 6.4(a), printed p.101: the source says absolute homotopy implies isotopy without an orientation exception for the disc; it should be an orientation-preserving assumption also on the disc; affects a stated result.
- **Misprint** in blokh_laminations at arXiv:1401.5123v3, §1.2, printed p.5: the source says the filled combinatorial Mandelbrot model equals the circle quotient; it should be the closed-disc quotient, with the circle quotient its boundary; affects a stated result.

[r2]: PRREVIEW-PlanarTopology~2.md
