# Review of RiemannianGeometry (pull request #1683 at 7b2d389)

**Verdict:** needs changes

## R01 (P1) — Two GeometricTopology contracts are not supplied on main

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md:78–83`, also 544–554. Claimed inputs: “orthogonal-complement-to-quotient bundle equivalence” and “marked CW-pair and finite-point refinements”.

**Claim:** R1/R5 and R3 consume stronger interfaces than the cited supplier states. No matching supplier gaps are declared. GeometricTopology is an existing roadmap, so its unmerged revision cannot supply additions to its main-branch contract under this review's rules.

**Witness:** Main `TauCetiRoadmap/GeometricTopology/README.md:218–222` states the tubular-neighbourhood theorem; 938–943 states smooth triangulation/PL uniqueness. Neither states these two refinements. The explicit normal quotient comparison occurs only in its open revision, lines 648–665.

**Repair:** Consume main's normal bundle and smooth triangulation, then own the necessary adapters here, or declare precise supplier gaps in the prescribed plan/README form. The first adapter must identify the smooth orthogonal normal bundle with the quotient of the pulled-back tangent bundle. The second must produce a triangulated pair with each specified finite set of distinct points as vertices and identify its underlying marked pair. Test the first on the line in ℝ²: `(a,b)` modulo the tangent line maps to `(0,b)`; test the second on a circle triangulation whose chosen marked point lies inside an edge: subdividing makes that point a vertex. Neither extra conclusion is the bare supplied theorem.

## R02 (P1) — The stated analytic order reverses a supplier edge

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md:103–105`: “VariationalMethods §2.3 → UnboundedOperators §4.7 → VariationalMethods §5.1–§5.2”.

**Claim:** The first arrow contradicts the suppliers' actual ownership and creates a layer cycle if followed. This prose edge is not caught by the roadmap-level dependency check.

**Witness:** `TauCetiRoadmap/VariationalMethods/README.md:45–56` at its supplied open head says nothing there is an input to UO-D06; §2.3, lines 499–500, consumes UO-D06's coercive solution. `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md:74` likewise supplies no reverse dependency.

**Repair:** State `UnboundedOperators §4.7 → VariationalMethods §2.3 and §§5.1–5.2 → R5b`. Keep the energy-space specialization in VariationalMethods and the generic represented operator in UnboundedOperators. On the one-dimensional form `a(u,v)=2uv`, the generic supplier already gives `A=2 Id` and solution `h↦h/2`; the energy-space specialization consumes this and need not precede it.

## R03 (P1) — Universal-cover countability cites a section that does not supply it

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md:710`: “The independently owned LieGroupoidsPoisson G0.0 countable-coordinate/overlap-components argument makes pi1 countable.”

**Claim:** This prerequisite is attributed to the wrong roadmap section, without a declared gap.

**Witness:** At the supplied head, `TauCetiRoadmap/LieGroupoidsPoisson/README.md:261–299` defines topological groupoids; 1033–1034 imports countability from SmoothBundlesConnections B5.2. Main `TauCetiRoadmap/SmoothBundlesConnections/README.md:1227–1235` explicitly owns the countable-cover/overlap proof.

**Repair:** Replace this supplier citation with SmoothBundlesConnections B5.2 and retain its connected, second-countable, locally path-connected, locally simply connected hypotheses. Coordinate balls supply the last two. The circle has fibre ℤ and countably many sheets; the simply connected two-sphere has one sheet. Both constructions work with that supplier, independently of Myers or finite fundamental group.

## R04 (P2) — R1 replans transport reconstruction owned by SmoothBundlesConnections

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md:251–255`: “Reconstruct a connection from smooth linear path transport … prove locality/Leibniz/chart independence and uniqueness, and recover the transport.”

**Claim:** This is the supplier's general construction again, with no additional Riemannian conclusion identifying a kept variant. The same ownership problem occurs for the constant-curvature Ricci/scalar contractions at README 199–200 and the McShane extension proof at 1523.

**Witness:** Main `TauCetiRoadmap/SmoothBundlesConnections/README.md:1115–1174` owns the inverse dictionary. Pinned `Curvature/Ricci.lean:101`, `Curvature/Scalar.lean:112` and Mathlib `Topology/MetricSpace/Lipschitz.lean:308` already supply the other three results; their exact declarations are listed below.

**Repair:** Delete these owned targets and consume B5.1 and the three pinned declarations by name in the supplier contracts. Keep the geometric smoothing/gluing beyond the supplied Lipschitz extension. Retain a specifically stated tangent/Levi-Civita comparison only if it adds a result. Preserve the supplier's uniqueness on differentiable germs, rather than asserting equality of unconstrained extensions to arbitrary raw sections. For `∇=d+a dx`, transport is `exp(−a(y−x))`; differentiating inverse transport gives `s′+as`, exactly B5.1's construction.

## R05 (P2) — Two statable headline theorems are absent

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md:202–203,815–839`; `TauCetiRoadmap/RiemannianGeometry/Suggested.lean:15–28`.

**Claim:** The contracted-Bianchi Einstein-factor constancy theorem and the theorem producing two distinct geodesics between distinct points of a connected closed positive-dimensional manifold are neither stated nor identified among unstatable headlines. Their actual carriers are present at the pins.

**Witness:** Two scratch copies elaborate the Einstein statement using native `ricciTensor` and the two-curve statement using native `IsGeodesicCurveOn`, each with only the original nine admissions and one new admission warning.

**Repair:** Add both headlines with `sorry`. For Einstein constancy, bind connectedness, dimension at least three, a real function a, and `Ric_x(u,v)=a(x)⟨u,v⟩` for every x,u,v, concluding `∀ x y, a x=a y`. On the unit S³ this gives `a=2`; a disjoint union with the radius-two S³ has factors 2 and 1/2 and fails connectedness. For geodesic multiplicity, Parameterize both curves on `[0,1]`, fix both endpoints, and require inequality at some parameter in that interval, not inequality of their arbitrary extensions outside it. Increasing affine reparametrization of this fixed interval fixes every parameter. The tested conclusion is:

```lean
∃ (γ η : ℝ → M),
  TauCeti.Manifold.IsGeodesicCurveOn I γ (Icc 0 1) ∧
  TauCeti.Manifold.IsGeodesicCurveOn I η (Icc 0 1) ∧
  γ 0 = p ∧ γ 1 = q ∧ η 0 = p ∧ η 1 = q ∧
  ∃ t ∈ Icc (0 : ℝ) 1, γ t ≠ η t
```

On the unit circle, angles `πt/2` and `−3πt/2` join the same distinct endpoints; at `t=1/2` they are antipodal. The noncompact line supplies the negative control: its affine segment is unique, so compactness cannot be dropped.

## R06 (P2) — The paraboloid file still substitutes coordinate statements for the geometric headline

**Location:** `TauCetiRoadmap/RiemannianGeometry/ParaboloidTargets.lean:4–10,55–72`; README 1247–1258 explicitly says these are “not about geodesics of the induced metric”.

**Claim:** The Lean form rules apply to both files. The three admissions in the companion file illustrate coordinates/Checks; its crossing theorem does not mention the manifold, metric, or native geodesic predicate. They do not serve as the geometric acceptance test required for R5a.3.

**Witness:** `geodesic_crossings` binds only `r θ : ℝ → ℝ`, `a : ℝ`, derivative equations and the explicit point map. Its computed equations are consistent, but the README itself assigns the geometric comparison to other targets.

**Repair:** Remove the coordinate substitute file, preserving the mathematical estimates and crossing construction in the README. If the induced metric can be packaged with a few simple real-body native definitions, state the actual geometric headline in `Suggested.lean`; otherwise explicitly name the nonmeridional paraboloid crossing/vertex-pole headlines and the missing induced-metric interface in its module docstring. Do not replace them with free-coordinate ODE admissions. The positive instance remains the all-time unit-speed paraboloid geodesic with angular momentum 1; the wrong circular solution `r=1, θ=t` has radial residual `−1`, and a restricted outgoing segment has no promised crossing. Keep these distinctions in the geometric statement.

## R07 (P3) — README form, definition checks, and target-local dependencies remain incomplete

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md:1–14,181–208,336–383,727–755,1609–1643`.

**Claim:** There is no required Summary/Scope/Exact supplier contracts/How to read structure, and no layer-ending Examples/Dependencies. Only five `*Needs:*` lines and one `**Checks.**` block serve the whole 1,680-line document. Definitions such as local symmetry, the Jacobi predicate, index, injectivity radius and the curve-space metric lack their own three discriminating Checks. Broad chapter references do not locate most individual targets.

**Witness:** R2 defines `IsJacobiFieldOn` at 341–343 and lists its theory at 353–383 without a Checks block, target locator or Needs line. Its first concrete Checks heading is instead R5a.3 at 1227.

**Repair:** Reorganize without deleting mathematical scope into the prescribed headings and layers; give each definition its prose API and at least three discriminating Checks, each theorem its locator/hypotheses, and each target its actual prerequisites. For R2 use: flat `J=u+tv`; sphere `J=sin(t)E`; and the negative control `J=t²E` on a flat unit-speed geodesic, whose Jacobi residual is `2E≠0`. Separate R1 connection algebra from its later Jacobi-dependent jet calculation in those dependencies.

## R08 (P3) — The focal-index count cites the nullity lemma

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md:1388–1391`: “the index … is the sum of those focal multiplicities (Milnor … Lemma 6.5)”.

**Claim:** Lemma 6.5 identifies degeneracy and nullity with focality/multiplicity; the count of interior focal points giving the index is Lemma 6.9.

**Witness:** `milnor1963 line 1600` begins Lemma 6.5; `milnor1963 line 1677` begins Lemma 6.9, the index theorem for squared distance, printed p. 37, with proof continuing on p. 38.

**Repair:** Cite Lemma 6.9, pp. 37–38 for the index and Lemma 6.5 for nullity. State explicitly that the endpoint-degenerate extension follows from the displayed Hessian eigenvalue calculation: the cited index lemma itself assumes a nondegenerate critical point. For the inward normal of the unit circle, `Hess h=2(1−t)`: at `t=1/2,1,2`, index/nullity are respectively `(0,0),(0,1),(1,0)`. The repaired locator and direct extension match all three.

## R09 (P3) — Source tracking and the seeded locator remain incomplete

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md:315–316,1643–1680`; the folder has no `sources.toml`.

**Claim:** The projective block now cites a named theorem/corollary, but no exact printed page. Its period and trace/Kähler normalization deductions are not attached to a checked pinpoint locator. None of the sixteen reference works is recorded in the required source manifest.

**Witness:** The O'Neill reference supplies the article range 459–469 only; the target supplies Theorem 2 and Corollary 1 only. The source-service copies retrieved for this review contain access-error text, so their contents cannot certify that locator.

**Repair:** Record the sixteen works once each using stable source keys and their legal-access status; add exact locators at the claims. Record inaccessible texts as permitted by the source policy, without treating an error response as a paper. Keep the explicit derivations distinguishing the Hopf quotient from the sphere orbit map. In particular `X=[[0,−1],[1,0]]` has `−tr(X²)/2=1=|Xe₂|²`, whereas `X=diag(0,i)` has values `1/2` and `1`; the normalization statement must remain a quotient-horizontal statement. The seeded theorem/page/hypothesis verification remains uncertified below.

## Verified sound

### Previous findings, checked individually

There was no supplied repair report marking any finding “not actionable in this package”. The previous report is evidence to check, not a source of instructions.

| Previous finding | Passage at this head / deletion | Result |
|---|---|---|
| R01 sorry-backed data | Suggested 12–13: “only the one definition (`IsJacobiFieldOn`)”; its body is explicit at 76–84. Old index/B/S definitions and dependents are absent. | Repaired. |
| R02 build warning | Suggested 1–3: `module`, `public import Mathlib`; direct build has only admissions. Companion remains `import Mathlib`, but direct elaboration succeeds and the prescribed Suggested gate passes. | Repaired for the reported build failure. |
| R03 missing Cartan–Hadamard/three geodesics | Suggested 139 `cartanHadamard_isCoveringMap`, 177 `three_simple_closed_geodesics`. | Repaired; separate R4.8 omission is R05 above. |
| R04 missing squared-distance owner | README 1394: “Own the squared-distance exhaustion and genericity theorems here”. | Repaired; C² equal-dimension Sard is sufficient. |
| R05 TeX subscripts | README 878 uses a code span for `D_(η_def)(C)`; scanners report tex=0. | Repaired. |
| R06 commit-pinned roadmap links | README 67/84 use relative SBC/CKG links; 95/146 name VM/PDO by section. | Repaired for the seven reported roadmap links. |
| R07 PR-number supplier citations | README 122: “HomotopySpheres §3A.1”; 167: “HomotopySpheres Stage 4B”. | Repaired. |
| R08 broken links | README 55/116 point to Completed HopfRinow/ConformalMapping; 175 names RicciFlow. | Repaired. |
| R09 supplier labels | README 95: “VariationalMethods §2.3–§2.4”; 677: “PositiveMass §2.3”. | Labels repaired; dependency content has drifted (R02). |
| R10 companion-file form | README 1247–1254 now names all eight declarations, but 1255–1256 still says “not about geodesics of the induced metric”; five definitions still lack docstrings. | Partly repaired; R06 gives one concrete removal repair covering these defects. |
| R11 Suggested padding | Old Veronese/broken-node/API declarations are absent; nine remaining admissions survive the one-tactic probes. | Repaired. |
| R12 README shape/undeclared names | Needs lines now at 232, 721, 846, 1260, 1428; the previously identified seven undeclared names are gone. | Partly repaired; R07 addresses missing per-target structure/Checks. |
| R13 projective locator | README 315–316 now names O'Neill Theorem 2/Corollary 1. | Partly repaired: no printed-page pinpoint/manifest, and source inaccessible; R09. |

### Gate, elaboration, signatures, and scope

- Head independently confirmed as `7b2d389c52331d18fe32adccbe7ddfc158988b45`. Main context is `fa41b374`. Mathlib pin is `f6090c7095e1e56b3464c1daba5f24631f1290d2`; Tau Ceti pin is `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`.
- The worker's gate reports all counters zero and `OK`, including targeted build, imports, data admissions, outside-folder and stray-file checks. There is no gate failure to add as a finding. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/RiemannianGeometry'` is empty. The worktree was left unchanged.
- Direct `lake env lean` on the requested absolute Suggested path, run from the worktree, exited 0 with exactly nine `declaration uses sorry` warnings. No missing object file required an additional build.
- Scratch copies tried `simp`, `rfl`, and `infer_instance`, each required to close the entire goal, before falling back to `sorry`, on all nine Suggested and three companion theorems. All twelve remained admitted; no one-tactic success was found. The pinned library search found no single existing lemma proving any complete remaining headline. Companion statements nevertheless remain coordinate/Check substitutes under R06; difficulty alone does not make them headlines.
- A single scratch elaboration printed `#check @name` for all ten actual Suggested declarations; a companion probe printed all eight companion signatures. The worker's purported eleventh Suggested declaration `is` is a scanner match on the docstring phrase “instance is”, not a Lean declaration. `IsJacobiFieldOn` loses `[I.Boundaryless]`, but its real body uses no boundaryless assertion; its theorems retain that binder. No theorem lost a needed hypothesis. The printed signatures carry the Riemannian metric/distance compatibility and the explicit dimension, positivity, completeness and connectedness assumptions where needed. No source file was changed after these checks.
- The missing Einstein-factor and R4.8 headline probes each elaborated in the corresponding existing context with ten admission warnings (the original nine and the added theorem), no errors/options/data admissions. Both geodesics are distinguished inside the fixed interval.
- Main shape precedents read: `Completed/HopfRinow/README.md`, `Completed/OrthogonalL2Bases/README.md`, and SmoothBundlesConnections' supplier/transport sections. This PR amends the existing RiemannianGeometry roadmap; it is not a competing new plan for the entire subject. The new radial-frame and paraboloid derivations extend its existing objects. No computational algorithm or copied source passage was identified in the reviewed additions.

The required dependency command returned:

```text
depcheck: 204 roadmaps, 1546 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line was emitted. All five Needs lines were read. This output does not validate the contrary layer-level VM/UO arrow (R02), or prove the existence of a stronger or correctly attributed supplier contract (R01/R03). `roadmaps resolve` also reported no names found nowhere, but explicitly did not inspect the pinned packages; the pinned checks below were performed separately.

### Pinned declarations inspected by object

These paths are relative to the named pinned library, not to a newer checkout.

| Library / file and line | Declaration/content inspected | Consequence for this review |
|---|---|---|
| Mathlib `Topology/VectorBundle/Riemannian.lean:420,431` | `RiemannianBundle`, induced fibre norm | Tangent norms in the Lean inequalities come from the bundle metric, not an unrelated coordinate norm. |
| Mathlib `Geometry/Manifold/VectorBundle/Riemannian.lean:67,78` | `IsContMDiffRiemannianBundle`, lowering regularity | The explicit order-one instance in the two-sphere theorem is compatible with the smooth metric. |
| Mathlib `Geometry/Manifold/Riemannian/Basic.lean:79` | `IsRiemannianManifold.out`: edist equals intrinsic length edist | The class supplies metric compatibility, not connectedness, completeness or nonemptiness. The global Lean theorems bind these separately. |
| Mathlib `Topology/MetricSpace/Lipschitz.lean:308` | `LipschitzOnWith.extend_real` | Extends a real K-Lipschitz function from a subset of any pseudometric space; no Riemannian reconstruction is needed (R04). |
| Tau Ceti `Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Scalar.lean:112` | `CovariantDerivative.scalarCurvature_eq_of_curvatureTensor_eq_smul_inner_sub` | Already gives `n(n−1)κ` (R04); Ricci.lean:101 is `CovariantDerivative.ricciTensor_eq_of_curvatureTensor_eq_smul_sub`. |
| Mathlib `Topology/Covering/Basic.lean:287` | `IsCoveringMap` uses evenly covered fibres | No automatic surjectivity is hidden in the definition; connectedness and the actual exponential map belong to Cartan–Hadamard's mathematics. |
| Mathlib `MeasureTheory/Function/Jacobian.lean:645` | `addHaar_image_eq_zero_of_det_fderivWithin_eq_zero` | Equal-dimensional differentiable critical image is null; C¹ normal map suffices for C² embedding in R6. |
| Mathlib `MeasureTheory/Covering/Besicovitch.lean:455` | `Besicovitch.exist_disjoint_covering_families` | Conclusion is disjoint closed-ball families and open-ball covering, matching the README; finite extraction remains owned. |
| Tau Ceti `Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Sectional.lean:70,140,164,186` | Sectional curvature, prescribed curvature predicates, tensor-to-sectional implication | Prescribed curvature tests only independent vectors. No uniqueness of κ in dimensions 0/1; the converse polarization is not supplied here. |
| Tau Ceti `Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Metric.lean:111,141,172` | Metric skew-adjointness; general and smooth-metric constant-tensor predicates | Constant-curvature sign matches the README. The full iff is not a definition restatement. |
| Tau Ceti `Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Ricci.lean:57,80,101` | Ricci contraction and constant-tensor contraction | On the unit n-sphere it gives `(n−1)g`, consistent with Myers. Consume these contraction APIs where already supplied. |
| Tau Ceti `Geometry/Manifold/Riemannian/Geodesic/Basic.lean:98` | `IsGeodesicCurveOn`: UniqueDiffOn, C², zero acceleration | No unit-speed, nonconstancy, endpoint or injectivity conditions are implicit; the three-geodesic statement's period injectivity excludes constants. |
| Tau Ceti `Geometry/Manifold/Riemannian/Geodesic/Exponential.lean:92,98` | `expDomain`, `riemannianExp` | Exponential is totalized with value p outside its domain; completeness is essential in the all-tangent-space covering headline. |
| Tau Ceti `Geometry/Manifold/MFDeriv/Curve.lean:122`; `VectorBundle/CovariantDerivative/AlongCurve/Basic.lean:124` | Within velocity and within along-curve derivative | The Jacobi definition uses the actual dependent tangent fibres and interval derivatives. |
| Tau Ceti `Geometry/Manifold/TubularNeighborhood/Euclidean.lean:257,275,483,497` | Normal rank/tube, total-space topology, compact C² normal tube theorem | The pin supplies a homeomorphic normal tube for compact C² immersions that are injective, not the missing general smooth quotient-bundle adapter or marked triangulation. |

Object searches covered curvature/polarization/Schur, Jacobi fields, index forms, Laplacians, normal tubes, transport reconstruction, and the paraboloid in pinned Mathlib/Tau Ceti, main, board packages and the provided open-head index using `roadmaps grep/show`. No conflicting fully qualified name for the ten Suggested declarations was found. RiemannianGeometry remains the owner of the Jacobi/index, geometric comparison, immersion, and Bochner consequences; RicciFlow, HomotopySpheres and SpinGeometry explicitly consume these. R04 records the duplicated construction and three pinned results.

### Cross-roadmap resolution

The following cited ownership was inspected at main unless marked open. A section's existence is distinguished from its claimed content in R01/R02.

| Supplier | Resolved section / file-line evidence |
|---|---|
| HopfRinow | `Completed/HopfRinow/README.md`, Layers 0–4 and standing metric conventions, lines 25–49, 71–105. |
| DifferentialGeometry | `TauCetiRoadmap/DifferentialGeometry/README.md`, Layers 0–3/5–10/12; §5.6 AC/Jordan interfaces and Layer 10 Sard; native supplier inventory 136–203. |
| SmoothBundlesConnections | `TauCetiRoadmap/SmoothBundlesConnections/README.md:1074–1094` B5.0 transport/families; 1115–1174 B5.1 reconstruction; 1317–1331 B6.0 compact-set normal/convexity radii. B1.4/B1.5/B2–B4 provide quotient/bundle/connection objects. |
| GeometricTopology | `TauCetiRoadmap/GeometricTopology/README.md:218–222`, Layers 7/8 and smoothing comparison 938–943; see R01 for the two stronger unsupplied refinements. |
| ComplexKahlerGeometry | `TauCetiRoadmap/ComplexKahlerGeometry/README.md:570–610` K5a; 1415–1442 K7.1 native projective charts; 1444–1450 K7.2 integral-one FS convention. Existing-roadmap revisions were not used as new contracts. |
| GeneralizedCohomology | `TauCetiRoadmap/GeneralizedCohomology/README.md:1082–1108,1145–1180`, G4.0b smooth quaternionic groups/quotients and rank-one projective carrier. |
| TopologicalKTheory | `TauCetiRoadmap/TopologicalKTheory/README.md:1083–1098`, T6.6 `U(r)/(U(r−1)×U(1))`, last-line block convention. |
| CharacteristicClasses | `TauCetiRoadmap/CharacteristicClasses/README.md:211,550–590,720`, C1.5/C2/C3; `bundleDiskSphereRelCW` and `bundleDiskAttachmentCWModel` are present. |
| AlgebraicTopology | `TauCetiRoadmap/AlgebraicTopology/README.md:544–580` normalized suspension, Stage 4.6 projective carriers, Stage 6 cup/cap, Stage 8 connectivity/Whitehead, 1949 onward mapping-CW targets. |
| DGFloer | `TauCetiRoadmap/DGFloer/README.md:182–201,258–296` shared Riemannian ownership, weak-equivalence homology and Moore topology/currying; Layer 1/2 Hopf/loop interfaces. |
| ConformalMapping / GMT / Isoperimetry | `Completed/ConformalMapping/README.md` L3/L5; `TauCetiRoadmap/GeometricMeasureTheory/README.md:106,183,210,248,275` G1/G3–G6; `TauCetiRoadmap/Isoperimetry/README.md:182,397` I3/I6. Spherical applications remain targets here. |
| PDE | `TauCetiRoadmap/PDE/README.md:223–264,303–340`, lanes A/D/E. The README correctly owns the missing bundle boundary-domain specialization rather than assuming interior estimates imply it. |
| VariationalMethods / UnboundedOperators (open new material) | `TauCetiRoadmap/VariationalMethods/README.md:45–56,494–513,839–865`; `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md:512–547`. See R02. |
| PseudodifferentialOperators (open) | P1/P1.0 differential operators, symbols/formal adjoints and Bochner connection; P5/P6 Sobolev/elliptic scope. R5b retains its boundary construction. |
| HomotopySpheres (open) | §3A.1 mapping-product foundation; Stage 4B Bott-chain application; `TauCetiRoadmap/HomotopySpheres/README.md:122,1358–1376` cites the shared Riemannian ownership. |
| LieGroupoidsPoisson (open) | G0.0 is topological groupoids, not the cited countability proof; its lines 1033–1034 explicitly consume SBC B5.2. See R03. |
| RepresentationTheory | LieGroups Layers 0–2; ClassicalGroups Layers 3/5 highest weights and dimension; CompactGroups invariant products. Numerical Weyl dimensions alone are not treated as an irreducible module. |
| MorseTheory / HeegaardFloer | `TauCetiRoadmap/MorseTheory/README.md:90,124,611,649` M1/M2/M5/M6; HeegaardFloer Lane M supplies Morse homology, distinguished from geodesic finite-vertex construction. |
| SpinGeometry / Yamabe / consumers | `TauCetiRoadmap/SpinGeometry/README.md:136,293,351,769` Clifford/exterior inputs and R7 consumer; `TauCetiRoadmap/Yamabe/README.md:325` Obata; OptimalTransport Layer 7 at 901; PositiveMass §2.3, RicciFlow, CalibratedGeometry, AffineMorseLefschetz and NoncommutativeGeometry are identified as consumers, not proof inputs for the owned targets. |

### Headline inventory

Stated at the pins: constant-sectional/tensor equivalence; Schur; Jacobi existence and uniqueness; no endpoint-zero Jacobi field under nonpositive curvature; Cartan–Hadamard; Myers distance; three simple closed geodesic images; smooth distance duality. These are nine theorems and one enabling definition.

Named as unstatable in the module docstring: Morse index and focal-index theorems (index/multiplicity carriers); Gauss–Codazzi–Ricci and volume variations (immersion connection/B); Bochner vanishing (forms Laplacian/cohomology); Takahashi (scalar Laplacian). The pinned object search supports those missing APIs. The README also develops Rauch/volume comparison, space-form and Synge conclusions, geodesic multiplicity, the paraboloid crossing/pole theorem, scalar Lichnerowicz, spherical spectral identification and harmonic-polynomial decomposition. R05 identifies a concrete further statable omission, and R06 identifies a substituted headline. The docstring should account for the remaining end results individually rather than treating its present list as exhaustive. Einstein-factor constancy also passes a concrete native-carrier probe (R05).

### Adversarial values

The 125 rows below record a computed instance or explicit positive/negative control. Equalities show both sides; implications show hypothesis and conclusion values. These checks cover every section, the sampled projective block, all twelve admissions and all finding targets. Repeated API demands (linearity, restriction, naturality) are tested on the indicated concrete models; they are not claimed proved by testing. Analytic existence/compactness statements are model-tested, not certified from numerical experiments. No arbitrary-source proof route is promoted to a verified theorem merely because its formula passes a check.

| Statement / target | Instances and computed sides | Result / change |
|---|---|---|
| Curvature sign and bivector convention | Unit sphere: `R(e₁,e₂)e₂=e₁`, numerator/denominator `1/1=1`; bivector operator eigenvalue `1`. Flat plane gives `0/1=0`. | Consistent. |
| Mean curvature / shape convention | Outward unit Sᵐ: `B=−gν`, `Sν=−Id`, `tr B=−mν`, average `−ν`. Plane: all four values zero; m=0 trace zero, average deliberately excluded. | Consistent. |
| R1 algebraic symmetries and Bianchi | Constant curvature tensor: cyclic sum for `(e₁,e₂,e₂)` is `e₁−e₁+0=0`; exchanging first slots changes `e₁` to `−e₁`. | Sign fixed. |
| R1 covariant commutator / torsion | Flat coordinates with constant connection matrices `A₁=E₁₂,A₂=E₂₁`: curvature matrix `A₁A₂−A₂A₁=diag(1,−1)`; on e₁ both commutator sides equal e₁. | Noncommuting control, not just flat zero. |
| R1 constant sectional/tensor iff (Lean) | n=2, κ=1: independent orthonormal pair yields 1 on each side. n=0/1: no independent pair, wedge tensor zero, both predicates hold for every κ. | True degenerate behavior; does not determine κ below dimension 2. |
| R1 Ricci/scalar contractions | Unit S³ gives Ric(e,e)=2 and scalar 6, versus `(3−1)1=2` and `3·2·1=6`; n=1 gives 0 and 0. | Sound but already supplied: R04. |
| R1 Schur (Lean) | S³: κ(x)=κ(y)=1. Surface paraboloid has K at r=0 equal 4 and at r=1 equal 4/25; n=2 violates the dimension hypothesis. | Dimension restriction discriminates. |
| R1 Einstein-factor constancy | Unit S³ gives a=2 at every point. Radius-two S³ gives a=1/2; their disjoint union has these unequal factors and fails connectedness. | Missing statable headline, R05. |
| R1 local symmetry and tensor jets | Sphere has ∇R=0; paraboloid has radial `dK/dr=−64r/(1+4r²)³`, hence −64/125 at r=1, not 0. | ∇R condition excludes variable-curvature wrong model. |
| R1 radial parallel frames | Unit sphere transverse coordinate vector has length `sin r/r`, parallel unit field has length 1. At r=π/2 these are `2/π` and 1. | Coordinate and parallel frames distinguished. |
| R1 metric normal-coordinate jet | Transverse metric along te₁: `(sin t/t)²=1−t²/3+O(t⁴)`; first derivative 0, second derivative −2/3. Flat metric gives 1,0,0. | Required negative curvature coefficient agrees. |
| R1 constant/conformal metric scaling | `g̃=4g` on unit sphere: connection unchanged, K=1/4. Flat n=3, u=x at origin: Ric̃=diag(0,−1,−1), scalar −2 from both contractions. n=2, same u: K̃=0. | Both scalar and Ricci signs agree. |
| R1 transport reconstruction | `P(t)=exp(−tA)`, `σ=σ₀+tw`: derivative of `P⁻¹σ` is `w+Aσ₀`; forward transport instead gives `w−Aσ₀`. | Correct inverse convention, duplicated owner R04. |
| R1 bi-invariant connection/curvature | Abelian group: bracket, ∇ and K all 0. SU(2) with `[X,Y]=2Z`: K=`‖2Z‖²/4=1`; `−[[X,Y],Y]/4=X`. | Nonabelian sign tested. |
| R1 submersion tensors | Product projection: A=T=0, base K equals horizontal K. Unit Hopf map: vertical bracket norm 2, base K=`1+3·4/4=4` on a complex line. | O'Neill coefficient passes; citation unverified. |
| Projective horizontal trace metric (sample) | `X=[[0,−1],[1,0]]`: `−Re tr X²/2=1=‖Xe₂‖²`. Vertical `diag(0,i)`: trace metric 1/2 versus orbit norm squared 1. Doubled complex trace uses 1/4 to recover 1. | Horizontal restriction essential and present. |
| Projective sectional curvature (sample) | CP complex plane: `1+3·1²=4`; totally real plane: `1+3·0=1`. HP¹: sum of three squared components=1, hence every plane has K=4. | Correct range and low-rank exception. |
| Projective geodesic periods (sample) | Horizontal `cos(t)z+sin(t)v`: at π gives −z, same projective point; at π/2 gives v, different point. Sphere first return 2π. d=0: no positive-speed geodesic. | Period π is quotient period, not sphere period. |
| Projective Kähler normalization (sample) | CP¹ quotient is radius-1/2 sphere: area `4π/4=π`; supplier FS integral 1, so `ωg=π ωFS`. Also `ωg(u,Ju)=g(Ju,Ju)=1`. | Metric and supplier normalization agree. |
| R2 within Jacobi definition (Lean) | Flat unit-speed line: `J=u+tv` has J″=0, curvature term 0. `J=t²e` has residual 2e; rejected. Empty parameter set has no differential assertions. | Real body excludes arbitrary fields on the theorem intervals. |
| R2 Jacobi existence (Lean) | Flat initial `(u,v)` gives J(t)=u+(t−a)v. Sphere transverse data `(0,e)` gives `sin(t−a)e`; hyperbolic gives `sinh(t−a)e`. Initial derivative in each is e. | Both initial data attained. |
| R2 interval uniqueness (Lean) | Flat difference with zero initial position/derivative is `0+t·0=0`. Changing either datum to e gives e or te. Values outside `[a,b]` are not constrained. | Correct interval conclusion and `a<b`. |
| R2 parallel and tangential Jacobi fields | Along unit-speed γ, `J=(a+bt)γ′` has second derivative 0 and `R(γ′,γ′)γ′=0`. Constant γ also admits affine fields, not only constants. | Includes zero-speed case. |
| R2 Wronskian / differential of exp | For J=sin t, K=cos t, `J′K−JK′=cos²t+sin²t=1`. Sphere transverse dexp factor `sin r/r`, radial factor 1; at π factors 0,1. | Conserved pairing and differential kernel agree. |
| R3 energy/length convention | Speed 2 on unit interval: L=2,E=2, `L²=2TE=4`. Speeds 0 and 2 for half each: L=1,E=1, `1<2`. | Equality requires constant speed. |
| R3 second variation and index form | Unit sphere, transverse `sin(πt/L)`: I=`π²/(2L)−L/2`. L=π/2,π,2π gives `3π/4,0,−3π/4`. Flat case keeps only positive first term. | Curvature sign and minimizing threshold agree. |
| R3 corner/junction term | Flat broken path from 0 through 1 to 0 on two half intervals: velocities 2,−2; moving middle vertex by v gives first derivative `4v`, equal to velocity jump paired with v. | Interior corner term not omitted. |
| R3 conjugate multiplicity/index theorem | Sphere interval length π: interior count 0, endpoint nullity n−1. Length 3π/2: interior count n−1, endpoint nullity 0. | Index excludes right endpoint, nullity includes it. |
| R3 nonpositive-curvature vanishing (Lean) | Flat J with endpoints zero has affine coefficients 0,0. Hyperbolic transverse J=A sinh t+B cosh t has B=0 and A sinh L=0, hence A=0 for L>0. | No division at L=0; excluded by a<b. |
| R3.1 speed topology / H¹ | Unit-speed triangular oscillations of amplitude 1/N have uniform distance to 0 tending to 0 but speed difference from constant curve identically 1. H¹ derivative norm remains 1. | C⁰ alone does not control energy; extra topology required. |
| R3.1 absolutely continuous path API | `γ(t)=t²` on [0,1]: weak derivative 2t; integral derivative 1 equals endpoint difference 1; energy `½∫4t²=2/3`. | Normalization and AC reconstruction agree. |
| R3.2 broken-geodesic energy | Real endpoints 0,1, total time1: straight path E=1/2. Inserting midpoint 1/2 at time1/2 keeps E=1/2; inserting 1 gives E=1. | Refinement and energy decrease discriminate. |
| R3.2 finite-dimensional Hessian | Same real midpoint z: E=`z²+(1−z)²`; critical z=1/2, Hessian=4>0. | Finite model has expected index 0. |
| R3.2 marked CW input | Mark point inside an edge of a circle triangulation: original vertex membership false; subdivision gives two incident edges and vertex membership true. | Refinement is an additional input, R01. |
| R3.3a round-sphere path cells | θ=π/2 on S³: shortest arc length π/2 index0; opposite arc length3π/2 index2. Successive cell dimensions 0,2,4,…; adjacent differential groups zero. | n≥3 lacunarity holds. |
| R3.3b circle path components | Endpoints at 1 and i: lifts have displacement `π/2+2πk`, k∈ℤ. Each component affine-contractible; H₀ free on ℤ and Hⱼ=0 for j>0. | Circle not put into higher-sphere lacunarity. |
| R3.3c Hopf comparison for S² | Hopf fibre circle has π₁=ℤ; connecting map π₂(S²)→π₁(S¹) sends degree-one generator to winding ±1. Thus rank1 in each based-loop homology degree, not even degrees only. | Separate n=2 branch needed and present. |
| R3.4 antipodal Morse–Bott | S² antipodal arcs length π: critical family S¹, index0,nullity1. Length3π: index2,nullity1. `(TS¹)⊕²` is trivial rank2. | Multiplicity and negative-bundle rank agree. |
| R3.4 suspension range / sign | n=3 range q≤2 for isomorphism and q=3 surjection. Meridian map degree `(−1)^(n+1)` gives −1 for n=2 and +1 for n=3; reflection changes −1 to +1. | Orientation correction discriminates. |
| R4 Rauch / Hessian comparison | Normal Jacobi lengths at t>0: sphere sin t, flat t, hyperbolic sinh t. Distance Hessian factors: cot t,1/t,coth t; at t=π/2 sphere value0 versus flat2/π. | Conjugate/cut exclusions necessary. |
| R4 volume comparison | S² ball area `2π(1−cos r)≤πr²`; at r=π/2, `2π<π³/4`. Euclidean area πr² gives equality; cylinder large-radius normalized area tends0. | Equality model distinguished. |
| R4 ray existence | Euclidean `γ(t)=p+te` gives d(γ(s),γ(t))=t−s. Compact circle distances bounded by half circumference, so no such ray for all t. | Noncompactness used. |
| R4 nearest point to closed set | N={0} in ℝ: distance from x=2 attained by length2 segment. N=(0,1), x=2: inf1 not attained; closedness fails. | Closed/proper-ball route discriminates. |
| R4 local-isometry covering criterion | ℝ→unit circle: derivative norm1, domain complete, covering fibre2πℤ. Punctured ℝ→circle remains surjective local isometry but has incomplete domain and no even covering near 1. | Incomplete counterexample correctly retained. |
| R4 pullback metric/completeness | Degree-k circle covering θ↦kθ pulls dθ² back to k²dθ²: domain circumference2πk, lifted arc length equals base traversal length. | Pullback does not preserve arbitrary pre-existing domain metric. |
| R4 universal-cover countability | Circle fibre cardinal ℵ₀, sphere fibre1. Countably many basis sets × countably many sheets remains ℵ₀; compact discrete fibre would instead be finite. | Mathematics consistent; supplier correction R03. |
| Cartan–Hadamard (Lean) | Flat ℝⁿ expₚ(v)=p+v, fibre singleton. Flat cylinder exp has fibres differing by lattice vectors, countably many; still covering. Sphere derivative at π vanishes and K≤0 fails. | Covering form avoids false injectivity. |
| Bonnet–Myers (Lean) | Unit Sⁿ, n≥2: λ=n−1 gives bound `π√1=π`, attained by antipodes. Radius R gives λ=(n−1)/R² and bound πR. n=1 is excluded. | Scaling and dimension correct. |
| R4 injectivity radius / cut locus | Unit sphere inj=π, cut locus antipode; circle circumference L has inj=L/2; Euclidean inj=∞. Squared distance on diagonal is0 and smooth despite distance itself having a cusp. | Correct distinctions. |
| R4 Synge | S² orientable, π₁ trivial. RP² positively curved but not orientable, π₁=C₂. RP³ positively curved and orientable. | Parity/orientation restrictions matter. |
| R4 real projective space | RP⁰ is point; RP¹ has π₁=ℤ; RP² has π₁=C₂. Antipodal degree on S¹ is +1, on S² −1. | Low dimensions not silently identified. |
| R4 hyperbolic models | Upper half-plane metric y⁻²(dx²+dy²): K=−1. Hyperboloid at (1,0,…): tangent time component0, Lorentz restriction Σvᵢ²>0 for v≠0. | Negative ambient form yields positive induced metric. |
| R4 space-form scaling | Sⁿ radius R has K=R⁻²; hyperbolic scaling R²g has K=−R⁻²; flat remains0. | Three signs and scale covered. |
| R4.8 two geodesics | Circle paths θ₁=πt/2, θ₂=−3πt/2 share endpoints 1,i. At t=1/2 their angles differ π. On ℝ only the affine segment exists. | Compact headline missing, R05. |
| R4.9 three simple closed images (Lean) | Round S²: equators in xy,xz,yz planes have period2π and distinct image sets. Twice-traversed equator identifies t=0 and t=π inside [0,2π), so fails injectivity. | Images, not parametrizations, counted. |
| R4.9.0 curve metric / collapsed points | Latitude radius angle r has length2πsin r→0 and diameter2r→0. Reversal has identical image/length; distinct constant points have their positive ambient distance. | Quotient and point stratum discriminated. |
| R4.9.1 component cover | Round latitude r: cap area A=2π(1−cos r), other area4π−A; exchanging twice returns A. At r=0 areas0,4π. | Two sheets persist at point curves. |
| R4.9.2 relative Thom detection | RP² generator has α²≠0 but α³=0 by dimension. In the rank-one Thom space, relative Thom class τ has τ³ evaluating1 on the 3-dimensional relative fundamental class. | Relative construction avoids false absolute α³ claim. |
| R4.9.3 widths | Round S² family of great circles has every length2π; its three relevant widths are2π. A point curve has length0 and cannot realize a positive width. | Equal-width case not discarded. |
| R4.9.4 local geodesic defect | Great-circle arc ℓ<π has `length−distance=0`. Euclidean circular arc radius R has defect `ℓ−2R sin(ℓ/2R)>0` for 0<ℓ<2πR. | Nongeodesic wrong model excluded. |
| R4.9.5 primitive traversal | Annulus essential embedded curve degree ±1; twofold traversal degree2 is not embedded. Round geodesic traversed twice length4π has same image as length2π primitive curve. | Multiplicity and image separated. |
| R4.9.6 disk/annulus Gauss–Bonnet | Unit-sphere cap: ∫k=2πcos r, ∫K=2π(1−cos r), sum2π. Difference of two caps gives annulus total0. | Boundary orientation signs match. |
| R4.9.6 area evolution/extinction | Cap area A has A′=A−2π. At r=π/3, A=π,A′=−π and extinction time log2. Hemisphere A=2π has A′=0. | No uniform extinction for hemisphere. |
| R4.9.6 chord profile / length evolution | Round latitude: chord/profile ratio1; L=2πsin r, ambient curvature1/sin r. `−∫κₑ²+L=−2πcos²r/sin r=L′`. | Ambient/geodesic curvature distinction correct. |
| R4.9.6 isoperimetric bounds | Cap satisfies `L²=A(4π−A)`; A→0 gives L²/A→4π. Hemisphere gives L²=4π² and A(4π−A)=4π². | Small-area and global constants agree. |
| R4.9.6 round barriers/shrinkers | Radius-angle a cap lifetime `−log cos a`; a=π/3 gives log2. Euclidean shrinking circle with radius√(2(T−t)) has rescaled radius1 and areaπ. | Finite-time scale fixed. |
| R4.9.6a Poisson regularization | Circle Fourier mode e^{ikθ} is multiplied by r^{\|k\|}; constant mode remains1. Unit-circle trace length2π, regularized circle length2πr→2π. | No erroneous constant-mode normalization. |
| R4.9.6a strip projection | Round strip with latitude u and longitude s: cos d=cos u cos s. For nonzero u and small s, cos d<cos s, so d>\|s\|. | Projection shortens within stated local range. |
| R4.9.6a fixed-endpoint heat/Jacobi gap | Interval length d: `sin(πs/d)` eigenvalue `−π²/d²`; sphere graph linearization adds1. Gap `π²/d²−1>0` precisely d<π. | Nonconjugacy not replaceable by weak d≤π. |
| R4.9.6a endpoint flatness | Same sine mode: value and second derivative vanish at endpoints, first derivative is ±π/d, not0. | Conditions do not demand incorrect first-derivative vanishing. |
| R4.9.6a endpoint Hessian of distance | Sphere segment d: equal transverse endpoint speeds1 give Hessian `−2tan(d/2)`; moving only one endpoint gives cot d. Flat limits are0 and1/d respectively. | Endpoint coupling sign tested. |
| R4.9.6b zero number / Harnack | `w=e^(−t)sin x` on circle has2 simple zeros; positive constant has0. Identically zero is separate. Positive constant Harnack ratio1; sign-changing sine cannot satisfy positivity. | Degenerate branch and hypothesis explicit. |
| R4.9.6b local graph PDE | Flat constant graph: k=0, u_t=0. Round constant latitude: G=cos u, Q=cos u sin u, u_t=tan u, geodesic k=tan u. | Graph and geometric conventions agree. |
| R4.9.6b curvature-energy identities | Euclidean circle radius R: E₀=2π/R, E₁=0, E₀′=2π/R³; ∫k⁴=2π/R³. | Evolution identity has correct sign/power. |
| R4.9.6b Gaussian density / blowup controls | Static line Gaussian density1. Shrinking circle density√(2π/e)>1. Grim-reaper distant ends remain widthπ while connecting arc length→∞, so chord/arc ratio→0. | Nonflat and eternal models distinguished. |
| R4.9.6b absolute-curvature zero loss | Curvature profile sin s has two simple zeros with derivative magnitudes1,1. Zero-loss contribution `−2(1+1)=−4`; ignoring zeros would give0. | Nonsmooth absolute-value term retained. |
| R4.9.6b immortal equator stability | Round graph linearization ∂²_s+1 has Fourier rates1,0,−3 for modes0,1,2. Fixed hemisphere area excludes mode0; rotations account for mode1. | Stable decay is not asserted for all modes. |
| R4.9.6c current metric / speed | Weights sum `Σⱼ≥1 4^(−j)=1/3`. With weighted test-form bound B, Cauchy–Schwarz gives coefficient√(B/3), not√B times an infinite sum. Reversal negates the current. | Summability and orientation fixed. |
| R4.9.6c exit cost | For lower gradient norm m and distance r₀/(2C), integrated cost bound `m r₀/(2C)>0`; m=0 gives0 and cannot imply an exit-energy gap. | Positive-gradient band required. |
| R4.9.6d stopping clocks | Two local times2,6, weights3/4,1/4 yield clock3, ≥minimum2 but <maximum6. Point curves with zero cutoff have clock0. | Only a minimum bound is justified. |
| R4.9.6e cubical restriction | Boundary of oriented square: four edges with alternating incidences; applying boundary again gives each vertex coefficients +1−1=0. Reversing a parameter orientation reverses current sign. | Chain/restriction sign control. |
| R4.9.7 cap localization | For generator z, pairing α(z)=1; avoiding a point trivializes the two-sheet choice so pairing becomes0. A finite union of smooth curve images has area0 versus sphere area>0. | Final localization contradiction distinguishes finite image sets. |
| R5a Gauss/Weingarten equations | Unit sphere: B=−gν,S=−Id; Gauss for orthonormal e₁,e₂ gives `0+1·1−0=1`. Plane gives0. | Normal sign cancels correctly in Gauss. |
| R5a Codazzi/Ricci normal equations | Round sphere ∇B=0, mixed ambient curvature0, both Codazzi sides0. Codimension-one normal curvature0 and commuting scalar shape operators have commutator0. | Elementary consistency; does not certify higher-codimension proof. |
| R5a normal quotient adapter | Line tangent span e₁ in ℝ²: class of `(a,b)` maps to `(0,b)` and back to same class; using `(a,0)` gives zero class. | Orthogonal quotient comparison discriminates; R01. |
| R5a.1 relative volume density | Radial sphere variation `(1+t)F`: J=(1+t)^m, J′(0)=m, J″(0)=m(m−1). Outside fixed variation support, J−1=0, even if total volume is infinite. | Relative integral avoids ∞−∞. |
| R5a.2 first variation | Outward sphere V=ν,H=−ν: `−m⟨H,V⟩=m`, matching derivative of `(1+t)^m`. Tangential compact-support variation integrates divergence to0. | Averaged H factor m correct. |
| R5a cones / minimality | Equatorial Sᵏ⊂Sⁿ has spherical H=0; its Euclidean cone is a linear (k+1)-plane with H=0 away from vertex. Latitude has nonzero H and its cone is not flat/minimal. | Vertex excluded from smooth cone statement. |
| R5a explicit immersion examples | Unit stereographic sphere at origin: metric4I, first metric derivatives0, K=1. Helicoid a=1,v=0: H=0,K=−1. | Positive and negative curvature examples distinguish B. |
| R5a paraboloid B/K/H | z=r²: at r=0 K=4,H=2ν; at r=1 K=4/25,H=6/(5√5)ν. Principal curvatures `2/(1+4r²)^(3/2)` and `2/√(1+4r²)`. | Signs and average agree with upward normal. |
| R5a revolution/Clairaut | Cylinder radius R: conserved momentum a=R²θ′. Unit parallel has θ′=1/R, hence a=R; meridian θ′=0 gives a=0. | Angular momentum not confused with angular speed. |
| R5a.3 full radial equation | a=1, turning r=1,r′=0: radial equation gives r″=1/5. Spurious `r=1,θ=t` satisfies momentum/speed but radial residual is −1. | Third equation excludes waiting-circle wrong model. |
| Paraboloid integrand definitions | a=1,s=1: totalized denominators0 so both Lean integrands0 there. For s>1 substitution `s=√(1+u²)` makes time integrand ds=`√(5+4u²)du` and angle=`√(5+4u²)/(1+u²)du`. | Endpoint value harmless, improper singularity integrable. |
| Paraboloid integral estimates (Lean) | R=a=1: both integrals0, lower bounds0. R=2: time≥R²−a²=3 and angle≥2log2; positive transformed integrands give strict positivity. | Boundary and positive-radius inequalities agree. |
| Paraboloid monotonicity/limits (Lean) | For a=1, time bound R²−1→∞, angle bound2log R→∞; positive integrands on every interval above1 give strict increase. At R=1 integrals0. | Both limits and closed-endpoint continuity consistent. |
| Paraboloid point/crossings (Lean) | At symmetric times around turn: r₊=r₋=R, angles θ₀±A. Equality occurs when A=πk; angular derivatives a/R² both positive, radial derivatives ±v, determinant `2av/R²≠0`. | Transverse crossings; coordinate-only scope R06. |
| R5a vertex pole / radial Jacobi | With arclength ℓ, r′=(1+4r²)^−1/2 and r″=−4r/(1+4r²)². Since K=4/(1+4r²)², `r″+Kr=0`. r>0 for ℓ>0; round K=4 comparator sin(2ℓ)/2 vanishes at π/2. | Positive curvature alone does not force vertex conjugacy. |
| R5b minimal second variation | Great circle in S², constant normal speed1: Q=−length=−2π. Flat plane, compact-support φ: Q=∫\|∇φ\|²≥0. | Potential and stability signs differ correctly. |
| R5b hypersurface scalar rewrite | Equator in unit S²: scalar ambient2, intrinsic0,A=0, Ric(ν,ν)=1; scalar rewrite gives potential `(2−0+0)/2=1`. | Half-factor correct. |
| R5b one-sided normal sections | On orienting double cover, normal section coefficient satisfies φ(deck x)=−φ(x); nonzero constant fails because c≠−c. | Does not test one-sided stability on inadmissible constants. |
| R5b Dirichlet operator domain/spectrum | Flat interval (0,l): eigenfunctions sin(kπx/l), eigenvalues k²π²/l². Constant function has nonzero trace and is outside H¹₀. | Boundary-domain statement adds content beyond interior ellipticity. |
| Analytic supplier order | Form a(u,v)=2uv on ℝ: represented operator2Id, coercive solution h/2, energy norm√2\|u\|. Energy-space specialization consumes these generic facts. | Reversed input arrow, R02. |
| R6 focal exponential/nullity | Unit circle inward normal at distance t: tangential derivative factor1−t, Hessian of squared distance2(1−t). t=1/2,1,2 yields Hessian1,0,−2. | Nullity1 precisely at t=1. |
| R6 focal index count / locator | Same three distances: interior focal counts0,0,1; index/nullity `(0,0),(0,1),(1,0)`. Endpoint focality affects nullity, not index. | Correct formula; wrong index locator R08. |
| R6 moving-boundary index form | Flat normal ray from inward-curved circle: linear test field gives I=`1/b−1`; b=1/2,1,2 gives1,0,−1/2. | Shape boundary term sign agrees with focal crossing. |
| R6 proper Morse exhaustion/genericity | Proper line embedding, centre0: h(x)=x², sublevel [−√c,√c] compact. Unit circle centre0: h≡1, Hessian0, exceptional centre. Open interval embedding has noncompact escaping sublevels. | Properness and generic-centre restrictions discriminate. |
| R7 scalar Bochner | Flat line f=x²: `Δ⁺\|df\|²=−8`, `2\|Hess f\|²=8`, Ric=0 and `dΔ⁺f=0`; both sides sum0. Linear f gives all terms0. | Positive-Laplacian convention consistent. |
| R7 Lichnerowicz first eigenvalue | Unit Sⁿ coordinate function: λ₁=n, Ric=(n−1)g, lower bound n attained; Hess f=−fg. n=1 Ric lower bound supplies no positive constant. | Equality and dimension restriction discriminate. |
| R7 formal adjoints/principal symbols | On ℝ compact support: integration by parts gives `(∂)†=−∂`, so ∇†∇=−∂². Fourier mode e^{iξx} has eigenvalue ξ²≥0. | Rough/Hodge sign matches scalar convention. |
| R7 Clifford/Dirac square | Euclidean unit covector: `c(e)²=−Id`; symbol of D² on frequency ξ is \|ξ\|²Id. Replacing skew Clifford sign by +Id would produce wrong sign. | Supplier convention checked. |
| R7 exterior Weitzenböck count | On e₁∧e₂, `Σ eᵢ∧ιᵢ` gives2 times the form; increasing-pair count is1. Sphere curvature potential on p-forms is p(n−p)κ. | Ordered pairs require conversion factor. |
| R7 section-norm identity | Parallel section on flat torus: norm constant, ∇s=0, potential0, all terms0. Flat scalar s=x² reproduces Bochner values −8 and +8. | Consistent for variable and parallel sections. |
| R7 positive/nonnegative vanishing | Flat n-torus: potential0, harmonic p-forms parallel, dimension binomial(n,p). Sⁿ p=1,n>1: potential n−1>0, b₁=0. | Nonnegative does not imply vanishing. |
| R7 Ricci/Rop bound | Constant curvature κ: λ=(n−1)κ, Λ=κ, lower potential `pλ−p(p−1)Λ=p(n−p)κ`, equality. n=2,p=2 gives0, not positive. | Correct endpoint-degree behavior. |
| R7.8 Lipschitz extension input | On A={0,2}, f(0)=0,f(2)=2, K=1: extension at1 can be1, distances to endpoints1,1. | Already supplied by Mathlib, R04. |
| R7.8 quantitative smoothing | Flat f(x)=\|x\|, smooth `√(x²+ε²)`: error≤ε, derivative absolute value≤1. A bounded truncation can then be smoothed with the stated arbitrarily small Lipschitz excess. | Supports positive approximation tolerance; no claim of exact smoothing at a corner. |
| Smooth distance duality (Lean) | On (0,1), f(t)=t is bounded smooth, derivative1, so difference equals distance. On ℝ, bounded smooth cutoffs equal t near chosen x,y and yield supremum \|x−y\|. One-point manifold: admissible differences set {0}, sSup0=0. | Completeness unnecessary; boundedness does not force constant functions. |
| R7.8 Dirac commutator norm | Euclidean f=x: Clifford multiplication by df has norm1=\|df\|. Constant f gives commutator0. Zero-rank bundle would give0 for nonzero df, and is excluded where norm equality is used. | Nonzero fibre condition matters. |
| R8 harmonic-polynomial decomposition | n variables: Δ(r²)=2n; Δ(r²x₁)=2(n+2)x₁. For n=3 values6 and10x₁, so the trace piece is not harmonic. Degree0 trace summand absent, not a negative degree. | Fischer split distinguishes wrong trace component. |
| R8 spherical eigenvalues/dimensions | S² degree0: λ0,N1; degree1: λ2,N3; degree2: λ6,N5. S¹ degree d≥1: λ=d²,N2. | Low degrees and rank-two representation handled. |
| R8 spectral completeness | Constant sphere function lies in λ0 eigenspace; coordinate functions have integral0 and λ=n. Orthogonality of constant and coordinate integral0. | Constants must not be omitted from full spectral expansion. |
| R8 highest-weight sign | Action by precomposition with R(−θ) sends `(x−iy)^d` to `e^(idθ)(x−iy)^d`; d=1 weight+1. SO(2) complex harmonic space has weights+d and−d, hence is not irreducible for d>0. | Action convention and low-rank branch consistent. |
| R8 full eigenspace addition formulas | S² degree1 orthonormal basis: Σfᵢ²=3/(4π), Σdfᵢ²=(3/(4π))g. Multiplying by√(4π/3) gives position map, norm1, pullback metric g. | Full basis, not arbitrary eigenfunction list. |
| R8 Takahashi scaling | S² degree2: λ6,m2, unit-sphere map metric3g; scaling radius√(m/λ)=1/√3 restores g. Degree0 λ0 is excluded from positive-radius immersion formula. | No division by zero. |
| R8 five-coordinate Veronese | Standard normalized quadratic map at e₁ has norm1; derivative on e₂ has norm√3; F(−e₁)=F(e₁). Thus metric3g, antipodal factorization, not sphere embedding. | Explicit example matches general degree2 scale. |

### Source checks

All sixteen reference works were attempted through the sources service; no source manifest was edited. Ten legal texts were obtained, with the following limits on what was certified:

- `milnor1963 line 1600` identifies focality/nullity (Lemma 6.5); `milnor1963 line 1677` gives the nondegenerate index count (Lemma 6.9, printed pp. 37–38). The CIMAT institutional copy supports R08's locator correction.
- `azagra2006 line 89` (Theorem 1, p. 2) permits a positive continuous error function and arbitrarily small positive Lipschitz excess on a separable Riemannian manifold. Second countability supplies separability in R7.8; bounded error preserves boundedness of a bounded input.
- `allen2015 line 70` (Theorem 1, p. 2) restricts to the three constant-curvature surfaces, a convex region bounded by two geodesics, distinct endpoints, and curvature flat to all orders there. Nonconjugacy is required for the stated limiting-geodesic conclusion. R4.9 retains these restrictions rather than borrowing an arbitrary-metric theorem from it.
- `lauer2016 line 25` (Theorem 1.1, p. 1) provides the round-sphere initial trace; zero-area Jordan curves have uniqueness up to reparametrization. Rectifiable curves have zero area. This does not itself supply the README's parameter-family length upgrades.
- `dobbins2021 line 193` locates Lemma 2.2's pre-extinction dependence; the README explicitly owns stronger length/parabolic upgrades. `tothziller line 69` identifies the full harmonic-basis spherical immersion; the scale was independently computed above.
- Homma, Gage and Ma were obtained from arXiv/Numdam and inspected for the stated curvature-action and curve-flow settings. This review does not certify every internal step of the long R4.9 analytic proof route from those papers. White's publisher PDF was obtained, but its extracted text has font-encoding corruption; its precise local-regularity constants were not certified.

## Not verifiable

- **Seeded Projective metric examples:** `oneill1966`, Theorem 2 and Corollary 1, article pp. 459–469. The DOI landing page and three Project Euclid PDF/download endpoints were tried through the service. The returned endpoint text is an access-error page, not the article. The theorem numbers, exact printed page and source hypotheses therefore remain uncertified. The independent trace, curvature, period and Kähler computations above do not certify this locator.
- **Other unavailable references:** `lee2018` (book-title search, no legal text resolved); `wangnotes` (the README's xumin.net URL failed DNS resolution); `taimanov1993` (DOI/MathNet landing page yielded no PDF); `grayson1989` (JSTOR landing page, no accessible licensed text); `angenent1988` (publisher landing and institutional endpoint, unavailable). The single missing-reference ledger preserves these attempts. Milnor, Toth–Ziller and White were subsequently obtained and are not left as missing requests. The Milnor title search initially resolved a review article rather than the book; the institutional book copy replaces that false match.
- No README locator is explicitly labelled unverified. Broad references without claim-level locators remain R07/R09. This is a completed review with a needs-changes verdict; source-access limitations have not been treated as proof that a mathematical statement is false.

## Source issues

- none
