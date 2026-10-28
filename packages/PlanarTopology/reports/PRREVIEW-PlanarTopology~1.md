# Review of PlanarTopology (pull request #271 at 238d5da)

**Verdict:** needs changes

:robot: Independent AI review of `TauCetiRoadmap/PlanarTopology/` only. There are 20 findings, including 12 blocking findings. The roadmap has repairable mathematical, ownership, and acceptance-test defects. No PR files were changed.

## R01 (P1) — Break the supply cycle with GeometricTopology

**Location:** `TauCetiRoadmap/PlanarTopology/README.md:51–65`, consuming GeometricTopology Layers 1, 2 and 11; lines 39–41 make that roadmap a consumer.

**Claim:** GeometricTopology can supply this roadmap while consuming its dimension-two results.

**Witness:** The dependency check reports `CYCLE among: GeometricTopology, PlanarTopology`. `TauCetiRoadmap/GeometricTopology/README.md:856` explicitly sends Radó to PlanarTopology; PlanarTopology's supplier table sends its foundations back to GeometricTopology.

**Repair:** Cite implemented prerequisites directly at their pinned Tau Ceti modules. Import the remaining generic foundations from GeometricTopology on main; put consumption of the new dimension-two results in a later GeometricTopology Part II. Remove the reverse edge from the earlier roadmap. Re-run the check: both edges cannot remain. Merely moving PlanarTopology in the order does not break this cycle.

## R02 (P1) — A singleton stellar subdivision cannot retain all old vertices

**Location:** `TauCetiRoadmap/PlanarTopology/README.md:474–478`: “read back as a complex on `Option ι`”.

**Claim:** Every stellar subdivision at a face gives an `AbstractSimplicialComplex (Option ι)` in the specified construction.

**Witness:** Start with the one-vertex complex and star its singleton. Only `{none}` survives; `{some v}` does not. Mathlib `AbstractSimplicialComplex.singleton_mem` requires both. Restoring the old singleton gives two isolated points instead of one.

**Repair:** Reindex the stellar result by its actual vertex support, or retain `PreAbstractSimplicialComplex` throughout and realize its support. Do not exclude singleton faces merely to preserve `Option ι`. The repaired singleton example must have one vertex and realization a point. Pinned witnesses: `Mathlib/AlgebraicTopology/SimplicialComplex/Basic.lean:154–157`; `TauCeti/AlgebraicTopology/SimplicialComplex/Subdivision/Stellar/Basic.lean:186`.

## R03 (P1) — Remove six admitted data definitions

**Location:** `TauCetiRoadmap/PlanarTopology/Suggested.lean:62,79,93,149,182,187`.

**Claim:** Half-space charts, disc charts, coning, a chain carrier, parity and winding have usable definitions.

**Witness:** Each of the six bodies is `sorry`. The gate reports `sorry-data=6`. In particular, the radius assertion at line 101 constrains an admitted homeomorphism, not a defined radial extension.

**Repair:** Import the disc charts (R06). Delete heavy constructions and dependent assertions from this acceptance file; describe unavailable headline carriers in its module docstring. Give real bodies only to simple definitions actually needed by retained headlines. Recheck that all six admissions disappear and no retained theorem mentions admitted data. At dimension zero a genuine radial extension must be the unique map on a point, with radius `0 = 0`.

## R04 (P1) — Put the crosscut and orientation-cover prerequisites before their consumers

**Location:** `TauCetiRoadmap/PlanarTopology/README.md:379,774,863`.

**Claim:** Layer 2's crosscut theorem and Layer 6's isotopy-invariance argument have their stated prerequisites.

**Witness:** `IsCrosscut` is scheduled at line 863 in Layer 7, which consumes Layer 2. Line 774 uses the orientation double cover and isotopy lifting without a target constructing that cover or a supplier contract.

**Repair:** Define interior crosscuts and accessibility in Layer 2 before their theorems, including distinct endpoints and interior containment. Add the simplicial orientation-cover construction, covering theorem and orientation transport in Layer 6 before the isotopy argument; cite the precise existing lifting theorem. On a disc the cover has two components; on a Möbius band it is connected with two points over each base point. These tests distinguish it from a trivial product cover. A smooth orientation cover from DifferentialGeometry cannot simply be used before this roadmap constructs smooth structures.

## R05 (P2) — Restore the hypotheses of Epstein's curve-isotopy input

**Location:** `TauCetiRoadmap/PlanarTopology/README.md:968`: “homotopic simple closed curves are isotopic, in Epstein's piecewise-linear form”.

**Claim:** The curve-straightening input applies to arbitrary homotopic parametrized simple closed curves.

**Witness:** In the plane, `f(z)=z` and `g(z)=conj z` on the unit circle are null-homotopic, but their winding numbers are `+1` and `−1`; an isotopy of embeddings cannot interchange them. Epstein explicitly excludes this case.

**Repair:** Name the essential two-sided theorem (Epstein Theorem 2.1, printed p. 86), the one-sided theorem (3.3, pp. 90–91), and the properly embedded arc theorem (3.1, p. 89). Handle disc-bounding curves with their orientation condition and Alexander's trick. The negative control above must fail the two-sided theorem's non-disc-bounding hypothesis. The homeomorphism headline need not be weakened. Source: `epstein` lines 109–115, 214–217, 229–234.

## R06 (P2) — Import the existing closed-ball charts and boundary theorem

**Location:** `TauCetiRoadmap/PlanarTopology/README.md:118,188–190`; `TauCetiRoadmap/PlanarTopology/Suggested.lean:79–88`.

**Claim:** The closed complex disc needs a new half-space charted-space construction here.

**Witness:** Pinned `TauCeti/Geometry/Manifold/Instances/ClosedBall.lean:237` defines `instChartedSpaceClosedBall`; line 320 proves `boundary_closedBall`. They cover real inner-product spaces of positive finite dimension, including `ℂ` in dimension two.

**Repair:** Import that module, instantiate its dimension equality, and cite its chart and boundary API in the supplier contracts. Delete the duplicate construction and boundary target. For `0` the norm is `0 < 1`, so it is interior; for `1` the norm is `1`, so it is boundary, exactly as the existing API states.

## R07 (P2) — Import the targets already owned by existing roadmaps

**Location:** `TauCetiRoadmap/PlanarTopology/README.md:393–398,483–488,919–922`.

**Claim:** This roadmap owns no-retraction/Brouwer, realization of simplicial maps, and the combinatorial-to-chart PL bridge.

**Witness:** On main, `TauCetiRoadmap/DifferentialGeometry/README.md:890–894` owns no-retraction and Brouwer. `TauCetiRoadmap/GeometricTopology/README.md:853–858,893–896` owns realized simplicial maps and the general PL reconciliation. A dimension-two specialization does not change ownership.

**Repair:** Delete these as new targets and import those exact sections in the scope and supplier contracts. Keep only a genuinely additional surface-specific compatibility result, saying how it differs. Apply Brouwer to a half-turn of the disc (`Fix={0}`), the realization functor to the identity edge map (`t↦t`), and the general bridge to a triangulated disc. These are specializations, not separate foundations to rebuild. R01 controls the direction of supply.

## R08 (P2) — Simple connectivity is already available from the Layer 2 output

**Location:** `TauCetiRoadmap/PlanarTopology/README.md:859,1009–1012`: simple connectivity is said to be available “only after Schoenflies”.

**Claim:** A Jordan-domain result from Layer 2 is insufficient until Layer 7 independently proves simple connectivity.

**Witness:** `TauCeti/Analysis/Complex/Conformal/Jordan/Domain.lean:226` already proves `TauCeti.IsJordanDomain.isSimplyConnected`, with the sole hypothesis `IsJordanDomain U`.

**Repair:** Cite and apply this declaration to Layer 2's Jordan-domain theorem. Correct the consumer table and remove the claimed obstruction to the Carathéodory route. Keeping a separate topological Schoenflies route is legitimate, but this is not a missing prerequisite. On the unit disc, the domain predicate gives simple connectivity immediately, before any Schoenflies assertion.

## R09 (P2) — State the missing headline theorems that already elaborate

**Location:** `TauCetiRoadmap/PlanarTopology/README.md:20–23,803,904`; `TauCetiRoadmap/PlanarTopology/Suggested.lean:498–521`.

**Claim:** The unstated headlines need unavailable vocabulary.

**Witness:** Scratch signatures for spherical Schoenflies, extension of a prescribed homeomorphism between Jordan curves, and closed-surface Epstein all elaborated at these pins, with only `sorry` warnings. They use native spheres, homeomorphisms, continuous homotopy and `TauCeti.Isotopic`.

**Repair:** Add named theorem statements for all three. The relative Schoenflies conclusion must prescribe the restriction pointwise, not merely send one carrier onto another; on the circle, test both identity and conjugation. Name each genuinely unstatable remaining headline and its missing carrier in the module docstring. Replace the current long commented API catalogue with that explanation. Polygonal Schoenflies also needs only the existing polygon carrier, native `IsPLOn`, and an explicit triangle boundary; do not defer it merely for lack of a preferred triangle name.

## R10 (P2) — Specify the local and relative approximation hypotheses

**Location:** `TauCetiRoadmap/PlanarTopology/README.md:582–601`.

**Claim:** `StronglyPositive φ` and the relative approximation signature specify an implementable theorem.

**Witness:** No definition of `StronglyPositive` is given. Positive everywhere is insufficient: on a compact square, a positive function with infimum zero in every neighbourhood forces any continuous approximation within it to equal the original non-PL homeomorphism.

**Repair:** State a locally positive lower bound explicitly: for every `x`, some neighbourhood of `x` has a uniform bound `0 < c ≤ φ`. Give the open-plane/half-plane carriers and boundary-preservation conditions precisely. Repeat `hK`, `hL`, and the homeomorphism binder in the relative statement; earlier theorem binders do not scope over it. For the negative control use `f(x,y)=(x³,y)` on the square and `φ=1/q` at reduced rational first coordinate `p/q`, `φ=1` at irrational first coordinate. The repaired hypothesis excludes it; constant `φ=ε>0` passes.

## R11 (P2) — Resolve crossing parity at a horizontal run

**Location:** `TauCetiRoadmap/PlanarTopology/README.md:330`.

**Claim:** The stated vertex rule and “a segment lying along the ray counts as its two endpoints do” define parity for every polygon.

**Witness:** For vertices `(0,−1),(1,0),(2,0),(3,1),(−2,1),(−2,−1)` and `q=(0,0)`, each horizontal-run endpoint has one horizontal incident side: neither stated same-side nor opposite-side case applies. The correct parity is `1`.

**Repair:** Give a complete half-open edge rule: ignore horizontal edges, orient each other edge upwards, and count `a_y ≤ q_y < b_y` when its intersection lies to the right. Specify values on the carrier if the function remains total. On this polygon the count is `1` at heights `−1/10,0,1/10`, with ray intersections `9/10,2,21/10`. This also preserves the twice-traversed triangle's parity `0`. The blueprint avoids horizontal edges by rotating first; that is a different convention requiring an invariance bridge (`blueprint` lines 251–266).

## R12 (P2) — Distinguish graph tameness from local flatness

**Location:** `TauCetiRoadmap/PlanarTopology/README.md:40`: “local flatness is automatic for simple closed curves and finite graphs in a surface”.

**Claim:** Every embedded finite graph is locally flat as a one-dimensional submanifold.

**Witness:** A planar Y graph has three branches at its central vertex. A coordinate-line slice has two. No neighbourhood homeomorphism identifies the two pointed pairs; the pinned `IsLocallyFlat` predicate uses precisely a coordinate-line slice.

**Repair:** Promise tameness for finite graphs, with the finite-star local model at vertices, and reserve local flatness for circle embeddings and interior points of arcs. The theorem at line 845 already has the appropriate graph conclusion. The Y remains a positive tameness test and becomes a negative local-flatness test.

## R13 (P3) — Attach exact source locators to the claims

**Location:** `TauCetiRoadmap/PlanarTopology/README.md:1080–1105` and the layer statement blocks.

**Claim:** The bibliography makes the individual targets source-verifiable.

**Witness:** Moise is cited as chapters 1–9; Munkres and Whitehead lack theorem/section/page locators. No theorem locator accompanies the local approximation, Pachner, smoothing, or relative smoothing targets. The seeded headings contain no target-specific locators.

**Repair:** Put a theorem or section and printed page beside each target and proof input; distinguish original contributions from cited results. For the readable sample, use the exact blueprint and Epstein locators recorded below. In particular blueprint Theorem 6.2 assumes a polygonal crosscut; an arbitrary-arc version needs its own proof input, not an unqualified citation to that theorem. Paraphrase the quoted Moise phrase rather than copying it. Unreadable texts are listed below without guessed locators.

## R14 (P3) — Supply actual APIs and discriminating Checks for each definition

**Location:** `TauCetiRoadmap/PlanarTopology/README.md:252,336,568,610,778,972`.

**Claim:** Promises of later examples provide the required definition tests.

**Witness:** The non-convex parity example names no vertices or point; the approximation example names no map or error; `Subdivision`, `PLStructure`, `Orientation`, `IsArc`, and relative isotopy do not each have three concrete Checks and an API list.

**Repair:** Add per-definition API bullets and at least three computed Checks. Include the horizontal-run polygon (R11), singleton stellar move (R02), midpoint placements `1/3` versus `2/3`, and the disc/Möbius orientation-cover distinction (R04). State the numerical or logical outcome, rather than promising an example will be exhibited. Preserve the useful twice-traversed triangle and pinch-point controls.

## R15 (P3) — Replace all admitted examples with proper headline statements or remove them

**Location:** `TauCetiRoadmap/PlanarTopology/Suggested.lean:73–478`.

**Claim:** Anonymous `example ... := by sorry` declarations are acceptance tests.

**Witness:** The gate reports 23 admitted examples: lines 73, 84, 101, 109, 113, 118, 173, 177, 195, 230, 237, 242, 248, 254, 259, 269, 277, 365, 446, 452, 459, 469, 475.

**Repair:** Give retained deep headline theorems names matching the README and keep their honest `sorry` proofs. Delete padding under R16 and duplicate targets under R06–R08. Leave no admitted `example`. This changes the declaration form, not its mathematical hypotheses.

## R16 (P3) — Delete the boundary and radius checks from Suggested.lean

**Location:** `TauCetiRoadmap/PlanarTopology/Suggested.lean:73–106`.

**Claim:** The transported empty boundary, disc boundary, and coning radius checks belong in the headline acceptance file.

**Witness:** These are precisely the Layer 0 boundary/transport and radial-construction API checks, not end theorems. The disc boundary is also a pinned library theorem (R06). The corresponding values are `∅`, `S¹`, and `r=r`.

**Repair:** Delete these three assertions from `Suggested.lean`; keep their mathematics as README API/Checks. Do not prove them in place. The one-tactic probe on all 23 proposition admissions found no closures by `simp`, `rfl`, or `infer_instance`; this finding follows from their Check/API role, not a claimed successful tactic on the admitted chart definitions.

## R17 (P3) — Remove empty Lean layer sections

**Location:** `TauCetiRoadmap/PlanarTopology/Suggested.lean:289,351,401,496`.

**Claim:** These layer sections contain target declarations.

**Witness:** The gate finds four empty sections: Layers 3, 4, 6 and 8. Their apparent declarations are inside block comments, so Lean declares none of them.

**Repair:** Remove empty section headings and move concise unavailable-carrier explanations to the module docstring. Add the genuinely statable headlines from R09; do not fill sections with padding to satisfy the scanner.

## R18 (P3) — Remove the LaTeX delimiters

**Location:** `TauCetiRoadmap/PlanarTopology/README.md:422`: `$C^0$`.

**Claim:** The prose follows the Unicode mathematics rule.

**Witness:** The gate reports two LaTeX delimiter hits on this line.

**Repair:** Write `C⁰` without dollar delimiters. Both hits then disappear.

## R19 (P3) — Rename the dependency-diagram heading

**Location:** `TauCetiRoadmap/PlanarTopology/README.md:136`: `## Layer Dependency Chart`.

**Claim:** This is a valid layer heading.

**Witness:** The gate reads `Layer Dependency Chart` as a malformed layer identifier and reports `layer-ids=1`.

**Repair:** Put the diagram under `## How to read the build` or another heading not beginning with `Layer`. Keep numbered layer headings in the `Layer N: title` form.

## R20 (P3) — Use the required roadmap structure and per-target dependencies

**Location:** `TauCetiRoadmap/PlanarTopology/README.md:1,32,84,162` and all nine layers.

**Claim:** The current representative-signature blocks are a complete roadmap specification.

**Witness:** There is no opening `**Summary.**`, `## Scope and ownership`, `## Exact supplier contracts`, or `*Needs:*` line. Layers lack numbered prose subsections and closing `### Examples` / `### Dependencies` sections.

**Repair:** Reshape the existing material into the required prose sections, with exact supplier contracts and dependencies per target. Keep full general definitions and APIs in the README; reserve Lean for headlines. For example, boundary invariance needs Layer 2 invariance of domain, while the polygonal parity identity does not; a single broad layer prerequisite list cannot express that distinction.

## Verified sound

The evidence below records successful checks and failures separately; example calculations are not proofs of the general theorems.

### Gate, build, signatures and scope

- Confirmed head `238d5dac9206bdb37cd0fb9cacbd964fee55b2df`. The worktree was clean before and after review. The prescribed diff excluding all five PR-owned folders had no output; there are no outside-folder findings.
- Read the root README's normative writing checklist and CONTRIBUTING. The literal parent-relative paths were absent in this worktree; the repository-root files were used. Read the main-branch AlgebraicTopology and ConformalMapping roadmaps for comparison.
- The worker's gate **fails**: `latex=2`, `sorry-data=6`, `sorry-examples=23`, `empty-sections=4`, `layer-ids=1`, `depcheck=2`; all other reported counters, including build and outside-folder, are zero. All actionable failures are covered above. The absence from the order is expressly not a finding.
- Built the six directly imported Tau Ceti modules successfully, then ran the required direct `lake env lean` elaboration of `Suggested.lean`: exit 0, only the 29 expected `sorry` warnings (six data admissions and 23 proposition admissions).
- In a scratch copy, named the 23 anonymous examples solely to inspect them and ran `#check @name` for all **40 authored declarations** (17 definitions/structures plus 23 propositions). All elaborated. No hidden loss of a needed section variable was found in the compiled targets. The boundary-invariance and tameness declarations retain `T2Space`; Radó retains compactness; no-retraction and Brouwer use the closed unit disc. Compactness is intentionally absent from `boundaryComponentCount`, whose infinite-component junk value is discussed in the table.
- Probed all 23 proposition admissions with single-tactic alternatives `simp`, `rfl`, and `infer_instance`; none closed. Exact-lemma inspection found the existing disc-boundary theorem, but the submitted arbitrary admitted chart structure prevents treating it as a proof of that submitted declaration. Three missing-headline scratch signatures (R09) elaborated with only `sorry` warnings.

Dependency-check output (verbatim, no files changed):

```text
NOT IN ORDER: PlanarTopology (insert it after its last supplier)
CYCLE among: GeometricTopology, PlanarTopology
depcheck: 163 roadmaps, 1174 edges, 2 problem(s)
```

### Headline coverage

The README's six summit groups expand to Jordan separation/frontier/accessibility and crosscuts; Brouwer and planar invariance of domain; Radó; Hauptvermutung and Pachner; Euler characteristic, orientability, chosen orientations and boundary count; polygonal/planar/spherical/relative Schoenflies and arc/curve/graph tameness; PL/smooth structure existence and uniqueness, map/isotopy comparisons, and Epstein.

The compiled file states anonymous versions of Jordan component count, inside connectedness and closure inclusion, Brouwer/no-retraction, invariance of domain, boundary invariance/count, weak Radó, planar and closed-inside Schoenflies, inside simple connectivity, and arc/curve tameness. Its comments explain missing subdivision/combinatorial/PL carriers, but do not excuse the native statements in R09. General crosscut/frontier/accessibility statements also admit simple native predicate formulations once their precise definitions are supplied; they must not be replaced by component count. The weak Radó statement is meaningful, but does not test the stronger finite combinatorial boundary-compatible conclusion.

### Adversarial table

`D` is the open unit disc, `B` its closure, `S=∂D`, `T` a filled triangle and `∂T` its boundary. `E` is one simplicial edge; `K₄` is the tetrahedral sphere. A result marked “specification gap” reports the competing concrete outcomes rather than certifying an undefined predicate. The table has **151 rows**, covering the displayed targets, definitions and extra convention controls. All numerical calculations are independent of the admitted Lean bodies.

| Statement / convention (README line) | Instances tried | Values on the two sides / discriminating output | Result; change |
|---|---|---|---|
| Surface conventions (110–120) | empty, disc, sphere | empty: χ=0, orientations=1, boundary components=0; disc: 1,2,1; sphere: 2,2,0 | Consistent; compact connectedness excludes empty |
| `planeEquiv` (168) | 0,1,i | images (0,0),(1,0),(0,1); norms 0,1,1 on both sides | Pass |
| `perp` (171) | 1,i | i,−1; opposite rotation gives −i,1 | Pass; explicit sign Check needed |
| `det` (172) | (1,i),(i,1),(0,i) | 1,−1,0; reversed convention negates first two | Pass |
| determinant/inner identity (174) | (1,i),(i,1) | 1=1, −1=−1 | Pass |
| lower sup-norm bound (175) | (0,0),(3,4) | 0≤0, 4≤5 | Pass |
| upper sup-norm bound (176) | (1,1),(3,4) | √2=√2, 5≤4√2 | Pass |
| half-space charts (180) | plane mapped into positive half-space | boundary empty; identity-to-closed-half-space model would have nonempty boundary | Requires real construction; R03 |
| `ofBoundaryless` (181) | plane, sphere | transported chart images have first coordinate >0; boundary membership false | Pass intended construction |
| empty transported boundary (184) | plane, sphere | ∅=∅ twice | README Check; R16 |
| closed-disc chart (188) | 0,1 | first is interior, second boundary; plane model would incorrectly make both interior | Existing construction; R06 |
| disc boundary (189) | 0,1 | false=false, true=true for membership in preimage S | Existing theorem; R06/R16 |
| relative isotopy (193) | interval id versus reversal, A={0,1} | endpoint values (0,1) versus (1,0); relative relation false, id/id true | Definition/API needed; R14 |
| `IsArc` (199) | [0,1], point, circle | true,false,false | Pass native definition |
| `endpoints` (200) | [0,1], singleton | {0,1}, singleton (empty deletion is preconnected) | Pass; arc hypothesis matters |
| endpoint cardinality (201) | [0,1], singleton negative control | 2=2; singleton gives 1≠2 but is not an arc | Pass |
| endpoint image (202) | id and reversal of [0,1] | {0,1}={0,1} in both directions | Pass |
| radial extension (208) | dimensions 0,1; h=id or endpoint swap | point→point; interval map x→x or −x | Intended object determined only after real body; R03 |
| radius identity (213) | x=0, x=1/2 under −id | 0=0, 1/2=1/2 | API padding; R16 |
| sphere restriction (214) | dimension 1, swap | F(−1)=1=h(−1), F(1)=−1=h(1) | Pass intended cone |
| Alexander relative isotopy (217) | interval endpoint-fixing map x↦x³; dimension 0 | interpolation fixes ±1 and has positive order; point has only id | Pass tests |
| PL coning (225) | circle quarter-turn; polygon edge map | F(z)=iz, affine pieces=1; coning affine boundary pieces yields affine triangle pieces | Pass basic controls; exact PL sphere contract needs formulation |
| space-filling curve (229) | surjection to B versus constant | image area π versus 0; constant image misses 1 | Nontrivial existence; source not certified |
| nonrectifiable Jordan curve (233) | Koch approximants; round circle | perimeter 3(4/3)^n→∞ versus 2π | Intended distinction; existence source not certified |
| positive-area Jordan curve (237) | round circle versus Osgood target | circle area 0 fails `0<area`; Osgood must have area>0 | Existence source not certified; no guessed area |
| polygonal chain (268) | [],[a],[a,b] | nonempty-list predicate false,true,true | Pass carrier admission unresolved |
| polygonal loop (273) | [a],[a,b],[0,1,i] | lengths 1,2,3; only last simple | Pass |
| chain carrier (277) | [0,1,i], [0] | first gives two segments; singleton union-of-consecutive-segments gives ∅, point convention gives {0} | Specify singleton convention; R14 |
| loop side (279) | [0,1,i], last index | last side [i,0]; first side [0,1] | Closing edge included |
| loop carrier (281) | [a], [0,1,i] | {a}, ∂T | Pass |
| simplicity (286) | triangle, twice-traversed triangle, collinear triple | true,false,false; repeated triangle still has same carrier | Pass; controls discriminate presentation |
| simple carrier is Jordan (291) | triangle; figure-eight negative control | S¹-type=true; figure-eight has complement count3 and is not simple | Pass tests |
| simple renormalization (293) | twice-traversed triangle | Q has 3 vertices versus P's6; carriers equal ∂T | Pass tests |
| crossing parity (295) | triangle inside/outside; double traversal | 1/0; doubled gives0/0 | R11 for horizontal run |
| integer winding (296) | oriented triangle, reverse, double traversal | +1,−1,+2 inside; all0 outside | Sign/API not specified in body; R03/R14 |
| parity local constancy (298) | R11 polygon heights −.1,0,.1 | correct values 1,1,1; stated horizontal case has no value | Specification gap; R11 |
| `IsPLHomeomorph` (Lean190) | plane id; inverse of piecewise-affine homeomorphism | id has1 affine piece in both directions; a nonlinear radial map fails the PL condition | Correct simple predicate, but unused by compiled headlines; R09/R20 |
| polygonal Jordan (302) | triangle, figure-eight | 2=2; negative control3≠2 | Pass with simplicity |
| polygonal crosscut parity (306) | square split by vertical chord | left point:1=1+0; right:1=0+1; outside:0=0+0 in Z/2 | Pass tests |
| ears (311) | square, triangle | square has4 candidate ears; triangle has3 vertices so `3<n` false | Correct positive/negative control; advertised two-ear theorem stronger than signature |
| polygonal Schoenflies (315) | standard triangle | h=id; image ∂T=∂T; affine pieces1 | Statable; R09 |
| polygonal drawing (320) | triangle graph; crossing edge interiors | valid3-edge drawing; crossing has extra intersection not an endpoint | Intended predicate discriminates; complete API needed |
| K₃,₃ nonplanarity (323) | K₃,₃ versus K₂,₃ | V=6,E=9 violates planar bipartite bound9≤8; K₂,₃ has6≤6 | Sanity check only; blueprint gives non-Euler route |
| inside (359) | S, empty set | D,∅; filled hull(S)=B | Pass |
| outside (360) | S, empty set | {norm>1},ℂ | Pass |
| inside connectedness (362) | S; empty non-Jordan control | true; empty isConnected=false | Jordan hypothesis necessary |
| outside connectedness (363) | S | any two exterior points connected around S; components1 | Pass |
| inside boundedness (364) | S | norm<1 gives bound1 | Pass |
| outside unboundedness (365) | S | n+2 lies outside for every natural n; no bound | Pass |
| inside frontier (366) | S | frontier D=S, both inclusions | Pass |
| outside frontier (367) | S | frontier {norm>1}=S, both inclusions | Pass |
| subset of inside closure (370) | p∈S | (1−1/n)p→p, radii<1; p∈closure D | Pass |
| Jordan-domain inside (373) | S; radius-zero circle | D has four required fields; singleton is not Jordan | Pass; native simply-connected consequence R08 |
| accessibility density (376) | S | all p have radial access; closure accessible=S | Predicate must be specified; R04 |
| crosscut (379) | chord x=1/2 in D; boundary arc negative control | cap and remainder nonempty/disjoint, union D\P; boundary arc removes no inside points | R04; arbitrary/polygonal source distinction recorded |
| Jordan component count (385) | S; singleton | 2=2; singleton complement1≠2, excluded | Pass |
| arc nonseparation (389) | [0,1]⊂ℂ; S negative control | complement components1 versus2 | Pass |
| no retraction (393) | identity boundary loop and constant loop | winding1 versus0 would be equated | Sound obstruction; owned elsewhere R07 |
| Brouwer (398) | id, half-turn, constant a | Fix=B,{0},{a}, all nonempty | Sound tests; R07 |
| invariance of domain (401) | open disc inclusion; empty U; closed-disc inclusion | range D open; ∅ open; B not open when hU absent | Pass hypotheses |
| image of boundary (408) | disc conjugation; sphere id | S maps to S; ∅ to∅ | Pass |
| boundary count (411) | disc,sphere,annulus,countable disjoint discs | 1,0,2,0 (`Nat.card` infinite junk) | Last is not a literal infinite count; compact consumers safe |
| boundary count invariance (414) | conjugation on disc; annulus flip | 1=1,2=2 | Pass |
| subdivision data (449) | split E at1/3 or2/3 | midpoint vertex images1/3≠2/3, each realized interval=[0,1] | Placement field necessary and present |
| existence predicate (461) | refined edge versus point | edge→edge true; point→edge false | Pass |
| subdivision reflexivity (464) | E | vertex images0,1; realization t↦t | Pass |
| subdivision composition (465) | divide first third in half | new point maps to1/6 | Pass |
| composition homeomorphism law (466) | same subdivision | composite sends midpoint to1/6 on both sides | Pass |
| common refinement (470) | edge split at1/3 and2/3 | refinement vertices0,1/3,2/3,1; composites identical at each | Pass finite example |
| stellar subdivision (478) | one vertex starred at itself | surviving vertices1, proposed type cardinality2 | Fails; R02 |
| barycentric subdivision (479) | E | vertices0,1/2,1; two edges | Pass |
| barycentric map comparison (480) | E | new vertex maps to(1/2,1/2) on both constructions | Pass |
| simplicial realization (485) | edge id and endpoint swap | t↦t and t↦1−t | Existing owner; R07 |
| continuity of realization (486) | same maps | affine slopes+1,−1, both continuous | Existing owner; R07 |
| realization on vertices (487) | endpoint swap | 0↦1 and1↦0 on both sides | Existing owner; R07 |
| `SimplicialRealizes` (490) | split edge midpoint placed1/3 | commuting map gives1/3=1/3; using placement2/3 gives1/3≠2/3 | Pass discriminator |
| finite realization metric (496) | E barycentric coordinates | Euclidean distances d(0,0)=0, d(0,1)=√2 | Exact metric formula not supplied; R14 |
| metric topology (498) | E sequence t=1/n | coordinate distance√2/n→0; weak topology same limit0 | Finite example passes |
| PL map (501) | id versus x↦x² on [0,1] | finite affine subdivision exists for id; none for x² | Pass intended finite carrier |
| PL composition (508) | reversal composed with reversal | 1−(1−t)=t, one affine piece | Pass |
| subdivision map is PL (511) | split at1/3 | two affine pieces, slopes1/3 and2/3 in normalized charts | Pass |
| compose with subdivision (512) | reversal after preceding | new vertex image2/3 | Pass |
| PL isomorphic subdivisions (516) | E and its midpoint subdivision | refine E to2 edges; simplicial iso has3 vertices | Pass finite test |
| combinatorial circle/arc (564) | triangle cycle; 3-vertex path; isolated point | degrees(2,2,2);(1,2,1);(0): circle,arc,neither | Definitions need APIs/Checks; R14 |
| combinatorial surface (526) | triangle,K₄,empty,two triangles sharing one vertex | true,true,true,false; bad link has2 components | Pass tests |
| closed combinatorial surface (532) | K₄,triangle,empty | true,false,true | Pass |
| realization charts (537) | triangle interior/edge/vertex | neighbourhoods disc/half-disc/half-disc | Intended construction coherent |
| compact realization (539) | triangle; infinite disjoint triangles | compact=true; second not finite and not compact | Finiteness discriminates |
| realization boundary (541) | triangle,K₄ | 3-edge cycle,empty | Pass |
| manifold equivalence (545) | triangle,K₄,empty | link path / cycle / no vertices; both predicates true | Dimension-one balls are edges, not filled triangles; correct explanatory wording at561 |
| PL notions comparison (550) | affine embedded triangle; coordinate quadratic map | true↔true for id; false↔false for quadratic | Pass finite cases |
| local approximation (586) | φ=ε; positive oscillatory φ of R10 | constant lower bound ε; every-neighbourhood inf0 for latter | Contract incomplete; R10 |
| compact approximation (591) | id, ε>0; ε=0 negative control | distance0<ε; 0<0 false | Positivity necessary |
| relative approximation (598) | id fixed on boundary subcomplex | restriction=id on both sides; distance0<ε | Repeat surface hypotheses; R10 |
| strong Radó (632) | empty,disc,sphere | 0,1,4 triangles respectively for standard examples; boundaries∅,3-edge cycle,∅ | Pass tests, not yet compiled |
| weak triangulability (637) | same examples | exists empty complex/triangle/K₄=true | Compiled statement is weaker |
| boundary circles (640) | disc,annulus,sphere | 1,2,0 boundary components; each nonempty component S¹ | Pass; compactness excludes half-plane boundaryℝ |
| collar (644) | disc | (p,t)↦(1−t/2)p, t∈[0,1); zero slice p | Correct topological type |
| Hauptvermutung (647) | tetrahedral vs octahedral sphere | χ=4−6+4=2 and6−12+8=2; both refine to same PL sphere | No actual move/refinement certificate supplied by README; R14 |
| PL homeomorphism consequence (656) | same K on both sides | g=id, PL in both directions=true | Pass basic control |
| isotopy to PL homeomorphism (665) | edgewise PL surface id | g=id, constant isotopy | Non-PL worked example missing; R14 |
| relative isotopy to PL (668) | triangle id, A=boundary | restriction equality at every boundary point; constant isotopy | Pass basic control |
| bistellar moves (675–680) | 1→3; diagonal flip | Δ(V,E,F)=(1,3,2), (0,0,0); Δχ=0 each | Boundary moves unspecified; R14 |
| Pachner (682) | triangle vs stellar interior split | 1 move; faces1→3, χ1→1 | Pass; boundary-relative meaning needs fixed boundary triangulation specified |
| finite Euler characteristic (716) | full tetrahedron; its barycentric subdivision | 4−6+4−1=1;15−50+60−24=1 | Excluding empty faces is correct at pin |
| surface V−E+F (720) | K₄,octahedron,disc | 2=4−6+4;2=6−12+8;1=3−3+1, in ℤ | Pass; casts must be integral |
| Euler subdivision (724) | K₄ barycentric subdivision | 2=14−36+24 | Pass |
| Euler isomorphism (725) | vertex permutation of K₄ | counts4,6,4 unchanged;2=2 | Pass |
| triangle orientation (729) | two adjacent triangles | shared edge +1+(−1)=0; same direction gives2≠0 | Coherence excludes wrong model |
| orientability (730) | sphere,Möbius band,empty | true,false,true; orientation counts2,0,1 | Pass |
| orientability subdivision (733) | sphere/Möbius band | true↔true, false↔false | Pass |
| orientability isomorphism (734) | relabelled sphere | true↔true | Pass |
| surface Euler definition (741) | sphere via tetrahedron/octahedron | 2=2, choice independent in example | General invariance relies on stated targets |
| surface Euler transport (743) | annulus reflection | 0=0 | Pass |
| surface orientability (746) | disc/Möbius band | true/false | Pass intended definition |
| orientability transport (748) | reflected disc | true↔true despite orientation reversal | Pass |
| chosen surface orientations (754) | connected sphere,2 spheres,empty | cardinalities2,4,1 | Connectedness necessary for later count2 |
| orientation transport (756) | disc conjugation twice | signs +→−→+; composite +1 | Pass; construction missing R04 |
| isotopy acts equally (757) | rotations through π | sign+1 at both endpoints | Pass; requires cover construction R04 |
| two orientations (759) | sphere; empty negative control | 2=2; empty1≠2 but ConnectedSpace false | Pass |
| boundary orientation (762) | positively oriented disc at1 | tangent i, left normal i·i=−1 points inward | Correct CCW convention |
| sphere Euler (765) | K₄ | 4−6+4=2 | Pass |
| disc Euler (766) | T | 3−3+1=1 | Pass |
| sphere orientable (767) | K₄ boundary orientation | each shared edge cancels;2 coherent choices | Pass |
| ambient Schoenflies (796) | S; circle centre a radius r>0 | id; h(z)=(z−a)/r gives image S | Pass; r=0 is not Jordan |
| closed-inside Schoenflies (799) | S | closure D=B, identity homeomorphism | Pass |
| spherical Schoenflies (803) | equator | id sends equator to itself | Statable but missing; R09 |
| relative Schoenflies summit (20) | S with id/conjugation | restrictions z/overline(z), ambient extensions id/conjugation | Missing pointwise headline; R09 |
| simply-connected inside (808) | S; annulus negative control | π₁(D)=0; π₁(annulus)=ℤ, frontier not a single Jordan curve | Reuse existing consequence; R08 |
| curve local flatness (819) | round circle in plane; boundary circle in half-plane surface | first flattens to line; second fails interior hypothesis | Pass model/hypothesis test |
| arc slice (822) | [0,1] in plane | endpoint local slice has1 branch; interior has2 via positive point of half-line | Half-line slice is correct |
| two-sided collar (828) | annulus core; Möbius core | product collar=true; Möbius core two-sided=false | Predicate must be defined without assuming conclusion |
| neighbourhood dichotomy (836) | annulus/Möbius cores | (true,true)/(false,true for Möbius neighbourhood) | Intended result correct; precise objects missing |
| finite graph tameness (845) | no arcs; one polygonal Y with3 arms | id works; n=0 universal clause true, Y endpoint valence3 | Graph is tame but not a locally-flat 1-manifold; correct introductory wording under R12 |
| PL structure (889) | square triangulation; precompose by (x,y)↦(x³,y) | both valid topological triangulations; comparison non-PL in second | Distinction correctly explained |
| PL structure map approximation (897) | same structure,id | g=id, constant isotopy, PL=true | Pass basic control |
| closed Epstein (904) | sphere rotation; reflection | rotation homotopy/isotopy true; reflection degree−1 vs id+1 excludes homotopy | Statable; R09 |
| boundary-relative Epstein (906) | disc id/conjugation | boundary values z≠conj z at i, so relative homotopy false | Correct repair of absolute-disc counterexample |
| PL isotopy comparison (909) | id/id | constant isotopy PL=true; prescribed non-PL motion not required to remain the same | Intended existence direction sound; define PLIsotopic |
| Top/PL homeomorphism iff (914) | same triangulated surface | both existence propositions=true; reverse forgets PL conditions | Pass basic control |
| chart-groupoid bridge (921) | one triangle after appropriate charts | local PL transition pieces finite; true | Existing general owner; R07 |
| smoothing compatibility (935) | disc triangulated by one triangle | at corner two boundary tangents forced collinear: rank≤1 before refinement; barycentric wedges can have rank2 | Subdivision condition matters; full source not certified |
| smoothing construction (938) | triangulated disc | intended atlas smooth, boundary S; arbitrary chart atlas need not be smooth | Heavy construction appropriately remains README-only |
| smoothing is manifold (939) | standard compatible disc | all coordinate transitions C∞ | Existence source not certified |
| smoothing compatibility theorem (941) | subdivided disc | each triangle differential rank2 | Existence source not certified |
| smoothing uniqueness (942) | same smoothing | diffeomorphism=id, isotopy constant | General theorem not source-certified |
| isotopy to diffeomorphism (951) | smooth disc rotation | choose same rotation; derivative determinant1 | General theorem not source-certified |
| relative diffeomorphism (954) | disc radial f(re^{iθ})=r³e^{iθ} | f fixes S; isotopy to id fixes radius1 at each time | Pass test, smooth existence source not certified |
| smooth isotopy comparison (960) | rotation by θ | rotation by tθ is smooth, endpoints id/rotation | Define SmoothIsotopic precisely; general source not certified |
| Epstein proof input (968) | oppositely parametrized round circles in plane | ordinary homotopy=true; isotopy=false; windings+1,−1 | Fails without qualifiers; R05 |
| graph local-flatness summary (40) | Y graph at central vertex | 3 incident branches versus2 for line | Overclaim; R12 |

### Pinned declarations opened and ownership resolved

Pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Paths below are relative to those library repositories. The following 18 concrete anchors were inspected; these are not searches against a newer library.

| Pin / file and line | Declaration or definition checked | Consequence for this review |
|---|---|---|
| Mathlib `AlgebraicTopology/SimplicialComplex/Basic.lean:154` | `AbstractSimplicialComplex.singleton_mem` | Every carrier vertex is present; R02 is not repairable by leaving a ghost vertex |
| Mathlib `Geometry/Manifold/ChartedSpace.lean:236` | `ChartedSpace.secondCountable_of_sigmaCompact` | Compact surface second countability need not be rebuilt |
| Mathlib `Geometry/Manifold/IsManifold/Basic.lean:686` | `contDiffGroupoid_zero_eq` | The continuous groupoid adds no differentiability requirement |
| Mathlib `Analysis/SpecialFunctions/Complex/Circle.lean:435` | `AddCircle.homeomorphCircle` | Requires nonzero period; period1 satisfies it |
| Tau Ceti `Topology/JordanCurve/Basic.lean:108` | `IsJordanCurve C := Nonempty (C ≃ₜ Circle)` | No orientation or ambient separation is part of this predicate |
| Tau Ceti `Topology/FilledHull.lean:83` | `filledHull` | Uses bounded connected components; does not itself assert a Jordan theorem |
| Tau Ceti `Topology/PL/Map.lean:87,170` | `IsPiecewiseAffineOn`, `IsPLOn` | Finite affine pieces locally, not arbitrary PL names or a smooth condition |
| Tau Ceti `Topology/Homotopy/Isotopy/Basic.lean:85,111` | `Isotopy`, `Isotopic` | Time slices are embeddings; the native definition does not itself assert surjectivity or relative support |
| Tau Ceti `Geometry/Manifold/LocallyFlat/Basic.lean:169,361,376` | `IsSliceChart`, `IsSliceEmbedding`, `IsLocallyFlat` | Slice equality and actual embedding; no implicit boundary convention. A Y is not a line slice (R12) |
| Tau Ceti `Geometry/Manifold/Boundary/Basic.lean:60` | `isBoundaryPoint_iff_mem_frontier_range` | The `k ≠ 0` hypothesis really is present, as the README warns |
| Tau Ceti `Geometry/Manifold/Instances/ClosedBall.lean:237,299,320` | closed-ball atlas, boundary-point criterion, boundary theorem | Existing general construction; R06 |
| Tau Ceti `Geometry/Manifold/Boundary/Collar/Global.lean:51` | `IsCollared` | Existence of an actual collar map, not a free proposition |
| Tau Ceti `AlgebraicTopology/SimplicialComplex/Realization.lean:136,328` | weak realization topology, `vertex` | Topology is final over faces; a finite-coordinate metric needs a comparison theorem |
| Tau Ceti `AlgebraicTopology/SimplicialComplex/Subdivision/Stellar/Basic.lean:186` | `self_notMem_stellarSubdivision` | Starred singleton is destroyed |
| Tau Ceti `AlgebraicTopology/SimplicialComplex/CombinatorialManifold.lean:80,86,193` | balls, spheres, manifold link condition | At dimension2 links are dimension1 balls/spheres; void complex passes vacuously |
| Tau Ceti `Topology/Triangulable.lean:40` | `IsTriangulable` | No finiteness, link condition, or boundary correspondence is included |
| Tau Ceti `Analysis/Contour/Winding/Number/Homotopy.lean:127` | `windingNumber_eq_of_pathHomotopy` | End paths must be piecewise C¹; intermediate homotopy need only be continuous. The retraction contraction has smooth endpoint loops |
| Tau Ceti `Analysis/Complex/Conformal/Jordan/Domain.lean:118,140,158,226` | Jordan-domain fields, convex constructor, straight-piece result, simple connectivity | General Jordan-domain simple connectivity exists; the straight-piece theorem is not the unrestricted Jordan curve theorem |

Additional object searches inspected `SimplicialComplex/Maps.lean`, the barycentric subdivision homeomorphism, Borsuk/Janiszewski, and the PL groupoid. The simplicial-map realization was not found in the pinned maps API, but **is** a target of GeometricTopology on main; absence at the pin is not new ownership. No general planar invariance-of-domain declaration was found in the inspected pinned topology files. Tau Ceti's `AlgebraicTopology/Singular/JordanBrouwer.lean:212` provides a higher-dimensional sphere-complement path-component count; it does not by itself supply the planar frontier/accessibility/crosscut package, so the latter remains meaningful new work.

Ownership searches used the required `roadmaps grep` and `roadmaps show` service, the main checkout, the supplied open-head files, and the board packages. The broad searches were narrowed where the service truncated output. No duplicate fully qualified name was found for the 17 compiled local definitions/structures. The declarations in the Lean comments are not declarations. Existing owner conflicts are R06–R08; this folder can still own the additional planar separation, approximation, surface triangulation and tameness theory after resolving them. It is not a wholesale re-plan warranting rejection.

Cross-roadmap checks resolved four named relationships, with existing roadmaps taken from main for supply and this PR's sibling edits inspected for the proposed new edges:

- **GeometricTopology Layers 1, 2, 11:** manifold/PL/isotopy vocabulary, local flatness, and simplicial foundations exist in the named sections. Main's Layer 11 already owns realization of simplicial maps and the PL bridge. This PR's Layer 11 adds the reverse Radó edge (R01). The cited pinned modules were checked independently of those sections.
- **ConformalMapping Layer 5:** the Jordan-domain Carathéodory target exists. Its edited relationship paragraph at `TauCetiRoadmap/ConformalMapping/README.md:140–144` consumes the two proposed outputs. The claim that simple connectivity is a separate missing input is superseded by the pinned domain theorem (R08).
- **ContourIntegration:** the completed roadmap and the pinned `Analysis/Contour/Winding/Number/Homotopy.lean` were read. The latter supplies precisely continuous-homotopy invariance between piecewise-C¹ endpoint paths; no homotopy regularity was silently added.
- **SurfaceTopology Layers 3, 5, 7, 8, 9:** the sibling supplier table at lines 38–48 and Layer 3 at 389 resolve the intended uses of triangulation, Euler characteristic, orientation and isotopy. Its boundary orientation at lines 264–265 and 278 matches the “surface on the left” convention: the positive disc boundary is counterclockwise. These are downstream consumers, not prerequisites of PlanarTopology. `Surface.IsOrientable`, flagged by the citation scanner, is an intended new Layer 6 object, not a falsely claimed pinned declaration.

DifferentialGeometry Layer 10.5 on main is the additional existing owner discovered by the audit (R07); its Layer 2 orientation-cover work does not automatically supply a simplicial, pre-smoothing construction. AlgebraicTopologyPartII's supplied open head explicitly imports those generic foundations, rather than owning planar separation. Ownership against supplied open roadmap files was checked through the object searches. No unprovided open-head files were obtained or treated as suppliers.

### Seeded source sample

The seed labels repeat without layer identifiers. I checked their occurrences across the nine layers: “Mathematical route and formalization notes”, “From Tau Ceti”, “From layer 1”, “Representative formal statements”, “Natural intermediate results”, “Consequences”, “From layers 0 and 2”, and “From layers 3 and 5”. No individual locator is marked unverified in the README; most claims have no individual locator at all (R13). Library/supplier occurrences are resolved above. The readable mathematical sample has the following anchors; these are proposed precise citations, not locators the README already supplied.

| Source text opened | Exact locator and hypotheses checked | Result |
|---|---|---|
| [Jordan–Schönflies blueprint](https://raw.githubusercontent.com/alonamaloh/jordan-schoenflies/main/jordan_schoenflies.pdf), `blueprint` lines 251–278 | §2, p.7: crossing count with a rotated coordinate system having no horizontal edges; subdivision invariance and local constancy | Supports the polygonal parity route, but not the README's unspecified horizontal-run convention |
| `blueprint` lines 293–317 | Theorem 2.3, pp.7–8: simple closed polygon, two regions, bounded/unbounded and common frontier | Matches the intended Layer 1 theorem at arbitrary real vertices, not just lattice vertices |
| `blueprint` lines 361–384 | Lemma 2.7 and Theorem 2.8, pp.9–10: simple polygonal crosscut, distinct endpoints, no other meeting; parity identity off both curves | Matches the parity identity and distinguishes interior from exterior crosscuts |
| `blueprint` lines 492–499 | Lemma 3.4, p.12, nonplanarity of K₃,₃ and subdivisions | Supplies the stated finite graph obstruction |
| `blueprint` lines 718–758 | Lemma 5.3, pp.16–17 and Theorem 5.4, p.17: arbitrary Jordan curve, accessible points dense on the curve, two complementary regions with that frontier | Supports Layer 2's general separation/frontier route |
| `blueprint` lines 786–805 | Theorem 6.2 and Lemma 6.3, p.18: polygonal interior crosscuts and polygonally accessible endpoints | Does not directly certify the arbitrary-arc crosscut signature; R04/R13 |
| `blueprint` lines 16–18,812–814 | Theorem 0.1, p.1 and Theorem 7.1, pp.18–19: extension of a prescribed boundary homeomorphism | Supports the stronger relative headline missing from Suggested.lean |
| [Epstein](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6005-11511_2006_Article_BF02392203.pdf), `epstein` lines 109–115,214–234 | Theorems 2.1,3.1,3.3, printed pp.86,89–91: essential two-sided circles; proper arcs with fixed endpoints; one-sided circles | Reveals omitted hypotheses in the Layer 8 curve input, R05 |
| `epstein` lines 533–603 | Theorem 6.3 and proof, printed pp.99–101: proper homotopy as maps of pairs; proof preserves boundary once homotopy is constant there | Supports compact closed/relative homeomorphism statements; compactness removes properness concerns and disconnected cases are componentwise |
| `epstein` lines 725–790 | Appendix A1–A4, printed pp.105–107: ambient PL approximation of curves/arcs/homeomorphisms; A2 arcs meet boundary exactly at endpoints | Useful for Layer 8; does not replace the separate local-control approximation needed before Radó |
| [Kulpa](https://dml.cz/bitstream/handle/10338.dmlcz/702050/ActaCarolinae_039-1998-1_10.pdf), `kulpa` lines 41–94 | Domain invariance theorem and proof, printed pp.127–129 | Confirms the general conclusion. This located paper uses a zero-avoiding approximation lemma and Poincaré–Miranda; it does not certify the README's particular Tietze-extension attribution |

All source retrieval used the sources service. The three readable mathematical texts are the blueprint, Epstein, and Kulpa. The fetched Thomassen PDF is image-only in this environment. The paper numbering quoted for Epstein is the printed journal numbering; the blueprint is cited as the fetched 53-page version, without assuming another version has identical numbering.

## Not verifiable

These limits do not postpone this review. They prevent certification of the corresponding source claims; the independent mathematical and ownership findings above already require changes.

- **Thomassen 1992**, pp.116–130: the DOI landing page returned HTTP403. A legal [institutional copy](https://people.math.wisc.edu/~dymarz/751/thomass.pdf) was fetched through the service, but its extraction is image-only and local OCR is unavailable. No printed theorem numbers were guessed. The independently readable blueprint was checked instead.
- **Moise**, *Geometric Topology in Dimensions 2 and 3*, and **Rourke–Sanderson**, *Introduction to Piecewise-Linear Topology*: service results were `uncertified`, resolving to paywalled Springer publications. The source claims about the precise local/half-plane approximation and triangulation routes remain uncertified. They were not added as new missing requests.
- **Newman**, *Elements of the Topology of Plane Sets of Points*; **Munkres**, *Elementary Differential Topology*; **Whitehead**, *On C¹-complexes*: bibliographic source-service searches found no legal text. The README supplies no exact target locators. Missing entries record these searches.
- **Munkres 1960**, *Obstructions to the smoothing of piecewise-differentiable homeomorphisms*: service resolution reached JSTOR DOI `10.2307/1970228`, without a verified accessible full text. **Kuiper 1965**, *On the smoothings of triangulated and combinatorial manifolds*: resolution reached the publisher chapter DOI `10.1515/9781400874842-002`; no verified accessible full text. The compatibility, uniqueness, boundary-relative smoothing and smooth-isotopy claims have not been certified against these texts.
- **Cannon**, *Topology as Fluid Geometry*, volume2: service resolution reached AMS DOI `10.1090/mbk/109`; no readable full text was obtained. Layer 0's three existence examples and the out-of-scope continuum assertions were not independently source-certified. Their motivation does not replace target locators.
- **Kulpa attribution:** the readable 1998 paper above proves invariance of domain, but the exact Tietze-based argument ascribed to him is not identified. The roadmap must give the intended paper and locator, or present the proof as its own route with all inputs specified. OCR inequalities in the located scan were not reliable enough to register typographical errata.
- **Prior formalizations:** the source service retrieved the public `mccorvie/classification-of-surfaces` and `alonamaloh/schoenflies-lean` pages. They identify Apache-2.0 licences (`classification-code` line449; `schoenflies-code` line390). The latter states its boundary-extension theorem at lines298 onward. These pages are evidence of scope, not a checked port: no external development was built, line-count claims were not certified, and private author-coordination assertions cannot be verified here. The `rkirov/jordan_pick` service request did not yield that repository's source text; it followed a paper link and failed licence classification. Its exact coverage/licence remains unverified.
- **Unspecified target predicates:** the generality of `StronglyPositive`, `IsCrosscut`, `PLIsotopic`, `SmoothIsotopic`, two-sidedness and regular-neighbourhood predicates cannot be certified until their exact meanings and suppliers are stated. The table gives discriminating tests instead of treating those names as axioms.

The consolidated missing-reference file preserves unresolved source keys and removes the successfully recovered blueprint request. No source manifest or repository file was edited.

## Source issues

- none
